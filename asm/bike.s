	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80E6010
sub_80E6010: @ 80E6010
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E6020 @ =gPlayerAvatar
	strb r0, [r2, 0xA]
	lsrs r1, r0, 1
	adds r0, r1
	strb r0, [r2, 0xB]
	bx lr
	.align 2, 0
_080E6020: .4byte gPlayerAvatar
	thumb_func_end sub_80E6010

	thumb_func_start sub_80E6024
sub_80E6024: @ 80E6024
	ldr r1, _080E6030 @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r1, 0xA]
	strb r0, [r1, 0xB]
	bx lr
	.align 2, 0
_080E6030: .4byte gPlayerAvatar
	thumb_func_end sub_80E6024

	thumb_func_start sub_80E6034
sub_80E6034: @ 80E6034
	push {lr}
	sub sp, 0x8
	ldr r1, _080E605C @ =gUnknown_083DB600
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	ldr r2, _080E6060 @ =gPlayerAvatar
	ldrb r1, [r2]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080E6064
	ldrb r0, [r2, 0xA]
	lsls r0, 1
	add r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	b _080E607E
	.align 2, 0
_080E605C: .4byte gUnknown_083DB600
_080E6060: .4byte gPlayerAvatar
_080E6064:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080E6070
	movs r0, 0x3
	b _080E607E
_080E6070:
	movs r0, 0x88
	ands r0, r1
	cmp r0, 0
	bne _080E607C
	movs r0, 0x1
	b _080E607E
_080E607C:
	movs r0, 0x2
_080E607E:
	add sp, 0x8
	pop {r1}
	bx r1
	thumb_func_end sub_80E6034

	thumb_func_start sub_80E6084
sub_80E6084: @ 80E6084
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _080E60D4 @ =gPlayerAvatar
	ldrb r1, [r5]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080E60CC
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsBumpySlope
	lsls r0, 24
	cmp r0, 0
	beq _080E60CC
	movs r0, 0x2
	strb r0, [r5, 0x8]
	bl player_get_direction_upper_nybble
	lsls r0, 24
	lsrs r0, 24
	bl sub_8059C94
_080E60CC:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E60D4: .4byte gPlayerAvatar
	thumb_func_end sub_80E6084

	.align 2, 0 @ Don't pad with nop.
