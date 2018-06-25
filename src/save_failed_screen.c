#include "global.h"
#include "gba/flash_internal.h"
#include "save_failed_screen.h"
#include "m4a.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "save.h"
#include "sprite.h"
#include "starter_choose.h"
#include "strings.h"
#include "task.h"
#include "text.h"
#include "ewram.h"

// In English 1.0, the text window is too small, causing text to overflow.

#ifdef BUGFIX_SAVEFAILEDSCREEN1
#define MSG_WIN_TOP 10
#else
#define MSG_WIN_TOP 12
#endif

#define CLOCK_WIN_TOP (MSG_WIN_TOP - 4)

static EWRAM_DATA u16 gSaveFailedType = 0;
static EWRAM_DATA u16 gSaveFailedClockInfo[9] = {0};

extern u32 gUnknown_Debug_03004BD0;
extern u32 gDamagedSaveSectors;
extern u32 gGameContinueCallback;

static const struct OamData sClockOamData =
{
    160, // Y
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
    0,
    0,
    0
};

static const u8 sClockFrames[8][3] =
{
    { 1, 0, 0 },
    { 5, 0, 0 },
    { 9, 0, 0 },
    { 5, 0, 1 },
    { 1, 0, 1 },
    { 5, 1, 1 },
    { 9, 1, 0 },
    { 5, 1, 0 },
};

static const u8 gSaveFailedClockPal[] = INCBIN_U8("graphics/misc/clock_small.gbapal");
static const u8 gSaveFailedClockGfx[] = INCBIN_U8("graphics/misc/clock_small.4bpp.lz");

static void VBlankCB(void);
static void CB2_SaveFailedScreen(void);
static void CB2_WipeSave(void);
static void CB2_GameplayCannotBeContinued(void);
static void CB2_FadeAndReturnToTitleScreen(void);
static void CB2_ReturnToTitleScreen(void);
static void VBlankCB_UpdateClockGraphics(void);
static bool8 IsSectorNonEmpty(u16 sector);
static bool8 WipeSector(u16 sector);
static bool8 WipeSectors(u32 sectorBits);

void DoSaveFailedScreen(u8 saveType)
{
    SetMainCallback2(CB2_SaveFailedScreen);
    gSaveFailedType = saveType;
    gSaveFailedClockInfo[0] = FALSE;
}

static void VBlankCB(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void CB2_SaveFailedScreen(void)
{
    u16 ime;

    switch (gMain.state)
    {
    case 0:
    default:
        SetVBlankCallback(0);
        REG_DISPCNT = 0;
        REG_BG3CNT = 0;
        REG_BG2CNT = 0;
        REG_BG1CNT = 0;
        REG_BG0CNT = 0;
        REG_BG3HOFS = 0;
        REG_BG3VOFS = 0;
        REG_BG2HOFS = 0;
        REG_BG2VOFS = 0;
        REG_BG1HOFS = 0;
        REG_BG1VOFS = 0;
        REG_BG0HOFS = 0;
        REG_BG0VOFS = 0;
        DmaFill16(3, 0, VRAM, VRAM_SIZE);
        DmaFill32(3, 0, OAM, OAM_SIZE);
        DmaFill16(3, 0, PLTT, PLTT_SIZE);
        LZ77UnCompVram(&gBirchHelpGfx, (void *)VRAM);
        LZ77UnCompVram(&gBirchBagTilemap, (void *)(VRAM + 0x3000));
        LZ77UnCompVram(&gBirchGrassTilemap, (void *)(VRAM + 0x3800));
        LZ77UnCompVram(&gSaveFailedClockGfx, (void *)(VRAM + 0x10020));
        ResetSpriteData();
        ResetTasks();
        ResetPaletteFade();
        LoadPalette(&gBirchBagGrassPal, 0, sizeof(gBirchBagGrassPal));
        LoadPalette(&gSaveFailedClockPal, 0x100, sizeof(gSaveFailedClockPal));
        Text_LoadWindowTemplate(&gWindowTemplate_81E6C3C);
        InitMenuWindow(&gMenuTextWindowTemplate);
        Menu_DrawStdWindowFrame(13, CLOCK_WIN_TOP, 16, CLOCK_WIN_TOP + 3); // clock window
        Menu_DrawStdWindowFrame(1, MSG_WIN_TOP, 28, 19); // message window
        Menu_PrintText(gSystemText_SaveFailedBackupCheck, 2, MSG_WIN_TOP + 1);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
        ime = REG_IME;
        REG_IME = 0;
        REG_IE |= INTR_FLAG_VBLANK;
        REG_IME = ime;
        REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;
        SetVBlankCallback(VBlankCB);
        REG_BG3CNT = BGCNT_PRIORITY(3) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(7)  | BGCNT_16COLOR | BGCNT_TXT256x256;
        REG_BG2CNT = BGCNT_PRIORITY(2) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(6)  | BGCNT_16COLOR | BGCNT_TXT256x256;
        REG_BG0CNT = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(2) | BGCNT_SCREENBASE(31) | BGCNT_16COLOR | BGCNT_TXT256x256;
        REG_DISPCNT = DISPCNT_OBJ_ON | DISPCNT_BG3_ON | DISPCNT_BG2_ON | DISPCNT_BG0_ON | DISPCNT_OBJ_1D_MAP | DISPCNT_MODE_0;
        gMain.state++;
        break;
    case 1:
        if (!UpdatePaletteFade())
        {
            SetMainCallback2(CB2_WipeSave);
            SetVBlankCallback(VBlankCB_UpdateClockGraphics);
        }
        break;
    }
}

static void CB2_WipeSave(void)
{
    u8 wipeTries = 0;

    gSaveFailedClockInfo[0] = TRUE;

#if DEBUG
	if (gUnknown_Debug_03004BD0 != 0)
		gDamagedSaveSectors = 1;
#endif

    while (gDamagedSaveSectors != 0 && wipeTries < 3) // while there are still attempts left, keep trying to fix the save sectors.
    {
        if (WipeSectors(gDamagedSaveSectors) != FALSE)
        {
            Menu_DrawStdWindowFrame(1, MSG_WIN_TOP, 28, 19);
            Menu_PrintText(gSystemText_BackupDamagedGameContinue, 2, MSG_WIN_TOP + 1);
            SetMainCallback2(CB2_GameplayCannotBeContinued);
            return;
        }

        Menu_DrawStdWindowFrame(1, MSG_WIN_TOP, 28, 19);
        Menu_PrintText(gSystemText_CheckCompleteSaveAttempt, 2, MSG_WIN_TOP + 1);
        Save_WriteDataInternal(gSaveFailedType);

        if (gDamagedSaveSectors != 0)
        {
#ifdef BUGFIX_SAVEFAILEDSCREEN2
            Menu_DrawStdWindowFrame(1, MSG_WIN_TOP, 28, 19);
#endif
            Menu_PrintText(gSystemText_SaveFailedBackupCheck, 2, MSG_WIN_TOP + 1);
        }

        wipeTries++;
    }

    if (wipeTries == 3)
    {
        Menu_DrawStdWindowFrame(1, MSG_WIN_TOP, 28, 19);
        Menu_PrintText(gSystemText_BackupDamagedGameContinue, 2, MSG_WIN_TOP + 1);
        SetMainCallback2(CB2_FadeAndReturnToTitleScreen); // called again below
    }
    else
    {
        Menu_DrawStdWindowFrame(1, MSG_WIN_TOP, 28, 19);

        // no callback exists, so the game cannot continue.
        if (gGameContinueCallback == 0)
            Menu_PrintText(gSystemText_SaveCompletedGameEnd, 2, MSG_WIN_TOP + 1);
        else // callback exists, so continue
            Menu_PrintText(gSystemText_SaveCompletedPressA, 2, MSG_WIN_TOP + 1);
    }

    SetMainCallback2(CB2_FadeAndReturnToTitleScreen);
}

static void CB2_GameplayCannotBeContinued(void)
{
    gSaveFailedClockInfo[0] = FALSE;

    if (gMain.newKeys & A_BUTTON)
    {
        Menu_DrawStdWindowFrame(1, MSG_WIN_TOP, 28, 19);
        Menu_PrintText(gSystemText_GameplayEnded, 2, MSG_WIN_TOP + 1);
        SetVBlankCallback(VBlankCB);
        SetMainCallback2(CB2_FadeAndReturnToTitleScreen);
    }
}

static void CB2_FadeAndReturnToTitleScreen(void)
{
    gSaveFailedClockInfo[0] = FALSE;

    if (gMain.newKeys & A_BUTTON)
    {
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        SetVBlankCallback(VBlankCB);
        SetMainCallback2(CB2_ReturnToTitleScreen);
    }
}

static void CB2_ReturnToTitleScreen(void)
{
    if (!UpdatePaletteFade())
    {
        if (gGameContinueCallback == 0) // no callback exists, so do a soft reset.
        {
            DoSoftReset();
        }
        else
        {
            SetMainCallback2((MainCallback)gGameContinueCallback);
            gGameContinueCallback = 0;
        }
    }
}

static void VBlankCB_UpdateClockGraphics(void)
{
    unsigned int n = (gMain.vblankCounter2 >> 3) & 7;

    gMain.oamBuffer[0] = sClockOamData;
    gMain.oamBuffer[0].x = 112;
    gMain.oamBuffer[0].y = (CLOCK_WIN_TOP + 1) * 8;

    if (gSaveFailedClockInfo[0] != FALSE)
    {
        gMain.oamBuffer[0].tileNum = sClockFrames[n][0];
        gMain.oamBuffer[0].matrixNum = (sClockFrames[n][2] << 4) | (sClockFrames[n][1] << 3);
    }
    else
    {
        gMain.oamBuffer[0].tileNum = 1;
    }

    CpuFastCopy(gMain.oamBuffer, (void *)OAM, 4);

    if (gSaveFailedClockInfo[1]) // maybe was used for debugging?
        gSaveFailedClockInfo[1]--;
}

static bool8 IsSectorNonEmpty(u16 sector)
{
    u32 *ptr = (u32 *)&gSharedMem;
    u16 i;

    ReadFlash(sector, 0, ptr, 4096);

#if DEBUG  // Don't verify the sector wipe?
    for (i = 0; i < 0x400; i++, ptr++)
		;
    return gUnknown_Debug_03004BD0;
#else
	for (i = 0; i < 0x400; i++, ptr++)
        if (*ptr != 0)
            return TRUE;
    return FALSE;
#endif
}

static bool8 WipeSector(u16 sector)
{
    u16 i, j;
    bool8 failed = TRUE;

    for (i = 0; failed && i < 130; i++)
    {
        for (j = 0; j < 0x1000; j++)
            ProgramFlashByte(sector, j, 0);

        failed = IsSectorNonEmpty(sector);
    }

    return failed;
}

static bool8 WipeSectors(u32 sectorBits)
{
    u16 i;

    for (i = 0; i < 0x20; i++)
        if ((sectorBits & (1 << i)) && !WipeSector(i))
            sectorBits &= ~(1 << i);

    if (sectorBits == 0)
        return FALSE;
    else
        return TRUE;
}
