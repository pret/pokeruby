	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80A2D64
sub_80A2D64: @ 80A2D64
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _080A2D7C @ =0xffff8ad0
	adds r2, r3, r0
	lsls r0, r2, 16
	lsrs r0, 16
	cmp r0, 0x1B
	bhi _080A2D80
	movs r0, 0xC9
	strh r2, [r1]
	b _080A2D82
	.align 2, 0
_080A2D7C: .4byte 0xffff8ad0
_080A2D80:
	adds r0, r3, 0
_080A2D82:
	pop {r1}
	bx r1
	thumb_func_end sub_80A2D64

	thumb_func_start sub_80A2D88
sub_80A2D88: @ 80A2D88
	push {r4-r7,lr}
	sub sp, 0x8
	adds r6, r0, 0
	adds r7, r1, 0
	ldrh r5, [r7, 0x20]
	adds r1, r5, 0
	bl sub_80A2BC4
	add r4, sp, 0x4
	strb r0, [r4]
	ldrb r2, [r4]
	cmp r2, 0xFF
	beq _080A2DE8
	ldr r0, _080A2DE0 @ =gSaveBlock1
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldr r0, _080A2DE4 @ =0x00002b4c
	adds r1, r0
	adds r0, r7, 0
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	adds r0, r6, 0
	movs r1, 0x40
	adds r2, r4, 0
	bl SetMonData
	mov r0, sp
	strb r5, [r0]
	mov r1, sp
	lsrs r0, r5, 8
	strb r0, [r1, 0x1]
	adds r0, r6, 0
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	ldrb r0, [r4]
	b _080A2DEA
	.align 2, 0
_080A2DE0: .4byte gSaveBlock1
_080A2DE4: .4byte 0x00002b4c
_080A2DE8:
	movs r0, 0xFF
_080A2DEA:
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80A2D88

	thumb_func_start unref_sub_80A2DF4
unref_sub_80A2DF4: @ 80A2DF4
	movs r0, 0
	bx lr
	thumb_func_end unref_sub_80A2DF4

	thumb_func_start sub_80A2DF8
sub_80A2DF8: @ 80A2DF8
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	bl sub_80A2B94
	lsls r0, 24
	cmp r0, 0
	beq _080A2E46
	adds r0, r4, 0
	movs r1, 0x40
	bl GetMonData
	add r2, sp, 0x4
	strb r0, [r2]
	ldr r3, _080A2E50 @ =gSaveBlock1
	ldrb r1, [r2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, _080A2E54 @ =0x00002b6c
	adds r0, r1
	movs r3, 0
	movs r1, 0
	strh r1, [r0]
	movs r0, 0xFF
	strb r0, [r2]
	mov r0, sp
	strb r3, [r0]
	strb r3, [r0, 0x1]
	adds r0, r4, 0
	movs r1, 0x40
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
_080A2E46:
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2E50: .4byte gSaveBlock1
_080A2E54: .4byte 0x00002b6c
	thumb_func_end sub_80A2DF8

	thumb_func_start unref_sub_80A2E58
unref_sub_80A2E58: @ 80A2E58
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A2E70 @ =gSaveBlock1
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldr r0, _080A2E74 @ =0x00002b6c
	adds r1, r0
	movs r0, 0
	strh r0, [r1]
	bx lr
	.align 2, 0
_080A2E70: .4byte gSaveBlock1
_080A2E74: .4byte 0x00002b6c
	thumb_func_end unref_sub_80A2E58

	thumb_func_start sub_80A2E78
sub_80A2E78: @ 80A2E78
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	adds r5, r0, 0
	mov r0, sp
	movs r1, 0
	strb r1, [r0]
	strb r1, [r0, 0x1]
	add r1, sp, 0x4
	movs r0, 0xFF
	strb r0, [r1]
	movs r7, 0x6
	mov r9, r1
	ldr r0, _080A2F04 @ =gSaveBlock1
	mov r8, r0
	ldr r2, _080A2F08 @ =0x00002b4c
	add r2, r8
_080A2E9E:
	lsls r0, r7, 3
	adds r0, r7
	lsls r4, r0, 2
	mov r1, r8
	adds r0, r4, r1
	ldr r3, _080A2F0C @ =0x00002b6c
	adds r0, r3
	ldrh r6, [r0]
	cmp r6, 0
	bne _080A2F10
	adds r4, r2
	adds r0, r5, 0
	movs r1, 0x40
	str r2, [sp, 0x8]
	bl GetMonData
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r2, [sp, 0x8]
	adds r1, r2
	ldm r1!, {r0,r2,r3}
	stm r4!, {r0,r2,r3}
	ldm r1!, {r0,r2,r3}
	stm r4!, {r0,r2,r3}
	ldm r1!, {r0,r2,r3}
	stm r4!, {r0,r2,r3}
	adds r0, r5, 0
	movs r1, 0x40
	bl GetMonData
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	add r1, r8
	ldr r0, _080A2F0C @ =0x00002b6c
	adds r1, r0
	strh r6, [r1]
	adds r0, r5, 0
	movs r1, 0x40
	mov r2, r9
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	adds r0, r7, 0
	b _080A2F1C
	.align 2, 0
_080A2F04: .4byte gSaveBlock1
_080A2F08: .4byte 0x00002b4c
_080A2F0C: .4byte 0x00002b6c
_080A2F10:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0xF
	bls _080A2E9E
	movs r0, 0xFF
_080A2F1C:
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80A2E78

	thumb_func_start itemid_is_mail
itemid_is_mail: @ 80A2F2C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x84
	bgt _080A2F3E
	cmp r0, 0x79
	blt _080A2F3E
	movs r0, 0x1
	b _080A2F40
_080A2F3E:
	movs r0, 0
_080A2F40:
	pop {r1}
	bx r1
	thumb_func_end itemid_is_mail

	.align 2, 0 @ Don't pad with nop.
