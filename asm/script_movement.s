	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start exec_movement
exec_movement: @ 80A20D4
	push {r4,lr}
	sub sp, 0x4
	adds r4, r3, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	beq _080A20F6
	movs r0, 0x1
	b _080A211E
_080A20F6:
	ldr r0, _080A2128 @ =sub_80A244C
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _080A2108
	movs r0, 0x32
	bl sub_80A2198
_080A2108:
	bl sub_80A21E0
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	ldrb r1, [r1]
	adds r2, r4, 0
	bl sub_80A21F4
	lsls r0, 24
	lsrs r0, 24
_080A211E:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A2128: .4byte sub_80A244C
	thumb_func_end exec_movement

	thumb_func_start sub_80A212C
sub_80A212C: @ 80A212C
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _080A216E
	bl sub_80A21E0
	lsls r0, 24
	lsrs r4, r0, 24
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_80A2260
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x10
	beq _080A216E
	adds r0, r4, 0
	bl sub_80A2370
	lsls r0, 24
	lsrs r0, 24
	b _080A2170
_080A216E:
	movs r0, 0x1
_080A2170:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80A212C

	thumb_func_start sub_80A2178
sub_80A2178: @ 80A2178
	push {r4,lr}
	bl sub_80A21E0
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xFF
	beq _080A2192
	adds r0, r4, 0
	bl sub_80A2408
	adds r0, r4, 0
	bl DestroyTask
_080A2192:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A2178

	thumb_func_start sub_80A2198
sub_80A2198: @ 80A2198
	push {r4,r5,lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _080A21D4 @ =sub_80A244C
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x1
	lsls r1, r0, 2
	adds r1, r0
	lsls r3, r1, 3
	ldr r5, _080A21D8 @ =gTasks + 0x8
	ldr r0, _080A21DC @ =0x0000ffff
	adds r4, r0, 0
_080A21B8:
	lsls r0, r2, 1
	adds r0, r3
	adds r0, r5
	ldrh r1, [r0]
	orrs r1, r4
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _080A21B8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A21D4: .4byte sub_80A244C
_080A21D8: .4byte gTasks + 0x8
_080A21DC: .4byte 0x0000ffff
	thumb_func_end sub_80A2198

	thumb_func_start sub_80A21E0
sub_80A21E0: @ 80A21E0
	push {lr}
	ldr r0, _080A21F0 @ =sub_80A244C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080A21F0: .4byte sub_80A244C
	thumb_func_end sub_80A21E0

	thumb_func_start sub_80A21F4
sub_80A21F4: @ 80A21F4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r2
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, r5, 0
	lsls r1, 24
	lsrs r6, r1, 24
	mov r8, r6
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_80A2260
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x10
	beq _080A2230
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80A2370
	lsls r0, 24
	cmp r0, 0
	beq _080A2250
	adds r0, r5, 0
	adds r1, r4, 0
	adds r2, r6, 0
	b _080A2246
_080A2230:
	adds r0, r7, 0
	movs r1, 0xFF
	bl sub_80A2260
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x10
	beq _080A2250
	adds r0, r7, 0
	adds r1, r4, 0
	mov r2, r8
_080A2246:
	mov r3, r9
	bl sub_80A23C8
	movs r0, 0
	b _080A2252
_080A2250:
	movs r0, 0x1
_080A2252:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80A21F4

	thumb_func_start sub_80A2260
sub_80A2260: @ 80A2260
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080A2284 @ =gTasks + 0x8
	adds r1, r0
	adds r1, 0x2
	movs r2, 0
_080A2278:
	ldrb r0, [r1]
	cmp r0, r3
	bne _080A2288
	adds r0, r2, 0
	b _080A2296
	.align 2, 0
_080A2284: .4byte gTasks + 0x8
_080A2288:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	adds r1, 0x1
	cmp r2, 0xF
	bls _080A2278
	movs r0, 0x10
_080A2296:
	pop {r1}
	bx r1
	thumb_func_end sub_80A2260

	thumb_func_start sub_80A229C
sub_80A229C: @ 80A229C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080A22CC @ =gTasks + 0x8
	adds r1, r0
	adds r1, 0x2
	str r1, [r2]
	movs r0, 0
	cmp r0, r3
	bcs _080A22C8
_080A22BA:
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	adds r1, 0x1
	cmp r0, r3
	bcc _080A22BA
	str r1, [r2]
_080A22C8:
	pop {r0}
	bx r0
	.align 2, 0
_080A22CC: .4byte gTasks + 0x8
	thumb_func_end sub_80A229C

	thumb_func_start sub_80A22D0
sub_80A22D0: @ 80A22D0
	push {r4,lr}
	sub sp, 0x4
	adds r4, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r4, 24
	lsrs r4, 24
	mov r2, sp
	bl sub_80A229C
	ldr r0, [sp]
	strb r4, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A22D0

	thumb_func_start sub_80A22F4
sub_80A22F4: @ 80A22F4
	push {r4,lr}
	sub sp, 0x4
	adds r4, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r2, sp
	bl sub_80A229C
	ldr r0, [sp]
	ldrb r0, [r0]
	strb r0, [r4]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A22F4

	thumb_func_start sub_80A2318
sub_80A2318: @ 80A2318
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r2, _080A2340 @ =gBitTable
	lsrs r1, 22
	adds r1, r2
	ldr r2, [r1]
	mvns r2, r2
	lsls r2, 16
	lsrs r2, 16
	ldr r3, _080A2344 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	ldrh r0, [r1, 0x8]
	ands r2, r0
	strh r2, [r1, 0x8]
	bx lr
	.align 2, 0
_080A2340: .4byte gBitTable
_080A2344: .4byte gTasks
	thumb_func_end sub_80A2318

	thumb_func_start sub_80A2348
sub_80A2348: @ 80A2348
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r3, _080A2368 @ =gTasks
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r3
	ldr r0, _080A236C @ =gBitTable
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	ldrh r1, [r2, 0x8]
	orrs r0, r1
	strh r0, [r2, 0x8]
	bx lr
	.align 2, 0
_080A2368: .4byte gTasks
_080A236C: .4byte gBitTable
	thumb_func_end sub_80A2348

	thumb_func_start sub_80A2370
sub_80A2370: @ 80A2370
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r3, _080A2398 @ =gTasks
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r3
	ldr r0, _080A239C @ =gBitTable
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	ldrh r1, [r2, 0x8]
	ands r0, r1
	cmp r0, 0
	bne _080A23A0
	movs r0, 0
	b _080A23A2
	.align 2, 0
_080A2398: .4byte gTasks
_080A239C: .4byte gBitTable
_080A23A0:
	movs r0, 0x1
_080A23A2:
	pop {r1}
	bx r1
	thumb_func_end sub_80A2370

	thumb_func_start npc_obj_offscreen_culling_and_flag_update
npc_obj_offscreen_culling_and_flag_update: @ 80A23A8
	lsls r0, 24
	ldr r2, _080A23B4 @ =gUnknown_020384F8
	lsrs r0, 22
	adds r0, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_080A23B4: .4byte gUnknown_020384F8
	thumb_func_end npc_obj_offscreen_culling_and_flag_update

	thumb_func_start sub_80A23B8
sub_80A23B8: @ 80A23B8
	lsls r0, 24
	ldr r1, _080A23C4 @ =gUnknown_020384F8
	lsrs r0, 22
	adds r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080A23C4: .4byte gUnknown_020384F8
	thumb_func_end sub_80A23B8

	thumb_func_start sub_80A23C8
sub_80A23C8: @ 80A23C8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r6, r2, 0
	mov r8, r3
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80A2318
	adds r0, r4, 0
	mov r1, r8
	bl npc_obj_offscreen_culling_and_flag_update
	adds r0, r5, 0
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_80A22D0
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A23C8

	thumb_func_start sub_80A2408
sub_80A2408: @ 80A2408
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080A2444 @ =gTasks + 0x8
	adds r1, r0
	adds r4, r1, 0x2
	movs r5, 0
_080A241C:
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _080A2432
	adds r1, r0, 0
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080A2448 @ =gMapObjects
	adds r0, r1
	bl UnfreezeMapObject
_080A2432:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x1
	cmp r5, 0xF
	bls _080A241C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2444: .4byte gTasks + 0x8
_080A2448: .4byte gMapObjects
	thumb_func_end sub_80A2408

	thumb_func_start sub_80A244C
sub_80A244C: @ 80A244C
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	movs r5, 0
	mov r6, sp
_080A2458:
	adds r0, r7, 0
	adds r1, r5, 0
	mov r2, sp
	bl sub_80A22F4
	ldrb r0, [r6]
	cmp r0, 0xFF
	beq _080A247C
	adds r4, r0, 0
	adds r0, r5, 0
	bl sub_80A23B8
	adds r3, r0, 0
	adds r0, r7, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_80A2490
_080A247C:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xF
	bls _080A2458
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A244C

	thumb_func_start sub_80A2490
sub_80A2490: @ 80A2490
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r3, 0
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	mov r8, r6
	lsls r2, 24
	lsrs r2, 24
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r1, _080A24E0 @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _080A24C8
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080A24FA
_080A24C8:
	ldrb r1, [r5]
	cmp r1, 0xFE
	bne _080A24E4
	adds r0, r7, 0
	adds r1, r6, 0
	bl sub_80A2348
	adds r0, r4, 0
	bl FreezeMapObject
	b _080A24FA
	.align 2, 0
_080A24E0: .4byte gMapObjects
_080A24E4:
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	lsls r0, 24
	cmp r0, 0
	bne _080A24FA
	adds r5, 0x1
	mov r0, r8
	adds r1, r5, 0
	bl npc_obj_offscreen_culling_and_flag_update
_080A24FA:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A2490

	.align 2, 0 @ Don't pad with nop.
