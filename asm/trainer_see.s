	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start CheckTrainers
CheckTrainers: @ 8083FBC
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _08083FEC @ =gMapObjects
_08083FC2:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r1, r0, r5
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _08083FF0
	ldrb r0, [r1, 0x7]
	cmp r0, 0x1
	beq _08083FDC
	cmp r0, 0x3
	bne _08083FF0
_08083FDC:
	adds r0, r4, 0
	bl CheckTrainer
	lsls r0, 24
	cmp r0, 0
	beq _08083FF0
	movs r0, 0x1
	b _08083FFC
	.align 2, 0
_08083FEC: .4byte gMapObjects
_08083FF0:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _08083FC2
	movs r0, 0
_08083FFC:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end CheckTrainers

	thumb_func_start CheckTrainer
CheckTrainer: @ 8084004
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r7, r4, 0
	adds r0, r4, 0
	bl GetFieldObjectScriptPointerByFieldObjectId
	adds r6, r0, 0
	bl GetTrainerFlagFromScriptPointer
	cmp r0, 0
	bne _08084034
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	ldr r1, _08084038 @ =gMapObjects
	adds r5, r0, r1
	adds r0, r5, 0
	bl TrainerCanApproachPlayer
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0808403C
_08084034:
	movs r0, 0
	b _08084052
	.align 2, 0
_08084038: .4byte gMapObjects
_0808403C:
	adds r0, r7, 0
	adds r1, r6, 0
	bl TrainerWantsBattle
	subs r1, r4, 0x1
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_80842C8
	movs r0, 0x1
_08084052:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckTrainer

	thumb_func_start TrainerCanApproachPlayer
TrainerCanApproachPlayer: @ 8084058
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r7, r0, 0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	ldrb r0, [r7, 0x7]
	mov r8, r4
	cmp r0, 0x1
	bne _080840B8
	ldr r1, _080840B0 @ =gUnknown_0839B488
	ldrb r0, [r7, 0x18]
	lsls r0, 28
	lsrs r0, 26
	subs r0, 0x4
	adds r0, r1
	ldrb r1, [r7, 0x1D]
	mov r2, sp
	movs r3, 0
	ldrsh r2, [r2, r3]
	movs r5, 0
	ldrsh r3, [r4, r5]
	ldr r4, [r0]
	adds r0, r7, 0
	bl _call_via_r4
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r2, [r7, 0x18]
	lsls r2, 28
	lsrs r2, 28
	adds r0, r7, 0
	adds r1, r6, 0
	bl CheckPathBetweenTrainerAndPlayer
	lsls r0, 24
	lsrs r0, 24
	b _080840F8
	.align 2, 0
_080840B0: .4byte gUnknown_0839B488
_080840B4:
	adds r0, r6, 0
	b _080840F8
_080840B8:
	movs r5, 0
_080840BA:
	ldr r0, _08084104 @ =gUnknown_0839B488
	lsls r4, r5, 2
	adds r4, r0
	ldrb r1, [r7, 0x1D]
	mov r0, sp
	movs r6, 0
	ldrsh r2, [r0, r6]
	mov r0, r8
	movs r6, 0
	ldrsh r3, [r0, r6]
	ldr r4, [r4]
	adds r0, r7, 0
	bl _call_via_r4
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl CheckPathBetweenTrainerAndPlayer
	lsls r0, 24
	cmp r0, 0
	bne _080840B4
	adds r5, r4, 0
	cmp r5, 0x3
	bls _080840BA
	movs r0, 0
_080840F8:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08084104: .4byte gUnknown_0839B488
	thumb_func_end TrainerCanApproachPlayer

	thumb_func_start IsTrainerInRangeSouth
IsTrainerInRangeSouth: @ 8084108
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r3, 16
	lsrs r5, r3, 16
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	lsls r2, 16
	asrs r2, 16
	cmp r0, r2
	bne _08084142
	lsls r0, r5, 16
	asrs r2, r0, 16
	ldrh r3, [r4, 0x12]
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r2, r0
	ble _08084142
	adds r1, r0, 0
	lsls r0, r6, 16
	asrs r0, 16
	adds r1, r0
	cmp r2, r1
	bgt _08084142
	subs r0, r5, r3
	lsls r0, 24
	lsrs r0, 24
	b _08084144
_08084142:
	movs r0, 0
_08084144:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end IsTrainerInRangeSouth

	thumb_func_start IsTrainerInRangeNorth
IsTrainerInRangeNorth: @ 808414C
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r3, 16
	lsrs r5, r3, 16
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	lsls r2, 16
	asrs r2, 16
	cmp r0, r2
	bne _08084186
	lsls r0, r5, 16
	asrs r2, r0, 16
	ldrh r3, [r4, 0x12]
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r2, r0
	bge _08084186
	adds r1, r0, 0
	lsls r0, r6, 16
	asrs r0, 16
	subs r1, r0
	cmp r2, r1
	blt _08084186
	subs r0, r3, r5
	lsls r0, 24
	lsrs r0, 24
	b _08084188
_08084186:
	movs r0, 0
_08084188:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end IsTrainerInRangeNorth

	thumb_func_start IsTrainerInRangeWest
IsTrainerInRangeWest: @ 8084190
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	lsls r3, 16
	asrs r3, 16
	cmp r0, r3
	bne _080841CA
	lsls r0, r5, 16
	asrs r3, r0, 16
	ldrh r2, [r4, 0x10]
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	bge _080841CA
	adds r1, r0, 0
	lsls r0, r6, 16
	asrs r0, 16
	subs r1, r0
	cmp r3, r1
	blt _080841CA
	subs r0, r2, r5
	lsls r0, 24
	lsrs r0, 24
	b _080841CC
_080841CA:
	movs r0, 0
_080841CC:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end IsTrainerInRangeWest

	thumb_func_start IsTrainerInRangeEast
IsTrainerInRangeEast: @ 80841D4
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	lsls r3, 16
	asrs r3, 16
	cmp r0, r3
	bne _0808420E
	lsls r0, r5, 16
	asrs r3, r0, 16
	ldrh r2, [r4, 0x10]
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	ble _0808420E
	adds r1, r0, 0
	lsls r0, r6, 16
	asrs r0, 16
	adds r1, r0
	cmp r3, r1
	bgt _0808420E
	subs r0, r5, r2
	lsls r0, 24
	lsrs r0, 24
	b _08084210
_0808420E:
	movs r0, 0
_08084210:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end IsTrainerInRangeEast

	thumb_func_start CheckPathBetweenTrainerAndPlayer
CheckPathBetweenTrainerAndPlayer: @ 8084218
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r6, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsrs r7, r2, 24
	cmp r1, 0
	beq _080842B2
	ldrh r1, [r6, 0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r6, 0x12]
	mov r1, sp
	adds r1, 0x2
	strh r0, [r1]
	movs r4, 0
	mov r8, r1
	mov r5, r9
	subs r5, 0x1
	cmp r4, r5
	bgt _08084284
_0808424C:
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	mov r3, r8
	movs r0, 0
	ldrsh r2, [r3, r0]
	adds r0, r6, 0
	adds r3, r7, 0
	bl sub_8060024
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _08084270
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	bne _080842B2
_08084270:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r7, 0
	mov r1, sp
	mov r2, r8
	bl MoveCoords
	cmp r4, r5
	ble _0808424C
_08084284:
	ldrb r4, [r6, 0x19]
	lsls r5, r4, 28
	lsrs r5, 28
	lsrs r4, 4
	movs r0, 0
	strb r0, [r6, 0x19]
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	mov r3, r8
	movs r0, 0
	ldrsh r2, [r3, r0]
	adds r0, r6, 0
	adds r3, r7, 0
	bl npc_block_way
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r4, 4
	orrs r5, r4
	strb r5, [r6, 0x19]
	cmp r1, 0x4
	beq _080842B6
_080842B2:
	movs r0, 0
	b _080842B8
_080842B6:
	mov r0, r9
_080842B8:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckPathBetweenTrainerAndPlayer

	thumb_func_start sub_80842C8
sub_80842C8: @ 80842C8
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	ldr r0, _080842F4 @ =sub_808433C
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080842F8 @ =gTasks
	adds r1, r0
	lsrs r0, r5, 16
	strh r0, [r1, 0xA]
	strh r5, [r1, 0xC]
	strh r4, [r1, 0xE]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080842F4: .4byte sub_808433C
_080842F8: .4byte gTasks
	thumb_func_end sub_80842C8

	thumb_func_start sub_80842FC
sub_80842FC: @ 80842FC
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r5, _08084334 @ =sub_808433C
	adds r0, r5, 0
	bl FindTaskIdByFunc
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl SetTaskFuncWithFollowupFunc
	ldr r1, _08084338 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0, 0x8]
	adds r0, r4, 0
	bl _call_via_r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08084334: .4byte sub_808433C
_08084338: .4byte gTasks
	thumb_func_end sub_80842FC

	thumb_func_start sub_808433C
sub_808433C: @ 808433C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _08084368 @ =gTasks
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	lsls r5, r0, 16
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	orrs r5, r0
	ldrb r0, [r5]
	lsls r0, 31
	cmp r0, 0
	bne _0808436C
	adds r0, r6, 0
	bl SwitchTaskToFollowupFunc
	b _08084388
	.align 2, 0
_08084368: .4byte gTasks
_0808436C:
	ldr r7, _08084390 @ =gUnknown_0839B498
_0808436E:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r7
	ldr r3, [r0]
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl _call_via_r3
	lsls r0, 24
	cmp r0, 0
	bne _0808436E
_08084388:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084390: .4byte gUnknown_0839B498
	thumb_func_end sub_808433C

	thumb_func_start sub_8084394
sub_8084394: @ 8084394
	movs r0, 0
	bx lr
	thumb_func_end sub_8084394

	thumb_func_start sub_8084398
sub_8084398: @ 8084398
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	ldr r1, _080843D8 @ =gUnknown_0202FF84
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	adds r0, r4, 0
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0
	bl FieldEffectStart
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080843D8: .4byte gUnknown_0202FF84
	thumb_func_end sub_8084398

	thumb_func_start sub_80843DC
sub_80843DC: @ 80843DC
	push {r4,r5,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	movs r0, 0
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	beq _080843F2
	movs r0, 0
	b _08084414
_080843F2:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldrb r0, [r5, 0x6]
	subs r0, 0x39
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08084408
	movs r0, 0x6
	strh r0, [r4, 0x8]
_08084408:
	ldrb r0, [r5, 0x6]
	cmp r0, 0x3F
	bne _08084412
	movs r0, 0x8
	strh r0, [r4, 0x8]
_08084412:
	movs r0, 0x1
_08084414:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80843DC

	thumb_func_start sub_808441C
sub_808441C: @ 808441C
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _0808443A
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0808446E
_0808443A:
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08084460
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetGoSpeed0AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0xE]
	subs r0, 0x1
	strh r0, [r5, 0xE]
	b _0808446E
_08084460:
	adds r0, r4, 0
	movs r1, 0x3E
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_0808446E:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_808441C

	thumb_func_start sub_8084478
sub_8084478: @ 8084478
	push {r4-r6,lr}
	adds r6, r1, 0
	adds r5, r2, 0
	adds r0, r5, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08084496
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08084524
_08084496:
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl npc_running_behaviour_by_direction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl npc_set_running_behaviour_etc
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl npc_running_behaviour_by_direction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_805C774
	adds r0, r5, 0
	bl sub_805C754
	ldr r0, _0808452C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08084530 @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _080844EE
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08084524
_080844EE:
	bl sub_80597E8
	ldr r0, _0808452C @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08084530 @ =gMapObjects
	adds r4, r0
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetOppositeDirection
	lsls r0, 24
	lsrs r0, 24
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_08084524:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808452C: .4byte gPlayerAvatar
_08084530: .4byte gMapObjects
	thumb_func_end sub_8084478

	thumb_func_start sub_8084534
sub_8084534: @ 8084534
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08084570 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08084574 @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08084560
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08084566
_08084560:
	adds r0, r5, 0
	bl SwitchTaskToFollowupFunc
_08084566:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08084570: .4byte gPlayerAvatar
_08084574: .4byte gMapObjects
	thumb_func_end sub_8084534

	thumb_func_start sub_8084578
sub_8084578: @ 8084578
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08084596
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080845A4
_08084596:
	adds r0, r4, 0
	movs r1, 0x59
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_080845A4:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8084578

	thumb_func_start sub_80845AC
sub_80845AC: @ 80845AC
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r2, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080845C0
	movs r0, 0x3
	strh r0, [r4, 0x8]
_080845C0:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80845AC

	thumb_func_start sub_80845C8
sub_80845C8: @ 80845C8
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _080845E6
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080845F4
_080845E6:
	adds r0, r4, 0
	movs r1, 0x3E
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_080845F4:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80845C8

	thumb_func_start sub_80845FC
sub_80845FC: @ 80845FC
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	adds r0, r4, 0
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	cmp r0, 0
	beq _08084642
	ldr r2, _0808464C @ =gUnknown_0202FF84
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	str r0, [r2]
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	str r0, [r2, 0x4]
	ldr r3, _08084650 @ =gSprites
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	str r0, [r2, 0x8]
	movs r0, 0x2
	str r0, [r2, 0xC]
	movs r0, 0x31
	bl FieldEffectStart
	strh r0, [r5, 0x10]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_08084642:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808464C: .4byte gUnknown_0202FF84
_08084650: .4byte gSprites
	thumb_func_end sub_80845FC

	thumb_func_start sub_8084654
sub_8084654: @ 8084654
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	ldr r2, _080846C4 @ =gSprites
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x2B
	ldrb r0, [r1]
	cmp r0, 0x2
	bne _080846BC
	ldrb r1, [r4, 0x3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x3]
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0, 0x5]
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_806084C
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_080846BC:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080846C4: .4byte gSprites
	thumb_func_end sub_8084654

	thumb_func_start sub_80846C8
sub_80846C8: @ 80846C8
	push {r4,lr}
	adds r4, r1, 0
	movs r0, 0x31
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _080846DC
	movs r0, 0x3
	strh r0, [r4, 0x8]
_080846DC:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80846C8

	thumb_func_start sub_80846E4
sub_80846E4: @ 80846E4
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08084778 @ =gTasks
	adds r4, r0, r1
	adds r0, r4, 0
	adds r0, 0xA
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08084716
	ldr r0, [sp]
	bl FieldObjectClearAnim
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
_08084716:
	ldr r1, _0808477C @ =gUnknown_0839B4C8
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r2, [sp]
	ldr r3, [r0]
	adds r0, r5, 0
	adds r1, r4, 0
	bl _call_via_r3
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	bne _08084780
	movs r0, 0x31
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08084780
	ldr r4, [sp]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl npc_running_behaviour_by_direction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl npc_set_running_behaviour_etc
	ldr r4, [sp]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl npc_running_behaviour_by_direction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805C774
	adds r0, r5, 0
	bl DestroyTask
	b _0808478A
	.align 2, 0
_08084778: .4byte gTasks
_0808477C: .4byte gUnknown_0839B4C8
_08084780:
	ldr r2, [sp]
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
_0808478A:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80846E4

	thumb_func_start sub_8084794
sub_8084794: @ 8084794
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080847C0 @ =sub_80846E4
	movs r1, 0
	bl CreateTask
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _080847C4 @ =gTasks + 0x8
	adds r0, r1
	adds r0, 0x2
	adds r1, r4, 0
	bl StoreWordInTwoHalfwords
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080847C0: .4byte sub_80846E4
_080847C4: .4byte gTasks + 0x8
	thumb_func_end sub_8084794

	thumb_func_start sub_80847C8
sub_80847C8: @ 80847C8
	push {lr}
	ldr r0, _080847D4 @ =sub_80847D8
	bl sub_80842FC
	pop {r0}
	bx r0
	.align 2, 0
_080847D4: .4byte sub_80847D8
	thumb_func_end sub_80847C8

	thumb_func_start sub_80847D8
sub_80847D8: @ 80847D8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_80847D8

	.align 2, 0 @ Don't pad with nop.
