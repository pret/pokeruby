#include "global.h"
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
#include "palette.h"
#include "random.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "unknown_task.h"

extern bool8 AreMovesContestCombo(u16, u16);
extern void sub_80C8A38(u8);
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
#if 0
    /*0x1920A*/ u16 unk1920A_0:4;
                u16 unk1920A_4:1;
                u16 unk1920A_5:1;
                u16 unk1920A_6:1;
                u16 unk1920A_7:2;
                u16 unk1920B_1:1;
                u16 unk1920B_2:1;
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
    u8 filler4[2];
    u16 unk6;  // move
    u16 unk8;
    u8 unkA;   // contest category
    u8 unkB_0:2;
    u8 unkB_2:1;
    u8 unkB_3:4;
    u8 unkB_7:1;
    u8 unkC_0:1;
    u8 unkC_1:1;
    u8 unkC_2:1;
    u8 fillerD;
    u8 unkE;
    u8 fillerF;
    u8 unk10;  // maybe a bitfield
    u8 unk11;
    u8 filler12;
    u8 unk13;
    u8 unk14;
    u8 unk15;
    u8 unk16;
    u8 unk17;
    u8 unk18;
    u8 unk19;
    u8 filler1A[0x1C-0x1A];
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

struct UnknownContestStruct5
{
    u16 bits_0:8;
    u16 bits_8:1;
    u16 bits_9:3;
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
extern u8 gUnknown_02038696[];

extern const u8 gUnknown_083CAF84[];
extern const u8 gUnknown_083CAFAE[];
extern const struct ContestMove gContestMoves[];
extern const u8 gUnknownText_UnknownFormatting2[];
extern const u8 gUnknownText_UnknownFormatting3[];

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
void sub_80AE020();
u8 sub_80AE074(void);
u8 sub_80AE858(void);
u8 sub_80AE8B4(void);
u8 sub_80AE9FC();
void sub_80AEB30(void);
void sub_80AEBEC(u16);
void sub_80AED58(void);
u8 sub_80AEE54();
u8 sub_80AF038();
void sub_80AF120(void);
void sub_80AF138(void);
u16 sub_80AF15C(u8);
void sub_80AF1B8(void);
u8 sub_80AF59C(u8);
void sub_80AF860(void);
void sub_80AFA5C(void);
void sub_80AFBA0(s16, s16, u8);
void sub_80AFE30(void);
void sub_80AFFE0(u8);
void sub_80B0034(void);
void sub_80B00C8(void);
void nullsub_18();
void sub_80B0324(void);
void sub_80B03A8();
void sub_80B0518(void);
void sub_80B09B0();
u8 sub_80B09E4();
void sub_80B0BC4();
void sub_80B0CDC();
void sub_80B0D7C(void);
void sub_80B1118(void);
void sub_80B114C(u8);
void sub_80B146C();
void sub_80B159C(void);
void sub_80B1710();
void sub_80B1928(void);
void sub_80B1B14(void);
void sub_80B1BDC(void);
void sub_80B1CBC();
void sub_80B1DDC(void);
void sub_80B1EA8();
void sub_80B1FD0();
void sub_80B20C4(void);
u8 sub_80B214C(u8);
void sub_80B2184(void);
void sub_80B2280(void);
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
        shared19260.unk19260[i].unkB_0 = 0;
        //shared19260.unk19260[i].unkB_1 = 0;
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
        //if (shared19204.unk1920A_6)
        if (shared19204.unk1920A & 0x40)
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


struct UnknownContestStruct2
{
    u16 unk0[4];
    u8 filler8[56];
};
extern struct UnknownContestStruct2 gUnknown_0203858E[];

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
        u32 offset = i * 2 + gContestPlayerMonIndex * 64;
        u16 r4 = *(u16 *)((u8 *)gUnknown_0203858E + offset);
        u8 *r5 = sp8;

        if (shared19260.unk19260[gContestPlayerMonIndex].unk8 != 0
         && sub_80B214C(gContestPlayerMonIndex) != 0
         && AreMovesContestCombo(shared19260.unk19260[gContestPlayerMonIndex].unk8, r4)
         && shared19260.unk19260[gContestPlayerMonIndex].unk15 & 0x10)
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
    //if (!shared19204.unk1920A_6 && !shared19204.unk1920B_1)
    if (!(shared19204.unk1920A & 0x40) && !(shared19204.unk1920B & 2))
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

/*
void sub_80AC2CC(u8 taskId)
{
    u8 spriteId; // r5
    s32 r6;
    u8 r7 = shared19204.unk19215;

    switch (gTasks[taskId].data[0])
    {
    case 0:
    //_080AC404
        {
            //s32 r6;

            sub_80B0D7C();
            r6 = 0;
            while (shared19204.unk19214 != shared19260.unk192D0[r6])
                r6++;
            //_080AC42C
            shared19204.unk19215 = r6;
            r7 = shared19204.unk19215;  // is r7 actually a variable?
            if (gIsLinkContest & 1)
            {
                u8 taskId2;

                //shared19204.unk1920B_2 = 1;
                shared19204.unk1920B |= 4;
                if (sub_80AE074() != 0)
                    sub_80B114C(shared19204.unk19215);
                taskId2 = CreateTask(sub_80C8C80, 0);
                SetTaskFuncWithFollowupFunc(taskId2, sub_80C8C80, sub_80AD8DC);
                sub_80AF860();
                gTasks[taskId].data[0] = 1;
            }
            //_080AC498
            else
            {
                sub_80B114C(r7);
                gTasks[taskId].data[0] = 2;
            }
        }
        return;
    case 1:
        //if (!shared19204.unk1920B_2)
        if (!(shared19204.unk1920B & 4))
            gTasks[taskId].data[0] = 2;
        return;
    case 2:
    //_080AC4D4
        // Come on, get this part to match!
        if (shared19260.unk19260[r7].unkC_1
         || shared19260.unk19260[r7].unkC_2
         || shared19260.unk19260[r7].unkB_7)
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
    //_080AC534
        {
            s32 i;

            for (i = 0; i < 4; i++)
                gBattleMonForms[i] = 0;
            memset(shared19260.unk19348, 0, 20);
            sub_80B28F0(shared19204.unk19215);
            spriteId = sub_80AE9FC(
              gContestMons[shared19204.unk19215].species,
              gContestMons[shared19204.unk19215].unk3C,
              gContestMons[shared19204.unk19215].unk38);
            gSprites[spriteId].pos2.x = 120;
            gSprites[spriteId].callback = sub_80AD8FC;
            gTasks[taskId].data[2] = spriteId;
            gObjectBankIDs[gBankAttacker] = spriteId;
            sub_80B0BC4(sub_80B09E4(shared19204.unk19215), 0);
            gTasks[taskId].data[0] = 4;
        }
        return;
    case 4:
    //_080AC5E8
        spriteId = gTasks[taskId].data[2];
        if (gSprites[spriteId].callback == SpriteCallbackDummy
        // && !shared19260.unk19348[r7].unk2_1)
         && !(shared19260.unk19348[r7].unk2 & 2))
            gTasks[taskId].data[0] = 5;
        return;
    case 5:
    //_080AC638
        if (shared19260.unk19260[r7].unkC_0)
        {
            gTasks[taskId].data[0] = 33;
        }
        //_080AC664
        else
        {
            sub_80AF138();
            StringCopy(gStringVar1, gContestMons[r7].nickname);
            if (shared19260.unk19260[r7].unk6 <= 354)
                StringCopy(gStringVar2, gMoveNames[shared19260.unk19260[r7].unk6]);
            else
                StringCopy(gStringVar2, gUnknown_083CC330[shared19260.unk19260[r7].unkA]);
            StringExpandPlaceholders(gStringVar4, gUnknown_083CAFD7);
            sub_8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
            gTasks[taskId].data[0] = 6;
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
            // doesn't match
            u16 r4 = sub_80B2760(shared19260.unk19260[shared19204.unk19215].unk6);

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
                if (!(shared19260.unk19260[r7].unk15 & 0x10))
                    sub_80B03A8(r7);
                sub_80B20C4();
                gTasks[taskId].data[0] = 23;
            }
        }
        return;
    case 9:
    //_080AC7F4
        if (++gTasks[taskId].data[10] > 30)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 7;
        }
        return;
    case 23:
    //_080AC81E
        gTasks[taskId].data[1] = 0;
        if (shared19260.unk19260[r7].unk13 != 0xFF)
        {
            sub_80B146C(r7, shared19260.unk19260[r7].unk13);
            shared19260.unk19260[r7].unk13 = 0xFF;
            gTasks[taskId].data[0] = 24;
        }
        //_080AC85C
        else
        {
            if (shared19260.unk19260[r7].unk14 != 0xFF)
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
        return;
    case 24:
    //_080AC8CC
        if (sub_80037A0(&gMenuWindow) != 0)
            gTasks[taskId].data[0] = 23;
        return;
    case 48:
    //_080AC8F8
        if ((shared19260.unk19260[r7].unk11 & 3) == 1)
        {
            sub_80B1710(5);
            gTasks[taskId].data[0] = 49;
        }
        else if ((shared19260.unk19260[r7].unk11 & 3) == 2)
        {
            sub_80B1710(6);
            gTasks[taskId].data[0] = 49;
        }
        else if ((shared19260.unk19260[r7].unk11 & 3) == 3)
        {
            sub_80B1710(7);
            gTasks[taskId].data[0] = 49;
        }
        else
        {
            gTasks[taskId].data[0] = 47;
        }
        return;
    case 49:
    //_080AC94C
        //if (!shared19204.unk1920A_4)
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
        sub_80AFBA0(0, shared19260.unk19260[r7].unk2, r7);
        gTasks[taskId].data[0] = 13;
        return;
    case 13:
    //_080AC9C0
        if (!(shared19260.unk19338[shared19204.unk19215].unk2 & 4))
            gTasks[taskId].data[0] = 35;
        return;
    case 35:
    //_080AC9EC
        if ((shared19260.unk19260[r7].unk10 & 0x30) == 0x10)
            sub_80B1710(8);
        gTasks[taskId].data[0] = 36;
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
        {
            s8 r4 = 0;
            s32 r2 = 0;

            // Is this variable reused?
            r6 = gTasks[taskId].data[1];

            // This part is really weird
            while (r6 < 4)
            {
                r4 = 0;
                r2 = 0;

                if (r4 != r7 && gUnknown_02038696[0] == r6
                 && shared19260.unk19260[0].unk13 != 0xFF)
                {
                    r4 = 1;
                    break;
                }
                //_080ACB2C
                while (++r2 < 4)
                {
                    if (r2 != r7 && gUnknown_02038696[0] == r6
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
            //_080ACB58
            if (r4 != 0)
            {
            //_080ACB60
                gTasks[taskId].data[1] = gUnknown_02038696[r2];
                sub_80B146C(r2, shared19260.unk19260[r2].unk13);
                shared19260.unk19260[r2].unk13 = 0xFF;
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
            u8 r1;

            // check this later
            r6 = 0;
            while (gTasks[taskId].data[1] != gUnknown_02038696[r6])
                r6++;
            //_080ACC08
            r1 = shared19260.unk19260[r6].unkE;
            sub_80AFBA0(shared19260.unk19260[r6].unk2 + r1, -r1, r6);
            gTasks[taskId].data[0] = 29;
        }
        return;
    case 29:
    //_080ACC44
        r6 = 0;
        while (gTasks[taskId].data[1] != gUnknown_02038696[r6])
            r6++;
        //_080ACC6C
        if (!(shared19260.unk19338[r6].unk2 & 4))
            gTasks[taskId].data[0] = 39;
        return;
    case 39:
    //_080ACC98
        r6 = 0;
        while (gTasks[taskId].data[1] != gUnknown_02038696[r6])
            r6++;
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
        r6 = 0;
        while (r6 < 4 && gTasks[taskId].data[1] != gUnknown_02038696[r6])
            r6++;
        //_080ACD5E
        if (sub_80AF038(r6) != 0)
            PlaySE(SE_C_PASI);
        else
            PlaySE(SE_C_SYU);
        if (shared19260.unk19260[r6].unk15 & 0x20)
        {
            sub_80B03A8(r6);
            shared19260.unk19260[r6].unk15 &= ~0x20;
        }
        gTasks[taskId].data[1]++;
        gTasks[taskId].data[0] = 26;
        return;
    case 51:
    //_080ACDC8
        if (++gTasks[taskId].data[10] > 9)
        {
            gTasks[taskId].data[10] = 0;
            if (shared19260.unk19260[r7].unkC_1
             || shared19260.unk19260[r7].unkC_2
             || (shared19260.unk19260[r7].unk11 & 4))
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
            if (!(shared19260.unk19260[r7].unk15 & 0x40))
                gTasks[taskId].data[0] = 17;
            else
                gTasks[taskId].data[0] = 14;
        }
        return;
    case 14:
    //_080ACEC0
        {
            s8 r4 = shared19260.unk19260[r7].unk16;

            if (r4 != 0)
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
            }
            gTasks[taskId].data[0] = 45;  // tail merge?
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
                if (!(shared19260.unk19260[r7].unk15 & 0x10))
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
        if (!(shared19260.unk19338[r7].unk2 & 4))
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[0] = 17;
        }
        return;
    case 17:
    //_080AD070
        if (shared19260.unk19260[r7].unk15 & 1)
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
            sub_80AFBA0(
              shared19260.unk19260[r7].unk2,
              -shared19260.unk19260[r7].unk18,
              r7);
            shared19260.unk19260[r7].unk2 -= shared19260.unk19260[r7].unk18;
            gTasks[taskId].data[0] = 18;
        }
        return;
    case 18:
    //_080AD168
        sub_80B0D7C();
        if (!(shared19260.unk19338[r7].unk2 & 4))
        {
            gTasks[taskId].data[10] = 0;
            sub_80AF138();
            gTasks[taskId].data[0] = 41;
        }
        return;
    case 41:
    //_080AD1A4
        if (shared19260.unk19328.bits_8 && r7 != shared19260.unk19328.bits_9)
        {
            gTasks[taskId].data[0] = 57;
        }
        //_080AD1D0
        else
        {
            s8 r4 = shared19260.unk19328.bits_0;

            if (shared19260.unk19260[r7].unk11 & 0x10)
                StringCopy(gStringVar3, gMoveNames[shared19260.unk19260[r7].unk6]);
            else
                StringCopy(gStringVar3, gUnknown_083CC2D8[gContestMoves[shared19260.unk19260[r7].unk6].contestCategory]);
            //_080AD21E
            if (r4 > 0 && (shared19260.unk19260[r7].unk15 & 1))
                r4 = 0;
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
                if (r4 <= 0)
                    gTasks[taskId].data[0] = 53;
                else
                    gTasks[taskId].data[0] = 54;
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
                if (++gTasks[taskId].data[11] > 29)
                    gTasks[taskId].data[10]++;
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
                sub_80B1CBC();
                gTasks[taskId].data[10]++;
            }
            break;
        case 2:
        //_080AD43E
            if (!(shared19204.unk1920A & 0x20))
            {
                if (++gTasks[taskId].data[11] > 29)
                {
                    gTasks[taskId].data[11] = 0;
                    sub_80AFBA0(shared19260.unk19260[r7].unk2, shared19260.unk19328.unk2, r7);
                    shared19260.unk19260[r7].unk2 += shared19260.unk19328.unk2;
                    gTasks[taskId].data[10]++;
                }
            }
            break;
        case 3:
        //_080AD4A0
            if (!(shared19260.unk19338[r7].unk2 & 4))
            {
                if (!(shared19204.unk1920A & 0x80))
                {
                    sub_80B1EA8(1, -1);
                    gTasks[taskId].data[10]++;
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
        if (!(shared19260.unk19338[r7].unk2 & 4))
        {
            sub_80AF138();
            gTasks[taskId].data[0] = 55;
        }
        return;
    case 57:
    //_080AD53C
        sub_80AF138();
        StringCopy(gStringVar3, gContestMons[shared19260.unk19328.bits_9].nickname);
        StringCopy(gStringVar1, gContestMons[r7].nickname);
        StringCopy(gStringVar2, gMoveNames[shared19260.unk19260[r7].unk6]);
        StringExpandPlaceholders(gStringVar4, gUnknown_083CC14A);
        sub_8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
        gTasks[taskId].data[0] = 58;
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
        if (shared19260.unk19260[r7].unk15 & 0x10)
            shared19260.unk19260[r7].unk15 &= ~0x10;
        sub_80B09B0(r7);
        StringCopy(gStringVar1, gContestMons[r7].nickname);
        StringCopy(gStringVar2, gMoveNames[shared19260.unk19260[r7].unk6]);
        StringExpandPlaceholders(gStringVar4, gUnknown_083CBF60);
        sub_8002EB0(&gMenuWindow, gStringVar4, 776, 1, 15);
        gTasks[taskId].data[0] = 34;
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
*/
