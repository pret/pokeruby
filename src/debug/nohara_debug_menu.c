#if DEBUG
#include "global.h"
#include "constants/flags.h"
#include "constants/songs.h"
#include "main.h"
#include "menu.h"
#include "start_menu.h"
#include "tv.h"
#include "event_data.h"
#include "string_util.h"
#include "field_specials.h"
#include "sound.h"

static u8 gDebug_03000724;
static u8 gDebug_03000725;
static u8 gDebug_03000726;

asm(".global gDebug_03000724");
asm(".global gDebug_03000725");
asm(".global gDebug_03000726");

bool8 debug_sub_808F414(void);
bool8 NoharaDebugMenu_TV(void);
bool8 debug_sub_808F4AC(void);
void debug_sub_808F4EC(void);
bool8 debug_sub_808F560(void);
bool8 debug_sub_808F594(void);
bool8 debug_sub_808F5D8(void);
bool8 debug_sub_808F648(void);
void debug_sub_808F6BC(void);
void debug_sub_808F7B4(void);
bool8 debug_sub_808F8AC(void);
void debug_sub_808F8CC(void);
bool8 debug_sub_808F93C(void);
void debug_sub_808FA88(u8, u8);
void debug_sub_808FEBC(void);
void debug_sub_808FECC(void);
void debug_sub_80900AC(void);
bool8 debug_sub_8090278(void);
bool8 NoharaDebugMenu_Fan(void);
bool8 NoharaDebugMenu_BattleVSDad(void);
bool8 NoharaDebugMenu_DadAfterBattle(void);
bool8 NoharaDebugMenu_SootopolisCity(void);
bool8 NoharaDebugMenu_Embark(void);
bool8 NoharaDebugMenu_Yes9999(void);
bool8 NoharaDebugMenu_LegendsFlagOn(void);
bool8 NoharaDebugMenu_AddNumWinningStreaks(void);

const u8 gUnknown_Debug_083C48C4[] = _("TV");
const u8 gUnknown_Debug_083C48C7[] = _("Fan");
const u8 gUnknown_Debug_083C48CB[] = _("Battle　(vs　Dad)");
const u8 gUnknown_Debug_083C48DB[] = _("Dad　after　battle");
const u8 gUnknown_Debug_083C48EC[] = _("SOOTOPOLIS　CITY");
const u8 gUnknown_Debug_083C48FC[] = _("Embark");
const u8 gUnknown_Debug_083C4903[] = _("Yes　9999");
const u8 gUnknown_Debug_083C490C[] = _("Legends　flag　ON");
const u8 gUnknown_Debug_083C491C[] = _("Add　num　of　winning　streaks");

const struct MenuAction gUnknown_Debug_083C4938[] = {
    {gUnknown_Debug_083C48C4, NoharaDebugMenu_TV},
    {gUnknown_Debug_083C48C7, NoharaDebugMenu_Fan},
    {gUnknown_Debug_083C48CB, NoharaDebugMenu_BattleVSDad},
    {gUnknown_Debug_083C48DB, NoharaDebugMenu_DadAfterBattle},
    {gUnknown_Debug_083C48EC, NoharaDebugMenu_SootopolisCity},
    {gUnknown_Debug_083C48FC, NoharaDebugMenu_Embark},
    {gUnknown_Debug_083C4903, NoharaDebugMenu_Yes9999},
    {gUnknown_Debug_083C490C, NoharaDebugMenu_LegendsFlagOn},
    {gUnknown_Debug_083C491C, NoharaDebugMenu_AddNumWinningStreaks}
};

bool8 InitNoharaDebugMenu(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 19, 19);
    Menu_PrintItems(1, 1, ARRAY_COUNT(gUnknown_Debug_083C4938), gUnknown_Debug_083C4938);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C4938), 0, 18);
    gMenuCallback = debug_sub_808F414;
    return FALSE;
}

bool8 debug_sub_808F414(void)
{
    s8 input = Menu_ProcessInput();
    switch (input)
    {
        default:
            gMenuCallback = gUnknown_Debug_083C4938[input].func;
            return FALSE;
        case -2:
            return FALSE;
        case -1:
            CloseMenu();
            return TRUE;
    }
}

const u8 gUnknown_Debug_083C4980[] = _("Want　to　change　data　type{CLEAR_TO 143}Press　Left\n"
                                       "to　see　secret　type　now？{CLEAR_TO 143}to　switch");

const u8 gUnknown_Debug_083C49CA[] = _("Choose　the　TV　data　you　wish　to\n"
                                       "create　to　check　a　transmission。");

const u8 gUnknown_Debug_083C4A09[] = _("ほうそうの　はっせいりつを　セット\n"
                                       "してください　？ぶんの1に　なります");

const u8 gUnknown_Debug_083C4A2E[] = _("SURVEY");
const u8 gUnknown_Debug_083C4A35[] = _("RECENT　HAPPENINGS");
const u8 gUnknown_Debug_083C4A47[] = _("POKひMON　FAN　CLUB");
const u8 gUnknown_Debug_083C4A58[] = _("ジム");
const u8 gUnknown_Debug_083C4A5B[] = _("OUTBREAKS");
const u8 gUnknown_Debug_083C4A65[] = _("NAME　RATER");
const u8 gUnknown_Debug_083C4A70[] = _("CONTEST");
const u8 gUnknown_Debug_083C4A78[] = _("INTRODUCTION");
const u8 gUnknown_Debug_083C4A85[] = _("SHOPPING");
const u8 gUnknown_Debug_083C4A8E[] = _("MISFORTUNE");
const u8 gUnknown_Debug_083C4A99[] = _("FISHING");
const u8 gUnknown_Debug_083C4AA1[] = _("MEMORABLE　DAY");
const u8 gUnknown_Debug_083C4AAF[] = _("BRAVO　TRAINER");

const u8 gUnknown_Debug_083C4ABD[] = {
    TVSHOW_FAN_CLUB_LETTER,
    TVSHOW_RECENT_HAPPENINGS,
    TVSHOW_PKMN_FAN_CLUB_OPINIONS,
    TVSHOW_MASS_OUTBREAK,
    TVSHOW_NAME_RATER_SHOW,
    TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE,
    TVSHOW_POKEMON_TODAY_CAUGHT,
    TVSHOW_SMART_SHOPPER,
    TVSHOW_POKEMON_TODAY_FAILED,
    TVSHOW_FISHING_ADVICE,
    TVSHOW_WORLD_OF_MASTERS,
    TVSHOW_BRAVO_TRAINER_BATTLE_TOWER_PROFILE
};

const u8 *const gUnknown_Debug_083C4ACC[] = {
    gUnknown_Debug_083C4A2E,
    gUnknown_Debug_083C4A35,
    gUnknown_Debug_083C4A47,
    gUnknown_Debug_083C4A5B,
    gUnknown_Debug_083C4A65,
    gUnknown_Debug_083C4A70,
    gUnknown_Debug_083C4A78,
    gUnknown_Debug_083C4A85,
    gUnknown_Debug_083C4A8E,
    gUnknown_Debug_083C4A99,
    gUnknown_Debug_083C4AA1,
    gUnknown_Debug_083C4AAF
};

const u8 gDebugText_BigSale[] = _("BIG SALE");

const u8 gUnknown_Debug_083C4B05[] = _("SERVICE　DAY");
const u8 gUnknown_Debug_083C4B11[] = _("CLEARーOUT　SALE");
const u8 gUnknown_Debug_083C4B20[] = {1, 2, 3};

const u8 *const gUnknown_Debug_083C4B24[] = {
    gDebugText_BigSale,
    gUnknown_Debug_083C4B05,
    gUnknown_Debug_083C4B11
};

const u8 gUnknown_Debug_083C4B30[] = _("Secret　type");
const u8 gUnknown_Debug_083C4B3C[] = _("Start");
const u8 gUnknown_Debug_083C4B42[] = _("Create　TV");
const u8 gUnknown_Debug_083C4B4C[] = _("All　clear");
const u8 gUnknown_Debug_083C4B56[] = _("All　seen");
const u8 gUnknown_Debug_083C4B5F[] = _("Create　CM");
const u8 gUnknown_Debug_083C4B69[] = _("Not　yet　seen");
const u8 gUnknown_Debug_083C4B76[] = _("Hit　Table");
const u8 gUnknown_Debug_083C4B80[] = _("Set　full");

// Normaly these would be struct MenuAction, but the prototype of
// member .func is not consistent.
const struct {
    const u8 * text;
    void *func;
} gUnknown_Debug_083C4B8C[] = {
    {gUnknown_Debug_083C4B30, debug_sub_808F4EC},
    {gUnknown_Debug_083C4B3C, debug_sub_808F8AC},
    {gUnknown_Debug_083C4B42, debug_sub_808F8CC},
    {gUnknown_Debug_083C4B4C, debug_sub_808FEBC},
    {gUnknown_Debug_083C4B56, debug_sub_808F560},
    {gUnknown_Debug_083C4B5F, debug_sub_808FECC},
    {gUnknown_Debug_083C4B69, debug_sub_808F594},
    {gUnknown_Debug_083C4B76, debug_sub_808F5D8},
    {gUnknown_Debug_083C4B80, debug_sub_80900AC}
};

bool8 NoharaDebugMenu_TV(void)
{
    gDebug_03000726 = 0;
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 10, 19);
    Menu_PrintItems(1, 1, ARRAY_COUNT(gUnknown_Debug_083C4B8C), gUnknown_Debug_083C4B8C);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C4B8C), 0, 9);
    gMenuCallback = debug_sub_808F4AC;
    return FALSE;
}

bool8 debug_sub_808F4AC(void)
{
    s8 input = Menu_ProcessInput();
    switch (input)
    {
        default:
            gMenuCallback = (MenuFunc)gUnknown_Debug_083C4B8C[input].func;
            return FALSE;
        case -2:
            return FALSE;
        case -1:
            CloseMenu();
            return TRUE;
    }
}

void debug_sub_808F4EC(void)
{
    debug_sub_808F6BC();
    sub_8071F40(gUnknown_Debug_083C4980);
    DisplayYesNoMenu(3, 3, 1);
    gMenuCallback = debug_sub_808F648;
}

void debug_sub_808F518(void)
{
    u8 i;

    for (i = 0; i < 24; i++)
    {
        if (gSaveBlock1.tvShows[i].common.kind >= TVSHOW_POKEMON_TODAY_CAUGHT &&
            gSaveBlock1.tvShows[i].common.kind < TVSHOW_MASS_OUTBREAK &&
            !gSaveBlock1.tvShows[i].common.active)
            gSaveBlock1.tvShows[i].common.active = TRUE;
    }
}

bool8 debug_sub_808F560(void)
{
    u8 i;

    for (i = 0; i < 24; i++)
        gSaveBlock1.tvShows[i].common.active = FALSE;
    CloseMenu();
    return TRUE;
}

bool8 debug_sub_808F594(void)
{
    u8 i;

    for (i = 0; i < 24; i++)
    {
        if (gSaveBlock1.tvShows[i].common.kind != 0)
            gSaveBlock1.tvShows[i].common.active = TRUE;
    }
    CloseMenu();
    return TRUE;
}

const u8 gUnknown_Debug_083C4BD4[][12] = {
    {0x0C, 0x04},
    {0x0C, 0x08},
    {0x0C, 0x0A},
    {0x0E, 0x06},
    {0x0E, 0x08},
    {0x0E, 0x0A},
    {0x10, 0x04},
    {0x10, 0x06},
    {0x10, 0x0A},
    {0x12, 0x04},
    {0x12, 0x06},
    {0x12, 0x0A}
};

bool8 debug_sub_808F5D8(void)
{
    u8 i;

    for (i = 0; i < 12; i++)
    {
        gSpecialVar_0x8004 = i;
        ConvertIntToDecimalStringN(gStringVar1, GetSlotMachineId(), STR_CONV_MODE_LEFT_ALIGN, 1);
        Menu_PrintText(gStringVar1, gUnknown_Debug_083C4BD4[i][0], gUnknown_Debug_083C4BD4[i][1]);
    }
    gSpecialVar_0x8004 = 0;
    gMenuCallback = debug_sub_8090278;
    return FALSE;
}

bool8 debug_sub_808F648(void)
{
    if (gMain.newKeys & DPAD_LEFT)
    {
        Menu_EraseWindowRect(10, 0, 29, 13);
        gDebug_03000726 ^= 1;
        if (gDebug_03000726)
            debug_sub_808F7B4();
        else
            debug_sub_808F6BC();
        return FALSE;
    }
    else
    {
        s8 input = Menu_ProcessInputNoWrap_();
        switch (input)
        {
            case -2:
                return FALSE;
            case 0:
                debug_sub_808F518();
                // fallthrough
            case -1:
            default:
                CloseMenu();
                return TRUE;
        }
    }
}

void debug_sub_808F6BC(void)
{
    u8 i;

    for (i = 0; i < 5; i++)
    {
        ConvertIntToDecimalStringN(gStringVar1, gSaveBlock1.tvShows[i].common.kind, STR_CONV_MODE_LEFT_ALIGN, 2);
        Menu_PrintText(gStringVar1, i * 2 + 10, 0);
    }

    for (i = 5; i < 24; i++)
    {
        ConvertIntToDecimalStringN(gStringVar1, gSaveBlock1.tvShows[i].common.kind, STR_CONV_MODE_LEFT_ALIGN, 2);
        if (i < 15)
            Menu_PrintText(gStringVar1, i * 2, 3);
        else
            Menu_PrintText(gStringVar1, i * 2 - 20, 6);
    }

    for (i = 0; i < 16; i++)
    {
        ConvertIntToDecimalStringN(gStringVar1, gSaveBlock1.pokeNews[i].kind, STR_CONV_MODE_LEFT_ALIGN, 2);
        if (i < 8)
            Menu_PrintText(gStringVar1, i * 2 + 10, 9);
        else
            Menu_PrintText(gStringVar1, i * 2 - 6, 12);
    }
}

void debug_sub_808F7B4(void)
{
    u8 i;

    for (i = 0; i < 5; i++)
    {
        ConvertIntToDecimalStringN(gStringVar1, gSaveBlock1.tvShows[i].common.active, STR_CONV_MODE_LEFT_ALIGN, 2);
        Menu_PrintText(gStringVar1, i * 2 + 10, 0);
    }

    for (i = 5; i < 24; i++)
    {
        ConvertIntToDecimalStringN(gStringVar1, gSaveBlock1.tvShows[i].common.active, STR_CONV_MODE_LEFT_ALIGN, 2);
        if (i < 15)
            Menu_PrintText(gStringVar1, i * 2, 3);
        else
            Menu_PrintText(gStringVar1, i * 2 - 20, 6);
    }

    for (i = 0; i < 16; i++)
    {
        ConvertIntToDecimalStringN(gStringVar1, gSaveBlock1.pokeNews[i].state, STR_CONV_MODE_LEFT_ALIGN, 2);
        if (i < 8)
            Menu_PrintText(gStringVar1, i * 2 + 10, 9);
        else
            Menu_PrintText(gStringVar1, i * 2 - 6, 12);
    }
}

bool8 debug_sub_808F8AC(void)
{
    FlagSet(FLAG_SYS_TV_START);
    FlagSet(FLAG_VISITED_MAUVILLE_CITY);
    CloseMenu();
    return TRUE;
}

void debug_sub_808F8CC(void)
{
    gDebug_03000724 = 0;
    sub_8071F40(gUnknown_Debug_083C49CA);
    Menu_BlankWindowRect(13, 6, 26, 8);
    Menu_PrintText(gUnknown_Debug_083C4ACC[0], 14, 7);
    Menu_BlankWindowRect(22, 1, 24, 2);
    ConvertIntToDecimalStringN(gStringVar1, 0, STR_CONV_MODE_LEFT_ALIGN, 2);
    Menu_PrintText(gStringVar1, 23, 1);
    gMenuCallback = debug_sub_808F93C;
}

bool8 debug_sub_808F93C(void)
{
    bool8 updateDisplay = FALSE;
    if (gMain.newKeys & DPAD_UP)
    {
        gDebug_03000725++;
        if (gDebug_03000725 == 24)
            gDebug_03000725 = 0;
        PlaySE(SE_SELECT);
        updateDisplay = TRUE;
    }
    if (gMain.newKeys & DPAD_DOWN)
    {
        if (gDebug_03000725 == 0)
            gDebug_03000725 = 24;
        gDebug_03000725--;
        PlaySE(SE_SELECT);
        updateDisplay = TRUE;
    }
    if (gMain.newKeys & DPAD_RIGHT)
    {
        gDebug_03000724++;
        if (gDebug_03000724 == 12)
            gDebug_03000724 = 0;
        PlaySE(SE_SELECT);
        updateDisplay = TRUE;
    }
    if (gMain.newKeys & DPAD_LEFT)
    {
        if (gDebug_03000724 == 0)
            gDebug_03000724 = 12;
        gDebug_03000724--;
        PlaySE(SE_SELECT);
        updateDisplay = TRUE;
    }
    if (updateDisplay)
    {
        Menu_BlankWindowRect(13, 6, 26, 8);
        Menu_PrintText(gUnknown_Debug_083C4ACC[gDebug_03000724], 14, 7);
        Menu_BlankWindowRect(22, 1, 24, 2);
        ConvertIntToDecimalStringN(gStringVar1, gDebug_03000725, STR_CONV_MODE_LEFT_ALIGN, 2);
        Menu_PrintText(gStringVar1, 23, 1);
    }
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_PIN);
        debug_sub_808FA88(gDebug_03000725, gUnknown_Debug_083C4ABD[gDebug_03000724]);
    }
    if (gMain.newKeys & (B_BUTTON | START_BUTTON))
    {
        sub_80BF588(gSaveBlock1.tvShows);
        CloseMenu();
        return TRUE;
    }
    return FALSE;
}

#endif
