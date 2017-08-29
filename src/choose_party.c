#include "global.h"
#include "decoration.h"
#include "field_fadetransition.h"
#include "main.h"
#include "menu.h"
#include "name_string_util.h"
#include "palette.h"
#include "party_menu.h"
#include "pokemon_menu.h"
#include "pokemon.h"
#include "pokemon_summary_screen.h"
#include "rom4.h"
#include "script.h"
#include "songs.h"
#include "sound.h"
#include "strings.h"
#include "string_util.h"
#include "task.h"
#include "text.h"

struct UnknownPokemonStruct2
{
    /*0x00*/ u16 species;
    /*0x02*/ u16 heldItem;
    /*0x04*/ u8 nickname[11];
    /*0x0F*/ u8 level;
    /*0x10*/ u16 hp;
    /*0x12*/ u16 maxhp;
    /*0x14*/ u32 status;
    /*0x18*/ u32 personality;
    /*0x1C*/ u8 gender;
    /*0x1D*/ u8 language;
};

extern u8 gPlayerPartyCount;
extern u8 gLastFieldPokeMenuOpened;
extern u8 gUnknown_020384F0;
extern struct UnknownPokemonStruct2 gUnknown_02023A00[];
extern u8 gUnknown_0202E8F6;
extern struct Pokemon gUnknown_030042FC[];
extern const u16 gBattleTowerBanlist[];

EWRAM_DATA u8 gSelectedOrderFromParty[3] = {0};

extern void OpenPartyMenu();
extern void TryCreatePartyMenuMonIcon(u8, u8, struct Pokemon *);
extern void LoadHeldItemIconGraphics(void);
extern void CreateHeldItemIcons_806DC34();
extern u8 sub_806BD58(u8, u8);
extern void PartyMenuPrintMonsLevelOrStatus(void);
extern void PrintPartyMenuMonNicknames(void);
extern void sub_806BC3C(u8, u8);
extern u8 sub_806B58C(u8);
extern u16 sub_806BE38();
extern u8 sub_806CA38();
extern TaskFunc PartyMenuGetPopupMenuFunc(u8, const struct PartyPopupMenu *, const struct PartyMenuItem *, u8);
extern u8 sub_806B124();
extern void sub_806C994();
extern void sub_806C658();
extern void sub_806AEDC(void);
extern void sub_806AF4C();
extern void ShowPokemonSummaryScreen(struct Pokemon *, u8, u8, void (*)(void), int);
extern void sub_806C890();
extern void sub_806D5A4();
extern void sub_806B908(void);
extern void CreateMonIcon_806D99C(int, u8, int, struct UnknownPokemonStruct2 *);
extern void sub_806D50C(int, u8);
extern void CreatePartyMenuMonIcon();
extern void CreateHeldItemIcon_806DCD4(int, u8, int);
extern u8 GetMonStatusAndPokerus();
extern void PartyMenuPrintHP();
extern void PartyMenuPutStatusTilemap(u8, int, u8);
extern void PartyMenuPrintLevel();
extern void PartyMenuPutNicknameTilemap();
extern void PrintPartyMenuMonNickname();
extern void PartyMenuDrawHPBar();
extern bool8 sub_80F9344(void);
extern void sub_806D4AC();
extern void sub_806D3B4();
extern void PartyMenuDoPrintLevel(u8, u8, u8);
extern void PartyMenuDoDrawHPBar(u8, u8, u16, u16);
extern void PartyMenuDoPutNicknameTilemap(u16, u8, u8, u8, const u8 *);
extern void box_print(u8, int, const u8 *);
extern void sub_806BCE8(void);
extern void sub_806E750(u8, const struct PartyPopupMenu *, const struct PartyMenuItem *, int);

static void ClearPartySelection(void);
static bool8 IsMonAllowedInBattleTower(struct Pokemon *);
static void sub_812238C(u8);
static void sub_8122450(u8);
static void sub_81224A8(u8);
static void sub_8122728(u8);
static void BattleTowerEntryMenuCallback_Exit(u8);
static void sub_81228E8(u8);
static void sub_8122950(u8);
static void sub_81229B8(void);
static void sub_8122AB8(u8);
static void sub_8122B10(u8);
static void sub_8122C18(u8);
static void Task_DaycareStorageMenu8122EAC(u8);
void sub_8123138(u8);
static void sub_8123170(u8);
static void sub_81231AC(void);

void sub_8121E10(void)
{
    ClearPartySelection();
    ewram1B000.unk263 = 0;
    OpenPartyMenu(4, 0);
}

void sub_8121E34(void)
{
    ClearPartySelection();
    ewram1B000.unk263 = 1;
    OpenPartyMenu(4, 0);
}

static void ClearPartySelection(void)
{
    u8 i;

    for (i = 0; i < 3; i++)
        gSelectedOrderFromParty[i] = 0;
}

bool8 sub_8121E78(void)
{
    u8 i;

    switch (ewram1B000_alt.unk264)
    {
    case 0:
        if (ewram1B000_alt.unk266 < gPlayerPartyCount)
        {
            TryCreatePartyMenuMonIcon(ewram1B000_alt.unk260, ewram1B000_alt.unk266, &gPlayerParty[ewram1B000_alt.unk266]);
            ewram1B000_alt.unk266++;
        }
        else
        {
            ewram1B000_alt.unk266 = 0;
            ewram1B000_alt.unk264++;
        }
        break;
    case 1:
        LoadHeldItemIconGraphics();
        ewram1B000_alt.unk264++;
        break;
    case 2:
        CreateHeldItemIcons_806DC34(ewram1B000_alt.unk260);
        ewram1B000_alt.unk264++;
        break;
    case 3:
        if (sub_806BD58(ewram1B000_alt.unk260, ewram1B000_alt.unk266) == 1)
        {
            ewram1B000_alt.unk266 = 0;
            ewram1B000_alt.unk264++;
        }
        else
        {
            ewram1B000_alt.unk266++;
        }
        break;
    case 4:
        PartyMenuPrintMonsLevelOrStatus();
        ewram1B000_alt.unk264++;
        break;
    case 5:
        PrintPartyMenuMonNicknames();
        ewram1B000_alt.unk264++;
        break;
    case 6:
        for (i = 0; i < gPlayerPartyCount; i++)
        {
            u8 j;

            for (j = 0; j < 3; j++)
            {
                if (gSelectedOrderFromParty[j] == i + 1)
                {
                    sub_806BC3C(i, j * 14 + 0x1C);
                    break;
                }
            }
            if (j == 3)
            {
                if (IsMonAllowedInBattleTower(&gPlayerParty[i]) == TRUE)
                    sub_806BC3C(i, 0x70);
                else
                    sub_806BC3C(i, 0x7E);
            }
        }
        ewram1B000_alt.unk264++;
        break;
    case 7:
        if (sub_806B58C(ewram1B000_alt.unk266) == 1)
        {
            ewram1B000_alt.unk266 = 0;
            ewram1B000_alt.unk264 = 0;
            return TRUE;
        }
        else
        {
            ewram1B000_alt.unk266++;
        }
        break;
    }
    return FALSE;
}

static bool8 IsMonAllowedInBattleTower(struct Pokemon *pkmn)
{
    u16 species;
    s32 i = 0;

    if (GetMonData(pkmn, MON_DATA_IS_EGG))
        return FALSE;

    if (ewram1B000.unk263 == 0)
    {
        if (GetMonData(pkmn, MON_DATA_HP) == 0)
            return FALSE;
        else
            return TRUE;
    }

    if ((gSaveBlock2.filler_A8.var_4AC & 1) == 0
     && GetMonData(pkmn, MON_DATA_LEVEL) > 50)
        return FALSE;

    // Check if the pkmn is in the ban list
    species = GetMonData(pkmn, MON_DATA_SPECIES);
    while (gBattleTowerBanlist[i] != 0xFFFF)
    {
        if (gBattleTowerBanlist[i] == species)
            return FALSE;
        i++;
    }
    return TRUE;
}

static u8 sub_81220C8(void)
{
    u8 i;

    if (ewram1B000.unk263 == 0)
        return 0xFF;
    if (gSelectedOrderFromParty[2] == 0)
        return 0x11;
    for (i = 0; i < 2; i++)
    {
        u8 j;

        ewram1B000.unk282 = GetMonData(&gUnknown_030042FC[gSelectedOrderFromParty[i]], MON_DATA_SPECIES);
        ewram1B000.unk280 = GetMonData(&gUnknown_030042FC[gSelectedOrderFromParty[i]], MON_DATA_HELD_ITEM);
        for (j = i + 1; j < 3; j++)
        {
            if (ewram1B000.unk282 == GetMonData(&gUnknown_030042FC[gSelectedOrderFromParty[j]], MON_DATA_SPECIES))
                return 0x12;
            if (ewram1B000.unk280 != 0 && ewram1B000.unk280 == GetMonData(&gUnknown_030042FC[gSelectedOrderFromParty[j]], MON_DATA_HELD_ITEM))
                return 0x13;
        }
    }
    return 0xFF;
}

//------------------------------------------------------------------------------
// Battle Tower Entry Menu
//------------------------------------------------------------------------------

static void BattleTowerEntryMenuCallback_Summary(u8);
static void BattleTowerEntryMenuCallback_Enter(u8);
static void BattleTowerEntryMenuCallback_NoEntry(u8);
static void BattleTowerEntryMenuCallback_Exit(u8);

static const struct PartyMenuItem sBattleTowerEntryMenuItems[] =
{
    {OtherText_Summary, BattleTowerEntryMenuCallback_Summary},
    {OtherText_Enter2, BattleTowerEntryMenuCallback_Enter},
    {OtherText_NoEntry, BattleTowerEntryMenuCallback_NoEntry},
    {gUnknownText_Exit, BattleTowerEntryMenuCallback_Exit},
};

static const u8 gUnknown_084017D0[] = {1, 0, 3};
static const u8 gUnknown_084017D3[] = {2, 0, 3};
static const u8 gUnknown_084017D6[] = {0, 3};

static const struct PartyPopupMenu sBattleTowerEntryMenu[] =
{
    {ARRAY_COUNT(gUnknown_084017D0), 9, gUnknown_084017D0},
    {ARRAY_COUNT(gUnknown_084017D3), 9, gUnknown_084017D3},
    {ARRAY_COUNT(gUnknown_084017D6), 9, gUnknown_084017D6},
};


static bool8 IsPartyMemberAlreadySelected(u8 partyMember)
{
    u8 i;

    for (i = 0; i < 3; i++)
    {
        if (gSelectedOrderFromParty[i] == partyMember)
            return TRUE;
    }
    return FALSE;
}

static void sub_81221F8(u8 taskId)
{
    sub_806D538(5, 1);
    if (IsMonAllowedInBattleTower(&gPlayerParty[gLastFieldPokeMenuOpened]) == TRUE)
    {
        if (IsPartyMemberAlreadySelected(gLastFieldPokeMenuOpened + 1) == TRUE)
        {
            gTasks[taskId].data[4] = 1;
            sub_806E750(1, sBattleTowerEntryMenu, sBattleTowerEntryMenuItems, 0);
        }
        else
        {
            gTasks[taskId].data[4] = 0;
            sub_806E750(0, sBattleTowerEntryMenu, sBattleTowerEntryMenuItems, 0);
        }
    }
    else
    {
        gTasks[taskId].data[4] = 2;
        sub_806E750(2, sBattleTowerEntryMenu, sBattleTowerEntryMenuItems, 0);
    }
}

void sub_81222B0(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        switch (sub_806BE38(taskId))
        {
        case 1:
            PlaySE(SE_SELECT);
            gLastFieldPokeMenuOpened = sub_806CA38(taskId);
            if (gLastFieldPokeMenuOpened != 6)
            {
                GetMonNickname(&gPlayerParty[gLastFieldPokeMenuOpened], gStringVar1);
                sub_81221F8(taskId);
                gTasks[taskId].func = sub_812238C;
            }
            else
            {
                gTasks[taskId].func = sub_81224A8;
            }
            sub_808B5B4(taskId);
            break;
        case 2:
            PlaySE(SE_SELECT);
            ClearPartySelection();
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
            gTasks[taskId].func = sub_8122450;
            break;
        }
    }
}

// Handle input
static void sub_812238C(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        if (gMain.newAndRepeatedKeys & 0x40)
        {
            if (GetMenuCursorPos() != 0)
            {
                PlaySE(SE_SELECT);
                MoveMenuCursor(-1);
            }
            return;
        }
        if (gMain.newAndRepeatedKeys & 0x80)
        {
            if (GetMenuCursorPos() != 3)
            {
                PlaySE(SE_SELECT);
                MoveMenuCursor(1);
            }
            return;
        }
        if (gMain.newKeys & A_BUTTON)
        {
            TaskFunc popupMenuFunc;

            PlaySE(SE_SELECT);
            popupMenuFunc = PartyMenuGetPopupMenuFunc(
              gTasks[taskId].data[4],
              sBattleTowerEntryMenu,
              sBattleTowerEntryMenuItems,
              GetMenuCursorPos());
            popupMenuFunc(taskId);
            return;
        }
        if (gMain.newKeys & B_BUTTON)
        {
            BattleTowerEntryMenuCallback_Exit(taskId);
            return;
        }
    }
}

// Return from menu?
static void sub_8122450(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(gMain.savedCallback);
        DestroyTask(taskId);
    }
}

// Wait for A or B press
static void sub_8122480(u8 taskId)
{
    if ((gMain.newKeys & A_BUTTON) || (gMain.newKeys & B_BUTTON))
        BattleTowerEntryMenuCallback_Exit(taskId);
}

static void sub_81224A8(u8 taskId)
{
    u8 val = sub_81220C8();

    if (val != 0xFF)
    {
        sub_806D538(val, 0);
        gTasks[taskId].func = sub_8122480;
    }
    else
    {
        if (gSelectedOrderFromParty[0] != 0)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
            gTasks[taskId].func = sub_8122450;
        }
        else
        {
            PlaySE(SE_HAZURE);
            sub_806D538(14, 0);
            gTasks[taskId].func = sub_8122480;
        }
    }
}

// CB2 for menu?
static void sub_8122530(void)
{
    while (1)
    {
        if (sub_806B124() == 1)
        {
            sub_806C994(ewram1B000.unk260, gUnknown_020384F0);
            sub_806C658(ewram1B000.unk260, 0);
            GetMonNickname(&gPlayerParty[gUnknown_020384F0], gStringVar1);
            gLastFieldPokeMenuOpened = gUnknown_020384F0;
            sub_81221F8(ewram1B000.unk260);
            SetMainCallback2(sub_806AEDC);
            break;
        }
        if (sub_80F9344() == 1)
            break;
    }
}

static void sub_81225A4(void)
{
    gPaletteFade.bufferTransferDisabled = TRUE;
    sub_806AF4C(4, 0xFF, sub_812238C, 5);
    SetMainCallback2(sub_8122530);
}

// Wait for fade, then show summary screen
static void sub_81225D4(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        u8 r4 = gSprites[gTasks[taskId].data[3] >> 8].data0;

        DestroyTask(taskId);
        ewram1B000.unk262 = 1;
        ShowPokemonSummaryScreen(gPlayerParty, r4, gPlayerPartyCount - 1, sub_81225A4, 0);
    }
}

// Summary callback?
static void BattleTowerEntryMenuCallback_Summary(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
    gTasks[taskId].func = sub_81225D4;
}

static void BattleTowerEntryMenuCallback_Enter(u8 taskId)
{
    u8 i;

    for (i = 0; i < 3; i++)
    {
        if (gSelectedOrderFromParty[i] == 0)
        {
            gSelectedOrderFromParty[i] = gLastFieldPokeMenuOpened + 1;
            sub_806BC3C(gLastFieldPokeMenuOpened, i * 14 + 0x1C);
            if (i == 2)
                sub_806C890(taskId);
            BattleTowerEntryMenuCallback_Exit(taskId);
            return;
        }
    }
    PlaySE(SE_HAZURE);
    MenuZeroFillWindowRect(20, 10, 29, 19);
    HandleDestroyMenuCursors();
    sub_806D5A4();
    sub_806E834(gOtherText_NoMoreThreePoke, 1);
    gTasks[taskId].func = sub_8122728;
}

static void sub_8122728(u8 taskId)
{
    if (gUnknown_0202E8F6 == 1)
        return;

    if ((gMain.newKeys & A_BUTTON) || (gMain.newKeys & B_BUTTON))
    {
        MenuZeroFillWindowRect(0, 14, 29, 19);
        HandleDestroyMenuCursors();
        BattleTowerEntryMenuCallback_Exit(taskId);
    }
}

static void BattleTowerEntryMenuCallback_NoEntry(u8 taskId)
{
    u8 i;

    for (i = 0; i < 3; i++)
    {
        if (gSelectedOrderFromParty[i] == gLastFieldPokeMenuOpened + 1)
        {
            gSelectedOrderFromParty[i] = 0;
            switch (i)
            {
            case 0:
                gSelectedOrderFromParty[0] = gSelectedOrderFromParty[1];
                gSelectedOrderFromParty[1] = gSelectedOrderFromParty[2];
                gSelectedOrderFromParty[2] = 0;
                break;
            case 1:
                gSelectedOrderFromParty[1] = gSelectedOrderFromParty[2];
                gSelectedOrderFromParty[2] = 0;
                break;
            }
            break;  // exit loop
        }
    }
    sub_806BC3C(gLastFieldPokeMenuOpened, 0x70);
    if (gSelectedOrderFromParty[0] != 0)
        sub_806BC3C(gSelectedOrderFromParty[0] - 1, 0x1C);
    if (gSelectedOrderFromParty[1] != 0)
        sub_806BC3C(gSelectedOrderFromParty[1] - 1, 0x2A);
    BattleTowerEntryMenuCallback_Exit(taskId);
}

static void sub_81227FC(u8 taskId)
{
    MenuZeroFillWindowRect(20, 10, 29, 19);
    HandleDestroyMenuCursors();
    sub_806D538(0, 0);
    gTasks[taskId].func = sub_81222B0;
}

static void BattleTowerEntryMenuCallback_Exit(u8 taskId)
{
    PlaySE(SE_SELECT);
    sub_81227FC(taskId);
}

bool8 sub_8122854(void)
{
    switch (ewram1B000_alt.unk264)
    {
    case 0:
        sub_81228E8(ewram1B000_alt.unk260);
        ewram1B000_alt.unk264++;
        break;
    case 1:
        LoadHeldItemIconGraphics();
        ewram1B000_alt.unk264++;
        break;
    case 2:
        sub_8122950(ewram1B000_alt.unk260);
        ewram1B000_alt.unk264++;
        break;
    case 3:
        sub_81229B8();
        ewram1B000_alt.unk264++;
        break;
    case 4:
        sub_806B908();
        return TRUE;
    }
    return FALSE;
}

static void sub_81228E8(u8 a)
{
    u8 i;

    for (i = 0; i < 3; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES) != 0)
            CreatePartyMenuMonIcon(a, i, 3, &gPlayerParty[i]);
        if (gUnknown_02023A00[i].species != 0)
        {
            CreateMonIcon_806D99C(a, i + 3, 3, &gUnknown_02023A00[i]);
            sub_806D50C(a, i + 3);
        }
    }
}

static void sub_8122950(u8 a)
{
    u8 i;

    for (i = 0; i < 3; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES) != 0)
        {
            u16 item = GetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM);

            CreateHeldItemIcon_806DCD4(a, i, item);
        }
        if (gUnknown_02023A00[i].species != 0)
            CreateHeldItemIcon_806DCD4(a, i + 3, gUnknown_02023A00[i].heldItem);
    }
}

static void sub_81229B8(void)
{
    u8 i;

    for (i = 0; i < 3; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES) != 0)
        {
            u8 status;

            PartyMenuPrintHP(i, 3, &gPlayerParty[i]);
            status = GetMonStatusAndPokerus(&gPlayerParty[i]);
            if (status != 0 && status != 6)
                PartyMenuPutStatusTilemap(i, 3, status - 1);
            else
                PartyMenuPrintLevel(i, 3, &gPlayerParty[i]);
            PartyMenuPutNicknameTilemap(i, 3, &gPlayerParty[i]);
            PrintPartyMenuMonNickname(i, 3, &gPlayerParty[i]);
            PartyMenuDrawHPBar(i, 3, &gPlayerParty[i]);
        }
    }
}

void sub_8122A48(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        gTasks[taskId].data[0] = 30;
        sub_806D4AC(taskId, gUnknown_02023A00[0].species, 0);
        sub_806D4AC(taskId, gUnknown_02023A00[1].species, 1);
        sub_806D4AC(taskId, gUnknown_02023A00[2].species, 2);
        gTasks[taskId].func = sub_8122AB8;
        ewram1B000.unk261 = 1;
    }
}

static void sub_8122AB8(u8 taskId)
{
    sub_806D3B4(taskId, gUnknown_02023A00[1].species, gUnknown_02023A00[2].species);
    if (gTasks[taskId].data[0] == 0)
    {
        gTasks[taskId].func = sub_8122B10;
        ewram1B000.unk261 = 2;
        PlaySE(SE_W231);
    }
}

static void sub_8122B10(u8 taskId)
{
    u8 i;

    for (i = 0; i < 3; i++)
    {
        if (gUnknown_02023A00[i].species != 0)
        {
            u8 r2;

            PartyMenuDoPrintHP(i + 3, 3, gUnknown_02023A00[i].hp, gUnknown_02023A00[i].maxhp);
            if (gUnknown_02023A00[i].hp == 0)
                r2 = 7;
            else
                r2 = pokemon_ailments_get_primary(gUnknown_02023A00[i].status);
            if (r2 != 0)
                PartyMenuPutStatusTilemap(i + 3, 3, r2 - 1);
            else
                PartyMenuDoPrintLevel(i + 3, 3, gUnknown_02023A00[i].level);
            PartyMenuDoPutNicknameTilemap(gUnknown_02023A00[i].species, gUnknown_02023A00[i].gender, 3, i + 3, gUnknown_02023A00[i].nickname);
            StringCopy(gStringVar1, gUnknown_02023A00[i].nickname);
            StringGetEnd10(gStringVar1);
            SanitizeNameString(gStringVar1);
            box_print(i + 3, 3, gStringVar1);
            PartyMenuDoDrawHPBar(i + 3, 3, gUnknown_02023A00[i].hp, gUnknown_02023A00[i].maxhp);
        }
    }
    gTasks[taskId].func = sub_8122C18;
    gTasks[taskId].data[0] = 0;
}

static void sub_8122C18(u8 taskId)
{
    gTasks[taskId].data[0]++;
    if (gTasks[taskId].data[0] == 256)
    {
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
        gTasks[taskId].func = sub_8122450;
    }
}

// Exactly the same as sub_8121E78 except for case 6
bool8 unref_sub_8122C60(void)
{
    switch (ewram1B000_alt.unk264)
    {
    case 0:
        if (ewram1B000_alt.unk266 < gPlayerPartyCount)
        {
            TryCreatePartyMenuMonIcon(ewram1B000_alt.unk260, ewram1B000_alt.unk266, &gPlayerParty[ewram1B000_alt.unk266]);
            ewram1B000_alt.unk266++;
        }
        else
        {
            ewram1B000_alt.unk266 = 0;
            ewram1B000_alt.unk264++;
        }
        break;
    case 1:
        LoadHeldItemIconGraphics();
        ewram1B000_alt.unk264++;
        break;
    case 2:
        CreateHeldItemIcons_806DC34(ewram1B000_alt.unk260);
        ewram1B000_alt.unk264++;
        break;
    case 3:
        if (sub_806BD58(ewram1B000_alt.unk260, ewram1B000_alt.unk266) == 1)
        {
            ewram1B000_alt.unk266 = 0;
            ewram1B000_alt.unk264++;
        }
        else
        {
            ewram1B000_alt.unk266++;
        }
        break;
    case 4:
        PartyMenuPrintMonsLevelOrStatus();
        ewram1B000_alt.unk264++;
        break;
    case 5:
        PrintPartyMenuMonNicknames();
        ewram1B000_alt.unk264++;
        break;
    case 6:
        sub_806BCE8();
        ewram1B000_alt.unk264++;
        break;
    case 7:
        if (sub_806B58C(ewram1B000_alt.unk266) == 1)
        {
            ewram1B000_alt.unk266 = 0;
            ewram1B000_alt.unk264 = 0;
            return TRUE;
        }
        else
        {
            ewram1B000_alt.unk266++;
        }
        break;
    }
    return FALSE;
}

//------------------------------------------------------------------------------
// Daycare Pokemon Storage Menu
//------------------------------------------------------------------------------

static void DaycareStorageMenuCallback_Store(u8);
static void DaycareStorageMenuCallback_Summary(u8);
static void DaycareStorageMenuCallback_Exit(u8);

static const struct PartyMenuItem sDaycareStorageMenuItems[] =
{
    {OtherText_Store, DaycareStorageMenuCallback_Store},
    {OtherText_Summary, DaycareStorageMenuCallback_Summary},
    {gUnknownText_Exit, DaycareStorageMenuCallback_Exit},
};

static const u8 gUnknown_08401808[] = {0, 1, 2};
static const u8 gUnknown_0840180B[] = {1, 2};

static const struct PartyPopupMenu sDaycareStorageMenus[] =
{
    {ARRAY_COUNT(gUnknown_08401808), 9, gUnknown_08401808},
    {ARRAY_COUNT(gUnknown_0840180B), 9, gUnknown_0840180B},
};

static void sub_8122D94(u8 taskId)
{
    if (!GetMonData(&gPlayerParty[gLastFieldPokeMenuOpened], MON_DATA_IS_EGG))
    {
        gTasks[taskId].data[4] = 0;
        sub_806E750(0, sDaycareStorageMenus, sDaycareStorageMenuItems, 0);
    }
    else
    {
        gTasks[taskId].data[4] = 1;
        sub_806E750(1, sDaycareStorageMenus, sDaycareStorageMenuItems, 0);
    }
}

void sub_8122E0C(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        switch (sub_806BD80(taskId))
        {
        case 1:
            PlaySE(SE_SELECT);
            gLastFieldPokeMenuOpened = sub_806CA38(taskId);
            GetMonNickname(&gPlayerParty[gLastFieldPokeMenuOpened], gStringVar1);
            sub_8122D94(taskId);
            gTasks[taskId].func = Task_DaycareStorageMenu8122EAC;
            break;
        case 2:
            PlaySE(SE_SELECT);
            gLastFieldPokeMenuOpened = 0xFF;
            gSpecialVar_0x8004 = 0xFF;
            sub_8123138(taskId);
            break;
        }
    }
}

static void Task_DaycareStorageMenu8122EAC(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        if (gMain.newAndRepeatedKeys & 0x40)
        {
            if (GetMenuCursorPos() != 0)
            {
                PlaySE(SE_SELECT);
                MoveMenuCursor(-1);
            }
            return;
        }
        if (gMain.newAndRepeatedKeys & 0x80)
        {
            if (GetMenuCursorPos() != 3)
            {
                PlaySE(SE_SELECT);
                MoveMenuCursor(1);
            }
            return;
        }
        if (gMain.newKeys & A_BUTTON)
        {
            TaskFunc popupMenuFunc;

            PlaySE(SE_SELECT);
            popupMenuFunc = PartyMenuGetPopupMenuFunc(
              gTasks[taskId].data[4],
              sDaycareStorageMenus,
              sDaycareStorageMenuItems,
              GetMenuCursorPos());
            popupMenuFunc(taskId);
            return;
        }
        if (gMain.newKeys & B_BUTTON)
        {
            DaycareStorageMenuCallback_Exit(taskId);
            return;
        }
    }
}

static void DaycareStorageMenuCallback_Store(u8 taskId)
{
    gSpecialVar_0x8004 = gLastFieldPokeMenuOpened;
    sub_8123138(taskId);
}

static void sub_8122F90(void)
{
    while (1)
    {
        if (sub_806B124() == 1)
        {
            sub_806C994(ewram1B000.unk260, gUnknown_020384F0);
            sub_806BF74(ewram1B000.unk260, 0);
            GetMonNickname(&gPlayerParty[gUnknown_020384F0], gStringVar1);
            gLastFieldPokeMenuOpened = gUnknown_020384F0;
            sub_8122D94(ewram1B000.unk260);
            SetMainCallback2(sub_806AEDC);
            break;
        }
        if (sub_80F9344() == 1)
            break;
    }
}

static void sub_8123004(void)
{
    gPaletteFade.bufferTransferDisabled = TRUE;
    sub_806AF4C(6, 0xFF, Task_DaycareStorageMenu8122EAC, 5);
    SetMainCallback2(sub_8122F90);
}

static void sub_8123034(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        u8 r4 = gSprites[gTasks[taskId].data[3] >> 8].data0;

        DestroyTask(taskId);
        ewram1B000.unk262 = 1;
        ShowPokemonSummaryScreen(gPlayerParty, r4, gPlayerPartyCount - 1, sub_8123004, 0);
    }
}

static void DaycareStorageMenuCallback_Summary(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
    gTasks[taskId].func = sub_8123034;
}

static void DaycareStorageMenuCallback_Exit(u8 taskId)
{
    PlaySE(SE_SELECT);
    MenuZeroFillWindowRect(20, 10, 29, 19);
    HandleDestroyMenuCursors();
    sub_806D538(15, 0);
    gTasks[taskId].func = sub_8122E0C;
}

void sub_8123138(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
    gTasks[taskId].func = sub_8123170;
}

static void sub_8123170(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        gFieldCallback = sub_81231AC;
        SetMainCallback2(c2_exit_to_overworld_2_switch);
        DestroyTask(taskId);
    }
}

// Do these last two functions really belong in here?

static void sub_81231C4(u8);

void sub_81231AC(void)
{
    pal_fill_black();
    CreateTask(sub_81231C4, 10);
}

static void sub_81231C4(u8 taskId)
{
    if (sub_807D770() == TRUE)
    {
        DestroyTask(taskId);
        ScriptContext2_Disable();
        EnableBothScriptContexts();
    }
}
