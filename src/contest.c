#include "global.h"
#include "constants/items.h"
#include "constants/map_objects.h"
#include "constants/songs.h"
#include "constants/species.h"
#include "battle.h"
#include "battle_anim.h"
#include "blend_palette.h"
#include "contest.h"
#include "contest_link_80C857C.h"
#include "data2.h"
#include "decompress.h"
#include "ewram.h"
#include "graphics.h"
#include "link.h"
#include "m4a.h"
#include "main.h"
#include "menu.h"
#include "menu_cursor.h"
#include "overworld.h"
#include "palette.h"
#include "random.h"
#include "rom_8077ABC.h"
#include "script.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "tv.h"
#include "unknown_task.h"
#include "util.h"

extern bool8 AreMovesContestCombo(u16, u16);
extern void sub_80C8A38(u8);
extern void sub_80C8AD0(u8);
extern void sub_80C8C80(u8);
extern void sub_81288F4();
extern u8 sub_8128944(void);

struct Shared18000
{
    /*0x18000*/ u8 unk18000;
    /*0x18001*/ u8 filler18001[3];
    /*0x18004*/ u16 unk18004[16][16];
    /*0x18204*/ u16 unk18204[0x200];
    /*0x18604*/ u16 unk18604[0x200];
    /*0x18A04*/ u8 unk18A04[0x800];
};

struct Shared19204
{
    /*0x19204*/ u8 unk19204;
    /*0x19205*/ u8 unk19205;
    /*0x19206*/ u8 unk19206[4];
    /*0x1920A*/ u16 unk1920A_0:1;  // Task active flags?
                u16 unk1920A_1:1;
                u16 unk1920A_2:1;
                u16 unk1920A_3:1;
                u16 unk1920A_4:1;
                u16 unk1920A_5:1;
                u16 unk1920A_6:1;
                u16 unk1920A_7:1;
    /*0x1920B*/ u16 unk1920B_0:1;
                u16 unk1920B_1:1;
                u16 unk1920B_2:1;
    /*0x1920C*/ u8 unk1920C;
    /*0x1920D*/ u8 unk1920D[4];
    /*0x19211*/ u8 unk19211;
    /*0x19212*/ u8 unk19212;
    /*0x19213*/ u8 filler19213;
    /*0x19214*/ u8 unk19214;
    /*0x19215*/ u8 unk19215;
    /*0x19216*/ u8 unk19216;    // sprite ID
    /*0x19217*/ s8 unk19217;
    /*0x19218*/ u8 unk19218[4];
    /*0x1921C*/ u32 unk1921C;
                u16 unk19220[2][4];  // unknown length
                u8 filler19230[0x48-0x30];
                u8 unk19248[5][4];
                u8 unk1925C;    // sprite ID
    /*0x1925D*/ u8 unk1925D;
    /*0x1925E*/ u8 unk1925E;
    /*0x1925F*/ u8 filler1925F;
};

#define static_assert(expr) \
  typedef char ____[(expr) ? 1 : -1]

  // Appeal, maybe
struct UnknownContestStruct1
{
    s16 unk0;
    s16 unk2;
    s16 unk4;
    u16 unk6;  // move 1
    u16 unk8;  // move 2
    u8 unkA;   // contest category
    u8 unkB_0:2;
    u8 unkB_2:2;
    u8 unkB_4:3;
    u8 unkB_7:1;
    u8 unkC_0:1;
    u8 unkC_1:2;
    s8 unkD;
    u8 unkE;
    u8 unkF;
    u8 unk10_0:1;
    u8 unk10_1:1;
    u8 unk10_2:1;
    u8 unk10_3:1;
    u8 unk10_4:2;
    u8 unk10_6:2;
    u8 unk11_0:2;
    u8 unk11_2:1;
    u8 unk11_3:1;
    u8 unk11_4:1;
    u8 unk11_5:1;
    u8 unk12;
    u8 unk13;
    u8 unk14;
    u8 unk15_0:1;
    u8 unk15_1:1;
    u8 unk15_2:1;
    u8 unk15_3:1;
    u8 unk15_4:1;
    u8 unk15_5:1;
    u8 unk15_6:1;
    u8 unk16;
    u8 unk17;
    u8 unk18;
    u8 unk19;  // turn number
    u8 unk1A;
    u8 unk1B;
};

struct UnknownContestStruct3
{
    u8 unk0;
    u8 unk1;
    //u8 unk2_0:1;
    //u8 unk2_1:1;
    u8 unk2;  // maybe a bitfield
    u8 filler3;
};

// possibly the same as UnknownContestStruct3?
struct UnknownContestStruct4
{
    u8 unk0;  // sprite ID
    u8 unk1;  // sprite ID
    u8 unk2_0:1;
    u8 unk2_1:1;
    u8 unk2_2:1;
    u8 filler3;
};

struct UnknownContestStruct5
{
    s8 bits_0;  // excitement?
    u8 bits_8:1;
    u8 bits_9:3;
    u8 bits_C:4;
    s8 unk2;
    u8 filler3;
};

struct UnknownContestStruct7
{
    u8 unk0[4];
    u16 unk4;
    u16 unk6;
    u8 filler8[0xD-8];
    u8 unkD[4];
    u8 unk11;
    u8 filler12[2];
};

struct UnknownContestStruct8
{
    u16 unk0;
    u16 unk2;
    u8 unk4_0:1;
    u8 unk5;
    u8 filler6[2];
    u32 unk8;
    u32 unkC;
    u32 unk10;
};

#if 0
struct Shared19260
{
    /*0x19260*/ struct UnknownContestStruct1 unk19260[4];
    /*0x192D0*/ u8 unk192D0[0x14];
    /*0x192E4*/ u8 unk192E4[0x44];
    ///*0x19328*/ u8 unk19328[4];
    /*0x19328*/ struct UnknownContestStruct5 unk19328;
    /*0x1932C*/ u8 filler1932C[0x38-0x2C];
    /*0x19338*/ struct UnknownContestStruct4 unk19338[4];
    /*0x19348*/ struct UnknownContestStruct3 unk19348[5];
};
#endif

#define shared15800 (gSharedMem + 0x15800)
#define shared15DE0 (*(struct ContestWinner *)(gSharedMem + 0x15DE0))
#define shared16800 (gSharedMem + 0x16800)
#define shared18000 (*(struct Shared18000 *)(gSharedMem + 0x18000))
#define shared19204 (*(struct Shared19204 *)(gSharedMem + 0x19204))
//#define shared19260 (*(struct Shared19260 *)(gSharedMem + 0x19260))

#define shared18004 ((u16 *)(gSharedMem + 0x18004))

// These are separate structs because sub_80AC2CC requires that to match.
#define shared19260_ ((struct UnknownContestStruct1 *)(gSharedMem + 0x19260))
//#define shared192D0 (gSharedMem + 0x192D0)
#define shared192D0_ (*(struct UnknownContestStruct7 *)(gSharedMem + 0x192D0))
#define shared192E4 (gSharedMem + 0x192E4)
#define shared19328 (*(struct UnknownContestStruct5 *)(gSharedMem + 0x19328))
#define shared19338 ((struct UnknownContestStruct4 *)(gSharedMem + 0x19338))
//#define shared19348 ((struct UnknownContestStruct3 *)(gSharedMem + 0x19348))
#define shared19348_ (*(struct UnknownContestStruct8 *)(gSharedMem + 0x19348))

struct UnknownContestStruct6
{
    s32 unk0;
    s32 unk4;
    s32 unk8;
    s32 unkC;
};

extern struct MusicPlayerInfo gMPlay_SE1;
extern u16 gScriptContestCategory;
extern u16 gScriptContestRank;
extern u8 gBattleMonForms[];
extern u8 gDisplayedStringBattle[];
extern u16 gBattleTypeFlags;
extern u8 gBankAttacker;
extern u8 gBankTarget;
extern u8 gBanksBySide[];
extern u8 gObjectBankIDs[];
extern u8 gIsLinkContest;
extern u8 gContestPlayerMonIndex;
extern u16 gUnknown_030041B0;
extern s16 gUnknown_030041B4;
extern u16 gUnknown_030041B8;
extern u16 gUnknown_03004200;
extern struct Window gUnknown_03004210;
extern u16 gUnknown_03004240;
extern u16 gUnknown_03004244;
extern u16 gUnknown_03004280;
extern u16 gUnknown_03004288;
extern u16 gUnknown_030042A0;
extern u16 gUnknown_030042A4;
extern u16 gUnknown_030042C0;
extern u16 gUnknown_030042C4;
extern u32 gUnknown_03005D28;

extern s16 gUnknown_02038680[];
extern u16 gUnknown_02038688[];
extern u8 gUnknown_02038694;
extern u8 gUnknown_02038696[];
extern u8 gUnknown_0203869B;
extern s16 gUnknown_02038670[];
extern s16 gUnknown_02038678[];
extern u8 gUnknown_02038690[];
extern struct SpriteTemplate gUnknown_02024E8C;


#define gContestOpponents gUnknown_083C9408
extern const struct ContestPokemon gContestOpponents[60];
extern const u8 gUnknown_083CA308[][2];
extern const u8 gUnknown_083CA310[][2];
extern const u8 gUnknown_083CA318[][2];
extern const u8 gUnknown_083CA330[][2];
extern const u8 gUnknown_083CA338[];
extern const u8 gUnknown_083CA33C[];
extern const struct CompressedSpriteSheet gUnknown_083CC3AC;
extern const struct CompressedSpritePalette gUnknown_083CC3B4[];
extern const struct SpriteTemplate gSpriteTemplate_83CC454[];
extern const struct SpriteSheet gUnknown_083CA350;
extern const struct SpriteTemplate gSpriteTemplate_83CA3AC;
extern const struct CompressedSpriteSheet gUnknown_083CA3C4[];
extern const struct SpritePalette gUnknown_083CA3E4;
extern const struct SpriteTemplate gSpriteTemplate_83CA3F4[];
extern const struct SubspriteTable gSubspriteTables_83CA464[];
extern const struct CompressedSpriteSheet gUnknown_083CA46C;
extern const struct SpritePalette gUnknown_083CA474;
extern const struct SpriteTemplate gSpriteTemplate_83CA484;
extern const struct SpriteTemplate gSpriteTemplate_83CA4A4;
extern const struct CompressedSpriteSheet gUnknown_083CA4BC;
extern const struct CompressedSpriteSheet gUnknown_083CA4C4;
extern const struct CompressedSpritePalette gUnknown_083CA4CC;
extern const struct SpriteTemplate gUnknown_083CA4D4;
extern const u8 gUnknown_083CAF84[];
extern const u8 gUnknown_083CAFAE[];
extern const u8 gUnknown_083CAFD7[];
extern const u8 gUnknown_083CB00D[];
extern const u8 gUnknown_083CBD52[];
extern const u8 gUnknown_083CBD79[];
extern const u8 gUnknown_083CBD9D[];
extern const u8 gUnknown_083CBDC6[];
extern const u8 gUnknown_083CBF60[];
extern const u8 gUnknown_083CB02C[];
extern const u8 *const gUnknown_083CB2F0[];
extern const u8 gUnknown_083CC075[];
extern const u8 gUnknown_083CC0A0[];
extern const u8 gUnknown_083CC0BC[];
extern const u8 gUnknown_083CC0E3[];
extern const u8 gUnknown_083CC103[];
extern const u8 gUnknown_083CC14A[];
extern const u8 gUnknown_083CC16E[];
extern const u8 *const gUnknown_083CC188[];
extern const u8 gUnknown_083CC280[];
extern const u8 gUnknown_083CC288[];
extern const u8 gUnknown_083CC290[];
extern const u8 gUnknown_083CC299[];
extern const u8 gUnknown_083CC2A3[];
extern const u8 *const gUnknown_083CC2D8[];
extern const u8 gUnknown_083CC2EC[];
extern const u8 *const gUnknown_083CC330[];
extern const u8 gUnknownText_UnknownFormatting2[];
extern const u8 gUnknownText_UnknownFormatting3[];
extern const u8 gUnknown_083CC59C[];
extern const u8 gUnknown_083CC5A2[];
extern const u16 gUnknown_083CC5A4[];
extern const struct ContestWinner gUnknown_083CC5D0[];
extern const u8 gUnknownText_MissedTurn[];
extern const u8 gUnknownText_LinkStandbyAndWinner[];
extern void (*const gContestEffectFuncs[])(void);
extern const s8 gContestExcitementTable[][5];

void sub_80AB350(void);
void sub_80AB5D4(u8);
void sub_80AB604(u8);
void sub_80AB678(u8);
void sub_80AB694(u8);
void sub_80AB6B4(u8);
u8 sub_80AB70C(u8 *);
void sub_80AB960(u8);
void sub_80AB9A0(u8);
void sub_80ABAAC(void);
void sub_80ABAC4(void);
void sub_80ABB70(u8);
void sub_80ABC3C(u8);
void sub_80ABC70(u8);
void sub_80ABCDC(u8);
void sub_80ABEA0(u8);
void sub_80AC0AC(s8);
void nullsub_17(s8);
void sub_80AC0C8(u8);
void sub_80AC15C(u8);
void sub_80AC188(u8);
void sub_80AC204(u8);
void sub_80AC250(u8);
void sub_80AC284(u8);
void sub_80AC2CC(u8);
void sub_80AD8DC(u8);
void sub_80AD8FC(struct Sprite *);
void sub_80AD92C(struct Sprite *);
void sub_80AD960(u8);
void sub_80ADA1C(u8);
void sub_80ADA4C(u8);
void sub_80ADAD8(u8);
void sub_80ADB04(u8);
void sub_80ADB48(u8);
void sub_80ADB88(u8);
void sub_80ADC10(u8);
void sub_80ADC4C(u8);
void sub_80ADC84(u8);
void sub_80ADCB4(u8);
void sub_80ADD04(u8);
void sub_80ADD74(u8);
void sub_80ADDA4(u8);
void sub_80ADE54(u8);
void sub_80ADEAC(u8);
void sub_80ADEEC(u8);
void sub_80ADF4C(u8);
void sub_80ADF98(u8);
void sub_80ADFD8(u8);
void sub_80AE010(void);
void sub_80AE020(u8 *, s32);
bool8 sub_80AE074(void);
void sub_80AEB4C(void *);
void sub_80AE5BC(u8);
void sub_80AE5D4(u8, u8);
void sub_80AE6CC(u8);
void sub_80AE6E4(u8, u8);
u8 sub_80AE858(void);
u8 sub_80AE8B4(void);
u8 sub_80AE9FC(u16, u32, u32);
bool8 sub_80AEB1C(u16);
void sub_80AEB30(void);
void sub_80AEBEC(u16);
void sub_80AED58(void);
bool8 sub_80AEE54(u8, u8);
bool8 sub_80AF038(u8);
void sub_80AF120(void);
void sub_80AF138(void);
u16 sub_80AF15C(u8);
void sub_80AF1B8(void);
void sub_80AF2A0(u8);
void sub_80AF2FC(void);
void sub_80AF3C0(void);
bool8 sub_80AF59C(u8);
s16 sub_80AF688(u8);
void sub_80AF6A0(void);
bool8 sub_80AF828(s32, s32, struct UnknownContestStruct6 *);
void sub_80AF860(void);
void sub_80AF94C(u8);
void sub_80AFA5C(void);
u16 sub_80AFB40(u8);
s8 sub_80AFB74(s16);
u8 sub_80AFBA0(s16, s16, u8);
void sub_80AFC74(u8);
void sub_80AFE30(void);
void sub_80AFF10(void);
bool8 sub_80AFF28(void);
void sub_80AFF60(struct Sprite *);
void sub_80AFFE0(bool8);
void sub_80B0034(void);
void sub_80B00C8(void);
void nullsub_18(s8);
void sub_80B0238(struct Sprite *);
void sub_80B0280(struct Sprite *);
void sub_80B02A8(struct Sprite *);
void sub_80B02F4(struct Sprite *);
void sub_80B0324(void);
void sub_80B03A8(u8);
void sub_80B03D8(u8);
void sub_80B0458(u8);
void sub_80B0518(void);
void sub_80B0548(u8);
void sub_80B05A4(u8);
void nullsub_19(int);
void sub_80B05FC(u8);
void sub_80B0748(u8);
void sub_80B09B0(u8);
u8 sub_80B09E4(u8);
void sub_80B0BC4(u8, bool8);
void sub_80B0C5C(struct Sprite *);
void sub_80B0CB0(struct Sprite *);
void sub_80B0CDC(u8, int);
void sub_80B0D7C(void);
void sub_80B1118(void);
void sub_80B114C(u8);
void sub_80B146C(u8, u8);
void sub_80B159C(void);
void sub_80B1710(u8);
void sub_80B1928(void);
s8 contest_get_move_excitement(u16);
u8 sub_80B1A2C(void);
void c3_08130B10(u8);
void sub_80B1B14(void);
void sub_80B1B68(u8);
void sub_80B1BDC(void);
void sub_80B1C34(u8);
void sub_80B1CBC(s8);
void sub_80B1CFC(u8);
void sub_80B1DDC(void);
void sub_80B1DFC(u8);
void sub_80B1EA8(s8, s8);
void sub_80B1F4C(u8);
void sub_80B1FD0(bool8);
const u8 *sub_80B208C(u8);
void sub_80B20C4(void);
bool8 sub_80B214C(u8);
void sub_80B2184(void);
void sub_80B2280(void);
void sub_80B237C(u8);
void sub_80B23BC(u8);
void sub_80B2400(u8);
void sub_80B253C(u8);
void sub_80B25A4(u8);
void sub_80B25E4(u8);
void sub_80B26C8(u8);
u16 sub_80B2760(u16);
u16 sub_80B2778(u16);
void sub_80B2790(u8);
void sub_80B28CC(int);
void sub_80B28F0(u8);
void sub_80B292C(void);
void sub_80B2968(void);
void sub_80B29B4(u16);


void nullsub_89(u8 taskId)
{
}

void ResetLinkContestBoolean(void)
{
    gIsLinkContest = FALSE;
}

// Contest_ResetGpuRegs
void sub_80AB1BC(void)
{
    u16 savedIme;

    REG_DISPCNT = 0x40;
    savedIme = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = savedIme;
    REG_DISPSTAT = 8;
    REG_BG0CNT = 0x9800;
    REG_BG1CNT = 0x9E09;
    REG_BG2CNT = 0x9C00;
    REG_BG3CNT = 0x3A03;
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    REG_BLDY = 0;
    REG_WININ = 0x3F3F;
    REG_WINOUT = 0x3F3F;
    REG_DISPCNT |= 0x7F00;

    gUnknown_030042A4 = 0;
    gUnknown_030042A0 = 0;
    gUnknown_030042C0 = 0;
    gUnknown_030041B4 = 0;
    gUnknown_03004288 = 0;
    gUnknown_03004280 = 0;
    gUnknown_030041B0 = 0;
    gUnknown_030041B8 = 0;
    gUnknown_030042C4 = 0;
    gUnknown_03004240 = 0;
    gUnknown_03004200 = 0;
    gUnknown_03004244 = 0;
}

void sub_80AB2AC(void)
{
    s32 i;

    LZDecompressVram(gContestMiscGfx, (void *)VRAM);
    LZDecompressVram(gContestAudienceGfx, (void *)(VRAM + 0x2000));
    LZDecompressVram(gUnknown_08D1725C, (void *)(VRAM + 0xD000));
    LoadCompressedPalette(gUnknown_08D17144, 0, 0x200);
    sub_80AB350();
    for (i = 0; i < 4; i++)
    {
        u32 var = 5 + i;

        LoadPalette(shared18000.unk18004[var], 16 * (5 + gUnknown_02038696[i]), 16 * sizeof(u16));
    }
}

void sub_80AB320(void)
{
    SetUpWindowConfig(&gWindowConfig_81E6FD8);
    InitWindowFromConfig(&gUnknown_03004210, &gWindowConfig_81E6FD8);
    InitWindowFromConfig(&gMenuWindow, &gWindowConfig_81E6FF4);
}

void sub_80AB350(void)
{
    u8 i;

    LoadFontDefaultPalette(&gWindowConfig_81E6FD8);
    FillPalette(0, 0, 2);
    for (i = 10; i < 14; i++)
        LoadPalette(gPlttBufferUnfaded + 241, 240 + i, 2);
    FillPalette(0x7E3F, 0xF3, 2);
}

// ClearContestVars
void sub_80AB398(void)
{
    s32 i;

    memset(&shared19204, 0, sizeof(shared19204));
    for (i = 0; i < 4; i++)
        shared19204.unk19206[i] = 0xFF;
    for (i = 0; i < 4; i++)
        memset(&shared19260_[i], 0, sizeof(shared19260_[i]));
    for (i = 0; i < 4; i++)
    {
        shared19260_[i].unkB_0 = 0;
        shared19260_[i].unk13 = 0xFF;
        shared19260_[i].unk14 = 0xFF;
    }
    //memset(shared192D0, 0, 20 * sizeof(*shared192D0));
    memset(&shared192D0_, 0, sizeof(shared192D0_));
    memset(shared192E4, 0, 0x44 * sizeof(*shared192E4));
    memset(&shared19328, 0, sizeof(shared19328));
    memset(shared19338, 0, 4 * sizeof(*shared19338));
    if (!(gIsLinkContest & 1))
        sub_80B0F28(0);
    for (i = 0; i < 4; i++)
    {
        shared19260_[i].unk19 = 0xFF;
        shared19204.unk19218[i] = gUnknown_02038696[i];
    }
    sub_80B159C();
}

// CB2_StartContest
void sub_80AB47C(void)
{
    switch (gMain.state)
    {
    case 0:
        SetVBlankCallback(NULL);
        sub_80AB320();
        sub_80AB1BC();
        dp12_8087EA4();
        ResetPaletteFade();
        gPaletteFade.bufferTransferDisabled = TRUE;
        {
            u8 *dest = (void *)VRAM;
            u32 size = 0x18000;
            while (1)
            {
                DmaFill32(3, 0, dest, 0x1000);
                dest += 0x1000;
                size -= 0x1000;
                if (size <= 0x1000)
                {
                    DmaFill32(3, 0, dest, size);
                    break;
                }
            }
        }
        ResetSpriteData();
        ResetTasks();
        FreeAllSpritePalettes();
        gReservedSpritePaletteCount = 4;
        //shared18000.unk18000 = 0;
        gSharedMem[0x18000] = 0;
        ClearBattleMonForms();
        sub_80AB398();
        gMain.state++;
        break;
    case 1:
        sub_80AB350();
        gMain.state++;
        break;
    case 2:
        if (sub_80AB70C(&shared19204.unk1925D) == 0)
            break;
        shared19204.unk1925D = 0;
        gMain.state++;
        break;
    case 3:
        sub_80B2184();
        gUnknown_030042C0 = 0;
        gUnknown_030041B4 = 0;
        BeginFastPaletteFade(2);
        gPaletteFade.bufferTransferDisabled = FALSE;
        SetVBlankCallback(sub_80ABAC4);
        shared19204.unk1920C = CreateTask(sub_80AB5D4, 10);
        SetMainCallback2(sub_80ABAAC);
        break;
    }
}

void sub_80AB5D4(u8 taskId)
{
    if (!gPaletteFade.active)
        gTasks[taskId].func = sub_80AB604;
}

void sub_80AB604(u8 taskId)
{
    if (gIsLinkContest & 1)  // wat?
    {
        if (!gPaletteFade.active)
        {
            gPaletteFade.bufferTransferDisabled = FALSE;
            sub_80AF860();
            CreateTask(sub_80AB678, 0);
            gTasks[taskId].func = nullsub_89;
        }
    }
    else
    {
        gTasks[taskId].func = sub_80AB960;
    }
}

void sub_80AB678(u8 taskId)
{
    SetTaskFuncWithFollowupFunc(taskId, sub_80C89DC, sub_80AB694);
}

void sub_80AB694(u8 taskId)
{
    u16 one = 1;

    gTasks[taskId].data[0] = one;
    gTasks[taskId].func = sub_80AB6B4;
}

void sub_80AB6B4(u8 taskId)
{
    gTasks[taskId].data[0]--;
    if (gTasks[taskId].data[0] <= 0)
    {
        GetMultiplayerId();  // unused return value
        DestroyTask(taskId);
        gTasks[shared19204.unk1920C].func = sub_80AB960;
        gRngValue = gUnknown_03005D28;
    }
}

u8 sub_80AB70C(u8 *a)
{
    u16 sp0[16];
    u16 sp20[16];

    switch (*a)
    {
    case 0:
        gPaletteFade.bufferTransferDisabled = TRUE;
        {
            u8 *dest = (void *)VRAM;
            u32 size = 0x18000;
            while (1)
            {
                DmaFill32(3, 0, dest, 0x1000);
                dest += 0x1000;
                size -= 0x1000;
                if (size <= 0x1000)
                {
                    DmaFill32(3, 0, dest, size);
                    break;
                }
            }
        }
        break;
    case 1:
        LZDecompressVram(gContestMiscGfx, (void *)VRAM);
        break;
    case 2:
        LZDecompressVram(gContestAudienceGfx, (void *)(VRAM + 0x2000));
        DmaCopyLarge32(3, (void *)(VRAM + 0x2000), shared15800, 0x2000, 0x1000);
        break;
    case 3:
        LZDecompressVram(gUnknown_08D1725C, (void *)(VRAM + 0xD000));
        break;
    case 4:
        LZDecompressVram(gUnknown_08D17424, (void *)(VRAM + 0xE000));
        {
            void *src = (void *)(VRAM + 0xE000);
            void *dest = shared18000.unk18A04;
            DmaCopy32(3, src, dest, 0x800);
        }
        break;
    case 5:
        LoadCompressedPalette(gUnknown_08D17144, 0, 0x200);
        CpuCopy32(gPlttBufferUnfaded + 128, sp0, 16 * sizeof(u16));
        CpuCopy32(gPlttBufferUnfaded + (5 + gContestPlayerMonIndex) * 16, sp20, 16 * sizeof(u16));
        CpuCopy32(sp20, gPlttBufferUnfaded + 128, 16 * sizeof(u16));
        CpuCopy32(sp0, gPlttBufferUnfaded + (5 + gContestPlayerMonIndex) * 16, 16 * sizeof(u16));
        {
            void *src = gPlttBufferUnfaded;
            void *dest = shared18000.unk18004;
            DmaCopy32(3, src, dest, 0x200);
        }
        sub_80AB350();
        break;
    case 6:
        sub_80B1118();
        sub_80AFA5C();
        sub_80AEB30();
        shared19204.unk19216 = sub_80AE8B4();
        sub_80AFE30();
        sub_80B0034();
        sub_80B00C8();
        sub_80B0324();
        sub_80B0518();
        gBanksBySide[0] = 0;
        gBanksBySide[1] = 1;
        gBanksBySide[2] = 3;
        gBanksBySide[3] = 2;
        gBattleTypeFlags = 0;
        gBankAttacker = 2;
        gBankTarget = 3;
        gObjectBankIDs[gBankAttacker] = sub_80AE858();
        sub_80B292C();
        break;
    default:
        *a = 0;
        return 1;
    }

    (*a)++;
    return 0;
}

void sub_80AB960(u8 taskId)
{
    gPaletteFade.bufferTransferDisabled = FALSE;
    if (!gPaletteFade.active)
    {
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].func = sub_80AB9A0;
    }
}

void sub_80AB9A0(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
    case 0:
        if (gTasks[taskId].data[1]++ <= 60)
            break;
        gTasks[taskId].data[1] = 0;
        PlaySE12WithPanning(SE_C_MAKU_U, 0);
        gTasks[taskId].data[0]++;
        break;
    case 1:
        gUnknown_030041B4 += 7;
        if (gUnknown_030041B4 <= 160)
            break;
        gTasks[taskId].data[0]++;
        break;
    case 2:
        sub_80B2280();
        gTasks[taskId].data[0]++;
        break;
    case 3:
        REG_BG0CNT_BITFIELD.priority = 0;
        REG_BG2CNT_BITFIELD.priority = 0;
        sub_80B1B14();
        gTasks[taskId].data[0]++;
        break;
    case 4:
    default:
        if (shared19204.unk1920A_6)
            break;
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].func = sub_80ABB70;
        break;
    }
}

void sub_80ABAAC(void)
{
    AnimateSprites();
    RunTasks();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_80ABAC4(void)
{
    REG_BG0HOFS = gUnknown_030042A4;
    REG_BG0VOFS = gUnknown_030042A0;
    REG_BG1HOFS = gUnknown_030042C0;
    REG_BG1VOFS = gUnknown_030041B4;
    REG_BG2HOFS = gUnknown_03004288;
    REG_BG2VOFS = gUnknown_03004280;
    REG_BG3HOFS = gUnknown_030041B0;
    REG_BG3VOFS = gUnknown_030041B8;
    REG_WIN0H = gUnknown_030042C4;
    REG_WIN0V = gUnknown_03004240;
    REG_WIN1H = gUnknown_03004200;
    REG_WIN1V = gUnknown_03004244;
    TransferPlttBuffer();
    LoadOam();
    ProcessSpriteCopyRequests();
    sub_8089668();
}

void sub_80ABB70(u8 taskId)
{
    gUnknown_030042A0 = 0;
    gUnknown_03004280 = 0;
    sub_80B0D7C();
    {
        void *src = gPlttBufferUnfaded;
        void *dest = shared18000.unk18204;
        DmaCopy32(3, src, dest, 0x400);
    }
    if (!sub_80AF59C(gContestPlayerMonIndex))
        StringCopy(gDisplayedStringBattle, gUnknown_083CAF84);
    else
        StringCopy(gDisplayedStringBattle, gUnknown_083CAFAE);
    sub_80AE020(gDisplayedStringBattle, shared19204.unk19205 + 1);
    sub_80AF138();
    StringExpandPlaceholders(gStringVar4, gDisplayedStringBattle);
    sub_8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
    gTasks[taskId].func = sub_80ABC3C;
}

void sub_80ABC3C(u8 taskId)
{
    if (sub_80037A0(&gMenuWindow) == 1)
        gTasks[taskId].func = sub_80ABC70;
}

void sub_80ABC70(u8 taskId)
{
    if ((gMain.newKeys & A_BUTTON) || (gMain.newKeys == B_BUTTON))
    {
        PlaySE(SE_SELECT);
        if (!sub_80AF59C(gContestPlayerMonIndex))
        {
            sub_80AFFE0(TRUE);
            gTasks[taskId].func = sub_80ABCDC;
        }
        else
        {
            gTasks[taskId].func = sub_80AC0C8;
        }
    }
}

extern const u8 gUnknown_083CA340[][4];

void sub_80ABCDC(u8 taskId)
{
    u8 i;
    u8 sp8[32];

    gUnknown_030042A0 = 0xA0;
    gUnknown_03004280 = 0xA0;
    FillWindowRect_DefaultPalette(
      &gUnknown_03004210,
      0,
      gUnknown_083CA340[0][0],
      gUnknown_083CA340[0][1],
      gUnknown_083CA340[0][2],
      gUnknown_083CA340[0][3]);

    for (i = 0; i < 4; i++)
    {
        u16 r4 = gContestMons[gContestPlayerMonIndex].moves[i];
        u8 *r5 = sp8;

        if (shared19260_[gContestPlayerMonIndex].unk8 != 0
         && sub_80B214C(gContestPlayerMonIndex)
         && AreMovesContestCombo(shared19260_[gContestPlayerMonIndex].unk8, r4)
         && shared19260_[gContestPlayerMonIndex].unk15_4)
        {
            r5 = StringCopy(sp8, gUnknownText_UnknownFormatting2);
        }
        else if (r4 != 0
         && shared19260_[gContestPlayerMonIndex].unk8 == r4
         && gContestMoves[r4].effect != 3)
        {
            r5 = StringCopy(sp8, gUnknownText_UnknownFormatting3);
        }
        r5 = StringCopy(r5, gMoveNames[r4]);

        sub_8002E4C(
          &gUnknown_03004210,
          sp8,
          776 + i * 20,
          gUnknown_083CA340[i][0] * 8 + 4,
          gUnknown_083CA340[i][1] * 8,
          1);
        sub_8002F44(&gUnknown_03004210);
    }

    sub_814A5C0(0, 0xFFFF, 12, 0x2D9F, 72);
    sub_80AC0AC(shared19204.unk19204);
    sub_80AEBEC(gContestMons[gContestPlayerMonIndex].moves[shared19204.unk19204]);
    gTasks[taskId].func = sub_80ABEA0;
}

void sub_80ABEA0(u8 taskId)
{
    u8 r6 = 0;
    s32 i;

    for (i = 0; i < 4; i++)
    {
        if (gContestMons[gContestPlayerMonIndex].moves[i] != 0)
            r6++;
    }

    if (gMain.newKeys & A_BUTTON)
    {
        DestroyMenuCursor();
        PlaySE(SE_SELECT);
        gTasks[taskId].func = sub_80AC0C8;
    }
    else
    {
        switch (gMain.newAndRepeatedKeys)
        {
        case B_BUTTON:
            sub_814A904();
            PlaySE(SE_SELECT);
            sub_80AFFE0(FALSE);
            FillWindowRect_DefaultPalette(
              &gUnknown_03004210,
              0,
              gUnknown_083CA340[0][0],
              gUnknown_083CA340[0][1],
              gUnknown_083CA340[0][2],
              gUnknown_083CA340[0][3]);
            if (!sub_80AF59C(gContestPlayerMonIndex))
                StringCopy(gDisplayedStringBattle, gUnknown_083CAF84);
            else
                StringCopy(gDisplayedStringBattle, gUnknown_083CAFAE);
            sub_80AE020(gDisplayedStringBattle, shared19204.unk19205 + 1);
            sub_80AF138();
            StringExpandPlaceholders(gStringVar4, gDisplayedStringBattle);
            sub_8003460(&gMenuWindow, gStringVar4, 776, 1, 15);
            gUnknown_030042A0 = 0;
            gUnknown_03004280 = 0;
            gTasks[taskId].func = sub_80ABC70;
            break;
        case DPAD_LEFT:
        case DPAD_RIGHT:
            break;
        case DPAD_UP:
            nullsub_17(shared19204.unk19204);
            if (shared19204.unk19204 == 0)
                shared19204.unk19204 = r6 - 1;
            else
                shared19204.unk19204--;
            sub_80AC0AC(shared19204.unk19204);
            sub_80AED58();
            sub_80AEBEC(gContestMons[gContestPlayerMonIndex].moves[shared19204.unk19204]);
            if (r6 > 1)
                PlaySE(SE_SELECT);
            break;
        case DPAD_DOWN:
            nullsub_17(shared19204.unk19204);
            if (shared19204.unk19204 == r6 - 1)
                shared19204.unk19204 = 0;
            else
                shared19204.unk19204++;
            sub_80AC0AC(shared19204.unk19204);
            sub_80AED58();
            sub_80AEBEC(gContestMons[gContestPlayerMonIndex].moves[shared19204.unk19204]);
            if (r6 > 1)
                PlaySE(SE_SELECT);
            break;
        }
    }
}

void sub_80AC0AC(s8 a)
{
    sub_814A880(4, 88 + a * 16);
}

void nullsub_17(s8 a)
{
}

void sub_80AC0C8(u8 taskId)
{
    if (gIsLinkContest & 1)
    {
        u16 var = sub_80AF15C(gContestPlayerMonIndex);
        u8 taskId2;

        shared19260_[gContestPlayerMonIndex].unk6 = var;
        taskId2 = CreateTask(sub_80C8A38, 0);
        SetTaskFuncWithFollowupFunc(taskId2, sub_80C8A38, sub_80AC15C);
        gTasks[taskId].func = nullsub_89;
        sub_80AF860();
        sub_80AFFE0(FALSE);
    }
    else
    {
        sub_80AF1B8();
        gTasks[taskId].func = sub_80AC188;
    }
}

void sub_80AC15C(u8 taskId)
{
    DestroyTask(taskId);
    gTasks[shared19204.unk1920C].func = sub_80AC188;
}

void sub_80AC188(u8 taskId)
{
    sub_80AF138();
    gUnknown_030042A0 = 0;
    gUnknown_03004280 = 0;
    sub_80AFFE0(FALSE);
    {
        void *src = gPlttBufferFaded;
        void *dest = shared18000.unk18604;
        u32 size = 0x400;
        DmaCopy32(3, src, dest, size);
    }
    LoadPalette(shared18000.unk18204, 0, 0x400);
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = 0;
    gTasks[taskId].func = sub_80AC204;
}

void sub_80AC204(u8 taskId)
{
    if (++gTasks[taskId].data[0] > 2)
    {
        gTasks[taskId].data[0] = 0;
        if (++gTasks[taskId].data[1] == 2)
        {
            sub_80B1BDC();
            sub_80B25E4(1);
            gTasks[taskId].func = sub_80AC250;
        }
    }
}

void sub_80AC250(u8 taskId)
{
    if (!shared19204.unk1920A_6 && !shared19204.unk1920B_1)
    //if (!(shared19204.unk1920A & 0x40) && !(shared19204.unk1920B & 2))
        gTasks[taskId].func = sub_80AC284;
}

void sub_80AC284(u8 taskId)
{
    if (++gTasks[taskId].data[0] > 19)
    {
        shared19204.unk19214 = 0;
        shared19204.unk1921C = gRngValue;
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = sub_80AC2CC;
    }
}

void sub_80AC2CC(u8 taskId)
{
    u8 spriteId;
    s32 r6;
    u8 r7 = shared19204.unk19215;
    s8 r4;

    switch (gTasks[taskId].data[0])
    {
    case 0:
        sub_80B0D7C();
        for (r6 = 0; shared19204.unk19214 != shared192D0_.unk0[r6]; r6++)
            ;
        shared19204.unk19215 = r6;
        r7 = shared19204.unk19215;
        if (gIsLinkContest & 1)
        {
            u8 taskId2;

            shared19204.unk1920B_2 = 1;
            if (sub_80AE074())
                sub_80B114C(shared19204.unk19215);
            taskId2 = CreateTask(sub_80C8C80, 0);
            SetTaskFuncWithFollowupFunc(taskId2, sub_80C8C80, sub_80AD8DC);
            sub_80AF860();
            gTasks[taskId].data[0] = 1;
        }
        else
        {
            sub_80B114C(shared19204.unk19215);
            gTasks[taskId].data[0] = 2;
        }
        return;
    case 1:
        if (!shared19204.unk1920B_2)
            gTasks[taskId].data[0] = 2;
        return;
    case 2:
        if (shared19260_[r7].unkC_1 != 0
         || shared19260_[r7].unkB_7)
        {
            gTasks[taskId].data[0] = 31;
        }
        else
        {
            sub_80AF138();
            sub_80B0CDC(r7, 0);
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 3;
        }
        return;
    case 3:
        for (r6 = 0; r6 < 4; r6++)
            gBattleMonForms[r6] = 0;
        memset(&shared19348_, 0, sizeof(shared19348_));
        sub_80B28F0(shared19204.unk19215);
        spriteId = sub_80AE9FC(
          gContestMons[shared19204.unk19215].species,
          gContestMons[shared19204.unk19215].otId,
          gContestMons[shared19204.unk19215].personality);
        gSprites[spriteId].pos2.x = 120;
        gSprites[spriteId].callback = sub_80AD8FC;
        gTasks[taskId].data[2] = spriteId;
        gObjectBankIDs[gBankAttacker] = spriteId;
        sub_80B0BC4(sub_80B09E4(shared19204.unk19215), FALSE);
        gTasks[taskId].data[0] = 4;
        return;
    case 4:
        spriteId = gTasks[taskId].data[2];
        if (gSprites[spriteId].callback == SpriteCallbackDummy)
        {
            if (!shared19338[r7].unk2_1)
                gTasks[taskId].data[0] = 5;
        }
        return;
    case 5:
        if (shared19260_[r7].unkC_0)
        {
            gTasks[taskId].data[0] = 33;
        }
        else
        {
            sub_80AF138();
            StringCopy(gStringVar1, gContestMons[r7].nickname);
            if (shared19260_[r7].unk6 < 355)
                StringCopy(gStringVar2, gMoveNames[shared19260_[r7].unk6]);
            else
                StringCopy(gStringVar2, gUnknown_083CC330[shared19260_[r7].unkA]);
            StringExpandPlaceholders(gStringVar4, gUnknown_083CAFD7);
            sub_8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
            gTasks[taskId].data[0] = 6;
        }
        return;
    case 6:
        if (sub_80037A0(&gMenuWindow) != 0)
        {
            shared19204.unk1925E = 0;
            gTasks[taskId].data[0] = 7;
        }
        return;
    case 7:
        {
            u16 move = sub_80B2760(shared19260_[shared19204.unk19215].unk6);

            sub_80B2790(shared19204.unk19215);
            sub_80B28F0(shared19204.unk19215);
            sub_80B29B4(move);
            ExecuteMoveAnim(move);
            gTasks[taskId].data[0] = 8;
        }
        return;
    case 8:
        gAnimScriptCallback();
        if (!gAnimScriptActive)
        {
            sub_80B28CC(r7);
            if (shared19204.unk1925E != 0)
            {
                gTasks[taskId].data[10] = 0;
                gTasks[taskId].data[0] = 9;
            }
            else
            {
                if (!shared19260_[r7].unk15_4)
                    sub_80B03A8(r7);
                sub_80B20C4();
                gTasks[taskId].data[0] = 23;
            }
        }
        return;
    case 9:
        if (gTasks[taskId].data[10]++ > 30)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 7;
        }
        return;
    case 23:
        gTasks[taskId].data[1] = 0;
        if (shared19260_[r7].unk13 != 0xFF)
        {
            sub_80B146C(r7, shared19260_[r7].unk13);
            shared19260_[r7].unk13 = 0xFF;
            gTasks[taskId].data[0] = 24;
        }
        else
        {
            if (shared19260_[r7].unk14 != 0xFF)
            {
                for (r6 = 0; r6 < 4; r6++)
                {
                    if (r6 != r7 && shared19260_[r6].unk13 != 0xFF)
                        break;
                }
                if (r6 == 4)
                {
                    sub_80B146C(r7, shared19260_[r7].unk14);
                    shared19260_[r7].unk14 = 0xFF;
                    gTasks[taskId].data[0] = 24;
                }
                else
                {
                    gTasks[taskId].data[0] = 48;
                }
            }
            else
            {
                gTasks[taskId].data[0] = 48;
            }
        }
        return;
    case 24:
        if (sub_80037A0(&gMenuWindow) != 0)
            gTasks[taskId].data[0] = 23;
        return;
    case 48:
        if (shared19260_[r7].unk11_0 == 1)
        {
            sub_80B1710(5);
        }
        else if (shared19260_[r7].unk11_0 == 2)
        {
            sub_80B1710(6);
        }
        else if (shared19260_[r7].unk11_0 == 3)
        {
            sub_80B1710(7);
        }
        else
        {
            gTasks[taskId].data[0] = 47;
            return;
        }
        gTasks[taskId].data[0] = 49;
        return;
    case 49:
        if (!shared19204.unk1920A_4)
            gTasks[taskId].data[0] = 47;
        return;
    case 47:
        sub_80B1FD0(TRUE);
        gTasks[taskId].data[0] = 12;
        return;
    case 12:
        sub_80AFBA0(0, shared19260_[r7].unk2, r7);
        gTasks[taskId].data[0] = 13;
        return;
    case 13:
        if (!shared19338[shared19204.unk19215].unk2_2)
            gTasks[taskId].data[0] = 35;
        return;
    case 35:
        if (shared19260_[r7].unk10_4 == 1)
            sub_80B1710(8);
        gTasks[taskId].data[0] = 36;
        return;
    case 36:
        if (!shared19204.unk1920A_4)
            gTasks[taskId].data[0] = 37;
        return;
    case 37:
        if (sub_80AEE54(r7, 1))
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 38;
        }
        else
        {
            gTasks[taskId].data[0] = 50;
        }
        return;
    case 38:
        if (++gTasks[taskId].data[10] > 20)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 50;
        }
        return;
    case 50:
        if (sub_80AF038(r7))
            PlaySE(SE_C_PASI);
        gTasks[taskId].data[0] = 25;
        return;
    case 25:
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].data[0] = 26;
        return;
    case 26:
        {
            s32 r2 = 0;

            r4 = 0;
            for (r6 = gTasks[taskId].data[1]; r6 < 4; r6++)
            {
                r4 = 0;
                for (r2 = 0; r2 < 4; r2++)
                {
                    if (r2 != r7 && gUnknown_02038696[r2] == r6
                     && shared19260_[r2].unk13 != 0xFF)
                    {
                        r4 = 1;
                        break;
                    }
                }
                if (r4 != 0)
                    break;
            }
            if (r4)
            {
                gTasks[taskId].data[1] = gUnknown_02038696[r2];
                sub_80B146C(r2, shared19260_[r2].unk13);
                shared19260_[r2].unk13 = 0xFF;
                gTasks[taskId].data[0] = 27;
            }
            else
            {
                gTasks[taskId].data[1] = 0;
                gTasks[taskId].data[10] = 0;
                gTasks[taskId].data[0] = 51;
                sub_80AF120();
            }
        }
        return;
    case 27:
        if (sub_80037A0(&gMenuWindow) != 0)
            gTasks[taskId].data[0] = 28;
        return;
    case 28:
        for (r6 = 0; gTasks[taskId].data[1] != gUnknown_02038696[r6]; r6++)
            ;
        sub_80AFBA0(shared19260_[r6].unk2 + shared19260_[r6].unkE, -shared19260_[r6].unkE, r6);
        gTasks[taskId].data[0] = 29;
        return;
    case 29:
        for (r6 = 0; gTasks[taskId].data[1] != gUnknown_02038696[r6]; r6++)
            ;
        if (!shared19338[r6].unk2_2)
            gTasks[taskId].data[0] = 39;
        return;
    case 39:
        for (r6 = 0; gTasks[taskId].data[1] != gUnknown_02038696[r6]; r6++)
            ;
        if (sub_80AEE54(r6, 1))
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 40;
        }
        else
        {
            gTasks[taskId].data[0] = 30;
        }
        return;
    case 40:
        if (++gTasks[taskId].data[10] > 20)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 30;
        }
        return;
    case 30:
        for (r6 = 0; r6 < 4; r6++)
        {
            if (gUnknown_02038696[r6] == gTasks[taskId].data[1])
                break;
        }
        if (sub_80AF038(r6))
            PlaySE(SE_C_PASI);
        else
            PlaySE(SE_C_SYU);
        if (shared19260_[r6].unk15_5)
        {
            sub_80B03A8(r6);
            shared19260_[r6].unk15_5 = 0;
        }
        gTasks[taskId].data[1]++;
        gTasks[taskId].data[0] = 26;
        return;
    case 51:
        if (gTasks[taskId].data[10]++ > 9)
        {
            gTasks[taskId].data[10] = 0;
            if (shared19260_[r7].unkC_1 != 0
             || shared19260_[r7].unk11_2)
            {
                sub_80AF138();
                StringCopy(gStringVar1, gContestMons[r7].nickname);
                StringExpandPlaceholders(gStringVar4, gUnknown_083CC103);
                sub_8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
            }
            gTasks[taskId].data[0] = 52;
        }
        return;
    case 52:
        if (sub_80037A0(&gMenuWindow) != 0)
        {
            if (!shared19260_[r7].unk15_6)
                gTasks[taskId].data[0] = 17;
            else
                gTasks[taskId].data[0] = 14;
        }
        return;
    case 14:
        r4 = shared19260_[r7].unk16;
        if (shared19260_[r7].unk16 != 0)
        {
            sub_80AF138();
            if (r4 == 1)
                sub_8002EB0(&gMenuWindow, gUnknown_083CBD79, 776, 1, 15);
            else if (r4 == 2)
                sub_8002EB0(&gMenuWindow, gUnknown_083CBD9D, 776, 1, 15);
            else
                sub_8002EB0(&gMenuWindow, gUnknown_083CBDC6, 776, 1, 15);
            sub_80B1710(3);
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 45;
        }
        else
        {
            sub_80AF138();
            StringCopy(gStringVar1, gContestMons[r7].nickname);
            StringExpandPlaceholders(gStringVar4, gUnknown_083CBD52);
            sub_8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
            sub_80B1710(2);
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 45;
        }
        return;
    case 45:
        if (!shared19204.unk1920A_4)
        {
            sub_80B09B0(shared19204.unk19215);
            gTasks[taskId].data[0] = 15;
        }
        return;
    case 15:
        if (sub_80037A0(&gMenuWindow) != 0)
        {
            if (++gTasks[taskId].data[10] > 50)
            {
                if (!shared19260_[r7].unk15_4)
                {
                    sub_80AFBA0(
                      shared19260_[r7].unk2,
                      shared19260_[r7].unk17,
                      r7);
                    shared19260_[r7].unk2 += shared19260_[r7].unk17;
                }
                gTasks[taskId].data[0] = 16;
            }
        }
        return;
    case 16:
        if (!shared19338[r7].unk2_2)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 17;
        }
        return;
    case 17:
        if (shared19260_[r7].unk15_0)
        {
            sub_80AF138();
            StringCopy(gStringVar1, gContestMons[r7].nickname);
            StringExpandPlaceholders(gStringVar4, gUnknown_083CC075);
            sub_8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
            gTasks[taskId].data[10] = 0;
            sub_80B1710(0);
            gTasks[taskId].data[0] = 46;
        }
        else
        {
            gTasks[taskId].data[0] = 41;
        }
        return;
    case 46:
        if (!shared19204.unk1920A_4)
            gTasks[taskId].data[0] = 19;
        return;
    case 19:
        if (sub_80037A0(&gMenuWindow) != 0)
        {
            sub_80AFBA0(shared19260_[r7].unk2, -shared19260_[r7].unk18, r7);
            shared19260_[r7].unk2 -= shared19260_[r7].unk18;
            gTasks[taskId].data[0] = 18;
        }
        return;
    case 18:
        sub_80B0D7C();
        if (!shared19338[r7].unk2_2)
        {
            gTasks[taskId].data[10] = 0;
            sub_80AF138();
            gTasks[taskId].data[0] = 41;
        }
        return;
    case 41:
        if (shared19328.bits_8 && r7 != shared19328.bits_9)
        {
            gTasks[taskId].data[0] = 57;
        }
        else
        {
            r4 = shared19328.bits_0;
            if (shared19260_[r7].unk11_4)
            {
                r4 = 1;
                StringCopy(gStringVar3, gMoveNames[shared19260_[r7].unk6]);
            }
            else
            {
                StringCopy(gStringVar3, gUnknown_083CC2D8[gContestMoves[shared19260_[r7].unk6].contestCategory]);
            }
            if (r4 > 0)
            {
                if (shared19260_[r7].unk15_0)
                    r4 = 0;
            }
            sub_80AF138();
            StringCopy(gStringVar1, gContestMons[r7].nickname);
            shared19204.unk19217 += r4;
            if (shared19204.unk19217 < 0)
                shared19204.unk19217 = 0;
            if (r4 == 0)
            {
                gTasks[taskId].data[0] = 55;
            }
            else
            {
                if (r4 < 0)
                    StringExpandPlaceholders(gStringVar4, gUnknown_083CC0BC);
                else if (r4 > 0 && shared19204.unk19217 <= 4)
                    StringExpandPlaceholders(gStringVar4, gUnknown_083CC0A0);
                else
                    StringExpandPlaceholders(gStringVar4, gUnknown_083CC0E3);
                sub_8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
                gTasks[taskId].data[10] = 0;
                gTasks[taskId].data[11] = 0;
                if (r4 < 0)
                    gTasks[taskId].data[0] = 53;
                else
                    gTasks[taskId].data[0] = 54;
            }
        }
        return;
    case 53:
        switch (gTasks[taskId].data[10])
        {
        case 0:
            sub_80B1EA8(-1, 1);
            PlayFanfare(BGM_ME_ZANNEN);
            gTasks[taskId].data[10]++;
            break;
        case 1:
            if (!shared19204.unk1920B_0 && sub_80037A0(&gMenuWindow) != 0)
            {
                sub_80B1CBC(-1);
                gTasks[taskId].data[10]++;
            }
            break;
        case 2:
            if (!shared19204.unk1920A_5)
            {
                if (gTasks[taskId].data[11]++ > 29)
                {
                    gTasks[taskId].data[11] = 0;
                    sub_80B1EA8(-1, -1);
                    gTasks[taskId].data[10]++;
                }
            }
            break;
        case 3:
            if (!gPaletteFade.active)
            {
                gTasks[taskId].data[10] = 0;
                gTasks[taskId].data[11] = 0;
                gTasks[taskId].data[0] = 43;
            }
            break;
        }
        return;
    case 54:
        switch (gTasks[taskId].data[10])
        {
        case 0:
            if (sub_80037A0(&gMenuWindow) != 0)
            {
                sub_80B1EA8(1, 1);
                gTasks[taskId].data[10]++;
            }
            break;
        case 1:
            if (!shared19204.unk1920B_0)
            {
                sub_80B1DDC();
                PlaySE(SE_W227B);
                sub_80B1CBC(1);
                gTasks[taskId].data[10]++;
            }
            break;
        case 2:
            if (!shared19204.unk1920A_5)
            {
                if (gTasks[taskId].data[11]++ > 29)
                {
                    gTasks[taskId].data[11] = 0;
                    sub_80AFBA0(shared19260_[r7].unk2, shared19328.unk2, r7);
                    shared19260_[r7].unk2 += shared19328.unk2;
                    gTasks[taskId].data[10]++;
                }
            }
            break;
        case 3:
            if (!shared19338[r7].unk2_2)
            {
                if (!shared19204.unk1920A_7)
                {
                    sub_80B1EA8(1, -1);
                    gTasks[taskId].data[10]++;
                }
            }
            break;
        case 4:
            if (!gPaletteFade.active)
            {
                gTasks[taskId].data[10] = 0;
                gTasks[taskId].data[11] = 0;
                gTasks[taskId].data[0] = 43;
            }
            break;
        }
        return;
    case 43:
        if (!shared19338[r7].unk2_2)
        {
            sub_80AF138();
            gTasks[taskId].data[0] = 55;
        }
        return;
    case 57:
        sub_80AF138();
        StringCopy(gStringVar3, gContestMons[shared19328.bits_9].nickname);
        StringCopy(gStringVar1, gContestMons[r7].nickname);
        StringCopy(gStringVar2, gMoveNames[shared19260_[r7].unk6]);
        StringExpandPlaceholders(gStringVar4, gUnknown_083CC14A);
        sub_8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
        gTasks[taskId].data[0] = 58;
        return;
    case 58:
        if (sub_80037A0(&gMenuWindow) != 0)
        {
            sub_80AF138();
            StringExpandPlaceholders(gStringVar4, gUnknown_083CC16E);
            sub_8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
            gTasks[taskId].data[0] = 59;
        }
        return;
    case 59:
        if (sub_80037A0(&gMenuWindow) != 0)
        {
            sub_80AF138();
            gTasks[taskId].data[0] = 55;
        }
        return;
    case 33:
        if (shared19260_[r7].unk15_4)
            shared19260_[r7].unk15_4 = 0;
        sub_80B09B0(r7);
        StringCopy(gStringVar1, gContestMons[r7].nickname);
        StringCopy(gStringVar2, gMoveNames[shared19260_[r7].unk6]);
        StringExpandPlaceholders(gStringVar4, gUnknown_083CBF60);
        sub_8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
        gTasks[taskId].data[0] = 34;
        return;
    case 34:
        if (sub_80037A0(&gMenuWindow) != 0)
            gTasks[taskId].data[0] = 55;
        return;
    case 55:
        sub_80B1BDC();
        gTasks[taskId].data[0] = 56;
        return;
    case 56:
        if (!shared19204.unk1920A_6)
        {
            if (shared19204.unk19217 > 4)
            {
                shared19204.unk19217 = 0;
                sub_80B1928();
            }
            gTasks[taskId].data[0] = 10;
        }
        return;
    case 10:
        spriteId = gTasks[taskId].data[2];
        gSprites[spriteId].callback = sub_80AD92C;
        gTasks[taskId].data[0] = 11;
        return;
    case 11:
        spriteId = gTasks[taskId].data[2];
        if (gSprites[spriteId].invisible)
        {
            FreeSpriteOamMatrix(&gSprites[spriteId]);
            DestroySprite(&gSprites[spriteId]);
            gTasks[taskId].data[0] = 20;
        }
        return;
    case 20:
        for (r6 = 0; r6 < 4; r6++)
            sub_80B0CDC(r6, 1);
        gTasks[taskId].data[10] = 0;
        gTasks[taskId].data[0] = 21;
        return;
    case 31:
        sub_80AF138();
        StringCopy(gStringVar1, gContestMons[r7].nickname);
        StringExpandPlaceholders(gStringVar4, gUnknown_083CB00D);
        sub_8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
        gTasks[taskId].data[0] = 32;
        return;
    case 32:
        if (sub_80037A0(&gMenuWindow) != 0)
            gTasks[taskId].data[0] = 21;
        return;
    case 21:
        if (++gTasks[taskId].data[10] > 29)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 22;
        }
        return;
    case 22:
        if (++shared19204.unk19214 == 4)
        {
            gTasks[taskId].data[0] = 0;
            gTasks[taskId].data[1] = 0;
            gTasks[taskId].data[2] = 0;
            gTasks[taskId].func = sub_80AD960;
        }
        else
        {
            gTasks[taskId].data[0] = 0;
        }
        nullsub_18(0);
        return;
    }
}

void sub_80AD8DC(u8 taskId)
{
    shared19204.unk1920B_2 = 0;
    DestroyTask(taskId);
}

void sub_80AD8FC(struct Sprite *sprite)
{
    if (sprite->pos2.x != 0)
    {
        sprite->pos2.x -= 2;
    }
    else
    {
        if (++sprite->data[0] == 31)
        {
            sprite->data[0] = 0;
            sprite->callback = SpriteCallbackDummy;
        }
    }
}

void sub_80AD92C(struct Sprite *sprite)
{
    sprite->pos2.x -= 6;
    if (sprite->pos1.x + sprite->pos2.x < -32)
    {
        sprite->callback = SpriteCallbackDummy;
        sprite->invisible = TRUE;
    }
}

void sub_80AD960(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
    case 0:
        if (gIsLinkContest & 1)
        {
            u8 taskId2;

            shared19204.unk1920B_2 = 1;
            if (sub_80AE074())
            {
                sub_80AF2FC();
                sub_80AF3C0();
            }
            taskId2 = CreateTask(sub_80C8C80, 0);
            SetTaskFuncWithFollowupFunc(taskId2, sub_80C8C80, sub_80AD8DC);
            sub_80AF860();
            gTasks[taskId].data[0] = 1;
        }
        else
        {
            sub_80AF2FC();
            sub_80AF3C0();
            gTasks[taskId].data[0] = 2;
        }
        break;
    case 1:
        if (!shared19204.unk1920B_2)
            gTasks[taskId].data[0] = 2;
        break;
    case 2:
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = sub_80ADA1C;
        break;
    }
}

void sub_80ADA1C(u8 taskId)
{
    sub_80B1FD0(FALSE);
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = 0;
    gTasks[taskId].func = sub_80ADA4C;
}

void sub_80ADA4C(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
    case 0:
        if (++gTasks[taskId].data[1] > 20)
        {
            sub_80B25E4(2);
            gTasks[taskId].data[1] = 0;
            gTasks[taskId].data[0]++;
        }
        break;
    case 1:
        if (!shared19204.unk1920B_1)
        {
            if (++gTasks[taskId].data[1] > 20)
            {
                gTasks[taskId].data[1] = 0;
                gTasks[taskId].data[0]++;
            }
        }
        break;
    case 2:
        sub_80AFF10();
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].func = sub_80ADAD8;
        break;
    }
}

void sub_80ADAD8(u8 taskId)
{
    if (sub_80AFF28())
        gTasks[taskId].func = sub_80ADB04;
}

void sub_80ADB04(u8 taskId)
{
    {
        void *src = shared18000.unk18204;
        void *dest = gPlttBufferUnfaded;
        DmaCopy32(3, src, dest, 0x400);
    }
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = 2;
    gTasks[taskId].func = sub_80ADB48;
}

void sub_80ADB48(u8 taskId)
{
    if (++gTasks[taskId].data[0] > 2)
    {
        gTasks[taskId].data[0] = 0;
        if (--gTasks[taskId].data[1] == 0)
            gTasks[taskId].func = sub_80ADB88;
    }
}

void sub_80ADB88(u8 taskId)
{
    u8 r4 = shared19260_[gContestPlayerMonIndex].unk1A;

    sub_80AF138();
    StringCopy(gStringVar1, gContestMons[gContestPlayerMonIndex].nickname);
    StringExpandPlaceholders(gStringVar4, gUnknown_083CB2F0[r4]);
    sub_8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
    gTasks[taskId].func = sub_80ADC10;
}

void sub_80ADC10(u8 taskId)
{
    if (sub_80037A0(&gMenuWindow) == 1)
    {
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = sub_80ADC4C;
        sub_80B0D7C();
    }
}

void sub_80ADC4C(u8 taskId)
{
    if (gTasks[taskId].data[0]++ > 29)
    {
        gTasks[taskId].data[0] = 0;
        sub_80AFF10();
        gTasks[taskId].func = sub_80ADC84;
    }
}

void sub_80ADC84(u8 taskId)
{
    if (sub_80AFF28())
    {
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = sub_80ADCB4;
    }
}

void sub_80ADCB4(u8 taskId)
{
    sub_80B2184();
    gTasks[taskId].func = sub_80B237C;
}

void sub_80ADCDC(u8 taskId)
{
    sub_80B2280();
    gTasks[taskId].func = sub_80ADD04;
}

void sub_80ADD04(u8 taskId)
{
    REG_BG0CNT_BITFIELD.priority = 0;
    REG_BG2CNT_BITFIELD.priority = 0;
    if (++shared19204.unk19205 == 5)
    {
        gTasks[taskId].func = sub_80ADDA4;
    }
    else
    {
        sub_80B1B14();
        gTasks[taskId].func = sub_80ADD74;
    }
}

void sub_80ADD74(u8 taskId)
{
    if (!shared19204.unk1920A_6)
        gTasks[taskId].func = sub_80ABB70;
}

void sub_80ADDA4(u8 taskId)
{
    s32 i;

    gUnknown_030042A0 = 0;
    gUnknown_03004280 = 0;
    for (i = 0; i < 4; i++)
        gUnknown_02038680[i] = shared19260_[i].unk4;
    sub_80AF668();
    sub_80AF138();
    sub_80BE23C(shared19260_[gContestPlayerMonIndex].unk8);
    gUnknown_03005D28 = gRngValue;
    StringExpandPlaceholders(gStringVar4, gUnknown_083CB02C);
    sub_8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
    gTasks[taskId].data[2] = 0;
    gTasks[taskId].func = sub_80ADE54;
}

void sub_80ADE54(u8 taskId)
{
    if (sub_80037A0(&gMenuWindow) == 1)
    {
        sub_80B2184();
        gUnknown_030042C0 = 0;
        gUnknown_030041B4 = 160;
        PlaySE12WithPanning(SE_C_MAKU_D, 0);
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = sub_80ADEAC;
    }
}

void sub_80ADEAC(u8 taskId)
{
    gUnknown_030041B4 -= 7;
    if (gUnknown_030041B4 < 0)
        gUnknown_030041B4 = 0;
    if (*(u16 *)&gUnknown_030041B4 == 0)  // Why cast?
    {
        gTasks[taskId].func = sub_80ADEEC;
        gTasks[taskId].data[0] = 0;
    }
}

void sub_80ADEEC(u8 taskId)
{
    if (gTasks[taskId].data[0]++ >= 50)
    {
        gTasks[taskId].data[0] = 0;
        if (gIsLinkContest & 1)
        {
            gTasks[taskId].func = sub_80ADF4C;
        }
        else
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
            gTasks[taskId].func = sub_80ADFD8;
        }
    }
}

void sub_80ADF4C(u8 taskId)
{
    u8 taskId2 = CreateTask(sub_80C8AD0, 0);

    SetTaskFuncWithFollowupFunc(taskId2, sub_80C8AD0, sub_80ADF98);
    gTasks[taskId].func = nullsub_89;
    sub_80AF860();
    sub_80AFFE0(FALSE);
}

void sub_80ADF98(u8 taskId)
{
    DestroyTask(taskId);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
    gTasks[shared19204.unk1920C].func = sub_80ADFD8;
}

void sub_80ADFD8(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        DestroyTask(taskId);
        gFieldCallback = sub_80AE010;
        SetMainCallback2(c2_exit_to_overworld_2_switch);
    }
}

void sub_80AE010(void)
{
    // Why disable and re-enable again?
    ScriptContext2_Disable();
    EnableBothScriptContexts();
}

void sub_80AE020(u8 *a, s32 b)
{
    while (1)
    {
        if (*a == EOS)
            break;
        if (*a == EXT_CTRL_CODE_BEGIN && *(a + 1) == 0)
        {
            u8 *end;

            end = ConvertIntToDecimalStringN(a, b, 0, 1);
            *end = EOS;  // ConvertIntToDecimalStringN already does this.
            StringAppend(end, a + 2);
            break;
        }
        a++;
    }
}

void sub_80AE054(void)
{
    if (!(gIsLinkContest & 1))
        gContestPlayerMonIndex = 3;
}

bool8 sub_80AE074(void)
{
    if (gContestPlayerMonIndex == gUnknown_0203869B)
        return TRUE;
    else
        return FALSE;
}

// CreatePlayerContestMon
void sub_80AE098(u8 index)
{
    u8 name[20];
    u16 heldItem;
    s16 cool;
    s16 beauty;
    s16 cute;
    s16 smart;
    s16 tough;

    StringCopy(name, gSaveBlock2.playerName);
    StripExtCtrlCodes(name);
    if (gIsLinkContest & 1)
    {
        u8 temp = name[5];

        name[5] = EOS;
        name[7] = temp;
    }
    memcpy(gContestMons[gContestPlayerMonIndex].trainerName, name, 8);
    if (gSaveBlock2.playerGender == MALE)
        gContestMons[gContestPlayerMonIndex].trainerGfxId = MAP_OBJ_GFX_LINK_BRENDAN;
    else
        gContestMons[gContestPlayerMonIndex].trainerGfxId = MAP_OBJ_GFX_LINK_MAY;
    gContestMons[gContestPlayerMonIndex].flags = 0;
    gContestMons[gContestPlayerMonIndex].unk2C = 0;
    gContestMons[gContestPlayerMonIndex].species = GetMonData(&gPlayerParty[index], MON_DATA_SPECIES);
    GetMonData(&gPlayerParty[index], MON_DATA_NICKNAME, name);
    StringGetEnd10(name);
    if (gIsLinkContest & 1)
    {
        StripExtCtrlCodes(name);
        if (GetMonData(&gPlayerParty[index], MON_DATA_LANGUAGE) == LANGUAGE_JAPANESE)
        {
            name[5] = EOS;
            name[10] = EXT_CTRL_CODE_BEGIN;
        }
        else
        {
            u8 temp = name[5];

            name[5] = EOS;
            name[10] = temp;
        }
    }
    memcpy(gContestMons[gContestPlayerMonIndex].nickname, name, 11);
    gContestMons[gContestPlayerMonIndex].cool = GetMonData(&gPlayerParty[index], MON_DATA_COOL);
    gContestMons[gContestPlayerMonIndex].beauty = GetMonData(&gPlayerParty[index], MON_DATA_BEAUTY);
    gContestMons[gContestPlayerMonIndex].cute = GetMonData(&gPlayerParty[index], MON_DATA_CUTE);
    gContestMons[gContestPlayerMonIndex].smart = GetMonData(&gPlayerParty[index], MON_DATA_SMART);
    gContestMons[gContestPlayerMonIndex].tough = GetMonData(&gPlayerParty[index], MON_DATA_TOUGH);
    gContestMons[gContestPlayerMonIndex].sheen = GetMonData(&gPlayerParty[index], MON_DATA_SHEEN);
    gContestMons[gContestPlayerMonIndex].moves[0] = GetMonData(&gPlayerParty[index], MON_DATA_MOVE1);
    gContestMons[gContestPlayerMonIndex].moves[1] = GetMonData(&gPlayerParty[index], MON_DATA_MOVE2);
    gContestMons[gContestPlayerMonIndex].moves[2] = GetMonData(&gPlayerParty[index], MON_DATA_MOVE3);
    gContestMons[gContestPlayerMonIndex].moves[3] = GetMonData(&gPlayerParty[index], MON_DATA_MOVE4);
    gContestMons[gContestPlayerMonIndex].personality = GetMonData(&gPlayerParty[index], MON_DATA_PERSONALITY);
    gContestMons[gContestPlayerMonIndex].otId = GetMonData(&gPlayerParty[index], MON_DATA_OT_ID);

    heldItem = GetMonData(&gPlayerParty[index], MON_DATA_HELD_ITEM);
    cool   = gContestMons[gContestPlayerMonIndex].cool;
    beauty = gContestMons[gContestPlayerMonIndex].beauty;
    cute   = gContestMons[gContestPlayerMonIndex].cute;
    smart  = gContestMons[gContestPlayerMonIndex].smart;
    tough  = gContestMons[gContestPlayerMonIndex].tough;
    if      (heldItem == ITEM_RED_SCARF)
        cool += 20;
    else if (heldItem == ITEM_BLUE_SCARF)
        beauty += 20;
    else if (heldItem == ITEM_PINK_SCARF)
        cute += 20;
    else if (heldItem == ITEM_GREEN_SCARF)
        smart += 20;
    else if (heldItem == ITEM_YELLOW_SCARF)
        tough += 20;
    if (cool > 255)
        cool = 255;
    if (beauty > 255)
        beauty = 255;
    if (cute > 255)
        cute = 255;
    if (smart > 255)
        smart = 255;
    if (tough > 255)
        tough = 255;
    gContestMons[gContestPlayerMonIndex].cool = cool;
    gContestMons[gContestPlayerMonIndex].beauty = beauty;
    gContestMons[gContestPlayerMonIndex].cute = cute;
    gContestMons[gContestPlayerMonIndex].smart = smart;
    gContestMons[gContestPlayerMonIndex].tough = tough;
}

void sub_80AE398(u8 a, u8 b)
{
    s32 i;
    u8 opponentsCount = 0;
    u8 opponents[64];

    sub_80AE054();

    // Find all suitable opponents
    for (i = 0; i < 60; i++)
    {
        if (b == gContestOpponents[i].unk1C_0)
        {
            if      (a == 0 && gContestOpponents[i].unk1C_2)
                opponents[opponentsCount++] = i;
            else if (a == 1 && gContestOpponents[i].unk1C_3)
                opponents[opponentsCount++] = i;
            else if (a == 2 && gContestOpponents[i].unk1C_4)
                opponents[opponentsCount++] = i;
            else if (a == 3 && gContestOpponents[i].unk1C_5)
                opponents[opponentsCount++] = i;
            else if (a == 4 && gContestOpponents[i].unk1C_6)
                opponents[opponentsCount++] = i;
        }
    }
    opponents[opponentsCount] = 0xFF;

    // Choose three random opponents from the list
    for (i = 0; i < 3; i++)
    {
        u16 rnd = Random() % opponentsCount;
        s32 j;

        gContestMons[i] = gContestOpponents[opponents[rnd]];
        for (j = rnd; opponents[j] != 0xFF; j++)
            opponents[j] = opponents[j + 1];
        opponentsCount--;
    }

#ifndef NONMATCHING
    // Compiler, please put i in r5. Thanks.
    asm(""::"r"(i));
    asm(""::"r"(i));
    asm(""::"r"(i));
    asm(""::"r"(i));
    asm(""::"r"(i));
#endif

    sub_80AE098(gUnknown_02038694);
}

// GetContestAvailability?
u8 sub_80AE47C(struct Pokemon *pkmn)
{
    u8 ribbon;
    u8 retVal;

    if (GetMonData(pkmn, MON_DATA_IS_EGG))
        return 3;
    if (GetMonData(pkmn, MON_DATA_HP) == 0)
        return 4;
    switch (gScriptContestCategory)
    {
    case 0:
        ribbon = GetMonData(pkmn, MON_DATA_COOL_RIBBON);
        break;
    case 1:
        ribbon = GetMonData(pkmn, MON_DATA_BEAUTY_RIBBON);
        break;
    case 2:
        ribbon = GetMonData(pkmn, MON_DATA_CUTE_RIBBON);
        break;
    case 3:
        ribbon = GetMonData(pkmn, MON_DATA_SMART_RIBBON);
        break;
    case 4:
        ribbon = GetMonData(pkmn, MON_DATA_TOUGH_RIBBON);
        break;
    default:
        return 0;
    }

    // Couldn't get this to match any other way.
    // Returns 2, 1, or 0 respectively if ribbon's rank is above, equal, or below
    // the current contest rank.
    if (ribbon > gScriptContestRank)
        retVal = 2;
    else if (ribbon >= gScriptContestRank)
        retVal = 1;
    else
        retVal = 0;
    return retVal;
}

void sub_80AE514(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        FillWindowRect_DefaultPalette(
          &gUnknown_03004210,
          0,
          gUnknown_083CA308[gUnknown_02038696[i]][0],
          gUnknown_083CA308[gUnknown_02038696[i]][1],
          gUnknown_083CA310[gUnknown_02038696[i]][0] + 5,
          gUnknown_083CA310[gUnknown_02038696[i]][1] + 1);
        sub_80AE5BC(i);
        sub_80AE6CC(i);
    }
}

u8 *sub_80AE598(u8 *dest, const u8 *b, u8 c)
{
    dest = StringCopy(dest, gUnknown_083CC59C);
    *dest++ = c;
    dest = StringCopy(dest, b);
    return dest;
}

void sub_80AE5BC(u8 a)
{
    sub_80AE5D4(a, a + 10);
}

void sub_80AE5D4(u8 a, u8 b)
{
    u8 *str = gDisplayedStringBattle;

    str = sub_80AE598(str, gEmptyString_81E72B0, b);
    str[0] = EXT_CTRL_CODE_BEGIN;
    str[1] = 6;
    str[2] = 4;
    str += 3;
    *str++ = CHAR_SLASH;

    if ((gIsLinkContest & 1) && gLinkPlayers[a].language == LANGUAGE_JAPANESE)
    {
        StringCopy(str, gLinkPlayers[a].name);
        sub_8004D04(
          &gUnknown_03004210,
          gDisplayedStringBattle,
          592 + gUnknown_02038696[a] * 22,
          251 + gUnknown_083CA310[gUnknown_02038696[a]][0] * 8,
          gUnknown_083CA310[gUnknown_02038696[a]][1] * 8,
          1);
    }
    else
    {
        StringCopy(str, gContestMons[a].trainerName);
        sub_8003460(
          &gUnknown_03004210,
          gDisplayedStringBattle,
          592 + gUnknown_02038696[a] * 22,
          gUnknown_083CA310[gUnknown_02038696[a]][0],
          gUnknown_083CA310[gUnknown_02038696[a]][1]);
    }
}

void sub_80AE6CC(u8 a)
{
    sub_80AE6E4(a, a + 10);
}

void sub_80AE6E4(u8 a, u8 b)
{
    u8 *str = gDisplayedStringBattle;

    str[0] = EXT_CTRL_CODE_BEGIN;
    str[1] = 6;
    str[2] = 4;
    str += 3;

    str = sub_80AE598(str, gContestMons[a].nickname, b);
    *str = EOS;

    sub_8004D04(
      &gUnknown_03004210,
      gDisplayedStringBattle,
      512 + gUnknown_02038696[a] * 20,
      253 + gUnknown_083CA308[gUnknown_02038696[a]][0] * 8,
      gUnknown_083CA308[gUnknown_02038696[a]][1] * 8,
      1);
}

u16 sub_80AE770(u8 a, u8 b)
{
    u8 r5;
    u8 r4;
    u8 r3;

    switch (b)
    {
    case 0:
        r5 = gContestMons[a].cool;
        r4 = gContestMons[a].tough;
        r3 = gContestMons[a].beauty;
        break;
    case 1:
        r5 = gContestMons[a].beauty;
        r4 = gContestMons[a].cool;
        r3 = gContestMons[a].cute;
        break;
    case 2:
        r5 = gContestMons[a].cute;
        r4 = gContestMons[a].beauty;
        r3 = gContestMons[a].smart;
        break;
    case 3:
        r5 = gContestMons[a].smart;
        r4 = gContestMons[a].cute;
        r3 = gContestMons[a].tough;
        break;
    case 4:
    default:
        r5 = gContestMons[a].tough;
        r4 = gContestMons[a].smart;
        r3 = gContestMons[a].cool;
        break;
    }
    return r5 + (r4 + r3 + gContestMons[a].sheen) / 2;
}

void sub_80AE82C(u8 a)
{
    u8 i;

    for (i = 0; i < 4; i++)
        gUnknown_02038670[i] = sub_80AE770(i, a);
}

u8 sub_80AE858(void)
{
    u8 spriteId;

    LoadCompressedObjectPic(&gUnknown_083CA4BC);
    LoadCompressedPalette(gContest2Pal, 0x110, 32);
    spriteId = CreateSprite(&gSpriteTemplate_83CA4A4, 112, 36, 30);
    gSprites[spriteId].oam.paletteNum = 1;
    gSprites[spriteId].callback = SpriteCallbackDummy;
    return spriteId;
}

u8 sub_80AE8B4(void)
{
    u8 spriteId;

    LoadCompressedObjectPic(&gUnknown_083CA4C4);
    LoadCompressedObjectPalette(&gUnknown_083CA4CC);
    spriteId = CreateSprite(&gUnknown_083CA4D4, 96, 10, 29);
    gSprites[spriteId].invisible = TRUE;
    gSprites[spriteId].data[0] = gSprites[spriteId].oam.tileNum;
    return spriteId;
}

u8 unref_sub_80AE908(void)
{
    u16 species = gContestMons[gContestPlayerMonIndex].species;
    u8 spriteId;

    DecompressPicFromTable_2(
      &gMonFrontPicTable[species],
      gMonFrontPicCoords[species].coords,
      gMonFrontPicCoords[species].y_offset,
      (void *)0x02000000,
      gUnknown_081FAF4C[1],
      species);
    LoadCompressedPalette(gMonPaletteTable[species].data, 0x110, 32);
    GetMonSpriteTemplate_803C56C(gContestMons[gContestPlayerMonIndex].species, 1);
    spriteId = CreateSprite(
      &gUnknown_02024E8C,
      112, 80 + (8 - gMonFrontPicCoords[gContestMons[gContestPlayerMonIndex].species].coords) * 4,
      30);
    gSprites[spriteId].oam.paletteNum = 1;
    gSprites[spriteId].callback = SpriteCallbackDummy;
    gSprites[spriteId].affineAnims = gSpriteAffineAnimTable_81E7C18;
    StartSpriteAffineAnim(&gSprites[spriteId], 0);
    return spriteId;
}

u8 sub_80AE9FC(u16 species, u32 otId, u32 personality)
{
    const u8 *lzPaletteData;
    u8 spriteId;

    species = sub_80B2778(species);
    HandleLoadSpecialPokePic(
      &gMonBackPicTable[species],
      gMonBackPicCoords[species].coords,
      gMonBackPicCoords[species].y_offset,
      0x02000000,
      gUnknown_081FAF4C[0],
      species,
      personality);
    lzPaletteData = GetMonSpritePalFromOtIdPersonality(species, otId, personality);
    LoadCompressedPalette(lzPaletteData, 0x120, 32);
    GetMonSpriteTemplate_803C56C(species, 0);
    spriteId = CreateSprite(&gUnknown_02024E8C, 112, sub_8077E44(2, species, 0), 30);
    gSprites[spriteId].oam.paletteNum = 2;
    gSprites[spriteId].oam.priority = 2;
    gSprites[spriteId].subpriority = sub_8079E90(2);
    gSprites[spriteId].callback = SpriteCallbackDummy;
    gSprites[spriteId].data[0] = gSprites[spriteId].oam.paletteNum;
    gSprites[spriteId].data[2] = species;
    if (sub_80AEB1C(species))
        gSprites[spriteId].affineAnims = gSpriteAffineAnimTable_81E7C18;
    else
        gSprites[spriteId].affineAnims = gSpriteAffineAnimTable_81E7BEC;
    StartSpriteAffineAnim(&gSprites[spriteId], 0);
    return spriteId;
}

bool8 sub_80AEB1C(u16 species)
{
    if (species == SPECIES_UNOWN)
        return FALSE;
    else
        return TRUE;
}

void sub_80AEB30(void)
{
    sub_80AEB4C((void *)(VRAM + 0xC000));
    sub_80AEB4C((void *)(VRAM + 0xE000));
}

void sub_80AEB4C(void *a)
{
    void *src = a;
    void *dest = (u8 *)a + 0x500;
    DmaCopy16(3, src, dest, 0x280);
}

u16 sub_80AEB68(u16 a, u8 b)
{
    u16 var;

    switch (gContestEffects[gContestMoves[a].effect].effectType)
    {
    case 0:
    case 1:
    case 8:
        var = 0x9082;
        break;
    case 2:
    case 3:
        var = 0x9088;
        break;
    default:
        var = 0x9086;
        break;
    }
    var += 0x9000 + (b << 12);
    return var;
}

void sub_80AEBEC(u16 a)
{
    u8 category;
    u16 categoryTile;
    s32 i;
    u8 numHearts;

    FillWindowRect_DefaultPalette(&gUnknown_03004210, 0, 11, 31, 16, 34);

    category = gContestMoves[a].contestCategory;
    if      (category == CONTEST_CATEGORY_COOL)
        categoryTile = 0x4040;
    else if (category == CONTEST_CATEGORY_BEAUTY)
        categoryTile = 0x4045;
    else if (category == CONTEST_CATEGORY_CUTE)
        categoryTile = 0x404A;
    else if (category == CONTEST_CATEGORY_SMART)
        categoryTile = 0x406A;
    else
        categoryTile = 0x408A;

    for (i = 0; i < 5; i++)
    {
        *(u16 *)(VRAM + 0xC7D6 + i * 2) = categoryTile;
        *(u16 *)(VRAM + 0xC816 + i * 2) = categoryTile + 16;
        categoryTile++;
    }

    if (gContestEffects[gContestMoves[a].effect].appeal == 0xFF)
        numHearts = 0;
    else
        numHearts = gContestEffects[gContestMoves[a].effect].appeal / 10;
    if (numHearts > 8)
        numHearts = 8;
    for (i = 0; i < 8; i++)
    {
        if (i < numHearts)
            *(u16 *)(VRAM + 0xC7EA + i * 2) = 0x5012;
        else
            *(u16 *)(VRAM + 0xC7EA + i * 2) = 0x5035;
    }

    if (gContestEffects[gContestMoves[a].effect].jam == 0xFF)
        numHearts = 0;
    else
        numHearts = gContestEffects[gContestMoves[a].effect].jam / 10;
    if (numHearts > 8)
        numHearts = 8;
    for (i = 0; i < 8; i++)
    {
        if (i < numHearts)
            *(u16 *)(VRAM + 0xC82A + i * 2) = 0x5014;
        else
            *(u16 *)(VRAM + 0xC82A + i * 2) = 0x5036;
    }

    sub_8003460(&gUnknown_03004210, gContestEffectStrings[gContestMoves[a].effect], 868, 11, 35);
    sub_8003460(&gUnknown_03004210, gUnknown_083CC5A2, 866, 16, 31);
}

void sub_80AED58(void)
{
    FillWindowRect_DefaultPalette(&gUnknown_03004210, 0, 11, 35, 28, 40);
}

// unused
void sub_80AED7C(u16 a, u8 b)
{
    u8 r5 = gUnknown_02038696[b] * 5 + 2;

    if (!sub_80AF59C(b) && a != 0)
    {
        u16 tile = sub_80AEB68(a, b);

        *(u16 *)(VRAM + 0xC028 + r5 * 64) = tile;
        *(u16 *)(VRAM + 0xC028 + r5 * 64 + 2) = tile + 1;

        *(u16 *)(VRAM + 0xC068 + r5 * 64) = tile + 16;
        *(u16 *)(VRAM + 0xC068 + r5 * 64 + 2) = tile + 17;

    }
    else
    {
        *(u16 *)(VRAM + 0xC028 + r5 * 64) = 0;
        *(u16 *)(VRAM + 0xC028 + r5 * 64 + 2) = 0;

        *(u16 *)(VRAM + 0xC068 + r5 * 64) = 0;
        *(u16 *)(VRAM + 0xC068 + r5 * 64 + 2) = 0;
    }
}

void unref_sub_80AEE20(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
        sub_80AED7C(shared19260_[i].unk6, i);
}

u16 sub_80AEE4C(u8 unused)
{
    return 0x2034;
}

bool8 sub_80AEE54(u8 a, u8 b)
{
    u8 r9;
    u16 r8;
    s32 r4;

    if (shared19260_[a].unk10_4 == 0)
        return FALSE;
    r9 = gUnknown_02038696[a] * 5 + 2;
    if (shared19260_[a].unk10_4 == 1)
    {
        r8 = sub_80AEE4C(a);
        r4 = 0;
        while (shared19260_[a].unkD / 10 > r4)
        {
            *(u16 *)(VRAM + 0xC026 + (r9 + r4) * 64) = r8;
            r4++;
        }
        if (b != 0)
        {
            PlaySE(SE_EXPMAX);
            shared19260_[a].unk10_4 = 0;
        }
    }
    else
    {
        r8 = 0;
        r4 = 3;
        while (shared19260_[a].unkD / 10 < r4)
        {
            *(u16 *)(VRAM + 0xBFE6 + (r9 + r4) * 64) = r8;
            r4--;
        }
        if (b != 0)
        {
            PlaySE(SE_FU_ZAKU2);
            shared19260_[a].unk10_4 = 0;
        }
    }
    return TRUE;
}

void sub_80AEF50(void)
{
    s32 i;
    s32 r4;

    for (i = 0; i < 4; i++)
    {
        u8 r8 = gUnknown_02038696[i] * 5 + 2;
        u16 r6 = sub_80AEE4C(i);

        r4 = 0;
        while (r4 < shared19260_[i].unkD / 10)
        {
            *(u16 *)(VRAM + 0xC026 + (r8 + r4) * 64) = r6;
            r4++;
        }
        r6 = 0;
        while (r4 < 3)
        {
            *(u16 *)(VRAM + 0xC026 + (r8 + r4) * 64) = r6;
            r4++;
        }
    }
}

u16 sub_80AEFE8(u8 unused, u8 b)
{
    u16 var = 0;

    switch (b)
    {
    case 0:
        var = 0x80;
        break;
    case 1:
        var = 0x84;
        break;
    case 2:
        var = 0x86;
        break;
    case 3:
        var = 0x88;
        break;
    case 4:
        var = 0x82;
        break;
    }
    var += 0x9000;
    return var;
}

bool8 sub_80AF038(u8 a)
{
    bool8 r5 = TRUE;
    u16 r4 = 0;
    u8 r6 = gUnknown_02038696[a] * 5 + 2;

    if (shared19260_[a].unk10_0 != 0 || shared19260_[a].unk10_1 != 0 || shared19260_[a].unk12 != 0 || shared19260_[a].unkF != 0)
        r4 = sub_80AEFE8(a, 0);
    else if (shared19260_[a].unkC_0)
        r4 = sub_80AEFE8(a, 1);
    else if (shared19260_[a].unkC_1 != 0 || shared19260_[a].unkB_7)
        r4 = sub_80AEFE8(a, 2);
    else
        r5 = FALSE;
    if (r5)
    {
        *(u16 *)(VRAM + 0xC028 + r6 * 64) = r4;
        *(u16 *)(VRAM + 0xC028 + r6 * 64 + 2) = r4 + 1;
        *(u16 *)(VRAM + 0xC068 + r6 * 64) = r4 + 16;
        *(u16 *)(VRAM + 0xC068 + r6 * 64 + 2) = r4 + 17;
    }
    else
    {
        *(u16 *)(VRAM + 0xC028 + r6 * 64) = 0;
        *(u16 *)(VRAM + 0xC028 + r6 * 64 + 2) = 0;
        *(u16 *)(VRAM + 0xC068 + r6 * 64) = 0;
        *(u16 *)(VRAM + 0xC068 + r6 * 64 + 2) = 0;
    }
    return r5;
}

void sub_80AF120(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
        sub_80AF038(i);
}

void sub_80AF138(void)
{
    FillWindowRect_DefaultPalette(&gUnknown_03004210, 0, 1, 15, 17, 18);
}

u16 sub_80AF15C(u8 a)
{
    if (sub_80AF59C(a))
        return 0;
    if (a == gContestPlayerMonIndex)
    {
        return gContestMons[a].moves[shared19204.unk19204];
    }
    else
    {
        u8 moveChoice;

        sub_81288F4(a);
        moveChoice = sub_8128944();
        return gContestMons[a].moves[moveChoice];
    }
}

void sub_80AF1B8(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
        shared19260_[i].unk6 = sub_80AF15C(i);
}

void sub_80AF1E4(u8 a, u8 b)
{
    u8 r3;

    if (b == 0)
        r3 = a + 10;
    else
        r3 = 14;
    if (shared19260_[a].unk6 == 0)
        sub_80AE598(gDisplayedStringBattle, gUnknownText_MissedTurn, r3);
    else
        sub_80AE598(gDisplayedStringBattle, gMoveNames[shared19260_[a].unk6], r3);
    sub_80AF2A0(a);
    sub_8003460(
      &gUnknown_03004210,
      gDisplayedStringBattle,
      696 + a * 20,
      gUnknown_083CA318[a][0],
      gUnknown_083CA318[a][1]);
}

void unref_sub_80AF280(u8 a)
{
    u8 i;

    for (i = 0; i < 4; i++)
        sub_80AF1E4(i, a);
}

void sub_80AF2A0(u8 a)
{
    FillWindowRect_DefaultPalette(
      &gUnknown_03004210,
      0,
      gUnknown_083CA318[a][0],
      gUnknown_083CA318[a][1],
      gUnknown_083CA318[a][0] + 7,
      gUnknown_083CA318[a][1] + 1);
}

void unref_sub_80AF2E0(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
        sub_80AF2A0(i);
}

void sub_80AF2FC(void)
{
    u8 i;
    u8 j;
    s16 arr[4];

    for (i = 0; i < 4; i++)
    {
        shared19260_[i].unk4 += shared19260_[i].unk2;
        arr[i] = shared19260_[i].unk4;
    }
    for (i = 0; i < 3; i++)
    {
        for (j = 3; j > i; j--)
        {
            if (arr[j - 1] < arr[j])
            {
                u16 temp = arr[j];

                arr[j] = arr[j - 1];
                arr[j - 1] = temp;
            }
        }
    }
    for (i = 0; i < 4; i++)
    {
        for (j = 0; j < 4; j++)
        {
            if (shared19260_[i].unk4 == arr[j])
            {
                shared19260_[i].unkB_0 = j;
                break;
            }
        }
    }
    sub_80B0F28(1);
    sub_80B159C();
}

void sub_80AF3C0(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        u8 var;

        if (shared19260_[i].unk6 == 0)
            var = 5;
        else if (shared19260_[i].unk2 <= 0)
            var = 0;
        else if (shared19260_[i].unk2 < 30)
            var = 1;
        else if (shared19260_[i].unk2 < 60)
            var = 2;
        else if (shared19260_[i].unk2 < 80)
            var = 3;
        else
            var = 4;

        shared19260_[i].unk1A = var;
    }
}

bool8 sub_80AF404(u8 a)
{
    if (shared19260_[a].unkC_1 != 0 || shared19260_[a].unkB_7)
        return FALSE;
    else
        return TRUE;
}

void sub_80AF438(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        // This is bitfield hell...
        shared19260_[i].unk2 = 0;
        shared19260_[i].unk0 = 0;
        shared19260_[i].unk12 = 0;
        if (shared19260_[i].unkC_1 > 0)
            shared19260_[i].unkC_1--;
        shared19260_[i].unkE = 0;
        shared19260_[i].unk10_0 = 0;
        shared19260_[i].unkF = 0;
        shared19260_[i].unk10_1 = 0;
        shared19260_[i].unk10_2 = 0;
        shared19260_[i].unk10_3 = 0;
        shared19260_[i].unkC_0 = 0;
        shared19260_[i].unk13 = 0xFF;
        shared19260_[i].unk14 = -1;
        shared19260_[i].unk10_4 = 0;
        shared19260_[i].unk15_2 = shared19260_[i].unk15_0;
        shared19260_[i].unk15_0 = 0;
        shared19260_[i].unk11_0 = 0;
        shared19260_[i].unk11_5 = 0;
        if (shared19260_[i].unk11_2)
        {
            shared19260_[i].unkC_1 = 1;
            shared19260_[i].unk11_2 = 0;
        }
        if (shared19260_[i].unk11_3)
        {
            shared19260_[i].unkB_7 = 1;
            shared19260_[i].unk11_3 = 0;
        }
        shared19260_[i].unk11_4 = 0;
    }
    for (i = 0; i < 4; i++)
    {
        shared19260_[i].unk8 = shared19260_[i].unk6;
        shared19204.unk19220[shared19204.unk19205][i] = shared19260_[i].unk8;
        shared19204.unk19248[shared19204.unk19205][i] = contest_get_move_excitement(shared19260_[i].unk6);
        shared19260_[i].unk6 = 0;
    }
    shared19328.bits_8 = 0;
}

bool8 sub_80AF59C(u8 a)
{
    if (shared19260_[a].unkC_1 != 0 || shared19260_[a].unkB_7)
        return TRUE;
    else
        return FALSE;
}

bool8 unref_sub_80AF5D0(u8 a, u8 b)
{
    u8 i;

    if (a != gContestPlayerMonIndex)
        return TRUE;
    for (i = 0; i < 4; i++)
    {
        if (b == 3)
        {
            shared19204.unk1920A_0 = 1;
            return TRUE;
        }
        if (b == 4)
        {
            shared19204.unk1920A_1 = 1;
            return TRUE;
        }
        if (shared19204.unk19206[i] == b)
            return TRUE;
        if (shared19204.unk19206[i] == 0xFF)
        {
            shared19204.unk19206[i] = b;
            return TRUE;
        }
    }
    return FALSE;
}

void sub_80AF630(u8 a)
{
    gUnknown_02038688[a] = sub_80AF688(a);
    gUnknown_02038678[a] = gUnknown_02038670[a] + gUnknown_02038688[a];
}

void sub_80AF668(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
        sub_80AF630(i);
    sub_80AF6A0();
}

s16 sub_80AF688(u8 a)
{
    return gUnknown_02038680[a] * 2;
}

// Sorts something. Determines turn order, maybe?
void sub_80AF6A0(void)
{
    u16 sp0[4] = {0};
    struct UnknownContestStruct6 sp8[4];
    s32 i;
    s32 j;

    for (i = 0; i < 4; i++)
    {
        s32 r2;

        sp0[i] = Random();
        for (r2 = 0; r2 < i; r2++)
        {
            if (sp0[i] == sp0[r2])
            {
                i--;
                break;
            }
        }
    }

    for (i = 0; i < 4; i++)
    {
        sp8[i].unk0 = gUnknown_02038678[i];
        sp8[i].unk4 = gUnknown_02038670[i];
        sp8[i].unk8 = sp0[i];
        sp8[i].unkC = i;
    }

    for (i = 0; i < 3; i++)
    {
        for (j = 3; j > i; j--)
        {
            if (sub_80AF828(j - 1, j, sp8))
            {
                struct UnknownContestStruct6 temp;

                temp.unk0 = sp8[j - 1].unk0;
                temp.unk4 = sp8[j - 1].unk4;
                temp.unk8 = sp8[j - 1].unk8;
                temp.unkC = sp8[j - 1].unkC;

                sp8[j - 1].unk0 = sp8[j].unk0;
                sp8[j - 1].unk4 = sp8[j].unk4;
                sp8[j - 1].unk8 = sp8[j].unk8;
                sp8[j - 1].unkC = sp8[j].unkC;

                sp8[j].unk0 = temp.unk0;
                sp8[j].unk4 = temp.unk4;
                sp8[j].unk8 = temp.unk8;
                sp8[j].unkC = temp.unkC;
            }
        }
    }

    for (i = 0; i < 4; i++)
        gUnknown_02038690[sp8[i].unkC] = i;
}

bool8 sub_80AF828(s32 a, s32 b, struct UnknownContestStruct6 *c)
{
    bool8 retVal;

    if      (c[a].unk0 < c[b].unk0)
        retVal = TRUE;
    else if (c[a].unk0 > c[b].unk0)
        retVal = FALSE;
    else if (c[a].unk4 < c[b].unk4)
        retVal = TRUE;
    else if (c[a].unk4 > c[b].unk4)
        retVal = FALSE;
    else if (c[a].unk8 < c[b].unk8)
        retVal = TRUE;
    else
        retVal = FALSE;
    return retVal;
}

void sub_80AF860(void)
{
    gUnknown_030042A0 = 0;
    gUnknown_03004280 = 0;
    sub_80AF138();
    sub_8003460(&gMenuWindow, gUnknownText_LinkStandbyAndWinner, 776, 1, 15);
}

u8 unref_sub_80AF89C(s16 a, s16 b, u8 c, u8 d)
{
    u8 taskId;
    u8 r5;
    s8 r4;
    u16 r0;

    shared19338[d].unk2_2 = 1;
    taskId = CreateTask(sub_80AF94C, 20);
    r5 = sub_80AFB74(a);
    r4 = sub_80AFB74(a + b) - r5;
    r0 = sub_80AFB40(d);
    gTasks[taskId].data[0] = r5;
    gTasks[taskId].data[1] = r4;
    gTasks[taskId].data[2] = r0 + c;
    gTasks[taskId].data[3] = d;
    if (b < 0)
        nullsub_19(d);
    return taskId;
}

void sub_80AF94C(u8 taskId)
{
    u8 r5 = gTasks[taskId].data[3];

    if (gTasks[taskId].data[1] == 0)
    {
        nullsub_19(r5);
        DestroyTask(taskId);
        shared19338[r5].unk2_2 = 0;
    }
    else if (++gTasks[taskId].data[10] > 29)
    {
        u8 r6;

        gTasks[taskId].data[10] = 0;
        if (gTasks[taskId].data[1] < 0)
        {
            r6 = gTasks[taskId].data[0]--;
            gTasks[taskId].data[1]++;
            PlaySE(SE_BOO);
        }
        else
        {
            r6 = ++gTasks[taskId].data[0];
            gTasks[taskId].data[1]--;
            PlaySE(SE_PIN);
        }
        if ((u16)gTasks[taskId].data[2] != 0xFFFF)
        {
            RequestSpriteCopy(
              &gTasks[taskId].data[2],
              (void *)(VRAM + 0xC000 + (147 + r6 + r5 * 160) * 2),
              2);
        }
        else
        {
            u8 i;

            for (i = 0; i < 3; i++)
            {
                if (gTasks[taskId].data[i + 4] < 0)
                {
                    RequestSpriteCopy(
                      &gTasks[taskId].data[i + 7],
                      (void *)(VRAM + 0xC000 + (147 + r6 + r5 * 160) * 2),
                      2);
                    gTasks[taskId].data[i + 4]++;
                    break;
                }
            }
        }
    }
}

void sub_80AFA5C(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        DmaClear16(3, (void *)(VRAM + 0xC000 + (86 + i * 160) * 2), 16);
        DmaClear16(3, (void *)(VRAM + 0xC000 + (118 + i * 160) * 2), 16);
    }
}

void unref_sub_80AFAB8(s16 a, u8 b)
{
    u8 r5 = sub_80AFB74(a);
    u16 r2;
    u8 i;
    u16 arr[9];

    if (b == 0)
        r2 = 0x50A2;
    else if (b == 1)
        r2 = 0x60A2;
    else if (b == 2)
        r2 = 0x70A2;
    else
        r2 = 0x80A2;

    for (i = 0; i < 9; i++)
    {
        if (i < r5)
            arr[i] = r2;
        else
            arr[i] = 0;
    }

    {
        void *src = arr;
        void *dest = (void *)(VRAM + 0xC000 + (148 + b * 160) * 2);
        DmaCopy16(3, src, dest, sizeof(arr));
    }
}

u16 sub_80AFB40(u8 a)
{
    u16 var;

    if (a == 0)
        var = 0x5011;
    else if (a == 1)
        var = 0x6011;
    else if (a == 2)
        var = 0x7011;
    else
        var = 0x8011;
    return var + 1;
}

s8 sub_80AFB74(s16 a)
{
    s8 retVal = a / 10;

    if (retVal > 16)
        retVal = 16;
    else if (retVal < -16)
        retVal = -16;
    return retVal;
}

u8 sub_80AFBA0(s16 a, s16 b, u8 c)
{
    u8 taskId;
    s8 r4;
    s8 r5;

    shared19338[c].unk2_2 = 1;
    taskId = CreateTask(sub_80AFC74, 20);
    r4 = sub_80AFB74(a);
    r5 = sub_80AFB74(a + b) - r4;
    sub_80AFB40(c);  // unused return value
    gTasks[taskId].data[0] = abs(r4);
    gTasks[taskId].data[1] = r5;
    if (r4 > 0 || (r4 == 0 && r5 > 0))
        gTasks[taskId].data[2] = 1;
    else
        gTasks[taskId].data[2] = -1;
    gTasks[taskId].data[3] = c;
    if (b < 0)
        nullsub_19(c);
    return taskId;
}

void sub_80AFC74(u8 taskId)
{
    u8 r7 = gTasks[taskId].data[3];
    s16 r3 = gTasks[taskId].data[0];
    s16 r1 = gTasks[taskId].data[1];

    if (++gTasks[taskId].data[10] > 14)
    {
        u16 r6;
        u8 r5;
        u8 r10;

        gTasks[taskId].data[10] = 0;
        if (gTasks[taskId].data[1] == 0)
        {
            nullsub_19(r7);
            DestroyTask(taskId);
            shared19338[r7].unk2_2 = 0;
            return;
        }
        else if (r3 == 0)
        {
            if (r1 < 0)
            {
                r6 = sub_80AFB40(r7) + 2;
                gTasks[taskId].data[1]++;
            }
            else
            {
                r6 = sub_80AFB40(r7);
                gTasks[taskId].data[1]--;
            }
            r5 = gTasks[taskId].data[0]++;
        }
        else
        {
            if (gTasks[taskId].data[2] < 0)
            {
                if (r1 < 0)
                {
                    r5 = gTasks[taskId].data[0]++;
                    gTasks[taskId].data[1]++;
                    r6 = sub_80AFB40(r7) + 2;
                }
                else
                {
                    r5 = --gTasks[taskId].data[0];
                    r6 = 0;
                    gTasks[taskId].data[1]--;
                }
            }
            else
            {
                if (r1 < 0)
                {
                    r5 = --gTasks[taskId].data[0];
                    r6 = 0;
                    gTasks[taskId].data[1]++;
                }
                else
                {
                    r5 = gTasks[taskId].data[0]++;
                    gTasks[taskId].data[1]--;
                    r6 = sub_80AFB40(r7);
                }
            }
        }
        r10 = r5;
        if (r5 > 7)
            r5 += 24;
        // Seriously, a 2-byte CpuFill? Why?
        CpuFill16(r6, (void *)(VRAM + 0xC000 + (0x56 + r5 + gUnknown_02038696[r7] * 160) * 2), 2);
        if (r1 > 0)
        {
            PlaySE(SE_C_GAJI);
            m4aMPlayImmInit(&gMPlay_SE1);
            m4aMPlayPitchControl(&gMPlay_SE1, 0xFFFF, r10 * 256);
        }
        else
        {
            PlaySE(SE_BOO);
        }
        if (r5 == 0 && r6 == 0)
            gTasks[taskId].data[2] = -gTasks[taskId].data[2];
    }
}

void sub_80AFE30(void)
{
    s32 i;

    LoadSpriteSheet(&gUnknown_083CA350);
    for (i = 0; i < 4; i++)
    {
        u8 y = gUnknown_083CA338[gUnknown_02038696[i]];

        shared19338[i].unk0 = CreateSprite(&gSpriteTemplate_83CA3AC, 180, y, 1);
    }
}

void sub_80AFE78(u8 a)
{
    u8 spriteId;
    s16 r5;

    shared19338[a].unk2_0 = 1;
    spriteId = shared19338[a].unk0;
    r5 = shared19260_[a].unk4 / 10 * 2;
    if (r5 > 56)
        r5 = 56;
    else if (r5 < 0)
        r5 = 0;
    gSprites[spriteId].invisible = FALSE;
    gSprites[spriteId].data[0] = a;
    gSprites[spriteId].data[1] = r5;
    if (gSprites[spriteId].data[1] > gSprites[spriteId].pos2.x)
        gSprites[spriteId].data[2] = 1;
    else
        gSprites[spriteId].data[2] = -1;
    gSprites[spriteId].callback = sub_80AFF60;
}

void sub_80AFF10(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
        sub_80AFE78(i);
}

bool8 sub_80AFF28(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        if (shared19338[i].unk2_0)
            break;
    }
    if (i == 4)
        return TRUE;
    else
        return FALSE;
}

void sub_80AFF60(struct Sprite *sprite)
{
    if (sprite->pos2.x == sprite->data[1])
    {
        shared19338[sprite->data[0]].unk2_0 = 0;
        sprite->callback = SpriteCallbackDummy;
    }
    else
    {
        sprite->pos2.x += sprite->data[2];
    }
}

void sub_80AFFA0(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
        gSprites[shared19338[i].unk0].pos1.y = gUnknown_083CA338[gUnknown_02038696[i]];
}

void sub_80AFFE0(bool8 a)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        if (gUnknown_02038696[i] > 1)
        {
            if (!a)
                gSprites[shared19338[i].unk0].pos1.x = 180;
            else
                gSprites[shared19338[i].unk0].pos1.x = 256;
        }
    }
}

void sub_80B0034(void)
{
    s32 i;

    LoadSpritePalette(&gUnknown_083CA3E4);
    for (i = 0; i < 4; i++)
    {
        LoadCompressedObjectPic(&gUnknown_083CA3C4[i]);
        shared19338[i].unk1 = CreateSprite(
          &gSpriteTemplate_83CA3F4[i],
          204, gUnknown_083CA33C[gUnknown_02038696[i]],
          0);
        SetSubspriteTables(&gSprites[shared19338[i].unk1], gSubspriteTables_83CA464);
        gSprites[shared19338[i].unk1].invisible = TRUE;
    }
}

void sub_80B00C8(void)
{
    u8 spriteId;

    LoadCompressedObjectPic(&gUnknown_083CA46C);
    LoadSpritePalette(&gUnknown_083CA474);
    spriteId = CreateSprite(&gSpriteTemplate_83CA484, 30, 44, 1);
    gSprites[spriteId].invisible = TRUE;
    shared19204.unk1925C = spriteId;
}

void nullsub_18(s8 unused)
{
}

void unref_sub_80B011C(void)
{
    u8 i;

    LoadCompressedObjectPic(&gUnknown_083CC3AC);
    for (i = 0; i < 4; i++)
        LoadCompressedObjectPalette(&gUnknown_083CC3B4[i]);
    for (i = 0; i < 4; i++)
    {
        u8 spriteId = CreateSprite(
          &gSpriteTemplate_83CC454[i],
          gUnknown_083CA330[i][0], gUnknown_083CA330[i][1],
          5);

        gSprites[spriteId].invisible = TRUE;
        gSprites[spriteId].data[0] = i;
        shared19204.unk1920D[i] = spriteId;
    }
}

void unref_sub_80B01B0(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
        gSprites[shared19204.unk1920D[i]].callback = sub_80B0238;
}

bool8 unref_sub_80B01E0(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        if (gSprites[shared19204.unk1920D[i]].callback != SpriteCallbackDummy)
            break;
    }
    if (i == 4)
        return TRUE;
    else
        return FALSE;
}

void sub_80B0238(struct Sprite *sprite)
{
    sprite->oam.affineMode = 1;
    InitSpriteAffineAnim(sprite);
    if (sprite->invisible)
    {
        sprite->callback = sub_80B02A8;
    }
    else
    {
        StartSpriteAffineAnim(sprite, 1);
        sprite->callback = sub_80B0280;
    }
}

void sub_80B0280(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
    {
        sprite->invisible = TRUE;
        sprite->callback = sub_80B02A8;
    }
}

void sub_80B02A8(struct Sprite *sprite)
{
    sprite->invisible = FALSE;
    StartSpriteAnim(sprite, shared19260_[sprite->data[0]].unkB_0);
    StartSpriteAffineAnim(sprite, 2);
    sprite->callback = sub_80B02F4;
    PlaySE(SE_JYUNI);
}

void sub_80B02F4(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
    {
        FreeSpriteOamMatrix(sprite);
        sprite->oam.affineMode = 0;
        sprite->callback = SpriteCallbackDummy;
    }
}

void sub_80B0324(void)
{
    u8 i;
    u8 taskId = CreateTask(sub_80B0458, 30);

    shared19204.unk19211 = taskId;
    for (i = 0; i < 4; i++)
        gTasks[taskId].data[i * 4] = 0xFF;
}

void sub_80B0368(u8 a)
{
    gTasks[shared19204.unk19211].data[a * 4 + 0] = 0;
    gTasks[shared19204.unk19211].data[a * 4 + 1] = 0;
}

void sub_80B03A8(u8 a)
{
    u8 taskId = CreateTask(sub_80B03D8, 31);

    gTasks[taskId].data[0] = a;
}

void sub_80B03D8(u8 taskId)
{
    u8 r4 = gTasks[taskId].data[0];

    if (gTasks[shared19204.unk19211].data[r4 * 4 + 0] == 0
     || gTasks[shared19204.unk19211].data[r4 * 4 + 0] == 0xFF)
    {
        gTasks[shared19204.unk19211].data[r4 * 4 + 0] = 0xFF;
        gTasks[shared19204.unk19211].data[r4 * 4 + 1] = 0;
        BlendPalette((shared19204.unk19218[r4] + 5) * 16 + 6, 2, 0, 0x4BFF);
        DestroyTask(taskId);
    }
}

void sub_80B0458(u8 taskId)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        u8 r3 = i * 4;

        if (gTasks[taskId].data[r3 + 0] != 0xFF)
        {
            if (gTasks[taskId].data[r3 + 1] == 0)
                gTasks[taskId].data[r3 + 0]++;
            else
                gTasks[taskId].data[r3 + 0]--;

            if (gTasks[taskId].data[r3 + 0] == 16
             || gTasks[taskId].data[r3 + 0] == 0)
                gTasks[taskId].data[r3 + 1] ^= 1;

            BlendPalette(
              (shared19204.unk19218[i] + 5) * 16 + 6,
              2,
              gTasks[taskId].data[r3 + 0],
              0x4BFF);
        }
    }
}

void sub_80B0518(void)
{
    u8 i;

    shared19204.unk19212 = CreateTask(sub_80B05FC, 30);
    for (i = 0; i < 4; i++)
        sub_80B0548(i);
}

void sub_80B0548(u8 a)
{
    gTasks[shared19204.unk19212].data[a * 4 + 0] = 0xFF;
    gTasks[shared19204.unk19212].data[a * 4 + 1] = 0;
}

void sub_80B0588(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
        sub_80B05A4(i);
}

// TODO: Try to write this better
void sub_80B05A4(u8 a)
{
    u32 var;
    u32 r0;

    sub_80B0548(a);

    // 2-byte DMA copy? Why?

    r0 = a + 5;
    {
        void *src = gPlttBufferUnfaded + r0 * 16 + 10;
        void *dest = gPlttBufferFaded + r0 * 16 + 10;
        DmaCopy16(3, src, dest, 2);
    }
    var = (a + 5) * 16 + 12 + a;
    {
        void *src = gPlttBufferUnfaded + var;
        void *dest = gPlttBufferFaded + var;
        DmaCopy16(3, src, dest, 2);
    }
}

void nullsub_19(int unused)
{
}

void sub_80B05FC(u8 taskId)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        u8 r3 = i * 4;

        if (gTasks[taskId].data[r3 + 0] != 0xFF)
        {
            if (++gTasks[taskId].data[r3 + 2] > 2)
            {
                gTasks[taskId].data[r3 + 2] = 0;

                if (gTasks[taskId].data[r3 + 1] == 0)
                    gTasks[taskId].data[r3 + 0]++;
                else
                    gTasks[taskId].data[r3 + 0]--;

                if (gTasks[taskId].data[r3 + 0] == 16
                 || gTasks[taskId].data[r3 + 0] == 0)
                    gTasks[taskId].data[r3 + 1] ^= 1;

                BlendPalette((i + 5) * 16 + 10, 1, gTasks[taskId].data[r3 + 0], 0x4BFF);
                BlendPalette((i + 5) * 16 + 12 + i, 1, gTasks[taskId].data[r3 + 0], 0x4BFF);
            }
        }
    }
}

u8 unref_sub_80B06E0(u8 *a)
{
    u8 i;
    u8 taskId = CreateTask(sub_80B0748, 10);

    for (i = 0; i < 4; i++)
    {
        u8 r0 = i * 4;

        gTasks[taskId].data[r0] = a[i];
        if (a[i] != 0)
            shared19338[i].unk2_1 = 1;
    }
    return taskId;
}

#ifdef NONMATCHING
void sub_80B0748(u8 taskId)
{
    u8 i;
    u8 r4_2;
    u8 r1;
    u8 r7;

    for (i = 0; i < 4; i++)
    {
        //#define r4 r4_2
        r4 = gUnknown_02038696[i];
        r1 = r4 * 4;
        r7 = gTasks[taskId].data[r1 + 0];

        if (r7 != 0)
        {
            //_080B079C
            u8 r8 = gTasks[taskId].data[r1 + 1];
            u8 r5 = gTasks[taskId].data[r1 + 2];
            u8 r6 = gTasks[taskId].data[r1 + 3];

            if (r7 == 1)
            {
                r6++;
                if (r6 == 1)
                {
                    //_080B07D2
                    r6 = 0;
                    BlendPalette((r4 + 5) * 16 + 1, 3, r5, 0x7FFF);
                    if (r5 == 0 && r8 == 4)
                    {
                        gTasks[taskId].data[r1 + 0] = 0;
                        //asm("");
                    }
                    //_080B0800
                    else
                    {
                        r5 += 2;
                        if (r5 > 13)
                        {
                            r5 = 0;
                            r8++;
                        }
                    }
                }
                //to _080B08EA
            }
            //_080B0818
            else if (r7 == 2 || r7 == 4)
            {
                r6++;
                if (r6 == 3)
                {
                    r6 = 0;
                    BlendPalette((r4 + 5) * 16 + 1, 3, r5, gUnknown_083CC5A4[r4]);
                    if (r5 == 0 && r8 == 2)
                    {
                        gTasks[taskId].data[r1 + 0] = 0;
                    }
                    //_080B0858
                    else
                    {
                        r5 += 1;
                        if (r5 == 14)
                        {
                            r5 = 0;
                            r8++;
                            if (r7 == 4 && r8 == 1)
                            {
                                BlendPalette((r4 + 9) * 16 + 2, 1, 4, 0);
                                BlendPalette((r4 + 9) * 16 + 5, 1, 4, 0);
                            }
                        }
                    }
                }
                //to _080B08EA
            }
            //_080B0896
            else if (r7 == 3)
            {
                r6++;
                if (r6 == 12)
                {
                    r6 = 0;
                    BlendPalette((r4 + 5) * 16 + 1, 3, r5, 0);
                    r5 += 1;
                    if (r5 == 5)
                    {
                        // What the hell? These aren't pointers.
                        // This code would crash if run.
                        {
                            void *src = (void *)(u32)gPlttBufferFaded[(r4 + 5) * 16 + 1];
                            void *dest = (void *)(u32)gPlttBufferUnfaded[(r4 + 5) * 16 + 1];
                            u32 size = 6;
                            DmaCopy16(3, src, dest, size);
                        }
                        gTasks[taskId].data[r1 + 0] = 0;
                    }
                }
            }
            //_080B08EA
            gTasks[taskId].data[r1 + 1] = r8;
            gTasks[taskId].data[r1 + 2] = r5;
            gTasks[taskId].data[r1 + 3] = r6;
        }
        //_080B0910
    }
    //_080B0920

    #define i r4_2
    for (i = 0; i < 4; i++)  // r4 is i
    {
        if (gTasks[taskId].data[i * 4 + 0] != 0)
            break;
    }
    //_080B0958
    if (i == 4)
    {
        for (i = 0; i < 4; i++)
            shared19338[i].unk2_2 = 0;
        DestroyTask(taskId);
    }
    #undef i
}
#else
__attribute__((naked))
void sub_80B0748(u8 taskId)
{
    asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r10\n\
	mov r6, r9\n\
	mov r5, r8\n\
	push {r5-r7}\n\
	sub sp, 0x20\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	str r0, [sp]\n\
	movs r0, 0\n\
	str r0, [sp, 0x4]\n\
	ldr r2, _080B07F4 @ =gTasks\n\
	movs r1, 0x8\n\
	adds r1, r2\n\
	mov r10, r1\n\
	ldr r3, [sp]\n\
	lsls r3, 2\n\
	str r3, [sp, 0x1C]\n\
	ldr r1, [sp]\n\
	adds r0, r3, r1\n\
	lsls r0, 3\n\
	str r0, [sp, 0xC]\n\
_080B0774:\n\
	ldr r0, _080B07F8 @ =gUnknown_02038696\n\
	ldr r3, [sp, 0x4]\n\
	adds r0, r3, r0\n\
	ldrb r4, [r0]\n\
	lsls r0, r4, 26\n\
	lsrs r1, r0, 24\n\
	lsls r0, r1, 1\n\
	str r0, [sp, 0x8]\n\
	ldr r3, [sp]\n\
	lsls r0, r3, 2\n\
	adds r0, r3\n\
	lsls r6, r0, 3\n\
	ldr r3, [sp, 0x8]\n\
	adds r0, r3, r6\n\
	add r0, r10\n\
	mov r9, r0\n\
	ldrb r7, [r0]\n\
	cmp r7, 0\n\
	bne _080B079C\n\
	b _080B0910\n\
_080B079C:\n\
	adds r3, r1, 0x1\n\
	lsls r0, r3, 1\n\
	adds r0, r6\n\
	add r0, r10\n\
	ldrb r0, [r0]\n\
	mov r8, r0\n\
	adds r2, r1, 0x2\n\
	lsls r0, r2, 1\n\
	adds r0, r6\n\
	add r0, r10\n\
	ldrb r5, [r0]\n\
	adds r1, 0x3\n\
	lsls r0, r1, 1\n\
	adds r0, r6\n\
	add r0, r10\n\
	ldrb r6, [r0]\n\
	str r3, [sp, 0x10]\n\
	str r2, [sp, 0x14]\n\
	str r1, [sp, 0x18]\n\
	cmp r7, 0x1\n\
	bne _080B0818\n\
	adds r0, r6, 0x1\n\
	lsls r0, 24\n\
	lsrs r6, r0, 24\n\
	cmp r6, 0x1\n\
	beq _080B07D2\n\
	b _080B08EA\n\
_080B07D2:\n\
	movs r6, 0\n\
	adds r0, r4, 0x5\n\
	lsls r0, 4\n\
	adds r0, 0x1\n\
	movs r1, 0x3\n\
	adds r2, r5, 0\n\
	ldr r3, _080B07FC @ =0x00007fff\n\
	bl BlendPalette\n\
	cmp r5, 0\n\
	bne _080B0800\n\
	mov r0, r8\n\
	cmp r0, 0x4\n\
	bne _080B0800\n\
	mov r1, r9\n\
	strh r6, [r1]\n\
	b _080B08EA\n\
	.align 2, 0\n\
_080B07F4: .4byte gTasks\n\
_080B07F8: .4byte gUnknown_02038696\n\
_080B07FC: .4byte 0x00007fff\n\
_080B0800:\n\
	adds r0, r5, 0x2\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	cmp r5, 0xD\n\
	bls _080B08EA\n\
	movs r5, 0\n\
	mov r0, r8\n\
	adds r0, 0x1\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	mov r8, r0\n\
	b _080B08EA\n\
_080B0818:\n\
	cmp r7, 0x2\n\
	beq _080B0820\n\
	cmp r7, 0x4\n\
	bne _080B0896\n\
_080B0820:\n\
	adds r0, r6, 0x1\n\
	lsls r0, 24\n\
	lsrs r6, r0, 24\n\
	cmp r6, 0x3\n\
	bne _080B08EA\n\
	movs r6, 0\n\
	adds r0, r4, 0x5\n\
	lsls r0, 4\n\
	adds r0, 0x1\n\
	ldr r2, _080B0854 @ =gUnknown_083CC5A4\n\
	lsls r1, r4, 1\n\
	adds r1, r2\n\
	ldrh r3, [r1]\n\
	movs r1, 0x3\n\
	adds r2, r5, 0\n\
	bl BlendPalette\n\
	cmp r5, 0\n\
	bne _080B0858\n\
	mov r2, r8\n\
	cmp r2, 0x2\n\
	bne _080B0858\n\
	mov r3, r9\n\
	strh r6, [r3]\n\
	b _080B08EA\n\
	.align 2, 0\n\
_080B0854: .4byte gUnknown_083CC5A4\n\
_080B0858:\n\
	adds r0, r5, 0x1\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	cmp r5, 0xE\n\
	bne _080B08EA\n\
	movs r5, 0\n\
	mov r0, r8\n\
	adds r0, 0x1\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	mov r8, r0\n\
	cmp r7, 0x4\n\
	bne _080B08EA\n\
	cmp r0, 0x1\n\
	bne _080B08EA\n\
	adds r4, 0x9\n\
	lsls r4, 4\n\
	adds r0, r4, 0x2\n\
	movs r1, 0x1\n\
	movs r2, 0x4\n\
	movs r3, 0\n\
	bl BlendPalette\n\
	adds r4, 0x5\n\
	adds r0, r4, 0\n\
	movs r1, 0x1\n\
	movs r2, 0x4\n\
	movs r3, 0\n\
	bl BlendPalette\n\
	b _080B08EA\n\
_080B0896:\n\
	cmp r7, 0x3\n\
	bne _080B08EA\n\
	adds r0, r6, 0x1\n\
	lsls r0, 24\n\
	lsrs r6, r0, 24\n\
	cmp r6, 0xC\n\
	bne _080B08EA\n\
	movs r6, 0\n\
	adds r0, r4, 0x5\n\
	lsls r0, 4\n\
	adds r4, r0, 0x1\n\
	adds r0, r4, 0\n\
	movs r1, 0x3\n\
	adds r2, r5, 0\n\
	movs r3, 0\n\
	bl BlendPalette\n\
	adds r0, r5, 0x1\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	cmp r5, 0x5\n\
	bne _080B08EA\n\
	ldr r0, _080B0930 @ =gPlttBufferFaded\n\
	lsls r1, r4, 1\n\
	adds r0, r1, r0\n\
	ldrh r2, [r0]\n\
	ldr r0, _080B0934 @ =gPlttBufferUnfaded\n\
	adds r1, r0\n\
	ldrh r0, [r1]\n\
	ldr r1, _080B0938 @ =0x040000d4\n\
	str r2, [r1]\n\
	str r0, [r1, 0x4]\n\
	movs r0, 0x80\n\
	lsls r0, 24\n\
	orrs r7, r0\n\
	str r7, [r1, 0x8]\n\
	ldr r0, [r1, 0x8]\n\
	ldr r1, [sp, 0x8]\n\
	ldr r2, [sp, 0xC]\n\
	adds r0, r1, r2\n\
	add r0, r10\n\
	strh r6, [r0]\n\
_080B08EA:\n\
	ldr r3, [sp, 0x10]\n\
	lsls r0, r3, 1\n\
	ldr r1, [sp, 0xC]\n\
	adds r0, r1\n\
	add r0, r10\n\
	mov r2, r8\n\
	strh r2, [r0]\n\
	ldr r3, [sp, 0x14]\n\
	lsls r0, r3, 1\n\
	adds r0, r1\n\
	add r0, r10\n\
	strh r5, [r0]\n\
	ldr r1, [sp, 0x18]\n\
	lsls r0, r1, 1\n\
	ldr r2, [sp, 0xC]\n\
	adds r0, r2\n\
	add r0, r10\n\
	strh r6, [r0]\n\
	ldr r2, _080B093C @ =gTasks\n\
_080B0910:\n\
	ldr r0, [sp, 0x4]\n\
	adds r0, 0x1\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	str r0, [sp, 0x4]\n\
	cmp r0, 0x3\n\
	bhi _080B0920\n\
	b _080B0774\n\
_080B0920:\n\
	movs r4, 0\n\
	ldr r3, [sp, 0x1C]\n\
	ldr r1, [sp]\n\
	adds r0, r3, r1\n\
	lsls r1, r0, 3\n\
	adds r2, 0x8\n\
	adds r0, r1, r2\n\
	b _080B0950\n\
	.align 2, 0\n\
_080B0930: .4byte gPlttBufferFaded\n\
_080B0934: .4byte gPlttBufferUnfaded\n\
_080B0938: .4byte 0x040000d4\n\
_080B093C: .4byte gTasks\n\
_080B0940:\n\
	adds r0, r4, 0x1\n\
	lsls r0, 24\n\
	lsrs r4, r0, 24\n\
	cmp r4, 0x3\n\
	bhi _080B0958\n\
	lsls r0, r4, 3\n\
	adds r0, r1\n\
	adds r0, r2\n\
_080B0950:\n\
	movs r3, 0\n\
	ldrsh r0, [r0, r3]\n\
	cmp r0, 0\n\
	beq _080B0940\n\
_080B0958:\n\
	cmp r4, 0x4\n\
	bne _080B0980\n\
	movs r4, 0\n\
	ldr r3, _080B0990 @ =gSharedMem + 0x19338\n\
	movs r5, 0x3\n\
	negs r5, r5\n\
_080B0964:\n\
	lsls r1, r4, 2\n\
	adds r1, r3\n\
	ldrb r2, [r1, 0x2]\n\
	adds r0, r5, 0\n\
	ands r0, r2\n\
	strb r0, [r1, 0x2]\n\
	adds r0, r4, 0x1\n\
	lsls r0, 24\n\
	lsrs r4, r0, 24\n\
	cmp r4, 0x3\n\
	bls _080B0964\n\
	ldr r0, [sp]\n\
	bl DestroyTask\n\
_080B0980:\n\
	add sp, 0x20\n\
	pop {r3-r5}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	mov r10, r5\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080B0990: .4byte gSharedMem + 0x19338\n\
    .syntax divided\n");
}
#endif

void unref_sub_80B0994(u8 a)
{
    if (a != 0)
        shared19204.unk1920A_2 = 1;
}

void sub_80B09B0(u8 a)
{
    if (shared19260_[a].unk15_4)
        sub_80B0368(a);
    else
        sub_80B03A8(a);
}

extern const struct CompressedSpriteSheet gUnknown_083CC4B4[];
extern const struct SpritePalette gUnknown_083CC4D4[];
extern const struct SpriteTemplate gSpriteTemplate_83CC53C[];

u8 sub_80B09E4(u8 a)
{
    u8 r5 = gUnknown_02038696[a] * 40 + 32;
    u8 r8;
    u8 r6;
    volatile u8 zero;

    LoadCompressedObjectPic(&gUnknown_083CC4B4[a]);
    LoadSpritePalette(&gUnknown_083CC4D4[a]);
    r8 = CreateSprite(&gSpriteTemplate_83CC53C[a], 184, r5, 29);
    r6 = CreateSprite(&gSpriteTemplate_83CC53C[a], 248, r5, 29);
    gSprites[r6].oam.tileNum += 64;

    CopySpriteTiles(0, 3, (void *)VRAM, (u16 *)(VRAM + 0xE000 + gUnknown_02038696[a] * 5 * 64 + 0x26), (u8 *)(VRAM + 0x10000 + gSprites[r8].oam.tileNum * 32));
    CopySpriteTiles(0, 3, (void *)VRAM, (u16 *)(VRAM + 0xE000 + gUnknown_02038696[a] * 5 * 64 + 0x36), (u8 *)(VRAM + 0x10000 + gSprites[r6].oam.tileNum * 32));

    {
        void *dest = (void *)(VRAM + 0x10000 + (0x28 + gSprites[r8].oam.tileNum) * 32);
        u32 size = 0x300;
        DmaFill32(3, 0, dest, size);
    }

    // What is this?
    zero = 0;
    zero = 0;

    {
        void *dest = (void *)(VRAM + 0x10000 + (0x28 + gSprites[r6].oam.tileNum) * 32);
        u32 size = 0x300;
        DmaFill32(3, 0, dest, size);
    }

    gSprites[r8].data[0] = r6;
    gSprites[r6].data[0] = r8;
    gSprites[r8].data[1] = a;
    gSprites[r6].data[1] = a;
    return r8;
}

void sub_80B0B5C(u8 spriteId)
{
    u8 spriteId2 = gSprites[spriteId].data[0];

    FreeSpriteOamMatrix(&gSprites[spriteId2]);
    DestroySprite(&gSprites[spriteId2]);
    DestroySpriteAndFreeResources(&gSprites[spriteId]);
}

void sub_80B0B98(void)
{
    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = 0x0907;
}

void sub_80B0BB4(void)
{
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
}

void sub_80B0BC4(u8 a, bool8 b)
{
    u8 r5;

    sub_80B0B98();
    shared19338[gSprites[a].data[1]].unk2_1 = 1;
    r5 = gSprites[a].data[0];
    StartSpriteAffineAnim(&gSprites[a], 1);
    StartSpriteAffineAnim(&gSprites[r5], 1);
    gSprites[a].callback = sub_80B0C5C;
    gSprites[r5].callback = SpriteCallbackDummy;
    if (b == FALSE)
        PlaySE(SE_C_PIKON);
    else
        PlaySE(SE_PC_LOGON);
}

void sub_80B0C5C(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
    {
        u8 r1 = sprite->data[0];

        if (gSprites[r1].affineAnimEnded)
        {
            sprite->invisible = TRUE;
            gSprites[r1].invisible = TRUE;
            sprite->callback = sub_80B0CB0;
        }
    }
}

void sub_80B0CB0(struct Sprite *sprite)
{
    shared19338[sprite->data[1]].unk2_1 = 0;
    sub_80B0B5C(sprite->data[0]);
    sub_80B0BB4();
}

void sub_80B0CDC(u8 a, int unused)
{
    shared19338[a].unk2_1 = 0;
}

void unref_sub_80B0CF4(void)
{
    //shared18000.unk18000 ^= 1;
    gSharedMem[0x18000] ^= 1;
    //if (shared18000.unk18000 == 0)
    if (gSharedMem[0x18000] == 0)
    {
        u8 i;

        for (i = 0; i < 4; i++)
        {
            FillWindowRect_DefaultPalette(
              &gUnknown_03004210,
              0,
              gUnknown_083CA308[i][0],
              gUnknown_083CA308[i][1],
              gUnknown_083CA310[i][0] + 5,
              gUnknown_083CA310[i][1] + 1);
        }
        sub_80AE514();
        sub_80AEB30();
    }
    else
    {
        sub_80B0D7C();
    }
}

void sub_80B0D7C(void)
{
    u8 r5 = 0;
    u8 sp8[8];

    if (gSharedMem[0x18000] != 0)
    {
        u8 i;
        s16 r2;

        for (i = 0; i < 4; i++)
        {
            FillWindowRect_DefaultPalette(
              &gUnknown_03004210,
              0,
              gUnknown_083CA308[i][0],
              gUnknown_083CA308[i][1],
              gUnknown_083CA310[i][0] + 5,
              gUnknown_083CA310[i][1] + 1);
        }
        for (i = 0; i < 4; i++)
        {
            r2 = shared19260_[i].unk4;
            if (r2 < 0)
            {
                r2 = -r2;
                sp8[0] = CHAR_HYPHEN;
                r5++;
            }
            ConvertIntToDecimalStringN(sp8 + r5, r2, 0, 4);
            sub_8003460(
              &gUnknown_03004210,
              sp8,
              592 + gUnknown_02038696[i] * 22,
              gUnknown_083CA310[gUnknown_02038696[i]][0],
              gUnknown_083CA310[gUnknown_02038696[i]][1]);
            r5 = 0;
        }
        for (i = 0; i < 4; i++)
        {
            r2 = shared19260_[i].unk2;
            if (r2 < 0)
            {
                r2 = -r2;
                sp8[0] = CHAR_HYPHEN;
                r5++;
            }
            ConvertIntToDecimalStringN(sp8 + r5, r2, 0, 4);
            sub_8003460(
              &gUnknown_03004210,
              sp8,
              512 + gUnknown_02038696[i] * 20,
              gUnknown_083CA308[gUnknown_02038696[i]][0],
              gUnknown_083CA308[gUnknown_02038696[i]][1]);
            r5 = 0;
        }
        sub_80AEB30();
    }
}

void unref_sub_80B0EE8(s32 *a, s32 b)
{
    s32 i;
    s32 j;

    for (i = 0; i < b - 1; i++)
    {
        for (j = b - 1; j > i; j--)
        {
            if (a[j - 1] > a[j])
            {
                s32 temp = a[j];

                a[j] = a[j - 1];
                a[j - 1] = temp;
            }
        }
    }
}

// something to do with contest NPC opponents, I think.
void sub_80B0F28(u8 a)
{
    u8 sp0[4];
    u16 sp4[4] = {0};
    s32 i;
    s32 r2;
    s32 r4;

    for (i = 0; i < 4; i++)
    {
        sp4[i] = Random();
        for (r2 = 0; r2 < i; r2++)
        {
            if (sp4[i] == sp4[r2])
            {
                i--;
                break;
            }
        }
    }

    if (a == 0)
    {
        for (i = 0; i < 4; i++)
        {
            gUnknown_02038696[i] = i;
            for (r4 = 0; r4 < i; r4++)
            {
                if (gUnknown_02038670[gUnknown_02038696[r4]] < gUnknown_02038670[i]
                 || (gUnknown_02038670[gUnknown_02038696[r4]] == gUnknown_02038670[i] && sp4[gUnknown_02038696[r4]] < sp4[i]))
                {
                    for (r2 = i; r2 > r4; r2--)
                        gUnknown_02038696[r2] = gUnknown_02038696[r2 - 1];
                    gUnknown_02038696[r4] = i;
                    break;
                }
            }
            if (r4 == i)
                gUnknown_02038696[i] = i;
        }
        memcpy(sp0, gUnknown_02038696, sizeof(sp0));
        for (i = 0; i < 4; i++)
            gUnknown_02038696[sp0[i]] = i;
    }
    else
    {
        memset(sp0, 0xFF, sizeof(sp0));
        for (i = 0; i < 4; i++)
        {
            u8 r2 = shared19260_[i].unkB_0;

            while (1)
            {
                u8 *ptr = &sp0[r2];
                if (*ptr == 0xFF)
                {
                    *ptr = i;
                    gUnknown_02038696[i] = r2;
                    break;
                }
                r2++;
            }
        }
        for (i = 0; i < 3; i++)
        {
            for (r4 = 3; r4 > i; r4--)
            {
                if (shared19260_[r4 - 1].unkB_0 == shared19260_[r4].unkB_0
                 && gUnknown_02038696[r4 - 1] < gUnknown_02038696[r4]
                 && sp4[r4 - 1] < sp4[r4])
                {
                    u8 temp = gUnknown_02038696[r4];

                    gUnknown_02038696[r4] = gUnknown_02038696[r4 - 1];
                    gUnknown_02038696[r4 - 1] = temp;
                }
            }
        }
    }
}

void sub_80B1118(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        //LoadPalette(shared18000.unk18004[5 + i], (gUnknown_02038696[i] + 5) * 16, 32);
        LoadPalette(shared18004 + (i + 5) * 16, (gUnknown_02038696[i] + 5) * 16, 32);
    }
    sub_80AE514();
}

void sub_80B114C(u8 a)
{
    bool8 r8;
    s32 i;

    shared19260_[a].unk2 = 0;
    shared19260_[a].unk0 = 0;
    r8 = sub_80AF404(a);
    if (r8)
    {
        u16 r0 = shared19260_[a].unk6;
        u8 effect = gContestMoves[r0].effect;
        u8 rnd;

        shared19260_[a].unkA = gContestMoves[shared19260_[a].unk6].contestCategory;
        if (shared19260_[a].unk6 == shared19260_[a].unk8 && shared19260_[a].unk6 != 0)
        {
            shared19260_[a].unk15_0 = 1;
            shared19260_[a].unkB_4++;
        }
        else
        {
            shared19260_[a].unkB_4 = 0;
        }
        shared19260_[a].unk0 = gContestEffects[effect].appeal;
        shared19260_[a].unk2 = gContestEffects[effect].appeal;
        shared192D0_.unk4 = gContestEffects[effect].jam;
        shared192D0_.unk6 = gContestEffects[effect].jam;
        shared192D0_.unk11 = a;
        for (i = 0; i < 4; i++)
        {
            shared19260_[i].unkE = 0;
            shared192D0_.unkD[i] = 0;
        }
        if (shared19260_[a].unk15_4 && !AreMovesContestCombo(shared19260_[a].unk8, shared19260_[a].unk6))
            shared19260_[a].unk15_4 = 0;
        gContestEffectFuncs[effect]();
        if (shared19260_[a].unk10_4 == 1)
            shared19260_[a].unk2 += shared19260_[a].unkD - 10;
        else if (shared19260_[a].unk11_5)
            shared19260_[a].unk2 += shared19260_[a].unkD * 3;
        else
            shared19260_[a].unk2 += shared19260_[a].unkD;
        shared19260_[a].unk16 = 0;
        shared19260_[a].unk15_6 = 0;
        if (sub_80B214C(a))
        {
            bool8 r2 = AreMovesContestCombo(shared19260_[a].unk8, shared19260_[a].unk6);

            if (r2 && shared19260_[a].unk15_4)
            {
                shared19260_[a].unk16 = r2;
                shared19260_[a].unk15_6 = 1;
                shared19260_[a].unk15_4 = 0;
                shared19260_[a].unk17 = shared19260_[a].unk0 * shared19260_[a].unk16;
                shared19260_[a].unk15_3 = 1;
            }
            else
            {
                if (gContestMoves[shared19260_[a].unk6].comboStarterId != 0)
                {
                    shared19260_[a].unk15_4 = 1;
                    shared19260_[a].unk15_6 = 1;
                }
                else
                {
                    shared19260_[a].unk15_4 = 0;
                }
            }
        }
        if (shared19260_[a].unk15_0)
            shared19260_[a].unk18 = (shared19260_[a].unkB_4 + 1) * 10;
        if (shared19260_[a].unkC_0)
        {
            shared19260_[a].unk15_4 = 0;
            shared19260_[a].unk2 = 0;
            shared19260_[a].unk0 = 0;
        }
        shared19328.bits_0 = contest_get_move_excitement(shared19260_[a].unk6);
        if (shared19260_[a].unk11_4)
            shared19328.bits_0 = 1;
        if (shared19328.bits_0 > 0)
        {
            if (shared19204.unk19217 + shared19328.bits_0 > 4)
                shared19328.unk2 = 60;
            else
                shared19328.unk2 = 10;
        }
        else
        {
            shared19328.unk2 = 0;
        }

        rnd = Random() % 3;
        for (i = 0; i < 4; i++)
        {
            if (i != a)
            {
                if (rnd == 0)
                    break;
                rnd--;
            }
        }
        shared19260_[a].unk1B = i;
    }
}

void sub_80B13EC(u8 a, u8 b)
{
    shared19260_[a].unk13 = b;
}

void sub_80B1404(u8 a, u8 b)
{
    shared19260_[a].unk14 = b;
}

void sub_80B141C(u8 a, u8 b)
{
    if      (b >= 60)
        sub_80B13EC(a, 53);
    else if (b >= 40)
        sub_80B13EC(a, 52);
    else if (b >= 30)
        sub_80B13EC(a, 51);
    else if (b >= 20)
        sub_80B13EC(a, 50);
    else if (b >= 10)
        sub_80B13EC(a, 49);
}

void sub_80B146C(u8 a, u8 b)
{
    StringCopy(gStringVar1, gContestMons[a].nickname);
    StringCopy(gStringVar2, gMoveNames[shared19260_[a].unk6]);
    if      (gContestMoves[shared19260_[shared192D0_.unk11].unk6].contestCategory == CONTEST_CATEGORY_COOL)
        StringCopy(gStringVar3, gUnknown_083CC280);
    else if (gContestMoves[shared19260_[shared192D0_.unk11].unk6].contestCategory == CONTEST_CATEGORY_BEAUTY)
        StringCopy(gStringVar3, gUnknown_083CC288);
    else if (gContestMoves[shared19260_[shared192D0_.unk11].unk6].contestCategory == CONTEST_CATEGORY_CUTE)
        StringCopy(gStringVar3, gUnknown_083CC290);
    else if (gContestMoves[shared19260_[shared192D0_.unk11].unk6].contestCategory == CONTEST_CATEGORY_SMART)
        StringCopy(gStringVar3, gUnknown_083CC299);
    else
        StringCopy(gStringVar3, gUnknown_083CC2A3);
    StringExpandPlaceholders(gStringVar4, gUnknown_083CC188[b]);
    sub_80AF138();
    sub_8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
}

void sub_80B157C(u8 a)
{
    shared19260_[a].unkC_0 = 1;
    shared19260_[a].unk6 = 0;
}

void sub_80B159C(void)
{
    u8 r12 = 0;
    s32 i;
    s32 j;
    u8 sp0[4];
    u8 sp4[4];

    for (i = 0; i < 4; i++)
    {
        sp0[i] = gUnknown_02038696[i];
        sp4[i] = 0;
    }

    for (i = 0; i < 4; i++)
    {
        for (j = 0; j < 4; j++)
        {
            if (shared19260_[j].unk19 == i)
            {
                sp0[j] = i;
                sp4[j] = 1;
                break;
            }
        }
        if (j == 4)
        {
            for (j = 0; j < 4; j++)
            {
                if (sp4[j] == 0 && shared19260_[j].unk19 == 0xFF)
                {
                    r12 = j;
                    j++;
                    break;
                }
            }
            for (; j < 4; j++)
            {
                if (sp4[j] == 0 && shared19260_[j].unk19 == 0xFF
                 && gUnknown_02038696[r12] > gUnknown_02038696[j])
                    r12 = j;
            }
            sp0[r12] = i;
            sp4[r12] = 1;
        }
    }

    for (i = 0; i < 4; i++)
    {
        shared192D0_.unk0[i] = sp0[i];
        shared19260_[i].unk19 = 0xFF;
        shared19260_[i].unk10_6 = 0;
        gUnknown_02038696[i] = sp0[i];
    }
}

void sub_80B16D0(struct Sprite *sprite)
{
    if (sprite->data[1]++ > 84)
    {
        sprite->data[1] = 0;
        sprite->invisible = TRUE;
        sprite->callback = SpriteCallbackDummy;
        shared19204.unk1920A_4 = 0;
    }
}

void sub_80B1710(u8 a)
{
    u8 spriteId = shared19204.unk19216;

    switch (a)
    {
    case 0:
    case 1:
        gSprites[spriteId].oam.tileNum = gSprites[spriteId].data[0];
        PlaySE(SE_HAZURE);
        break;
    case 2:
        gSprites[spriteId].oam.tileNum = gSprites[spriteId].data[0] + 4;
        PlaySE(SE_SEIKAI);
        break;
    case 3:
        gSprites[spriteId].oam.tileNum = gSprites[spriteId].data[0] + 8;
        PlaySE(SE_SEIKAI);
        break;
    case 4:
        gSprites[spriteId].oam.tileNum = gSprites[spriteId].data[0] + 12;
        PlaySE(SE_TK_WARPIN);
        break;
    case 5:  // exactly the same as case 4
        gSprites[spriteId].oam.tileNum = gSprites[spriteId].data[0] + 12;
        PlaySE(SE_TK_WARPIN);
        break;
    case 6:
        gSprites[spriteId].oam.tileNum = gSprites[spriteId].data[0] + 16;
        PlaySE(SE_TK_WARPIN);
        break;
    case 8:
        gSprites[spriteId].oam.tileNum = gSprites[spriteId].data[0] + 24;
        PlaySE(SE_W215);
        break;
    case 7:
    default:
        gSprites[spriteId].oam.tileNum = gSprites[spriteId].data[0] + 20;
        PlaySE(SE_TK_WARPIN);
        break;
    }
    gSprites[spriteId].data[1] = 0;
    gSprites[spriteId].invisible = FALSE;
    gSprites[spriteId].callback = sub_80B16D0;
    shared19204.unk1920A_4 = 1;
}

void sub_80B1928(void)
{
    s32 i;

    for (i = 0; i < 5; i++)
    {
        const u8 *src;

        if (i < shared19204.unk19217)
            src = gContestApplauseMeterGfx + 64;
        else
            src = gContestApplauseMeterGfx;
        CpuCopy32(src,      (void *)(VRAM + 0x10000 + (gSprites[shared19204.unk1925C].oam.tileNum + 17 + i) * 32), 32);
        CpuCopy32(src + 32, (void *)(VRAM + 0x10000 + (gSprites[shared19204.unk1925C].oam.tileNum + 25 + i) * 32), 32);
        if (shared19204.unk19217 > 4)
            sub_80B1A2C();
    }
}

void unref_sub_80B19D0(void)
{
    u8 str[20];
    StringCopy(str, gUnknown_083CC2EC);
    sub_8003460(&gUnknown_03004210, str, 680, 0, 0);
}

s8 contest_get_move_excitement(u16 move)
{
    return gContestExcitementTable[gScriptContestCategory][gContestMoves[move].contestCategory];
}

u8 sub_80B1A2C(void)
{
    u8 taskId = CreateTask(c3_08130B10, 10);

    gTasks[taskId].data[1] = 1;
    gTasks[taskId].data[2] = IndexOfSpritePaletteTag(0x0ABE2);
    return taskId;
}

void c3_08130B10(u8 taskId)
{
    if (++gTasks[taskId].data[0] == 1)
    {
        gTasks[taskId].data[0] = 0;
        if (gTasks[taskId].data[3] == 0)
            gTasks[taskId].data[4]++;
        else
            gTasks[taskId].data[4]--;
        BlendPalette(264 + gTasks[taskId].data[2] * 16, 1, gTasks[taskId].data[4], 0x7FFF);
        if (gTasks[taskId].data[4] == 0 || gTasks[taskId].data[4] == 16)
        {
            gTasks[taskId].data[3] ^= 1;
            if (shared19204.unk19217 <= 4)
            {
                BlendPalette(264 + gTasks[taskId].data[2] * 16, 1, 0, 31);
                DestroyTask(taskId);
            }
        }
    }
}

void sub_80B1B14(void)
{
    CreateTask(sub_80B1B68, 10);
    gSprites[shared19204.unk1925C].pos2.x = -70;
    gSprites[shared19204.unk1925C].invisible = FALSE;
    shared19204.unk1920A_6 = 1;
}

void sub_80B1B68(u8 taskId)
{
    struct Sprite *sprite = &gSprites[shared19204.unk1925C];

    gTasks[taskId].data[10] += 1664;
    sprite->pos2.x += gTasks[taskId].data[10] >> 8;
    gTasks[taskId].data[10] = gTasks[taskId].data[10] & 0xFF;
    if (sprite->pos2.x > 0)
        sprite->pos2.x = 0;
    if (sprite->pos2.x == 0)
    {
        shared19204.unk1920A_6 = 0;
        DestroyTask(taskId);
    }
}

void sub_80B1BDC(void)
{
    if (gSprites[shared19204.unk1925C].invisible == TRUE)
    {
        shared19204.unk1920A_6 = 0;
    }
    else
    {
        CreateTask(sub_80B1C34, 10);
        gSprites[shared19204.unk1925C].pos2.x = 0;
        shared19204.unk1920A_6 = 1;
    }
}

void sub_80B1C34(u8 taskId)
{
    struct Sprite *sprite = &gSprites[shared19204.unk1925C];

    gTasks[taskId].data[10] += 1664;
    sprite->pos2.x -= gTasks[taskId].data[10] >> 8;
    gTasks[taskId].data[10] = gTasks[taskId].data[10] & 0xFF;
    if (sprite->pos2.x < -70)
        sprite->pos2.x = -70;
    if (sprite->pos2.x == -70)
    {
        sprite->invisible = TRUE;
        shared19204.unk1920A_6 = 0;
        DestroyTask(taskId);
    }
}

void sub_80B1CBC(s8 a)
{
    u8 taskId = CreateTask(sub_80B1CFC, 5);

    gTasks[taskId].data[0] = a;
    shared19204.unk1920A_5 = 1;
}

void sub_80B1CFC(u8 taskId)
{
    switch (gTasks[taskId].data[10])
    {
    case 0:
        sub_80B1B14();
        gTasks[taskId].data[10]++;
        break;
    case 1:
        if (!shared19204.unk1920A_6)
        {
            nullsub_18(gTasks[taskId].data[0]);
            gTasks[taskId].data[10]++;
        }
        break;
    case 2:
        if (gTasks[taskId].data[11]++ > 20)
        {
            gTasks[taskId].data[11] = 0;
            sub_80B1928();
            shared19204.unk1920A_5 = 0;
            DestroyTask(taskId);
        }
        break;
    }
}

void unref_sub_80B1D84(void)
{
    gSprites[shared19204.unk1925C].pos2.x = 0;
    gSprites[shared19204.unk1925C].invisible = FALSE;
}

void unref_sub_80B1DB8(void)
{
    gSprites[shared19204.unk1925C].invisible = TRUE;
}

void sub_80B1DDC(void)
{
    CreateTask(sub_80B1DFC, 15);
    shared19204.unk1920A_7 = 1;
}

void sub_80B1DFC(u8 taskId)
{
    if (gTasks[taskId].data[10]++ > 6)
    {
        register struct Task *task asm("r0");
        register u32 r4 asm("r4") = taskId * 4;

        gTasks[taskId].data[10] = 0;
        if (gTasks[taskId].data[11] == 0)
        {
            {
                void *src = shared16800;
                void *dest = (void *)(VRAM + 0x2000);
                u32 size = 0x1000;
                DmaCopy32(3, src, dest, size);
            }
        }
        else
        {
            {
                void *src = shared15800;
                void *dest = (void *)(VRAM + 0x2000);
                u32 size = 0x1000;
                DmaCopy32(3, src, dest, size);
            }
            gTasks[taskId].data[12]++;
        }

        // Why won't this match the normal way?
        asm("add %0, %1, #0\n\t"
            "add %0, %3\n\t"
            "lsl %0, #3\n\t"
            "add %0, %2\n\t"
            : "=r"(task):"r"(r4),"r"(gTasks),"r"(taskId));

        //gTasks[taskId].data[11] ^= 1;
        task->data[11] ^= 1;

        //if (gTasks[taskId].data[12] == 9)
        if (task->data[12] == 9)
        {
            shared19204.unk1920A_7 = 0;
            DestroyTask(taskId);
        }
    }
}

#define tBlendColor data[0]
#define tBlendCoeff data[1]

void sub_80B1EA8(s8 a, s8 b)
{
    u8 taskId = CreateTask(sub_80B1F4C, 10);
    u16 blendColor;
    u8 blendCoeff;
    u8 r3;

    if (a > 0)
    {
        blendColor = RGB(30, 27, 8);
        if (b > 0)
        {
            blendCoeff = 0;
            r3 = shared19204.unk19217 * 3;
        }
        else
        {
            blendCoeff = shared19204.unk19217 * 3;
            r3 = 0;
        }
    }
    else
    {
        blendColor = 0;
        if (b > 0)
        {
            blendCoeff = 0;
            r3 = 12;
        }
        else
        {
            blendCoeff = 12;
            r3 = 0;
        }
    }
    gTasks[taskId].tBlendColor = blendColor;
    gTasks[taskId].tBlendCoeff = blendCoeff;
    gTasks[taskId].data[2] = b;
    gTasks[taskId].data[3] = r3;
    shared19204.unk1920B_0 = 0;
}

void sub_80B1F4C(u8 taskId)
{
    if (gTasks[taskId].data[10]++ >= 0)
    {
        gTasks[taskId].data[10] = 0;
        if (gTasks[taskId].data[2] > 0)
            gTasks[taskId].tBlendCoeff++;
        else
            gTasks[taskId].tBlendCoeff--;
        BlendPalette(17, 1, gTasks[taskId].tBlendCoeff, gTasks[taskId].tBlendColor);
        BlendPalette(26, 1, gTasks[taskId].tBlendCoeff, gTasks[taskId].tBlendColor);
        if (gTasks[taskId].tBlendCoeff == gTasks[taskId].data[3])
        {
            DestroyTask(taskId);
            shared19204.unk1920B_0 = 0;
        }
    }
}

#undef tBlendColor
#undef tBlendCoeff

void sub_80B1FD0(bool8 a)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        if (shared19260_[i].unk10_6 != 0 && a)
        {
            CpuCopy32(
              sub_80B208C(i),
              (void *)(VRAM + 0x10000 + (gSprites[shared19338[i].unk1].oam.tileNum + 5) * 32),
              64);
            gSprites[shared19338[i].unk1].pos1.y = gUnknown_083CA33C[gUnknown_02038696[i]];
            gSprites[shared19338[i].unk1].invisible = FALSE;
        }
        else
        {
            gSprites[shared19338[i].unk1].invisible = TRUE;
        }
    }
}

// GetTurnNumberGfx
const u8 *sub_80B208C(u8 a)
{
    if (shared19260_[a].unk10_6 != 1)
        return gContestNextTurnRandomGfx;
    else
        return gContestNextTurnNumbersGfx + shared19260_[a].unk19 * 64;
}

void sub_80B20C4(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        if (shared192D0_.unkD[i] != 0 && !sub_80AF59C(i))
        {
            u8 r4 = gUnknown_02038696[i] * 5 + 2;
            u16 r0 = sub_80AEFE8(i, 3);

            *(u16 *)(VRAM + 0xC000 + r4 * 64 + 0x28) = r0;
            *(u16 *)(VRAM + 0xC000 + r4 * 64 + 0x2A) = r0 + 1;
            *(u16 *)(VRAM + 0xC000 + (r4 + 1) * 64 + 0x28) = r0 + 16;
            *(u16 *)(VRAM + 0xC000 + (r4 + 1) * 64 + 0x2A) = r0 + 17;
            PlaySE(SE_C_PASI);
        }
    }
}

bool8 sub_80B214C(u8 a)
{
    if (shared19260_[a].unk15_0 || shared19260_[a].unkC_0)
        return FALSE;
    else
        return TRUE;
}

void sub_80B2184(void)
{
    s32 i;

    ((vBgCnt *)&REG_BG1CNT)->priority = 0;
    ((vBgCnt *)&REG_BG1CNT)->screenSize = 1;
    ((vBgCnt *)&REG_BG1CNT)->areaOverflowMode = 0;

    gUnknown_030042C0 = DISPLAY_WIDTH;
    gUnknown_030041B4 = DISPLAY_HEIGHT;
    REG_BG1HOFS = DISPLAY_WIDTH;
    REG_BG1VOFS = DISPLAY_HEIGHT;

    DmaClear32(3, (void *)(VRAM + 0xF000), 0x1000);
    LZDecompressVram(gUnknown_08D17C3C, (void *)(VRAM + 0xF000));

    ((vBgCnt *)&REG_BG1CNT)->charBaseBlock = 0;

    for (i = 0; i < 4; i++)
    {
        gSprites[shared19338[i].unk0].oam.priority = 1;
        gSprites[shared19338[i].unk1].oam.priority = 1;
    }

    ((vBgCnt *)&REG_BG2CNT)->priority = 1;
    ((vBgCnt *)&REG_BG0CNT)->priority = 1;
    ((vBgCnt *)&REG_BG1CNT)->screenSize = 2;
}

void sub_80B2280(void)
{
    s32 i;

    DmaClearLarge32(3, (void *)(VRAM + 0x8000), 0x2000, 0x1000);
    DmaClear32(3, (void *)(VRAM + 0xF000), 0x1000);

    gUnknown_030042C0 = 0;
    gUnknown_030041B4 = 0;

    ((vBgCnt *)&REG_BG1CNT)->priority = 1;
    ((vBgCnt *)&REG_BG1CNT)->screenSize = 0;
    ((vBgCnt *)&REG_BG1CNT)->areaOverflowMode = 0;
    ((vBgCnt *)&REG_BG1CNT)->charBaseBlock = 2;

    for (i = 0; i < 4; i++)
    {
        gSprites[shared19338[i].unk0].oam.priority = 0;
        gSprites[shared19338[i].unk1].oam.priority = 0;
    }
}

void sub_80B237C(u8 taskId)
{
    gUnknown_030042C0 = 0;
    gUnknown_030041B4 = DISPLAY_HEIGHT;
    PlaySE12WithPanning(SE_C_MAKU_D, 0);
    gTasks[taskId].func = sub_80B23BC;
}

void sub_80B23BC(u8 taskId)
{
    gUnknown_030041B4 -= 7;
    if (gUnknown_030041B4 < 0)
        gUnknown_030041B4 = 0;
    if (*(u16 *)&gUnknown_030041B4 == 0)  // Why cast?
    {
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].data[2] = 0;
        gTasks[taskId].func = sub_80B2400;
    }
}

void sub_80B2400(u8 taskId)
{
    s32 i;

    switch (gTasks[taskId].data[0])
    {
    case 0:
        for (i = 0; i < 4; i++)
            shared19204.unk19218[i] = gUnknown_02038696[i];
        sub_80AFA5C();
        sub_80B0588();
        sub_80AEF50();
        sub_80B1118();
        sub_80B1FD0(TRUE);
        sub_80AFFA0();
        gTasks[taskId].data[0] = 1;
        break;
    case 1:
        if (gIsLinkContest & 1)
        {
            u8 taskId2;

            shared19204.unk1920B_2 = 1;
            if (sub_80AE074())
                sub_80AF438();
            taskId2 = CreateTask(sub_80C8C80, 0);
            SetTaskFuncWithFollowupFunc(taskId2, sub_80C8C80, sub_80AD8DC);
            sub_80AF860();
            gTasks[taskId].data[0] = 2;
        }
        else
        {
            sub_80AF438();
            gTasks[taskId].data[0] = 3;
        }
        break;
    case 2:
        if (!shared19204.unk1920B_2)
            gTasks[taskId].data[0] = 3;
        break;
    case 3:
        sub_80AF120();
        sub_80AEB30();
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = sub_80B253C;
        break;
    }
}

void sub_80B2508(u8 taskId)
{
    gUnknown_030041B4 += 7;
    if (gUnknown_030041B4 > DISPLAY_HEIGHT)
        gTasks[taskId].func = sub_80ADCDC;
}

void sub_80B253C(u8 taskId)
{
    if (gTasks[taskId].data[2] < 10)
    {
        gTasks[taskId].data[2]++;
    }
    else
    {
        if (gTasks[taskId].data[1] == 0)
        {
            if (gTasks[taskId].data[0] == 16)
                gTasks[taskId].data[1]++;
            else
                gTasks[taskId].data[0]++;
        }
        else
        {
            if (gTasks[taskId].data[0] == 0)
            {
                gTasks[taskId].data[1] = 0;
                gTasks[taskId].data[2] = 0;
                gTasks[taskId].func = sub_80B25A4;
            }
            else
            {
                gTasks[taskId].data[0]--;
            }
        }
    }
}

void sub_80B25A4(u8 taskId)
{
    if (gTasks[taskId].data[2] < 10)
    {
        gTasks[taskId].data[2]++;
    }
    else
    {
        gTasks[taskId].data[2] = 0;
        PlaySE12WithPanning(SE_C_MAKU_U, 0);
        gTasks[taskId].func = sub_80B2508;
    }
}

void sub_80B25E4(u8 a)
{
    s32 i;
    u8 taskId;

    for (i = 0; i < 4; i++)
    {
        gSprites[shared19338[i].unk0].oam.matrixNum = AllocOamMatrix();
        gSprites[shared19338[i].unk0].oam.affineMode = 1;
        StartSpriteAffineAnim(&gSprites[shared19338[i].unk0], a);
        if (a == 2)
        {
            AnimateSprite(&gSprites[shared19338[i].unk0]);
            gSprites[shared19338[i].unk0].invisible = FALSE;
        }
    }
    taskId = CreateTask(sub_80B26C8, 5);
    gTasks[taskId].data[0] = a;
    shared19204.unk1920B_1 = 1;
}

void sub_80B26C8(u8 taskId)
{
    s32 i;

    if (gSprites[shared19338[0].unk0].affineAnimEnded)
    {
        if ((u8)gTasks[taskId].data[0] == 1)
        {
            for (i = 0; i < 4; i++)
                gSprites[shared19338[i].unk0].invisible = TRUE;
        }
        for (i = 0; i < 4; i++)
            FreeSpriteOamMatrix(&gSprites[shared19338[i].unk0]);
        shared19204.unk1920B_1 = 0;
        DestroyTask(taskId);
    }
}

// SanitizeMove
u16 sub_80B2760(u16 a)
{
    if (a > 354)
        a = 1;
    return a;
}

// SanitizeSpecies
u16 sub_80B2778(u16 species)
{
    if (species >= NUM_SPECIES)
        species = SPECIES_NONE;
    return species;
}

void sub_80B2790(u8 a)
{
    s32 i;
    u16 r5 = sub_80B2760(shared19260_[a].unk6);
    u16 r7 = sub_80B2778(gContestMons[a].species);
    u8 r5_2;

    memset(&shared19348_, 0, sizeof(shared19348_));
    battle_anim_clear_some_data();
    for (i = 0; i < 4; i++)
        gBattleMonForms[i] = 0;
    switch (r5)
    {
    case 0xAE:
        if (gBaseStats[r7].type1 == 7 || gBaseStats[r7].type2 == 7)
            gUnknown_0202F7C4 = 0;
        else
            gUnknown_0202F7C4 = 1;
        break;
    case 0x90:
    case 0x110:
        r5_2 = shared19260_[a].unk1B;
        shared19348_.unk2 = sub_80B2778(gContestMons[r5_2].species);
        shared19348_.unk10 = gContestMons[r5_2].personality;
        shared19348_.unk4_0 = 1;
        break;
    case 0xD8:
        gHappinessMoveAnim = 0xFF;
        break;
    case 0xDA:
        gHappinessMoveAnim = 0;
        break;
    case 0x4C:
    case 0xD:
    case 0x82:
    case 0x8F:
        if (shared19204.unk1925E == 0)
        {
            shared19204.unk1925E = 2;
            gUnknown_0202F7C4 = 0;
        }
        else
        {
            gUnknown_0202F7C4 = 1;
        }
        break;
    }
    sub_80B2968();
}

void sub_80B28CC(int unused)
{
    memset(&shared19348_, 0, sizeof(shared19348_));
    if (shared19204.unk1925E != 0)
        shared19204.unk1925E--;
}

void sub_80B28F0(u8 a)
{
    shared19348_.unk5 = a;
    shared19348_.unk0 = sub_80B2778(gContestMons[a].species);
    shared19348_.unk8 = gContestMons[a].personality;
    shared19348_.unkC = gContestMons[a].otId;
}

void sub_80B292C(void)
{
    gObjectBankIDs[3] = CreateInvisibleSpriteWithCallback(SpriteCallbackDummy);
    InitSpriteAffineAnim(&gSprites[gObjectBankIDs[gBankTarget]]);
    sub_80B2968();
}

void sub_80B2968(void)
{
    struct Sprite *sprite = &gSprites[gObjectBankIDs[3]];

    sprite->pos2.x = 0;
    sprite->pos2.y = 0;
    sprite->pos1.x = sub_8077ABC(3, 0);
    sprite->pos1.y = sub_8077ABC(3, 1);
    sprite->invisible = TRUE;
}

void sub_80B29B4(u16 a)
{
    switch (gBattleMoves[a].target)
    {
    case F_TARGET_UNK2:
    case F_TARGET_USER:
        gBankTarget = 2;
        break;
    case F_TARGET_SELECTED_POKEMON:
    case F_TARGET_RANDOM:
    case F_TARGET_BOTH_ENEMIES:
    case F_TARGET_ALL_EXCEPT_USER:
    default:
        gBankTarget = 3;
        break;
    }
}

// SaveContestWinner
bool8 sub_80B2A7C(u8 a)
{
    s32 i;
    u8 r7 = Random() % 3;

    for (i = 0; i < 3; i++)
    {
        if (gUnknown_02038690[i] == 0)
            break;
    }
    if (a == 0xFF && i != gContestPlayerMonIndex)
        return FALSE;
    switch (gScriptContestCategory)
    {
    case 0:
        r7 += 0;
        break;
    case 1:
        r7 += 3;
        break;
    case 2:
        r7 += 6;
        break;
    case 3:
        r7 += 9;
        break;
    case 4:
        r7 += 12;
        break;
    }
    if (a != 0xFE)
    {
        u8 r4 = sub_80B2C4C(a, 1);

        gSaveBlock1.contestWinners[r4].personality = gContestMons[i].personality;
        gSaveBlock1.contestWinners[r4].species = gContestMons[i].species;
        gSaveBlock1.contestWinners[r4].otId = gContestMons[i].otId;
        StringCopy(gSaveBlock1.contestWinners[r4].nickname, gContestMons[i].nickname);
        StringCopy(gSaveBlock1.contestWinners[r4].trainerName, gContestMons[i].trainerName);
        if (a != 0xFF)
            gSaveBlock1.contestWinners[r4].contestCategory = gScriptContestCategory;
        else
            gSaveBlock1.contestWinners[r4].contestCategory = r7;
    }
    else
    {
        shared15DE0.personality = gContestMons[i].personality;
        shared15DE0.otId = gContestMons[i].otId;
        shared15DE0.species = gContestMons[i].species;
        StringCopy(shared15DE0.nickname, gContestMons[i].nickname);
        if (gIsLinkContest & 1)
            StringCopy(shared15DE0.trainerName, gLinkPlayers[i].name);
        else
            StringCopy(shared15DE0.trainerName, gContestMons[i].trainerName);
        shared15DE0.contestCategory = r7;
    }
    return TRUE;
}

u8 sub_80B2C4C(u8 a, u8 b)
{
    s32 i;
    
    switch (a)
    {
    case 0:
    case 1:
        return a;
    case 2:
        if (b != 0)
        {
            for (i = 4; i >= 3; i--)
                memcpy(&gSaveBlock1.contestWinners[i], &gSaveBlock1.contestWinners[i - 1], sizeof(struct ContestWinner));
        }
        return 2;
    case 3:
        if (b != 0)
        {
            for (i = 7; i >= 6; i--)
                memcpy(&gSaveBlock1.contestWinners[i], &gSaveBlock1.contestWinners[i - 1], sizeof(struct ContestWinner));
        }
        return 5;
    default:
        switch (gScriptContestCategory)
        {
        case 0:
            return 8;
        case 1:
            return 9;
        case 2:
            return 10;
        case 3:
            return 11;
        case 4:
        default:
            return 12;
        }
    }
}

void sub_80B2D1C(void)
{
    s32 i;
    
    for (i = 0; i < 8; i++)
        gSaveBlock1.contestWinners[i] = gUnknown_083CC5D0[i];
}
