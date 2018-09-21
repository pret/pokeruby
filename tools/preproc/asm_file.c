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
    string *filename;
};

static bool ConsumeComma(AsmFile *cr m);
static int ReadPadLength(AsmFile *cr m);
static void RemoveComments(AsmFile *cr m);
static bool CheckForDirective(AsmFile *cr m, const string *cr name);
static void SkipWhitespace(AsmFile *cr m);
static void ExpectEmptyRestOfLine(AsmFile *cr m);
static void ReportDiagnostic(AsmFile *cr m, const char *cr type, const char *cr format, va_list args);
noreturn static void RaiseError(AsmFile *cr m, const char *cr format, ...);
static void RaiseWarning(AsmFile *cr m, const char *cr format, ...);

AsmFile *AsmFile_New(string *r filename, string *r data)
{
    AsmFile *m = (AsmFile *)malloc(sizeof(AsmFile));
    m->filename = filename;

    if (data != NULL)
    {
        m->size = data->length + 1;
        m->buffer = data->c_str;
    }
    else
    {
        FILE *fp;
        if (!filename || string_equal(filename, string_literal("-")))
        {
            m->filename = filename = string_literal("<stdin>");
            fp = stdin;
        }
        else
        {
            fp = fopen(filename->c_str, "rb");
        }

        if (unlikely(fp == NULL))
            FATAL_ERROR("Failed to open \"%s\" for reading.\n", filename->c_str);

        m->size = 0;
        m->buffer = (char *)malloc(1);
        size_t count;
        char tmp[1024];
        while ((count = fread(tmp, 1, 1024, fp)) != 0)
        {
            if (unlikely(ferror(fp)))
                FATAL_ERROR("Failed to read \"%s\".\n", filename->c_str);

            m->buffer = (char *)realloc(m->buffer, m->size + count + 1);

            memcpy(m->buffer + m->size, tmp, count);
            m->size += count;

            if (feof(fp))
                break;
        }
        if (m->size == 0)
            RaiseWarning(m, "Empty input!");

        m->buffer[m->size] = 0;

        if (fp != stdin)
            fclose(fp);
    }
    m->pos = 0;
    m->lineNum = 1;
    m->lineStart = 0;

    RemoveComments(m);

    return m;
}

void AsmFile_Delete(AsmFile *m)
{
    free(m->buffer);
    string_Delete(m->filename);
    free(m);
}

// Removes comments to simplify further processing.
// It stops upon encountering a null character,
// which may or may not be the end of file marker.
// If it's not, the error will be caught later.
static void RemoveComments(AsmFile *cr m)
{
    long pos = 0;
    char stringChar = 0;

    for (;;)
    {
        if (m->buffer[pos] == 0)
            return;

        if (stringChar != 0)
        {
            if (m->buffer[pos] == '\\' && m->buffer[pos + 1] == stringChar)
            {
                pos += 2;
            }
            else
            {
                if (m->buffer[pos] == stringChar)
                    stringChar = 0;
                pos++;
            }
        }
        else if (m->buffer[pos] == '@' && (pos == 0 || m->buffer[pos - 1] != '\\'))
        {
            while (m->buffer[pos] != '\n' && m->buffer[pos] != 0)
                m->buffer[pos++] = ' ';
        }
        else if (m->buffer[pos] == '/' && m->buffer[pos + 1] == '*')
        {
            m->buffer[pos++] = ' ';
            m->buffer[pos++] = ' ';

            for (;;)
            {
                if (m->buffer[pos] == 0)
                    return;

                if (m->buffer[pos] == '*' && m->buffer[pos + 1] == '/')
                {
                    m->buffer[pos++] = ' ';
                    m->buffer[pos++] = ' ';
                    break;
                }
                else
                {
                    if (m->buffer[pos] != '\n')
                        m->buffer[pos] = ' ';
                    pos++;
                }
            }
        }
        else
        {
            if (m->buffer[pos] == '"' || m->buffer[pos] == '\'')
                stringChar = m->buffer[pos];
            pos++;
        }
    }
}

// Checks if we're at a particular directive and if so, consumes it.
// Returns whether the directive was found.
static bool CheckForDirective(AsmFile *cr m, const string *cr name)
{
    long i;
    long length = (long)name->length;

    for (i = 0; i < length && m->pos + i < m->size; i++)
        if (name->c_str[i] != m->buffer[m->pos + i])
            return false;

    if (i < length)
        return false;

    m->pos += length;

    return true;
}

static const string *dir_include = string_literal(".include");
static const string *dir_string = string_literal(".string");
static const string *dir_braille = string_literal(".braille");
// Checks if we're at a known directive and if so, consumes it.
// Returns which directive was found.
Directive AsmFile_GetDirective(AsmFile *cr m)
{
    SkipWhitespace(m);

    if (CheckForDirective(m, dir_include))
        return Directive_Include;
    else if (CheckForDirective(m, dir_string))
        return Directive_String;
    else if (CheckForDirective(m, dir_braille))
        return Directive_Braille;
    else
        return Directive_Unknown;
}

// Checks if we're at label that ends with '::'.
// Returns the name if so and an empty string if not.
string *AsmFile_GetGlobalLabel(AsmFile *cr m)
{
    long start = m->pos;
    long pos = m->pos;
    string *str;

    if (IsIdentifierStartingChar(m->buffer[pos]))
    {
        pos++;

        while (IsIdentifierChar(m->buffer[pos]))
            pos++;
    }

    if (m->buffer[pos] == ':' && m->buffer[pos + 1] == ':')
    {
        m->pos = pos + 2;
        ExpectEmptyRestOfLine(m);

        str = string(&m->buffer[start], pos - start);
    }
    else
    {
        str = empty_string();
    }

    return str;
}

// Skips tabs and spaces.
static void SkipWhitespace(AsmFile *cr m)
{
    while (m->buffer[m->pos] == '\t' || m->buffer[m->pos] == ' ')
        m->pos++;
}

// Reads include path.
string *AsmFile_ReadPath(AsmFile *cr m)
{
    SkipWhitespace(m);

    if (unlikely(m->buffer[m->pos] != '"'))
        RaiseError(m, "expected file path");

    m->pos++;

    int length = 0;
    long startPos = m->pos;

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

        if (unlikely(!IsAsciiPrintable(c)))
            RaiseError(m, "unexpected character '\\x%02X' in include string", c);

        // Don't bother allowing any escape sequences.
        if (unlikely(c == '\\'))
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

    return string(&m->buffer[startPos], length);
}

// Reads a charmap string.
int AsmFile_ReadString(AsmFile *cr m, unsigned char *cr s)
{
    SkipWhitespace(m);

    int length;

    StringParser *sp = StringParser_New(m->buffer, m->size);

    m->pos += StringParser_ParseString(sp, m->pos, s, &length);

    StringParser_Delete(sp);

    SkipWhitespace(m);

    if (ConsumeComma(m))
    {
        SkipWhitespace(m);
        int padLength = ReadPadLength(m);

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

int AsmFile_ReadBraille(AsmFile *cr m, unsigned char *cr s)
{
    SkipWhitespace(m);

    int length = 0;

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
                for (unsigned i = 'Z' - 'A'; i < braille_encoding_size; ++i)
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
static bool ConsumeComma(AsmFile *cr m)
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
static int ReadPadLength(AsmFile *cr m)
{
    if (unlikely(!IsAsciiDigit(m->buffer[m->pos])))
        RaiseError(m, "expected integer");

    int radix = 10;

    if (m->buffer[m->pos] == '0' && m->buffer[m->pos + 1] == 'x')
    {
        radix = 16;
        m->pos += 2;
    }

    int n = 0;
    int digit;

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
void AsmFile_OutputLine(AsmFile *cr m)
{
    while (m->buffer[m->pos] != '\n' && m->buffer[m->pos] != 0)
        m->pos++;

    if (unlikely(m->buffer[m->pos] == 0))
    {
        if (m->pos >= m->size)
        {
            RaiseWarning(m, "file doesn't end with newline");
            puts(&m->buffer[m->lineStart]);
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
static void ExpectEmptyRestOfLine(AsmFile *cr m)
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
bool AsmFile_IsAtEnd(AsmFile *cr m) { return (m->pos >= m->size); }

// Output the current location to set gas's logical file and line numbers.
void AsmFile_OutputLocation(AsmFile *cr m)
{
    printf("# %ld \"%s\"\n", m->lineNum, m->filename->c_str);
}

// Reports a diagnostic message.
static void ReportDiagnostic(AsmFile *cr m, const char *cr type, const char *cr format, va_list args)
{
    const int bufferSize = 1024;
    char buffer[bufferSize];
    vsnprintf(buffer, bufferSize, format, args);
    fprintf(stderr, "AsmFile: %s:%ld: %s: %s\n", m->filename->c_str, m->lineNum, type, buffer);
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
noreturn static void RaiseError(AsmFile *cr m, const char *cr format, ...)
{
    DO_REPORT(m, "error");
    exit(1);
}

// Reports a warning diagnostic.
static inline void RaiseWarning(AsmFile *cr m, const char *cr format, ...) { DO_REPORT(m, "warning"); }
