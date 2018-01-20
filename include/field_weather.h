#ifndef GUARD_WEATHER_H
#define GUARD_WEATHER_H

struct Sprite;

struct Weather
{
    union
    {
        struct
        {
            struct Sprite *rainSprites[24];
            struct Sprite *snowflakeSprites[101];
            struct Sprite *cloudSprites[3];
        } s1;
        struct
        {
            u8 filler0[0xA0];
            struct Sprite *fog1Sprites[20];
            struct Sprite *ashSprites[20];
            struct Sprite *fog2Sprites[20];
            struct Sprite *sandstormSprites1[20];
            struct Sprite *sandstormSprites2[5];
        } s2;
    } sprites;
    u8 gammaShifts[19][32];
    u8 altGammaShifts[19][32];
    s8 gammaIndex;
    s8 gammaTargetIndex;
    u8 gammaStepDelay;
    u8 gammaStepFrameCounter;
    u16 fadeDestColor;
    u8 unknown_6C6;
    u8 unknown_6C7;
    u8 unknown_6C8;
    u8 unknown_6C9;
    u8 unknown_6CA;
    u8 unknown_6CB;
    u16 initStep;
    u16 finishStep;
    u8 currWeather;
    u8 nextWeather;
    u8 weatherGfxLoaded;
    u8 unknown_6D3;
    u8 unknown_6D4;
    u8 altGammaSpritePalIndex;
    u16 unknown_6D6;
    u8 unknown_6D8;
    u8 unknown_6D9;
    u8 rainSpriteCount;
    u8 unknown_6DB;
    u8 unknown_6DC;
    u8 rainStrength;
    /*0x6DE*/ u8 cloudSpritesCreated;
    u8 filler_6DF[1];
    u16 unknown_6E0;
    u16 unknown_6E2;
    u8 snowflakeSpriteCount;
    u8 unknown_6E5;
    u16 unknown_6E6;
    u16 thunderCounter;
    u8 unknown_6EA;
    u8 unknown_6EB;
    u8 unknown_6EC;
    u8 unknown_6ED;
    u16 fog1ScrollPosX;
    u16 unknown_6F0;
    u16 unknown_6F2;
    u8 unknown_6F4[6];
    u8 unknown_6FA;
    u8 fog1SpritesCreated;
    u16 unknown_6FC;
    u16 unknown_6FE;
    u8 ashSpritesCreated;
    u8 filler_701[3];
    u32 unknown_704;
    u32 unknown_708;
    u8 filler_70C[2];
    u16 unknown_70E;
    u16 unknown_710;
    u16 unknown_712;
    u16 unknown_714;
    u8 sandstormSprites1Created;
    u8 sandstormSprites2Created;
    u16 unknown_718;
    u16 unknown_71A;
    u16 unknown_71C;
    u16 unknown_71E;
    u16 unknown_720;
    u16 unknown_722;
    u8 fog2SpritesCreated;
    u8 filler_725[1];
    u16 unknown_726;
    u16 unknown_728;
    u16 unknown_72A;
    u16 unknown_72C;
    u8 unknown_72E;
    u8 filler_72F;
    u16 currBlendEVA;
    u16 currBlendEVB;
    u16 targetBlendEVA;
    u16 targetBlendEVB;
    u8 blendUpdateCounter;
    u8 blendFrameCounter;
    u8 blendDelay;
    u8 filler_73B[0x3C-0x3B];
    s16 unknown_73C;
    s16 unknown_73E;
    s16 unknown_740;
    s16 unknown_742;
    u8 filler_744[0xD-4];
    s8 loadDroughtPalsIndex;
    u8 loadDroughtPalsOffset;
};

void StartWeather(void);
void ChangeWeather(u8 weather);
void sub_807C988(u8 effect);
void sub_807C9B4(u8 effect);
void Task_WeatherInit(u8);
void Task_WeatherMain(u8);
void sub_807CAE8(void);
void nullsub_38(void);
void sub_807CCAC(void);
u8 RainSnowShadeBlend_807CDC4(void);
u8 DroughtBlend_807CE24(void);
u8 Fog1Blend_807CE7C(void);
void nullsub_39(void);

// ASM
void BlendSomething_807CEBC(u8, u8, s8);
void BlendSomething_807D1BC(u8 a, u8 a2, s8 c, u8 d, u16 e);
void BlendSomething_807D424(u8, u16);
// ...

enum
{
    FADE_FROM_BLACK,
    FADE_TO_BLACK,
    FADE_FROM_WHITE,
    FADE_TO_WHITE,
};

void fade_screen(u8, u8);
// ...
void sub_807D78C(u8 tag);
void sub_807D874(u8);
// ...
void Weather_SetBlendCoeffs(u8, u8);
// ...
void PlayRainSoundEffect(void);
// ...
void SetSav1Weather(u32);
u8 GetSav1Weather(void);
void SetSav1WeatherFromCurrMapHeader(void);
// ...
void DoCurrentWeather(void);
void sub_8080750();

bool8 sub_807D770(void);
bool8 sub_807DDFC(void);
void SetWeather(u32);
void UpdateWeatherPerDay(u16);
void PreservePaletteInWeather(u8 index);
void ResetPreservedPalettesInWeather(void);
extern void ResetDroughtWeatherPaletteLoading(void);
void ResetDroughtWeatherPaletteLoading(void);
bool8 LoadDroughtWeatherPalettes(void);
u8 GetCurrentWeather(void);


extern struct Weather gWeather;

extern struct Weather *const gWeatherPtr;

#endif // GUARD_WEATHER_H
