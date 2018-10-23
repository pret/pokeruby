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
    const char *buffer;
    long size;
    long pos;
};

static Integer ReadInteger(StringParser *m);
static Integer ReadDecimal(StringParser *m);
static Integer ReadHex(StringParser *m);
static char *ReadCharOrEscape(StringParser *m, uint32_t *len);
static char *ReadBracketedConstants(StringParser *m, uint32_t *len);
static void SkipWhitespace(StringParser *m);
static void SkipRestOfInteger(StringParser *m, int radix);
no_return static void RaiseError(const StringParser *const restrict m, const char *format, ...);

// Reads a charmap char or escape sequence.
static char *ReadCharOrEscape(StringParser *m, uint32_t *len)
{
    const char *sequence;
    unsigned char c;
    bool isEscape = (m->buffer[m->pos] == '\\');
    UnicodeChar unicodeChar;
    int32_t code;

    if (isEscape)
    {
        m->pos++;

        if (m->buffer[m->pos] == '"' || m->buffer[m->pos] == '\\')
        {
            sequence = Charmap_Char(g_charmap, m->buffer[m->pos], len);

            if (unlikely(sequence == NULL || *len == 0))
                RaiseError(m, "no mapping exists for %s",
                               (m->buffer[m->pos] == '"') ? "double quote" : "backslash");

            return (char *)sequence;
        }
    }

    c = m->buffer[m->pos];

    if (unlikely(c == 0))
    {
        if (m->pos >= m->size)
            RaiseError(m, "unexpected EOF in UTF-8 string");
        else
            RaiseError(m, "unexpected null character in UTF-8 string");
    }

    if (unlikely(IsAscii(c) && !IsAsciiPrintable(c)))
        RaiseError(m, "unexpected character U+%X in UTF-8 string", c);

    unicodeChar = DecodeUtf8(&m->buffer[m->pos]);
    m->pos += unicodeChar.encodingLength;
    code = unicodeChar.code;

    if (unlikely(code == -1))
        RaiseError(m, "invalid encoding in UTF-8 string");

    if (unlikely(isEscape && code >= 128))
        RaiseError(m, "escapes using non-ASCII characters are invalid");

    if (isEscape)
    {
        sequence = Charmap_Escape(g_charmap, code, len);
    }
    else
    {
        sequence = Charmap_Char(g_charmap, code, len);
    }

    if (unlikely(sequence == NULL || (!isEscape && *len == 0)))
    {
        if (isEscape)
            RaiseError(m, "unknown escape '\\%c'", code);
        else
            RaiseError(m, "unknown character U+%X", code);
    }

    return (char *)sequence;
}

// Reads a charmap constant, i.e. "{FOO}".
static char *ReadBracketedConstants(StringParser *m, uint32_t *len)
{
    char *totalSequence = (char *)calloc(1, 8);
    size_t i = 0;
    size_t max = 8;

    m->pos++;  // Assume we're on the left curly bracket.

    while (m->buffer[m->pos] != '}')
    {
        SkipWhitespace(m);

        if (IsIdentifierStartingChar(m->buffer[m->pos]))
        {
            long startPos = m->pos;
            char *tmp;
            uint32_t tmpLen;
            const char *sequence;

            m->pos++;

            while (IsIdentifierChar(m->buffer[m->pos]))
                m->pos++;

            tmp = (char *)alloca(m->pos - startPos + 1);
            memcpy(tmp, &m->buffer[startPos], m->pos - startPos);
            tmp[m->pos - startPos] = '\0';

            tmpLen = 0;
            sequence = Charmap_Constant(g_charmap, tmp, &tmpLen);

            if (unlikely(sequence == NULL || tmpLen == 0))
            {
                RaiseError(m, "unknown constant '%s'", &m->buffer[startPos]);
            }
            if (tmpLen + 1 + i >= max)
            {
                totalSequence = (char *)realloc(totalSequence, max + tmpLen + 1);

                if (totalSequence == NULL)
                    FATAL_ERROR("Failed to realloc");

                max += tmpLen;
            }

            memcpy((char *)&totalSequence[i], sequence, tmpLen);
            i += tmpLen;
        }
        else if (IsAsciiDigit(m->buffer[m->pos]))
        {
            Integer integer = ReadInteger(m);
            if (integer.size + i + 1 >= max)
            {
                totalSequence = (char *)realloc(totalSequence, max + integer.size + max + 1);

                if (totalSequence == NULL)
                    FATAL_ERROR("Failed to realloc");

                max += integer.size;
            }

            switch (integer.size)
            {
            case 1:
                totalSequence[i++] = (uint8_t)(integer.value);
                break;
            case 2:
                totalSequence[i++] = (uint8_t)(integer.value);
                totalSequence[i++] = (uint8_t)(integer.value >> 8);
                break;
            case 4:
                totalSequence[i++] = (uint8_t)(integer.value);
                totalSequence[i++] = (uint8_t)(integer.value >> 8);
                totalSequence[i++] = (uint8_t)(integer.value >> 16);
                totalSequence[i++] = (uint8_t)(integer.value >> 24);
                break;
            default:
                RaiseError(m, "integer has an invalid size of %d!\n", integer.size);
                break;
            }
        }
        else if (unlikely(m->buffer[m->pos] == 0))
        {
            if (m->pos >= m->size)
                RaiseError(m, "unexpected EOF after left curly bracket");
            else
                RaiseError(m, "unexpected null character within curly brackets");
        }
        else
        {
            if (IsAsciiPrintable(m->buffer[m->pos]))
                RaiseError(m, "unexpected character '%c' within curly brackets", m->buffer[m->pos]);
            else
                RaiseError(m, "unexpected character '\\x%02X' within curly brackets",
                           m->buffer[m->pos]);
        }
    }

    m->pos++;  // Go past the right curly bracket.
    *len = i;
    return totalSequence;
}

// Reads a charmap string.
int StringParser_ParseString(StringParser *restrict m, long srcPos, unsigned char *restrict dest,
                             int *restrict destLength)
{
    long start;

    *destLength = 0;

    m->pos = srcPos;

    if (unlikely(m->buffer[m->pos] != '"'))
        RaiseError(m, "expected UTF-8 string literal");

    start = m->pos;

    m->pos++;

    while (m->buffer[m->pos] != '"')
    {
        uint32_t len = 0;
        bool bracketed = m->buffer[m->pos] == '{';
        const char *sequence = (bracketed) ? ReadBracketedConstants(m, &len) : ReadCharOrEscape(m, &len);

        if (unlikely((*destLength) + len > kMaxStringLength))
            RaiseError(m, "mapped string longer than %d bytes", kMaxStringLength);

        memcpy(&dest[*destLength], sequence, len);
        *destLength += len;
        if (bracketed)
            free((char *)sequence);
    }

    m->pos++;  // Go past the right quote.

    return m->pos - start;
}

no_return static void RaiseError(const StringParser *const restrict m, const char *format, ...)
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
    int size;

    while ((digit = ConvertDigit(m->buffer[m->pos], radix)) != -1)
    {
        n = n * radix + digit;

        if (unlikely(n >= max))
        {
            SkipRestOfInteger(m, radix);

            RaiseError(m, "integer literal \"%.*s\" is too large", (int)(m->pos - startPos), m->buffer + startPos);
        }

        m->pos++;
    }

    if (m->buffer[m->pos] == 'H')
    {
        if (unlikely(n >= 0x10000))
        {
            RaiseError(m, "%lu is too large to be a halfword", (unsigned long)n);
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
    int digit, length, size;
    uint64_t max = UINT32_MAX;
    long startPos = m->pos;

    while ((digit = ConvertDigit(m->buffer[m->pos], radix)) != -1)
    {
        n = n * radix + digit;

        if (unlikely(n >= max))
        {
            SkipRestOfInteger(m, radix);

            RaiseError(m, "integer literal \"%.*s\" is too large", (int)(m->pos - startPos), m->buffer + startPos);
        }

        m->pos++;
    }

    length = m->pos - startPos;
    size = 0;

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
        RaiseError(m, "hex integer literal \"0x%.*s\" doesn't have length of 2, 4, or 8 digits",
                   (int)(m->pos - startPos), m->buffer + startPos);
    }

    return (Integer){ (uint32_t)n, size };
}

static Integer ReadInteger(StringParser *m)
{
    if (unlikely(!IsAsciiDigit(m->buffer[m->pos])))
        RaiseError(m, "expected integer");

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
    //while (m->buffer[m->pos] == '\t' || m->buffer[m->pos] == ' ')
    //    m->pos++;
    m->pos += strspn(&m->buffer[m->pos], "\t ");
}

void StringParser_Delete(StringParser *m) { free(m); }

StringParser *StringParser_New(const char *const buf, long size)
{
    StringParser *m = (StringParser *)malloc(sizeof(StringParser));
    m->buffer = buf;
    m->size = size;
    m->pos = 0;

    return m;
}
