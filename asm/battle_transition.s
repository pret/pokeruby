	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text



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
