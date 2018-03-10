#if DEBUG
#include "global.h"
#include "constants/songs.h"
#include "overworld.h"
#include "menu.h"
#include "start_menu.h"
#include "main.h"
#include "sound.h"

// These should be static, uninitialized once it gets decompiled.
#define BSS_DATA __attribute__((section(".bss")))
BSS_DATA u16 gDebug_03000700 = 0;
BSS_DATA u32 gDebug_03000704 = 0;
BSS_DATA u32 gDebug_03000708 = 0;
BSS_DATA u8 gDebug_0300070C = 0;
BSS_DATA u8 gDebug_0300070D = 0;
BSS_DATA u8 gDebug_0300070E = 0;
BSS_DATA u8 gDebug_0300070F = 0;
BSS_DATA u8 gDebug_03000710[13] = {0};
BSS_DATA u8 gDebug_0300071D = 0;
BSS_DATA u8 gDebug_0300071E = 0;
BSS_DATA u8 gDebug_0300071F = 0;
BSS_DATA u8 gDebug_03000720 = 0;
BSS_DATA u8 gDebug_03000721 = 0;

bool8 debug_sub_808B874(void);
bool8 debug_sub_808B8C8(void);
bool8 TomomichiDebugMenu_ContestGraphics(void);
bool8 TomomichiDebugMenu_ArtMusGraphics(void);
bool8 TomomichiDebugMenu_PreviewData(void);
bool8 TomomichiDebugMenu_TrickHouse(void);
bool8 TomomichiDebugMenu_ControlEvents(void);
bool8 TomomichiDebugMenu_ControlFlags(void);
bool8 TomomichiDebugMenu_ControlWorks(void);
bool8 TomomichiDebugMenu_Config(void);
bool8 TomomichiDebugMenu_ContestGraphics_Show(void);
bool8 debug_sub_808BC48(void);

const u8 gUnknown_Debug_083C0C54[] = _("Contest graphics");
const u8 gUnknown_Debug_083C0C65[] = _("Art Mus. graphics");
const u8 gUnknown_Debug_083C0C77[] = _("Preview data");
const u8 gUnknown_Debug_083C0C84[] = _("TRICK HOUSE");
const u8 gUnknown_Debug_083C0C90[] = _("Control events");
const u8 gUnknown_Debug_083C0C9F[] = _("Control flags");
const u8 gUnknown_Debug_083C0CAD[] = _("Control WORK");

const struct MenuAction gUnknown_Debug_083C0CBA[] = {
    {gUnknown_Debug_083C0C54, TomomichiDebugMenu_ContestGraphics},
    {gUnknown_Debug_083C0C65, TomomichiDebugMenu_ArtMusGraphics},
    {gUnknown_Debug_083C0C77, TomomichiDebugMenu_PreviewData},
    {gUnknown_Debug_083C0C84, TomomichiDebugMenu_TrickHouse},
    {gUnknown_Debug_083C0C90, TomomichiDebugMenu_ControlEvents},
    {gUnknown_Debug_083C0C9F, TomomichiDebugMenu_ControlFlags},
    {gUnknown_Debug_083C0CAD, TomomichiDebugMenu_ControlWorks},
};

const u8 gUnknown_Debug_083C0CF4[] = _("Contest");

const u8 gUnknown_Debug_083C0CFC[] = _("Pokémon No.");
const u8 gUnknown_Debug_083C0D08[] = _("ID rnd. digit");
const u8 gUnknown_Debug_083C0D16[] = _("Contest Type");
const u8 gUnknown_Debug_083C0D23[] = _("Poké Art");

const struct MenuAction gUnknown_Debug_083C0D2C[] = {
    {gUnknown_Debug_083C0CFC, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C0D08, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C0D16, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C0D23, TomomichiDebugMenu_ContestGraphics_Show}
};

bool8 InitTomomichiDebugWindow(void)
{
    debug_sub_808B874();
    return FALSE;
}

void debug_sub_808B868(void)
{
    c2_exit_to_overworld_1_continue_scripts_restart_music();
}

bool8 debug_sub_808B874(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 13, 15);
    Menu_PrintItems(1, 1, 7, gUnknown_Debug_083C0CBA);
    InitMenu(0, 1, 1, 7, gDebug_0300071D, 12);
    gMenuCallback = debug_sub_808B8C8;
    return FALSE;
}

bool8 debug_sub_808B8C8(void)
{
    if (gMain.newKeys & DPAD_UP)
    {
        PlaySE(SE_SELECT);
        gDebug_0300071D = Menu_MoveCursor(-1);
    }
    if (gMain.newKeys & DPAD_DOWN)
    {
        PlaySE(SE_SELECT);
        gDebug_0300071D = Menu_MoveCursor(+1);
    }
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        return gUnknown_Debug_083C0CBA[gDebug_0300071D].func();
    }
    if (gMain.newKeys & (B_BUTTON | START_BUTTON))
    {
        CloseMenu();
        return TRUE;
    }
    return FALSE;
}

bool8 TomomichiDebugMenu_ContestGraphics(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 20, 11);
    Menu_PrintText(gUnknown_Debug_083C0CF4, 1, 1);
    Menu_PrintItems(2, 3, 4, gUnknown_Debug_083C0D2C);
    InitMenu(0, 1, 3, 4, 0, 19);
    gMenuCallback = debug_sub_808BC48;
    gDebug_03000700 = 1;
    gDebug_03000704 = 0x6f33;
    gDebug_03000708 = 0;
    gDebug_0300070C = 1;
    return FALSE;
}

#endif
