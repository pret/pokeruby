	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_8058378
sub_8058378: @ 8058378
	push {lr}
	ldr r1, _08058388 @ =0x06007f00
	movs r2, 0x40
	bl CpuFastSet
	pop {r0}
	bx r0
	.align 2, 0
_08058388: .4byte 0x06007f00
	thumb_func_end sub_8058378

	thumb_func_start door_build_blockdef
door_build_blockdef: @ 805838C
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	movs r4, 0
	adds r1, r6, 0
_08058398:
	ldrb r0, [r2]
	lsls r0, 28
	lsrs r3, r0, 16
	adds r2, 0x1
	adds r0, r5, r4
	orrs r3, r0
	strh r3, [r1]
	adds r1, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _08058398
	cmp r4, 0x7
	bgt _080583C6
	lsls r0, r4, 1
	adds r1, r0, r6
_080583B6:
	ldrb r0, [r2]
	lsls r3, r0, 12
	adds r2, 0x1
	strh r3, [r1]
	adds r1, 0x2
	adds r4, 0x1
	cmp r4, 0x7
	ble _080583B6
_080583C6:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end door_build_blockdef

	thumb_func_start sub_80583CC
sub_80583CC: @ 80583CC
	push {r4-r6,lr}
	sub sp, 0x10
	adds r5, r0, 0
	adds r6, r1, 0
	adds r4, r2, 0
	movs r1, 0xFE
	lsls r1, 2
	mov r0, sp
	bl door_build_blockdef
	subs r1, r6, 0x1
	adds r0, r5, 0
	mov r2, sp
	bl DrawDoorMetatileAt
	movs r1, 0xFF
	lsls r1, 2
	adds r4, 0x4
	mov r0, sp
	adds r2, r4, 0
	bl door_build_blockdef
	adds r0, r5, 0
	adds r1, r6, 0
	mov r2, sp
	bl DrawDoorMetatileAt
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80583CC

	thumb_func_start sub_805840C
sub_805840C: @ 805840C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	subs r1, r5, 0x1
	bl CurrentMapDrawMetatileAt
	adds r0, r4, 0
	adds r1, r5, 0
	bl CurrentMapDrawMetatileAt
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_805840C

	thumb_func_start sub_8058428
sub_8058428: @ 8058428
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r6, r2, 0
	adds r7, r3, 0
	ldrh r1, [r4, 0x2]
	ldr r0, _08058444 @ =0x0000ffff
	cmp r1, r0
	bne _08058448
	adds r0, r6, 0
	adds r1, r7, 0
	bl sub_805840C
	b _0805845C
	.align 2, 0
_08058444: .4byte 0x0000ffff
_08058448:
	ldrh r1, [r4, 0x2]
	ldr r0, [r5, 0x4]
	adds r0, r1
	bl sub_8058378
	ldr r2, [r5, 0x8]
	adds r0, r6, 0
	adds r1, r7, 0
	bl sub_80583CC
_0805845C:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8058428

	thumb_func_start sub_8058464
sub_8058464: @ 8058464
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	adds r4, r2, 0
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0805848A
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	lsls r1, 2
	adds r1, r5, r1
	movs r0, 0xC
	ldrsh r2, [r4, r0]
	movs r0, 0xE
	ldrsh r3, [r4, r0]
	adds r0, r6, 0
	bl sub_8058428
_0805848A:
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0]
	cmp r1, r0
	bne _080584B8
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0
	bne _080584BE
	movs r0, 0
	b _080584C0
_080584B8:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
_080584BE:
	movs r0, 0x1
_080584C0:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8058464

	thumb_func_start task50_overworld_door
task50_overworld_door: @ 80584C8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r2, r4, 2
	adds r2, r4
	lsls r2, 3
	ldr r0, _080584FC @ =gTasks + 0x8
	adds r2, r0
	ldrh r1, [r2]
	lsls r1, 16
	ldrh r0, [r2, 0x2]
	orrs r1, r0
	ldrh r0, [r2, 0x4]
	lsls r0, 16
	ldrh r3, [r2, 0x6]
	orrs r0, r3
	bl sub_8058464
	cmp r0, 0
	bne _080584F6
	adds r0, r4, 0
	bl DestroyTask
_080584F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080584FC: .4byte gTasks + 0x8
	thumb_func_end task50_overworld_door

	thumb_func_start door_frame_last
door_frame_last: @ 8058500
	push {lr}
	adds r1, r0, 0
	b _08058508
_08058506:
	adds r1, 0x4
_08058508:
	ldrb r0, [r1]
	cmp r0, 0
	bne _08058506
	subs r0, r1, 0x4
	pop {r1}
	bx r1
	thumb_func_end door_frame_last

	thumb_func_start door_find
door_find: @ 8058514
	push {lr}
	adds r2, r0, 0
	lsls r1, 16
	lsrs r1, 16
	b _0805852A
_0805851E:
	ldrh r0, [r2]
	cmp r0, r1
	bne _08058528
	adds r0, r2, 0
	b _08058532
_08058528:
	adds r2, 0xC
_0805852A:
	ldr r0, [r2, 0x4]
	cmp r0, 0
	bne _0805851E
	movs r0, 0
_08058532:
	pop {r1}
	bx r1
	thumb_func_end door_find

	thumb_func_start task_overworld_door_add_if_inactive
task_overworld_door_add_if_inactive: @ 8058538
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	adds r5, r1, 0
	adds r7, r2, 0
	mov r8, r3
	ldr r4, _08058584 @ =task50_overworld_door
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0805858C
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r2, _08058588 @ =gTasks + 0x8
	adds r1, r2
	strh r7, [r1, 0xC]
	mov r2, r8
	strh r2, [r1, 0xE]
	strh r5, [r1, 0x2]
	lsrs r2, r5, 16
	strh r2, [r1]
	strh r6, [r1, 0x6]
	lsrs r2, r6, 16
	strh r2, [r1, 0x4]
	lsls r0, 24
	asrs r0, 24
	b _08058590
	.align 2, 0
_08058584: .4byte task50_overworld_door
_08058588: .4byte gTasks + 0x8
_0805858C:
	movs r0, 0x1
	negs r0, r0
_08058590:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end task_overworld_door_add_if_inactive

	thumb_func_start sub_805859C
sub_805859C: @ 805859C
	push {lr}
	adds r0, r1, 0
	adds r1, r2, 0
	bl sub_805840C
	pop {r0}
	bx r0
	thumb_func_end sub_805859C

	thumb_func_start sub_80585AC
sub_80585AC: @ 80585AC
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	adds r0, r5, 0
	adds r1, r6, 0
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl door_find
	adds r4, r0, 0
	cmp r4, 0
	beq _080585E2
	ldr r1, _080585E8 @ =gUnknown_0830F87C
	adds r0, r1, 0
	bl door_frame_last
	adds r1, r0, 0
	adds r0, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl sub_8058428
_080585E2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080585E8: .4byte gUnknown_0830F87C
	thumb_func_end sub_80585AC

	thumb_func_start sub_80585EC
sub_80585EC: @ 80585EC
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	adds r0, r5, 0
	adds r1, r6, 0
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl door_find
	cmp r0, 0
	beq _08058620
	ldr r1, _0805861C @ =gUnknown_0830F87C
	adds r2, r5, 0
	adds r3, r6, 0
	bl task_overworld_door_add_if_inactive
	lsls r0, 24
	asrs r0, 24
	b _08058624
	.align 2, 0
_0805861C: .4byte gUnknown_0830F87C
_08058620:
	movs r0, 0x1
	negs r0, r0
_08058624:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80585EC

	thumb_func_start sub_805862C
sub_805862C: @ 805862C
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	adds r0, r5, 0
	adds r1, r6, 0
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl door_find
	cmp r0, 0
	beq _08058660
	ldr r1, _0805865C @ =gUnknown_0830F890
	adds r2, r5, 0
	adds r3, r6, 0
	bl task_overworld_door_add_if_inactive
	lsls r0, 24
	asrs r0, 24
	b _08058664
	.align 2, 0
_0805865C: .4byte gUnknown_0830F890
_08058660:
	movs r0, 0x1
	negs r0, r0
_08058664:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_805862C

	thumb_func_start cur_mapdata_get_door_x2_at
cur_mapdata_get_door_x2_at: @ 805866C
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	adds r1, r2, 0
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl door_find
	cmp r0, 0
	beq _08058690
	ldrb r0, [r0, 0x2]
	lsls r0, 24
	asrs r0, 24
	b _08058694
_08058690:
	movs r0, 0x1
	negs r0, r0
_08058694:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end cur_mapdata_get_door_x2_at

	thumb_func_start unref_sub_805869C
unref_sub_805869C: @ 805869C
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r0, _080586B0 @ =gDoorAnimGraphicsTable
	adds r1, r3, 0
	bl sub_80585EC
	pop {r0}
	bx r0
	.align 2, 0
_080586B0: .4byte gDoorAnimGraphicsTable
	thumb_func_end unref_sub_805869C

	thumb_func_start sub_80586B4
sub_80586B4: @ 80586B4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl sub_8056EAC
	lsls r0, 24
	cmp r0, 0
	beq _080586D6
	ldr r0, _080586DC @ =gDoorAnimGraphicsTable
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_80585AC
_080586D6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080586DC: .4byte gDoorAnimGraphicsTable
	thumb_func_end sub_80586B4

	thumb_func_start sub_80586E0
sub_80586E0: @ 80586E0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl sub_8056EAC
	lsls r0, 24
	cmp r0, 0
	beq _08058702
	ldr r0, _08058708 @ =gDoorAnimGraphicsTable
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_805859C
_08058702:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058708: .4byte gDoorAnimGraphicsTable
	thumb_func_end sub_80586E0

	thumb_func_start sub_805870C
sub_805870C: @ 805870C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl sub_8056EAC
	lsls r0, 24
	cmp r0, 0
	beq _08058738
	ldr r0, _08058734 @ =gDoorAnimGraphicsTable
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_805862C
	lsls r0, 24
	asrs r0, 24
	b _0805873C
	.align 2, 0
_08058734: .4byte gDoorAnimGraphicsTable
_08058738:
	movs r0, 0x1
	negs r0, r0
_0805873C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805870C

	thumb_func_start task_overworld_door_add_if_role_69_for_opening_door_at
task_overworld_door_add_if_role_69_for_opening_door_at: @ 8058744
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl sub_8056EAC
	lsls r0, 24
	cmp r0, 0
	beq _08058770
	ldr r0, _0805876C @ =gDoorAnimGraphicsTable
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_80585EC
	lsls r0, 24
	asrs r0, 24
	b _08058774
	.align 2, 0
_0805876C: .4byte gDoorAnimGraphicsTable
_08058770:
	movs r0, 0x1
	negs r0, r0
_08058774:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end task_overworld_door_add_if_role_69_for_opening_door_at

	thumb_func_start sub_805877C
sub_805877C: @ 805877C
	push {lr}
	ldr r0, _0805878C @ =task50_overworld_door
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0805878C: .4byte task50_overworld_door
	thumb_func_end sub_805877C

	thumb_func_start sub_8058790
sub_8058790: @ 8058790
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r0, _080587A8 @ =gDoorAnimGraphicsTable
	adds r1, r3, 0
	bl cur_mapdata_get_door_x2_at
	lsls r0, 24
	cmp r0, 0
	beq _080587AC
	movs r0, 0x12
	b _080587AE
	.align 2, 0
_080587A8: .4byte gDoorAnimGraphicsTable
_080587AC:
	movs r0, 0x8
_080587AE:
	pop {r1}
	bx r1
	thumb_func_end sub_8058790

	.align 2, 0 @ Don't pad with nop.
