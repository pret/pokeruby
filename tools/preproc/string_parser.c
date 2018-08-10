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
#include "charmap.h"
#include "string_parser.h"
#include "char_util.h"
#include "utf8.h"

typedef struct Integer
{
    uint32_t value;
    int size;
} Integer;

struct StringParser
{
    char *buffer;
    long size;
    long pos;
};

static Integer ReadInteger(StringParser *m);
static Integer ReadDecimal(StringParser *m);
static Integer ReadHex(StringParser *m);
static string *ReadCharOrEscape(StringParser *m);
static string *ReadBracketedConstants(StringParser *m);
static void SkipWhitespace(StringParser *m);
static void SkipRestOfInteger(StringParser *m, int radix);
noreturn static void RaiseError(const char *format, ...);

// Reads a charmap char or escape sequence.
static string *ReadCharOrEscape(StringParser *m)
{
    string *sequence;

    bool isEscape = (m->buffer[m->pos] == '\\');

    if (isEscape)
    {
        m->pos++;

        if (m->buffer[m->pos] == '"')
        {
            sequence = Charmap_Char(g_charmap, '"');

            if (unlikely(sequence->length == 0))
                RaiseError("no mapping exists for double quote");

            return sequence;
        }
        else if (m->buffer[m->pos] == '\\')
        {
            sequence = Charmap_Char(g_charmap, '\\');

            if (unlikely(sequence->length == 0))
                RaiseError("no mapping exists for backslash");

            return sequence;
        }
    }

    unsigned char c = m->buffer[m->pos];

    if (unlikely(c == 0))
    {
        if (m->pos >= m->size)
            RaiseError("unexpected EOF in UTF-8 string");
        else
            RaiseError("unexpected null character in UTF-8 string");
    }

    if (unlikely(IsAscii(c) && !IsAsciiPrintable(c)))
        RaiseError("unexpected character U+%X in UTF-8 string", c);

    UnicodeChar unicodeChar = DecodeUtf8(&m->buffer[m->pos]);
    m->pos += unicodeChar.encodingLength;
    int32_t code = unicodeChar.code;

    if (unlikely(code == -1))
        RaiseError("invalid encoding in UTF-8 string");

    if (unlikely(isEscape && code >= 128))
        RaiseError("escapes using non-ASCII characters are invalid");

    sequence = isEscape ? Charmap_Escape(g_charmap, code) : Charmap_Char(g_charmap, code);

    if (unlikely(!sequence || sequence->length == 0))
    {
        if (isEscape)
            RaiseError("unknown escape '\\%c'", code);
        else
            RaiseError("unknown character U+%X", code);
    }

    return sequence;
}

// Reads a charmap constant, i.e. "{FOO}".
static string *ReadBracketedConstants(StringParser *m)
{
    string *totalSequence = empty_string();

    m->pos++;  // Assume we're on the left curly bracket.

    while (m->buffer[m->pos] != '}')
    {
        SkipWhitespace(m);

        if (IsIdentifierStartingChar(m->buffer[m->pos]))
        {
            long startPos = m->pos;

            m->pos++;

            while (IsIdentifierChar(m->buffer[m->pos]))
                m->pos++;

            string *tmp = string(&m->buffer[startPos], m->pos - startPos);
            string *sequence = Charmap_Constant(g_charmap, tmp);

            if (unlikely(sequence->length == 0))
            {
                m->buffer[m->pos] = 0;
                RaiseError("unknown constant '%s'", &m->buffer[startPos]);
            }

            totalSequence = string_add(totalSequence, sequence);
            string_Delete(tmp);
        }
        else if (IsAsciiDigit(m->buffer[m->pos]))
        {
            Integer integer = ReadInteger(m);

            switch (integer.size)
            {
            case 1:
                totalSequence = string_add_char(totalSequence, (uint8_t)integer.value);
                break;
            case 2:
                totalSequence = string_add_char(totalSequence, (uint8_t)integer.value);
                totalSequence = string_add_char(totalSequence, (uint8_t)(integer.value >> 8));
                break;
            case 4:
                totalSequence = string_add_char(totalSequence, (uint8_t)integer.value);
                totalSequence = string_add_char(totalSequence, (uint8_t)(integer.value >> 8));
                totalSequence = string_add_char(totalSequence, (uint8_t)(integer.value >> 16));
                totalSequence = string_add_char(totalSequence, (uint8_t)(integer.value >> 24));
                break;
            default:
                RaiseError("integer has an invalid size of %d!\n", integer.size);
                break;
            }
        }
        else if (unlikely(m->buffer[m->pos] == 0))
        {
            if (m->pos >= m->size)
                RaiseError("unexpected EOF after left curly bracket");
            else
                RaiseError("unexpected null character within curly brackets");
        }
        else
        {
            if (IsAsciiPrintable(m->buffer[m->pos]))
                RaiseError("unexpected character '%c' within curly brackets", m->buffer[m->pos]);
            else
                RaiseError("unexpected character '\\x%02X' within curly brackets",
                           m->buffer[m->pos]);
        }
    }

    m->pos++;  // Go past the right curly bracket.

    return totalSequence;
}

// Reads a charmap string.
int StringParser_ParseString(StringParser *r m, long srcPos, unsigned char *r dest,
                             int *r destLength)
{
    *destLength = 0;

    m->pos = srcPos;

    if (unlikely(m->buffer[m->pos] != '"'))
        RaiseError("expected UTF-8 string literal");

    long start = m->pos;

    m->pos++;

    while (m->buffer[m->pos] != '"')
    {
        string *sequence
            = (m->buffer[m->pos] == '{') ? ReadBracketedConstants(m) : ReadCharOrEscape(m);

        if (unlikely((*destLength) + sequence->length > kMaxStringLength))
            RaiseError("mapped string longer than %d bytes", kMaxStringLength);

        memcpy(&dest[*destLength], sequence->c_str, sequence->length);
        *destLength += sequence->length;
    }

    m->pos++;  // Go past the right quote.

    return m->pos - start;
}

noreturn static void RaiseError(const char *format, ...)
{
    const int bufferSize = 1024;
    char buffer[bufferSize];

    va_list args;
    va_start(args, format);
    vsnprintf(buffer, bufferSize, format, args);
    va_end(args);

    FATAL_ERROR("StringParser: %s\n", buffer);
}

// Converts digit character to numerical value.
static int ConvertDigit(signed char c, int radix)
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

static void SkipRestOfInteger(StringParser *m, int radix)
{
    while (ConvertDigit(m->buffer[m->pos], radix) != -1)
        m->pos++;
}

static Integer ReadDecimal(StringParser *m)
{
    const int radix = 10;
    uint64_t n = 0;
    int digit;
    uint64_t max = UINT32_MAX;
    long startPos = m->pos;

    while ((digit = ConvertDigit(m->buffer[m->pos], radix)) != -1)
    {
        n = n * radix + digit;

        if (unlikely(n >= max))
        {
            SkipRestOfInteger(m, radix);

            string *intLiteral = string(m->buffer + startPos, m->pos - startPos);
            RaiseError("integer literal \"%s\" is too large", intLiteral->c_str);
            string_Delete(intLiteral);
        }

        m->pos++;
    }

    int size;

    if (m->buffer[m->pos] == 'H')
    {
        if (unlikely(n >= 0x10000))
        {
            RaiseError("%lu is too large to be a halfword", (unsigned long)n);
        }

        size = 2;
        m->pos++;
    }
    else if (m->buffer[m->pos] == 'W')
    {
        size = 4;
        m->pos++;
    }
    else
    {
        if (n >= 0x10000)
            size = 4;
        else if (n >= 0x100)
            size = 2;
        else
            size = 1;
    }

    return (Integer){ (uint32_t)n, size };
}

static Integer ReadHex(StringParser *m)
{
    const int radix = 16;
    uint64_t n = 0;
    int digit;
    uint64_t max = UINT32_MAX;
    long startPos = m->pos;

    while ((digit = ConvertDigit(m->buffer[m->pos], radix)) != -1)
    {
        n = n * radix + digit;

        if (unlikely(n >= max))
        {
            SkipRestOfInteger(m, radix);

            string *intLiteral = string(m->buffer + startPos, m->pos - startPos);
            RaiseError("integer literal \"%s\" is too large", intLiteral->c_str);
            string_Delete(intLiteral);
        }

        m->pos++;
    }

    int length = m->pos - startPos;
    int size = 0;

    switch (length)
    {
    case 2:
        size = 1;
        break;
    case 4:
        size = 2;
        break;
    case 8:
        size = 4;
        break;
    default:
    {
        string *intLiteral = string(m->buffer + startPos, m->pos - startPos);
        RaiseError("hex integer literal \"0x%s\" doesn't have length of 2, 4, or 8 digits",
                   intLiteral->c_str);
        string_Delete(intLiteral);
    }
    }

    return (Integer){ (uint32_t)n, size };
}

static Integer ReadInteger(StringParser *m)
{
    if (unlikely(!IsAsciiDigit(m->buffer[m->pos])))
        RaiseError("expected integer");

    if (m->buffer[m->pos] == '0' && m->buffer[m->pos + 1] == 'x')
    {
        m->pos += 2;
        return ReadHex(m);
    }

    return ReadDecimal(m);
}

// Skips tabs and spaces.
static void SkipWhitespace(StringParser *m)
{
    while (m->buffer[m->pos] == '\t' || m->buffer[m->pos] == ' ')
        m->pos++;
}

void StringParser_Delete(StringParser *m) { free(m); }

StringParser *StringParser_New(char *buf, long size)
{
    StringParser *m = (StringParser *)malloc(sizeof(StringParser));
    m->buffer = buf;
    m->size = size;
    m->pos = 0;

    return m;
}
