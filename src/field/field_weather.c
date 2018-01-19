#include "global.h"
#include "blend_palette.h"
#include "field_map_obj.h"
#include "field_weather.h"
#include "palette.h"
#include "random.h"
#include "script.h"
#include "constants/weather.h"
#include "constants/songs.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "ewram.h"

#define MACRO1(color) ((((color) >> 1) & 0xF) | (((color) >> 2) & 0xF0) | (((color) >> 3) & 0xF00))

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

struct WeatherCallbacks
{
    void (*initVars)(void);
    void (*main)(void);
    void (*initAll)(void);
    bool8 (*finish)(void);
};

EWRAM_DATA struct Weather gWeather = {0};
EWRAM_DATA u8 gUnknown_0202FF38[32] = {0};
EWRAM_DATA u16 gUnknown_0202FF58 = {0};

static const u8 *gUnknown_030006DC;

const u8 DroughtPaletteData_0[] = INCBIN_U8("graphics/weather/drought0.bin.lz");
const u8 DroughtPaletteData_1[] = INCBIN_U8("graphics/weather/drought1.bin.lz");
const u8 DroughtPaletteData_2[] = INCBIN_U8("graphics/weather/drought2.bin.lz");
const u8 DroughtPaletteData_3[] = INCBIN_U8("graphics/weather/drought3.bin.lz");
const u8 DroughtPaletteData_4[] = INCBIN_U8("graphics/weather/drought4.bin.lz");
const u8 DroughtPaletteData_5[] = INCBIN_U8("graphics/weather/drought5.bin.lz");

static const u8 *const sCompressedDroughtPalettes[] =
{
    DroughtPaletteData_0,
    DroughtPaletteData_1,
    DroughtPaletteData_2,
    DroughtPaletteData_3,
    DroughtPaletteData_4,
    DroughtPaletteData_5,
    gSharedMem,
};

// This is a pointer to gWeather. All code in this file accesses gWeather directly,
// while code in other field weather files accesses gWeather through this pointer.
// This is likely the result of compiler optimization, since using the pointer in
// this file produces the same result as accessing gWeather directly.
struct Weather *const gWeatherPtr = &gWeather;

void None_Init(void);
void None_Main(void);
bool8 None_Finish(void);
void Clouds_InitVars(void);
void Clouds_Main(void);
void Clouds_InitAll(void);
bool8 Clouds_Finish(void);
void Weather2_InitVars(void);
void Weather2_Main(void);
void Weather2_InitAll(void);
bool8 Weather2_Finish(void);
void LightRain_InitVars(void);
void LightRain_Main(void);
void LightRain_InitAll(void);
bool8 LightRain_Finish(void);
void Snow_InitVars(void);
void Snow_Main(void);
void Snow_InitAll(void);
bool8 Snow_Finish(void);
void MedRain_InitVars(void);
void Rain_Main(void);
void MedRain_InitAll(void);
bool8 Rain_Finish(void);
void Fog1_InitVars(void);
void Fog1_Main(void);
void Fog1_InitAll(void);
bool8 Fog1_Finish(void);
void Ash_InitVars(void);
void Ash_Main(void);
void Ash_InitAll(void);
bool8 Ash_Finish(void);
void Sandstorm_InitVars(void);
void Sandstorm_Main(void);
void Sandstorm_InitAll(void);
bool8 Sandstorm_Finish(void);
void Fog2_InitVars(void);
void Fog2_Main(void);
void Fog2_InitAll(void);
bool8 Fog2_Finish(void);
void Fog1_InitVars(void);
void Fog1_Main(void);
void Fog1_InitAll(void);
bool8 Fog1_Finish(void);
void Shade_InitVars(void);
void Shade_Main(void);
void Shade_InitAll(void);
bool8 Shade_Finish(void);
void Drought_InitVars(void);
void Drought_Main(void);
void Drought_InitAll(void);
bool8 Drought_Finish(void);
void HeavyRain_InitVars(void);
void Rain_Main(void);
void HeavyRain_InitAll(void);
bool8 Rain_Finish(void);
void Bubbles_InitVars(void);
void Bubbles_Main(void);
void Bubbles_InitAll(void);
bool8 Bubbles_Finish(void);

static const struct WeatherCallbacks sWeatherFuncs[] =
{
    {None_Init,          None_Main,      None_Init,         None_Finish},
    {Clouds_InitVars,    Clouds_Main,    Clouds_InitAll,    Clouds_Finish},
    {Weather2_InitVars,  Weather2_Main,  Weather2_InitAll,  Weather2_Finish},
    {LightRain_InitVars, LightRain_Main, LightRain_InitAll, LightRain_Finish},           // light rain
    {Snow_InitVars,      Snow_Main,      Snow_InitAll,      Snow_Finish},
    {MedRain_InitVars,   Rain_Main,      MedRain_InitAll,   Rain_Finish},
    {Fog1_InitVars,      Fog1_Main,      Fog1_InitAll,      Fog1_Finish},
    {Ash_InitVars,       Ash_Main,       Ash_InitAll,       Ash_Finish},
    {Sandstorm_InitVars, Sandstorm_Main, Sandstorm_InitAll, Sandstorm_Finish},
    {Fog2_InitVars,      Fog2_Main,      Fog2_InitAll,      Fog2_Finish},
    {Fog1_InitVars,      Fog1_Main,      Fog1_InitAll,      Fog1_Finish},
    {Shade_InitVars,     Shade_Main,     Shade_InitAll,     Shade_Finish},
    {Drought_InitVars,   Drought_Main,   Drought_InitAll,   Drought_Finish},
    {HeavyRain_InitVars, Rain_Main,      HeavyRain_InitAll, Rain_Finish},
    {Bubbles_InitVars,   Bubbles_Main,   Bubbles_InitAll,   Bubbles_Finish},
};

void (*const gUnknown_083970B8[])(void) =
{
    sub_807CC24,
    sub_807CCAC,
    nullsub_39,
    nullsub_39,
};

const u8 gUnknown_083970C8[32] =
{
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    0,
    0,
    2,
    1,
    2,
    2,
    2,
    2,
    1,
    1,
    1,
    1,
    2,
    1,
    1,
    1,
    1,
    1,
};

const u16 gUnknown_083970E8[] = INCBIN_U16("graphics/weather/0.gbapal");

void StartWeather(void)
{
    u8 index;

    if (!FuncIsActiveTask(Task_WeatherMain))
    {
        index = AllocSpritePalette(0x1200);
        CpuCopy32(gUnknown_083970E8, &gPlttBufferUnfaded[0x100 + index * 16], 32);
        sub_807CB10();
        gWeatherPtr->unknown_6D5 = index;
        gWeatherPtr->unknown_6D4 = AllocSpritePalette(0x1201);
        gWeatherPtr->rainSpriteCount = 0;
        gWeatherPtr->unknown_6D8 = 0;
        gWeatherPtr->cloudSpritesCreated = 0;
        gWeatherPtr->snowflakeSpriteCount = 0;
        gWeatherPtr->ashSpritesCreated = 0;
        gWeatherPtr->fog1SpritesCreated = 0;
        gWeatherPtr->fog2SpritesCreated = 0;
        gWeatherPtr->sandstormSprites1Created = 0;
        gWeatherPtr->sandstormSprites2Created = 0;
        gWeatherPtr->unknown_72E = 0;
        gWeatherPtr->unknown_6FA = 0;
        Weather_SetBlendCoeffs(16, 0);
        gWeatherPtr->currWeather = 0;
        gWeatherPtr->unknown_6C6 = 3;
        gWeatherPtr->unknown_6C8 = 0;
        gWeatherPtr->unknown_6D3 = 1;
        gWeatherPtr->unknown_6C9 = CreateTask(Task_WeatherInit, 80);
    }
}

void DoWeatherEffect(u8 effect)
{
    if (effect != WEATHER_RAIN_LIGHT && effect != WEATHER_RAIN_MED && effect != WEATHER_RAIN_HEAVY)
    {
        PlayRainSoundEffect();
    }
    if (gWeatherPtr->nextWeather != effect && gWeatherPtr->currWeather == effect)
    {
        sWeatherFuncs[effect].initVars();
    }
    gWeatherPtr->unknown_6D3 = 0;
    gWeatherPtr->nextWeather = effect;
    gWeatherPtr->finishStep = 0;
}

void sub_807C988(u8 effect)
{
    PlayRainSoundEffect();
    gWeatherPtr->currWeather = effect;
    gWeatherPtr->nextWeather = effect;
}

void sub_807C9B4(u8 effect)
{
    PlayRainSoundEffect();
    gWeatherPtr->currWeather = effect;
    gWeatherPtr->nextWeather = effect;
    gWeatherPtr->unknown_6C8 = 1;
}

void Task_WeatherInit(u8 taskId)
{
    if (gWeatherPtr->unknown_6C8)
    {
        sWeatherFuncs[gWeatherPtr->currWeather].initAll();
        gTasks[taskId].func = Task_WeatherMain;
    }
}

void Task_WeatherMain(u8 taskId)
{
    if (gWeatherPtr->currWeather != gWeatherPtr->nextWeather)
    {
        if (!sWeatherFuncs[gWeatherPtr->currWeather].finish())
        {
            sWeatherFuncs[gWeatherPtr->nextWeather].initVars();
            gWeatherPtr->gammaStepFrameCounter = 0;
            gWeatherPtr->unknown_6C6 = 0;
            gWeatherPtr->currWeather = gWeatherPtr->nextWeather;
            gWeatherPtr->unknown_6D3 = 1;
        }
    }
    else
    {
        sWeatherFuncs[gWeatherPtr->currWeather].main();
    }
    gUnknown_083970B8[gWeatherPtr->unknown_6C6]();
}

void None_Init(void)
{
    gWeatherPtr->gammaTargetIndex = 0;
    gWeatherPtr->gammaStepDelay = 0;
}

void None_Main(void)
{
}

u8 None_Finish(void)
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
            v1 = gWeatherPtr->unknown_200;
        else
            v1 = gWeatherPtr->unk460;

        for (v2 = 0; v2 < 32; v2++)
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
            if (v2 < 12)
            {
                for (; v6 < 19; v6++)
                {
                    v4 += v11;
                    dunno = v4 - v9;
                    if (dunno > 0)
                        v4 -= (dunno + ((u16)dunno >> 15)) >> 1;
                    v1[v6][v2] = v4 >> 8;
                    if (v1[v6][v2] > 0x1f)
                        v1[v6][v2] = 0x1f;
                }
            }
            else
            {
                for (; v6 < 19; v6++)
                {
                    v4 += v11;
                    v1[v6][v2] = v4 >> 8;
                    if (v1[v6][v2] > 0x1f)
                        v1[v6][v2] = 0x1f;
                }
            }
        }
    }
}

void sub_807CC24(void)
{
    if (gWeatherPtr->gammaIndex == gWeatherPtr->gammaTargetIndex)
    {
        gWeatherPtr->unknown_6C6 = 3;
    }
    else
    {
        if (++gWeatherPtr->gammaStepFrameCounter >= gWeatherPtr->gammaStepDelay)
        {
            gWeatherPtr->gammaStepFrameCounter = 0;
            if (gWeatherPtr->gammaIndex < gWeatherPtr->gammaTargetIndex)
                gWeatherPtr->gammaIndex++;
            else
                gWeatherPtr->gammaIndex--;
            BlendSomething_807CEBC(0, 0x20, gWeatherPtr->gammaIndex);
        }
    }
}

void sub_807CCAC(void)
{
    if (++gWeatherPtr->unknown_6CB > 1)
        gWeatherPtr->unknown_6CA = 0;
    switch (gWeatherPtr->currWeather)
    {
    case WEATHER_RAIN_LIGHT:
    case WEATHER_RAIN_MED:
    case WEATHER_RAIN_HEAVY:
    case WEATHER_SNOW:
    case WEATHER_SHADE:
        if (RainSnowShadeBlend_807CDC4() == 0)
        {
            gWeatherPtr->gammaIndex = 3;
            gWeatherPtr->unknown_6C6 = 3;
        }
        break;
    case WEATHER_DROUGHT:
        if (DroughtBlend_807CE24() == 0)
        {
            gWeatherPtr->gammaIndex = -6;
            gWeatherPtr->unknown_6C6 = 3;
        }
        break;
    case WEATHER_FOG_1:
        if (Fog1Blend_807CE7C() == 0)
        {
            gWeatherPtr->gammaIndex = 0;
            gWeatherPtr->unknown_6C6 = 3;
        }
        break;
    case WEATHER_ASH:
    case WEATHER_SANDSTORM:
    case WEATHER_FOG_2:
    case WEATHER_FOG_3:
    default:
        if (!gPaletteFade.active)
        {
            gWeatherPtr->gammaIndex = gWeatherPtr->gammaTargetIndex;
            gWeatherPtr->unknown_6C6 = 3;
        }
        break;
    }
}

u8 RainSnowShadeBlend_807CDC4(void)
{
    if (gWeatherPtr->unknown_6C7 == 0x10)
        return 0;
    if (++gWeatherPtr->unknown_6C7 >= 0x10)
    {
        BlendSomething_807CEBC(0, 0x20, 3);
        gWeatherPtr->unknown_6C7 = 0x10;
        return 0;
    }
    BlendSomething_807D1BC(0, 0x20, 3, 0x10 - gWeatherPtr->unknown_6C7, gWeatherPtr->fadeDestColor);
    return 1;
}

u8 DroughtBlend_807CE24(void)
{
    if (gWeatherPtr->unknown_6C7 == 0x10)
        return 0;
    if (++gWeatherPtr->unknown_6C7 >= 0x10)
    {
        BlendSomething_807CEBC(0, 0x20, -6);
        gWeatherPtr->unknown_6C7 = 0x10;
        return 0;
    }
    BlendSomething_807D304(-6, 0x10 - gWeatherPtr->unknown_6C7, gWeatherPtr->fadeDestColor);
    return 1;
}

u8 Fog1Blend_807CE7C(void)
{
    if (gWeatherPtr->unknown_6C7 == 0x10)
        return 0;
    ++gWeatherPtr->unknown_6C7;
    BlendSomething_807D424(0x10 - gWeatherPtr->unknown_6C7, gWeatherPtr->fadeDestColor);
    return 1;
}

void nullsub_39(void)
{
}

void BlendSomething_807CEBC(u8 a, u8 b, s8 c)
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

                if (gUnknown_030006DC[r4] == 2 || r4 - 16 == gWeatherPtr->unknown_6D5)
                    r6 = gWeatherPtr->unk460[c];
                else
                    r6 = gWeatherPtr->unknown_200[c];
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

void BlendSomething_807D1BC(u8 a1, u8 a2, s8 c, u8 d, u16 e)
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
                r5 = gWeatherPtr->unknown_200[c];
            else
                r5 = gWeatherPtr->unk460[c];

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

void BlendSomething_807D304(s8 a, u8 coeff, u16 c)
{
    struct RGBColor color;
    u8 r_;
    u8 g_;
    u8 b_;
    u16 r4;
    u16 palOffset;
    u16 r12;

    a = -a - 1;
    color = *(struct RGBColor *)&c;
    r_ = color.r;
    g_ = color.g;
    b_ = color.b;
    palOffset = 0;
    for (r4 = 0; r4 < 32; r4++)
    {
        if (gUnknown_030006DC[r4] == 0)
        {
            BlendPalette(palOffset, 16, coeff, c);
            palOffset += 16;
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

                color1 = *(struct RGBColor *)&gPlttBufferUnfaded[palOffset];
                r1 = color1.r;
                g1 = color1.g;
                b1 = color1.b;

                offset = ((b1 & 0x1E) << 7) | ((g1 & 0x1E) << 3) | ((r1 & 0x1E) >> 1);
                color2 = *(struct RGBColor *)&eWeatherPaletteData.data[a][offset];
                r2 = color2.r;
                g2 = color2.g;
                b2 = color2.b;

                r2 += ((r_ - r2) * coeff) >> 4;
                g2 += ((g_ - g2) * coeff) >> 4;
                b2 += ((b_ - b2) * coeff) >> 4;

                gPlttBufferFaded[palOffset++] = (b2 << 10) | (g2 << 5) | r2;
            }
        }
    }
}

bool8 sub_807D574(u8);

void BlendSomething_807D424(u8 coeff, u16 blendColor)
{
    struct RGBColor color;
    u8 blendR;
    u8 blendG;
    u8 blendB;
    u16 palNum;

    BlendPalette(0, 0x100, coeff, blendColor);
    color = *(struct RGBColor *)&blendColor;
    blendR = color.r;
    blendG = color.g;
    blendB = color.b;

    for (palNum = 16; palNum < 32; palNum++)
    {
        if (sub_807D574(palNum))
        {
            u16 palEnd = (palNum + 1) * 16;
            u16 palOffset = palNum * 16;

            while (palOffset < palEnd)
            {
                struct RGBColor color = *(struct RGBColor *)&gPlttBufferUnfaded[palOffset];
                u8 r = color.r;
                u8 g = color.g;
                u8 b = color.b;

                r += ((28 - r) * 3) >> 2;
                g += ((31 - g) * 3) >> 2;
                b += ((28 - b) * 3) >> 2;

                r += ((blendR - r) * coeff) >> 4;
                g += ((blendG - g) * coeff) >> 4;
                b += ((blendB - b) * coeff) >> 4;

                gPlttBufferFaded[palOffset] = (b << 10) | (g << 5) | r;
                palOffset++;
            }
        }
        else
        {
            BlendPalette(palNum * 16, 16, coeff, blendColor);
        }
    }
}

void sub_807D540(u8 a)
{
    if (gWeatherPtr->unknown_6FA < 6)
    {
        gWeatherPtr->unknown_6F4[gWeatherPtr->unknown_6FA] = a;
        gWeatherPtr->unknown_6FA++;
    }
}

bool8 sub_807D574(u8 a)
{
    u16 i;

    for (i = 0; i < gWeatherPtr->unknown_6FA; i++)
    {
        if (gWeatherPtr->unknown_6F4[i] == a)
            return TRUE;
    }
    return FALSE;
}

void sub_807D5BC(s8 a)
{
    if (gWeatherPtr->unknown_6C6 == 3)
    {
        BlendSomething_807CEBC(0, 32, a);
        gWeatherPtr->gammaIndex = a;
    }
}

void sub_807D5F0(u8 a, u8 b, u8 c)
{
    if (gWeatherPtr->unknown_6C6 == 3)
    {
        gWeatherPtr->unknown_6C6 = 0;
        gWeatherPtr->gammaIndex = a;
        gWeatherPtr->gammaTargetIndex = b;
        gWeatherPtr->gammaStepFrameCounter = 0;
        gWeatherPtr->gammaStepDelay = c;
        sub_807D5BC(a);
    }
}

void fade_screen(u8 mode, u8 delay)
{
    u32 fadeColor;
    bool8 fadeTo;
    bool8 useWeatherPal;

    switch (mode)
    {
    case FADE_FROM_BLACK:
        fadeColor = 0;
        fadeTo = FALSE;
        break;
    case FADE_FROM_WHITE:
        fadeColor = 0xFFFF;
        fadeTo = FALSE;
        break;
    case FADE_TO_BLACK:
        fadeColor = 0;
        fadeTo = TRUE;
        break;
    case FADE_TO_WHITE:
        fadeColor = 0xFFFF;
        fadeTo = TRUE;
        break;
    default:
        return;
    }

    switch (gWeatherPtr->currWeather)
    {
    case WEATHER_RAIN_LIGHT:
    case WEATHER_RAIN_MED:
    case WEATHER_RAIN_HEAVY:
    case WEATHER_SNOW:
    case WEATHER_FOG_1:
    case WEATHER_SHADE:
    case WEATHER_DROUGHT:
        useWeatherPal = TRUE;
        break;
    default:
        useWeatherPal = FALSE;
        break;
    }

    if (fadeTo)
    {
        if (useWeatherPal)
            CpuFastCopy(gPlttBufferFaded, gPlttBufferUnfaded, 0x400);
        BeginNormalPaletteFade(0xFFFFFFFF, delay, 0, 16, fadeColor);
        gWeatherPtr->unknown_6C6 = 2;
    }
    else
    {
        gWeatherPtr->fadeDestColor = fadeColor;
        if (useWeatherPal)
            gWeatherPtr->unknown_6C7 = 0;
        else
            BeginNormalPaletteFade(0xFFFFFFFF, delay, 16, 0, fadeColor);
        gWeatherPtr->unknown_6C6 = 1;
        gWeatherPtr->unknown_6CA = 1;
        gWeatherPtr->unknown_6CB = 0;
        Weather_SetBlendCoeffs(gWeatherPtr->currBlendEVA, gWeatherPtr->currBlendEVB);
        gWeatherPtr->unknown_6C8 = 1;
    }
}

bool8 sub_807D770(void)
{
    return (gWeatherPtr->unknown_6C6 != 1);
}

void sub_807D78C(u8 a)
{
    u16 r4 = 16 + a;
    u16 i;

    switch (gWeatherPtr->unknown_6C6)
    {
    case 1:
        if (gWeatherPtr->unknown_6CA != 0)
        {
            if (gWeatherPtr->currWeather == WEATHER_FOG_1)
                sub_807D540(r4);
            r4 *= 16;
            for (i = 0; i < 16; i++)
                gPlttBufferFaded[r4 + i] = gWeatherPtr->fadeDestColor;
        }
        break;
    case 2:
        r4 *= 16;
        CpuFastCopy(gPlttBufferFaded + r4, gPlttBufferUnfaded + r4, 32);
        BlendPalette(r4, 16, gPaletteFade.y, gPaletteFade.blendColor);
        break;
    default:
        if (gWeatherPtr->currWeather != WEATHER_FOG_1)
        {
            BlendSomething_807CEBC(r4, 1, gWeatherPtr->gammaIndex);
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
    BlendSomething_807CEBC(a, 1, gWeatherPtr->gammaIndex);
}

u8 unref_sub_807D894(void)
{
    if (gWeatherPtr->unknown_6C6 == 1)
        return gWeatherPtr->unknown_6CA;
    else
        return 0;
}

void sub_807D8C0(const u16 *palette)
{
    LoadPalette(palette, 0x100 + gWeatherPtr->unknown_6D4 * 16, 32);
    sub_807D78C(gWeatherPtr->unknown_6D4);
}

void sub_807D8F0(u8 *a, u8 *b)
{
    u8 r4 = *a;
    u16 i;

    if (r4 < 7)
    {
        r4--;
        LZ77UnCompWram(sCompressedDroughtPalettes[r4], eWeatherPaletteData.data[r4]);
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
        if (++(*a) == 7)
        {
            *a = 32;
            *b = 32;
        }
    }
}

void sub_807D9A8(void)
{
    gWeatherPtr->unknown_74D = 1;
    gWeatherPtr->unknown_74E = 1;
}

bool8 sub_807D9C8(void)
{
    if (gWeatherPtr->unknown_74D < 32)
    {
        sub_807D8F0(&gWeatherPtr->unknown_74D, &gWeatherPtr->unknown_74E);
        if (gWeatherPtr->unknown_74D < 32)
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
    gWeatherPtr->unknown_73C = 0;
    gWeatherPtr->unknown_740 = 0;
    gWeatherPtr->unknown_742 = 0;
    gWeatherPtr->unknown_73E = 0;
    gUnknown_0202FF58 = 5;
}

void sub_807DA4C(void)
{
    switch (gWeatherPtr->unknown_742)
    {
    case 0:
        if (++gWeatherPtr->unknown_740 > gUnknown_0202FF58)
        {
            gWeatherPtr->unknown_740 = 0;
            sub_807DA04(gWeatherPtr->unknown_73C++);
            if (gWeatherPtr->unknown_73C > 5)
            {
                gWeatherPtr->unknown_73E = gWeatherPtr->unknown_73C;
                gWeatherPtr->unknown_742 = 1;
                gWeatherPtr->unknown_740 = 0x3C;
            }
        }
        break;
    case 1:
        gWeatherPtr->unknown_740 = (gWeatherPtr->unknown_740 + 3) & 0x7F;
        gWeatherPtr->unknown_73C = ((gSineTable[gWeatherPtr->unknown_740] - 1) >> 6) + 2;
        if (gWeatherPtr->unknown_73C != gWeatherPtr->unknown_73E)
            sub_807DA04(gWeatherPtr->unknown_73C);
        gWeatherPtr->unknown_73E = gWeatherPtr->unknown_73C;
        break;
    case 2:
        if (++gWeatherPtr->unknown_740 > gUnknown_0202FF58)
        {
            gWeatherPtr->unknown_740 = 0;
            sub_807DA04(--gWeatherPtr->unknown_73C);
            if (gWeatherPtr->unknown_73C == 3)
                gWeatherPtr->unknown_742 = 0;
        }
        break;
    }
}

void Weather_SetBlendCoeffs(u8 eva, u8 evb)
{
    gWeatherPtr->currBlendEVA = eva;
    gWeatherPtr->currBlendEVB = evb;
    gWeatherPtr->targetBlendEVA = eva;
    gWeatherPtr->targetBlendEVB = evb;
    REG_BLDALPHA = BLDALPHA_BLEND(eva, evb);
}

void Weather_SetTargetBlendCoeffs(u8 eva, u8 evb, int delay)
{
    gWeatherPtr->targetBlendEVA = eva;
    gWeatherPtr->targetBlendEVB = evb;
    gWeatherPtr->blendDelay = delay;
    gWeatherPtr->unknown_739 = 0;
    gWeatherPtr->unknown_738 = 0;
}

bool8 Weather_UpdateBlend(void)
{
    if (gWeatherPtr->currBlendEVA == gWeatherPtr->targetBlendEVA
     && gWeatherPtr->currBlendEVB == gWeatherPtr->targetBlendEVB)
        return TRUE;

    if (++gWeatherPtr->unknown_739 > gWeatherPtr->blendDelay)
    {
        gWeatherPtr->unknown_739 = 0;
        gWeatherPtr->unknown_738++;

        // Update currBlendEVA and currBlendEVB on alternate frames
        if (gWeatherPtr->unknown_738 & 1)
        {
            if (gWeatherPtr->currBlendEVA < gWeatherPtr->targetBlendEVA)
                gWeatherPtr->currBlendEVA++;
            else if (gWeatherPtr->currBlendEVA > gWeatherPtr->targetBlendEVA)
                gWeatherPtr->currBlendEVA--;
        }
        else
        {
            if (gWeatherPtr->currBlendEVB < gWeatherPtr->targetBlendEVB)
                gWeatherPtr->currBlendEVB++;
            else if (gWeatherPtr->currBlendEVB > gWeatherPtr->targetBlendEVB)
                gWeatherPtr->currBlendEVB--;
        }
    }

    REG_BLDALPHA = BLDALPHA_BLEND(gWeatherPtr->currBlendEVA, gWeatherPtr->currBlendEVB);

    if (gWeatherPtr->currBlendEVA == gWeatherPtr->targetBlendEVA
     && gWeatherPtr->currBlendEVB == gWeatherPtr->targetBlendEVB)
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
    return gWeatherPtr->currWeather;
}

void SetRainStrengthFromSoundEffect(u16 sndEff)
{
    if (gWeatherPtr->unknown_6C6 != 2)
    {
        switch (sndEff)
        {
        case SE_T_KOAME:
            gWeatherPtr->rainStrength = 0;
            break;
        case SE_T_OOAME:
            gWeatherPtr->rainStrength = 1;
            break;
        case SE_T_AME:
            gWeatherPtr->rainStrength = 2;
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
        switch (gWeatherPtr->rainStrength)
        {
        case 0:
            PlaySE(SE_T_KOAME_E);
            break;
        case 1:
            PlaySE(SE_T_OOAME_E);
            break;
        case 2:
        default:
            PlaySE(SE_T_AME_E);
            break;
        }
    }
}

u8 sub_807DDFC(void)
{
    return gWeatherPtr->unknown_6D3;
}

void sub_807DE10(void)
{
    gWeatherPtr->unknown_6C6 = 2;
}

void unref_sub_807DE24(void)
{
    gWeatherPtr->unknown_6C6 = 3;
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
