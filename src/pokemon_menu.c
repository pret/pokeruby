#include "global.h"
#include "pokemon.h"
#include "pokemon_menu.h"
#include "party_menu.h"
#include "palette.h"
#include "menu.h"
#include "mail_data.h"
#include "songs.h"
#include "sound.h"
#include "main.h"
#include "rom4.h"
#include "menu_helpers.h"
#include "pokemon_summary_screen.h"
#include "moves.h"
#include "data2.h"
#include "strings.h"
#include "item_use.h"
#include "item.h"
#include "event_data.h"
#include "mail.h"
#include "field_player_avatar.h"
#include "fldeff_softboiled.h"
#include "braille_puzzles.h"
#include "field_fadetransition.h"
#include "field_weather.h"
#include "field_effect.h"
#include "field_control_avatar.h"
#include "metatile_behavior.h"
#include "fieldmap.h"
#include "item_menu.h"
#include "player_pc.h"

/*
Pokemon menu:
    The menu that appears when you
    click on a pokemon in
    overworld 'pokemon' menu
*/

struct PokeMenuFieldMoveFunc
{
    bool8 (*func)(void);
    u8 field_1;
};

extern u8 gUnknown_020384F0;
extern u8 gUnknown_0202E8F4;
extern u8 gUnknown_0202E8F5;
extern u8 gUnknown_0202E8F6;
extern u8 gUnknown_02038561;
extern u16 gUnknown_0202E8F8;
extern u8 ewram[];
extern void (*gUnknown_03004AE4)(u8 taskID, u16 itemID, TaskFunc func);
extern TaskFunc gUnknown_03005CF0;

void sub_80E62A0(u8 arg0, struct MailStruct* arg1, void* arg2, u8 arg3);
void sub_808A520(void);
void sub_80A61D0(void);
void CB2_InitFlyRegionMap(void);
u16 GetEvolutionTargetSpecies(struct Pokemon *mon, u8 type, u16 evolutionItem);
bool8 SetUpFieldMove_Cut(void);
bool8 SetUpFieldMove_Flash(void);
bool8 SetUpFieldMove_RockSmash(void);
bool8 SetUpFieldMove_Strength(void);
bool8 SetUpFieldMove_Teleport(void);
bool8 SetUpFieldMove_Dig(void);
bool8 SetUpFieldMove_SecretPower(void);
bool8 SetUpFieldMove_SoftBoiled(void);
bool8 SetUpFieldMove_SoftBoiled(void);
bool8 SetUpFieldMove_SweetScent(void);

#define sFieldMovesTerminator 0xFF // note: should be changed to 0xFFFF, because currently it makes it impossible to add a field move with 0xFF index

// this file's functions
static void sub_808A8A8(void);
static void sub_808B3EC(void);
static void sub_8089D94(u8 taskID);
static void sub_8089E4C(u8 taskID);
static void sub_808A5BC(u8 taskID);
static void sub_808A8D4(u8 taskID);
static void sub_808A73C(u8 taskID);
static void sub_808A848(u8 taskID);
static void sub_808AAF0(u8 taskID);
static void sub_808ABF4(u8 taskID);
static void sub_808AB34(u8 taskID);
static void sub_808ABA8(u8 taskID);
static void sub_808B224(u8 taskID);
static void sub_808B2EC(u8 taskID);
static void sub_808B2B4(u8 taskID);
static void sub_808B25C(u8 taskID);
static void sub_808B1EC(u8 taskID);
static void sub_808B338(u8 taskID);
static void sub_808B4A4(u8 taskID);
static void sub_808B4EC(u8 taskID);
static void sub_808B5E4(u8 taskID);
static void PokemonMenu_Summary(u8 taskID);
static void PokemonMenu_Switch(u8 taskID);
static void PokemonMenu_Item(u8 taskID);
static void PokemonMenu_Cancel(u8 taskID);
static void PokemonMenu_GiveItem(u8 taskID);
static void PokemonMenu_TakeItem(u8 taskID);
static void PokemonMenu_TakeMail(u8 taskID);
static void PokemonMenu_Mail(u8 taskID);
static void PokemonMenu_ReadMail(u8 taskID);
static void PokemonMenu_CancelSubmenu(u8 taskID);
static void PokemonMenu_FieldMove(u8 taskID);
static bool8 SetUpFieldMove_Waterfall(void);
static bool8 SetUpFieldMove_Surf(void);
static bool8 SetUpFieldMove_Fly(void);
static bool8 SetUpFieldMove_Dive(void);

// ewram data

EWRAM_DATA static u8 sPokeMenuCursorPos = 0;
EWRAM_DATA static u8 sPokeMenuOptionsNo = 0;
EWRAM_DATA static u8 sPokeMenuOptionsOrder[8] = {0}; // 4 possible field moves and 4 default options

// iwram common
u8 gLastFieldPokeMenuOpened;
void (*gUnknown_03005CE4)(void);

// const data

static const struct MenuAction sPokemonMenuActions[] =
{
    {OtherText_Summary, (void*) PokemonMenu_Summary},
    {OtherText_Switch2, (void*) PokemonMenu_Switch},
    {OtherText_Item, (void*) PokemonMenu_Item},
    {gOtherText_CancelNoTerminator, (void*) PokemonMenu_Cancel},
    {OtherText_Give2, (void*) PokemonMenu_GiveItem},
    {OtherText_Take2, (void*) PokemonMenu_TakeItem},
    {OtherText_Take, (void*) PokemonMenu_TakeMail},
    {OtherText_Mail, (void*) PokemonMenu_Mail},
    {OtherText_Read2, (void*) PokemonMenu_ReadMail},
    {gOtherText_CancelNoTerminator, (void*) PokemonMenu_CancelSubmenu},
    {gMoveNames[MOVE_CUT], (void*) PokemonMenu_FieldMove},
    {gMoveNames[MOVE_FLASH], (void*) PokemonMenu_FieldMove},
    {gMoveNames[MOVE_ROCK_SMASH], (void*) PokemonMenu_FieldMove},
    {gMoveNames[MOVE_STRENGTH], (void*) PokemonMenu_FieldMove},
    {gMoveNames[MOVE_SURF], (void*) PokemonMenu_FieldMove},
    {gMoveNames[MOVE_FLY], (void*) PokemonMenu_FieldMove},
    {gMoveNames[MOVE_DIVE], (void*) PokemonMenu_FieldMove},
    {gMoveNames[MOVE_WATERFALL], (void*) PokemonMenu_FieldMove},
    {gMoveNames[MOVE_TELEPORT], (void*) PokemonMenu_FieldMove},
    {gMoveNames[MOVE_DIG], (void*) PokemonMenu_FieldMove},
    {gMoveNames[MOVE_SECRET_POWER], (void*) PokemonMenu_FieldMove},
    {gMoveNames[MOVE_MILK_DRINK], (void*) PokemonMenu_FieldMove},
    {gMoveNames[MOVE_SOFT_BOILED], (void*) PokemonMenu_FieldMove},
    {gMoveNames[MOVE_SWEET_SCENT], (void*) PokemonMenu_FieldMove},
};

static const u16 sPokeMenuFieldMoves[] =
{
    MOVE_CUT, MOVE_FLASH, MOVE_ROCK_SMASH, MOVE_STRENGTH,
    MOVE_SURF, MOVE_FLY, MOVE_DIVE, MOVE_WATERFALL,
    MOVE_TELEPORT, MOVE_DIG, MOVE_SECRET_POWER, MOVE_MILK_DRINK,
    MOVE_SOFT_BOILED, MOVE_SWEET_SCENT, sFieldMovesTerminator,
};

static const u8 sUnknown_39F572[] = {4, 5, 9, 0};
static const struct PartyPopupMenu sUnknown_0839F578 = {3, 6, sUnknown_39F572};

static const u8 sUnknown_39F580[] = {8, 6, 9, 0};
static const struct PartyPopupMenu sUnknown_0839F584 = {3, 9, sUnknown_39F580};

static const struct PokeMenuFieldMoveFunc sFieldMoveFuncs[] =
{
    {SetUpFieldMove_Cut,            0x6},
    {SetUpFieldMove_Flash,          0x9},
    {SetUpFieldMove_RockSmash,      0x9},
    {SetUpFieldMove_Strength,       0x9},
    {SetUpFieldMove_Surf,           0x7},
    {SetUpFieldMove_Fly,            0x9},
    {SetUpFieldMove_Dive,           0x9},
    {SetUpFieldMove_Waterfall,      0x9},
    {SetUpFieldMove_Teleport,       0x9},
    {SetUpFieldMove_Dig,            0x9},
    {SetUpFieldMove_SecretPower,    0x9},
    {SetUpFieldMove_SoftBoiled,     0x10},
    {SetUpFieldMove_SoftBoiled,     0x10},
    {SetUpFieldMove_SweetScent,     0x9},
};

void sub_8089A70(void)
{
    gPaletteFade.bufferTransferDisabled = 1;
    OpenPartyMenu(0, 0);
}

static void sub_8089A8C(void)
{
    sPokeMenuOptionsNo = 0;
    // if checking pokemon is an egg, we can't give it an item and it doesn't know any move
    if (GetMonData(&gPlayerParty[gLastFieldPokeMenuOpened], MON_DATA_IS_EGG))
    {
        AppendToList(sPokeMenuOptionsOrder, &sPokeMenuOptionsNo, POKEMENU_SUMMARY);
        AppendToList(sPokeMenuOptionsOrder, &sPokeMenuOptionsNo, POKEMENU_SWITCH);
        AppendToList(sPokeMenuOptionsOrder, &sPokeMenuOptionsNo, POKEMENU_CANCEL);
    }
    else
    {
        u16 moveID, tableID;
        for (moveID = 0; moveID < 4; moveID++) // 4, max number of possible field moves
        {
            for (tableID = 0; sPokeMenuFieldMoves[tableID] != sFieldMovesTerminator; tableID++)
            {
                if (GetMonData(&gPlayerParty[gLastFieldPokeMenuOpened], MON_DATA_MOVE1 + moveID) == sPokeMenuFieldMoves[tableID])
                {
                    u8 fieldID = tableID + POKEMENU_FIRST_FIELD_MOVE_ID;
                    AppendToList(sPokeMenuOptionsOrder, &sPokeMenuOptionsNo, fieldID);
                    break;
                }
            }
        }
        AppendToList(sPokeMenuOptionsOrder, &sPokeMenuOptionsNo, POKEMENU_SUMMARY);

        // can't switch a pokemon if it's the only one in the party
        if (GetMonData(&gPlayerParty[1], MON_DATA_SPECIES) != 0)
            AppendToList(sPokeMenuOptionsOrder, &sPokeMenuOptionsNo, POKEMENU_SWITCH);

        if (ItemIsMail(GetMonData(&gPlayerParty[gLastFieldPokeMenuOpened], MON_DATA_HELD_ITEM)))
            AppendToList(sPokeMenuOptionsOrder, &sPokeMenuOptionsNo, POKEMENU_MAIL);
        else
            AppendToList(sPokeMenuOptionsOrder, &sPokeMenuOptionsNo, POKEMENU_ITEM);

        AppendToList(sPokeMenuOptionsOrder, &sPokeMenuOptionsNo, POKEMENU_CANCEL);
    }
}

static void sub_8089BDC(u8 arg0, u8 arg1, u8 arg2, u8 noOfOptions, const struct MenuAction* menuActions, const u8* order, u8 arg6)
{
    sub_806D538(5, arg6);
    MenuDrawTextWindow(arg0, arg1, arg0 + arg2, (noOfOptions * 2) + arg1 + 1);
    PrintMenuItemsReordered(arg0 + 1, arg1 + 1, noOfOptions, menuActions, order);
}

void sub_8089C50(u8 arg0, u8 arg1, u8 arg2, u8 noOfOptions, const struct MenuAction* menuActions, const u8* order)
{
    sub_8089BDC(arg0, arg1, arg2, noOfOptions, menuActions, order, 1);
}

static void sub_8089C7C(u8 arg0)
{
    u32 r4 = (u8)(18 - (sPokeMenuOptionsNo << 1));

    sub_8089BDC(19, r4, 10, sPokeMenuOptionsNo, sPokemonMenuActions, sPokeMenuOptionsOrder, 3);
    r4 |= 1;
    InitMenu(0, 20, r4, sPokeMenuOptionsNo, arg0, 9);
}

void sub_8089CD4(u8 taskID)
{
    if (!gPaletteFade.active)
    {
        switch (sub_806BD80(taskID))
        {
        case 1:
            PlaySE(SE_SELECT);
            gLastFieldPokeMenuOpened = sub_806CA38(taskID);
            GetMonNickname(&gPlayerParty[gLastFieldPokeMenuOpened], gStringVar1);
            sub_8089A8C();
            sPokeMenuCursorPos = 0;
            sub_8089C7C(0);
            gTasks[taskID].func = sub_8089D94;
            sub_808B5B4(taskID);
            break;
        case 2:
            PlaySE(SE_SELECT);
            BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
            gTasks[taskID].func = sub_8089E4C;
            break;
        }
    }
}

static void sub_8089D94(u8 taskID)
{
    if (!gPaletteFade.active)
    {
        if ((gMain.newAndRepeatedKeys & DPAD_ANY) == DPAD_UP)
        {
            PlaySE(SE_SELECT);
            sPokeMenuCursorPos = MoveMenuCursor(-1);
            sub_808B5B4(taskID);
        }
        else if ((gMain.newAndRepeatedKeys & DPAD_ANY) == DPAD_DOWN)
        {
            PlaySE(SE_SELECT);
            sPokeMenuCursorPos = MoveMenuCursor(1);
            sub_808B5B4(taskID);
        }
        else if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            sPokemonMenuActions[sPokeMenuOptionsOrder[sPokeMenuCursorPos]].func(taskID);
            sub_808B5B4(taskID);
        }
        else if (gMain.newKeys & B_BUTTON)
        {
            PokemonMenu_Cancel(taskID);
            sub_808B5B4(taskID);
        }
    }
}

static void sub_8089E4C(u8 taskID)
{
    if (!gPaletteFade.active)
    {
        gLastFieldPokeMenuOpened = 0;
        SetMainCallback2(sub_805469C);
        DestroyTask(taskID);
    }
}

static void sub_8089E84(void)
{
    GetMonNickname(&gPlayerParty[gLastFieldPokeMenuOpened], gStringVar1);
    sub_8089A8C();
    sPokeMenuCursorPos = 0;
    sub_8089C7C(0);
}

static void sub_8089EBC(void)
{
    do
    {
        if (sub_806B124() == TRUE)
        {
            sub_806C994(EWRAM_1B000.unk260, gUnknown_020384F0);
            sub_806BF74(EWRAM_1B000.unk260, 0);
            gLastFieldPokeMenuOpened = gUnknown_020384F0;
            sub_8089E84();
            SetMainCallback2(sub_806AEDC);
            break;
        }
    } while (sub_80F9344() != TRUE);
}

static void sub_8089F14(void)
{
    gPaletteFade.bufferTransferDisabled = 1;
    sub_806AF4C(0, 0xFF, sub_8089D94, 5);
    SetMainCallback2(sub_8089EBC);
}

static void sub_8089F44(u8 taskID)
{
    if (!gPaletteFade.active)
    {
        u8 spriteID = gSprites[gTasks[taskID].data[3] >> 8].data0;
        DestroyTask(taskID);
        ewram1B000_alt.unk262 = 1;
        ShowPokemonSummaryScreen(gPlayerParty, spriteID, gPlayerPartyCount - 1, sub_8089F14, 0);
    }
}

static void PokemonMenu_Summary(u8 taskID)
{
    BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
    gTasks[taskID].func = sub_8089F44;
}

void sub_808A004(u8 taskID)
{
    SetTaskFuncWithFollowupFunc(taskID, sub_806CA60, sub_8089CD4);
    MenuZeroFillWindowRect(19, 0, 29, 19);
}

static void PokemonMenu_Switch(u8 taskID)
{
    HandleDestroyMenuCursors();
    ewram01000.unkC = sub_806CD5C;
    ewram01000.array[53553] = 1;
    sub_808A004(taskID);
}

static void sub_808A060(u8 taskID)
{
    if (gMain.newKeys == DPAD_UP && sPokeMenuCursorPos != 0)
    {
        sPokeMenuCursorPos = MoveMenuCursor(-1);
        PlaySE(SE_SELECT);
    }
    if (gMain.newKeys == DPAD_DOWN && sPokeMenuCursorPos != 2)
    {
        sPokeMenuCursorPos = MoveMenuCursor(1);
        PlaySE(SE_SELECT);
    }
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        PartyMenuGetPopupMenuFunc(0, &sUnknown_0839F578, (void*) sPokemonMenuActions, sPokeMenuCursorPos)(taskID);
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        sub_806E7D0(0, &sUnknown_0839F578);
        PokemonMenu_CancelSubmenu(taskID);
    }
}

static void sub_808A100(u8 taskID)
{
    sub_806E750(0, &sUnknown_0839F578, (void*)(sPokemonMenuActions), 0);
    sub_806D538(0xD, 2);
    gTasks[taskID].func = sub_808A060;
}

static void PokemonMenu_Item(u8 taskID)
{
    HandleDestroyMenuCursors();
    sPokeMenuCursorPos = 0;
    MenuZeroFillWindowRect(19, 0, 29, 19);
    gTasks[taskID].func = sub_808A100;
}

static void sub_808A180(u8 taskID)
{
    if (!gPaletteFade.active)
    {
        u8 mailID = GetMonData(&gPlayerParty[sub_806CA38(taskID)], MON_DATA_MAIL);
        DestroyTask(taskID);
        sub_80E62A0(4, &gSaveBlock1.mail[mailID], sub_808A520, 3);
    }
}

static void sub_808A1E0(u8 taskID)
{
    if (gUnknown_0202E8F6 != 1)
    {
        SetHeldItemIconVisibility(taskID, sub_806CA38(taskID));
        sub_806D538(0, 0);
        gTasks[taskID].func = sub_8089CD4;
    }
}

static void sub_808A228(u8 taskID)
{
    if (ItemIsMail(gScriptItemId) && gUnknown_0202E8F4 != 0)
    {
        BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
        gTasks[taskID].func = sub_808A180;
    }
    else
    {
        MenuZeroFillWindowRect(0, 0, 29, 19);
        sub_806D538(0, 0);
        gTasks[taskID].func = sub_8089CD4;
    }
}

static void sub_808A2AC(u8 taskID)
{
    if (!gPaletteFade.active)
        PartyMenuTryGiveMonHeldItem(taskID, gScriptItemId, sub_808A228);
}

static void sub_808A2DC(u8 taskID)
{
    u8 mailID = GetMonData(&gPlayerParty[sub_806CA38(taskID)], MON_DATA_MAIL);
    DestroyTask(taskID);
    sub_80E62A0(4, &gSaveBlock1.mail[mailID], sub_808A520, 3);
}

static void sub_808A330(u8 taskID)
{
    PartyMenuTryGiveMonHeldItem(taskID, gScriptItemId, sub_808A2DC);
}

static void sub_808A34C(void)
{
    RunTasks();
}

static void sub_808A358(void)
{
    while (1)
    {
        if (sub_806B124() == TRUE)
        {
            sub_806C994(EWRAM_1B000.unk260, gLastFieldPokeMenuOpened);
            sub_806BF74(EWRAM_1B000.unk260, 0);
            SetMainCallback2(sub_806AEDC);
            break;
        }
        if (sub_80F9344() == TRUE)
            break;
    }
}

static void sub_808A3A4(void)
{
    while (1)
    {
        if (sub_806B124() == TRUE)
        {
            sub_806C994(EWRAM_1B000.unk260, gLastFieldPokeMenuOpened);
            sub_806BF74(EWRAM_1B000.unk260, 0);
            EWRAM_1B000.unk262 = 3;
            sub_8089E84();
            SetMainCallback2(sub_806AEDC);
            break;
        }
        if (sub_80F9344() == TRUE)
            break;
    }
}

void sub_808A3F8(void)
{
    if (ItemIsMail(gScriptItemId))
    {
        u8 taskID = CreateTask(sub_808A330, 0);
        gPaletteFade.bufferTransferDisabled = 1;
        sub_806BD58(taskID, 0);
        sub_806C994(taskID, gLastFieldPokeMenuOpened);
        sub_806BF74(taskID, 0);
        if (!(bool8)(GetMonData(&gPlayerParty[sub_806CA38(taskID)], MON_DATA_HELD_ITEM)))
        {
            SetMainCallback2(sub_808A34C);
            return;
        }
        else
            DestroyTask(taskID);
    }
    gPaletteFade.bufferTransferDisabled = 1;
    if (gScriptItemId)
    {
        sub_806AF4C(0, 0xFF, sub_808A2AC, 0xFF);
        SetMainCallback2(sub_808A358);
    }
    else
    {
        sub_806AF4C(0, 0xFF, sub_8089D94, 5);
        SetMainCallback2(sub_808A3A4);
    }
}

static void sub_808A4D4(void)
{
    while (1)
    {
        if (sub_806B124() == TRUE)
        {
            sub_806C994(EWRAM_1B000.unk260, gLastFieldPokeMenuOpened);
            sub_806BF74(EWRAM_1B000.unk260, 0);
            SetMainCallback2(sub_806AEDC);
            break;
        }
        if (sub_80F9344() == TRUE)
            break;
    }
}

void sub_808A520(void)
{
    gPaletteFade.bufferTransferDisabled = 1;
    if (gScriptResult == 0)
    {
        if (gUnknown_0202E8F8)
            RemoveBagItem(gUnknown_0202E8F8, 1);
        AddBagItem(GetMonData(&gPlayerParty[gLastFieldPokeMenuOpened], MON_DATA_HELD_ITEM), 1);
        TakeMailFromMon(&gPlayerParty[gLastFieldPokeMenuOpened]);
        SetMonData(&gPlayerParty[gLastFieldPokeMenuOpened], MON_DATA_HELD_ITEM, (void*) &gUnknown_0202E8F8);
        sub_806AF4C(0, 0xFF, sub_8089CD4, 0);
    }
    else
        sub_806AF4C(0, 0xFF, sub_808A5BC, 0xFF);
    SetMainCallback2(sub_808A4D4);
}

static void sub_808A5BC(u8 taskID)
{
    if (!gPaletteFade.active)
    {
        DisplayGiveHeldItemMessage(gLastFieldPokeMenuOpened, gScriptItemId, 0);
        gTasks[taskID].func = sub_808A1E0;
    }
}

static void sub_808A604(u8 taskID)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(sub_80A61D0);
        DestroyTask(taskID);
    }
}

static void PokemonMenu_GiveItem(u8 taskID)
{
    gUnknown_0202E8F5 = sub_806CA38(taskID);
    BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
    gTasks[taskID].func = sub_808A604;
}

static void sub_808A678(u8 taskID)
{
    sub_808A8D4(taskID);
}

static void PokemonMenu_TakeItem(u8 taskID)
{
    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(19, 0, 29, 19);
    sub_806D5A4();
    PartyMenuTryGiveMonHeldItem_806ECE8(taskID, sub_808A678);
}

static void PokemonMenu_TakeMail(u8 taskID)
{
    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(19, 0, 29, 19);
    sub_806D5A4();
    DoTakeMail(taskID, sub_808A678);
}

static void PokemonMenu_Mail(u8 taskID)
{
    HandleDestroyMenuCursors();
    sPokeMenuCursorPos = 0;
    MenuZeroFillWindowRect(19, 0, 29, 19);
    sub_806E750(0, &sUnknown_0839F584, (void*) sPokemonMenuActions, 0);
    gTasks[taskID].func = sub_808A73C;
}

static void sub_808A73C(u8 taskID)
{
    if (gMain.newAndRepeatedKeys == DPAD_UP)
    {
        PlaySE(SE_SELECT);
        if (sPokeMenuCursorPos == 0)
            sPokeMenuCursorPos = MoveMenuCursor(sUnknown_0839F584.unk0 - 1);
        else
            sPokeMenuCursorPos = MoveMenuCursor(-1);
    }
    if (gMain.newAndRepeatedKeys == DPAD_DOWN)
    {
        PlaySE(SE_SELECT);
        if (sPokeMenuCursorPos == sUnknown_0839F584.unk0 - 1)
            sPokeMenuCursorPos = MoveMenuCursor(1 - sUnknown_0839F584.unk0);
        else
            sPokeMenuCursorPos = MoveMenuCursor(1);
    }
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        PartyMenuGetPopupMenuFunc(0, &sUnknown_0839F584, (void*) sPokemonMenuActions, sPokeMenuCursorPos)(taskID);
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        sub_806E7D0(0, &sUnknown_0839F584);
        PokemonMenu_Cancel(taskID);
    }
}

static void PokemonMenu_ReadMail(u8 taskID)
{
    BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
    gTasks[taskID].func = sub_808A848;
}

static void sub_808A848(u8 taskID)
{
    if (!gPaletteFade.active)
    {
        u8 mailID = GetMonData(&gPlayerParty[sub_806CA38(taskID)], MON_DATA_MAIL);
        DestroyTask(taskID);
        HandleReadMail(&gSaveBlock1.mail[mailID], sub_808A8A8, 1);
    }
}

static void sub_808A8A8(void)
{
    gUnknown_020384F0 = gLastFieldPokeMenuOpened;
    ewram1B000.unk262 = 4;
    sub_8089F14();
}

static void sub_808A8D4(u8 taskID)
{
    sPokeMenuCursorPos = 0;
    MenuZeroFillWindowRect(19, 0, 29, 19);
    sub_806D538(0, 0);
    gTasks[taskID].func = sub_8089CD4;
}

static void PokemonMenu_Cancel(u8 taskID)
{
    HandleDestroyMenuCursors();
    PlaySE(SE_SELECT);
    sub_808A8D4(taskID);
}

static void PokemonMenu_CancelSubmenu(u8 taskID)
{
    HandleDestroyMenuCursors();
    PlaySE(SE_SELECT);
    MenuZeroFillWindowRect(19, 0, 29, 19);
    sub_806D5A4();
    sub_8089C7C(sPokeMenuCursorPos);
    gTasks[taskID].func = sub_8089D94;
}

#define IS_SOFTBOILED_MILKDRINK(ID)((ID == (POKEMENU_MILK_DRINK - POKEMENU_FIRST_FIELD_MOVE_ID) || ID == (POKEMENU_SOFT_BOILED - POKEMENU_FIRST_FIELD_MOVE_ID)))
#define IS_SURF(ID)((ID == (POKEMENU_SURF - POKEMENU_FIRST_FIELD_MOVE_ID)))
#define IS_FLY(ID)((ID == (POKEMENU_FLY - POKEMENU_FIRST_FIELD_MOVE_ID)))

#define TASK_FIELD_MOVE_ID  11

static void PokemonMenu_FieldMove(u8 taskID)
{
    s16* taskData = gTasks[taskID].data;
    HandleDestroyMenuCursors();
    taskData[TASK_FIELD_MOVE_ID] = sPokeMenuOptionsOrder[sPokeMenuCursorPos] - POKEMENU_FIRST_FIELD_MOVE_ID;
    if (sub_80F9344() == TRUE)
    {
        MenuZeroFillWindowRect(19, 0, 29, 19);
        if (IS_SOFTBOILED_MILKDRINK(taskData[TASK_FIELD_MOVE_ID]))
            sub_806D538(9, 0);
        else
            sub_806D538(sFieldMoveFuncs[taskData[TASK_FIELD_MOVE_ID]].field_1, 0);
        gTasks[taskID].func = sub_808ABF4;
    }
    else if (taskData[TASK_FIELD_MOVE_ID] <= 7 && FlagGet(BADGE01_GET + taskData[TASK_FIELD_MOVE_ID]) != TRUE)
    {
        // can't use a field HM move without a proper badge
        MenuZeroFillWindowRect(19, 0, 29, 19);
        sub_806D5A4();
        sub_806E834(gOtherText_CantBeUsedBadge, 1);
        gTasks[taskID].func = sub_808AAF0;
    }
    else
    {
        if (sFieldMoveFuncs[taskData[TASK_FIELD_MOVE_ID]].func() == TRUE)
        {
            sPokeMenuCursorPos = 0;
            if (!IS_SOFTBOILED_MILKDRINK(taskData[TASK_FIELD_MOVE_ID]))
            {
                gTasks[taskID].func = sub_808AB34;
                BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
            }
            else
                sub_8133D28(taskID);
        }
        else
        {
            MenuZeroFillWindowRect(19, 0, 29, 19);
            if (IS_SURF(taskData[TASK_FIELD_MOVE_ID]) && TestPlayerAvatarFlags(8))
                sub_806D538(8, 0);
            else
                sub_806D538(sFieldMoveFuncs[taskData[TASK_FIELD_MOVE_ID]].field_1, 0);
            gTasks[taskID].func = sub_808ABF4;
        }
    }
}

static void sub_808AAF0(u8 taskID)
{
    if (gUnknown_0202E8F6 != 1 && (gMain.newKeys & A_BUTTON || gMain.newKeys & B_BUTTON))
    {
        MenuZeroFillWindowRect(0, 14, 29, 19);
        PokemonMenu_Cancel(taskID);
    }
}

static void sub_808AB34(u8 taskID)
{
    if (!gPaletteFade.active)
    {
        if (!IS_FLY(gTasks[taskID].data[TASK_FIELD_MOVE_ID]) || ShouldDoBrailleFlyEffect())
            SetMainCallback2(c2_exit_to_overworld_2_switch);
        else
            SetMainCallback2(CB2_InitFlyRegionMap);
        DestroyTask(taskID);
    }
}

void sub_808AB90(void)
{
    pal_fill_black();
    CreateTask(sub_808ABA8, 8);
}

static void sub_808ABA8(u8 taskID)
{
    if (sub_807D770() == TRUE)
    {
        gUnknown_0202FF84[0] = GetMonData(&gPlayerParty[gLastFieldPokeMenuOpened], MON_DATA_SPECIES);
        gUnknown_03005CE4();
        DestroyTask(taskID);
    }
}

static void sub_808ABF4(u8 taskID)
{
    if (gMain.newKeys & A_BUTTON || gMain.newKeys & B_BUTTON)
    {
        MenuZeroFillWindowRect(1, 17, 28, 18);
        PokemonMenu_Cancel(taskID);
    }
}

static void sub_808AC2C(void)
{
    gUnknown_0202FF84[0] = gLastFieldPokeMenuOpened;
    FieldEffectStart(FLDEFF_USE_SURF);
}

static bool8 SetUpFieldMove_Surf(void)
{
    if (PartyHasMonWithSurf() == TRUE && IsPlayerFacingSurfableFishableWater() == TRUE)
    {
        gFieldCallback = sub_808AB90;
        gUnknown_03005CE4 = sub_808AC2C;
        return TRUE;
    }
    else
        return FALSE;
}

static void sub_808AC8C(void)
{
    gUnknown_0202FF84[0] = gLastFieldPokeMenuOpened;
    FieldEffectStart(FLDEFF_USE_FLY);
}

static bool8 SetUpFieldMove_Fly(void)
{
    if (ShouldDoBrailleFlyEffect())
    {
        gFieldCallback = sub_808AB90;
        gUnknown_03005CE4 = DoBrailleFlyEffect;
        return TRUE;
    }
    if (is_light_level_1_2_3_or_6(gMapHeader.mapType) == 1)
    {
        gFieldCallback = sub_808AB90;
        gUnknown_03005CE4 = sub_808AC8C;
        return TRUE;
    }
    return FALSE;
}

static void sub_808AD0C(void)
{
    while (1)
    {
        if (sub_806B124() == TRUE)
        {
            sub_806C994(EWRAM_1B000.unk260, gLastFieldPokeMenuOpened);
            sub_806BF74(EWRAM_1B000.unk260, 0);
            SetMainCallback2(sub_806AEDC);
            break;
        }
        if (sub_80F9344() == TRUE)
            break;
    }
}

void sub_808AD58(void)
{
    gPaletteFade.bufferTransferDisabled = 1;
    sub_806AF4C(0, 0xFF, sub_8089CD4, 0);
    SetMainCallback2(sub_808AD0C);
}

u16 unref_sub_808AD88(void)
{
    return GetMonData(&gPlayerParty[gLastFieldPokeMenuOpened], MON_DATA_SPECIES);
}

static void sub_808ADAC(void)
{
    gUnknown_0202FF84[0] = gLastFieldPokeMenuOpened;
    FieldEffectStart(FLDEFF_USE_DIVE);
}

static bool8 SetUpFieldMove_Dive(void)
{
    gUnknown_0202FF84[1] = sub_8068F18();
    if (gUnknown_0202FF84[1])
    {
        gFieldCallback = sub_808AB90;
        gUnknown_03005CE4 = sub_808ADAC;
        return TRUE;
    }
    else
        return FALSE;
}

static void sub_808AE08(void)
{
    gUnknown_0202FF84[0] = gLastFieldPokeMenuOpened;
    FieldEffectStart(FLDEFF_USE_WATERFALL);
}

static bool8 SetUpFieldMove_Waterfall(void)
{
    s16 x, y;
    GetXYCoordsOneStepInFrontOfPlayer(&x, &y);
    if (MetatileBehavior_IsWaterfall(MapGridGetMetatileBehaviorAt(x, y)) == TRUE
        && IsPlayerSurfingNorth() == TRUE)
    {
        gFieldCallback = sub_808AB90;
        gUnknown_03005CE4 = sub_808AE08;
        return TRUE;
    }
    else
        return FALSE;
}

static void sub_808AE8C(void)
{
    u8 i;
    u8 arg = gScriptItemId - 33;
    for (i = 0; i < 6; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES))
        {
            sub_806D668(i);
            if (GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG) || !CanMonLearnTMHM(&gPlayerParty[i], arg))
                sub_806BC3C(i, 0x9A);
            else if (pokemon_has_move(&gPlayerParty[i], ItemIdToBattleMoveId(gScriptItemId)))
                sub_806BC3C(i, 0xA8);
            else
                sub_806BC3C(i, 0x8C);
        }
    }
}

static void sub_808AF20(void)
{
    u8 i;
    for (i = 0; i < 6; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES))
        {
            if (GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG) || !GetEvolutionTargetSpecies(&gPlayerParty[i], 3, gScriptItemId))
            {
                sub_806D668(i);
                sub_806BC3C(i, 0);
            }
        }
    }
}

static void sub_808AF80(void)
{
    while (1)
    {
        if (sub_806B124() == TRUE)
        {
            if (gUnknown_02038561 == 0)
            {
                switch (CheckIfItemIsTMHMOrEvolutionStone(gScriptItemId))
                {
                case 1:
                    sub_808AE8C();
                    break;
                case 2:
                    sub_808AF20();
                    break;
                }
            }
            if (gLastFieldPokeMenuOpened > 5 || !GetMonData(&gPlayerParty[gLastFieldPokeMenuOpened], MON_DATA_SPECIES))
                gLastFieldPokeMenuOpened = 0;
            sub_806C994(ewram1B000.unk260, gLastFieldPokeMenuOpened);
            sub_806BF74(ewram1B000.unk260, 0);
            SetMainCallback2(sub_806AEDC);
            break;
        }
        if (sub_80F9344() == TRUE)
            break;
    }
}

void sub_808B020(void)
{
    gPaletteFade.bufferTransferDisabled = 1;
    switch (gUnknown_02038561)
    {
    case 0:
        if (CheckIfItemIsTMHMOrEvolutionStone(gScriptItemId) == 1)
            sub_806AF4C(0, 0, sub_808B0C0, 20);
        else
            sub_806AF4C(0, 0, sub_808B0C0, 3);
        break;
    case 4:
        sub_806AF4C(0, 0, sub_808B1EC, 0xFF);
        break;
    case 1:
    case 3:
        sub_806AF4C(0, 0, sub_808B0C0, 4);
        break;
    }
    SetMainCallback2(sub_808AF80);
}

void sub_808B0C0(u8 taskID)
{
    if (!gPaletteFade.active)
    {
        switch (sub_806BD80(taskID))
        {
        case 1:
            gLastFieldPokeMenuOpened = sub_806CA38(taskID);
            if (GetMonData(&gPlayerParty[gLastFieldPokeMenuOpened], MON_DATA_IS_EGG))
                PlaySE(SE_HAZURE);
            else
            {
                sub_806D5A4();
                if (gUnknown_02038561 == 0)
                    gUnknown_03004AE4(taskID, gScriptItemId, sub_808B224);
                if (gUnknown_02038561 == 1)
                {
                    PlaySE(SE_SELECT);
                    PartyMenuTryGiveMonHeldItem(taskID, gScriptItemId, sub_808B2EC);
                }
                if (gUnknown_02038561 == 3)
                {
                    PlaySE(SE_SELECT);
                    PartyMenuTryGiveMonMail(taskID, sub_808B2B4);
                }
            }
            break;
        case 2:
            gLastFieldPokeMenuOpened = sub_806CA38(taskID);
            PlaySE(SE_SELECT);
            BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
            if (gUnknown_02038561 == 0 || gUnknown_02038561 == 1)
                gTasks[taskID].func = sub_808B25C;
            if (gUnknown_02038561 == 3)
                gTasks[taskID].func = sub_808B2B4;
            break;
        }
    }
}

static void sub_808B1EC(u8 taskID)
{
    if (!gPaletteFade.active)
        gUnknown_03004AE4(taskID, gScriptItemId, sub_808B224);
}

static void sub_808B224(u8 taskID)
{
    BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
    gTasks[taskID].func = sub_808B25C;
}

static void sub_808B25C(u8 taskID)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(sub_80A5B40);
        DestroyTask(taskID);
    }
}

static void sub_808B288(u8 taskID)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(Mailbox_ReturnToMailListAfterDeposit);
        DestroyTask(taskID);
    }
}

static void sub_808B2B4(u8 taskID)
{
    BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
    gTasks[taskID].func = sub_808B288;
}

static void sub_808B2EC(u8 taskID)
{
    if (gUnknown_0202E8F4 == 2)
    {
        BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
        gTasks[taskID].func = sub_808B338;
    }
    else
        sub_808B224(taskID);
}

static void sub_808B338(u8 taskID)
{
    if (!gPaletteFade.active)
    {
        u8 mailID;

        gLastFieldPokeMenuOpened = sub_806CA38(taskID);
        mailID = GetMonData(&gPlayerParty[gLastFieldPokeMenuOpened], MON_DATA_MAIL);
        DestroyTask(taskID);
        sub_80E62A0(4, &gSaveBlock1.mail[mailID], sub_808B3EC, 3);
    }
}

static void sub_808B3A0(void)
{
    while (1)
    {
        if (sub_806B124() == TRUE)
        {
            sub_806C994(EWRAM_1B000.unk260, gLastFieldPokeMenuOpened);
            sub_806BF74(EWRAM_1B000.unk260, 0);
            SetMainCallback2(sub_806AEDC);
            break;
        }
        if (sub_80F9344() == TRUE)
            break;
    }
}

static void sub_808B3EC(void)
{
    IntrCallback callback;

    gPaletteFade.bufferTransferDisabled = 1;
    if (gScriptResult == 0)
    {
        if (gUnknown_0202E8F8)
            RemoveBagItem(gUnknown_0202E8F8, 1);
        AddBagItem(GetMonData(&gPlayerParty[gLastFieldPokeMenuOpened], MON_DATA_HELD_ITEM), 1);
        TakeMailFromMon(&gPlayerParty[gLastFieldPokeMenuOpened]);
        SetMonData(&gPlayerParty[gLastFieldPokeMenuOpened], MON_DATA_HELD_ITEM, (void*) &gUnknown_0202E8F8);
        CreateTask(sub_808B25C, 5);
        gPaletteFade.bufferTransferDisabled = 0;
        callback = sub_806AEDC;
    }
    else
    {
        sub_806AF4C(0, 0, sub_808B4A4, 0xFF);
        callback = sub_808B3A0;
    }
    SetMainCallback2(callback);
}

static void sub_808B4A4(u8 taskID)
{
    if (!gPaletteFade.active)
    {
        DisplayGiveHeldItemMessage(gLastFieldPokeMenuOpened, gScriptItemId, 1);
        gTasks[taskID].func = sub_808B4EC;
    }
}

static void sub_808B4EC(u8 taskID)
{
    if (gUnknown_0202E8F6 != 1)
        sub_808B224(taskID);
}

void sub_808B508(u8 taskID)
{
    sub_808B224(taskID);
}

static void sub_808B518(void)
{
    while (1)
    {
        if (sub_806B124() == TRUE)
        {
            sub_806C994(EWRAM_1B000.unk260, gUnknown_020384F0);
            sub_806BF74(EWRAM_1B000.unk260, 0);
            SetMainCallback2(sub_806AEDC);
            break;
        }
        if (sub_80F9344() == TRUE)
            break;
    }
}

void sub_808B564(void)
{
    gPaletteFade.bufferTransferDisabled = 1;
    if (sub_809FA30() != 4)
        sub_806AF4C(0, 0, TaughtMove, 0xFF);
    else
        sub_806AF4C(0, 0, StopTryingToTeachMove_806F588, 0xFF);
    SetMainCallback2(sub_808B518);
}

void sub_808B5B4(u32 taskID)
{
    gUnknown_03005CF0 = gTasks[taskID].func;
    gTasks[taskID].func = sub_808B5E4;
    sub_808B5E4(taskID);
}

static void sub_808B5E4(u8 taskID)
{
    if (sub_8055870() != TRUE)
        gTasks[taskID].func = gUnknown_03005CF0;
}
