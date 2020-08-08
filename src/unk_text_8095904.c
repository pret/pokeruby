#include "global.h"
#include "text.h"
#include "string_util.h"

// static types

// static declarations

// rodata

extern const u32 gFont3LatinGlyphs[];

// text
void sub_8095904(const u8 *src, u8 *dest, u8 bgOverride, u16 width, u8 bg, u8 *buffer)
{
    const u8 *glyphs;
    u16 i, strlen = StringLength(src);

    if (bgOverride == 0)
    {
        for (i = 0; i < strlen; i++)
        {
            glyphs = (const u8 *)((u32)(gFont3LatinGlyphs) +
                                  (u32)((src[i] & 0xfff0) * 0x40 + (src[i] & 0xf) * 0x20));
            CpuCopy16(glyphs, dest, 32);
            CpuCopy16(glyphs + 0x200, dest + width, 32);
            dest += 32;
        }
    }
    else
    {
        u8 bgHi, r3, r2;
        u16 size, j, r9, k;
        k = 0;
        bgHi = bg << 4;
        size = strlen * 32;
        for (j = 0; j < 2; j++)
        {
            for (i = 0; i < strlen; i++) // r5
            {
                glyphs = (const u8 *)((u32)(gFont3LatinGlyphs) +
                                      (u32)((src[i] & 0xfff0) * 0x40 + (src[i] & 0xf) * 0x20)) +
                         (j * 0x200);

                for (r9 = 0; r9 < 32; r9++)
                {
                    r3 = *glyphs & 0xf0;
                    r2 = *glyphs & 0x0f;
                    if (r3 == 0)
                    {
                        r3 = bgHi;
                    }
                    if (r2 == 0)
                    {
                        r2 = bg;
                    }
                    buffer[k++] = r3 | r2;
                    glyphs++;
                }
            }
            CpuCopy16(buffer, dest, size);
            dest += width;
            k = 0;
        }
    }
}

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
