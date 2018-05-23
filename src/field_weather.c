#include "global.h"
#include "constants/songs.h"
#include "constants/weather.h"
#include "blend_palette.h"
#include "event_object_movement.h"
#include "field_weather.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "random.h"
#include "script.h"
#include "start_menu.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "ewram.h"

#define MACRO1(color) ((((color) >> 1) & 0xF) | (((color) >> 2) & 0xF0) | (((color) >> 3) & 0xF00))

enum
{
    GAMMA_NONE,
    GAMMA_NORMAL,
    GAMMA_ALT,
};

struct RGBColor
{
    u16 r:5;
    u16 g:5;
    u16 b:5;
};

struct WeatherPaletteData
{
    u16 gammaShiftColors[8][0x1000]; // 0x1000 is the number of bytes that make up all palettes.
};

struct WeatherCallbacks
{
    void (*initVars)(void);
    void (*main)(void);
    void (*initAll)(void);
    bool8 (*finish)(void);
};

EWRAM_DATA struct Weather gWeather = {0};
EWRAM_DATA u8 gFieldEffectPaletteGammaTypes[32] = {0};
EWRAM_DATA u16 gUnknown_0202FF58 = 0;

static const u8 *sPaletteGammaTypes;

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
    (u8*)eDroughtPaletteData.gammaShiftColors,
};

// This is a pointer to gWeather. All code in this file accesses gWeather directly,
// while code in other field weather files accesses gWeather through this pointer.
// This is likely the result of compiler optimization, since using the pointer in
// this file produces the same result as accessing gWeather directly.
struct Weather *const gWeatherPtr = &gWeather;

static bool8 LightenSpritePaletteInFog(u8);
static void BuildGammaShiftTables(void);
static void UpdateWeatherGammaShift(void);
static void ApplyGammaShift(u8 startPalIndex, u8 numPalettes, s8 gammaIndex);
static void ApplyGammaShiftWithBlend(u8 startPalIndex, u8 numPalettes, s8 gammaIndex, u8 blendCoeff, u16 blendColor);
static void ApplyDroughtGammaShiftWithBlend(s8 gammaIndex, u8 blendCoeff, u16 blendColor);
static void ApplyFogBlend(u8 blendCoeff, u16 blendColor);
static bool8 FadeInScreen_RainShowShade(void);
static bool8 FadeInScreen_Drought(void);
static bool8 FadeInScreen_Fog1(void);
static void FadeInScreenWithWeather(void);
static void DoNothing(void);
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
    {LightRain_InitVars, LightRain_Main, LightRain_InitAll, LightRain_Finish},
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

void (*const gWeatherPalStateFuncs[])(void) =
{
    UpdateWeatherGammaShift, // WEATHER_PAL_STATE_CHANGING_WEATHER
    FadeInScreenWithWeather, // WEATHER_PAL_STATE_SCREEN_FADING_IN
    DoNothing,               // WEATHER_PAL_STATE_SCREEN_FADING_OUT
    DoNothing,               // WEATHER_PAL_STATE_IDLE
};

// This table specifies which of the gamma shift tables should be
// applied to each of the background and sprite palettes.
static const u8 sBasePaletteGammaTypes[32] =
{
    // background palettes
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NONE,
    GAMMA_NONE,
    // sprite palettes
    GAMMA_ALT,
    GAMMA_NORMAL,
    GAMMA_ALT,
    GAMMA_ALT,
    GAMMA_ALT,
    GAMMA_ALT,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_ALT,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
};

#if DEBUG

static const u8 sDebugText_Weather_None[]        = _("なし　　　");  // "none"
static const u8 sDebugText_Weather_Clear[]       = _("はれ　　　");  // "clear"
static const u8 sDebugText_Weather_Clear2[]      = _("はれ2　　");  // "clear2"
static const u8 sDebugText_Weather_Rain[]        = _("あめ　　　");  // "rain"
static const u8 sDebugText_Weather_Snow[]        = _("ゆき　　　");  // "snow"
static const u8 sDebugText_Weather_Lightning[]   = _("かみなり　");  // "lightning"
static const u8 sDebugText_Weather_Fog[]         = _("きり　　　");  // "fog"
static const u8 sDebugText_Weather_VolcanicAsh[] = _("かざんばい");  // "volcanic ash"
static const u8 sDebugText_Weather_Sandstorm[]   = _("すなあらし");  // "sandstorm
static const u8 sDebugText_Weather_Fog2[]        = _("きり2　　");  // "fog2"
static const u8 sDebugText_Weather_Underwater[]  = _("かいてい　");  // "undersea"
static const u8 sDebugText_Weather_Cloudy[]      = _("くもり　　");  // "cloudy"
static const u8 sDebugText_Weather_Clear3[]      = _("はれ3　　");  // "clear3"
static const u8 sDebugText_Weather_HeavyRain[]   = _("おおあめ");  // "heavy rain"
static const u8 sDebugText_Weather_Underwater2[] = _("かいてい2");  // "undersea2"

static const u8 *const sDebugText_Weather[] =
{
    [WEATHER_NONE]       = sDebugText_Weather_None,
    [WEATHER_CLOUDS]     = sDebugText_Weather_Clear,
    [WEATHER_SUNNY]      = sDebugText_Weather_Clear2,
    [WEATHER_RAIN_LIGHT] = sDebugText_Weather_Rain,
    [WEATHER_SNOW]       = sDebugText_Weather_Snow,
    [WEATHER_RAIN_MED]   = sDebugText_Weather_Lightning,
    [WEATHER_FOG_1]      = sDebugText_Weather_Fog,
    [WEATHER_ASH]        = sDebugText_Weather_VolcanicAsh,
    [WEATHER_SANDSTORM]  = sDebugText_Weather_Sandstorm,
    [WEATHER_FOG_2]      = sDebugText_Weather_Fog2,
    [WEATHER_FOG_3]      = sDebugText_Weather_Underwater,
    [WEATHER_SHADE]      = sDebugText_Weather_Cloudy,
    [WEATHER_DROUGHT]    = sDebugText_Weather_Clear3,
    [WEATHER_RAIN_HEAVY] = sDebugText_Weather_HeavyRain,
    [WEATHER_BUBBLES]    = sDebugText_Weather_Underwater2,
};

#endif

const u16 gUnknown_083970E8[] = INCBIN_U16("graphics/weather/0.gbapal");

void StartWeather(void)
{
    u8 index;

    if (!FuncIsActiveTask(Task_WeatherMain))
    {
        index = AllocSpritePalette(0x1200);
        CpuCopy32(gUnknown_083970E8, &gPlttBufferUnfaded[0x100 + index * 16], 32);
        BuildGammaShiftTables();
        gWeatherPtr->altGammaSpritePalIndex = index;
        gWeatherPtr->weatherPicSpritePalIndex = AllocSpritePalette(0x1201);
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
        gWeatherPtr->lightenedFogSpritePalsCount = 0;
        Weather_SetBlendCoeffs(16, 0);
        gWeatherPtr->currWeather = 0;
        gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_IDLE;
        gWeatherPtr->readyForInit = FALSE;
        gWeatherPtr->weatherChangeComplete = TRUE;
        gWeatherPtr->taskId = CreateTask(Task_WeatherInit, 80);
    }
}

void ChangeWeather(u8 weather)
{
    if (weather != WEATHER_RAIN_LIGHT && weather != WEATHER_RAIN_MED && weather != WEATHER_RAIN_HEAVY)
    {
        PlayRainSoundEffect();
    }

    if (gWeatherPtr->nextWeather != weather && gWeatherPtr->currWeather == weather)
    {
        sWeatherFuncs[weather].initVars();
    }

    gWeatherPtr->weatherChangeComplete = FALSE;
    gWeatherPtr->nextWeather = weather;
    gWeatherPtr->finishStep = 0;
}

void sub_807C988(u8 weather)
{
    PlayRainSoundEffect();
    gWeatherPtr->currWeather = weather;
    gWeatherPtr->nextWeather = weather;
}

void sub_807C9B4(u8 weather)
{
    PlayRainSoundEffect();
    gWeatherPtr->currWeather = weather;
    gWeatherPtr->nextWeather = weather;
    gWeatherPtr->readyForInit = TRUE;
}

void Task_WeatherInit(u8 taskId)
{
    // Waits until it's ok to initialize weather.
    // When the screen fades in, this is set to TRUE.
    if (gWeatherPtr->readyForInit)
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
            // Finished cleaning up previous weather. Now transition to next weather.
            sWeatherFuncs[gWeatherPtr->nextWeather].initVars();
            gWeatherPtr->gammaStepFrameCounter = 0;
            gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_CHANGING_WEATHER;
            gWeatherPtr->currWeather = gWeatherPtr->nextWeather;
            gWeatherPtr->weatherChangeComplete = TRUE;
        }
    }
    else
    {
        sWeatherFuncs[gWeatherPtr->currWeather].main();
    }

    gWeatherPalStateFuncs[gWeatherPtr->palProcessingState]();
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

// Builds two tables that contain gamma shifts for palette colors.
// It's unclear why the two tables aren't declared as const arrays, since
// this function always builds the same two tables.
static void BuildGammaShiftTables(void)
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

    sPaletteGammaTypes = sBasePaletteGammaTypes;
    for (v0 = 0; v0 <= 1; v0++)
    {
        if (v0 == 0)
            v1 = gWeatherPtr->gammaShifts;
        else
            v1 = gWeatherPtr->altGammaShifts;

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

// When the weather is changing, it gradually updates the palettes
// towards the desired gamma shift.
static void UpdateWeatherGammaShift(void)
{
    if (gWeatherPtr->gammaIndex == gWeatherPtr->gammaTargetIndex)
    {
        gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_IDLE;
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

            ApplyGammaShift(0, 32, gWeatherPtr->gammaIndex);
        }
    }
}

static void FadeInScreenWithWeather(void)
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
        if (FadeInScreen_RainShowShade() == FALSE)
        {
            gWeatherPtr->gammaIndex = 3;
            gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_IDLE;
        }
        break;
    case WEATHER_DROUGHT:
        if (FadeInScreen_Drought() == FALSE)
        {
            gWeatherPtr->gammaIndex = -6;
            gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_IDLE;
        }
        break;
    case WEATHER_FOG_1:
        if (FadeInScreen_Fog1() == FALSE)
        {
            gWeatherPtr->gammaIndex = 0;
            gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_IDLE;
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
            gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_IDLE;
        }
        break;
    }
}

bool8 FadeInScreen_RainShowShade(void)
{
    if (gWeatherPtr->fadeScreenCounter == 16)
        return FALSE;

    if (++gWeatherPtr->fadeScreenCounter >= 16)
    {
        ApplyGammaShift(0, 32, 3);
        gWeatherPtr->fadeScreenCounter = 16;
        return FALSE;
    }

    ApplyGammaShiftWithBlend(0, 32, 3, 16 - gWeatherPtr->fadeScreenCounter, gWeatherPtr->fadeDestColor);
    return TRUE;
}

bool8 FadeInScreen_Drought(void)
{
    if (gWeatherPtr->fadeScreenCounter == 16)
        return FALSE;

    if (++gWeatherPtr->fadeScreenCounter >= 16)
    {
        ApplyGammaShift(0, 32, -6);
        gWeatherPtr->fadeScreenCounter = 16;
        return FALSE;
    }

    ApplyDroughtGammaShiftWithBlend(-6, 16 - gWeatherPtr->fadeScreenCounter, gWeatherPtr->fadeDestColor);
    return TRUE;
}

bool8 FadeInScreen_Fog1(void)
{
    if (gWeatherPtr->fadeScreenCounter == 16)
        return FALSE;

    gWeatherPtr->fadeScreenCounter++;
    ApplyFogBlend(16 - gWeatherPtr->fadeScreenCounter, gWeatherPtr->fadeDestColor);
    return TRUE;
}

static void DoNothing(void)
{ }

static void ApplyGammaShift(u8 startPalIndex, u8 numPalettes, s8 gammaIndex)
{
    u16 curPalIndex;
    u16 palOffset;
    u8 *gammaTable;
    u16 i;

    if (gammaIndex > 0)
    {
        gammaIndex--;
        palOffset = startPalIndex * 16;
        numPalettes += startPalIndex;
        curPalIndex = startPalIndex;

        // Loop through the speficied palette range and apply necessary gamma shifts to the colors.
        while (curPalIndex < numPalettes)
        {
            if (sPaletteGammaTypes[curPalIndex] == GAMMA_NONE)
            {
                // No palette change.
                CpuFastCopy(gPlttBufferUnfaded + palOffset, gPlttBufferFaded + palOffset, 16 * sizeof(u16));
                palOffset += 16;
            }
            else
            {
                u8 r, g, b;

                if (sPaletteGammaTypes[curPalIndex] == GAMMA_ALT || curPalIndex - 16 == gWeatherPtr->altGammaSpritePalIndex)
                    gammaTable = gWeatherPtr->altGammaShifts[gammaIndex];
                else
                    gammaTable = gWeatherPtr->gammaShifts[gammaIndex];

                if (curPalIndex == 16 || curPalIndex > 27)
                {
                    for (i = 0; i < 16; i++)
                    {
                        if (gPlttBufferUnfaded[palOffset] == RGB(31, 12, 11))
                        {
                            // Skip gamma shift for this specific color. (Why?)
                            palOffset++;
                        }
                        else
                        {
                            // Apply gamma shift to the original color.
                            struct RGBColor baseColor = *(struct RGBColor *)&gPlttBufferUnfaded[palOffset];
                            r = gammaTable[baseColor.r];
                            g = gammaTable[baseColor.g];
                            b = gammaTable[baseColor.b];
                            gPlttBufferFaded[palOffset++] = (b << 10) | (g << 5) | r;
                        }
                    }
                }
                else
                {
                    for (i = 0; i < 16; i++)
                    {
                        // Apply gamma shift to the original color.
                        struct RGBColor baseColor = *(struct RGBColor *)&gPlttBufferUnfaded[palOffset];
                        r = gammaTable[baseColor.r];
                        g = gammaTable[baseColor.g];
                        b = gammaTable[baseColor.b];
                        gPlttBufferFaded[palOffset++] = (b << 10) | (g << 5) | r;
                    }
                }
            }

            curPalIndex++;
        }
    }
    else if (gammaIndex < 0)
    {
        // A negative gammIndex value means that the blending will come from the special Drought weather's palette tables.
        gammaIndex = -gammaIndex - 1;
        palOffset = startPalIndex * 16;
        numPalettes += startPalIndex;
        curPalIndex = startPalIndex;

        while (curPalIndex < numPalettes)
        {
            if (sPaletteGammaTypes[curPalIndex] == GAMMA_NONE)
            {
                // No palette change.
                CpuFastCopy(gPlttBufferUnfaded + palOffset, gPlttBufferFaded + palOffset, 16 * sizeof(u16));
                palOffset += 16;
            }
            else
            {
                if (curPalIndex == 16 || curPalIndex > 27)
                {
                    for (i = 0; i < 16; i++)
                    {
                        // Skip gamma shift for this specific color. (Why?)
                        if (gPlttBufferUnfaded[palOffset] != RGB(31, 12, 11))
                            gPlttBufferFaded[palOffset] = eDroughtPaletteData.gammaShiftColors[gammaIndex][MACRO1(gPlttBufferUnfaded[palOffset])];

                        palOffset++;
                    }
                }
                else
                {
                    for (i = 0; i < 16; i++)
                    {
                        gPlttBufferFaded[palOffset] = eDroughtPaletteData.gammaShiftColors[gammaIndex][MACRO1(gPlttBufferUnfaded[palOffset])];
                        palOffset++;
                    }
                }
            }

            curPalIndex++;
        }
    }
    else
    {
        // No palette blending.
        CpuFastCopy(gPlttBufferUnfaded + startPalIndex * 16, gPlttBufferFaded + startPalIndex * 16, numPalettes * 16 * sizeof(u16));
    }
}

static void ApplyGammaShiftWithBlend(u8 startPalIndex, u8 numPalettes, s8 gammaIndex, u8 blendCoeff, u16 blendColor)
{
    u16 palOffset;
    u16 curPalIndex;
    u16 i;
    struct RGBColor color = *(struct RGBColor *)&blendColor;
    u8 rBlend = color.r;
    u8 gBlend = color.g;
    u8 bBlend = color.b;

    palOffset = startPalIndex * 16;
    numPalettes += startPalIndex;
    gammaIndex--;
    curPalIndex = startPalIndex;

    while (curPalIndex < numPalettes)
    {
        if (sPaletteGammaTypes[curPalIndex] == GAMMA_NONE)
        {
            // No gamma shift. Simply blend the colors.
            BlendPalette(palOffset, 16, blendCoeff, blendColor);
            palOffset += 16;
        }
        else
        {
            u8 *gammaTable;

            if (sPaletteGammaTypes[curPalIndex] == GAMMA_NORMAL)
                gammaTable = gWeatherPtr->gammaShifts[gammaIndex];
            else
                gammaTable = gWeatherPtr->altGammaShifts[gammaIndex];

            for (i = 0; i < 16; i++)
            {
                struct RGBColor baseColor = *(struct RGBColor *)&gPlttBufferUnfaded[palOffset];
                u8 r = gammaTable[baseColor.r];
                u8 g = gammaTable[baseColor.g];
                u8 b = gammaTable[baseColor.b];

                // Apply gamma shift and target blend color to the original color.
                r += ((rBlend - r) * blendCoeff) >> 4;
                g += ((gBlend - g) * blendCoeff) >> 4;
                b += ((bBlend - b) * blendCoeff) >> 4;
                gPlttBufferFaded[palOffset++] = (b << 10) | (g << 5) | r;
            }
        }

        curPalIndex++;
    }
}

void ApplyDroughtGammaShiftWithBlend(s8 gammaIndex, u8 blendCoeff, u16 blendColor)
{
    struct RGBColor color;
    u8 rBlend;
    u8 gBlend;
    u8 bBlend;
    u16 curPalIndex;
    u16 palOffset;
    u16 i;

    gammaIndex = -gammaIndex - 1;
    color = *(struct RGBColor *)&blendColor;
    rBlend = color.r;
    gBlend = color.g;
    bBlend = color.b;
    palOffset = 0;
    for (curPalIndex = 0; curPalIndex < 32; curPalIndex++)
    {
        if (sPaletteGammaTypes[curPalIndex] == GAMMA_NONE)
        {
            // No gamma shift. Simply blend the colors.
            BlendPalette(palOffset, 16, blendCoeff, blendColor);
            palOffset += 16;
        }
        else
        {
            for (i = 0; i < 16; i++)
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
                color2 = *(struct RGBColor *)&eDroughtPaletteData.gammaShiftColors[gammaIndex][offset];
                r2 = color2.r;
                g2 = color2.g;
                b2 = color2.b;

                r2 += ((rBlend - r2) * blendCoeff) >> 4;
                g2 += ((gBlend - g2) * blendCoeff) >> 4;
                b2 += ((bBlend - b2) * blendCoeff) >> 4;

                gPlttBufferFaded[palOffset++] = (b2 << 10) | (g2 << 5) | r2;
            }
        }
    }
}

void ApplyFogBlend(u8 blendCoeff, u16 blendColor)
{
    struct RGBColor color;
    u8 rBlend;
    u8 gBlend;
    u8 bBlend;
    u16 curPalIndex;

    BlendPalette(0, 256, blendCoeff, blendColor);
    color = *(struct RGBColor *)&blendColor;
    rBlend = color.r;
    gBlend = color.g;
    bBlend = color.b;

    for (curPalIndex = 16; curPalIndex < 32; curPalIndex++)
    {
        if (LightenSpritePaletteInFog(curPalIndex))
        {
            u16 palEnd = (curPalIndex + 1) * 16;
            u16 palOffset = curPalIndex * 16;

            while (palOffset < palEnd)
            {
                struct RGBColor color = *(struct RGBColor *)&gPlttBufferUnfaded[palOffset];
                u8 r = color.r;
                u8 g = color.g;
                u8 b = color.b;

                r += ((28 - r) * 3) >> 2;
                g += ((31 - g) * 3) >> 2;
                b += ((28 - b) * 3) >> 2;

                r += ((rBlend - r) * blendCoeff) >> 4;
                g += ((gBlend - g) * blendCoeff) >> 4;
                b += ((bBlend - b) * blendCoeff) >> 4;

                gPlttBufferFaded[palOffset] = (b << 10) | (g << 5) | r;
                palOffset++;
            }
        }
        else
        {
            BlendPalette(curPalIndex * 16, 16, blendCoeff, blendColor);
        }
    }
}

static void MarkFogSpritePalToLighten(u8 paletteIndex)
{
    if (gWeatherPtr->lightenedFogSpritePalsCount < 6)
    {
        gWeatherPtr->lightenedFogSpritePals[gWeatherPtr->lightenedFogSpritePalsCount] = paletteIndex;
        gWeatherPtr->lightenedFogSpritePalsCount++;
    }
}

static bool8 LightenSpritePaletteInFog(u8 paletteIndex)
{
    u16 i;

    for (i = 0; i < gWeatherPtr->lightenedFogSpritePalsCount; i++)
    {
        if (gWeatherPtr->lightenedFogSpritePals[i] == paletteIndex)
            return TRUE;
    }

    return FALSE;
}

void sub_807D5BC(s8 gammaIndex)
{
    if (gWeatherPtr->palProcessingState == WEATHER_PAL_STATE_IDLE)
    {
        ApplyGammaShift(0, 32, gammaIndex);
        gWeatherPtr->gammaIndex = gammaIndex;
    }
}

void sub_807D5F0(u8 gammaIndex, u8 gammaTargetIndex, u8 gammaStepDelay)
{
    if (gWeatherPtr->palProcessingState == WEATHER_PAL_STATE_IDLE)
    {
        gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_CHANGING_WEATHER;
        gWeatherPtr->gammaIndex = gammaIndex;
        gWeatherPtr->gammaTargetIndex = gammaTargetIndex;
        gWeatherPtr->gammaStepFrameCounter = 0;
        gWeatherPtr->gammaStepDelay = gammaStepDelay;
        sub_807D5BC(gammaIndex);
    }
}

void FadeScreen(u8 mode, u8 delay)
{
    u32 fadeColor;
    bool8 fadeOut;
    bool8 useWeatherPal;

    switch (mode)
    {
    case FADE_FROM_BLACK:
        fadeColor = 0;
        fadeOut = FALSE;
        break;
    case FADE_FROM_WHITE:
        fadeColor = 0xFFFF;
        fadeOut = FALSE;
        break;
    case FADE_TO_BLACK:
        fadeColor = 0;
        fadeOut = TRUE;
        break;
    case FADE_TO_WHITE:
        fadeColor = 0xFFFF;
        fadeOut = TRUE;
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

    if (fadeOut)
    {
        if (useWeatherPal)
            CpuFastCopy(gPlttBufferFaded, gPlttBufferUnfaded, 0x400);

        BeginNormalPaletteFade(0xFFFFFFFF, delay, 0, 16, fadeColor);
        gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_SCREEN_FADING_OUT;
    }
    else
    {
        gWeatherPtr->fadeDestColor = fadeColor;
        if (useWeatherPal)
            gWeatherPtr->fadeScreenCounter = 0;
        else
            BeginNormalPaletteFade(0xFFFFFFFF, delay, 16, 0, fadeColor);

        gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_SCREEN_FADING_IN;
        gWeatherPtr->unknown_6CA = 1;
        gWeatherPtr->unknown_6CB = 0;
        Weather_SetBlendCoeffs(gWeatherPtr->currBlendEVA, gWeatherPtr->currBlendEVB);
        gWeatherPtr->readyForInit = TRUE;
    }
}

bool8 IsWeatherNotFadingIn(void)
{
    return (gWeatherPtr->palProcessingState != WEATHER_PAL_STATE_SCREEN_FADING_IN);
}

void UpdateSpritePaletteWithWeather(u8 spritePaletteIndex)
{
    u16 paletteIndex = 16 + spritePaletteIndex;
    u16 i;

    switch (gWeatherPtr->palProcessingState)
    {
    case WEATHER_PAL_STATE_SCREEN_FADING_IN:
        if (gWeatherPtr->unknown_6CA != 0)
        {
            if (gWeatherPtr->currWeather == WEATHER_FOG_1)
                MarkFogSpritePalToLighten(paletteIndex);
            paletteIndex *= 16;
            for (i = 0; i < 16; i++)
                gPlttBufferFaded[paletteIndex + i] = gWeatherPtr->fadeDestColor;
        }
        break;
    case WEATHER_PAL_STATE_SCREEN_FADING_OUT:
        paletteIndex *= 16;
        CpuFastCopy(gPlttBufferFaded + paletteIndex, gPlttBufferUnfaded + paletteIndex, 32);
        BlendPalette(paletteIndex, 16, gPaletteFade.y, gPaletteFade.blendColor);
        break;
    // WEATHER_PAL_STATE_CHANGING_WEATHER
    // WEATHER_PAL_STATE_CHANGING_IDLE
    default:
        if (gWeatherPtr->currWeather != WEATHER_FOG_1)
        {
            ApplyGammaShift(paletteIndex, 1, gWeatherPtr->gammaIndex);
        }
        else
        {
            paletteIndex *= 16;
            BlendPalette(paletteIndex, 16, 12, RGB(28, 31, 28));
        }
        break;
    }
}

void ApplyWeatherGammaShiftToPal(u8 paletteIndex)
{
    ApplyGammaShift(paletteIndex, 1, gWeatherPtr->gammaIndex);
}

u8 unref_sub_807D894(void)
{
    if (gWeatherPtr->palProcessingState == WEATHER_PAL_STATE_SCREEN_FADING_IN)
        return gWeatherPtr->unknown_6CA;
    else
        return 0;
}

void LoadCustomWeatherSpritePalette(const u16 *palette)
{
    LoadPalette(palette, 0x100 + gWeatherPtr->weatherPicSpritePalIndex * 16, 32);
    UpdateSpritePaletteWithWeather(gWeatherPtr->weatherPicSpritePalIndex);
}

static void LoadDroughtWeatherPalette(u8 *gammaIndexPtr, u8 *b)
{
    u8 gammaIndex = *gammaIndexPtr;
    u16 i;

    if (gammaIndex < 7)
    {
        gammaIndex--;
        LZ77UnCompWram(sCompressedDroughtPalettes[gammaIndex], eDroughtPaletteData.gammaShiftColors[gammaIndex]);
        if (gammaIndex == 0)
        {
            eDroughtPaletteData.gammaShiftColors[gammaIndex][0] = RGB(1, 1, 1);
            for (i = 1; i < 0x1000; i++)
                eDroughtPaletteData.gammaShiftColors[gammaIndex][i] += eDroughtPaletteData.gammaShiftColors[gammaIndex][i - 1];
        }
        else
        {
            for (i = 0; i < 0x1000; i++)
                eDroughtPaletteData.gammaShiftColors[gammaIndex][i] += eDroughtPaletteData.gammaShiftColors[gammaIndex - 1][i];
        }
        if (++(*gammaIndexPtr) == 7)
        {
            *gammaIndexPtr = 32;
            *b = 32;
        }
    }
}

void ResetDroughtWeatherPaletteLoading(void)
{
    gWeatherPtr->loadDroughtPalsIndex = 1;
    gWeatherPtr->loadDroughtPalsOffset = 1;
}

bool8 LoadDroughtWeatherPalettes(void)
{
    if (gWeatherPtr->loadDroughtPalsIndex < 32)
    {
        LoadDroughtWeatherPalette(&gWeatherPtr->loadDroughtPalsIndex, &gWeatherPtr->loadDroughtPalsOffset);
        if (gWeatherPtr->loadDroughtPalsIndex < 32)
            return TRUE;
    }
    return FALSE;
}

void sub_807DA04(s8 gammaIndex)
{
    sub_807D5BC(-gammaIndex - 1);
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
    gWeatherPtr->blendFrameCounter = 0;
    gWeatherPtr->blendUpdateCounter = 0;
}

bool8 Weather_UpdateBlend(void)
{
    if (gWeatherPtr->currBlendEVA == gWeatherPtr->targetBlendEVA
     && gWeatherPtr->currBlendEVB == gWeatherPtr->targetBlendEVB)
        return TRUE;

    if (++gWeatherPtr->blendFrameCounter > gWeatherPtr->blendDelay)
    {
        gWeatherPtr->blendFrameCounter = 0;
        gWeatherPtr->blendUpdateCounter++;

        // Update currBlendEVA and currBlendEVB on alternate frames
        if (gWeatherPtr->blendUpdateCounter & 1)
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
        SetWeather(WEATHER_CLOUDS);
        break;
    case 2:
        SetWeather(WEATHER_SUNNY);
        break;
    case 3:
        SetWeather(WEATHER_RAIN_LIGHT);
        break;
    case 4:
        SetWeather(WEATHER_SNOW);
        break;
    case 5:
        SetWeather(WEATHER_RAIN_MED);
        break;
    case 6:
        SetWeather(WEATHER_FOG_1);
        break;
    case 7:
        SetWeather(WEATHER_FOG_2);
        break;
    case 8:
        SetWeather(WEATHER_ASH);
        break;
    case 9:
        SetWeather(WEATHER_SANDSTORM);
        break;
    case 10:
        SetWeather(WEATHER_SHADE);
        break;
    }
}

u8 GetCurrentWeather(void)
{
    return gWeatherPtr->currWeather;
}

void SetRainStrengthFromSoundEffect(u16 soundEffect)
{
    if (gWeatherPtr->palProcessingState != WEATHER_PAL_STATE_SCREEN_FADING_OUT)
    {
        switch (soundEffect)
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

        PlaySE(soundEffect);
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

u8 IsWeatherChangeComplete(void)
{
    return gWeatherPtr->weatherChangeComplete;
}

void SetWeatherScreenFadeOut(void)
{
    gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_SCREEN_FADING_OUT;
}

void unref_sub_807DE24(void)
{
    gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_IDLE;
}

void PreservePaletteInWeather(u8 preservedPalIndex)
{
    CpuCopy16(sBasePaletteGammaTypes, gFieldEffectPaletteGammaTypes, 32);
    gFieldEffectPaletteGammaTypes[preservedPalIndex] = GAMMA_NONE;
    sPaletteGammaTypes = gFieldEffectPaletteGammaTypes;
}

void ResetPreservedPalettesInWeather(void)
{
    sPaletteGammaTypes = sBasePaletteGammaTypes;
}

#if DEBUG

EWRAM_DATA static u8 sSelectedDebugWeather = 0;

bool8 debug_sub_8085564(void)
{
    bool8 changed = FALSE;

    if (gMain.newKeys & R_BUTTON)
    {
        sSelectedDebugWeather++;
        if (sSelectedDebugWeather == 15)
            sSelectedDebugWeather = 0;
        changed = TRUE;
    }
    if (gMain.newKeys & L_BUTTON)
    {
        if (sSelectedDebugWeather != 0)
            sSelectedDebugWeather--;
        else
            sSelectedDebugWeather = 14;
        changed = TRUE;
    }

    if (changed)
    {
        Menu_BlankWindowRect(22, 1, 28, 2);
        Menu_PrintText(sDebugText_Weather[sSelectedDebugWeather], 23, 1);
    }
    
    if (gMain.newKeys & A_BUTTON)
    {
        ChangeWeather(sSelectedDebugWeather);
        CloseMenu();
        return TRUE;
    }
    
    return FALSE;
}

bool8 debug_sub_808560C(void)
{
    sSelectedDebugWeather = gWeather.currWeather;
    Menu_EraseScreen();
    Menu_BlankWindowRect(22, 1, 28, 2);
    Menu_PrintText(sDebugText_Weather[sSelectedDebugWeather], 23, 1);
    gMenuCallback = debug_sub_8085564;
    return FALSE;
}

#endif
