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

#ifndef CHARMAP_H
#define CHARMAP_H

#include "preproc.h"

#include <stdint.h>

#include "khash.h"

typedef struct CharmapValue
{
    char *str;
    uint32_t len;
} CharmapValue;

KHASH_MAP_INIT_INT(Char, CharmapValue)
KHASH_MAP_INIT_STR(Constant, CharmapValue)

typedef struct Charmap
{
    khash_t(Char) *chars;
    CharmapValue escapes[128];
    khash_t(Constant) *constants;
} Charmap;

const char *Charmap_Char(const Charmap *const restrict m, int32_t code, uint32_t *const restrict len /* output */);
const char *Charmap_Constant(const Charmap *const restrict m, const char *const restrict identifier, uint32_t *const restrict len /* output */);
__attribute__((__pure__)) inline static const char *Charmap_Escape(const Charmap *const restrict m, uint8_t code, uint32_t *const restrict len /* ourput */)
{
    *len = m->escapes[code].len;
    return m->escapes[code].str;
}


__attribute__((__malloc__)) Charmap *Charmap_New(const char *const restrict filename);
void Charmap_Delete(Charmap *const restrict m);

#endif  // CHARMAP_H

