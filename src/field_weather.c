#include "global.h"
#include "blend_palette.h"
#include "field_weather.h"
#include "palette.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

#define MACRO1(a) ((((a) >> 1) & 0xF) | (((a) >> 2) & 0xF0) | (((a) >> 3) & 0xF00))

struct Weather
{
    u8 filler_000[0x200];
    u8 unknown_200[2][32];
    u8 filler_240[0x460-0x240];
    u8 unk460[2][32];
    u8 filler4A0[0x6B6-0x4A0];
    s8 unknown_6B6;
    u8 filler_6B7[0xC0-0xB7];
    s8 unknown_6C0;
    s8 unknown_6C1;
    u8 unknown_6C2;
    u8 unknown_6C3;
    u16 unknown_6C4;
    u8 unknown_6C6;
    u8 unknown_6C7;
    u8 unknown_6C8;
    u8 unknown_6C9;
    u8 unknown_6CA;
    u8 unknown_6CB;
    u8 filler_6CC[2];
    u16 unknown_6CE;
    u8 unknown_6D0;
    u8 unknown_6D1;
    u8 filler_6D2[1];
    u8 unknown_6D3;
    u8 unknown_6D4;
    u8 unknown_6D5;
    u8 filler_6D6[2];
    u8 unknown_6D8;
    u8 filler_6D9[1];
    u8 unknown_6DA;
    u8 filler_6DB[3];
    u8 unknown_6DE;
    u8 filler_6DF[5];
    u8 unknown_6E4;
    u8 filler_6E5[0xF];
    u8 unknown_6F4[6];
    u8 unknown_6FA;
    u8 unknown_6FB;
    u8 filler_6FC[4];
    u8 unknown_700;
    u8 filler_701[0x15];
    u8 unknown_716;
    u8 unknown_717;
    u8 filler_718[0xc];
    u8 unknown_724;
    u8 filler_725[9];
    u8 unknown_72E;
    u8 filler_72F;
    u16 unknown_730;
    u16 unknown_732;
    u16 unknown_734;
    u16 unknown_736;
    u8 unknown_738;
    u8 unknown_739;
    u8 unknown_73A;
    u8 filler_73B[0x3C-0x3B];
    s16 unknown_73C;
    s16 unknown_73E;
    s16 unknown_740;
    s16 unknown_742;
    u8 filler_744[0xD-4];
    s8 unknown_74D;
    u8 unknown_74E;
};

#define gWeather gUnknown_0202F7E8
extern struct Weather gUnknown_0202F7E8;
extern u16 gUnknown_0202FF58;
extern u8 *gUnknown_083970E8;
extern u8 (*gUnknown_08396FC8[][4])(void);
extern u8 (*gUnknown_083970B8[])(void);
extern u8 *gUnknown_030006DC;
extern u8 gUnknown_083970C8;

extern const u8 *const gUnknown_08396FA8[];


void sub_807C828(void)
{
    u8 index;
    if (!FuncIsActiveTask(&sub_807CA34))
    {
        index = AllocSpritePalette(0x1200);
        CpuCopy32(&gUnknown_083970E8, &gPlttBufferUnfaded[0x100 + index * 16], 32);
        sub_807CB10();
        gWeather.unknown_6D5 = index;
        gWeather.unknown_6D4 = AllocSpritePalette(0x1201);
        gWeather.unknown_6DA = 0;
        gWeather.unknown_6D8 = 0;
        gWeather.unknown_6DE = 0;
        gWeather.unknown_6E4 = 0;
        gWeather.unknown_700 = 0;
        gWeather.unknown_6FB = 0;
        gWeather.unknown_724 = 0;
        gWeather.unknown_716 = 0;
        gWeather.unknown_717 = 0;
        gWeather.unknown_72E = 0;
        gWeather.unknown_6FA = 0;
        sub_807DB64(16, 0);
        gWeather.unknown_6D0 = 0;
        gWeather.unknown_6C6 = 3;
        gWeather.unknown_6C8 = 0;
        gWeather.unknown_6D3 = 1;
        gWeather.unknown_6C9 = CreateTask(&sub_807C9E4, 80);
    }
}

void DoWeatherEffect(u8 effect)
{
    if (effect != 3 && effect != 5 && effect != 13)
    {
        PlayRainSoundEffect();
    }
    if (gWeather.unknown_6D1 != effect && gWeather.unknown_6D0 == effect)
    {
        gUnknown_08396FC8[effect][0]();
    }
    gWeather.unknown_6D3 = 0;
    gWeather.unknown_6D1 = effect;
    gWeather.unknown_6CE = 0;
}

void sub_807C988(u8 effect)
{
    PlayRainSoundEffect();
    gWeather.unknown_6D0 = effect;
    gWeather.unknown_6D1 = effect;
}

void sub_807C9B4(u8 effect)
{
    PlayRainSoundEffect();
    gWeather.unknown_6D0 = effect;
    gWeather.unknown_6D1 = effect;
    gWeather.unknown_6C8 = 1;
}

void sub_807C9E4(u8 task)
{
    if (gWeather.unknown_6C8)
    {
        gUnknown_08396FC8[gWeather.unknown_6D0][2]();
        gTasks[task].func = &sub_807CA34;
    }
}

void sub_807CA34(u8 task)
{
    u8 v1;
    if (gWeather.unknown_6D0 != gWeather.unknown_6D1)
    {
        v1 = gUnknown_08396FC8[gWeather.unknown_6D0][3]();
        if (!v1)
        {
            gUnknown_08396FC8[gWeather.unknown_6D1][0]();
            gWeather.unknown_6C3 = 0; // compiler reuses v1
            gWeather.unknown_6C6 = 0; // compiler reuses v1
            gWeather.unknown_6D0 = gWeather.unknown_6D1;
            gWeather.unknown_6D3 = 1;
        }
    }
    else
    {
        gUnknown_08396FC8[gWeather.unknown_6D0][1]();
    }
    gUnknown_083970B8[gWeather.unknown_6C6]();
}

void sub_807CAE8(void)
{
    gWeather.unknown_6C1 = 0;
    gWeather.unknown_6C2 = 0;
}

void nullsub_38(void)
{
}

u32 sub_807CB0C(void)
{
    return 0;
}

void sub_807CB10(void)
{
    u16 v0;
    u8 (*v1)[32];
    u16 v2;
    u16 v4;
    u16 v5;
    u16 v6;
    u16 v9;
    u32 v10;
    u16 v11;
    s16 dunno;

    gUnknown_030006DC = &gUnknown_083970C8;
    for (v0 = 0; v0 <= 1; v0++)
    {
        if (v0 == 0)
            v1 = gWeather.unknown_200;
        else
            v1 = gWeather.unk460;

        for (v2 = 0; (u16)v2 <= 0x1f; v2++)
        {
            v4 = v2 << 8;
            if (v0 == 0)
                v5 = (v2 << 8) / 16;
            else
                v5 = 0;
            for (v6 = 0; v6 <= 2; v6++)
            {
                v4 = (v4 - v5);
                v1[v6][v2] = v4 >> 8;
            }
            v9 = v4;
            v10 = 0x1f00 - v4;
            if ((0x1f00 - v4) < 0)
            {
                v10 += 0xf;
            }
            v11 = v10 >> 4;
            if (v2 <= 0xb)
            {
                for (; v6 <= 0x12; v6++)
                {
                    v4 += v11;
                    dunno = v4 - v9;
                    if (dunno > 0)
                    {
                        v4 -= (dunno + ((u16)dunno >> 15)) >> 1;
                    }
                    v1[v6][v2] = v4 >> 8;
                    if (v1[v6][v2] > 0x1f)
                    {
                        v1[v6][v2] = 0x1f;
                    }
                }
            }
            else
            {
                for (; v6 <= 0x12; v6++)
                {
                    v4 += v11;
                    v1[v6][v2] = v4 >> 8;
                    if (v1[v6][v2] > 0x1f)
                    {
                        v1[v6][v2] = 0x1f;
                    }
                }
            }
        }
    }
}

void sub_807CC24(void)
{
    if (gWeather.unknown_6C0 == gWeather.unknown_6C1)
    {
        gWeather.unknown_6C6 = 3;
    }
    else
    {
        if (++gWeather.unknown_6C3 >= gWeather.unknown_6C2)
        {
            gWeather.unknown_6C3 = 0;
            if (gWeather.unknown_6C0 < gWeather.unknown_6C1)
                gWeather.unknown_6C0++;
            else
                gWeather.unknown_6C0--;
            sub_807CEBC(0, 0x20, gWeather.unknown_6C0);
        }
    }
}

void sub_807CCAC(void)
{
    if (++gWeather.unknown_6CB > 1)
        gWeather.unknown_6CA = 0;
    switch (gWeather.unknown_6D0)
    {
    case 3:
    case 4:
    case 5:
    case 11:
    case 13:
        if (sub_807CDC4() == 0)
        {
            gWeather.unknown_6C0 = 3;
            gWeather.unknown_6C6 = 3;
        }
        break;
    case 12:
        if (sub_807CE24() == 0)
        {
            gWeather.unknown_6C0 = -6;
            gWeather.unknown_6C6 = 3;
        }
        break;
    case 6:
        if (sub_807CE7C() == 0)
        {
            gWeather.unknown_6C0 = 0;
            gWeather.unknown_6C6 = 3;
        }
        break;
    case 7:
    case 8:
    case 9:
    case 10:
    default:
        if (!gPaletteFade.active)
        {
            gWeather.unknown_6C0 = gWeather.unknown_6C1;
            gWeather.unknown_6C6 = 3;
        }
        break;
    }
}

u8 sub_807CDC4(void)
{
    if (gWeather.unknown_6C7 == 0x10)
        return 0;
    if (++gWeather.unknown_6C7 >= 0x10)
    {
        sub_807CEBC(0, 0x20, 3);
        gWeather.unknown_6C7 = 0x10;
        return 0;
    }
    sub_807D1BC(0, 0x20, 3, 0x10 - gWeather.unknown_6C7, gWeather.unknown_6C4);
    return 1;
}

u8 sub_807CE24(void)
{
    if (gWeather.unknown_6C7 == 0x10)
        return 0;
    if (++gWeather.unknown_6C7 >= 0x10)
    {
        sub_807CEBC(0, 0x20, -6);
        gWeather.unknown_6C7 = 0x10;
        return 0;
    }
    sub_807D304(-6, 0x10 - gWeather.unknown_6C7, gWeather.unknown_6C4);
    return 1;
}

u8 sub_807CE7C(void)
{
    if (gWeather.unknown_6C7 == 0x10)
        return 0;
    ++gWeather.unknown_6C7;
    sub_807D424(0x10 - gWeather.unknown_6C7, gWeather.unknown_6C4);
    return 1;
}

void nullsub_39(void)
{
}

struct RGBColor
{
    u16 r:5;
    u16 g:5;
    u16 b:5;
};

extern u8 ewram[];

struct Struct2000000
{
    u16 data[0][0x1000];  // unknown length
};

#define ewram0 (*(struct Struct2000000 *)ewram)

void sub_807CEBC(u8 a, u8 b, s8 c)
{
    u16 r4;
    u16 palOffset;
    u8 *r6;
    u16 i;

    if (c > 0)
    {
        c = c - 1;
        palOffset = a * 16;
        b += a;
        r4 = a;
        while (r4 < b)
        {
            if (gUnknown_030006DC[r4] == 0)
            {
                CpuFastCopy(gPlttBufferUnfaded + palOffset, gPlttBufferFaded + palOffset, 16 * sizeof(u16));
                palOffset += 16;
            }
            else
            {
                u8 r, g, b;

                if (gUnknown_030006DC[r4] == 2 || r4 - 16 == gWeather.unknown_6D5)
                    r6 = gWeather.unk460[c];
                else
                    r6 = gWeather.unknown_200[c];
                if (r4 == 16 || r4 > 0x1B)
                {
                    for (i = 0; i < 16; i++)
                    {
                        if (gPlttBufferUnfaded[palOffset] == 0x2D9F)
                        {
                            palOffset++;
                        }
                        else
                        {
                            struct RGBColor color = *(struct RGBColor *)&gPlttBufferUnfaded[palOffset];

                            r = r6[color.r];
                            g = r6[color.g];
                            b = r6[color.b];
                            gPlttBufferFaded[palOffset++] = (b << 10) | (g << 5) | r;
                        }
                    }
                }
                else
                {
                    for (i = 0; i < 16; i++)
                    {
                        struct RGBColor color = *(struct RGBColor *)&gPlttBufferUnfaded[palOffset];

                        r = r6[color.r];
                        g = r6[color.g];
                        b = r6[color.b];
                        gPlttBufferFaded[palOffset++] = (b << 10) | (g << 5) | r;
                    }
                }
            }
            r4++;
        }
    }
    else if (c < 0)
    {
        c = -c - 1;
        palOffset = a * 16;
        b += a;
        r4 = a;
        while (r4 < b)
        {
            if (gUnknown_030006DC[r4] == 0)
            {
                CpuFastCopy(gPlttBufferUnfaded + palOffset, gPlttBufferFaded + palOffset, 16 * sizeof(u16));
                palOffset += 16;
            }
            else
            {
                if (r4 == 16 || r4 > 0x1B)
                {
                    for (i = 0; i < 16; i++)
                    {
                        if (gPlttBufferUnfaded[palOffset] != 0x2D9F)
                            gPlttBufferFaded[palOffset] = ewram0.data[c][MACRO1(gPlttBufferUnfaded[palOffset])];
                        palOffset++;
                    }
                }
                else
                {
                    for (i = 0; i < 16; i++)
                    {
                        gPlttBufferFaded[palOffset] = ewram0.data[c][MACRO1(gPlttBufferUnfaded[palOffset])];
                        palOffset++;
                    }
                }
            }
            r4++;
        }
    }
    else
    {
        CpuFastCopy(gPlttBufferUnfaded + a * 16, gPlttBufferFaded + a * 16, b * 16 * sizeof(u16));
    }
}

void sub_807D1BC(u8 a1, u8 a2, s8 c, u8 d, u16 e)
{
    u16 palOffset;
    u16 r4;
    u16 i;
    struct RGBColor color = *(struct RGBColor *)&e;
    u8 r_ = color.r;
    u8 g_ = color.g;
    u8 b_ = color.b;

    palOffset = a1 * 16;
    a2 += a1;
    c = c - 1;
    r4 = a1;
    while (r4 < a2)
    {
        if (gUnknown_030006DC[r4] == 0)
        {
            BlendPalette(palOffset, 16, d, e);
            palOffset += 16;
        }
        else
        {
            u8 *r5;

            if (gUnknown_030006DC[r4] == 1)
                r5 = gWeather.unknown_200[c];
            else
                r5 = gWeather.unk460[c];

            for (i = 0; i < 16; i++)
            {
                struct RGBColor color = *(struct RGBColor *)&gPlttBufferUnfaded[palOffset];
                u8 r = r5[color.r];
                u8 g = r5[color.g];
                u8 b = r5[color.b];

                r += ((r_ - r) * d) >> 4;
                g += ((g_ - g) * d) >> 4;
                b += ((b_ - b) * d) >> 4;
                gPlttBufferFaded[palOffset++] = (b << 10) | (g << 5) | r;
            }
        }
        r4++;
    }
}

void sub_807D304(s8 a, u8 arg2, u16 c)
{
    struct RGBColor color;
    u8 r_;
    u8 g_;
    u8 b_;
    u16 r4;
    u16 r5;
    u16 r12;

    a = -a - 1;
    color = *(struct RGBColor *)&c;
    r_ = color.r;
    g_ = color.g;
    b_ = color.b;
    r5 = 0;
    for (r4 = 0; r4 < 32; r4++)
    {
        if (gUnknown_030006DC[r4] == 0)
        {
            BlendPalette(r5, 16, arg2, c);
            r5 += 16;
        }
        else
        {
            for (r12 = 0; r12 < 16; r12++)
            {
                u32 offset;
                struct RGBColor color1;
                struct RGBColor color2;
                u8 r1, g1, b1;
                u8 r2, g2, b2;

                color1 = *(struct RGBColor *)&gPlttBufferUnfaded[r5];
                r1 = color1.r;
                g1 = color1.g;
                b1 = color1.b;

                offset = ((b1 & 0x1E) << 7) | ((g1 & 0x1E) << 3) | ((r1 & 0x1E) >> 1);
                color2 = *(struct RGBColor *)&ewram0.data[a][offset];
                r2 = color2.r;
                g2 = color2.g;
                b2 = color2.b;

                r2 += ((r_ - r2) * arg2) >> 4;
                g2 += ((g_ - g2) * arg2) >> 4;
                b2 += ((b_ - b2) * arg2) >> 4;

                gPlttBufferFaded[r5++] = (b2 << 10) | (g2 << 5) | r2;
            }
        }
    }
}

bool8 sub_807D574(u8);

void sub_807D424(u8 a, u16 b)
{
    struct RGBColor color;
    u8 r_;
    u8 g_;
    u8 b_;
    u16 r4;

    BlendPalette(0, 0x100, a, b);
    color = *(struct RGBColor *)&b;
    r_ = color.r;
    g_ = color.g;
    b_ = color.b;

    r4 = 16;
    while (r4 < 32)
    {
        if (sub_807D574(r4))
        {
            u16 r12 = (r4 + 1) * 16;
            u16 r6 = r4 * 16;

            while (r6 < r12)
            {
                struct RGBColor color = *(struct RGBColor *)&gPlttBufferUnfaded[r6];
                u8 r = color.r;
                u8 g = color.g;
                u8 b = color.b;

                r += ((28 - r) * 3) >> 2;
                g += ((31 - g) * 3) >> 2;
                b += ((28 - b) * 3) >> 2;

                r += ((r_ - r) * a) >> 4;
                g += ((g_ - g) * a) >> 4;
                b += ((b_ - b) * a) >> 4;

                gPlttBufferFaded[r6] = (b << 10) | (g << 5) | r;
                r6++;
            }
        }
        else
        {
            BlendPalette(r4 * 16, 16, a, b);
        }
        r4++;
    }
}

void sub_807D540(u8 a)
{
    if (gWeather.unknown_6FA < 6)
    {
        gWeather.unknown_6F4[gWeather.unknown_6FA] = a;
        gWeather.unknown_6FA++;
    }
}

bool8 sub_807D574(u8 a)
{
    u16 i;

    for (i = 0; i < gWeather.unknown_6FA; i++)
    {
        if (gWeather.unknown_6F4[i] == a)
            return TRUE;
    }
    return FALSE;
}

void sub_807D5BC(s8 a)
{
    if (gWeather.unknown_6C6 == 3)
    {
        sub_807CEBC(0, 32, a);
        gWeather.unknown_6C0 = a;
    }
}

void sub_807D5F0(u8 a, u8 b, u8 c)
{
    if (gWeather.unknown_6C6 == 3)
    {
        gWeather.unknown_6C6 = 0;
        gWeather.unknown_6C0 = a;
        gWeather.unknown_6C1 = b;
        gWeather.unknown_6C3 = 0;
        gWeather.unknown_6C2 = c;
        sub_807D5BC(a);
    }
}

void fade_screen(u8 a, u8 b)
{
    u32 r4;
    u32 r1;
    u32 r2;

    switch (a)
    {
    case 0:
        r4 = 0;
        r1 = 0;
        break;
    case 2:
        r4 = 0xFFFF;
        r1 = 0;
        break;
    case 1:
        r4 = 0;
        r1 = 1;
        break;
    case 3:
        r4 = 0xFFFF;
        r1 = 1;
        break;
    default:
        return;
    }

    switch (gWeather.unknown_6D0)
    {
    case 3:
    case 4:
    case 5:
    case 6:
    case 11:
    case 12:
    case 13:
        r2 = 1;
        break;
    default:
        r2 = 0;
        break;
    }

    if (r1 != 0)
    {
        if (r2 != 0)
            CpuFastCopy(gPlttBufferFaded, gPlttBufferUnfaded, 0x400);
        BeginNormalPaletteFade(0xFFFFFFFF, b, 0, 16, r4);
        gWeather.unknown_6C6 = 2;
    }
    else
    {
        gWeather.unknown_6C4 = r4;
        if (r2 != 0)
            gWeather.unknown_6C7 = 0;
        else
            BeginNormalPaletteFade(0xFFFFFFFF, b, 16, 0, r4);
        gWeather.unknown_6C6 = 1;
        gWeather.unknown_6CA = 1;
        gWeather.unknown_6CB = 0;
        sub_807DB64(gWeather.unknown_730, gWeather.unknown_732);
        gWeather.unknown_6C8 = 1;
    }
}

bool8 sub_807D770(void)
{
    return gWeather.unknown_6C6 ^ 1 ? TRUE : FALSE;
}

void sub_807D78C(u8 a)
{
    u16 r4 = 16 + a;
    u16 i;

    switch (gWeather.unknown_6C6)
    {
    case 1:
        if (gWeather.unknown_6CA != 0)
        {
            if (gWeather.unknown_6D0 == 6)
                sub_807D540(r4);
            r4 *= 16;
            for (i = 0; i < 16; i++)
                gPlttBufferFaded[r4 + i] = gWeather.unknown_6C4;
        }
        break;
    case 2:
        r4 *= 16;
        CpuFastCopy(gPlttBufferFaded + r4, gPlttBufferUnfaded + r4, 32);
        BlendPalette(r4, 16, gPaletteFade.y, gPaletteFade.blendColor);
        break;
    default:
        if (gWeather.unknown_6D0 != 6)
        {
            sub_807CEBC(r4, 1, gWeather.unknown_6C0);
        }
        else
        {
            r4 *= 16;
            BlendPalette(r4, 16, 12, 0x73FC);
        }
        break;
    }
}

void sub_807D874(u8 a)
{
    sub_807CEBC(a, 1, gWeather.unknown_6C0);
}

u8 unref_sub_807D894(void)
{
    if (gWeather.unknown_6C6 == 1)
        return gWeather.unknown_6CA;
    else
        return 0;
}

void sub_807D8C0(const u16 *palette)
{
    LoadPalette(palette, 0x100 + gWeather.unknown_6D4 * 16, 32);
    sub_807D78C(gWeather.unknown_6D4);
}

void sub_807D8F0(u8 *a, u8 *b)
{
    u8 r4 = *a;
    u16 i;

    if (r4 < 7)
    {
        r4--;
        LZ77UnCompWram(gUnknown_08396FA8[r4], ewram0.data[r4]);
        if (r4 == 0)
        {
            ewram0.data[r4][0] = 0x421;
            for (i = 1; i < 0x1000; i++)
                ewram0.data[r4][i] += ewram0.data[r4][i - 1];
        }
        else
        {
            for (i = 0; i < 0x1000; i++)
                ewram0.data[r4][i] += ewram0.data[r4 - 1][i];
        }
        (*a)++;
        if (*a == 7)
        {
            *a = 32;
            *b = 32;
        }
    }
}

void sub_807D9A8(void)
{
    gWeather.unknown_74D = 1;
    gWeather.unknown_74E = 1;
}

bool8 sub_807D9C8(void)
{
    if (gWeather.unknown_74D < 32)
    {
        sub_807D8F0(&gWeather.unknown_74D, &gWeather.unknown_74E);
        if (gWeather.unknown_74D < 32)
            return TRUE;
    }
    return FALSE;
}

void sub_807DA04(s8 a)
{
    sub_807D5BC(-a - 1);
}

void sub_807DA14(void)
{
    gWeather.unknown_73C = 0;
    gWeather.unknown_740 = 0;
    gWeather.unknown_742 = 0;
    gWeather.unknown_73E = 0;
    gUnknown_0202FF58 = 5;
}

void sub_807DA4C(void)
{
    switch (gWeather.unknown_742)
    {
    case 0:
        if (++gWeather.unknown_740 > gUnknown_0202FF58)
        {
            gWeather.unknown_740 = 0;
            sub_807DA04(gWeather.unknown_73C++);
            if (gWeather.unknown_73C > 5)
            {
                gWeather.unknown_73E = gWeather.unknown_73C;
                gWeather.unknown_742 = 1;
                gWeather.unknown_740 = 0x3C;
            }
        }
        break;
    case 1:
        gWeather.unknown_740 = (gWeather.unknown_740 + 3) & 0x7F;
        gWeather.unknown_73C = ((gSineTable[gWeather.unknown_740] - 1) >> 6) + 2;
        if (gWeather.unknown_73C != gWeather.unknown_73E)
            sub_807DA04(gWeather.unknown_73C);
        gWeather.unknown_73E = gWeather.unknown_73C;
        break;
    case 2:
        if (++gWeather.unknown_740 > gUnknown_0202FF58)
        {
            gWeather.unknown_740 = 0;
            sub_807DA04(--gWeather.unknown_73C);
            if (gWeather.unknown_73C == 3)
                gWeather.unknown_742 = 0;
        }
        break;
    }
}

void sub_807DB64(u8 a, u8 b)
{
    gWeather.unknown_730 = a;
    gWeather.unknown_732 = b;
    gWeather.unknown_734 = a;
    gWeather.unknown_736 = b;
    REG_BLDALPHA = (b << 8) | a;
}

void sub_807DBA4(u8 a, u8 b, int c)
{
    gWeather.unknown_734 = a;
    gWeather.unknown_736 = b;
    gWeather.unknown_73A = c;
    gWeather.unknown_739 = 0;
    gWeather.unknown_738 = 0;
}

bool8 sub_807DBE8(void)
{
    if (gWeather.unknown_730 == gWeather.unknown_734
     && gWeather.unknown_732 == gWeather.unknown_736)
        return TRUE;
    if (++gWeather.unknown_739 > gWeather.unknown_73A)
    {
        gWeather.unknown_739 = 0;
        gWeather.unknown_738++;
        if (gWeather.unknown_738 & 1)
        {
            if (gWeather.unknown_730 < gWeather.unknown_734)
                gWeather.unknown_730++;
            else if (gWeather.unknown_730 > gWeather.unknown_734)
                gWeather.unknown_730--;
        }
        else
        {
            if (gWeather.unknown_732 < gWeather.unknown_736)
                gWeather.unknown_732++;
            else if (gWeather.unknown_732 > gWeather.unknown_736)
                gWeather.unknown_732--;
        }
    }
    REG_BLDALPHA = (gWeather.unknown_732 << 8) | gWeather.unknown_730;
    if (gWeather.unknown_730 == gWeather.unknown_734
     && gWeather.unknown_732 == gWeather.unknown_736)
        return TRUE;
    return FALSE;
}
