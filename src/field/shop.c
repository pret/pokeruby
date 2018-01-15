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
#include "field_map_obj.h"
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

extern bool8 sub_80A52C4(u8, u8);

extern u8 gBuyMenuFrame_Gfx[];
extern u16 gBuyMenuFrame_Tilemap[];
extern u16 gMenuMoneyPal[16];

void Shop_DisplayPriceInList(int var1, int var2, bool32 hasControlCode);
void Shop_PrintItemDescText(void);
void Shop_ReturnToBuyMenu(u8);
void sub_80B43F0(u8);
void Task_ExitBuyMenu(u8);
void sub_80B4470(u8);
void HandleShopMenuBuy(u8 taskId);
void HandleShopMenuSell(u8 taskId);
void HandleShopMenuQuit(u8 taskId);
void Shop_DoItemPurchase(u8 taskId);
void Shop_CancelItemPurchase(u8 taskId);

// iwram
static struct MartInfo gMartInfo;

// ewram
EWRAM_DATA u32 gMartTotalCost = 0;
EWRAM_DATA s16 gMartViewportObjects[16][4] = {0};
EWRAM_DATA struct ItemSlot gMartPurchaseHistory[3] = {0};
EWRAM_DATA u8 gMartPurchaseHistoryId = 0;
EWRAM_DATA u8 gUnknown_02038731 = 0;

// rodata
static const struct MenuAction2 sBuySellQuitMenuActions[] =
{
    { MartText_Buy, HandleShopMenuBuy },
    { MartText_Sell, HandleShopMenuSell },
    { MartText_Quit2, HandleShopMenuQuit },
};

static const u8 gMartBuySellOptionList[] = {BUY, SELL, EXIT};
static const u8 gMartBuyNoSellOptionList[] = {BUY, EXIT};

static const u16 gUnusedMartArray[] = {0x2, 0x3, 0x4, 0xD, 0x121, 0xE, 0xE, 0xE, 0xE, 0xE, 0xE, 0x0, 0x0};

static const struct YesNoFuncTable sShopPurchaseYesNoFuncs[] =
{
    Shop_DoItemPurchase,
    Shop_CancelItemPurchase
};

u8 CreateShopMenu(u8 martType)
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

    return CreateTask(sub_80B2E38, 8);
}

void SetShopMenuCallback(void *callbackPtr)
{
    gMartInfo.callback = callbackPtr;
}

void SetShopItemsForSale(u16 *items)
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

void sub_80B2E38(u8 var)
{
    const u8 local = var;

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
        {
            sBuySellQuitMenuActions[gMartBuySellOptionList[gMartInfo.cursor]].func(local);
        }
        else
        {
            sBuySellQuitMenuActions[gMartBuyNoSellOptionList[gMartInfo.cursor]].func(local);
        }
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
        HandleShopMenuQuit(local);
    }
}

void HandleShopMenuBuy(u8 taskId)
{
    gTasks[taskId].data[8] = (u32)BuyMenuDrawGraphics >> 16;
    gTasks[taskId].data[9] = (u32)BuyMenuDrawGraphics;
    gTasks[taskId].func = Shop_FadeAndRunBuySellCallback;
    fade_screen(1, 0);
}

void HandleShopMenuSell(u8 taskId)
{
    gTasks[taskId].data[8] = (u32)ItemMenu_LoadSellMenu >> 16;
    gTasks[taskId].data[9] = (u32)ItemMenu_LoadSellMenu;
    gTasks[taskId].func = Shop_FadeAndRunBuySellCallback;
    fade_screen(1, 0);
}

void HandleShopMenuQuit(u8 taskId)
{
    Menu_DestroyCursor();
    Menu_EraseWindowRect(0, 0, 11, 8);
    sub_80BE3BC();
    ScriptContext2_Disable();
    DestroyTask(taskId);

    if (gMartInfo.callback)
        gMartInfo.callback(); // run the callback if it exists.
}

void Shop_FadeAndRunBuySellCallback(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2((void *)((u16)gTasks[taskId].data[8] << 16 | (u16)gTasks[taskId].data[9]));
        DestroyTask(taskId);
    }
}

void ReturnToShopMenuAfterExitingSellMenu(u8 taskId)
{
    CreateShopMenu(gMartInfo.martType);
    DestroyTask(taskId);
}

void Task_ExitSellMenu(u8 taskId)
{
    if (sub_807D770() == 1)
    {
        if (gMartInfo.martType == MART_TYPE_2)
            DisplayItemMessageOnField(taskId, gOtherText_CanIHelpYou, ReturnToShopMenuAfterExitingSellMenu, 0);
        else
            DisplayItemMessageOnField(taskId, gOtherText_AnythingElse, ReturnToShopMenuAfterExitingSellMenu, 0);
    }
}

void Shop_InitExitSellMenu(void)
{
    pal_fill_black();
    CreateTask(Task_ExitSellMenu, 0x8);
}

void Shop_RunExitSellMenuTask(u8 taskId)
{
    Task_ExitSellMenu(taskId);
}

// unused
void Shop_LoadExitSellMenuTask(u8 taskId)
{
    gTasks[taskId].func = Task_ExitSellMenu;
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

void BuyMenuDrawGraphics(void)
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
    sub_80B3764(0, 7);
    Shop_PrintItemDesc();
    sub_80B3270();
    CreateTask(sub_80B40E8, 0x8);
    sub_80B3240();
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0x10, 0, 0);
    gPaletteFade.bufferTransferDisabled = 0;
    SetVBlankCallback(VBlankCB);
    SetMainCallback2(MainCB2);
}

void sub_80B3240(void)
{
    u16 colors[2] = {RGB(14, 15, 16), RGB_WHITE};

    LoadPalette(&colors[1], 0xD1, sizeof colors[1]);
    LoadPalette(&colors[0], 0xD8, sizeof colors[0]);
}

void sub_80B3270(void)
{
    ClearVerticalScrollIndicatorPalettes();

    if (gMartInfo.itemCount > 7)
    {
        CreateVerticalScrollIndicators(TOP_ARROW, 172, 12);
        CreateVerticalScrollIndicators(BOTTOM_ARROW, 172, 148);
        SetVerticalScrollIndicators(TOP_ARROW, INVISIBLE);
    }
}

void Shop_TryDrawVerticalScrollIndicators(void)
{
    // TOP ARROW
    if (gMartInfo.choicesAbove == 0)
        SetVerticalScrollIndicators(TOP_ARROW, INVISIBLE);
    else
        SetVerticalScrollIndicators(TOP_ARROW, VISIBLE);

    // DOWN ARROW
    if (gMartInfo.choicesAbove + 7 >= gMartInfo.itemCount)
        SetVerticalScrollIndicators(BOTTOM_ARROW, INVISIBLE);
    else
        SetVerticalScrollIndicators(BOTTOM_ARROW, VISIBLE);
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

void BuyMenuDrawMapMetatile(int var1, int var2, u16 *var3, s32 var4)
{
    u8 tempVar4 = var4;
    s16 offset1 = var1 * 2;
    s16 offset2 = (var2 * 0x40) + 0x40;

    switch (tempVar4)
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

void sub_80B33D0(s16 var1, int var2, u16 *var3)
{
    s16 offset1 = var1 * 2;
    s16 offset2 = (var2 * 0x40) + 0x40;

    BuyMenuDrawMapMetatileLayer(gBGTilemapBuffers[3], offset1, offset2, var3);
    BuyMenuDrawMapMetatileLayer(gBGTilemapBuffers[2], offset1, offset2, var3 + 4);
}

void Shop_DrawViewportTiles(void)
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
                    BuyMenuDrawMapMetatile(x, y, (u16 *)gMapHeader.mapData->primaryTileset->metatiles + metatileId * 8, r3);
                else
                    BuyMenuDrawMapMetatile(x, y, (u16 *)gMapHeader.mapData->secondaryTileset->metatiles + (metatileId - 512) * 8, r3);
            }
            else
            {
                if (metatileId < 512)
                    sub_80B33D0(x, y, (u16 *)gMapHeader.mapData->primaryTileset->metatiles + metatileId * 8);
                else
                    sub_80B33D0(x, y, (u16 *)gMapHeader.mapData->secondaryTileset->metatiles + (metatileId - 512) * 8);
            }

            if (y == 0 && x != 0 && x != 6)
                sub_80B32EC(gBGTilemapBuffers[1], x * 2, 64);
        }
    }
}

void Shop_DrawViewport(void)
{
    ClearBGTilemapBuffers();
    Shop_LoadViewportObjects();
    Shop_AnimViewportObjects();
    Shop_DrawViewportTiles();
}

void Shop_LoadViewportObjects(void)
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
        gMartViewportObjects[y][MAP_OBJ_ID] = 16;
    for (y = 0; y < 5; y++)
    {
        for (x = 0; x < 7; x++)
        {
            u8 mapObjId = GetFieldObjectIdByXYZ(facingX - 3 + x, facingY - 2 + y, playerHeight);

            if (mapObjId != 16)
            {
                gMartViewportObjects[r8][MAP_OBJ_ID] = mapObjId;
                gMartViewportObjects[r8][X_COORD] = x;
                gMartViewportObjects[r8][Y_COORD] = y;
                if (gMapObjects[mapObjId].mapobj_unk_18 == 1)
                    gMartViewportObjects[r8][ANIM_NUM] = 0;
                if (gMapObjects[mapObjId].mapobj_unk_18 == 2)
                    gMartViewportObjects[r8][ANIM_NUM] = 1;
                if (gMapObjects[mapObjId].mapobj_unk_18 == 3)
                    gMartViewportObjects[r8][ANIM_NUM] = 2;
                if (gMapObjects[mapObjId].mapobj_unk_18 == 4)
                    gMartViewportObjects[r8][ANIM_NUM] = 3;
                r8++;
            }
        }
    }
}

void Shop_AnimViewportObjects(void)
{
    u8 i;

    for (i = 0; i < 16; i++) // max objects?
    {
        if (gMartViewportObjects[i][MAP_OBJ_ID] == 16)
            continue;

        StartSpriteAnim(&gSprites[AddPseudoFieldObject(
            gMapObjects[gMartViewportObjects[i][MAP_OBJ_ID]].graphicsId,
            SpriteCallbackDummy,
            (u16)gMartViewportObjects[i][X_COORD] * 16 + 8,
            (u16)gMartViewportObjects[i][Y_COORD] * 16 + 32,
            2)],
            gMartViewportObjects[i][ANIM_NUM]);
    }
}

void sub_80B3720(void)
{
    s16 i;
    
    for (i = 0; i < 0x400; i++)
    {
        if (ewram18000[i] != 0)
            gBGTilemapBuffers[1][i] = ewram18000[i] + 0xC3E0;
    }
}

void sub_80B3764(int var1, int var2)
{
    sub_80B3720();
    Shop_DisplayPriceInList(var1, var2, 0);
    InitMenu(0, 0xE, 0x2, 0x8, gMartInfo.cursor, 0xF);
}

void sub_80B379C(void)
{
    u16 i, j;

    for (i = 0; i < 8; i++)
        for (j = 0; j < 14; j++)
            gBGTilemapBuffers[1][32 * (i + 12) + j] = ewram18300[32 * i + j] + 0xC3E0;
}

void Shop_PrintItemDesc(void)
{
    Shop_PrintItemDescText();
}

#define tItemCount data[1]

void Shop_DisplayPriceInCheckoutWindow(u8 taskId)
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

void Shop_DisplayNormalPriceInList(u16 itemId, u8 var2, bool32 hasControlCode)
{
    u8 *stringPtr = gStringVar1;

    if (hasControlCode != FALSE)
    {
        stringPtr[0] = EXT_CTRL_CODE_BEGIN;
        stringPtr[1] = 0x1;
        stringPtr[2] = 0x2;
        stringPtr += 3;
    }

    CopyItemName(itemId, stringPtr);

    sub_8072A18(&gStringVar1[0], 0x70, var2 << 3, 0x58, 0x1);
    stringPtr = gStringVar1;

    if (hasControlCode != FALSE)
        stringPtr = &gStringVar1[3];

    GetMoneyAmountText(stringPtr, (ItemId_GetPrice(itemId) >> GetPriceReduction(1)), 0x4);
    Menu_PrintTextPixelCoords(&gStringVar1[0], 0xCA, var2 << 3, 1);
}

void Shop_DisplayDecorationPriceInList(u16 itemId, u8 var2, bool32 hasControlCode)
{
    u8 *stringPtr = gStringVar1;

    if (hasControlCode != FALSE)
    {
        stringPtr[0] = EXT_CTRL_CODE_BEGIN;
        stringPtr[1] = 0x1;
        stringPtr[2] = 0x2;
        stringPtr += 3;
    }

    StringCopy(stringPtr, gDecorations[itemId].name);
    sub_8072A18(&gStringVar1[0], 0x70, var2 << 3, 0x58, 0x1);
    stringPtr = gStringVar1;

    if (hasControlCode != FALSE)
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

void Shop_DisplayPriceInList(int var1, int var2, bool32 hasControlCode)
{
    u8 i;

    for (i = var1; i <= var2 && gMartInfo.choicesAbove + i < gMartInfo.itemCount; i++)
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

void Shop_PrintItemDescText(void)
{
    if (gMartInfo.choicesAbove + gMartInfo.cursor != gMartInfo.itemCount)
    {
        if (gMartInfo.martType == MART_TYPE_0)
        {
            sub_8072AB0(ItemId_GetDescription(gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor]),
                0x4, 0x68, 0x68, 0x30, 0);
        }
        else
            sub_8072AB0(gDecorations[gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor]].description,
                0x4, 0x68, 0x68, 0x30, 0);
    }
    else
    {
        sub_8072AB0(gOtherText_QuitShopping, 0x4, 0x68, 0x68, 0x30, 0);
    }
}

void sub_80B3AEC(u8 taskId)
{
    if (gMain.newKeys & A_BUTTON || gMain.newKeys & B_BUTTON)
    {
        Shop_DisplayPriceInList(gMartInfo.cursor, gMartInfo.cursor, 0);
        PlaySE(SE_SELECT);

        if (gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor] == ITEM_POKE_BALL && gTasks[taskId].tItemCount >= 10 && AddBagItem(ITEM_PREMIER_BALL, 1) == TRUE)
            DisplayItemMessageOnField(taskId, gOtherText_FreePremierBall, Shop_ReturnToBuyMenu, 0xC3E1);
        else
            Shop_ReturnToBuyMenu(taskId);
    }
}

void sub_80B3B80(u8 taskId)
{
    IncrementGameStat(0x26);
    RemoveMoney(&gSaveBlock1.money, gMartTotalCost);
    PlaySE(SE_REGI);
    UpdateMoneyWindow(gSaveBlock1.money, 0, 0);
    gTasks[taskId].func = sub_80B3AEC;
}

void sub_80B3BD0(u8 taskId)
{
    Shop_DisplayPriceInList(gMartInfo.cursor, gMartInfo.cursor, 0); // same thing as above?
    Shop_ReturnToBuyMenu(taskId);
}

void Shop_DoItemPurchase(u8 taskId)
{
    Menu_EraseWindowRect(0x7, 0x8, 0xD, 0xD);
    sub_80A3FA0(gBGTilemapBuffers[1], 8, 9, 4, 4, 0);
    sub_80B379C();
    Shop_DrawViewportTiles();

    if (IsEnoughMoney(gSaveBlock1.money, gMartTotalCost))
    {
        if (gMartInfo.martType == MART_TYPE_0)
        {
            if (AddBagItem(gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor], gTasks[taskId].tItemCount))
            {
                DisplayItemMessageOnField(taskId, gOtherText_HereYouGo, sub_80B3B80, 0xC3E1);
                sub_80B4470(taskId);
            }
            else
                DisplayItemMessageOnField(taskId, gOtherText_NoRoomFor, sub_80B3BD0, 0xC3E1);
        }
        else // a normal mart is only type 0, so types 1 and 2 are decoration marts.
        {
            if (IsThereStorageSpaceForDecoration(gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor]))
            {
                if (gMartInfo.martType == MART_TYPE_1)
                    DisplayItemMessageOnField(taskId, gOtherText_HereYouGo2, sub_80B3B80, 0xC3E1);
                else
                    DisplayItemMessageOnField(taskId, gOtherText_HereYouGo3, sub_80B3B80, 0xC3E1);
            }
            else
            {
                StringExpandPlaceholders(gStringVar4, gOtherText_SpaceForIsFull);
                DisplayItemMessageOnField(taskId, gStringVar4, sub_80B3BD0, 0xC3E1);
            }
        }
    }
    else
        DisplayItemMessageOnField(taskId, gOtherText_NotEnoughMoney, sub_80B3BD0, 0xC3E1);
}

void Shop_DoYesNoPurchase(u8 taskId)
{
    DisplayYesNoMenu(7, 8, 1);
    sub_80A3FA0(gBGTilemapBuffers[1], 8, 9, 4, 4, 0xC3E1);
    DoYesNoFuncWithChoice(taskId, sShopPurchaseYesNoFuncs);
}

void Shop_CancelItemPurchase(u8 taskId)
{
    Shop_DisplayPriceInList(gMartInfo.cursor, gMartInfo.cursor, 0);
    Menu_EraseWindowRect(0x7, 0x8, 0xD, 0xD);
    sub_80A3FA0(gBGTilemapBuffers[1], 0x8, 0x9, 0x4, 0x4, 0);
    Shop_ReturnToBuyMenu(taskId);
}

void Shop_PrintPrice(u8 taskId)
{
    if (sub_80A52C4(taskId, gMartInfo.curItemCount) == TRUE)
        Shop_DisplayPriceInCheckoutWindow(taskId);

    if (gMain.newKeys & A_BUTTON)
    {
        gMartTotalCost = (ItemId_GetPrice(gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor]) >> GetPriceReduction(1)) * gTasks[taskId].tItemCount; // set total cost of your purchase.
        Menu_EraseWindowRect(0, 0xA, 0xD, 0xD);
        sub_80A3FA0(gBGTilemapBuffers[1], 0x1, 0xB, 0xC, 0x2, 0);
        sub_80B379C();
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
        Shop_ReturnToBuyMenu(taskId);
    }
}

void sub_80B3EFC(u8 taskId)
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
void sub_80B3F88(void)
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
__attribute__((naked))
void sub_80B3F88(void)
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
void sub_80B403C(void)
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
__attribute__((naked))
void sub_80B403C(void)
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

void sub_80B40E8(u8 taskId) // Mart_DoCursorAction
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
                sub_80B3F88();
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
                sub_80B403C();
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
                        DisplayItemMessageOnField(taskId, gOtherText_NotEnoughMoney, sub_80B3BD0, 0xC3E1); // tail merge
                    }
                    else // _080B42BA
                    {
                        CopyItemName(gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor], gStringVar1);
                        StringExpandPlaceholders(gStringVar4, gOtherText_HowManyYouWant);
                        DisplayItemMessageOnField(taskId, gStringVar4, sub_80B3EFC, 0xC3E1);                    
                    }
                }
                else // _080B428C
                {
                    gMartTotalCost = gDecorations[gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor]].price;

                    if (!IsEnoughMoney(gSaveBlock1.money, gMartTotalCost))
                    {
                        DisplayItemMessageOnField(taskId, gOtherText_NotEnoughMoney, sub_80B3BD0, 0xC3E1); // tail merge
                    }
                    else
                    {    
                        StringCopy(gStringVar1, gDecorations[gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor]].name);
                        ConvertIntToDecimalStringN(gStringVar2, gMartTotalCost, 0, 0x8);

                        if (gMartInfo.martType == MART_TYPE_1)
                        {
                            StringExpandPlaceholders(gStringVar4, gOtherText_ThatWillBe2);
                        }
                        else
                        {
                            StringExpandPlaceholders(gStringVar4, gOtherText_ThatWillBe3);
                        }
                        DisplayItemMessageOnField(taskId, gStringVar4, Shop_DoYesNoPurchase, 0xC3E1);
                    }
                }
            }
            else
                sub_80B43F0(taskId);
        }
        else if (gMain.newKeys & B_BUTTON) // go back to buy/sell/exit menu
        {
            PlaySE(SE_SELECT);
            sub_80B43F0(taskId);
        }
    }
}

void Shop_ReturnToBuyMenu(u8 taskId)
{
    Menu_EraseWindowRect(0, 0xE, 0x1D, 0x13);
    Menu_EraseWindowRect(0, 0xA, 0xD, 0xD);
    sub_80A3FA0(gBGTilemapBuffers[1], 0x1, 0xB, 0xC, 0x2, 0);
    Shop_DrawViewportTiles();
    sub_80B3764(6, 7);
    Shop_PrintItemDesc();
    StartVerticalScrollIndicators(TOP_ARROW);
    StartVerticalScrollIndicators(BOTTOM_ARROW);
    Shop_TryDrawVerticalScrollIndicators();
    gTasks[taskId].func = sub_80B40E8;
}

void sub_80B43F0(u8 taskId)
{
    gFieldCallback = Shop_InitExitSellMenu;
    BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
    gTasks[taskId].func = Task_ExitBuyMenu;
}

void Task_ExitBuyMenu(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        CloseMoneyWindow(0, 0);
        BuyMenuFreeMemory();
        SetMainCallback2(c2_exit_to_overworld_2_switch);
        DestroyTask(taskId);
    }
}

void sub_80B4470(u8 taskId)
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

void ClearItemPurchases(void)
{
    gMartPurchaseHistoryId = 0;
    ClearItemSlots(gMartPurchaseHistory, 3);
}

void CreatePokemartMenu(u16 *itemList)
{
    CreateShopMenu(MART_TYPE_0);
    SetShopItemsForSale(itemList);
    ClearItemPurchases();
    SetShopMenuCallback(EnableBothScriptContexts);
}

void CreateDecorationShop1Menu(u16 *itemList)
{
    CreateShopMenu(MART_TYPE_1);
    SetShopItemsForSale(itemList);
    SetShopMenuCallback(EnableBothScriptContexts);
}

void CreateDecorationShop2Menu(u16 *itemList)
{
    CreateShopMenu(MART_TYPE_2);
    SetShopItemsForSale(itemList);
    SetShopMenuCallback(EnableBothScriptContexts);
}

void sub_80B45B4(u8 taskId, const s16 *list, u16 c)
{
    s16 r5 = gTasks[taskId].data[4] - 1;
    s16 r3 = gTasks[taskId].data[5] - 1;
    s16 r4 = gTasks[taskId].data[1];
    s16 y;
    s16 x;
    
    if (gTasks[taskId].data[2] == 0)
    {
        for (y = 0; y < 3; y++)
        {
            for (x = 0; x < 3; x++)
            {
                s16 metatileId = MapGridGetMetatileIdAt(r5 + x, r3 + y);
                
                if (list[r4] == metatileId)
                {
                    if (r4 != 2)
                        MapGridSetMetatileIdAt(r5 + x, r3 + y, c | list[r4 + 1]);
                    else
                        MapGridSetMetatileIdAt(r5 + x, r3 + y, c | list[0]);
                }
            }
        }
    }
    else
    {
        for (y = 0; y < 3; y++)
        {
            for (x = 0; x < 3; x++)
            {
                s16 metatileId = MapGridGetMetatileIdAt(r5 + x, r3 + y);
                
                if (list[2 - r4] == metatileId)
                {
                    if (r4 != 2)
                        MapGridSetMetatileIdAt(r5 + x, r3 + y, c | list[1 - r4]);
                    else
                        MapGridSetMetatileIdAt(r5 + x, r3 + y, c | list[2]);
                }
            }
        }
    }
}

static const u16 gUnknown_083CC714[] = {0x284, 0x282, 0x280};
static const u16 gUnknown_083CC71A[] = {0x285, 0x283, 0x281};
static const u16 gUnknown_083CC720[] = {0x28C, 0x28A, 0x288};
static const u16 gUnknown_083CC726[] = {0x28D, 0x28B, 0x289};
static const u16 gUnknown_083CC72C[] = {0x2A0, 0x2A2, 0x2A4};
static const u16 gUnknown_083CC732[] = {0x2A1, 0x2A3, 0x2A5};
static const u16 gUnknown_083CC738[] = {0x2A8, 0x2AA, 0x2AC};

void sub_80B4710(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    data[3] = 1;

    switch (data[0])
    {
        case 0:
            sub_80B45B4(taskId, gUnknown_083CC714, 0);
            break;
        case 1:
            sub_80B45B4(taskId, gUnknown_083CC71A, 0);
            break;
        case 2:
            sub_80B45B4(taskId, gUnknown_083CC720, 0xC00);
            break;
        case 3:
            sub_80B45B4(taskId, gUnknown_083CC726, 0);
            break;
        case 4:
            sub_80B45B4(taskId, gUnknown_083CC72C, 0xC00);
            break;
        case 5:
            sub_80B45B4(taskId, gUnknown_083CC732, 0);
            break;
        case 6:
            sub_80B45B4(taskId, gUnknown_083CC738, 0);
            break;
    }

    data[0] = (data[0] + 1) & 7;
    if (!data[0])
    {
        DrawWholeMapView();
        data[1] = (data[1] + 1) % 3;
        data[3] = 0;
    }
}

u8 sub_80B47D8(u16 var)
{
    u8 taskId = CreateTask(sub_80B4710, 0);
    s16 *data = gTasks[taskId].data;

    PlayerGetDestCoords(&data[4], &data[5]);
    data[0] = 0;
    data[1] = 0;
    data[2] = var;
    sub_80B4710(taskId);
    return taskId;
}

void sub_80B4824(u8 var)
{
    gUnknown_02038731 = sub_80B47D8(var);
}

void sub_80B483C(void)
{
    DestroyTask(gUnknown_02038731);
}

bool8 sub_80B4850(void)
{
    if (gTasks[gUnknown_02038731].data[3] == 0 && gTasks[gUnknown_02038731].data[1] == 2)
        return FALSE;
    else
        return TRUE;
}
