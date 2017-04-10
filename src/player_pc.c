#include "global.h"
#include "asm.h"
#include "item.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "script.h"
#include "sound.h"
#include "string_util.h"
#include "task.h"
#include "field_screeneffect.h"

#define NEW_GAME_PC_ITEMS(i, type) ((u16)(gNewGamePCItems + type)[i * 2])

enum
{
    ITEM_ID,
    QUANTITY,
};

extern void DisplayItemMessageOnField(u8, u8*, TaskFunc, u16);
extern void ItemStorageMenuProcessInput(u8);
extern void DoPlayerPCDecoration(u8);
extern void BuyMenuFreeMemory(void);
extern void DestroyVerticalScrollIndicator(u8);
extern u8 sub_813AF3C(void);
extern void sub_813AF78(void);
extern void sub_813A240(u8);
extern void sub_813B108(u8);
extern void sub_813B174(u8);
extern void sub_80A6A30(void);
extern u8 sub_807D770(void);
extern void sub_813A280(u8);
extern void sub_813AE6C(u8, u8);
extern void sub_813A240(u8);
extern void sub_813AD58(u16);
extern void sub_813AE0C(u8);
extern void sub_813ABE8(u8);
extern void sub_813AA30(u8, u8);
extern void sub_813A4B4(u8);
extern void sub_813A468(u8);
extern void sub_80F996C(u8);
extern void sub_813A794(u8);
extern void sub_80A418C(u16, enum StringConvertMode, int, int, int);
extern void sub_813A584(u8);
extern void sub_813A6FC(u8);

extern u8 gOtherText_NoItems[];

extern u16 gNewGamePCItems[];

extern u8 gOtherText_WhatWillYouDo[];
extern u8 gOtherText_NoMailHere[];

extern u8 *gUnknown_02039314;
extern struct MenuAction gUnknown_08406298[];
extern u8 gUnknown_084062B8[];
extern u8 gUnknown_084062BC[];
extern u8 gUnknown_030007B4;
extern u8 unk_201FE00[];

extern u8 gUnknown_08152850;
extern u8 gUnknown_08152C75;

extern u32 gUnknown_08406288[];
extern const struct MenuAction gUnknown_084062C0[];

void InitPlayerPCMenu(u8 taskId);
void PlayerPCProcessMenuInput(u8 taskId);
void InitItemStorageMenu(u8);
void ItemStorageMenuPrint(u8 *);

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
    u8 taskId;

    gUnknown_02039314 = gUnknown_084062B8;
    gUnknown_030007B4 = 4;
    taskId = CreateTask(TaskDummy, 0);
    DisplayItemMessageOnField(taskId, gOtherText_WhatWillYouDo, InitPlayerPCMenu, 0);
}

void PlayerPC(void)
{
    u8 taskId;

    gUnknown_02039314 = gUnknown_084062BC;
    gUnknown_030007B4 = 3;
    taskId = CreateTask(TaskDummy, 0);
    DisplayItemMessageOnField(taskId, gOtherText_WhatWillYouDo, InitPlayerPCMenu, 0);
}

void InitPlayerPCMenu(u8 taskId)
{
    MenuDrawTextWindow(0, 0, 10, gUnknown_030007B4 * 2 + 1);
    PrintMenuItemsReordered(1, 1, gUnknown_030007B4, gUnknown_08406298, gUnknown_02039314);
    InitMenu(0, 1, 1, gUnknown_030007B4, 0, 9);
    gTasks[taskId].func = PlayerPCProcessMenuInput;
}

void PlayerPCProcessMenuInput(u8 taskId)
{
    if (gMain.newAndRepeatedKeys & 0x40)
    {
        PlaySE(5);
        MoveMenuCursor(-1);
    }
    else if (gMain.newAndRepeatedKeys & 0x80)
    {
        PlaySE(5);
        MoveMenuCursor(1);
    }
    else if (gMain.newKeys & 0x1)
    {
        sub_8072DEC();
        PlaySE(5);
        gUnknown_08406298[gUnknown_02039314[GetMenuCursorPos()]].func(taskId);
    }
    else if (gMain.newKeys & 0x2)
    {
        sub_8072DEC();
        PlaySE(5);
        gUnknown_08406298[gUnknown_030007B4[gUnknown_02039314 - 1]].func(taskId);
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
    unk_201FE00[3] = sub_813AF3C();
    if (!unk_201FE00[3])
        DisplayItemMessageOnField(taskId, gOtherText_NoMailHere, ReshowPlayerPC, 0);
    else
    {
        unk_201FE00[0] = 0;
        unk_201FE00[2] = 0;
        sub_813AF78();
        sub_813A240(taskId);
        sub_813B108(taskId);
        gTasks[taskId].func = sub_813B174;
    }
}

void PlayerPC_Decoration(u8 var)
{
    MenuZeroFillWindowRect(0, 0, 10, 9);
    DoPlayerPCDecoration(var);
}

void PlayerPC_TurnOff(u8 taskId)
{
    if (gUnknown_030007B4 == 4)
    {
        MenuZeroFillWindowRect(0, 0, 0x1D, 0x13);
        if (!gSaveBlock2.playerGender)
            ScriptContext1_SetupScript(&gUnknown_08152850); // male
        else
            ScriptContext1_SetupScript(&gUnknown_08152C75); // female
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
    PrintMenuItems(1, 1, 4, gUnknown_084062C0);
    InitMenu(0, 1, 1, 4, var, 10);
    ItemStorageMenuPrint((u8 *)gUnknown_08406288[var]);
}

void ItemStorageMenuPrint(u8 *textPtr)
{
    MenuFillWindowRectWithBlankTile(2, 15, 27, 18);
    MenuPrint(textPtr, 2, 15);
}

void ItemStorageMenuProcessInput(u8 var)
{
    if (gMain.newAndRepeatedKeys & 0x40)
    {
        PlaySE(5);
        MoveMenuCursor(-1);
        ItemStorageMenuPrint((u8 *)gUnknown_08406288[GetMenuCursorPos()]);
    }
    else if (gMain.newAndRepeatedKeys & 0x80)
    {
        PlaySE(5);
        MoveMenuCursor(1);
        ItemStorageMenuPrint((u8 *)gUnknown_08406288[GetMenuCursorPos()]);
    }
    else if (gMain.newKeys & 0x1)
    {
        PlaySE(5);
        gUnknown_084062C0[GetMenuCursorPos()].func(var);
    }
    else if (gMain.newKeys & 0x2)
    {
        sub_8072DEC();
        PlaySE(5);
        gUnknown_084062C0[3].func(var);
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
    u8 var;
    u16 * data = gTasks[taskId].data;

    sub_8072DEC();
    MenuZeroFillWindowRect(0, 0, 11, 9);
    var = CountUsedPCItemSlots();
    data[2] = var;

    if (var)
    {
        MenuZeroFillWindowRect(0, 14, 29, 19);
        data[6] = 0;
        data[0] = 0;
        data[1] = 0;
        sub_813A240(taskId);
        sub_813AE6C(taskId, 0);
        gTasks[taskId].func = sub_813A280;
    }
    else
        DisplayItemMessageOnField(taskId, gOtherText_NoItems, PlayerPC_ItemStorage, 0);
}

void ItemStorage_Toss(u8 taskId)
{
    u8 var;
    u16 * data = gTasks[taskId].data;

    sub_8072DEC();
    MenuZeroFillWindowRect(0, 0, 11, 9);
    var = CountUsedPCItemSlots();
    data[2] = var;

    if (var)
    {
        MenuZeroFillWindowRect(0, 14, 29, 19);
        data[6] = 2;
        data[0] = 0;
        data[1] = 0;
        sub_813A240(taskId);
        sub_813AE6C(taskId, 2);
        gTasks[taskId].func = sub_813A280;
    }
    else
        DisplayItemMessageOnField(taskId, gOtherText_NoItems, PlayerPC_ItemStorage, 0);
}

void ItemStorage_Exit(u8 var)
{
    sub_8072DEC();
    MenuZeroFillWindowRect(0, 0, 11, 9);
    ReshowPlayerPC(var);
}

void sub_813A240(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (data[2] > 7)
        data[4] = 8;
    else
        data[4] = data[2] + 1;

    if (unk_201FE00[3] > 7)
        unk_201FE00[1] = 8;
    else
        unk_201FE00[1] = unk_201FE00[3] + 1;
}

void sub_813A280(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    s16 var;
    
    if (gMain.newAndRepeatedKeys & 0x40)
    {
        if(data[0])
        {
            PlaySE(5);
            data[0] = MoveMenuCursor(-1);
            var = data[1] + data[0];
            if (!data[9])
            {
                if (var == data[2])
                {
                    sub_813AD58(0xFFFF);
                }
                else
                {
                    sub_813AD58(gSaveBlock1.pcItems[var].itemId);
                }
            }
        }
        else // _0813A2E4
        {
            if (!data[1])
                return;
            PlaySE(5);
            data[1]--;
            sub_813AE0C(taskId);
            // probably further down
            if (data[9])
                MoveMenuCursor(0);
        }
    }
    else if(gMain.newAndRepeatedKeys & 0x80) // _0813A306
    {
        if(data[0] != data[4] - 1)
        {
            PlaySE(5);
            data[0] = MoveMenuCursor(1);
            var = data[1] + data[0];

            if(data[9])
                return;

            if (var == data[2])
                sub_813AD58(0xFFFF); // probably further down
            else
                sub_813AD58(gSaveBlock1.pcItems[var].itemId);
        }
        else if(data[1] + data[0] != data[2])
        {
            PlaySE(5);
            data[1]++;
            sub_813AE0C(taskId);
            
            if (data[9])
                MoveMenuCursor(0);
        }
    }
    else if(gMain.newKeys & 0x4) // _0813A3A0
    {
        if (!data[9])
        {
            if (data[0] + data[1] != data[2])
            {
                PlaySE(5);
                data[9] = 1;
                data[8] = data[1] + data[0];
                sub_813AD58(0xFFF7);
            }
            // _0813A3DC
            sub_813ABE8(taskId);
        }
        else // _0813A3E8
        {
            PlaySE(5); // merging?
            sub_813AA30(taskId, 0);
            sub_813AE0C(taskId);
        }
    }
    else if(gMain.newKeys & 0x1)
    {
        PlaySE(5);
        if(!data[9])
        {
            if(data[1] + data[0] != data[2])
            {
                sub_813A4B4(taskId);
            }
            else
            {
                sub_813A468(taskId);
            }
        }
        else
        {
            sub_813AA30(taskId, 0);
            sub_813AE0C(taskId);
        }
    }
    else if(gMain.newKeys & 0x2)
    {
        PlaySE(5);
        if(!data[9])
        {
            sub_8072DEC();
            sub_813A468(taskId);
        }
        else
        {
            sub_813AA30(taskId, 1);
            sub_813AE0C(taskId);
        }
    }
}

void sub_813A468(u8 taskId)
{
    BuyMenuFreeMemory();
    DestroyVerticalScrollIndicator(0);
    DestroyVerticalScrollIndicator(1);
    MenuZeroFillWindowRect(0, 0, 29, 19);
    MenuDisplayMessageBox();
    InitItemStorageMenu(gTasks[taskId].data[6]);
    gTasks[taskId].func = ItemStorageMenuProcessInput;
}

void sub_813A4B4(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u8 var = data[0] + data[1];

    sub_80F996C(0);
    sub_80F996C(1);
    
    if(!data[6])
    {
        if(gSaveBlock1.pcItems[var].quantity == 1)
        {
            data[3] = 1;
            sub_813A6FC(taskId);
            return;
        }
        else // _0813A50C
        {
            sub_813AD58(0xFFFE);
        }
    }
    else if(gSaveBlock1.pcItems[var].quantity == 1) // _0813A518
    {
        data[3] = 1;
        sub_813A794(taskId);
        return;
    }
    else
    {
        sub_813AD58(0xFFFC);
    }
    data[3] = 1;
    MenuDrawTextWindow(6, 8, 13, 11);
    sub_80A418C(data[3], STR_CONV_MODE_RIGHT_ALIGN, 8, 9, 3);
    gTasks[taskId].func = sub_813A584;
}
