#include "global.h"
#include "shop.h"
#include "decompress.h"
#include "field_fadetransition.h"
#include "field_weather.h"
#include "item_menu.h"
#include "main.h"
#include "menu.h"
#include "menu_helpers.h"
#include "money.h"
#include "palette.h"
#include "script.h"
#include "sound.h"
#include "sprite.h"
#include "strings.h"
#include "task.h"
#include "tv.h"
#include "scanline_effect.h"
#include "event_object_movement.h"
#include "field_player_avatar.h"
#include "fieldmap.h"
#include "item.h"
#include "decoration.h"
#include "constants/items.h"
#include "constants/songs.h"
#include "overworld.h"
#include "decoration_inventory.h"
#include "field_camera.h"
#include "ewram.h"

extern bool8 SellMenu_QuantityRoller(u8, u8);

extern u8 gBuyMenuFrame_Gfx[];
extern u16 gBuyMenuFrame_Tilemap[];
extern u16 gMenuMoneyPal[16];

static void Shop_DisplayPriceInList(int firstItemId, int lastItemId, bool32 hasControlCode);
static void Shop_PrintItemDescText(void);
static void Task_ReturnToBuyMenu(u8);
static void Task_ExitBuyMenu(u8);
static void Task_ExitBuyMenuDoFade(u8);
static void Task_UpdatePurchaseHistory(u8);
static void Task_HandleShopMenuBuy(u8 taskId);
static void Task_HandleShopMenuSell(u8 taskId);
static void Task_HandleShopMenuQuit(u8 taskId);
static void Task_DoItemPurchase(u8 taskId);
static void Task_CancelItemPurchase(u8 taskId);
static void Task_DoBuySellMenu(u8);
static void Shop_FadeAndRunBuySellCallback(u8);
static void BuyMenuDrawGraphics(void);
static void sub_80B3240(void);
static void DrawFirstMartScrollIndicators(void);
static void Shop_DrawViewport(void);
static void Shop_InitMenus(int, int);
static void Shop_PrintItemDesc(void);
static void Shop_DoCursorAction(u8);
static void Shop_LoadViewportObjects(void);
static void Shop_AnimViewportObjects(void);

// iwram
static struct MartInfo gMartInfo;

// ewram
EWRAM_DATA u32 gMartTotalCost = 0;
EWRAM_DATA s16 gMartViewportObjects[16][4] = {0};
EWRAM_DATA struct ItemSlot gMartPurchaseHistory[3] = {0};
EWRAM_DATA u8 gMartPurchaseHistoryId = 0;

EWRAM_DATA u8 gUnknown_02038731 = 0; // This really should be in fldeff_escalator, but being in a new file aligns the ewram, which doesnt match the ROM.

// rodata
static const struct MenuAction2 sBuySellQuitMenuActions[] =
{
    { MartText_Buy, Task_HandleShopMenuBuy },
    { MartText_Sell, Task_HandleShopMenuSell },
    { MartText_Quit2, Task_HandleShopMenuQuit },
};

static const u8 gMartBuySellOptionList[] = {SHOP_BUY, SHOP_SELL, SHOP_EXIT};
static const u8 gMartBuyNoSellOptionList[] = {SHOP_BUY, SHOP_EXIT};

static const u16 gUnusedMartArray[] = {0x2, 0x3, 0x4, 0xD, 0x121, 0xE, 0xE, 0xE, 0xE, 0xE, 0xE, 0x0, 0x0};

static const struct YesNoFuncTable sShopPurchaseYesNoFuncs[] =
{
    Task_DoItemPurchase,
    Task_CancelItemPurchase
};

static u8 CreateShopMenu(u8 martType)
{
    ScriptContext2_Enable();
    gMartInfo.martType = martType;
    gMartInfo.cursor = 0;

    if (martType == MART_TYPE_0)
    {
        gMartInfo.numChoices = 2;
        Menu_DrawStdWindowFrame(0, 0, 10, 7);
        Menu_PrintItemsReordered(1, 1, 3, sBuySellQuitMenuActions, gMartBuySellOptionList);
    }
    else
    {
        gMartInfo.numChoices = 1;
        Menu_DrawStdWindowFrame(0, 0, 10, 5);
        Menu_PrintItemsReordered(1, 1, 2, sBuySellQuitMenuActions, gMartBuyNoSellOptionList);
    }
    InitMenu(0, 1, 1, gMartInfo.numChoices + 1, 0, 9); // add 1 for cancel

    return CreateTask(Task_DoBuySellMenu, 8);
}

static void SetShopMenuCallback(void *callbackPtr)
{
    gMartInfo.callback = callbackPtr;
}

static void SetShopItemsForSale(const u16 *items)
{
    u16 i = 0;

    gMartInfo.itemList = items;
    gMartInfo.itemCount = 0;

    while (gMartInfo.itemList[i])
    {
        gMartInfo.itemCount++;
        i++;
    }
}

static void Task_DoBuySellMenu(u8 taskId)
{
    const u8 taskIdConst = taskId; // why is a local const needed to match?

    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        if (gMartInfo.cursor) // can move cursor up?
        {
            PlaySE(SE_SELECT);
            gMartInfo.cursor = Menu_MoveCursor(-1);
        }
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        if (gMartInfo.cursor != gMartInfo.numChoices) // can move cursor down?
        {
            PlaySE(SE_SELECT);
            gMartInfo.cursor = Menu_MoveCursor(1);
        }
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        if (gMartInfo.martType == MART_TYPE_0)
            sBuySellQuitMenuActions[gMartBuySellOptionList[gMartInfo.cursor]].func(taskIdConst);
        else
            sBuySellQuitMenuActions[gMartBuyNoSellOptionList[gMartInfo.cursor]].func(taskIdConst);
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
        Task_HandleShopMenuQuit(taskIdConst);
    }
}

static void Task_HandleShopMenuBuy(u8 taskId)
{
    gTasks[taskId].data[8] = (u32)BuyMenuDrawGraphics >> 16;
    gTasks[taskId].data[9] = (u32)BuyMenuDrawGraphics;
    gTasks[taskId].func = Shop_FadeAndRunBuySellCallback;
    FadeScreen(1, 0);
}

static void Task_HandleShopMenuSell(u8 taskId)
{
    gTasks[taskId].data[8] = (u32)ItemMenu_LoadSellMenu >> 16;
    gTasks[taskId].data[9] = (u32)ItemMenu_LoadSellMenu;
    gTasks[taskId].func = Shop_FadeAndRunBuySellCallback;
    FadeScreen(1, 0);
}

static void Task_HandleShopMenuQuit(u8 taskId)
{
    Menu_DestroyCursor();
    Menu_EraseWindowRect(0, 0, 11, 8);
    sub_80BE3BC();
    ScriptContext2_Disable();
    DestroyTask(taskId);

    if (gMartInfo.callback)
        gMartInfo.callback(); // run the callback if it exists.
}

static void Shop_FadeAndRunBuySellCallback(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2((void *)((u16)gTasks[taskId].data[8] << 16 | (u16)gTasks[taskId].data[9]));
        DestroyTask(taskId);
    }
}

static void ReturnToShopMenuAfterExitingSellMenu(u8 taskId)
{
    CreateShopMenu(gMartInfo.martType);
    DestroyTask(taskId);
}

static void Task_ReturnToMartMenu(u8 taskId)
{
    if (IsWeatherNotFadingIn() == 1)
    {
        if (gMartInfo.martType == MART_TYPE_2)
            DisplayItemMessageOnField(taskId, gOtherText_CanIHelpYou, ReturnToShopMenuAfterExitingSellMenu, 0);
        else
            DisplayItemMessageOnField(taskId, gOtherText_AnythingElse, ReturnToShopMenuAfterExitingSellMenu, 0);
    }
}

void Shop_FadeReturnToMartMenu(void)
{
    pal_fill_black();
    CreateTask(Task_ReturnToMartMenu, 0x8);
}

void Shop_RunExitSellMenuTask(u8 taskId)
{
    Task_ReturnToMartMenu(taskId);
}

// unused
void Shop_LoadExitSellMenuTask(u8 taskId)
{
    gTasks[taskId].func = Task_ReturnToMartMenu;
}

static void MainCB2(void)
{
    AnimateSprites();
    BuildOamBuffer();
    RunTasks();
    UpdatePaletteFade();
}

static void VBlankCB(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    DmaCopy16Defvars(3, gBGTilemapBuffers[1], (void *)(VRAM + 0xE800), 0x800);
    DmaCopy16Defvars(3, gBGTilemapBuffers[2], (void *)(VRAM + 0xE000), 0x800);
    DmaCopy16Defvars(3, gBGTilemapBuffers[3], (void *)(VRAM + 0xF000), 0x800);
}

static void BuyMenuDrawGraphics(void)
{
    ClearVideoCallbacks();
    ScanlineEffect_Stop();
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG3HOFS = 0;
    REG_BG3VOFS = 0;
    gPaletteFade.bufferTransferDisabled = 1;

    /*
        THEORY: This seemingly useless loop is required in order to match this
        function without hacks. The reason is because it alters the 0 optimization
        of a later assignment into using 2 different 0s instead of the same register.
        It is speculated that at some point Game Freak insert an artificial
        breakpoint here in order to look at the contents of OAM before it is cleared,
        possibly because a programmer made a mistake in shop.c which corrupted its
        contents. There may have been a macro here which at one point idled on the
        while(1) but was changed to 0 for release due to a define somewhere. A
        while(0) also matches, but it is more correct to use do {} while(0) as it
        was a fix to prevent compiler warnings on older compilers.
    */
    do {} while(0);

    DmaFill32Defvars(3, 0, (void*)OAM, OAM_SIZE);
    LZDecompressVram(gBuyMenuFrame_Gfx, (void*)(VRAM + 0x7C00));
    LZDecompressWram(gBuyMenuFrame_Tilemap, ewram18000_2);
    LoadCompressedPalette(gMenuMoneyPal, 0xC0, sizeof(gMenuMoneyPal));
    FreeAllSpritePalettes();
    ResetPaletteFade();
    ResetSpriteData();
    ResetTasks();
    Text_LoadWindowTemplate(&gWindowTemplate_81E6DFC);
    InitMenuWindow(&gWindowTemplate_81E6DFC);
    Shop_DrawViewport();
    gMartInfo.cursor = 0;
    gMartInfo.choicesAbove = 0;
    Menu_EraseWindowRect(0, 0, 0x20, 0x20);
    OpenMoneyWindow(gSaveBlock1.money, 0, 0);
    Shop_InitMenus(0, 7);
    Shop_PrintItemDesc();
    DrawFirstMartScrollIndicators();
    CreateTask(Shop_DoCursorAction, 0x8);
    sub_80B3240();
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
    gPaletteFade.bufferTransferDisabled = 0;
    SetVBlankCallback(VBlankCB);
    SetMainCallback2(MainCB2);
}

static void sub_80B3240(void)
{
    u16 colors[2] = {RGB(14, 15, 16), RGB_WHITE};

    LoadPalette(&colors[1], 0xD1, sizeof colors[1]);
    LoadPalette(&colors[0], 0xD8, sizeof colors[0]);
}

static void DrawFirstMartScrollIndicators(void)
{
    ClearVerticalScrollIndicatorPalettes();

    if (gMartInfo.itemCount > 7)
    {
        CreateVerticalScrollIndicators(TOP_ARROW, 172, 12);
        CreateVerticalScrollIndicators(BOTTOM_ARROW, 172, 148);
        SetVerticalScrollIndicators(TOP_ARROW, INVISIBLE);
    }
}

static void Shop_TryDrawVerticalScrollIndicators(void)
{
    if (gMartInfo.choicesAbove == 0)
        SetVerticalScrollIndicators(TOP_ARROW, INVISIBLE);
    else
        SetVerticalScrollIndicators(TOP_ARROW, VISIBLE);

    if (gMartInfo.choicesAbove + 7 >= gMartInfo.itemCount)
        SetVerticalScrollIndicators(BOTTOM_ARROW, INVISIBLE);
    else
        SetVerticalScrollIndicators(BOTTOM_ARROW, VISIBLE);
}

// what is the point of this function? the tiles always get overwritten by BuyMenuDrawTextboxBG.
static void BuyMenuDrawTextboxBG_Old(u16 *array, s16 offset1, s16 offset2)
{
    array[offset1 + offset2] = 0xC3E1;
    array[offset1 + offset2 + 1] = 0xC3E1;
}

static void BuyMenuDrawMapMetatileLayer(u16 *array, s16 offset1, s16 offset2, u16 *array2)
{
    // This function draws a whole 2x2 metatile.
    array[offset1 + offset2] = array2[0]; // top left
    array[offset1 + offset2 + 1] = array2[1]; // top right
    array[offset1 + offset2 + 32] = array2[2]; // bottom left
    array[offset1 + offset2 + 33] = array2[3]; // bottom right
}

static void BuyMenuDrawMapMetatile(int var1, int var2, u16 *var3, s32 var4)
{
    u8 tempVar4 = var4;
    s16 offset1 = var1 * 2;
    s16 offset2 = (var2 * 0x40) + 0x40;

    switch (tempVar4)
    {
    case 0:
        BuyMenuDrawMapMetatileLayer(gBGTilemapBuffers[2], offset1, offset2, var3);
        BuyMenuDrawMapMetatileLayer(gBGTilemapBuffers[1], offset1, offset2, var3 + 4);
        break;
    case 1:
        BuyMenuDrawMapMetatileLayer(gBGTilemapBuffers[3], offset1, offset2, var3);
        BuyMenuDrawMapMetatileLayer(gBGTilemapBuffers[2], offset1, offset2, var3 + 4);
        break;
    case 2:
        BuyMenuDrawMapMetatileLayer(gBGTilemapBuffers[3], offset1, offset2, var3);
        BuyMenuDrawMapMetatileLayer(gBGTilemapBuffers[1], offset1, offset2, var3 + 4);
        break;
    }
}

// used to draw the border tiles around the viewport.
static void BuyMenuDrawMapPartialMetatile(s16 var1, int var2, u16 *var3)
{
    s16 offset1 = var1 * 2;
    s16 offset2 = (var2 * 0x40) + 0x40;

    BuyMenuDrawMapMetatileLayer(gBGTilemapBuffers[3], offset1, offset2, var3);
    BuyMenuDrawMapMetatileLayer(gBGTilemapBuffers[2], offset1, offset2, var3 + 4);
}

static void Shop_DrawViewportTiles(void)
{
    s16 facingX;
    s16 facingY;
    s16 x;
    s16 y;

    GetXYCoordsOneStepInFrontOfPlayer(&facingX, &facingY);
    facingX -= 3;
    facingY -= 3;

    for (y = 0; y < 6; y++)
    {
        for (x = 0; x < 7; x++)
        {
            u16 metatileId = MapGridGetMetatileIdAt(facingX + x, facingY + y);

            if (y != 5 && x != 6)
            {
                s32 r3 = MapGridGetMetatileLayerTypeAt(facingX + x, facingY + y);

                if (metatileId < 512)
                    BuyMenuDrawMapMetatile(x, y, (u16 *)gMapHeader.mapLayout->primaryTileset->metatiles + metatileId * 8, r3);
                else
                    BuyMenuDrawMapMetatile(x, y, (u16 *)gMapHeader.mapLayout->secondaryTileset->metatiles + (metatileId - 512) * 8, r3);
            }
            else
            {
                if (metatileId < 512)
                    BuyMenuDrawMapPartialMetatile(x, y, (u16 *)gMapHeader.mapLayout->primaryTileset->metatiles + metatileId * 8);
                else
                    BuyMenuDrawMapPartialMetatile(x, y, (u16 *)gMapHeader.mapLayout->secondaryTileset->metatiles + (metatileId - 512) * 8);
            }

            if (y == 0 && x != 0 && x != 6)
                BuyMenuDrawTextboxBG_Old(gBGTilemapBuffers[1], x * 2, 64);
        }
    }
}

static void Shop_DrawViewport(void)
{
    ClearBGTilemapBuffers();
    Shop_LoadViewportObjects();
    Shop_AnimViewportObjects();
    Shop_DrawViewportTiles();
}

static void Shop_LoadViewportObjects(void)
{
    s16 facingX;
    s16 facingY;
    u8 playerHeight;
    u8 y;
    u8 x;
    u8 r8 = 0;

    GetXYCoordsOneStepInFrontOfPlayer(&facingX, &facingY);
    playerHeight = PlayerGetZCoord();
    for (y = 0; y < 16; y++)
        gMartViewportObjects[y][EVENT_OBJ_ID] = 16;
    for (y = 0; y < 5; y++)
    {
        for (x = 0; x < 7; x++)
        {
            u8 eventObjId = GetEventObjectIdByXYZ(facingX - 3 + x, facingY - 2 + y, playerHeight);

            if (eventObjId != 16)
            {
                gMartViewportObjects[r8][EVENT_OBJ_ID] = eventObjId;
                gMartViewportObjects[r8][X_COORD] = x;
                gMartViewportObjects[r8][Y_COORD] = y;
                if (gEventObjects[eventObjId].facingDirection == DIR_SOUTH)
                    gMartViewportObjects[r8][ANIM_NUM] = 0;
                if (gEventObjects[eventObjId].facingDirection == DIR_NORTH)
                    gMartViewportObjects[r8][ANIM_NUM] = 1;
                if (gEventObjects[eventObjId].facingDirection == DIR_WEST)
                    gMartViewportObjects[r8][ANIM_NUM] = 2;
                if (gEventObjects[eventObjId].facingDirection == DIR_EAST)
                    gMartViewportObjects[r8][ANIM_NUM] = 3;
                r8++;
            }
        }
    }
}

static void Shop_AnimViewportObjects(void)
{
    u8 i;

    for (i = 0; i < 16; i++) // max objects?
    {
        if (gMartViewportObjects[i][EVENT_OBJ_ID] == 16)
            continue;

        StartSpriteAnim(&gSprites[AddPseudoEventObject(
            gEventObjects[gMartViewportObjects[i][EVENT_OBJ_ID]].graphicsId,
            SpriteCallbackDummy,
            (u16)gMartViewportObjects[i][X_COORD] * 16 + 8,
            (u16)gMartViewportObjects[i][Y_COORD] * 16 + 32,
            2)],
            gMartViewportObjects[i][ANIM_NUM]);
    }
}

static void BuyMenuDrawTextboxBG(void)
{
    s16 i;
    
    for (i = 0; i < 0x400; i++)
    {
        if (ewram18000[i] != 0)
            gBGTilemapBuffers[1][i] = ewram18000[i] + 0xC3E0;
    }
}

static void Shop_InitMenus(int firstItemId, int lastItemId)
{
    BuyMenuDrawTextboxBG();
    Shop_DisplayPriceInList(firstItemId, lastItemId, 0);
    InitMenu(0, 0xE, 0x2, 0x8, gMartInfo.cursor, 0xF);
}

// after printing the item quantity and price, restore the textbox tiles before the Yes/No prompt.
static void BuyMenuDrawTextboxBG_Restore(void)
{
    u16 i, j;

    for (i = 0; i < 8; i++)
        for (j = 0; j < 14; j++)
            gBGTilemapBuffers[1][32 * (i + 12) + j] = ewram18300[32 * i + j] + 0xC3E0;
}

static void Shop_PrintItemDesc(void)
{
    Shop_PrintItemDescText();
}

#define tItemCount data[1]

static void Shop_DisplayPriceInCheckoutWindow(u8 taskId)
{
    u16 itemListIndex = gMartInfo.choicesAbove + gMartInfo.cursor;
    u16 itemId = gMartInfo.itemList[itemListIndex];
    u32 price = (ItemId_GetPrice(itemId) >> GetPriceReduction(1));

    PrintMoneyAmount(gTasks[taskId].tItemCount * price, 6, 6, 11);
    gStringVar1[0] = EXT_CTRL_CODE_BEGIN;
    gStringVar1[1] = 0x14;
    gStringVar1[2] = 0x6;
    ConvertIntToDecimalStringN(&gStringVar1[3], gTasks[taskId].tItemCount, 1, 2);
    Menu_PrintText(gOtherText_xString1, 1, 11);
    sub_80A3FA0(gBGTilemapBuffers[1], 1, 11, 12, 2, 0xC3E1);
}

static void Shop_DisplayNormalPriceInList(u16 itemId, u8 var2, bool32 hasControlCode)
{
    u8 *stringPtr = gStringVar1;

    if (hasControlCode)
    {
        stringPtr[0] = EXT_CTRL_CODE_BEGIN;
        stringPtr[1] = 0x1;
        stringPtr[2] = 0x2;
        stringPtr += 3;
    }

    CopyItemName(itemId, stringPtr);

    sub_8072A18(&gStringVar1[0], 0x70, var2 << 3, 0x58, 0x1);
    stringPtr = gStringVar1;

    if (hasControlCode)
        stringPtr = &gStringVar1[3];

    GetMoneyAmountText(stringPtr, (ItemId_GetPrice(itemId) >> GetPriceReduction(1)), 0x4);
    Menu_PrintTextPixelCoords(&gStringVar1[0], 0xCA, var2 << 3, 1);
}

static void Shop_DisplayDecorationPriceInList(u16 itemId, u8 var2, bool32 hasControlCode)
{
    u8 *stringPtr = gStringVar1;

    if (hasControlCode)
    {
        stringPtr[0] = EXT_CTRL_CODE_BEGIN;
        stringPtr[1] = 0x1;
        stringPtr[2] = 0x2;
        stringPtr += 3;
    }

    StringCopy(stringPtr, gDecorations[itemId].name);
    sub_8072A18(&gStringVar1[0], 0x70, var2 << 3, 0x58, 0x1);
    stringPtr = gStringVar1;

    if (hasControlCode)
        stringPtr = &gStringVar1[3];

    // some names are the maximum string length for a shop item. Because there is no room for
    // a 6 character price (including the currency), a sprite is instead used for anything that
    // is the maximum decoration price in order to fit it on screen.
    if (gDecorations[itemId].price == 10000)
    {
        Draw10000Sprite(0x19, var2, hasControlCode);
    }
    else
    {
        GetMoneyAmountText(stringPtr, gDecorations[itemId].price, 0x4);
        Menu_PrintTextPixelCoords(&gStringVar1[0], 0xCA, var2 << 3, 0x1);
    }
}

static void Shop_DisplayPriceInList(int firstItemId, int lastItemId, bool32 hasControlCode)
{
    u8 i;

    for (i = firstItemId; i <= lastItemId && gMartInfo.choicesAbove + i < gMartInfo.itemCount; i++)
    {
        if (gMartInfo.martType == MART_TYPE_0)
            Shop_DisplayNormalPriceInList(gMartInfo.itemList[gMartInfo.choicesAbove + i], (i << 1) + 2, hasControlCode);
        else
            Shop_DisplayDecorationPriceInList(gMartInfo.itemList[gMartInfo.choicesAbove + i], (i << 1) + 2, hasControlCode);
    }

    if (i != 8 && gMartInfo.choicesAbove + i == gMartInfo.itemCount)
    {
        Menu_BlankWindowRect(0xE, (i << 1) + 2, 0x1C, (i << 1) + 3);
        Menu_PrintText(gOtherText_CancelNoTerminator, 0xE, (i << 1) + 2);
    }
}

static void Shop_PrintItemDescText(void)
{
    if (gMartInfo.choicesAbove + gMartInfo.cursor != gMartInfo.itemCount)
    {
        if (gMartInfo.martType == MART_TYPE_0)
        {
            sub_8072AB0(ItemId_GetDescription(gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor]),
                0x4, 0x68, 0x68, 0x30, 0);
        }
        else
        {
            sub_8072AB0(gDecorations[gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor]].description,
                0x4, 0x68, 0x68, 0x30, 0);
        }
    }
    else
    {
        sub_8072AB0(gOtherText_QuitShopping, 0x4, 0x68, 0x68, 0x30, 0);
    }
}

static void Shop_DoPremierBallCheck(u8 taskId)
{
    if (gMain.newKeys & A_BUTTON || gMain.newKeys & B_BUTTON)
    {
        Shop_DisplayPriceInList(gMartInfo.cursor, gMartInfo.cursor, 0);
        PlaySE(SE_SELECT);

        if (gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor] == ITEM_POKE_BALL && gTasks[taskId].tItemCount >= 10 && AddBagItem(ITEM_PREMIER_BALL, 1) == TRUE)
            DisplayItemMessageOnField(taskId, gOtherText_FreePremierBall, Task_ReturnToBuyMenu, 0xC3E1);
        else
            Task_ReturnToBuyMenu(taskId);
    }
}

static void Shop_DoItemTransaction(u8 taskId)
{
    IncrementGameStat(GAME_STAT_SHOPPED);
    RemoveMoney(&gSaveBlock1.money, gMartTotalCost);
    PlaySE(SE_REGI);
    UpdateMoneyWindow(gSaveBlock1.money, 0, 0);
    gTasks[taskId].func = Shop_DoPremierBallCheck;
}

static void Shop_DoPricePrintAndReturnToBuyMenu(u8 taskId)
{
    Shop_DisplayPriceInList(gMartInfo.cursor, gMartInfo.cursor, 0);
    Task_ReturnToBuyMenu(taskId);
}

static void Task_DoItemPurchase(u8 taskId)
{
    Menu_EraseWindowRect(0x7, 0x8, 0xD, 0xD);
    sub_80A3FA0(gBGTilemapBuffers[1], 8, 9, 4, 4, 0);
    BuyMenuDrawTextboxBG_Restore();
    Shop_DrawViewportTiles();

    if (IsEnoughMoney(gSaveBlock1.money, gMartTotalCost))
    {
        if (gMartInfo.martType == MART_TYPE_0)
        {
            if (AddBagItem(gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor], gTasks[taskId].tItemCount))
            {
                DisplayItemMessageOnField(taskId, gOtherText_HereYouGo, Shop_DoItemTransaction, 0xC3E1);
                Task_UpdatePurchaseHistory(taskId);
            }
            else
            {
                DisplayItemMessageOnField(taskId, gOtherText_NoRoomFor, Shop_DoPricePrintAndReturnToBuyMenu, 0xC3E1);
            }
        }
        else // a normal mart is only type 0, so types 1 and 2 are decoration marts.
        {
            if (GiveDecoration(gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor]))
            {
                if (gMartInfo.martType == MART_TYPE_1)
                    DisplayItemMessageOnField(taskId, gOtherText_HereYouGo2, Shop_DoItemTransaction, 0xC3E1);
                else
                    DisplayItemMessageOnField(taskId, gOtherText_HereYouGo3, Shop_DoItemTransaction, 0xC3E1);
            }
            else
            {
                StringExpandPlaceholders(gStringVar4, gOtherText_SpaceForIsFull);
                DisplayItemMessageOnField(taskId, gStringVar4, Shop_DoPricePrintAndReturnToBuyMenu, 0xC3E1);
            }
        }
    }
    else
    {
        DisplayItemMessageOnField(taskId, gOtherText_NotEnoughMoney, Shop_DoPricePrintAndReturnToBuyMenu, 0xC3E1);
    }
}

static void Shop_DoYesNoPurchase(u8 taskId)
{
    DisplayYesNoMenu(7, 8, 1);
    sub_80A3FA0(gBGTilemapBuffers[1], 8, 9, 4, 4, 0xC3E1);
    DoYesNoFuncWithChoice(taskId, sShopPurchaseYesNoFuncs);
}

static void Task_CancelItemPurchase(u8 taskId)
{
    Shop_DisplayPriceInList(gMartInfo.cursor, gMartInfo.cursor, 0);
    Menu_EraseWindowRect(0x7, 0x8, 0xD, 0xD);
    sub_80A3FA0(gBGTilemapBuffers[1], 0x8, 0x9, 0x4, 0x4, 0);
    Task_ReturnToBuyMenu(taskId);
}

static void Shop_PrintPrice(u8 taskId)
{
    if (SellMenu_QuantityRoller(taskId, gMartInfo.curItemCount) == TRUE)
        Shop_DisplayPriceInCheckoutWindow(taskId);

    if (gMain.newKeys & A_BUTTON)
    {
        gMartTotalCost = (ItemId_GetPrice(gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor]) >> GetPriceReduction(1)) * gTasks[taskId].tItemCount; // set total cost of your purchase.
        Menu_EraseWindowRect(0, 0xA, 0xD, 0xD);
        sub_80A3FA0(gBGTilemapBuffers[1], 0x1, 0xB, 0xC, 0x2, 0);
        BuyMenuDrawTextboxBG_Restore();
        Shop_DrawViewportTiles();
        CopyItemName(gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor], gStringVar1);
        ConvertIntToDecimalStringN(gStringVar2, gTasks[taskId].tItemCount, 0, 0x2);
        ConvertIntToDecimalStringN(gStringVar3, gMartTotalCost, 0, 0x8);
        StringExpandPlaceholders(gStringVar4, gOtherText_ThatWillBe);
        DisplayItemMessageOnField(taskId, gStringVar4, Shop_DoYesNoPurchase, 0xC3E1);
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        Shop_DisplayPriceInList(gMartInfo.cursor, gMartInfo.cursor, 0);
        Task_ReturnToBuyMenu(taskId);
    }
}

// set the item count in the mart info to the maximum allowed by the player's budget.
static void Shop_UpdateCurItemCountToMax(u8 taskId)
{
    u16 var;

    gTasks[taskId].tItemCount = 1;
    Menu_DrawStdWindowFrame(0, 0xA, 0xD, 0xD);
    Shop_DisplayPriceInCheckoutWindow(taskId);

    var = gSaveBlock1.money / (ItemId_GetPrice(gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor]) >> GetPriceReduction(1));
    if (var > 99)
        gMartInfo.curItemCount = 99;
    else
        gMartInfo.curItemCount = var;

    gTasks[taskId].func = Shop_PrintPrice;
}

#ifdef NONMATCHING
static void Shop_MoveItemListUp(void)
{
    u16 *r1;
    u16 *r2;
    register u8 *r10 asm("r10");
    s32 i;
    s32 j;
    struct Window *r8 = &gMenuWindow;
    
    r1 = r8->tilemap;
    r1 += 0x1EF;
    r2 = r1;
    r2 += 64;
    r10 = r8->tileData;
    
    for (i = 0; i < 14; i++)
    {
        for (j = 0; j < 15; j++)
        {
            if ((r1[j] & 0x3FF) <= r8->tileDataStartOffset + 1)
                r2[j] = r8->tileDataStartOffset + 1;
            else
                r2[j] = r1[j] + 0x3C;
        }
        
        r1 -= 32;
        r2 -= 32;
    }
    
    {
        u8 *r1 = r10 + 0x3A20;
        u8 *r2 = r1 + 0x780;
        for (i = 0; i < 14; i++)
        {
            DmaCopy16(3, r1, r2, 0x1E0);
            r2 -= 0x3C0;
            r1 -= 0x3C0;
        }
    }
}
#else
NAKED
static void Shop_MoveItemListUp(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x4\n\
    ldr r0, _080B4020 @ =gMenuWindow\n\
    mov r8, r0\n\
    ldr r1, [r0, 0x28]\n\
    ldr r3, _080B4024 @ =0x000003de\n\
    adds r1, r3\n\
    adds r2, r1, 0\n\
    adds r2, 0x80\n\
    ldr r7, [r0, 0x24]\n\
    mov r10, r7\n\
    ldr r0, _080B4028 @ =0x000003ff\n\
    mov r9, r0\n\
    movs r6, 0xD\n\
_080B3FAC:\n\
    adds r3, r2, 0\n\
    subs r3, 0x40\n\
    str r3, [sp]\n\
    movs r7, 0x40\n\
    negs r7, r7\n\
    adds r7, r1\n\
    mov r12, r7\n\
    adds r3, r2, 0\n\
    adds r4, r1, 0\n\
    movs r5, 0xE\n\
_080B3FC0:\n\
    ldrh r2, [r4]\n\
    mov r1, r9\n\
    ands r1, r2\n\
    mov r7, r8\n\
    ldrh r0, [r7, 0x1A]\n\
    adds r0, 0x1\n\
    cmp r1, r0\n\
    ble _080B3FD4\n\
    adds r0, r2, 0\n\
    adds r0, 0x3C\n\
_080B3FD4:\n\
    strh r0, [r3]\n\
    adds r3, 0x2\n\
    adds r4, 0x2\n\
    subs r5, 0x1\n\
    cmp r5, 0\n\
    bge _080B3FC0\n\
    ldr r2, [sp]\n\
    mov r1, r12\n\
    subs r6, 0x1\n\
    cmp r6, 0\n\
    bge _080B3FAC\n\
    ldr r1, _080B402C @ =0x00003a20\n\
    add r1, r10\n\
    movs r0, 0xF0\n\
    lsls r0, 3\n\
    adds r2, r1, r0\n\
    ldr r3, _080B4030 @ =0x040000d4\n\
    ldr r5, _080B4034 @ =0x800000f0\n\
    ldr r4, _080B4038 @ =0xfffffc40\n\
    movs r6, 0xD\n\
_080B3FFC:\n\
    str r1, [r3]\n\
    str r2, [r3, 0x4]\n\
    str r5, [r3, 0x8]\n\
    ldr r0, [r3, 0x8]\n\
    adds r2, r4\n\
    adds r1, r4\n\
    subs r6, 0x1\n\
    cmp r6, 0\n\
    bge _080B3FFC\n\
    add sp, 0x4\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080B4020: .4byte gMenuWindow\n\
_080B4024: .4byte 0x000003de\n\
_080B4028: .4byte 0x000003ff\n\
_080B402C: .4byte 0x00003a20\n\
_080B4030: .4byte 0x040000d4\n\
_080B4034: .4byte 0x800000f0\n\
_080B4038: .4byte 0xfffffc40\n\
    .syntax divided");
}
#endif

#ifdef NONMATCHING
static void Shop_MoveItemListDown(void)
{
    u16 *r1;
    u16 *r2;
    u8 *r10;
    s32 i;
    s32 j;
    struct Window *r8 = &gMenuWindow;
    
    r1 = r8->tilemap;
    r1 += 0x4F;
    r2 = r1;
    r2 += 64;
    r10 = r8->tileData;
    
    for (i = 0; i < 14; i++)
    {
        for (j = 0; j < 15; j++)
        {
            if ((r1[j] & 0x3FF) <= r8->tileDataStartOffset + 1)
                r2[j] = r8->tileDataStartOffset + 1;
            else
                r2[j] = r1[j] + 0x3C;
        }
        
        r1 += 32;
        r2 += 32;
    }

    {
        register u8 *r1 asm("r1") = r10 + 0x960;
        register u8 *r2 asm("r2") = r1;
       
        r1 += 0x780;
        for (i = 0; i < 14; i++)
        {
            DmaCopy16(3, r1, r2, 0x1E0);
            r1 += 0x3C0;
            r2 += 0x3C0;
        }
    }
}
#else
NAKED
static void Shop_MoveItemListDown(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x4\n\
    ldr r0, _080B40D8 @ =gMenuWindow\n\
    mov r8, r0\n\
    ldr r2, [r0, 0x28]\n\
    adds r1, r2, 0\n\
    adds r1, 0x9E\n\
    adds r2, r1, 0\n\
    adds r1, 0x80\n\
    ldr r3, [r0, 0x24]\n\
    mov r10, r3\n\
    ldr r7, _080B40DC @ =0x000003ff\n\
    mov r9, r7\n\
    movs r6, 0xD\n\
_080B4060:\n\
    adds r0, r2, 0\n\
    adds r0, 0x40\n\
    str r0, [sp]\n\
    movs r3, 0x40\n\
    adds r3, r1\n\
    mov r12, r3\n\
    adds r3, r2, 0\n\
    adds r4, r1, 0\n\
    movs r5, 0xE\n\
_080B4072:\n\
    ldrh r2, [r4]\n\
    mov r1, r9\n\
    ands r1, r2\n\
    mov r7, r8\n\
    ldrh r0, [r7, 0x1A]\n\
    adds r0, 0x1\n\
    cmp r1, r0\n\
    ble _080B4086\n\
    adds r0, r2, 0\n\
    subs r0, 0x3C\n\
_080B4086:\n\
    strh r0, [r3]\n\
    adds r3, 0x2\n\
    adds r4, 0x2\n\
    subs r5, 0x1\n\
    cmp r5, 0\n\
    bge _080B4072\n\
    ldr r2, [sp]\n\
    mov r1, r12\n\
    subs r6, 0x1\n\
    cmp r6, 0\n\
    bge _080B4060\n\
    movs r1, 0x96\n\
    lsls r1, 4\n\
    add r1, r10\n\
    adds r2, r1, 0\n\
    movs r0, 0xF0\n\
    lsls r0, 3\n\
    adds r1, r0\n\
    ldr r3, _080B40E0 @ =0x040000d4\n\
    ldr r5, _080B40E4 @ =0x800000f0\n\
    movs r4, 0xF0\n\
    lsls r4, 2\n\
    movs r6, 0xD\n\
_080B40B4:\n\
    str r1, [r3]\n\
    str r2, [r3, 0x4]\n\
    str r5, [r3, 0x8]\n\
    ldr r0, [r3, 0x8]\n\
    adds r2, r4\n\
    adds r1, r4\n\
    subs r6, 0x1\n\
    cmp r6, 0\n\
    bge _080B40B4\n\
    add sp, 0x4\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080B40D8: .4byte gMenuWindow\n\
_080B40DC: .4byte 0x000003ff\n\
_080B40E0: .4byte 0x040000d4\n\
_080B40E4: .4byte 0x800000f0\n\
    .syntax divided");
}
#endif

static void Shop_DoCursorAction(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        if ((gMain.newAndRepeatedKeys & DPAD_ANY) == DPAD_UP) // only up can be pressed
        {
            if (gMartInfo.cursor == 0)
            {
                if (gMartInfo.choicesAbove == 0) // if there are no choices above, dont bother
                    return;

                PlaySE(SE_SELECT);
                gMartInfo.choicesAbove--; // since cursor is at the top and there are choices above the top, scroll the menu up by updating choicesAbove.
                Shop_MoveItemListUp();
                Shop_DisplayPriceInList(0, 0, 0);
                Shop_PrintItemDescText();
                Shop_TryDrawVerticalScrollIndicators();
            }
            else // if the cursor is not 0, choicesAbove cannot be updated yet since the cursor is at the top of the menu, so update cursor.
            {
                PlaySE(SE_SELECT);
                gMartInfo.cursor = Menu_MoveCursor(-1); // move cursor up
                Shop_PrintItemDescText();
            }
        }
        else if ((gMain.newAndRepeatedKeys & DPAD_ANY) == DPAD_DOWN) // only down can be pressed
        {
            if (gMartInfo.cursor == 7) // are you at the bottom of the menu?
            {
                if (gMartInfo.choicesAbove + gMartInfo.cursor == gMartInfo.itemCount) // are you at cancel?
                    return;

                PlaySE(SE_SELECT);
                gMartInfo.choicesAbove++;
                Shop_MoveItemListDown();
                Shop_DisplayPriceInList(7, 7, 0);
                Shop_PrintItemDescText();
                Shop_TryDrawVerticalScrollIndicators();
            }
            else if (gMartInfo.cursor != gMartInfo.itemCount)
            {
                PlaySE(SE_SELECT);
                gMartInfo.cursor = Menu_MoveCursor(1);
                Shop_PrintItemDescText();
            }
        }
        else if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);

            if (gMartInfo.choicesAbove + gMartInfo.cursor != gMartInfo.itemCount) // did you not hit CANCEL?
            {
                PauseVerticalScrollIndicator(TOP_ARROW);
                PauseVerticalScrollIndicator(BOTTOM_ARROW);
                SetVerticalScrollIndicators(BOTTOM_ARROW, INVISIBLE);
                Shop_DisplayPriceInList(gMartInfo.cursor, gMartInfo.cursor, 1);
                Menu_DestroyCursor();
                Menu_EraseWindowRect(0, 0xC, 0xD, 0x13);

                if (gMartInfo.martType == MART_TYPE_0)
                {
                    gMartTotalCost = (ItemId_GetPrice(gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor]) >> GetPriceReduction(1)); // set 1x price
                    if (!IsEnoughMoney(gSaveBlock1.money, gMartTotalCost))
                    {
                        DisplayItemMessageOnField(taskId, gOtherText_NotEnoughMoney, Shop_DoPricePrintAndReturnToBuyMenu, 0xC3E1); // tail merge
                    }
                    else // _080B42BA
                    {
                        CopyItemName(gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor], gStringVar1);
                        StringExpandPlaceholders(gStringVar4, gOtherText_HowManyYouWant);
                        DisplayItemMessageOnField(taskId, gStringVar4, Shop_UpdateCurItemCountToMax, 0xC3E1);                    
                    }
                }
                else // _080B428C
                {
                    gMartTotalCost = gDecorations[gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor]].price;

                    if (!IsEnoughMoney(gSaveBlock1.money, gMartTotalCost))
                    {
                        DisplayItemMessageOnField(taskId, gOtherText_NotEnoughMoney, Shop_DoPricePrintAndReturnToBuyMenu, 0xC3E1); // tail merge
                    }
                    else
                    {    
                        StringCopy(gStringVar1, gDecorations[gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor]].name);
                        ConvertIntToDecimalStringN(gStringVar2, gMartTotalCost, 0, 0x8);

                        if (gMartInfo.martType == MART_TYPE_1)
                            StringExpandPlaceholders(gStringVar4, gOtherText_ThatWillBe2);
                        else
                            StringExpandPlaceholders(gStringVar4, gOtherText_ThatWillBe3);
                        DisplayItemMessageOnField(taskId, gStringVar4, Shop_DoYesNoPurchase, 0xC3E1);
                    }
                }
            }
            else
            {
                Task_ExitBuyMenu(taskId);
            }
        }
        else if (gMain.newKeys & B_BUTTON) // go back to buy/sell/exit menu
        {
            PlaySE(SE_SELECT);
            Task_ExitBuyMenu(taskId);
        }
    }
}

static void Task_ReturnToBuyMenu(u8 taskId)
{
    Menu_EraseWindowRect(0, 0xE, 0x1D, 0x13);
    Menu_EraseWindowRect(0, 0xA, 0xD, 0xD);
    sub_80A3FA0(gBGTilemapBuffers[1], 0x1, 0xB, 0xC, 0x2, 0);
    Shop_DrawViewportTiles();
    Shop_InitMenus(6, 7);
    Shop_PrintItemDesc();
    StartVerticalScrollIndicators(TOP_ARROW);
    StartVerticalScrollIndicators(BOTTOM_ARROW);
    Shop_TryDrawVerticalScrollIndicators();
    gTasks[taskId].func = Shop_DoCursorAction;
}

static void Task_ExitBuyMenu(u8 taskId)
{
    gFieldCallback = Shop_FadeReturnToMartMenu;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
    gTasks[taskId].func = Task_ExitBuyMenuDoFade;
}

static void Task_ExitBuyMenuDoFade(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        CloseMoneyWindow(0, 0);
        BuyMenuFreeMemory();
        SetMainCallback2(c2_exit_to_overworld_2_switch);
        DestroyTask(taskId);
    }
}

// Task_UpdatePurchaseHistory
static void Task_UpdatePurchaseHistory(u8 taskId)
{
    u16 i;

    for (i = 0; i < 3; i++)
    {
        if (gMartPurchaseHistory[i].itemId == gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor]
         && gMartPurchaseHistory[i].quantity != 0)
        {
            if (gMartPurchaseHistory[i].quantity + gTasks[taskId].tItemCount > 255)
                gMartPurchaseHistory[i].quantity = 255;
            else
                gMartPurchaseHistory[i].quantity += gTasks[taskId].tItemCount;
            return;
        }
    }

    if (gMartPurchaseHistoryId < 3)
    {
        gMartPurchaseHistory[gMartPurchaseHistoryId].itemId = gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor];
        gMartPurchaseHistory[gMartPurchaseHistoryId].quantity = gTasks[taskId].tItemCount;
        gMartPurchaseHistoryId++;
    }
}

#undef tItemCount

static void ClearItemPurchases(void)
{
    gMartPurchaseHistoryId = 0;
    ClearItemSlots(gMartPurchaseHistory, 3);
}

void Shop_CreatePokemartMenu(u16 *itemList)
{
    CreateShopMenu(MART_TYPE_0);
    SetShopItemsForSale(itemList);
    ClearItemPurchases();
    SetShopMenuCallback(EnableBothScriptContexts);
}

void Shop_CreateDecorationShop1Menu(u16 *itemList)
{
    CreateShopMenu(MART_TYPE_1);
    SetShopItemsForSale(itemList);
    SetShopMenuCallback(EnableBothScriptContexts);
}

void Shop_CreateDecorationShop2Menu(u16 *itemList)
{
    CreateShopMenu(MART_TYPE_2);
    SetShopItemsForSale(itemList);
    SetShopMenuCallback(EnableBothScriptContexts);
}

#if DEBUG

void debug_sub_80C2818(void)
{
    CreateShopMenu(MART_TYPE_0);
    SetShopItemsForSale(gUnusedMartArray);
    SetShopMenuCallback(NULL);
}

#endif
