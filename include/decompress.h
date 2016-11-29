#ifndef GUARD_DECOMPRESS_H
#define GUARD_DECOMPRESS_H

#include "sprite.h"

void sub_800D238(const void *src, void *dest);
void LZDecompressVram(const void *src, void *dest);
void LoadCompressedObjectPic(const struct SpriteSheet *a);
void LoadCompressedObjectPicOverrideBuffer(const struct SpriteSheet *a, void *buffer);
void LoadCompressedObjectPalette(const struct SpritePalette *a);
void LoadCompressedObjectPaletteOverrideBuffer(const struct SpritePalette *a, void *buffer);
void DecompressPicFromTable_2(const struct SpriteSheet *a, u8 b, u8 c, void *d, void *e, s32 f);
void sub_800D334(const struct SpriteSheet *a, u32 b, u32 c, u32 d, void *dest, s32 f, u32 g);
void sub_800D378(const struct SpriteSheet *a, u32 b, u32 c, u32 d, void *dest, s32 f, u32 g, u32 h);

#endif // GUARD_DECOMPRESS_H
