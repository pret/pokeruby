	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start CreateShopMenu
CreateShopMenu: @ 80B2D54
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl ScriptContext2_Enable
	ldr r1, _080B2D90 @ =gUnknown_03000708
	movs r0, 0
	strb r4, [r1, 0xC]
	strb r0, [r1, 0x9]
	cmp r4, 0
	bne _080B2D9C
	movs r0, 0x2
	strb r0, [r1, 0xA]
	movs r0, 0
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x7
	bl MenuDrawTextWindow
	ldr r3, _080B2D94 @ =gUnknown_083CC6D0
	ldr r0, _080B2D98 @ =gUnknown_083CC6E8
	str r0, [sp]
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x3
	bl PrintMenuItemsReordered
	b _080B2DBC
	.align 2, 0
_080B2D90: .4byte gUnknown_03000708
_080B2D94: .4byte gUnknown_083CC6D0
_080B2D98: .4byte gUnknown_083CC6E8
_080B2D9C:
	movs r0, 0x1
	strb r0, [r1, 0xA]
	movs r0, 0
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x5
	bl MenuDrawTextWindow
	ldr r3, _080B2DEC @ =gUnknown_083CC6D0
	ldr r0, _080B2DF0 @ =gUnknown_083CC6EB
	str r0, [sp]
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x2
	bl PrintMenuItemsReordered
_080B2DBC:
	ldr r0, _080B2DF4 @ =gUnknown_03000708
	ldrb r3, [r0, 0xA]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0
	str r0, [sp]
	movs r0, 0x9
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	bl InitMenu
	ldr r0, _080B2DF8 @ =sub_80B2E38
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B2DEC: .4byte gUnknown_083CC6D0
_080B2DF0: .4byte gUnknown_083CC6EB
_080B2DF4: .4byte gUnknown_03000708
_080B2DF8: .4byte sub_80B2E38
	thumb_func_end CreateShopMenu

	thumb_func_start SetShopMenuCallback
SetShopMenuCallback: @ 80B2DFC
	ldr r1, _080B2E04 @ =gUnknown_03000708
	str r0, [r1]
	bx lr
	.align 2, 0
_080B2E04: .4byte gUnknown_03000708
	thumb_func_end SetShopMenuCallback

	thumb_func_start SetShopItemsForSale
SetShopItemsForSale: @ 80B2E08
	push {lr}
	adds r1, r0, 0
	movs r2, 0
	ldr r3, _080B2E34 @ =gUnknown_03000708
	str r1, [r3, 0x4]
	strb r2, [r3, 0x8]
	ldrh r0, [r1]
	cmp r0, 0
	beq _080B2E30
_080B2E1A:
	ldrb r0, [r3, 0x8]
	adds r0, 0x1
	strb r0, [r3, 0x8]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r0, r2, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0
	bne _080B2E1A
_080B2E30:
	pop {r0}
	bx r0
	.align 2, 0
_080B2E34: .4byte gUnknown_03000708
	thumb_func_end SetShopItemsForSale

	thumb_func_start sub_80B2E38
sub_80B2E38: @ 80B2E38
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _080B2E60 @ =gMain
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080B2E68
	ldr r4, _080B2E64 @ =gUnknown_03000708
	ldrb r0, [r4, 0x9]
	cmp r0, 0
	beq _080B2EF4
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _080B2E82
	.align 2, 0
_080B2E60: .4byte gMain
_080B2E64: .4byte gUnknown_03000708
_080B2E68:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080B2E90
	ldr r4, _080B2E8C @ =gUnknown_03000708
	ldrb r0, [r4, 0x9]
	ldrb r1, [r4, 0xA]
	cmp r0, r1
	beq _080B2EF4
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_080B2E82:
	bl MoveMenuCursor
	strb r0, [r4, 0x9]
	b _080B2EF4
	.align 2, 0
_080B2E8C: .4byte gUnknown_03000708
_080B2E90:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080B2EE0
	movs r0, 0x5
	bl PlaySE
	ldr r3, _080B2EB0 @ =gUnknown_03000708
	ldrb r0, [r3, 0xC]
	cmp r0, 0
	bne _080B2EBC
	ldr r1, _080B2EB4 @ =gUnknown_083CC6D0
	ldr r2, _080B2EB8 @ =gUnknown_083CC6E8
	b _080B2EC0
	.align 2, 0
_080B2EB0: .4byte gUnknown_03000708
_080B2EB4: .4byte gUnknown_083CC6D0
_080B2EB8: .4byte gUnknown_083CC6E8
_080B2EBC:
	ldr r1, _080B2ED8 @ =gUnknown_083CC6D0
	ldr r2, _080B2EDC @ =gUnknown_083CC6EB
_080B2EC0:
	ldrb r0, [r3, 0x9]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	b _080B2EF4
	.align 2, 0
_080B2ED8: .4byte gUnknown_083CC6D0
_080B2EDC: .4byte gUnknown_083CC6EB
_080B2EE0:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080B2EF4
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl HandleShopMenuQuit
_080B2EF4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B2E38

	thumb_func_start sub_80B2EFC
sub_80B2EFC: @ 80B2EFC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B2F24 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080B2F28 @ =BuyMenuDrawGraphics
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	ldr r0, _080B2F2C @ =sub_80B2FA0
	str r0, [r1]
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	pop {r0}
	bx r0
	.align 2, 0
_080B2F24: .4byte gTasks
_080B2F28: .4byte BuyMenuDrawGraphics
_080B2F2C: .4byte sub_80B2FA0
	thumb_func_end sub_80B2EFC

	thumb_func_start sub_80B2F30
sub_80B2F30: @ 80B2F30
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B2F58 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080B2F5C @ =sub_80A6300
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	ldr r0, _080B2F60 @ =sub_80B2FA0
	str r0, [r1]
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	pop {r0}
	bx r0
	.align 2, 0
_080B2F58: .4byte gTasks
_080B2F5C: .4byte sub_80A6300
_080B2F60: .4byte sub_80B2FA0
	thumb_func_end sub_80B2F30

	thumb_func_start HandleShopMenuQuit
HandleShopMenuQuit: @ 80B2F64
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0xB
	movs r3, 0x8
	bl MenuZeroFillWindowRect
	bl sub_80BE3BC
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
	ldr r0, _080B2F9C @ =gUnknown_03000708
	ldr r0, [r0]
	cmp r0, 0
	beq _080B2F96
	bl _call_via_r0
_080B2F96:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B2F9C: .4byte gUnknown_03000708
	thumb_func_end HandleShopMenuQuit

	thumb_func_start sub_80B2FA0
sub_80B2FA0: @ 80B2FA0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080B2FD4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080B2FCE
	ldr r0, _080B2FD8 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	lsls r0, 16
	ldrh r1, [r1, 0x1A]
	orrs r0, r1
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_080B2FCE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B2FD4: .4byte gPaletteFade
_080B2FD8: .4byte gTasks
	thumb_func_end sub_80B2FA0

	thumb_func_start ReturnToShopMenuAfterExitingSellMenu
ReturnToShopMenuAfterExitingSellMenu: @ 80B2FDC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080B2FF8 @ =gUnknown_03000708
	ldrb r0, [r0, 0xC]
	bl CreateShopMenu
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B2FF8: .4byte gUnknown_03000708
	thumb_func_end ReturnToShopMenuAfterExitingSellMenu

	thumb_func_start Task_ExitSellMenu
Task_ExitSellMenu: @ 80B2FFC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B3040
	ldr r0, _080B3028 @ =gUnknown_03000708
	ldrb r0, [r0, 0xC]
	cmp r0, 0x2
	bne _080B3034
	ldr r1, _080B302C @ =gOtherText_CanIHelpYou
	ldr r2, _080B3030 @ =ReturnToShopMenuAfterExitingSellMenu
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	b _080B3040
	.align 2, 0
_080B3028: .4byte gUnknown_03000708
_080B302C: .4byte gOtherText_CanIHelpYou
_080B3030: .4byte ReturnToShopMenuAfterExitingSellMenu
_080B3034:
	ldr r1, _080B3048 @ =gOtherText_AnythingElse
	ldr r2, _080B304C @ =ReturnToShopMenuAfterExitingSellMenu
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_080B3040:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B3048: .4byte gOtherText_AnythingElse
_080B304C: .4byte ReturnToShopMenuAfterExitingSellMenu
	thumb_func_end Task_ExitSellMenu

	thumb_func_start sub_80B3050
sub_80B3050: @ 80B3050
	push {lr}
	bl pal_fill_black
	ldr r0, _080B3064 @ =Task_ExitSellMenu
	movs r1, 0x8
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080B3064: .4byte Task_ExitSellMenu
	thumb_func_end sub_80B3050

	thumb_func_start sub_80B3068
sub_80B3068: @ 80B3068
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl Task_ExitSellMenu
	pop {r0}
	bx r0
	thumb_func_end sub_80B3068

	thumb_func_start unref_sub_80B3078
unref_sub_80B3078: @ 80B3078
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B308C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080B3090 @ =Task_ExitSellMenu
	str r0, [r1]
	bx lr
	.align 2, 0
_080B308C: .4byte gTasks
_080B3090: .4byte Task_ExitSellMenu
	thumb_func_end unref_sub_80B3078

	thumb_func_start sub_80B3094
sub_80B3094: @ 80B3094
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTasks
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_80B3094

	thumb_func_start sub_80B30AC
sub_80B30AC: @ 80B30AC
	push {r4,lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	ldr r3, _080B30F0 @ =gBG1TilemapBuffer
	ldr r1, _080B30F4 @ =0x0600e800
	ldr r0, _080B30F8 @ =0x040000d4
	str r3, [r0]
	str r1, [r0, 0x4]
	ldr r4, _080B30FC @ =0x80000400
	str r4, [r0, 0x8]
	ldr r1, [r0, 0x8]
	movs r2, 0x80
	lsls r2, 4
	adds r1, r3, r2
	ldr r2, _080B3100 @ =0x0600e000
	str r1, [r0]
	str r2, [r0, 0x4]
	str r4, [r0, 0x8]
	ldr r1, [r0, 0x8]
	movs r1, 0x80
	lsls r1, 5
	adds r3, r1
	ldr r1, _080B3104 @ =0x0600f000
	str r3, [r0]
	str r1, [r0, 0x4]
	str r4, [r0, 0x8]
	ldr r0, [r0, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B30F0: .4byte gBG1TilemapBuffer
_080B30F4: .4byte 0x0600e800
_080B30F8: .4byte 0x040000d4
_080B30FC: .4byte 0x80000400
_080B3100: .4byte 0x0600e000
_080B3104: .4byte 0x0600f000
	thumb_func_end sub_80B30AC

	thumb_func_start BuyMenuDrawGraphics
BuyMenuDrawGraphics: @ 80B3108
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	bl sub_80F9438
	bl remove_some_task
	ldr r0, _080B3204 @ =REG_BG1HOFS
	movs r5, 0
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	ldr r0, _080B3208 @ =gPaletteFade
	mov r8, r0
	ldrb r0, [r0, 0x8]
	movs r1, 0x80
	orrs r0, r1
	mov r1, r8
	strb r0, [r1, 0x8]
	movs r1, 0xE0
	lsls r1, 19
	movs r6, 0
	str r6, [sp, 0x4]
	ldr r0, _080B320C @ =0x040000d4
	add r2, sp, 0x4
	str r2, [r0]
	str r1, [r0, 0x4]
	ldr r1, _080B3210 @ =0x85000100
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _080B3214 @ =gBuyMenuFrame_Gfx
	ldr r1, _080B3218 @ =0x06007c00
	bl LZDecompressVram
	ldr r0, _080B321C @ =gBuyMenuFrame_Tilemap
	ldr r1, _080B3220 @ =0x02018000
	bl sub_800D238
	ldr r0, _080B3224 @ =gMenuMoneyPal
	movs r1, 0xC0
	movs r2, 0x20
	bl LoadCompressedPalette
	bl FreeAllSpritePalettes
	bl ResetPaletteFade
	bl ResetSpriteData
	bl ResetTasks
	ldr r4, _080B3228 @ =gWindowConfig_81E6DFC
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	bl BuyMenuDrawMapGraphics
	ldr r0, _080B322C @ =gUnknown_03000708
	strb r6, [r0, 0x9]
	strb r5, [r0, 0xB]
	movs r0, 0
	movs r1, 0
	movs r2, 0x20
	movs r3, 0x20
	bl MenuZeroFillWindowRect
	ldr r0, _080B3230 @ =gSaveBlock1
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0
	bl sub_80B7C14
	movs r0, 0
	movs r1, 0x7
	bl sub_80B3764
	bl sub_80B37EC
	bl sub_80B3270
	ldr r0, _080B3234 @ =sub_80B40E8
	movs r1, 0x8
	bl CreateTask
	bl sub_80B3240
	movs r0, 0x1
	negs r0, r0
	str r6, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	mov r2, r8
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _080B3238 @ =sub_80B30AC
	bl SetVBlankCallback
	ldr r0, _080B323C @ =sub_80B3094
	bl SetMainCallback2
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B3204: .4byte REG_BG1HOFS
_080B3208: .4byte gPaletteFade
_080B320C: .4byte 0x040000d4
_080B3210: .4byte 0x85000100
_080B3214: .4byte gBuyMenuFrame_Gfx
_080B3218: .4byte 0x06007c00
_080B321C: .4byte gBuyMenuFrame_Tilemap
_080B3220: .4byte 0x02018000
_080B3224: .4byte gMenuMoneyPal
_080B3228: .4byte gWindowConfig_81E6DFC
_080B322C: .4byte gUnknown_03000708
_080B3230: .4byte gSaveBlock1
_080B3234: .4byte sub_80B40E8
_080B3238: .4byte sub_80B30AC
_080B323C: .4byte sub_80B3094
	thumb_func_end BuyMenuDrawGraphics

	thumb_func_start sub_80B3240
sub_80B3240: @ 80B3240
	push {lr}
	sub sp, 0x4
	ldr r1, _080B326C @ =gUnknown_083CC710
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	mov r0, sp
	adds r0, 0x2
	movs r1, 0xD1
	movs r2, 0x2
	bl LoadPalette
	mov r0, sp
	movs r1, 0xD8
	movs r2, 0x2
	bl LoadPalette
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080B326C: .4byte gUnknown_083CC710
	thumb_func_end sub_80B3240

	thumb_func_start sub_80B3270
sub_80B3270: @ 80B3270
	push {lr}
	bl sub_80F944C
	ldr r0, _080B32A0 @ =gUnknown_03000708
	ldrb r0, [r0, 0x8]
	cmp r0, 0x7
	bls _080B329A
	movs r0, 0
	movs r1, 0xAC
	movs r2, 0xC
	bl CreateVerticalScrollIndicators
	movs r0, 0x1
	movs r1, 0xAC
	movs r2, 0x94
	bl CreateVerticalScrollIndicators
	movs r0, 0
	movs r1, 0x1
	bl sub_80F979C
_080B329A:
	pop {r0}
	bx r0
	.align 2, 0
_080B32A0: .4byte gUnknown_03000708
	thumb_func_end sub_80B3270

	thumb_func_start sub_80B32A4
sub_80B32A4: @ 80B32A4
	push {lr}
	ldr r0, _080B32B8 @ =gUnknown_03000708
	ldrb r0, [r0, 0xB]
	cmp r0, 0
	bne _080B32BC
	movs r0, 0
	movs r1, 0x1
	bl sub_80F979C
	b _080B32C4
	.align 2, 0
_080B32B8: .4byte gUnknown_03000708
_080B32BC:
	movs r0, 0
	movs r1, 0
	bl sub_80F979C
_080B32C4:
	ldr r1, _080B32DC @ =gUnknown_03000708
	ldrb r0, [r1, 0xB]
	adds r0, 0x7
	ldrb r1, [r1, 0x8]
	cmp r0, r1
	blt _080B32E0
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80F979C
	b _080B32E8
	.align 2, 0
_080B32DC: .4byte gUnknown_03000708
_080B32E0:
	movs r0, 0x1
	movs r1, 0
	bl sub_80F979C
_080B32E8:
	pop {r0}
	bx r0
	thumb_func_end sub_80B32A4

	thumb_func_start sub_80B32EC
sub_80B32EC: @ 80B32EC
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	adds r1, r2
	lsls r1, 1
	adds r1, r0
	ldr r2, _080B3304 @ =0x0000c3e1
	adds r0, r2, 0
	strh r0, [r1]
	strh r0, [r1, 0x2]
	bx lr
	.align 2, 0
_080B3304: .4byte 0x0000c3e1
	thumb_func_end sub_80B32EC

	thumb_func_start BuyMenuDrawMapMetatileLayer
BuyMenuDrawMapMetatileLayer: @ 80B3308
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	adds r1, r2
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r3]
	strh r0, [r1]
	ldrh r0, [r3, 0x2]
	strh r0, [r1, 0x2]
	adds r2, r1, 0
	adds r2, 0x40
	ldrh r0, [r3, 0x4]
	strh r0, [r2]
	adds r1, 0x42
	ldrh r0, [r3, 0x6]
	strh r0, [r1]
	bx lr
	thumb_func_end BuyMenuDrawMapMetatileLayer

	thumb_func_start BuyMenuDrawMapMetatile
BuyMenuDrawMapMetatile: @ 80B3330
	push {r4-r7,lr}
	adds r7, r2, 0
	lsls r3, 24
	lsrs r3, 24
	adds r2, r3, 0
	lsls r0, 17
	lsrs r0, 16
	lsls r1, 22
	movs r4, 0x80
	lsls r4, 15
	adds r1, r4
	lsrs r1, 16
	cmp r3, 0x1
	beq _080B3364
	cmp r3, 0x1
	bgt _080B3356
	cmp r3, 0
	beq _080B335C
	b _080B33C0
_080B3356:
	cmp r2, 0x2
	beq _080B3398
	b _080B33C0
_080B335C:
	ldr r5, _080B3360 @ =gBG2TilemapBuffer
	b _080B3366
	.align 2, 0
_080B3360: .4byte gBG2TilemapBuffer
_080B3364:
	ldr r5, _080B3390 @ =gBG3TilemapBuffer
_080B3366:
	lsls r6, r0, 16
	asrs r6, 16
	lsls r4, r1, 16
	asrs r4, 16
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	adds r3, r7, 0
	bl BuyMenuDrawMapMetatileLayer
	ldr r0, _080B3394 @ =0xfffff800
	adds r5, r0
	adds r3, r7, 0
	adds r3, 0x8
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl BuyMenuDrawMapMetatileLayer
	b _080B33C0
	.align 2, 0
_080B3390: .4byte gBG3TilemapBuffer
_080B3394: .4byte 0xfffff800
_080B3398:
	ldr r5, _080B33C8 @ =gBG3TilemapBuffer
	lsls r6, r0, 16
	asrs r6, 16
	lsls r4, r1, 16
	asrs r4, 16
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	adds r3, r7, 0
	bl BuyMenuDrawMapMetatileLayer
	ldr r0, _080B33CC @ =0xfffff000
	adds r5, r0
	adds r3, r7, 0
	adds r3, 0x8
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl BuyMenuDrawMapMetatileLayer
_080B33C0:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B33C8: .4byte gBG3TilemapBuffer
_080B33CC: .4byte 0xfffff000
	thumb_func_end BuyMenuDrawMapMetatile

	thumb_func_start sub_80B33D0
sub_80B33D0: @ 80B33D0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r6, r0, 0
	adds r4, r1, 0
	mov r8, r2
	lsls r4, 22
	ldr r5, _080B3418 @ =gBG3TilemapBuffer
	lsls r6, 17
	asrs r6, 16
	movs r0, 0x80
	lsls r0, 15
	adds r4, r0
	asrs r4, 16
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	mov r3, r8
	bl BuyMenuDrawMapMetatileLayer
	ldr r0, _080B341C @ =0xfffff800
	adds r5, r0
	movs r0, 0x8
	add r8, r0
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	mov r3, r8
	bl BuyMenuDrawMapMetatileLayer
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B3418: .4byte gBG3TilemapBuffer
_080B341C: .4byte 0xfffff800
	thumb_func_end sub_80B33D0

	thumb_func_start sub_80B3420
sub_80B3420: @ 80B3420
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r1, sp
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x3
	strh r0, [r1]
	ldrh r0, [r4]
	subs r0, 0x3
	strh r0, [r4]
	movs r1, 0
	ldr r0, _080B34A8 @ =0x000001ff
	mov r10, r0
	ldr r2, _080B34AC @ =gMapHeader
	mov r9, r2
_080B3452:
	movs r4, 0
	lsls r1, 16
	mov r8, r1
	asrs r7, r1, 16
_080B345A:
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	lsls r4, 16
	asrs r6, r4, 16
	adds r0, r6
	mov r2, sp
	movs r3, 0x2
	ldrsh r1, [r2, r3]
	adds r1, r7
	bl MapGridGetMetatileIdAt
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r7, 0x5
	beq _080B34D0
	cmp r6, 0x6
	beq _080B34D0
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r0, r6
	mov r2, sp
	movs r3, 0x2
	ldrsh r1, [r2, r3]
	adds r1, r7
	bl MapGridGetMetatileLayerTypeAt
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r5, r10
	bhi _080B34B0
	mov r1, r9
	ldr r0, [r1]
	ldr r0, [r0, 0x10]
	lsls r1, r5, 4
	ldr r2, [r0, 0xC]
	adds r2, r1
	b _080B34C0
	.align 2, 0
_080B34A8: .4byte 0x000001ff
_080B34AC: .4byte gMapHeader
_080B34B0:
	mov r2, r9
	ldr r0, [r2]
	ldr r1, [r0, 0x14]
	ldr r2, _080B34CC @ =0xfffffe00
	adds r0, r5, r2
	lsls r0, 4
	ldr r2, [r1, 0xC]
	adds r2, r0
_080B34C0:
	adds r0, r6, 0
	adds r1, r7, 0
	bl BuyMenuDrawMapMetatile
	b _080B3506
	.align 2, 0
_080B34CC: .4byte 0xfffffe00
_080B34D0:
	cmp r5, r10
	bhi _080B34EC
	asrs r0, r4, 16
	mov r3, r9
	ldr r1, [r3]
	ldr r1, [r1, 0x10]
	lsls r3, r5, 4
	ldr r2, [r1, 0xC]
	adds r2, r3
	mov r3, r8
	asrs r1, r3, 16
	bl sub_80B33D0
	b _080B3506
_080B34EC:
	asrs r0, r4, 16
	mov r2, r9
	ldr r1, [r2]
	ldr r2, [r1, 0x14]
	ldr r3, _080B354C @ =0xfffffe00
	adds r1, r5, r3
	lsls r1, 4
	ldr r2, [r2, 0xC]
	adds r2, r1
	mov r3, r8
	asrs r1, r3, 16
	bl sub_80B33D0
_080B3506:
	cmp r7, 0
	bne _080B3520
	asrs r1, r4, 16
	cmp r1, 0
	beq _080B3520
	cmp r1, 0x6
	beq _080B3520
	lsls r1, 17
	asrs r1, 16
	ldr r0, _080B3550 @ =gBG1TilemapBuffer
	movs r2, 0x40
	bl sub_80B32EC
_080B3520:
	movs r1, 0x80
	lsls r1, 9
	adds r0, r4, r1
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x6
	ble _080B345A
	adds r0, r1, 0
	add r0, r8
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080B3452
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B354C: .4byte 0xfffffe00
_080B3550: .4byte gBG1TilemapBuffer
	thumb_func_end sub_80B3420

	thumb_func_start BuyMenuDrawMapGraphics
BuyMenuDrawMapGraphics: @ 80B3554
	push {lr}
	bl sub_80F9020
	bl sub_80B356C
	bl sub_80B368C
	bl sub_80B3420
	pop {r0}
	bx r0
	thumb_func_end BuyMenuDrawMapGraphics

	thumb_func_start sub_80B356C
sub_80B356C: @ 80B356C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r0, 0
	mov r8, r0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	bl PlayerGetZCoord
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r5, 0
	ldr r2, _080B3674 @ =gUnknown_020386A4
	movs r1, 0x10
_080B3598:
	lsls r0, r5, 3
	adds r0, r2
	strh r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xF
	bls _080B3598
	movs r5, 0
	ldr r7, _080B3678 @ =gUnknown_020386AA
	subs r1, r7, 0x6
	mov r9, r1
_080B35B0:
	movs r4, 0
	adds r2, r5, 0x1
	mov r10, r2
_080B35B6:
	mov r1, sp
	ldr r3, _080B367C @ =0x0000fffd
	adds r0, r3, 0
	ldrh r1, [r1]
	adds r0, r1
	adds r0, r4
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _080B3680 @ =0x0000fffe
	adds r1, r2, 0
	mov r3, sp
	ldrh r3, [r3, 0x2]
	adds r1, r3
	adds r1, r5
	lsls r1, 16
	lsrs r1, 16
	ldr r2, [sp, 0x4]
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x10
	beq _080B3650
	mov r0, r8
	lsls r3, r0, 3
	mov r1, r9
	adds r0, r3, r1
	movs r6, 0
	strh r2, [r0]
	mov r0, r9
	adds r0, 0x2
	adds r0, r3, r0
	strh r4, [r0]
	ldr r1, _080B3684 @ =gUnknown_020386A8
	adds r0, r3, r1
	strh r5, [r0]
	ldr r1, _080B3688 @ =gMapObjects
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r2, r0, r1
	ldrb r0, [r2, 0x18]
	lsls r0, 28
	lsrs r0, 28
	cmp r0, 0x1
	bne _080B3616
	adds r0, r3, r7
	strh r6, [r0]
_080B3616:
	ldrb r0, [r2, 0x18]
	lsls r0, 28
	lsrs r0, 28
	cmp r0, 0x2
	bne _080B3626
	adds r1, r3, r7
	movs r0, 0x1
	strh r0, [r1]
_080B3626:
	ldrb r0, [r2, 0x18]
	lsls r0, 28
	lsrs r0, 28
	cmp r0, 0x3
	bne _080B3636
	adds r1, r3, r7
	movs r0, 0x2
	strh r0, [r1]
_080B3636:
	ldrb r0, [r2, 0x18]
	lsls r0, 28
	lsrs r0, 28
	cmp r0, 0x4
	bne _080B3646
	adds r1, r3, r7
	movs r0, 0x3
	strh r0, [r1]
_080B3646:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
_080B3650:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	bls _080B35B6
	mov r2, r10
	lsls r0, r2, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bls _080B35B0
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3674: .4byte gUnknown_020386A4
_080B3678: .4byte gUnknown_020386AA
_080B367C: .4byte 0x0000fffd
_080B3680: .4byte 0x0000fffe
_080B3684: .4byte gUnknown_020386A8
_080B3688: .4byte gMapObjects
	thumb_func_end sub_80B356C

	thumb_func_start sub_80B368C
sub_80B368C: @ 80B368C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r5, 0
	ldr r6, _080B3710 @ =gUnknown_020386A4
	adds r0, r6, 0x6
	mov r8, r0
	ldr r7, _080B3714 @ =gMapObjects
_080B369E:
	lsls r4, r5, 3
	adds r1, r4, r6
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0x10
	beq _080B36F8
	adds r1, r0, 0
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldrb r0, [r0, 0x5]
	adds r1, r6, 0x2
	adds r1, r4, r1
	ldrh r2, [r1]
	lsls r2, 4
	adds r2, 0x8
	lsls r2, 16
	asrs r2, 16
	adds r1, r6, 0x4
	adds r1, r4, r1
	ldrh r3, [r1]
	lsls r3, 20
	movs r1, 0x80
	lsls r1, 14
	adds r3, r1
	asrs r3, 16
	movs r1, 0x2
	str r1, [sp]
	ldr r1, _080B3718 @ =SpriteCallbackDummy
	bl AddPseudoFieldObject
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _080B371C @ =gSprites
	adds r2, r0
	mov r1, r8
	adds r0, r4, r1
	ldrb r1, [r0]
	adds r0, r2, 0
	bl StartSpriteAnim
_080B36F8:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xF
	bls _080B369E
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3710: .4byte gUnknown_020386A4
_080B3714: .4byte gMapObjects
_080B3718: .4byte SpriteCallbackDummy
_080B371C: .4byte gSprites
	thumb_func_end sub_80B368C

	thumb_func_start sub_80B3720
sub_80B3720: @ 80B3720
	push {r4-r6,lr}
	movs r1, 0
	ldr r6, _080B3754 @ =gBG1TilemapBuffer
	ldr r5, _080B3758 @ =0x000003ff
	ldr r4, _080B375C @ =0x02018000
	ldr r0, _080B3760 @ =0x0000c3e0
	adds r3, r0, 0
_080B372E:
	lsls r0, r1, 16
	asrs r2, r0, 16
	lsls r1, r2, 1
	adds r0, r1, r4
	ldrh r0, [r0]
	cmp r0, 0
	beq _080B3742
	adds r1, r6
	adds r0, r3
	strh r0, [r1]
_080B3742:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, r5
	ble _080B372E
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B3754: .4byte gBG1TilemapBuffer
_080B3758: .4byte 0x000003ff
_080B375C: .4byte 0x02018000
_080B3760: .4byte 0x0000c3e0
	thumb_func_end sub_80B3720

	thumb_func_start sub_80B3764
sub_80B3764: @ 80B3764
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_80B3720
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	bl sub_80B39D0
	ldr r0, _080B3798 @ =gUnknown_03000708
	ldrb r0, [r0, 0x9]
	str r0, [sp]
	movs r0, 0xF
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x2
	movs r3, 0x8
	bl InitMenu
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B3798: .4byte gUnknown_03000708
	thumb_func_end sub_80B3764

	thumb_func_start sub_80B379C
sub_80B379C: @ 80B379C
	push {r4-r7,lr}
	movs r1, 0
	ldr r0, _080B37E0 @ =gBG1TilemapBuffer
	mov r12, r0
	ldr r7, _080B37E4 @ =0x02018300
	ldr r0, _080B37E8 @ =0x0000c3e0
	adds r6, r0, 0
_080B37AA:
	movs r2, 0
	adds r0, r1, 0
	adds r0, 0xC
	adds r5, r1, 0x1
	lsls r4, r0, 5
	lsls r3, r1, 5
_080B37B6:
	adds r1, r4, r2
	lsls r1, 1
	add r1, r12
	adds r0, r3, r2
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	adds r0, r6, r0
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0xD
	bls _080B37B6
	lsls r0, r5, 16
	lsrs r1, r0, 16
	cmp r1, 0x7
	bls _080B37AA
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B37E0: .4byte gBG1TilemapBuffer
_080B37E4: .4byte 0x02018300
_080B37E8: .4byte 0x0000c3e0
	thumb_func_end sub_80B379C

	thumb_func_start sub_80B37EC
sub_80B37EC: @ 80B37EC
	push {lr}
	bl sub_80B3A70
	pop {r0}
	bx r0
	thumb_func_end sub_80B37EC

	thumb_func_start sub_80B37F8
sub_80B37F8: @ 80B37F8
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldr r1, _080B3884 @ =gUnknown_03000708
	ldrb r0, [r1, 0xB]
	ldrb r2, [r1, 0x9]
	adds r0, r2
	ldr r1, [r1, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	bl ItemId_GetPrice
	adds r4, r0, 0
	movs r0, 0x1
	bl GetPriceReduction
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 24
	lsrs r0, 24
	asrs r4, r0
	ldr r0, _080B3888 @ =gTasks
	lsls r5, r6, 2
	adds r5, r6
	lsls r5, 3
	adds r5, r0
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	muls r0, r4
	movs r1, 0x6
	movs r2, 0x6
	movs r3, 0xB
	bl sub_80B7A94
	ldr r0, _080B388C @ =gStringVar1
	movs r1, 0xFC
	strb r1, [r0]
	movs r1, 0x14
	strb r1, [r0, 0x1]
	movs r1, 0x6
	strb r1, [r0, 0x2]
	adds r0, 0x3
	movs r2, 0xA
	ldrsh r1, [r5, r2]
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _080B3890 @ =gOtherText_xString1
	movs r1, 0x1
	movs r2, 0xB
	bl MenuPrint
	ldr r0, _080B3894 @ =gBG1TilemapBuffer
	movs r1, 0x2
	str r1, [sp]
	ldr r1, _080B3898 @ =0x0000c3e1
	str r1, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0xB
	movs r3, 0xC
	bl sub_80A3FA0
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B3884: .4byte gUnknown_03000708
_080B3888: .4byte gTasks
_080B388C: .4byte gStringVar1
_080B3890: .4byte gOtherText_xString1
_080B3894: .4byte gBG1TilemapBuffer
_080B3898: .4byte 0x0000c3e1
	thumb_func_end sub_80B37F8

	thumb_func_start sub_80B389C
sub_80B389C: @ 80B389C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	mov r8, r2
	lsls r0, 16
	lsrs r2, r0, 16
	mov r9, r2
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r5, _080B392C @ =gStringVar1
	mov r0, r8
	cmp r0, 0
	beq _080B38C8
	movs r0, 0xFC
	strb r0, [r5]
	movs r0, 0x1
	strb r0, [r5, 0x1]
	movs r0, 0x2
	strb r0, [r5, 0x2]
	adds r5, 0x3
_080B38C8:
	adds r0, r2, 0
	adds r1, r5, 0
	bl CopyItemName
	ldr r6, _080B392C @ =gStringVar1
	lsls r7, r4, 3
	movs r0, 0x1
	str r0, [sp]
	adds r0, r6, 0
	movs r1, 0x70
	adds r2, r7, 0
	movs r3, 0x58
	bl sub_8072A18
	adds r5, r6, 0
	mov r0, r8
	cmp r0, 0
	beq _080B38EE
	adds r5, r6, 0x3
_080B38EE:
	mov r0, r9
	bl ItemId_GetPrice
	adds r4, r0, 0
	movs r0, 0x1
	bl GetPriceReduction
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 24
	lsrs r0, 24
	asrs r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x4
	bl sub_80B79F8
	adds r0, r6, 0
	movs r1, 0xCA
	adds r2, r7, 0
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B392C: .4byte gStringVar1
	thumb_func_end sub_80B389C

	thumb_func_start sub_80B3930
sub_80B3930: @ 80B3930
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r4, r2, 0
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	ldr r2, _080B39A0 @ =gStringVar1
	cmp r4, 0
	beq _080B395A
	movs r0, 0xFC
	strb r0, [r2]
	movs r0, 0x1
	strb r0, [r2, 0x1]
	movs r0, 0x2
	strb r0, [r2, 0x2]
	adds r2, 0x3
_080B395A:
	lsls r6, r3, 5
	ldr r0, _080B39A4 @ =gDecorations + 0x1
	mov r8, r0
	adds r1, r6, r0
	adds r0, r2, 0
	bl StringCopy
	ldr r5, _080B39A0 @ =gStringVar1
	mov r0, r9
	lsls r7, r0, 3
	movs r0, 0x1
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0x70
	adds r2, r7, 0
	movs r3, 0x58
	bl sub_8072A18
	adds r2, r5, 0
	cmp r4, 0
	beq _080B3986
	adds r2, r5, 0x3
_080B3986:
	mov r0, r8
	subs r0, 0x1
	adds r3, r6, r0
	ldrh r1, [r3, 0x14]
	ldr r0, _080B39A8 @ =0x00002710
	cmp r1, r0
	bne _080B39AC
	movs r0, 0x19
	mov r1, r9
	adds r2, r4, 0
	bl sub_80B7B34
	b _080B39C2
	.align 2, 0
_080B39A0: .4byte gStringVar1
_080B39A4: .4byte gDecorations + 0x1
_080B39A8: .4byte 0x00002710
_080B39AC:
	ldrh r1, [r3, 0x14]
	adds r0, r2, 0
	movs r2, 0x4
	bl sub_80B79F8
	adds r0, r5, 0
	movs r1, 0xCA
	adds r2, r7, 0
	movs r3, 0x1
	bl MenuPrint_PixelCoords
_080B39C2:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B3930

	thumb_func_start sub_80B39D0
sub_80B39D0: @ 80B39D0
	push {r4-r6,lr}
	adds r6, r1, 0
	adds r5, r2, 0
	b _080B3A1A
_080B39D8:
	ldrb r0, [r1, 0xC]
	cmp r0, 0
	bne _080B39FC
	ldrb r0, [r1, 0xB]
	adds r0, r4
	ldr r1, [r1, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r1, r4, 25
	movs r2, 0x80
	lsls r2, 18
	adds r1, r2
	lsrs r1, 24
	adds r2, r5, 0
	bl sub_80B389C
	b _080B3A18
_080B39FC:
	ldrb r0, [r1, 0xB]
	adds r0, r4
	ldr r1, [r1, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r1, r4, 25
	movs r2, 0x80
	lsls r2, 18
	adds r1, r2
	lsrs r1, 24
	adds r2, r5, 0
	bl sub_80B3930
_080B3A18:
	adds r0, r4, 0x1
_080B3A1A:
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bgt _080B3A2E
	ldr r1, _080B3A68 @ =gUnknown_03000708
	ldrb r0, [r1, 0xB]
	adds r0, r4
	ldrb r2, [r1, 0x8]
	cmp r0, r2
	blt _080B39D8
_080B3A2E:
	cmp r4, 0x8
	beq _080B3A60
	ldr r1, _080B3A68 @ =gUnknown_03000708
	ldrb r0, [r1, 0xB]
	adds r0, r4
	ldrb r1, [r1, 0x8]
	cmp r0, r1
	bne _080B3A60
	lsls r3, r4, 1
	adds r4, r3, 0x2
	lsls r4, 24
	lsrs r4, 24
	adds r3, 0x3
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0xE
	adds r1, r4, 0
	movs r2, 0x1C
	bl MenuFillWindowRectWithBlankTile
	ldr r0, _080B3A6C @ =gOtherText_CancelNoTerminator
	movs r1, 0xE
	adds r2, r4, 0
	bl MenuPrint
_080B3A60:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B3A68: .4byte gUnknown_03000708
_080B3A6C: .4byte gOtherText_CancelNoTerminator
	thumb_func_end sub_80B39D0

	thumb_func_start sub_80B3A70
sub_80B3A70: @ 80B3A70
	push {r4,lr}
	sub sp, 0x8
	ldr r2, _080B3A9C @ =gUnknown_03000708
	ldrb r1, [r2, 0xB]
	ldrb r0, [r2, 0x9]
	adds r0, r1, r0
	ldrb r1, [r2, 0x8]
	cmp r0, r1
	beq _080B3ACC
	ldrb r4, [r2, 0xC]
	cmp r4, 0
	bne _080B3AA0
	ldr r1, [r2, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	bl ItemId_GetDescription
	movs r1, 0x30
	str r1, [sp]
	str r4, [sp, 0x4]
	b _080B3ABA
	.align 2, 0
_080B3A9C: .4byte gUnknown_03000708
_080B3AA0:
	ldr r1, _080B3AC8 @ =gDecorations
	ldr r2, [r2, 0x4]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	lsls r0, 5
	adds r1, 0x18
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x30
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
_080B3ABA:
	movs r1, 0x4
	movs r2, 0x68
	movs r3, 0x68
	bl sub_8072AB0
	b _080B3AE0
	.align 2, 0
_080B3AC8: .4byte gDecorations
_080B3ACC:
	ldr r0, _080B3AE8 @ =gOtherText_QuitShopping
	movs r1, 0x30
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	movs r1, 0x4
	movs r2, 0x68
	movs r3, 0x68
	bl sub_8072AB0
_080B3AE0:
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3AE8: .4byte gOtherText_QuitShopping
	thumb_func_end sub_80B3A70

	thumb_func_start sub_80B3AEC
sub_80B3AEC: @ 80B3AEC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080B3B5C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080B3B06
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080B3B7A
_080B3B06:
	ldr r4, _080B3B60 @ =gUnknown_03000708
	ldrb r1, [r4, 0x9]
	adds r0, r1, 0
	movs r2, 0
	bl sub_80B39D0
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4, 0xB]
	ldrb r1, [r4, 0x9]
	adds r0, r1
	ldr r1, [r4, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0x4
	bne _080B3B74
	ldr r0, _080B3B64 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0x9
	ble _080B3B74
	movs r0, 0xC
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B3B74
	ldr r1, _080B3B68 @ =gOtherText_FreePremierBall
	ldr r2, _080B3B6C @ =sub_80B4378
	ldr r3, _080B3B70 @ =0x0000c3e1
	adds r0, r5, 0
	bl DisplayItemMessageOnField
	b _080B3B7A
	.align 2, 0
_080B3B5C: .4byte gMain
_080B3B60: .4byte gUnknown_03000708
_080B3B64: .4byte gTasks
_080B3B68: .4byte gOtherText_FreePremierBall
_080B3B6C: .4byte sub_80B4378
_080B3B70: .4byte 0x0000c3e1
_080B3B74:
	adds r0, r5, 0
	bl sub_80B4378
_080B3B7A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80B3AEC

	thumb_func_start sub_80B3B80
sub_80B3B80: @ 80B3B80
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x26
	bl sav12_xor_increment
	ldr r5, _080B3BC0 @ =gSaveBlock1 + 0x490
	ldr r0, _080B3BC4 @ =gUnknown_020386A0
	ldr r1, [r0]
	adds r0, r5, 0
	bl sub_80B79E0
	movs r0, 0x5F
	bl PlaySE
	ldr r0, [r5]
	movs r1, 0
	movs r2, 0
	bl sub_80B7BEC
	ldr r1, _080B3BC8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080B3BCC @ =sub_80B3AEC
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B3BC0: .4byte gSaveBlock1 + 0x490
_080B3BC4: .4byte gUnknown_020386A0
_080B3BC8: .4byte gTasks
_080B3BCC: .4byte sub_80B3AEC
	thumb_func_end sub_80B3B80

	thumb_func_start sub_80B3BD0
sub_80B3BD0: @ 80B3BD0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080B3BF0 @ =gUnknown_03000708
	ldrb r1, [r0, 0x9]
	adds r0, r1, 0
	movs r2, 0
	bl sub_80B39D0
	adds r0, r4, 0
	bl sub_80B4378
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3BF0: .4byte gUnknown_03000708
	thumb_func_end sub_80B3BD0

	thumb_func_start sub_80B3BF4
sub_80B3BF4: @ 80B3BF4
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0x7
	movs r1, 0x8
	movs r2, 0xD
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _080B3C7C @ =gBG1TilemapBuffer
	movs r1, 0x4
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	movs r1, 0x8
	movs r2, 0x9
	movs r3, 0x4
	bl sub_80A3FA0
	bl sub_80B379C
	bl sub_80B3420
	ldr r0, _080B3C80 @ =gSaveBlock1
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080B3C84 @ =gUnknown_020386A0
	ldr r1, [r1]
	bl IsEnoughMoney
	lsls r0, 24
	cmp r0, 0
	beq _080B3D18
	ldr r4, _080B3C88 @ =gUnknown_03000708
	ldrb r0, [r4, 0xC]
	cmp r0, 0
	bne _080B3CAC
	ldrb r0, [r4, 0xB]
	ldrb r1, [r4, 0x9]
	adds r0, r1
	ldr r1, [r4, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	ldr r2, _080B3C8C @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r2
	ldrh r1, [r1, 0xA]
	bl AddBagItem
	lsls r0, 24
	cmp r0, 0
	beq _080B3C9C
	ldr r1, _080B3C90 @ =gOtherText_HereYouGo
	ldr r2, _080B3C94 @ =sub_80B3B80
	ldr r3, _080B3C98 @ =0x0000c3e1
	adds r0, r5, 0
	bl DisplayItemMessageOnField
	adds r0, r5, 0
	bl sub_80B4470
	b _080B3D24
	.align 2, 0
_080B3C7C: .4byte gBG1TilemapBuffer
_080B3C80: .4byte gSaveBlock1
_080B3C84: .4byte gUnknown_020386A0
_080B3C88: .4byte gUnknown_03000708
_080B3C8C: .4byte gTasks
_080B3C90: .4byte gOtherText_HereYouGo
_080B3C94: .4byte sub_80B3B80
_080B3C98: .4byte 0x0000c3e1
_080B3C9C:
	ldr r1, _080B3CA4 @ =gOtherText_NoRoomFor
	ldr r2, _080B3CA8 @ =sub_80B3BD0
	b _080B3CD8
	.align 2, 0
_080B3CA4: .4byte gOtherText_NoRoomFor
_080B3CA8: .4byte sub_80B3BD0
_080B3CAC:
	ldrb r0, [r4, 0xB]
	ldrb r1, [r4, 0x9]
	adds r0, r1
	ldr r1, [r4, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrb r0, [r0]
	bl IsThereStorageSpaceForDecoration
	lsls r0, 24
	cmp r0, 0
	beq _080B3CF0
	ldrb r0, [r4, 0xC]
	cmp r0, 0x1
	bne _080B3CD4
	ldr r1, _080B3CD0 @ =gOtherText_HereYouGo2
	b _080B3CD6
	.align 2, 0
_080B3CD0: .4byte gOtherText_HereYouGo2
_080B3CD4:
	ldr r1, _080B3CE4 @ =gOtherText_HereYouGo3
_080B3CD6:
	ldr r2, _080B3CE8 @ =sub_80B3B80
_080B3CD8:
	ldr r3, _080B3CEC @ =0x0000c3e1
	adds r0, r5, 0
	bl DisplayItemMessageOnField
	b _080B3D24
	.align 2, 0
_080B3CE4: .4byte gOtherText_HereYouGo3
_080B3CE8: .4byte sub_80B3B80
_080B3CEC: .4byte 0x0000c3e1
_080B3CF0:
	ldr r4, _080B3D08 @ =gStringVar4
	ldr r1, _080B3D0C @ =gOtherText_SpaceForIsFull
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _080B3D10 @ =sub_80B3BD0
	ldr r3, _080B3D14 @ =0x0000c3e1
	adds r0, r5, 0
	adds r1, r4, 0
	bl DisplayItemMessageOnField
	b _080B3D24
	.align 2, 0
_080B3D08: .4byte gStringVar4
_080B3D0C: .4byte gOtherText_SpaceForIsFull
_080B3D10: .4byte sub_80B3BD0
_080B3D14: .4byte 0x0000c3e1
_080B3D18:
	ldr r1, _080B3D2C @ =gOtherText_NotEnoughMoney
	ldr r2, _080B3D30 @ =sub_80B3BD0
	ldr r3, _080B3D34 @ =0x0000c3e1
	adds r0, r5, 0
	bl DisplayItemMessageOnField
_080B3D24:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B3D2C: .4byte gOtherText_NotEnoughMoney
_080B3D30: .4byte sub_80B3BD0
_080B3D34: .4byte 0x0000c3e1
	thumb_func_end sub_80B3BF4

	thumb_func_start sub_80B3D38
sub_80B3D38: @ 80B3D38
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x7
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _080B3D70 @ =gBG1TilemapBuffer
	movs r1, 0x4
	str r1, [sp]
	ldr r1, _080B3D74 @ =0x0000c3e1
	str r1, [sp, 0x4]
	movs r1, 0x8
	movs r2, 0x9
	movs r3, 0x4
	bl sub_80A3FA0
	ldr r1, _080B3D78 @ =gUnknown_083CC708
	adds r0, r4, 0
	bl sub_80F914C
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3D70: .4byte gBG1TilemapBuffer
_080B3D74: .4byte 0x0000c3e1
_080B3D78: .4byte gUnknown_083CC708
	thumb_func_end sub_80B3D38

	thumb_func_start sub_80B3D7C
sub_80B3D7C: @ 80B3D7C
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080B3DC0 @ =gUnknown_03000708
	ldrb r1, [r0, 0x9]
	adds r0, r1, 0
	movs r2, 0
	bl sub_80B39D0
	movs r0, 0x7
	movs r1, 0x8
	movs r2, 0xD
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _080B3DC4 @ =gBG1TilemapBuffer
	movs r1, 0x4
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	movs r1, 0x8
	movs r2, 0x9
	movs r3, 0x4
	bl sub_80A3FA0
	adds r0, r4, 0
	bl sub_80B4378
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3DC0: .4byte gUnknown_03000708
_080B3DC4: .4byte gBG1TilemapBuffer
	thumb_func_end sub_80B3D7C

	thumb_func_start sub_80B3DC8
sub_80B3DC8: @ 80B3DC8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	adds r4, r6, 0
	ldr r7, _080B3EA8 @ =gUnknown_03000708
	ldrb r1, [r7, 0xD]
	adds r0, r6, 0
	bl sub_80A52C4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B3DEE
	adds r0, r6, 0
	bl sub_80B37F8
_080B3DEE:
	ldr r0, _080B3EAC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080B3ED8
	ldr r0, _080B3EB0 @ =gUnknown_020386A0
	mov r8, r0
	ldrb r0, [r7, 0xB]
	ldrb r1, [r7, 0x9]
	adds r0, r1
	ldr r1, [r7, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	bl ItemId_GetPrice
	adds r4, r0, 0
	movs r0, 0x1
	bl GetPriceReduction
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 24
	lsrs r0, 24
	asrs r4, r0
	ldr r0, _080B3EB4 @ =gTasks
	lsls r5, r6, 2
	adds r5, r6
	lsls r5, 3
	adds r5, r0
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	muls r0, r4
	mov r2, r8
	str r0, [r2]
	movs r0, 0
	movs r1, 0xA
	movs r2, 0xD
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _080B3EB8 @ =gBG1TilemapBuffer
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0xB
	movs r3, 0xC
	bl sub_80A3FA0
	bl sub_80B379C
	bl sub_80B3420
	ldrb r0, [r7, 0xB]
	ldrb r1, [r7, 0x9]
	adds r0, r1
	ldr r1, [r7, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	ldr r1, _080B3EBC @ =gStringVar1
	bl CopyItemName
	ldr r0, _080B3EC0 @ =gStringVar2
	movs r2, 0xA
	ldrsh r1, [r5, r2]
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _080B3EC4 @ =gStringVar3
	mov r2, r8
	ldr r1, [r2]
	movs r2, 0
	movs r3, 0x8
	bl ConvertIntToDecimalStringN
	ldr r4, _080B3EC8 @ =gStringVar4
	ldr r1, _080B3ECC @ =gOtherText_ThatWillBe
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _080B3ED0 @ =sub_80B3D38
	ldr r3, _080B3ED4 @ =0x0000c3e1
	adds r0, r6, 0
	adds r1, r4, 0
	bl DisplayItemMessageOnField
	b _080B3EF0
	.align 2, 0
_080B3EA8: .4byte gUnknown_03000708
_080B3EAC: .4byte gMain
_080B3EB0: .4byte gUnknown_020386A0
_080B3EB4: .4byte gTasks
_080B3EB8: .4byte gBG1TilemapBuffer
_080B3EBC: .4byte gStringVar1
_080B3EC0: .4byte gStringVar2
_080B3EC4: .4byte gStringVar3
_080B3EC8: .4byte gStringVar4
_080B3ECC: .4byte gOtherText_ThatWillBe
_080B3ED0: .4byte sub_80B3D38
_080B3ED4: .4byte 0x0000c3e1
_080B3ED8:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080B3EF0
	ldrb r1, [r7, 0x9]
	adds r0, r1, 0
	movs r2, 0
	bl sub_80B39D0
	adds r0, r4, 0
	bl sub_80B4378
_080B3EF0:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B3DC8

	thumb_func_start sub_80B3EFC
sub_80B3EFC: @ 80B3EFC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080B3F78 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0, 0xA]
	movs r0, 0
	movs r1, 0xA
	movs r2, 0xD
	movs r3, 0xD
	bl MenuDrawTextWindow
	adds r0, r5, 0
	bl sub_80B37F8
	ldr r6, _080B3F7C @ =gUnknown_03000708
	ldrb r0, [r6, 0xB]
	ldrb r1, [r6, 0x9]
	adds r0, r1
	ldr r1, [r6, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	bl ItemId_GetPrice
	adds r4, r0, 0
	movs r0, 0x1
	bl GetPriceReduction
	ldr r1, _080B3F80 @ =gSaveBlock1
	movs r2, 0x92
	lsls r2, 3
	adds r1, r2
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 24
	lsrs r0, 24
	asrs r4, r0
	ldr r0, [r1]
	adds r1, r4, 0
	bl __udivsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x63
	bls _080B3F62
	movs r0, 0x63
_080B3F62:
	strb r0, [r6, 0xD]
	ldr r0, _080B3F78 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080B3F84 @ =sub_80B3DC8
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B3F78: .4byte gTasks
_080B3F7C: .4byte gUnknown_03000708
_080B3F80: .4byte gSaveBlock1
_080B3F84: .4byte sub_80B3DC8
	thumb_func_end sub_80B3EFC

	thumb_func_start sub_80B3F88
sub_80B3F88: @ 80B3F88
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r0, _080B4020 @ =gMenuWindow
	mov r8, r0
	ldr r1, [r0, 0x28]
	ldr r3, _080B4024 @ =0x000003de
	adds r1, r3
	adds r2, r1, 0
	adds r2, 0x80
	ldr r7, [r0, 0x24]
	mov r10, r7
	ldr r0, _080B4028 @ =0x000003ff
	mov r9, r0
	movs r6, 0xD
_080B3FAC:
	adds r3, r2, 0
	subs r3, 0x40
	str r3, [sp]
	movs r7, 0x40
	negs r7, r7
	adds r7, r1
	mov r12, r7
	adds r3, r2, 0
	adds r4, r1, 0
	movs r5, 0xE
_080B3FC0:
	ldrh r2, [r4]
	mov r1, r9
	ands r1, r2
	mov r7, r8
	ldrh r0, [r7, 0x1A]
	adds r0, 0x1
	cmp r1, r0
	ble _080B3FD4
	adds r0, r2, 0
	adds r0, 0x3C
_080B3FD4:
	strh r0, [r3]
	adds r3, 0x2
	adds r4, 0x2
	subs r5, 0x1
	cmp r5, 0
	bge _080B3FC0
	ldr r2, [sp]
	mov r1, r12
	subs r6, 0x1
	cmp r6, 0
	bge _080B3FAC
	ldr r1, _080B402C @ =0x00003a20
	add r1, r10
	movs r0, 0xF0
	lsls r0, 3
	adds r2, r1, r0
	ldr r3, _080B4030 @ =0x040000d4
	ldr r5, _080B4034 @ =0x800000f0
	ldr r4, _080B4038 @ =0xfffffc40
	movs r6, 0xD
_080B3FFC:
	str r1, [r3]
	str r2, [r3, 0x4]
	str r5, [r3, 0x8]
	ldr r0, [r3, 0x8]
	adds r2, r4
	adds r1, r4
	subs r6, 0x1
	cmp r6, 0
	bge _080B3FFC
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4020: .4byte gMenuWindow
_080B4024: .4byte 0x000003de
_080B4028: .4byte 0x000003ff
_080B402C: .4byte 0x00003a20
_080B4030: .4byte 0x040000d4
_080B4034: .4byte 0x800000f0
_080B4038: .4byte 0xfffffc40
	thumb_func_end sub_80B3F88

	thumb_func_start sub_80B403C
sub_80B403C: @ 80B403C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r0, _080B40D8 @ =gMenuWindow
	mov r8, r0
	ldr r2, [r0, 0x28]
	adds r1, r2, 0
	adds r1, 0x9E
	adds r2, r1, 0
	adds r1, 0x80
	ldr r3, [r0, 0x24]
	mov r10, r3
	ldr r7, _080B40DC @ =0x000003ff
	mov r9, r7
	movs r6, 0xD
_080B4060:
	adds r0, r2, 0
	adds r0, 0x40
	str r0, [sp]
	movs r3, 0x40
	adds r3, r1
	mov r12, r3
	adds r3, r2, 0
	adds r4, r1, 0
	movs r5, 0xE
_080B4072:
	ldrh r2, [r4]
	mov r1, r9
	ands r1, r2
	mov r7, r8
	ldrh r0, [r7, 0x1A]
	adds r0, 0x1
	cmp r1, r0
	ble _080B4086
	adds r0, r2, 0
	subs r0, 0x3C
_080B4086:
	strh r0, [r3]
	adds r3, 0x2
	adds r4, 0x2
	subs r5, 0x1
	cmp r5, 0
	bge _080B4072
	ldr r2, [sp]
	mov r1, r12
	subs r6, 0x1
	cmp r6, 0
	bge _080B4060
	movs r1, 0x96
	lsls r1, 4
	add r1, r10
	adds r2, r1, 0
	movs r0, 0xF0
	lsls r0, 3
	adds r1, r0
	ldr r3, _080B40E0 @ =0x040000d4
	ldr r5, _080B40E4 @ =0x800000f0
	movs r4, 0xF0
	lsls r4, 2
	movs r6, 0xD
_080B40B4:
	str r1, [r3]
	str r2, [r3, 0x4]
	str r5, [r3, 0x8]
	ldr r0, [r3, 0x8]
	adds r2, r4
	adds r1, r4
	subs r6, 0x1
	cmp r6, 0
	bge _080B40B4
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B40D8: .4byte gMenuWindow
_080B40DC: .4byte 0x000003ff
_080B40E0: .4byte 0x040000d4
_080B40E4: .4byte 0x800000f0
	thumb_func_end sub_80B403C

	thumb_func_start sub_80B40E8
sub_80B40E8: @ 80B40E8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	mov r8, r7
	ldr r0, _080B4134 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080B4102
	b _080B436C
_080B4102:
	ldr r2, _080B4138 @ =gMain
	ldrh r0, [r2, 0x30]
	movs r1, 0xF0
	ands r1, r0
	cmp r1, 0x40
	bne _080B414C
	ldr r4, _080B413C @ =gUnknown_03000708
	ldrb r0, [r4, 0x9]
	cmp r0, 0
	bne _080B4140
	ldrb r0, [r4, 0xB]
	cmp r0, 0
	bne _080B411E
	b _080B436C
_080B411E:
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4, 0xB]
	subs r0, 0x1
	strb r0, [r4, 0xB]
	bl sub_80B3F88
	movs r0, 0
	movs r1, 0
	b _080B417A
	.align 2, 0
_080B4134: .4byte gPaletteFade
_080B4138: .4byte gMain
_080B413C: .4byte gUnknown_03000708
_080B4140:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _080B41A0
_080B414C:
	cmp r1, 0x80
	bne _080B41AC
	ldr r4, _080B418C @ =gUnknown_03000708
	ldrb r0, [r4, 0x9]
	cmp r0, 0x7
	bne _080B4190
	ldrb r0, [r4, 0xB]
	ldrb r1, [r4, 0x9]
	adds r0, r1
	ldrb r1, [r4, 0x8]
	cmp r0, r1
	bne _080B4166
	b _080B436C
_080B4166:
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4, 0xB]
	adds r0, 0x1
	strb r0, [r4, 0xB]
	bl sub_80B403C
	movs r0, 0x7
	movs r1, 0x7
_080B417A:
	movs r2, 0
	bl sub_80B39D0
	bl sub_80B3A70
	bl sub_80B32A4
	b _080B436C
	.align 2, 0
_080B418C: .4byte gUnknown_03000708
_080B4190:
	ldrb r2, [r4, 0x8]
	cmp r0, r2
	bne _080B4198
	b _080B436C
_080B4198:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_080B41A0:
	bl MoveMenuCursor
	strb r0, [r4, 0x9]
	bl sub_80B3A70
	b _080B436C
_080B41AC:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080B41B8
	b _080B4358
_080B41B8:
	movs r0, 0x5
	bl PlaySE
	ldr r6, _080B426C @ =gUnknown_03000708
	ldrb r0, [r6, 0xB]
	ldrb r1, [r6, 0x9]
	adds r0, r1
	ldrb r1, [r6, 0x8]
	cmp r0, r1
	bne _080B41CE
	b _080B4350
_080B41CE:
	movs r0, 0
	bl sub_80F996C
	movs r0, 0x1
	bl sub_80F996C
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80F979C
	ldrb r1, [r6, 0x9]
	adds r0, r1, 0
	movs r2, 0x1
	bl sub_80B39D0
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0xC
	movs r2, 0xD
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldrb r0, [r6, 0xC]
	cmp r0, 0
	bne _080B428C
	ldr r5, _080B4270 @ =gUnknown_020386A0
	ldrb r0, [r6, 0xB]
	ldrb r1, [r6, 0x9]
	adds r0, r1
	ldr r1, [r6, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	bl ItemId_GetPrice
	adds r4, r0, 0
	movs r0, 0x1
	bl GetPriceReduction
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 24
	lsrs r0, 24
	asrs r4, r0
	str r4, [r5]
	ldr r0, _080B4274 @ =gSaveBlock1
	movs r2, 0x92
	lsls r2, 3
	adds r0, r2
	ldr r0, [r0]
	adds r1, r4, 0
	bl IsEnoughMoney
	lsls r0, 24
	cmp r0, 0
	beq _080B42BA
	ldrb r0, [r6, 0xB]
	ldrb r1, [r6, 0x9]
	adds r0, r1
	ldr r1, [r6, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	ldr r1, _080B4278 @ =gStringVar1
	bl CopyItemName
	ldr r4, _080B427C @ =gStringVar4
	ldr r1, _080B4280 @ =gOtherText_HowManyYouWant
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _080B4284 @ =sub_80B3EFC
	ldr r3, _080B4288 @ =0x0000c3e1
	adds r0, r7, 0
	adds r1, r4, 0
	bl DisplayItemMessageOnField
	b _080B436C
	.align 2, 0
_080B426C: .4byte gUnknown_03000708
_080B4270: .4byte gUnknown_020386A0
_080B4274: .4byte gSaveBlock1
_080B4278: .4byte gStringVar1
_080B427C: .4byte gStringVar4
_080B4280: .4byte gOtherText_HowManyYouWant
_080B4284: .4byte sub_80B3EFC
_080B4288: .4byte 0x0000c3e1
_080B428C:
	ldr r5, _080B42C8 @ =gUnknown_020386A0
	ldr r4, _080B42CC @ =gDecorations
	ldrb r0, [r6, 0xB]
	ldrb r1, [r6, 0x9]
	adds r0, r1
	ldr r1, [r6, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 5
	adds r0, r4
	ldrh r1, [r0, 0x14]
	str r1, [r5]
	ldr r0, _080B42D0 @ =gSaveBlock1
	movs r2, 0x92
	lsls r2, 3
	adds r0, r2
	ldr r0, [r0]
	bl IsEnoughMoney
	lsls r0, 24
	cmp r0, 0
	bne _080B42E0
_080B42BA:
	ldr r1, _080B42D4 @ =gOtherText_NotEnoughMoney
	ldr r2, _080B42D8 @ =sub_80B3BD0
	ldr r3, _080B42DC @ =0x0000c3e1
	adds r0, r7, 0
	bl DisplayItemMessageOnField
	b _080B436C
	.align 2, 0
_080B42C8: .4byte gUnknown_020386A0
_080B42CC: .4byte gDecorations
_080B42D0: .4byte gSaveBlock1
_080B42D4: .4byte gOtherText_NotEnoughMoney
_080B42D8: .4byte sub_80B3BD0
_080B42DC: .4byte 0x0000c3e1
_080B42E0:
	ldr r0, _080B4318 @ =gStringVar1
	ldrb r1, [r6, 0xB]
	ldrb r2, [r6, 0x9]
	adds r1, r2
	ldr r2, [r6, 0x4]
	lsls r1, 1
	adds r1, r2
	ldrh r1, [r1]
	lsls r1, 5
	adds r2, r4, 0x1
	adds r1, r2
	bl StringCopy
	ldr r0, _080B431C @ =gStringVar2
	ldr r1, [r5]
	movs r2, 0
	movs r3, 0x8
	bl ConvertIntToDecimalStringN
	ldrb r0, [r6, 0xC]
	cmp r0, 0x1
	bne _080B4328
	ldr r0, _080B4320 @ =gStringVar4
	ldr r1, _080B4324 @ =gOtherText_ThatWillBe2
	bl StringExpandPlaceholders
	b _080B4330
	.align 2, 0
_080B4318: .4byte gStringVar1
_080B431C: .4byte gStringVar2
_080B4320: .4byte gStringVar4
_080B4324: .4byte gOtherText_ThatWillBe2
_080B4328:
	ldr r0, _080B4340 @ =gStringVar4
	ldr r1, _080B4344 @ =gOtherText_ThatWillBe3
	bl StringExpandPlaceholders
_080B4330:
	ldr r1, _080B4340 @ =gStringVar4
	ldr r2, _080B4348 @ =sub_80B3D38
	ldr r3, _080B434C @ =0x0000c3e1
	mov r0, r8
	bl DisplayItemMessageOnField
	b _080B436C
	.align 2, 0
_080B4340: .4byte gStringVar4
_080B4344: .4byte gOtherText_ThatWillBe3
_080B4348: .4byte sub_80B3D38
_080B434C: .4byte 0x0000c3e1
_080B4350:
	adds r0, r7, 0
	bl sub_80B43F0
	b _080B436C
_080B4358:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080B436C
	movs r0, 0x5
	bl PlaySE
	mov r0, r8
	bl sub_80B43F0
_080B436C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B40E8

	thumb_func_start sub_80B4378
sub_80B4378: @ 80B4378
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0xA
	movs r2, 0xD
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _080B43E4 @ =gBG1TilemapBuffer
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0xB
	movs r3, 0xC
	bl sub_80A3FA0
	bl sub_80B3420
	movs r0, 0x6
	movs r1, 0x7
	bl sub_80B3764
	bl sub_80B37EC
	movs r0, 0
	bl sub_80F98DC
	movs r0, 0x1
	bl sub_80F98DC
	bl sub_80B32A4
	ldr r1, _080B43E8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080B43EC @ =sub_80B40E8
	str r1, [r0]
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B43E4: .4byte gBG1TilemapBuffer
_080B43E8: .4byte gTasks
_080B43EC: .4byte sub_80B40E8
	thumb_func_end sub_80B4378

	thumb_func_start sub_80B43F0
sub_80B43F0: @ 80B43F0
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080B4428 @ =gUnknown_0300485C
	ldr r0, _080B442C @ =sub_80B3050
	str r0, [r1]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _080B4430 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080B4434 @ =Task_ExitBuyMenu
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B4428: .4byte gUnknown_0300485C
_080B442C: .4byte sub_80B3050
_080B4430: .4byte gTasks
_080B4434: .4byte Task_ExitBuyMenu
	thumb_func_end sub_80B43F0

	thumb_func_start Task_ExitBuyMenu
Task_ExitBuyMenu: @ 80B4438
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080B4468 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080B4462
	movs r0, 0
	movs r1, 0
	bl RemoveMoneyLabelObject
	bl BuyMenuFreeMemory
	ldr r0, _080B446C @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_080B4462:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B4468: .4byte gPaletteFade
_080B446C: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end Task_ExitBuyMenu

	thumb_func_start sub_80B4470
sub_80B4470: @ 80B4470
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r2, 0
	ldr r0, _080B44C8 @ =gUnknown_02038724
	mov r12, r0
	ldr r6, _080B44CC @ =gUnknown_03000708
	mov r8, r12
	adds r4, r6, 0
	ldr r1, _080B44D0 @ =gTasks
	mov r9, r1
	lsls r0, r5, 2
	adds r0, r5
	lsls r7, r0, 3
_080B4492:
	lsls r0, r2, 2
	mov r1, r8
	adds r3, r0, r1
	ldrb r0, [r4, 0xB]
	ldrb r1, [r4, 0x9]
	adds r0, r1
	ldr r1, [r4, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r3]
	ldrh r0, [r0]
	cmp r1, r0
	bne _080B44DC
	ldrh r0, [r3, 0x2]
	cmp r0, 0
	beq _080B44DC
	adds r2, r0, 0
	mov r4, r9
	adds r1, r7, r4
	movs r4, 0xA
	ldrsh r0, [r1, r4]
	adds r0, r2, r0
	cmp r0, 0xFF
	ble _080B44D4
	movs r0, 0xFF
	strh r0, [r3, 0x2]
	b _080B451E
	.align 2, 0
_080B44C8: .4byte gUnknown_02038724
_080B44CC: .4byte gUnknown_03000708
_080B44D0: .4byte gTasks
_080B44D4:
	ldrh r0, [r1, 0xA]
	adds r0, r2, r0
	strh r0, [r3, 0x2]
	b _080B451E
_080B44DC:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x2
	bls _080B4492
	ldr r3, _080B452C @ =gUnknown_02038730
	ldrb r0, [r3]
	cmp r0, 0x2
	bhi _080B451E
	adds r2, r0, 0
	lsls r2, 2
	add r2, r12
	ldrb r0, [r6, 0xB]
	ldrb r1, [r6, 0x9]
	adds r0, r1
	ldr r1, [r6, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrb r1, [r3]
	lsls r1, 2
	add r1, r12
	ldr r2, _080B4530 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r2
	ldrh r0, [r0, 0xA]
	strh r0, [r1, 0x2]
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
_080B451E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B452C: .4byte gUnknown_02038730
_080B4530: .4byte gTasks
	thumb_func_end sub_80B4470

	thumb_func_start ClearItemPurchases
ClearItemPurchases: @ 80B4534
	push {lr}
	ldr r0, _080B4548 @ =gUnknown_02038730
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080B454C @ =gUnknown_02038724
	movs r1, 0x3
	bl ClearItemSlots
	pop {r0}
	bx r0
	.align 2, 0
_080B4548: .4byte gUnknown_02038730
_080B454C: .4byte gUnknown_02038724
	thumb_func_end ClearItemPurchases

	thumb_func_start CreatePokemartMenu
CreatePokemartMenu: @ 80B4550
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0
	bl CreateShopMenu
	adds r0, r4, 0
	bl SetShopItemsForSale
	bl ClearItemPurchases
	ldr r0, _080B4570 @ =EnableBothScriptContexts
	bl SetShopMenuCallback
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B4570: .4byte EnableBothScriptContexts
	thumb_func_end CreatePokemartMenu

	thumb_func_start CreateDecorationShop1Menu
CreateDecorationShop1Menu: @ 80B4574
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x1
	bl CreateShopMenu
	adds r0, r4, 0
	bl SetShopItemsForSale
	ldr r0, _080B4590 @ =EnableBothScriptContexts
	bl SetShopMenuCallback
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B4590: .4byte EnableBothScriptContexts
	thumb_func_end CreateDecorationShop1Menu

	thumb_func_start CreateDecorationShop2Menu
CreateDecorationShop2Menu: @ 80B4594
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x2
	bl CreateShopMenu
	adds r0, r4, 0
	bl SetShopItemsForSale
	ldr r0, _080B45B0 @ =EnableBothScriptContexts
	bl SetShopMenuCallback
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B45B0: .4byte EnableBothScriptContexts
	thumb_func_end CreateDecorationShop2Menu

	thumb_func_start sub_80B45B4
sub_80B45B4: @ 80B45B4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	mov r9, r1
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r2, 16
	mov r10, r2
	ldr r2, _080B4648 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrh r0, [r1, 0x10]
	subs r0, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r1, 0x12]
	subs r0, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	ldrh r4, [r1, 0xA]
	movs r2, 0xC
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080B4678
	movs r2, 0
	lsls r5, 16
	str r5, [sp, 0xC]
	lsls r0, r3, 16
	lsls r1, r4, 16
	asrs r0, 16
	str r0, [sp]
	asrs r1, 16
	str r1, [sp, 0x4]
	lsls r0, r1, 1
	mov r1, r9
	adds r7, r0, r1
_080B4608:
	movs r4, 0
	lsls r2, 16
	mov r8, r2
	asrs r0, r2, 16
	ldr r2, [sp]
	adds r6, r2, r0
_080B4614:
	ldr r0, [sp, 0xC]
	asrs r1, r0, 16
	lsls r4, 16
	asrs r0, r4, 16
	adds r5, r1, r0
	adds r0, r5, 0
	adds r1, r6, 0
	bl MapGridGetMetatileIdAt
	movs r2, 0
	ldrsh r1, [r7, r2]
	lsls r0, 16
	asrs r0, 16
	cmp r1, r0
	bne _080B465C
	ldr r0, [sp, 0x4]
	cmp r0, 0x2
	beq _080B464C
	ldrh r0, [r7, 0x2]
	mov r2, r10
	orrs r2, r0
	adds r0, r5, 0
	adds r1, r6, 0
	bl MapGridSetMetatileIdAt
	b _080B465C
	.align 2, 0
_080B4648: .4byte gTasks
_080B464C:
	mov r1, r9
	ldrh r0, [r1]
	mov r2, r10
	orrs r2, r0
	adds r0, r5, 0
	adds r1, r6, 0
	bl MapGridSetMetatileIdAt
_080B465C:
	movs r2, 0x80
	lsls r2, 9
	adds r0, r4, r2
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080B4614
	adds r0, r2, 0
	add r0, r8
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080B4608
	b _080B4700
_080B4678:
	movs r2, 0
	lsls r5, 16
	str r5, [sp, 0xC]
	lsls r0, r3, 16
	lsls r1, r4, 16
	asrs r0, 16
	str r0, [sp, 0x8]
	asrs r7, r1, 16
_080B4688:
	movs r4, 0
	lsls r2, 16
	mov r8, r2
	asrs r0, r2, 16
	ldr r1, [sp, 0x8]
	adds r6, r1, r0
_080B4694:
	ldr r2, [sp, 0xC]
	asrs r1, r2, 16
	lsls r4, 16
	asrs r0, r4, 16
	adds r5, r1, r0
	adds r0, r5, 0
	adds r1, r6, 0
	bl MapGridGetMetatileIdAt
	movs r1, 0x2
	subs r1, r7
	lsls r1, 1
	add r1, r9
	movs r2, 0
	ldrsh r1, [r1, r2]
	lsls r0, 16
	asrs r0, 16
	cmp r1, r0
	bne _080B46E6
	cmp r7, 0x2
	beq _080B46D6
	movs r0, 0x1
	subs r0, r7
	lsls r0, 1
	add r0, r9
	ldrh r0, [r0]
	mov r2, r10
	orrs r2, r0
	adds r0, r5, 0
	adds r1, r6, 0
	bl MapGridSetMetatileIdAt
	b _080B46E6
_080B46D6:
	mov r1, r9
	ldrh r0, [r1, 0x4]
	mov r2, r10
	orrs r2, r0
	adds r0, r5, 0
	adds r1, r6, 0
	bl MapGridSetMetatileIdAt
_080B46E6:
	movs r2, 0x80
	lsls r2, 9
	adds r0, r4, r2
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080B4694
	adds r0, r2, 0
	add r0, r8
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080B4688
_080B4700:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B45B4

	thumb_func_start sub_80B4710
sub_80B4710: @ 80B4710
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	ldr r1, _080B4738 @ =gTasks + 0x8
	adds r4, r0, r1
	movs r0, 0x1
	strh r0, [r4, 0x6]
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	bhi _080B47AA
	lsls r0, 2
	ldr r1, _080B473C @ =_080B4740
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B4738: .4byte gTasks + 0x8
_080B473C: .4byte _080B4740
	.align 2, 0
_080B4740:
	.4byte _080B475C
	.4byte _080B4764
	.4byte _080B476C
	.4byte _080B4774
	.4byte _080B477C
	.4byte _080B4790
	.4byte _080B47A0
_080B475C:
	ldr r1, _080B4760 @ =gUnknown_083CC714
	b _080B4792
	.align 2, 0
_080B4760: .4byte gUnknown_083CC714
_080B4764:
	ldr r1, _080B4768 @ =gUnknown_083CC71A
	b _080B4792
	.align 2, 0
_080B4768: .4byte gUnknown_083CC71A
_080B476C:
	ldr r1, _080B4770 @ =gUnknown_083CC720
	b _080B477E
	.align 2, 0
_080B4770: .4byte gUnknown_083CC720
_080B4774:
	ldr r1, _080B4778 @ =gUnknown_083CC726
	b _080B4792
	.align 2, 0
_080B4778: .4byte gUnknown_083CC726
_080B477C:
	ldr r1, _080B478C @ =gUnknown_083CC72C
_080B477E:
	movs r2, 0xC0
	lsls r2, 4
	adds r0, r3, 0
	bl sub_80B45B4
	b _080B47AA
	.align 2, 0
_080B478C: .4byte gUnknown_083CC72C
_080B4790:
	ldr r1, _080B479C @ =gUnknown_083CC732
_080B4792:
	adds r0, r3, 0
	movs r2, 0
	bl sub_80B45B4
	b _080B47AA
	.align 2, 0
_080B479C: .4byte gUnknown_083CC732
_080B47A0:
	ldr r1, _080B47D4 @ =gUnknown_083CC738
	adds r0, r3, 0
	movs r2, 0
	bl sub_80B45B4
_080B47AA:
	ldrh r0, [r4]
	adds r0, 0x1
	movs r1, 0x7
	ands r0, r1
	strh r0, [r4]
	adds r5, r0, 0
	cmp r5, 0
	bne _080B47CE
	bl DrawWholeMapView
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	adds r0, 0x1
	movs r1, 0x3
	bl __modsi3
	strh r0, [r4, 0x2]
	strh r5, [r4, 0x6]
_080B47CE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B47D4: .4byte gUnknown_083CC738
	thumb_func_end sub_80B4710

	thumb_func_start sub_80B47D8
sub_80B47D8: @ 80B47D8
	push {r4-r7,lr}
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	ldr r6, _080B481C @ =sub_80B4710
	adds r0, r6, 0
	movs r1, 0
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080B4820 @ =gTasks + 0x8
	adds r7, r0, r1
	adds r0, r7, 0
	adds r0, 0x8
	adds r1, r7, 0
	adds r1, 0xA
	bl PlayerGetDestCoords
	movs r0, 0
	strh r0, [r7]
	strh r0, [r7, 0x2]
	strh r5, [r7, 0x4]
	adds r0, r4, 0
	bl _call_via_r6
	adds r0, r4, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B481C: .4byte sub_80B4710
_080B4820: .4byte gTasks + 0x8
	thumb_func_end sub_80B47D8

	thumb_func_start sub_80B4824
sub_80B4824: @ 80B4824
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80B47D8
	ldr r1, _080B4838 @ =gUnknown_02038731
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080B4838: .4byte gUnknown_02038731
	thumb_func_end sub_80B4824

	thumb_func_start sub_80B483C
sub_80B483C: @ 80B483C
	push {lr}
	ldr r0, _080B484C @ =gUnknown_02038731
	ldrb r0, [r0]
	bl DestroyTask
	pop {r0}
	bx r0
	.align 2, 0
_080B484C: .4byte gUnknown_02038731
	thumb_func_end sub_80B483C

	thumb_func_start sub_80B4850
sub_80B4850: @ 80B4850
	push {lr}
	ldr r2, _080B4874 @ =gTasks
	ldr r0, _080B4878 @ =gUnknown_02038731
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r1, r0, r2
	movs r2, 0xE
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080B487C
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0x2
	bne _080B487C
	movs r0, 0
	b _080B487E
	.align 2, 0
_080B4874: .4byte gTasks
_080B4878: .4byte gUnknown_02038731
_080B487C:
	movs r0, 0x1
_080B487E:
	pop {r1}
	bx r1
	thumb_func_end sub_80B4850

	.align 2, 0 @ Don't pad with nop.
