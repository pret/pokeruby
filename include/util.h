#ifndef GUARD_UTIL_H
#define GUARD_UTIL_H

#include "sprite.h"

extern const u8 gMiscBlank_Gfx[];
extern const u32 gBitTable[];

u8 CreateInvisibleSpriteWithCallback(void (*)(struct Sprite *));
void StoreWordInTwoHalfwords(u16 *, u32);
void LoadWordFromTwoHalfwords(u16 *, u32 *);

#endif // GUARD_UTIL_H
