	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_80C72A8
sub_80C72A8: @ 80C72A8
	push {lr}
	adds r0, 0x78
	movs r1, 0xB4
	bl __modsi3
	cmp r0, 0
	beq _080C72BA
	movs r0, 0
	b _080C72BE
_080C72BA:
	movs r0, 0x1
	negs r0, r0
_080C72BE:
	pop {r1}
	bx r1
	thumb_func_end sub_80C72A8

	thumb_func_start sub_80C72C4
sub_80C72C4: @ 80C72C4
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080C7364 @ =gTasks + 0x8
	adds r5, r1, r0
	movs r1, 0
	ldrsh r0, [r5, r1]
	adds r0, 0x1E
	bl sub_80C72A8
	ldr r4, _080C7368 @ =gSaveBlock1
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	lsls r0, 18
	movs r3, 0xC0
	lsls r3, 10
	orrs r0, r3
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x1
	movs r3, 0x3
	bl sub_805BD90
	movs r3, 0
	ldrsh r0, [r5, r3]
	bl sub_80C72A8
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	lsls r0, 17
	ldr r3, _080C736C @ =0xfffd0000
	adds r0, r3
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x2
	movs r3, 0
	bl sub_805BD90
	movs r1, 0
	ldrsh r0, [r5, r1]
	bl sub_80C72A8
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	movs r4, 0
	movs r3, 0x3
	negs r3, r3
	lsls r0, 18
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x3
	bl sub_805BD90
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	lsls r0, 16
	ldr r1, _080C7370 @ =0x75300000
	cmp r0, r1
	bne _080C7346
	strh r4, [r5]
_080C7346:
	movs r3, 0
	ldrsh r0, [r5, r3]
	bl GetTruckCameraBobbingY
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl SetCameraPanning
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C7364: .4byte gTasks + 0x8
_080C7368: .4byte gSaveBlock1
_080C736C: .4byte 0xfffd0000
_080C7370: .4byte 0x75300000
	thumb_func_end sub_80C72C4

	thumb_func_start sub_80C7374
sub_80C7374: @ 80C7374
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r3, r0, 3
	ldr r4, _080C73B4 @ =gTasks + 0x8
	adds r7, r3, r4
	ldrh r1, [r7]
	adds r1, 0x1
	strh r1, [r7]
	ldrh r0, [r7, 0x4]
	adds r0, 0x1
	strh r0, [r7, 0x4]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x5
	ble _080C73A4
	movs r0, 0
	strh r0, [r7]
	ldrh r0, [r7, 0x2]
	adds r0, 0x1
	strh r0, [r7, 0x2]
_080C73A4:
	ldrh r0, [r7, 0x2]
	cmp r0, 0x13
	bne _080C73B8
	adds r0, r2, 0
	bl DestroyTask
	b _080C746A
	.align 2, 0
_080C73B4: .4byte gTasks + 0x8
_080C73B8:
	ldr r2, _080C7474 @ =gUnknown_083D294C
	movs r1, 0x2
	ldrsh r0, [r7, r1]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x2
	bne _080C73D4
	adds r0, r4, 0
	subs r0, 0x8
	adds r0, r3, r0
	ldr r1, _080C7478 @ =sub_80C7484
	str r1, [r0]
_080C73D4:
	movs r4, 0x2
	ldrsh r0, [r7, r4]
	adds r0, r2
	movs r5, 0
	ldrsb r5, [r0, r5]
	lsls r5, 16
	lsrs r5, 16
	movs r1, 0x4
	ldrsh r0, [r7, r1]
	bl GetTruckCameraBobbingY
	adds r1, r0, 0
	lsls r5, 16
	asrs r5, 16
	lsls r1, 16
	asrs r1, 16
	adds r0, r5, 0
	bl SetCameraPanning
	movs r4, 0x4
	ldrsh r0, [r7, r4]
	adds r0, 0x1E
	bl sub_80C72A8
	ldr r6, _080C747C @ =gSaveBlock1
	ldrb r1, [r6, 0x5]
	ldrb r2, [r6, 0x4]
	movs r3, 0x3
	subs r3, r5
	lsls r3, 16
	asrs r3, 16
	lsls r0, 18
	movs r4, 0xC0
	lsls r4, 10
	orrs r0, r4
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x1
	bl sub_805BD90
	movs r1, 0x4
	ldrsh r0, [r7, r1]
	bl sub_80C72A8
	ldrb r1, [r6, 0x5]
	ldrb r2, [r6, 0x4]
	negs r3, r5
	lsls r3, 16
	asrs r3, 16
	lsls r0, 17
	ldr r4, _080C7480 @ =0xfffd0000
	adds r0, r4
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x2
	bl sub_805BD90
	movs r1, 0x4
	ldrsh r0, [r7, r1]
	bl sub_80C72A8
	ldrb r1, [r6, 0x5]
	ldrb r2, [r6, 0x4]
	movs r4, 0x3
	negs r4, r4
	adds r3, r4, 0
	subs r3, r5
	lsls r3, 16
	asrs r3, 16
	lsls r0, 18
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x3
	bl sub_805BD90
_080C746A:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C7474: .4byte gUnknown_083D294C
_080C7478: .4byte sub_80C7484
_080C747C: .4byte gSaveBlock1
_080C7480: .4byte 0xfffd0000
	thumb_func_end sub_80C7374

	thumb_func_start sub_80C7484
sub_80C7484: @ 80C7484
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r3, r0, 0
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	ldr r1, _080C74C4 @ =gTasks + 0x8
	adds r2, r0, r1
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080C74B4
	movs r0, 0
	strh r0, [r2]
	ldrh r0, [r2, 0x2]
	adds r0, 0x1
	strh r0, [r2, 0x2]
_080C74B4:
	ldrh r0, [r2, 0x2]
	cmp r0, 0x13
	bne _080C74C8
	adds r0, r3, 0
	bl DestroyTask
	b _080C7516
	.align 2, 0
_080C74C4: .4byte gTasks + 0x8
_080C74C8:
	ldr r1, _080C7524 @ =gUnknown_083D294C
	movs r3, 0x2
	ldrsh r0, [r2, r3]
	adds r0, r1
	movs r1, 0
	mov r8, r1
	movs r6, 0
	ldrsb r6, [r0, r6]
	adds r0, r6, 0
	bl SetCameraPanning
	ldr r5, _080C7528 @ =gSaveBlock1
	ldrb r1, [r5, 0x5]
	ldrb r2, [r5, 0x4]
	movs r3, 0x3
	subs r3, r6
	movs r0, 0x3
	str r0, [sp]
	movs r0, 0x1
	bl sub_805BD90
	ldrb r1, [r5, 0x5]
	ldrb r2, [r5, 0x4]
	negs r3, r6
	mov r4, r8
	subs r4, 0x3
	str r4, [sp]
	movs r0, 0x2
	bl sub_805BD90
	ldrb r1, [r5, 0x5]
	ldrb r2, [r5, 0x4]
	subs r4, r6
	mov r3, r8
	str r3, [sp]
	movs r0, 0x3
	adds r3, r4, 0
	bl sub_805BD90
_080C7516:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C7524: .4byte gUnknown_083D294C
_080C7528: .4byte gSaveBlock1
	thumb_func_end sub_80C7484

	thumb_func_start sub_80C752C
sub_80C752C: @ 80C752C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080C7550 @ =gTasks + 0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bls _080C7546
	b _080C7698
_080C7546:
	lsls r0, 2
	ldr r1, _080C7554 @ =_080C7558
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C7550: .4byte gTasks + 0x8
_080C7554: .4byte _080C7558
	.align 2, 0
_080C7558:
	.4byte _080C7570
	.4byte _080C75A8
	.4byte _080C75C4
	.4byte _080C7610
	.4byte _080C7634
	.4byte _080C7652
_080C7570:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5A
	beq _080C7580
	b _080C7698
_080C7580:
	movs r0, 0
	bl SetCameraPanningCallback
	movs r0, 0
	strh r0, [r4, 0x2]
	ldr r0, _080C75A4 @ =sub_80C72C4
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x4]
	movs r0, 0x1
	strh r0, [r4]
	movs r0, 0x31
	bl PlaySE
	b _080C7698
	.align 2, 0
_080C75A4: .4byte sub_80C72C4
_080C75A8:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x96
	bne _080C7698
	bl pal_fill_black
	movs r0, 0
	strh r0, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r4]
	b _080C7698
_080C75C4:
	ldrh r0, [r4, 0x2]
	adds r3, r0, 0x1
	strh r3, [r4, 0x2]
	ldr r0, _080C7608 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _080C7698
	lsls r1, r3, 16
	movs r0, 0x96
	lsls r0, 17
	cmp r1, r0
	ble _080C7698
	strh r2, [r4, 0x2]
	ldrb r0, [r4, 0x4]
	bl DestroyTask
	ldr r0, _080C760C @ =sub_80C7374
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x6]
	movs r0, 0x3
	strh r0, [r4]
	movs r0, 0x32
	bl PlaySE
	b _080C7698
	.align 2, 0
_080C7608: .4byte gPaletteFade
_080C760C: .4byte sub_80C7374
_080C7610:
	ldr r2, _080C7630 @ =gTasks
	movs r0, 0x6
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r5, [r0, 0x4]
	cmp r5, 0
	bne _080C7698
	bl InstallCameraPanAheadCallback
	strh r5, [r4, 0x2]
	movs r0, 0x4
	strh r0, [r4]
	b _080C7698
	.align 2, 0
_080C7630: .4byte gTasks
_080C7634:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5A
	bne _080C7698
	movs r0, 0x33
	bl PlaySE
	movs r0, 0
	strh r0, [r4, 0x2]
	movs r0, 0x5
	strh r0, [r4]
	b _080C7698
_080C7652:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x78
	bne _080C7698
	movs r2, 0x82
	lsls r2, 2
	movs r0, 0xB
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	movs r2, 0x84
	lsls r2, 2
	movs r0, 0xB
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	movs r2, 0x86
	lsls r2, 2
	movs r0, 0xB
	movs r1, 0xA
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	movs r0, 0x34
	bl PlaySE
	adds r0, r5, 0
	bl DestroyTask
	bl ScriptContext2_Disable
_080C7698:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C752C

	thumb_func_start sub_80C76A0
sub_80C76A0: @ 80C76A0
	push {lr}
	sub sp, 0x4
	ldr r2, _080C76E8 @ =0x0000020d
	movs r0, 0xB
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	ldr r2, _080C76EC @ =0x00000215
	movs r0, 0xB
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	ldr r2, _080C76F0 @ =0x0000021d
	movs r0, 0xB
	movs r1, 0xA
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	bl ScriptContext2_Enable
	movs r0, 0
	str r0, [sp]
	ldr r1, _080C76F4 @ =gPlttBufferFaded
	ldr r2, _080C76F8 @ =0x01000100
	mov r0, sp
	bl CpuFastSet
	ldr r0, _080C76FC @ =sub_80C752C
	movs r1, 0xA
	bl CreateTask
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080C76E8: .4byte 0x0000020d
_080C76EC: .4byte 0x00000215
_080C76F0: .4byte 0x0000021d
_080C76F4: .4byte gPlttBufferFaded
_080C76F8: .4byte 0x01000100
_080C76FC: .4byte sub_80C752C
	thumb_func_end sub_80C76A0

	thumb_func_start sub_80C7700
sub_80C7700: @ 80C7700
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r0, _080C774C @ =sub_80C752C
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	bne _080C7744
	ldr r4, _080C7750 @ =gSaveBlock1
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	movs r0, 0x3
	str r0, [sp]
	movs r0, 0x1
	movs r3, 0x3
	bl sub_805BD90
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	movs r5, 0x3
	negs r5, r5
	str r5, [sp]
	movs r0, 0x2
	movs r3, 0
	bl sub_805BD90
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	str r6, [sp]
	movs r0, 0x3
	adds r3, r5, 0
	bl sub_805BD90
_080C7744:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C774C: .4byte sub_80C752C
_080C7750: .4byte gSaveBlock1
	thumb_func_end sub_80C7700

	.align 2, 0 @ Don't pad with nop.
