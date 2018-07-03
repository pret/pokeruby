#ifndef GUARD_DECOMPRESS_H
#define GUARD_DECOMPRESS_H

#include "sprite.h"

void LZDecompressWram(const void *src, void *dest);
void LZDecompressVram(const void *src, void *dest);
void LoadCompressedObjectPic(const struct CompressedSpriteSheet *src);
void LoadCompressedObjectPicOverrideBuffer(const struct CompressedSpriteSheet *src, void *buffer);
void LoadCompressedObjectPalette(const struct CompressedSpritePalette *src);
void LoadCompressedObjectPaletteOverrideBuffer(const struct CompressedSpritePalette *src, void *buffer);
void DecompressPicFromTable_2(const struct CompressedSpriteSheet *a, u8 coords, u8 y_offset, void *d, void *dest, s32 species);
void HandleLoadSpecialPokePic(const struct CompressedSpriteSheet *spriteSheet, u32 coords, u32 y_offset, u32 d, void *dest, s32 species, u32 pid);
void LoadSpecialPokePic(const struct CompressedSpriteSheet *spriteSheet, u32 coords, u32 y_offset, u32 d, void *dest, s32 species, u32 pid, u32 frontOrBack);
void Unused_LZDecompressWramIndirect(const void **src, void *dest);

#endif // GUARD_DECOMPRESS_H
