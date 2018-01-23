#include "global.h"
#include "constants/songs.h"
#include "ewram.h"
#include "main.h"
#include "scanline_effect.h"
#include "decompress.h"
#include "palette.h"
#include "graphics.h"
#include "strings2.h"
#include "text.h"
#include "string_util.h"
#include "menu.h"
#include "sound.h"
#include "battle.h"
#include "contest.h"
#include "link.h"

#define ABS(x) ((x) < 0 ? -(x) : (x))

struct UnkEwramStruct18000 {
    u8 filler_00[2];
    u8 unk_02;
    u8 filler_03[0x15];
};

struct UnkEwramStruct18018 {
    u8 filler_00[0x50];
};

#define eContestLink80C2020Struct2018000 (*(struct UnkEwramStruct18000 *)(gSharedMem + 0x18000))
#define eContestLink80C2020Struct2018018 (*(struct UnkEwramStruct18018 *)(gSharedMem + 0x18018))

void sub_80C2430(void);
void sub_80C2448(void);
void sub_80C24F4(u8 taskId);
void sub_80C255C(u8 taskId);
void sub_80C2600(u8 taskId);
void sub_80C2F28(u8 taskId);
void sub_80C37E4(void);
void sub_80C310C(void);
void sub_80C30D4(u8 a0, u8 a1);
void sub_80C33DC(void);
void sub_80C3698(const u8 *string);
void sub_80C3F00(void);
u8 sub_80C3990(u8 a0, u8 a1);
s8 sub_80C39E4(u8 a0, u8 a1);

extern const u8 gUnknown_083D17DC[];
extern const u8 gUnknown_083D17E0[];

void sub_80C2020(void)
{
    REG_DISPCNT = DISPCNT_OBJ_1D_MAP;
    Text_LoadWindowTemplate(&gWindowTemplate_81E6FA0);
    Text_InitWindowWithTemplate(&gMenuWindow, &gWindowTemplate_81E6FA0);
    REG_BG0CNT = BGCNT_WRAP | BGCNT_SCREENBASE(30);
    REG_BG1CNT = BGCNT_PRIORITY(3) | BGCNT_SCREENBASE(24);
    REG_BG2CNT = BGCNT_PRIORITY(3) | BGCNT_SCREENBASE(28);
    REG_BG3CNT = BGCNT_WRAP | BGCNT_PRIORITY(3) | BGCNT_SCREENBASE(26);
    REG_MOSAIC = 0;
    REG_WININ = 0x3f3f;
    REG_WINOUT = 0x3f2e;
    REG_WIN0H = 0;
    REG_WIN0V = 0;
    REG_WIN1H = 0;
    REG_WIN1V = 0;
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    REG_BLDY = 0;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG3HOFS = 0;
    REG_BG3VOFS = 0;
    REG_DISPCNT |= DISPCNT_BG_ALL_ON | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON | DISPCNT_WIN1_ON;
    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    gBattle_BG1_X = 0;
    gBattle_BG1_Y = 0;
    gBattle_BG2_X = 0;
    gBattle_BG2_Y = 0;
    gBattle_BG3_X = 0;
    gBattle_BG3_Y = 0;
    gBattle_WIN0H = 0;
    gBattle_WIN0V = 0;
    gBattle_WIN1H = 0;
    gBattle_WIN1V = 0;
}

void sub_80C2144(void)
{
    int i;
    int j;
    s8 r7;
    s8 r4;
    u16 r6;
    u16 r3;

    DmaFill32Large(3, 0, VRAM, VRAM_SIZE, 0x1000);
    LZDecompressVram(gUnknown_08D1977C, BG_SCREEN_ADDR(0));
    LZDecompressVram(gUnknown_08D1A490, BG_SCREEN_ADDR(26));
    LZDecompressVram(gUnknown_08D1A364, BG_SCREEN_ADDR(28));
    LZDecompressVram(gUnknown_08D1A250, BG_SCREEN_ADDR(30));
    sub_80C37E4();
    LoadCompressedPalette(gUnknown_08D1A618, 0, 0x200);
    LoadFontDefaultPalette(&gWindowTemplate_81E6FA0);
    for (i = 0; i < 4; i++)
    {
        r7 = sub_80C3990(i, 1);
        r4 = sub_80C39E4(i, 1);
        for (j = 0; j < 10; j++)
        {
            r6 = 0x60b2;
            if (j < r7)
                r6 = 0x60b4;
            if (j < ABS(r4))
            {
                r3 = 0x60a4;
                if (r4 < 0)
                    r3 = 0x60a6;
            }
            else
                r3 = 0x60a2;
            ((u16 *)BG_VRAM)[i * 0x60 + j + 0x60b3] = r6;
            ((u16 *)BG_VRAM)[i * 0x60 + j + 0x60d3] = r3;
        }
    }
}

void sub_80C226C(u8 a0)
{
    u8 *strbuf;

    if (a0 == gContestPlayerMonIndex)
        strbuf = StringCopy(gDisplayedStringBattle, gUnknown_083D17DC);
    else
        strbuf = gDisplayedStringBattle;
    strbuf[0] = EXT_CTRL_CODE_BEGIN;
    strbuf[1] = 0x06;
    strbuf[2] = 0x04;
    strbuf += 3;
    strbuf = StringCopy(strbuf, gContestMons[a0].nickname);
    strbuf[0] = EXT_CTRL_CODE_BEGIN;
    strbuf[1] = 0x13;
    strbuf[2] = 0x32;
    strbuf += 3;
    strbuf = StringCopy(strbuf, gUnknown_083D17E0);
    if (gIsLinkContest & 1)
        StringCopy(strbuf, gLinkPlayers[a0].name);
    else
        StringCopy(strbuf, gContestMons[a0].trainerName);
    Text_InitWindowAndPrintText(&gMenuWindow, gDisplayedStringBattle, a0 * 36 + 770, 7, a0 * 3 + 4);
}

void sub_80C2340(void)
{
    int i;

    for (i = 0; i < 4; i++)
        sub_80C226C(i);
}

void sub_80C2358(void)
{
    gPaletteFade.bufferTransferDisabled = TRUE;
    SetVBlankCallback(NULL);
    sub_80C2020();
    ScanlineEffect_Clear();
    ResetPaletteFade();
    ResetSpriteData();
    ResetTasks();
    FreeAllSpritePalettes();
    sub_80C2144();
    sub_80C310C();
    sub_80C30D4(0, 1);
    sub_80C2340();
    eContestLink80C2020Struct2018000 = (struct UnkEwramStruct18000){};
    eContestLink80C2020Struct2018018 = (struct UnkEwramStruct18018){};
    sub_80C33DC();
    BeginNormalPaletteFade(0xffffffff, 0, 16, 0, 0);
    gPaletteFade.bufferTransferDisabled = FALSE;
    eContestLink80C2020Struct2018000.unk_02 = CreateTask(sub_80C24F4, 5);
    SetMainCallback2(sub_80C2430);
    gBattle_WIN1H = 0xf0;
    gBattle_WIN1V = 0x80a0;
    CreateTask(sub_80C2F28, 20);
    sub_80C3F00();
    PlayBGM(BGM_CON_K);
    SetVBlankCallback(sub_80C2448);
}

void sub_80C2430(void)
{
    AnimateSprites();
    BuildOamBuffer();
    RunTasks();
    UpdatePaletteFade();
}

void sub_80C2448(void)
{
    REG_BG0HOFS = gBattle_BG0_X;
    REG_BG0VOFS = gBattle_BG0_Y;
    REG_BG1HOFS = gBattle_BG1_X;
    REG_BG1VOFS = gBattle_BG1_Y;
    REG_BG2HOFS = gBattle_BG2_X;
    REG_BG2VOFS = gBattle_BG2_Y;
    REG_BG3HOFS = gBattle_BG3_X;
    REG_BG3VOFS = gBattle_BG3_Y;
    REG_WIN0H = gBattle_WIN0H;
    REG_WIN0V = gBattle_WIN0V;
    REG_WIN1H = gBattle_WIN1H;
    REG_WIN1V = gBattle_WIN1V;
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    ScanlineEffect_InitHBlankDmaTransfer();
}

void sub_80C24F4(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        if (gIsLinkContest & 1)
        {
            sub_80C3698(gOtherText_LinkStandby);
            gTasks[taskId].func = sub_80C255C;
        }
        else
        {
            gTasks[taskId].func = sub_80C2600;
        }
    }
}
