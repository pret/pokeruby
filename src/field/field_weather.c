#include "global.h"
#include "blend_palette.h"
#include "field_map_obj.h"
#include "field_weather.h"
#include "palette.h"
#include "rng.h"
#include "script.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "ewram.h"

#define MACRO1(a) ((((a) >> 1) & 0xF) | (((a) >> 2) & 0xF0) | (((a) >> 3) & 0xF00))

struct RGBColor
{
    u16 r:5;
    u16 g:5;
    u16 b:5;
};

struct WeatherPaletteData
{
    u16 data[0][0x1000];  // unknown length
};

struct Weather
{
    struct Sprite *unknown_0[24];
    struct Sprite *unknown_60[0x65];  // snowflakes?
    struct Sprite *unknown_1F4[3];
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
    u16 unknown_6CC;
    u16 unknown_6CE;
    u8 unknown_6D0;
    u8 unknown_6D1;
    u8 unknown_6D2;
    u8 unknown_6D3;
    u8 unknown_6D4;
    u8 unknown_6D5;
    u16 unknown_6D6;
    u8 unknown_6D8;
    u8 unknown_6D9;
    u8 unknown_6DA;
    u8 unknown_6DB;
    u8 unknown_6DC;
    u8 unknown_6DD;
    u8 unknown_6DE;
    u8 filler_6DF[1];
    u16 unknown_6E0;
    u16 unknown_6E2;
    u8 unknown_6E4;
    u8 unknown_6E5;
    u16 unknown_6E6;
    u16 unknown_6E8;
    u8 unknown_6EA;
    u8 unknown_6EB;
    u8 unknown_6EC;
    u8 unknown_6ED;
    u16 unknown_6EE;
    u16 unknown_6F0;
    u16 unknown_6F2;
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
extern u8 gUnknown_0202FF38[];
extern u16 gUnknown_0202FF58;
extern u8 *gUnknown_083970E8;
extern u8 (*gUnknown_08396FC8[][4])(void);
extern u8 (*gUnknown_083970B8[])(void);
IWRAM_DATA const u8 *gUnknown_030006DC;
extern const u8 gUnknown_083970C8[];

// This is a pointer to gWeather. All code sub_807DE78 and below uses this pointer,
// while everything above accesses gWeather directly.
extern struct Weather *const gUnknown_08396FC4;

extern const struct SpriteSheet gUnknown_0839A9D4;
extern const struct SpriteTemplate gSpriteTemplate_839A9F0;
extern const u16 gUnknown_08397108[];
//extern const s16 gUnknown_0839A9C8[][2];
extern const struct Coords16 gUnknown_0839A9C8[];
extern const struct SpriteSheet gUnknown_0839AACC;
extern const struct SpriteTemplate gSpriteTemplate_839AAA4;
extern const struct SpriteTemplate gSpriteTemplate_839AB04;

const u8 DroughtPaletteData_0[] = INCBIN_U8("graphics/weather/drought0.bin.lz");
const u8 DroughtPaletteData_1[] = INCBIN_U8("graphics/weather/drought1.bin.lz");
const u8 DroughtPaletteData_2[] = INCBIN_U8("graphics/weather/drought2.bin.lz");
const u8 DroughtPaletteData_3[] = INCBIN_U8("graphics/weather/drought3.bin.lz");
const u8 DroughtPaletteData_4[] = INCBIN_U8("graphics/weather/drought4.bin.lz");
const u8 DroughtPaletteData_5[] = INCBIN_U8("graphics/weather/drought5.bin.lz");
extern u8 (*gUnknown_0202FC48)[32];
extern u8 gUnknown_0202F9E8[32];

const u8 *const gUnknown_08396FA8[] =
{
    DroughtPaletteData_0,
    DroughtPaletteData_1,
    DroughtPaletteData_2,
    DroughtPaletteData_3,
    DroughtPaletteData_4,
    DroughtPaletteData_5,
    gSharedMem,
};

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
        gWeather.unknown_6C9 = CreateTask(sub_807C9E4, 80);
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

void sub_807C9E4(u8 taskId)
{
    if (gWeather.unknown_6C8)
    {
        gUnknown_08396FC8[gWeather.unknown_6D0][2]();
        gTasks[taskId].func = sub_807CA34;
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

    gUnknown_030006DC = gUnknown_083970C8;
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
                            gPlttBufferFaded[palOffset] = eWeatherPaletteData.data[c][MACRO1(gPlttBufferUnfaded[palOffset])];
                        palOffset++;
                    }
                }
                else
                {
                    for (i = 0; i < 16; i++)
                    {
                        gPlttBufferFaded[palOffset] = eWeatherPaletteData.data[c][MACRO1(gPlttBufferUnfaded[palOffset])];
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
                color2 = *(struct RGBColor *)&eWeatherPaletteData.data[a][offset];
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
        LZ77UnCompWram(gUnknown_08396FA8[r4], eWeatherPaletteData.data[r4]);
        if (r4 == 0)
        {
            eWeatherPaletteData.data[r4][0] = 0x421;
            for (i = 1; i < 0x1000; i++)
                eWeatherPaletteData.data[r4][i] += eWeatherPaletteData.data[r4][i - 1];
        }
        else
        {
            for (i = 0; i < 0x1000; i++)
                eWeatherPaletteData.data[r4][i] += eWeatherPaletteData.data[r4 - 1][i];
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

void unref_sub_807DCB4(u8 a)
{
    switch (a)
    {
    case 1:
        SetWeather(1);
        break;
    case 2:
        SetWeather(2);
        break;
    case 3:
        SetWeather(3);
        break;
    case 4:
        SetWeather(4);
        break;
    case 5:
        SetWeather(5);
        break;
    case 6:
        SetWeather(6);
        break;
    case 7:
        SetWeather(9);
        break;
    case 8:
        SetWeather(7);
        break;
    case 9:
        SetWeather(8);
        break;
    case 10:
        SetWeather(11);
        break;
    }
}

u8 weather_get_current(void)
{
    return gWeather.unknown_6D0;
}

void sub_807DD5C(u16 sndEff)
{
    if (gUnknown_0202F7E8.unknown_6C6 != 2)
    {
        switch (sndEff)
        {
        case SE_T_KOAME:
            gUnknown_0202F7E8.unknown_6DD = 0;
            break;
        case SE_T_OOAME:
            gUnknown_0202F7E8.unknown_6DD = 1;
            break;
        case SE_T_AME:
            gUnknown_0202F7E8.unknown_6DD = 2;
            break;
        default:
            return;
        }
        PlaySE(sndEff);
    }
}

void PlayRainSoundEffect(void)
{
    if (IsSpecialSEPlaying())
    {
        switch (gUnknown_0202F7E8.unknown_6DD)
        {
        case 0:
            PlaySE(0x56);
            break;
        case 1:
            PlaySE(0x54);
            break;
        case 2:
        default:
            PlaySE(0x52);
            break;
        }
    }
}

u8 sub_807DDFC(void)
{
    return gUnknown_0202F7E8.unknown_6D3;
}

void sub_807DE10(void)
{
    gUnknown_0202F7E8.unknown_6C6 = 2;
}

void unref_sub_807DE24(void)
{
    gUnknown_0202F7E8.unknown_6C6 = 3;
}

void sub_807DE38(u8 a)
{
    CpuCopy16(gUnknown_083970C8, gUnknown_0202FF38, 32);
    gUnknown_0202FF38[a] = 0;
    gUnknown_030006DC = gUnknown_0202FF38;
}

void sub_807DE68(void)
{
    gUnknown_030006DC = gUnknown_083970C8;
}

void sub_807DE78(void)
{
    gUnknown_08396FC4->unknown_6C1 = 0;
    gUnknown_08396FC4->unknown_6C2 = 20;
    gUnknown_08396FC4->unknown_6D2 = 0;
    gUnknown_08396FC4->unknown_6CC = 0;
    if (gUnknown_08396FC4->unknown_6DE == 0)
        sub_807DB64(0, 16);
}

void sub_807DEF4(void);

void sub_807DEC4(void)
{
    sub_807DE78();
    while (gUnknown_08396FC4->unknown_6D2 == 0)
        sub_807DEF4();
}

void sub_807DFD4(void);

void sub_807DEF4(void)
{
    switch (gUnknown_08396FC4->unknown_6CC)
    {
    case 0:
        sub_807DFD4();
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 1:
        sub_807DBA4(12, 8, 1);
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 2:
        if (sub_807DBE8())
        {
            gUnknown_08396FC4->unknown_6D2 = 1;
            gUnknown_08396FC4->unknown_6CC++;
        }
        break;
    }
}

void sub_807E0A0(void);

bool8 sub_807DF54(void)
{
    switch (gUnknown_08396FC4->unknown_6CE)
    {
    case 0:
        sub_807DBA4(0, 16, 1);
        gUnknown_08396FC4->unknown_6CE++;
        return TRUE;
    case 1:
        if (sub_807DBE8())
        {
            sub_807E0A0();
            gUnknown_08396FC4->unknown_6CE++;
        }
        return TRUE;
    }
    return FALSE;
}

void sub_807DF9C(void)
{
    gUnknown_08396FC4->unknown_6C1 = 0;
    gUnknown_08396FC4->unknown_6C2 = 20;
}

void sub_807DFC0(void)
{
    sub_807DF9C();
}

void nullsub_55(void)
{
}

int sub_807DFD0(void)
{
    return 0;
}

void sub_807DFD4(void)
{
    u16 i;

    if (gUnknown_08396FC4->unknown_6DE == 1)
        return;
    LoadSpriteSheet(&gUnknown_0839A9D4);
    sub_807D8C0(gUnknown_08397108);
    for (i = 0; i < 3; i++)
    {
        u8 spriteId = CreateSprite(&gSpriteTemplate_839A9F0, 0, 0, 0xFF);

        if (spriteId != 64)
        {
            struct Sprite *sprite;

            gUnknown_08396FC4->unknown_1F4[i] = &gSprites[spriteId];
            sprite = gUnknown_08396FC4->unknown_1F4[i];
            sub_80603CC(gUnknown_0839A9C8[i].x + 7, gUnknown_0839A9C8[i].y + 7, &sprite->pos1.x, &sprite->pos1.y);
            sprite->coordOffsetEnabled = TRUE;
        }
        else
        {
            gUnknown_08396FC4->unknown_1F4[i] = NULL;
        }
    }
    gUnknown_08396FC4->unknown_6DE = 1;
}

void sub_807E0A0(void)
{
    u16 i;

    if (gUnknown_08396FC4->unknown_6DE == 0)
        return;
    for (i = 0; i < 3; i++)
    {
        if (gUnknown_08396FC4->unknown_1F4[i] != NULL)
            DestroySprite(gUnknown_08396FC4->unknown_1F4[i]);
    }
    FreeSpriteTilesByTag(0x1200);
    gUnknown_08396FC4->unknown_6DE = 0;
}

void sub_807E0F4(struct Sprite *sprite)
{
    sprite->data[0] = (sprite->data[0] + 1) & 1;
    if (sprite->data[0] != 0)
        sprite->pos1.x--;
}

void sub_807E110(void)
{
    gUnknown_08396FC4->unknown_6CC = 0;
    gUnknown_08396FC4->unknown_6D2 = 0;
    gUnknown_08396FC4->unknown_6C1 = 0;
    gUnknown_08396FC4->unknown_6C2 = 0;
}

void sub_807E174(void);

void sub_807E144(void)
{
    sub_807E110();
    while (gUnknown_08396FC4->unknown_6D2 == 0)
        sub_807E174();
}

void sub_807E174(void)
{
    switch (gUnknown_08396FC4->unknown_6CC)
    {
    case 0:
        if (gUnknown_08396FC4->unknown_6C6 != 0)
            gUnknown_08396FC4->unknown_6CC++;
        break;
    case 1:
        sub_807D9A8();
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 2:
        if (sub_807D9C8() == FALSE)
            gUnknown_08396FC4->unknown_6CC++;
        break;
    case 3:
        sub_807DA14();
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 4:
        sub_807DA4C();
        if (gUnknown_08396FC4->unknown_73C == 6)
        {
            gUnknown_08396FC4->unknown_6D2 = 1;
            gUnknown_08396FC4->unknown_6CC++;
        }
        break;
    default:
        sub_807DA4C();
        break;
    }
}

int sub_807E258(void)
{
    return 0;
}

void task50_0807B6D4(u8);

void sub_807E25C(void)
{
    CreateTask(task50_0807B6D4, 0x50);
}

#define tState      data[0]
#define tBlendY     data[1]
#define tBlendDelay data[2]
#define tWinRange   data[3]

void task50_0807B6D4(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->tState)
    {
    case 0:
        task->tBlendY = 0;
        task->tBlendDelay = 0;
        task->tWinRange = REG_WININ;
        REG_WININ = WIN_RANGE(63, 63);
        REG_BLDCNT = 0x9E;
        REG_BLDY = 0;
        task->tState++;
        // fall through
    case 1:
        task->tBlendY += 3;
        if (task->tBlendY > 16)
            task->tBlendY = 16;
        REG_BLDY = task->tBlendY;
        if (task->tBlendY >= 16)
            task->tState++;
        break;
    case 2:
        task->tBlendDelay++;
        if (task->tBlendDelay > 9)
        {
            task->tBlendDelay = 0;
            task->tBlendY--;
            if (task->tBlendY <= 0)
            {
                task->tBlendY = 0;
                task->tState++;
            }
            REG_BLDY = task->tBlendY;
        }
        break;
    case 3:
        REG_BLDCNT = 0;
        REG_BLDY = 0;
        REG_WININ = task->tWinRange;
        task->tState++;
        break;
    case 4:
        EnableBothScriptContexts();
        DestroyTask(taskId);
        break;
    }
}

#undef tState
#undef tBlendY
#undef tBlendDelay
#undef tWinRange

void sub_807E364(void)
{
    gUnknown_08396FC4->unknown_6CC = 0;
    gUnknown_08396FC4->unknown_6D2 = 0;
    gUnknown_08396FC4->unknown_6D6 = 0;
    gUnknown_08396FC4->unknown_6DB = 8;
    gUnknown_08396FC4->unknown_6DC = 0;
    gUnknown_08396FC4->unknown_6D9 = 10;
    gUnknown_08396FC4->unknown_6C1 = 3;
    gUnknown_08396FC4->unknown_6C2 = 20;
    sub_807DD5C(SE_T_KOAME);
}

void sub_807E400(void);

void sub_807E3D0(void)
{
    sub_807E364();
    while (gUnknown_08396FC4->unknown_6D2 == 0)
        sub_807E400();
}

void sub_807E7A4(void);
u8 sub_807E7B4(void);
u8 sub_807E8E8(void);

void sub_807E400(void)
{
    switch (gUnknown_08396FC4->unknown_6CC)
    {
    case 0:
        sub_807E7A4();
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 1:
        if (sub_807E7B4() == 0)
            gUnknown_08396FC4->unknown_6CC++;
        break;
    case 2:
        if (sub_807E8E8() == FALSE)
        {
            gUnknown_08396FC4->unknown_6D2 = 1;
            gUnknown_08396FC4->unknown_6CC++;
        }
        break;
    }
}

void sub_807E974(void);

bool8 sub_807E460(void)
{
    switch (gUnknown_08396FC4->unknown_6CE)
    {
    case 0:
        if (gUnknown_08396FC4->unknown_6D1 == 3
         || gUnknown_08396FC4->unknown_6D1 == 5
         || gUnknown_08396FC4->unknown_6D1 == 13)
        {
            gUnknown_08396FC4->unknown_6CE = 0xFF;
            return FALSE;
        }
        else
        {
            gUnknown_08396FC4->unknown_6D9 = 0;
            gUnknown_08396FC4->unknown_6CE++;
        }
        // fall through
    case 1:
        if (sub_807E8E8() == FALSE)
        {
            sub_807E974();
            gUnknown_08396FC4->unknown_6CE++;
            return FALSE;
        }
        return TRUE;
    }
    return FALSE;
}

//extern const struct Coords16 gUnknown_0839AAC4[];
extern const u16 gUnknown_0839AAC4[][2];
//extern const struct Coords16 gUnknown_0839AABC[];
extern const s16 gUnknown_0839AABC[][2];

void sub_807E4EC(struct Sprite *sprite)
{
    u32 randVal;
    u16 r6;
    s32 r4;
    s32 r0;

    if (sprite->data[1] == 0)
        sprite->data[1] = 361;
    randVal = sprite->data[1] * 1103515245 + 12345;
    sprite->data[1] = ((randVal & 0x7FFF0000) >> 16) % 600;

    r6 = gUnknown_0839AAC4[gUnknown_08396FC4->unknown_6DC][0];

    r4 = sprite->data[1] % 30;
    sprite->data[2] = r4 * 8;  // useless assignment

    r0 = sprite->data[1] / 30;
    sprite->data[3] = r0 * 8;  // useless assignment

    sprite->data[2] = r4;
    sprite->data[2] <<= 7;

    sprite->data[3] = r0;
    sprite->data[3] <<= 7;

    sprite->data[2] -= gUnknown_0839AABC[gUnknown_08396FC4->unknown_6DC][0] * r6;
    sprite->data[3] -= gUnknown_0839AABC[gUnknown_08396FC4->unknown_6DC][1] * r6;

    StartSpriteAnim(sprite, 0);
    sprite->data[4] = 0;
    sprite->coordOffsetEnabled = FALSE;
    sprite->data[0] = r6;
}

void sub_807E5C0(struct Sprite *sprite)
{
    if (sprite->data[4] == 0)
    {
        sprite->data[2] += gUnknown_0839AABC[gUnknown_08396FC4->unknown_6DC][0];
        sprite->data[3] += gUnknown_0839AABC[gUnknown_08396FC4->unknown_6DC][1];
        sprite->pos1.x = sprite->data[2] >> 4;
        sprite->pos1.y = sprite->data[3] >> 4;

        if (sprite->data[5] != 0
         && (sprite->pos1.x >= -8 && sprite->pos1.x <= 248)
         && sprite->pos1.y >= -16 && sprite->pos1.y <= 176)
            sprite->invisible = FALSE;
        else
            sprite->invisible = TRUE;

        sprite->data[0]--;
        if (sprite->data[0] == 0)
        {
            StartSpriteAnim(sprite, gUnknown_08396FC4->unknown_6DC + 1);
            sprite->data[4] = 1;
            sprite->pos1.x -= gSpriteCoordOffsetX;
            sprite->pos1.y -= gSpriteCoordOffsetY;
            sprite->coordOffsetEnabled = TRUE;
        }
    }
    else if (sprite->animEnded)
    {
        sprite->invisible = TRUE;
        sub_807E4EC(sprite);
    }
}

void sub_807E6C4(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        sub_807E4EC(sprite);
        sprite->callback = sub_807E5C0;
    }
    else
    {
        sprite->data[0]--;
    }
}

void sub_807E6F0(struct Sprite *sprite, u16 b)
{
    u16 r8 = gUnknown_0839AAC4[gUnknown_08396FC4->unknown_6DC][0];
    u16 r6 = b / (gUnknown_0839AAC4[gUnknown_08396FC4->unknown_6DC][1] + r8);
    u16 r4 = b % (gUnknown_0839AAC4[gUnknown_08396FC4->unknown_6DC][1] + r8);

    while (--r6 != 0xFFFF)
        sub_807E4EC(sprite);
    if (r4 < r8)
    {
        while (--r4 != 0xFFFF)
            sub_807E5C0(sprite);
        sprite->data[6] = 0;
    }
    else
    {
        sprite->data[0] = r4 - r8;
        sprite->invisible = TRUE;
        sprite->data[6] = 1;
    }
}

void sub_807E7A4(void)
{
    LoadSpriteSheet(&gUnknown_0839AACC);
}

extern const struct Coords16 gUnknown_0839AA08[];

bool8 sub_807E7B4(void)
{
    u8 r7;
    u8 spriteId;

    if (gUnknown_08396FC4->unknown_6DA == 24)
        return FALSE;

    r7 = gUnknown_08396FC4->unknown_6DA;
    spriteId = CreateSpriteAtEnd(&gSpriteTemplate_839AAA4,
      gUnknown_0839AA08[r7].x, gUnknown_0839AA08[r7].y, 78);
    if (spriteId != 64)
    {
        gSprites[spriteId].data[5] = 0;
        gSprites[spriteId].data[1] = r7 * 145;
        while (gSprites[spriteId].data[1] >= 600)
            gSprites[spriteId].data[1] -= 600;
        sub_807E4EC(&gSprites[spriteId]);
        sub_807E6F0(&gSprites[spriteId], r7 * 9);
        gSprites[spriteId].invisible = TRUE;
        gUnknown_08396FC4->unknown_0[r7] = &gSprites[spriteId];
    }
    else
    {
        gUnknown_08396FC4->unknown_0[r7] = NULL;
    }

    if (++gUnknown_08396FC4->unknown_6DA == 24)
    {
        u16 i;

        for (i = 0; i < 24; i++)
        {
            if (gUnknown_08396FC4->unknown_0[i] != NULL)
            {
                if (gUnknown_08396FC4->unknown_0[i]->data[6] == 0)
                    gUnknown_08396FC4->unknown_0[i]->callback = sub_807E5C0;
                else
                    gUnknown_08396FC4->unknown_0[i]->callback = sub_807E6C4;
            }
        }
        return FALSE;
    }
    return TRUE;
}

bool8 sub_807E8E8(void)
{
    if (gUnknown_08396FC4->unknown_6D8 == gUnknown_08396FC4->unknown_6D9)
        return FALSE;

    if (++gUnknown_08396FC4->unknown_6D6 > gUnknown_08396FC4->unknown_6DB)
    {
        gUnknown_08396FC4->unknown_6D6 = 0;
        if (gUnknown_08396FC4->unknown_6D8 < gUnknown_08396FC4->unknown_6D9)
        {
            gUnknown_08396FC4->unknown_0[gUnknown_08396FC4->unknown_6D8++]->data[5] = 1;
        }
        else
        {
            gUnknown_08396FC4->unknown_6D8--;
            gUnknown_08396FC4->unknown_0[gUnknown_08396FC4->unknown_6D8]->data[5] = 0;
            gUnknown_08396FC4->unknown_0[gUnknown_08396FC4->unknown_6D8]->invisible = TRUE;
        }
    }
    return TRUE;
}

void sub_807E974(void)
{
    u16 i;

    for (i = 0; i < gUnknown_08396FC4->unknown_6DA; i++)
    {
        if (gUnknown_08396FC4->unknown_0[i] != NULL)
            DestroySprite(gUnknown_08396FC4->unknown_0[i]);
    }
    gUnknown_08396FC4->unknown_6DA = 0;
    FreeSpriteTilesByTag(0x1206);
}

void sub_807E9C8(void)
{
    gUnknown_08396FC4->unknown_6CC = 0;
    gUnknown_08396FC4->unknown_6D2 = 0;
    gUnknown_08396FC4->unknown_6C1 = 3;
    gUnknown_08396FC4->unknown_6C2 = 20;
    gUnknown_08396FC4->unknown_6E5 = 16;
    gUnknown_08396FC4->unknown_6E0 = 0;
}

void snowflakes_progress2(void);
void sub_807ED48(struct Sprite *);

void sub_807EA18(void)
{
    sub_807E9C8();
    while (gUnknown_08396FC4->unknown_6D2 == 0)
    {
        u16 i;

        snowflakes_progress2();
        for (i = 0; i < gUnknown_08396FC4->unknown_6E4; i++)
        {
            sub_807ED48(gUnknown_08396FC4->unknown_60[i]);
        }
    }
}

u8 snowflakes_progress(void);

void snowflakes_progress2(void)
{
    if (gUnknown_08396FC4->unknown_6CC == 0 && snowflakes_progress() == FALSE)
    {
        gUnknown_08396FC4->unknown_6D2 = 1;
        gUnknown_08396FC4->unknown_6CC++;
    }
}

bool8 sub_807EAC0(void)
{
    switch (gUnknown_08396FC4->unknown_6CE)
    {
    case 0:
        gUnknown_08396FC4->unknown_6E5 = 0;
        gUnknown_08396FC4->unknown_6E0 = 0;
        gUnknown_08396FC4->unknown_6CE++;
        // fall through
    case 1:
        if (snowflakes_progress() == FALSE)
        {
            gUnknown_08396FC4->unknown_6CE++;
            return FALSE;
        }
        return TRUE;
    }
    return FALSE;
}

bool8 snowflake_add(void);
bool8 snowflake_remove(void);

bool8 snowflakes_progress(void)
{
    if (gUnknown_08396FC4->unknown_6E4 == gUnknown_08396FC4->unknown_6E5)
        return FALSE;

    gUnknown_08396FC4->unknown_6E0++;
    if (gUnknown_08396FC4->unknown_6E0 > 36)
    {
        gUnknown_08396FC4->unknown_6E0 = 0;
        if (gUnknown_08396FC4->unknown_6E4 < gUnknown_08396FC4->unknown_6E5)
            snowflake_add();
        else
            snowflake_remove();
    }
    return (gUnknown_08396FC4->unknown_6E4 != gUnknown_08396FC4->unknown_6E5);
}

void sub_807EC40(struct Sprite *);

bool8 snowflake_add(void)
{
    u8 spriteId = CreateSpriteAtEnd(&gSpriteTemplate_839AB04, 0, 0, 78);

    if (spriteId == 64)
        return FALSE;
    gSprites[spriteId].data[4] = gUnknown_08396FC4->unknown_6E4;
    sub_807EC40(&gSprites[spriteId]);
    gSprites[spriteId].coordOffsetEnabled = TRUE;
    gUnknown_08396FC4->unknown_60[gUnknown_08396FC4->unknown_6E4++] = &gSprites[spriteId];
    return TRUE;
}

bool8 snowflake_remove(void)
{
    if (gUnknown_08396FC4->unknown_6E4 != 0)
    {
        DestroySprite(gUnknown_08396FC4->unknown_60[--gUnknown_08396FC4->unknown_6E4]);
        return TRUE;
    }
    return FALSE;
}

void sub_807EC40(struct Sprite *sprite)
{
    u16 r4 = ((sprite->data[4] * 5) & 7) * 30 + (Random() % 30);
    u16 r6;

    sprite->pos1.y = -3 - (gSpriteCoordOffsetY + sprite->centerToCornerVecY);
    sprite->pos1.x = r4 - (gSpriteCoordOffsetX + sprite->centerToCornerVecX);
    sprite->data[0] = sprite->pos1.y * 128;
    sprite->pos2.x = 0;
    r6 = Random();
    sprite->data[1] = (r6 & 3) * 5 + 64;
    sprite->data[7] = (r6 & 3) * 5 + 64;
    StartSpriteAnim(sprite, (r6 & 1) ? 0 : 1);
    sprite->data[3] = 0;
    sprite->data[2] = ((r6 & 3) == 0) ? 2 : 1;
    sprite->data[6] = (r6 & 0x1F) + 210;
    sprite->data[5] = 0;
}

void sub_807ECEC(struct Sprite *sprite)
{
    if (gUnknown_08396FC4->unknown_6E2 > 18)
    {
        sprite->invisible = FALSE;
        sprite->callback = sub_807ED48;
        sprite->pos1.y = 0xFA - (gSpriteCoordOffsetY + sprite->centerToCornerVecY);
        sprite->data[0] = sprite->pos1.y * 128;
        gUnknown_08396FC4->unknown_6E2 = 0;
    }
}

void sub_807ED48(struct Sprite *sprite)
{
    s16 r3;
    s16 r2;

    sprite->data[0] += sprite->data[1];
    sprite->pos1.y = sprite->data[0] >> 7;
    sprite->data[3] = (sprite->data[3] + sprite->data[2]) & 0xFF;
    sprite->pos2.x = gSineTable[sprite->data[3]] / 64;

    r3 = (sprite->pos1.x + sprite->centerToCornerVecX + gSpriteCoordOffsetX) & 0x1FF;
    if (r3 & 0x100)
        r3 = -0x100 | r3;  // hmm... what is this?
    if (r3 < -3)
        sprite->pos1.x = 242 - (gSpriteCoordOffsetX + sprite->centerToCornerVecX);
    else if (r3 > 242)
        sprite->pos1.x = -3 - (gSpriteCoordOffsetX + sprite->centerToCornerVecX);

    r2 = (sprite->pos1.y + sprite->centerToCornerVecY + gSpriteCoordOffsetY) & 0xFF;
    if (r2 > 163 && r2 < 171)
    {
        sprite->pos1.y = 250 - (gSpriteCoordOffsetY + sprite->centerToCornerVecY);
        sprite->data[0] = sprite->pos1.y * 128;
        sprite->data[5] = 0;
        sprite->data[6] = 220;
    }
    else if (r2 > 242 && r2 < 250)
    {
        sprite->pos1.y = 163;
        sprite->data[0] = sprite->pos1.y * 128;
        sprite->data[5] = 0;
        sprite->data[6] = 220;
        sprite->invisible = TRUE;
        sprite->callback = sub_807ECEC;
    }

    sprite->data[5]++;
    if (sprite->data[5] == sprite->data[6])
    {
        sub_807EC40(sprite);
        sprite->pos1.y = 250;
        sprite->invisible = TRUE;
        sprite->callback = sub_807ECEC;
    }
}

void sub_807EE80(void)
{
    gUnknown_08396FC4->unknown_6CC = 0;
    gUnknown_08396FC4->unknown_6D2 = 0;
    gUnknown_08396FC4->unknown_6D6 = 0;
    gUnknown_08396FC4->unknown_6DB = 4;
    gUnknown_08396FC4->unknown_6DC = 0;
    gUnknown_08396FC4->unknown_6D9 = 16;
    gUnknown_08396FC4->unknown_6C1 = 3;
    gUnknown_08396FC4->unknown_6C2 = 20;
    gUnknown_08396FC4->unknown_6D2 = 0;  // duplicate assignment
    gUnknown_08396FC4->unknown_6ED = 0;
    sub_807DD5C(0x51);
}

void sub_807EFC0(void);

void sub_807EEF4(void)
{
    sub_807EE80();
    while (gUnknown_08396FC4->unknown_6D2 == 0)
        sub_807EFC0();
}

void sub_807EF24(void)
{
    gUnknown_08396FC4->unknown_6CC = 0;
    gUnknown_08396FC4->unknown_6D2 = 0;
    gUnknown_08396FC4->unknown_6D6 = 0;
    gUnknown_08396FC4->unknown_6DB = 4;
    gUnknown_08396FC4->unknown_6DC = 1;
    gUnknown_08396FC4->unknown_6D9 = 24;
    gUnknown_08396FC4->unknown_6C1 = 3;
    gUnknown_08396FC4->unknown_6C2 = 20;
    gUnknown_08396FC4->unknown_6D2 = 0;  // duplicate assignment
    sub_807DD5C(0x53);
}

void sub_807EF90(void)
{
    sub_807EF24();
    while (gUnknown_08396FC4->unknown_6D2 == 0)
        sub_807EFC0();
}

void sub_807F434(void);
void sub_807F3F8(u16);

void sub_807EFC0(void)
{
    sub_807F434();
    switch (gUnknown_08396FC4->unknown_6CC)
    {
    case 0:
        sub_807E7A4();
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 1:
        if (sub_807E7B4())
            break;
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 2:
        if (sub_807E8E8())
            break;
        gUnknown_08396FC4->unknown_6D2 = 1;
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 3:
        if (gUnknown_08396FC4->unknown_6C6 == 0)
            break;
        gUnknown_08396FC4->unknown_6CC = 6;
        break;
    case 4:
        gUnknown_08396FC4->unknown_6EA = 1;
        gUnknown_08396FC4->unknown_6E6 = (Random() % 360) + 360;
        gUnknown_08396FC4->unknown_6CC++;
        // fall through
    case 5:
        if (--gUnknown_08396FC4->unknown_6E6 != 0)
            break;
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 6:
        gUnknown_08396FC4->unknown_6EA = 1;
        gUnknown_08396FC4->unknown_6EB = Random() % 2;
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 7:
        gUnknown_08396FC4->unknown_6EC = (Random() & 1) + 1;
        gUnknown_08396FC4->unknown_6CC++;
        // fall through
    case 8:
        sub_807D5BC(19);
        if (gUnknown_08396FC4->unknown_6EB == 0 && gUnknown_08396FC4->unknown_6EC == 1)
            sub_807F3F8(20);
        gUnknown_08396FC4->unknown_6E6 = (Random() % 3) + 6;
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 9:
        if (--gUnknown_08396FC4->unknown_6E6 != 0)
            break;
        sub_807D5BC(3);
        gUnknown_08396FC4->unknown_6EA = 1;
        if (--gUnknown_08396FC4->unknown_6EC != 0)
        {
            gUnknown_08396FC4->unknown_6E6 = (Random() % 16) + 60;
            gUnknown_08396FC4->unknown_6CC = 10;
        }
        else if (gUnknown_08396FC4->unknown_6EB == 0)
        {
            gUnknown_08396FC4->unknown_6CC = 4;
        }
        else
        {
            gUnknown_08396FC4->unknown_6CC = 11;
        }
        break;
    case 10:
        if (--gUnknown_08396FC4->unknown_6E6 != 0)
            break;
        gUnknown_08396FC4->unknown_6CC = 8;
        break;
    case 11:
        gUnknown_08396FC4->unknown_6E6 = (Random() % 16) + 60;
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 12:
        if (--gUnknown_08396FC4->unknown_6E6 != 0)
            break;
        sub_807F3F8(100);
        sub_807D5BC(19);
        // Why use "% 16" everywhere else and "& 0xF" here. So dumb.
        gUnknown_08396FC4->unknown_6E6 = (Random() & 0xF) + 30;
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 13:
        if (--gUnknown_08396FC4->unknown_6E6 != 0)
            break;
        sub_807D5F0(19, 3, 5);
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 14:
        if (gUnknown_08396FC4->unknown_6C6 != 3)
            break;
        gUnknown_08396FC4->unknown_6EA = 1;
        gUnknown_08396FC4->unknown_6CC = 4;
        break;
    }
}

bool8 sub_807F34C(void)
{
    switch (gUnknown_08396FC4->unknown_6CE)
    {
    case 0:
        gUnknown_08396FC4->unknown_6EA = 0;
        gUnknown_08396FC4->unknown_6CE++;
        // fall through
    case 1:
        sub_807EFC0();
        if (gUnknown_08396FC4->unknown_6EA != 0)
        {
            if (gUnknown_08396FC4->unknown_6D1 == 3
             || gUnknown_08396FC4->unknown_6D1 == 5
             || gUnknown_08396FC4->unknown_6D1 == 13)
                return FALSE;
            gUnknown_08396FC4->unknown_6D9 = 0;
            gUnknown_08396FC4->unknown_6CE++;
        }
        break;
    case 2:
        if (sub_807E8E8())
            break;
        sub_807E974();
        gUnknown_08396FC4->unknown_6ED = 0;
        gUnknown_08396FC4->unknown_6CE++;
        return FALSE;
    default:
        return FALSE;
    }
    return TRUE;
}

void sub_807F3F8(u16 a)
{
    if (gUnknown_08396FC4->unknown_6ED == 0)
    {
        gUnknown_08396FC4->unknown_6E8 = Random() % a;
        gUnknown_08396FC4->unknown_6ED = 1;
    }
}

void sub_807F434(void)
{
    if (gUnknown_08396FC4->unknown_6ED == 1)
    {
        if (gUnknown_08396FC4->unknown_6E8 == 0)
        {
            if (IsSEPlaying())
                return;
            if (Random() & 1)
                PlaySE(0x57);
            else
                PlaySE(0x58);
            gUnknown_08396FC4->unknown_6ED = 0;
        }
        else
        {
            gUnknown_08396FC4->unknown_6E8--;
        }
    }
}

void sub_807F49C(void)
{
    gUnknown_08396FC4->unknown_6CC = 0;
    gUnknown_08396FC4->unknown_6D2 = 0;
    gUnknown_08396FC4->unknown_6C1 = 0;
    gUnknown_08396FC4->unknown_6C2 = 20;
    if (gUnknown_08396FC4->unknown_6FB == 0)
    {
        gUnknown_08396FC4->unknown_6F0 = 0;
        gUnknown_08396FC4->unknown_6F2 = 0;
        gUnknown_08396FC4->unknown_6EE = 0;
        sub_807DB64(0, 16);
    }
}

void sub_807F52C(void);

void sub_807F4FC(void)
{
    sub_807F49C();
    while (gUnknown_08396FC4->unknown_6D2 == 0)
        sub_807F52C();
}

void sub_807F6E8(void);

void sub_807F52C(void)
{
    gUnknown_08396FC4->unknown_6EE = (gSpriteCoordOffsetX - gUnknown_08396FC4->unknown_6F2) & 0xFF;
    if (++gUnknown_08396FC4->unknown_6F0 > 3)
    {
        gUnknown_08396FC4->unknown_6F0 = 0;
        gUnknown_08396FC4->unknown_6F2++;
    }
    switch (gUnknown_08396FC4->unknown_6CC)
    {
    case 0:
        sub_807F6E8();
        if (gUnknown_08396FC4->unknown_6D0 == 6)
            sub_807DBA4(12, 8, 3);
        else
            sub_807DBA4(4, 16, 0);
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 1:
        if (sub_807DBE8())
        {
            gUnknown_08396FC4->unknown_6D2 = 1;
            gUnknown_08396FC4->unknown_6CC++;
        }
        break;
    }
}

void sub_807F7A4(void);

bool8 sub_807F5EC(void)
{
    gUnknown_08396FC4->unknown_6EE = (gSpriteCoordOffsetX - gUnknown_08396FC4->unknown_6F2) & 0xFF;
    if (++gUnknown_08396FC4->unknown_6F0 > 3)
    {
        gUnknown_08396FC4->unknown_6F0 = 0;
        gUnknown_08396FC4->unknown_6F2++;
    }
    switch (gUnknown_08396FC4->unknown_6CE)
    {
    case 0:
        sub_807DBA4(0, 16, 3);
        gUnknown_08396FC4->unknown_6CE++;
        break;
    case 1:
        if (!sub_807DBE8())
            break;
        gUnknown_08396FC4->unknown_6CE++;
        break;
    case 2:
        sub_807F7A4();
        gUnknown_08396FC4->unknown_6CE++;
        break;
    default:
        return FALSE;
    }
    return TRUE;
}

void sub_807F688(struct Sprite *sprite)
{
    sprite->pos2.y = (u8)gSpriteCoordOffsetY;
    sprite->pos1.x = gUnknown_08396FC4->unknown_6EE + 32 + sprite->data[0] * 64;
    if (sprite->pos1.x > 0x10F)
    {
        sprite->pos1.x = 480 + gUnknown_08396FC4->unknown_6EE - (4 - sprite->data[0]) * 64;
        sprite->pos1.x &= 0x1FF;
    }
}
