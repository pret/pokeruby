#include "global.h"
#include "text.h"
#include "string_util.h"

// static types

// static declarations

// rodata

extern const u32 gFont3LatinGlyphs[];

// text

#ifdef NONMATCHING
void sub_8095904(const u8 *src, u8 *dest, u8 bgOverride, u16 width, u8 bg, u8 *buffer)
{
    u16 strlen = StringLength(src);
    if (bgOverride == 0)
    {
        u16 i;
        for (i = 0; i < strlen; i++)
        {
            const u8 *glyphs = (const u8 *)(gFont3LatinGlyphs + ((src[i] & 0xfff0) * 16) + ((src[i] & 0xf) * 8));
            CpuCopy16(glyphs, dest, 32);
            CpuCopy16(glyphs + 0x200, dest + width, 32);
            dest += 32;
        }
    }
    else
    {
        u16 i; // sp18
        u16 r9 = 0;
        u8 bgHi = bg << 4;
        u16 size = strlen * 32;
        for (i = 0; i < 2; i++)
        {
            u16 j;
            for (j = 0; j < strlen; j++) // r5
            {
                const u32 *glyphs = (const u8 *)(gFont3LatinGlyphs + (i * 0x80) + ((src[j] & 0xfff0) * 16) + ((src[j] & 0xf) * 8));

                u16 k; // r6
                for (k = 0; k < 32; k++)
                {
                    u8 r3 = *glyphs & 0xf0;
                    u8 r2 = *glyphs & 0x0f;
                    if (r3 == 0)
                    {
                        r3 = bgHi;
                    }
                    if (r2 == 0)
                    {
                        r2 = bg;
                    }
                    buffer[r9++] = r3 | r2;
                    glyphs++;
                }
            }
            CpuCopy16(buffer, dest, size);
            dest += width;
            r9 = 0;
        }
    }
}
#else
NAKED void sub_8095904(const u8 *src, u8 *dest, u8 bgOverride, u16 width, u8 bg, u8 *buffer)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                    "\tmov r7, r10\n"
                    "\tmov r6, r9\n"
                    "\tmov r5, r8\n"
                    "\tpush {r5-r7}\n"
                    "\tsub sp, 0x1C\n"
                    "\tstr r0, [sp]\n"
                    "\tadds r7, r1, 0\n"
                    "\tadds r4, r2, 0\n"
                    "\tldr r0, [sp, 0x3C]\n"
                    "\tlsls r4, 24\n"
                    "\tlsrs r4, 24\n"
                    "\tlsls r3, 16\n"
                    "\tlsrs r3, 16\n"
                    "\tstr r3, [sp, 0x4]\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r0, 24\n"
                    "\tstr r0, [sp, 0x8]\n"
                    "\tldr r0, [sp]\n"
                    "\tbl StringLength\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r0, 16\n"
                    "\tmov r8, r0\n"
                    "\tcmp r4, 0\n"
                    "\tbne _08095988\n"
                    "\tmovs r5, 0\n"
                    "\tcmp r5, r8\n"
                    "\tbcs _08095A2E\n"
                    "_0809593E:\n"
                    "\tldr r1, [sp]\n"
                    "\tadds r0, r1, r5\n"
                    "\tldrb r2, [r0]\n"
                    "\tldr r0, _08095980 @ =0x0000fff0\n"
                    "\tands r0, r2\n"
                    "\tlsls r0, 6\n"
                    "\tmovs r1, 0xF\n"
                    "\tands r2, r1\n"
                    "\tlsls r2, 5\n"
                    "\tadds r0, r2\n"
                    "\tldr r1, _08095984 @ =gFont3LatinGlyphs\n"
                    "\tadds r4, r0, r1\n"
                    "\tadds r0, r4, 0\n"
                    "\tadds r1, r7, 0\n"
                    "\tmovs r2, 0x10\n"
                    "\tbl CpuSet\n"
                    "\tmovs r2, 0x80\n"
                    "\tlsls r2, 2\n"
                    "\tadds r0, r4, r2\n"
                    "\tldr r3, [sp, 0x4]\n"
                    "\tadds r1, r7, r3\n"
                    "\tmovs r2, 0x10\n"
                    "\tbl CpuSet\n"
                    "\tadds r7, 0x20\n"
                    "\tadds r0, r5, 0x1\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r5, r0, 16\n"
                    "\tcmp r5, r8\n"
                    "\tbcc _0809593E\n"
                    "\tb _08095A2E\n"
                    "\t.align 2, 0\n"
                    "_08095980: .4byte 0x0000fff0\n"
                    "_08095984: .4byte gFont3LatinGlyphs\n"
                    "_08095988:\n"
                    "\tmovs r0, 0\n"
                    "\tmov r9, r0\n"
                    "\tldr r1, [sp, 0x8]\n"
                    "\tlsls r0, r1, 28\n"
                    "\tlsrs r0, 24\n"
                    "\tstr r0, [sp, 0xC]\n"
                    "\tmov r2, r8\n"
                    "\tlsls r0, r2, 21\n"
                    "\tmovs r1, 0\n"
                    "\tlsrs r0, 1\n"
                    "\tstr r0, [sp, 0x10]\n"
                    "_0809599E:\n"
                    "\tmovs r5, 0\n"
                    "\tldr r3, [sp, 0x4]\n"
                    "\tadds r3, r7, r3\n"
                    "\tstr r3, [sp, 0x14]\n"
                    "\tadds r0, r1, 0x1\n"
                    "\tstr r0, [sp, 0x18]\n"
                    "\tcmp r5, r8\n"
                    "\tbcs _08095A12\n"
                    "\tmovs r2, 0xF\n"
                    "\tmov r12, r2\n"
                    "\tlsls r1, 9\n"
                    "\tldr r0, _08095A40 @ =gFont3LatinGlyphs\n"
                    "\tadds r1, r0\n"
                    "\tmov r10, r1\n"
                    "_080959BA:\n"
                    "\tldr r3, [sp]\n"
                    "\tadds r0, r3, r5\n"
                    "\tldrb r1, [r0]\n"
                    "\tldr r0, _08095A44 @ =0x0000fff0\n"
                    "\tands r0, r1\n"
                    "\tlsls r0, 6\n"
                    "\tmov r2, r12\n"
                    "\tands r1, r2\n"
                    "\tlsls r1, 5\n"
                    "\tadds r0, r1\n"
                    "\tmov r3, r10\n"
                    "\tadds r4, r0, r3\n"
                    "\tmovs r6, 0\n"
                    "\tadds r5, 0x1\n"
                    "_080959D6:\n"
                    "\tldrb r0, [r4]\n"
                    "\tmovs r3, 0xF0\n"
                    "\tands r3, r0\n"
                    "\tmov r2, r12\n"
                    "\tands r2, r0\n"
                    "\tcmp r3, 0\n"
                    "\tbne _080959E6\n"
                    "\tldr r3, [sp, 0xC]\n"
                    "_080959E6:\n"
                    "\tcmp r2, 0\n"
                    "\tbne _080959EC\n"
                    "\tldr r2, [sp, 0x8]\n"
                    "_080959EC:\n"
                    "\tmov r0, r9\n"
                    "\tadds r1, r0, 0x1\n"
                    "\tlsls r1, 16\n"
                    "\tlsrs r1, 16\n"
                    "\tmov r9, r1\n"
                    "\tldr r1, [sp, 0x40]\n"
                    "\tadds r0, r1, r0\n"
                    "\torrs r3, r2\n"
                    "\tstrb r3, [r0]\n"
                    "\tadds r4, 0x1\n"
                    "\tadds r0, r6, 0x1\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r6, r0, 16\n"
                    "\tcmp r6, 0x1F\n"
                    "\tbls _080959D6\n"
                    "\tlsls r0, r5, 16\n"
                    "\tlsrs r5, r0, 16\n"
                    "\tcmp r5, r8\n"
                    "\tbcc _080959BA\n"
                    "_08095A12:\n"
                    "\tldr r0, [sp, 0x40]\n"
                    "\tadds r1, r7, 0\n"
                    "\tldr r3, [sp, 0x10]\n"
                    "\tlsrs r2, r3, 16\n"
                    "\tbl CpuSet\n"
                    "\tldr r7, [sp, 0x14]\n"
                    "\tmovs r0, 0\n"
                    "\tmov r9, r0\n"
                    "\tldr r1, [sp, 0x18]\n"
                    "\tlsls r0, r1, 16\n"
                    "\tlsrs r1, r0, 16\n"
                    "\tcmp r1, 0x1\n"
                    "\tbls _0809599E\n"
                    "_08095A2E:\n"
                    "\tadd sp, 0x1C\n"
                    "\tpop {r3-r5}\n"
                    "\tmov r8, r3\n"
                    "\tmov r9, r4\n"
                    "\tmov r10, r5\n"
                    "\tpop {r4-r7}\n"
                    "\tpop {r0}\n"
                    "\tbx r0\n"
                    "\t.align 2, 0\n"
                    "_08095A40: .4byte gFont3LatinGlyphs\n"
                    "_08095A44: .4byte 0x0000fff0");
}
#endif

void unref_sub_8095A48(const u8 *src, u8 *dest, u8 bgOverride, u8 width, u8 *buffer)
{
    u8 tmpBuffer[5];
    bool8 r6 = FALSE;
    while (!r6)
    {
        u16 i;
        for (i = 0; i < 4; i++)
        {
            if (*src == EOS)
            {
                if (i == 0)
                {
                    return;
                }
                r6 = TRUE;
                break;
            }
            else
            {
                tmpBuffer[i] = *src++;
            }
        }
        while (i < 4)
        {
            tmpBuffer[i++] = 0;
        }
        tmpBuffer[i] = EOS;
        sub_8095904(tmpBuffer, dest, bgOverride, 0x80, width, buffer);
        dest += 0x100;
    }
}
