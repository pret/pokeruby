	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80F6E04
sub_80F6E04: @ 80F6E04
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080F6E78 @ =gPokenavStructPtr
	ldr r5, [r0]
	ldr r1, _080F6E7C @ =0x0000876e
	adds r0, r5, r1
	movs r2, 0
	ldrsh r0, [r0, r2]
	lsls r0, 3
	adds r0, r5, r0
	ldr r7, _080F6E80 @ =0x0000cee8
	adds r0, r7
	ldrh r1, [r0]
	ldr r2, _080F6E84 @ =gTrainers
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r6, [r0, 0x3]
	lsls r0, r6, 3
	mov r8, r0
	ldr r0, _080F6E88 @ =gTrainerFrontPicTable
	add r0, r8
	ldr r2, _080F6E8C @ =gTrainerFrontPicCoords
	lsls r1, r6, 2
	adds r1, r2
	ldrb r1, [r1]
	ldr r2, _080F6E90 @ =0x000131e4
	adds r3, r5, r2
	lsls r2, r4, 13
	ldr r7, _080F6E94 @ =0x0000d1e4
	adds r2, r7
	adds r2, r5, r2
	str r2, [sp]
	str r6, [sp, 0x4]
	movs r2, 0x1
	bl DecompressPicFromTable_2
	ldr r0, _080F6E98 @ =gTrainerFrontPicPaletteTable
	add r8, r0
	mov r1, r8
	ldr r0, [r1]
	lsls r4, 7
	adds r5, r4
	adds r1, r5, 0
	bl LZ77UnCompWram
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F6E78: .4byte gPokenavStructPtr
_080F6E7C: .4byte 0x0000876e
_080F6E80: .4byte 0x0000cee8
_080F6E84: .4byte gTrainers
_080F6E88: .4byte gTrainerFrontPicTable
_080F6E8C: .4byte gTrainerFrontPicCoords
_080F6E90: .4byte 0x000131e4
_080F6E94: .4byte 0x0000d1e4
_080F6E98: .4byte gTrainerFrontPicPaletteTable
	thumb_func_end sub_80F6E04

	thumb_func_start sub_80F6E9C
sub_80F6E9C: @ 80F6E9C
	push {lr}
	ldr r0, _080F6EB4 @ =gPokenavStructPtr
	ldr r0, [r0]
	ldr r2, _080F6EB8 @ =0x0000d15a
	adds r1, r0, r2
	ldrh r2, [r1]
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _080F6EBC
	movs r0, 0
	b _080F6ED0
	.align 2, 0
_080F6EB4: .4byte gPokenavStructPtr
_080F6EB8: .4byte 0x0000d15a
_080F6EBC:
	adds r0, r2, 0
	adds r0, 0x8
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bge _080F6ECC
	movs r0, 0x1
	b _080F6ED0
_080F6ECC:
	movs r0, 0
	strh r0, [r1]
_080F6ED0:
	pop {r1}
	bx r1
	thumb_func_end sub_80F6E9C

	thumb_func_start sub_80F6ED4
sub_80F6ED4: @ 80F6ED4
	push {lr}
	ldr r0, _080F6F00 @ =gPokenavStructPtr
	ldr r0, [r0]
	ldr r2, _080F6F04 @ =0x0000d15a
	adds r1, r0, r2
	ldrh r3, [r1]
	movs r2, 0
	ldrsh r0, [r1, r2]
	movs r2, 0x48
	negs r2, r2
	cmp r0, r2
	beq _080F6F0A
	adds r0, r3, 0
	subs r0, 0x8
	strh r0, [r1]
	lsls r0, 16
	asrs r0, 16
	cmp r0, r2
	ble _080F6F08
	movs r0, 0x1
	b _080F6F0C
	.align 2, 0
_080F6F00: .4byte gPokenavStructPtr
_080F6F04: .4byte 0x0000d15a
_080F6F08:
	strh r2, [r1]
_080F6F0A:
	movs r0, 0
_080F6F0C:
	pop {r1}
	bx r1
	thumb_func_end sub_80F6ED4

	thumb_func_start sub_80F6F10
sub_80F6F10: @ 80F6F10
	push {lr}
	ldr r0, _080F6F48 @ =gPokenavStructPtr
	ldr r0, [r0]
	ldr r2, _080F6F4C @ =0x0000d15e
	adds r1, r0, r2
	movs r2, 0
	strb r2, [r1]
	ldr r1, _080F6F50 @ =0x0000d15f
	adds r0, r1
	strb r2, [r0]
	ldr r1, _080F6F54 @ =REG_BLDCNT
	movs r0, 0xC8
	strh r0, [r1]
	ldr r0, _080F6F58 @ =REG_BLDY
	strh r2, [r0]
	subs r1, 0x8
	ldr r2, _080F6F5C @ =0x00003f3f
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080F6F60 @ =0x00001f1f
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0
	bl sub_80F6FB8
	pop {r0}
	bx r0
	.align 2, 0
_080F6F48: .4byte gPokenavStructPtr
_080F6F4C: .4byte 0x0000d15e
_080F6F50: .4byte 0x0000d15f
_080F6F54: .4byte REG_BLDCNT
_080F6F58: .4byte REG_BLDY
_080F6F5C: .4byte 0x00003f3f
_080F6F60: .4byte 0x00001f1f
	thumb_func_end sub_80F6F10

	thumb_func_start sub_80F6F64
sub_80F6F64: @ 80F6F64
	push {lr}
	ldr r0, _080F6F9C @ =gPokenavStructPtr
	ldr r1, [r0]
	ldr r0, _080F6FA0 @ =0x0000d15e
	adds r2, r1, r0
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8
	bls _080F6FB0
	movs r0, 0
	strb r0, [r2]
	ldr r0, _080F6FA4 @ =0x0000d15f
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _080F6FAC
	ldr r1, _080F6FA8 @ =REG_BLDY
	movs r0, 0x6
	strh r0, [r1]
	b _080F6FB0
	.align 2, 0
_080F6F9C: .4byte gPokenavStructPtr
_080F6FA0: .4byte 0x0000d15e
_080F6FA4: .4byte 0x0000d15f
_080F6FA8: .4byte REG_BLDY
_080F6FAC:
	ldr r0, _080F6FB4 @ =REG_BLDY
	strh r1, [r0]
_080F6FB0:
	pop {r0}
	bx r0
	.align 2, 0
_080F6FB4: .4byte REG_BLDY
	thumb_func_end sub_80F6F64

	thumb_func_start sub_80F6FB8
sub_80F6FB8: @ 80F6FB8
	push {lr}
	lsls r0, 24
	cmp r0, 0
	bne _080F6FDC
	ldr r1, _080F6FD0 @ =REG_WIN0H
	ldr r2, _080F6FD4 @ =0x0000e8f0
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080F6FD8 @ =0x00000888
	b _080F6FE8
	.align 2, 0
_080F6FD0: .4byte REG_WIN0H
_080F6FD4: .4byte 0x0000e8f0
_080F6FD8: .4byte 0x00000888
_080F6FDC:
	ldr r1, _080F6FF0 @ =REG_WIN0H
	ldr r2, _080F6FF4 @ =0x0000e8f0
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080F6FF8 @ =0x00000818
_080F6FE8:
	adds r0, r2, 0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080F6FF0: .4byte REG_WIN0H
_080F6FF4: .4byte 0x0000e8f0
_080F6FF8: .4byte 0x00000818
	thumb_func_end sub_80F6FB8

	thumb_func_start sub_80F6FFC
sub_80F6FFC: @ 80F6FFC
	ldr r0, _080F7008 @ =REG_BLDCNT
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	bx lr
	.align 2, 0
_080F7008: .4byte REG_BLDCNT
	thumb_func_end sub_80F6FFC

	.align 2, 0 @ Don't pad with nop
