#include "global.h"
#include "asm.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "pokemon.h"
#include "songs.h"
#include "sound.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "battle_party_menu.h"

extern u8 IsLinkDoubleBattle(void);
extern void TryCreatePartyMenuMonIcon(u8, u8, struct Pokemon *);
extern void LoadHeldItemIconGraphics(void);
extern void CreateHeldItemIcons_806DC34();
extern u8 sub_806BD58(u8, u8);
extern void PartyMenuPrintMonsLevelOrStatus(void);
extern void PrintPartyMenuMonNicknames(void);
extern void PartyMenuTryPrintMonsHP(void);
extern void nullsub_13(void);
extern void PartyMenuDrawHPBars(void);
extern u8 sub_806B58C(u8);
extern u8 GetItemEffectType();
extern void sub_806E750(u8, const struct PartyPopupMenu *, const struct PartyMenuItem *, int);
extern u16 sub_806BD80();
extern u8 sub_806CA38();
extern void sub_806D5A4(void);
extern void sub_802E414(void);
extern void sub_8094D60(void);
extern void sub_80A6DCC(void);
extern void sub_806AF4C();
extern u8 sub_80F9344(void);
extern u8 sub_806B124(void);
extern void sub_806C994();
extern void sub_806BF74();
extern void sub_806AEDC(void);
extern TaskFunc PartyMenuGetPopupMenuFunc(u8, const struct PartyPopupMenu *, const struct PartyMenuItem *, u8);
extern void ShowPokemonSummaryScreen(struct Pokemon *, u8, u8, void (*)(u8), int);
extern void sub_806E7D0(u8, const struct PartyPopupMenu *);
extern u8 *sub_8040D08();
extern void sub_806E834();
extern u8 sub_8094C20();
extern void sub_8040B8C(void);
extern u8 pokemon_order_func(u8);
extern void sub_8094C98(u8, u8);
extern void sub_806E6F0();
extern void sub_806D538();

extern u16 gScriptItemId;
extern u8 gPlayerPartyCount;
extern u8 gUnknown_02024A68;
extern u16 gUnknown_02024A6A[];
extern u8 gUnknown_02024E6C;
extern u8 gUnknown_0202E8F4;
extern u8 gUnknown_0202E8F5;
extern u8 gUnknown_0202E8F6;
extern u8 gUnknown_02038473;
extern u8 gUnknown_020384F0;
extern void (*gUnknown_03004AE4)();  //don't know types yet
extern const u8 gOtherText_CantSwitchPokeWithYours[];
extern const u8 gOtherText_NoEnergyLeft[];
extern const u8 gOtherText_EGGCantBattle[];
extern const u8 gOtherText_AlreadySelected[];
extern const u8 gOtherText_CantBeSwitched[];
extern const u8 gOtherText_AlreadyBattle[];
extern const u8 OtherText_Summary[];
extern const u8 gOtherText_CancelNoTerminator[];
extern const u8 OtherText_Shift[];
extern const u8 OtherText_SendOut[];

static void Task_809527C(u8);
static void Task_80952B4(u8);
static void Task_80952E4(u8);
static void Task_8095330(u8);
static void Task_809538C(void);
static void Task_HandlePopupMenuInput(u8);
static void Task_BattlePartyMenuSummary(u8 taskId);
static void Task_BattlePartyMenuShift(u8 taskId);
static void Task_BattlePartyMenuCancel(u8 taskId);

static const struct PartyMenuItem sBattlePartyMenuActions[] =
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

// rom_8094928 is part of this file, has yet to be decompiled.

int SetUpBattlePartyMenu(void)
{
    switch (EWRAM_1B000.unk264)
    {
    case 0:
        //TODO: try to get rid of this duplicate code
        if (IsLinkDoubleBattle() == TRUE)
        {
            if (EWRAM_1B000.unk266 != 6)
            {
                TryCreatePartyMenuMonIcon(EWRAM_1B000.unk260, EWRAM_1B000.unk266, &gPlayerParty[EWRAM_1B000.unk266]);
                EWRAM_1B000.unk266++;
            }
            else
            {
                EWRAM_1B000.unk266 = 0;
                EWRAM_1B000.unk264++;
            }
        }
        else
        {
            if (EWRAM_1B000.unk266 < 6)
            {
                TryCreatePartyMenuMonIcon(EWRAM_1B000.unk260, EWRAM_1B000.unk266, &gPlayerParty[EWRAM_1B000.unk266]);
                EWRAM_1B000.unk266++;
            }
            else
            {
                EWRAM_1B000.unk266 = 0;
                EWRAM_1B000.unk264++;
            }                
        }
        break;
    case 1:
        LoadHeldItemIconGraphics();
        EWRAM_1B000.unk264++;
        break;
    case 2:
        CreateHeldItemIcons_806DC34(EWRAM_1B000.unk260);
        EWRAM_1B000.unk264++;
        break;
    case 3:
        if (sub_806BD58(EWRAM_1B000.unk260, EWRAM_1B000.unk266) == 1)
        {
            EWRAM_1B000.unk266 = 0;
            EWRAM_1B000.unk264++;
        }
        else
            EWRAM_1B000.unk266++;
        break;
    case 4:
        PartyMenuPrintMonsLevelOrStatus();
        EWRAM_1B000.unk264++;
        break;
    case 5:
        PrintPartyMenuMonNicknames();
        EWRAM_1B000.unk264++;
        break;
    case 6:
        PartyMenuTryPrintMonsHP();
        EWRAM_1B000.unk264++;
        break;
    case 7:
        nullsub_13();
        EWRAM_1B000.unk264++;
        break;
    case 8:
        PartyMenuDrawHPBars();
        EWRAM_1B000.unk264++;
        break;
    case 9:
        if (sub_806B58C(EWRAM_1B000.unk266) == 1)
        {
            EWRAM_1B000.unk266 = 0;
            EWRAM_1B000.unk264++;
        }
        else
            EWRAM_1B000.unk266++;
        break;
    case 10:
        if (gUnknown_02038473 == 3)
        {
            if (GetItemEffectType(gScriptItemId) == 10)
                EWRAM_1B000.unk259 = 0xFF;
            else
                EWRAM_1B000.unk259 = 3;
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
            gTasks[EWRAM_1B000.unk260].data[4] = 1;
            gTasks[EWRAM_1B000.unk260].data[5] = 1;
        }
        else
        {
            gTasks[EWRAM_1B000.unk260].data[4] = 0;
            gTasks[EWRAM_1B000.unk260].data[5] = 0;
        }
    }
    else
    {
        gTasks[EWRAM_1B000.unk260].data[4] = 2;
        gTasks[EWRAM_1B000.unk260].data[5] = 2;
    }
    sub_806E750(gTasks[a].data[4], sBattlePartyPopupMenus, sBattlePartyMenuActions, 0);
}

void SetUpBattlePokemonMenu(u8 a)
{
    if (!gPaletteFade.active)
    {
        if (gUnknown_02038473 == 3 && GetItemEffectType(gScriptItemId) == 10)
        {
            gUnknown_03004AE4(a, gScriptItemId, Task_80952E4);
            return;
        }
        
        switch (sub_806BD80(a))
        {
        case 1:
            if (gUnknown_02038473 == 3)
            {
                if (GetMonData(&gPlayerParty[sub_806CA38(a)], MON_DATA_IS_EGG))
                    PlaySE(SE_HAZURE);
                else
                {
                    sub_806D5A4();
                    gUnknown_03004AE4(a, gScriptItemId, Task_80952E4);
                }
            }
            else
            {
                PlaySE(SE_SELECT);
                GetMonNickname(&gPlayerParty[sub_806CA38(a)], gStringVar1);
                sub_8095050(a, sub_806CA38(a));
                SetTaskFuncWithFollowupFunc(a, Task_HandlePopupMenuInput, SetUpBattlePokemonMenu);
            }
            break;
        case 2:
            if (gUnknown_02038473 == 1)
                PlaySE(SE_HAZURE);
            else
            {
                PlaySE(SE_SELECT);
                if (gUnknown_02038473 == 3)
                {
                    gUnknown_0202E8F4 = 0;
                    gTasks[a].func = Task_80952E4;
                }
                else
                {
                    gUnknown_0202E8F4 = 0;
                    gTasks[a].func = Task_809527C;
                }
            }
            break;
        }
    }
}

static void Task_809527C(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
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
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
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

static void Task_809535C(u8 taskId)
{
    gPaletteFade.bufferTransferDisabled = TRUE;
    sub_806AF4C(1, 0xFF, SetUpBattlePokemonMenu, 5);
    SetMainCallback2(Task_809538C);
}

static void Task_809538C(void)
{
    do
    {
        if (sub_806B124() == 1)
        {
            sub_806C994(EWRAM_1B000.unk260, gUnknown_020384F0);
            sub_806BF74(EWRAM_1B000.unk260, 0);
            GetMonNickname(&gPlayerParty[gUnknown_020384F0], gStringVar1);
            sub_8095050(EWRAM_1B000.unk260, gUnknown_020384F0);
            SetTaskFuncWithFollowupFunc(EWRAM_1B000.unk260, Task_HandlePopupMenuInput, SetUpBattlePokemonMenu);
            SetMainCallback2(sub_806AEDC);
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
            MoveMenuCursor(-1);
            return;
        }
        if (gMain.newAndRepeatedKeys & DPAD_DOWN)
        {
            PlaySE(SE_SELECT);
            MoveMenuCursor(1);
            return;
        }
        if (gMain.newKeys & A_BUTTON)
        {            
            PlaySE(SE_SELECT);
            func = PartyMenuGetPopupMenuFunc(gTasks[taskId].data[4],
                               sBattlePartyPopupMenus,
                               sBattlePartyMenuActions,
                               GetMenuCursorPos());
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
        ShowPokemonSummaryScreen(gPlayerParty, partySelection, gPlayerPartyCount - 1, Task_809535C, 4);
    }
}

static void Task_BattlePartyMenuSummary(u8 taskId)
{
    sub_806CA38(taskId);  //an unused variable was probably set with this.
    gTasks[taskId].func = Task_ShowSummaryScreen;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
}

static void Task_BattlePartyMenuShift(u8 taskId)
{
    u8 partySelection;
    u8 i;
    u8 r4;
    
    sub_806E7D0(gTasks[taskId].data[4], sBattlePartyPopupMenus);
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
    for (i = 0; i < gUnknown_02024A68; i++)
    {
        if (battle_side_get_owner(i) == 0
         && sub_8094C20(partySelection) == gUnknown_02024A6A[i])
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
        u8 r4 = gUnknown_02024E6C;
        
        sub_806D5A4();
        r0 = pokemon_order_func(gUnknown_02024A6A[r4]);
        GetMonNickname(&gPlayerParty[r0], gStringVar1);
        StringExpandPlaceholders(gStringVar4, gOtherText_CantBeSwitched);
        sub_806E834(gStringVar4, 0);
        gTasks[taskId].func = Task_80954C0;
        return;
    }
    gUnknown_0202E8F5 = sub_8094C20(partySelection);
    gUnknown_0202E8F4 = 1;
    r4 = pokemon_order_func(gUnknown_02024A6A[gUnknown_02024E6C]);
    sub_8094C98(r4, partySelection);
    sub_806E6F0(&gPlayerParty[r4], &gPlayerParty[partySelection]);
    gTasks[taskId].func = Task_809527C;
}

static void Task_BattlePartyMenuCancel(u8 taskId)
{
    sub_8072DEC();
    sub_806E7D0(gTasks[taskId].data[4], sBattlePartyPopupMenus);
    gTasks[taskId].data[4] = gTasks[taskId].data[5];
    sub_806D538(0, 0);
    SwitchTaskToFollowupFunc(taskId);
}
