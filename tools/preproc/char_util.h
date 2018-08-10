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

#ifndef CHAR_UTIL_H
#define CHAR_UTIL_H

#include <stdint.h>
#include <stdbool.h>
#include <assert.h>

static inline bool IsAscii(uint8_t c) { return (c < 128u); }

static inline bool IsAsciiAlpha(uint8_t c)
{
    return ((c >= (uint8_t)'A' && c <= (uint8_t)'Z') || (c >= (uint8_t)'a' && c <= (uint8_t)'z'));
}

static inline bool IsAsciiDigit(uint8_t c) { return (c >= (uint8_t)'0' && c <= (uint8_t)'9'); }

static inline bool IsAsciiHexDigit(uint8_t c)
{
    return ((c >= (uint8_t)'0' && c <= (uint8_t)'9') || (c >= (uint8_t)'a' && c <= (uint8_t)'f')
            || (c >= (uint8_t)'A' && c <= (uint8_t)'F'));
}

static inline bool IsAsciiAlphanum(uint8_t c) { return (IsAsciiAlpha(c) || IsAsciiDigit(c)); }

static inline bool IsAsciiPrintable(uint8_t c) { return (c >= (uint8_t)' ' && c <= (uint8_t)'~'); }

// Returns whether the character can start a C identifier or the identifier of a "{FOO}" constant in
// strings.
static inline bool IsIdentifierStartingChar(uint8_t c)
{
    return IsAsciiAlpha(c) || c == (uint8_t)'_';
}

// Returns whether the character can be used in a C identifier or the identifier of a "{FOO}"
// constant in strings.
static inline bool IsIdentifierChar(uint8_t c) { return IsAsciiAlphanum(c) || c == (uint8_t)'_'; }

#endif  // CHAR_UTIL_H
