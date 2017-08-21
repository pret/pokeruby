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
extern u8 gBuyMenuFrame_Gfx[];

extern u16 gBuyMenuFrame_Tilemap[];
extern u16 gMenuMoneyPal[16];
extern u16 gUnknown_083CC710[2];

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

void sub_80B33D0(s16 var1, int var2, u16 *var3)
{
    s16 offset1 = var1 * 2;
    s16 offset2 = (var2 * 0x40) + 0x40;

    BuyMenuDrawMapMetatileLayer(gBGTilemapBuffers[3], offset1, offset2, var3);
    BuyMenuDrawMapMetatileLayer(gBGTilemapBuffers[2], offset1, offset2, var3 + 4);
}

// no. for loop too hard.
__attribute__((naked))
void sub_80B3420() // dont know args
{
	asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r10\n\
	mov r6, r9\n\
	mov r5, r8\n\
	push {r5-r7}\n\
	sub sp, 0x4\n\
	mov r4, sp\n\
	adds r4, 0x2\n\
	mov r0, sp\n\
	adds r1, r4, 0\n\
	bl GetXYCoordsOneStepInFrontOfPlayer\n\
	mov r1, sp\n\
	mov r0, sp\n\
	ldrh r0, [r0]\n\
	subs r0, 0x3\n\
	strh r0, [r1]\n\
	ldrh r0, [r4]\n\
	subs r0, 0x3\n\
	strh r0, [r4]\n\
	movs r1, 0\n\
	ldr r0, _080B34A8 @ =0x000001ff\n\
	mov r10, r0\n\
	ldr r2, _080B34AC @ =gMapHeader\n\
	mov r9, r2\n\
_080B3452:\n\
	movs r4, 0\n\
	lsls r1, 16\n\
	mov r8, r1\n\
	asrs r7, r1, 16\n\
_080B345A:\n\
	mov r0, sp\n\
	movs r3, 0\n\
	ldrsh r0, [r0, r3]\n\
	lsls r4, 16\n\
	asrs r6, r4, 16\n\
	adds r0, r6\n\
	mov r2, sp\n\
	movs r3, 0x2\n\
	ldrsh r1, [r2, r3]\n\
	adds r1, r7\n\
	bl MapGridGetMetatileIdAt\n\
	lsls r0, 16\n\
	lsrs r5, r0, 16\n\
	cmp r7, 0x5\n\
	beq _080B34D0\n\
	cmp r6, 0x6\n\
	beq _080B34D0\n\
	mov r0, sp\n\
	movs r1, 0\n\
	ldrsh r0, [r0, r1]\n\
	adds r0, r6\n\
	mov r2, sp\n\
	movs r3, 0x2\n\
	ldrsh r1, [r2, r3]\n\
	adds r1, r7\n\
	bl MapGridGetMetatileLayerTypeAt\n\
	lsls r0, 24\n\
	lsrs r3, r0, 24\n\
	cmp r5, r10\n\
	bhi _080B34B0\n\
	mov r1, r9\n\
	ldr r0, [r1]\n\
	ldr r0, [r0, 0x10]\n\
	lsls r1, r5, 4\n\
	ldr r2, [r0, 0xC]\n\
	adds r2, r1\n\
	b _080B34C0\n\
	.align 2, 0\n\
_080B34A8: .4byte 0x000001ff\n\
_080B34AC: .4byte gMapHeader\n\
_080B34B0:\n\
	mov r2, r9\n\
	ldr r0, [r2]\n\
	ldr r1, [r0, 0x14]\n\
	ldr r2, _080B34CC @ =0xfffffe00\n\
	adds r0, r5, r2\n\
	lsls r0, 4\n\
	ldr r2, [r1, 0xC]\n\
	adds r2, r0\n\
_080B34C0:\n\
	adds r0, r6, 0\n\
	adds r1, r7, 0\n\
	bl BuyMenuDrawMapMetatile\n\
	b _080B3506\n\
	.align 2, 0\n\
_080B34CC: .4byte 0xfffffe00\n\
_080B34D0:\n\
	cmp r5, r10\n\
	bhi _080B34EC\n\
	asrs r0, r4, 16\n\
	mov r3, r9\n\
	ldr r1, [r3]\n\
	ldr r1, [r1, 0x10]\n\
	lsls r3, r5, 4\n\
	ldr r2, [r1, 0xC]\n\
	adds r2, r3\n\
	mov r3, r8\n\
	asrs r1, r3, 16\n\
	bl sub_80B33D0\n\
	b _080B3506\n\
_080B34EC:\n\
	asrs r0, r4, 16\n\
	mov r2, r9\n\
	ldr r1, [r2]\n\
	ldr r2, [r1, 0x14]\n\
	ldr r3, _080B354C @ =0xfffffe00\n\
	adds r1, r5, r3\n\
	lsls r1, 4\n\
	ldr r2, [r2, 0xC]\n\
	adds r2, r1\n\
	mov r3, r8\n\
	asrs r1, r3, 16\n\
	bl sub_80B33D0\n\
_080B3506:\n\
	cmp r7, 0\n\
	bne _080B3520\n\
	asrs r1, r4, 16\n\
	cmp r1, 0\n\
	beq _080B3520\n\
	cmp r1, 0x6\n\
	beq _080B3520\n\
	lsls r1, 17\n\
	asrs r1, 16\n\
	ldr r0, _080B3550 @ =gBGTilemapBuffers + 0x800\n\
	movs r2, 0x40\n\
	bl sub_80B32EC\n\
_080B3520:\n\
	movs r1, 0x80\n\
	lsls r1, 9\n\
	adds r0, r4, r1\n\
	lsrs r4, r0, 16\n\
	asrs r0, 16\n\
	cmp r0, 0x6\n\
	ble _080B345A\n\
	adds r0, r1, 0\n\
	add r0, r8\n\
	lsrs r1, r0, 16\n\
	asrs r0, 16\n\
	cmp r0, 0x5\n\
	ble _080B3452\n\
	add sp, 0x4\n\
	pop {r3-r5}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	mov r10, r5\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080B354C: .4byte 0xfffffe00\n\
_080B3550: .4byte gBGTilemapBuffers + 0x800\n\
	.syntax divided");
}

void BuyMenuDrawMapGraphics(void)
{
    sub_80F9020();
    sub_80B356C();
    sub_80B368C();
    sub_80B3420();
}

// yet another difficult multi for-loop. No.
__attribute__((naked))
void sub_80B356C(void) // PopulateShopViewWindowObjectInfo ?
{
	asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r10\n\
	mov r6, r9\n\
	mov r5, r8\n\
	push {r5-r7}\n\
	sub sp, 0x8\n\
	movs r0, 0\n\
	mov r8, r0\n\
	mov r4, sp\n\
	adds r4, 0x2\n\
	mov r0, sp\n\
	adds r1, r4, 0\n\
	bl GetXYCoordsOneStepInFrontOfPlayer\n\
	bl PlayerGetZCoord\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	str r0, [sp, 0x4]\n\
	movs r5, 0\n\
	ldr r2, _080B3674 @ =gUnknown_020386A4\n\
	movs r1, 0x10\n\
_080B3598:\n\
	lsls r0, r5, 3\n\
	adds r0, r2\n\
	strh r1, [r0]\n\
	adds r0, r5, 0x1\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	cmp r5, 0xF\n\
	bls _080B3598\n\
	movs r5, 0\n\
	ldr r7, _080B3678 @ =gUnknown_020386AA\n\
	subs r1, r7, 0x6\n\
	mov r9, r1\n\
_080B35B0:\n\
	movs r4, 0\n\
	adds r2, r5, 0x1\n\
	mov r10, r2\n\
_080B35B6:\n\
	mov r1, sp\n\
	ldr r3, _080B367C @ =0x0000fffd\n\
	adds r0, r3, 0\n\
	ldrh r1, [r1]\n\
	adds r0, r1\n\
	adds r0, r4\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	ldr r2, _080B3680 @ =0x0000fffe\n\
	adds r1, r2, 0\n\
	mov r3, sp\n\
	ldrh r3, [r3, 0x2]\n\
	adds r1, r3\n\
	adds r1, r5\n\
	lsls r1, 16\n\
	lsrs r1, 16\n\
	ldr r2, [sp, 0x4]\n\
	bl GetFieldObjectIdByXYZ\n\
	lsls r0, 24\n\
	lsrs r2, r0, 24\n\
	cmp r2, 0x10\n\
	beq _080B3650\n\
	mov r0, r8\n\
	lsls r3, r0, 3\n\
	mov r1, r9\n\
	adds r0, r3, r1\n\
	movs r6, 0\n\
	strh r2, [r0]\n\
	mov r0, r9\n\
	adds r0, 0x2\n\
	adds r0, r3, r0\n\
	strh r4, [r0]\n\
	ldr r1, _080B3684 @ =gUnknown_020386A8\n\
	adds r0, r3, r1\n\
	strh r5, [r0]\n\
	ldr r1, _080B3688 @ =gMapObjects\n\
	lsls r0, r2, 3\n\
	adds r0, r2\n\
	lsls r0, 2\n\
	adds r2, r0, r1\n\
	ldrb r0, [r2, 0x18]\n\
	lsls r0, 28\n\
	lsrs r0, 28\n\
	cmp r0, 0x1\n\
	bne _080B3616\n\
	adds r0, r3, r7\n\
	strh r6, [r0]\n\
_080B3616:\n\
	ldrb r0, [r2, 0x18]\n\
	lsls r0, 28\n\
	lsrs r0, 28\n\
	cmp r0, 0x2\n\
	bne _080B3626\n\
	adds r1, r3, r7\n\
	movs r0, 0x1\n\
	strh r0, [r1]\n\
_080B3626:\n\
	ldrb r0, [r2, 0x18]\n\
	lsls r0, 28\n\
	lsrs r0, 28\n\
	cmp r0, 0x3\n\
	bne _080B3636\n\
	adds r1, r3, r7\n\
	movs r0, 0x2\n\
	strh r0, [r1]\n\
_080B3636:\n\
	ldrb r0, [r2, 0x18]\n\
	lsls r0, 28\n\
	lsrs r0, 28\n\
	cmp r0, 0x4\n\
	bne _080B3646\n\
	adds r1, r3, r7\n\
	movs r0, 0x3\n\
	strh r0, [r1]\n\
_080B3646:\n\
	mov r0, r8\n\
	adds r0, 0x1\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	mov r8, r0\n\
_080B3650:\n\
	adds r0, r4, 0x1\n\
	lsls r0, 24\n\
	lsrs r4, r0, 24\n\
	cmp r4, 0x6\n\
	bls _080B35B6\n\
	mov r2, r10\n\
	lsls r0, r2, 24\n\
	lsrs r5, r0, 24\n\
	cmp r5, 0x4\n\
	bls _080B35B0\n\
	add sp, 0x8\n\
	pop {r3-r5}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	mov r10, r5\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080B3674: .4byte gUnknown_020386A4\n\
_080B3678: .4byte gUnknown_020386AA\n\
_080B367C: .4byte 0x0000fffd\n\
_080B3680: .4byte 0x0000fffe\n\
_080B3684: .4byte gUnknown_020386A8\n\
_080B3688: .4byte gMapObjects\n\
	.syntax divided");
}
/*
struct UnkStruct_20386A4
{
	s16 mapObjId;
	u16 unk2;
	u16 unk4;
	u8 unk6[2];
};
*/

//extern s16 gUnknown_020386A4[][];
//extern struct UnkStruct_20386A4 gUnknown_020386A4[];

// all 3 of these are incredibly hard, please help
/*void sub_80B368C(void)
{
	// r0 = spriteId
	// r1 = gUnknown_020386A4 + 6
	// r2 = gSprites[spriteId]
	// r3 = gUnknown_020386A4[i].unk4 + 32
	// r4 = i * 8
	// r5 = 0 (i)
	// r6 = gUnknown_020386A4
	// r7 = gMapObjects
	// r8 = gUnknown_020386A4 + 6
	// r9 = 
	// r10 = 
	// r11 = 
	// r12 = 

	u8 i = 0;
	u8 *unkArray = (u8 *)&gUnknown_020386A4[6];

	for(; i < 16; i++) // max objects?
	{
		s16 mapObjId = unkStruct[i].mapObjId;
		if(mapObjId != 16)
		{
			u8 spriteId = AddPseudoFieldObject(
			gMapObjects[mapObjId].graphicsId,
			SpriteCallbackDummy,
			unkStruct[i].unk2 * 16 + 8,
			unkStruct[i].unk4 + 12,
			2);
			StartSpriteAnim(&gSprites[spriteId], unkArray[i]);
		}
	}
}*/
