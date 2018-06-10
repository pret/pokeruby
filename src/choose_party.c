#include "global.h"
#include "event_data.h"
#include "field_fadetransition.h"
#include "main.h"
#include "menu.h"
#include "name_string_util.h"
#include "palette.h"
#include "party_menu.h"
#include "pokemon_menu.h"
#include "field_weather.h"
#include "pokemon.h"
#include "pokemon_summary_screen.h"
#include "overworld.h"
#include "script.h"
#include "constants/songs.h"
#include "sound.h"
#include "strings.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "ewram.h"

extern u8 gPlayerPartyCount;
extern u8 gLastFieldPokeMenuOpened;
extern u8 gUnknown_020384F0;
extern struct UnknownPokemonStruct2 gMultiPartnerParty[3];
extern u8 gUnknown_0202E8F6;
extern const u16 gBattleTowerBannedSpecies[];

EWRAM_DATA u8 gSelectedOrderFromParty[3] = {0};

extern u8 sub_806BD58(u8, u8);
extern void PartyMenuPrintMonsLevelOrStatus(void);
extern void DrawMonDescriptorStatus(u8, u8);
extern u8 GetMonStatusAndPokerus();
extern void PartyMenuPrintHP();
extern bool8 sub_80F9344(void); 

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
    OpenPartyMenu(PARTY_MENU_TYPE_BATTLE_TOWER, 0);
}

void sub_8121E34(void)
{
    ClearPartySelection();
    ewram1B000.unk263 = 1;
    OpenPartyMenu(PARTY_MENU_TYPE_BATTLE_TOWER, 0);
}

static void ClearPartySelection(void)
{
    u8 i;

    for (i = 0; i < 3; i++)
        gSelectedOrderFromParty[i] = 0;
}

bool8 SetupBattleTowerPartyMenu(void)
{
    u8 i;

    switch (ewram1B000_alt.setupState)
    {
    case 0:
        if (ewram1B000_alt.monIndex < gPlayerPartyCount)
        {
            TryCreatePartyMenuMonIcon(ewram1B000_alt.menuHandlerTaskId, ewram1B000_alt.monIndex, &gPlayerParty[ewram1B000_alt.monIndex]);
            ewram1B000_alt.monIndex++;
        }
        else
        {
            ewram1B000_alt.monIndex = 0;
            ewram1B000_alt.setupState++;
        }
        break;
    case 1:
        LoadHeldItemIconGraphics();
        ewram1B000_alt.setupState++;
        break;
    case 2:
        CreateHeldItemIcons_806DC34(ewram1B000_alt.menuHandlerTaskId);
        ewram1B000_alt.setupState++;
        break;
    case 3:
        if (sub_806BD58(ewram1B000_alt.menuHandlerTaskId, ewram1B000_alt.monIndex) == 1)
        {
            ewram1B000_alt.monIndex = 0;
            ewram1B000_alt.setupState++;
        }
        else
        {
            ewram1B000_alt.monIndex++;
        }
        break;
    case 4:
        PartyMenuPrintMonsLevelOrStatus();
        ewram1B000_alt.setupState++;
        break;
    case 5:
        PrintPartyMenuMonNicknames();
        ewram1B000_alt.setupState++;
        break;
    case 6:
        for (i = 0; i < gPlayerPartyCount; i++)
        {
            u8 j;

            for (j = 0; j < 3; j++)
            {
                if (gSelectedOrderFromParty[j] == i + 1)
                {
                    DrawMonDescriptorStatus(i, j * 14 + 0x1C);
                    break;
                }
            }
            if (j == 3)
            {
                if (IsMonAllowedInBattleTower(&gPlayerParty[i]) == TRUE)
                    DrawMonDescriptorStatus(i, 0x70);
                else
                    DrawMonDescriptorStatus(i, 0x7E);
            }
        }
        ewram1B000_alt.setupState++;
        break;
    case 7:
        if (DrawPartyMonBackground(ewram1B000_alt.monIndex) == 1)
        {
            ewram1B000_alt.monIndex = 0;
            ewram1B000_alt.setupState = 0;
            return TRUE;
        }
        else
        {
            ewram1B000_alt.monIndex++;
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

    if ((gSaveBlock2.battleTower.battleTowerLevelType) == 0
     && GetMonData(pkmn, MON_DATA_LEVEL) > 50)
        return FALSE;

    // Check if the pkmn is in the ban list
    species = GetMonData(pkmn, MON_DATA_SPECIES);
    while (gBattleTowerBannedSpecies[i] != 0xFFFF)
    {
        if (gBattleTowerBannedSpecies[i] == species)
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

        ewram1B000.unk282 = GetMonData(&gPlayerParty[gSelectedOrderFromParty[i] - 1], MON_DATA_SPECIES);
        ewram1B000.unk280 = GetMonData(&gPlayerParty[gSelectedOrderFromParty[i] - 1], MON_DATA_HELD_ITEM);
        for (j = i + 1; j < 3; j++)
        {
            if (ewram1B000.unk282 == GetMonData(&gPlayerParty[gSelectedOrderFromParty[j] - 1], MON_DATA_SPECIES))
                return 0x12;
            if (ewram1B000.unk280 != 0 && ewram1B000.unk280 == GetMonData(&gPlayerParty[gSelectedOrderFromParty[j] - 1], MON_DATA_HELD_ITEM))
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

static const struct MenuAction2 sBattleTowerEntryMenuItems[] =
{
    {OtherText_Summary, BattleTowerEntryMenuCallback_Summary},
    {OtherText_Enter2, BattleTowerEntryMenuCallback_Enter},
    {OtherText_NoEntry, BattleTowerEntryMenuCallback_NoEntry},
    {gOtherText_Exit, BattleTowerEntryMenuCallback_Exit},
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
    PrintPartyMenuPromptText(5, 1);
    if (IsMonAllowedInBattleTower(&gPlayerParty[gLastFieldPokeMenuOpened]) == TRUE)
    {
        if (IsPartyMemberAlreadySelected(gLastFieldPokeMenuOpened + 1) == TRUE)
        {
            gTasks[taskId].data[4] = 1;
            ShowPartyPopupMenu(1, sBattleTowerEntryMenu, sBattleTowerEntryMenuItems, 0);
        }
        else
        {
            gTasks[taskId].data[4] = 0;
            ShowPartyPopupMenu(0, sBattleTowerEntryMenu, sBattleTowerEntryMenuItems, 0);
        }
    }
    else
    {
        gTasks[taskId].data[4] = 2;
        ShowPartyPopupMenu(2, sBattleTowerEntryMenu, sBattleTowerEntryMenuItems, 0);
    }
}

void HandleBattleTowerPartyMenu(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        switch (HandleBattleTowerPartyMenuInput(taskId))
        {
        case A_BUTTON:
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
        case B_BUTTON:
            PlaySE(SE_SELECT);
            ClearPartySelection();
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
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
            if (Menu_GetCursorPos() != 0)
            {
                PlaySE(SE_SELECT);
                Menu_MoveCursor(-1);
            }
            return;
        }
        if (gMain.newAndRepeatedKeys & 0x80)
        {
            if (Menu_GetCursorPos() != 3)
            {
                PlaySE(SE_SELECT);
                Menu_MoveCursor(1);
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
              Menu_GetCursorPos());
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
        PrintPartyMenuPromptText(val, 0);
        gTasks[taskId].func = sub_8122480;
    }
    else
    {
        if (gSelectedOrderFromParty[0] != 0)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
            gTasks[taskId].func = sub_8122450;
        }
        else
        {
            PlaySE(SE_HAZURE);
            PrintPartyMenuPromptText(14, 0);
            gTasks[taskId].func = sub_8122480;
        }
    }
}

// CB2 for menu?
static void sub_8122530(void)
{
    while (1)
    {
        if (InitPartyMenu() == TRUE)
        {
            sub_806C994(ewram1B000.menuHandlerTaskId, gUnknown_020384F0);
            ChangeBattleTowerPartyMenuSelection(ewram1B000.menuHandlerTaskId, 0);
            GetMonNickname(&gPlayerParty[gUnknown_020384F0], gStringVar1);
            gLastFieldPokeMenuOpened = gUnknown_020384F0;
            sub_81221F8(ewram1B000.menuHandlerTaskId);
            SetMainCallback2(CB2_PartyMenuMain);
            break;
        }
        if (sub_80F9344() == 1)
            break;
    }
}

static void sub_81225A4(void)
{
    gPaletteFade.bufferTransferDisabled = TRUE;
    SetPartyMenuSettings(PARTY_MENU_TYPE_BATTLE_TOWER, 0xFF, sub_812238C, 5);
    SetMainCallback2(sub_8122530);
}

// Wait for fade, then show summary screen
static void sub_81225D4(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        u8 r4 = gSprites[gTasks[taskId].data[3] >> 8].data[0];

        DestroyTask(taskId);
        ewram1B000.unk262 = 1;
        ShowPokemonSummaryScreen(gPlayerParty, r4, gPlayerPartyCount - 1, sub_81225A4, PSS_MODE_NORMAL);
    }
}

// Summary callback?
static void BattleTowerEntryMenuCallback_Summary(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
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
            DrawMonDescriptorStatus(gLastFieldPokeMenuOpened, i * 14 + 0x1C);
            if (i == 2)
                SelectBattleTowerOKButton(taskId);
            BattleTowerEntryMenuCallback_Exit(taskId);
            return;
        }
    }
    PlaySE(SE_HAZURE);
    Menu_EraseWindowRect(20, 10, 29, 19);
    Menu_DestroyCursor();
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
        Menu_EraseWindowRect(0, 14, 29, 19);
        Menu_DestroyCursor();
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
    DrawMonDescriptorStatus(gLastFieldPokeMenuOpened, 0x70);
    if (gSelectedOrderFromParty[0] != 0)
        DrawMonDescriptorStatus(gSelectedOrderFromParty[0] - 1, 0x1C);
    if (gSelectedOrderFromParty[1] != 0)
        DrawMonDescriptorStatus(gSelectedOrderFromParty[1] - 1, 0x2A);
    BattleTowerEntryMenuCallback_Exit(taskId);
}

static void sub_81227FC(u8 taskId)
{
    Menu_EraseWindowRect(20, 10, 29, 19);
    Menu_DestroyCursor();
    PrintPartyMenuPromptText(0, 0);
    gTasks[taskId].func = HandleBattleTowerPartyMenu;
}

static void BattleTowerEntryMenuCallback_Exit(u8 taskId)
{
    PlaySE(SE_SELECT);
    sub_81227FC(taskId);
}

#if DEBUG

void Debug_CopyLastThreePartyMonsToMultiPartnerParty(void)
{
    u8 i;
    
    memset(gMultiPartnerParty, 0, sizeof(gMultiPartnerParty));
    for (i = 0; i < 3; i++)
    {
        gMultiPartnerParty[i].species = GetMonData(&gPlayerParty[3 + i], MON_DATA_SPECIES2);
        if (gMultiPartnerParty[i].species != 0)
        {
            gMultiPartnerParty[i].level = GetMonData(&gPlayerParty[3 + i], MON_DATA_LEVEL);
            gMultiPartnerParty[i].hp = GetMonData(&gPlayerParty[3 + i], MON_DATA_HP);
            gMultiPartnerParty[i].maxhp = GetMonData(&gPlayerParty[3 + i], MON_DATA_MAX_HP);
            gMultiPartnerParty[i].status = GetMonData(&gPlayerParty[3 + i], MON_DATA_STATUS);
            gMultiPartnerParty[i].heldItem = GetMonData(&gPlayerParty[3 + i], MON_DATA_HELD_ITEM);
            gMultiPartnerParty[i].personality = GetMonData(&gPlayerParty[3 + i], MON_DATA_PERSONALITY);
            gMultiPartnerParty[i].gender = GetMonGender(&gPlayerParty[3 + i]);
            GetMonData(&gPlayerParty[3 + i], MON_DATA_NICKNAME, gMultiPartnerParty[i].nickname);
            Text_StripExtCtrlCodes(gMultiPartnerParty[i].nickname);
            gMultiPartnerParty[i].language = GetMonData(&gPlayerParty[3 + i], MON_DATA_LANGUAGE);
        }
    }
}

#endif

bool8 SetupLinkMultiBattlePartyMenu(void)
{
    switch (ewram1B000_alt.setupState)
    {
    case 0:
        sub_81228E8(ewram1B000_alt.menuHandlerTaskId);
        ewram1B000_alt.setupState++;
        break;
    case 1:
        LoadHeldItemIconGraphics();
        ewram1B000_alt.setupState++;
        break;
    case 2:
        sub_8122950(ewram1B000_alt.menuHandlerTaskId);
        ewram1B000_alt.setupState++;
        break;
    case 3:
        sub_81229B8();
        ewram1B000_alt.setupState++;
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
        if (gMultiPartnerParty[i].species != 0)
        {
            CreateMonIcon_LinkMultiBattle(a, i + 3, 3, &gMultiPartnerParty[i]);
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
        if (gMultiPartnerParty[i].species != 0)
            CreateHeldItemIcon_806DCD4(a, i + 3, gMultiPartnerParty[i].heldItem);
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
            if (status && status != STATUS_PRIMARY_POKERUS)
                PartyMenuPutStatusTilemap(i, 3, status - 1);
            else
                PartyMenuPrintLevel(i, 3, &gPlayerParty[i]);
            PartyMenuPrintGenderIcon(i, 3, &gPlayerParty[i]);
            PrintPartyMenuMonNickname(i, 3, &gPlayerParty[i]);
            PartyMenuDrawHPBar(i, 3, &gPlayerParty[i]);
        }
    }
}

void HandleLinkMultiBattlePartyMenu(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        gTasks[taskId].data[0] = 30;
        sub_806D4AC(taskId, gMultiPartnerParty[0].species, 0);
        sub_806D4AC(taskId, gMultiPartnerParty[1].species, 1);
        sub_806D4AC(taskId, gMultiPartnerParty[2].species, 2);
        gTasks[taskId].func = sub_8122AB8;
        ewram1B000.unk261 = 1;
    }
}

static void sub_8122AB8(u8 taskId)
{
    sub_806D3B4(taskId, gMultiPartnerParty[1].species, gMultiPartnerParty[2].species);
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
        if (gMultiPartnerParty[i].species != 0)
        {
            u8 primaryStatus;

            PartyMenuDoPrintHP(i + 3, 3, gMultiPartnerParty[i].hp, gMultiPartnerParty[i].maxhp);
            if (gMultiPartnerParty[i].hp == 0)
                primaryStatus = STATUS_PRIMARY_FAINTED;
            else
                primaryStatus = GetPrimaryStatus(gMultiPartnerParty[i].status);

            if (primaryStatus != STATUS_PRIMARY_NONE)
                PartyMenuPutStatusTilemap(i + 3, 3, primaryStatus - 1);
            else
                PartyMenuDoPrintLevel(i + 3, 3, gMultiPartnerParty[i].level);
            PartyMenuDoPrintGenderIcon(gMultiPartnerParty[i].species, gMultiPartnerParty[i].gender, 3, i + 3, gMultiPartnerParty[i].nickname);
            StringCopy(gStringVar1, gMultiPartnerParty[i].nickname);
            StringGetEnd10(gStringVar1);
            SanitizeNameString(gStringVar1);
            PartyMenuDoPrintMonNickname(i + 3, 3, gStringVar1);
            PartyMenuDoDrawHPBar(i + 3, 3, gMultiPartnerParty[i].hp, gMultiPartnerParty[i].maxhp);
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
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        gTasks[taskId].func = sub_8122450;
    }
}

// Exactly the same as SetupBattleTowerPartyMenu except for case 6
bool8 unref_sub_8122C60(void)
{
    switch (ewram1B000_alt.setupState)
    {
    case 0:
        if (ewram1B000_alt.monIndex < gPlayerPartyCount)
        {
            TryCreatePartyMenuMonIcon(ewram1B000_alt.menuHandlerTaskId, ewram1B000_alt.monIndex, &gPlayerParty[ewram1B000_alt.monIndex]);
            ewram1B000_alt.monIndex++;
        }
        else
        {
            ewram1B000_alt.monIndex = 0;
            ewram1B000_alt.setupState++;
        }
        break;
    case 1:
        LoadHeldItemIconGraphics();
        ewram1B000_alt.setupState++;
        break;
    case 2:
        CreateHeldItemIcons_806DC34(ewram1B000_alt.menuHandlerTaskId);
        ewram1B000_alt.setupState++;
        break;
    case 3:
        if (sub_806BD58(ewram1B000_alt.menuHandlerTaskId, ewram1B000_alt.monIndex) == 1)
        {
            ewram1B000_alt.monIndex = 0;
            ewram1B000_alt.setupState++;
        }
        else
        {
            ewram1B000_alt.monIndex++;
        }
        break;
    case 4:
        PartyMenuPrintMonsLevelOrStatus();
        ewram1B000_alt.setupState++;
        break;
    case 5:
        PrintPartyMenuMonNicknames();
        ewram1B000_alt.setupState++;
        break;
    case 6:
        sub_806BCE8();
        ewram1B000_alt.setupState++;
        break;
    case 7:
        if (DrawPartyMonBackground(ewram1B000_alt.monIndex) == 1)
        {
            ewram1B000_alt.monIndex = 0;
            ewram1B000_alt.setupState = 0;
            return TRUE;
        }
        else
        {
            ewram1B000_alt.monIndex++;
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

static const struct MenuAction2 sDaycareStorageMenuItems[] =
{
    {OtherText_Store, DaycareStorageMenuCallback_Store},
    {OtherText_Summary, DaycareStorageMenuCallback_Summary},
    {gOtherText_Exit, DaycareStorageMenuCallback_Exit},
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
        ShowPartyPopupMenu(0, sDaycareStorageMenus, sDaycareStorageMenuItems, 0);
    }
    else
    {
        gTasks[taskId].data[4] = 1;
        ShowPartyPopupMenu(1, sDaycareStorageMenus, sDaycareStorageMenuItems, 0);
    }
}

void HandleDaycarePartyMenu(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        switch (HandleDefaultPartyMenuInput(taskId))
        {
        case A_BUTTON:
            PlaySE(SE_SELECT);
            gLastFieldPokeMenuOpened = sub_806CA38(taskId);
            GetMonNickname(&gPlayerParty[gLastFieldPokeMenuOpened], gStringVar1);
            sub_8122D94(taskId);
            gTasks[taskId].func = Task_DaycareStorageMenu8122EAC;
            break;
        case B_BUTTON:
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
            if (Menu_GetCursorPos() != 0)
            {
                PlaySE(SE_SELECT);
                Menu_MoveCursor(-1);
            }
            return;
        }
        if (gMain.newAndRepeatedKeys & 0x80)
        {
            if (Menu_GetCursorPos() != 3)
            {
                PlaySE(SE_SELECT);
                Menu_MoveCursor(1);
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
              Menu_GetCursorPos());
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
        if (InitPartyMenu() == TRUE)
        {
            sub_806C994(ewram1B000.menuHandlerTaskId, gUnknown_020384F0);
            ChangePartyMenuSelection(ewram1B000.menuHandlerTaskId, 0);
            GetMonNickname(&gPlayerParty[gUnknown_020384F0], gStringVar1);
            gLastFieldPokeMenuOpened = gUnknown_020384F0;
            sub_8122D94(ewram1B000.menuHandlerTaskId);
            SetMainCallback2(CB2_PartyMenuMain);
            break;
        }
        if (sub_80F9344() == 1)
            break;
    }
}

static void sub_8123004(void)
{
    gPaletteFade.bufferTransferDisabled = TRUE;
    SetPartyMenuSettings(PARTY_MENU_TYPE_DAYCARE, 0xFF, Task_DaycareStorageMenu8122EAC, 5);
    SetMainCallback2(sub_8122F90);
}

static void sub_8123034(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        u8 r4 = gSprites[gTasks[taskId].data[3] >> 8].data[0];

        DestroyTask(taskId);
        ewram1B000.unk262 = 1;
        ShowPokemonSummaryScreen(gPlayerParty, r4, gPlayerPartyCount - 1, sub_8123004, PSS_MODE_NORMAL);
    }
}

static void DaycareStorageMenuCallback_Summary(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
    gTasks[taskId].func = sub_8123034;
}

static void DaycareStorageMenuCallback_Exit(u8 taskId)
{
    PlaySE(SE_SELECT);
    Menu_EraseWindowRect(20, 10, 29, 19);
    Menu_DestroyCursor();
    PrintPartyMenuPromptText(15, 0);
    gTasks[taskId].func = HandleDaycarePartyMenu;
}

void sub_8123138(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
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
    if (IsWeatherNotFadingIn() == TRUE)
    {
        DestroyTask(taskId);
        ScriptContext2_Disable();
        EnableBothScriptContexts();
    }
}
