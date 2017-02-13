#include "global.h"
#include "menu.h"
#include "script.h"
#include "task.h"
#include "main.h"
#include "sound.h"
#include "weather.h"
#include "palette.h"
#include "sprite.h"

extern void sub_80B2FA0(u8);
extern void BuyMenuDrawGraphics(void);
extern void sub_80A6300(void);
extern void sub_80BE3BC(void);
extern void DisplayItemMessageOnField(u8, u8*, TaskFunc, u16);
extern u8 sub_807D770(void);
extern void pal_fill_black(void);

struct UnknownShopStruct
{
    /* 0x0 */ void (* callback) (void);
    /* 0x4 */ u16 *itemList;
    /* 0x8 */ u8 itemCount;
    /* 0x9 */ u8 unk9;
    /* 0xA */ u8 unkA;
    u8 unkB;
    /* 0xC */ bool8 unkC;
    // unknown size
};

extern struct UnknownShopStruct gUnknown_03000708;
extern struct MenuAction gUnknown_083CC6D0[];

extern u8 gUnknown_083CC6E8[];
extern u8 gUnknown_083CC6EB[];
extern u8 gOtherText_CanIHelpYou[];
extern u8 gOtherText_AnythingElse[];

void sub_80B2E38(u8);
void HandleShopMenuQuit(u8);

u8 CreateShopMenu(bool8 var)
{
    ScriptContext2_Enable();
    gUnknown_03000708.unkC = var;
    gUnknown_03000708.unk9 = 0;

    if(var == FALSE)
    {
        gUnknown_03000708.unkA = 2;
        MenuDrawTextWindow(0, 0, 10, 7);
        PrintMenuItemsReordered(1, 1, 3, gUnknown_083CC6D0, (u8 *)gUnknown_083CC6E8);
    }
    else
    {
        gUnknown_03000708.unkA = 1;
        MenuDrawTextWindow(0, 0, 10, 5);
        PrintMenuItemsReordered(1, 1, 2, gUnknown_083CC6D0, (u8 *)gUnknown_083CC6EB);
    }
    InitMenu(0, 1, 1, gUnknown_03000708.unkA + 1, 0, 9);
    
    return CreateTask(sub_80B2E38, 8);
}

void SetShopMenuCallback(void *callbackPtr)
{
    gUnknown_03000708.callback = callbackPtr;
}

void SetShopItemsForSale(u16 *items)
{
    u16 i = 0;

    gUnknown_03000708.itemList = items;
    gUnknown_03000708.itemCount = 0;

    while (gUnknown_03000708.itemList[i])
    {
        gUnknown_03000708.itemCount++;
        i++;
    }
}

void sub_80B2E38(u8 var)
{
    const u8 local = var;

    if(gMain.newAndRepeatedKeys & 0x40)
    {
        if(gUnknown_03000708.unk9)
        {
            PlaySE(0x5);
            gUnknown_03000708.unk9 = MoveMenuCursor(-1);
        }
    }
    else if(gMain.newAndRepeatedKeys & 0x80)
    {
        if(gUnknown_03000708.unk9 != gUnknown_03000708.unkA)
        {
            PlaySE(0x5);
            gUnknown_03000708.unk9 = MoveMenuCursor(1);
        }
    }
    else if (gMain.newKeys & 1)
    {
        PlaySE(0x5);
        if(!gUnknown_03000708.unkC)
        {
            gUnknown_083CC6D0[gUnknown_083CC6E8[gUnknown_03000708.unk9]].func(local);
        }
        else
        {
            gUnknown_083CC6D0[gUnknown_083CC6EB[gUnknown_03000708.unk9]].func(local);
        }
    }
    else if(gMain.newKeys & 2)
    {
        PlaySE(0x5);
        HandleShopMenuQuit(local);
    }
}

void sub_80B2EFC(u8 taskId)
{
    gTasks[taskId].data[8] = (u32)BuyMenuDrawGraphics >> 16;
    gTasks[taskId].data[9] = (u32)BuyMenuDrawGraphics;
    gTasks[taskId].func = sub_80B2FA0;
    fade_screen(1, 0);
}

void sub_80B2F30(u8 taskId)
{
    gTasks[taskId].data[8] = (u32)sub_80A6300 >> 16;
    gTasks[taskId].data[9] = (u32)sub_80A6300;
    gTasks[taskId].func = sub_80B2FA0;
    fade_screen(1, 0);
}

void HandleShopMenuQuit(u8 taskId)
{
    sub_8072DEC();
    MenuZeroFillWindowRect(0, 0, 11, 8);
    sub_80BE3BC(); // in tv.s?
    ScriptContext2_Disable();
    DestroyTask(taskId);
    
    if(gUnknown_03000708.callback)
        gUnknown_03000708.callback(); // run the callback if it exists.
}

void sub_80B2FA0(u8 taskId)
{
    if(!gPaletteFade.active)
    {
        SetMainCallback2((void *)((u16)gTasks[taskId].data[8] << 16 | (u16)gTasks[taskId].data[9]));
        DestroyTask(taskId);
    }
}

void ReturnToShopMenuAfterExitingSellMenu(u8 taskId)
{
    CreateShopMenu(gUnknown_03000708.unkC);
    DestroyTask(taskId);
}

void Task_ExitSellMenu(u8 taskId)
{
    if(sub_807D770() == 1)
    {
        if(gUnknown_03000708.unkC == 2)
            DisplayItemMessageOnField(taskId, gOtherText_CanIHelpYou, ReturnToShopMenuAfterExitingSellMenu, 0);
        else
            DisplayItemMessageOnField(taskId, gOtherText_AnythingElse, ReturnToShopMenuAfterExitingSellMenu, 0);
    }
}

void sub_80B3050(void)
{
    pal_fill_black();
    CreateTask(Task_ExitSellMenu, 0x8);
}

void sub_80B3068(u8 taskId)
{
    Task_ExitSellMenu(taskId);
}

void unref_sub_80B3078(u8 taskId)
{
    gTasks[taskId].func = Task_ExitSellMenu;
}

void sub_80B3094(void)
{
    AnimateSprites();
    BuildOamBuffer();
    RunTasks();
    UpdatePaletteFade();
}
