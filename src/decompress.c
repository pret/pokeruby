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

#ifdef NONMATCHING
void unref_sub_800D42C(s32 picSize, s32 numFrames, const u8 * src, u8 * dst)
{
    s32 i, j, k, l;
    if (picSize & 1)
    {
        u8 sp8 = (picSize >> 1) + 4;
        for (i = 0; i < numFrames; i++)
        {
            for (j = 0; j < 8 - picSize; j++)
            {
                for (k = 0; k < 8; k++)
                {
                    for (l = 0; l < 16; l++)
                    {
                        if (j % 2 == 0)
                        {
                            dst[256 * (j >> 1) + 32 * k + l] = 0;
                            dst[256 * (j >> 1) + 256 * sp8 + 32 * k + l + 16] = 0;
                        }
                        else
                        {
                            dst[256 * (j >> 1) + 32 * k + l + 16] = 0;
                            dst[256 * (j >> 1) + 256 * sp8 + 32 * k + l + 256] = 0;
                        }
                    }
                }
            }
            for (j = 0; j < 2; j++)
            {
                for (l = 0; l < 8; l++)
                {
                    for (k = 0; k < 32; k++)
                    {
                        dst[256 * l + 32 * j + k] = 0;
                        dst[256 * l + 32 * (j + 6) + k] = 0;
                    }
                }
            }
            if (picSize == 5)
            {
                dst += 0x120;
            }
            for (j = 0; j < picSize; j++)
            {
                for (k = 0; k < picSize; k++)
                {
                    for (l = 0; l < 4; l++)
                    {
                        dst[4 * l + 18] = src[4 * l + 0];
                        dst[4 * l + 19] = src[4 * l + 1];
                        dst[4 * l + 48] = src[4 * l + 2];
                        dst[4 * l + 49] = src[4 * l + 3];
                        dst[4 * l + 258] = src[4 * l + 16];
                        dst[4 * l + 259] = src[4 * l + 17];
                        dst[4 * l + 288] = src[4 * l + 18];
                        dst[4 * l + 289] = src[4 * l + 19];
                    }
                    src += 32;
                    dst += 32;
                }
                if (picSize == 7)
                    dst += 0x20;
                else if (picSize == 5)
                    dst += 0x60;
            }
            if (picSize == 7)
                dst += 0x100;
            else if (picSize == 5)
                dst += 0x1e0;
        }
    }
    else
    {
        for (l = 0; l < numFrames; l++)
        {
            if (picSize == 6)
            {
                for (k = 0; k < 256; k++)
                {
                    *dst++ = 0;
                }
            }
            for (j = 0; j < picSize; j++)
            {
                if (picSize == 6)
                {
                    for (k = 0; k < 32; k++)
                    {
                        *dst++ = 0;
                    }
                }
                for (k = 0; k < 32 * picSize; k++)
                {
                    *dst++ = *src++;
                }
                if (picSize == 6)
                {
                    for (k = 0; k < 32; k++)
                    {
                        *dst++ = 0;
                    }
                }
            }
            if (picSize == 6)
            {
                for (k = 0; k < 256; k++)
                {
                    *dst++ = 0;
                }
            }
        }
    }
}
#else
NAKED
void unref_sub_800D42C(s32 picSize, s32 numFrames, const u8 * src, u8 * dst)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r10\n"
                "\tmov r6, r9\n"
                "\tmov r5, r8\n"
                "\tpush {r5-r7}\n"
                "\tsub sp, 0x24\n"
                "\tmov r9, r0\n"
                "\tstr r1, [sp]\n"
                "\tstr r2, [sp, 0x4]\n"
                "\tadds r5, r3, 0\n"
                "\tmovs r0, 0x1\n"
                "\tmov r1, r9\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbne _0800D44C\n"
                "\tb _0800D5E4\n"
                "_0800D44C:\n"
                "\tasrs r0, r1, 1\n"
                "\tadds r0, 0x4\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tstr r0, [sp, 0x8]\n"
                "\tmovs r0, 0\n"
                "\tldr r2, [sp]\n"
                "\tcmp r0, r2\n"
                "\tblt _0800D460\n"
                "\tb _0800D674\n"
                "_0800D460:\n"
                "\tmovs r4, 0x8\n"
                "\tsubs r1, r4, r1\n"
                "\tstr r1, [sp, 0x10]\n"
                "_0800D466:\n"
                "\tmovs r7, 0\n"
                "\tadds r0, 0x1\n"
                "\tstr r0, [sp, 0x14]\n"
                "\tldr r0, [sp, 0x10]\n"
                "\tcmp r7, r0\n"
                "\tbge _0800D4E2\n"
                "\tldr r1, [sp, 0x8]\n"
                "\tlsls r1, 8\n"
                "\tstr r1, [sp, 0x18]\n"
                "\tmovs r2, 0\n"
                "\tmov r10, r2\n"
                "\tmov r0, r9\n"
                "\tmovs r4, 0x8\n"
                "\tsubs r0, r4, r0\n"
                "\tstr r0, [sp, 0xC]\n"
                "_0800D484:\n"
                "\tmovs r3, 0\n"
                "\tasrs r0, r7, 1\n"
                "\tadds r1, r7, 0\n"
                "\tmovs r2, 0x1\n"
                "\tands r1, r2\n"
                "\tstr r1, [sp, 0x20]\n"
                "\tlsls r0, 8\n"
                "\tmov r8, r0\n"
                "\tmov r12, r5\n"
                "_0800D496:\n"
                "\tlsls r1, r3, 5\n"
                "\tldr r4, [sp, 0x18]\n"
                "\tadds r0, r5, r4\n"
                "\tadds r0, r1\n"
                "\tmov r1, r8\n"
                "\tadds r2, r0, r1\n"
                "\tmov r1, r12\n"
                "\tadd r1, r8\n"
                "\tmovs r6, 0xF\n"
                "_0800D4A8:\n"
                "\tldr r4, [sp, 0x20]\n"
                "\tcmp r4, 0\n"
                "\tbne _0800D4B8\n"
                "\tstrb r4, [r1]\n"
                "\tadd r4, sp, 0x20\n"
                "\tldrb r4, [r4]\n"
                "\tstrb r4, [r2, 0x10]\n"
                "\tb _0800D4C6\n"
                "_0800D4B8:\n"
                "\tmov r0, r10\n"
                "\tstrb r0, [r1, 0x10]\n"
                "\tmovs r4, 0x80\n"
                "\tlsls r4, 1\n"
                "\tadds r4, r2, r4\n"
                "\tstr r4, [sp, 0x1C]\n"
                "\tstrb r0, [r4]\n"
                "_0800D4C6:\n"
                "\tadds r2, 0x1\n"
                "\tadds r1, 0x1\n"
                "\tsubs r6, 0x1\n"
                "\tcmp r6, 0\n"
                "\tbge _0800D4A8\n"
                "\tmovs r0, 0x20\n"
                "\tadd r12, r0\n"
                "\tadds r3, 0x1\n"
                "\tcmp r3, 0x7\n"
                "\tble _0800D496\n"
                "\tadds r7, 0x1\n"
                "\tldr r1, [sp, 0xC]\n"
                "\tcmp r7, r1\n"
                "\tblt _0800D484\n"
                "_0800D4E2:\n"
                "\tmovs r7, 0\n"
                "\tmovs r2, 0\n"
                "_0800D4E6:\n"
                "\tmovs r6, 0\n"
                "\tadds r4, r7, 0x1\n"
                "\tmov r8, r4\n"
                "\tlsls r4, r7, 5\n"
                "_0800D4EE:\n"
                "\tadds r0, r6, 0x1\n"
                "\tmov r10, r0\n"
                "\tlsls r1, r6, 8\n"
                "\tadds r0, r1, 0\n"
                "\tadds r0, 0xC0\n"
                "\tadds r0, r5, r0\n"
                "\tadds r0, r4\n"
                "\tadds r1, r5, r1\n"
                "\tadds r1, r4\n"
                "\tmovs r3, 0x1F\n"
                "_0800D502:\n"
                "\tstrb r2, [r1]\n"
                "\tstrb r2, [r0]\n"
                "\tadds r0, 0x1\n"
                "\tadds r1, 0x1\n"
                "\tsubs r3, 0x1\n"
                "\tcmp r3, 0\n"
                "\tbge _0800D502\n"
                "\tmov r6, r10\n"
                "\tcmp r6, 0x7\n"
                "\tble _0800D4EE\n"
                "\tmov r7, r8\n"
                "\tcmp r7, 0x1\n"
                "\tble _0800D4E6\n"
                "\tmov r1, r9\n"
                "\tcmp r1, 0x5\n"
                "\tbne _0800D528\n"
                "\tmovs r2, 0x90\n"
                "\tlsls r2, 1\n"
                "\tadds r5, r2\n"
                "_0800D528:\n"
                "\tmovs r7, 0\n"
                "\tcmp r7, r9\n"
                "\tbge _0800D5BE\n"
                "_0800D52E:\n"
                "\tmovs r3, 0\n"
                "\tadds r7, 0x1\n"
                "\tmov r8, r7\n"
                "\tcmp r3, r9\n"
                "\tbge _0800D59E\n"
                "_0800D538:\n"
                "\tadds r3, 0x1\n"
                "\tmov r10, r3\n"
                "\tldr r4, [sp, 0x4]\n"
                "\tadds r4, 0x20\n"
                "\tadds r7, r5, 0\n"
                "\tadds r7, 0x20\n"
                "\tmovs r0, 0x12\n"
                "\tadds r0, r5\n"
                "\tmov r12, r0\n"
                "\tldr r2, [sp, 0x4]\n"
                "\tadds r3, r5, 0\n"
                "\tmovs r6, 0x3\n"
                "_0800D550:\n"
                "\tldrb r0, [r2]\n"
                "\tmov r1, r12\n"
                "\tstrb r0, [r1]\n"
                "\tldrb r0, [r2, 0x1]\n"
                "\tstrb r0, [r1, 0x1]\n"
                "\tldrb r0, [r2, 0x2]\n"
                "\tstrb r0, [r1, 0x1E]\n"
                "\tldrb r0, [r2, 0x3]\n"
                "\tstrb r0, [r1, 0x1F]\n"
                "\tmovs r0, 0x81\n"
                "\tlsls r0, 1\n"
                "\tadds r1, r3, r0\n"
                "\tldrb r0, [r2, 0x10]\n"
                "\tstrb r0, [r1]\n"
                "\tldr r0, _0800D5A8 @ =0x00000103\n"
                "\tadds r1, r3, r0\n"
                "\tldrb r0, [r2, 0x11]\n"
                "\tstrb r0, [r1]\n"
                "\tmovs r0, 0x90\n"
                "\tlsls r0, 1\n"
                "\tadds r1, r3, r0\n"
                "\tldrb r0, [r2, 0x12]\n"
                "\tstrb r0, [r1]\n"
                "\tldr r0, _0800D5AC @ =0x00000121\n"
                "\tadds r1, r3, r0\n"
                "\tldrb r0, [r2, 0x13]\n"
                "\tstrb r0, [r1]\n"
                "\tmovs r1, 0x4\n"
                "\tadd r12, r1\n"
                "\tadds r2, 0x4\n"
                "\tadds r3, 0x4\n"
                "\tsubs r6, 0x1\n"
                "\tcmp r6, 0\n"
                "\tbge _0800D550\n"
                "\tstr r4, [sp, 0x4]\n"
                "\tadds r5, r7, 0\n"
                "\tmov r3, r10\n"
                "\tcmp r3, r9\n"
                "\tblt _0800D538\n"
                "_0800D59E:\n"
                "\tmov r2, r9\n"
                "\tcmp r2, 0x7\n"
                "\tbne _0800D5B0\n"
                "\tadds r5, 0x20\n"
                "\tb _0800D5B8\n"
                "\t.align 2, 0\n"
                "_0800D5A8: .4byte 0x00000103\n"
                "_0800D5AC: .4byte 0x00000121\n"
                "_0800D5B0:\n"
                "\tmov r4, r9\n"
                "\tcmp r4, 0x5\n"
                "\tbne _0800D5B8\n"
                "\tadds r5, 0x60\n"
                "_0800D5B8:\n"
                "\tmov r7, r8\n"
                "\tcmp r7, r9\n"
                "\tblt _0800D52E\n"
                "_0800D5BE:\n"
                "\tmov r0, r9\n"
                "\tcmp r0, 0x7\n"
                "\tbne _0800D5CC\n"
                "\tmovs r1, 0x80\n"
                "\tlsls r1, 1\n"
                "\tadds r5, r1\n"
                "\tb _0800D5D8\n"
                "_0800D5CC:\n"
                "\tmov r2, r9\n"
                "\tcmp r2, 0x5\n"
                "\tbne _0800D5D8\n"
                "\tmovs r4, 0xF0\n"
                "\tlsls r4, 1\n"
                "\tadds r5, r4\n"
                "_0800D5D8:\n"
                "\tldr r0, [sp, 0x14]\n"
                "\tldr r1, [sp]\n"
                "\tcmp r0, r1\n"
                "\tbge _0800D5E2\n"
                "\tb _0800D466\n"
                "_0800D5E2:\n"
                "\tb _0800D674\n"
                "_0800D5E4:\n"
                "\tmovs r6, 0\n"
                "\tldr r2, [sp]\n"
                "\tcmp r6, r2\n"
                "\tbge _0800D674\n"
                "_0800D5EC:\n"
                "\tadds r6, 0x1\n"
                "\tmov r10, r6\n"
                "\tmov r4, r9\n"
                "\tcmp r4, 0x6\n"
                "\tbne _0800D604\n"
                "\tmovs r0, 0\n"
                "\tmovs r3, 0xFF\n"
                "_0800D5FA:\n"
                "\tstrb r0, [r5]\n"
                "\tadds r5, 0x1\n"
                "\tsubs r3, 0x1\n"
                "\tcmp r3, 0\n"
                "\tbge _0800D5FA\n"
                "_0800D604:\n"
                "\tmovs r7, 0\n"
                "\tcmp r7, r9\n"
                "\tbge _0800D658\n"
                "_0800D60A:\n"
                "\tadds r7, 0x1\n"
                "\tmov r8, r7\n"
                "\tmov r1, r9\n"
                "\tlsls r0, r1, 5\n"
                "\tcmp r1, 0x6\n"
                "\tbne _0800D624\n"
                "\tmovs r1, 0\n"
                "\tmovs r3, 0x1F\n"
                "_0800D61A:\n"
                "\tstrb r1, [r5]\n"
                "\tadds r5, 0x1\n"
                "\tsubs r3, 0x1\n"
                "\tcmp r3, 0\n"
                "\tbge _0800D61A\n"
                "_0800D624:\n"
                "\tadds r1, r0, 0\n"
                "\tcmp r1, 0\n"
                "\tble _0800D63E\n"
                "\tadds r3, r1, 0\n"
                "_0800D62C:\n"
                "\tldr r2, [sp, 0x4]\n"
                "\tldrb r0, [r2]\n"
                "\tstrb r0, [r5]\n"
                "\tadds r2, 0x1\n"
                "\tstr r2, [sp, 0x4]\n"
                "\tadds r5, 0x1\n"
                "\tsubs r3, 0x1\n"
                "\tcmp r3, 0\n"
                "\tbne _0800D62C\n"
                "_0800D63E:\n"
                "\tmov r4, r9\n"
                "\tcmp r4, 0x6\n"
                "\tbne _0800D652\n"
                "\tmovs r0, 0\n"
                "\tmovs r3, 0x1F\n"
                "_0800D648:\n"
                "\tstrb r0, [r5]\n"
                "\tadds r5, 0x1\n"
                "\tsubs r3, 0x1\n"
                "\tcmp r3, 0\n"
                "\tbge _0800D648\n"
                "_0800D652:\n"
                "\tmov r7, r8\n"
                "\tcmp r7, r9\n"
                "\tblt _0800D60A\n"
                "_0800D658:\n"
                "\tmov r0, r9\n"
                "\tcmp r0, 0x6\n"
                "\tbne _0800D66C\n"
                "\tmovs r0, 0\n"
                "\tmovs r3, 0xFF\n"
                "_0800D662:\n"
                "\tstrb r0, [r5]\n"
                "\tadds r5, 0x1\n"
                "\tsubs r3, 0x1\n"
                "\tcmp r3, 0\n"
                "\tbge _0800D662\n"
                "_0800D66C:\n"
                "\tmov r6, r10\n"
                "\tldr r1, [sp]\n"
                "\tcmp r6, r1\n"
                "\tblt _0800D5EC\n"
                "_0800D674:\n"
                "\tadd sp, 0x24\n"
                "\tpop {r3-r5}\n"
                "\tmov r8, r3\n"
                "\tmov r9, r4\n"
                "\tmov r10, r5\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0");
}
#endif
