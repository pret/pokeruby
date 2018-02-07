#ifndef GUARD_EASYCHAT_H
#define GUARD_EASYCHAT_H

struct Sprite;

struct UnknownEasyChatStruct1
{
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u16 unk6;
    void *unk8;
};

struct Shared1000
{
    void (*unk0)(void);  // main cb 2
    u16 *unk4;
    u8 unk8;
    u8 unk9;
    u8 unkA;  // length of unkC array
    u8 unkB;  // reporter talked to (Gabby or Ty)
    u16 unkC[9];
    void (*unk20)(void);
    u16 unk24;
    u8 unk26;
    u8 unk27;
    u16 unk28;
    u8 unk2A[11][2];
    u8 unk40[4][14];
    u8 unk78[5];
    u8 unk7D;
    u8 unk7E[5];
    s8 unk83;
    s8 unk84;
    s8 unk85;
    s8 unk86;
    bool8 unk87;
    u16 unk88;
    u16 unk8A;
    u8 unk8C[(0x96-0x8C)/2][2];
    u8 unk96;
    u8 filler97;
    struct Sprite *unk98;
    struct Sprite *unk9C;
    struct Sprite *unkA0;
    struct Sprite *unkA4;
    struct Sprite *unkA8;
    struct Sprite *unkAC[2];
    struct Sprite *unkB4[2];
    u8 unkBC;
    u8 fillerBD;
    u16 unkBE;
    u8 fillerC0[2];
    u16 unkC2;  // length of unkC8 and unk148 arrays
    u16 unkC4;
    u8 fillerC6[2];
    u16 unkC8[(0x148-0xC8)/16][8];
    struct UnknownEasyChatStruct1 unk148[(0x1A8-0x148)/12];
    s8 unk1A8;
    s8 unk1A9;
    s8 unk1AA[0xB5-0xAA];
    s8 unk1B5;
    s8 unk1B6;
    s8 unk1B7;
    u8 unk1B8;
    u8 unk1B9;
    u16 unk1BA;
    u16 unk1BC;
    u8 unk1BE;
    s8 unk1BF;
    s8 unk1C0;
    u8 filler1C1[3];
    void (*unk1C4)(void);
    u8 unk1C8[0x500];
    u8 unk6C8[0xB78-0x6C8];
#if GERMAN
    u16 unkB78[27][270];
#else
    u16 unkB78[27][255];
#endif
    u16 unk4142[(0x78-0x42)/2];  //0x446C
    u16 unk4178[(0x41A4-0x4178)/2]; // unknown length
    const u8 *ecWordStrings[0x16][0x100];  //0x44CE in german
    s8 unk99A4;
    s8 unk99A5;
    s8 unk99A6[130];
    s8 unk9A28;
    s8 unk9A29;
    u16 unk9A2A[(0x9C32-0x9A2A)/4][2];  // unknown length
    u8 unk9C32;
    u8 filler9C33;
    u16 unk9C34[3][9];
    u8 filler9C6A[2];
    s8 *unk9C6C;
    u8 unk9C70;
    s8 unk9C71;
    u8 filler9C72[2];
    struct Sprite *unk9C74;
    u8 filler9C78[4];
    u16 unk9C7C;  // this is at 0x9FA8 in German
    s16 unk9C7E;
    u8 unk9C80[0xC9-0x80];
    u8 unk9CC9[0xD12-0xCC9];
    u8 unk9D12[0x5B-0x12];
    u8 unk9D5B[0xA4-0x5B];
    u8 unk9DA4[0xC9-0xA4];
    u8 unk9DC9[0xE14 - 0xDC9];
    u8 unk9E14[0xE41 - 0xE14];
    u8 unk9E41[0x6E - 0x41];
    u8 unk9E6E[0xEE - 0x6E];
    u8 unk9EEE[0xF6E - 0xEEE];
    u8 unk9F6E[0x8E - 0x6E];  // unknown length
    u8 unk9F8E[7];  // unknown length
};

// const pointer to shared1000. easy_chat might be two separate files.
extern struct Shared1000 *const gEasyChatStruct;

void sub_80E60D8(void);
void sub_80E62A0(u8 arg0, u16 *arg1, void (*arg2)(void), u8 arg3);
u16 sub_80EB72C(u16 group);
void sub_80EB6FC(u16 *, u16);
void InitEasyChatPhrases(void);
u8 sub_80EAD7C(u8 group);
u16 sub_80EAE88(u8);
u8 sub_80EB37C(u16);
u8* EasyChat_GetWordText(u8 *, u16);
u8 *ConvertEasyChatWordsToString(u8 *dst, u16 *words, u16, u16);
u16 sub_80EB784(u16 group);
u8 sub_80EB868(u8);
void sub_80EB890(u8);
u8 sub_80EB8C0(void);
u16 sub_80EB8EC(void);
u8 *sub_80EB544(u8 *dst, u16 *words, u16 arg2, u16 arg3);

#if GERMAN
u32 de_sub_80EB748(s32, s32);
#endif

#endif // GUARD_EASYCHAT_H
