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

#include "ucpp/cpp.h"

#include "preproc.h"
#include "pragma_parser.h"
#include "char_util.h"
#include "utf8.h"
#include "string_parser.h"

enum incbin_type {
    INCBIN_S8,
    INCBIN_U8,
    INCBIN_S16,
    INCBIN_U16,
    INCBIN_S32,
    INCBIN_U32,
    INCBIN_STRING,
    INCBIN_STRING_NOTERM,
    INCBIN_ERROR
};

static void TryConvertString(const char *const str, bool noTerminator);
static unsigned char *ReadWholeFile(const char *const restrict path, int *restrict size);
static void TryConvertIncbin(const char *restrict str, const enum incbin_type type);
static void ReportDiagnostic(const char *type, const char *format, va_list args);
__attribute__((__format__(printf, 1, 2))) no_return static void RaiseError(const char *format, ...);
__attribute__((__format__(printf, 1, 2))) static void RaiseWarning(const char *format, ...);


static const char *const idents[6] =
{
    "S8",  "U8",
    "S16", "U16",
    "S32", "U32"
};

static inline bool CheckIdentifier(const char *const str, size_t ident_pos)
{
    size_t len = ident_pos <= 1 ? 2 : 3;

    return !strncmp(idents[ident_pos], str, len);
}

static long s_line = 0;
static const char *s_filename = NULL;

/*
 * Parses a Preproc pragma.
 *
 * If PREPROC is defined, the Preproc macros will turn into Preproc pragmas like so:
 *   _("string")         -> #pragma preproc _ "string"
 *   __("string noterm") -> #pragma preproc __ "string noterm"
 *   INCBIN_U8("file") -> #pragma preproc U8 "file" (note that we leave out the INCBIN_ because we don't need it and it is easier to parse)
 */
void ParsePragma(const char *restrict str, const char *restrict filename, long line)
{
    // Create a mutable copy
    char *pragmaStr = (char *)alloca(strlen(str) + 1);
    enum incbin_type type = INCBIN_ERROR;
    size_t len;

    strcpy(pragmaStr, str);

    s_line = line;
    s_filename = filename;

    pragmaStr += 9;

    ++pragmaStr;

    if (pragmaStr[0] == '_')
    {
        // _("string")
        if (likely(pragmaStr[1] == PRAGMA_TOKEN_END))
        {
            type = INCBIN_STRING;
            pragmaStr += 2;
        }
        // __("string without terminator"). We don't this often, so we don't predict it.
        else if (pragmaStr[1] == '_' && pragmaStr[2] == PRAGMA_TOKEN_END)
        {
            type = INCBIN_STRING_NOTERM;
            pragmaStr += 3;
        }
    }
    // INCBIN_Sn / INCBIN_Un
    else if (pragmaStr[0] == 'S' || pragmaStr[0] == 'U')
    {
        size_t i;
        for (i = 0; i < sizeof(idents) / sizeof(const char *); i++)
        {
            if (CheckIdentifier(pragmaStr, i))
            {
                type = (enum incbin_type)i;
                pragmaStr += strlen(idents[i]) + 1;
                break;
            }
        }
        if (unlikely(type == INCBIN_ERROR))
            RaiseError("Incorrect incbin type!");
    }
    else
    {
        RaiseError("Incorrect preproc pragma!");
    }

    len = strlen(pragmaStr);

    if (unlikely(len == 0))
        RaiseError("Need an item to incbin or translate!");

    // Convert a string
    if (type == INCBIN_STRING || type == INCBIN_STRING_NOTERM)
    {
        TryConvertString(pragmaStr, type == INCBIN_STRING_NOTERM);
    }
    else
    {
        // Split the pragma string and parse each of them.
        const char delim[3] = { (const char)PRAGMA_TOKEN_END, (const char)'\0' };
        const char *split = strtok(pragmaStr, delim);

        putc_unlocked('{', g_file);

        while (split != NULL)
        {
                if (unlikely(!STRING_TOKEN(split[0]) && split[0] != COMMA))
                    RaiseError("expected string token in pragma");

                 TryConvertIncbin(split, type);
            split = strtok(NULL, delim);
        }
        putc_unlocked('}', g_file);
    }

    // avoid dangling pointers
    s_line = -1;
    s_filename = NULL;
}

/*
 * Tries to convert a string and print to stdout.
 */
static void TryConvertString(const char *const str, bool noTerminator)
{
    long pos = 1;
    StringParser *stringParser;

    if (unlikely(!STRING_TOKEN(str[0])))
        RaiseError("Failed to convert string");

    pos = 1;

    stringParser = StringParser_New(str, strlen(str));

    putc_unlocked('{', g_file);

    while (1)
    {
        if (str[pos] == '"')
        {
            unsigned char s[kMaxStringLength];
            int length, i;

            // Parse the string.
            pos += StringParser_ParseString(stringParser, pos, s, &length);

            // Print the items in hex.
            for (i = 0; i < length; i++)
                fprintf(g_file, "0x%02X, ", s[i]);

        }
        else if (str[pos] == PRAGMA_TOKEN_END)
        {
            // end of string
            if (str[pos + 1] == '\0')
                break;
            // skip the delimiter to allow "foo" "bar" concatenation
            else
                pos += 2;
        }
        unlikely_else
        {
            if (IsAsciiPrintable(str[pos]))
                RaiseError("unexpected character '%c'", str[pos]);
            else
                RaiseError("unexpected character '\\x%02X'", str[pos]);
        }
    }

    if (noTerminator)
        putc_unlocked('}', g_file);
    else
        fputs("0xFF }", g_file);

    StringParser_Delete(stringParser);
}

static unsigned char *ReadWholeFile(const char *const restrict path, int *restrict size)
{
    FILE *fp = fopen(path, "rb");
    unsigned char *buffer;

    if (unlikely(fp == NULL))
        RaiseError("Failed to open \"%s\" for reading.\n", path);

    fseek(fp, 0, SEEK_END);

    *size = ftell(fp);

    buffer = (unsigned char *)malloc(*size);

    rewind(fp);

    if (unlikely(fread(buffer, *size, 1, fp) != 1))
        RaiseError("Failed to read \"%s\".\n", path);

    fclose(fp);

    return buffer;
}

static int ExtractData(const unsigned char *buffer, int offset, int size)
{
    switch (size)
    {
    case 1:
        return buffer[offset];
    case 2:
        return (buffer[offset + 1] << 8) | buffer[offset];
    case 4:
        return (buffer[offset + 3] << 24) | (buffer[offset + 2] << 16) | (buffer[offset + 1] << 8)
            | buffer[offset];
    default:
        FATAL_ERROR("Invalid size passed to ExtractData.\n");
    }
}

static void TryConvertIncbin(const char *restrict str, const enum incbin_type incbinType)
{
    const char *endquote;
    const char *bad;
    char *path;
    unsigned char *buffer;
    int pos;
    int size;
    int fileSize;
    int startPos;
    int i;
    int offset;
    int count;
    bool isSigned;

    if (str[0] == COMMA)
    {
        str = strchr(str, '"');
        if (str == NULL)
            RaiseError("Trailing comma");
        --str;
    }
    else
    {
    if (unlikely(!STRING_TOKEN(str[0])))
        RaiseError("Syntax error in str");
    }
    pos = 1;

    size = 1 << ((int)incbinType / 2);
    isSigned = (((int)incbinType % 2) == 0);

    if (unlikely(str[pos] != '"'))
        RaiseError("expected double quote");

    pos++;

    startPos = pos;

    // Only on a single line, don't auto advance
    endquote = strchr(&str[pos], '"');
    bad = strpbrk(&str[pos], "\r\n,\\");

    if (unlikely(endquote == NULL || endquote <= &str[pos]))
    {
        RaiseError("expected ending quote in path string");
    }
    // If anything matched by strpbrk comes before endquote, it is malformed
    else if (unlikely(bad != NULL && bad < endquote))
    {
        if (bad[0] == '\r' || bad[0] == '\n')
            RaiseError("unexpected end of line character in path string");
        else
            RaiseError("unexpected escape in path string");
    }
    pos += endquote - &str[pos];

    // Create a new string containing the path. Store it on the stack.
    path = (char *) alloca(pos - startPos + 1);
    memcpy(path, str + startPos, pos - startPos);
    path[pos - startPos] = '\0';

    buffer = ReadWholeFile(path, &fileSize);

    if (unlikely((fileSize % size) != 0))
        RaiseError("Size %d doesn't evenly divide file size %d.\n", size, fileSize);

    count = fileSize / size;
    offset = 0;

    // Give a #line directive
    if (g_lines)
        fprintf(g_file, "\n# 1 \"%s\" 1\n", path);

    for (i = 0; i < count; i++)
    {
        int data = ExtractData(buffer, offset, size);
        offset += size;

        if (isSigned)
            fprintf(g_file, "%d, ", data);
        else
            fprintf(g_file, "%uu, ", (unsigned)data);
    }
    if (g_lines)
        fprintf(g_file, "\n# %ld \"%s\"\n", s_line, s_filename);

    free(buffer);
}

// Reports a diagnostic message.
static void ReportDiagnostic(const char *type, const char *format, va_list args)
{
    const int bufferSize = 1024;
    char buffer[bufferSize];
    vsnprintf(buffer, bufferSize, format, args);
    fprintf(stderr, "Pragma Parser: %s:%ld: %s: %s\n", s_filename, s_line, type, buffer);
}

#define DO_REPORT(type)                                                                            \
    do                                                                                             \
    {                                                                                              \
        va_list args;                                                                              \
        va_start(args, format);                                                                    \
        ReportDiagnostic(type, format, args);                                                      \
        va_end(args);                                                                              \
    } while (0)

// Reports an error diagnostic and terminates the program.
no_return static void RaiseError(const char *format, ...)
{
    DO_REPORT("error");
    exit(1);
}

// Reports a warning diagnostic.
__attribute__((unused)) static void RaiseWarning(const char *format, ...)
{
    DO_REPORT("warning");
}

