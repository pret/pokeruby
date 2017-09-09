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
#include "unknown_task.h"
#include "field_map_obj.h"
#include "field_player_avatar.h"
#include "fieldmap.h"
#include "item.h"
#include "decoration.h"
#include "items.h"
#include "songs.h"
#include "rom4.h"
#include "decoration_inventory.h"
#include "field_camera.h"

#define ewram18000 ((u16 *)(ewram + 0x18000))
#define ewram18300 ((u16 *)(ewram + 0x18300))

extern bool8 sub_80A52C4(u8, u8);

extern u8 ewram[];
extern u8 gBuyMenuFrame_Gfx[];
extern u16 gBuyMenuFrame_Tilemap[];
extern u16 gMenuMoneyPal[16];

void sub_80B39D0(int var1, int var2, bool32 hasControlCode);
void sub_80B3A70(void);
void sub_80B4378(u8);
void sub_80B43F0(u8);
void Task_ExitBuyMenu(u8);
void sub_80B4470(u8);
void sub_80B2EFC(u8 taskId);
void sub_80B2F30(u8 taskId);
void HandleShopMenuQuit(u8 taskId);
void sub_80B3BF4(u8 taskId);
void sub_80B3D7C(u8 taskId);

// iwram
static struct MartInfo gMartInfo;

// ewram
EWRAM_DATA u32 gMartTotalCost = 0;
EWRAM_DATA s16 gUnknown_020386A4[16][4] = {0}; // game freak barely uses 2d arrays wtf?
EWRAM_DATA struct ItemSlot gUnknown_02038724[3] = {0}; // tv.c uses this, so it cant be static
EWRAM_DATA u8 gUnknown_02038730 = 0;
EWRAM_DATA u8 gUnknown_02038731 = 0;

// rodata
static const struct MenuAction2 gUnknown_083CC6D0[] =
{
    { MartText_Buy, sub_80B2EFC },
    { MartText_Sell, sub_80B2F30 },
    { MartText_Quit2, HandleShopMenuQuit },
};

static const u8 gUnknown_083CC6E8[] = {0, 1, 2}; // BUY SELL EXIT
static const u8 gUnknown_083CC6EB[] = {0, 2}; // BUY EXIT

static const u16 gUnusedMartArray[] = {0x2, 0x3, 0x4, 0xD, 0x121, 0xE, 0xE, 0xE, 0xE, 0xE, 0xE, 0x0, 0x0};

static const struct YesNoFuncTable gUnknown_083CC708[] =
{
    sub_80B3BF4,
    sub_80B3D7C
};

u8 CreateShopMenu(u8 martType)
{
    ScriptContext2_Enable();
    gMartInfo.martType = martType;
    gMartInfo.cursor = 0;

    if (martType == MART_TYPE_0)
    {
        gMartInfo.numChoices = 2;
        MenuDrawTextWindow(0, 0, 10, 7);
        PrintMenuItemsReordered(1, 1, 3, (struct MenuAction *)gUnknown_083CC6D0, (u8 *)gUnknown_083CC6E8);
    }
    else
    {
        gMartInfo.numChoices = 1;
        MenuDrawTextWindow(0, 0, 10, 5);
        PrintMenuItemsReordered(1, 1, 2, (struct MenuAction *)gUnknown_083CC6D0, (u8 *)gUnknown_083CC6EB);
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
            gMartInfo.cursor = MoveMenuCursor(-1);
        }
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        if (gMartInfo.cursor != gMartInfo.numChoices) // can move cursor down?
        {
            PlaySE(SE_SELECT);
            gMartInfo.cursor = MoveMenuCursor(1);
        }
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        if (gMartInfo.martType == MART_TYPE_0)
        {
            gUnknown_083CC6D0[gUnknown_083CC6E8[gMartInfo.cursor]].func(local);
        }
        else
        {
            gUnknown_083CC6D0[gUnknown_083CC6EB[gMartInfo.cursor]].func(local);
        }
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
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
    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(0, 0, 11, 8);
    sub_80BE3BC();
    ScriptContext2_Disable();
    DestroyTask(taskId);

    if (gMartInfo.callback)
        gMartInfo.callback(); // run the callback if it exists.
}

void sub_80B2FA0(u8 taskId)
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
    gMartInfo.cursor = zero;
    gMartInfo.choicesAbove = zero2;
    MenuZeroFillWindowRect(0, 0, 0x20, 0x20);
    OpenMoneyWindow(gSaveBlock1.money, 0, 0);
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
    u16 tempArr[2] = {0x41EE, 0x7FFF};

    LoadPalette(&tempArr[1], 0xD1, 2);
    LoadPalette(&tempArr[0], 0xD8, 2);
}

void sub_80B3270(void)
{
    sub_80F944C();

    if (gMartInfo.itemCount > 7)
    {
        CreateVerticalScrollIndicators(0, 172, 12);
        CreateVerticalScrollIndicators(1, 172, 148);
        sub_80F979C(0, 1);
    }
}

void sub_80B32A4(void)
{
    if (gMartInfo.choicesAbove == 0)
        sub_80F979C(0, 1);
    else
        sub_80F979C(0, 0);

    if (gMartInfo.choicesAbove + 7 >= gMartInfo.itemCount)
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

void sub_80B3420(void)
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

void BuyMenuDrawMapGraphics(void)
{
    sub_80F9020();
    sub_80B356C();
    sub_80B368C();
    sub_80B3420();
}

void sub_80B356C(void)
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
        gUnknown_020386A4[y][MAP_OBJ_ID] = 16;
    for (y = 0; y < 5; y++)
    {
        for (x = 0; x < 7; x++)
        {
            u8 mapObjId = GetFieldObjectIdByXYZ(facingX - 3 + x, facingY - 2 + y, playerHeight);

            if (mapObjId != 16)
            {
                gUnknown_020386A4[r8][MAP_OBJ_ID] = mapObjId;
                gUnknown_020386A4[r8][X_COORD] = x;
                gUnknown_020386A4[r8][Y_COORD] = y;
                if (gMapObjects[mapObjId].mapobj_unk_18 == 1)
                    gUnknown_020386A4[r8][ANIM_NUM] = 0;
                if (gMapObjects[mapObjId].mapobj_unk_18 == 2)
                    gUnknown_020386A4[r8][ANIM_NUM] = 1;
                if (gMapObjects[mapObjId].mapobj_unk_18 == 3)
                    gUnknown_020386A4[r8][ANIM_NUM] = 2;
                if (gMapObjects[mapObjId].mapobj_unk_18 == 4)
                    gUnknown_020386A4[r8][ANIM_NUM] = 3;
                r8++;
            }
        }
    }
}

void sub_80B368C(void)
{
    u8 i;

    for (i = 0; i < 16; i++) // max objects?
    {
        if (gUnknown_020386A4[i][MAP_OBJ_ID] == 16)
            continue;

        StartSpriteAnim(&gSprites[AddPseudoFieldObject(
            gMapObjects[gUnknown_020386A4[i][MAP_OBJ_ID]].graphicsId,
            SpriteCallbackDummy,
            (u16)gUnknown_020386A4[i][X_COORD] * 16 + 8,
            (u16)gUnknown_020386A4[i][Y_COORD] * 16 + 32,
            2)],
            gUnknown_020386A4[i][ANIM_NUM]);
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
    sub_80B39D0(var1, var2, 0);
    InitMenu(0, 0xE, 0x2, 0x8, gMartInfo.cursor, 0xF);
}

void sub_80B379C(void)
{
    u16 i, j;

    for (i = 0; i < 8; i++)
        for (j = 0; j < 14; j++)
            gBGTilemapBuffers[1][32 * (i + 12) + j] = ewram18300[32 * i + j] + 0xC3E0;
}

void sub_80B37EC(void)
{
    sub_80B3A70();
}

void sub_80B37F8(u8 taskId)
{
    u16 itemListIndex = gMartInfo.choicesAbove + gMartInfo.cursor;
    u16 itemId = gMartInfo.itemList[itemListIndex];
    u32 price = (ItemId_GetPrice(itemId) >> GetPriceReduction(1));

    PrintMoneyAmount(gTasks[taskId].data[1] * price, 6, 6, 11);
    gStringVar1[0] = EXT_CTRL_CODE_BEGIN;
    gStringVar1[1] = 0x14;
    gStringVar1[2] = 0x6;
    ConvertIntToDecimalStringN(&gStringVar1[3], gTasks[taskId].data[1], 1, 2);
    MenuPrint(gOtherText_xString1, 1, 11);
    sub_80A3FA0(gBGTilemapBuffers[1], 1, 11, 12, 2, 0xC3E1);
}

void sub_80B389C(u16 itemId, u8 var2, bool32 hasControlCode)
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
    MenuPrint_PixelCoords(&gStringVar1[0], 0xCA, var2 << 3, 1);
}

void sub_80B3930(u16 itemId, u8 var2, bool32 hasControlCode)
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

    if (gDecorations[itemId].price == 10000)
    {
        sub_80B7B34(0x19, var2, hasControlCode); // huh???
    }
    else
    {
        GetMoneyAmountText(stringPtr, gDecorations[itemId].price, 0x4);
        MenuPrint_PixelCoords(&gStringVar1[0], 0xCA, var2 << 3, 0x1);
    }
}

void sub_80B39D0(int var1, int var2, bool32 hasControlCode)
{
    u8 i;

    for (i = var1; i <= var2 && gMartInfo.choicesAbove + i < gMartInfo.itemCount; i++)
    {
        if (gMartInfo.martType == MART_TYPE_0)
            sub_80B389C(gMartInfo.itemList[gMartInfo.choicesAbove + i], (i << 1) + 2, hasControlCode);
        else
            sub_80B3930(gMartInfo.itemList[gMartInfo.choicesAbove + i], (i << 1) + 2, hasControlCode);
    }

    if (i != 8 && gMartInfo.choicesAbove + i == gMartInfo.itemCount)
    {
        MenuFillWindowRectWithBlankTile(0xE, (i << 1) + 2, 0x1C, (i << 1) + 3);
        MenuPrint(gOtherText_CancelNoTerminator, 0xE, (i << 1) + 2);
    }
}

void sub_80B3A70(void)
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
        sub_80B39D0(gMartInfo.cursor, gMartInfo.cursor, 0); // huh???
        PlaySE(SE_SELECT);

        if (gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor] == ITEM_POKE_BALL && gTasks[taskId].data[1] >= 10 && AddBagItem(ITEM_PREMIER_BALL, 1) == TRUE)
            DisplayItemMessageOnField(taskId, gOtherText_FreePremierBall, sub_80B4378, 0xC3E1);
        else
            sub_80B4378(taskId);
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
    sub_80B39D0(gMartInfo.cursor, gMartInfo.cursor, 0); // same thing as above?
    sub_80B4378(taskId);
}

void sub_80B3BF4(u8 taskId)
{
    MenuZeroFillWindowRect(0x7, 0x8, 0xD, 0xD);
    sub_80A3FA0(gBGTilemapBuffers[1], 8, 9, 4, 4, 0);
    sub_80B379C();
    sub_80B3420();

    if (IsEnoughMoney(gSaveBlock1.money, gMartTotalCost))
    {
        if (gMartInfo.martType == MART_TYPE_0)
        {
            if (AddBagItem(gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor], gTasks[taskId].data[1]))
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

void sub_80B3D38(u8 taskId)
{
    DisplayYesNoMenu(7, 8, 1);
    sub_80A3FA0(gBGTilemapBuffers[1], 8, 9, 4, 4, 0xC3E1);
    DoYesNoFuncWithChoice(taskId, gUnknown_083CC708);
}

void sub_80B3D7C(u8 taskId)
{
    sub_80B39D0(gMartInfo.cursor, gMartInfo.cursor, 0);
    MenuZeroFillWindowRect(0x7, 0x8, 0xD, 0xD);
    sub_80A3FA0(gBGTilemapBuffers[1], 0x8, 0x9, 0x4, 0x4, 0);
    sub_80B4378(taskId);
}

void sub_80B3DC8(u8 taskId)
{
    if (sub_80A52C4(taskId, gMartInfo.curItemCount) == TRUE)
        sub_80B37F8(taskId);

    if (gMain.newKeys & A_BUTTON)
    {
        gMartTotalCost = (ItemId_GetPrice(gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor]) >> GetPriceReduction(1)) * gTasks[taskId].data[1]; // set total cost of your purchase.
        MenuZeroFillWindowRect(0, 0xA, 0xD, 0xD);
        sub_80A3FA0(gBGTilemapBuffers[1], 0x1, 0xB, 0xC, 0x2, 0);
        sub_80B379C();
        sub_80B3420();
        CopyItemName(gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor], gStringVar1);
        ConvertIntToDecimalStringN(gStringVar2, gTasks[taskId].data[1], 0, 0x2);
        ConvertIntToDecimalStringN(gStringVar3, gMartTotalCost, 0, 0x8);
        StringExpandPlaceholders(gStringVar4, gOtherText_ThatWillBe);
        DisplayItemMessageOnField(taskId, gStringVar4, sub_80B3D38, 0xC3E1);
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        sub_80B39D0(gMartInfo.cursor, gMartInfo.cursor, 0);
        sub_80B4378(taskId);
    }
}

void sub_80B3EFC(u8 taskId)
{
    u16 var;

    gTasks[taskId].data[1] = 1;
    MenuDrawTextWindow(0, 0xA, 0xD, 0xD);
    sub_80B37F8(taskId);

    var = gSaveBlock1.money / (ItemId_GetPrice(gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor]) >> GetPriceReduction(1));
    if (var > 99)
        gMartInfo.curItemCount = 99;
    else
        gMartInfo.curItemCount = var;

    gTasks[taskId].func = sub_80B3DC8;
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
                sub_80B39D0(0, 0, 0);
                sub_80B3A70();
                sub_80B32A4();
            }
            else // if the cursor is not 0, choicesAbove cannot be updated yet since the cursor is at the top of the menu, so update cursor.
            {
                PlaySE(SE_SELECT);
                gMartInfo.cursor = MoveMenuCursor(-1); // move cursor up
                sub_80B3A70();
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
                sub_80B39D0(7, 7, 0);
                sub_80B3A70();
                sub_80B32A4();
            }
            else if (gMartInfo.cursor != gMartInfo.itemCount)
            {
                PlaySE(SE_SELECT);
                gMartInfo.cursor = MoveMenuCursor(1);
                sub_80B3A70();
            }
        }
        else if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);

            if (gMartInfo.choicesAbove + gMartInfo.cursor != gMartInfo.itemCount) // did you not hit CANCEL?
            {
                PauseVerticalScrollIndicator(0);
                PauseVerticalScrollIndicator(1);
                sub_80F979C(1, 1);
                sub_80B39D0(gMartInfo.cursor, gMartInfo.cursor, 1);
                HandleDestroyMenuCursors();
                MenuZeroFillWindowRect(0, 0xC, 0xD, 0x13);

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
                        DisplayItemMessageOnField(taskId, gStringVar4, sub_80B3D38, 0xC3E1);
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

void sub_80B4378(u8 taskId)
{
    MenuZeroFillWindowRect(0, 0xE, 0x1D, 0x13);
    MenuZeroFillWindowRect(0, 0xA, 0xD, 0xD);
    sub_80A3FA0(gBGTilemapBuffers[1], 0x1, 0xB, 0xC, 0x2, 0);
    sub_80B3420();
    sub_80B3764(6, 7);
    sub_80B37EC();
    StartVerticalScrollIndicators(0);
    StartVerticalScrollIndicators(1);
    sub_80B32A4();
    gTasks[taskId].func = sub_80B40E8;
}

void sub_80B43F0(u8 taskId)
{
    gFieldCallback = sub_80B3050;
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
        if (gUnknown_02038724[i].itemId == gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor]
         && gUnknown_02038724[i].quantity != 0)
        {
            if (gUnknown_02038724[i].quantity + gTasks[taskId].data[1] > 255)
                gUnknown_02038724[i].quantity = 255;
            else
                gUnknown_02038724[i].quantity += gTasks[taskId].data[1];
            return;
        }
    }

    if (gUnknown_02038730 < 3)
    {
        gUnknown_02038724[gUnknown_02038730].itemId = gMartInfo.itemList[gMartInfo.choicesAbove + gMartInfo.cursor];
        gUnknown_02038724[gUnknown_02038730].quantity = gTasks[taskId].data[1];
        gUnknown_02038730++;
    }
}

void ClearItemPurchases(void)
{
    gUnknown_02038730 = 0;
    ClearItemSlots(gUnknown_02038724, 3);
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
