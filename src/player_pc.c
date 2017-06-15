#include "global.h"
#include "asm.h"
#include "field_weather.h"
#include "item.h"
#include "items.h"
#include "main.h"
#include "menu.h"
#include "menu_helpers.h"
#include "palette.h"
#include "script.h"
#include "sound.h"
#include "string_util.h"
#include "strings.h"
#include "task.h"
#include "songs.h"
#include "name_string_util.h"
#include "mail.h"
#include "rom4.h"

// task defines
#define PAGE_INDEX data[0]
#define ITEMS_ABOVE_TOP data[1]
#define NUM_ITEMS data[2]
#define NUM_QUANTITY_ROLLER data[3]
#define NUM_PAGE_ITEMS data[4]
// not used
#define CURRENT_ITEM_STORAGE_MENU data[6]
// not used
#define SWAP_ITEM_INDEX data[8]
#define SWITCH_MODE_ACTIVE data[9]

#define NEW_GAME_PC_ITEMS(i, type) ((u16)(gNewGamePCItems + type)[i * 2])

// defined and used in the above macro
enum
{
    ITEM_ID,
    QUANTITY
};

// player PC menu options
enum
{
    PLAYERPC_MENU_ITEMSTORAGE,
    PLAYERPC_MENU_MAILBOX,
    PLAYERPC_MENU_DECORATION,
    PLAYERPC_MENU_TURNOFF
};

// item storage menus
enum
{
    ITEMPC_MENU_WITHDRAW,
    ITEMPC_MENU_DEPOSIT,
    ITEMPC_MENU_TOSS,
    ITEMPC_MENU_EXIT
};

// special item description handlers
enum
{
    ITEMPC_SWITCH_WHICH_ITEM = 0xFFF7,
    ITEMPC_OKAY_TO_THROW_AWAY,
    ITEMPC_TOO_IMPORTANT,
    ITEMPC_NO_MORE_ROOM,
    ITEMPC_THREW_AWAY_ITEM,
    ITEMPC_HOW_MANY_TO_TOSS,
    ITEMPC_WITHDREW_THING,
    ITEMPC_HOW_MANY_TO_WITHDRAW,
    ITEMPC_GO_BACK_TO_PREV
};

struct MailboxStruct
{
 /*0x00*/ u8 cursorPos;
 /*0x01*/ u8 pageItems; // number of items (not including Cancel) on the current page.
 /*0x02*/ u8 itemsAbove; // number of items above the top item on the page.
 /*0x03*/ u8 count; // total number of items in mailbox storage.
};

extern struct MailboxStruct gMailboxInfo;

extern void DisplayItemMessageOnField(u8, const u8*, TaskFunc, u16);
extern void DoPlayerPCDecoration(u8);
extern void BuyMenuFreeMemory(void);
extern void DestroyVerticalScrollIndicator(u8);
extern void sub_80A6A30(void);
extern u8 sub_807D770(void);
extern void sub_80F996C(u8);
extern void sub_80A418C(u16, enum StringConvertMode, int, int, int);
extern void sub_80F98DC(int);
extern void sub_80A4164(u8 *, u16, enum StringConvertMode, u8);
extern void CreateVerticalScrollIndicators(u32, u32, u32); // unknown args
extern void sub_80F944C(void);
extern void LoadScrollIndicatorPalette(void);
extern void ClearMailStruct(struct MailStruct *);
extern void sub_808B020(void);

extern u16 gNewGamePCItems[];
extern u16 gUnknown_08406334[3];

extern u8 *gPcItemMenuOptionOrder;
extern struct MenuAction gPCText_PlayerPCOptionsText[];

extern u8 gBedroomPC_OptionOrder[];
extern u8 gPlayerPC_OptionOrder[];
extern u8 gUnknown_0840632A[];
extern u8 gUnknown_08406327[];
extern u8 gUnknown_08406330[];
extern u8 gUnknown_0840631E[];
extern u8 gUnknown_08406318[];
extern u8 gUnknown_0840633A[];

extern u8 gPcItemMenuOptionsNum;

extern u8 gUnknown_02038561;
extern u8 gUnknown_08152850;
extern u8 gUnknown_08152C75;

extern void (*gUnknown_0300485C)(void);

extern u32 gPCText_OptionDescList[];
extern const struct MenuAction gPCText_ItemPCOptionsText[];
extern const struct MenuAction gUnknown_084062F8[];
extern const struct YesNoFuncTable gUnknown_084062E0;
extern const struct YesNoFuncTable gUnknown_084062E8;

void InitPlayerPCMenu(u8 taskId);
void PlayerPCProcessMenuInput(u8 taskId);
void InitItemStorageMenu(u8);
void ItemStorageMenuPrint(u8 *);
void ItemStorageMenuProcessInput(u8);
void ItemStorage_ProcessInput(u8);
void ItemStorage_SetItemAndMailCount(u8);
void ItemStorage_DoItemAction(u8);
void ItemStorage_GoBackToPlayerPCMenu(u8);
void ItemStorage_HandleQuantityRolling(u8);
void ItemStorage_DoItemWithdraw(u8);
void ItemStorage_DoItemToss(u8);
void ItemStorage_HandleRemoveItem(u8);
void ItemStorage_WaitPressHandleResumeProcessInput(u8);
void ItemStorage_HandleResumeProcessInput(u8);
void ItemStorage_DoItemSwap(u8, bool8);
void ItemStorage_DrawItemList(u8);
void ItemStorage_PrintItemPcResponse(u16);
void ItemStorage_DrawBothListAndDescription(u8);
void ItemStorage_GoBackToItemPCMenu(u8, u8);
void ItemStorage_LoadPalette(void);
u8 GetMailboxMailCount(void);
void Mailbox_UpdateMailList(void);
void Mailbox_DrawMailboxMenu(u8);
void Mailbox_ProcessInput(u8);
void sub_813B27C(void);
void sub_813B294(u8);
void sub_813B320(u8);
void sub_813B348(u8);
void sub_813B3A0(u8);
void sub_813B454(u8);
void sub_813B4F0(void);
void sub_813B554(u8);
void sub_813B66C(u8);
void sub_813B718(u8);
void Mailbox_Cancel(u8);
void sub_813B758(u8);

void NewGameInitPCItems(void)
{
    u8 i;

    // because Game Freak don't know how to use a struct or a 2d array
    for(i = 0, ClearItemSlots(gSaveBlock1.pcItems, ARRAY_COUNT(gSaveBlock1.pcItems)); NEW_GAME_PC_ITEMS(i, ITEM_ID) && NEW_GAME_PC_ITEMS(i, QUANTITY) &&
        AddPCItem(NEW_GAME_PC_ITEMS(i, ITEM_ID), NEW_GAME_PC_ITEMS(i, QUANTITY)) == TRUE; i++)
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

void InitPlayerPCMenu(u8 taskId)
{
    MenuDrawTextWindow(0, 0, 10, gPcItemMenuOptionsNum * 2 + 1);
    PrintMenuItemsReordered(1, 1, gPcItemMenuOptionsNum, gPCText_PlayerPCOptionsText, gPcItemMenuOptionOrder);
    InitMenu(0, 1, 1, gPcItemMenuOptionsNum, 0, 9);
    gTasks[taskId].func = PlayerPCProcessMenuInput;
}

void PlayerPCProcessMenuInput(u8 taskId)
{
    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        PlaySE(SE_SELECT);
        MoveMenuCursor(-1);
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        PlaySE(SE_SELECT);
        MoveMenuCursor(1);
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        HandleDestroyMenuCursors();
        PlaySE(SE_SELECT);
        gPCText_PlayerPCOptionsText[gPcItemMenuOptionOrder[GetMenuCursorPos()]].func(taskId);
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        HandleDestroyMenuCursors();
        PlaySE(SE_SELECT);
        gPCText_PlayerPCOptionsText[gPcItemMenuOptionsNum[gPcItemMenuOptionOrder - 1]].func(taskId); // run EXIT.
    }
}

void ReshowPlayerPC(u8 var)
{
    DisplayItemMessageOnField(var, gOtherText_WhatWillYouDo, InitPlayerPCMenu, 0);
}

void PlayerPC_ItemStorage(u8 taskId)
{
    InitItemStorageMenu(0);
    gTasks[taskId].func = ItemStorageMenuProcessInput;
}

void PlayerPC_Mailbox(u8 taskId)
{
    MenuZeroFillWindowRect(0, 0, 10, 9);
    gMailboxInfo.count = GetMailboxMailCount();

    if (gMailboxInfo.count == 0)
        DisplayItemMessageOnField(taskId, gOtherText_NoMailHere, ReshowPlayerPC, 0);
    else
    {
        gMailboxInfo.cursorPos = 0;
        gMailboxInfo.itemsAbove = 0;
        Mailbox_UpdateMailList();
        ItemStorage_SetItemAndMailCount(taskId);
        Mailbox_DrawMailboxMenu(taskId);
        gTasks[taskId].func = Mailbox_ProcessInput;
    }
}

void PlayerPC_Decoration(u8 var)
{
    MenuZeroFillWindowRect(0, 0, 10, 9);
    DoPlayerPCDecoration(var);
}

void PlayerPC_TurnOff(u8 taskId)
{
    if (gPcItemMenuOptionsNum == 4) // if the option count is 4, we are at the bedroom PC and not player PC, so do gender specific handling.
    {
        MenuZeroFillWindowRect(0, 0, 0x1D, 0x13);

        if (gSaveBlock2.playerGender == MALE)
            ScriptContext1_SetupScript(&gUnknown_08152850);
        else
            ScriptContext1_SetupScript(&gUnknown_08152C75);
    }
    else
    {
        MenuZeroFillWindowRect(0, 0, 10, 9);
        EnableBothScriptContexts();
    }
    DestroyTask(taskId);
}

void InitItemStorageMenu(u8 var)
{
    MenuZeroFillWindowRect(0, 0, 10, 9);
    MenuDrawTextWindow(0, 0, 11, 9);
    PrintMenuItems(1, 1, 4, gPCText_ItemPCOptionsText);
    InitMenu(0, 1, 1, 4, var, 10);
    ItemStorageMenuPrint((u8 *)gPCText_OptionDescList[var]);
}

void ItemStorageMenuPrint(u8 *textPtr)
{
    MenuFillWindowRectWithBlankTile(2, 15, 27, 18);
    MenuPrint(textPtr, 2, 15);
}

void ItemStorageMenuProcessInput(u8 var)
{
    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        PlaySE(SE_SELECT);
        MoveMenuCursor(-1);
        ItemStorageMenuPrint((u8 *)gPCText_OptionDescList[GetMenuCursorPos()]);
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        PlaySE(SE_SELECT);
        MoveMenuCursor(1);
        ItemStorageMenuPrint((u8 *)gPCText_OptionDescList[GetMenuCursorPos()]);
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        gPCText_ItemPCOptionsText[GetMenuCursorPos()].func(var);
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        HandleDestroyMenuCursors();
        PlaySE(SE_SELECT);
        gPCText_ItemPCOptionsText[ITEMPC_MENU_EXIT].func(var);
    }
}

void Task_ItemStorage_Deposit(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        sub_80A6A30();
        DestroyTask(taskId);
    }
}

void ItemStorage_Deposit(u8 taskId)
{
    gTasks[taskId].func = Task_ItemStorage_Deposit;
    fade_screen(1, 0);
}

void sub_813A0C8(u8 taskId)
{
    if (sub_807D770() == 1)
        gTasks[taskId].func = ItemStorageMenuProcessInput;
}

void sub_813A0F8(void)
{
    MenuDisplayMessageBox();
    InitItemStorageMenu(1);
    CreateTask(sub_813A0C8, 0);
    pal_fill_black();
}

void ItemStorage_Withdraw(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(0, 0, 11, 9);
    NUM_ITEMS = CountUsedPCItemSlots();

    if (NUM_ITEMS != 0)
    {
        MenuZeroFillWindowRect(0, 14, 29, 19);
        CURRENT_ITEM_STORAGE_MENU = ITEMPC_MENU_WITHDRAW;
        PAGE_INDEX = 0;
        ITEMS_ABOVE_TOP = 0;
        ItemStorage_SetItemAndMailCount(taskId);
        ItemStorage_GoBackToItemPCMenu(taskId, 0);
        gTasks[taskId].func = ItemStorage_ProcessInput;
    }
    else
        DisplayItemMessageOnField(taskId, gOtherText_NoItems, PlayerPC_ItemStorage, 0);
}

void ItemStorage_Toss(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(0, 0, 11, 9);
    NUM_ITEMS = CountUsedPCItemSlots();

    if (NUM_ITEMS)
    {
        MenuZeroFillWindowRect(0, 14, 29, 19);
        CURRENT_ITEM_STORAGE_MENU = ITEMPC_MENU_TOSS;
        PAGE_INDEX = 0;
        ITEMS_ABOVE_TOP = 0;
        ItemStorage_SetItemAndMailCount(taskId);
        ItemStorage_GoBackToItemPCMenu(taskId, 2);
        gTasks[taskId].func = ItemStorage_ProcessInput;
    }
    else
        DisplayItemMessageOnField(taskId, gOtherText_NoItems, PlayerPC_ItemStorage, 0);
}

void ItemStorage_Exit(u8 var)
{
    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(0, 0, 11, 9);
    ReshowPlayerPC(var);
}

void ItemStorage_SetItemAndMailCount(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (NUM_ITEMS > 7) // we have a full page, so set the num of page items appropriately.
        NUM_PAGE_ITEMS = 8;
    else
        NUM_PAGE_ITEMS = NUM_ITEMS + 1; // there are not enough items to fill a full page; take the # of items and add 1 for the cancel button.

    if (gMailboxInfo.count > 7)
        gMailboxInfo.pageItems = 8;
    else
        gMailboxInfo.pageItems = gMailboxInfo.count + 1;
}

void ItemStorage_ProcessInput(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    s16 trueIndex;

    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        if(PAGE_INDEX != 0) // did the cursor move physically upwards?
        {
            PlaySE(SE_SELECT);
            PAGE_INDEX = MoveMenuCursor(-1);
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
                MoveMenuCursor(0); // don't move the cursor. it's at the top of the page index, but not the true index.
        }
    }
    else if(gMain.newAndRepeatedKeys & DPAD_DOWN) // _0813A306
    {
        if(PAGE_INDEX != NUM_PAGE_ITEMS - 1)
        {
            PlaySE(SE_SELECT);
            PAGE_INDEX = MoveMenuCursor(1);
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
                MoveMenuCursor(0);
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
            HandleDestroyMenuCursors();
            ItemStorage_GoBackToPlayerPCMenu(taskId);
        }
        else
        {
            ItemStorage_DoItemSwap(taskId, TRUE);
            ItemStorage_DrawBothListAndDescription(taskId);
        }
    }
}

void ItemStorage_GoBackToPlayerPCMenu(u8 taskId)
{
    BuyMenuFreeMemory();
    DestroyVerticalScrollIndicator(0);
    DestroyVerticalScrollIndicator(1);
    MenuZeroFillWindowRect(0, 0, 29, 19);
    MenuDisplayMessageBox();
    InitItemStorageMenu(gTasks[taskId].CURRENT_ITEM_STORAGE_MENU);
    gTasks[taskId].func = ItemStorageMenuProcessInput;
}

void ItemStorage_DoItemAction(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u8 trueIndex = PAGE_INDEX + ITEMS_ABOVE_TOP;

    sub_80F996C(0);
    sub_80F996C(1);

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
    MenuDrawTextWindow(6, 8, 13, 11);
    sub_80A418C(NUM_QUANTITY_ROLLER, STR_CONV_MODE_RIGHT_ALIGN, 8, 9, 3);
    gTasks[taskId].func = ItemStorage_HandleQuantityRolling;
}

void ItemStorage_HandleQuantityRolling(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
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
        MenuZeroFillWindowRect(6, 6, 0xD, 0xB);

        if(CURRENT_ITEM_STORAGE_MENU == ITEMPC_MENU_WITHDRAW)
            ItemStorage_DoItemWithdraw(taskId);
        else
            ItemStorage_DoItemToss(taskId);
    }
    else if(gMain.newKeys & B_BUTTON) // cancel quantity.
    {
        PlaySE(SE_SELECT);
        MenuZeroFillWindowRect(6, 6, 0xD, 0xB);
        sub_80F98DC(0);
        sub_80F98DC(1);
        ItemStorage_PrintItemPcResponse(gSaveBlock1.pcItems[ITEMS_ABOVE_TOP + PAGE_INDEX].itemId); // why not use trueIndex?
        gTasks[taskId].func = ItemStorage_ProcessInput;
    }
}

void ItemStorage_DoItemWithdraw(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u8 trueIndex = PAGE_INDEX + ITEMS_ABOVE_TOP;

    if(AddBagItem(gSaveBlock1.pcItems[trueIndex].itemId, NUM_QUANTITY_ROLLER) == TRUE) // add item works.
    {
        CopyItemName(gSaveBlock1.pcItems[trueIndex].itemId, gStringVar1);
        ConvertIntToDecimalStringN(gStringVar2, NUM_QUANTITY_ROLLER, 0, 3);
        ItemStorage_PrintItemPcResponse(ITEMPC_WITHDREW_THING);
        gTasks[taskId].func = ItemStorage_HandleRemoveItem;
    }
    else
    {
        NUM_QUANTITY_ROLLER = 0;
        ItemStorage_PrintItemPcResponse(ITEMPC_NO_MORE_ROOM);
        gTasks[taskId].func = ItemStorage_WaitPressHandleResumeProcessInput;
    }
}

void ItemStorage_DoItemToss(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u8 var = PAGE_INDEX + ITEMS_ABOVE_TOP;

    if(ItemId_GetImportance(gSaveBlock1.pcItems[var].itemId) == FALSE)
    {
        CopyItemName(gSaveBlock1.pcItems[var].itemId, gStringVar1);
        ConvertIntToDecimalStringN(gStringVar2, NUM_QUANTITY_ROLLER, 0, 3);
        ItemStorage_PrintItemPcResponse(ITEMPC_OKAY_TO_THROW_AWAY);
        DisplayYesNoMenu(7, 6, 1);
        sub_80F914C(taskId, &gUnknown_084062E0);
    }
    else
    {
        NUM_QUANTITY_ROLLER = 0;
        ItemStorage_PrintItemPcResponse(ITEMPC_TOO_IMPORTANT);
        gTasks[taskId].func = ItemStorage_HandleRemoveItem;
    }
}

void ItemStorage_ResumeInputFromYesToss(u8 taskId)
{
    MenuZeroFillWindowRect(0x6, 0x6, 0xD, 0xB);
    ItemStorage_PrintItemPcResponse(ITEMPC_THREW_AWAY_ITEM);
    gTasks[taskId].func = ItemStorage_HandleRemoveItem;
}

void ItemStorage_ResumeInputFromNoToss(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    MenuZeroFillWindowRect(0x6, 0x6, 0xD, 0xB);
    InitMenu(0, 16, 2, NUM_PAGE_ITEMS, PAGE_INDEX, 0xD);
    sub_80F98DC(0);
    sub_80F98DC(1);
    ItemStorage_PrintItemPcResponse(gSaveBlock1.pcItems[ITEMS_ABOVE_TOP + PAGE_INDEX].itemId);
    gTasks[taskId].func = ItemStorage_ProcessInput;
}

void ItemStorage_HandleRemoveItem(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
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

void ItemStorage_WaitPressHandleResumeProcessInput(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if(gMain.newKeys & A_BUTTON || gMain.newKeys == B_BUTTON)
    {
        ItemStorage_PrintItemPcResponse(gSaveBlock1.pcItems[ITEMS_ABOVE_TOP + PAGE_INDEX].itemId);
        sub_80F98DC(0);
        sub_80F98DC(1);
        gTasks[taskId].func = ItemStorage_ProcessInput;
    }
}

void ItemStorage_HandleResumeProcessInput(u8 taskId)
{
    MenuZeroFillWindowRect(0x6, 0x6, 0xD, 0xB);
    sub_80F98DC(0);
    sub_80F98DC(1);
    ItemStorage_DrawBothListAndDescription(taskId);
    gTasks[taskId].func = ItemStorage_ProcessInput;
}

void ItemStorage_DoItemSwap(u8 taskId, bool8 switchModeDisabled)
{
    s16 *data = gTasks[taskId].data;
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

void ItemStorage_DrawItemQuantity(u16 arg1, enum StringConvertMode arg2, u8 arg3, u8 arg4, int isSwapSelected)
{
    sub_80A4164(gStringVar1, arg1, arg2, arg4);

    if(isSwapSelected != FALSE)
        MenuPrint(gUnknown_0840632A, 0x1A, arg3);
    else
        MenuPrint(gUnknown_08406327, 0x1A, arg3);
}

void ItemStorage_DrawItemVoidQuantity(u8 var)
{
    MenuPrint(gUnknown_08406330, 0x19, var);
}

void ItemStorage_DrawItemName(struct ItemSlot *itemSlot, u8 var, int isSwapSelected)
{
    CopyItemName(itemSlot->itemId, gStringVar1);

    if(isSwapSelected != FALSE)
        MenuPrint(gUnknown_0840631E, 16, var);
    else
        MenuPrint(gUnknown_08406318, 16, var);
}

void ItemStorage_DrawNormalItemEntry(struct ItemSlot *itemSlot, u8 var, int var2)
{
    ItemStorage_DrawItemName(itemSlot, var, var2);
    ItemStorage_DrawItemQuantity(itemSlot->quantity, STR_CONV_MODE_RIGHT_ALIGN, var, 3, var2);
}

void ItemStorage_DrawKeyItemEntry(struct ItemSlot *itemSlot, u8 var, int var2)
{
    ItemStorage_DrawItemName(itemSlot, var, var2);
    ItemStorage_DrawItemVoidQuantity(var);
}

void ItemStorage_DrawTMHMEntry(struct ItemSlot *itemSlot, u8 var, int var2)
{
    ItemStorage_DrawItemName(itemSlot, var, var2);

    if(itemSlot->itemId < ITEM_HM01)
        ItemStorage_DrawItemQuantity(itemSlot->quantity, STR_CONV_MODE_RIGHT_ALIGN, var, 3, var2);
    else
        ItemStorage_DrawItemVoidQuantity(var); // HMs do not have a quantity.
}

void ItemStorage_DrawItemList(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    int tempArg;
    u16 i;
    u16 yCoord = 0;

    // r5 is i and is unsigned 16-bit.

    for(i = ITEMS_ABOVE_TOP; i < ITEMS_ABOVE_TOP + NUM_PAGE_ITEMS; i++)
    {
        yCoord = (i - ITEMS_ABOVE_TOP) * 2;

        if(i != NUM_ITEMS)
        {
            tempArg = 0;

            if(SWITCH_MODE_ACTIVE != FALSE && i == SWAP_ITEM_INDEX)
                tempArg = 1;

            switch(GetPocketByItemId(gSaveBlock1.pcItems[i].itemId) - 1)
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
        else
        {
            goto weirdCase; // what???
        }
    }

beforeLabel:
    if(i - ITEMS_ABOVE_TOP < 8)
        MenuFillWindowRectWithBlankTile(16, yCoord + 4, 0x1C, 0x12);

    switch(ITEMS_ABOVE_TOP)
    {
    default:
        CreateVerticalScrollIndicators(0, 0xB8, 8);
        break;
weirdCase:
        sub_8072A18(gOtherText_CancelNoTerminator, 0x80, (yCoord + 2) * 8, 0x68, 1);
        goto beforeLabel;
    case 0:
        DestroyVerticalScrollIndicator(0);
        break;
    }

    if(ITEMS_ABOVE_TOP + NUM_PAGE_ITEMS <= NUM_ITEMS)
        CreateVerticalScrollIndicators(1, 0xB8, 0x98);
    else
        DestroyVerticalScrollIndicator(1);
}

void ItemStorage_PrintItemPcResponse(u16 itemId)
{
    u8 *string;

    switch(itemId)
    {
        case ITEMPC_GO_BACK_TO_PREV:
            string = (u8 *)gMenuText_GoBackToPrev;
            break;
        case ITEMPC_HOW_MANY_TO_WITHDRAW:
            string = (u8 *)gOtherText_HowManyToWithdraw;
            break;
        case ITEMPC_WITHDREW_THING:
            string = (u8 *)gOtherText_WithdrewThing;
            break;
        case ITEMPC_HOW_MANY_TO_TOSS:
            string = (u8 *)gOtherText_HowManyToToss;
            break;
        case ITEMPC_THREW_AWAY_ITEM:
            string = (u8 *)gOtherText_ThrewAwayItem;
            break;
        case ITEMPC_NO_MORE_ROOM:
            string = (u8 *)gOtherText_NoMoreRoom;
            break;
        case ITEMPC_TOO_IMPORTANT:
            string = (u8 *)gOtherText_TooImportant;
            break;
        case ITEMPC_OKAY_TO_THROW_AWAY:
            string = (u8 *)gOtherText_OkayToThrowAwayPrompt;
            break;
        case ITEMPC_SWITCH_WHICH_ITEM:
            string = (u8 *)gOtherText_SwitchWhichItem;
            break;
        default:
            string = ItemId_GetDescription(itemId);
            break;
    }

    sub_8072AB0(string, 8, 0x68, 0x68, 0x30, 1);
}

void ItemStorage_DrawBothListAndDescription(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
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

void ItemStorage_GoBackToItemPCMenu(u8 taskId, u8 var)
{
    s16 *data = gTasks[taskId].data;

    sub_80F944C();
    LoadScrollIndicatorPalette();
    ItemStorage_LoadPalette();
    MenuDrawTextWindow(0xF, 0, 0x1D, 0x13);
    MenuDrawTextWindow(0, 0xC, 0xE, 0x13);
    MenuDrawTextWindow(0, 0, 0xB, 3);
    ItemStorage_PrintItemPcResponse(gSaveBlock1.pcItems[0].itemId);
    MenuPrint(gPCText_ItemPCOptionsText[var].text, 1, 1);
    ItemStorage_DrawItemList(taskId);
    InitMenu(0, 0x10, 2, NUM_PAGE_ITEMS, PAGE_INDEX, 0xD);
}

void ItemStorage_LoadPalette(void)
{
    u16 arr[3];

    memcpy(arr, gUnknown_08406334, sizeof(arr));
    LoadPalette(&arr[2], 0xDF, 2);
    LoadPalette(&arr[1], 0xD1, 2);
    LoadPalette(&arr[0], 0xD8, 2);
}

u8 GetMailboxMailCount(void)
{
    u8 i, j;

    for(i = 0, j = 6; j < 16; j++)
        if(gSaveBlock1.mail[j].itemId != 0)
            i++;

    return i;
}

void Mailbox_UpdateMailList(void)
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

// WWHHHHHYYYYYYYY SOMEBODY PLEASE FIX THIS
void Mailbox_DrawMailList(u8 taskId) // taskId is unused
{
    u16 yCoord = 0;
    u16 i = gMailboxInfo.itemsAbove;
    register struct MailboxStruct *tempMailbox asm("r1") = &gMailboxInfo;
    register struct MailboxStruct *mailbox asm("r6");

    if(i < i + tempMailbox->pageItems)
    {
        mailbox = tempMailbox;
        goto forJump;
    for(; i < mailbox->itemsAbove + mailbox->pageItems; i++)
    {
    forJump:
        yCoord = (i - mailbox->itemsAbove) * 2;
        MenuFillWindowRectWithBlankTile(0x15, yCoord + 2, 0x1C, yCoord + 3);

        if(i != mailbox->count)
        {
            StringCopy(gStringVar1, (u8 *)gSaveBlock1.mail[i + 6].playerName);
            SanitizeNameString(gStringVar1);
            MenuPrint(gStringVar1, 0x15, yCoord + 2);
        }
        else
        {
            goto weirdCase; // again, what???
        }
    }
    }

beforeLabel:
    if(i - gMailboxInfo.itemsAbove != 8)
        MenuFillWindowRectWithBlankTile(0x15, yCoord + 4, 0x1C, 0x12);

    switch(gMailboxInfo.itemsAbove)
    {
    default:
        CreateVerticalScrollIndicators(0, 0xC8, 8);
        break;
weirdCase:
        MenuPrint(gOtherText_CancelNoTerminator, 0x15, yCoord + 2);
        goto beforeLabel;
    case 0:
        DestroyVerticalScrollIndicator(0);
        break;
    }

    if(gMailboxInfo.itemsAbove + gMailboxInfo.pageItems <= gMailboxInfo.count)
        CreateVerticalScrollIndicators(1, 0xC8, 0x98);
    else
        DestroyVerticalScrollIndicator(1);
}

void Mailbox_DrawMailboxMenu(u8 taskId)
{
    sub_80F944C();
    LoadScrollIndicatorPalette();
    MenuZeroFillWindowRect(0, 0, 0x1D, 0x13);
    MenuDrawTextWindow(0, 0, 0x8, 0x3);
    MenuPrint(gPCText_Mailbox, 1, 1);
    MenuDrawTextWindow(0x14, 0, 0x1D, 0x13);
    Mailbox_DrawMailList(taskId);
    InitMenu(0, 0x15, 2, gMailboxInfo.pageItems, gMailboxInfo.cursorPos, 8);
}

// Mailbox_ProcessInput
void Mailbox_ProcessInput(u8 taskId)
{
    if(!gPaletteFade.active)
    {
        if(gMain.newAndRepeatedKeys & DPAD_UP)
        {
            if(gMailboxInfo.cursorPos != 0)
            {
                PlaySE(5);
                gMailboxInfo.cursorPos = MoveMenuCursor(-1);
            }
            else if(gMailboxInfo.itemsAbove != 0)
            {
                PlaySE(5);
                gMailboxInfo.itemsAbove--;
                Mailbox_DrawMailList(taskId);
            }
        }
        else if(gMain.newAndRepeatedKeys & DPAD_DOWN)
        {
            if(gMailboxInfo.cursorPos != gMailboxInfo.pageItems - 1)
            {
                PlaySE(5);
                gMailboxInfo.cursorPos = MoveMenuCursor(1);
            }
            else if(gMailboxInfo.itemsAbove + gMailboxInfo.cursorPos != gMailboxInfo.count)
            {
                PlaySE(5);
                gMailboxInfo.itemsAbove++;
                Mailbox_DrawMailList(taskId);
            }
        }
        else if(gMain.newKeys & A_BUTTON)
        {
            HandleDestroyMenuCursors();
            PlaySE(5);

            if(gMailboxInfo.itemsAbove + gMailboxInfo.cursorPos == gMailboxInfo.count)
            {
                sub_813B320(taskId);
            }
            else
            {
                sub_813B27C();
                gTasks[taskId].func = sub_813B294;
            }
        }
        else if(gMain.newKeys & B_BUTTON)
        {
            HandleDestroyMenuCursors();
            PlaySE(5);
            sub_813B320(taskId);
        }
    }
}

void sub_813B27C(void)
{
    BuyMenuFreeMemory();
    DestroyVerticalScrollIndicator(0);
    DestroyVerticalScrollIndicator(1);
}

void sub_813B294(u8 taskId)
{
    MenuZeroFillWindowRect(0, 0, 0x1D, 0x13);
    StringCopy(gStringVar1, gSaveBlock1.mail[gMailboxInfo.itemsAbove + 6 + gMailboxInfo.cursorPos].playerName);
    SanitizeNameString(gStringVar1);
    StringExpandPlaceholders(gStringVar4, gOtherText_WhatWillYouDoMail);
    DisplayItemMessageOnField(taskId, gStringVar4, sub_813B348, 0);
}

void sub_813B300(u8 taskId)
{
    MenuZeroFillWindowRect(0, 0, 0x1D, 0x13);
    ReshowPlayerPC(taskId);
}

void sub_813B320(u8 taskId)
{
    sub_813B27C();
    gTasks[taskId].func = sub_813B300;
}

void sub_813B348(u8 taskId)
{
    MenuDrawTextWindow(0, 0, 0xC, 0x9);
    PrintMenuItems(1, 1, 4, gUnknown_084062F8);
    InitMenu(0, 1, 1, 4, 0, 0xB);
    gTasks[taskId].func = sub_813B3A0;
}

void sub_813B3A0(u8 taskId)
{
    if(gMain.newAndRepeatedKeys & DPAD_UP)
    {
        PlaySE(5);
        MoveMenuCursor(-1);
    }
    else if(gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        PlaySE(5);
        MoveMenuCursor(1);
    }
    else if(gMain.newKeys & A_BUTTON)
    {
        PlaySE(5);
        gUnknown_084062F8[GetMenuCursorPos()].func(taskId);
    }
    else if(gMain.newKeys & B_BUTTON)
    {
        PlaySE(5);
        Mailbox_Cancel(taskId);
    }
}

void Mailbox_Read(u8 taskId)
{
    fade_screen(1, 0);
    gTasks[taskId].func = sub_813B454;
}

void sub_813B454(u8 taskId)
{
    if(!gPaletteFade.active)
    {
        HandleReadMail(&gSaveBlock1.mail[gMailboxInfo.itemsAbove + 6 + gMailboxInfo.cursorPos], sub_813B4F0, 1);
        DestroyTask(taskId);
    }
}

void sub_813B4A0(u8 taskId)
{
    if(sub_807D770() == TRUE)
        gTasks[taskId].func = Mailbox_ProcessInput;
}

void sub_813B4D0(void)
{
    Mailbox_DrawMailboxMenu(CreateTask(sub_813B4A0, 0));
    pal_fill_black();
}

void sub_813B4F0(void)
{
    gUnknown_0300485C = sub_813B4D0;
    SetMainCallback2(c2_exit_to_overworld_2_switch);
}

void Mailbox_MoveToBag(u8 taskId)
{
    HandleDestroyMenuCursors();
    StringCopy(gStringVar1, gOtherText_MoveToBag);
    MenuPrint(gUnknown_0840633A, 1, 3);
    DisplayItemMessageOnField(taskId, gOtherText_MessageWillBeLost, sub_813B554, 0);
}

void sub_813B554(u8 taskId)
{
    DisplayYesNoMenu(0x14, 0x8, 0x1);
    sub_80F914C(taskId, &gUnknown_084062E8);
}

void sub_813B578(u8 taskId)
{
    struct MailStruct *mail = &gSaveBlock1.mail[gMailboxInfo.itemsAbove + 6 + gMailboxInfo.cursorPos];

    MenuZeroFillWindowRect(0x14, 8, 0x1A, 0xD);

    if(AddBagItem(mail->itemId, 1) == FALSE)
    {
        DisplayItemMessageOnField(taskId, gOtherText_BagIsFull, sub_813B758, 0);
    }
    else
    {
        DisplayItemMessageOnField(taskId, gOtherText_MailWasReturned, sub_813B758, 0);
        ClearMailStruct(mail);
        Mailbox_UpdateMailList();

        gMailboxInfo.count--;

        if(gMailboxInfo.count < gMailboxInfo.pageItems + gMailboxInfo.itemsAbove && gMailboxInfo.itemsAbove != 0)
            gMailboxInfo.itemsAbove--;

        ItemStorage_SetItemAndMailCount(taskId);
    }
}

void sub_813B610(u8 taskId)
{
    MenuZeroFillWindowRect(0x14, 0x8, 0x1A, 0xD);
    sub_813B758(taskId);
}

void Mailbox_Give(u8 taskId)
{
    if(CalculatePlayerPartyCount() == 0)
        sub_813B718(taskId);
    else
    {
        fade_screen(1, 0);
        gTasks[taskId].func = sub_813B66C;
    }
}

void sub_813B66C(u8 taskId)
{
    if(!gPaletteFade.active)
    {
        SetMainCallback2(sub_808B020);
        gUnknown_02038561 = 3;
        DestroyTask(taskId);
    }
}

void sub_813B6A4(void)
{
    u8 taskId = CreateTask(sub_813B4A0, 0);
    u8 oldCount = gMailboxInfo.count;

    gMailboxInfo.count = GetMailboxMailCount();
    Mailbox_UpdateMailList();

    if(oldCount != gMailboxInfo.count && gMailboxInfo.count < gMailboxInfo.pageItems + gMailboxInfo.itemsAbove && gMailboxInfo.itemsAbove != 0) // did the count update?
        gMailboxInfo.itemsAbove--;

    ItemStorage_SetItemAndMailCount(taskId);
    Mailbox_DrawMailboxMenu(taskId);
    pal_fill_black();
}

void sub_813B6F8(void)
{
    gUnknown_0300485C = sub_813B6A4;
    SetMainCallback2(c2_exit_to_overworld_2_switch);
}

void sub_813B718(u8 taskId)
{
    DisplayItemMessageOnField(taskId, gOtherText_NoPokemon, sub_813B758, 0);
}

void Mailbox_Cancel(u8 taskId)
{
    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(0, 0, 0xC, 0x9);
    sub_813B758(taskId);
}

void sub_813B758(u8 taskId)
{
    Mailbox_DrawMailboxMenu(taskId);
    gTasks[taskId].func = Mailbox_ProcessInput;
}
