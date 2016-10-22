	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start npc_before_player_of_type
npc_before_player_of_type: @ 810B2D4
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _0810B314
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
	ldr r2, _0810B318
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r2, r1, r2
	ldrb r0, [r2, 0x5]
	cmp r0, r5
	bne _0810B320
	ldr r1, _0810B31C
	ldrb r0, [r2, 0x8]
	strh r0, [r1]
	movs r0, 0x1
	b _0810B322
	.align 2, 0
_0810B314: .4byte gUnknown_0203923C
_0810B318: .4byte gMapObjects
_0810B31C: .4byte gUnknown_0202E8DE
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
	ldr r0, _0810B344
	adds r1, r0, 0x2
	bl GetXYCoordsOneStepInFrontOfPlayer
	ldr r0, _0810B348
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
	ldr r1, _0810B3A0
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrb r1, [r1, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0810B3A4
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
	ldr r0, _0810B3A8
	ldrb r0, [r0, 0x17]
	cmp r0, 0x5
	bne _0810B3B4
	movs r0, 0x3B
	bl FieldEffectStart
	ldr r0, _0810B3AC
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _0810B3B0
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
	ldr r0, _0810B3D4
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _0810B3D8
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
	ldr r0, _0810B418
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0810B41C
	adds r0, r1
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810B410
	movs r0, 0x3B
	bl FieldEffectStart
	ldr r0, _0810B420
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0810B424
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
	ldr r6, _0810B4B4
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
	ldr r5, _0810B4B8
	ldrb r0, [r5, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _0810B4BC
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
	ldr r1, _0810B4C0
	adds r0, r1
	ldrb r1, [r6, 0x8]
	bl StartSpriteAnim
	movs r0, 0x6
	bl FieldEffectActiveListRemove
	ldr r1, _0810B4C4
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810B4C8
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
	ldr r1, _0810B4FC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x18]
	lsls r1, 16
	ldrh r0, [r0, 0x1A]
	orrs r1, r0
	bl _call_via_r1
	ldr r1, _0810B500
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
	ldr r1, _0810B52C
	ldr r0, _0810B530
	str r0, [r1]
	ldr r1, _0810B534
	ldr r0, _0810B538
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
	ldr r1, _0810B550
	ldr r0, _0810B554
	ldrb r0, [r0]
	str r0, [r1]
	ldr r0, _0810B558
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
	ldr r2, _0810B584
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _0810B588
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0x13
	bl sav12_xor_increment
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
	ldr r1, _0810B5C8
	ldr r0, _0810B5CC
	str r0, [r1]
	ldr r1, _0810B5D0
	ldr r0, _0810B5D4
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
	ldr r0, _0810B5F0
	ldr r1, _0810B5F4
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
	ldr r2, _0810B62C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _0810B630
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	bl sub_81473B8
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
	bl sub_81473B8
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _0810B64E
	bl sub_8147408
	b _0810B666
_0810B64E:
	ldr r0, _0810B66C
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810B670
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

	thumb_func_start sub_810B674
sub_810B674: @ 810B674
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTasks
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_810B674

	thumb_func_start sub_810B68C
sub_810B68C: @ 810B68C
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	ldr r1, _0810B6B0
	ldr r2, _0810B6B4
	ldr r0, _0810B6B8
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0810B6BC
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_0810B6B0: .4byte gBG2TilemapBuffer
_0810B6B4: .4byte 0x06007800
_0810B6B8: .4byte 0x040000d4
_0810B6BC: .4byte 0x80000400
	thumb_func_end sub_810B68C

	thumb_func_start sub_810B6C0
sub_810B6C0: @ 810B6C0
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0810B6DC
	ldr r1, _0810B6E0
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x12
	bls _0810B6D2
	b _0810B960
_0810B6D2:
	lsls r0, 2
	ldr r1, _0810B6E4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810B6DC: .4byte gMain
_0810B6E0: .4byte 0x0000043c
_0810B6E4: .4byte _0810B6E8
	.align 2, 0
_0810B6E8:
	.4byte _0810B734
	.4byte _0810B764
	.4byte _0810B76A
	.4byte _0810B78C
	.4byte _0810B792
	.4byte _0810B7B4
	.4byte _0810B7C0
	.4byte _0810B7DC
	.4byte _0810B7E8
	.4byte _0810B804
	.4byte _0810B810
	.4byte _0810B830
	.4byte _0810B84C
	.4byte _0810B86A
	.4byte _0810B894
	.4byte _0810B89E
	.4byte _0810B8C4
	.4byte _0810B914
	.4byte _0810B934
_0810B734:
	bl sub_80F9438
	bl sub_80F9368
	ldr r1, _0810B754
	ldr r2, _0810B758
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x44
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0810B75C
	ldr r0, _0810B760
	adds r1, r0
	b _0810B922
	.align 2, 0
_0810B754: .4byte REG_BG2CNT
_0810B758: .4byte 0x00000f0a
_0810B75C: .4byte gMain
_0810B760: .4byte 0x0000043c
_0810B764:
	bl remove_some_task
	b _0810B91C
_0810B76A:
	bl ResetPaletteFade
	ldr r2, _0810B780
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r1, _0810B784
	ldr r0, _0810B788
	adds r1, r0
	b _0810B922
	.align 2, 0
_0810B780: .4byte gPaletteFade
_0810B784: .4byte gMain
_0810B788: .4byte 0x0000043c
_0810B78C:
	bl ResetSpriteData
	b _0810B91C
_0810B792:
	ldr r0, _0810B7A8
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _0810B79E
	bl ResetTasks
_0810B79E:
	ldr r1, _0810B7AC
	ldr r0, _0810B7B0
	adds r1, r0
	b _0810B922
	.align 2, 0
_0810B7A8: .4byte gUnknown_02039244
_0810B7AC: .4byte gMain
_0810B7B0: .4byte 0x0000043c
_0810B7B4:
	ldr r0, _0810B7BC
	bl SetUpWindowConfig
	b _0810B91C
	.align 2, 0
_0810B7BC: .4byte gWindowConfig_81E6E34
_0810B7C0:
	ldr r0, _0810B7D0
	bl SetUpWindowConfig
	ldr r1, _0810B7D4
	ldr r0, _0810B7D8
	adds r1, r0
	b _0810B922
	.align 2, 0
_0810B7D0: .4byte gWindowConfig_81E6E50
_0810B7D4: .4byte gMain
_0810B7D8: .4byte 0x0000043c
_0810B7DC:
	ldr r0, _0810B7E4
	bl MultistepInitMenuWindowBegin
	b _0810B91C
	.align 2, 0
_0810B7E4: .4byte gWindowConfig_81E6E34
_0810B7E8:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	bne _0810B7F2
	b _0810B960
_0810B7F2:
	ldr r1, _0810B7FC
	ldr r0, _0810B800
	adds r1, r0
	b _0810B922
	.align 2, 0
_0810B7FC: .4byte gMain
_0810B800: .4byte 0x0000043c
_0810B804:
	ldr r0, _0810B80C
	bl MultistepInitMenuWindowBegin
	b _0810B91C
	.align 2, 0
_0810B80C: .4byte gWindowConfig_81E6E50
_0810B810:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	bne _0810B81A
	b _0810B960
_0810B81A:
	ldr r0, _0810B828
	ldr r1, _0810B82C
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	b _0810B91C
	.align 2, 0
_0810B828: .4byte 0x02000000
_0810B82C: .4byte 0x0001ffff
_0810B830:
	bl sub_810B998
	lsls r0, 24
	cmp r0, 0
	bne _0810B83C
	b _0810B960
_0810B83C:
	ldr r1, _0810B844
	ldr r0, _0810B848
	adds r1, r0
	b _0810B922
	.align 2, 0
_0810B844: .4byte gMain
_0810B848: .4byte 0x0000043c
_0810B84C:
	bl sub_80F944C
	bl InitMenuInUpperLeftCornerPlaySoundWhenAPressed
	movs r0, 0
	movs r1, 0xB0
	movs r2, 0x8
	bl sub_80F953C
	movs r0, 0x1
	movs r1, 0xB0
	movs r2, 0x98
	bl sub_80F953C
	b _0810B91C
_0810B86A:
	movs r0, 0x38
	movs r1, 0x40
	movs r2, 0
	bl sub_810BA50
	ldr r1, _0810B884
	ldr r2, _0810B888
	adds r1, r2
	strb r0, [r1]
	ldr r1, _0810B88C
	ldr r0, _0810B890
	adds r1, r0
	b _0810B922
	.align 2, 0
_0810B884: .4byte 0x02000000
_0810B888: .4byte 0x0001fffe
_0810B88C: .4byte gMain
_0810B890: .4byte 0x0000043c
_0810B894:
	bl sub_810BC98
	bl sub_810BD08
	b _0810B91C
_0810B89E:
	bl sub_810BB0C
	bl sub_810BB30
	ldr r0, _0810B8B8
	ldrb r0, [r0, 0x1]
	bl sub_810BC84
	ldr r1, _0810B8BC
	ldr r0, _0810B8C0
	adds r1, r0
	b _0810B922
	.align 2, 0
_0810B8B8: .4byte gUnknown_02039248
_0810B8BC: .4byte gMain
_0810B8C0: .4byte 0x0000043c
_0810B8C4:
	ldr r3, _0810B8FC
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _0810B900
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _0810B904
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0810B908
	bl SetVBlankCallback
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xBA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0810B90C
	ldr r0, _0810B910
	adds r1, r0
	b _0810B922
	.align 2, 0
_0810B8FC: .4byte 0x04000208
_0810B900: .4byte 0x04000200
_0810B904: .4byte REG_DISPSTAT
_0810B908: .4byte sub_810B68C
_0810B90C: .4byte gMain
_0810B910: .4byte 0x0000043c
_0810B914:
	bl sub_8055870
	cmp r0, 0x1
	beq _0810B960
_0810B91C:
	ldr r1, _0810B92C
	ldr r2, _0810B930
	adds r1, r2
_0810B922:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0810B960
	.align 2, 0
_0810B92C: .4byte gMain
_0810B930: .4byte 0x0000043c
_0810B934:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _0810B958
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _0810B95C
	bl SetMainCallback2
	movs r0, 0x1
	b _0810B962
	.align 2, 0
_0810B958: .4byte gPaletteFade
_0810B95C: .4byte sub_810B674
_0810B960:
	movs r0, 0
_0810B962:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810B6C0

	thumb_func_start sub_810B96C
sub_810B96C: @ 810B96C
	push {lr}
_0810B96E:
	bl sub_810B6C0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810B988
	ldr r0, _0810B984
	movs r1, 0
	bl CreateTask
	b _0810B994
	.align 2, 0
_0810B984: .4byte sub_810BF7C
_0810B988:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810B96E
_0810B994:
	pop {r0}
	bx r0
	thumb_func_end sub_810B96C

	thumb_func_start sub_810B998
sub_810B998: @ 810B998
	push {lr}
	ldr r0, _0810B9B0
	ldr r1, _0810B9B4
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x4
	bhi _0810BA48
	lsls r0, 2
	ldr r1, _0810B9B8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810B9B0: .4byte 0x02000000
_0810B9B4: .4byte 0x0001ffff
_0810B9B8: .4byte _0810B9BC
	.align 2, 0
_0810B9BC:
	.4byte _0810B9D0
	.4byte _0810B9E4
	.4byte _0810B9F8
	.4byte _0810BA08
	.4byte _0810BA28
_0810B9D0:
	ldr r0, _0810B9DC
	ldr r1, _0810B9E0
	bl LZDecompressVram
	b _0810BA0E
	.align 2, 0
_0810B9DC: .4byte gMenuPokeblock_Gfx
_0810B9E0: .4byte 0x06008000
_0810B9E4:
	ldr r0, _0810B9F0
	ldr r1, _0810B9F4
	bl sub_800D238
	b _0810BA0E
	.align 2, 0
_0810B9F0: .4byte gMenuPokeblock_Tilemap
_0810B9F4: .4byte gBG2TilemapBuffer
_0810B9F8:
	ldr r0, _0810BA04
	movs r1, 0
	movs r2, 0xC0
	bl LoadCompressedPalette
	b _0810BA0E
	.align 2, 0
_0810BA04: .4byte gMenuPokeblock_Pal
_0810BA08:
	ldr r0, _0810BA1C
	bl LoadCompressedObjectPic
_0810BA0E:
	ldr r1, _0810BA20
	ldr r0, _0810BA24
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0810BA48
	.align 2, 0
_0810BA1C: .4byte gUnknown_083F7F74
_0810BA20: .4byte 0x02000000
_0810BA24: .4byte 0x0001ffff
_0810BA28:
	ldr r0, _0810BA3C
	bl LoadCompressedObjectPalette
	ldr r0, _0810BA40
	ldr r1, _0810BA44
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	b _0810BA4A
	.align 2, 0
_0810BA3C: .4byte gUnknown_083F7F7C
_0810BA40: .4byte 0x02000000
_0810BA44: .4byte 0x0001ffff
_0810BA48:
	movs r0, 0
_0810BA4A:
	pop {r1}
	bx r1
	thumb_func_end sub_810B998

	thumb_func_start sub_810BA50
sub_810BA50: @ 810BA50
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r3, r2, 0
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _0810BA78
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0810BA78: .4byte gSpriteTemplate_83F7F84
	thumb_func_end sub_810BA50

	thumb_func_start sub_810BA7C
sub_810BA7C: @ 810BA7C
	push {lr}
	ldr r1, _0810BA98
	strb r0, [r1]
	ldrb r2, [r1]
	cmp r2, 0x2
	beq _0810BAA8
	cmp r2, 0x3
	beq _0810BAC0
	ldr r1, _0810BA9C
	ldr r0, _0810BAA0
	str r0, [r1]
	ldr r1, _0810BAA4
	movs r0, 0x3
	b _0810BACA
	.align 2, 0
_0810BA98: .4byte gUnknown_02039244
_0810BA9C: .4byte gUnknown_03000758
_0810BAA0: .4byte gUnknown_083F7F1C
_0810BAA4: .4byte gUnknown_0203924C
_0810BAA8:
	ldr r0, _0810BAB4
	ldr r1, _0810BAB8
	str r1, [r0]
	ldr r0, _0810BABC
	strb r2, [r0]
	b _0810BACC
	.align 2, 0
_0810BAB4: .4byte gUnknown_03000758
_0810BAB8: .4byte gUnknown_083F7F1F
_0810BABC: .4byte gUnknown_0203924C
_0810BAC0:
	ldr r1, _0810BAD0
	ldr r0, _0810BAD4
	str r0, [r1]
	ldr r1, _0810BAD8
	movs r0, 0x2
_0810BACA:
	strb r0, [r1]
_0810BACC:
	pop {r0}
	bx r0
	.align 2, 0
_0810BAD0: .4byte gUnknown_03000758
_0810BAD4: .4byte gUnknown_083F7F21
_0810BAD8: .4byte gUnknown_0203924C
	thumb_func_end sub_810BA7C

	thumb_func_start sub_810BADC
sub_810BADC: @ 810BADC
	push {lr}
	movs r0, 0x2
	bl sub_810BA7C
	ldr r0, _0810BAF0
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0810BAF0: .4byte sub_810B96C
	thumb_func_end sub_810BADC

	thumb_func_start sub_810BAF4
sub_810BAF4: @ 810BAF4
	push {lr}
	movs r0, 0x3
	bl sub_810BA7C
	ldr r0, _0810BB08
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0810BB08: .4byte sub_810B96C
	thumb_func_end sub_810BAF4

	thumb_func_start sub_810BB0C
sub_810BB0C: @ 810BB0C
	push {lr}
	ldr r0, _0810BB28
	bl BasicInitMenuWindow
	ldr r0, _0810BB2C
	bl itemid_get_item
	movs r1, 0x2
	movs r2, 0x1
	movs r3, 0x48
	bl sub_8072BD8
	pop {r0}
	bx r0
	.align 2, 0
_0810BB28: .4byte gWindowConfig_81E6E34
_0810BB2C: .4byte 0x00000111
	thumb_func_end sub_810BB0C

	thumb_func_start sub_810BB30
sub_810BB30: @ 810BB30
	push {lr}
	ldr r0, _0810BB70
	bl BasicInitMenuWindow
	ldr r0, _0810BB74
	movs r1, 0x2
	movs r2, 0xD
	bl MenuPrint
	ldr r0, _0810BB78
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	ldr r0, _0810BB7C
	movs r1, 0x2
	movs r2, 0x11
	bl MenuPrint
	ldr r0, _0810BB80
	movs r1, 0x8
	movs r2, 0xD
	bl MenuPrint
	ldr r0, _0810BB84
	movs r1, 0x8
	movs r2, 0xF
	bl MenuPrint
	pop {r0}
	bx r0
	.align 2, 0
_0810BB70: .4byte gWindowConfig_81E6E34
_0810BB74: .4byte gContestStatsText_Spicy
_0810BB78: .4byte gContestStatsText_Dry
_0810BB7C: .4byte gContestStatsText_Sweet
_0810BB80: .4byte gContestStatsText_Bitter
_0810BB84: .4byte gContestStatsText_Sour
	thumb_func_end sub_810BB30

	thumb_func_start sub_810BB88
sub_810BB88: @ 810BB88
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0810BBF4
	bl BasicInitMenuWindow
	mov r6, r8
	adds r0, r6, 0
	adds r0, 0x8
	cmp r6, r0
	bgt _0810BC6C
	ldr r0, _0810BBF8
	mov r9, r0
	ldr r1, _0810BBFC
	mov r10, r1
_0810BBB0:
	mov r1, r8
	subs r0, r6, r1
	lsls r0, 25
	lsrs r7, r0, 24
	ldr r0, _0810BC00
	ldrb r0, [r0, 0x2]
	cmp r6, r0
	bne _0810BC08
	mov r0, r9
	ldr r1, _0810BC04
	movs r2, 0x78
	movs r3, 0
	bl sub_8072C74
	movs r2, 0x1
	orrs r2, r7
	mov r0, r9
	movs r1, 0xF
	bl MenuPrint
	mov r0, r8
	adds r0, 0x8
	cmp r6, r0
	beq _0810BC6C
	adds r1, r7, 0x3
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0xF
	movs r2, 0x1D
	movs r3, 0x12
	bl MenuZeroFillWindowRect
	b _0810BC6C
	.align 2, 0
_0810BBF4: .4byte gWindowConfig_81E6E34
_0810BBF8: .4byte gStringVar1
_0810BBFC: .4byte gSaveBlock1
_0810BC00: .4byte gUnknown_02039248
_0810BC04: .4byte gContestStatsText_StowCase
_0810BC08:
	lsls r5, r6, 3
	mov r1, r10
	adds r0, r5, r1
	movs r1, 0xFF
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	ldr r1, _0810BC7C
	adds r0, r1
	ldr r1, [r0]
	mov r0, r9
	movs r2, 0x5E
	movs r3, 0
	bl sub_8072C74
	adds r4, r0, 0
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x14
	strb r0, [r4, 0x1]
	movs r0, 0x6
	strb r0, [r4, 0x2]
	adds r4, 0x3
	ldr r0, _0810BC80
	adds r5, r0
	adds r0, r5, 0
	bl sub_810C9B0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r2, 0x1
	orrs r2, r7
	mov r0, r9
	movs r1, 0xF
	bl MenuPrint
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	mov r0, r8
	adds r0, 0x8
	cmp r6, r0
	ble _0810BBB0
_0810BC6C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810BC7C: .4byte gUnknown_083F7EB8
_0810BC80: .4byte gSaveBlock1 + 0x7F8
	thumb_func_end sub_810BB88

	thumb_func_start sub_810BC84
sub_810BC84: @ 810BC84
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_810BB88
	movs r0, 0
	bl sub_810BDAC
	pop {r0}
	bx r0
	thumb_func_end sub_810BC84

	thumb_func_start sub_810BC98
sub_810BC98: @ 810BC98
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r2, 0
	ldr r0, _0810BD00
	mov r9, r0
_0810BCA6:
	adds r1, r2, 0x1
	lsls r0, r1, 16
	lsrs r5, r0, 16
	mov r8, r1
	cmp r5, 0x27
	bhi _0810BCE8
	lsls r1, r2, 3
	mov r2, r9
	adds r0, r1, r2
	movs r2, 0xFF
	lsls r2, 3
	adds r7, r0, r2
	ldr r0, _0810BD04
	mov r12, r0
	adds r6, r1, r0
_0810BCC4:
	ldrb r0, [r7]
	cmp r0, 0
	bne _0810BCDE
	ldr r3, [r6]
	ldr r4, [r6, 0x4]
	lsls r2, r5, 3
	add r2, r12
	ldr r0, [r2]
	ldr r1, [r2, 0x4]
	str r0, [r6]
	str r1, [r6, 0x4]
	str r3, [r2]
	str r4, [r2, 0x4]
_0810BCDE:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x27
	bls _0810BCC4
_0810BCE8:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r2, r0, 16
	cmp r2, 0x26
	bls _0810BCA6
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810BD00: .4byte gSaveBlock1
_0810BD04: .4byte gSaveBlock1 + 0x7F8
	thumb_func_end sub_810BC98

	thumb_func_start sub_810BD08
sub_810BD08: @ 810BD08
	push {r4,r5,lr}
	ldr r1, _0810BD5C
	movs r0, 0
	strb r0, [r1, 0x2]
	movs r2, 0
	ldr r5, _0810BD60
	movs r4, 0xFF
	lsls r4, 3
	adds r3, r1, 0
_0810BD1A:
	lsls r0, r2, 3
	adds r0, r5
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _0810BD2C
	ldrb r0, [r3, 0x2]
	adds r0, 0x1
	strb r0, [r3, 0x2]
_0810BD2C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x27
	bls _0810BD1A
	ldrb r0, [r1, 0x2]
	cmp r0, 0x7
	bls _0810BD3E
	movs r0, 0x8
_0810BD3E:
	strb r0, [r1, 0x3]
	ldrb r2, [r1, 0x1]
	adds r0, r2, 0
	adds r0, 0x8
	ldrb r3, [r1, 0x2]
	cmp r0, r3
	ble _0810BD54
	cmp r2, 0
	beq _0810BD54
	subs r0, r2, 0x1
	strb r0, [r1, 0x1]
_0810BD54:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810BD5C: .4byte gUnknown_02039248
_0810BD60: .4byte gSaveBlock1
	thumb_func_end sub_810BD08

	thumb_func_start sub_810BD64
sub_810BD64: @ 810BD64
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	ldr r5, _0810BDA4
	ldr r4, _0810BDA8
_0810BD70:
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, 0x1
	lsls r0, 5
	adds r1, r2, 0
	adds r1, 0xF
	adds r0, r1
	lsls r0, 1
	adds r0, r4
	strh r3, [r0]
	ldrb r0, [r5]
	lsls r0, 6
	adds r0, 0x40
	adds r0, r1
	lsls r0, 1
	adds r0, r4
	strh r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xD
	bls _0810BD70
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810BDA4: .4byte gUnknown_02039248
_0810BDA8: .4byte gBG2TilemapBuffer
	thumb_func_end sub_810BD64

	thumb_func_start sub_810BDAC
sub_810BDAC: @ 810BDAC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	cmp r0, 0
	bne _0810BDCC
	ldr r0, _0810BDC4
	ldr r1, _0810BDC8
	bl sub_810BD64
	b _0810BDD4
	.align 2, 0
_0810BDC4: .4byte 0x00001005
_0810BDC8: .4byte 0x00001014
_0810BDCC:
	ldr r0, _0810BDE8
	ldr r1, _0810BDEC
	bl sub_810BD64
_0810BDD4:
	ldr r0, _0810BDF0
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _0810BDF4
	movs r0, 0
	movs r1, 0
	bl sub_80F979C
	b _0810BDFC
	.align 2, 0
_0810BDE8: .4byte 0x00002005
_0810BDEC: .4byte 0x00002014
_0810BDF0: .4byte gUnknown_02039248
_0810BDF4:
	movs r0, 0
	movs r1, 0x1
	bl sub_80F979C
_0810BDFC:
	ldr r2, _0810BE1C
	ldrb r0, [r2, 0x2]
	ldrb r1, [r2, 0x3]
	cmp r0, r1
	bls _0810BE20
	ldrb r0, [r2, 0x1]
	ldrb r1, [r2, 0x3]
	adds r0, r1
	ldrb r2, [r2, 0x2]
	cmp r0, r2
	beq _0810BE20
	movs r0, 0x1
	movs r1, 0
	bl sub_80F979C
	b _0810BE28
	.align 2, 0
_0810BE1C: .4byte gUnknown_02039248
_0810BE20:
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80F979C
_0810BE28:
	movs r6, 0
	ldr r7, _0810BE94
	movs r0, 0xF
	mov r8, r0
_0810BE30:
	adds r0, r6, 0
	movs r1, 0x3
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 18
	ldr r1, _0810BE98
	adds r4, r1
	adds r0, r6, 0
	movs r1, 0x3
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	adds r5, r4, r1
	ldr r1, _0810BE9C
	ldrb r2, [r1]
	ldrb r0, [r1, 0x1]
	adds r0, r2, r0
	ldrb r1, [r1, 0x2]
	cmp r0, r1
	beq _0810BEB8
	lsls r0, 3
	ldr r1, _0810BEA0
	adds r0, r1
	adds r4, r6, 0x1
	lsls r1, r4, 24
	lsrs r1, 24
	bl sub_810CA9C
	lsls r0, 16
	cmp r0, 0
	ble _0810BEA4
	lsls r1, r5, 1
	adds r1, r7
	lsls r2, r6, 12
	adds r0, r2, 0
	adds r0, 0x17
	strh r0, [r1]
	adds r0, r5, 0
	adds r0, 0x20
	lsls r0, 1
	adds r0, r7
	adds r2, 0x18
	strh r2, [r0]
	b _0810BECC
	.align 2, 0
_0810BE94: .4byte gBG2TilemapBuffer
_0810BE98: .4byte 0x000001a1
_0810BE9C: .4byte gUnknown_02039248
_0810BEA0: .4byte gSaveBlock1 + 0x7F8
_0810BEA4:
	lsls r0, r5, 1
	adds r0, r7
	mov r1, r8
	strh r1, [r0]
	adds r0, r5, 0
	adds r0, 0x20
	lsls r0, 1
	adds r0, r7
	strh r1, [r0]
	b _0810BECC
_0810BEB8:
	lsls r0, r5, 1
	adds r0, r7
	mov r1, r8
	strh r1, [r0]
	adds r0, r5, 0
	adds r0, 0x20
	lsls r0, 1
	adds r0, r7
	strh r1, [r0]
	adds r4, r6, 0x1
_0810BECC:
	lsls r0, r4, 24
	lsrs r6, r0, 24
	cmp r6, 0x4
	bls _0810BE30
	ldr r0, _0810BF10
	bl BasicInitMenuWindow
	ldr r0, _0810BF14
	ldrb r2, [r0]
	ldrb r1, [r0, 0x1]
	adds r2, r1
	ldrb r0, [r0, 0x2]
	cmp r2, r0
	beq _0810BF20
	ldr r4, _0810BF18
	lsls r0, r2, 3
	ldr r1, _0810BF1C
	adds r0, r1
	bl sub_810C9E8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	movs r2, 0x10
	movs r3, 0x1
	bl sub_8072C14
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0x11
	bl MenuPrint
	b _0810BF2C
	.align 2, 0
_0810BF10: .4byte gWindowConfig_81E6E34
_0810BF14: .4byte gUnknown_02039248
_0810BF18: .4byte gStringVar1
_0810BF1C: .4byte gSaveBlock1 + 0x7F8
_0810BF20:
	movs r0, 0xB
	movs r1, 0x11
	movs r2, 0xC
	movs r3, 0x12
	bl MenuZeroFillWindowRect
_0810BF2C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810BDAC

	thumb_func_start sub_810BF38
sub_810BF38: @ 810BF38
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	ldr r2, _0810BF6C
	ldr r0, _0810BF70
	ldr r1, _0810BF74
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _0810BF78
	str r1, [r0]
	adds r0, r4, 0
	bl sub_810BDAC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810BF6C: .4byte gSprites
_0810BF70: .4byte 0x02000000
_0810BF74: .4byte 0x0001fffe
_0810BF78: .4byte sub_810C8D4
	thumb_func_end sub_810BF38

	thumb_func_start sub_810BF7C
sub_810BF7C: @ 810BF7C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, r5, 0
	ldr r0, _0810BFB8
	ldrb r1, [r0, 0x7]
	movs r3, 0x80
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0810BF94
	b _0810C0B8
_0810BF94:
	ldr r2, _0810BFBC
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0810BFCE
	ldr r4, _0810BFC0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0810BFC4
	movs r0, 0x5
	movs r1, 0x14
	bl sub_810BD64
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	b _0810C00A
	.align 2, 0
_0810BFB8: .4byte gPaletteFade
_0810BFBC: .4byte gMain
_0810BFC0: .4byte gUnknown_02039248
_0810BFC4:
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _0810C0B8
	subs r0, 0x1
	b _0810C002
_0810BFCE:
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0810C012
	ldr r4, _0810BFF0
	ldrb r0, [r4]
	ldrb r1, [r4, 0x3]
	cmp r0, r1
	beq _0810BFF4
	movs r0, 0x5
	movs r1, 0x14
	bl sub_810BD64
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0810C00A
	.align 2, 0
_0810BFF0: .4byte gUnknown_02039248
_0810BFF4:
	ldrb r1, [r4, 0x1]
	ldrb r0, [r4]
	adds r0, r1, r0
	ldrb r2, [r4, 0x2]
	cmp r0, r2
	beq _0810C0B8
	adds r0, r1, 0x1
_0810C002:
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x1]
	bl sub_810BB88
_0810C00A:
	movs r0, 0
	bl sub_810BF38
	b _0810C0B8
_0810C012:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0810C05C
	ldr r4, _0810C050
	ldrb r0, [r4, 0x1]
	ldrb r1, [r4]
	adds r0, r1
	ldrb r1, [r4, 0x2]
	cmp r0, r1
	beq _0810C0B8
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl sub_810BDAC
	ldr r1, _0810C054
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r4, 0x1]
	ldrb r2, [r4]
	adds r1, r2
	strh r1, [r0, 0x8]
	ldr r1, _0810C058
	str r1, [r0]
	b _0810C0B8
	.align 2, 0
_0810C050: .4byte gUnknown_02039248
_0810C054: .4byte gTasks
_0810C058: .4byte sub_810C0C8
_0810C05C:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810C09C
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0810C088
	ldrb r1, [r0, 0x1]
	ldrb r2, [r0]
	adds r1, r2
	ldrb r0, [r0, 0x2]
	cmp r1, r0
	bne _0810C094
	ldr r1, _0810C08C
	ldr r2, _0810C090
	adds r0, r2, 0
	strh r0, [r1]
	adds r0, r5, 0
	bl sub_810C31C
	b _0810C0B8
	.align 2, 0
_0810C088: .4byte gUnknown_02039248
_0810C08C: .4byte gScriptResult
_0810C090: .4byte 0x0000ffff
_0810C094:
	adds r0, r5, 0
	bl sub_810C368
	b _0810C0B8
_0810C09C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810C0B8
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0810C0C0
	ldr r2, _0810C0C4
	adds r0, r2, 0
	strh r0, [r1]
	adds r0, r4, 0
	bl sub_810C31C
_0810C0B8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C0C0: .4byte gScriptResult
_0810C0C4: .4byte 0x0000ffff
	thumb_func_end sub_810BF7C

	thumb_func_start sub_810C0C8
sub_810C0C8: @ 810C0C8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _0810C0F4
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0810C110
	ldr r4, _0810C0F8
	ldrb r0, [r4]
	cmp r0, 0
	beq _0810C0FC
	movs r0, 0x5
	movs r1, 0x14
	bl sub_810BD64
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	b _0810C158
	.align 2, 0
_0810C0F4: .4byte gMain
_0810C0F8: .4byte gUnknown_02039248
_0810C0FC:
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _0810C1BA
	adds r0, r5, 0
	movs r1, 0
	bl sub_810C1C8
	ldrb r0, [r4, 0x1]
	subs r0, 0x1
	b _0810C150
_0810C110:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0810C168
	ldr r4, _0810C134
	ldrb r0, [r4]
	ldrb r1, [r4, 0x3]
	cmp r0, r1
	beq _0810C138
	movs r0, 0x5
	movs r1, 0x14
	bl sub_810BD64
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0810C158
	.align 2, 0
_0810C134: .4byte gUnknown_02039248
_0810C138:
	ldrb r0, [r4, 0x1]
	ldrb r1, [r4]
	adds r0, r1
	ldrb r1, [r4, 0x2]
	cmp r0, r1
	beq _0810C1BA
	adds r0, r5, 0
	movs r1, 0
	bl sub_810C1C8
	ldrb r0, [r4, 0x1]
	adds r0, 0x1
_0810C150:
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x1]
	bl sub_810BB88
_0810C158:
	movs r0, 0x1
	bl sub_810BF38
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_810C1C8
	b _0810C1BA
_0810C168:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0810C17A
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0810C190
_0810C17A:
	movs r0, 0x5
	bl PlaySE
	adds r0, r5, 0
	movs r1, 0
	bl sub_810C1C8
	adds r0, r5, 0
	bl sub_810C23C
	b _0810C1AC
_0810C190:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810C1BA
	movs r0, 0x5
	bl PlaySE
	adds r0, r5, 0
	movs r1, 0
	bl sub_810C1C8
	movs r0, 0
	bl sub_810BDAC
_0810C1AC:
	ldr r0, _0810C1C0
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _0810C1C4
	str r0, [r1]
_0810C1BA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C1C0: .4byte gTasks
_0810C1C4: .4byte sub_810BF7C
	thumb_func_end sub_810C0C8

	thumb_func_start sub_810C1C8
sub_810C1C8: @ 810C1C8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	ldr r6, _0810C22C
	cmp r1, 0
	bne _0810C1D8
	movs r6, 0x5
_0810C1D8:
	ldr r1, _0810C230
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	ldr r2, _0810C234
	ldrb r1, [r2, 0x1]
	ldrh r0, [r0, 0x8]
	subs r0, r1
	lsls r1, r0, 16
	lsrs r0, r1, 16
	cmp r0, 0x8
	bhi _0810C226
	asrs r0, r1, 16
	ldrb r2, [r2]
	cmp r0, r2
	beq _0810C226
	movs r2, 0
	lsls r0, 1
	adds r1, r0, 0x1
	lsls r5, r1, 5
	ldr r3, _0810C238
	adds r0, 0x2
	lsls r4, r0, 5
_0810C208:
	adds r0, r2, 0
	adds r0, 0xF
	adds r1, r5, r0
	lsls r1, 1
	adds r1, r3
	strh r6, [r1]
	adds r0, r4, r0
	lsls r0, 1
	adds r0, r3
	strh r6, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xD
	bls _0810C208
_0810C226:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810C22C: .4byte 0x00001005
_0810C230: .4byte gTasks
_0810C234: .4byte gUnknown_02039248
_0810C238: .4byte gBG2TilemapBuffer
	thumb_func_end sub_810C1C8

	thumb_func_start sub_810C23C
sub_810C23C: @ 810C23C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r7, _0810C25C
	ldrb r0, [r7]
	ldrb r2, [r7, 0x1]
	adds r0, r2
	lsls r0, 24
	lsrs r0, 24
	ldrb r2, [r7, 0x2]
	cmp r0, r2
	bne _0810C260
	movs r0, 0
	bl sub_810BDAC
	b _0810C2A2
	.align 2, 0
_0810C25C: .4byte gUnknown_02039248
_0810C260:
	ldr r4, _0810C2A8
	lsls r3, r0, 3
	movs r0, 0xFF
	lsls r0, 3
	adds r4, r0
	adds r3, r4
	ldr r5, [r3]
	ldr r6, [r3, 0x4]
	ldr r0, _0810C2AC
	lsls r2, r1, 2
	adds r2, r1
	lsls r2, 3
	adds r2, r0
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	lsls r0, 3
	adds r0, r4
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r3]
	str r1, [r3, 0x4]
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	lsls r0, 3
	adds r0, r4
	str r5, [r0]
	str r6, [r0, 0x4]
	ldrb r0, [r7, 0x1]
	bl sub_810BB88
	movs r0, 0
	bl sub_810BDAC
_0810C2A2:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810C2A8: .4byte gSaveBlock1
_0810C2AC: .4byte gTasks
	thumb_func_end sub_810C23C

	thumb_func_start sub_810C2B0
sub_810C2B0: @ 810C2B0
	push {lr}
	movs r0, 0
	bl SetBgTilemapBuffer
	movs r0, 0x1
	bl SetBgTilemapBuffer
	bl BuyMenuFreeMemory
	pop {r0}
	bx r0
	thumb_func_end sub_810C2B0

	thumb_func_start sub_810C2C8
sub_810C2C8: @ 810C2C8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0810C308
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0810C300
	ldr r4, _0810C30C
	ldrb r0, [r4]
	cmp r0, 0x3
	bne _0810C2E8
	ldr r1, _0810C310
	ldr r0, _0810C314
	str r0, [r1]
_0810C2E8:
	bl sub_810C2B0
	ldr r0, _0810C318
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_0810C300:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C308: .4byte gPaletteFade
_0810C30C: .4byte gUnknown_02039244
_0810C310: .4byte gUnknown_0300485C
_0810C314: .4byte sub_8080990
_0810C318: .4byte gUnknown_083F7EA8
	thumb_func_end sub_810C2C8

	thumb_func_start sub_810C31C
sub_810C31C: @ 810C31C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1
	negs r0, r0
	movs r5, 0
	str r5, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0810C358
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _0810C342
	ldr r0, _0810C35C
	strh r5, [r0]
_0810C342:
	ldr r0, _0810C360
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0810C364
	str r0, [r1]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C358: .4byte gUnknown_02039244
_0810C35C: .4byte word_203855E
_0810C360: .4byte gTasks
_0810C364: .4byte sub_810C2C8
	thumb_func_end sub_810C31C

	thumb_func_start sub_810C368
sub_810C368: @ 810C368
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	ldr r0, _0810C3E8
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _0810C37C
	movs r4, 0x2
_0810C37C:
	movs r0, 0
	bl sub_80F98A4
	movs r0, 0x1
	bl sub_80F98A4
	ldr r0, _0810C3EC
	bl BasicInitMenuWindow
	adds r1, r4, 0x4
	movs r0, 0x7
	movs r2, 0xD
	movs r3, 0xB
	bl MenuDrawTextWindow
	adds r4, 0x5
	ldr r5, _0810C3F0
	ldrb r2, [r5]
	ldr r3, _0810C3F4
	ldr r0, _0810C3F8
	ldr r0, [r0]
	str r0, [sp]
	movs r0, 0x8
	adds r1, r4, 0
	bl PrintMenuItemsReordered
	ldrb r3, [r5]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x5
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x8
	adds r2, r4, 0
	bl InitMenu
	ldr r2, _0810C3FC
	ldr r1, _0810C400
	ldrb r0, [r1]
	ldrb r1, [r1, 0x1]
	adds r0, r1
	strh r0, [r2]
	ldr r1, _0810C404
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810C408
	str r1, [r0]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810C3E8: .4byte gUnknown_02039244
_0810C3EC: .4byte gWindowConfig_81E6E50
_0810C3F0: .4byte gUnknown_0203924C
_0810C3F4: .4byte gUnknown_083F7EF4
_0810C3F8: .4byte gUnknown_03000758
_0810C3FC: .4byte word_203855E
_0810C400: .4byte gUnknown_02039248
_0810C404: .4byte gTasks
_0810C408: .4byte sub_810C40C
	thumb_func_end sub_810C368

	thumb_func_start sub_810C40C
sub_810C40C: @ 810C40C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, r5, 0
	ldr r2, _0810C43C
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0810C440
	bl GetMenuCursorPos
	lsls r0, 24
	cmp r0, 0
	beq _0810C4BC
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	b _0810C4BC
	.align 2, 0
_0810C43C: .4byte gMain
_0810C440:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0810C46C
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0810C468
	ldrb r1, [r1]
	subs r1, 0x1
	cmp r0, r1
	beq _0810C4BC
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	b _0810C4BC
	.align 2, 0
_0810C468: .4byte gUnknown_0203924C
_0810C46C:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810C4A8
	movs r0, 0x5
	bl PlaySE
	ldr r4, _0810C4A0
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0810C4A4
	ldr r1, [r1]
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 3
	adds r4, 0x4
	adds r0, r4
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
	b _0810C4BC
	.align 2, 0
_0810C4A0: .4byte gUnknown_083F7EF4
_0810C4A4: .4byte gUnknown_03000758
_0810C4A8:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810C4BC
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_810C748
_0810C4BC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_810C40C

	thumb_func_start sub_810C4C4
sub_810C4C4: @ 810C4C4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0810C4F8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0810C4F0
	bl sub_810C2B0
	ldr r0, _0810C4FC
	ldrh r0, [r0]
	lsls r0, 3
	ldr r1, _0810C500
	adds r0, r1
	ldr r1, _0810C504
	bl sub_8136130
	adds r0, r4, 0
	bl DestroyTask
_0810C4F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810C4F8: .4byte gPaletteFade
_0810C4FC: .4byte word_203855E
_0810C500: .4byte gSaveBlock1 + 0x7F8
_0810C504: .4byte sub_810B96C
	thumb_func_end sub_810C4C4

	thumb_func_start sub_810C508
sub_810C508: @ 810C508
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0810C538
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810C53C
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810C538: .4byte gTasks
_0810C53C: .4byte sub_810C4C4
	thumb_func_end sub_810C508

	thumb_func_start sub_810C540
sub_810C540: @ 810C540
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _0810C5A0
	bl BasicInitMenuWindow
	bl sub_8072DEC
	movs r0, 0x7
	movs r1, 0x4
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	ldr r0, _0810C5A4
	ldr r4, _0810C5A8
	ldr r3, _0810C5AC
	ldr r2, _0810C5B0
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	adds r1, r2
	lsls r1, 3
	adds r1, r3
	movs r2, 0xFF
	lsls r2, 3
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r4
	ldr r1, [r1]
	bl StringCopy
	ldr r4, _0810C5B4
	ldr r1, _0810C5B8
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _0810C5BC
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C5A0: .4byte gWindowConfig_81E6E50
_0810C5A4: .4byte gStringVar1
_0810C5A8: .4byte gUnknown_083F7EB8
_0810C5AC: .4byte gSaveBlock1
_0810C5B0: .4byte gUnknown_02039248
_0810C5B4: .4byte gStringVar4
_0810C5B8: .4byte gContestStatsText_ThrowAwayPrompt
_0810C5BC: .4byte sub_810C5EC
	thumb_func_end sub_810C540

	thumb_func_start sub_810C5C0
sub_810C5C0: @ 810C5C0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80F979C
	ldr r1, _0810C5E4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810C5E8
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810C5E4: .4byte gTasks
_0810C5E8: .4byte sub_810C540
	thumb_func_end sub_810C5C0

	thumb_func_start sub_810C5EC
sub_810C5EC: @ 810C5EC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x7
	movs r1, 0x6
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _0810C60C
	adds r0, r4, 0
	bl sub_80F914C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810C60C: .4byte gUnknown_083F7F24
	thumb_func_end sub_810C5EC

	thumb_func_start sub_810C610
sub_810C610: @ 810C610
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x7
	movs r1, 0x6
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	ldr r1, _0810C658
	ldrb r0, [r1, 0x1]
	ldrb r1, [r1]
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl sub_810CA6C
	ldr r5, _0810C65C
	ldr r1, _0810C660
	adds r0, r5, 0
	bl StringExpandPlaceholders
	ldr r2, _0810C664
	adds r0, r4, 0
	adds r1, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	bl sub_810BC98
	bl sub_810BD08
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C658: .4byte gUnknown_02039248
_0810C65C: .4byte gStringVar4
_0810C660: .4byte gContestStatsText_WasThrownAway
_0810C664: .4byte sub_810C704
	thumb_func_end sub_810C610

	thumb_func_start sub_810C668
sub_810C668: @ 810C668
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	bl sub_80F98DC
	movs r0, 0x1
	bl sub_80F98DC
	ldr r2, _0810C6CC
	ldrb r0, [r2, 0x2]
	ldrb r1, [r2, 0x3]
	cmp r0, r1
	bls _0810C698
	ldrb r0, [r2, 0x1]
	ldrb r1, [r2, 0x3]
	adds r0, r1
	ldrb r2, [r2, 0x2]
	cmp r0, r2
	beq _0810C698
	movs r0, 0x1
	movs r1, 0
	bl sub_80F979C
_0810C698:
	ldr r0, _0810C6D0
	bl BasicInitMenuWindow
	movs r0, 0x7
	movs r1, 0x6
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _0810C6D4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810C6D8
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810C6CC: .4byte gUnknown_02039248
_0810C6D0: .4byte gWindowConfig_81E6E50
_0810C6D4: .4byte gTasks
_0810C6D8: .4byte sub_810BF7C
	thumb_func_end sub_810C668

	thumb_func_start sub_810C6DC
sub_810C6DC: @ 810C6DC
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0810C700
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0810C6F6
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810C6FC
_0810C6F6:
	adds r0, r2, 0
	bl sub_810C668
_0810C6FC:
	pop {r0}
	bx r0
	.align 2, 0
_0810C700: .4byte gMain
	thumb_func_end sub_810C6DC

	thumb_func_start sub_810C704
sub_810C704: @ 810C704
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0810C738
	bl BasicInitMenuWindow
	ldr r0, _0810C73C
	ldrb r0, [r0, 0x1]
	bl sub_810BC84
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80F979C
	ldr r1, _0810C740
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810C744
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810C738: .4byte gWindowConfig_81E6E34
_0810C73C: .4byte gUnknown_02039248
_0810C740: .4byte gTasks
_0810C744: .4byte sub_810C6DC
	thumb_func_end sub_810C704

	thumb_func_start sub_810C748
sub_810C748: @ 810C748
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl sub_80F98DC
	movs r0, 0x1
	bl sub_80F98DC
	bl sub_8072DEC
	movs r0, 0x7
	movs r1, 0x4
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	ldr r1, _0810C780
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810C784
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810C780: .4byte gTasks
_0810C784: .4byte sub_810BF7C
	thumb_func_end sub_810C748

	thumb_func_start sub_810C788
sub_810C788: @ 810C788
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0810C834
	bl GetNature
	lsls r0, 24
	lsrs r0, 24
	ldr r7, _0810C838
	ldrh r1, [r7]
	lsls r1, 3
	ldr r5, _0810C83C
	adds r1, r5
	bl sub_810CAE4
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _0810C840
	ldr r2, _0810C844
	ldr r1, _0810C848
	adds r5, r1
	ldrh r1, [r7]
	lsls r1, 3
	adds r1, r5
	movs r6, 0xFF
	lsls r6, 3
	adds r1, r6
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	ldrb r0, [r7]
	bl sub_810CA6C
	ldrh r0, [r7]
	lsls r0, 3
	adds r0, r5
	adds r0, r6
	ldrb r0, [r0]
	lsls r0, 8
	strh r0, [r7]
	lsls r4, 16
	asrs r4, 16
	cmp r4, 0
	bne _0810C7F4
	adds r0, 0x1
	strh r0, [r7]
_0810C7F4:
	cmp r4, 0
	ble _0810C7FE
	ldrh r0, [r7]
	adds r0, 0x2
	strh r0, [r7]
_0810C7FE:
	cmp r4, 0
	bge _0810C808
	ldrh r0, [r7]
	adds r0, 0x3
	strh r0, [r7]
_0810C808:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0810C84C
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810C850
	str r1, [r0]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810C834: .4byte gEnemyParty
_0810C838: .4byte word_203855E
_0810C83C: .4byte gSaveBlock1 + 0x7F8
_0810C840: .4byte gUnknown_030041C0
_0810C844: .4byte gUnknown_083F7EB8
_0810C848: .4byte 0xfffff808
_0810C84C: .4byte gTasks
_0810C850: .4byte sub_810C2C8
	thumb_func_end sub_810C788

	thumb_func_start sub_810C854
sub_810C854: @ 810C854
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _0810C8B8
	ldrb r0, [r4]
	bl sub_80C8478
	ldr r0, _0810C8BC
	ldr r3, _0810C8C0
	ldr r2, _0810C8C4
	ldrh r1, [r4]
	lsls r1, 3
	adds r1, r2
	movs r2, 0xFF
	lsls r2, 3
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl StringCopy
	ldr r1, _0810C8C8
	ldrh r0, [r4]
	strh r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	bl sub_810CA6C
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0810C8CC
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810C8D0
	str r1, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C8B8: .4byte word_203855E
_0810C8BC: .4byte gStringVar1
_0810C8C0: .4byte gUnknown_083F7EB8
_0810C8C4: .4byte gSaveBlock1
_0810C8C8: .4byte gScriptResult
_0810C8CC: .4byte gTasks
_0810C8D0: .4byte sub_810C2C8
	thumb_func_end sub_810C854

	thumb_func_start sub_810C8D4
sub_810C8D4: @ 810C8D4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	ble _0810C8E4
	movs r0, 0
	strh r0, [r4, 0x2E]
_0810C8E4:
	movs r0, 0x2E
	ldrsh r5, [r4, r0]
	cmp r5, 0
	beq _0810C8F2
	cmp r5, 0x1
	beq _0810C918
	b _0810C944
_0810C8F2:
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _0810C914
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	movs r0, 0x1
	strh r0, [r4, 0x2E]
	strh r5, [r4, 0x30]
	b _0810C944
	.align 2, 0
_0810C914: .4byte gUnknown_083F7F70
_0810C918:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	movs r2, 0
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	ble _0810C944
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	strh r2, [r4, 0x2E]
	strh r2, [r4, 0x30]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldr r0, _0810C94C
	str r0, [r4, 0x1C]
_0810C944:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C94C: .4byte SpriteCallbackDummy
	thumb_func_end sub_810C8D4

	thumb_func_start sub_810C950
sub_810C950: @ 810C950
	lsls r0, 24
	ldr r1, _0810C988
	lsrs r0, 21
	adds r0, r1
	movs r2, 0xFF
	lsls r2, 3
	adds r1, r0, r2
	movs r2, 0
	strb r2, [r1]
	ldr r3, _0810C98C
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, 0x1
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, 0x1
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, 0x1
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, 0x1
	adds r1, r0, r3
	strb r2, [r1]
	ldr r1, _0810C990
	adds r0, r1
	strb r2, [r0]
	bx lr
	.align 2, 0
_0810C988: .4byte gSaveBlock1
_0810C98C: .4byte 0x000007f9
_0810C990: .4byte 0x000007fe
	thumb_func_end sub_810C950

	thumb_func_start sub_810C994
sub_810C994: @ 810C994
	push {r4,lr}
	movs r4, 0
_0810C998:
	adds r0, r4, 0
	bl sub_810C950
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x27
	bls _0810C998
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_810C994

	thumb_func_start sub_810C9B0
sub_810C9B0: @ 810C9B0
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_810CA9C
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0x1
_0810C9C0:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_810CA9C
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	bcs _0810C9D8
	adds r5, r0, 0
_0810C9D8:
	adds r1, r4, 0
	cmp r1, 0x4
	bls _0810C9C0
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_810C9B0

	thumb_func_start sub_810C9E8
sub_810C9E8: @ 810C9E8
	push {lr}
	movs r1, 0x6
	bl sub_810CA9C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x63
	bls _0810C9FA
	movs r0, 0x63
_0810C9FA:
	pop {r1}
	bx r1
	thumb_func_end sub_810C9E8

	thumb_func_start sub_810CA00
sub_810CA00: @ 810CA00
	push {lr}
	movs r1, 0
	ldr r3, _0810CA1C
	movs r2, 0xFF
	lsls r2, 3
_0810CA0A:
	lsls r0, r1, 3
	adds r0, r3
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0810CA20
	lsls r0, r1, 24
	asrs r0, 24
	b _0810CA2E
	.align 2, 0
_0810CA1C: .4byte gSaveBlock1
_0810CA20:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x27
	bls _0810CA0A
	movs r0, 0x1
	negs r0, r0
_0810CA2E:
	pop {r1}
	bx r1
	thumb_func_end sub_810CA00

	thumb_func_start sub_810CA34
sub_810CA34: @ 810CA34
	push {r4,lr}
	adds r4, r0, 0
	bl sub_810CA00
	lsls r0, 24
	asrs r2, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	beq _0810CA64
	ldr r0, _0810CA60
	lsls r2, 3
	movs r1, 0xFF
	lsls r1, 3
	adds r0, r1
	adds r2, r0
	ldr r0, [r4]
	ldr r1, [r4, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	movs r0, 0x1
	b _0810CA66
	.align 2, 0
_0810CA60: .4byte gSaveBlock1
_0810CA64:
	movs r0, 0
_0810CA66:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810CA34

	thumb_func_start sub_810CA6C
sub_810CA6C: @ 810CA6C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0810CA90
	lsls r0, r2, 3
	adds r0, r1
	movs r1, 0xFF
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0810CA94
	adds r0, r2, 0
	bl sub_810C950
	movs r0, 0x1
	b _0810CA96
	.align 2, 0
_0810CA90: .4byte gSaveBlock1
_0810CA94:
	movs r0, 0
_0810CA96:
	pop {r1}
	bx r1
	thumb_func_end sub_810CA6C

	thumb_func_start sub_810CA9C
sub_810CA9C: @ 810CA9C
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	adds r2, r1, 0
	cmp r1, 0
	bne _0810CAAC
	ldrb r0, [r0]
	b _0810CADE
_0810CAAC:
	cmp r1, 0x1
	bne _0810CAB4
	ldrb r0, [r0, 0x1]
	b _0810CADE
_0810CAB4:
	cmp r1, 0x2
	bne _0810CABC
	ldrb r0, [r0, 0x2]
	b _0810CADE
_0810CABC:
	cmp r1, 0x3
	bne _0810CAC4
	ldrb r0, [r0, 0x3]
	b _0810CADE
_0810CAC4:
	cmp r1, 0x4
	bne _0810CACC
	ldrb r0, [r0, 0x4]
	b _0810CADE
_0810CACC:
	cmp r1, 0x5
	bne _0810CAD4
	ldrb r0, [r0, 0x5]
	b _0810CADE
_0810CAD4:
	cmp r2, 0x6
	beq _0810CADC
	movs r0, 0
	b _0810CADE
_0810CADC:
	ldrb r0, [r0, 0x6]
_0810CADE:
	pop {r1}
	bx r1
	thumb_func_end sub_810CA9C

	thumb_func_start sub_810CAE4
sub_810CAE4: @ 810CAE4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r8, r1
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0
	movs r4, 0
	ldr r1, _0810CB40
	mov r9, r1
	lsls r1, r0, 2
	adds r7, r1, r0
_0810CAFE:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r8
	adds r1, r5, 0
	bl sub_810CA9C
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0
	ble _0810CB2A
	adds r0, r7, r4
	add r0, r9
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	muls r1, r0
	lsls r0, r6, 16
	asrs r0, 16
	adds r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
_0810CB2A:
	adds r4, r5, 0
	cmp r4, 0x4
	bls _0810CAFE
	lsls r0, r6, 16
	asrs r0, 16
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810CB40: .4byte gUnknown_083F7E28
	thumb_func_end sub_810CAE4

	thumb_func_start sub_810CB44
sub_810CB44: @ 810CB44
	push {r4,lr}
	adds r4, r1, 0
	movs r1, 0
	bl sub_810CA9C
	lsls r0, 24
	ldr r1, _0810CB64
	lsrs r0, 22
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl StringCopy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810CB64: .4byte gUnknown_083F7EB8
	thumb_func_end sub_810CB44

	thumb_func_start sub_810CB68
sub_810CB68: @ 810CB68
	push {r4-r7,lr}
	adds r6, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r7, _0810CB98
_0810CB74:
	lsls r1, r4, 3
	ldr r0, _0810CB9C
	adds r1, r0
	adds r0, r5, 0
	bl sub_810CAE4
	lsls r0, 16
	cmp r0, 0
	ble _0810CBA0
	adds r0, r4, 0x1
	lsls r0, 2
	adds r0, r7
	ldr r1, [r0]
	adds r0, r6, 0
	bl StringCopy
	movs r0, 0x1
	b _0810CBAC
	.align 2, 0
_0810CB98: .4byte gUnknown_083F7EB8
_0810CB9C: .4byte gUnknown_083F7F9C
_0810CBA0:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _0810CB74
	movs r0, 0
_0810CBAC:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_810CB68

	thumb_func_start SetUpFieldMove_Flash
SetUpFieldMove_Flash: @ 810CBB4
	push {lr}
	ldr r0, _0810CBDC
	ldrb r0, [r0, 0x15]
	cmp r0, 0x1
	bne _0810CBF4
	ldr r0, _0810CBE0
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _0810CBF4
	ldr r1, _0810CBE4
	ldr r0, _0810CBE8
	str r0, [r1]
	ldr r1, _0810CBEC
	ldr r0, _0810CBF0
	str r0, [r1]
	movs r0, 0x1
	b _0810CBF6
	.align 2, 0
_0810CBDC: .4byte gMapHeader
_0810CBE0: .4byte 0x00000828
_0810CBE4: .4byte gUnknown_0300485C
_0810CBE8: .4byte sub_808AB90
_0810CBEC: .4byte gUnknown_03005CE4
_0810CBF0: .4byte sub_810CBFC
_0810CBF4:
	movs r0, 0
_0810CBF6:
	pop {r1}
	bx r1
	thumb_func_end SetUpFieldMove_Flash

	thumb_func_start sub_810CBFC
sub_810CBFC: @ 810CBFC
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810CC24
	ldr r1, _0810CC28
	ldrb r1, [r1]
	str r1, [r2]
	ldr r2, _0810CC2C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _0810CC30
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	pop {r0}
	bx r0
	.align 2, 0
_0810CC24: .4byte gUnknown_0202FF84
_0810CC28: .4byte gUnknown_03005CE0
_0810CC2C: .4byte gTasks
_0810CC30: .4byte sub_810CC34
	thumb_func_end sub_810CBFC

	thumb_func_start sub_810CC34
sub_810CC34: @ 810CC34
	push {lr}
	movs r0, 0xCF
	bl PlaySE
	ldr r0, _0810CC4C
	bl FlagSet
	ldr r0, _0810CC50
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_0810CC4C: .4byte 0x00000828
_0810CC50: .4byte gUnknown_081B694A
	thumb_func_end sub_810CC34

	thumb_func_start sub_810CC54
sub_810CC54: @ 810CC54
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_810CC54

	thumb_func_start sub_810CC6C
sub_810CC6C: @ 810CC6C
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_810CC6C

	thumb_func_start sub_810CC80
sub_810CC80: @ 810CC80
	push {r4,lr}
	sub sp, 0x8
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0x80
	lsls r0, 19
	movs r1, 0
	strh r1, [r0]
	adds r0, 0xC
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x10
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	mov r0, sp
	strh r1, [r0]
	ldr r1, _0810CD34
	str r0, [r1]
	movs r0, 0xC0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _0810CD38
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r4, 0
	str r4, [sp, 0x4]
	add r0, sp, 0x4
	str r0, [r1]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _0810CD3C
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r0, sp
	strh r4, [r0]
	str r0, [r1]
	ldr r0, _0810CD40
	str r0, [r1, 0x4]
	ldr r0, _0810CD44
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl ResetPaletteFade
	bl ResetTasks
	bl ResetSpriteData
	ldr r3, _0810CD48
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _0810CD4C
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r0, _0810CD50
	bl SetVBlankCallback
	ldr r0, _0810CD54
	bl SetMainCallback2
	bl sub_810CD5C
	lsls r0, 24
	cmp r0, 0
	bne _0810CD2A
	ldr r0, _0810CD58
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
_0810CD2A:
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810CD34: .4byte 0x040000d4
_0810CD38: .4byte 0x8100c000
_0810CD3C: .4byte 0x85000100
_0810CD40: .4byte 0x05000002
_0810CD44: .4byte 0x810001ff
_0810CD48: .4byte 0x04000208
_0810CD4C: .4byte 0x04000200
_0810CD50: .4byte sub_810CC6C
_0810CD54: .4byte sub_810CC54
_0810CD58: .4byte gMain
	thumb_func_end sub_810CC80

	thumb_func_start sub_810CD5C
sub_810CD5C: @ 810CD5C
	push {r4-r7,lr}
	bl get_map_light_from_warp0
	lsls r0, 24
	lsrs r6, r0, 24
	bl sav1_map_get_light_level
	lsls r0, 24
	lsrs r5, r0, 24
	movs r3, 0
	ldr r4, _0810CD9C
	ldrb r0, [r4]
	cmp r0, 0
	beq _0810CDB0
	adds r7, r4, 0
	adds r0, r4, 0x4
	mov r12, r0
_0810CD7E:
	lsls r2, r3, 3
	adds r1, r2, r7
	ldrb r0, [r1]
	cmp r0, r6
	bne _0810CDA0
	ldrb r0, [r1, 0x1]
	cmp r0, r5
	bne _0810CDA0
	mov r1, r12
	adds r0, r2, r1
	ldr r0, [r0]
	bl _call_via_r0
	movs r0, 0x1
	b _0810CDB2
	.align 2, 0
_0810CD9C: .4byte gUnknown_083F7FC4
_0810CDA0:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 3
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0810CD7E
_0810CDB0:
	movs r0, 0
_0810CDB2:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_810CD5C

	thumb_func_start sub_810CDB8
sub_810CDB8: @ 810CDB8
	push {r4-r6,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r5, r0, 24
	lsrs r4, r1, 24
	movs r3, 0
	ldr r1, _0810CDE4
	ldrb r0, [r1]
	cmp r0, 0
	beq _0810CDF8
	adds r6, r1, 0
_0810CDCE:
	lsls r0, r3, 3
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, r5
	bne _0810CDE8
	ldrb r0, [r2, 0x1]
	cmp r0, r4
	bne _0810CDE8
	ldrb r0, [r2, 0x2]
	b _0810CDFA
	.align 2, 0
_0810CDE4: .4byte gUnknown_083F7FC4
_0810CDE8:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0810CDCE
_0810CDF8:
	movs r0, 0
_0810CDFA:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_810CDB8

	thumb_func_start fade_type_for_given_maplight_pair
fade_type_for_given_maplight_pair: @ 810CE00
	push {r4-r6,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r5, r0, 24
	lsrs r4, r1, 24
	movs r3, 0
	ldr r1, _0810CE2C
	ldrb r0, [r1]
	cmp r0, 0
	beq _0810CE40
	adds r6, r1, 0
_0810CE16:
	lsls r0, r3, 3
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, r5
	bne _0810CE30
	ldrb r0, [r2, 0x1]
	cmp r0, r4
	bne _0810CE30
	ldrb r0, [r2, 0x3]
	b _0810CE42
	.align 2, 0
_0810CE2C: .4byte gUnknown_083F7FC4
_0810CE30:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0810CE16
_0810CE40:
	movs r0, 0
_0810CE42:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end fade_type_for_given_maplight_pair

	thumb_func_start sub_810CE48
sub_810CE48: @ 810CE48
	push {lr}
	ldr r0, _0810CE58
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0810CE58: .4byte sub_810CE5C
	thumb_func_end sub_810CE48

	thumb_func_start sub_810CE5C
sub_810CE5C: @ 810CE5C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810CE70
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0810CE74
	str r0, [r1]
	bx lr
	.align 2, 0
_0810CE70: .4byte gTasks
_0810CE74: .4byte sub_810CE78
	thumb_func_end sub_810CE5C

	thumb_func_start sub_810CE78
sub_810CE78: @ 810CE78
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r6, 0x80
	lsls r6, 19
	movs r5, 0
	strh r5, [r6]
	ldr r0, _0810CEE8
	ldr r1, _0810CEEC
	bl LZ77UnCompVram
	ldr r0, _0810CEF0
	ldr r1, _0810CEF4
	bl LZ77UnCompVram
	ldr r0, _0810CEF8
	movs r1, 0xE0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0810CEFC
	movs r1, 0xE0
	movs r2, 0x10
	bl LoadPalette
	ldr r1, _0810CF00
	ldr r2, _0810CF04
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0810CF08
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	subs r1, 0x48
	ldr r2, _0810CF0C
	adds r0, r2, 0
	strh r0, [r1]
	movs r1, 0x8A
	lsls r1, 5
	adds r0, r1, 0
	strh r0, [r6]
	ldr r1, _0810CF10
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810CF14
	str r1, [r0]
	movs r2, 0
	movs r1, 0x10
	strh r1, [r0, 0x8]
	strh r2, [r0, 0xA]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810CEE8: .4byte gCaveTransitionTiles
_0810CEEC: .4byte 0x0600c000
_0810CEF0: .4byte gCaveTransitionTilemap
_0810CEF4: .4byte 0x0600f800
_0810CEF8: .4byte gCaveTransitionPalette_White
_0810CEFC: .4byte gUnknown_083F809C
_0810CF00: .4byte REG_BLDCNT
_0810CF04: .4byte 0x00003e41
_0810CF08: .4byte REG_BLDALPHA
_0810CF0C: .4byte 0x00001f0c
_0810CF10: .4byte gTasks
_0810CF14: .4byte sub_810CF18
	thumb_func_end sub_810CE78

	thumb_func_start sub_810CF18
sub_810CF18: @ 810CF18
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810CF44
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r3, r1, r2
	ldrh r2, [r3, 0xA]
	movs r1, 0x80
	lsls r1, 5
	adds r0, r2, r1
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0810CF48
	strh r0, [r1]
	cmp r2, 0x10
	bhi _0810CF4C
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	b _0810CF54
	.align 2, 0
_0810CF44: .4byte gTasks
_0810CF48: .4byte REG_BLDALPHA
_0810CF4C:
	movs r0, 0
	strh r0, [r3, 0xC]
	ldr r0, _0810CF58
	str r0, [r3]
_0810CF54:
	pop {r0}
	bx r0
	.align 2, 0
_0810CF58: .4byte sub_810CF5C
	thumb_func_end sub_810CF18

	thumb_func_start sub_810CF5C
sub_810CF5C: @ 810CF5C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810CF94
	ldr r3, _0810CF98
	adds r1, r3, 0
	strh r1, [r2]
	ldr r2, _0810CF9C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r1, [r4, 0xC]
	cmp r1, 0x7
	bhi _0810CFA4
	adds r0, r1, 0x1
	strh r0, [r4, 0xC]
	lsls r1, 1
	ldr r0, _0810CFA0
	adds r0, r1, r0
	movs r2, 0x10
	subs r2, r1
	lsls r2, 16
	lsrs r2, 16
	movs r1, 0xE0
	bl LoadPalette
	b _0810CFB6
	.align 2, 0
_0810CF94: .4byte REG_BLDALPHA
_0810CF98: .4byte 0x00001010
_0810CF9C: .4byte gTasks
_0810CFA0: .4byte gUnknown_083F809C
_0810CFA4:
	ldr r0, _0810CFBC
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0810CFC0
	str r0, [r4]
	movs r0, 0x8
	strh r0, [r4, 0xC]
_0810CFB6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810CFBC: .4byte gCaveTransitionPalette_White
_0810CFC0: .4byte sub_810CFC4
	thumb_func_end sub_810CF5C

	thumb_func_start sub_810CFC4
sub_810CFC4: @ 810CFC4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810CFE4
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _0810CFE8
	subs r0, r2, 0x1
	strh r0, [r1, 0xC]
	b _0810CFF0
	.align 2, 0
_0810CFE4: .4byte gTasks
_0810CFE8:
	ldr r0, _0810CFF4
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
_0810CFF0:
	pop {r0}
	bx r0
	.align 2, 0
_0810CFF4: .4byte gMain
	thumb_func_end sub_810CFC4

	thumb_func_start sub_810CFF8
sub_810CFF8: @ 810CFF8
	push {lr}
	ldr r0, _0810D008
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0810D008: .4byte sub_810D00C
	thumb_func_end sub_810CFF8

	thumb_func_start sub_810D00C
sub_810D00C: @ 810D00C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810D020
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0810D024
	str r0, [r1]
	bx lr
	.align 2, 0
_0810D020: .4byte gTasks
_0810D024: .4byte sub_810D028
	thumb_func_end sub_810D00C

	thumb_func_start sub_810D028
sub_810D028: @ 810D028
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r6, 0x80
	lsls r6, 19
	movs r4, 0
	strh r4, [r6]
	ldr r0, _0810D098
	ldr r1, _0810D09C
	bl LZ77UnCompVram
	ldr r0, _0810D0A0
	ldr r1, _0810D0A4
	bl LZ77UnCompVram
	ldr r0, _0810D0A8
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	ldr r1, _0810D0AC
	ldr r2, _0810D0B0
	adds r0, r2, 0
	strh r0, [r1]
	movs r1, 0x8A
	lsls r1, 5
	adds r0, r1, 0
	strh r0, [r6]
	ldr r0, _0810D0B4
	movs r1, 0xE0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0810D0B8
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _0810D0BC
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810D0C0
	str r1, [r0]
	movs r2, 0
	movs r1, 0x10
	strh r1, [r0, 0x8]
	strh r2, [r0, 0xA]
	strh r2, [r0, 0xC]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810D098: .4byte gCaveTransitionTiles
_0810D09C: .4byte 0x0600c000
_0810D0A0: .4byte gCaveTransitionTilemap
_0810D0A4: .4byte 0x0600f800
_0810D0A8: .4byte REG_BLDCNT
_0810D0AC: .4byte REG_BG0CNT
_0810D0B0: .4byte 0x00001f0c
_0810D0B4: .4byte gCaveTransitionPalette_White
_0810D0B8: .4byte gCaveTransitionPalette_Black
_0810D0BC: .4byte gTasks
_0810D0C0: .4byte sub_810D0C4
	thumb_func_end sub_810D028

	thumb_func_start sub_810D0C4
sub_810D0C4: @ 810D0C4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810D0F8
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r3, r1, r2
	ldrh r1, [r3, 0xC]
	cmp r1, 0xF
	bhi _0810D100
	adds r2, r1, 0x1
	adds r0, r2, 0x1
	strh r0, [r3, 0xC]
	movs r0, 0xF
	subs r0, r1
	lsls r0, 1
	ldr r1, _0810D0FC
	adds r0, r1
	lsls r2, 17
	lsrs r2, 16
	movs r1, 0xE0
	bl LoadPalette
	b _0810D114
	.align 2, 0
_0810D0F8: .4byte gTasks
_0810D0FC: .4byte gUnknown_083F808C
_0810D100:
	ldr r1, _0810D118
	ldr r2, _0810D11C
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	ldr r2, _0810D120
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0810D124
	str r0, [r3]
_0810D114:
	pop {r0}
	bx r0
	.align 2, 0
_0810D118: .4byte REG_BLDALPHA
_0810D11C: .4byte 0x00001010
_0810D120: .4byte 0x00003e41
_0810D124: .4byte sub_810D128
	thumb_func_end sub_810D0C4

	thumb_func_start sub_810D128
sub_810D128: @ 810D128
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810D158
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r3, r1, r2
	ldrh r0, [r3, 0xA]
	movs r1, 0x10
	subs r1, r0
	lsls r1, 16
	movs r2, 0x80
	lsls r2, 21
	adds r0, r1, r2
	lsrs r0, 16
	ldr r2, _0810D15C
	strh r0, [r2]
	cmp r1, 0
	beq _0810D160
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	b _0810D172
	.align 2, 0
_0810D158: .4byte gTasks
_0810D15C: .4byte REG_BLDALPHA
_0810D160:
	ldr r0, _0810D178
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0810D17C
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
_0810D172:
	pop {r0}
	bx r0
	.align 2, 0
_0810D178: .4byte gCaveTransitionPalette_Black
_0810D17C: .4byte gMain
	thumb_func_end sub_810D128

	thumb_func_start sub_810D180
sub_810D180: @ 810D180
	push {r4-r7,lr}
	sub sp, 0x4
	bl sp000_heal_pokemon
	ldr r4, _0810D1A0
	adds r0, r4, 0
	bl FlagGet
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1
	bne _0810D1A8
	ldr r0, _0810D1A4
	strb r1, [r0]
	b _0810D1B4
	.align 2, 0
_0810D1A0: .4byte 0x00000804
_0810D1A4: .4byte gUnknown_02039324
_0810D1A8:
	ldr r1, _0810D1E8
	movs r0, 0
	strb r0, [r1]
	adds r0, r4, 0
	bl FlagSet
_0810D1B4:
	movs r0, 0x1
	bl sub_8053108
	cmp r0, 0
	bne _0810D1D4
	ldr r2, _0810D1EC
	ldrh r1, [r2, 0xE]
	lsls r1, 16
	ldrb r0, [r2, 0x10]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x11]
	orrs r1, r0
	movs r0, 0x1
	bl sav12_xor_set
_0810D1D4:
	bl sub_8047A10
	ldr r0, _0810D1EC
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _0810D1F0
	movs r0, 0x1
	bl sub_80537CC
	b _0810D1F6
	.align 2, 0
_0810D1E8: .4byte gUnknown_02039324
_0810D1EC: .4byte gSaveBlock2
_0810D1F0:
	movs r0, 0x2
	bl sub_80537CC
_0810D1F6:
	movs r6, 0
	movs r5, 0
	mov r7, sp
_0810D1FC:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0810D260
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x5
	bl GetMonData
	cmp r0, 0
	beq _0810D23A
	adds r0, r4, 0
	movs r1, 0x6
	bl GetMonData
	cmp r0, 0
	bne _0810D23A
	adds r0, r4, 0
	movs r1, 0x43
	bl GetMonData
	cmp r0, 0
	bne _0810D23A
	movs r0, 0x1
	strb r0, [r7]
	adds r0, r4, 0
	movs r1, 0x43
	mov r2, sp
	bl SetMonData
	movs r6, 0x1
_0810D23A:
	adds r5, 0x1
	cmp r5, 0x5
	ble _0810D1FC
	cmp r6, 0x1
	bne _0810D250
	movs r0, 0x2A
	bl sav12_xor_increment
	ldr r0, _0810D264
	bl FlagSet
_0810D250:
	ldr r0, _0810D268
	bl SetMainCallback2
	movs r0, 0
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810D260: .4byte gPlayerParty
_0810D264: .4byte 0x0000083b
_0810D268: .4byte sub_8141F90
	thumb_func_end sub_810D180

	thumb_func_start sp0C8_whiteout_maybe
sp0C8_whiteout_maybe: @ 810D26C
	push {lr}
	ldr r0, _0810D27C
	bl SetMainCallback2
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0810D27C: .4byte c2_whiteout
	thumb_func_end sp0C8_whiteout_maybe

	thumb_func_start sub_810D280
sub_810D280: @ 810D280
	push {r4,lr}
	ldr r0, _0810D2A4
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _0810D2A8
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 16
	orrs r4, r0
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0810D2A4: .4byte 0x00004024
_0810D2A8: .4byte 0x00004025
	thumb_func_end sub_810D280

	thumb_func_start sub_810D2AC
sub_810D2AC: @ 810D2AC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0810D2CC
	lsrs r1, r4, 16
	bl VarSet
	ldr r0, _0810D2D0
	lsls r4, 16
	lsrs r4, 16
	adds r1, r4, 0
	bl VarSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810D2CC: .4byte 0x00004024
_0810D2D0: .4byte 0x00004025
	thumb_func_end sub_810D2AC

	thumb_func_start unref_sub_810D2D4
unref_sub_810D2D4: @ 810D2D4
	push {r4,lr}
	bl Random
	adds r4, r0, 0
	bl Random
	lsls r4, 16
	lsls r0, 16
	lsrs r0, 16
	orrs r4, r0
	adds r0, r4, 0
	bl sub_810D2AC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_810D2D4

	thumb_func_start sub_810D2F4
sub_810D2F4: @ 810D2F4
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl sub_810D280
	adds r1, r0, 0
	cmp r4, 0
	beq _0810D318
	ldr r3, _0810D324
	ldr r2, _0810D328
_0810D308:
	adds r0, r1, 0
	muls r0, r3
	adds r1, r0, r2
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	bne _0810D308
_0810D318:
	adds r0, r1, 0
	bl sub_810D2AC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810D324: .4byte 0x41c64e6d
_0810D328: .4byte 0x00003039
	thumb_func_end sub_810D2F4

	thumb_func_start sub_810D32C
sub_810D32C: @ 810D32C
	push {r4-r6,lr}
	bl sub_810D280
	lsrs r6, r0, 16
	movs r5, 0
_0810D336:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0810D360
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0810D368
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	ldr r1, _0810D364
	ands r1, r0
	cmp r1, r6
	bne _0810D368
	movs r0, 0x1
	b _0810D370
	.align 2, 0
_0810D360: .4byte gPlayerParty
_0810D364: .4byte 0x0000ffff
_0810D368:
	adds r5, 0x1
	cmp r5, 0x5
	ble _0810D336
	movs r0, 0
_0810D370:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_810D32C

	thumb_func_start sub_810D378
sub_810D378: @ 810D378
	push {lr}
	bl get_map_light_from_warp0
	lsls r0, 24
	lsrs r0, 24
	bl is_light_level_1_2_3_5_or_6
	lsls r0, 24
	cmp r0, 0
	beq _0810D3BE
	bl RtcCalcLocalTime
	ldr r1, _0810D3AC
	ldr r0, _0810D3B0
	ldrb r0, [r0, 0x2]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0810D3B8
	ldr r0, _0810D3B4
	bl FlagSet
	b _0810D3BE
	.align 2, 0
_0810D3AC: .4byte gUnknown_083F8340
_0810D3B0: .4byte gLocalTime
_0810D3B4: .4byte 0x0000083a
_0810D3B8:
	ldr r0, _0810D3C4
	bl FlagReset
_0810D3BE:
	pop {r0}
	bx r0
	.align 2, 0
_0810D3C4: .4byte 0x0000083a
	thumb_func_end sub_810D378

	thumb_func_start sub_810D3C8
sub_810D3C8: @ 810D3C8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807DDFC
	lsls r0, 24
	cmp r0, 0
	beq _0810D3E2
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_0810D3E2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_810D3C8

	thumb_func_start sub_810D3E8
sub_810D3E8: @ 810D3E8
	push {lr}
	ldr r0, _0810D3F8
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0810D3F8: .4byte sub_810D3C8
	thumb_func_end sub_810D3E8

	thumb_func_start sub_810D3FC
sub_810D3FC: @ 810D3FC
	push {lr}
	ldr r0, _0810D40C
	bl GetVarPointer
	movs r1, 0
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0810D40C: .4byte 0x00004049
	thumb_func_end sub_810D3FC

	thumb_func_start sub_810D410
sub_810D410: @ 810D410
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _0810D438
	bl GetVarPointer
	adds r5, r0, 0
	ldrh r0, [r5]
	adds r4, r0
	strh r4, [r5]
	ldrh r0, [r5]
	movs r1, 0x7
	bl __umodsi3
	strh r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810D438: .4byte 0x00004049
	thumb_func_end sub_810D410

	thumb_func_start sub_810D43C
sub_810D43C: @ 810D43C
	push {lr}
	ldr r0, _0810D458
	ldrh r0, [r0]
	cmp r0, 0
	bne _0810D460
	movs r0, 0
	bl sub_8090F68
	ldr r1, _0810D45C
	strh r0, [r1]
	movs r0, 0x1
	bl sub_8090F68
	b _0810D470
	.align 2, 0
_0810D458: .4byte gUnknown_0202E8CC
_0810D45C: .4byte gUnknown_0202E8CE
_0810D460:
	movs r0, 0
	bl pokedex_count
	ldr r1, _0810D480
	strh r0, [r1]
	movs r0, 0x1
	bl pokedex_count
_0810D470:
	ldr r1, _0810D484
	strh r0, [r1]
	bl sub_806912C
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_0810D480: .4byte gUnknown_0202E8CE
_0810D484: .4byte gUnknown_0202E8D0
	thumb_func_end sub_810D43C

	thumb_func_start sub_810D488
sub_810D488: @ 810D488
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x9
	bhi _0810D494
	b _0810D5EC
_0810D494:
	cmp r0, 0x13
	bhi _0810D4A0
	ldr r0, _0810D49C
	b _0810D5F6
	.align 2, 0
_0810D49C: .4byte gUnknown_081C456A
_0810D4A0:
	cmp r0, 0x1D
	bhi _0810D4AC
	ldr r0, _0810D4A8
	b _0810D5F6
	.align 2, 0
_0810D4A8: .4byte gUnknown_081C45B0
_0810D4AC:
	cmp r0, 0x27
	bhi _0810D4B8
	ldr r0, _0810D4B4
	b _0810D5F6
	.align 2, 0
_0810D4B4: .4byte gUnknown_081C45F9
_0810D4B8:
	cmp r0, 0x31
	bhi _0810D4C4
	ldr r0, _0810D4C0
	b _0810D5F6
	.align 2, 0
_0810D4C0: .4byte gUnknown_081C4648
_0810D4C4:
	cmp r0, 0x3B
	bhi _0810D4D0
	ldr r0, _0810D4CC
	b _0810D5F6
	.align 2, 0
_0810D4CC: .4byte gUnknown_081C467E
_0810D4D0:
	cmp r0, 0x45
	bhi _0810D4DC
	ldr r0, _0810D4D8
	b _0810D5F6
	.align 2, 0
_0810D4D8: .4byte gUnknown_081C46B9
_0810D4DC:
	cmp r0, 0x4F
	bhi _0810D4E8
	ldr r0, _0810D4E4
	b _0810D5F6
	.align 2, 0
_0810D4E4: .4byte gUnknown_081C46FE
_0810D4E8:
	cmp r0, 0x59
	bhi _0810D4F4
	ldr r0, _0810D4F0
	b _0810D5F6
	.align 2, 0
_0810D4F0: .4byte gUnknown_081C4747
_0810D4F4:
	cmp r0, 0x63
	bhi _0810D500
	ldr r0, _0810D4FC
	b _0810D5F6
	.align 2, 0
_0810D4FC: .4byte gUnknown_081C4780
_0810D500:
	cmp r0, 0x6D
	bhi _0810D50C
	ldr r0, _0810D508
	b _0810D5F6
	.align 2, 0
_0810D508: .4byte gUnknown_081C47DF
_0810D50C:
	cmp r0, 0x77
	bhi _0810D518
	ldr r0, _0810D514
	b _0810D5F6
	.align 2, 0
_0810D514: .4byte gUnknown_081C4828
_0810D518:
	cmp r0, 0x81
	bhi _0810D524
	ldr r0, _0810D520
	b _0810D5F6
	.align 2, 0
_0810D520: .4byte gUnknown_081C4863
_0810D524:
	cmp r0, 0x8B
	bhi _0810D530
	ldr r0, _0810D52C
	b _0810D5F6
	.align 2, 0
_0810D52C: .4byte gUnknown_081C489C
_0810D530:
	cmp r0, 0x95
	bhi _0810D53C
	ldr r0, _0810D538
	b _0810D5F6
	.align 2, 0
_0810D538: .4byte gUnknown_081C48EB
_0810D53C:
	cmp r0, 0x9F
	bhi _0810D548
	ldr r0, _0810D544
	b _0810D5F6
	.align 2, 0
_0810D544: .4byte gUnknown_081C4936
_0810D548:
	cmp r0, 0xA9
	bhi _0810D554
	ldr r0, _0810D550
	b _0810D5F6
	.align 2, 0
_0810D550: .4byte gUnknown_081C49A2
_0810D554:
	cmp r0, 0xB3
	bhi _0810D560
	ldr r0, _0810D55C
	b _0810D5F6
	.align 2, 0
_0810D55C: .4byte gUnknown_081C4A06
_0810D560:
	cmp r0, 0xBD
	bhi _0810D56C
	ldr r0, _0810D568
	b _0810D5F6
	.align 2, 0
_0810D568: .4byte gUnknown_081C4A4F
_0810D56C:
	cmp r0, 0xC7
	bls _0810D5DA
	cmp r0, 0xC8
	bne _0810D5A8
	ldr r0, _0810D5A4
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	bne _0810D5DA
	movs r0, 0xCD
	lsls r0, 1
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	bne _0810D5DA
	b _0810D5F4
	.align 2, 0
_0810D5A4: .4byte 0x00000199
_0810D5A8:
	cmp r0, 0xC9
	bne _0810D5E8
	ldr r0, _0810D5E0
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	beq _0810D5F4
	movs r0, 0xCD
	lsls r0, 1
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	beq _0810D5F4
_0810D5DA:
	ldr r0, _0810D5E4
	b _0810D5F6
	.align 2, 0
_0810D5E0: .4byte 0x00000199
_0810D5E4: .4byte gUnknown_081C4A91
_0810D5E8:
	cmp r0, 0xCA
	beq _0810D5F4
_0810D5EC:
	ldr r0, _0810D5F0
	b _0810D5F6
	.align 2, 0
_0810D5F0: .4byte gUnknown_081C4520
_0810D5F4:
	ldr r0, _0810D5FC
_0810D5F6:
	pop {r1}
	bx r1
	.align 2, 0
_0810D5FC: .4byte gUnknown_081C4ADA
	thumb_func_end sub_810D488

	thumb_func_start sub_810D600
sub_810D600: @ 810D600
	push {lr}
	ldr r0, _0810D614
	ldrh r0, [r0]
	bl sub_810D488
	bl ShowFieldMessage
	pop {r0}
	bx r0
	.align 2, 0
_0810D614: .4byte gUnknown_0202E8CC
	thumb_func_end sub_810D600

	thumb_func_start sub_810D618
sub_810D618: @ 810D618
	push {lr}
	ldr r0, _0810D628
	bl SetMainCallback2
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_0810D628: .4byte sub_81428CC
	thumb_func_end sub_810D618

	thumb_func_start sub_810D62C
sub_810D62C: @ 810D62C
	push {lr}
	ldr r0, _0810D640
	bl SetMainCallback2
	ldr r1, _0810D644
	ldr r0, _0810D648
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0810D640: .4byte c2_exit_to_overworld_2_switch
_0810D644: .4byte gUnknown_0300485C
_0810D648: .4byte mapldr_080CA5C0
	thumb_func_end sub_810D62C

	thumb_func_start mapldr_080CA5C0
mapldr_080CA5C0: @ 810D64C
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	bl sub_8053E90
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	bl sp109_CreatePCMenu
	bl sub_80B5838
	ldr r0, _0810D680
	movs r1, 0xA
	bl CreateTask
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0810D680: .4byte sub_810D684
	thumb_func_end mapldr_080CA5C0

	thumb_func_start sub_810D684
sub_810D684: @ 810D684
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0810D6A0
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0810D69C
	adds r0, r2, 0
	bl DestroyTask
_0810D69C:
	pop {r0}
	bx r0
	.align 2, 0
_0810D6A0: .4byte gPaletteFade
	thumb_func_end sub_810D684

	thumb_func_start sub_810D6A4
sub_810D6A4: @ 810D6A4
	push {lr}
	ldr r0, _0810D6B4
	bl SetMainCallback2
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_0810D6B4: .4byte sub_8145D88
	thumb_func_end sub_810D6A4

	thumb_func_start sub_810D6B8
sub_810D6B8: @ 810D6B8
	push {lr}
	ldr r0, _0810D6D0
	ldr r1, _0810D6D4
	str r1, [r0, 0x8]
	ldr r0, _0810D6D8
	bl SetMainCallback2
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_0810D6D0: .4byte gMain
_0810D6D4: .4byte c2_exit_to_overworld_2_switch
_0810D6D8: .4byte Cb2_ViewWallClock
	thumb_func_end sub_810D6B8

	thumb_func_start wild_pokemon_reroll
wild_pokemon_reroll: @ 810D6DC
	ldr r0, _0810D6F0
	movs r1, 0
	strb r1, [r0]
	ldr r0, _0810D6F4
	strb r1, [r0]
	ldr r1, _0810D6F8
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_0810D6F0: .4byte gUnknown_02039250
_0810D6F4: .4byte gUnknown_02039251
_0810D6F8: .4byte gUnknown_02039254
	thumb_func_end wild_pokemon_reroll

	thumb_func_start sub_810D6FC
sub_810D6FC: @ 810D6FC
	ldr r1, _0810D714
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _0810D718
	movs r0, 0
	strb r0, [r1]
	ldr r1, _0810D71C
	ldr r0, _0810D720
	ldr r0, [r0, 0x20]
	str r0, [r1]
	bx lr
	.align 2, 0
_0810D714: .4byte gUnknown_02039250
_0810D718: .4byte gUnknown_02039251
_0810D71C: .4byte gUnknown_02039254
_0810D720: .4byte gMain
	thumb_func_end sub_810D6FC

	thumb_func_start sp0E3_walkrun_bitfield_interpretation
sp0E3_walkrun_bitfield_interpretation: @ 810D724
	push {lr}
	movs r0, 0x4
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _0810D736
	movs r0, 0x1
	b _0810D748
_0810D736:
	movs r0, 0x2
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	bne _0810D746
	movs r0, 0
	b _0810D748
_0810D746:
	movs r0, 0x2
_0810D748:
	pop {r1}
	bx r1
	thumb_func_end sp0E3_walkrun_bitfield_interpretation

	thumb_func_start sub_810D74C
sub_810D74C: @ 810D74C
	push {r4-r7,lr}
	adds r7, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	cmp r6, 0x63
	bhi _0810D778
	ldr r4, _0810D770
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r1, _0810D774
	adds r0, r4, 0
	bl StringAppend
	b _0810D780
	.align 2, 0
_0810D770: .4byte gStringVar1
_0810D774: .4byte gOtherText_Times
_0810D778:
	ldr r0, _0810D7CC
	ldr r1, _0810D7D0
	bl StringCopy
_0810D780:
	ldr r0, _0810D7D4
	cmp r7, r0
	bhi _0810D7E0
	ldr r4, _0810D7D8
	adds r0, r7, 0
	movs r1, 0x3C
	bl __udivsi3
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	movs r0, 0xAD
	strb r0, [r4, 0x2]
	adds r5, r4, 0x3
	adds r0, r7, 0
	movs r1, 0x3C
	bl __umodsi3
	movs r1, 0x64
	muls r0, r1
	movs r1, 0x3C
	bl __udivsi3
	adds r1, r0, 0
	adds r0, r5, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r1, _0810D7DC
	adds r0, r4, 0
	bl StringAppend
	b _0810D7E8
	.align 2, 0
_0810D7CC: .4byte gStringVar1
_0810D7D0: .4byte gOtherText_99Times
_0810D7D4: .4byte 0x00000e0f
_0810D7D8: .4byte gStringVar2
_0810D7DC: .4byte gOtherText_Seconds
_0810D7E0:
	ldr r0, _0810D7F4
	ldr r1, _0810D7F8
	bl StringCopy
_0810D7E8:
	movs r4, 0
	cmp r6, 0
	bne _0810D7FC
	movs r4, 0x5
	b _0810D81A
	.align 2, 0
_0810D7F4: .4byte gStringVar2
_0810D7F8: .4byte gOtherText_1Minute
_0810D7FC:
	cmp r6, 0x3
	bhi _0810D804
	movs r4, 0x4
	b _0810D81A
_0810D804:
	cmp r6, 0x9
	bhi _0810D80C
	movs r4, 0x3
	b _0810D81A
_0810D80C:
	cmp r6, 0x13
	bhi _0810D814
	movs r4, 0x2
	b _0810D81A
_0810D814:
	cmp r6, 0x63
	bhi _0810D81A
	movs r4, 0x1
_0810D81A:
	adds r0, r7, 0
	movs r1, 0x3C
	bl __udivsi3
	cmp r0, 0xA
	bhi _0810D82A
	adds r0, r4, 0x5
	b _0810D848
_0810D82A:
	cmp r0, 0xF
	bhi _0810D832
	adds r0, r4, 0x4
	b _0810D848
_0810D832:
	cmp r0, 0x14
	bhi _0810D83A
	adds r0, r4, 0x3
	b _0810D848
_0810D83A:
	cmp r0, 0x28
	bhi _0810D842
	adds r0, r4, 0x2
	b _0810D848
_0810D842:
	cmp r0, 0x3B
	bhi _0810D84C
	adds r0, r4, 0x1
_0810D848:
	lsls r0, 24
	lsrs r4, r0, 24
_0810D84C:
	ldr r0, _0810D858
	strh r4, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810D858: .4byte gScriptResult
	thumb_func_end sub_810D74C

	thumb_func_start sub_810D85C
sub_810D85C: @ 810D85C
	push {r4,r5,lr}
	ldr r0, _0810D880
	ldr r1, _0810D884
	ldr r4, [r0, 0x20]
	ldr r0, [r1]
	subs r4, r0
	ldr r5, _0810D888
	ldrb r1, [r5]
	adds r0, r4, 0
	bl sub_810D74C
	ldrb r1, [r5]
	adds r0, r4, 0
	bl sub_810D88C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810D880: .4byte gMain
_0810D884: .4byte gUnknown_02039254
_0810D888: .4byte gUnknown_02039251
	thumb_func_end sub_810D85C

	thumb_func_start sub_810D88C
sub_810D88C: @ 810D88C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	ldr r6, _0810D8E0
	adds r0, r6, 0
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r7, _0810D8E4
	adds r0, r7, 0
	bl VarGet
	lsls r0, 16
	adds r4, r0
	cmp r4, r5
	bhi _0810D8BC
	cmp r4, 0
	bne _0810D8D6
_0810D8BC:
	lsls r1, r5, 16
	lsrs r1, 16
	adds r0, r6, 0
	bl VarSet
	lsrs r1, r5, 16
	adds r0, r7, 0
	bl VarSet
	ldr r0, _0810D8E8
	mov r1, r8
	bl VarSet
_0810D8D6:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810D8E0: .4byte 0x00004028
_0810D8E4: .4byte 0x00004029
_0810D8E8: .4byte 0x00004027
	thumb_func_end sub_810D88C

	thumb_func_start sub_810D8EC
sub_810D8EC: @ 810D8EC
	push {r4,lr}
	ldr r0, _0810D920
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _0810D924
	bl VarGet
	lsls r0, 16
	adds r4, r0
	cmp r4, 0
	beq _0810D92C
	ldr r0, _0810D928
	bl VarGet
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_810D74C
	movs r0, 0x1
	b _0810D92E
	.align 2, 0
_0810D920: .4byte 0x00004028
_0810D924: .4byte 0x00004029
_0810D928: .4byte 0x00004027
_0810D92C:
	movs r0, 0
_0810D92E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810D8EC

	thumb_func_start sub_810D934
sub_810D934: @ 810D934
	push {r4,lr}
	ldr r0, _0810D974
	ldrh r1, [r0]
	ldr r0, _0810D978
	cmp r1, r0
	beq _0810D96C
	ldr r4, _0810D97C
	adds r0, r4, 0
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	beq _0810D95E
	adds r0, r4, 0
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3
	bne _0810D96C
_0810D95E:
	adds r0, r4, 0
	movs r1, 0
	bl VarSet
	movs r0, 0
	bl sav1_set_battle_music_maybe
_0810D96C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810D974: .4byte gUnknown_020297F0
_0810D978: .4byte 0x00000c1d
_0810D97C: .4byte 0x000040a9
	thumb_func_end sub_810D934

	thumb_func_start sub_810D980
sub_810D980: @ 810D980
	push {lr}
	ldr r0, _0810D998
	bl FlagSet
	ldr r0, _0810D99C
	bl GetVarPointer
	movs r1, 0
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0810D998: .4byte 0x0000082d
_0810D99C: .4byte 0x0000404a
	thumb_func_end sub_810D980

	thumb_func_start sub_810D9A0
sub_810D9A0: @ 810D9A0
	push {lr}
	ldr r0, _0810D9AC
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_0810D9AC: .4byte 0x0000082d
	thumb_func_end sub_810D9A0

	thumb_func_start sub_810D9B0
sub_810D9B0: @ 810D9B0
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _0810D9DC
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0810D9D6
	ldr r0, _0810D9E0
	bl GetVarPointer
	ldrh r1, [r0]
	adds r1, r4, r1
	strh r1, [r0]
	lsls r1, 16
	lsrs r1, 16
	cmp r1, 0xCC
	bhi _0810D9E4
_0810D9D6:
	movs r0, 0
	b _0810D9E6
	.align 2, 0
_0810D9DC: .4byte 0x0000082d
_0810D9E0: .4byte 0x0000404a
_0810D9E4:
	movs r0, 0x1
_0810D9E6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810D9B0

	thumb_func_start sub_810D9EC
sub_810D9EC: @ 810D9EC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r5, r1, 0
	adds r6, r2, 0
	adds r7, r3, 0
	ldr r0, _0810DA1C
	bl GetVarPointer
	adds r4, r0, 0
	ldr r0, _0810DA20
	bl GetVarPointer
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r0, 0x9
	bhi _0810DAB2
	lsls r0, 2
	ldr r1, _0810DA24
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810DA1C: .4byte 0x0000404a
_0810DA20: .4byte 0x000040b4
_0810DA24: .4byte _0810DA28
	.align 2, 0
_0810DA28:
	.4byte _0810DA50
	.4byte _0810DA60
	.4byte _0810DA54
	.4byte _0810DA58
	.4byte _0810DA58
	.4byte _0810DA5C
	.4byte _0810DA88
	.4byte _0810DA50
	.4byte _0810DA54
	.4byte _0810DA5C
_0810DA50:
	movs r0, 0x1
	b _0810DABE
_0810DA54:
	movs r0, 0x4
	b _0810DABE
_0810DA58:
	movs r0, 0x2
	b _0810DABE
_0810DA5C:
	movs r0, 0x3
	b _0810DABE
_0810DA60:
	ldrh r0, [r4]
	cmp r0, 0x3B
	bhi _0810DA70
	movs r0, 0x31
	strb r0, [r5]
	ldrh r0, [r4]
	adds r0, 0x13
	b _0810DAB0
_0810DA70:
	cmp r0, 0x8B
	bhi _0810DA7E
	movs r0, 0x30
	strb r0, [r5]
	ldrh r0, [r4]
	subs r0, 0x3C
	b _0810DAB0
_0810DA7E:
	movs r0, 0x2F
	strb r0, [r5]
	ldrh r0, [r4]
	subs r0, 0x8C
	b _0810DAB0
_0810DA88:
	ldrh r0, [r4]
	cmp r0, 0x41
	bhi _0810DA98
	movs r0, 0x2F
	strb r0, [r5]
	ldrh r1, [r4]
	movs r0, 0x41
	b _0810DAAE
_0810DA98:
	cmp r0, 0x91
	bhi _0810DAA6
	movs r0, 0x30
	strb r0, [r5]
	ldrh r1, [r4]
	movs r0, 0x91
	b _0810DAAE
_0810DAA6:
	movs r0, 0x31
	strb r0, [r5]
	ldrh r1, [r4]
	movs r0, 0xE0
_0810DAAE:
	subs r0, r1
_0810DAB0:
	strh r0, [r6]
_0810DAB2:
	movs r0, 0
	mov r1, r8
	strb r0, [r1]
	movs r0, 0x14
	strh r0, [r7]
	movs r0, 0
_0810DABE:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_810D9EC

	thumb_func_start sub_810DAC8
sub_810DAC8: @ 810DAC8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0
	bl sub_8008218
	lsls r0, 24
	lsrs r7, r0, 24
	bl sub_800820C
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	cmp r4, r5
	bcs _0810DB12
	ldr r0, _0810DB20
	mov r8, r0
_0810DAEA:
	cmp r7, r4
	beq _0810DB08
	lsls r0, r6, 2
	add r0, r8
	ldr r0, [r0]
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 2
	ldr r2, _0810DB24
	adds r1, r2
	bl StringCopy
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0810DB08:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _0810DAEA
_0810DB12:
	adds r0, r5, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810DB20: .4byte gUnknown_083D1464
_0810DB24: .4byte gLinkPlayers + 0x8
	thumb_func_end sub_810DAC8

	thumb_func_start sub_810DB28
sub_810DB28: @ 810DB28
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	movs r7, 0
	movs r0, 0
	mov r9, r0
	mov r8, r0
	ldr r1, _0810DB74
	add r0, sp, 0x8
	movs r2, 0x4
	bl memcpy
	add r4, sp, 0xC
	ldr r1, _0810DB78
	adds r0, r4, 0
	movs r2, 0x8
	bl memcpy
	bl sub_8008218
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x2
	beq _0810DB94
	cmp r0, 0x2
	bgt _0810DB7C
	cmp r0, 0x1
	beq _0810DBC0
	b _0810DBD2
	.align 2, 0
_0810DB74: .4byte gUnknown_083F8358
_0810DB78: .4byte gUnknown_083F835C
_0810DB7C:
	cmp r1, 0x3
	beq _0810DB86
	cmp r1, 0x4
	beq _0810DBA8
	b _0810DBD2
_0810DB86:
	movs r7, 0x2
	ldr r1, _0810DB90
	ldrh r0, [r1]
	subs r0, 0x1
	b _0810DBAE
	.align 2, 0
_0810DB90: .4byte gSaveBlock1
_0810DB94:
	movs r7, 0x1
	ldr r0, _0810DBA4
	ldrh r1, [r0]
	mov r9, r1
	ldrh r0, [r0, 0x2]
	subs r0, 0x1
	b _0810DBCC
	.align 2, 0
_0810DBA4: .4byte gSaveBlock1
_0810DBA8:
	ldr r1, _0810DBBC
	ldrh r0, [r1]
	adds r0, 0x1
_0810DBAE:
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	ldrh r1, [r1, 0x2]
	mov r8, r1
	b _0810DBD2
	.align 2, 0
_0810DBBC: .4byte gSaveBlock1
_0810DBC0:
	movs r7, 0x3
	ldr r0, _0810DBD8
	ldrh r4, [r0]
	mov r9, r4
	ldrh r0, [r0, 0x2]
	adds r0, 0x1
_0810DBCC:
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
_0810DBD2:
	movs r6, 0
	b _0810DC5C
	.align 2, 0
_0810DBD8: .4byte gSaveBlock1
_0810DBDC:
	cmp r10, r6
	beq _0810DC56
	ldr r1, _0810DC74
	lsls r0, r6, 3
	subs r0, r6
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x13]
	movs r0, 0
	bl sub_805983C
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	adds r1, r7
	adds r1, 0x8
	ldrb r1, [r1]
	movs r2, 0xF0
	subs r2, r6
	lsls r2, 24
	lsrs r2, 24
	lsls r5, r7, 1
	mov r3, sp
	adds r3, r5
	adds r3, 0xC
	ldrb r3, [r3]
	lsls r3, 24
	asrs r3, 24
	mov r12, r3
	mov r4, r9
	lsls r3, r4, 16
	asrs r3, 16
	add r3, r12
	adds r3, 0x7
	lsls r3, 16
	asrs r3, 16
	mov r4, sp
	adds r4, 0xD
	adds r4, r5
	ldrb r4, [r4]
	lsls r4, 24
	asrs r4, 24
	mov r12, r4
	mov r5, r8
	lsls r4, r5, 16
	asrs r4, 16
	add r4, r12
	adds r4, 0x7
	lsls r4, 16
	asrs r4, 16
	str r4, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	bl SpawnSpecialFieldObjectParametrized
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x4
	bne _0810DC56
	movs r7, 0
_0810DC56:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0810DC5C:
	ldr r0, _0810DC78
	ldrh r0, [r0]
	cmp r6, r0
	bcc _0810DBDC
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810DC74: .4byte gLinkPlayers
_0810DC78: .4byte gUnknown_0202E8CC
	thumb_func_end sub_810DB28

	thumb_func_start sub_810DC7C
sub_810DC7C: @ 810DC7C
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _0810DC9C
_0810DC82:
	ldr r0, _0810DCA0
	ldrh r0, [r0]
	cmp r4, r0
	bne _0810DCA8
	lsls r1, r4, 2
	adds r1, r5
	ldrb r0, [r1]
	ldrb r1, [r1, 0x1]
	ldr r2, _0810DCA4
	bl MapGridSetMetatileIdAt
	b _0810DCB6
	.align 2, 0
_0810DC9C: .4byte gUnknown_083F8364
_0810DCA0: .4byte gUnknown_0202E8CC
_0810DCA4: .4byte 0x00000206
_0810DCA8:
	lsls r1, r4, 2
	adds r1, r5
	ldrb r0, [r1]
	ldrb r1, [r1, 0x1]
	ldr r2, _0810DCC8
	bl MapGridSetMetatileIdAt
_0810DCB6:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _0810DC82
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810DCC8: .4byte 0x00000205
	thumb_func_end sub_810DC7C

	thumb_func_start sub_810DCCC
sub_810DCCC: @ 810DCCC
	push {r4-r6,lr}
	movs r5, 0xC
_0810DCD0:
	movs r4, 0x7
	adds r6, r5, 0x1
_0810DCD4:
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetMetatileIdAt
	ldr r1, _0810DCF0
	adds r0, r1
	cmp r0, 0x37
	bls _0810DCE6
	b _0810DEC0
_0810DCE6:
	lsls r0, 2
	ldr r1, _0810DCF4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810DCF0: .4byte 0xfffffde6
_0810DCF4: .4byte _0810DCF8
	.align 2, 0
_0810DCF8:
	.4byte _0810DE7E
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DDD8
	.4byte _0810DDDE
	.4byte _0810DE18
	.4byte _0810DE20
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DDE8
	.4byte _0810DDEE
	.4byte _0810DE28
	.4byte _0810DE30
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DDF8
	.4byte _0810DDFE
	.4byte _0810DE38
	.4byte _0810DE40
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DE08
	.4byte _0810DE10
	.4byte _0810DE48
	.4byte _0810DE50
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DE58
	.4byte _0810DE68
	.4byte _0810DE78
	.4byte _0810DEA0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DE60
	.4byte _0810DE70
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEB6
	.4byte _0810DEA8
_0810DDD8:
	movs r2, 0x8C
	lsls r2, 2
	b _0810DEAC
_0810DDDE:
	ldr r2, _0810DDE4
	b _0810DEAC
	.align 2, 0
_0810DDE4: .4byte 0x00000231
_0810DDE8:
	movs r2, 0x8E
	lsls r2, 2
	b _0810DEAC
_0810DDEE:
	ldr r2, _0810DDF4
	b _0810DEAC
	.align 2, 0
_0810DDF4: .4byte 0x00000239
_0810DDF8:
	movs r2, 0x88
	lsls r2, 2
	b _0810DEAC
_0810DDFE:
	ldr r2, _0810DE04
	b _0810DEAC
	.align 2, 0
_0810DE04: .4byte 0x00000221
_0810DE08:
	ldr r2, _0810DE0C
	b _0810DEAC
	.align 2, 0
_0810DE0C: .4byte 0x00000e28
_0810DE10:
	ldr r2, _0810DE14
	b _0810DEAC
	.align 2, 0
_0810DE14: .4byte 0x00000e29
_0810DE18:
	ldr r2, _0810DE1C
	b _0810DEAC
	.align 2, 0
_0810DE1C: .4byte 0x00000232
_0810DE20:
	ldr r2, _0810DE24
	b _0810DEAC
	.align 2, 0
_0810DE24: .4byte 0x00000233
_0810DE28:
	ldr r2, _0810DE2C
	b _0810DEAC
	.align 2, 0
_0810DE2C: .4byte 0x0000023a
_0810DE30:
	ldr r2, _0810DE34
	b _0810DEAC
	.align 2, 0
_0810DE34: .4byte 0x0000023b
_0810DE38:
	ldr r2, _0810DE3C
	b _0810DEAC
	.align 2, 0
_0810DE3C: .4byte 0x00000222
_0810DE40:
	ldr r2, _0810DE44
	b _0810DEAC
	.align 2, 0
_0810DE44: .4byte 0x00000223
_0810DE48:
	ldr r2, _0810DE4C
	b _0810DEAC
	.align 2, 0
_0810DE4C: .4byte 0x00000e2a
_0810DE50:
	ldr r2, _0810DE54
	b _0810DEAC
	.align 2, 0
_0810DE54: .4byte 0x00000e2b
_0810DE58:
	ldr r2, _0810DE5C
	b _0810DEAC
	.align 2, 0
_0810DE5C: .4byte 0x00000e42
_0810DE60:
	ldr r2, _0810DE64
	b _0810DEAC
	.align 2, 0
_0810DE64: .4byte 0x0000021a
_0810DE68:
	ldr r2, _0810DE6C
	b _0810DEAC
	.align 2, 0
_0810DE6C: .4byte 0x00000e43
_0810DE70:
	ldr r2, _0810DE74
	b _0810DEAC
	.align 2, 0
_0810DE74: .4byte 0x0000021a
_0810DE78:
	movs r2, 0xE4
	lsls r2, 4
	b _0810DEAC
_0810DE7E:
	subs r1, r5, 0x1
	adds r0, r4, 0
	bl MapGridGetMetatileIdAt
	movs r1, 0x90
	lsls r1, 2
	cmp r0, r1
	bne _0810DE98
	ldr r2, _0810DE94
	b _0810DEAC
	.align 2, 0
_0810DE94: .4byte 0x00000e48
_0810DE98:
	ldr r2, _0810DE9C
	b _0810DEAC
	.align 2, 0
_0810DE9C: .4byte 0x00000e49
_0810DEA0:
	ldr r2, _0810DEA4
	b _0810DEAC
	.align 2, 0
_0810DEA4: .4byte 0x00000e41
_0810DEA8:
	movs r2, 0xE5
	lsls r2, 4
_0810DEAC:
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
	b _0810DEC0
_0810DEB6:
	ldr r2, _0810DED8
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
_0810DEC0:
	adds r4, 0x1
	cmp r4, 0xF
	bgt _0810DEC8
	b _0810DCD4
_0810DEC8:
	adds r5, r6, 0
	cmp r5, 0x17
	bgt _0810DED0
	b _0810DCD0
_0810DED0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810DED8: .4byte 0x00000251
	thumb_func_end sub_810DCCC

	thumb_func_start sub_810DEDC
sub_810DEDC: @ 810DEDC
	push {r4-r6,lr}
	ldr r4, _0810DF18
	movs r5, 0x2
_0810DEE2:
	ldrb r0, [r4]
	ldrb r1, [r4, 0x1]
	ldr r2, _0810DF1C
	bl MapGridSetMetatileIdAt
	adds r4, 0x4
	subs r5, 0x1
	cmp r5, 0
	bge _0810DEE2
	movs r5, 0xC
_0810DEF6:
	movs r4, 0x7
	adds r6, r5, 0x1
_0810DEFA:
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetMetatileIdAt
	ldr r1, _0810DF20
	adds r0, r1
	cmp r0, 0x30
	bls _0810DF0C
	b _0810E056
_0810DF0C:
	lsls r0, 2
	ldr r1, _0810DF24
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810DF18: .4byte gUnknown_083F8364
_0810DF1C: .4byte 0x00000206
_0810DF20: .4byte 0xfffffde0
_0810DF24: .4byte _0810DF28
	.align 2, 0
_0810DF28:
	.4byte _0810DFEC
	.4byte _0810DFF2
	.4byte _0810E00C
	.4byte _0810E014
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810DFFC
	.4byte _0810E002
	.4byte _0810E01C
	.4byte _0810E024
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E02C
	.4byte _0810E034
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E03C
	.4byte _0810E03C
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E04C
_0810DFEC:
	movs r2, 0x8C
	lsls r2, 2
	b _0810E03E
_0810DFF2:
	ldr r2, _0810DFF8
	b _0810E03E
	.align 2, 0
_0810DFF8: .4byte 0x00000231
_0810DFFC:
	movs r2, 0x8E
	lsls r2, 2
	b _0810E03E
_0810E002:
	ldr r2, _0810E008
	b _0810E03E
	.align 2, 0
_0810E008: .4byte 0x00000239
_0810E00C:
	ldr r2, _0810E010
	b _0810E03E
	.align 2, 0
_0810E010: .4byte 0x00000232
_0810E014:
	ldr r2, _0810E018
	b _0810E03E
	.align 2, 0
_0810E018: .4byte 0x00000233
_0810E01C:
	ldr r2, _0810E020
	b _0810E03E
	.align 2, 0
_0810E020: .4byte 0x0000023a
_0810E024:
	ldr r2, _0810E028
	b _0810E03E
	.align 2, 0
_0810E028: .4byte 0x0000023b
_0810E02C:
	ldr r2, _0810E030
	b _0810E03E
	.align 2, 0
_0810E030: .4byte 0x00000e42
_0810E034:
	ldr r2, _0810E038
	b _0810E03E
	.align 2, 0
_0810E038: .4byte 0x00000e43
_0810E03C:
	ldr r2, _0810E048
_0810E03E:
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
	b _0810E056
	.align 2, 0
_0810E048: .4byte 0x0000021a
_0810E04C:
	ldr r2, _0810E06C
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
_0810E056:
	adds r4, 0x1
	cmp r4, 0xF
	bgt _0810E05E
	b _0810DEFA
_0810E05E:
	adds r5, r6, 0
	cmp r5, 0x17
	bgt _0810E066
	b _0810DEF6
_0810E066:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810E06C: .4byte 0x00000251
	thumb_func_end sub_810DEDC

	thumb_func_start sub_810E070
sub_810E070: @ 810E070
	push {lr}
	ldr r0, _0810E090
	movs r1, 0
	strb r1, [r0]
	ldr r0, _0810E094
	strb r1, [r0]
	movs r0, 0x2C
	bl PlaySE
	ldr r0, _0810E098
	movs r1, 0x8
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0810E090: .4byte gUnknown_02039258
_0810E094: .4byte gUnknown_02039259
_0810E098: .4byte sub_810E09C
	thumb_func_end sub_810E070

	thumb_func_start sub_810E09C
sub_810E09C: @ 810E09C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0810E0E4
	ldr r5, _0810E0E8
	ldrb r1, [r5]
	adds r0, r1, r0
	ldr r4, _0810E0EC
	ldrb r2, [r4]
	ldrb r0, [r0]
	cmp r0, r2
	bne _0810E0F8
	ldr r0, _0810E0F0
	ldrb r0, [r0]
	ldr r2, _0810E0F4
	lsls r1, 1
	adds r1, r2
	ldrh r1, [r1]
	bl sub_810E104
	movs r0, 0
	strb r0, [r4]
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bne _0810E0FC
	adds r0, r6, 0
	bl DestroyTask
	bl EnableBothScriptContexts
	b _0810E0FC
	.align 2, 0
_0810E0E4: .4byte gUnknown_083F8370
_0810E0E8: .4byte gUnknown_02039259
_0810E0EC: .4byte gUnknown_02039258
_0810E0F0: .4byte gUnknown_0202E8CC
_0810E0F4: .4byte gUnknown_083F8376
_0810E0F8:
	adds r0, r2, 0x1
	strb r0, [r4]
_0810E0FC:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_810E09C

	thumb_func_start sub_810E104
sub_810E104: @ 810E104
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r2, r1, 16
	movs r7, 0
	subs r0, 0x1
	cmp r0, 0x7
	bhi _0810E1CC
	lsls r0, 2
	ldr r1, _0810E128
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810E128: .4byte _0810E12C
	.align 2, 0
_0810E12C:
	.4byte _0810E14C
	.4byte _0810E15E
	.4byte _0810E170
	.4byte _0810E182
	.4byte _0810E190
	.4byte _0810E1A6
	.4byte _0810E1B2
	.4byte _0810E1C0
_0810E14C:
	movs r7, 0x2
	mov r1, sp
	movs r0, 0x1
	strh r0, [r1]
	movs r0, 0x7
	strh r0, [r1, 0x2]
	add r1, sp, 0x8
	movs r0, 0x68
	b _0810E1A0
_0810E15E:
	movs r7, 0x2
	mov r1, sp
	movs r0, 0x1
	strh r0, [r1]
	movs r0, 0x7
	strh r0, [r1, 0x2]
	add r1, sp, 0x8
	movs r0, 0x4E
	b _0810E1A0
_0810E170:
	movs r7, 0x2
	mov r1, sp
	movs r0, 0x1
	strh r0, [r1]
	movs r0, 0x7
	strh r0, [r1, 0x2]
	add r1, sp, 0x8
	movs r0, 0x5B
	b _0810E1A0
_0810E182:
	movs r7, 0x1
	mov r1, sp
	movs r0, 0x7
	strh r0, [r1]
	add r1, sp, 0x8
	movs r0, 0x27
	b _0810E1CA
_0810E190:
	movs r7, 0x2
	mov r1, sp
	movs r0, 0x1
	strh r0, [r1]
	movs r0, 0x7
	strh r0, [r1, 0x2]
	add r1, sp, 0x8
	movs r0, 0x34
_0810E1A0:
	strh r0, [r1]
	strh r0, [r1, 0x2]
	b _0810E1CC
_0810E1A6:
	movs r7, 0x1
	mov r0, sp
	strh r7, [r0]
	add r1, sp, 0x8
	movs r0, 0x41
	b _0810E1CA
_0810E1B2:
	movs r7, 0x1
	mov r1, sp
	movs r0, 0x7
	strh r0, [r1]
	add r1, sp, 0x8
	movs r0, 0xD
	b _0810E1CA
_0810E1C0:
	movs r7, 0x1
	mov r0, sp
	strh r7, [r0]
	add r1, sp, 0x8
	movs r0, 0x1A
_0810E1CA:
	strh r0, [r1]
_0810E1CC:
	movs r6, 0
	cmp r6, r7
	bcs _0810E21E
	movs r1, 0xC0
	lsls r1, 4
	adds r0, r1, 0
	adds r1, r2, 0
	orrs r1, r0
	lsls r1, 16
	mov r9, r1
	adds r1, r2, 0
	adds r1, 0x8
	orrs r1, r0
	lsls r1, 16
	mov r8, r1
_0810E1EA:
	lsls r1, r6, 1
	mov r3, sp
	adds r5, r3, r1
	ldrh r0, [r5]
	adds r0, 0x7
	add r4, sp, 0x8
	adds r4, r1
	ldrh r1, [r4]
	adds r1, 0x7
	mov r3, r9
	lsrs r2, r3, 16
	bl MapGridSetMetatileIdAt
	ldrh r0, [r5]
	adds r0, 0x7
	ldrh r1, [r4]
	adds r1, 0x8
	mov r3, r8
	lsrs r2, r3, 16
	bl MapGridSetMetatileIdAt
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, r7
	bcc _0810E1EA
_0810E21E:
	bl DrawWholeMapView
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810E104

	thumb_func_start sub_810E230
sub_810E230: @ 810E230
	push {lr}
	ldr r0, _0810E244
	ldrb r0, [r0]
	ldr r1, _0810E248
	ldrh r1, [r1, 0x8]
	bl sub_810E104
	pop {r0}
	bx r0
	.align 2, 0
_0810E244: .4byte gUnknown_0202E8CC
_0810E248: .4byte gUnknown_083F8376
	thumb_func_end sub_810E230

	thumb_func_start sub_810E24C
sub_810E24C: @ 810E24C
	push {lr}
	ldr r0, _0810E258
	bl ShowFieldMessage
	pop {r0}
	bx r0
	.align 2, 0
_0810E258: .4byte gStringVar4
	thumb_func_end sub_810E24C

	thumb_func_start sub_810E25C
sub_810E25C: @ 810E25C
	ldr r1, _0810E26C
	ldr r2, _0810E270
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r1, _0810E274
	ldrh r0, [r2, 0x2]
	strh r0, [r1]
	bx lr
	.align 2, 0
_0810E26C: .4byte gUnknown_0202E8CC
_0810E270: .4byte gSaveBlock1
_0810E274: .4byte gUnknown_0202E8CE
	thumb_func_end sub_810E25C

	thumb_func_start sub_810E278
sub_810E278: @ 810E278
	push {lr}
	ldr r0, _0810E294
	ldrb r1, [r0, 0xB]
	lsls r1, 8
	ldrb r0, [r0, 0xA]
	orrs r0, r1
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0810E294: .4byte gSaveBlock2
	thumb_func_end sub_810E278

	thumb_func_start sub_810E298
sub_810E298: @ 810E298
	push {lr}
	ldr r0, _0810E2AC
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _0810E2B8
	ldr r0, _0810E2B0
	ldr r1, _0810E2B4
	bl StringCopy
	b _0810E2C0
	.align 2, 0
_0810E2AC: .4byte gSaveBlock2
_0810E2B0: .4byte gStringVar1
_0810E2B4: .4byte gOtherText_BigGuy
_0810E2B8:
	ldr r0, _0810E2C4
	ldr r1, _0810E2C8
	bl StringCopy
_0810E2C0:
	pop {r0}
	bx r0
	.align 2, 0
_0810E2C4: .4byte gStringVar1
_0810E2C8: .4byte gOtherText_BigGirl
	thumb_func_end sub_810E298

	thumb_func_start sub_810E2CC
sub_810E2CC: @ 810E2CC
	push {lr}
	ldr r0, _0810E2E0
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _0810E2EC
	ldr r0, _0810E2E4
	ldr r1, _0810E2E8
	bl StringCopy
	b _0810E2F4
	.align 2, 0
_0810E2E0: .4byte gSaveBlock2
_0810E2E4: .4byte gStringVar1
_0810E2E8: .4byte gOtherText_Daughter
_0810E2EC:
	ldr r0, _0810E2F8
	ldr r1, _0810E2FC
	bl StringCopy
_0810E2F4:
	pop {r0}
	bx r0
	.align 2, 0
_0810E2F8: .4byte gStringVar1
_0810E2FC: .4byte gOtherText_Son
	thumb_func_end sub_810E2CC

	thumb_func_start sub_810E300
sub_810E300: @ 810E300
	ldr r0, _0810E308
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0810E308: .4byte gUnknown_02024D26
	thumb_func_end sub_810E300

	thumb_func_start sub_810E30C
sub_810E30C: @ 810E30C
	push {lr}
	sub sp, 0x4
	ldr r0, _0810E32C
	ldrh r0, [r0]
	cmp r0, 0
	beq _0810E330
	movs r2, 0x1
	negs r2, r2
	movs r0, 0x4
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r3, 0x6
	bl warp1_set
	b _0810E342
	.align 2, 0
_0810E32C: .4byte gUnknown_0202E8CC
_0810E330:
	movs r2, 0x1
	negs r2, r2
	movs r0, 0x4
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0x1
	movs r3, 0x6
	bl warp1_set
_0810E342:
	add sp, 0x4
	pop {r0}
	bx r0
	thumb_func_end sub_810E30C

	thumb_func_start sub_810E348
sub_810E348: @ 810E348
	push {lr}
	ldr r0, _0810E358
	ldrh r0, [r0]
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_0810E358: .4byte gUnknown_0202E8CC
	thumb_func_end sub_810E348

	thumb_func_start sub_810E35C
sub_810E35C: @ 810E35C
	push {lr}
	ldr r0, _0810E37C
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r1, 0x7
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0810E380
	cmp r0, r1
	bls _0810E376
	adds r0, r1, 0
_0810E376:
	pop {r1}
	bx r1
	.align 2, 0
_0810E37C: .4byte gLocalTime
_0810E380: .4byte 0x0000270f
	thumb_func_end sub_810E35C

	thumb_func_start sub_810E384
sub_810E384: @ 810E384
	push {r4,lr}
	bl sub_810F87C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r1, r0
	ldr r0, _0810E3A8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	cmp r0, 0xFF
	bne _0810E3AC
	movs r0, 0x6
	b _0810E3FE
	.align 2, 0
_0810E3A8: .4byte gPlayerParty
_0810E3AC:
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	cmp r0, 0xC7
	bls _0810E3BC
	movs r0, 0x5
	b _0810E3FE
_0810E3BC:
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	cmp r0, 0x95
	bls _0810E3CC
	movs r0, 0x4
	b _0810E3FE
_0810E3CC:
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	cmp r0, 0x63
	bls _0810E3DC
	movs r0, 0x3
	b _0810E3FE
_0810E3DC:
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	cmp r0, 0x31
	bls _0810E3EC
	movs r0, 0x2
	b _0810E3FE
_0810E3EC:
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	cmp r0, 0
	bne _0810E3FC
	movs r0, 0
	b _0810E3FE
_0810E3FC:
	movs r0, 0x1
_0810E3FE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810E384

	thumb_func_start sub_810E404
sub_810E404: @ 810E404
	push {lr}
	ldr r0, _0810E410
	bl sub_813EEB4
	pop {r0}
	bx r0
	.align 2, 0
_0810E410: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_810E404

	thumb_func_start sub_810E414
sub_810E414: @ 810E414
	push {lr}
	ldr r0, _0810E420
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0810E420: .4byte sub_810E404
	thumb_func_end sub_810E414

	thumb_func_start sub_810E424
sub_810E424: @ 810E424
	push {r4,lr}
	ldr r4, _0810E460
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810E458
	adds r0, r4, 0
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810E464
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	strh r2, [r1, 0x8]
	strh r0, [r1, 0xA]
	strh r2, [r1, 0xC]
	strh r2, [r1, 0xE]
	strh r2, [r1, 0x10]
_0810E458:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810E460: .4byte sub_810E468
_0810E464: .4byte gTasks
	thumb_func_end sub_810E424

	thumb_func_start sub_810E468
sub_810E468: @ 810E468
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0810E48C
	adds r1, r0
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0810E486
	adds r0, r1, 0
	bl sub_810E490
_0810E486:
	pop {r0}
	bx r0
	.align 2, 0
_0810E48C: .4byte gTasks
	thumb_func_end sub_810E468

	thumb_func_start sub_810E490
sub_810E490: @ 810E490
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r6, 0
	movs r5, 0
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	bne _0810E4FC
	strh r5, [r4, 0xE]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x3
	beq _0810E4C4
	cmp r0, 0x3
	bgt _0810E4BA
	cmp r0, 0x2
	beq _0810E4C0
	b _0810E4CC
_0810E4BA:
	cmp r1, 0x4
	beq _0810E4C8
	b _0810E4CC
_0810E4C0:
	movs r6, 0
	b _0810E4CA
_0810E4C4:
	movs r6, 0xFF
	b _0810E4CA
_0810E4C8:
	movs r6, 0x1
_0810E4CA:
	movs r5, 0xFF
_0810E4CC:
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	lsls r1, r6, 24
	asrs r1, 24
	lsls r2, r5, 24
	asrs r2, 24
	bl sub_810E508
	bl DrawWholeMapView
	ldrh r0, [r4, 0x10]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _0810E4FC
	ldrb r0, [r4, 0xA]
	bl DestroyTask
_0810E4FC:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_810E490

	thumb_func_start sub_810E508
sub_810E508: @ 810E508
	push {r4,r5,lr}
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	movs r3, 0
	lsls r0, 16
	cmp r0, 0
	beq _0810E544
	ldr r0, _0810E528
	ldrh r0, [r0]
	cmp r0, 0
	bne _0810E52C
	movs r3, 0x4
	b _0810E566
	.align 2, 0
_0810E528: .4byte gUnknown_0202E8CC
_0810E52C:
	cmp r0, 0x1
	bne _0810E538
	ldr r3, _0810E534
	b _0810E566
	.align 2, 0
_0810E534: .4byte 0x0000025a
_0810E538:
	cmp r0, 0x2
	bne _0810E566
	ldr r3, _0810E540
	b _0810E566
	.align 2, 0
_0810E540: .4byte 0x00000259
_0810E544:
	ldr r0, _0810E550
	ldrh r0, [r0]
	cmp r0, 0
	bne _0810E554
	movs r3, 0x5
	b _0810E566
	.align 2, 0
_0810E550: .4byte gUnknown_0202E8CC
_0810E554:
	cmp r0, 0x1
	bne _0810E560
	ldr r3, _0810E55C
	b _0810E566
	.align 2, 0
_0810E55C: .4byte 0x0000027f
_0810E560:
	cmp r0, 0x2
	bne _0810E566
	ldr r3, _0810E594
_0810E566:
	ldr r2, _0810E598
	movs r5, 0
	ldrsh r0, [r2, r5]
	lsls r1, 24
	asrs r1, 24
	adds r0, r1
	adds r0, 0x7
	movs r5, 0x2
	ldrsh r1, [r2, r5]
	lsls r2, r4, 24
	asrs r2, 24
	adds r1, r2
	adds r1, 0x7
	movs r4, 0xC0
	lsls r4, 4
	adds r2, r4, 0
	orrs r3, r2
	adds r2, r3, 0
	bl MapGridSetMetatileIdAt
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810E594: .4byte 0x0000027e
_0810E598: .4byte gSaveBlock1
	thumb_func_end sub_810E508

	thumb_func_start sub_810E59C
sub_810E59C: @ 810E59C
	push {lr}
	bl sub_810E5A8
	pop {r0}
	bx r0
	thumb_func_end sub_810E59C

	thumb_func_start sub_810E5A8
sub_810E5A8: @ 810E5A8
	push {r4-r6,lr}
	movs r6, 0
	movs r5, 0
	movs r4, 0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x3
	beq _0810E5D2
	cmp r0, 0x3
	bgt _0810E5C8
	cmp r0, 0x2
	beq _0810E5CE
	b _0810E5DA
_0810E5C8:
	cmp r1, 0x4
	beq _0810E5D6
	b _0810E5DA
_0810E5CE:
	movs r6, 0
	b _0810E5D8
_0810E5D2:
	movs r6, 0xFF
	b _0810E5D8
_0810E5D6:
	movs r6, 0x1
_0810E5D8:
	movs r5, 0xFF
_0810E5DA:
	ldr r0, _0810E5E8
	ldrh r0, [r0]
	cmp r0, 0
	bne _0810E5EC
	movs r4, 0x4
	b _0810E5FE
	.align 2, 0
_0810E5E8: .4byte gUnknown_0202E8CC
_0810E5EC:
	cmp r0, 0x1
	bne _0810E5F8
	ldr r4, _0810E5F4
	b _0810E5FE
	.align 2, 0
_0810E5F4: .4byte 0x0000025a
_0810E5F8:
	cmp r0, 0x2
	bne _0810E5FE
	ldr r4, _0810E630
_0810E5FE:
	ldr r2, _0810E634
	movs r1, 0
	ldrsh r0, [r2, r1]
	lsls r1, r6, 24
	asrs r1, 24
	adds r0, r1
	adds r0, 0x7
	movs r3, 0x2
	ldrsh r1, [r2, r3]
	lsls r2, r5, 24
	asrs r2, 24
	adds r1, r2
	adds r1, 0x7
	movs r3, 0xC0
	lsls r3, 4
	adds r2, r3, 0
	orrs r4, r2
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810E630: .4byte 0x00000259
_0810E634: .4byte gSaveBlock1
	thumb_func_end sub_810E5A8

	thumb_func_start sub_810E638
sub_810E638: @ 810E638
	push {r4,lr}
	ldr r4, _0810E674
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810E66C
	adds r0, r4, 0
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810E678
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	strh r2, [r1, 0x8]
	strh r0, [r1, 0xA]
	strh r2, [r1, 0xC]
	strh r2, [r1, 0xE]
	strh r2, [r1, 0x10]
_0810E66C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810E674: .4byte sub_810E67C
_0810E678: .4byte gTasks
	thumb_func_end sub_810E638

	thumb_func_start sub_810E67C
sub_810E67C: @ 810E67C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0810E6A0
	adds r1, r0
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0810E69A
	adds r0, r1, 0
	bl sub_810E6A4
_0810E69A:
	pop {r0}
	bx r0
	.align 2, 0
_0810E6A0: .4byte gTasks
	thumb_func_end sub_810E67C

	thumb_func_start sub_810E6A4
sub_810E6A4: @ 810E6A4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	bne _0810E712
	movs r0, 0
	strh r0, [r4, 0xE]
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0810E6DC
	ldr r2, _0810E6D4
	movs r0, 0x12
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	ldr r2, _0810E6D8
	movs r0, 0x12
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	b _0810E6F2
	.align 2, 0
_0810E6D4: .4byte 0x00000e9d
_0810E6D8: .4byte 0x00000ea5
_0810E6DC:
	ldr r2, _0810E720
	movs r0, 0x12
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	movs r2, 0xE6
	lsls r2, 4
	movs r0, 0x12
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
_0810E6F2:
	bl DrawWholeMapView
	ldrh r0, [r4, 0x10]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _0810E712
	ldrb r0, [r4, 0xA]
	bl DestroyTask
_0810E712:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810E720: .4byte 0x00000e58
	thumb_func_end sub_810E6A4

	thumb_func_start sub_810E724
sub_810E724: @ 810E724
	push {lr}
	ldr r2, _0810E744
	movs r0, 0x12
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	ldr r2, _0810E748
	movs r0, 0x12
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	pop {r0}
	bx r0
	.align 2, 0
_0810E744: .4byte 0x00000e9d
_0810E748: .4byte 0x00000ea5
	thumb_func_end sub_810E724

	thumb_func_start sub_810E74C
sub_810E74C: @ 810E74C
	push {lr}
	ldr r0, _0810E768
	ldrb r0, [r0, 0x15]
	subs r0, 0x11
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x5
	bhi _0810E79C
	lsls r0, 2
	ldr r1, _0810E76C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810E768: .4byte gSaveBlock1
_0810E76C: .4byte _0810E770
	.align 2, 0
_0810E770:
	.4byte _0810E79C
	.4byte _0810E788
	.4byte _0810E78C
	.4byte _0810E790
	.4byte _0810E794
	.4byte _0810E798
_0810E788:
	movs r1, 0x1
	b _0810E79E
_0810E78C:
	movs r1, 0x2
	b _0810E79E
_0810E790:
	movs r1, 0x3
	b _0810E79E
_0810E794:
	movs r1, 0x4
	b _0810E79E
_0810E798:
	movs r1, 0xF
	b _0810E79E
_0810E79C:
	movs r1, 0
_0810E79E:
	ldr r0, _0810E7A8
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_0810E7A8: .4byte 0x00004043
	thumb_func_end sub_810E74C

	thumb_func_start sub_810E7AC
sub_810E7AC: @ 810E7AC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r12, r2
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	ldr r0, _0810E81C
	ldrh r1, [r0]
	adds r2, r0, 0
	ldr r3, _0810E820
	cmp r1, 0
	bne _0810E7E8
	movs r1, 0
	adds r5, r3, 0
	movs r4, 0x10
_0810E7D8:
	lsls r0, r1, 2
	adds r0, r5
	strb r4, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x13
	bls _0810E7D8
_0810E7E8:
	ldrh r0, [r2]
	lsls r0, 2
	adds r0, r3
	strb r6, [r0]
	ldrh r0, [r2]
	lsls r0, 2
	adds r0, r3
	strb r7, [r0, 0x1]
	ldrh r0, [r2]
	lsls r0, 2
	adds r0, r3
	mov r1, r12
	strb r1, [r0, 0x2]
	ldrh r0, [r2]
	lsls r0, 2
	adds r0, r3
	mov r1, r8
	strb r1, [r0, 0x3]
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810E81C: .4byte gUnknown_0202E8CC
_0810E820: .4byte gUnknown_03000760
	thumb_func_end sub_810E7AC

	thumb_func_start sub_810E824
sub_810E824: @ 810E824
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _0810E868
	strb r4, [r5]
	ldr r0, _0810E86C
	strb r4, [r0]
	movs r0, 0x10
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_810E7AC
	ldr r2, _0810E870
	ldrb r0, [r2]
	cmp r0, 0x10
	beq _0810E85C
	adds r1, r5, 0
_0810E846:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x10
	bne _0810E846
_0810E85C:
	bl sub_810E874
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810E868: .4byte gUnknown_0203925A
_0810E86C: .4byte gUnknown_0203925B
_0810E870: .4byte gUnknown_03000760
	thumb_func_end sub_810E824

	thumb_func_start sub_810E874
sub_810E874: @ 810E874
	push {r4-r6,lr}
	sub sp, 0x8
	bl ScriptContext2_Enable
	ldr r4, _0810E8B8
	ldrb r0, [r4]
	cmp r0, 0x5
	bls _0810E8C0
	movs r0, 0
	movs r1, 0
	movs r2, 0x8
	movs r3, 0xB
	bl MenuDrawTextWindow
	movs r4, 0
	str r4, [sp]
	movs r0, 0x7
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x5
	bl InitMenu
	ldr r0, _0810E8BC
	strb r4, [r0]
	bl sub_80F944C
	bl InitMenuInUpperLeftCornerPlaySoundWhenAPressed
	bl sub_810ECD4
	b _0810E8E8
	.align 2, 0
_0810E8B8: .4byte gUnknown_0203925A
_0810E8BC: .4byte gUnknown_0203925C
_0810E8C0:
	ldrb r3, [r4]
	lsls r3, 1
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0x8
	bl MenuDrawTextWindow
	ldrb r3, [r4]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x7
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	bl InitMenu
_0810E8E8:
	movs r4, 0
	ldr r1, _0810E938
	ldrb r0, [r1]
	cmp r0, 0x10
	beq _0810E924
	ldr r6, _0810E93C
	adds r5, r1, 0
_0810E8F6:
	lsls r0, r4, 2
	adds r0, r5
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	lsls r2, r4, 1
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x1
	bl MenuPrint
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bhi _0810E924
	lsls r0, r4, 2
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0x10
	bne _0810E8F6
_0810E924:
	bl sub_810E944
	ldr r0, _0810E940
	movs r1, 0x8
	bl CreateTask
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810E938: .4byte gUnknown_03000760
_0810E93C: .4byte gUnknown_083F8380
_0810E940: .4byte sub_810E984
	thumb_func_end sub_810E874

	thumb_func_start sub_810E944
sub_810E944: @ 810E944
	push {lr}
	movs r0, 0x14
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x5
	bl MenuDrawTextWindow
	ldr r0, _0810E978
	movs r1, 0x15
	movs r2, 0x1
	movs r3, 0x40
	bl sub_8072BD8
	ldr r1, _0810E97C
	ldr r0, _0810E980
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x15
	movs r2, 0x3
	movs r3, 0x40
	bl sub_8072BD8
	pop {r0}
	bx r0
	.align 2, 0
_0810E978: .4byte gOtherText_NowOn
_0810E97C: .4byte gUnknown_083F8380
_0810E980: .4byte gUnknown_0202E8CE
	thumb_func_end sub_810E944

	thumb_func_start sub_810E984
sub_810E984: @ 810E984
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0810EA44
	ldrh r0, [r0, 0x2E]
	cmp r0, 0x40
	bne _0810E9B8
	ldr r1, _0810EA48
	ldrb r0, [r1]
	cmp r0, 0
	beq _0810E9B8
	subs r0, 0x1
	strb r0, [r1]
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursorNoWrap
	adds r0, r4, 0
	movs r1, 0x40
	bl sub_810EAC8
_0810E9B8:
	ldr r0, _0810EA44
	ldrh r0, [r0, 0x2E]
	cmp r0, 0x80
	bne _0810E9E8
	ldr r2, _0810EA48
	ldrb r1, [r2]
	ldr r0, _0810EA4C
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	beq _0810E9E8
	adds r0, r1, 0x1
	strb r0, [r2]
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1
	bl MoveMenuCursorNoWrap
	adds r0, r4, 0
	movs r1, 0x80
	bl sub_810EAC8
_0810E9E8:
	ldr r0, _0810EA44
	ldrh r2, [r0, 0x2E]
	movs r5, 0x1
	adds r1, r5, 0
	ands r1, r2
	cmp r1, 0
	beq _0810EA94
	ldr r1, _0810EA50
	ldr r4, _0810EA48
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	movs r1, 0x1
	ldrsb r1, [r0, r1]
	movs r2, 0x2
	ldrsb r2, [r0, r2]
	movs r3, 0x1
	negs r3, r3
	movs r0, 0x2
	str r0, [sp]
	str r5, [sp, 0x4]
	movs r0, 0
	bl saved_warp2_set_2
	ldr r1, _0810EA54
	ldrh r0, [r1]
	ldrb r2, [r4]
	cmp r0, r2
	bne _0810EA5C
	ldr r1, _0810EA58
	movs r0, 0
	strh r0, [r1]
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	adds r0, r6, 0
	bl sub_810EC9C
	b _0810EABC
	.align 2, 0
_0810EA44: .4byte gMain
_0810EA48: .4byte gUnknown_0203925B
_0810EA4C: .4byte gUnknown_0203925A
_0810EA50: .4byte gUnknown_03000760
_0810EA54: .4byte gUnknown_0202E8CE
_0810EA58: .4byte gScriptResult
_0810EA5C:
	ldr r0, _0810EA88
	strh r5, [r0]
	ldrb r0, [r4]
	strh r0, [r1]
	bl sub_810EBEC
	ldr r0, _0810EA8C
	ldrb r0, [r0]
	ldr r2, _0810EA90
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	movs r3, 0x1
	bl FieldObjectTurnByLocalIdAndMap
	bl sub_810EEDC
	bl MenuZeroFillScreen
	adds r0, r6, 0
	bl DestroyTask
	b _0810EABC
	.align 2, 0
_0810EA88: .4byte gScriptResult
_0810EA8C: .4byte gUnknown_0202E8DE
_0810EA90: .4byte gSaveBlock1
_0810EA94:
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _0810EABC
	ldr r0, _0810EAC4
	strh r1, [r0]
	movs r0, 0x5
	bl PlaySE
	bl sub_810EEDC
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	adds r0, r6, 0
	bl sub_810EC9C
_0810EABC:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810EAC4: .4byte gScriptResult
	thumb_func_end sub_810E984

	thumb_func_start sub_810EAC8
sub_810EAC8: @ 810EAC8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r2, r0, 24
	adds r5, r2, 0
	lsls r1, 24
	lsrs r1, 24
	adds r3, r1, 0
	movs r7, 0
	movs r4, 0
	ldr r0, _0810EAEC
	ldrb r0, [r0]
	cmp r0, 0x4
	bhi _0810EAF0
	movs r0, 0
	b _0810EB78
	.align 2, 0
_0810EAEC: .4byte gUnknown_0203925A
_0810EAF0:
	cmp r1, 0x40
	bne _0810EB04
	cmp r2, 0
	bne _0810EB18
	ldr r0, _0810EB00
	ldrb r4, [r0]
	movs r7, 0x1
	b _0810EB1C
	.align 2, 0
_0810EB00: .4byte gUnknown_0203925B
_0810EB04:
	cmp r3, 0x80
	bne _0810EB18
	cmp r5, 0x4
	bne _0810EB18
	ldr r0, _0810EB84
	ldrb r0, [r0]
	subs r0, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	movs r7, 0x1
_0810EB18:
	cmp r7, 0
	beq _0810EB76
_0810EB1C:
	adds r0, r4, 0
	movs r1, 0x5
	bl sub_810EB90
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0x7
	movs r3, 0xA
	bl MenuFillWindowRectWithBlankTile
	movs r5, 0
	ldr r2, _0810EB88
	lsls r1, r4, 2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x10
	beq _0810EB76
	ldr r0, _0810EB8C
	mov r8, r0
	adds r6, r2, 0
_0810EB44:
	adds r0, r1, r6
	ldrb r0, [r0]
	lsls r0, 2
	add r0, r8
	ldr r0, [r0]
	lsls r2, r5, 1
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x1
	bl MenuPrint
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bhi _0810EB76
	lsls r1, r4, 2
	adds r0, r1, r6
	ldrb r0, [r0]
	cmp r0, 0x10
	bne _0810EB44
_0810EB76:
	adds r0, r7, 0
_0810EB78:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810EB84: .4byte gUnknown_0203925B
_0810EB88: .4byte gUnknown_03000760
_0810EB8C: .4byte gUnknown_083F8380
	thumb_func_end sub_810EAC8

	thumb_func_start sub_810EB90
sub_810EB90: @ 810EB90
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	cmp r4, 0
	bne _0810EBB4
	ldr r0, _0810EBB0
	ldrb r1, [r0]
	movs r2, 0x2
	eors r1, r2
	strb r1, [r0]
	movs r0, 0
	bl SetBgTilemapBuffer
	b _0810EBB8
	.align 2, 0
_0810EBB0: .4byte gUnknown_0203925C
_0810EBB4:
	bl sub_810ECB0
_0810EBB8:
	adds r1, r4, r5
	ldr r0, _0810EBC8
	ldrb r0, [r0]
	cmp r1, r0
	bge _0810EBCC
	bl sub_810ECD4
	b _0810EBE0
	.align 2, 0
_0810EBC8: .4byte gUnknown_0203925A
_0810EBCC:
	cmp r1, r0
	bne _0810EBE0
	ldr r0, _0810EBE8
	ldrb r1, [r0]
	movs r2, 0x1
	eors r1, r2
	strb r1, [r0]
	movs r0, 0x1
	bl SetBgTilemapBuffer
_0810EBE0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810EBE8: .4byte gUnknown_0203925C
	thumb_func_end sub_810EB90

	thumb_func_start sub_810EBEC
sub_810EBEC: @ 810EBEC
	push {lr}
	ldr r0, _0810EC2C
	movs r1, 0x9
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810EC30
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	movs r2, 0x1
	strh r2, [r1, 0x8]
	strh r0, [r1, 0xA]
	strh r0, [r1, 0xC]
	strh r0, [r1, 0xE]
	strh r2, [r1, 0x10]
	movs r0, 0x3
	strh r0, [r1, 0x12]
	movs r0, 0
	bl SetCameraPanningCallback
	bl sub_810ECFC
	movs r0, 0x59
	bl PlaySE
	pop {r0}
	bx r0
	.align 2, 0
_0810EC2C: .4byte sub_810EC34
_0810EC30: .4byte gTasks
	thumb_func_end sub_810EBEC

	thumb_func_start sub_810EC34
sub_810EC34: @ 810EC34
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0810EC98
	adds r4, r0, r1
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	bl __modsi3
	cmp r0, 0
	bne _0810EC92
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0810EC92
	ldrh r0, [r4, 0x10]
	negs r0, r0
	strh r0, [r4, 0x10]
	movs r2, 0x10
	ldrsh r1, [r4, r2]
	movs r0, 0
	bl SetCameraPanning
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x17
	bne _0810EC92
	movs r0, 0x49
	bl PlaySE
	adds r0, r5, 0
	bl sub_810EC9C
	bl InstallCameraPanAheadCallback
_0810EC92:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810EC98: .4byte gTasks
	thumb_func_end sub_810EC34

	thumb_func_start sub_810EC9C
sub_810EC9C: @ 810EC9C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_810EC9C

	thumb_func_start sub_810ECB0
sub_810ECB0: @ 810ECB0
	push {lr}
	ldr r2, _0810ECD0
	ldrb r1, [r2]
	lsrs r0, r1, 1
	cmp r0, 0x1
	beq _0810ECCC
	movs r0, 0x2
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0
	movs r1, 0x24
	movs r2, 0x8
	bl sub_80F953C
_0810ECCC:
	pop {r0}
	bx r0
	.align 2, 0
_0810ECD0: .4byte gUnknown_0203925C
	thumb_func_end sub_810ECB0

	thumb_func_start sub_810ECD4
sub_810ECD4: @ 810ECD4
	push {lr}
	ldr r2, _0810ECF8
	ldrb r1, [r2]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0810ECF2
	movs r0, 0x1
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
	movs r1, 0x24
	movs r2, 0x48
	bl sub_80F953C
_0810ECF2:
	pop {r0}
	bx r0
	.align 2, 0
_0810ECF8: .4byte gUnknown_0203925C
	thumb_func_end sub_810ECD4

	thumb_func_start sub_810ECFC
sub_810ECFC: @ 810ECFC
	push {r4,lr}
	ldr r4, _0810ED38
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810ED30
	adds r0, r4, 0
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810ED3C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	strh r2, [r1, 0x8]
	strh r0, [r1, 0xA]
	strh r2, [r1, 0xC]
	strh r2, [r1, 0xE]
	strh r2, [r1, 0x10]
_0810ED30:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810ED38: .4byte sub_810ED40
_0810ED3C: .4byte gTasks
	thumb_func_end sub_810ECFC

	thumb_func_start sub_810ED40
sub_810ED40: @ 810ED40
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _0810ED5C
	adds r0, r1
	bl sub_810ED60
	pop {r0}
	bx r0
	.align 2, 0
_0810ED5C: .4byte gTasks
	thumb_func_end sub_810ED40

	thumb_func_start sub_810ED60
sub_810ED60: @ 810ED60
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0x8
	beq _0810ED6E
	b _0810EEB2
_0810ED6E:
	movs r0, 0
	strh r0, [r5, 0xE]
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _0810EE14
	ldr r2, _0810EDFC
	movs r0, 0x7
	movs r1, 0x7
	bl MapGridSetMetatileIdAt
	ldr r4, _0810EE00
	movs r0, 0x8
	movs r1, 0x7
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	movs r0, 0x9
	movs r1, 0x7
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	ldr r2, _0810EE04
	movs r0, 0xA
	movs r1, 0x7
	bl MapGridSetMetatileIdAt
	movs r2, 0xE7
	lsls r2, 4
	movs r0, 0x7
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	adds r4, 0x8
	movs r0, 0x8
	movs r1, 0x8
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	movs r0, 0x9
	movs r1, 0x8
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	ldr r2, _0810EE08
	movs r0, 0xA
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	ldr r2, _0810EE0C
	movs r0, 0x7
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	adds r4, 0x8
	movs r0, 0x8
	movs r1, 0x9
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	movs r0, 0x9
	movs r1, 0x9
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	ldr r2, _0810EE10
	movs r0, 0xA
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	b _0810EE92
	.align 2, 0
_0810EDFC: .4byte 0x00000e68
_0810EE00: .4byte 0x00000e69
_0810EE04: .4byte 0x00000e6a
_0810EE08: .4byte 0x00000e72
_0810EE0C: .4byte 0x00000e78
_0810EE10: .4byte 0x00000e7a
_0810EE14:
	ldr r2, _0810EEC0
	movs r0, 0x7
	movs r1, 0x7
	bl MapGridSetMetatileIdAt
	ldr r4, _0810EEC4
	movs r0, 0x8
	movs r1, 0x7
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	movs r0, 0x9
	movs r1, 0x7
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	ldr r2, _0810EEC8
	movs r0, 0xA
	movs r1, 0x7
	bl MapGridSetMetatileIdAt
	ldr r2, _0810EECC
	movs r0, 0x7
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	adds r4, 0x8
	movs r0, 0x8
	movs r1, 0x8
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	movs r0, 0x9
	movs r1, 0x8
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	ldr r2, _0810EED0
	movs r0, 0xA
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	ldr r2, _0810EED4
	movs r0, 0x7
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	adds r4, 0x8
	movs r0, 0x8
	movs r1, 0x9
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	movs r0, 0x9
	movs r1, 0x9
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	ldr r2, _0810EED8
	movs r0, 0xA
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
_0810EE92:
	bl DrawWholeMapView
	ldrh r0, [r5, 0x10]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r5, 0x10]
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	bne _0810EEB2
	ldrb r0, [r5, 0xA]
	bl DestroyTask
_0810EEB2:
	ldrh r0, [r5, 0xE]
	adds r0, 0x1
	strh r0, [r5, 0xE]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810EEC0: .4byte 0x00000e6b
_0810EEC4: .4byte 0x00000e6c
_0810EEC8: .4byte 0x00000e6d
_0810EECC: .4byte 0x00000e73
_0810EED0: .4byte 0x00000e75
_0810EED4: .4byte 0x00000e7b
_0810EED8: .4byte 0x00000e7d
	thumb_func_end sub_810ED60

	thumb_func_start sub_810EEDC
sub_810EEDC: @ 810EEDC
	push {r4,lr}
	ldr r4, _0810EF08
	ldrb r1, [r4]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810EEF0
	movs r0, 0x1
	bl SetBgTilemapBuffer
_0810EEF0:
	ldrb r0, [r4]
	lsrs r0, 1
	cmp r0, 0x1
	bne _0810EEFE
	movs r0, 0
	bl SetBgTilemapBuffer
_0810EEFE:
	bl BuyMenuFreeMemory
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810EF08: .4byte gUnknown_0203925C
	thumb_func_end sub_810EEDC

	thumb_func_start sub_810EF0C
sub_810EF0C: @ 810EF0C
	push {lr}
	ldr r1, _0810EF1C
	ldr r0, _0810EF20
	strh r0, [r1]
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_0810EF1C: .4byte gUnknown_0202E8CC
_0810EF20: .4byte 0x00000259
	thumb_func_end sub_810EF0C

	thumb_func_start sub_810EF24
sub_810EF24: @ 810EF24
	push {lr}
	ldr r1, _0810EF34
	ldr r0, _0810EF38
	strh r0, [r1]
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_0810EF34: .4byte gUnknown_0202E8CC
_0810EF38: .4byte 0x00000259
	thumb_func_end sub_810EF24

	thumb_func_start sub_810EF3C
sub_810EF3C: @ 810EF3C
	push {lr}
	bl sub_810F87C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810EF5C
	adds r0, r1
	movs r1, 0x16
	bl GetMonData
	cmp r0, 0xC7
	bls _0810EF60
	movs r0, 0x1
	b _0810EF62
	.align 2, 0
_0810EF5C: .4byte gPlayerParty
_0810EF60:
	movs r0, 0
_0810EF62:
	pop {r1}
	bx r1
	thumb_func_end sub_810EF3C

	thumb_func_start sub_810EF68
sub_810EF68: @ 810EF68
	push {lr}
	bl sub_810F87C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810EF88
	adds r0, r1
	movs r1, 0x17
	bl GetMonData
	cmp r0, 0xC7
	bls _0810EF8C
	movs r0, 0x1
	b _0810EF8E
	.align 2, 0
_0810EF88: .4byte gPlayerParty
_0810EF8C:
	movs r0, 0
_0810EF8E:
	pop {r1}
	bx r1
	thumb_func_end sub_810EF68

	thumb_func_start sub_810EF94
sub_810EF94: @ 810EF94
	push {lr}
	bl sub_810F87C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810EFB4
	adds r0, r1
	movs r1, 0x18
	bl GetMonData
	cmp r0, 0xC7
	bls _0810EFB8
	movs r0, 0x1
	b _0810EFBA
	.align 2, 0
_0810EFB4: .4byte gPlayerParty
_0810EFB8:
	movs r0, 0
_0810EFBA:
	pop {r1}
	bx r1
	thumb_func_end sub_810EF94

	thumb_func_start sub_810EFC0
sub_810EFC0: @ 810EFC0
	push {lr}
	bl sub_810F87C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810EFE0
	adds r0, r1
	movs r1, 0x21
	bl GetMonData
	cmp r0, 0xC7
	bls _0810EFE4
	movs r0, 0x1
	b _0810EFE6
	.align 2, 0
_0810EFE0: .4byte gPlayerParty
_0810EFE4:
	movs r0, 0
_0810EFE6:
	pop {r1}
	bx r1
	thumb_func_end sub_810EFC0

	thumb_func_start sub_810EFEC
sub_810EFEC: @ 810EFEC
	push {lr}
	bl sub_810F87C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810F00C
	adds r0, r1
	movs r1, 0x2F
	bl GetMonData
	cmp r0, 0xC7
	bls _0810F010
	movs r0, 0x1
	b _0810F012
	.align 2, 0
_0810F00C: .4byte gPlayerParty
_0810F010:
	movs r0, 0
_0810F012:
	pop {r1}
	bx r1
	thumb_func_end sub_810EFEC

	thumb_func_start sub_810F018
sub_810F018: @ 810F018
	push {r4-r6,lr}
	movs r5, 0
	ldr r6, _0810F068
_0810F01E:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0810F06C
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x5
	bl GetMonData
	cmp r0, 0
	beq _0810F074
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0810F074
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r0, [r1, 0x6]
	cmp r0, 0xC
	beq _0810F060
	ldrb r0, [r1, 0x7]
	cmp r0, 0xC
	bne _0810F074
_0810F060:
	ldr r1, _0810F070
	movs r0, 0x1
	b _0810F082
	.align 2, 0
_0810F068: .4byte gBaseStats
_0810F06C: .4byte gPlayerParty
_0810F070: .4byte gScriptResult
_0810F074:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _0810F01E
	ldr r1, _0810F08C
	movs r0, 0
_0810F082:
	strh r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810F08C: .4byte gScriptResult
	thumb_func_end sub_810F018

	thumb_func_start sub_810F090
sub_810F090: @ 810F090
	push {r4,r5,lr}
	sub sp, 0x8
	bl ScriptContext2_Enable
	movs r0, 0
	movs r1, 0
	movs r2, 0xA
	movs r3, 0xB
	bl MenuDrawTextWindow
	movs r4, 0
	str r4, [sp]
	movs r0, 0x9
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x5
	bl InitMenu
	ldr r0, _0810F104
	strb r4, [r0]
	bl sub_80F944C
	bl InitMenuInUpperLeftCornerPlaySoundWhenAPressed
	bl sub_810F2B4
	ldr r5, _0810F108
_0810F0CA:
	lsls r0, r4, 2
	adds r0, r5
	ldr r0, [r0]
	lsls r2, r4, 1
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x1
	bl MenuPrint
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _0810F0CA
	ldr r1, _0810F10C
	movs r0, 0
	strb r0, [r1]
	ldr r1, _0810F110
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, _0810F114
	movs r1, 0x8
	bl CreateTask
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810F104: .4byte gUnknown_0203925C
_0810F108: .4byte gUnknown_083F83C0
_0810F10C: .4byte gUnknown_0203925B
_0810F110: .4byte gUnknown_0203925A
_0810F114: .4byte sub_810F118
	thumb_func_end sub_810F090

	thumb_func_start sub_810F118
sub_810F118: @ 810F118
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0810F1E4
	ldrh r0, [r0, 0x2E]
	cmp r0, 0x40
	bne _0810F14A
	ldr r1, _0810F1E8
	ldrb r0, [r1]
	cmp r0, 0
	beq _0810F14A
	subs r0, 0x1
	strb r0, [r1]
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursorNoWrap
	adds r0, r4, 0
	movs r1, 0x40
	bl sub_810F1F4
_0810F14A:
	ldr r0, _0810F1E4
	ldrh r0, [r0, 0x2E]
	cmp r0, 0x80
	bne _0810F17A
	ldr r2, _0810F1E8
	ldrb r1, [r2]
	ldr r0, _0810F1EC
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	beq _0810F17A
	adds r0, r1, 0x1
	strb r0, [r2]
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1
	bl MoveMenuCursorNoWrap
	adds r0, r4, 0
	movs r1, 0x80
	bl sub_810F1F4
_0810F17A:
	ldr r4, _0810F1E4
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810F1AE
	bl sub_8072DEC
	ldr r0, _0810F1F0
	ldr r1, _0810F1E8
	ldrb r1, [r1]
	strh r1, [r0]
	movs r0, 0x5
	bl PlaySE
	bl sub_810EEDC
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	adds r0, r5, 0
	bl sub_810EC9C
_0810F1AE:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810F1DE
	bl sub_8072DEC
	ldr r1, _0810F1F0
	movs r0, 0x7F
	strh r0, [r1]
	movs r0, 0x5
	bl PlaySE
	bl sub_810EEDC
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	adds r0, r5, 0
	bl sub_810EC9C
_0810F1DE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810F1E4: .4byte gMain
_0810F1E8: .4byte gUnknown_0203925B
_0810F1EC: .4byte gUnknown_0203925A
_0810F1F0: .4byte gScriptResult
	thumb_func_end sub_810F118

	thumb_func_start sub_810F1F4
sub_810F1F4: @ 810F1F4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	adds r5, r2, 0
	lsls r1, 24
	lsrs r1, 24
	adds r3, r1, 0
	movs r6, 0
	movs r4, 0
	ldr r0, _0810F214
	ldrb r0, [r0]
	cmp r0, 0x4
	bhi _0810F218
	movs r0, 0
	b _0810F282
	.align 2, 0
_0810F214: .4byte gUnknown_0203925A
_0810F218:
	cmp r1, 0x40
	bne _0810F22C
	cmp r2, 0
	bne _0810F240
	ldr r0, _0810F228
	ldrb r4, [r0]
	movs r6, 0x1
	b _0810F244
	.align 2, 0
_0810F228: .4byte gUnknown_0203925B
_0810F22C:
	cmp r3, 0x80
	bne _0810F240
	cmp r5, 0x4
	bne _0810F240
	ldr r0, _0810F288
	ldrb r0, [r0]
	subs r0, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	movs r6, 0x1
_0810F240:
	cmp r6, 0
	beq _0810F280
_0810F244:
	adds r0, r4, 0
	movs r1, 0x5
	bl sub_810F2DC
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0x9
	movs r3, 0xA
	bl MenuFillWindowRectWithBlankTile
	movs r5, 0
	ldr r7, _0810F28C
_0810F25C:
	lsls r0, r4, 2
	adds r0, r7
	ldr r0, [r0]
	lsls r2, r5, 1
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x1
	bl MenuPrint
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bls _0810F25C
_0810F280:
	adds r0, r6, 0
_0810F282:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810F288: .4byte gUnknown_0203925B
_0810F28C: .4byte gUnknown_083F83C0
	thumb_func_end sub_810F1F4

	thumb_func_start sub_810F290
sub_810F290: @ 810F290
	push {lr}
	ldr r2, _0810F2B0
	ldrb r1, [r2]
	lsrs r0, r1, 1
	cmp r0, 0x1
	beq _0810F2AC
	movs r0, 0x2
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0
	movs r1, 0x2C
	movs r2, 0x8
	bl sub_80F953C
_0810F2AC:
	pop {r0}
	bx r0
	.align 2, 0
_0810F2B0: .4byte gUnknown_0203925C
	thumb_func_end sub_810F290

	thumb_func_start sub_810F2B4
sub_810F2B4: @ 810F2B4
	push {lr}
	ldr r2, _0810F2D8
	ldrb r1, [r2]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0810F2D2
	movs r0, 0x1
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
	movs r1, 0x2C
	movs r2, 0x58
	bl sub_80F953C
_0810F2D2:
	pop {r0}
	bx r0
	.align 2, 0
_0810F2D8: .4byte gUnknown_0203925C
	thumb_func_end sub_810F2B4

	thumb_func_start sub_810F2DC
sub_810F2DC: @ 810F2DC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	cmp r4, 0
	bne _0810F300
	ldr r0, _0810F2FC
	ldrb r1, [r0]
	movs r2, 0x2
	eors r1, r2
	strb r1, [r0]
	movs r0, 0
	bl SetBgTilemapBuffer
	b _0810F304
	.align 2, 0
_0810F2FC: .4byte gUnknown_0203925C
_0810F300:
	bl sub_810F290
_0810F304:
	adds r1, r4, r5
	ldr r0, _0810F314
	ldrb r0, [r0]
	cmp r1, r0
	bge _0810F318
	bl sub_810F2B4
	b _0810F32C
	.align 2, 0
_0810F314: .4byte gUnknown_0203925A
_0810F318:
	cmp r1, r0
	bne _0810F32C
	ldr r0, _0810F334
	ldrb r1, [r0]
	movs r2, 0x1
	eors r1, r2
	strb r1, [r0]
	movs r0, 0x1
	bl SetBgTilemapBuffer
_0810F32C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810F334: .4byte gUnknown_0203925C
	thumb_func_end sub_810F2DC

	thumb_func_start SpawnScriptFieldObject
SpawnScriptFieldObject: @ 810F338
	push {lr}
	sub sp, 0x8
	ldr r0, _0810F380
	ldrh r3, [r0]
	adds r3, 0x7
	lsls r3, 16
	asrs r3, 16
	ldrh r0, [r0, 0x2]
	adds r0, 0x7
	lsls r0, 16
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x3
	str r0, [sp, 0x4]
	movs r0, 0x7
	movs r1, 0x8
	movs r2, 0x7F
	bl SpawnSpecialFieldObjectParametrized
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810F384
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x1]
	movs r2, 0x20
	orrs r0, r2
	strb r0, [r1, 0x1]
	ldrb r0, [r1, 0x4]
	bl CameraObjectSetFollowedObjectId
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_0810F380: .4byte gSaveBlock1
_0810F384: .4byte gMapObjects
	thumb_func_end SpawnScriptFieldObject

	thumb_func_start sub_810F388
sub_810F388: @ 810F388
	push {lr}
	bl GetPlayerAvatarObjectId
	lsls r0, 24
	lsrs r0, 24
	bl CameraObjectSetFollowedObjectId
	ldr r0, _0810F3A8
	ldrb r1, [r0, 0x5]
	ldrb r2, [r0, 0x4]
	movs r0, 0x7F
	bl RemoveFieldObjectByLocalIdAndMap
	pop {r0}
	bx r0
	.align 2, 0
_0810F3A8: .4byte gSaveBlock1
	thumb_func_end sub_810F388

	thumb_func_start sub_810F3AC
sub_810F3AC: @ 810F3AC
	push {lr}
	bl sub_810F87C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810F3D4
	adds r0, r1
	bl GetNature
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0810F3D8
	bl sub_810CB68
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0810F3D4: .4byte gPlayerParty
_0810F3D8: .4byte gStringVar1
	thumb_func_end sub_810F3AC

	thumb_func_start sub_810F3DC
sub_810F3DC: @ 810F3DC
	push {r4,lr}
	ldr r4, _0810F3FC
	ldr r0, _0810F400
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	movs r2, 0
	bl sub_80FBFB4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810F3FC: .4byte gStringVar1
_0810F400: .4byte 0x00004026
	thumb_func_end sub_810F3DC

	thumb_func_start sub_810F404
sub_810F404: @ 810F404
	push {lr}
	movs r0, 0x20
	bl sub_8053108
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_810F404

	thumb_func_start sub_810F414
sub_810F414: @ 810F414
	push {lr}
	ldr r0, _0810F420
	bl sub_8135FF4
	pop {r0}
	bx r0
	.align 2, 0
_0810F420: .4byte gStringVar1
	thumb_func_end sub_810F414

	thumb_func_start sub_810F424
sub_810F424: @ 810F424
	push {r4,r5,lr}
	ldr r2, _0810F458
	ldr r1, _0810F45C
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r1, 25
	ldr r0, _0810F460
	adds r2, r0
	lsrs r1, 25
	ldrh r2, [r2]
	adds r1, r2
	ldr r2, _0810F464
	ldr r0, _0810F468
	ldrh r0, [r0]
	adds r0, r2
	ldrb r0, [r0]
	adds r5, r1, r0
	movs r0, 0x2
	bl GetPriceReduction
	lsls r0, 24
	cmp r0, 0
	bne _0810F470
	ldr r4, _0810F46C
	b _0810F472
	.align 2, 0
_0810F458: .4byte gSaveBlock1
_0810F45C: .4byte 0x00002dd4
_0810F460: .4byte 0x00002dd6
_0810F464: .4byte gUnknown_083F83E0
_0810F468: .4byte gUnknown_0202E8CC
_0810F46C: .4byte gUnknown_083F83EC
_0810F470:
	ldr r4, _0810F484
_0810F472:
	adds r0, r5, 0
	movs r1, 0xC
	bl __umodsi3
	adds r0, r4
	ldrb r0, [r0]
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0810F484: .4byte gUnknown_083F83F8
	thumb_func_end sub_810F424

	thumb_func_start sub_810F488
sub_810F488: @ 810F488
	push {lr}
	ldr r1, _0810F4A0
	ldr r0, _0810F4A4
	strh r0, [r1]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0810F4A8
	movs r0, 0x1
	b _0810F4AA
	.align 2, 0
_0810F4A0: .4byte gUnknown_0202E8CC
_0810F4A4: .4byte 0x00000277
_0810F4A8:
	movs r0, 0
_0810F4AA:
	pop {r1}
	bx r1
	thumb_func_end sub_810F488

	thumb_func_start sub_810F4B0
sub_810F4B0: @ 810F4B0
	push {lr}
	ldr r1, _0810F4C8
	movs r0, 0x9E
	lsls r0, 2
	strh r0, [r1]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0810F4CC
	movs r0, 0x1
	b _0810F4CE
	.align 2, 0
_0810F4C8: .4byte gUnknown_0202E8CC
_0810F4CC:
	movs r0, 0
_0810F4CE:
	pop {r1}
	bx r1
	thumb_func_end sub_810F4B0

	thumb_func_start sub_810F4D4
sub_810F4D4: @ 810F4D4
	push {lr}
	ldr r1, _0810F4EC
	ldr r0, _0810F4F0
	strh r0, [r1]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0810F4F4
	movs r0, 0x1
	b _0810F4F6
	.align 2, 0
_0810F4EC: .4byte gUnknown_0202E8CC
_0810F4F0: .4byte 0x00000279
_0810F4F4:
	movs r0, 0
_0810F4F6:
	pop {r1}
	bx r1
	thumb_func_end sub_810F4D4

	thumb_func_start sub_810F4FC
sub_810F4FC: @ 810F4FC
	push {lr}
	ldr r1, _0810F514
	ldr r0, _0810F518
	strh r0, [r1]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0810F51C
	movs r0, 0x1
	b _0810F51E
	.align 2, 0
_0810F514: .4byte gUnknown_0202E8CC
_0810F518: .4byte 0x0000027a
_0810F51C:
	movs r0, 0
_0810F51E:
	pop {r1}
	bx r1
	thumb_func_end sub_810F4FC

	thumb_func_start sub_810F524
sub_810F524: @ 810F524
	push {lr}
	bl sub_810F87C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810F548
	adds r0, r1
	movs r1, 0x47
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0810F548: .4byte gPlayerParty
	thumb_func_end sub_810F524

	thumb_func_start sub_810F54C
sub_810F54C: @ 810F54C
	push {lr}
	sub sp, 0x4
	movs r0, 0x2A
	bl sav12_xor_increment
	ldr r0, _0810F580
	bl FlagSet
	movs r1, 0x1
	mov r0, sp
	strb r1, [r0]
	bl sub_810F87C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810F584
	adds r0, r1
	movs r1, 0x47
	mov r2, sp
	bl SetMonData
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0810F580: .4byte 0x0000083b
_0810F584: .4byte gPlayerParty
	thumb_func_end sub_810F54C

	thumb_func_start sub_810F588
sub_810F588: @ 810F588
	push {lr}
	bl sub_810F87C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810F5AC
	adds r0, r1
	bl sub_8040020
	lsls r0, 16
	ldr r1, _0810F5B0
	cmp r0, r1
	bhi _0810F5B4
	movs r0, 0
	b _0810F5B6
	.align 2, 0
_0810F5AC: .4byte gPlayerParty
_0810F5B0: .4byte 0x01fd0000
_0810F5B4:
	movs r0, 0x1
_0810F5B6:
	pop {r1}
	bx r1
	thumb_func_end sub_810F588

	thumb_func_start sub_810F5BC
sub_810F5BC: @ 810F5BC
	push {lr}
	movs r0, 0xC7
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _0810F610
	ldr r0, _0810F5E8
	ldrh r1, [r0, 0x4]
	movs r0, 0x83
	lsls r0, 3
	cmp r1, r0
	bne _0810F610
	subs r0, 0x75
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0810F5F0
	ldr r0, _0810F5EC
	movs r1, 0x4
	b _0810F602
	.align 2, 0
_0810F5E8: .4byte gSaveBlock1
_0810F5EC: .4byte 0x0000409a
_0810F5F0:
	movs r0, 0xE9
	lsls r0, 2
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0810F610
	ldr r0, _0810F60C
	movs r1, 0x5
_0810F602:
	bl VarSet
	movs r0, 0x1
	b _0810F612
	.align 2, 0
_0810F60C: .4byte 0x0000409a
_0810F610:
	movs r0, 0
_0810F612:
	pop {r1}
	bx r1
	thumb_func_end sub_810F5BC

	thumb_func_start sub_810F618
sub_810F618: @ 810F618
	push {lr}
	ldr r0, _0810F624
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_0810F624: .4byte 0x0000085f
	thumb_func_end sub_810F618

	thumb_func_start sub_810F628
sub_810F628: @ 810F628
	push {r4,r5,lr}
	sub sp, 0x14
	ldr r5, _0810F690
	movs r1, 0x90
	lsls r1, 1
	movs r4, 0
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r0, r5, 0
	movs r2, 0x7
	movs r3, 0x20
	bl CreateMon
	movs r1, 0x1
	add r0, sp, 0x10
	strh r1, [r0]
	adds r0, r5, 0
	movs r1, 0x2E
	add r2, sp, 0x10
	bl SetMonData
	add r1, sp, 0x10
	movs r0, 0x21
	strh r0, [r1]
	adds r0, r5, 0
	movs r1, 0xD
	add r2, sp, 0x10
	bl SetMonData
	add r0, sp, 0x10
	strh r4, [r0]
	adds r0, r5, 0
	movs r1, 0xE
	add r2, sp, 0x10
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0xF
	add r2, sp, 0x10
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0x10
	add r2, sp, 0x10
	bl SetMonData
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810F690: .4byte gPlayerParty
	thumb_func_end sub_810F628

	thumb_func_start sub_810F694
sub_810F694: @ 810F694
	push {r4-r6,lr}
	ldr r0, _0810F6D0
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl GetStarterPokemon
	lsls r0, 16
	lsrs r6, r0, 16
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	cmp r4, r5
	bcs _0810F6E2
_0810F6B6:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _0810F6D4
	adds r0, r1
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	cmp r0, r6
	bne _0810F6D8
	movs r0, 0x1
	b _0810F6E4
	.align 2, 0
_0810F6D0: .4byte 0x00004023
_0810F6D4: .4byte gPlayerParty
_0810F6D8:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _0810F6B6
_0810F6E2:
	movs r0, 0
_0810F6E4:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_810F694

	thumb_func_start sub_810F6EC
sub_810F6EC: @ 810F6EC
	push {r4-r6,lr}
	movs r5, 0
_0810F6F0:
	movs r4, 0
	lsls r1, r5, 2
	adds r1, r5
	lsls r0, r1, 4
	subs r0, r1
	lsls r6, r0, 5
_0810F6FC:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	ldr r1, _0810F718
	adds r0, r1
	adds r0, r6, r0
	movs r1, 0xB
	movs r2, 0
	bl GetBoxMonData
	cmp r0, 0
	bne _0810F71C
	movs r0, 0x1
	b _0810F732
	.align 2, 0
_0810F718: .4byte gUnknown_020300A4
_0810F71C:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1D
	bls _0810F6FC
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0xD
	bls _0810F6F0
	movs r0, 0
_0810F732:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_810F6EC

	thumb_func_start sub_810F738
sub_810F738: @ 810F738
	push {lr}
	ldr r0, _0810F74C
	movs r1, 0x3F
	bl sub_8040110
	lsls r0, 24
	cmp r0, 0
	beq _0810F750
	movs r0, 0x1
	b _0810F752
	.align 2, 0
_0810F74C: .4byte gPlayerParty
_0810F750:
	movs r0, 0
_0810F752:
	pop {r1}
	bx r1
	thumb_func_end sub_810F738

	thumb_func_start sub_810F758
sub_810F758: @ 810F758
	push {lr}
	ldr r0, _0810F798
	movs r1, 0x9
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810F79C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0810F7A0
	ldrh r2, [r0]
	movs r0, 0
	strh r2, [r1, 0x8]
	strh r0, [r1, 0xA]
	strh r0, [r1, 0xC]
	strh r0, [r1, 0xE]
	ldr r0, _0810F7A4
	ldrh r0, [r0]
	strh r0, [r1, 0x10]
	movs r0, 0x5
	strh r0, [r1, 0x12]
	movs r0, 0
	bl SetCameraPanningCallback
	movs r0, 0xD6
	bl PlaySE
	pop {r0}
	bx r0
	.align 2, 0
_0810F798: .4byte sub_810F7A8
_0810F79C: .4byte gTasks
_0810F7A0: .4byte gUnknown_0202E8CE
_0810F7A4: .4byte gUnknown_0202E8CC
	thumb_func_end sub_810F758

	thumb_func_start sub_810F7A8
sub_810F7A8: @ 810F7A8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0810F810
	adds r4, r0, r1
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	bl __modsi3
	cmp r0, 0
	bne _0810F808
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0810F808
	ldrh r0, [r4, 0x8]
	negs r0, r0
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0x10]
	negs r0, r0
	strh r0, [r4, 0x10]
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	movs r2, 0x10
	ldrsh r1, [r4, r2]
	bl SetCameraPanning
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	bne _0810F808
	adds r0, r5, 0
	bl sub_810F814
	bl InstallCameraPanAheadCallback
_0810F808:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810F810: .4byte gTasks
	thumb_func_end sub_810F7A8

	thumb_func_start sub_810F814
sub_810F814: @ 810F814
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_810F814

	thumb_func_start sub_810F828
sub_810F828: @ 810F828
	push {lr}
	movs r0, 0xAE
	lsls r0, 2
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_810F828

	thumb_func_start sub_810F83C
sub_810F83C: @ 810F83C
	push {lr}
	bl get_map_light_from_warp0
	lsls r0, 24
	lsrs r0, 24
	bl is_light_level_1_2_3_5_or_6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810F858
	movs r0, 0x14
	bl SetSav1Weather
_0810F858:
	pop {r0}
	bx r0
	thumb_func_end sub_810F83C

	thumb_func_start sub_810F85C
sub_810F85C: @ 810F85C
	push {lr}
	bl get_map_light_from_warp0
	lsls r0, 24
	lsrs r0, 24
	bl is_light_level_1_2_3_5_or_6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810F878
	movs r0, 0x15
	bl SetSav1Weather
_0810F878:
	pop {r0}
	bx r0
	thumb_func_end sub_810F85C

	thumb_func_start sub_810F87C
sub_810F87C: @ 810F87C
	push {r4-r6,lr}
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	cmp r5, r6
	bcs _0810F8CA
_0810F88C:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0810F8BC
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _0810F8C0
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _0810F8C0
	adds r0, r5, 0
	b _0810F8CC
	.align 2, 0
_0810F8BC: .4byte gPlayerParty
_0810F8C0:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r6
	bcc _0810F88C
_0810F8CA:
	movs r0, 0
_0810F8CC:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_810F87C

	thumb_func_start sub_810F8D4
sub_810F8D4: @ 810F8D4
	push {lr}
	ldr r0, _0810F8F4
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0810F8F8
	adds r0, r1
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_0810F8F4: .4byte gUnknown_0202E8CC
_0810F8F8: .4byte gPlayerParty
	thumb_func_end sub_810F8D4

	thumb_func_start sub_810F8FC
sub_810F8FC: @ 810F8FC
	push {lr}
	movs r0, 0x6
	bl sub_805ADDC
	pop {r0}
	bx r0
	thumb_func_end sub_810F8FC

	thumb_func_start sub_810F908
sub_810F908: @ 810F908
	push {r4,lr}
	ldr r0, _0810F928
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	adds r3, r0, 0
	ldr r2, _0810F92C
	movs r1, 0
	ldrsh r0, [r2, r1]
	subs r0, r3
	cmp r0, 0x6
	ble _0810F930
	movs r0, 0
	b _0810F948
	.align 2, 0
_0810F928: .4byte 0x000040c2
_0810F92C: .4byte gLocalTime
_0810F930:
	ldrh r1, [r2]
	movs r4, 0
	ldrsh r0, [r2, r4]
	cmp r0, 0
	blt _0810F946
	subs r1, r3
	movs r0, 0x7
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	b _0810F948
_0810F946:
	movs r0, 0x8
_0810F948:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810F908

	thumb_func_start sub_810F950
sub_810F950: @ 810F950
	push {r4,lr}
	ldr r0, _0810F964
	ldr r4, _0810F968
	ldrh r1, [r4]
	bl VarSet
	ldrh r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0810F964: .4byte 0x000040c2
_0810F968: .4byte gLocalTime
	thumb_func_end sub_810F950

	thumb_func_start sub_810F96C
sub_810F96C: @ 810F96C
	push {r4,lr}
	ldr r0, _0810F994
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0810F998
	adds r0, r1
	ldr r4, _0810F99C
	movs r1, 0x7
	adds r2, r4, 0
	bl GetMonData
	ldr r0, _0810F9A0
	adds r1, r4, 0
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	beq _0810F9A4
	movs r0, 0x1
	b _0810F9A6
	.align 2, 0
_0810F994: .4byte gUnknown_0202E8CC
_0810F998: .4byte gPlayerParty
_0810F99C: .4byte gStringVar1
_0810F9A0: .4byte gSaveBlock2
_0810F9A4:
	movs r0, 0
_0810F9A6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810F96C

	thumb_func_start sub_810F9AC
sub_810F9AC: @ 810F9AC
	push {r4,r5,lr}
	ldr r2, _0810F9C0
	ldrh r1, [r2]
	ldr r0, _0810F9C4
	cmp r1, r0
	bls _0810F9C8
	movs r0, 0
	bl sub_80BF088
	b _0810FA4A
	.align 2, 0
_0810F9C0: .4byte gScriptResult
_0810F9C4: .4byte 0x0000270f
_0810F9C8:
	ldr r0, _0810F9D8
	cmp r1, r0
	bls _0810F9E0
	ldr r4, _0810F9DC
	movs r0, 0xA1
	strb r0, [r4]
	adds r4, 0x1
	b _0810FA04
	.align 2, 0
_0810F9D8: .4byte 0x000003e7
_0810F9DC: .4byte gStringVar1
_0810F9E0:
	cmp r1, 0x63
	bls _0810F9F4
	ldr r4, _0810F9F0
	movs r0, 0xA1
	strb r0, [r4]
	strb r0, [r4, 0x1]
	adds r4, 0x2
	b _0810FA04
	.align 2, 0
_0810F9F0: .4byte gStringVar1
_0810F9F4:
	cmp r1, 0x9
	bls _0810FA24
	ldr r4, _0810FA20
	movs r0, 0xA1
	strb r0, [r4]
	strb r0, [r4, 0x1]
	strb r0, [r4, 0x2]
	adds r4, 0x3
_0810FA04:
	ldrh r5, [r2]
	adds r0, r5, 0
	bl sub_80BF0B8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	bl ConvertIntToDecimalStringN
	b _0810FA4A
	.align 2, 0
_0810FA20: .4byte gStringVar1
_0810FA24:
	ldr r4, _0810FA50
	movs r0, 0xA1
	strb r0, [r4]
	strb r0, [r4, 0x1]
	strb r0, [r4, 0x2]
	strb r0, [r4, 0x3]
	adds r4, 0x4
	ldrh r5, [r2]
	adds r0, r5, 0
	bl sub_80BF0B8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	bl ConvertIntToDecimalStringN
_0810FA4A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810FA50: .4byte gStringVar1
	thumb_func_end sub_810F9AC

	thumb_func_start sub_810FA54
sub_810FA54: @ 810FA54
	ldr r0, _0810FA68
	ldr r2, _0810FA6C
	adds r1, r0, r2
	movs r2, 0
	strh r2, [r1]
	ldr r1, _0810FA70
	adds r0, r1
	strh r2, [r0]
	bx lr
	.align 2, 0
_0810FA68: .4byte gSaveBlock1
_0810FA6C: .4byte 0x000013c2
_0810FA70: .4byte 0x000013c4
	thumb_func_end sub_810FA54

	thumb_func_start sub_810FA74
sub_810FA74: @ 810FA74
	push {lr}
	bl sub_810FF30
	lsls r0, 24
	cmp r0, 0
	beq _0810FA90
	bl sub_810FCE8
	ldr r0, _0810FA94
	ldr r1, _0810FA98
	ldrh r1, [r1, 0xE]
	ldr r2, _0810FA9C
	adds r0, r2
	strh r1, [r0]
_0810FA90:
	pop {r0}
	bx r0
	.align 2, 0
_0810FA94: .4byte gSaveBlock1
_0810FA98: .4byte gSaveBlock2
_0810FA9C: .4byte 0x000013c4
	thumb_func_end sub_810FA74

	thumb_func_start sub_810FAA0
sub_810FAA0: @ 810FAA0
	push {r4,lr}
	ldr r4, _0810FAF0
	ldr r1, _0810FAF4
	adds r0, r4, r1
	ldrh r0, [r0]
	lsrs r0, 7
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0810FAE8
	bl sub_810FF48
	bl sub_810FD80
	ldr r0, _0810FAF8
	ldrh r1, [r0, 0xE]
	ldr r2, _0810FAFC
	adds r0, r4, r2
	strh r1, [r0]
	ldr r0, _0810FB00
	bl FlagReset
	ldr r0, _0810FB04
	bl FlagReset
	ldr r0, _0810FB08
	bl FlagReset
	movs r0, 0xC6
	lsls r0, 2
	bl FlagReset
	ldr r0, _0810FB0C
	movs r1, 0x1
	bl VarSet
_0810FAE8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810FAF0: .4byte gSaveBlock1
_0810FAF4: .4byte 0x000013c2
_0810FAF8: .4byte gSaveBlock2
_0810FAFC: .4byte 0x000013c4
_0810FB00: .4byte 0x00000315
_0810FB04: .4byte 0x00000316
_0810FB08: .4byte 0x00000317
_0810FB0C: .4byte 0x00004095
	thumb_func_end sub_810FAA0

	thumb_func_start sub_810FB10
sub_810FB10: @ 810FB10
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0810FB54
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bne _0810FB80
	ldr r0, _0810FB58
	ldr r1, _0810FB5C
	adds r4, r0, r1
	ldrh r2, [r4]
	movs r1, 0x7F
	ands r1, r2
	ldr r0, _0810FB60
	adds r0, r5, r0
	ldrb r0, [r0]
	adds r1, r0
	cmp r1, 0x13
	ble _0810FB7C
	bl sub_810FCB0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bhi _0810FB68
	bl sub_810FB9C
	ldrh r1, [r4]
	ldr r0, _0810FB64
	ands r0, r1
	b _0810FB7E
	.align 2, 0
_0810FB54: .4byte 0x00004095
_0810FB58: .4byte gSaveBlock1
_0810FB5C: .4byte 0x000013c2
_0810FB60: .4byte gUnknown_083F8404
_0810FB64: .4byte 0x0000ff80
_0810FB68:
	ldrh r0, [r4]
	ldr r1, _0810FB78
	ands r1, r0
	movs r0, 0x14
	orrs r1, r0
	strh r1, [r4]
	b _0810FB80
	.align 2, 0
_0810FB78: .4byte 0x0000ff80
_0810FB7C:
	adds r0, r2, r0
_0810FB7E:
	strh r0, [r4]
_0810FB80:
	ldr r0, _0810FB94
	ldr r1, _0810FB98
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x7F
	ands r0, r1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0810FB94: .4byte gSaveBlock1
_0810FB98: .4byte 0x000013c2
	thumb_func_end sub_810FB10

	thumb_func_start sub_810FB9C
sub_810FB9C: @ 810FB9C
	push {r4-r7,lr}
	sub sp, 0x4
	movs r3, 0
	movs r5, 0
	ldr r7, _0810FBD8
	movs r6, 0x1
_0810FBA8:
	ldrh r1, [r7]
	ldr r0, _0810FBDC
	adds r0, r5, r0
	ldrb r4, [r0]
	asrs r1, r4
	ands r1, r6
	cmp r1, 0
	bne _0810FBE0
	adds r3, r5, 0
	str r3, [sp]
	bl Random
	adds r1, r6, 0
	ands r1, r0
	ldr r3, [sp]
	cmp r1, 0
	beq _0810FBE0
	adds r0, r6, 0
	lsls r0, r4
	ldrh r1, [r7]
	orrs r0, r1
	strh r0, [r7]
	b _0810FC00
	.align 2, 0
_0810FBD8: .4byte gSaveBlock1 + 0x13C2
_0810FBDC: .4byte gUnknown_083F8408
_0810FBE0:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _0810FBA8
	ldr r2, _0810FC0C
	ldr r0, _0810FC10
	adds r2, r0
	ldr r1, _0810FC14
	adds r1, r3, r1
	movs r0, 0x1
	ldrb r1, [r1]
	lsls r0, r1
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
_0810FC00:
	adds r0, r3, 0
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810FC0C: .4byte gSaveBlock1
_0810FC10: .4byte 0x000013c2
_0810FC14: .4byte gUnknown_083F8408
	thumb_func_end sub_810FB9C

	thumb_func_start sub_810FC18
sub_810FC18: @ 810FC18
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r0, 0
	mov r8, r0
	bl sub_810FCB0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bne _0810FC3E
	movs r0, 0
	b _0810FC94
_0810FC34:
	lsls r4, r6
	ldrh r0, [r2]
	eors r4, r0
	strh r4, [r2]
	b _0810FC92
_0810FC3E:
	movs r5, 0
	ldr r2, _0810FCA0
	movs r4, 0x1
_0810FC44:
	ldrh r1, [r2]
	ldr r7, _0810FCA4
	adds r0, r5, r7
	ldrb r6, [r0]
	asrs r1, r6
	ands r1, r4
	cmp r1, 0
	beq _0810FC66
	mov r8, r5
	str r2, [sp]
	bl Random
	adds r1, r4, 0
	ands r1, r0
	ldr r2, [sp]
	cmp r1, 0
	bne _0810FC34
_0810FC66:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _0810FC44
	ldr r0, _0810FCA8
	ldr r1, _0810FCAC
	adds r4, r0, r1
	ldrh r1, [r4]
	mov r2, r8
	adds r0, r2, r7
	ldrb r2, [r0]
	adds r0, r1, 0
	asrs r0, r2
	movs r3, 0x1
	ands r0, r3
	cmp r0, 0
	beq _0810FC92
	adds r0, r3, 0
	lsls r0, r2
	eors r1, r0
	strh r1, [r4]
_0810FC92:
	mov r0, r8
_0810FC94:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810FCA0: .4byte gSaveBlock1 + 0x13C2
_0810FCA4: .4byte gUnknown_083F8410
_0810FCA8: .4byte gSaveBlock1
_0810FCAC: .4byte 0x000013c2
	thumb_func_end sub_810FC18

	thumb_func_start sub_810FCB0
sub_810FCB0: @ 810FCB0
	push {r4,r5,lr}
	movs r3, 0
	movs r2, 0
	ldr r0, _0810FCE4
	ldrh r4, [r0]
	movs r5, 0x1
_0810FCBC:
	adds r1, r2, 0
	adds r1, 0x8
	adds r0, r4, 0
	asrs r0, r1
	ands r0, r5
	cmp r0, 0
	beq _0810FCD0
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
_0810FCD0:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _0810FCBC
	adds r0, r3, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0810FCE4: .4byte gSaveBlock1 + 0x13C2
	thumb_func_end sub_810FCB0

	thumb_func_start sub_810FCE8
sub_810FCE8: @ 810FCE8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r5, 0
	ldr r2, _0810FD08
	ldrh r1, [r2, 0xE]
	ldr r0, _0810FD0C
	cmp r1, r0
	bhi _0810FD54
	ldr r7, _0810FD10
	adds r6, r2, 0
	ldr r0, _0810FD14
	adds r0, r7
	mov r8, r0
	b _0810FD36
	.align 2, 0
_0810FD08: .4byte gSaveBlock2
_0810FD0C: .4byte 0x000003e6
_0810FD10: .4byte gSaveBlock1
_0810FD14: .4byte 0x000013c4
_0810FD18:
	ldrh r1, [r6, 0xE]
	ldr r0, _0810FD4C
	adds r4, r7, r0
	ldrh r0, [r4]
	subs r1, r0
	cmp r1, 0xB
	ble _0810FD54
	bl sub_810FC18
	ldrh r0, [r4]
	adds r0, 0xC
	strh r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0810FD36:
	bl sub_810FCB0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4
	bhi _0810FD50
	ldrh r0, [r6, 0xE]
	mov r1, r8
	strh r0, [r1]
	b _0810FD54
	.align 2, 0
_0810FD4C: .4byte 0x000013c4
_0810FD50:
	cmp r5, 0x8
	bne _0810FD18
_0810FD54:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810FCE8

	thumb_func_start sub_810FD60
sub_810FD60: @ 810FD60
	ldr r0, _0810FD74
	ldr r1, _0810FD78
	adds r0, r1
	ldrh r0, [r0]
	ldr r1, _0810FD7C
	ldrh r1, [r1]
	asrs r0, r1
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_0810FD74: .4byte gSaveBlock1
_0810FD78: .4byte 0x000013c2
_0810FD7C: .4byte gUnknown_0202E8CC
	thumb_func_end sub_810FD60

	thumb_func_start sub_810FD80
sub_810FD80: @ 810FD80
	ldr r2, _0810FDA4
	ldr r0, _0810FDA8
	adds r2, r0
	ldrh r1, [r2]
	movs r3, 0x80
	lsls r3, 6
	adds r0, r3, 0
	orrs r0, r1
	movs r3, 0x80
	lsls r3, 1
	adds r1, r3, 0
	orrs r0, r1
	movs r3, 0x80
	lsls r3, 3
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_0810FDA4: .4byte gSaveBlock1
_0810FDA8: .4byte 0x000013c2
	thumb_func_end sub_810FD80

	thumb_func_start sub_810FDAC
sub_810FDAC: @ 810FDAC
	push {lr}
	movs r3, 0
	movs r2, 0
	ldr r0, _0810FDC8
	ldrh r0, [r0]
	subs r0, 0x8
	cmp r0, 0x7
	bhi _0810FE0C
	lsls r0, 2
	ldr r1, _0810FDCC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810FDC8: .4byte gUnknown_0202E8CC
_0810FDCC: .4byte _0810FDD0
	.align 2, 0
_0810FDD0:
	.4byte _0810FE0C
	.4byte _0810FE0C
	.4byte _0810FDF0
	.4byte _0810FDF6
	.4byte _0810FDFC
	.4byte _0810FE02
	.4byte _0810FE08
	.4byte _0810FE0C
_0810FDF0:
	movs r3, 0
	movs r2, 0x3
	b _0810FE0C
_0810FDF6:
	movs r3, 0
	movs r2, 0x1
	b _0810FE0C
_0810FDFC:
	movs r3, 0x1
	movs r2, 0
	b _0810FE0C
_0810FE02:
	movs r3, 0
	movs r2, 0x4
	b _0810FE0C
_0810FE08:
	movs r3, 0x1
	movs r2, 0x5
_0810FE0C:
	ldr r0, _0810FE18
	adds r1, r3, 0
	bl sub_810FE1C
	pop {r0}
	bx r0
	.align 2, 0
_0810FE18: .4byte gSaveBlock1 + 0x30B8
	thumb_func_end sub_810FDAC

	thumb_func_start sub_810FE1C
sub_810FE1C: @ 810FE1C
	push {r4,lr}
	lsls r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsrs r1, 20
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _0810FED0
	cmp r2, 0x5
	bhi _0810FEBC
	lsls r0, r2, 2
	ldr r1, _0810FE3C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810FE3C: .4byte _0810FE40
	.align 2, 0
_0810FE40:
	.4byte _0810FEBC
	.4byte _0810FE58
	.4byte _0810FE6C
	.4byte _0810FE80
	.4byte _0810FE94
	.4byte _0810FEA8
_0810FE58:
	ldr r0, _0810FE64
	ldr r1, _0810FE68
	bl StringCopy
	b _0810FEF2
	.align 2, 0
_0810FE64: .4byte gStringVar1
_0810FE68: .4byte gOtherText_Steven
_0810FE6C:
	ldr r0, _0810FE78
	ldr r1, _0810FE7C
	bl StringCopy
	b _0810FEF2
	.align 2, 0
_0810FE78: .4byte gStringVar1
_0810FE7C: .4byte gOtherText_Brawly
_0810FE80:
	ldr r0, _0810FE8C
	ldr r1, _0810FE90
	bl StringCopy
	b _0810FEF2
	.align 2, 0
_0810FE8C: .4byte gStringVar1
_0810FE90: .4byte gOtherText_Winona
_0810FE94:
	ldr r0, _0810FEA0
	ldr r1, _0810FEA4
	bl StringCopy
	b _0810FEF2
	.align 2, 0
_0810FEA0: .4byte gStringVar1
_0810FEA4: .4byte gOtherText_Phoebe
_0810FEA8:
	ldr r0, _0810FEB4
	ldr r1, _0810FEB8
	bl StringCopy
	b _0810FEF2
	.align 2, 0
_0810FEB4: .4byte gStringVar1
_0810FEB8: .4byte gOtherText_Glacia
_0810FEBC:
	ldr r0, _0810FEC8
	ldr r1, _0810FECC
	bl StringCopy
	b _0810FEF2
	.align 2, 0
_0810FEC8: .4byte gStringVar1
_0810FECC: .4byte gOtherText_Wallace
_0810FED0:
	ldr r4, _0810FEF8
	adds r0, r4, 0
	movs r2, 0x7
	bl StringCopyN
	movs r0, 0xFF
	strb r0, [r4, 0x7]
	ldrb r0, [r4]
	cmp r0, 0xFC
	bne _0810FEF2
	ldrb r0, [r4, 0x1]
	cmp r0, 0x15
	bne _0810FEF2
	adds r0, r4, 0
	movs r1, 0x1
	bl ConvertInternationalString
_0810FEF2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810FEF8: .4byte gStringVar1
	thumb_func_end sub_810FE1C

	thumb_func_start sub_810FEFC
sub_810FEFC: @ 810FEFC
	push {lr}
	ldr r0, _0810FF20
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bne _0810FF2C
	bl sub_810FA74
	ldr r0, _0810FF24
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0810FF28
	bl sub_810FB9C
	b _0810FF2C
	.align 2, 0
_0810FF20: .4byte 0x00004095
_0810FF24: .4byte gUnknown_02024D26
_0810FF28:
	bl sub_810FC18
_0810FF2C:
	pop {r0}
	bx r0
	thumb_func_end sub_810FEFC

	thumb_func_start sub_810FF30
sub_810FF30: @ 810FF30
	ldr r0, _0810FF40
	ldr r1, _0810FF44
	adds r0, r1
	ldrh r0, [r0]
	lsrs r0, 7
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_0810FF40: .4byte gSaveBlock1
_0810FF44: .4byte 0x000013c2
	thumb_func_end sub_810FF30

	thumb_func_start sub_810FF48
sub_810FF48: @ 810FF48
	ldr r0, _0810FF58
	ldr r1, _0810FF5C
	adds r0, r1
	ldrh r2, [r0]
	movs r1, 0x80
	orrs r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_0810FF58: .4byte gSaveBlock1
_0810FF5C: .4byte 0x000013c2
	thumb_func_end sub_810FF48

	thumb_func_start sub_810FF60
sub_810FF60: @ 810FF60
	push {lr}
	ldr r0, _0810FF74
	ldrb r0, [r0]
	bl sub_810FB10
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0810FF74: .4byte gUnknown_0202E8CC
	thumb_func_end sub_810FF60

	thumb_func_start sub_810FF78
sub_810FF78: @ 810FF78
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r2, _0810FFA4
	mov r0, sp
	adds r1, r4, 0
	bl CpuSet
	movs r0, 0xFF
	strb r0, [r4]
	movs r0, 0
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
	strh r0, [r4, 0xE]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810FFA4: .4byte 0x01000008
	thumb_func_end sub_810FF78

	thumb_func_start sub_810FFA8
sub_810FFA8: @ 810FFA8
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0x4
_0810FFAE:
	adds r0, r4, 0
	bl sub_810FF78
	adds r4, 0x10
	subs r5, 0x1
	cmp r5, 0
	bge _0810FFAE
	movs r0, 0x17
	movs r1, 0
	bl sav12_xor_set
	movs r0, 0x18
	movs r1, 0
	bl sav12_xor_set
	movs r0, 0x19
	movs r1, 0
	bl sav12_xor_set
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_810FFA8

	thumb_func_start sub_810FFDC
sub_810FFDC: @ 810FFDC
	adds r1, r0, 0
	ldrh r0, [r1, 0xA]
	ldrh r2, [r1, 0xC]
	adds r0, r2
	ldrh r1, [r1, 0xE]
	adds r0, r1
	bx lr
	thumb_func_end sub_810FFDC

	thumb_func_start sub_810FFEC
sub_810FFEC: @ 810FFEC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	lsls r2, 16
	lsrs r7, r2, 16
	movs r5, 0
	ldr r6, _08110024
	adds r4, r0, 0
_0810FFFE:
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0x7
	bl memcpy
	movs r0, 0xFF
	strb r0, [r6, 0x7]
	adds r0, r6, 0
	mov r1, r8
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	bne _08110028
	ldrh r0, [r4, 0x8]
	cmp r0, r7
	bne _08110028
	adds r0, r5, 0
	b _08110032
	.align 2, 0
_08110024: .4byte gStringVar1
_08110028:
	adds r4, 0x10
	adds r5, 0x1
	cmp r5, 0x4
	ble _0810FFFE
	movs r0, 0x5
_08110032:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_810FFEC

	thumb_func_start sub_811003C
sub_811003C: @ 811003C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	mov r8, r0
	movs r0, 0x4
_0811004A:
	subs r2, r0, 0x1
	mov r9, r2
	cmp r2, 0
	blt _081100A4
	lsls r0, 4
	mov r1, r8
	adds r6, r1, r0
	lsls r0, r2, 4
	adds r5, r0, r1
_0811005C:
	adds r0, r6, 0
	str r2, [sp, 0x10]
	bl sub_810FFDC
	adds r4, r0, 0
	adds r0, r5, 0
	bl sub_810FFDC
	ldr r2, [sp, 0x10]
	cmp r4, r0
	ble _08110096
	mov r1, sp
	adds r0, r6, 0
	ldm r0!, {r3,r4,r7}
	stm r1!, {r3,r4,r7}
	ldr r0, [r0]
	str r0, [r1]
	adds r1, r6, 0
	adds r0, r5, 0
	ldm r0!, {r3,r4,r7}
	stm r1!, {r3,r4,r7}
	ldr r0, [r0]
	str r0, [r1]
	adds r1, r5, 0
	mov r0, sp
	ldm r0!, {r3,r4,r7}
	stm r1!, {r3,r4,r7}
	ldr r0, [r0]
	str r0, [r1]
_08110096:
	subs r5, 0x10
	movs r0, 0x1
	negs r0, r0
	add r9, r0
	mov r1, r9
	cmp r1, 0
	bge _0811005C
_081100A4:
	adds r0, r2, 0
	cmp r0, 0
	bgt _0811004A
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_811003C

	thumb_func_start sub_81100B8
sub_81100B8: @ 81100B8
	push {lr}
	adds r2, r0, 0
	cmp r1, 0x2
	beq _081100E8
	cmp r1, 0x2
	bgt _081100CA
	cmp r1, 0x1
	beq _081100D0
	b _08110112
_081100CA:
	cmp r1, 0x3
	beq _08110100
	b _08110112
_081100D0:
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _081100E4
	cmp r0, r1
	bls _08110112
	strh r1, [r2, 0xA]
	b _08110112
	.align 2, 0
_081100E4: .4byte 0x0000270f
_081100E8:
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _081100FC
	cmp r0, r1
	bls _08110112
	strh r1, [r2, 0xC]
	b _08110112
	.align 2, 0
_081100FC: .4byte 0x0000270f
_08110100:
	ldrh r0, [r2, 0xE]
	adds r0, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08110118
	cmp r0, r1
	bls _08110112
	strh r1, [r2, 0xE]
_08110112:
	pop {r0}
	bx r0
	.align 2, 0
_08110118: .4byte 0x0000270f
	thumb_func_end sub_81100B8

	thumb_func_start sub_811011C
sub_811011C: @ 811011C
	push {r4,lr}
	cmp r0, 0x2
	beq _08110136
	cmp r0, 0x2
	bgt _0811012C
	cmp r0, 0x1
	beq _08110132
	b _0811014E
_0811012C:
	cmp r0, 0x3
	beq _0811013A
	b _0811014E
_08110132:
	movs r4, 0x17
	b _0811013C
_08110136:
	movs r4, 0x18
	b _0811013C
_0811013A:
	movs r4, 0x19
_0811013C:
	adds r0, r4, 0
	bl sub_8053108
	ldr r1, _08110154
	cmp r0, r1
	bhi _0811014E
	adds r0, r4, 0
	bl sav12_xor_increment
_0811014E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08110154: .4byte 0x0000270e
	thumb_func_end sub_811011C

	thumb_func_start sub_8110158
sub_8110158: @ 8110158
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r5, r0, 0
	adds r7, r1, 0
	mov r10, r3
	ldr r0, [sp, 0x20]
	lsls r2, 16
	lsrs r2, 16
	mov r9, r2
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	mov r0, r10
	bl sub_811011C
	adds r0, r5, 0
	bl sub_811003C
	adds r0, r5, 0
	adds r1, r7, 0
	mov r2, r9
	bl sub_810FFEC
	adds r6, r0, 0
	cmp r6, 0x5
	bne _081101CC
	movs r6, 0x4
	adds r4, r5, 0
	adds r4, 0x40
	adds r0, r4, 0
	bl sub_810FF78
	mov r0, r8
	cmp r0, 0x1
	bne _081101BA
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x15
	strb r0, [r4, 0x1]
	adds r0, r5, 0
	adds r0, 0x42
	adds r1, r7, 0
	movs r2, 0x5
	bl StringCopyN
	b _081101C4
_081101BA:
	adds r0, r4, 0
	adds r1, r7, 0
	movs r2, 0x7
	bl StringCopyN
_081101C4:
	lsls r0, r6, 4
	adds r0, r5, r0
	mov r1, r9
	strh r1, [r0, 0x8]
_081101CC:
	lsls r0, r6, 4
	adds r0, r5, r0
	mov r1, r10
	bl sub_81100B8
	adds r0, r5, 0
	bl sub_811003C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8110158

	thumb_func_start GameFreakRTC_Reset
GameFreakRTC_Reset: @ 81101EC
	push {lr}
	ldr r0, _081101F8
	bl sub_810FFA8
	pop {r0}
	bx r0
	.align 2, 0
_081101F8: .4byte gSaveBlock1 + 0x30B8
	thumb_func_end GameFreakRTC_Reset

	thumb_func_start sub_81101FC
sub_81101FC: @ 81101FC
	push {lr}
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 3
	ldr r0, _08110220
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08110224
	cmp r0, r2
	bls _0811021A
	strh r2, [r1]
_0811021A:
	pop {r0}
	bx r0
	.align 2, 0
_08110220: .4byte gUnknown_0202FFD4
_08110224: .4byte 0x0000270f
	thumb_func_end sub_81101FC

	thumb_func_start sub_8110228
sub_8110228: @ 8110228
	push {lr}
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 3
	ldr r0, _0811024C
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08110250
	cmp r0, r2
	bls _08110246
	strh r2, [r1]
_08110246:
	pop {r0}
	bx r0
	.align 2, 0
_0811024C: .4byte gUnknown_0202FFD6
_08110250: .4byte 0x0000270f
	thumb_func_end sub_8110228

	thumb_func_start sub_8110254
sub_8110254: @ 8110254
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08110268
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0811026C
	cmp r0, 0x2
	beq _0811027A
	b _08110288
	.align 2, 0
_08110268: .4byte gUnknown_02024D26
_0811026C:
	eors r0, r4
	bl sub_81101FC
	adds r0, r4, 0
	bl sub_8110228
	b _08110288
_0811027A:
	movs r0, 0x1
	eors r0, r4
	bl sub_8110228
	adds r0, r4, 0
	bl sub_81101FC
_08110288:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8110254

	thumb_func_start sub_8110290
sub_8110290: @ 8110290
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	bl sub_8110254
	ldr r0, _081102D4
	lsls r2, r4, 3
	subs r2, r4
	lsls r2, 3
	ldr r3, _081102D8
	adds r1, r2, r3
	subs r3, 0x30
	adds r2, r3
	ldrh r2, [r2, 0xE]
	ldr r3, _081102DC
	ldrb r3, [r3]
	ldr r6, _081102E0
	ldr r5, _081102E4
	lsls r4, 2
	adds r4, r5
	ldrb r5, [r4, 0x1]
	lsls r4, r5, 3
	subs r4, r5
	lsls r4, 2
	adds r4, r6
	ldrb r4, [r4, 0x1A]
	str r4, [sp]
	bl sub_8110158
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081102D4: .4byte gSaveBlock1 + 0x30B8
_081102D8: .4byte gUnknown_0202FFF0
_081102DC: .4byte gUnknown_02024D26
_081102E0: .4byte gLinkPlayers
_081102E4: .4byte gUnknown_02029818
	thumb_func_end sub_8110290

	thumb_func_start sub_81102E8
sub_81102E8: @ 81102E8
	push {r4,lr}
	ldr r4, _08110338
	movs r0, 0x17
	bl sub_8053108
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN_DigitWidth6
	ldr r4, _0811033C
	movs r0, 0x18
	bl sub_8053108
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN_DigitWidth6
	ldr r4, _08110340
	movs r0, 0x19
	bl sub_8053108
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN_DigitWidth6
	ldr r0, _08110344
	movs r1, 0x3
	movs r2, 0x3
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08110338: .4byte gStringVar1
_0811033C: .4byte gStringVar2
_08110340: .4byte gStringVar3
_08110344: .4byte gOtherText_WinRecord
	thumb_func_end sub_81102E8

	thumb_func_start sub_8110348
sub_8110348: @ 8110348
	push {r4-r7,lr}
	sub sp, 0x10
	adds r7, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	ldrh r0, [r7, 0xA]
	cmp r0, 0
	bne _081103C0
	ldr r0, [r7, 0xC]
	cmp r0, 0
	bne _081103C0
	mov r0, sp
	movs r2, 0xFC
	strb r2, [r0]
	mov r1, sp
	movs r0, 0x14
	strb r0, [r1, 0x1]
	movs r0, 0x6
	strb r0, [r1, 0x2]
	mov r0, sp
	strb r2, [r0, 0x3]
	movs r0, 0x11
	strb r0, [r1, 0x4]
	movs r0, 0x1
	strb r0, [r1, 0x5]
	mov r4, sp
	adds r4, 0x6
	ldr r1, _081103B8
	adds r0, r4, 0
	bl StringCopy
	mov r0, sp
	movs r1, 0x3
	adds r2, r6, 0
	bl MenuPrint
	ldr r1, _081103BC
	adds r0, r4, 0
	bl StringCopy
	mov r0, sp
	movs r1, 0xB
	adds r2, r6, 0
	bl MenuPrint
	mov r0, sp
	movs r1, 0x11
	adds r2, r6, 0
	bl MenuPrint
	mov r0, sp
	movs r1, 0x17
	adds r2, r6, 0
	bl MenuPrint
	b _0811042E
	.align 2, 0
_081103B8: .4byte gOtherText_SevenDashes
_081103BC: .4byte gOtherText_FourDashes
_081103C0:
	ldr r4, _08110438
	adds r0, r4, 0
	movs r1, 0x8
	bl StringFillWithTerminator
	adds r0, r4, 0
	adds r1, r7, 0
	movs r2, 0x7
	bl StringCopyN
	adds r0, r4, 0
	movs r1, 0x3
	adds r2, r6, 0
	bl MenuPrint
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x14
	strb r0, [r4, 0x1]
	movs r0, 0x6
	strb r0, [r4, 0x2]
	adds r5, r4, 0x3
	ldrh r1, [r7, 0xA]
	adds r0, r5, 0
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	adds r0, r4, 0
	movs r1, 0xB
	adds r2, r6, 0
	bl MenuPrint
	ldrh r1, [r7, 0xC]
	adds r0, r5, 0
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	adds r0, r4, 0
	movs r1, 0x11
	adds r2, r6, 0
	bl MenuPrint
	ldrh r1, [r7, 0xE]
	adds r0, r5, 0
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	adds r0, r4, 0
	movs r1, 0x17
	adds r2, r6, 0
	bl MenuPrint
_0811042E:
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08110438: .4byte gStringVar1
	thumb_func_end sub_8110348

	thumb_func_start sub_811043C
sub_811043C: @ 811043C
	push {r4,lr}
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x1C
	movs r3, 0x12
	bl MenuDrawTextWindow
	ldr r0, _08110488
	movs r1, 0
	movs r2, 0x1
	movs r3, 0xF0
	bl sub_8072BD8
	ldr r0, _0811048C
	bl sub_81102E8
	ldr r0, _08110490
	movs r1, 0xC
	movs r2, 0x6
	bl MenuPrint
	movs r4, 0
_08110468:
	lsls r0, r4, 4
	ldr r1, _0811048C
	adds r0, r1
	adds r4, 0x1
	lsls r1, r4, 25
	movs r2, 0xC0
	lsls r2, 19
	adds r1, r2
	lsrs r1, 24
	bl sub_8110348
	cmp r4, 0x4
	ble _08110468
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08110488: .4byte gOtherText_BattleResults
_0811048C: .4byte gSaveBlock1 + 0x30B8
_08110490: .4byte gOtherText_WinLoseDraw
	thumb_func_end sub_811043C

	thumb_func_start sub_8110494
sub_8110494: @ 8110494
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _081104B4
	ldr r2, _081104B8
	adds r1, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x6
	bhi _081104E0
	lsls r0, 2
	ldr r1, _081104BC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081104B4: .4byte gSaveBlock2 + 0xA8
_081104B8: .4byte 0x000004ae
_081104BC: .4byte _081104C0
	.align 2, 0
_081104C0:
	.4byte _081104E0
	.4byte _081104E0
	.4byte _081104DC
	.4byte _081104DC
	.4byte _081104E0
	.4byte _081104E0
	.4byte _081104DC
_081104DC:
	movs r0, 0x1
	b _081104E2
_081104E0:
	movs r0, 0
_081104E2:
	pop {r1}
	bx r1
	thumb_func_end sub_8110494

	thumb_func_start sub_81104E8
sub_81104E8: @ 81104E8
	push {r4-r6,lr}
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 24
	lsrs r2, 24
	adds r5, r2, 0
	lsls r3, 24
	lsrs r3, 24
	adds r6, r3, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl MenuPrint
	ldr r0, _0811052C
	cmp r4, r0
	bls _0811050A
	adds r4, r0, 0
_0811050A:
	ldr r0, _08110530
	adds r1, r4, 0
	movs r2, 0x18
	movs r3, 0x1
	bl sub_8072C14
	ldr r0, _08110534
	adds r1, r5, 0x7
	lsls r1, 24
	lsrs r1, 24
	adds r2, r6, 0
	bl MenuPrint
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811052C: .4byte 0x0000270f
_08110530: .4byte gStringVar1
_08110534: .4byte gOtherText_WinStreak
	thumb_func_end sub_81104E8

	thumb_func_start sub_8110538
sub_8110538: @ 8110538
	push {r4,lr}
	adds r4, r1, 0
	adds r3, r2, 0
	lsls r0, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r1, _08110564
	lsrs r0, 23
	movs r2, 0x97
	lsls r2, 3
	adds r1, r2
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _08110568
	adds r2, r4, 0
	bl sub_81104E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08110564: .4byte gSaveBlock2 + 0xA8
_08110568: .4byte gOtherText_Record
	thumb_func_end sub_8110538

	thumb_func_start sub_811056C
sub_811056C: @ 811056C
	push {lr}
	lsls r0, 24
	ldr r1, _08110588
	lsrs r0, 23
	ldr r2, _0811058C
	adds r1, r2
	adds r0, r1
	ldrh r0, [r0]
	ldr r1, _08110590
	cmp r0, r1
	bls _08110584
	adds r0, r1, 0
_08110584:
	pop {r1}
	bx r1
	.align 2, 0
_08110588: .4byte gSaveBlock2
_0811058C: .4byte 0x00000574
_08110590: .4byte 0x0000270f
	thumb_func_end sub_811056C

	thumb_func_start sub_8110594
sub_8110594: @ 8110594
	push {r4-r7,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r7, r2, 24
	adds r0, r4, 0
	bl sub_811056C
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	bl sub_8110494
	cmp r0, 0x1
	bne _081105CC
	ldr r0, _081105C8
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_81104E8
	b _081105D8
	.align 2, 0
_081105C8: .4byte gOtherText_Current
_081105CC:
	ldr r0, _081105E0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_81104E8
_081105D8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081105E0: .4byte gOtherText_Prev
	thumb_func_end sub_8110594

	thumb_func_start sub_81105E4
sub_81105E4: @ 81105E4
	push {r4,lr}
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0x1B
	movs r3, 0x11
	bl MenuDrawTextWindow
	ldr r0, _08110658
	movs r1, 0x3
	movs r2, 0x2
	movs r3, 0xC8
	bl sub_8072BD8
	ldr r0, _0811065C
	movs r1, 0x5
	movs r2, 0x6
	bl MenuPrint
	ldr r0, _08110660
	movs r1, 0x5
	movs r2, 0xC
	bl MenuPrint
	movs r4, 0x5
_08110614:
	lsls r1, r4, 24
	lsrs r1, 24
	movs r0, 0xAE
	movs r2, 0xA
	bl sub_8071F60
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x19
	bls _08110614
	movs r0, 0
	movs r1, 0xA
	movs r2, 0x6
	bl sub_8110594
	movs r0, 0
	movs r1, 0xA
	movs r2, 0x8
	bl sub_8110538
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0xC
	bl sub_8110594
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0xE
	bl sub_8110538
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08110658: .4byte gOtherText_BattleTowerResults
_0811065C: .4byte gOtherText_Lv50
_08110660: .4byte gOtherText_Lv100
	thumb_func_end sub_81105E4

	thumb_func_start unref_sub_8110664
unref_sub_8110664: @ 8110664
	push {lr}
	ldr r3, _08110678
	str r1, [r3, 0x4]
	str r2, [r3, 0x8]
	strh r0, [r3, 0xE]
	ldr r0, _0811067C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08110678: .4byte 0x02000000
_0811067C: .4byte sub_8110680
	thumb_func_end unref_sub_8110664

	thumb_func_start sub_8110680
sub_8110680: @ 8110680
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0811069C
	ldr r1, _081106A0
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x7
	bls _08110692
	b _081107C0
_08110692:
	lsls r0, 2
	ldr r1, _081106A4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811069C: .4byte gMain
_081106A0: .4byte 0x0000043c
_081106A4: .4byte _081106A8
	.align 2, 0
_081106A8:
	.4byte _081106C8
	.4byte _08110720
	.4byte _08110740
	.4byte _08110746
	.4byte _08110752
	.4byte _08110770
	.4byte _08110782
	.4byte _081107A8
_081106C8:
	movs r0, 0
	bl SetVBlankCallback
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xC4
	lsls r2, 7
	adds r0, r2, 0
	strh r0, [r1]
	bl ResetPaletteFade
	bl ResetSpriteData
	bl ResetTasks
	bl FreeSpriteTileRanges
	bl FreeAllSpritePalettes
	ldr r0, _08110710
	movs r1, 0
	strh r1, [r0]
	ldr r2, _08110714
	ldr r3, _08110718
	adds r0, r3, 0
	strh r0, [r2]
	ldr r0, _0811071C
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	b _081107C0
	.align 2, 0
_08110710: .4byte REG_BG0HOFS
_08110714: .4byte REG_BG0VOFS
_08110718: .4byte 0x0000fff8
_0811071C: .4byte REG_BG2VOFS
_08110720:
	ldr r4, _0811073C
	adds r0, r4, 0
	movs r1, 0
	bl sub_80FA8EC
	movs r0, 0x88
	lsls r0, 4
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x10
	bl StringFill
	b _081107C0
	.align 2, 0
_0811073C: .4byte 0x020006e8
_08110740:
	bl sub_8110824
	b _081107C0
_08110746:
	bl sub_8110838
	lsls r0, 24
	cmp r0, 0
	bne _081107CC
	b _081107C0
_08110752:
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80FBCF0
	movs r1, 0x8
	negs r1, r1
	movs r0, 0
	bl sub_80FB2A4
	ldr r0, _0811076C
	bl SetVBlankCallback
	b _081107C0
	.align 2, 0
_0811076C: .4byte sub_81107DC
_08110770:
	movs r0, 0x15
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _081107C0
_08110782:
	ldr r1, _0811079C
	ldr r2, _081107A0
	adds r0, r2, 0
	strh r0, [r1]
	bl sub_8111084
	movs r1, 0x80
	lsls r1, 19
	ldr r3, _081107A4
	adds r0, r3, 0
	strh r0, [r1]
	b _081107C0
	.align 2, 0
_0811079C: .4byte REG_BLDCNT
_081107A0: .4byte 0x00003f41
_081107A4: .4byte 0x00007741
_081107A8:
	ldr r0, _081107B8
	bl sub_8110814
	ldr r0, _081107BC
	bl SetMainCallback2
	b _081107CC
	.align 2, 0
_081107B8: .4byte sub_8111288
_081107BC: .4byte sub_81107F0
_081107C0:
	ldr r1, _081107D4
	ldr r0, _081107D8
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_081107CC:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081107D4: .4byte gMain
_081107D8: .4byte 0x0000043c
	thumb_func_end sub_8110680

	thumb_func_start sub_81107DC
sub_81107DC: @ 81107DC
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_81107DC

	thumb_func_start sub_81107F0
sub_81107F0: @ 81107F0
	push {lr}
	ldr r0, _08110810
	ldr r0, [r0]
	bl _call_via_r0
	bl sub_8111110
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
_08110810: .4byte 0x02000000
	thumb_func_end sub_81107F0

	thumb_func_start sub_8110814
sub_8110814: @ 8110814
	ldr r1, _08110820
	str r0, [r1]
	movs r0, 0
	strh r0, [r1, 0xC]
	bx lr
	.align 2, 0
_08110820: .4byte 0x02000000
	thumb_func_end sub_8110814

	thumb_func_start sub_8110824
sub_8110824: @ 8110824
	ldr r0, _08110834
	movs r1, 0x8A
	lsls r1, 1
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
	bx lr
	.align 2, 0
_08110834: .4byte 0x02000000
	thumb_func_end sub_8110824

	thumb_func_start sub_8110838
sub_8110838: @ 8110838
	push {lr}
	ldr r1, _08110854
	movs r2, 0x8A
	lsls r2, 1
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x5
	bhi _081108E4
	lsls r0, 2
	ldr r1, _08110858
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08110854: .4byte 0x02000000
_08110858: .4byte _0811085C
	.align 2, 0
_0811085C:
	.4byte _08110874
	.4byte _08110884
	.4byte _0811088A
	.4byte _0811089C
	.4byte _081108C0
	.4byte _081108D0
_08110874:
	ldr r0, _08110880
	ldrh r0, [r0, 0xE]
	bl sub_8110908
	b _081108F0
	.align 2, 0
_08110880: .4byte 0x02000000
_08110884:
	bl sub_8110C34
	b _081108F0
_0811088A:
	ldr r0, _08110894
	ldr r1, _08110898
	bl LZ77UnCompVram
	b _081108F0
	.align 2, 0
_08110894: .4byte gUnknown_083F8438
_08110898: .4byte 0x0600c000
_0811089C:
	ldr r1, _081108B0
	ldr r0, _081108B4
	str r0, [r1]
	ldr r0, _081108B8
	str r0, [r1, 0x4]
	ldr r0, _081108BC
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	b _081108F0
	.align 2, 0
_081108B0: .4byte 0x040000d4
_081108B4: .4byte 0x02000116
_081108B8: .4byte 0x0600f000
_081108BC: .4byte 0x80000280
_081108C0:
	ldr r0, _081108CC
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	b _081108F0
	.align 2, 0
_081108CC: .4byte gUnknown_083F8418
_081108D0:
	ldr r1, _081108E8
	ldr r3, _081108EC
	adds r0, r3, 0
	strh r0, [r1]
	movs r0, 0x8A
	lsls r0, 1
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_081108E4:
	movs r0, 0
	b _08110900
	.align 2, 0
_081108E8: .4byte REG_BG0CNT
_081108EC: .4byte 0x00001e0d
_081108F0:
	ldr r1, _08110904
	movs r2, 0x8A
	lsls r2, 1
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x1
_08110900:
	pop {r1}
	bx r1
	.align 2, 0
_08110904: .4byte 0x02000000
	thumb_func_end sub_8110838

	thumb_func_start sub_8110908
sub_8110908: @ 8110908
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 16
	lsrs r7, r0, 16
	.ifdef SAPPHIRE
	ldr r0, _sub_8110908_Latias
	.else
	@ Latios
	movs r0, 0xCC
	lsls r0, 1
	.endif
	cmp r7, r0
	bne _0811091E
	b _08110A44
_0811091E:
	ldr r2, _08110988
	movs r1, 0x88
	lsls r1, 1
	adds r0, r2, r1
	movs r1, 0
	strh r1, [r0]
	movs r3, 0x89
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	movs r6, 0
	ldr r1, _0811098C
_08110936:
	lsls r0, r6, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r7
	bne _08110942
	b _08110A8C
_08110942:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0
	beq _08110936
	movs r6, 0
	ldr r4, _08110990
	ldrh r0, [r4]
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _081109D0
	mov r8, r4
	adds r5, r4, 0x4
	mov r9, r1
_08110960:
	lsls r0, r6, 1
	adds r1, r0, r6
	lsls r2, r1, 1
	mov r3, r8
	adds r1, r2, r3
	adds r3, r0, 0
	ldrh r1, [r1]
	cmp r7, r1
	bne _081109BA
	adds r0, r4, 0x2
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, 0x18
	beq _081109A6
	cmp r0, 0x18
	bgt _08110994
	cmp r0, 0
	beq _0811099A
	b _081109BA
	.align 2, 0
	.ifdef SAPPHIRE
_sub_8110908_Latias: .4byte 407
	.endif
_08110988: .4byte 0x02000000
_0811098C: .4byte gUnknown_083F856C
_08110990: .4byte gUnknown_083F856E
_08110994:
	cmp r0, 0x1A
	beq _081109A6
	b _081109BA
_0811099A:
	adds r0, r2, r5
	ldrh r1, [r0]
	movs r0, 0
	bl sub_8110A98
	b _081109BA
_081109A6:
	adds r1, r3, r6
	lsls r1, 1
	mov r0, r8
	adds r0, 0x2
	adds r0, r1, r0
	ldrh r0, [r0]
	adds r1, r5
	ldrh r1, [r1]
	bl sub_8110AE4
_081109BA:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r4, _08110A00
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 1
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, r9
	bne _08110960
_081109D0:
	movs r6, 0
	ldr r1, _08110A04
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _08110A8C
_081109DA:
	lsls r4, r6, 2
	adds r0, r4, r6
	lsls r0, 2
	adds r5, r0, r1
	adds r0, r5, 0
	adds r1, r7, 0
	bl sub_8110BA4
	lsls r0, 24
	cmp r0, 0
	beq _08110A28
	ldrb r0, [r5]
	cmp r0, 0x18
	beq _08110A18
	cmp r0, 0x18
	bgt _08110A08
	cmp r0, 0
	beq _08110A0E
	b _08110A28
	.align 2, 0
_08110A00: .4byte gUnknown_083F856E
_08110A04: .4byte gWildMonHeaders
_08110A08:
	cmp r0, 0x1A
	beq _08110A18
	b _08110A28
_08110A0E:
	ldrb r1, [r5, 0x1]
	movs r0, 0
	bl sub_8110A98
	b _08110A28
_08110A18:
	ldr r0, _08110A40
	adds r1, r4, r6
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1]
	ldrb r1, [r1, 0x1]
	bl sub_8110AE4
_08110A28:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r1, _08110A40
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _081109DA
	b _08110A8C
	.align 2, 0
_08110A40: .4byte gWildMonHeaders
_08110A44:
	ldr r4, _08110A7C
	movs r0, 0x89
	lsls r0, 1
	adds r1, r4, r0
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08110A80
	ldrb r2, [r0, 0x13]
	cmp r2, 0
	beq _08110A84
	adds r0, r4, 0
	adds r0, 0x10
	adds r1, r4, 0
	adds r1, 0x11
	bl sub_8134538
	ldrb r0, [r4, 0x10]
	ldrb r1, [r4, 0x11]
	bl get_mapheader_by_bank_and_number
	ldrb r0, [r0, 0x14]
	strh r0, [r4, 0x12]
	movs r3, 0x88
	lsls r3, 1
	adds r1, r4, r3
	movs r0, 0x1
	strh r0, [r1]
	b _08110A8C
	.align 2, 0
_08110A7C: .4byte 0x02000000
_08110A80: .4byte gSaveBlock1 + 0x3144
_08110A84:
	movs r1, 0x88
	lsls r1, 1
	adds r0, r4, r1
	strh r2, [r0]
_08110A8C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8110908

	thumb_func_start sub_8110A98
sub_8110A98: @ 8110A98
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r5, _08110AE0
	movs r0, 0x88
	lsls r0, 1
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0x3F
	bhi _08110AD8
	lsls r0, 2
	adds r0, r5
	strb r2, [r0, 0x10]
	ldrh r0, [r4]
	lsls r0, 2
	adds r0, r5
	strb r1, [r0, 0x11]
	adds r0, r2, 0
	bl get_mapheader_by_bank_and_number
	ldrb r0, [r0, 0x14]
	bl sub_80FBA04
	ldrh r1, [r4]
	lsls r1, 2
	adds r1, r5
	strh r0, [r1, 0x12]
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_08110AD8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08110AE0: .4byte 0x02000000
	thumb_func_end sub_8110A98

	thumb_func_start sub_8110AE4
sub_8110AE4: @ 8110AE4
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _08110B9C
	movs r3, 0x89
	lsls r3, 1
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, 0x1F
	bhi _08110B96
	adds r0, r2, 0
	bl get_mapheader_by_bank_and_number
	adds r6, r0, 0
	ldrb r0, [r6, 0x14]
	cmp r0, 0x57
	bhi _08110B96
	movs r4, 0
	ldr r1, _08110BA0
	ldrh r0, [r1]
	cmp r0, 0x58
	beq _08110B42
	adds r5, r1, 0
_08110B16:
	lsls r2, r4, 2
	adds r1, r2, r5
	ldrb r0, [r6, 0x14]
	ldrh r1, [r1]
	cmp r0, r1
	bne _08110B32
	adds r0, r5, 0x2
	adds r0, r2, r0
	ldrh r0, [r0]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08110B96
_08110B32:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r0, r4, 2
	adds r0, r5
	ldrh r0, [r0]
	cmp r0, 0x58
	bne _08110B16
_08110B42:
	movs r4, 0
	ldr r0, _08110B9C
	movs r1, 0x89
	lsls r1, 1
	adds r2, r0, r1
	ldrh r3, [r2]
	adds r1, r0, 0
	cmp r4, r3
	bcs _08110B76
	movs r0, 0xC4
	lsls r0, 3
	adds r5, r1, r0
	ldrh r0, [r5]
	ldrb r2, [r6, 0x14]
	cmp r0, r2
	beq _08110B76
_08110B62:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r3
	bcs _08110B76
	lsls r0, r4, 1
	adds r0, r5
	ldrh r0, [r0]
	cmp r0, r2
	bne _08110B62
_08110B76:
	movs r3, 0x89
	lsls r3, 1
	adds r2, r1, r3
	ldrh r0, [r2]
	cmp r4, r0
	bne _08110B96
	lsls r0, r4, 1
	movs r3, 0xC4
	lsls r3, 3
	adds r1, r3
	adds r0, r1
	ldrb r1, [r6, 0x14]
	strh r1, [r0]
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
_08110B96:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08110B9C: .4byte 0x02000000
_08110BA0: .4byte gUnknown_083F857A
	thumb_func_end sub_8110AE4

	thumb_func_start sub_8110BA4
sub_8110BA4: @ 8110BA4
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r1, 16
	lsrs r4, r1, 16
	adds r6, r4, 0
	ldr r0, [r5, 0x4]
	adds r1, r4, 0
	movs r2, 0xC
	bl sub_8110BFC
	lsls r0, 24
	cmp r0, 0
	bne _08110BF2
	ldr r0, [r5, 0x8]
	adds r1, r4, 0
	movs r2, 0x5
	bl sub_8110BFC
	lsls r0, 24
	cmp r0, 0
	bne _08110BF2
	ldr r0, [r5, 0x10]
	adds r1, r4, 0
	movs r2, 0xC
	bl sub_8110BFC
	lsls r0, 24
	cmp r0, 0
	bne _08110BF2
	ldr r0, [r5, 0xC]
	adds r1, r6, 0
	movs r2, 0x5
	bl sub_8110BFC
	lsls r0, 24
	cmp r0, 0
	bne _08110BF2
	movs r0, 0
	b _08110BF4
_08110BF2:
	movs r0, 0x1
_08110BF4:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8110BA4

	thumb_func_start sub_8110BFC
sub_8110BFC: @ 8110BFC
	push {r4,lr}
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 16
	lsrs r2, 16
	cmp r0, 0
	beq _08110C2A
	movs r3, 0
	cmp r3, r2
	bcs _08110C2A
	ldr r1, [r0, 0x4]
_08110C12:
	lsls r0, r3, 2
	adds r0, r1
	ldrh r0, [r0, 0x2]
	cmp r0, r4
	bne _08110C20
	movs r0, 0x1
	b _08110C2C
_08110C20:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r2
	bcc _08110C12
_08110C2A:
	movs r0, 0
_08110C2C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8110BFC

	thumb_func_start sub_8110C34
sub_8110C34: @ 8110C34
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	ldr r1, _08110E5C
	movs r0, 0
	strh r0, [r1]
	mov r9, r1
	ldr r0, _08110E60
	mov r8, r0
	ldr r1, _08110E64
	mov r12, r1
	mov r1, r9
	movs r4, 0x8B
	lsls r4, 1
	add r4, r8
	ldr r3, _08110E68
	movs r2, 0
_08110C5C:
	ldrh r0, [r1]
	lsls r0, 1
	adds r0, r4
	strh r2, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r3
	bls _08110C5C
	movs r0, 0
	mov r3, r9
	strh r0, [r3]
	movs r1, 0x88
	lsls r1, 1
	add r1, r8
	ldrh r0, [r1]
	cmp r0, 0
	beq _08110D04
	ldr r4, _08110E6C
	movs r2, 0
	ldr r5, _08110E64
	mov r0, r8
	str r0, [sp, 0x8]
	movs r1, 0x8B
	lsls r1, 1
	add r1, r8
	mov r10, r1
	ldr r6, _08110E70
	mov r7, r9
_08110C9A:
	strh r2, [r4]
	ldr r3, _08110E70
	strh r2, [r3]
_08110CA0:
	mov r0, r12
	strh r2, [r0]
_08110CA4:
	ldrh r0, [r5]
	ldrh r1, [r6]
	str r2, [sp]
	bl sub_80FB9A8
	ldrh r1, [r7]
	lsls r1, 2
	ldr r3, [sp, 0x8]
	adds r1, r3
	lsls r0, 16
	lsrs r0, 16
	ldr r2, [sp]
	ldrh r1, [r1, 0x12]
	cmp r0, r1
	bne _08110CCC
	ldrh r0, [r4]
	lsls r0, 1
	add r0, r10
	ldr r1, _08110E74
	strh r1, [r0]
_08110CCC:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1F
	bls _08110CA4
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08110E64
	mov r12, r1
	cmp r0, 0x13
	bls _08110CA0
	ldrh r0, [r7]
	adds r0, 0x1
	strh r0, [r7]
	lsls r0, 16
	lsrs r0, 16
	ldr r3, _08110E78
	ldrh r3, [r3]
	cmp r0, r3
	bcc _08110C9A
_08110D04:
	movs r0, 0
	ldr r1, _08110E6C
	strh r0, [r1]
	ldr r3, _08110E70
	strh r0, [r3]
	ldr r6, _08110E64
	mov r10, r0
	adds r3, r1, 0
	ldr r5, _08110E7C
	ldr r4, _08110E74
	ldr r7, _08110E70
_08110D1A:
	mov r0, r10
	strh r0, [r6]
_08110D1E:
	ldrh r1, [r3]
	lsls r0, r1, 1
	adds r0, r5
	ldrh r0, [r0]
	cmp r0, r4
	bne _08110E10
	ldrh r0, [r6]
	cmp r0, 0
	beq _08110D42
	subs r0, r1, 0x1
	lsls r0, 1
	adds r2, r0, r5
	ldrh r1, [r2]
	cmp r1, r4
	beq _08110D42
	movs r0, 0x2
	orrs r0, r1
	strh r0, [r2]
_08110D42:
	ldrh r0, [r6]
	cmp r0, 0x1F
	beq _08110D5C
	ldrh r0, [r3]
	adds r0, 0x1
	lsls r0, 1
	adds r2, r0, r5
	ldrh r1, [r2]
	cmp r1, r4
	beq _08110D5C
	movs r0, 0x1
	orrs r0, r1
	strh r0, [r2]
_08110D5C:
	ldrh r0, [r7]
	cmp r0, 0
	beq _08110D76
	ldrh r0, [r3]
	subs r0, 0x20
	lsls r0, 1
	adds r2, r0, r5
	ldrh r1, [r2]
	cmp r1, r4
	beq _08110D76
	movs r0, 0x8
	orrs r0, r1
	strh r0, [r2]
_08110D76:
	ldrh r0, [r7]
	cmp r0, 0x13
	beq _08110D90
	ldrh r0, [r3]
	adds r0, 0x20
	lsls r0, 1
	adds r2, r0, r5
	ldrh r1, [r2]
	cmp r1, r4
	beq _08110D90
	movs r0, 0x4
	orrs r0, r1
	strh r0, [r2]
_08110D90:
	ldrh r0, [r6]
	cmp r0, 0
	beq _08110DB0
	ldrh r0, [r7]
	cmp r0, 0
	beq _08110DB0
	ldrh r0, [r3]
	subs r0, 0x21
	lsls r0, 1
	adds r2, r0, r5
	ldrh r1, [r2]
	cmp r1, r4
	beq _08110DB0
	movs r0, 0x10
	orrs r0, r1
	strh r0, [r2]
_08110DB0:
	ldrh r0, [r6]
	cmp r0, 0x1F
	beq _08110DD0
	ldrh r0, [r7]
	cmp r0, 0
	beq _08110DD0
	ldrh r0, [r3]
	subs r0, 0x1F
	lsls r0, 1
	adds r2, r0, r5
	ldrh r1, [r2]
	cmp r1, r4
	beq _08110DD0
	movs r0, 0x40
	orrs r0, r1
	strh r0, [r2]
_08110DD0:
	ldrh r0, [r6]
	cmp r0, 0
	beq _08110DF0
	ldrh r0, [r7]
	cmp r0, 0x13
	beq _08110DF0
	ldrh r0, [r3]
	adds r0, 0x1F
	lsls r0, 1
	adds r2, r0, r5
	ldrh r1, [r2]
	cmp r1, r4
	beq _08110DF0
	movs r0, 0x20
	orrs r0, r1
	strh r0, [r2]
_08110DF0:
	ldrh r0, [r6]
	cmp r0, 0x1F
	beq _08110E10
	ldrh r0, [r7]
	cmp r0, 0x13
	beq _08110E10
	ldrh r0, [r3]
	adds r0, 0x21
	lsls r0, 1
	adds r2, r0, r5
	ldrh r1, [r2]
	cmp r1, r4
	beq _08110E10
	movs r0, 0x80
	orrs r0, r1
	strh r0, [r2]
_08110E10:
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1F
	bhi _08110E26
	b _08110D1E
_08110E26:
	ldrh r0, [r7]
	adds r0, 0x1
	strh r0, [r7]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x13
	bhi _08110E36
	b _08110D1A
_08110E36:
	movs r0, 0
	mov r1, r9
	strh r0, [r1]
_08110E3C:
	mov r3, r9
	ldrh r0, [r3]
	lsls r0, 1
	movs r4, 0x8B
	lsls r4, 1
	add r4, r8
	adds r3, r0, r4
	ldrh r2, [r3]
	adds r1, r2, 0
	ldr r0, _08110E74
	cmp r1, r0
	bne _08110E80
	movs r0, 0x10
	strh r0, [r3]
	b _0811105E
	.align 2, 0
_08110E5C: .4byte gUnknown_02039260
_08110E60: .4byte 0x02000000
_08110E64: .4byte gUnknown_02039262
_08110E68: .4byte 0x0000027f
_08110E6C: .4byte gUnknown_02039266
_08110E70: .4byte gUnknown_02039264
_08110E74: .4byte 0x0000ffff
_08110E78: .4byte 0x02000110
_08110E7C: .4byte 0x02000116
_08110E80:
	cmp r1, 0
	bne _08110E86
	b _0811105E
_08110E86:
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _08110E94
	ldr r0, _08110F28
	ands r0, r2
	strh r0, [r3]
_08110E94:
	mov r1, r9
	ldrh r0, [r1]
	lsls r0, 1
	adds r2, r0, r4
	ldrh r1, [r2]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08110EAC
	ldr r0, _08110F2C
	ands r0, r1
	strh r0, [r2]
_08110EAC:
	mov r3, r9
	ldrh r0, [r3]
	lsls r0, 1
	adds r2, r0, r4
	ldrh r1, [r2]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08110EC4
	ldr r0, _08110F30
	ands r0, r1
	strh r0, [r2]
_08110EC4:
	mov r1, r9
	ldrh r0, [r1]
	lsls r0, 1
	adds r2, r0, r4
	ldrh r1, [r2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08110EDC
	ldr r0, _08110F34
	ands r0, r1
	strh r0, [r2]
_08110EDC:
	ldr r6, _08110F38
	mov r3, r9
	ldrh r0, [r3]
	lsls r0, 1
	adds r0, r4
	ldrh r1, [r0]
	movs r5, 0xF
	adds r0, r5, 0
	ands r0, r1
	strh r0, [r6]
	ldr r2, _08110F3C
	ldrh r0, [r3]
	lsls r0, 1
	adds r0, r4
	ldrh r1, [r0]
	movs r0, 0xF0
	ands r0, r1
	strh r0, [r2]
	ldrh r1, [r3]
	adds r3, r2, 0
	cmp r0, 0
	bne _08110F0A
	b _0811105E
_08110F0A:
	lsls r0, r1, 1
	adds r0, r4
	ldrh r2, [r0]
	adds r1, r5, 0
	ands r1, r2
	strh r1, [r0]
	ldrh r0, [r6]
	cmp r0, 0xA
	bls _08110F1E
	b _0811105E
_08110F1E:
	lsls r0, 2
	ldr r1, _08110F40
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08110F28: .4byte 0x0000ffcf
_08110F2C: .4byte 0x0000ff3f
_08110F30: .4byte 0x0000ffaf
_08110F34: .4byte 0x0000ff5f
_08110F38: .4byte gUnknown_02039268
_08110F3C: .4byte gUnknown_0203926A
_08110F40: .4byte _08110F44
	.align 2, 0
_08110F44:
	.4byte _08110F70
	.4byte _08110FAC
	.4byte _08110F8E
	.4byte _0811105E
	.4byte _08111002
	.4byte _08111036
	.4byte _08111036
	.4byte _0811105E
	.4byte _08110FCE
	.4byte _0811104A
	.4byte _0811104A
_08110F70:
	ldrh r0, [r3]
	lsls r1, r0, 16
	cmp r1, 0
	beq _0811105E
	mov r0, r9
	ldrh r2, [r0]
	lsls r2, 1
	movs r0, 0x8B
	lsls r0, 1
	add r0, r8
	adds r2, r0
	ldrh r0, [r2]
	adds r0, 0x10
	lsrs r1, 20
	b _08110FC8
_08110F8E:
	ldrh r0, [r3]
	lsls r1, r0, 16
	cmp r1, 0
	beq _0811105E
	mov r3, r9
	ldrh r2, [r3]
	lsls r2, 1
	movs r0, 0x8B
	lsls r0, 1
	add r0, r8
	adds r2, r0
	ldrh r0, [r2]
	adds r0, 0x1E
	lsrs r1, 20
	b _08110FC8
_08110FAC:
	ldrh r0, [r3]
	lsls r1, r0, 16
	cmp r1, 0
	beq _0811105E
	mov r0, r9
	ldrh r2, [r0]
	lsls r2, 1
	movs r0, 0x8B
	lsls r0, 1
	add r0, r8
	adds r2, r0
	ldrh r0, [r2]
	adds r0, 0x20
	lsrs r1, 22
_08110FC8:
	adds r0, r1
	strh r0, [r2]
	b _0811105E
_08110FCE:
	ldrh r2, [r3]
	cmp r2, 0
	beq _0811105E
	movs r0, 0x80
	ands r0, r2
	lsls r0, 16
	lsrs r0, 16
	negs r0, r0
	lsrs r3, r0, 31
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	beq _08110FEC
	movs r0, 0x2
	orrs r3, r0
_08110FEC:
	mov r0, r9
	ldrh r1, [r0]
	lsls r1, 1
	movs r0, 0x8B
	lsls r0, 1
	add r0, r8
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x20
	adds r0, r3
	b _0811105C
_08111002:
	ldrh r2, [r3]
	cmp r2, 0
	beq _0811105E
	movs r0, 0x40
	ands r0, r2
	lsls r0, 16
	lsrs r0, 16
	negs r0, r0
	lsrs r3, r0, 31
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	beq _08111020
	movs r0, 0x2
	orrs r3, r0
_08111020:
	mov r0, r9
	ldrh r1, [r0]
	lsls r1, 1
	movs r0, 0x8B
	lsls r0, 1
	add r0, r8
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x21
	adds r0, r3
	b _0811105C
_08111036:
	mov r3, r9
	ldrh r1, [r3]
	lsls r1, 1
	movs r0, 0x8B
	lsls r0, 1
	add r0, r8
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x27
	b _0811105C
_0811104A:
	mov r0, r9
	ldrh r1, [r0]
	lsls r1, 1
	movs r0, 0x8B
	lsls r0, 1
	add r0, r8
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x25
_0811105C:
	strh r0, [r1]
_0811105E:
	mov r3, r9
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
	lsls r0, 16
	ldr r1, _08111080
	cmp r0, r1
	bhi _08111070
	b _08110E3C
_08111070:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08111080: .4byte 0x027f0000
	thumb_func_end sub_8110C34

	thumb_func_start sub_8111084
sub_8111084: @ 8111084
	push {lr}
	ldr r0, _081110AC
	movs r2, 0x89
	lsls r2, 1
	adds r1, r0, r2
	ldrh r1, [r1]
	adds r2, r0, 0
	cmp r1, 0
	beq _081110B4
	movs r3, 0x88
	lsls r3, 1
	adds r0, r2, r3
	ldrh r0, [r0]
	cmp r0, 0
	bne _081110B4
	ldr r0, _081110B0
	adds r1, r2, r0
	movs r0, 0x1
	b _081110BA
	.align 2, 0
_081110AC: .4byte 0x02000000
_081110B0: .4byte 0x0000061e
_081110B4:
	ldr r3, _081110FC
	adds r1, r2, r3
	movs r0, 0
_081110BA:
	strb r0, [r1]
	ldr r1, _08111100
	adds r0, r2, r1
	movs r1, 0
	strh r1, [r0]
	movs r3, 0xC3
	lsls r3, 3
	adds r0, r2, r3
	strh r1, [r0]
	adds r3, 0x2
	adds r0, r2, r3
	strh r1, [r0]
	ldr r0, _08111104
	adds r1, r2, r0
	movs r0, 0x40
	strh r0, [r1]
	adds r3, 0x5
	adds r1, r2, r3
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _08111108
	ldr r2, _0811110C
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r3, 0x80
	lsls r3, 5
	adds r0, r3, 0
	strh r0, [r1]
	bl sub_8111110
	pop {r0}
	bx r0
	.align 2, 0
_081110FC: .4byte 0x0000061e
_08111100: .4byte 0x00000616
_08111104: .4byte 0x0000061c
_08111108: .4byte REG_BLDCNT
_0811110C: .4byte 0x00003f41
	thumb_func_end sub_8111084

	thumb_func_start sub_8111110
sub_8111110: @ 8111110
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _0811114C
	ldr r2, _08111150
	adds r1, r0, r2
	ldrb r1, [r1]
	adds r5, r0, 0
	cmp r1, 0
	bne _081111DE
	ldr r3, _08111154
	adds r1, r5, r3
	ldrh r0, [r1]
	cmp r0, 0
	bne _081111D8
	movs r1, 0xC3
	lsls r1, 3
	adds r0, r5, r1
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08111158
	subs r2, 0x4
	adds r0, r5, r2
	b _0811115C
	.align 2, 0
_0811114C: .4byte 0x02000000
_08111150: .4byte 0x0000061e
_08111154: .4byte 0x00000616
_08111158:
	ldr r3, _081111C0
	adds r0, r5, r3
_0811115C:
	ldrh r1, [r0]
	adds r1, 0x4
	movs r2, 0x7F
	ands r1, r2
	strh r1, [r0]
	ldr r2, _081111C4
	ldr r1, _081111C8
	adds r0, r5, r1
	ldrh r0, [r0]
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	lsls r1, 16
	asrs r1, 20
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _081111C0
	adds r0, r5, r3
	ldrh r0, [r0]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 20
	lsls r0, 16
	ldr r2, _081111CC
	lsrs r0, 8
	orrs r1, r0
	strh r1, [r2]
	ldr r1, _081111D0
	adds r0, r5, r1
	movs r2, 0
	strh r2, [r0]
	subs r3, 0x4
	adds r1, r5, r3
	ldrh r0, [r1]
	cmp r0, 0x40
	bne _0811126E
	strh r2, [r1]
	movs r1, 0x89
	lsls r1, 1
	adds r0, r5, r1
	ldrh r0, [r0]
	cmp r0, 0
	beq _0811126E
	ldr r2, _081111D4
	adds r1, r5, r2
	movs r0, 0x1
	b _0811126C
	.align 2, 0
_081111C0: .4byte 0x0000061c
_081111C4: .4byte gSineTable
_081111C8: .4byte 0x0000061a
_081111CC: .4byte REG_BLDALPHA
_081111D0: .4byte 0x00000616
_081111D4: .4byte 0x0000061e
_081111D8:
	subs r0, 0x1
	strh r0, [r1]
	b _0811126E
_081111DE:
	ldr r3, _0811127C
	adds r1, r5, r3
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xC
	bls _0811126E
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08111280
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r4, 0
	movs r2, 0x89
	lsls r2, 1
	adds r0, r5, r2
	ldrh r3, [r0]
	cmp r4, r3
	bcs _0811124C
	movs r2, 0xCC
	lsls r2, 3
	adds r2, r5
	mov r9, r2
	mov r8, r1
	movs r3, 0x1
	mov r12, r3
	adds r6, r0, 0
	movs r7, 0x5
	negs r7, r7
_08111220:
	lsls r0, r4, 2
	add r0, r9
	ldr r3, [r0]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x1
	adds r3, 0x3E
	ands r1, r0
	mov r2, r12
	ands r1, r2
	lsls r1, 2
	ldrb r2, [r3]
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrh r3, [r6]
	cmp r4, r3
	bcc _08111220
_0811124C:
	ldr r0, _08111280
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, 0x4
	bls _0811126E
	movs r0, 0x1
	strb r0, [r1]
	movs r1, 0x88
	lsls r1, 1
	adds r0, r5, r1
	ldrh r0, [r0]
	cmp r0, 0
	beq _0811126E
	ldr r2, _08111284
	adds r1, r5, r2
	movs r0, 0
_0811126C:
	strb r0, [r1]
_0811126E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811127C: .4byte 0x00000616
_08111280: .4byte 0x0000061f
_08111284: .4byte 0x0000061e
	thumb_func_end sub_8111110

	thumb_func_start sub_8111288
sub_8111288: @ 8111288
	push {lr}
	ldr r1, _08111298
	ldrh r0, [r1, 0xC]
	cmp r0, 0
	beq _0811129C
	cmp r0, 0x1
	beq _081112A2
	b _081112B2
	.align 2, 0
_08111298: .4byte 0x02000000
_0811129C:
	movs r0, 0x1
	strh r0, [r1, 0xC]
	b _081112B2
_081112A2:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _081112B2
	ldr r0, _081112B8
	bl sub_8110814
_081112B2:
	pop {r0}
	bx r0
	.align 2, 0
_081112B8: .4byte sub_81112BC
	thumb_func_end sub_8111288

	thumb_func_start sub_81112BC
sub_81112BC: @ 81112BC
	push {lr}
	ldr r0, _081112DC
	ldrh r0, [r0, 0xC]
	cmp r0, 0
	bne _08111308
	ldr r0, _081112E0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081112E8
	ldr r0, _081112E4
	bl sub_8110814
	b _08111308
	.align 2, 0
_081112DC: .4byte 0x02000000
_081112E0: .4byte gMain
_081112E4: .4byte sub_8111314
_081112E8:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _08111302
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _08111308
	ldr r0, _0811130C
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _08111308
_08111302:
	ldr r0, _08111310
	bl sub_8110814
_08111308:
	pop {r0}
	bx r0
	.align 2, 0
_0811130C: .4byte gSaveBlock2
_08111310: .4byte sub_8111360
	thumb_func_end sub_81112BC

	thumb_func_start sub_8111314
sub_8111314: @ 8111314
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _08111328
	ldrh r1, [r4, 0xC]
	cmp r1, 0
	beq _0811132C
	cmp r1, 0x1
	beq _08111344
	b _08111358
	.align 2, 0
_08111328: .4byte 0x02000000
_0811132C:
	movs r0, 0x15
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	b _08111358
_08111344:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _08111358
	bl sub_80FAB10
	ldr r0, [r4, 0x4]
	bl SetMainCallback2
_08111358:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8111314

	thumb_func_start sub_8111360
sub_8111360: @ 8111360
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _08111374
	ldrh r1, [r4, 0xC]
	cmp r1, 0
	beq _08111378
	cmp r1, 0x1
	beq _08111390
	b _081113A4
	.align 2, 0
_08111374: .4byte 0x02000000
_08111378:
	movs r0, 0x15
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	b _081113A4
_08111390:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _081113A4
	bl sub_80FAB10
	ldr r0, [r4, 0x8]
	bl SetMainCallback2
_081113A4:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8111360

	thumb_func_start sub_81113AC
sub_81113AC: @ 81113AC
	push {r4,lr}
	ldr r2, _081113DC
	movs r3, 0
	movs r4, 0
	strh r0, [r2, 0xE]
	ldr r0, _081113E0
	adds r2, r0
	str r1, [r2]
	strb r3, [r1]
	ldr r0, _081113E4
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081113E8
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081113DC: .4byte 0x02000000
_081113E0: .4byte 0x000006e4
_081113E4: .4byte sub_81113EC
_081113E8: .4byte gTasks
	thumb_func_end sub_81113AC

	thumb_func_start sub_81113EC
sub_81113EC: @ 81113EC
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08111414
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0xB
	bls _0811140A
	b _08111540
_0811140A:
	lsls r0, 2
	ldr r1, _08111418
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08111414: .4byte gTasks
_08111418: .4byte _0811141C
	.align 2, 0
_0811141C:
	.4byte _0811144C
	.4byte _08111488
	.4byte _08111496
	.4byte _081114B8
	.4byte _081114BE
	.4byte _081114CA
	.4byte _081114DE
	.4byte _081114E4
	.4byte _081114EA
	.4byte _081114F0
	.4byte _08111502
	.4byte _08111528
_0811144C:
	movs r1, 0x80
	lsls r1, 19
	movs r3, 0xC4
	lsls r3, 7
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _08111478
	movs r1, 0
	strh r1, [r0]
	ldr r2, _0811147C
	ldr r3, _08111480
	adds r0, r3, 0
	strh r0, [r2]
	ldr r0, _08111484
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	b _08111540
	.align 2, 0
_08111478: .4byte REG_BG0HOFS
_0811147C: .4byte REG_BG0VOFS
_08111480: .4byte 0x0000fff8
_08111484: .4byte REG_BG2VOFS
_08111488:
	bl ResetPaletteFade
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	b _08111540
_08111496:
	ldr r4, _081114B4
	adds r0, r4, 0
	movs r1, 0
	bl sub_80FA8EC
	movs r0, 0x88
	lsls r0, 4
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x10
	bl StringFill
	b _08111540
	.align 2, 0
_081114B4: .4byte 0x020006e8
_081114B8:
	bl sub_8110824
	b _08111540
_081114BE:
	bl sub_8110838
	lsls r0, 24
	cmp r0, 0
	bne _08111550
	b _08111540
_081114CA:
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80FBCF0
	movs r1, 0x8
	negs r1, r1
	movs r0, 0
	bl sub_80FB2A4
	b _08111540
_081114DE:
	bl sub_8111658
	b _08111540
_081114E4:
	bl sub_81117AC
	b _08111540
_081114EA:
	bl sub_81117E4
	b _08111540
_081114F0:
	movs r0, 0x15
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _08111540
_08111502:
	ldr r1, _0811151C
	ldr r2, _08111520
	adds r0, r2, 0
	strh r0, [r1]
	bl sub_8111084
	movs r1, 0x80
	lsls r1, 19
	ldr r3, _08111524
	adds r0, r3, 0
	strh r0, [r1]
	b _08111540
	.align 2, 0
_0811151C: .4byte REG_BLDCNT
_08111520: .4byte 0x00003f41
_08111524: .4byte 0x00007741
_08111528:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r2
	ldr r1, _0811153C
	str r1, [r0]
	movs r1, 0
	strh r1, [r0, 0x8]
	b _08111550
	.align 2, 0
_0811153C: .4byte sub_811155C
_08111540:
	ldr r0, _08111558
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_08111550:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08111558: .4byte gTasks
	thumb_func_end sub_81113EC

	thumb_func_start sub_811155C
sub_811155C: @ 811155C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8111110
	ldr r1, _08111584
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	cmp r1, 0x1
	beq _081115B4
	cmp r1, 0x1
	bgt _08111588
	cmp r1, 0
	beq _0811159E
	b _08111590
	.align 2, 0
_08111584: .4byte gTasks
_08111588:
	cmp r1, 0x2
	beq _081115F8
	cmp r1, 0x3
	beq _0811160A
_08111590:
	ldr r0, _081115AC
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x8]
_0811159E:
	ldr r0, _081115B0
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811164C
	b _0811163C
	.align 2, 0
_081115AC: .4byte gTasks
_081115B0: .4byte gPaletteFade
_081115B4:
	ldr r0, _081115CC
	ldrh r2, [r0, 0x2E]
	movs r3, 0x2
	adds r0, r3, 0
	ands r0, r2
	cmp r0, 0
	beq _081115D0
	strh r1, [r5, 0xA]
	movs r0, 0x3
	bl PlaySE
	b _0811163C
	.align 2, 0
_081115CC: .4byte gMain
_081115D0:
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	bne _081115EA
	movs r0, 0x80
	lsls r0, 1
	ands r0, r2
	cmp r0, 0
	beq _0811164C
	ldr r0, _081115F4
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _0811164C
_081115EA:
	strh r3, [r5, 0xA]
	movs r0, 0x6D
	bl PlaySE
	b _0811163C
	.align 2, 0
_081115F4: .4byte gSaveBlock2
_081115F8:
	movs r0, 0x15
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _0811163C
_0811160A:
	ldr r0, _08111630
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811164C
	bl sub_8111738
	ldr r0, _08111634
	ldr r1, _08111638
	adds r0, r1
	ldr r1, [r0]
	ldrh r0, [r5, 0xA]
	strb r0, [r1]
	adds r0, r4, 0
	bl DestroyTask
	b _0811164C
	.align 2, 0
_08111630: .4byte gPaletteFade
_08111634: .4byte 0x02000000
_08111638: .4byte 0x000006e4
_0811163C:
	ldr r0, _08111654
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_0811164C:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08111654: .4byte gTasks
	thumb_func_end sub_811155C

	thumb_func_start sub_8111658
sub_8111658: @ 8111658
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _08111720
	bl LoadSpriteSheet
	ldr r0, _08111724
	bl LoadSpritePalette
	movs r5, 0
	movs r1, 0
	ldr r0, _08111728
	movs r3, 0x89
	lsls r3, 1
	adds r2, r0, r3
	ldrh r7, [r2]
	cmp r5, r7
	bge _0811170C
	adds r6, r0, 0
	mov r8, r2
_08111680:
	lsls r0, r1, 16
	asrs r4, r0, 16
	lsls r1, r4, 1
	movs r2, 0xC4
	lsls r2, 3
	adds r0, r6, r2
	adds r1, r0
	ldr r2, _0811172C
	movs r3, 0
	ldrsh r0, [r1, r3]
	lsls r0, 3
	adds r0, r2
	ldrb r1, [r0]
	adds r1, 0x1
	lsls r1, 3
	adds r1, 0x4
	ldrb r2, [r0, 0x1]
	lsls r2, 19
	ldrb r3, [r0, 0x2]
	subs r3, 0x1
	lsls r3, 2
	ldrb r0, [r0, 0x3]
	subs r0, 0x1
	lsls r0, 2
	movs r7, 0xE0
	lsls r7, 13
	adds r2, r7
	asrs r2, 16
	adds r1, r3
	adds r2, r0
	ldr r0, _08111730
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _081116FC
	ldr r0, _08111734
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	adds r1, r5, 0
	lsls r0, r1, 16
	movs r3, 0x80
	lsls r3, 9
	adds r0, r3
	lsrs r5, r0, 16
	lsls r1, 16
	asrs r1, 14
	movs r7, 0xCC
	lsls r7, 3
	adds r0, r6, r7
	adds r1, r0
	str r2, [r1]
_081116FC:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	asrs r0, 16
	mov r2, r8
	ldrh r2, [r2]
	cmp r0, r2
	blt _08111680
_0811170C:
	ldr r0, _08111728
	movs r3, 0xDC
	lsls r3, 3
	adds r0, r3
	strh r5, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08111720: .4byte gUnknown_083F858C
_08111724: .4byte gUnknown_083F8594
_08111728: .4byte 0x02000000
_0811172C: .4byte gRegionMapLocations
_08111730: .4byte gSpriteTemplate_83F85A4
_08111734: .4byte gSprites
	thumb_func_end sub_8111658

	thumb_func_start sub_8111738
sub_8111738: @ 8111738
	push {r4-r6,lr}
	movs r0, 0x2
	bl FreeSpriteTilesByTag
	movs r0, 0x2
	bl FreeSpritePaletteByTag
	movs r4, 0
	ldr r1, _081117A4
	movs r2, 0xDC
	lsls r2, 3
	adds r0, r1, r2
	ldrh r2, [r0]
	cmp r4, r2
	bcs _08111776
	adds r6, r1, 0
	adds r5, r0, 0
_0811175A:
	lsls r0, r4, 2
	movs r2, 0xCC
	lsls r2, 3
	adds r1, r6, r2
	adds r0, r1
	ldr r0, [r0]
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrh r0, [r5]
	cmp r4, r0
	bcc _0811175A
_08111776:
	movs r0, 0x3
	bl FreeSpriteTilesByTag
	movs r0, 0x3
	bl FreeSpritePaletteByTag
	movs r4, 0
	ldr r5, _081117A8
_08111786:
	lsls r0, r4, 2
	adds r0, r5
	ldr r0, [r0]
	cmp r0, 0
	beq _08111794
	bl DestroySprite
_08111794:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x2
	bls _08111786
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081117A4: .4byte 0x02000000
_081117A8: .4byte 0x02000fa8
	thumb_func_end sub_8111738

	thumb_func_start sub_81117AC
sub_81117AC: @ 81117AC
	push {lr}
	sub sp, 0x8
	ldr r0, _081117D4
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r0, _081117D8
	ldr r1, _081117DC
	bl LZ77UnCompWram
	mov r0, sp
	bl LoadSpriteSheet
	ldr r0, _081117E0
	bl LoadSpritePalette
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_081117D4: .4byte gUnknown_083F8664
_081117D8: .4byte gAreaUnknownTiles
_081117DC: .4byte 0x02000fb4
_081117E0: .4byte gUnknown_083F865C
	thumb_func_end sub_81117AC

	thumb_func_start sub_81117E4
sub_81117E4: @ 81117E4
	push {r4-r7,lr}
	ldr r1, _08111810
	movs r2, 0x88
	lsls r2, 1
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, 0
	beq _08111818
	movs r4, 0
	ldr r7, _08111814
	adds r2, r1, r7
	movs r1, 0
_081117FC:
	lsls r0, r4, 2
	adds r0, r2
	str r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x2
	bls _081117FC
	b _0811188E
	.align 2, 0
_08111810: .4byte 0x02000000
_08111814: .4byte 0x00000fa8
_08111818:
	movs r4, 0
	ldr r6, _08111868
	ldr r0, _0811186C
	adds r5, r1, r0
_08111820:
	lsls r1, r4, 21
	movs r2, 0xA0
	lsls r2, 16
	adds r1, r2
	asrs r1, 16
	ldr r0, _08111870
	movs r2, 0x8C
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0811187C
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r6
	ldrh r3, [r2, 0x4]
	lsls r0, r3, 22
	lsrs r0, 22
	lsls r1, r4, 4
	adds r0, r1
	ldr r7, _08111874
	adds r1, r7, 0
	ands r0, r1
	ldr r7, _08111878
	adds r1, r7, 0
	ands r3, r1
	orrs r3, r0
	strh r3, [r2, 0x4]
	lsls r0, r4, 2
	adds r0, r5
	str r2, [r0]
	b _08111884
	.align 2, 0
_08111868: .4byte gSprites
_0811186C: .4byte 0x00000fa8
_08111870: .4byte gSpriteTemplate_83F8674
_08111874: .4byte 0x000003ff
_08111878: .4byte 0xfffffc00
_0811187C:
	lsls r0, r4, 2
	adds r0, r5
	movs r1, 0
	str r1, [r0]
_08111884:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x2
	bls _08111820
_0811188E:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81117E4

	thumb_func_start sub_8111894
sub_8111894: @ 8111894
	push {lr}
	bl UpdatePaletteFade
	bl RunTasks
	pop {r0}
	bx r0
	thumb_func_end sub_8111894

	thumb_func_start sub_81118A4
sub_81118A4: @ 81118A4
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	movs r7, 0
	ldr r1, _081118C8
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _081118CC
	cmp r0, 0x1
	beq _081118E4
	b _08111918
	.align 2, 0
_081118C8: .4byte gTasks
_081118CC:
	movs r0, 0x1
	negs r0, r0
	str r7, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08111918
_081118E4:
	ldr r0, _08111920
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08111918
	movs r0, 0xA
	ldrsh r7, [r4, r0]
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	lsls r0, 16
	orrs r7, r0
	ldrh r5, [r4, 0x10]
	ldrb r6, [r4, 0x12]
	ldrh r4, [r4, 0x20]
	lsls r4, 24
	lsrs r4, 24
	adds r0, r2, 0
	bl DestroyTask
	adds r0, r7, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r4, 0
	bl evolution_cutscene
_08111918:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08111920: .4byte gPaletteFade
	thumb_func_end sub_81118A4

	thumb_func_start sub_8111924
sub_8111924: @ 8111924
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r4, r1, 0
	adds r5, r2, 0
	adds r6, r3, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _08111978
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811197C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	mov r0, r8
	strh r0, [r1, 0xA]
	mov r0, r8
	lsrs r0, 16
	strh r0, [r1, 0xC]
	strh r4, [r1, 0x10]
	strh r5, [r1, 0x12]
	strh r6, [r1, 0x20]
	ldr r0, _08111980
	bl SetMainCallback2
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08111978: .4byte sub_81118A4
_0811197C: .4byte gTasks
_08111980: .4byte sub_8111894
	thumb_func_end sub_8111924

	thumb_func_start evolution_cutscene
evolution_cutscene: @ 8111984
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x38
	str r0, [sp, 0x20]
	mov r10, r1
	mov r0, r10
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x24]
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x28]
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0
	bl SetVBlankCallback
	movs r5, 0
	str r5, [sp, 0x1C]
	add r0, sp, 0x1C
	movs r1, 0xC0
	lsls r1, 19
	ldr r2, _08111C10
	bl CpuSet
	ldr r0, _08111C14
	strh r5, [r0]
	subs r0, 0xC
	strh r5, [r0]
	adds r0, 0x4
	strh r5, [r0]
	subs r0, 0x2
	strh r5, [r0]
	adds r0, 0x4
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	ldr r4, _08111C18
	adds r0, r4, 0
	bl SetUpWindowConfig
	bl ResetPaletteFade
	ldr r0, _08111C1C
	strh r5, [r0]
	ldr r0, _08111C20
	strh r5, [r0]
	ldr r0, _08111C24
	strh r5, [r0]
	ldr r0, _08111C28
	strh r5, [r0]
	ldr r0, _08111C2C
	strh r5, [r0]
	ldr r0, _08111C30
	strh r5, [r0]
	ldr r1, _08111C34
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08111C38
	strh r5, [r0]
	ldr r0, _08111C3C
	adds r1, r4, 0
	bl InitWindowFromConfig
	ldr r1, _08111C40
	movs r0, 0x9
	strb r0, [r1]
	bl sub_800D6D4
	bl sub_800DAB8
	bl ResetSpriteData
	bl remove_some_task
	bl ResetTasks
	bl FreeAllSpritePalettes
	ldr r0, _08111C44
	movs r3, 0x4
	strb r3, [r0]
	ldr r0, [sp, 0x20]
	movs r1, 0x2
	add r2, sp, 0x8
	bl GetMonData
	ldr r0, _08111C48
	add r1, sp, 0x8
	bl StringCopy10
	ldr r0, _08111C4C
	movs r1, 0xB
	mov r4, r10
	muls r4, r1
	adds r1, r4, 0
	ldr r2, _08111C50
	adds r1, r2
	bl StringCopy
	ldr r0, [sp, 0x20]
	movs r1, 0xB
	bl GetMonData
	adds r6, r0, 0
	lsls r6, 16
	lsrs r6, 16
	ldr r0, [sp, 0x20]
	movs r1, 0x1
	bl GetMonData
	str r0, [sp, 0x2C]
	ldr r0, [sp, 0x20]
	movs r1, 0
	bl GetMonData
	str r0, [sp, 0x30]
	lsls r0, r6, 3
	ldr r1, _08111C54
	adds r0, r1
	lsls r2, r6, 2
	ldr r3, _08111C58
	adds r2, r3
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	ldr r4, _08111C5C
	ldr r3, [r4, 0x4]
	str r3, [sp]
	str r6, [sp, 0x4]
	movs r3, 0x80
	lsls r3, 18
	bl DecompressPicFromTable_2
	adds r0, r6, 0
	ldr r1, [sp, 0x2C]
	ldr r2, [sp, 0x30]
	bl sub_80409C8
	ldr r0, [r0]
	movs r1, 0x88
	lsls r1, 1
	movs r2, 0x20
	bl LoadCompressedPalette
	adds r0, r6, 0
	movs r1, 0x1
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _08111C60
	mov r9, r0
	ldr r1, _08111C64
	str r1, [r0, 0x10]
	movs r1, 0x78
	movs r2, 0x40
	movs r3, 0x1E
	bl CreateSprite
	lsls r1, r0, 24
	lsrs r2, r1, 24
	ldr r3, _08111C68
	strb r0, [r3]
	ldr r7, _08111C6C
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	movs r4, 0x1C
	adds r4, r7
	mov r8, r4
	adds r0, r1, r4
	ldr r2, _08111C70
	str r2, [r0]
	adds r1, r7
	ldrb r2, [r1, 0x5]
	movs r4, 0xF
	adds r0, r4, 0
	ands r0, r2
	movs r2, 0x10
	orrs r0, r2
	strb r0, [r1, 0x5]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r1]
	mov r1, r10
	lsls r0, r1, 3
	ldr r2, _08111C54
	adds r0, r2
	lsls r2, r1, 2
	ldr r3, _08111C58
	adds r2, r3
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	str r2, [sp, 0x34]
	ldr r2, _08111C5C
	ldr r2, [r2, 0xC]
	str r2, [sp]
	mov r3, r10
	str r3, [sp, 0x4]
	ldr r2, [sp, 0x34]
	movs r3, 0x80
	lsls r3, 18
	bl DecompressPicFromTable_2
	mov r0, r10
	ldr r1, [sp, 0x2C]
	ldr r2, [sp, 0x30]
	bl sub_80409C8
	ldr r0, [r0]
	movs r1, 0x90
	lsls r1, 1
	movs r2, 0x20
	bl LoadCompressedPalette
	mov r0, r10
	movs r1, 0x3
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _08111C64
	mov r1, r9
	str r0, [r1, 0x10]
	mov r0, r9
	movs r1, 0x78
	movs r2, 0x40
	movs r3, 0x1E
	bl CreateSprite
	lsls r1, r0, 24
	lsrs r2, r1, 24
	ldr r3, _08111C68
	strb r0, [r3, 0x1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r8, r1
	ldr r0, _08111C70
	mov r2, r8
	str r0, [r2]
	adds r1, r7
	ldrb r0, [r1, 0x5]
	ands r4, r0
	movs r0, 0x20
	orrs r4, r0
	strb r4, [r1, 0x5]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r1]
	bl sub_8149954
	ldr r0, _08111C74
	movs r1, 0
	bl CreateTask
	lsls r1, r0, 24
	lsrs r2, r1, 24
	ldr r4, _08111C68
	strb r0, [r4, 0x2]
	ldr r1, _08111C78
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x8]
	strh r6, [r0, 0xE]
	mov r1, r10
	strh r1, [r0, 0x10]
	mov r2, sp
	ldrh r2, [r2, 0x20]
	strh r2, [r0, 0xA]
	ldr r3, [sp, 0x20]
	lsrs r1, r3, 16
	strh r1, [r0, 0xC]
	mov r4, sp
	ldrh r4, [r4, 0x24]
	strh r4, [r0, 0x12]
	movs r1, 0x1
	strh r1, [r0, 0x14]
	strh r5, [r0, 0x1E]
	mov r1, sp
	ldrh r1, [r1, 0x28]
	strh r1, [r0, 0x20]
	ldr r0, _08111C7C
	ldr r1, _08111C80
	movs r2, 0x60
	bl memcpy
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08111C84
	bl SetHBlankCallback
	ldr r0, _08111C88
	bl SetVBlankCallback
	bl m4aMPlayAllStop
	ldr r0, _08111C8C
	bl SetMainCallback2
	add sp, 0x38
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08111C10: .4byte 0x05006000
_08111C14: .4byte REG_MOSAIC
_08111C18: .4byte gWindowConfig_81E6C58
_08111C1C: .4byte gUnknown_030042A4
_08111C20: .4byte gUnknown_030042A0
_08111C24: .4byte gUnknown_030042C0
_08111C28: .4byte gUnknown_030041B4
_08111C2C: .4byte gUnknown_03004288
_08111C30: .4byte gUnknown_03004280
_08111C34: .4byte gUnknown_030041B0
_08111C38: .4byte gUnknown_030041B8
_08111C3C: .4byte gUnknown_03004210
_08111C40: .4byte gUnknown_0300428C
_08111C44: .4byte gReservedSpritePaletteCount
_08111C48: .4byte gStringVar1
_08111C4C: .4byte gStringVar2
_08111C50: .4byte gSpeciesNames
_08111C54: .4byte gMonFrontPicTable
_08111C58: .4byte gMonFrontPicCoords
_08111C5C: .4byte gUnknown_081FAF4C
_08111C60: .4byte gUnknown_02024E8C
_08111C64: .4byte gDummySpriteAffineAnimTable
_08111C68: .4byte 0x02014800
_08111C6C: .4byte gSprites
_08111C70: .4byte nullsub_37
_08111C74: .4byte sub_811240C
_08111C78: .4byte gTasks
_08111C7C: .4byte 0x02009000
_08111C80: .4byte gPlttBufferUnfaded + 0x40
_08111C84: .4byte nullsub_73
_08111C88: .4byte sub_8114FD4
_08111C8C: .4byte sub_8112270
	thumb_func_end evolution_cutscene

	thumb_func_start sub_8111C90
sub_8111C90: @ 8111C90
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0xC
	ldr r2, _08111E14
	ldr r0, _08111E18
	mov r9, r0
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0x20
	ldrsh r2, [r0, r1]
	movs r1, 0x64
	adds r4, r2, 0
	muls r4, r1
	ldr r1, _08111E1C
	adds r4, r1
	ldrh r6, [r0, 0x10]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	mov r10, r0
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	mov r8, r0
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0
	bl SetVBlankCallback
	movs r5, 0
	str r5, [sp, 0x8]
	movs r1, 0xC0
	lsls r1, 19
	ldr r2, _08111E20
	add r0, sp, 0x8
	bl CpuSet
	ldr r0, _08111E24
	strh r5, [r0]
	subs r0, 0xC
	strh r5, [r0]
	adds r0, 0x4
	strh r5, [r0]
	subs r0, 0x2
	strh r5, [r0]
	adds r0, 0x4
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	ldr r4, _08111E28
	adds r0, r4, 0
	bl SetUpWindowConfig
	bl ResetPaletteFade
	ldr r0, _08111E2C
	strh r5, [r0]
	ldr r0, _08111E30
	strh r5, [r0]
	ldr r0, _08111E34
	strh r5, [r0]
	ldr r0, _08111E38
	strh r5, [r0]
	ldr r0, _08111E3C
	strh r5, [r0]
	ldr r0, _08111E40
	strh r5, [r0]
	ldr r1, _08111E44
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08111E48
	strh r5, [r0]
	ldr r0, _08111E4C
	adds r1, r4, 0
	bl InitWindowFromConfig
	ldr r1, _08111E50
	movs r0, 0x9
	strb r0, [r1]
	bl sub_800D6D4
	bl sub_800DAB8
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _08111E54
	movs r0, 0x4
	strb r0, [r1]
	lsls r0, r6, 3
	ldr r1, _08111E58
	adds r0, r1
	ldr r1, _08111E5C
	lsls r2, r6, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08111E60
	ldr r4, [r4, 0xC]
	str r4, [sp]
	str r6, [sp, 0x4]
	bl DecompressPicFromTable_2
	adds r0, r6, 0
	mov r1, r10
	mov r2, r8
	bl sub_80409C8
	ldr r0, [r0]
	movs r1, 0x90
	lsls r1, 1
	movs r2, 0x20
	bl LoadCompressedPalette
	adds r0, r6, 0
	movs r1, 0x3
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _08111E64
	ldr r1, _08111E68
	str r1, [r0, 0x10]
	movs r1, 0x78
	movs r2, 0x40
	movs r3, 0x1E
	bl CreateSprite
	lsls r2, r0, 24
	lsrs r2, 24
	mov r1, r9
	strb r0, [r1, 0x1]
	ldr r3, _08111E6C
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r1, r0
	ldr r2, _08111E70
	str r2, [r0]
	adds r1, r3
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	movs r2, 0x20
	orrs r0, r2
	strb r0, [r1, 0x5]
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08111E74
	bl SetHBlankCallback
	ldr r0, _08111E78
	bl SetVBlankCallback
	ldr r0, _08111E7C
	bl SetMainCallback2
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08111E14: .4byte gTasks
_08111E18: .4byte 0x02014800
_08111E1C: .4byte gPlayerParty
_08111E20: .4byte 0x05006000
_08111E24: .4byte REG_MOSAIC
_08111E28: .4byte gWindowConfig_81E6C58
_08111E2C: .4byte gUnknown_030042A4
_08111E30: .4byte gUnknown_030042A0
_08111E34: .4byte gUnknown_030042C0
_08111E38: .4byte gUnknown_030041B4
_08111E3C: .4byte gUnknown_03004288
_08111E40: .4byte gUnknown_03004280
_08111E44: .4byte gUnknown_030041B0
_08111E48: .4byte gUnknown_030041B8
_08111E4C: .4byte gUnknown_03004210
_08111E50: .4byte gUnknown_0300428C
_08111E54: .4byte gReservedSpritePaletteCount
_08111E58: .4byte gMonFrontPicTable
_08111E5C: .4byte gMonFrontPicCoords
_08111E60: .4byte gUnknown_081FAF4C
_08111E64: .4byte gUnknown_02024E8C
_08111E68: .4byte gDummySpriteAffineAnimTable
_08111E6C: .4byte gSprites
_08111E70: .4byte nullsub_37
_08111E74: .4byte nullsub_73
_08111E78: .4byte sub_8114FD4
_08111E7C: .4byte sub_8112270
	thumb_func_end sub_8111C90

	thumb_func_start sub_8111E80
sub_8111E80: @ 8111E80
	push {r4-r7,lr}
	sub sp, 0x8
	ldr r2, _08111EB8
	ldr r0, _08111EBC
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0x20
	ldrsh r2, [r0, r1]
	movs r1, 0x64
	muls r2, r1
	ldr r1, _08111EC0
	adds r4, r2, r1
	ldrh r7, [r0, 0x10]
	ldr r0, _08111EC4
	ldr r2, _08111EC8
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x6
	bls _08111EAE
	b _081120D6
_08111EAE:
	lsls r0, 2
	ldr r1, _08111ECC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08111EB8: .4byte gTasks
_08111EBC: .4byte 0x02014800
_08111EC0: .4byte gPlayerParty
_08111EC4: .4byte gMain
_08111EC8: .4byte 0x0000043c
_08111ECC: .4byte _08111ED0
	.align 2, 0
_08111ED0:
	.4byte _08111EEC
	.4byte _08111F68
	.4byte _08111F88
	.4byte _08111FDC
	.4byte _08111FE2
	.4byte _08112048
	.4byte _081120B4
_08111EEC:
	movs r0, 0x80
	lsls r0, 19
	movs r4, 0
	strh r4, [r0]
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0
	bl SetVBlankCallback
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _08111F3C
	movs r0, 0x4
	strb r0, [r1]
	ldr r0, _08111F40
	strh r4, [r0]
	ldr r0, _08111F44
	strh r4, [r0]
	ldr r0, _08111F48
	strh r4, [r0]
	ldr r0, _08111F4C
	strh r4, [r0]
	ldr r0, _08111F50
	strh r4, [r0]
	ldr r0, _08111F54
	strh r4, [r0]
	ldr r1, _08111F58
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08111F5C
	strh r4, [r0]
	ldr r1, _08111F60
	ldr r0, _08111F64
	adds r1, r0
	b _0811208E
	.align 2, 0
_08111F3C: .4byte gReservedSpritePaletteCount
_08111F40: .4byte gUnknown_030042A4
_08111F44: .4byte gUnknown_030042A0
_08111F48: .4byte gUnknown_030042C0
_08111F4C: .4byte gUnknown_030041B4
_08111F50: .4byte gUnknown_03004288
_08111F54: .4byte gUnknown_03004280
_08111F58: .4byte gUnknown_030041B0
_08111F5C: .4byte gUnknown_030041B8
_08111F60: .4byte gMain
_08111F64: .4byte 0x0000043c
_08111F68:
	ldr r4, _08111F80
	adds r0, r4, 0
	bl SetUpWindowConfig
	ldr r0, _08111F84
	ldr r0, [r0]
	adds r0, 0x4
	adds r1, r4, 0
	bl InitWindowFromConfig
	b _08112088
	.align 2, 0
_08111F80: .4byte gWindowConfig_81E6F84
_08111F84: .4byte gUnknown_03004828
_08111F88:
	ldr r4, _08111FC8
	ldr r0, [r4]
	adds r0, 0x4
	bl LoadTextWindowGraphics
	movs r0, 0x2
	bl SetTextWindowBaseTileNum
	ldr r1, [r4]
	adds r1, 0x34
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, 0x4
	bl LoadTextWindowGraphics
	bl MenuZeroFillScreen
	bl ResetPaletteFade
	ldr r1, _08111FCC
	ldr r0, _08111FD0
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, _08111FD4
	bl SetHBlankCallback
	ldr r0, _08111FD8
	bl SetVBlankCallback
	b _081120D6
	.align 2, 0
_08111FC8: .4byte gUnknown_03004828
_08111FCC: .4byte gMain
_08111FD0: .4byte 0x0000043c
_08111FD4: .4byte nullsub_73
_08111FD8: .4byte sub_811505C
_08111FDC:
	bl sub_804E22C
	b _08112088
_08111FE2:
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	adds r6, r0, 0
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r5, r0, 0
	lsls r0, r7, 3
	ldr r1, _08112034
	adds r0, r1
	ldr r1, _08112038
	lsls r2, r7, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _0811203C
	ldr r4, [r4, 0xC]
	str r4, [sp]
	str r7, [sp, 0x4]
	bl DecompressPicFromTable_2
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_80409C8
	ldr r0, [r0]
	movs r1, 0x90
	lsls r1, 1
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r1, _08112040
	ldr r0, _08112044
	adds r1, r0
	b _0811208E
	.align 2, 0
_08112034: .4byte gMonFrontPicTable
_08112038: .4byte gMonFrontPicCoords
_0811203C: .4byte gUnknown_081FAF4C
_08112040: .4byte gMain
_08112044: .4byte 0x0000043c
_08112048:
	adds r0, r7, 0
	movs r1, 0x3
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _08112098
	ldr r1, _0811209C
	str r1, [r0, 0x10]
	movs r1, 0x78
	movs r2, 0x40
	movs r3, 0x1E
	bl CreateSprite
	ldr r1, _081120A0
	lsls r2, r0, 24
	lsrs r2, 24
	strb r0, [r1, 0x1]
	ldr r3, _081120A4
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r1, r0
	ldr r2, _081120A8
	str r2, [r0]
	adds r1, r3
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	movs r2, 0x20
	orrs r0, r2
	strb r0, [r1, 0x5]
_08112088:
	ldr r1, _081120AC
	ldr r2, _081120B0
	adds r1, r2
_0811208E:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _081120D6
	.align 2, 0
_08112098: .4byte gUnknown_02024E8C
_0811209C: .4byte gDummySpriteAffineAnimTable
_081120A0: .4byte 0x02014800
_081120A4: .4byte gSprites
_081120A8: .4byte nullsub_37
_081120AC: .4byte gMain
_081120B0: .4byte 0x0000043c
_081120B4:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _081120E0
	bl SetMainCallback2
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x9A
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
_081120D6:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081120E0: .4byte sub_8112290
	thumb_func_end sub_8111E80

	thumb_func_start sub_81120E4
sub_81120E4: @ 81120E4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	str r0, [sp, 0x1C]
	adds r5, r1, 0
	adds r4, r2, 0
	mov r10, r3
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 24
	lsrs r4, 24
	mov r0, r10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, [sp, 0x1C]
	movs r1, 0x2
	add r2, sp, 0x8
	bl GetMonData
	ldr r0, _08112234
	add r1, sp, 0x8
	bl StringCopy10
	ldr r0, _08112238
	movs r1, 0xB
	muls r1, r5
	ldr r2, _0811223C
	adds r1, r2
	bl StringCopy
	ldr r1, _08112240
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, [sp, 0x1C]
	movs r1, 0xB
	bl GetMonData
	mov r8, r0
	mov r1, r8
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	ldr r0, [sp, 0x1C]
	movs r1, 0
	bl GetMonData
	adds r6, r0, 0
	ldr r0, [sp, 0x1C]
	movs r1, 0x1
	bl GetMonData
	adds r7, r0, 0
	ldr r2, _08112244
	mov r9, r2
	strb r4, [r2]
	lsls r0, r5, 3
	ldr r1, _08112248
	adds r0, r1
	ldr r1, _0811224C
	lsls r2, r5, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08112250
	ldr r4, [r4, 0x4]
	str r4, [sp]
	str r5, [sp, 0x4]
	bl DecompressPicFromTable_2
	adds r0, r5, 0
	adds r1, r7, 0
	adds r2, r6, 0
	bl sub_80409C8
	ldr r0, [r0]
	movs r1, 0x90
	lsls r1, 1
	movs r2, 0x20
	bl LoadCompressedPalette
	adds r0, r5, 0
	movs r1, 0x1
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _08112254
	ldr r1, _08112258
	str r1, [r0, 0x10]
	movs r1, 0x78
	movs r2, 0x40
	movs r3, 0x1E
	bl CreateSprite
	lsls r1, r0, 24
	lsrs r2, r1, 24
	mov r1, r9
	strb r0, [r1, 0x1]
	ldr r3, _0811225C
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r1, r0
	ldr r2, _08112260
	str r2, [r0]
	adds r1, r3
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	movs r2, 0x20
	orrs r0, r2
	strb r0, [r1, 0x5]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	bl sub_8149954
	ldr r0, _08112264
	movs r1, 0
	bl CreateTask
	lsls r1, r0, 24
	lsrs r2, r1, 24
	mov r1, r9
	strb r0, [r1, 0x2]
	ldr r1, _08112268
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	strh r2, [r0, 0x8]
	mov r1, r8
	strh r1, [r0, 0xE]
	strh r5, [r0, 0x10]
	mov r2, sp
	ldrh r2, [r2, 0x1C]
	strh r2, [r0, 0xA]
	ldr r1, [sp, 0x1C]
	lsrs r1, 16
	str r1, [sp, 0x20]
	strh r1, [r0, 0xC]
	movs r1, 0x1
	strh r1, [r0, 0x14]
	movs r1, 0
	strh r1, [r0, 0x1E]
	mov r2, r10
	strh r2, [r0, 0x20]
	ldr r0, _0811226C
	bl SetMainCallback2
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08112234: .4byte gStringVar1
_08112238: .4byte gStringVar2
_0811223C: .4byte gSpeciesNames
_08112240: .4byte gAffineAnimsDisabled
_08112244: .4byte 0x02014800
_08112248: .4byte gMonFrontPicTable
_0811224C: .4byte gMonFrontPicCoords
_08112250: .4byte gUnknown_081FAF4C
_08112254: .4byte gUnknown_02024E8C
_08112258: .4byte gDummySpriteAffineAnimTable
_0811225C: .4byte gSprites
_08112260: .4byte nullsub_37
_08112264: .4byte sub_8112FE8
_08112268: .4byte gTasks
_0811226C: .4byte sub_8112290
	thumb_func_end sub_81120E4

	thumb_func_start sub_8112270
sub_8112270: @ 8112270
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	ldr r0, _0811228C
	bl sub_800374C
	bl UpdatePaletteFade
	bl RunTasks
	pop {r0}
	bx r0
	.align 2, 0
_0811228C: .4byte gUnknown_03004210
	thumb_func_end sub_8112270

	thumb_func_start sub_8112290
sub_8112290: @ 8112290
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	ldr r0, _081122B0
	ldr r0, [r0]
	adds r0, 0x4
	bl sub_80035AC
	bl UpdatePaletteFade
	bl RunTasks
	pop {r0}
	bx r0
	.align 2, 0
_081122B0: .4byte gUnknown_03004828
	thumb_func_end sub_8112290

	thumb_func_start sub_81122B4
sub_81122B4: @ 81122B4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r10, r1
	lsls r0, 16
	lsrs r7, r0, 16
	movs r0, 0
	str r0, [sp]
	ldr r0, _081123F4
	mov r8, r0
	lsls r1, r7, 2
	mov r9, r1
	adds r0, r1, r7
	lsls r4, r0, 3
	mov r0, r8
	adds r6, r4, r0
	ldrh r0, [r6]
	cmp r0, 0xD
	beq _081122E2
	b _081123E2
_081122E2:
	ldr r1, _081123F8
	ldrb r0, [r1]
	cmp r0, 0x5
	bhi _081123E2
	adds r1, r0, 0
	movs r0, 0x64
	muls r1, r0
	ldr r0, _081123FC
	adds r5, r1, r0
	adds r0, r5, 0
	mov r1, r10
	movs r2, 0x64
	bl CopyMon
	mov r1, r8
	adds r2, r1, r4
	adds r2, 0xC
	adds r0, r5, 0
	movs r1, 0xB
	bl SetMonData
	ldrh r1, [r6, 0xC]
	movs r0, 0xB
	adds r2, r1, 0
	muls r2, r0
	ldr r0, _08112400
	adds r2, r0
	adds r0, r5, 0
	movs r1, 0x2
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0x8
	mov r2, sp
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0xA
	mov r2, sp
	bl SetMonData
	movs r4, 0x32
	mov r6, r9
_08112342:
	adds r0, r5, 0
	adds r1, r4, 0
	mov r2, sp
	bl SetMonData
	adds r4, 0x1
	cmp r4, 0x36
	ble _08112342
	movs r4, 0x43
_08112354:
	adds r0, r5, 0
	adds r1, r4, 0
	mov r2, sp
	bl SetMonData
	adds r4, 0x1
	cmp r4, 0x4F
	ble _08112354
	adds r0, r5, 0
	movs r1, 0x37
	mov r2, sp
	bl SetMonData
	movs r0, 0xFF
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0x40
	mov r2, sp
	bl SetMonData
	adds r0, r5, 0
	bl CalculateMonStats
	bl CalculatePlayerPartyCount
	ldr r0, _081123F4
	adds r4, r6, r7
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r4, 0xC]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2
	bl sub_8090D90
	ldrh r0, [r4, 0xC]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl sub_8090D90
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	ldr r1, _08112404
	cmp r0, r1
	bne _081123E2
	adds r0, r5, 0
	movs r1, 0x3
	bl GetMonData
	cmp r0, 0x1
	bne _081123E2
	mov r0, r10
	movs r1, 0xB
	bl GetMonData
	movs r1, 0x97
	lsls r1, 1
	cmp r0, r1
	bne _081123E2
	ldr r2, _08112408
	adds r0, r5, 0
	movs r1, 0x2
	bl SetMonData
_081123E2:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081123F4: .4byte gEvolutionTable
_081123F8: .4byte gPlayerPartyCount
_081123FC: .4byte gPlayerParty
_08112400: .4byte gSpeciesNames
_08112404: .4byte 0x0000012f
_08112408: .4byte gUnknown_083F868C
	thumb_func_end sub_81122B4

	thumb_func_start sub_811240C
sub_811240C: @ 811240C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, _08112490
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r3, r0, r2
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	mov r9, r0
	movs r1, 0xC
	ldrsh r0, [r3, r1]
	lsls r0, 16
	mov r1, r9
	orrs r1, r0
	mov r9, r1
	ldr r0, _08112494
	ldrh r1, [r0, 0x2C]
	adds r6, r2, 0
	adds r4, r0, 0
	cmp r1, 0x2
	bne _0811246E
	movs r2, 0x8
	ldrsh r0, [r3, r2]
	cmp r0, 0x8
	bne _0811246E
	ldrh r1, [r3, 0x12]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _0811246E
	movs r0, 0x10
	strh r0, [r3, 0x8]
	ldr r0, _08112498
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r1, r0, r6
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _0811246E
	strh r2, [r1, 0x18]
_0811246E:
	lsls r1, r7, 2
	adds r0, r1, r7
	lsls r0, 3
	adds r0, r6
	movs r3, 0x8
	ldrsh r0, [r0, r3]
	mov r8, r1
	cmp r0, 0x15
	bls _08112484
	bl _08112FD0
_08112484:
	lsls r0, 2
	ldr r1, _0811249C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08112490: .4byte gTasks
_08112494: .4byte gMain
_08112498: .4byte gUnknown_02024D1E
_0811249C: .4byte _081124A0
	.align 2, 0
_081124A0:
	.4byte _081124F8
	.4byte _0811253C
	.4byte _08112588
	.4byte _08112594
	.4byte _081125BC
	.4byte _081125FC
	.4byte _08112630
	.4byte _0811266C
	.4byte _081126A0
	.4byte _081126E0
	.4byte _081126FC
	.4byte _08112728
	.4byte _08112754
	.4byte _081127A0
	.4byte _0811284C
	.4byte _081128E4
	.4byte _08112934
	.4byte _08112974
	.4byte _081129A0
	.4byte _081129E8
	.4byte _08112A4C
	.4byte _08112A88
_081124F8:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _08112530
	ldr r0, _08112534
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldr r0, _08112538
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	b _08112A2E
	.align 2, 0
_08112530: .4byte gSprites
_08112534: .4byte 0x02014800
_08112538: .4byte gTasks
_0811253C:
	ldr r0, _08112574
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0811254C
	bl _08112FD0
_0811254C:
	ldr r4, _08112578
	ldr r1, _0811257C
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _08112580
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08112584
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	b _08112A2E
	.align 2, 0
_08112574: .4byte gPaletteFade
_08112578: .4byte gStringVar4
_0811257C: .4byte gUnknown_08400C4A
_08112580: .4byte gUnknown_03004210
_08112584: .4byte gTasks
_08112588:
	ldr r0, _08112590
	ldrh r0, [r0, 0x16]
	b _0811297C
	.align 2, 0
_08112590: .4byte gUnknown_03004210
_08112594:
	bl IsCryFinished
	lsls r0, 24
	cmp r0, 0
	bne _081125A2
	bl _08112FD0
_081125A2:
	movs r0, 0xBC
	lsls r0, 1
	bl PlaySE
	ldr r0, _081125B8
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	b _08112A2E
	.align 2, 0
_081125B8: .4byte gTasks
_081125BC:
	bl IsSEPlaying
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _081125CC
	bl _08112FD0
_081125CC:
	ldr r0, _081125F4
	bl PlayNewMapMusic
	ldr r0, _081125F8
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	str r4, [sp]
	movs r0, 0x1C
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	bl _08112FD0
	.align 2, 0
_081125F4: .4byte 0x00000179
_081125F8: .4byte gTasks
_081125FC:
	ldr r0, _08112624
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0811260C
	bl _08112FD0
_0811260C:
	movs r0, 0x11
	bl sub_8149970
	ldr r1, _08112628
	strb r0, [r1, 0x2]
	ldr r0, _0811262C
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	b _08112A2E
	.align 2, 0
_08112624: .4byte gPaletteFade
_08112628: .4byte gUnknown_02024D1E
_0811262C: .4byte gTasks
_08112630:
	ldr r4, _08112664
	ldrb r0, [r4, 0x2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r6
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _08112646
	bl _08112FD0
_08112646:
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r6
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r1, _08112668
	movs r0, 0x1
	strb r0, [r1, 0x3]
	bl sub_8149A90
	strb r0, [r4, 0x2]
	bl _08112FD0
	.align 2, 0
_08112664: .4byte gUnknown_02024D1E
_08112668: .4byte 0x02014800
_0811266C:
	ldr r4, _08112698
	ldrb r0, [r4, 0x2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r6
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _08112682
	bl _08112FD0
_08112682:
	ldr r1, _0811269C
	ldrb r0, [r1]
	ldrb r1, [r1, 0x1]
	bl sub_8149E7C
	strb r0, [r4, 0x2]
	mov r0, r8
	adds r1, r0, r7
	lsls r1, 3
	adds r1, r6
	b _08112A2E
	.align 2, 0
_08112698: .4byte gUnknown_02024D1E
_0811269C: .4byte 0x02014800
_081126A0:
	ldr r1, _081126D8
	ldrb r0, [r1, 0x3]
	subs r0, 0x1
	strb r0, [r1, 0x3]
	lsls r0, 24
	cmp r0, 0
	beq _081126B2
	bl _08112FD0
_081126B2:
	movs r0, 0x3
	strb r0, [r1, 0x3]
	ldr r0, _081126DC
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _081126CC
	bl _08112FD0
_081126CC:
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r6
	b _08112A2E
	.align 2, 0
_081126D8: .4byte 0x02014800
_081126DC: .4byte gUnknown_02024D1E
_081126E0:
	bl sub_8149B44
	ldr r1, _081126F4
	strb r0, [r1, 0x2]
	ldr r0, _081126F8
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	b _08112A2E
	.align 2, 0
_081126F4: .4byte gUnknown_02024D1E
_081126F8: .4byte gTasks
_081126FC:
	ldr r5, _08112724
	ldrb r0, [r5, 0x2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r6
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _08112712
	bl _08112FD0
_08112712:
	mov r0, r8
	adds r4, r0, r7
	lsls r4, 3
	adds r4, r6
	ldrh r0, [r4, 0x10]
	bl sub_8149C20
	strb r0, [r5, 0x2]
	b _08112992
	.align 2, 0
_08112724: .4byte gUnknown_02024D1E
_08112728:
	ldr r0, _08112750
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _0811273E
	bl _08112FD0
_0811273E:
	movs r0, 0x21
	bl PlaySE
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r6
	b _08112A2E
	.align 2, 0
_08112750: .4byte gUnknown_02024D1E
_08112754:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _08112762
	bl _08112FD0
_08112762:
	bl m4aMPlayAllStop
	ldr r0, _08112794
	mov r3, r8
	adds r4, r3, r7
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r4, 0x10]
	movs r1, 0
	bl PlayCry1
	ldr r0, _08112798
	ldr r1, _0811279C
	movs r2, 0x60
	bl memcpy
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1C
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _08112992
	.align 2, 0
_08112794: .4byte gTasks
_08112798: .4byte gPlttBufferUnfaded + 0x40
_0811279C: .4byte 0x02009000
_081127A0:
	bl IsCryFinished
	lsls r0, 24
	cmp r0, 0
	bne _081127AE
	bl _08112FD0
_081127AE:
	ldr r0, _08112834
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _081127BE
	bl _08112FD0
_081127BE:
	ldr r4, _08112838
	ldr r1, _0811283C
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _08112840
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08112844
	bl PlayBGM
	ldr r2, _08112848
	mov r0, r8
	adds r1, r0, r7
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	adds r2, r1
	adds r2, 0x10
	mov r0, r9
	movs r1, 0xB
	bl SetMonData
	mov r0, r9
	bl CalculateMonStats
	ldrh r1, [r4, 0xE]
	ldrh r2, [r4, 0x10]
	mov r0, r9
	bl sub_803FB68
	ldrh r0, [r4, 0x10]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2
	bl sub_8090D90
	ldrh r0, [r4, 0x10]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl sub_8090D90
	movs r0, 0xE
	bl sav12_xor_increment
	b _08112FD0
	.align 2, 0
_08112834: .4byte gPaletteFade
_08112838: .4byte gStringVar4
_0811283C: .4byte gUnknown_08400C60
_08112840: .4byte gUnknown_03004210
_08112844: .4byte 0x00000173
_08112848: .4byte gTasks
_0811284C:
	ldr r0, _081128A4
	ldrh r0, [r0, 0x16]
	cmp r0, 0
	beq _08112856
	b _08112FD0
_08112856:
	mov r1, r8
	adds r0, r1, r7
	lsls r0, 3
	adds r5, r0, r6
	ldrb r1, [r5, 0x14]
	mov r0, r9
	bl sub_803B7C8
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0
	beq _081128C4
	movs r2, 0x1E
	ldrsh r4, [r5, r2]
	cmp r4, 0
	bne _081128C4
	bl sub_8053E90
	ldrh r1, [r5, 0x12]
	movs r0, 0x80
	orrs r0, r1
	strh r0, [r5, 0x12]
	strh r4, [r5, 0x14]
	strh r4, [r5, 0x18]
	mov r0, r9
	movs r1, 0x2
	add r2, sp, 0x4
	bl GetMonData
	ldr r0, _081128A8
	add r1, sp, 0x4
	bl StringCopy10
	ldr r0, _081128AC
	cmp r6, r0
	bne _081128B0
	movs r0, 0x15
	strh r0, [r5, 0x8]
	b _08112FD0
	.align 2, 0
_081128A4: .4byte gUnknown_03004210
_081128A8: .4byte gUnknown_030041C0
_081128AC: .4byte 0x0000ffff
_081128B0:
	ldr r0, _081128C0
	cmp r6, r0
	bne _081128B8
	b _08112FD0
_081128B8:
	movs r0, 0x13
	strh r0, [r5, 0x8]
	b _08112FD0
	.align 2, 0
_081128C0: .4byte 0x0000fffe
_081128C4:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _081128E0
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	b _08112A2E
	.align 2, 0
_081128E0: .4byte gTasks
_081128E4:
	ldr r0, _0811292C
	ldrb r1, [r0, 0x7]
	movs r2, 0x80
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _081128F4
	b _08112FD0
_081128F4:
	mov r1, r8
	adds r0, r1, r7
	lsls r0, 3
	adds r4, r0, r6
	ldrh r1, [r4, 0x12]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _0811290A
	bl sub_8053E90
_0811290A:
	movs r2, 0x1E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0811291A
	ldrh r0, [r4, 0xE]
	mov r1, r9
	bl sub_81122B4
_0811291A:
	adds r0, r7, 0
	bl DestroyTask
	ldr r0, _08112930
	ldr r0, [r0]
	bl SetMainCallback2
	b _08112FD0
	.align 2, 0
_0811292C: .4byte gPaletteFade
_08112930: .4byte gUnknown_03005E94
_08112934:
	ldr r0, _08112968
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _08112948
	b _08112FD0
_08112948:
	bl m4aMPlayAllStop
	ldr r0, _0811296C
	ldr r1, _08112970
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r6
	b _08112A2E
	.align 2, 0
_08112968: .4byte gUnknown_02024D1E
_0811296C: .4byte 0x0006001c
_08112970: .4byte 0x00007fff
_08112974:
	ldr r0, _0811299C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
_0811297C:
	cmp r0, 0
	beq _08112982
	b _08112FD0
_08112982:
	mov r0, r8
	adds r4, r0, r7
	lsls r4, 3
	adds r4, r6
	ldrh r0, [r4, 0xE]
	movs r1, 0
	bl PlayCry1
_08112992:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08112FD0
	.align 2, 0
_0811299C: .4byte gPaletteFade
_081129A0:
	bl IsCryFinished
	lsls r0, 24
	cmp r0, 0
	bne _081129AC
	b _08112FD0
_081129AC:
	ldr r4, _081129D8
	ldr r1, _081129DC
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _081129E0
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _081129E4
	mov r2, r8
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0, 0x1E]
	b _08112F9A
	.align 2, 0
_081129D8: .4byte gStringVar4
_081129DC: .4byte gUnknown_08400C8D
_081129E0: .4byte gUnknown_03004210
_081129E4: .4byte gTasks
_081129E8:
	ldr r4, _08112A38
	ldrh r0, [r4, 0x16]
	cmp r0, 0
	beq _081129F2
	b _08112FD0
_081129F2:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _081129FE
	b _08112FD0
_081129FE:
	bl sub_8024CEC
	ldr r0, _08112A3C
	bl PlayFanfare
	ldr r0, _08112A40
	ldr r0, [r0, 0xC]
	bl get_battle_strings_
	ldr r1, _08112A44
	movs r0, 0xF
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08112A48
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0x40
	strh r0, [r1, 0x14]
_08112A2E:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _08112FD0
	.align 2, 0
_08112A38: .4byte gUnknown_03004210
_08112A3C: .4byte 0x0000016f
_08112A40: .4byte gUnknown_08400F8C
_08112A44: .4byte gUnknown_020238CC
_08112A48: .4byte gTasks
_08112A4C:
	ldr r0, _08112A80
	ldrh r0, [r0, 0x16]
	cmp r0, 0
	beq _08112A56
	b _08112FD0
_08112A56:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08112A62
	b _08112FD0
_08112A62:
	ldr r0, _08112A84
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x14]
	subs r0, 0x1
	strh r0, [r1, 0x14]
	lsls r0, 16
	cmp r0, 0
	beq _08112A7A
	b _08112FD0
_08112A7A:
	movs r0, 0xE
	strh r0, [r1, 0x8]
	b _08112FD0
	.align 2, 0
_08112A80: .4byte gUnknown_03004210
_08112A84: .4byte gTasks
_08112A88:
	mov r3, r8
	adds r0, r3, r7
	lsls r0, 3
	adds r0, r6
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0xB
	bls _08112A9A
	b _08112FD0
_08112A9A:
	lsls r0, 2
	ldr r1, _08112AA4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08112AA4: .4byte _08112AA8
	.align 2, 0
_08112AA8:
	.4byte _08112AD8
	.4byte _08112B2C
	.4byte _08112B7C
	.4byte _08112BC0
	.4byte _08112C0C
	.4byte _08112D3C
	.4byte _08112D8C
	.4byte _08112E98
	.4byte _08112EE8
	.4byte _08112F38
	.4byte _08112F78
	.4byte _08112FB0
_08112AD8:
	ldr r4, _08112B1C
	ldrh r0, [r4, 0x16]
	cmp r0, 0
	beq _08112AE2
	b _08112FD0
_08112AE2:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08112AEE
	b _08112FD0
_08112AEE:
	bl sub_8024CEC
	ldr r0, _08112B20
	ldr r0, [r0, 0x10]
	bl get_battle_strings_
	ldr r1, _08112B24
	movs r0, 0xF
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08112B28
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	b _08112FCE
	.align 2, 0
_08112B1C: .4byte gUnknown_03004210
_08112B20: .4byte gUnknown_08400F8C
_08112B24: .4byte gUnknown_020238CC
_08112B28: .4byte gTasks
_08112B2C:
	ldr r4, _08112B6C
	ldrh r0, [r4, 0x16]
	cmp r0, 0
	beq _08112B36
	b _08112FD0
_08112B36:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08112B42
	b _08112FD0
_08112B42:
	ldr r0, _08112B70
	ldr r0, [r0, 0x14]
	bl get_battle_strings_
	ldr r1, _08112B74
	movs r0, 0xF
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08112B78
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	b _08112FCE
	.align 2, 0
_08112B6C: .4byte gUnknown_03004210
_08112B70: .4byte gUnknown_08400F8C
_08112B74: .4byte gUnknown_020238CC
_08112B78: .4byte gTasks
_08112B7C:
	ldr r4, _08112BF8
	ldrh r0, [r4, 0x16]
	cmp r0, 0
	beq _08112B86
	b _08112FD0
_08112B86:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _08112BC0
	ldr r0, _08112BFC
	ldr r0, [r0, 0x18]
	bl get_battle_strings_
	ldr r1, _08112C00
	movs r0, 0xF
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08112C04
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0x5
	strh r0, [r1, 0x1A]
	movs r0, 0x9
	strh r0, [r1, 0x1C]
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	strh r0, [r1, 0x18]
_08112BC0:
	ldr r0, _08112BF8
	ldrh r0, [r0, 0x16]
	cmp r0, 0
	beq _08112BCA
	b _08112FD0
_08112BCA:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08112BD6
	b _08112FD0
_08112BD6:
	bl sub_8023A80
	ldr r0, _08112C04
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	movs r2, 0
	strh r0, [r1, 0x18]
	ldr r0, _08112C08
	strb r2, [r0, 0x1]
	bl sub_802BC6C
	b _08112FD0
	.align 2, 0
_08112BF8: .4byte gUnknown_03004210
_08112BFC: .4byte gUnknown_08400F8C
_08112C00: .4byte gUnknown_020238CC
_08112C04: .4byte gTasks
_08112C08: .4byte gUnknown_02024D1E
_08112C0C:
	ldr r0, _08112CA4
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08112C32
	ldr r4, _08112CA8
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _08112C32
	movs r0, 0x5
	bl PlaySE
	bl nullsub_6
	movs r0, 0
	strb r0, [r4, 0x1]
	bl sub_802BC6C
_08112C32:
	ldr r0, _08112CA4
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08112C58
	ldr r4, _08112CA8
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _08112C58
	movs r0, 0x5
	bl PlaySE
	bl nullsub_6
	movs r0, 0x1
	strb r0, [r4, 0x1]
	bl sub_802BC6C
_08112C58:
	ldr r0, _08112CA4
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08112CE2
	bl sub_8023AD8
	ldr r0, _08112CAC
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r0, _08112CB0
	ldr r1, _08112CB4
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08112CA8
	ldrb r2, [r0, 0x1]
	cmp r2, 0
	beq _08112CBC
	ldr r0, _08112CB8
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1C]
	strh r0, [r1, 0x18]
	b _08112CE2
	.align 2, 0
_08112CA4: .4byte gMain
_08112CA8: .4byte gUnknown_02024D1E
_08112CAC: .4byte gUnknown_08400F8C
_08112CB0: .4byte gUnknown_03004210
_08112CB4: .4byte gUnknown_020238CC
_08112CB8: .4byte gTasks
_08112CBC:
	ldr r0, _08112D28
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1A]
	strh r0, [r1, 0x18]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _08112CE2
	movs r0, 0x1
	negs r0, r0
	str r2, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_08112CE2:
	ldr r0, _08112D2C
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08112CF0
	b _08112FD0
_08112CF0:
	bl sub_8023AD8
	ldr r0, _08112D30
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r0, _08112D34
	ldr r1, _08112D38
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	movs r0, 0x5
	bl PlaySE
	ldr r1, _08112D28
	mov r2, r8
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x1C]
	strh r1, [r0, 0x18]
	b _08112FD0
	.align 2, 0
_08112D28: .4byte gTasks
_08112D2C: .4byte gMain
_08112D30: .4byte gUnknown_08400F8C
_08112D34: .4byte gUnknown_03004210
_08112D38: .4byte gUnknown_020238CC
_08112D3C:
	ldr r0, _08112D78
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08112D4A
	b _08112FD0
_08112D4A:
	ldr r0, _08112D7C
	mov r3, r8
	adds r5, r3, r7
	lsls r5, 3
	adds r5, r6
	ldrh r1, [r5, 0x20]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08112D80
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _08112D84
	ldr r4, _08112D88
	ldrh r4, [r4]
	str r4, [sp]
	bl sub_809D9F0
	ldrh r0, [r5, 0x18]
	adds r0, 0x1
	strh r0, [r5, 0x18]
	b _08112FD0
	.align 2, 0
_08112D78: .4byte gPaletteFade
_08112D7C: .4byte gPlayerParty
_08112D80: .4byte gPlayerPartyCount
_08112D84: .4byte sub_8111C90
_08112D88: .4byte word_2024E82
_08112D8C:
	ldr r0, _08112DC0
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08112D9A
	b _08112FD0
_08112D9A:
	ldr r1, [r4, 0x4]
	ldr r0, _08112DC4
	cmp r1, r0
	beq _08112DA4
	b _08112FD0
_08112DA4:
	bl sub_809FA30
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x4
	bne _08112DCC
	ldr r0, _08112DC8
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0x9
	b _08112FCE
	.align 2, 0
_08112DC0: .4byte gPaletteFade
_08112DC4: .4byte sub_8112270
_08112DC8: .4byte gTasks
_08112DCC:
	adds r1, r6, 0
	adds r1, 0xD
	mov r0, r9
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl sub_8040A00
	cmp r0, 0
	beq _08112E24
	ldr r0, _08112E10
	ldr r3, _08112E14
	adds r0, r3
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r0, _08112E18
	ldr r1, _08112E1C
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _08112E20
	mov r2, r8
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	movs r1, 0xB
	strh r1, [r0, 0x18]
	b _08112FD0
	.align 2, 0
_08112E10: .4byte gUnknown_08400F8C
_08112E14: .4byte 0x000004cc
_08112E18: .4byte gUnknown_03004210
_08112E1C: .4byte gUnknown_020238CC
_08112E20: .4byte gTasks
_08112E24:
	ldr r1, _08112E80
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	strb r4, [r1, 0x2]
	lsrs r0, r4, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	lsls r4, r6, 24
	lsrs r4, 24
	mov r0, r9
	adds r1, r4, 0
	bl RemoveMonPPBonus
	ldr r0, _08112E84
	ldrh r1, [r0]
	mov r0, r9
	adds r2, r4, 0
	bl SetMonMoveSlot
	ldr r0, _08112E88
	movs r3, 0xCF
	lsls r3, 2
	adds r0, r3
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r0, _08112E8C
	ldr r1, _08112E90
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08112E94
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	b _08112FCE
	.align 2, 0
_08112E80: .4byte gUnknown_03004290
_08112E84: .4byte word_2024E82
_08112E88: .4byte gUnknown_08400F8C
_08112E8C: .4byte gUnknown_03004210
_08112E90: .4byte gUnknown_020238CC
_08112E94: .4byte gTasks
_08112E98:
	ldr r4, _08112ED8
	ldrh r0, [r4, 0x16]
	cmp r0, 0
	beq _08112EA2
	b _08112FD0
_08112EA2:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08112EAE
	b _08112FD0
_08112EAE:
	ldr r0, _08112EDC
	ldr r0, [r0, 0x1C]
	bl get_battle_strings_
	ldr r1, _08112EE0
	movs r0, 0xF
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08112EE4
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	b _08112FCE
	.align 2, 0
_08112ED8: .4byte gUnknown_03004210
_08112EDC: .4byte gUnknown_08400F8C
_08112EE0: .4byte gUnknown_020238CC
_08112EE4: .4byte gTasks
_08112EE8:
	ldr r4, _08112F28
	ldrh r0, [r4, 0x16]
	cmp r0, 0
	bne _08112FD0
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _08112FD0
	ldr r0, _08112F2C
	movs r1, 0xD0
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r1, _08112F30
	movs r0, 0xF
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _08112F34
	mov r2, r8
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	movs r1, 0x13
	strh r1, [r0, 0x8]
	b _08112FD0
	.align 2, 0
_08112F28: .4byte gUnknown_03004210
_08112F2C: .4byte gUnknown_08400F8C
_08112F30: .4byte gUnknown_020238CC
_08112F34: .4byte gTasks
_08112F38:
	ldr r0, _08112F68
	ldr r0, [r0, 0x20]
	bl get_battle_strings_
	ldr r0, _08112F6C
	ldr r1, _08112F70
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _08112F74
	mov r3, r8
	adds r0, r3, r7
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	movs r1, 0xA
	strh r1, [r0, 0x1A]
	strh r2, [r0, 0x1C]
	movs r1, 0x3
	strh r1, [r0, 0x18]
	b _08112FD0
	.align 2, 0
_08112F68: .4byte gUnknown_08400F8C
_08112F6C: .4byte gUnknown_03004210
_08112F70: .4byte gUnknown_020238CC
_08112F74: .4byte gTasks
_08112F78:
	ldr r0, _08112FA0
	ldr r0, [r0, 0x24]
	bl get_battle_strings_
	ldr r0, _08112FA4
	ldr r1, _08112FA8
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _08112FAC
	mov r2, r8
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
_08112F9A:
	movs r1, 0xE
	strh r1, [r0, 0x8]
	b _08112FD0
	.align 2, 0
_08112FA0: .4byte gUnknown_08400F8C
_08112FA4: .4byte gUnknown_03004210
_08112FA8: .4byte gUnknown_020238CC
_08112FAC: .4byte gTasks
_08112FB0:
	ldr r0, _08112FE0
	ldrh r0, [r0, 0x16]
	cmp r0, 0
	bne _08112FD0
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _08112FD0
	ldr r0, _08112FE4
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0x5
_08112FCE:
	strh r0, [r1, 0x18]
_08112FD0:
	add sp, 0x18
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08112FE0: .4byte gUnknown_03004210
_08112FE4: .4byte gTasks
	thumb_func_end sub_811240C

	thumb_func_start sub_8112FE8
sub_8112FE8: @ 8112FE8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, _0811302C
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r2
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	mov r8, r0
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	lsls r0, 16
	mov r3, r8
	orrs r3, r0
	mov r8, r3
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	adds r6, r2, 0
	cmp r0, 0x11
	bls _08113020
	bl _08113B3A
_08113020:
	lsls r0, 2
	ldr r1, _08113030
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811302C: .4byte gTasks
_08113030: .4byte _08113034
	.align 2, 0
_08113034:
	.4byte _0811307C
	.4byte _081130B8
	.4byte _081130DC
	.4byte _0811310C
	.4byte _0811314C
	.4byte _0811318C
	.4byte _081131C8
	.4byte _081131F4
	.4byte _0811322C
	.4byte _08113248
	.4byte _08113274
	.4byte _081132A8
	.4byte _081132F8
	.4byte _081133A8
	.4byte _0811346C
	.4byte _08113490
	.4byte _081134F8
	.4byte _08113538
_0811307C:
	ldr r4, _081130A8
	ldr r1, _081130AC
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _081130B0
	ldr r1, [r0]
	adds r0, r1, 0x4
	adds r1, 0x34
	ldrb r2, [r1]
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _081130B4
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	b _08113298
	.align 2, 0
_081130A8: .4byte gStringVar4
_081130AC: .4byte gUnknown_08400C4A
_081130B0: .4byte gUnknown_03004828
_081130B4: .4byte gTasks
_081130B8:
	ldr r0, _081130D8
	ldr r0, [r0]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _081130C6
	bl _08113B3A
_081130C6:
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r6
	ldrh r0, [r4, 0xE]
	movs r1, 0
	bl PlayCry1
	b _081132E2
	.align 2, 0
_081130D8: .4byte gUnknown_03004828
_081130DC:
	bl IsCryFinished
	lsls r0, 24
	cmp r0, 0
	bne _081130EA
	bl _08113B3A
_081130EA:
	ldr r0, _08113104
	bl m4aSongNumStop
	movs r0, 0xBC
	lsls r0, 1
	bl PlaySE
	ldr r1, _08113108
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	b _08113298
	.align 2, 0
_08113104: .4byte 0x00000179
_08113108: .4byte gTasks
_0811310C:
	bl IsSEPlaying
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	beq _0811311C
	bl _08113B3A
_0811311C:
	ldr r0, _08113144
	bl PlayBGM
	ldr r1, _08113148
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	str r5, [sp]
	movs r0, 0x1C
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	bl _08113B3A
	.align 2, 0
_08113144: .4byte 0x00000179
_08113148: .4byte gTasks
_0811314C:
	ldr r0, _08113180
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0811315C
	bl _08113B3A
_0811315C:
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x9A
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0x11
	bl sub_8149970
	ldr r1, _08113184
	strb r0, [r1, 0x2]
	ldr r1, _08113188
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	b _08113298
	.align 2, 0
_08113180: .4byte gPaletteFade
_08113184: .4byte gUnknown_02024D1E
_08113188: .4byte gTasks
_0811318C:
	ldr r4, _081131C0
	ldrb r0, [r4, 0x2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r6
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _081131A2
	bl _08113B3A
_081131A2:
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r6
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	ldr r1, _081131C4
	movs r0, 0x1
	strb r0, [r1, 0x3]
	bl sub_8149A90
	strb r0, [r4, 0x2]
	bl _08113B3A
	.align 2, 0
_081131C0: .4byte gUnknown_02024D1E
_081131C4: .4byte 0x02014800
_081131C8:
	ldr r4, _081131EC
	ldrb r0, [r4, 0x2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r6
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _081131DE
	bl _08113B3A
_081131DE:
	ldr r1, _081131F0
	ldrb r0, [r1]
	ldrb r1, [r1, 0x1]
	bl sub_8149E7C
	strb r0, [r4, 0x2]
	b _08113290
	.align 2, 0
_081131EC: .4byte gUnknown_02024D1E
_081131F0: .4byte 0x02014800
_081131F4:
	ldr r1, _08113224
	ldrb r0, [r1, 0x3]
	subs r0, 0x1
	strb r0, [r1, 0x3]
	lsls r0, 24
	cmp r0, 0
	beq _08113206
	bl _08113B3A
_08113206:
	movs r0, 0x3
	strb r0, [r1, 0x3]
	ldr r0, _08113228
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _08113220
	bl _08113B3A
_08113220:
	b _08113290
	.align 2, 0
_08113224: .4byte 0x02014800
_08113228: .4byte gUnknown_02024D1E
_0811322C:
	bl sub_8149B44
	ldr r1, _08113240
	strb r0, [r1, 0x2]
	ldr r1, _08113244
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	b _08113298
	.align 2, 0
_08113240: .4byte gUnknown_02024D1E
_08113244: .4byte gTasks
_08113248:
	ldr r5, _08113270
	ldrb r0, [r5, 0x2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r6
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _0811325E
	bl _08113B3A
_0811325E:
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r6
	ldrh r0, [r4, 0x10]
	bl sub_8149D5C
	strb r0, [r5, 0x2]
	b _081132E2
	.align 2, 0
_08113270: .4byte gUnknown_02024D1E
_08113274:
	ldr r0, _081132A4
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _0811328A
	bl _08113B3A
_0811328A:
	movs r0, 0x21
	bl PlaySE
_08113290:
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r6
_08113298:
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	bl _08113B3A
	.align 2, 0
_081132A4: .4byte gUnknown_02024D1E
_081132A8:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _081132B6
	bl _08113B3A
_081132B6:
	ldr r0, _081132EC
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r4, 0x10]
	movs r1, 0
	bl PlayCry1
	ldr r0, _081132F0
	ldr r1, _081132F4
	movs r2, 0x60
	bl memcpy
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_081132E2:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	bl _08113B3A
	.align 2, 0
_081132EC: .4byte gTasks
_081132F0: .4byte gPlttBufferUnfaded + 0x40
_081132F4: .4byte 0x02009000
_081132F8:
	bl IsCryFinished
	lsls r0, 24
	cmp r0, 0
	bne _08113306
	bl _08113B3A
_08113306:
	ldr r0, _08113390
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08113316
	bl _08113B3A
_08113316:
	ldr r4, _08113394
	ldr r1, _08113398
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _0811339C
	ldr r1, [r0]
	adds r0, r1, 0x4
	adds r1, 0x34
	ldrb r2, [r1]
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _081133A0
	bl PlayFanfare
	ldr r2, _081133A4
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	adds r2, r1
	adds r2, 0x10
	mov r0, r8
	movs r1, 0xB
	bl SetMonData
	mov r0, r8
	bl CalculateMonStats
	ldrh r1, [r4, 0xE]
	ldrh r2, [r4, 0x10]
	mov r0, r8
	bl sub_803FB68
	ldrh r0, [r4, 0x10]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2
	bl sub_8090D90
	ldrh r0, [r4, 0x10]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl sub_8090D90
	movs r0, 0xE
	bl sav12_xor_increment
	b _08113B3A
	.align 2, 0
_08113390: .4byte gPaletteFade
_08113394: .4byte gStringVar4
_08113398: .4byte gUnknown_08400C60
_0811339C: .4byte gUnknown_03004828
_081133A0: .4byte 0x00000173
_081133A4: .4byte gTasks
_081133A8:
	ldr r0, _08113410
	ldr r0, [r0]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _081133B4
	b _08113B3A
_081133B4:
	bl IsFanfareTaskInactive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081133C2
	b _08113B3A
_081133C2:
	ldr r1, _08113414
	lsls r4, r7, 2
	adds r0, r4, r7
	lsls r0, 3
	adds r5, r0, r1
	ldrb r1, [r5, 0x14]
	mov r0, r8
	bl sub_803B7C8
	lsls r0, 16
	lsrs r6, r0, 16
	mov r9, r4
	cmp r6, 0
	beq _08113434
	movs r3, 0x1E
	ldrsh r2, [r5, r3]
	cmp r2, 0
	bne _08113434
	ldrh r1, [r5, 0x12]
	movs r0, 0x80
	orrs r0, r1
	strh r0, [r5, 0x12]
	strh r2, [r5, 0x14]
	strh r2, [r5, 0x18]
	mov r0, r8
	movs r1, 0x2
	add r2, sp, 0x4
	bl GetMonData
	ldr r0, _08113418
	add r1, sp, 0x4
	bl StringCopy10
	ldr r0, _0811341C
	cmp r6, r0
	bne _08113420
	movs r0, 0x11
	strh r0, [r5, 0x8]
	b _08113B3A
	.align 2, 0
_08113410: .4byte gUnknown_03004828
_08113414: .4byte gTasks
_08113418: .4byte gUnknown_030041C0
_0811341C: .4byte 0x0000ffff
_08113420:
	ldr r0, _08113430
	cmp r6, r0
	bne _08113428
	b _08113B3A
_08113428:
	movs r0, 0xF
	strh r0, [r5, 0x8]
	b _08113B3A
	.align 2, 0
_08113430: .4byte 0x0000fffe
_08113434:
	ldr r0, _0811345C
	bl PlayBGM
	ldr r0, _08113460
	ldr r2, [r0]
	adds r0, r2, 0x4
	ldr r1, _08113464
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08113468
	mov r2, r9
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	b _081134DC
	.align 2, 0
_0811345C: .4byte 0x00000179
_08113460: .4byte gUnknown_03004828
_08113464: .4byte gOtherText_LinkStandby2
_08113468: .4byte gTasks
_0811346C:
	ldr r0, _08113488
	ldr r0, [r0]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _08113478
	b _08113B3A
_08113478:
	adds r0, r7, 0
	bl DestroyTask
	ldr r0, _0811348C
	ldr r0, [r0]
	bl SetMainCallback2
	b _08113B3A
	.align 2, 0
_08113488: .4byte gUnknown_03004828
_0811348C: .4byte gUnknown_03005E94
_08113490:
	ldr r4, _081134E4
	ldr r0, [r4]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _0811349C
	b _08113B3A
_0811349C:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _081134A8
	b _08113B3A
_081134A8:
	bl sub_8024CEC
	ldr r0, _081134E8
	bl PlayFanfare
	ldr r0, _081134EC
	ldr r0, [r0, 0xC]
	bl get_battle_strings_
	ldr r2, [r4]
	adds r0, r2, 0x4
	ldr r1, _081134F0
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _081134F4
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0x40
	strh r0, [r1, 0x14]
_081134DC:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _08113B3A
	.align 2, 0
_081134E4: .4byte gUnknown_03004828
_081134E8: .4byte 0x0000016f
_081134EC: .4byte gUnknown_08400F8C
_081134F0: .4byte gUnknown_020238CC
_081134F4: .4byte gTasks
_081134F8:
	ldr r0, _08113530
	ldr r0, [r0]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _08113504
	b _08113B3A
_08113504:
	bl IsFanfareTaskInactive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08113512
	b _08113B3A
_08113512:
	ldr r0, _08113534
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x14]
	subs r0, 0x1
	strh r0, [r1, 0x14]
	lsls r0, 16
	cmp r0, 0
	beq _0811352A
	b _08113B3A
_0811352A:
	movs r0, 0xD
	strh r0, [r1, 0x8]
	b _08113B3A
	.align 2, 0
_08113530: .4byte gUnknown_03004828
_08113534: .4byte gTasks
_08113538:
	lsls r1, r7, 2
	adds r0, r1, r7
	lsls r0, 3
	adds r0, r6
	movs r3, 0x18
	ldrsh r0, [r0, r3]
	mov r9, r1
	cmp r0, 0xB
	bls _0811354C
	b _08113B3A
_0811354C:
	lsls r0, 2
	ldr r1, _08113558
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08113558: .4byte _0811355C
	.align 2, 0
_0811355C:
	.4byte _0811358C
	.4byte _081135E4
	.4byte _08113638
	.4byte _08113682
	.4byte _0811371C
	.4byte _0811387C
	.4byte _081138CC
	.4byte _081139E8
	.4byte _08113A3C
	.4byte _08113A90
	.4byte _08113AD8
	.4byte _08113B18
_0811358C:
	ldr r4, _081135D4
	ldr r0, [r4]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _08113598
	b _08113B3A
_08113598:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _081135A4
	b _08113B3A
_081135A4:
	bl sub_8024CEC
	ldr r0, _081135D8
	ldr r0, [r0, 0x10]
	bl get_battle_strings_
	ldr r2, [r4]
	adds r0, r2, 0x4
	ldr r1, _081135DC
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _081135E0
	mov r2, r9
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	b _08113B38
	.align 2, 0
_081135D4: .4byte gUnknown_03004828
_081135D8: .4byte gUnknown_08400F8C
_081135DC: .4byte gUnknown_020238CC
_081135E0: .4byte gTasks
_081135E4:
	ldr r4, _08113628
	ldr r0, [r4]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _081135F0
	b _08113B3A
_081135F0:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _081135FC
	b _08113B3A
_081135FC:
	ldr r0, _0811362C
	ldr r0, [r0, 0x14]
	bl get_battle_strings_
	ldr r2, [r4]
	adds r0, r2, 0x4
	ldr r1, _08113630
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08113634
	mov r3, r9
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	b _08113B38
	.align 2, 0
_08113628: .4byte gUnknown_03004828
_0811362C: .4byte gUnknown_08400F8C
_08113630: .4byte gUnknown_020238CC
_08113634: .4byte gTasks
_08113638:
	ldr r4, _081136FC
	ldr r0, [r4]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _08113644
	b _08113B3A
_08113644:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _08113682
	ldr r0, _08113700
	ldr r0, [r0, 0x18]
	bl get_battle_strings_
	ldr r2, [r4]
	adds r0, r2, 0x4
	ldr r1, _08113704
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08113708
	mov r2, r9
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0x5
	strh r0, [r1, 0x1A]
	movs r0, 0x9
	strh r0, [r1, 0x1C]
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	strh r0, [r1, 0x18]
_08113682:
	ldr r5, _081136FC
	ldr r0, [r5]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _0811368E
	b _08113B3A
_0811368E:
	bl IsSEPlaying
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	beq _0811369C
	b _08113B3A
_0811369C:
	ldr r0, [r5]
	adds r0, 0x4
	movs r1, 0xD
	str r1, [sp]
	movs r1, 0x18
	movs r2, 0x8
	movs r3, 0x1D
	bl DrawTextWindow
	ldr r4, _0811370C
	strb r6, [r4, 0x1]
	ldr r2, [r5]
	adds r0, r2, 0x4
	ldr r1, _08113710
	adds r2, 0x34
	ldrb r2, [r2]
	adds r2, 0x80
	movs r3, 0x9
	str r3, [sp]
	movs r3, 0x19
	bl InitWindow
	ldr r0, [r5]
	adds r0, 0x4
	bl sub_8002F44
	ldr r1, _08113714
	ldr r3, _08113718
	movs r0, 0x20
	str r0, [sp]
	movs r0, 0
	movs r2, 0xC
	bl sub_814A5C0
	bl sub_81150D8
	ldr r0, _08113708
	mov r3, r9
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	movs r2, 0
	strh r0, [r1, 0x18]
	strb r2, [r4, 0x1]
	b _08113B3A
	.align 2, 0
_081136FC: .4byte gUnknown_03004828
_08113700: .4byte gUnknown_08400F8C
_08113704: .4byte gUnknown_020238CC
_08113708: .4byte gTasks
_0811370C: .4byte gUnknown_02024D1E
_08113710: .4byte gOtherText_YesNoAndPlayer
_08113714: .4byte 0x0000ffff
_08113718: .4byte 0x00002d9f
_0811371C:
	ldr r0, _081137CC
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08113742
	ldr r4, _081137D0
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _08113742
	movs r0, 0x5
	bl PlaySE
	bl nullsub_24
	movs r0, 0
	strb r0, [r4, 0x1]
	bl sub_81150D8
_08113742:
	ldr r0, _081137CC
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08113768
	ldr r4, _081137D0
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _08113768
	movs r0, 0x5
	bl PlaySE
	bl nullsub_24
	movs r0, 0x1
	strb r0, [r4, 0x1]
	bl sub_81150D8
_08113768:
	ldr r0, _081137CC
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0811380A
	ldr r4, _081137D4
	ldr r0, [r4]
	adds r0, 0x4
	movs r1, 0xD
	str r1, [sp]
	movs r1, 0x18
	movs r2, 0x8
	movs r3, 0x1D
	bl ZeroFillWindowRect
	bl sub_814A7FC
	ldr r0, _081137D8
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r2, [r4]
	adds r0, r2, 0x4
	ldr r1, _081137DC
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	movs r0, 0x5
	bl PlaySE
	ldr r0, _081137D0
	ldrb r2, [r0, 0x1]
	cmp r2, 0
	beq _081137E4
	ldr r0, _081137E0
	mov r2, r9
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1C]
	strh r0, [r1, 0x18]
	b _0811380A
	.align 2, 0
_081137CC: .4byte gMain
_081137D0: .4byte gUnknown_02024D1E
_081137D4: .4byte gUnknown_03004828
_081137D8: .4byte gUnknown_08400F8C
_081137DC: .4byte gUnknown_020238CC
_081137E0: .4byte gTasks
_081137E4:
	ldr r0, _08113868
	mov r3, r9
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1A]
	strh r0, [r1, 0x18]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _0811380A
	movs r0, 0x1
	negs r0, r0
	str r2, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_0811380A:
	ldr r0, _0811386C
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08113818
	b _08113B3A
_08113818:
	ldr r4, _08113870
	ldr r0, [r4]
	adds r0, 0x4
	movs r1, 0xD
	str r1, [sp]
	movs r1, 0x18
	movs r2, 0x8
	movs r3, 0x1D
	bl ZeroFillWindowRect
	bl sub_814A7FC
	ldr r0, _08113874
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r2, [r4]
	adds r0, r2, 0x4
	ldr r1, _08113878
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	movs r0, 0x5
	bl PlaySE
	ldr r1, _08113868
	mov r2, r9
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x1C]
	strh r1, [r0, 0x18]
	b _08113B3A
	.align 2, 0
_08113868: .4byte gTasks
_0811386C: .4byte gMain
_08113870: .4byte gUnknown_03004828
_08113874: .4byte gUnknown_08400F8C
_08113878: .4byte gUnknown_020238CC
_0811387C:
	ldr r0, _081138B8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0811388A
	b _08113B3A
_0811388A:
	ldr r0, _081138BC
	mov r3, r9
	adds r5, r3, r7
	lsls r5, 3
	adds r5, r6
	ldrh r1, [r5, 0x20]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _081138C0
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _081138C4
	ldr r4, _081138C8
	ldrh r4, [r4]
	str r4, [sp]
	bl sub_809D9F0
	ldrh r0, [r5, 0x18]
	adds r0, 0x1
	strh r0, [r5, 0x18]
	b _08113B3A
	.align 2, 0
_081138B8: .4byte gPaletteFade
_081138BC: .4byte gPlayerParty
_081138C0: .4byte gPlayerPartyCount
_081138C4: .4byte sub_8111E80
_081138C8: .4byte word_2024E82
_081138CC:
	ldr r0, _08113900
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _081138DA
	b _08113B3A
_081138DA:
	ldr r0, _08113904
	ldr r1, [r0, 0x4]
	ldr r0, _08113908
	cmp r1, r0
	beq _081138E6
	b _08113B3A
_081138E6:
	bl sub_809FA30
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x4
	bne _08113910
	ldr r0, _0811390C
	mov r2, r9
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0x9
	b _08113B38
	.align 2, 0
_08113900: .4byte gPaletteFade
_08113904: .4byte gMain
_08113908: .4byte sub_8112290
_0811390C: .4byte gTasks
_08113910:
	adds r1, r6, 0
	adds r1, 0xD
	mov r0, r8
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl sub_8040A00
	cmp r0, 0
	beq _08113970
	ldr r0, _0811395C
	ldr r3, _08113960
	adds r0, r3
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r0, _08113964
	ldr r2, [r0]
	adds r0, r2, 0x4
	ldr r1, _08113968
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _0811396C
	mov r2, r9
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	movs r1, 0xB
	strh r1, [r0, 0x18]
	b _08113B3A
	.align 2, 0
_0811395C: .4byte gUnknown_08400F8C
_08113960: .4byte 0x000004cc
_08113964: .4byte gUnknown_03004828
_08113968: .4byte gUnknown_020238CC
_0811396C: .4byte gTasks
_08113970:
	ldr r1, _081139D0
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	strb r4, [r1, 0x2]
	lsrs r0, r4, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	lsls r4, r6, 24
	lsrs r4, 24
	mov r0, r8
	adds r1, r4, 0
	bl RemoveMonPPBonus
	ldr r0, _081139D4
	ldrh r1, [r0]
	mov r0, r8
	adds r2, r4, 0
	bl SetMonMoveSlot
	ldr r0, _081139D8
	movs r3, 0xCF
	lsls r3, 2
	adds r0, r3
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r0, _081139DC
	ldr r2, [r0]
	adds r0, r2, 0x4
	ldr r1, _081139E0
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _081139E4
	mov r2, r9
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	b _08113B38
	.align 2, 0
_081139D0: .4byte gUnknown_03004290
_081139D4: .4byte word_2024E82
_081139D8: .4byte gUnknown_08400F8C
_081139DC: .4byte gUnknown_03004828
_081139E0: .4byte gUnknown_020238CC
_081139E4: .4byte gTasks
_081139E8:
	ldr r4, _08113A2C
	ldr r0, [r4]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _081139F4
	b _08113B3A
_081139F4:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08113A00
	b _08113B3A
_08113A00:
	ldr r0, _08113A30
	ldr r0, [r0, 0x1C]
	bl get_battle_strings_
	ldr r2, [r4]
	adds r0, r2, 0x4
	ldr r1, _08113A34
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08113A38
	mov r3, r9
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	b _08113B38
	.align 2, 0
_08113A2C: .4byte gUnknown_03004828
_08113A30: .4byte gUnknown_08400F8C
_08113A34: .4byte gUnknown_020238CC
_08113A38: .4byte gTasks
_08113A3C:
	ldr r4, _08113A80
	ldr r0, [r4]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	bne _08113B3A
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _08113B3A
	ldr r0, _08113A84
	movs r1, 0xD0
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r2, [r4]
	adds r0, r2, 0x4
	ldr r1, _08113A88
	adds r2, 0x34
	ldrb r2, [r2]
	movs r4, 0xF
	str r4, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _08113A8C
	mov r2, r9
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	strh r4, [r0, 0x8]
	b _08113B3A
	.align 2, 0
_08113A80: .4byte gUnknown_03004828
_08113A84: .4byte gUnknown_08400F8C
_08113A88: .4byte gUnknown_020238CC
_08113A8C: .4byte gTasks
_08113A90:
	ldr r0, _08113AC8
	ldr r0, [r0, 0x20]
	bl get_battle_strings_
	ldr r0, _08113ACC
	ldr r2, [r0]
	adds r0, r2, 0x4
	ldr r1, _08113AD0
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _08113AD4
	mov r3, r9
	adds r0, r3, r7
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	movs r1, 0xA
	strh r1, [r0, 0x1A]
	strh r2, [r0, 0x1C]
	movs r1, 0x3
	strh r1, [r0, 0x18]
	b _08113B3A
	.align 2, 0
_08113AC8: .4byte gUnknown_08400F8C
_08113ACC: .4byte gUnknown_03004828
_08113AD0: .4byte gUnknown_020238CC
_08113AD4: .4byte gTasks
_08113AD8:
	ldr r0, _08113B08
	ldr r0, [r0, 0x24]
	bl get_battle_strings_
	ldr r0, _08113B0C
	ldr r2, [r0]
	adds r0, r2, 0x4
	ldr r1, _08113B10
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _08113B14
	mov r2, r9
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	movs r1, 0xD
	strh r1, [r0, 0x8]
	b _08113B3A
	.align 2, 0
_08113B08: .4byte gUnknown_08400F8C
_08113B0C: .4byte gUnknown_03004828
_08113B10: .4byte gUnknown_020238CC
_08113B14: .4byte gTasks
_08113B18:
	ldr r0, _08113B48
	ldr r0, [r0]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	bne _08113B3A
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _08113B3A
	ldr r0, _08113B4C
	mov r3, r9
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0x5
_08113B38:
	strh r0, [r1, 0x18]
_08113B3A:
	add sp, 0x18
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08113B48: .4byte gUnknown_03004828
_08113B4C: .4byte gTasks
	thumb_func_end sub_8112FE8

	thumb_func_start unref_sub_8113B50
unref_sub_8113B50: @ 8113B50
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x3C
	str r0, [sp]
	str r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0xC]
	movs r1, 0
	str r1, [sp, 0x10]
	movs r2, 0
	str r2, [sp, 0x8]
	ldr r3, _08113C60
	mov r12, r3
	ldr r4, _08113C64
	add r4, r12
	mov r10, r4
	ldr r5, _08113C68
	add r5, r12
	mov r8, r5
_08113B7C:
	adds r0, r3, 0
	adds r0, 0x84
	ldr r1, [sp, 0x8]
	adds r0, r1, r0
	strb r2, [r0]
	adds r0, r3, 0x4
	adds r0, r1, r0
	strb r2, [r0]
	ldr r4, _08113C6C
	adds r0, r1, r4
	strb r2, [r0]
	movs r6, 0
	lsls r1, 5
	mov r9, r1
	ldr r5, [sp, 0x8]
	lsls r4, r5, 6
_08113B9C:
	mov r0, r9
	adds r1, r6, r0
	ldr r5, _08113C70
	adds r0, r1, r5
	strb r2, [r0]
	mov r5, r10
	adds r0, r1, r5
	strb r2, [r0]
	mov r5, r8
	adds r0, r1, r5
	strb r2, [r0]
	ldr r5, _08113C74
	adds r0, r1, r5
	strb r2, [r0]
	adds r7, r3, 0
	adds r7, 0xC4
	adds r0, r1, r7
	strb r2, [r0]
	ldr r5, _08113C78
	adds r0, r3, r5
	adds r0, r1, r0
	strb r2, [r0]
	ldr r5, _08113C7C
	adds r0, r3, r5
	adds r0, r1, r0
	strb r2, [r0]
	ldr r5, _08113C80
	adds r0, r3, r5
	adds r1, r0
	strb r2, [r1]
	lsls r1, r6, 1
	adds r1, r4
	ldr r5, _08113C84
	adds r0, r3, r5
	adds r0, r1, r0
	strh r2, [r0]
	ldr r5, _08113C88
	adds r0, r3, r5
	adds r0, r1, r0
	strh r2, [r0]
	ldr r5, _08113C8C
	adds r0, r3, r5
	adds r0, r1, r0
	strh r2, [r0]
	ldr r5, _08113C90
	adds r0, r3, r5
	adds r1, r0
	strh r2, [r1]
	adds r6, 0x1
	cmp r6, 0x1F
	ble _08113B9C
	ldr r0, [sp, 0x8]
	adds r0, 0x1
	str r0, [sp, 0x8]
	cmp r0, 0x3F
	ble _08113B7C
	ldr r1, _08113C94
	add r1, r12
	movs r0, 0x40
	strb r0, [r1]
	movs r1, 0
	mov r8, r1
	movs r2, 0
	str r2, [sp, 0x8]
	movs r3, 0x80
	lsls r3, 5
	adds r3, r7
	mov r12, r3
	movs r4, 0xC0
	lsls r4, 5
	adds r4, r7
	mov r9, r4
	movs r5, 0
	adds r4, r7, 0
	subs r4, 0xC0
_08113C32:
	movs r3, 0
	ldr r2, [sp]
	add r2, r8
	movs r6, 0
	ldr r0, [sp, 0x8]
	adds r0, 0x1
	str r0, [sp, 0x30]
	ldr r1, [sp, 0x8]
	lsls r1, 7
	mov r10, r1
	movs r7, 0x1
	negs r7, r7
_08113C4A:
	asrs r0, r6, 1
	lsls r0, 2
	add r0, r10
	ldr r1, _08113C98
	adds r0, r1
	str r2, [r0]
	cmp r3, 0
	beq _08113C9C
	cmp r3, 0x1
	beq _08113CC6
	b _08113CF4
	.align 2, 0
_08113C60: .4byte 0x02014800
_08113C64: .4byte 0x000018c4
_08113C68: .4byte 0x000020c4
_08113C6C: .4byte 0x02014844
_08113C70: .4byte 0x020158c4
_08113C74: .4byte 0x020170c4
_08113C78: .4byte 0x000008c4
_08113C7C: .4byte 0x000030c4
_08113C80: .4byte 0x000038c4
_08113C84: .4byte 0x000060c4
_08113C88: .4byte 0x000070c4
_08113C8C: .4byte 0x000080c4
_08113C90: .4byte 0x000090c4
_08113C94: .4byte 0x0000a0c4
_08113C98: .4byte 0x020188c4
_08113C9C:
	movs r0, 0x1
	ands r0, r6
	cmp r0, 0
	beq _08113CAA
	cmp r0, 0x1
	beq _08113CB0
	b _08113CF4
_08113CAA:
	ldrb r1, [r2]
	movs r0, 0xF
	b _08113CB4
_08113CB0:
	ldrb r1, [r2]
	movs r0, 0xF0
_08113CB4:
	ands r0, r1
	cmp r0, 0
	beq _08113CF4
	ldrb r0, [r4]
	adds r0, r5
	add r0, r12
	strb r6, [r0]
	movs r3, 0x1
	b _08113CF4
_08113CC6:
	adds r0, r6, 0
	ands r0, r3
	cmp r0, 0
	beq _08113CD4
	cmp r0, 0x1
	beq _08113CDA
	b _08113CF4
_08113CD4:
	ldrb r1, [r2]
	movs r0, 0xF
	b _08113CDE
_08113CDA:
	ldrb r1, [r2]
	movs r0, 0xF0
_08113CDE:
	ands r0, r1
	cmp r0, 0
	bne _08113CF4
	ldrb r0, [r4]
	adds r0, r5
	add r0, r9
	strb r7, [r0]
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	movs r3, 0
_08113CF4:
	adds r0, r6, 0x1
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _08113D02
	adds r2, 0x1D
	b _08113D0C
_08113D02:
	movs r0, 0x1
	ands r0, r6
	cmp r0, 0
	beq _08113D0C
	adds r2, 0x1
_08113D0C:
	adds r7, 0x1
	adds r6, 0x1
	cmp r6, 0x3F
	ble _08113C4A
	cmp r3, 0
	beq _08113D26
	ldrb r0, [r4]
	adds r0, r5
	add r0, r9
	strb r6, [r0]
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_08113D26:
	movs r0, 0x7
	ldr r2, [sp, 0x30]
	ands r2, r0
	cmp r2, 0
	bne _08113D36
	movs r3, 0xE4
	add r8, r3
	b _08113D3A
_08113D36:
	movs r0, 0x4
	add r8, r0
_08113D3A:
	adds r5, 0x20
	adds r4, 0x1
	ldr r1, [sp, 0x8]
	adds r1, 0x1
	str r1, [sp, 0x8]
	cmp r1, 0x3F
	bgt _08113D4A
	b _08113C32
_08113D4A:
	movs r2, 0
	mov r8, r2
	movs r3, 0
	str r3, [sp, 0x8]
	ldr r0, _08113D84
	movs r4, 0x82
	lsls r4, 6
	adds r4, r0
	mov r10, r4
	movs r5, 0xA2
	lsls r5, 6
	adds r7, r0, r5
	movs r5, 0
	adds r4, r0, 0
	movs r0, 0x1
	mov r9, r0
_08113D6A:
	movs r3, 0
	ldr r2, [sp, 0x4]
	add r2, r8
	movs r6, 0
	ldr r1, [sp, 0x8]
	adds r1, 0x1
	str r1, [sp, 0x30]
_08113D78:
	cmp r3, 0
	beq _08113D88
	cmp r3, 0x1
	beq _08113DB4
	b _08113DE4
	.align 2, 0
_08113D84: .4byte 0x02014844
_08113D88:
	adds r0, r6, 0
	mov r1, r9
	ands r0, r1
	cmp r0, 0
	beq _08113D98
	cmp r0, 0x1
	beq _08113D9E
	b _08113DE4
_08113D98:
	ldrb r1, [r2]
	movs r0, 0xF
	b _08113DA2
_08113D9E:
	ldrb r1, [r2]
	movs r0, 0xF0
_08113DA2:
	ands r0, r1
	cmp r0, 0
	beq _08113DE4
	ldrb r0, [r4]
	adds r0, r5
	add r0, r10
	strb r6, [r0]
	movs r3, 0x1
	b _08113DE4
_08113DB4:
	adds r0, r6, 0
	ands r0, r3
	cmp r0, 0
	beq _08113DC2
	cmp r0, 0x1
	beq _08113DC8
	b _08113DE4
_08113DC2:
	ldrb r1, [r2]
	movs r0, 0xF
	b _08113DCC
_08113DC8:
	ldrb r1, [r2]
	movs r0, 0xF0
_08113DCC:
	ands r0, r1
	cmp r0, 0
	bne _08113DE4
	ldrb r0, [r4]
	adds r0, r5
	adds r0, r7
	subs r1, r6, 0x1
	strb r1, [r0]
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	movs r3, 0
_08113DE4:
	adds r1, r6, 0x1
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _08113DF2
	adds r2, 0x1D
	b _08113DFC
_08113DF2:
	mov r0, r9
	ands r6, r0
	cmp r6, 0
	beq _08113DFC
	adds r2, 0x1
_08113DFC:
	adds r6, r1, 0
	cmp r6, 0x3F
	ble _08113D78
	cmp r3, 0
	beq _08113E14
	ldrb r0, [r4]
	adds r0, r5
	adds r0, r7
	strb r6, [r0]
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_08113E14:
	movs r0, 0x7
	ldr r1, [sp, 0x30]
	ands r1, r0
	cmp r1, 0
	bne _08113E24
	movs r2, 0xE4
	add r8, r2
	b _08113E28
_08113E24:
	movs r3, 0x4
	add r8, r3
_08113E28:
	adds r5, 0x20
	adds r4, 0x1
	ldr r0, [sp, 0x8]
	adds r0, 0x1
	str r0, [sp, 0x8]
	cmp r0, 0x3F
	ble _08113D6A
	movs r1, 0
	str r1, [sp, 0x8]
_08113E3A:
	ldr r3, [sp, 0x8]
	ldr r4, _08113EBC
	adds r2, r3, r4
	ldr r5, _08113EC0
	adds r1, r3, r5
	ldrb r0, [r2]
	adds r3, 0x1
	str r3, [sp, 0x30]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08113E52
	b _08113F9E
_08113E52:
	movs r0, 0
	str r0, [sp, 0xC]
	ldrb r2, [r2]
	cmp r0, r2
	bge _08113F54
	ldr r0, _08113EC4
	adds r0, 0x4
	ldr r1, [sp, 0x8]
	adds r0, r1, r0
	str r0, [sp, 0x18]
_08113E66:
	movs r2, 0x80
	lsls r2, 1
	str r2, [sp, 0x14]
	movs r6, 0
	ldr r3, [sp, 0x8]
	ldr r4, _08113EC0
	adds r0, r3, r4
	ldr r5, [sp, 0xC]
	adds r5, 0x1
	str r5, [sp, 0x34]
	ldrb r0, [r0]
	cmp r6, r0
	bge _08113F3E
	ldr r0, _08113EC4
	mov r10, r0
	lsls r0, r3, 5
	ldr r2, [sp, 0xC]
	adds r1, r2, r0
	mov r9, r0
	ldr r0, _08113EC4
	adds r0, 0xC4
	mov r3, r9
	adds r7, r3, r0
	mov r5, r9
	ldr r4, _08113EC4
	ldr r2, _08113EC8
	adds r0, r4, r2
	adds r1, r0
	mov r8, r1
	ldrb r3, [r1]
	str r3, [sp, 0x1C]
_08113EA4:
	ldr r0, _08113ECC
	add r0, r10
	adds r0, r5, r0
	ldr r4, [sp, 0x1C]
	ldrb r1, [r0]
	cmp r4, r1
	bls _08113ED0
	mov r2, r8
	ldrb r1, [r2]
	ldrb r0, [r0]
	b _08113ED6
	.align 2, 0
_08113EBC: .4byte 0x02014804
_08113EC0: .4byte 0x02014844
_08113EC4: .4byte 0x02014800
_08113EC8: .4byte 0x000010c4
_08113ECC: .4byte 0x000020c4
_08113ED0:
	ldrb r1, [r0]
	mov r3, r8
	ldrb r0, [r3]
_08113ED6:
	subs r3, r1, r0
	ldr r1, [sp, 0xC]
	add r1, r9
	ldr r0, _08113EFC
	add r0, r10
	adds r4, r1, r0
	ldr r0, _08113F00
	add r0, r10
	adds r2, r5, r0
	ldrb r0, [r4]
	ldr r1, _08113F04
	mov r12, r1
	ldrb r1, [r2]
	cmp r0, r1
	bls _08113F08
	adds r1, r0, 0
	ldrb r0, [r2]
	b _08113F0C
	.align 2, 0
_08113EFC: .4byte 0x000018c4
_08113F00: .4byte 0x000028c4
_08113F04: .4byte 0x02014800
_08113F08:
	ldrb r1, [r2]
	ldrb r0, [r4]
_08113F0C:
	subs r1, r0
	adds r3, r1
	ldr r2, [sp, 0x14]
	cmp r2, r3
	ble _08113F2C
	ldrb r0, [r7]
	cmp r0, 0
	bne _08113F2C
	ldr r0, _08114050
	add r0, r12
	adds r0, r5, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _08113F2C
	str r6, [sp, 0x10]
	str r3, [sp, 0x14]
_08113F2C:
	adds r7, 0x1
	adds r5, 0x1
	adds r6, 0x1
	ldr r3, [sp, 0x8]
	ldr r4, _08114054
	adds r0, r3, r4
	ldrb r0, [r0]
	cmp r6, r0
	blt _08113EA4
_08113F3E:
	ldr r0, [sp, 0xC]
	ldr r1, [sp, 0x10]
	ldr r2, [sp, 0x8]
	bl sub_81141F0
	ldr r5, [sp, 0x34]
	str r5, [sp, 0xC]
	ldr r0, [sp, 0x18]
	ldrb r0, [r0]
	cmp r5, r0
	blt _08113E66
_08113F54:
	movs r6, 0
	ldr r2, _08114058
	ldr r1, [sp, 0x8]
	ldr r3, _08114054
	adds r0, r1, r3
	adds r4, r2, 0
	mov r12, r4
	ldrb r0, [r0]
	cmp r6, r0
	bge _08113F9E
	mov r0, r12
	adds r0, 0x44
	adds r4, r1, r0
_08113F6E:
	ldr r5, [sp, 0x8]
	lsls r0, r5, 5
	adds r1, r6, r0
	adds r0, r2, 0
	adds r0, 0xC4
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _08113F94
	ldr r3, _08114050
	adds r0, r2, r3
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _08113F94
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_811430C
_08113F94:
	adds r6, 0x1
	ldr r2, _08114058
	ldrb r5, [r4]
	cmp r6, r5
	blt _08113F6E
_08113F9E:
	ldr r0, [sp, 0x8]
	ldr r1, _0811405C
	adds r2, r0, r1
	ldr r3, _08114054
	adds r1, r0, r3
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08113FCC
	movs r6, 0
	ldrb r4, [r2]
	cmp r6, r4
	bge _08113FCC
	adds r4, r2, 0
_08113FBA:
	adds r0, r6, 0
	adds r1, r6, 0
	ldr r2, [sp, 0x8]
	bl sub_81141F0
	adds r6, 0x1
	ldrb r5, [r4]
	cmp r6, r5
	blt _08113FBA
_08113FCC:
	ldr r0, [sp, 0x8]
	ldr r1, _0811405C
	adds r2, r0, r1
	ldr r3, _08114054
	adds r1, r0, r3
	ldrb r0, [r2]
	ldr r4, _08114058
	ldrb r5, [r1]
	cmp r0, r5
	bhi _08113FE2
	b _081141C4
_08113FE2:
	movs r0, 0
	str r0, [sp, 0x10]
	ldrb r1, [r1]
	cmp r0, r1
	blt _08113FEE
	b _08114104
_08113FEE:
	str r2, [sp, 0x2C]
	ldr r1, [sp, 0x8]
	lsls r1, 5
	mov r9, r1
	adds r0, r4, 0
	adds r0, 0x44
	ldr r2, [sp, 0x8]
	adds r0, r2, r0
	str r0, [sp, 0x20]
	mov r3, r9
	str r3, [sp, 0x24]
_08114004:
	movs r4, 0x80
	lsls r4, 1
	str r4, [sp, 0x14]
	movs r6, 0
	ldr r5, [sp, 0x10]
	adds r5, 0x1
	str r5, [sp, 0x38]
	ldr r0, [sp, 0x2C]
	ldrb r0, [r0]
	cmp r6, r0
	bge _081140C4
	ldr r1, [sp, 0x10]
	ldr r2, [sp, 0x24]
	adds r1, r2
	mov r10, r1
	ldr r0, _08114058
	adds r0, 0xC4
	adds r2, r0
	mov r8, r2
	ldr r7, [sp, 0x24]
	ldr r3, _08114058
	ldr r4, _08114060
	adds r0, r3, r4
	adds r5, r7, r0
	ldr r0, _08114064
	add r0, r10
	mov r12, r0
	ldrb r1, [r0]
	str r1, [sp, 0x28]
_0811403E:
	ldrb r0, [r5]
	ldr r2, [sp, 0x28]
	cmp r0, r2
	bls _08114068
	adds r1, r0, 0
	mov r3, r12
	ldrb r0, [r3]
	b _0811406E
	.align 2, 0
_08114050: .4byte 0x000008c4
_08114054: .4byte 0x02014844
_08114058: .4byte 0x02014800
_0811405C: .4byte 0x02014804
_08114060: .4byte 0x000010c4
_08114064: .4byte 0x020168c4
_08114068:
	mov r4, r12
	ldrb r1, [r4]
	ldrb r0, [r5]
_0811406E:
	subs r3, r1, r0
	ldr r1, _0811408C
	ldr r2, _08114090
	adds r0, r1, r2
	adds r4, r7, r0
	ldr r2, _08114094
	add r2, r10
	ldrb r0, [r4]
	ldrb r1, [r2]
	cmp r0, r1
	bls _08114098
	adds r1, r0, 0
	ldrb r0, [r2]
	b _0811409C
	.align 2, 0
_0811408C: .4byte 0x02014800
_08114090: .4byte 0x000018c4
_08114094: .4byte 0x020170c4
_08114098:
	ldrb r1, [r2]
	ldrb r0, [r4]
_0811409C:
	subs r1, r0
	adds r3, r1
	ldr r2, [sp, 0x14]
	cmp r2, r3
	ble _081140B2
	mov r4, r8
	ldrb r0, [r4]
	cmp r0, 0
	bne _081140B2
	str r6, [sp, 0xC]
	str r3, [sp, 0x14]
_081140B2:
	movs r0, 0x1
	add r8, r0
	adds r7, 0x1
	adds r5, 0x1
	adds r6, 0x1
	ldr r1, [sp, 0x2C]
	ldrb r1, [r1]
	cmp r6, r1
	blt _0811403E
_081140C4:
	ldr r3, [sp, 0xC]
	add r3, r9
	ldr r2, _08114164
	ldr r4, _08114168
	adds r1, r2, r4
	adds r1, r3, r1
	ldr r2, [sp, 0x10]
	add r2, r9
	ldr r5, _0811416C
	adds r0, r2, r5
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08114164
	ldr r4, _08114170
	adds r1, r0, r4
	adds r1, r3, r1
	ldr r5, _08114174
	adds r2, r5
	ldrb r0, [r2]
	strb r0, [r1]
	ldr r0, _08114164
	adds r0, 0xC4
	adds r3, r0
	movs r0, 0x1
	strb r0, [r3]
	ldr r0, [sp, 0x38]
	str r0, [sp, 0x10]
	ldr r1, [sp, 0x20]
	ldrb r1, [r1]
	cmp r0, r1
	bge _08114104
	b _08114004
_08114104:
	movs r6, 0
	ldr r4, _08114164
	ldr r2, [sp, 0x8]
	ldr r3, _08114178
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r6, r0
	bge _081141C4
	adds r7, r4, 0
	mov r9, r6
	movs r5, 0xC4
	adds r5, r7
	mov r8, r5
_0811411E:
	ldr r1, [sp, 0x8]
	lsls r0, r1, 5
	adds r2, r6, r0
	ldr r3, _0811417C
	adds r0, r7, r3
	adds r0, r2
	mov r10, r0
	ldr r5, _08114168
	adds r0, r7, r5
	adds r0, r2, r0
	ldrb r0, [r0]
	mov r1, r10
	strb r0, [r1]
	ldr r3, _08114180
	adds r0, r7, r3
	adds r3, r2, r0
	ldr r5, _08114170
	adds r0, r7, r5
	adds r0, r2, r0
	ldrb r0, [r0]
	strb r0, [r3]
	mov r0, r8
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _08114184
	mov r2, r9
	strb r2, [r1]
	adds r0, r6, 0
	adds r1, r6, 0
	ldr r2, [sp, 0x8]
	bl sub_81141F0
	b _081141B4
	.align 2, 0
_08114164: .4byte 0x02014800
_08114168: .4byte 0x000030c4
_0811416C: .4byte 0x020168c4
_08114170: .4byte 0x000038c4
_08114174: .4byte 0x020170c4
_08114178: .4byte 0x02014804
_0811417C: .4byte 0x000020c4
_08114180: .4byte 0x000028c4
_08114184:
	ldr r5, _081141E0
	adds r1, r4, r5
	adds r1, r2, r1
	ldr r5, _081141E4
	adds r0, r4, r5
	adds r0, r2, r0
	ldrb r0, [r0]
	ldrb r2, [r1]
	subs r0, r2
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r2, r0
	strb r2, [r3]
	mov r0, r10
	strb r2, [r0]
	ldrb r0, [r3]
	subs r0, 0x1
	strb r0, [r3]
	adds r0, r6, 0
	adds r1, r6, 0
	ldr r2, [sp, 0x8]
	bl sub_81141F0
_081141B4:
	adds r6, 0x1
	ldr r4, _081141E8
	ldr r1, [sp, 0x8]
	ldr r2, _081141EC
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r6, r0
	blt _0811411E
_081141C4:
	ldr r3, [sp, 0x30]
	str r3, [sp, 0x8]
	cmp r3, 0x3F
	bgt _081141CE
	b _08113E3A
_081141CE:
	add sp, 0x3C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081141E0: .4byte 0x000010c4
_081141E4: .4byte 0x000018c4
_081141E8: .4byte 0x02014800
_081141EC: .4byte 0x02014804
	thumb_func_end unref_sub_8113B50

	thumb_func_start sub_81141F0
sub_81141F0: @ 81141F0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r6, r0, 0
	mov r8, r1
	mov r9, r2
	ldr r3, _0811424C
	lsls r1, r2, 5
	mov r0, r8
	adds r4, r0, r1
	ldr r5, _08114250
	adds r2, r3, r5
	adds r2, r4, r2
	adds r1, r6, r1
	ldr r7, _08114254
	adds r0, r3, r7
	adds r5, r1, r0
	ldrb r0, [r5]
	strb r0, [r2]
	ldr r0, _08114258
	adds r2, r3, r0
	adds r2, r4, r2
	ldr r7, _0811425C
	adds r0, r3, r7
	adds r1, r0
	ldrb r0, [r1]
	strb r0, [r2]
	movs r7, 0
	ldr r1, _08114260
	adds r0, r3, r1
	adds r2, r4, r0
	ldrb r1, [r5]
	ldrb r0, [r2]
	mov r12, r3
	cmp r1, r0
	bcs _08114264
	mov r0, r12
	adds r0, 0xC4
	adds r0, r4, r0
	movs r1, 0x4
	strb r1, [r0]
	ldrb r1, [r2]
	ldrb r0, [r5]
	b _08114276
	.align 2, 0
_0811424C: .4byte 0x02014800
_08114250: .4byte 0x000030c4
_08114254: .4byte 0x000010c4
_08114258: .4byte 0x000038c4
_0811425C: .4byte 0x000018c4
_08114260: .4byte 0x000020c4
_08114264:
	cmp r1, r0
	bls _08114278
	mov r0, r12
	adds r0, 0xC4
	adds r0, r4, r0
	movs r1, 0x1
	strb r1, [r0]
	ldrb r1, [r5]
	ldrb r0, [r2]
_08114276:
	subs r7, r1, r0
_08114278:
	mov r5, r8
	lsls r3, r5, 1
	mov r0, r9
	lsls r4, r0, 6
	adds r0, r3, r4
	ldr r1, _081142BC
	add r1, r12
	adds r0, r1
	lsls r1, r7, 4
	strh r1, [r0]
	movs r7, 0
	mov r1, r9
	lsls r2, r1, 5
	adds r1, r6, r2
	ldr r0, _081142C0
	add r0, r12
	adds r6, r1, r0
	adds r1, r5, r2
	ldr r0, _081142C4
	add r0, r12
	adds r5, r1, r0
	ldrb r2, [r6]
	ldrb r0, [r5]
	cmp r2, r0
	bcs _081142CC
	ldr r0, _081142C8
	add r0, r12
	adds r0, r1, r0
	movs r1, 0x3
	strb r1, [r0]
	ldrb r1, [r5]
	ldrb r0, [r6]
	b _081142DE
	.align 2, 0
_081142BC: .4byte 0x000080c4
_081142C0: .4byte 0x000018c4
_081142C4: .4byte 0x000028c4
_081142C8: .4byte 0x000008c4
_081142CC:
	cmp r2, r0
	bls _081142E0
	ldr r0, _08114304
	add r0, r12
	adds r0, r1, r0
	movs r1, 0x2
	strb r1, [r0]
	ldrb r1, [r6]
	ldrb r0, [r5]
_081142DE:
	subs r7, r1, r0
_081142E0:
	adds r0, r3, r4
	ldr r1, _08114308
	add r1, r12
	adds r0, r1
	lsls r1, r7, 4
	strh r1, [r0]
	mov r1, r12
	adds r1, 0x84
	add r1, r9
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08114304: .4byte 0x000008c4
_08114308: .4byte 0x000090c4
	thumb_func_end sub_81141F0

	thumb_func_start sub_811430C
sub_811430C: @ 811430C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r5, _081143AC
	lsls r4, r1, 5
	adds r4, r0, r4
	ldr r2, _081143B0
	adds r2, r5
	mov r10, r2
	add r10, r4
	mov r3, r10
	ldrb r2, [r3]
	ldr r6, _081143B4
	adds r6, r5
	mov r8, r6
	add r8, r4
	mov r6, r8
	ldrb r3, [r6]
	subs r7, r2, r3
	ldr r2, _081143B8
	adds r6, r5, r2
	adds r6, r4, r6
	ldr r2, _081143BC
	adds r2, r5
	mov r9, r2
	add r9, r4
	lsrs r2, r7, 31
	adds r2, r7, r2
	asrs r2, 1
	adds r3, r2
	mov r2, r9
	strb r3, [r2]
	strb r3, [r6]
	adds r2, r5, 0
	adds r2, 0xC4
	adds r2, r4, r2
	movs r3, 0x5
	strb r3, [r2]
	ldr r3, _081143C0
	adds r2, r5, r3
	adds r4, r2
	movs r2, 0x7
	strb r2, [r4]
	adds r3, r5, 0
	adds r3, 0x84
	adds r3, r1, r3
	ldrb r2, [r3]
	adds r2, 0x1
	strb r2, [r3]
	ldrb r3, [r6]
	mov r4, r8
	ldrb r2, [r4]
	subs r7, r3, r2
	lsls r0, 1
	lsls r1, 6
	adds r0, r1
	ldr r6, _081143C4
	adds r1, r5, r6
	adds r1, r0, r1
	lsls r2, r7, 4
	strh r2, [r1]
	mov r1, r10
	ldrb r2, [r1]
	mov r3, r9
	ldrb r1, [r3]
	subs r7, r2, r1
	ldr r4, _081143C8
	adds r5, r4
	adds r0, r5
	lsls r1, r7, 4
	strh r1, [r0]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081143AC: .4byte 0x02014800
_081143B0: .4byte 0x000028c4
_081143B4: .4byte 0x000020c4
_081143B8: .4byte 0x000030c4
_081143BC: .4byte 0x000038c4
_081143C0: .4byte 0x000008c4
_081143C4: .4byte 0x000080c4
_081143C8: .4byte 0x000090c4
	thumb_func_end sub_811430C

	thumb_func_start unref_sub_81143CC
unref_sub_81143CC: @ 81143CC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	movs r0, 0x1
	str r0, [sp, 0x4]
	ldr r0, _08114408
	ldr r2, _0811440C
	adds r1, r0, r2
	ldrb r3, [r1]
	adds r4, r0, 0
	cmp r3, 0
	beq _081143EE
	subs r0, r3, 0x1
	strb r0, [r1]
_081143EE:
	movs r5, 0
	str r5, [sp]
_081143F2:
	movs r3, 0
	adds r2, r4, 0
	adds r0, r4, 0
	adds r0, 0x84
	ldr r1, [sp]
	adds r0, r1, r0
	adds r1, 0x1
	str r1, [sp, 0x8]
	bl _08114D84
	.align 2, 0
_08114408: .4byte 0x02014800
_0811440C: .4byte 0x0000a0c4
_08114410:
	ldr r5, [sp]
	lsls r0, r5, 5
	adds r1, r3, r0
	adds r2, 0xC4
	adds r1, r2
	ldrb r2, [r1]
	mov r8, r0
	adds r0, r3, 0x1
	mov r10, r0
	cmp r2, 0xC
	bls _08114428
	b _081148D2
_08114428:
	lsls r0, r2, 2
	ldr r1, _08114434
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08114434: .4byte _08114438
	.align 2, 0
_08114438:
	.4byte _081148D2
	.4byte _0811446C
	.4byte _081144F0
	.4byte _0811457C
	.4byte _08114600
	.4byte _0811468C
	.4byte _081146C8
	.4byte _08114704
	.4byte _08114740
	.4byte _0811477C
	.4byte _081147D0
	.4byte _08114810
	.4byte _08114858
_0811446C:
	movs r1, 0
	str r1, [sp, 0x4]
	lsls r0, r3, 1
	ldr r2, [sp]
	lsls r1, r2, 6
	adds r0, r1
	ldr r5, _081144E0
	adds r2, r4, r5
	adds r2, r0, r2
	ldr r5, _081144E4
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	adds r1, r3, 0x1
	mov r10, r1
	ldr r2, [sp, 0x4]
	cmp r2, r5
	blt _081144A6
	b _081148D2
_081144A6:
	mov r9, r4
	mov r4, r8
	adds r7, r3, r4
	ldr r0, _081144E8
	add r0, r9
	adds r4, r7, r0
	ldr r0, _081144EC
	add r0, r9
	adds r2, r7, r0
_081144B8:
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	ldrb r1, [r4]
	ldr r0, [sp]
	str r2, [sp, 0xC]
	str r3, [sp, 0x10]
	bl sub_8114DB4
	ldrb r0, [r4]
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	ldrb r1, [r2]
	cmp r0, r1
	bne _081144D8
	b _081148A0
_081144D8:
	adds r6, 0x1
	cmp r6, r5
	blt _081144B8
	b _081148D2
	.align 2, 0
_081144E0: .4byte 0x000060c4
_081144E4: .4byte 0x000080c4
_081144E8: .4byte 0x000030c4
_081144EC: .4byte 0x000020c4
_081144F0:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r4, _08114568
	lsls r0, r3, 1
	ldr r5, [sp]
	lsls r1, r5, 6
	adds r0, r1
	ldr r1, _0811456C
	adds r2, r4, r1
	adds r2, r0, r2
	ldr r5, _08114570
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	adds r1, r3, 0x1
	mov r10, r1
	ldr r2, [sp, 0x4]
	cmp r2, r5
	blt _0811452C
	b _081148D2
_0811452C:
	mov r9, r4
	mov r4, r8
	adds r7, r3, r4
	ldr r0, _08114574
	add r0, r9
	adds r4, r7, r0
	ldr r0, _08114578
	add r0, r9
	adds r2, r7, r0
_0811453E:
	ldrb r0, [r4]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08114548
	b _081148B8
_08114548:
	adds r1, r0, 0
	ldr r0, [sp]
	str r2, [sp, 0xC]
	str r3, [sp, 0x10]
	bl sub_8114DF0
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	adds r6, 0x1
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	cmp r6, r5
	blt _0811453E
	b _081148D2
	.align 2, 0
_08114568: .4byte 0x02014800
_0811456C: .4byte 0x000060c4
_08114570: .4byte 0x000080c4
_08114574: .4byte 0x000030c4
_08114578: .4byte 0x000020c4
_0811457C:
	movs r2, 0
	str r2, [sp, 0x4]
	lsls r0, r3, 1
	ldr r5, [sp]
	lsls r1, r5, 6
	adds r0, r1
	ldr r1, _081145F0
	adds r2, r4, r1
	adds r2, r0, r2
	ldr r5, _081145F4
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	adds r1, r3, 0x1
	mov r10, r1
	ldr r2, [sp, 0x4]
	cmp r2, r5
	blt _081145B6
	b _081148D2
_081145B6:
	mov r9, r4
	mov r4, r8
	adds r7, r3, r4
	ldr r0, _081145F8
	add r0, r9
	adds r4, r7, r0
	ldr r0, _081145FC
	add r0, r9
	adds r2, r7, r0
_081145C8:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldrb r1, [r4]
	ldr r0, [sp]
	str r2, [sp, 0xC]
	str r3, [sp, 0x10]
	bl sub_8114DB4
	ldrb r0, [r4]
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	ldrb r1, [r2]
	cmp r0, r1
	bne _081145E8
	b _081148AC
_081145E8:
	adds r6, 0x1
	cmp r6, r5
	blt _081145C8
	b _081148D2
	.align 2, 0
_081145F0: .4byte 0x000060c4
_081145F4: .4byte 0x000080c4
_081145F8: .4byte 0x000030c4
_081145FC: .4byte 0x000020c4
_08114600:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r4, _08114678
	lsls r0, r3, 1
	ldr r5, [sp]
	lsls r1, r5, 6
	adds r0, r1
	ldr r1, _0811467C
	adds r2, r4, r1
	adds r2, r0, r2
	ldr r5, _08114680
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	adds r1, r3, 0x1
	mov r10, r1
	ldr r2, [sp, 0x4]
	cmp r2, r5
	blt _0811463C
	b _081148D2
_0811463C:
	mov r9, r4
	mov r4, r8
	adds r7, r3, r4
	ldr r0, _08114684
	add r0, r9
	adds r4, r7, r0
	ldr r0, _08114688
	add r0, r9
	adds r2, r7, r0
_0811464E:
	ldrb r0, [r4]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08114658
	b _081148B8
_08114658:
	adds r1, r0, 0
	ldr r0, [sp]
	str r2, [sp, 0xC]
	str r3, [sp, 0x10]
	bl sub_8114DF0
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	adds r6, 0x1
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	cmp r6, r5
	blt _0811464E
	b _081148D2
	.align 2, 0
_08114678: .4byte 0x02014800
_0811467C: .4byte 0x000060c4
_08114680: .4byte 0x000080c4
_08114684: .4byte 0x000030c4
_08114688: .4byte 0x000020c4
_0811468C:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r5, _081146C0
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _081146C4
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114E48
	lsls r0, 24
	ldr r3, [sp, 0x10]
	adds r2, r3, 0x1
	mov r10, r2
	cmp r0, 0
	bne _081146B4
	b _081148D2
_081146B4:
	adds r0, r5, 0
	adds r0, 0xC4
	adds r0, r4, r0
	movs r1, 0x9
	strb r1, [r0]
	b _081148D2
	.align 2, 0
_081146C0: .4byte 0x02014800
_081146C4: .4byte 0x000030c4
_081146C8:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r5, _081146FC
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _08114700
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114E48
	lsls r0, 24
	ldr r3, [sp, 0x10]
	adds r2, r3, 0x1
	mov r10, r2
	cmp r0, 0
	bne _081146F0
	b _081148D2
_081146F0:
	adds r0, r5, 0
	adds r0, 0xC4
	adds r0, r4, r0
	movs r1, 0xA
	strb r1, [r0]
	b _081148D2
	.align 2, 0
_081146FC: .4byte 0x02014800
_08114700: .4byte 0x000030c4
_08114704:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r5, _08114738
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _0811473C
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114E48
	lsls r0, 24
	ldr r3, [sp, 0x10]
	adds r2, r3, 0x1
	mov r10, r2
	cmp r0, 0
	bne _0811472C
	b _081148D2
_0811472C:
	adds r0, r5, 0
	adds r0, 0xC4
	adds r0, r4, r0
	movs r1, 0xB
	strb r1, [r0]
	b _081148D2
	.align 2, 0
_08114738: .4byte 0x02014800
_0811473C: .4byte 0x000030c4
_08114740:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r5, _08114774
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _08114778
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114E48
	lsls r0, 24
	ldr r3, [sp, 0x10]
	adds r2, r3, 0x1
	mov r10, r2
	cmp r0, 0
	bne _08114768
	b _081148D2
_08114768:
	adds r0, r5, 0
	adds r0, 0xC4
	adds r0, r4, r0
	movs r1, 0xC
	strb r1, [r0]
	b _081148D2
	.align 2, 0
_08114774: .4byte 0x02014800
_08114778: .4byte 0x000030c4
_0811477C:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r6, _081147B4
	mov r0, r8
	adds r5, r3, r0
	ldr r1, _081147B8
	adds r4, r6, r1
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114DB4
	ldr r2, _081147BC
	adds r0, r6, r2
	adds r0, r5, r0
	ldrb r1, [r4]
	ldr r3, [sp, 0x10]
	ldrb r0, [r0]
	cmp r1, r0
	bne _081147C0
	adds r0, r6, 0
	adds r0, 0xC4
	adds r0, r5, r0
	mov r4, sp
	ldrb r4, [r4, 0x4]
	strb r4, [r0]
	b _08114844
	.align 2, 0
_081147B4: .4byte 0x02014800
_081147B8: .4byte 0x000030c4
_081147BC: .4byte 0x000020c4
_081147C0:
	adds r0, r6, 0
	adds r0, 0xC4
	adds r0, r5, r0
	movs r1, 0x1
	strb r1, [r0]
	adds r0, r3, 0x1
	mov r10, r0
	b _081148D2
_081147D0:
	movs r1, 0
	str r1, [sp, 0x4]
	ldr r6, _08114804
	mov r2, r8
	adds r5, r3, r2
	ldr r0, _08114808
	adds r4, r6, r0
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114DF0
	ldr r1, _0811480C
	adds r0, r6, r1
	adds r0, r5, r0
	ldrb r1, [r4]
	ldr r3, [sp, 0x10]
	ldrb r0, [r0]
	cmp r1, r0
	beq _08114882
	adds r0, r6, 0
	adds r0, 0xC4
	adds r0, r5, r0
	movs r1, 0x2
	b _08114842
	.align 2, 0
_08114804: .4byte 0x02014800
_08114808: .4byte 0x000030c4
_0811480C: .4byte 0x000020c4
_08114810:
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r6, _0811484C
	mov r1, r8
	adds r5, r3, r1
	ldr r2, _08114850
	adds r4, r6, r2
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114DB4
	ldr r1, _08114854
	adds r0, r6, r1
	adds r0, r5, r0
	ldrb r1, [r4]
	ldr r3, [sp, 0x10]
	ldrb r0, [r0]
	cmp r1, r0
	beq _08114882
	adds r0, r6, 0
	adds r0, 0xC4
	adds r0, r5, r0
	movs r1, 0x3
_08114842:
	strb r1, [r0]
_08114844:
	adds r5, r3, 0x1
	mov r10, r5
	b _081148D2
	.align 2, 0
_0811484C: .4byte 0x02014800
_08114850: .4byte 0x000030c4
_08114854: .4byte 0x000020c4
_08114858:
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r6, _08114894
	mov r1, r8
	adds r5, r3, r1
	ldr r2, _08114898
	adds r4, r6, r2
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114DF0
	ldr r1, _0811489C
	adds r0, r6, r1
	adds r0, r5, r0
	ldrb r1, [r4]
	ldr r3, [sp, 0x10]
	ldrb r0, [r0]
	cmp r1, r0
	bne _081148C4
_08114882:
	adds r0, r6, 0
	adds r0, 0xC4
	adds r0, r5, r0
	mov r2, sp
	ldrb r2, [r2, 0x4]
	strb r2, [r0]
	adds r4, r3, 0x1
	mov r10, r4
	b _081148D2
	.align 2, 0
_08114894: .4byte 0x02014800
_08114898: .4byte 0x000030c4
_0811489C: .4byte 0x000020c4
_081148A0:
	mov r0, r9
	adds r0, 0xC4
	adds r0, r7, r0
	movs r5, 0
	strb r5, [r0]
	b _081148D2
_081148AC:
	mov r0, r9
	adds r0, 0xC4
	adds r0, r7, r0
	movs r1, 0
	strb r1, [r0]
	b _081148D2
_081148B8:
	mov r0, r9
	adds r0, 0xC4
	adds r0, r7, r0
	movs r1, 0
	strb r1, [r0]
	b _081148D2
_081148C4:
	adds r0, r6, 0
	adds r0, 0xC4
	adds r0, r5, r0
	movs r1, 0x4
	strb r1, [r0]
	adds r2, r3, 0x1
	mov r10, r2
_081148D2:
	ldr r0, _081148F4
	mov r4, r8
	adds r1, r3, r4
	ldr r5, _081148F8
	adds r2, r0, r5
	adds r1, r2
	ldrb r1, [r1]
	adds r4, r0, 0
	cmp r1, 0xC
	bls _081148E8
	b _08114D76
_081148E8:
	lsls r0, r1, 2
	ldr r1, _081148FC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081148F4: .4byte 0x02014800
_081148F8: .4byte 0x000008c4
_081148FC: .4byte _08114900
	.align 2, 0
_08114900:
	.4byte _08114D76
	.4byte _08114934
	.4byte _081149B8
	.4byte _08114A3C
	.4byte _08114AC0
	.4byte _08114B44
	.4byte _08114B7C
	.4byte _08114BB4
	.4byte _08114BEC
	.4byte _08114C24
	.4byte _08114C78
	.4byte _08114CB8
	.4byte _08114CF8
_08114934:
	movs r0, 0
	str r0, [sp, 0x4]
	lsls r0, r3, 1
	ldr r2, [sp]
	lsls r1, r2, 6
	adds r0, r1
	ldr r5, _081149A8
	adds r2, r4, r5
	adds r2, r0, r2
	ldr r5, _081149AC
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	ldr r1, [sp, 0x4]
	cmp r1, r5
	blt _0811496A
	b _08114D76
_0811496A:
	mov r9, r4
	mov r2, r8
	adds r7, r3, r2
	ldr r0, _081149B0
	add r0, r9
	adds r4, r7, r0
	movs r3, 0
	ldr r0, _081149B4
	add r0, r9
	adds r2, r7, r0
_0811497E:
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	ldrb r1, [r4]
	ldr r0, [sp]
	str r2, [sp, 0xC]
	str r3, [sp, 0x10]
	bl sub_8114DB4
	ldrb r0, [r4]
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	ldrb r1, [r2]
	cmp r0, r1
	bne _0811499E
	b _08114D4C
_0811499E:
	adds r6, 0x1
	cmp r6, r5
	blt _0811497E
	b _08114D76
	.align 2, 0
_081149A8: .4byte 0x000070c4
_081149AC: .4byte 0x000090c4
_081149B0: .4byte 0x000038c4
_081149B4: .4byte 0x000028c4
_081149B8:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r4, _08114A28
	lsls r0, r3, 1
	ldr r5, [sp]
	lsls r1, r5, 6
	adds r0, r1
	ldr r1, _08114A2C
	adds r2, r4, r1
	adds r2, r0, r2
	ldr r5, _08114A30
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	ldr r1, [sp, 0x4]
	cmp r1, r5
	blt _081149F0
	b _08114D76
_081149F0:
	mov r9, r4
	mov r2, r8
	adds r7, r3, r2
	ldr r0, _08114A34
	add r0, r9
	adds r4, r7, r0
	ldr r0, _08114A38
	add r0, r9
	adds r2, r7, r0
_08114A02:
	ldrb r0, [r4]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08114A0C
	b _08114D3C
_08114A0C:
	adds r1, r0, 0
	ldr r0, [sp]
	str r2, [sp, 0xC]
	bl sub_8114DF0
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	adds r6, 0x1
	ldr r2, [sp, 0xC]
	cmp r6, r5
	blt _08114A02
	b _08114D76
	.align 2, 0
_08114A28: .4byte 0x02014800
_08114A2C: .4byte 0x000070c4
_08114A30: .4byte 0x000090c4
_08114A34: .4byte 0x000038c4
_08114A38: .4byte 0x000028c4
_08114A3C:
	movs r2, 0
	str r2, [sp, 0x4]
	lsls r0, r3, 1
	ldr r5, [sp]
	lsls r1, r5, 6
	adds r0, r1
	ldr r1, _08114AB0
	adds r2, r4, r1
	adds r2, r0, r2
	ldr r5, _08114AB4
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	ldr r1, [sp, 0x4]
	cmp r1, r5
	blt _08114A72
	b _08114D76
_08114A72:
	mov r9, r4
	mov r2, r8
	adds r7, r3, r2
	ldr r0, _08114AB8
	add r0, r9
	adds r4, r7, r0
	movs r3, 0
	ldr r0, _08114ABC
	add r0, r9
	adds r2, r7, r0
_08114A86:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldrb r1, [r4]
	ldr r0, [sp]
	str r2, [sp, 0xC]
	str r3, [sp, 0x10]
	bl sub_8114DB4
	ldrb r0, [r4]
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08114AA6
	b _08114D4C
_08114AA6:
	adds r6, 0x1
	cmp r6, r5
	blt _08114A86
	b _08114D76
	.align 2, 0
_08114AB0: .4byte 0x000070c4
_08114AB4: .4byte 0x000090c4
_08114AB8: .4byte 0x000038c4
_08114ABC: .4byte 0x000028c4
_08114AC0:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r4, _08114B30
	lsls r0, r3, 1
	ldr r5, [sp]
	lsls r1, r5, 6
	adds r0, r1
	ldr r1, _08114B34
	adds r2, r4, r1
	adds r2, r0, r2
	ldr r5, _08114B38
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	ldr r1, [sp, 0x4]
	cmp r1, r5
	blt _08114AF8
	b _08114D76
_08114AF8:
	mov r9, r4
	mov r2, r8
	adds r7, r3, r2
	ldr r0, _08114B3C
	add r0, r9
	adds r4, r7, r0
	ldr r0, _08114B40
	add r0, r9
	adds r2, r7, r0
_08114B0A:
	ldrb r0, [r4]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08114B14
	b _08114D5C
_08114B14:
	adds r1, r0, 0
	ldr r0, [sp]
	str r2, [sp, 0xC]
	bl sub_8114DF0
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	adds r6, 0x1
	ldr r2, [sp, 0xC]
	cmp r6, r5
	blt _08114B0A
	b _08114D76
	.align 2, 0
_08114B30: .4byte 0x02014800
_08114B34: .4byte 0x000070c4
_08114B38: .4byte 0x000090c4
_08114B3C: .4byte 0x000038c4
_08114B40: .4byte 0x000028c4
_08114B44:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r5, _08114B70
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _08114B74
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	bl sub_8114E48
	lsls r0, 24
	cmp r0, 0
	bne _08114B64
	b _08114D76
_08114B64:
	ldr r2, _08114B78
	adds r0, r5, r2
	adds r0, r4, r0
	movs r1, 0x9
	b _08114D74
	.align 2, 0
_08114B70: .4byte 0x02014800
_08114B74: .4byte 0x000038c4
_08114B78: .4byte 0x000008c4
_08114B7C:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r5, _08114BA8
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _08114BAC
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	bl sub_8114E48
	lsls r0, 24
	cmp r0, 0
	bne _08114B9C
	b _08114D76
_08114B9C:
	ldr r2, _08114BB0
	adds r0, r5, r2
	adds r0, r4, r0
	movs r1, 0xA
	b _08114D74
	.align 2, 0
_08114BA8: .4byte 0x02014800
_08114BAC: .4byte 0x000038c4
_08114BB0: .4byte 0x000008c4
_08114BB4:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r5, _08114BE0
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _08114BE4
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	bl sub_8114E48
	lsls r0, 24
	cmp r0, 0
	bne _08114BD4
	b _08114D76
_08114BD4:
	ldr r2, _08114BE8
	adds r0, r5, r2
	adds r0, r4, r0
	movs r1, 0xB
	b _08114D74
	.align 2, 0
_08114BE0: .4byte 0x02014800
_08114BE4: .4byte 0x000038c4
_08114BE8: .4byte 0x000008c4
_08114BEC:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r5, _08114C18
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _08114C1C
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	bl sub_8114E48
	lsls r0, 24
	cmp r0, 0
	bne _08114C0C
	b _08114D76
_08114C0C:
	ldr r2, _08114C20
	adds r0, r5, r2
	adds r0, r4, r0
	movs r1, 0xC
	b _08114D74
	.align 2, 0
_08114C18: .4byte 0x02014800
_08114C1C: .4byte 0x000038c4
_08114C20: .4byte 0x000008c4
_08114C24:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r6, _08114C58
	mov r0, r8
	adds r5, r3, r0
	ldr r1, _08114C5C
	adds r4, r6, r1
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	bl sub_8114DB4
	ldr r2, _08114C60
	adds r0, r6, r2
	adds r0, r5, r0
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _08114C68
	ldr r4, _08114C64
	adds r0, r6, r4
	adds r0, r5, r0
	mov r5, sp
	ldrb r5, [r5, 0x4]
	strb r5, [r0]
	b _08114D76
	.align 2, 0
_08114C58: .4byte 0x02014800
_08114C5C: .4byte 0x000038c4
_08114C60: .4byte 0x000028c4
_08114C64: .4byte 0x000008c4
_08114C68:
	ldr r1, _08114C74
	adds r0, r6, r1
	adds r0, r5, r0
	movs r1, 0x1
	b _08114D74
	.align 2, 0
_08114C74: .4byte 0x000008c4
_08114C78:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r6, _08114CA8
	mov r4, r8
	adds r5, r3, r4
	ldr r0, _08114CAC
	adds r4, r6, r0
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	bl sub_8114DF0
	ldr r1, _08114CB0
	adds r0, r6, r1
	adds r0, r5, r0
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	beq _08114D1E
	ldr r1, _08114CB4
	adds r0, r6, r1
	adds r0, r5, r0
	movs r1, 0x2
	b _08114D74
	.align 2, 0
_08114CA8: .4byte 0x02014800
_08114CAC: .4byte 0x000038c4
_08114CB0: .4byte 0x000028c4
_08114CB4: .4byte 0x000008c4
_08114CB8:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r6, _08114CE8
	mov r4, r8
	adds r5, r3, r4
	ldr r0, _08114CEC
	adds r4, r6, r0
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	bl sub_8114DB4
	ldr r1, _08114CF0
	adds r0, r6, r1
	adds r0, r5, r0
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	beq _08114D1E
	ldr r1, _08114CF4
	adds r0, r6, r1
	adds r0, r5, r0
	movs r1, 0x3
	b _08114D74
	.align 2, 0
_08114CE8: .4byte 0x02014800
_08114CEC: .4byte 0x000038c4
_08114CF0: .4byte 0x000028c4
_08114CF4: .4byte 0x000008c4
_08114CF8:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r6, _08114D2C
	mov r4, r8
	adds r5, r3, r4
	ldr r0, _08114D30
	adds r4, r6, r0
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	bl sub_8114DF0
	ldr r1, _08114D34
	adds r0, r6, r1
	adds r0, r5, r0
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _08114D6C
_08114D1E:
	ldr r2, _08114D38
	adds r0, r6, r2
	adds r0, r5, r0
	mov r4, sp
	ldrb r4, [r4, 0x4]
	strb r4, [r0]
	b _08114D76
	.align 2, 0
_08114D2C: .4byte 0x02014800
_08114D30: .4byte 0x000038c4
_08114D34: .4byte 0x000028c4
_08114D38: .4byte 0x000008c4
_08114D3C:
	ldr r0, _08114D48
	add r0, r9
	adds r0, r7, r0
	movs r1, 0
	b _08114D74
	.align 2, 0
_08114D48: .4byte 0x000008c4
_08114D4C:
	ldr r0, _08114D58
	add r0, r9
	adds r0, r7, r0
	strb r3, [r0]
	b _08114D76
	.align 2, 0
_08114D58: .4byte 0x000008c4
_08114D5C:
	ldr r0, _08114D68
	add r0, r9
	adds r0, r7, r0
	movs r1, 0
	b _08114D74
	.align 2, 0
_08114D68: .4byte 0x000008c4
_08114D6C:
	ldr r1, _08114DAC
	adds r0, r6, r1
	adds r0, r5, r0
	movs r1, 0x4
_08114D74:
	strb r1, [r0]
_08114D76:
	mov r3, r10
	ldr r2, _08114DB0
	adds r0, r2, 0
	adds r0, 0x84
	ldr r4, [sp]
	adds r0, r4, r0
	adds r4, r2, 0
_08114D84:
	ldrb r0, [r0]
	cmp r3, r0
	bge _08114D8E
	bl _08114410
_08114D8E:
	ldr r5, [sp, 0x8]
	str r5, [sp]
	cmp r5, 0x3F
	bgt _08114D9A
	bl _081143F2
_08114D9A:
	ldr r0, [sp, 0x4]
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08114DAC: .4byte 0x000008c4
_08114DB0: .4byte 0x02014800
	thumb_func_end unref_sub_81143CC

	thumb_func_start sub_8114DB4
sub_8114DB4: @ 8114DB4
	push {lr}
	lsls r1, 24
	lsrs r3, r1, 24
	ldr r2, _08114DDC
	lsrs r1, 25
	lsls r1, 2
	lsls r0, 7
	adds r1, r0
	ldr r0, _08114DE0
	adds r2, r0
	adds r1, r2
	ldr r2, [r1]
	movs r0, 0x1
	ands r3, r0
	cmp r3, 0
	beq _08114DE4
	ldrb r0, [r2]
	movs r1, 0xF0
	b _08114DE8
	.align 2, 0
_08114DDC: .4byte 0x02014800
_08114DE0: .4byte 0x000040c4
_08114DE4:
	ldrb r0, [r2]
	movs r1, 0xF
_08114DE8:
	orrs r0, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	thumb_func_end sub_8114DB4

	thumb_func_start sub_8114DF0
sub_8114DF0: @ 8114DF0
	push {lr}
	lsls r1, 24
	lsrs r3, r1, 24
	ldr r2, _08114E28
	lsrs r1, 25
	lsls r1, 2
	lsls r0, 7
	adds r1, r0
	ldr r0, _08114E2C
	adds r2, r0
	adds r1, r2
	ldr r2, [r1]
	movs r0, 0xC0
	lsls r0, 7
	adds r1, r2, r0
	movs r0, 0x1
	ands r3, r0
	cmp r3, 0
	beq _08114E30
	ldrb r1, [r1]
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0
	bne _08114E42
	ldrb r1, [r2]
	movs r0, 0xF
	b _08114E3E
	.align 2, 0
_08114E28: .4byte 0x02014800
_08114E2C: .4byte 0x000040c4
_08114E30:
	ldrb r1, [r1]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _08114E42
	ldrb r1, [r2]
	movs r0, 0xF0
_08114E3E:
	ands r0, r1
	strb r0, [r2]
_08114E42:
	pop {r0}
	bx r0
	thumb_func_end sub_8114DF0

	thumb_func_start sub_8114E48
sub_8114E48: @ 8114E48
	push {r4-r7,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r1, _08114E6C
	ldr r2, _08114E70
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r5, r1, 0
	cmp r0, 0
	bne _08114E60
	b _08114F5E
_08114E60:
	movs r1, 0
	movs r3, 0
	cmp r4, 0
	bne _08114E74
	movs r1, 0x1
	b _08114EA6
	.align 2, 0
_08114E6C: .4byte 0x02014800
_08114E70: .4byte 0x0000a0c4
_08114E74:
	subs r0, r4, 0x1
	lsls r0, 5
	adds r2, r3, r0
	adds r0, r5, 0
	adds r0, 0xC4
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _08114EA6
	ldr r7, _08114EC4
	adds r0, r5, r7
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _08114EA6
	adds r3, 0x1
	cmp r3, 0x1F
	bgt _08114EA6
	cmp r4, 0
	bne _08114E74
	lsls r0, r1, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r1, r0, 24
_08114EA6:
	cmp r3, 0x20
	bne _08114EB4
	lsls r0, r1, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r1, r0, 24
_08114EB4:
	movs r3, 0
	cmp r4, 0x3F
	bne _08114EC8
	lsls r0, r1, 24
	movs r7, 0x80
	lsls r7, 17
	adds r0, r7
	b _08114EF8
	.align 2, 0
_08114EC4: .4byte 0x000008c4
_08114EC8:
	adds r0, r4, 0x1
	lsls r0, 5
	adds r2, r3, r0
	adds r0, r5, 0
	adds r0, 0xC4
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _08114EFA
	ldr r7, _08114F64
	adds r0, r5, r7
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _08114EFA
	adds r3, 0x1
	cmp r3, 0x1F
	bgt _08114EFA
	cmp r4, 0x3F
	bne _08114EC8
	lsls r0, r1, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
_08114EF8:
	lsrs r1, r0, 24
_08114EFA:
	cmp r3, 0x20
	bne _08114F08
	lsls r0, r1, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r1, r0, 24
_08114F08:
	cmp r1, 0x2
	beq _08114F5E
	subs r0, r6, 0x2
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r0, 0
	bge _08114F18
	movs r1, 0
_08114F18:
	adds r0, r6, 0x2
	lsls r0, 24
	lsrs r2, r0, 24
	asrs r0, 24
	cmp r0, 0x3F
	ble _08114F26
	movs r2, 0x3F
_08114F26:
	lsls r1, 24
	asrs r3, r1, 24
	lsls r0, r2, 24
	asrs r2, r0, 24
	adds r6, r1, 0
	adds r7, r0, 0
	cmp r3, r2
	bge _08114F7C
	cmp r4, 0
	beq _08114F7C
	subs r0, r4, 0x1
	lsls r5, r0, 7
	ldr r0, _08114F68
	mov r12, r0
_08114F42:
	asrs r0, r3, 1
	lsls r0, 2
	adds r0, r5
	add r0, r12
	ldr r1, [r0]
	movs r0, 0x1
	ands r0, r3
	cmp r0, 0
	beq _08114F6C
	ldrb r1, [r1]
	movs r0, 0xF0
_08114F58:
	ands r0, r1
	cmp r0, 0
	beq _08114F72
_08114F5E:
	movs r0, 0x1
	b _08114FCA
	.align 2, 0
_08114F64: .4byte 0x000008c4
_08114F68: .4byte 0x020188c4
_08114F6C:
	ldrb r1, [r1]
	movs r0, 0xF
	b _08114F58
_08114F72:
	adds r3, 0x1
	cmp r3, r2
	bge _08114F7C
	cmp r4, 0
	bne _08114F42
_08114F7C:
	asrs r3, r6, 24
	asrs r1, r7, 24
	cmp r3, r1
	bge _08114FC8
	cmp r4, 0x3F
	beq _08114FC8
	adds r0, r4, 0x1
	lsls r5, r0, 7
	ldr r6, _08114FB0
	adds r2, r1, 0
_08114F90:
	asrs r0, r3, 1
	lsls r0, 2
	adds r0, r5
	adds r0, r6
	ldr r1, [r0]
	movs r0, 0x1
	ands r0, r3
	cmp r0, 0
	beq _08114FB4
	ldrb r1, [r1]
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0
	beq _08114FBE
	b _08114F5E
	.align 2, 0
_08114FB0: .4byte 0x020188c4
_08114FB4:
	ldrb r1, [r1]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _08114F5E
_08114FBE:
	adds r3, 0x1
	cmp r3, r2
	bge _08114FC8
	cmp r4, 0x3F
	bne _08114F90
_08114FC8:
	movs r0, 0
_08114FCA:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8114E48

	thumb_func_start nullsub_73
nullsub_73: @ 8114FD0
	bx lr
	thumb_func_end nullsub_73

	thumb_func_start sub_8114FD4
sub_8114FD4: @ 8114FD4
	push {lr}
	ldr r1, _08115034
	ldr r2, _08115038
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x8
	ldr r0, _0811503C
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _08115040
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _08115044
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _08115048
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0811504C
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _08115050
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _08115054
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _08115058
	ldrh r0, [r0]
	strh r0, [r1]
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_8089668
	pop {r0}
	bx r0
	.align 2, 0
_08115034: .4byte REG_BG0CNT
_08115038: .4byte 0x00009803
_0811503C: .4byte gUnknown_030042A4
_08115040: .4byte gUnknown_030042A0
_08115044: .4byte gUnknown_030042C0
_08115048: .4byte gUnknown_030041B4
_0811504C: .4byte gUnknown_03004288
_08115050: .4byte gUnknown_03004280
_08115054: .4byte gUnknown_030041B0
_08115058: .4byte gUnknown_030041B8
	thumb_func_end sub_8114FD4

	thumb_func_start sub_811505C
sub_811505C: @ 811505C
	push {lr}
	ldr r1, _081150B4
	ldr r0, _081150B8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081150BC
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081150C0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081150C4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081150C8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081150CC
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081150D0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081150D4
	ldrh r0, [r0]
	strh r0, [r1]
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_8089668
	pop {r0}
	bx r0
	.align 2, 0
_081150B4: .4byte REG_BG0HOFS
_081150B8: .4byte gUnknown_030042A4
_081150BC: .4byte gUnknown_030042A0
_081150C0: .4byte gUnknown_030042C0
_081150C4: .4byte gUnknown_030041B4
_081150C8: .4byte gUnknown_03004288
_081150CC: .4byte gUnknown_03004280
_081150D0: .4byte gUnknown_030041B0
_081150D4: .4byte gUnknown_030041B8
	thumb_func_end sub_811505C

	thumb_func_start sub_81150D8
sub_81150D8: @ 81150D8
	push {lr}
	ldr r0, _081150F4
	ldrb r1, [r0, 0x1]
	lsls r1, 28
	movs r0, 0x90
	lsls r0, 23
	adds r1, r0
	lsrs r1, 24
	movs r0, 0xC8
	bl sub_814A880
	pop {r0}
	bx r0
	.align 2, 0
_081150F4: .4byte gUnknown_02024D1E
	thumb_func_end sub_81150D8

	thumb_func_start nullsub_24
nullsub_24: @ 81150F8
	bx lr
	thumb_func_end nullsub_24

	thumb_func_start sub_81150FC
sub_81150FC: @ 81150FC
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	ldr r0, _08115120
	adds r1, r0, 0
	adds r1, 0xB8
	ldrb r0, [r1]
	cmp r0, 0
	beq _0811511C
	adds r0, r1, 0
	bl task_tutorial_controls_fadein
_0811511C:
	pop {r0}
	bx r0
	.align 2, 0
_08115120: .4byte 0x02019000
	thumb_func_end sub_81150FC

	thumb_func_start sub_8115124
sub_8115124: @ 8115124
	push {r4,lr}
	sub sp, 0x4
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_8117434
	ldr r2, _08115188
	ldr r3, _0811518C
	ldrh r1, [r3, 0x26]
	movs r4, 0x80
	lsls r4, 2
	adds r0, r4, 0
	subs r0, r1
	strh r0, [r2]
	ldrb r0, [r3, 0x1]
	cmp r0, 0
	beq _08115154
	ldr r1, _08115190
	ldrh r0, [r3, 0x34]
	strh r0, [r1]
_08115154:
	movs r1, 0x2A
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _08115170
	ldr r1, _08115194
	ldr r0, _08115198
	str r0, [r1]
	ldr r0, _0811519C
	str r0, [r1, 0x4]
	ldr r0, _081151A0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0
	strh r0, [r3, 0x2A]
_08115170:
	movs r2, 0x28
	ldrsh r0, [r3, r2]
	cmp r0, 0x1
	beq _081151A4
	cmp r0, 0x1
	ble _0811521A
	cmp r0, 0x2
	beq _081151D4
	cmp r0, 0xFF
	beq _081151F8
	b _0811521A
	.align 2, 0
_08115188: .4byte REG_BG1HOFS
_0811518C: .4byte 0x02019000
_08115190: .4byte REG_BLDALPHA
_08115194: .4byte 0x040000d4
_08115198: .4byte gBG1TilemapBuffer + 0x1C0
_0811519C: .4byte 0x060021c0
_081151A0: .4byte 0x800001a0
_081151A4:
	ldr r1, _081151C4
	movs r4, 0xF8
	lsls r4, 5
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0xCC
	ldr r0, _081151C8
	str r0, [r1]
	ldr r0, _081151CC
	str r0, [r1, 0x4]
	ldr r0, _081151D0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0x2
	b _08115218
	.align 2, 0
_081151C4: .4byte REG_BG0CNT
_081151C8: .4byte gBG2TilemapBuffer + 0x1C0
_081151CC: .4byte 0x0600f9c0
_081151D0: .4byte 0x800001a0
_081151D4:
	ldr r1, _081151E8
	ldr r0, _081151EC
	str r0, [r1]
	ldr r0, _081151F0
	str r0, [r1, 0x4]
	ldr r0, _081151F4
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	b _0811521A
	.align 2, 0
_081151E8: .4byte 0x040000d4
_081151EC: .4byte gBG2TilemapBuffer + 0x1C0
_081151F0: .4byte 0x0600f9c0
_081151F4: .4byte 0x800001a0
_081151F8:
	ldr r1, _08115224
	ldr r2, _08115228
	adds r0, r2, 0
	strh r0, [r1]
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0811522C
	mov r4, sp
	str r4, [r1]
	ldr r0, _08115230
	str r0, [r1, 0x4]
	ldr r0, _08115234
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0
_08115218:
	strh r0, [r3, 0x28]
_0811521A:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08115224: .4byte REG_BG0CNT
_08115228: .4byte 0x00001f08
_0811522C: .4byte 0x040000d4
_08115230: .4byte 0x0600f9c0
_08115234: .4byte 0x810001a0
	thumb_func_end sub_8115124

	thumb_func_start sub_8115238
sub_8115238: @ 8115238
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r1, _081152C0
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	ldr r5, _081152C4
	movs r2, 0xBE
	lsls r2, 1
	adds r0, r5, 0
	movs r1, 0
	bl memset
	ldr r0, _081152C8
	ldrh r2, [r0]
	movs r0, 0x1
	ands r0, r2
	ldrb r1, [r5, 0x4]
	movs r3, 0x4
	negs r3, r3
	ands r3, r1
	orrs r3, r0
	strb r3, [r5, 0x4]
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _08115276
	movs r0, 0x80
	orrs r3, r0
	strb r3, [r5, 0x4]
_08115276:
	ldr r3, _081152CC
	ldrb r2, [r5, 0x4]
	lsls r1, r2, 30
	lsrs r0, r1, 25
	adds r0, r3
	ldrb r0, [r0, 0x3]
	adds r4, r5, 0
	adds r4, 0x22
	strb r0, [r4]
	lsrs r0, r1, 25
	adds r0, r3
	ldrb r0, [r0, 0x4]
	adds r3, r5, 0
	adds r3, 0x23
	strb r0, [r3]
	ldr r0, _081152D0
	lsrs r1, 30
	lsls r2, 24
	lsrs r2, 31
	lsls r2, 1
	adds r1, r2
	adds r1, r0
	ldrb r2, [r1]
	strb r2, [r5, 0x19]
	ldrb r1, [r5, 0x1A]
	movs r0, 0xF
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r5, 0x1A]
	cmp r2, 0x1
	bne _081152DC
	ldr r4, _081152D4
	ldr r3, _081152D8
	mov r0, sp
	ldrh r2, [r0]
	b _081152E4
	.align 2, 0
_081152C0: .4byte gUnknown_083F8EC4
_081152C4: .4byte 0x02019000
_081152C8: .4byte gUnknown_0202E8CC
_081152CC: .4byte gUnknown_083F8DF4
_081152D0: .4byte gUnknown_083F8DF0
_081152D4: .4byte gPlttBufferUnfaded
_081152D8: .4byte gPlttBufferFaded
_081152DC:
	ldr r4, _08115348
	ldr r3, _0811534C
	mov r0, sp
	ldrh r2, [r0, 0x2]
_081152E4:
	adds r0, r3, 0
	adds r0, 0xA2
	strh r2, [r0]
	ldr r1, _08115350
	adds r0, r1, 0
	ands r0, r2
	strh r0, [r3]
	ands r0, r1
	adds r2, r4, 0
	adds r2, 0xA2
	strh r0, [r2]
	ands r0, r1
	strh r0, [r4]
	ldr r0, _08115354
	bl sub_8124918
	movs r4, 0
	ldr r5, _08115358
_08115308:
	lsls r2, r4, 3
	adds r2, r5
	ldr r0, _08115354
	adds r1, r4, 0
	bl sub_812492C
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xC
	bls _08115308
	movs r4, 0
	ldr r5, _0811535C
_08115322:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _08115360
	adds r0, r1
	movs r1, 0x41
	bl GetMonData
	adds r1, r0, 0
	movs r0, 0x98
	lsls r0, 1
	cmp r1, r0
	beq _08115364
	adds r0, 0x2
	cmp r1, r0
	bne _0811536C
	ldrb r0, [r5, 0x2]
	movs r1, 0x1
	b _08115368
	.align 2, 0
_08115348: .4byte gPlttBufferUnfaded
_0811534C: .4byte gPlttBufferFaded
_08115350: .4byte 0x0000ffff
_08115354: .4byte 0x020190b8
_08115358: .4byte gUnknown_083F8E34
_0811535C: .4byte 0x02019000
_08115360: .4byte gPlayerParty
_08115364:
	ldrb r0, [r5, 0x2]
	movs r1, 0x2
_08115368:
	orrs r0, r1
	strb r0, [r5, 0x2]
_0811536C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _08115322
	bl RtcCalcLocalTime
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8115238

	thumb_func_start sub_8115384
sub_8115384: @ 8115384
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _081153A4
	ldr r2, _081153A8
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x7
	bls _08115398
	b _081155FE
_08115398:
	lsls r0, 2
	ldr r1, _081153AC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081153A4: .4byte gMain
_081153A8: .4byte 0x0000043c
_081153AC: .4byte _081153B0
	.align 2, 0
_081153B0:
	.4byte _081153D0
	.4byte _08115444
	.4byte _08115460
	.4byte _08115494
	.4byte _081154CC
	.4byte _081154FC
	.4byte _0811556C
	.4byte _0811558C
_081153D0:
	movs r0, 0
	bl SetVBlankCallback
	bl remove_some_task
	bl sub_80F9438
	bl sub_80F9368
	ldr r1, _08115420
	ldr r3, _08115424
	adds r0, r3, 0
	strh r0, [r1]
	subs r1, 0x2
	ldr r2, _08115428
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x46
	movs r3, 0x90
	lsls r3, 6
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0811542C
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08115430
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08115434
	ldr r1, _08115438
	bl LZ77UnCompVram
	ldr r1, _0811543C
	ldr r3, _08115440
	adds r1, r3
	b _0811557A
	.align 2, 0
_08115420: .4byte REG_BG2CNT
_08115424: .4byte 0x00004686
_08115428: .4byte 0x00004401
_0811542C: .4byte 0x0000060a
_08115430: .4byte gUnknown_08E8096C
_08115434: .4byte gUnknown_08E81098
_08115438: .4byte 0x06004000
_0811543C: .4byte gMain
_08115440: .4byte 0x0000043c
_08115444:
	bl ResetPaletteFade
	bl ResetSpriteData
	bl ResetTasks
	ldr r1, _08115458
	ldr r0, _0811545C
	adds r1, r0
	b _0811557A
	.align 2, 0
_08115458: .4byte gMain
_0811545C: .4byte 0x0000043c
_08115460:
	ldr r0, _08115480
	bl SetUpWindowConfig
	ldr r0, _08115484
	bl InitMenuWindow
	ldr r0, _08115488
	movs r2, 0xE0
	lsls r2, 1
	movs r1, 0
	bl LoadPalette
	ldr r1, _0811548C
	ldr r2, _08115490
	adds r1, r2
	b _0811557A
	.align 2, 0
_08115480: .4byte gWindowConfig_81E6C3C
_08115484: .4byte gWindowConfig_81E6CE4
_08115488: .4byte gUnknown_083F86BC
_0811548C: .4byte gMain
_08115490: .4byte 0x0000043c
_08115494:
	bl sub_8115238
	bl sub_80F9020
	ldr r0, _081154B4
	ldr r1, _081154B8
	bl LZ77UnCompWram
	ldr r0, _081154BC
	ldr r1, _081154C0
	bl LZ77UnCompVram
	ldr r1, _081154C4
	ldr r3, _081154C8
	adds r1, r3
	b _0811557A
	.align 2, 0
_081154B4: .4byte gUnknown_083F88BC
_081154B8: .4byte 0x02018800
_081154BC: .4byte gUnknown_083F8A60
_081154C0: .4byte 0x06003000
_081154C4: .4byte gMain
_081154C8: .4byte 0x0000043c
_081154CC:
	movs r0, 0
	bl sub_8117838
	bl sub_811857C
	bl sub_81184D8
	bl sub_8117F2C
	bl sub_8117900
	bl sub_8117BBC
	bl sub_8117DF4
	ldr r1, _081154F4
	ldr r0, _081154F8
	adds r1, r0
	b _0811557A
	.align 2, 0
_081154F4: .4byte gMain
_081154F8: .4byte 0x0000043c
_081154FC:
	bl AnimateSprites
	bl BuildOamBuffer
	ldr r0, _08115550
	ldr r1, _08115554
	adds r0, r1
	ldrh r0, [r0]
	bl sub_81180F4
	movs r0, 0x6
	bl sub_81182F8
	movs r0, 0
	bl sub_811829C
	movs r0, 0
	bl sub_8117158
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08115558
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _0811555C
	movs r2, 0x3C
	negs r2, r2
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08115560
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08115564
	ldr r3, _08115568
	adds r1, r3
	b _0811557A
	.align 2, 0
_08115550: .4byte gSaveBlock1
_08115554: .4byte 0x00000494
_08115558: .4byte gUnknown_081C4157
_0811555C: .4byte gSpriteCoordOffsetX
_08115560: .4byte gSpriteCoordOffsetY
_08115564: .4byte gMain
_08115568: .4byte 0x0000043c
_0811556C:
	movs r1, 0x80
	lsls r1, 19
	ldr r3, _08115584
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _08115588
	adds r1, r2, r0
_0811557A:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _081155FE
	.align 2, 0
_08115584: .4byte 0x00001741
_08115588: .4byte 0x0000043c
_0811558C:
	ldr r3, _08115608
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _0811560C
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08115610
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08115614
	bl SetVBlankCallback
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginHardwarePaletteFade
	ldr r0, _08115618
	movs r1, 0
	bl CreateTask
	ldr r4, _0811561C
	adds r1, r4, 0
	adds r1, 0xA4
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08115620
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x6
	strh r0, [r1, 0x14]
	ldr r0, _08115624
	ldr r2, _08115628
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r1, 0x22]
	ldr r0, _0811562C
	movs r1, 0x1
	bl CreateTask
	adds r4, 0xA5
	strb r0, [r4]
	ldr r0, _08115630
	bl SetMainCallback2
_081155FE:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08115608: .4byte 0x04000208
_0811560C: .4byte 0x04000200
_08115610: .4byte REG_DISPSTAT
_08115614: .4byte sub_8115124
_08115618: .4byte sub_81156BC
_0811561C: .4byte 0x02019000
_08115620: .4byte gTasks
_08115624: .4byte gSaveBlock1
_08115628: .4byte 0x00000494
_0811562C: .4byte sub_8115634
_08115630: .4byte sub_81150FC
	thumb_func_end sub_8115384

	thumb_func_start sub_8115634
sub_8115634: @ 8115634
	push {r4-r6,lr}
	ldr r0, _081156B8
	adds r3, r0, 0
	adds r3, 0x21
	ldrb r1, [r3]
	adds r2, r1, 0x1
	strb r2, [r3]
	adds r2, r0, 0
	adds r2, 0x23
	lsls r1, 24
	lsrs r1, 24
	adds r6, r0, 0
	ldrb r2, [r2]
	cmp r1, r2
	bne _08115674
	movs r0, 0
	strb r0, [r3]
	adds r2, r6, 0
	adds r2, 0x22
	ldrb r1, [r2]
	ldrh r0, [r6, 0x24]
	subs r0, r1
	strh r0, [r6, 0x24]
	lsls r0, 16
	cmp r0, 0
	bge _08115674
	ldrb r1, [r2]
	movs r2, 0xB4
	lsls r2, 1
	adds r0, r2, 0
	subs r0, r1
	strh r0, [r6, 0x24]
_08115674:
	adds r4, r6, 0
	ldrh r0, [r4, 0x24]
	bl Sin2
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r4, 0x24]
	bl Cos2
	lsls r0, 16
	lsrs r1, r0, 16
	lsls r0, r5, 16
	asrs r0, 16
	cmp r0, 0
	bge _08115694
	adds r0, 0xF
_08115694:
	lsls r0, 12
	lsrs r5, r0, 16
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0
	bge _081156A2
	adds r0, 0xF
_081156A2:
	asrs r0, 4
	strh r0, [r6, 0x32]
	strh r0, [r6, 0x2C]
	strh r5, [r6, 0x2E]
	lsls r0, r5, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r6, 0x30]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081156B8: .4byte 0x02019000
	thumb_func_end sub_8115634

	thumb_func_start sub_81156BC
sub_81156BC: @ 81156BC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl UpdatePaletteFade
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	bne _08115716
	ldr r2, _0811571C
	ldrh r0, [r2]
	movs r5, 0x90
	lsls r5, 6
	adds r1, r5, 0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08115720
	ldr r2, _08115724
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08115728
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r3, [r0, 0x14]
	adds r0, r4, 0
	bl sub_8116CAC
	bl sub_8116CF8
	bl sub_81185E8
	movs r0, 0
	bl sub_8117158
	movs r0, 0x6
	bl sub_81182F8
	ldr r1, _0811572C
	ldr r2, _08115730
	adds r0, r4, 0
	movs r3, 0x3
	bl sub_8116C34
_08115716:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811571C: .4byte REG_BLDCNT
_08115720: .4byte REG_BLDALPHA
_08115724: .4byte 0x00000808
_08115728: .4byte gTasks
_0811572C: .4byte sub_81159BC
_08115730: .4byte 0x0000ffff
	thumb_func_end sub_81156BC

	thumb_func_start sub_8115734
sub_8115734: @ 8115734
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _08115770
	bl sub_814AAF8
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08115774
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _08115778
	adds r0, r4, 0
	bl sub_80F914C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08115770: .4byte 0x00002d9e
_08115774: .4byte gUnknown_081C41E3
_08115778: .4byte gUnknown_083F8EBC
	thumb_func_end sub_8115734

	thumb_func_start sub_811577C
sub_811577C: @ 811577C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1A
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r1, _081157A4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081157A8
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081157A4: .4byte gTasks
_081157A8: .4byte sub_81159BC
	thumb_func_end sub_811577C

	thumb_func_start sub_81157AC
sub_81157AC: @ 81157AC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _081157CC
	adds r0, 0xA5
	ldrb r0, [r0]
	bl DestroyTask
	adds r0, r4, 0
	bl sub_8116AB0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081157CC: .4byte 0x02019000
	thumb_func_end sub_81157AC

	thumb_func_start sub_81157D0
sub_81157D0: @ 81157D0
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bhi _081158C8
	lsls r0, r4, 2
	ldr r1, _081157E8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081157E8: .4byte _081157EC
	.align 2, 0
_081157EC:
	.4byte _0811582C
	.4byte _08115848
	.4byte _08115848
	.4byte _08115848
	.4byte _08115848
	.4byte _08115884
	.4byte _081158C8
	.4byte _081158C8
	.4byte _081158C8
	.4byte _081158C8
	.4byte _08115884
	.4byte _081158C8
	.4byte _081158C8
	.4byte _081158C8
	.4byte _081158C8
	.4byte _08115884
_0811582C:
	ldr r0, _08115844
	movs r1, 0x10
	str r1, [sp]
	movs r1, 0xD
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0xE
	movs r3, 0x7
	bl sub_8124DDC
	b _08115918
	.align 2, 0
_08115844: .4byte gBG2TilemapBuffer
_08115848:
	lsls r0, r4, 1
	adds r0, r4
	adds r0, 0xE
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r5, _0811587C
	movs r0, 0x10
	str r0, [sp]
	movs r4, 0xD
	str r4, [sp, 0x4]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0xE
	movs r3, 0x7
	bl sub_8124DDC
	ldr r1, _08115880
	movs r0, 0x3
	str r0, [sp]
	str r4, [sp, 0x4]
	adds r0, r5, 0
	adds r2, r7, 0
	movs r3, 0x7
	bl sub_8124E2C
	b _08115918
	.align 2, 0
_0811587C: .4byte gBG2TilemapBuffer
_08115880: .4byte 0x02018a32
_08115884:
	subs r0, r4, 0x1
	movs r1, 0x5
	bl __divsi3
	lsls r1, r0, 1
	adds r1, r0
	adds r1, 0xA
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r5, _081158C0
	movs r4, 0x10
	str r4, [sp]
	movs r0, 0xD
	str r0, [sp, 0x4]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0xE
	movs r3, 0x7
	bl sub_8124DDC
	ldr r1, _081158C4
	str r4, [sp]
	movs r0, 0x3
	str r0, [sp, 0x4]
	adds r0, r5, 0
	movs r2, 0xE
	adds r3, r6, 0
	bl sub_8124E2C
	b _08115918
	.align 2, 0
_081158C0: .4byte gBG2TilemapBuffer
_081158C4: .4byte 0x02018a80
_081158C8:
	adds r0, r4, 0
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	adds r1, 0xE
	lsls r1, 24
	lsrs r7, r1, 24
	subs r0, r4, 0x1
	movs r1, 0x5
	bl __divsi3
	lsls r1, r0, 1
	adds r1, r0
	adds r1, 0x7
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r4, _08115920
	movs r0, 0x10
	str r0, [sp]
	movs r0, 0xD
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0xE
	movs r3, 0x7
	bl sub_8124DDC
	ldr r1, _08115924
	movs r0, 0x3
	str r0, [sp]
	str r0, [sp, 0x4]
	adds r0, r4, 0
	adds r2, r7, 0
	adds r3, r6, 0
	bl sub_8124E2C
_08115918:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08115920: .4byte gBG2TilemapBuffer
_08115924: .4byte 0x02018a20
	thumb_func_end sub_81157D0

	thumb_func_start sub_8115928
sub_8115928: @ 8115928
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	cmp r1, 0
	bne _0811594C
	ldr r1, _08115948
	lsls r4, r5, 2
	adds r0, r4, r5
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x10]
	bl sub_811829C
	b _08115960
	.align 2, 0
_08115948: .4byte gTasks
_0811594C:
	ldr r0, _08115974
	ldrb r1, [r0, 0x1A]
	lsls r1, 28
	lsrs r1, 28
	adds r0, 0x1B
	adds r1, r0
	ldrb r0, [r1]
	bl sub_811829C
	lsls r4, r5, 2
_08115960:
	ldr r0, _08115978
	adds r1, r4, r5
	lsls r1, 3
	adds r1, r0
	ldrb r0, [r1, 0x10]
	bl sub_81157D0
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08115974: .4byte 0x02019000
_08115978: .4byte gTasks
	thumb_func_end sub_8115928

	thumb_func_start sub_811597C
sub_811597C: @ 811597C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _081159B0
	movs r6, 0
	movs r1, 0x1
	strh r1, [r5, 0x28]
	ldr r1, _081159B4
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldrb r0, [r4, 0x10]
	bl sub_81157D0
	adds r1, r5, 0
	adds r1, 0x23
	movs r0, 0x2
	strb r0, [r1]
	adds r5, 0x21
	strb r6, [r5]
	ldr r0, _081159B8
	str r0, [r4]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081159B0: .4byte 0x02019000
_081159B4: .4byte gTasks
_081159B8: .4byte sub_8115E14
	thumb_func_end sub_811597C

	thumb_func_start sub_81159BC
sub_81159BC: @ 81159BC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r3, _08115A10
	ldr r1, [r3, 0x8]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08115A1C
	movs r2, 0xB
	ldr r5, _08115A14
	adds r0, r5, 0
	adds r0, 0xE4
	ldr r0, [r0]
	ands r1, r0
	ldr r0, _08115A18
	mov r12, r0
	lsls r7, r6, 2
	cmp r1, 0
	beq _08115A5A
	adds r4, r3, 0
	adds r3, r5, 0
	adds r3, 0x8
_081159EA:
	lsls r0, r2, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r2, r0, 16
	asrs r1, r0, 16
	cmp r1, 0xD
	bgt _08115A5A
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, [r4, 0x8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _081159EA
	b _08115A5A
	.align 2, 0
_08115A10: .4byte 0x02019000
_08115A14: .4byte gUnknown_083F8C00
_08115A18: .4byte gTasks
_08115A1C:
	movs r2, 0x6
	ldr r5, _08115A88
	adds r0, r5, 0
	adds r0, 0x80
	ldr r0, [r0]
	ands r1, r0
	ldr r0, _08115A8C
	mov r12, r0
	lsls r7, r6, 2
	cmp r1, 0
	beq _08115A5A
	adds r4, r3, 0
	adds r3, r5, 0
	adds r3, 0x8
_08115A38:
	lsls r0, r2, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r2, r0, 16
	asrs r1, r0, 16
	cmp r1, 0x9
	bgt _08115A5A
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, [r4, 0x8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08115A38
_08115A5A:
	adds r4, r7, r6
	lsls r4, 3
	add r4, r12
	movs r5, 0
	strh r2, [r4, 0x10]
	adds r0, r6, 0
	bl sub_8116CAC
	ldrb r0, [r4, 0x10]
	bl sub_8117158
	ldrb r0, [r4, 0x10]
	bl sub_811829C
	ldrb r0, [r4, 0x10]
	bl sub_8116EF8
	strh r5, [r4, 0xA]
	ldr r0, _08115A90
	str r0, [r4]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08115A88: .4byte gUnknown_083F8C00
_08115A8C: .4byte gTasks
_08115A90: .4byte sub_811597C
	thumb_func_end sub_81159BC

	thumb_func_start sub_8115A94
sub_8115A94: @ 8115A94
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	movs r6, 0
	movs r7, 0
	ldr r1, _08115ADC
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	ldrb r0, [r4]
	mov r8, r0
	cmp r5, 0
	blt _08115B08
	cmp r5, 0x1
	bgt _08115AE0
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r1, 0x5
	bl __modsi3
	lsls r0, 24
	lsrs r6, r0, 24
	movs r2, 0xF0
	lsls r2, 20
	adds r1, r0, r2
	lsrs r7, r1, 24
	cmp r0, 0
	bne _08115B08
	movs r6, 0x5
	b _08115B08
	.align 2, 0
_08115ADC: .4byte gUnknown_083F8ECA
_08115AE0:
	cmp r5, 0x3
	bgt _08115B08
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r1, 0x5
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 24
	lsrs r6, r1, 24
	movs r2, 0x80
	lsls r2, 19
	adds r0, r1, r2
	lsrs r7, r0, 24
	cmp r1, 0
	bne _08115B08
	movs r6, 0x1
_08115B08:
	mov r1, sp
	adds r0, r1, r5
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r2, [r4]
	adds r0, r2
	strh r0, [r4]
	lsls r1, r6, 24
	asrs r3, r1, 24
	lsls r0, 16
	asrs r0, 16
	lsls r2, r7, 24
	cmp r0, r3
	bge _08115B2A
	asrs r0, r2, 24
	strh r0, [r4]
_08115B2A:
	movs r0, 0
	ldrsh r1, [r4, r0]
	asrs r0, r2, 24
	cmp r1, r0
	ble _08115B36
	strh r3, [r4]
_08115B36:
	mov r1, r8
	lsls r0, r1, 24
	movs r2, 0
	ldrsh r1, [r4, r2]
	asrs r0, 24
	cmp r1, r0
	bne _08115B48
	movs r0, 0
	b _08115B4A
_08115B48:
	movs r0, 0x1
_08115B4A:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8115A94

	thumb_func_start sub_8115B58
sub_8115B58: @ 8115B58
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0
	mov r8, r0
	movs r5, 0
	ldr r4, _08115D30
	ldrh r1, [r4, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08115B94
	movs r5, 0x1
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _08115D34
	adds r0, r1
	adds r0, 0x8
	movs r1, 0
	bl sub_8115A94
	lsls r0, 24
	cmp r0, 0
	bne _08115B94
	b _08115D20
_08115B94:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08115BBA
	movs r5, 0x1
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _08115D34
	adds r0, r1
	adds r0, 0x8
	movs r1, 0x1
	bl sub_8115A94
	lsls r0, 24
	cmp r0, 0
	bne _08115BBA
	b _08115D20
_08115BBA:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08115BE0
	movs r5, 0x1
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _08115D34
	adds r0, r1
	adds r0, 0x8
	movs r1, 0x2
	bl sub_8115A94
	lsls r0, 24
	cmp r0, 0
	bne _08115BE0
	b _08115D20
_08115BE0:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08115C06
	movs r5, 0x1
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _08115D34
	adds r0, r1
	adds r0, 0x8
	movs r1, 0x3
	bl sub_8115A94
	lsls r0, 24
	cmp r0, 0
	bne _08115C06
	b _08115D20
_08115C06:
	cmp r5, 0
	bne _08115C0C
	b _08115D20
_08115C0C:
	ldr r0, _08115D38
	lsls r6, r7, 2
	adds r4, r6, r7
	lsls r4, 3
	adds r4, r0
	ldrb r0, [r4, 0x10]
	bl sub_8117158
	adds r0, r7, 0
	movs r1, 0
	bl sub_8115928
	mov r1, r8
	strh r1, [r4, 0xA]
	movs r0, 0x5
	bl PlaySE
	ldr r5, _08115D3C
	ldr r1, _08115D40
	adds r0, r5, 0
	bl sub_8124D3C
	adds r3, r5, 0
	adds r3, 0xB8
	ldrb r2, [r3]
	movs r1, 0x7F
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r3]
	subs r3, 0xC
	ldrb r2, [r3]
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r3]
	adds r2, r5, 0
	adds r2, 0xA0
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	ldrb r0, [r4, 0x10]
	bl sub_8116EF8
	movs r4, 0
	mov r12, r6
	ldr r6, _08115D44
	movs r2, 0x7C
	negs r2, r2
	adds r2, r5
	mov r10, r2
	movs r0, 0x8
	adds r0, r6
	mov r8, r0
	ldr r1, _08115D48
	mov r9, r1
	ldr r2, _08115D4C
	adds r5, r2, 0
_08115C7C:
	adds r0, r4, 0
	adds r0, 0x29
	add r0, r10
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r6
	adds r2, r3, 0
	adds r2, 0x40
	add r0, r8
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r1, [r0]
	ldrh r2, [r2]
	adds r1, r2
	ands r1, r5
	ldrh r2, [r3, 0x4]
	mov r0, r9
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08115C7C
	ldr r0, _08115D38
	mov r2, r12
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r3, [r1, 0x10]
	subs r0, r3, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3
	bhi _08115D20
	ldr r2, _08115D50
	movs r0, 0x10
	ldrsh r1, [r1, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, 0x8
	adds r0, r2
	ldr r2, _08115D54
	ldr r1, [r2, 0x8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08115D20
	subs r0, r3, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	adds r0, r2, 0
	add r0, r8
	adds r0, 0x65
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08115D44
	adds r3, r0, r1
	adds r2, r3, 0
	adds r2, 0x40
	adds r1, 0x8
	adds r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r1, [r0, 0x4]
	ldrh r2, [r2]
	adds r1, r2
	ldr r2, _08115D4C
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r3, 0x4]
	ldr r0, _08115D48
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
_08115D20:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08115D30: .4byte gMain
_08115D34: .4byte gUnknown_03004B28
_08115D38: .4byte gTasks
_08115D3C: .4byte 0x020190b8
_08115D40: .4byte 0x0000ffff
_08115D44: .4byte gSprites
_08115D48: .4byte 0xfffffc00
_08115D4C: .4byte 0x000003ff
_08115D50: .4byte gUnknown_083F8C00
_08115D54: .4byte 0x02019000
	thumb_func_end sub_8115B58

	thumb_func_start sub_8115D58
sub_8115D58: @ 8115D58
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _08115D70
	movs r0, 0xFF
	strh r0, [r1, 0x28]
	ldrb r0, [r1, 0x19]
	cmp r0, 0x1
	bne _08115D74
	adds r2, r1, 0
	adds r2, 0x23
	b _08115D7A
	.align 2, 0
_08115D70: .4byte 0x02019000
_08115D74:
	adds r2, r1, 0
	adds r2, 0x23
	movs r0, 0
_08115D7A:
	strb r0, [r2]
	adds r1, 0x21
	movs r0, 0
	strb r0, [r1]
	ldr r1, _08115D98
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	movs r1, 0x20
	strh r1, [r0, 0xA]
	ldr r1, _08115D9C
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08115D98: .4byte gTasks
_08115D9C: .4byte sub_8115ECC
	thumb_func_end sub_8115D58

	thumb_func_start sub_8115DA0
sub_8115DA0: @ 8115DA0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08115E08
	ldrb r2, [r4, 0x1A]
	lsls r2, 28
	lsrs r2, 28
	adds r5, r4, 0
	adds r5, 0x1B
	adds r2, r5
	ldr r3, _08115E0C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r6, r1, r3
	ldrh r0, [r6, 0x10]
	strb r0, [r2]
	ldrb r0, [r4, 0x1A]
	lsls r0, 28
	lsrs r0, 28
	adds r0, r5
	ldrb r0, [r0]
	bl sub_8117380
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0xC]
	ldrb r0, [r4, 0x1A]
	lsls r0, 28
	lsrs r0, 28
	adds r0, r5
	ldrb r0, [r0]
	bl sub_811829C
	ldrb r1, [r4, 0x19]
	ldrh r0, [r6, 0x22]
	subs r0, r1
	strh r0, [r6, 0x22]
	lsls r0, 16
	cmp r0, 0
	bge _08115DF6
	movs r0, 0
	strh r0, [r6, 0x22]
_08115DF6:
	ldrh r0, [r6, 0x22]
	bl sub_81180F4
	ldr r0, _08115E10
	str r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08115E08: .4byte 0x02019000
_08115E0C: .4byte gTasks
_08115E10: .4byte sub_8115D58
	thumb_func_end sub_8115DA0

	thumb_func_start sub_8115E14
sub_8115E14: @ 8115E14
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl sub_8115B58
	ldr r1, _08115E3C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x1E
	beq _08115E4A
	cmp r0, 0x1E
	bgt _08115E40
	cmp r0, 0
	beq _08115E46
	b _08115E5E
	.align 2, 0
_08115E3C: .4byte gTasks
_08115E40:
	cmp r0, 0x3B
	beq _08115E58
	b _08115E5E
_08115E46:
	ldrb r0, [r4, 0x10]
	b _08115E4C
_08115E4A:
	movs r0, 0
_08115E4C:
	bl sub_81157D0
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	b _08115E6E
_08115E58:
	movs r0, 0
	strh r0, [r4, 0xA]
	b _08115E6E
_08115E5E:
	ldr r0, _08115EA8
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
_08115E6E:
	ldr r0, _08115EAC
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08115EC2
	ldr r3, _08115EB0
	ldr r2, _08115EB4
	ldr r1, _08115EA8
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r0, 0x10
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, 0x8
	adds r0, r2
	ldr r1, [r3, 0x8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08115EB8
	movs r0, 0x16
	bl PlaySE
	b _08115EC2
	.align 2, 0
_08115EA8: .4byte gTasks
_08115EAC: .4byte gMain
_08115EB0: .4byte 0x02019000
_08115EB4: .4byte gUnknown_083F8C00
_08115EB8:
	movs r0, 0x5F
	bl m4aSongNumStart
	ldr r0, _08115EC8
	str r0, [r4]
_08115EC2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08115EC8: .4byte sub_8115DA0
	thumb_func_end sub_8115E14

	thumb_func_start sub_8115ECC
sub_8115ECC: @ 8115ECC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08115F20
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0xA]
	subs r1, r0, 0x1
	strh r1, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	ble _08115F34
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _08115EF8
	ldr r1, _08115F24
	ldrh r0, [r1]
	adds r0, 0x2
	strh r0, [r1]
_08115EF8:
	ldr r1, _08115F28
	ldrh r0, [r1, 0x26]
	adds r0, 0x4
	strh r0, [r1, 0x26]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x68
	bne _08115F4C
	ldr r2, _08115F2C
	adds r0, r1, 0
	adds r0, 0x55
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _08115F30
	str r1, [r0]
	b _08115F4C
	.align 2, 0
_08115F20: .4byte gTasks
_08115F24: .4byte gSpriteCoordOffsetX
_08115F28: .4byte 0x02019000
_08115F2C: .4byte gSprites
_08115F30: .4byte SpriteCallbackDummy
_08115F34:
	movs r0, 0x1
	movs r1, 0xFF
	bl sub_8117AA8
	movs r0, 0x1
	movs r1, 0xFF
	bl sub_8117C60
	ldr r0, _08115F54
	str r0, [r4]
	movs r0, 0
	strh r0, [r4, 0xA]
_08115F4C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08115F54: .4byte sub_8116100
	thumb_func_end sub_8115ECC

	thumb_func_start sub_8115F58
sub_8115F58: @ 8115F58
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _08115F74
	ldrb r2, [r0, 0x2]
	adds r4, r0, 0
	cmp r2, 0x2
	bgt _08115F78
	cmp r2, 0x1
	bge _08115F7E
	b _08116048
	.align 2, 0
_08115F74: .4byte 0x02019000
_08115F78:
	cmp r2, 0x3
	beq _08115FE0
	b _08116048
_08115F7E:
	ldr r0, _08115FA8
	ldrb r0, [r0, 0x2]
	subs r0, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bhi _08115FB0
	cmp r3, 0xB
	bls _08115F98
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0811605E
_08115F98:
	ldr r0, _08115FAC
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	lsrs r0, 1
	b _081160F4
	.align 2, 0
_08115FA8: .4byte gLocalTime
_08115FAC: .4byte gUnknown_083F8DF4
_08115FB0:
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08115FCC
	ldr r0, _08115FC8
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	lsrs r0, 1
	b _081160F4
	.align 2, 0
_08115FC8: .4byte gUnknown_083F8DF4
_08115FCC:
	ldr r0, _08115FDC
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	b _081160F4
	.align 2, 0
_08115FDC: .4byte gUnknown_083F8DF4
_08115FE0:
	ldr r0, _0811600C
	ldrb r0, [r0, 0x2]
	subs r0, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	bhi _08116014
	cmp r3, 0x5
	bls _08115FFA
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0811605E
_08115FFA:
	ldr r0, _08116010
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	lsrs r0, 1
	b _081160F4
	.align 2, 0
_0811600C: .4byte gLocalTime
_08116010: .4byte gUnknown_083F8DF4
_08116014:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08116034
	cmp r3, 0x6
	bls _08116034
	ldr r0, _08116030
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	lsrs r0, 2
	b _081160F4
	.align 2, 0
_08116030: .4byte gUnknown_083F8DF4
_08116034:
	ldr r0, _08116044
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	lsrs r0, 1
	b _081160F4
	.align 2, 0
_08116044: .4byte gUnknown_083F8DF4
_08116048:
	ldr r0, _08116064
	ldrb r0, [r0, 0x2]
	subs r0, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bhi _0811607C
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08116068
_0811605E:
	movs r0, 0x1
	b _081160F4
	.align 2, 0
_08116064: .4byte gLocalTime
_08116068:
	ldr r0, _08116078
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	lsrs r0, 1
	b _081160F4
	.align 2, 0
_08116078: .4byte gUnknown_083F8DF4
_0811607C:
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _081160B0
	cmp r3, 0xC
	bls _0811609C
	ldr r0, _08116098
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	lsrs r0, 1
	b _081160F4
	.align 2, 0
_08116098: .4byte gUnknown_083F8DF4
_0811609C:
	ldr r0, _081160AC
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	b _081160F4
	.align 2, 0
_081160AC: .4byte gUnknown_083F8DF4
_081160B0:
	movs r0, 0x80
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _081160E4
	cmp r3, 0xC
	bls _081160D0
	ldr r0, _081160CC
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	b _081160F4
	.align 2, 0
_081160CC: .4byte gUnknown_083F8DF4
_081160D0:
	ldr r0, _081160E0
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x1]
	b _081160F4
	.align 2, 0
_081160E0: .4byte gUnknown_083F8DF4
_081160E4:
	ldr r0, _081160FC
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 25
	lsrs r0, 24
_081160F4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081160FC: .4byte gUnknown_083F8DF4
	thumb_func_end sub_8115F58

	thumb_func_start sub_8116100
sub_8116100: @ 8116100
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r4, 0
	ldr r1, _08116188
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	bl Random
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r7, 0
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r3, _0811618C
	ldr r1, _08116190
	mov r2, r9
	lsls r0, r2, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	ldrh r2, [r0, 0x14]
	adds r1, r3, 0
	adds r1, 0x7C
	strb r2, [r1]
	adds r1, 0x3
	strb r4, [r1]
	subs r1, 0x1
	strb r4, [r1]
	subs r1, 0x1
	strb r4, [r1]
	ldrh r0, [r0, 0x18]
	adds r1, r7, 0
	bl sub_8115F58
	adds r4, r0, 0
	lsls r4, 24
	lsrs r1, r4, 24
	adds r0, r7, 0
	bl __modsi3
	lsrs r4, 25
	subs r0, r4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08116194
	ldrb r0, [r0, 0x2]
	lsls r0, 24
	asrs r0, 24
	movs r5, 0x1
	cmp r0, 0xC
	bgt _08116180
	movs r5, 0
_08116180:
	cmp r6, 0x4F
	bhi _08116198
	lsls r0, r5, 25
	b _081161A2
	.align 2, 0
_08116188: .4byte gUnknown_083F8ECE
_0811618C: .4byte 0x02019000
_08116190: .4byte gTasks
_08116194: .4byte gLocalTime
_08116198:
	lsls r1, r5, 24
	asrs r1, 24
	movs r0, 0x1
	subs r0, r1
	lsls r0, 25
_081161A2:
	lsrs r5, r0, 24
	ldr r6, _081162D8
	ldrb r0, [r6, 0x4]
	lsls r0, 30
	mov r10, r0
	lsrs r0, 25
	ldr r1, _081162DC
	adds r0, r1
	lsls r4, 24
	asrs r4, 24
	ldrh r0, [r0, 0x1A]
	adds r4, r0
	adds r0, r6, 0
	adds r0, 0x80
	strh r4, [r0]
	lsls r4, 16
	asrs r4, 16
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _081161D4
	ldr r1, _081162E0
	bl __addsf3
_081161D4:
	ldr r1, _081162E4
	bl __divsf3
	bl __fixunssfsi
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r0, r4, 1
	adds r0, r4
	mov r8, r0
	adds r0, r6, 0
	adds r0, 0x82
	mov r2, r8
	strh r2, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	movs r0, 0x1
	ands r0, r7
	lsls r1, r5, 24
	asrs r1, 24
	adds r0, r1
	lsls r0, 1
	add r0, sp
	movs r1, 0
	ldrsh r4, [r0, r1]
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _0811621A
	ldr r1, _081162E0
	bl __addsf3
_0811621A:
	ldr r2, _081162E8
	str r0, [r2]
	adds r7, r6, 0
	adds r7, 0x8C
	mov r1, r10
	lsrs r0, r1, 25
	ldr r2, _081162DC
	adds r0, r2
	movs r1, 0x18
	ldrsh r4, [r0, r1]
	adds r0, r4, 0
	bl __floatsisf
	adds r5, r0, 0
	cmp r4, 0
	bge _08116242
	ldr r1, _081162E0
	bl __addsf3
	adds r5, r0, 0
_08116242:
	str r5, [r7]
	adds r7, r6, 0
	adds r7, 0x90
	ldr r1, _081162EC
	adds r0, r5, 0
	bl __mulsf3
	adds r1, r5, 0
	bl __subsf3
	adds r5, r0, 0
	mov r2, r8
	lsls r0, r2, 16
	asrs r4, r0, 16
	adds r0, r4, 0
	bl __floatsisf
	adds r2, r0, 0
	cmp r4, 0
	bge _08116272
	ldr r1, _081162E0
	bl __addsf3
	adds r2, r0, 0
_08116272:
	adds r0, r5, 0
	adds r1, r2, 0
	bl __divsf3
	str r0, [r7]
	adds r1, r6, 0
	adds r1, 0x94
	ldr r0, _081162F0
	str r0, [r1]
	adds r1, 0x8
	ldr r0, _081162F4
	str r0, [r1]
	adds r5, r6, 0
	adds r5, 0x98
	adds r0, r4, 0
	bl __floatsisf
	adds r2, r0, 0
	cmp r4, 0
	bge _081162A2
	ldr r1, _081162E0
	bl __addsf3
	adds r2, r0, 0
_081162A2:
	ldr r0, _081162F8
	adds r1, r2, 0
	bl __divsf3
	bl __negsf2
	str r0, [r5]
	adds r1, r6, 0
	adds r1, 0xA0
	ldr r0, _081162FC
	str r0, [r1]
	ldr r1, _08116300
	mov r2, r9
	lsls r0, r2, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	ldr r1, _08116304
	str r1, [r0]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081162D8: .4byte 0x02019000
_081162DC: .4byte gUnknown_083F8DF4
_081162E0: .4byte 0x47800000
_081162E4: .4byte 0x40a00000
_081162E8: .4byte 0x02019088
_081162EC: .4byte 0x3f000000
_081162F0: .4byte 0x42880000
_081162F4: .4byte 0x00000000
_081162F8: .4byte 0x41000000
_081162FC: .4byte 0x42100000
_08116300: .4byte gTasks
_08116304: .4byte sub_8116308
	thumb_func_end sub_8116100

	thumb_func_start sub_8116308
sub_8116308: @ 8116308
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08116368
	ldrb r1, [r3, 0x3]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r3, 0x3]
	adds r2, r3, 0
	adds r2, 0x7C
	adds r1, r3, 0
	adds r1, 0x3C
	ldrb r2, [r2]
	adds r1, r2
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	ldr r2, _0811636C
	adds r1, r2
	str r1, [r3, 0x38]
	ldr r2, _08116370
	str r2, [r1, 0x1C]
	ldr r1, _08116374
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldrh r1, [r4, 0x14]
	adds r1, 0x1
	strh r1, [r4, 0x14]
	ldrh r0, [r4, 0x18]
	adds r0, 0x1
	strh r0, [r4, 0x18]
	movs r0, 0x6
	subs r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl sub_81182F8
	movs r0, 0x5C
	bl m4aSongNumStart
	ldr r0, _08116378
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08116368: .4byte 0x02019000
_0811636C: .4byte gSprites
_08116370: .4byte sub_81191F4
_08116374: .4byte gTasks
_08116378: .4byte sub_811637C
	thumb_func_end sub_8116308

	thumb_func_start sub_811637C
sub_811637C: @ 811637C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _081163B0
	adds r0, r4, 0
	adds r0, 0x7D
	ldrb r0, [r0]
	cmp r0, 0
	beq _08116464
	ldrb r1, [r4, 0x3]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _081163B4
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08116464
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	movs r1, 0x21
	negs r1, r1
	ands r0, r1
	strb r0, [r4, 0x3]
	b _08116464
	.align 2, 0
_081163B0: .4byte 0x02019000
_081163B4:
	ldr r2, _08116428
	lsls r1, r5, 2
	adds r0, r1, r5
	lsls r0, 3
	adds r6, r0, r2
	movs r2, 0xA
	ldrsh r0, [r6, r2]
	adds r7, r1, 0
	cmp r0, 0
	bne _08116400
	adds r0, r4, 0
	adds r0, 0x7E
	ldrb r1, [r0]
	adds r0, r5, 0
	bl sub_8116D54
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r4, 0x1A]
	lsls r1, 28
	lsrs r1, 28
	adds r2, r4, 0
	adds r2, 0x1B
	adds r1, r2
	ldrb r1, [r1]
	bl sub_8116E5C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x12]
	cmp r0, 0x1
	bne _08116400
	adds r0, r4, 0
	adds r0, 0xB8
	movs r1, 0x80
	lsls r1, 5
	bl sub_8124CE8
_08116400:
	ldr r0, _08116428
	adds r1, r7, r5
	lsls r1, 3
	adds r4, r1, r0
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x3C
	bgt _08116430
	ldr r0, _0811642C
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08116420
	movs r0, 0x3C
	strh r0, [r4, 0xA]
_08116420:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	b _08116464
	.align 2, 0
_08116428: .4byte gTasks
_0811642C: .4byte gMain
_08116430:
	ldr r1, _0811646C
	ldrb r0, [r1, 0x1A]
	lsls r0, 28
	lsrs r0, 28
	adds r1, 0x1B
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8117158
	ldrh r1, [r4, 0x20]
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_8117AA8
	ldrb r1, [r4, 0x14]
	subs r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_8117C60
	movs r0, 0x20
	strh r0, [r4, 0xA]
	ldr r0, _08116470
	str r0, [r4]
_08116464:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811646C: .4byte 0x02019000
_08116470: .4byte sub_8116474
	thumb_func_end sub_811637C

	thumb_func_start sub_8116474
sub_8116474: @ 8116474
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _081164C8
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0xA]
	subs r1, r0, 0x1
	strh r1, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	ble _081164DC
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _081164A0
	ldr r1, _081164CC
	ldrh r0, [r1]
	subs r0, 0x2
	strh r0, [r1]
_081164A0:
	ldr r1, _081164D0
	ldrh r0, [r1, 0x26]
	subs r0, 0x4
	strh r0, [r1, 0x26]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x68
	bne _08116504
	ldr r2, _081164D4
	adds r0, r1, 0
	adds r0, 0x55
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _081164D8
	str r1, [r0]
	b _08116504
	.align 2, 0
_081164C8: .4byte gTasks
_081164CC: .4byte gSpriteCoordOffsetX
_081164D0: .4byte 0x02019000
_081164D4: .4byte gSprites
_081164D8: .4byte sub_81184CC
_081164DC:
	ldrh r0, [r4, 0x20]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8117D68
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _081164F2
	movs r0, 0x79
	b _081164F4
_081164F2:
	movs r0, 0x3D
_081164F4:
	strh r0, [r4, 0xA]
	ldr r0, _0811650C
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _08116510
	str r0, [r1]
_08116504:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811650C: .4byte gTasks
_08116510: .4byte sub_8116514
	thumb_func_end sub_8116474

	thumb_func_start sub_8116514
sub_8116514: @ 8116514
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _08116564
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0xA]
	subs r1, r0, 0x1
	strh r1, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _08116584
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	adds r0, r1, 0
	cmp r1, 0
	bge _0811653E
	adds r0, 0xF
_0811653E:
	asrs r0, 4
	lsls r0, 4
	subs r0, r1, r0
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	beq _08116568
	cmp r0, 0x8
	bne _08116590
	movs r0, 0
	movs r1, 0xFF
	bl sub_8117AA8
	movs r0, 0
	movs r1, 0xFF
	bl sub_8117C60
	b _08116590
	.align 2, 0
_08116564: .4byte gTasks
_08116568:
	ldrh r1, [r4, 0x20]
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_8117AA8
	ldrb r1, [r4, 0x14]
	subs r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_8117C60
	b _08116590
_08116584:
	ldr r1, _08116598
	adds r0, r2, 0
	movs r2, 0x1E
	movs r3, 0
	bl sub_8116C34
_08116590:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08116598: .4byte sub_8116638
	thumb_func_end sub_8116514

	thumb_func_start sub_811659C
sub_811659C: @ 811659C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _081165F4
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08116600
	cmp r0, 0
	blt _08116600
	cmp r0, 0x2
	bgt _08116600
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _08116624
	movs r0, 0x1D
	bl sub_8053108
	ldrh r1, [r4, 0x1E]
	adds r1, 0x1
	strh r1, [r4, 0x1E]
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	bcs _081165E4
	movs r0, 0x1E
	ldrsh r1, [r4, r0]
	movs r0, 0x1D
	bl sav12_xor_set
_081165E4:
	ldr r1, _081165F8
	ldr r2, _081165FC
	adds r0, r5, 0
	movs r3, 0x3
	bl sub_8116C34
	b _08116624
	.align 2, 0
_081165F4: .4byte gTasks
_081165F8: .4byte sub_811677C
_081165FC: .4byte 0x0000ffff
_08116600:
	bl IsSEPlaying
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _08116624
	ldr r1, _0811662C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0x1E]
	ldr r1, _08116630
	ldr r2, _08116634
	adds r0, r5, 0
	movs r3, 0x3
	bl sub_8116C34
_08116624:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811662C: .4byte gTasks
_08116630: .4byte sub_81167F4
_08116634: .4byte 0x0000ffff
	thumb_func_end sub_811659C

	thumb_func_start sub_8116638
sub_8116638: @ 8116638
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08116678
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x12
	ldrsh r1, [r0, r2]
	cmp r1, 0
	beq _081166A8
	cmp r1, 0
	blt _081166A8
	cmp r1, 0x2
	bgt _081166A8
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0xC
	bne _08116684
	ldr r0, _0811667C
	bl PlayFanfare
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08116680
	b _0811669A
	.align 2, 0
_08116678: .4byte gTasks
_0811667C: .4byte 0x00000185
_08116680: .4byte gUnknown_081C41A5
_08116684:
	movs r0, 0xC3
	lsls r0, 1
	bl PlayFanfare
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _081166A4
_0811669A:
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	b _081166C4
	.align 2, 0
_081166A4: .4byte gUnknown_081C4199
_081166A8:
	movs r0, 0x20
	bl m4aSongNumStart
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _081166DC
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
_081166C4:
	ldr r1, _081166E0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xA]
	ldr r1, _081166E4
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081166DC: .4byte gUnknown_081C41AE
_081166E0: .4byte gTasks
_081166E4: .4byte sub_811659C
	thumb_func_end sub_8116638

	thumb_func_start sub_81166E8
sub_81166E8: @ 81166E8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0811670C
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r1
	movs r0, 0x16
	ldrsh r5, [r4, r0]
	cmp r5, 0
	beq _08116710
	cmp r5, 0x3
	beq _08116740
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	b _08116748
	.align 2, 0
_0811670C: .4byte gTasks
_08116710:
	ldrh r0, [r4, 0x22]
	adds r0, 0x1
	strh r0, [r4, 0x22]
	movs r0, 0x15
	bl m4aSongNumStart
	ldrh r0, [r4, 0x22]
	bl sub_81180F4
	movs r2, 0x22
	ldrsh r1, [r4, r2]
	ldr r0, _08116730
	cmp r1, r0
	ble _08116734
	strh r5, [r4, 0xA]
	b _0811674A
	.align 2, 0
_08116730: .4byte 0x0000270e
_08116734:
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	b _08116748
_08116740:
	movs r0, 0x15
	bl m4aSongNumStop
	movs r0, 0
_08116748:
	strh r0, [r4, 0x16]
_0811674A:
	ldr r0, _08116770
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _08116768
	ldr r1, _08116774
	ldr r2, _08116778
	adds r0, r6, 0
	movs r3, 0x3
	bl sub_8116C34
_08116768:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08116770: .4byte gTasks
_08116774: .4byte sub_81167F4
_08116778: .4byte 0x0000ffff
	thumb_func_end sub_81166E8

	thumb_func_start sub_811677C
sub_811677C: @ 811677C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _081167DC
	ldr r6, _081167E0
	ldrb r2, [r6, 0x19]
	ldr r1, _081167E4
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	adds r1, r2, 0
	muls r1, r0
	adds r0, r3, 0
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r5, _081167E8
	ldr r1, _081167EC
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldrb r1, [r6, 0x19]
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	muls r0, r1
	movs r1, 0
	strh r0, [r4, 0xA]
	strh r1, [r4, 0x16]
	ldr r0, _081167F0
	str r0, [r4]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081167DC: .4byte gStringVar1
_081167E0: .4byte 0x02019000
_081167E4: .4byte gTasks
_081167E8: .4byte gStringVar4
_081167EC: .4byte gUnknown_081C41BD
_081167F0: .4byte sub_81166E8
	thumb_func_end sub_811677C

	thumb_func_start sub_81167F4
sub_81167F4: @ 81167F4
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _08116868
	ldr r1, _0811686C
	adds r0, r4, 0
	bl sub_8124D3C
	adds r3, r4, 0
	adds r3, 0xB8
	ldrb r2, [r3]
	movs r1, 0x7F
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r3]
	subs r3, 0xC
	ldrb r2, [r3]
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r3]
	adds r2, r4, 0
	adds r2, 0xA0
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	ldr r6, _08116870
	ldr r2, _08116874
	ldr r0, _08116878
	lsls r3, r5, 2
	adds r3, r5
	lsls r3, 3
	adds r3, r0
	movs r0, 0x20
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	adds r4, r0
	subs r4, 0x75
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _0811687C
	str r0, [r3]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08116868: .4byte 0x020190b8
_0811686C: .4byte 0x0000ffff
_08116870: .4byte gSprites
_08116874: .4byte gUnknown_083F8C00
_08116878: .4byte gTasks
_0811687C: .4byte sub_8116880
	thumb_func_end sub_81167F4

	thumb_func_start sub_8116880
sub_8116880: @ 8116880
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	ldr r1, _08116954
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	strh r5, [r0, 0x10]
	ldr r4, _08116958
	ldrb r0, [r4, 0x1A]
	lsls r0, 28
	lsrs r0, 28
	adds r1, r4, 0
	adds r1, 0x1B
	adds r0, r1
	strb r2, [r0]
	movs r0, 0
	bl sub_8117158
	ldr r3, _0811695C
	adds r0, r4, 0
	adds r0, 0x6C
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	adds r7, r3, 0
	movs r0, 0x3C
	adds r0, r4
	mov r10, r0
	movs r1, 0x8
	adds r1, r7
	mov r8, r1
	ldr r0, _08116960
	mov r9, r0
	ldr r1, _08116964
	mov r12, r1
_081168E4:
	adds r0, r5, 0
	adds r0, 0x29
	add r0, r10
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r7
	adds r2, r3, 0
	adds r2, 0x40
	add r0, r8
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r1, [r0]
	ldrh r2, [r2]
	adds r1, r2
	mov r0, r12
	ands r1, r0
	ldrh r2, [r3, 0x4]
	mov r0, r9
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _081168E4
	ldr r0, _08116954
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r2, r1, r0
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	ldrb r4, [r4, 0x19]
	cmp r0, r4
	blt _081169BC
	movs r1, 0x14
	ldrsh r0, [r2, r1]
	cmp r0, 0x6
	bne _08116970
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08116968
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _0811696C
	b _08116992
	.align 2, 0
_08116954: .4byte gTasks
_08116958: .4byte 0x02019000
_0811695C: .4byte gSprites
_08116960: .4byte 0xfffffc00
_08116964: .4byte 0x000003ff
_08116968: .4byte gUnknown_081C41F1
_0811696C: .4byte dp01t_12_3_battle_menu
_08116970:
	movs r0, 0x22
	ldrsh r1, [r2, r0]
	ldr r0, _081169A0
	cmp r1, r0
	bne _081169B0
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _081169A4
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _081169A8
_08116992:
	ldr r2, _081169AC
	adds r0, r6, 0
	movs r3, 0x3
	bl sub_8116C34
	b _081169DE
	.align 2, 0
_081169A0: .4byte 0x0000270f
_081169A4: .4byte gUnknown_081C4231
_081169A8: .4byte sub_8115734
_081169AC: .4byte 0x0000ffff
_081169B0:
	ldr r0, _081169B8
	str r0, [r2]
	b _081169DE
	.align 2, 0
_081169B8: .4byte sub_8115734
_081169BC:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _081169EC
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _081169F0
	adds r0, r6, 0
	movs r2, 0x3C
	movs r3, 0x3
	bl sub_8116C34
_081169DE:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081169EC: .4byte gUnknown_081C41D2
_081169F0: .4byte sub_81157AC
	thumb_func_end sub_8116880

	thumb_func_start dp01t_12_3_battle_menu
dp01t_12_3_battle_menu: @ 81169F4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r1, _08116A84
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r4, [r0, 0x14]
	adds r0, r5, 0
	bl sub_8116CAC
	bl sub_8116CF8
	bl sub_81185E8
	movs r0, 0
	bl sub_8117158
	movs r0, 0x6
	bl sub_81182F8
	ldr r7, _08116A88
	ldr r3, _08116A8C
	movs r6, 0x5
	negs r6, r6
_08116A2A:
	adds r0, r4, 0x7
	adds r0, r3
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xB
	bls _08116A2A
	ldr r1, _08116A84
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r2, r0, r1
	movs r0, 0x22
	ldrsh r1, [r2, r0]
	ldr r0, _08116A90
	cmp r1, r0
	bne _08116AA0
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08116A94
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _08116A98
	ldr r2, _08116A9C
	adds r0, r5, 0
	movs r3, 0x3
	bl sub_8116C34
	b _08116AA4
	.align 2, 0
_08116A84: .4byte gTasks
_08116A88: .4byte gSprites
_08116A8C: .4byte 0x0201903c
_08116A90: .4byte 0x0000270f
_08116A94: .4byte gUnknown_081C4231
_08116A98: .4byte sub_8115734
_08116A9C: .4byte 0x0000ffff
_08116AA0:
	ldr r0, _08116AAC
	str r0, [r2]
_08116AA4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08116AAC: .4byte sub_8115734
	thumb_func_end dp01t_12_3_battle_menu

	thumb_func_start sub_8116AB0
sub_8116AB0: @ 8116AB0
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _08116AF0
	ldr r1, _08116AF4
	adds r0, r4, 0
	bl sub_8124D3C
	adds r0, r4, 0
	bl sub_8124918
	ldr r1, _08116AF8
	ldr r2, _08116AFC
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r2
	ldrh r0, [r0, 0x22]
	ldr r2, _08116B00
	adds r1, r2
	strh r0, [r1]
	subs r4, 0xB8
	lsls r0, 16
	lsrs r0, 16
	ldrb r4, [r4, 0x19]
	cmp r0, r4
	bcs _08116B08
	ldr r1, _08116B04
	movs r0, 0x1
	b _08116B0C
	.align 2, 0
_08116AF0: .4byte 0x020190b8
_08116AF4: .4byte 0x0000ffff
_08116AF8: .4byte gSaveBlock1
_08116AFC: .4byte gTasks
_08116B00: .4byte 0x00000494
_08116B04: .4byte gUnknown_0202E8CC
_08116B08:
	ldr r1, _08116B34
	movs r0, 0
_08116B0C:
	strh r0, [r1]
	movs r0, 0
	str r0, [sp]
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginHardwarePaletteFade
	ldr r1, _08116B38
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08116B3C
	str r1, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08116B34: .4byte gUnknown_0202E8CC
_08116B38: .4byte gTasks
_08116B3C: .4byte sub_8116B40
	thumb_func_end sub_8116AB0

	thumb_func_start sub_8116B40
sub_8116B40: @ 8116B40
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl UpdatePaletteFade
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08116B9E
	movs r0, 0
	bl SetVBlankCallback
	ldr r0, _08116BA4
	movs r2, 0xBE
	lsls r2, 1
	movs r1, 0
	bl memset
	ldr r1, _08116BA8
	ldr r0, _08116BAC
	strh r4, [r0]
	strh r4, [r1]
	bl sub_80F9368
	bl FreeAllSpritePalettes
	bl ResetPaletteFade
	bl ResetSpriteData
	bl sub_80F9020
	ldr r0, _08116BB0
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	ldr r1, _08116BB4
	ldr r0, _08116BB8
	str r0, [r1]
	ldr r0, _08116BBC
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_08116B9E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08116BA4: .4byte 0x02019000
_08116BA8: .4byte gSpriteCoordOffsetX
_08116BAC: .4byte gSpriteCoordOffsetY
_08116BB0: .4byte REG_BLDCNT
_08116BB4: .4byte gUnknown_0300485C
_08116BB8: .4byte sub_8080990
_08116BBC: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_8116B40

	thumb_func_start sub_8116BC0
sub_8116BC0: @ 8116BC0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _08116C24
	adds r7, r0, 0
	adds r7, 0xA8
	ldrh r1, [r7]
	adds r6, r0, 0
	cmp r1, 0
	beq _08116BE4
	ldr r0, _08116C28
	adds r2, r6, 0
	adds r2, 0xAA
	ldrh r1, [r0, 0x2E]
	ldrh r0, [r2]
	ands r0, r1
	cmp r0, 0
	beq _08116C0E
_08116BE4:
	ldr r1, _08116C2C
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	adds r5, r6, 0
	adds r5, 0xAC
	ldr r1, [r5]
	str r1, [r0]
	adds r4, r6, 0
	adds r4, 0xAA
	ldrh r0, [r4]
	cmp r0, 0
	beq _08116C06
	movs r0, 0x5
	bl PlaySE
_08116C06:
	movs r0, 0
	str r0, [r5]
	strh r0, [r4]
	strh r0, [r7]
_08116C0E:
	adds r2, r6, 0
	adds r2, 0xA8
	ldrh r1, [r2]
	ldr r0, _08116C30
	cmp r1, r0
	beq _08116C1E
	subs r0, r1, 0x1
	strh r0, [r2]
_08116C1E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08116C24: .4byte 0x02019000
_08116C28: .4byte gMain
_08116C2C: .4byte gTasks
_08116C30: .4byte 0x0000ffff
	thumb_func_end sub_8116BC0

	thumb_func_start sub_8116C34
sub_8116C34: @ 8116C34
	push {r4-r7,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r2, 16
	lsrs r4, r2, 16
	lsls r3, 16
	lsrs r3, 16
	ldr r0, _08116C84
	mov r12, r0
	mov r2, r12
	adds r2, 0xB4
	ldr r1, _08116C88
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2]
	mov r2, r12
	adds r7, r1, 0
	cmp r5, 0
	bne _08116C64
	adds r5, r0, 0
_08116C64:
	adds r0, r2, 0
	adds r0, 0xAC
	str r5, [r0]
	subs r0, 0x4
	strh r4, [r0]
	ldr r0, _08116C8C
	cmp r4, r0
	bne _08116C90
	cmp r3, 0
	bne _08116C90
	adds r1, r2, 0
	adds r1, 0xAA
	ldrh r0, [r1]
	orrs r4, r0
	strh r4, [r1]
	b _08116C96
	.align 2, 0
_08116C84: .4byte 0x02019000
_08116C88: .4byte gTasks
_08116C8C: .4byte 0x0000ffff
_08116C90:
	adds r0, r2, 0
	adds r0, 0xAA
	strh r3, [r0]
_08116C96:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r7
	ldr r1, _08116CA8
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08116CA8: .4byte sub_8116BC0
	thumb_func_end sub_8116C34

	thumb_func_start sub_8116CAC
sub_8116CAC: @ 8116CAC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r2, 0
	ldr r0, _08116CF0
	strb r2, [r0]
	movs r1, 0
	strb r1, [r0, 0x3]
	adds r3, r0, 0
	ldr r6, _08116CF4
	adds r4, r3, 0
	adds r4, 0x1B
_08116CC4:
	adds r0, r2, r4
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x5
	bls _08116CC4
	ldrb r1, [r3, 0x1A]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	strb r0, [r3, 0x1A]
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r6
	movs r1, 0
	strh r1, [r0, 0xA]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08116CF0: .4byte 0x02019000
_08116CF4: .4byte gTasks
	thumb_func_end sub_8116CAC

	thumb_func_start sub_8116CF8
sub_8116CF8: @ 8116CF8
	push {lr}
	ldr r1, _08116D48
	movs r0, 0
	str r0, [r1, 0x8]
	movs r2, 0
	adds r1, 0xC
	movs r3, 0
_08116D06:
	adds r0, r2, r1
	strb r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x5
	bls _08116D06
	movs r2, 0
	ldr r3, _08116D4C
	movs r1, 0
_08116D1A:
	adds r0, r2, r3
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _08116D1A
	movs r2, 0
	ldr r3, _08116D50
	movs r1, 0
_08116D2E:
	adds r0, r2, r3
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bls _08116D2E
	movs r0, 0x1
	movs r1, 0xFF
	bl sub_8117C60
	pop {r0}
	bx r0
	.align 2, 0
_08116D48: .4byte 0x02019000
_08116D4C: .4byte 0x02019012
_08116D50: .4byte 0x02019016
	thumb_func_end sub_8116CF8

	thumb_func_start sub_8116D54
sub_8116D54: @ 8116D54
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x1C
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	mov r1, sp
	ldr r0, _08116D88
	ldm r0!, {r2,r4,r6}
	stm r1!, {r2,r4,r6}
	ldr r0, [r0]
	str r0, [r1]
	add r2, sp, 0x10
	adds r1, r2, 0
	ldr r0, _08116D8C
	ldm r0!, {r4,r6,r7}
	stm r1!, {r4,r6,r7}
	mov r9, r2
	cmp r5, 0xB
	bls _08116D90
	movs r0, 0
	b _08116E38
	.align 2, 0
_08116D88: .4byte gUnknown_083F8ED8
_08116D8C: .4byte gUnknown_083F8EE8
_08116D90:
	ldr r6, _08116E48
	ldr r1, _08116E4C
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	movs r7, 0x14
	ldrsh r2, [r0, r7]
	adds r2, r6, r2
	ldr r4, _08116E50
	lsls r5, 3
	adds r3, r5, r4
	ldrb r1, [r3, 0x2]
	strb r1, [r2, 0xB]
	ldrb r1, [r3, 0x2]
	strh r1, [r0, 0x20]
	adds r0, r4, 0x4
	adds r0, r5, r0
	ldr r1, [r6, 0x8]
	ldr r0, [r0]
	orrs r1, r0
	str r1, [r6, 0x8]
	movs r3, 0
	mov r8, r4
	mov r12, r5
	adds r5, r0, 0
	adds r4, r6, 0
	adds r4, 0x12
_08116DC8:
	lsls r0, r3, 2
	mov r1, sp
	adds r2, r1, r0
	ldr r0, [r2]
	ands r0, r5
	cmp r0, 0
	beq _08116DDE
	adds r1, r3, r4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08116DDE:
	adds r0, r3, r4
	ldrb r0, [r0]
	cmp r0, 0x2
	bls _08116DEE
	ldr r0, [r6, 0x8]
	ldr r1, [r2]
	orrs r0, r1
	str r0, [r6, 0x8]
_08116DEE:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _08116DC8
	movs r2, 0
	ldr r0, _08116E54
	add r0, r12
	ldr r7, [r0]
	ldr r4, _08116E58
	mov r5, r9
_08116E04:
	lsls r0, r2, 2
	adds r3, r5, r0
	ldr r0, [r3]
	ands r0, r7
	cmp r0, 0
	beq _08116E18
	adds r1, r2, r4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08116E18:
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, 0x3
	bls _08116E28
	ldr r0, [r6, 0x8]
	ldr r1, [r3]
	orrs r0, r1
	str r0, [r6, 0x8]
_08116E28:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bls _08116E04
	mov r0, r12
	add r0, r8
	ldrb r0, [r0, 0x2]
_08116E38:
	add sp, 0x1C
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08116E48: .4byte 0x02019000
_08116E4C: .4byte gTasks
_08116E50: .4byte gUnknown_083F8D90
_08116E54: .4byte gUnknown_083F8D94
_08116E58: .4byte 0x02019016
	thumb_func_end sub_8116D54

	thumb_func_start sub_8116E5C
sub_8116E5C: @ 8116E5C
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	lsrs r3, r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x12
	bhi _08116EF0
	cmp r2, 0xF
	bhi _08116EEC
	lsls r0, r2, 2
	ldr r1, _08116E80
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08116E80: .4byte _08116E84
	.align 2, 0
_08116E84:
	.4byte _08116EC4
	.4byte _08116EC8
	.4byte _08116EC8
	.4byte _08116EC8
	.4byte _08116EC8
	.4byte _08116EDC
	.4byte _08116EEC
	.4byte _08116EEC
	.4byte _08116EEC
	.4byte _08116EEC
	.4byte _08116EDC
	.4byte _08116EEC
	.4byte _08116EEC
	.4byte _08116EEC
	.4byte _08116EEC
	.4byte _08116EDC
_08116EC4:
	movs r0, 0x3
	b _08116EF2
_08116EC8:
	adds r0, r2, 0x5
	cmp r3, r0
	beq _08116EE8
	adds r0, 0x5
	cmp r3, r0
	beq _08116EE8
	adds r0, 0x5
	cmp r3, r0
	bne _08116EF0
	b _08116EE8
_08116EDC:
	adds r0, r2, 0x1
	cmp r3, r0
	blt _08116EF0
	adds r0, r2, 0x4
	cmp r3, r0
	bgt _08116EF0
_08116EE8:
	movs r0, 0x1
	b _08116EF2
_08116EEC:
	cmp r3, r2
	beq _08116EE8
_08116EF0:
	movs r0, 0
_08116EF2:
	pop {r1}
	bx r1
	thumb_func_end sub_8116E5C

	thumb_func_start sub_8116EF8
sub_8116EF8: @ 8116EF8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0
	str r0, [sp, 0x18]
	cmp r6, 0xA
	beq _08116F1E
	cmp r6, 0xA
	bgt _08116F1A
	cmp r6, 0x5
	beq _08116F1E
	b _08116F7C
_08116F1A:
	cmp r6, 0xF
	bne _08116F7C
_08116F1E:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r6, 0x5
	ldr r7, _08116F70
	cmp r4, r0
	bge _08116F5E
	adds r1, r7, 0
	subs r1, 0xB8
	ldr r3, _08116F74
	ldr r5, [r1, 0x8]
	adds r6, r3, 0
	adds r6, 0x8
	adds r2, r0, 0
_08116F3A:
	lsls r0, r4, 2
	adds r0, r4
	lsls r1, r0, 2
	adds r0, r1, r6
	ldr r0, [r0]
	ands r0, r5
	cmp r0, 0
	bne _08116F54
	adds r0, r1, r3
	ldrh r0, [r0, 0x10]
	ldr r1, [sp, 0x18]
	orrs r1, r0
	str r1, [sp, 0x18]
_08116F54:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r2
	blt _08116F3A
_08116F5E:
	ldr r0, _08116F78
	ldr r2, [sp, 0x18]
	ands r2, r0
	str r2, [sp, 0x18]
	adds r0, r7, 0
	adds r1, r2, 0
	bl sub_8124CE8
	b _0811713C
	.align 2, 0
_08116F70: .4byte 0x020190b8
_08116F74: .4byte gUnknown_083F8C00
_08116F78: .4byte 0x0000dfff
_08116F7C:
	mov r0, sp
	ldr r1, _08116FC8
	ldm r1!, {r2-r4}
	stm r0!, {r2-r4}
	ldm r1!, {r2-r4}
	stm r0!, {r2-r4}
	subs r0, r6, 0x1
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0x1
	mov r10, r3
	cmp r0, 0x3
	bhi _08116F9A
	movs r4, 0x3
	mov r10, r4
_08116F9A:
	adds r0, r6, 0
	movs r1, 0x5
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 8
	ldr r1, _08116FCC
	adds r0, r1
	lsrs r7, r0, 16
	adds r0, r6, 0
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _08116FF8
	cmp r0, 0x2
	bgt _08116FD4
	cmp r0, 0x1
	beq _08116FE4
	ldr r4, _08116FD0
	b _0811703A
	.align 2, 0
_08116FC8: .4byte gUnknown_083F8E9C
_08116FCC: .4byte 0xffff0000
_08116FD0: .4byte 0x02019000
_08116FD4:
	cmp r0, 0x3
	beq _0811700C
	cmp r0, 0x4
	beq _08117020
	ldr r4, _08116FE0
	b _0811703A
	.align 2, 0
_08116FE0: .4byte 0x02019000
_08116FE4:
	ldr r3, _08116FF0
	ldr r2, _08116FF4
	adds r0, r2, 0
	adds r0, 0x43
	b _08117028
	.align 2, 0
_08116FF0: .4byte gSprites
_08116FF4: .4byte 0x02019000
_08116FF8:
	ldr r3, _08117004
	ldr r2, _08117008
	adds r0, r2, 0
	adds r0, 0x44
	b _08117028
	.align 2, 0
_08117004: .4byte gSprites
_08117008: .4byte 0x02019000
_0811700C:
	ldr r3, _08117018
	ldr r2, _0811701C
	adds r0, r2, 0
	adds r0, 0x45
	b _08117028
	.align 2, 0
_08117018: .4byte gSprites
_0811701C: .4byte 0x02019000
_08117020:
	ldr r3, _08117088
	ldr r2, _0811708C
	adds r0, r2, 0
	adds r0, 0x46
_08117028:
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	lsls r7, r0, 4
	adds r4, r2, 0
_0811703A:
	mov r2, r10
	cmp r2, 0x1
	bne _08117094
	ldr r1, _08117090
	lsls r2, r6, 2
	adds r0, r2, r6
	lsls r0, 2
	adds r1, 0x8
	adds r0, r1
	ldr r1, [r4, 0x8]
	ldr r0, [r0]
	ands r1, r0
	str r2, [sp, 0x1C]
	cmp r1, 0
	bne _0811713C
	adds r0, r6, 0
	movs r1, 0x5
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	subs r1, r0, 0x1
	lsls r1, 3
	mov r3, sp
	adds r2, r3, r1
	ldrh r1, [r2, 0x2]
	adds r1, r7, r1
	strh r1, [r2, 0x2]
	adds r1, r4, 0
	adds r1, 0xB8
	lsls r0, 3
	subs r0, 0x8
	adds r2, r3, r0
	adds r0, r1, 0
	movs r1, 0xD
	bl sub_812492C
	b _08117122
	.align 2, 0
_08117088: .4byte gSprites
_0811708C: .4byte 0x02019000
_08117090: .4byte gUnknown_083F8C00
_08117094:
	movs r4, 0
	lsls r0, r6, 2
	str r0, [sp, 0x1C]
	ldr r1, _0811714C
	mov r8, r1
	ldr r2, _08117150
	mov r9, r2
_081170A2:
	lsls r0, r4, 2
	adds r0, r4
	adds r0, r6, r0
	adds r0, 0x5
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r5, r0, 2
	mov r0, r9
	adds r0, 0x8
	adds r0, r5, r0
	mov r3, r8
	ldr r1, [r3, 0x8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0811710E
	adds r0, r2, 0
	movs r1, 0x5
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	subs r1, r0, 0x1
	lsls r1, 3
	mov r3, sp
	adds r2, r3, r1
	ldrh r1, [r2, 0x2]
	adds r1, r7, r1
	strh r1, [r2, 0x2]
	adds r1, r4, 0
	adds r1, 0xD
	lsls r1, 24
	lsrs r1, 24
	lsls r0, 3
	subs r0, 0x8
	adds r2, r3, r0
	mov r0, r8
	adds r0, 0xB8
	bl sub_812492C
	mov r0, r10
	cmp r0, 0x3
	bne _08117104
	mov r1, r9
	adds r0, r5, r1
	ldrh r0, [r0, 0x10]
	str r0, [sp, 0x18]
_08117104:
	mov r0, r10
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
_0811710E:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _081170A2
	mov r2, r10
	cmp r2, 0x2
	beq _08117122
	movs r3, 0
	str r3, [sp, 0x18]
_08117122:
	ldr r0, _08117154
	ldr r2, _08117150
	ldr r4, [sp, 0x1C]
	adds r1, r4, r6
	lsls r1, 2
	adds r1, r2
	ldrh r1, [r1, 0x10]
	ldr r2, [sp, 0x18]
	orrs r2, r1
	str r2, [sp, 0x18]
	adds r1, r2, 0
	bl sub_8124CE8
_0811713C:
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811714C: .4byte 0x02019000
_08117150: .4byte gUnknown_083F8C00
_08117154: .4byte 0x020190b8
	thumb_func_end sub_8116EF8

	thumb_func_start sub_8117158
sub_8117158: @ 8117158
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _0811719C
	movs r0, 0x1
	strh r0, [r4, 0x2A]
	movs r0, 0
	movs r1, 0
	bl sub_8117AA8
	ldr r0, _081171A0
	ldr r1, _081171A4
	adds r4, r1
	movs r1, 0x10
	str r1, [sp]
	movs r1, 0xD
	str r1, [sp, 0x4]
	adds r1, r4, 0
	movs r2, 0xE
	movs r3, 0x7
	bl sub_8124E2C
	cmp r5, 0xF
	bhi _08117250
	lsls r0, r5, 2
	ldr r1, _081171A8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811719C: .4byte 0x02019000
_081171A0: .4byte gBG1TilemapBuffer
_081171A4: .4byte 0xfffff800
_081171A8: .4byte _081171AC
	.align 2, 0
_081171AC:
	.4byte _08117360
	.4byte _081171EC
	.4byte _081171EC
	.4byte _081171EC
	.4byte _081171EC
	.4byte _08117220
	.4byte _08117250
	.4byte _08117250
	.4byte _08117250
	.4byte _08117250
	.4byte _08117220
	.4byte _08117250
	.4byte _08117250
	.4byte _08117250
	.4byte _08117250
	.4byte _08117220
_081171EC:
	movs r0, 0x4
	str r0, [sp, 0x18]
	add r1, sp, 0x8
	movs r0, 0
	strb r0, [r1]
	adds r0, r1, 0
	ldrb r0, [r0]
	cmp r0, 0x3
	bhi _08117258
	add r4, sp, 0x10
	adds r3, r1, 0
_08117202:
	ldrb r2, [r3]
	adds r2, r4
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	adds r0, r5, r0
	strb r0, [r2]
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	ldrb r0, [r3]
	ldr r1, [sp, 0x18]
	cmp r0, r1
	bcc _08117202
	b _08117258
_08117220:
	movs r0, 0x5
	str r0, [sp, 0x18]
	add r1, sp, 0x8
	movs r0, 0
	strb r0, [r1]
	adds r0, r1, 0
	ldrb r0, [r0]
	cmp r0, 0x4
	bhi _08117258
	add r3, sp, 0x10
	adds r2, r1, 0
_08117236:
	ldrb r1, [r2]
	adds r1, r3
	ldrb r0, [r2]
	adds r0, r5, r0
	strb r0, [r1]
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	ldrb r0, [r2]
	ldr r1, [sp, 0x18]
	cmp r0, r1
	bcc _08117236
	b _08117258
_08117250:
	movs r0, 0x1
	str r0, [sp, 0x18]
	add r0, sp, 0x10
	strb r5, [r0]
_08117258:
	add r1, sp, 0x8
	movs r0, 0
	strb r0, [r1]
	adds r0, r1, 0
	ldrb r0, [r0]
	ldr r1, [sp, 0x18]
	cmp r0, r1
	bcs _08117360
	mov r0, sp
	adds r0, 0xE
	str r0, [sp, 0x1C]
	add r1, sp, 0x10
	mov r9, r1
	add r0, sp, 0x8
	mov r12, r0
	mov r1, sp
	adds r1, 0xA
	str r1, [sp, 0x20]
_0811727C:
	mov r1, r12
	ldrb r0, [r1]
	add r0, r9
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	ldr r1, _08117370
	adds r0, r1
	ldrb r0, [r0, 0x6]
	ldr r1, [sp, 0x1C]
	strb r0, [r1]
	mov r1, r12
	ldrb r0, [r1]
	add r0, r9
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	ldr r1, _08117370
	adds r0, r1
	ldrb r0, [r0, 0x3]
	ldr r1, [sp, 0x20]
	strh r0, [r1]
	mov r4, sp
	adds r4, 0x9
	movs r0, 0
	strb r0, [r4]
	ldrb r0, [r4]
	cmp r0, 0x2
	bhi _08117350
	add r5, sp, 0xC
	ldr r7, [sp, 0x20]
	ldr r0, _08117374
	mov r8, r0
	ldr r6, [sp, 0x1C]
	ldr r1, _08117378
	mov r10, r1
_081172C8:
	mov r1, r12
	ldrb r0, [r1]
	add r0, r9
	ldrb r0, [r0]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	ldr r0, _08117370
	adds r1, r0
	adds r3, r4, 0
	ldrb r0, [r4]
	ldrb r1, [r1, 0x4]
	adds r0, r1
	lsls r0, 5
	strh r0, [r5]
	ldrh r0, [r7]
	ldrh r2, [r5]
	adds r2, r0
	lsls r2, 1
	add r2, r8
	ldrb r0, [r6]
	ldrb r1, [r4]
	adds r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 1
	add r0, r10
	ldrh r0, [r0]
	strh r0, [r2]
	ldrh r0, [r7]
	ldrh r2, [r5]
	adds r2, r0
	adds r2, 0x1
	lsls r2, 1
	add r2, r8
	ldrb r0, [r6]
	ldrb r1, [r4]
	adds r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 1
	mov r1, r10
	adds r1, 0x2
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrh r0, [r7]
	ldrh r2, [r5]
	adds r2, r0
	adds r2, 0x2
	lsls r2, 1
	add r2, r8
	ldrb r0, [r6]
	ldrb r1, [r4]
	adds r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 1
	ldr r1, _0811737C
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldrb r0, [r3]
	cmp r0, 0x2
	bls _081172C8
_08117350:
	mov r1, r12
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldrb r0, [r1]
	ldr r1, [sp, 0x18]
	cmp r0, r1
	bcc _0811727C
_08117360:
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08117370: .4byte gUnknown_083F8C00
_08117374: .4byte gBG1TilemapBuffer
_08117378: .4byte 0x020189a0
_0811737C: .4byte 0x020189a4
	thumb_func_end sub_8117158

	thumb_func_start sub_8117380
sub_8117380: @ 8117380
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _081173B8
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x13
	bls _08117398
	movs r4, 0
_08117398:
	ldr r3, _081173BC
	lsls r0, r4, 2
	adds r0, r4
	lsls r2, r0, 2
	adds r0, r2, r3
	ldrb r0, [r0, 0x1]
	lsls r0, 28
	lsrs r0, 28
	cmp r0, 0x4
	beq _081173EC
	cmp r0, 0x4
	bgt _081173C0
	cmp r0, 0x3
	beq _081173C6
	b _08117428
	.align 2, 0
_081173B8: .4byte gUnknown_083F8EF4
_081173BC: .4byte gUnknown_083F8C00
_081173C0:
	cmp r0, 0xC
	beq _0811740C
	b _08117428
_081173C6:
	adds r0, r4, 0
	movs r1, 0x5
	bl __udivsi3
	subs r0, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081173E8
	adds r0, 0x16
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, 0x3
	bhi _08117428
	ldrb r0, [r1]
	adds r0, 0x1
	b _08117402
	.align 2, 0
_081173E8: .4byte 0x02019000
_081173EC:
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08117408
	adds r0, 0x12
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, 0x2
	bhi _08117428
	ldrb r0, [r1]
	adds r0, 0x2
_08117402:
	add r0, sp
	ldrb r0, [r0]
	b _0811742A
	.align 2, 0
_08117408: .4byte 0x02019000
_0811740C:
	ldr r1, _08117424
	adds r0, r3, 0
	adds r0, 0x8
	adds r0, r2, r0
	ldr r1, [r1, 0x8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08117428
	mov r0, sp
	ldrb r0, [r0, 0x4]
	b _0811742A
	.align 2, 0
_08117424: .4byte 0x02019000
_08117428:
	movs r0, 0
_0811742A:
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8117380

	thumb_func_start sub_8117434
sub_8117434: @ 8117434
	push {r4-r6,lr}
	ldr r1, _081174AC
	ldr r4, _081174B0
	ldrh r0, [r4, 0x2C]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0x2E]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0x30]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0x32]
	strh r0, [r1]
	movs r0, 0x2E
	ldrsh r2, [r4, r0]
	ldr r0, _081174B4
	movs r3, 0
	ldrsh r1, [r0, r3]
	adds r1, 0x50
	adds r0, r2, 0
	muls r0, r1
	movs r2, 0xE8
	lsls r2, 7
	subs r2, r0
	movs r6, 0x2C
	ldrsh r5, [r4, r6]
	ldr r0, _081174B8
	movs r6, 0
	ldrsh r3, [r0, r6]
	adds r3, 0x74
	adds r0, r5, 0
	muls r0, r3
	subs r2, r0
	movs r5, 0x32
	ldrsh r0, [r4, r5]
	muls r0, r1
	movs r1, 0xA8
	lsls r1, 7
	subs r1, r0
	movs r6, 0x30
	ldrsh r0, [r4, r6]
	muls r0, r3
	subs r1, r0
	ldr r0, _081174BC
	strh r2, [r0]
	adds r0, 0x2
	ldr r3, _081174C0
	ands r2, r3
	asrs r2, 16
	strh r2, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	ands r1, r3
	asrs r1, 16
	strh r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081174AC: .4byte REG_BG2PA
_081174B0: .4byte 0x02019000
_081174B4: .4byte gSpriteCoordOffsetY
_081174B8: .4byte gSpriteCoordOffsetX
_081174BC: .4byte REG_BG2X_L
_081174C0: .4byte 0x0fff0000
	thumb_func_end sub_8117434

	thumb_func_start sub_81174C4
sub_81174C4: @ 81174C4
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	muls r0, r1
	adds r1, r0, 0
	cmp r0, 0
	bge _081174D8
	adds r1, 0xFF
_081174D8:
	lsls r0, r1, 8
	asrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_81174C4

	thumb_func_start sub_81174E0
sub_81174E0: @ 81174E0
	push {lr}
	adds r1, r0, 0
	movs r0, 0x80
	lsls r0, 9
	lsls r1, 16
	asrs r1, 16
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_81174E0

	thumb_func_start sub_81174F8
sub_81174F8: @ 81174F8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _08117520
	bl sub_814AAF8
	ldr r1, _08117524
	adds r0, r4, 0
	bl sub_80F914C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08117520: .4byte 0x00002d9e
_08117524: .4byte gUnknown_083F8EB4
	thumb_func_end sub_81174F8

	thumb_func_start sub_8117528
sub_8117528: @ 8117528
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08117554
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811754C
	movs r0, 0
	bl SetVBlankCallback
	ldr r0, _08117558
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_0811754C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08117554: .4byte gPaletteFade
_08117558: .4byte sub_8115384
	thumb_func_end sub_8117528

	thumb_func_start sub_811755C
sub_811755C: @ 811755C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1A
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	bl MenuZeroFillScreen
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r2, _081175B4
	ldrb r1, [r2, 0x8]
	lsls r1, 26
	lsrs r1, 26
	ldrb r3, [r2, 0x4]
	movs r0, 0x40
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x4]
	bl UpdatePaletteFade
	ldr r1, _081175B8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081175BC
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081175B4: .4byte gPaletteFade
_081175B8: .4byte gTasks
_081175BC: .4byte sub_8117528
	thumb_func_end sub_811755C

	thumb_func_start sub_81175C0
sub_81175C0: @ 81175C0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl MenuZeroFillScreen
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81175C0

	thumb_func_start sub_81175DC
sub_81175DC: @ 81175DC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r1, _08117624
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x8]
	adds r2, r1, 0x1
	strh r2, [r0, 0x8]
	ldr r0, _08117628
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08117608
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x3C
	ble _0811761C
_08117608:
	ldr r1, _0811762C
	movs r0, 0x1
	strh r0, [r1]
	bl MenuZeroFillScreen
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
_0811761C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08117624: .4byte gTasks
_08117628: .4byte gMain
_0811762C: .4byte gUnknown_0202E8CC
	thumb_func_end sub_81175DC

	thumb_func_start sub_8117630
sub_8117630: @ 8117630
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r2, _0811768C
	ldr r0, _08117690
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	lsrs r1, 7
	lsls r1, 1
	adds r0, r1
	adds r0, r2
	ldrb r1, [r0]
	ldr r0, _08117694
	movs r2, 0x2
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	ldr r5, _08117698
	ldr r1, _0811769C
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _081176A0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081176A4
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811768C: .4byte gUnknown_083F8DF0
_08117690: .4byte gUnknown_0202E8CC
_08117694: .4byte gStringVar1
_08117698: .4byte gStringVar4
_0811769C: .4byte gUnknown_081C40DF
_081176A0: .4byte gTasks
_081176A4: .4byte sub_81174F8
	thumb_func_end sub_8117630

	thumb_func_start sub_81176A8
sub_81176A8: @ 81176A8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08117758
	mov r10, r0
	ldr r1, _0811775C
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r6, r0, r1
	movs r0, 0x22
	ldrsh r1, [r6, r0]
	mov r0, r10
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	ldr r5, _08117760
	ldr r1, _08117764
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0
	movs r1, 0
	movs r2, 0x9
	movs r3, 0x3
	bl MenuDrawTextWindow
	adds r0, r5, 0
	movs r1, 0x9
	movs r2, 0x1
	bl sub_8072B4C
	ldr r2, _08117768
	ldr r1, _0811776C
	mov r8, r1
	ldrh r1, [r1]
	movs r0, 0x1
	mov r9, r0
	ands r0, r1
	lsrs r1, 7
	lsls r1, 1
	adds r0, r1
	adds r0, r2
	ldrb r4, [r0]
	mov r0, r10
	adds r1, r4, 0
	movs r2, 0x2
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	movs r1, 0x22
	ldrsh r0, [r6, r1]
	cmp r0, r4
	blt _081177BC
	mov r0, r8
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0811777C
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	beq _0811777C
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08117770
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _08117774
	ldr r2, _08117778
	adds r0, r7, 0
	movs r3, 0x3
	bl sub_8116C34
	b _081177E4
	.align 2, 0
_08117758: .4byte gStringVar1
_0811775C: .4byte gTasks
_08117760: .4byte gStringVar4
_08117764: .4byte gOtherText_Coins
_08117768: .4byte gUnknown_083F8DF0
_0811776C: .4byte gUnknown_0202E8CC
_08117770: .4byte gUnknown_081C4139
_08117774: .4byte sub_8117630
_08117778: .4byte 0x0000ffff
_0811777C:
	ldr r4, _081177AC
	ldr r1, _081177B0
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _081177B4
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _081177B8
	str r1, [r0]
	b _081177E4
	.align 2, 0
_081177AC: .4byte gStringVar4
_081177B0: .4byte gUnknown_081C40DF
_081177B4: .4byte gTasks
_081177B8: .4byte sub_81174F8
_081177BC:
	ldr r1, _081177F4
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r0, _081177F8
	str r0, [r6]
	movs r0, 0
	strh r0, [r6, 0x22]
	strh r0, [r6, 0x8]
_081177E4:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081177F4: .4byte gUnknown_081C411C
_081177F8: .4byte sub_81175DC
	thumb_func_end sub_81176A8

	thumb_func_start sub_81177FC
sub_81177FC: @ 81177FC
	push {lr}
	bl ScriptContext2_Enable
	ldr r0, _08117828
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811782C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _08117830
	ldr r2, _08117834
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r1, 0x22]
	pop {r0}
	bx r0
	.align 2, 0
_08117828: .4byte sub_81176A8
_0811782C: .4byte gTasks
_08117830: .4byte gSaveBlock1
_08117834: .4byte 0x00000494
	thumb_func_end sub_81177FC

	thumb_func_start sub_8117838
sub_8117838: @ 8117838
	push {r4,lr}
	lsls r0, 24
	cmp r0, 0
	bne _08117884
	bl FreeAllSpritePalettes
	ldr r0, _08117870
	bl LoadSpritePalettes
	ldr r0, _08117874
	ldr r4, _08117878
	adds r1, r4, 0
	bl LZ77UnCompWram
	ldr r0, _0811787C
	movs r2, 0xE0
	lsls r2, 4
	adds r1, r4, r2
	bl LZ77UnCompWram
	ldr r0, _08117880
	movs r1, 0x80
	lsls r1, 5
	adds r4, r1
	adds r1, r4, 0
	bl LZ77UnCompWram
	b _08117888
	.align 2, 0
_08117870: .4byte gUnknown_083F9E30
_08117874: .4byte gUnknown_083F92A8
_08117878: .4byte 0x02017000
_0811787C: .4byte gUnknown_083F90FC
_08117880: .4byte gUnknown_083F9D3C
_08117884:
	bl FreeAllSpritePalettes
_08117888:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8117838

	thumb_func_start sub_8117890
sub_8117890: @ 8117890
	push {r4-r6,lr}
	adds r4, r1, 0
	adds r6, r2, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, [r0, 0x4]
	ldrb r3, [r1]
	movs r1, 0x74
	movs r2, 0x50
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r0, _081178F4
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r6]
	strh r0, [r1, 0x2E]
	strh r4, [r1, 0x30]
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r3]
	adds r1, 0x2C
	ldrb r0, [r1]
	movs r2, 0x40
	orrs r0, r2
	movs r2, 0x80
	orrs r0, r2
	strb r0, [r1]
	ldrh r2, [r6]
	adds r0, r2, 0
	adds r0, 0x1E
	strh r0, [r6]
	lsls r0, 16
	ldr r1, _081178F8
	cmp r0, r1
	bls _081178EC
	ldr r1, _081178FC
	adds r0, r2, r1
	strh r0, [r6]
_081178EC:
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081178F4: .4byte gSprites
_081178F8: .4byte 0x01670000
_081178FC: .4byte 0xfffffeb6
	thumb_func_end sub_8117890

	thumb_func_start sub_8117900
sub_8117900: @ 8117900
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	ldr r4, _08117A50
	ldr r0, [r4]
	ldr r5, _08117A54
	adds r1, r5, 0
	bl LZ77UnCompWram
	str r5, [sp]
	mov r6, sp
	ldrh r1, [r4, 0x6]
	lsls r1, 16
	ldrh r0, [r4, 0x4]
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	ldr r4, _08117A58
	ldr r0, [r4]
	adds r1, r5, 0
	bl LZ77UnCompWram
	str r5, [sp]
	ldrh r0, [r4, 0x4]
	strh r0, [r6, 0x4]
	ldrh r0, [r4, 0x6]
	strh r0, [r6, 0x6]
	mov r0, sp
	bl LoadSpriteSheet
	movs r7, 0
	ldr r0, _08117A5C
	adds r0, r5
	mov r9, r0
	ldr r0, _08117A60
	mov r8, r0
_08117950:
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 27
	lsrs r4, r0, 24
	movs r6, 0
	lsls r5, r7, 2
_0811795C:
	lsls r1, r6, 1
	adds r1, r6
	lsls r1, 3
	ldr r0, _08117A64
	adds r0, r1, r0
	adds r1, 0x94
	adds r2, r4, 0
	adds r2, 0x5C
	movs r3, 0x1E
	bl CreateSprite
	adds r1, r6, 0
	adds r1, 0x1D
	adds r1, r5, r1
	add r1, r9
	strb r0, [r1]
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	adds r0, r4, 0
	adds r0, 0x18
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x47
	bls _081179A0
	movs r4, 0
_081179A0:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bls _0811795C
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x2
	bls _08117950
	movs r7, 0
	ldr r5, _08117A68
	ldr r4, _08117A60
_081179BA:
	lsls r1, r7, 1
	adds r1, r7
	lsls r1, 3
	ldr r0, _08117A6C
	adds r0, r1, r0
	adds r1, 0x94
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x46
	movs r3, 0x1E
	bl CreateSprite
	adds r1, r7, 0
	adds r1, 0x29
	adds r1, r5
	strb r0, [r1]
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x3
	bls _081179BA
	movs r7, 0
	ldr r5, _08117A68
	ldr r4, _08117A60
_08117A00:
	lsls r2, r7, 1
	adds r2, r7
	lsls r2, 3
	ldr r0, _08117A70
	adds r0, r2, r0
	adds r2, 0x5C
	lsls r2, 16
	asrs r2, 16
	movs r1, 0x7E
	movs r3, 0x1E
	bl CreateSprite
	adds r1, r7, 0
	adds r1, 0x2D
	adds r1, r5
	strb r0, [r1]
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x2
	bls _08117A00
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08117A50: .4byte gUnknown_083F9F54
_08117A54: .4byte 0x02000000
_08117A58: .4byte gUnknown_083F9F5C
_08117A5C: .4byte 0x0001903c
_08117A60: .4byte gSprites
_08117A64: .4byte gSpriteTemplate_83FA07C
_08117A68: .4byte 0x0201903c
_08117A6C: .4byte gSpriteTemplate_83F9FD4
_08117A70: .4byte gSpriteTemplate_83FA034
	thumb_func_end sub_8117900

	thumb_func_start unref_sub_8117A74
unref_sub_8117A74: @ 8117A74
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _08117AA0
_08117A7A:
	adds r0, r4, 0
	adds r0, 0x1D
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08117AA4
	adds r0, r1
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xB
	bls _08117A7A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08117AA0: .4byte 0x0201903c
_08117AA4: .4byte gSprites
	thumb_func_end unref_sub_8117A74

	thumb_func_start sub_8117AA8
sub_8117AA8: @ 8117AA8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	cmp r0, 0
	beq _08117AF8
	cmp r0, 0x1
	bne _08117BA8
	movs r3, 0
	ldr r5, _08117AF0
	ldr r4, _08117AF4
	movs r2, 0x4
_08117ACA:
	adds r0, r3, 0
	adds r0, 0x1D
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x12
	bls _08117ACA
	b _08117BA8
	.align 2, 0
_08117AF0: .4byte gSprites
_08117AF4: .4byte 0x0201903c
_08117AF8:
	movs r3, 0
	ldr r0, _08117B48
	mov r12, r0
	ldr r7, _08117B4C
	movs r1, 0x4
	add r1, r12
	mov r9, r1
	ldr r5, _08117B50
	adds r4, r7, 0
	adds r4, 0x3C
	movs r6, 0x5
	negs r6, r6
_08117B10:
	lsls r2, r3, 3
	mov r1, r9
	adds r0, r2, r1
	ldr r1, [r7, 0x8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08117B54
	mov r1, r12
	adds r0, r2, r1
	ldrb r0, [r0, 0x2]
	cmp r0, r8
	beq _08117B54
	adds r0, r3, 0
	adds r0, 0x1D
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _08117B6E
	.align 2, 0
_08117B48: .4byte gUnknown_083F8D90
_08117B4C: .4byte 0x02019000
_08117B50: .4byte gSprites
_08117B54:
	adds r0, r3, 0
	adds r0, 0x1D
	adds r0, r4
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	strb r0, [r1]
_08117B6E:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xB
	bls _08117B10
	cmp r3, 0x12
	bhi _08117BA8
	ldr r6, _08117BB4
	ldr r4, _08117BB8
	movs r5, 0x5
	negs r5, r5
_08117B84:
	adds r0, r3, 0
	adds r0, 0x1D
	adds r0, r4
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r5, 0
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x12
	bls _08117B84
_08117BA8:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08117BB4: .4byte gSprites
_08117BB8: .4byte 0x0201903c
	thumb_func_end sub_8117AA8

	thumb_func_start sub_8117BBC
sub_8117BBC: @ 8117BBC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r5, 0
	ldr r0, _08117C50
	mov r8, r0
	ldr r4, _08117C54
	movs r6, 0x4
_08117BCC:
	ldr r0, _08117C58
	movs r1, 0x74
	movs r2, 0x14
	movs r3, 0xA
	bl CreateSprite
	adds r3, r5, 0
	adds r3, 0x31
	add r3, r8
	strb r0, [r3]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r6
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x1
	strh r1, [r0, 0x2E]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08117C5C
	str r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x5]
	movs r7, 0xD
	negs r7, r7
	adds r2, r7, 0
	ands r1, r2
	orrs r1, r6
	strb r1, [r0, 0x5]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x8
	bl StartSpriteAnim
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08117BCC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08117C50: .4byte 0x0201903c
_08117C54: .4byte gSprites
_08117C58: .4byte gSpriteTemplate_83FA40C
_08117C5C: .4byte sub_81184CC
	thumb_func_end sub_8117BBC

	thumb_func_start sub_8117C60
sub_8117C60: @ 8117C60
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	movs r5, 0
	cmp r0, 0
	beq _08117CAC
	ldr r4, _08117CA4
	ldr r3, _08117CA8
	movs r2, 0x4
_08117C7E:
	adds r0, r5, 0
	adds r0, 0x31
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08117C7E
	b _08117D58
	.align 2, 0
_08117CA4: .4byte gSprites
_08117CA8: .4byte 0x0201903c
_08117CAC:
	ldr r0, _08117CEC
	mov r12, r0
	ldr r6, _08117CF0
	movs r0, 0x3C
	add r0, r12
	mov r8, r0
	ldr r7, _08117CF4
	movs r0, 0x5
	negs r0, r0
	mov r10, r0
_08117CC0:
	mov r0, r12
	adds r0, 0xC
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, 0
	beq _08117CD0
	cmp r5, r9
	bne _08117CF8
_08117CD0:
	adds r0, r5, 0
	adds r0, 0x31
	add r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _08117D4E
	.align 2, 0
_08117CEC: .4byte 0x02019000
_08117CF0: .4byte gSprites
_08117CF4: .4byte gUnknown_083F8C00
_08117CF8:
	adds r3, r5, 0
	adds r3, 0x31
	add r3, r8
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	adds r1, 0x3E
	ldrb r2, [r1]
	mov r0, r10
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r3]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r6
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldrb r0, [r0, 0x3]
	adds r0, 0x1
	lsls r0, 3
	adds r0, 0x4
	strh r0, [r2, 0x20]
	ldrb r0, [r3]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r6
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldrb r0, [r0, 0x4]
	adds r0, 0x1
	lsls r0, 3
	adds r0, 0x3
	strh r0, [r2, 0x22]
_08117D4E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08117CC0
_08117D58:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8117C60

	thumb_func_start sub_8117D68
sub_8117D68: @ 8117D68
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08117D98
	ldr r2, _08117D90
	ldr r0, _08117D94
	adds r0, 0x6C
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _08117DE2
	.align 2, 0
_08117D90: .4byte gSprites
_08117D94: .4byte 0x02019000
_08117D98:
	ldr r4, _08117DE8
	ldr r3, _08117DEC
	adds r3, 0x6C
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldr r0, _08117DF0
	lsls r2, r5, 2
	adds r2, r5
	lsls r2, 2
	adds r2, r0
	ldrb r0, [r2, 0x3]
	adds r0, 0x2
	lsls r0, 3
	strh r0, [r1, 0x20]
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r0, [r2, 0x4]
	adds r0, 0x2
	lsls r0, 3
	strh r0, [r1, 0x22]
_08117DE2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08117DE8: .4byte gSprites
_08117DEC: .4byte 0x02019000
_08117DF0: .4byte gUnknown_083F8C00
	thumb_func_end sub_8117D68

	thumb_func_start sub_8117DF4
sub_8117DF4: @ 8117DF4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	ldr r4, _08117E84
	ldr r0, [r4]
	ldr r5, _08117E88
	adds r1, r5, 0
	bl LZ77UnCompWram
	str r5, [sp, 0x4]
	add r0, sp, 0x4
	ldrh r2, [r4, 0x6]
	lsls r2, 16
	ldrh r1, [r4, 0x4]
	orrs r1, r2
	str r1, [r0, 0x4]
	bl LoadSpriteSheet
	movs r1, 0xF
	mov r0, sp
	strh r1, [r0]
	movs r0, 0
	ldr r1, _08117E8C
	adds r1, r5
	mov r8, r1
	ldr r7, _08117E90
_08117E2A:
	movs r4, 0
	adds r6, r0, 0x1
	lsls r5, r0, 2
_08117E30:
	adds r1, r5, r4
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldr r1, _08117E94
	adds r0, r1
	movs r1, 0x28
	mov r2, sp
	bl sub_8117890
	adds r1, r4, 0x7
	adds r1, r5, r1
	add r1, r8
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	adds r1, 0x2C
	ldrb r0, [r1]
	movs r2, 0x40
	orrs r0, r2
	movs r2, 0x80
	orrs r0, r2
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08117E30
	lsls r0, r6, 24
	lsrs r0, 24
	cmp r0, 0x2
	bls _08117E2A
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08117E84: .4byte gUnknown_083F9EE8
_08117E88: .4byte 0x02000000
_08117E8C: .4byte 0x0001903c
_08117E90: .4byte gSprites
_08117E94: .4byte gSpriteTemplate_83FA0DC
	thumb_func_end sub_8117DF4

	thumb_func_start sub_8117E98
sub_8117E98: @ 8117E98
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r0, _08117F1C
	ldrh r1, [r6, 0x2E]
	ldrh r0, [r0, 0x24]
	adds r1, r0
	lsls r1, 16
	lsrs r4, r1, 16
	asrs r1, 16
	ldr r0, _08117F20
	cmp r1, r0
	ble _08117EB8
	ldr r2, _08117F24
	adds r0, r1, r2
	lsls r0, 16
	lsrs r4, r0, 16
_08117EB8:
	adds r0, r4, 0
	bl Sin2
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	bl Cos2
	lsls r2, r5, 16
	asrs r2, 16
	movs r3, 0x30
	ldrsh r1, [r6, r3]
	muls r1, r2
	asrs r1, 12
	strh r1, [r6, 0x24]
	lsls r0, 16
	asrs r4, r0, 16
	negs r1, r4
	movs r3, 0x30
	ldrsh r0, [r6, r3]
	muls r0, r1
	asrs r0, 12
	strh r0, [r6, 0x26]
	ldrb r0, [r6, 0x3]
	lsls r0, 26
	lsrs r3, r0, 27
	cmp r2, 0
	bge _08117EF2
	adds r2, 0xF
_08117EF2:
	lsls r0, r2, 12
	lsrs r5, r0, 16
	ldr r1, _08117F28
	lsls r0, r3, 3
	adds r1, r0, r1
	adds r0, r4, 0
	cmp r0, 0
	bge _08117F04
	adds r0, 0xF
_08117F04:
	asrs r0, 4
	strh r0, [r1, 0x6]
	strh r0, [r1]
	strh r5, [r1, 0x2]
	lsls r0, r5, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r1, 0x4]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08117F1C: .4byte 0x02019000
_08117F20: .4byte 0x00000167
_08117F24: .4byte 0xfffffe98
_08117F28: .4byte gOamMatrices
	thumb_func_end sub_8117E98

	thumb_func_start sub_8117F2C
sub_8117F2C: @ 8117F2C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	movs r5, 0
	ldr r7, _081180C8
	mov r6, sp
_08117F3A:
	ldr r0, _081180CC
	lsls r4, r5, 3
	adds r4, r0
	ldr r0, [r4]
	adds r1, r7, 0
	bl LZ77UnCompWram
	str r7, [sp]
	ldrh r2, [r4, 0x4]
	ldr r0, _081180D0
	ldr r1, [r6, 0x4]
	ands r1, r0
	orrs r1, r2
	str r1, [r6, 0x4]
	ldrh r2, [r4, 0x6]
	lsls r2, 16
	ldr r0, _081180D4
	ands r0, r1
	orrs r0, r2
	str r0, [r6, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bls _08117F3A
	ldr r0, _081180D8
	movs r1, 0xD0
	movs r2, 0x10
	movs r3, 0x4
	bl CreateSprite
	ldr r4, _081180DC
	adds r1, r4, 0
	adds r1, 0x50
	strb r0, [r1]
	ldr r3, _081180E0
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	movs r5, 0
	adds r4, 0x3C
	adds r7, r3, 0
_08117FA2:
	lsls r1, r5, 19
	movs r0, 0xC4
	lsls r0, 16
	adds r1, r0
	asrs r1, 16
	ldr r0, _081180E4
	movs r2, 0x18
	movs r3, 0
	bl CreateSprite
	adds r3, r5, 0
	adds r3, 0x15
	adds r3, r4
	strb r0, [r3]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r6, 0x40
	orrs r1, r6
	strb r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _08117FA2
	ldr r0, _081180E8
	movs r1, 0x78
	movs r2, 0x44
	movs r3, 0x4
	bl CreateSprite
	ldr r3, _081180DC
	adds r1, r3, 0
	adds r1, 0x55
	strb r0, [r1]
	ldr r2, _081180E0
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x2C
	ldrb r1, [r0]
	orrs r1, r6
	strb r1, [r0]
	movs r5, 0
	adds r3, 0x3C
	mov r8, r3
	adds r4, r2, 0
_08118020:
	lsls r1, r5, 20
	movs r0, 0xC0
	lsls r0, 16
	adds r1, r0
	asrs r1, 16
	ldr r0, _081180EC
	movs r2, 0x24
	movs r3, 0x4
	bl CreateSprite
	adds r2, r5, 0
	adds r2, 0x1A
	add r2, r8
	strb r0, [r2]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r7, 0x4
	orrs r1, r7
	strb r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r6, 0x40
	orrs r1, r6
	strb r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _08118020
	ldr r0, _081180F0
	movs r1, 0x98
	movs r2, 0x60
	movs r3, 0x9
	bl CreateSprite
	ldr r3, _081180DC
	adds r3, 0x6C
	strb r0, [r3]
	ldr r4, _081180E0
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r7
	strb r0, [r1, 0x5]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x2C
	ldrb r1, [r0]
	orrs r1, r6
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r7
	strb r1, [r0]
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081180C8: .4byte 0x02000000
_081180CC: .4byte gUnknown_083FA21C
_081180D0: .4byte 0xffff0000
_081180D4: .4byte 0x0000ffff
_081180D8: .4byte gSpriteTemplate_83FA2B0
_081180DC: .4byte 0x02019000
_081180E0: .4byte gSprites
_081180E4: .4byte gSpriteTemplate_83FA2C8
_081180E8: .4byte gSpriteTemplate_83FA2E0
_081180EC: .4byte gSpriteTemplate_83FA2F8
_081180F0: .4byte gSpriteTemplate_83FA310
	thumb_func_end sub_8117F2C

	thumb_func_start sub_81180F4
sub_81180F4: @ 81180F4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r7, r0, 16
	movs r0, 0xFA
	lsls r0, 2
	mov r8, r0
	movs r4, 0
	movs r6, 0
	ldr r1, _081181D4
	mov r9, r1
	ldr r0, _081181D8
	mov r10, r0
_08118114:
	adds r0, r7, 0
	mov r1, r8
	bl __udivsi3
	lsls r0, 24
	lsrs r5, r0, 24
	adds r3, r6, 0
	adds r3, 0x15
	mov r0, r9
	adds r0, 0x3C
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081181D8
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	adds r0, r3, 0
	cmp r5, 0
	bne _0811814E
	cmp r4, 0
	bne _0811814E
	cmp r6, 0x3
	bne _081181A2
_0811814E:
	mov r3, r9
	adds r3, 0x3C
	adds r3, r0, r3
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r4, 0x5
	negs r4, r4
	adds r2, r4, 0
	ands r1, r2
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	mov r1, r10
	adds r3, r0, r1
	adds r4, r3, 0
	adds r4, 0x40
	ldr r1, _081181DC
	adds r0, r1
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r5, 2
	adds r0, r1
	ldrh r2, [r0]
	ldrh r4, [r4]
	adds r2, r4
	ldr r4, _081181E0
	adds r0, r4, 0
	ands r2, r0
	ldrh r0, [r3, 0x4]
	ldr r4, _081181E4
	adds r1, r4, 0
	ands r0, r1
	orrs r0, r2
	strh r0, [r3, 0x4]
	movs r4, 0x1
_081181A2:
	adds r0, r7, 0
	mov r1, r8
	bl __umodsi3
	lsls r0, 16
	lsrs r7, r0, 16
	mov r0, r8
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bls _08118114
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081181D4: .4byte 0x02019000
_081181D8: .4byte gSprites
_081181DC: .4byte gSprites + 0x8
_081181E0: .4byte 0x000003ff
_081181E4: .4byte 0xfffffc00
	thumb_func_end sub_81180F4

	thumb_func_start sub_81181E8
sub_81181E8: @ 81181E8
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08118220
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x13
	bls _08118200
	movs r4, 0
_08118200:
	ldr r3, _08118224
	lsls r0, r4, 2
	adds r0, r4
	lsls r2, r0, 2
	adds r0, r2, r3
	ldrb r0, [r0, 0x1]
	lsls r0, 28
	lsrs r0, 28
	cmp r0, 0x4
	beq _08118254
	cmp r0, 0x4
	bgt _08118228
	cmp r0, 0x3
	beq _0811822E
	b _08118290
	.align 2, 0
_08118220: .4byte gUnknown_083FA608
_08118224: .4byte gUnknown_083F8C00
_08118228:
	cmp r0, 0xC
	beq _08118274
	b _08118290
_0811822E:
	adds r0, r4, 0
	movs r1, 0x5
	bl __udivsi3
	subs r0, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08118250
	adds r0, 0x16
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, 0x3
	bhi _08118290
	ldrb r0, [r1]
	adds r0, 0x1
	b _0811826A
	.align 2, 0
_08118250: .4byte 0x02019000
_08118254:
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08118270
	adds r0, 0x12
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, 0x2
	bhi _08118290
	ldrb r0, [r1]
	adds r0, 0x2
_0811826A:
	add r0, sp
	ldrb r0, [r0]
	b _08118292
	.align 2, 0
_08118270: .4byte 0x02019000
_08118274:
	ldr r1, _0811828C
	adds r0, r3, 0
	adds r0, 0x8
	adds r0, r2, r0
	ldr r1, [r1, 0x8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08118290
	mov r0, sp
	ldrb r0, [r0, 0x4]
	b _08118292
	.align 2, 0
_0811828C: .4byte 0x02019000
_08118290:
	movs r0, 0
_08118292:
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81181E8

	thumb_func_start sub_811829C
sub_811829C: @ 811829C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _081182E8
	adds r1, 0x55
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	ldr r2, _081182EC
	adds r4, r1, r2
	bl sub_81181E8
	adds r3, r4, 0
	adds r3, 0x2B
	strb r0, [r3]
	adds r2, r4, 0
	adds r2, 0x40
	ldr r1, [r4, 0x8]
	ldrb r0, [r3]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0]
	ldrh r2, [r2]
	adds r1, r2
	ldr r2, _081182F0
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r4, 0x4]
	ldr r0, _081182F4
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081182E8: .4byte 0x02019000
_081182EC: .4byte gSprites
_081182F0: .4byte 0x000003ff
_081182F4: .4byte 0xfffffc00
	thumb_func_end sub_811829C

	thumb_func_start sub_81182F8
sub_81182F8: @ 81182F8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r5, 0
	ldr r0, _08118320
	ldrb r1, [r0, 0x19]
	adds r3, r0, 0
	cmp r1, 0x1
	bne _08118310
	movs r5, 0x2
_08118310:
	cmp r2, 0x6
	bls _08118316
	b _08118464
_08118316:
	lsls r0, r2, 2
	ldr r1, _08118324
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08118320: .4byte 0x02019000
_08118324: .4byte _08118328
	.align 2, 0
_08118328:
	.4byte _08118464
	.4byte _08118420
	.4byte _081183F8
	.4byte _081183EC
	.4byte _081183C4
	.4byte _081183B8
	.4byte _08118344
_08118344:
	movs r4, 0
	ldr r5, _081183A8
	ldr r0, _081183AC
	mov r8, r0
	movs r2, 0x5
	negs r2, r2
	mov r12, r2
	adds r6, r5, 0
	adds r6, 0x8
	ldr r7, _081183B0
_08118358:
	adds r3, r4, 0
	adds r3, 0x1A
	add r3, r8
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r2, [r1]
	mov r0, r12
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r5
	adds r2, r3, 0
	adds r2, 0x40
	adds r0, r6
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r1, [r0]
	ldrh r2, [r2]
	adds r1, r2
	ldr r2, _081183B4
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r3, 0x4]
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _08118358
	b _081184B2
	.align 2, 0
_081183A8: .4byte gSprites
_081183AC: .4byte 0x0201903c
_081183B0: .4byte 0xfffffc00
_081183B4: .4byte 0x000003ff
_081183B8:
	ldr r2, _081183C0
	adds r0, r3, 0
	adds r0, 0x58
	b _08118426
	.align 2, 0
_081183C0: .4byte gSprites
_081183C4:
	ldr r2, _081183E8
	adds r0, r3, 0
	adds r0, 0x58
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r2
	adds r4, r3, 0
	adds r4, 0x40
	adds r2, 0x8
	adds r0, r2
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r5, 2
	adds r0, r1
	ldrh r1, [r0, 0x8]
	b _08118442
	.align 2, 0
_081183E8: .4byte gSprites
_081183EC:
	ldr r2, _081183F4
	adds r0, r3, 0
	adds r0, 0x57
	b _08118426
	.align 2, 0
_081183F4: .4byte gSprites
_081183F8:
	ldr r2, _0811841C
	adds r0, r3, 0
	adds r0, 0x57
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r2
	adds r4, r3, 0
	adds r4, 0x40
	adds r2, 0x8
	adds r0, r2
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r5, 2
	adds r0, r1
	ldrh r1, [r0, 0x8]
	b _08118442
	.align 2, 0
_0811841C: .4byte gSprites
_08118420:
	ldr r2, _08118458
	adds r0, r3, 0
	adds r0, 0x56
_08118426:
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r2
	adds r4, r3, 0
	adds r4, 0x40
	adds r2, 0x8
	adds r0, r2
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r5, 2
	adds r0, r1
	ldrh r1, [r0, 0x4]
_08118442:
	ldrh r4, [r4]
	adds r1, r4
	ldr r2, _0811845C
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r3, 0x4]
	ldr r0, _08118460
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	b _081184B2
	.align 2, 0
_08118458: .4byte gSprites
_0811845C: .4byte 0x000003ff
_08118460: .4byte 0xfffffc00
_08118464:
	movs r4, 0
	lsls r6, r5, 2
	ldr r5, _081184BC
	ldr r0, _081184C0
	mov r8, r0
	adds r7, r5, 0
	adds r7, 0x8
	ldr r2, _081184C4
	mov r12, r2
_08118476:
	adds r0, r4, 0
	adds r0, 0x1A
	add r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r5
	adds r2, r3, 0
	adds r2, 0x40
	adds r0, r7
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, r6, r0
	ldrh r1, [r0, 0x8]
	ldrh r2, [r2]
	adds r1, r2
	ldr r2, _081184C8
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r3, 0x4]
	mov r0, r12
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _08118476
_081184B2:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081184BC: .4byte gSprites
_081184C0: .4byte 0x0201903c
_081184C4: .4byte 0xfffffc00
_081184C8: .4byte 0x000003ff
	thumb_func_end sub_81182F8

	thumb_func_start sub_81184CC
sub_81184CC: @ 81184CC
	ldr r1, _081184D4
	ldrh r1, [r1, 0x26]
	strh r1, [r0, 0x24]
	bx lr
	.align 2, 0
_081184D4: .4byte 0x02019000
	thumb_func_end sub_81184CC

	thumb_func_start sub_81184D8
sub_81184D8: @ 81184D8
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r4, _08118544
	ldr r0, [r4]
	ldr r5, _08118548
	adds r1, r5, 0
	bl LZ77UnCompWram
	str r5, [sp]
	ldrh r1, [r4, 0x6]
	lsls r1, 16
	ldrh r0, [r4, 0x4]
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	ldr r0, _0811854C
	movs r1, 0x74
	movs r2, 0x50
	movs r3, 0x51
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08118550
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0xC8
	lsls r0, 9
	adds r5, r0
	ldrh r0, [r5, 0x24]
	movs r2, 0
	strh r0, [r1, 0x2E]
	strh r2, [r1, 0x30]
	adds r3, r1, 0
	adds r3, 0x2C
	ldrb r0, [r3]
	movs r2, 0x40
	orrs r0, r2
	movs r2, 0x80
	orrs r0, r2
	strb r0, [r3]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r1]
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08118544: .4byte gUnknown_083FA42C
_08118548: .4byte 0x02000000
_0811854C: .4byte gSpriteTemplate_83FA434
_08118550: .4byte gSprites
	thumb_func_end sub_81184D8

	thumb_func_start sub_8118554
sub_8118554: @ 8118554
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	ldr r1, _08118574
	lsls r0, 3
	adds r0, r1
	ldr r2, _08118578
	ldrh r1, [r2, 0x2C]
	strh r1, [r0, 0x6]
	ldrh r1, [r2, 0x2C]
	strh r1, [r0]
	ldrh r1, [r2, 0x2E]
	strh r1, [r0, 0x2]
	ldrh r1, [r2, 0x30]
	strh r1, [r0, 0x4]
	bx lr
	.align 2, 0
_08118574: .4byte gOamMatrices
_08118578: .4byte 0x02019000
	thumb_func_end sub_8118554

	thumb_func_start sub_811857C
sub_811857C: @ 811857C
	push {r4-r6,lr}
	movs r4, 0
	ldr r6, _081185DC
	ldr r5, _081185E0
_08118584:
	movs r3, 0x39
	subs r3, r4
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _081185E4
	movs r1, 0x74
	movs r2, 0x50
	bl CreateSprite
	adds r3, r4, r6
	strb r0, [r3]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _081185CA
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
_081185CA:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _08118584
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081185DC: .4byte 0x0201903c
_081185E0: .4byte gSprites
_081185E4: .4byte gSpriteTemplate_83FA40C
	thumb_func_end sub_811857C

	thumb_func_start sub_81185E8
sub_81185E8: @ 81185E8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _08118660
	adds r0, 0x3C
	ldrb r5, [r0]
	movs r6, 0
	ldr r7, _08118664
	movs r0, 0x1C
	adds r0, r7
	mov r10, r0
	movs r1, 0x2E
	adds r1, r7
	mov r9, r1
	mov r8, r6
_0811860A:
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	adds r0, r4, r7
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r3]
	mov r1, r10
	adds r2, r4, r1
	ldr r1, _08118668
	str r1, [r2]
	movs r1, 0
	bl StartSpriteAnim
	movs r1, 0
	adds r2, r5, 0x1
	adds r3, r6, 0x1
_08118632:
	lsls r0, r1, 1
	adds r0, r4
	add r0, r9
	mov r5, r8
	strh r5, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x7
	bls _08118632
	lsls r0, r2, 24
	lsrs r5, r0, 24
	lsls r0, r3, 24
	lsrs r6, r0, 24
	cmp r6, 0x5
	bls _0811860A
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08118660: .4byte 0x02019000
_08118664: .4byte gSprites
_08118668: .4byte SpriteCallbackDummy
	thumb_func_end sub_81185E8

	thumb_func_start sub_811866C
sub_811866C: @ 811866C
	push {r4,r5,lr}
	adds r3, r0, 0
	ldr r0, _0811869C
	ldrh r4, [r0, 0x24]
	movs r2, 0x24
	ldrsh r1, [r0, r2]
	ldrh r2, [r3, 0x34]
	movs r5, 0x34
	ldrsh r0, [r3, r5]
	cmp r1, r0
	ble _081186A8
	movs r1, 0xB4
	lsls r1, 1
	adds r0, r2, r1
	subs r2, r0, r4
	strh r2, [r3, 0x3A]
	lsls r1, r2, 16
	ldr r0, _081186A0
	cmp r1, r0
	ble _081186AC
	ldr r5, _081186A4
	adds r0, r2, r5
	b _081186AA
	.align 2, 0
_0811869C: .4byte 0x02019000
_081186A0: .4byte 0x01670000
_081186A4: .4byte 0xfffffe98
_081186A8:
	subs r0, r2, r4
_081186AA:
	strh r0, [r3, 0x3A]
_081186AC:
	movs r1, 0x3A
	ldrsh r0, [r3, r1]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_811866C

	thumb_func_start sub_81186B8
sub_81186B8: @ 81186B8
	push {r4,lr}
	bl sub_811866C
	ldr r4, _081186E0
	lsls r0, 16
	asrs r0, 16
	bl __floatsisf
	ldr r1, _081186E4
	bl __divsf3
	bl __fixunssfsi
	adds r4, 0x7E
	strb r0, [r4]
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081186E0: .4byte 0x02019000
_081186E4: .4byte 0x41f00000
	thumb_func_end sub_81186B8

	thumb_func_start sub_81186E8
sub_81186E8: @ 81186E8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_811866C
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1E
	bl __modsi3
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0xE
	bne _08118708
	movs r0, 0
	strh r0, [r4, 0x32]
	b _0811871E
_08118708:
	cmp r1, 0xD
	bgt _08118710
	movs r0, 0xE
	b _08118712
_08118710:
	movs r0, 0x2B
_08118712:
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
_0811871E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81186E8

	thumb_func_start sub_8118724
sub_8118724: @ 8118724
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	ldr r5, _08118770
	adds r4, r5, 0
	adds r4, 0x8C
	adds r1, r5, 0
	adds r1, 0x90
	ldr r0, [r4]
	ldr r1, [r1]
	bl __addsf3
	adds r1, r0, 0
	str r1, [r4]
	movs r0, 0x88
	adds r0, r5
	mov r8, r0
	ldr r0, [r0]
	bl __addsf3
	adds r4, r0, 0
	mov r1, r8
	str r4, [r1]
	ldr r7, _08118774
	adds r1, r7, 0
	bl __gesf2
	cmp r0, 0
	blt _08118778
	adds r0, r4, 0
	adds r1, r7, 0
	bl __subsf3
	mov r2, r8
	str r0, [r2]
	b _08118790
	.align 2, 0
_08118770: .4byte 0x02019000
_08118774: .4byte 0x43b40000
_08118778:
	ldr r1, _08118824
	adds r0, r4, 0
	bl __ltsf2
	cmp r0, 0
	bge _08118790
	adds r0, r4, 0
	adds r1, r7, 0
	bl __addsf3
	mov r1, r8
	str r0, [r1]
_08118790:
	adds r0, r5, 0
	adds r0, 0x88
	ldr r0, [r0]
	bl __fixsfsi
	strh r0, [r6, 0x34]
	adds r4, r5, 0
	adds r4, 0x98
	adds r1, r5, 0
	adds r1, 0x9C
	ldr r0, [r4]
	ldr r1, [r1]
	bl __addsf3
	adds r1, r0, 0
	str r1, [r4]
	subs r4, 0x4
	ldr r0, [r4]
	bl __addsf3
	str r0, [r4]
	bl __fixsfsi
	strh r0, [r6, 0x36]
	ldrh r0, [r6, 0x34]
	bl Sin2
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrh r0, [r6, 0x34]
	bl Cos2
	lsls r4, 16
	asrs r4, 16
	movs r2, 0x36
	ldrsh r1, [r6, r2]
	muls r1, r4
	asrs r1, 12
	strh r1, [r6, 0x24]
	lsls r0, 16
	asrs r0, 16
	negs r0, r0
	movs r2, 0x36
	ldrsh r1, [r6, r2]
	muls r0, r1
	asrs r0, 12
	strh r0, [r6, 0x26]
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08118818
	ldr r0, _08118828
	ldr r4, _0811882C
	ldrh r2, [r6, 0x24]
	lsls r2, 24
	asrs r2, 24
	adds r1, r4, 0
	bl m4aMPlayPanpotControl
	ldr r0, _08118830
	ldrh r2, [r6, 0x24]
	lsls r2, 24
	asrs r2, 24
	adds r1, r4, 0
	bl m4aMPlayPanpotControl
_08118818:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08118824: .4byte 0x00000000
_08118828: .4byte gMPlay_SE1
_0811882C: .4byte 0x0000ffff
_08118830: .4byte gMPlay_SE2
	thumb_func_end sub_8118724

	thumb_func_start sub_8118834
sub_8118834: @ 8118834
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r1, _0811888C
	ldrh r0, [r5, 0x3A]
	ldrh r1, [r1, 0x24]
	adds r2, r0, r1
	strh r2, [r5, 0x34]
	lsls r1, r2, 16
	ldr r0, _08118890
	cmp r1, r0
	ble _08118850
	ldr r1, _08118894
	adds r0, r2, r1
	strh r0, [r5, 0x34]
_08118850:
	ldrh r0, [r5, 0x34]
	bl Sin2
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrh r0, [r5, 0x34]
	bl Cos2
	lsls r4, 16
	asrs r4, 16
	movs r2, 0x36
	ldrsh r1, [r5, r2]
	muls r1, r4
	asrs r1, 12
	strh r1, [r5, 0x24]
	lsls r0, 16
	asrs r0, 16
	negs r0, r0
	movs r2, 0x36
	ldrsh r1, [r5, r2]
	muls r0, r1
	ldr r1, _08118898
	asrs r0, 12
	ldrh r1, [r1]
	adds r0, r1
	strh r0, [r5, 0x26]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811888C: .4byte 0x02019000
_08118890: .4byte 0x01670000
_08118894: .4byte 0xfffffe98
_08118898: .4byte gSpriteCoordOffsetY
	thumb_func_end sub_8118834

	thumb_func_start sub_811889C
sub_811889C: @ 811889C
	push {r4-r6,lr}
	adds r5, r0, 0
	bl sub_8118724
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x36]
	adds r0, 0x84
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xD4
	bls _081188C2
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	b _081188CE
_081188C2:
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
_081188CE:
	strb r0, [r2]
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	cmp r0, 0x1D
	ble _0811898E
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _08118908
	ldr r6, _08118900
	adds r4, r6, 0
	adds r4, 0x94
	adds r0, r6, 0
	adds r0, 0xA0
	ldr r0, [r0]
	ldr r1, _08118904
	bl __subsf3
	adds r1, r0, 0
	ldr r0, [r4]
	bl __lesf2
	cmp r0, 0
	bgt _0811898E
	b _08118926
	.align 2, 0
_08118900: .4byte 0x02019000
_08118904: .4byte 0x40000000
_08118908:
	ldr r6, _08118994
	adds r4, r6, 0
	adds r4, 0x94
	adds r0, r6, 0
	adds r0, 0xA0
	ldr r0, [r0]
	ldr r1, _08118998
	bl __subsf3
	adds r1, r0, 0
	ldr r0, [r4]
	bl __gesf2
	cmp r0, 0
	blt _0811898E
_08118926:
	adds r1, r6, 0
	adds r1, 0x7D
	movs r0, 0xFF
	strb r0, [r1]
	ldrb r1, [r6, 0x3]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r6, 0x3]
	adds r0, r5, 0
	adds r0, 0x2B
	ldrb r1, [r0]
	adds r1, 0x3
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	adds r0, r5, 0
	bl sub_81186B8
	movs r0, 0x1E
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl sub_811866C
	movs r1, 0x3A
	ldrsh r0, [r5, r1]
	movs r1, 0x1E
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 1
	adds r1, 0xF
	strh r1, [r5, 0x3A]
	ldr r0, _0811899C
	str r0, [r5, 0x1C]
	movs r0, 0x47
	bl m4aSongNumStartOrChange
	adds r2, r6, 0
	adds r2, 0x9C
	adds r1, r6, 0
	adds r1, 0x98
	ldr r0, _081189A0
	str r0, [r1]
	str r0, [r2]
	subs r1, 0xC
	ldr r0, _081189A4
	str r0, [r1]
_0811898E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08118994: .4byte 0x02019000
_08118998: .4byte 0x40000000
_0811899C: .4byte sub_8118834
_081189A0: .4byte 0x00000000
_081189A4: .4byte 0xbf800000
	thumb_func_end sub_811889C

	thumb_func_start sub_81189A8
sub_81189A8: @ 81189A8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r7, r0, 0
	bl sub_8118724
	movs r1, 0x34
	ldrsh r0, [r7, r1]
	cmp r0, 0
	beq _081189C6
	cmp r0, 0xB4
	beq _08118A2C
	b _08118B0C
_081189C6:
	movs r1, 0x2E
	ldrsh r0, [r7, r1]
	cmp r0, 0x1
	bne _081189D0
	b _08118B0C
_081189D0:
	movs r1, 0x3C
	ldrsh r0, [r7, r1]
	bl __floatsisf
	mov r8, r0
	ldr r0, _08118A24
	mov r9, r0
	ldr r1, _08118A28
	mov r10, r1
	ldrb r4, [r1, 0x4]
	lsls r4, 30
	lsrs r0, r4, 25
	add r0, r9
	ldrb r0, [r0, 0x1]
	bl __floatsisf
	adds r1, r0, 0
	mov r0, r8
	bl __mulsf3
	adds r6, r0, 0
	lsrs r0, r4, 25
	add r0, r9
	ldrb r0, [r0, 0x2]
	subs r0, 0x1
	bl __floatsisf
	adds r1, r0, 0
	adds r0, r6, 0
	bl __addsf3
	adds r5, r0, 0
	lsrs r4, 25
	add r4, r9
	ldrh r0, [r4, 0xC]
	bl __floatsisf
	adds r1, r0, 0
	mov r0, r8
	bl __divsf3
	b _08118A8A
	.align 2, 0
_08118A24: .4byte gUnknown_083F8DF4
_08118A28: .4byte 0x02019000
_08118A2C:
	movs r1, 0x2E
	ldrsh r0, [r7, r1]
	cmp r0, 0
	beq _08118B0C
	movs r1, 0x3C
	ldrsh r0, [r7, r1]
	bl __floatsisf
	mov r8, r0
	ldr r0, _08118B1C
	mov r9, r0
	ldr r1, _08118B20
	mov r10, r1
	ldrb r4, [r1, 0x4]
	lsls r4, 30
	lsrs r0, r4, 25
	add r0, r9
	ldrb r0, [r0, 0x1]
	bl __floatsisf
	adds r1, r0, 0
	mov r0, r8
	bl __mulsf3
	adds r6, r0, 0
	lsrs r0, r4, 25
	add r0, r9
	ldrb r0, [r0, 0x2]
	subs r0, 0x1
	bl __floatsisf
	adds r1, r0, 0
	adds r0, r6, 0
	bl __addsf3
	adds r5, r0, 0
	lsrs r4, 25
	add r4, r9
	ldrh r0, [r4, 0xC]
	bl __floatsisf
	adds r1, r0, 0
	mov r0, r8
	bl __divsf3
	bl __negsf2
_08118A8A:
	adds r2, r0, 0
	mov r6, r10
	adds r1, r6, 0
	adds r1, 0xA0
	adds r0, r6, 0
	adds r0, 0x94
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r6, 0
	adds r0, 0x98
	str r2, [r0]
	movs r0, 0x9C
	adds r0, r6
	mov r8, r0
	adds r0, r2, 0
	adds r1, r2, 0
	bl __addsf3
	adds r1, r5, 0
	bl __divsf3
	adds r4, r0, 0
	adds r0, r5, 0
	adds r1, r5, 0
	bl __mulsf3
	adds r1, r0, 0
	ldr r0, _08118B24
	bl __divsf3
	adds r1, r0, 0
	adds r0, r4, 0
	bl __addsf3
	bl __negsf2
	mov r1, r8
	str r0, [r1]
	adds r1, r6, 0
	adds r1, 0x8C
	ldr r0, _08118B28
	str r0, [r1]
	adds r2, r7, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r0, r7, 0
	adds r0, 0x2A
	movs r2, 0
	strb r2, [r0]
	adds r3, r7, 0
	adds r3, 0x3F
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	ldr r0, _08118B2C
	str r0, [r7, 0x1C]
	strh r2, [r7, 0x32]
_08118B0C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08118B1C: .4byte gUnknown_083F8DF4
_08118B20: .4byte 0x02019000
_08118B24: .4byte 0x40000000
_08118B28: .4byte 0x00000000
_08118B2C: .4byte sub_811889C
	thumb_func_end sub_81189A8

	thumb_func_start sub_8118B30
sub_8118B30: @ 8118B30
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	bl __floatsisf
	adds r4, r0, 0
	ldr r1, _08118BCC
	bl __mulsf3
	adds r1, r4, 0
	bl __mulsf3
	bl __fixsfsi
	adds r1, r0, 0
	subs r1, 0x2D
	strh r1, [r5, 0x26]
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1D
	ble _08118BC6
	lsls r0, r1, 16
	cmp r0, 0
	blt _08118BC6
	ldr r4, _08118BD0
	adds r1, r4, 0
	adds r1, 0x7D
	movs r0, 0xFF
	strb r0, [r1]
	ldrb r1, [r4, 0x3]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r4, 0x3]
	adds r0, r5, 0
	adds r0, 0x2B
	ldrb r1, [r0]
	adds r1, 0x3
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	adds r0, r5, 0
	bl sub_81186B8
	movs r0, 0x1E
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl sub_811866C
	movs r1, 0x3A
	ldrsh r0, [r5, r1]
	movs r1, 0x1E
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 1
	adds r1, 0xF
	strh r1, [r5, 0x3A]
	ldr r0, _08118BD4
	str r0, [r5, 0x1C]
	movs r0, 0x47
	bl m4aSongNumStartOrChange
	ldrb r0, [r4, 0x3]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r4, 0x3]
_08118BC6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08118BCC: .4byte 0x3d4ccccd
_08118BD0: .4byte 0x02019000
_08118BD4: .4byte sub_8118834
	thumb_func_end sub_8118B30

	thumb_func_start sub_8118BD8
sub_8118BD8: @ 8118BD8
	push {r4,lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x32]
	adds r1, r0, 0x1
	strh r1, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2C
	bgt _08118C1C
	ldrh r4, [r3, 0x26]
	subs r0, r4, 0x1
	strh r0, [r3, 0x26]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x2D
	bne _08118CA2
	ldr r2, _08118C14
	ldr r0, _08118C18
	adds r0, 0x73
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08118CA2
	strh r4, [r3, 0x26]
	b _08118CA2
	.align 2, 0
_08118C14: .4byte gSprites
_08118C18: .4byte 0x02019000
_08118C1C:
	lsls r0, r1, 16
	asrs r0, 16
	movs r2, 0x3C
	ldrsh r1, [r3, r2]
	cmp r0, r1
	bge _08118C68
	ldr r2, _08118C58
	ldr r0, _08118C5C
	adds r0, 0x73
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x2C
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bne _08118CA2
	adds r0, r1, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08118C60
	ldrh r0, [r3, 0x26]
	adds r0, 0x1
	strh r0, [r3, 0x26]
	b _08118CA2
	.align 2, 0
_08118C58: .4byte gSprites
_08118C5C: .4byte 0x02019000
_08118C60:
	ldrh r0, [r3, 0x26]
	subs r0, 0x1
	strh r0, [r3, 0x26]
	b _08118CA2
_08118C68:
	adds r2, r3, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r2, 0
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0x3F
	adds r0, r3
	mov r12, r0
	ldrb r0, [r0]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	mov r1, r12
	strb r0, [r1]
	strh r2, [r3, 0x32]
	ldr r0, _08118CA8
	str r0, [r3, 0x1C]
	movs r0, 0x3D
	bl m4aSongNumStart
_08118CA2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08118CA8: .4byte sub_8118B30
	thumb_func_end sub_8118BD8

	thumb_func_start sub_8118CAC
sub_8118CAC: @ 8118CAC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8118724
	movs r0, 0x34
	ldrsh r1, [r4, r0]
	cmp r1, 0x5A
	beq _08118CC6
	movs r0, 0x87
	lsls r0, 1
	cmp r1, r0
	beq _08118CD0
	b _08118CE0
_08118CC6:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08118CE0
	b _08118CD8
_08118CD0:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08118CE0
_08118CD8:
	ldr r0, _08118CE8
	str r0, [r4, 0x1C]
	movs r0, 0
	strh r0, [r4, 0x32]
_08118CE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08118CE8: .4byte sub_8118BD8
	thumb_func_end sub_8118CAC

	thumb_func_start sub_8118CEC
sub_8118CEC: @ 8118CEC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8118724
	ldr r0, _08118D10
	ldrb r0, [r0, 0x3]
	lsls r0, 27
	lsrs r0, 27
	cmp r0, 0
	beq _08118D04
	cmp r0, 0x1
	beq _08118D18
_08118D04:
	adds r0, r4, 0
	bl sub_8119224
	ldr r0, _08118D14
	b _08118D20
	.align 2, 0
_08118D10: .4byte 0x02019000
_08118D14: .4byte sub_81189A8
_08118D18:
	adds r0, r4, 0
	bl sub_81193D4
	ldr r0, _08118D28
_08118D20:
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08118D28: .4byte sub_8118CAC
	thumb_func_end sub_8118CEC

	thumb_func_start prev_quest_read_x24_hm_usage
prev_quest_read_x24_hm_usage: @ 8118D2C
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_8118724
	ldrh r0, [r5, 0x32]
	subs r0, 0x1
	strh r0, [r5, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	bne _08118D50
	ldr r4, _08118DB8
	adds r4, 0x98
	ldr r0, [r4]
	ldr r1, _08118DBC
	bl __mulsf3
	str r0, [r4]
_08118D50:
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _08118DDC
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _08118DC4
	ldr r1, _08118DB8
	adds r2, r1, 0
	adds r2, 0x7D
	movs r0, 0xFF
	strb r0, [r2]
	ldrb r2, [r1, 0x3]
	movs r0, 0x7F
	ands r0, r2
	strb r0, [r1, 0x3]
	adds r0, r5, 0
	adds r0, 0x2B
	ldrb r1, [r0]
	adds r1, 0x3
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	adds r0, r5, 0
	bl sub_81186B8
	movs r0, 0x1E
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl sub_811866C
	movs r1, 0x3A
	ldrsh r0, [r5, r1]
	movs r1, 0x1E
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 1
	adds r1, 0xF
	strh r1, [r5, 0x3A]
	ldr r0, _08118DC0
	str r0, [r5, 0x1C]
	movs r0, 0x47
	bl m4aSongNumStartOrChange
	b _08118DDC
	.align 2, 0
_08118DB8: .4byte 0x02019000
_08118DBC: .4byte 0xbf800000
_08118DC0: .4byte sub_8118834
_08118DC4:
	adds r0, r5, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	movs r0, 0x38
	bl m4aSongNumStart
	adds r0, r5, 0
	bl sub_811952C
_08118DDC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end prev_quest_read_x24_hm_usage

	thumb_func_start sub_8118DE4
sub_8118DE4: @ 8118DE4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	bl sub_8118724
	movs r0, 0
	strh r0, [r7, 0x32]
	adds r0, r7, 0
	bl sub_81186B8
	ldr r1, _08118E70
	ldr r6, _08118E74
	movs r0, 0x7E
	adds r0, r6
	mov r8, r0
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r0, [r0]
	ldr r1, [r6, 0x8]
	ands r0, r1
	cmp r0, 0
	bne _08118E7C
	adds r1, r6, 0
	adds r1, 0x7D
	movs r0, 0xFF
	strb r0, [r1]
	ldrb r1, [r6, 0x3]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r6, 0x3]
	adds r0, r7, 0
	adds r0, 0x2B
	ldrb r1, [r0]
	adds r1, 0x3
	lsls r1, 24
	lsrs r1, 24
	adds r0, r7, 0
	bl StartSpriteAnim
	adds r0, r7, 0
	bl sub_81186B8
	movs r0, 0x1E
	strh r0, [r7, 0x36]
	adds r0, r7, 0
	bl sub_811866C
	movs r1, 0x3A
	ldrsh r0, [r7, r1]
	movs r1, 0x1E
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 1
	adds r1, 0xF
	strh r1, [r7, 0x3A]
	ldr r0, _08118E78
	str r0, [r7, 0x1C]
	movs r0, 0x47
	bl m4aSongNumStartOrChange
	b _08118F74
	.align 2, 0
_08118E70: .4byte gUnknown_083F8D90
_08118E74: .4byte 0x02019000
_08118E78: .4byte sub_8118834
_08118E7C:
	movs r0, 0x38
	bl m4aSongNumStart
	bl Random
	movs r2, 0x1
	mov r9, r2
	mov r1, r9
	ands r1, r0
	mov r9, r1
	cmp r1, 0
	beq _08118EC0
	adds r1, r6, 0
	adds r1, 0x8C
	ldr r0, _08118EB8
	str r0, [r1]
	mov r2, r8
	ldrb r0, [r2]
	adds r0, 0x1
	movs r1, 0xC
	bl __modsi3
	lsls r1, r0, 24
	lsrs r2, r1, 24
	adds r1, r6, 0
	adds r1, 0x7F
	strb r0, [r1]
	ldr r5, _08118EBC
	b _08118EF4
	.align 2, 0
_08118EB8: .4byte 0x00000000
_08118EBC: .4byte gUnknown_083F8DF4
_08118EC0:
	adds r4, r6, 0
	adds r4, 0x8C
	ldr r5, _08118F1C
	ldrb r0, [r6, 0x4]
	lsls r0, 30
	lsrs r0, 25
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, [r0]
	adds r0, r1, 0
	bl __addsf3
	str r0, [r4]
	mov r0, r8
	ldrb r4, [r0]
	adds r0, r4, 0
	adds r0, 0xB
	movs r1, 0xC
	bl __modsi3
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r6, 0
	adds r0, 0x7F
	strb r4, [r0]
_08118EF4:
	ldr r0, _08118F20
	lsls r1, r2, 3
	adds r0, 0x4
	adds r1, r0
	ldr r2, _08118F24
	ldr r1, [r1]
	ldr r0, [r2, 0x8]
	ands r1, r0
	cmp r1, 0
	beq _08118F28
	movs r0, 0x1
	strh r0, [r7, 0x2E]
	ldrb r0, [r2, 0x4]
	lsls r0, 30
	lsrs r0, 25
	adds r0, r5
	ldrb r0, [r0, 0x2]
	strh r0, [r7, 0x32]
	b _08118F64
	.align 2, 0
_08118F1C: .4byte gUnknown_083F8DF4
_08118F20: .4byte gUnknown_083F8D90
_08118F24: .4byte 0x02019000
_08118F28:
	strh r1, [r7, 0x2E]
	ldrb r1, [r2, 0x4]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08118F40
	lsls r0, r1, 30
	lsrs r0, 25
	adds r0, r5
	ldrb r0, [r0, 0x1]
	strh r0, [r7, 0x32]
	b _08118F64
_08118F40:
	lsls r0, r1, 30
	lsrs r0, 25
	adds r0, r5
	ldrb r0, [r0, 0x2]
	strh r0, [r7, 0x32]
	mov r1, r9
	cmp r1, 0
	beq _08118F5C
	adds r1, r2, 0
	adds r1, 0x8C
	ldr r0, _08118F58
	b _08118F62
	.align 2, 0
_08118F58: .4byte 0x3f000000
_08118F5C:
	adds r1, r2, 0
	adds r1, 0x8C
	ldr r0, _08118F80
_08118F62:
	str r0, [r1]
_08118F64:
	adds r1, r2, 0
	adds r1, 0x98
	ldr r0, _08118F84
	str r0, [r1]
	ldr r0, _08118F88
	str r0, [r7, 0x1C]
	movs r0, 0x5
	strh r0, [r7, 0x30]
_08118F74:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08118F80: .4byte 0xbfc00000
_08118F84: .4byte 0x3dae147b
_08118F88: .4byte prev_quest_read_x24_hm_usage
	thumb_func_end sub_8118DE4

	thumb_func_start sub_8118F8C
sub_8118F8C: @ 8118F8C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r6, r0, 0
	bl sub_8118724
	ldr r5, _08119018
	movs r0, 0x8C
	adds r0, r5
	mov r8, r0
	ldr r0, [r0]
	ldr r1, _0811901C
	bl __gtsf2
	cmp r0, 0
	bgt _0811906E
	adds r0, r6, 0
	bl sub_81186B8
	adds r0, r6, 0
	bl sub_81186E8
	lsls r0, 16
	cmp r0, 0
	bne _08119030
	adds r1, r5, 0
	adds r1, 0x90
	ldr r0, _08119020
	str r0, [r1]
	ldr r1, _08119024
	mov r9, r1
	ldrb r0, [r5, 0x4]
	lsls r7, r0, 30
	lsrs r0, r7, 25
	add r0, r9
	movs r4, 0x3
	ldrsb r4, [r0, r4]
	adds r0, r4, 0
	bl __floatsisf
	adds r5, r0, 0
	cmp r4, 0
	bge _08118FEC
	ldr r1, _08119028
	bl __addsf3
	adds r5, r0, 0
_08118FEC:
	lsrs r0, r7, 25
	add r0, r9
	ldrb r0, [r0, 0x4]
	adds r0, 0x1
	bl __floatsisf
	adds r1, r0, 0
	adds r0, r5, 0
	bl __divsf3
	adds r1, r0, 0
	mov r2, r8
	ldr r0, [r2]
	bl __subsf3
	mov r1, r8
	str r0, [r1]
	movs r0, 0x4
	strh r0, [r6, 0x30]
	ldr r0, _0811902C
	str r0, [r6, 0x1C]
	b _0811906E
	.align 2, 0
_08119018: .4byte 0x02019000
_0811901C: .4byte 0x3f000000
_08119020: .4byte 0x00000000
_08119024: .4byte gUnknown_083F8DF4
_08119028: .4byte 0x43800000
_0811902C: .4byte sub_8118DE4
_08119030:
	adds r6, r5, 0
	adds r6, 0x90
	ldr r0, [r6]
	ldr r4, _0811907C
	adds r1, r4, 0
	bl __nesf2
	cmp r0, 0
	beq _0811906E
	mov r2, r8
	ldr r0, [r2]
	adds r1, r4, 0
	bl __ltsf2
	cmp r0, 0
	bge _0811906E
	str r4, [r6]
	mov r0, r8
	str r4, [r0]
	adds r4, r5, 0
	adds r4, 0x98
	ldr r0, [r4]
	bl __extendsfdf2
	ldr r2, _08119080
	ldr r3, _08119084
	bl __divdf3
	bl __truncdfsf2
	str r0, [r4]
_0811906E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811907C: .4byte 0x00000000
_08119080: .4byte 0x3ff33333
_08119084: .4byte 0x33333333
	thumb_func_end sub_8118F8C

	thumb_func_start sub_8119088
sub_8119088: @ 8119088
	push {r4-r7,lr}
	adds r6, r0, 0
	bl sub_8118724
	ldr r5, _08119120
	adds r0, r5, 0
	adds r0, 0x94
	ldr r0, [r0]
	ldr r1, _08119124
	bl __gtsf2
	cmp r0, 0
	bgt _0811911A
	adds r7, r5, 0
	adds r7, 0x98
	adds r0, r5, 0
	adds r0, 0x86
	movs r1, 0
	ldrsh r4, [r0, r1]
	adds r0, r4, 0
	bl __floatsisf
	adds r2, r0, 0
	cmp r4, 0
	bge _081190C2
	ldr r1, _08119128
	bl __addsf3
	adds r2, r0, 0
_081190C2:
	ldr r0, _0811912C
	adds r1, r2, 0
	bl __divsf3
	bl __negsf2
	str r0, [r7]
	adds r7, r5, 0
	adds r7, 0x90
	adds r5, 0x8C
	adds r0, r4, 0
	bl __floatsisf
	adds r2, r0, 0
	cmp r4, 0
	bge _081190EA
	ldr r1, _08119128
	bl __addsf3
	adds r2, r0, 0
_081190EA:
	ldr r0, [r5]
	adds r1, r2, 0
	bl __divsf3
	bl __negsf2
	str r0, [r7]
	adds r1, r6, 0
	adds r1, 0x2A
	movs r0, 0x2
	strb r0, [r1]
	adds r2, r6, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x3
	strh r0, [r6, 0x30]
	ldr r0, _08119130
	str r0, [r6, 0x1C]
_0811911A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08119120: .4byte 0x02019000
_08119124: .4byte 0x42200000
_08119128: .4byte 0x47800000
_0811912C: .4byte 0x40800000
_08119130: .4byte sub_8118F8C
	thumb_func_end sub_8119088

	thumb_func_start sub_8119134
sub_8119134: @ 8119134
	push {r4-r7,lr}
	adds r6, r0, 0
	bl sub_8118724
	ldr r4, _081191DC
	adds r0, r4, 0
	adds r0, 0x94
	ldr r0, [r0]
	ldr r1, _081191E0
	bl __gtsf2
	cmp r0, 0
	bgt _081191D4
	movs r0, 0x5D
	bl m4aSongNumStartOrChange
	adds r7, r4, 0
	adds r7, 0x98
	adds r0, r4, 0
	adds r0, 0x84
	movs r1, 0
	ldrsh r5, [r0, r1]
	adds r0, r5, 0
	bl __floatsisf
	adds r2, r0, 0
	cmp r5, 0
	bge _08119174
	ldr r1, _081191E4
	bl __addsf3
	adds r2, r0, 0
_08119174:
	ldr r0, _081191E8
	adds r1, r2, 0
	bl __divsf3
	bl __negsf2
	str r0, [r7]
	adds r7, r4, 0
	adds r7, 0x90
	adds r0, r4, 0
	adds r0, 0x8C
	ldr r1, [r0]
	ldr r0, _081191EC
	bl __subsf3
	adds r4, r0, 0
	adds r0, r5, 0
	bl __floatsisf
	adds r2, r0, 0
	cmp r5, 0
	bge _081191A8
	ldr r1, _081191E4
	bl __addsf3
	adds r2, r0, 0
_081191A8:
	adds r0, r4, 0
	adds r1, r2, 0
	bl __divsf3
	str r0, [r7]
	adds r1, r6, 0
	adds r1, 0x2A
	movs r0, 0x1
	strb r0, [r1]
	adds r2, r6, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x2
	strh r0, [r6, 0x30]
	ldr r0, _081191F0
	str r0, [r6, 0x1C]
_081191D4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081191DC: .4byte 0x02019000
_081191E0: .4byte 0x42700000
_081191E4: .4byte 0x47800000
_081191E8: .4byte 0x41a00000
_081191EC: .4byte 0x3f800000
_081191F0: .4byte sub_8119088
	thumb_func_end sub_8119134

	thumb_func_start sub_81191F4
sub_81191F4: @ 81191F4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	movs r0, 0x1
	strh r0, [r4, 0x30]
	strh r1, [r4, 0x32]
	adds r0, r4, 0
	bl sub_8118724
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08119220
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08119220: .4byte sub_8119134
	thumb_func_end sub_81191F4

	thumb_func_start sub_8119224
sub_8119224: @ 8119224
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r7, r0, 0
	ldr r1, _081193B8
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	ldrh r0, [r7, 0x3C]
	subs r0, 0x2
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	ldr r5, _081193BC
	ldr r0, _081193C0
	movs r2, 0xC
	negs r2, r2
	movs r1, 0x24
	movs r3, 0x32
	bl CreateSprite
	adds r1, r5, 0
	adds r1, 0x73
	strb r0, [r1]
	ldr r4, _081193C4
	movs r0, 0x2E
	ldrsh r2, [r7, r0]
	lsls r2, 2
	mov r1, sp
	adds r0, r1, r2
	movs r3, 0
	ldrsh r1, [r0, r3]
	mov r0, sp
	adds r0, 0x2
	adds r0, r2
	movs r3, 0
	ldrsh r2, [r0, r3]
	adds r0, r4, 0
	movs r3, 0x3B
	bl CreateSprite
	adds r1, r5, 0
	adds r1, 0x74
	strb r0, [r1]
	adds r4, 0x18
	adds r0, r4, 0
	movs r1, 0x24
	movs r2, 0x8C
	movs r3, 0x33
	bl CreateSprite
	adds r1, r5, 0
	adds r1, 0x75
	strb r0, [r1]
	ldr r3, _081193C8
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r2, [r0, 0x1]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x1]
	movs r6, 0
	adds r4, r3, 0
	mov r12, r5
	ldr r0, _081193CC
	mov r8, r0
	mov r10, r12
_081192BE:
	mov r1, r12
	adds r3, r1, r6
	adds r3, 0x73
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	mov r1, r12
	adds r1, 0x73
	ldrb r1, [r1]
	strh r1, [r0, 0x36]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	mov r5, r12
	adds r5, 0x74
	ldrb r1, [r5]
	strh r1, [r0, 0x38]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	mov r1, r12
	adds r1, 0x75
	ldrb r1, [r1]
	strh r1, [r0, 0x3A]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	mov r1, r9
	strh r1, [r0, 0x32]
	ldrb r0, [r3]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	movs r0, 0x3C
	ldrsh r3, [r7, r0]
	mov r0, r12
	ldrb r1, [r0, 0x4]
	lsls r1, 30
	lsrs r0, r1, 25
	add r0, r8
	ldrb r0, [r0, 0x1]
	muls r3, r0
	lsrs r1, 25
	add r1, r8
	ldrb r0, [r1, 0x2]
	ldr r1, _081193D0
	adds r0, r1
	adds r3, r0
	strh r3, [r2, 0x34]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, _081193C8
	cmp r6, 0x2
	bls _081192BE
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
	mov r3, r10
	str r7, [r3, 0x38]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081193B8: .4byte gUnknown_083FA60E
_081193BC: .4byte 0x02019000
_081193C0: .4byte gSpriteTemplate_83FA50C
_081193C4: .4byte gSpriteTemplate_83FA5C0
_081193C8: .4byte gSprites
_081193CC: .4byte gUnknown_083F8DF4
_081193D0: .4byte 0x0000ffff
	thumb_func_end sub_8119224

	thumb_func_start sub_81193D4
sub_81193D4: @ 81193D4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	adds r7, r0, 0
	movs r0, 0
	mov r8, r0
	ldr r1, _08119514
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	ldrh r0, [r7, 0x3C]
	subs r0, 0x2
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	ldr r0, _08119518
	movs r1, 0x2E
	ldrsh r2, [r7, r1]
	lsls r2, 2
	mov r3, sp
	adds r1, r3, r2
	movs r3, 0
	ldrsh r1, [r1, r3]
	mov r4, sp
	adds r4, 0x2
	adds r2, r4, r2
	movs r3, 0
	ldrsh r2, [r2, r3]
	movs r3, 0x32
	bl CreateSprite
	ldr r6, _0811951C
	adds r1, r6, 0
	adds r1, 0x73
	strb r0, [r1]
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _08119520
	adds r0, r5
	ldrh r1, [r7, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnim
	ldr r0, _08119524
	movs r1, 0x2E
	ldrsh r2, [r7, r1]
	lsls r2, 2
	mov r3, sp
	adds r1, r3, r2
	movs r3, 0
	ldrsh r1, [r1, r3]
	adds r4, r2
	movs r3, 0
	ldrsh r2, [r4, r3]
	movs r3, 0x33
	bl CreateSprite
	adds r4, r6, 0
	adds r4, 0x74
	strb r0, [r4]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	mov r0, r9
	lsls r2, r0, 16
	asrs r2, 16
	ldr r3, _08119528
	ldrb r1, [r6, 0x4]
	lsls r1, 30
	lsrs r0, r1, 25
	adds r0, r3
	ldrb r0, [r0, 0x1]
	muls r2, r0
	lsrs r1, 25
	adds r1, r3
	ldrh r0, [r1, 0x10]
	adds r0, 0x2D
	adds r2, r0
	strh r2, [r7, 0x3C]
	adds r3, r6, 0
_081194A2:
	mov r1, r8
	adds r2, r6, r1
	adds r2, 0x73
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r1, r6, 0
	adds r1, 0x73
	ldrb r1, [r1]
	strh r1, [r0, 0x36]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r4]
	strh r1, [r0, 0x38]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r4]
	strh r1, [r0, 0x3A]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r9
	strh r1, [r0, 0x32]
	ldrb r0, [r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrh r0, [r7, 0x3C]
	subs r0, 0x2D
	strh r0, [r1, 0x34]
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x1
	bls _081194A2
	str r7, [r3, 0x38]
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08119514: .4byte gUnknown_083FA616
_08119518: .4byte gSpriteTemplate_83FA524
_0811951C: .4byte 0x02019000
_08119520: .4byte gSprites
_08119524: .4byte gSpriteTemplate_83FA5F0
_08119528: .4byte gUnknown_083F8DF4
	thumb_func_end sub_81193D4

	thumb_func_start sub_811952C
sub_811952C: @ 811952C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	mov r8, r0
	movs r0, 0
	mov r10, r0
	movs r1, 0x5
	mov r9, r1
	movs r2, 0
	str r2, [sp, 0xC]
	mov r0, sp
	movs r1, 0
	movs r2, 0xA
	bl memset
	bl Random
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x10]
	ldr r7, _08119610
	adds r0, r7, 0
	adds r0, 0x7D
	movs r6, 0x1
	strb r6, [r0]
	ldrb r4, [r7, 0x3]
	movs r0, 0x20
	orrs r4, r0
	movs r0, 0x41
	negs r0, r0
	ands r4, r0
	strb r4, [r7, 0x3]
	adds r1, r7, 0
	adds r1, 0x7E
	movs r0, 0xFF
	strb r0, [r1]
	adds r5, r7, 0
	adds r5, 0x88
	mov r3, r8
	movs r1, 0x34
	ldrsh r0, [r3, r1]
	bl __floatsisf
	str r0, [r5]
	adds r1, r7, 0
	adds r1, 0x98
	ldr r0, _08119614
	str r0, [r1]
	adds r3, r7, 0
	adds r3, 0x8C
	ldr r2, _08119618
	ldrb r0, [r7, 0x4]
	lsls r0, 30
	lsrs r1, r0, 25
	adds r2, 0x1C
	adds r1, r2
	ldr r1, [r1]
	str r1, [r3]
	lsrs r0, 30
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 1
	adds r1, 0x21
	lsls r4, 27
	lsrs r4, 27
	subs r6, r4
	lsls r0, r6, 4
	subs r0, r6
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	mov r5, r10
	mov r3, r8
	movs r0, 0x34
	ldrsh r2, [r3, r0]
_081195C8:
	cmp r1, r2
	bge _081195D4
	adds r0, r1, 0
	adds r0, 0x5A
	cmp r2, r0
	ble _08119638
_081195D4:
	cmp r5, 0x3
	beq _0811961C
	adds r0, r1, 0
	adds r0, 0x5A
	lsls r0, 16
	lsrs r1, r0, 16
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _081195C8
_081195EA:
	ldr r0, _08119610
	ldrb r1, [r0, 0x3]
	movs r0, 0x1F
	ands r0, r1
	cmp r0, 0
	beq _08119664
	mov r1, r8
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _08119658
	movs r0, 0x98
	lsls r0, 1
	movs r1, 0x3F
	negs r1, r1
	bl PlayCry1
	b _08119670
	.align 2, 0
_08119610: .4byte 0x02019000
_08119614: .4byte 0x00000000
_08119618: .4byte gUnknown_083F8DF4
_0811961C:
	movs r0, 0x1
	mov r3, r8
	strh r0, [r3, 0x2E]
	ldr r2, _08119634
	ldrb r1, [r2, 0x3]
	subs r0, 0x21
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x3]
	b _081195EA
	.align 2, 0
_08119634: .4byte 0x02019000
_08119638:
	lsrs r0, r5, 1
	mov r1, r8
	strh r0, [r1, 0x2E]
	ldr r3, _08119654
	movs r1, 0x1
	ands r1, r5
	ldrb r2, [r3, 0x3]
	movs r0, 0x20
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x3]
	b _081195EA
	.align 2, 0
_08119654: .4byte 0x02019000
_08119658:
	movs r0, 0x98
	lsls r0, 1
	movs r1, 0x3F
	bl PlayCry1
	b _08119670
_08119664:
	movs r0, 0x99
	lsls r0, 1
	movs r1, 0x3F
	negs r1, r1
	bl PlayCry1
_08119670:
	movs r5, 0x2
	ldr r4, _081196A0
	adds r0, r4, 0
	adds r0, 0x7F
	ldrb r0, [r0]
	adds r0, 0x2
	movs r1, 0xC
	bl __modsi3
	lsls r0, 24
	lsrs r3, r0, 24
	ldrb r1, [r4, 0x3]
	movs r0, 0x1F
	ands r0, r1
	cmp r0, 0x1
	bne _081196A4
	ldrb r1, [r4, 0x4]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x1
	bne _081196A4
	mov r0, r9
	adds r0, 0x6
	b _081196A8
	.align 2, 0
_081196A0: .4byte 0x02019000
_081196A4:
	mov r2, r9
	adds r0, r2, r5
_081196A8:
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	cmp r5, r9
	bcs _0811970E
	ldr r6, _08119734
	ldr r7, _08119738
_081196B6:
	lsls r0, r3, 3
	ldr r1, _0811973C
	adds r0, r1
	ldr r1, [r6, 0x8]
	ldr r2, [r0]
	ands r1, r2
	cmp r1, 0
	bne _081196F8
	mov r0, r10
	adds r1, r0, 0x1
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	add r0, sp
	strb r5, [r0]
	ldr r0, [sp, 0xC]
	cmp r0, 0
	bne _081196F8
	ldrb r0, [r6, 0x1A]
	lsls r0, 28
	lsrs r0, 28
	ldr r1, _08119740
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldr r0, [r0]
	ands r2, r0
	cmp r2, 0
	beq _081196F8
	str r5, [sp, 0xC]
_081196F8:
	adds r0, r3, 0x1
	movs r1, 0xC
	bl __modsi3
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r9
	bcc _081196B6
_0811970E:
	ldrb r0, [r4, 0x3]
	lsls r0, 27
	lsrs r0, 27
	adds r0, 0x1
	ldrb r1, [r4, 0x2]
	ands r0, r1
	cmp r0, 0
	beq _08119756
	ldr r2, [sp, 0xC]
	cmp r2, 0
	beq _08119744
	movs r0, 0xFF
	ldr r3, [sp, 0x10]
	ands r0, r3
	cmp r0, 0xBF
	bhi _08119744
	mov r0, r8
	strh r2, [r0, 0x3C]
	b _08119766
	.align 2, 0
_08119734: .4byte 0x02019000
_08119738: .4byte gUnknown_083F8C0C
_0811973C: .4byte gUnknown_083F8D94
_08119740: .4byte 0x0201901b
_08119744:
	ldr r0, [sp, 0x10]
	mov r1, r10
	bl __modsi3
	add r0, sp
	ldrb r0, [r0]
	mov r1, r8
	strh r0, [r1, 0x3C]
	b _08119766
_08119756:
	ldr r0, [sp, 0x10]
	mov r1, r10
	bl __modsi3
	add r0, sp
	ldrb r0, [r0]
	mov r2, r8
	strh r0, [r2, 0x3C]
_08119766:
	ldr r3, _0811977C
	mov r0, r8
	str r3, [r0, 0x1C]
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811977C: .4byte sub_8118CEC
	thumb_func_end sub_811952C

	thumb_func_start sub_8119780
sub_8119780: @ 8119780
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	adds r1, r0, 0x1
	strh r1, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x34
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _081197CA
	ldrh r0, [r2, 0x20]
	subs r0, 0x2
	strh r0, [r2, 0x20]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _081197CA
	ldr r4, _081197D0
	ldrb r1, [r4, 0x3]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _081197BA
	movs r0, 0x40
	orrs r0, r1
	strb r0, [r4, 0x3]
_081197BA:
	adds r0, r2, 0
	bl DestroySprite
	movs r0, 0
	strb r0, [r4, 0x1]
	ldr r0, _081197D4
	ldrh r0, [r0]
	strh r0, [r4, 0x34]
_081197CA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081197D0: .4byte 0x02019000
_081197D4: .4byte gUnknown_083FA61E
	thumb_func_end sub_8119780

	thumb_func_start sub_81197D8
sub_81197D8: @ 81197D8
	push {r4,lr}
	sub sp, 0x18
	adds r4, r0, 0
	ldr r1, _08119854
	mov r0, sp
	movs r2, 0x18
	bl memcpy
	ldrh r0, [r4, 0x30]
	adds r2, r0, 0x1
	strh r2, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x34
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bge _0811985C
	movs r0, 0x1
	ands r2, r0
	cmp r2, 0
	beq _08119836
	ldr r3, _08119858
	movs r0, 0x3C
	ldrsh r2, [r4, r0]
	lsls r2, 1
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	lsls r0, 3
	adds r2, r0
	mov r1, sp
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r3]
	movs r3, 0x3C
	ldrsh r2, [r4, r3]
	adds r1, r2, 0x1
	adds r0, r1, 0
	cmp r1, 0
	bge _0811982E
	adds r0, r2, 0x4
_0811982E:
	asrs r0, 2
	lsls r0, 2
	subs r0, r1, r0
	strh r0, [r4, 0x3C]
_08119836:
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _08119884
	.align 2, 0
_08119854: .4byte gUnknown_083FA632
_08119858: .4byte gSpriteCoordOffsetY
_0811985C:
	ldr r1, _0811988C
	movs r0, 0
	strh r0, [r1]
	ldr r2, _08119890
	ldr r0, _08119894
	adds r0, 0x73
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x2C
	ldrb r2, [r0]
	movs r1, 0x41
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	adds r0, r4, 0
	bl DestroySprite
_08119884:
	add sp, 0x18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811988C: .4byte gSpriteCoordOffsetY
_08119890: .4byte gSprites
_08119894: .4byte 0x02019000
	thumb_func_end sub_81197D8

	thumb_func_start sub_8119898
sub_8119898: @ 8119898
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	bl __floatsisf
	adds r4, r0, 0
	ldr r1, _08119948
	bl __mulsf3
	adds r1, r4, 0
	bl __mulsf3
	bl __fixsfsi
	strh r0, [r5, 0x26]
	ldr r3, _0811994C
	ldr r2, _08119950
	ldrb r0, [r3, 0x1]
	subs r0, 0x1
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r3, 0x34]
	ldrb r0, [r3, 0x1]
	cmp r0, 0x12
	bhi _081198DE
	adds r0, 0x1
	strb r0, [r3, 0x1]
_081198DE:
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	cmp r0, 0x3C
	ble _08119940
	movs r0, 0
	strh r0, [r5, 0x30]
	ldr r3, _08119954
	str r3, [r5, 0x1C]
	ldr r2, _08119958
	movs r0, 0x3A
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r2, 0
	adds r4, 0x1C
	adds r0, r4
	str r3, [r0]
	movs r0, 0x3A
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _0811995C
	strh r1, [r0, 0x30]
	movs r0, 0x38
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	movs r0, 0x38
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _08119960
	str r1, [r0]
	movs r0, 0xD6
	bl m4aSongNumStart
_08119940:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08119948: .4byte 0x3d1fbe77
_0811994C: .4byte 0x02019000
_08119950: .4byte gUnknown_083FA61E
_08119954: .4byte sub_8119780
_08119958: .4byte gSprites
_0811995C: .4byte 0x0000fffe
_08119960: .4byte sub_81197D8
	thumb_func_end sub_8119898

	thumb_func_start sub_8119964
sub_8119964: @ 8119964
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _081199E4
	ldr r3, _08119990
	ldr r1, [r3, 0x38]
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _08119998
	movs r0, 0x34
	ldrsh r2, [r1, r0]
	ldr r1, _08119994
	ldrb r0, [r3, 0x4]
	lsls r0, 30
	lsrs r0, 25
	adds r0, r1
	ldrh r0, [r0, 0x8]
	b _081199AA
	.align 2, 0
_08119990: .4byte 0x02019000
_08119994: .4byte gUnknown_083F8DF4
_08119998:
	movs r0, 0x34
	ldrsh r2, [r1, r0]
	ldr r1, _081199D8
	ldrb r0, [r3, 0x4]
	lsls r0, 30
	lsrs r0, 25
	adds r0, r1
	ldrh r0, [r0, 0x8]
	adds r0, 0xB4
_081199AA:
	cmp r2, r0
	bne _08119A78
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	movs r0, 0x2B
	bl m4aSongNumStart
	ldr r1, _081199DC
	movs r0, 0x1
	strb r0, [r1, 0x1]
	ldr r0, _081199E0
	ldrh r0, [r0]
	strh r0, [r1, 0x34]
	b _08119A78
	.align 2, 0
_081199D8: .4byte gUnknown_083F8DF4
_081199DC: .4byte 0x02019000
_081199E0: .4byte gUnknown_083FA61E
_081199E4:
	ldr r3, _08119A20
	ldr r2, _08119A24
	ldrb r0, [r3, 0x1]
	subs r0, 0x1
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r3, 0x34]
	ldrb r0, [r3, 0x1]
	cmp r0, 0x12
	bhi _08119A04
	adds r0, 0x1
	strb r0, [r3, 0x1]
_08119A04:
	ldr r1, [r3, 0x38]
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _08119A2C
	movs r0, 0x34
	ldrsh r2, [r1, r0]
	ldr r1, _08119A28
	ldrb r0, [r3, 0x4]
	lsls r0, 30
	lsrs r0, 25
	adds r0, r1
	ldrh r0, [r0, 0xA]
	b _08119A3E
	.align 2, 0
_08119A20: .4byte 0x02019000
_08119A24: .4byte gUnknown_083FA61E
_08119A28: .4byte gUnknown_083F8DF4
_08119A2C:
	movs r0, 0x34
	ldrsh r2, [r1, r0]
	ldr r1, _08119A80
	ldrb r0, [r3, 0x4]
	lsls r0, 30
	lsrs r0, 25
	adds r0, r1
	ldrh r0, [r0, 0xA]
	adds r0, 0xB4
_08119A3E:
	cmp r2, r0
	bne _08119A78
	ldr r2, _08119A84
	movs r0, 0x36
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r2, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08119A88
	str r1, [r0]
	movs r0, 0x36
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldr r0, _08119A8C
	str r0, [r4, 0x1C]
	movs r0, 0
	strh r0, [r4, 0x3C]
_08119A78:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08119A80: .4byte gUnknown_083F8DF4
_08119A84: .4byte gSprites
_08119A88: .4byte sub_8119898
_08119A8C: .4byte SpriteCallbackDummy
	thumb_func_end sub_8119964

	thumb_func_start sub_8119A90
sub_8119A90: @ 8119A90
	adds r0, 0x3E
	ldrb r3, [r0]
	lsls r1, r3, 29
	lsrs r1, 31
	movs r2, 0x1
	eors r2, r1
	lsls r2, 2
	movs r1, 0x5
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	strb r1, [r0]
	bx lr
	thumb_func_end sub_8119A90

	thumb_func_start sub_8119AAC
sub_8119AAC: @ 8119AAC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x22]
	movs r0, 0x22
	ldrsh r1, [r4, r0]
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	ble _08119AC4
	subs r0, r2, 0x1
	strh r0, [r4, 0x22]
	b _08119B12
_08119AC4:
	ldr r0, _08119B18
	str r0, [r4, 0x1C]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	subs r2, 0x12
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x5E
	bl m4aSongNumStop
	adds r0, r4, 0
	bl DestroySprite
	ldr r5, _08119B1C
	ldr r4, _08119B20
	adds r4, 0x74
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
_08119B12:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08119B18: .4byte SpriteCallbackDummy
_08119B1C: .4byte gSprites
_08119B20: .4byte 0x02019000
	thumb_func_end sub_8119AAC

	thumb_func_start sub_8119B24
sub_8119B24: @ 8119B24
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0
	blt _08119B4E
	subs r1, 0x1
	strh r1, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	subs r0, 0x1
	strh r0, [r4, 0x22]
	lsls r1, 16
	cmp r1, 0
	bne _08119BB8
	adds r0, r4, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08119BB8
	b _08119B74
_08119B4E:
	ldrh r1, [r4, 0x34]
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r0, 0
	blt _08119B84
	subs r0, r1, 0x1
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r0, 0x3F
	ands r0, r1
	cmp r0, 0
	bne _08119BB8
	adds r0, r4, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08119B7C
_08119B74:
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
	b _08119BB8
_08119B7C:
	ldrh r0, [r4, 0x26]
	subs r0, 0x1
	strh r0, [r4, 0x26]
	b _08119BB8
_08119B84:
	movs r0, 0x2B
	bl m4aSongNumStart
	ldr r0, _08119BC0
	ldr r0, [r0, 0x38]
	ldrh r1, [r0, 0x2E]
	adds r1, 0x4
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _08119BC4
	str r0, [r4, 0x1C]
	ldr r2, _08119BC8
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x2C
	ldrb r2, [r0]
	movs r1, 0x7F
	ands r1, r2
	strb r1, [r0]
_08119BB8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08119BC0: .4byte 0x02019000
_08119BC4: .4byte sub_8119AAC
_08119BC8: .4byte gSprites
	thumb_func_end sub_8119B24

	thumb_func_start sub_8119BCC
sub_8119BCC: @ 8119BCC
	push {r4,r5,lr}
	sub sp, 0x14
	adds r4, r0, 0
	ldr r1, _08119C44
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	add r5, sp, 0x4
	ldr r1, _08119C48
	adds r0, r5, 0
	movs r2, 0x10
	bl memcpy
	ldrh r0, [r4, 0x30]
	subs r1, r0, 0x1
	strh r1, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _08119C5C
	ldr r0, _08119C4C
	ldr r0, [r0, 0x38]
	movs r1, 0x2E
	ldrsh r0, [r0, r1]
	add r0, sp
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 1
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08119CF6
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	movs r4, 0x74
	subs r4, r0
	lsrs r0, r4, 31
	adds r4, r0
	asrs r4, 1
	negs r4, r4
	ldr r0, _08119C50
	ldr r5, _08119C54
	lsls r4, 24
	asrs r4, 24
	adds r1, r5, 0
	adds r2, r4, 0
	bl m4aMPlayPanpotControl
	ldr r0, _08119C58
	adds r1, r5, 0
	adds r2, r4, 0
	bl m4aMPlayPanpotControl
	b _08119CF6
	.align 2, 0
_08119C44: .4byte gUnknown_083FA64A
_08119C48: .4byte gUnknown_083FA64C
_08119C4C: .4byte 0x02019000
_08119C50: .4byte gMPlay_SE1
_08119C54: .4byte 0x0000ffff
_08119C58: .4byte gMPlay_SE2
_08119C5C:
	lsls r0, r1, 16
	cmp r0, 0
	blt _08119CAC
	ldr r0, _08119CA8
	ldr r0, [r0, 0x38]
	movs r2, 0x2E
	ldrsh r0, [r0, r2]
	add r0, sp
	movs r2, 0
	ldrsb r2, [r0, r2]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x7
	subs r0, r1, r0
	lsls r0, 1
	adds r0, r5, r0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	muls r0, r2
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	subs r1, r0
	lsls r1, 1
	mov r0, sp
	adds r0, 0x5
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	b _08119CF6
	.align 2, 0
_08119CA8: .4byte 0x02019000
_08119CAC:
	movs r0, 0x5E
	bl m4aSongNumStartOrChange
	ldr r0, _08119CCC
	ldr r0, [r0, 0x38]
	movs r2, 0x2E
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bne _08119CD0
	movs r0, 0x98
	lsls r0, 1
	movs r1, 0x3F
	bl PlayCry1
	b _08119CDC
	.align 2, 0
_08119CCC: .4byte 0x02019000
_08119CD0:
	movs r0, 0x98
	lsls r0, 1
	movs r1, 0x3F
	negs r1, r1
	bl PlayCry1
_08119CDC:
	ldr r0, _08119D00
	ldr r0, [r0, 0x38]
	ldrh r1, [r0, 0x2E]
	adds r1, 0x2
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	movs r0, 0x2D
	strh r0, [r4, 0x30]
	ldr r0, _08119D04
	str r0, [r4, 0x1C]
_08119CF6:
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08119D00: .4byte 0x02019000
_08119D04: .4byte sub_8119B24
	thumb_func_end sub_8119BCC

	thumb_func_start sub_8119D08
sub_8119D08: @ 8119D08
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r1, _08119D64
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	ldrh r0, [r4, 0x30]
	subs r1, r0, 0x1
	strh r1, [r4, 0x30]
	lsls r0, 16
	cmp r0, 0
	blt _08119D70
	ldr r0, _08119D68
	ldr r0, [r0, 0x38]
	movs r1, 0x2E
	ldrsh r0, [r0, r1]
	add r0, sp
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 1
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldr r1, _08119D6C
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	adds r2, 0x3E
	ldrb r3, [r2]
	lsls r0, r3, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	b _08119D74
	.align 2, 0
_08119D64: .4byte gUnknown_083FA64A
_08119D68: .4byte 0x02019000
_08119D6C: .4byte gSprites
_08119D70:
	ldr r0, _08119D7C
	str r0, [r4, 0x1C]
_08119D74:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08119D7C: .4byte sub_8119A90
	thumb_func_end sub_8119D08

	thumb_func_start sub_8119D80
sub_8119D80: @ 8119D80
	push {r4,lr}
	adds r4, r0, 0
	ldr r3, _08119DB8
	ldr r1, [r3, 0x38]
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _08119DC4
	movs r0, 0x34
	ldrsh r2, [r1, r0]
	ldr r1, _08119DBC
	ldrb r0, [r3, 0x4]
	lsls r0, 30
	lsrs r0, 25
	adds r0, r1
	ldrh r0, [r0, 0x12]
	adds r0, 0x5A
	cmp r2, r0
	bne _08119E26
	ldr r2, _08119DC0
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r3, 0x34
	b _08119DEE
	.align 2, 0
_08119DB8: .4byte 0x02019000
_08119DBC: .4byte gUnknown_083F8DF4
_08119DC0: .4byte gSprites
_08119DC4:
	movs r0, 0x34
	ldrsh r2, [r1, r0]
	ldr r1, _08119E2C
	ldrb r0, [r3, 0x4]
	lsls r0, 30
	lsrs r0, 25
	adds r0, r1
	ldrh r0, [r0, 0x14]
	movs r1, 0x87
	lsls r1, 1
	adds r0, r1
	cmp r2, r0
	bne _08119E26
	ldr r2, _08119E30
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r3, 0x2E
_08119DEE:
	strh r3, [r0, 0x30]
	movs r0, 0x36
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r3, [r0, 0x30]
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _08119E34
	str r1, [r0]
	movs r0, 0x36
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _08119E38
	str r1, [r0]
	movs r0, 0x2B
	bl m4aSongNumStart
_08119E26:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08119E2C: .4byte gUnknown_083F8DF4
_08119E30: .4byte gSprites
_08119E34: .4byte sub_8119D08
_08119E38: .4byte sub_8119BCC
	thumb_func_end sub_8119D80

	thumb_func_start sub_8119E3C
sub_8119E3C: @ 8119E3C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r2, r1, 24
	movs r0, 0
	mov r9, r0
	ldr r6, _08119E60
	ldrb r0, [r6]
	cmp r0, 0x1
	beq _08119EE0
	cmp r0, 0x1
	bgt _08119E64
	cmp r0, 0
	beq _08119E6A
	b _08119F74
	.align 2, 0
_08119E60: .4byte gUnknown_03005E98
_08119E64:
	cmp r0, 0x2
	beq _08119F60
	b _08119F74
_08119E6A:
	ldr r4, _08119ECC
	ldrh r0, [r5]
	movs r1, 0
	strh r0, [r4, 0x14]
	ldrb r0, [r5, 0x5]
	strb r0, [r4, 0x16]
	strb r1, [r4, 0x1A]
	strb r1, [r4, 0x1B]
	strb r1, [r4, 0x10]
	movs r0, 0x1C
	strb r0, [r4, 0x12]
	strb r1, [r4, 0x11]
	ldrb r1, [r5, 0x4]
	lsls r1, 19
	negs r1, r1
	asrs r1, 16
	adds r0, r2, 0
	movs r2, 0x1
	bl sub_811A350
	movs r0, 0
	mov r12, r6
	ldr r1, _08119ED0
	ldr r7, _08119ED4
	ldr r2, _08119ED8
	adds r6, r4, r2
	ldr r5, _08119EDC
_08119EA0:
	movs r3, 0
	adds r4, r0, 0x1
	lsls r2, r0, 5
_08119EA6:
	str r7, [r1]
	adds r0, r2, r3
	lsls r0, 5
	adds r0, r6
	str r0, [r1, 0x4]
	str r5, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1F
	bls _08119EA6
	lsls r0, r4, 24
	lsrs r0, 24
	cmp r0, 0x6
	bls _08119EA0
	mov r1, r12
	b _08119F50
	.align 2, 0
_08119ECC: .4byte 0x0201c000
_08119ED0: .4byte 0x040000d4
_08119ED4: .4byte gUnknown_083FB718
_08119ED8: .4byte 0xfffe4000
_08119EDC: .4byte 0x80000010
_08119EE0:
	ldrb r0, [r5, 0x2]
	lsls r0, 27
	lsrs r7, r0, 16
	ldrb r1, [r5, 0x3]
	lsls r1, 12
	ldrh r0, [r5]
	lsls r0, 18
	lsrs r0, 23
	adds r1, r0
	lsls r1, 16
	lsrs r6, r1, 16
	movs r0, 0
	ldr r2, _08119F58
	mov r8, r2
	movs r1, 0xC0
	lsls r1, 19
	mov r12, r1
_08119F02:
	movs r3, 0
	adds r4, r0, 0x1
	lsls r5, r0, 6
_08119F08:
	lsls r1, r3, 1
	adds r1, r5
	adds r1, r7
	add r1, r12
	adds r2, r6, 0
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	strh r2, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1F
	bls _08119F08
	lsls r0, r4, 24
	lsrs r0, 24
	cmp r0, 0x6
	bls _08119F02
	mov r2, r8
	ldrb r0, [r2, 0x16]
	movs r4, 0
	cmp r0, 0
	beq _08119F4E
	mov r5, r8
_08119F38:
	adds r0, r4, 0
	movs r1, 0
	bl sub_811A1C8
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r5, 0x16]
	lsls r0, 3
	cmp r4, r0
	blt _08119F38
_08119F4E:
	ldr r1, _08119F5C
_08119F50:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08119F74
	.align 2, 0
_08119F58: .4byte 0x0201c000
_08119F5C: .4byte gUnknown_03005E98
_08119F60:
	bl sub_811A324
	ldr r0, _08119F84
	ldrb r1, [r5, 0x3]
	lsls r1, 4
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0x1
	mov r9, r0
_08119F74:
	mov r0, r9
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08119F84: .4byte gUnknown_083FB6F8
	thumb_func_end sub_8119E3C

	thumb_func_start sub_8119F88
sub_8119F88: @ 8119F88
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_811A324
	adds r0, r4, 0
	bl sub_811A15C
	ldr r1, _08119FC4
	ldrb r0, [r1, 0x1B]
	cmp r0, 0
	beq _08119FA6
	subs r0, 0x1
	strb r0, [r1, 0x1B]
_08119FA6:
	ldrb r0, [r1, 0x1A]
	cmp r0, 0
	beq _08119FC8
	subs r0, 0x1
	strb r0, [r1, 0x1A]
	lsls r0, 24
	cmp r0, 0
	bne _08119FC8
	ldrh r0, [r1, 0x18]
	bl sub_811A0A0
	bl sub_811A124
	b _0811A044
	.align 2, 0
_08119FC4: .4byte 0x0201c000
_08119FC8:
	ldr r5, _08119FD8
	ldrb r0, [r5, 0x10]
	cmp r0, 0
	bne _08119FDC
	bl sub_811A124
	b _0811A044
	.align 2, 0
_08119FD8: .4byte 0x0201c000
_08119FDC:
	cmp r0, 0x1
	bne _08119FE6
	bl sub_811A0C0
	b _0811A006
_08119FE6:
	cmp r0, 0x8
	bls _0811A006
	bl IsCryPlaying
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08119FFE
	bl sub_811A124
	strb r4, [r5, 0x10]
	b _0811A044
_08119FFE:
	bl sub_811A0C0
	movs r0, 0x1
	strb r0, [r5, 0x10]
_0811A006:
	ldr r5, _0811A04C
	ldrb r4, [r5, 0x10]
	subs r4, 0x1
	lsls r4, 25
	lsrs r4, 24
	ldrb r0, [r5, 0x16]
	lsls r0, 3
	ldrb r1, [r5, 0x11]
	adds r0, r1
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, r5
	ldrb r1, [r1]
	bl sub_811A1C8
	ldrb r0, [r5, 0x16]
	lsls r0, 3
	ldrb r1, [r5, 0x11]
	adds r0, r1
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	adds r4, 0x1
	adds r4, r5
	ldrb r1, [r4]
	bl sub_811A1C8
	ldrb r0, [r5, 0x10]
	adds r0, 0x1
	strb r0, [r5, 0x10]
_0811A044:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811A04C: .4byte 0x0201c000
	thumb_func_end sub_8119F88

	thumb_func_start sub_811A050
sub_811A050: @ 811A050
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	adds r6, r5, 0
	ldr r0, _0811A08C
	ldr r0, [r0, 0x4]
	cmp r0, 0
	bge _0811A09A
	ldr r4, _0811A090
	ldrb r0, [r4, 0x1A]
	cmp r0, 0
	bne _0811A09A
	ldrb r0, [r4, 0x1B]
	cmp r0, 0
	bne _0811A09A
	movs r0, 0x4
	strb r0, [r4, 0x1B]
	bl IsCryPlaying
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0811A094
	bl StopCry
	strh r5, [r4, 0x18]
	movs r0, 0x2
	strb r0, [r4, 0x1A]
	b _0811A09A
	.align 2, 0
_0811A08C: .4byte gMPlay_BGM
_0811A090: .4byte 0x0201c000
_0811A094:
	adds r0, r6, 0
	bl sub_811A0A0
_0811A09A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_811A050

	thumb_func_start sub_811A0A0
sub_811A0A0: @ 811A0A0
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	movs r2, 0x7D
	movs r3, 0xA
	bl PlayCry2
	ldr r1, _0811A0BC
	movs r0, 0x1
	strb r0, [r1, 0x10]
	pop {r0}
	bx r0
	.align 2, 0
_0811A0BC: .4byte 0x0201c000
	thumb_func_end sub_811A0A0

	thumb_func_start sub_811A0C0
sub_811A0C0: @ 811A0C0
	push {r4,lr}
	ldr r3, _0811A0D0
	movs r0, 0
	ldrsb r0, [r3, r0]
	cmp r0, 0x1
	bgt _0811A0D8
	ldr r0, _0811A0D4
	b _0811A0F0
	.align 2, 0
_0811A0D0: .4byte gPcmDmaCounter
_0811A0D4: .4byte gSoundInfo + 0x350
_0811A0D8:
	ldr r2, _0811A11C
	ldrb r1, [r2, 0xB]
	movs r0, 0
	ldrsb r0, [r3, r0]
	subs r0, 0x1
	subs r1, r0
	ldr r0, [r2, 0x10]
	muls r0, r1
	movs r1, 0xD4
	lsls r1, 2
	adds r2, r1
	adds r0, r2
_0811A0F0:
	movs r1, 0xC6
	lsls r1, 3
	adds r3, r0, r1
	movs r2, 0
	ldr r4, _0811A120
_0811A0FA:
	adds r1, r2, r4
	lsls r0, r2, 1
	adds r0, r3
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 1
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _0811A0FA
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811A11C: .4byte gSoundInfo
_0811A120: .4byte 0x0201c000
	thumb_func_end sub_811A0C0

	thumb_func_start sub_811A124
sub_811A124: @ 811A124
	push {r4,lr}
	ldr r4, _0811A158
	ldrb r0, [r4, 0x16]
	lsls r0, 3
	ldrb r1, [r4, 0x11]
	adds r0, r1
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_811A1C8
	ldrb r0, [r4, 0x16]
	lsls r0, 3
	ldrb r4, [r4, 0x11]
	adds r0, r4
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_811A1C8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811A158: .4byte 0x0201c000
	thumb_func_end sub_811A124

	thumb_func_start sub_811A15C
sub_811A15C: @ 811A15C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _0811A1B4
	ldrb r1, [r4, 0x11]
	movs r2, 0
	bl sub_811A350
	ldrb r0, [r4, 0x11]
	adds r0, 0x2
	strb r0, [r4, 0x11]
	ldrb r0, [r4, 0x11]
	lsrs r0, 3
	ldrb r2, [r4, 0x16]
	adds r1, r0, r2
	adds r2, r1, 0x1
	adds r0, r2, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r2, r0
	lsls r0, 16
	lsrs r3, r0, 16
	movs r1, 0
	ldr r2, _0811A1B8
	ldr r6, _0811A1BC
	ldr r0, _0811A1C0
	adds r5, r4, r0
	ldr r4, _0811A1C4
_0811A194:
	str r6, [r2]
	lsls r0, r1, 5
	adds r0, r3
	lsls r0, 5
	adds r0, r5
	str r0, [r2, 0x4]
	str r4, [r2, 0x8]
	ldr r0, [r2, 0x8]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x6
	bls _0811A194
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811A1B4: .4byte 0x0201c000
_0811A1B8: .4byte 0x040000d4
_0811A1BC: .4byte gUnknown_083FB718
_0811A1C0: .4byte 0xfffe4000
_0811A1C4: .4byte 0x80000010
	thumb_func_end sub_811A15C

	thumb_func_start sub_811A1C8
sub_811A1C8: @ 811A1C8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r5, r0, 24
	lsrs r4, r5, 24
	lsls r1, 24
	movs r0, 0xFE
	lsls r0, 23
	adds r1, r0
	lsrs r1, 16
	adds r0, r1, 0
	bl __floatsidf
	ldr r3, _0811A280
	ldr r2, _0811A27C
	bl __divdf3
	bl __fixunsdfsi
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x37
	bls _0811A1FE
	movs r6, 0x37
_0811A1FE:
	str r6, [sp]
	movs r7, 0x1
	ands r7, r4
	ldr r0, _0811A284
	mov r10, r0
	lsrs r5, 27
	mov r8, r5
	ldr r0, _0811A288
	mov r1, r10
	ldrb r1, [r1, 0x12]
	cmp r6, r1
	bls _0811A298
	adds r0, r7, r0
	ldrb r0, [r0]
	mov r9, r0
	movs r2, 0x7
	ands r2, r4
_0811A220:
	lsls r1, r6, 1
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 4
	adds r1, r0
	ldr r3, _0811A28C
	adds r1, r3
	mov r3, r8
	lsls r0, r3, 5
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0811A290
	adds r5, r0, r1
	ldrb r4, [r5]
	mov r3, r9
	ands r4, r3
	strb r4, [r5]
	adds r0, r6, 0
	movs r1, 0x3
	str r2, [sp, 0x8]
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	movs r1, 0xF
	ands r0, r1
	lsls r1, r7, 4
	adds r0, r1
	ldr r1, _0811A294
	adds r0, r1
	ldrb r0, [r0]
	orrs r4, r0
	strb r4, [r5]
	subs r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, [sp, 0x8]
	ldr r3, _0811A284
	ldrb r3, [r3, 0x12]
	cmp r6, r3
	bhi _0811A220
	b _0811A2FA
	.align 2, 0
_0811A27C: .4byte 0x40920000
_0811A280: .4byte 0x00000000
_0811A284: .4byte 0x0201c000
_0811A288: .4byte gUnknown_083FB738
_0811A28C: .4byte gUnknown_083FB274
_0811A290: .4byte 0x02000000
_0811A294: .4byte gUnknown_083FB73A
_0811A298:
	lsls r1, r7, 4
	str r1, [sp, 0x4]
	adds r0, r7, r0
	ldrb r0, [r0]
	mov r9, r0
	movs r7, 0x7
	ands r7, r4
_0811A2A6:
	lsls r1, r6, 1
	lsls r0, r7, 3
	adds r0, r7
	lsls r0, 4
	adds r1, r0
	ldr r2, _0811A314
	adds r1, r2
	mov r3, r8
	lsls r0, r3, 5
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0811A318
	adds r5, r0, r1
	ldrb r4, [r5]
	mov r2, r9
	ands r4, r2
	strb r4, [r5]
	adds r0, r6, 0
	movs r1, 0x3
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	movs r1, 0xF
	ands r0, r1
	ldr r3, [sp, 0x4]
	adds r0, r3
	ldr r1, _0811A31C
	adds r0, r1
	ldrb r0, [r0]
	orrs r4, r0
	strb r4, [r5]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, _0811A320
	ldrb r2, [r2, 0x12]
	cmp r6, r2
	bcc _0811A2A6
_0811A2FA:
	mov r3, sp
	ldrb r0, [r3]
	mov r3, r10
	strb r0, [r3, 0x12]
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811A314: .4byte gUnknown_083FB274
_0811A318: .4byte 0x02000000
_0811A31C: .4byte gUnknown_083FB73A
_0811A320: .4byte 0x0201c000
	thumb_func_end sub_811A1C8

	thumb_func_start sub_811A324
sub_811A324: @ 811A324
	ldr r2, _0811A344
	ldr r0, _0811A348
	str r0, [r2]
	movs r1, 0xE0
	lsls r1, 9
	adds r0, r1
	ldrh r0, [r0, 0x14]
	movs r1, 0xC0
	lsls r1, 19
	adds r0, r1
	str r0, [r2, 0x4]
	ldr r0, _0811A34C
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	bx lr
	.align 2, 0
_0811A344: .4byte 0x040000d4
_0811A348: .4byte 0x02000000
_0811A34C: .4byte 0x80000e00
	thumb_func_end sub_811A324

	thumb_func_start sub_811A350
sub_811A350: @ 811A350
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r3, r0, 0
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r2, 24
	cmp r0, 0x1
	beq _0811A38C
	cmp r0, 0x1
	bgt _0811A36E
	cmp r0, 0
	beq _0811A378
	b _0811A3C4
_0811A36E:
	cmp r3, 0x2
	beq _0811A3A0
	cmp r3, 0x3
	beq _0811A3B4
	b _0811A3C4
_0811A378:
	cmp r2, 0
	beq _0811A384
	ldr r0, _0811A380
	b _0811A3C2
	.align 2, 0
_0811A380: .4byte REG_BG0VOFS
_0811A384:
	ldr r0, _0811A388
	b _0811A3C2
	.align 2, 0
_0811A388: .4byte REG_BG0HOFS
_0811A38C:
	cmp r2, 0
	beq _0811A398
	ldr r0, _0811A394
	b _0811A3C2
	.align 2, 0
_0811A394: .4byte REG_BG1VOFS
_0811A398:
	ldr r0, _0811A39C
	b _0811A3C2
	.align 2, 0
_0811A39C: .4byte REG_BG1HOFS
_0811A3A0:
	cmp r2, 0
	beq _0811A3AC
	ldr r0, _0811A3A8
	b _0811A3C2
	.align 2, 0
_0811A3A8: .4byte REG_BG2VOFS
_0811A3AC:
	ldr r0, _0811A3B0
	b _0811A3C2
	.align 2, 0
_0811A3B0: .4byte REG_BG2HOFS
_0811A3B4:
	cmp r2, 0
	beq _0811A3C0
	ldr r0, _0811A3BC
	b _0811A3C2
	.align 2, 0
_0811A3BC: .4byte REG_BG3VOFS
_0811A3C0:
	ldr r0, _0811A3C8
_0811A3C2:
	strh r1, [r0]
_0811A3C4:
	pop {r0}
	bx r0
	.align 2, 0
_0811A3C8: .4byte REG_BG3HOFS
	thumb_func_end sub_811A350

	thumb_func_start sub_811A3CC
sub_811A3CC: @ 811A3CC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r4, r0, 0
	movs r0, 0
	str r0, [sp]
	ldr r0, _0811A3F4
	ldrb r1, [r0]
	mov r10, r0
	cmp r1, 0x1
	beq _0811A42C
	cmp r1, 0x1
	bgt _0811A3F8
	cmp r1, 0
	beq _0811A3FE
	b _0811A4D6
	.align 2, 0
_0811A3F4: .4byte gUnknown_03005E98
_0811A3F8:
	cmp r1, 0x2
	beq _0811A494
	b _0811A4D6
_0811A3FE:
	ldr r0, _0811A424
	ldrh r1, [r4]
	movs r2, 0xC0
	lsls r2, 19
	adds r1, r2
	bl LZ77UnCompVram
	ldr r0, _0811A428
	ldrb r1, [r4, 0x3]
	lsls r1, 4
	movs r2, 0x20
	bl LoadPalette
	mov r1, r10
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0811A4D6
	.align 2, 0
_0811A424: .4byte gUnknown_083FAF3C
_0811A428: .4byte gUnknown_083FAF1C
_0811A42C:
	ldrb r0, [r4, 0x2]
	lsls r0, 11
	movs r1, 0xC0
	lsls r1, 19
	adds r0, r1
	mov r8, r0
	ldrh r0, [r4]
	lsls r0, 18
	lsrs r0, 23
	mov r12, r0
	movs r5, 0
	ldr r2, _0811A490
	mov r9, r2
_0811A446:
	movs r3, 0
	lsls r0, r5, 2
	adds r7, r5, 0x1
	adds r0, r5
	lsls r6, r0, 1
_0811A450:
	ldrb r0, [r4, 0x5]
	adds r0, r5, r0
	ldrb r2, [r4, 0x4]
	adds r2, r3, r2
	lsls r2, 1
	lsls r0, 6
	adds r2, r0
	add r2, r8
	adds r1, r6, r3
	lsls r1, 1
	add r1, r9
	ldrb r0, [r4, 0x3]
	lsls r0, 12
	ldrh r1, [r1]
	orrs r0, r1
	add r0, r12
	strh r0, [r2]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x9
	bls _0811A450
	lsls r0, r7, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _0811A446
	mov r3, r10
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	b _0811A4D6
	.align 2, 0
_0811A490: .4byte gUnknown_083FAE7C
_0811A494:
	ldr r0, _0811A4E8
	bl LoadSpriteSheets
	ldr r0, _0811A4EC
	bl LoadSpritePalettes
	ldr r0, _0811A4F0
	ldrb r1, [r4, 0x4]
	lsls r1, 19
	movs r2, 0xA0
	lsls r2, 14
	adds r1, r2
	asrs r1, 16
	ldrb r2, [r4, 0x5]
	lsls r2, 19
	movs r3, 0xE0
	lsls r3, 14
	adds r2, r3
	asrs r2, 16
	movs r3, 0x1
	bl CreateSprite
	ldr r1, _0811A4F4
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	strh r0, [r1, 0x4]
	movs r0, 0x20
	strb r0, [r1]
	strb r0, [r1, 0x1]
	strb r2, [r1, 0x2]
	movs r0, 0x1
	str r0, [sp]
_0811A4D6:
	ldr r0, [sp]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811A4E8: .4byte gCryMeterNeedleSpriteSheets
_0811A4EC: .4byte gCryMeterNeedleSpritePalettes
_0811A4F0: .4byte gSpriteTemplate_83FB774
_0811A4F4: .4byte 0x0201c800
	thumb_func_end sub_811A3CC

	thumb_func_start sub_811A4F8
sub_811A4F8: @ 811A4F8
	push {r4,r5,lr}
	ldr r5, _0811A52C
	ldr r4, _0811A530
	ldrh r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	bl GetSpritePaletteTagByPaletteNum
	lsls r0, 16
	lsrs r0, 16
	bl FreeSpritePaletteByTag
	ldrh r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811A52C: .4byte gSprites
_0811A530: .4byte 0x0201c800
	thumb_func_end sub_811A4F8

	thumb_func_start sub_811A534
sub_811A534: @ 811A534
	push {r4-r7,lr}
	sub sp, 0x14
	adds r7, r0, 0
	ldr r3, _0811A578
	ldr r5, _0811A57C
	ldrh r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r2, [r0, 0x1]
	movs r1, 0x4
	negs r1, r1
	ands r1, r2
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0, 0x1]
	ldrh r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x6]
	ldr r0, _0811A580
	adds r1, r5, r0
	ldrb r0, [r1, 0x10]
	cmp r0, 0x2
	beq _0811A5AA
	cmp r0, 0x2
	bgt _0811A584
	cmp r0, 0
	beq _0811A58A
	b _0811A5F4
	.align 2, 0
_0811A578: .4byte gSprites
_0811A57C: .4byte 0x0201c800
_0811A580: .4byte 0xfffff800
_0811A584:
	cmp r0, 0x6
	beq _0811A5E2
	b _0811A5F4
_0811A58A:
	movs r0, 0x20
	strb r0, [r5, 0x1]
	movs r0, 0
	ldrsb r0, [r5, r0]
	cmp r0, 0
	ble _0811A5A4
	ldrb r0, [r5, 0x2]
	add r4, sp, 0xC
	cmp r0, 0x1
	beq _0811A5F6
	subs r0, 0x1
	strb r0, [r5, 0x2]
	b _0811A5F6
_0811A5A4:
	movs r0, 0x5
	strb r0, [r5, 0x2]
	b _0811A5F4
_0811A5AA:
	movs r3, 0
	movs r2, 0
	add r4, sp, 0xC
	adds r5, r1, 0
_0811A5B2:
	lsls r1, r3, 24
	asrs r1, 24
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r1, r0
	bge _0811A5C0
	adds r3, r0, 0
_0811A5C0:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0xF
	bls _0811A5B2
	lsls r0, r3, 24
	asrs r0, 24
	movs r1, 0xD0
	muls r0, r1
	cmp r0, 0
	bge _0811A5D8
	adds r0, 0xFF
_0811A5D8:
	lsls r0, 16
	asrs r0, 24
	bl sub_811A6D8
	b _0811A5F6
_0811A5E2:
	ldr r1, _0811A620
	adds r0, r5, r1
	ldrb r1, [r0]
	movs r0, 0xD0
	muls r0, r1
	lsls r0, 16
	asrs r0, 24
	bl sub_811A6D8
_0811A5F4:
	add r4, sp, 0xC
_0811A5F6:
	ldr r0, _0811A624
	ldrb r3, [r0]
	movs r2, 0
	ldrsb r2, [r0, r2]
	ldrb r6, [r0, 0x1]
	movs r1, 0x1
	ldrsb r1, [r0, r1]
	adds r5, r0, 0
	cmp r2, r1
	beq _0811A63C
	cmp r2, r1
	bge _0811A628
	ldrb r0, [r5, 0x2]
	adds r0, r3, r0
	strb r0, [r5]
	lsls r0, 24
	asrs r0, 24
	cmp r0, r1
	ble _0811A63C
	b _0811A636
	.align 2, 0
_0811A620: .4byte 0xfffff80a
_0811A624: .4byte 0x0201c800
_0811A628:
	ldrb r0, [r5, 0x2]
	subs r0, r3, r0
	strb r0, [r5]
	lsls r0, 24
	asrs r0, 24
	cmp r0, r1
	bge _0811A63C
_0811A636:
	strb r6, [r5]
	movs r0, 0
	strb r0, [r5, 0x1]
_0811A63C:
	ldr r2, _0811A6CC
	ldr r0, [sp, 0x4]
	ands r0, r2
	movs r1, 0x80
	lsls r1, 1
	orrs r0, r1
	ldr r1, _0811A6D0
	ands r0, r1
	movs r1, 0x80
	lsls r1, 17
	orrs r0, r1
	str r0, [sp, 0x4]
	movs r1, 0
	ldrsb r1, [r5, r1]
	lsls r1, 24
	lsrs r1, 16
	ldr r0, [sp, 0x8]
	ands r0, r2
	orrs r0, r1
	str r0, [sp, 0x8]
	add r0, sp, 0x4
	adds r1, r4, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ObjAffineSet
	add r0, sp, 0xC
	ldrh r1, [r0]
	ldrh r2, [r4, 0x2]
	ldrh r3, [r4, 0x4]
	ldrh r0, [r4, 0x6]
	str r0, [sp]
	movs r0, 0
	bl SetOamMatrix
	ldr r2, _0811A6D4
	movs r0, 0
	ldrsb r0, [r5, r0]
	adds r0, 0x7F
	movs r1, 0xFF
	ands r0, r1
	lsls r1, r0, 1
	adds r1, r2
	adds r0, 0x40
	lsls r0, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0
	ldrsh r1, [r1, r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	cmp r0, 0
	bge _0811A6AA
	adds r0, 0xFF
_0811A6AA:
	asrs r0, 8
	strh r0, [r7, 0x24]
	lsls r1, r2, 16
	asrs r1, 16
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	cmp r0, 0
	bge _0811A6BE
	adds r0, 0xFF
_0811A6BE:
	asrs r0, 8
	strh r0, [r7, 0x26]
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811A6CC: .4byte 0xffff0000
_0811A6D0: .4byte 0x0000ffff
_0811A6D4: .4byte gSineTable
	thumb_func_end sub_811A534

	thumb_func_start sub_811A6D8
sub_811A6D8: @ 811A6D8
	push {lr}
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x20
	subs r2, r1, r0
	movs r0, 0xFF
	ands r2, r0
	adds r0, r2, 0
	subs r0, 0x21
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xBE
	bhi _0811A6F4
	movs r2, 0xE0
_0811A6F4:
	ldr r1, _0811A700
	strb r2, [r1, 0x1]
	movs r0, 0x5
	strb r0, [r1, 0x2]
	pop {r0}
	bx r0
	.align 2, 0
_0811A700: .4byte 0x0201c800
	thumb_func_end sub_811A6D8

	thumb_func_start sub_811A704
sub_811A704: @ 811A704
	push {r4,lr}
	adds r4, r1, 0
	adds r3, r2, 0
	lsls r4, 24
	lsls r3, 24
	movs r1, 0x80
	lsls r1, 18
	adds r4, r1
	lsrs r4, 24
	movs r1, 0x80
	lsls r1, 17
	adds r3, r1
	lsrs r3, 24
	movs r1, 0x4
	adds r2, r4, 0
	bl sub_811A798
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_811A704

	thumb_func_start sub_811A72C
sub_811A72C: @ 811A72C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r4, r1, 0
	adds r3, r2, 0
	lsls r4, 24
	lsls r3, 24
	lsrs r6, r4, 24
	movs r0, 0x90
	lsls r0, 20
	adds r4, r0
	lsrs r4, 24
	lsrs r5, r3, 24
	movs r0, 0xC0
	lsls r0, 18
	adds r3, r0
	lsrs r3, 24
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl MenuDrawTextWindow
	mov r0, r8
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_811A704
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_811A72C

	thumb_func_start sub_811A770
sub_811A770: @ 811A770
	push {r4,lr}
	adds r2, r0, 0
	adds r3, r1, 0
	lsls r2, 24
	lsls r3, 24
	lsrs r0, r2, 24
	movs r1, 0x90
	lsls r1, 20
	adds r2, r1
	lsrs r2, 24
	lsrs r1, r3, 24
	movs r4, 0xC0
	lsls r4, 18
	adds r3, r4
	lsrs r3, 24
	bl MenuZeroFillWindowRect
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_811A770

	thumb_func_start sub_811A798
sub_811A798: @ 811A798
	push {r4-r7,lr}
	sub sp, 0x10
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r5, r1, 0
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 24
	lsrs r7, r3, 24
	mov r0, sp
	adds r1, r4, 0
	bl ConvertIntToDecimalString
	lsls r1, r5, 1
	adds r1, r5
	lsls r1, 1
	adds r1, 0x21
	adds r0, r5, 0x2
	lsls r0, 3
	subs r1, r0
	lsls r1, 24
	lsrs r0, r1, 27
	subs r0, r6, r0
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0xE0
	lsls r0, 19
	ands r0, r1
	lsrs r1, r0, 24
	ldr r4, _0811A824
	cmp r1, 0
	beq _0811A7EA
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x11
	strb r0, [r4, 0x1]
	movs r0, 0x8
	subs r0, r1
	strb r0, [r4, 0x2]
	adds r4, 0x3
_0811A7EA:
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x11
	strb r0, [r4, 0x1]
	mov r0, sp
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	subs r0, r5, r0
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	strb r1, [r4, 0x2]
	adds r4, 0x3
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy
	ldr r0, _0811A828
	adds r1, r6, 0
	adds r2, r7, 0
	bl MenuPrint
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811A824: .4byte gStringVar1
_0811A828: .4byte gOtherText_Coins2
	thumb_func_end sub_811A798

	thumb_func_start GetCoins
GetCoins: @ 811A82C
	ldr r0, _0811A838
	ldr r1, _0811A83C
	adds r0, r1
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0811A838: .4byte gSaveBlock1
_0811A83C: .4byte 0x00000494
	thumb_func_end GetCoins

	thumb_func_start GiveCoins
GiveCoins: @ 811A840
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl GetCoins
	lsls r0, 16
	ldr r1, _0811A858
	cmp r0, r1
	bls _0811A85C
	movs r0, 0
	b _0811A88C
	.align 2, 0
_0811A858: .4byte 0x270e0000
_0811A85C:
	ldr r0, _0811A874
	ldr r1, _0811A878
	adds r3, r0, r1
	ldrh r1, [r3]
	adds r2, r4, r1
	lsls r0, r2, 16
	lsrs r0, 16
	cmp r1, r0
	bls _0811A880
	ldr r0, _0811A87C
	strh r0, [r3]
	b _0811A88A
	.align 2, 0
_0811A874: .4byte gSaveBlock1
_0811A878: .4byte 0x00000494
_0811A87C: .4byte 0x0000270f
_0811A880:
	strh r2, [r3]
	ldr r1, _0811A894
	cmp r0, r1
	bls _0811A88A
	strh r1, [r3]
_0811A88A:
	movs r0, 0x1
_0811A88C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811A894: .4byte 0x0000270f
	thumb_func_end GiveCoins

	thumb_func_start TakeCoins
TakeCoins: @ 811A898
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl GetCoins
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r4
	bcs _0811A8AE
	movs r0, 0
	b _0811A8BC
_0811A8AE:
	ldr r1, _0811A8C4
	ldr r0, _0811A8C8
	adds r1, r0
	ldrh r0, [r1]
	subs r0, r4
	strh r0, [r1]
	movs r0, 0x1
_0811A8BC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811A8C4: .4byte gSaveBlock1
_0811A8C8: .4byte 0x00000494
	thumb_func_end TakeCoins

	thumb_func_start sub_811A8CC
sub_811A8CC: @ 811A8CC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	bl sub_811A920
	adds r4, r0, 0
	cmp r4, 0
	bne _0811A8E8
_0811A8E4:
	movs r0, 0
	b _0811A91A
_0811A8E8:
	ldr r6, _0811A8EC
	b _0811A8FE
	.align 2, 0
_0811A8EC: .4byte 0x0000ffff
_0811A8F0:
	subs r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0811A8F6:
	adds r4, 0x4
	ldr r0, [r4]
	cmp r0, 0
	beq _0811A8E4
_0811A8FE:
	ldr r1, [r4]
	ldrh r0, [r1, 0x4]
	cmp r0, r6
	beq _0811A912
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0811A8F6
_0811A912:
	cmp r5, 0
	bne _0811A8F0
	ldr r0, [r4]
	ldr r0, [r0]
_0811A91A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_811A8CC

	thumb_func_start sub_811A920
sub_811A920: @ 811A920
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	movs r2, 0
	ldr r0, _0811A964
	ldrb r1, [r0]
	adds r4, r0, 0
	cmp r1, 0x58
	beq _0811A990
	adds r1, r4, 0
_0811A938:
	lsls r0, r2, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, r3
	bhi _0811A990
	cmp r0, r3
	beq _0811A956
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r0, r2, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x58
	bne _0811A938
_0811A956:
	lsls r0, r2, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x58
	bne _0811A970
	b _0811A990
	.align 2, 0
_0811A964: .4byte gLandmarkLists
_0811A968:
	adds r0, r4, 0x4
	adds r0, r1, r0
	ldr r0, [r0]
	b _0811A992
_0811A970:
	cmp r0, r3
	bne _0811A990
	ldr r5, _0811A998
_0811A976:
	lsls r1, r2, 3
	adds r0, r1, r5
	ldrb r0, [r0, 0x1]
	cmp r0, r6
	beq _0811A968
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r0, r2, 3
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, r3
	beq _0811A976
_0811A990:
	movs r0, 0
_0811A992:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811A998: .4byte gLandmarkLists
	thumb_func_end sub_811A920

	thumb_func_start SetUpFieldMove_Strength
SetUpFieldMove_Strength: @ 811A99C
	push {lr}
	bl sub_81474C8
	lsls r0, 24
	cmp r0, 0
	beq _0811A9D4
	ldr r1, _0811A9BC
	ldr r0, _0811A9C0
	ldrb r0, [r0]
	strh r0, [r1]
	ldr r1, _0811A9C4
	ldr r0, _0811A9C8
	str r0, [r1]
	ldr r1, _0811A9CC
	ldr r0, _0811A9D0
	b _0811A9F8
	.align 2, 0
_0811A9BC: .4byte gScriptResult
_0811A9C0: .4byte gUnknown_03005CE0
_0811A9C4: .4byte gUnknown_0300485C
_0811A9C8: .4byte sub_808AB90
_0811A9CC: .4byte gUnknown_03005CE4
_0811A9D0: .4byte sub_811AA38
_0811A9D4:
	movs r0, 0x57
	bl npc_before_player_of_type
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0811A9E6
	movs r0, 0
	b _0811A9FC
_0811A9E6:
	ldr r1, _0811AA00
	ldr r0, _0811AA04
	ldrb r0, [r0]
	strh r0, [r1]
	ldr r1, _0811AA08
	ldr r0, _0811AA0C
	str r0, [r1]
	ldr r1, _0811AA10
	ldr r0, _0811AA14
_0811A9F8:
	str r0, [r1]
	movs r0, 0x1
_0811A9FC:
	pop {r1}
	bx r1
	.align 2, 0
_0811AA00: .4byte gScriptResult
_0811AA04: .4byte gUnknown_03005CE0
_0811AA08: .4byte gUnknown_0300485C
_0811AA0C: .4byte sub_808AB90
_0811AA10: .4byte gUnknown_03005CE4
_0811AA14: .4byte sub_811AA18
	thumb_func_end SetUpFieldMove_Strength

	thumb_func_start sub_811AA18
sub_811AA18: @ 811AA18
	push {lr}
	ldr r1, _0811AA2C
	ldr r0, _0811AA30
	ldrb r0, [r0]
	str r0, [r1]
	ldr r0, _0811AA34
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_0811AA2C: .4byte gUnknown_0202FF84
_0811AA30: .4byte gUnknown_03005CE0
_0811AA34: .4byte UseStrengthScript
	thumb_func_end sub_811AA18

	thumb_func_start sub_811AA38
sub_811AA38: @ 811AA38
	push {lr}
	ldr r0, _0811AA4C
	ldr r1, _0811AA50
	ldrb r1, [r1]
	str r1, [r0]
	movs r0, 0x28
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_0811AA4C: .4byte gUnknown_0202FF84
_0811AA50: .4byte gUnknown_03005CE0
	thumb_func_end sub_811AA38

	thumb_func_start FldEff_UseStrength
FldEff_UseStrength: @ 811AA54
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811AA88
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _0811AA8C
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	ldr r0, _0811AA90
	ldr r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0811AA94
	adds r0, r1
	ldr r1, _0811AA98
	bl GetMonNickname
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0811AA88: .4byte gTasks
_0811AA8C: .4byte sub_811AA9C
_0811AA90: .4byte gUnknown_0202FF84
_0811AA94: .4byte gPlayerParty
_0811AA98: .4byte gStringVar1
	thumb_func_end FldEff_UseStrength

	thumb_func_start sub_811AA9C
sub_811AA9C: @ 811AA9C
	push {lr}
	bl sub_81474C8
	lsls r0, 24
	cmp r0, 0
	beq _0811AAAE
	bl sub_8147514
	b _0811AAB8
_0811AAAE:
	movs r0, 0x28
	bl FieldEffectActiveListRemove
	bl EnableBothScriptContexts
_0811AAB8:
	pop {r0}
	bx r0
	thumb_func_end sub_811AA9C

	thumb_func_start sub_811AABC
sub_811AABC: @ 811AABC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811AAD0
	ldr r1, _0811AAD4
	str r1, [r2, 0x4]
	bl sub_811AB20
	pop {r0}
	bx r0
	.align 2, 0
_0811AAD0: .4byte gMain
_0811AAD4: .4byte sub_8054398
	thumb_func_end sub_811AABC

	thumb_func_start sub_811AAD8
sub_811AAD8: @ 811AAD8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_811AB20
	pop {r0}
	bx r0
	thumb_func_end sub_811AAD8

	thumb_func_start sub_811AAE8
sub_811AAE8: @ 811AAE8
	push {lr}
	ldr r0, _0811AB0C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0811AB10
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	movs r1, 0x26
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0811AB14
	movs r0, 0
	b _0811AB1C
	.align 2, 0
_0811AB0C: .4byte sub_811AB50
_0811AB10: .4byte gTasks
_0811AB14:
	adds r0, r2, 0
	bl DestroyTask
	movs r0, 0x1
_0811AB1C:
	pop {r1}
	bx r1
	thumb_func_end sub_811AAE8

	thumb_func_start sub_811AB20
sub_811AB20: @ 811AB20
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0811AB48
	movs r1, 0x2
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811AB4C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xA]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811AB48: .4byte sub_811AB50
_0811AB4C: .4byte gTasks
	thumb_func_end sub_811AB20

	thumb_func_start sub_811AB50
sub_811AB50: @ 811AB50
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811AB80
	ldr r2, _0811AB84
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811AB62:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811AB62
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811AB80: .4byte gUnknown_083FD794
_0811AB84: .4byte gTasks
	thumb_func_end sub_811AB50

	thumb_func_start sub_811AB88
sub_811AB88: @ 811AB88
	push {r4,lr}
	adds r4, r0, 0
	bl sub_807DE10
	ldr r0, _0811ABB4
	ldr r1, _0811ABB8
	ldr r2, _0811ABBC
	bl CpuSet
	ldr r1, _0811ABC0
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	bne _0811ABC4
	movs r0, 0x2
	strh r0, [r4, 0x8]
	movs r0, 0x1
	b _0811ABD2
	.align 2, 0
_0811ABB4: .4byte gPlttBufferFaded
_0811ABB8: .4byte gPlttBufferUnfaded
_0811ABBC: .4byte 0x04000100
_0811ABC0: .4byte gUnknown_083FD70C
_0811ABC4:
	movs r1, 0x4
	bl CreateTask
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
_0811ABD2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_811AB88

	thumb_func_start sub_811ABD8
sub_811ABD8: @ 811ABD8
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _0811ABF8
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0811ABFC
	movs r0, 0
	b _0811AC04
	.align 2, 0
_0811ABF8: .4byte gUnknown_083FD70C
_0811ABFC:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
_0811AC04:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_811ABD8

	thumb_func_start sub_811AC0C
sub_811AC0C: @ 811AC0C
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _0811AC30
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	bl CreateTask
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811AC30: .4byte gBattleTransitionFuncs
	thumb_func_end sub_811AC0C

	thumb_func_start sub_811AC34
sub_811AC34: @ 811AC34
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0
	strh r0, [r4, 0x26]
	ldr r1, _0811AC60
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0811AC58
	movs r0, 0x1
	strh r0, [r4, 0x26]
_0811AC58:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811AC60: .4byte gBattleTransitionFuncs
	thumb_func_end sub_811AC34

	thumb_func_start sub_811AC64
sub_811AC64: @ 811AC64
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r1, _0811AC98
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0x8]
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _0811AC9C
	adds r0, r2, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0
	movs r1, 0
	movs r2, 0x3
	movs r3, 0x2
	bl sub_811D4C8
	b _0811ACAC
	.align 2, 0
_0811AC98: .4byte gTasks
_0811AC9C:
	bl sub_811D52C
	lsls r0, 24
	cmp r0, 0
	beq _0811ACAC
	adds r0, r4, 0
	bl DestroyTask
_0811ACAC:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_811AC64

	thumb_func_start sub_811ACB4
sub_811ACB4: @ 811ACB4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811ACE4
	ldr r2, _0811ACE8
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811ACC6:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811ACC6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811ACE4: .4byte gUnknown_083FD7A4
_0811ACE8: .4byte gTasks
	thumb_func_end sub_811ACB4

	thumb_func_start sub_811ACEC
sub_811ACEC: @ 811ACEC
	ldr r2, _0811AD18
	movs r1, 0
	strh r1, [r2]
	subs r2, 0x42
	ldrh r1, [r2]
	movs r3, 0x40
	orrs r1, r3
	strh r1, [r2]
	adds r2, 0x2
	ldrh r1, [r2]
	orrs r1, r3
	strh r1, [r2]
	adds r2, 0x2
	ldrh r1, [r2]
	orrs r1, r3
	strh r1, [r2]
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	movs r0, 0x1
	bx lr
	.align 2, 0
_0811AD18: .4byte REG_MOSAIC
	thumb_func_end sub_811ACEC

	thumb_func_start sub_811AD1C
sub_811AD1C: @ 811AD1C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r0, [r4, 0xA]
	movs r1, 0xA
	ldrsh r2, [r4, r1]
	cmp r2, 0
	beq _0811AD32
	subs r0, 0x1
	strh r0, [r4, 0xA]
	b _0811AD70
_0811AD32:
	movs r0, 0x4
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _0811AD54
	movs r1, 0x1
	negs r1, r1
	str r2, [sp]
	adds r0, r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_0811AD54:
	ldr r2, _0811AD7C
	ldrh r0, [r4, 0xC]
	movs r1, 0xF
	ands r1, r0
	lsls r0, r1, 4
	adds r0, r1
	strh r0, [r2]
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0xE
	ble _0811AD70
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0811AD70:
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811AD7C: .4byte REG_MOSAIC
	thumb_func_end sub_811AD1C

	thumb_func_start sub_811AD80
sub_811AD80: @ 811AD80
	push {lr}
	ldr r0, _0811ADA4
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811AD9C
	ldr r0, _0811ADA8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0811AD9C:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0811ADA4: .4byte gPaletteFade
_0811ADA8: .4byte sub_811ACB4
	thumb_func_end sub_811AD80

	thumb_func_start sub_811ADAC
sub_811ADAC: @ 811ADAC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811ADDC
	ldr r2, _0811ADE0
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811ADBE:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811ADBE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811ADDC: .4byte gUnknown_083FD7B0
_0811ADE0: .4byte gTasks
	thumb_func_end sub_811ADAC

	thumb_func_start sub_811ADE4
sub_811ADE4: @ 811ADE4
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	movs r0, 0x1
	negs r0, r0
	movs r4, 0
	str r4, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0811AE54
	ldr r1, _0811AE58
	movs r2, 0x14
	ldrsh r1, [r1, r2]
	str r4, [sp]
	movs r2, 0xA0
	str r2, [sp, 0x4]
	movs r2, 0
	movs r3, 0x2
	bl sub_811D6E8
	ldr r0, _0811AE5C
	bl SetVBlankCallback
	ldr r0, _0811AE60
	bl SetHBlankCallback
	ldr r3, _0811AE64
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _0811AE68
	ldrh r0, [r4]
	movs r1, 0x3
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _0811AE6C
	ldrh r0, [r2]
	movs r1, 0x18
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811AE54: .4byte gUnknown_03005560
_0811AE58: .4byte 0x0200c000
_0811AE5C: .4byte sub_811AEE0
_0811AE60: .4byte sub_811AF18
_0811AE64: .4byte 0x04000208
_0811AE68: .4byte 0x04000200
_0811AE6C: .4byte REG_DISPSTAT
	thumb_func_end sub_811ADE4

	thumb_func_start sub_811AE70
sub_811AE70: @ 811AE70
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r4, _0811AED0
	ldrb r1, [r4]
	movs r1, 0
	strb r1, [r4]
	ldrh r1, [r0, 0xA]
	adds r1, 0x4
	strh r1, [r0, 0xA]
	ldrh r1, [r0, 0xC]
	adds r1, 0x8
	strh r1, [r0, 0xC]
	ldr r3, _0811AED4
	movs r2, 0x14
	ldrsh r1, [r4, r2]
	movs r5, 0xA
	ldrsh r2, [r0, r5]
	movs r5, 0xC
	ldrsh r0, [r0, r5]
	str r0, [sp]
	movs r0, 0xA0
	str r0, [sp, 0x4]
	adds r0, r3, 0
	movs r3, 0x2
	bl sub_811D6E8
	ldr r0, _0811AED8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811AEBE
	ldr r0, _0811AEDC
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0811AEBE:
	ldrb r0, [r4]
	adds r0, 0x1
	ldrb r1, [r4]
	strb r0, [r4]
	movs r0, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811AED0: .4byte 0x0200c000
_0811AED4: .4byte gUnknown_03004DE0
_0811AED8: .4byte gPaletteFade
_0811AEDC: .4byte sub_811ADAC
	thumb_func_end sub_811AE70

	thumb_func_start sub_811AEE0
sub_811AEE0: @ 811AEE0
	push {lr}
	bl sub_811D67C
	ldr r0, _0811AF08
	ldrb r0, [r0]
	cmp r0, 0
	beq _0811AF02
	ldr r1, _0811AF0C
	ldr r0, _0811AF10
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _0811AF14
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811AF02:
	pop {r0}
	bx r0
	.align 2, 0
_0811AF08: .4byte 0x0200c000
_0811AF0C: .4byte 0x040000d4
_0811AF10: .4byte gUnknown_03004DE0
_0811AF14: .4byte 0x800000a0
	thumb_func_end sub_811AEE0

	thumb_func_start sub_811AF18
sub_811AF18: @ 811AF18
	ldr r1, _0811AF38
	ldr r0, _0811AF3C
	ldrh r0, [r0]
	lsls r0, 1
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r2
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _0811AF40
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	bx lr
	.align 2, 0
_0811AF38: .4byte gUnknown_03004DE0
_0811AF3C: .4byte REG_VCOUNT
_0811AF40: .4byte REG_BG1HOFS
	thumb_func_end sub_811AF18

	thumb_func_start sub_811AF44
sub_811AF44: @ 811AF44
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811AF74
	ldr r2, _0811AF78
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811AF56:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811AF56
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811AF74: .4byte gUnknown_083FD7B8
_0811AF78: .4byte gTasks
	thumb_func_end sub_811AF44

	thumb_func_start sub_811AF7C
sub_811AF7C: @ 811AF7C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	movs r0, 0x1
	negs r0, r0
	movs r4, 0
	str r4, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0811AFE4
	ldr r0, _0811AFE8
	movs r2, 0x16
	ldrsh r1, [r1, r2]
	movs r2, 0xA0
	lsls r2, 1
	bl memset
	ldr r0, _0811AFEC
	bl SetVBlankCallback
	ldr r0, _0811AFF0
	bl SetHBlankCallback
	ldr r3, _0811AFF4
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _0811AFF8
	ldrh r0, [r4]
	movs r1, 0x3
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _0811AFFC
	ldrh r0, [r2]
	movs r1, 0x18
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811AFE4: .4byte 0x0200c000
_0811AFE8: .4byte gUnknown_03005560
_0811AFEC: .4byte sub_811B08C
_0811AFF0: .4byte sub_811B0C4
_0811AFF4: .4byte 0x04000208
_0811AFF8: .4byte 0x04000200
_0811AFFC: .4byte REG_DISPSTAT
	thumb_func_end sub_811AF7C

	thumb_func_start sub_811B000
sub_811B000: @ 811B000
	push {r4-r7,lr}
	ldr r2, _0811B07C
	ldrb r1, [r2]
	movs r1, 0
	strb r1, [r2]
	ldrh r4, [r0, 0xA]
	ldrh r2, [r0, 0xC]
	lsls r3, r2, 16
	asrs r3, 24
	movs r5, 0x84
	lsls r5, 5
	adds r1, r4, r5
	strh r1, [r0, 0xA]
	movs r1, 0xC0
	lsls r1, 1
	adds r2, r1
	strh r2, [r0, 0xC]
	movs r5, 0
	lsls r7, r3, 16
_0811B026:
	lsrs r0, r4, 8
	asrs r1, r7, 16
	bl Sin
	ldr r2, _0811B080
	lsls r1, r5, 1
	adds r1, r2
	ldr r6, _0811B07C
	ldrh r2, [r6, 0x16]
	adds r0, r2
	strh r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0x84
	lsls r1, 5
	adds r0, r4, r1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r5, 0x9F
	bls _0811B026
	ldr r0, _0811B084
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811B06A
	ldr r0, _0811B088
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0811B06A:
	ldrb r0, [r6]
	adds r0, 0x1
	ldrb r1, [r6]
	strb r0, [r6]
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811B07C: .4byte 0x0200c000
_0811B080: .4byte gUnknown_03004DE0
_0811B084: .4byte gPaletteFade
_0811B088: .4byte sub_811AF44
	thumb_func_end sub_811B000

	thumb_func_start sub_811B08C
sub_811B08C: @ 811B08C
	push {lr}
	bl sub_811D67C
	ldr r0, _0811B0B4
	ldrb r0, [r0]
	cmp r0, 0
	beq _0811B0AE
	ldr r1, _0811B0B8
	ldr r0, _0811B0BC
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _0811B0C0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811B0AE:
	pop {r0}
	bx r0
	.align 2, 0
_0811B0B4: .4byte 0x0200c000
_0811B0B8: .4byte 0x040000d4
_0811B0BC: .4byte gUnknown_03004DE0
_0811B0C0: .4byte 0x800000a0
	thumb_func_end sub_811B08C

	thumb_func_start sub_811B0C4
sub_811B0C4: @ 811B0C4
	ldr r1, _0811B0E4
	ldr r0, _0811B0E8
	ldrh r0, [r0]
	lsls r0, 1
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r2
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _0811B0EC
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	bx lr
	.align 2, 0
_0811B0E4: .4byte gUnknown_03004DE0
_0811B0E8: .4byte REG_VCOUNT
_0811B0EC: .4byte REG_BG1VOFS
	thumb_func_end sub_811B0C4

	thumb_func_start sub_811B0F0
sub_811B0F0: @ 811B0F0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811B120
	ldr r2, _0811B124
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811B102:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811B102
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811B120: .4byte gUnknown_083FD7C0
_0811B124: .4byte gTasks
	thumb_func_end sub_811B0F0

	thumb_func_start sub_811B128
sub_811B128: @ 811B128
	push {r4-r6,lr}
	sub sp, 0xC
	adds r4, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	movs r2, 0
	movs r3, 0x10
	strh r3, [r4, 0xA]
	strh r2, [r4, 0xC]
	strh r2, [r4, 0x10]
	movs r0, 0x80
	lsls r0, 7
	strh r0, [r4, 0x12]
	ldr r1, _0811B1BC
	movs r0, 0x3F
	strh r0, [r1, 0x2]
	strh r2, [r1, 0x4]
	movs r0, 0xF0
	strh r0, [r1, 0x6]
	movs r0, 0xA0
	strh r0, [r1, 0x8]
	ldr r0, _0811B1C0
	strh r0, [r1, 0xE]
	lsls r3, 8
	strh r3, [r1, 0x10]
	movs r1, 0
	add r5, sp, 0x4
	add r6, sp, 0x8
	ldr r3, _0811B1C4
	movs r2, 0xF0
_0811B168:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x9F
	bls _0811B168
	ldr r0, _0811B1C8
	bl SetVBlankCallback
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_811D6A8
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r1, [sp, 0x4]
	ldr r2, _0811B1CC
	mov r0, sp
	bl CpuSet
	ldr r0, _0811B1D0
	ldr r1, [sp, 0x8]
	movs r2, 0xB0
	lsls r2, 2
	bl CpuSet
	ldr r0, _0811B1D4
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811B1BC: .4byte 0x0200c000
_0811B1C0: .4byte 0x00003f41
_0811B1C4: .4byte gUnknown_03005560
_0811B1C8: .4byte sub_811B520
_0811B1CC: .4byte 0x01000400
_0811B1D0: .4byte gUnknown_083FBB88
_0811B1D4: .4byte gFieldEffectObjectPalette10
	thumb_func_end sub_811B128

	thumb_func_start sub_811B1D8
sub_811B1D8: @ 811B1D8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	adds r7, r0, 0
	ldr r5, _0811B260
	add r1, sp, 0xC
	add r0, sp, 0x8
	bl sub_811D6A8
	movs r1, 0
	ldr r0, [sp, 0x8]
	mov r9, r0
	ldr r6, _0811B264
	mov r8, r6
	movs r0, 0xF0
	lsls r0, 8
	mov r12, r0
_0811B1FE:
	movs r0, 0
	lsls r3, r1, 16
	asrs r4, r3, 11
_0811B204:
	lsls r2, r0, 16
	asrs r2, 16
	adds r1, r4, r2
	lsls r1, 1
	add r1, r9
	ldrh r0, [r5]
	mov r6, r12
	orrs r0, r6
	strh r0, [r1]
	adds r2, 0x1
	lsls r2, 16
	adds r5, 0x2
	lsrs r0, r2, 16
	asrs r2, 16
	cmp r2, 0x1D
	ble _0811B204
	movs r1, 0x80
	lsls r1, 9
	adds r0, r3, r1
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _0811B1FE
	movs r6, 0x10
	ldrsh r2, [r7, r6]
	movs r1, 0x12
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, 0xA0
	str r0, [sp, 0x4]
	mov r0, r8
	movs r1, 0
	movs r3, 0x84
	bl sub_811D6E8
	ldrh r0, [r7, 0x8]
	adds r0, 0x1
	strh r0, [r7, 0x8]
	movs r0, 0x1
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811B260: .4byte gUnknown_083FDB44
_0811B264: .4byte gUnknown_03004DE0
	thumb_func_end sub_811B1D8

	thumb_func_start sub_811B268
sub_811B268: @ 811B268
	push {r4,lr}
	sub sp, 0x8
	adds r2, r0, 0
	ldr r1, _0811B2E8
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldrh r3, [r2, 0xE]
	movs r4, 0xE
	ldrsh r0, [r2, r4]
	adds r4, r1, 0
	cmp r0, 0
	beq _0811B28C
	subs r0, r3, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _0811B296
_0811B28C:
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
	movs r0, 0x2
	strh r0, [r2, 0xE]
_0811B296:
	ldrh r0, [r2, 0xA]
	lsls r0, 8
	ldrh r1, [r2, 0xC]
	orrs r0, r1
	strh r0, [r4, 0x10]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0xF
	ble _0811B2AE
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
_0811B2AE:
	ldrh r0, [r2, 0x10]
	adds r0, 0x8
	strh r0, [r2, 0x10]
	ldr r0, _0811B2EC
	adds r1, r0, 0
	ldrh r3, [r2, 0x12]
	adds r1, r3
	strh r1, [r2, 0x12]
	ldr r0, _0811B2F0
	movs r3, 0x10
	ldrsh r2, [r2, r3]
	lsls r1, 16
	asrs r1, 24
	str r1, [sp]
	movs r1, 0xA0
	str r1, [sp, 0x4]
	movs r1, 0
	movs r3, 0x84
	bl sub_811D6E8
	ldrb r0, [r4]
	adds r0, 0x1
	ldrb r1, [r4]
	strb r0, [r4]
	movs r0, 0
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811B2E8: .4byte 0x0200c000
_0811B2EC: .4byte 0xffffff00
_0811B2F0: .4byte gUnknown_03004DE0
	thumb_func_end sub_811B268

	thumb_func_start sub_811B2F4
sub_811B2F4: @ 811B2F4
	push {r4,r5,lr}
	sub sp, 0x8
	adds r3, r0, 0
	ldr r1, _0811B374
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldrh r2, [r3, 0xE]
	movs r4, 0xE
	ldrsh r0, [r3, r4]
	adds r4, r1, 0
	cmp r0, 0
	beq _0811B318
	subs r0, r2, 0x1
	strh r0, [r3, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _0811B322
_0811B318:
	ldrh r0, [r3, 0xA]
	subs r0, 0x1
	strh r0, [r3, 0xA]
	movs r0, 0x2
	strh r0, [r3, 0xE]
_0811B322:
	ldrh r0, [r3, 0xA]
	lsls r1, r0, 8
	ldrh r2, [r3, 0xC]
	orrs r1, r2
	strh r1, [r4, 0x10]
	lsls r0, 16
	cmp r0, 0
	bne _0811B338
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_0811B338:
	ldrh r0, [r3, 0x10]
	adds r0, 0x8
	strh r0, [r3, 0x10]
	ldr r5, _0811B378
	adds r1, r5, 0
	ldrh r0, [r3, 0x12]
	adds r1, r0
	strh r1, [r3, 0x12]
	ldr r0, _0811B37C
	movs r5, 0x10
	ldrsh r2, [r3, r5]
	lsls r1, 16
	asrs r1, 24
	str r1, [sp]
	movs r1, 0xA0
	str r1, [sp, 0x4]
	movs r1, 0
	movs r3, 0x84
	bl sub_811D6E8
	ldrb r0, [r4]
	adds r0, 0x1
	ldrb r1, [r4]
	strb r0, [r4]
	movs r0, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811B374: .4byte 0x0200c000
_0811B378: .4byte 0xffffff00
_0811B37C: .4byte gUnknown_03004DE0
	thumb_func_end sub_811B2F4

	thumb_func_start sub_811B380
sub_811B380: @ 811B380
	push {r4-r7,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r5, _0811B3E0
	ldrb r0, [r5]
	movs r7, 0
	strb r7, [r5]
	ldrh r0, [r4, 0x10]
	adds r0, 0x8
	strh r0, [r4, 0x10]
	ldr r0, _0811B3E4
	adds r1, r0, 0
	ldrh r3, [r4, 0x12]
	adds r1, r3
	strh r1, [r4, 0x12]
	ldr r0, _0811B3E8
	movs r3, 0x10
	ldrsh r2, [r4, r3]
	lsls r1, 16
	asrs r1, 24
	str r1, [sp]
	movs r6, 0xA0
	str r6, [sp, 0x4]
	movs r1, 0
	movs r3, 0x84
	bl sub_811D6E8
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bgt _0811B3CE
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	strh r6, [r4, 0xA]
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r4, 0xC]
	strh r7, [r4, 0xE]
_0811B3CE:
	ldrb r0, [r5]
	adds r0, 0x1
	ldrb r1, [r5]
	strb r0, [r5]
	movs r0, 0
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811B3E0: .4byte 0x0200c000
_0811B3E4: .4byte 0xffffff00
_0811B3E8: .4byte gUnknown_03004DE0
	thumb_func_end sub_811B380

	thumb_func_start sub_811B3EC
sub_811B3EC: @ 811B3EC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0811B488
	ldrb r1, [r0]
	movs r3, 0
	strb r3, [r0]
	ldrh r2, [r4, 0xC]
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	ldr r0, _0811B48C
	cmp r1, r0
	bgt _0811B40A
	adds r0, r2, 0
	adds r0, 0x80
	strh r0, [r4, 0xC]
_0811B40A:
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0811B426
	ldrh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 24
	subs r0, r1, r0
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bge _0811B426
	strh r3, [r4, 0xA]
_0811B426:
	ldr r0, _0811B490
	movs r1, 0xA
	ldrsh r3, [r4, r1]
	movs r1, 0x78
	movs r2, 0x50
	bl sub_811D764
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0811B462
	ldr r1, _0811B494
	ldrh r2, [r1, 0xA]
	ldr r0, _0811B498
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _0811B49C
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_811D6D4
	ldr r0, _0811B4A0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0811B462:
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0811B476
	adds r0, r1, 0x1
	strh r0, [r4, 0xE]
	ldr r0, _0811B4A4
	bl SetVBlankCallback
_0811B476:
	ldr r0, _0811B488
	ldrb r1, [r0]
	adds r1, 0x1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811B488: .4byte 0x0200c000
_0811B48C: .4byte 0x000003ff
_0811B490: .4byte gUnknown_03004DE0
_0811B494: .4byte 0x040000b0
_0811B498: .4byte 0x0000c5ff
_0811B49C: .4byte 0x00007fff
_0811B4A0: .4byte sub_811B0F0
_0811B4A4: .4byte sub_811B54C
	thumb_func_end sub_811B3EC

	thumb_func_start sub_811B4A8
sub_811B4A8: @ 811B4A8
	push {lr}
	ldr r1, _0811B500
	ldrh r2, [r1, 0xA]
	ldr r0, _0811B504
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _0811B508
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_811D67C
	ldr r2, _0811B50C
	ldrb r0, [r2]
	cmp r0, 0
	beq _0811B4DE
	ldr r1, _0811B510
	ldr r0, _0811B514
	str r0, [r1]
	movs r3, 0xF0
	lsls r3, 3
	adds r0, r3
	str r0, [r1, 0x4]
	ldr r0, _0811B518
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811B4DE:
	ldr r1, _0811B51C
	ldrh r0, [r2, 0x2]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r2, 0x4]
	strh r0, [r1]
	subs r1, 0x6
	ldrh r0, [r2, 0x8]
	strh r0, [r1]
	adds r1, 0xC
	ldrh r0, [r2, 0xE]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r2, 0x10]
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0811B500: .4byte 0x040000b0
_0811B504: .4byte 0x0000c5ff
_0811B508: .4byte 0x00007fff
_0811B50C: .4byte 0x0200c000
_0811B510: .4byte 0x040000d4
_0811B514: .4byte gUnknown_03004DE0
_0811B518: .4byte 0x800000a0
_0811B51C: .4byte REG_WININ
	thumb_func_end sub_811B4A8

	thumb_func_start sub_811B520
sub_811B520: @ 811B520
	push {lr}
	bl sub_811B4A8
	ldr r1, _0811B53C
	ldr r0, _0811B540
	str r0, [r1]
	ldr r0, _0811B544
	str r0, [r1, 0x4]
	ldr r0, _0811B548
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_0811B53C: .4byte 0x040000b0
_0811B540: .4byte gUnknown_03005560
_0811B544: .4byte REG_BG0HOFS
_0811B548: .4byte 0xa2400001
	thumb_func_end sub_811B520

	thumb_func_start sub_811B54C
sub_811B54C: @ 811B54C
	push {lr}
	bl sub_811B4A8
	ldr r1, _0811B568
	ldr r0, _0811B56C
	str r0, [r1]
	ldr r0, _0811B570
	str r0, [r1, 0x4]
	ldr r0, _0811B574
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_0811B568: .4byte 0x040000b0
_0811B56C: .4byte gUnknown_03005560
_0811B570: .4byte REG_WIN0H
_0811B574: .4byte 0xa2400001
	thumb_func_end sub_811B54C

	thumb_func_start sub_811B578
sub_811B578: @ 811B578
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811B5A8
	ldr r2, _0811B5AC
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811B58A:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811B58A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811B5A8: .4byte gUnknown_083FD7D8
_0811B5AC: .4byte gTasks
	thumb_func_end sub_811B578

	thumb_func_start sub_811B5B0
sub_811B5B0: @ 811B5B0
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	add r0, sp, 0x4
	add r1, sp, 0x8
	bl sub_811D6A8
	ldr r0, _0811B5F0
	ldr r1, [sp, 0x8]
	movs r2, 0x20
	bl CpuSet
	movs r0, 0
	str r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, _0811B5F4
	mov r0, sp
	bl CpuSet
	ldr r0, _0811B5F8
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811B5F0: .4byte gUnknown_083FC108
_0811B5F4: .4byte 0x05000200
_0811B5F8: .4byte gFieldEffectObjectPalette10
	thumb_func_end sub_811B5B0

	thumb_func_start sub_811B5FC
sub_811B5FC: @ 811B5FC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r7, r0, 0
	ldr r1, _0811B67C
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	add r4, sp, 0x4
	ldr r1, _0811B680
	adds r0, r4, 0
	movs r2, 0xA
	bl memcpy
	bl Random
	movs r5, 0x1
	ands r5, r0
	movs r1, 0
	mov r8, r4
	ldr r6, _0811B684
_0811B62A:
	lsls r5, 16
	asrs r5, 16
	lsls r0, r5, 1
	add r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	str r0, [r6]
	lsls r4, r1, 16
	asrs r4, 16
	lsls r0, r4, 5
	adds r0, 0x10
	str r0, [r6, 0x4]
	str r5, [r6, 0x8]
	lsls r0, r4, 1
	add r0, r8
	movs r1, 0
	ldrsh r0, [r0, r1]
	str r0, [r6, 0xC]
	movs r0, 0x2D
	bl FieldEffectStart
	adds r4, 0x1
	lsls r4, 16
	movs r0, 0x1
	eors r5, r0
	lsls r5, 16
	lsrs r5, 16
	lsrs r1, r4, 16
	asrs r4, 16
	cmp r4, 0x4
	ble _0811B62A
	ldrh r0, [r7, 0x8]
	adds r0, 0x1
	strh r0, [r7, 0x8]
	movs r0, 0
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811B67C: .4byte gUnknown_083FD7E4
_0811B680: .4byte gUnknown_083FD7E8
_0811B684: .4byte gUnknown_0202FF84
	thumb_func_end sub_811B5FC

	thumb_func_start sub_811B688
sub_811B688: @ 811B688
	push {lr}
	movs r0, 0x2D
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _0811B6A8
	bl sub_811D6D4
	ldr r0, _0811B6B0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0811B6A8:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0811B6B0: .4byte sub_811B578
	thumb_func_end sub_811B688

	thumb_func_start FldEff_Pokeball
FldEff_Pokeball: @ 811B6B4
	push {r4,r5,lr}
	ldr r0, _0811B710
	ldr r5, _0811B714
	movs r2, 0
	ldrsh r1, [r5, r2]
	movs r3, 0x4
	ldrsh r2, [r5, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0811B718
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r4, r1
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x5]
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, [r5, 0x8]
	strh r0, [r4, 0x2E]
	ldr r0, [r5, 0xC]
	strh r0, [r4, 0x30]
	ldr r0, _0811B71C
	strh r0, [r4, 0x32]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	ldrb r1, [r5, 0x8]
	adds r0, r4, 0
	bl StartSpriteAffineAnim
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811B710: .4byte gSpriteTemplate_83FD98C
_0811B714: .4byte gUnknown_0202FF84
_0811B718: .4byte gSprites
_0811B71C: .4byte 0x0000ffff
	thumb_func_end FldEff_Pokeball

	thumb_func_start sub_811B720
sub_811B720: @ 811B720
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r1, _0811B740
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0811B744
	subs r0, r1, 0x1
	strh r0, [r4, 0x30]
	b _0811B7D6
	.align 2, 0
_0811B740: .4byte gUnknown_083FD7F2
_0811B744:
	ldrh r0, [r4, 0x20]
	lsls r1, r0, 16
	lsrs r0, r1, 16
	cmp r0, 0xF0
	bhi _0811B7B2
	asrs r0, r1, 19
	lsls r0, 16
	ldrh r1, [r4, 0x22]
	lsls r1, 16
	asrs r1, 19
	lsls r1, 16
	lsrs r1, 16
	lsrs r2, r0, 16
	asrs r5, r0, 16
	movs r3, 0x32
	ldrsh r0, [r4, r3]
	cmp r5, r0
	beq _0811B7B2
	strh r2, [r4, 0x32]
	ldr r0, _0811B7E0
	ldrh r2, [r0]
	lsrs r2, 8
	movs r0, 0x1F
	ands r2, r0
	lsls r2, 11
	movs r0, 0xC0
	lsls r0, 19
	adds r2, r0
	lsls r1, 16
	asrs r1, 16
	subs r0, r1, 0x2
	lsls r0, 5
	adds r0, r5
	lsls r0, 1
	adds r0, r2
	ldr r6, _0811B7E4
	adds r3, r6, 0
	strh r3, [r0]
	subs r0, r1, 0x1
	lsls r0, 5
	adds r0, r5
	lsls r0, 1
	adds r0, r2
	strh r3, [r0]
	lsls r0, r1, 5
	adds r0, r5
	lsls r0, 1
	adds r0, r2
	strh r3, [r0]
	adds r1, 0x1
	lsls r1, 5
	adds r1, r5
	lsls r1, 1
	adds r1, r2
	strh r3, [r1]
_0811B7B2:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	adds r0, 0xF
	lsls r0, 16
	movs r1, 0x87
	lsls r1, 17
	cmp r0, r1
	bls _0811B7D6
	adds r0, r4, 0
	movs r1, 0x2D
	bl FieldEffectStop
_0811B7D6:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811B7E0: .4byte REG_BG0CNT
_0811B7E4: .4byte 0x0000f001
	thumb_func_end sub_811B720

	thumb_func_start sub_811B7E8
sub_811B7E8: @ 811B7E8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811B818
	ldr r2, _0811B81C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811B7FA:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811B7FA
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811B818: .4byte gUnknown_083FD7F8
_0811B81C: .4byte gTasks
	thumb_func_end sub_811B7E8

	thumb_func_start sub_811B820
sub_811B820: @ 811B820
	push {r4,lr}
	adds r4, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	ldr r1, _0811B870
	movs r0, 0
	strh r0, [r1, 0x2]
	movs r0, 0x3F
	strh r0, [r1, 0x4]
	ldr r0, _0811B874
	strh r0, [r1, 0x6]
	movs r0, 0xA0
	strh r0, [r1, 0x8]
	movs r1, 0
	ldr r3, _0811B878
	ldr r2, _0811B87C
_0811B844:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x9F
	bls _0811B844
	ldr r0, _0811B880
	bl SetVBlankCallback
	ldr r1, _0811B870
	movs r0, 0x78
	strh r0, [r1, 0x2C]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811B870: .4byte 0x0200c000
_0811B874: .4byte 0x0000f0f1
_0811B878: .4byte gUnknown_03005560
_0811B87C: .4byte 0x0000f3f4
_0811B880: .4byte sub_811BC2C
	thumb_func_end sub_811B820

	thumb_func_start sub_811B884
sub_811B884: @ 811B884
	push {r4-r6,lr}
	sub sp, 0xC
	adds r6, r0, 0
	ldr r4, _0811B904
	ldrb r0, [r4]
	movs r0, 0
	strb r0, [r4]
	adds r0, r4, 0
	adds r0, 0x24
	movs r1, 0x2C
	ldrsh r3, [r4, r1]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0x78
	movs r2, 0x50
	bl sub_811D8FC
	ldr r5, _0811B908
_0811B8B0:
	movs r3, 0x2A
	ldrsh r2, [r4, r3]
	lsls r2, 1
	adds r2, r5
	ldrh r0, [r4, 0x28]
	adds r0, 0x1
	movs r3, 0xF0
	lsls r3, 7
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	adds r0, r4, 0
	adds r0, 0x24
	movs r1, 0x1
	movs r2, 0x1
	bl sub_811D978
	lsls r0, 24
	cmp r0, 0
	beq _0811B8B0
	ldr r2, _0811B904
	ldrh r0, [r2, 0x2C]
	adds r0, 0x10
	strh r0, [r2, 0x2C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xEF
	ble _0811B8F2
	movs r0, 0
	strh r0, [r2, 0x2E]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_0811B8F2:
	ldrb r0, [r2]
	adds r0, 0x1
	ldrb r1, [r2]
	strb r0, [r2]
	movs r0, 0
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811B904: .4byte 0x0200c000
_0811B908: .4byte gUnknown_03004DE0
	thumb_func_end sub_811B884

	thumb_func_start sub_811B90C
sub_811B90C: @ 811B90C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r7, r0, 0
	add r1, sp, 0xC
	movs r0, 0
	strb r0, [r1]
	ldr r4, _0811B988
	ldrb r0, [r4]
	movs r0, 0
	strb r0, [r4]
	adds r0, r4, 0
	adds r0, 0x24
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0xF0
	bl sub_811D8FC
	adds r6, r4, 0
	ldr r5, _0811B98C
	mov r8, r5
	add r5, sp, 0xC
_0811B946:
	movs r1, 0x78
	ldrh r0, [r4, 0x28]
	adds r0, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0x4F
	ble _0811B95C
	ldrh r1, [r4, 0x28]
	movs r3, 0xF0
_0811B95C:
	movs r0, 0x2A
	ldrsh r2, [r4, r0]
	lsls r2, 1
	add r2, r8
	lsls r1, 16
	asrs r1, 8
	lsls r0, r3, 16
	asrs r3, r0, 16
	orrs r3, r1
	strh r3, [r2]
	ldrb r0, [r5]
	cmp r0, 0
	bne _0811B990
	adds r0, r4, 0
	adds r0, 0x24
	movs r1, 0x1
	movs r2, 0x1
	bl sub_811D978
	strb r0, [r5]
	b _0811B946
	.align 2, 0
_0811B988: .4byte 0x0200c000
_0811B98C: .4byte gUnknown_03004DE0
_0811B990:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x8
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0x9F
	ble _0811B9AA
	movs r0, 0xF0
	strh r0, [r4, 0x2C]
	ldrh r0, [r7, 0x8]
	adds r0, 0x1
	strh r0, [r7, 0x8]
	b _0811B9D0
_0811B9AA:
	movs r2, 0x2A
	ldrsh r0, [r4, r2]
	cmp r0, r1
	bge _0811B9D0
	ldr r4, _0811B9E8
	ldr r2, _0811B9EC
_0811B9B6:
	ldrh r0, [r2, 0x2A]
	adds r0, 0x1
	strh r0, [r2, 0x2A]
	lsls r0, 16
	asrs r0, 15
	adds r0, r4
	strh r3, [r0]
	movs r5, 0x2A
	ldrsh r1, [r2, r5]
	movs r5, 0x2E
	ldrsh r0, [r2, r5]
	cmp r1, r0
	blt _0811B9B6
_0811B9D0:
	ldrb r0, [r6]
	adds r0, 0x1
	ldrb r1, [r6]
	strb r0, [r6]
	movs r0, 0
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811B9E8: .4byte gUnknown_03004DE0
_0811B9EC: .4byte 0x0200c000
	thumb_func_end sub_811B90C

	thumb_func_start sub_811B9F0
sub_811B9F0: @ 811B9F0
	push {r4-r6,lr}
	sub sp, 0xC
	adds r6, r0, 0
	ldr r4, _0811BA68
	ldrb r0, [r4]
	movs r0, 0
	strb r0, [r4]
	adds r0, r4, 0
	adds r0, 0x24
	movs r1, 0x2C
	ldrsh r3, [r4, r1]
	movs r1, 0xA0
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0x78
	movs r2, 0x50
	bl sub_811D8FC
	ldr r5, _0811BA6C
_0811BA1A:
	movs r0, 0x2A
	ldrsh r2, [r4, r0]
	lsls r2, 1
	adds r2, r5
	ldrh r0, [r4, 0x28]
	lsls r0, 8
	movs r1, 0xF0
	orrs r0, r1
	strh r0, [r2]
	adds r0, r4, 0
	adds r0, 0x24
	movs r1, 0x1
	movs r2, 0x1
	bl sub_811D978
	lsls r0, 24
	cmp r0, 0
	beq _0811BA1A
	ldr r2, _0811BA68
	ldrh r0, [r2, 0x2C]
	subs r0, 0x10
	strh r0, [r2, 0x2C]
	lsls r0, 16
	cmp r0, 0
	bgt _0811BA56
	movs r0, 0xA0
	strh r0, [r2, 0x2E]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_0811BA56:
	ldrb r0, [r2]
	adds r0, 0x1
	ldrb r1, [r2]
	strb r0, [r2]
	movs r0, 0
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811BA68: .4byte 0x0200c000
_0811BA6C: .4byte gUnknown_03004DE0
	thumb_func_end sub_811B9F0

	thumb_func_start sub_811BA70
sub_811BA70: @ 811BA70
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	mov r8, r0
	add r1, sp, 0xC
	movs r0, 0
	strb r0, [r1]
	ldr r4, _0811BAF0
	ldrb r0, [r4]
	movs r0, 0
	strb r0, [r4]
	adds r0, r4, 0
	adds r0, 0x24
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0
	bl sub_811D8FC
	ldr r3, _0811BAF4
	mov r9, r3
	mov r10, r4
	add r6, sp, 0xC
_0811BAAE:
	movs r5, 0x2A
	ldrsh r0, [r4, r5]
	lsls r0, 1
	mov r7, r9
	adds r5, r0, r7
	ldrb r1, [r5]
	ldrh r2, [r4, 0x28]
	adds r3, r2, 0
	movs r7, 0x2E
	ldrsh r0, [r4, r7]
	cmp r0, 0x50
	bgt _0811BACA
	movs r2, 0x78
	adds r1, r3, 0
_0811BACA:
	lsls r0, r2, 16
	asrs r0, 8
	lsls r1, 16
	asrs r1, 16
	orrs r1, r0
	movs r3, 0
	strh r1, [r5]
	ldrb r0, [r6]
	cmp r0, 0
	bne _0811BAF8
	adds r0, r4, 0
	adds r0, 0x24
	movs r1, 0x1
	movs r2, 0x1
	bl sub_811D978
	strb r0, [r6]
	b _0811BAAE
	.align 2, 0
_0811BAF0: .4byte 0x0200c000
_0811BAF4: .4byte gUnknown_03004DE0
_0811BAF8:
	ldrh r0, [r4, 0x2E]
	subs r0, 0x8
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	bgt _0811BB12
	strh r3, [r4, 0x2C]
	mov r1, r8
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _0811BB3A
_0811BB12:
	movs r3, 0x2A
	ldrsh r0, [r4, r3]
	cmp r0, r2
	ble _0811BB3A
	ldr r4, _0811BB58
	ldr r2, _0811BB5C
	adds r3, r1, 0
_0811BB20:
	ldrh r0, [r2, 0x2A]
	subs r0, 0x1
	strh r0, [r2, 0x2A]
	lsls r0, 16
	asrs r0, 15
	adds r0, r4
	strh r3, [r0]
	movs r5, 0x2A
	ldrsh r1, [r2, r5]
	movs r7, 0x2E
	ldrsh r0, [r2, r7]
	cmp r1, r0
	bgt _0811BB20
_0811BB3A:
	mov r1, r10
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r1, [r1]
	mov r2, r10
	strb r0, [r2]
	movs r0, 0
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811BB58: .4byte gUnknown_03004DE0
_0811BB5C: .4byte 0x0200c000
	thumb_func_end sub_811BA70

	thumb_func_start sub_811BB60
sub_811BB60: @ 811BB60
	push {r4-r6,lr}
	sub sp, 0xC
	adds r6, r0, 0
	ldr r4, _0811BBE4
	ldrb r0, [r4]
	movs r1, 0
	strb r1, [r4]
	adds r0, r4, 0
	adds r0, 0x24
	movs r2, 0x2C
	ldrsh r3, [r4, r2]
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0x78
	movs r2, 0x50
	bl sub_811D8FC
	ldr r5, _0811BBE8
_0811BB88:
	movs r2, 0x78
	ldrh r3, [r4, 0x28]
	movs r1, 0x28
	ldrsh r0, [r4, r1]
	cmp r0, 0x77
	ble _0811BB98
	movs r2, 0
	movs r3, 0xF0
_0811BB98:
	movs r0, 0x2A
	ldrsh r1, [r4, r0]
	lsls r1, 1
	adds r1, r5
	lsls r2, 8
	lsls r0, r3, 16
	asrs r0, 16
	orrs r0, r2
	strh r0, [r1]
	adds r0, r4, 0
	adds r0, 0x24
	movs r1, 0x1
	movs r2, 0x1
	bl sub_811D978
	lsls r0, 24
	cmp r0, 0
	beq _0811BB88
	ldr r2, _0811BBE4
	ldrh r0, [r2, 0x2C]
	adds r0, 0x10
	strh r0, [r2, 0x2C]
	movs r1, 0x28
	ldrsh r0, [r2, r1]
	cmp r0, 0x78
	ble _0811BBD2
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_0811BBD2:
	ldrb r0, [r2]
	adds r0, 0x1
	ldrb r1, [r2]
	strb r0, [r2]
	movs r0, 0
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811BBE4: .4byte 0x0200c000
_0811BBE8: .4byte gUnknown_03004DE0
	thumb_func_end sub_811BB60

	thumb_func_start sub_811BBEC
sub_811BBEC: @ 811BBEC
	push {lr}
	ldr r1, _0811BC1C
	ldrh r2, [r1, 0xA]
	ldr r0, _0811BC20
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _0811BC24
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_811D6D4
	ldr r0, _0811BC28
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0811BC1C: .4byte 0x040000b0
_0811BC20: .4byte 0x0000c5ff
_0811BC24: .4byte 0x00007fff
_0811BC28: .4byte sub_811B7E8
	thumb_func_end sub_811BBEC

	thumb_func_start sub_811BC2C
sub_811BC2C: @ 811BC2C
	push {r4,lr}
	ldr r4, _0811BC94
	ldrh r1, [r4, 0xA]
	ldr r0, _0811BC98
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0xA]
	ldr r0, _0811BC9C
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xA]
	bl sub_811D67C
	ldr r2, _0811BCA0
	ldrb r0, [r2]
	cmp r0, 0
	beq _0811BC62
	ldr r1, _0811BCA4
	ldr r0, _0811BCA8
	str r0, [r1]
	movs r3, 0xF0
	lsls r3, 3
	adds r0, r3
	str r0, [r1, 0x4]
	ldr r0, _0811BCAC
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811BC62:
	ldr r1, _0811BCB0
	ldrh r0, [r2, 0x2]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r2, 0x4]
	strh r0, [r1]
	subs r1, 0x6
	ldrh r0, [r2, 0x8]
	strh r0, [r1]
	ldr r2, _0811BCB4
	ldr r0, _0811BCA8
	movs r1, 0xF0
	lsls r1, 3
	adds r0, r1
	ldrh r1, [r0]
	strh r1, [r2]
	str r0, [r4]
	str r2, [r4, 0x4]
	ldr r0, _0811BCB8
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811BC94: .4byte 0x040000b0
_0811BC98: .4byte 0x0000c5ff
_0811BC9C: .4byte 0x00007fff
_0811BCA0: .4byte 0x0200c000
_0811BCA4: .4byte 0x040000d4
_0811BCA8: .4byte gUnknown_03004DE0
_0811BCAC: .4byte 0x800000a0
_0811BCB0: .4byte REG_WININ
_0811BCB4: .4byte REG_WIN0H
_0811BCB8: .4byte 0xa2400001
	thumb_func_end sub_811BC2C

	thumb_func_start sub_811BCBC
sub_811BCBC: @ 811BCBC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811BCEC
	ldr r2, _0811BCF0
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811BCCE:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811BCCE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811BCEC: .4byte gUnknown_083FD814
_0811BCF0: .4byte gTasks
	thumb_func_end sub_811BCBC

	thumb_func_start sub_811BCF4
sub_811BCF4: @ 811BCF4
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	movs r2, 0
	ldr r4, _0811BD48
	ldr r3, _0811BD4C
_0811BD06:
	lsls r0, r2, 1
	adds r0, r4
	ldrh r1, [r3, 0x16]
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x9F
	bls _0811BD06
	ldr r0, _0811BD50
	bl SetVBlankCallback
	ldr r0, _0811BD54
	bl SetHBlankCallback
	ldr r2, _0811BD58
	ldrh r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0811BD5C
	ldrh r0, [r2]
	movs r1, 0x10
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811BD48: .4byte gUnknown_03005560
_0811BD4C: .4byte 0x0200c000
_0811BD50: .4byte sub_811BE3C
_0811BD54: .4byte sub_811BE74
_0811BD58: .4byte 0x04000200
_0811BD5C: .4byte REG_DISPSTAT
	thumb_func_end sub_811BCF4

	thumb_func_start sub_811BD60
sub_811BD60: @ 811BD60
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r6, r0, 0
	ldr r1, _0811BE28
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldrh r2, [r6, 0xC]
	lsls r1, r2, 16
	asrs r0, r1, 24
	lsls r0, 16
	lsrs r3, r0, 16
	ldrh r4, [r6, 0xA]
	movs r0, 0xC0
	lsls r0, 1
	mov r8, r0
	movs r5, 0x80
	lsls r5, 3
	adds r0, r4, r5
	strh r0, [r6, 0xA]
	ldr r0, _0811BE2C
	cmp r1, r0
	bgt _0811BD9A
	movs r1, 0xC0
	lsls r1, 1
	adds r0, r2, r1
	strh r0, [r6, 0xC]
_0811BD9A:
	movs r5, 0
	lsls r7, r3, 16
_0811BD9E:
	lsrs r0, r4, 8
	asrs r1, r7, 16
	bl Sin
	ldr r1, _0811BE30
	lsls r2, r5, 1
	adds r2, r1
	ldr r1, _0811BE28
	ldrh r1, [r1, 0x16]
	adds r0, r1
	strh r0, [r2]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r1, r8
	adds r0, r4, r1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r5, 0x9F
	bls _0811BD9E
	ldrh r0, [r6, 0xE]
	adds r0, 0x1
	strh r0, [r6, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x51
	bne _0811BDEC
	ldrh r0, [r6, 0x10]
	adds r0, 0x1
	strh r0, [r6, 0x10]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x2
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r3, 0x10
	bl BeginNormalPaletteFade
_0811BDEC:
	movs r5, 0x10
	ldrsh r0, [r6, r5]
	cmp r0, 0
	beq _0811BE0E
	ldr r0, _0811BE34
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811BE0E
	ldr r0, _0811BE38
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0811BE0E:
	ldr r0, _0811BE28
	ldrb r1, [r0]
	adds r1, 0x1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, 0
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811BE28: .4byte 0x0200c000
_0811BE2C: .4byte 0x1fff0000
_0811BE30: .4byte gUnknown_03004DE0
_0811BE34: .4byte gPaletteFade
_0811BE38: .4byte sub_811BCBC
	thumb_func_end sub_811BD60

	thumb_func_start sub_811BE3C
sub_811BE3C: @ 811BE3C
	push {lr}
	bl sub_811D67C
	ldr r0, _0811BE64
	ldrb r0, [r0]
	cmp r0, 0
	beq _0811BE5E
	ldr r1, _0811BE68
	ldr r0, _0811BE6C
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _0811BE70
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811BE5E:
	pop {r0}
	bx r0
	.align 2, 0
_0811BE64: .4byte 0x0200c000
_0811BE68: .4byte 0x040000d4
_0811BE6C: .4byte gUnknown_03004DE0
_0811BE70: .4byte 0x800000a0
	thumb_func_end sub_811BE3C

	thumb_func_start sub_811BE74
sub_811BE74: @ 811BE74
	ldr r1, _0811BE94
	ldr r0, _0811BE98
	ldrh r0, [r0]
	lsls r0, 1
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r2
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _0811BE9C
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	bx lr
	.align 2, 0
_0811BE94: .4byte gUnknown_03004DE0
_0811BE98: .4byte REG_VCOUNT
_0811BE9C: .4byte REG_BG1VOFS
	thumb_func_end sub_811BE74

	thumb_func_start sub_811BEA0
sub_811BEA0: @ 811BEA0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811BED0
	ldr r2, _0811BED4
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811BEB2:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811BEB2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811BED0: .4byte gUnknown_083FD81C
_0811BED4: .4byte gTasks
	thumb_func_end sub_811BEA0

	thumb_func_start sub_811BED8
sub_811BED8: @ 811BED8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	ldr r1, _0811BF20
	movs r2, 0
	movs r0, 0x3F
	strh r0, [r1, 0x2]
	strh r2, [r1, 0x4]
	movs r0, 0xF0
	strh r0, [r1, 0x6]
	movs r0, 0xA0
	strh r0, [r1, 0x8]
	movs r1, 0
	ldr r3, _0811BF24
	movs r2, 0xF2
_0811BEFC:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x9F
	bls _0811BEFC
	ldr r0, _0811BF28
	bl SetVBlankCallback
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811BF20: .4byte 0x0200c000
_0811BF24: .4byte gUnknown_03005560
_0811BF28: .4byte sub_811C004
	thumb_func_end sub_811BED8

	thumb_func_start sub_811BF2C
sub_811BF2C: @ 811BF2C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	ldr r1, _0811BFBC
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldr r7, _0811BFC0
	ldrh r0, [r4, 0xC]
	ldrb r5, [r4, 0xC]
	adds r0, 0x10
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0xA]
	adds r0, 0x8
	strh r0, [r4, 0xA]
	movs r6, 0
	movs r0, 0x1
	mov r8, r0
_0811BF52:
	adds r0, r5, 0
	movs r1, 0x28
	bl Sin
	ldrh r1, [r4, 0xA]
	adds r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r0, 0
	bge _0811BF68
	movs r1, 0
_0811BF68:
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xF0
	ble _0811BF72
	movs r1, 0xF0
_0811BF72:
	lsls r0, r1, 16
	asrs r0, 16
	lsls r1, r0, 8
	movs r2, 0xF1
	orrs r1, r2
	strh r1, [r7]
	cmp r0, 0xEF
	bgt _0811BF86
	movs r0, 0
	mov r8, r0
_0811BF86:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r5, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, 0x2
	cmp r6, 0x9F
	bls _0811BF52
	mov r1, r8
	cmp r1, 0
	beq _0811BFA4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0811BFA4:
	ldr r0, _0811BFBC
	ldrb r1, [r0]
	adds r1, 0x1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811BFBC: .4byte 0x0200c000
_0811BFC0: .4byte gUnknown_03004DE0
	thumb_func_end sub_811BF2C

	thumb_func_start sub_811BFC4
sub_811BFC4: @ 811BFC4
	push {lr}
	ldr r1, _0811BFF4
	ldrh r2, [r1, 0xA]
	ldr r0, _0811BFF8
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _0811BFFC
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_811D6D4
	ldr r0, _0811C000
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0811BFF4: .4byte 0x040000b0
_0811BFF8: .4byte 0x0000c5ff
_0811BFFC: .4byte 0x00007fff
_0811C000: .4byte sub_811BEA0
	thumb_func_end sub_811BFC4

	thumb_func_start sub_811C004
sub_811C004: @ 811C004
	push {r4,lr}
	ldr r4, _0811C060
	ldrh r1, [r4, 0xA]
	ldr r0, _0811C064
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0xA]
	ldr r0, _0811C068
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xA]
	bl sub_811D67C
	ldr r2, _0811C06C
	ldrb r0, [r2]
	cmp r0, 0
	beq _0811C03A
	ldr r1, _0811C070
	ldr r0, _0811C074
	str r0, [r1]
	movs r3, 0xF0
	lsls r3, 3
	adds r0, r3
	str r0, [r1, 0x4]
	ldr r0, _0811C078
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811C03A:
	ldr r1, _0811C07C
	ldrh r0, [r2, 0x2]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r2, 0x4]
	strh r0, [r1]
	subs r1, 0x6
	ldrh r0, [r2, 0x8]
	strh r0, [r1]
	ldr r0, _0811C080
	str r0, [r4]
	ldr r0, _0811C084
	str r0, [r4, 0x4]
	ldr r0, _0811C088
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811C060: .4byte 0x040000b0
_0811C064: .4byte 0x0000c5ff
_0811C068: .4byte 0x00007fff
_0811C06C: .4byte 0x0200c000
_0811C070: .4byte 0x040000d4
_0811C074: .4byte gUnknown_03004DE0
_0811C078: .4byte 0x800000a0
_0811C07C: .4byte REG_WININ
_0811C080: .4byte gUnknown_03005560
_0811C084: .4byte REG_WIN0H
_0811C088: .4byte 0xa2400001
	thumb_func_end sub_811C004

	thumb_func_start sub_811C08C
sub_811C08C: @ 811C08C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811C0A8
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	strh r2, [r1, 0x26]
	bl sub_811C12C
	pop {r0}
	bx r0
	.align 2, 0
_0811C0A8: .4byte gTasks
	thumb_func_end sub_811C08C

	thumb_func_start sub_811C0AC
sub_811C0AC: @ 811C0AC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811C0C8
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x1
	strh r2, [r1, 0x26]
	bl sub_811C12C
	pop {r0}
	bx r0
	.align 2, 0
_0811C0C8: .4byte gTasks
	thumb_func_end sub_811C0AC

	thumb_func_start sub_811C0CC
sub_811C0CC: @ 811C0CC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811C0E8
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x2
	strh r2, [r1, 0x26]
	bl sub_811C12C
	pop {r0}
	bx r0
	.align 2, 0
_0811C0E8: .4byte gTasks
	thumb_func_end sub_811C0CC

	thumb_func_start sub_811C0EC
sub_811C0EC: @ 811C0EC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811C108
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x3
	strh r2, [r1, 0x26]
	bl sub_811C12C
	pop {r0}
	bx r0
	.align 2, 0
_0811C108: .4byte gTasks
	thumb_func_end sub_811C0EC

	thumb_func_start sub_811C10C
sub_811C10C: @ 811C10C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811C128
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x4
	strh r2, [r1, 0x26]
	bl sub_811C12C
	pop {r0}
	bx r0
	.align 2, 0
_0811C128: .4byte gTasks
	thumb_func_end sub_811C10C

	thumb_func_start sub_811C12C
sub_811C12C: @ 811C12C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811C15C
	ldr r2, _0811C160
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811C13E:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811C13E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811C15C: .4byte gUnknown_083FD828
_0811C160: .4byte gTasks
	thumb_func_end sub_811C12C

	thumb_func_start sub_811C164
sub_811C164: @ 811C164
	push {r4,lr}
	adds r4, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	adds r0, r4, 0
	bl sub_811C7B0
	movs r0, 0
	strh r0, [r4, 0xA]
	movs r0, 0x1
	strh r0, [r4, 0xC]
	movs r0, 0xEF
	strh r0, [r4, 0xE]
	ldr r1, _0811C1BC
	movs r0, 0x3F
	strh r0, [r1, 0x2]
	movs r0, 0x3E
	strh r0, [r1, 0x4]
	movs r0, 0xA0
	strh r0, [r1, 0x8]
	movs r1, 0
	ldr r3, _0811C1C0
	ldr r2, _0811C1C4
_0811C196:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x9F
	bls _0811C196
	ldr r0, _0811C1C8
	bl SetVBlankCallback
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811C1BC: .4byte 0x0200c000
_0811C1C0: .4byte gUnknown_03005560
_0811C1C4: .4byte 0x0000f0f1
_0811C1C8: .4byte sub_811C670
	thumb_func_end sub_811C164

	thumb_func_start sub_811C1CC
sub_811C1CC: @ 811C1CC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	mov r8, r0
	ldr r6, _0811C284
	add r1, sp, 0x4
	mov r0, sp
	bl sub_811D6A8
	ldr r0, _0811C288
	ldr r1, [sp, 0x4]
	movs r2, 0xF0
	bl CpuSet
	ldr r1, _0811C28C
	mov r2, r8
	movs r3, 0x26
	ldrsh r0, [r2, r3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _0811C290
	ldr r0, _0811C294
	ldrb r0, [r0, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0xFA
	movs r2, 0xC
	bl LoadPalette
	movs r1, 0
	ldr r5, [sp]
	ldr r0, _0811C298
	mov r12, r0
	movs r2, 0xF0
	lsls r2, 8
	adds r7, r2, 0
_0811C222:
	movs r0, 0
	lsls r3, r1, 16
	asrs r4, r3, 11
_0811C228:
	lsls r2, r0, 16
	asrs r2, 16
	adds r1, r4, r2
	lsls r1, 1
	adds r1, r5
	ldrh r0, [r6]
	orrs r0, r7
	strh r0, [r1]
	adds r2, 0x1
	lsls r2, 16
	adds r6, 0x2
	lsrs r0, r2, 16
	asrs r2, 16
	cmp r2, 0x1F
	ble _0811C228
	movs r1, 0x80
	lsls r1, 9
	adds r0, r3, r1
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _0811C222
	ldr r2, _0811C29C
	ldrh r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0811C2A0
	ldrh r0, [r2]
	movs r1, 0x10
	orrs r0, r1
	strh r0, [r2]
	mov r0, r12
	bl SetHBlankCallback
	mov r2, r8
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	movs r0, 0
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811C284: .4byte gUnknown_083FDFF4
_0811C288: .4byte gUnknown_083FC348
_0811C28C: .4byte gUnknown_083FDB00
_0811C290: .4byte gUnknown_083FDB14
_0811C294: .4byte gSaveBlock2
_0811C298: .4byte sub_811C77C
_0811C29C: .4byte 0x04000200
_0811C2A0: .4byte REG_DISPSTAT
	thumb_func_end sub_811C1CC

	thumb_func_start sub_811C2A4
sub_811C2A4: @ 811C2A4
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r1, _0811C384
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldr r7, _0811C388
	ldrh r0, [r4, 0xA]
	ldrb r5, [r4, 0xA]
	adds r0, 0x10
	strh r0, [r4, 0xA]
	movs r6, 0
_0811C2BC:
	adds r0, r5, 0
	movs r1, 0x10
	bl Sin
	ldrh r1, [r4, 0xC]
	adds r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r0, 0
	bge _0811C2D2
	movs r2, 0x1
_0811C2D2:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0xF0
	ble _0811C2DC
	movs r2, 0xF0
_0811C2DC:
	strh r2, [r7]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r7, 0x2
	adds r0, r5, 0
	adds r0, 0x10
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r6, 0x4F
	bls _0811C2BC
	cmp r6, 0x9F
	bhi _0811C334
_0811C2F6:
	adds r0, r5, 0
	movs r1, 0x10
	bl Sin
	ldrh r1, [r4, 0xE]
	subs r1, r0
	lsls r1, 16
	lsrs r2, r1, 16
	cmp r1, 0
	bge _0811C30C
	movs r2, 0
_0811C30C:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0xEF
	ble _0811C316
	movs r2, 0xEF
_0811C316:
	lsls r0, r2, 16
	asrs r0, 8
	movs r1, 0xF0
	orrs r0, r1
	strh r0, [r7]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r7, 0x2
	adds r0, r5, 0
	adds r0, 0x10
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r6, 0x9F
	bls _0811C2F6
_0811C334:
	ldrh r1, [r4, 0xC]
	adds r1, 0x8
	strh r1, [r4, 0xC]
	ldrh r0, [r4, 0xE]
	subs r0, 0x8
	strh r0, [r4, 0xE]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0xF0
	ble _0811C34C
	movs r0, 0xF0
	strh r0, [r4, 0xC]
_0811C34C:
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _0811C358
	movs r0, 0
	strh r0, [r4, 0xE]
_0811C358:
	ldr r0, [r4, 0xC]
	cmp r0, 0xF0
	bne _0811C364
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0811C364:
	ldr r1, _0811C384
	ldrh r0, [r1, 0x18]
	subs r0, 0x8
	strh r0, [r1, 0x18]
	ldrh r0, [r1, 0x1A]
	adds r0, 0x8
	strh r0, [r1, 0x1A]
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811C384: .4byte 0x0200c000
_0811C388: .4byte gUnknown_03004DE0
	thumb_func_end sub_811C2A4

	thumb_func_start sub_811C38C
sub_811C38C: @ 811C38C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _0811C3F8
	ldrb r1, [r0]
	movs r1, 0
	strb r1, [r0]
	ldr r2, _0811C3FC
	adds r5, r0, 0
	movs r3, 0xF0
_0811C39E:
	strh r3, [r2]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	adds r2, 0x2
	cmp r1, 0x9F
	bls _0811C39E
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xA]
	strh r1, [r4, 0xC]
	strh r1, [r4, 0xE]
	ldrh r0, [r5, 0x18]
	subs r0, 0x8
	strh r0, [r5, 0x18]
	ldrh r0, [r5, 0x1A]
	adds r0, 0x8
	strh r0, [r5, 0x1A]
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	movs r1, 0
	bl sub_811CA10
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	movs r1, 0x1
	bl sub_811CA10
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	bl sub_811CA28
	movs r0, 0x68
	bl PlaySE
	ldrb r0, [r5]
	adds r0, 0x1
	ldrb r1, [r5]
	strb r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811C3F8: .4byte 0x0200c000
_0811C3FC: .4byte gUnknown_03004DE0
	thumb_func_end sub_811C38C

	thumb_func_start sub_811C400
sub_811C400: @ 811C400
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _0811C438
	ldrh r0, [r1, 0x18]
	subs r0, 0x8
	strh r0, [r1, 0x18]
	ldrh r0, [r1, 0x1A]
	adds r0, 0x8
	strh r0, [r1, 0x1A]
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	bl sub_811CA44
	lsls r0, 16
	cmp r0, 0
	beq _0811C42E
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	bl sub_811CA28
_0811C42E:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811C438: .4byte 0x0200c000
	thumb_func_end sub_811C400

	thumb_func_start sub_811C43C
sub_811C43C: @ 811C43C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	ldr r7, _0811C4D0
	ldrh r0, [r7, 0x18]
	subs r0, 0x8
	movs r1, 0
	mov r8, r1
	strh r0, [r7, 0x18]
	ldrh r0, [r7, 0x1A]
	adds r0, 0x8
	strh r0, [r7, 0x1A]
	movs r1, 0x24
	ldrsh r0, [r6, r1]
	bl sub_811CA44
	lsls r0, 16
	cmp r0, 0
	beq _0811C4C4
	ldrb r0, [r7]
	movs r0, 0
	strb r0, [r7]
	movs r0, 0
	bl SetVBlankCallback
	ldr r1, _0811C4D4
	ldrh r2, [r1, 0xA]
	ldr r0, _0811C4D8
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _0811C4DC
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	ldr r4, _0811C4E0
	movs r5, 0xA0
	lsls r5, 1
	adds r0, r4, 0
	movs r1, 0
	adds r2, r5, 0
	bl memset
	movs r0, 0xF0
	lsls r0, 3
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0
	adds r2, r5, 0
	bl memset
	ldr r1, _0811C4E4
	movs r0, 0xF0
	strh r0, [r1]
	ldr r0, _0811C4E8
	mov r1, r8
	strh r1, [r0]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	strh r1, [r6, 0xE]
	strh r1, [r6, 0x10]
	movs r0, 0xBF
	strh r0, [r7, 0xE]
	ldr r0, _0811C4EC
	bl SetVBlankCallback
_0811C4C4:
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811C4D0: .4byte 0x0200c000
_0811C4D4: .4byte 0x040000b0
_0811C4D8: .4byte 0x0000c5ff
_0811C4DC: .4byte 0x00007fff
_0811C4E0: .4byte gUnknown_03004DE0
_0811C4E4: .4byte REG_WIN0H
_0811C4E8: .4byte REG_BLDY
_0811C4EC: .4byte sub_811C700
	thumb_func_end sub_811C43C

	thumb_func_start sub_811C4F0
sub_811C4F0: @ 811C4F0
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r1, _0811C5AC
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	movs r6, 0x1
	ldrh r0, [r1, 0x18]
	subs r0, 0x8
	strh r0, [r1, 0x18]
	ldrh r0, [r1, 0x1A]
	adds r0, 0x8
	strh r0, [r1, 0x1A]
	ldrh r2, [r4, 0x10]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	adds r7, r1, 0
	cmp r0, 0x4F
	bgt _0811C51A
	adds r0, r2, 0x2
	strh r0, [r4, 0x10]
_0811C51A:
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0x50
	ble _0811C526
	movs r0, 0x50
	strh r0, [r4, 0x10]
_0811C526:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	movs r1, 0x1
	ands r0, r1
	ldrh r2, [r4, 0x10]
	cmp r0, 0
	beq _0811C58C
	movs r3, 0
	lsls r0, r2, 16
	movs r6, 0
	cmp r0, 0
	blt _0811C58C
	movs r2, 0x50
	mov r12, r2
	ldr r5, _0811C5B0
_0811C546:
	lsls r0, r3, 16
	asrs r2, r0, 16
	mov r3, r12
	subs r1, r3, r2
	adds r0, r2, 0
	adds r0, 0x50
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	asrs r1, 15
	adds r1, r5
	ldrh r0, [r1]
	cmp r0, 0xF
	bhi _0811C568
	movs r6, 0x1
	adds r0, 0x1
	strh r0, [r1]
_0811C568:
	lsls r0, r3, 16
	asrs r0, 15
	adds r1, r0, r5
	ldrh r0, [r1]
	cmp r0, 0xF
	bhi _0811C57A
	movs r6, 0x1
	adds r0, 0x1
	strh r0, [r1]
_0811C57A:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	asrs r0, 16
	movs r2, 0x10
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, 0x10]
	cmp r0, r1
	ble _0811C546
_0811C58C:
	cmp r2, 0x50
	bne _0811C59A
	cmp r6, 0
	bne _0811C59A
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0811C59A:
	ldrb r0, [r7]
	adds r0, 0x1
	ldrb r1, [r7]
	strb r0, [r7]
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811C5AC: .4byte 0x0200c000
_0811C5B0: .4byte gUnknown_03004DE0
	thumb_func_end sub_811C4F0

	thumb_func_start sub_811C5B4
sub_811C5B4: @ 811C5B4
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r4, _0811C5E0
	ldrb r0, [r4]
	movs r6, 0
	strb r6, [r4]
	movs r0, 0x1
	negs r0, r0
	ldr r2, _0811C5E4
	movs r1, 0x10
	bl BlendPalettes
	movs r0, 0xFF
	strh r0, [r4, 0xE]
	strh r6, [r5, 0xE]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x1
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811C5E0: .4byte 0x0200c000
_0811C5E4: .4byte 0x00007fff
	thumb_func_end sub_811C5B4

	thumb_func_start sub_811C5E8
sub_811C5E8: @ 811C5E8
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _0811C628
	ldrb r0, [r5]
	movs r0, 0
	strb r0, [r5]
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	ldr r0, _0811C62C
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	movs r2, 0xA0
	lsls r2, 1
	bl memset
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0xF
	ble _0811C616
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0811C616:
	ldrb r0, [r5]
	adds r0, 0x1
	ldrb r1, [r5]
	strb r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811C628: .4byte 0x0200c000
_0811C62C: .4byte gUnknown_03004DE0
	thumb_func_end sub_811C5E8

	thumb_func_start sub_811C630
sub_811C630: @ 811C630
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _0811C664
	ldrh r2, [r1, 0xA]
	ldr r0, _0811C668
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _0811C66C
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_811D6D4
	ldr r0, [r4]
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811C664: .4byte 0x040000b0
_0811C668: .4byte 0x0000c5ff
_0811C66C: .4byte 0x00007fff
	thumb_func_end sub_811C630

	thumb_func_start sub_811C670
sub_811C670: @ 811C670
	push {r4,lr}
	ldr r4, _0811C6D4
	ldrh r1, [r4, 0xA]
	ldr r0, _0811C6D8
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0xA]
	ldr r0, _0811C6DC
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xA]
	bl sub_811D67C
	ldr r2, _0811C6E0
	ldrb r0, [r2]
	cmp r0, 0
	beq _0811C6A6
	ldr r1, _0811C6E4
	ldr r0, _0811C6E8
	str r0, [r1]
	movs r3, 0xF0
	lsls r3, 3
	adds r0, r3
	str r0, [r1, 0x4]
	ldr r0, _0811C6EC
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811C6A6:
	ldr r1, _0811C6F0
	ldrh r0, [r2, 0x1C]
	strh r0, [r1]
	adds r1, 0x36
	ldrh r0, [r2, 0x2]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r2, 0x4]
	strh r0, [r1]
	subs r1, 0x6
	ldrh r0, [r2, 0x8]
	strh r0, [r1]
	ldr r0, _0811C6F4
	str r0, [r4]
	ldr r0, _0811C6F8
	str r0, [r4, 0x4]
	ldr r0, _0811C6FC
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811C6D4: .4byte 0x040000b0
_0811C6D8: .4byte 0x0000c5ff
_0811C6DC: .4byte 0x00007fff
_0811C6E0: .4byte 0x0200c000
_0811C6E4: .4byte 0x040000d4
_0811C6E8: .4byte gUnknown_03004DE0
_0811C6EC: .4byte 0x800000a0
_0811C6F0: .4byte REG_BG0VOFS
_0811C6F4: .4byte gUnknown_03005560
_0811C6F8: .4byte REG_WIN0H
_0811C6FC: .4byte 0xa2400001
	thumb_func_end sub_811C670

	thumb_func_start sub_811C700
sub_811C700: @ 811C700
	push {r4,lr}
	ldr r4, _0811C750
	ldrh r1, [r4, 0xA]
	ldr r0, _0811C754
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0xA]
	ldr r0, _0811C758
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xA]
	bl sub_811D67C
	ldr r2, _0811C75C
	ldrb r0, [r2]
	cmp r0, 0
	beq _0811C736
	ldr r1, _0811C760
	ldr r0, _0811C764
	str r0, [r1]
	movs r3, 0xF0
	lsls r3, 3
	adds r0, r3
	str r0, [r1, 0x4]
	ldr r0, _0811C768
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811C736:
	ldr r1, _0811C76C
	ldrh r0, [r2, 0xE]
	strh r0, [r1]
	ldr r0, _0811C770
	str r0, [r4]
	ldr r0, _0811C774
	str r0, [r4, 0x4]
	ldr r0, _0811C778
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811C750: .4byte 0x040000b0
_0811C754: .4byte 0x0000c5ff
_0811C758: .4byte 0x00007fff
_0811C75C: .4byte 0x0200c000
_0811C760: .4byte 0x040000d4
_0811C764: .4byte gUnknown_03004DE0
_0811C768: .4byte 0x800000a0
_0811C76C: .4byte REG_BLDCNT
_0811C770: .4byte gUnknown_03005560
_0811C774: .4byte REG_BLDY
_0811C778: .4byte 0xa2400001
	thumb_func_end sub_811C700

	thumb_func_start sub_811C77C
sub_811C77C: @ 811C77C
	push {lr}
	ldr r0, _0811C790
	ldrh r0, [r0]
	cmp r0, 0x4F
	bhi _0811C79C
	ldr r0, _0811C794
	ldr r1, _0811C798
	ldrh r1, [r1, 0x18]
	b _0811C7A2
	.align 2, 0
_0811C790: .4byte REG_VCOUNT
_0811C794: .4byte REG_BG0HOFS
_0811C798: .4byte 0x0200c000
_0811C79C:
	ldr r0, _0811C7A8
	ldr r1, _0811C7AC
	ldrh r1, [r1, 0x1A]
_0811C7A2:
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0811C7A8: .4byte REG_BG0HOFS
_0811C7AC: .4byte 0x0200c000
	thumb_func_end sub_811C77C

	thumb_func_start sub_811C7B0
sub_811C7B0: @ 811C7B0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r0, _0811C8EC
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	mov r8, r1
	add r0, r8
	ldrb r0, [r0]
	ldr r2, _0811C8F0
	lsls r1, 2
	mov r8, r1
	adds r1, r2
	ldrh r1, [r1]
	subs r1, 0x20
	lsls r1, 16
	asrs r1, 16
	adds r2, 0x2
	add r2, r8
	ldrh r2, [r2]
	adds r2, 0x2A
	lsls r2, 16
	asrs r2, 16
	ldr r5, _0811C8F4
	str r5, [sp]
	movs r3, 0
	bl CreateTrainerSprite_BirchSpeech
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	ldr r0, _0811C8F8
	ldrb r0, [r0, 0x8]
	movs r1, 0x88
	lsls r1, 1
	str r5, [sp]
	movs r2, 0x6A
	movs r3, 0
	bl CreateTrainerSprite_BirchSpeech
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x24]
	movs r3, 0x22
	ldrsh r0, [r4, r3]
	lsls r5, r0, 4
	adds r5, r0
	lsls r5, 2
	ldr r1, _0811C8FC
	adds r5, r1
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	lsls r6, r0, 4
	adds r6, r0
	lsls r6, 2
	adds r6, r1
	ldr r0, _0811C900
	str r0, [r5, 0x1C]
	str r0, [r6, 0x1C]
	ldrb r0, [r5, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r5, 0x1]
	ldrb r0, [r6, 0x1]
	orrs r0, r1
	strb r0, [r6, 0x1]
	bl AllocOamMatrix
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0x1F
	mov r9, r3
	mov r4, r9
	ands r0, r4
	lsls r0, 1
	ldrb r2, [r5, 0x3]
	movs r4, 0x3F
	negs r4, r4
	adds r1, r4, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x3]
	bl AllocOamMatrix
	lsls r0, 24
	lsrs r0, 24
	mov r1, r9
	ands r0, r1
	lsls r0, 1
	ldrb r1, [r6, 0x3]
	ands r4, r1
	orrs r4, r0
	strb r4, [r6, 0x3]
	ldrb r2, [r5, 0x1]
	movs r1, 0x3F
	adds r0, r1, 0
	ands r0, r2
	movs r2, 0x40
	orrs r0, r2
	strb r0, [r5, 0x1]
	ldrb r0, [r6, 0x1]
	ands r1, r0
	orrs r1, r2
	strb r1, [r6, 0x1]
	ldrb r0, [r5, 0x3]
	movs r1, 0xC0
	orrs r0, r1
	strb r0, [r5, 0x3]
	ldrb r0, [r6, 0x3]
	orrs r0, r1
	strb r0, [r6, 0x3]
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0x3
	movs r3, 0x3
	bl CalcCenterToCornerVec
	adds r0, r6, 0
	movs r1, 0x1
	movs r2, 0x3
	movs r3, 0x3
	bl CalcCenterToCornerVec
	ldrb r0, [r5, 0x3]
	lsls r0, 26
	lsrs r0, 27
	ldr r2, _0811C904
	mov r3, r8
	adds r1, r3, r2
	movs r4, 0
	ldrsh r1, [r1, r4]
	adds r2, 0x2
	add r8, r2
	mov r3, r8
	movs r4, 0
	ldrsh r2, [r3, r4]
	movs r3, 0
	bl SetOamMatrixRotationScaling
	ldrb r0, [r6, 0x3]
	lsls r0, 26
	lsrs r0, 27
	ldr r1, _0811C908
	movs r2, 0x80
	lsls r2, 2
	movs r3, 0
	bl SetOamMatrixRotationScaling
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811C8EC: .4byte gUnknown_083FD850
_0811C8F0: .4byte gUnknown_083FD86A
_0811C8F4: .4byte 0x0200c03c
_0811C8F8: .4byte gSaveBlock2
_0811C8FC: .4byte gSprites
_0811C900: .4byte sub_811C90C
_0811C904: .4byte gUnknown_083FD856
_0811C908: .4byte 0xfffffe00
	thumb_func_end sub_811C7B0

	thumb_func_start sub_811C90C
sub_811C90C: @ 811C90C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _0811C930
_0811C912:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811C912
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811C930: .4byte gUnknown_083FD880
	thumb_func_end sub_811C90C

	thumb_func_start sub_811C934
sub_811C934: @ 811C934
	movs r0, 0
	bx lr
	thumb_func_end sub_811C934

	thumb_func_start sub_811C938
sub_811C938: @ 811C938
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r1, _0811C97C
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	add r4, sp, 0x4
	ldr r1, _0811C980
	adds r0, r4, 0
	movs r2, 0x4
	bl memcpy
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0x30]
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	lsls r0, 1
	adds r4, r0
	ldrh r0, [r4]
	strh r0, [r5, 0x32]
	movs r0, 0x1
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811C97C: .4byte gUnknown_083FD89C
_0811C980: .4byte gUnknown_083FD8A0
	thumb_func_end sub_811C938

	thumb_func_start sub_811C984
sub_811C984: @ 811C984
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	ldrh r3, [r1, 0x20]
	adds r2, r0, r3
	strh r2, [r1, 0x20]
	movs r3, 0x3C
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _0811C9A2
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x84
	bgt _0811C9B0
	b _0811C9AA
_0811C9A2:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x67
	ble _0811C9B0
_0811C9AA:
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
_0811C9B0:
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_811C984

	thumb_func_start sub_811C9B8
sub_811C9B8: @ 811C9B8
	push {lr}
	adds r2, r0, 0
	ldrh r3, [r2, 0x32]
	ldrh r0, [r2, 0x30]
	adds r1, r3, r0
	strh r1, [r2, 0x30]
	ldrh r0, [r2, 0x20]
	adds r0, r1
	strh r0, [r2, 0x20]
	lsls r1, 16
	cmp r1, 0
	bne _0811C9DE
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	negs r0, r3
	strh r0, [r2, 0x32]
	movs r0, 0x1
	strh r0, [r2, 0x3A]
_0811C9DE:
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_811C9B8

	thumb_func_start sub_811C9E4
sub_811C9E4: @ 811C9E4
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x32]
	ldrh r1, [r2, 0x30]
	adds r0, r1
	strh r0, [r2, 0x30]
	ldrh r1, [r2, 0x20]
	adds r1, r0
	strh r1, [r2, 0x20]
	adds r1, 0x1F
	lsls r1, 16
	movs r0, 0x97
	lsls r0, 17
	cmp r1, r0
	bls _0811CA08
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
_0811CA08:
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_811C9E4

	thumb_func_start sub_811CA10
sub_811CA10: @ 811CA10
	ldr r3, _0811CA24
	lsls r0, 16
	asrs r0, 16
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	strh r1, [r2, 0x3C]
	bx lr
	.align 2, 0
_0811CA24: .4byte gSprites
	thumb_func_end sub_811CA10

	thumb_func_start sub_811CA28
sub_811CA28: @ 811CA28
	ldr r2, _0811CA40
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	bx lr
	.align 2, 0
_0811CA40: .4byte gSprites
	thumb_func_end sub_811CA28

	thumb_func_start sub_811CA44
sub_811CA44: @ 811CA44
	ldr r2, _0811CA58
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r2, 0x3A
	ldrsh r0, [r1, r2]
	bx lr
	.align 2, 0
_0811CA58: .4byte gSprites
	thumb_func_end sub_811CA44

	thumb_func_start sub_811CA5C
sub_811CA5C: @ 811CA5C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811CA8C
	ldr r2, _0811CA90
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811CA6E:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811CA6E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811CA8C: .4byte gUnknown_083FD8A4
_0811CA90: .4byte gTasks
	thumb_func_end sub_811CA5C

	thumb_func_start sub_811CA94
sub_811CA94: @ 811CA94
	push {r4-r6,lr}
	adds r4, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	movs r2, 0
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r4, 0xC]
	movs r0, 0x1
	strh r0, [r4, 0xE]
	ldr r1, _0811CB08
	movs r0, 0x3F
	strh r0, [r1, 0x2]
	strh r2, [r1, 0x4]
	movs r0, 0xA0
	strh r0, [r1, 0x8]
	ldr r3, _0811CB0C
	adds r6, r1, 0
	movs r5, 0xF0
_0811CABE:
	lsls r0, r2, 1
	adds r0, r3
	ldrh r1, [r6, 0x14]
	strh r1, [r0]
	adds r0, r2, 0
	adds r0, 0xA0
	lsls r0, 1
	adds r0, r3
	strh r5, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x9F
	bls _0811CABE
	ldr r2, _0811CB10
	ldrh r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0811CB14
	ldrh r0, [r2]
	movs r1, 0x10
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0811CB18
	bl SetVBlankCallback
	ldr r0, _0811CB1C
	bl SetHBlankCallback
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811CB08: .4byte 0x0200c000
_0811CB0C: .4byte gUnknown_03005560
_0811CB10: .4byte 0x04000200
_0811CB14: .4byte REG_DISPSTAT
_0811CB18: .4byte sub_811CC28
_0811CB1C: .4byte sub_811CCB0
	thumb_func_end sub_811CA94

	thumb_func_start sub_811CB20
sub_811CB20: @ 811CB20
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r2, r0, 0
	ldr r1, _0811CB98
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldrh r0, [r2, 0xC]
	lsls r0, 16
	asrs r0, 24
	ldrh r3, [r2, 0xA]
	adds r0, r3
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	mov r12, r1
	cmp r0, 0xF0
	ble _0811CB4A
	movs r0, 0xF0
	strh r0, [r2, 0xA]
_0811CB4A:
	ldrh r4, [r2, 0xC]
	movs r0, 0xC
	ldrsh r1, [r2, r0]
	ldr r0, _0811CB9C
	ldrh r3, [r2, 0xE]
	cmp r1, r0
	bgt _0811CB5C
	adds r0, r4, r3
	strh r0, [r2, 0xC]
_0811CB5C:
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, 0x7F
	bgt _0811CB68
	lsls r0, r3, 1
	strh r0, [r2, 0xE]
_0811CB68:
	movs r5, 0
	ldr r7, _0811CBA0
	movs r1, 0xA0
	lsls r1, 1
	adds r1, r7
	mov r8, r1
	mov r6, r12
_0811CB76:
	lsls r0, r5, 1
	adds r3, r0, r7
	mov r1, r8
	adds r4, r0, r1
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	beq _0811CBA4
	ldrh r0, [r2, 0xA]
	ldrh r1, [r6, 0x14]
	adds r0, r1
	strh r0, [r3]
	ldrh r1, [r2, 0xA]
	movs r0, 0xF0
	subs r0, r1
	b _0811CBB4
	.align 2, 0
_0811CB98: .4byte 0x0200c000
_0811CB9C: .4byte 0x00000fff
_0811CBA0: .4byte gUnknown_03004DE0
_0811CBA4:
	ldrh r0, [r6, 0x14]
	ldrh r1, [r2, 0xA]
	subs r0, r1
	strh r0, [r3]
	ldrh r0, [r2, 0xA]
	lsls r0, 8
	movs r1, 0xF1
	orrs r0, r1
_0811CBB4:
	strh r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x9F
	bls _0811CB76
	movs r3, 0xA
	ldrsh r0, [r2, r3]
	cmp r0, 0xEF
	ble _0811CBCE
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
_0811CBCE:
	mov r1, r12
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r1, [r1]
	mov r2, r12
	strb r0, [r2]
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_811CB20

	thumb_func_start sub_811CBE8
sub_811CBE8: @ 811CBE8
	push {lr}
	ldr r1, _0811CC18
	ldrh r2, [r1, 0xA]
	ldr r0, _0811CC1C
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _0811CC20
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_811D6D4
	ldr r0, _0811CC24
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0811CC18: .4byte 0x040000b0
_0811CC1C: .4byte 0x0000c5ff
_0811CC20: .4byte 0x00007fff
_0811CC24: .4byte sub_811CA5C
	thumb_func_end sub_811CBE8

	thumb_func_start sub_811CC28
sub_811CC28: @ 811CC28
	push {r4,lr}
	ldr r4, _0811CC84
	ldrh r1, [r4, 0xA]
	ldr r0, _0811CC88
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0xA]
	ldr r0, _0811CC8C
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xA]
	bl sub_811D67C
	ldr r2, _0811CC90
	ldr r1, _0811CC94
	ldrh r0, [r1, 0x2]
	strh r0, [r2]
	adds r2, 0x2
	ldrh r0, [r1, 0x4]
	strh r0, [r2]
	subs r2, 0x6
	ldrh r0, [r1, 0x8]
	strh r0, [r2]
	ldrb r0, [r1]
	cmp r0, 0
	beq _0811CC70
	ldr r1, _0811CC98
	ldr r0, _0811CC9C
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _0811CCA0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811CC70:
	ldr r0, _0811CCA4
	str r0, [r4]
	ldr r0, _0811CCA8
	str r0, [r4, 0x4]
	ldr r0, _0811CCAC
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811CC84: .4byte 0x040000b0
_0811CC88: .4byte 0x0000c5ff
_0811CC8C: .4byte 0x00007fff
_0811CC90: .4byte REG_WININ
_0811CC94: .4byte 0x0200c000
_0811CC98: .4byte 0x040000d4
_0811CC9C: .4byte gUnknown_03004DE0
_0811CCA0: .4byte 0x80000140
_0811CCA4: .4byte gUnknown_030056A0
_0811CCA8: .4byte REG_WIN0H
_0811CCAC: .4byte 0xa2400001
	thumb_func_end sub_811CC28

	thumb_func_start sub_811CCB0
sub_811CCB0: @ 811CCB0
	ldr r1, _0811CCD0
	ldr r0, _0811CCD4
	ldrh r0, [r0]
	lsls r0, 1
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r2
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _0811CCD8
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	bx lr
	.align 2, 0
_0811CCD0: .4byte gUnknown_03004DE0
_0811CCD4: .4byte REG_VCOUNT
_0811CCD8: .4byte REG_BG1HOFS
	thumb_func_end sub_811CCB0

	thumb_func_start sub_811CCDC
sub_811CCDC: @ 811CCDC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811CD0C
	ldr r2, _0811CD10
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811CCEE:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811CCEE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811CD0C: .4byte gUnknown_083FD8B0
_0811CD10: .4byte gTasks
	thumb_func_end sub_811CCDC

	thumb_func_start sub_811CD14
sub_811CD14: @ 811CD14
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	ldr r1, _0811CD88
	movs r2, 0
	movs r0, 0xBF
	strh r0, [r1, 0xE]
	strh r2, [r1, 0x12]
	movs r0, 0x1E
	strh r0, [r1, 0x2]
	movs r0, 0x3F
	strh r0, [r1, 0x4]
	movs r0, 0xA0
	strh r0, [r1, 0x8]
	movs r1, 0
	ldr r2, _0811CD8C
	movs r4, 0
	movs r3, 0xF0
_0811CD3E:
	lsls r0, r1, 1
	adds r0, r2
	strh r4, [r0]
	adds r0, r1, 0
	adds r0, 0xA0
	lsls r0, 1
	adds r0, r2
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x9F
	bls _0811CD3E
	ldr r2, _0811CD90
	ldrh r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0811CD94
	ldrh r0, [r2]
	movs r1, 0x10
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0811CD98
	bl SetHBlankCallback
	ldr r0, _0811CD9C
	bl SetVBlankCallback
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811CD88: .4byte 0x0200c000
_0811CD8C: .4byte gUnknown_03005560
_0811CD90: .4byte 0x04000200
_0811CD94: .4byte REG_DISPSTAT
_0811CD98: .4byte sub_811CFAC
_0811CD9C: .4byte sub_811CEE4
	thumb_func_end sub_811CD14

	thumb_func_start sub_811CDA0
sub_811CDA0: @ 811CDA0
	push {r4-r6,lr}
	sub sp, 0x10
	adds r6, r0, 0
	ldr r1, _0811CE08
	mov r0, sp
	movs r2, 0x10
	bl memcpy
	movs r5, 0
	movs r4, 0
_0811CDB4:
	ldr r0, _0811CE0C
	bl CreateInvisibleSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0811CE10
	adds r2, r1, r0
	movs r0, 0xF0
	strh r0, [r2, 0x20]
	strh r4, [r2, 0x22]
	lsls r1, r5, 16
	asrs r1, 16
	lsls r0, r1, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r2, 0x38]
	adds r1, 0x1
	lsls r1, 16
	lsls r0, r4, 16
	movs r3, 0xA0
	lsls r3, 13
	adds r0, r3
	lsrs r4, r0, 16
	lsrs r5, r1, 16
	asrs r1, 16
	cmp r1, 0x7
	ble _0811CDB4
	ldrh r0, [r2, 0x3A]
	adds r0, 0x1
	strh r0, [r2, 0x3A]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	movs r0, 0
	add sp, 0x10
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811CE08: .4byte gUnknown_083FD8C4
_0811CE0C: .4byte sub_811CFD0
_0811CE10: .4byte gSprites
	thumb_func_end sub_811CDA0

	thumb_func_start sub_811CE14
sub_811CE14: @ 811CE14
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0811CE44
	ldrb r1, [r0]
	movs r1, 0
	strb r1, [r0]
	movs r1, 0x20
	ldrsh r0, [r0, r1]
	cmp r0, 0x7
	ble _0811CE3A
	movs r0, 0x1
	negs r0, r0
	ldr r2, _0811CE48
	movs r1, 0x10
	bl BlendPalettes
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0811CE3A:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811CE44: .4byte 0x0200c000
_0811CE48: .4byte 0x00007fff
	thumb_func_end sub_811CE14

	thumb_func_start sub_811CE4C
sub_811CE4C: @ 811CE4C
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r4, _0811CE9C
	ldrb r0, [r4]
	movs r5, 0
	strb r5, [r4]
	ldr r1, _0811CEA0
	ldrh r2, [r1, 0xA]
	ldr r0, _0811CEA4
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _0811CEA8
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0xF0
	strh r0, [r4, 0x6]
	strh r5, [r4, 0x12]
	movs r0, 0xFF
	strh r0, [r4, 0xE]
	movs r0, 0x3F
	strh r0, [r4, 0x2]
	ldr r0, _0811CEAC
	bl SetVBlankCallback
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811CE9C: .4byte 0x0200c000
_0811CEA0: .4byte 0x040000b0
_0811CEA4: .4byte 0x0000c5ff
_0811CEA8: .4byte 0x00007fff
_0811CEAC: .4byte sub_811CF74
	thumb_func_end sub_811CE4C

	thumb_func_start sub_811CEB0
sub_811CEB0: @ 811CEB0
	push {lr}
	ldr r1, _0811CEDC
	ldrh r0, [r1, 0x12]
	adds r0, 0x1
	strh r0, [r1, 0x12]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x10
	bls _0811CED4
	bl sub_811D6D4
	ldr r0, _0811CEE0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0811CED4:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0811CEDC: .4byte 0x0200c000
_0811CEE0: .4byte sub_811CCDC
	thumb_func_end sub_811CEB0

	thumb_func_start sub_811CEE4
sub_811CEE4: @ 811CEE4
	push {r4,lr}
	ldr r4, _0811CF48
	ldrh r1, [r4, 0xA]
	ldr r0, _0811CF4C
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0xA]
	ldr r0, _0811CF50
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xA]
	bl sub_811D67C
	ldr r2, _0811CF54
	ldr r1, _0811CF58
	ldrh r0, [r1, 0xE]
	strh r0, [r2]
	subs r2, 0x8
	ldrh r0, [r1, 0x2]
	strh r0, [r2]
	adds r2, 0x2
	ldrh r0, [r1, 0x4]
	strh r0, [r2]
	subs r2, 0x6
	ldrh r0, [r1, 0x6]
	strh r0, [r2]
	ldrb r0, [r1]
	cmp r0, 0
	beq _0811CF32
	ldr r1, _0811CF5C
	ldr r0, _0811CF60
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _0811CF64
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811CF32:
	ldr r0, _0811CF68
	str r0, [r4]
	ldr r0, _0811CF6C
	str r0, [r4, 0x4]
	ldr r0, _0811CF70
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811CF48: .4byte 0x040000b0
_0811CF4C: .4byte 0x0000c5ff
_0811CF50: .4byte 0x00007fff
_0811CF54: .4byte REG_BLDCNT
_0811CF58: .4byte 0x0200c000
_0811CF5C: .4byte 0x040000d4
_0811CF60: .4byte gUnknown_03004DE0
_0811CF64: .4byte 0x80000140
_0811CF68: .4byte gUnknown_030056A0
_0811CF6C: .4byte REG_WIN0H
_0811CF70: .4byte 0xa2400001
	thumb_func_end sub_811CEE4

	thumb_func_start sub_811CF74
sub_811CF74: @ 811CF74
	push {lr}
	bl sub_811D67C
	ldr r1, _0811CFA4
	ldr r2, _0811CFA8
	ldrh r0, [r2, 0x12]
	strh r0, [r1]
	subs r1, 0x4
	ldrh r0, [r2, 0xE]
	strh r0, [r1]
	subs r1, 0x8
	ldrh r0, [r2, 0x2]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r2, 0x4]
	strh r0, [r1]
	subs r1, 0xA
	ldrh r0, [r2, 0x6]
	strh r0, [r1]
	adds r1, 0x4
	ldrh r0, [r2, 0x8]
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0811CFA4: .4byte REG_BLDY
_0811CFA8: .4byte 0x0200c000
	thumb_func_end sub_811CF74

	thumb_func_start sub_811CFAC
sub_811CFAC: @ 811CFAC
	ldr r2, _0811CFC4
	ldr r1, _0811CFC8
	ldr r0, _0811CFCC
	ldrh r0, [r0]
	lsls r0, 1
	movs r3, 0xF0
	lsls r3, 3
	adds r1, r3
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	bx lr
	.align 2, 0
_0811CFC4: .4byte REG_BLDY
_0811CFC8: .4byte gUnknown_03004DE0
_0811CFCC: .4byte REG_VCOUNT
	thumb_func_end sub_811CFAC

	thumb_func_start sub_811CFD0
sub_811CFD0: @ 811CFD0
	push {r4-r6,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x38]
	movs r2, 0x38
	ldrsh r0, [r3, r2]
	cmp r0, 0
	beq _0811CFF8
	subs r0, r1, 0x1
	strh r0, [r3, 0x38]
	movs r1, 0x3A
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _0811D0AA
	ldr r0, _0811CFF4
	ldrb r1, [r0]
	movs r1, 0x1
	strb r1, [r0]
	b _0811D0AA
	.align 2, 0
_0811CFF4: .4byte 0x0200c000
_0811CFF8:
	movs r2, 0x22
	ldrsh r1, [r3, r2]
	lsls r1, 1
	ldr r0, _0811D0B0
	adds r6, r1, r0
	movs r2, 0xA0
	lsls r2, 1
	adds r0, r2
	adds r5, r1, r0
	movs r4, 0
_0811D00C:
	lsls r1, r4, 1
	adds r2, r1, r6
	ldrh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r2]
	adds r1, r5
	ldrh r0, [r3, 0x20]
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _0811D00C
	movs r1, 0x20
	ldrsh r0, [r3, r1]
	ldrh r2, [r3, 0x20]
	cmp r0, 0
	bne _0811D046
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	movs r0, 0x80
	lsls r0, 5
	cmp r1, r0
	bne _0811D046
	movs r0, 0x1
	strh r0, [r3, 0x30]
_0811D046:
	adds r1, r2, 0
	subs r1, 0x10
	strh r1, [r3, 0x20]
	ldrh r0, [r3, 0x2E]
	adds r0, 0x80
	strh r0, [r3, 0x2E]
	lsls r1, 16
	cmp r1, 0
	bge _0811D05C
	movs r0, 0
	strh r0, [r3, 0x20]
_0811D05C:
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	movs r1, 0x80
	lsls r1, 5
	cmp r0, r1
	ble _0811D06A
	strh r1, [r3, 0x2E]
_0811D06A:
	movs r0, 0x3A
	ldrsh r2, [r3, r0]
	cmp r2, 0
	beq _0811D07A
	ldr r0, _0811D0B4
	ldrb r1, [r0]
	movs r1, 0x1
	strb r1, [r0]
_0811D07A:
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _0811D0AA
	ldr r4, _0811D0B4
	cmp r2, 0
	beq _0811D09E
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0x6
	ble _0811D0AA
	ldrh r0, [r3, 0x32]
	adds r1, r0, 0x1
	strh r1, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _0811D0AA
_0811D09E:
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	adds r0, r3, 0
	bl DestroySprite
_0811D0AA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811D0B0: .4byte gUnknown_03004DE0
_0811D0B4: .4byte 0x0200c000
	thumb_func_end sub_811CFD0

	thumb_func_start sub_811D0B8
sub_811D0B8: @ 811D0B8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811D0E8
	ldr r2, _0811D0EC
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811D0CA:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811D0CA
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811D0E8: .4byte gUnknown_083FD8D4
_0811D0EC: .4byte gTasks
	thumb_func_end sub_811D0B8

	thumb_func_start sub_811D0F0
sub_811D0F0: @ 811D0F0
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	add r0, sp, 0x4
	add r1, sp, 0x8
	bl sub_811D6A8
	ldr r0, _0811D138
	ldr r1, [sp, 0x8]
	movs r2, 0x10
	bl CpuSet
	mov r1, sp
	movs r2, 0xF0
	lsls r2, 8
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, [sp, 0x4]
	ldr r2, _0811D13C
	mov r0, sp
	bl CpuSet
	ldr r0, _0811D140
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811D138: .4byte gUnknown_083FD528
_0811D13C: .4byte 0x01000400
_0811D140: .4byte gFieldEffectObjectPalette10
	thumb_func_end sub_811D0F0

	thumb_func_start sub_811D144
sub_811D144: @ 811D144
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0811D186
	mov r0, sp
	bl sub_811D690
	movs r0, 0x3
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	lsls r0, 5
	ldr r1, _0811D198
	adds r0, r1
	ldr r1, [sp]
	movs r2, 0x10
	bl CpuSet
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0xD
	ble _0811D186
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x10
	strh r0, [r4, 0xA]
_0811D186:
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811D198: .4byte gUnknown_083FD528
	thumb_func_end sub_811D144

	thumb_func_start sub_811D19C
sub_811D19C: @ 811D19C
	push {lr}
	ldrh r1, [r0, 0xA]
	subs r1, 0x1
	strh r1, [r0, 0xA]
	lsls r1, 16
	cmp r1, 0
	bne _0811D1BC
	bl sub_811D6D4
	ldr r0, _0811D1C4
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0811D1BC:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0811D1C4: .4byte sub_811D0B8
	thumb_func_end sub_811D19C

	thumb_func_start sub_811D1C8
sub_811D1C8: @ 811D1C8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811D1F8
	ldr r2, _0811D1FC
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811D1DA:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811D1DA
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811D1F8: .4byte gUnknown_083FD8E0
_0811D1FC: .4byte gTasks
	thumb_func_end sub_811D1C8

	thumb_func_start sub_811D200
sub_811D200: @ 811D200
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	ldr r1, _0811D254
	movs r2, 0
	movs r0, 0x3F
	strh r0, [r1, 0x2]
	strh r2, [r1, 0x4]
	movs r0, 0xA0
	strh r0, [r1, 0x8]
	movs r1, 0
	ldr r2, _0811D258
	movs r3, 0xF0
	adds r4, r2, 0
_0811D222:
	lsls r0, r1, 1
	adds r0, r2
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x9F
	bls _0811D222
	movs r0, 0xF0
	lsls r0, 3
	adds r1, r4, r0
	adds r0, r4, 0
	movs r2, 0xA0
	bl CpuSet
	ldr r0, _0811D25C
	bl SetVBlankCallback
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811D254: .4byte 0x0200c000
_0811D258: .4byte gUnknown_03004DE0
_0811D25C: .4byte sub_811D438
	thumb_func_end sub_811D200

	thumb_func_start sub_811D260
sub_811D260: @ 811D260
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	mov r8, r0
	ldr r0, _0811D2D0
	ldr r6, _0811D2D4
	mov r2, r8
	movs r3, 0xA
	ldrsh r1, [r2, r3]
	lsls r4, r1, 2
	adds r4, r1
	lsls r4, 1
	adds r1, r4, r6
	movs r5, 0
	ldrsh r1, [r1, r5]
	adds r2, r6, 0x2
	adds r2, r4, r2
	movs r3, 0
	ldrsh r2, [r2, r3]
	adds r3, r6, 0x4
	adds r3, r4, r3
	movs r5, 0
	ldrsh r3, [r3, r5]
	adds r5, r6, 0x6
	adds r4, r5
	movs r5, 0
	ldrsh r4, [r4, r5]
	str r4, [sp]
	movs r4, 0x1
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	bl sub_811D8FC
	mov r0, r8
	movs r2, 0xA
	ldrsh r1, [r0, r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 1
	adds r6, 0x8
	adds r0, r6
	ldrh r0, [r0]
	mov r3, r8
	strh r0, [r3, 0xC]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	movs r0, 0x1
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811D2D0: .4byte 0x0200c024
_0811D2D4: .4byte gUnknown_083FD8F4
	thumb_func_end sub_811D260

	thumb_func_start sub_811D2D8
sub_811D2D8: @ 811D2D8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	ldr r0, _0811D324
	ldrb r1, [r0]
	movs r1, 0
	strb r1, [r0]
	mov r8, r1
	mov r12, r1
	adds r6, r0, 0
	ldr r0, _0811D328
	mov r9, r0
_0811D2F4:
	ldr r1, _0811D328
	movs r2, 0x2A
	ldrsh r0, [r6, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsrs r3, r0, 8
	movs r4, 0xFF
	ands r4, r0
	movs r1, 0xC
	ldrsh r0, [r7, r1]
	cmp r0, 0
	bne _0811D32C
	movs r2, 0x28
	ldrsh r0, [r6, r2]
	cmp r3, r0
	bge _0811D318
	ldrh r3, [r6, 0x28]
_0811D318:
	lsls r0, r3, 16
	lsls r1, r4, 16
	cmp r0, r1
	ble _0811D344
	lsrs r3, r1, 16
	b _0811D344
	.align 2, 0
_0811D324: .4byte 0x0200c000
_0811D328: .4byte gUnknown_03004DE0
_0811D32C:
	lsls r0, r4, 16
	asrs r0, 16
	movs r2, 0x28
	ldrsh r1, [r6, r2]
	cmp r0, r1
	ble _0811D33A
	ldrh r4, [r6, 0x28]
_0811D33A:
	lsls r0, r4, 16
	lsls r1, r3, 16
	cmp r0, r1
	bgt _0811D344
	lsrs r4, r1, 16
_0811D344:
	ldr r5, _0811D368
	movs r0, 0x2A
	ldrsh r2, [r5, r0]
	lsls r2, 1
	add r2, r9
	lsls r1, r3, 16
	asrs r1, 8
	lsls r0, r4, 16
	asrs r0, 16
	orrs r0, r1
	strh r0, [r2]
	mov r1, r12
	cmp r1, 0
	beq _0811D36C
	ldrh r0, [r7, 0x8]
	adds r0, 0x1
	strh r0, [r7, 0x8]
	b _0811D392
	.align 2, 0
_0811D368: .4byte 0x0200c000
_0811D36C:
	adds r0, r5, 0
	adds r0, 0x24
	movs r1, 0x1
	movs r2, 0x1
	bl sub_811D978
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	mov r2, r8
	lsls r0, r2, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r2, r0, 16
	mov r8, r2
	asrs r0, 16
	cmp r0, 0xF
	ble _0811D2F4
_0811D392:
	ldr r0, _0811D3AC
	ldrb r1, [r0]
	adds r1, 0x1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, 0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811D3AC: .4byte 0x0200c000
	thumb_func_end sub_811D2D8

	thumb_func_start sub_811D3B0
sub_811D3B0: @ 811D3B0
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	ble _0811D3FC
	ldr r1, _0811D3EC
	ldrh r2, [r1, 0xA]
	ldr r0, _0811D3F0
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _0811D3F4
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_811D6D4
	ldr r0, _0811D3F8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	b _0811D414
	.align 2, 0
_0811D3EC: .4byte 0x040000b0
_0811D3F0: .4byte 0x0000c5ff
_0811D3F4: .4byte 0x00007fff
_0811D3F8: .4byte sub_811D1C8
_0811D3FC:
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	ldr r1, _0811D418
	movs r3, 0xA
	ldrsh r0, [r2, r3]
	subs r0, 0x1
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2, 0xE]
	movs r0, 0x1
_0811D414:
	pop {r1}
	bx r1
	.align 2, 0
_0811D418: .4byte gUnknown_083FD93A
	thumb_func_end sub_811D3B0

	thumb_func_start sub_811D41C
sub_811D41C: @ 811D41C
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0xE]
	subs r0, 0x1
	strh r0, [r1, 0xE]
	lsls r0, 16
	cmp r0, 0
	beq _0811D430
	movs r0, 0
	b _0811D434
_0811D430:
	movs r0, 0x1
	strh r0, [r1, 0x8]
_0811D434:
	pop {r1}
	bx r1
	thumb_func_end sub_811D41C

	thumb_func_start sub_811D438
sub_811D438: @ 811D438
	push {r4,lr}
	ldr r4, _0811D4A0
	ldrh r1, [r4, 0xA]
	ldr r0, _0811D4A4
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0xA]
	ldr r0, _0811D4A8
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xA]
	bl sub_811D67C
	ldr r2, _0811D4AC
	ldrb r0, [r2]
	cmp r0, 0
	beq _0811D46E
	ldr r1, _0811D4B0
	ldr r0, _0811D4B4
	str r0, [r1]
	movs r3, 0xF0
	lsls r3, 3
	adds r0, r3
	str r0, [r1, 0x4]
	ldr r0, _0811D4B8
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811D46E:
	ldr r1, _0811D4BC
	ldrh r0, [r2, 0x2]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r2, 0x4]
	strh r0, [r1]
	subs r1, 0x6
	ldrh r0, [r2, 0x8]
	strh r0, [r1]
	ldr r2, _0811D4C0
	ldr r0, _0811D4B4
	movs r1, 0xF0
	lsls r1, 3
	adds r0, r1
	ldrh r1, [r0]
	strh r1, [r2]
	str r0, [r4]
	str r2, [r4, 0x4]
	ldr r0, _0811D4C4
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811D4A0: .4byte 0x040000b0
_0811D4A4: .4byte 0x0000c5ff
_0811D4A8: .4byte 0x00007fff
_0811D4AC: .4byte 0x0200c000
_0811D4B0: .4byte 0x040000d4
_0811D4B4: .4byte gUnknown_03004DE0
_0811D4B8: .4byte 0x800000a0
_0811D4BC: .4byte REG_WININ
_0811D4C0: .4byte REG_WIN0H
_0811D4C4: .4byte 0xa2400001
	thumb_func_end sub_811D438

	thumb_func_start sub_811D4C8
sub_811D4C8: @ 811D4C8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	mov r8, r0
	adds r4, r1, 0
	adds r5, r2, 0
	adds r6, r3, 0
	ldr r3, [sp, 0x18]
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	lsls r3, 16
	lsrs r3, 16
	ldr r0, _0811D524
	movs r1, 0x3
	str r3, [sp]
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811D528
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	mov r0, r8
	strh r0, [r1, 0xA]
	strh r4, [r1, 0xC]
	strh r5, [r1, 0xE]
	strh r6, [r1, 0x10]
	ldr r3, [sp]
	strh r3, [r1, 0x12]
	strh r0, [r1, 0x14]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811D524: .4byte sub_811D54C
_0811D528: .4byte gTasks
	thumb_func_end sub_811D4C8

	thumb_func_start sub_811D52C
sub_811D52C: @ 811D52C
	push {lr}
	ldr r0, _0811D540
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0811D544
	movs r0, 0
	b _0811D546
	.align 2, 0
_0811D540: .4byte sub_811D54C
_0811D544:
	movs r0, 0x1
_0811D546:
	pop {r1}
	bx r1
	thumb_func_end sub_811D52C

	thumb_func_start sub_811D54C
sub_811D54C: @ 811D54C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811D57C
	ldr r2, _0811D580
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811D55E:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811D55E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811D57C: .4byte gUnknown_083FD948
_0811D580: .4byte gTasks
	thumb_func_end sub_811D54C

	thumb_func_start sub_811D584
sub_811D584: @ 811D584
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x14]
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0811D59C
	subs r0, r1, 0x1
	strh r0, [r4, 0x14]
	lsls r0, 16
	cmp r0, 0
	bne _0811D5C0
_0811D59C:
	ldrh r0, [r4, 0xA]
	strh r0, [r4, 0x14]
	ldrh r0, [r4, 0x10]
	ldrh r1, [r4, 0x16]
	adds r0, r1
	strh r0, [r4, 0x16]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _0811D5B4
	movs r0, 0x10
	strh r0, [r4, 0x16]
_0811D5B4:
	movs r0, 0x1
	negs r0, r0
	ldrb r1, [r4, 0x16]
	ldr r2, _0811D5DC
	bl BlendPalettes
_0811D5C0:
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	ble _0811D5D2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0xC]
	strh r0, [r4, 0x14]
_0811D5D2:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811D5DC: .4byte 0x00002d6b
	thumb_func_end sub_811D584

	thumb_func_start sub_811D5E0
sub_811D5E0: @ 811D5E0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x14]
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0811D5F8
	subs r0, r1, 0x1
	strh r0, [r4, 0x14]
	lsls r0, 16
	cmp r0, 0
	bne _0811D61A
_0811D5F8:
	ldrh r0, [r4, 0xC]
	strh r0, [r4, 0x14]
	ldrh r0, [r4, 0x16]
	ldrh r1, [r4, 0x12]
	subs r0, r1
	strh r0, [r4, 0x16]
	lsls r0, 16
	cmp r0, 0
	bge _0811D60E
	movs r0, 0
	strh r0, [r4, 0x16]
_0811D60E:
	movs r0, 0x1
	negs r0, r0
	ldrb r1, [r4, 0x16]
	ldr r2, _0811D640
	bl BlendPalettes
_0811D61A:
	movs r0, 0x16
	ldrsh r1, [r4, r0]
	cmp r1, 0
	bne _0811D64E
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _0811D648
	ldr r0, _0811D644
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	b _0811D64E
	.align 2, 0
_0811D640: .4byte 0x00002d6b
_0811D644: .4byte sub_811D54C
_0811D648:
	ldrh r0, [r4, 0xA]
	strh r0, [r4, 0x14]
	strh r1, [r4, 0x8]
_0811D64E:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_811D5E0

	thumb_func_start sub_811D658
sub_811D658: @ 811D658
	push {lr}
	ldr r0, _0811D674
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0x3C
	bl memset
	ldr r0, _0811D678
	adds r1, r0, 0x2
	bl sub_8057B14
	pop {r0}
	bx r0
	.align 2, 0
_0811D674: .4byte gUnknown_083FD708
_0811D678: .4byte 0x0200c014
	thumb_func_end sub_811D658

	thumb_func_start sub_811D67C
sub_811D67C: @ 811D67C
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_811D67C

	thumb_func_start sub_811D690
sub_811D690: @ 811D690
	ldr r1, _0811D6A4
	ldrh r1, [r1]
	lsrs r1, 2
	lsls r1, 30
	lsrs r1, 16
	movs r2, 0xC0
	lsls r2, 19
	adds r1, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_0811D6A4: .4byte REG_BG0CNT
	thumb_func_end sub_811D690

	thumb_func_start sub_811D6A8
sub_811D6A8: @ 811D6A8
	push {r4,lr}
	ldr r3, _0811D6D0
	ldrh r2, [r3]
	lsrs r2, 8
	ldrh r3, [r3]
	lsrs r3, 2
	lsls r2, 27
	lsrs r2, 16
	lsls r3, 30
	lsrs r3, 16
	movs r4, 0xC0
	lsls r4, 19
	adds r2, r4
	str r2, [r0]
	adds r3, r4
	str r3, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811D6D0: .4byte REG_BG0CNT
	thumb_func_end sub_811D6A8

	thumb_func_start sub_811D6D4
sub_811D6D4: @ 811D6D4
	push {lr}
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	pop {r0}
	bx r0
	thumb_func_end sub_811D6D4

	thumb_func_start sub_811D6E8
sub_811D6E8: @ 811D6E8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r10, r0
	ldr r0, [sp, 0x20]
	ldr r4, [sp, 0x24]
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 16
	lsrs r3, 16
	lsls r0, 16
	lsrs r1, r0, 16
	lsls r4, 16
	movs r6, 0
	lsrs r5, r4, 16
	cmp r4, 0
	ble _0811D750
	lsls r0, r7, 16
	asrs r0, 16
	mov r9, r0
	lsls r1, 16
	mov r8, r1
	lsls r0, r3, 16
	asrs r7, r0, 16
_0811D720:
	lsls r4, r2, 16
	asrs r4, 16
	movs r0, 0xFF
	ands r0, r4
	mov r2, r8
	asrs r1, r2, 16
	bl Sin
	lsls r1, r6, 1
	add r1, r10
	add r0, r9
	strh r0, [r1]
	lsls r1, r5, 16
	ldr r0, _0811D760
	adds r1, r0
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r4, r7
	lsls r4, 16
	lsrs r2, r4, 16
	lsrs r5, r1, 16
	cmp r1, 0
	bgt _0811D720
_0811D750:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811D760: .4byte 0xffff0000
	thumb_func_end sub_811D6E8

	thumb_func_start sub_811D764
sub_811D764: @ 811D764
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	mov r9, r0
	adds r5, r2, 0
	adds r4, r3, 0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 16
	lsrs r4, 16
	movs r2, 0xA0
	lsls r2, 1
	movs r1, 0xA
	bl memset
	movs r1, 0
	lsls r4, 16
	asrs r4, 16
	str r4, [sp, 0x4]
	lsls r5, 16
	asrs r5, 16
	str r5, [sp, 0x8]
_0811D79C:
	lsls r5, r1, 16
	asrs r0, r5, 16
	mov r10, r0
	ldr r1, [sp, 0x4]
	bl Sin
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r10
	ldr r1, [sp, 0x4]
	bl Cos
	ldr r2, [sp]
	lsls r1, r2, 16
	asrs r1, 16
	lsls r4, 16
	asrs r4, 16
	subs r2, r1, r4
	lsls r2, 16
	adds r1, r4
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r0, 16
	asrs r0, 16
	ldr r3, [sp, 0x8]
	subs r1, r3, r0
	lsls r1, 16
	lsrs r7, r1, 16
	adds r0, r3, r0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsrs r1, r2, 16
	str r5, [sp, 0x10]
	cmp r2, 0
	bge _0811D7E8
	movs r1, 0
_0811D7E8:
	lsls r0, r6, 16
	asrs r0, 16
	cmp r0, 0xF0
	ble _0811D7F2
	movs r6, 0xF0
_0811D7F2:
	lsls r0, r7, 16
	cmp r0, 0
	bge _0811D7FA
	movs r7, 0
_0811D7FA:
	mov r2, r8
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x9F
	ble _0811D808
	movs r3, 0x9F
	mov r8, r3
_0811D808:
	lsls r0, r1, 24
	lsrs r0, 16
	orrs r6, r0
	lsls r0, r7, 16
	asrs r0, 16
	str r0, [sp, 0xC]
	lsls r0, 1
	add r0, r9
	strh r6, [r0]
	mov r0, r8
	lsls r4, r0, 16
	asrs r0, r4, 15
	add r0, r9
	strh r6, [r0]
	mov r0, r10
	adds r0, 0x1
	lsls r0, 16
	asrs r0, 16
	ldr r1, [sp, 0x4]
	bl Cos
	lsls r0, 16
	asrs r0, 16
	ldr r2, [sp, 0x8]
	subs r1, r2, r0
	lsls r1, 16
	adds r0, r2, r0
	lsls r0, 16
	lsrs r2, r0, 16
	lsrs r3, r1, 16
	cmp r1, 0
	bge _0811D84A
	movs r3, 0
_0811D84A:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x9F
	ble _0811D854
	movs r2, 0x9F
_0811D854:
	lsls r0, r3, 16
	asrs r1, r0, 16
	adds r3, r0, 0
	lsls r5, r2, 16
	ldr r0, [sp, 0xC]
	cmp r0, r1
	ble _0811D878
	adds r2, r1, 0
_0811D864:
	lsls r1, r7, 16
	ldr r0, _0811D8F8
	adds r1, r0
	asrs r0, r1, 15
	add r0, r9
	strh r6, [r0]
	lsrs r7, r1, 16
	asrs r1, 16
	cmp r1, r2
	bgt _0811D864
_0811D878:
	lsls r1, r7, 16
	asrs r0, r3, 16
	cmp r1, r3
	bge _0811D896
	adds r2, r0, 0
_0811D882:
	movs r3, 0x80
	lsls r3, 9
	adds r0, r1, r3
	asrs r1, r0, 15
	add r1, r9
	strh r6, [r1]
	adds r1, r0, 0
	asrs r0, r1, 16
	cmp r0, r2
	blt _0811D882
_0811D896:
	asrs r0, r5, 16
	cmp r4, r5
	ble _0811D8B4
	adds r1, r0, 0
_0811D89E:
	ldr r2, _0811D8F8
	adds r0, r4, r2
	lsrs r3, r0, 16
	mov r8, r3
	asrs r0, 15
	add r0, r9
	strh r6, [r0]
	lsls r4, r3, 16
	asrs r0, r4, 16
	cmp r0, r1
	bgt _0811D89E
_0811D8B4:
	mov r0, r8
	lsls r4, r0, 16
	asrs r0, r5, 16
	cmp r4, r5
	bge _0811D8D4
	adds r2, r0, 0
_0811D8C0:
	movs r1, 0x80
	lsls r1, 9
	adds r0, r4, r1
	asrs r1, r0, 15
	add r1, r9
	strh r6, [r1]
	adds r4, r0, 0
	asrs r0, r4, 16
	cmp r0, r2
	blt _0811D8C0
_0811D8D4:
	ldr r2, [sp, 0x10]
	movs r3, 0x80
	lsls r3, 9
	adds r0, r2, r3
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x3F
	bgt _0811D8E6
	b _0811D79C
_0811D8E6:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811D8F8: .4byte 0xffff0000
	thumb_func_end sub_811D764

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

	thumb_func_start nullsub_74
nullsub_74: @ 811DA74
	bx lr
	thumb_func_end nullsub_74

	thumb_func_start sub_811DA78
sub_811DA78: @ 811DA78
	ldr r1, _0811DA88
	ldr r0, _0811DA8C
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811DA90
	str r1, [r0]
	bx lr
	.align 2, 0
_0811DA88: .4byte gUnknown_03004330
_0811DA8C: .4byte gUnknown_02024A60
_0811DA90: .4byte sub_811DA94
	thumb_func_end sub_811DA78

	thumb_func_start sub_811DA94
sub_811DA94: @ 811DA94
	push {lr}
	ldr r2, _0811DAC8
	ldr r1, _0811DACC
	ldr r0, _0811DAD0
	ldrb r3, [r0]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0811DAE0
	ldr r0, _0811DAD4
	lsls r1, r3, 9
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x38
	bhi _0811DADC
	ldr r0, _0811DAD8
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _0811DAE0
	.align 2, 0
_0811DAC8: .4byte gUnknown_02024A64
_0811DACC: .4byte gBitTable
_0811DAD0: .4byte gUnknown_02024A60
_0811DAD4: .4byte gUnknown_02023A60
_0811DAD8: .4byte gUnknown_083FE4F4
_0811DADC:
	bl dp01_tbl3_exec_completed
_0811DAE0:
	pop {r0}
	bx r0
	thumb_func_end sub_811DA94

	thumb_func_start sub_811DAE4
sub_811DAE4: @ 811DAE4
	push {lr}
	ldr r2, _0811DB0C
	ldr r1, _0811DB10
	ldr r0, _0811DB14
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0811DB18
	cmp r1, r0
	bne _0811DB08
	bl dp01_tbl3_exec_completed
_0811DB08:
	pop {r0}
	bx r0
	.align 2, 0
_0811DB0C: .4byte gSprites
_0811DB10: .4byte gUnknown_02024BE0
_0811DB14: .4byte gUnknown_02024A60
_0811DB18: .4byte SpriteCallbackDummy
	thumb_func_end sub_811DAE4

	thumb_func_start sub_811DB1C
sub_811DB1C: @ 811DB1C
	push {r4-r6,lr}
	ldr r6, _0811DB74
	ldr r5, _0811DB78
	ldr r4, _0811DB7C
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r6, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, [r0]
	ldr r0, _0811DB80
	cmp r1, r0
	bne _0811DB6C
	movs r0, 0
	bl nullsub_10
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl FreeSpriteOamMatrix
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl DestroySprite
	bl dp01_tbl3_exec_completed
_0811DB6C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811DB74: .4byte gSprites
_0811DB78: .4byte gUnknown_02024BE0
_0811DB7C: .4byte gUnknown_02024A60
_0811DB80: .4byte SpriteCallbackDummy
	thumb_func_end sub_811DB1C

	thumb_func_start sub_811DB84
sub_811DB84: @ 811DB84
	push {lr}
	ldr r3, _0811DBB8
	ldrb r0, [r3]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r2, _0811DBBC
	adds r1, r2
	ldrb r0, [r1, 0x9]
	subs r0, 0x1
	strb r0, [r1, 0x9]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0811DBB4
	ldrb r0, [r3]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0
	strb r0, [r1, 0x9]
	bl dp01_tbl3_exec_completed
_0811DBB4:
	pop {r0}
	bx r0
	.align 2, 0
_0811DBB8: .4byte gUnknown_02024A60
_0811DBBC: .4byte 0x02017810
	thumb_func_end sub_811DB84

	thumb_func_start sub_811DBC0
sub_811DBC0: @ 811DBC0
	push {r4-r6,lr}
	movs r6, 0
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _0811DBE4
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _0811DC18
	ldr r0, _0811DC04
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0811DC18
_0811DBE4:
	ldr r2, _0811DC08
	ldr r1, _0811DC0C
	ldr r0, _0811DC10
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0811DC14
	cmp r1, r0
	bne _0811DC50
	b _0811DC4E
	.align 2, 0
_0811DC04: .4byte gUnknown_020239F8
_0811DC08: .4byte gSprites
_0811DC0C: .4byte gUnknown_03004340
_0811DC10: .4byte gUnknown_02024A60
_0811DC14: .4byte SpriteCallbackDummy
_0811DC18:
	ldr r2, _0811DC84
	ldr r5, _0811DC88
	ldr r0, _0811DC8C
	ldrb r3, [r0]
	adds r0, r3, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r2, 0
	adds r4, 0x1C
	adds r0, r4
	ldr r2, [r0]
	ldr r0, _0811DC90
	cmp r2, r0
	bne _0811DC50
	movs r0, 0x2
	eors r3, r0
	adds r0, r3, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	cmp r0, r2
	bne _0811DC50
_0811DC4E:
	movs r6, 0x1
_0811DC50:
	bl IsCryPlayingOrClearCrySongs
	lsls r0, 24
	cmp r0, 0
	beq _0811DC5C
	movs r6, 0
_0811DC5C:
	cmp r6, 0
	beq _0811DC7E
	ldr r2, _0811DC8C
	ldrb r1, [r2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0811DC94
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0, 0x9]
	ldr r1, _0811DC98
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811DC9C
	str r1, [r0]
_0811DC7E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811DC84: .4byte gSprites
_0811DC88: .4byte gUnknown_03004340
_0811DC8C: .4byte gUnknown_02024A60
_0811DC90: .4byte SpriteCallbackDummy
_0811DC94: .4byte 0x02017810
_0811DC98: .4byte gUnknown_03004330
_0811DC9C: .4byte sub_811DB84
	thumb_func_end sub_811DBC0

	thumb_func_start sub_811DCA0
sub_811DCA0: @ 811DCA0
	push {r4-r7,lr}
	ldr r6, _0811DDBC
	ldrb r2, [r6]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r4, _0811DDC0
	adds r3, r0, r4
	ldrb r1, [r3]
	movs r5, 0x8
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _0811DDB4
	movs r7, 0x2
	adds r1, r7, 0
	eors r1, r2
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	adds r0, r5, 0
	ands r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _0811DDB4
	ldrb r0, [r3, 0x9]
	adds r0, 0x1
	strb r0, [r3, 0x9]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0811DDB4
	ldrb r0, [r6]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	strb r2, [r1, 0x9]
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _0811DD56
	ldr r0, _0811DDC4
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0811DD56
	ldr r1, _0811DDC8
	ldrb r0, [r6]
	eors r0, r7
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0811DDCC
	adds r0, r1
	bl DestroySprite
	ldr r4, _0811DDD0
	ldrb r0, [r6]
	adds r1, r7, 0
	eors r1, r0
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _0811DDD4
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0811DDD8
	adds r1, r2
	movs r2, 0
	bl sub_8045A5C
	ldrb r0, [r6]
	eors r0, r7
	bl sub_804777C
	ldrb r0, [r6]
	eors r0, r7
	adds r0, r4
	ldrb r0, [r0]
	bl sub_8043DFC
_0811DD56:
	ldr r1, _0811DDC8
	ldr r4, _0811DDBC
	ldrb r0, [r4]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0811DDCC
	adds r0, r1
	bl DestroySprite
	ldr r5, _0811DDD0
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _0811DDD4
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0811DDD8
	adds r1, r2
	movs r2, 0
	bl sub_8045A5C
	ldrb r0, [r4]
	bl sub_804777C
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl sub_8043DFC
	ldr r2, _0811DDDC
	ldrb r1, [r2, 0x9]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _0811DDE0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811DDE4
	str r1, [r0]
_0811DDB4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811DDBC: .4byte gUnknown_02024A60
_0811DDC0: .4byte 0x02017810
_0811DDC4: .4byte gUnknown_020239F8
_0811DDC8: .4byte gUnknown_0300434C
_0811DDCC: .4byte gSprites
_0811DDD0: .4byte gUnknown_03004340
_0811DDD4: .4byte gUnknown_02024A6A
_0811DDD8: .4byte gPlayerParty
_0811DDDC: .4byte 0x02017840
_0811DDE0: .4byte gUnknown_03004330
_0811DDE4: .4byte sub_811DBC0
	thumb_func_end sub_811DCA0

	thumb_func_start sub_811DDE8
sub_811DDE8: @ 811DDE8
	push {lr}
	ldr r2, _0811DE1C
	ldr r1, _0811DE20
	ldr r0, _0811DE24
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	cmp r0, 0
	bge _0811DE16
	movs r2, 0x24
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0811DE16
	bl dp01_tbl3_exec_completed
_0811DE16:
	pop {r0}
	bx r0
	.align 2, 0
_0811DE1C: .4byte gSprites
_0811DE20: .4byte gUnknown_02024BE0
_0811DE24: .4byte gUnknown_02024A60
	thumb_func_end sub_811DDE8

	thumb_func_start bx_t3_healthbar_update
bx_t3_healthbar_update: @ 811DE28
	push {r4-r6,lr}
	ldr r5, _0811DE68
	ldrb r0, [r5]
	ldr r6, _0811DE6C
	adds r1, r0, r6
	ldrb r1, [r1]
	movs r2, 0
	movs r3, 0
	bl sub_8045C78
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	bl sub_8043DFC
	lsls r4, 16
	asrs r1, r4, 16
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0811DE70
	ldrb r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	movs r2, 0
	bl sub_80440EC
	b _0811DE8A
	.align 2, 0
_0811DE68: .4byte gUnknown_02024A60
_0811DE6C: .4byte gUnknown_03004340
_0811DE70:
	ldr r2, _0811DE90
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _0811DE94
	adds r0, r2
	bl sub_80324F8
	bl dp01_tbl3_exec_completed
_0811DE8A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811DE90: .4byte gUnknown_02024A6A
_0811DE94: .4byte gPlayerParty
	thumb_func_end bx_t3_healthbar_update

	thumb_func_start sub_811DE98
sub_811DE98: @ 811DE98
	push {r4-r6,lr}
	ldr r6, _0811DF1C
	ldr r5, _0811DF20
	ldr r4, _0811DF24
	ldrb r2, [r4]
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r3, 0x22
	ldrsh r1, [r0, r3]
	movs r3, 0x26
	ldrsh r0, [r0, r3]
	adds r1, r0
	cmp r1, 0xA0
	ble _0811DF14
	ldr r1, _0811DF28
	lsls r0, r2, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0811DF2C
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl nullsub_9
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl DestroySprite
	ldr r1, _0811DF30
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8043DB0
	bl dp01_tbl3_exec_completed
_0811DF14:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811DF1C: .4byte gSprites
_0811DF20: .4byte gUnknown_02024BE0
_0811DF24: .4byte gUnknown_02024A60
_0811DF28: .4byte gUnknown_02024A6A
_0811DF2C: .4byte gPlayerParty
_0811DF30: .4byte gUnknown_03004340
	thumb_func_end sub_811DE98

	thumb_func_start sub_811DF34
sub_811DF34: @ 811DF34
	push {r4-r6,lr}
	ldr r6, _0811DF8C
	ldrb r2, [r6]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r1, _0811DF90
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0811DF84
	ldr r5, _0811DF94
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0811DF98
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r1, _0811DF9C
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8043DB0
	bl dp01_tbl3_exec_completed
_0811DF84:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811DF8C: .4byte gUnknown_02024A60
_0811DF90: .4byte 0x02017810
_0811DF94: .4byte gUnknown_02024BE0
_0811DF98: .4byte gSprites
_0811DF9C: .4byte gUnknown_03004340
	thumb_func_end sub_811DF34

	thumb_func_start sub_811DFA0
sub_811DFA0: @ 811DFA0
	push {lr}
	ldr r0, _0811DFB4
	ldrh r0, [r0, 0x16]
	cmp r0, 0
	bne _0811DFAE
	bl dp01_tbl3_exec_completed
_0811DFAE:
	pop {r0}
	bx r0
	.align 2, 0
_0811DFB4: .4byte gUnknown_03004210
	thumb_func_end sub_811DFA0

	thumb_func_start bx_blink_t3
bx_blink_t3: @ 811DFB8
	push {r4,lr}
	ldr r1, _0811DFF4
	ldr r0, _0811DFF8
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	ldr r2, _0811DFFC
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x20
	bne _0811E004
	movs r3, 0
	movs r0, 0
	strh r0, [r4, 0x30]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	subs r0, 0x5
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0811E000
	strb r3, [r0]
	bl dp01_tbl3_exec_completed
	b _0811E02E
	.align 2, 0
_0811DFF4: .4byte gUnknown_02024BE0
_0811DFF8: .4byte gUnknown_02024A60
_0811DFFC: .4byte gSprites
_0811E000: .4byte gUnknown_02024E6D
_0811E004:
	ldrh r0, [r4, 0x30]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _0811E028
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_0811E028:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
_0811E02E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end bx_blink_t3

	thumb_func_start sub_811E034
sub_811E034: @ 811E034
	push {r4,lr}
	ldr r2, _0811E084
	ldr r0, _0811E088
	ldr r4, _0811E08C
	ldrb r3, [r4]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0811E090
	cmp r1, r0
	bne _0811E07C
	lsls r0, r3, 2
	ldr r1, _0811E094
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0811E070
	adds r0, r3, 0
	adds r1, r3, 0
	adds r2, r3, 0
	movs r3, 0x6
	bl move_anim_start_t4
_0811E070:
	ldr r0, _0811E098
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, _0811E09C
	str r0, [r1]
_0811E07C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811E084: .4byte gSprites
_0811E088: .4byte gUnknown_03004340
_0811E08C: .4byte gUnknown_02024A60
_0811E090: .4byte SpriteCallbackDummy
_0811E094: .4byte 0x02017800
_0811E098: .4byte gUnknown_03004330
_0811E09C: .4byte sub_811E0A0
	thumb_func_end sub_811E034

	thumb_func_start sub_811E0A0
sub_811E0A0: @ 811E0A0
	push {lr}
	ldr r0, _0811E0C4
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0811E0C8
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0811E0BE
	bl dp01_tbl3_exec_completed
_0811E0BE:
	pop {r0}
	bx r0
	.align 2, 0
_0811E0C4: .4byte gUnknown_02024A60
_0811E0C8: .4byte 0x02017810
	thumb_func_end sub_811E0A0

	thumb_func_start sub_811E0CC
sub_811E0CC: @ 811E0CC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r7, _0811E190
	ldrb r1, [r7]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r3, _0811E194
	adds r2, r0, r3
	ldrb r1, [r2, 0x1]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0811E186
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r7]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r1, 0x1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldr r4, _0811E198
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	ldr r0, _0811E19C
	movs r1, 0xA
	bl CreateTask
	ldr r0, _0811E1A0
	mov r8, r0
	ldrb r1, [r7]
	lsls r0, r1, 1
	add r0, r8
	ldrh r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0811E1A4
	adds r0, r5
	bl sub_80324F8
	ldr r1, _0811E1A8
	ldrb r0, [r7]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0811E1AC
	adds r0, r1
	movs r1, 0
	bl StartSpriteAnim
	ldr r4, _0811E1B0
	ldrb r1, [r7]
	adds r0, r1, r4
	ldrb r0, [r0]
	lsls r1, 1
	add r1, r8
	ldrh r1, [r1]
	muls r1, r6
	adds r1, r5
	movs r2, 0
	bl sub_8045A5C
	ldrb r0, [r7]
	bl sub_804777C
	ldrb r0, [r7]
	adds r0, r4
	ldrb r0, [r0]
	bl sub_8043DFC
	ldrb r0, [r7]
	bl sub_8031F88
	ldr r1, _0811E1B4
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811E1B8
	str r1, [r0]
_0811E186:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811E190: .4byte gUnknown_02024A60
_0811E194: .4byte 0x02017810
_0811E198: .4byte 0x000027f9
_0811E19C: .4byte c3_0802FDF4
_0811E1A0: .4byte gUnknown_02024A6A
_0811E1A4: .4byte gPlayerParty
_0811E1A8: .4byte gUnknown_02024BE0
_0811E1AC: .4byte gSprites
_0811E1B0: .4byte gUnknown_03004340
_0811E1B4: .4byte gUnknown_03004330
_0811E1B8: .4byte sub_811E034
	thumb_func_end sub_811E0CC

	thumb_func_start sub_811E1BC
sub_811E1BC: @ 811E1BC
	push {r4-r6,lr}
	ldr r4, _0811E234
	ldrb r2, [r4]
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	ldr r6, _0811E238
	adds r0, r6
	ldrb r1, [r0]
	movs r0, 0x88
	ands r0, r1
	cmp r0, 0
	bne _0811E1EA
	ldr r0, _0811E23C
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0811E240
	adds r1, r0
	adds r0, r2, 0
	bl sub_8141828
_0811E1EA:
	ldr r5, _0811E244
	ldr r0, _0811E248
	ldrb r2, [r4]
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r3, r0, 2
	adds r0, r5, 0
	adds r0, 0x1C
	adds r0, r3, r0
	ldr r1, [r0]
	ldr r0, _0811E24C
	cmp r1, r0
	bne _0811E22C
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _0811E22C
	adds r0, r3, r5
	bl DestroySprite
	ldr r1, _0811E250
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811E254
	str r1, [r0]
_0811E22C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811E234: .4byte gUnknown_02024A60
_0811E238: .4byte 0x02017810
_0811E23C: .4byte gUnknown_02024A6A
_0811E240: .4byte gPlayerParty
_0811E244: .4byte gSprites
_0811E248: .4byte gUnknown_0300434C
_0811E24C: .4byte SpriteCallbackDummy
_0811E250: .4byte gUnknown_03004330
_0811E254: .4byte sub_811E0CC
	thumb_func_end sub_811E1BC

	thumb_func_start sub_811E258
sub_811E258: @ 811E258
	push {lr}
	ldr r0, _0811E288
	ldrb r0, [r0]
	cmp r0, 0
	bne _0811E284
	movs r0, 0x5A
	bl m4aSongNumStop
	ldr r3, _0811E28C
	ldr r0, _0811E290
	adds r2, r3, r0
	ldrb r1, [r2]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0811E294
	ldr r0, [r0]
	str r0, [r3]
	ldr r0, _0811E298
	bl SetMainCallback2
_0811E284:
	pop {r0}
	bx r0
	.align 2, 0
_0811E288: .4byte gReceivedRemoteLinkPlayers
_0811E28C: .4byte gMain
_0811E290: .4byte 0x0000043d
_0811E294: .4byte gUnknown_030042D0
_0811E298: .4byte c2_8011A1C
	thumb_func_end sub_811E258

	thumb_func_start sub_811E29C
sub_811E29C: @ 811E29C
	push {lr}
	ldr r0, _0811E2CC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811E302
	ldr r0, _0811E2D0
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0811E2E0
	bl sub_800832C
	ldr r1, _0811E2D4
	ldr r0, _0811E2D8
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811E2DC
	str r1, [r0]
	b _0811E302
	.align 2, 0
_0811E2CC: .4byte gPaletteFade
_0811E2D0: .4byte gUnknown_020239F8
_0811E2D4: .4byte gUnknown_03004330
_0811E2D8: .4byte gUnknown_02024A60
_0811E2DC: .4byte sub_811E258
_0811E2E0:
	movs r0, 0x5A
	bl m4aSongNumStop
	ldr r2, _0811E308
	ldr r0, _0811E30C
	adds r3, r2, r0
	ldrb r1, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldr r0, _0811E310
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, [r2, 0x8]
	bl SetMainCallback2
_0811E302:
	pop {r0}
	bx r0
	.align 2, 0
_0811E308: .4byte gMain
_0811E30C: .4byte 0x0000043d
_0811E310: .4byte gUnknown_030042D0
	thumb_func_end sub_811E29C

	thumb_func_start dp01_tbl3_exec_completed
dp01_tbl3_exec_completed: @ 811E314
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _0811E354
	ldr r4, _0811E358
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811E35C
	str r1, [r0]
	ldr r0, _0811E360
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0811E368
	bl GetMultiplayerId
	mov r1, sp
	strb r0, [r1]
	movs r0, 0x2
	movs r1, 0x4
	mov r2, sp
	bl dp01_prepare_buffer_wireless_probably
	ldr r1, _0811E364
	ldrb r0, [r4]
	lsls r0, 9
	adds r0, r1
	movs r1, 0x38
	strb r1, [r0]
	b _0811E37A
	.align 2, 0
_0811E354: .4byte gUnknown_03004330
_0811E358: .4byte gUnknown_02024A60
_0811E35C: .4byte sub_811DA94
_0811E360: .4byte gUnknown_020239F8
_0811E364: .4byte gUnknown_02023A60
_0811E368:
	ldr r2, _0811E384
	ldr r1, _0811E388
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
_0811E37A:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811E384: .4byte gUnknown_02024A64
_0811E388: .4byte gBitTable
	thumb_func_end dp01_tbl3_exec_completed

	thumb_func_start sub_811E38C
sub_811E38C: @ 811E38C
	push {lr}
	ldr r0, _0811E3B0
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0811E3B4
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0811E3AA
	bl dp01_tbl3_exec_completed
_0811E3AA:
	pop {r0}
	bx r0
	.align 2, 0
_0811E3B0: .4byte gUnknown_02024A60
_0811E3B4: .4byte 0x02017810
	thumb_func_end sub_811E38C

	thumb_func_start sub_811E3B8
sub_811E3B8: @ 811E3B8
	push {lr}
	ldr r0, _0811E3DC
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0811E3E0
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _0811E3D6
	bl dp01_tbl3_exec_completed
_0811E3D6:
	pop {r0}
	bx r0
	.align 2, 0
_0811E3DC: .4byte gUnknown_02024A60
_0811E3E0: .4byte 0x02017810
	thumb_func_end sub_811E3B8

	thumb_func_start dp01t_00_3_getattr
dp01t_00_3_getattr: @ 811E3E4
	push {r4-r6,lr}
	sub sp, 0x100
	movs r6, 0
	ldr r1, _0811E410
	ldr r0, _0811E414
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _0811E41C
	ldr r0, _0811E418
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	mov r1, sp
	bl dp01_getattr_by_ch1_for_player_pokemon
	adds r6, r0, 0
	b _0811E43E
	.align 2, 0
_0811E410: .4byte gUnknown_02023A60
_0811E414: .4byte gUnknown_02024A60
_0811E418: .4byte gUnknown_02024A6A
_0811E41C:
	ldrb r4, [r1]
	movs r5, 0
_0811E420:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _0811E436
	lsls r0, r5, 24
	lsrs r0, 24
	mov r2, sp
	adds r1, r2, r6
	bl dp01_getattr_by_ch1_for_player_pokemon
	adds r6, r0
_0811E436:
	lsrs r4, 1
	adds r5, 0x1
	cmp r5, 0x5
	ble _0811E420
_0811E43E:
	lsls r1, r6, 16
	lsrs r1, 16
	movs r0, 0x1
	mov r2, sp
	bl dp01_build_cmdbuf_x1D_1D_numargs_varargs
	bl dp01_tbl3_exec_completed
	add sp, 0x100
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end dp01t_00_3_getattr

	thumb_func_start dp01_getattr_by_ch1_for_player_pokemon
dp01_getattr_by_ch1_for_player_pokemon: @ 811E458
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x90
	adds r7, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0
	ldr r2, _0811E48C
	ldr r3, _0811E490
	ldrb r0, [r3]
	lsls r0, 9
	adds r1, r2, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x3B
	bls _0811E482
	bl _0811EBEE
_0811E482:
	lsls r0, 2
	ldr r1, _0811E494
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811E48C: .4byte gUnknown_02023A60
_0811E490: .4byte gUnknown_02024A60
_0811E494: .4byte _0811E498
	.align 2, 0
_0811E498:
	.4byte _0811E588
	.4byte _0811E7AC
	.4byte _0811E7BC
	.4byte _0811E7CC
	.4byte _0811E834
	.4byte _0811E834
	.4byte _0811E834
	.4byte _0811E834
	.4byte _0811E850
	.4byte _0811E88C
	.4byte _0811E88C
	.4byte _0811E88C
	.4byte _0811E88C
	.4byte _0811EBEE
	.4byte _0811EBEE
	.4byte _0811EBEE
	.4byte _0811EBEE
	.4byte _0811E8A8
	.4byte _0811E8B8
	.4byte _0811E8E8
	.4byte _0811E8F8
	.4byte _0811E908
	.4byte _0811E918
	.4byte _0811E928
	.4byte _0811E938
	.4byte _0811E948
	.4byte _0811E958
	.4byte _0811E968
	.4byte _0811E978
	.4byte _0811E988
	.4byte _0811E998
	.4byte _0811E9A8
	.4byte _0811E9F8
	.4byte _0811EA08
	.4byte _0811EA18
	.4byte _0811EA28
	.4byte _0811EA38
	.4byte _0811EA48
	.4byte _0811EA58
	.4byte _0811EA68
	.4byte _0811EA78
	.4byte _0811EAAC
	.4byte _0811EABC
	.4byte _0811EACC
	.4byte _0811EADC
	.4byte _0811EAEC
	.4byte _0811EAFC
	.4byte _0811EB0C
	.4byte _0811EB1C
	.4byte _0811EB3C
	.4byte _0811EB4C
	.4byte _0811EB5C
	.4byte _0811EB6C
	.4byte _0811EB7C
	.4byte _0811EB8C
	.4byte _0811EB9C
	.4byte _0811EBAC
	.4byte _0811EBBC
	.4byte _0811EBCC
	.4byte _0811EBDC
_0811E588:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0811E79C
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2E]
	movs r6, 0
	add r0, sp, 0x24
	mov r9, r0
	movs r1, 0x3B
	add r1, sp
	mov r10, r1
	mov r2, sp
	adds r2, 0x2B
	str r2, [sp, 0x80]
	mov r0, sp
	adds r0, 0x2A
	str r0, [sp, 0x7C]
	mov r1, sp
	adds r1, 0x68
	str r1, [sp, 0x8C]
	adds r2, 0x5
	str r2, [sp, 0x84]
	adds r0, 0x12
	str r0, [sp, 0x88]
	mov r8, r4
	add r4, sp, 0xC
_0811E5D4:
	adds r1, r6, 0
	adds r1, 0xD
	mov r0, r8
	bl GetMonData
	strh r0, [r4]
	adds r1, r6, 0
	adds r1, 0x11
	mov r0, r8
	bl GetMonData
	mov r2, r9
	adds r1, r2, r6
	strb r0, [r1]
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _0811E5D4
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0811E79C
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x15
	bl GetMonData
	mov r1, r10
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	ldr r2, [sp, 0x80]
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x19
	bl GetMonData
	str r0, [sp, 0x44]
	adds r0, r4, 0
	movs r1, 0x27
	bl GetMonData
	mov r3, sp
	movs r5, 0x1F
	ands r0, r5
	ldrb r2, [r3, 0x14]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x14]
	adds r0, r4, 0
	movs r1, 0x28
	bl GetMonData
	mov r3, sp
	movs r6, 0x1F
	ands r0, r6
	lsls r0, 5
	ldrh r2, [r3, 0x14]
	ldr r1, _0811E7A0
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, 0x14]
	adds r0, r4, 0
	movs r1, 0x29
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, 2
	ldrb r2, [r3, 0x15]
	movs r1, 0x7D
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x15]
	adds r0, r4, 0
	movs r1, 0x2A
	bl GetMonData
	movs r1, 0x1F
	ands r1, r0
	lsls r1, 15
	ldr r0, [sp, 0x14]
	ldr r2, _0811E7A4
	ands r0, r2
	orrs r0, r1
	str r0, [sp, 0x14]
	adds r0, r4, 0
	movs r1, 0x2B
	bl GetMonData
	mov r3, sp
	ands r0, r6
	lsls r0, 4
	ldrh r2, [r3, 0x16]
	ldr r1, _0811E7A8
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, 0x16]
	adds r0, r4, 0
	movs r1, 0x2C
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, 1
	ldrb r2, [r3, 0x17]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	str r0, [sp, 0x48]
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	str r0, [sp, 0x4C]
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	ldr r1, [sp, 0x7C]
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x28]
	adds r0, r4, 0
	movs r1, 0x3A
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2C]
	adds r0, r4, 0
	movs r1, 0x3B
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2]
	adds r0, r4, 0
	movs r1, 0x3C
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x4]
	adds r0, r4, 0
	movs r1, 0x3D
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x6]
	adds r0, r4, 0
	movs r1, 0x3E
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x8]
	adds r0, r4, 0
	movs r1, 0x3F
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0xA]
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	mov r3, sp
	movs r1, 0x1
	ands r0, r1
	lsls r0, 6
	ldrb r2, [r3, 0x17]
	movs r1, 0x41
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0x2E
	bl GetMonData
	mov r3, sp
	lsls r0, 7
	ldrb r2, [r3, 0x17]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	str r0, [sp, 0x54]
	adds r0, r4, 0
	movs r1, 0x2
	ldr r2, [sp, 0x8C]
	bl GetMonData
	ldr r0, [sp, 0x84]
	ldr r1, [sp, 0x8C]
	bl StringCopy10
	adds r0, r4, 0
	movs r1, 0x7
	ldr r2, [sp, 0x88]
	bl GetMonData
	mov r2, sp
	movs r6, 0
_0811E78C:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, 0x1
	cmp r6, 0x57
	bls _0811E78C
	b _0811EBEE
	.align 2, 0
_0811E79C: .4byte gPlayerParty
_0811E7A0: .4byte 0xfffffc1f
_0811E7A4: .4byte 0xfff07fff
_0811E7A8: .4byte 0xfffffe0f
_0811E7AC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811E7B8
	adds r0, r1
	movs r1, 0xB
	b _0811EB26
	.align 2, 0
_0811E7B8: .4byte gPlayerParty
_0811E7BC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811E7C8
	adds r0, r1
	movs r1, 0xC
	b _0811EB26
	.align 2, 0
_0811E7C8: .4byte gPlayerParty
_0811E7CC:
	movs r6, 0
	add r2, sp, 0x58
	mov r9, r2
	add r0, sp, 0x60
	mov r10, r0
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0811E830
	adds r4, r1, r0
	mov r8, r9
_0811E7E2:
	adds r1, r6, 0
	adds r1, 0xD
	adds r0, r4, 0
	bl GetMonData
	mov r1, r8
	strh r0, [r1]
	adds r1, r6, 0
	adds r1, 0x11
	adds r0, r4, 0
	bl GetMonData
	mov r2, r10
	adds r1, r2, r6
	strb r0, [r1]
	movs r0, 0x2
	add r8, r0
	adds r6, 0x1
	cmp r6, 0x3
	ble _0811E7E2
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811E830
	adds r0, r1
	movs r1, 0x15
	bl GetMonData
	mov r1, r9
	strb r0, [r1, 0xC]
	mov r2, r9
	movs r6, 0
_0811E820:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, 0x1
	cmp r6, 0xF
	bls _0811E820
	b _0811EBEE
	.align 2, 0
_0811E830: .4byte gPlayerParty
_0811E834:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811E84C
	adds r0, r1
	ldrb r1, [r3]
	lsls r1, 9
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r1, 0x9
	b _0811EB26
	.align 2, 0
_0811E84C: .4byte gPlayerParty
_0811E850:
	movs r6, 0
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r2, _0811E888
	mov r8, r2
_0811E85C:
	adds r1, r6, 0
	adds r1, 0x11
	mov r2, r8
	adds r0, r4, r2
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, 0x1
	cmp r6, 0x3
	ble _0811E85C
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811E888
	adds r0, r1
	movs r1, 0x15
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, 0x1
	b _0811EBEE
	.align 2, 0
_0811E888: .4byte gPlayerParty
_0811E88C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811E8A4
	adds r0, r1
	ldrb r1, [r3]
	lsls r1, 9
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r1, 0x8
	b _0811EBE6
	.align 2, 0
_0811E8A4: .4byte gPlayerParty
_0811E8A8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811E8B4
	adds r0, r1
	movs r1, 0x1
	b _0811E8C2
	.align 2, 0
_0811E8B4: .4byte gPlayerParty
_0811E8B8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811E8E4
	adds r0, r1
	movs r1, 0x19
_0811E8C2:
	bl GetMonData
	adds r1, r0, 0
	strb r1, [r7]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r0, 16
	strb r0, [r7, 0x2]
	movs r6, 0x3
	b _0811EBEE
	.align 2, 0
_0811E8E4: .4byte gPlayerParty
_0811E8E8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811E8F4
	adds r0, r1
	movs r1, 0x1A
	b _0811EBE6
	.align 2, 0
_0811E8F4: .4byte gPlayerParty
_0811E8F8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811E904
	adds r0, r1
	movs r1, 0x1B
	b _0811EBE6
	.align 2, 0
_0811E904: .4byte gPlayerParty
_0811E908:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811E914
	adds r0, r1
	movs r1, 0x1C
	b _0811EBE6
	.align 2, 0
_0811E914: .4byte gPlayerParty
_0811E918:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811E924
	adds r0, r1
	movs r1, 0x1D
	b _0811EBE6
	.align 2, 0
_0811E924: .4byte gPlayerParty
_0811E928:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811E934
	adds r0, r1
	movs r1, 0x1E
	b _0811EBE6
	.align 2, 0
_0811E934: .4byte gPlayerParty
_0811E938:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811E944
	adds r0, r1
	movs r1, 0x1F
	b _0811EBE6
	.align 2, 0
_0811E944: .4byte gPlayerParty
_0811E948:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811E954
	adds r0, r1
	movs r1, 0x20
	b _0811EBE6
	.align 2, 0
_0811E954: .4byte gPlayerParty
_0811E958:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811E964
	adds r0, r1
	movs r1, 0x22
	b _0811EBE6
	.align 2, 0
_0811E964: .4byte gPlayerParty
_0811E968:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811E974
	adds r0, r1
	movs r1, 0x23
	b _0811EBE6
	.align 2, 0
_0811E974: .4byte gPlayerParty
_0811E978:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811E984
	adds r0, r1
	movs r1, 0x24
	b _0811EBE6
	.align 2, 0
_0811E984: .4byte gPlayerParty
_0811E988:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811E994
	adds r0, r1
	movs r1, 0x25
	b _0811EBE6
	.align 2, 0
_0811E994: .4byte gPlayerParty
_0811E998:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811E9A4
	adds r0, r1
	movs r1, 0x26
	b _0811EBE6
	.align 2, 0
_0811E9A4: .4byte gPlayerParty
_0811E9A8:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0811E9F4
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x27
	bl GetMonData
	strb r0, [r7]
	adds r0, r4, 0
	movs r1, 0x28
	bl GetMonData
	strb r0, [r7, 0x1]
	adds r0, r4, 0
	movs r1, 0x29
	bl GetMonData
	strb r0, [r7, 0x2]
	adds r0, r4, 0
	movs r1, 0x2A
	bl GetMonData
	strb r0, [r7, 0x3]
	adds r0, r4, 0
	movs r1, 0x2B
	bl GetMonData
	strb r0, [r7, 0x4]
	adds r0, r4, 0
	movs r1, 0x2C
	bl GetMonData
	strb r0, [r7, 0x5]
	movs r6, 0x6
	b _0811EBEE
	.align 2, 0
_0811E9F4: .4byte gPlayerParty
_0811E9F8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EA04
	adds r0, r1
	movs r1, 0x27
	b _0811EBE6
	.align 2, 0
_0811EA04: .4byte gPlayerParty
_0811EA08:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EA14
	adds r0, r1
	movs r1, 0x28
	b _0811EBE6
	.align 2, 0
_0811EA14: .4byte gPlayerParty
_0811EA18:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EA24
	adds r0, r1
	movs r1, 0x29
	b _0811EBE6
	.align 2, 0
_0811EA24: .4byte gPlayerParty
_0811EA28:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EA34
	adds r0, r1
	movs r1, 0x2A
	b _0811EBE6
	.align 2, 0
_0811EA34: .4byte gPlayerParty
_0811EA38:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EA44
	adds r0, r1
	movs r1, 0x2B
	b _0811EBE6
	.align 2, 0
_0811EA44: .4byte gPlayerParty
_0811EA48:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EA54
	adds r0, r1
	movs r1, 0x2C
	b _0811EBE6
	.align 2, 0
_0811EA54: .4byte gPlayerParty
_0811EA58:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EA64
	adds r0, r1
	movs r1, 0
	b _0811EA82
	.align 2, 0
_0811EA64: .4byte gPlayerParty
_0811EA68:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EA74
	adds r0, r1
	movs r1, 0x9
	b _0811EB26
	.align 2, 0
_0811EA74: .4byte gPlayerParty
_0811EA78:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EAA8
	adds r0, r1
	movs r1, 0x37
_0811EA82:
	bl GetMonData
	adds r1, r0, 0
	strb r1, [r7]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r0, 16
	strb r0, [r7, 0x2]
	lsrs r0, r1, 24
	strb r0, [r7, 0x3]
	movs r6, 0x4
	b _0811EBEE
	.align 2, 0
_0811EAA8: .4byte gPlayerParty
_0811EAAC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EAB8
	adds r0, r1
	movs r1, 0x38
	b _0811EBE6
	.align 2, 0
_0811EAB8: .4byte gPlayerParty
_0811EABC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EAC8
	adds r0, r1
	movs r1, 0x39
	b _0811EB26
	.align 2, 0
_0811EAC8: .4byte gPlayerParty
_0811EACC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EAD8
	adds r0, r1
	movs r1, 0x3A
	b _0811EB26
	.align 2, 0
_0811EAD8: .4byte gPlayerParty
_0811EADC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EAE8
	adds r0, r1
	movs r1, 0x3B
	b _0811EB26
	.align 2, 0
_0811EAE8: .4byte gPlayerParty
_0811EAEC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EAF8
	adds r0, r1
	movs r1, 0x3C
	b _0811EB26
	.align 2, 0
_0811EAF8: .4byte gPlayerParty
_0811EAFC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EB08
	adds r0, r1
	movs r1, 0x3D
	b _0811EB26
	.align 2, 0
_0811EB08: .4byte gPlayerParty
_0811EB0C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EB18
	adds r0, r1
	movs r1, 0x3E
	b _0811EB26
	.align 2, 0
_0811EB18: .4byte gPlayerParty
_0811EB1C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EB38
	adds r0, r1
	movs r1, 0x3F
_0811EB26:
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	strb r0, [r7]
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r6, 0x2
	b _0811EBEE
	.align 2, 0
_0811EB38: .4byte gPlayerParty
_0811EB3C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EB48
	adds r0, r1
	movs r1, 0x16
	b _0811EBE6
	.align 2, 0
_0811EB48: .4byte gPlayerParty
_0811EB4C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EB58
	adds r0, r1
	movs r1, 0x17
	b _0811EBE6
	.align 2, 0
_0811EB58: .4byte gPlayerParty
_0811EB5C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EB68
	adds r0, r1
	movs r1, 0x18
	b _0811EBE6
	.align 2, 0
_0811EB68: .4byte gPlayerParty
_0811EB6C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EB78
	adds r0, r1
	movs r1, 0x21
	b _0811EBE6
	.align 2, 0
_0811EB78: .4byte gPlayerParty
_0811EB7C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EB88
	adds r0, r1
	movs r1, 0x2F
	b _0811EBE6
	.align 2, 0
_0811EB88: .4byte gPlayerParty
_0811EB8C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EB98
	adds r0, r1
	movs r1, 0x30
	b _0811EBE6
	.align 2, 0
_0811EB98: .4byte gPlayerParty
_0811EB9C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EBA8
	adds r0, r1
	movs r1, 0x32
	b _0811EBE6
	.align 2, 0
_0811EBA8: .4byte gPlayerParty
_0811EBAC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EBB8
	adds r0, r1
	movs r1, 0x33
	b _0811EBE6
	.align 2, 0
_0811EBB8: .4byte gPlayerParty
_0811EBBC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EBC8
	adds r0, r1
	movs r1, 0x34
	b _0811EBE6
	.align 2, 0
_0811EBC8: .4byte gPlayerParty
_0811EBCC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EBD8
	adds r0, r1
	movs r1, 0x35
	b _0811EBE6
	.align 2, 0
_0811EBD8: .4byte gPlayerParty
_0811EBDC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EC00
	adds r0, r1
	movs r1, 0x36
_0811EBE6:
	bl GetMonData
	strb r0, [r7]
	movs r6, 0x1
_0811EBEE:
	adds r0, r6, 0
	add sp, 0x90
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811EC00: .4byte gPlayerParty
	thumb_func_end dp01_getattr_by_ch1_for_player_pokemon

	thumb_func_start sub_811EC04
sub_811EC04: @ 811EC04
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_811EC04

	thumb_func_start sub_811EC10
sub_811EC10: @ 811EC10
	push {r4,r5,lr}
	ldr r1, _0811EC34
	ldr r0, _0811EC38
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _0811EC40
	ldr r0, _0811EC3C
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	bl sub_811EC68
	b _0811EC5E
	.align 2, 0
_0811EC34: .4byte gUnknown_02023A60
_0811EC38: .4byte gUnknown_02024A60
_0811EC3C: .4byte gUnknown_02024A6A
_0811EC40:
	ldrb r4, [r1]
	movs r5, 0
_0811EC44:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _0811EC52
	adds r0, r5, 0
	bl sub_811EC68
_0811EC52:
	lsrs r4, 1
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _0811EC44
_0811EC5E:
	bl dp01_tbl3_exec_completed
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_811EC10

	thumb_func_start sub_811EC68
sub_811EC68: @ 811EC68
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x34
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0811ECA0
	ldrb r0, [r0]
	lsls r0, 9
	ldr r2, _0811ECA4
	adds r3, r0, r2
	adds r6, r3, 0
	subs r1, r2, 0x2
	adds r0, r1
	ldrb r0, [r0]
	adds r7, r2, 0
	cmp r0, 0x3B
	bls _0811EC94
	bl _0811F62E
_0811EC94:
	lsls r0, 2
	ldr r1, _0811ECA8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811ECA0: .4byte gUnknown_02024A60
_0811ECA4: .4byte gUnknown_02023A63
_0811ECA8: .4byte _0811ECAC
	.align 2, 0
_0811ECAC:
	.4byte _0811ED9C
	.4byte _0811EF34
	.4byte _0811EF54
	.4byte _0811EF74
	.4byte _0811EFCC
	.4byte _0811EFCC
	.4byte _0811EFCC
	.4byte _0811EFCC
	.4byte _0811EFF4
	.4byte _0811F058
	.4byte _0811F058
	.4byte _0811F058
	.4byte _0811F058
	.4byte _0811F62E
	.4byte _0811F62E
	.4byte _0811F62E
	.4byte _0811F62E
	.4byte _0811F088
	.4byte _0811F0A8
	.4byte _0811F0C8
	.4byte _0811F0E8
	.4byte _0811F108
	.4byte _0811F128
	.4byte _0811F148
	.4byte _0811F168
	.4byte _0811F188
	.4byte _0811F1A8
	.4byte _0811F1C8
	.4byte _0811F1E8
	.4byte _0811F208
	.4byte _0811F228
	.4byte _0811F248
	.4byte _0811F2B8
	.4byte _0811F2D8
	.4byte _0811F2F8
	.4byte _0811F318
	.4byte _0811F338
	.4byte _0811F358
	.4byte _0811F378
	.4byte _0811F398
	.4byte _0811F3B8
	.4byte _0811F3D8
	.4byte _0811F3F8
	.4byte _0811F418
	.4byte _0811F438
	.4byte _0811F458
	.4byte _0811F478
	.4byte _0811F498
	.4byte _0811F4B8
	.4byte _0811F4D8
	.4byte _0811F4F8
	.4byte _0811F518
	.4byte _0811F538
	.4byte _0811F558
	.4byte _0811F578
	.4byte _0811F598
	.4byte _0811F5B8
	.4byte _0811F5D8
	.4byte _0811F5F8
	.4byte _0811F618
_0811ED9C:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0811EF30
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	adds r2, r6, 0
	bl SetMonData
	adds r2, r6, 0
	adds r2, 0x2E
	adds r0, r4, 0
	movs r1, 0xC
	bl SetMonData
	movs r0, 0
	mov r8, r0
	movs r0, 0x3B
	adds r0, r6
	mov r10, r0
	adds r0, r6, 0
	adds r0, 0x2B
	str r0, [sp, 0x20]
	adds r0, 0x19
	str r0, [sp, 0x28]
	adds r0, 0x4
	str r0, [sp, 0x2C]
	adds r0, 0x4
	str r0, [sp, 0x30]
	subs r0, 0x22
	str r0, [sp, 0x1C]
	subs r0, 0x2
	str r0, [sp, 0x18]
	adds r0, 0x4
	str r0, [sp, 0x24]
	adds r0, r6, 0x2
	str r0, [sp, 0x4]
	adds r0, r6, 0x4
	str r0, [sp, 0x8]
	adds r0, r6, 0x6
	str r0, [sp, 0xC]
	adds r0, 0x2
	str r0, [sp, 0x10]
	adds r0, 0x2
	str r0, [sp, 0x14]
	mov r9, r4
	adds r7, r6, 0
	adds r7, 0x24
	adds r4, r6, 0
	adds r4, 0xC
_0811EE02:
	mov r1, r8
	adds r1, 0xD
	mov r0, r9
	adds r2, r4, 0
	bl SetMonData
	mov r1, r8
	adds r1, 0x11
	mov r0, r9
	adds r2, r7, 0
	bl SetMonData
	adds r7, 0x1
	adds r4, 0x2
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x3
	ble _0811EE02
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0811EF30
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x15
	mov r2, r10
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x20
	ldr r2, [sp, 0x20]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x19
	ldr r2, [sp, 0x28]
	bl SetMonData
	ldrb r0, [r6, 0x14]
	lsls r0, 27
	lsrs r0, 27
	mov r1, sp
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x27
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r6, 0x14]
	lsls r0, 22
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x28
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r6, 0x15]
	lsls r0, 25
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x29
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldr r0, [r6, 0x14]
	lsls r0, 12
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2A
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r6, 0x16]
	lsls r0, 23
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2B
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r6, 0x17]
	lsls r0, 26
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2C
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0
	ldr r2, [sp, 0x2C]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x37
	ldr r2, [sp, 0x30]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x38
	ldr r2, [sp, 0x1C]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x39
	ldr r2, [sp, 0x18]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3A
	ldr r2, [sp, 0x24]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3B
	ldr r2, [sp, 0x4]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3C
	ldr r2, [sp, 0x8]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3D
	ldr r2, [sp, 0xC]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3E
	ldr r2, [sp, 0x10]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3F
	ldr r2, [sp, 0x14]
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811EF30: .4byte gPlayerParty
_0811EF34:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EF4C
	adds r0, r1
	ldr r1, _0811EF50
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0xB
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811EF4C: .4byte gPlayerParty
_0811EF50: .4byte gUnknown_02024A60
_0811EF54:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EF6C
	adds r0, r1
	ldr r1, _0811EF70
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0xC
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811EF6C: .4byte gPlayerParty
_0811EF70: .4byte gUnknown_02024A60
_0811EF74:
	movs r0, 0
	mov r8, r0
	movs r0, 0xC
	adds r0, r3
	mov r9, r0
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0811EFC8
	adds r7, r1, r0
	adds r6, r3, 0
	adds r6, 0x8
	adds r4, r3, 0
_0811EF8E:
	mov r1, r8
	adds r1, 0xD
	adds r0, r7, 0
	adds r2, r4, 0
	bl SetMonData
	mov r1, r8
	adds r1, 0x11
	adds r0, r7, 0
	adds r2, r6, 0
	bl SetMonData
	adds r6, 0x1
	adds r4, 0x2
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x3
	ble _0811EF8E
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EFC8
	adds r0, r1
	movs r1, 0x15
	mov r2, r9
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811EFC8: .4byte gPlayerParty
_0811EFCC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EFE8
	adds r0, r1
	ldr r3, _0811EFEC
	ldr r1, _0811EFF0
	ldrb r2, [r1]
	lsls r2, 9
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, 0x9
	b _0811F070
	.align 2, 0
_0811EFE8: .4byte gPlayerParty
_0811EFEC: .4byte gUnknown_02023A60
_0811EFF0: .4byte gUnknown_02024A60
_0811EFF4:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0811F050
	adds r4, r0
	ldr r5, _0811F054
	ldrb r2, [r5]
	lsls r2, 9
	adds r2, r7
	adds r0, r4, 0
	movs r1, 0x11
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x1
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x12
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x2
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x13
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x3
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x14
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x4
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x15
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F050: .4byte gPlayerParty
_0811F054: .4byte gUnknown_02024A60
_0811F058:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F07C
	adds r0, r1
	ldr r3, _0811F080
	ldr r1, _0811F084
	ldrb r2, [r1]
	lsls r2, 9
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, 0x8
_0811F070:
	adds r3, 0x3
	adds r2, r3
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F07C: .4byte gPlayerParty
_0811F080: .4byte gUnknown_02023A60
_0811F084: .4byte gUnknown_02024A60
_0811F088:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F0A0
	adds r0, r1
	ldr r1, _0811F0A4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F0A0: .4byte gPlayerParty
_0811F0A4: .4byte gUnknown_02024A60
_0811F0A8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F0C0
	adds r0, r1
	ldr r1, _0811F0C4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x19
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F0C0: .4byte gPlayerParty
_0811F0C4: .4byte gUnknown_02024A60
_0811F0C8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F0E0
	adds r0, r1
	ldr r1, _0811F0E4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1A
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F0E0: .4byte gPlayerParty
_0811F0E4: .4byte gUnknown_02024A60
_0811F0E8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F100
	adds r0, r1
	ldr r1, _0811F104
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1B
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F100: .4byte gPlayerParty
_0811F104: .4byte gUnknown_02024A60
_0811F108:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F120
	adds r0, r1
	ldr r1, _0811F124
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1C
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F120: .4byte gPlayerParty
_0811F124: .4byte gUnknown_02024A60
_0811F128:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F140
	adds r0, r1
	ldr r1, _0811F144
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1D
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F140: .4byte gPlayerParty
_0811F144: .4byte gUnknown_02024A60
_0811F148:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F160
	adds r0, r1
	ldr r1, _0811F164
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1E
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F160: .4byte gPlayerParty
_0811F164: .4byte gUnknown_02024A60
_0811F168:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F180
	adds r0, r1
	ldr r1, _0811F184
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1F
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F180: .4byte gPlayerParty
_0811F184: .4byte gUnknown_02024A60
_0811F188:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F1A0
	adds r0, r1
	ldr r1, _0811F1A4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x20
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F1A0: .4byte gPlayerParty
_0811F1A4: .4byte gUnknown_02024A60
_0811F1A8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F1C0
	adds r0, r1
	ldr r1, _0811F1C4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x22
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F1C0: .4byte gPlayerParty
_0811F1C4: .4byte gUnknown_02024A60
_0811F1C8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F1E0
	adds r0, r1
	ldr r1, _0811F1E4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x23
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F1E0: .4byte gPlayerParty
_0811F1E4: .4byte gUnknown_02024A60
_0811F1E8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F200
	adds r0, r1
	ldr r1, _0811F204
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x24
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F200: .4byte gPlayerParty
_0811F204: .4byte gUnknown_02024A60
_0811F208:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F220
	adds r0, r1
	ldr r1, _0811F224
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x25
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F220: .4byte gPlayerParty
_0811F224: .4byte gUnknown_02024A60
_0811F228:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F240
	adds r0, r1
	ldr r1, _0811F244
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x26
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F240: .4byte gPlayerParty
_0811F244: .4byte gUnknown_02024A60
_0811F248:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0811F2B0
	adds r4, r0
	ldr r5, _0811F2B4
	ldrb r2, [r5]
	lsls r2, 9
	adds r2, r7
	adds r0, r4, 0
	movs r1, 0x27
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x1
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x28
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x2
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x29
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x3
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x2A
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x4
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x2B
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x5
	adds r2, r0
	adds r0, r4, 0
	b _0811F368
	.align 2, 0
_0811F2B0: .4byte gPlayerParty
_0811F2B4: .4byte gUnknown_02024A60
_0811F2B8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F2D0
	adds r0, r1
	ldr r1, _0811F2D4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x27
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F2D0: .4byte gPlayerParty
_0811F2D4: .4byte gUnknown_02024A60
_0811F2D8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F2F0
	adds r0, r1
	ldr r1, _0811F2F4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x28
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F2F0: .4byte gPlayerParty
_0811F2F4: .4byte gUnknown_02024A60
_0811F2F8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F310
	adds r0, r1
	ldr r1, _0811F314
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x29
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F310: .4byte gPlayerParty
_0811F314: .4byte gUnknown_02024A60
_0811F318:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F330
	adds r0, r1
	ldr r1, _0811F334
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2A
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F330: .4byte gPlayerParty
_0811F334: .4byte gUnknown_02024A60
_0811F338:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F350
	adds r0, r1
	ldr r1, _0811F354
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2B
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F350: .4byte gPlayerParty
_0811F354: .4byte gUnknown_02024A60
_0811F358:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F370
	adds r0, r1
	ldr r1, _0811F374
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
_0811F368:
	movs r1, 0x2C
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F370: .4byte gPlayerParty
_0811F374: .4byte gUnknown_02024A60
_0811F378:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F390
	adds r0, r1
	ldr r1, _0811F394
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F390: .4byte gPlayerParty
_0811F394: .4byte gUnknown_02024A60
_0811F398:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F3B0
	adds r0, r1
	ldr r1, _0811F3B4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x9
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F3B0: .4byte gPlayerParty
_0811F3B4: .4byte gUnknown_02024A60
_0811F3B8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F3D0
	adds r0, r1
	ldr r1, _0811F3D4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x37
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F3D0: .4byte gPlayerParty
_0811F3D4: .4byte gUnknown_02024A60
_0811F3D8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F3F0
	adds r0, r1
	ldr r1, _0811F3F4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x38
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F3F0: .4byte gPlayerParty
_0811F3F4: .4byte gUnknown_02024A60
_0811F3F8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F410
	adds r0, r1
	ldr r1, _0811F414
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x39
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F410: .4byte gPlayerParty
_0811F414: .4byte gUnknown_02024A60
_0811F418:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F430
	adds r0, r1
	ldr r1, _0811F434
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3A
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F430: .4byte gPlayerParty
_0811F434: .4byte gUnknown_02024A60
_0811F438:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F450
	adds r0, r1
	ldr r1, _0811F454
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3B
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F450: .4byte gPlayerParty
_0811F454: .4byte gUnknown_02024A60
_0811F458:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F470
	adds r0, r1
	ldr r1, _0811F474
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3C
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F470: .4byte gPlayerParty
_0811F474: .4byte gUnknown_02024A60
_0811F478:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F490
	adds r0, r1
	ldr r1, _0811F494
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3D
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F490: .4byte gPlayerParty
_0811F494: .4byte gUnknown_02024A60
_0811F498:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F4B0
	adds r0, r1
	ldr r1, _0811F4B4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3E
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F4B0: .4byte gPlayerParty
_0811F4B4: .4byte gUnknown_02024A60
_0811F4B8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F4D0
	adds r0, r1
	ldr r1, _0811F4D4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3F
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F4D0: .4byte gPlayerParty
_0811F4D4: .4byte gUnknown_02024A60
_0811F4D8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F4F0
	adds r0, r1
	ldr r1, _0811F4F4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x16
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F4F0: .4byte gPlayerParty
_0811F4F4: .4byte gUnknown_02024A60
_0811F4F8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F510
	adds r0, r1
	ldr r1, _0811F514
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x17
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F510: .4byte gPlayerParty
_0811F514: .4byte gUnknown_02024A60
_0811F518:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F530
	adds r0, r1
	ldr r1, _0811F534
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x18
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F530: .4byte gPlayerParty
_0811F534: .4byte gUnknown_02024A60
_0811F538:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F550
	adds r0, r1
	ldr r1, _0811F554
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x21
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F550: .4byte gPlayerParty
_0811F554: .4byte gUnknown_02024A60
_0811F558:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F570
	adds r0, r1
	ldr r1, _0811F574
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2F
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F570: .4byte gPlayerParty
_0811F574: .4byte gUnknown_02024A60
_0811F578:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F590
	adds r0, r1
	ldr r1, _0811F594
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x30
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F590: .4byte gPlayerParty
_0811F594: .4byte gUnknown_02024A60
_0811F598:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F5B0
	adds r0, r1
	ldr r1, _0811F5B4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x32
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F5B0: .4byte gPlayerParty
_0811F5B4: .4byte gUnknown_02024A60
_0811F5B8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F5D0
	adds r0, r1
	ldr r1, _0811F5D4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x33
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F5D0: .4byte gPlayerParty
_0811F5D4: .4byte gUnknown_02024A60
_0811F5D8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F5F0
	adds r0, r1
	ldr r1, _0811F5F4
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x34
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F5F0: .4byte gPlayerParty
_0811F5F4: .4byte gUnknown_02024A60
_0811F5F8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F610
	adds r0, r1
	ldr r1, _0811F614
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x35
	bl SetMonData
	b _0811F62E
	.align 2, 0
_0811F610: .4byte gPlayerParty
_0811F614: .4byte gUnknown_02024A60
_0811F618:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F658
	adds r0, r1
	ldr r1, _0811F65C
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x36
	bl SetMonData
_0811F62E:
	ldr r2, _0811F660
	ldr r0, _0811F65C
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _0811F658
	adds r0, r2
	bl sub_80324F8
	add sp, 0x34
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811F658: .4byte gPlayerParty
_0811F65C: .4byte gUnknown_02024A60
_0811F660: .4byte gUnknown_02024A6A
	thumb_func_end sub_811EC68

	thumb_func_start sub_811F664
sub_811F664: @ 811F664
	push {r4-r7,lr}
	ldr r1, _0811F6C8
	ldr r7, _0811F6CC
	ldrb r2, [r7]
	lsls r0, r2, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	adds r3, r1, 0
	muls r3, r0
	ldr r4, _0811F6D0
	lsls r2, 9
	adds r0, r4, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	ldr r1, _0811F6D4
	adds r0, r1
	adds r5, r3, r0
	movs r3, 0
	adds r0, r4, 0x2
	adds r2, r0
	ldrb r2, [r2]
	cmp r3, r2
	bcs _0811F6BC
	adds r6, r4, 0
	adds r2, r7, 0
	adds r4, r0, 0
_0811F69A:
	adds r1, r5, r3
	ldrb r0, [r2]
	lsls r0, 9
	adds r0, 0x3
	adds r0, r3, r0
	adds r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	ldrb r0, [r2]
	lsls r0, 9
	adds r0, r4
	ldrb r0, [r0]
	cmp r3, r0
	bcc _0811F69A
_0811F6BC:
	bl dp01_tbl3_exec_completed
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811F6C8: .4byte gUnknown_02024A6A
_0811F6CC: .4byte gUnknown_02024A60
_0811F6D0: .4byte gUnknown_02023A60
_0811F6D4: .4byte gPlayerParty
	thumb_func_end sub_811F664

	thumb_func_start sub_811F6D8
sub_811F6D8: @ 811F6D8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r0, _0811F7CC
	mov r8, r0
	ldr r6, _0811F7D0
	ldrb r1, [r6]
	lsls r0, r1, 1
	add r0, r8
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _0811F7D4
	adds r0, r4
	bl sub_80318FC
	ldrb r0, [r6]
	lsls r0, 1
	add r0, r8
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r4
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r6]
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _0811F7D8
	mov r8, r0
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8077ABC
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldrb r0, [r6]
	bl sub_8077F68
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r6]
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r8
	adds r1, r5, 0
	adds r2, r4, 0
	bl CreateSprite
	ldr r4, _0811F7DC
	ldrb r1, [r6]
	adds r1, r4
	strb r0, [r1]
	ldr r5, _0811F7E0
	ldrb r0, [r6]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0811F7E4
	strh r1, [r0, 0x24]
	ldrb r2, [r6]
	adds r0, r2, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x2E]
	ldrb r3, [r6]
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r2, [r6]
	adds r4, r2, r4
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0811F7E8
	adds r2, r1
	ldrb r1, [r2]
	bl StartSpriteAnim
	ldr r1, _0811F7EC
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811F7F0
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811F7CC: .4byte gUnknown_02024A6A
_0811F7D0: .4byte gUnknown_02024A60
_0811F7D4: .4byte gPlayerParty
_0811F7D8: .4byte gUnknown_02024E8C
_0811F7DC: .4byte gUnknown_02024BE0
_0811F7E0: .4byte gSprites
_0811F7E4: .4byte 0x0000ff10
_0811F7E8: .4byte gUnknown_02024E84
_0811F7EC: .4byte gUnknown_03004330
_0811F7F0: .4byte sub_811DDE8
	thumb_func_end sub_811F6D8

	thumb_func_start sub_811F7F4
sub_811F7F4: @ 811F7F4
	push {r4-r6,lr}
	ldr r5, _0811F84C
	ldrb r0, [r5]
	ldr r4, _0811F850
	lsls r1, r0, 9
	adds r6, r4, 0x2
	adds r1, r6
	ldrb r1, [r1]
	bl sub_8032AA8
	ldr r2, _0811F854
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r2
	lsls r0, 9
	adds r4, 0x1
	adds r0, r4
	ldrb r0, [r0]
	strh r0, [r1]
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _0811F858
	adds r0, r2
	bl sub_80318FC
	ldrb r0, [r5]
	lsls r1, r0, 9
	adds r1, r6
	ldrb r1, [r1]
	bl sub_811F864
	ldr r1, _0811F85C
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811F860
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811F84C: .4byte gUnknown_02024A60
_0811F850: .4byte gUnknown_02023A60
_0811F854: .4byte gUnknown_02024A6A
_0811F858: .4byte gPlayerParty
_0811F85C: .4byte gUnknown_03004330
_0811F860: .4byte sub_811E1BC
	thumb_func_end sub_811F7F4

	thumb_func_start sub_811F864
sub_811F864: @ 811F864
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl sub_8032AA8
	ldr r0, _0811F9A8
	lsls r2, r6, 1
	adds r2, r0
	ldr r0, _0811F9AC
	lsls r1, r6, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	strh r0, [r2]
	ldrh r1, [r2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0811F9B0
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	mov r8, r0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _0811F9B4
	bl object_new_hidden_with_callback
	ldr r1, _0811F9B8
	mov r9, r1
	add r9, r6
	mov r1, r9
	strb r0, [r1]
	adds r0, r6, 0
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _0811F9BC
	mov r10, r0
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_8077ABC
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	bl sub_8077F68
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r10
	adds r1, r5, 0
	adds r2, r4, 0
	bl CreateSprite
	ldr r4, _0811F9C0
	adds r4, r6, r4
	strb r0, [r4]
	ldr r5, _0811F9C4
	mov r0, r9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r4]
	strh r1, [r0, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r6, [r0, 0x2E]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x32]
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, r6, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0811F9C8
	adds r6, r1
	ldrb r1, [r6]
	bl StartSpriteAnim
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0811F9CC
	str r1, [r0]
	movs r0, 0
	movs r1, 0xFF
	bl sub_8046400
	mov r1, r9
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x2E]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811F9A8: .4byte gUnknown_02024A6A
_0811F9AC: .4byte gUnknown_02023A60
_0811F9B0: .4byte gPlayerParty
_0811F9B4: .4byte sub_80312F0
_0811F9B8: .4byte gUnknown_0300434C
_0811F9BC: .4byte gUnknown_02024E8C
_0811F9C0: .4byte gUnknown_02024BE0
_0811F9C4: .4byte gSprites
_0811F9C8: .4byte gUnknown_02024E84
_0811F9CC: .4byte SpriteCallbackDummy
	thumb_func_end sub_811F864

	thumb_func_start sub_811F9D0
sub_811F9D0: @ 811F9D0
	push {r4-r6,lr}
	ldr r1, _0811FA00
	ldr r6, _0811FA04
	ldrb r2, [r6]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r3, [r0]
	cmp r3, 0
	bne _0811FA14
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r1, _0811FA08
	adds r0, r1
	strb r3, [r0, 0x4]
	ldr r1, _0811FA0C
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811FA10
	str r1, [r0]
	b _0811FA4A
	.align 2, 0
_0811FA00: .4byte gUnknown_02023A60
_0811FA04: .4byte gUnknown_02024A60
_0811FA08: .4byte 0x02017810
_0811FA0C: .4byte gUnknown_03004330
_0811FA10: .4byte sub_811FA5C
_0811FA14:
	ldr r5, _0811FA50
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0811FA54
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r1, _0811FA58
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8043DB0
	bl dp01_tbl3_exec_completed
_0811FA4A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811FA50: .4byte gUnknown_02024BE0
_0811FA54: .4byte gSprites
_0811FA58: .4byte gUnknown_03004340
	thumb_func_end sub_811F9D0

	thumb_func_start sub_811FA5C
sub_811FA5C: @ 811FA5C
	push {r4,r5,lr}
	ldr r5, _0811FA78
	ldrb r2, [r5]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r4, _0811FA7C
	adds r3, r0, r4
	ldrb r0, [r3, 0x4]
	cmp r0, 0
	beq _0811FA80
	cmp r0, 0x1
	beq _0811FAAC
	b _0811FAD4
	.align 2, 0
_0811FA78: .4byte gUnknown_02024A60
_0811FA7C: .4byte 0x02017810
_0811FA80:
	lsls r0, r2, 2
	adds r1, r4, 0
	subs r1, 0x10
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0811FA9C
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl move_anim_start_t4
_0811FA9C:
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	movs r0, 0x1
	strb r0, [r1, 0x4]
	b _0811FAD4
_0811FAAC:
	ldrb r1, [r3]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0811FAD4
	strb r0, [r3, 0x4]
	ldrb r2, [r5]
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x1
	bl move_anim_start_t4
	ldr r1, _0811FADC
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811FAE0
	str r1, [r0]
_0811FAD4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811FADC: .4byte gUnknown_03004330
_0811FAE0: .4byte sub_811DF34
	thumb_func_end sub_811FA5C

	thumb_func_start sub_811FAE4
sub_811FAE4: @ 811FAE4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r0, _0811FB14
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0811FB24
	ldr r6, _0811FB18
	ldrb r0, [r6]
	bl battle_get_per_side_status
	movs r1, 0x2
	ands r1, r0
	ldr r5, _0811FB1C
	cmp r1, 0
	beq _0811FB0A
	movs r5, 0x10
_0811FB0A:
	ldr r4, _0811FB20
	ldrb r0, [r6]
	bl sub_803FC34
	b _0811FB34
	.align 2, 0
_0811FB14: .4byte gUnknown_020239F8
_0811FB18: .4byte gUnknown_02024A60
_0811FB1C: .4byte 0x0000fff0
_0811FB20: .4byte gLinkPlayers
_0811FB24:
	movs r5, 0
	ldr r4, _0811FC08
	bl GetMultiplayerId
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
_0811FB34:
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r4, [r1, 0x13]
	ldr r6, _0811FC0C
	ldrb r1, [r6]
	adds r0, r4, 0
	bl sub_8031AF4
	ldrb r0, [r6]
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl GetMonSpriteTemplate_803C5A0
	ldr r0, _0811FC10
	mov r8, r0
	lsls r5, 16
	movs r0, 0xA0
	lsls r0, 15
	adds r5, r0
	asrs r5, 16
	ldr r0, _0811FC14
	lsls r4, 2
	adds r4, r0
	ldrb r0, [r4]
	movs r4, 0x8
	subs r4, r0
	lsls r4, 18
	movs r0, 0xA0
	lsls r0, 15
	adds r4, r0
	asrs r4, 16
	ldrb r0, [r6]
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r8
	adds r1, r5, 0
	adds r2, r4, 0
	bl CreateSprite
	ldr r5, _0811FC18
	ldrb r1, [r6]
	adds r1, r5
	strb r0, [r1]
	ldr r4, _0811FC1C
	ldrb r3, [r6]
	adds r0, r3, r5
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xF0
	strh r1, [r0, 0x24]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _0811FC20
	strh r1, [r0, 0x2E]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _0811FC24
	str r1, [r0]
	ldr r1, _0811FC28
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811FC2C
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811FC08: .4byte gLinkPlayers
_0811FC0C: .4byte gUnknown_02024A60
_0811FC10: .4byte gUnknown_02024E8C
_0811FC14: .4byte gTrainerBackPicCoords
_0811FC18: .4byte gUnknown_02024BE0
_0811FC1C: .4byte gSprites
_0811FC20: .4byte 0x0000fffe
_0811FC24: .4byte sub_80313A0
_0811FC28: .4byte gUnknown_03004330
_0811FC2C: .4byte sub_811DAE4
	thumb_func_end sub_811FAE4

	thumb_func_start sub_811FC30
sub_811FC30: @ 811FC30
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_811FC30

	thumb_func_start sub_811FC3C
sub_811FC3C: @ 811FC3C
	push {r4-r6,lr}
	ldr r6, _0811FCC8
	ldr r4, _0811FCCC
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _0811FCD0
	adds r0, r5
	bl oamt_add_pos2_onto_pos1
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x23
	strh r1, [r0, 0x2E]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0811FCD4
	strh r1, [r0, 0x32]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0x36]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0811FCD8
	str r1, [r0]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0811FCDC
	bl oamt_set_x3A_32
	ldr r1, _0811FCE0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811FCE4
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811FCC8: .4byte gUnknown_02024BE0
_0811FCCC: .4byte gUnknown_02024A60
_0811FCD0: .4byte gSprites
_0811FCD4: .4byte 0x0000ffd8
_0811FCD8: .4byte sub_8078B34
_0811FCDC: .4byte SpriteCallbackDummy
_0811FCE0: .4byte gUnknown_03004330
_0811FCE4: .4byte sub_811DB1C
	thumb_func_end sub_811FC3C

	thumb_func_start sub_811FCE8
sub_811FCE8: @ 811FCE8
	push {r4,r5,lr}
	ldr r5, _0811FD2C
	ldrb r2, [r5]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r4, _0811FD30
	adds r3, r0, r4
	ldrb r0, [r3, 0x4]
	cmp r0, 0
	bne _0811FD34
	lsls r0, r2, 2
	adds r1, r4, 0
	subs r1, 0x10
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0811FD1A
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl move_anim_start_t4
_0811FD1A:
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r0, [r1, 0x4]
	adds r0, 0x1
	strb r0, [r1, 0x4]
	b _0811FDAA
	.align 2, 0
_0811FD2C: .4byte gUnknown_02024A60
_0811FD30: .4byte 0x02017810
_0811FD34:
	ldrb r1, [r3]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0811FDAA
	strb r4, [r3, 0x4]
	ldr r2, _0811FDB0
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _0811FDB4
	adds r0, r2
	bl sub_80324F8
	movs r1, 0x40
	negs r1, r1
	movs r0, 0x10
	bl PlaySE12WithPanning
	ldr r2, _0811FDB8
	ldr r3, _0811FDBC
	ldrb r0, [r5]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r4, [r0, 0x30]
	ldrb r0, [r5]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x5
	strh r1, [r0, 0x32]
	ldrb r0, [r5]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _0811FDC0
	str r1, [r0]
	ldr r1, _0811FDC4
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811FDC8
	str r1, [r0]
_0811FDAA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811FDB0: .4byte gUnknown_02024A6A
_0811FDB4: .4byte gPlayerParty
_0811FDB8: .4byte gSprites
_0811FDBC: .4byte gUnknown_02024BE0
_0811FDC0: .4byte sub_80105EC
_0811FDC4: .4byte gUnknown_03004330
_0811FDC8: .4byte sub_811DE98
	thumb_func_end sub_811FCE8

	thumb_func_start sub_811FDCC
sub_811FDCC: @ 811FDCC
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_811FDCC

	thumb_func_start sub_811FDD8
sub_811FDD8: @ 811FDD8
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_811FDD8

	thumb_func_start sub_811FDE4
sub_811FDE4: @ 811FDE4
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_811FDE4

	thumb_func_start sub_811FDF0
sub_811FDF0: @ 811FDF0
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_811FDF0

	thumb_func_start sub_811FDFC
sub_811FDFC: @ 811FDFC
	push {r4-r6,lr}
	ldr r6, _0811FEE0
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	beq _0811FE0E
	b _0811FF1E
_0811FE0E:
	ldr r0, _0811FEE4
	mov r12, r0
	ldrb r2, [r6]
	lsls r2, 9
	adds r0, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	mov r1, r12
	adds r1, 0x2
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	ldr r5, _0811FEE8
	mov r1, r12
	adds r1, 0x3
	adds r2, r1
	ldrb r1, [r2]
	strb r1, [r5]
	ldr r4, _0811FEEC
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x4
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0x5
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r3, r1
	strh r3, [r4]
	ldr r4, _0811FEF0
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x6
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0x7
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 8
	orrs r3, r1
	mov r1, r12
	adds r1, 0x8
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 16
	orrs r3, r1
	mov r1, r12
	adds r1, 0x9
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 24
	orrs r3, r1
	str r3, [r4]
	ldr r3, _0811FEF4
	ldrb r1, [r6]
	lsls r1, 9
	mov r2, r12
	adds r2, 0xA
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r3]
	ldr r4, _0811FEF8
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0xC
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0xD
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r3, r1
	strh r3, [r4]
	ldr r3, _0811FEFC
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x10
	adds r2, r1
	str r2, [r3]
	ldr r3, _0811FF00
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r3
	ldr r2, [r2]
	str r2, [r1]
	ldrb r1, [r5]
	bl sub_8031720
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _0811FF04
	bl dp01_tbl3_exec_completed
	b _0811FF1E
	.align 2, 0
_0811FEE0: .4byte gUnknown_02024A60
_0811FEE4: .4byte gUnknown_02023A60
_0811FEE8: .4byte gUnknown_0202F7C4
_0811FEEC: .4byte gUnknown_0202F7BC
_0811FEF0: .4byte gUnknown_0202F7B8
_0811FEF4: .4byte gUnknown_0202F7BE
_0811FEF8: .4byte gUnknown_0202F7C0
_0811FEFC: .4byte gUnknown_0202F7B4
_0811FF00: .4byte gUnknown_02024E70
_0811FF04:
	ldrb r1, [r6]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0811FF24
	adds r0, r1
	strb r2, [r0, 0x4]
	ldr r1, _0811FF28
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811FF2C
	str r1, [r0]
_0811FF1E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811FF24: .4byte 0x02017810
_0811FF28: .4byte gUnknown_03004330
_0811FF2C: .4byte sub_811FF30
	thumb_func_end sub_811FDFC

	thumb_func_start sub_811FF30
sub_811FF30: @ 811FF30
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r2, _0811FF74
	ldr r5, _0811FF78
	ldrb r3, [r5]
	lsls r1, r3, 9
	adds r0, r2, 0x1
	mov r9, r0
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r6, r2, 0x2
	mov r8, r6
	adds r0, r1, r6
	ldrb r0, [r0]
	lsls r0, 8
	orrs r4, r0
	adds r2, 0xB
	adds r1, r2
	ldrb r7, [r1]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r6, _0811FF7C
	adds r0, r6
	ldrb r2, [r0, 0x4]
	cmp r2, 0x1
	beq _0811FFBE
	cmp r2, 0x1
	bgt _0811FF80
	cmp r2, 0
	beq _0811FF8A
	b _08120088
	.align 2, 0
_0811FF74: .4byte gUnknown_02023A60
_0811FF78: .4byte gUnknown_02024A60
_0811FF7C: .4byte 0x02017810
_0811FF80:
	cmp r2, 0x2
	beq _0811FFE4
	cmp r2, 0x3
	beq _08120050
	b _08120088
_0811FF8A:
	lsls r1, r3, 2
	adds r0, r6, 0
	subs r0, 0x10
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0xC
	ands r0, r2
	cmp r0, 0x4
	bne _0811FFAE
	movs r0, 0x8
	orrs r0, r2
	strb r0, [r1]
	ldrb r2, [r5]
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl move_anim_start_t4
_0811FFAE:
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	movs r0, 0x1
	strb r0, [r1, 0x4]
	b _08120088
_0811FFBE:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08120088
	movs r0, 0
	bl sub_80326EC
	adds r0, r4, 0
	bl move_anim_start_t1
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	movs r0, 0x2
	strb r0, [r1, 0x4]
	b _08120088
_0811FFE4:
	ldr r0, _08120040
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _08120044
	ldrb r0, [r0]
	cmp r0, 0
	bne _08120088
	movs r0, 0x1
	bl sub_80326EC
	ldrb r2, [r5]
	lsls r0, r2, 2
	adds r4, r6, 0
	subs r4, 0x10
	adds r0, r4
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0812002C
	cmp r7, 0x1
	bhi _0812002C
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x6
	bl move_anim_start_t4
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r4
	ldrb r2, [r0]
	movs r1, 0x9
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_0812002C:
	ldr r0, _08120048
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0812004C
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0, 0x4]
	b _08120088
	.align 2, 0
_08120040: .4byte gUnknown_0202F7AC
_08120044: .4byte gUnknown_0202F7B1
_08120048: .4byte gUnknown_02024A60
_0812004C: .4byte 0x02017810
_08120050:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08120088
	bl sub_8031F24
	ldrb r0, [r5]
	lsls r2, r0, 9
	mov r3, r9
	adds r1, r2, r3
	ldrb r1, [r1]
	add r2, r8
	ldrb r2, [r2]
	lsls r2, 8
	orrs r1, r2
	bl sub_80324BC
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strb r4, [r0, 0x4]
	bl dp01_tbl3_exec_completed
_08120088:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_811FF30

	thumb_func_start sub_8120094
sub_8120094: @ 8120094
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _081200D8
	movs r1, 0
	strh r1, [r0]
	ldr r0, _081200DC
	strh r1, [r0]
	ldr r4, _081200E0
	ldrb r0, [r4]
	lsls r0, 9
	ldr r1, _081200E4
	adds r0, r1
	ldrh r0, [r0]
	bl sub_8120AA8
	ldr r0, _081200E8
	ldr r1, _081200EC
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _081200F0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081200F4
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081200D8: .4byte gUnknown_030042A4
_081200DC: .4byte gUnknown_030042A0
_081200E0: .4byte gUnknown_02024A60
_081200E4: .4byte gUnknown_02023A62
_081200E8: .4byte gUnknown_03004210
_081200EC: .4byte gUnknown_020238CC
_081200F0: .4byte gUnknown_03004330
_081200F4: .4byte sub_811DFA0
	thumb_func_end sub_8120094

	thumb_func_start sub_81200F8
sub_81200F8: @ 81200F8
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_81200F8

	thumb_func_start sub_8120104
sub_8120104: @ 8120104
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120104

	thumb_func_start sub_8120110
sub_8120110: @ 8120110
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120110

	thumb_func_start sub_812011C
sub_812011C: @ 812011C
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812011C

	thumb_func_start sub_8120128
sub_8120128: @ 8120128
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120128

	thumb_func_start sub_8120134
sub_8120134: @ 8120134
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120134

	thumb_func_start sub_8120140
sub_8120140: @ 8120140
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120140

	thumb_func_start sub_812014C
sub_812014C: @ 812014C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	movs r0, 0
	bl load_gfxc_health_bar
	ldr r3, _081201C4
	ldr r0, _081201C8
	mov r9, r0
	ldrb r4, [r0]
	lsls r2, r4, 9
	adds r0, r3, 0x2
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r3, 0x3
	adds r2, r3
	ldrb r0, [r2]
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	asrs r7, r1, 16
	ldr r0, _081201CC
	cmp r7, r0
	beq _081201DC
	ldr r6, _081201D0
	lsls r0, r4, 1
	adds r0, r6
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _081201D4
	adds r0, r4
	movs r1, 0x3A
	bl GetMonData
	mov r8, r0
	mov r1, r9
	ldrb r0, [r1]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r4
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r1, _081201D8
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	mov r2, r8
	bl sub_8043D84
	b _08120206
	.align 2, 0
_081201C4: .4byte gUnknown_02023A60
_081201C8: .4byte gUnknown_02024A60
_081201CC: .4byte 0x00007fff
_081201D0: .4byte gUnknown_02024A6A
_081201D4: .4byte gPlayerParty
_081201D8: .4byte gUnknown_03004340
_081201DC:
	ldr r1, _08120224
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08120228
	adds r0, r1
	movs r1, 0x3A
	bl GetMonData
	adds r2, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r1, _0812022C
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	movs r3, 0
	bl sub_8043D84
_08120206:
	ldr r1, _08120230
	ldr r0, _08120234
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08120238
	str r1, [r0]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08120224: .4byte gUnknown_02024A6A
_08120228: .4byte gPlayerParty
_0812022C: .4byte gUnknown_03004340
_08120230: .4byte gUnknown_03004330
_08120234: .4byte gUnknown_02024A60
_08120238: .4byte bx_t3_healthbar_update
	thumb_func_end sub_812014C

	thumb_func_start sub_812023C
sub_812023C: @ 812023C
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812023C

	thumb_func_start sub_8120248
sub_8120248: @ 8120248
	push {r4,lr}
	ldr r4, _081202A0
	ldrb r0, [r4]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _08120298
	ldr r0, _081202A4
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _081202A8
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _081202AC
	adds r1, r2
	movs r2, 0x9
	bl sub_8045A5C
	ldrb r0, [r4]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r0, _081202B0
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r1, _081202B4
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081202B8
	str r1, [r0]
_08120298:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081202A0: .4byte gUnknown_02024A60
_081202A4: .4byte gUnknown_03004340
_081202A8: .4byte gUnknown_02024A6A
_081202AC: .4byte gPlayerParty
_081202B0: .4byte 0x02017810
_081202B4: .4byte gUnknown_03004330
_081202B8: .4byte sub_811E38C
	thumb_func_end sub_8120248

	thumb_func_start sub_81202BC
sub_81202BC: @ 81202BC
	push {r4,r5,lr}
	ldr r5, _08120314
	ldrb r0, [r5]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _0812030C
	ldr r4, _08120318
	ldrb r3, [r5]
	lsls r3, 9
	adds r0, r4, 0x1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, 0x2
	adds r1, r3, r1
	ldrb r1, [r1]
	adds r2, r4, 0x3
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, 8
	orrs r1, r2
	adds r2, r4, 0x4
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, 16
	orrs r1, r2
	adds r4, 0x5
	adds r3, r4
	ldrb r2, [r3]
	lsls r2, 24
	orrs r1, r2
	bl move_anim_start_t2_for_situation
	ldr r1, _0812031C
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08120320
	str r1, [r0]
_0812030C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08120314: .4byte gUnknown_02024A60
_08120318: .4byte gUnknown_02023A60
_0812031C: .4byte gUnknown_03004330
_08120320: .4byte sub_811E38C
	thumb_func_end sub_81202BC

	thumb_func_start sub_8120324
sub_8120324: @ 8120324
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120324

	thumb_func_start sub_8120330
sub_8120330: @ 8120330
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120330

	thumb_func_start sub_812033C
sub_812033C: @ 812033C
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812033C

	thumb_func_start sub_8120348
sub_8120348: @ 8120348
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120348

	thumb_func_start sub_8120354
sub_8120354: @ 8120354
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120354

	thumb_func_start sub_8120360
sub_8120360: @ 8120360
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120360

	thumb_func_start sub_812036C
sub_812036C: @ 812036C
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812036C

	thumb_func_start sub_8120378
sub_8120378: @ 8120378
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120378

	thumb_func_start sub_8120384
sub_8120384: @ 8120384
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120384

	thumb_func_start sub_8120390
sub_8120390: @ 8120390
	push {lr}
	ldr r2, _081203A8
	ldrb r1, [r2]
	movs r0, 0x80
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_081203A8: .4byte gUnknown_020238C8
	thumb_func_end sub_8120390

	thumb_func_start sub_81203AC
sub_81203AC: @ 81203AC
	push {lr}
	ldr r3, _081203D8
	ldr r1, _081203DC
	ldr r0, _081203E0
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x7F
	ands r1, r0
	ldrb r2, [r3]
	movs r0, 0x80
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_081203D8: .4byte gUnknown_020238C8
_081203DC: .4byte gUnknown_02023A60
_081203E0: .4byte gUnknown_02024A60
	thumb_func_end sub_81203AC

	thumb_func_start sub_81203E4
sub_81203E4: @ 81203E4
	push {lr}
	ldr r2, _081203F8
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_081203F8: .4byte gUnknown_020238C8
	thumb_func_end sub_81203E4

	thumb_func_start sub_81203FC
sub_81203FC: @ 81203FC
	push {lr}
	ldr r3, _08120420
	ldr r1, [r3]
	lsls r1, 24
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	lsls r1, 7
	ldrb r2, [r3]
	movs r0, 0x7F
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08120420: .4byte gUnknown_020238C8
	thumb_func_end sub_81203FC

	thumb_func_start dp01t_29_3_blink
dp01t_29_3_blink: @ 8120424
	push {r4,lr}
	ldr r3, _0812044C
	ldr r2, _08120450
	ldr r4, _08120454
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _08120458
	bl dp01_tbl3_exec_completed
	b _08120482
	.align 2, 0
_0812044C: .4byte gSprites
_08120450: .4byte gUnknown_02024BE0
_08120454: .4byte gUnknown_02024A60
_08120458:
	ldr r1, _08120488
	movs r0, 0x1
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x30]
	ldrb r0, [r4]
	bl sub_8047858
	ldr r1, _0812048C
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08120490
	str r1, [r0]
_08120482:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08120488: .4byte gUnknown_02024E6D
_0812048C: .4byte gUnknown_03004330
_08120490: .4byte bx_blink_t3
	thumb_func_end dp01t_29_3_blink

	thumb_func_start sub_8120494
sub_8120494: @ 8120494
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120494

	thumb_func_start sub_81204A0
sub_81204A0: @ 81204A0
	push {r4,lr}
	ldr r4, _081204DC
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	movs r3, 0x3F
	cmp r0, 0
	bne _081204B4
	movs r3, 0xC0
_081204B4:
	ldr r2, _081204E0
	ldrb r1, [r4]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	lsls r1, r3, 24
	asrs r1, 24
	bl PlaySE12WithPanning
	bl dp01_tbl3_exec_completed
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081204DC: .4byte gUnknown_02024A60
_081204E0: .4byte gUnknown_02023A60
	thumb_func_end sub_81204A0

	thumb_func_start sub_81204E4
sub_81204E4: @ 81204E4
	push {lr}
	ldr r2, _0812050C
	ldr r0, _08120510
	ldrb r1, [r0]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	bl PlayFanfare
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_0812050C: .4byte gUnknown_02023A60
_08120510: .4byte gUnknown_02024A60
	thumb_func_end sub_81204E4

	thumb_func_start sub_8120514
sub_8120514: @ 8120514
	push {lr}
	ldr r1, _08120548
	ldr r0, _0812054C
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08120550
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x19
	negs r1, r1
	movs r2, 0x5
	bl PlayCry3
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08120548: .4byte gUnknown_02024A6A
_0812054C: .4byte gUnknown_02024A60
_08120550: .4byte gPlayerParty
	thumb_func_end sub_8120514

	thumb_func_start dp01t_2E_3_battle_intro
dp01t_2E_3_battle_intro: @ 8120554
	push {lr}
	ldr r1, _0812057C
	ldr r0, _08120580
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80E43C0
	ldr r2, _08120584
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_0812057C: .4byte gUnknown_02023A60
_08120580: .4byte gUnknown_02024A60
_08120584: .4byte gUnknown_02024DE8
	thumb_func_end dp01t_2E_3_battle_intro

	thumb_func_start sub_8120588
sub_8120588: @ 8120588
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r6, _081206DC
	ldr r7, _081206E0
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _081206E4
	adds r0, r5
	bl oamt_add_pos2_onto_pos1
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x32
	strh r1, [r0, 0x2E]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _081206E8
	strh r1, [r0, 0x32]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0x36]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _081206EC
	str r1, [r0]
	ldrb r2, [r7]
	adds r0, r2, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x38]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _081206F0
	bl oamt_set_x3A_32
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, _081206F4
	bl AllocSpritePalette
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _081206F8
	mov r8, r0
	ldrb r0, [r7]
	bl sub_803FC34
	ldr r2, _081206FC
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x13]
	lsls r0, 3
	add r0, r8
	ldr r0, [r0]
	lsls r4, 4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r4, r2
	movs r2, 0x20
	bl LoadCompressedPalette
	ldrb r0, [r7]
	adds r0, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r4
	strb r0, [r1, 0x5]
	ldr r0, _08120700
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08120704
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	ldrb r0, [r7]
	strh r0, [r1, 0x8]
	ldrb r3, [r7]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r2, _08120708
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081206BA
	ldr r0, _0812070C
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	ldr r1, _08120710
	str r1, [r0]
_081206BA:
	adds r2, 0x30
	ldrb r0, [r2, 0x9]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _08120714
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08120718
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081206DC: .4byte gUnknown_02024BE0
_081206E0: .4byte gUnknown_02024A60
_081206E4: .4byte gSprites
_081206E8: .4byte 0x0000ffd8
_081206EC: .4byte sub_8078B34
_081206F0: .4byte sub_8030E38
_081206F4: .4byte 0x0000d6f9
_081206F8: .4byte gTrainerBackPicPaletteTable
_081206FC: .4byte gLinkPlayers
_08120700: .4byte sub_812071C
_08120704: .4byte gTasks
_08120708: .4byte 0x02017810
_0812070C: .4byte gUnknown_02024E68
_08120710: .4byte sub_8044CA0
_08120714: .4byte gUnknown_03004330
_08120718: .4byte nullsub_74
	thumb_func_end sub_8120588

	thumb_func_start sub_812071C
sub_812071C: @ 812071C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _08120744
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0xA]
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	cmp r0, 0x17
	bgt _08120748
	adds r0, r2, 0x1
	strh r0, [r1, 0xA]
	b _08120804
	.align 2, 0
_08120744: .4byte gTasks
_08120748:
	ldr r7, _08120788
	ldrb r0, [r7]
	mov r9, r0
	ldrh r0, [r1, 0x8]
	strb r0, [r7]
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _08120768
	ldr r0, _0812078C
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08120798
_08120768:
	ldr r0, _08120790
	ldrb r1, [r7]
	lsls r2, r1, 9
	adds r0, 0x1
	adds r2, r0
	ldr r0, _08120794
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	strb r0, [r2]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_811F864
	b _081207EC
	.align 2, 0
_08120788: .4byte gUnknown_02024A60
_0812078C: .4byte gUnknown_020239F8
_08120790: .4byte gUnknown_02023A60
_08120794: .4byte gUnknown_02024A6A
_08120798:
	ldr r4, _08120810
	ldrb r0, [r7]
	lsls r1, r0, 9
	adds r4, 0x1
	adds r1, r4
	ldr r5, _08120814
	lsls r0, 1
	adds r0, r5
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_811F864
	ldrb r0, [r7]
	movs r6, 0x2
	eors r0, r6
	strb r0, [r7]
	ldrb r0, [r7]
	lsls r1, r0, 9
	adds r1, r4
	lsls r0, 1
	adds r0, r5
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r0, r1, 1
	adds r0, r5
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _08120818
	adds r0, r2
	bl sub_80318FC
	ldrb r0, [r7]
	movs r1, 0
	bl sub_811F864
	ldrb r0, [r7]
	eors r0, r6
	strb r0, [r7]
_081207EC:
	ldr r1, _0812081C
	ldr r2, _08120820
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08120824
	str r1, [r0]
	mov r3, r9
	strb r3, [r2]
	mov r0, r8
	bl DestroyTask
_08120804:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08120810: .4byte gUnknown_02023A60
_08120814: .4byte gUnknown_02024A6A
_08120818: .4byte gPlayerParty
_0812081C: .4byte gUnknown_03004330
_08120820: .4byte gUnknown_02024A60
_08120824: .4byte sub_811DCA0
	thumb_func_end sub_812071C

	thumb_func_start dp01t_30_3_80EB11C
dp01t_30_3_80EB11C: @ 8120828
	push {r4-r6,lr}
	ldr r1, _08120850
	ldr r0, _08120854
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08120858
	adds r0, r2, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08120858
	bl dp01_tbl3_exec_completed
	b _081208C0
	.align 2, 0
_08120850: .4byte gUnknown_02023A60
_08120854: .4byte gUnknown_02024A60
_08120858:
	ldr r5, _081208C8
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r6, _081208CC
	adds r0, r6
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	ldrb r0, [r5]
	lsls r3, r0, 9
	ldr r4, _081208D0
	adds r1, r3, r4
	subs r2, r4, 0x3
	adds r2, r3, r2
	ldrb r2, [r2]
	subs r4, 0x2
	adds r3, r4
	ldrb r3, [r3]
	bl sub_8044804
	ldr r2, _081208D4
	ldrb r1, [r5]
	adds r1, r2
	movs r2, 0
	strb r0, [r1]
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strb r2, [r0, 0x5]
	ldrb r1, [r5]
	lsls r0, r1, 9
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _081208B4
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x5D
	strb r1, [r0, 0x5]
_081208B4:
	ldr r0, _081208D8
	ldrb r1, [r5]
	lsls r1, 2
	adds r1, r0
	ldr r0, _081208DC
	str r0, [r1]
_081208C0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081208C8: .4byte gUnknown_02024A60
_081208CC: .4byte 0x02017810
_081208D0: .4byte gUnknown_02023A64
_081208D4: .4byte gUnknown_02024E68
_081208D8: .4byte gUnknown_03004330
_081208DC: .4byte sub_81208E0
	thumb_func_end dp01t_30_3_80EB11C

	thumb_func_start sub_81208E0
sub_81208E0: @ 81208E0
	push {r4,lr}
	ldr r4, _08120918
	ldrb r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r3, _0812091C
	adds r0, r3
	ldrb r1, [r0, 0x5]
	adds r2, r1, 0x1
	strb r2, [r0, 0x5]
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x5C
	bls _08120910
	ldrb r0, [r4]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	movs r0, 0
	strb r0, [r1, 0x5]
	bl dp01_tbl3_exec_completed
_08120910:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08120918: .4byte gUnknown_02024A60
_0812091C: .4byte 0x02017810
	thumb_func_end sub_81208E0

	thumb_func_start sub_8120920
sub_8120920: @ 8120920
	push {lr}
	ldr r0, _08120958
	ldrb r3, [r0]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r1, _0812095C
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0812094E
	ldr r2, _08120960
	ldr r0, _08120964
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _08120968
	str r1, [r0]
_0812094E:
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08120958: .4byte gUnknown_02024A60
_0812095C: .4byte 0x02017810
_08120960: .4byte gTasks
_08120964: .4byte gUnknown_02024E68
_08120968: .4byte sub_8044CA0
	thumb_func_end sub_8120920

	thumb_func_start sub_812096C
sub_812096C: @ 812096C
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812096C

	thumb_func_start sub_8120978
sub_8120978: @ 8120978
	push {r4,lr}
	ldr r4, _081209C8
	ldrb r0, [r4]
	bl sub_8078874
	lsls r0, 24
	cmp r0, 0
	beq _081209BE
	ldr r3, _081209CC
	ldr r0, _081209D0
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldr r0, _081209D4
	lsls r1, 9
	adds r0, 0x1
	adds r1, r0
	adds r2, 0x3E
	movs r0, 0x1
	ldrb r1, [r1]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4]
	bl sub_8031F88
_081209BE:
	bl dp01_tbl3_exec_completed
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081209C8: .4byte gUnknown_02024A60
_081209CC: .4byte gSprites
_081209D0: .4byte gUnknown_02024BE0
_081209D4: .4byte gUnknown_02023A60
	thumb_func_end sub_8120978

	thumb_func_start sub_81209D8
sub_81209D8: @ 81209D8
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r6, _08120A1C
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _08120A30
	ldr r5, _08120A20
	ldrb r2, [r6]
	lsls r1, r2, 9
	adds r0, r5, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r0, r5, 0x2
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r5, 0x3
	adds r1, r5
	ldrb r0, [r1]
	lsls r0, 8
	orrs r4, r0
	str r4, [sp]
	adds r0, r2, 0
	adds r1, r2, 0
	bl move_anim_start_t3
	lsls r0, 24
	cmp r0, 0
	beq _08120A24
	bl dp01_tbl3_exec_completed
	b _08120A30
	.align 2, 0
_08120A1C: .4byte gUnknown_02024A60
_08120A20: .4byte gUnknown_02023A60
_08120A24:
	ldr r0, _08120A38
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08120A3C
	str r0, [r1]
_08120A30:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08120A38: .4byte gUnknown_03004330
_08120A3C: .4byte sub_811E3B8
	thumb_func_end sub_81209D8

	thumb_func_start sub_8120A40
sub_8120A40: @ 8120A40
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120A40

	thumb_func_start sub_8120A4C
sub_8120A4C: @ 8120A4C
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120A4C

	thumb_func_start sub_8120A58
sub_8120A58: @ 8120A58
	push {r4,lr}
	ldr r2, _08120A90
	ldr r1, _08120A94
	ldr r4, _08120A98
	ldrb r0, [r4]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, 0x5
	bl FadeOutMapMusic
	movs r0, 0x3
	bl BeginFastPaletteFade
	bl dp01_tbl3_exec_completed
	ldr r1, _08120A9C
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08120AA0
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08120A90: .4byte gUnknown_02024D26
_08120A94: .4byte gUnknown_02023A60
_08120A98: .4byte gUnknown_02024A60
_08120A9C: .4byte gUnknown_03004330
_08120AA0: .4byte sub_811E29C
	thumb_func_end sub_8120A58

	thumb_func_start nullsub_75
nullsub_75: @ 8120AA4
	bx lr
	thumb_func_end nullsub_75

	thumb_func_start sub_8120AA8
sub_8120AA8: @ 8120AA8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r7, r0, 16
	movs r6, 0
	ldr r5, _08120B70
	ldr r4, _08120B74
	ldrb r1, [r4]
	lsls r1, 9
	ldr r0, _08120B78
	adds r1, r0
	str r1, [r5]
	ldr r2, _08120B7C
	ldrh r0, [r1, 0x4]
	strh r0, [r2]
	ldr r2, _08120B80
	ldrb r0, [r1, 0x6]
	strb r0, [r2]
	ldr r3, _08120B84
	ldrb r0, [r1, 0x7]
	mov r8, r0
	ldr r2, _08120B88
	adds r0, r3, r2
	mov r2, r8
	strb r2, [r0]
	ldrb r0, [r1, 0x8]
	mov r8, r0
	ldr r2, _08120B8C
	adds r0, r3, r2
	mov r2, r8
	strb r2, [r0]
	ldrb r0, [r1, 0x9]
	mov r8, r0
	ldr r2, _08120B90
	adds r0, r3, r2
	mov r2, r8
	strb r2, [r0]
	ldr r2, _08120B94
	ldrb r0, [r1, 0xA]
	strb r0, [r2]
	ldrb r1, [r1, 0xB]
	ldr r2, _08120B98
	adds r0, r3, r2
	strb r1, [r0]
	movs r2, 0
	mov r9, r3
	ldr r3, _08120B9C
	mov r10, r3
	ldr r3, _08120BA0
_08120B10:
	adds r0, r2, r3
	ldr r1, [r5]
	adds r1, 0xC
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x3
	ble _08120B10
	movs r2, 0
	ldr r0, _08120B9C
	mov r8, r0
	ldr r3, _08120B70
	ldr r1, _08120BA4
	mov r12, r1
	ldr r5, _08120BA8
_08120B30:
	mov r0, r8
	adds r1, r2, r0
	ldr r0, [r3]
	adds r0, 0x10
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	mov r0, r12
	adds r1, r2, r0
	ldr r0, [r3]
	adds r0, 0x20
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r2, r5
	ldr r0, [r3]
	adds r0, 0x30
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, 0x1
	cmp r2, 0xF
	ble _08120B30
	cmp r7, 0x5
	bls _08120B64
	b _08120F50
_08120B64:
	lsls r0, r7, 2
	ldr r1, _08120BAC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08120B70: .4byte gUnknown_02039270
_08120B74: .4byte gUnknown_02024A60
_08120B78: .4byte gUnknown_02023A64
_08120B7C: .4byte gUnknown_02024C04
_08120B80: .4byte byte_2024C06
_08120B84: .4byte 0x02000000
_08120B88: .4byte 0x00016003
_08120B8C: .4byte 0x0001605e
_08120B90: .4byte 0x000160c1
_08120B94: .4byte gUnknown_02024C0B
_08120B98: .4byte 0x000160a0
_08120B9C: .4byte gUnknown_030041C0
_08120BA0: .4byte gUnknown_0203926C
_08120BA4: .4byte gUnknown_03004290
_08120BA8: .4byte gUnknown_030042B0
_08120BAC: .4byte _08120BB0
	.align 2, 0
_08120BB0:
	.4byte _08120BC8
	.4byte _08120C40
	.4byte _08120CCC
	.4byte _08120D5C
	.4byte _08120DE8
	.4byte _08120E50
_08120BC8:
	ldr r0, _08120BEC
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08120C00
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08120BF8
	movs r0, 0x40
	ands r0, r1
	ldr r6, _08120BF0
	cmp r0, 0
	bne _08120BE8
	b _08120F70
_08120BE8:
	ldr r6, _08120BF4
	b _08120F70
	.align 2, 0
_08120BEC: .4byte gUnknown_020239F8
_08120BF0: .4byte gUnknown_084005C7
_08120BF4: .4byte gUnknown_084005DB
_08120BF8:
	ldr r6, _08120BFC
	b _08120F70
	.align 2, 0
_08120BFC: .4byte gUnknown_084005AA
_08120C00:
	movs r0, 0x80
	lsls r0, 6
	ands r0, r1
	cmp r0, 0
	beq _08120C14
	ldr r6, _08120C10
	b _08120F70
	.align 2, 0
_08120C10: .4byte gUnknown_08400568
_08120C14:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08120C24
	ldr r6, _08120C20
	b _08120F70
	.align 2, 0
_08120C20: .4byte gUnknown_08400590
_08120C24:
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	ldr r6, _08120C38
	cmp r0, 0
	bne _08120C32
	b _08120F70
_08120C32:
	ldr r6, _08120C3C
	b _08120F70
	.align 2, 0
_08120C38: .4byte gUnknown_08400555
_08120C3C: .4byte gUnknown_0840057B
_08120C40:
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08120C7C
	ldr r0, _08120C68
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08120C74
	movs r0, 0x40
	ands r0, r1
	ldr r6, _08120C6C
	cmp r0, 0
	bne _08120C64
	b _08120F70
_08120C64:
	ldr r6, _08120C70
	b _08120F70
	.align 2, 0
_08120C68: .4byte gUnknown_020239F8
_08120C6C: .4byte gUnknown_084006A4
_08120C70: .4byte gUnknown_084006F1
_08120C74:
	ldr r6, _08120C78
	b _08120F70
	.align 2, 0
_08120C78: .4byte gUnknown_0840069C
_08120C7C:
	ldr r0, _08120C94
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08120CB4
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08120C9C
	ldr r6, _08120C98
	b _08120F70
	.align 2, 0
_08120C94: .4byte gUnknown_020239F8
_08120C98: .4byte gUnknown_0840065C
_08120C9C:
	movs r0, 0x2
	ands r0, r1
	ldr r6, _08120CAC
	cmp r0, 0
	bne _08120CA8
	b _08120F70
_08120CA8:
	ldr r6, _08120CB0
	b _08120F70
	.align 2, 0
_08120CAC: .4byte gUnknown_08400608
_08120CB0: .4byte gUnknown_08400645
_08120CB4:
	movs r0, 0x2
	ands r0, r1
	ldr r6, _08120CC4
	cmp r0, 0
	bne _08120CC0
	b _08120F70
_08120CC0:
	ldr r6, _08120CC8
	b _08120F70
	.align 2, 0
_08120CC4: .4byte gUnknown_084005F5
_08120CC8: .4byte gUnknown_08400635
_08120CCC:
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08120D24
	ldr r0, _08120CE8
	ldr r1, _08120CEC
	adds r0, r1
	ldrb r2, [r0]
	cmp r2, 0
	bne _08120CF4
	ldr r6, _08120CF0
	b _08120F70
	.align 2, 0
_08120CE8: .4byte 0x02000000
_08120CEC: .4byte 0x000160c1
_08120CF0: .4byte gUnknown_08400709
_08120CF4:
	cmp r2, 0x1
	beq _08120D04
	ldr r0, _08120D08
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08120D10
_08120D04:
	ldr r6, _08120D0C
	b _08120F70
	.align 2, 0
_08120D08: .4byte gUnknown_020239F8
_08120D0C: .4byte gUnknown_08400727
_08120D10:
	ldr r6, _08120D1C
	cmp r2, 0x2
	beq _08120D18
	b _08120F70
_08120D18:
	ldr r6, _08120D20
	b _08120F70
	.align 2, 0
_08120D1C: .4byte gUnknown_08400749
_08120D20: .4byte gUnknown_08400736
_08120D24:
	ldr r0, _08120D44
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 4
	cmp r1, r0
	bne _08120D54
	ldr r0, _08120D48
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	ldr r6, _08120D4C
	cmp r0, 0
	bne _08120D40
	b _08120F70
_08120D40:
	ldr r6, _08120D50
	b _08120F70
	.align 2, 0
_08120D44: .4byte gTrainerBattleOpponent
_08120D48: .4byte gUnknown_020239F8
_08120D4C: .4byte gUnknown_08400771
_08120D50: .4byte gUnknown_08400781
_08120D54:
	ldr r6, _08120D58
	b _08120F70
	.align 2, 0
_08120D58: .4byte gUnknown_0840075E
_08120D5C:
	ldr r0, _08120D88
	add r0, r9
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08120DB8
	ldr r0, _08120D8C
	add r0, r9
	ldrb r3, [r0]
	cmp r3, 0
	beq _08120D82
	ldr r0, _08120D90
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08120D98
_08120D82:
	ldr r6, _08120D94
	b _08120F70
	.align 2, 0
_08120D88: .4byte 0x00016003
_08120D8C: .4byte 0x000160c1
_08120D90: .4byte gUnknown_020239F8
_08120D94: .4byte gUnknown_084006B3
_08120D98:
	cmp r3, 0x1
	bne _08120DA4
	ldr r6, _08120DA0
	b _08120F70
	.align 2, 0
_08120DA0: .4byte gUnknown_084006BB
_08120DA4:
	ldr r6, _08120DB0
	cmp r3, 0x2
	beq _08120DAC
	b _08120F70
_08120DAC:
	ldr r6, _08120DB4
	b _08120F70
	.align 2, 0
_08120DB0: .4byte gUnknown_084006D5
_08120DB4: .4byte gUnknown_084006C6
_08120DB8:
	ldr r0, _08120DD4
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08120DE0
	movs r0, 0x40
	ands r0, r1
	ldr r6, _08120DD8
	cmp r0, 0
	bne _08120DD0
	b _08120F70
_08120DD0:
	ldr r6, _08120DDC
	b _08120F70
	.align 2, 0
_08120DD4: .4byte gUnknown_020239F8
_08120DD8: .4byte gUnknown_0840067C
_08120DDC: .4byte gUnknown_0840068C
_08120DE0:
	ldr r6, _08120DE4
	b _08120F70
	.align 2, 0
_08120DE4: .4byte gUnknown_08400622
_08120DE8:
	mov r0, r10
	bl sub_8121D1C
	ldr r0, _08120E14
	ldr r2, [r0]
	ldrh r1, [r2]
	movs r0, 0xB1
	lsls r0, 1
	cmp r1, r0
	bls _08120E28
	ldr r0, _08120E18
	ldr r2, _08120E1C
	ldr r1, _08120E20
	ldr r3, _08120E24
	adds r1, r3
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	b _08120E38
	.align 2, 0
_08120E14: .4byte gUnknown_02039270
_08120E18: .4byte gUnknown_03004290
_08120E1C: .4byte gUnknown_08401674
_08120E20: .4byte 0x02000000
_08120E24: .4byte 0x000160a0
_08120E28:
	ldr r0, _08120E44
	ldrh r2, [r2]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _08120E48
	adds r1, r2
	bl StringCopy
_08120E38:
	ldr r0, _08120E44
	bl sub_8121D74
	ldr r6, _08120E4C
	b _08120F70
	.align 2, 0
_08120E44: .4byte gUnknown_03004290
_08120E48: .4byte gMoveNames
_08120E4C: .4byte gUnknown_084007BD
_08120E50:
	ldr r5, _08120E90
	ldrb r1, [r5]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08120EB8
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r5]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08120E7C
	ldrb r1, [r5]
	cmp r1, 0x3
	beq _08120E7C
	movs r0, 0x3
	eors r0, r1
	strb r0, [r5]
_08120E7C:
	ldr r0, _08120E90
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08120E98
	ldr r6, _08120E94
	b _08120F70
	.align 2, 0
_08120E90: .4byte gUnknown_030041C0
_08120E94: .4byte gUnknown_083FFEFC
_08120E98:
	ldr r0, _08120EAC
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	ldr r6, _08120EB0
	cmp r0, 0
	beq _08120F70
	ldr r6, _08120EB4
	b _08120F70
	.align 2, 0
_08120EAC: .4byte gUnknown_020239F8
_08120EB0: .4byte gUnknown_083FFFEA
_08120EB4: .4byte gUnknown_083FFFF7
_08120EB8:
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08120ED2
	ldrb r1, [r5]
	cmp r1, 0x3
	beq _08120ED2
	movs r0, 0x3
	eors r0, r1
	strb r0, [r5]
_08120ED2:
	ldr r0, _08120EF0
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08120F18
	ldr r0, _08120EF4
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _08120F08
	cmp r0, 0x2
	bgt _08120EF8
	cmp r0, 0x1
	beq _08120EFE
	b _08120F70
	.align 2, 0
_08120EF0: .4byte gUnknown_020239F8
_08120EF4: .4byte gUnknown_030041C0
_08120EF8:
	cmp r0, 0x3
	beq _08120F10
	b _08120F70
_08120EFE:
	ldr r6, _08120F04
	b _08120F70
	.align 2, 0
_08120F04: .4byte gUnknown_083FFF6A
_08120F08:
	ldr r6, _08120F0C
	b _08120F70
	.align 2, 0
_08120F0C: .4byte gUnknown_083FFF99
_08120F10:
	ldr r6, _08120F14
	b _08120F70
	.align 2, 0
_08120F14: .4byte gUnknown_083FFFCB
_08120F18:
	ldr r0, _08120F2C
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _08120F40
	cmp r0, 0x2
	bgt _08120F30
	cmp r0, 0x1
	beq _08120F36
	b _08120F70
	.align 2, 0
_08120F2C: .4byte gUnknown_030041C0
_08120F30:
	cmp r0, 0x3
	beq _08120F48
	b _08120F70
_08120F36:
	ldr r6, _08120F3C
	b _08120F70
	.align 2, 0
_08120F3C: .4byte gUnknown_083FFF56
_08120F40:
	ldr r6, _08120F44
	b _08120F70
	.align 2, 0
_08120F44: .4byte gUnknown_083FFF81
_08120F48:
	ldr r6, _08120F4C
	b _08120F70
	.align 2, 0
_08120F4C: .4byte gUnknown_083FFFB3
_08120F50:
	movs r0, 0xB5
	lsls r0, 1
	cmp r7, r0
	bls _08120F64
	ldr r1, _08120F60
	movs r0, 0xFF
	strb r0, [r1]
	b _08120F76
	.align 2, 0
_08120F60: .4byte gUnknown_020238CC
_08120F64:
	ldr r1, _08120F84
	adds r0, r7, 0
	subs r0, 0xC
	lsls r0, 2
	adds r0, r1
	ldr r6, [r0]
_08120F70:
	adds r0, r6, 0
	bl get_battle_strings_
_08120F76:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08120F84: .4byte gUnknown_08400F8C
	thumb_func_end sub_8120AA8

	thumb_func_start get_battle_strings_
get_battle_strings_: @ 8120F88
	push {lr}
	ldr r1, _08120F94
	bl sub_8120FFC
	pop {r1}
	bx r1
	.align 2, 0
_08120F94: .4byte gUnknown_020238CC
	thumb_func_end get_battle_strings_

	thumb_func_start sub_8120F98
sub_8120F98: @ 8120F98
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _08120FB0
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	mov r2, sp
	movs r3, 0
	b _08120FC0
	.align 2, 0
_08120FB0: .4byte gUnknown_084017A8
_08120FB4:
	strb r1, [r2]
	adds r4, 0x1
	adds r2, 0x1
	adds r3, 0x1
	cmp r3, 0x7
	bhi _08120FC8
_08120FC0:
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _08120FB4
_08120FC8:
	ldr r5, [sp]
	ldr r4, [sp, 0x4]
	movs r3, 0
	ldr r2, _08120FE4
_08120FD0:
	ldr r1, [r2]
	ldr r0, [r1]
	cmp r5, r0
	bne _08120FE8
	ldr r0, [r1, 0x4]
	cmp r4, r0
	bne _08120FE8
	ldr r0, [r2, 0x4]
	b _08120FF2
	.align 2, 0
_08120FE4: .4byte gUnknown_081FA6D4
_08120FE8:
	adds r2, 0x8
	adds r3, 0x1
	cmp r3, 0x6
	bls _08120FD0
	movs r0, 0
_08120FF2:
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8120F98

	thumb_func_start sub_8120FFC
sub_8120FFC: @ 8120FFC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	mov r9, r0
	mov r8, r1
	movs r6, 0
	movs r4, 0
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r7, r0, 24
	mov r0, r9
	ldrb r1, [r0]
	bl _08121A40
_0812101E:
	cmp r1, 0xFD
	beq _08121026
	bl _08121A30
_08121026:
	movs r1, 0x1
	add r9, r1
	mov r2, r9
	ldrb r0, [r2]
	cmp r0, 0x2A
	bls _08121036
	bl _081219E6
_08121036:
	lsls r0, 2
	ldr r1, _08121040
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08121040: .4byte _08121044
	.align 2, 0
_08121044:
	.4byte _081210F0
	.4byte _0812111E
	.4byte _0812115A
	.4byte _08121180
	.4byte _081211A4
	.4byte _081211C8
	.4byte _081211EC
	.4byte _08121218
	.4byte _08121248
	.4byte _08121278
	.4byte _081212A8
	.4byte _0812133C
	.4byte _081213A8
	.4byte _0812141C
	.4byte _08121490
	.4byte _08121504
	.4byte _08121578
	.4byte _081215F8
	.4byte _08121620
	.4byte _08121660
	.4byte _081216EC
	.4byte _081216F4
	.4byte _08121704
	.4byte _08121714
	.4byte _0812172C
	.4byte _0812174C
	.4byte _081217C0
	.4byte _08121830
	.4byte _08121840
	.4byte _08121854
	.4byte _08121868
	.4byte _0812188C
	.4byte _081218B0
	.4byte _081218B8
	.4byte _081218C0
	.4byte _0812195C
	.4byte _081219A4
	.4byte _081219AC
	.4byte _0812197C
	.4byte _08121984
	.4byte _081219CC
	.4byte _081219D4
	.4byte _08121134
_081210F0:
	ldr r5, _08121100
	ldrb r0, [r5]
	cmp r0, 0xFD
	bne _08121108
	ldr r4, _08121104
	adds r0, r5, 0
	b _08121140
	.align 2, 0
_08121100: .4byte gUnknown_030041C0
_08121104: .4byte gStringVar1
_08121108:
	adds r0, r5, 0
	bl sub_8120F98
	adds r4, r0, 0
	cmp r4, 0
	beq _08121118
	bl _081219E6
_08121118:
	adds r4, r5, 0
	bl _081219E6
_0812111E:
	ldr r1, _0812112C
	ldrb r0, [r1]
	cmp r0, 0xFD
	bne _08121154
	ldr r4, _08121130
	b _0812113E
	.align 2, 0
_0812112C: .4byte gUnknown_03004290
_08121130: .4byte gStringVar2
_08121134:
	ldr r1, _0812114C
	ldrb r0, [r1]
	cmp r0, 0xFD
	bne _08121154
	ldr r4, _08121150
_0812113E:
	adds r0, r1, 0
_08121140:
	adds r1, r4, 0
	bl sub_8121A68
	bl _081219E6
	.align 2, 0
_0812114C: .4byte gUnknown_030042B0
_08121150: .4byte gStringVar3
_08121154:
	adds r4, r1, 0
	bl _081219E6
_0812115A:
	movs r0, 0
	bl battle_get_side_with_given_state
	ldr r1, _08121178
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0812117C
	adds r0, r1
	bl _0812190E
	.align 2, 0
_08121178: .4byte gUnknown_02024A6A
_0812117C: .4byte gPlayerParty
_08121180:
	movs r0, 0x1
	bl battle_get_side_with_given_state
	ldr r1, _0812119C
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081211A0
	adds r0, r1
	b _0812190E
	.align 2, 0
_0812119C: .4byte gUnknown_02024A6A
_081211A0: .4byte gEnemyParty
_081211A4:
	movs r0, 0x2
	bl battle_get_side_with_given_state
	ldr r1, _081211C0
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081211C4
	adds r0, r1
	b _0812190E
	.align 2, 0
_081211C0: .4byte gUnknown_02024A6A
_081211C4: .4byte gPlayerParty
_081211C8:
	movs r0, 0x3
	bl battle_get_side_with_given_state
	ldr r1, _081211E4
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081211E8
	adds r0, r1
	b _0812190E
	.align 2, 0
_081211E4: .4byte gUnknown_02024A6A
_081211E8: .4byte gEnemyParty
_081211EC:
	ldr r2, _0812120C
	ldr r1, _08121210
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x18]
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121214
	adds r0, r1
	b _0812190E
	.align 2, 0
_0812120C: .4byte gUnknown_02024A6A
_08121210: .4byte gLinkPlayers
_08121214: .4byte gPlayerParty
_08121218:
	ldr r2, _0812123C
	ldr r1, _08121240
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x18]
	movs r0, 0x1
	eors r0, r1
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121244
	adds r0, r1
	b _0812190E
	.align 2, 0
_0812123C: .4byte gUnknown_02024A6A
_08121240: .4byte gLinkPlayers
_08121244: .4byte gEnemyParty
_08121248:
	ldr r2, _0812126C
	ldr r1, _08121270
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x18]
	movs r0, 0x2
	eors r0, r1
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121274
	adds r0, r1
	b _0812190E
	.align 2, 0
_0812126C: .4byte gUnknown_02024A6A
_08121270: .4byte gLinkPlayers
_08121274: .4byte gPlayerParty
_08121278:
	ldr r2, _0812129C
	ldr r1, _081212A0
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x18]
	movs r0, 0x3
	eors r0, r1
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081212A4
	adds r0, r1
	b _0812190E
	.align 2, 0
_0812129C: .4byte gUnknown_02024A6A
_081212A0: .4byte gLinkPlayers
_081212A4: .4byte gEnemyParty
_081212A8:
	ldr r4, _081212CC
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	adds r2, r4, 0
	cmp r0, 0
	beq _0812131C
	ldr r0, _081212D0
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	ldr r4, _081212D4
	cmp r0, 0
	beq _081212E6
	ldr r4, _081212D8
	b _081212E6
	.align 2, 0
_081212CC: .4byte gUnknown_02024C07
_081212D0: .4byte gUnknown_020239F8
_081212D4: .4byte gUnknown_08400791
_081212D8: .4byte gUnknown_08400797
_081212DC:
	mov r3, r8
	adds r0, r3, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
_081212E6:
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _081212DC
	ldrb r0, [r2]
	bl battle_get_per_side_status
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	bl battle_get_side_with_given_state
	ldr r1, _08121314
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121318
	adds r0, r1
	b _0812190E
	.align 2, 0
_08121314: .4byte gUnknown_02024A6A
_08121318: .4byte gEnemyParty
_0812131C:
	ldrb r0, [r2]
	bl battle_get_per_side_status
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	bl battle_get_side_with_given_state
	ldr r1, _08121338
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r1, [r0]
	b _0812193A
	.align 2, 0
_08121338: .4byte gUnknown_02024A6A
_0812133C:
	ldr r4, _08121370
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0812137C
	ldrb r0, [r4]
	bl battle_get_per_side_status
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	bl battle_get_side_with_given_state
	ldr r1, _08121374
	lsls r0, 24
	lsrs r0, 23
	adds r0, 0x4
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121378
	adds r0, r1
	b _0812190E
	.align 2, 0
_08121370: .4byte gUnknown_02024C07
_08121374: .4byte gUnknown_02024A6A
_08121378: .4byte gPlayerParty
_0812137C:
	ldrb r0, [r4]
	bl battle_get_per_side_status
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	bl battle_get_side_with_given_state
	ldr r1, _081213A0
	lsls r0, 24
	lsrs r0, 23
	adds r0, 0x4
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081213A4
	b _08121940
	.align 2, 0
_081213A0: .4byte gUnknown_02024A6A
_081213A4: .4byte gEnemyParty
_081213A8:
	ldr r5, _081213F4
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0812140C
	ldr r0, _081213F8
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	ldr r4, _081213FC
	cmp r0, 0
	beq _081213C6
	ldr r4, _08121400
_081213C6:
	ldrb r1, [r4]
	adds r0, r1, 0
	ldr r3, _08121404
	ldr r2, _08121408
	mov r12, r2
	adds r2, r5, 0
	cmp r0, 0xFF
	beq _081213E8
_081213D6:
	mov r5, r8
	adds r0, r5, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _081213D6
_081213E8:
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r3
	ldrh r1, [r0]
	b _08121908
	.align 2, 0
_081213F4: .4byte gUnknown_02024C07
_081213F8: .4byte gUnknown_020239F8
_081213FC: .4byte gUnknown_08400791
_08121400: .4byte gUnknown_08400797
_08121404: .4byte gUnknown_02024A6A
_08121408: .4byte gEnemyParty
_0812140C:
	ldr r1, _08121418
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	b _0812193A
	.align 2, 0
_08121418: .4byte gUnknown_02024A6A
_0812141C:
	ldr r5, _08121468
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08121480
	ldr r0, _0812146C
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	ldr r4, _08121470
	cmp r0, 0
	beq _0812143A
	ldr r4, _08121474
_0812143A:
	ldrb r1, [r4]
	adds r0, r1, 0
	ldr r3, _08121478
	ldr r2, _0812147C
	mov r12, r2
	adds r2, r5, 0
	cmp r0, 0xFF
	beq _0812145C
_0812144A:
	mov r5, r8
	adds r0, r5, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _0812144A
_0812145C:
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r3
	ldrh r1, [r0]
	b _08121908
	.align 2, 0
_08121468: .4byte gUnknown_02024C08
_0812146C: .4byte gUnknown_020239F8
_08121470: .4byte gUnknown_08400791
_08121474: .4byte gUnknown_08400797
_08121478: .4byte gUnknown_02024A6A
_0812147C: .4byte gEnemyParty
_08121480:
	ldr r1, _0812148C
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	b _0812193A
	.align 2, 0
_0812148C: .4byte gUnknown_02024A6A
_08121490:
	ldr r5, _081214DC
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _081214F4
	ldr r0, _081214E0
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	ldr r4, _081214E4
	cmp r0, 0
	beq _081214AE
	ldr r4, _081214E8
_081214AE:
	ldrb r1, [r4]
	adds r0, r1, 0
	ldr r3, _081214EC
	ldr r2, _081214F0
	mov r12, r2
	adds r2, r5, 0
	cmp r0, 0xFF
	beq _081214D0
_081214BE:
	mov r5, r8
	adds r0, r5, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _081214BE
_081214D0:
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r3
	ldrh r1, [r0]
	b _08121908
	.align 2, 0
_081214DC: .4byte gUnknown_02024C0A
_081214E0: .4byte gUnknown_020239F8
_081214E4: .4byte gUnknown_08400791
_081214E8: .4byte gUnknown_08400797
_081214EC: .4byte gUnknown_02024A6A
_081214F0: .4byte gEnemyParty
_081214F4:
	ldr r1, _08121500
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	b _0812193A
	.align 2, 0
_08121500: .4byte gUnknown_02024A6A
_08121504:
	ldr r5, _08121550
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08121568
	ldr r0, _08121554
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	ldr r4, _08121558
	cmp r0, 0
	beq _08121522
	ldr r4, _0812155C
_08121522:
	ldrb r1, [r4]
	adds r0, r1, 0
	ldr r3, _08121560
	ldr r2, _08121564
	mov r12, r2
	adds r2, r5, 0
	cmp r0, 0xFF
	beq _08121544
_08121532:
	mov r5, r8
	adds r0, r5, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _08121532
_08121544:
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r3
	ldrh r1, [r0]
	b _08121908
	.align 2, 0
_08121550: .4byte gUnknown_02024A60
_08121554: .4byte gUnknown_020239F8
_08121558: .4byte gUnknown_08400791
_0812155C: .4byte gUnknown_08400797
_08121560: .4byte gUnknown_02024A6A
_08121564: .4byte gEnemyParty
_08121568:
	ldr r1, _08121574
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	b _0812193A
	.align 2, 0
_08121574: .4byte gUnknown_02024A6A
_08121578:
	ldr r4, _081215CC
	ldr r0, _081215D0
	adds r5, r4, r0
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r0, 24
	adds r2, r4, 0
	cmp r0, 0
	beq _081215E8
	ldr r0, _081215D4
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	ldr r4, _081215D8
	cmp r0, 0
	beq _0812159C
	ldr r4, _081215DC
_0812159C:
	ldrb r1, [r4]
	adds r0, r1, 0
	ldr r3, _081215E0
	ldr r5, _081215E4
	mov r12, r5
	cmp r0, 0xFF
	beq _081215BC
_081215AA:
	mov r5, r8
	adds r0, r5, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _081215AA
_081215BC:
	ldr r1, _081215D0
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r3
	ldrh r1, [r0]
	b _08121908
	.align 2, 0
_081215CC: .4byte 0x02000000
_081215D0: .4byte 0x00016003
_081215D4: .4byte gUnknown_020239F8
_081215D8: .4byte gUnknown_08400791
_081215DC: .4byte gUnknown_08400797
_081215E0: .4byte gUnknown_02024A6A
_081215E4: .4byte gEnemyParty
_081215E8:
	ldr r1, _081215F4
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	b _0812193A
	.align 2, 0
_081215F4: .4byte gUnknown_02024A6A
_081215F8:
	ldr r0, _08121610
	ldr r2, [r0]
	ldrh r1, [r2]
	movs r0, 0xB1
	lsls r0, 1
	cmp r1, r0
	bls _0812161C
	ldr r0, _08121614
	ldr r2, _08121618
	adds r0, r2
	b _08121634
	.align 2, 0
_08121610: .4byte gUnknown_02039270
_08121614: .4byte 0x02000000
_08121618: .4byte 0x000160a0
_0812161C:
	ldrh r1, [r2]
	b _08121652
_08121620:
	ldr r0, _08121640
	ldr r2, [r0]
	ldrh r1, [r2, 0x2]
	movs r0, 0xB1
	lsls r0, 1
	cmp r1, r0
	bls _08121650
	ldr r0, _08121644
	ldr r3, _08121648
	adds r0, r3
_08121634:
	ldrb r0, [r0]
	lsls r0, 2
	ldr r1, _0812164C
	adds r4, r0, r1
	b _081219E6
	.align 2, 0
_08121640: .4byte gUnknown_02039270
_08121644: .4byte 0x02000000
_08121648: .4byte 0x000160a0
_0812164C: .4byte gUnknown_08401674
_08121650:
	ldrh r1, [r2, 0x2]
_08121652:
	movs r0, 0xD
	muls r1, r0
	ldr r0, _0812165C
	adds r4, r1, r0
	b _081219E6
	.align 2, 0
_0812165C: .4byte gMoveNames
_08121660:
	ldr r0, _081216AC
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081216D8
	ldr r1, _081216B0
	ldrh r0, [r1]
	cmp r0, 0xAF
	bne _081216D4
	ldr r2, _081216B4
	ldr r0, _081216B8
	ldr r5, _081216BC
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _081216C0
	ldrb r2, [r1]
	ldrh r0, [r0, 0x18]
	cmp r0, r2
	bne _081216CC
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	ldr r0, _081216C4
	adds r1, r0
	mov r0, sp
	bl StringCopy
	ldr r1, _081216C8
	mov r0, sp
	bl StringAppend
	mov r4, sp
	b _081219E6
	.align 2, 0
_081216AC: .4byte gUnknown_020239F8
_081216B0: .4byte gUnknown_02024C04
_081216B4: .4byte gLinkPlayers
_081216B8: .4byte 0x02000000
_081216BC: .4byte 0x000160cb
_081216C0: .4byte gUnknown_02024C0B
_081216C4: .4byte gEnigmaBerries
_081216C8: .4byte gUnknown_08400A85
_081216CC:
	ldr r4, _081216D0
	b _081219E6
	.align 2, 0
_081216D0: .4byte gUnknown_08400A78
_081216D4:
	ldrh r0, [r1]
	b _081216DC
_081216D8:
	ldr r0, _081216E8
	ldrh r0, [r0]
_081216DC:
	mov r1, sp
	bl itemid_copy_name
	mov r4, sp
	b _081219E6
	.align 2, 0
_081216E8: .4byte gUnknown_02024C04
_081216EC:
	ldr r0, _081216F0
	b _08121734
	.align 2, 0
_081216F0: .4byte byte_2024C06
_081216F4:
	ldr r1, _081216FC
	ldr r0, _08121700
	b _08121730
	.align 2, 0
_081216FC: .4byte gUnknown_0203926C
_08121700: .4byte gUnknown_02024C07
_08121704:
	ldr r1, _0812170C
	ldr r0, _08121710
	b _08121730
	.align 2, 0
_0812170C: .4byte gUnknown_0203926C
_08121710: .4byte gUnknown_02024C08
_08121714:
	ldr r1, _08121720
	ldr r0, _08121724
	ldr r2, _08121728
	adds r0, r2
	b _08121730
	.align 2, 0
_08121720: .4byte gUnknown_0203926C
_08121724: .4byte 0x02000000
_08121728: .4byte 0x00016003
_0812172C:
	ldr r1, _08121740
	ldr r0, _08121744
_08121730:
	ldrb r0, [r0]
	adds r0, r1
_08121734:
	ldrb r1, [r0]
	movs r0, 0xD
	muls r1, r0
	ldr r0, _08121748
	adds r4, r1, r0
	b _081219E6
	.align 2, 0
_08121740: .4byte gUnknown_0203926C
_08121744: .4byte gUnknown_02024C0A
_08121748: .4byte gAbilityNames
_0812174C:
	ldr r3, _08121764
	ldrh r1, [r3]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _08121768
	bl GetSecretBaseTrainerNameIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xD
	b _081217AE
	.align 2, 0
_08121764: .4byte gTrainerBattleOpponent
_08121768:
	ldr r0, _08121784
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _08121788
	bl get_trainer_class_name_index
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xD
	b _081217AE
	.align 2, 0
_08121784: .4byte gUnknown_020239F8
_08121788:
	movs r0, 0x80
	lsls r0, 4
	ands r0, r1
	cmp r0, 0
	beq _0812179E
	bl sub_8135FD8
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xD
	b _081217AE
_0812179E:
	ldr r2, _081217B8
	ldrh r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r1, [r0, 0x1]
	movs r0, 0xD
_081217AE:
	muls r1, r0
	ldr r0, _081217BC
	adds r4, r1, r0
	b _081219E6
	.align 2, 0
_081217B8: .4byte gTrainers
_081217BC: .4byte gTrainerClassNames
_081217C0:
	ldr r2, _081217E4
	ldrh r1, [r2]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _081217EC
	mov r0, sp
	movs r1, 0xFF
	movs r2, 0x8
	bl memset
	ldr r1, _081217E8
	mov r0, sp
	movs r2, 0x7
	bl memcpy
	mov r4, sp
	b _081219E6
	.align 2, 0
_081217E4: .4byte gTrainerBattleOpponent
_081217E8: .4byte 0x02017002
_081217EC:
	ldr r0, _08121804
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _08121808
	mov r0, sp
	bl get_trainer_name
	mov r4, sp
	b _081219E6
	.align 2, 0
_08121804: .4byte gUnknown_020239F8
_08121808:
	movs r0, 0x80
	lsls r0, 4
	ands r0, r1
	cmp r0, 0
	beq _0812181C
	mov r0, sp
	bl sub_8135FF4
	mov r4, sp
	b _081219E6
_0812181C:
	ldrh r0, [r2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0812182C
	adds r4, r1, r0
	b _081219E6
	.align 2, 0
_0812182C: .4byte gTrainers + 0x4
_08121830:
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	ldr r1, _0812183C
	adds r4, r0, r1
	b _081219E6
	.align 2, 0
_0812183C: .4byte gLinkPlayers + 0x8
_08121840:
	ldr r4, _08121850
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x18]
	movs r0, 0x2
	b _08121876
	.align 2, 0
_08121850: .4byte gLinkPlayers
_08121854:
	ldr r4, _08121864
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x18]
	movs r0, 0x1
	b _08121876
	.align 2, 0
_08121864: .4byte gLinkPlayers
_08121868:
	ldr r4, _08121888
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x18]
	movs r0, 0x3
_08121876:
	eors r0, r1
	bl sub_803FC34
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r4, 0x8
	adds r4, r1, r4
	b _081219E6
	.align 2, 0
_08121888: .4byte gLinkPlayers
_0812188C:
	ldr r0, _081218A4
	ldr r3, _081218A8
	adds r0, r3
	ldrb r0, [r0]
	bl sub_803FC34
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r0, _081218AC
	adds r4, r1, r0
	b _081219E6
	.align 2, 0
_081218A4: .4byte 0x02000000
_081218A8: .4byte 0x00016003
_081218AC: .4byte gLinkPlayers + 0x8
_081218B0:
	ldr r4, _081218B4
	b _081219E6
	.align 2, 0
_081218B4: .4byte gSaveBlock2
_081218B8:
	bl sub_8082830
	adds r4, r0, 0
	b _081219E6
_081218C0:
	ldr r5, _08121918
	ldr r1, _0812191C
	adds r0, r5, r1
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08121934
	ldr r0, _08121920
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	ldr r4, _08121924
	cmp r0, 0
	beq _081218E2
	ldr r4, _08121928
_081218E2:
	ldrb r1, [r4]
	adds r0, r1, 0
	ldr r2, _0812192C
	mov r12, r2
	adds r2, r5, 0
	cmp r0, 0xFF
	beq _08121902
_081218F0:
	mov r3, r8
	adds r0, r3, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _081218F0
_08121902:
	ldr r5, _08121930
	adds r0, r2, r5
	ldrb r1, [r0]
_08121908:
	movs r0, 0x64
	muls r0, r1
	add r0, r12
_0812190E:
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	b _0812194A
	.align 2, 0
_08121918: .4byte 0x02000000
_0812191C: .4byte 0x00016003
_08121920: .4byte gUnknown_020239F8
_08121924: .4byte gUnknown_08400791
_08121928: .4byte gUnknown_08400797
_0812192C: .4byte gEnemyParty
_08121930: .4byte 0x0001605e
_08121934:
	ldr r1, _08121954
	adds r0, r5, r1
	ldrb r1, [r0]
_0812193A:
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121958
_08121940:
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
_0812194A:
	mov r0, sp
	bl StringGetEnd10
	mov r4, sp
	b _081219E6
	.align 2, 0
_08121954: .4byte 0x0001605e
_08121958: .4byte gPlayerParty
_0812195C:
	ldr r0, _08121970
	bl FlagGet
	lsls r0, 24
	ldr r4, _08121974
	cmp r0, 0
	beq _081219E6
	ldr r4, _08121978
	b _081219E6
	.align 2, 0
_08121970: .4byte 0x0000084b
_08121974: .4byte gUnknown_084009ED
_08121978: .4byte gUnknown_084009F7
_0812197C:
	ldr r0, _08121980
	b _08121986
	.align 2, 0
_08121980: .4byte gUnknown_02024C07
_08121984:
	ldr r0, _08121998
_08121986:
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	ldr r4, _0812199C
	cmp r0, 0
	bne _081219E6
	ldr r4, _081219A0
	b _081219E6
	.align 2, 0
_08121998: .4byte gUnknown_02024C08
_0812199C: .4byte gUnknown_084007A7
_081219A0: .4byte gUnknown_084007AC
_081219A4:
	ldr r0, _081219A8
	b _081219AE
	.align 2, 0
_081219A8: .4byte gUnknown_02024C07
_081219AC:
	ldr r0, _081219C0
_081219AE:
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	ldr r4, _081219C4
	cmp r0, 0
	bne _081219E6
	ldr r4, _081219C8
	b _081219E6
	.align 2, 0
_081219C0: .4byte gUnknown_02024C08
_081219C4: .4byte gUnknown_0840079C
_081219C8: .4byte gUnknown_084007A1
_081219CC:
	ldr r0, _081219D0
	b _081219D6
	.align 2, 0
_081219D0: .4byte gUnknown_02024C07
_081219D4:
	ldr r0, _08121A24
_081219D6:
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	ldr r4, _08121A28
	cmp r0, 0
	bne _081219E6
	ldr r4, _08121A2C
_081219E6:
	ldrb r1, [r4]
	adds r0, r1, 0
	mov r3, r9
	ldrb r2, [r3]
	adds r3, 0x1
	cmp r0, 0xFF
	beq _08121A06
_081219F4:
	mov r5, r8
	adds r0, r5, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _081219F4
_08121A06:
	lsls r0, r2, 24
	lsrs r0, 24
	cmp r0, 0x21
	bne _08121A3C
	mov r0, r8
	adds r1, r0, r6
	movs r0, 0xFC
	strb r0, [r1]
	adds r6, 0x1
	mov r2, r8
	adds r1, r2, r6
	movs r0, 0x9
	strb r0, [r1]
	adds r6, 0x1
	b _08121A3C
	.align 2, 0
_08121A24: .4byte gUnknown_02024C08
_08121A28: .4byte gUnknown_084007B2
_08121A2C: .4byte gUnknown_084007B7
_08121A30:
	mov r3, r8
	adds r0, r3, r6
	strb r1, [r0]
	adds r6, 0x1
	mov r3, r9
	adds r3, 0x1
_08121A3C:
	mov r9, r3
	ldrb r1, [r3]
_08121A40:
	adds r0, r1, 0
	cmp r0, 0xFF
	beq _08121A4A
	bl _0812101E
_08121A4A:
	mov r5, r8
	adds r1, r5, r6
	mov r2, r9
	ldrb r0, [r2]
	strb r0, [r1]
	adds r6, 0x1
	adds r0, r6, 0
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8120FFC

	thumb_func_start sub_8121A68
sub_8121A68: @ 8121A68
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	adds r7, r0, 0
	adds r6, r1, 0
	movs r5, 0x1
	movs r0, 0
	mov r8, r0
	movs r0, 0xFF
	strb r0, [r6]
	ldrb r0, [r7, 0x1]
	cmp r0, 0xFF
	bne _08121A86
	b _08121D0E
_08121A86:
	adds r0, r7, r5
	ldrb r1, [r0]
	adds r4, r0, 0
	cmp r1, 0xA
	bls _08121A92
	b _08121D04
_08121A92:
	lsls r0, r1, 2
	ldr r1, _08121A9C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08121A9C: .4byte _08121AA0
	.align 2, 0
_08121AA0:
	.4byte _08121ACC
	.4byte _08121AE8
	.4byte _08121B3C
	.4byte _08121B54
	.4byte _08121B64
	.4byte _08121BDC
	.4byte _08121BF0
	.4byte _08121C02
	.4byte _08121C48
	.4byte _08121C5C
	.4byte _08121C78
_08121ACC:
	adds r0, r5, r7
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldr r0, _08121AE4
	subs r1, 0xC
	lsls r1, 2
	adds r1, r0
	ldr r1, [r1]
	b _08121CE2
	.align 2, 0
_08121AE4: .4byte gUnknown_08400F8C
_08121AE8:
	ldrb r0, [r4, 0x1]
	cmp r0, 0x2
	beq _08121B04
	cmp r0, 0x2
	bgt _08121AF8
	cmp r0, 0x1
	beq _08121AFE
	b _08121B26
_08121AF8:
	cmp r0, 0x4
	beq _08121B0C
	b _08121B26
_08121AFE:
	ldrb r4, [r4, 0x3]
	mov r8, r4
	b _08121B26
_08121B04:
	ldrb r1, [r4, 0x3]
	ldrb r0, [r4, 0x4]
	lsls r0, 8
	b _08121B22
_08121B0C:
	ldrb r0, [r4, 0x3]
	mov r8, r0
	ldrb r0, [r4, 0x4]
	lsls r0, 8
	mov r1, r8
	orrs r1, r0
	ldrb r0, [r4, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r4, 0x6]
	lsls r0, 24
_08121B22:
	orrs r1, r0
	mov r8, r1
_08121B26:
	adds r4, r5, r7
	ldrb r3, [r4, 0x2]
	adds r0, r6, 0
	mov r1, r8
	movs r2, 0
	bl ConvertIntToDecimalStringN
	adds r0, r5, 0x3
	ldrb r4, [r4, 0x1]
	adds r5, r0, r4
	b _08121D04
_08121B3C:
	adds r0, r5, r7
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r1, r0
	movs r0, 0xD
	muls r1, r0
	ldr r0, _08121B50
	adds r1, r0
	b _08121CE2
	.align 2, 0
_08121B50: .4byte gMoveNames
_08121B54:
	adds r0, r5, r7
	ldrb r0, [r0, 0x1]
	lsls r1, r0, 3
	subs r1, r0
	ldr r0, _08121B60
	b _08121C66
	.align 2, 0
_08121B60: .4byte gTypeNames
_08121B64:
	ldrb r0, [r4, 0x1]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08121B88
	ldrb r1, [r4, 0x2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121B84
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	b _08121BC4
	.align 2, 0
_08121B84: .4byte gPlayerParty
_08121B88:
	ldr r0, _08121BA0
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08121BA8
	ldr r1, _08121BA4
	adds r0, r6, 0
	bl StringAppend
	b _08121BB0
	.align 2, 0
_08121BA0: .4byte gUnknown_020239F8
_08121BA4: .4byte gUnknown_08400797
_08121BA8:
	ldr r1, _08121BD4
	adds r0, r6, 0
	bl StringAppend
_08121BB0:
	adds r0, r5, r7
	ldrb r1, [r0, 0x2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121BD8
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
_08121BC4:
	mov r0, sp
	bl StringGetEnd10
	adds r0, r6, 0
	mov r1, sp
	bl StringAppend
	b _08121D02
	.align 2, 0
_08121BD4: .4byte gUnknown_08400791
_08121BD8: .4byte gEnemyParty
_08121BDC:
	ldr r1, _08121BEC
	adds r0, r5, r7
	ldrb r0, [r0, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	b _08121C68
	.align 2, 0
_08121BEC: .4byte gUnknown_08400F58
_08121BF0:
	adds r0, r5, r7
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r1, r0
	adds r0, r6, 0
	bl GetSpeciesName
	b _08121D02
_08121C02:
	adds r4, r5, r7
	ldrb r0, [r4, 0x1]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08121C28
	ldrb r1, [r4, 0x2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121C24
	adds r0, r1
	movs r1, 0x2
	adds r2, r6, 0
	bl GetMonData
	b _08121C3A
	.align 2, 0
_08121C24: .4byte gPlayerParty
_08121C28:
	ldrb r1, [r4, 0x2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121C44
	adds r0, r1
	movs r1, 0x2
	adds r2, r6, 0
	bl GetMonData
_08121C3A:
	adds r0, r6, 0
	bl StringGetEnd10
	b _08121D02
	.align 2, 0
_08121C44: .4byte gEnemyParty
_08121C48:
	ldr r1, _08121C58
	adds r0, r5, r7
	ldrb r0, [r0, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	b _08121C68
	.align 2, 0
_08121C58: .4byte gUnknown_08400F78
_08121C5C:
	adds r0, r5, r7
	ldrb r1, [r0, 0x1]
	movs r0, 0xD
	muls r1, r0
	ldr r0, _08121C74
_08121C66:
	adds r1, r0
_08121C68:
	adds r0, r6, 0
	bl StringAppend
	adds r5, 0x2
	b _08121D04
	.align 2, 0
_08121C74: .4byte gAbilityNames
_08121C78:
	adds r0, r5, r7
	ldrb r2, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r2, r0
	ldr r0, _08121CC4
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08121CFA
	cmp r2, 0xAF
	bne _08121CF0
	ldr r2, _08121CC8
	ldr r0, _08121CCC
	ldr r1, _08121CD0
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _08121CD4
	ldrb r2, [r1]
	ldrh r0, [r0, 0x18]
	cmp r0, r2
	bne _08121CE0
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	ldr r0, _08121CD8
	adds r1, r0
	adds r0, r6, 0
	bl StringCopy
	ldr r1, _08121CDC
	b _08121CE2
	.align 2, 0
_08121CC4: .4byte gUnknown_020239F8
_08121CC8: .4byte gLinkPlayers
_08121CCC: .4byte 0x02000000
_08121CD0: .4byte 0x000160cb
_08121CD4: .4byte gUnknown_02024C0B
_08121CD8: .4byte gEnigmaBerries
_08121CDC: .4byte gUnknown_08400A85
_08121CE0:
	ldr r1, _08121CEC
_08121CE2:
	adds r0, r6, 0
	bl StringAppend
	b _08121D02
	.align 2, 0
_08121CEC: .4byte gUnknown_08400A78
_08121CF0:
	adds r0, r2, 0
	adds r1, r6, 0
	bl itemid_copy_name
	b _08121D02
_08121CFA:
	adds r0, r2, 0
	adds r1, r6, 0
	bl itemid_copy_name
_08121D02:
	adds r5, 0x3
_08121D04:
	adds r0, r7, r5
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _08121D0E
	b _08121A86
_08121D0E:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8121A68

	thumb_func_start sub_8121D1C
sub_8121D1C: @ 8121D1C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r2, 0
	ldr r5, _08121D50
	ldr r3, _08121D54
_08121D26:
	cmp r2, 0x4
	beq _08121D3C
	ldrh r1, [r3]
	cmp r1, 0
	bne _08121D32
	adds r2, 0x1
_08121D32:
	ldr r0, [r5]
	adds r3, 0x2
	ldrh r0, [r0]
	cmp r1, r0
	bne _08121D26
_08121D3C:
	cmp r2, 0
	blt _08121D68
	cmp r2, 0x2
	bgt _08121D5C
	ldr r1, _08121D58
	adds r0, r4, 0
	bl StringCopy
	b _08121D68
	.align 2, 0
_08121D50: .4byte gUnknown_02039270
_08121D54: .4byte gUnknown_084016BC
_08121D58: .4byte gUnknown_08400E5E
_08121D5C:
	cmp r2, 0x4
	bgt _08121D68
	ldr r1, _08121D70
	adds r0, r4, 0
	bl StringCopy
_08121D68:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08121D70: .4byte gUnknown_08400E62
	thumb_func_end sub_8121D1C

	thumb_func_start sub_8121D74
sub_8121D74: @ 8121D74
	push {r4,r5,lr}
	adds r3, r0, 0
	movs r4, 0
	b _08121D7E
_08121D7C:
	adds r3, 0x1
_08121D7E:
	ldrb r0, [r3]
	cmp r0, 0xFF
	bne _08121D7C
	ldr r1, _08121DB4
	ldr r5, _08121DB8
	movs r0, 0
	lsls r0, 1
	adds r2, r0, r1
_08121D8E:
	cmp r4, 0x4
	beq _08121DA8
	ldrh r1, [r2]
	cmp r1, 0
	bne _08121D9A
	adds r4, 0x1
_08121D9A:
	ldr r0, [r5]
	adds r2, 0x2
	ldrh r0, [r0]
	cmp r1, r0
	bne _08121D8E
	cmp r4, 0x4
	bhi _08121E04
_08121DA8:
	lsls r0, r4, 2
	ldr r1, _08121DBC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08121DB4: .4byte gUnknown_084016BC
_08121DB8: .4byte gUnknown_02039270
_08121DBC: .4byte _08121DC0
	.align 2, 0
_08121DC0:
	.4byte _08121DD4
	.4byte _08121DDC
	.4byte _08121DE4
	.4byte _08121DEC
	.4byte _08121DFC
_08121DD4:
	ldr r1, _08121DD8
	b _08121DEE
	.align 2, 0
_08121DD8: .4byte gUnknown_084007C8
_08121DDC:
	ldr r1, _08121DE0
	b _08121DEE
	.align 2, 0
_08121DE0: .4byte gUnknown_084007CA
_08121DE4:
	ldr r1, _08121DE8
	b _08121DEE
	.align 2, 0
_08121DE8: .4byte gUnknown_084007CC
_08121DEC:
	ldr r1, _08121DF8
_08121DEE:
	adds r0, r3, 0
	bl StringCopy
	b _08121E04
	.align 2, 0
_08121DF8: .4byte gUnknown_084007CE
_08121DFC:
	ldr r1, _08121E0C
	adds r0, r3, 0
	bl StringCopy
_08121E04:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08121E0C: .4byte gUnknown_084007D0
	thumb_func_end sub_8121D74

	thumb_func_start sub_8121E10
sub_8121E10: @ 8121E10
	push {lr}
	bl sub_8121E58
	ldr r0, _08121E2C
	ldr r1, _08121E30
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x4
	bl sub_806AFAC
	pop {r0}
	bx r0
	.align 2, 0
_08121E2C: .4byte 0x0201b000
_08121E30: .4byte 0x00000263
	thumb_func_end sub_8121E10

	thumb_func_start sub_8121E34
sub_8121E34: @ 8121E34
	push {lr}
	bl sub_8121E58
	ldr r0, _08121E50
	ldr r1, _08121E54
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	movs r0, 0x4
	movs r1, 0
	bl sub_806AFAC
	pop {r0}
	bx r0
	.align 2, 0
_08121E50: .4byte 0x0201b000
_08121E54: .4byte 0x00000263
	thumb_func_end sub_8121E34

	thumb_func_start sub_8121E58
sub_8121E58: @ 8121E58
	push {lr}
	movs r1, 0
	ldr r3, _08121E74
	movs r2, 0
_08121E60:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bls _08121E60
	pop {r0}
	bx r0
	.align 2, 0
_08121E74: .4byte gUnknown_02039270
	thumb_func_end sub_8121E58

	thumb_func_start sub_8121E78
sub_8121E78: @ 8121E78
	push {r4-r6,lr}
	ldr r1, _08121E98
	movs r2, 0x99
	lsls r2, 2
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x7
	bls _08121E8E
	b _08122026
_08121E8E:
	lsls r0, 2
	ldr r1, _08121E9C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08121E98: .4byte 0x0201b000
_08121E9C: .4byte _08121EA0
	.align 2, 0
_08121EA0:
	.4byte _08121EC0
	.4byte _08121F00
	.4byte _08121F14
	.4byte _08121F28
	.4byte _08121F54
	.4byte _08121F68
	.4byte _08121F6E
	.4byte _08121FF8
_08121EC0:
	ldr r0, _08121EE8
	adds r5, r4, r0
	movs r1, 0
	ldrsh r3, [r5, r1]
	ldr r0, _08121EEC
	ldrb r0, [r0]
	cmp r3, r0
	bge _08121EF4
	movs r2, 0x98
	lsls r2, 2
	adds r0, r4, r2
	ldrb r0, [r0]
	ldrb r1, [r5]
	movs r2, 0x64
	muls r2, r3
	ldr r3, _08121EF0
	adds r2, r3
	bl sub_806D90C
	b _08122020
	.align 2, 0
_08121EE8: .4byte 0x00000266
_08121EEC: .4byte gPlayerPartyCount
_08121EF0: .4byte gPlayerParty
_08121EF4:
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _08121FE8
_08121F00:
	bl sub_806DA98
	ldr r1, _08121F10
	movs r2, 0x99
	lsls r2, 2
	adds r1, r2
	b _08121FE8
	.align 2, 0
_08121F10: .4byte 0x0201b000
_08121F14:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_806DC34
	movs r2, 0x99
	lsls r2, 2
	adds r1, r4, r2
	b _08121FE8
_08121F28:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	ldr r2, _08121F50
	adds r5, r4, r2
	ldrb r1, [r5]
	bl sub_806BD58
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08122020
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _08121FE8
	.align 2, 0
_08121F50: .4byte 0x00000266
_08121F54:
	bl sub_806E334
	ldr r1, _08121F64
	movs r2, 0x99
	lsls r2, 2
	adds r1, r2
	b _08121FE8
	.align 2, 0
_08121F64: .4byte 0x0201b000
_08121F68:
	bl sub_806E0C4
	b _08121FE0
_08121F6E:
	movs r5, 0
	b _08121FD8
_08121F72:
	movs r4, 0
	adds r6, r5, 0x1
	b _08121F7E
_08121F78:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_08121F7E:
	cmp r4, 0x2
	bhi _08121FA0
	ldr r0, _08121FC4
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, r6
	bne _08121F78
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 25
	movs r2, 0xE0
	lsls r2, 21
	adds r1, r2
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_806BC3C
_08121FA0:
	cmp r4, 0x3
	bne _08121FD4
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08121FC8
	adds r0, r1
	bl sub_8122030
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08121FCC
	adds r0, r5, 0
	movs r1, 0x70
	bl sub_806BC3C
	b _08121FD4
	.align 2, 0
_08121FC4: .4byte gUnknown_02039270
_08121FC8: .4byte gPlayerParty
_08121FCC:
	adds r0, r5, 0
	movs r1, 0x7E
	bl sub_806BC3C
_08121FD4:
	lsls r0, r6, 24
	lsrs r5, r0, 24
_08121FD8:
	ldr r0, _08121FF0
	ldrb r0, [r0]
	cmp r5, r0
	bcc _08121F72
_08121FE0:
	ldr r1, _08121FF4
	movs r0, 0x99
	lsls r0, 2
	adds r1, r0
_08121FE8:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08122026
	.align 2, 0
_08121FF0: .4byte gPlayerPartyCount
_08121FF4: .4byte 0x0201b000
_08121FF8:
	ldr r1, _0812201C
	adds r5, r4, r1
	ldrb r0, [r5]
	bl sub_806B58C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08122020
	movs r1, 0
	strh r1, [r5]
	movs r2, 0x99
	lsls r2, 2
	adds r0, r4, r2
	strh r1, [r0]
	movs r0, 0x1
	b _08122028
	.align 2, 0
_0812201C: .4byte 0x00000266
_08122020:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_08122026:
	movs r0, 0
_08122028:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8121E78

	thumb_func_start sub_8122030
sub_8122030: @ 8122030
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0812207C
	ldr r0, _08122058
	ldr r1, _0812205C
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08122060
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _0812207C
	b _081220B6
	.align 2, 0
_08122058: .4byte 0x0201b000
_0812205C: .4byte 0x00000263
_08122060:
	ldr r0, _08122080
	ldr r1, _08122084
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08122088
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	cmp r0, 0x32
	bls _08122088
_0812207C:
	movs r0, 0
	b _081220B8
	.align 2, 0
_08122080: .4byte gSaveBlock2
_08122084: .4byte 0x00000554
_08122088:
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r1, _081220C0
	movs r0, 0
	lsls r0, 1
	adds r2, r0, r1
	ldrh r0, [r2]
	ldr r1, _081220C4
	cmp r0, r1
	beq _081220B6
	adds r4, r1, 0
	adds r1, r2, 0
_081220A8:
	ldrh r0, [r1]
	cmp r0, r3
	beq _0812207C
	adds r1, 0x2
	ldrh r0, [r1]
	cmp r0, r4
	bne _081220A8
_081220B6:
	movs r0, 0x1
_081220B8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081220C0: .4byte gBattleTowerBanlist
_081220C4: .4byte 0x0000ffff
	thumb_func_end sub_8122030

	thumb_func_start sub_81220C8
sub_81220C8: @ 81220C8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r1, _081220EC
	ldr r2, _081220F0
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _081221A2
	ldr r0, _081220F4
	ldrb r0, [r0, 0x2]
	cmp r0, 0
	bne _08122100
	movs r0, 0x11
	b _081221A4
	.align 2, 0
_081220EC: .4byte 0x0201b000
_081220F0: .4byte 0x00000263
_081220F4: .4byte gUnknown_02039270
_081220F8:
	movs r0, 0x12
	b _081221A4
_081220FC:
	movs r0, 0x13
	b _081221A4
_08122100:
	movs r5, 0
_08122102:
	ldr r4, _081221B4
	adds r4, r5, r4
	ldrb r0, [r4]
	movs r1, 0x64
	muls r0, r1
	ldr r2, _081221B8
	adds r0, r2
	movs r1, 0xB
	bl GetMonData
	ldr r1, _081221BC
	ldr r2, _081221C0
	adds r6, r1, r2
	strh r0, [r6]
	ldrb r0, [r4]
	movs r1, 0x64
	muls r0, r1
	ldr r2, _081221B8
	adds r0, r2
	movs r1, 0xC
	bl GetMonData
	ldr r1, _081221C4
	strh r0, [r1]
	adds r1, r5, 0x1
	lsls r0, r1, 24
	lsrs r5, r0, 24
	mov r10, r1
	cmp r5, 0x2
	bhi _08122198
	ldr r2, _081221C8
	adds r2, r6
	mov r9, r2
	movs r0, 0x64
	mov r8, r0
	ldr r7, _081221B8
_0812214A:
	ldr r0, _081221C0
	add r0, r9
	movs r1, 0
	ldrsh r4, [r0, r1]
	ldr r0, _081221B4
	adds r6, r5, r0
	ldrb r0, [r6]
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	adds r0, r7
	movs r1, 0xB
	bl GetMonData
	cmp r4, r0
	beq _081220F8
	movs r1, 0xA0
	lsls r1, 2
	add r1, r9
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _0812218E
	adds r4, r0, 0
	ldrb r0, [r6]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r7
	movs r1, 0xC
	bl GetMonData
	cmp r4, r0
	beq _081220FC
_0812218E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _0812214A
_08122198:
	mov r2, r10
	lsls r0, r2, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bls _08122102
_081221A2:
	movs r0, 0xFF
_081221A4:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081221B4: .4byte gUnknown_02039270
_081221B8: .4byte gUnknown_030042FC
_081221BC: .4byte 0x0201b000
_081221C0: .4byte 0x00000282
_081221C4: .4byte 0x0201b280
_081221C8: .4byte 0xfffffd7e
	thumb_func_end sub_81220C8

	thumb_func_start sub_81221CC
sub_81221CC: @ 81221CC
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	ldr r3, _081221E4
_081221D6:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _081221E8
	movs r0, 0x1
	b _081221F4
	.align 2, 0
_081221E4: .4byte gUnknown_02039270
_081221E8:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bls _081221D6
	movs r0, 0
_081221F4:
	pop {r1}
	bx r1
	thumb_func_end sub_81221CC

	thumb_func_start sub_81221F8
sub_81221F8: @ 81221F8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x5
	movs r1, 0x1
	bl sub_806D538
	ldr r5, _08122248
	ldrb r1, [r5]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0812224C
	adds r0, r1
	bl sub_8122030
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08122284
	ldrb r0, [r5]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	bl sub_81221CC
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x1
	bne _0812225C
	ldr r1, _08122250
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0x10]
	ldr r1, _08122254
	ldr r2, _08122258
	movs r0, 0x1
	b _08122270
	.align 2, 0
_08122248: .4byte gUnknown_03005CE0
_0812224C: .4byte gPlayerParty
_08122250: .4byte gTasks
_08122254: .4byte gUnknown_084017D8
_08122258: .4byte gUnknown_084017B0
_0812225C:
	ldr r1, _08122278
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x10]
	ldr r1, _0812227C
	ldr r2, _08122280
	movs r0, 0
_08122270:
	movs r3, 0
	bl sub_806E750
	b _0812229E
	.align 2, 0
_08122278: .4byte gTasks
_0812227C: .4byte gUnknown_084017D8
_08122280: .4byte gUnknown_084017B0
_08122284:
	ldr r1, _081222A4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0x2
	strh r1, [r0, 0x10]
	ldr r1, _081222A8
	ldr r2, _081222AC
	movs r0, 0x2
	movs r3, 0
	bl sub_806E750
_0812229E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081222A4: .4byte gTasks
_081222A8: .4byte gUnknown_084017D8
_081222AC: .4byte gUnknown_084017B0
	thumb_func_end sub_81221F8

	thumb_func_start sub_81222B0
sub_81222B0: @ 81222B0
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081222DC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _0812237C
	adds r0, r4, 0
	bl sub_806BE38
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _081222E0
	cmp r0, 0x2
	beq _08122354
	b _0812237C
	.align 2, 0
_081222DC: .4byte gPaletteFade
_081222E0:
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_806CA38
	ldr r1, _08122320
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	beq _08122334
	ldrb r1, [r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08122324
	adds r0, r1
	ldr r1, _08122328
	bl GetMonNickname
	adds r0, r4, 0
	bl sub_81221F8
	ldr r1, _0812232C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08122330
	str r1, [r0]
	b _08122342
	.align 2, 0
_08122320: .4byte gUnknown_03005CE0
_08122324: .4byte gPlayerParty
_08122328: .4byte gStringVar1
_0812232C: .4byte gTasks
_08122330: .4byte sub_812238C
_08122334:
	ldr r0, _0812234C
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08122350
	str r0, [r1]
_08122342:
	adds r0, r4, 0
	bl sub_808B5B4
	b _0812237C
	.align 2, 0
_0812234C: .4byte gTasks
_08122350: .4byte sub_81224A8
_08122354:
	movs r0, 0x5
	bl PlaySE
	bl sub_8121E58
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08122384
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08122388
	str r1, [r0]
_0812237C:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08122384: .4byte gTasks
_08122388: .4byte sub_8122450
	thumb_func_end sub_81222B0

	thumb_func_start sub_812238C
sub_812238C: @ 812238C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	adds r4, r7, 0
	ldr r0, _081223C8
	ldrb r1, [r0, 0x7]
	movs r3, 0x80
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _0812244A
	ldr r2, _081223CC
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _081223D0
	bl GetMenuCursorPos
	lsls r0, 24
	cmp r0, 0
	beq _0812244A
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	b _0812244A
	.align 2, 0
_081223C8: .4byte gPaletteFade
_081223CC: .4byte gMain
_081223D0:
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _081223F2
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _0812244A
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	b _0812244A
_081223F2:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0812243C
	movs r0, 0x5
	bl PlaySE
	ldr r1, _08122430
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrb r4, [r0, 0x10]
	ldr r5, _08122434
	ldr r6, _08122438
	bl GetMenuCursorPos
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_806E81C
	adds r1, r0, 0
	adds r0, r7, 0
	bl _call_via_r1
	b _0812244A
	.align 2, 0
_08122430: .4byte gTasks
_08122434: .4byte gUnknown_084017D8
_08122438: .4byte gUnknown_084017B0
_0812243C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0812244A
	adds r0, r4, 0
	bl sub_8122838
_0812244A:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_812238C

	thumb_func_start sub_8122450
sub_8122450: @ 8122450
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08122478
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08122470
	ldr r0, _0812247C
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_08122470:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08122478: .4byte gPaletteFade
_0812247C: .4byte gMain
	thumb_func_end sub_8122450

	thumb_func_start sub_8122480
sub_8122480: @ 8122480
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _081224A4
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0812249A
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081224A0
_0812249A:
	adds r0, r2, 0
	bl sub_8122838
_081224A0:
	pop {r0}
	bx r0
	.align 2, 0
_081224A4: .4byte gMain
	thumb_func_end sub_8122480

	thumb_func_start sub_81224A8
sub_81224A8: @ 81224A8
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl sub_81220C8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _081224D0
	movs r1, 0
	bl sub_806D538
	ldr r0, _081224CC
	lsls r1, r4, 2
	adds r1, r4
	b _08122518
	.align 2, 0
_081224CC: .4byte gTasks
_081224D0:
	ldr r0, _081224F8
	ldrb r0, [r0]
	cmp r0, 0
	beq _08122504
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _081224FC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08122500
	str r1, [r0]
	b _08122520
	.align 2, 0
_081224F8: .4byte gUnknown_02039270
_081224FC: .4byte gTasks
_08122500: .4byte sub_8122450
_08122504:
	movs r0, 0x20
	bl PlaySE
	movs r0, 0xE
	movs r1, 0
	bl sub_806D538
	ldr r0, _08122528
	lsls r1, r5, 2
	adds r1, r5
_08122518:
	lsls r1, 3
	adds r1, r0
	ldr r0, _0812252C
	str r0, [r1]
_08122520:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08122528: .4byte gTasks
_0812252C: .4byte sub_8122480
	thumb_func_end sub_81224A8

	thumb_func_start sub_8122530
sub_8122530: @ 8122530
	push {r4,r5,lr}
	ldr r5, _08122578
	ldr r4, _0812257C
_08122536:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08122590
	ldrb r0, [r5]
	ldrb r1, [r4]
	bl sub_806C994
	ldrb r0, [r5]
	movs r1, 0
	bl sub_806C658
	ldrb r1, [r4]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08122580
	adds r0, r1
	ldr r1, _08122584
	bl GetMonNickname
	ldr r1, _08122588
	ldrb r0, [r4]
	strb r0, [r1]
	ldrb r0, [r5]
	bl sub_81221F8
	ldr r0, _0812258C
	bl SetMainCallback2
	b _0812259C
	.align 2, 0
_08122578: .4byte 0x0201b260
_0812257C: .4byte gUnknown_020384F0
_08122580: .4byte gPlayerParty
_08122584: .4byte gStringVar1
_08122588: .4byte gUnknown_03005CE0
_0812258C: .4byte sub_806AEDC
_08122590:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08122536
_0812259C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8122530

	thumb_func_start sub_81225A4
sub_81225A4: @ 81225A4
	push {lr}
	ldr r2, _081225C8
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r2, _081225CC
	movs r0, 0x4
	movs r1, 0xFF
	movs r3, 0x5
	bl sub_806AF4C
	ldr r0, _081225D0
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_081225C8: .4byte gPaletteFade
_081225CC: .4byte sub_812238C
_081225D0: .4byte sub_8122530
	thumb_func_end sub_81225A4

	thumb_func_start sub_81225D4
sub_81225D4: @ 81225D4
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _0812263C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08122632
	ldr r2, _08122640
	ldr r1, _08122644
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0xE]
	lsls r1, 16
	asrs r1, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r4, [r0, 0x2E]
	lsls r4, 24
	lsrs r4, 24
	adds r0, r3, 0
	bl DestroyTask
	ldr r0, _08122648
	ldr r1, _0812264C
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, _08122650
	ldr r1, _08122654
	ldrb r2, [r1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _08122658
	str r5, [sp]
	adds r1, r4, 0
	bl sub_809D8BC
_08122632:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812263C: .4byte gPaletteFade
_08122640: .4byte gSprites
_08122644: .4byte gTasks
_08122648: .4byte 0x0201b000
_0812264C: .4byte 0x00000262
_08122650: .4byte gPlayerParty
_08122654: .4byte gPlayerPartyCount
_08122658: .4byte sub_81225A4
	thumb_func_end sub_81225D4

	thumb_func_start sub_812265C
sub_812265C: @ 812265C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0812268C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08122690
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812268C: .4byte gTasks
_08122690: .4byte sub_81225D4
	thumb_func_end sub_812265C

	thumb_func_start sub_8122694
sub_8122694: @ 8122694
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r3, _081226D4
	ldr r2, _081226D8
_081226A0:
	adds r1, r4, r3
	ldrb r0, [r1]
	cmp r0, 0
	bne _081226DC
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r1]
	ldrb r0, [r2]
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 25
	movs r2, 0xE0
	lsls r2, 21
	adds r1, r2
	lsrs r1, 24
	bl sub_806BC3C
	cmp r4, 0x2
	bne _081226CC
	adds r0, r5, 0
	bl sub_806C890
_081226CC:
	adds r0, r5, 0
	bl sub_8122838
	b _08122716
	.align 2, 0
_081226D4: .4byte gUnknown_02039270
_081226D8: .4byte gUnknown_03005CE0
_081226DC:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _081226A0
	movs r0, 0x20
	bl PlaySE
	movs r0, 0x14
	movs r1, 0xA
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_8072DEC
	bl sub_806D5A4
	ldr r0, _0812271C
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _08122720
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08122724
	str r1, [r0]
_08122716:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812271C: .4byte gOtherText_NoMoreThreePoke
_08122720: .4byte gTasks
_08122724: .4byte sub_8122728
	thumb_func_end sub_8122694

	thumb_func_start sub_8122728
sub_8122728: @ 8122728
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08122768
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08122760
	ldr r0, _0812276C
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0812274A
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08122760
_0812274A:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_8072DEC
	adds r0, r4, 0
	bl sub_8122838
_08122760:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08122768: .4byte gUnknown_0202E8F6
_0812276C: .4byte gMain
	thumb_func_end sub_8122728

	thumb_func_start sub_8122770
sub_8122770: @ 8122770
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	ldr r5, _08122798
	ldr r3, _0812279C
_0812277C:
	adds r2, r4, r3
	ldrb r1, [r2]
	ldrb r0, [r5]
	adds r0, 0x1
	cmp r1, r0
	bne _081227B4
	movs r1, 0
	strb r1, [r2]
	cmp r4, 0
	beq _081227A0
	cmp r4, 0x1
	beq _081227AC
	b _081227BE
	.align 2, 0
_08122798: .4byte gUnknown_03005CE0
_0812279C: .4byte gUnknown_02039270
_081227A0:
	ldrb r0, [r3, 0x1]
	strb r0, [r3]
	ldrb r0, [r3, 0x2]
	strb r0, [r3, 0x1]
	strb r4, [r3, 0x2]
	b _081227BE
_081227AC:
	ldrb r0, [r3, 0x2]
	strb r0, [r3, 0x1]
	strb r1, [r3, 0x2]
	b _081227BE
_081227B4:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _0812277C
_081227BE:
	ldrb r0, [r5]
	movs r1, 0x70
	bl sub_806BC3C
	ldr r4, _081227F8
	ldrb r0, [r4]
	cmp r0, 0
	beq _081227DA
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1C
	bl sub_806BC3C
_081227DA:
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _081227EC
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2A
	bl sub_806BC3C
_081227EC:
	adds r0, r6, 0
	bl sub_8122838
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081227F8: .4byte gUnknown_02039270
	thumb_func_end sub_8122770

	thumb_func_start sub_81227FC
sub_81227FC: @ 81227FC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0xA
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	bl sub_806D538
	ldr r1, _08122830
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08122834
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08122830: .4byte gTasks
_08122834: .4byte sub_81222B0
	thumb_func_end sub_81227FC

	thumb_func_start sub_8122838
sub_8122838: @ 8122838
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_81227FC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8122838

	thumb_func_start sub_8122854
sub_8122854: @ 8122854
	push {r4,lr}
	ldr r1, _08122874
	movs r2, 0x99
	lsls r2, 2
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x4
	bhi _081228E0
	lsls r0, 2
	ldr r1, _08122878
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08122874: .4byte 0x0201b000
_08122878: .4byte _0812287C
	.align 2, 0
_0812287C:
	.4byte _08122890
	.4byte _081228A4
	.4byte _081228AA
	.4byte _081228BE
	.4byte _081228D8
_08122890:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_81228E8
	movs r2, 0x99
	lsls r2, 2
	adds r1, r4, r2
	b _081228CA
_081228A4:
	bl sub_806DA98
	b _081228C2
_081228AA:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_8122950
	movs r2, 0x99
	lsls r2, 2
	adds r1, r4, r2
	b _081228CA
_081228BE:
	bl sub_81229B8
_081228C2:
	ldr r1, _081228D4
	movs r0, 0x99
	lsls r0, 2
	adds r1, r0
_081228CA:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _081228E0
	.align 2, 0
_081228D4: .4byte 0x0201b000
_081228D8:
	bl sub_806B908
	movs r0, 0x1
	b _081228E2
_081228E0:
	movs r0, 0
_081228E2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8122854

	thumb_func_start sub_81228E8
sub_81228E8: @ 81228E8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
_081228F0:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08122948
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08122912
	adds r0, r6, 0
	adds r1, r5, 0
	movs r2, 0x3
	adds r3, r4, 0
	bl sub_806D880
_08122912:
	ldr r0, _0812294C
	lsls r1, r5, 5
	adds r3, r1, r0
	ldrh r0, [r3]
	cmp r0, 0
	beq _08122936
	adds r4, r5, 0x3
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0x3
	bl sub_806D99C
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_806D50C
_08122936:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _081228F0
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08122948: .4byte gPlayerParty
_0812294C: .4byte gUnknown_02023A00
	thumb_func_end sub_81228E8

	thumb_func_start sub_8122950
sub_8122950: @ 8122950
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
_08122958:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _081229B0
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08122984
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_806DCD4
_08122984:
	ldr r0, _081229B4
	lsls r1, r5, 5
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, 0
	beq _0812299E
	adds r1, r5, 0x3
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r2, 0x2]
	adds r0, r6, 0
	bl sub_806DCD4
_0812299E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _08122958
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081229B0: .4byte gPlayerParty
_081229B4: .4byte gUnknown_02023A00
	thumb_func_end sub_8122950

	thumb_func_start sub_81229B8
sub_81229B8: @ 81229B8
	push {r4-r7,lr}
	movs r5, 0
	movs r7, 0x64
	ldr r6, _08122A00
_081229C0:
	adds r0, r5, 0
	muls r0, r7
	adds r4, r0, r6
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08122A36
	adds r0, r5, 0
	movs r1, 0x3
	adds r2, r4, 0
	bl sub_806E4A4
	adds r0, r4, 0
	bl sub_80A1CD8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08122A04
	cmp r0, 0x6
	beq _08122A04
	subs r2, r0, 0x1
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_806E104
	b _08122A12
	.align 2, 0
_08122A00: .4byte gPlayerParty
_08122A04:
	adds r2, r5, 0
	muls r2, r7
	adds r2, r6
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_806E294
_08122A12:
	adds r4, r5, 0
	muls r4, r7
	adds r4, r6
	adds r0, r5, 0
	movs r1, 0x3
	adds r2, r4, 0
	bl sub_806E3C0
	adds r0, r5, 0
	movs r1, 0x3
	adds r2, r4, 0
	bl sub_806E050
	adds r0, r5, 0
	movs r1, 0x3
	adds r2, r4, 0
	bl sub_806E630
_08122A36:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _081229C0
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81229B8

	thumb_func_start sub_8122A48
sub_8122A48: @ 8122A48
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08122AA0
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08122A98
	ldr r0, _08122AA4
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 3
	adds r4, r0
	movs r0, 0x1E
	strh r0, [r4, 0x8]
	ldr r5, _08122AA8
	ldrh r1, [r5]
	adds r0, r6, 0
	movs r2, 0
	bl sub_806D4AC
	ldrh r1, [r5, 0x20]
	adds r0, r6, 0
	movs r2, 0x1
	bl sub_806D4AC
	adds r5, 0x40
	ldrh r1, [r5]
	adds r0, r6, 0
	movs r2, 0x2
	bl sub_806D4AC
	ldr r0, _08122AAC
	str r0, [r4]
	ldr r0, _08122AB0
	ldr r1, _08122AB4
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_08122A98:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08122AA0: .4byte gPaletteFade
_08122AA4: .4byte gTasks
_08122AA8: .4byte gUnknown_02023A00
_08122AAC: .4byte sub_8122AB8
_08122AB0: .4byte 0x0201b000
_08122AB4: .4byte 0x00000261
	thumb_func_end sub_8122A48

	thumb_func_start sub_8122AB8
sub_8122AB8: @ 8122AB8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08122AFC
	ldrh r1, [r0, 0x20]
	adds r0, 0x40
	ldrh r2, [r0]
	adds r0, r4, 0
	bl sub_806D3B4
	ldr r1, _08122B00
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _08122AF4
	ldr r0, _08122B04
	str r0, [r1]
	ldr r0, _08122B08
	ldr r1, _08122B0C
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	movs r0, 0x78
	bl PlaySE
_08122AF4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08122AFC: .4byte gUnknown_02023A00
_08122B00: .4byte gTasks
_08122B04: .4byte sub_8122B10
_08122B08: .4byte 0x0201b000
_08122B0C: .4byte 0x00000261
	thumb_func_end sub_8122AB8

	thumb_func_start sub_8122B10
sub_8122B10: @ 8122B10
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0
	mov r8, r0
	ldr r1, _08122B5C
	mov r10, r1
	ldr r2, _08122B60
	mov r9, r2
_08122B2E:
	mov r1, r8
	lsls r0, r1, 5
	mov r2, r10
	adds r6, r0, r2
	ldrh r1, [r6]
	adds r7, r0, 0
	cmp r1, 0
	beq _08122BDA
	mov r4, r8
	adds r4, 0x3
	lsls r0, r4, 24
	lsrs r5, r0, 24
	ldrh r2, [r6, 0x10]
	ldrh r3, [r6, 0x12]
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_806E420
	ldrh r0, [r6, 0x10]
	cmp r0, 0
	bne _08122B64
	movs r2, 0x7
	b _08122B76
	.align 2, 0
_08122B5C: .4byte gUnknown_02023A00
_08122B60: .4byte gStringVar1
_08122B64:
	ldr r1, _08122B88
	adds r0, r7, r1
	ldr r0, [r0]
	bl pokemon_ailments_get_primary
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _08122B8C
_08122B76:
	lsls r0, r4, 24
	lsrs r0, 24
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x3
	bl sub_806E104
	b _08122B96
	.align 2, 0
_08122B88: .4byte gUnknown_02023A14
_08122B8C:
	ldrb r2, [r6, 0xF]
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_806E1F4
_08122B96:
	mov r2, r10
	adds r6, r7, r2
	ldrh r0, [r6]
	ldrb r1, [r6, 0x1C]
	lsls r4, 24
	lsrs r4, 24
	ldr r2, _08122C0C
	adds r5, r7, r2
	str r5, [sp]
	movs r2, 0x3
	adds r3, r4, 0
	bl sub_806E35C
	mov r0, r9
	adds r1, r5, 0
	bl StringCopy
	mov r0, r9
	bl StringGetEnd10
	mov r0, r9
	bl sub_814A568
	adds r0, r4, 0
	movs r1, 0x3
	mov r2, r9
	bl box_print
	ldrh r2, [r6, 0x10]
	ldrh r3, [r6, 0x12]
	adds r0, r4, 0
	movs r1, 0x3
	bl sub_806E574
_08122BDA:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x2
	bls _08122B2E
	ldr r1, _08122C10
	ldr r2, [sp, 0x4]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	ldr r1, _08122C14
	str r1, [r0]
	movs r1, 0
	strh r1, [r0, 0x8]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08122C0C: .4byte gUnknown_02023A04
_08122C10: .4byte gTasks
_08122C14: .4byte sub_8122C18
	thumb_func_end sub_8122B10

	thumb_func_start sub_8122C18
sub_8122C18: @ 8122C18
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08122C58
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 17
	cmp r0, r1
	bne _08122C4E
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08122C5C
	str r0, [r4]
_08122C4E:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08122C58: .4byte gTasks
_08122C5C: .4byte sub_8122450
	thumb_func_end sub_8122C18

	thumb_func_start unref_sub_8122C60
unref_sub_8122C60: @ 8122C60
	push {r4,r5,lr}
	ldr r1, _08122C80
	movs r2, 0x99
	lsls r2, 2
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x7
	bls _08122C76
	b _08122D8A
_08122C76:
	lsls r0, 2
	ldr r1, _08122C84
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08122C80: .4byte 0x0201b000
_08122C84: .4byte _08122C88
	.align 2, 0
_08122C88:
	.4byte _08122CA8
	.4byte _08122CE8
	.4byte _08122CEE
	.4byte _08122D02
	.4byte _08122D2C
	.4byte _08122D32
	.4byte _08122D44
	.4byte _08122D5C
_08122CA8:
	ldr r0, _08122CD0
	adds r5, r4, r0
	movs r1, 0
	ldrsh r3, [r5, r1]
	ldr r0, _08122CD4
	ldrb r0, [r0]
	cmp r3, r0
	bge _08122CDC
	movs r2, 0x98
	lsls r2, 2
	adds r0, r4, r2
	ldrb r0, [r0]
	ldrb r1, [r5]
	movs r2, 0x64
	muls r2, r3
	ldr r3, _08122CD8
	adds r2, r3
	bl sub_806D90C
	b _08122D84
	.align 2, 0
_08122CD0: .4byte 0x00000266
_08122CD4: .4byte gPlayerPartyCount
_08122CD8: .4byte gPlayerParty
_08122CDC:
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _08122D50
_08122CE8:
	bl sub_806DA98
	b _08122D48
_08122CEE:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_806DC34
	movs r2, 0x99
	lsls r2, 2
	adds r1, r4, r2
	b _08122D50
_08122D02:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	ldr r2, _08122D28
	adds r5, r4, r2
	ldrb r1, [r5]
	bl sub_806BD58
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08122D84
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _08122D50
	.align 2, 0
_08122D28: .4byte 0x00000266
_08122D2C:
	bl sub_806E334
	b _08122D48
_08122D32:
	bl sub_806E0C4
	ldr r1, _08122D40
	movs r0, 0x99
	lsls r0, 2
	adds r1, r0
	b _08122D50
	.align 2, 0
_08122D40: .4byte 0x0201b000
_08122D44:
	bl sub_806BCE8
_08122D48:
	ldr r1, _08122D58
	movs r2, 0x99
	lsls r2, 2
	adds r1, r2
_08122D50:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08122D8A
	.align 2, 0
_08122D58: .4byte 0x0201b000
_08122D5C:
	ldr r0, _08122D80
	adds r5, r4, r0
	ldrb r0, [r5]
	bl sub_806B58C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08122D84
	movs r1, 0
	strh r1, [r5]
	movs r2, 0x99
	lsls r2, 2
	adds r0, r4, r2
	strh r1, [r0]
	movs r0, 0x1
	b _08122D8C
	.align 2, 0
_08122D80: .4byte 0x00000266
_08122D84:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_08122D8A:
	movs r0, 0
_08122D8C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8122C60

	thumb_func_start sub_8122D94
sub_8122D94: @ 8122D94
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08122DCC
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08122DD0
	adds r0, r1
	movs r1, 0x2D
	bl GetMonData
	adds r2, r0, 0
	cmp r2, 0
	bne _08122DE0
	ldr r1, _08122DD4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0x10]
	ldr r1, _08122DD8
	ldr r2, _08122DDC
	movs r0, 0
	movs r3, 0
	bl sub_806E750
	b _08122DFA
	.align 2, 0
_08122DCC: .4byte gUnknown_03005CE0
_08122DD0: .4byte gPlayerParty
_08122DD4: .4byte gTasks
_08122DD8: .4byte gUnknown_08401810
_08122DDC: .4byte gUnknown_084017F0
_08122DE0:
	ldr r1, _08122E00
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0, 0x10]
	ldr r1, _08122E04
	ldr r2, _08122E08
	movs r0, 0x1
	movs r3, 0
	bl sub_806E750
_08122DFA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08122E00: .4byte gTasks
_08122E04: .4byte gUnknown_08401810
_08122E08: .4byte gUnknown_084017F0
	thumb_func_end sub_8122D94

	thumb_func_start sub_8122E0C
sub_8122E0C: @ 8122E0C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08122E34
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08122E9C
	adds r0, r4, 0
	bl sub_806BD80
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _08122E38
	cmp r0, 0x2
	beq _08122E84
	b _08122E9C
	.align 2, 0
_08122E34: .4byte gPaletteFade
_08122E38:
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_806CA38
	ldr r1, _08122E70
	strb r0, [r1]
	ldrb r1, [r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08122E74
	adds r0, r1
	ldr r1, _08122E78
	bl GetMonNickname
	adds r0, r4, 0
	bl sub_8122D94
	ldr r1, _08122E7C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08122E80
	str r1, [r0]
	b _08122E9C
	.align 2, 0
_08122E70: .4byte gUnknown_03005CE0
_08122E74: .4byte gPlayerParty
_08122E78: .4byte gStringVar1
_08122E7C: .4byte gTasks
_08122E80: .4byte sub_8122EAC
_08122E84:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _08122EA4
	movs r0, 0xFF
	strb r0, [r1]
	ldr r1, _08122EA8
	movs r0, 0xFF
	strh r0, [r1]
	adds r0, r4, 0
	bl sub_8123138
_08122E9C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08122EA4: .4byte gUnknown_03005CE0
_08122EA8: .4byte gUnknown_0202E8CC
	thumb_func_end sub_8122E0C

	thumb_func_start sub_8122EAC
sub_8122EAC: @ 8122EAC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	adds r4, r7, 0
	ldr r0, _08122EE8
	ldrb r1, [r0, 0x7]
	movs r3, 0x80
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _08122F6A
	ldr r2, _08122EEC
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08122EF0
	bl GetMenuCursorPos
	lsls r0, 24
	cmp r0, 0
	beq _08122F6A
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	b _08122F6A
	.align 2, 0
_08122EE8: .4byte gPaletteFade
_08122EEC: .4byte gMain
_08122EF0:
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08122F12
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _08122F6A
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	b _08122F6A
_08122F12:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08122F5C
	movs r0, 0x5
	bl PlaySE
	ldr r1, _08122F50
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrb r4, [r0, 0x10]
	ldr r5, _08122F54
	ldr r6, _08122F58
	bl GetMenuCursorPos
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_806E81C
	adds r1, r0, 0
	adds r0, r7, 0
	bl _call_via_r1
	b _08122F6A
	.align 2, 0
_08122F50: .4byte gTasks
_08122F54: .4byte gUnknown_08401810
_08122F58: .4byte gUnknown_084017F0
_08122F5C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08122F6A
	adds r0, r4, 0
	bl sub_81230F4
_08122F6A:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8122EAC

	thumb_func_start sub_8122F70
sub_8122F70: @ 8122F70
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08122F88
	ldr r1, _08122F8C
	ldrb r1, [r1]
	strh r1, [r2]
	bl sub_8123138
	pop {r0}
	bx r0
	.align 2, 0
_08122F88: .4byte gUnknown_0202E8CC
_08122F8C: .4byte gUnknown_03005CE0
	thumb_func_end sub_8122F70

	thumb_func_start sub_8122F90
sub_8122F90: @ 8122F90
	push {r4,r5,lr}
	ldr r5, _08122FD8
	ldr r4, _08122FDC
_08122F96:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08122FF0
	ldrb r0, [r5]
	ldrb r1, [r4]
	bl sub_806C994
	ldrb r0, [r5]
	movs r1, 0
	bl sub_806BF74
	ldrb r1, [r4]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08122FE0
	adds r0, r1
	ldr r1, _08122FE4
	bl GetMonNickname
	ldr r1, _08122FE8
	ldrb r0, [r4]
	strb r0, [r1]
	ldrb r0, [r5]
	bl sub_8122D94
	ldr r0, _08122FEC
	bl SetMainCallback2
	b _08122FFC
	.align 2, 0
_08122FD8: .4byte 0x0201b260
_08122FDC: .4byte gUnknown_020384F0
_08122FE0: .4byte gPlayerParty
_08122FE4: .4byte gStringVar1
_08122FE8: .4byte gUnknown_03005CE0
_08122FEC: .4byte sub_806AEDC
_08122FF0:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08122F96
_08122FFC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8122F90

	thumb_func_start sub_8123004
sub_8123004: @ 8123004
	push {lr}
	ldr r2, _08123028
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r2, _0812302C
	movs r0, 0x6
	movs r1, 0xFF
	movs r3, 0x5
	bl sub_806AF4C
	ldr r0, _08123030
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08123028: .4byte gPaletteFade
_0812302C: .4byte sub_8122EAC
_08123030: .4byte sub_8122F90
	thumb_func_end sub_8123004

	thumb_func_start sub_8123034
sub_8123034: @ 8123034
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _0812309C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08123092
	ldr r2, _081230A0
	ldr r1, _081230A4
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0xE]
	lsls r1, 16
	asrs r1, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r4, [r0, 0x2E]
	lsls r4, 24
	lsrs r4, 24
	adds r0, r3, 0
	bl DestroyTask
	ldr r0, _081230A8
	ldr r1, _081230AC
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, _081230B0
	ldr r1, _081230B4
	ldrb r2, [r1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _081230B8
	str r5, [sp]
	adds r1, r4, 0
	bl sub_809D8BC
_08123092:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812309C: .4byte gPaletteFade
_081230A0: .4byte gSprites
_081230A4: .4byte gTasks
_081230A8: .4byte 0x0201b000
_081230AC: .4byte 0x00000262
_081230B0: .4byte gPlayerParty
_081230B4: .4byte gPlayerPartyCount
_081230B8: .4byte sub_8123004
	thumb_func_end sub_8123034

	thumb_func_start sub_81230BC
sub_81230BC: @ 81230BC
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _081230EC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081230F0
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081230EC: .4byte gTasks
_081230F0: .4byte sub_8123034
	thumb_func_end sub_81230BC

	thumb_func_start sub_81230F4
sub_81230F4: @ 81230F4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x14
	movs r1, 0xA
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_8072DEC
	movs r0, 0xF
	movs r1, 0
	bl sub_806D538
	ldr r1, _08123130
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08123134
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123130: .4byte gTasks
_08123134: .4byte sub_8122E0C
	thumb_func_end sub_81230F4

	thumb_func_start sub_8123138
sub_8123138: @ 8123138
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08123168
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0812316C
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123168: .4byte gTasks
_0812316C: .4byte sub_8123170
	thumb_func_end sub_8123138

	thumb_func_start sub_8123170
sub_8123170: @ 8123170
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0812319C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08123194
	ldr r0, _081231A0
	ldr r1, _081231A4
	str r1, [r0]
	ldr r0, _081231A8
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_08123194:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812319C: .4byte gPaletteFade
_081231A0: .4byte gUnknown_0300485C
_081231A4: .4byte sub_81231AC
_081231A8: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_8123170

	thumb_func_start sub_81231AC
sub_81231AC: @ 81231AC
	push {lr}
	bl pal_fill_black
	ldr r0, _081231C0
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_081231C0: .4byte sub_81231C4
	thumb_func_end sub_81231AC

	thumb_func_start sub_81231C4
sub_81231C4: @ 81231C4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081231E4
	adds r0, r4, 0
	bl DestroyTask
	bl ScriptContext2_Disable
	bl EnableBothScriptContexts
_081231E4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81231C4

	thumb_func_start sub_81231EC
sub_81231EC: @ 81231EC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08123210
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0812320A
	ldr r0, _08123214
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_0812320A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123210: .4byte gPaletteFade
_08123214: .4byte sub_8123244
	thumb_func_end sub_81231EC

	thumb_func_start sub_8123218
sub_8123218: @ 8123218
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	ldr r0, _08123240
	movs r1, 0x1
	bl CreateTask
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08123240: .4byte sub_81231EC
	thumb_func_end sub_8123218

	thumb_func_start sub_8123244
sub_8123244: @ 8123244
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	ldr r1, _08123268
	ldr r2, _0812326C
	adds r0, r1, r2
	ldrb r0, [r0]
	mov r9, r1
	cmp r0, 0x8
	bhi _08123298
	lsls r0, 2
	ldr r1, _08123270
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08123268: .4byte gMain
_0812326C: .4byte 0x0000043c
_08123270: .4byte _08123274
	.align 2, 0
_08123274:
	.4byte _08123298
	.4byte _08123384
	.4byte _081233E8
	.4byte _08123484
	.4byte _081234A0
	.4byte _08123504
	.4byte _08123598
	.4byte _08123678
	.4byte _081236B0
_08123298:
	movs r0, 0
	bl SetVBlankCallback
	bl remove_some_task
	movs r3, 0xC0
	lsls r3, 19
	movs r4, 0xC0
	lsls r4, 9
	add r0, sp, 0xC
	mov r9, r0
	add r2, sp, 0x8
	movs r6, 0
	ldr r1, _08123368
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _0812336C
	movs r0, 0x81
	lsls r0, 24
	mov r8, r0
_081232C0:
	strh r6, [r2]
	add r0, sp, 0x8
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _081232C0
	strh r6, [r2]
	add r2, sp, 0x8
	str r2, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r4, 1
	mov r2, r8
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0xE0
	lsls r0, 19
	movs r3, 0x80
	lsls r3, 3
	movs r4, 0
	str r4, [sp, 0xC]
	ldr r2, _08123368
	mov r1, r9
	str r1, [r2]
	str r0, [r2, 0x4]
	lsrs r0, r3, 2
	movs r1, 0x85
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r1, 0xA0
	lsls r1, 19
	add r0, sp, 0x8
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	lsrs r3, 1
	movs r4, 0x81
	lsls r4, 24
	orrs r3, r4
	str r3, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r1, _08123370
	ldr r0, _08123374
	str r0, [r1]
	adds r3, r0, 0
	ldr r5, _08123378
	ldr r0, _0812337C
	mov r9, r0
	add r1, sp, 0x8
	movs r7, 0
	movs r6, 0x80
	lsls r6, 5
	ldr r0, _0812336C
	mov r8, r0
_08123338:
	strh r7, [r1]
	add r0, sp, 0x8
	str r0, [r2]
	str r3, [r2, 0x4]
	mov r0, r8
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	adds r3, r6
	subs r5, r6
	cmp r5, r6
	bhi _08123338
	strh r7, [r1]
	add r1, sp, 0x8
	str r1, [r2]
	str r3, [r2, 0x4]
	lsrs r0, r5, 1
	orrs r0, r4
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r1, _08123380
	add r1, r9
	ldrb r0, [r1]
	adds r0, 0x1
	b _0812370C
	.align 2, 0
_08123368: .4byte 0x040000d4
_0812336C: .4byte 0x81000800
_08123370: .4byte gUnknown_02039274
_08123374: .4byte 0x02017000
_08123378: .4byte 0x000010fc
_0812337C: .4byte gMain
_08123380: .4byte 0x0000043c
_08123384:
	bl ResetSpriteData
	bl ResetTasks
	bl FreeAllSpritePalettes
	bl ResetPaletteFade
	bl sub_807C828
	movs r4, 0
	ldr r0, _081233D4
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0xF0
	movs r2, 0
_081233A4:
	lsls r0, r4, 2
	adds r0, r1, r0
	str r2, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x13
	bls _081233A4
	bl InitMapMusic
	bl ResetMapMusic
	ldr r2, _081233D8
	ldr r1, _081233DC
	movs r0, 0
	strh r0, [r1]
	strh r0, [r2]
	ldr r1, _081233E0
	ldr r2, _081233E4
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	b _0812370C
	.align 2, 0
_081233D4: .4byte gUnknown_08396FC4
_081233D8: .4byte gSpriteCoordOffsetX
_081233DC: .4byte gSpriteCoordOffsetY
_081233E0: .4byte gMain
_081233E4: .4byte 0x0000043c
_081233E8:
	movs r4, 0
	ldr r5, _08123454
_081233EC:
	lsls r0, r4, 3
	adds r0, r5
	bl LoadCompressedObjectPic
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _081233EC
	ldr r0, _08123458
	bl LoadSpritePalettes
	ldr r0, _0812345C
	ldr r4, _08123460
	adds r1, r4, 0
	bl sub_800D238
	ldr r0, _08123464
	movs r2, 0xB4
	lsls r2, 1
	adds r1, r4, r2
	bl sub_800D238
	ldr r0, _08123468
	movs r2, 0xA5
	lsls r2, 3
	adds r1, r4, r2
	bl sub_800D238
	ldr r0, _0812346C
	ldr r1, _08123470
	adds r4, r1
	adds r1, r4, 0
	bl sub_800D238
	ldr r0, _08123474
	movs r1, 0
	movs r2, 0x80
	bl LoadPalette
	ldr r0, _08123478
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r1, _0812347C
	ldr r2, _08123480
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	b _0812370C
	.align 2, 0
_08123454: .4byte gUnknown_08401CF8
_08123458: .4byte gUnknown_08401D18
_0812345C: .4byte gCableCarMtChimneyTilemap
_08123460: .4byte 0x02019000
_08123464: .4byte gCableCarTreeTilemap
_08123468: .4byte gCableCarMountainTilemap
_0812346C: .4byte gCableCarPylonStemTilemap
_08123470: .4byte 0x000009d8
_08123474: .4byte gCableCarBG_Pal
_08123478: .4byte gCableCarBG_Gfx
_0812347C: .4byte gMain
_08123480: .4byte 0x0000043c
_08123484:
	bl sub_8124118
	bl RunTasks
	ldr r1, _08123498
	ldr r0, _0812349C
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	b _0812370C
	.align 2, 0
_08123498: .4byte gMain
_0812349C: .4byte 0x0000043c
_081234A0:
	ldr r0, _081234B4
	ldr r0, [r0]
	ldrb r0, [r0, 0x2]
	cmp r0, 0x7
	bne _081234BC
	ldr r1, _081234B8
	add r1, r9
	ldrb r0, [r1]
	adds r0, 0x1
	b _0812370C
	.align 2, 0
_081234B4: .4byte gUnknown_02039274
_081234B8: .4byte 0x0000043c
_081234BC:
	ldr r0, _081234FC
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0xF0
	ldr r0, [r1]
	cmp r0, 0
	bne _081234CC
	b _0812370E
_081234CC:
	movs r4, 0
	adds r3, r1, 0
	movs r5, 0xD
	negs r5, r5
_081234D4:
	lsls r0, r4, 2
	adds r0, r3, r0
	ldr r2, [r0]
	cmp r2, 0
	beq _081234E6
	ldrb r1, [r2, 0x5]
	adds r0, r5, 0
	ands r0, r1
	strb r0, [r2, 0x5]
_081234E6:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x13
	bls _081234D4
	ldr r1, _08123500
	add r1, r9
	ldrb r0, [r1]
	adds r0, 0x1
	b _0812370C
	.align 2, 0
_081234FC: .4byte gUnknown_08396FC4
_08123500: .4byte 0x0000043c
_08123504:
	ldr r0, _08123578
	ldr r5, _0812357C
	movs r1, 0x20
	str r1, [sp]
	movs r1, 0xF
	str r1, [sp, 0x4]
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0x11
	bl sub_8124F08
	ldr r0, _08123580
	movs r2, 0xF0
	lsls r2, 2
	adds r1, r5, r2
	movs r2, 0x1E
	str r2, [sp]
	movs r2, 0x14
	mov r9, r2
	str r2, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_8124F08
	ldr r0, _08123584
	mov r8, r0
	ldr r0, [r0]
	ldr r6, _08123588
	adds r0, r6
	ldr r1, _0812358C
	movs r2, 0x5
	str r2, [sp]
	movs r4, 0x2
	str r4, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_8124F08
	mov r1, r8
	ldr r0, [r1]
	adds r0, r6
	movs r2, 0x87
	lsls r2, 4
	adds r5, r2
	str r4, [sp]
	mov r1, r9
	str r1, [sp, 0x4]
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0x2
	bl sub_8124F08
	ldr r1, _08123590
	ldr r2, _08123594
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	b _0812370C
	.align 2, 0
_08123578: .4byte 0x0600e800
_0812357C: .4byte 0x02019168
_08123580: .4byte 0x0600f000
_08123584: .4byte gUnknown_02039274
_08123588: .4byte 0x000008fc
_0812358C: .4byte gCableCarPylonHookTilemapEntries
_08123590: .4byte gMain
_08123594: .4byte 0x0000043c
_08123598:
	ldr r0, _08123664
	ldrb r0, [r0]
	bl sub_81248AC
	ldr r0, _08123668
	mov r8, r0
	ldr r0, [r0]
	adds r0, 0xFC
	ldr r4, _0812366C
	movs r6, 0xC
	str r6, [sp]
	movs r5, 0x3
	str r5, [sp, 0x4]
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0xE
	bl sub_8124F08
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0xFC
	adds r1, r4, 0
	adds r1, 0x48
	str r6, [sp]
	str r5, [sp, 0x4]
	movs r2, 0xC
	movs r3, 0x11
	bl sub_8124F08
	mov r2, r8
	ldr r0, [r2]
	adds r0, 0xFC
	adds r1, r4, 0
	adds r1, 0x90
	str r6, [sp]
	str r5, [sp, 0x4]
	movs r2, 0x18
	movs r3, 0x14
	bl sub_8124F08
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0xFC
	movs r2, 0x90
	negs r2, r2
	adds r2, r4
	mov r9, r2
	str r6, [sp]
	str r5, [sp, 0x4]
	mov r1, r9
	movs r2, 0
	movs r3, 0x11
	bl sub_8124F08
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0xFC
	subs r4, 0x48
	str r6, [sp]
	str r5, [sp, 0x4]
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x14
	bl sub_8124F08
	mov r2, r8
	ldr r0, [r2]
	adds r0, 0xFC
	str r6, [sp]
	str r5, [sp, 0x4]
	mov r1, r9
	movs r2, 0xC
	movs r3, 0x14
	bl sub_8124F08
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0xFC
	str r6, [sp]
	str r5, [sp, 0x4]
	adds r1, r4, 0
	movs r2, 0xC
	movs r3, 0x17
	bl sub_8124F08
	mov r2, r8
	ldr r0, [r2]
	adds r0, 0xFC
	str r6, [sp]
	str r5, [sp, 0x4]
	mov r1, r9
	movs r2, 0x18
	movs r3, 0x17
	bl sub_8124F08
	ldr r1, _08123670
	ldr r0, _08123674
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	b _0812370C
	.align 2, 0
_08123664: .4byte gUnknown_0202E8CC
_08123668: .4byte gUnknown_02039274
_0812366C: .4byte 0x02019090
_08123670: .4byte gMain
_08123674: .4byte 0x0000043c
_08123678:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r1, 0x3
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _081236A4
	movs r1, 0x1
	bl FadeInNewBGM
	movs r0, 0x1
	bl sub_8123FBC
	ldr r1, _081236A8
	ldr r2, _081236AC
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	b _0812370C
	.align 2, 0
_081236A4: .4byte 0x000001a9
_081236A8: .4byte gMain
_081236AC: .4byte 0x0000043c
_081236B0:
	ldr r3, _081236E4
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _081236E8
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r0, _081236EC
	bl SetVBlankCallback
	ldr r0, _081236F0
	bl SetMainCallback2
	ldr r0, _081236F4
	movs r1, 0
	bl CreateTask
	ldr r0, _081236F8
	ldrh r0, [r0]
	cmp r0, 0
	bne _08123700
	ldr r0, _081236FC
	b _08123702
	.align 2, 0
_081236E4: .4byte 0x04000208
_081236E8: .4byte 0x04000200
_081236EC: .4byte sub_8123C40
_081236F0: .4byte mainloop
_081236F4: .4byte sub_8123878
_081236F8: .4byte gUnknown_0202E8CC
_081236FC: .4byte sub_81239E4
_08123700:
	ldr r0, _0812371C
_08123702:
	movs r1, 0x1
	bl CreateTask
	ldr r1, _08123720
	ldr r1, [r1]
_0812370C:
	strb r0, [r1]
_0812370E:
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812371C: .4byte sub_8123AF8
_08123720: .4byte gUnknown_02039274
	thumb_func_end sub_8123244

	thumb_func_start mainloop
mainloop: @ 8123724
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	bl MapMusicMain
	pop {r0}
	bx r0
	thumb_func_end mainloop

	thumb_func_start sub_8123740
sub_8123740: @ 8123740
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	movs r4, 0
	movs r0, 0
	bl sub_8123FBC
	ldr r0, _08123854
	strh r4, [r0]
	movs r0, 0
	bl sub_807C9B4
	add r7, sp, 0x4
	ldr r0, _08123858
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0xF0
	movs r2, 0
_08123766:
	lsls r0, r4, 2
	adds r0, r1, r0
	str r2, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x13
	bls _08123766
	bl ResetTasks
	bl ResetSpriteData
	bl ResetPaletteFade
	ldr r2, _0812385C
	movs r3, 0x80
	lsls r3, 10
	movs r5, 0
	ldr r1, _08123860
	movs r4, 0x80
	lsls r4, 5
	ldr r6, _08123864
	movs r0, 0x85
	lsls r0, 24
	mov r12, r0
_08123798:
	str r5, [sp]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _08123798
	str r5, [sp]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _08123868
	movs r0, 0
	str r0, [r1]
	movs r3, 0xC0
	lsls r3, 19
	movs r4, 0xC0
	lsls r4, 9
	adds r2, r7, 0
	movs r6, 0
	ldr r1, _08123860
	movs r5, 0x80
	lsls r5, 5
	ldr r0, _0812386C
	mov r12, r0
	movs r0, 0x81
	lsls r0, 24
	mov r8, r0
_081237E0:
	strh r6, [r2]
	str r2, [r1]
	str r3, [r1, 0x4]
	mov r0, r12
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _081237E0
	strh r6, [r7]
	str r7, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r4, 1
	mov r2, r8
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0xE0
	lsls r0, 19
	movs r3, 0x80
	lsls r3, 3
	movs r4, 0
	str r4, [sp]
	ldr r2, _08123860
	mov r1, sp
	str r1, [r2]
	str r0, [r2, 0x4]
	lsrs r0, r3, 2
	movs r1, 0x85
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r0, 0xA0
	lsls r0, 19
	strh r4, [r7]
	str r7, [r2]
	str r0, [r2, 0x4]
	lsrs r3, 1
	movs r0, 0x81
	lsls r0, 24
	orrs r3, r0
	str r3, [r2, 0x8]
	ldr r0, [r2, 0x8]
	bl warp_in
	ldr r0, _08123870
	str r4, [r0]
	ldr r0, _08123874
	bl SetMainCallback2
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08123854: .4byte gSpriteCoordOffsetX
_08123858: .4byte gUnknown_08396FC4
_0812385C: .4byte 0x02000000
_08123860: .4byte 0x040000d4
_08123864: .4byte 0x85000400
_08123868: .4byte gUnknown_02039274
_0812386C: .4byte 0x81000800
_08123870: .4byte gUnknown_0300485C
_08123874: .4byte CB2_LoadMap
	thumb_func_end sub_8123740

	thumb_func_start sub_8123878
sub_8123878: @ 8123878
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	ldr r5, _081238A4
	ldr r3, [r5]
	ldrh r0, [r3, 0x6]
	adds r0, 0x1
	strh r0, [r3, 0x6]
	ldrb r2, [r3, 0x1]
	adds r7, r5, 0
	cmp r2, 0x2
	beq _0812397E
	cmp r2, 0x2
	bgt _081238A8
	cmp r2, 0
	beq _081238B6
	cmp r2, 0x1
	beq _081238D0
	b _081239D6
	.align 2, 0
_081238A4: .4byte gUnknown_02039274
_081238A8:
	cmp r2, 0x3
	bne _081238AE
	b _081239A4
_081238AE:
	cmp r2, 0xFF
	bne _081238B4
	b _081239BC
_081238B4:
	b _081239D6
_081238B6:
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r3, 0x4]
	cmp r0, r1
	beq _081238C2
	b _081239D6
_081238C2:
	ldrb r0, [r3, 0x2]
	bl DoWeatherEffect
	ldr r1, [r5]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	b _081239D6
_081238D0:
	ldrb r0, [r3, 0x2]
	cmp r0, 0x2
	beq _08123924
	cmp r0, 0x7
	beq _081238DC
	b _081239D6
_081238DC:
	ldr r0, _08123920
	ldr r0, [r0]
	adds r2, r0, 0
	adds r2, 0xF0
	ldr r0, [r2]
	cmp r0, 0
	beq _081239D6
	ldrb r1, [r0, 0x5]
	movs r0, 0xC
	ands r0, r1
	cmp r0, 0
	beq _081239D6
	adds r3, r2, 0
	movs r5, 0xD
	negs r5, r5
_081238FA:
	lsls r0, r4, 2
	adds r0, r3, r0
	ldr r2, [r0]
	cmp r2, 0
	beq _0812390C
	ldrb r1, [r2, 0x5]
	adds r0, r5, 0
	ands r0, r1
	strb r0, [r2, 0x5]
_0812390C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x13
	bls _081238FA
	ldr r1, [r7]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	b _081239D6
	.align 2, 0
_08123920: .4byte gUnknown_08396FC4
_08123924:
	ldr r0, _08123938
	ldr r2, [r0]
	movs r1, 0xDA
	lsls r1, 3
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0812393C
	strb r0, [r3, 0x1]
	b _081239D6
	.align 2, 0
_08123938: .4byte gUnknown_08396FC4
_0812393C:
	ldrh r1, [r3, 0x6]
	ldrh r0, [r3, 0x4]
	adds r0, 0x8
	cmp r1, r0
	blt _081239D6
	adds r6, r2, 0
	adds r6, 0xF0
	movs r5, 0x1
	movs r7, 0x5
	negs r7, r7
_08123950:
	lsls r0, r4, 2
	adds r0, r6, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _08123972
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r1, r2, 29
	lsrs r1, 31
	eors r1, r5
	ands r1, r5
	lsls r1, 2
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_08123972:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x13
	bls _08123950
	b _081239D6
_0812397E:
	lsls r1, r0, 16
	ldr r0, _081239A0
	cmp r1, r0
	bne _081239D6
	movs r0, 0x3
	strb r0, [r3, 0x1]
	subs r0, 0x4
	str r4, [sp]
	movs r1, 0x3
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r0, 0x4
	bl FadeOutBGM
	b _081239D6
	.align 2, 0
_081239A0: .4byte 0x023a0000
_081239A4:
	ldr r0, _081239B8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081239D6
	movs r0, 0xFF
	strb r0, [r3, 0x1]
	b _081239D6
	.align 2, 0
_081239B8: .4byte gPaletteFade
_081239BC:
	movs r0, 0
	bl SetVBlankCallback
	adds r0, r6, 0
	bl DestroyTask
	ldr r0, [r5]
	ldrb r0, [r0]
	bl DestroyTask
	ldr r0, _081239E0
	bl SetMainCallback2
_081239D6:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081239E0: .4byte sub_8123740
	thumb_func_end sub_8123878

	thumb_func_start sub_81239E4
sub_81239E4: @ 81239E4
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r6, _08123A38
	ldr r1, [r6]
	ldrb r0, [r1, 0x1]
	cmp r0, 0xFF
	beq _08123AC0
	ldrb r0, [r1, 0x14]
	subs r0, 0x1
	strb r0, [r1, 0x14]
	ldr r1, [r6]
	ldrh r0, [r1, 0x6]
	movs r3, 0x1
	ands r0, r3
	cmp r0, 0
	bne _08123A0A
	ldrb r0, [r1, 0x15]
	subs r0, 0x1
	strb r0, [r1, 0x15]
_08123A0A:
	ldr r2, [r6]
	ldrh r0, [r2, 0x6]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _08123A24
	ldrb r0, [r2, 0xC]
	subs r0, 0x1
	strb r0, [r2, 0xC]
	ldr r1, [r6]
	ldrb r0, [r1, 0xD]
	subs r0, 0x1
	strb r0, [r1, 0xD]
_08123A24:
	ldr r0, [r6]
	ldrb r1, [r0, 0x14]
	cmp r1, 0x20
	beq _08123A74
	cmp r1, 0x20
	bgt _08123A3C
	cmp r1, 0x10
	beq _08123A90
	b _08123AC0
	.align 2, 0
_08123A38: .4byte gUnknown_02039274
_08123A3C:
	cmp r1, 0x28
	beq _08123A60
	cmp r1, 0xAF
	bne _08123AC0
	ldr r1, _08123A5C
	adds r0, r1
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0xA
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0x16
	bl sub_8124E7C
	b _08123AC0
	.align 2, 0
_08123A5C: .4byte 0x000008fc
_08123A60:
	ldr r1, _08123A70
	adds r0, r1
	movs r1, 0x2
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0x3
	b _08123A82
	.align 2, 0
_08123A70: .4byte 0x000008fc
_08123A74:
	ldr r1, _08123A8C
	adds r0, r1
	str r3, [sp]
	movs r1, 0x2
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0x2
_08123A82:
	movs r3, 0
	bl sub_8124E7C
	b _08123AC0
	.align 2, 0
_08123A8C: .4byte 0x000008fc
_08123A90:
	ldr r5, _08123AE8
	adds r0, r5
	ldr r1, _08123AEC
	movs r2, 0x5
	str r2, [sp]
	movs r4, 0x2
	str r4, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_8124F08
	ldr r0, [r6]
	adds r0, r5
	ldr r1, _08123AF0
	str r4, [sp]
	movs r2, 0x1E
	str r2, [sp, 0x4]
	movs r2, 0
	movs r3, 0x2
	bl sub_8124F08
	ldr r1, [r6]
	movs r0, 0x40
	strb r0, [r1, 0x15]
_08123AC0:
	bl sub_812453C
	ldr r3, _08123AF4
	movs r0, 0
	ldrsh r2, [r3, r0]
	adds r1, r2, 0x1
	adds r0, r1, 0
	cmp r1, 0
	bge _08123AD6
	adds r0, r2, 0
	adds r0, 0x80
_08123AD6:
	asrs r0, 7
	lsls r0, 7
	subs r0, r1, r0
	strh r0, [r3]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08123AE8: .4byte 0x000008fc
_08123AEC: .4byte gCableCarPylonHookTilemapEntries
_08123AF0: .4byte 0x020199d8
_08123AF4: .4byte gSpriteCoordOffsetX
	thumb_func_end sub_81239E4

	thumb_func_start sub_8123AF8
sub_8123AF8: @ 8123AF8
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r6, _08123B4C
	ldr r1, [r6]
	ldrb r0, [r1, 0x1]
	cmp r0, 0xFF
	beq _08123BEE
	ldrb r0, [r1, 0x14]
	adds r0, 0x1
	strb r0, [r1, 0x14]
	ldr r2, [r6]
	ldrh r0, [r2, 0x6]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08123B1E
	ldrb r0, [r2, 0x15]
	adds r0, 0x1
	strb r0, [r2, 0x15]
_08123B1E:
	ldr r2, [r6]
	ldrh r0, [r2, 0x6]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _08123B38
	ldrb r0, [r2, 0xC]
	adds r0, 0x1
	strb r0, [r2, 0xC]
	ldr r1, [r6]
	ldrb r0, [r1, 0xD]
	adds r0, 0x1
	strb r0, [r1, 0xD]
_08123B38:
	ldr r3, [r6]
	ldrb r0, [r3, 0x14]
	cmp r0, 0x20
	beq _08123BB0
	cmp r0, 0x20
	bgt _08123B50
	cmp r0, 0x10
	beq _08123B78
	b _08123BEE
	.align 2, 0
_08123B4C: .4byte gUnknown_02039274
_08123B50:
	cmp r0, 0x28
	beq _08123BDC
	cmp r0, 0xB0
	bne _08123BEE
	ldr r1, _08123B70
	adds r0, r3, r1
	ldr r1, _08123B74
	movs r2, 0x2
	str r2, [sp]
	movs r2, 0x1E
	str r2, [sp, 0x4]
	movs r2, 0
	movs r3, 0x2
	bl sub_8124F08
	b _08123BEE
	.align 2, 0
_08123B70: .4byte 0x000008fc
_08123B74: .4byte 0x020199d8
_08123B78:
	ldr r5, _08123BAC
	adds r0, r3, r5
	movs r1, 0x3
	str r1, [sp]
	movs r4, 0x2
	str r4, [sp, 0x4]
	movs r1, 0
	movs r2, 0x2
	movs r3, 0
	bl sub_8124E7C
	ldr r0, [r6]
	adds r0, r5
	str r4, [sp]
	movs r1, 0xA
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0x16
	bl sub_8124E7C
	ldr r1, [r6]
	movs r0, 0xC0
	strb r0, [r1, 0x15]
	b _08123BEE
	.align 2, 0
_08123BAC: .4byte 0x000008fc
_08123BB0:
	ldr r1, _08123BD4
	ldrh r2, [r1]
	movs r4, 0x90
	lsls r4, 4
	adds r0, r3, r4
	strh r2, [r0]
	ldrh r2, [r1, 0x2]
	adds r4, 0x2
	adds r0, r3, r4
	strh r2, [r0]
	ldrh r2, [r1, 0xA]
	adds r4, 0x3E
	adds r0, r3, r4
	strh r2, [r0]
	ldrh r1, [r1, 0xC]
	ldr r2, _08123BD8
	b _08123BEA
	.align 2, 0
_08123BD4: .4byte gCableCarPylonHookTilemapEntries + 0x4
_08123BD8: .4byte 0x00000942
_08123BDC:
	ldr r2, _08123C08
	ldrh r1, [r2]
	ldr r4, _08123C0C
	adds r0, r3, r4
	strh r1, [r0]
	ldrh r1, [r2, 0xA]
	ldr r2, _08123C10
_08123BEA:
	adds r0, r3, r2
	strh r1, [r0]
_08123BEE:
	bl sub_8124598
	ldr r0, _08123C14
	ldr r1, [r0]
	ldrh r0, [r1, 0x6]
	ldrh r1, [r1, 0x4]
	cmp r0, r1
	bcs _08123C1C
	ldr r4, _08123C18
	movs r1, 0
	ldrsh r0, [r4, r1]
	b _08123C26
	.align 2, 0
_08123C08: .4byte gCableCarPylonHookTilemapEntries + 0x8
_08123C0C: .4byte 0x00000904
_08123C10: .4byte 0x00000944
_08123C14: .4byte gUnknown_02039274
_08123C18: .4byte gSpriteCoordOffsetX
_08123C1C:
	ldr r0, _08123C38
	ldr r4, [r0]
	ldr r2, _08123C3C
	adds r4, r2
	ldrh r0, [r4]
_08123C26:
	adds r0, 0xF7
	movs r1, 0xF8
	bl __modsi3
	strh r0, [r4]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08123C38: .4byte gUnknown_08396FC4
_08123C3C: .4byte 0x000006fc
	thumb_func_end sub_8123AF8

	thumb_func_start sub_8123C40
sub_8123C40: @ 8123C40
	push {r4,lr}
	ldr r1, _08123C9C
	ldr r0, _08123CA0
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0xFC
	str r0, [r1]
	ldr r0, _08123CA4
	str r0, [r1, 0x4]
	ldr r3, _08123CA8
	str r3, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r4, _08123CAC
	adds r0, r2, r4
	str r0, [r1]
	ldr r0, _08123CB0
	str r0, [r1, 0x4]
	str r3, [r1, 0x8]
	ldr r0, [r1, 0x8]
	subs r1, 0xB8
	ldrb r0, [r2, 0x14]
	strh r0, [r1]
	adds r1, 0x2
	ldrb r0, [r2, 0x15]
	strh r0, [r1]
	subs r1, 0xA
	ldrb r0, [r2, 0xC]
	strh r0, [r1]
	adds r1, 0x2
	ldrb r0, [r2, 0xD]
	strh r0, [r1]
	subs r1, 0x6
	ldrb r0, [r2, 0x8]
	strh r0, [r1]
	adds r1, 0x2
	ldrb r0, [r2, 0x9]
	strh r0, [r1]
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123C9C: .4byte 0x040000d4
_08123CA0: .4byte gUnknown_02039274
_08123CA4: .4byte 0x0600e000
_08123CA8: .4byte 0x80000400
_08123CAC: .4byte 0x000008fc
_08123CB0: .4byte 0x0600f800
	thumb_func_end sub_8123C40

	thumb_func_start nullsub_76
nullsub_76: @ 8123CB4
	bx lr
	thumb_func_end nullsub_76

	thumb_func_start sub_8123CB8
sub_8123CB8: @ 8123CB8
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _08123D20
	ldr r6, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0xFF
	beq _08123D84
	ldr r0, _08123D24
	ldrh r0, [r0]
	cmp r0, 0
	bne _08123D34
	movs r0, 0x6
	ldrsh r4, [r6, r0]
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _08123CE2
	ldr r1, _08123D28
	bl __addsf3
_08123CE2:
	ldr r1, _08123D2C
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x2E]
	subs r1, r0
	strh r1, [r5, 0x20]
	movs r1, 0x6
	ldrsh r4, [r6, r1]
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _08123D0A
	ldr r1, _08123D28
	bl __addsf3
_08123D0A:
	ldr r1, _08123D30
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x30]
	subs r1, r0
	strh r1, [r5, 0x22]
	b _08123D84
	.align 2, 0
_08123D20: .4byte gUnknown_02039274
_08123D24: .4byte gUnknown_0202E8CC
_08123D28: .4byte 0x47800000
_08123D2C: .4byte 0x3e0f5c29
_08123D30: .4byte 0x3d89374c
_08123D34:
	movs r0, 0x6
	ldrsh r4, [r6, r0]
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _08123D48
	ldr r1, _08123D8C
	bl __addsf3
_08123D48:
	ldr r1, _08123D90
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x2E]
	adds r0, r1
	strh r0, [r5, 0x20]
	movs r0, 0x6
	ldrsh r4, [r6, r0]
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _08123D70
	ldr r1, _08123D8C
	bl __addsf3
_08123D70:
	ldr r1, _08123D94
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x30]
	adds r0, r1
	strh r0, [r5, 0x22]
_08123D84:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08123D8C: .4byte 0x47800000
_08123D90: .4byte 0x3e0f5c29
_08123D94: .4byte 0x3d89374c
	thumb_func_end sub_8123CB8

	thumb_func_start sub_8123D98
sub_8123D98: @ 8123D98
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _08123E04
	ldr r6, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0xFF
	bne _08123DA8
	b _08123EB0
_08123DA8:
	ldr r0, _08123E08
	ldrh r0, [r0]
	cmp r0, 0
	bne _08123E18
	movs r0, 0x6
	ldrsh r4, [r6, r0]
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _08123DC4
	ldr r1, _08123E0C
	bl __addsf3
_08123DC4:
	ldr r1, _08123E10
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x2E]
	subs r1, r0
	strh r1, [r5, 0x20]
	movs r1, 0x6
	ldrsh r4, [r6, r1]
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _08123DEC
	ldr r1, _08123E0C
	bl __addsf3
_08123DEC:
	ldr r1, _08123E14
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x30]
	subs r1, r0
	strh r1, [r5, 0x22]
	b _08123E68
	.align 2, 0
_08123E04: .4byte gUnknown_02039274
_08123E08: .4byte gUnknown_0202E8CC
_08123E0C: .4byte 0x47800000
_08123E10: .4byte 0x3e0f5c29
_08123E14: .4byte 0x3d89374c
_08123E18:
	movs r0, 0x6
	ldrsh r4, [r6, r0]
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _08123E2C
	ldr r1, _08123E8C
	bl __addsf3
_08123E2C:
	ldr r1, _08123E90
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x2E]
	adds r0, r1
	strh r0, [r5, 0x20]
	movs r0, 0x6
	ldrsh r4, [r6, r0]
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _08123E54
	ldr r1, _08123E8C
	bl __addsf3
_08123E54:
	ldr r1, _08123E94
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x30]
	adds r0, r1
	strh r0, [r5, 0x22]
_08123E68:
	movs r0, 0x32
	ldrsh r2, [r5, r0]
	cmp r2, 0
	bne _08123E98
	movs r0, 0x11
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x34]
	adds r1, r0, 0x1
	strh r1, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	ble _08123EB0
	strh r2, [r5, 0x34]
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	b _08123EB0
	.align 2, 0
_08123E8C: .4byte 0x47800000
_08123E90: .4byte 0x3e0f5c29
_08123E94: .4byte 0x3d89374c
_08123E98:
	movs r2, 0
	movs r0, 0x10
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x34]
	adds r1, r0, 0x1
	strh r1, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	ble _08123EB0
	strh r2, [r5, 0x34]
	strh r2, [r5, 0x32]
_08123EB0:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8123D98

	thumb_func_start sub_8123EB8
sub_8123EB8: @ 8123EB8
	push {lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _08123EE8
	adds r0, r2, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 1
	ldrh r3, [r2, 0x20]
	adds r0, r3
	strh r0, [r2, 0x20]
	ldrh r1, [r2, 0x22]
	adds r1, 0x10
	adds r0, r2, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	strh r0, [r2, 0x22]
_08123EE8:
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x32
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _08123F3E
	movs r0, 0x30
	ldrsh r1, [r2, r0]
	cmp r1, 0
	beq _08123F08
	cmp r1, 0x1
	beq _08123F12
	b _08123F30
_08123F08:
	ldrh r0, [r2, 0x20]
	adds r0, 0x1
	strh r0, [r2, 0x20]
	ldrh r0, [r2, 0x2E]
	b _08123F22
_08123F12:
	ldrh r0, [r2, 0x2E]
	ands r0, r1
	cmp r0, 0
	beq _08123F30
	ldrh r0, [r2, 0x20]
	adds r0, 0x1
	strh r0, [r2, 0x20]
	ldrh r0, [r2, 0x20]
_08123F22:
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08123F30
	ldrh r0, [r2, 0x22]
	adds r0, 0x1
	strh r0, [r2, 0x22]
_08123F30:
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	cmp r0, 0xA0
	ble _08123F3E
	adds r0, r2, 0
	bl DestroySprite
_08123F3E:
	pop {r0}
	bx r0
	thumb_func_end sub_8123EB8

	thumb_func_start sub_8123F44
sub_8123F44: @ 8123F44
	push {lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _08123F62
	ldrh r1, [r2, 0x22]
	adds r1, 0x10
	adds r0, r2, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	strh r0, [r2, 0x22]
_08123F62:
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x32
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _08123FB8
	movs r0, 0x30
	ldrsh r1, [r2, r0]
	cmp r1, 0
	beq _08123F82
	cmp r1, 0x1
	beq _08123F8C
	b _08123FAA
_08123F82:
	ldrh r0, [r2, 0x20]
	subs r0, 0x1
	strh r0, [r2, 0x20]
	ldrh r0, [r2, 0x2E]
	b _08123F9C
_08123F8C:
	ldrh r0, [r2, 0x2E]
	ands r0, r1
	cmp r0, 0
	beq _08123FAA
	ldrh r0, [r2, 0x20]
	subs r0, 0x1
	strh r0, [r2, 0x20]
	ldrh r0, [r2, 0x20]
_08123F9C:
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08123FAA
	ldrh r0, [r2, 0x22]
	subs r0, 0x1
	strh r0, [r2, 0x22]
_08123FAA:
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	cmp r0, 0x4F
	bgt _08123FB8
	adds r0, r2, 0
	bl DestroySprite
_08123FB8:
	pop {r0}
	bx r0
	thumb_func_end sub_8123F44

	thumb_func_start sub_8123FBC
sub_8123FBC: @ 8123FBC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08123FCA
	cmp r0, 0x1
	beq _08124024
_08123FCA:
	ldr r1, _08124020
	movs r0, 0
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	subs r1, 0xA
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	subs r1, 0x46
	strh r0, [r1]
	adds r1, 0xE
	strh r0, [r1]
	subs r1, 0x2
	strh r0, [r1]
	subs r1, 0x2
	strh r0, [r1]
	subs r1, 0x2
	strh r0, [r1]
	adds r1, 0x14
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	subs r1, 0x6
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	subs r1, 0x6
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	subs r1, 0x6
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r1, 0x3E
	strh r0, [r1]
	b _081240EE
	.align 2, 0
_08124020: .4byte REG_WININ
_08124024:
	ldr r0, _08124060
	movs r3, 0
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	subs r0, 0xA
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	ldr r0, _08124064
	ldrh r0, [r0]
	cmp r0, 0
	bne _0812406C
	ldr r1, _08124068
	ldr r2, [r1]
	movs r0, 0xB0
	strb r0, [r2, 0x14]
	ldr r2, [r1]
	movs r0, 0x10
	strb r0, [r2, 0x15]
	ldr r0, [r1]
	strb r3, [r0, 0xC]
	ldr r2, [r1]
	movs r0, 0x50
	b _08124082
	.align 2, 0
_08124060: .4byte REG_WININ
_08124064: .4byte gUnknown_0202E8CC
_08124068: .4byte gUnknown_02039274
_0812406C:
	ldr r1, _081240F4
	ldr r2, [r1]
	movs r0, 0x60
	strb r0, [r2, 0x14]
	ldr r2, [r1]
	movs r0, 0xE8
	strb r0, [r2, 0x15]
	ldr r0, [r1]
	strb r3, [r0, 0xC]
	ldr r2, [r1]
	movs r0, 0x4
_08124082:
	strb r0, [r2, 0xD]
	ldr r0, [r1]
	strb r3, [r0, 0x9]
	ldr r0, [r1]
	strb r3, [r0, 0x9]
	adds r2, r1, 0
	ldr r1, _081240F8
	ldr r2, [r2]
	ldrb r0, [r2, 0x14]
	strh r0, [r1]
	adds r1, 0x2
	ldrb r0, [r2, 0x15]
	strh r0, [r1]
	ldr r0, _081240FC
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r1, _08124100
	ldrb r0, [r2, 0xC]
	strh r0, [r1]
	adds r1, 0x2
	ldrb r0, [r2, 0xD]
	strh r0, [r1]
	subs r1, 0x6
	ldrb r0, [r2, 0x8]
	strh r0, [r1]
	adds r1, 0x2
	ldrb r0, [r2, 0x9]
	strh r0, [r1]
	subs r1, 0xA
	ldr r2, _08124104
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _08124108
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0812410C
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08124110
	movs r3, 0xFC
	lsls r3, 6
	adds r2, r3, 0
	strh r2, [r0]
	subs r1, 0xC
	movs r3, 0xFA
	lsls r3, 5
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _08124114
	strh r2, [r0]
_081240EE:
	pop {r0}
	bx r0
	.align 2, 0
_081240F4: .4byte gUnknown_02039274
_081240F8: .4byte REG_BG3HOFS
_081240FC: .4byte REG_BG2HOFS
_08124100: .4byte REG_BG1HOFS
_08124104: .4byte 0x00003c01
_08124108: .4byte 0x00003d02
_0812410C: .4byte 0x00003e03
_08124110: .4byte REG_BG3CNT
_08124114: .4byte REG_BLDCNT
	thumb_func_end sub_8123FBC

	thumb_func_start sub_8124118
sub_8124118: @ 8124118
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	ldr r1, _0812422C
	add r0, sp, 0x8
	movs r2, 0x2
	bl memcpy
	bl Random
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	add r6, sp, 0xC
	ldr r1, _08124230
	adds r0, r6, 0
	movs r2, 0x4
	bl memcpy
	add r5, sp, 0x10
	ldr r1, _08124234
	adds r0, r5, 0
	movs r2, 0x8
	bl memcpy
	add r4, sp, 0x18
	ldr r1, _08124238
	adds r0, r4, 0
	movs r2, 0x4
	bl memcpy
	ldr r0, _0812423C
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x1C]
	str r1, [sp, 0x20]
	ldr r0, _08124240
	ldrh r0, [r0]
	mov r8, r6
	mov r10, r5
	cmp r0, 0
	beq _08124176
	cmp r0, 0x1
	beq _08124258
_08124176:
	ldr r0, _08124244
	ldrb r0, [r0, 0x8]
	add r0, sp
	adds r0, 0x8
	ldrb r0, [r0]
	ldr r1, _08124248
	movs r2, 0x66
	str r2, [sp]
	movs r2, 0xC8
	movs r3, 0x49
	bl AddPseudoFieldObject
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x40
	beq _081241BE
	ldr r0, _0812424C
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x8
	orrs r0, r2
	strb r0, [r1, 0x5]
	movs r0, 0x8
	strh r0, [r1, 0x24]
	movs r0, 0x10
	strh r0, [r1, 0x26]
	movs r0, 0xC8
	strh r0, [r1, 0x2E]
	movs r0, 0x49
	strh r0, [r1, 0x30]
_081241BE:
	ldr r4, _08124250
	adds r0, r4, 0
	movs r1, 0xB0
	movs r2, 0x2B
	movs r3, 0x67
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _0812424C
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r5
	movs r1, 0x20
	strh r1, [r0, 0x26]
	strh r1, [r0, 0x24]
	movs r1, 0xB0
	strh r1, [r0, 0x2E]
	movs r1, 0x2B
	strh r1, [r0, 0x30]
	adds r4, 0x18
	adds r0, r4, 0
	movs r1, 0xC8
	movs r2, 0x63
	movs r3, 0x65
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r5
	movs r1, 0x8
	strh r1, [r0, 0x24]
	movs r1, 0x4
	strh r1, [r0, 0x26]
	movs r1, 0xC8
	strh r1, [r0, 0x2E]
	movs r1, 0x63
	strh r1, [r0, 0x30]
	ldr r2, _08124254
	ldr r1, [r2]
	movs r0, 0x7
	strb r0, [r1, 0x2]
	ldr r1, [r2]
	movs r0, 0xAF
	lsls r0, 1
	strh r0, [r1, 0x4]
	movs r0, 0x2
	bl sub_807C9B4
	b _0812431E
	.align 2, 0
_0812422C: .4byte gCableCarPlayerGraphicsIDs
_08124230: .4byte gMtChimneyHikerGraphicsIDs
_08124234: .4byte gMtChimneyHikerCoords
_08124238: .4byte gMtChimneyHikerMovementDelayTable
_0812423C: .4byte gUnknown_08401D9C
_08124240: .4byte gUnknown_0202E8CC
_08124244: .4byte gSaveBlock2
_08124248: .4byte sub_8123D98
_0812424C: .4byte gSprites
_08124250: .4byte gSpriteTemplate_8401D40
_08124254: .4byte gUnknown_02039274
_08124258:
	ldr r7, _081243EC
	ldr r0, [r7]
	adds r0, 0xFC
	ldr r1, _081243F0
	movs r2, 0xC
	str r2, [sp]
	movs r2, 0x3
	str r2, [sp, 0x4]
	movs r2, 0x18
	movs r3, 0x1A
	bl sub_8124F08
	ldr r0, _081243F4
	ldrb r0, [r0, 0x8]
	add r0, sp
	adds r0, 0x8
	ldrb r0, [r0]
	ldr r1, _081243F8
	movs r2, 0x66
	str r2, [sp]
	movs r2, 0x80
	movs r3, 0x27
	bl AddPseudoFieldObject
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x40
	beq _081242B8
	ldr r0, _081243FC
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x8
	orrs r0, r2
	strb r0, [r1, 0x5]
	movs r0, 0x8
	strh r0, [r1, 0x24]
	movs r0, 0x10
	strh r0, [r1, 0x26]
	movs r0, 0x80
	strh r0, [r1, 0x2E]
	movs r0, 0x27
	strh r0, [r1, 0x30]
_081242B8:
	ldr r4, _08124400
	adds r0, r4, 0
	movs r1, 0x68
	movs r2, 0x9
	movs r3, 0x67
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _081243FC
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r5
	movs r1, 0x20
	strh r1, [r0, 0x26]
	strh r1, [r0, 0x24]
	movs r1, 0x68
	strh r1, [r0, 0x2E]
	movs r1, 0x9
	strh r1, [r0, 0x30]
	adds r4, 0x18
	adds r0, r4, 0
	movs r1, 0x80
	movs r2, 0x41
	movs r3, 0x65
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r5
	movs r1, 0x8
	strh r1, [r0, 0x24]
	movs r1, 0x4
	strh r1, [r0, 0x26]
	movs r1, 0x80
	strh r1, [r0, 0x2E]
	movs r1, 0x41
	strh r1, [r0, 0x30]
	ldr r1, [r7]
	movs r0, 0x2
	strb r0, [r1, 0x2]
	ldr r1, [r7]
	ldr r0, _08124404
	strh r0, [r1, 0x4]
	movs r0, 0x7
	bl sub_807C9B4
_0812431E:
	movs r4, 0
	ldr r5, _081243FC
_08124322:
	lsls r1, r4, 20
	movs r0, 0xC0
	lsls r0, 15
	adds r1, r0
	asrs r1, 16
	lsls r2, r4, 19
	ldr r3, _08124408
	adds r2, r3
	asrs r2, 16
	ldr r0, _0812440C
	movs r3, 0x68
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r5
	movs r1, 0x8
	strh r1, [r0, 0x24]
	strh r1, [r0, 0x26]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x8
	bls _08124322
	movs r0, 0x3F
	mov r4, r9
	ands r0, r4
	cmp r0, 0
	bne _08124458
	mov r0, r9
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	add r0, r8
	ldrb r0, [r0]
	ldr r5, _08124410
	ldrh r4, [r5]
	lsls r4, 2
	add r1, sp, 0x1C
	adds r1, r4, r1
	ldr r1, [r1]
	mov r3, r10
	adds r2, r3, r4
	movs r3, 0
	ldrsh r2, [r2, r3]
	mov r3, sp
	adds r3, 0x12
	adds r3, r4
	movs r4, 0
	ldrsh r3, [r3, r4]
	movs r4, 0x6A
	str r4, [sp]
	bl AddPseudoFieldObject
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x40
	beq _08124458
	ldr r1, _081243FC
	lsls r2, r6, 4
	adds r0, r2, r6
	lsls r0, 2
	adds r4, r0, r1
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4, 0x5]
	adds r0, r4, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	negs r0, r0
	strh r0, [r4, 0x24]
	adds r0, r4, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r0, [r5]
	mov r8, r2
	cmp r0, 0
	bne _0812441A
	movs r7, 0x1
	mov r5, r9
	ands r5, r7
	cmp r5, 0
	beq _08124414
	adds r0, r4, 0
	movs r1, 0x6
	b _08124428
	.align 2, 0
_081243EC: .4byte gUnknown_02039274
_081243F0: .4byte 0x02019048
_081243F4: .4byte gSaveBlock2
_081243F8: .4byte sub_8123D98
_081243FC: .4byte gSprites
_08124400: .4byte gSpriteTemplate_8401D40
_08124404: .4byte 0x00000109
_08124408: .4byte 0xfff80000
_0812440C: .4byte gSpriteTemplate_8401D70
_08124410: .4byte gUnknown_0202E8CC
_08124414:
	adds r0, r4, 0
	movs r1, 0x7
	b _0812443A
_0812441A:
	movs r7, 0x1
	mov r5, r9
	ands r5, r7
	cmp r5, 0
	beq _08124436
	adds r0, r4, 0
	movs r1, 0x7
_08124428:
	bl StartSpriteAnim
	strh r7, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	adds r0, 0x2
	strh r0, [r4, 0x22]
	b _08124440
_08124436:
	adds r0, r4, 0
	movs r1, 0x6
_0812443A:
	bl StartSpriteAnim
	strh r5, [r4, 0x30]
_08124440:
	ldr r0, _08124468
	mov r2, r8
	adds r1, r2, r6
	lsls r1, 2
	adds r1, r0
	movs r0, 0x3
	mov r3, r9
	ands r0, r3
	add r0, sp
	adds r0, 0x18
	ldrb r0, [r0]
	strh r0, [r1, 0x32]
_08124458:
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08124468: .4byte gSprites
	thumb_func_end sub_8124118

	thumb_func_start sub_812446C
sub_812446C: @ 812446C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r3, 0
	mov r9, r3
	ldr r2, _08124530
	ldr r0, [r2]
	ldrb r1, [r0, 0x1B]
	adds r1, 0x2
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 26
	lsrs r0, 24
	mov r12, r0
_0812448E:
	movs r6, 0
	lsls r0, r3, 1
	adds r1, r3, 0x3
	adds r2, r3, 0x6
	adds r4, r3, 0x1
	str r4, [sp]
	adds r0, r3
	lsls r0, 3
	mov r10, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	mov r8, r0
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 3
	str r0, [sp, 0x4]
_081244B0:
	ldr r7, _08124530
	ldr r5, [r7]
	lsls r3, r6, 1
	mov r0, r10
	adds r2, r3, r0
	adds r4, r5, 0
	adds r4, 0x22
	adds r2, r4, r2
	mov r1, r12
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	lsls r1, 1
	ldr r7, _08124534
	adds r1, r7
	ldrh r0, [r1]
	strh r0, [r2]
	mov r0, r8
	adds r1, r3, r0
	adds r1, r4, r1
	mov r7, r9
	lsls r2, r7, 1
	ldr r7, _08124534
	adds r0, r2, r7
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, [sp, 0x4]
	adds r3, r0
	adds r4, r3
	ldr r1, _08124538
	adds r2, r1
	ldrh r0, [r2]
	strh r0, [r4]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xB
	bls _081244B0
	ldr r4, [sp]
	lsls r0, r4, 24
	lsrs r3, r0, 24
	cmp r3, 0x2
	bls _0812448E
	ldrb r0, [r5, 0x1B]
	adds r0, 0x1
	movs r1, 0x3
	bl __modsi3
	strb r0, [r5, 0x1B]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08124530: .4byte gUnknown_02039274
_08124534: .4byte 0x02019000
_08124538: .4byte 0x02019048
	thumb_func_end sub_812446C

	thumb_func_start sub_812453C
sub_812453C: @ 812453C
	push {r4,r5,lr}
	ldr r5, _08124594
	ldr r4, [r5]
	ldrb r0, [r4, 0x1C]
	adds r0, 0x1
	movs r1, 0x60
	bl __modsi3
	strb r0, [r4, 0x1C]
	ldr r1, [r5]
	ldrb r0, [r1, 0x1F]
	ldrb r2, [r1, 0x1D]
	subs r0, r2
	strb r0, [r1, 0x8]
	ldr r2, [r5]
	adds r0, r2, 0
	adds r0, 0x20
	ldrb r0, [r0]
	ldrb r1, [r2, 0x1E]
	subs r0, r1
	strb r0, [r2, 0x9]
	ldr r1, [r5]
	ldrb r0, [r1, 0x1D]
	adds r0, 0x1
	strb r0, [r1, 0x1D]
	ldr r2, [r5]
	ldrb r0, [r2, 0x1D]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08124580
	ldrb r0, [r2, 0x1E]
	adds r0, 0x1
	strb r0, [r2, 0x1E]
_08124580:
	ldr r0, [r5]
	ldrb r0, [r0, 0x1D]
	cmp r0, 0x10
	bls _0812458C
	bl sub_81245F4
_0812458C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08124594: .4byte gUnknown_02039274
	thumb_func_end sub_812453C

	thumb_func_start sub_8124598
sub_8124598: @ 8124598
	push {r4,r5,lr}
	ldr r5, _081245F0
	ldr r4, [r5]
	ldrb r0, [r4, 0x1C]
	adds r0, 0x1
	movs r1, 0x60
	bl __modsi3
	strb r0, [r4, 0x1C]
	ldr r1, [r5]
	ldrb r0, [r1, 0x1D]
	ldrb r2, [r1, 0x1F]
	adds r0, r2
	strb r0, [r1, 0x8]
	ldr r1, [r5]
	adds r2, r1, 0
	adds r2, 0x20
	ldrb r0, [r1, 0x1E]
	ldrb r2, [r2]
	adds r0, r2
	strb r0, [r1, 0x9]
	ldr r1, [r5]
	ldrb r0, [r1, 0x1D]
	adds r0, 0x1
	strb r0, [r1, 0x1D]
	ldr r2, [r5]
	ldrb r0, [r2, 0x1D]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _081245DC
	ldrb r0, [r2, 0x1E]
	adds r0, 0x1
	strb r0, [r2, 0x1E]
_081245DC:
	ldr r0, [r5]
	ldrb r0, [r0, 0x1D]
	cmp r0, 0x10
	bls _081245E8
	bl sub_812476C
_081245E8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081245F0: .4byte gUnknown_02039274
	thumb_func_end sub_8124598

	thumb_func_start sub_81245F4
sub_81245F4: @ 81245F4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r0, 0
	mov r12, r0
	ldr r2, _0812475C
	ldr r0, [r2]
	mov r1, r12
	strb r1, [r0, 0x1E]
	strb r1, [r0, 0x1D]
	ldr r1, [r2]
	ldrb r0, [r1, 0x8]
	strb r0, [r1, 0x1F]
	ldr r0, [r2]
	ldrb r1, [r0, 0x9]
	adds r0, 0x20
	strb r1, [r0]
	ldr r4, [r2]
	ldrb r1, [r4, 0x19]
	adds r3, r1, 0
	adds r3, 0x1E
	adds r0, r3, 0
	mov r9, r2
	asrs r0, 5
	lsls r0, 5
	subs r0, r3, r0
	strb r0, [r4, 0x19]
	mov r2, r9
	ldr r1, [r2]
	ldrb r0, [r1, 0x18]
	subs r0, 0x2
	strb r0, [r1, 0x18]
	ldr r0, [r2]
	ldrb r1, [r0, 0x1A]
	adds r2, r1, 0
	adds r2, 0x17
	adds r0, r2, 0
	ldr r3, _08124760
	mov r10, r3
	asrs r0, 5
	lsls r0, 5
	subs r0, r2, r0
	mov r4, r10
	strb r0, [r4]
	ldr r7, _08124764
	ldr r0, _08124768
	mov r8, r0
_08124658:
	mov r1, r9
	ldr r3, [r1]
	ldrb r0, [r3, 0x19]
	strb r0, [r7]
	mov r2, r10
	ldrb r0, [r2]
	mov r4, r12
	adds r1, r0, r4
	adds r0, r1, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r1, r0
	mov r1, r8
	strb r0, [r1]
	ldrb r2, [r7]
	lsls r2, 1
	ldrb r0, [r1]
	lsls r0, 6
	adds r2, r0
	adds r6, r3, 0
	adds r6, 0xFC
	adds r2, r6, r2
	ldrb r1, [r3, 0x18]
	lsls r1, 1
	mov r4, r12
	lsls r0, r4, 1
	add r0, r12
	lsls r5, r0, 3
	adds r1, r5
	adds r4, r3, 0
	adds r4, 0x22
	adds r1, r4, r1
	ldrh r0, [r1]
	strh r0, [r2]
	ldrb r1, [r7]
	adds r2, r1, 0x1
	adds r0, r2, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r2, r0
	strb r0, [r7]
	ldrb r1, [r7]
	lsls r1, 1
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 6
	adds r1, r0
	adds r1, r6, r1
	ldrb r0, [r3, 0x18]
	adds r0, 0x1
	lsls r0, 1
	adds r0, r5
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, r12
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	cmp r0, 0x8
	bls _08124658
	ldr r4, _08124764
	mov r5, r9
	ldr r3, [r5]
	ldrb r1, [r3, 0x19]
	adds r2, r1, 0
	adds r2, 0x1E
	adds r0, r2, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r2, r0
	strb r0, [r4]
	adds r0, r3, 0
	adds r0, 0xFC
	ldrb r2, [r4]
	movs r1, 0x2
	str r1, [sp]
	movs r6, 0x20
	str r6, [sp, 0x4]
	movs r1, 0
	movs r3, 0
	bl sub_8124E7C
	ldr r1, [r5]
	ldrb r0, [r1, 0x18]
	cmp r0, 0
	bne _0812474C
	ldrb r2, [r1, 0x1A]
	adds r3, r2, 0
	adds r3, 0x1D
	adds r0, r3, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r3, r0
	strb r0, [r1, 0x1A]
	mov r3, r9
	ldr r1, [r3]
	movs r0, 0xC
	strb r0, [r1, 0x18]
	bl sub_812446C
	mov r4, r9
	ldr r1, [r4]
	ldrb r3, [r1, 0x1A]
	adds r4, r3, 0x1
	adds r0, r4, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r4, r0
	ldr r2, _08124764
	strb r0, [r2]
	adds r0, r1, 0
	adds r0, 0xFC
	ldrb r3, [r2]
	str r6, [sp]
	movs r1, 0x9
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	bl sub_8124E7C
_0812474C:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812475C: .4byte gUnknown_02039274
_08124760: .4byte gUnknown_0203927A
_08124764: .4byte gUnknown_02039278
_08124768: .4byte gUnknown_02039279
	thumb_func_end sub_81245F4

	thumb_func_start sub_812476C
sub_812476C: @ 812476C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r0, 0
	mov r12, r0
	ldr r2, _0812489C
	ldr r0, [r2]
	mov r1, r12
	strb r1, [r0, 0x1E]
	strb r1, [r0, 0x1D]
	ldr r1, [r2]
	ldrb r0, [r1, 0x8]
	strb r0, [r1, 0x1F]
	ldr r0, [r2]
	ldrb r1, [r0, 0x9]
	adds r0, 0x20
	strb r1, [r0]
	ldr r4, [r2]
	ldrb r1, [r4, 0x19]
	adds r3, r1, 0x2
	adds r0, r3, 0
	mov r9, r2
	asrs r0, 5
	lsls r0, 5
	subs r0, r3, r0
	strb r0, [r4, 0x19]
	mov r2, r9
	ldr r1, [r2]
	ldrb r0, [r1, 0x18]
	adds r0, 0x2
	strb r0, [r1, 0x18]
	ldr r1, _081248A0
	ldr r0, [r2]
	ldrb r0, [r0, 0x1A]
	strb r0, [r1]
	ldr r4, _081248A4
	mov r10, r4
	ldr r7, _081248A8
	mov r8, r10
_081247C0:
	mov r0, r9
	ldr r3, [r0]
	ldrb r0, [r3, 0x19]
	strb r0, [r7]
	ldr r1, _081248A0
	ldrb r0, [r1]
	mov r2, r12
	adds r1, r0, r2
	adds r0, r1, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r1, r0
	mov r4, r8
	strb r0, [r4]
	ldrb r2, [r7]
	lsls r2, 1
	ldrb r0, [r4]
	lsls r0, 6
	adds r2, r0
	adds r6, r3, 0
	adds r6, 0xFC
	adds r2, r6, r2
	ldrb r1, [r3, 0x18]
	lsls r1, 1
	mov r4, r12
	lsls r0, r4, 1
	add r0, r12
	lsls r5, r0, 3
	adds r1, r5
	adds r4, r3, 0
	adds r4, 0x22
	adds r1, r4, r1
	ldrh r0, [r1]
	strh r0, [r2]
	ldrb r1, [r7]
	adds r2, r1, 0x1
	adds r0, r2, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r2, r0
	strb r0, [r7]
	ldrb r1, [r7]
	lsls r1, 1
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 6
	adds r1, r0
	adds r1, r6, r1
	ldrb r0, [r3, 0x18]
	adds r0, 0x1
	lsls r0, 1
	adds r0, r5
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, r12
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	cmp r0, 0x8
	bls _081247C0
	mov r4, r9
	ldr r1, [r4]
	ldrb r2, [r1, 0x1A]
	adds r3, r2, 0
	adds r3, 0x17
	adds r0, r3, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r3, r0
	mov r2, r10
	strb r0, [r2]
	adds r0, r1, 0
	adds r0, 0xFC
	ldrb r2, [r1, 0x19]
	mov r1, r10
	ldrb r3, [r1]
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0x9
	str r1, [sp, 0x4]
	movs r1, 0
	bl sub_8124E7C
	ldr r1, [r4]
	ldrb r0, [r1, 0x18]
	cmp r0, 0xA
	bne _0812488C
	ldrb r2, [r1, 0x1A]
	adds r3, r2, 0x3
	adds r0, r3, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r3, r0
	strb r0, [r1, 0x1A]
	mov r2, r9
	ldr r1, [r2]
	movs r0, 0xFE
	strb r0, [r1, 0x18]
	bl sub_812446C
_0812488C:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812489C: .4byte gUnknown_02039274
_081248A0: .4byte gUnknown_0203927D
_081248A4: .4byte gUnknown_0203927C
_081248A8: .4byte gUnknown_0203927B
	thumb_func_end sub_812476C

	thumb_func_start sub_81248AC
sub_81248AC: @ 81248AC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _081248BA
	cmp r0, 0x1
	beq _081248E4
_081248BA:
	ldr r1, _081248E0
	ldr r2, [r1]
	movs r3, 0
	movs r0, 0x2
	strb r0, [r2, 0x1B]
	ldr r0, [r1]
	strb r3, [r0, 0x19]
	ldr r2, [r1]
	movs r0, 0x14
	strb r0, [r2, 0x1A]
	ldr r1, [r1]
	movs r0, 0xC
	strb r0, [r1, 0x18]
	bl sub_812446C
	bl sub_81245F4
	b _08124906
	.align 2, 0
_081248E0: .4byte gUnknown_02039274
_081248E4:
	ldr r1, _08124914
	ldr r2, [r1]
	movs r0, 0x2
	strb r0, [r2, 0x1B]
	ldr r2, [r1]
	movs r0, 0x1C
	strb r0, [r2, 0x19]
	ldr r2, [r1]
	movs r0, 0x14
	strb r0, [r2, 0x1A]
	ldr r1, [r1]
	movs r0, 0x4
	strb r0, [r1, 0x18]
	bl sub_812446C
	bl sub_812476C
_08124906:
	ldr r0, _08124914
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x1C]
	pop {r0}
	bx r0
	.align 2, 0
_08124914: .4byte gUnknown_02039274
	thumb_func_end sub_81248AC

	thumb_func_start sub_8124918
sub_8124918: @ 8124918
	push {lr}
	movs r1, 0
	strb r1, [r0]
	strh r1, [r0, 0x2]
	adds r0, 0x4
	movs r2, 0xC0
	bl memset
	pop {r0}
	bx r0
	thumb_func_end sub_8124918

	thumb_func_start sub_812492C
sub_812492C: @ 812492C
	push {r4-r7,lr}
	adds r3, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	cmp r6, 0xF
	bhi _08124948
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r5, r3, r0
	ldrb r7, [r5, 0x4]
	lsrs r0, r7, 7
	cmp r0, 0
	beq _0812494C
_08124948:
	movs r0, 0xFF
	b _081249AA
_0812494C:
	ldrh r0, [r2]
	movs r4, 0
	strh r0, [r5, 0x8]
	ldrh r0, [r2, 0x2]
	strh r0, [r5, 0xA]
	ldrb r0, [r2, 0x4]
	strb r0, [r5, 0xC]
	ldrb r0, [r2, 0x5]
	strb r0, [r5, 0xD]
	ldrb r0, [r2, 0x6]
	strb r0, [r5, 0xE]
	ldrb r3, [r2, 0x7]
	lsls r0, r3, 27
	lsrs r0, 27
	ldrb r2, [r5, 0xF]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	movs r0, 0x60
	ands r0, r3
	movs r2, 0x61
	negs r2, r2
	ands r1, r2
	orrs r1, r0
	lsls r3, 24
	asrs r3, 31
	lsls r3, 7
	movs r0, 0x7F
	ands r1, r0
	orrs r1, r3
	strb r1, [r5, 0xF]
	subs r0, 0xFF
	ands r0, r7
	movs r2, 0x80
	orrs r0, r2
	strb r0, [r5, 0x4]
	strb r4, [r5, 0x6]
	strb r4, [r5, 0x5]
	lsls r1, 24
	cmp r1, 0
	bge _081249A4
	movs r0, 0xFF
	b _081249A6
_081249A4:
	movs r0, 0x1
_081249A6:
	strb r0, [r5, 0x7]
	adds r0, r6, 0
_081249AA:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_812492C

	thumb_func_start unref_sub_81249B0
unref_sub_81249B0: @ 81249B0
	push {r4,lr}
	adds r2, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r4, r1, 0
	cmp r4, 0xF
	bhi _081249DC
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r1, r2, r0
	ldrb r0, [r1, 0x4]
	lsrs r0, 7
	cmp r0, 0
	beq _081249DC
	adds r0, r1, 0x4
	movs r1, 0
	movs r2, 0xC
	bl memset
	adds r0, r4, 0
	b _081249DE
_081249DC:
	movs r0, 0xFF
_081249DE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_81249B0

	thumb_func_start sub_81249E4
sub_81249E4: @ 81249E4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r5, r0, 0
	movs r0, 0
	mov r12, r0
	ldrb r1, [r5, 0x8]
	cmp r12, r1
	bcc _081249FC
	b _08124B94
_081249FC:
	movs r7, 0x1F
	ldr r0, _08124A2C
	mov r10, r0
	movs r1, 0x7D
	negs r1, r1
	mov r9, r1
	movs r0, 0x1F
	mov r8, r0
_08124A0C:
	ldrh r0, [r5, 0x6]
	add r0, r12
	lsls r0, 1
	ldr r1, _08124A30
	adds r3, r0, r1
	ldr r1, _08124A34
	adds r6, r0, r1
	ldrb r0, [r5]
	lsls r0, 25
	lsrs r0, 25
	cmp r0, 0x1
	beq _08124A38
	cmp r0, 0x2
	beq _08124A96
	b _08124B82
	.align 2, 0
_08124A2C: .4byte 0xfffffc1f
_08124A30: .4byte gPlttBufferFaded
_08124A34: .4byte gPlttBufferUnfaded
_08124A38:
	ldr r0, [r3]
	lsls r2, r0, 27
	lsrs r0, r2, 27
	movs r1, 0x3
	ldrsb r1, [r5, r1]
	adds r0, r1
	cmp r0, 0x1F
	bhi _08124A5A
	lsrs r0, r2, 27
	adds r0, r1
	ands r0, r7
	ldrb r2, [r3]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
_08124A5A:
	ldr r0, [r3]
	lsls r2, r0, 22
	lsrs r0, r2, 27
	movs r1, 0x3
	ldrsb r1, [r5, r1]
	adds r0, r1
	cmp r0, 0x1F
	bhi _08124A7E
	lsrs r0, r2, 27
	adds r0, r1
	mov r1, r8
	ands r0, r1
	lsls r0, 5
	ldrh r2, [r3]
	mov r1, r10
	ands r1, r2
	orrs r1, r0
	strh r1, [r3]
_08124A7E:
	ldr r0, [r3]
	lsls r2, r0, 17
	lsrs r0, r2, 27
	movs r1, 0x3
	ldrsb r1, [r5, r1]
	adds r0, r1
	cmp r0, 0x1F
	bls _08124A90
	b _08124B82
_08124A90:
	lsrs r0, r2, 27
	adds r0, r1
	b _08124B74
_08124A96:
	movs r0, 0x3
	ldrsb r0, [r5, r0]
	cmp r0, 0
	bge _08124B08
	ldr r0, [r3]
	lsls r4, r0, 27
	lsrs r1, r4, 27
	movs r2, 0x3
	ldrsb r2, [r5, r2]
	adds r1, r2
	ldr r0, [r6]
	lsls r0, 27
	lsrs r0, 27
	cmp r1, r0
	blt _08124AC6
	lsrs r0, r4, 27
	adds r0, r2
	ands r0, r7
	ldrb r2, [r3]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
_08124AC6:
	ldr r0, [r3]
	lsls r4, r0, 22
	lsrs r1, r4, 27
	movs r2, 0x3
	ldrsb r2, [r5, r2]
	adds r1, r2
	ldr r0, [r6]
	lsls r0, 22
	lsrs r0, 27
	cmp r1, r0
	blt _08124AF0
	lsrs r0, r4, 27
	adds r0, r2
	mov r1, r8
	ands r0, r1
	lsls r0, 5
	ldrh r2, [r3]
	mov r1, r10
	ands r1, r2
	orrs r1, r0
	strh r1, [r3]
_08124AF0:
	ldr r0, [r3]
	lsls r4, r0, 17
	lsrs r1, r4, 27
	movs r2, 0x3
	ldrsb r2, [r5, r2]
	adds r1, r2
	ldr r0, [r6]
	lsls r0, 17
	lsrs r0, 27
	cmp r1, r0
	blt _08124B82
	b _08124B70
_08124B08:
	ldr r0, [r3]
	lsls r4, r0, 27
	lsrs r1, r4, 27
	movs r2, 0x3
	ldrsb r2, [r5, r2]
	adds r1, r2
	ldr r0, [r6]
	lsls r0, 27
	lsrs r0, 27
	cmp r1, r0
	bgt _08124B30
	lsrs r0, r4, 27
	adds r0, r2
	ands r0, r7
	ldrb r2, [r3]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
_08124B30:
	ldr r0, [r3]
	lsls r4, r0, 22
	lsrs r1, r4, 27
	movs r2, 0x3
	ldrsb r2, [r5, r2]
	adds r1, r2
	ldr r0, [r6]
	lsls r0, 22
	lsrs r0, 27
	cmp r1, r0
	bgt _08124B5A
	lsrs r0, r4, 27
	adds r0, r2
	mov r1, r8
	ands r0, r1
	lsls r0, 5
	ldrh r2, [r3]
	mov r1, r10
	ands r1, r2
	orrs r1, r0
	strh r1, [r3]
_08124B5A:
	ldr r0, [r3]
	lsls r4, r0, 17
	lsrs r1, r4, 27
	movs r2, 0x3
	ldrsb r2, [r5, r2]
	adds r1, r2
	ldr r0, [r6]
	lsls r0, 17
	lsrs r0, 27
	cmp r1, r0
	bgt _08124B82
_08124B70:
	lsrs r0, r4, 27
	adds r0, r2
_08124B74:
	ands r0, r7
	lsls r0, 2
	ldrb r2, [r3, 0x1]
	mov r1, r9
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x1]
_08124B82:
	mov r0, r12
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	ldrb r0, [r5, 0x8]
	cmp r12, r0
	bcs _08124B94
	b _08124A0C
_08124B94:
	ldrb r1, [r5, 0x2]
	adds r0, r1, 0x1
	strb r0, [r5, 0x2]
	ldrb r0, [r5, 0xB]
	lsls r0, 27
	lsls r1, 24
	asrs r0, 3
	cmp r1, r0
	beq _08124BAA
	movs r0, 0
	b _08124BDE
_08124BAA:
	movs r0, 0
	strb r0, [r5, 0x2]
	movs r0, 0x3
	ldrsb r0, [r5, r0]
	negs r0, r0
	strb r0, [r5, 0x3]
	ldrb r2, [r5]
	movs r1, 0x7F
	movs r0, 0x7F
	ands r0, r2
	cmp r0, 0x1
	bne _08124BCA
	lsls r0, r2, 25
	lsrs r0, 25
	adds r0, 0x1
	b _08124BD0
_08124BCA:
	lsls r0, r2, 25
	lsrs r0, 25
	subs r0, 0x1
_08124BD0:
	ands r0, r1
	movs r1, 0x80
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r5]
	movs r0, 0x1
_08124BDE:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_81249E4

	thumb_func_start sub_8124BEC
sub_8124BEC: @ 8124BEC
	push {r4,r5,lr}
	adds r3, r0, 0
	movs r2, 0
	ldrb r0, [r3]
	lsls r0, 25
	lsrs r0, 25
	cmp r0, 0x1
	beq _08124C02
	cmp r0, 0x2
	beq _08124C30
	b _08124C6A
_08124C02:
	ldrb r0, [r3, 0x8]
	cmp r2, r0
	bcs _08124C22
	ldr r4, _08124C2C
_08124C0A:
	ldrh r0, [r3, 0x6]
	adds r0, r2
	lsls r0, 1
	adds r0, r4
	ldrh r1, [r3, 0x4]
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	ldrb r0, [r3, 0x8]
	cmp r2, r0
	bcc _08124C0A
_08124C22:
	ldrb r2, [r3]
	lsls r1, r2, 25
	lsrs r1, 25
	adds r1, 0x1
	b _08124C5C
	.align 2, 0
_08124C2C: .4byte gPlttBufferFaded
_08124C30:
	ldrb r0, [r3, 0x8]
	cmp r2, r0
	bcs _08124C54
	ldr r5, _08124C74
	ldr r4, _08124C78
_08124C3A:
	ldrh r0, [r3, 0x6]
	adds r0, r2
	lsls r0, 1
	adds r1, r0, r5
	adds r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	ldrb r0, [r3, 0x8]
	cmp r2, r0
	bcc _08124C3A
_08124C54:
	ldrb r2, [r3]
	lsls r1, r2, 25
	lsrs r1, 25
	subs r1, 0x1
_08124C5C:
	movs r0, 0x7F
	ands r1, r0
	movs r0, 0x80
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_08124C6A:
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08124C74: .4byte gPlttBufferFaded
_08124C78: .4byte gPlttBufferUnfaded
	thumb_func_end sub_8124BEC

	thumb_func_start task_tutorial_controls_fadein
task_tutorial_controls_fadein: @ 8124C7C
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r5, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _08124CE0
_08124C88:
	ldrh r0, [r4, 0x2]
	asrs r0, r5
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08124CD6
	lsls r1, r5, 1
	adds r0, r1, r5
	lsls r3, r0, 2
	adds r2, r4, r3
	ldrb r0, [r2, 0x5]
	subs r0, 0x1
	strb r0, [r2, 0x5]
	lsls r0, 24
	lsrs r0, 24
	adds r6, r1, 0
	cmp r0, 0xFF
	bne _08124CD6
	ldrh r0, [r2, 0x8]
	movs r2, 0x80
	lsls r2, 8
	adds r1, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _08124CC4
	adds r0, r3, 0x4
	adds r0, r4, r0
	bl sub_81249E4
	b _08124CCC
_08124CC4:
	adds r0, r3, 0x4
	adds r0, r4, r0
	bl sub_8124BEC
_08124CCC:
	adds r0, r6, r5
	lsls r0, 2
	adds r0, r4, r0
	ldrb r1, [r0, 0xD]
	strb r1, [r0, 0x5]
_08124CD6:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xF
	bls _08124C88
_08124CE0:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end task_tutorial_controls_fadein

	thumb_func_start sub_8124CE8
sub_8124CE8: @ 8124CE8
	push {r4-r7,lr}
	adds r3, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	movs r4, 0
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	movs r5, 0x1
	movs r7, 0x80
	negs r7, r7
_08124CFE:
	adds r0, r6, 0
	asrs r0, r4
	ands r0, r5
	cmp r0, 0
	beq _08124D2C
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r2, r3, r0
	ldrb r0, [r2, 0x4]
	lsrs r0, 7
	cmp r0, 0
	beq _08124D2C
	adds r0, r5, 0
	lsls r0, r4
	ldrh r1, [r3, 0x2]
	orrs r0, r1
	strh r0, [r3, 0x2]
	ldrb r1, [r2, 0x4]
	adds r0, r7, 0
	ands r0, r1
	orrs r0, r5
	strb r0, [r2, 0x4]
_08124D2C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _08124CFE
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8124CE8

	thumb_func_start sub_8124D3C
sub_8124D3C: @ 8124D3C
	push {r4-r7,lr}
	sub sp, 0x4
	adds r6, r0, 0
	lsls r1, 16
	lsrs r7, r1, 16
	movs r5, 0
	movs r3, 0x1
_08124D4A:
	ldrh r0, [r6, 0x2]
	asrs r0, r5
	ands r0, r3
	cmp r0, 0
	beq _08124DB2
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 2
	adds r4, r6, r0
	ldrb r0, [r4, 0x4]
	lsrs r0, 7
	cmp r0, 0
	beq _08124DB2
	adds r0, r7, 0
	asrs r0, r5
	ands r0, r3
	cmp r0, 0
	beq _08124DB2
	ldrh r1, [r4, 0xA]
	lsls r1, 1
	ldr r0, _08124DA8
	adds r0, r1, r0
	ldr r2, _08124DAC
	adds r1, r2
	ldrb r2, [r4, 0xC]
	lsls r2, 1
	str r3, [sp]
	bl memcpy
	ldrb r0, [r4, 0x4]
	movs r2, 0x80
	negs r2, r2
	adds r1, r2, 0
	ands r0, r1
	strb r0, [r4, 0x4]
	movs r0, 0
	strb r0, [r4, 0x6]
	strb r0, [r4, 0x5]
	ldrb r0, [r4, 0xF]
	lsls r0, 24
	ldr r3, [sp]
	cmp r0, 0
	bge _08124DB0
	movs r0, 0xFF
	strb r0, [r4, 0x7]
	b _08124DB2
	.align 2, 0
_08124DA8: .4byte gPlttBufferFaded
_08124DAC: .4byte gPlttBufferUnfaded
_08124DB0:
	strb r3, [r4, 0x7]
_08124DB2:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xF
	bls _08124D4A
	ldr r0, _08124DC8
	cmp r7, r0
	bne _08124DCC
	movs r0, 0
	strb r0, [r6]
	b _08124DD0
	.align 2, 0
_08124DC8: .4byte 0x0000ffff
_08124DCC:
	ldrh r0, [r6, 0x2]
	bics r0, r7
_08124DD0:
	strh r0, [r6, 0x2]
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8124D3C

	thumb_func_start sub_8124DDC
sub_8124DDC: @ 8124DDC
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r0, [sp, 0x14]
	ldr r4, [sp, 0x18]
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r4, 24
	lsrs r4, 24
	movs r1, 0
	lsrs r3, 19
	adds r3, r2
	lsls r3, 1
	adds r6, r3
	cmp r1, r4
	bcs _08124E26
_08124E04:
	lsls r0, r1, 6
	adds r2, r6, r0
	movs r0, 0
	adds r3, r1, 0x1
	cmp r0, r5
	bcs _08124E1E
_08124E10:
	strh r7, [r2]
	adds r2, 0x2
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r5
	bcc _08124E10
_08124E1E:
	lsls r0, r3, 24
	lsrs r1, r0, 24
	cmp r1, r4
	bcc _08124E04
_08124E26:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8124DDC

	thumb_func_start sub_8124E2C
sub_8124E2C: @ 8124E2C
	push {r4-r7,lr}
	adds r7, r0, 0
	ldr r0, [sp, 0x14]
	ldr r4, [sp, 0x18]
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r4, 24
	lsrs r6, r4, 24
	movs r4, 0
	lsrs r3, 19
	adds r3, r2
	lsls r3, 1
	adds r7, r3
	cmp r4, r6
	bcs _08124E76
_08124E50:
	lsls r0, r4, 6
	adds r2, r7, r0
	movs r3, 0
	adds r4, 0x1
	cmp r3, r5
	bcs _08124E6E
_08124E5C:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, 0x2
	adds r2, 0x2
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, r5
	bcc _08124E5C
_08124E6E:
	lsls r0, r4, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bcc _08124E50
_08124E76:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8124E2C

	thumb_func_start sub_8124E7C
sub_8124E7C: @ 8124E7C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r10, r0
	ldr r0, [sp, 0x24]
	ldr r4, [sp, 0x28]
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp]
	lsls r3, 24
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r4, 24
	lsrs r4, 24
	mov r8, r4
	movs r0, 0
	lsrs r4, r3, 24
	cmp r0, r8
	bcs _08124EF6
_08124EAE:
	ldr r2, [sp]
	movs r3, 0
	adds r6, r4, 0x1
	adds r0, 0x1
	mov r12, r0
	cmp r3, r7
	bcs _08124EE0
	lsls r5, r4, 6
_08124EBE:
	lsls r0, r2, 1
	adds r0, r5
	add r0, r10
	mov r1, r9
	strh r1, [r0]
	adds r1, r2, 0x1
	adds r0, r1, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r1, r0
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, r7
	bcc _08124EBE
_08124EE0:
	adds r0, r6, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r6, r0
	lsls r0, 24
	lsrs r4, r0, 24
	mov r1, r12
	lsls r0, r1, 24
	lsrs r0, 24
	cmp r0, r8
	bcc _08124EAE
_08124EF6:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8124E7C

	thumb_func_start sub_8124F08
sub_8124F08: @ 8124F08
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r10, r0
	ldr r0, [sp, 0x24]
	ldr r4, [sp, 0x28]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp]
	lsls r3, 24
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	lsls r4, 24
	lsrs r4, 24
	mov r9, r4
	movs r0, 0
	adds r5, r1, 0
	lsrs r4, r3, 24
	cmp r0, r9
	bcs _08124F82
_08124F38:
	ldr r2, [sp]
	movs r3, 0
	adds r7, r4, 0x1
	adds r0, 0x1
	mov r8, r0
	cmp r3, r12
	bcs _08124F6C
	lsls r6, r4, 6
_08124F48:
	lsls r0, r2, 1
	adds r0, r6
	add r0, r10
	ldrh r1, [r5]
	strh r1, [r0]
	adds r5, 0x2
	adds r1, r2, 0x1
	adds r0, r1, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r1, r0
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, r12
	bcc _08124F48
_08124F6C:
	adds r0, r7, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r7, r0
	lsls r0, 24
	lsrs r4, r0, 24
	mov r1, r8
	lsls r0, r1, 24
	lsrs r0, 24
	cmp r0, r9
	bcc _08124F38
_08124F82:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8124F08

	thumb_func_start unref_sub_8124F94
unref_sub_8124F94: @ 8124F94
	sub sp, 0x4
	movs r3, 0
	strb r3, [r0, 0x1]
	strb r3, [r0]
	strh r3, [r0, 0x2]
	movs r1, 0xC0
	lsls r1, 19
	str r1, [r0, 0x4]
	mov r1, sp
	strh r3, [r1]
	ldr r2, _08124FCC
	str r1, [r2]
	adds r1, r0, 0
	adds r1, 0x8
	str r1, [r2, 0x4]
	ldr r1, _08124FD0
	str r1, [r2, 0x8]
	ldr r1, [r2, 0x8]
	mov r1, sp
	strh r3, [r1]
	str r1, [r2]
	adds r0, 0x88
	str r0, [r2, 0x4]
	ldr r0, _08124FD4
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	add sp, 0x4
	bx lr
	.align 2, 0
_08124FCC: .4byte 0x040000d4
_08124FD0: .4byte 0x81000040
_08124FD4: .4byte 0x810000c0
	thumb_func_end unref_sub_8124F94

	thumb_func_start unref_sub_8124FD8
unref_sub_8124FD8: @ 8124FD8
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r7, _08124FE4
	b _0812508A
	.align 2, 0
_08124FE4: .4byte 0x040000d4
_08124FE8:
	ldrb r0, [r4, 0x1]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r0, r4, 0
	adds r0, 0x88
	adds r0, r1
	str r3, [r0]
	ldrb r1, [r4, 0x1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4, r0
	ldrb r1, [r5, 0x6]
	adds r0, 0x8E
	strb r1, [r0]
	ldrb r1, [r4, 0x1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4, r0
	ldrb r1, [r5, 0x4]
	adds r0, 0x8C
	strb r1, [r0]
	ldrb r1, [r4, 0x1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4, r0
	ldrb r1, [r5, 0x5]
	adds r0, 0x8D
	strb r1, [r0]
	ldrb r1, [r5, 0x4]
	ldrb r0, [r5, 0x5]
	adds r6, r1, 0
	muls r6, r0
	ldrh r2, [r4, 0x2]
	adds r1, r2, r6
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	ble _08125040
	movs r0, 0x2
	b _0812509C
_08125040:
	ldrh r0, [r5, 0x8]
	cmp r0, 0
	bne _08125060
	str r3, [r7]
	ldrh r1, [r4, 0x2]
	lsls r1, 6
	ldr r0, [r4, 0x4]
	adds r0, r1
	str r0, [r7, 0x4]
	lsls r0, r6, 4
	movs r1, 0x80
	lsls r1, 24
	orrs r0, r1
	str r0, [r7, 0x8]
	ldr r0, [r7, 0x8]
	b _0812506C
_08125060:
	lsls r0, r2, 6
	ldr r1, [r4, 0x4]
	adds r1, r0
	adds r0, r3, 0
	bl sub_800D238
_0812506C:
	ldrb r1, [r4, 0x1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4, r0
	ldrh r1, [r4, 0x2]
	adds r0, 0x90
	strh r1, [r0]
	ldrh r0, [r4, 0x2]
	adds r0, r6, r0
	strh r0, [r4, 0x2]
	ldrb r0, [r4, 0x1]
	adds r0, 0x1
	strb r0, [r4, 0x1]
	adds r5, 0xC
_0812508A:
	ldrb r0, [r4, 0x1]
	cmp r0, 0x1F
	bhi _0812509A
	ldr r3, [r5]
	cmp r3, 0
	bne _08124FE8
	movs r0, 0
	b _0812509C
_0812509A:
	movs r0, 0x1
_0812509C:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8124FD8

	thumb_func_start unref_sub_81250A4
unref_sub_81250A4: @ 81250A4
	push {r4,r5,lr}
	sub sp, 0x20
	adds r4, r0, 0
	adds r5, r1, 0
	b _081250FC
_081250AE:
	ldrb r1, [r4]
	lsls r1, 3
	adds r0, r4, 0
	adds r0, 0x8
	adds r0, r1
	str r2, [r0]
	ldrb r0, [r4]
	lsls r0, 3
	adds r0, r4, r0
	ldrb r1, [r5, 0x4]
	strb r1, [r0, 0xC]
	ldrb r0, [r5, 0x5]
	cmp r0, 0
	bne _081250D8
	ldrb r1, [r4]
	lsls r1, 4
	adds r0, r2, 0
	movs r2, 0x20
	bl LoadPalette
	b _081250EC
_081250D8:
	adds r0, r2, 0
	mov r1, sp
	bl sub_800D238
	ldrb r1, [r4]
	lsls r1, 4
	mov r0, sp
	movs r2, 0x20
	bl LoadPalette
_081250EC:
	ldrb r0, [r4]
	lsls r1, r0, 3
	adds r1, r4, r1
	strb r0, [r1, 0xD]
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	adds r5, 0x8
_081250FC:
	ldrb r0, [r4]
	cmp r0, 0xF
	bhi _0812510C
	ldr r2, [r5]
	cmp r2, 0
	bne _081250AE
	movs r0, 0
	b _0812510E
_0812510C:
	movs r0, 0x1
_0812510E:
	add sp, 0x20
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_81250A4

	thumb_func_start unref_sub_8125118
unref_sub_8125118: @ 8125118
	push {r4-r7,lr}
	ldr r4, _0812514C
	add sp, r4
	adds r5, r0, 0
	adds r6, r1, 0
	movs r2, 0x80
	lsls r2, 2
	mov r0, sp
	movs r1, 0
	bl memset
	ldrb r7, [r6, 0x5]
	ldr r0, [r6]
	mov r1, sp
	bl sub_800D238
	ldrb r4, [r5]
	cmp r4, r7
	bcs _08125186
_0812513E:
	ldrb r0, [r5]
	adds r0, r4
	cmp r0, 0xF
	ble _08125150
	movs r0, 0x1
	b _08125188
	.align 2, 0
_0812514C: .4byte 0xfffffe00
_08125150:
	lsls r2, r4, 3
	adds r0, r5, 0
	adds r0, 0x8
	adds r0, r2
	ldr r1, [r6]
	str r1, [r0]
	adds r2, r5, r2
	ldrb r0, [r6, 0x4]
	adds r0, r4, r0
	strb r0, [r2, 0xC]
	ldrb r0, [r5]
	strb r0, [r2, 0xD]
	lsls r0, r4, 5
	add r0, sp
	ldrb r1, [r5]
	lsls r1, 4
	movs r2, 0x20
	bl LoadPalette
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r7
	bcc _0812513E
_08125186:
	movs r0, 0
_08125188:
	movs r3, 0x80
	lsls r3, 2
	add sp, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8125118

	.align 2, 0 @ Don't pad with nop.
