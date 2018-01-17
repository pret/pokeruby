#include "global.h"
#include "main.h"
#include "task.h"
#include "text.h"
#include "palette.h"

extern struct Window gUnknown_03004210;

static void CB2_CrashIdle(void);

// unused exception handler. Takes a string input describing the exception
// and halts on a black screen. Used in German Debug Ruby.
void Crash(u8 *text)
{
    u16 savedIme;

    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG3HOFS = 0;
    REG_BG3VOFS = 0;
    REG_WIN0H = 0;
    REG_WIN0V = 0;
    REG_WIN1H = 0;
    REG_WIN1V = 0;
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_ON;
    savedIme = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = savedIme;
    REG_DISPSTAT = 8;
    ResetTasks();
    ResetSpriteData();
    SetMainCallback2(CB2_CrashIdle);
    DmaFill32Large(3, 0, (void *)VRAM, 0x18000, 0x1000);
    Text_LoadWindowTemplate(&gWindowTemplate_81E6FD8);
    Text_InitWindowWithTemplate(&gUnknown_03004210, &gWindowTemplate_81E6FD8);
    LoadFontDefaultPalette(&gWindowTemplate_81E6FD8);
    Text_InitWindowAndPrintText(&gUnknown_03004210, text, 1, 9, 7);
}

static void CB2_CrashIdle(void)
{
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG3HOFS = 0;
    REG_BG3VOFS = 0;
}
