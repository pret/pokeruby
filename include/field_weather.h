#ifndef GUARD_WEATHER_H
#define GUARD_WEATHER_H

#define WEATHER_NONE 0
#define WEATHER_CLOUDS 1
#define WEATHER_RAIN_LIGHT 3
#define WEATHER_SNOW 4
#define WEATHER_RAIN_MED 5
#define WEATHER_FOG_2 6
#define WEATHER_FOG_1 7
#define WEATHER_DROUGHT 12
#define WEATHER_RAIN_HEAVY 13

struct Sprite;

// TODO: This might be a union
struct Weather2
{
    /*0x00*/ u8 filler0[0xA0];
    /*0xA0*/ struct Sprite *fogSprites[20];
};

struct Weather
{
    /*0x000*/ struct Sprite *rainSprites[24];
    /*0x060*/ struct Sprite *snowflakeSprites[0x65];  // snowflakes?
    /*0x1F4*/ struct Sprite *cloudSprites[3];
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
    u16 initStep;
    u16 unknown_6CE;
    u8 currWeather;
    u8 nextWeather;
    u8 weatherGfxLoaded;
    u8 unknown_6D3;
    u8 unknown_6D4;
    u8 unknown_6D5;
    u16 unknown_6D6;
    u8 unknown_6D8;
    u8 unknown_6D9;
    u8 unknown_6DA;
    u8 unknown_6DB;
    u8 unknown_6DC;
    u8 rainStrength;
    /*0x6DE*/ u8 cloudsActive;
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
    u16 fog2ScrollPosX;
    u16 unknown_6F0;
    u16 unknown_6F2;
    u8 unknown_6F4[6];
    u8 unknown_6FA;
    u8 unknown_6FB;     // fogActive
    u16 unknown_6FC;
    u16 unknown_6FE;
    u8 unknown_700;
    u8 filler_701[0x15];
    u8 unknown_716;
    u8 unknown_717;
    u8 filler_718[0xc];
    u8 unknown_724;
    u8 filler_725[9];
    u8 unknown_72E;
    u8 filler_72F;
    u16 currBlendEVA;
    u16 currBlendEVB;
    u16 targetBlendEVA;
    u16 targetBlendEVB;
    u8 unknown_738;
    u8 unknown_739;
    u8 blendDelay;
    u8 filler_73B[0x3C-0x3B];
    s16 unknown_73C;
    s16 unknown_73E;
    s16 unknown_740;
    s16 unknown_742;
    u8 filler_744[0xD-4];
    s8 unknown_74D;
    u8 unknown_74E;
};

void StartWeather(void);
void DoWeatherEffect(u8 effect);
void sub_807C988(u8 effect);
void sub_807C9B4(u8 effect);
void Task_WeatherInit(u8);
void Task_WeatherMain(u8);
void sub_807CAE8(void);
void nullsub_38(void);
void sub_807CB10(void);
void sub_807CC24(void);
void sub_807CCAC(void);
u8 sub_807CDC4(void);
u8 sub_807CE24(void);
u8 sub_807CE7C(void);
void nullsub_39(void);

// ASM
void sub_807CEBC(u8, u8, s8);
//void sub_807D1BC(u8, u8, u8, u8, u16);
void sub_807D1BC(u8 a, u8 a2, s8 c, u8 d, u16 e);
void sub_807D304(s8 a, u8 arg2, u16 c);
void sub_807D424(u8, u16);
// ...
void fade_screen(u8, u8);
// ...
void sub_807D78C(u8 tag);
void sub_807D874(u8);
// ...
void Weather_SetBlendCoeffs(u8, u8);
// ...
void sub_807DE68(void);
// ...
void PlayRainSoundEffect(void);
// ...
void SetSav1Weather(u32);
u8 GetSav1Weather(void);
void sub_80806E4(void);
// ...
void DoCurrentWeather(void);
void sub_8080750();

bool8 sub_807D770(void);
bool8 sub_807DDFC(void);
void SetWeather(u32);
void UpdateWeatherPerDay(u16);

#endif // GUARD_WEATHER_H
