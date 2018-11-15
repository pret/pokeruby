// Copyright (c) 2015 YamaArashi

#ifndef UTIL_H
#define UTIL_H

#include <stdbool.h>

bool ParseNumber(const char *s, char **end, int radix, int *intValue);
const char *GetFileExtension(const char *path);
unsigned char *ReadWholeFile(const char *path, int *size);
unsigned char *ReadWholeFileZeroPadded(const char *path, int *size, int padAmount);
void WriteWholeFile(const char *path, void *buffer, int bufferSize);

#endif // UTIL_H
