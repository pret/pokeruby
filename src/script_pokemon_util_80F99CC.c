#include "global.h"
#include "battle_party_menu.h"
#include "choose_party.h"
#include "contest.h"
#include "data2.h"
#include "party_menu.h"
#include "field_fadetransition.h"
#include "palette.h"
#include "party_menu.h"
#include "pokemon.h"
#include "pokemon_summary_screen.h"
#include "overworld.h"
#include "script.h"
#include "script_pokemon_80F9.h"
#include "constants/songs.h"
#include "sound.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "ewram.h"

extern const u8 gPPUpReadMasks[];

extern u8 gPlayerPartyCount;
extern u16 gSpecialVar_0x8004;
extern u16 gSpecialVar_0x8005;
extern u8 gUnknown_02038694;
extern u16 gSpecialVar_Result;

extern void (*gFieldCallback)(void);

void sub_80F99CC(void)
{
    u8 taskId;

    ScriptContext2_Enable();
    taskId = CreateTask((void *)OpenPartyMenuFromScriptContext, 0xA);
    gTasks[taskId].data[0] = PARTY_MENU_TYPE_CONTEST;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
}

void SelectMonForNPCTrade(void)
{
    u8 taskId;

    ScriptContext2_Enable();
    taskId = CreateTask((void *)OpenPartyMenuFromScriptContext, 0xA);
    gTasks[taskId].data[0] = PARTY_MENU_TYPE_IN_GAME_TRADE;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
}

void SelectMoveTutorMon(void)
{
    u8 taskId;

    ScriptContext2_Enable();
    taskId = CreateTask((void *)OpenPartyMenuFromScriptContext, 0xA);
    gTasks[taskId].data[0] = PARTY_MENU_TYPE_MOVE_TUTOR;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
}

void OpenPartyMenuFromScriptContext(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        gPaletteFade.bufferTransferDisabled = 1;
        OpenPartyMenu((u8) gTasks[taskId].data[0], 0);
        DestroyTask(taskId);
    }
}

bool8 SetupContestPartyMenu(void)
{
    switch (EWRAM_1B000.setupState)
    {
    case 0:
        if (EWRAM_1B000.monIndex < gPlayerPartyCount)
        {
            TryCreatePartyMenuMonIcon(EWRAM_1B000.menuHandlerTaskId, EWRAM_1B000.monIndex, &gPlayerParty[EWRAM_1B000.monIndex]);
            EWRAM_1B000.monIndex++;
        }
        else
        {
            EWRAM_1B000.monIndex = 0;
            EWRAM_1B000.setupState++;
        }
        break;
    case 1:
        LoadHeldItemIconGraphics();
        EWRAM_1B000.setupState++;
        break;
    case 2:
        CreateHeldItemIcons_806DC34(EWRAM_1B000.menuHandlerTaskId);
        EWRAM_1B000.setupState++;
        break;
    case 3:
        if (sub_806BD58(EWRAM_1B000.menuHandlerTaskId, EWRAM_1B000.monIndex) != 1)
        {
            EWRAM_1B000.monIndex++;
            break;
        }
        else
        {
            EWRAM_1B000.monIndex = 0;
            EWRAM_1B000.setupState++;
            break;
        }
    case 4:
        PartyMenuPrintMonsLevelOrStatus();
        EWRAM_1B000.setupState++;
        break;
    case 5:
        PrintPartyMenuMonNicknames();
        EWRAM_1B000.setupState++;
        break;
    case 6:
        sub_80F9C00();
        EWRAM_1B000.setupState++;
        break;
    case 7: // the only case that can return true.
        if (DrawPartyMonBackground(EWRAM_1B000.monIndex) != 1)
        {
            EWRAM_1B000.monIndex++;
            break;
        }
        else
        {
            EWRAM_1B000.monIndex = 0;
            EWRAM_1B000.setupState = 0;
            return TRUE;
        }
    }
    return FALSE;
}

void sub_80F9C00(void)
{
    u8 i;

    for (i = 0; i < gPlayerPartyCount; i++)
    {
        switch (sub_80AE47C(&gPlayerParty[i]))
        {
        case 0:
        case 3:
        case 4:
            DrawMonDescriptorStatus(i, 0x7E);
            break;
        case 1:
        case 2:
            DrawMonDescriptorStatus(i, 0x70);
            break;
        }
    }
}

void HandleSelectPartyMenu(u8 var)
{
    if (!gPaletteFade.active)
    {
        switch (HandleDefaultPartyMenuInput(var))
        {
        case A_BUTTON:
            PlaySE(SE_SELECT);
            gUnknown_02038694 = sub_806CA38(var);
            gSpecialVar_0x8004 = gUnknown_02038694;
            sub_8123138(var);
            break;
        case B_BUTTON:
            PlaySE(SE_SELECT);
            gUnknown_02038694 = 0xFF;
            gSpecialVar_0x8004 = 0xFF;
            sub_8123138(var);
            break;
        }
    }
}

bool8 SetupMoveTutorPartyMenu(void)
{
    switch (EWRAM_1B000.setupState)
    {
    case 0:
        if (EWRAM_1B000.monIndex < gPlayerPartyCount)
        {
            TryCreatePartyMenuMonIcon(EWRAM_1B000.menuHandlerTaskId, EWRAM_1B000.monIndex, &gPlayerParty[EWRAM_1B000.monIndex]);
            EWRAM_1B000.monIndex++;
        }
        else
        {
            EWRAM_1B000.monIndex = 0;
            EWRAM_1B000.setupState++;
        }
        break;
    case 1:
        LoadHeldItemIconGraphics();
        EWRAM_1B000.setupState++;
        break;
    case 2:
        CreateHeldItemIcons_806DC34(EWRAM_1B000.menuHandlerTaskId);
        EWRAM_1B000.setupState++;
        break;
    case 3:
        if (sub_806BD58(EWRAM_1B000.menuHandlerTaskId, EWRAM_1B000.monIndex) != 1)
        {
            EWRAM_1B000.monIndex++;
        }
        else
        {
            EWRAM_1B000.monIndex = 0;
            EWRAM_1B000.setupState++;
        }
        break;
    case 4:
        PartyMenuPrintMonsLevelOrStatus();
        EWRAM_1B000.setupState++;
        break;
    case 5:
        PrintPartyMenuMonNicknames();
        EWRAM_1B000.setupState++;
        break;
    case 6:
        sub_80F9E1C();
        EWRAM_1B000.setupState++;
        break;
    case 7: // the only case that can return true.
        if (DrawPartyMonBackground(EWRAM_1B000.monIndex) != 1)
        {
            EWRAM_1B000.monIndex++;
        }
        else
        {
            EWRAM_1B000.monIndex = 0;
            EWRAM_1B000.setupState = 0;
            return TRUE;
        }
    }

    return FALSE;
}

void sub_80F9E1C(void)
{
    u8 i;

    for (i = 0; i < gPlayerPartyCount; i++)
    {
        if (!sub_8040574(&gPlayerParty[i]))
            DrawMonDescriptorStatus(i, 0x9A);
        else
            DrawMonDescriptorStatus(i, 0x8C);
    }
}

void HandleMoveTutorPartyMenu(u8 var)
{
    if (!gPaletteFade.active)
    {
        switch (HandleDefaultPartyMenuInput(var))
        {
        case A_BUTTON:
            PlaySE(SE_SELECT);
            gSpecialVar_0x8004 = sub_806CA38(var);
            gSpecialVar_0x8005 = sub_8040574(&gPlayerParty[gSpecialVar_0x8004]);
            sub_8123138(var);
            break;
        case B_BUTTON:
            PlaySE(SE_SELECT);
            gSpecialVar_0x8004 = 0xFF;
            sub_8123138(var);
        }
    }
}

void SelectMove(void)
{
    ShowSelectMovePokemonSummaryScreen(&gPlayerParty[0], gSpecialVar_0x8004, gPlayerPartyCount - 1, c2_exit_to_overworld_2_switch, 0);
    UNK_2018000_STRUCT.unk8 = 3;
    gFieldCallback = sub_8080990;
}

void ScrSpecial_CountPokemonMoves(void) // count pokemon moves
{
    u8 i;

    gSpecialVar_Result = 0;

    for (i = 0; i < 4; i++) // checks MOVE1-MOVE4
        if (GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_MOVE1 + i))
            gSpecialVar_Result++;
}

void ScrSpecial_GetPokemonNicknameAndMoveName(void)
{
    struct Pokemon *pkmn = &gPlayerParty[gSpecialVar_0x8004];
    u16 data = GetMonData(pkmn, MON_DATA_MOVE1 + gSpecialVar_0x8005);

    GetMonNickname(pkmn, gStringVar1);
    StringCopy(gStringVar2, gMoveNames[data]);
}

void sub_80F9FDC(struct Pokemon *pkmn, u8 moveIndex1, u8 moveIndex2)
{
    u16 move1 = GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex1);
    u16 move2 = GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex2);
    u8 pp1 = GetMonData(pkmn, MON_DATA_PP1 + moveIndex1);
    u8 pp2 = GetMonData(pkmn, MON_DATA_PP1 + moveIndex2);
    u8 bonuses = GetMonData(pkmn, MON_DATA_PP_BONUSES);

    u8 r2 = (bonuses & gPPUpReadMasks[moveIndex1]) >> (moveIndex1 * 2);
    u8 r1 = (bonuses & gPPUpReadMasks[moveIndex2]) >> (moveIndex2 * 2);

    bonuses &= ~gPPUpReadMasks[moveIndex1];
    bonuses &= ~gPPUpReadMasks[moveIndex2];
    bonuses |= (r2 << (moveIndex2 * 2)) + (r1 << (moveIndex1 * 2));

    SetMonData(pkmn, MON_DATA_MOVE1 + moveIndex1, &move2);
    SetMonData(pkmn, MON_DATA_MOVE1 + moveIndex2, &move1);
    SetMonData(pkmn, MON_DATA_PP1 + moveIndex1, &pp2);
    SetMonData(pkmn, MON_DATA_PP1 + moveIndex2, &pp1);
    SetMonData(pkmn, MON_DATA_PP_BONUSES, &bonuses);
}

void DeleteMonMove(void)
{
    u16 i;

    SetMonMoveSlot(&gPlayerParty[gSpecialVar_0x8004], 0, gSpecialVar_0x8005);
    RemoveMonPPBonus(&gPlayerParty[gSpecialVar_0x8004], gSpecialVar_0x8005);

    for (i = gSpecialVar_0x8005; i < 3; i++)
        sub_80F9FDC(&gPlayerParty[gSpecialVar_0x8004], i, i + 1);
}

void IsSelectedMonEgg(void)
{
    struct Pokemon *party = &gPlayerParty[gSpecialVar_0x8004];
    gSpecialVar_Result = 0;

    if (GetMonData(party, MON_DATA_IS_EGG))
        gSpecialVar_Result = 1;
}
