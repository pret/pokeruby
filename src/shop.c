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

extern void sub_80B39D0(int, int, int);
extern void sub_80B3A70(void);

struct UnknownShopStruct
{
    /* 0x0 */ void (* callback) (void);
    /* 0x4 */ u16 *itemList;
    /* 0x8 */ u8 itemCount;
    /* 0x9 */ u8 cursor;
    /* 0xA */ u8 unkA;
    /* 0xB */ u8 unkB;
    /* 0xC */ bool8 unkC;
    // unknown size
};

extern struct UnknownShopStruct gUnknown_03000708;
extern struct MenuAction gUnknown_083CC6D0[];

extern u8 ewram[];

extern u8 gUnknown_083CC6E8[];
extern u8 gUnknown_083CC6EB[];
extern u8 gBuyMenuFrame_Gfx[];

#define ewram18000 ((u16 *)(ewram + 0x18000))
#define ewram18300 ((u16 *)(ewram + 0x18300))

// shop view window NPC info enum
enum
{
    MAP_OBJ_ID,
    X_COORD,
    Y_COORD,
    ANIM_NUM
};

extern s16 gUnknown_020386A4[][4]; // game freak barely uses 2d arrays wtf?

extern u16 gBuyMenuFrame_Tilemap[];
extern u16 gMenuMoneyPal[16];
extern u16 gUnknown_083CC710[2];

u8 CreateShopMenu(bool8 var)
{
    ScriptContext2_Enable();
    gUnknown_03000708.unkC = var;
    gUnknown_03000708.cursor = 0;

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

    if(gMain.newAndRepeatedKeys & DPAD_UP)
    {
        if(gUnknown_03000708.cursor) // can move cursor up?
        {
            PlaySE(0x5);
            gUnknown_03000708.cursor = MoveMenuCursor(-1);
        }
    }
    else if(gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        if(gUnknown_03000708.cursor != gUnknown_03000708.unkA) // can move cursor down?
        {
            PlaySE(0x5);
            gUnknown_03000708.cursor = MoveMenuCursor(1);
        }
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(0x5);
        if(!gUnknown_03000708.unkC)
        {
            gUnknown_083CC6D0[gUnknown_083CC6E8[gUnknown_03000708.cursor]].func(local);
        }
        else
        {
            gUnknown_083CC6D0[gUnknown_083CC6EB[gUnknown_03000708.cursor]].func(local);
        }
    }
    else if(gMain.newKeys & B_BUTTON)
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
    HandleDestroyMenuCursors();
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
    gUnknown_03000708.cursor = zero;
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

void BuyMenuDrawMapMetatile(int var1, int var2, u16 *var3, s32 var4)
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

    for(i = 0; i < 16; i++) // max objects?
    {
        if(gUnknown_020386A4[i][MAP_OBJ_ID] == 16)
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
    InitMenu(0, 0xE, 0x2, 0x8, gUnknown_03000708.cursor, 0xF);
}

void sub_80B379C(void)
{
    u16 i, j;

    for(i = 0; i < 8; i++)
        for(j = 0; j < 14; j++)
            gBGTilemapBuffers[1][32 * (i + 12) + j] = ewram18300[32 * i + j] + 0xC3E0;
}

void sub_80B37EC(void)
{
    sub_80B3A70();
}

void sub_80B37F8(u8 taskId)
{
    u16 itemListIndex = gUnknown_03000708.unkB + gUnknown_03000708.cursor;
    u16 itemId = *(gUnknown_03000708.itemList + itemListIndex);
    u32 price = (ItemId_GetPrice(itemId) >> GetPriceReduction(1));

    sub_80B7A94(gTasks[taskId].data[1] * price, 6, 6, 11);
    gStringVar1[0] = EXT_CTRL_CODE_BEGIN;
    gStringVar1[1] = 0x14;
    gStringVar1[2] = 0x6;
    ConvertIntToDecimalStringN(&gStringVar1[3], gTasks[taskId].data[1], 1, 2);
    MenuPrint(gOtherText_xString1, 1, 11);
    sub_80A3FA0(gBGTilemapBuffers[1], 1, 11, 12, 2, 0xC3E1);
}
