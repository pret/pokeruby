#include "decompress.h"
#include "global.h"
#include "species.h"

#define WRAM 0x02000000

extern struct SpriteSheet gMonFrontPicTable[];
extern struct SpriteSheet gMonBackPicTable[];
extern void *gUnknown_081FAF4C[];

extern void DrawSpindaSpots(u16, u32, void *, u8);

void sub_800D238(const void *src, void *dest)
{
    LZ77UnCompWram(src, dest);
}

void LZDecompressVram(const void *src, void *dest)
{
    LZ77UnCompVram(src, dest);
}

void LoadCompressedObjectPic(const struct SpriteSheet *a)
{
    struct SpriteSheet spriteSheet;
    
    LZ77UnCompWram(a->data, (void *)WRAM);
    spriteSheet.data = (void *)WRAM;
    spriteSheet.size = a->size;
    spriteSheet.tag = a->tag;
    LoadSpriteSheet(&spriteSheet);
}

void LoadCompressedObjectPicOverrideBuffer(const struct SpriteSheet *a, void *buffer)
{
    struct SpriteSheet spriteSheet;
    
    LZ77UnCompWram(a->data, buffer);
    spriteSheet.data = buffer;
    spriteSheet.size = a->size;
    spriteSheet.tag = a->tag;
    LoadSpriteSheet(&spriteSheet);
}

void LoadCompressedObjectPalette(const struct SpritePalette *a)
{
    struct SpritePalette spritePalette;
    
    LZ77UnCompWram(a->data, (void *)WRAM);
    spritePalette.data = (void *)WRAM;
    spritePalette.tag = a->tag;
    LoadSpritePalette(&spritePalette);
}

void LoadCompressedObjectPaletteOverrideBuffer(const struct SpritePalette *a, void *buffer)
{
    struct SpritePalette spritePalette;
    
    LZ77UnCompWram(a->data, buffer);
    spritePalette.data = buffer;
    spritePalette.tag = a->tag;
    LoadSpritePalette(&spritePalette);
}

void DecompressPicFromTable_2(const struct SpriteSheet *a, u8 b, u8 c, void *d, void *e, s32 f)
{
    if (f > 412)
        LZ77UnCompWram(gMonFrontPicTable[0].data, e);
    else
        LZ77UnCompWram(a->data, e);
}

void sub_800D334(const struct SpriteSheet *a, u32 b, u32 c, u32 d, void *dest, s32 f, u32 g)
{
    u32 unk;
    
    if (dest == gUnknown_081FAF4C[0] || dest == gUnknown_081FAF4C[2])
        unk = 0;
    else
        unk = 1;
    sub_800D378(a, b, c, d, dest, f, g, unk);
}

void sub_800D378(const struct SpriteSheet *a, u32 b, u32 c, u32 d, void *dest, s32 f, u32 g, u32 h)
{
    u8 r7 = h;
    
    if (f == SPECIES_UNOWN)
    {
        u16 r1 = (((g & 0x3000000) >> 18) | ((g & 0x30000) >> 12) | ((g & 0x300) >> 6) | (g & 3)) % 0x1C;
        
        if (r1 == 0)
            r1 = SPECIES_UNOWN;
        else
            r1 += 412;
        if (r7 == 0)
            LZ77UnCompWram(gMonBackPicTable[r1].data, dest);
        else
            LZ77UnCompWram(gMonFrontPicTable[r1].data, dest);
    }
    else
    {
        if (f > 412)
            LZ77UnCompWram(gMonFrontPicTable[0].data, dest);
        else
            LZ77UnCompWram(a->data, dest);
    }
    DrawSpindaSpots(f, g, dest, r7);
}

static void Unused_LZDecompressWramIndirect(const void **src, void *dest)
{
    LZ77UnCompWram(*src, dest);
}
