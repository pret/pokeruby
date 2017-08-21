	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text



	thumb_func_start sub_811D584
sub_811D584: @ 811D584
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x14]
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0811D59C
	subs r0, r1, 0x1
	strh r0, [r4, 0x14]
	lsls r0, 16
	cmp r0, 0
	bne _0811D5C0
_0811D59C:
	ldrh r0, [r4, 0xA]
	strh r0, [r4, 0x14]
	ldrh r0, [r4, 0x10]
	ldrh r1, [r4, 0x16]
	adds r0, r1
	strh r0, [r4, 0x16]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _0811D5B4
	movs r0, 0x10
	strh r0, [r4, 0x16]
_0811D5B4:
	movs r0, 0x1
	negs r0, r0
	ldrb r1, [r4, 0x16]
	ldr r2, _0811D5DC @ =0x00002d6b
	bl BlendPalettes
_0811D5C0:
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	ble _0811D5D2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0xC]
	strh r0, [r4, 0x14]
_0811D5D2:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811D5DC: .4byte 0x00002d6b
	thumb_func_end sub_811D584

	thumb_func_start sub_811D5E0
sub_811D5E0: @ 811D5E0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x14]
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0811D5F8
	subs r0, r1, 0x1
	strh r0, [r4, 0x14]
	lsls r0, 16
	cmp r0, 0
	bne _0811D61A
_0811D5F8:
	ldrh r0, [r4, 0xC]
	strh r0, [r4, 0x14]
	ldrh r0, [r4, 0x16]
	ldrh r1, [r4, 0x12]
	subs r0, r1
	strh r0, [r4, 0x16]
	lsls r0, 16
	cmp r0, 0
	bge _0811D60E
	movs r0, 0
	strh r0, [r4, 0x16]
_0811D60E:
	movs r0, 0x1
	negs r0, r0
	ldrb r1, [r4, 0x16]
	ldr r2, _0811D640 @ =0x00002d6b
	bl BlendPalettes
_0811D61A:
	movs r0, 0x16
	ldrsh r1, [r4, r0]
	cmp r1, 0
	bne _0811D64E
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _0811D648
	ldr r0, _0811D644 @ =sub_811D54C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	b _0811D64E
	.align 2, 0
_0811D640: .4byte 0x00002d6b
_0811D644: .4byte sub_811D54C
_0811D648:
	ldrh r0, [r4, 0xA]
	strh r0, [r4, 0x14]
	strh r1, [r4, 0x8]
_0811D64E:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_811D5E0

	thumb_func_start sub_811D658
sub_811D658: @ 811D658
	push {lr}
	ldr r0, _0811D674 @ =sTransitionStructPtr
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0x3C
	bl memset
	ldr r0, _0811D678 @ =0x0200c014
	adds r1, r0, 0x2
	bl sub_8057B14
	pop {r0}
	bx r0
	.align 2, 0
_0811D674: .4byte sTransitionStructPtr
_0811D678: .4byte 0x0200c014
	thumb_func_end sub_811D658

	thumb_func_start VBlankCB_BattleTransition
VBlankCB_BattleTransition: @ 811D67C
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end VBlankCB_BattleTransition

	thumb_func_start sub_811D690
sub_811D690: @ 811D690
	ldr r1, _0811D6A4 @ =REG_BG0CNT
	ldrh r1, [r1]
	lsrs r1, 2
	lsls r1, 30
	lsrs r1, 16
	movs r2, 0xC0
	lsls r2, 19
	adds r1, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_0811D6A4: .4byte REG_BG0CNT
	thumb_func_end sub_811D690

	thumb_func_start sub_811D6A8
sub_811D6A8: @ 811D6A8
	push {r4,lr}
	ldr r3, _0811D6D0 @ =REG_BG0CNT
	ldrh r2, [r3]
	lsrs r2, 8
	ldrh r3, [r3]
	lsrs r3, 2
	lsls r2, 27
	lsrs r2, 16
	lsls r3, 30
	lsrs r3, 16
	movs r4, 0xC0
	lsls r4, 19
	adds r2, r4
	str r2, [r0]
	adds r3, r4
	str r3, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811D6D0: .4byte REG_BG0CNT
	thumb_func_end sub_811D6A8

	thumb_func_start sub_811D6D4
sub_811D6D4: @ 811D6D4
	push {lr}
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	pop {r0}
	bx r0
	thumb_func_end sub_811D6D4

	thumb_func_start sub_811D6E8
sub_811D6E8: @ 811D6E8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r10, r0
	ldr r0, [sp, 0x20]
	ldr r4, [sp, 0x24]
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 16
	lsrs r3, 16
	lsls r0, 16
	lsrs r1, r0, 16
	lsls r4, 16
	movs r6, 0
	lsrs r5, r4, 16
	cmp r4, 0
	ble _0811D750
	lsls r0, r7, 16
	asrs r0, 16
	mov r9, r0
	lsls r1, 16
	mov r8, r1
	lsls r0, r3, 16
	asrs r7, r0, 16
_0811D720:
	lsls r4, r2, 16
	asrs r4, 16
	movs r0, 0xFF
	ands r0, r4
	mov r2, r8
	asrs r1, r2, 16
	bl Sin
	lsls r1, r6, 1
	add r1, r10
	add r0, r9
	strh r0, [r1]
	lsls r1, r5, 16
	ldr r0, _0811D760 @ =0xffff0000
	adds r1, r0
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r4, r7
	lsls r4, 16
	lsrs r2, r4, 16
	lsrs r5, r1, 16
	cmp r1, 0
	bgt _0811D720
_0811D750:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811D760: .4byte 0xffff0000
	thumb_func_end sub_811D6E8

	thumb_func_start sub_811D764
sub_811D764: @ 811D764
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	mov r9, r0
	adds r5, r2, 0
	adds r4, r3, 0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 16
	lsrs r4, 16
	movs r2, 0xA0
	lsls r2, 1
	movs r1, 0xA
	bl memset
	movs r1, 0
	lsls r4, 16
	asrs r4, 16
	str r4, [sp, 0x4]
	lsls r5, 16
	asrs r5, 16
	str r5, [sp, 0x8]
_0811D79C:
	lsls r5, r1, 16
	asrs r0, r5, 16
	mov r10, r0
	ldr r1, [sp, 0x4]
	bl Sin
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r10
	ldr r1, [sp, 0x4]
	bl Cos
	ldr r2, [sp]
	lsls r1, r2, 16
	asrs r1, 16
	lsls r4, 16
	asrs r4, 16
	subs r2, r1, r4
	lsls r2, 16
	adds r1, r4
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r0, 16
	asrs r0, 16
	ldr r3, [sp, 0x8]
	subs r1, r3, r0
	lsls r1, 16
	lsrs r7, r1, 16
	adds r0, r3, r0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsrs r1, r2, 16
	str r5, [sp, 0x10]
	cmp r2, 0
	bge _0811D7E8
	movs r1, 0
_0811D7E8:
	lsls r0, r6, 16
	asrs r0, 16
	cmp r0, 0xF0
	ble _0811D7F2
	movs r6, 0xF0
_0811D7F2:
	lsls r0, r7, 16
	cmp r0, 0
	bge _0811D7FA
	movs r7, 0
_0811D7FA:
	mov r2, r8
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x9F
	ble _0811D808
	movs r3, 0x9F
	mov r8, r3
_0811D808:
	lsls r0, r1, 24
	lsrs r0, 16
	orrs r6, r0
	lsls r0, r7, 16
	asrs r0, 16
	str r0, [sp, 0xC]
	lsls r0, 1
	add r0, r9
	strh r6, [r0]
	mov r0, r8
	lsls r4, r0, 16
	asrs r0, r4, 15
	add r0, r9
	strh r6, [r0]
	mov r0, r10
	adds r0, 0x1
	lsls r0, 16
	asrs r0, 16
	ldr r1, [sp, 0x4]
	bl Cos
	lsls r0, 16
	asrs r0, 16
	ldr r2, [sp, 0x8]
	subs r1, r2, r0
	lsls r1, 16
	adds r0, r2, r0
	lsls r0, 16
	lsrs r2, r0, 16
	lsrs r3, r1, 16
	cmp r1, 0
	bge _0811D84A
	movs r3, 0
_0811D84A:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x9F
	ble _0811D854
	movs r2, 0x9F
_0811D854:
	lsls r0, r3, 16
	asrs r1, r0, 16
	adds r3, r0, 0
	lsls r5, r2, 16
	ldr r0, [sp, 0xC]
	cmp r0, r1
	ble _0811D878
	adds r2, r1, 0
_0811D864:
	lsls r1, r7, 16
	ldr r0, _0811D8F8 @ =0xffff0000
	adds r1, r0
	asrs r0, r1, 15
	add r0, r9
	strh r6, [r0]
	lsrs r7, r1, 16
	asrs r1, 16
	cmp r1, r2
	bgt _0811D864
_0811D878:
	lsls r1, r7, 16
	asrs r0, r3, 16
	cmp r1, r3
	bge _0811D896
	adds r2, r0, 0
_0811D882:
	movs r3, 0x80
	lsls r3, 9
	adds r0, r1, r3
	asrs r1, r0, 15
	add r1, r9
	strh r6, [r1]
	adds r1, r0, 0
	asrs r0, r1, 16
	cmp r0, r2
	blt _0811D882
_0811D896:
	asrs r0, r5, 16
	cmp r4, r5
	ble _0811D8B4
	adds r1, r0, 0
_0811D89E:
	ldr r2, _0811D8F8 @ =0xffff0000
	adds r0, r4, r2
	lsrs r3, r0, 16
	mov r8, r3
	asrs r0, 15
	add r0, r9
	strh r6, [r0]
	lsls r4, r3, 16
	asrs r0, r4, 16
	cmp r0, r1
	bgt _0811D89E
_0811D8B4:
	mov r0, r8
	lsls r4, r0, 16
	asrs r0, r5, 16
	cmp r4, r5
	bge _0811D8D4
	adds r2, r0, 0
_0811D8C0:
	movs r1, 0x80
	lsls r1, 9
	adds r0, r4, r1
	asrs r1, r0, 15
	add r1, r9
	strh r6, [r1]
	adds r4, r0, 0
	asrs r0, r4, 16
	cmp r0, r2
	blt _0811D8C0
_0811D8D4:
	ldr r2, [sp, 0x10]
	movs r3, 0x80
	lsls r3, 9
	adds r0, r2, r3
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x3F
	bgt _0811D8E6
	b _0811D79C
_0811D8E6:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811D8F8: .4byte 0xffff0000
	thumb_func_end sub_811D764

	thumb_func_start sub_811D8FC
sub_811D8FC: @ 811D8FC
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r0, [sp, 0x14]
	ldr r5, [sp, 0x18]
	ldr r4, [sp, 0x1C]
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 16
	lsrs r3, 16
	lsls r0, 16
	lsrs r0, 16
	adds r7, r0, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 16
	lsrs r4, 16
	strh r1, [r6]
	strh r2, [r6, 0x2]
	strh r1, [r6, 0x4]
	strh r2, [r6, 0x6]
	strh r3, [r6, 0x8]
	strh r7, [r6, 0xA]
	strh r5, [r6, 0xC]
	strh r4, [r6, 0xE]
	lsls r3, 16
	asrs r3, 16
	lsls r1, 16
	asrs r1, 16
	subs r3, r1
	strh r3, [r6, 0x10]
	lsls r0, r3, 16
	cmp r0, 0
	bge _0811D94E
	negs r0, r3
	strh r0, [r6, 0x10]
	lsls r0, r5, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r6, 0xC]
_0811D94E:
	lsls r0, r7, 16
	asrs r0, 16
	lsls r1, r2, 16
	asrs r1, 16
	subs r1, r0, r1
	strh r1, [r6, 0x12]
	lsls r0, r1, 16
	cmp r0, 0
	bge _0811D96C
	negs r0, r1
	strh r0, [r6, 0x12]
	lsls r0, r4, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r6, 0xE]
_0811D96C:
	movs r0, 0
	strh r0, [r6, 0x14]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_811D8FC

	thumb_func_start sub_811D978
sub_811D978: @ 811D978
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r3, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	ldrh r0, [r3, 0x10]
	mov r8, r0
	movs r1, 0x10
	ldrsh r6, [r3, r1]
	ldrh r2, [r3, 0x12]
	mov r12, r2
	movs r4, 0x12
	ldrsh r5, [r3, r4]
	cmp r6, r5
	ble _0811D9C8
	ldrh r0, [r3, 0xC]
	ldrh r2, [r3, 0x4]
	adds r1, r0, r2
	strh r1, [r3, 0x4]
	ldrh r2, [r3, 0x14]
	add r2, r12
	strh r2, [r3, 0x14]
	lsls r1, r2, 16
	asrs r1, 16
	adds r4, r0, 0
	ldrh r7, [r3, 0xE]
	cmp r1, r6
	ble _0811D9EE
	ldrh r1, [r3, 0x6]
	adds r0, r7, r1
	strh r0, [r3, 0x6]
	mov r1, r8
	b _0811D9EA
_0811D9C8:
	ldrh r0, [r3, 0xE]
	ldrh r2, [r3, 0x6]
	adds r1, r0, r2
	strh r1, [r3, 0x6]
	ldrh r2, [r3, 0x14]
	add r2, r8
	strh r2, [r3, 0x14]
	lsls r1, r2, 16
	asrs r1, 16
	ldrh r4, [r3, 0xC]
	adds r7, r0, 0
	cmp r1, r5
	ble _0811D9EE
	ldrh r1, [r3, 0x4]
	adds r0, r4, r1
	strh r0, [r3, 0x4]
	mov r1, r12
_0811D9EA:
	subs r0, r2, r1
	strh r0, [r3, 0x14]
_0811D9EE:
	movs r5, 0
	lsls r0, r4, 16
	asrs r2, r0, 16
	cmp r2, 0
	ble _0811DA06
	movs r4, 0x4
	ldrsh r1, [r3, r4]
	movs r4, 0x8
	ldrsh r0, [r3, r4]
	ldrh r4, [r3, 0x8]
	cmp r1, r0
	bge _0811DA18
_0811DA06:
	cmp r2, 0
	bge _0811DA26
	movs r0, 0x4
	ldrsh r1, [r3, r0]
	movs r2, 0x8
	ldrsh r0, [r3, r2]
	ldrh r4, [r3, 0x8]
	cmp r1, r0
	bgt _0811DA26
_0811DA18:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r9
	cmp r0, 0
	beq _0811DA26
	strh r4, [r3, 0x4]
_0811DA26:
	lsls r0, r7, 16
	asrs r2, r0, 16
	cmp r2, 0
	ble _0811DA3C
	movs r4, 0x6
	ldrsh r1, [r3, r4]
	movs r4, 0xA
	ldrsh r0, [r3, r4]
	ldrh r4, [r3, 0xA]
	cmp r1, r0
	bge _0811DA4E
_0811DA3C:
	cmp r2, 0
	bge _0811DA5C
	movs r0, 0x6
	ldrsh r1, [r3, r0]
	movs r2, 0xA
	ldrsh r0, [r3, r2]
	ldrh r4, [r3, 0xA]
	cmp r1, r0
	bgt _0811DA5C
_0811DA4E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r10
	cmp r0, 0
	beq _0811DA5C
	strh r4, [r3, 0x6]
_0811DA5C:
	cmp r5, 0x2
	beq _0811DA64
	movs r0, 0
	b _0811DA66
_0811DA64:
	movs r0, 0x1
_0811DA66:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_811D978

	.align 2, 0 @ Don't pad with nop.
