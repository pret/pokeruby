#include "global.h"
#include "decompress.h"
#include "data2.h"
#include "constants/species.h"
#include "text.h"
#include "ewram.h"

#define WRAM ewram_addr // using gSharedMem doesn't match

void LZDecompressWram(const void *src, void *dest)
{
    LZ77UnCompWram(src, dest);
}

void LZDecompressVram(const void *src, void *dest)
{
    LZ77UnCompVram(src, dest);
}

void LoadCompressedObjectPic(const struct CompressedSpriteSheet *src)
{
    struct SpriteSheet dest;

    LZ77UnCompWram(src->data, (void *)WRAM);
    dest.data = (void *)WRAM;
    dest.size = src->size;
    dest.tag = src->tag;
    LoadSpriteSheet(&dest);
}

void LoadCompressedObjectPicOverrideBuffer(const struct CompressedSpriteSheet *src, void *buffer)
{
    struct SpriteSheet dest;

    LZ77UnCompWram(src->data, buffer);
    dest.data = buffer;
    dest.size = src->size;
    dest.tag = src->tag;
    LoadSpriteSheet(&dest);
}

void LoadCompressedObjectPalette(const struct CompressedSpritePalette *src)
{
    struct SpritePalette dest;

    LZ77UnCompWram(src->data, (void *)WRAM);
    dest.data = (void *)WRAM;
    dest.tag = src->tag;
    LoadSpritePalette(&dest);
}

void LoadCompressedObjectPaletteOverrideBuffer(const struct CompressedSpritePalette *src, void *buffer)
{
    struct SpritePalette dest;

    LZ77UnCompWram(src->data, buffer);
    dest.data = buffer;
    dest.tag = src->tag;
    LoadSpritePalette(&dest);
}

void DecompressPicFromTable_2(const struct CompressedSpriteSheet *src, u8 coords, u8 y_offset, void *d, void *dest, s32 species)
{
    if (species > SPECIES_EGG)
        LZ77UnCompWram(gMonFrontPicTable[0].data, dest);
    else
        LZ77UnCompWram(src->data, dest);
}

void HandleLoadSpecialPokePic(const struct CompressedSpriteSheet *src, u32 coords, u32 y_offset, u32 d, void *dest, s32 species, u32 pid)
{
    u32 frontOrBack;

    // gUnknown_081FAF4C appears to be a list of pointers to locations to store poke pics for back and front pic here. the first and third pointers are used for back while the others are used for front.
    if (dest == gUnknown_081FAF4C[0] || dest == gUnknown_081FAF4C[2])
        frontOrBack = 0; // backPic
    else
        frontOrBack = 1; // frontPic

    LoadSpecialPokePic(src, coords, y_offset, d, dest, species, pid, frontOrBack);
}

void LoadSpecialPokePic(const struct CompressedSpriteSheet *src, u32 b, u32 c, u32 d, void *dest, s32 species, u32 pid, u32 frontOrBack)
{
    u8 frontOrBack8 = frontOrBack;

    if (species == SPECIES_UNOWN)
    {
        u16 i = (((pid & 0x3000000) >> 18) | ((pid & 0x30000) >> 12) | ((pid & 0x300) >> 6) | (pid & 3)) % 0x1C;

        // The other Unowns are separate from Unown A.
        if (i == 0)
            i = SPECIES_UNOWN;
        else
            i += SPECIES_UNOWN_B - 1;

        if (frontOrBack8 == 0)
            LZ77UnCompWram(gMonBackPicTable[i].data, dest);
        else
            LZ77UnCompWram(gMonFrontPicTable[i].data, dest);
    }
    else if (species > SPECIES_EGG) // is species unknown? draw the ? icon
        LZ77UnCompWram(gMonFrontPicTable[0].data, dest);
    else
        LZ77UnCompWram(src->data, dest);

    DrawSpindaSpots(species, pid, dest, frontOrBack8);
}

void Unused_LZDecompressWramIndirect(const void **src, void *dest)
{
    LZ77UnCompWram(*src, dest);
}
