	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start CheckMonBattleTowerBanlist
CheckMonBattleTowerBanlist: @ 8135200
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r2, [sp, 0x20]
	ldr r4, [sp, 0x24]
	mov r9, r4
	ldr r4, [sp, 0x28]
	mov r10, r4
	ldr r7, [sp, 0x2C]
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r3, 24
	lsrs r3, 24
	mov r12, r3
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	movs r2, 0
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	beq _081352CE
	cmp r4, 0
	beq _081352CE
	ldr r0, _081352DC @ =gBattleTowerBanlist
	ldrh r1, [r0]
	ldr r5, _081352E0 @ =0x0000ffff
	adds r3, r0, 0
	cmp r1, r5
	beq _08135264
	cmp r1, r4
	beq _08135258
	adds r1, r3, 0
_0813524A:
	adds r1, 0x2
	adds r2, 0x1
	ldrh r0, [r1]
	cmp r0, r5
	beq _08135264
	cmp r0, r4
	bne _0813524A
_08135258:
	lsls r0, r2, 1
	adds r0, r3
	ldrh r1, [r0]
	ldr r0, _081352E0 @ =0x0000ffff
	cmp r1, r0
	bne _081352CE
_08135264:
	mov r0, r12
	cmp r0, 0
	bne _08135270
	mov r1, r8
	cmp r1, 0x32
	bhi _081352CE
_08135270:
	movs r2, 0
	ldrb r3, [r7]
	cmp r2, r3
	bge _08135290
	mov r1, r9
	ldrh r0, [r1]
	cmp r0, r4
	beq _08135290
	adds r5, r3, 0
_08135282:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, r5
	bge _08135290
	ldrh r0, [r1]
	cmp r0, r4
	bne _08135282
_08135290:
	cmp r2, r3
	bne _081352CE
	cmp r6, 0
	beq _081352BA
	movs r2, 0
	cmp r2, r3
	bge _081352B6
	mov r1, r10
	ldrh r0, [r1]
	cmp r0, r6
	beq _081352B6
	adds r5, r3, 0
_081352A8:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, r5
	bge _081352B6
	ldrh r0, [r1]
	cmp r0, r6
	bne _081352A8
_081352B6:
	cmp r2, r3
	bne _081352CE
_081352BA:
	lsls r0, r3, 1
	add r0, r9
	strh r4, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	add r0, r10
	strh r6, [r0]
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
_081352CE:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081352DC: .4byte gBattleTowerBanlist
_081352E0: .4byte 0x0000ffff
	thumb_func_end CheckMonBattleTowerBanlist

	thumb_func_start CheckPartyBattleTowerBanlist
CheckPartyBattleTowerBanlist: @ 81352E4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	add r1, sp, 0x28
	movs r0, 0
	strb r0, [r1]
	movs r7, 0
	mov r9, r1
	add r0, sp, 0x1C
	mov r10, r0
_081352FE:
	movs r0, 0x64
	adds r5, r7, 0
	muls r5, r0
	ldr r0, _081353C4 @ =gPlayerParty
	adds r5, r0
	adds r0, r5, 0
	movs r1, 0x41
	bl GetMonData
	mov r8, r0
	mov r1, r8
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	adds r0, r5, 0
	movs r1, 0xC
	bl GetMonData
	adds r6, r0, 0
	lsls r6, 16
	lsrs r6, 16
	adds r0, r5, 0
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	ldr r5, _081353C8 @ =gScriptResult
	ldrb r3, [r5]
	str r4, [sp]
	add r0, sp, 0x10
	str r0, [sp, 0x4]
	mov r1, r10
	str r1, [sp, 0x8]
	mov r0, r9
	str r0, [sp, 0xC]
	mov r0, r8
	adds r1, r6, 0
	bl CheckMonBattleTowerBanlist
	adds r7, 0x1
	cmp r7, 0x5
	ble _081352FE
	mov r1, r9
	ldrb r0, [r1]
	cmp r0, 0x2
	bhi _08135420
	ldr r1, _081353CC @ =gStringVar1
	movs r0, 0xFF
	strb r0, [r1]
	ldr r1, _081353D0 @ =gSpecialVar_0x8004
	movs r0, 0x1
	strh r0, [r1]
	movs r0, 0
	mov r1, r9
	strb r0, [r1]
	bl CountBattleTowerBanlistCaught
	adds r6, r0, 0
	ldr r2, _081353D4 @ =gBattleTowerBanlist
	ldrh r0, [r2]
	ldr r1, _081353D8 @ =0x0000ffff
	cmp r0, r1
	beq _081353A8
	mov r5, r9
	adds r7, r1, 0
	adds r4, r2, 0
_08135394:
	ldrh r0, [r4]
	ldrb r1, [r5]
	adds r2, r6, 0
	bl AppendBattleTowerBannedSpeciesName
	strb r0, [r5]
	adds r4, 0x2
	ldrh r0, [r4]
	cmp r0, r7
	bne _08135394
_081353A8:
	mov r0, r9
	ldrb r1, [r0]
	cmp r1, 0
	bne _081353E4
	ldr r4, _081353CC @ =gStringVar1
	ldr r1, _081353DC @ =gUnknown_08400E2C
	adds r0, r4, 0
	bl StringAppend
	ldr r1, _081353E0 @ =gUnknown_08400E32
	adds r0, r4, 0
	bl StringAppend
	b _0813543E
	.align 2, 0
_081353C4: .4byte gPlayerParty
_081353C8: .4byte gScriptResult
_081353CC: .4byte gStringVar1
_081353D0: .4byte gSpecialVar_0x8004
_081353D4: .4byte gBattleTowerBanlist
_081353D8: .4byte 0x0000ffff
_081353DC: .4byte gUnknown_08400E2C
_081353E0: .4byte gUnknown_08400E32
_081353E4:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08135400
	ldr r0, _081353F8 @ =gStringVar1
	ldr r1, _081353FC @ =gUnknown_08400E2E
	bl StringAppend
	b _08135408
	.align 2, 0
_081353F8: .4byte gStringVar1
_081353FC: .4byte gUnknown_08400E2E
_08135400:
	ldr r0, _08135414 @ =gStringVar1
	ldr r1, _08135418 @ =gUnknown_08400E2C
	bl StringAppend
_08135408:
	ldr r0, _08135414 @ =gStringVar1
	ldr r1, _0813541C @ =gUnknown_08400E36
	bl StringAppend
	b _0813543E
	.align 2, 0
_08135414: .4byte gStringVar1
_08135418: .4byte gUnknown_08400E2C
_0813541C: .4byte gUnknown_08400E36
_08135420:
	ldr r1, _08135450 @ =gSpecialVar_0x8004
	movs r0, 0
	strh r0, [r1]
	ldr r2, _08135454 @ =gSaveBlock2
	ldrb r0, [r5]
	ldr r1, _08135458 @ =0x00000554
	adds r2, r1
	movs r1, 0x1
	ands r1, r0
	ldrb r3, [r2]
	movs r0, 0x2
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_0813543E:
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08135450: .4byte gSpecialVar_0x8004
_08135454: .4byte gSaveBlock2
_08135458: .4byte 0x00000554
	thumb_func_end CheckPartyBattleTowerBanlist

	thumb_func_start sub_813545C
sub_813545C: @ 813545C
	push {lr}
	adds r1, r0, 0
	ldr r0, _08135470 @ =gStringVar4
	movs r2, 0x2
	movs r3, 0x3
	bl sub_80EB544
	pop {r0}
	bx r0
	.align 2, 0
_08135470: .4byte gStringVar4
	thumb_func_end sub_813545C

	thumb_func_start sub_8135474
sub_8135474: @ 8135474
	push {lr}
	ldr r2, _08135490 @ =gSaveBlock2
	ldr r0, _08135494 @ =0x00000564
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0xC8
	bne _08135498
	movs r1, 0x95
	lsls r1, 3
	adds r0, r2, r1
	bl sub_813545C
	b _081354C4
	.align 2, 0
_08135490: .4byte gSaveBlock2
_08135494: .4byte 0x00000564
_08135498:
	cmp r0, 0x63
	bhi _081354B4
	ldrb r1, [r1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldr r1, _081354B0 @ =gBattleTowerTrainers + 0xC
	adds r0, r1
	bl sub_813545C
	b _081354C4
	.align 2, 0
_081354B0: .4byte gBattleTowerTrainers + 0xC
_081354B4:
	ldrb r1, [r1]
	movs r0, 0xA4
	muls r0, r1
	ldr r3, _081354C8 @ =0xffffc14c
	adds r1, r2, r3
	adds r0, r1
	bl sub_813545C
_081354C4:
	pop {r0}
	bx r0
	.align 2, 0
_081354C8: .4byte 0xffffc14c
	thumb_func_end sub_8135474

	thumb_func_start sub_81354CC
sub_81354CC: @ 81354CC
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _081354E4 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _081354E8
	cmp r0, 0x1
	ble _08135520
	cmp r0, 0x2
	beq _0813551C
	b _08135520
	.align 2, 0
_081354E4: .4byte gSpecialVar_0x8004
_081354E8:
	movs r5, 0
_081354EA:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08135514 @ =gSaveBlock1 + 0x238
	adds r0, r4, r0
	movs r1, 0xC
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	ldr r0, _08135518 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	adds r5, 0x1
	cmp r5, 0x5
	ble _081354EA
	b _08135520
	.align 2, 0
_08135514: .4byte gSaveBlock1 + 0x238
_08135518: .4byte gPlayerParty
_0813551C:
	bl sub_81360D0
_08135520:
	ldr r0, _08135530 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08135530: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_81354CC

	thumb_func_start sub_8135534
sub_8135534: @ 8135534
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsBattleTransitionDone
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08135558
	ldr r0, _08135560 @ =gMain
	ldr r1, _08135564 @ =sub_81354CC
	str r1, [r0, 0x8]
	ldr r0, _08135568 @ =sub_800E7C4
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_08135558:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08135560: .4byte gMain
_08135564: .4byte sub_81354CC
_08135568: .4byte sub_800E7C4
	thumb_func_end sub_8135534

	thumb_func_start sub_813556C
sub_813556C: @ 813556C
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _08135584 @ =gSpecialVar_0x8004
	ldrh r2, [r0]
	cmp r2, 0x1
	beq _081355AC
	cmp r2, 0x1
	bgt _08135588
	cmp r2, 0
	beq _0813558E
	b _08135648
	.align 2, 0
_08135584: .4byte gSpecialVar_0x8004
_08135588:
	cmp r2, 0x2
	beq _08135600
	b _08135648
_0813558E:
	ldr r1, _081355A4 @ =gBattleTypeFlags
	movs r3, 0x84
	lsls r3, 1
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _081355A8 @ =gTrainerBattleOpponent
	strh r2, [r0]
	bl sub_8134DD4
	b _081355D6
	.align 2, 0
_081355A4: .4byte gBattleTypeFlags
_081355A8: .4byte gTrainerBattleOpponent
_081355AC:
	movs r5, 0
_081355AE:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _081355F4 @ =gPlayerParty
	adds r0, r4, r0
	movs r1, 0xC
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	ldr r0, _081355F8 @ =gSaveBlock1 + 0x238
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	adds r5, 0x1
	cmp r5, 0x5
	ble _081355AE
_081355D6:
	ldr r0, _081355FC @ =sub_8135534
	movs r1, 0x1
	bl CreateTask
	movs r0, 0
	bl current_map_music_set__default_for_battle
	bl BattleSetup_GetBattleTowerBattleTransition
	lsls r0, 24
	lsrs r0, 24
	bl BattleTransition_StartOnField
	b _08135648
	.align 2, 0
_081355F4: .4byte gPlayerParty
_081355F8: .4byte gSaveBlock1 + 0x238
_081355FC: .4byte sub_8135534
_08135600:
	bl ZeroEnemyPartyMons
	movs r5, 0
_08135606:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08135650 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x2C
	muls r1, r5
	ldr r2, _08135654 @ =gSaveBlock2 + 0x4CC
	adds r1, r2
	bl sub_803ADE8
	adds r5, 0x1
	cmp r5, 0x2
	ble _08135606
	ldr r1, _08135658 @ =gBattleTypeFlags
	ldr r2, _0813565C @ =0x00000808
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08135660 @ =gTrainerBattleOpponent
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08135664 @ =sub_8135534
	movs r1, 0x1
	bl CreateTask
	movs r0, 0
	bl current_map_music_set__default_for_battle
	bl BattleSetup_GetBattleTowerBattleTransition
	lsls r0, 24
	lsrs r0, 24
	bl BattleTransition_StartOnField
_08135648:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08135650: .4byte gEnemyParty
_08135654: .4byte gSaveBlock2 + 0x4CC
_08135658: .4byte gBattleTypeFlags
_0813565C: .4byte 0x00000808
_08135660: .4byte gTrainerBattleOpponent
_08135664: .4byte sub_8135534
	thumb_func_end sub_813556C

	thumb_func_start sub_8135668
sub_8135668: @ 8135668
	push {r4,r5,lr}
	ldr r1, _0813568C @ =gSaveBlock2
	ldr r2, _08135690 @ =0x00000554
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r4, r0, 31
	ldr r0, _08135694 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	adds r5, r1, 0
	cmp r0, 0xE
	bls _08135682
	b _0813589A
_08135682:
	lsls r0, 2
	ldr r1, _08135698 @ =_0813569C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813568C: .4byte gSaveBlock2
_08135690: .4byte 0x00000554
_08135694: .4byte gSpecialVar_0x8004
_08135698: .4byte _0813569C
	.align 2, 0
_0813569C:
	.4byte _081356D8
	.4byte _08135700
	.4byte _0813571C
	.4byte _08135726
	.4byte _08135740
	.4byte _08135754
	.4byte _08135774
	.4byte _081357D0
	.4byte _081357FC
	.4byte _0813589A
	.4byte _08135820
	.4byte _08135834
	.4byte _0813584C
	.4byte _0813586C
	.4byte _08135888
_081356D8:
	ldr r0, _081356F0 @ =0x02000000
	ldr r3, _081356F4 @ =0x00000556
	adds r1, r5, r3
	adds r1, r4, r1
	ldrb r2, [r1]
	ldr r3, _081356F8 @ =0x000160fb
	adds r0, r3
	strb r2, [r0]
	ldr r0, _081356FC @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	b _08135898
	.align 2, 0
_081356F0: .4byte 0x02000000
_081356F4: .4byte 0x00000556
_081356F8: .4byte 0x000160fb
_081356FC: .4byte gSpecialVar_0x8005
_08135700:
	ldr r0, _08135714 @ =gSpecialVar_0x8005
	ldrb r0, [r0]
	ldr r1, _08135718 @ =0x00000554
	adds r3, r5, r1
	movs r1, 0x1
	ands r1, r0
	ldrb r2, [r3]
	movs r0, 0x2
	negs r0, r0
	b _08135810
	.align 2, 0
_08135714: .4byte gSpecialVar_0x8005
_08135718: .4byte 0x00000554
_0813571C:
	lsls r1, r4, 1
	movs r2, 0xAB
	lsls r2, 3
	adds r0, r5, r2
	b _0813572C
_08135726:
	lsls r1, r4, 1
	ldr r3, _08135738 @ =0x0000055c
	adds r0, r5, r3
_0813572C:
	adds r1, r0
	ldr r0, _0813573C @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	strh r0, [r1]
	b _0813589A
	.align 2, 0
_08135738: .4byte 0x0000055c
_0813573C: .4byte gSpecialVar_0x8005
_08135740:
	ldr r0, _0813574C @ =gSpecialVar_0x8005
	ldrh r1, [r0]
	ldr r2, _08135750 @ =0x00000564
	adds r0, r5, r2
	strb r1, [r0]
	b _0813589A
	.align 2, 0
_0813574C: .4byte gSpecialVar_0x8005
_08135750: .4byte 0x00000564
_08135754:
	movs r2, 0
	ldr r4, _0813576C @ =gSaveBlock2 + 0x565
	ldr r3, _08135770 @ =gSelectedOrderFromParty
_0813575A:
	adds r0, r2, r4
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x2
	ble _0813575A
	b _0813589A
	.align 2, 0
_0813576C: .4byte gSaveBlock2 + 0x565
_08135770: .4byte gSelectedOrderFromParty
_08135774:
	ldr r3, _081357C0 @ =0x00000564
	adds r0, r5, r3
	ldrb r0, [r0]
	cmp r0, 0xC8
	bne _08135788
	movs r1, 0x93
	lsls r1, 3
	adds r0, r5, r1
	bl sub_81360AC
_08135788:
	movs r3, 0xAE
	lsls r3, 3
	adds r2, r5, r3
	ldrh r1, [r2]
	ldr r0, _081357C4 @ =0x0000270e
	cmp r1, r0
	bhi _0813579A
	adds r0, r1, 0x1
	strh r0, [r2]
_0813579A:
	lsls r4, 1
	movs r1, 0xAB
	lsls r1, 3
	adds r0, r5, r1
	adds r4, r0
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	bl sub_8135A3C
	ldr r1, _081357C8 @ =gScriptResult
	ldrh r0, [r4]
	strh r0, [r1]
	ldr r1, _081357CC @ =gStringVar1
	adds r0, 0xA1
	strb r0, [r1]
	movs r0, 0xFF
	strb r0, [r1, 0x1]
	b _0813589A
	.align 2, 0
_081357C0: .4byte 0x00000564
_081357C4: .4byte 0x0000270e
_081357C8: .4byte gScriptResult
_081357CC: .4byte gStringVar1
_081357D0:
	lsls r0, r4, 1
	ldr r2, _081357F0 @ =0x0000055c
	adds r1, r5, r2
	adds r4, r0, r1
	ldrh r1, [r4]
	ldr r0, _081357F4 @ =0x00000595
	cmp r1, r0
	bhi _081357E4
	adds r0, r1, 0x1
	strh r0, [r4]
_081357E4:
	bl sub_8135A3C
	ldr r1, _081357F8 @ =gScriptResult
	ldrh r0, [r4]
	strh r0, [r1]
	b _0813589A
	.align 2, 0
_081357F0: .4byte 0x0000055c
_081357F4: .4byte 0x00000595
_081357F8: .4byte gScriptResult
_081357FC:
	ldr r0, _08135818 @ =gSpecialVar_0x8005
	ldrb r0, [r0]
	ldr r1, _0813581C @ =0x00000554
	adds r3, r5, r1
	movs r1, 0x1
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r3]
	movs r0, 0x3
	negs r0, r0
_08135810:
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _0813589A
	.align 2, 0
_08135818: .4byte gSpecialVar_0x8005
_0813581C: .4byte 0x00000554
_08135820:
	ldr r2, _08135830 @ =0x00000572
	adds r0, r5, r2
	ldrh r1, [r0]
	movs r0, 0x20
	bl SetGameStat
	b _0813589A
	.align 2, 0
_08135830: .4byte 0x00000572
_08135834:
	ldr r3, _08135848 @ =0x00000556
	adds r0, r5, r3
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _0813589A
	adds r0, r4, 0
	bl sub_813461C
	b _0813589A
	.align 2, 0
_08135848: .4byte 0x00000556
_0813584C:
	ldr r1, _08135860 @ =0x00000556
	adds r0, r5, r1
	adds r0, r4, r0
	ldr r1, _08135864 @ =0x02000000
	ldr r2, _08135868 @ =0x000160fb
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r0]
	b _0813589A
	.align 2, 0
_08135860: .4byte 0x00000556
_08135864: .4byte 0x02000000
_08135868: .4byte 0x000160fb
_0813586C:
	adds r0, r4, 0
	bl sub_8135D3C
	ldr r1, _08135880 @ =gSaveBlock2
	lsls r2, r4, 1
	ldr r3, _08135884 @ =0x00000574
	adds r1, r3
	adds r2, r1
	strh r0, [r2]
	b _0813589A
	.align 2, 0
_08135880: .4byte gSaveBlock2
_08135884: .4byte 0x00000574
_08135888:
	ldr r1, _081358A0 @ =0x00000554
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	movs r2, 0xAF
	lsls r2, 3
	adds r1, r5, r2
_08135898:
	strb r0, [r1]
_0813589A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081358A0: .4byte 0x00000554
	thumb_func_end sub_8135668

	thumb_func_start sub_81358A4
sub_81358A4: @ 81358A4
	push {r4,lr}
	ldr r1, _081358C8 @ =gSaveBlock2
	ldr r2, _081358CC @ =0x00000554
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r4, r0, 31
	ldr r0, _081358D0 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	adds r3, r1, 0
	cmp r0, 0xE
	bls _081358BE
	b _08135A0A
_081358BE:
	lsls r0, 2
	ldr r1, _081358D4 @ =_081358D8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081358C8: .4byte gSaveBlock2
_081358CC: .4byte 0x00000554
_081358D0: .4byte gSpecialVar_0x8004
_081358D4: .4byte _081358D8
	.align 2, 0
_081358D8:
	.4byte _08135914
	.4byte _08135928
	.4byte _0813593C
	.4byte _0813594C
	.4byte _08135964
	.4byte _08135A0A
	.4byte _08135A0A
	.4byte _08135A0A
	.4byte _08135978
	.4byte _08135990
	.4byte _081359A0
	.4byte _081359B4
	.4byte _081359BC
	.4byte _081359DC
	.4byte _081359F8
_08135914:
	ldr r0, _08135920 @ =gScriptResult
	ldr r2, _08135924 @ =0x00000556
	adds r1, r3, r2
	adds r1, r4, r1
	b _0813596A
	.align 2, 0
_08135920: .4byte gScriptResult
_08135924: .4byte 0x00000556
_08135928:
	ldr r1, _08135934 @ =gScriptResult
	ldr r4, _08135938 @ =0x00000554
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r0, 31
	b _08135982
	.align 2, 0
_08135934: .4byte gScriptResult
_08135938: .4byte 0x00000554
_0813593C:
	ldr r2, _08135948 @ =gScriptResult
	lsls r0, r4, 1
	movs r4, 0xAB
	lsls r4, 3
	b _08135952
	.align 2, 0
_08135948: .4byte gScriptResult
_0813594C:
	ldr r2, _0813595C @ =gScriptResult
	lsls r0, r4, 1
	ldr r4, _08135960 @ =0x0000055c
_08135952:
	adds r1, r3, r4
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	b _08135A0A
	.align 2, 0
_0813595C: .4byte gScriptResult
_08135960: .4byte 0x0000055c
_08135964:
	ldr r0, _08135970 @ =gScriptResult
	ldr r2, _08135974 @ =0x00000564
	adds r1, r3, r2
_0813596A:
	ldrb r1, [r1]
	strh r1, [r0]
	b _08135A0A
	.align 2, 0
_08135970: .4byte gScriptResult
_08135974: .4byte 0x00000564
_08135978:
	ldr r1, _08135988 @ =gScriptResult
	ldr r4, _0813598C @ =0x00000554
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r0, 30
_08135982:
	lsrs r0, 31
	strh r0, [r1]
	b _08135A0A
	.align 2, 0
_08135988: .4byte gScriptResult
_0813598C: .4byte 0x00000554
_08135990:
	adds r0, r4, 0
	bl sub_8135D3C
	ldr r1, _0813599C @ =gScriptResult
	strh r0, [r1]
	b _08135A0A
	.align 2, 0
_0813599C: .4byte gScriptResult
_081359A0:
	ldr r1, _081359B0 @ =0x00000572
	adds r0, r3, r1
	ldrh r1, [r0]
	movs r0, 0x20
	bl SetGameStat
	b _08135A0A
	.align 2, 0
_081359B0: .4byte 0x00000572
_081359B4:
	adds r0, r4, 0
	bl sub_813461C
	b _08135A0A
_081359BC:
	ldr r2, _081359D0 @ =0x00000556
	adds r0, r3, r2
	adds r0, r4, r0
	ldr r1, _081359D4 @ =0x02000000
	ldr r3, _081359D8 @ =0x000160fb
	adds r1, r3
	ldrb r1, [r1]
	strb r1, [r0]
	b _08135A0A
	.align 2, 0
_081359D0: .4byte 0x00000556
_081359D4: .4byte 0x02000000
_081359D8: .4byte 0x000160fb
_081359DC:
	adds r0, r4, 0
	bl sub_8135D3C
	ldr r1, _081359F0 @ =gSaveBlock2
	lsls r2, r4, 1
	ldr r4, _081359F4 @ =0x00000574
	adds r1, r4
	adds r2, r1
	strh r0, [r2]
	b _08135A0A
	.align 2, 0
_081359F0: .4byte gSaveBlock2
_081359F4: .4byte 0x00000574
_081359F8:
	ldr r1, _08135A10 @ =0x00000554
	adds r0, r3, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	movs r2, 0xAF
	lsls r2, 3
	adds r1, r3, r2
	strb r0, [r1]
_08135A0A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08135A10: .4byte 0x00000554
	thumb_func_end sub_81358A4

	thumb_func_start sub_8135A14
sub_8135A14: @ 8135A14
	push {r4,lr}
	movs r2, 0
	ldr r4, _08135A34 @ =gSelectedOrderFromParty
	ldr r3, _08135A38 @ =gSaveBlock2 + 0x565
_08135A1C:
	adds r0, r2, r4
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x2
	ble _08135A1C
	bl ReducePlayerPartyToThree
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08135A34: .4byte gSelectedOrderFromParty
_08135A38: .4byte gSaveBlock2 + 0x565
	thumb_func_end sub_8135A14

	thumb_func_start sub_8135A3C
sub_8135A3C: @ 8135A3C
	push {r4-r6,lr}
	ldr r6, _08135A84 @ =gSaveBlock2
	ldr r1, _08135A88 @ =0x00000554
	adds r0, r6, r1
	ldrb r4, [r0]
	lsls r4, 31
	lsrs r4, 31
	adds r0, r4, 0
	bl sub_8135D3C
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r4, 1
	movs r3, 0xAC
	lsls r3, 3
	adds r2, r6, r3
	adds r4, r2
	ldrh r0, [r4]
	cmp r0, r5
	bcs _08135A66
	strh r5, [r4]
_08135A66:
	ldr r0, _08135A8C @ =0x00000562
	adds r1, r6, r0
	ldrh r0, [r2]
	ldrh r3, [r1]
	cmp r0, r3
	bls _08135A94
	adds r5, r0, 0
	movs r0, 0x20
	adds r1, r5, 0
	bl SetGameStat
	ldr r1, _08135A90 @ =0x0000270f
	cmp r5, r1
	bhi _08135AA4
	b _08135AB4
	.align 2, 0
_08135A84: .4byte gSaveBlock2
_08135A88: .4byte 0x00000554
_08135A8C: .4byte 0x00000562
_08135A90: .4byte 0x0000270f
_08135A94:
	ldrh r5, [r1]
	movs r0, 0x20
	adds r1, r5, 0
	bl SetGameStat
	ldr r1, _08135AAC @ =0x0000270f
	cmp r5, r1
	bls _08135AB4
_08135AA4:
	ldr r2, _08135AB0 @ =0x00000572
	adds r0, r6, r2
	strh r1, [r0]
	b _08135ABA
	.align 2, 0
_08135AAC: .4byte 0x0000270f
_08135AB0: .4byte 0x00000572
_08135AB4:
	ldr r3, _08135AC0 @ =0x00000572
	adds r0, r6, r3
	strh r5, [r0]
_08135ABA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08135AC0: .4byte 0x00000572
	thumb_func_end sub_8135A3C

	thumb_func_start sub_8135AC4
sub_8135AC4: @ 8135AC4
	push {r4-r6,lr}
	ldr r5, _08135AF0 @ =gSaveBlock2 + 0xA8
	adds r2, r5, 0
	subs r2, 0xA8
	ldr r1, _08135AF4 @ =0x000004ac
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r6, r0, 31
	ldrb r0, [r2, 0x8]
	cmp r0, 0
	beq _08135AFC
	ldr r4, _08135AF8 @ =gUnknown_08405E7E
	ldrb r0, [r2, 0xA]
	ldrb r1, [r2, 0xB]
	adds r0, r1
	ldrb r1, [r2, 0xC]
	adds r0, r1
	ldrb r1, [r2, 0xD]
	adds r0, r1
	movs r1, 0x14
	b _08135B0E
	.align 2, 0
_08135AF0: .4byte gSaveBlock2 + 0xA8
_08135AF4: .4byte 0x000004ac
_08135AF8: .4byte gUnknown_08405E7E
_08135AFC:
	ldr r4, _08135B84 @ =gUnknown_08405E60
	ldrb r0, [r2, 0xA]
	ldrb r1, [r2, 0xB]
	adds r0, r1
	ldrb r1, [r2, 0xC]
	adds r0, r1
	ldrb r1, [r2, 0xD]
	adds r0, r1
	movs r1, 0x1E
_08135B0E:
	bl __umodsi3
	adds r0, r4
	ldrb r0, [r0]
	strb r6, [r5]
	strb r0, [r5, 0x1]
	adds r0, r5, 0
	adds r0, 0xC
	ldr r4, _08135B88 @ =gSaveBlock2 + 0xA
	adds r1, r4, 0
	bl copy_word_to_mem
	adds r0, r5, 0x4
	subs r4, 0xA
	adds r1, r4, 0
	bl StringCopy8
	adds r0, r6, 0
	bl sub_8135D3C
	strh r0, [r5, 0x2]
	ldr r0, _08135B8C @ =gSaveBlock1
	ldr r1, _08135B90 @ =0x00002b28
	adds r2, r0, r1
	adds r1, r5, 0
	adds r1, 0x10
	movs r4, 0x5
_08135B44:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _08135B44
	movs r4, 0
	ldr r6, _08135B94 @ =gSaveBlock2 + 0x565
_08135B56:
	adds r0, r4, r6
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08135B98 @ =gUnknown_030042FC
	adds r0, r1
	movs r1, 0x2C
	muls r1, r4
	adds r1, 0x1C
	adds r1, r5, r1
	bl sub_803AF78
	adds r4, 0x1
	cmp r4, 0x2
	ble _08135B56
	ldr r0, _08135B9C @ =gSaveBlock2 + 0xA8
	bl sub_8135CC4
	bl sub_8135A3C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08135B84: .4byte gUnknown_08405E60
_08135B88: .4byte gSaveBlock2 + 0xA
_08135B8C: .4byte gSaveBlock1
_08135B90: .4byte 0x00002b28
_08135B94: .4byte gSaveBlock2 + 0x565
_08135B98: .4byte gUnknown_030042FC
_08135B9C: .4byte gSaveBlock2 + 0xA8
	thumb_func_end sub_8135AC4

	thumb_func_start sub_8135BA0
sub_8135BA0: @ 8135BA0
	push {r4,r5,lr}
	ldr r2, _08135C1C @ =gSaveBlock2
	ldr r1, _08135C20 @ =0x00000554
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r5, r0, 31
	ldr r0, _08135C24 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0x3
	beq _08135BBA
	cmp r0, 0
	bne _08135BD8
_08135BBA:
	lsls r1, r5, 1
	ldr r3, _08135C28 @ =0x0000055c
	adds r0, r2, r3
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, 0x1
	bhi _08135BD4
	subs r3, 0x4
	adds r0, r2, r3
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, 0x1
	bls _08135BD8
_08135BD4:
	bl sub_8135AC4
_08135BD8:
	bl sub_8135CFC
	ldr r4, _08135C1C @ =gSaveBlock2
	ldr r0, _08135C2C @ =gBattleOutcome
	ldrb r1, [r0]
	ldr r2, _08135C30 @ =0x00000555
	adds r0, r4, r2
	strb r1, [r0]
	ldr r0, _08135C24 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	cmp r1, 0x3
	beq _08135BF8
	ldr r3, _08135C34 @ =0x00000556
	adds r0, r4, r3
	adds r0, r5, r0
	strb r1, [r0]
_08135BF8:
	movs r0, 0x80
	lsls r0, 7
	movs r1, 0
	bl VarSet
	ldr r0, _08135C20 @ =0x00000554
	adds r2, r4, r0
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x2
	bl TrySavingData
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08135C1C: .4byte gSaveBlock2
_08135C20: .4byte 0x00000554
_08135C24: .4byte gSpecialVar_0x8004
_08135C28: .4byte 0x0000055c
_08135C2C: .4byte gBattleOutcome
_08135C30: .4byte 0x00000555
_08135C34: .4byte 0x00000556
	thumb_func_end sub_8135BA0

	thumb_func_start sub_8135C38
sub_8135C38: @ 8135C38
	push {lr}
	bl DoSoftReset
	pop {r0}
	bx r0
	thumb_func_end sub_8135C38

	thumb_func_start sub_8135C44
sub_8135C44: @ 8135C44
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r3, 0
	movs r1, 0
	ldr r2, _08135CBC @ =gSaveBlock2 + 0xA8
_08135C50:
	ldm r2!, {r0}
	adds r3, r0
	adds r1, 0x1
	cmp r1, 0x27
	bls _08135C50
	ldr r5, _08135CC0 @ =gSaveBlock2
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r5, r1
	ldr r0, [r0]
	cmp r0, r3
	beq _08135C70
	adds r0, r5, 0
	adds r0, 0xA8
	bl sub_8135CE8
_08135C70:
	movs r4, 0
	movs r7, 0xA4
	movs r0, 0xA6
	lsls r0, 1
	adds r6, r5, r0
	mov r8, r5
_08135C7C:
	adds r0, r4, 0
	muls r0, r7
	movs r3, 0
	movs r1, 0
	adds r5, r4, 0x1
	adds r2, r0, r6
_08135C88:
	ldm r2!, {r0}
	adds r3, r0
	adds r1, 0x1
	cmp r1, 0x27
	bls _08135C88
	adds r1, r4, 0
	muls r1, r7
	movs r0, 0xF6
	lsls r0, 1
	add r0, r8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, r3
	beq _08135CAA
	adds r0, r1, r6
	bl sub_8135CE8
_08135CAA:
	adds r4, r5, 0
	cmp r4, 0x4
	ble _08135C7C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08135CBC: .4byte gSaveBlock2 + 0xA8
_08135CC0: .4byte gSaveBlock2
	thumb_func_end sub_8135C44

	thumb_func_start sub_8135CC4
sub_8135CC4: @ 8135CC4
	push {r4,lr}
	adds r2, r0, 0
	adds r2, 0xA0
	movs r1, 0
	str r1, [r2]
	movs r3, 0
	adds r4, r0, 0
_08135CD2:
	ldr r0, [r2]
	ldm r4!, {r1}
	adds r0, r1
	str r0, [r2]
	adds r3, 0x1
	cmp r3, 0x27
	bls _08135CD2
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8135CC4

	thumb_func_start sub_8135CE8
sub_8135CE8: @ 8135CE8
	push {lr}
	movs r1, 0
	movs r2, 0
_08135CEE:
	stm r0!, {r2}
	adds r1, 0x1
	cmp r1, 0x28
	bls _08135CEE
	pop {r0}
	bx r0
	thumb_func_end sub_8135CE8

	thumb_func_start sub_8135CFC
sub_8135CFC: @ 8135CFC
	push {r4,lr}
	ldr r4, _08135D34 @ =gSaveBlock2 + 0x484
	adds r0, r4, 0
	bl get_trainer_name
	ldr r2, _08135D38 @ =gBattleMons
	adds r0, r2, 0
	adds r0, 0x58
	ldrh r1, [r0]
	subs r0, r4, 0x2
	strh r1, [r0]
	ldrh r1, [r2]
	subs r0, r4, 0x4
	strh r1, [r0]
	movs r3, 0
	adds r4, 0x8
	adds r2, 0x30
_08135D1E:
	adds r0, r3, r4
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, 0x1
	cmp r3, 0x9
	ble _08135D1E
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08135D34: .4byte gSaveBlock2 + 0x484
_08135D38: .4byte gBattleMons
	thumb_func_end sub_8135CFC

	thumb_func_start sub_8135D3C
sub_8135D3C: @ 8135D3C
	push {lr}
	lsls r0, 24
	ldr r3, _08135D74 @ =gSaveBlock2
	lsrs r0, 23
	ldr r2, _08135D78 @ =0x0000055c
	adds r1, r3, r2
	adds r1, r0, r1
	ldrh r2, [r1]
	subs r2, 0x1
	lsls r1, r2, 3
	subs r1, r2
	movs r2, 0xAB
	lsls r2, 3
	adds r3, r2
	adds r0, r3
	ldr r2, _08135D7C @ =0x0000ffff
	adds r1, r2
	ldrh r0, [r0]
	adds r1, r0
	lsls r1, 16
	lsrs r0, r1, 16
	ldr r1, _08135D80 @ =0x0000270f
	cmp r0, r1
	bls _08135D6E
	adds r0, r1, 0
_08135D6E:
	pop {r1}
	bx r1
	.align 2, 0
_08135D74: .4byte gSaveBlock2
_08135D78: .4byte 0x0000055c
_08135D7C: .4byte 0x0000ffff
_08135D80: .4byte 0x0000270f
	thumb_func_end sub_8135D3C

	thumb_func_start sub_8135D84
sub_8135D84: @ 8135D84
	push {r4,r5,lr}
	ldr r5, _08135DB0 @ =gSaveBlock2
	ldr r1, _08135DB4 @ =0x00000554
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	lsls r0, 1
	ldr r2, _08135DB8 @ =0x0000055c
	adds r1, r5, r2
	adds r0, r1
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r0, 0x5
	ble _08135DC0
	bl Random
	ldr r4, _08135DBC @ =gUnknown_08405EE6
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x9
	b _08135DCC
	.align 2, 0
_08135DB0: .4byte gSaveBlock2
_08135DB4: .4byte 0x00000554
_08135DB8: .4byte 0x0000055c
_08135DBC: .4byte gUnknown_08405EE6
_08135DC0:
	bl Random
	ldr r4, _08135DE8 @ =gUnknown_08405EDA
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x6
_08135DCC:
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 15
	adds r0, r4
	ldrh r1, [r0]
	movs r2, 0xAD
	lsls r2, 3
	adds r0, r5, r2
	strh r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08135DE8: .4byte gUnknown_08405EDA
	thumb_func_end sub_8135D84

	thumb_func_start sub_8135DEC
sub_8135DEC: @ 8135DEC
	push {r4-r7,lr}
	ldr r5, _08135E20 @ =gSaveBlock2
	ldr r1, _08135E24 @ =0x00000554
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r7, r0, 31
	movs r0, 0xAD
	lsls r0, 3
	adds r6, r5, r0
	ldrh r0, [r6]
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bne _08135E30
	ldrh r0, [r6]
	ldr r1, _08135E28 @ =gStringVar1
	bl CopyItemName
	ldr r0, _08135E2C @ =gScriptResult
	strh r4, [r0]
	b _08135E40
	.align 2, 0
_08135E20: .4byte gSaveBlock2
_08135E24: .4byte 0x00000554
_08135E28: .4byte gStringVar1
_08135E2C: .4byte gScriptResult
_08135E30:
	ldr r1, _08135E48 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08135E4C @ =0x00000556
	adds r0, r5, r1
	adds r0, r7, r0
	movs r1, 0x6
	strb r1, [r0]
_08135E40:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08135E48: .4byte gScriptResult
_08135E4C: .4byte 0x00000556
	thumb_func_end sub_8135DEC

	thumb_func_start sub_8135E50
sub_8135E50: @ 8135E50
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r6, _08135ED4 @ =gSaveBlock2
	ldr r1, _08135ED8 @ =0x00000554
	adds r0, r6, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r0, 0
	movs r7, 0x44
	cmp r1, 0
	beq _08135E6C
	movs r7, 0x45
_08135E6C:
	ldr r4, _08135EDC @ =gScriptResult
	movs r0, 0
	strh r0, [r4]
	adds r0, r1, 0
	bl sub_8135D3C
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x37
	bls _08135EBA
	movs r5, 0
	ldr r0, _08135EE0 @ =0x00000565
	adds r0, r6
	mov r8, r0
	adds r6, r4, 0
_08135E8A:
	mov r1, r8
	adds r0, r5, r1
	ldrb r0, [r0]
	subs r0, 0x1
	movs r1, 0x64
	muls r1, r0
	ldr r0, _08135EE4 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	adds r1, r7, 0
	bl GetMonData
	cmp r0, 0
	bne _08135EB4
	movs r0, 0x1
	strh r0, [r6]
	adds r0, r4, 0
	adds r1, r7, 0
	adds r2, r6, 0
	bl SetMonData
_08135EB4:
	adds r5, 0x1
	cmp r5, 0x2
	ble _08135E8A
_08135EBA:
	ldr r0, _08135EDC @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0
	beq _08135EC8
	movs r0, 0x2A
	bl IncrementGameStat
_08135EC8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08135ED4: .4byte gSaveBlock2
_08135ED8: .4byte 0x00000554
_08135EDC: .4byte gScriptResult
_08135EE0: .4byte 0x00000565
_08135EE4: .4byte gPlayerParty
	thumb_func_end sub_8135E50

	thumb_func_start unref_sub_8135EE8
unref_sub_8135EE8: @ 8135EE8
	push {r4-r7,lr}
	ldr r7, _08135F0C @ =gSaveBlock2 + 0x498
	ldr r0, _08135F10 @ =0xfffffb68
	adds r2, r7, r0
	ldrb r0, [r2, 0x8]
	cmp r0, 0
	beq _08135F18
	ldr r4, _08135F14 @ =gUnknown_08405E7E
	ldrb r0, [r2, 0xA]
	ldrb r1, [r2, 0xB]
	adds r0, r1
	ldrb r1, [r2, 0xC]
	adds r0, r1
	ldrb r1, [r2, 0xD]
	adds r0, r1
	movs r1, 0x14
	b _08135F2A
	.align 2, 0
_08135F0C: .4byte gSaveBlock2 + 0x498
_08135F10: .4byte 0xfffffb68
_08135F14: .4byte gUnknown_08405E7E
_08135F18:
	ldr r4, _08135FA8 @ =gUnknown_08405E60
	ldrb r0, [r2, 0xA]
	ldrb r1, [r2, 0xB]
	adds r0, r1
	ldrb r1, [r2, 0xC]
	adds r0, r1
	ldrb r1, [r2, 0xD]
	adds r0, r1
	movs r1, 0x1E
_08135F2A:
	bl __umodsi3
	adds r0, r4
	ldrb r0, [r0]
	strb r0, [r7, 0x1]
	adds r0, r7, 0
	adds r0, 0xC
	ldr r4, _08135FAC @ =gSaveBlock2 + 0xA
	adds r1, r4, 0
	bl copy_word_to_mem
	adds r0, r7, 0x4
	subs r4, 0xA
	adds r1, r4, 0
	bl StringCopy8
	movs r0, 0x1
	strh r0, [r7, 0x2]
	movs r5, 0x7
	movs r4, 0
	ldr r0, _08135FB0 @ =gSaveBlock1
	ldr r1, _08135FB4 @ =0x00002b28
	adds r6, r0, r1
	adds r3, r7, 0
	adds r3, 0x10
	adds r2, r7, 0
	adds r2, 0x28
	adds r1, r7, 0
	adds r1, 0x1C
_08135F64:
	ldrh r0, [r6]
	strh r0, [r3]
	strh r5, [r1]
	adds r0, r5, 0x6
	strh r0, [r2]
	adds r5, 0x1
	adds r6, 0x2
	adds r3, 0x2
	adds r2, 0x2
	adds r1, 0x2
	adds r4, 0x1
	cmp r4, 0x5
	ble _08135F64
	movs r4, 0
_08135F80:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _08135FB8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2C
	muls r1, r4
	adds r1, 0x34
	adds r1, r7, r1
	bl sub_803AF78
	adds r4, 0x1
	cmp r4, 0x2
	ble _08135F80
	adds r0, r7, 0
	bl sub_8136088
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08135FA8: .4byte gUnknown_08405E60
_08135FAC: .4byte gSaveBlock2 + 0xA
_08135FB0: .4byte gSaveBlock1
_08135FB4: .4byte 0x00002b28
_08135FB8: .4byte gPlayerParty
	thumb_func_end unref_sub_8135EE8

	thumb_func_start sub_8135FBC
sub_8135FBC: @ 8135FBC
	ldr r1, _08135FCC @ =gTrainerClassToPicIndex
	ldr r0, _08135FD0 @ =gSaveBlock2
	ldr r2, _08135FD4 @ =0x00000499
	adds r0, r2
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08135FCC: .4byte gTrainerClassToPicIndex
_08135FD0: .4byte gSaveBlock2
_08135FD4: .4byte 0x00000499
	thumb_func_end sub_8135FBC

	thumb_func_start sub_8135FD8
sub_8135FD8: @ 8135FD8
	ldr r1, _08135FE8 @ =gTrainerClassToNameIndex
	ldr r0, _08135FEC @ =gSaveBlock2
	ldr r2, _08135FF0 @ =0x00000499
	adds r0, r2
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08135FE8: .4byte gTrainerClassToNameIndex
_08135FEC: .4byte gSaveBlock2
_08135FF0: .4byte 0x00000499
	thumb_func_end sub_8135FD8

	thumb_func_start sub_8135FF4
sub_8135FF4: @ 8135FF4
	push {r4,lr}
	adds r3, r0, 0
	movs r2, 0
	ldr r4, _08136018 @ =gSaveBlock2 + 0x49C
_08135FFC:
	adds r0, r3, r2
	adds r1, r2, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x6
	ble _08135FFC
	adds r1, r3, r2
	movs r0, 0xFF
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08136018: .4byte gSaveBlock2 + 0x49C
	thumb_func_end sub_8135FF4

	thumb_func_start sub_813601C
sub_813601C: @ 813601C
	push {r4,r5,lr}
	ldr r1, _08136044 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r5, _08136048 @ =gSaveBlock2 + 0x498
	movs r3, 0
	movs r2, 0
	adds r4, r1, 0
	adds r1, r5, 0
_0813602E:
	ldm r1!, {r0}
	orrs r3, r0
	adds r2, 0x1
	cmp r2, 0x2D
	bls _0813602E
	cmp r3, 0
	bne _0813604C
	movs r0, 0x1
	strh r0, [r4]
	b _08136078
	.align 2, 0
_08136044: .4byte gScriptResult
_08136048: .4byte gSaveBlock2 + 0x498
_0813604C:
	movs r3, 0
	movs r2, 0
	ldr r4, _08136080 @ =gSaveBlock2
	adds r1, r5, 0
_08136054:
	ldm r1!, {r0}
	adds r3, r0
	adds r2, 0x1
	cmp r2, 0x2D
	bls _08136054
	movs r1, 0xAA
	lsls r1, 3
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r0, r3
	beq _08136078
	subs r1, 0xB8
	adds r0, r4, r1
	bl sub_81360AC
	ldr r1, _08136084 @ =gScriptResult
	movs r0, 0x1
	strh r0, [r1]
_08136078:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08136080: .4byte gSaveBlock2
_08136084: .4byte gScriptResult
	thumb_func_end sub_813601C

	thumb_func_start sub_8136088
sub_8136088: @ 8136088
	push {r4,lr}
	adds r2, r0, 0
	adds r2, 0xB8
	movs r1, 0
	str r1, [r2]
	movs r3, 0
	adds r4, r0, 0
_08136096:
	ldr r0, [r2]
	ldm r4!, {r1}
	adds r0, r1
	str r0, [r2]
	adds r3, 0x1
	cmp r3, 0x2D
	bls _08136096
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8136088

	thumb_func_start sub_81360AC
sub_81360AC: @ 81360AC
	push {lr}
	movs r1, 0
	movs r2, 0
_081360B2:
	stm r0!, {r2}
	adds r1, 0x1
	cmp r1, 0x2E
	bls _081360B2
	pop {r0}
	bx r0
	thumb_func_end sub_81360AC

	thumb_func_start sub_81360C0
sub_81360C0: @ 81360C0
	push {lr}
	ldr r0, _081360CC @ =gSaveBlock2 + 0x4A8
	bl sub_813545C
	pop {r0}
	bx r0
	.align 2, 0
_081360CC: .4byte gSaveBlock2 + 0x4A8
	thumb_func_end sub_81360C0

	thumb_func_start sub_81360D0
sub_81360D0: @ 81360D0
	push {lr}
	ldr r0, _081360E4 @ =gBattleOutcome
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _081360EC
	ldr r1, _081360E8 @ =gStringVar4
	movs r0, 0xFF
	strb r0, [r1]
	b _08136102
	.align 2, 0
_081360E4: .4byte gBattleOutcome
_081360E8: .4byte gStringVar4
_081360EC:
	cmp r0, 0x1
	bne _081360FC
	ldr r0, _081360F8 @ =gSaveBlock2 + 0x4C0
	bl sub_813545C
	b _08136102
	.align 2, 0
_081360F8: .4byte gSaveBlock2 + 0x4C0
_081360FC:
	ldr r0, _08136108 @ =gSaveBlock2 + 0x4B4
	bl sub_813545C
_08136102:
	pop {r0}
	bx r0
	.align 2, 0
_08136108: .4byte gSaveBlock2 + 0x4B4
	thumb_func_end sub_81360D0

	thumb_func_start sub_813610C
sub_813610C: @ 813610C
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _0813612C @ =gSaveBlock2 + 0x556
_08136112:
	adds r0, r4, r5
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0813611E
	bl sub_80BFD20
_0813611E:
	adds r4, 0x1
	cmp r4, 0x1
	ble _08136112
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813612C: .4byte gSaveBlock2 + 0x556
	thumb_func_end sub_813610C

.ifdef GERMAN
	thumb_func_start de_sub_81364AC
de_sub_81364AC: @ 81364AC
	push {lr}
	ldr r2, _DE_081364C0 @ =gSaveBlock2
	ldr r0, _DE_081364C4 @ =0x00000564
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0xC8
	bne _DE_081364CC
	ldr r1, _DE_081364C8 @ =0x00000499
	adds r0, r2, r1
	b _DE_081364F2
	.align 2, 0
_DE_081364C0: .4byte gSaveBlock2
_DE_081364C4: .4byte 0x00000564
_DE_081364C8: .4byte 0x00000499
_DE_081364CC:
	cmp r0, 0x63
	bhi _DE_081364E4
	ldr r2, _DE_081364E0 @ =gBattleTowerTrainers
	ldrb r1, [r1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	b _DE_081364F2
	.align 2, 0
_DE_081364E0: .4byte gBattleTowerTrainers
_DE_081364E4:
	ldrb r0, [r1]
	subs r0, 0x64
	movs r1, 0xA4
	muls r0, r1
	adds r0, r2
	adds r1, 0xA9
	adds r0, r1
_DE_081364F2:
	ldrb r0, [r0]
	pop {r1}
	bx r1
	thumb_func_end de_sub_81364AC

	thumb_func_start de_sub_81364F8
de_sub_81364F8: @ 81364F8
	ldr r0, _DE_08136504 @ =gSaveBlock2
	ldr r1, _DE_08136508 @ =0x00000499
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_DE_08136504: .4byte gSaveBlock2
_DE_08136508: .4byte 0x00000499
	thumb_func_end de_sub_81364F8
.endif

	.align 2, 0 @ Don't pad with nop.
