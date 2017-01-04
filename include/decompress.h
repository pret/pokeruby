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
void HandleLoadSpecialPokePic(const struct SpriteSheet *spriteSheet, u32 b, u32 c, u32 d, void *dest, s32 species, u32 g);
void LoadSpecialPokePic(const struct SpriteSheet *spriteSheet, u32 b, u32 c, u32 d, void *dest, s32 species, u32 g, u32 h);
void Unused_LZDecompressWramIndirect(const void **src, void *dest);

#endif // GUARD_DECOMPRESS_H
