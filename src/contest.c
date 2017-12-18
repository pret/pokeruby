#include "global.h"
#include "constants/items.h"
#include "constants/map_objects.h"
#include "constants/songs.h"
#include "constants/species.h"
#include "battle_anim.h"
#include "contest.h"
#include "contest_link_80C857C.h"
#include "data2.h"
#include "decompress.h"
#include "ewram.h"
#include "graphics.h"
#include "link.h"
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
    /*0x1920A*/ u16 unk1920A_0:4;
                u16 unk1920A_4:1;
                u16 unk1920A_5:1;
                u16 unk1920A_6:1;
                u16 unk1920A_7:1;
    /*0x1920B*/ u16 unk1920B_0:1;
                u16 unk1920B_1:1;
                u16 unk1920B_2:1;
    /*0x1920C*/ u8 unk1920C;
    /*0x1920D*/ u8 filler1920D[0x14-0xD];
    /*0x19214*/ u8 unk19214;
    /*0x19215*/ u8 unk19215;
    /*0x19216*/ u8 unk19216;
    /*0x19217*/ s8 unk19217;
    /*0x19218*/ u8 unk19218[4];
    /*0x1921C*/ u32 unk1921C;
                u8 filler19220[0x5D-0x20];
    /*0x1925D*/ u8 unk1925D;
    /*0x1925E*/ u8 unk1925E;
    /*0x1925F*/ u8 filler1925F;
};

struct UnknownContestStruct1
{
    u8 filler0[2];
    u16 unk2;  // s16?
    u16 unk4;
    u16 unk6;  // move
    u16 unk8;
    u8 unkA;   // contest category
    /*
    u8 unkB_0:2;
    u8 unkB_2:1;
    u8 unkB_3:4;
    u8 unkB_7:1;
    */
    u8 unkB;
    /*
    u8 unkC_0:1;
    u8 unkC_1:1;
    u8 unkC_2:1;
    */
    u8 unkC;
    s8 unkD;
    u8 unkE;
    u8 unkF;
    u8 unk10_0:2;
    u8 unk10_2:2;
    u8 unk10_4:2;  // definitely a bitfield
    u8 unk11;
    u8 unk12;
    u8 unk13;
    u8 unk14;
    u8 unk15_0:1;  // Is this a bitfield or not? sub_80ABCDC says no.
    u8 unk15_1:3;
    u8 unk15_4:1;
    u8 unk15_5:1;
    u8 unk15_6:1;
    u8 unk16;
    u8 unk17;
    u8 unk18;
    u8 unk19;
    u8 unk1A;
    u8 filler1B;
};

struct UnknownContestStruct3
{
    u8 filler0[2];
    //u8 unk2_0:1;
    //u8 unk2_1:1;
    u8 unk2;  // maybe a bitfield
    u8 filler3;
};

// possibly the same as UnknownContestStruct3?
struct UnknownContestStruct4
{
    u8 filler0[2];
    u8 unk2;  // maybe a bitfield
    u8 filler3;
};

/*
struct UnknownContestStruct5_alt
{
    u8 bits_0;
    u8 unk1;
    s8 unk2;
    u8 filler3;
};
*/

struct UnknownContestStruct5
{
    u16 bits_0:8;
    u16 bits_8:1;
    u16 bits_9:3;
    u16 bits_C:4;
    s8 unk2;
    u8 filler3;
};

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

#define shared15800 (gSharedMem + 0x15800)
#define shared18000 (*(struct Shared18000 *)(gSharedMem + 0x18000))
#define shared19204 (*(struct Shared19204 *)(gSharedMem + 0x19204))
#define shared19260 (*(struct Shared19260 *)(gSharedMem + 0x19260))

// These are separate structs because sub_80AC2CC requires that to match.
#define shared19260_ ((struct UnknownContestStruct1 *)(gSharedMem + 0x19260))
#define shared192D0 (gSharedMem + 0x192D0)
#define shared19328 (*(struct UnknownContestStruct5 *)(gSharedMem + 0x19328))
#define shared19338 ((struct UnknownContestStruct4 *)(gSharedMem + 0x19338))
#define shared19348 ((struct UnknownContestStruct3 *)(gSharedMem + 0x19348))

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

extern u16 gUnknown_02038680[];
extern u8 gUnknown_02038694;
extern u8 gUnknown_02038696[];
extern u8 gUnknown_0203869B;
extern u16 gUnknown_02038670[];
extern struct SpriteTemplate gUnknown_02024E8C;

#define gContestOpponents gUnknown_083C9408
extern const struct ContestPokemon gContestOpponents[60];
extern const u8 gUnknown_083CA308[][2];
extern const u8 gUnknown_083CA310[][2];
extern const struct CompressedSpriteSheet gUnknown_083CA4BC;
extern const struct SpriteTemplate gSpriteTemplate_83CA4A4;
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
extern const u8 gUnknown_083CC075[];
extern const u8 gUnknown_083CC0A0[];
extern const u8 gUnknown_083CC0BC[];
extern const u8 gUnknown_083CC0E3[];
extern const u8 gUnknown_083CC103[];
extern const u8 gUnknown_083CC14A[];
extern const u8 gUnknown_083CC16E[];
extern const u8 *const gUnknown_083CC2D8[];
extern const u8 *const gUnknown_083CC330[];
extern const u8 gUnknownText_UnknownFormatting2[];
extern const u8 gUnknownText_UnknownFormatting3[];
extern const u8 gUnknown_083CB02C[];
extern const u8 *const gUnknown_083CB2F0[];
extern const u8 gUnknown_083CC59C[];
extern const u8 gUnknown_083CC5A2[];


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
void sub_80AF2FC(void);
void sub_80AF3C0(void);
u8 sub_80AF59C(u8);
void sub_80AF860(void);
void sub_80AFA5C(void);
void sub_80AFBA0(s16, s16, u8);
void sub_80AFE30(void);
void sub_80AFF10(void);
u8 sub_80AFF28(void);
void sub_80AFFE0(u8);
void sub_80B0034(void);
void sub_80B00C8(void);
void nullsub_18();
void sub_80B0324(void);
void sub_80B03A8(u8);
void sub_80B0518(void);
void sub_80B09B0();
u8 sub_80B09E4();
void sub_80B0BC4();
void sub_80B0CDC(u8, int);
void sub_80B0D7C(void);
void sub_80B1118(void);
void sub_80B114C(u8);
void sub_80B146C(u8, u8);
void sub_80B159C(void);
void sub_80B1710();
void sub_80B1928(void);
void sub_80B1B14(void);
void sub_80B1BDC(void);
void sub_80B1CBC();
void sub_80B1DDC(void);
void sub_80B1EA8(s8, s8);
void sub_80B1FD0();
void sub_80B20C4(void);
u8 sub_80B214C(u8);
void sub_80B2184(void);
void sub_80B2280(void);
void sub_80B237C(u8);
void sub_80B25E4();
u16 sub_80B2760();
u16 sub_80B2778(u16);
void sub_80B2790();
void sub_80B28CC();
void sub_80B28F0();
void sub_80B292C(void);
void sub_80B29B4();


void nullsub_89(u8 taskId)
{
}

void ResetLinkContestBoolean(void)
{
    gIsLinkContest = FALSE;
}

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

// Can't figure out whether bitfields were used or not
#ifdef NONMATCHING
void sub_80AB398(void)
{
    s32 i;

    memset(&shared19204, 0, sizeof(shared19204));  // TODO: How is this struct divided?
    for (i = 0; i < 4; i++)
        shared19204.unk19206[i] = 0xFF;
    for (i = 0; i < 4; i++)
        memset(&shared19260.unk19260[i], 0, sizeof(shared19260.unk19260[i]));
    for (i = 0; i < 4; i++)
    {
        /*
        shared19260.unk19260[i].unkB &= ~3;
        shared19260.unk19260[i].unk13 = 0xFF;
        shared19260.unk19260[i].unk14 = 0xFF;
        */
        shared19260_[i].unkB &= ~3;
        shared19260_[i].unk13 = 0xFF;
        shared19260_[i].unk14 = 0xFF;
    }
    memset(&shared19260.unk192D0, 0, sizeof(shared19260.unk192D0));
    memset(&shared19260.unk192E4, 0, sizeof(shared19260.unk192E4));
    memset(&shared19260.unk19328, 0, sizeof(shared19260.unk19328));
    memset(&shared19260.unk19338, 0, sizeof(shared19260.unk19338));
    if (!(gIsLinkContest & 1))  // wat?
        sub_80B0F28(0);
    for (i = 0; i < 4; i++)
    {
        shared19260.unk19260[i].unk19 = 0xFF;
        shared19204.unk19218[i] = gUnknown_02038696[i];
    }
    sub_80B159C();
}
#else
__attribute__((naked))
void sub_80AB398(void)
{
    asm(".syntax unified\n\
	push {r4-r6,lr}\n\
	ldr r4, _080AB468 @ =gSharedMem + 0x19204\n\
	adds r0, r4, 0\n\
	movs r1, 0\n\
	movs r2, 0x5C\n\
	bl memset\n\
	movs r5, 0\n\
	adds r4, 0x2\n\
	movs r2, 0xFF\n\
_080AB3AC:\n\
	adds r1, r5, r4\n\
	ldrb r0, [r1]\n\
	orrs r0, r2\n\
	strb r0, [r1]\n\
	adds r5, 0x1\n\
	cmp r5, 0x3\n\
	ble _080AB3AC\n\
	ldr r4, _080AB46C @ =gSharedMem + 0x19260\n\
	movs r5, 0x3\n\
_080AB3BE:\n\
	adds r0, r4, 0\n\
	movs r1, 0\n\
	movs r2, 0x1C\n\
	bl memset\n\
	adds r4, 0x1C\n\
	subs r5, 0x1\n\
	cmp r5, 0\n\
	bge _080AB3BE\n\
	ldr r4, _080AB470 @ =gSharedMem + 0x192D0\n\
	movs r6, 0x4\n\
	negs r6, r6\n\
	movs r3, 0xFF\n\
	adds r2, r4, 0\n\
	subs r2, 0x65\n\
	movs r5, 0x3\n\
_080AB3DE:\n\
	ldrb r1, [r2]\n\
	adds r0, r6, 0\n\
	ands r0, r1\n\
	strb r0, [r2]\n\
	ldrb r0, [r2, 0x8]\n\
	orrs r0, r3\n\
	strb r0, [r2, 0x8]\n\
	ldrb r0, [r2, 0x9]\n\
	orrs r0, r3\n\
	strb r0, [r2, 0x9]\n\
	adds r2, 0x1C\n\
	subs r5, 0x1\n\
	cmp r5, 0\n\
	bge _080AB3DE\n\
	adds r0, r4, 0\n\
	movs r1, 0\n\
	movs r2, 0x14\n\
	bl memset\n\
	adds r0, r4, 0\n\
	adds r0, 0x14\n\
	movs r1, 0\n\
	movs r2, 0x44\n\
	bl memset\n\
	adds r0, r4, 0\n\
	adds r0, 0x58\n\
	movs r1, 0\n\
	movs r2, 0x4\n\
	bl memset\n\
	adds r0, r4, 0\n\
	adds r0, 0x68\n\
	movs r1, 0\n\
	movs r2, 0x10\n\
	bl memset\n\
	ldr r0, _080AB474 @ =gIsLinkContest\n\
	ldrb r1, [r0]\n\
	movs r0, 0x1\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _080AB43A\n\
	movs r0, 0\n\
	bl sub_80B0F28\n\
_080AB43A:\n\
	movs r5, 0\n\
	movs r6, 0xFF\n\
	adds r3, r4, 0\n\
	subs r3, 0xB8\n\
	adds r2, r4, 0\n\
	subs r2, 0x57\n\
	ldr r4, _080AB478 @ =gUnknown_02038696\n\
_080AB448:\n\
	ldrb r0, [r2]\n\
	orrs r0, r6\n\
	strb r0, [r2]\n\
	adds r1, r3, r5\n\
	adds r0, r5, r4\n\
	ldrb r0, [r0]\n\
	strb r0, [r1]\n\
	adds r2, 0x1C\n\
	adds r5, 0x1\n\
	cmp r5, 0x3\n\
	ble _080AB448\n\
	bl sub_80B159C\n\
	pop {r4-r6}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080AB468: .4byte gSharedMem + 0x19204\n\
_080AB46C: .4byte gSharedMem + 0x19260\n\
_080AB470: .4byte gSharedMem + 0x192D0\n\
_080AB474: .4byte gIsLinkContest\n\
_080AB478: .4byte gUnknown_02038696\n\
    .syntax divided\n");
}
#endif

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
    if (sub_80AF59C(gContestPlayerMonIndex) == 0)
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
        if (sub_80AF59C(gContestPlayerMonIndex) == 0)
        {
            sub_80AFFE0(1);
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
         && sub_80B214C(gContestPlayerMonIndex) != 0
         && AreMovesContestCombo(shared19260_[gContestPlayerMonIndex].unk8, r4)
         && shared19260_[gContestPlayerMonIndex].unk15_4)
        {
            r5 = StringCopy(sp8, gUnknownText_UnknownFormatting2);
        }
        //_080ABDA0
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
            sub_80AFFE0(0);
            FillWindowRect_DefaultPalette(
              &gUnknown_03004210,
              0,
              gUnknown_083CA340[0][0],
              gUnknown_083CA340[0][1],
              gUnknown_083CA340[0][2],
              gUnknown_083CA340[0][3]);
            if (sub_80AF59C(gContestPlayerMonIndex) == 0)
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
        sub_80AFFE0(0);
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
    sub_80AFFE0(0);
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
        for (r6 = 0; shared19204.unk19214 != shared192D0[r6]; r6++)
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
        if ((shared19260_[r7].unkC & 6)
         || (shared19260_[r7].unkB & 0x80))
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
        memset(shared19348, 0, 20);
        sub_80B28F0(shared19204.unk19215);
        spriteId = sub_80AE9FC(
          gContestMons[shared19204.unk19215].species,
          gContestMons[shared19204.unk19215].otId,
          gContestMons[shared19204.unk19215].personality);
        gSprites[spriteId].pos2.x = 120;
        gSprites[spriteId].callback = sub_80AD8FC;
        gTasks[taskId].data[2] = spriteId;
        gObjectBankIDs[gBankAttacker] = spriteId;
        sub_80B0BC4(sub_80B09E4(shared19204.unk19215), 0);
        gTasks[taskId].data[0] = 4;
        return;
    case 4:
        spriteId = gTasks[taskId].data[2];
        if (gSprites[spriteId].callback == SpriteCallbackDummy)
        {
            if (!(shared19338[r7].unk2 & 2))
                gTasks[taskId].data[0] = 5;
        }
        return;
    case 5:
        if (shared19260_[r7].unkC & 1)
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
        if ((shared19260_[r7].unk11 & 3) == 1)
        {
            sub_80B1710(5);
        }
        else if ((shared19260_[r7].unk11 & 3) == 2)
        {
            sub_80B1710(6);
        }
        else if ((shared19260_[r7].unk11 & 3) == 3)
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
        sub_80B1FD0(1);
        gTasks[taskId].data[0] = 12;
        return;
    case 12:
        sub_80AFBA0(0, shared19260_[r7].unk2, r7);
        gTasks[taskId].data[0] = 13;
        return;
    case 13:
        if (!(shared19338[shared19204.unk19215].unk2 & 4))
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
        if (!(shared19338[r6].unk2 & 4))
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
            if ((shared19260_[r7].unkC & 6)
             || (shared19260_[r7].unk11 & 4))
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
        if (!(shared19338[r7].unk2 & 4))
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
            sub_80B1710();
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
        if (!(shared19338[r7].unk2 & 4))
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
            if (shared19260_[r7].unk11 & 0x10)
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
            if (!(shared19338[r7].unk2 & 4))
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
        if (!(shared19338[r7].unk2 & 4))
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
        //_080AD9E8
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
    sub_80B1FD0(0);
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
    if (sub_80AFF28() != 0)
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
    if (sub_80AFF28() != 0)
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
    sub_80AFFE0(0);
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
    if (category == 0)
        categoryTile = 0x4040;
    else if (category == 1)
        categoryTile = 0x4045;
    else if (category == 2)
        categoryTile = 0x404A;
    else if (category == 3)
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

    if (sub_80AF59C(b) == 0 && a != 0)
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

u16 sub_80AEFE8(int unused, u8 b)
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

    if (shared19260_[a].unk10_0 != 0 || shared19260_[a].unk12 != 0 || shared19260_[a].unkF != 0)
        r4 = sub_80AEFE8(a, 0);
    else if (shared19260_[a].unkC & 1)
        r4 = sub_80AEFE8(a, 1);
    else if ((shared19260_[a].unkC & 6) || (shared19260_[a].unkB & 0x80))
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
    if (sub_80AF59C(a) != 0)
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
