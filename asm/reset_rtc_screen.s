	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start SpriteCB_ResetRtcCusor0
SpriteCB_ResetRtcCusor0: @ 806A480
	push {lr}
	adds r3, r0, 0
	ldr r2, _0806A4B0 @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0xC
	ldrsh r1, [r0, r2]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r1, r0
	beq _0806A596
	strh r1, [r3, 0x30]
	subs r0, r1, 0x1
	cmp r0, 0x5
	bhi _0806A596
	lsls r0, 2
	ldr r1, _0806A4B4 @ =_0806A4B8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806A4B0: .4byte gTasks
_0806A4B4: .4byte _0806A4B8
	.align 2, 0
_0806A4B8:
	.4byte _0806A4D0
	.4byte _0806A4F4
	.4byte _0806A518
	.4byte _0806A53C
	.4byte _0806A566
	.4byte _0806A590
_0806A4D0:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0x1
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x41
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x35
	b _0806A55E
_0806A4F4:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0x1
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x41
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x56
	b _0806A55E
_0806A518:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0x1
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x41
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x6B
	b _0806A55E
_0806A53C:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0x1
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x41
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x80
_0806A55E:
	strh r0, [r3, 0x20]
	movs r0, 0x44
	strh r0, [r3, 0x22]
	b _0806A596
_0806A566:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0x2
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x42
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x9B
	strh r0, [r3, 0x20]
	movs r0, 0x50
	strh r0, [r3, 0x22]
	b _0806A596
_0806A590:
	adds r0, r3, 0
	bl DestroySprite
_0806A596:
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_ResetRtcCusor0

	thumb_func_start SpriteCB_ResetRtcCusor1
SpriteCB_ResetRtcCusor1: @ 806A59C
	push {lr}
	adds r3, r0, 0
	ldr r2, _0806A5CC @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0xC
	ldrsh r1, [r0, r2]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r1, r0
	beq _0806A696
	strh r1, [r3, 0x30]
	subs r0, r1, 0x1
	cmp r0, 0x5
	bhi _0806A696
	lsls r0, 2
	ldr r1, _0806A5D0 @ =_0806A5D4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806A5CC: .4byte gTasks
_0806A5D0: .4byte _0806A5D4
	.align 2, 0
_0806A5D4:
	.4byte _0806A5EC
	.4byte _0806A610
	.4byte _0806A634
	.4byte _0806A658
	.4byte _0806A682
	.4byte _0806A690
_0806A5EC:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x40
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x35
	b _0806A67A
_0806A610:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x40
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x56
	b _0806A67A
_0806A634:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x40
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x6B
	b _0806A67A
_0806A658:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x40
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x80
_0806A67A:
	strh r0, [r3, 0x20]
	movs r0, 0x5C
	strh r0, [r3, 0x22]
	b _0806A696
_0806A682:
	adds r0, r3, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0806A696
_0806A690:
	adds r0, r3, 0
	bl DestroySprite
_0806A696:
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_ResetRtcCusor1

	thumb_func_start ResetRtcScreen_CreateCursor
ResetRtcScreen_CreateCursor: @ 806A69C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _0806A70C @ =gUnknown_083764BC
	bl LoadSpritePalette
	ldr r0, _0806A710 @ =gSpriteTemplate_83764E8
	mov r8, r0
	movs r1, 0x35
	movs r2, 0x44
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r6, _0806A714 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r6, 0
	adds r4, 0x1C
	adds r2, r0, r4
	ldr r1, _0806A718 @ =SpriteCB_ResetRtcCusor0
	str r1, [r2]
	adds r0, r6
	strh r5, [r0, 0x2E]
	ldr r1, _0806A71C @ =0x0000ffff
	strh r1, [r0, 0x30]
	mov r0, r8
	movs r1, 0x35
	movs r2, 0x44
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r4
	ldr r1, _0806A720 @ =SpriteCB_ResetRtcCusor1
	str r1, [r4]
	adds r0, r6
	strh r5, [r0, 0x2E]
	movs r1, 0x1
	negs r1, r1
	strh r1, [r0, 0x30]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A70C: .4byte gUnknown_083764BC
_0806A710: .4byte gSpriteTemplate_83764E8
_0806A714: .4byte gSprites
_0806A718: .4byte SpriteCB_ResetRtcCusor0
_0806A71C: .4byte 0x0000ffff
_0806A720: .4byte SpriteCB_ResetRtcCusor1
	thumb_func_end ResetRtcScreen_CreateCursor

	thumb_func_start ResetRtcScreen_FreeCursorPalette
ResetRtcScreen_FreeCursorPalette: @ 806A724
	push {lr}
	ldr r0, _0806A734 @ =gUnknown_083764BC
	ldrh r0, [r0, 0x4]
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	.align 2, 0
_0806A734: .4byte gUnknown_083764BC
	thumb_func_end ResetRtcScreen_FreeCursorPalette

	thumb_func_start ResetRtcScreen_HideChooseTimeWindow
ResetRtcScreen_HideChooseTimeWindow: @ 806A738
	push {lr}
	movs r0, 0x3
	movs r1, 0x8
	movs r2, 0x19
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	thumb_func_end ResetRtcScreen_HideChooseTimeWindow

	thumb_func_start ResetRtcScreen_PrintTime
ResetRtcScreen_PrintTime: @ 806A74C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r10, r0
	adds r0, r2, 0
	adds r4, r3, 0
	ldr r6, [sp, 0x24]
	ldr r2, [sp, 0x28]
	mov r9, r2
	mov r2, r10
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp]
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	mov r1, r9
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	ldr r7, _0806A83C @ =gStringVar4
	ldr r1, _0806A840 @ =0x00002710
	bl __umodsi3
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	movs r1, 0x18
	bl __umodsi3
	mov r8, r0
	mov r2, r8
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	adds r0, r6, 0
	movs r1, 0x3C
	bl __umodsi3
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	mov r0, r9
	movs r1, 0x3C
	bl __umodsi3
	mov r9, r0
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r4, _0806A844 @ =gStringVar1
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x18
	movs r3, 0x1
	bl sub_8072C44
	adds r0, r7, 0
	adds r1, r4, 0
	bl StringCopy
	adds r7, r0, 0
	ldr r1, _0806A848 @ =gOtherText_Day
	bl StringCopy
	adds r7, r0, 0
	adds r0, r4, 0
	mov r1, r8
	movs r2, 0x12
	movs r3, 0x1
	bl sub_8072C44
	adds r0, r7, 0
	adds r1, r4, 0
	bl StringCopy
	adds r7, r0, 0
	ldr r4, _0806A84C @ =gUnknown_08376500
	adds r1, r4, 0
	bl StringCopy
	adds r7, r0, 0
	adds r1, r6, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r7, r0, 0
	adds r1, r4, 0
	bl StringCopy
	adds r7, r0, 0
	mov r1, r9
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _0806A83C @ =gStringVar4
	mov r1, r10
	ldr r2, [sp]
	bl MenuPrint
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A83C: .4byte gStringVar4
_0806A840: .4byte 0x00002710
_0806A844: .4byte gStringVar1
_0806A848: .4byte gOtherText_Day
_0806A84C: .4byte gUnknown_08376500
	thumb_func_end ResetRtcScreen_PrintTime

	thumb_func_start ResetRtcScreen_ShowChooseTimeWindow
ResetRtcScreen_ShowChooseTimeWindow: @ 806A850
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	adds r6, r0, 0
	mov r8, r1
	adds r4, r2, 0
	adds r5, r3, 0
	lsls r6, 16
	lsrs r6, 16
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x3
	movs r1, 0x8
	movs r2, 0x19
	movs r3, 0xB
	bl MenuDrawTextWindow
	ldr r0, _0806A8A8 @ =gOtherText_OK
	movs r1, 0x14
	movs r2, 0x9
	bl MenuPrint
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r0, 0x4
	movs r1, 0x9
	adds r2, r6, 0
	mov r3, r8
	bl ResetRtcScreen_PrintTime
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A8A8: .4byte gOtherText_OK
	thumb_func_end ResetRtcScreen_ShowChooseTimeWindow

	thumb_func_start ResetRtcScreen_MoveTimeUpDown
ResetRtcScreen_MoveTimeUpDown: @ 806A8AC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r3, 16
	lsrs r3, 16
	adds r1, r3, 0
	movs r0, 0x80
	ands r0, r3
	cmp r0, 0
	beq _0806A8C6
	ldrh r0, [r4]
	subs r0, 0x1
	b _0806A8E0
_0806A8C6:
	movs r0, 0x40
	ands r0, r3
	cmp r0, 0
	beq _0806A8D4
	ldrh r0, [r4]
	adds r0, 0x1
	b _0806A8FE
_0806A8D4:
	movs r0, 0x20
	ands r0, r3
	cmp r0, 0
	beq _0806A8EE
	ldrh r0, [r4]
	subs r0, 0xA
_0806A8E0:
	strh r0, [r4]
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, r5
	bge _0806A90A
	strh r2, [r4]
	b _0806A90A
_0806A8EE:
	movs r0, 0x10
	ands r1, r0
	cmp r1, 0
	bne _0806A8FA
	movs r0, 0
	b _0806A90C
_0806A8FA:
	ldrh r0, [r4]
	adds r0, 0xA
_0806A8FE:
	strh r0, [r4]
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, r2
	ble _0806A90A
	strh r5, [r4]
_0806A90A:
	movs r0, 0x1
_0806A90C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ResetRtcScreen_MoveTimeUpDown

	thumb_func_start Task_ResetRtc_3
Task_ResetRtc_3: @ 806A914
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806A928 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x1
	strh r0, [r1, 0x8]
	bx lr
	.align 2, 0
_0806A928: .4byte gTasks
	thumb_func_end Task_ResetRtc_3

	thumb_func_start Task_ResetRtc_2
Task_ResetRtc_2: @ 806A92C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl ResetRtcScreen_HideChooseTimeWindow
	bl ResetRtcScreen_FreeCursorPalette
	ldr r1, _0806A950 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806A954 @ =Task_ResetRtc_3
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A950: .4byte gTasks
_0806A954: .4byte Task_ResetRtc_3
	thumb_func_end Task_ResetRtc_2

	thumb_func_start Task_ResetRtc_1
Task_ResetRtc_1: @ 806A958
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r7, r0, 3
	ldr r0, _0806A99C @ =gTasks + 0x8
	mov r8, r0
	adds r5, r7, r0
	ldrb r4, [r5, 0x4]
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	ldr r1, _0806A9A0 @ =gUnknown_08376420 - 0xC
	adds r2, r0, r1
	ldr r1, _0806A9A4 @ =gMain
	ldrh r3, [r1, 0x2E]
	movs r0, 0x2
	ands r0, r3
	mov r12, r1
	cmp r0, 0
	beq _0806A9AC
	mov r0, r8
	subs r0, 0x8
	adds r0, r7, r0
	ldr r1, _0806A9A8 @ =Task_ResetRtc_2
	str r1, [r0]
	movs r0, 0
	strh r0, [r5, 0x2]
	movs r0, 0x6
	b _0806A9CC
	.align 2, 0
_0806A99C: .4byte gTasks + 0x8
_0806A9A0: .4byte gUnknown_08376420 - 0xC
_0806A9A4: .4byte gMain
_0806A9A8: .4byte Task_ResetRtc_2
_0806A9AC:
	movs r0, 0x10
	ands r0, r3
	cmp r0, 0
	beq _0806A9BA
	ldrb r0, [r2, 0x7]
	cmp r0, 0
	bne _0806A9CC
_0806A9BA:
	mov r3, r12
	ldrh r1, [r3, 0x2E]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0806A9D6
	ldrb r0, [r2, 0x6]
	cmp r0, 0
	beq _0806A9D6
_0806A9CC:
	strh r0, [r5, 0x4]
	movs r0, 0x5
	bl PlaySE
	b _0806AA58
_0806A9D6:
	cmp r4, 0x5
	bne _0806AA24
	mov r0, r12
	ldrh r1, [r0, 0x2E]
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _0806AA58
	ldr r1, _0806AA18 @ =gLocalTime
	ldrh r0, [r5, 0x6]
	strh r0, [r1]
	ldrh r0, [r5, 0x8]
	strb r0, [r1, 0x2]
	ldrh r0, [r5, 0xA]
	strb r0, [r1, 0x3]
	ldrh r0, [r5, 0xC]
	strb r0, [r1, 0x4]
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0806AA1C @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806AA20 @ =Task_ResetRtc_2
	str r1, [r0]
	strh r4, [r5, 0x2]
	movs r0, 0x6
	strh r0, [r5, 0x4]
	b _0806AA58
	.align 2, 0
_0806AA18: .4byte gLocalTime
_0806AA1C: .4byte gTasks
_0806AA20: .4byte Task_ResetRtc_2
_0806AA24:
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r5, r0
	ldrh r1, [r2, 0x2]
	ldrh r2, [r2, 0x4]
	mov r3, r12
	ldrh r4, [r3, 0x30]
	movs r3, 0xC0
	ands r3, r4
	bl ResetRtcScreen_MoveTimeUpDown
	cmp r0, 0
	beq _0806AA58
	movs r0, 0x5
	bl PlaySE
	ldrh r2, [r5, 0x6]
	ldrb r3, [r5, 0x8]
	ldrb r0, [r5, 0xA]
	str r0, [sp]
	ldrb r0, [r5, 0xC]
	str r0, [sp, 0x4]
	movs r0, 0x4
	movs r1, 0x9
	bl ResetRtcScreen_PrintTime
_0806AA58:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end Task_ResetRtc_1

	thumb_func_start Task_ResetRtc_0
Task_ResetRtc_0: @ 806AA64
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r6, r5, 2
	adds r6, r5
	lsls r6, 3
	ldr r0, _0806AACC @ =gTasks + 0x8
	mov r8, r0
	adds r4, r6, r0
	movs r0, 0
	strh r0, [r4]
	ldr r3, _0806AAD0 @ =gLocalTime
	ldrh r0, [r3]
	strh r0, [r4, 0x6]
	movs r1, 0x2
	ldrsb r1, [r3, r1]
	strh r1, [r4, 0x8]
	movs r2, 0x3
	ldrsb r2, [r3, r2]
	strh r2, [r4, 0xA]
	ldrb r3, [r3, 0x4]
	lsls r3, 24
	asrs r3, 24
	strh r3, [r4, 0xC]
	ldrh r0, [r4, 0x6]
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	bl ResetRtcScreen_ShowChooseTimeWindow
	adds r0, r5, 0
	bl ResetRtcScreen_CreateCursor
	movs r0, 0x2
	strh r0, [r4, 0x4]
	movs r0, 0x8
	negs r0, r0
	add r8, r0
	add r6, r8
	ldr r0, _0806AAD4 @ =Task_ResetRtc_1
	str r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806AACC: .4byte gTasks + 0x8
_0806AAD0: .4byte gLocalTime
_0806AAD4: .4byte Task_ResetRtc_1
	thumb_func_end Task_ResetRtc_0

	thumb_func_start CB2_InitResetRtcScreen
CB2_InitResetRtcScreen: @ 806AAD8
	push {r4-r7,lr}
	sub sp, 0x4
	movs r0, 0x80
	lsls r0, 19
	movs r4, 0
	strh r4, [r0]
	movs r0, 0
	bl SetVBlankCallback
	movs r2, 0xA0
	lsls r2, 19
	mov r0, sp
	strh r4, [r0]
	ldr r1, _0806AB94 @ =0x040000d4
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _0806AB98 @ =0x81000200
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0xC0
	lsls r3, 9
	mov r4, sp
	movs r6, 0
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _0806AB9C @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_0806AB16:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r5
	subs r3, r5
	cmp r3, r5
	bhi _0806AB16
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0
	movs r1, 0x80
	bl ResetOamRange
	bl LoadOam
	bl remove_some_task
	bl dp12_8087EA4
	bl ResetSpriteData
	bl ResetTasks
	bl ResetPaletteFade
	ldr r4, _0806ABA0 @ =gWindowConfig_81E6CE4
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x88
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0806ABA4 @ =VBlankCB_ResetRtcScreen
	bl SetVBlankCallback
	ldr r0, _0806ABA8 @ =CB2_ResetRtcScreen
	bl SetMainCallback2
	ldr r0, _0806ABAC @ =Task_ResetRtcScreen
	movs r1, 0x50
	bl CreateTask
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806AB94: .4byte 0x040000d4
_0806AB98: .4byte 0x81000200
_0806AB9C: .4byte 0x81000800
_0806ABA0: .4byte gWindowConfig_81E6CE4
_0806ABA4: .4byte VBlankCB_ResetRtcScreen
_0806ABA8: .4byte CB2_ResetRtcScreen
_0806ABAC: .4byte Task_ResetRtcScreen
	thumb_func_end CB2_InitResetRtcScreen

	thumb_func_start CB2_ResetRtcScreen
CB2_ResetRtcScreen: @ 806ABB0
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end CB2_ResetRtcScreen

	thumb_func_start VBlankCB_ResetRtcScreen
VBlankCB_ResetRtcScreen: @ 806ABC8
	push {lr}
	bl ProcessSpriteCopyRequests
	bl LoadOam
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end VBlankCB_ResetRtcScreen

	thumb_func_start ResetRtcScreen_ShowMessage
ResetRtcScreen_ShowMessage: @ 806ABDC
	push {r4,lr}
	adds r4, r0, 0
	bl MenuDisplayMessageBox
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ResetRtcScreen_ShowMessage

	thumb_func_start Task_ShowResetRtcPrompt
Task_ShowResetRtcPrompt: @ 806ABF4
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0806AC14 @ =gTasks + 0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0806AC18
	cmp r0, 0x1
	beq _0806AC80
	b _0806ACC4
	.align 2, 0
_0806AC14: .4byte gTasks + 0x8
_0806AC18:
	bl MenuZeroFillScreen
	movs r0, 0
	movs r1, 0
	movs r2, 0x14
	movs r3, 0xA
	bl MenuDrawTextWindow
	ldr r0, _0806AC98 @ =gSystemText_PresentTime
	movs r1, 0x1
	movs r2, 0x1
	bl MenuPrint
	ldr r0, _0806AC9C @ =gLocalTime
	ldrh r2, [r0]
	ldrb r3, [r0, 0x2]
	ldrb r1, [r0, 0x3]
	str r1, [sp]
	ldrb r0, [r0, 0x4]
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0x3
	bl ResetRtcScreen_PrintTime
	ldr r0, _0806ACA0 @ =gSystemText_PreviousTime
	movs r1, 0x1
	movs r2, 0x5
	bl MenuPrint
	ldr r1, _0806ACA4 @ =gSaveBlock2
	adds r0, r1, 0
	adds r0, 0xA0
	ldrh r2, [r0]
	adds r0, 0x2
	ldrb r3, [r0]
	adds r0, 0x1
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r1, 0
	adds r0, 0xA4
	ldrb r0, [r0]
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0x7
	bl ResetRtcScreen_PrintTime
	ldr r0, _0806ACA8 @ =gSystemText_ResetRTCPrompt
	bl ResetRtcScreen_ShowMessage
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0806AC80:
	ldr r0, _0806ACAC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0806ACB0
	adds r0, r5, 0
	bl DestroyTask
	bl DoSoftReset
	b _0806ACC4
	.align 2, 0
_0806AC98: .4byte gSystemText_PresentTime
_0806AC9C: .4byte gLocalTime
_0806ACA0: .4byte gSystemText_PreviousTime
_0806ACA4: .4byte gSaveBlock2
_0806ACA8: .4byte gSystemText_ResetRTCPrompt
_0806ACAC: .4byte gMain
_0806ACB0:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806ACC4
	movs r0, 0x5
	bl PlaySE
	adds r0, r5, 0
	bl DestroyTask
_0806ACC4:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end Task_ShowResetRtcPrompt

	thumb_func_start Task_ResetRtcScreen
Task_ResetRtcScreen: @ 806ACCC
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0806ACF4 @ =gTasks + 0x8
	adds r5, r0, r1
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0x6
	bls _0806ACE8
	b _0806AEC4
_0806ACE8:
	lsls r0, 2
	ldr r1, _0806ACF8 @ =_0806ACFC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806ACF4: .4byte gTasks + 0x8
_0806ACF8: .4byte _0806ACFC
	.align 2, 0
_0806ACFC:
	.4byte _0806AD18
	.4byte _0806AD34
	.4byte _0806AD80
	.4byte _0806ADD8
	.4byte _0806AE5C
	.4byte _0806AE8C
	.4byte _0806AEAE
_0806AD18:
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0806AD30 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0x1
	strh r0, [r5]
	b _0806AEC4
	.align 2, 0
_0806AD30: .4byte 0x0000ffff
_0806AD34:
	ldr r0, _0806AD5C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0806AD42
	b _0806AEC4
_0806AD42:
	ldr r0, _0806AD60 @ =gSaveFileStatus
	ldrh r0, [r0]
	cmp r0, 0
	beq _0806AD4E
	cmp r0, 0x2
	bne _0806AD68
_0806AD4E:
	ldr r0, _0806AD64 @ =gSystemText_NoSaveFileNoTime
	bl ResetRtcScreen_ShowMessage
	movs r0, 0x5
	strh r0, [r5]
	b _0806AEC4
	.align 2, 0
_0806AD5C: .4byte gPaletteFade
_0806AD60: .4byte gSaveFileStatus
_0806AD64: .4byte gSystemText_NoSaveFileNoTime
_0806AD68:
	bl RtcCalcLocalTime
	ldr r0, _0806AD7C @ =Task_ShowResetRtcPrompt
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x2]
	b _0806ADFC
	.align 2, 0
_0806AD7C: .4byte Task_ShowResetRtcPrompt
_0806AD80:
	ldr r2, _0806ADC4 @ =gTasks
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x4]
	cmp r0, 0x1
	bne _0806AD96
	b _0806AEC4
_0806AD96:
	bl MenuZeroFillScreen
	ldr r0, _0806ADC8 @ =gSystemText_PleaseResetTime
	bl ResetRtcScreen_ShowMessage
	ldr r2, _0806ADCC @ =gLocalTime
	ldr r0, _0806ADD0 @ =gSaveBlock2
	adds r0, 0xA0
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _0806ADD4 @ =Task_ResetRtc_0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x2]
	movs r0, 0x3
	strh r0, [r5]
	b _0806AEC4
	.align 2, 0
_0806ADC4: .4byte gTasks
_0806ADC8: .4byte gSystemText_PleaseResetTime
_0806ADCC: .4byte gLocalTime
_0806ADD0: .4byte gSaveBlock2
_0806ADD4: .4byte Task_ResetRtc_0
_0806ADD8:
	ldr r2, _0806AE04 @ =gTasks
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r1, r0, r2
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _0806AEC4
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0806AE08
	ldrb r0, [r5, 0x2]
	bl DestroyTask
_0806ADFC:
	movs r0, 0x2
	strh r0, [r5]
	b _0806AEC4
	.align 2, 0
_0806AE04: .4byte gTasks
_0806AE08:
	ldrb r0, [r5, 0x2]
	bl DestroyTask
	bl RtcReset
	ldr r4, _0806AE4C @ =gLocalTime
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r1, 0x2
	ldrsb r1, [r4, r1]
	movs r2, 0x3
	ldrsb r2, [r4, r2]
	movs r3, 0x4
	ldrsb r3, [r4, r3]
	bl RtcCalcLocalTimeOffset
	ldr r2, _0806AE50 @ =gSaveBlock2
	adds r2, 0xA0
	ldr r0, [r4]
	ldr r1, [r4, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _0806AE54 @ =0x00004040
	ldrh r1, [r4]
	bl VarSet
	bl DisableResetRTC
	ldr r0, _0806AE58 @ =gSystemText_ClockResetDataSave
	bl ResetRtcScreen_ShowMessage
	movs r0, 0x4
	strh r0, [r5]
	b _0806AEC4
	.align 2, 0
_0806AE4C: .4byte gLocalTime
_0806AE50: .4byte gSaveBlock2
_0806AE54: .4byte 0x00004040
_0806AE58: .4byte gSystemText_ClockResetDataSave
_0806AE5C:
	movs r0, 0
	bl sub_8125D44
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806AE7C
	ldr r0, _0806AE78 @ =gSystemText_SaveCompleted
	bl ResetRtcScreen_ShowMessage
	movs r0, 0x49
	bl PlaySE
	b _0806AE88
	.align 2, 0
_0806AE78: .4byte gSystemText_SaveCompleted
_0806AE7C:
	ldr r0, _0806AECC @ =gSystemText_SaveFailed
	bl ResetRtcScreen_ShowMessage
	movs r0, 0x16
	bl PlaySE
_0806AE88:
	movs r0, 0x5
	strh r0, [r5]
_0806AE8C:
	ldr r0, _0806AED0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806AEC4
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0806AED4 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r0, 0x6
	strh r0, [r5]
_0806AEAE:
	ldr r0, _0806AED8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0806AEC4
	adds r0, r4, 0
	bl DestroyTask
	bl DoSoftReset
_0806AEC4:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806AECC: .4byte gSystemText_SaveFailed
_0806AED0: .4byte gMain
_0806AED4: .4byte 0x0000ffff
_0806AED8: .4byte gPaletteFade
	thumb_func_end Task_ResetRtcScreen

	.align 2, 0 @ Don't pad with nop.
