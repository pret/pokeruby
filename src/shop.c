#include "global.h"
#include "asm.h"
#include "decompress.h"
#include "field_weather.h"
#include "main.h"
#include "menu.h"
#include "money.h"
#include "palette.h"
#include "script.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"

struct UnknownShopStruct
{
    /* 0x0 */ void (* callback) (void);
    /* 0x4 */ u16 *itemList;
    /* 0x8 */ u8 itemCount;
    /* 0x9 */ u8 unk9;
    /* 0xA */ u8 unkA;
    /* 0xB */ u8 unkB;
    /* 0xC */ bool8 unkC;
    // unknown size
};

extern struct UnknownShopStruct gUnknown_03000708;
extern struct MenuAction gUnknown_083CC6D0[];

extern u8 gUnknown_083CC6E8[];
extern u8 gUnknown_083CC6EB[];
extern u8 gOtherText_CanIHelpYou[];
extern u8 gOtherText_AnythingElse[];
extern u8 gBuyMenuFrame_Gfx[];

extern u16 gBuyMenuFrame_Tilemap[];
extern u16 gMenuMoneyPal[16];
extern u16 gUnknown_083CC710[2];

extern void sub_80A6300(void);
extern void sub_80BE3BC(void);
extern void DisplayItemMessageOnField(u8, u8*, TaskFunc, u16);
extern u8 sub_807D770(void);
extern void pal_fill_black(void);
extern void sub_80B3764(int, int);
extern void sub_80B37EC(void);
extern void sub_80B40E8(u8);
extern void BuyMenuDrawMapGraphics(void);
extern void sub_80F944C(void);
extern void CreateVerticalScrollIndicators(u32, u32, u32); // unknown args
extern void sub_80F979C(u32, u32); // unknown args

void sub_80B2E38(u8);
void HandleShopMenuQuit(u8);
void sub_80B2FA0(u8);
void BuyMenuDrawGraphics(void);
void sub_80B3240(void);
void sub_80B3270(void);

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

void sub_80B30AC(void)
{
    void *addr;
    void *addr2;
    void *addr3;
    u16 *tempArr;
    u16 *tempArr2;
    u16 *tempArr3;

    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();

    // temp vars needed to match for some dumb reason
    tempArr = gBGTilemapBuffers[1];
    addr = (void *)(VRAM + 0xE800);
    DmaCopy16(3,  tempArr, addr, 0x800);
    tempArr2 = gBGTilemapBuffers[2];
    addr2 = (void *)(VRAM + 0xE000);
    DmaCopy16(3,  tempArr2, addr2, 0x800);
    tempArr3 = gBGTilemapBuffers[3];
    addr3 = (void *)(VRAM + 0xF000);
    DmaCopy16(3,  tempArr3, addr3, 0x800);
}

// this function is fugly. pls fix
void BuyMenuDrawGraphics(void)
{
    void *addr;
    register u16 zero2 asm("r5");

    sub_80F9438();
    remove_some_task();
    REG_BG1HOFS = (zero2 = 0);
    REG_BG1VOFS = zero2;
    REG_BG2HOFS = zero2;
    REG_BG2VOFS = zero2;
    REG_BG3HOFS = zero2;
    REG_BG3VOFS = zero2;
    gPaletteFade.bufferTransferDisabled = 1;
    addr = (void*)OAM;
    {
    register const u32 zero asm("r6") = 0;
    DmaFill32(3, zero, addr, OAM_SIZE);
    LZDecompressVram(gBuyMenuFrame_Gfx, (void*)(VRAM + 0x7C00));
    sub_800D238(gBuyMenuFrame_Tilemap, (void *)0x02018000);
    LoadCompressedPalette(gMenuMoneyPal, 0xC0, sizeof(gMenuMoneyPal));
    FreeAllSpritePalettes();
    ResetPaletteFade();
    ResetSpriteData();
    ResetTasks();
    SetUpWindowConfig(&gWindowConfig_81E6DFC);
    InitMenuWindow(&gWindowConfig_81E6DFC);
    BuyMenuDrawMapGraphics();
    gUnknown_03000708.unk9 = zero;
    gUnknown_03000708.unkB = zero2;
    MenuZeroFillWindowRect(0, 0, 0x20, 0x20);
    sub_80B7C14(gSaveBlock1.money, 0, 0);
    sub_80B3764(0, 7);
    sub_80B37EC();
    sub_80B3270();
    CreateTask(sub_80B40E8, 0x8);
    sub_80B3240();
    asm("":::"r4"); // what??
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0x10, 0, zero);
    gPaletteFade.bufferTransferDisabled = 0;
    SetVBlankCallback(sub_80B30AC);
    SetMainCallback2(sub_80B3094);
    }
}

void sub_80B3240(void)
{
    u16 tempArr[2];

    memcpy(tempArr, gUnknown_083CC710, sizeof(tempArr));
    LoadPalette(&tempArr[1], 0xD1, 2);
    LoadPalette(&tempArr[0], 0xD8, 2);
}

void sub_80B3270(void)
{
    sub_80F944C();

    if(gUnknown_03000708.itemCount > 7)
    {
        CreateVerticalScrollIndicators(0, 172, 12);
        CreateVerticalScrollIndicators(1, 172, 148);
        sub_80F979C(0, 1);
    }
}

void sub_80B32A4(void)
{
    if(gUnknown_03000708.unkB == 0)
        sub_80F979C(0, 1);
    else
        sub_80F979C(0, 0);

    if(gUnknown_03000708.unkB + 7 >= gUnknown_03000708.itemCount)
        sub_80F979C(1, 1);
    else
        sub_80F979C(1, 0);
}

void sub_80B32EC(u16 *array, s16 offset1, s16 offset2)
{
    array[offset1 + offset2] = 0xC3E1;
    array[offset1 + offset2 + 1] = 0xC3E1;
}

void BuyMenuDrawMapMetatileLayer(u16 *array, s16 offset1, s16 offset2, u16 *array2)
{
    array[offset1 + offset2] = array2[0];
    array[offset1 + offset2 + 1] = array2[1];
    array[offset1 + offset2 + 32] = array2[2];
    array[offset1 + offset2 + 33] = array2[3];
}

void BuyMenuDrawMapMetatile(int var1, int var2, u16 *var3, s8 var4)
{
    u8 tempVar4 = var4;
    s16 offset1 = var1 * 2;
    s16 offset2 = (var2 * 0x40) + 0x40;

    switch(tempVar4)
    {
        case 0: // _080B335C
            BuyMenuDrawMapMetatileLayer(gBGTilemapBuffers[2], offset1, offset2, var3);
            BuyMenuDrawMapMetatileLayer(gBGTilemapBuffers[1], offset1, offset2, var3 + 4);
            break;
        case 1: // _080B3364
            BuyMenuDrawMapMetatileLayer(gBGTilemapBuffers[3], offset1, offset2, var3);
            BuyMenuDrawMapMetatileLayer(gBGTilemapBuffers[2], offset1, offset2, var3 + 4);
            break;
        case 2: // _080B3398
            BuyMenuDrawMapMetatileLayer(gBGTilemapBuffers[3], offset1, offset2, var3);
            BuyMenuDrawMapMetatileLayer(gBGTilemapBuffers[1], offset1, offset2, var3 + 4);
            break;
    }
}
