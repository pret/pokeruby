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
    string *filename;
};

static bool ConsumeHorizontalWhitespace(CFile *cr m);
static bool ConsumeNewline(CFile *cr m);
static void SkipWhitespace(CFile *cr m);
static void TryConvertString(CFile *cr m);
static unsigned char *ReadWholeFile(CFile *cr m, const string *cr path, int *r size);
static inline bool CheckIdentifier(CFile *cr m, const string *cr ident);
static void TryConvertIncbin(CFile *m);
static void ReportDiagnostic(CFile *m, const char *type, const char *format, va_list args);
noreturn static void RaiseError(CFile *m, const char *format, ...);
static void RaiseWarning(CFile *m, const char *format, ...);

CFile *CFile_New(string *filename, string *data)
{
    CFile *m = (CFile *)malloc(sizeof(CFile));
    m->filename = filename;
    if (data != NULL)
    {
        m->size = data->length;
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

    return m;
}

void CFile_Delete(CFile *m)
{
    free(m->buffer);
    string_Delete(m->filename);
    free(m);
}

void CFile_Preproc(CFile *cr m)
{
    char stringChar = 0;

    while (m->pos < m->size)
    {
        if (stringChar)
        {
            if (m->buffer[m->pos] == stringChar)
            {
                putchar_unlocked(stringChar);
                m->pos++;
                stringChar = 0;
            }
            else if (m->buffer[m->pos] == '\\' && m->buffer[m->pos + 1] == stringChar)
            {
                putchar_unlocked('\\');
                putchar_unlocked(stringChar);
                m->pos += 2;
            }
            else
            {
                if (m->buffer[m->pos] == '\n')
                    m->lineNum++;
                putchar_unlocked(m->buffer[m->pos]);
                m->pos++;
            }
        }
        else
        {
            TryConvertString(m);
            TryConvertIncbin(m);

            if (m->pos >= m->size)
                break;

            char c = m->buffer[m->pos++];

            putchar_unlocked(c);

            if (c == '\n')
                m->lineNum++;
            else if (c == '"')
                stringChar = '"';
            else if (c == '\'')
                stringChar = '\'';
        }
    }
}

static bool ConsumeHorizontalWhitespace(CFile *cr m)
{
    if (m->buffer[m->pos] == '\t' || m->buffer[m->pos] == ' ')
    {
        m->pos++;
        return true;
    }

    return false;
}

static bool ConsumeNewline(CFile *cr m)
{
    if (m->buffer[m->pos] == '\r' && m->buffer[m->pos + 1] == '\n')
    {
        m->pos += 2;
        m->lineNum++;
        putchar_unlocked('\n');
        return true;
    }

    if (m->buffer[m->pos] == '\n')
    {
        m->pos++;
        m->lineNum++;
        putchar_unlocked('\n');
        return true;
    }

    return false;
}

static void SkipWhitespace(CFile *cr m)
{
    while (ConsumeHorizontalWhitespace(m) || ConsumeNewline(m))
        ;
}

static void TryConvertString(CFile *cr m)
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

    putchar_unlocked('{');

    while (1)
    {
        SkipWhitespace(m);

        if (m->buffer[m->pos] == '"')
        {
            unsigned char s[kMaxStringLength];
            int length;
            StringParser *stringParser = StringParser_New(m->buffer, m->size);

            m->pos += StringParser_ParseString(stringParser, m->pos, s, &length);

            for (int i = 0; i < length; i++)
                printf("0x%02X,", s[i]);

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
        putchar_unlocked('}');
    else
        fputs("0xFF}", stdout);
}

static inline bool CheckIdentifier(CFile *cr m, const string *cr ident)
{
    unsigned int i;

    for (i = 0; i < ident->length && m->pos + i < (unsigned)m->size; i++)
        if (ident->c_str[i] != m->buffer[m->pos + i])
            return false;
//    if (m->pos + ident->length > m->size) return false;
//    return !strncmp(ident->c_str, &m->buffer[m->pos], ident->length);
    return (i == ident->length);
}

static unsigned char *ReadWholeFile(CFile *cr m, const string *cr path, int *r size)
{
    FILE *fp = fopen(path->c_str, "rb");

    if (unlikely(fp == NULL))
        RaiseError(m, "Failed to open \"%s\" for reading.\n", path->c_str);

    fseek(fp, 0, SEEK_END);

    *size = ftell(fp);

    unsigned char *buffer = (unsigned char *)malloc(*size);

    rewind(fp);

    if (unlikely(fread(buffer, *size, 1, fp) != 1))
        RaiseError(m, "Failed to read \"%s\".\n", path->c_str);

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

static const string *idents[6]
    = { string_literal("INCBIN_S8"),  string_literal("INCBIN_U8"),  string_literal("INCBIN_S16"),
        string_literal("INCBIN_U16"), string_literal("INCBIN_S32"), string_literal("INCBIN_U32") };

static void TryConvertIncbin(CFile *m)
{
    int incbinType = -1;

    for (int i = 0; i < 6; i++)
    {
        if (CheckIdentifier(m, idents[i]))
        {
            incbinType = i;
            break;
        }
    }

    if (incbinType == -1)
        return;

    int size = 1 << (incbinType / 2);
    bool isSigned = ((incbinType % 2) == 0);

    long oldPos = m->pos;
    long oldLineNum = m->lineNum;

    m->pos += idents[incbinType]->length;

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

    int startPos = m->pos;

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

    string *path = string(&m->buffer[startPos], m->pos - startPos);

    m->pos++;

    SkipWhitespace(m);

    if (unlikely(m->buffer[m->pos] != ')'))
        RaiseError(m, "expected ')'");

    m->pos++;

    putchar_unlocked('{');

    int fileSize;
    unsigned char *buffer = ReadWholeFile(m, path, &fileSize);

    string_Delete(path);

    if (unlikely((fileSize % size) != 0))
        RaiseError(m, "Size %d doesn't evenly divide file size %d.\n", size, fileSize);

    int count = fileSize / size;
    int offset = 0;

    for (int i = 0; i < count; i++)
    {
        int data = ExtractData(buffer, offset, size);
        offset += size;

        if (isSigned)
            printf("%d,", data);
        else
            printf("%uu,", data);
    }

    putchar_unlocked('}');
}

// Reports a diagnostic message.
static void ReportDiagnostic(CFile *m, const char *type, const char *format, va_list args)
{
    const int bufferSize = 1024;
    char buffer[bufferSize];
    vsnprintf(buffer, bufferSize, format, args);
    fprintf(stderr, "CFile: %s:%ld: %s: %s\n", m->filename->c_str, m->lineNum, type, buffer);
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
noreturn static void RaiseError(CFile *m, const char *format, ...)
{
    DO_REPORT("error");
    exit(1);
}

// Reports a warning diagnostic.
__attribute__((unused)) static void RaiseWarning(CFile *m, const char *format, ...)
{
    DO_REPORT("warning");
}
