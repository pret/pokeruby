// Copyright (c) 2015 YamaArashi

#ifndef FONT_H
#define FONT_H

#include <stdbool.h>
#include "gfx.h"

void ReadLatinFont(const char *path, struct Image *image);
void WriteLatinFont(const char *path, struct Image *image);
void ReadHalfwidthJapaneseFont(const char *path, struct Image *image);
void WriteHalfwidthJapaneseFont(const char *path, struct Image *image);
void ReadFullwidthJapaneseFont(const char *path, struct Image *image);
void WriteFullwidthJapaneseFont(const char *path, struct Image *image);

#endif // FONT_H
