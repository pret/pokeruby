#include "global.h"
#include "decompress.h"
#include "palette.h"

struct UnknownStruct2
{
    void *src;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u16 unk8;
};

struct UnknownStruct3
{
    u16 *paletteSrc;
    u8 unk4;
    u8 paletteCount;
};

struct UnknownStruct1
{
    u8 paletteNum;
    u8 unk1;
    u16 unk2;
    u8 *dest;
    struct UnknownStruct3 unk8[16];
    struct UnknownStruct2 unk88[32];
};

void unref_sub_8124F94(struct UnknownStruct1 *a)
{
    a->unk1 = 0;
    a->paletteNum = 0;
    a->unk2 = 0;
    a->dest = (void *)VRAM;
    DmaFill16(3, 0, a->unk8, sizeof(a->unk8));
    DmaFill16(3, 0, a->unk88, sizeof(a->unk88));
}

u8 unref_sub_8124FD8(struct UnknownStruct1 *a, const struct UnknownStruct2 *b)
{
    while (1)
    {
        s32 r6;
        s32 temp;

        // Couldn't get it to match any other way
        if (a->unk1 < 32 && b->src == NULL)
            return 0;
        if (a->unk1 >= 32)
            break;

        a->unk88[a->unk1].src = b->src;
        a->unk88[a->unk1].unk6 = b->unk6;
        a->unk88[a->unk1].unk4 = b->unk4;
        a->unk88[a->unk1].unk5 = b->unk5;
        r6 = b->unk4 * b->unk5;
        if (a->unk2 + r6 > 0x400)
            return 2;
        if (b->unk8 == 0)
        {
            DmaCopy16(3, b->src, a->dest + a->unk2 * 64, r6 * 32);
        }
        else
        {
            LZDecompressWram(b->src, a->dest + a->unk2 * 64);
        }
        a->unk88[a->unk1].unk8 = a->unk2;
        temp = r6 + a->unk2;
        a->unk2 = temp;
        a->unk1++;
        b++;
    }
    return 1;
}

u8 unref_sub_81250A4(struct UnknownStruct1 *a, struct UnknownStruct3 *b)
{
    while (1)
    {
        // Couldn't get it to match any other way
        if (a->paletteNum < 16 && b->paletteSrc == NULL)
            return 0;
        if (a->paletteNum >= 16)
            break;

        a->unk8[a->paletteNum].paletteSrc = b->paletteSrc;
        a->unk8[a->paletteNum].unk4 = b->unk4;
        if (b->paletteCount == 0)
        {
            LoadPalette(b->paletteSrc, a->paletteNum * 16, 32);
        }
        else
        {
            u16 palette[16];

            LZDecompressWram(b->paletteSrc, palette);
            LoadPalette(palette, a->paletteNum * 16, 32);
        }
        a->unk8[a->paletteNum].paletteCount = a->paletteNum;
        a->paletteNum = a->paletteNum + 1;
        b++;
    }
    return 1;
}

u8 unref_sub_8125118(struct UnknownStruct1 *a, struct UnknownStruct3 *b)
{
    u16 palettes[16][16] = {0};
    u8 r7 = b->paletteCount;
    u8 i;

    LZDecompressWram(b->paletteSrc, palettes);
    for (i = a->paletteNum; i < r7; i++)
    {
        if (a->paletteNum + i >= 16)
            return 1;
        a->unk8[i].paletteSrc = b->paletteSrc;
        a->unk8[i].unk4 = b->unk4 + i;
        a->unk8[i].paletteCount = a->paletteNum;
        LoadPalette(palettes[i], a->paletteNum * 16, sizeof(palettes[i]));
        a->paletteNum++;
    }
    return 0;
}
