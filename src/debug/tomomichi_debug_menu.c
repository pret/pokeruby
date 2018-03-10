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
bool8 debug_sub_808BCBC(void);
bool8 TomomichiDebugMenu_MuseumGraphics_Show(void);
bool8 debug_sub_808BD30(void);
bool8 debug_sub_808BDA4(void);
bool8 debug_sub_808BE2C(void);
bool8 debug_sub_808BEB4(void);
bool8 debug_sub_808BF3C(void);
bool8 debug_sub_808ECA4(void);
bool8 debug_sub_808EB58(void);
bool8 debug_sub_808EBB4(void);
bool8 debug_sub_808BFC4(void);
bool8 debug_sub_808C014(void);
bool8 debug_sub_808C31C(void);
bool8 debug_sub_808C7C8(void);
bool8 debug_sub_808CC74(void);
bool8 debug_sub_808CF10(void);
bool8 debug_sub_808D844(void);
bool8 debug_sub_808D600(void);
bool8 debug_sub_808D3BC(void);
bool8 debug_sub_808DB0C(void);
bool8 debug_sub_808E36C(void);
bool8 debug_sub_808E6C0(void);
bool8 debug_sub_808E90C(void);
bool8 debug_sub_808DA30(void);
bool8 debug_sub_808DFC0(void);
void debug_sub_808ED0C(void);
void debug_sub_808ED9C(void);
void debug_sub_808EE3C(void);
void debug_sub_808EE9C(void);
void debug_sub_808EF14(void);
void debug_sub_808EF8C(u32 a0);

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

const u8 gUnknown_Debug_083C0D4C[] = _("Art Mus.");
const u8 gUnknown_Debug_083C0D55[] = _("Pokémon No.");
const u8 gUnknown_Debug_083C0D61[] = _("ID rnd. digit");
const u8 gUnknown_Debug_083C0D6F[] = _("Title Type");
const u8 gUnknown_Debug_083C0D7A[] = _("Poké Art");

const struct MenuAction gUnknown_Debug_083C0D83[] = {
    {gUnknown_Debug_083C0D55, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C0D61, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C0D6F, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C0D7A, TomomichiDebugMenu_MuseumGraphics_Show}
};

const u8 gUnknown_Debug_083C0DA4[] = _("Preview");

const u8 gUnknown_Debug_083C0DAC[] = _("Pokémon No.");
const u8 gUnknown_Debug_083C0DB8[] = _("ID rnd. digit");
const u8 gUnknown_Debug_083C0DC6[] = _("Type");
const u8 gUnknown_Debug_083C0DCB[] = _("Poké Art");

const struct MenuAction gUnknown_Debug_083C0DD4[] = {
    {gUnknown_Debug_083C0DAC, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C0DB8, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C0DC6, TomomichiDebugMenu_Config},
    {gUnknown_Debug_083C0DCB, debug_sub_808ECA4}
};

const u8 gUnknown_Debug_083C0DF4[] = _("Trick related");

const u8 gUnknown_Debug_083C0E02[] = _("Level");
const u8 gUnknown_Debug_083C0E08[] = _("Trick Master");

const struct MenuAction gUnknown_Debug_083C0E15[] = {
    {gUnknown_Debug_083C0E02, debug_sub_808EB58},
    {gUnknown_Debug_083C0E08, debug_sub_808EBB4}
};

const u8 gUnknown_Debug_083C0E28[] = _("パート1");
const u8 gUnknown_Debug_083C0E2D[] = _("パート2");

const struct MenuAction gUnknown_Debug_083C0E32[] = {
    {gUnknown_Debug_083C0E28, debug_sub_808BFC4},
    {gUnknown_Debug_083C0E2D, debug_sub_808C014}
};

const u8 gUnknown_Debug_083C0E44[] = _("イベントFLAG");
const u8 gUnknown_Debug_083C0E4D[] = _("バニシュFLAG");
const u8 gUnknown_Debug_083C0E56[] = _("トレーナーFLAG");
const u8 gUnknown_Debug_083C0E60[] = _("SYSFLAG");
const u8 gUnknown_Debug_083C0E68[] = _("BALLバニシュFLAG");
const u8 gUnknown_Debug_083C0E75[] = _("FH");
const u8 gUnknown_Debug_083C0E78[] = _("FH-OBJ");

const struct MenuAction gUnknown_Debug_083C0E7F[] = {
    {gUnknown_Debug_083C0E44, debug_sub_808C31C},
    {gUnknown_Debug_083C0E4D, debug_sub_808C7C8},
    {gUnknown_Debug_083C0E56, debug_sub_808CC74},
    {gUnknown_Debug_083C0E60, debug_sub_808CF10},
    {gUnknown_Debug_083C0E68, debug_sub_808D844},
    {gUnknown_Debug_083C0E75, debug_sub_808D600},
    {gUnknown_Debug_083C0E78, debug_sub_808D3BC}
};

const u8 gUnknown_Debug_083C0EB8[] = _("SAVEWORK");

const u8 gUnknown_Debug_083C0EC1[] = _("SYSWORK");
const u8 gUnknown_Debug_083C0EC9[] = _("LOCALWORK");
const u8 gUnknown_Debug_083C0ED3[] = _("OBJWORK");
const u8 gUnknown_Debug_083C0EDB[] = _("ANSWORK");
const u8 gUnknown_Debug_083C0EE3[] = _("SAVEWORK　パート2");

const struct MenuAction gUnknown_Debug_083C0EF1[] = {
    {gUnknown_Debug_083C0EB8, debug_sub_808DB0C},
    {gUnknown_Debug_083C0EC1, debug_sub_808E36C},
    {gUnknown_Debug_083C0EC9, debug_sub_808E6C0},
    {gUnknown_Debug_083C0ED3, debug_sub_808E90C},
    {gUnknown_Debug_083C0EDB, debug_sub_808DA30},
    {gUnknown_Debug_083C0EE3, debug_sub_808DFC0}
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
    Menu_PrintItems(1, 1, ARRAY_COUNT(gUnknown_Debug_083C0CBA), gUnknown_Debug_083C0CBA);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C0CBA), gDebug_0300071D, 12);
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
    Menu_PrintItems(2, 3, ARRAY_COUNT(gUnknown_Debug_083C0D2C), gUnknown_Debug_083C0D2C);
    InitMenu(0, 1, 3, ARRAY_COUNT(gUnknown_Debug_083C0D2C), 0, 19);
    gMenuCallback = debug_sub_808BC48;
    gDebug_03000700 = 1;
    gDebug_03000704 = 0x6f33;
    gDebug_03000708 = 0;
    gDebug_0300070C = 1;
    return FALSE;
}

bool8 TomomichiDebugMenu_ArtMusGraphics(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 20, 11);
    Menu_PrintText(gUnknown_Debug_083C0D4C, 1, 1);
    Menu_PrintItems(2, 3, ARRAY_COUNT(gUnknown_Debug_083C0D83), gUnknown_Debug_083C0D83);
    InitMenu(0, 1, 3, ARRAY_COUNT(gUnknown_Debug_083C0D83), 0, 19);
    gMenuCallback = debug_sub_808BCBC;
    gDebug_03000700 = 1;
    gDebug_03000704 = 0x6f33;
    gDebug_03000708 = 0;
    gDebug_0300070D = 1;
    return FALSE;
}

bool8 TomomichiDebugMenu_PreviewData(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 20, 11);
    Menu_PrintText(gUnknown_Debug_083C0DA4, 1, 1);
    Menu_PrintItems(2, 3, ARRAY_COUNT(gUnknown_Debug_083C0DD4), gUnknown_Debug_083C0DD4);
    InitMenu(0, 1, 3, ARRAY_COUNT(gUnknown_Debug_083C0DD4), 0, 19);
    gMenuCallback = debug_sub_808BD30;
    gDebug_03000700 = 1;
    gDebug_03000704 = 0x6f33;
    gDebug_03000708 = 0;
    gDebug_0300070E = 1;
    return FALSE;
}

bool8 TomomichiDebugMenu_TrickHouse(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 24, 7);
    Menu_PrintText(gUnknown_Debug_083C0DF4, 1, 1);
    Menu_PrintItems(2, 3, ARRAY_COUNT(gUnknown_Debug_083C0E15), gUnknown_Debug_083C0E15);
    InitMenu(0, 1, 3, ARRAY_COUNT(gUnknown_Debug_083C0E15), gDebug_0300071E, 23);
    gMenuCallback = debug_sub_808BDA4;
    return FALSE;
}

bool8 TomomichiDebugMenu_ControlEvents(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 24, 5);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_083C0E32), gUnknown_Debug_083C0E32);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C0E32), gDebug_0300071F, 23);
    gMenuCallback = debug_sub_808BE2C;
    return FALSE;
}

bool8 TomomichiDebugMenu_ControlFlags(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 24, 15);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_083C0E7F), gUnknown_Debug_083C0E7F);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C0E7F), gDebug_03000720, 23);
    gMenuCallback = debug_sub_808BEB4;
    return FALSE;
}

bool8 TomomichiDebugMenu_ControlWorks(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 24, 13);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_083C0EF1), gUnknown_Debug_083C0EF1);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C0EF1), gDebug_03000721, 23);
    gMenuCallback = debug_sub_808BF3C;
    return FALSE;
}

bool8 debug_sub_808BC48(void)
{
    s8 input = Menu_ProcessInput();
    s8 cursorPos = Menu_GetCursorPos();

    switch (cursorPos)
    {
        case 0:
            debug_sub_808ED0C();
            break;
        case 1:
            debug_sub_808ED9C();
            break;
        case 2:
            debug_sub_808EE3C();
            break;
    }
    debug_sub_808EF8C(0);
    if (input == -2)
        return FALSE;
    if (input == -1)
    {
        CloseMenu();
        return TRUE;
    }
    if (input == 3)
    {
        gMenuCallback = gUnknown_Debug_083C0D2C[3].func;
        return FALSE;
    }
    return FALSE;
}

bool8 debug_sub_808BCBC(void)
{
    s8 input = Menu_ProcessInput();
    s8 cursorPos = Menu_GetCursorPos();

    switch (cursorPos)
    {
        case 0:
            debug_sub_808ED0C();
            break;
        case 1:
            debug_sub_808ED9C();
            break;
        case 2:
            debug_sub_808EE9C();
            break;
    }
    debug_sub_808EF8C(1);
    if (input == -2)
        return FALSE;
    if (input == -1)
    {
        CloseMenu();
        return TRUE;
    }
    if (input == 3)
    {
        gMenuCallback = gUnknown_Debug_083C0D83[3].func;
        return FALSE;
    }
    return FALSE;
}

bool8 debug_sub_808BD30(void)
{
    s8 input = Menu_ProcessInput();
    s8 cursorPos = Menu_GetCursorPos();

    switch (cursorPos)
    {
        case 0:
            debug_sub_808ED0C();
            break;
        case 1:
            debug_sub_808ED9C();
            break;
        case 2:
            debug_sub_808EF14();
            break;
    }
    debug_sub_808EF8C(2);
    if (input == -2)
        return FALSE;
    if (input == -1)
    {
        CloseMenu();
        return TRUE;
    }
    if (input == 3)
    {
        gMenuCallback = gUnknown_Debug_083C0DD4[3].func;
        return FALSE;
    }
    return FALSE;
}

bool8 debug_sub_808BDA4(void)
{
    if (gMain.newKeys & DPAD_UP)
    {
        PlaySE(SE_SELECT);
        gDebug_0300071E = Menu_MoveCursor(-1);
    }
    if (gMain.newKeys & DPAD_DOWN)
    {
        PlaySE(SE_SELECT);
        gDebug_0300071E = Menu_MoveCursor(+1);
    }
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        return gUnknown_Debug_083C0E15[gDebug_0300071E].func();
    }
    if (gMain.newKeys & (B_BUTTON | START_BUTTON))
    {
        CloseMenu();
        return TRUE;
    }
    return FALSE;
}

#endif
