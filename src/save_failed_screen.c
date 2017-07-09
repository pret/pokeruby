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

// In English 1.0, the text window is too small, causing text to overflow.

#ifdef BUGFIX_SAVEFAILEDSCREEN1
#define MSG_WIN_TOP 10
#else
#define MSG_WIN_TOP 12
#endif

#define CLOCK_WIN_TOP (MSG_WIN_TOP - 4)

struct SaveFailedClockStruct
{
    bool16 clockRunning;
    u16 timer; // appears to be unused, the only case its "used" cannot be reached normally
    u8 unused[0xE]; // appears to be unused space. alternatively, there could have been multiple clock structs. however, neither of these cases are fulfilled, so the purpose of this space is unknown. one theory is that there is room for 3 more clock structs (2 16-bit values), so its possible GF intended there to be support for link-based save failed screens in case the synchronization failed, or it in fact was present in an earlier build but taken out for reasons.
};

extern u8 unk_2000000[];

extern u16 gSaveFailedType;
extern struct SaveFailedClockStruct gSaveFailedClockInfo;
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
void CB2_GameplayCannotBeContinued(void);
static void CB2_FadeAndReturnToTitleScreen(void);
static void CB2_ReturnToTitleScreen(void);
static void VBlankCB_UpdateClockGraphics(void);
static bool8 VerifySectorWipe(u16 sector);
static bool8 WipeSector(u16 sector);
bool8 WipeSectors(u32 sectorBits);

void DoSaveFailedScreen(u8 saveType)
{
    SetMainCallback2(CB2_SaveFailedScreen);
    gSaveFailedType = saveType;
    gSaveFailedClockInfo.clockRunning = FALSE;
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

#ifdef DEBUG
__attribute__((naked))
void CB2_WipeSave()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	mov	r4, #0x0\n"
        "	ldr	r0, ._20\n"
        "	mov	r2, #0x1\n"
        "	strh	r2, [r0]\n"
        "	ldr	r0, ._20 + 4\n"
        "	ldr	r0, [r0]\n"
        "	ldr	r1, ._20 + 8\n"
        "	cmp	r0, #0\n"
        "	beq	._12	@cond_branch\n"
        "	str	r2, [r1]\n"
        "._12:\n"
        "	ldr	r0, [r1]\n"
        "	cmp	r0, #0\n"
        "	beq	._16	@cond_branch\n"
        "	add	r5, r1, #0\n"
        "._17:\n"
        "	ldr	r0, [r5]\n"
        "	bl	WipeSectors\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	bne	._14	@cond_branch\n"
        "	mov	r0, #0x1\n"
        "	mov	r1, #0xa\n"
        "	mov	r2, #0x1c\n"
        "	mov	r3, #0x13\n"
        "	bl	MenuDrawTextWindow\n"
        "	ldr	r0, ._20 + 12\n"
        "	mov	r1, #0x2\n"
        "	mov	r2, #0xb\n"
        "	bl	MenuPrint\n"
        "	ldr	r0, ._20 + 16\n"
        "	ldrb	r0, [r0]\n"
        "	bl	HandleSavingData\n"
        "	ldr	r0, [r5]\n"
        "	cmp	r0, #0\n"
        "	beq	._15	@cond_branch\n"
        "	mov	r0, #0x1\n"
        "	mov	r1, #0xa\n"
        "	mov	r2, #0x1c\n"
        "	mov	r3, #0x13\n"
        "	bl	MenuDrawTextWindow\n"
        "	ldr	r0, ._20 + 20\n"
        "	mov	r1, #0x2\n"
        "	mov	r2, #0xb\n"
        "	bl	MenuPrint\n"
        "._15:\n"
        "	add	r0, r4, #1\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r4, r0, #0x18\n"
        "	ldr	r0, [r5]\n"
        "	cmp	r0, #0\n"
        "	beq	._16	@cond_branch\n"
        "	cmp	r4, #0x2\n"
        "	bls	._17	@cond_branch\n"
        "._16:\n"
        "	cmp	r4, #0x3\n"
        "	bne	._18	@cond_branch\n"
        "	mov	r0, #0x1\n"
        "	mov	r1, #0xa\n"
        "	mov	r2, #0x1c\n"
        "	mov	r3, #0x13\n"
        "	bl	MenuDrawTextWindow\n"
        "	ldr	r0, ._20 + 24\n"
        "	mov	r1, #0x2\n"
        "	mov	r2, #0xb\n"
        "	bl	MenuPrint\n"
        "	ldr	r0, ._20 + 28\n"
        "	bl	SetMainCallback2\n"
        "	b	._23\n"
        "._21:\n"
        "	.align	2, 0\n"
        "._20:\n"
        "	.word	gSaveFailedClockInfo\n"
        "	.word	gUnknown_Debug_03004BD0\n"
        "	.word	gDamagedSaveSectors\n"
        "	.word	gSystemText_CheckCompleteSaveAttempt\n"
        "	.word	gSaveFailedType\n"
        "	.word	gSystemText_SaveFailedBackupCheck\n"
        "	.word	gSystemText_BackupDamagedGameContinue\n"
        "	.word	CB2_FadeAndReturnToTitleScreen+1\n"
        "._18:\n"
        "	mov	r0, #0x1\n"
        "	mov	r1, #0xa\n"
        "	mov	r2, #0x1c\n"
        "	mov	r3, #0x13\n"
        "	bl	MenuDrawTextWindow\n"
        "	ldr	r0, ._24\n"
        "	ldr	r0, [r0]\n"
        "	cmp	r0, #0\n"
        "	bne	._22	@cond_branch\n"
        "	ldr	r0, ._24 + 4\n"
        "	mov	r1, #0x2\n"
        "	mov	r2, #0xb\n"
        "	bl	MenuPrint\n"
        "	b	._23\n"
        "._25:\n"
        "	.align	2, 0\n"
        "._24:\n"
        "	.word	gGameContinueCallback\n"
        "	.word	gSystemText_SaveCompletedGameEnd\n"
        "._14:\n"
        "	mov	r0, #0x1\n"
        "	mov	r1, #0xa\n"
        "	mov	r2, #0x1c\n"
        "	mov	r3, #0x13\n"
        "	bl	MenuDrawTextWindow\n"
        "	ldr	r0, ._27\n"
        "	mov	r1, #0x2\n"
        "	mov	r2, #0xb\n"
        "	bl	MenuPrint\n"
        "	ldr	r0, ._27 + 4\n"
        "	bl	SetMainCallback2\n"
        "	b	._26\n"
        "._28:\n"
        "	.align	2, 0\n"
        "._27:\n"
        "	.word	gSystemText_BackupDamagedGameContinue\n"
        "	.word	CB2_GameplayCannotBeContinued+1\n"
        "._22:\n"
        "	ldr	r0, ._29\n"
        "	mov	r1, #0x2\n"
        "	mov	r2, #0xb\n"
        "	bl	MenuPrint\n"
        "._23:\n"
        "	ldr	r0, ._29 + 4\n"
        "	bl	SetMainCallback2\n"
        "._26:\n"
        "	pop	{r4, r5}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._30:\n"
        "	.align	2, 0\n"
        "._29:\n"
        "	.word	gSystemText_SaveCompletedPressA\n"
        "	.word	CB2_FadeAndReturnToTitleScreen+1\n"
        "\n"
    );
}
#else
void CB2_WipeSave(void)
{
    u8 wipeTries = 0;

    gSaveFailedClockInfo.clockRunning = TRUE;

    while (gDamagedSaveSectors != 0 && wipeTries < 3) // while there are still attempts left, keep trying to fix the save sectors.
    {
        if (WipeSectors(gDamagedSaveSectors) != FALSE)
        {
            MenuDrawTextWindow(1, MSG_WIN_TOP, 28, 19);
            MenuPrint(gSystemText_BackupDamagedGameContinue, 2, MSG_WIN_TOP + 1);
            SetMainCallback2(CB2_GameplayCannotBeContinued);
            return;
        }

        MenuDrawTextWindow(1, MSG_WIN_TOP, 28, 19);
        MenuPrint(gSystemText_CheckCompleteSaveAttempt, 2, MSG_WIN_TOP + 1);
        HandleSavingData(gSaveFailedType);

        if (gDamagedSaveSectors != 0)
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

        // no callback exists, so the game cannot continue.
        if (gGameContinueCallback == 0)
            MenuPrint(gSystemText_SaveCompletedGameEnd, 2, MSG_WIN_TOP + 1);
        else // callback exists, so continue
            MenuPrint(gSystemText_SaveCompletedPressA, 2, MSG_WIN_TOP + 1);
    }

    SetMainCallback2(CB2_FadeAndReturnToTitleScreen);
}
#endif

void CB2_GameplayCannotBeContinued(void)
{
    gSaveFailedClockInfo.clockRunning = FALSE;

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
    gSaveFailedClockInfo.clockRunning = FALSE;

    if (gMain.newKeys & A_BUTTON)
    {
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
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

    if (gSaveFailedClockInfo.clockRunning != FALSE)
    {
        gMain.oamBuffer[0].tileNum = sClockFrames[n][0];
        gMain.oamBuffer[0].matrixNum = (sClockFrames[n][2] << 4) | (sClockFrames[n][1] << 3);
    }
    else
    {
        gMain.oamBuffer[0].tileNum = 1;
    }

    CpuFastCopy(gMain.oamBuffer, (void *)OAM, 4);

    if (gSaveFailedClockInfo.timer) // maybe was used for debugging?
        gSaveFailedClockInfo.timer--;
}

__attribute__((naked))
bool8 VerifySectorWipe(u16 sector)
{
    asm(
        "	push	{lr}\n"
        "	lsl	r0, r0, #0x10\n"
        "	lsr	r0, r0, #0x10\n"
        "	ldr	r2, ._50\n"
        "	mov	r3, #0x80\n"
        "	lsl	r3, r3, #0x5\n"
        "	mov	r1, #0x0\n"
        "	bl	gScriptFuncs_End+0x2d64\n"
        "	mov	r0, #0x0\n"
        "	ldr	r1, ._50 + 4\n"
        "._49:\n"
        "	add	r0, r0, #0x1\n"
        "	lsl	r0, r0, #0x10\n"
        "	lsr	r0, r0, #0x10\n"
        "	cmp	r0, r1\n"
        "	bls	._49	@cond_branch\n"
        "	ldr	r0, ._50 + 8\n"
        "	ldrb	r0, [r0]\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._51:\n"
        "	.align	2, 0\n"
        "._50:\n"
        "	.word	+0x2000000\n"
        "	.word	0x3ff\n"
        "	.word	gUnknown_Debug_03004BD0\n"
        "\n"
    );
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

bool8 WipeSectors(u32 sectorBits)
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
