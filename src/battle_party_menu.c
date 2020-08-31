#include "global.h"
#include "battle_party_menu.h"
#include "battle.h"
#include "item_menu.h"
#include "item_use.h"
#include "main.h"
#include "menu.h"
#include "menu_helpers.h"
#include "palette.h"
#include "party_menu.h"
#include "pokemon.h"
#include "pokemon_summary_screen.h"
#include "rom_8077ABC.h"
#include "rom_8094928.h"
#include "constants/songs.h"
#include "sound.h"
#include "string_util.h"
#include "strings.h"
#include "task.h"
#include "text.h"
#include "ewram.h"

extern u8 sub_806BD58(u8, u8);
extern void PartyMenuPrintMonsLevelOrStatus(void);
extern void nullsub_13(void);
extern void sub_802E414(void);
extern void sub_80A6DCC(void);
extern u8 *sub_8040D08();
extern void sub_8040B8C(void);
extern void nullsub_14();
extern u8 sub_803FBBC(void);

extern u8 gPlayerPartyCount;
extern u8 gBattlersCount;
extern u16 gBattlerPartyIndexes[];
extern u8 gBankInMenu;
extern u8 gUnknown_0202E8F4;
extern u8 gUnknown_0202E8F5;
extern u8 gUnknown_0202E8F6;
extern u8 gUnknown_02038470[3];
extern u8 gUnknown_02038473;
extern u8 gUnknown_020384F0;
extern void (*gPokemonItemUseCallback)();  //don't know types yet
extern struct PokemonStorage gPokemonStorage;
extern void nullsub_14();

void sub_8094C98(u8, u8);
u8 pokemon_order_func(u8);

static void sub_8094998(u8[3], u8);
static void sub_8094A74(u8[3], u8, u32);
static void sub_8094D60(void);
static void Task_809527C(u8);
static void Task_80952B4(u8);
static void Task_80952E4(u8);
static void Task_8095330(u8);
static void Task_809538C(void);
static void Task_HandlePopupMenuInput(u8);
static void Task_BattlePartyMenuSummary(u8 taskId);
static void Task_BattlePartyMenuShift(u8 taskId);
static void Task_BattlePartyMenuCancel(u8 taskId);

static const struct MenuAction2 sBattlePartyMenuActions[] =
{
    {OtherText_Summary,             Task_BattlePartyMenuSummary},
    {gOtherText_CancelNoTerminator, Task_BattlePartyMenuCancel},
    {OtherText_Shift,               Task_BattlePartyMenuShift},
    {OtherText_SendOut,             Task_BattlePartyMenuShift},
};
static const u8 Unknown_83B5FEC[] = {2, 0, 1};  //SHIFT, SUMMARY, CANCEL
static const u8 Unknown_83B5FEF[] = {3, 0, 1};  //SEND OUT, SUMMARY, CANCEL
static const u8 Unknown_83B5FF2[] = {0, 1};     //SUMMARY, CANCEL
static const struct PartyPopupMenu sBattlePartyPopupMenus[] =
{
    {ARRAY_COUNT(Unknown_83B5FEC), 9, Unknown_83B5FEC},
    {ARRAY_COUNT(Unknown_83B5FEF), 9, Unknown_83B5FEF},
    {ARRAY_COUNT(Unknown_83B5FF2), 9, Unknown_83B5FF2},
};

void unref_sub_8094928(struct PokemonStorage *ptr)
{
    *ptr = gPokemonStorage;
}

void unref_sub_8094940(struct PokemonStorage *ptr)
{
    gPokemonStorage = *ptr;
}

void sub_8094958(void)
{
    sub_8094998(gUnknown_02038470, sub_803FBBC());
}

void sub_8094978(u8 arg1, u8 arg2)
{
    sub_8094A74((UNK_201606C_ARRAY) + arg1 * 3, arg2, arg1);
}

static void sub_8094998(u8 arg[3], u8 player_number)
{
    int i;
    u32 pos;
    u8 temp[6];
    if (IsLinkDoubleBattle() == TRUE)
    {
        if (player_number)
        {
            *arg = 0x30;
            arg[1] = 0x45;
            arg[2] = 0x12;
        }
        else
        {
            *arg = 0x03;
            arg[1] = 0x12;
            arg[2] = 0x45;
        }
    }
    else
    {
        if (!IsDoubleBattle())
        {
            pos = 1;
            *temp = gBattlerPartyIndexes[GetBattlerAtPosition(0)];
            for (i = 0; i <= 5; i++)
                if (i != *temp)
                    temp[pos++] = i;
        }
        else
        {
            pos = 2;
            *temp = gBattlerPartyIndexes[GetBattlerAtPosition(0)];
            temp[1] = gBattlerPartyIndexes[GetBattlerAtPosition(2)];
            for (i = 0; i <= 5; i++)
                if ((i != *temp) && (i != temp[1]))
                    temp[pos++] = i;
        }
        for (i = 0; i <= 2; i++)
            arg[i] = (temp[i << 1] << 4) | temp[(i << 1) + 1];
    }
}

static void sub_8094A74(u8 arg[3], u8 player_number, u32 arg3)
{
    int i, j;
    u8 temp[6];
    if (!GetBattlerSide(arg3))
    {
        i = GetBattlerAtPosition(0);
        j = GetBattlerAtPosition(2);
    }
    else
    {
        i = GetBattlerAtPosition(1);
        j = GetBattlerAtPosition(3);
    }
    if (IsLinkDoubleBattle() == TRUE)
    {
        if (player_number)
        {
            *arg = 0x30;
            arg[1] = 0x45;
            arg[2] = 0x12;
        }
        else
        {
            *arg = 0x03;
            arg[1] = 0x12;
            arg[2] = 0x45;
        }
    }
    else
    {
        if (!IsDoubleBattle())
        {
            int pos = 1;
            *temp = gBattlerPartyIndexes[i];
            for (i = 0; i <= 5; i++)
                if (i != *temp)
                    temp[pos++] = i;
        }
        else
        {
            int pos = 2;
            *temp = gBattlerPartyIndexes[i];
            temp[1] = gBattlerPartyIndexes[j];
            for (i = 0; i <= 5; i++)
                if ((i != *temp) && (i != temp[1]))
                    temp[pos++] = i;
        }
        for (i = 0; i <= 2; i++)
            arg[i] = (temp[i << 1] << 4) | temp[(i << 1) + 1];
    }
}

void sub_8094B6C(u8 a, u8 b, u8 c)
{
    s32 i;
    s32 j;
    u8 temp[6];
    u8 r3;
    u8 r7 = 0;

    if (IsLinkDoubleBattle())
    {
        u8 *arr = &ewram1606Carr(0, a);

        for (i = 0, j = 0; i < 3; i++)
        {
            temp[j++] = arr[i] >> 4;
            temp[j++] = arr[i] & 0xF;
        }
        r3 = temp[c];
        for (i = 0; i < 6; i++)
        {
            if (temp[i] == b)
            {
                r7 = temp[i];
                temp[i] = r3;
                break;
            }
        }
        if (i != 6)
        {
            temp[c] = r7;

            arr[0] = (temp[0] << 4) | temp[1];
            arr[1] = (temp[2] << 4) | temp[3];
            arr[2] = (temp[4] << 4) | temp[5];
        }
    }
}

u8 sub_8094C20(u8 monIndex)
{
    u8 retVal;
    u8 val = monIndex & 1;

    monIndex /= 2;
    if (val)
        retVal = gUnknown_02038470[monIndex] & 0xF;
    else
        retVal = gUnknown_02038470[monIndex] >> 4;
    return retVal;
}

void sub_8094C54(u8 a, u8 b)
{
    u8 val = a & 1;

    a /= 2;
    if (val)
        gUnknown_02038470[a] = (gUnknown_02038470[a] & 0xF0) | b;
    else
        gUnknown_02038470[a] = (gUnknown_02038470[a] & 0xF) | (b << 4);
}

void sub_8094C98(u8 a, u8 b)
{
    u8 r4 = sub_8094C20(a);
    u8 r1 = sub_8094C20(b);

    sub_8094C54(a, r1);
    sub_8094C54(b, r4);
}

u8 pokemon_order_func(u8 a)
{
    u8 i;
    u8 r2;

    for (i = 0, r2 = 0; i < 3; i++)
    {
        if ((gUnknown_02038470[i] >> 4) == a)
            return r2;
        r2++;
        if ((gUnknown_02038470[i] & 0xF) == a)
            return r2;
        r2++;
    }
    return 0;
}

void pokemon_change_order(void)
{
    u8 i;

    memcpy(ewram1B000.unk0, gPlayerParty, sizeof(gPlayerParty));
    for (i = 0; i < 6; i++)
    {
        u8 n = pokemon_order_func(i);

        memcpy(&gPlayerParty[n], &ewram1B000.unk0[i], sizeof(struct Pokemon));
    }
}

static void sub_8094D60(void)
{
    struct Pokemon temp[6];
    u8 i;

    memcpy(temp, gPlayerParty, sizeof(gPlayerParty));
    for (i = 0; i < 6; i++)
    {
        u8 n = sub_8094C20(i);

        memcpy(&gPlayerParty[n], &temp[i], sizeof(struct Pokemon));
    }
}

void unref_sub_8094DB0(void)
{
    u8 i;
    u8 r4;

    for (i = 1; i < 6; i++)
    {
        u8 n = sub_8094C20(i);

        if (GetMonData(&gPlayerParty[n], MON_DATA_SPECIES) != 0
         && GetMonData(&gPlayerParty[n], MON_DATA_HP) != 0)
        {
            r4 = sub_8094C20(0);
            sub_8094C98(0, i);
            SwapPokemon(&gPlayerParty[r4], &gPlayerParty[n]);
            break;
        }
    }
}

void sub_8094E20(u8 a)
{
    gPaletteFade.bufferTransferDisabled = TRUE;
    gUnknown_02038473 = a;
    nullsub_14();
    pokemon_change_order();
    OpenPartyMenu(PARTY_MENU_TYPE_BATTLE, 0xFF);
}

void sub_8094E4C(void)
{
    sub_8094E20(3);
}

bool8 SetUpBattlePartyMenu(void)
{
    switch (EWRAM_1B000.setupState)
    //switch (ewram1B000.unk264[0])
    {
    case 0:
        //TODO: try to get rid of this duplicate code
        if (IsLinkDoubleBattle() == TRUE)
        {
            if (EWRAM_1B000.monIndex != 6)
            {
                TryCreatePartyMenuMonIcon(EWRAM_1B000.menuHandlerTaskId, EWRAM_1B000.monIndex, &gPlayerParty[EWRAM_1B000.monIndex]);
                EWRAM_1B000.monIndex++;
            }
            else
            {
                EWRAM_1B000.monIndex = 0;
                EWRAM_1B000.setupState++;
            }
        }
        else
        {
            if (EWRAM_1B000.monIndex < 6)
            {
                TryCreatePartyMenuMonIcon(EWRAM_1B000.menuHandlerTaskId, EWRAM_1B000.monIndex, &gPlayerParty[EWRAM_1B000.monIndex]);
                EWRAM_1B000.monIndex++;
            }
            else
            {
                EWRAM_1B000.monIndex = 0;
                EWRAM_1B000.setupState++;
            }
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
        if (sub_806BD58(EWRAM_1B000.menuHandlerTaskId, EWRAM_1B000.monIndex) == 1)
        {
            EWRAM_1B000.monIndex = 0;
            EWRAM_1B000.setupState++;
        }
        else
            EWRAM_1B000.monIndex++;
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
        PartyMenuTryPrintMonsHP();
        EWRAM_1B000.setupState++;
        break;
    case 7:
        nullsub_13();
        EWRAM_1B000.setupState++;
        break;
    case 8:
        PartyMenuDrawHPBars();
        EWRAM_1B000.setupState++;
        break;
    case 9:
        if (DrawPartyMonBackground(EWRAM_1B000.monIndex) == 1)
        {
            EWRAM_1B000.monIndex = 0;
            EWRAM_1B000.setupState++;
        }
        else
            EWRAM_1B000.monIndex++;
        break;
    case 10:
        if (gUnknown_02038473 == 3)
        {
            if (GetItemEffectType(gSpecialVar_ItemId) == 10)
                ewram1B000.promptTextId = 0xFF;
            else
                ewram1B000.promptTextId = 3;
        }
        return TRUE;
    }
    return FALSE;
}

static void sub_8095050(u8 a, u8 b)
{
    if (!GetMonData(&gPlayerParty[b], MON_DATA_IS_EGG))
    {
        if (gUnknown_02038473 == 1)
        {
            gTasks[EWRAM_1B000.menuHandlerTaskId].data[4] = 1;
            gTasks[EWRAM_1B000.menuHandlerTaskId].data[5] = 1;
        }
        else
        {
            gTasks[EWRAM_1B000.menuHandlerTaskId].data[4] = 0;
            gTasks[EWRAM_1B000.menuHandlerTaskId].data[5] = 0;
        }
    }
    else
    {
        gTasks[EWRAM_1B000.menuHandlerTaskId].data[4] = 2;
        gTasks[EWRAM_1B000.menuHandlerTaskId].data[5] = 2;
    }

    ShowPartyPopupMenu(gTasks[a].data[4], sBattlePartyPopupMenus, sBattlePartyMenuActions, 0);
}

void HandleBattlePartyMenu(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        if (gUnknown_02038473 == 3 && GetItemEffectType(gSpecialVar_ItemId) == 10)
        {
            gPokemonItemUseCallback(taskId, gSpecialVar_ItemId, Task_80952E4);
            return;
        }

        switch (HandleDefaultPartyMenuInput(taskId))
        {
        case A_BUTTON:
            if (gUnknown_02038473 == 3)
            {
                if (GetMonData(&gPlayerParty[sub_806CA38(taskId)], MON_DATA_IS_EGG))
                    PlaySE(SE_HAZURE);
                else
                {
                    sub_806D5A4();
                    gPokemonItemUseCallback(taskId, gSpecialVar_ItemId, Task_80952E4);
                }
            }
            else
            {
                PlaySE(SE_SELECT);
                GetMonNickname(&gPlayerParty[sub_806CA38(taskId)], gStringVar1);
                sub_8095050(taskId, sub_806CA38(taskId));
                SetTaskFuncWithFollowupFunc(taskId, Task_HandlePopupMenuInput, HandleBattlePartyMenu);
            }
            break;
        case B_BUTTON:
            if (gUnknown_02038473 == 1)
                PlaySE(SE_HAZURE);
            else
            {
                PlaySE(SE_SELECT);
                if (gUnknown_02038473 == 3)
                {
                    gUnknown_0202E8F4 = 0;
                    gTasks[taskId].func = Task_80952E4;
                }
                else
                {
                    gUnknown_0202E8F4 = 0;
                    gTasks[taskId].func = Task_809527C;
                }
            }
            break;
        }
    }
}

static void Task_809527C(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
    gTasks[taskId].func = Task_80952B4;
}

static void Task_80952B4(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        sub_8094D60();
        DestroyTask(taskId);
        SetMainCallback2(sub_802E414);
    }
}

static void Task_80952E4(u8 taskId)
{
    if (gUnknown_0202E8F4 != 0)
        Task_809527C(taskId);
    else
    {
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        gTasks[taskId].func = Task_8095330;
    }
}

static void Task_8095330(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        sub_8094D60();
        DestroyTask(taskId);
        sub_80A6DCC();
    }
}

static void Task_809535C(void)
{
    gPaletteFade.bufferTransferDisabled = TRUE;
    SetPartyMenuSettings(PARTY_MENU_TYPE_BATTLE, 0xFF, HandleBattlePartyMenu, 5);
    SetMainCallback2(Task_809538C);
}

static void Task_809538C(void)
{
    do
    {
        if (InitPartyMenu() == TRUE)
        {
            sub_806C994(EWRAM_1B000.menuHandlerTaskId, gUnknown_020384F0);
            ChangePartyMenuSelection(EWRAM_1B000.menuHandlerTaskId, 0);
            GetMonNickname(&gPlayerParty[gUnknown_020384F0], gStringVar1);
            sub_8095050(EWRAM_1B000.menuHandlerTaskId, gUnknown_020384F0);
            SetTaskFuncWithFollowupFunc(EWRAM_1B000.menuHandlerTaskId, Task_HandlePopupMenuInput, HandleBattlePartyMenu);
            SetMainCallback2(CB2_PartyMenuMain);
            return;
        }
    } while (sub_80F9344() != 1);
}

static void Task_HandlePopupMenuInput(u8 taskId)
{
    TaskFunc func;

    if (!gPaletteFade.active)
    {
        if (gMain.newAndRepeatedKeys & DPAD_UP)
        {
            PlaySE(SE_SELECT);
            Menu_MoveCursor(-1);
            return;
        }
        if (gMain.newAndRepeatedKeys & DPAD_DOWN)
        {
            PlaySE(SE_SELECT);
            Menu_MoveCursor(1);
            return;
        }
        if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            func = PartyMenuGetPopupMenuFunc(gTasks[taskId].data[4],
                               sBattlePartyPopupMenus,
                               sBattlePartyMenuActions,
                               Menu_GetCursorPos());
            func(taskId);
            return;
        }
        if (gMain.newKeys & B_BUTTON)
        {
            PlaySE(SE_SELECT);
            Task_BattlePartyMenuCancel(taskId);
            return;
        }
    }
}

static void Task_80954C0(u8 taskId)
{
    if (gUnknown_0202E8F6 == 0)
        Task_BattlePartyMenuCancel(taskId);
}

static void Task_ShowSummaryScreen(u8 taskId)
{
    u8 partySelection = sub_806CA38(taskId);

    if (!gPaletteFade.active)
    {
        DestroyTask(taskId);
        EWRAM_1B000.unk262 = 1;
        ShowPokemonSummaryScreen(gPlayerParty, partySelection, gPlayerPartyCount - 1, Task_809535C, PSS_MODE_NO_MOVE_ORDER_EDIT);
    }
}

static void Task_BattlePartyMenuSummary(u8 taskId)
{
    sub_806CA38(taskId);  //an unused variable was probably set with this.
    gTasks[taskId].func = Task_ShowSummaryScreen;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
}

static void Task_BattlePartyMenuShift(u8 taskId)
{
    u8 partySelection;
    u8 i;
    u8 r4;

    ClosePartyPopupMenu(gTasks[taskId].data[4], sBattlePartyPopupMenus);
    partySelection = sub_806CA38(taskId);
    if (IsLinkDoubleBattle() == TRUE && (partySelection == 1 || partySelection == 4 || partySelection == 5))
    {
        sub_806D5A4();
        StringCopy(gStringVar1, sub_8040D08());
        StringExpandPlaceholders(gStringVar4, gOtherText_CantSwitchPokeWithYours);
        sub_806E834(gStringVar4, 0);
        gTasks[taskId].func = Task_80954C0;
        return;
    }
    if (GetMonData(&gPlayerParty[partySelection], MON_DATA_HP) == 0)
    {
        sub_806D5A4();
        GetMonNickname(&gPlayerParty[partySelection], gStringVar1);
        StringExpandPlaceholders(gStringVar4, gOtherText_NoEnergyLeft);
        sub_806E834(gStringVar4, 0);
        gTasks[taskId].func = Task_80954C0;
        return;
    }
    for (i = 0; i < gBattlersCount; i++)
    {
        if (GetBattlerSide(i) == 0
         && sub_8094C20(partySelection) == gBattlerPartyIndexes[i])
        {
            sub_806D5A4();
            GetMonNickname(&gPlayerParty[partySelection], gStringVar1);
            StringExpandPlaceholders(gStringVar4, gOtherText_AlreadyBattle);
            sub_806E834(gStringVar4, 0);
            gTasks[taskId].func = Task_80954C0;
            return;
        }
    }
    if (GetMonData(&gPlayerParty[partySelection], MON_DATA_IS_EGG))
    {
        sub_806D5A4();
        StringExpandPlaceholders(gStringVar4, gOtherText_EGGCantBattle);
        sub_806E834(gStringVar4, 0);
        gTasks[taskId].func = Task_80954C0;
        return;
    }
    if (sub_8094C20(partySelection) == EWRAM_1609D)
    {
        sub_806D5A4();
        GetMonNickname(&gPlayerParty[partySelection], gStringVar1);
        StringExpandPlaceholders(gStringVar4, gOtherText_AlreadySelected);
        sub_806E834(gStringVar4, 0);
        gTasks[taskId].func = Task_80954C0;
        return;
    }
    if (gUnknown_02038473 == 4)
    {
        sub_806D5A4();
        sub_8040B8C();
        sub_806E834(gStringVar4, 0);
        gTasks[taskId].func = Task_80954C0;
        return;
    }
    if (gUnknown_02038473 == 2)
    {
        u8 r0;
        u8 r4 = gBankInMenu;

        sub_806D5A4();
        r0 = pokemon_order_func(gBattlerPartyIndexes[r4]);
        GetMonNickname(&gPlayerParty[r0], gStringVar1);
        StringExpandPlaceholders(gStringVar4, gOtherText_CantBeSwitched);
        sub_806E834(gStringVar4, 0);
        gTasks[taskId].func = Task_80954C0;
        return;
    }
    gUnknown_0202E8F5 = sub_8094C20(partySelection);
    gUnknown_0202E8F4 = 1;
    r4 = pokemon_order_func(gBattlerPartyIndexes[gBankInMenu]);
    sub_8094C98(r4, partySelection);
    SwapPokemon(&gPlayerParty[r4], &gPlayerParty[partySelection]);
    gTasks[taskId].func = Task_809527C;
}

static void Task_BattlePartyMenuCancel(u8 taskId)
{
    Menu_DestroyCursor();
    ClosePartyPopupMenu(gTasks[taskId].data[4], sBattlePartyPopupMenus);
    gTasks[taskId].data[4] = gTasks[taskId].data[5];
    PrintPartyMenuPromptText(0, 0);
    SwitchTaskToFollowupFunc(taskId);
}
