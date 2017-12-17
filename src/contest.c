#include "global.h"
#include "constants/items.h"
#include "constants/songs.h"
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
#if 1
    /*0x1920A*/ u16 unk1920A_0:4;  // probably a bitfield
                u16 unk1920A_4:1;
                u16 unk1920A_5:1;
                u16 unk1920A_6:1;
                u16 unk1920A_7:2;
                u16 unk1920B_1:1;
                u16 unk1920B_2:1;  // definitely a bitfield
#else
    /*0x1920A*/ u8 unk1920A;
    /*0x1920B*/ u8 unk1920B;
#endif
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
    u8 fillerD;
    u8 unkE;
    u8 fillerF;
    u8 unk10;  // maybe a bitfield
    u8 unk11;
    u8 filler12;
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

struct UnknownContestStruct5_alt
{
    u8 bits_0;
    u8 unk1;
    s8 unk2;
    u8 filler3;
};

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
extern u8 gUnknown_02038696[];
extern u8 gUnknown_0203869B;

extern const u8 gUnknown_083CAF84[];
extern const u8 gUnknown_083CAFAE[];
extern const struct ContestMove gContestMoves[];
extern const u8 gUnknownText_UnknownFormatting2[];
extern const u8 gUnknownText_UnknownFormatting3[];
extern const u8 gUnknown_083CB02C[];
extern const u8 *const gUnknown_083CB2F0[];

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
u8 sub_80AE858(void);
u8 sub_80AE8B4(void);
u8 sub_80AE9FC();
void sub_80AEB30(void);
void sub_80AEBEC(u16);
void sub_80AED58(void);
u8 sub_80AEE54(u8, u8);
u8 sub_80AF038(u8);
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
/*
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
        shared19260.unk19260[i].unkB &= ~3;
        shared19260.unk19260[i].unk13 = 0xFF;
        shared19260.unk19260[i].unk14 = 0xFF;
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
*/

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
        //if (shared19204.unk1920A & 0x40)
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

#ifdef NONMATCHING
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

        if (shared19260.unk19260[gContestPlayerMonIndex].unk8 != 0
         && sub_80B214C(gContestPlayerMonIndex) != 0
         && AreMovesContestCombo(shared19260.unk19260[gContestPlayerMonIndex].unk8, r4)
         && shared19260.unk19260[gContestPlayerMonIndex].unk15_4)
        {
            r5 = StringCopy(sp8, gUnknownText_UnknownFormatting2);
        }
        //_080ABDA0
        else if (r4 != 0
         && shared19260.unk19260[gContestPlayerMonIndex].unk8 == r4
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
#else
__attribute__((naked))
void sub_80ABCDC(u8 taskId)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
	mov r7, r10\n\
	mov r6, r9\n\
	mov r5, r8\n\
	push {r5-r7}\n\
	sub sp, 0x2C\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	str r0, [sp, 0x28]\n\
	ldr r0, _080ABD80 @ =gUnknown_030042A0\n\
	movs r1, 0xA0\n\
	strh r1, [r0]\n\
	ldr r0, _080ABD84 @ =gUnknown_03004280\n\
	strh r1, [r0]\n\
	ldr r5, _080ABD88 @ =gUnknown_03004210\n\
	ldr r4, _080ABD8C @ =gUnknown_083CA340\n\
	ldrb r2, [r4]\n\
	ldrb r3, [r4, 0x1]\n\
	ldrb r0, [r4, 0x2]\n\
	str r0, [sp]\n\
	ldrb r0, [r4, 0x3]\n\
	str r0, [sp, 0x4]\n\
	adds r0, r5, 0\n\
	movs r1, 0\n\
	bl FillWindowRect_DefaultPalette\n\
	movs r6, 0\n\
	ldr r0, _080ABD90 @ =gContestPlayerMonIndex\n\
	mov r8, r0\n\
	ldr r7, _080ABD94 @ =gSharedMem + 0x19260\n\
	mov r9, r5\n\
	mov r10, r4\n\
_080ABD1C:\n\
	lsls r1, r6, 1\n\
	mov r3, r8\n\
	ldrb r2, [r3]\n\
	lsls r0, r2, 6\n\
	adds r1, r0\n\
	ldr r0, _080ABD98 @ =gUnknown_0203858E\n\
	adds r1, r0\n\
	ldrh r4, [r1]\n\
	add r5, sp, 0x8\n\
	lsls r0, r2, 3\n\
	subs r0, r2\n\
	lsls r0, 2\n\
	adds r0, r7\n\
	ldrh r0, [r0, 0x8]\n\
	cmp r0, 0\n\
	beq _080ABDA0\n\
	adds r0, r2, 0\n\
	bl sub_80B214C\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	beq _080ABDA0\n\
	mov r2, r8\n\
	ldrb r1, [r2]\n\
	lsls r0, r1, 3\n\
	subs r0, r1\n\
	lsls r0, 2\n\
	adds r0, r7\n\
	ldrh r0, [r0, 0x8]\n\
	adds r1, r4, 0\n\
	bl AreMovesContestCombo\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	beq _080ABDA0\n\
	mov r3, r8\n\
	ldrb r1, [r3]\n\
	lsls r0, r1, 3\n\
	subs r0, r1\n\
	lsls r0, 2\n\
	adds r0, r7\n\
	ldrb r1, [r0, 0x15]\n\
	movs r0, 0x10\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080ABDA0\n\
	add r0, sp, 0x8\n\
	ldr r1, _080ABD9C @ =gUnknownText_UnknownFormatting2\n\
	b _080ABDC6\n\
	.align 2, 0\n\
_080ABD80: .4byte gUnknown_030042A0\n\
_080ABD84: .4byte gUnknown_03004280\n\
_080ABD88: .4byte gUnknown_03004210\n\
_080ABD8C: .4byte gUnknown_083CA340\n\
_080ABD90: .4byte gContestPlayerMonIndex\n\
_080ABD94: .4byte gSharedMem + 0x19260\n\
_080ABD98: .4byte gUnknown_0203858E\n\
_080ABD9C: .4byte gUnknownText_UnknownFormatting2\n\
_080ABDA0:\n\
	cmp r4, 0\n\
	beq _080ABDCC\n\
	mov r1, r8\n\
	ldrb r0, [r1]\n\
	lsls r1, r0, 3\n\
	subs r1, r0\n\
	lsls r1, 2\n\
	adds r1, r7\n\
	ldrh r0, [r1, 0x8]\n\
	cmp r0, r4\n\
	bne _080ABDCC\n\
	ldr r0, _080ABE74 @ =gContestMoves\n\
	lsls r1, r4, 3\n\
	adds r1, r0\n\
	ldrb r0, [r1]\n\
	cmp r0, 0x3\n\
	beq _080ABDCC\n\
	add r0, sp, 0x8\n\
	ldr r1, _080ABE78 @ =gUnknownText_UnknownFormatting3\n\
_080ABDC6:\n\
	bl StringCopy\n\
	adds r5, r0, 0\n\
_080ABDCC:\n\
	movs r0, 0xD\n\
	adds r1, r4, 0\n\
	muls r1, r0\n\
	ldr r0, _080ABE7C @ =gMoveNames\n\
	adds r1, r0\n\
	adds r0, r5, 0\n\
	bl StringCopy\n\
	lsls r1, r6, 2\n\
	adds r2, r1, r6\n\
	lsls r2, 18\n\
	movs r3, 0xC2\n\
	lsls r3, 18\n\
	adds r2, r3\n\
	lsrs r2, 16\n\
	mov r3, r10\n\
	adds r0, r1, r3\n\
	ldrb r3, [r0]\n\
	lsls r3, 3\n\
	adds r3, 0x4\n\
	lsls r3, 24\n\
	lsrs r3, 24\n\
	ldr r0, _080ABE80 @ =gUnknown_083CA340 + 0x1\n\
	adds r1, r0\n\
	ldrb r0, [r1]\n\
	lsls r0, 3\n\
	str r0, [sp]\n\
	movs r0, 0x1\n\
	str r0, [sp, 0x4]\n\
	mov r0, r9\n\
	add r1, sp, 0x8\n\
	bl sub_8002E4C\n\
	mov r0, r9\n\
	bl sub_8002F44\n\
	adds r0, r6, 0x1\n\
	lsls r0, 24\n\
	lsrs r6, r0, 24\n\
	cmp r6, 0x3\n\
	bhi _080ABE20\n\
	b _080ABD1C\n\
_080ABE20:\n\
	ldr r1, _080ABE84 @ =0x0000ffff\n\
	ldr r3, _080ABE88 @ =0x00002d9f\n\
	movs r0, 0x48\n\
	str r0, [sp]\n\
	movs r0, 0\n\
	movs r2, 0xC\n\
	bl sub_814A5C0\n\
	ldr r4, _080ABE8C @ =gSharedMem + 0x19204\n\
	movs r0, 0\n\
	ldrsb r0, [r4, r0]\n\
	bl sub_80AC0AC\n\
	ldr r2, _080ABE90 @ =gContestMons\n\
	ldrb r1, [r4]\n\
	lsls r1, 1\n\
	ldr r0, _080ABE94 @ =gContestPlayerMonIndex\n\
	ldrb r0, [r0]\n\
	lsls r0, 6\n\
	adds r1, r0\n\
	adds r2, 0x1E\n\
	adds r1, r2\n\
	ldrh r0, [r1]\n\
	bl sub_80AEBEC\n\
	ldr r1, _080ABE98 @ =gTasks\n\
	ldr r2, [sp, 0x28]\n\
	lsls r0, r2, 2\n\
	adds r0, r2\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	ldr r1, _080ABE9C @ =sub_80ABEA0\n\
	str r1, [r0]\n\
	add sp, 0x2C\n\
	pop {r3-r5}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	mov r10, r5\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080ABE74: .4byte gContestMoves\n\
_080ABE78: .4byte gUnknownText_UnknownFormatting3\n\
_080ABE7C: .4byte gMoveNames\n\
_080ABE80: .4byte gUnknown_083CA340 + 0x1\n\
_080ABE84: .4byte 0x0000ffff\n\
_080ABE88: .4byte 0x00002d9f\n\
_080ABE8C: .4byte gSharedMem + 0x19204\n\
_080ABE90: .4byte gContestMons\n\
_080ABE94: .4byte gContestPlayerMonIndex\n\
_080ABE98: .4byte gTasks\n\
_080ABE9C: .4byte sub_80ABEA0\n\
    .syntax divided\n");
}
#endif

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
        struct UnknownContestStruct1 *s = &shared19260.unk19260[gContestPlayerMonIndex];
        u8 taskId2;

        s->unk6 = var;
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

#ifdef NONMATCHING
void sub_80AC2CC(u8 taskId)
{
    u8 spriteId; // r5
    s32 r6;
    u8 r7 = shared19204.unk19215;

    switch (gTasks[taskId].data[0])
    {
    case 0:
    //_080AC404
        sub_80B0D7C();
        // had to write the array index like this to match
        for (r6 = 0; shared19204.unk19214 != r6[shared19260.unk192D0]; r6++)
            ;
        //_080AC42C
        shared19204.unk19215 = r6;
        r7 = shared19204.unk19215;  // is r7 actually a variable?
        if (gIsLinkContest & 1)
        {
            u8 taskId2;

            //shared19204.unk1920B_2 = 1;
            shared19204.unk1920B |= 4;
            if (sub_80AE074())
                sub_80B114C(shared19204.unk19215);
            taskId2 = CreateTask(sub_80C8C80, 0);
            SetTaskFuncWithFollowupFunc(taskId2, sub_80C8C80, sub_80AD8DC);
            sub_80AF860();
            gTasks[taskId].data[0] = 1;
        }
        //_080AC498
        else
        {
            sub_80B114C(shared19204.unk19215);
            gTasks[taskId].data[0] = 2;
        }
        return;
    case 1:
        if (!(shared19204.unk1920B & 4))
            gTasks[taskId].data[0] = 2;
        return;
    case 2:
    //_080AC4D4
        {
            struct UnknownContestStruct1 *s = &shared19260.unk19260[r7];  // r2

            if ((s->unkC & 6)
             || (s->unkB & 0x80))
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
        }
        return;
    case 3:
    //_080AC534
        // r6 optimized out
        for (r6 = 0; r6 < 4; r6++)
            gBattleMonForms[r6] = 0;
        memset(shared19260.unk19348, 0, 20);
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
    //_080AC5E8
        spriteId = gTasks[taskId].data[2];
        if (gSprites[spriteId].callback == SpriteCallbackDummy)
        {
            struct UnknownContestStruct4 *s = &shared19260.unk19338[r7];
            if (!(s->unk2 & 2))
                gTasks[taskId].data[0] = 5;
        }
        return;
    case 5:
    //_080AC638
        {
            struct UnknownContestStruct1 *s = &shared19260.unk19260[r7];

            if (s->unkC & 1)
            {
                gTasks[taskId].data[0] = 33;
            }
            //_080AC664
            else
            {
                sub_80AF138();
                StringCopy(gStringVar1, gContestMons[r7].nickname);
                if (s->unk6 <= 354)
                    StringCopy(gStringVar2, gMoveNames[s->unk6]);
                else
                    StringCopy(gStringVar2, gUnknown_083CC330[s->unkA]);
                StringExpandPlaceholders(gStringVar4, gUnknown_083CAFD7);
                sub_8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
                gTasks[taskId].data[0] = 6;
            }
        }
        return;
    case 6:
    //_080AC6F8
        if (sub_80037A0(&gMenuWindow) != 0)
        {
            shared19204.unk1925E = 0;
            gTasks[taskId].data[0] = 7;
        }
        return;
    case 7:
    //_080AC730
        {
            struct UnknownContestStruct1 *s = &shared19260.unk19260[shared19204.unk19215];
            // doesn't match
            u16 r4 = sub_80B2760(s->unk6);

            sub_80B2790(shared19204.unk19215);
            sub_80B28F0(shared19204.unk19215);
            sub_80B29B4(r4);
            ExecuteMoveAnim(r4);
            gTasks[taskId].data[0] = 8;
        }
        return;
    case 8:
    //_080AC77C
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
                struct UnknownContestStruct1 *s = &shared19260.unk19260[r7];

                //if (!(s->unk15 & 0x10))
                if (!s->unk15_4)
                    sub_80B03A8(r7);
                sub_80B20C4();
                gTasks[taskId].data[0] = 23;
            }
        }
        return;
    case 9:
    //_080AC7F4
        if (gTasks[taskId].data[10]++ > 30)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 7;
        }
        return;
    case 23:
    //_080AC81E
        {
            struct UnknownContestStruct1 *s;  // r6

            gTasks[taskId].data[1] = 0;
            s = &shared19260.unk19260[r7];
            if (s->unk13 != 0xFF)
            {
                sub_80B146C(r7, s->unk13);
                shared19260.unk19260[r7].unk13 = 0xFF;
                gTasks[taskId].data[0] = 24;
            }
            //_080AC85C
            else
            {
                if (s->unk14 != 0xFF)
                {
                    //s32 r6 = 0;

                    for (r6 = 0; r6 < 4; r6++)
                    {
                        if (r6 != r7 && shared19260.unk19260[r6].unk13 != 0xFF)
                            break;
                    }
                    //_080AC886
                    if (r6 == 4)
                    {
                        sub_80B146C(r7, shared19260.unk19260[r7].unk14);
                        shared19260.unk19260[r7].unk14 = 0xFF;
                        gTasks[taskId].data[0] = 24;
                    }
                    //_080AC8B4
                    else
                    {
                        gTasks[taskId].data[0] = 48;
                    }
                }
                //_080AC8C4
                else
                {
                    gTasks[taskId].data[0] = 48;
                }
            }
        }
        return;
    case 24:
    //_080AC8CC
        if (sub_80037A0(&gMenuWindow) != 0)
            gTasks[taskId].data[0] = 23;
        return;
    case 48:
    //_080AC8F8
        {
            struct UnknownContestStruct1 *s = &shared19260.unk19260[r7];

            if ((s->unk11 & 3) == 1)
            {
                sub_80B1710(5);
            }
            else if ((s->unk11 & 3) == 2)
            {
                sub_80B1710(6);
            }
            else if ((s->unk11 & 3) == 3)
            {
                sub_80B1710(7);
            }
            else
            {
                gTasks[taskId].data[0] = 47;
                return;
            }
            gTasks[taskId].data[0] = 49;
        }
        return;
    case 49:
    //_080AC94C
        if (!(shared19204.unk1920A & 0x10))
            gTasks[taskId].data[0] = 47;
        return;
    case 47:
    //_080AC96C
        sub_80B1FD0(1);
        gTasks[taskId].data[0] = 12;
        return;
    case 12:
    //_080AC98C
        {
            struct UnknownContestStruct1 *s = &shared19260.unk19260[r7];

            sub_80AFBA0(0, s->unk2, r7);
            gTasks[taskId].data[0] = 13;
        }
        return;
    case 13:
    //_080AC9C0
        {
            struct UnknownContestStruct4 *s = &shared19260.unk19338[shared19204.unk19215];

            if (!(s->unk2 & 4))
                gTasks[taskId].data[0] = 35;
        }
        return;
    case 35:
    //_080AC9EC
        {
            struct UnknownContestStruct1 *s = &shared19260.unk19260[r7];

            if ((s->unk10 & 0x30) == 0x10)
                sub_80B1710(8);
            gTasks[taskId].data[0] = 36;
        }
        return;
    case 36:
    //_080ACA24
        //if (!shared19204.unk1920A_4)
        if (!(shared19204.unk1920A & 0x10))
            gTasks[taskId].data[0] = 37;
        return;
    case 37:
    //_080ACA44
        if (sub_80AEE54(r7, 1) != 0)
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
    //_080ACA84
        if (++gTasks[taskId].data[10] > 20)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 50;
        }
        return;
    case 50:
    //_080ACAAE
        if (sub_80AF038(r7) != 0)
            PlaySE(SE_C_PASI);
        gTasks[taskId].data[0] = 25;
        return;
    case 25:
    //_080ACAD8
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].data[0] = 26;
        return;
    case 26:
    //_080ACAEE
        //asm_comment("case26");
        {
            s8 r4 = 0;
            s32 r2 = 0;

            for (r6 = gTasks[taskId].data[1]; r6 < 4; r6++)
            {
                //_080ACB0A
                r4 = 0;
                for (r2 = 0; r2 < 4; r2++)
                {
                    if (r2 != r7 && gUnknown_02038696[r2] == r6
                     && shared19260.unk19260[r2].unk13 != 0xFF)
                    {
                        r4 = 1;
                        break;
                    }
                }
                //_080ACB4E
                if (r4 != 0)
                    break;
            }
            r4 = r4;  // This makes it shift for some reason
            //_080ACB58
            if (r4)
            {
            //_080ACB60
                u8 r2_;
                struct UnknownContestStruct1 *s;

                gTasks[taskId].data[1] = gUnknown_02038696[r2];
                r2_ = r2;
                s = &shared19260.unk19260[r2];
                sub_80B146C(r2_, s->unk13);
                s->unk13 = 0xFF;
                gTasks[taskId].data[0] = 27;
            }
            //_080ACB98
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
    //_080ACBB0
        if (sub_80037A0(&gMenuWindow) != 0)
            gTasks[taskId].data[0] = 28;
        return;
    case 28:
    //_080ACBDC
        {
            struct UnknownContestStruct1 *s;  // r0

            for (r6 = 0; gTasks[taskId].data[1] != gUnknown_02038696[r6]; r6++)
                ;
            //_080ACC08
            s = &shared19260.unk19260[r6];
            sub_80AFBA0(s->unk2 + s->unkE, -s->unkE, r6);
            gTasks[taskId].data[0] = 29;
        }
        return;
    case 29:
    //_080ACC44
        {
            struct UnknownContestStruct4 *s;

            for (r6 = 0; gTasks[taskId].data[1] != gUnknown_02038696[r6]; r6++)
                ;
            //_080ACC6C
            s = &shared19260.unk19338[r6];
            if (!(s->unk2 & 4))
                gTasks[taskId].data[0] = 39;
        }
        return;
    case 39:
    //_080ACC98
        for (r6 = 0; gTasks[taskId].data[1] != gUnknown_02038696[r6]; r6++)
            ;
        if (sub_80AEE54(r6, 1) != 0)
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
    //_080ACD00
        if (++gTasks[taskId].data[10] > 20)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 30;
        }
        return;
    case 30:
    //_080ACD2A
        {
            struct UnknownContestStruct1 *s;

            for (r6 = 0; r6 < 4; r6++)
            {
                if (gUnknown_02038696[r6] == gTasks[taskId].data[1])
                    break;
            }
            //_080ACD5E
            if (sub_80AF038(r6) != 0)
                PlaySE(SE_C_PASI);
            else
                PlaySE(SE_C_SYU);
            s = &shared19260.unk19260[r6];
            //if (s->unk15 & 0x20)
            if (s->unk15_5)
            {
                sub_80B03A8(r6);
                s->unk15_5 = 0;
            }
            gTasks[taskId].data[1]++;
            gTasks[taskId].data[0] = 26;
        }
        return;
    case 51:
    //_080ACDC8
        if (gTasks[taskId].data[10]++ > 9)
        {
            struct UnknownContestStruct1 *s;

            gTasks[taskId].data[10] = 0;
            s = &shared19260.unk19260[r7];
            if ((s->unkC & 6)
             || (s->unk11 & 4))
            {
                sub_80AF138();
                StringCopy(gStringVar1, gContestMons[r7].nickname);
                StringExpandPlaceholders(gStringVar4, gUnknown_083CC103);
                sub_8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
            }
            //_080ACE36
            gTasks[taskId].data[0] = 52;
        }
        return;
    case 52:
    //_080ACE64
        if (sub_80037A0(&gMenuWindow) != 0)
        {
            struct UnknownContestStruct1 *s = &shared19260.unk19260[r7];

            if (!s->unk15_6)
                gTasks[taskId].data[0] = 17;
            else
                gTasks[taskId].data[0] = 14;
        }
        return;
    case 14:
    //_080ACEC0
        {
            struct UnknownContestStruct1 *s = &shared19260.unk19260[r7];
            s8 r4 = s->unk16;  // what type is this?

            if (s->unk16 != 0)
            {
                sub_80AF138();
                if (r4 == 1)
                    sub_8002EB0(&gMenuWindow, gUnknown_083CBD79, 776, 1, 15);
                else if (r4 == 2)
                    sub_8002EB0(&gMenuWindow, gUnknown_083CBD9D, 776, 1, 15);
                else
                    sub_8002EB0(&gMenuWindow, gUnknown_083CBDC6, 776, 1, 15);
                //_080ACF22
                sub_80B1710(3);
                gTasks[taskId].data[10] = 0;
                gTasks[taskId].data[0] = 45;
            }
            //_080ACF48
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
        }
        return;
    case 45:
    //_080ACFA8
        //if (!shared19204.unk1920A_4)
        if (!(shared19204.unk1920A & 0x10))
        {
            sub_80B09B0(shared19204.unk19215);
            gTasks[taskId].data[0] = 15;
        }
        return;
    case 15:
    //_080ACFD4
        if (sub_80037A0(&gMenuWindow) != 0)
        {
            if (++gTasks[taskId].data[10] > 50)
            {
                struct UnknownContestStruct1 *s = &shared19260.unk19260[r7];
                //if (!(shared19260.unk19260[r7].unk15 & 0x10))
                if (!s->unk15_4)
                {
                    sub_80AFBA0(
                      shared19260.unk19260[r7].unk2,
                      shared19260.unk19260[r7].unk17,
                      r7);
                    shared19260.unk19260[r7].unk2 += shared19260.unk19260[r7].unk17;
                }
                //_080AD02C
                gTasks[taskId].data[0] = 16;
            }
        }
        return;
    case 16:
    //_080AD040
        {
            struct UnknownContestStruct4 *s = &shared19260.unk19338[r7];

            if (!(s->unk2 & 4))
            {
                gTasks[taskId].data[10] = 0;
                gTasks[taskId].data[0] = 17;
            }
        }
        return;
    case 17:
    //_080AD070
        {
            struct UnknownContestStruct1 *s = &shared19260.unk19260[r7];

            //if (s->unk15 & 1)
            if (s->unk15_0)
            {
                sub_80AF138();
                StringCopy(gStringVar1, gContestMons[r7].nickname);
                StringExpandPlaceholders(gStringVar4, gUnknown_083CC075);
                sub_8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
                gTasks[taskId].data[10] = 0;
                sub_80B1710();
                gTasks[taskId].data[0] = 46;
            }
            //_080AD0E8
            else
            {
                gTasks[taskId].data[0] = 41;
            }
        }
        return;
    case 46:
    //_080AD0FA
        //if (!shared19204.unk1920A_4)
        if (!(shared19204.unk1920A & 0x10))
            gTasks[taskId].data[0] = 19;
        return;
    case 19:
    //_080AD11A
        if (sub_80037A0(&gMenuWindow) != 0)
        {
            struct UnknownContestStruct1 *s = &shared19260.unk19260[r7];

            sub_80AFBA0(s->unk2, -s->unk18, r7);
            s->unk2 -= s->unk18;
            gTasks[taskId].data[0] = 18;
        }
        return;
    case 18:
    //_080AD168
        {
            struct UnknownContestStruct4 *s;

            sub_80B0D7C();
            s = &shared19260.unk19338[r7];
            if (!(s->unk2 & 4))
            {
                gTasks[taskId].data[10] = 0;
                sub_80AF138();
                gTasks[taskId].data[0] = 41;
            }
        }
        return;
    case 41:
    //_080AD1A4
        //asm_comment("case41");
        {
            //struct UnknownContestStruct5_alt *s5_alt = (struct UnknownContestStruct5_alt *)&shared19260.unk19328; // r2
            struct UnknownContestStruct5 *s5 = (struct UnknownContestStruct5 *)&shared19260.unk19328;  // r1

            if (s5->bits_8 && r7 != s5->bits_9)
            {
                gTasks[taskId].data[0] = 57;
            }
            //_080AD1D0
            else
            {
                s8 r4 = s5->bits_0;
                //struct UnknownContestStruct1 *s = &shared19260.unk19260[r7];
                struct UnknownContestStruct1 *s = ((struct UnknownContestStruct1 *)(((u8 *)s5) - 0xC8)) + r7;

                if (s->unk11 & 0x10)
                {
                    r4 = 1;
                    StringCopy(gStringVar3, gMoveNames[s->unk6]);
                }
                else
                {
                    StringCopy(gStringVar3, gUnknown_083CC2D8[gContestMoves[s->unk6].contestCategory]);
                }
                //_080AD21E
                if (r4 > 0)
                {
                    struct UnknownContestStruct1 *s = &shared19260.unk19260[r7];

                    //if (s->unk15 & 1)
                    if (s->unk15_0)
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
        }
        return;
    case 53:
    //_080AD316
        switch (gTasks[taskId].data[10])
        {
        case 0:
            sub_80B1EA8(-1, 1);
            PlayFanfare(BGM_ME_ZANNEN);
            gTasks[taskId].data[10]++;
            break;
        case 1:
        //_080AD354
            if (!(shared19204.unk1920B & 1) && sub_80037A0(&gMenuWindow) != 0)
            {
                sub_80B1CBC(-1);
                gTasks[taskId].data[10]++;
            }
            break;
        case 2:
        //_080AD37C
            if (!(shared19204.unk1920A & 0x20))
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
        //_080AD3B0
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
    //_080AD3D0
        switch (gTasks[taskId].data[10])
        {
        case 0:
        //_080AD408
            if (sub_80037A0(&gMenuWindow) != 0)
            {
                sub_80B1EA8(0, 1);
                gTasks[taskId].data[10]++;
            }
            break;
        case 1:
        //_080AD420
            if (!(shared19204.unk1920B & 1))
            {
                sub_80B1DDC();
                PlaySE(SE_W227B);
                sub_80B1CBC(1);
                gTasks[taskId].data[10]++;
            }
            break;
        case 2:
        asm_comment("asdfasdf");
        //_080AD43E
            if (!(shared19204.unk1920A & 0x20))
            {
                if (gTasks[taskId].data[11]++ > 29)
                {
                    struct UnknownContestStruct1 *s;
                    struct UnknownContestStruct5 *s5;
                    //register s16 r0 asm("r0");

                    gTasks[taskId].data[11] = 0;
                    s = &shared19260.unk19260[r7];
                    s5 = &shared19260.unk19328;
                    sub_80AFBA0(s->unk2, s5->unk2, r7);
                    s->unk2 += s5->unk2;
                    gTasks[taskId].data[10]++;
                }
                /*
                if (gTasks[taskId].data[11]++ > 29)
                {
                    struct UnknownContestStruct1 *s;
                    struct UnknownContestStruct5 *s5;
                    register s16 r0 asm("r0");

                    gTasks[taskId].data[11] = 0;
                    s = &shared19260.unk19260[r7];
                    r0 = s->unk2;
                    s5 = &shared19260.unk19328;
                    sub_80AFBA0(r0, s5->unk2, r7);
                    s->unk2 += s5->unk2;
                    gTasks[taskId].data[10]++;
                }
                */
            }
            break;
        case 3:
        //_080AD4A0
            {
                struct UnknownContestStruct4 *s = &shared19260.unk19338[r7];

                if (!(s->unk2 & 4))
                {
                    if (!(shared19204.unk1920A & 0x80))
                    {
                        sub_80B1EA8(1, -1);
                        gTasks[taskId].data[10]++;
                    }
                }
            }
            break;
        case 4:
        //_080AD4EC
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
    //_080AD514
        {
            struct UnknownContestStruct4 *s = &shared19260.unk19338[r7];

            if (!(s->unk2 & 4))
            {
                sub_80AF138();
                gTasks[taskId].data[0] = 55;
            }
        }
        return;
    case 57:
    //_080AD53C
        {
            sub_80AF138();
            StringCopy(gStringVar3, gContestMons[shared19260.unk19328.bits_9].nickname);
            StringCopy(gStringVar1, gContestMons[r7].nickname);
            StringCopy(gStringVar2, gMoveNames[shared19260.unk19260[r7].unk6]);
            StringExpandPlaceholders(gStringVar4, gUnknown_083CC14A);
            sub_8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
            gTasks[taskId].data[0] = 58;
        }
        return;
    case 58:
    //_080AD5D0
        if (sub_80037A0(&gMenuWindow) != 0)
        {
            sub_80AF138();
            StringExpandPlaceholders(gStringVar4, gUnknown_083CC16E);
            sub_8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
            gTasks[taskId].data[0] = 59;
        }
        return;
    case 59:
    //_080AD624
        if (sub_80037A0(&gMenuWindow) != 0)
        {
            sub_80AF138();
            gTasks[taskId].data[0] = 55;
        }
        return;
    case 33:
    //_080AD648
        {
            struct UnknownContestStruct1 *s = &shared19260.unk19260[r7];

            /*
            if (s->unk15 & 0x10)
                s->unk15 &= ~0x10;  // probably a bitfield
            */
            if (s->unk15_4)
                s->unk15_4 = 0;
            sub_80B09B0(r7);
            StringCopy(gStringVar1, gContestMons[r7].nickname);
            StringCopy(gStringVar2, gMoveNames[s->unk6]);
            StringExpandPlaceholders(gStringVar4, gUnknown_083CBF60);
            sub_8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
            gTasks[taskId].data[0] = 34;
        }
        return;
    case 34:
    //_080AD6D8
        if (sub_80037A0(&gMenuWindow) != 0)
            gTasks[taskId].data[0] = 55;
        return;
    case 55:
    //_080AD700
        sub_80B1BDC();
        gTasks[taskId].data[0] = 56;
        return;
    case 56:
    //_080AD71C
        if (!(shared19204.unk1920A & 0x40))
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
    //_080AD750
        spriteId = gTasks[taskId].data[2];
        gSprites[spriteId].callback = sub_80AD92C;
        gTasks[taskId].data[0] = 11;
        return;
    case 11:
    //_080AD77C
        spriteId = gTasks[taskId].data[2];
        if (gSprites[spriteId].invisible)
        {
            FreeSpriteOamMatrix(&gSprites[spriteId]);
            DestroySprite(&gSprites[spriteId]);
            gTasks[taskId].data[0] = 20;
        }
        return;
    case 20:
    //_080AD7B8
        for (r6 = 0; r6 < 4; r6++)
            sub_80B0CDC(r6, 1);
        gTasks[taskId].data[10] = 0;
        gTasks[taskId].data[0] = 21;
        return;
    case 31:
    //_080AD7E8
        sub_80AF138();
        StringCopy(gStringVar1, gContestMons[r7].nickname);
        StringExpandPlaceholders(gStringVar4, gUnknown_083CB00D);
        sub_8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
        gTasks[taskId].data[0] = 32;
        return;
    case 32:
    //_080AD840
        if (sub_80037A0(&gMenuWindow) != 0)
            gTasks[taskId].data[0] = 21;
        return;
    case 21:
    //_080AD868
        if (++gTasks[taskId].data[10] > 29)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 22;
        }
        return;
    case 22:
    //_080AD88C
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
#endif

__attribute__((naked))
void sub_80AC2CC(u8 taskId)
{
    asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r10\n\
	mov r6, r9\n\
	mov r5, r8\n\
	push {r5-r7}\n\
	sub sp, 0x8\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	mov r8, r0\n\
	ldr r2, _080AC308 @ =gSharedMem + 0x19204\n\
	ldrb r7, [r2, 0x11]\n\
	ldr r1, _080AC30C @ =gTasks\n\
	lsls r0, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	movs r3, 0x8\n\
	ldrsh r0, [r0, r3]\n\
	adds r6, r2, 0\n\
	mov r12, r1\n\
	cmp r0, 0x3B\n\
	bls _080AC2FC\n\
	bl _080AD8CA\n\
_080AC2FC:\n\
	lsls r0, 2\n\
	ldr r1, _080AC310 @ =_080AC314\n\
	adds r0, r1\n\
	ldr r0, [r0]\n\
	mov pc, r0\n\
	.align 2, 0\n\
_080AC308: .4byte gSharedMem + 0x19204\n\
_080AC30C: .4byte gTasks\n\
_080AC310: .4byte _080AC314\n\
	.align 2, 0\n\
_080AC314:\n\
	.4byte _080AC404\n\
	.4byte _080AC4B4\n\
	.4byte _080AC4D4\n\
	.4byte _080AC534\n\
	.4byte _080AC5E8\n\
	.4byte _080AC638\n\
	.4byte _080AC6F8\n\
	.4byte _080AC730\n\
	.4byte _080AC77C\n\
	.4byte _080AC7F4\n\
	.4byte _080AD750\n\
	.4byte _080AD77C\n\
	.4byte _080AC98C\n\
	.4byte _080AC9C0\n\
	.4byte _080ACEC0\n\
	.4byte _080ACFD4\n\
	.4byte _080AD040\n\
	.4byte _080AD070\n\
	.4byte _080AD168\n\
	.4byte _080AD11A\n\
	.4byte _080AD7B8\n\
	.4byte _080AD868\n\
	.4byte _080AD88C\n\
	.4byte _080AC81E\n\
	.4byte _080AC8CC\n\
	.4byte _080ACAD8\n\
	.4byte _080ACAEE\n\
	.4byte _080ACBB0\n\
	.4byte _080ACBDC\n\
	.4byte _080ACC44\n\
	.4byte _080ACD2A\n\
	.4byte _080AD7E8\n\
	.4byte _080AD840\n\
	.4byte _080AD648\n\
	.4byte _080AD6D8\n\
	.4byte _080AC9EC\n\
	.4byte _080ACA24\n\
	.4byte _080ACA44\n\
	.4byte _080ACA84\n\
	.4byte _080ACC98\n\
	.4byte _080ACD00\n\
	.4byte _080AD1A4\n\
	.4byte _080AD8CA\n\
	.4byte _080AD514\n\
	.4byte _080AD8CA\n\
	.4byte _080ACFA8\n\
	.4byte _080AD0FA\n\
	.4byte _080AC96C\n\
	.4byte _080AC8F8\n\
	.4byte _080AC94C\n\
	.4byte _080ACAAE\n\
	.4byte _080ACDC8\n\
	.4byte _080ACE64\n\
	.4byte _080AD316\n\
	.4byte _080AD3D0\n\
	.4byte _080AD700\n\
	.4byte _080AD71C\n\
	.4byte _080AD53C\n\
	.4byte _080AD5D0\n\
	.4byte _080AD624\n\
_080AC404:\n\
	bl sub_80B0D7C\n\
	movs r6, 0\n\
	ldr r0, _080AC484 @ =gSharedMem + 0x19204\n\
	adds r1, r0, 0\n\
	adds r1, 0xCC\n\
	ldrb r0, [r0, 0x10]\n\
	mov r4, r8\n\
	lsls r4, 2\n\
	mov r9, r4\n\
	ldrb r5, [r1]\n\
	cmp r0, r5\n\
	beq _080AC42C\n\
	adds r2, r1, 0\n\
	adds r1, r0, 0\n\
_080AC422:\n\
	adds r6, 0x1\n\
	adds r0, r6, r2\n\
	ldrb r0, [r0]\n\
	cmp r1, r0\n\
	bne _080AC422\n\
_080AC42C:\n\
	ldr r4, _080AC484 @ =gSharedMem + 0x19204\n\
	strb r6, [r4, 0x11]\n\
	ldrb r7, [r4, 0x11]\n\
	ldr r0, _080AC488 @ =gIsLinkContest\n\
	ldrb r1, [r0]\n\
	movs r5, 0x1\n\
	adds r0, r5, 0\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080AC498\n\
	ldrb r0, [r4, 0x7]\n\
	movs r1, 0x4\n\
	orrs r0, r1\n\
	strb r0, [r4, 0x7]\n\
	bl sub_80AE074\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	beq _080AC458\n\
	ldrb r0, [r4, 0x11]\n\
	bl sub_80B114C\n\
_080AC458:\n\
	ldr r4, _080AC48C @ =sub_80C8C80\n\
	adds r0, r4, 0\n\
	movs r1, 0\n\
	bl CreateTask\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	ldr r2, _080AC490 @ =sub_80AD8DC\n\
	adds r1, r4, 0\n\
	bl SetTaskFuncWithFollowupFunc\n\
	bl sub_80AF860\n\
	ldr r1, _080AC494 @ =gTasks\n\
	mov r0, r9\n\
	add r0, r8\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	strh r5, [r0, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080AC484: .4byte gSharedMem + 0x19204\n\
_080AC488: .4byte gIsLinkContest\n\
_080AC48C: .4byte sub_80C8C80\n\
_080AC490: .4byte sub_80AD8DC\n\
_080AC494: .4byte gTasks\n\
_080AC498:\n\
	adds r0, r7, 0\n\
	bl sub_80B114C\n\
	ldr r0, _080AC4B0 @ =gTasks\n\
	mov r1, r9\n\
	add r1, r8\n\
	lsls r1, 3\n\
	adds r1, r0\n\
	movs r0, 0x2\n\
	strh r0, [r1, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080AC4B0: .4byte gTasks\n\
_080AC4B4:\n\
	ldrb r1, [r6, 0x7]\n\
	movs r0, 0x4\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080AC4C2\n\
	bl _080AD8CA\n\
_080AC4C2:\n\
	mov r1, r8\n\
	lsls r0, r1, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	add r0, r12\n\
	movs r1, 0x2\n\
	strh r1, [r0, 0x8]\n\
	bl _080AD8CA\n\
_080AC4D4:\n\
	lsls r0, r7, 3\n\
	subs r0, r7\n\
	lsls r0, 2\n\
	ldr r1, _080AC508 @ =gSharedMem + 0x19260\n\
	adds r2, r0, r1\n\
	ldrb r1, [r2, 0xC]\n\
	movs r0, 0x6\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _080AC4F6\n\
	ldrb r1, [r2, 0xB]\n\
	movs r0, 0x80\n\
	ands r0, r1\n\
	lsls r0, 24\n\
	lsrs r6, r0, 24\n\
	cmp r6, 0\n\
	beq _080AC50C\n\
_080AC4F6:\n\
	mov r2, r8\n\
	lsls r0, r2, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	add r0, r12\n\
	movs r1, 0x1F\n\
	strh r1, [r0, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080AC508: .4byte gSharedMem + 0x19260\n\
_080AC50C:\n\
	bl sub_80AF138\n\
	adds r0, r7, 0\n\
	movs r1, 0\n\
	bl sub_80B0CDC\n\
	ldr r0, _080AC530 @ =gTasks\n\
	mov r3, r8\n\
	lsls r1, r3, 2\n\
	add r1, r8\n\
	lsls r1, 3\n\
	adds r1, r0\n\
	strh r6, [r1, 0x1C]\n\
	movs r0, 0x3\n\
	strh r0, [r1, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080AC530: .4byte gTasks\n\
_080AC534:\n\
	mov r4, r8\n\
	lsls r4, 2\n\
	mov r9, r4\n\
	ldr r4, _080AC5C4 @ =gSharedMem + 0x19348\n\
	ldr r1, _080AC5C8 @ =gBattleMonForms\n\
	movs r2, 0\n\
	adds r0, r1, 0x3\n\
_080AC542:\n\
	strb r2, [r0]\n\
	subs r0, 0x1\n\
	cmp r0, r1\n\
	bge _080AC542\n\
	movs r6, 0x4\n\
	adds r0, r4, 0\n\
	movs r1, 0\n\
	movs r2, 0x14\n\
	bl memset\n\
	ldr r5, _080AC5CC @ =0xfffffebc\n\
	adds r7, r4, r5\n\
	ldrb r0, [r7, 0x11]\n\
	bl sub_80B28F0\n\
	ldr r3, _080AC5D0 @ =gContestMons\n\
	ldrb r2, [r7, 0x11]\n\
	lsls r2, 6\n\
	adds r0, r2, r3\n\
	ldrh r0, [r0]\n\
	adds r1, r3, 0\n\
	adds r1, 0x3C\n\
	adds r1, r2, r1\n\
	ldr r1, [r1]\n\
	adds r3, 0x38\n\
	adds r2, r3\n\
	ldr r2, [r2]\n\
	bl sub_80AE9FC\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	ldr r2, _080AC5D4 @ =gSprites\n\
	lsls r0, r5, 4\n\
	adds r0, r5\n\
	lsls r0, 2\n\
	adds r3, r0, r2\n\
	movs r1, 0x78\n\
	strh r1, [r3, 0x24]\n\
	adds r2, 0x1C\n\
	adds r0, r2\n\
	ldr r1, _080AC5D8 @ =sub_80AD8FC\n\
	str r1, [r0]\n\
	ldr r0, _080AC5DC @ =gTasks\n\
	mov r4, r9\n\
	add r4, r8\n\
	lsls r4, 3\n\
	adds r4, r0\n\
	strh r5, [r4, 0xC]\n\
	ldr r1, _080AC5E0 @ =gObjectBankIDs\n\
	ldr r0, _080AC5E4 @ =gBankAttacker\n\
	ldrb r0, [r0]\n\
	adds r0, r1\n\
	strb r5, [r0]\n\
	ldrb r0, [r7, 0x11]\n\
	bl sub_80B09E4\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	movs r1, 0\n\
	bl sub_80B0BC4\n\
	strh r6, [r4, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080AC5C4: .4byte gSharedMem + 0x19348\n\
_080AC5C8: .4byte gBattleMonForms\n\
_080AC5CC: .4byte 0xfffffebc\n\
_080AC5D0: .4byte gContestMons\n\
_080AC5D4: .4byte gSprites\n\
_080AC5D8: .4byte sub_80AD8FC\n\
_080AC5DC: .4byte gTasks\n\
_080AC5E0: .4byte gObjectBankIDs\n\
_080AC5E4: .4byte gBankAttacker\n\
_080AC5E8:\n\
	mov r1, r8\n\
	lsls r0, r1, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	mov r3, r12\n\
	adds r2, r0, r3\n\
	ldrb r5, [r2, 0xC]\n\
	ldr r1, _080AC62C @ =gSprites\n\
	lsls r0, r5, 4\n\
	adds r0, r5\n\
	lsls r0, 2\n\
	adds r1, 0x1C\n\
	adds r0, r1\n\
	ldr r1, [r0]\n\
	ldr r0, _080AC630 @ =SpriteCallbackDummy\n\
	cmp r1, r0\n\
	beq _080AC60E\n\
	bl _080AD8CA\n\
_080AC60E:\n\
	lsls r0, r7, 2\n\
	ldr r1, _080AC634 @ =gSharedMem + 0x19338\n\
	adds r0, r1\n\
	ldrb r1, [r0, 0x2]\n\
	movs r0, 0x2\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080AC622\n\
	bl _080AD8CA\n\
_080AC622:\n\
	movs r0, 0x5\n\
	strh r0, [r2, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080AC62C: .4byte gSprites\n\
_080AC630: .4byte SpriteCallbackDummy\n\
_080AC634: .4byte gSharedMem + 0x19338\n\
_080AC638:\n\
	lsls r0, r7, 3\n\
	subs r0, r7\n\
	lsls r0, 2\n\
	ldr r1, _080AC660 @ =gSharedMem + 0x19260\n\
	adds r5, r0, r1\n\
	ldrb r1, [r5, 0xC]\n\
	movs r0, 0x1\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080AC664\n\
	mov r4, r8\n\
	lsls r0, r4, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	add r0, r12\n\
	movs r1, 0x21\n\
	strh r1, [r0, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080AC660: .4byte gSharedMem + 0x19260\n\
_080AC664:\n\
	bl sub_80AF138\n\
	ldr r0, _080AC690 @ =gStringVar1\n\
	lsls r1, r7, 6\n\
	ldr r2, _080AC694 @ =gContestMons + 0x2\n\
	adds r1, r2\n\
	bl StringCopy\n\
	ldrh r1, [r5, 0x6]\n\
	movs r0, 0xB1\n\
	lsls r0, 1\n\
	cmp r1, r0\n\
	bhi _080AC6A0\n\
	ldr r0, _080AC698 @ =gStringVar2\n\
	adds r2, r1, 0\n\
	movs r1, 0xD\n\
	muls r1, r2\n\
	ldr r2, _080AC69C @ =gMoveNames\n\
	adds r1, r2\n\
	bl StringCopy\n\
	b _080AC6B0\n\
	.align 2, 0\n\
_080AC690: .4byte gStringVar1\n\
_080AC694: .4byte gContestMons + 0x2\n\
_080AC698: .4byte gStringVar2\n\
_080AC69C: .4byte gMoveNames\n\
_080AC6A0:\n\
	ldr r0, _080AC6E0 @ =gStringVar2\n\
	ldr r2, _080AC6E4 @ =gUnknown_083CC330\n\
	ldrb r1, [r5, 0xA]\n\
	lsls r1, 2\n\
	adds r1, r2\n\
	ldr r1, [r1]\n\
	bl StringCopy\n\
_080AC6B0:\n\
	ldr r4, _080AC6E8 @ =gStringVar4\n\
	ldr r1, _080AC6EC @ =gUnknown_083CAFD7\n\
	adds r0, r4, 0\n\
	bl StringExpandPlaceholders\n\
	ldr r0, _080AC6F0 @ =gMenuWindow\n\
	movs r2, 0xC2\n\
	lsls r2, 2\n\
	movs r1, 0xF\n\
	str r1, [sp]\n\
	adds r1, r4, 0\n\
	movs r3, 0x1\n\
	bl sub_8002EB0\n\
	ldr r1, _080AC6F4 @ =gTasks\n\
	mov r5, r8\n\
	lsls r0, r5, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	movs r1, 0x6\n\
	strh r1, [r0, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080AC6E0: .4byte gStringVar2\n\
_080AC6E4: .4byte gUnknown_083CC330\n\
_080AC6E8: .4byte gStringVar4\n\
_080AC6EC: .4byte gUnknown_083CAFD7\n\
_080AC6F0: .4byte gMenuWindow\n\
_080AC6F4: .4byte gTasks\n\
_080AC6F8:\n\
	ldr r0, _080AC724 @ =gMenuWindow\n\
	bl sub_80037A0\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	bne _080AC708\n\
	bl _080AD8CA\n\
_080AC708:\n\
	ldr r0, _080AC728 @ =gSharedMem + 0x19204\n\
	adds r0, 0x5A\n\
	movs r1, 0\n\
	strb r1, [r0]\n\
	ldr r1, _080AC72C @ =gTasks\n\
	mov r2, r8\n\
	lsls r0, r2, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	movs r1, 0x7\n\
	strh r1, [r0, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080AC724: .4byte gMenuWindow\n\
_080AC728: .4byte gSharedMem + 0x19204\n\
_080AC72C: .4byte gTasks\n\
_080AC730:\n\
	ldrb r1, [r6, 0x11]\n\
	lsls r0, r1, 3\n\
	subs r0, r1\n\
	lsls r0, 2\n\
	adds r1, r6, 0\n\
	adds r1, 0x5C\n\
	adds r0, r1\n\
	ldrh r0, [r0, 0x6]\n\
	bl sub_80B2760\n\
	adds r4, r0, 0\n\
	lsls r4, 16\n\
	lsrs r4, 16\n\
	ldrb r0, [r6, 0x11]\n\
	bl sub_80B2790\n\
	ldrb r0, [r6, 0x11]\n\
	bl sub_80B28F0\n\
	adds r0, r4, 0\n\
	bl sub_80B29B4\n\
	adds r0, r4, 0\n\
	bl ExecuteMoveAnim\n\
	ldr r1, _080AC778 @ =gTasks\n\
	mov r3, r8\n\
	lsls r0, r3, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	movs r1, 0x8\n\
	strh r1, [r0, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080AC778: .4byte gTasks\n\
_080AC77C:\n\
	ldr r0, _080AC7B8 @ =gAnimScriptCallback\n\
	ldr r0, [r0]\n\
	bl _call_via_r0\n\
	ldr r0, _080AC7BC @ =gAnimScriptActive\n\
	ldrb r4, [r0]\n\
	cmp r4, 0\n\
	beq _080AC790\n\
	bl _080AD8CA\n\
_080AC790:\n\
	adds r0, r7, 0\n\
	bl sub_80B28CC\n\
	ldr r1, _080AC7C0 @ =gSharedMem + 0x19204\n\
	adds r0, r1, 0\n\
	adds r0, 0x5A\n\
	ldrb r0, [r0]\n\
	cmp r0, 0\n\
	beq _080AC7C8\n\
	ldr r0, _080AC7C4 @ =gTasks\n\
	mov r5, r8\n\
	lsls r1, r5, 2\n\
	add r1, r8\n\
	lsls r1, 3\n\
	adds r1, r0\n\
	strh r4, [r1, 0x1C]\n\
	movs r0, 0x9\n\
	strh r0, [r1, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080AC7B8: .4byte gAnimScriptCallback\n\
_080AC7BC: .4byte gAnimScriptActive\n\
_080AC7C0: .4byte gSharedMem + 0x19204\n\
_080AC7C4: .4byte gTasks\n\
_080AC7C8:\n\
	lsls r0, r7, 3\n\
	subs r0, r7\n\
	lsls r0, 2\n\
	adds r1, 0x5C\n\
	adds r0, r1\n\
	ldrb r1, [r0, 0x15]\n\
	movs r0, 0x10\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _080AC7E2\n\
	adds r0, r7, 0\n\
	bl sub_80B03A8\n\
_080AC7E2:\n\
	bl sub_80B20C4\n\
	ldr r0, _080AC7F0 @ =gTasks\n\
	mov r2, r8\n\
	lsls r1, r2, 2\n\
	b _080AC8E2\n\
	.align 2, 0\n\
_080AC7F0: .4byte gTasks\n\
_080AC7F4:\n\
	mov r3, r8\n\
	lsls r0, r3, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	mov r4, r12\n\
	adds r2, r0, r4\n\
	ldrh r0, [r2, 0x1C]\n\
	adds r1, r0, 0x1\n\
	strh r1, [r2, 0x1C]\n\
	lsls r0, 16\n\
	asrs r0, 16\n\
	cmp r0, 0x1E\n\
	bgt _080AC812\n\
	bl _080AD8CA\n\
_080AC812:\n\
	movs r0, 0\n\
	strh r0, [r2, 0x1C]\n\
	movs r0, 0x7\n\
	strh r0, [r2, 0x8]\n\
	bl _080AD8CA\n\
_080AC81E:\n\
	mov r5, r8\n\
	lsls r3, r5, 2\n\
	adds r0, r3, r5\n\
	lsls r0, 3\n\
	mov r1, r12\n\
	adds r4, r0, r1\n\
	movs r0, 0\n\
	strh r0, [r4, 0xA]\n\
	lsls r2, r7, 3\n\
	subs r0, r2, r7\n\
	lsls r0, 2\n\
	ldr r1, _080AC858 @ =gSharedMem + 0x19260\n\
	adds r6, r0, r1\n\
	ldrb r0, [r6, 0x13]\n\
	mov r9, r3\n\
	mov r10, r2\n\
	adds r3, r1, 0\n\
	cmp r0, 0xFF\n\
	beq _080AC85C\n\
	adds r1, r0, 0\n\
	adds r0, r7, 0\n\
	bl sub_80B146C\n\
	movs r0, 0xFF\n\
	strb r0, [r6, 0x13]\n\
	movs r0, 0x18\n\
	strh r0, [r4, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080AC858: .4byte gSharedMem + 0x19260\n\
_080AC85C:\n\
	ldrb r0, [r6, 0x14]\n\
	cmp r0, 0xFF\n\
	beq _080AC8C4\n\
	movs r6, 0\n\
	cmp r6, r7\n\
	beq _080AC86E\n\
	ldrb r0, [r3, 0x13]\n\
	cmp r0, 0xFF\n\
	bne _080AC886\n\
_080AC86E:\n\
	adds r6, 0x1\n\
	cmp r6, 0x3\n\
	bgt _080AC886\n\
	cmp r6, r7\n\
	beq _080AC86E\n\
	lsls r0, r6, 3\n\
	subs r0, r6\n\
	lsls r0, 2\n\
	adds r0, r3\n\
	ldrb r0, [r0, 0x13]\n\
	cmp r0, 0xFF\n\
	beq _080AC86E\n\
_080AC886:\n\
	cmp r6, 0x4\n\
	bne _080AC8B4\n\
	mov r2, r10\n\
	subs r4, r2, r7\n\
	lsls r4, 2\n\
	adds r4, r3\n\
	ldrb r1, [r4, 0x14]\n\
	adds r0, r7, 0\n\
	bl sub_80B146C\n\
	movs r0, 0xFF\n\
	strb r0, [r4, 0x14]\n\
	ldr r1, _080AC8B0 @ =gTasks\n\
	mov r0, r9\n\
	add r0, r8\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	movs r1, 0x18\n\
	strh r1, [r0, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080AC8B0: .4byte gTasks\n\
_080AC8B4:\n\
	mov r0, r9\n\
	add r0, r8\n\
	lsls r0, 3\n\
	add r0, r12\n\
	movs r1, 0x30\n\
	strh r1, [r0, 0x8]\n\
	bl _080AD8CA\n\
_080AC8C4:\n\
	movs r0, 0x30\n\
	strh r0, [r4, 0x8]\n\
	bl _080AD8CA\n\
_080AC8CC:\n\
	ldr r0, _080AC8F0 @ =gMenuWindow\n\
	bl sub_80037A0\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	bne _080AC8DC\n\
	bl _080AD8CA\n\
_080AC8DC:\n\
	ldr r0, _080AC8F4 @ =gTasks\n\
	mov r3, r8\n\
	lsls r1, r3, 2\n\
_080AC8E2:\n\
	add r1, r8\n\
	lsls r1, 3\n\
	adds r1, r0\n\
	movs r0, 0x17\n\
	strh r0, [r1, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080AC8F0: .4byte gMenuWindow\n\
_080AC8F4: .4byte gTasks\n\
_080AC8F8:\n\
	lsls r0, r7, 3\n\
	subs r0, r7\n\
	lsls r0, 2\n\
	ldr r1, _080AC914 @ =gSharedMem + 0x19260\n\
	adds r0, r1\n\
	ldrb r0, [r0, 0x11]\n\
	movs r3, 0x3\n\
	ands r3, r0\n\
	cmp r3, 0x1\n\
	bne _080AC918\n\
	movs r0, 0x5\n\
	bl sub_80B1710\n\
	b _080AC934\n\
	.align 2, 0\n\
_080AC914: .4byte gSharedMem + 0x19260\n\
_080AC918:\n\
	cmp r3, 0x2\n\
	bne _080AC924\n\
	movs r0, 0x6\n\
	bl sub_80B1710\n\
	b _080AC934\n\
_080AC924:\n\
	cmp r3, 0x3\n\
	beq _080AC92E\n\
	mov r4, r8\n\
	lsls r0, r4, 2\n\
	b _080AC95E\n\
_080AC92E:\n\
	movs r0, 0x7\n\
	bl sub_80B1710\n\
_080AC934:\n\
	ldr r0, _080AC948 @ =gTasks\n\
	mov r5, r8\n\
	lsls r1, r5, 2\n\
	add r1, r8\n\
	lsls r1, 3\n\
	adds r1, r0\n\
	movs r0, 0x31\n\
	strh r0, [r1, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080AC948: .4byte gTasks\n\
_080AC94C:\n\
	ldrb r1, [r6, 0x6]\n\
	movs r0, 0x10\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080AC95A\n\
	bl _080AD8CA\n\
_080AC95A:\n\
	mov r1, r8\n\
	lsls r0, r1, 2\n\
_080AC95E:\n\
	add r0, r8\n\
	lsls r0, 3\n\
	add r0, r12\n\
	movs r1, 0x2F\n\
	strh r1, [r0, 0x8]\n\
	bl _080AD8CA\n\
_080AC96C:\n\
	movs r0, 0x1\n\
	bl sub_80B1FD0\n\
	ldr r0, _080AC988 @ =gTasks\n\
	mov r2, r8\n\
	lsls r1, r2, 2\n\
	add r1, r8\n\
	lsls r1, 3\n\
	adds r1, r0\n\
	movs r0, 0xC\n\
	strh r0, [r1, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080AC988: .4byte gTasks\n\
_080AC98C:\n\
	lsls r0, r7, 3\n\
	subs r0, r7\n\
	lsls r0, 2\n\
	ldr r1, _080AC9B8 @ =gSharedMem + 0x19260\n\
	adds r0, r1\n\
	movs r3, 0x2\n\
	ldrsh r1, [r0, r3]\n\
	movs r0, 0\n\
	adds r2, r7, 0\n\
	bl sub_80AFBA0\n\
	ldr r1, _080AC9BC @ =gTasks\n\
	mov r4, r8\n\
	lsls r0, r4, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	movs r1, 0xD\n\
	strh r1, [r0, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080AC9B8: .4byte gSharedMem + 0x19260\n\
_080AC9BC: .4byte gTasks\n\
_080AC9C0:\n\
	ldrb r0, [r6, 0x11]\n\
	lsls r0, 2\n\
	movs r5, 0x9A\n\
	lsls r5, 1\n\
	adds r1, r6, r5\n\
	adds r0, r1\n\
	ldrb r1, [r0, 0x2]\n\
	movs r0, 0x4\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080AC9DA\n\
	bl _080AD8CA\n\
_080AC9DA:\n\
	mov r1, r8\n\
	lsls r0, r1, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	add r0, r12\n\
	movs r1, 0x23\n\
	strh r1, [r0, 0x8]\n\
	bl _080AD8CA\n\
_080AC9EC:\n\
	lsls r0, r7, 3\n\
	subs r0, r7\n\
	lsls r0, 2\n\
	ldr r1, _080ACA1C @ =gSharedMem + 0x19260\n\
	adds r0, r1\n\
	ldrb r1, [r0, 0x10]\n\
	movs r0, 0x30\n\
	ands r0, r1\n\
	cmp r0, 0x10\n\
	bne _080ACA06\n\
	movs r0, 0x8\n\
	bl sub_80B1710\n\
_080ACA06:\n\
	ldr r0, _080ACA20 @ =gTasks\n\
	mov r2, r8\n\
	lsls r1, r2, 2\n\
	add r1, r8\n\
	lsls r1, 3\n\
	adds r1, r0\n\
	movs r0, 0x24\n\
	strh r0, [r1, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080ACA1C: .4byte gSharedMem + 0x19260\n\
_080ACA20: .4byte gTasks\n\
_080ACA24:\n\
	ldrb r1, [r6, 0x6]\n\
	movs r0, 0x10\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080ACA32\n\
	bl _080AD8CA\n\
_080ACA32:\n\
	mov r3, r8\n\
	lsls r0, r3, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	add r0, r12\n\
	movs r1, 0x25\n\
	strh r1, [r0, 0x8]\n\
	bl _080AD8CA\n\
_080ACA44:\n\
	adds r0, r7, 0\n\
	movs r1, 0x1\n\
	bl sub_80AEE54\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	beq _080ACA70\n\
	ldr r1, _080ACA6C @ =gTasks\n\
	mov r4, r8\n\
	lsls r0, r4, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	movs r1, 0\n\
	strh r1, [r0, 0x1C]\n\
	movs r1, 0x26\n\
	strh r1, [r0, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080ACA6C: .4byte gTasks\n\
_080ACA70:\n\
	ldr r0, _080ACA80 @ =gTasks\n\
	mov r5, r8\n\
	lsls r1, r5, 2\n\
	add r1, r8\n\
	lsls r1, 3\n\
	adds r1, r0\n\
	b _080ACAA6\n\
	.align 2, 0\n\
_080ACA80: .4byte gTasks\n\
_080ACA84:\n\
	mov r1, r8\n\
	lsls r0, r1, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	mov r2, r12\n\
	adds r1, r0, r2\n\
	ldrh r0, [r1, 0x1C]\n\
	adds r0, 0x1\n\
	strh r0, [r1, 0x1C]\n\
	lsls r0, 16\n\
	asrs r0, 16\n\
	cmp r0, 0x14\n\
	bgt _080ACAA2\n\
	bl _080AD8CA\n\
_080ACAA2:\n\
	movs r0, 0\n\
	strh r0, [r1, 0x1C]\n\
_080ACAA6:\n\
	movs r0, 0x32\n\
	strh r0, [r1, 0x8]\n\
	bl _080AD8CA\n\
_080ACAAE:\n\
	adds r0, r7, 0\n\
	bl sub_80AF038\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	beq _080ACAC0\n\
	movs r0, 0x63\n\
	bl PlaySE\n\
_080ACAC0:\n\
	ldr r0, _080ACAD4 @ =gTasks\n\
	mov r3, r8\n\
	lsls r1, r3, 2\n\
	add r1, r8\n\
	lsls r1, 3\n\
	adds r1, r0\n\
	movs r0, 0x19\n\
	strh r0, [r1, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080ACAD4: .4byte gTasks\n\
_080ACAD8:\n\
	mov r4, r8\n\
	lsls r0, r4, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	add r0, r12\n\
	movs r1, 0\n\
	strh r1, [r0, 0xA]\n\
	movs r1, 0x1A\n\
	strh r1, [r0, 0x8]\n\
	bl _080AD8CA\n\
_080ACAEE:\n\
	movs r2, 0\n\
	movs r4, 0\n\
	mov r5, r8\n\
	lsls r1, r5, 2\n\
	adds r0, r1, r5\n\
	lsls r0, 3\n\
	add r0, r12\n\
	movs r3, 0xA\n\
	ldrsh r6, [r0, r3]\n\
	mov r9, r1\n\
	cmp r6, 0x3\n\
	bgt _080ACB58\n\
	ldr r3, _080ACB24 @ =gUnknown_02038696\n\
	ldr r1, _080ACB28 @ =gSharedMem + 0x19260\n\
_080ACB0A:\n\
	movs r4, 0\n\
	movs r2, 0\n\
	cmp r4, r7\n\
	beq _080ACB2C\n\
	ldrb r0, [r3]\n\
	cmp r0, r6\n\
	bne _080ACB2C\n\
	ldrb r0, [r1, 0x13]\n\
	cmp r0, 0xFF\n\
	beq _080ACB2C\n\
	movs r4, 0x1\n\
	b _080ACB60\n\
	.align 2, 0\n\
_080ACB24: .4byte gUnknown_02038696\n\
_080ACB28: .4byte gSharedMem + 0x19260\n\
_080ACB2C:\n\
	adds r2, 0x1\n\
	cmp r2, 0x3\n\
	bgt _080ACB4E\n\
	cmp r2, r7\n\
	beq _080ACB2C\n\
	adds r0, r2, r3\n\
	ldrb r0, [r0]\n\
	cmp r0, r6\n\
	bne _080ACB2C\n\
	lsls r0, r2, 3\n\
	subs r0, r2\n\
	lsls r0, 2\n\
	adds r0, r1\n\
	ldrb r0, [r0, 0x13]\n\
	cmp r0, 0xFF\n\
	beq _080ACB2C\n\
	movs r4, 0x1\n\
_080ACB4E:\n\
	cmp r4, 0\n\
	bne _080ACB60\n\
	adds r6, 0x1\n\
	cmp r6, 0x3\n\
	ble _080ACB0A\n\
_080ACB58:\n\
	lsls r0, r4, 24\n\
	asrs r1, r0, 24\n\
	cmp r1, 0\n\
	beq _080ACB98\n\
_080ACB60:\n\
	mov r5, r9\n\
	add r5, r8\n\
	lsls r5, 3\n\
	add r5, r12\n\
	ldr r0, _080ACB90 @ =gUnknown_02038696\n\
	adds r0, r2, r0\n\
	ldrb r0, [r0]\n\
	strh r0, [r5, 0xA]\n\
	lsls r0, r2, 24\n\
	lsrs r0, 24\n\
	lsls r4, r2, 3\n\
	subs r4, r2\n\
	lsls r4, 2\n\
	ldr r1, _080ACB94 @ =gSharedMem + 0x19260\n\
	adds r4, r1\n\
	ldrb r1, [r4, 0x13]\n\
	bl sub_80B146C\n\
	movs r0, 0xFF\n\
	strb r0, [r4, 0x13]\n\
	movs r0, 0x1B\n\
	strh r0, [r5, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080ACB90: .4byte gUnknown_02038696\n\
_080ACB94: .4byte gSharedMem + 0x19260\n\
_080ACB98:\n\
	mov r0, r9\n\
	add r0, r8\n\
	lsls r0, 3\n\
	add r0, r12\n\
	strh r1, [r0, 0xA]\n\
	strh r1, [r0, 0x1C]\n\
	movs r1, 0x33\n\
	strh r1, [r0, 0x8]\n\
	bl sub_80AF120\n\
	bl _080AD8CA\n\
_080ACBB0:\n\
	ldr r0, _080ACBD4 @ =gMenuWindow\n\
	bl sub_80037A0\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	bne _080ACBC0\n\
	bl _080AD8CA\n\
_080ACBC0:\n\
	ldr r0, _080ACBD8 @ =gTasks\n\
	mov r4, r8\n\
	lsls r1, r4, 2\n\
	add r1, r8\n\
	lsls r1, 3\n\
	adds r1, r0\n\
	movs r0, 0x1C\n\
	strh r0, [r1, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080ACBD4: .4byte gMenuWindow\n\
_080ACBD8: .4byte gTasks\n\
_080ACBDC:\n\
	movs r6, 0\n\
	mov r5, r8\n\
	lsls r0, r5, 2\n\
	adds r1, r0, r5\n\
	lsls r1, 3\n\
	add r1, r12\n\
	movs r3, 0xA\n\
	ldrsh r2, [r1, r3]\n\
	ldr r1, _080ACC38 @ =gUnknown_02038696\n\
	mov r9, r0\n\
	ldr r3, _080ACC3C @ =gSharedMem + 0x19260\n\
	adds r5, r1, 0\n\
	ldrb r4, [r5]\n\
	cmp r2, r4\n\
	beq _080ACC08\n\
	adds r1, r2, 0\n\
	adds r2, r5, 0\n\
_080ACBFE:\n\
	adds r6, 0x1\n\
	adds r0, r6, r2\n\
	ldrb r0, [r0]\n\
	cmp r1, r0\n\
	bne _080ACBFE\n\
_080ACC08:\n\
	lsls r0, r6, 3\n\
	subs r0, r6\n\
	lsls r0, 2\n\
	adds r0, r3\n\
	ldrb r1, [r0, 0xE]\n\
	ldrh r0, [r0, 0x2]\n\
	adds r0, r1\n\
	lsls r0, 16\n\
	asrs r0, 16\n\
	negs r1, r1\n\
	lsls r2, r6, 24\n\
	lsrs r2, 24\n\
	bl sub_80AFBA0\n\
	ldr r1, _080ACC40 @ =gTasks\n\
	mov r0, r9\n\
	add r0, r8\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	movs r1, 0x1D\n\
	strh r1, [r0, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080ACC38: .4byte gUnknown_02038696\n\
_080ACC3C: .4byte gSharedMem + 0x19260\n\
_080ACC40: .4byte gTasks\n\
_080ACC44:\n\
	movs r6, 0\n\
	mov r5, r8\n\
	lsls r0, r5, 2\n\
	adds r1, r0, r5\n\
	lsls r1, 3\n\
	add r1, r12\n\
	movs r2, 0xA\n\
	ldrsh r3, [r1, r2]\n\
	ldr r1, _080ACC90 @ =gUnknown_02038696\n\
	mov r9, r0\n\
	ldr r2, _080ACC94 @ =gSharedMem + 0x19338\n\
	adds r5, r1, 0\n\
	ldrb r4, [r5]\n\
	cmp r3, r4\n\
	beq _080ACC6C\n\
_080ACC62:\n\
	adds r6, 0x1\n\
	adds r0, r6, r1\n\
	ldrb r0, [r0]\n\
	cmp r3, r0\n\
	bne _080ACC62\n\
_080ACC6C:\n\
	lsls r0, r6, 2\n\
	adds r0, r2\n\
	ldrb r1, [r0, 0x2]\n\
	movs r0, 0x4\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080ACC7E\n\
	bl _080AD8CA\n\
_080ACC7E:\n\
	mov r0, r9\n\
	add r0, r8\n\
	lsls r0, 3\n\
	add r0, r12\n\
	movs r1, 0x27\n\
	strh r1, [r0, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080ACC90: .4byte gUnknown_02038696\n\
_080ACC94: .4byte gSharedMem + 0x19338\n\
_080ACC98:\n\
	movs r6, 0\n\
	mov r5, r8\n\
	lsls r0, r5, 2\n\
	adds r1, r0, r5\n\
	lsls r1, 3\n\
	add r1, r12\n\
	movs r3, 0xA\n\
	ldrsh r2, [r1, r3]\n\
	ldr r1, _080ACCE8 @ =gUnknown_02038696\n\
	mov r9, r0\n\
	adds r5, r1, 0\n\
	ldrb r4, [r5]\n\
	cmp r2, r4\n\
	beq _080ACCC2\n\
	adds r1, r2, 0\n\
	adds r2, r5, 0\n\
_080ACCB8:\n\
	adds r6, 0x1\n\
	adds r0, r6, r2\n\
	ldrb r0, [r0]\n\
	cmp r1, r0\n\
	bne _080ACCB8\n\
_080ACCC2:\n\
	lsls r0, r6, 24\n\
	lsrs r0, 24\n\
	movs r1, 0x1\n\
	bl sub_80AEE54\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	beq _080ACCF0\n\
	ldr r1, _080ACCEC @ =gTasks\n\
	mov r0, r9\n\
	add r0, r8\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	movs r1, 0\n\
	strh r1, [r0, 0x1C]\n\
	movs r1, 0x28\n\
	strh r1, [r0, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080ACCE8: .4byte gUnknown_02038696\n\
_080ACCEC: .4byte gTasks\n\
_080ACCF0:\n\
	ldr r0, _080ACCFC @ =gTasks\n\
	mov r1, r9\n\
	add r1, r8\n\
	lsls r1, 3\n\
	adds r1, r0\n\
	b _080ACD22\n\
	.align 2, 0\n\
_080ACCFC: .4byte gTasks\n\
_080ACD00:\n\
	mov r5, r8\n\
	lsls r0, r5, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	mov r2, r12\n\
	adds r1, r0, r2\n\
	ldrh r0, [r1, 0x1C]\n\
	adds r0, 0x1\n\
	strh r0, [r1, 0x1C]\n\
	lsls r0, 16\n\
	asrs r0, 16\n\
	cmp r0, 0x14\n\
	bgt _080ACD1E\n\
	bl _080AD8CA\n\
_080ACD1E:\n\
	movs r0, 0\n\
	strh r0, [r1, 0x1C]\n\
_080ACD22:\n\
	movs r0, 0x1E\n\
	strh r0, [r1, 0x8]\n\
	bl _080AD8CA\n\
_080ACD2A:\n\
	movs r6, 0\n\
	ldr r2, _080ACD78 @ =gUnknown_02038696\n\
	ldrb r3, [r2]\n\
	mov r4, r8\n\
	lsls r1, r4, 2\n\
	adds r0, r1, r4\n\
	lsls r0, 3\n\
	mov r5, r12\n\
	adds r4, r0, r5\n\
	movs r5, 0xA\n\
	ldrsh r0, [r4, r5]\n\
	mov r9, r1\n\
	adds r5, r2, 0\n\
	cmp r3, r0\n\
	beq _080ACD5E\n\
	adds r3, r5, 0\n\
	adds r2, r4, 0\n\
_080ACD4C:\n\
	adds r6, 0x1\n\
	cmp r6, 0x3\n\
	bgt _080ACD5E\n\
	adds r0, r6, r3\n\
	ldrb r1, [r0]\n\
	movs r4, 0xA\n\
	ldrsh r0, [r2, r4]\n\
	cmp r1, r0\n\
	bne _080ACD4C\n\
_080ACD5E:\n\
	lsls r4, r6, 24\n\
	lsrs r0, r4, 24\n\
	bl sub_80AF038\n\
	lsls r0, 24\n\
	adds r5, r4, 0\n\
	cmp r0, 0\n\
	beq _080ACD7C\n\
	movs r0, 0x63\n\
	bl PlaySE\n\
	b _080ACD82\n\
	.align 2, 0\n\
_080ACD78: .4byte gUnknown_02038696\n\
_080ACD7C:\n\
	movs r0, 0x64\n\
	bl PlaySE\n\
_080ACD82:\n\
	lsls r0, r6, 3\n\
	subs r0, r6\n\
	lsls r0, 2\n\
	ldr r1, _080ACDC0 @ =gSharedMem + 0x19260\n\
	adds r4, r0, r1\n\
	ldrb r1, [r4, 0x15]\n\
	movs r0, 0x20\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080ACDA6\n\
	lsrs r0, r5, 24\n\
	bl sub_80B03A8\n\
	ldrb r1, [r4, 0x15]\n\
	movs r0, 0x21\n\
	negs r0, r0\n\
	ands r0, r1\n\
	strb r0, [r4, 0x15]\n\
_080ACDA6:\n\
	ldr r0, _080ACDC4 @ =gTasks\n\
	mov r1, r9\n\
	add r1, r8\n\
	lsls r1, 3\n\
	adds r1, r0\n\
	ldrh r0, [r1, 0xA]\n\
	adds r0, 0x1\n\
	strh r0, [r1, 0xA]\n\
	movs r0, 0x1A\n\
	strh r0, [r1, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080ACDC0: .4byte gSharedMem + 0x19260\n\
_080ACDC4: .4byte gTasks\n\
_080ACDC8:\n\
	mov r5, r8\n\
	lsls r2, r5, 2\n\
	adds r0, r2, r5\n\
	lsls r0, 3\n\
	mov r1, r12\n\
	adds r3, r0, r1\n\
	ldrh r0, [r3, 0x1C]\n\
	adds r1, r0, 0x1\n\
	strh r1, [r3, 0x1C]\n\
	lsls r0, 16\n\
	asrs r0, 16\n\
	mov r9, r2\n\
	cmp r0, 0x9\n\
	bgt _080ACDE8\n\
	bl _080AD8CA\n\
_080ACDE8:\n\
	movs r0, 0\n\
	strh r0, [r3, 0x1C]\n\
	lsls r0, r7, 3\n\
	subs r0, r7\n\
	lsls r0, 2\n\
	ldr r1, _080ACE48 @ =gSharedMem + 0x19260\n\
	adds r2, r0, r1\n\
	ldrb r1, [r2, 0xC]\n\
	movs r0, 0x6\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _080ACE0A\n\
	ldrb r1, [r2, 0x11]\n\
	movs r0, 0x4\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080ACE36\n\
_080ACE0A:\n\
	bl sub_80AF138\n\
	ldr r0, _080ACE4C @ =gStringVar1\n\
	lsls r1, r7, 6\n\
	ldr r2, _080ACE50 @ =gContestMons + 0x2\n\
	adds r1, r2\n\
	bl StringCopy\n\
	ldr r4, _080ACE54 @ =gStringVar4\n\
	ldr r1, _080ACE58 @ =gUnknown_083CC103\n\
	adds r0, r4, 0\n\
	bl StringExpandPlaceholders\n\
	ldr r0, _080ACE5C @ =gMenuWindow\n\
	movs r2, 0xC2\n\
	lsls r2, 2\n\
	movs r1, 0xF\n\
	str r1, [sp]\n\
	adds r1, r4, 0\n\
	movs r3, 0x1\n\
	bl sub_8002EB0\n\
_080ACE36:\n\
	ldr r0, _080ACE60 @ =gTasks\n\
	mov r1, r9\n\
	add r1, r8\n\
	lsls r1, 3\n\
	adds r1, r0\n\
	movs r0, 0x34\n\
	strh r0, [r1, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080ACE48: .4byte gSharedMem + 0x19260\n\
_080ACE4C: .4byte gStringVar1\n\
_080ACE50: .4byte gContestMons + 0x2\n\
_080ACE54: .4byte gStringVar4\n\
_080ACE58: .4byte gUnknown_083CC103\n\
_080ACE5C: .4byte gMenuWindow\n\
_080ACE60: .4byte gTasks\n\
_080ACE64:\n\
	ldr r0, _080ACE9C @ =gMenuWindow\n\
	bl sub_80037A0\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	bne _080ACE74\n\
	bl _080AD8CA\n\
_080ACE74:\n\
	lsls r0, r7, 3\n\
	subs r0, r7\n\
	lsls r0, 2\n\
	ldr r1, _080ACEA0 @ =gSharedMem + 0x19260\n\
	adds r0, r1\n\
	ldrb r1, [r0, 0x15]\n\
	movs r0, 0x40\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _080ACEA8\n\
	ldr r0, _080ACEA4 @ =gTasks\n\
	mov r2, r8\n\
	lsls r1, r2, 2\n\
	add r1, r8\n\
	lsls r1, 3\n\
	adds r1, r0\n\
	movs r0, 0x11\n\
	strh r0, [r1, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080ACE9C: .4byte gMenuWindow\n\
_080ACEA0: .4byte gSharedMem + 0x19260\n\
_080ACEA4: .4byte gTasks\n\
_080ACEA8:\n\
	ldr r0, _080ACEBC @ =gTasks\n\
	mov r3, r8\n\
	lsls r1, r3, 2\n\
	add r1, r8\n\
	lsls r1, 3\n\
	adds r1, r0\n\
	movs r0, 0xE\n\
	strh r0, [r1, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080ACEBC: .4byte gTasks\n\
_080ACEC0:\n\
	lsls r0, r7, 3\n\
	subs r0, r7\n\
	lsls r0, 2\n\
	ldr r1, _080ACEE4 @ =gSharedMem + 0x19260\n\
	adds r0, r1\n\
	ldrb r4, [r0, 0x16]\n\
	lsls r4, 24\n\
	lsrs r5, r4, 24\n\
	cmp r5, 0\n\
	beq _080ACF48\n\
	bl sub_80AF138\n\
	asrs r0, r4, 24\n\
	cmp r0, 0x1\n\
	bne _080ACEF0\n\
	ldr r0, _080ACEE8 @ =gMenuWindow\n\
	ldr r1, _080ACEEC @ =gUnknown_083CBD79\n\
	b _080ACEF8\n\
	.align 2, 0\n\
_080ACEE4: .4byte gSharedMem + 0x19260\n\
_080ACEE8: .4byte gMenuWindow\n\
_080ACEEC: .4byte gUnknown_083CBD79\n\
_080ACEF0:\n\
	cmp r0, 0x2\n\
	bne _080ACF10\n\
	ldr r0, _080ACF08 @ =gMenuWindow\n\
	ldr r1, _080ACF0C @ =gUnknown_083CBD9D\n\
_080ACEF8:\n\
	movs r2, 0xC2\n\
	lsls r2, 2\n\
	movs r3, 0xF\n\
	str r3, [sp]\n\
	movs r3, 0x1\n\
	bl sub_8002EB0\n\
	b _080ACF22\n\
	.align 2, 0\n\
_080ACF08: .4byte gMenuWindow\n\
_080ACF0C: .4byte gUnknown_083CBD9D\n\
_080ACF10:\n\
	ldr r0, _080ACF3C @ =gMenuWindow\n\
	ldr r1, _080ACF40 @ =gUnknown_083CBDC6\n\
	movs r2, 0xC2\n\
	lsls r2, 2\n\
	movs r3, 0xF\n\
	str r3, [sp]\n\
	movs r3, 0x1\n\
	bl sub_8002EB0\n\
_080ACF22:\n\
	movs r0, 0x3\n\
	bl sub_80B1710\n\
	ldr r1, _080ACF44 @ =gTasks\n\
	mov r4, r8\n\
	lsls r0, r4, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	movs r1, 0\n\
	strh r1, [r0, 0x1C]\n\
	b _080ACF88\n\
	.align 2, 0\n\
_080ACF3C: .4byte gMenuWindow\n\
_080ACF40: .4byte gUnknown_083CBDC6\n\
_080ACF44: .4byte gTasks\n\
_080ACF48:\n\
	bl sub_80AF138\n\
	ldr r0, _080ACF90 @ =gStringVar1\n\
	lsls r1, r7, 6\n\
	ldr r2, _080ACF94 @ =gContestMons + 0x2\n\
	adds r1, r2\n\
	bl StringCopy\n\
	ldr r4, _080ACF98 @ =gStringVar4\n\
	ldr r1, _080ACF9C @ =gUnknown_083CBD52\n\
	adds r0, r4, 0\n\
	bl StringExpandPlaceholders\n\
	ldr r0, _080ACFA0 @ =gMenuWindow\n\
	movs r2, 0xC2\n\
	lsls r2, 2\n\
	movs r1, 0xF\n\
	str r1, [sp]\n\
	adds r1, r4, 0\n\
	movs r3, 0x1\n\
	bl sub_8002EB0\n\
	movs r0, 0x2\n\
	bl sub_80B1710\n\
	ldr r1, _080ACFA4 @ =gTasks\n\
	mov r2, r8\n\
	lsls r0, r2, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	strh r5, [r0, 0x1C]\n\
_080ACF88:\n\
	movs r1, 0x2D\n\
	strh r1, [r0, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080ACF90: .4byte gStringVar1\n\
_080ACF94: .4byte gContestMons + 0x2\n\
_080ACF98: .4byte gStringVar4\n\
_080ACF9C: .4byte gUnknown_083CBD52\n\
_080ACFA0: .4byte gMenuWindow\n\
_080ACFA4: .4byte gTasks\n\
_080ACFA8:\n\
	ldrb r1, [r6, 0x6]\n\
	movs r0, 0x10\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080ACFB6\n\
	bl _080AD8CA\n\
_080ACFB6:\n\
	ldrb r0, [r6, 0x11]\n\
	bl sub_80B09B0\n\
	ldr r1, _080ACFD0 @ =gTasks\n\
	mov r3, r8\n\
	lsls r0, r3, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	movs r1, 0xF\n\
	strh r1, [r0, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080ACFD0: .4byte gTasks\n\
_080ACFD4:\n\
	ldr r0, _080AD034 @ =gMenuWindow\n\
	bl sub_80037A0\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	bne _080ACFE4\n\
	bl _080AD8CA\n\
_080ACFE4:\n\
	ldr r1, _080AD038 @ =gTasks\n\
	mov r4, r8\n\
	lsls r0, r4, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	adds r4, r0, r1\n\
	ldrh r0, [r4, 0x1C]\n\
	adds r0, 0x1\n\
	strh r0, [r4, 0x1C]\n\
	lsls r0, 16\n\
	asrs r0, 16\n\
	cmp r0, 0x32\n\
	bgt _080AD002\n\
	bl _080AD8CA\n\
_080AD002:\n\
	lsls r0, r7, 3\n\
	subs r0, r7\n\
	lsls r0, 2\n\
	ldr r1, _080AD03C @ =gSharedMem + 0x19260\n\
	adds r6, r0, r1\n\
	ldrb r1, [r6, 0x15]\n\
	movs r5, 0x10\n\
	adds r0, r5, 0\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _080AD02C\n\
	movs r1, 0x2\n\
	ldrsh r0, [r6, r1]\n\
	ldrb r1, [r6, 0x17]\n\
	adds r2, r7, 0\n\
	bl sub_80AFBA0\n\
	ldrh r0, [r6, 0x2]\n\
	ldrb r2, [r6, 0x17]\n\
	adds r0, r2\n\
	strh r0, [r6, 0x2]\n\
_080AD02C:\n\
	strh r5, [r4, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080AD034: .4byte gMenuWindow\n\
_080AD038: .4byte gTasks\n\
_080AD03C: .4byte gSharedMem + 0x19260\n\
_080AD040:\n\
	lsls r0, r7, 2\n\
	ldr r1, _080AD06C @ =gSharedMem + 0x19338\n\
	adds r0, r1\n\
	ldrb r1, [r0, 0x2]\n\
	movs r0, 0x4\n\
	ands r0, r1\n\
	lsls r0, 24\n\
	lsrs r1, r0, 24\n\
	cmp r1, 0\n\
	beq _080AD058\n\
	bl _080AD8CA\n\
_080AD058:\n\
	mov r3, r8\n\
	lsls r0, r3, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	add r0, r12\n\
	strh r1, [r0, 0x1C]\n\
	movs r1, 0x11\n\
	strh r1, [r0, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080AD06C: .4byte gSharedMem + 0x19338\n\
_080AD070:\n\
	lsls r0, r7, 3\n\
	subs r0, r7\n\
	lsls r0, 2\n\
	ldr r1, _080AD0CC @ =gSharedMem + 0x19260\n\
	adds r0, r1\n\
	ldrb r1, [r0, 0x15]\n\
	movs r0, 0x1\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080AD0E8\n\
	bl sub_80AF138\n\
	ldr r0, _080AD0D0 @ =gStringVar1\n\
	lsls r1, r7, 6\n\
	ldr r2, _080AD0D4 @ =gContestMons + 0x2\n\
	adds r1, r2\n\
	bl StringCopy\n\
	ldr r4, _080AD0D8 @ =gStringVar4\n\
	ldr r1, _080AD0DC @ =gUnknown_083CC075\n\
	adds r0, r4, 0\n\
	bl StringExpandPlaceholders\n\
	ldr r0, _080AD0E0 @ =gMenuWindow\n\
	movs r2, 0xC2\n\
	lsls r2, 2\n\
	movs r1, 0xF\n\
	str r1, [sp]\n\
	adds r1, r4, 0\n\
	movs r3, 0x1\n\
	bl sub_8002EB0\n\
	ldr r0, _080AD0E4 @ =gTasks\n\
	mov r5, r8\n\
	lsls r4, r5, 2\n\
	add r4, r8\n\
	lsls r4, 3\n\
	adds r4, r0\n\
	movs r0, 0\n\
	strh r0, [r4, 0x1C]\n\
	bl sub_80B1710\n\
	movs r0, 0x2E\n\
	strh r0, [r4, 0x8]\n\
	bl _080AD8CA\n\
	.align 2, 0\n\
_080AD0CC: .4byte gSharedMem + 0x19260\n\
_080AD0D0: .4byte gStringVar1\n\
_080AD0D4: .4byte gContestMons + 0x2\n\
_080AD0D8: .4byte gStringVar4\n\
_080AD0DC: .4byte gUnknown_083CC075\n\
_080AD0E0: .4byte gMenuWindow\n\
_080AD0E4: .4byte gTasks\n\
_080AD0E8:\n\
	mov r1, r8\n\
	lsls r0, r1, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	add r0, r12\n\
	movs r1, 0x29\n\
	strh r1, [r0, 0x8]\n\
	bl _080AD8CA\n\
_080AD0FA:\n\
	ldrb r1, [r6, 0x6]\n\
	movs r0, 0x10\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080AD108\n\
	bl _080AD8CA\n\
_080AD108:\n\
	mov r2, r8\n\
	lsls r0, r2, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	add r0, r12\n\
	movs r1, 0x13\n\
	strh r1, [r0, 0x8]\n\
	bl _080AD8CA\n\
_080AD11A:\n\
	ldr r0, _080AD15C @ =gMenuWindow\n\
	bl sub_80037A0\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	bne _080AD12A\n\
	bl _080AD8CA\n\
_080AD12A:\n\
	lsls r4, r7, 3\n\
	subs r4, r7\n\
	lsls r4, 2\n\
	ldr r0, _080AD160 @ =gSharedMem + 0x19260\n\
	adds r4, r0\n\
	movs r3, 0x2\n\
	ldrsh r0, [r4, r3]\n\
	ldrb r1, [r4, 0x18]\n\
	negs r1, r1\n\
	adds r2, r7, 0\n\
	bl sub_80AFBA0\n\
	ldrb r1, [r4, 0x18]\n\
	ldrh r0, [r4, 0x2]\n\
	subs r0, r1\n\
	strh r0, [r4, 0x2]\n\
	ldr r1, _080AD164 @ =gTasks\n\
	mov r4, r8\n\
	lsls r0, r4, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	movs r1, 0x12\n\
	strh r1, [r0, 0x8]\n\
	b _080AD8CA\n\
	.align 2, 0\n\
_080AD15C: .4byte gMenuWindow\n\
_080AD160: .4byte gSharedMem + 0x19260\n\
_080AD164: .4byte gTasks\n\
_080AD168:\n\
	bl sub_80B0D7C\n\
	lsls r0, r7, 2\n\
	ldr r1, _080AD19C @ =gSharedMem + 0x19338\n\
	adds r0, r1\n\
	ldrb r1, [r0, 0x2]\n\
	movs r0, 0x4\n\
	ands r0, r1\n\
	lsls r0, 24\n\
	lsrs r6, r0, 24\n\
	cmp r6, 0\n\
	beq _080AD182\n\
	b _080AD8CA\n\
_080AD182:\n\
	ldr r0, _080AD1A0 @ =gTasks\n\
	mov r5, r8\n\
	lsls r4, r5, 2\n\
	add r4, r8\n\
	lsls r4, 3\n\
	adds r4, r0\n\
	strh r6, [r4, 0x1C]\n\
	bl sub_80AF138\n\
	movs r0, 0x29\n\
	strh r0, [r4, 0x8]\n\
	b _080AD8CA\n\
	.align 2, 0\n\
_080AD19C: .4byte gSharedMem + 0x19338\n\
_080AD1A0: .4byte gTasks\n\
_080AD1A4:\n\
	ldr r2, _080AD1CC @ =gSharedMem + 0x19328\n\
	ldrb r1, [r2, 0x1]\n\
	movs r0, 0x1\n\
	ands r0, r1\n\
	adds r1, r2, 0\n\
	cmp r0, 0\n\
	beq _080AD1D0\n\
	ldr r0, [r1]\n\
	lsls r0, 20\n\
	lsrs r0, 29\n\
	cmp r7, r0\n\
	beq _080AD1D0\n\
	mov r1, r8\n\
	lsls r0, r1, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	add r0, r12\n\
	movs r1, 0x39\n\
	strh r1, [r0, 0x8]\n\
	b _080AD8CA\n\
	.align 2, 0\n\
_080AD1CC: .4byte gSharedMem + 0x19328\n\
_080AD1D0:\n\
	ldrb r4, [r1]\n\
	lsls r2, r7, 3\n\
	subs r0, r2, r7\n\
	lsls r0, 2\n\
	subs r1, 0xC8\n\
	adds r5, r0, r1\n\
	ldrb r1, [r5, 0x11]\n\
	movs r0, 0x10\n\
	ands r0, r1\n\
	mov r10, r2\n\
	cmp r0, 0\n\
	beq _080AD204\n\
	movs r4, 0x1\n\
	ldr r0, _080AD1FC @ =gStringVar3\n\
	ldrh r2, [r5, 0x6]\n\
	movs r1, 0xD\n\
	muls r1, r2\n\
	ldr r2, _080AD200 @ =gMoveNames\n\
	adds r1, r2\n\
	bl StringCopy\n\
	b _080AD21E\n\
	.align 2, 0\n\
_080AD1FC: .4byte gStringVar3\n\
_080AD200: .4byte gMoveNames\n\
_080AD204:\n\
	ldr r0, _080AD270 @ =gStringVar3\n\
	ldr r3, _080AD274 @ =gUnknown_083CC2D8\n\
	ldr r2, _080AD278 @ =gContestMoves\n\
	ldrh r1, [r5, 0x6]\n\
	lsls r1, 3\n\
	adds r1, r2\n\
	ldrb r1, [r1, 0x1]\n\
	lsls r1, 29\n\
	lsrs r1, 27\n\
	adds r1, r3\n\
	ldr r1, [r1]\n\
	bl StringCopy\n\
_080AD21E:\n\
	lsls r0, r4, 24\n\
	cmp r0, 0\n\
	ble _080AD23A\n\
	mov r2, r10\n\
	subs r0, r2, r7\n\
	lsls r0, 2\n\
	ldr r1, _080AD27C @ =gSharedMem + 0x19260\n\
	adds r0, r1\n\
	ldrb r1, [r0, 0x15]\n\
	movs r0, 0x1\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080AD23A\n\
	movs r4, 0\n\
_080AD23A:\n\
	bl sub_80AF138\n\
	ldr r0, _080AD280 @ =gStringVar1\n\
	lsls r1, r7, 6\n\
	ldr r2, _080AD284 @ =gContestMons + 0x2\n\
	adds r1, r2\n\
	bl StringCopy\n\
	ldr r3, _080AD288 @ =gSharedMem + 0x19204\n\
	ldrb r0, [r3, 0x13]\n\
	lsls r1, r4, 24\n\
	asrs r2, r1, 24\n\
	adds r0, r2, r0\n\
	strb r0, [r3, 0x13]\n\
	lsls r0, 24\n\
	adds r4, r1, 0\n\
	cmp r0, 0\n\
	bge _080AD262\n\
	movs r0, 0\n\
	strb r0, [r3, 0x13]\n\
_080AD262:\n\
	cmp r2, 0\n\
	bne _080AD290\n\
	ldr r0, _080AD28C @ =gTasks\n\
	mov r3, r8\n\
	lsls r1, r3, 2\n\
	b _080AD6EC\n\
	.align 2, 0\n\
_080AD270: .4byte gStringVar3\n\
_080AD274: .4byte gUnknown_083CC2D8\n\
_080AD278: .4byte gContestMoves\n\
_080AD27C: .4byte gSharedMem + 0x19260\n\
_080AD280: .4byte gStringVar1\n\
_080AD284: .4byte gContestMons + 0x2\n\
_080AD288: .4byte gSharedMem + 0x19204\n\
_080AD28C: .4byte gTasks\n\
_080AD290:\n\
	cmp r2, 0\n\
	bge _080AD2A8\n\
	ldr r0, _080AD2A0 @ =gStringVar4\n\
	ldr r1, _080AD2A4 @ =gUnknown_083CC0BC\n\
	bl StringExpandPlaceholders\n\
	b _080AD2D0\n\
	.align 2, 0\n\
_080AD2A0: .4byte gStringVar4\n\
_080AD2A4: .4byte gUnknown_083CC0BC\n\
_080AD2A8:\n\
	cmp r2, 0\n\
	ble _080AD2C8\n\
	movs r0, 0x13\n\
	ldrsb r0, [r3, r0]\n\
	cmp r0, 0x4\n\
	bgt _080AD2C8\n\
	ldr r0, _080AD2C0 @ =gStringVar4\n\
	ldr r1, _080AD2C4 @ =gUnknown_083CC0A0\n\
	bl StringExpandPlaceholders\n\
	b _080AD2D0\n\
	.align 2, 0\n\
_080AD2C0: .4byte gStringVar4\n\
_080AD2C4: .4byte gUnknown_083CC0A0\n\
_080AD2C8:\n\
	ldr r0, _080AD300 @ =gStringVar4\n\
	ldr r1, _080AD304 @ =gUnknown_083CC0E3\n\
	bl StringExpandPlaceholders\n\
_080AD2D0:\n\
	ldr r0, _080AD308 @ =gMenuWindow\n\
	ldr r1, _080AD300 @ =gStringVar4\n\
	movs r2, 0xC2\n\
	lsls r2, 2\n\
	movs r3, 0xF\n\
	str r3, [sp]\n\
	movs r3, 0x1\n\
	bl sub_8002EB0\n\
	ldr r1, _080AD30C @ =gTasks\n\
	mov r5, r8\n\
	lsls r0, r5, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	adds r1, r0, r1\n\
	movs r0, 0\n\
	strh r0, [r1, 0x1C]\n\
	strh r0, [r1, 0x1E]\n\
	cmp r4, 0\n\
	bge _080AD310\n\
	movs r0, 0x35\n\
	strh r0, [r1, 0x8]\n\
	b _080AD8CA\n\
	.align 2, 0\n\
_080AD300: .4byte gStringVar4\n\
_080AD304: .4byte gUnknown_083CC0E3\n\
_080AD308: .4byte gMenuWindow\n\
_080AD30C: .4byte gTasks\n\
_080AD310:\n\
	movs r0, 0x36\n\
	strh r0, [r1, 0x8]\n\
	b _080AD8CA\n\
_080AD316:\n\
	mov r1, r8\n\
	lsls r0, r1, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	mov r2, r12\n\
	adds r4, r0, r2\n\
	movs r3, 0x1C\n\
	ldrsh r2, [r4, r3]\n\
	cmp r2, 0x1\n\
	beq _080AD354\n\
	cmp r2, 0x1\n\
	bgt _080AD334\n\
	cmp r2, 0\n\
	beq _080AD33E\n\
	b _080AD8CA\n\
_080AD334:\n\
	cmp r2, 0x2\n\
	beq _080AD37C\n\
	cmp r2, 0x3\n\
	beq _080AD3B0\n\
	b _080AD8CA\n\
_080AD33E:\n\
	movs r0, 0x1\n\
	negs r0, r0\n\
	movs r1, 0x1\n\
	bl sub_80B1EA8\n\
	ldr r0, _080AD350 @ =0x00000187\n\
	bl PlayFanfare\n\
	b _080AD3A8\n\
	.align 2, 0\n\
_080AD350: .4byte 0x00000187\n\
_080AD354:\n\
	ldrb r0, [r6, 0x7]\n\
	ands r2, r0\n\
	cmp r2, 0\n\
	beq _080AD35E\n\
	b _080AD8CA\n\
_080AD35E:\n\
	ldr r0, _080AD378 @ =gMenuWindow\n\
	bl sub_80037A0\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	bne _080AD36C\n\
	b _080AD8CA\n\
_080AD36C:\n\
	movs r0, 0x1\n\
	negs r0, r0\n\
	bl sub_80B1CBC\n\
	b _080AD3A8\n\
	.align 2, 0\n\
_080AD378: .4byte gMenuWindow\n\
_080AD37C:\n\
	ldrb r1, [r6, 0x6]\n\
	movs r0, 0x20\n\
	ands r0, r1\n\
	lsls r0, 24\n\
	lsrs r2, r0, 24\n\
	cmp r2, 0\n\
	beq _080AD38C\n\
	b _080AD8CA\n\
_080AD38C:\n\
	ldrh r0, [r4, 0x1E]\n\
	adds r1, r0, 0x1\n\
	strh r1, [r4, 0x1E]\n\
	lsls r0, 16\n\
	asrs r0, 16\n\
	cmp r0, 0x1D\n\
	bgt _080AD39C\n\
	b _080AD8CA\n\
_080AD39C:\n\
	strh r2, [r4, 0x1E]\n\
	movs r1, 0x1\n\
	negs r1, r1\n\
	adds r0, r1, 0\n\
	bl sub_80B1EA8\n\
_080AD3A8:\n\
	ldrh r0, [r4, 0x1C]\n\
	adds r0, 0x1\n\
	strh r0, [r4, 0x1C]\n\
	b _080AD8CA\n\
_080AD3B0:\n\
	ldr r0, _080AD3CC @ =gPaletteFade\n\
	ldrb r1, [r0, 0x7]\n\
	movs r0, 0x80\n\
	ands r0, r1\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	cmp r0, 0\n\
	beq _080AD3C2\n\
	b _080AD8CA\n\
_080AD3C2:\n\
	strh r0, [r4, 0x1C]\n\
	strh r0, [r4, 0x1E]\n\
	movs r0, 0x2B\n\
	strh r0, [r4, 0x8]\n\
	b _080AD8CA\n\
	.align 2, 0\n\
_080AD3CC: .4byte gPaletteFade\n\
_080AD3D0:\n\
	mov r4, r8\n\
	lsls r1, r4, 2\n\
	adds r0, r1, r4\n\
	lsls r0, 3\n\
	add r0, r12\n\
	movs r5, 0x1C\n\
	ldrsh r0, [r0, r5]\n\
	mov r9, r1\n\
	cmp r0, 0x4\n\
	bls _080AD3E6\n\
	b _080AD8CA\n\
_080AD3E6:\n\
	lsls r0, 2\n\
	ldr r1, _080AD3F0 @ =_080AD3F4\n\
	adds r0, r1\n\
	ldr r0, [r0]\n\
	mov pc, r0\n\
	.align 2, 0\n\
_080AD3F0: .4byte _080AD3F4\n\
	.align 2, 0\n\
_080AD3F4:\n\
	.4byte _080AD408\n\
	.4byte _080AD420\n\
	.4byte _080AD43E\n\
	.4byte _080AD4A0\n\
	.4byte _080AD4EC\n\
_080AD408:\n\
	ldr r0, _080AD41C @ =gMenuWindow\n\
	bl sub_80037A0\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	bne _080AD416\n\
	b _080AD8CA\n\
_080AD416:\n\
	movs r0, 0x1\n\
	movs r1, 0x1\n\
	b _080AD4C8\n\
	.align 2, 0\n\
_080AD41C: .4byte gMenuWindow\n\
_080AD420:\n\
	ldrb r1, [r6, 0x7]\n\
	movs r0, 0x1\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080AD42C\n\
	b _080AD8CA\n\
_080AD42C:\n\
	bl sub_80B1DDC\n\
	movs r0, 0xDF\n\
	bl PlaySE\n\
	movs r0, 0x1\n\
	bl sub_80B1CBC\n\
	b _080AD4CC\n\
_080AD43E:\n\
	ldrb r1, [r6, 0x6]\n\
	movs r0, 0x20\n\
	ands r0, r1\n\
	lsls r0, 24\n\
	lsrs r2, r0, 24\n\
	cmp r2, 0\n\
	beq _080AD44E\n\
	b _080AD8CA\n\
_080AD44E:\n\
	mov r0, r9\n\
	add r0, r8\n\
	lsls r0, 3\n\
	mov r1, r12\n\
	adds r3, r0, r1\n\
	ldrh r0, [r3, 0x1E]\n\
	adds r1, r0, 0x1\n\
	strh r1, [r3, 0x1E]\n\
	lsls r0, 16\n\
	asrs r0, 16\n\
	cmp r0, 0x1D\n\
	bgt _080AD468\n\
	b _080AD8CA\n\
_080AD468:\n\
	strh r2, [r3, 0x1E]\n\
	lsls r4, r7, 3\n\
	subs r4, r7\n\
	lsls r4, 2\n\
	adds r0, r6, 0\n\
	adds r0, 0x5C\n\
	adds r4, r0\n\
	movs r2, 0x2\n\
	ldrsh r0, [r4, r2]\n\
	movs r1, 0x92\n\
	lsls r1, 1\n\
	adds r5, r6, r1\n\
	movs r1, 0x2\n\
	ldrsb r1, [r5, r1]\n\
	adds r2, r7, 0\n\
	str r3, [sp, 0x4]\n\
	bl sub_80AFBA0\n\
	movs r0, 0x2\n\
	ldrsb r0, [r5, r0]\n\
	ldrh r2, [r4, 0x2]\n\
	adds r0, r2\n\
	strh r0, [r4, 0x2]\n\
	ldr r3, [sp, 0x4]\n\
	ldrh r0, [r3, 0x1C]\n\
	adds r0, 0x1\n\
	strh r0, [r3, 0x1C]\n\
	b _080AD8CA\n\
_080AD4A0:\n\
	lsls r0, r7, 2\n\
	ldr r2, _080AD4E0 @ =gSharedMem + 0x19338\n\
	adds r0, r2\n\
	ldrb r1, [r0, 0x2]\n\
	movs r0, 0x4\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080AD4B2\n\
	b _080AD8CA\n\
_080AD4B2:\n\
	ldr r3, _080AD4E4 @ =0xfffffecc\n\
	adds r0, r2, r3\n\
	ldrb r1, [r0, 0x6]\n\
	movs r0, 0x80\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080AD4C2\n\
	b _080AD8CA\n\
_080AD4C2:\n\
	movs r1, 0x1\n\
	negs r1, r1\n\
	movs r0, 0x1\n\
_080AD4C8:\n\
	bl sub_80B1EA8\n\
_080AD4CC:\n\
	ldr r0, _080AD4E8 @ =gTasks\n\
	mov r1, r9\n\
	add r1, r8\n\
	lsls r1, 3\n\
	adds r1, r0\n\
	ldrh r0, [r1, 0x1C]\n\
	adds r0, 0x1\n\
	strh r0, [r1, 0x1C]\n\
	b _080AD8CA\n\
	.align 2, 0\n\
_080AD4E0: .4byte gSharedMem + 0x19338\n\
_080AD4E4: .4byte 0xfffffecc\n\
_080AD4E8: .4byte gTasks\n\
_080AD4EC:\n\
	ldr r0, _080AD510 @ =gPaletteFade\n\
	ldrb r1, [r0, 0x7]\n\
	movs r0, 0x80\n\
	ands r0, r1\n\
	lsls r0, 24\n\
	lsrs r1, r0, 24\n\
	cmp r1, 0\n\
	beq _080AD4FE\n\
	b _080AD8CA\n\
_080AD4FE:\n\
	mov r0, r9\n\
	add r0, r8\n\
	lsls r0, 3\n\
	add r0, r12\n\
	strh r1, [r0, 0x1C]\n\
	strh r1, [r0, 0x1E]\n\
	movs r1, 0x2B\n\
	strh r1, [r0, 0x8]\n\
	b _080AD8CA\n\
	.align 2, 0\n\
_080AD510: .4byte gPaletteFade\n\
_080AD514:\n\
	lsls r0, r7, 2\n\
	ldr r1, _080AD534 @ =gSharedMem + 0x19338\n\
	adds r0, r1\n\
	ldrb r1, [r0, 0x2]\n\
	movs r0, 0x4\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080AD526\n\
	b _080AD8CA\n\
_080AD526:\n\
	bl sub_80AF138\n\
	ldr r0, _080AD538 @ =gTasks\n\
	mov r4, r8\n\
	lsls r1, r4, 2\n\
	b _080AD6EC\n\
	.align 2, 0\n\
_080AD534: .4byte gSharedMem + 0x19338\n\
_080AD538: .4byte gTasks\n\
_080AD53C:\n\
	bl sub_80AF138\n\
	ldr r0, _080AD5A8 @ =gStringVar3\n\
	ldr r4, _080AD5AC @ =gSharedMem + 0x19328\n\
	ldr r1, [r4]\n\
	lsls r1, 20\n\
	lsrs r1, 29\n\
	lsls r1, 6\n\
	ldr r5, _080AD5B0 @ =gContestMons + 0x2\n\
	adds r1, r5\n\
	bl StringCopy\n\
	ldr r0, _080AD5B4 @ =gStringVar1\n\
	lsls r1, r7, 6\n\
	adds r1, r5\n\
	bl StringCopy\n\
	ldr r0, _080AD5B8 @ =gStringVar2\n\
	lsls r1, r7, 3\n\
	subs r1, r7\n\
	lsls r1, 2\n\
	subs r4, 0xC8\n\
	adds r1, r4\n\
	ldrh r2, [r1, 0x6]\n\
	movs r1, 0xD\n\
	muls r1, r2\n\
	ldr r2, _080AD5BC @ =gMoveNames\n\
	adds r1, r2\n\
	bl StringCopy\n\
	ldr r4, _080AD5C0 @ =gStringVar4\n\
	ldr r1, _080AD5C4 @ =gUnknown_083CC14A\n\
	adds r0, r4, 0\n\
	bl StringExpandPlaceholders\n\
	ldr r0, _080AD5C8 @ =gMenuWindow\n\
	movs r2, 0xC2\n\
	lsls r2, 2\n\
	movs r1, 0xF\n\
	str r1, [sp]\n\
	adds r1, r4, 0\n\
	movs r3, 0x1\n\
	bl sub_8002EB0\n\
	ldr r1, _080AD5CC @ =gTasks\n\
	mov r5, r8\n\
	lsls r0, r5, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	movs r1, 0x3A\n\
	strh r1, [r0, 0x8]\n\
	b _080AD8CA\n\
	.align 2, 0\n\
_080AD5A8: .4byte gStringVar3\n\
_080AD5AC: .4byte gSharedMem + 0x19328\n\
_080AD5B0: .4byte gContestMons + 0x2\n\
_080AD5B4: .4byte gStringVar1\n\
_080AD5B8: .4byte gStringVar2\n\
_080AD5BC: .4byte gMoveNames\n\
_080AD5C0: .4byte gStringVar4\n\
_080AD5C4: .4byte gUnknown_083CC14A\n\
_080AD5C8: .4byte gMenuWindow\n\
_080AD5CC: .4byte gTasks\n\
_080AD5D0:\n\
	ldr r5, _080AD614 @ =gMenuWindow\n\
	adds r0, r5, 0\n\
	bl sub_80037A0\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	bne _080AD5E0\n\
	b _080AD8CA\n\
_080AD5E0:\n\
	bl sub_80AF138\n\
	ldr r4, _080AD618 @ =gStringVar4\n\
	ldr r1, _080AD61C @ =gUnknown_083CC16E\n\
	adds r0, r4, 0\n\
	bl StringExpandPlaceholders\n\
	movs r2, 0xC2\n\
	lsls r2, 2\n\
	movs r0, 0xF\n\
	str r0, [sp]\n\
	adds r0, r5, 0\n\
	adds r1, r4, 0\n\
	movs r3, 0x1\n\
	bl sub_8002EB0\n\
	ldr r1, _080AD620 @ =gTasks\n\
	mov r2, r8\n\
	lsls r0, r2, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	movs r1, 0x3B\n\
	strh r1, [r0, 0x8]\n\
	b _080AD8CA\n\
	.align 2, 0\n\
_080AD614: .4byte gMenuWindow\n\
_080AD618: .4byte gStringVar4\n\
_080AD61C: .4byte gUnknown_083CC16E\n\
_080AD620: .4byte gTasks\n\
_080AD624:\n\
	ldr r0, _080AD640 @ =gMenuWindow\n\
	bl sub_80037A0\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	bne _080AD632\n\
	b _080AD8CA\n\
_080AD632:\n\
	bl sub_80AF138\n\
	ldr r0, _080AD644 @ =gTasks\n\
	mov r3, r8\n\
	lsls r1, r3, 2\n\
	b _080AD6EC\n\
	.align 2, 0\n\
_080AD640: .4byte gMenuWindow\n\
_080AD644: .4byte gTasks\n\
_080AD648:\n\
	lsls r0, r7, 3\n\
	subs r0, r7\n\
	lsls r0, 2\n\
	ldr r1, _080AD6B4 @ =gSharedMem + 0x19260\n\
	adds r4, r0, r1\n\
	ldrb r1, [r4, 0x15]\n\
	movs r0, 0x10\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080AD664\n\
	movs r0, 0x11\n\
	negs r0, r0\n\
	ands r0, r1\n\
	strb r0, [r4, 0x15]\n\
_080AD664:\n\
	adds r0, r7, 0\n\
	bl sub_80B09B0\n\
	ldr r0, _080AD6B8 @ =gStringVar1\n\
	lsls r1, r7, 6\n\
	ldr r2, _080AD6BC @ =gContestMons + 0x2\n\
	adds r1, r2\n\
	bl StringCopy\n\
	ldr r0, _080AD6C0 @ =gStringVar2\n\
	ldrh r2, [r4, 0x6]\n\
	movs r1, 0xD\n\
	muls r1, r2\n\
	ldr r2, _080AD6C4 @ =gMoveNames\n\
	adds r1, r2\n\
	bl StringCopy\n\
	ldr r4, _080AD6C8 @ =gStringVar4\n\
	ldr r1, _080AD6CC @ =gUnknown_083CBF60\n\
	adds r0, r4, 0\n\
	bl StringExpandPlaceholders\n\
	ldr r0, _080AD6D0 @ =gMenuWindow\n\
	movs r2, 0xC2\n\
	lsls r2, 2\n\
	movs r1, 0xF\n\
	str r1, [sp]\n\
	adds r1, r4, 0\n\
	movs r3, 0x1\n\
	bl sub_8002EB0\n\
	ldr r1, _080AD6D4 @ =gTasks\n\
	mov r4, r8\n\
	lsls r0, r4, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	movs r1, 0x22\n\
	strh r1, [r0, 0x8]\n\
	b _080AD8CA\n\
	.align 2, 0\n\
_080AD6B4: .4byte gSharedMem + 0x19260\n\
_080AD6B8: .4byte gStringVar1\n\
_080AD6BC: .4byte gContestMons + 0x2\n\
_080AD6C0: .4byte gStringVar2\n\
_080AD6C4: .4byte gMoveNames\n\
_080AD6C8: .4byte gStringVar4\n\
_080AD6CC: .4byte gUnknown_083CBF60\n\
_080AD6D0: .4byte gMenuWindow\n\
_080AD6D4: .4byte gTasks\n\
_080AD6D8:\n\
	ldr r0, _080AD6F8 @ =gMenuWindow\n\
	bl sub_80037A0\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	bne _080AD6E6\n\
	b _080AD8CA\n\
_080AD6E6:\n\
	ldr r0, _080AD6FC @ =gTasks\n\
	mov r5, r8\n\
	lsls r1, r5, 2\n\
_080AD6EC:\n\
	add r1, r8\n\
	lsls r1, 3\n\
	adds r1, r0\n\
	movs r0, 0x37\n\
	strh r0, [r1, 0x8]\n\
	b _080AD8CA\n\
	.align 2, 0\n\
_080AD6F8: .4byte gMenuWindow\n\
_080AD6FC: .4byte gTasks\n\
_080AD700:\n\
	bl sub_80B1BDC\n\
	ldr r0, _080AD718 @ =gTasks\n\
	mov r2, r8\n\
	lsls r1, r2, 2\n\
	add r1, r8\n\
	lsls r1, 3\n\
	adds r1, r0\n\
	movs r0, 0x38\n\
	strh r0, [r1, 0x8]\n\
	b _080AD8CA\n\
	.align 2, 0\n\
_080AD718: .4byte gTasks\n\
_080AD71C:\n\
	ldrb r1, [r6, 0x6]\n\
	movs r0, 0x40\n\
	ands r0, r1\n\
	lsls r0, 24\n\
	lsrs r1, r0, 24\n\
	cmp r1, 0\n\
	beq _080AD72C\n\
	b _080AD8CA\n\
_080AD72C:\n\
	movs r0, 0x13\n\
	ldrsb r0, [r6, r0]\n\
	cmp r0, 0x4\n\
	ble _080AD73A\n\
	strb r1, [r6, 0x13]\n\
	bl sub_80B1928\n\
_080AD73A:\n\
	ldr r0, _080AD74C @ =gTasks\n\
	mov r3, r8\n\
	lsls r1, r3, 2\n\
	add r1, r8\n\
	lsls r1, 3\n\
	adds r1, r0\n\
	movs r0, 0xA\n\
	strh r0, [r1, 0x8]\n\
	b _080AD8CA\n\
	.align 2, 0\n\
_080AD74C: .4byte gTasks\n\
_080AD750:\n\
	mov r4, r8\n\
	lsls r2, r4, 2\n\
	add r2, r8\n\
	lsls r2, 3\n\
	add r2, r12\n\
	ldrb r5, [r2, 0xC]\n\
	ldr r1, _080AD774 @ =gSprites\n\
	lsls r0, r5, 4\n\
	adds r0, r5\n\
	lsls r0, 2\n\
	adds r1, 0x1C\n\
	adds r0, r1\n\
	ldr r1, _080AD778 @ =sub_80AD92C\n\
	str r1, [r0]\n\
	movs r0, 0xB\n\
	strh r0, [r2, 0x8]\n\
	b _080AD8CA\n\
	.align 2, 0\n\
_080AD774: .4byte gSprites\n\
_080AD778: .4byte sub_80AD92C\n\
_080AD77C:\n\
	mov r5, r8\n\
	lsls r0, r5, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	mov r1, r12\n\
	adds r4, r0, r1\n\
	ldrb r5, [r4, 0xC]\n\
	ldr r1, _080AD7B4 @ =gSprites\n\
	lsls r0, r5, 4\n\
	adds r0, r5\n\
	lsls r0, 2\n\
	adds r6, r0, r1\n\
	adds r0, r6, 0\n\
	adds r0, 0x3E\n\
	ldrb r0, [r0]\n\
	lsls r0, 29\n\
	cmp r0, 0\n\
	blt _080AD7A2\n\
	b _080AD8CA\n\
_080AD7A2:\n\
	adds r0, r6, 0\n\
	bl FreeSpriteOamMatrix\n\
	adds r0, r6, 0\n\
	bl DestroySprite\n\
	movs r0, 0x14\n\
	strh r0, [r4, 0x8]\n\
	b _080AD8CA\n\
	.align 2, 0\n\
_080AD7B4: .4byte gSprites\n\
_080AD7B8:\n\
	movs r6, 0\n\
	mov r2, r8\n\
	lsls r2, 2\n\
	mov r9, r2\n\
_080AD7C0:\n\
	lsls r0, r6, 24\n\
	lsrs r0, 24\n\
	movs r1, 0x1\n\
	bl sub_80B0CDC\n\
	adds r6, 0x1\n\
	cmp r6, 0x3\n\
	ble _080AD7C0\n\
	ldr r1, _080AD7E4 @ =gTasks\n\
	mov r0, r9\n\
	add r0, r8\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	movs r1, 0\n\
	strh r1, [r0, 0x1C]\n\
	movs r1, 0x15\n\
	strh r1, [r0, 0x8]\n\
	b _080AD8CA\n\
	.align 2, 0\n\
_080AD7E4: .4byte gTasks\n\
_080AD7E8:\n\
	bl sub_80AF138\n\
	ldr r0, _080AD828 @ =gStringVar1\n\
	lsls r1, r7, 6\n\
	ldr r2, _080AD82C @ =gContestMons + 0x2\n\
	adds r1, r2\n\
	bl StringCopy\n\
	ldr r4, _080AD830 @ =gStringVar4\n\
	ldr r1, _080AD834 @ =gUnknown_083CB00D\n\
	adds r0, r4, 0\n\
	bl StringExpandPlaceholders\n\
	ldr r0, _080AD838 @ =gMenuWindow\n\
	movs r2, 0xC2\n\
	lsls r2, 2\n\
	movs r1, 0xF\n\
	str r1, [sp]\n\
	adds r1, r4, 0\n\
	movs r3, 0x1\n\
	bl sub_8002EB0\n\
	ldr r1, _080AD83C @ =gTasks\n\
	mov r3, r8\n\
	lsls r0, r3, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	movs r1, 0x20\n\
	strh r1, [r0, 0x8]\n\
	b _080AD8CA\n\
	.align 2, 0\n\
_080AD828: .4byte gStringVar1\n\
_080AD82C: .4byte gContestMons + 0x2\n\
_080AD830: .4byte gStringVar4\n\
_080AD834: .4byte gUnknown_083CB00D\n\
_080AD838: .4byte gMenuWindow\n\
_080AD83C: .4byte gTasks\n\
_080AD840:\n\
	ldr r0, _080AD860 @ =gMenuWindow\n\
	bl sub_80037A0\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	beq _080AD8CA\n\
	ldr r0, _080AD864 @ =gTasks\n\
	mov r4, r8\n\
	lsls r1, r4, 2\n\
	add r1, r8\n\
	lsls r1, 3\n\
	adds r1, r0\n\
	movs r0, 0x15\n\
	strh r0, [r1, 0x8]\n\
	b _080AD8CA\n\
	.align 2, 0\n\
_080AD860: .4byte gMenuWindow\n\
_080AD864: .4byte gTasks\n\
_080AD868:\n\
	mov r5, r8\n\
	lsls r0, r5, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	mov r2, r12\n\
	adds r1, r0, r2\n\
	ldrh r0, [r1, 0x1C]\n\
	adds r0, 0x1\n\
	strh r0, [r1, 0x1C]\n\
	lsls r0, 16\n\
	asrs r0, 16\n\
	cmp r0, 0x1D\n\
	ble _080AD8CA\n\
	movs r0, 0\n\
	strh r0, [r1, 0x1C]\n\
	movs r0, 0x16\n\
	strh r0, [r1, 0x8]\n\
	b _080AD8CA\n\
_080AD88C:\n\
	ldrb r0, [r6, 0x10]\n\
	adds r0, 0x1\n\
	movs r1, 0\n\
	strb r0, [r6, 0x10]\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	cmp r0, 0x4\n\
	bne _080AD8B8\n\
	mov r3, r8\n\
	lsls r0, r3, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	add r0, r12\n\
	strh r1, [r0, 0x8]\n\
	strh r1, [r0, 0xA]\n\
	strh r1, [r0, 0xC]\n\
	ldr r1, _080AD8B4 @ =sub_80AD960\n\
	str r1, [r0]\n\
	b _080AD8C4\n\
	.align 2, 0\n\
_080AD8B4: .4byte sub_80AD960\n\
_080AD8B8:\n\
	mov r4, r8\n\
	lsls r0, r4, 2\n\
	add r0, r8\n\
	lsls r0, 3\n\
	add r0, r12\n\
	strh r1, [r0, 0x8]\n\
_080AD8C4:\n\
	movs r0, 0\n\
	bl nullsub_18\n\
_080AD8CA:\n\
	add sp, 0x8\n\
	pop {r3-r5}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	mov r10, r5\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
    .syntax divided\n");
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
    struct UnknownContestStruct1 *s = &shared19260.unk19260[gContestPlayerMonIndex];
    u8 r4 = s->unk1A;

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
    struct UnknownContestStruct1 *s;

    gUnknown_030042A0 = 0;
    gUnknown_03004280 = 0;
    for (i = 0; i < 4; i++)
        gUnknown_02038680[i] = shared19260.unk19260[i].unk4;
    sub_80AF668();
    sub_80AF138();
    s = &shared19260.unk19260[gContestPlayerMonIndex];
    sub_80BE23C(s->unk8);
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

// CreateContestMon
void sub_80AE098(u8 a)
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
        gContestMons[gContestPlayerMonIndex].unk15 = 0xD8;
    else
        gContestMons[gContestPlayerMonIndex].unk15 = 0xD9;
    gContestMons[gContestPlayerMonIndex].unk18 = 0;
    gContestMons[gContestPlayerMonIndex].unk2C = 0;
    gContestMons[gContestPlayerMonIndex].species = GetMonData(&gPlayerParty[a], MON_DATA_SPECIES);
    GetMonData(&gPlayerParty[a], MON_DATA_NICKNAME, name);
    StringGetEnd10(name);
    if (gIsLinkContest & 1)
    {
        StripExtCtrlCodes(name);
        if (GetMonData(&gPlayerParty[a], MON_DATA_LANGUAGE) == LANGUAGE_JAPANESE)
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
    gContestMons[gContestPlayerMonIndex].cool = GetMonData(&gPlayerParty[a], MON_DATA_COOL);
    gContestMons[gContestPlayerMonIndex].beauty = GetMonData(&gPlayerParty[a], MON_DATA_BEAUTY);
    gContestMons[gContestPlayerMonIndex].cute = GetMonData(&gPlayerParty[a], MON_DATA_CUTE);
    gContestMons[gContestPlayerMonIndex].smart = GetMonData(&gPlayerParty[a], MON_DATA_SMART);
    gContestMons[gContestPlayerMonIndex].tough = GetMonData(&gPlayerParty[a], MON_DATA_TOUGH);
    gContestMons[gContestPlayerMonIndex].sheen = GetMonData(&gPlayerParty[a], MON_DATA_SHEEN);
    gContestMons[gContestPlayerMonIndex].moves[0] = GetMonData(&gPlayerParty[a], MON_DATA_MOVE1);
    gContestMons[gContestPlayerMonIndex].moves[1] = GetMonData(&gPlayerParty[a], MON_DATA_MOVE2);
    gContestMons[gContestPlayerMonIndex].moves[2] = GetMonData(&gPlayerParty[a], MON_DATA_MOVE3);
    gContestMons[gContestPlayerMonIndex].moves[3] = GetMonData(&gPlayerParty[a], MON_DATA_MOVE4);
    gContestMons[gContestPlayerMonIndex].personality = GetMonData(&gPlayerParty[a], MON_DATA_PERSONALITY);
    gContestMons[gContestPlayerMonIndex].otId = GetMonData(&gPlayerParty[a], MON_DATA_OT_ID);

    heldItem = GetMonData(&gPlayerParty[a], MON_DATA_HELD_ITEM);
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
