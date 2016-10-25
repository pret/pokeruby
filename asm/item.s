	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start CopyItemName
CopyItemName: @ 80A9224
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _080A924C
	movs r0, 0x2B
	bl GetBerryInfo
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldr r1, _080A9248 @ =gOtherText_Berry2
	adds r0, r4, 0
	bl StringAppend
	b _080A9258
	.align 2, 0
_080A9248: .4byte gOtherText_Berry2
_080A924C:
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
_080A9258:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end CopyItemName

	thumb_func_start CountUsedBagPocketSlots
CountUsedBagPocketSlots: @ 80A9260
	push {lr}
	lsls r0, 24
	movs r2, 0
	ldr r1, _080A9284 @ =gBagPockets
	lsrs r0, 21
	adds r0, r1
	ldrb r1, [r0, 0x4]
	cmp r2, r1
	bcs _080A9292
	ldr r3, [r0]
_080A9274:
	lsls r0, r2, 2
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, 0
	bne _080A9288
	lsls r0, r2, 24
	asrs r0, 24
	b _080A9296
	.align 2, 0
_080A9284: .4byte gBagPockets
_080A9288:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r1
	bcc _080A9274
_080A9292:
	movs r0, 0x1
	negs r0, r0
_080A9296:
	pop {r1}
	bx r1
	thumb_func_end CountUsedBagPocketSlots

	thumb_func_start IsBagPocketNonEmpty
IsBagPocketNonEmpty: @ 80A929C
	push {lr}
	lsls r0, 24
	movs r2, 0
	ldr r1, _080A92C0 @ =gBagPockets
	lsrs r0, 21
	subs r0, 0x8
	adds r0, r1
	ldrb r1, [r0, 0x4]
	cmp r2, r1
	bcs _080A92CE
	ldr r3, [r0]
_080A92B2:
	lsls r0, r2, 2
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, 0
	beq _080A92C4
	movs r0, 0x1
	b _080A92D0
	.align 2, 0
_080A92C0: .4byte gBagPockets
_080A92C4:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r1
	bcc _080A92B2
_080A92CE:
	movs r0, 0
_080A92D0:
	pop {r1}
	bx r1
	thumb_func_end IsBagPocketNonEmpty

	thumb_func_start CheckBagHasItem
CheckBagHasItem: @ 80A92D4
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	adds r0, r5, 0
	bl ItemId_GetPocket
	lsls r0, 24
	cmp r0, 0
	bne _080A92F0
	b _080A9336
_080A92EC:
	movs r0, 0x1
	b _080A9338
_080A92F0:
	adds r0, r5, 0
	bl ItemId_GetPocket
	subs r0, 0x1
	lsls r0, 24
	movs r3, 0
	ldr r6, _080A9340 @ =gBagPockets
	lsrs r2, r0, 21
	adds r0, r2, r6
	ldrb r0, [r0, 0x4]
	cmp r3, r0
	bcs _080A9336
	adds r7, r6, 0
_080A930A:
	adds r0, r2, r7
	ldr r1, [r0]
	lsls r0, r3, 2
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, r5
	bne _080A9328
	ldrh r0, [r1, 0x2]
	cmp r0, r4
	bcs _080A92EC
	subs r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _080A92EC
_080A9328:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r2, r6
	ldrb r0, [r0, 0x4]
	cmp r3, r0
	bcc _080A930A
_080A9336:
	movs r0, 0
_080A9338:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A9340: .4byte gBagPockets
	thumb_func_end CheckBagHasItem

	thumb_func_start CheckBagHasSpace
CheckBagHasSpace: @ 80A9344
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	adds r0, r6, 0
	bl ItemId_GetPocket
	lsls r0, 24
	cmp r0, 0
	beq _080A9408
	adds r0, r6, 0
	bl ItemId_GetPocket
	subs r0, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r5, _080A940C @ =0x000003e7
	cmp r1, 0x3
	beq _080A9376
	movs r5, 0x63
_080A9376:
	movs r3, 0
	ldr r0, _080A9410 @ =gBagPockets
	mov r8, r0
	lsls r2, r1, 3
	adds r0, r2, r0
	mov r12, r8
	mov r9, r2
	ldrb r0, [r0, 0x4]
	cmp r3, r0
	bcs _080A93CA
	mov r10, r12
	subs r0, r1, 0x2
	lsls r0, 24
	lsrs r7, r0, 24
_080A9392:
	mov r1, r10
	adds r0, r2, r1
	ldr r1, [r0]
	lsls r0, r3, 2
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, r6
	bne _080A93BA
	ldrh r1, [r1, 0x2]
	adds r0, r1, r4
	cmp r0, r5
	ble _080A9414
	cmp r7, 0x1
	bls _080A9408
	subs r0, r5, r1
	subs r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _080A9414
_080A93BA:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	mov r1, r8
	adds r0, r2, r1
	ldrb r0, [r0, 0x4]
	cmp r3, r0
	bcc _080A9392
_080A93CA:
	cmp r4, 0
	beq _080A9414
	movs r3, 0
	mov r6, r12
	mov r2, r9
	adds r0, r2, r6
	ldrb r0, [r0, 0x4]
	cmp r3, r0
	bcs _080A9404
	adds r7, r6, 0
_080A93DE:
	adds r0, r2, r7
	ldr r1, [r0]
	lsls r0, r3, 2
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0
	bne _080A93F6
	cmp r4, r5
	bls _080A9414
	subs r0, r4, r5
	lsls r0, 16
	lsrs r4, r0, 16
_080A93F6:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r2, r6
	ldrb r0, [r0, 0x4]
	cmp r3, r0
	bcc _080A93DE
_080A9404:
	cmp r4, 0
	beq _080A9414
_080A9408:
	movs r0, 0
	b _080A9416
	.align 2, 0
_080A940C: .4byte 0x000003e7
_080A9410: .4byte gBagPockets
_080A9414:
	movs r0, 0x1
_080A9416:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckBagHasSpace

	thumb_func_start AddBagItem
AddBagItem: @ 80A9424
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x100
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r1, 16
	lsrs r4, r1, 16
	bl ItemId_GetPocket
	lsls r0, 24
	cmp r0, 0
	beq _080A9510
	mov r0, r8
	bl ItemId_GetPocket
	subs r0, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080A94F8 @ =gBagPockets
	lsls r0, r6, 3
	adds r5, r0, r1
	ldr r1, [r5]
	ldrb r2, [r5, 0x4]
	lsls r2, 2
	mov r0, sp
	bl memcpy
	ldr r7, _080A94FC @ =0x000003e7
	cmp r6, 0x3
	beq _080A9468
	movs r7, 0x63
_080A9468:
	movs r1, 0
	ldrb r0, [r5, 0x4]
	cmp r1, r0
	bcs _080A94B2
	subs r0, r6, 0x2
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
_080A9478:
	lsls r0, r1, 2
	mov r2, sp
	adds r3, r2, r0
	ldrh r0, [r3]
	cmp r0, r8
	bne _080A94A6
	ldrh r2, [r3, 0x2]
	adds r0, r2, r4
	cmp r0, r7
	ble _080A9500
	mov r0, r12
	cmp r0, 0x1
	bls _080A9510
	subs r0, r7, r2
	subs r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	strh r7, [r3, 0x2]
	ldr r2, _080A94F8 @ =gBagPockets
	mov r9, r2
	lsls r3, r6, 3
	cmp r4, 0
	beq _080A9516
_080A94A6:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	ldrb r0, [r5, 0x4]
	cmp r1, r0
	bcc _080A9478
_080A94B2:
	ldr r2, _080A94F8 @ =gBagPockets
	mov r9, r2
	lsls r3, r6, 3
	cmp r4, 0
	beq _080A9516
	movs r1, 0
	adds r0, r3, r2
	ldrb r0, [r0, 0x4]
	cmp r1, r0
	bcs _080A94F2
	mov r6, r9
	adds r5, r3, r6
_080A94CA:
	lsls r0, r1, 2
	mov r6, sp
	adds r2, r6, r0
	ldrh r0, [r2]
	cmp r0, 0
	bne _080A94E6
	mov r0, r8
	strh r0, [r2]
	cmp r4, r7
	bls _080A9514
	subs r0, r4, r7
	lsls r0, 16
	lsrs r4, r0, 16
	strh r7, [r2, 0x2]
_080A94E6:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	ldrb r2, [r5, 0x4]
	cmp r1, r2
	bcc _080A94CA
_080A94F2:
	cmp r4, 0
	beq _080A9516
	b _080A9510
	.align 2, 0
_080A94F8: .4byte gBagPockets
_080A94FC: .4byte 0x000003e7
_080A9500:
	strh r0, [r3, 0x2]
	ldr r0, _080A950C @ =gBagPockets
	lsls r1, r6, 3
	adds r1, r0
	b _080A951A
	.align 2, 0
_080A950C: .4byte gBagPockets
_080A9510:
	movs r0, 0
	b _080A9528
_080A9514:
	strh r4, [r2, 0x2]
_080A9516:
	mov r6, r9
	adds r1, r3, r6
_080A951A:
	ldr r0, [r1]
	ldrb r2, [r1, 0x4]
	lsls r2, 2
	mov r1, sp
	bl memcpy
	movs r0, 0x1
_080A9528:
	add sp, 0x100
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end AddBagItem

	thumb_func_start RemoveBagItem
RemoveBagItem: @ 80A9538
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	movs r7, 0
	adds r0, r6, 0
	bl ItemId_GetPocket
	lsls r0, 24
	cmp r0, 0
	beq _080A959E
	cmp r6, 0
	beq _080A959E
	adds r0, r6, 0
	bl ItemId_GetPocket
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	movs r5, 0
	ldr r1, _080A95A4 @ =gBagPockets
	lsls r2, r0, 3
	adds r0, r2, r1
	ldrb r0, [r0, 0x4]
	cmp r5, r0
	bcs _080A959A
	mov r8, r1
_080A9576:
	mov r0, r8
	adds r3, r2, r0
	ldr r0, [r3]
	lsls r1, r5, 2
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, r6
	bne _080A958E
	ldrh r0, [r1, 0x2]
	adds r0, r7, r0
	lsls r0, 16
	lsrs r7, r0, 16
_080A958E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r3, [r3, 0x4]
	cmp r5, r3
	bcc _080A9576
_080A959A:
	cmp r7, r4
	bcs _080A95A8
_080A959E:
	movs r0, 0
	b _080A9664
	.align 2, 0
_080A95A4: .4byte gBagPockets
_080A95A8:
	ldr r0, _080A95DC @ =gBagPockets
	mov r2, r12
	lsls r1, r2, 3
	adds r5, r1, r0
	ldr r2, _080A95E0 @ =gUnknown_02038560
	ldrb r3, [r5, 0x4]
	mov r8, r0
	adds r7, r1, 0
	ldrb r0, [r2]
	cmp r3, r0
	bls _080A9606
	ldrb r0, [r2]
	ldr r1, [r5]
	lsls r0, 2
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, r6
	bne _080A9606
	ldrh r0, [r1, 0x2]
	cmp r0, r4
	bcc _080A95E4
	subs r0, r4
	strh r0, [r1, 0x2]
	movs r4, 0
	b _080A95EE
	.align 2, 0
_080A95DC: .4byte gBagPockets
_080A95E0: .4byte gUnknown_02038560
_080A95E4:
	subs r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0
	strh r0, [r1, 0x2]
_080A95EE:
	mov r1, r8
	adds r0, r7, r1
	ldrb r1, [r2]
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _080A9602
	strh r0, [r1]
_080A9602:
	cmp r4, 0
	beq _080A9662
_080A9606:
	movs r5, 0
	adds r1, r7, 0
	mov r2, r8
	adds r0, r1, r2
	ldrb r2, [r0, 0x4]
	cmp r5, r2
	bcs _080A9662
	mov r12, r8
	adds r3, r0, 0
_080A9618:
	mov r2, r12
	adds r0, r1, r2
	ldr r0, [r0]
	lsls r1, r5, 2
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, r6
	bne _080A9650
	ldrh r0, [r2, 0x2]
	cmp r0, r4
	bcc _080A9636
	subs r0, r4
	strh r0, [r2, 0x2]
	movs r4, 0
	b _080A9640
_080A9636:
	subs r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0
	strh r0, [r2, 0x2]
_080A9640:
	ldr r0, [r3]
	adds r1, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _080A964C
	strh r0, [r1]
_080A964C:
	cmp r4, 0
	beq _080A9662
_080A9650:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r1, r7, 0
	mov r2, r8
	adds r0, r1, r2
	ldrb r0, [r0, 0x4]
	cmp r5, r0
	bcc _080A9618
_080A9662:
	movs r0, 0x1
_080A9664:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end RemoveBagItem

	thumb_func_start GetPocketByItemId
GetPocketByItemId: @ 80A9670
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl ItemId_GetPocket
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end GetPocketByItemId

	thumb_func_start ClearItemSlots
ClearItemSlots: @ 80A9684
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 24
	movs r2, 0
	lsrs r1, 24
	cmp r2, r1
	bcs _080A96A6
	movs r3, 0
_080A9694:
	lsls r0, r2, 2
	adds r0, r4
	strh r3, [r0]
	strh r3, [r0, 0x2]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r1
	bcc _080A9694
_080A96A6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ClearItemSlots

	thumb_func_start FindFreePCItemSlot
FindFreePCItemSlot: @ 80A96AC
	push {lr}
	movs r1, 0
	ldr r3, _080A96CC @ =gSaveBlock1
	movs r2, 0x93
	lsls r2, 3
_080A96B6:
	lsls r0, r1, 24
	asrs r1, r0, 24
	lsls r0, r1, 2
	adds r0, r3
	adds r0, r2
	ldrh r0, [r0]
	cmp r0, 0
	bne _080A96D0
	adds r0, r1, 0
	b _080A96E0
	.align 2, 0
_080A96CC: .4byte gSaveBlock1
_080A96D0:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	asrs r0, 24
	cmp r0, 0x31
	ble _080A96B6
	movs r0, 0x1
	negs r0, r0
_080A96E0:
	pop {r1}
	bx r1
	thumb_func_end FindFreePCItemSlot

	thumb_func_start CountUsedPCItemSlots
CountUsedPCItemSlots: @ 80A96E4
	push {r4,lr}
	movs r2, 0
	movs r1, 0
	ldr r4, _080A9714 @ =gSaveBlock1
	movs r3, 0x93
	lsls r3, 3
_080A96F0:
	lsls r0, r1, 2
	adds r0, r4
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, 0
	beq _080A9702
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_080A9702:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x31
	bls _080A96F0
	adds r0, r2, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9714: .4byte gSaveBlock1
	thumb_func_end CountUsedPCItemSlots

	thumb_func_start CheckPCHasItem
CheckPCHasItem: @ 80A9718
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r1, 16
	movs r3, 0
	ldr r7, _080A9744 @ =gSaveBlock1
	movs r6, 0x93
	lsls r6, 3
	ldr r5, _080A9748 @ =0x0000049a
_080A972C:
	lsls r0, r3, 2
	adds r2, r0, r7
	adds r0, r2, r6
	ldrh r0, [r0]
	cmp r0, r4
	bne _080A974C
	adds r0, r2, r5
	ldrh r0, [r0]
	cmp r0, r1
	bcc _080A974C
	movs r0, 0x1
	b _080A9758
	.align 2, 0
_080A9744: .4byte gSaveBlock1
_080A9748: .4byte 0x0000049a
_080A974C:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x31
	bls _080A972C
	movs r0, 0
_080A9758:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckPCHasItem

	thumb_func_start AddPCItem
AddPCItem: @ 80A9760
	push {r4-r7,lr}
	sub sp, 0xC8
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	ldr r1, _080A97C4 @ =gSaveBlock1 + 0x498
	mov r0, sp
	movs r2, 0xC8
	bl memcpy
	movs r5, 0
	ldr r0, _080A97C8 @ =0x0000fc19
	adds r7, r0, 0
_080A977C:
	lsls r0, r5, 2
	mov r1, sp
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, r6
	bne _080A97A0
	ldrh r1, [r2, 0x2]
	adds r0, r1, r4
	ldr r3, _080A97CC @ =0x000003e7
	cmp r0, r3
	ble _080A97D0
	adds r0, r4, r7
	adds r0, r1, r0
	lsls r0, 16
	lsrs r4, r0, 16
	strh r3, [r2, 0x2]
	cmp r4, 0
	beq _080A97DC
_080A97A0:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x31
	bls _080A977C
	cmp r4, 0
	beq _080A97DC
	bl FindFreePCItemSlot
	lsls r0, 24
	asrs r1, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _080A97D4
	movs r0, 0
	b _080A97E8
	.align 2, 0
_080A97C4: .4byte gSaveBlock1 + 0x498
_080A97C8: .4byte 0x0000fc19
_080A97CC: .4byte 0x000003e7
_080A97D0:
	strh r0, [r2, 0x2]
	b _080A97DC
_080A97D4:
	lsls r0, r1, 2
	add r0, sp
	strh r6, [r0]
	strh r4, [r0, 0x2]
_080A97DC:
	ldr r0, _080A97F0 @ =gSaveBlock1 + 0x498
	mov r1, sp
	movs r2, 0xC8
	bl memcpy
	movs r0, 0x1
_080A97E8:
	add sp, 0xC8
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A97F0: .4byte gSaveBlock1 + 0x498
	thumb_func_end AddPCItem

	thumb_func_start RemovePCItem
RemovePCItem: @ 80A97F4
	push {lr}
	lsls r0, 24
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _080A9824 @ =gSaveBlock1
	lsrs r0, 22
	adds r3, r0, r2
	ldr r0, _080A9828 @ =0x0000049a
	adds r2, r3, r0
	ldrh r0, [r2]
	subs r0, r1
	strh r0, [r2]
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _080A9820
	movs r2, 0x93
	lsls r2, 3
	adds r0, r3, r2
	strh r1, [r0]
	bl CompactPCItems
_080A9820:
	pop {r0}
	bx r0
	.align 2, 0
_080A9824: .4byte gSaveBlock1
_080A9828: .4byte 0x0000049a
	thumb_func_end RemovePCItem

	thumb_func_start CompactPCItems
CompactPCItems: @ 80A982C
	push {r4-r7,lr}
	movs r2, 0
	ldr r0, _080A987C @ =gSaveBlock1
	mov r12, r0
_080A9834:
	adds r1, r2, 0x1
	lsls r0, r1, 16
	lsrs r3, r0, 16
	adds r7, r1, 0
	cmp r3, 0x31
	bhi _080A986C
	lsls r1, r2, 2
	mov r2, r12
	adds r0, r1, r2
	movs r2, 0x93
	lsls r2, 3
	adds r5, r0, r2
	ldr r6, _080A9880 @ =gSaveBlock1 + 0x498
	adds r4, r1, r6
_080A9850:
	ldrh r0, [r5]
	cmp r0, 0
	bne _080A9862
	ldr r2, [r4]
	lsls r1, r3, 2
	adds r1, r6
	ldr r0, [r1]
	str r0, [r4]
	str r2, [r1]
_080A9862:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x31
	bls _080A9850
_080A986C:
	lsls r0, r7, 16
	lsrs r2, r0, 16
	cmp r2, 0x30
	bls _080A9834
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A987C: .4byte gSaveBlock1
_080A9880: .4byte gSaveBlock1 + 0x498
	thumb_func_end CompactPCItems

	thumb_func_start SwapRegisteredBike
SwapRegisteredBike: @ 80A9884
	push {lr}
	ldr r0, _080A98A0 @ =gSaveBlock1
	ldr r1, _080A98A4 @ =0x00000496
	adds r2, r0, r1
	ldrh r1, [r2]
	ldr r3, _080A98A8 @ =0x00000103
	cmp r1, r3
	beq _080A98AC
	movs r0, 0x88
	lsls r0, 1
	cmp r1, r0
	beq _080A98B4
	b _080A98B6
	.align 2, 0
_080A98A0: .4byte gSaveBlock1
_080A98A4: .4byte 0x00000496
_080A98A8: .4byte 0x00000103
_080A98AC:
	movs r0, 0x88
	lsls r0, 1
	strh r0, [r2]
	b _080A98B6
_080A98B4:
	strh r3, [r2]
_080A98B6:
	pop {r0}
	bx r0
	thumb_func_end SwapRegisteredBike

	thumb_func_start SanitizeItemId
SanitizeItemId: @ 80A98BC
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	movs r0, 0xAE
	lsls r0, 1
	cmp r1, r0
	bhi _080A98CE
	adds r0, r1, 0
	b _080A98D0
_080A98CE:
	movs r0, 0
_080A98D0:
	pop {r1}
	bx r1
	thumb_func_end SanitizeItemId

	thumb_func_start ItemId_GetItem
ItemId_GetItem: @ 80A98D4
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	ldr r1, _080A98F0 @ =gItems
	adds r0, r1
	pop {r1}
	bx r1
	.align 2, 0
_080A98F0: .4byte gItems
	thumb_func_end ItemId_GetItem

	thumb_func_start ItemId_GetId
ItemId_GetId: @ 80A98F4
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080A9914 @ =gItems
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	ldrh r0, [r0, 0xE]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9914: .4byte gItems
	thumb_func_end ItemId_GetId

	thumb_func_start ItemId_GetPrice
ItemId_GetPrice: @ 80A9918
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080A9938 @ =gItems
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	ldrh r0, [r0, 0x10]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9938: .4byte gItems
	thumb_func_end ItemId_GetPrice

	thumb_func_start ItemId_GetHoldEffect
ItemId_GetHoldEffect: @ 80A993C
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080A995C @ =gItems
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	ldrb r0, [r0, 0x12]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A995C: .4byte gItems
	thumb_func_end ItemId_GetHoldEffect

	thumb_func_start ItemId_GetHoldEffectParam
ItemId_GetHoldEffectParam: @ 80A9960
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080A9980 @ =gItems
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	ldrb r0, [r0, 0x13]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9980: .4byte gItems
	thumb_func_end ItemId_GetHoldEffectParam

	thumb_func_start ItemId_GetDescription
ItemId_GetDescription: @ 80A9984
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080A99A4 @ =gItems
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r4, 0x14
	adds r0, r4
	ldr r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A99A4: .4byte gItems
	thumb_func_end ItemId_GetDescription

	thumb_func_start ItemId_CopyDescription
ItemId_CopyDescription: @ 80A99A8
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r0, r1, 0
	adds r5, r2, 0x1
	ldr r4, _080A99E4 @ =gItems
	lsls r0, 16
	lsrs r0, 16
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r4, 0x14
	adds r0, r4
	ldr r3, [r0]
	adds r2, r6, 0
_080A99CA:
	ldrb r1, [r3]
	adds r0, r1, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080A99FA
	subs r5, 0x1
	cmp r5, 0
	bne _080A99E8
	movs r0, 0xFF
	strb r0, [r2]
	movs r0, 0x1
	b _080A9A02
	.align 2, 0
_080A99E4: .4byte gItems
_080A99E8:
	lsls r0, r1, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080A99F4
	movs r0, 0
	b _080A9A02
_080A99F4:
	adds r2, r6, 0
	adds r3, 0x1
	b _080A99CA
_080A99FA:
	strb r1, [r2]
	adds r3, 0x1
	adds r2, 0x1
	b _080A99CA
_080A9A02:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ItemId_CopyDescription

	thumb_func_start ItemId_GetImportance
ItemId_GetImportance: @ 80A9A08
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080A9A28 @ =gItems
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	ldrb r0, [r0, 0x18]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9A28: .4byte gItems
	thumb_func_end ItemId_GetImportance

	thumb_func_start ItemId_GetUnknownValue
ItemId_GetUnknownValue: @ 80A9A2C
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080A9A4C @ =gItems
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	ldrb r0, [r0, 0x19]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9A4C: .4byte gItems
	thumb_func_end ItemId_GetUnknownValue

	thumb_func_start ItemId_GetPocket
ItemId_GetPocket: @ 80A9A50
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080A9A70 @ =gItems
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	ldrb r0, [r0, 0x1A]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9A70: .4byte gItems
	thumb_func_end ItemId_GetPocket

	thumb_func_start ItemId_GetType
ItemId_GetType: @ 80A9A74
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080A9A94 @ =gItems
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	ldrb r0, [r0, 0x1B]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9A94: .4byte gItems
	thumb_func_end ItemId_GetType

	thumb_func_start ItemId_GetFieldFunc
ItemId_GetFieldFunc: @ 80A9A98
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080A9AB8 @ =gItems
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r4, 0x1C
	adds r0, r4
	ldr r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9AB8: .4byte gItems
	thumb_func_end ItemId_GetFieldFunc

	thumb_func_start ItemId_GetBattleUsage
ItemId_GetBattleUsage: @ 80A9ABC
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080A9ADC @ =gItems
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	adds r0, 0x20
	ldrb r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9ADC: .4byte gItems
	thumb_func_end ItemId_GetBattleUsage

	thumb_func_start ItemId_GetBattleFunc
ItemId_GetBattleFunc: @ 80A9AE0
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080A9B00 @ =gItems
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r4, 0x24
	adds r0, r4
	ldr r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9B00: .4byte gItems
	thumb_func_end ItemId_GetBattleFunc

	thumb_func_start ItemId_GetSecondaryId
ItemId_GetSecondaryId: @ 80A9B04
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080A9B24 @ =gItems
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	adds r0, 0x28
	ldrb r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9B24: .4byte gItems
	thumb_func_end ItemId_GetSecondaryId

	.align 2, 0 @ Don't pad with nop.
