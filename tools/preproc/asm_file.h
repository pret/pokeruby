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
#include "my_string.h"

typedef enum Directive
{
    Directive_Include,
    Directive_String,
    Directive_Braille,
    Directive_Unknown
} Directive;

struct AsmFile;
typedef struct AsmFile AsmFile;

AsmFile *AsmFile_New(string *filename, string *data);
void AsmFile_Delete(AsmFile *m);
Directive AsmFile_GetDirective(AsmFile *m);
string *AsmFile_GetGlobalLabel(AsmFile *m);
string *AsmFile_ReadPath(AsmFile *m);
int AsmFile_ReadString(AsmFile *r m, unsigned char *r s);
int AsmFile_ReadBraille(AsmFile *r m, unsigned char *r s);
bool AsmFile_IsAtEnd(AsmFile *m);
void AsmFile_OutputLine(AsmFile *m);
void AsmFile_OutputLocation(AsmFile *m);

#endif  // ASM_FILE_H
