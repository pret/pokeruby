	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

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
