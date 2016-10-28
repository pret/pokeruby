	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_806936C
sub_806936C: @ 806936C
	push {lr}
	movs r0, 0x1
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_806936C

	thumb_func_start sub_8069378
sub_8069378: @ 8069378
	push {lr}
	movs r0, 0x2
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_8069378

	thumb_func_start sub_8069384
sub_8069384: @ 8069384
	push {lr}
	movs r0, 0x3
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_8069384

	thumb_func_start sub_8069390
sub_8069390: @ 8069390
	push {lr}
	movs r0, 0x4
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_8069390

	thumb_func_start sub_806939C
sub_806939C: @ 806939C
	push {lr}
	movs r0, 0x5
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_806939C

	thumb_func_start sub_80693A8
sub_80693A8: @ 80693A8
	push {lr}
	movs r0, 0x6
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693A8

	thumb_func_start sub_80693B4
sub_80693B4: @ 80693B4
	push {lr}
	movs r0, 0x9
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693B4

	thumb_func_start sub_80693C0
sub_80693C0: @ 80693C0
	push {lr}
	movs r0, 0x7
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693C0

	thumb_func_start sub_80693CC
sub_80693CC: @ 80693CC
	push {lr}
	movs r0, 0x8
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693CC

	thumb_func_start sub_80693D8
sub_80693D8: @ 80693D8
	push {lr}
	movs r0, 0xB
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693D8

	thumb_func_start sub_80693E4
sub_80693E4: @ 80693E4
	push {lr}
	movs r0, 0xC
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693E4

	thumb_func_start sub_80693F0
sub_80693F0: @ 80693F0
	push {lr}
	movs r0, 0x14
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693F0

	thumb_func_start sub_80693FC
sub_80693FC: @ 80693FC
	push {lr}
	movs r0, 0x15
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693FC

	thumb_func_start sub_8069408
sub_8069408: @ 8069408
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r2, 0
	ldr r3, _08069428 @ =gUnknown_083762FC
_08069412:
	lsls r1, r2, 3
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r4
	bne _0806942C
	adds r0, r3, 0x4
	adds r0, r1, r0
	ldr r0, [r0]
	bl _call_via_r0
	b _08069436
	.align 2, 0
_08069428: .4byte gUnknown_083762FC
_0806942C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xC
	bls _08069412
_08069436:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8069408

	thumb_func_start task_per_step_callback_manager
task_per_step_callback_manager: @ 806943C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08069460 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x8
	ldrsh r1, [r1, r2]
	ldr r2, _08069464 @ =gUnknown_08376364
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08069460: .4byte gTasks
_08069464: .4byte gUnknown_08376364
	thumb_func_end task_per_step_callback_manager

	thumb_func_start sub_8069468
sub_8069468: @ 8069468
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0806947A
	cmp r0, 0x1
	beq _08069498
	b _080694AC
_0806947A:
	ldr r0, _08069494 @ =gMain
	ldr r0, [r0, 0x20]
	movs r1, 0x80
	lsls r1, 5
	ands r0, r1
	cmp r0, 0
	beq _080694AC
	bl DoTimeBasedEvents
	ldrh r0, [r4]
	adds r0, 0x1
	b _080694AA
	.align 2, 0
_08069494: .4byte gMain
_08069498:
	ldr r0, _080694B4 @ =gMain
	ldr r0, [r0, 0x20]
	movs r1, 0x80
	lsls r1, 5
	ands r0, r1
	cmp r0, 0
	bne _080694AC
	ldrh r0, [r4]
	subs r0, 0x1
_080694AA:
	strh r0, [r4]
_080694AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080694B4: .4byte gMain
	thumb_func_end sub_8069468

	thumb_func_start sub_80694B8
sub_80694B8: @ 80694B8
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080694E8 @ =gTasks + 0x8
	adds r4, r1, r0
	bl ScriptContext2_IsEnabled
	lsls r0, 24
	cmp r0, 0
	bne _080694E0
	adds r0, r4, 0
	bl sub_8069468
	adds r0, r4, 0x2
	adds r1, r4, 0x4
	bl sub_80540D0
_080694E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080694E8: .4byte gTasks + 0x8
	thumb_func_end sub_80694B8

	thumb_func_start overworld_ensure_per_step_coros_running
overworld_ensure_per_step_coros_running: @ 80694EC
	push {r4,r5,lr}
	ldr r5, _08069548 @ =task_per_step_callback_manager
	adds r0, r5, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08069516
	adds r0, r5, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806954C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
_08069516:
	ldr r4, _08069550 @ =sub_806A1E8
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _0806952C
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
_0806952C:
	ldr r4, _08069554 @ =sub_80694B8
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08069542
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
_08069542:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069548: .4byte task_per_step_callback_manager
_0806954C: .4byte gTasks
_08069550: .4byte sub_806A1E8
_08069554: .4byte sub_80694B8
	thumb_func_end overworld_ensure_per_step_coros_running

	thumb_func_start activate_per_step_callback
activate_per_step_callback: @ 8069558
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08069590 @ =task_per_step_callback_manager
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _0806959A
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _08069594 @ =gTasks + 0x8
	adds r1, r0, r1
	movs r2, 0
	adds r0, r1, 0
	adds r0, 0x1E
_0806957C:
	strh r2, [r0]
	subs r0, 0x2
	cmp r0, r1
	bge _0806957C
	cmp r4, 0x7
	bls _08069598
	movs r0, 0
	strh r0, [r1]
	b _0806959A
	.align 2, 0
_08069590: .4byte task_per_step_callback_manager
_08069594: .4byte gTasks + 0x8
_08069598:
	strh r4, [r1]
_0806959A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end activate_per_step_callback

	thumb_func_start wild_encounter_reset_coro_args
wild_encounter_reset_coro_args: @ 80695A0
	push {lr}
	ldr r0, _080695D0 @ =task_per_step_callback_manager
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _080695D4 @ =sub_80694B8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _080695CA
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _080695D8 @ =gTasks + 0x8
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x2]
	strh r1, [r0, 0x4]
_080695CA:
	pop {r0}
	bx r0
	.align 2, 0
_080695D0: .4byte task_per_step_callback_manager
_080695D4: .4byte sub_80694B8
_080695D8: .4byte gTasks + 0x8
	thumb_func_end wild_encounter_reset_coro_args

	thumb_func_start nullsub_51
nullsub_51: @ 80695DC
	bx lr
	thumb_func_end nullsub_51

	thumb_func_start sub_80695E0
sub_80695E0: @ 80695E0
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	adds r0, r4, 0
	bl sub_80576A0
	lsls r0, 24
	cmp r0, 0
	beq _080695F8
	adds r0, r5, 0
	b _08069630
_080695F8:
	adds r0, r4, 0
	bl sub_80576B4
	lsls r0, 24
	cmp r0, 0
	beq _0806960A
	adds r0, r5, 0
	adds r0, 0x8
	b _08069630
_0806960A:
	adds r0, r4, 0
	bl sub_80576C8
	lsls r0, 24
	cmp r0, 0
	beq _0806961C
	adds r0, r5, 0
	adds r0, 0x10
	b _08069630
_0806961C:
	adds r0, r4, 0
	bl sub_80576DC
	lsls r0, 24
	cmp r0, 0
	bne _0806962C
	movs r0, 0
	b _08069630
_0806962C:
	adds r0, r5, 0
	adds r0, 0x18
_08069630:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80695E0

	thumb_func_start sub_8069638
sub_8069638: @ 8069638
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	mov r8, r3
	lsls r1, 16
	asrs r6, r1, 16
	lsls r2, 16
	asrs r7, r2, 16
	adds r0, r6, 0
	adds r1, r7, 0
	bl MapGridGetMetatileBehaviorAt
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r5, 0
	bl sub_80695E0
	adds r4, r0, 0
	adds r5, r4, 0
	cmp r4, 0
	beq _080696B6
	movs r0, 0
	ldrsb r0, [r4, r0]
	adds r0, r6, r0
	movs r1, 0x1
	ldrsb r1, [r4, r1]
	adds r1, r7, r1
	ldrh r2, [r4, 0x2]
	bl MapGridSetMetatileIdAt
	mov r0, r8
	cmp r0, 0
	beq _0806968E
	movs r0, 0
	ldrsb r0, [r4, r0]
	adds r0, r6, r0
	movs r1, 0x1
	ldrsb r1, [r4, r1]
	adds r1, r7, r1
	bl CurrentMapDrawMetatileAt
_0806968E:
	movs r0, 0x4
	ldrsb r0, [r5, r0]
	adds r0, r6, r0
	movs r1, 0x5
	ldrsb r1, [r5, r1]
	adds r1, r7, r1
	ldrh r2, [r5, 0x6]
	bl MapGridSetMetatileIdAt
	mov r0, r8
	cmp r0, 0
	beq _080696B6
	movs r0, 0x4
	ldrsb r0, [r5, r0]
	adds r0, r6, r0
	movs r1, 0x5
	ldrsb r1, [r5, r1]
	adds r1, r7, r1
	bl CurrentMapDrawMetatileAt
_080696B6:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8069638

	thumb_func_start sub_80696C0
sub_80696C0: @ 80696C0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r3, r2, 0
	ldr r0, _080696E0 @ =gUnknown_08376384
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8069638
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080696E0: .4byte gUnknown_08376384
	thumb_func_end sub_80696C0

	thumb_func_start sub_80696E4
sub_80696E4: @ 80696E4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r3, r2, 0
	ldr r0, _08069704 @ =gUnknown_083763A4
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8069638
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069704: .4byte gUnknown_083763A4
	thumb_func_end sub_80696E4

	thumb_func_start sub_8069708
sub_8069708: @ 8069708
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r3, r2, 0
	ldr r0, _08069728 @ =gUnknown_083763C4
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8069638
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069728: .4byte gUnknown_083763C4
	thumb_func_end sub_8069708

	thumb_func_start sub_806972C
sub_806972C: @ 806972C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	mov r10, r8
	lsls r1, 16
	lsrs r7, r1, 16
	mov r9, r7
	lsls r2, 16
	asrs r6, r2, 16
	lsls r3, 16
	asrs r5, r3, 16
	adds r0, r6, 0
	adds r1, r5, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80576A0
	lsls r0, 24
	cmp r0, 0
	beq _08069770
	lsls r0, r7, 16
	asrs r0, 16
	cmp r0, r5
	ble _080697B6
_0806976C:
	movs r0, 0
	b _080697B8
_08069770:
	adds r0, r4, 0
	bl sub_80576B4
	lsls r0, 24
	cmp r0, 0
	beq _08069788
	mov r1, r9
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, r5
	bge _080697B6
	b _0806976C
_08069788:
	adds r0, r4, 0
	bl sub_80576C8
	lsls r0, 24
	cmp r0, 0
	beq _080697A0
	mov r1, r8
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, r6
	ble _080697B6
	b _0806976C
_080697A0:
	adds r0, r4, 0
	bl sub_80576DC
	lsls r0, 24
	cmp r0, 0
	beq _080697B6
	mov r1, r10
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, r6
	blt _0806976C
_080697B6:
	movs r0, 0x1
_080697B8:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_806972C

	thumb_func_start sub_80697C8
sub_80697C8: @ 80697C8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	mov r10, r8
	lsls r3, 16
	lsrs r7, r3, 16
	mov r9, r7
	lsls r0, 16
	asrs r6, r0, 16
	lsls r1, 16
	asrs r5, r1, 16
	adds r0, r6, 0
	adds r1, r5, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80576A0
	lsls r0, 24
	cmp r0, 0
	beq _0806980C
	lsls r0, r7, 16
	asrs r0, 16
	cmp r5, r0
	bge _08069852
_08069808:
	movs r0, 0
	b _08069854
_0806980C:
	adds r0, r4, 0
	bl sub_80576B4
	lsls r0, 24
	cmp r0, 0
	beq _08069824
	mov r1, r9
	lsls r0, r1, 16
	asrs r0, 16
	cmp r5, r0
	ble _08069852
	b _08069808
_08069824:
	adds r0, r4, 0
	bl sub_80576C8
	lsls r0, 24
	cmp r0, 0
	beq _0806983C
	mov r1, r8
	lsls r0, r1, 16
	asrs r0, 16
	cmp r6, r0
	bge _08069852
	b _08069808
_0806983C:
	adds r0, r4, 0
	bl sub_80576DC
	lsls r0, 24
	cmp r0, 0
	beq _08069852
	mov r1, r10
	lsls r0, r1, 16
	asrs r0, 16
	cmp r6, r0
	bgt _08069808
_08069852:
	movs r0, 0x1
_08069854:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80697C8

	thumb_func_start sub_8069864
sub_8069864: @ 8069864
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08069898 @ =gTasks + 0x8
	adds r4, r1, r0
	mov r5, sp
	adds r5, 0x2
	mov r0, sp
	adds r1, r5, 0
	bl PlayerGetDestCoords
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	adds r6, r5, 0
	cmp r0, 0x1
	beq _080698BE
	cmp r0, 0x1
	bgt _0806989C
	cmp r0, 0
	beq _080698A2
	b _080699CE
	.align 2, 0
_08069898: .4byte gTasks + 0x8
_0806989C:
	cmp r0, 0x2
	beq _0806998C
	b _080699CE
_080698A2:
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x4]
	ldrh r0, [r5]
	strh r0, [r4, 0x6]
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r3, 0
	ldrsh r1, [r5, r3]
	movs r2, 0x1
	bl sub_80696E4
	b _080699CA
_080698BE:
	mov r0, sp
	movs r7, 0
	ldrsh r1, [r0, r7]
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080698D8
	movs r3, 0
	ldrsh r1, [r5, r3]
	movs r7, 0x6
	ldrsh r0, [r4, r7]
	cmp r1, r0
	beq _080699CE
_080698D8:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r5, 0x6
	ldrsh r3, [r4, r5]
	bl sub_806972C
	cmp r0, 0
	beq _08069920
	movs r7, 0x4
	ldrsh r0, [r4, r7]
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	movs r2, 0x1
	bl sub_80696C0
	movs r3, 0x4
	ldrsh r0, [r4, r3]
	movs r5, 0x6
	ldrsh r1, [r4, r5]
	movs r2, 0
	bl sub_8069708
	ldrh r0, [r4, 0x4]
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0x6]
	strh r0, [r4, 0xA]
	movs r0, 0x2
	strh r0, [r4, 0x2]
	movs r0, 0x8
	strh r0, [r4, 0xC]
	b _0806992A
_08069920:
	movs r7, 0x1
	negs r7, r7
	adds r0, r7, 0
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xA]
_0806992A:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r5, r6, 0
	movs r2, 0
	ldrsh r1, [r5, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r7, 0x6
	ldrsh r3, [r4, r7]
	bl sub_80697C8
	cmp r0, 0
	beq _0806995E
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	movs r2, 0x1
	bl sub_80696C0
	movs r0, 0x2
	strh r0, [r4, 0x2]
	movs r0, 0x8
	strh r0, [r4, 0xC]
_0806995E:
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x4]
	ldrh r0, [r6]
	strh r0, [r4, 0x6]
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r5, 0
	ldrsh r1, [r6, r5]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsPacifidlogLog
	lsls r0, 24
	cmp r0, 0
	beq _080699CE
	movs r0, 0x46
	bl PlaySE
	b _080699CE
_0806998C:
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _080699CE
	mov r0, sp
	movs r7, 0
	ldrsh r0, [r0, r7]
	movs r2, 0
	ldrsh r1, [r5, r2]
	movs r2, 0x1
	bl sub_80696E4
	movs r3, 0x8
	ldrsh r0, [r4, r3]
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080699CA
	movs r5, 0xA
	ldrsh r0, [r4, r5]
	cmp r0, r1
	beq _080699CA
	movs r7, 0x8
	ldrsh r0, [r4, r7]
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	movs r2, 0x1
	bl sub_8069708
_080699CA:
	movs r0, 0x1
	strh r0, [r4, 0x2]
_080699CE:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8069864

	thumb_func_start sub_80699D8
sub_80699D8: @ 80699D8
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r5, r1, 16
	bl PlayerGetZCoord
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08069A32
	lsls r0, r4, 16
	asrs r4, r0, 16
	lsls r0, r5, 16
	asrs r5, r0, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	ldr r0, _08069A14 @ =0x0000024e
	cmp r1, r0
	beq _08069A18
	adds r0, 0x8
	cmp r1, r0
	beq _08069A28
	b _08069A32
	.align 2, 0
_08069A14: .4byte 0x0000024e
_08069A18:
	ldr r2, _08069A24 @ =0x0000024f
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
	b _08069A32
	.align 2, 0
_08069A24: .4byte 0x0000024f
_08069A28:
	ldr r2, _08069A38 @ =0x00000257
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
_08069A32:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069A38: .4byte 0x00000257
	thumb_func_end sub_80699D8

	thumb_func_start sub_8069A3C
sub_8069A3C: @ 8069A3C
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r5, r1, 16
	bl PlayerGetZCoord
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08069A96
	lsls r0, r4, 16
	asrs r4, r0, 16
	lsls r0, r5, 16
	asrs r5, r0, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	ldr r0, _08069A78 @ =0x0000024f
	cmp r1, r0
	beq _08069A7C
	adds r0, 0x8
	cmp r1, r0
	beq _08069A8C
	b _08069A96
	.align 2, 0
_08069A78: .4byte 0x0000024f
_08069A7C:
	ldr r2, _08069A88 @ =0x0000024e
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
	b _08069A96
	.align 2, 0
_08069A88: .4byte 0x0000024e
_08069A8C:
	ldr r2, _08069A9C @ =0x00000256
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
_08069A96:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069A9C: .4byte 0x00000256
	thumb_func_end sub_8069A3C

	thumb_func_start sub_8069AA0
sub_8069AA0: @ 8069AA0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08069ADC @ =gTasks + 0x8
	adds r6, r1, r0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	movs r0, 0x2
	ldrsh r5, [r6, r0]
	mov r9, r4
	cmp r5, 0x1
	beq _08069B34
	cmp r5, 0x1
	bgt _08069AE0
	cmp r5, 0
	beq _08069AE8
	b _08069CA6
	.align 2, 0
_08069ADC: .4byte gTasks + 0x8
_08069AE0:
	cmp r5, 0x2
	bne _08069AE6
	b _08069C14
_08069AE6:
	b _08069CA6
_08069AE8:
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r6, 0x4]
	mov r1, r9
	ldrh r0, [r1]
	strh r0, [r6, 0x6]
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r3, 0
	ldrsh r1, [r1, r3]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsFortreeBridge
	lsls r0, 24
	cmp r0, 0
	bne _08069B12
	b _08069CA2
_08069B12:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	mov r2, r9
	movs r3, 0
	ldrsh r1, [r2, r3]
	bl sub_80699D8
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	mov r2, r9
	movs r3, 0
	ldrsh r1, [r2, r3]
	bl CurrentMapDrawMetatileAt
	b _08069CA2
_08069B34:
	ldrh r0, [r6, 0x6]
	mov r8, r0
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	ldrh r2, [r6, 0x4]
	mov r10, r2
	movs r3, 0x4
	ldrsh r7, [r6, r3]
	cmp r0, r7
	bne _08069B5C
	mov r0, r9
	movs r2, 0
	ldrsh r1, [r0, r2]
	mov r3, r8
	lsls r0, r3, 16
	asrs r0, 16
	cmp r1, r0
	bne _08069B5C
	b _08069CA6
_08069B5C:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	mov r2, r9
	movs r3, 0
	ldrsh r1, [r2, r3]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsFortreeBridge
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	mov r0, r8
	lsls r4, r0, 16
	asrs r1, r4, 16
	adds r0, r7, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsFortreeBridge
	lsls r0, 24
	lsrs r7, r0, 24
	bl PlayerGetZCoord
	movs r1, 0
	ands r5, r0
	lsls r0, r5, 24
	adds r5, r4, 0
	cmp r0, 0
	bne _08069BA4
	movs r1, 0x1
_08069BA4:
	cmp r1, 0
	beq _08069BB8
	ldr r1, [sp, 0x4]
	cmp r1, 0x1
	beq _08069BB2
	cmp r7, 0x1
	bne _08069BB8
_08069BB2:
	movs r0, 0x47
	bl PlaySE
_08069BB8:
	cmp r7, 0
	beq _08069BF4
	mov r2, r10
	lsls r4, r2, 16
	asrs r4, 16
	asrs r5, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8069A3C
	adds r0, r4, 0
	adds r1, r5, 0
	bl CurrentMapDrawMetatileAt
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	mov r2, r9
	movs r3, 0
	ldrsh r1, [r2, r3]
	bl sub_80699D8
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	mov r2, r9
	movs r3, 0
	ldrsh r1, [r2, r3]
	bl CurrentMapDrawMetatileAt
_08069BF4:
	mov r0, r10
	strh r0, [r6, 0x8]
	mov r1, r8
	strh r1, [r6, 0xA]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r6, 0x4]
	mov r2, r9
	ldrh r0, [r2]
	strh r0, [r6, 0x6]
	cmp r7, 0
	beq _08069CA6
	movs r0, 0x10
	strh r0, [r6, 0xC]
	movs r0, 0x2
	strh r0, [r6, 0x2]
_08069C14:
	ldrh r0, [r6, 0xC]
	subs r0, 0x1
	strh r0, [r6, 0xC]
	ldrh r3, [r6, 0x8]
	mov r10, r3
	ldrh r0, [r6, 0xA]
	mov r8, r0
	movs r1, 0xC
	ldrsh r0, [r6, r1]
	movs r1, 0x7
	bl __modsi3
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	bhi _08069C9A
	lsls r0, 2
	ldr r1, _08069C40 @ =_08069C44
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08069C40: .4byte _08069C44
	.align 2, 0
_08069C44:
	.4byte _08069C64
	.4byte _08069C9A
	.4byte _08069C9A
	.4byte _08069C9A
	.4byte _08069C76
	.4byte _08069C9A
	.4byte _08069C9A
	.4byte _08069C9A
_08069C64:
	mov r2, r10
	lsls r0, r2, 16
	asrs r0, 16
	mov r3, r8
	lsls r1, r3, 16
	asrs r1, 16
	bl CurrentMapDrawMetatileAt
	b _08069C9A
_08069C76:
	mov r0, r10
	lsls r5, r0, 16
	asrs r5, 16
	mov r1, r8
	lsls r4, r1, 16
	asrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80699D8
	adds r0, r5, 0
	adds r1, r4, 0
	bl CurrentMapDrawMetatileAt
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8069A3C
_08069C9A:
	movs r2, 0xC
	ldrsh r0, [r6, r2]
	cmp r0, 0
	bne _08069CA6
_08069CA2:
	movs r0, 0x1
	strh r0, [r6, 0x2]
_08069CA6:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8069AA0

	thumb_func_start sub_8069CB8
sub_8069CB8: @ 8069CB8
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	lsls r0, 16
	ldr r2, _08069CE8 @ =0xfffd0000
	adds r0, r2
	lsrs r0, 16
	cmp r0, 0xA
	bhi _08069CF4
	lsls r0, r1, 16
	asrs r1, r0, 16
	ldr r2, _08069CEC @ =0xfffa0000
	adds r0, r2
	lsrs r0, 16
	cmp r0, 0xD
	bhi _08069CF4
	ldr r0, _08069CF0 @ =gUnknown_083763E4
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	beq _08069CF4
	movs r0, 0x1
	b _08069CF6
	.align 2, 0
_08069CE8: .4byte 0xfffd0000
_08069CEC: .4byte 0xfffa0000
_08069CF0: .4byte gUnknown_083763E4
_08069CF4:
	movs r0, 0
_08069CF6:
	pop {r1}
	bx r1
	thumb_func_end sub_8069CB8

	thumb_func_start sub_8069CFC
sub_8069CFC: @ 8069CFC
	push {r4,r5,lr}
	lsls r0, 16
	asrs r5, r0, 16
	lsls r1, 16
	asrs r4, r1, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8069CB8
	cmp r0, 0
	beq _08069D2A
	ldr r1, _08069D30 @ =gUnknown_083763E4
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	bl GetVarPointer
	subs r2, r5, 0x3
	movs r1, 0x1
	lsls r1, r2
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
_08069D2A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069D30: .4byte gUnknown_083763E4
	thumb_func_end sub_8069CFC

	thumb_func_start sub_8069D34
sub_8069D34: @ 8069D34
	push {r4,r5,lr}
	lsls r0, 16
	asrs r5, r0, 16
	lsls r1, 16
	asrs r4, r1, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8069CB8
	cmp r0, 0
	beq _08069D66
	ldr r1, _08069D6C @ =gUnknown_083763E4
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	bl VarGet
	lsls r0, 16
	subs r2, r5, 0x3
	movs r1, 0x80
	lsls r1, 9
	lsls r1, r2
	ands r1, r0
	cmp r1, 0
	bne _08069D70
_08069D66:
	movs r0, 0
	b _08069D72
	.align 2, 0
_08069D6C: .4byte gUnknown_083763E4
_08069D70:
	movs r0, 0x1
_08069D72:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8069D34

	thumb_func_start sub_8069D78
sub_8069D78: @ 8069D78
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _08069DCC @ =gMapHeader
	ldr r0, [r0]
	ldr r1, [r0]
	mov r9, r1
	ldr r7, [r0, 0x4]
	movs r5, 0
	cmp r5, r9
	bge _08069DC0
_08069D90:
	movs r4, 0
	adds r0, r5, 0x1
	mov r8, r0
	cmp r4, r7
	bge _08069DBA
	lsls r6, r5, 16
_08069D9C:
	lsls r1, r4, 16
	asrs r1, 16
	asrs r0, r6, 16
	bl sub_8069D34
	cmp r0, 0x1
	bne _08069DB4
	adds r1, r4, 0x7
	adds r0, r5, 0x7
	ldr r2, _08069DD0 @ =0x0000020e
	bl MapGridSetMetatileIdAt
_08069DB4:
	adds r4, 0x1
	cmp r4, r7
	blt _08069D9C
_08069DBA:
	mov r5, r8
	cmp r5, r9
	blt _08069D90
_08069DC0:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08069DCC: .4byte gMapHeader
_08069DD0: .4byte 0x0000020e
	thumb_func_end sub_8069D78

	thumb_func_start sub_8069DD4
sub_8069DD4: @ 8069DD4
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08069DF8 @ =gTasks + 0x8
	adds r5, r1, r0
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _08069E20
	cmp r0, 0x1
	bgt _08069DFC
	cmp r0, 0
	beq _08069E08
	b _08069F56
	.align 2, 0
_08069DF8: .4byte gTasks + 0x8
_08069DFC:
	cmp r0, 0x2
	beq _08069EB6
	cmp r0, 0x3
	bne _08069E06
	b _08069F10
_08069E06:
	b _08069F56
_08069E08:
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0x4]
	ldrh r0, [r4]
	strh r0, [r5, 0x6]
	b _08069F52
_08069E20:
	mov r7, sp
	adds r7, 0x2
	mov r0, sp
	adds r1, r7, 0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x4
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _08069E4A
	movs r0, 0
	ldrsh r1, [r7, r0]
	movs r3, 0x6
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _08069E4A
	b _08069F56
_08069E4A:
	strh r2, [r5, 0x4]
	ldrh r0, [r7]
	strh r0, [r5, 0x6]
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r7, r2]
	bl MapGridGetMetatileBehaviorAt
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _08069E8C @ =0x00004022
	bl GetVarPointer
	adds r6, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_8057540
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08069E90
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	movs r0, 0x4
	strh r0, [r5, 0xC]
	movs r0, 0x2
	b _08069EA8
	.align 2, 0
_08069E8C: .4byte 0x00004022
_08069E90:
	adds r0, r4, 0
	bl sub_8057554
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08069F56
	movs r0, 0
	strh r0, [r6]
	movs r0, 0x4
	strh r0, [r5, 0xC]
	movs r0, 0x3
_08069EA8:
	strh r0, [r5, 0x2]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0x8]
	ldrh r0, [r7]
	strh r0, [r5, 0xA]
	b _08069F56
_08069EB6:
	ldrh r1, [r5, 0xC]
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	cmp r0, 0
	bne _08069F1A
	mov r1, sp
	ldrh r0, [r5, 0x8]
	strh r0, [r1]
	mov r4, sp
	adds r4, 0x2
	ldrh r0, [r5, 0xA]
	strh r0, [r4]
	movs r0, 0x2A
	bl PlaySE
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _08069F0C @ =0x0000020e
	bl MapGridSetMetatileIdAt
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x7
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r4]
	subs r1, 0x7
	lsls r1, 16
	asrs r1, 16
	bl sub_8069CFC
	b _08069F52
	.align 2, 0
_08069F0C: .4byte 0x0000020e
_08069F10:
	ldrh r1, [r5, 0xC]
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	cmp r0, 0
	beq _08069F20
_08069F1A:
	subs r0, r1, 0x1
	strh r0, [r5, 0xC]
	b _08069F56
_08069F20:
	mov r1, sp
	ldrh r0, [r5, 0x8]
	strh r0, [r1]
	mov r4, sp
	adds r4, 0x2
	ldrh r0, [r5, 0xA]
	strh r0, [r4]
	movs r0, 0x29
	bl PlaySE
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _08069F60 @ =0x00000206
	bl MapGridSetMetatileIdAt
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
_08069F52:
	movs r0, 0x1
	strh r0, [r5, 0x2]
_08069F56:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08069F60: .4byte 0x00000206
	thumb_func_end sub_8069DD4

	thumb_func_start sub_8069F64
sub_8069F64: @ 8069F64
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08069FE8 @ =gTasks + 0x8
	adds r5, r1, r0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x2
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _08069F9E
	movs r0, 0
	ldrsh r1, [r4, r0]
	movs r3, 0x4
	ldrsh r0, [r5, r3]
	cmp r1, r0
	beq _0806A02A
_08069F9E:
	strh r2, [r5, 0x2]
	ldrh r0, [r4]
	strh r0, [r5, 0x4]
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsAsh
	lsls r0, 24
	cmp r0, 0
	beq _0806A02A
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileIdAt
	ldr r1, _08069FEC @ =0x0000020a
	cmp r0, r1
	bne _08069FF4
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _08069FF0 @ =0x00000212
	movs r3, 0x4
	bl ash
	b _0806A006
	.align 2, 0
_08069FE8: .4byte gTasks + 0x8
_08069FEC: .4byte 0x0000020a
_08069FF0: .4byte 0x00000212
_08069FF4:
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _0806A034 @ =0x00000206
	movs r3, 0x4
	bl ash
_0806A006:
	movs r0, 0x87
	lsls r0, 1
	movs r1, 0x1
	bl CheckBagHasItem
	lsls r0, 24
	cmp r0, 0
	beq _0806A02A
	ldr r0, _0806A038 @ =0x00004048
	bl GetVarPointer
	adds r2, r0, 0
	ldrh r1, [r2]
	ldr r0, _0806A03C @ =0x0000270e
	cmp r1, r0
	bhi _0806A02A
	adds r0, r1, 0x1
	strh r0, [r2]
_0806A02A:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A034: .4byte 0x00000206
_0806A038: .4byte 0x00004048
_0806A03C: .4byte 0x0000270e
	thumb_func_end sub_8069F64

	thumb_func_start sub_806A040
sub_806A040: @ 806A040
	push {r4,r5,lr}
	lsls r0, 16
	asrs r5, r0, 16
	lsls r1, 16
	asrs r4, r1, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridGetMetatileIdAt
	ldr r1, _0806A074 @ =0x0000022f
	ldr r2, _0806A078 @ =0x00000237
	cmp r0, r1
	bne _0806A05C
	subs r2, 0x31
_0806A05C:
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridSetMetatileIdAt
	adds r0, r5, 0
	adds r1, r4, 0
	bl CurrentMapDrawMetatileAt
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A074: .4byte 0x0000022f
_0806A078: .4byte 0x00000237
	thumb_func_end sub_806A040

	thumb_func_start sub_806A07C
sub_806A07C: @ 806A07C
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0806A164 @ =gTasks + 0x8
	adds r5, r1, r0
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
	lsls r0, 16
	lsrs r6, r0, 16
	ldrh r1, [r5, 0x8]
	movs r3, 0x8
	ldrsh r0, [r5, r3]
	adds r7, r4, 0
	cmp r0, 0
	beq _0806A0CE
	subs r0, r1, 0x1
	strh r0, [r5, 0x8]
	lsls r0, 16
	cmp r0, 0
	bne _0806A0CE
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	movs r2, 0xC
	ldrsh r1, [r5, r2]
	bl sub_806A040
_0806A0CE:
	ldrh r1, [r5, 0xE]
	movs r3, 0xE
	ldrsh r0, [r5, r3]
	cmp r0, 0
	beq _0806A0EE
	subs r0, r1, 0x1
	strh r0, [r5, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _0806A0EE
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	movs r2, 0x12
	ldrsh r1, [r5, r2]
	bl sub_806A040
_0806A0EE:
	lsls r0, r6, 24
	lsrs r6, r0, 24
	adds r0, r6, 0
	bl sub_8057818
	lsls r0, 24
	cmp r0, 0
	beq _0806A106
	ldr r0, _0806A168 @ =0x00004022
	movs r1, 0
	bl VarSet
_0806A106:
	mov r0, sp
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x4
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _0806A122
	movs r0, 0
	ldrsh r1, [r7, r0]
	movs r3, 0x6
	ldrsh r0, [r5, r3]
	cmp r1, r0
	beq _0806A182
_0806A122:
	strh r2, [r5, 0x4]
	adds r4, r7, 0
	ldrh r0, [r4]
	strh r0, [r5, 0x6]
	adds r0, r6, 0
	bl sub_805782C
	lsls r0, 24
	cmp r0, 0
	beq _0806A182
	bl sub_80E6034
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	beq _0806A14A
	ldr r0, _0806A168 @ =0x00004022
	movs r1, 0
	bl VarSet
_0806A14A:
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0806A16C
	movs r0, 0x3
	strh r0, [r5, 0x8]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0xA]
	ldrh r0, [r4]
	strh r0, [r5, 0xC]
	b _0806A182
	.align 2, 0
_0806A164: .4byte gTasks + 0x8
_0806A168: .4byte 0x00004022
_0806A16C:
	movs r2, 0xE
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bne _0806A182
	movs r0, 0x3
	strh r0, [r5, 0xE]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0x10]
	ldrh r0, [r7]
	strh r0, [r5, 0x12]
_0806A182:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806A07C

	thumb_func_start sub_806A18C
sub_806A18C: @ 806A18C
	push {r4,r5,lr}
	adds r3, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 16
	lsrs r4, r2, 16
	ldrh r0, [r3]
	subs r0, 0x1
	strh r0, [r3]
	lsls r0, 16
	cmp r0, 0
	bne _0806A1A8
	movs r2, 0xE8
	b _0806A1BC
_0806A1A8:
	ldr r1, _0806A1E4 @ =gUnknown_08376418
	movs r2, 0
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bge _0806A1B4
	adds r0, 0x7
_0806A1B4:
	asrs r0, 3
	lsls r0, 1
	adds r0, r1
	ldrh r2, [r0]
_0806A1BC:
	lsls r5, 16
	asrs r5, 16
	lsls r4, 16
	asrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridSetMetatileIdAt
	adds r0, r5, 0
	adds r1, r4, 0
	bl CurrentMapDrawMetatileAt
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0xE8
	bl MapGridSetMetatileIdAt
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A1E4: .4byte gUnknown_08376418
	thumb_func_end sub_806A18C

	thumb_func_start sub_806A1E8
sub_806A1E8: @ 806A1E8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0806A230 @ =gTasks + 0x8
	adds r4, r1, r0
	mov r5, sp
	adds r5, 0x2
	mov r0, sp
	adds r1, r5, 0
	bl PlayerGetDestCoords
	ldr r0, _0806A234 @ =gSaveBlock1
	movs r1, 0x4
	ldrsb r1, [r0, r1]
	lsls r1, 8
	ldrb r0, [r0, 0x5]
	lsls r0, 24
	asrs r0, 24
	orrs r0, r1
	lsls r0, 16
	lsrs r7, r0, 16
	movs r0, 0x2
	ldrsh r1, [r4, r0]
	mov r8, r5
	cmp r1, 0
	beq _0806A238
	cmp r1, 0x1
	beq _0806A264
	b _0806A2B8
	.align 2, 0
_0806A230: .4byte gTasks + 0x8
_0806A234: .4byte gSaveBlock1
_0806A238:
	strh r7, [r4]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x4]
	ldrh r0, [r5]
	strh r0, [r4, 0x6]
	movs r0, 0x1
	strh r0, [r4, 0x2]
	strh r1, [r4, 0x8]
	strh r1, [r4, 0xE]
	strh r1, [r4, 0x14]
	strh r1, [r4, 0x1A]
	b _0806A2B8
_0806A252:
	movs r0, 0x20
	strh r0, [r1]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r1, 0x2]
	mov r2, r8
	ldrh r0, [r2]
	strh r0, [r1, 0x4]
	b _0806A2B8
_0806A264:
	mov r0, sp
	movs r3, 0x4
	ldrsh r1, [r4, r3]
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bne _0806A280
	movs r0, 0x6
	ldrsh r1, [r4, r0]
	movs r3, 0
	ldrsh r0, [r5, r3]
	cmp r1, r0
	beq _0806A2B8
_0806A280:
	strh r2, [r4, 0x4]
	ldrh r0, [r5]
	strh r0, [r4, 0x6]
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsMuddySlope
	lsls r0, 24
	cmp r0, 0
	beq _0806A2B8
	movs r6, 0x4
	adds r1, r4, 0
	adds r1, 0x8
_0806A2A8:
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _0806A252
	adds r1, 0x6
	adds r6, 0x3
	cmp r6, 0xD
	ble _0806A2A8
_0806A2B8:
	ldr r2, _0806A2D4 @ =gUnknown_0202E844
	ldrb r1, [r2]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806A2D8
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r7, r0
	beq _0806A2D8
	strh r7, [r4]
	ldrh r0, [r2, 0x4]
	ldrh r1, [r2, 0x8]
	b _0806A2DC
	.align 2, 0
_0806A2D4: .4byte gUnknown_0202E844
_0806A2D8:
	movs r0, 0
	movs r1, 0
_0806A2DC:
	lsls r0, 16
	asrs r0, 16
	mov r8, r0
	lsls r0, r1, 16
	asrs r7, r0, 16
	adds r5, r4, 0
	adds r5, 0x8
	adds r4, r5, 0
	movs r6, 0x9
_0806A2EE:
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0806A312
	ldrh r0, [r4, 0x2]
	mov r3, r8
	subs r0, r3
	strh r0, [r4, 0x2]
	ldrh r0, [r4, 0x4]
	subs r0, r7
	strh r0, [r4, 0x4]
	movs r0, 0x2
	ldrsh r1, [r4, r0]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	adds r0, r5, 0
	bl sub_806A18C
_0806A312:
	adds r4, 0x6
	adds r5, 0x6
	subs r6, 0x3
	cmp r6, 0
	bge _0806A2EE
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806A1E8

	thumb_func_start sub_806A328
sub_806A328: @ 806A328
	push {lr}
	ldr r0, _0806A350 @ =0x00000835
	bl FlagSet
	bl RtcCalcLocalTime
	ldr r2, _0806A354 @ =gSaveBlock2
	adds r2, 0xA0
	ldr r3, _0806A358 @ =gLocalTime
	ldr r0, [r3]
	ldr r1, [r3, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _0806A35C @ =0x00004040
	ldrh r1, [r3]
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_0806A350: .4byte 0x00000835
_0806A354: .4byte gSaveBlock2
_0806A358: .4byte gLocalTime
_0806A35C: .4byte 0x00004040
	thumb_func_end sub_806A328

	thumb_func_start DoTimeBasedEvents
DoTimeBasedEvents: @ 806A360
	push {r4,lr}
	ldr r0, _0806A388 @ =0x00000835
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0806A380
	bl RtcCalcLocalTime
	ldr r4, _0806A38C @ =gLocalTime
	adds r0, r4, 0
	bl sub_806A390
	adds r0, r4, 0
	bl sub_806A3F4
_0806A380:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A388: .4byte 0x00000835
_0806A38C: .4byte gLocalTime
	thumb_func_end DoTimeBasedEvents

	thumb_func_start sub_806A390
sub_806A390: @ 806A390
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _0806A3F0 @ =0x00004040
	bl GetVarPointer
	adds r6, r0, 0
	ldrh r0, [r6]
	movs r2, 0
	ldrsh r1, [r5, r2]
	cmp r0, r1
	beq _0806A3EA
	cmp r0, r1
	bgt _0806A3EA
	ldrh r4, [r5]
	subs r4, r0
	lsls r4, 16
	lsrs r4, 16
	bl sub_80690B4
	adds r0, r4, 0
	bl sub_80FA220
	adds r0, r4, 0
	bl sub_80BE8C4
	adds r0, r4, 0
	bl sub_8080834
	adds r0, r4, 0
	bl UpdatePartyPokerusTime
	adds r0, r4, 0
	bl sub_810D2F4
	adds r0, r4, 0
	bl UpdateBirchState
	adds r0, r4, 0
	bl sub_810F618
	adds r0, r4, 0
	bl sub_8145AA4
	ldrh r0, [r5]
	strh r0, [r6]
_0806A3EA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A3F0: .4byte 0x00004040
	thumb_func_end sub_806A390

	thumb_func_start sub_806A3F4
sub_806A3F4: @ 806A3F4
	push {r4-r6,lr}
	sub sp, 0x8
	adds r5, r0, 0
	mov r4, sp
	ldr r6, _0806A448 @ =gSaveBlock2 + 0xA0
	mov r0, sp
	adds r1, r6, 0
	adds r2, r5, 0
	bl CalcTimeDifference
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 5
	movs r2, 0x2
	ldrsb r2, [r4, r2]
	lsls r0, r2, 4
	subs r0, r2
	lsls r0, 2
	adds r1, r0
	movs r0, 0x3
	ldrsb r0, [r4, r0]
	adds r0, r1, r0
	cmp r0, 0
	beq _0806A43E
	cmp r0, 0
	blt _0806A43E
	bl BerryTreeTimeUpdate
	ldr r0, [r5]
	ldr r1, [r5, 0x4]
	str r0, [r6]
	str r1, [r6, 0x4]
_0806A43E:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A448: .4byte gSaveBlock2 + 0xA0
	thumb_func_end sub_806A3F4

	thumb_func_start sub_806A44C
sub_806A44C: @ 806A44C
	push {lr}
	bl sub_806A328
	ldr r0, _0806A45C @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0806A45C: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_806A44C

	thumb_func_start sub_806A460
sub_806A460: @ 806A460
	push {lr}
	ldr r0, _0806A474 @ =Cb2_StartWallClock
	bl SetMainCallback2
	ldr r1, _0806A478 @ =gMain
	ldr r0, _0806A47C @ =sub_806A44C
	str r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_0806A474: .4byte Cb2_StartWallClock
_0806A478: .4byte gMain
_0806A47C: .4byte sub_806A44C
	thumb_func_end sub_806A460

	thumb_func_start sub_806A480
sub_806A480: @ 806A480
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
	thumb_func_end sub_806A480

	thumb_func_start sub_806A59C
sub_806A59C: @ 806A59C
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
	thumb_func_end sub_806A59C

	thumb_func_start sub_806A69C
sub_806A69C: @ 806A69C
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
	ldr r1, _0806A718 @ =sub_806A480
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
	ldr r1, _0806A720 @ =sub_806A59C
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
_0806A718: .4byte sub_806A480
_0806A71C: .4byte 0x0000ffff
_0806A720: .4byte sub_806A59C
	thumb_func_end sub_806A69C

	thumb_func_start sub_806A724
sub_806A724: @ 806A724
	push {lr}
	ldr r0, _0806A734 @ =gUnknown_083764BC
	ldrh r0, [r0, 0x4]
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	.align 2, 0
_0806A734: .4byte gUnknown_083764BC
	thumb_func_end sub_806A724

	thumb_func_start sub_806A738
sub_806A738: @ 806A738
	push {lr}
	movs r0, 0x3
	movs r1, 0x8
	movs r2, 0x19
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	thumb_func_end sub_806A738

	thumb_func_start sub_806A74C
sub_806A74C: @ 806A74C
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
	thumb_func_end sub_806A74C

	thumb_func_start sub_806A850
sub_806A850: @ 806A850
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
	bl sub_806A74C
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A8A8: .4byte gOtherText_OK
	thumb_func_end sub_806A850

	thumb_func_start sub_806A8AC
sub_806A8AC: @ 806A8AC
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
	thumb_func_end sub_806A8AC

	thumb_func_start sub_806A914
sub_806A914: @ 806A914
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
	thumb_func_end sub_806A914

	thumb_func_start sub_806A92C
sub_806A92C: @ 806A92C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_806A738
	bl sub_806A724
	ldr r1, _0806A950 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806A954 @ =sub_806A914
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A950: .4byte gTasks
_0806A954: .4byte sub_806A914
	thumb_func_end sub_806A92C

	thumb_func_start sub_806A958
sub_806A958: @ 806A958
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
	ldr r1, _0806A9A0 @ =gUnknown_08376414
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
	ldr r1, _0806A9A8 @ =sub_806A92C
	str r1, [r0]
	movs r0, 0
	strh r0, [r5, 0x2]
	movs r0, 0x6
	b _0806A9CC
	.align 2, 0
_0806A99C: .4byte gTasks + 0x8
_0806A9A0: .4byte gUnknown_08376414
_0806A9A4: .4byte gMain
_0806A9A8: .4byte sub_806A92C
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
	ldr r1, _0806AA20 @ =sub_806A92C
	str r1, [r0]
	strh r4, [r5, 0x2]
	movs r0, 0x6
	strh r0, [r5, 0x4]
	b _0806AA58
	.align 2, 0
_0806AA18: .4byte gLocalTime
_0806AA1C: .4byte gTasks
_0806AA20: .4byte sub_806A92C
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
	bl sub_806A8AC
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
	bl sub_806A74C
_0806AA58:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806A958

	thumb_func_start sub_806AA64
sub_806AA64: @ 806AA64
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
	bl sub_806A850
	adds r0, r5, 0
	bl sub_806A69C
	movs r0, 0x2
	strh r0, [r4, 0x4]
	movs r0, 0x8
	negs r0, r0
	add r8, r0
	add r6, r8
	ldr r0, _0806AAD4 @ =sub_806A958
	str r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806AACC: .4byte gTasks + 0x8
_0806AAD0: .4byte gLocalTime
_0806AAD4: .4byte sub_806A958
	thumb_func_end sub_806AA64

	thumb_func_start sub_806AAD8
sub_806AAD8: @ 806AAD8
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
	ldr r0, _0806ABA4 @ =sub_806ABC8
	bl SetVBlankCallback
	ldr r0, _0806ABA8 @ =sub_806ABB0
	bl SetMainCallback2
	ldr r0, _0806ABAC @ =sub_806ACCC
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
_0806ABA4: .4byte sub_806ABC8
_0806ABA8: .4byte sub_806ABB0
_0806ABAC: .4byte sub_806ACCC
	thumb_func_end sub_806AAD8

	thumb_func_start sub_806ABB0
sub_806ABB0: @ 806ABB0
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_806ABB0

	thumb_func_start sub_806ABC8
sub_806ABC8: @ 806ABC8
	push {lr}
	bl ProcessSpriteCopyRequests
	bl LoadOam
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_806ABC8

	thumb_func_start sub_806ABDC
sub_806ABDC: @ 806ABDC
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
	thumb_func_end sub_806ABDC

	thumb_func_start sub_806ABF4
sub_806ABF4: @ 806ABF4
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
	bl sub_806A74C
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
	bl sub_806A74C
	ldr r0, _0806ACA8 @ =gSystemText_ResetRTCPrompt
	bl sub_806ABDC
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
	thumb_func_end sub_806ABF4

	thumb_func_start sub_806ACCC
sub_806ACCC: @ 806ACCC
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
	bl sub_806ABDC
	movs r0, 0x5
	strh r0, [r5]
	b _0806AEC4
	.align 2, 0
_0806AD5C: .4byte gPaletteFade
_0806AD60: .4byte gSaveFileStatus
_0806AD64: .4byte gSystemText_NoSaveFileNoTime
_0806AD68:
	bl RtcCalcLocalTime
	ldr r0, _0806AD7C @ =sub_806ABF4
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x2]
	b _0806ADFC
	.align 2, 0
_0806AD7C: .4byte sub_806ABF4
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
	bl sub_806ABDC
	ldr r2, _0806ADCC @ =gLocalTime
	ldr r0, _0806ADD0 @ =gSaveBlock2
	adds r0, 0xA0
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _0806ADD4 @ =sub_806AA64
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
_0806ADD4: .4byte sub_806AA64
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
	bl sub_80691A0
	ldr r0, _0806AE58 @ =gSystemText_ClockResetDataSave
	bl sub_806ABDC
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
	bl sub_806ABDC
	movs r0, 0x49
	bl PlaySE
	b _0806AE88
	.align 2, 0
_0806AE78: .4byte gSystemText_SaveCompleted
_0806AE7C:
	ldr r0, _0806AECC @ =gSystemText_SaveFailed
	bl sub_806ABDC
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
	thumb_func_end sub_806ACCC

	.align 2, 0 @ Don't pad with nop.
