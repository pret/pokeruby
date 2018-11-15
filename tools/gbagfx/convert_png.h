// Copyright (c) 2015 YamaArashi

#ifndef CONVERT_PNG_H
#define CONVERT_PNG_H

#include "gfx.h"

void ReadPng(const char *path, struct Image *image);
void WritePng(const char *path, struct Image *image);
void ReadPngPalette(const char *path, struct Palette *palette);

#endif // CONVERT_PNG_H
