	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_814A2B8
sub_814A2B8: @ 814A2B8
	ldr r2, _0814A2CC @ =gUnknown_08417068
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	lsls r1, 1
	adds r1, r0
	movs r2, 0
	ldrsh r0, [r1, r2]
	bx lr
	.align 2, 0
_0814A2CC: .4byte gUnknown_08417068
	thumb_func_end sub_814A2B8

	thumb_func_start sub_814A2D0
sub_814A2D0: @ 814A2D0
	lsls r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _0814A2E8 @ =gBardMusicTable
	lsrs r0, 14
	adds r0, r2
	ldr r0, [r0]
	lsls r2, r1, 1
	adds r2, r1
	lsls r2, 4
	adds r0, r2
	bx lr
	.align 2, 0
_0814A2E8: .4byte gBardMusicTable
	thumb_func_end sub_814A2D0

	thumb_func_start sub_814A2EC
sub_814A2EC: @ 814A2EC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r6, r0, 0
	lsls r2, 16
	lsrs r2, 16
	mov r9, r2
	ldr r4, _0814A370 @ =gUnknown_084170F4
	adds r2, r1, 0
	adds r3, r6, 0
	adds r3, 0x18
	movs r7, 0x5
_0814A306:
	ldrb r0, [r2]
	strh r0, [r3]
	ldrb r0, [r2]
	cmp r0, 0xFF
	beq _0814A328
	movs r1, 0x1
	ldrsb r1, [r2, r1]
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	adds r1, r0
	strh r1, [r3, 0x2]
	ldrh r0, [r2, 0x4]
	strh r0, [r3, 0x6]
	ldrh r0, [r6, 0x4]
	adds r0, r1
	strh r0, [r6, 0x4]
_0814A328:
	adds r2, 0x8
	adds r3, 0x8
	subs r7, 0x1
	cmp r7, 0
	bge _0814A306
	movs r7, 0x6
	movs r5, 0
	movs r0, 0x1E
	mov r8, r0
	adds r4, r6, 0
_0814A33C:
	mov r0, r8
	add r0, r9
	adds r1, r5, 0
	bl sub_814A2B8
	adds r1, r0, 0
	strh r1, [r4, 0x1C]
	adds r4, 0x8
	adds r5, 0x1
	cmp r5, r7
	blt _0814A33C
	ldrb r1, [r6]
	adds r1, 0x1
	movs r2, 0
	strb r1, [r6]
	strb r2, [r6, 0x1]
	strb r2, [r6, 0x2]
	strb r2, [r6, 0x3]
	strh r2, [r6, 0xA]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0814A370: .4byte gUnknown_084170F4
	thumb_func_end sub_814A2EC

	.align 2, 0 @ Don't pad with nop.
