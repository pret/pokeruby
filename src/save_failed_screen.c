#include "global.h"
#include "asm.h"
#include "gba/flash_internal.h"
#include "m4a.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "save.h"
#include "sprite.h"
#include "task.h"
#include "text.h"

// In English 1.0, the text window is too small, causing text to overflow.

#ifdef BUGFIX_SAVEFAILEDSCREEN1
#define MSG_WIN_TOP 10
#else
#define MSG_WIN_TOP 12
#endif

#define CLOCK_WIN_TOP (MSG_WIN_TOP - 4)

struct SaveFailedStruct
{
    u16 unk0;
    u16 unk2;
};

extern u8 unk_2000000[];

extern u16 gUnknown_0203933C;
extern struct SaveFailedStruct gUnknown_0203933E;
extern u32 gUnknown_03005EA8;
extern u32 gUnknown_03005EBC;

extern u8 gBirchHelpGfx[];

extern u8 gSystemText_SaveFailedBackupCheck[];
extern u8 gSystemText_CheckCompleteSaveAttempt[];
extern u8 gSystemText_BackupDamagedGameContinue[];
extern u8 gSystemText_SaveCompletedPressA[];
extern u8 gSystemText_SaveCompletedGameEnd[];
extern u8 gSystemText_GameplayEnded[];

extern u8 gBirchGrassTilemap[];
extern u8 gBirchBagTilemap[];

extern const u8 gSaveFailedClockGfx[];
extern const u8 gSaveFailedClockPal[];
extern u8 gBirchBagGrassPal[];

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

static void VBlankCB(void);
static void CB2_SaveFailedScreen(void);
static void CB2_WipeSave(void);
static void CB2_GameplayCannotBeContinued(void);
static void CB2_FadeAndReturnToTitleScreen(void);
static void CB2_ReturnToTitleScreen(void);
static void VBlankCB_UpdateClockGraphics(void);
static bool8 VerifySectorWipe(u16 sector);
static bool8 WipeSector(u16 sector);
static bool8 WipeSectors(u32 sectorBits);

void DoSaveFailedScreen(u8 var)
{
    SetMainCallback2(CB2_SaveFailedScreen);
    gUnknown_0203933C = var;
    gUnknown_0203933E.unk0 = 0;
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
            LoadPalette(&gBirchBagGrassPal, 0, 0x40);
            LoadPalette(&gSaveFailedClockPal, 0x100, 0x20);
            SetUpWindowConfig(&gWindowConfig_81E6C3C);
            InitMenuWindow(&gWindowConfig_81E6CE4);
            MenuDrawTextWindow(13, CLOCK_WIN_TOP, 16, CLOCK_WIN_TOP + 3); // clock window
            MenuDrawTextWindow(1, MSG_WIN_TOP, 28, 19); // message window
            MenuPrint(gSystemText_SaveFailedBackupCheck, 2, MSG_WIN_TOP + 1);
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
            ime = REG_IME;
            REG_IME = 0;
            REG_IE |= INTR_FLAG_VBLANK;
            REG_IME = ime;
            REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;
            SetVBlankCallback(VBlankCB);
            REG_BG3CNT = 0x703;
            REG_BG2CNT = 0x602;
            REG_BG0CNT = 0x1f08;
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

    gUnknown_0203933E.unk0 = 1;

    while (gUnknown_03005EA8 && wipeTries < 3)
    {
        if (WipeSectors(gUnknown_03005EA8))
        {
            MenuDrawTextWindow(1, MSG_WIN_TOP, 28, 19);
            MenuPrint(gSystemText_BackupDamagedGameContinue, 2, MSG_WIN_TOP + 1);
            SetMainCallback2(CB2_GameplayCannotBeContinued);
            return;
        }

        MenuDrawTextWindow(1, MSG_WIN_TOP, 28, 19);
        MenuPrint(gSystemText_CheckCompleteSaveAttempt, 2, MSG_WIN_TOP + 1);
        sub_8125C3C(gUnknown_0203933C);

        if (gUnknown_03005EA8)
        {
#ifdef BUGFIX_SAVEFAILEDSCREEN2
            MenuDrawTextWindow(1, MSG_WIN_TOP, 28, 19);
#endif
            MenuPrint(gSystemText_SaveFailedBackupCheck, 2, MSG_WIN_TOP + 1);
        }

        wipeTries++;
    }

    if (wipeTries == 3)
    {
        MenuDrawTextWindow(1, MSG_WIN_TOP, 28, 19);
        MenuPrint(gSystemText_BackupDamagedGameContinue, 2, MSG_WIN_TOP + 1);
        SetMainCallback2(CB2_FadeAndReturnToTitleScreen); // called again below
    }
    else
    {
        MenuDrawTextWindow(1, MSG_WIN_TOP, 28, 19);

        if (!gUnknown_03005EBC) // cant continue game.
            MenuPrint(gSystemText_SaveCompletedGameEnd, 2, MSG_WIN_TOP + 1);
        else // can continue game.
            MenuPrint(gSystemText_SaveCompletedPressA, 2, MSG_WIN_TOP + 1);
    }

    SetMainCallback2(CB2_FadeAndReturnToTitleScreen);
}

static void CB2_GameplayCannotBeContinued(void)
{
    gUnknown_0203933E.unk0 = 0;

    if (gMain.newKeys & A_BUTTON)
    {
        MenuDrawTextWindow(1, MSG_WIN_TOP, 28, 19);
        MenuPrint(gSystemText_GameplayEnded, 2, MSG_WIN_TOP + 1);
        SetVBlankCallback(VBlankCB);
        SetMainCallback2(CB2_FadeAndReturnToTitleScreen);
    }
}

static void CB2_FadeAndReturnToTitleScreen(void)
{
    u8 zero;

    gUnknown_0203933E.unk0 = zero = 0;

    if (gMain.newKeys & A_BUTTON)
    {
        BeginNormalPaletteFade(0xFFFFFFFF, 0, zero, 16, 0);
        SetVBlankCallback(VBlankCB);
        SetMainCallback2(CB2_ReturnToTitleScreen);
    }
}

static void CB2_ReturnToTitleScreen(void)
{
    if (!UpdatePaletteFade())
    {
        if (!gUnknown_03005EBC)
        {
            DoSoftReset();
        }
        else
        {
            SetMainCallback2((MainCallback)gUnknown_03005EBC);
            gUnknown_03005EBC = 0;
        }
    }
}

static void VBlankCB_UpdateClockGraphics(void)
{
    unsigned int n = (gMain.vblankCounter2 >> 3) & 7;

    gMain.oamBuffer[0] = sClockOamData;
    gMain.oamBuffer[0].x = 112;
    gMain.oamBuffer[0].y = (CLOCK_WIN_TOP + 1) * 8;

    if (gUnknown_0203933E.unk0)
    {
        gMain.oamBuffer[0].tileNum = sClockFrames[n][0];
        gMain.oamBuffer[0].matrixNum = (sClockFrames[n][2] << 4) | (sClockFrames[n][1] << 3);
    }
    else
    {
        gMain.oamBuffer[0].tileNum = 1;
    }

    CpuFastCopy(gMain.oamBuffer, (void *)OAM, 4);

    if (gUnknown_0203933E.unk2)
        gUnknown_0203933E.unk2--;
}

static bool8 VerifySectorWipe(u16 sector)
{
    u32 *ptr = (u32 *)unk_2000000;
    u16 i;

    ReadFlash(sector, 0, (u8 *)ptr, 4096);

    for (i = 0; i < 0x400; i++, ptr++)
        if (*ptr)
            return TRUE;

    return FALSE;
}

static bool8 WipeSector(u16 sector)
{
    u16 i, j;
    bool8 failed = TRUE;

    for (i = 0; failed && i < 130; i++)
    {
        for (j = 0; j < 0x1000; j++)
            ProgramFlashByte(sector, j, 0);

        failed = VerifySectorWipe(sector);
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
