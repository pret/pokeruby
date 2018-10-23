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
#include "c_file.h"
#include "char_util.h"
#include "utf8.h"
#include "string_parser.h"

struct CFile
{
    char *buffer;
    long pos;
    long size;
    long lineNum;
    const char *filename;
};

static bool ConsumeHorizontalWhitespace(CFile *const restrict m);
static bool ConsumeNewline(CFile *const restrict m);
static void SkipWhitespace(CFile *const restrict m);
static void TryConvertString(CFile *const restrict m);
static unsigned char *ReadWholeFile(CFile *const restrict m, const char *const restrict path, int *restrict size);
static inline bool CheckIdentifier(CFile *const restrict m, size_t ident_pos);
static void TryConvertIncbin(CFile *m);
static void ReportDiagnostic(CFile *m, const char *type, const char *format, va_list args);
no_return static void RaiseError(CFile *m, const char *format, ...);
static void RaiseWarning(CFile *m, const char *format, ...);

CFile *CFile_New(const char *restrict filename)
{
    CFile *m = (CFile *)malloc(sizeof(CFile));
    m->filename = filename;
    FILE *fp;
    size_t count;
    char tmp[4096];

    if (!filename || !strcmp(filename, "-"))
    {
        m->filename = "stdin";
        fp = stdin;
    }
    else
    {
        fp = fopen(filename, "rb");
    }

    if (unlikely(fp == NULL))
        FATAL_ERROR("Failed to open \"%s\" for reading.\n", filename);

    m->size = 0;
    m->buffer = (char *)malloc(1);
    while ((count = fread(tmp, 1, 4096, fp)) != 0)
    {
        if (unlikely(ferror(fp)))
            FATAL_ERROR("Failed to read \"%s\".\n", filename);

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
    m->pos = 0;
    m->lineNum = 1;

    return m;
}

void CFile_Delete(CFile *m)
{
    free(m->buffer);
    free(m);
}

void CFile_Preproc(CFile *const restrict m)
{
    char stringChar = 0;

    while (m->pos < m->size)
    {
        if (stringChar)
        {
            if (m->buffer[m->pos] == stringChar)
            {
                putc_unlocked(stringChar, g_file);
                m->pos++;
                stringChar = 0;
            }
            else if (m->buffer[m->pos] == '\\' && m->buffer[m->pos + 1] == stringChar)
            {
                putc_unlocked('\\', g_file);
                putc_unlocked(stringChar, g_file);
                m->pos += 2;
            }
            else
            {
                if (m->buffer[m->pos] == '\n')
                    m->lineNum++;
                putc_unlocked(m->buffer[m->pos], g_file);
                m->pos++;
            }
        }
        else
        {
            char c;

            TryConvertString(m);
            TryConvertIncbin(m);

            if (m->pos >= m->size)
                break;

            c = m->buffer[m->pos++];

            putc_unlocked(c, g_file);

            if (c == '\n')
                m->lineNum++;
            else if (c == '"')
                stringChar = '"';
            else if (c == '\'')
                stringChar = '\'';
        }
    }
}

static bool ConsumeHorizontalWhitespace(CFile *const restrict m)
{
    if (m->buffer[m->pos] == '\t' || m->buffer[m->pos] == ' ')
    {
        m->pos++;
        return true;
    }

    return false;
}

static bool ConsumeNewline(CFile *const restrict m)
{
    if (m->buffer[m->pos] == '\r' && m->buffer[m->pos + 1] == '\n')
    {
        m->pos += 2;
        m->lineNum++;
        putc_unlocked('\n', g_file);
        return true;
    }

    if (m->buffer[m->pos] == '\n')
    {
        m->pos++;
        m->lineNum++;
        putc_unlocked('\n', g_file);
        return true;
    }

    return false;
}

static void SkipWhitespace(CFile *const restrict m)
{
    while (ConsumeHorizontalWhitespace(m) || ConsumeNewline(m))
        ;
}

static void TryConvertString(CFile *const restrict m)
{
    long oldPos = m->pos;
    long oldLineNum = m->lineNum;
    bool noTerminator = false;

    if (m->buffer[m->pos] != '_' || (m->pos > 0 && IsIdentifierChar(m->buffer[m->pos - 1])))
        return;

    m->pos++;

    if (m->buffer[m->pos] == '_')
    {
        noTerminator = true;
        m->pos++;
    }

    SkipWhitespace(m);

    if (m->buffer[m->pos] != '(')
    {
        m->pos = oldPos;
        m->lineNum = oldLineNum;
        return;
    }

    m->pos++;

    SkipWhitespace(m);

    putc_unlocked('{', g_file);

    while (1)
    {
        SkipWhitespace(m);

        if (m->buffer[m->pos] == '"')
        {
            unsigned char s[kMaxStringLength];
            int length, i;

            StringParser *stringParser = StringParser_New(m->buffer, m->size);

            m->pos += StringParser_ParseString(stringParser, m->pos, s, &length);

            for (i = 0; i < length; i++)
                fprintf(g_file, "0x%02X,", s[i]);

            StringParser_Delete(stringParser);
        }
        else if (m->buffer[m->pos] == ')')
        {
            m->pos++;
            break;
        }
        else
        {
            if (m->pos >= m->size)
                RaiseError(m, "unexpected EOF");
            if (IsAsciiPrintable(m->buffer[m->pos]))
                RaiseError(m, "unexpected character '%c'", m->buffer[m->pos]);
            else
                RaiseError(m, "unexpected character '\\x%02X'", m->buffer[m->pos]);
        }
    }

    if (noTerminator)
        putc_unlocked('}', g_file);
    else
        fputs("0xFF}", g_file);
}

static const char *idents[6] =
{
    "INCBIN_S8",  "INCBIN_U8",
    "INCBIN_S16", "INCBIN_U16",
    "INCBIN_S32", "INCBIN_U32"
};

static inline bool CheckIdentifier(CFile *const restrict m, size_t ident_pos)
{
    size_t len = ident_pos >= 1 ? 10 : 9;

    if (m->pos + len > m->size)
        return false;
    return !strncmp(idents[ident_pos], &m->buffer[m->pos], len);
}

static unsigned char *ReadWholeFile(CFile *const restrict m, const char *const restrict path, int *restrict size)
{
    FILE *fp = fopen(path, "rb");
    unsigned char *buffer;

    if (unlikely(fp == NULL))
        RaiseError(m, "Failed to open \"%s\" for reading.\n", path);

    fseek(fp, 0, SEEK_END);

    *size = ftell(fp);

    buffer = (unsigned char *)malloc(*size);

    rewind(fp);

    if (unlikely(fread(buffer, *size, 1, fp) != 1))
        RaiseError(m, "Failed to read \"%s\".\n", path);

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

static void TryConvertIncbin(CFile *m)
{
    int incbinType = -1;
    int i, size, startPos, count, offset;
    bool isSigned;
    long oldPos, oldLineNum;
    int fileSize;
    unsigned char *buffer;
    char *path;

    for (i = 0; i < 6; i++)
    {
        if (CheckIdentifier(m, i))
        {
            incbinType = i;
            break;
        }
    }

    if (incbinType == -1)
        return;

    size = 1 << (incbinType / 2);
    isSigned = ((incbinType % 2) == 0);

    oldPos = m->pos;
    oldLineNum = m->lineNum;

    m->pos += strlen(idents[incbinType]);

    SkipWhitespace(m);

    if (m->buffer[m->pos] != '(')
    {
        m->pos = oldPos;
        m->lineNum = oldLineNum;
        return;
    }

    m->pos++;

    SkipWhitespace(m);

    if (unlikely(m->buffer[m->pos] != '"'))
        RaiseError(m, "expected double quote");

    m->pos++;

    startPos = m->pos;

    while (m->buffer[m->pos] != '"')
    {
        if (unlikely(m->buffer[m->pos] == '\0'))
        {
            if (m->pos >= m->size)
                RaiseError(m, "unexpected EOF in path string");
            else
                RaiseError(m, "unexpected null character in path string");
        }

        if (unlikely(m->buffer[m->pos] == '\r' || m->buffer[m->pos] == '\n'))
            RaiseError(m, "unexpected end of line character in path string");

        if (unlikely(m->buffer[m->pos] == '\\'))
            RaiseError(m, "unexpected escape in path string");

        m->pos++;
    }

    path = (char *)alloca(m->pos - startPos + 1);
    memcpy(path, &m->buffer[startPos], m->pos - startPos);
    path[m->pos - startPos] = '\0';

    m->pos++;

    SkipWhitespace(m);

    if (unlikely(m->buffer[m->pos] != ')'))
        RaiseError(m, "expected ')'");

    m->pos++;

    putc_unlocked('{', g_file);

    buffer = ReadWholeFile(m, path, &fileSize);

    if (unlikely((fileSize % size) != 0))
        RaiseError(m, "Size %d doesn't evenly divide file size %d.\n", size, fileSize);

    count = fileSize / size;
    offset = 0;

    for (i = 0; i < count; i++)
    {
        int data = ExtractData(buffer, offset, size);
        offset += size;

        if (isSigned)
            fprintf(g_file, "%d,", data);
        else
            fprintf(g_file, "%uu,", data);
    }

    putc_unlocked('}', g_file);
}

// Reports a diagnostic message.
static void ReportDiagnostic(CFile *m, const char *type, const char *format, va_list args)
{
    const int bufferSize = 1024;
    char buffer[bufferSize];
    vsnprintf(buffer, bufferSize, format, args);
    fprintf(stderr, "CFile: %s:%ld: %s: %s\n", m->filename, m->lineNum, type, buffer);
}

#define DO_REPORT(type)                                                                            \
    do                                                                                             \
    {                                                                                              \
        va_list args;                                                                              \
        va_start(args, format);                                                                    \
        ReportDiagnostic(m, type, format, args);                                                   \
        va_end(args);                                                                              \
    } while (0)

// Reports an error diagnostic and terminates the program.
no_return static void RaiseError(CFile *m, const char *format, ...)
{
    DO_REPORT("error");
    exit(1);
}

// Reports a warning diagnostic.
__attribute__((unused)) static void RaiseWarning(CFile *m, const char *format, ...)
{
    DO_REPORT("warning");
}
