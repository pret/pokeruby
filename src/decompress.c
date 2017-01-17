#include "global.h"
#include "decompress.h"
#include "asm.h"
#include "species.h"
#include "text.h"

#define WRAM 0x02000000

extern struct SpriteSheet gMonFrontPicTable[];
extern struct SpriteSheet gMonBackPicTable[];
extern void *gUnknown_081FAF4C[];

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

void DecompressPicFromTable_2(const struct SpriteSheet *a, u8 b, u8 c, void *d, void *e, s32 species)
{
    if (species > SPECIES_EGG)
        LZ77UnCompWram(gMonFrontPicTable[0].data, e);
    else
        LZ77UnCompWram(a->data, e);
}

void HandleLoadSpecialPokePic(const struct SpriteSheet *spriteSheet, u32 b, u32 c, u32 d, void *dest, s32 species, u32 g)
{
    u32 frontOrBack;
    
	// gUnknown_081FAF4C appears to be a list of pointers to locations to store poke pics for back and front pic here. the first and third pointers are used for back while the others are used for front.
    if (dest == gUnknown_081FAF4C[0] || dest == gUnknown_081FAF4C[2])
        frontOrBack = 0; // backPic
    else
        frontOrBack = 1; // frontPic

    LoadSpecialPokePic(spriteSheet, b, c, d, dest, species, g, frontOrBack);
}

void LoadSpecialPokePic(const struct SpriteSheet *spriteSheet, u32 b, u32 c, u32 d, void *dest, s32 species, u32 g, u32 frontOrBack)
{
    u8 frontOrBack8 = frontOrBack;
    
    if (species == SPECIES_UNOWN)
    {
        u16 i = (((g & 0x3000000) >> 18) | ((g & 0x30000) >> 12) | ((g & 0x300) >> 6) | (g & 3)) % 0x1C;
        
		// if it is Unown A, set the index to where Unown begins, otherwise add the egg index to get the correct letter to load.
        if (i == 0)
            i = SPECIES_UNOWN;
        else
            i += SPECIES_EGG;

        if (frontOrBack8 == 0)
            LZ77UnCompWram(gMonBackPicTable[i].data, dest);
        else
            LZ77UnCompWram(gMonFrontPicTable[i].data, dest);
    }
    else if (species > SPECIES_EGG) // is species unknown? draw the ? icon
        LZ77UnCompWram(gMonFrontPicTable[0].data, dest);
    else
        LZ77UnCompWram(spriteSheet->data, dest);

    DrawSpindaSpots(species, g, dest, frontOrBack8);
}

void Unused_LZDecompressWramIndirect(const void **src, void *dest)
{
    LZ77UnCompWram(*src, dest);
}
