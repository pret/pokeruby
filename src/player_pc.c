#include "global.h"
#include "player_pc.h"
#include "decoration.h"
#include "field_fadetransition.h"
#include "field_weather.h"
#include "item.h"
#include "item_menu.h"
#include "constants/items.h"
#include "main.h"
#include "menu.h"
#include "menu_helpers.h"
#include "palette.h"
#include "script.h"
#include "sound.h"
#include "string_util.h"
#include "strings.h"
#include "task.h"
#include "constants/songs.h"
#include "name_string_util.h"
#include "mail.h"
#include "overworld.h"
#include "player_pc.h"
#include "ewram.h"

extern void DisplayItemMessageOnField(u8, const u8*, TaskFunc, u16);
extern void DoPlayerPCDecoration(u8);
extern void BuyMenuFreeMemory(void);
extern void DestroyVerticalScrollIndicator(u8);
extern void PauseVerticalScrollIndicator(u8);
extern void LoadScrollIndicatorPalette(void);
extern void ClearMailStruct(struct MailStruct *);
extern u8 IsWeatherNotFadingIn(void);
extern void sub_808B020(void);
extern void ClearVerticalScrollIndicatorPalettes(void);

static EWRAM_DATA const u8 *gPcItemMenuOptionOrder = NULL;

static u8 gPcItemMenuOptionsNum;

extern u8 gPokemonItemUseType;

// event scripts
extern u8 gBrendanHouse_TurnPCOff[];
extern u8 gMayHouse_TurnPCOff[];

extern void (*gFieldCallback)(void);

static void InitPlayerPCMenu(u8 taskId);
static void PlayerPCProcessMenuInput(u8 taskId);
static void InitItemStorageMenu(u8);
static void ItemStorageMenuPrint(const u8 *);
static void ItemStorageMenuProcessInput(u8);
static void ItemStorage_ProcessInput(u8);
static void ItemStorage_SetItemAndMailCount(u8);
static void ItemStorage_DoItemAction(u8);
static void ItemStorage_GoBackToPlayerPCMenu(u8);
static void ItemStorage_HandleQuantityRolling(u8);
static void ItemStorage_DoItemWithdraw(u8);
static void ItemStorage_DoItemToss(u8);
static void ItemStorage_HandleRemoveItem(u8);
static void ItemStorage_WaitPressHandleResumeProcessInput(u8);
static void ItemStorage_HandleResumeProcessInput(u8);
static void ItemStorage_DoItemSwap(u8, bool8);
static void ItemStorage_DrawItemList(u8);
static void ItemStorage_PrintItemPcResponse(u16);
static void ItemStorage_DrawBothListAndDescription(u8);
static void ItemStorage_GoBackToItemPCMenu(u8, u8);
static void ItemStorage_LoadPalette(void);
static u8 GetMailboxMailCount(void);
static void Mailbox_UpdateMailList(void);
static void Mailbox_DrawMailboxMenu(u8);
static void Mailbox_ProcessInput(u8);
static void Mailbox_CloseScrollIndicators(void);
static void Mailbox_PrintWhatToDoWithPlayerMailText(u8);
static void Mailbox_TurnOff(u8);
static void Mailbox_PrintMailOptions(u8);
static void Mailbox_MailOptionsProcessInput(u8);
static void Mailbox_FadeAndReadMail(u8);
static void Mailbox_ReturnToFieldFromReadMail(void);
static void Mailbox_DrawYesNoBeforeMove(u8);
static void Mailbox_DoGiveMailPokeMenu(u8);
static void Mailbox_NoPokemonForMail(u8);
static void Mailbox_Cancel(u8);
static void Mailbox_DrawMailMenuAndDoProcessInput(u8);
static void PlayerPC_ItemStorage(u8 taskId);
static void PlayerPC_Mailbox(u8 taskId);
static void PlayerPC_Decoration(u8 var);
static void PlayerPC_TurnOff(u8 taskId);
static void ItemStorage_Withdraw(u8);
static void ItemStorage_Deposit(u8);
static void ItemStorage_Toss(u8);
static void ItemStorage_Exit(u8);
static void ItemStorage_ResumeInputFromYesToss(u8);
static void ItemStorage_ResumeInputFromNoToss(u8);
static void Mailbox_DoMailMoveToBag(u8);
static void Mailbox_ReturnToInputAfterNo(u8);
static void Mailbox_DoMailRead(u8);
static void Mailbox_MoveToBag(u8);
static void Mailbox_Give(u8);
static void Mailbox_Cancel(u8);

static const u8 *const gPCText_OptionDescList[] =
{
    PCText_TakeOutItems,
    PCText_StoreItems,
    PCText_ThrowAwayItems,
    gMenuText_GoBackToPrev
};

static const struct MenuAction2 sPlayerPCMenuActions[] =
{
    { SecretBaseText_ItemStorage, PlayerPC_ItemStorage },
    { gPCText_Mailbox, PlayerPC_Mailbox },
    { SecretBaseText_Decoration, PlayerPC_Decoration },
    { SecretBaseText_TurnOff, PlayerPC_TurnOff }
};

static const u8 gBedroomPC_OptionOrder[] =
{
    PLAYERPC_MENU_ITEMSTORAGE,
    PLAYERPC_MENU_MAILBOX,
    PLAYERPC_MENU_DECORATION,
    PLAYERPC_MENU_TURNOFF
};

static const u8 gPlayerPC_OptionOrder[] =
{
    PLAYERPC_MENU_ITEMSTORAGE,
    PLAYERPC_MENU_MAILBOX,
    PLAYERPC_MENU_TURNOFF
};

static const struct MenuAction2 gPCText_ItemPCOptionsText[] =
{
    { PCText_WithdrawItem, ItemStorage_Withdraw },
    { PCText_DepositItem, ItemStorage_Deposit },
    { PCText_TossItem, ItemStorage_Toss },
    { gOtherText_Exit, ItemStorage_Exit }
};

static const struct YesNoFuncTable ResumeFromTossYesNoFuncList[] = // ResumeFromTossYesNoFuncList
{
    ItemStorage_ResumeInputFromYesToss,
    ItemStorage_ResumeInputFromNoToss
};

static const struct YesNoFuncTable ResumeFromWithdrawYesNoFuncList[] = // ResumeFromWithdrawYesNoFuncList
{
    Mailbox_DoMailMoveToBag,
    Mailbox_ReturnToInputAfterNo
};

// the use of this struct is meant to be an ItemSlot struct, but NewGameInitPCItems refuses to match without a weird pointer access.
static const struct ItemSlot gNewGamePCItems[] =
{
    { ITEM_POTION, 1 },
    { ITEM_NONE, 0 }
};

static const struct MenuAction2 gMailboxMailOptions[] =
{
    { OtherText_Read, Mailbox_DoMailRead },
    { gOtherText_MoveToBag, Mailbox_MoveToBag },
    { OtherText_Give, Mailbox_Give },
    { gOtherText_CancelNoTerminator, Mailbox_Cancel }
};

static const u8 gNonSelectedItemFormattedText[] = _("{STR_VAR_1}{CLEAR_TO 80}");
static const u8 gSelectedItemFormattedText[] = _("{COLOR RED}{STR_VAR_1}{CLEAR_TO 80}");
static const u8 gNonSelectedItemQuantityFormatText[] = _("{STR_VAR_1}");
static const u8 gSelectedItemQuantityFormatText[] = _("{COLOR RED}{STR_VAR_1}");
static const u8 gUnknown_08406330[] = _("{CLEAR_TO 32}");

extern u8 *gUnknown_02039314;
extern struct MenuAction gUnknown_08406298[];

extern u8 gUnknown_084062B8[];
extern u8 gUnknown_084062BC[];
extern u8 gUnknown_0840632A[];
extern u8 gUnknown_08406327[];
extern u8 gUnknown_0840631E[];
extern u8 gUnknown_08406318[];

extern u8 gUnknown_030007B4;
extern u8 unk_201FE00[];

extern u8 gUnknown_08152850;
extern u8 gUnknown_08152C75;

extern u32 gUnknown_08406288[];
extern const struct MenuAction gUnknown_084062C0[];
extern const struct YesNoFuncTable gUnknown_084062E0;

void NewGameInitPCItems(void)
{
    u8 i;

    // because Game Freak don't know how to use a struct or a 2d array
    for(i = 0, ClearItemSlots(gSaveBlock1.pcItems, ARRAY_COUNT(gSaveBlock1.pcItems)); NEW_GAME_PC_ITEMS(i, PC_ITEM_ID) && NEW_GAME_PC_ITEMS(i, PC_QUANTITY) &&
        AddPCItem(NEW_GAME_PC_ITEMS(i, PC_ITEM_ID), NEW_GAME_PC_ITEMS(i, PC_QUANTITY)) == TRUE; i++)
            ;
}

void BedroomPC(void)
{
    gPcItemMenuOptionOrder = gBedroomPC_OptionOrder;
    gPcItemMenuOptionsNum = 4;
    DisplayItemMessageOnField(CreateTask(TaskDummy, 0), gOtherText_WhatWillYouDo, InitPlayerPCMenu, 0);
}

void PlayerPC(void)
{
    gPcItemMenuOptionOrder = gPlayerPC_OptionOrder;
    gPcItemMenuOptionsNum = 3;
    DisplayItemMessageOnField(CreateTask(TaskDummy, 0), gOtherText_WhatWillYouDo, InitPlayerPCMenu, 0);
}

static void InitPlayerPCMenu(u8 taskId)
{
    Menu_DrawStdWindowFrame(0, 0, 10, gPcItemMenuOptionsNum * 2 + 1);
    Menu_PrintItemsReordered(1, 1, gPcItemMenuOptionsNum, sPlayerPCMenuActions, gPcItemMenuOptionOrder);
    InitMenu(0, 1, 1, gPcItemMenuOptionsNum, 0, 9);
    TASK.FUNC = PlayerPCProcessMenuInput;
}

static void PlayerPCProcessMenuInput(u8 taskId)
{
    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        PlaySE(SE_SELECT);
        Menu_MoveCursor(-1);
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        PlaySE(SE_SELECT);
        Menu_MoveCursor(1);
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        Menu_DestroyCursor();
        PlaySE(SE_SELECT);
        sPlayerPCMenuActions[gPcItemMenuOptionOrder[Menu_GetCursorPos()]].func(taskId);
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        Menu_DestroyCursor();
        PlaySE(SE_SELECT);
        sPlayerPCMenuActions[gPcItemMenuOptionsNum[gPcItemMenuOptionOrder - 1]].func(taskId); // run EXIT.
    }
}

void ReshowPlayerPC(u8 var)
{
    DisplayItemMessageOnField(var, gOtherText_WhatWillYouDo, InitPlayerPCMenu, 0);
}

static void PlayerPC_ItemStorage(u8 taskId)
{
    InitItemStorageMenu(ITEMPC_MENU_WITHDRAW);
    TASK.FUNC = ItemStorageMenuProcessInput;
}

static void PlayerPC_Mailbox(u8 taskId)
{
    Menu_EraseWindowRect(0, 0, 10, 9);
    eMailboxInfo.count = GetMailboxMailCount();

    if (eMailboxInfo.count == 0)
        DisplayItemMessageOnField(taskId, gOtherText_NoMailHere, ReshowPlayerPC, 0);
    else
    {
        eMailboxInfo.cursorPos = 0;
        eMailboxInfo.itemsAbove = 0;
        Mailbox_UpdateMailList();
        ItemStorage_SetItemAndMailCount(taskId);
        Mailbox_DrawMailboxMenu(taskId);
        TASK.FUNC = Mailbox_ProcessInput;
    }
}

static void PlayerPC_Decoration(u8 var)
{
    Menu_EraseWindowRect(0, 0, 10, 9);
    DoPlayerPCDecoration(var);
}

static void PlayerPC_TurnOff(u8 taskId)
{
    if (gPcItemMenuOptionsNum == 4) // if the option count is 4, we are at the bedroom PC and not player PC, so do gender specific handling.
    {
        Menu_EraseWindowRect(0, 0, 0x1D, 0x13);

        if (gSaveBlock2.playerGender == MALE)
            ScriptContext1_SetupScript(gBrendanHouse_TurnPCOff);
        else
            ScriptContext1_SetupScript(gMayHouse_TurnPCOff);
    }
    else
    {
        Menu_EraseWindowRect(0, 0, 10, 9);
        EnableBothScriptContexts();
    }
    DestroyTask(taskId);
}

static void InitItemStorageMenu(u8 var)
{
    Menu_EraseWindowRect(0, 0, 10, 9);
    Menu_DrawStdWindowFrame(0, 0, 11, 9);
    Menu_PrintItems(1, 1, 4, (struct MenuAction *)gPCText_ItemPCOptionsText);
    InitMenu(0, 1, 1, 4, var, 10);
    ItemStorageMenuPrint(gPCText_OptionDescList[var]);
}

static void ItemStorageMenuPrint(const u8 *textPtr)
{
    Menu_BlankWindowRect(2, 15, 27, 18);
    Menu_PrintText(textPtr, 2, 15);
}

static void ItemStorageMenuProcessInput(u8 var)
{
    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        PlaySE(SE_SELECT);
        Menu_MoveCursor(-1);
        ItemStorageMenuPrint(gPCText_OptionDescList[Menu_GetCursorPos()]);
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        PlaySE(SE_SELECT);
        Menu_MoveCursor(1);
        ItemStorageMenuPrint(gPCText_OptionDescList[Menu_GetCursorPos()]);
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        gPCText_ItemPCOptionsText[Menu_GetCursorPos()].func(var);
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        Menu_DestroyCursor();
        PlaySE(SE_SELECT);
        gPCText_ItemPCOptionsText[ITEMPC_MENU_EXIT].func(var);
    }
}

static void Task_ItemStorage_Deposit(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        sub_80A6A30();
        DestroyTask(taskId);
    }
}

static void ItemStorage_Deposit(u8 taskId)
{
    TASK.FUNC = Task_ItemStorage_Deposit;
    FadeScreen(1, 0);
}

static void ItemStorage_HandleReturnToProcessInput(u8 taskId)
{
    if (IsWeatherNotFadingIn() == TRUE)
        TASK.FUNC = ItemStorageMenuProcessInput;
}

void ItemStorage_ReturnToMenuAfterDeposit(void)
{
    Menu_DisplayDialogueFrame();
    InitItemStorageMenu(ITEMPC_MENU_DEPOSIT);
    CreateTask(ItemStorage_HandleReturnToProcessInput, 0);
    pal_fill_black();
}

static void ItemStorage_Withdraw(u8 taskId)
{
    s16 *data = TASK.data;

    Menu_DestroyCursor();
    Menu_EraseWindowRect(0, 0, 11, 9);
    NUM_ITEMS = CountUsedPCItemSlots();

    if (NUM_ITEMS != 0)
    {
        Menu_EraseWindowRect(0, 14, 29, 19);
        CURRENT_ITEM_STORAGE_MENU = ITEMPC_MENU_WITHDRAW;
        PAGE_INDEX = 0;
        ITEMS_ABOVE_TOP = 0;
        ItemStorage_SetItemAndMailCount(taskId);
        ItemStorage_GoBackToItemPCMenu(taskId, 0);
        TASK.FUNC = ItemStorage_ProcessInput;
    }
    else
        DisplayItemMessageOnField(taskId, gOtherText_NoItems, PlayerPC_ItemStorage, 0);
}

static void ItemStorage_Toss(u8 taskId)
{
    s16 *data = TASK.data;

    Menu_DestroyCursor();
    Menu_EraseWindowRect(0, 0, 11, 9);
    NUM_ITEMS = CountUsedPCItemSlots();

    if (NUM_ITEMS)
    {
        Menu_EraseWindowRect(0, 14, 29, 19);
        CURRENT_ITEM_STORAGE_MENU = ITEMPC_MENU_TOSS;
        PAGE_INDEX = 0;
        ITEMS_ABOVE_TOP = 0;
        ItemStorage_SetItemAndMailCount(taskId);
        ItemStorage_GoBackToItemPCMenu(taskId, 2);
        TASK.FUNC = ItemStorage_ProcessInput;
    }
    else
        DisplayItemMessageOnField(taskId, gOtherText_NoItems, PlayerPC_ItemStorage, 0);
}

static void ItemStorage_Exit(u8 var)
{
    Menu_DestroyCursor();
    Menu_EraseWindowRect(0, 0, 11, 9);
    ReshowPlayerPC(var);
}

static void ItemStorage_SetItemAndMailCount(u8 taskId)
{
    s16 *data = TASK.data;

    if (NUM_ITEMS > 7) // we have a full page, so set the num of page items appropriately.
        NUM_PAGE_ITEMS = 8;
    else
        NUM_PAGE_ITEMS = NUM_ITEMS + 1; // there are not enough items to fill a full page; take the # of items and add 1 for the cancel button.

    if (eMailboxInfo.count > 7)
        eMailboxInfo.pageItems = 8;
    else
        eMailboxInfo.pageItems = eMailboxInfo.count + 1;
}

static void ItemStorage_ProcessInput(u8 taskId)
{
    s16 *data = TASK.data;
    s16 trueIndex;

    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        if(PAGE_INDEX != 0) // did the cursor move physically upwards?
        {
            PlaySE(SE_SELECT);
            PAGE_INDEX = Menu_MoveCursor(-1);
            trueIndex = ITEMS_ABOVE_TOP + PAGE_INDEX;
            if (SWITCH_MODE_ACTIVE == FALSE) // are we not currently switching items?
            {
                if (trueIndex == NUM_ITEMS) // if the cursor is on top of cancel, print the go back to prev description.
                {
                    ItemStorage_PrintItemPcResponse(ITEMPC_GO_BACK_TO_PREV);
                }
                else
                {
                    ItemStorage_PrintItemPcResponse(gSaveBlock1.pcItems[trueIndex].itemId);
                }
            }
        }
        else // the page cursor is at the top. but we may not be at the top of the true index list, so do another check.
        {
            if (ITEMS_ABOVE_TOP == 0) // did the cursor not move due to being at the top of the list?
                return;

            PlaySE(SE_SELECT);
            ITEMS_ABOVE_TOP--;
            ItemStorage_DrawBothListAndDescription(taskId);

            if (SWITCH_MODE_ACTIVE != FALSE)
                Menu_MoveCursor(0); // don't move the cursor. it's at the top of the page index, but not the true index.
        }
    }
    else if(gMain.newAndRepeatedKeys & DPAD_DOWN) // _0813A306
    {
        if(PAGE_INDEX != NUM_PAGE_ITEMS - 1)
        {
            PlaySE(SE_SELECT);
            PAGE_INDEX = Menu_MoveCursor(1);
            trueIndex = ITEMS_ABOVE_TOP + PAGE_INDEX;

            if(SWITCH_MODE_ACTIVE != FALSE)
                return;

            if (trueIndex == NUM_ITEMS)
                ItemStorage_PrintItemPcResponse(ITEMPC_GO_BACK_TO_PREV); // probably further down
            else
                ItemStorage_PrintItemPcResponse(gSaveBlock1.pcItems[trueIndex].itemId);
        }
        else if(ITEMS_ABOVE_TOP + PAGE_INDEX != NUM_ITEMS)
        {
            PlaySE(SE_SELECT);
            ITEMS_ABOVE_TOP++;
            ItemStorage_DrawBothListAndDescription(taskId);

            if (SWITCH_MODE_ACTIVE != FALSE)
                Menu_MoveCursor(0);
        }
    }
    else if(gMain.newKeys & SELECT_BUTTON) // _0813A3A0
    {
        if (SWITCH_MODE_ACTIVE == FALSE)
        {
            if (PAGE_INDEX + ITEMS_ABOVE_TOP != NUM_ITEMS) // you cannot swap the Cancel button.
            {
                PlaySE(SE_SELECT);
                SWITCH_MODE_ACTIVE = TRUE;
                SWAP_ITEM_INDEX = ITEMS_ABOVE_TOP + PAGE_INDEX;
                ItemStorage_PrintItemPcResponse(ITEMPC_SWITCH_WHICH_ITEM);
            }
            // _0813A3DC
            ItemStorage_DrawItemList(taskId);
        }
        else // _0813A3E8
        {
            PlaySE(SE_SELECT);
            ItemStorage_DoItemSwap(taskId, FALSE);
            ItemStorage_DrawBothListAndDescription(taskId);
        }
    }
    else if(gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        if(SWITCH_MODE_ACTIVE == FALSE)
        {
            if(ITEMS_ABOVE_TOP + PAGE_INDEX != NUM_ITEMS)
            {
                ItemStorage_DoItemAction(taskId);
            }
            else
            {
                ItemStorage_GoBackToPlayerPCMenu(taskId);
            }
        }
        else
        {
            ItemStorage_DoItemSwap(taskId, FALSE);
            ItemStorage_DrawBothListAndDescription(taskId);
        }
    }
    else if(gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
        if(SWITCH_MODE_ACTIVE == FALSE)
        {
            Menu_DestroyCursor();
            ItemStorage_GoBackToPlayerPCMenu(taskId);
        }
        else
        {
            ItemStorage_DoItemSwap(taskId, TRUE);
            ItemStorage_DrawBothListAndDescription(taskId);
        }
    }
}

static void ItemStorage_GoBackToPlayerPCMenu(u8 taskId)
{
    BuyMenuFreeMemory();
    DestroyVerticalScrollIndicator(TOP_ARROW);
    DestroyVerticalScrollIndicator(BOTTOM_ARROW);
    Menu_EraseWindowRect(0, 0, 29, 19);
    Menu_DisplayDialogueFrame();
    InitItemStorageMenu(TASK.CURRENT_ITEM_STORAGE_MENU);
    TASK.FUNC = ItemStorageMenuProcessInput;
}

static void ItemStorage_DoItemAction(u8 taskId)
{
    s16 *data = TASK.data;
    u8 trueIndex = PAGE_INDEX + ITEMS_ABOVE_TOP;

    PauseVerticalScrollIndicator(TOP_ARROW);
    PauseVerticalScrollIndicator(BOTTOM_ARROW);

    if(CURRENT_ITEM_STORAGE_MENU == ITEMPC_MENU_WITHDRAW)
    {
        if(gSaveBlock1.pcItems[trueIndex].quantity == 1)
        {
            NUM_QUANTITY_ROLLER = 1;
            ItemStorage_DoItemWithdraw(taskId);
            return;
        }
        else // _0813A50C
        {
            ItemStorage_PrintItemPcResponse(ITEMPC_HOW_MANY_TO_WITHDRAW);
        }
    }
    else if(gSaveBlock1.pcItems[trueIndex].quantity == 1) // _0813A518
    {
        NUM_QUANTITY_ROLLER = 1;
        ItemStorage_DoItemToss(taskId);
        return;
    }
    else
    {
        ItemStorage_PrintItemPcResponse(ITEMPC_HOW_MANY_TO_TOSS);
    }
    NUM_QUANTITY_ROLLER = 1;
    Menu_DrawStdWindowFrame(6, 8, 13, 11);
    sub_80A418C(NUM_QUANTITY_ROLLER, STR_CONV_MODE_RIGHT_ALIGN, 8, 9, 3);
    TASK.FUNC = ItemStorage_HandleQuantityRolling;
}

static void ItemStorage_HandleQuantityRolling(u8 taskId)
{
    s16 *data = TASK.data;
    u8 trueIndex = PAGE_INDEX + ITEMS_ABOVE_TOP;

    if(gMain.newAndRepeatedKeys & DPAD_UP)
    {
        if(NUM_QUANTITY_ROLLER != gSaveBlock1.pcItems[trueIndex].quantity)
            NUM_QUANTITY_ROLLER++;
        else
            NUM_QUANTITY_ROLLER = 1; // you are at the max amount of items you have when you press Up, set your quantity back to 1.

        sub_80A418C(NUM_QUANTITY_ROLLER, STR_CONV_MODE_RIGHT_ALIGN, 8, 9, 3); // print quantity?
    }
    else if(gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        if(NUM_QUANTITY_ROLLER != 1)
            NUM_QUANTITY_ROLLER--;
        else
            NUM_QUANTITY_ROLLER = gSaveBlock1.pcItems[trueIndex].quantity; // you are at 0 when you press down, set your quantity to the amount you have.

        sub_80A418C(NUM_QUANTITY_ROLLER, STR_CONV_MODE_RIGHT_ALIGN, 8, 9, 3); // print quantity?
    }
    else if(gMain.newAndRepeatedKeys & DPAD_LEFT) // reduce by 10.
    {
        NUM_QUANTITY_ROLLER -= 10;

        if(NUM_QUANTITY_ROLLER <= 0)
            NUM_QUANTITY_ROLLER = 1; // dont underflow or allow 0!

        sub_80A418C(NUM_QUANTITY_ROLLER, STR_CONV_MODE_RIGHT_ALIGN, 8, 9, 3); // print quantity?
    }
    else if(gMain.newAndRepeatedKeys & DPAD_RIGHT) // add 10.
    {
        NUM_QUANTITY_ROLLER += 10;

        if(NUM_QUANTITY_ROLLER > gSaveBlock1.pcItems[trueIndex].quantity)
            NUM_QUANTITY_ROLLER = gSaveBlock1.pcItems[trueIndex].quantity; // dont overflow!

        sub_80A418C(NUM_QUANTITY_ROLLER, STR_CONV_MODE_RIGHT_ALIGN, 8, 9, 3); // print quantity?
    }
    else if(gMain.newKeys & A_BUTTON) // confirm quantity.
    {
        PlaySE(SE_SELECT);
        Menu_EraseWindowRect(6, 6, 0xD, 0xB);

        if(CURRENT_ITEM_STORAGE_MENU == ITEMPC_MENU_WITHDRAW)
            ItemStorage_DoItemWithdraw(taskId);
        else
            ItemStorage_DoItemToss(taskId);
    }
    else if(gMain.newKeys & B_BUTTON) // cancel quantity.
    {
        PlaySE(SE_SELECT);
        Menu_EraseWindowRect(6, 6, 0xD, 0xB);
        StartVerticalScrollIndicators(TOP_ARROW);
        StartVerticalScrollIndicators(BOTTOM_ARROW);
        ItemStorage_PrintItemPcResponse(gSaveBlock1.pcItems[ITEMS_ABOVE_TOP + PAGE_INDEX].itemId); // why not use trueIndex?
        TASK.FUNC = ItemStorage_ProcessInput;
    }
}

static void ItemStorage_DoItemWithdraw(u8 taskId)
{
    s16 *data = TASK.data;
    u8 trueIndex = PAGE_INDEX + ITEMS_ABOVE_TOP;

    if(AddBagItem(gSaveBlock1.pcItems[trueIndex].itemId, NUM_QUANTITY_ROLLER) == TRUE) // add item works.
    {
        CopyItemName(gSaveBlock1.pcItems[trueIndex].itemId, gStringVar1);
        ConvertIntToDecimalStringN(gStringVar2, NUM_QUANTITY_ROLLER, 0, 3);
        ItemStorage_PrintItemPcResponse(ITEMPC_WITHDREW_THING);
        TASK.FUNC = ItemStorage_HandleRemoveItem;
    }
    else
    {
        NUM_QUANTITY_ROLLER = 0;
        ItemStorage_PrintItemPcResponse(ITEMPC_NO_MORE_ROOM);
        TASK.FUNC = ItemStorage_WaitPressHandleResumeProcessInput;
    }
}

static void ItemStorage_DoItemToss(u8 taskId)
{
    s16 *data = TASK.data;
    u8 var = PAGE_INDEX + ITEMS_ABOVE_TOP;

    if(ItemId_GetImportance(gSaveBlock1.pcItems[var].itemId) == FALSE)
    {
        CopyItemName(gSaveBlock1.pcItems[var].itemId, gStringVar1);
        ConvertIntToDecimalStringN(gStringVar2, NUM_QUANTITY_ROLLER, 0, 3);
        ItemStorage_PrintItemPcResponse(ITEMPC_OKAY_TO_THROW_AWAY);
        DisplayYesNoMenu(7, 6, 1);
        DoYesNoFuncWithChoice(taskId, (struct YesNoFuncTable *)&ResumeFromTossYesNoFuncList);
    }
    else
    {
        NUM_QUANTITY_ROLLER = 0;
        ItemStorage_PrintItemPcResponse(ITEMPC_TOO_IMPORTANT);
        TASK.FUNC = ItemStorage_HandleRemoveItem;
    }
}

static void ItemStorage_ResumeInputFromYesToss(u8 taskId)
{
    Menu_EraseWindowRect(0x6, 0x6, 0xD, 0xB);
    ItemStorage_PrintItemPcResponse(ITEMPC_THREW_AWAY_ITEM);
    TASK.FUNC = ItemStorage_HandleRemoveItem;
}

static void ItemStorage_ResumeInputFromNoToss(u8 taskId)
{
    s16 *data = TASK.data;

    Menu_EraseWindowRect(0x6, 0x6, 0xD, 0xB);
    InitMenu(0, 16, 2, NUM_PAGE_ITEMS, PAGE_INDEX, 0xD);
    StartVerticalScrollIndicators(TOP_ARROW);
    StartVerticalScrollIndicators(BOTTOM_ARROW);
    ItemStorage_PrintItemPcResponse(gSaveBlock1.pcItems[ITEMS_ABOVE_TOP + PAGE_INDEX].itemId);
    TASK.FUNC = ItemStorage_ProcessInput;
}

static void ItemStorage_HandleRemoveItem(u8 taskId)
{
    s16 *data = TASK.data;
    s16 oldNumItems;

    if(gMain.newKeys & A_BUTTON || gMain.newKeys == B_BUTTON)
    {
        RemovePCItem(PAGE_INDEX + ITEMS_ABOVE_TOP, NUM_QUANTITY_ROLLER);
        oldNumItems = NUM_ITEMS;
        NUM_ITEMS = CountUsedPCItemSlots();

        if(oldNumItems != NUM_ITEMS && oldNumItems < NUM_PAGE_ITEMS + ITEMS_ABOVE_TOP && ITEMS_ABOVE_TOP != 0)
            ITEMS_ABOVE_TOP--;

        ItemStorage_SetItemAndMailCount(taskId);
        ItemStorage_HandleResumeProcessInput(taskId);
        InitMenu(0, 16, 2, NUM_PAGE_ITEMS, PAGE_INDEX, 0xD);
    }
}

static void ItemStorage_WaitPressHandleResumeProcessInput(u8 taskId)
{
    s16 *data = TASK.data;

    if(gMain.newKeys & A_BUTTON || gMain.newKeys == B_BUTTON)
    {
        ItemStorage_PrintItemPcResponse(gSaveBlock1.pcItems[ITEMS_ABOVE_TOP + PAGE_INDEX].itemId);
        StartVerticalScrollIndicators(TOP_ARROW);
        StartVerticalScrollIndicators(BOTTOM_ARROW);
        TASK.FUNC = ItemStorage_ProcessInput;
    }
}

static void ItemStorage_HandleResumeProcessInput(u8 taskId)
{
    Menu_EraseWindowRect(0x6, 0x6, 0xD, 0xB);
    StartVerticalScrollIndicators(TOP_ARROW);
    StartVerticalScrollIndicators(BOTTOM_ARROW);
    ItemStorage_DrawBothListAndDescription(taskId);
    TASK.FUNC = ItemStorage_ProcessInput;
}

static void ItemStorage_DoItemSwap(u8 taskId, bool8 switchModeDisabled)
{
    s16 *data = TASK.data;
    u8 trueIndex = ITEMS_ABOVE_TOP + PAGE_INDEX;

    SWITCH_MODE_ACTIVE = FALSE;

    if((u8)NUM_ITEMS > trueIndex && (u8)SWAP_ITEM_INDEX != trueIndex && switchModeDisabled == FALSE)
    {
        struct ItemSlot itemSlot = gSaveBlock1.pcItems[SWAP_ITEM_INDEX]; // backup the itemSlot before swapping the two.

        gSaveBlock1.pcItems[SWAP_ITEM_INDEX] = gSaveBlock1.pcItems[trueIndex];
        gSaveBlock1.pcItems[trueIndex] = itemSlot;
        return;
    }
    else if(trueIndex == NUM_ITEMS)
    {
        ItemStorage_PrintItemPcResponse(ITEMPC_GO_BACK_TO_PREV);
    }
    else
    {
        ItemStorage_PrintItemPcResponse(gSaveBlock1.pcItems[trueIndex].itemId);
    }

    /*
    THEORY: This check produces essentially dead code, but it might have been working in an earlier build
    in which case it allows a programmer to easily duplicate items without the use of a debug menu.
    This gets the page index of the swap index for some reason. It is currently unknown what it would have been used
    for, but perhaps it was used to increase the quantity of the item without a debug menu.
    With the removal of a lot of the debug menus close to release, a programmer may have added this to
    help test things with a low key (such as planting a lot of duplicated berries, which requires this lazy "cheat")
    without bringing the relevent debug menus back. The commented out line is intentionally left in below to show
    what it may have looked like.
    */
    if(SWAP_ITEM_INDEX - ITEMS_ABOVE_TOP <= 0) { // this check is arbitrary and used to generate the correct assembly using the subtraction, which is what matters. the 0 check doesn't.
        //gSaveBlock1.pcItems[SWAP_ITEM_INDEX].quantity += 100;
        gSaveBlock1.pcItems[SWAP_ITEM_INDEX].quantity += 0; // do not enforce item cap.
    }
}

static void ItemStorage_DrawItemQuantity(u16 arg1, enum StringConvertMode arg2, u8 arg3, u8 arg4, int isSwapSelected)
{
    sub_80A4164(gStringVar1, arg1, arg2, arg4);

    if(isSwapSelected != FALSE)
        Menu_PrintText(gSelectedItemQuantityFormatText, 0x1A, arg3);
    else
        Menu_PrintText(gNonSelectedItemQuantityFormatText, 0x1A, arg3);
}

static void ItemStorage_DrawItemVoidQuantity(u8 var)
{
    Menu_PrintText(gUnknown_08406330, 0x19, var);
}

static void ItemStorage_DrawItemName(struct ItemSlot *itemSlot, u8 var, int isSwapSelected)
{
    CopyItemName(itemSlot->itemId, gStringVar1);

    if(isSwapSelected != FALSE)
        Menu_PrintText(gSelectedItemFormattedText, 16, var);
    else
        Menu_PrintText(gNonSelectedItemFormattedText, 16, var);
}

static void ItemStorage_DrawNormalItemEntry(struct ItemSlot *itemSlot, u8 var, int var2)
{
    ItemStorage_DrawItemName(itemSlot, var, var2);
    ItemStorage_DrawItemQuantity(itemSlot->quantity, STR_CONV_MODE_RIGHT_ALIGN, var, 3, var2);
}

static void ItemStorage_DrawKeyItemEntry(struct ItemSlot *itemSlot, u8 var, int var2)
{
    ItemStorage_DrawItemName(itemSlot, var, var2);
    ItemStorage_DrawItemVoidQuantity(var);
}

static void ItemStorage_DrawTMHMEntry(struct ItemSlot *itemSlot, u8 var, int var2)
{
    ItemStorage_DrawItemName(itemSlot, var, var2);

    if(itemSlot->itemId < ITEM_HM01_CUT)
        ItemStorage_DrawItemQuantity(itemSlot->quantity, STR_CONV_MODE_RIGHT_ALIGN, var, 3, var2);
    else
        ItemStorage_DrawItemVoidQuantity(var); // HMs do not have a quantity.
}

static void ItemStorage_DrawItemList(u8 taskId)
{
    s16 *data = TASK.data;
    int tempArg;
    u16 i;
    u16 yCoord = 0;

    for (i = ITEMS_ABOVE_TOP; i < ITEMS_ABOVE_TOP + NUM_PAGE_ITEMS; i++)
    {
        yCoord = (i - ITEMS_ABOVE_TOP) * 2;

        if (i == NUM_ITEMS)
        {
            sub_8072A18(gOtherText_CancelNoTerminator, 0x80, (yCoord + 2) * 8, 0x68, 1);
            break;
        }
        else
        {
            tempArg = 0;

            if (SWITCH_MODE_ACTIVE != FALSE && i == SWAP_ITEM_INDEX)
                tempArg = 1;

            switch (GetPocketByItemId(gSaveBlock1.pcItems[i].itemId) - 1)
            {
            case 0:
            case 1:
            case 3:
                ItemStorage_DrawNormalItemEntry((struct ItemSlot *)&gSaveBlock1.pcItems[i], yCoord + 2, tempArg);
                break;
            case 4:
                ItemStorage_DrawKeyItemEntry((struct ItemSlot *)&gSaveBlock1.pcItems[i], yCoord + 2, tempArg);
                break;
            case 2:
                ItemStorage_DrawTMHMEntry((struct ItemSlot *)&gSaveBlock1.pcItems[i], yCoord + 2, tempArg);
                break;
            }
        }
    }

    if (i - ITEMS_ABOVE_TOP < 8)
        Menu_BlankWindowRect(16, yCoord + 4, 0x1C, 0x12);

    if (ITEMS_ABOVE_TOP != 0)
        CreateVerticalScrollIndicators(TOP_ARROW, 0xB8, 8);
    else
        DestroyVerticalScrollIndicator(TOP_ARROW);

    if (ITEMS_ABOVE_TOP + NUM_PAGE_ITEMS <= NUM_ITEMS)
        CreateVerticalScrollIndicators(BOTTOM_ARROW, 0xB8, 0x98);
    else
        DestroyVerticalScrollIndicator(BOTTOM_ARROW);
}

static void ItemStorage_PrintItemPcResponse(u16 itemId)
{
    const u8 *string;

    switch(itemId)
    {
        case ITEMPC_GO_BACK_TO_PREV:
            string = gMenuText_GoBackToPrev;
            break;
        case ITEMPC_HOW_MANY_TO_WITHDRAW:
            string = gOtherText_HowManyToWithdraw;
            break;
        case ITEMPC_WITHDREW_THING:
            string = gOtherText_WithdrewThing;
            break;
        case ITEMPC_HOW_MANY_TO_TOSS:
            string = gOtherText_HowManyToToss;
            break;
        case ITEMPC_THREW_AWAY_ITEM:
            string = gOtherText_ThrewAwayItem;
            break;
        case ITEMPC_NO_MORE_ROOM:
            string = gOtherText_NoMoreRoom;
            break;
        case ITEMPC_TOO_IMPORTANT:
            string = gOtherText_TooImportant;
            break;
        case ITEMPC_OKAY_TO_THROW_AWAY:
            string = gOtherText_OkayToThrowAwayPrompt;
            break;
        case ITEMPC_SWITCH_WHICH_ITEM:
            string = gOtherText_SwitchWhichItem;
            break;
        default:
            string = ItemId_GetDescription(itemId);
            break;
    }

    sub_8072AB0(string, 8, 0x68, 0x68, 0x30, 1);
}

static void ItemStorage_DrawBothListAndDescription(u8 taskId)
{
    s16 *data = TASK.data;
    s16 trueIndex = ITEMS_ABOVE_TOP + PAGE_INDEX;

    ItemStorage_DrawItemList(taskId);

    if(SWITCH_MODE_ACTIVE == FALSE)
    {
        if(trueIndex == NUM_ITEMS)
            ItemStorage_PrintItemPcResponse(ITEMPC_GO_BACK_TO_PREV);
        else
            ItemStorage_PrintItemPcResponse(gSaveBlock1.pcItems[trueIndex].itemId);
    }
}

static void ItemStorage_GoBackToItemPCMenu(u8 taskId, u8 var)
{
    s16 *data = TASK.data;

    ClearVerticalScrollIndicatorPalettes();
    LoadScrollIndicatorPalette();
    ItemStorage_LoadPalette();
    Menu_DrawStdWindowFrame(0xF, 0, 0x1D, 0x13);
    Menu_DrawStdWindowFrame(0, 0xC, 0xE, 0x13);
    Menu_DrawStdWindowFrame(0, 0, 0xB, 3);
    ItemStorage_PrintItemPcResponse(gSaveBlock1.pcItems[0].itemId);
    Menu_PrintText(gPCText_ItemPCOptionsText[var].text, 1, 1);
    ItemStorage_DrawItemList(taskId);
    InitMenu(0, 0x10, 2, NUM_PAGE_ITEMS, PAGE_INDEX, 0xD);
}

static void ItemStorage_LoadPalette(void)
{
    u16 arr[] = {
        0x5294,
        0x6B5A,
        0x7FFF
    };

    LoadPalette(&arr[2], 0xDF, 2);
    LoadPalette(&arr[1], 0xD1, 2);
    LoadPalette(&arr[0], 0xD8, 2);
}

static u8 GetMailboxMailCount(void)
{
    u8 i, j;

    for(i = 0, j = 6; j < 16; j++)
        if(gSaveBlock1.mail[j].itemId != 0)
            i++;

    return i;
}

static void Mailbox_UpdateMailList(void)
{
    struct MailStruct mailBuffer;
    u8 i, j;

    for (i=6; i<15; i++)
    {
        for (j=i+1; j<16; j++)
        {
            if (gSaveBlock1.mail[i].itemId == 0)
            {
                mailBuffer = gSaveBlock1.mail[i];
                gSaveBlock1.mail[i] = gSaveBlock1.mail[j];
                gSaveBlock1.mail[j] = mailBuffer;
            }
        }
    }
}

static void Mailbox_DrawMailList(u8 taskId) // taskId is unused
{
    u16 yCoord = 0;
    u16 i;

    for (i = eMailboxInfo.itemsAbove; i < eMailboxInfo.itemsAbove + eMailboxInfo.pageItems; i++)
    {
        yCoord = (i - eMailboxInfo.itemsAbove) * 2;
        Menu_BlankWindowRect(0x15, yCoord + 2, 0x1C, yCoord + 3);
        if (i == eMailboxInfo.count)
        {
            Menu_PrintText(gOtherText_CancelNoTerminator, 0x15, yCoord + 2);
            break;
        }
        else
        {
            StringCopy(gStringVar1, gSaveBlock1.mail[i + 6].playerName);
            SanitizeNameString(gStringVar1);
            Menu_PrintText(gStringVar1, 0x15, yCoord + 2);
        }
    }

    if (i - eMailboxInfo.itemsAbove != 8)
        Menu_BlankWindowRect(0x15, yCoord + 4, 0x1C, 0x12);

    if (eMailboxInfo.itemsAbove != 0)
        CreateVerticalScrollIndicators(TOP_ARROW, 0xC8, 8);
    else
        DestroyVerticalScrollIndicator(TOP_ARROW);

    if (eMailboxInfo.itemsAbove + eMailboxInfo.pageItems <= eMailboxInfo.count)
        CreateVerticalScrollIndicators(BOTTOM_ARROW, 0xC8, 0x98);
    else
        DestroyVerticalScrollIndicator(BOTTOM_ARROW);
}

static void Mailbox_DrawMailboxMenu(u8 taskId)
{
    ClearVerticalScrollIndicatorPalettes();
    LoadScrollIndicatorPalette();
    Menu_EraseWindowRect(0, 0, 0x1D, 0x13);
    Menu_DrawStdWindowFrame(0, 0, 0x8, 0x3);
    Menu_PrintText(gPCText_Mailbox, 1, 1);
    Menu_DrawStdWindowFrame(0x14, 0, 0x1D, 0x13);
    Mailbox_DrawMailList(taskId);
    InitMenu(0, 0x15, 2, eMailboxInfo.pageItems, eMailboxInfo.cursorPos, 8);
}

// Mailbox_ProcessInput
static void Mailbox_ProcessInput(u8 taskId)
{
    if(!gPaletteFade.active)
    {
        if(gMain.newAndRepeatedKeys & DPAD_UP)
        {
            if(eMailboxInfo.cursorPos != 0)
            {
                PlaySE(SE_SELECT);
                eMailboxInfo.cursorPos = Menu_MoveCursor(-1);
            }
            else if(eMailboxInfo.itemsAbove != 0)
            {
                PlaySE(SE_SELECT);
                eMailboxInfo.itemsAbove--;
                Mailbox_DrawMailList(taskId);
            }
        }
        else if(gMain.newAndRepeatedKeys & DPAD_DOWN)
        {
            if(eMailboxInfo.cursorPos != eMailboxInfo.pageItems - 1)
            {
                PlaySE(SE_SELECT);
                eMailboxInfo.cursorPos = Menu_MoveCursor(1);
            }
            else if(eMailboxInfo.itemsAbove + eMailboxInfo.cursorPos != eMailboxInfo.count)
            {
                PlaySE(SE_SELECT);
                eMailboxInfo.itemsAbove++;
                Mailbox_DrawMailList(taskId);
            }
        }
        else if(gMain.newKeys & A_BUTTON)
        {
            Menu_DestroyCursor();
            PlaySE(SE_SELECT);

            if(eMailboxInfo.itemsAbove + eMailboxInfo.cursorPos == eMailboxInfo.count)
            {
                Mailbox_TurnOff(taskId);
            }
            else
            {
                Mailbox_CloseScrollIndicators();
                TASK.FUNC = Mailbox_PrintWhatToDoWithPlayerMailText;
            }
        }
        else if(gMain.newKeys & B_BUTTON)
        {
            Menu_DestroyCursor();
            PlaySE(SE_SELECT);
            Mailbox_TurnOff(taskId);
        }
    }
}

static void Mailbox_CloseScrollIndicators(void)
{
    BuyMenuFreeMemory();
    DestroyVerticalScrollIndicator(TOP_ARROW);
    DestroyVerticalScrollIndicator(BOTTOM_ARROW);
}

static void Mailbox_PrintWhatToDoWithPlayerMailText(u8 taskId)
{
    Menu_EraseWindowRect(0, 0, 0x1D, 0x13);
    StringCopy(gStringVar1, gSaveBlock1.mail[eMailboxInfo.itemsAbove + 6 + eMailboxInfo.cursorPos].playerName);
    SanitizeNameString(gStringVar1);
    StringExpandPlaceholders(gStringVar4, gOtherText_WhatWillYouDoMail);
    DisplayItemMessageOnField(taskId, gStringVar4, Mailbox_PrintMailOptions, 0);
}

static void Mailbox_ReturnToPlayerPC(u8 taskId)
{
    Menu_EraseWindowRect(0, 0, 0x1D, 0x13);
    ReshowPlayerPC(taskId);
}

static void Mailbox_TurnOff(u8 taskId)
{
    Mailbox_CloseScrollIndicators();
    TASK.FUNC = Mailbox_ReturnToPlayerPC;
}

static void Mailbox_PrintMailOptions(u8 taskId) // Mailbox_PrintMailOptions
{
    Menu_DrawStdWindowFrame(0, 0, 0xC, 0x9);
    Menu_PrintItems(1, 1, 4, (struct MenuAction *)gMailboxMailOptions);
    InitMenu(0, 1, 1, 4, 0, 0xB);
    TASK.FUNC = Mailbox_MailOptionsProcessInput;
}

static void Mailbox_MailOptionsProcessInput(u8 taskId)
{
    if(gMain.newAndRepeatedKeys & DPAD_UP)
    {
        PlaySE(SE_SELECT);
        Menu_MoveCursor(-1);
    }
    else if(gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        PlaySE(SE_SELECT);
        Menu_MoveCursor(1);
    }
    else if(gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        gMailboxMailOptions[Menu_GetCursorPos()].func(taskId);
    }
    else if(gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
        Mailbox_Cancel(taskId);
    }
}

static void Mailbox_DoMailRead(u8 taskId)
{
    FadeScreen(1, 0);
    TASK.FUNC = Mailbox_FadeAndReadMail;
}

static void Mailbox_FadeAndReadMail(u8 taskId)
{
    if(!gPaletteFade.active)
    {
        HandleReadMail(&gSaveBlock1.mail[eMailboxInfo.itemsAbove + 6 + eMailboxInfo.cursorPos], Mailbox_ReturnToFieldFromReadMail, 1);
        DestroyTask(taskId);
    }
}

static void Mailbox_HandleReturnToProcessInput(u8 taskId) // Mailbox_HandleReturnToProcessInput
{
    if (IsWeatherNotFadingIn() == TRUE) // is black fade finished? why not gPaletteFade.active?
        TASK.FUNC = Mailbox_ProcessInput;
}

static void Mailbox_DoRedrawMailboxMenuAfterReturn(void)
{
    Mailbox_DrawMailboxMenu(CreateTask(Mailbox_HandleReturnToProcessInput, 0));
    pal_fill_black();
}

static void Mailbox_ReturnToFieldFromReadMail(void)
{
    gFieldCallback = Mailbox_DoRedrawMailboxMenuAfterReturn;
    SetMainCallback2(c2_exit_to_overworld_2_switch);
}

static const u8 gHighlightedMoveToBagFormatText[] = _("{COLOR RED}{STR_VAR_1}");

static void Mailbox_MoveToBag(u8 taskId)
{
    Menu_DestroyCursor();
    StringCopy(gStringVar1, gOtherText_MoveToBag);
    Menu_PrintText(gHighlightedMoveToBagFormatText, 1, 3); // gHighlightedMoveToBagFormatText
    DisplayItemMessageOnField(taskId, gOtherText_MessageWillBeLost, Mailbox_DrawYesNoBeforeMove, 0);
}

static void Mailbox_DrawYesNoBeforeMove(u8 taskId)
{
    DisplayYesNoMenu(0x14, 0x8, 0x1);
    DoYesNoFuncWithChoice(taskId, (struct YesNoFuncTable *)&ResumeFromWithdrawYesNoFuncList);
}

static void Mailbox_DoMailMoveToBag(u8 taskId)
{
    struct MailStruct *mail = &gSaveBlock1.mail[eMailboxInfo.itemsAbove + 6 + eMailboxInfo.cursorPos];

    Menu_EraseWindowRect(0x14, 8, 0x1A, 0xD);

    if(AddBagItem(mail->itemId, 1) == FALSE)
    {
        DisplayItemMessageOnField(taskId, gOtherText_BagIsFull, Mailbox_DrawMailMenuAndDoProcessInput, 0);
    }
    else
    {
        DisplayItemMessageOnField(taskId, gOtherText_MailWasReturned, Mailbox_DrawMailMenuAndDoProcessInput, 0);
        ClearMailStruct(mail);
        Mailbox_UpdateMailList();

        eMailboxInfo.count--;

        if(eMailboxInfo.count < eMailboxInfo.pageItems + eMailboxInfo.itemsAbove && eMailboxInfo.itemsAbove != 0)
            eMailboxInfo.itemsAbove--;

        ItemStorage_SetItemAndMailCount(taskId);
    }
}

static void Mailbox_ReturnToInputAfterNo(u8 taskId) // Mailbox_ReturnToInputAfterNo
{
    Menu_EraseWindowRect(0x14, 0x8, 0x1A, 0xD);
    Mailbox_DrawMailMenuAndDoProcessInput(taskId);
}

static void Mailbox_Give(u8 taskId)
{
    if(CalculatePlayerPartyCount() == 0)
        Mailbox_NoPokemonForMail(taskId); // cannot be reached normally
    else
    {
        FadeScreen(1, 0);
        TASK.FUNC = Mailbox_DoGiveMailPokeMenu;
    }
}

static void Mailbox_DoGiveMailPokeMenu(u8 taskId) // Mailbox_DoGiveMailPokeMenu
{
    if(!gPaletteFade.active)
    {
        SetMainCallback2(sub_808B020);
        gPokemonItemUseType = ITEM_USE_GIVE_MAIL;
        DestroyTask(taskId);
    }
}

static void Mailbox_UpdateMailListAfterDeposit(void)
{
    u8 taskId = CreateTask(Mailbox_HandleReturnToProcessInput, 0);
    u8 oldCount = eMailboxInfo.count;

    eMailboxInfo.count = GetMailboxMailCount();
    Mailbox_UpdateMailList();

    if(oldCount != eMailboxInfo.count && eMailboxInfo.count < eMailboxInfo.pageItems + eMailboxInfo.itemsAbove && eMailboxInfo.itemsAbove != 0) // did the count update?
        eMailboxInfo.itemsAbove--;

    ItemStorage_SetItemAndMailCount(taskId);
    Mailbox_DrawMailboxMenu(taskId);
    pal_fill_black();
}

void Mailbox_ReturnToMailListAfterDeposit(void)
{
    gFieldCallback = Mailbox_UpdateMailListAfterDeposit;
    SetMainCallback2(c2_exit_to_overworld_2_switch);
}

// you always have at least 1 POKeMON and you cannot receive mail before you leave Littleroot: therefore this function cannot be reached normally.
static void Mailbox_NoPokemonForMail(u8 taskId)
{
    DisplayItemMessageOnField(taskId, gOtherText_NoPokemon, Mailbox_DrawMailMenuAndDoProcessInput, 0);
}

static void Mailbox_Cancel(u8 taskId)
{
    Menu_DestroyCursor();
    Menu_EraseWindowRect(0, 0, 0xC, 0x9);
    Mailbox_DrawMailMenuAndDoProcessInput(taskId);
}

static void Mailbox_DrawMailMenuAndDoProcessInput(u8 taskId)
{
    Mailbox_DrawMailboxMenu(taskId);
    TASK.FUNC = Mailbox_ProcessInput;
}
