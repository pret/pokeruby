	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

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
	ldr r4, _080B413C @ =gMartInfo
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
_080B413C: .4byte gMartInfo
_080B4140:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _080B41A0
_080B414C:
	cmp r1, 0x80
	bne _080B41AC
	ldr r4, _080B418C @ =gMartInfo
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
_080B418C: .4byte gMartInfo
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
	ldr r6, _080B426C @ =gMartInfo
	ldrb r0, [r6, 0xB]
	ldrb r1, [r6, 0x9]
	adds r0, r1
	ldrb r1, [r6, 0x8]
	cmp r0, r1
	bne _080B41CE
	b _080B4350
_080B41CE:
	movs r0, 0
	bl PauseVerticalScrollIndicator
	movs r0, 0x1
	bl PauseVerticalScrollIndicator
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80F979C
	ldrb r1, [r6, 0x9]
	adds r0, r1, 0
	movs r2, 0x1
	bl sub_80B39D0
	bl HandleDestroyMenuCursors
	movs r0, 0
	movs r1, 0xC
	movs r2, 0xD
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldrb r0, [r6, 0xC]
	cmp r0, 0
	bne _080B428C
	ldr r5, _080B4270 @ =gMartTotalCost
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
_080B426C: .4byte gMartInfo
_080B4270: .4byte gMartTotalCost
_080B4274: .4byte gSaveBlock1
_080B4278: .4byte gStringVar1
_080B427C: .4byte gStringVar4
_080B4280: .4byte gOtherText_HowManyYouWant
_080B4284: .4byte sub_80B3EFC
_080B4288: .4byte 0x0000c3e1
_080B428C:
	ldr r5, _080B42C8 @ =gMartTotalCost
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
_080B42C8: .4byte gMartTotalCost
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
	ldr r0, _080B43E4 @ =gBGTilemapBuffers + 0x800
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
	bl StartVerticalScrollIndicators
	movs r0, 0x1
	bl StartVerticalScrollIndicators
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
_080B43E4: .4byte gBGTilemapBuffers + 0x800
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
	ldr r1, _080B4428 @ =gFieldCallback
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
_080B4428: .4byte gFieldCallback
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
	ldr r6, _080B44CC @ =gMartInfo
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
_080B44CC: .4byte gMartInfo
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
