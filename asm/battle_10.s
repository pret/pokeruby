	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start dp01t_29_4_blink
dp01t_29_4_blink: @ 803A058
	push {r4,lr}
	ldr r3, _0803A080 @ =gSprites
	ldr r2, _0803A084 @ =gObjectBankIDs
	ldr r4, _0803A088 @ =gActiveBank
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
	bge _0803A08C
	bl dp01_tbl4_exec_completed
	b _0803A0B6
	.align 2, 0
_0803A080: .4byte gSprites
_0803A084: .4byte gObjectBankIDs
_0803A088: .4byte gActiveBank
_0803A08C:
	ldr r1, _0803A0BC @ =gDoingBattleAnim
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
	ldr r1, _0803A0C0 @ =gBattleBankFunc
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803A0C4 @ =dp01t_0F_4_move_anim
	str r1, [r0]
_0803A0B6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803A0BC: .4byte gDoingBattleAnim
_0803A0C0: .4byte gBattleBankFunc
_0803A0C4: .4byte dp01t_0F_4_move_anim
	thumb_func_end dp01t_29_4_blink

	thumb_func_start sub_803A0C8
sub_803A0C8: @ 803A0C8
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_803A0C8

	thumb_func_start sub_803A0D4
sub_803A0D4: @ 803A0D4
	push {r4,lr}
	ldr r4, _0803A110 @ =gActiveBank
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	movs r3, 0x3F
	cmp r0, 0
	bne _0803A0E8
	movs r3, 0xC0
_0803A0E8:
	ldr r2, _0803A114 @ =gBattleBufferA
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
	bl dp01_tbl4_exec_completed
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803A110: .4byte gActiveBank
_0803A114: .4byte gBattleBufferA
	thumb_func_end sub_803A0D4

	thumb_func_start sub_803A118
sub_803A118: @ 803A118
	push {lr}
	ldr r2, _0803A140 @ =gBattleBufferA
	ldr r0, _0803A144 @ =gActiveBank
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
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_0803A140: .4byte gBattleBufferA
_0803A144: .4byte gActiveBank
	thumb_func_end sub_803A118

	thumb_func_start sub_803A148
sub_803A148: @ 803A148
	push {lr}
	ldr r1, _0803A178 @ =gBattlePartyID
	ldr r0, _0803A17C @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0803A180 @ =gEnemyParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x19
	movs r2, 0x5
	bl PlayCry3
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_0803A178: .4byte gBattlePartyID
_0803A17C: .4byte gActiveBank
_0803A180: .4byte gEnemyParty
	thumb_func_end sub_803A148

	thumb_func_start dp01t_2E_4_battle_intro
dp01t_2E_4_battle_intro: @ 803A184
	push {lr}
	ldr r1, _0803A1AC @ =gBattleBufferA
	ldr r0, _0803A1B0 @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80E43C0
	ldr r2, _0803A1B4 @ =gUnknown_02024DE8
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_0803A1AC: .4byte gBattleBufferA
_0803A1B0: .4byte gActiveBank
_0803A1B4: .4byte gUnknown_02024DE8
	thumb_func_end dp01t_2E_4_battle_intro

	thumb_func_start sub_803A1B8
sub_803A1B8: @ 803A1B8
	push {r4-r6,lr}
	ldr r5, _0803A294 @ =gObjectBankIDs
	ldr r6, _0803A298 @ =gActiveBank
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0803A29C @ =gSprites
	adds r0, r4
	bl oamt_add_pos2_onto_pos1
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x23
	strh r1, [r0, 0x2E]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x8C
	lsls r1, 1
	strh r1, [r0, 0x32]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0x36]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0803A2A0 @ =sub_8078B34
	str r1, [r0]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _0803A2A4 @ =sub_803A3A8
	bl oamt_set_x3A_32
	ldr r0, _0803A2A8 @ =sub_803A2C4
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _0803A2AC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	ldrb r0, [r6]
	strh r0, [r1, 0x8]
	ldrb r3, [r6]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r2, _0803A2B0 @ =0x02017810
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0803A276
	ldr r0, _0803A2B4 @ =gUnknown_02024E68
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	ldr r1, _0803A2B8 @ =sub_8044CA0
	str r1, [r0]
_0803A276:
	adds r2, 0x30
	ldrb r0, [r2, 0x9]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _0803A2BC @ =gBattleBankFunc
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803A2C0 @ =nullsub_47
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803A294: .4byte gObjectBankIDs
_0803A298: .4byte gActiveBank
_0803A29C: .4byte gSprites
_0803A2A0: .4byte sub_8078B34
_0803A2A4: .4byte sub_803A3A8
_0803A2A8: .4byte sub_803A2C4
_0803A2AC: .4byte gTasks
_0803A2B0: .4byte 0x02017810
_0803A2B4: .4byte gUnknown_02024E68
_0803A2B8: .4byte sub_8044CA0
_0803A2BC: .4byte gBattleBankFunc
_0803A2C0: .4byte nullsub_47
	thumb_func_end sub_803A1B8

	thumb_func_start sub_803A2C4
sub_803A2C4: @ 803A2C4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r7, _0803A31C @ =gActiveBank
	ldrb r0, [r7]
	mov r9, r0
	ldr r1, _0803A320 @ =gTasks
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x8]
	strb r0, [r7]
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _0803A2FE
	ldr r0, _0803A324 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0803A330
_0803A2FE:
	ldr r0, _0803A328 @ =gBattleBufferA
	ldrb r1, [r7]
	lsls r2, r1, 9
	adds r0, 0x1
	adds r2, r0
	ldr r0, _0803A32C @ =gBattlePartyID
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	strb r0, [r2]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_8039430
	b _0803A370
	.align 2, 0
_0803A31C: .4byte gActiveBank
_0803A320: .4byte gTasks
_0803A324: .4byte gBattleTypeFlags
_0803A328: .4byte gBattleBufferA
_0803A32C: .4byte gBattlePartyID
_0803A330:
	ldr r4, _0803A394 @ =gBattleBufferA
	ldrb r0, [r7]
	lsls r1, r0, 9
	adds r4, 0x1
	adds r1, r4
	ldr r6, _0803A398 @ =gBattlePartyID
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_8039430
	ldrb r0, [r7]
	movs r5, 0x2
	eors r0, r5
	strb r0, [r7]
	ldrb r0, [r7]
	lsls r1, r0, 9
	adds r1, r4
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_8039430
	ldrb r0, [r7]
	eors r0, r5
	strb r0, [r7]
_0803A370:
	ldr r1, _0803A39C @ =gBattleBankFunc
	ldr r2, _0803A3A0 @ =gActiveBank
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803A3A4 @ =sub_8037840
	str r1, [r0]
	mov r0, r9
	strb r0, [r2]
	mov r0, r8
	bl DestroyTask
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803A394: .4byte gBattleBufferA
_0803A398: .4byte gBattlePartyID
_0803A39C: .4byte gBattleBankFunc
_0803A3A0: .4byte gActiveBank
_0803A3A4: .4byte sub_8037840
	thumb_func_end sub_803A2C4

	thumb_func_start sub_803A3A8
sub_803A3A8: @ 803A3A8
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x6]
	bl sub_8031B74
	ldrh r0, [r4, 0x38]
	ldr r1, _0803A3D4 @ =0x000003ff
	ands r1, r0
	ldrh r2, [r4, 0x4]
	ldr r0, _0803A3D8 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803A3D4: .4byte 0x000003ff
_0803A3D8: .4byte 0xfffffc00
	thumb_func_end sub_803A3A8

	thumb_func_start sub_803A3DC
sub_803A3DC: @ 803A3DC
	push {r4-r6,lr}
	ldr r1, _0803A404 @ =gBattleBufferA
	ldr r0, _0803A408 @ =gActiveBank
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0803A40C
	adds r0, r2, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _0803A40C
	bl dp01_tbl4_exec_completed
	b _0803A4C6
	.align 2, 0
_0803A404: .4byte gBattleBufferA
_0803A408: .4byte gActiveBank
_0803A40C:
	ldr r3, _0803A45C @ =gActiveBank
	ldrb r1, [r3]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r4, _0803A460 @ =0x02017810
	adds r0, r4
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	ldr r1, _0803A464 @ =gBattleBufferA
	ldrb r2, [r3]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r0, r1
	ldrb r0, [r0]
	adds r6, r3, 0
	cmp r0, 0
	beq _0803A470
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r3, r0, r4
	ldrb r2, [r3, 0x1]
	lsls r1, r2, 26
	lsrs r0, r1, 27
	cmp r0, 0x1
	bhi _0803A468
	adds r0, 0x1
	movs r1, 0x1F
	ands r0, r1
	lsls r0, 1
	movs r1, 0x3F
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x1]
	b _0803A4C6
	.align 2, 0
_0803A45C: .4byte gActiveBank
_0803A460: .4byte 0x02017810
_0803A464: .4byte gBattleBufferA
_0803A468:
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	strb r0, [r3, 0x1]
_0803A470:
	adds r5, r6, 0
	ldrb r0, [r5]
	lsls r3, r0, 9
	ldr r4, _0803A4CC @ =gUnknown_02023A64
	adds r1, r3, r4
	subs r2, r4, 0x3
	adds r2, r3, r2
	ldrb r2, [r2]
	subs r4, 0x2
	adds r3, r4
	ldrb r3, [r3]
	bl sub_8044804
	ldr r2, _0803A4D0 @ =gUnknown_02024E68
	ldrb r1, [r5]
	adds r1, r2
	movs r2, 0
	strb r0, [r1]
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r3, _0803A4D4 @ =0x02017810
	adds r0, r3
	strb r2, [r0, 0x5]
	ldrb r1, [r5]
	lsls r0, r1, 9
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _0803A4BA
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0x5D
	strb r1, [r0, 0x5]
_0803A4BA:
	ldr r0, _0803A4D8 @ =gBattleBankFunc
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _0803A4DC @ =sub_803A4E0
	str r0, [r1]
_0803A4C6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803A4CC: .4byte gUnknown_02023A64
_0803A4D0: .4byte gUnknown_02024E68
_0803A4D4: .4byte 0x02017810
_0803A4D8: .4byte gBattleBankFunc
_0803A4DC: .4byte sub_803A4E0
	thumb_func_end sub_803A3DC

	thumb_func_start sub_803A4E0
sub_803A4E0: @ 803A4E0
	push {r4,lr}
	ldr r4, _0803A518 @ =gActiveBank
	ldrb r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r3, _0803A51C @ =0x02017810
	adds r0, r3
	ldrb r1, [r0, 0x5]
	adds r2, r1, 0x1
	strb r2, [r0, 0x5]
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x5C
	bls _0803A510
	ldrb r0, [r4]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	movs r0, 0
	strb r0, [r1, 0x5]
	bl dp01_tbl4_exec_completed
_0803A510:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803A518: .4byte gActiveBank
_0803A51C: .4byte 0x02017810
	thumb_func_end sub_803A4E0

	thumb_func_start sub_803A520
sub_803A520: @ 803A520
	push {lr}
	ldr r0, _0803A558 @ =gActiveBank
	ldrb r3, [r0]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r1, _0803A55C @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0803A54E
	ldr r2, _0803A560 @ =gTasks
	ldr r0, _0803A564 @ =gUnknown_02024E68
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _0803A568 @ =sub_8044CA0
	str r1, [r0]
_0803A54E:
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_0803A558: .4byte gActiveBank
_0803A55C: .4byte 0x02017810
_0803A560: .4byte gTasks
_0803A564: .4byte gUnknown_02024E68
_0803A568: .4byte sub_8044CA0
	thumb_func_end sub_803A520

	thumb_func_start sub_803A56C
sub_803A56C: @ 803A56C
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_803A56C

	thumb_func_start sub_803A578
sub_803A578: @ 803A578
	push {r4,lr}
	ldr r4, _0803A5C8 @ =gActiveBank
	ldrb r0, [r4]
	bl sub_8078874
	lsls r0, 24
	cmp r0, 0
	beq _0803A5BE
	ldr r3, _0803A5CC @ =gSprites
	ldr r0, _0803A5D0 @ =gObjectBankIDs
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldr r0, _0803A5D4 @ =gBattleBufferA
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
_0803A5BE:
	bl dp01_tbl4_exec_completed
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803A5C8: .4byte gActiveBank
_0803A5CC: .4byte gSprites
_0803A5D0: .4byte gObjectBankIDs
_0803A5D4: .4byte gBattleBufferA
	thumb_func_end sub_803A578

	thumb_func_start bx_exec_buffer_A_ch0_tbl4
bx_exec_buffer_A_ch0_tbl4: @ 803A5D8
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r6, _0803A61C @ =gActiveBank
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _0803A630
	ldr r5, _0803A620 @ =gBattleBufferA
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
	beq _0803A624
	bl dp01_tbl4_exec_completed
	b _0803A630
	.align 2, 0
_0803A61C: .4byte gActiveBank
_0803A620: .4byte gBattleBufferA
_0803A624:
	ldr r0, _0803A638 @ =gBattleBankFunc
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _0803A63C @ =sub_8037FD8
	str r0, [r1]
_0803A630:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803A638: .4byte gBattleBankFunc
_0803A63C: .4byte sub_8037FD8
	thumb_func_end bx_exec_buffer_A_ch0_tbl4

	thumb_func_start sub_803A640
sub_803A640: @ 803A640
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_803A640

	thumb_func_start sub_803A64C
sub_803A64C: @ 803A64C
	push {lr}
	bl dp01_tbl4_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_803A64C

	thumb_func_start sub_803A658
sub_803A658: @ 803A658
	push {lr}
	ldr r1, _0803A674 @ =gBattleBufferA
	ldr r0, _0803A678 @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r2, [r0]
	cmp r2, 0x3
	bne _0803A680
	ldr r0, _0803A67C @ =gBattleOutcome
	strb r2, [r0]
	b _0803A688
	.align 2, 0
_0803A674: .4byte gBattleBufferA
_0803A678: .4byte gActiveBank
_0803A67C: .4byte gBattleOutcome
_0803A680:
	ldr r0, _0803A6AC @ =gBattleOutcome
	movs r1, 0x3
	eors r1, r2
	strb r1, [r0]
_0803A688:
	movs r0, 0x5
	bl FadeOutMapMusic
	movs r0, 0x3
	bl BeginFastPaletteFade
	bl dp01_tbl4_exec_completed
	ldr r1, _0803A6B0 @ =gBattleBankFunc
	ldr r0, _0803A6B4 @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803A6B8 @ =sub_8037F34
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0803A6AC: .4byte gBattleOutcome
_0803A6B0: .4byte gBattleBankFunc
_0803A6B4: .4byte gActiveBank
_0803A6B8: .4byte sub_8037F34
	thumb_func_end sub_803A658

	thumb_func_start nullsub_48
nullsub_48: @ 803A6BC
	bx lr
	thumb_func_end nullsub_48

	.align 2, 0 @ Don't pad with nop.
