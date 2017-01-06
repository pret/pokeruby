	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start npc_before_player_of_type
npc_before_player_of_type: @ 810B2D4
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _0810B314 @ =gUnknown_0203923C
	adds r1, r4, 0x2
	adds r0, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	bl PlayerGetZCoord
	strb r0, [r4, 0x4]
	ldrh r0, [r4]
	ldrh r1, [r4, 0x2]
	ldrb r2, [r4, 0x4]
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810B318 @ =gMapObjects
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r2, r1, r2
	ldrb r0, [r2, 0x5]
	cmp r0, r5
	bne _0810B320
	ldr r1, _0810B31C @ =gScriptLastTalked
	ldrb r0, [r2, 0x8]
	strh r0, [r1]
	movs r0, 0x1
	b _0810B322
	.align 2, 0
_0810B314: .4byte gUnknown_0203923C
_0810B318: .4byte gMapObjects
_0810B31C: .4byte gScriptLastTalked
_0810B320:
	movs r0, 0
_0810B322:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end npc_before_player_of_type

	thumb_func_start oei_task_add
oei_task_add: @ 810B328
	push {lr}
	ldr r0, _0810B344 @ =gUnknown_0203923C
	adds r1, r0, 0x2
	bl GetXYCoordsOneStepInFrontOfPlayer
	ldr r0, _0810B348 @ =task08_080C9820
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0810B344: .4byte gUnknown_0203923C
_0810B348: .4byte task08_080C9820
	thumb_func_end oei_task_add

	thumb_func_start task08_080C9820
task08_080C9820: @ 810B34C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	bl ScriptContext2_Enable
	ldr r1, _0810B3A0 @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrb r1, [r1, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0810B3A4 @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _0810B382
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0810B3CE
_0810B382:
	ldr r0, _0810B3A8 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	cmp r0, 0x5
	bne _0810B3B4
	movs r0, 0x3B
	bl FieldEffectStart
	ldr r0, _0810B3AC @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _0810B3B0 @ =sub_810B428
	b _0810B3CC
	.align 2, 0
_0810B3A0: .4byte gPlayerAvatar
_0810B3A4: .4byte gMapObjects
_0810B3A8: .4byte gMapHeader
_0810B3AC: .4byte gTasks
_0810B3B0: .4byte sub_810B428
_0810B3B4:
	bl sub_8059BF4
	adds r0, r4, 0
	movs r1, 0x39
	bl FieldObjectSetSpecialAnim
	ldr r0, _0810B3D4 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _0810B3D8 @ =sub_810B3DC
_0810B3CC:
	str r0, [r1]
_0810B3CE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810B3D4: .4byte gTasks
_0810B3D8: .4byte sub_810B3DC
	thumb_func_end task08_080C9820

	thumb_func_start sub_810B3DC
sub_810B3DC: @ 810B3DC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0810B418 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0810B41C @ =gMapObjects
	adds r0, r1
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810B410
	movs r0, 0x3B
	bl FieldEffectStart
	ldr r0, _0810B420 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0810B424 @ =sub_810B428
	str r0, [r1]
_0810B410:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810B418: .4byte gPlayerAvatar
_0810B41C: .4byte gMapObjects
_0810B420: .4byte gTasks
_0810B424: .4byte sub_810B428
	thumb_func_end sub_810B3DC

	thumb_func_start sub_810B428
sub_810B428: @ 810B428
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0x6
	bl FieldEffectActiveListContains
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0810B4AC
	bl player_get_direction_lower_nybble
	ldr r6, _0810B4B4 @ =gUnknown_0202FF84
	lsls r0, 24
	lsrs r0, 24
	str r0, [r6, 0x4]
	cmp r0, 0x1
	bne _0810B44E
	str r4, [r6, 0x8]
_0810B44E:
	ldr r1, [r6, 0x4]
	cmp r1, 0x2
	bne _0810B458
	movs r0, 0x1
	str r0, [r6, 0x8]
_0810B458:
	cmp r1, 0x3
	bne _0810B460
	movs r0, 0x2
	str r0, [r6, 0x8]
_0810B460:
	cmp r1, 0x4
	bne _0810B468
	movs r0, 0x3
	str r0, [r6, 0x8]
_0810B468:
	ldr r5, _0810B4B8 @ =gPlayerAvatar
	ldrb r0, [r5, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _0810B4BC @ =gMapObjects
	adds r4, r0
	bl GetPlayerAvatarGraphicsIdByCurrentState
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0810B4C0 @ =gSprites
	adds r0, r1
	ldrb r1, [r6, 0x8]
	bl StartSpriteAnim
	movs r0, 0x6
	bl FieldEffectActiveListRemove
	ldr r1, _0810B4C4 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810B4C8 @ =sub_810B4CC
	str r1, [r0]
_0810B4AC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810B4B4: .4byte gUnknown_0202FF84
_0810B4B8: .4byte gPlayerAvatar
_0810B4BC: .4byte gMapObjects
_0810B4C0: .4byte gSprites
_0810B4C4: .4byte gTasks
_0810B4C8: .4byte sub_810B4CC
	thumb_func_end sub_810B428

	thumb_func_start sub_810B4CC
sub_810B4CC: @ 810B4CC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0810B4FC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x18]
	lsls r1, 16
	ldrh r0, [r0, 0x1A]
	orrs r1, r0
	bl _call_via_r1
	ldr r1, _0810B500 @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r1, 0x6]
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810B4FC: .4byte gTasks
_0810B500: .4byte gPlayerAvatar
	thumb_func_end sub_810B4CC

	thumb_func_start SetUpFieldMove_RockSmash
SetUpFieldMove_RockSmash: @ 810B504
	push {lr}
	movs r0, 0x56
	bl npc_before_player_of_type
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810B518
	movs r0, 0
	b _0810B526
_0810B518:
	ldr r1, _0810B52C @ =gUnknown_0300485C
	ldr r0, _0810B530 @ =sub_808AB90
	str r0, [r1]
	ldr r1, _0810B534 @ =gUnknown_03005CE4
	ldr r0, _0810B538 @ =sub_810B53C
	str r0, [r1]
	movs r0, 0x1
_0810B526:
	pop {r1}
	bx r1
	.align 2, 0
_0810B52C: .4byte gUnknown_0300485C
_0810B530: .4byte sub_808AB90
_0810B534: .4byte gUnknown_03005CE4
_0810B538: .4byte sub_810B53C
	thumb_func_end SetUpFieldMove_RockSmash

	thumb_func_start sub_810B53C
sub_810B53C: @ 810B53C
	push {lr}
	ldr r1, _0810B550 @ =gUnknown_0202FF84
	ldr r0, _0810B554 @ =gUnknown_03005CE0
	ldrb r0, [r0]
	str r0, [r1]
	ldr r0, _0810B558 @ =UseRockSmashScript
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_0810B550: .4byte gUnknown_0202FF84
_0810B554: .4byte gUnknown_03005CE0
_0810B558: .4byte UseRockSmashScript
	thumb_func_end sub_810B53C

	thumb_func_start FldEff_RockSmash
FldEff_RockSmash: @ 810B55C
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810B584 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _0810B588 @ =sub_810B58C
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0x13
	bl IncrementGameStat
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0810B584: .4byte gTasks
_0810B588: .4byte sub_810B58C
	thumb_func_end FldEff_RockSmash

	thumb_func_start sub_810B58C
sub_810B58C: @ 810B58C
	push {lr}
	movs r0, 0x83
	bl PlaySE
	movs r0, 0x25
	bl FieldEffectActiveListRemove
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_810B58C

	thumb_func_start SetUpFieldMove_Dig
SetUpFieldMove_Dig: @ 810B5A4
	push {lr}
	bl sub_80CA1C8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810B5B6
	movs r0, 0
	b _0810B5C4
_0810B5B6:
	ldr r1, _0810B5C8 @ =gUnknown_0300485C
	ldr r0, _0810B5CC @ =sub_808AB90
	str r0, [r1]
	ldr r1, _0810B5D0 @ =gUnknown_03005CE4
	ldr r0, _0810B5D4 @ =sub_810B5D8
	str r0, [r1]
	movs r0, 0x1
_0810B5C4:
	pop {r1}
	bx r1
	.align 2, 0
_0810B5C8: .4byte gUnknown_0300485C
_0810B5CC: .4byte sub_808AB90
_0810B5D0: .4byte gUnknown_03005CE4
_0810B5D4: .4byte sub_810B5D8
	thumb_func_end SetUpFieldMove_Dig

	thumb_func_start sub_810B5D8
sub_810B5D8: @ 810B5D8
	push {lr}
	bl sub_8053014
	movs r0, 0x26
	bl FieldEffectStart
	ldr r0, _0810B5F0 @ =gUnknown_0202FF84
	ldr r1, _0810B5F4 @ =gUnknown_03005CE0
	ldrb r1, [r1]
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0810B5F0: .4byte gUnknown_0202FF84
_0810B5F4: .4byte gUnknown_03005CE0
	thumb_func_end sub_810B5D8

	thumb_func_start FldEff_UseDig
FldEff_UseDig: @ 810B5F8
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810B62C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _0810B630 @ =sub_810B634
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	bl ShouldDoBrailleDigEffect
	lsls r0, 24
	cmp r0, 0
	bne _0810B624
	movs r0, 0x1
	bl SetPlayerAvatarTransitionFlags
_0810B624:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0810B62C: .4byte gTasks
_0810B630: .4byte sub_810B634
	thumb_func_end FldEff_UseDig

	thumb_func_start sub_810B634
sub_810B634: @ 810B634
	push {r4,lr}
	movs r0, 0x26
	bl FieldEffectActiveListRemove
	bl ShouldDoBrailleDigEffect
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _0810B64E
	bl DoBrailleDigEffect
	b _0810B666
_0810B64E:
	ldr r0, _0810B66C @ =task08_080A1C44
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810B670 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
_0810B666:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810B66C: .4byte task08_080A1C44
_0810B670: .4byte gTasks
	thumb_func_end sub_810B634

	.align 2, 0 @ Don't pad with nop.
