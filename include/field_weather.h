#ifndef GUARD_WEATHER_H
#define GUARD_WEATHER_H

void sub_807C828(void);
void DoWeatherEffect(u8 effect);
void sub_807C988(u8 effect);
void sub_807C9B4(u8 effect);
void sub_807C9E4(u8);
void sub_807CA34(u8);
void sub_807CAE8(void);
void nullsub_38(void);
u32 sub_807CB0C(void);
void sub_807CB10(void);
void sub_807CC24(void);
void sub_807CCAC(void);
u8 sub_807CDC4(void);
u8 sub_807CE24(void);
u8 sub_807CE7C(void);
void nullsub_39(void);

// ASM
void sub_807CEBC(u8, u8, s8);
void sub_807D1BC(u8, u8, u8, u8, u16);
void sub_807D304(int, u8, u16);
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

u8 sub_807D770(void);
bool8 sub_807DDFC(void);
void SetWeather(u32);
void UpdateWeatherPerDay(u16);

struct Weather
{
    u8 filler_000[0xf0];
    struct Sprite *unk_0f0[20];
    u8 filler_140[0xc0];
    u8 unknown_200[2][32];
    u8 filler_240[0x480];
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
    u8 filler_6E5[0x15];
    u8 unknown_6FA;
    u8 unknown_6FB;
    u16 unknown_6FC;
    u8 filler_6FE[2];
    u8 unknown_700;
    u8 filler_701[0x15];
    u8 unknown_716;
    u8 unknown_717;
    u8 filler_718[0xc];
    u8 unknown_724;
    u8 filler_725[9];
    u8 unknown_72E;
};

#define gWeather gUnknown_0202F7E8
extern struct Weather gWeather;

extern struct Weather *const gUnknown_08396FC4;

#endif // GUARD_WEATHER_H
