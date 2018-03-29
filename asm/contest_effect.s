	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	thumb_func_start ContestEffect_09
ContestEffect_09: @ 80B7F3C
	push {r4-r6,lr}
	movs r2, 0
	ldr r1, _080B7F9C @ =gSharedMem + 0x192D0
	ldrb r0, [r1, 0x11]
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	beq _080B7F7C
	movs r3, 0
	adds r5, r1, 0
	adds r6, r5, 0
	adds r6, 0x8
_080B7F54:
	adds r1, r2, r5
	ldrb r0, [r4]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080B7F64
	adds r0, r3, r6
	strb r2, [r0]
	adds r3, 0x1
_080B7F64:
	adds r2, 0x1
	cmp r2, 0x3
	ble _080B7F54
	ldr r0, _080B7F9C @ =gSharedMem + 0x192D0
	adds r0, 0x8
	adds r0, r3, r0
	movs r1, 0xFF
	strb r1, [r0]
	bl sub_80B9120
	lsls r0, 24
	lsrs r2, r0, 24
_080B7F7C:
	cmp r2, 0
	bne _080B7F8A
	ldr r0, _080B7F9C @ =gSharedMem + 0x192D0
	ldrb r0, [r0, 0x11]
	movs r1, 0x36
	bl SetContestantStatusUnk14
_080B7F8A:
	ldr r0, _080B7F9C @ =gSharedMem + 0x192D0
	ldrb r0, [r0, 0x11]
	movs r1, 0x30
	bl SetContestantStatusUnk13
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B7F9C: .4byte gSharedMem + 0x192D0
	thumb_func_end ContestEffect_09

	thumb_func_start ContestEffect_14
ContestEffect_14: @ 80B7FA0
	push {lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x14
	cmp r0, 0x1
	bls _080B7FC2
	movs r1, 0x3C
	cmp r0, 0x7
	bhi _080B7FC2
	movs r1, 0x28
_080B7FC2:
	ldr r0, _080B7FD0 @ =gSharedMem + 0x192D0
	strh r1, [r0, 0x4]
	bl ContestEffect_08
	pop {r0}
	bx r0
	.align 2, 0
_080B7FD0: .4byte gSharedMem + 0x192D0
	thumb_func_end ContestEffect_14

	thumb_func_start ContestEffect_15
ContestEffect_15: @ 80B7FD4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r7, 0
	ldr r0, _080B806C @ =gSharedMem + 0x192D0
	ldrb r6, [r0, 0x11]
	adds r1, r6, r0
	ldrb r1, [r1]
	mov r8, r0
	cmp r1, 0
	beq _080B804A
	movs r5, 0
	mov r4, r8
_080B7FEE:
	adds r0, r6, r4
	adds r1, r5, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080B8044
	strb r5, [r4, 0x8]
	movs r0, 0xFF
	strb r0, [r4, 0x9]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	cmp r0, 0
	beq _080B8032
	movs r1, 0xA
	cmp r0, 0x2
	bls _080B8032
	movs r1, 0x14
	cmp r0, 0x4
	bls _080B8032
	movs r1, 0x1E
	cmp r0, 0x6
	bls _080B8032
	movs r1, 0x3C
	cmp r0, 0x8
	bhi _080B8032
	movs r1, 0x28
_080B8032:
	strh r1, [r4, 0x4]
	bl sub_80B9120
	lsls r0, 24
	cmp r0, 0
	beq _080B8044
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_080B8044:
	adds r5, 0x1
	cmp r5, 0x3
	ble _080B7FEE
_080B804A:
	mov r1, r8
	ldrb r0, [r1, 0x11]
	movs r1, 0x30
	bl SetContestantStatusUnk13
	cmp r7, 0
	bne _080B8062
	mov r1, r8
	ldrb r0, [r1, 0x11]
	movs r1, 0x36
	bl SetContestantStatusUnk14
_080B8062:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B806C: .4byte gSharedMem + 0x192D0
	thumb_func_end ContestEffect_15

	thumb_func_start ContestEffect_16
ContestEffect_16: @ 80B8070
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r0, 0
	mov r9, r0
	ldr r0, _080B8108 @ =gSharedMem + 0x192D0
	ldrb r7, [r0, 0x11]
	adds r1, r7, r0
	ldrb r1, [r1]
	mov r10, r0
	cmp r1, 0
	beq _080B80E0
	movs r6, 0
	mov r8, r10
	mov r5, r10
	subs r5, 0x5B
_080B8094:
	mov r1, r8
	adds r0, r7, r1
	adds r1, r6, r1
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080B80D8
	ldrb r1, [r5]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080B80D8
	lsls r0, r6, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80B90C0
	lsls r0, 24
	cmp r0, 0
	beq _080B80D8
	ldrb r0, [r5]
	movs r2, 0x11
	negs r2, r2
	adds r1, r2, 0
	ands r0, r1
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r5]
	adds r0, r4, 0
	movs r1, 0x8
	bl SetContestantStatusUnk13
	movs r0, 0x1
	mov r9, r0
_080B80D8:
	adds r5, 0x1C
	adds r6, 0x1
	cmp r6, 0x3
	ble _080B8094
_080B80E0:
	mov r1, r10
	ldrb r0, [r1, 0x11]
	movs r1, 0x7
	bl SetContestantStatusUnk13
	mov r2, r9
	cmp r2, 0
	bne _080B80FA
	mov r1, r10
	ldrb r0, [r1, 0x11]
	movs r1, 0x36
	bl SetContestantStatusUnk14
_080B80FA:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8108: .4byte gSharedMem + 0x192D0
	thumb_func_end ContestEffect_16

	thumb_func_start ContestEffect_17
ContestEffect_17: @ 80B810C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r0, 0
	mov r9, r0
	ldr r0, _080B8150 @ =gSharedMem + 0x192D0
	ldrb r1, [r0, 0x11]
	mov r8, r1
	adds r1, r0
	ldrb r1, [r1]
	adds r6, r0, 0
	cmp r1, 0
	beq _080B817C
	movs r5, 0
	adds r4, r6, 0
	movs r7, 0
_080B812E:
	mov r2, r8
	adds r0, r2, r4
	adds r1, r5, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080B8172
	adds r0, r6, 0
	subs r0, 0x70
	adds r0, r7, r0
	ldrb r1, [r0, 0x15]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080B8154
	movs r0, 0x32
	b _080B8156
	.align 2, 0
_080B8150: .4byte gSharedMem + 0x192D0
_080B8154:
	movs r0, 0xA
_080B8156:
	strh r0, [r4, 0x4]
	strb r5, [r4, 0x8]
	movs r0, 0xFF
	strb r0, [r4, 0x9]
	bl sub_80B9120
	lsls r0, 24
	cmp r0, 0
	beq _080B8172
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_080B8172:
	adds r7, 0x1C
	adds r5, 0x1
	ldr r6, _080B81A0 @ =gSharedMem + 0x192D0
	cmp r5, 0x3
	ble _080B812E
_080B817C:
	ldrb r0, [r6, 0x11]
	movs r1, 0x30
	bl SetContestantStatusUnk13
	mov r0, r9
	cmp r0, 0
	bne _080B8192
	ldrb r0, [r6, 0x11]
	movs r1, 0x36
	bl SetContestantStatusUnk14
_080B8192:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B81A0: .4byte gSharedMem + 0x192D0
	thumb_func_end ContestEffect_17

	thumb_func_start ContestEffect_18
ContestEffect_18: @ 80B81A4
	push {r4,lr}
	ldr r4, _080B81D0 @ =gSharedMem + 0x192D0
	ldrb r1, [r4, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r4, 0
	subs r1, 0x70
	adds r0, r1
	ldrb r1, [r0, 0x11]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x11]
	bl ContestEffect_09
	ldrb r0, [r4, 0x11]
	movs r1, 0x30
	bl SetContestantStatusUnk13
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B81D0: .4byte gSharedMem + 0x192D0
	thumb_func_end ContestEffect_18

	thumb_func_start ContestEffect_19
ContestEffect_19: @ 80B81D4
	push {r4,lr}
	ldr r4, _080B8208 @ =gSharedMem + 0x192D0
	ldrb r1, [r4, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r4, 0
	subs r1, 0x70
	adds r0, r1
	ldrh r0, [r0, 0x6]
	ldr r1, _080B820C @ =gContestMoves
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	lsrs r0, 29
	bl sub_80B9038
	ldrb r0, [r4, 0x11]
	movs r1, 0x30
	bl SetContestantStatusUnk13
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8208: .4byte gSharedMem + 0x192D0
_080B820C: .4byte gContestMoves
	thumb_func_end ContestEffect_19

	thumb_func_start ContestEffect_20
ContestEffect_20: @ 80B8210
	push {lr}
	movs r0, 0
	bl sub_80B9038
	ldr r0, _080B8228 @ =gSharedMem + 0x192D0
	ldrb r0, [r0, 0x11]
	movs r1, 0x30
	bl SetContestantStatusUnk13
	pop {r0}
	bx r0
	.align 2, 0
_080B8228: .4byte gSharedMem + 0x192D0
	thumb_func_end ContestEffect_20

	thumb_func_start ContestEffect_21
ContestEffect_21: @ 80B822C
	push {lr}
	movs r0, 0x1
	bl sub_80B9038
	ldr r0, _080B8244 @ =gSharedMem + 0x192D0
	ldrb r0, [r0, 0x11]
	movs r1, 0x30
	bl SetContestantStatusUnk13
	pop {r0}
	bx r0
	.align 2, 0
_080B8244: .4byte gSharedMem + 0x192D0
	thumb_func_end ContestEffect_21

	thumb_func_start ContestEffect_22
ContestEffect_22: @ 80B8248
	push {lr}
	movs r0, 0x2
	bl sub_80B9038
	ldr r0, _080B8260 @ =gSharedMem + 0x192D0
	ldrb r0, [r0, 0x11]
	movs r1, 0x30
	bl SetContestantStatusUnk13
	pop {r0}
	bx r0
	.align 2, 0
_080B8260: .4byte gSharedMem + 0x192D0
	thumb_func_end ContestEffect_22

	thumb_func_start ContestEffect_23
ContestEffect_23: @ 80B8264
	push {lr}
	movs r0, 0x3
	bl sub_80B9038
	ldr r0, _080B827C @ =gSharedMem + 0x192D0
	ldrb r0, [r0, 0x11]
	movs r1, 0x30
	bl SetContestantStatusUnk13
	pop {r0}
	bx r0
	.align 2, 0
_080B827C: .4byte gSharedMem + 0x192D0
	thumb_func_end ContestEffect_23

	thumb_func_start ContestEffect_24
ContestEffect_24: @ 80B8280
	push {lr}
	movs r0, 0x4
	bl sub_80B9038
	ldr r0, _080B8298 @ =gSharedMem + 0x192D0
	ldrb r0, [r0, 0x11]
	movs r1, 0x30
	bl SetContestantStatusUnk13
	pop {r0}
	bx r0
	.align 2, 0
_080B8298: .4byte gSharedMem + 0x192D0
	thumb_func_end ContestEffect_24

	thumb_func_start ContestEffect_25
ContestEffect_25: @ 80B829C
	push {r4-r7,lr}
	movs r4, 0
	ldr r0, _080B82E0 @ =gSharedMem + 0x192D0
	ldrb r1, [r0, 0x11]
	adds r1, r0
	ldrb r1, [r1]
	adds r7, r0, 0
	cmp r1, 0x3
	beq _080B82F4
	movs r5, 0
	adds r6, r7, 0
_080B82B2:
	ldrb r0, [r6, 0x11]
	adds r0, r6
	ldrb r0, [r0]
	adds r0, 0x1
	adds r1, r5, r6
	ldrb r1, [r1]
	cmp r0, r1
	bne _080B82EE
	lsls r0, r5, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80B90C0
	lsls r0, 24
	cmp r0, 0
	beq _080B82E4
	adds r0, r4, 0
	bl sub_80B157C
	adds r0, r4, 0
	movs r1, 0xA
	b _080B82E8
	.align 2, 0
_080B82E0: .4byte gSharedMem + 0x192D0
_080B82E4:
	adds r0, r4, 0
	movs r1, 0x3C
_080B82E8:
	bl SetContestantStatusUnk13
	movs r4, 0x1
_080B82EE:
	adds r5, 0x1
	cmp r5, 0x3
	ble _080B82B2
_080B82F4:
	ldrb r0, [r7, 0x11]
	movs r1, 0x9
	bl SetContestantStatusUnk13
	cmp r4, 0
	bne _080B8308
	ldrb r0, [r7, 0x11]
	movs r1, 0x36
	bl SetContestantStatusUnk14
_080B8308:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_25

	thumb_func_start ContestEffect_26
ContestEffect_26: @ 80B8310
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	movs r0, 0
	mov r9, r0
	movs r1, 0
	str r1, [sp, 0x18]
	mov r0, sp
	movs r1, 0xFF
	movs r2, 0x5
	bl memset
	movs r6, 0
	movs r4, 0
	add r2, sp, 0x10
	mov r8, r2
	add r3, sp, 0x8
	mov r10, r3
	ldr r5, _080B8384 @ =gSharedMem + 0x192D0
	adds r7, r5, 0
	subs r7, 0x70
_080B8340:
	ldrb r0, [r5, 0x11]
	adds r0, r5
	adds r1, r6, r5
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bcs _080B836E
	ldrb r1, [r7, 0xC]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080B836E
	lsls r0, r6, 24
	lsrs r0, 24
	bl Contest_IsMonsTurnDisabled
	lsls r0, 24
	cmp r0, 0
	bne _080B836E
	mov r1, sp
	adds r0, r1, r4
	strb r6, [r0]
	adds r4, 0x1
_080B836E:
	adds r7, 0x1C
	adds r6, 0x1
	cmp r6, 0x3
	ble _080B8340
	cmp r4, 0x1
	bne _080B8388
	movs r0, 0x3C
	mov r2, r8
	strh r0, [r2]
	b _080B83B6
	.align 2, 0
_080B8384: .4byte gSharedMem + 0x192D0
_080B8388:
	cmp r4, 0x2
	bne _080B8396
	movs r0, 0x1E
	mov r3, r8
	strh r0, [r3]
	strh r0, [r3, 0x2]
	b _080B83B6
_080B8396:
	cmp r4, 0x3
	bne _080B83A6
	movs r0, 0x14
	mov r7, r8
	strh r0, [r7]
	strh r0, [r7, 0x2]
	strh r0, [r7, 0x4]
	b _080B83B6
_080B83A6:
	mov r1, r8
	movs r2, 0
	mov r0, r8
	adds r0, 0x6
_080B83AE:
	strh r2, [r0]
	subs r0, 0x2
	cmp r0, r1
	bge _080B83AE
_080B83B6:
	movs r6, 0
	movs r7, 0
	mov r4, r10
_080B83BC:
	ldr r0, _080B83F0 @ =gSharedMem + 0x19260
	adds r5, r7, r0
	ldrb r1, [r5, 0x15]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080B83FC
	lsls r0, r6, 24
	lsrs r0, 24
	bl sub_80B214C
	lsls r0, 24
	cmp r0, 0
	beq _080B83FC
	ldr r1, _080B83F4 @ =gContestMoves
	ldrh r0, [r5, 0x8]
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x2]
	ldr r1, _080B83F8 @ =gComboStarterLookupTable
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 1
	b _080B83FE
	.align 2, 0
_080B83F0: .4byte gSharedMem + 0x19260
_080B83F4: .4byte gContestMoves
_080B83F8: .4byte gComboStarterLookupTable
_080B83FC:
	movs r0, 0
_080B83FE:
	strh r0, [r4]
	ldr r5, _080B8494 @ =gSharedMem + 0x19260
	adds r0, r7, r5
	ldrb r0, [r0, 0xD]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0xA
	bl __divsi3
	lsls r0, 24
	asrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 1
	ldrh r0, [r4]
	subs r0, r1
	strh r0, [r4]
	adds r7, 0x1C
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _080B83BC
	mov r2, r8
	movs r3, 0
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _080B84CA
	movs r6, 0
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _080B84CA
	adds r5, 0x7D
	mov r4, sp
_080B8442:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r6, 1
	add r1, r8
	movs r7, 0
	ldrsh r2, [r1, r7]
	ldrb r3, [r4]
	lsls r1, r3, 1
	add r1, r10
	movs r7, 0
	ldrsh r1, [r1, r7]
	adds r2, r1
	cmp r0, r2
	bge _080B8498
	adds r0, r3, 0
	bl sub_80B90C0
	lsls r0, 24
	cmp r0, 0
	beq _080B84A2
	ldrb r0, [r4]
	bl sub_80B157C
	ldrb r0, [r4]
	movs r1, 0xA
	bl SetContestantStatusUnk13
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	b _080B849C
	.align 2, 0
_080B8494: .4byte gSharedMem + 0x19260
_080B8498:
	movs r0, 0x1
	str r0, [sp, 0x18]
_080B849C:
	ldr r1, [sp, 0x18]
	cmp r1, 0
	beq _080B84B8
_080B84A2:
	movs r2, 0
	str r2, [sp, 0x18]
	ldrb r0, [r4]
	movs r1, 0x3C
	bl SetContestantStatusUnk13
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_080B84B8:
	ldrb r0, [r4]
	adds r0, r5
	movs r1, 0x1
	strb r1, [r0]
	adds r4, 0x1
	adds r6, 0x1
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _080B8442
_080B84CA:
	ldr r4, _080B84F4 @ =gSharedMem + 0x192D0
	ldrb r0, [r4, 0x11]
	movs r1, 0xB
	bl SetContestantStatusUnk13
	mov r3, r9
	cmp r3, 0
	bne _080B84E2
	ldrb r0, [r4, 0x11]
	movs r1, 0x36
	bl SetContestantStatusUnk14
_080B84E2:
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B84F4: .4byte gSharedMem + 0x192D0
	thumb_func_end ContestEffect_26

	thumb_func_start ContestEffect_27
ContestEffect_27: @ 80B84F8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r0, 0
	mov r8, r0
	movs r6, 0
	ldr r7, _080B8580 @ =gSharedMem + 0x192D0
	adds r5, r7, 0
	subs r5, 0x63
_080B850A:
	ldrb r0, [r7, 0x11]
	adds r0, r7
	adds r1, r6, r7
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080B8556
	movs r0, 0
	ldrsb r0, [r5, r0]
	cmp r0, 0
	ble _080B8556
	lsls r0, r6, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80B90C0
	lsls r0, 24
	cmp r0, 0
	beq _080B8556
	movs r0, 0
	strb r0, [r5]
	ldrb r1, [r5, 0x3]
	movs r2, 0x31
	negs r2, r2
	adds r0, r2, 0
	ands r1, r0
	movs r0, 0x20
	orrs r1, r0
	strb r1, [r5, 0x3]
	adds r0, r4, 0
	movs r1, 0xD
	bl SetContestantStatusUnk13
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
_080B8556:
	adds r5, 0x1C
	adds r6, 0x1
	cmp r6, 0x3
	ble _080B850A
	ldr r4, _080B8580 @ =gSharedMem + 0x192D0
	ldrb r0, [r4, 0x11]
	movs r1, 0xC
	bl SetContestantStatusUnk13
	mov r0, r8
	cmp r0, 0
	bne _080B8576
	ldrb r0, [r4, 0x11]
	movs r1, 0x39
	bl SetContestantStatusUnk14
_080B8576:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8580: .4byte gSharedMem + 0x192D0
	thumb_func_end ContestEffect_27

	thumb_func_start ContestEffect_28
ContestEffect_28: @ 80B8584
	push {r4-r7,lr}
	movs r7, 0
	movs r5, 0
	ldr r4, _080B85B0 @ =gSharedMem + 0x192D0
	movs r6, 0
_080B858E:
	ldrb r0, [r4, 0x11]
	adds r0, r4
	adds r1, r5, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080B85CE
	adds r0, r4, 0
	subs r0, 0x70
	adds r0, r6, r0
	ldrb r0, [r0, 0xD]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	ble _080B85B4
	movs r0, 0x28
	b _080B85B6
	.align 2, 0
_080B85B0: .4byte gSharedMem + 0x192D0
_080B85B4:
	movs r0, 0xA
_080B85B6:
	strh r0, [r4, 0x4]
	strb r5, [r4, 0x8]
	movs r0, 0xFF
	strb r0, [r4, 0x9]
	bl sub_80B9120
	lsls r0, 24
	cmp r0, 0
	beq _080B85CE
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_080B85CE:
	adds r6, 0x1C
	adds r5, 0x1
	cmp r5, 0x3
	ble _080B858E
	ldr r4, _080B85F4 @ =gSharedMem + 0x192D0
	ldrb r0, [r4, 0x11]
	movs r1, 0xE
	bl SetContestantStatusUnk13
	cmp r7, 0
	bne _080B85EC
	ldrb r0, [r4, 0x11]
	movs r1, 0x39
	bl SetContestantStatusUnk14
_080B85EC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B85F4: .4byte gSharedMem + 0x192D0
	thumb_func_end ContestEffect_28

	thumb_func_start ContestEffect_29
ContestEffect_29: @ 80B85F8
	push {r4,lr}
	ldr r0, _080B863C @ =gUnknown_02038696
	ldr r4, _080B8640 @ =gSharedMem + 0x192D0
	ldrb r2, [r4, 0x11]
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _080B8636
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r0, r4, 0
	subs r0, 0x70
	adds r1, r0
	ldrh r0, [r1, 0x6]
	ldr r3, _080B8644 @ =gContestEffects
	ldr r2, _080B8648 @ =gContestMoves
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x1]
	lsls r0, 1
	ldrh r2, [r1, 0x2]
	adds r0, r2
	strh r0, [r1, 0x2]
	ldrb r0, [r4, 0x11]
	movs r1, 0xF
	bl SetContestantStatusUnk13
_080B8636:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B863C: .4byte gUnknown_02038696
_080B8640: .4byte gSharedMem + 0x192D0
_080B8644: .4byte gContestEffects
_080B8648: .4byte gContestMoves
	thumb_func_end ContestEffect_29

	thumb_func_start ContestEffect_30
ContestEffect_30: @ 80B864C
	push {r4,lr}
	ldr r0, _080B8690 @ =gUnknown_02038696
	ldr r4, _080B8694 @ =gSharedMem + 0x192D0
	ldrb r2, [r4, 0x11]
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _080B868A
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r0, r4, 0
	subs r0, 0x70
	adds r1, r0
	ldrh r0, [r1, 0x6]
	ldr r3, _080B8698 @ =gContestEffects
	ldr r2, _080B869C @ =gContestMoves
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x1]
	lsls r0, 1
	ldrh r2, [r1, 0x2]
	adds r0, r2
	strh r0, [r1, 0x2]
	ldrb r0, [r4, 0x11]
	movs r1, 0x10
	bl SetContestantStatusUnk13
_080B868A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8690: .4byte gUnknown_02038696
_080B8694: .4byte gSharedMem + 0x192D0
_080B8698: .4byte gContestEffects
_080B869C: .4byte gContestMoves
	thumb_func_end ContestEffect_30

	thumb_func_start ContestEffect_31
ContestEffect_31: @ 80B86A0
	push {r4-r7,lr}
	movs r1, 0
	movs r3, 0
	ldr r4, _080B86EC @ =gSharedMem + 0x192D0
	ldrb r0, [r4, 0x11]
	adds r0, r4
	ldrb r5, [r0]
	movs r2, 0
	adds r6, r4, 0
	subs r6, 0x70
_080B86B4:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r5, r0
	bls _080B86C4
	adds r0, r2, r6
	movs r7, 0x2
	ldrsh r0, [r0, r7]
	adds r3, r0
_080B86C4:
	adds r2, 0x1C
	adds r1, 0x1
	cmp r1, 0x3
	ble _080B86B4
	cmp r3, 0
	bge _080B86D2
	movs r3, 0
_080B86D2:
	ldr r4, _080B86EC @ =gSharedMem + 0x192D0
	ldrb r2, [r4, 0x11]
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _080B86E2
	cmp r3, 0
	bne _080B86F0
_080B86E2:
	adds r0, r2, 0
	movs r1, 0x12
	bl SetContestantStatusUnk13
	b _080B8710
	.align 2, 0
_080B86EC: .4byte gSharedMem + 0x192D0
_080B86F0:
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r0, r4, 0
	subs r0, 0x70
	adds r1, r0
	lsrs r0, r3, 31
	adds r0, r3, r0
	asrs r0, 1
	ldrh r2, [r1, 0x2]
	adds r0, r2
	strh r0, [r1, 0x2]
	ldrb r0, [r4, 0x11]
	movs r1, 0x11
	bl SetContestantStatusUnk13
_080B8710:
	ldr r4, _080B873C @ =gSharedMem + 0x192D0
	ldrb r1, [r4, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r5, r4, 0
	subs r5, 0x70
	adds r0, r5
	movs r7, 0x2
	ldrsh r0, [r0, r7]
	bl sub_80B9224
	ldrb r2, [r4, 0x11]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r5
	strh r0, [r1, 0x2]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B873C: .4byte gSharedMem + 0x192D0
	thumb_func_end ContestEffect_31

	thumb_func_start ContestEffect_32
ContestEffect_32: @ 80B8740
	push {r4-r7,lr}
	movs r6, 0
	ldr r0, _080B8794 @ =gSharedMem + 0x192D0
	ldrb r1, [r0, 0x11]
	adds r3, r1, r0
	ldrb r1, [r3]
	adds r4, r0, 0
	cmp r1, 0
	beq _080B8788
	movs r2, 0
	adds r7, r4, 0
	adds r0, r1, 0
	subs r1, r0, 0x1
	movs r3, 0
	adds r5, r4, 0
	subs r5, 0x70
_080B8760:
	adds r0, r2, r7
	ldrb r0, [r0]
	cmp r1, r0
	bne _080B876C
	adds r0, r3, r5
	ldrh r6, [r0, 0x2]
_080B876C:
	adds r3, 0x1C
	adds r2, 0x1
	cmp r2, 0x3
	ble _080B8760
	adds r0, r4, 0
	ldrb r2, [r0, 0x11]
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	beq _080B8788
	lsls r0, r6, 16
	asrs r3, r0, 16
	cmp r3, 0
	bgt _080B8798
_080B8788:
	ldrb r0, [r4, 0x11]
	movs r1, 0x14
	bl SetContestantStatusUnk13
	b _080B87B2
	.align 2, 0
_080B8794: .4byte gSharedMem + 0x192D0
_080B8798:
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r0, r4, 0
	subs r0, 0x70
	adds r1, r0
	ldrh r0, [r1, 0x2]
	adds r0, r3, r0
	strh r0, [r1, 0x2]
	ldrb r0, [r4, 0x11]
	movs r1, 0x13
	bl SetContestantStatusUnk13
_080B87B2:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_32

	thumb_func_start ContestEffect_33
ContestEffect_33: @ 80B87B8
	push {lr}
	ldr r0, _080B87D8 @ =gSharedMem + 0x192D0
	ldrb r2, [r0, 0x11]
	adds r1, r2, r0
	ldrb r3, [r1]
	mov r12, r0
	cmp r3, 0
	bne _080B87DC
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	mov r1, r12
	subs r1, 0x70
	adds r0, r1
	movs r1, 0xA
	b _080B87EE
	.align 2, 0
_080B87D8: .4byte gSharedMem + 0x192D0
_080B87DC:
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	mov r1, r12
	subs r1, 0x70
	adds r0, r1
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 2
_080B87EE:
	strh r1, [r0, 0x2]
	cmp r3, 0
	bne _080B8800
	mov r1, r12
	ldrb r0, [r1, 0x11]
	movs r1, 0x15
	bl SetContestantStatusUnk13
	b _080B882A
_080B8800:
	cmp r3, 0x1
	bne _080B8810
	mov r1, r12
	ldrb r0, [r1, 0x11]
	movs r1, 0x16
	bl SetContestantStatusUnk13
	b _080B882A
_080B8810:
	cmp r3, 0x2
	bne _080B8820
	mov r1, r12
	ldrb r0, [r1, 0x11]
	movs r1, 0x17
	bl SetContestantStatusUnk13
	b _080B882A
_080B8820:
	mov r1, r12
	ldrb r0, [r1, 0x11]
	movs r1, 0x18
	bl SetContestantStatusUnk13
_080B882A:
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_33

	thumb_func_start ContestEffect_34
ContestEffect_34: @ 80B8830
	push {r4,lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x2
	bhi _080B885C
	movs r4, 0xA
	ldr r0, _080B8858 @ =gSharedMem + 0x192D0
	ldrb r0, [r0, 0x11]
	movs r1, 0x1A
	bl SetContestantStatusUnk13
	b _080B88B0
	.align 2, 0
_080B8858: .4byte gSharedMem + 0x192D0
_080B885C:
	cmp r0, 0x5
	bhi _080B8874
	movs r4, 0x14
	ldr r0, _080B8870 @ =gSharedMem + 0x192D0
	ldrb r0, [r0, 0x11]
	movs r1, 0x1B
	bl SetContestantStatusUnk13
	b _080B88B0
	.align 2, 0
_080B8870: .4byte gSharedMem + 0x192D0
_080B8874:
	cmp r0, 0x7
	bhi _080B888C
	movs r4, 0x28
	ldr r0, _080B8888 @ =gSharedMem + 0x192D0
	ldrb r0, [r0, 0x11]
	movs r1, 0x1C
	bl SetContestantStatusUnk13
	b _080B88B0
	.align 2, 0
_080B8888: .4byte gSharedMem + 0x192D0
_080B888C:
	cmp r1, 0x8
	bhi _080B88A4
	movs r4, 0x3C
	ldr r0, _080B88A0 @ =gSharedMem + 0x192D0
	ldrb r0, [r0, 0x11]
	movs r1, 0x1D
	bl SetContestantStatusUnk13
	b _080B88B0
	.align 2, 0
_080B88A0: .4byte gSharedMem + 0x192D0
_080B88A4:
	movs r4, 0x50
	ldr r0, _080B88C8 @ =gSharedMem + 0x192D0
	ldrb r0, [r0, 0x11]
	movs r1, 0x1E
	bl SetContestantStatusUnk13
_080B88B0:
	ldr r0, _080B88C8 @ =gSharedMem + 0x192D0
	ldrb r2, [r0, 0x11]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	subs r0, 0x70
	adds r1, r0
	strh r4, [r1, 0x2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B88C8: .4byte gSharedMem + 0x192D0
	thumb_func_end ContestEffect_34

	thumb_func_start ContestEffect_35
ContestEffect_35: @ 80B88CC
	push {r4-r7,lr}
	ldr r1, _080B8940 @ =gSharedMem + 0x192D0
	ldrb r0, [r1, 0x11]
	adds r0, r1
	movs r2, 0
	ldrsb r2, [r0, r2]
	subs r0, r2, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	mov r12, r1
	cmp r2, 0
	beq _080B8994
	ldrb r5, [r1]
	mov r6, r12
	subs r6, 0x70
_080B88EA:
	movs r2, 0
	lsls r0, r4, 24
	asrs r1, r0, 24
	adds r4, r0, 0
	cmp r5, r1
	beq _080B8910
	ldr r3, _080B8940 @ =gSharedMem + 0x192D0
_080B88F8:
	lsls r0, r2, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r2, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	bgt _080B8910
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, r1
	bne _080B88F8
_080B8910:
	lsls r2, 24
	asrs r1, r2, 24
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r3, r0, r6
	ldrb r1, [r3, 0xB]
	movs r0, 0x80
	ands r0, r1
	adds r7, r2, 0
	cmp r0, 0
	bne _080B8932
	ldrb r1, [r3, 0xC]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	beq _080B8944
_080B8932:
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r4, r1
	lsrs r4, r0, 24
	cmp r0, 0
	blt _080B8994
	b _080B88EA
	.align 2, 0
_080B8940: .4byte gSharedMem + 0x192D0
_080B8944:
	mov r2, r12
	ldrb r1, [r2, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	mov r3, r12
	subs r3, 0x70
	adds r5, r0, r3
	ldrh r0, [r5, 0x6]
	ldr r4, _080B899C @ =gContestMoves
	lsls r0, 3
	adds r6, r0, r4
	ldrb r2, [r6, 0x1]
	lsls r2, 29
	asrs r1, r7, 24
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x6]
	lsls r0, 3
	adds r0, r4
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	cmp r2, r0
	bne _080B8994
	ldr r1, _080B89A0 @ =gContestEffects
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x1]
	lsls r0, 1
	ldrh r1, [r5, 0x2]
	adds r0, r1
	strh r0, [r5, 0x2]
	mov r2, r12
	ldrb r0, [r2, 0x11]
	movs r1, 0x1F
	bl SetContestantStatusUnk13
_080B8994:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B899C: .4byte gContestMoves
_080B89A0: .4byte gContestEffects
	thumb_func_end ContestEffect_35

	thumb_func_start ContestEffect_36
ContestEffect_36: @ 80B89A4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _080B8A28 @ =gSharedMem + 0x192D0
	ldrb r2, [r0, 0x11]
	adds r1, r2, r0
	ldrb r1, [r1]
	mov r8, r0
	cmp r1, 0
	beq _080B8A3C
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	mov r1, r8
	subs r1, 0x70
	adds r0, r1
	ldrh r0, [r0, 0x6]
	mov r9, r0
	movs r4, 0
	mov r6, r8
	ldr r0, _080B8A2C @ =gContestMoves
	mov r12, r0
	movs r7, 0
_080B89D4:
	ldrb r2, [r6, 0x11]
	adds r0, r2, r6
	ldrb r0, [r0]
	subs r0, 0x1
	adds r1, r4, r6
	ldrb r1, [r1]
	cmp r0, r1
	bne _080B8A34
	mov r1, r9
	lsls r0, r1, 3
	mov r1, r12
	adds r3, r0, r1
	ldrb r1, [r3, 0x1]
	lsls r1, 29
	mov r5, r8
	subs r5, 0x70
	adds r0, r7, r5
	ldrh r0, [r0, 0x6]
	lsls r0, 3
	add r0, r12
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	cmp r1, r0
	beq _080B8A34
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r5
	ldr r2, _080B8A30 @ =gContestEffects
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	lsls r0, 1
	ldrh r2, [r1, 0x2]
	adds r0, r2
	strh r0, [r1, 0x2]
	ldrb r0, [r6, 0x11]
	movs r1, 0x20
	bl SetContestantStatusUnk13
	b _080B8A3C
	.align 2, 0
_080B8A28: .4byte gSharedMem + 0x192D0
_080B8A2C: .4byte gContestMoves
_080B8A30: .4byte gContestEffects
_080B8A34:
	adds r7, 0x1C
	adds r4, 0x1
	cmp r4, 0x3
	ble _080B89D4
_080B8A3C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_36

	thumb_func_start ContestEffect_37
ContestEffect_37: @ 80B8A48
	push {r4-r7,lr}
	ldr r1, _080B8A94 @ =gSharedMem + 0x192D0
	ldrb r0, [r1, 0x11]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080B8AB0
	movs r5, 0
	adds r4, r1, 0
	adds r6, r4, 0
	subs r6, 0x70
	adds r7, r6, 0
_080B8A60:
	ldrb r2, [r4, 0x11]
	adds r0, r2, r4
	ldrb r0, [r0]
	subs r0, 0x1
	adds r1, r5, r4
	ldrb r1, [r1]
	cmp r0, r1
	bne _080B8AA8
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r2, r0, r7
	movs r0, 0x2
	ldrsh r1, [r2, r0]
	movs r3, 0x2
	ldrsh r0, [r6, r3]
	cmp r1, r0
	ble _080B8A98
	adds r0, r1, 0
	lsls r0, 1
	strh r0, [r2, 0x2]
	ldrb r0, [r4, 0x11]
	movs r1, 0x21
	bl SetContestantStatusUnk13
	b _080B8AA8
	.align 2, 0
_080B8A94: .4byte gSharedMem + 0x192D0
_080B8A98:
	cmp r1, r0
	bge _080B8AA8
	movs r0, 0
	strh r0, [r2, 0x2]
	ldrb r0, [r4, 0x11]
	movs r1, 0x22
	bl SetContestantStatusUnk13
_080B8AA8:
	adds r6, 0x1C
	adds r5, 0x1
	cmp r5, 0x3
	ble _080B8A60
_080B8AB0:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_37

	thumb_func_start ContestEffect_38
ContestEffect_38: @ 80B8AB8
	push {r4,r5,lr}
	ldr r4, _080B8AFC @ =gSharedMem + 0x192D0
	ldrb r2, [r4, 0x11]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r5, r4, 0
	subs r5, 0x70
	adds r1, r0, r5
	ldrb r3, [r1, 0xD]
	movs r0, 0xD
	ldrsb r0, [r1, r0]
	cmp r0, 0x1D
	bgt _080B8B00
	adds r0, r3, 0
	adds r0, 0xA
	strb r0, [r1, 0xD]
	ldrb r1, [r4, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r2, [r0, 0x10]
	movs r1, 0x31
	negs r1, r1
	ands r1, r2
	movs r2, 0x10
	orrs r1, r2
	strb r1, [r0, 0x10]
	ldrb r0, [r4, 0x11]
	movs r1, 0x23
	bl SetContestantStatusUnk13
	b _080B8B08
	.align 2, 0
_080B8AFC: .4byte gSharedMem + 0x192D0
_080B8B00:
	adds r0, r2, 0
	movs r1, 0x3A
	bl SetContestantStatusUnk13
_080B8B08:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_38

	thumb_func_start ContestEffect_39
ContestEffect_39: @ 80B8B10
	push {r4,lr}
	ldr r3, _080B8B48 @ =gSharedMem + 0x192D0
	ldrb r1, [r3, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r4, r3, 0
	subs r4, 0x70
	adds r0, r4
	ldrb r1, [r0, 0x11]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x11]
	ldrb r1, [r3, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0xD]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _080B8B4C
	adds r0, r1, 0
	movs r1, 0x24
	bl SetContestantStatusUnk13
	b _080B8B54
	.align 2, 0
_080B8B48: .4byte gSharedMem + 0x192D0
_080B8B4C:
	adds r0, r1, 0
	movs r1, 0x3B
	bl SetContestantStatusUnk13
_080B8B54:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_39

	thumb_func_start ContestEffect_40
ContestEffect_40: @ 80B8B5C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r1, _080B8BE4 @ =gSharedMem + 0x19204
	ldrb r0, [r1, 0x1]
	cmp r0, 0x4
	bne _080B8B6E
	b _080B8C76
_080B8B6E:
	movs r6, 0
	adds r7, r1, 0
	adds r7, 0xCC
	adds r3, r1, 0
	adds r3, 0x5C
_080B8B78:
	lsls r1, r6, 24
	asrs r1, 24
	mov r0, sp
	adds r2, r0, r1
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x19]
	strb r0, [r2]
	adds r1, 0x1
	lsls r1, 24
	lsrs r6, r1, 24
	asrs r1, 24
	cmp r1, 0x3
	ble _080B8B78
	ldrb r0, [r7, 0x11]
	mov r2, sp
	adds r1, r2, r0
	movs r0, 0xFF
	strb r0, [r1]
	movs r6, 0
	mov r12, r7
	movs r4, 0x70
	negs r4, r4
	adds r4, r7
	mov r8, r4
_080B8BAE:
	movs r5, 0
_080B8BB0:
	lsls r0, r5, 24
	asrs r2, r0, 24
	mov r0, r12
	ldrb r0, [r0, 0x11]
	cmp r2, r0
	beq _080B8BE8
	lsls r0, r6, 24
	asrs r3, r0, 24
	mov r1, sp
	adds r4, r1, r2
	ldrb r0, [r4]
	cmp r3, r0
	bne _080B8BE8
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	add r1, r8
	lsls r0, r3, 24
	lsrs r0, 24
	ldrb r1, [r1, 0x19]
	cmp r0, r1
	bne _080B8BE8
	adds r0, r3, 0x1
	strb r0, [r4]
	b _080B8BF8
	.align 2, 0
_080B8BE4: .4byte gSharedMem + 0x19204
_080B8BE8:
	lsls r0, r5, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r5, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _080B8BB0
_080B8BF8:
	cmp r5, 0x4
	beq _080B8C0C
	lsls r0, r6, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r6, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _080B8BAE
_080B8C0C:
	ldrb r0, [r7, 0x11]
	mov r4, sp
	adds r1, r4, r0
	movs r0, 0
	strb r0, [r1]
	ldrb r0, [r7, 0x11]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r3, r7, 0
	subs r3, 0x70
	adds r1, r3
	ldrb r2, [r1, 0x10]
	movs r0, 0x3F
	ands r0, r2
	movs r2, 0x40
	orrs r0, r2
	strb r0, [r1, 0x10]
	movs r6, 0
_080B8C32:
	lsls r1, r6, 24
	asrs r1, 24
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	mov r4, sp
	adds r2, r4, r1
	ldrb r2, [r2]
	strb r2, [r0, 0x19]
	adds r1, 0x1
	lsls r1, 24
	lsrs r6, r1, 24
	asrs r1, 24
	cmp r1, 0x3
	ble _080B8C32
	ldrb r0, [r7, 0x11]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r0, r7, 0
	subs r0, 0x70
	adds r1, r0
	ldrb r2, [r1, 0x11]
	movs r0, 0x4
	negs r0, r0
	ands r0, r2
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r1, 0x11]
	ldrb r0, [r7, 0x11]
	movs r1, 0x25
	bl SetContestantStatusUnk13
_080B8C76:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_40

	thumb_func_start ContestEffect_41
ContestEffect_41: @ 80B8C84
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	ldr r1, _080B8D14 @ =gSharedMem + 0x19204
	ldrb r0, [r1, 0x1]
	cmp r0, 0x4
	bne _080B8C98
	b _080B8DA6
_080B8C98:
	movs r6, 0
	adds r7, r1, 0
	adds r7, 0xCC
	adds r3, r1, 0
	adds r3, 0x5C
_080B8CA2:
	lsls r1, r6, 24
	asrs r1, 24
	mov r0, sp
	adds r2, r0, r1
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x19]
	strb r0, [r2]
	adds r1, 0x1
	lsls r1, 24
	lsrs r6, r1, 24
	asrs r1, 24
	cmp r1, 0x3
	ble _080B8CA2
	ldrb r0, [r7, 0x11]
	mov r2, sp
	adds r1, r2, r0
	movs r0, 0xFF
	strb r0, [r1]
	movs r6, 0x3
	mov r12, r7
	movs r4, 0x70
	negs r4, r4
	adds r4, r7
	mov r8, r4
	movs r0, 0x1
	negs r0, r0
	mov r9, r0
_080B8CDE:
	movs r5, 0
_080B8CE0:
	lsls r0, r5, 24
	asrs r2, r0, 24
	mov r1, r12
	ldrb r1, [r1, 0x11]
	cmp r2, r1
	beq _080B8D18
	lsls r0, r6, 24
	asrs r3, r0, 24
	mov r0, sp
	adds r4, r0, r2
	ldrb r1, [r4]
	cmp r3, r1
	bne _080B8D18
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	add r1, r8
	lsls r0, r3, 24
	lsrs r0, 24
	ldrb r1, [r1, 0x19]
	cmp r0, r1
	bne _080B8D18
	subs r0, r3, 0x1
	strb r0, [r4]
	b _080B8D28
	.align 2, 0
_080B8D14: .4byte gSharedMem + 0x19204
_080B8D18:
	lsls r0, r5, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r5, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _080B8CE0
_080B8D28:
	cmp r5, 0x4
	beq _080B8D3C
	lsls r0, r6, 24
	movs r4, 0xFF
	lsls r4, 24
	adds r0, r4
	lsrs r6, r0, 24
	asrs r0, 24
	cmp r0, r9
	bgt _080B8CDE
_080B8D3C:
	ldrb r0, [r7, 0x11]
	mov r2, sp
	adds r1, r2, r0
	movs r0, 0x3
	strb r0, [r1]
	ldrb r0, [r7, 0x11]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r3, r7, 0
	subs r3, 0x70
	adds r1, r3
	ldrb r2, [r1, 0x10]
	movs r0, 0x3F
	ands r0, r2
	movs r2, 0x40
	orrs r0, r2
	strb r0, [r1, 0x10]
	movs r6, 0
_080B8D62:
	lsls r1, r6, 24
	asrs r1, 24
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	mov r4, sp
	adds r2, r4, r1
	ldrb r2, [r2]
	strb r2, [r0, 0x19]
	adds r1, 0x1
	lsls r1, 24
	lsrs r6, r1, 24
	asrs r1, 24
	cmp r1, 0x3
	ble _080B8D62
	ldrb r0, [r7, 0x11]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r0, r7, 0
	subs r0, 0x70
	adds r1, r0
	ldrb r2, [r1, 0x11]
	movs r0, 0x4
	negs r0, r0
	ands r0, r2
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r1, 0x11]
	ldrb r0, [r7, 0x11]
	movs r1, 0x26
	bl SetContestantStatusUnk13
_080B8DA6:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_41

	thumb_func_start ContestEffect_42
ContestEffect_42: @ 80B8DB4
	bx lr
	thumb_func_end ContestEffect_42

	thumb_func_start ContestEffect_43
ContestEffect_43: @ 80B8DB8
	push {r4-r7,lr}
	sub sp, 0x8
	ldr r1, _080B8E30 @ =gSharedMem + 0x19204
	ldrb r0, [r1, 0x1]
	cmp r0, 0x4
	beq _080B8EAE
	movs r6, 0
	add r3, sp, 0x4
	adds r5, r1, 0
	adds r5, 0x5C
	adds r4, r3, 0
_080B8DCE:
	lsls r1, r6, 24
	asrs r1, 24
	mov r0, sp
	adds r2, r0, r1
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x19]
	strb r0, [r2]
	adds r0, r4, r1
	strb r6, [r0]
	adds r1, 0x1
	lsls r1, 24
	lsrs r6, r1, 24
	asrs r1, 24
	cmp r1, 0x3
	ble _080B8DCE
	movs r6, 0
	adds r7, r3, 0
_080B8DF6:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	lsls r2, r6, 24
	asrs r2, 24
	movs r1, 0x4
	subs r1, r2
	bl __modsi3
	lsls r0, 24
	lsrs r4, r0, 24
	movs r1, 0
_080B8E10:
	lsls r0, r1, 24
	asrs r2, r0, 24
	adds r3, r7, r2
	ldrb r1, [r3]
	adds r5, r0, 0
	cmp r1, 0xFF
	beq _080B8E3A
	cmp r4, 0
	bne _080B8E34
	mov r1, sp
	adds r0, r1, r2
	strb r6, [r0]
	movs r0, 0xFF
	strb r0, [r3]
	b _080B8E48
	.align 2, 0
_080B8E30: .4byte gSharedMem + 0x19204
_080B8E34:
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080B8E3A:
	movs r3, 0x80
	lsls r3, 17
	adds r0, r5, r3
	lsrs r1, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _080B8E10
_080B8E48:
	lsls r0, r6, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r6, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _080B8DF6
	movs r6, 0
	ldr r4, _080B8EB8 @ =gSharedMem + 0x192D0
	adds r7, r4, 0
	subs r7, 0x70
	movs r3, 0x3F
	mov r12, r3
	movs r5, 0x80
_080B8E66:
	lsls r2, r6, 24
	asrs r2, 24
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r7
	mov r3, sp
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1, 0x19]
	ldrb r3, [r1, 0x10]
	mov r0, r12
	ands r0, r3
	orrs r0, r5
	strb r0, [r1, 0x10]
	adds r2, 0x1
	lsls r2, 24
	lsrs r6, r2, 24
	asrs r2, 24
	cmp r2, 0x3
	ble _080B8E66
	ldrb r1, [r4, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r4, 0
	subs r1, 0x70
	adds r0, r1
	ldrb r1, [r0, 0x11]
	movs r2, 0x3
	orrs r1, r2
	strb r1, [r0, 0x11]
	ldrb r0, [r4, 0x11]
	movs r1, 0x27
	bl SetContestantStatusUnk13
_080B8EAE:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8EB8: .4byte gSharedMem + 0x192D0
	thumb_func_end ContestEffect_43

	thumb_func_start ContestEffect_44
ContestEffect_44: @ 80B8EBC
	push {lr}
	ldr r3, _080B8EF0 @ =gContestMoves
	ldr r1, _080B8EF4 @ =gSharedMem + 0x192D0
	ldrb r2, [r1, 0x11]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	subs r1, 0x70
	adds r2, r0, r1
	ldrh r0, [r2, 0x6]
	lsls r0, 3
	adds r0, r3
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	ldr r1, _080B8EF8 @ =gSpecialVar_ContestCategory
	lsrs r0, 29
	ldrh r1, [r1]
	cmp r0, r1
	beq _080B8EEA
	ldrb r0, [r2, 0x11]
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r2, 0x11]
_080B8EEA:
	pop {r0}
	bx r0
	.align 2, 0
_080B8EF0: .4byte gContestMoves
_080B8EF4: .4byte gSharedMem + 0x192D0
_080B8EF8: .4byte gSpecialVar_ContestCategory
	thumb_func_end ContestEffect_44

	thumb_func_start ContestEffect_45
ContestEffect_45: @ 80B8EFC
	push {r4-r7,lr}
	movs r7, 0
	movs r5, 0
	ldr r4, _080B8F34 @ =gSharedMem + 0x192D0
	movs r6, 0
_080B8F06:
	ldrb r0, [r4, 0x11]
	adds r0, r4
	adds r1, r5, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080B8F52
	adds r0, r4, 0
	subs r0, 0x70
	adds r1, r6, r0
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	cmp r0, 0
	ble _080B8F38
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r4, 0x4]
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	bl sub_80B9268
	b _080B8F3A
	.align 2, 0
_080B8F34: .4byte gSharedMem + 0x192D0
_080B8F38:
	movs r0, 0xA
_080B8F3A:
	strh r0, [r4, 0x4]
	strb r5, [r4, 0x8]
	movs r0, 0xFF
	strb r0, [r4, 0x9]
	bl sub_80B9120
	lsls r0, 24
	cmp r0, 0
	beq _080B8F52
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_080B8F52:
	adds r6, 0x1C
	adds r5, 0x1
	cmp r5, 0x3
	ble _080B8F06
	cmp r7, 0
	bne _080B8F68
	ldr r0, _080B8F78 @ =gSharedMem + 0x192D0
	ldrb r0, [r0, 0x11]
	movs r1, 0x36
	bl SetContestantStatusUnk14
_080B8F68:
	ldr r0, _080B8F78 @ =gSharedMem + 0x192D0
	ldrb r0, [r0, 0x11]
	movs r1, 0x30
	bl SetContestantStatusUnk13
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8F78: .4byte gSharedMem + 0x192D0
	thumb_func_end ContestEffect_45

	thumb_func_start ContestEffect_46
ContestEffect_46: @ 80B8F7C
	push {r4,lr}
	ldr r0, _080B8F98 @ =gSharedMem + 0x19204
	movs r1, 0x13
	ldrsb r1, [r0, r1]
	cmp r1, 0
	bne _080B8F9C
	movs r4, 0xA
	adds r0, 0xCC
	ldrb r0, [r0, 0x11]
	movs r1, 0x1A
	bl SetContestantStatusUnk13
	b _080B8FDE
	.align 2, 0
_080B8F98: .4byte gSharedMem + 0x19204
_080B8F9C:
	cmp r1, 0x1
	bne _080B8FAE
	movs r4, 0x14
	adds r0, 0xCC
	ldrb r0, [r0, 0x11]
	movs r1, 0x1B
	bl SetContestantStatusUnk13
	b _080B8FDE
_080B8FAE:
	cmp r1, 0x2
	bne _080B8FC0
	movs r4, 0x1E
	adds r0, 0xCC
	ldrb r0, [r0, 0x11]
	movs r1, 0x1C
	bl SetContestantStatusUnk13
	b _080B8FDE
_080B8FC0:
	cmp r1, 0x3
	bne _080B8FD2
	movs r4, 0x32
	adds r0, 0xCC
	ldrb r0, [r0, 0x11]
	movs r1, 0x1D
	bl SetContestantStatusUnk13
	b _080B8FDE
_080B8FD2:
	movs r4, 0x3C
	adds r0, 0xCC
	ldrb r0, [r0, 0x11]
	movs r1, 0x1E
	bl SetContestantStatusUnk13
_080B8FDE:
	ldr r0, _080B8FF4 @ =gSharedMem + 0x192D0
	ldrb r2, [r0, 0x11]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	subs r0, 0x70
	adds r1, r0
	strh r4, [r1, 0x2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8FF4: .4byte gSharedMem + 0x192D0
	thumb_func_end ContestEffect_46

	thumb_func_start ContestEffect_47
ContestEffect_47: @ 80B8FF8
	push {lr}
	ldr r3, _080B9034 @ =gSharedMem + 0x19328
	ldrb r2, [r3, 0x1]
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	bne _080B902E
	movs r0, 0x1
	orrs r2, r0
	movs r0, 0x58
	negs r0, r0
	adds r0, r3
	mov r12, r0
	ldrb r1, [r0, 0x11]
	movs r0, 0x7
	ands r0, r1
	lsls r0, 1
	movs r1, 0xF
	negs r1, r1
	ands r2, r1
	orrs r2, r0
	strb r2, [r3, 0x1]
	mov r1, r12
	ldrb r0, [r1, 0x11]
	movs r1, 0x3D
	bl SetContestantStatusUnk13
_080B902E:
	pop {r0}
	bx r0
	.align 2, 0
_080B9034: .4byte gSharedMem + 0x19328
	thumb_func_end ContestEffect_47

	thumb_func_start sub_80B9038
sub_80B9038: @ 80B9038
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r7, 0
	movs r5, 0
	ldr r4, _080B907C @ =gSharedMem + 0x192D0
	ldr r0, _080B9080 @ =gContestMoves
	mov r9, r0
	movs r6, 0
_080B9052:
	ldrb r0, [r4, 0x11]
	adds r0, r4
	adds r1, r5, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080B909A
	adds r0, r4, 0
	subs r0, 0x70
	adds r0, r6, r0
	ldrh r0, [r0, 0x6]
	lsls r0, 3
	add r0, r9
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	lsrs r0, 29
	cmp r8, r0
	bne _080B9084
	movs r0, 0x28
	b _080B9086
	.align 2, 0
_080B907C: .4byte gSharedMem + 0x192D0
_080B9080: .4byte gContestMoves
_080B9084:
	movs r0, 0xA
_080B9086:
	strh r0, [r4, 0x4]
	strb r5, [r4, 0x8]
	movs r0, 0xFF
	strb r0, [r4, 0x9]
	bl sub_80B9120
	lsls r0, 24
	cmp r0, 0
	beq _080B909A
	adds r7, 0x1
_080B909A:
	adds r6, 0x1C
	adds r5, 0x1
	cmp r5, 0x3
	ble _080B9052
	cmp r7, 0
	bne _080B90B0
	ldr r0, _080B90BC @ =gSharedMem + 0x192D0
	ldrb r0, [r0, 0x11]
	movs r1, 0x36
	bl SetContestantStatusUnk14
_080B90B0:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B90BC: .4byte gSharedMem + 0x192D0
	thumb_func_end sub_80B9038

	thumb_func_start sub_80B90C0
sub_80B90C0: @ 80B90C0
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _080B90EC @ =gSharedMem + 0x192D0
	adds r0, r2, 0
	adds r0, 0xD
	adds r0, r3, r0
	movs r1, 0x1
	strb r1, [r0]
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	subs r2, 0x70
	adds r2, r0, r2
	ldrb r1, [r2, 0x10]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080B90F0
	adds r0, r3, 0
	movs r1, 0x2D
	b _080B9116
	.align 2, 0
_080B90EC: .4byte gSharedMem + 0x192D0
_080B90F0:
	ldrb r0, [r2, 0x12]
	cmp r0, 0
	bne _080B910E
	ldrb r1, [r2, 0xB]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080B911A
	ldrb r1, [r2, 0xC]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0
	bne _080B911A
	movs r0, 0x1
	b _080B911C
_080B910E:
	subs r0, 0x1
	strb r0, [r2, 0x12]
	adds r0, r3, 0
	movs r1, 0x2C
_080B9116:
	bl SetContestantStatusUnk13
_080B911A:
	movs r0, 0
_080B911C:
	pop {r1}
	bx r1
	thumb_func_end sub_80B90C0

	thumb_func_start sub_80B9120
sub_80B9120: @ 80B9120
	push {r4-r7,lr}
	sub sp, 0xC
	mov r0, sp
	movs r1, 0
	movs r2, 0x8
	bl memset
	movs r7, 0
	ldr r1, _080B918C @ =gSharedMem + 0x192D0
	ldrb r0, [r1, 0x8]
	cmp r0, 0xFF
	beq _080B91D8
	adds r5, r1, 0
_080B913A:
	adds r0, r5, 0
	adds r0, 0x8
	adds r0, r7, r0
	ldrb r4, [r0]
	adds r6, r4, 0
	adds r0, r4, 0
	str r1, [sp, 0x8]
	bl sub_80B90C0
	lsls r0, 24
	ldr r1, [sp, 0x8]
	cmp r0, 0
	beq _080B91C8
	ldrh r0, [r1, 0x4]
	strh r0, [r1, 0x6]
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	subs r1, 0x70
	adds r2, r0, r1
	ldrb r1, [r2, 0x10]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080B9174
	movs r1, 0x6
	ldrsh r0, [r5, r1]
	lsls r0, 1
	strh r0, [r5, 0x6]
_080B9174:
	ldrb r0, [r2, 0x10]
	movs r3, 0x1
	ands r3, r0
	cmp r3, 0
	beq _080B9190
	movs r0, 0xA
	strh r0, [r5, 0x6]
	adds r0, r4, 0
	movs r1, 0x2F
	bl SetContestantStatusUnk13
	b _080B91C8
	.align 2, 0
_080B918C: .4byte gSharedMem + 0x192D0
_080B9190:
	ldrb r1, [r2, 0xF]
	ldrh r0, [r5, 0x6]
	subs r0, r1
	adds r1, r0, 0
	strh r0, [r5, 0x6]
	lsls r0, 16
	cmp r0, 0
	bgt _080B91AC
	strh r3, [r5, 0x6]
	adds r0, r4, 0
	movs r1, 0x2E
	bl SetContestantStatusUnk13
	b _080B91C8
_080B91AC:
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl sub_80B9200
	ldrb r1, [r5, 0x6]
	adds r0, r6, 0
	bl sub_80B141C
	lsls r0, r6, 1
	mov r2, sp
	adds r1, r2, r0
	ldrh r0, [r5, 0x6]
	strh r0, [r1]
_080B91C8:
	adds r7, 0x1
	ldr r1, _080B91E8 @ =gSharedMem + 0x192D0
	adds r0, r1, 0
	adds r0, 0x8
	adds r0, r7, r0
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080B913A
_080B91D8:
	movs r7, 0
	mov r1, sp
_080B91DC:
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080B91EC
	movs r0, 0x1
	b _080B91F6
	.align 2, 0
_080B91E8: .4byte gSharedMem + 0x192D0
_080B91EC:
	adds r1, 0x2
	adds r7, 0x1
	cmp r7, 0x3
	ble _080B91DC
	movs r0, 0
_080B91F6:
	add sp, 0xC
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80B9120

	thumb_func_start sub_80B9200
sub_80B9200: @ 80B9200
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, r0, 3
	subs r2, r0
	lsls r2, 2
	ldr r0, _080B9220 @ =gSharedMem + 0x19260
	adds r2, r0
	ldrh r0, [r2, 0x2]
	subs r0, r1
	strh r0, [r2, 0x2]
	ldrb r0, [r2, 0xE]
	adds r1, r0
	strb r1, [r2, 0xE]
	bx lr
	.align 2, 0
_080B9220: .4byte gSharedMem + 0x19260
	thumb_func_end sub_80B9200

	thumb_func_start sub_80B9224
sub_80B9224: @ 80B9224
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	asrs r4, r0, 16
	adds r0, r4, 0
	cmp r4, 0
	bge _080B9234
	negs r0, r4
_080B9234:
	movs r1, 0xA
	bl __modsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r4, 0
	bge _080B9252
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0
	beq _080B925C
	adds r0, r4, 0
	subs r0, 0xA
	adds r0, r1, r0
	b _080B9258
_080B9252:
	lsls r0, 16
	asrs r0, 16
	subs r0, r4, r0
_080B9258:
	lsls r0, 16
	lsrs r5, r0, 16
_080B925C:
	lsls r0, r5, 16
	asrs r0, 16
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80B9224

	thumb_func_start sub_80B9268
sub_80B9268: @ 80B9268
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	asrs r4, r0, 16
	adds r0, r4, 0
	cmp r4, 0
	bge _080B9278
	negs r0, r4
_080B9278:
	movs r1, 0xA
	bl __modsi3
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0
	beq _080B9290
	adds r0, r4, 0
	adds r0, 0xA
	subs r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
_080B9290:
	lsls r0, r5, 16
	asrs r0, 16
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80B9268

	.align 2, 0 @ Don't pad with nop.
