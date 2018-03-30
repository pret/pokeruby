	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

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
