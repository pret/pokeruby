// Copyright(c) 2016 YamaArashi
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#include <stdio.h>
#include <stdarg.h>
#include <string.h>

#include "preproc.h"
#include "asm_file.h"
#include "char_util.h"
#include "utf8.h"
#include "string_parser.h"

struct AsmFile
{
    char *buffer;
    long pos;
    long size;
    long lineNum;
    long lineStart;
    const char *filename;
};
static bool ConsumeComma(AsmFile *const restrict m);
static int ReadPadLength(AsmFile *const restrict m);
static void RemoveComments(AsmFile *const restrict m);
static bool CheckForDirective(AsmFile *const restrict m, const char *const restrict name, size_t length);
static inline void SkipWhitespace(AsmFile *const restrict m);
static void ExpectEmptyRestOfLine(AsmFile *const restrict m);
static void ReportDiagnostic(AsmFile *const restrict m, const char *const restrict type, const char *const restrict format, va_list args);
__attribute__((__format__(printf, 2, 3))) no_return static void RaiseError(AsmFile *const restrict m, const char *const restrict format, ...);
__attribute__((__format__(printf, 2, 3))) static void RaiseWarning(AsmFile *const restrict m, const char *const restrict format, ...);

// Skips tabs and spaces.
static inline void SkipWhitespace(AsmFile *const restrict m)
{
    while (m->buffer[m->pos] == '\t' || m->buffer[m->pos] == ' ')
        m->pos++;
   // m->pos += strspn(&m->buffer[m->pos], "\t ");
}

AsmFile *AsmFile_New(const char *restrict filename)
{
    AsmFile *m = (AsmFile *)malloc(sizeof(AsmFile));

    FILE *fp;
    size_t count;
    char tmp[4096];
    size_t capacity;


    if (!filename || !strcmp(filename, "-"))
    {
        m->filename = "<stdin>";
        fp = stdin;
    }
    else
    {
        m->filename = filename;
        fp = fopen(m->filename, "rb");
    }

    if (unlikely(fp == NULL))
        FATAL_ERROR("Failed to open \"%s\" for reading.\n", m->filename);

    m->size = 0;
    capacity = 4096;
    m->buffer = (char *)malloc(4097);
    while ((count = fread(tmp, 1, 4096, fp)) != 0)
    {
        if (unlikely(ferror(fp)))
            FATAL_ERROR("Failed to read \"%s\".\n", m->filename);
       
        m->buffer = (char *)realloc(m->buffer, m->size + count + 1);

        memcpy(m->buffer + m->size, tmp, count);
        m->size += count;

        if (feof(fp))
            break;
    }
    if (m->size == 0)
        RaiseWarning(m, "Empty input!");

    m->buffer[m->size] = '\0';

    if (fp != stdin)
        fclose(fp);
    m->pos = 0;
    m->lineNum = 1;
    m->lineStart = 0;

    RemoveComments(m);

    return m;
}

void AsmFile_Delete(AsmFile *m)
{
    free(m->buffer);
    free(m);
}

// Removes comments to simplify further processing.
// It stops upon encountering a null character,
// which may or may not be the end of file marker.
// If it's not, the error will be caught later.
static void RemoveComments(AsmFile *const restrict m)
{
    long pos = 0;

    if (m->buffer == NULL)
    {
        RaiseError(m, "buffer is null. wat");
    }

    for (;;)
    {
        char *str;

        if (m->buffer[pos] == '\0')
            return;

        // Find the characters we are interested in, which are @, /, ", and '.
        str = strpbrk(&m->buffer[pos], "@/\"'");
        // The first strpbrk may return the start. We don't want that.
        if (str == m->buffer && str[0] != '@' && str[0] != '/' && str[0] != '\'' && str[0] != '"')
        {
            ++pos;
            str = strpbrk(&m->buffer[pos], "@/\"'");
        }

        // No more matches.
        if (str == NULL)
            return;

        // Line comment
        if (str[0] == '@' && (str == m->buffer || str[-1] != '\\'))
        {
            char *end = strchr(str + 1, '\n');
            if (end == NULL)
                end = &m->buffer[m->size - 1];

            memset(str, ' ', end - str);
            pos = end - m->buffer;
        }
        else if (str[0] == '/' && str[1] == '*')
        {
            *str++ = ' ';
            *str++ = ' ';
            for (;;)
            {
                char *end = strpbrk(str, "*\n");

                if (unlikely(end == NULL))
                    RaiseError(m, "unterminated block comment");

                // End of a comment */
                if (end[0] == '*' && end[1] == '/')
                {
                    memset(str, ' ', end - str + 2);
                    pos = end - m->buffer + 2;
                    break;
                }
                // Newline
                else if (end[0] == '\n')
                {
                    memset(str, ' ', end - str);
                    str = end + 1;
                }
                // asterisk
                else
                {
                    memset(str, ' ', end - str + 1);
                    str = end + 1;
				}
            }
        }
        else if (str[0] == '"' || str[0] == '\'')
        {
            char *end = strchr(str + 1, str[0]);
            if (unlikely(end == NULL))
                RaiseError(m, "unterminated quote");
            pos = end - m->buffer + 1;
		}
        else
        {
            pos++;
        }
    }
}

// Checks if we're at a particular directive and if so, consumes it.
// Returns whether the directive was found.
static bool CheckForDirective(AsmFile *const restrict m, const char *name, size_t length)
{
    if (m->pos + length >= m->size)
        return false;

    if (strncmp(m->buffer + m->pos, name, length) != 0)
        return false;

    m->pos += length;

    return true;
}

static const char dir_include[] = ".include";
static const char dir_string[] = ".string";
static const char dir_braille[] = ".braille";

// Checks if we're at a known directive and if so, consumes it.
// Returns which directive was found.
Directive AsmFile_GetDirective(AsmFile *const restrict m)
{
    SkipWhitespace(m);

    if (CheckForDirective(m, dir_include, sizeof(dir_include) - 1))
        return Directive_Include;
    else if (CheckForDirective(m, dir_string, sizeof(dir_string) - 1))
        return Directive_String;
    else if (CheckForDirective(m, dir_braille, sizeof(dir_braille) - 1))
        return Directive_Braille;
    else
        return Directive_Unknown;
}

// Checks if we're at label that ends with '::'.
// Returns the name if so and an empty string if not.
char *AsmFile_GetGlobalLabel(AsmFile *const restrict m)
{
    int pos = m->pos;
    int start = pos;
    char *str;

    /*if (IsIdentifierStartingChar(m->buffer[pos]))
    {
        pos++;

        while (IsIdentifierChar(m->buffer[pos]))
            pos++;
    }*/
    pos += SkipIdentifier(&m->buffer[pos]);

    if (m->buffer[pos] == ':' && m->buffer[pos + 1] == ':')
    {
        m->pos = pos + 2;
        ExpectEmptyRestOfLine(m);

        str = (char *)malloc(pos - start + 1);
        memcpy(str, &m->buffer[start], pos - start);
        str[pos - start] = '\0';
    }
    else
    {
        str = NULL;
    }

    return str;
}


// Reads include path.
char *AsmFile_ReadPath(AsmFile *const restrict m)
{
    int length = 0;
    long startPos;
    char *ret;

    SkipWhitespace(m);

    if (unlikely(m->buffer[m->pos] != '"'))
        RaiseError(m, "expected file path");

    m->pos++;

    startPos = m->pos;

    while (m->buffer[m->pos] != '"')
    {
        unsigned char c = m->buffer[m->pos++];

        if (unlikely(c == 0))
        {
            if (m->pos >= m->size)
                RaiseError(m, "unexpected EOF in include string");
            else
                RaiseError(m, "unexpected null character in include string");
        }
        else if (unlikely(!IsAsciiPrintable(c)))
            RaiseError(m, "unexpected character '\\x%02X' in include string", c);

        // Don't bother allowing any escape sequences.
        else if (unlikely(c == '\\'))
        {
            c = m->buffer[m->pos];
            RaiseError(m, "unexpected escape '\\%c' in include string", c);
        }

        length++;

        if (unlikely(length > kMaxPath))
            RaiseError(m, "path is too long");
    }

    m->pos++;  // Go past the right quote.

    ExpectEmptyRestOfLine(m);

    ret = malloc(length + 1);
    memcpy(ret, &m->buffer[startPos], length);
    ret[length] = '\0';
    return ret;
}

// Reads a charmap string.
int AsmFile_ReadString(AsmFile *const restrict m, unsigned char *const restrict s)
{
    int length;
    StringParser *sp;

    SkipWhitespace(m);

    sp = StringParser_New(m->buffer, m->size);

    m->pos += StringParser_ParseString(sp, m->pos, s, &length);

    StringParser_Delete(sp);

    SkipWhitespace(m);

    if (ConsumeComma(m))
    {
        int padLength;

        SkipWhitespace(m);
        padLength = ReadPadLength(m);

        while (length < padLength)
        {
            s[length++] = 0;
        }
    }

    ExpectEmptyRestOfLine(m);

    return length;
}

typedef struct map_char_uchar
{
    char key;
    unsigned char value;
} map_char_uchar;

static const map_char_uchar braille_encoding[] = {
    { 'A', 0x01 }, { 'B', 0x05 }, { 'C', 0x03 }, { 'D', 0x0B }, { 'E', 0x09 }, { 'F', 0x07 },
    { 'G', 0x0F }, { 'H', 0x0D }, { 'I', 0x06 }, { 'J', 0x0E }, { 'K', 0x11 }, { 'L', 0x15 },
    { 'M', 0x13 }, { 'N', 0x1B }, { 'O', 0x19 }, { 'P', 0x17 }, { 'Q', 0x1F }, { 'R', 0x1D },
    { 'S', 0x16 }, { 'T', 0x1E }, { 'U', 0x31 }, { 'V', 0x35 }, { 'W', 0x2E }, { 'X', 0x33 },
    { 'Y', 0x3B }, { 'Z', 0x39 }, { ' ', 0x00 }, { ',', 0x04 }, { '.', 0x2C }, { '$', 0xFF },
};

static const unsigned braille_encoding_size = sizeof(braille_encoding) / sizeof(map_char_uchar);

int AsmFile_ReadBraille(AsmFile *const restrict m, unsigned char *const restrict s)
{
    int length = 0;

    SkipWhitespace(m);

    if (unlikely(m->buffer[m->pos] != '"'))
        RaiseError(m, "expected braille string literal");

    m->pos++;

    while (m->buffer[m->pos] != '"')
    {
        if (unlikely(length == kMaxStringLength))
            RaiseError(m, "mapped string longer than %d bytes", kMaxStringLength);

        if (m->buffer[m->pos] == '\\' && m->buffer[m->pos + 1] == 'n')
        {
            s[length++] = 0xFE;
            m->pos += 2;
        }
        else
        {
            char c = m->buffer[m->pos];
            int index = -1;

            // First members of braille_encoding are index + 'A'
            if (c >= 'A' && c <= 'Z')
            {
                index = c - 'A';
            }
            else
            {
                unsigned i;
                for (i = 'Z' - 'A'; i < braille_encoding_size; ++i)
                {
                    if (braille_encoding[i].key == c)
                    {
                        index = i;
                        break;
                    }
                }
            }

            if (unlikely(index == -1))
            {
                if (IsAsciiPrintable(c))
                    RaiseError(m, "character '%c' not valid in braille string", m->buffer[m->pos]);
                else
                    RaiseError(m, "character '\\x%02X' not valid in braille string",
                               m->buffer[m->pos]);
            }

            s[length++] = braille_encoding[index].value;
            m->pos++;
        }
    }

    m->pos++;  // Go past the right quote.

    ExpectEmptyRestOfLine(m);

    return length;
}

// If we're at a comma, consumes it.
// Returns whether a comma was found.
static bool ConsumeComma(AsmFile *const restrict m)
{
    if (m->buffer[m->pos] == ',')
    {
        m->pos++;
        return true;
    }

    return false;
}

// Converts digit character to numerical value.
static int ConvertDigit(uint8_t c, int radix)
{
    int digit;

    if (c >= '0' && c <= '9')
        digit = c - '0';
    else if (c >= 'A' && c <= 'F')
        digit = 10 + c - 'A';
    else if (c >= 'a' && c <= 'f')
        digit = 10 + c - 'a';
    else
        return -1;

    return (digit < radix) ? digit : -1;
}

// Reads an integer. If the integer is greater than maxValue, it returns -1.
static int ReadPadLength(AsmFile *const restrict m)
{
    int radix = 10;
    int digit;
    int n = 0;

    if (unlikely(!IsAsciiDigit(m->buffer[m->pos])))
        RaiseError(m, "expected integer");

    if (m->buffer[m->pos] == '0' && m->buffer[m->pos + 1] == 'x')
    {
        radix = 16;
        m->pos += 2;
    }

    while ((digit = ConvertDigit(m->buffer[m->pos], radix)) != -1)
    {
        n = n * radix + digit;

        if (unlikely(n > kMaxStringLength))
            RaiseError(m, "pad length greater than maximum length (%d)", kMaxStringLength);

        m->pos++;
    }

    return n;
}

// Outputs the current line and moves to the next one.
void AsmFile_OutputLine(AsmFile *const restrict m)
{
    while (m->buffer[m->pos] != '\n' && m->buffer[m->pos] != 0)
        m->pos++;

    if (unlikely(m->buffer[m->pos] == 0))
    {
        if (m->pos >= m->size)
        {
            RaiseWarning(m, "file doesn't end with newline");
            fprintf(g_file, "%s\n", &m->buffer[m->lineStart]);
        }
        else
        {
            RaiseError(m, "unexpected null character");
        }
    }
    else
    {
        m->buffer[m->pos] = 0;
        puts(&m->buffer[m->lineStart]);
        m->buffer[m->pos] = '\n';
        m->pos++;
        m->lineStart = m->pos;
        m->lineNum++;
    }
}

// Asserts that the rest of the line is empty and moves to the next one.
static void ExpectEmptyRestOfLine(AsmFile *const restrict m)
{
    SkipWhitespace(m);

    if (likely(m->buffer[m->pos] == '\n'))
    {
        m->pos++;
        m->lineStart = m->pos;
        m->lineNum++;
    }
    else if (unlikely(m->buffer[m->pos] == 0))
    {
        if (m->pos >= m->size)
            RaiseWarning(m, "file doesn't end with newline");
        else
            RaiseError(m, "unexpected null character");
    }
    else if (unlikely(m->buffer[m->pos] == '\r'))
    {
        RaiseError(m, "only Unix-style LF newlines are supported");
    }
    else
    {
        RaiseError(m, "junk at end of line");
    }
}

// Checks if we're at the end of the file.
bool AsmFile_IsAtEnd(const AsmFile *const restrict m) { return (m->pos >= m->size); }

// Output the current location to set gas's logical file and line numbers.
void AsmFile_OutputLocation(const AsmFile *const restrict m)
{
    if (g_lines)
        fprintf(g_file, "# %ld \"%s\"\n", m->lineNum, m->filename);
}

// Reports a diagnostic message.
static void ReportDiagnostic(AsmFile *const restrict m, const char *const restrict type, const char *const restrict format, va_list args)
{
    const int bufferSize = 1024;
    char buffer[bufferSize];
    vsnprintf(buffer, bufferSize, format, args);
    fprintf(stderr, "AsmFile: %s:%ld: %s: %s\n", m->filename, m->lineNum, type, buffer);
}

#define DO_REPORT(m, type)                                                                         \
    do                                                                                             \
    {                                                                                              \
        va_list args;                                                                              \
        va_start(args, format);                                                                    \
        ReportDiagnostic(m, type, format, args);                                                   \
        va_end(args);                                                                              \
    } while (0)

// Reports an error diagnostic and terminates the program.
no_return static void RaiseError(AsmFile *const restrict m, const char *const restrict format, ...)
{
    DO_REPORT(m, "error");
    exit(1);
}

// Reports a warning diagnostic.
static inline void RaiseWarning(AsmFile *const restrict m, const char *const restrict format, ...) { DO_REPORT(m, "warning"); }
