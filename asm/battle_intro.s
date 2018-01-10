	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	@ intro

	thumb_func_start sub_80E43C0
sub_80E43C0: @ 80E43C0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080E43D8 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080E43E0
	ldr r0, _080E43DC @ =sub_80E4C34
	b _080E4408
	.align 2, 0
_080E43D8: .4byte gBattleTypeFlags
_080E43DC: .4byte sub_80E4C34
_080E43E0:
	movs r0, 0x80
	lsls r0, 5
	ands r0, r1
	cmp r0, 0
	beq _080E4400
	ldr r0, _080E43F8 @ =gGameVersion
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080E4400
	movs r4, 0x3
	ldr r0, _080E43FC @ =task00_battle_intro_80BC6C8
	b _080E4408
	.align 2, 0
_080E43F8: .4byte gGameVersion
_080E43FC: .4byte task00_battle_intro_80BC6C8
_080E4400:
	ldr r1, _080E4434 @ =gUnknown_083DB56C
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
_080E4408:
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080E4438 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x8]
	strh r4, [r1, 0xA]
	strh r0, [r1, 0xC]
	strh r0, [r1, 0xE]
	strh r0, [r1, 0x10]
	strh r0, [r1, 0x12]
	strh r0, [r1, 0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E4434: .4byte gUnknown_083DB56C
_080E4438: .4byte gTasks
	thumb_func_end sub_80E43C0

	thumb_func_start sub_80E443C
sub_80E443C: @ 80E443C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	ldr r0, _080E4474 @ =gBattle_BG1_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080E4478 @ =gBattle_BG1_Y
	strh r1, [r0]
	ldr r0, _080E447C @ =gBattle_BG2_X
	strh r1, [r0]
	ldr r0, _080E4480 @ =gBattle_BG2_Y
	strh r1, [r0]
	ldr r0, _080E4484 @ =REG_BLDCNT
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0xC
	ldr r2, _080E4488 @ =0x00003f3f
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080E4474: .4byte gBattle_BG1_X
_080E4478: .4byte gBattle_BG1_Y
_080E447C: .4byte gBattle_BG2_X
_080E4480: .4byte gBattle_BG2_Y
_080E4484: .4byte REG_BLDCNT
_080E4488: .4byte 0x00003f3f
	thumb_func_end sub_80E443C

	thumb_func_start task_battle_intro_80BC47C
task_battle_intro_80BC47C: @ 80E448C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080E44C4 @ =gBattle_BG1_X
	ldrh r0, [r1]
	adds r0, 0x6
	strh r0, [r1]
	ldr r1, _080E44C8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	mov r8, r1
	cmp r0, 0x4
	bls _080E44B8
	b _080E46BE
_080E44B8:
	lsls r0, 2
	ldr r1, _080E44CC @ =_080E44D0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E44C4: .4byte gBattle_BG1_X
_080E44C8: .4byte gTasks
_080E44CC: .4byte _080E44D0
	.align 2, 0
_080E44D0:
	.4byte _080E44E4
	.4byte _080E4514
	.4byte _080E4540
	.4byte _080E4588
	.4byte _080E46B8
_080E44E4:
	ldr r0, _080E44FC @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080E4500
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	add r0, r8
	movs r1, 0x10
	b _080E450A
	.align 2, 0
_080E44FC: .4byte gBattleTypeFlags
_080E4500:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	add r0, r8
	movs r1, 0x1
_080E450A:
	strh r1, [r0, 0xC]
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _080E46BE
_080E4514:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	mov r3, r8
	adds r1, r0, r3
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
	lsls r0, 16
	cmp r0, 0
	beq _080E452C
	b _080E46BE
_080E452C:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r1, _080E453C @ =REG_WININ
	movs r0, 0x3F
	strh r0, [r1]
	b _080E46BE
	.align 2, 0
_080E453C: .4byte REG_WININ
_080E4540:
	ldr r1, _080E457C @ =gBattle_WIN0V
	ldrh r0, [r1]
	subs r0, 0xFF
	strh r0, [r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 6
	cmp r0, r1
	beq _080E4558
	b _080E46BE
_080E4558:
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	add r1, r8
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0xF0
	strh r0, [r1, 0xC]
	movs r0, 0x20
	strh r0, [r1, 0xE]
	ldr r2, _080E4580 @ =gUnknown_02024DE8
	ldrh r1, [r2]
	ldr r0, _080E4584 @ =0x0000fffe
	ands r0, r1
	strh r0, [r2]
	b _080E46BE
	.align 2, 0
_080E457C: .4byte gBattle_WIN0V
_080E4580: .4byte gUnknown_02024DE8
_080E4584: .4byte 0x0000fffe
_080E4588:
	lsls r0, r4, 2
	adds r1, r0, r4
	lsls r1, 3
	mov r5, r8
	adds r2, r1, r5
	ldrh r3, [r2, 0xE]
	movs r5, 0xE
	ldrsh r1, [r2, r5]
	mov r12, r0
	cmp r1, 0
	beq _080E45A4
	subs r0, r3, 0x1
	strh r0, [r2, 0xE]
	b _080E45D2
_080E45A4:
	movs r1, 0xA
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	bne _080E45C4
	ldr r2, _080E45BC @ =gBattle_BG1_Y
	ldrh r1, [r2]
	ldr r0, _080E45C0 @ =0x0000ffb0
	cmp r1, r0
	beq _080E45D2
	subs r0, r1, 0x2
	b _080E45D0
	.align 2, 0
_080E45BC: .4byte gBattle_BG1_Y
_080E45C0: .4byte 0x0000ffb0
_080E45C4:
	ldr r2, _080E4690 @ =gBattle_BG1_Y
	ldrh r1, [r2]
	ldr r0, _080E4694 @ =0x0000ffc8
	cmp r1, r0
	beq _080E45D2
	subs r0, r1, 0x1
_080E45D0:
	strh r0, [r2]
_080E45D2:
	ldr r2, _080E4698 @ =gBattle_WIN0V
	ldrh r1, [r2]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _080E45E6
	ldr r3, _080E469C @ =0xfffffc04
	adds r0, r1, r3
	strh r0, [r2]
_080E45E6:
	mov r5, r12
	adds r0, r5, r4
	lsls r0, 3
	mov r2, r8
	adds r1, r0, r2
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080E45FE
	subs r0, r2, 0x2
	strh r0, [r1, 0xC]
_080E45FE:
	movs r3, 0
	ldr r5, _080E46A0 @ =gScanlineEffect
	mov r9, r5
	ldr r7, _080E46A4 @ =gUnknown_03004DE0
	mov r6, r9
	adds r5, r1, 0
_080E460A:
	lsls r2, r3, 1
	ldrb r1, [r6, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r7
	ldrh r0, [r5, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x4F
	ble _080E460A
	cmp r3, 0x9F
	bgt _080E464E
	ldr r7, _080E46A4 @ =gUnknown_03004DE0
	ldr r6, _080E46A0 @ =gScanlineEffect
	ldr r1, _080E46A8 @ =gTasks
	mov r2, r12
	adds r0, r2, r4
	lsls r0, 3
	adds r5, r0, r1
_080E4634:
	lsls r2, r3, 1
	ldrb r1, [r6, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r7
	ldrh r0, [r5, 0xC]
	negs r0, r0
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x9F
	ble _080E4634
_080E464E:
	mov r3, r12
	adds r0, r3, r4
	lsls r0, 3
	mov r5, r8
	adds r1, r0, r5
	movs r0, 0xC
	ldrsh r2, [r1, r0]
	cmp r2, 0
	bne _080E46BE
	movs r0, 0x3
	mov r3, r9
	strb r0, [r3, 0x15]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	str r2, [sp]
	ldr r1, _080E46AC @ =0x0600e000
	ldr r2, _080E46B0 @ =0x05000200
	mov r0, sp
	bl CpuSet
	ldr r1, _080E46B4 @ =REG_BG1CNT
	movs r5, 0x9C
	lsls r5, 8
	adds r0, r5, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0xBC
	lsls r2, 7
	adds r0, r2, 0
	strh r0, [r1]
	b _080E46BE
	.align 2, 0
_080E4690: .4byte gBattle_BG1_Y
_080E4694: .4byte 0x0000ffc8
_080E4698: .4byte gBattle_WIN0V
_080E469C: .4byte 0xfffffc04
_080E46A0: .4byte gScanlineEffect
_080E46A4: .4byte gUnknown_03004DE0
_080E46A8: .4byte gTasks
_080E46AC: .4byte 0x0600e000
_080E46B0: .4byte 0x05000200
_080E46B4: .4byte REG_BG1CNT
_080E46B8:
	adds r0, r4, 0
	bl sub_80E443C
_080E46BE:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end task_battle_intro_80BC47C

	thumb_func_start task00_battle_intro_80BC6C8
task00_battle_intro_80BC6C8: @ 80E46CC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080E46F8 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0xA
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0x3
	beq _080E470C
	cmp r0, 0x3
	bgt _080E46FC
	cmp r0, 0x2
	beq _080E4700
	b _080E4714
	.align 2, 0
_080E46F8: .4byte gTasks
_080E46FC:
	cmp r0, 0x4
	bne _080E4714
_080E4700:
	ldr r1, _080E4708 @ =gBattle_BG1_X
	ldrh r0, [r1]
	adds r0, 0x8
	b _080E4712
	.align 2, 0
_080E4708: .4byte gBattle_BG1_X
_080E470C:
	ldr r1, _080E4750 @ =gBattle_BG1_X
	ldrh r0, [r1]
	adds r0, 0x6
_080E4712:
	strh r0, [r1]
_080E4714:
	lsls r0, r5, 2
	adds r1, r0, r5
	lsls r1, 3
	adds r4, r1, r2
	movs r3, 0xA
	ldrsh r1, [r4, r3]
	adds r6, r0, 0
	cmp r1, 0x4
	bne _080E4778
	ldr r7, _080E4754 @ =gBattle_BG1_Y
	ldrh r0, [r4, 0x14]
	bl Cos2
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _080E473A
	ldr r1, _080E4758 @ =0x000001ff
	adds r0, r1
_080E473A:
	asrs r0, 9
	subs r0, 0x8
	strh r0, [r7]
	ldrh r1, [r4, 0x14]
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0xB3
	bgt _080E475C
	adds r0, r1, 0x4
	b _080E475E
	.align 2, 0
_080E4750: .4byte gBattle_BG1_X
_080E4754: .4byte gBattle_BG1_Y
_080E4758: .4byte 0x000001ff
_080E475C:
	adds r0, r1, 0x6
_080E475E:
	strh r0, [r4, 0x14]
	ldr r2, _080E4794 @ =gTasks
	adds r0, r6, r5
	lsls r0, 3
	adds r3, r0, r2
	movs r4, 0x14
	ldrsh r1, [r3, r4]
	movs r0, 0xB4
	lsls r0, 1
	cmp r1, r0
	bne _080E4778
	movs r0, 0
	strh r0, [r3, 0x14]
_080E4778:
	adds r0, r6, r5
	lsls r0, 3
	adds r0, r2
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0x4
	bls _080E4788
	b _080E4996
_080E4788:
	lsls r0, 2
	ldr r1, _080E4798 @ =_080E479C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E4794: .4byte gTasks
_080E4798: .4byte _080E479C
	.align 2, 0
_080E479C:
	.4byte _080E47B0
	.4byte _080E47E0
	.4byte _080E480C
	.4byte _080E485C
	.4byte _080E4990
_080E47B0:
	ldr r1, _080E47CC @ =gTasks
	adds r0, r6, r5
	lsls r0, 3
	adds r2, r0, r1
	movs r3, 0x10
	strh r3, [r2, 0x10]
	ldr r0, _080E47D0 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080E47D4
	strh r3, [r2, 0xC]
	b _080E47D8
	.align 2, 0
_080E47CC: .4byte gTasks
_080E47D0: .4byte gBattleTypeFlags
_080E47D4:
	movs r0, 0x1
	strh r0, [r2, 0xC]
_080E47D8:
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _080E4996
_080E47E0:
	ldr r0, _080E4804 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
	lsls r0, 16
	cmp r0, 0
	beq _080E47F6
	b _080E4996
_080E47F6:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r1, _080E4808 @ =REG_WININ
	movs r0, 0x3F
	strh r0, [r1]
	b _080E4996
	.align 2, 0
_080E4804: .4byte gTasks
_080E4808: .4byte REG_WININ
_080E480C:
	ldr r1, _080E484C @ =gBattle_WIN0V
	ldrh r0, [r1]
	subs r0, 0xFF
	strh r0, [r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 6
	cmp r0, r1
	beq _080E4824
	b _080E4996
_080E4824:
	ldr r0, _080E4850 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0xF0
	strh r0, [r1, 0xC]
	movs r0, 0x20
	strh r0, [r1, 0xE]
	movs r0, 0x1
	strh r0, [r1, 0x12]
	ldr r2, _080E4854 @ =gUnknown_02024DE8
	ldrh r1, [r2]
	ldr r0, _080E4858 @ =0x0000fffe
	ands r0, r1
	strh r0, [r2]
	b _080E4996
	.align 2, 0
_080E484C: .4byte gBattle_WIN0V
_080E4850: .4byte gTasks
_080E4854: .4byte gUnknown_02024DE8
_080E4858: .4byte 0x0000fffe
_080E485C:
	adds r0, r6, r5
	lsls r0, 3
	adds r1, r0, r2
	ldrh r3, [r1, 0xE]
	movs r4, 0xE
	ldrsh r0, [r1, r4]
	cmp r0, 0
	beq _080E4898
	subs r0, r3, 0x1
	strh r0, [r1, 0xE]
	lsls r0, 16
	asrs r3, r0, 16
	cmp r3, 0
	bne _080E48B8
	ldr r1, _080E488C @ =REG_BLDCNT
	ldr r4, _080E4890 @ =0x00001842
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0xF
	strh r0, [r1]
	ldr r0, _080E4894 @ =REG_BLDY
	strh r3, [r0]
	b _080E48B8
	.align 2, 0
_080E488C: .4byte REG_BLDCNT
_080E4890: .4byte 0x00001842
_080E4894: .4byte REG_BLDY
_080E4898:
	ldrh r3, [r1, 0x10]
	movs r0, 0x1F
	ands r0, r3
	cmp r0, 0
	beq _080E48B8
	ldrh r0, [r1, 0x12]
	subs r0, 0x1
	strh r0, [r1, 0x12]
	lsls r0, 16
	cmp r0, 0
	bne _080E48B8
	adds r0, r3, 0
	adds r0, 0xFF
	strh r0, [r1, 0x10]
	movs r0, 0x4
	strh r0, [r1, 0x12]
_080E48B8:
	ldr r3, _080E4970 @ =gBattle_WIN0V
	ldrh r1, [r3]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _080E48CC
	ldr r4, _080E4974 @ =0xfffffc04
	adds r0, r1, r4
	strh r0, [r3]
_080E48CC:
	adds r0, r6, r5
	lsls r0, 3
	adds r1, r0, r2
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080E48E0
	subs r0, r2, 0x2
	strh r0, [r1, 0xC]
_080E48E0:
	movs r3, 0
	ldr r4, _080E4978 @ =gScanlineEffect
	mov r8, r4
	ldr r0, _080E497C @ =gUnknown_03004DE0
	mov r12, r0
	mov r7, r8
	adds r4, r1, 0
_080E48EE:
	lsls r2, r3, 1
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	add r2, r12
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x4F
	ble _080E48EE
	cmp r3, 0x9F
	bgt _080E4932
	ldr r1, _080E497C @ =gUnknown_03004DE0
	mov r12, r1
	ldr r7, _080E4978 @ =gScanlineEffect
	ldr r1, _080E4980 @ =gTasks
	adds r0, r6, r5
	lsls r0, 3
	adds r4, r0, r1
_080E4918:
	lsls r2, r3, 1
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	add r2, r12
	ldrh r0, [r4, 0xC]
	negs r0, r0
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x9F
	ble _080E4918
_080E4932:
	ldr r1, _080E4980 @ =gTasks
	adds r0, r6, r5
	lsls r0, 3
	adds r1, r0, r1
	movs r3, 0xC
	ldrsh r2, [r1, r3]
	cmp r2, 0
	bne _080E4996
	movs r0, 0x3
	mov r4, r8
	strb r0, [r4, 0x15]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	str r2, [sp]
	ldr r1, _080E4984 @ =0x0600e000
	ldr r2, _080E4988 @ =0x05000200
	mov r0, sp
	bl CpuSet
	ldr r1, _080E498C @ =REG_BG1CNT
	movs r2, 0x9C
	lsls r2, 8
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r3, 0xBC
	lsls r3, 7
	adds r0, r3, 0
	strh r0, [r1]
	b _080E4996
	.align 2, 0
_080E4970: .4byte gBattle_WIN0V
_080E4974: .4byte 0xfffffc04
_080E4978: .4byte gScanlineEffect
_080E497C: .4byte gUnknown_03004DE0
_080E4980: .4byte gTasks
_080E4984: .4byte 0x0600e000
_080E4988: .4byte 0x05000200
_080E498C: .4byte REG_BG1CNT
_080E4990:
	adds r0, r5, 0
	bl sub_80E443C
_080E4996:
	ldr r0, _080E49B8 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r2, r1, r0
	movs r4, 0x8
	ldrsh r0, [r2, r4]
	cmp r0, 0x4
	beq _080E49AC
	ldr r1, _080E49BC @ =REG_BLDALPHA
	ldrh r0, [r2, 0x10]
	strh r0, [r1]
_080E49AC:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E49B8: .4byte gTasks
_080E49BC: .4byte REG_BLDALPHA
	thumb_func_end task00_battle_intro_80BC6C8

	thumb_func_start task_battle_intro_anim
task_battle_intro_anim: @ 80E49C0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080E49F4 @ =gBattle_BG1_X
	ldrh r0, [r1]
	adds r0, 0x8
	strh r0, [r1]
	ldr r1, _080E49F8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r5, r1, 0
	cmp r0, 0x4
	bls _080E49EA
	b _080E4C06
_080E49EA:
	lsls r0, 2
	ldr r1, _080E49FC @ =_080E4A00
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E49F4: .4byte gBattle_BG1_X
_080E49F8: .4byte gTasks
_080E49FC: .4byte _080E4A00
	.align 2, 0
_080E4A00:
	.4byte _080E4A14
	.4byte _080E4A6C
	.4byte _080E4A9C
	.4byte _080E4AEC
	.4byte _080E4C00
_080E4A14:
	ldr r1, _080E4A48 @ =REG_BLDCNT
	ldr r3, _080E4A4C @ =0x00001842
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _080E4A50 @ =REG_BLDALPHA
	ldr r6, _080E4A54 @ =0x00000808
	adds r2, r6, 0
	strh r2, [r0]
	adds r1, 0x4
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080E4A58 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r3, r0, r1
	strh r2, [r3, 0x10]
	ldr r0, _080E4A5C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080E4A60
	movs r0, 0x10
	b _080E4A62
	.align 2, 0
_080E4A48: .4byte REG_BLDCNT
_080E4A4C: .4byte 0x00001842
_080E4A50: .4byte REG_BLDALPHA
_080E4A54: .4byte 0x00000808
_080E4A58: .4byte gTasks
_080E4A5C: .4byte gBattleTypeFlags
_080E4A60:
	movs r0, 0x1
_080E4A62:
	strh r0, [r3, 0xC]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	b _080E4C06
_080E4A6C:
	ldr r0, _080E4A94 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
	lsls r0, 16
	cmp r0, 0
	beq _080E4A84
	b _080E4C06
_080E4A84:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r1, _080E4A98 @ =REG_WININ
	movs r0, 0x3F
	strh r0, [r1]
	b _080E4C06
	.align 2, 0
_080E4A94: .4byte gTasks
_080E4A98: .4byte REG_WININ
_080E4A9C:
	ldr r1, _080E4ADC @ =gBattle_WIN0V
	ldrh r0, [r1]
	subs r0, 0xFF
	strh r0, [r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 6
	cmp r0, r1
	beq _080E4AB4
	b _080E4C06
_080E4AB4:
	ldr r0, _080E4AE0 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0xF0
	strh r0, [r1, 0xC]
	movs r0, 0x20
	strh r0, [r1, 0xE]
	movs r0, 0x1
	strh r0, [r1, 0x12]
	ldr r2, _080E4AE4 @ =gUnknown_02024DE8
	ldrh r1, [r2]
	ldr r0, _080E4AE8 @ =0x0000fffe
	ands r0, r1
	strh r0, [r2]
	b _080E4C06
	.align 2, 0
_080E4ADC: .4byte gBattle_WIN0V
_080E4AE0: .4byte gTasks
_080E4AE4: .4byte gUnknown_02024DE8
_080E4AE8: .4byte 0x0000fffe
_080E4AEC:
	lsls r0, r4, 2
	adds r1, r0, r4
	lsls r1, 3
	adds r2, r1, r5
	ldrh r3, [r2, 0xE]
	movs r6, 0xE
	ldrsh r1, [r2, r6]
	mov r12, r0
	cmp r1, 0
	beq _080E4B06
	subs r0, r3, 0x1
	strh r0, [r2, 0xE]
	b _080E4B26
_080E4B06:
	ldrh r1, [r2, 0x10]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	beq _080E4B26
	ldrh r0, [r2, 0x12]
	subs r0, 0x1
	strh r0, [r2, 0x12]
	lsls r0, 16
	cmp r0, 0
	bne _080E4B26
	adds r0, r1, 0
	adds r0, 0xFF
	strh r0, [r2, 0x10]
	movs r0, 0x6
	strh r0, [r2, 0x12]
_080E4B26:
	ldr r2, _080E4BE0 @ =gBattle_WIN0V
	ldrh r1, [r2]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _080E4B3A
	ldr r3, _080E4BE4 @ =0xfffffc04
	adds r0, r1, r3
	strh r0, [r2]
_080E4B3A:
	mov r6, r12
	adds r0, r6, r4
	lsls r0, 3
	adds r1, r0, r5
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080E4B50
	subs r0, r2, 0x2
	strh r0, [r1, 0xC]
_080E4B50:
	movs r3, 0
	ldr r6, _080E4BE8 @ =gScanlineEffect
	mov r8, r6
	ldr r7, _080E4BEC @ =gUnknown_03004DE0
	adds r5, r1, 0
_080E4B5A:
	lsls r2, r3, 1
	ldrb r1, [r6, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r7
	ldrh r0, [r5, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x4F
	ble _080E4B5A
	cmp r3, 0x9F
	bgt _080E4B9E
	ldr r7, _080E4BEC @ =gUnknown_03004DE0
	ldr r6, _080E4BE8 @ =gScanlineEffect
	ldr r1, _080E4BF0 @ =gTasks
	mov r2, r12
	adds r0, r2, r4
	lsls r0, 3
	adds r5, r0, r1
_080E4B84:
	lsls r2, r3, 1
	ldrb r1, [r6, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r7
	ldrh r0, [r5, 0xC]
	negs r0, r0
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x9F
	ble _080E4B84
_080E4B9E:
	ldr r1, _080E4BF0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	movs r3, 0xC
	ldrsh r2, [r1, r3]
	cmp r2, 0
	bne _080E4C06
	movs r0, 0x3
	mov r6, r8
	strb r0, [r6, 0x15]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	str r2, [sp]
	ldr r1, _080E4BF4 @ =0x0600e000
	ldr r2, _080E4BF8 @ =0x05000200
	mov r0, sp
	bl CpuSet
	ldr r1, _080E4BFC @ =REG_BG1CNT
	movs r2, 0x9C
	lsls r2, 8
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r3, 0xBC
	lsls r3, 7
	adds r0, r3, 0
	strh r0, [r1]
	b _080E4C06
	.align 2, 0
_080E4BE0: .4byte gBattle_WIN0V
_080E4BE4: .4byte 0xfffffc04
_080E4BE8: .4byte gScanlineEffect
_080E4BEC: .4byte gUnknown_03004DE0
_080E4BF0: .4byte gTasks
_080E4BF4: .4byte 0x0600e000
_080E4BF8: .4byte 0x05000200
_080E4BFC: .4byte REG_BG1CNT
_080E4C00:
	adds r0, r4, 0
	bl sub_80E443C
_080E4C06:
	ldr r0, _080E4C2C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r2, r1, r0
	movs r6, 0x8
	ldrsh r0, [r2, r6]
	cmp r0, 0x4
	beq _080E4C1E
	ldr r1, _080E4C30 @ =REG_BLDALPHA
	ldrh r0, [r2, 0x10]
	strh r0, [r1]
_080E4C1E:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E4C2C: .4byte gTasks
_080E4C30: .4byte REG_BLDALPHA
	thumb_func_end task_battle_intro_anim

	thumb_func_start sub_80E4C34
sub_80E4C34: @ 80E4C34
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080E4C80 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r7, r0, r1
	movs r1, 0x8
	ldrsh r0, [r7, r1]
	cmp r0, 0x1
	ble _080E4CAA
	movs r2, 0x10
	ldrsh r0, [r7, r2]
	cmp r0, 0
	bne _080E4CAA
	ldr r2, _080E4C84 @ =gBattle_BG1_X
	ldrh r1, [r2]
	movs r0, 0x80
	lsls r0, 8
	ands r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	bne _080E4C72
	cmp r1, 0x4F
	bhi _080E4C8C
_080E4C72:
	adds r0, r1, 0x3
	strh r0, [r2]
	ldr r1, _080E4C88 @ =gBattle_BG2_X
	ldrh r0, [r1]
	subs r0, 0x3
	strh r0, [r1]
	b _080E4CAA
	.align 2, 0
_080E4C80: .4byte gTasks
_080E4C84: .4byte gBattle_BG1_X
_080E4C88: .4byte gBattle_BG2_X
_080E4C8C:
	str r5, [sp]
	ldr r1, _080E4CCC @ =0x0600e000
	ldr r4, _080E4CD0 @ =0x05000200
	mov r0, sp
	adds r2, r4, 0
	bl CpuSet
	str r5, [sp, 0x4]
	add r0, sp, 0x4
	ldr r1, _080E4CD4 @ =0x0600f000
	adds r2, r4, 0
	bl CpuSet
	movs r0, 0x1
	strh r0, [r7, 0x10]
_080E4CAA:
	ldr r0, _080E4CD8 @ =gTasks
	lsls r2, r6, 2
	adds r1, r2, r6
	lsls r1, 3
	adds r1, r0
	movs r3, 0x8
	ldrsh r1, [r1, r3]
	mov r12, r0
	adds r5, r2, 0
	cmp r1, 0x4
	bls _080E4CC2
	b _080E4EBA
_080E4CC2:
	lsls r0, r1, 2
	ldr r1, _080E4CDC @ =_080E4CE0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E4CCC: .4byte 0x0600e000
_080E4CD0: .4byte 0x05000200
_080E4CD4: .4byte 0x0600f000
_080E4CD8: .4byte gTasks
_080E4CDC: .4byte _080E4CE0
	.align 2, 0
_080E4CE0:
	.4byte _080E4CF4
	.4byte _080E4D06
	.4byte _080E4DA8
	.4byte _080E4DEC
	.4byte _080E4EB4
_080E4CF4:
	adds r0, r5, r6
	lsls r0, 3
	add r0, r12
	movs r1, 0x10
	strh r1, [r0, 0xC]
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _080E4EBA
_080E4D06:
	adds r0, r5, r6
	lsls r0, 3
	mov r2, r12
	adds r1, r0, r2
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
	lsls r0, 16
	cmp r0, 0
	beq _080E4D1C
	b _080E4EBA
_080E4D1C:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r5, _080E4D8C @ =gSprites
	ldr r4, _080E4D90 @ =gSharedMem
	ldr r3, _080E4D94 @ =0x0001608a
	adds r6, r4, r3
	ldrb r0, [r6]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r3, [r1, 0x1]
	movs r2, 0xD
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	movs r3, 0x8
	mov r8, r3
	mov r3, r8
	orrs r0, r3
	strb r0, [r1, 0x1]
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r6, r5, 0
	adds r6, 0x1C
	adds r0, r6
	ldr r3, _080E4D98 @ =sub_800FE20
	str r3, [r0]
	ldr r0, _080E4D9C @ =0x0001608b
	adds r4, r0
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0, 0x1]
	ands r2, r1
	mov r1, r8
	orrs r2, r1
	strb r2, [r0, 0x1]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	str r3, [r0]
	ldr r1, _080E4DA0 @ =REG_WININ
	movs r0, 0x3F
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080E4DA4 @ =0x00003f06
	b _080E4E94
	.align 2, 0
_080E4D8C: .4byte gSprites
_080E4D90: .4byte gSharedMem
_080E4D94: .4byte 0x0001608a
_080E4D98: .4byte sub_800FE20
_080E4D9C: .4byte 0x0001608b
_080E4DA0: .4byte REG_WININ
_080E4DA4: .4byte 0x00003f06
_080E4DA8:
	ldr r1, _080E4DE0 @ =gBattle_WIN0V
	ldrh r0, [r1]
	subs r0, 0xFF
	strh r0, [r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 6
	cmp r0, r1
	beq _080E4DC0
	b _080E4EBA
_080E4DC0:
	adds r1, r5, r6
	lsls r1, 3
	add r1, r12
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0xF0
	strh r0, [r1, 0xC]
	movs r0, 0x20
	strh r0, [r1, 0xE]
	ldr r2, _080E4DE4 @ =gUnknown_02024DE8
	ldrh r1, [r2]
	ldr r0, _080E4DE8 @ =0x0000fffe
	ands r0, r1
	strh r0, [r2]
	b _080E4EBA
	.align 2, 0
_080E4DE0: .4byte gBattle_WIN0V
_080E4DE4: .4byte gUnknown_02024DE8
_080E4DE8: .4byte 0x0000fffe
_080E4DEC:
	ldr r2, _080E4E9C @ =gBattle_WIN0V
	ldrh r1, [r2]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _080E4E00
	ldr r3, _080E4EA0 @ =0xfffffc04
	adds r0, r1, r3
	strh r0, [r2]
_080E4E00:
	adds r0, r5, r6
	lsls r0, 3
	mov r2, r12
	adds r1, r0, r2
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080E4E16
	subs r0, r2, 0x2
	strh r0, [r1, 0xC]
_080E4E16:
	movs r3, 0
	ldr r0, _080E4EA4 @ =gScanlineEffect
	mov r9, r0
	ldr r2, _080E4EA8 @ =gUnknown_03004DE0
	mov r8, r2
	mov r7, r9
	adds r4, r1, 0
_080E4E24:
	lsls r2, r3, 1
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	add r2, r8
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x4F
	ble _080E4E24
	cmp r3, 0x9F
	bgt _080E4E68
	ldr r0, _080E4EA8 @ =gUnknown_03004DE0
	mov r8, r0
	ldr r7, _080E4EA4 @ =gScanlineEffect
	ldr r1, _080E4EAC @ =gTasks
	adds r0, r5, r6
	lsls r0, 3
	adds r4, r0, r1
_080E4E4E:
	lsls r2, r3, 1
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	add r2, r8
	ldrh r0, [r4, 0xC]
	negs r0, r0
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x9F
	ble _080E4E4E
_080E4E68:
	adds r0, r5, r6
	lsls r0, 3
	mov r2, r12
	adds r1, r0, r2
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _080E4EBA
	movs r0, 0x3
	mov r2, r9
	strb r0, [r2, 0x15]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r1, _080E4EB0 @ =REG_BG1CNT
	movs r3, 0x9C
	lsls r3, 8
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0xBC
	lsls r2, 7
_080E4E94:
	adds r0, r2, 0
	strh r0, [r1]
	b _080E4EBA
	.align 2, 0
_080E4E9C: .4byte gBattle_WIN0V
_080E4EA0: .4byte 0xfffffc04
_080E4EA4: .4byte gScanlineEffect
_080E4EA8: .4byte gUnknown_03004DE0
_080E4EAC: .4byte gTasks
_080E4EB0: .4byte REG_BG1CNT
_080E4EB4:
	adds r0, r6, 0
	bl sub_80E443C
_080E4EBA:
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80E4C34

	thumb_func_start unref_sub_80E4EC8
unref_sub_80E4EC8: @ 80E4EC8
	push {r4,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	movs r4, 0x80
	lsls r4, 7
	str r4, [sp]
	movs r4, 0x1E
	str r4, [sp, 0x4]
	movs r4, 0x1
	str r4, [sp, 0x8]
	bl sub_80E4EF8
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_80E4EC8

	thumb_func_start sub_80E4EF8
sub_80E4EF8: @ 80E4EF8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r9, r1
	adds r4, r2, 0
	ldr r1, [sp, 0x24]
	mov r8, r1
	ldr r1, [sp, 0x28]
	ldr r5, [sp, 0x2C]
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	mov r7, r9
	lsls r7, 24
	adds r0, r7, 0
	lsrs r0, 24
	mov r9, r0
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp]
	mov r3, r8
	lsls r3, 16
	mov r8, r3
	lsrs r6, r3, 16
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r5, 24
	lsrs r5, 24
	adds r0, r4, 0
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E4FCC @ =0x040000d4
	ldr r1, _080E4FD0 @ =gUnknown_081FAF4C
	lsls r4, 2
	adds r4, r1
	ldr r1, _080E4FD4 @ =gBattleMonForms
	adds r0, r1
	ldrb r1, [r0]
	lsls r1, 11
	ldr r0, [r4]
	adds r0, r1
	str r0, [r2]
	movs r0, 0xC0
	lsls r0, 19
	adds r6, r0
	str r6, [r2, 0x4]
	ldr r0, _080E4FD8 @ =0x80000400
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	mov r0, r8
	lsrs r0, 21
	lsls r5, 9
	subs r5, r0, r5
	mov r0, r9
	adds r1, r0, 0
	adds r1, 0x8
	cmp r0, r1
	bge _080E4FBC
	mov r9, r1
	mov r1, r10
	lsls r1, 1
	mov r8, r1
	lsls r7, 11
	mov r12, r7
_080E4F86:
	mov r2, r10
	adds r4, r2, 0
	adds r4, 0x8
	adds r1, r0, 0x1
	cmp r2, r4
	bge _080E4FB6
	ldr r3, [sp]
	lsls r6, r3, 12
	lsls r0, 6
	movs r7, 0xC0
	lsls r7, 19
	adds r0, r7
	add r0, r12
	mov r7, r8
	adds r3, r7, r0
	subs r2, r4, r2
_080E4FA6:
	adds r0, r5, 0
	orrs r0, r6
	strh r0, [r3]
	adds r5, 0x1
	adds r3, 0x2
	subs r2, 0x1
	cmp r2, 0
	bne _080E4FA6
_080E4FB6:
	adds r0, r1, 0
	cmp r0, r9
	blt _080E4F86
_080E4FBC:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E4FCC: .4byte 0x040000d4
_080E4FD0: .4byte gUnknown_081FAF4C
_080E4FD4: .4byte gBattleMonForms
_080E4FD8: .4byte 0x80000400
	thumb_func_end sub_80E4EF8

	thumb_func_start unref_sub_80E4FDC
unref_sub_80E4FDC: @ 80E4FDC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r4, [sp, 0x24]
	ldr r5, [sp, 0x28]
	mov r8, r5
	ldr r5, [sp, 0x2C]
	ldr r6, [sp, 0x30]
	mov r9, r6
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	lsls r1, 24
	lsls r2, 24
	lsls r3, 24
	lsls r4, 24
	lsrs r4, 24
	mov r10, r4
	mov r7, r8
	lsls r7, 16
	lsrs r6, r7, 16
	lsls r5, 24
	lsrs r5, 24
	mov r0, r9
	lsls r0, 24
	mov r9, r0
	ldr r4, _080E509C @ =0x040000d4
	ldr r0, _080E50A0 @ =gUnknown_081FAF4C
	lsrs r2, 22
	adds r2, r0
	lsrs r3, 13
	ldr r0, [r2]
	adds r0, r3
	str r0, [r4]
	movs r0, 0xC0
	lsls r0, 19
	adds r6, r0
	str r6, [r4, 0x4]
	ldr r0, _080E50A4 @ =0x80000400
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	adds r2, r7, 0
	lsrs r2, 21
	mov r6, r9
	lsrs r6, 15
	subs r4, r2, r6
	lsrs r0, r1, 24
	adds r1, r0, 0
	adds r1, 0x8
	cmp r0, r1
	bge _080E508C
	mov r9, r1
	mov r7, r12
	lsls r7, 1
	mov r8, r7
	lsls r5, 11
	str r5, [sp]
_080E5054:
	mov r2, r12
	adds r3, r2, 0
	adds r3, 0x8
	adds r5, r0, 0x1
	cmp r2, r3
	bge _080E5086
	mov r1, r10
	lsls r6, r1, 12
	lsls r0, 6
	movs r7, 0xC0
	lsls r7, 19
	adds r0, r7
	ldr r1, [sp]
	adds r0, r1, r0
	mov r7, r8
	adds r1, r7, r0
	subs r2, r3, r2
_080E5076:
	adds r0, r4, 0
	orrs r0, r6
	strh r0, [r1]
	adds r4, 0x1
	adds r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bne _080E5076
_080E5086:
	adds r0, r5, 0
	cmp r0, r9
	blt _080E5054
_080E508C:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E509C: .4byte 0x040000d4
_080E50A0: .4byte gUnknown_081FAF4C
_080E50A4: .4byte 0x80000400
	thumb_func_end unref_sub_80E4FDC
	
	.align 2, 0 @ Don't pad with nop.
