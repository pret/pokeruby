#ifndef GUARD_WEATHER_H
#define GUARD_WEATHER_H

#define WEATHER_CLOUDS 1
#define WEATHER_RAIN_LIGHT 3
#define WEATHER_SNOW 4
#define WEATHER_RAIN_MED 5
#define WEATHER_DROUGHT 12
#define WEATHER_RAIN_HEAVY 13

struct Sprite;

struct Weather
{
    struct Sprite *unknown_0[24];
    struct Sprite *snowflakeSprites[0x65];  // snowflakes?
    struct Sprite *cloudSprites[3];
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
    u8 currWeather;
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
    u8 rainStrength;
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

void sub_807C828(void);
void DoWeatherEffect(u8 effect);
void sub_807C988(u8 effect);
void sub_807C9B4(u8 effect);
void sub_807C9E4(u8);
void sub_807CA34(u8);
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
void sub_807DB64(u8, u8);
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
