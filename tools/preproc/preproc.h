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

#ifndef PREPROC_H
#define PREPROC_H

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define kMaxPath 256
#define kMaxStringLength 1024
#define kMaxCharmapSequenceLength 16

struct Charmap;
extern struct Charmap *g_charmap;
extern FILE *g_file;
extern bool g_lines;

#ifdef __cplusplus
#define restrict __restrict
#endif

#ifndef no_return
#ifdef __cplusplus
#define no_return [[noreturn]]
#else
#if __STDC_VERSION__ >= 201112L
#define no_return _Noreturn
#elif defined(__GNUC__)
#define no_return __attribute__((__noreturn__))
#else
#define no_return
#endif
#endif
#endif

#if defined(__GNUC__) || defined(__clang__)
#define likely(x) __builtin_expect(!!(x), 1)
#define unlikely(x) __builtin_expect(!!(x), 0)
#define unlikely_else else if (__builtin_expect(1, 0))
#define printf_fn(x, y) __attribute__((__format__(printf, x, y)))
#else
#define likely(x) (x)
#define unlikely(x) (x)
#define unlikely_else else
#define printf_fn(x, y)
#endif

#ifdef _MSC_VER

#define FATAL_ERROR(format, ...)                                                                   \
    do                                                                                             \
    {                                                                                              \
        fprintf(stderr, format, __VA_ARGS__);                                                      \
        exit(1);                                                                                   \
    } while (0)

#else
#define FATAL_ERROR(...)                                                                           \
    do                                                                                             \
    {                                                                                              \
        fprintf(stderr, __VA_ARGS__);                                                              \
        exit(1);                                                                                   \
    } while (0)

#endif  // _MSC_VER

#endif  // PREPROC_H
