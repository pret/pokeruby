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
    string *name;
    int32_t code;
} Lhs;

typedef struct CharmapReader
{
    char *buffer;
    long pos;
    long size;
    long lineNum;
    string *filename;
} CharmapReader;

static void CharmapReader_Delete(CharmapReader *m);
static Lhs ReadLhs(CharmapReader *m);
static void ExpectEqualsSign(CharmapReader *m);
static string *ReadSequence(CharmapReader *m);
static void ExpectEmptyRestOfLine(CharmapReader *m);
noreturn static void RaiseError(CharmapReader *m, const char *format, ...);
static void RemoveComments(CharmapReader *m);
static string *ReadConstant(CharmapReader *m);
static void SkipWhitespace(CharmapReader *m);

static CharmapReader *CharmapReader_New(string *filename)
{
    CharmapReader *m = (CharmapReader *)malloc(sizeof(CharmapReader));

    m->filename = filename;

    FILE *fp = fopen(m->filename->c_str, "rb");

    if (unlikely(fp == NULL))
        FATAL_ERROR("Failed to open \"%s\" for reading.\n", m->filename->c_str);

    fseek(fp, 0, SEEK_END);

    m->size = ftell(fp);

    if (unlikely(m->size < 0))
        FATAL_ERROR("File size of \"%s\" is less than zero.\n", m->filename->c_str);

    m->buffer = (char *)malloc(m->size + 1);

    rewind(fp);

    if (unlikely(fread(m->buffer, m->size, 1, fp) != 1))
        FATAL_ERROR("Failed to read \"%s\".\n", m->filename->c_str);

    m->buffer[m->size] = 0;

    fclose(fp);

    m->pos = 0;
    m->lineNum = 1;

    RemoveComments(m);

    return m;
}

static void CharmapReader_Delete(CharmapReader *m)
{
    string_Delete(m->filename);
    free(m);
}

static Lhs ReadLhs(CharmapReader *m)
{
    Lhs lhs;

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
        m->pos++;

        bool isEscape = (m->buffer[m->pos] == '\\');

        if (isEscape)
        {
            m->pos++;
        }

        unsigned char c = m->buffer[m->pos];

        if (unlikely(c == 0))
        {
            if (m->pos >= m->size)
                RaiseError(m, "unexpected EOF in UTF-8 character literal");
            else
                RaiseError(m, "unexpected null character in UTF-8 character literal");
        }

        if (unlikely(IsAscii(c) && !IsAsciiPrintable(c)))
            RaiseError(m, "unexpected character U+%X in UTF-8 character literal", c);

        UnicodeChar unicodeChar = DecodeUtf8(&m->buffer[m->pos]);
        int32_t code = unicodeChar.code;

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

static void ExpectEqualsSign(CharmapReader *m)
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

static string *ReadSequence(CharmapReader *m)
{
    SkipWhitespace(m);

    long startPos = m->pos;

    unsigned int length = 0;

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

    string *sequence = empty_string();
    //    string_reserve(sequence, length);

    m->pos = startPos;

    for (unsigned int i = 0; i < length; i++)
    {
        unsigned int digit1 = ConvertHexDigit(m->buffer[m->pos]);
        unsigned int digit2 = ConvertHexDigit(m->buffer[m->pos + 1]);
        unsigned char byte = digit1 * 16 + digit2;
        sequence = string_add_char(sequence, byte);

        m->pos += 2;
        SkipWhitespace(m);
    }

    return sequence;
}

static void ExpectEmptyRestOfLine(CharmapReader *m)
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

noreturn static void RaiseError(CharmapReader *m, const char *format, ...)
{
    const int bufferSize = 1024;
    char buffer[bufferSize];

    va_list args;
    va_start(args, format);
    vsnprintf(buffer, bufferSize, format, args);
    va_end(args);

    fprintf(stderr, "%s:%ld: error: %s\n", m->filename->c_str, m->lineNum, buffer);

    exit(1);
}

static void RemoveComments(CharmapReader *m)
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

static string *ReadConstant(CharmapReader *m)
{
    long startPos = m->pos;

    while (IsIdentifierChar(m->buffer[m->pos]))
        m->pos++;

    return string(&m->buffer[startPos], m->pos - startPos);
}

static void SkipWhitespace(CharmapReader *m)
{
    while (m->buffer[m->pos] == '\t' || m->buffer[m->pos] == ' ')
        m->pos++;
}

Charmap *Charmap_New(char *file)
{
    Charmap *m = (Charmap *)calloc(1, sizeof(Charmap));

    string *filename = string(file, strlen(file));
    CharmapReader *reader = CharmapReader_New(filename);

    m->chars = HashMap_New();
    m->constants = HashMap_New();

    for (;;)
    {
        Lhs lhs = ReadLhs(reader);

        if (lhs.type == LhsType_None)
            return m;

        ExpectEqualsSign(reader);

        string *sequence = ReadSequence(reader);

        switch (lhs.type)
        {
        case LhsType_Char:
            if (unlikely(HashMap_FindInt(m->chars, lhs.code) != NULL))
                RaiseError(reader, "redefining char");
            HashMap_PutInt(m->chars, lhs.code, sequence);
            break;
        case LhsType_Escape:
            if (unlikely(m->escapes[lhs.code] != NULL))
                RaiseError(reader, "redefining escape");
            m->escapes[lhs.code] = sequence;
            break;
        case LhsType_Constant:
            if (unlikely(HashMap_FindString(m->constants, lhs.name) != NULL))
                RaiseError(reader, "redefining constant");
            HashMap_PutString(m->constants, lhs.name, sequence);
            break;
        }

        ExpectEmptyRestOfLine(reader);
    }
    CharmapReader_Delete(reader);
}

void Charmap_Delete(Charmap *m)
{
    HashMap_Delete(m->constants);
    HashMap_Delete(m->chars);
    for (uint8_t i = 0; i < 128; i++)
        if (m->escapes[i])
            string_Delete(m->escapes[i]);

    free(m);
}

string *Charmap_Char(Charmap *m, int32_t code)
{
    string *it = HashMap_FindInt(m->chars, code);

    if (unlikely(!it))
        return empty_string();

    return it;
}

string *Charmap_Constant(Charmap *m, const string *identifier)
{
    string *it = HashMap_FindString(m->constants, identifier);

    if (unlikely(!it))
        return empty_string();

    return it;
}
