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

#include "my_string.h"
#include "hash_map.h"

typedef struct Charmap
{
    HashMap *chars;
    string *escapes[128];
    HashMap *constants;
} Charmap;

string *Charmap_Char(Charmap *m, int32_t code);

inline static string *Charmap_Escape(Charmap *m, uint8_t code) { return m->escapes[code]; }

string *Charmap_Constant(Charmap *r m, const string *r identifier);

Charmap *Charmap_New(char *filename);
void Charmap_Delete(Charmap *m);

#endif  // CHARMAP_H
