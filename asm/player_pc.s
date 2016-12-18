	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start PlayerPCProcessMenuInput
PlayerPCProcessMenuInput: @ 8139D64
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, r5, 0
	ldr r2, _08139D88 @ =gMain
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08139D8C
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	b _08139E10
	.align 2, 0
_08139D88: .4byte gMain
_08139D8C:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08139DA2
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	b _08139E10
_08139DA2:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08139DE0
	bl sub_8072DEC
	movs r0, 0x5
	bl PlaySE
	ldr r4, _08139DD8 @ =gUnknown_08406298
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08139DDC @ =gUnknown_02039314
	ldr r1, [r1]
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 3
	adds r4, 0x4
	adds r0, r4
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
	b _08139E10
	.align 2, 0
_08139DD8: .4byte gUnknown_08406298
_08139DDC: .4byte gUnknown_02039314
_08139DE0:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08139E10
	bl sub_8072DEC
	movs r0, 0x5
	bl PlaySE
	ldr r2, _08139E18 @ =gUnknown_08406298
	ldr r0, _08139E1C @ =gUnknown_030007B4
	ldrb r0, [r0]
	ldr r1, _08139E20 @ =gUnknown_02039314
	ldr r1, [r1]
	adds r0, r1
	subs r0, 0x1
	ldrb r0, [r0]
	lsls r0, 3
	adds r2, 0x4
	adds r0, r2
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
_08139E10:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08139E18: .4byte gUnknown_08406298
_08139E1C: .4byte gUnknown_030007B4
_08139E20: .4byte gUnknown_02039314
	thumb_func_end PlayerPCProcessMenuInput

	thumb_func_start ReshowPlayerPC
ReshowPlayerPC: @ 8139E24
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08139E38 @ =gOtherText_WhatWillYouDo
	ldr r2, _08139E3C @ =InitPlayerPCMenu
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r0}
	bx r0
	.align 2, 0
_08139E38: .4byte gOtherText_WhatWillYouDo
_08139E3C: .4byte InitPlayerPCMenu
	thumb_func_end ReshowPlayerPC

	thumb_func_start PlayerPC_ItemStorage
PlayerPC_ItemStorage: @ 8139E40
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl InitItemStorageMenu
	ldr r1, _08139E64 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08139E68 @ =ItemStorageMenuProcessInput
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08139E64: .4byte gTasks
_08139E68: .4byte ItemStorageMenuProcessInput
	thumb_func_end PlayerPC_ItemStorage

	thumb_func_start PlayerPC_Mailbox
PlayerPC_Mailbox: @ 8139E6C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x9
	bl MenuZeroFillWindowRect
	bl sub_813AF3C
	ldr r1, _08139E9C @ =0x0201fe00
	movs r2, 0
	strb r0, [r1, 0x3]
	lsls r0, 24
	cmp r0, 0
	bne _08139EA8
	ldr r1, _08139EA0 @ =gOtherText_NoMailHere
	ldr r2, _08139EA4 @ =ReshowPlayerPC
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	b _08139ECA
	.align 2, 0
_08139E9C: .4byte 0x0201fe00
_08139EA0: .4byte gOtherText_NoMailHere
_08139EA4: .4byte ReshowPlayerPC
_08139EA8:
	strb r2, [r1]
	strb r2, [r1, 0x2]
	bl sub_813AF78
	adds r0, r4, 0
	bl sub_813A240
	adds r0, r4, 0
	bl sub_813B108
	ldr r0, _08139ED0 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08139ED4 @ =sub_813B174
	str r0, [r1]
_08139ECA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08139ED0: .4byte gTasks
_08139ED4: .4byte sub_813B174
	thumb_func_end PlayerPC_Mailbox

	thumb_func_start PlayerPC_Decoration
PlayerPC_Decoration: @ 8139ED8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x9
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl DoPlayerPCDecoration
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerPC_Decoration

	thumb_func_start PlayerPC_TurnOff
PlayerPC_TurnOff: @ 8139EF8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08139F24 @ =gUnknown_030007B4
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _08139F3C
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r0, _08139F28 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _08139F30
	ldr r0, _08139F2C @ =gUnknown_08152850
	bl ScriptContext1_SetupScript
	b _08139F4C
	.align 2, 0
_08139F24: .4byte gUnknown_030007B4
_08139F28: .4byte gSaveBlock2
_08139F2C: .4byte gUnknown_08152850
_08139F30:
	ldr r0, _08139F38 @ =gUnknown_08152C75
	bl ScriptContext1_SetupScript
	b _08139F4C
	.align 2, 0
_08139F38: .4byte gUnknown_08152C75
_08139F3C:
	movs r0, 0
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x9
	bl MenuZeroFillWindowRect
	bl EnableBothScriptContexts
_08139F4C:
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerPC_TurnOff

	thumb_func_start InitItemStorageMenu
InitItemStorageMenu: @ 8139F58
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x9
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0
	movs r2, 0xB
	movs r3, 0x9
	bl MenuDrawTextWindow
	ldr r3, _08139FAC @ =gUnknown_084062C0
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x4
	bl PrintMenuItems
	str r4, [sp]
	movs r0, 0xA
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x4
	bl InitMenu
	ldr r0, _08139FB0 @ =gUnknown_08406288
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	bl ItemStorageMenuPrint
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08139FAC: .4byte gUnknown_084062C0
_08139FB0: .4byte gUnknown_08406288
	thumb_func_end InitItemStorageMenu

	thumb_func_start ItemStorageMenuPrint
ItemStorageMenuPrint: @ 8139FB4
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x2
	movs r1, 0xF
	movs r2, 0x1B
	movs r3, 0x12
	bl MenuFillWindowRectWithBlankTile
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ItemStorageMenuPrint

	thumb_func_start ItemStorageMenuProcessInput
ItemStorageMenuProcessInput: @ 8139FD4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, r5, 0
	ldr r2, _08139FF4 @ =gMain
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08139FF8
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _0813A008
	.align 2, 0
_08139FF4: .4byte gMain
_08139FF8:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0813A024
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_0813A008:
	bl MoveMenuCursor
	ldr r4, _0813A020 @ =gUnknown_08406288
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	ldr r0, [r0]
	bl ItemStorageMenuPrint
	b _0813A06C
	.align 2, 0
_0813A020: .4byte gUnknown_08406288
_0813A024:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813A050
	movs r0, 0x5
	bl PlaySE
	ldr r4, _0813A04C @ =gUnknown_084062C0
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 21
	adds r4, 0x4
	adds r0, r4
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
	b _0813A06C
	.align 2, 0
_0813A04C: .4byte gUnknown_084062C0
_0813A050:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0813A06C
	bl sub_8072DEC
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0813A074 @ =gUnknown_084062C0
	ldr r1, [r0, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
_0813A06C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813A074: .4byte gUnknown_084062C0
	thumb_func_end ItemStorageMenuProcessInput

	thumb_func_start Task_ItemStorage_Deposit
Task_ItemStorage_Deposit: @ 813A078
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0813A09C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0813A094
	bl sub_80A6A30
	adds r0, r4, 0
	bl DestroyTask
_0813A094:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813A09C: .4byte gPaletteFade
	thumb_func_end Task_ItemStorage_Deposit

	thumb_func_start ItemStorage_Deposit
ItemStorage_Deposit: @ 813A0A0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0813A0C0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0813A0C4 @ =Task_ItemStorage_Deposit
	str r0, [r1]
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	pop {r0}
	bx r0
	.align 2, 0
_0813A0C0: .4byte gTasks
_0813A0C4: .4byte Task_ItemStorage_Deposit
	thumb_func_end ItemStorage_Deposit

	thumb_func_start sub_813A0C8
sub_813A0C8: @ 813A0C8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813A0E8
	ldr r0, _0813A0F0 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0813A0F4 @ =ItemStorageMenuProcessInput
	str r0, [r1]
_0813A0E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813A0F0: .4byte gTasks
_0813A0F4: .4byte ItemStorageMenuProcessInput
	thumb_func_end sub_813A0C8

	thumb_func_start sub_813A0F8
sub_813A0F8: @ 813A0F8
	push {lr}
	bl MenuDisplayMessageBox
	movs r0, 0x1
	bl InitItemStorageMenu
	ldr r0, _0813A114 @ =sub_813A0C8
	movs r1, 0
	bl CreateTask
	bl pal_fill_black
	pop {r0}
	bx r0
	.align 2, 0
_0813A114: .4byte sub_813A0C8
	thumb_func_end sub_813A0F8

	thumb_func_start ItemStorage_Withdraw
ItemStorage_Withdraw: @ 813A118
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r6, r0, 3
	ldr r7, _0813A174 @ =gTasks + 0x8
	adds r4, r6, r7
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0xB
	movs r3, 0x9
	bl MenuZeroFillWindowRect
	bl CountUsedPCItemSlots
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x4]
	cmp r0, 0
	beq _0813A17C
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0
	strh r0, [r4, 0xC]
	strh r0, [r4]
	strh r0, [r4, 0x2]
	adds r0, r5, 0
	bl sub_813A240
	adds r0, r5, 0
	movs r1, 0
	bl sub_813AE6C
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0813A178 @ =sub_813A280
	str r1, [r0]
	b _0813A188
	.align 2, 0
_0813A174: .4byte gTasks + 0x8
_0813A178: .4byte sub_813A280
_0813A17C:
	ldr r1, _0813A190 @ =gOtherText_NoItems
	ldr r2, _0813A194 @ =PlayerPC_ItemStorage
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_0813A188:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813A190: .4byte gOtherText_NoItems
_0813A194: .4byte PlayerPC_ItemStorage
	thumb_func_end ItemStorage_Withdraw

	thumb_func_start ItemStorage_Toss
ItemStorage_Toss: @ 813A198
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r6, r0, 3
	ldr r7, _0813A1F8 @ =gTasks + 0x8
	adds r4, r6, r7
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0xB
	movs r3, 0x9
	bl MenuZeroFillWindowRect
	bl CountUsedPCItemSlots
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x4]
	cmp r0, 0
	beq _0813A200
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0x2
	strh r0, [r4, 0xC]
	movs r0, 0
	strh r0, [r4]
	strh r0, [r4, 0x2]
	adds r0, r5, 0
	bl sub_813A240
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_813AE6C
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0813A1FC @ =sub_813A280
	str r1, [r0]
	b _0813A20C
	.align 2, 0
_0813A1F8: .4byte gTasks + 0x8
_0813A1FC: .4byte sub_813A280
_0813A200:
	ldr r1, _0813A214 @ =gOtherText_NoItems
	ldr r2, _0813A218 @ =PlayerPC_ItemStorage
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_0813A20C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813A214: .4byte gOtherText_NoItems
_0813A218: .4byte PlayerPC_ItemStorage
	thumb_func_end ItemStorage_Toss

	thumb_func_start ItemStorage_Exit
ItemStorage_Exit: @ 813A21C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0xB
	movs r3, 0x9
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl ReshowPlayerPC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ItemStorage_Exit

	thumb_func_start sub_813A240
sub_813A240: @ 813A240
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0813A260 @ =gTasks + 0x8
	adds r1, r0
	ldrh r2, [r1, 0x4]
	movs r3, 0x4
	ldrsh r0, [r1, r3]
	cmp r0, 0x7
	ble _0813A264
	movs r0, 0x8
	b _0813A266
	.align 2, 0
_0813A260: .4byte gTasks + 0x8
_0813A264:
	adds r0, r2, 0x1
_0813A266:
	strh r0, [r1, 0x8]
	ldr r1, _0813A274 @ =0x0201fe00
	ldrb r0, [r1, 0x3]
	cmp r0, 0x7
	bls _0813A278
	movs r0, 0x8
	b _0813A27A
	.align 2, 0
_0813A274: .4byte 0x0201fe00
_0813A278:
	adds r0, 0x1
_0813A27A:
	strb r0, [r1, 0x1]
	pop {r0}
	bx r0
	thumb_func_end sub_813A240

	thumb_func_start sub_813A280
sub_813A280: @ 813A280
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0813A2DC @ =gTasks + 0x8
	adds r4, r0, r1
	ldr r2, _0813A2E0 @ =gMain
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0813A306
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0813A2E4
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	ldrh r1, [r4, 0x2]
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0813A2CC
	b _0813A460
_0813A2CC:
	lsls r0, r1, 16
	asrs r1, r0, 16
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	cmp r1, r0
	beq _0813A34C
	b _0813A358
	.align 2, 0
_0813A2DC: .4byte gTasks + 0x8
_0813A2E0: .4byte gMain
_0813A2E4:
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0813A2EE
	b _0813A460
_0813A2EE:
	movs r0, 0x5
	bl PlaySE
	ldrh r0, [r4, 0x2]
	subs r0, 0x1
	strh r0, [r4, 0x2]
	adds r0, r5, 0
	bl sub_813AE0C
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	b _0813A394
_0813A306:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0813A3A0
	movs r0, 0
	ldrsh r1, [r4, r0]
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	subs r0, 0x1
	cmp r1, r0
	beq _0813A370
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	ldrh r1, [r4, 0x2]
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0813A340
	b _0813A460
_0813A340:
	lsls r0, r1, 16
	asrs r1, r0, 16
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _0813A358
_0813A34C:
	ldr r0, _0813A354 @ =0x0000ffff
	bl sub_813AD58
	b _0813A460
	.align 2, 0
_0813A354: .4byte 0x0000ffff
_0813A358:
	ldr r0, _0813A36C @ =gSaveBlock1
	lsls r1, 2
	adds r1, r0
	movs r0, 0x93
	lsls r0, 3
	adds r1, r0
	ldrh r0, [r1]
	bl sub_813AD58
	b _0813A460
	.align 2, 0
_0813A36C: .4byte gSaveBlock1
_0813A370:
	movs r2, 0x2
	ldrsh r0, [r4, r2]
	adds r0, r1
	movs r2, 0x4
	ldrsh r1, [r4, r2]
	cmp r0, r1
	beq _0813A460
	movs r0, 0x5
	bl PlaySE
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	adds r0, r5, 0
	bl sub_813AE0C
	movs r1, 0x12
	ldrsh r0, [r4, r1]
_0813A394:
	cmp r0, 0
	beq _0813A460
	movs r0, 0
	bl MoveMenuCursor
	b _0813A460
_0813A3A0:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0813A3F0
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0813A3E8
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r2, 0x4
	ldrsh r1, [r4, r2]
	cmp r0, r1
	beq _0813A3DC
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	strh r0, [r4, 0x12]
	ldrh r0, [r4]
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r4, 0x10]
	ldr r0, _0813A3E4 @ =0x0000fff7
	bl sub_813AD58
_0813A3DC:
	adds r0, r5, 0
	bl sub_813ABE8
	b _0813A460
	.align 2, 0
_0813A3E4: .4byte 0x0000fff7
_0813A3E8:
	movs r0, 0x5
	bl PlaySE
	b _0813A420
_0813A3F0:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813A430
	movs r0, 0x5
	bl PlaySE
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0813A420
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r2, 0x4
	ldrsh r1, [r4, r2]
	cmp r0, r1
	beq _0813A44A
	adds r0, r5, 0
	bl sub_813A4B4
	b _0813A460
_0813A420:
	adds r0, r5, 0
	movs r1, 0
	bl sub_813AA30
	adds r0, r5, 0
	bl sub_813AE0C
	b _0813A460
_0813A430:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0813A460
	movs r0, 0x5
	bl PlaySE
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0813A452
	bl sub_8072DEC
_0813A44A:
	adds r0, r5, 0
	bl sub_813A468
	b _0813A460
_0813A452:
	adds r0, r6, 0
	movs r1, 0x1
	bl sub_813AA30
	adds r0, r6, 0
	bl sub_813AE0C
_0813A460:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_813A280

	thumb_func_start sub_813A468
sub_813A468: @ 813A468
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	bl BuyMenuFreeMemory
	movs r0, 0
	bl DestroyVerticalScrollIndicator
	movs r0, 0x1
	bl DestroyVerticalScrollIndicator
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl MenuDisplayMessageBox
	ldr r0, _0813A4AC @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	ldrb r0, [r4, 0x14]
	bl InitItemStorageMenu
	ldr r0, _0813A4B0 @ =ItemStorageMenuProcessInput
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813A4AC: .4byte gTasks
_0813A4B0: .4byte ItemStorageMenuProcessInput
	thumb_func_end sub_813A468

	thumb_func_start sub_813A4B4
sub_813A4B4: @ 813A4B4
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _0813A500 @ =gTasks + 0x8
	adds r4, r0, r1
	ldrb r0, [r4, 0x2]
	ldrb r1, [r4]
	adds r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0
	bl sub_80F996C
	movs r0, 0x1
	bl sub_80F996C
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0813A518
	ldr r1, _0813A504 @ =gSaveBlock1
	lsls r0, r5, 2
	adds r0, r1
	ldr r1, _0813A508 @ =0x0000049a
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0x1
	bne _0813A50C
	strh r0, [r4, 0x6]
	adds r0, r6, 0
	bl sub_813A6FC
	b _0813A570
	.align 2, 0
_0813A500: .4byte gTasks + 0x8
_0813A504: .4byte gSaveBlock1
_0813A508: .4byte 0x0000049a
_0813A50C:
	ldr r0, _0813A514 @ =0x0000fffe
	bl sub_813AD58
	b _0813A542
	.align 2, 0
_0813A514: .4byte 0x0000fffe
_0813A518:
	ldr r1, _0813A534 @ =gSaveBlock1
	lsls r0, r5, 2
	adds r0, r1
	ldr r1, _0813A538 @ =0x0000049a
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0x1
	bne _0813A53C
	strh r0, [r4, 0x6]
	adds r0, r6, 0
	bl sub_813A794
	b _0813A570
	.align 2, 0
_0813A534: .4byte gSaveBlock1
_0813A538: .4byte 0x0000049a
_0813A53C:
	ldr r0, _0813A578 @ =0x0000fffc
	bl sub_813AD58
_0813A542:
	movs r0, 0x1
	strh r0, [r4, 0x6]
	movs r0, 0x6
	movs r1, 0x8
	movs r2, 0xD
	movs r3, 0xB
	bl MenuDrawTextWindow
	ldrh r0, [r4, 0x6]
	movs r1, 0x3
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0x8
	movs r3, 0x9
	bl sub_80A418C
	ldr r1, _0813A57C @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813A580 @ =sub_813A584
	str r1, [r0]
_0813A570:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813A578: .4byte 0x0000fffc
_0813A57C: .4byte gTasks
_0813A580: .4byte sub_813A584
	thumb_func_end sub_813A4B4

	thumb_func_start sub_813A584
sub_813A584: @ 813A584
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r7, r0, 3
	ldr r0, _0813A5D0 @ =gTasks + 0x8
	mov r8, r0
	adds r4, r7, r0
	ldrb r0, [r4, 0x2]
	ldrb r1, [r4]
	adds r0, r1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r6, r3, 0
	ldr r2, _0813A5D4 @ =gMain
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0813A5E4
	movs r0, 0x6
	ldrsh r2, [r4, r0]
	ldr r1, _0813A5D8 @ =gSaveBlock1
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, _0813A5DC @ =0x0000049a
	adds r0, r1
	ldrh r0, [r0]
	cmp r2, r0
	beq _0813A5E0
	ldrh r0, [r4, 0x6]
	adds r0, 0x1
	b _0813A64A
	.align 2, 0
_0813A5D0: .4byte gTasks + 0x8
_0813A5D4: .4byte gMain
_0813A5D8: .4byte gSaveBlock1
_0813A5DC: .4byte 0x0000049a
_0813A5E0:
	movs r0, 0x1
	b _0813A64A
_0813A5E4:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0813A610
	ldrh r1, [r4, 0x6]
	movs r2, 0x6
	ldrsh r0, [r4, r2]
	cmp r0, 0x1
	beq _0813A5FA
	subs r0, r1, 0x1
	b _0813A64A
_0813A5FA:
	ldr r0, _0813A608 @ =gSaveBlock1
	lsls r1, r3, 2
	adds r1, r0
	ldr r3, _0813A60C @ =0x0000049a
	adds r1, r3
	ldrh r0, [r1]
	b _0813A64A
	.align 2, 0
_0813A608: .4byte gSaveBlock1
_0813A60C: .4byte 0x0000049a
_0813A610:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0813A628
	ldrh r0, [r4, 0x6]
	subs r0, 0xA
	strh r0, [r4, 0x6]
	lsls r0, 16
	cmp r0, 0
	bgt _0813A64C
	movs r0, 0x1
	b _0813A64A
_0813A628:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0813A668
	ldrh r0, [r4, 0x6]
	adds r0, 0xA
	strh r0, [r4, 0x6]
	movs r0, 0x6
	ldrsh r2, [r4, r0]
	ldr r1, _0813A660 @ =gSaveBlock1
	lsls r0, r6, 2
	adds r0, r1
	ldr r1, _0813A664 @ =0x0000049a
	adds r0, r1
	ldrh r0, [r0]
	cmp r2, r0
	ble _0813A64C
_0813A64A:
	strh r0, [r4, 0x6]
_0813A64C:
	ldrh r0, [r4, 0x6]
	movs r1, 0x3
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0x8
	movs r3, 0x9
	bl sub_80A418C
	b _0813A6E8
	.align 2, 0
_0813A660: .4byte gSaveBlock1
_0813A664: .4byte 0x0000049a
_0813A668:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813A69C
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x6
	movs r1, 0x6
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0813A694
	adds r0, r5, 0
	bl sub_813A6FC
	b _0813A6E8
_0813A694:
	adds r0, r5, 0
	bl sub_813A794
	b _0813A6E8
_0813A69C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0813A6E8
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x6
	movs r1, 0x6
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	movs r0, 0
	bl sub_80F98DC
	movs r0, 0x1
	bl sub_80F98DC
	ldr r2, _0813A6F4 @ =gSaveBlock1
	movs r3, 0x2
	ldrsh r0, [r4, r3]
	movs r3, 0
	ldrsh r1, [r4, r3]
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x93
	lsls r1, 3
	adds r0, r1
	ldrh r0, [r0]
	bl sub_813AD58
	mov r0, r8
	subs r0, 0x8
	adds r0, r7, r0
	ldr r1, _0813A6F8 @ =sub_813A280
	str r1, [r0]
_0813A6E8:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813A6F4: .4byte gSaveBlock1
_0813A6F8: .4byte sub_813A280
	thumb_func_end sub_813A584

	thumb_func_start sub_813A6FC
sub_813A6FC: @ 813A6FC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r6, r1, 3
	ldr r7, _0813A758 @ =gTasks + 0x8
	adds r4, r6, r7
	ldrb r0, [r4, 0x2]
	ldrb r1, [r4]
	adds r0, r1
	lsls r0, 24
	ldr r1, _0813A75C @ =gSaveBlock1
	lsrs r0, 22
	adds r0, r1
	movs r2, 0x93
	lsls r2, 3
	adds r5, r0, r2
	ldrh r0, [r5]
	ldrh r1, [r4, 0x6]
	bl AddBagItem
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813A770
	ldrh r0, [r5]
	ldr r1, _0813A760 @ =gStringVar1
	bl CopyItemName
	ldr r0, _0813A764 @ =gStringVar2
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, _0813A768 @ =0x0000fffd
	bl sub_813AD58
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0813A76C @ =sub_813A8F0
	b _0813A782
	.align 2, 0
_0813A758: .4byte gTasks + 0x8
_0813A75C: .4byte gSaveBlock1
_0813A760: .4byte gStringVar1
_0813A764: .4byte gStringVar2
_0813A768: .4byte 0x0000fffd
_0813A76C: .4byte sub_813A8F0
_0813A770:
	movs r0, 0
	strh r0, [r4, 0x6]
	ldr r0, _0813A78C @ =0x0000fffa
	bl sub_813AD58
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0813A790 @ =sub_813A984
_0813A782:
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813A78C: .4byte 0x0000fffa
_0813A790: .4byte sub_813A984
	thumb_func_end sub_813A6FC

	thumb_func_start sub_813A794
sub_813A794: @ 813A794
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r7, r0, 3
	ldr r0, _0813A7FC @ =gTasks + 0x8
	mov r8, r0
	adds r4, r7, r0
	ldrb r0, [r4, 0x2]
	ldrb r1, [r4]
	adds r0, r1
	lsls r0, 24
	ldr r1, _0813A800 @ =gSaveBlock1
	lsrs r0, 22
	adds r0, r1
	movs r2, 0x93
	lsls r2, 3
	adds r5, r0, r2
	ldrh r0, [r5]
	bl ItemId_GetImportance
	lsls r0, 24
	cmp r0, 0
	bne _0813A814
	ldrh r0, [r5]
	ldr r1, _0813A804 @ =gStringVar1
	bl CopyItemName
	ldr r0, _0813A808 @ =gStringVar2
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, _0813A80C @ =0x0000fff8
	bl sub_813AD58
	movs r0, 0x7
	movs r1, 0x6
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _0813A810 @ =gUnknown_084062E0
	adds r0, r6, 0
	bl sub_80F914C
	b _0813A828
	.align 2, 0
_0813A7FC: .4byte gTasks + 0x8
_0813A800: .4byte gSaveBlock1
_0813A804: .4byte gStringVar1
_0813A808: .4byte gStringVar2
_0813A80C: .4byte 0x0000fff8
_0813A810: .4byte gUnknown_084062E0
_0813A814:
	movs r0, 0
	strh r0, [r4, 0x6]
	ldr r0, _0813A834 @ =0x0000fff9
	bl sub_813AD58
	mov r0, r8
	subs r0, 0x8
	adds r0, r7, r0
	ldr r1, _0813A838 @ =sub_813A8F0
	str r1, [r0]
_0813A828:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813A834: .4byte 0x0000fff9
_0813A838: .4byte sub_813A8F0
	thumb_func_end sub_813A794

	thumb_func_start sub_813A83C
sub_813A83C: @ 813A83C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x6
	movs r1, 0x6
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	ldr r0, _0813A86C @ =0x0000fffb
	bl sub_813AD58
	ldr r1, _0813A870 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813A874 @ =sub_813A8F0
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813A86C: .4byte 0x0000fffb
_0813A870: .4byte gTasks
_0813A874: .4byte sub_813A8F0
	thumb_func_end sub_813A83C

	thumb_func_start sub_813A878
sub_813A878: @ 813A878
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r6, _0813A8E4 @ =gTasks + 0x8
	adds r5, r4, r6
	movs r0, 0x6
	movs r1, 0x6
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	ldrb r3, [r5, 0x8]
	ldrb r0, [r5]
	str r0, [sp]
	movs r0, 0xD
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x2
	bl InitMenu
	movs r0, 0
	bl sub_80F98DC
	movs r0, 0x1
	bl sub_80F98DC
	ldr r2, _0813A8E8 @ =gSaveBlock1
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	movs r3, 0
	ldrsh r1, [r5, r3]
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x93
	lsls r1, 3
	adds r0, r1
	ldrh r0, [r0]
	bl sub_813AD58
	subs r6, 0x8
	adds r4, r6
	ldr r0, _0813A8EC @ =sub_813A280
	str r0, [r4]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813A8E4: .4byte gTasks + 0x8
_0813A8E8: .4byte gSaveBlock1
_0813A8EC: .4byte sub_813A280
	thumb_func_end sub_813A878

	thumb_func_start sub_813A8F0
sub_813A8F0: @ 813A8F0
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _0813A97C @ =gTasks + 0x8
	adds r5, r0, r1
	ldr r0, _0813A980 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0813A912
	cmp r1, 0x2
	bne _0813A972
_0813A912:
	ldrb r0, [r5, 0x2]
	ldrb r1, [r5]
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x6]
	bl RemovePCItem
	ldrh r4, [r5, 0x4]
	bl CountUsedPCItemSlots
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x4]
	lsls r4, 16
	asrs r4, 16
	cmp r4, r0
	beq _0813A952
	movs r2, 0x8
	ldrsh r0, [r5, r2]
	movs r2, 0x2
	ldrsh r1, [r5, r2]
	adds r0, r1
	cmp r4, r0
	bge _0813A952
	ldrh r1, [r5, 0x2]
	movs r2, 0x2
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _0813A952
	subs r0, r1, 0x1
	strh r0, [r5, 0x2]
_0813A952:
	adds r0, r6, 0
	bl sub_813A240
	adds r0, r6, 0
	bl sub_813A9EC
	ldrb r3, [r5, 0x8]
	ldrb r0, [r5]
	str r0, [sp]
	movs r0, 0xD
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x2
	bl InitMenu
_0813A972:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813A97C: .4byte gTasks + 0x8
_0813A980: .4byte gMain
	thumb_func_end sub_813A8F0

	thumb_func_start sub_813A984
sub_813A984: @ 813A984
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r4, r1, 3
	ldr r5, _0813A9DC @ =gTasks + 0x8
	adds r3, r4, r5
	ldr r0, _0813A9E0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0813A9A4
	cmp r1, 0x2
	bne _0813A9D6
_0813A9A4:
	ldr r2, _0813A9E4 @ =gSaveBlock1
	movs r1, 0x2
	ldrsh r0, [r3, r1]
	movs r6, 0
	ldrsh r1, [r3, r6]
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x93
	lsls r1, 3
	adds r0, r1
	ldrh r0, [r0]
	bl sub_813AD58
	movs r0, 0
	bl sub_80F98DC
	movs r0, 0x1
	bl sub_80F98DC
	adds r0, r5, 0
	subs r0, 0x8
	adds r0, r4, r0
	ldr r1, _0813A9E8 @ =sub_813A280
	str r1, [r0]
_0813A9D6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813A9DC: .4byte gTasks + 0x8
_0813A9E0: .4byte gMain
_0813A9E4: .4byte gSaveBlock1
_0813A9E8: .4byte sub_813A280
	thumb_func_end sub_813A984

	thumb_func_start sub_813A9EC
sub_813A9EC: @ 813A9EC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x6
	movs r1, 0x6
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	movs r0, 0
	bl sub_80F98DC
	movs r0, 0x1
	bl sub_80F98DC
	adds r0, r4, 0
	bl sub_813AE0C
	ldr r1, _0813AA28 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813AA2C @ =sub_813A280
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813AA28: .4byte gTasks
_0813AA2C: .4byte sub_813A280
	thumb_func_end sub_813A9EC

	thumb_func_start sub_813AA30
sub_813AA30: @ 813AA30
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0813AA80 @ =gTasks + 0x8
	adds r4, r1, r0
	ldrb r0, [r4]
	ldrb r1, [r4, 0x2]
	adds r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0
	strh r0, [r4, 0x12]
	ldrb r0, [r4, 0x4]
	cmp r0, r5
	bls _0813AA88
	ldrb r0, [r4, 0x10]
	cmp r0, r5
	beq _0813AA88
	cmp r2, 0
	bne _0813AA88
	ldr r1, _0813AA84 @ =gSaveBlock1
	movs r0, 0x10
	ldrsh r2, [r4, r0]
	lsls r2, 2
	movs r0, 0x93
	lsls r0, 3
	adds r1, r0
	adds r2, r1
	ldr r3, [r2]
	lsls r0, r5, 2
	adds r0, r1
	ldr r1, [r0]
	str r1, [r2]
	str r3, [r0]
	b _0813AAB8
	.align 2, 0
_0813AA80: .4byte gTasks + 0x8
_0813AA84: .4byte gSaveBlock1
_0813AA88:
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r5, r0
	bne _0813AA9C
	ldr r0, _0813AA98 @ =0x0000ffff
	bl sub_813AD58
	b _0813AAAE
	.align 2, 0
_0813AA98: .4byte 0x0000ffff
_0813AA9C:
	ldr r0, _0813AAC0 @ =gSaveBlock1
	lsls r1, r5, 2
	adds r1, r0
	movs r2, 0x93
	lsls r2, 3
	adds r1, r2
	ldrh r0, [r1]
	bl sub_813AD58
_0813AAAE:
	movs r0, 0x10
	ldrsh r1, [r4, r0]
	movs r2, 0x2
	ldrsh r0, [r4, r2]
	subs r0, r1, r0
_0813AAB8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813AAC0: .4byte gSaveBlock1
	thumb_func_end sub_813AA30

	thumb_func_start sub_813AAC4
sub_813AAC4: @ 813AAC4
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r6, [sp, 0x14]
	lsls r4, 16
	lsrs r4, 16
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _0813AAF4 @ =gStringVar1
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_80A4164
	cmp r6, 0
	beq _0813AAFC
	ldr r0, _0813AAF8 @ =gUnknown_0840632A
	movs r1, 0x1A
	adds r2, r7, 0
	bl MenuPrint
	b _0813AB06
	.align 2, 0
_0813AAF4: .4byte gStringVar1
_0813AAF8: .4byte gUnknown_0840632A
_0813AAFC:
	ldr r0, _0813AB0C @ =gUnknown_08406327
	movs r1, 0x1A
	adds r2, r7, 0
	bl MenuPrint
_0813AB06:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813AB0C: .4byte gUnknown_08406327
	thumb_func_end sub_813AAC4

	thumb_func_start sub_813AB10
sub_813AB10: @ 813AB10
	push {lr}
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _0813AB24 @ =gUnknown_08406330
	movs r1, 0x19
	bl MenuPrint
	pop {r0}
	bx r0
	.align 2, 0
_0813AB24: .4byte gUnknown_08406330
	thumb_func_end sub_813AB10

	thumb_func_start sub_813AB28
sub_813AB28: @ 813AB28
	push {r4,r5,lr}
	adds r4, r2, 0
	lsls r1, 24
	lsrs r5, r1, 24
	ldrh r0, [r0]
	ldr r1, _0813AB48 @ =gStringVar1
	bl CopyItemName
	cmp r4, 0
	beq _0813AB50
	ldr r0, _0813AB4C @ =gUnknown_0840631E
	movs r1, 0x10
	adds r2, r5, 0
	bl MenuPrint
	b _0813AB5A
	.align 2, 0
_0813AB48: .4byte gStringVar1
_0813AB4C: .4byte gUnknown_0840631E
_0813AB50:
	ldr r0, _0813AB60 @ =gUnknown_08406318
	movs r1, 0x10
	adds r2, r5, 0
	bl MenuPrint
_0813AB5A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813AB60: .4byte gUnknown_08406318
	thumb_func_end sub_813AB28

	thumb_func_start sub_813AB64
sub_813AB64: @ 813AB64
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r4, 24
	lsrs r4, 24
	adds r1, r4, 0
	bl sub_813AB28
	ldrh r0, [r6, 0x2]
	str r5, [sp]
	movs r1, 0x1
	adds r2, r4, 0
	movs r3, 0x3
	bl sub_813AAC4
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_813AB64

	thumb_func_start sub_813AB90
sub_813AB90: @ 813AB90
	push {r4,lr}
	adds r4, r1, 0
	lsls r4, 24
	lsrs r4, 24
	adds r1, r4, 0
	bl sub_813AB28
	adds r0, r4, 0
	bl sub_813AB10
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813AB90

	thumb_func_start sub_813ABAC
sub_813ABAC: @ 813ABAC
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r6, r2, 0
	lsls r1, 24
	lsrs r5, r1, 24
	adds r1, r5, 0
	bl sub_813AB28
	ldrh r1, [r4]
	movs r0, 0xA9
	lsls r0, 1
	cmp r1, r0
	bhi _0813ABD8
	ldrh r0, [r4, 0x2]
	str r6, [sp]
	movs r1, 0x1
	adds r2, r5, 0
	movs r3, 0x3
	bl sub_813AAC4
	b _0813ABDE
_0813ABD8:
	adds r0, r5, 0
	bl sub_813AB10
_0813ABDE:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_813ABAC

	thumb_func_start sub_813ABE8
sub_813ABE8: @ 813ABE8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0813AC0C @ =gTasks + 0x8
	adds r6, r1, r0
	movs r0, 0
	mov r8, r0
	ldrh r5, [r6, 0x2]
	movs r2, 0x2
	ldrsh r1, [r6, r2]
	b _0813ACC4
	.align 2, 0
_0813AC0C: .4byte gTasks + 0x8
_0813AC10:
	subs r0, r5, r1
	lsls r0, 17
	lsrs r0, 16
	mov r8, r0
	movs r1, 0x4
	ldrsh r0, [r6, r1]
	cmp r5, r0
	beq _0813AD04
	movs r7, 0
	movs r2, 0x12
	ldrsh r0, [r6, r2]
	cmp r0, 0
	beq _0813AC34
	movs r1, 0x10
	ldrsh r0, [r6, r1]
	cmp r5, r0
	bne _0813AC34
	movs r7, 0x1
_0813AC34:
	ldr r0, _0813AC5C @ =gSaveBlock1
	lsls r4, r5, 2
	adds r0, r4, r0
	movs r2, 0x93
	lsls r2, 3
	adds r0, r2
	ldrh r0, [r0]
	bl GetPocketByItemId
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x4
	bhi _0813ACBA
	lsls r0, 2
	ldr r1, _0813AC60 @ =_0813AC64
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813AC5C: .4byte gSaveBlock1
_0813AC60: .4byte _0813AC64
	.align 2, 0
_0813AC64:
	.4byte _0813AC78
	.4byte _0813AC78
	.4byte _0813ACA8
	.4byte _0813AC78
	.4byte _0813AC90
_0813AC78:
	ldr r0, _0813AC8C @ =gSaveBlock1 + 0x498
	adds r0, r4, r0
	mov r1, r8
	adds r1, 0x2
	lsls r1, 24
	lsrs r1, 24
	adds r2, r7, 0
	bl sub_813AB64
	b _0813ACBA
	.align 2, 0
_0813AC8C: .4byte gSaveBlock1 + 0x498
_0813AC90:
	ldr r0, _0813ACA4 @ =gSaveBlock1 + 0x498
	adds r0, r4, r0
	mov r1, r8
	adds r1, 0x2
	lsls r1, 24
	lsrs r1, 24
	adds r2, r7, 0
	bl sub_813AB90
	b _0813ACBA
	.align 2, 0
_0813ACA4: .4byte gSaveBlock1 + 0x498
_0813ACA8:
	ldr r0, _0813AD00 @ =gSaveBlock1 + 0x498
	adds r0, r4, r0
	mov r1, r8
	adds r1, 0x2
	lsls r1, 24
	lsrs r1, 24
	adds r2, r7, 0
	bl sub_813ABAC
_0813ACBA:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	movs r0, 0x2
	ldrsh r1, [r6, r0]
_0813ACC4:
	movs r2, 0x8
	ldrsh r0, [r6, r2]
	adds r0, r1, r0
	cmp r5, r0
	blt _0813AC10
_0813ACCE:
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	subs r0, r5, r0
	cmp r0, 0x7
	bgt _0813ACEA
	mov r1, r8
	adds r1, 0x4
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x10
	movs r2, 0x1C
	movs r3, 0x12
	bl MenuFillWindowRectWithBlankTile
_0813ACEA:
	movs r2, 0x2
	ldrsh r0, [r6, r2]
	cmp r0, 0
	beq _0813AD20
	movs r0, 0
	movs r1, 0xB8
	movs r2, 0x8
	bl CreateVerticalScrollIndicators
	b _0813AD26
	.align 2, 0
_0813AD00: .4byte gSaveBlock1 + 0x498
_0813AD04:
	ldr r0, _0813AD1C @ =gOtherText_CancelNoTerminator
	mov r2, r8
	adds r2, 0x2
	lsls r2, 19
	lsrs r2, 16
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0x80
	movs r3, 0x68
	bl sub_8072A18
	b _0813ACCE
	.align 2, 0
_0813AD1C: .4byte gOtherText_CancelNoTerminator
_0813AD20:
	movs r0, 0
	bl DestroyVerticalScrollIndicator
_0813AD26:
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	movs r2, 0x8
	ldrsh r1, [r6, r2]
	adds r0, r1
	movs r2, 0x4
	ldrsh r1, [r6, r2]
	cmp r0, r1
	bgt _0813AD44
	movs r0, 0x1
	movs r1, 0xB8
	movs r2, 0x98
	bl CreateVerticalScrollIndicators
	b _0813AD4A
_0813AD44:
	movs r0, 0x1
	bl DestroyVerticalScrollIndicator
_0813AD4A:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_813ABE8

	thumb_func_start sub_813AD58
sub_813AD58: @ 813AD58
	push {lr}
	sub sp, 0x8
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r2, _0813AD74 @ =0xffff0009
	adds r0, r1, r2
	cmp r0, 0x8
	bhi _0813ADE8
	lsls r0, 2
	ldr r1, _0813AD78 @ =_0813AD7C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813AD74: .4byte 0xffff0009
_0813AD78: .4byte _0813AD7C
	.align 2, 0
_0813AD7C:
	.4byte _0813ADE0
	.4byte _0813ADD8
	.4byte _0813ADD0
	.4byte _0813ADC8
	.4byte _0813ADC0
	.4byte _0813ADB8
	.4byte _0813ADB0
	.4byte _0813ADA8
	.4byte _0813ADA0
_0813ADA0:
	ldr r1, _0813ADA4 @ =gMenuText_GoBackToPrev
	b _0813ADF0
	.align 2, 0
_0813ADA4: .4byte gMenuText_GoBackToPrev
_0813ADA8:
	ldr r1, _0813ADAC @ =gOtherText_HowManyToWithdraw
	b _0813ADF0
	.align 2, 0
_0813ADAC: .4byte gOtherText_HowManyToWithdraw
_0813ADB0:
	ldr r1, _0813ADB4 @ =gOtherText_WithdrewThing
	b _0813ADF0
	.align 2, 0
_0813ADB4: .4byte gOtherText_WithdrewThing
_0813ADB8:
	ldr r1, _0813ADBC @ =gOtherText_HowManyToToss
	b _0813ADF0
	.align 2, 0
_0813ADBC: .4byte gOtherText_HowManyToToss
_0813ADC0:
	ldr r1, _0813ADC4 @ =gOtherText_ThrewAwayItem
	b _0813ADF0
	.align 2, 0
_0813ADC4: .4byte gOtherText_ThrewAwayItem
_0813ADC8:
	ldr r1, _0813ADCC @ =gOtherText_NoMoreRoom
	b _0813ADF0
	.align 2, 0
_0813ADCC: .4byte gOtherText_NoMoreRoom
_0813ADD0:
	ldr r1, _0813ADD4 @ =gOtherText_TooImportant
	b _0813ADF0
	.align 2, 0
_0813ADD4: .4byte gOtherText_TooImportant
_0813ADD8:
	ldr r1, _0813ADDC @ =gOtherText_OkayToThrowAwayPrompt
	b _0813ADF0
	.align 2, 0
_0813ADDC: .4byte gOtherText_OkayToThrowAwayPrompt
_0813ADE0:
	ldr r1, _0813ADE4 @ =gOtherText_SwitchWhichItem
	b _0813ADF0
	.align 2, 0
_0813ADE4: .4byte gOtherText_SwitchWhichItem
_0813ADE8:
	adds r0, r1, 0
	bl ItemId_GetDescription
	adds r1, r0, 0
_0813ADF0:
	movs r0, 0x30
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	adds r0, r1, 0
	movs r1, 0x8
	movs r2, 0x68
	movs r3, 0x68
	bl sub_8072AB0
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_813AD58

	thumb_func_start sub_813AE0C
sub_813AE0C: @ 813AE0C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r2, _0813AE48 @ =gTasks + 0x8
	adds r4, r1, r2
	ldrh r1, [r4]
	ldrh r2, [r4, 0x2]
	adds r1, r2
	lsls r1, 16
	lsrs r5, r1, 16
	bl sub_813ABE8
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0813AE62
	lsls r0, r5, 16
	asrs r1, r0, 16
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _0813AE50
	ldr r0, _0813AE4C @ =0x0000ffff
	bl sub_813AD58
	b _0813AE62
	.align 2, 0
_0813AE48: .4byte gTasks + 0x8
_0813AE4C: .4byte 0x0000ffff
_0813AE50:
	ldr r0, _0813AE68 @ =gSaveBlock1
	lsls r1, 2
	adds r1, r0
	movs r0, 0x93
	lsls r0, 3
	adds r1, r0
	ldrh r0, [r1]
	bl sub_813AD58
_0813AE62:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813AE68: .4byte gSaveBlock1
	thumb_func_end sub_813AE0C

	thumb_func_start sub_813AE6C
sub_813AE6C: @ 813AE6C
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	adds r4, r1, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, r6, 2
	adds r5, r6
	lsls r5, 3
	ldr r0, _0813AEF8 @ =gTasks + 0x8
	adds r5, r0
	bl sub_80F944C
	bl LoadScrollIndicatorPalette
	bl sub_813AF04
	movs r0, 0xF
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	movs r0, 0
	movs r1, 0xC
	movs r2, 0xE
	movs r3, 0x13
	bl MenuDrawTextWindow
	movs r0, 0
	movs r1, 0
	movs r2, 0xB
	movs r3, 0x3
	bl MenuDrawTextWindow
	ldr r0, _0813AEFC @ =gSaveBlock1
	movs r1, 0x93
	lsls r1, 3
	adds r0, r1
	ldrh r0, [r0]
	bl sub_813AD58
	ldr r0, _0813AF00 @ =gUnknown_084062C0
	lsls r4, 3
	adds r4, r0
	ldr r0, [r4]
	movs r1, 0x1
	movs r2, 0x1
	bl MenuPrint
	adds r0, r6, 0
	bl sub_813ABE8
	ldrb r3, [r5, 0x8]
	ldrb r0, [r5]
	str r0, [sp]
	movs r0, 0xD
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x2
	bl InitMenu
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813AEF8: .4byte gTasks + 0x8
_0813AEFC: .4byte gSaveBlock1
_0813AF00: .4byte gUnknown_084062C0
	thumb_func_end sub_813AE6C

	thumb_func_start sub_813AF04
sub_813AF04: @ 813AF04
	push {lr}
	sub sp, 0x8
	ldr r1, _0813AF38 @ =gUnknown_08406334
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	add r0, sp, 0x4
	movs r1, 0xDF
	movs r2, 0x2
	bl LoadPalette
	mov r0, sp
	adds r0, 0x2
	movs r1, 0xD1
	movs r2, 0x2
	bl LoadPalette
	mov r0, sp
	movs r1, 0xD8
	movs r2, 0x2
	bl LoadPalette
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_0813AF38: .4byte gUnknown_08406334
	thumb_func_end sub_813AF04

	thumb_func_start sub_813AF3C
sub_813AF3C: @ 813AF3C
	push {r4,lr}
	movs r2, 0
	movs r1, 0x6
	ldr r4, _0813AF70 @ =gSaveBlock1
	ldr r3, _0813AF74 @ =0x00002b6c
_0813AF46:
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813AF5C
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_0813AF5C:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _0813AF46
	adds r0, r2, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0813AF70: .4byte gSaveBlock1
_0813AF74: .4byte 0x00002b6c
	thumb_func_end sub_813AF3C

	thumb_func_start sub_813AF78
sub_813AF78: @ 813AF78
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	movs r2, 0x6
_0813AF86:
	adds r1, r2, 0x1
	lsls r0, r1, 24
	lsrs r3, r0, 24
	mov r10, r1
	cmp r3, 0xF
	bhi _0813AFF4
	ldr r0, _0813B010 @ =gSaveBlock1
	mov r12, r0
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	add r0, r12
	ldr r1, _0813B014 @ =0x00002b6c
	adds r1, r0
	mov r8, r1
	ldr r2, _0813B018 @ =0x00002b4c
	mov r9, r2
	adds r4, r0, r2
_0813AFAA:
	mov r5, r8
	ldrh r0, [r5]
	cmp r0, 0
	bne _0813AFEA
	mov r1, sp
	adds r0, r4, 0
	ldm r0!, {r2,r6,r7}
	stm r1!, {r2,r6,r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r2,r5,r6}
	stm r1!, {r2,r5,r6}
	lsls r2, r3, 3
	adds r2, r3
	lsls r2, 2
	add r2, r12
	add r2, r9
	adds r1, r4, 0
	adds r0, r2, 0
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	mov r0, sp
	ldm r0!, {r1,r5,r7}
	stm r2!, {r1,r5,r7}
	ldm r0!, {r1,r6,r7}
	stm r2!, {r1,r6,r7}
	ldm r0!, {r5-r7}
	stm r2!, {r5-r7}
_0813AFEA:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xF
	bls _0813AFAA
_0813AFF4:
	mov r1, r10
	lsls r0, r1, 24
	lsrs r2, r0, 24
	cmp r2, 0xE
	bls _0813AF86
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813B010: .4byte gSaveBlock1
_0813B014: .4byte 0x00002b6c
_0813B018: .4byte 0x00002b4c
	thumb_func_end sub_813AF78

	thumb_func_start sub_813B01C
sub_813B01C: @ 813B01C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r7, 0
	ldr r1, _0813B0B8 @ =0x0201fe00
	ldrb r4, [r1, 0x2]
	ldrb r0, [r1, 0x1]
	adds r0, r4, r0
	cmp r4, r0
	bge _0813B08A
	adds r6, r1, 0
	ldr r0, _0813B0BC @ =gStringVar1
	mov r8, r0
_0813B036:
	ldrb r0, [r6, 0x2]
	subs r0, r4, r0
	lsls r0, 17
	lsrs r7, r0, 16
	adds r0, r7, 0x2
	lsls r0, 24
	lsrs r5, r0, 24
	adds r3, r7, 0x3
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x15
	adds r1, r5, 0
	movs r2, 0x1C
	bl MenuFillWindowRectWithBlankTile
	ldrb r0, [r6, 0x3]
	cmp r4, r0
	beq _0813B0C4
	lsls r1, r4, 3
	adds r1, r4
	lsls r1, 2
	ldr r0, _0813B0C0 @ =gSaveBlock1 + 0x2C36
	adds r1, r0
	mov r0, r8
	bl StringCopy
	mov r0, r8
	bl sub_814A568
	mov r0, r8
	movs r1, 0x15
	adds r2, r5, 0
	bl MenuPrint
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrb r0, [r6, 0x2]
	ldrb r1, [r6, 0x1]
	adds r0, r1
	cmp r4, r0
	blt _0813B036
_0813B08A:
	ldr r5, _0813B0B8 @ =0x0201fe00
	ldrb r0, [r5, 0x2]
	subs r0, r4, r0
	cmp r0, 0x8
	beq _0813B0A4
	adds r1, r7, 0x4
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x15
	movs r2, 0x1C
	movs r3, 0x12
	bl MenuFillWindowRectWithBlankTile
_0813B0A4:
	ldrb r0, [r5, 0x2]
	cmp r0, 0
	beq _0813B0D4
	movs r0, 0
	movs r1, 0xC8
	movs r2, 0x8
	bl CreateVerticalScrollIndicators
	b _0813B0DA
	.align 2, 0
_0813B0B8: .4byte 0x0201fe00
_0813B0BC: .4byte gStringVar1
_0813B0C0: .4byte gSaveBlock1 + 0x2C36
_0813B0C4:
	ldr r0, _0813B0D0 @ =gOtherText_CancelNoTerminator
	movs r1, 0x15
	adds r2, r5, 0
	bl MenuPrint
	b _0813B08A
	.align 2, 0
_0813B0D0: .4byte gOtherText_CancelNoTerminator
_0813B0D4:
	movs r0, 0
	bl DestroyVerticalScrollIndicator
_0813B0DA:
	ldr r0, _0813B0F4 @ =0x0201fe00
	ldrb r1, [r0, 0x2]
	ldrb r2, [r0, 0x1]
	adds r1, r2
	ldrb r0, [r0, 0x3]
	cmp r1, r0
	bgt _0813B0F8
	movs r0, 0x1
	movs r1, 0xC8
	movs r2, 0x98
	bl CreateVerticalScrollIndicators
	b _0813B0FE
	.align 2, 0
_0813B0F4: .4byte 0x0201fe00
_0813B0F8:
	movs r0, 0x1
	bl DestroyVerticalScrollIndicator
_0813B0FE:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_813B01C

	thumb_func_start sub_813B108
sub_813B108: @ 813B108
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80F944C
	bl LoadScrollIndicatorPalette
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0
	movs r2, 0x8
	movs r3, 0x3
	bl MenuDrawTextWindow
	ldr r0, _0813B16C @ =gPCText_Mailbox
	movs r1, 0x1
	movs r2, 0x1
	bl MenuPrint
	movs r0, 0x14
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	adds r0, r4, 0
	bl sub_813B01C
	ldr r0, _0813B170 @ =0x0201fe00
	ldrb r3, [r0, 0x1]
	ldrb r0, [r0]
	str r0, [sp]
	movs r0, 0x8
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x15
	movs r2, 0x2
	bl InitMenu
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B16C: .4byte gPCText_Mailbox
_0813B170: .4byte 0x0201fe00
	thumb_func_end sub_813B108

	thumb_func_start sub_813B174
sub_813B174: @ 813B174
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, r5, 0
	ldr r0, _0813B1AC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r3, 0x80
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _0813B274
	ldr r2, _0813B1B0 @ =gMain
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0813B1CA
	ldr r4, _0813B1B4 @ =0x0201fe00
	ldrb r0, [r4]
	cmp r0, 0
	beq _0813B1B8
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _0813B1E6
	.align 2, 0
_0813B1AC: .4byte gPaletteFade
_0813B1B0: .4byte gMain
_0813B1B4: .4byte 0x0201fe00
_0813B1B8:
	ldrb r0, [r4, 0x2]
	cmp r0, 0
	beq _0813B274
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4, 0x2]
	subs r0, 0x1
	b _0813B208
_0813B1CA:
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0813B212
	ldr r4, _0813B1F0 @ =0x0201fe00
	ldrb r1, [r4]
	ldrb r0, [r4, 0x1]
	subs r0, 0x1
	cmp r1, r0
	beq _0813B1F4
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_0813B1E6:
	bl MoveMenuCursor
	strb r0, [r4]
	b _0813B274
	.align 2, 0
_0813B1F0: .4byte 0x0201fe00
_0813B1F4:
	ldrb r0, [r4, 0x2]
	adds r0, r1
	ldrb r1, [r4, 0x3]
	cmp r0, r1
	beq _0813B274
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4, 0x2]
	adds r0, 0x1
_0813B208:
	strb r0, [r4, 0x2]
	adds r0, r5, 0
	bl sub_813B01C
	b _0813B274
_0813B212:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813B25C
	bl sub_8072DEC
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0813B23C @ =0x0201fe00
	ldrb r1, [r0, 0x2]
	ldrb r2, [r0]
	adds r1, r2
	ldrb r0, [r0, 0x3]
	cmp r1, r0
	bne _0813B240
	adds r0, r5, 0
	bl sub_813B320
	b _0813B274
	.align 2, 0
_0813B23C: .4byte 0x0201fe00
_0813B240:
	bl sub_813B27C
	ldr r0, _0813B254 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _0813B258 @ =sub_813B294
	str r0, [r1]
	b _0813B274
	.align 2, 0
_0813B254: .4byte gTasks
_0813B258: .4byte sub_813B294
_0813B25C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0813B274
	bl sub_8072DEC
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_813B320
_0813B274:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813B174

	thumb_func_start sub_813B27C
sub_813B27C: @ 813B27C
	push {lr}
	bl BuyMenuFreeMemory
	movs r0, 0
	bl DestroyVerticalScrollIndicator
	movs r0, 0x1
	bl DestroyVerticalScrollIndicator
	pop {r0}
	bx r0
	thumb_func_end sub_813B27C

	thumb_func_start sub_813B294
sub_813B294: @ 813B294
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r4, _0813B2E8 @ =gStringVar1
	ldr r1, _0813B2EC @ =0x0201fe00
	ldrb r0, [r1]
	adds r0, 0x6
	ldrb r1, [r1, 0x2]
	adds r0, r1
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _0813B2F0 @ =gSaveBlock1 + 0x2B5E
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
	adds r0, r4, 0
	bl sub_814A568
	ldr r4, _0813B2F4 @ =gStringVar4
	ldr r1, _0813B2F8 @ =gOtherText_WhatWillYouDoMail
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _0813B2FC @ =sub_813B348
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813B2E8: .4byte gStringVar1
_0813B2EC: .4byte 0x0201fe00
_0813B2F0: .4byte gSaveBlock1 + 0x2B5E
_0813B2F4: .4byte gStringVar4
_0813B2F8: .4byte gOtherText_WhatWillYouDoMail
_0813B2FC: .4byte sub_813B348
	thumb_func_end sub_813B294

	thumb_func_start sub_813B300
sub_813B300: @ 813B300
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl ReshowPlayerPC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813B300

	thumb_func_start sub_813B320
sub_813B320: @ 813B320
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_813B27C
	ldr r1, _0813B340 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813B344 @ =sub_813B300
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B340: .4byte gTasks
_0813B344: .4byte sub_813B300
	thumb_func_end sub_813B320

	thumb_func_start sub_813B348
sub_813B348: @ 813B348
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0xC
	movs r3, 0x9
	bl MenuDrawTextWindow
	ldr r3, _0813B394 @ =gUnknown_084062F8
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x4
	bl PrintMenuItems
	movs r0, 0
	str r0, [sp]
	movs r0, 0xB
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x4
	bl InitMenu
	ldr r1, _0813B398 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813B39C @ =sub_813B3A0
	str r1, [r0]
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B394: .4byte gUnknown_084062F8
_0813B398: .4byte gTasks
_0813B39C: .4byte sub_813B3A0
	thumb_func_end sub_813B348

	thumb_func_start sub_813B3A0
sub_813B3A0: @ 813B3A0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, r5, 0
	ldr r2, _0813B3C4 @ =gMain
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0813B3C8
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	b _0813B420
	.align 2, 0
_0813B3C4: .4byte gMain
_0813B3C8:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0813B3DE
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	b _0813B420
_0813B3DE:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813B40C
	movs r0, 0x5
	bl PlaySE
	ldr r4, _0813B408 @ =gUnknown_084062F8
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 21
	adds r4, 0x4
	adds r0, r4
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
	b _0813B420
	.align 2, 0
_0813B408: .4byte gUnknown_084062F8
_0813B40C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0813B420
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl Mailbox_Cancel
_0813B420:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813B3A0

	thumb_func_start Mailbox_Read
Mailbox_Read: @ 813B428
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r1, _0813B44C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813B450 @ =sub_813B454
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B44C: .4byte gTasks
_0813B450: .4byte sub_813B454
	thumb_func_end Mailbox_Read

	thumb_func_start sub_813B454
sub_813B454: @ 813B454
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0813B490 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0813B488
	ldr r0, _0813B494 @ =0x0201fe00
	ldrb r1, [r0]
	adds r1, 0x6
	ldrb r0, [r0, 0x2]
	adds r1, r0
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0813B498 @ =gSaveBlock1 + 0x2B4C
	adds r0, r1
	ldr r1, _0813B49C @ =sub_813B4F0
	movs r2, 0x1
	bl sub_80F890C
	adds r0, r4, 0
	bl DestroyTask
_0813B488:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B490: .4byte gPaletteFade
_0813B494: .4byte 0x0201fe00
_0813B498: .4byte gSaveBlock1 + 0x2B4C
_0813B49C: .4byte sub_813B4F0
	thumb_func_end sub_813B454

	thumb_func_start sub_813B4A0
sub_813B4A0: @ 813B4A0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813B4C0
	ldr r0, _0813B4C8 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0813B4CC @ =sub_813B174
	str r0, [r1]
_0813B4C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B4C8: .4byte gTasks
_0813B4CC: .4byte sub_813B174
	thumb_func_end sub_813B4A0

	thumb_func_start sub_813B4D0
sub_813B4D0: @ 813B4D0
	push {lr}
	ldr r0, _0813B4EC @ =sub_813B4A0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl sub_813B108
	bl pal_fill_black
	pop {r0}
	bx r0
	.align 2, 0
_0813B4EC: .4byte sub_813B4A0
	thumb_func_end sub_813B4D0

	thumb_func_start sub_813B4F0
sub_813B4F0: @ 813B4F0
	push {lr}
	ldr r0, _0813B504 @ =gUnknown_0300485C
	ldr r1, _0813B508 @ =sub_813B4D0
	str r1, [r0]
	ldr r0, _0813B50C @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0813B504: .4byte gUnknown_0300485C
_0813B508: .4byte sub_813B4D0
_0813B50C: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_813B4F0

	thumb_func_start Mailbox_MoveToBag
Mailbox_MoveToBag: @ 813B510
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	ldr r0, _0813B540 @ =gStringVar1
	ldr r1, _0813B544 @ =gOtherText_MoveToBag
	bl StringCopy
	ldr r0, _0813B548 @ =gUnknown_0840633A
	movs r1, 0x1
	movs r2, 0x3
	bl MenuPrint
	ldr r1, _0813B54C @ =gOtherText_MessageWillBeLost
	ldr r2, _0813B550 @ =sub_813B554
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B540: .4byte gStringVar1
_0813B544: .4byte gOtherText_MoveToBag
_0813B548: .4byte gUnknown_0840633A
_0813B54C: .4byte gOtherText_MessageWillBeLost
_0813B550: .4byte sub_813B554
	thumb_func_end Mailbox_MoveToBag

	thumb_func_start sub_813B554
sub_813B554: @ 813B554
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _0813B574 @ =gUnknown_084062E8
	adds r0, r4, 0
	bl sub_80F914C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B574: .4byte gUnknown_084062E8
	thumb_func_end sub_813B554

	thumb_func_start sub_813B578
sub_813B578: @ 813B578
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _0813B5BC @ =0x0201fe00
	ldrb r0, [r4]
	adds r0, 0x6
	ldrb r1, [r4, 0x2]
	adds r0, r1
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _0813B5C0 @ =gSaveBlock1 + 0x2B4C
	adds r6, r1, r0
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1A
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldrh r0, [r6, 0x20]
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	cmp r0, 0
	bne _0813B5CC
	ldr r1, _0813B5C4 @ =gOtherText_BagIsFull
	ldr r2, _0813B5C8 @ =sub_813B758
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	b _0813B602
	.align 2, 0
_0813B5BC: .4byte 0x0201fe00
_0813B5C0: .4byte gSaveBlock1 + 0x2B4C
_0813B5C4: .4byte gOtherText_BagIsFull
_0813B5C8: .4byte sub_813B758
_0813B5CC:
	ldr r1, _0813B608 @ =gOtherText_MailWasReturned
	ldr r2, _0813B60C @ =sub_813B758
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	adds r0, r6, 0
	bl sub_80A2B40
	bl sub_813AF78
	ldrb r0, [r4, 0x3]
	subs r0, 0x1
	strb r0, [r4, 0x3]
	ldrb r1, [r4, 0x3]
	ldrb r0, [r4, 0x1]
	ldrb r2, [r4, 0x2]
	adds r0, r2
	cmp r1, r0
	bge _0813B5FC
	cmp r2, 0
	beq _0813B5FC
	subs r0, r2, 0x1
	strb r0, [r4, 0x2]
_0813B5FC:
	adds r0, r5, 0
	bl sub_813A240
_0813B602:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813B608: .4byte gOtherText_MailWasReturned
_0813B60C: .4byte sub_813B758
	thumb_func_end sub_813B578

	thumb_func_start sub_813B610
sub_813B610: @ 813B610
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1A
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl sub_813B758
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813B610

	thumb_func_start Mailbox_Give
Mailbox_Give: @ 813B630
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl CalculatePlayerPartyCount
	lsls r0, 24
	cmp r0, 0
	bne _0813B648
	adds r0, r4, 0
	bl sub_813B718
	b _0813B65E
_0813B648:
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r0, _0813B664 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0813B668 @ =sub_813B66C
	str r0, [r1]
_0813B65E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B664: .4byte gTasks
_0813B668: .4byte sub_813B66C
	thumb_func_end Mailbox_Give

	thumb_func_start sub_813B66C
sub_813B66C: @ 813B66C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0813B698 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0813B690
	ldr r0, _0813B69C @ =sub_808B020
	bl SetMainCallback2
	ldr r1, _0813B6A0 @ =gUnknown_02038561
	movs r0, 0x3
	strb r0, [r1]
	adds r0, r4, 0
	bl DestroyTask
_0813B690:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B698: .4byte gPaletteFade
_0813B69C: .4byte sub_808B020
_0813B6A0: .4byte gUnknown_02038561
	thumb_func_end sub_813B66C

	thumb_func_start sub_813B6A4
sub_813B6A4: @ 813B6A4
	push {r4-r6,lr}
	ldr r0, _0813B6F0 @ =sub_813B4A0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _0813B6F4 @ =0x0201fe00
	ldrb r4, [r5, 0x3]
	bl sub_813AF3C
	strb r0, [r5, 0x3]
	bl sub_813AF78
	ldrb r0, [r5, 0x3]
	cmp r4, r0
	beq _0813B6DA
	ldrb r1, [r5, 0x3]
	ldrb r0, [r5, 0x1]
	ldrb r2, [r5, 0x2]
	adds r0, r2
	cmp r1, r0
	bge _0813B6DA
	cmp r2, 0
	beq _0813B6DA
	subs r0, r2, 0x1
	strb r0, [r5, 0x2]
_0813B6DA:
	adds r0, r6, 0
	bl sub_813A240
	adds r0, r6, 0
	bl sub_813B108
	bl pal_fill_black
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813B6F0: .4byte sub_813B4A0
_0813B6F4: .4byte 0x0201fe00
	thumb_func_end sub_813B6A4

	thumb_func_start sub_813B6F8
sub_813B6F8: @ 813B6F8
	push {lr}
	ldr r0, _0813B70C @ =gUnknown_0300485C
	ldr r1, _0813B710 @ =sub_813B6A4
	str r1, [r0]
	ldr r0, _0813B714 @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0813B70C: .4byte gUnknown_0300485C
_0813B710: .4byte sub_813B6A4
_0813B714: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_813B6F8

	thumb_func_start sub_813B718
sub_813B718: @ 813B718
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0813B72C @ =gOtherText_NoPokemon
	ldr r2, _0813B730 @ =sub_813B758
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r0}
	bx r0
	.align 2, 0
_0813B72C: .4byte gOtherText_NoPokemon
_0813B730: .4byte sub_813B758
	thumb_func_end sub_813B718

	thumb_func_start Mailbox_Cancel
Mailbox_Cancel: @ 813B734
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0xC
	movs r3, 0x9
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl sub_813B758
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Mailbox_Cancel

	thumb_func_start sub_813B758
sub_813B758: @ 813B758
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_813B108
	ldr r1, _0813B77C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813B780 @ =sub_813B174
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B77C: .4byte gTasks
_0813B780: .4byte sub_813B174
	thumb_func_end sub_813B758

	.align 2, 0 @ Don't pad with nop.
