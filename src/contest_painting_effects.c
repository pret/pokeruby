#include "global.h"
#include "contest_painting_effects.h"
#include "contest_painting.h"

extern u16 (*gUnknown_03005DEC)[][32];
extern u8 gUnknown_083E7A50[][3];
extern u8 gUnknown_03005E00;
extern u8 gUnknown_03005DFC;
extern u8 gUnknown_03005DF8;
extern u8 gUnknown_03005DF0;
extern u8 gUnknown_03005E04;
extern u8 gUnknown_03005DF4;

extern u8 gUnknown_03005DE8;

// this file's functions
void sub_80FCAA4(void);
void sub_80FCB5C(void);
void sub_80FCD54(void);
void sub_80FCEA4(void);
void sub_80FCCBC(void);
void sub_80FD06C(void);
void sub_80FD114(void);
void sub_80FCF3C(void);
void sub_80FCAC4(void);
void sub_80FCC18(u8);
void sub_80FC92C(u8);
void sub_80FC9E4(u8);
void sub_80FD1C8(u16);
u16 ConvertColorToGrayscale(u16*);
u16 sub_80FD68C(u16*, u16*, u16*);
u16 ConvertCoolColor(u16*, u8);
u16 ConvertToBlackOrWhite(u16*);
u16 sub_80FD50C(u16*, u16*);
u16 InvertColor(u16*);
u16 sub_80FD7AC(u16*, u16*, u16*);
u16 sub_80FD568(u16*, u16*);
u16 GetCoolColorFromPersonality(u8);

void sub_80FC7A0(struct Unk03005E20* info)
{
    gUnknown_03005DEC = info->var_4;
    gUnknown_03005E00 = info->var_1F;
    gUnknown_03005DE8 = info->var_19;
    gUnknown_03005DFC = info->var_1A;
    gUnknown_03005DF8 = info->var_1B;
    gUnknown_03005DF0 = info->var_1C;
    gUnknown_03005E04 = info->var_1D;
    gUnknown_03005DF4 = info->var_1E;
    switch (info->var_0)
    {
    case 2:
        sub_80FCAA4();
        break;
    case 8:
        sub_80FCB5C();
        break;
    case 9:
        sub_80FCD54();
        sub_80FCC18(gUnknown_03005E00);
        break;
    case 10:
        sub_80FCD54();
        sub_80FCEA4();
        sub_80FCCBC();
    case 31:
        sub_80FCEA4();
        break;
    case 11:
        sub_80FCD54();
        sub_80FD06C();
        sub_80FD06C();
        sub_80FD114();
        sub_80FCCBC();
        break;
    case 13:
        sub_80FCF3C();
        break;
    case 30:
        sub_80FCD54();
        break;
    case 32:
        sub_80FD06C();
        break;
    case 33:
        sub_80FD114();
        break;
    case 6:
        sub_80FCAC4();
        sub_80FC92C(3);
        break;
    case 36:
        sub_80FCD54();
        sub_80FD06C();
        sub_80FD114();
        sub_80FCCBC();
        sub_80FCB5C();
        sub_80FCB5C();
        sub_80FC92C(2);
        sub_80FC9E4(4);
        break;
    }
}

#define RGB2(r, g, b) (((b) << 10) | ((g) << 5) | (r))

void sub_80FC92C(u8 a0) // it changes palette someway somehow... .__.
{
    u8 i, j;
    for (i = 0; i < gUnknown_03005DF0; i++)
    {
        u16* var2 = &(*gUnknown_03005DEC)[0][(gUnknown_03005DFC + i) * gUnknown_03005E04];
        u16* pal = &var2[gUnknown_03005DE8];
        for (j = 0; j < gUnknown_03005DF8; j++, pal++)
        {
            if (!(0x8000 & *pal))
            {
                u8 val = (31 & *pal);
                val += a0;
                if (val > 31)
                    val = 31;

                *pal = RGB2(val, val, val);
            }
        }
    }
}

void sub_80FC9E4(u8 a0)
{
    u8 i, j;
    for (i = 0; i < gUnknown_03005DF0; i++)
    {
        u16* var2 = &(*gUnknown_03005DEC)[0][(gUnknown_03005DFC + i) * gUnknown_03005E04];
        u16* pal = &var2[gUnknown_03005DE8];
        for (j = 0; j < gUnknown_03005DF8; j++, pal++)
        {
            if (!(0x8000 & *pal))
            {
                u8 val = (31 & *pal);
                if (val > 31 - a0)
                    val = 31 - (a0 >> 1);

                *pal = RGB2(val, val, val);
            }
        }
    }
}

void sub_80FCAA4(void)
{
    u32 i;
    for (i = 0; i < 3200; i++)
        sub_80FD1C8(i);
}

void sub_80FCAC4(void)
{
    u8 i, j;
    for (i = 0; i < gUnknown_03005DF0; i++)
    {
        u16* var2 = &(*gUnknown_03005DEC)[0][(gUnknown_03005DFC + i) * gUnknown_03005E04];
        u16* color = &var2[gUnknown_03005DE8];
        for (j = 0; j < gUnknown_03005DF8; j++, color++)
        {
            if (!(0x8000 & *color))
            {
                *color = ConvertColorToGrayscale(color);
            }
        }
    }
}

void sub_80FCB5C(void)
{
    u8 i, j;
    for (i = 0; i < gUnknown_03005DF8; i++)
    {
        u16* var0 = &(*gUnknown_03005DEC)[0][gUnknown_03005DFC * gUnknown_03005E04];
        u16* palette = &var0[gUnknown_03005DE8 + i];
        u16 color = *palette;
        j = 1;
        palette += gUnknown_03005E04;
        while (j < gUnknown_03005DF0 - 1)
        {
            if (!(0x8000 & *palette))
            {
                *palette = sub_80FD68C(&color, palette, palette + gUnknown_03005E04);
                color = *palette;
            }

            j++;
            palette += gUnknown_03005E04;
        }
    }
}

void sub_80FCC18(u8 arg0)
{
    u8 i, j;
    for (i = 0; i < gUnknown_03005DF0; i++)
    {
        u16* var0 = &(*gUnknown_03005DEC)[0][(gUnknown_03005DFC + i) * gUnknown_03005E04];
        u16* color = &var0[gUnknown_03005DE8];
        for (j = 0; j < gUnknown_03005DF8; j++, color++)
        {
            if (!(0x8000 & *color))
            {
                *color = ConvertCoolColor(color, arg0);
            }
        }
    }
}

void sub_80FCCBC(void)
{
    u8 i, j;
    for (i = 0; i < gUnknown_03005DF0; i++)
    {
        u16* var0 = &(*gUnknown_03005DEC)[0][(gUnknown_03005DFC + i) * gUnknown_03005E04];
        u16* color = &var0[gUnknown_03005DE8];
        for (j = 0; j < gUnknown_03005DF8; j++, color++)
        {
            if (!(0x8000 & *color))
            {
                *color = ConvertToBlackOrWhite(color);
            }
        }
    }
}
 
void sub_80FCD54(void)
{
    u8 i, j;
    u16 *palette;

    for (i = 0; i < gUnknown_03005DF0; i++)
    {
        u16* var0 = &(*gUnknown_03005DEC)[0][(gUnknown_03005DFC + i) * gUnknown_03005E04];
        palette = &var0[gUnknown_03005DE8];
        *palette = sub_80FD50C(palette, palette + 1);
        for (j = 1, palette = palette + 1; j < gUnknown_03005DF8 - 1; j++, palette++)
        {
            *palette = sub_80FD50C(palette, palette + 1);
            *palette = sub_80FD50C(palette, palette - 1);
        }

        *palette = sub_80FD50C(palette, palette - 1);
    }

    for (j = 0; j < gUnknown_03005DF8; j++)
    {
        u16* var0 = &(*gUnknown_03005DEC)[0][gUnknown_03005DFC * gUnknown_03005E04];
        palette = &var0[gUnknown_03005DE8 + j];
        *palette = sub_80FD50C(palette, palette + gUnknown_03005E04);
        for (i = 1, palette = palette + gUnknown_03005E04; i < gUnknown_03005DF0 - 1; i++, palette += gUnknown_03005E04)
        {
            *palette = sub_80FD50C(palette, palette + gUnknown_03005E04);
            *palette = sub_80FD50C(palette, palette - gUnknown_03005E04);
        }

        *palette = sub_80FD50C(palette, palette - gUnknown_03005E04);
    }
}

void sub_80FCEA4(void)
{
    u8 i, j;
    for (i = 0; i < gUnknown_03005DF0; i++)
    {
        u16* var0 = &(*gUnknown_03005DEC)[0][(gUnknown_03005DFC + i) * gUnknown_03005E04];
        u16* color = &var0[gUnknown_03005DE8];
        for (j = 0; j < gUnknown_03005DF8; j++, color++)
        {
            if (!(0x8000 & *color))
            {
                *color = InvertColor(color);
            }
        }
    }
}

void sub_80FCF3C(void)
{
    u8 i, j;
    u16 *palette;
    u16 color;

    palette = (*gUnknown_03005DEC)[0];
    for (i = 0; i < 64; i++)
    {
        for (j = 0; j < 64; j++, palette++)
        {
            if (!(0x8000 & *palette))
            {
                *palette = InvertColor(palette);
            }
        }
    }

    for (j = 0; j < 64; j++)
    {
        palette = &(*gUnknown_03005DEC)[0][j];
        color = *palette;
        *palette = 0x8000;
        for (i = 1, palette += 64; i < 63; i++, palette += 64)
        {
            if (!(0x8000 & *palette))
            {
                *palette = sub_80FD7AC(&color, palette, palette + 64);
                color = *palette;
            }
        }

        *palette = 0x8000;
        palette = &(*gUnknown_03005DEC)[0][j];
        color = *palette;
        *palette = 0x8000;
        for (i = 1, palette += 64; i < 63; i++, palette += 64)
        {
            if (!(0x8000 & *palette))
            {
                *palette = sub_80FD7AC(&color, palette, palette + 64);
                color = *palette;
            }
        }

        *palette = 0x8000;
    }

    palette = (*gUnknown_03005DEC)[0];
    for (i = 0; i < 64; i++)
    {
        for (j = 0; j < 64; j++, palette++)
        {
            if (!(0x8000 & *palette))
            {
                *palette = InvertColor(palette);
            }
        }
    }
}

void sub_80FD06C(void)
{
    u8 i, j;
    for (i = 0; i < gUnknown_03005DF0; i++)
    {
        u16* var0 = &(*gUnknown_03005DEC)[0][(gUnknown_03005DFC + i) * gUnknown_03005E04];
        u16* palette = &var0[gUnknown_03005DE8];
        u16 color = *palette;
        for (j = 1, palette++; j < gUnknown_03005DF8 - 1; j++, palette++)
        {
            if (!(0x8000 & *palette))
            {
                *palette = sub_80FD568(&color, palette);
                color = *palette;
            }
        }
    }
}

void sub_80FD114(void)
{
    u8 i, j;
    for (i = 0; i < gUnknown_03005DF8; i++)
    {
        u16* var0 = &(*gUnknown_03005DEC)[0][gUnknown_03005DFC * gUnknown_03005E04];
        u16* palette = &var0[gUnknown_03005DE8 + i];
        u16 color = *palette;
        for (j = 1, palette += gUnknown_03005E04; j < gUnknown_03005DF0 - 1; j++, palette += gUnknown_03005E04)
        {
            if (!(0x8000 & *palette))
            {
                *palette = sub_80FD568(&color, palette);
                color = *palette;
            }
        }
    }
}

NAKED
void sub_80FD1C8(u16 arg0)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x20\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    mov r10, r0\n\
    mov r2, sp\n\
    ldr r3, _080FD234 @ =gUnknown_083E7A50\n\
    lsls r1, r0, 1\n\
    add r1, r10\n\
    adds r0, r1, r3\n\
    ldrb r0, [r0]\n\
    strb r0, [r2]\n\
    adds r0, r3, 0x1\n\
    adds r0, r1, r0\n\
    ldrb r0, [r0]\n\
    strb r0, [r2, 0x1]\n\
    mov r5, sp\n\
    adds r0, r3, 0x2\n\
    adds r1, r0\n\
    ldrb r4, [r1]\n\
    lsls r2, r4, 24\n\
    lsrs r1, r2, 27\n\
    movs r0, 0x7\n\
    ands r1, r0\n\
    strh r1, [r5, 0x2]\n\
    lsrs r2, 25\n\
    mov r9, r2\n\
    movs r0, 0x3\n\
    ands r2, r0\n\
    mov r9, r2\n\
    movs r5, 0x1\n\
    ands r5, r4\n\
    movs r4, 0x1\n\
    mov r8, r4\n\
    cmp r8, r1\n\
    bcs _080FD27A\n\
    mov r3, sp\n\
_080FD21A:\n\
    cmp r5, 0\n\
    bne _080FD238\n\
    mov r0, r8\n\
    lsls r2, r0, 2\n\
    mov r4, sp\n\
    adds r1, r4, r2\n\
    ldrb r0, [r3]\n\
    mov r4, r8\n\
    subs r0, r4\n\
    strb r0, [r1]\n\
    ldrb r0, [r3, 0x1]\n\
    add r0, r8\n\
    b _080FD24A\n\
    .align 2, 0\n\
_080FD234: .4byte gUnknown_083E7A50\n\
_080FD238:\n\
    mov r0, r8\n\
    lsls r2, r0, 2\n\
    mov r4, sp\n\
    adds r1, r4, r2\n\
    ldrb r0, [r3]\n\
    adds r0, 0x1\n\
    strb r0, [r1]\n\
    ldrb r0, [r3, 0x1]\n\
    subs r0, 0x1\n\
_080FD24A:\n\
    strb r0, [r1, 0x1]\n\
    add r2, sp\n\
    ldrb r0, [r2]\n\
    cmp r0, 0x3F\n\
    bhi _080FD25A\n\
    ldrb r0, [r2, 0x1]\n\
    cmp r0, 0x3F\n\
    bls _080FD262\n\
_080FD25A:\n\
    mov r0, r8\n\
    subs r0, 0x1\n\
    strh r0, [r3, 0x2]\n\
    b _080FD27A\n\
_080FD262:\n\
    ldrh r0, [r3, 0x2]\n\
    mov r1, r8\n\
    subs r0, r1\n\
    strh r0, [r2, 0x2]\n\
    mov r0, r8\n\
    adds r0, 0x1\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r8, r0\n\
    ldrh r0, [r3, 0x2]\n\
    cmp r8, r0\n\
    bcc _080FD21A\n\
_080FD27A:\n\
    movs r2, 0\n\
    mov r8, r2\n\
    mov r0, sp\n\
    ldrh r0, [r0, 0x2]\n\
    cmp r8, r0\n\
    bcc _080FD288\n\
    b _080FD38A\n\
_080FD288:\n\
    movs r3, 0x1F\n\
_080FD28A:\n\
    ldr r1, _080FD2E8 @ =gUnknown_03005DEC\n\
    mov r4, r8\n\
    lsls r0, r4, 2\n\
    mov r2, sp\n\
    adds r6, r2, r0\n\
    ldrb r0, [r6, 0x1]\n\
    lsls r0, 7\n\
    ldr r1, [r1]\n\
    adds r1, r0\n\
    ldrb r0, [r6]\n\
    lsls r0, 1\n\
    adds r2, r1, r0\n\
    ldrh r1, [r2]\n\
    movs r4, 0x80\n\
    lsls r4, 8\n\
    adds r0, r4, 0\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _080FD376\n\
    movs r7, 0x1F\n\
    ands r7, r1\n\
    lsls r0, r1, 16\n\
    lsrs r5, r0, 21\n\
    ands r5, r3\n\
    lsrs r4, r0, 26\n\
    ands r4, r3\n\
    mov r0, r9\n\
    cmp r0, 0\n\
    blt _080FD36C\n\
    cmp r0, 0x1\n\
    ble _080FD2EC\n\
    cmp r0, 0x3\n\
    bgt _080FD36C\n\
    ldrh r0, [r6, 0x2]\n\
    adds r1, r7, r0\n\
    lsls r1, 16\n\
    lsrs r7, r1, 16\n\
    adds r1, r5, r0\n\
    lsls r1, 16\n\
    lsrs r5, r1, 16\n\
    adds r0, r4, r0\n\
    lsls r0, 16\n\
    lsrs r4, r0, 16\n\
    cmp r7, 0x1F\n\
    bls _080FD360\n\
    movs r7, 0x1F\n\
    b _080FD360\n\
    .align 2, 0\n\
_080FD2E8: .4byte gUnknown_03005DEC\n\
_080FD2EC:\n\
    mov r1, r10\n\
    lsls r0, r1, 1\n\
    add r0, r10\n\
    ldr r1, _080FD320 @ =gUnknown_083E7A50\n\
    adds r1, 0x2\n\
    adds r0, r1\n\
    ldrb r0, [r0]\n\
    lsrs r0, 3\n\
    movs r1, 0x7\n\
    ands r0, r1\n\
    movs r1, 0x3\n\
    str r2, [sp, 0x18]\n\
    str r3, [sp, 0x1C]\n\
    bl __umodsi3\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    ldr r2, [sp, 0x18]\n\
    ldr r3, [sp, 0x1C]\n\
    cmp r0, 0x1\n\
    beq _080FD33C\n\
    cmp r0, 0x1\n\
    bgt _080FD324\n\
    cmp r0, 0\n\
    beq _080FD32A\n\
    b _080FD36C\n\
    .align 2, 0\n\
_080FD320: .4byte gUnknown_083E7A50\n\
_080FD324:\n\
    cmp r0, 0x2\n\
    beq _080FD34E\n\
    b _080FD36C\n\
_080FD32A:\n\
    ldrh r0, [r6, 0x2]\n\
    cmp r7, r0\n\
    bcc _080FD338\n\
    subs r0, r7, r0\n\
    lsls r0, 16\n\
    lsrs r7, r0, 16\n\
    b _080FD36C\n\
_080FD338:\n\
    movs r7, 0\n\
    b _080FD36C\n\
_080FD33C:\n\
    ldrh r0, [r6, 0x2]\n\
    cmp r5, r0\n\
    bcc _080FD34A\n\
    subs r0, r5, r0\n\
    lsls r0, 16\n\
    lsrs r5, r0, 16\n\
    b _080FD36C\n\
_080FD34A:\n\
    movs r5, 0\n\
    b _080FD36C\n\
_080FD34E:\n\
    ldrh r0, [r6, 0x2]\n\
    cmp r4, r0\n\
    bcc _080FD35C\n\
    subs r0, r4, r0\n\
    lsls r0, 16\n\
    lsrs r4, r0, 16\n\
    b _080FD36C\n\
_080FD35C:\n\
    movs r4, 0\n\
    b _080FD36C\n\
_080FD360:\n\
    cmp r5, 0x1F\n\
    bls _080FD366\n\
    movs r5, 0x1F\n\
_080FD366:\n\
    cmp r4, 0x1F\n\
    bls _080FD36C\n\
    movs r4, 0x1F\n\
_080FD36C:\n\
    lsls r0, r4, 10\n\
    lsls r1, r5, 5\n\
    orrs r0, r1\n\
    orrs r7, r0\n\
    strh r7, [r2]\n\
_080FD376:\n\
    mov r0, r8\n\
    adds r0, 0x1\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r8, r0\n\
    mov r0, sp\n\
    ldrh r0, [r0, 0x2]\n\
    cmp r8, r0\n\
    bcs _080FD38A\n\
    b _080FD28A\n\
_080FD38A:\n\
    add sp, 0x20\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n");
}

u16 ConvertColorToGrayscale(u16 *color)
{
    u16 red = *color & 0x1F;
    u16 green = (*color >> 5) & 0x1F;
    u16 blue = (*color >> 10) & 0x1F;
    u16 average = (red + green + blue) / 3;
    return RGB2(average, average, average);
}

// The dark colors are the colored edges of the Cool painting effect.
// Everything else is white.
u16 ConvertCoolColor(u16 *color, u8 personality)
{
    u16 red = *color & 0x1F;
    u16 green = (*color >> 5) & 0x1F;
    u16 blue = (*color >> 10) & 0x1F;
    if (red < 17 && green < 17 && blue < 17)
        return GetCoolColorFromPersonality(personality);
    else
        return RGB2(31, 31, 31);
}

// Based on the given value, which comes from the first 8 bits of
// the mon's personality value, return a color.
u16 GetCoolColorFromPersonality(u8 personality)
{
    u16 red = 0;
    u16 green = 0;
    u16 blue = 0;
    u8 strength = (personality / 6) % 3;
    u8 colorType = personality % 6;

    switch (colorType)
    {
    case 0:
        // Teal color
        green = 21 - strength;
        blue = green;
        red = 0;
        break;
    case 1:
        // Yellow color
        blue = 0;
        red = 21 - strength;
        green = red;
        break;
    case 2:
        // Purple color
        blue = 21 - strength;
        green = 0;
        red = blue;
        break;
    case 3:
        // Red color
        blue = 0;
        green = 0;
        red = 23 - strength;
        break;
    case 4:
        // Blue color
        blue = 23 - strength;
        green = 0;
        red = 0;
        break;
    case 5:
        // Green color
        blue = 0;
        green = 23 - strength;
        red = 0;
        break;
    }

    return RGB2(red, green, blue);
}

u16 ConvertToBlackOrWhite(u16 *color)
{
    u16 red = *color & 0x1F;
    u16 green = (*color >> 5) & 0x1F;
    u16 blue = (*color >> 10) & 0x1F;
    if (red < 17 && green < 17 && blue < 17)
        return RGB2(0, 0, 0);
    else
        return RGB2(31, 31, 31);
}

u16 sub_80FD50C(u16 *colorA, u16 *colorB)
{
    if (*colorA)
    {
        if (*colorA & 0x8000)
            return 0x8000;
        if (*colorB & 0x8000)
            return RGB2(0, 0, 0);

        return *colorA;
    }

    return RGB2(0, 0, 0);
}

u16 InvertColor(u16 *color)
{
    u16 red = *color & 0x1F;
    u16 green = (*color >> 5) & 0x1F;
    u16 blue = (*color >> 10) & 0x1F;
    red = 31 - red;
    green = 31 - green;
    blue = 31 - blue;

    return RGB2(red, green, blue);
}
