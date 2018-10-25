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

#ifndef ASM_FILE_H
#define ASM_FILE_H

#include "preproc.h"

#include <stdarg.h>
#include <stdint.h>
#include <stdbool.h>

typedef enum Directive
{
    Directive_Include,
    Directive_String,
    Directive_Braille,
    Directive_Unknown
} Directive;

struct AsmFile;
typedef struct AsmFile AsmFile;

AsmFile *AsmFile_New(const char *restrict filename);
void AsmFile_Delete(AsmFile *const restrict m);
Directive AsmFile_GetDirective(AsmFile *const restrict m);
char *AsmFile_GetGlobalLabel(AsmFile *const restrict m);
char *AsmFile_ReadPath(AsmFile *const restrict m);
int AsmFile_ReadString(AsmFile *const restrict m, unsigned char *const restrict s);
int AsmFile_ReadBraille(AsmFile *const restrict m, unsigned char *const restrict s);
__attribute__((__pure__)) bool AsmFile_IsAtEnd(const AsmFile *const restrict m);
void AsmFile_OutputLine(AsmFile *const restrict m);
void AsmFile_OutputLocation(const AsmFile *const restrict m);

#endif  // ASM_FILE_H

