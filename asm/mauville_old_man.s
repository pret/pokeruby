	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80F85FC
sub_80F85FC: @ 80F85FC
	push {r4-r7,lr}
	adds r7, r0, 0
	adds r6, r1, 0
	movs r5, 0
	cmp r5, r6
	bge _080F8612
_080F8608:
	adds r0, r7, r5
	strb r5, [r0]
	adds r5, 0x1
	cmp r5, r6
	blt _080F8608
_080F8612:
	cmp r6, 0
	ble _080F8648
	adds r5, r6, 0
_080F8618:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r6, 0
	bl __modsi3
	adds r4, r0, 0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r6, 0
	bl __modsi3
	adds r4, r7, r4
	ldrb r2, [r4]
	adds r0, r7, r0
	ldrb r1, [r0]
	strb r1, [r4]
	strb r2, [r0]
	subs r5, 0x1
	cmp r5, 0
	bne _080F8618
_080F8648:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80F85FC

	thumb_func_start sub_80F8650
sub_80F8650: @ 80F8650
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r7, sp
	mov r10, sp
	ldr r0, _080F86D4 @ =gUnknown_083E5620
	ldr r0, [r0]
	lsls r0, 3
	lsrs r0, 3
	adds r0, 0x3
	lsrs r0, 2
	lsls r0, 2
	mov r1, sp
	subs r1, r0
	mov sp, r1
	mov r8, sp
	mov r0, sp
	movs r1, 0x24
	bl sub_80F85FC
	movs r5, 0
	ldr r0, _080F86D8 @ =gUnknown_083E53E0
	mov r9, r0
	ldr r3, _080F86DC @ =gSaveBlock1 + 0x2D94
_080F8686:
	mov r1, r8
	adds r0, r1, r5
	ldrb r0, [r0]
	lsls r0, 4
	add r0, r9
	ldrb r4, [r0]
	ldrb r6, [r0, 0x1]
	movs r1, 0
	ldrb r0, [r3, 0x4]
	cmp r0, r4
	beq _080F86AC
	ldr r2, _080F86E0 @ =gSaveBlock1 + 0x2D98
_080F869E:
	adds r1, 0x1
	cmp r1, 0x3
	bgt _080F86AC
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, r4
	bne _080F869E
_080F86AC:
	cmp r1, 0x4
	bne _080F86E4
	adds r0, r4, 0
	str r3, [r7]
	bl sub_80F8438
	ldr r3, [r7]
	cmp r0, r6
	bcc _080F86E4
	movs r0, 0x1
	strb r0, [r3, 0x1]
	bl sub_80F849C
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	bl sub_80F8598
	movs r0, 0x1
	b _080F86EC
	.align 2, 0
_080F86D4: .4byte gUnknown_083E5620
_080F86D8: .4byte gUnknown_083E53E0
_080F86DC: .4byte gSaveBlock1 + 0x2D94
_080F86E0: .4byte gSaveBlock1 + 0x2D98
_080F86E4:
	adds r5, 0x1
	cmp r5, 0x23
	ble _080F8686
	movs r0, 0
_080F86EC:
	mov sp, r10
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80F8650

	thumb_func_start sub_80F8700
sub_80F8700: @ 80F8700
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _080F8748 @ =gSaveBlock1 + 0x2D94
	adds r0, 0x4
	adds r0, r5, r0
	ldrb r6, [r0]
	ldr r4, _080F874C @ =gStringVar1
	adds r0, r5, 0
	bl sub_80F84C8
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0xA
	bl ConvertIntToDecimalStringN
	ldr r4, _080F8750 @ =gStringVar2
	adds r0, r6, 0
	bl sub_80F8490
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldr r1, _080F8754 @ =gStringVar3
	adds r0, r5, 0
	bl sub_80F8534
	adds r0, r6, 0
	bl sub_80F8484
	bl ShowFieldMessage
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F8748: .4byte gSaveBlock1 + 0x2D94
_080F874C: .4byte gStringVar1
_080F8750: .4byte gStringVar2
_080F8754: .4byte gStringVar3
	thumb_func_end sub_80F8700

	thumb_func_start sub_80F8758
sub_80F8758: @ 80F8758
	push {r4-r6,lr}
	bl sub_80F849C
	adds r3, r0, 0
	lsls r3, 25
	movs r0, 0x80
	lsls r0, 19
	adds r3, r0
	lsrs r3, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0x19
	bl MenuDrawTextWindow
	movs r4, 0
	ldr r1, _080F87BC @ =gSaveBlock1 + 0x2D94
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _080F87A4
	adds r6, r1, 0x4
	movs r5, 0x80
	lsls r5, 18
_080F8784:
	bl sub_80F8478
	lsrs r2, r5, 24
	movs r1, 0x1
	bl MenuPrint
	movs r1, 0x80
	lsls r1, 18
	adds r5, r1
	adds r4, 0x1
	cmp r4, 0x3
	bgt _080F87A4
	adds r0, r4, r6
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F8784
_080F87A4:
	ldr r0, _080F87C0 @ =gPCText_Cancel
	lsls r2, r4, 25
	movs r1, 0x80
	lsls r1, 18
	adds r2, r1
	lsrs r2, 24
	movs r1, 0x1
	bl MenuPrint
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F87BC: .4byte gSaveBlock1 + 0x2D94
_080F87C0: .4byte gPCText_Cancel
	thumb_func_end sub_80F8758

	thumb_func_start sub_80F87C4
sub_80F87C4: @ 80F87C4
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080F87E4 @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r5, [r4, r0]
	cmp r5, 0
	beq _080F87E8
	cmp r5, 0x1
	beq _080F8810
	b _080F8862
	.align 2, 0
_080F87E4: .4byte gTasks
_080F87E8:
	bl sub_80F8758
	bl sub_80F849C
	adds r3, r0, 0
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	str r5, [sp]
	movs r0, 0x18
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x2
	bl InitMenu
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080F8862
_080F8810:
	bl ProcessMenuInput
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r4, r0
	beq _080F8862
	adds r0, 0x1
	cmp r4, r0
	beq _080F8832
	bl sub_80F849C
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _080F8840
_080F8832:
	ldr r1, _080F883C @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	b _080F8848
	.align 2, 0
_080F883C: .4byte gScriptResult
_080F8840:
	ldr r0, _080F886C @ =gScriptResult
	strh r5, [r0]
	ldr r0, _080F8870 @ =gUnknown_03000748
	strb r4, [r0]
_080F8848:
	bl HandleDestroyMenuCursors
	movs r0, 0
	movs r1, 0
	movs r2, 0x19
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	adds r0, r6, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_080F8862:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F886C: .4byte gScriptResult
_080F8870: .4byte gUnknown_03000748
	thumb_func_end sub_80F87C4

	thumb_func_start sub_80F8874
sub_80F8874: @ 80F8874
	push {lr}
	ldr r0, _080F8884 @ =sub_80F87C4
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080F8884: .4byte sub_80F87C4
	thumb_func_end sub_80F8874

	thumb_func_start sub_80F8888
sub_80F8888: @ 80F8888
	push {lr}
	ldr r0, _080F8898 @ =gUnknown_03000748
	ldrb r0, [r0]
	bl sub_80F8700
	pop {r0}
	bx r0
	.align 2, 0
_080F8898: .4byte gUnknown_03000748
	thumb_func_end sub_80F8888

	thumb_func_start sub_80F889C
sub_80F889C: @ 80F889C
	push {lr}
	bl sub_80F849C
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80F889C

	thumb_func_start sub_80F88AC
sub_80F88AC: @ 80F88AC
	push {r4,r5,lr}
	ldr r1, _080F88C8 @ =gSaveBlock1 + 0x2D94
	ldr r5, _080F88CC @ =gUnknown_03000748
	ldrb r0, [r5]
	adds r1, 0x4
	adds r1, r0, r1
	ldrb r4, [r1]
	bl sub_80F8508
	cmp r0, 0x1
	beq _080F88D0
	movs r0, 0
	b _080F88DA
	.align 2, 0
_080F88C8: .4byte gSaveBlock1 + 0x2D94
_080F88CC: .4byte gUnknown_03000748
_080F88D0:
	ldrb r0, [r5]
	adds r1, r4, 0
	bl sub_80F8598
	movs r0, 0x1
_080F88DA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80F88AC

	thumb_func_start sub_80F88E0
sub_80F88E0: @ 80F88E0
	push {lr}
	ldr r0, _080F88F0 @ =gSaveBlock1 + 0x2D94
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _080F88F4
	movs r0, 0x1
	b _080F88F6
	.align 2, 0
_080F88F0: .4byte gSaveBlock1 + 0x2D94
_080F88F4:
	movs r0, 0
_080F88F6:
	pop {r1}
	bx r1
	thumb_func_end sub_80F88E0

	thumb_func_start sub_80F88FC
sub_80F88FC: @ 80F88FC
	push {lr}
	bl sub_80F8650
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80F88FC

	.align 2, 0 @ Don't pad with nop.
