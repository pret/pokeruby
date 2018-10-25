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
#include <stdint.h>
#include <stdarg.h>
//#include "khash.h"
#include "preproc.h"
#include "charmap.h"
#include "char_util.h"
#include "utf8.h"

typedef enum LhsType
{
    LhsType_Char,
    LhsType_Escape,
    LhsType_Constant,
    LhsType_None
} LhsType;

typedef struct Lhs
{
    LhsType type;
    char *name;
    int32_t code;
} Lhs;

typedef struct CharmapReader
{
    char *buffer;
    long pos;
    long size;
    long lineNum;
    const char *filename;
} CharmapReader;

static void CharmapReader_Delete(CharmapReader *const restrict m);
static Lhs ReadLhs(CharmapReader *const restrict m);
static void ExpectEqualsSign(CharmapReader *const restrict m);
static char *ReadSequence(CharmapReader *const restrict m, uint32_t *const restrict len);
static void ExpectEmptyRestOfLine(CharmapReader *const restrict m);
no_return static void RaiseError(CharmapReader *const restrict m, const char *const restrict format, ...);
static void RemoveComments(CharmapReader *const restrict m);
static char *ReadConstant(CharmapReader *const restrict m);
static void SkipWhitespace(CharmapReader *const restrict m);

static CharmapReader *CharmapReader_New(const char *restrict filename)
{
    CharmapReader *m = (CharmapReader *)malloc(sizeof(CharmapReader));

    m->filename = filename;

    FILE *fp = fopen(m->filename, "rb");

    if (unlikely(fp == NULL))
        FATAL_ERROR("Failed to open \"%s\" for reading.\n", m->filename);

    fseek(fp, 0, SEEK_END);

    m->size = ftell(fp);

    if (unlikely(m->size < 0))
        FATAL_ERROR("File size of \"%s\" is less than zero.\n", m->filename);

    m->buffer = (char *)malloc(m->size + 1);

    rewind(fp);

    if (unlikely(fread(m->buffer, m->size, 1, fp) != 1))
        FATAL_ERROR("Failed to read \"%s\".\n", m->filename);

    m->buffer[m->size] = 0;

    fclose(fp);

    m->pos = 0;
    m->lineNum = 1;

    RemoveComments(m);

    return m;
}

static void CharmapReader_Delete(CharmapReader *const restrict m)
{
    free(m->buffer);
    free(m);
}

static Lhs ReadLhs(CharmapReader *const restrict m)
{
    Lhs lhs = { LhsType_Char, NULL, 0 };

    for (;;)
    {
        SkipWhitespace(m);

        if (m->buffer[m->pos] == '\n')
        {
            m->pos++;
            m->lineNum++;
        }
        else
        {
            break;
        }
    }

    if (m->buffer[m->pos] == '\'')
    {
        bool isEscape;
        unsigned char c;
        UnicodeChar unicodeChar;
        int32_t code;

        m->pos++;
        isEscape = (m->buffer[m->pos] == '\\');

        if (isEscape)
        {
            m->pos++;
        }

        c = m->buffer[m->pos];

        if (unlikely(c == 0))
        {
            if (m->pos >= m->size)
                RaiseError(m, "unexpected EOF in UTF-8 character literal");
            else
                RaiseError(m, "unexpected null character in UTF-8 character literal");
        }

        if (unlikely(IsAscii(c) && !IsAsciiPrintable(c)))
            RaiseError(m, "unexpected character U+%X in UTF-8 character literal", c);

        unicodeChar = DecodeUtf8(&m->buffer[m->pos]);
        code = unicodeChar.code;

        if (unlikely(code == -1))
            RaiseError(m, "invalid encoding in UTF-8 character literal");

        m->pos += unicodeChar.encodingLength;

        if (unlikely(m->buffer[m->pos] != '\''))
            RaiseError(m, "unterminated character literal");

        m->pos++;

        lhs.code = code;

        if (isEscape)
        {
            if (unlikely(code >= 128))
                RaiseError(m, "escapes using non-ASCII characters are invalid");

            switch (code)
            {
            case '\'':
                lhs.type = LhsType_Char;
                break;
            case '\\':
                lhs.type = LhsType_Char;
            // fall through
            case '"':
                RaiseError(m, "cannot escape double quote");
                break;
            default:
                lhs.type = LhsType_Escape;
            }
        }
        else
        {
            if (unlikely(code == '\''))
                RaiseError(m, "empty character literal");

            lhs.type = LhsType_Char;
        }
    }
    else if (IsIdentifierStartingChar(m->buffer[m->pos]))
    {
        lhs.type = LhsType_Constant;
        lhs.name = ReadConstant(m);
    }
    else if (unlikely(m->buffer[m->pos] == '\r'))
    {
        RaiseError(m, "only Unix-style LF newlines are supported");
    }
    else if (m->buffer[m->pos] == 0)
    {
        if (unlikely(m->pos < m->size))
            RaiseError(m, "unexpected null character");
        lhs.type = LhsType_None;
    }
    else
    {
        RaiseError(m, "junk at start of line");
    }

    return lhs;
}

static void ExpectEqualsSign(CharmapReader *const restrict m)
{
    SkipWhitespace(m);

    if (unlikely(m->buffer[m->pos] != '='))
        RaiseError(m, "expected equals sign");

    m->pos++;
}

static unsigned int ConvertHexDigit(char c)
{
    unsigned int digit = 0;

    if (c >= '0' && c <= '9')
        digit = c - '0';
    else if (c >= 'A' && c <= 'F')
        digit = 10 + c - 'A';
    else if (c >= 'a' && c <= 'f')
        digit = 10 + c - 'a';

    return digit;
}

static char *ReadSequence(CharmapReader *const restrict m, uint32_t *const restrict len)
{
    char *sequence;
    long startPos;
    unsigned int i, length;

    SkipWhitespace(m);

    startPos = m->pos;

    length = 0;

    while (IsAsciiHexDigit(m->buffer[m->pos]) && IsAsciiHexDigit(m->buffer[m->pos + 1]))
    {
        m->pos += 2;
        length++;

        if (unlikely(length > kMaxCharmapSequenceLength))
            RaiseError(m, "byte sequence too long (max is %lu bytes)", kMaxCharmapSequenceLength);

        SkipWhitespace(m);
    }

    if (unlikely(IsAsciiHexDigit(m->buffer[m->pos])))
        RaiseError(m, "each byte must have 2 hex digits");

    if (unlikely(length == 0))
        RaiseError(m, "expected byte sequence");

    sequence = (char *)malloc(length + 1);
    m->pos = startPos;

    for (i = 0; i < length; i++)
    {
        unsigned int digit1 = ConvertHexDigit(m->buffer[m->pos]);
        unsigned int digit2 = ConvertHexDigit(m->buffer[m->pos + 1]);
        unsigned char byte = digit1 * 16 + digit2;
        sequence[i] = (char)byte;

        m->pos += 2;
        SkipWhitespace(m);
    }
    // sequence[length] = '\0';
    *len = length;
    return sequence;
}
static void ExpectEmptyRestOfLine(CharmapReader *const restrict m)
{
    SkipWhitespace(m);

    if (likely(m->buffer[m->pos] == '\n'))
    {
        m->pos++;
        m->lineNum++;
    }
    else if (m->buffer[m->pos] == 0)
    {
        if (m->pos < m->size)
            RaiseError(m, "unexpected null character");
    }
    else if (m->buffer[m->pos] == '\r')
    {
        RaiseError(m, "only Unix-style LF newlines are supported");
    }
    else
    {
        RaiseError(m, "junk at end of line");
    }
}

no_return static void RaiseError(CharmapReader *const restrict m, const char *const restrict format, ...)
{
    const int bufferSize = 1024;
    char buffer[bufferSize];

    va_list args;
    va_start(args, format);
    vsnprintf(buffer, bufferSize, format, args);
    va_end(args);

    fprintf(stderr, "%s:%ld: error: %s\n", m->filename, m->lineNum, buffer);

    exit(1);
}

static void RemoveComments(CharmapReader *const restrict m)
{
    long pos = 0;
    bool inString = false;

    for (;;)
    {
        if (m->buffer[pos] == 0)
            return;

        if (inString)
        {
            if (m->buffer[pos] == '\\' && m->buffer[pos + 1] == '\'')
            {
                pos += 2;
            }
            else
            {
                if (m->buffer[pos] == '\'')
                    inString = false;
                pos++;
            }
        }
        else if (m->buffer[pos] == '@')
        {
            while (m->buffer[pos] != '\n' && m->buffer[pos] != 0)
                m->buffer[pos++] = ' ';
        }
        else
        {
            if (m->buffer[pos] == '\'')
                inString = true;
            pos++;
        }
    }
}

static char *ReadConstant(CharmapReader *const restrict m)
{
    long startPos = m->pos;
    char *ret;

    m->pos += SkipIdentifier(&m->buffer[m->pos]);

    ret = (char *)malloc(m->pos - startPos + 1);
    memcpy(ret, &m->buffer[startPos], m->pos - startPos);
    ret[m->pos - startPos] = '\0';

    return ret;
}

static void SkipWhitespace(CharmapReader *const restrict m)
{
    while (m->buffer[m->pos] == '\t' || m->buffer[m->pos] == ' ')
        m->pos++;
}

Charmap *Charmap_New(const char *const restrict filename)
{
    Charmap *m = (Charmap *)calloc(1, sizeof(Charmap));

    CharmapReader *reader = CharmapReader_New(filename);

    khiter_t kchars;
    khiter_t kconsts;
    int status;

    m->chars = kh_init(Char);
    m->constants = kh_init(Constant);

    for (;;)
    {
        Lhs lhs = ReadLhs(reader);
        uint32_t length = 0;
        char *sequence;
        int line = 0;

        if (lhs.type == LhsType_None)
        {
	        CharmapReader_Delete(reader);

            return m;
        }

        ExpectEqualsSign(reader);
        sequence = ReadSequence(reader, &length);
        ++line;
        switch (lhs.type)
        {
        case LhsType_Char:
            kchars = kh_get(Char, m->chars, lhs.code);

            if (unlikely(kchars != kh_end(m->chars)))
                RaiseError(reader, "redefining char");

            kchars = kh_put(Char, m->chars, lhs.code, &status);
            kh_value(m->chars, kchars) = (CharmapValue) { sequence, length };
            break;
        case LhsType_Escape:
            if (unlikely(m->escapes[lhs.code].str != NULL))
                RaiseError(reader, "redefining escape");
            m->escapes[lhs.code] = (CharmapValue) { sequence, length };
            break;
        case LhsType_Constant:
            kconsts = kh_get(Constant, m->constants, lhs.name);

            if (unlikely(kconsts != kh_end(m->constants)))
                RaiseError(reader, "redefining constant");

            kconsts = kh_put(Constant, m->constants, lhs.name, &status);
            kh_value(m->constants, kconsts) = (CharmapValue) { sequence, length };

            break;
        case LhsType_None:
            RaiseError(reader, "LhsType is invalid!");
        }
        ExpectEmptyRestOfLine(reader);
    }
}

void Charmap_Delete(Charmap *const restrict m)
{
    int i;
    khiter_t k;
    for (k = kh_begin(m->chars); k != kh_end(m->chars); ++k)
    {
        if (kh_exist(m->chars, k))
        {
            free(kh_value(m->chars, k).str);
            kh_del(Char, m->chars, k);
        }
    }
    kh_destroy(Char, m->chars);
    for (k = kh_begin(m->constants); k != kh_end(m->constants); ++k)
    {
        if (kh_exist(m->constants, k))
        {
            free((char *)kh_key(m->constants, k));
            free(kh_value(m->constants, k).str);
            kh_del(Constant, m->constants, k);
        }
    }
    kh_destroy(Constant, m->constants);

    for (i = 0; i < 128; i++)
        if (m->escapes[i].str != NULL)
            free(m->escapes[i].str);

    free(m);
}

const char *Charmap_Char(const Charmap *const restrict m, int32_t code, uint32_t *const restrict len)
{
    khiter_t iter = kh_get(Char, m->chars, code);
    CharmapValue value;

    // No match
    if (iter == kh_end(m->chars))
    {
        *len = 0;
        return NULL;
    }
    value = kh_value(m->chars, iter);
    *len = value.len;
    return value.str;

}

const char *Charmap_Constant(const Charmap *const restrict m, const char *const restrict identifier, uint32_t *const restrict len)
{
    khiter_t iter = kh_get(Constant, m->constants, identifier);
    CharmapValue value;

    // No match
    if (iter == kh_end(m->constants))
    {
        *len = 0;
        return NULL;
    }
    value = kh_value(m->constants, iter);
    *len = value.len;

    return value.str;
}
