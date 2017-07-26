	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text


	thumb_func_start b_call_bc_move_exec
b_call_bc_move_exec: @ 8019FB0
	ldr r1, _08019FD8 @ =gBattlescriptCurrInstr
	str r0, [r1]
	ldr r3, _08019FDC @ =0x02017140
	adds r2, r3, 0
	adds r2, 0x20
	ldrb r0, [r2]
	adds r1, r0, 0x1
	strb r1, [r2]
	lsls r0, 24
	lsrs r0, 22
	adds r0, r3
	ldr r2, _08019FE0 @ =gBattleMainFunc
	ldr r1, [r2]
	str r1, [r0]
	ldr r0, _08019FE4 @ =sub_8013F54
	str r0, [r2]
	ldr r1, _08019FE8 @ =gFightStateTracker
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08019FD8: .4byte gBattlescriptCurrInstr
_08019FDC: .4byte 0x02017140
_08019FE0: .4byte gBattleMainFunc
_08019FE4: .4byte sub_8013F54
_08019FE8: .4byte gFightStateTracker
	thumb_func_end b_call_bc_move_exec

	thumb_func_start b_push_move_exec
b_push_move_exec: @ 8019FEC
	push {r4,lr}
	adds r4, r0, 0
	bl b_movescr_stack_push_cursor
	ldr r0, _0801A01C @ =gBattlescriptCurrInstr
	str r4, [r0]
	ldr r3, _0801A020 @ =0x02017140
	adds r2, r3, 0
	adds r2, 0x20
	ldrb r0, [r2]
	adds r1, r0, 0x1
	strb r1, [r2]
	lsls r0, 24
	lsrs r0, 22
	adds r0, r3
	ldr r2, _0801A024 @ =gBattleMainFunc
	ldr r1, [r2]
	str r1, [r0]
	ldr r0, _0801A028 @ =sub_8013FBC
	str r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801A01C: .4byte gBattlescriptCurrInstr
_0801A020: .4byte 0x02017140
_0801A024: .4byte gBattleMainFunc
_0801A028: .4byte sub_8013FBC
	thumb_func_end b_push_move_exec

	thumb_func_start ItemBattleEffects
ItemBattleEffects: @ 801A02C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	movs r0, 0
	mov r10, r0
	movs r1, 0
	str r1, [sp, 0xC]
	add r0, sp, 0x4
	strb r1, [r0]
	ldr r4, _0801A078 @ =gLastUsedItem
	ldr r1, _0801A07C @ =gBattleMons
	movs r0, 0x58
	muls r0, r7
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	strh r0, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _0801A084
	ldr r1, _0801A080 @ =gEnigmaBerries
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r1
	ldrb r5, [r0, 0x7]
	ldrb r0, [r0, 0x1A]
	b _0801A098
	.align 2, 0
_0801A078: .4byte gLastUsedItem
_0801A07C: .4byte gBattleMons
_0801A080: .4byte gEnigmaBerries
_0801A084:
	ldrh r0, [r4]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r0, [r4]
	bl ItemId_GetHoldEffectParam
	lsls r0, 24
	lsrs r0, 24
_0801A098:
	mov r9, r0
	ldr r1, _0801A0C0 @ =gBattleMons
	ldr r0, _0801A0C4 @ =gBankAttacker
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	str r0, [sp, 0x14]
	cmp r0, 0xAF
	bne _0801A0CC
	ldr r1, _0801A0C8 @ =gEnigmaBerries
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r3, [r0, 0x7]
	mov r8, r3
	ldrb r0, [r0, 0x1A]
	b _0801A0E2
	.align 2, 0
_0801A0C0: .4byte gBattleMons
_0801A0C4: .4byte gBankAttacker
_0801A0C8: .4byte gEnigmaBerries
_0801A0CC:
	ldr r0, [sp, 0x14]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, [sp, 0x14]
	bl ItemId_GetHoldEffectParam
	lsls r0, 24
	lsrs r0, 24
_0801A0E2:
	str r0, [sp, 0x10]
	ldr r2, _0801A118 @ =gBattleMons
	ldr r0, _0801A11C @ =gBankTarget
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r4, [r0, 0x2E]
	cmp r4, 0xAF
	beq _0801A102
	adds r0, r4, 0
	bl ItemId_GetHoldEffect
	adds r0, r4, 0
	bl ItemId_GetHoldEffectParam
_0801A102:
	ldr r4, [sp, 0x8]
	cmp r4, 0x4
	bls _0801A10C
	bl _0801B3CA
_0801A10C:
	lsls r0, r4, 2
	ldr r1, _0801A120 @ =_0801A124
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801A118: .4byte gBattleMons
_0801A11C: .4byte gBankTarget
_0801A120: .4byte _0801A124
	.align 2, 0
_0801A124:
	.4byte _0801A138
	.4byte _0801A1D4
	.4byte _0801B3CA
	.4byte _0801AE0C
	.4byte _0801B26C
_0801A138:
	cmp r5, 0x17
	beq _0801A15C
	cmp r5, 0x20
	beq _0801A144
	bl _0801B3CA
_0801A144:
	ldr r0, _0801A154 @ =0x02000000
	ldr r5, _0801A158 @ =0x00016056
	adds r0, r5
	movs r1, 0x2
	strb r1, [r0]
	bl _0801B3CA
	.align 2, 0
_0801A154: .4byte 0x02000000
_0801A158: .4byte 0x00016056
_0801A15C:
	ldr r0, _0801A1B8 @ =gBattleMons
	mov r8, r0
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	mov r0, r8
	adds r0, 0x18
	adds r1, r0
	movs r2, 0x6
	movs r3, 0x7
	mov r10, r3
_0801A172:
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0x5
	bgt _0801A180
	strb r2, [r1]
	movs r4, 0x5
	str r4, [sp, 0xC]
_0801A180:
	adds r1, 0x1
	movs r5, 0x1
	negs r5, r5
	add r10, r5
	mov r0, r10
	cmp r0, 0
	bge _0801A172
	ldr r1, [sp, 0xC]
	cmp r1, 0
	bne _0801A198
	bl _0801B3CA
_0801A198:
	ldr r0, _0801A1BC @ =0x02000000
	ldr r2, _0801A1C0 @ =0x00016003
	adds r0, r2
	strb r7, [r0]
	ldr r0, _0801A1C4 @ =gStringBank
	strb r7, [r0]
	ldr r1, _0801A1C8 @ =gActiveBank
	ldr r0, _0801A1CC @ =gBankAttacker
	strb r7, [r0]
	strb r7, [r1]
	ldr r0, _0801A1D0 @ =gUnknown_081D9A5E
	bl b_call_bc_move_exec
	bl _0801B3CA
	.align 2, 0
_0801A1B8: .4byte gBattleMons
_0801A1BC: .4byte 0x02000000
_0801A1C0: .4byte 0x00016003
_0801A1C4: .4byte gStringBank
_0801A1C8: .4byte gActiveBank
_0801A1CC: .4byte gBankAttacker
_0801A1D0: .4byte gUnknown_081D9A5E
_0801A1D4:
	ldr r1, _0801A1FC @ =gBattleMons
	movs r0, 0x58
	muls r0, r7
	adds r0, r1
	ldrh r0, [r0, 0x28]
	mov r8, r1
	cmp r0, 0
	bne _0801A1E8
	bl _0801B3CA
_0801A1E8:
	subs r0, r5, 0x1
	cmp r0, 0x2A
	bls _0801A1F2
	bl _0801AD5A
_0801A1F2:
	lsls r0, 2
	ldr r1, _0801A200 @ =_0801A204
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801A1FC: .4byte gBattleMons
_0801A200: .4byte _0801A204
	.align 2, 0
_0801A204:
	.4byte _0801A2B0
	.4byte _0801AAC8
	.4byte _0801AB84
	.4byte _0801AAF8
	.4byte _0801AB2C
	.4byte _0801AB5C
	.4byte _0801A2F8
	.4byte _0801ABC8
	.4byte _0801ABF8
	.4byte _0801A4CC
	.4byte _0801A548
	.4byte _0801A5C4
	.4byte _0801A634
	.4byte _0801A6C8
	.4byte _0801A75C
	.4byte _0801A7D4
	.4byte _0801A838
	.4byte _0801A89C
	.4byte _0801A900
	.4byte _0801A97C
	.4byte _0801A9C8
	.4byte _0801AD5A
	.4byte _0801A3F8
	.4byte _0801AD5A
	.4byte _0801AD5A
	.4byte _0801AD5A
	.4byte _0801AD5A
	.4byte _0801AD24
	.4byte _0801AD5A
	.4byte _0801AD5A
	.4byte _0801AD5A
	.4byte _0801AD5A
	.4byte _0801AD5A
	.4byte _0801AD5A
	.4byte _0801AD5A
	.4byte _0801AD5A
	.4byte _0801AD5A
	.4byte _0801AD5A
	.4byte _0801AD5A
	.4byte _0801AD5A
	.4byte _0801AD5A
	.4byte _0801AD5A
	.4byte _0801A46C
_0801A2B0:
	movs r0, 0x58
	muls r0, r7
	mov r3, r8
	adds r2, r0, r3
	ldrh r0, [r2, 0x2C]
	ldrh r1, [r2, 0x28]
	lsrs r0, 1
	cmp r1, r0
	bls _0801A2C6
	bl _0801AD5A
_0801A2C6:
	cmp r6, 0
	beq _0801A2CE
	bl _0801AD5A
_0801A2CE:
	ldr r4, _0801A2F0 @ =gBattleMoveDamage
	mov r5, r9
	str r5, [r4]
	ldrh r3, [r2, 0x28]
	adds r0, r3, r5
	ldrh r1, [r2, 0x2C]
	cmp r0, r1
	ble _0801A2E2
	subs r0, r1, r3
	str r0, [r4]
_0801A2E2:
	ldr r0, [r4]
	negs r0, r0
	str r0, [r4]
	ldr r0, _0801A2F4 @ =gUnknown_081D9A74
	bl b_call_bc_move_exec
	b _0801A752
	.align 2, 0
_0801A2F0: .4byte gBattleMoveDamage
_0801A2F4: .4byte gUnknown_081D9A74
_0801A2F8:
	cmp r6, 0
	beq _0801A300
	bl _0801AD5A
_0801A300:
	adds r0, r7, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _0801A324
	ldr r1, _0801A31C @ =gBattlePartyID
	lsls r0, r7, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0801A320 @ =gPlayerParty
	b _0801A332
	.align 2, 0
_0801A31C: .4byte gBattlePartyID
_0801A320: .4byte gPlayerParty
_0801A324:
	ldr r1, _0801A3A0 @ =gBattlePartyID
	lsls r0, r7, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0801A3A4 @ =gEnemyParty
_0801A332:
	adds r4, r1, r0
	movs r1, 0
	mov r10, r1
	add r5, sp, 0x4
_0801A33A:
	mov r1, r10
	adds r1, 0xD
	adds r0, r4, 0
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	mov r1, r10
	adds r1, 0x11
	adds r0, r4, 0
	bl GetMonData
	strb r0, [r5]
	adds r0, r4, 0
	movs r1, 0x15
	bl GetMonData
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r6, 0
	beq _0801A36A
	ldrb r0, [r5]
	cmp r0, 0
	beq _0801A374
_0801A36A:
	movs r2, 0x1
	add r10, r2
	mov r3, r10
	cmp r3, 0x3
	ble _0801A33A
_0801A374:
	mov r4, r10
	cmp r4, 0x4
	bne _0801A37E
	bl _0801AD5A
_0801A37E:
	lsls r2, r4, 24
	lsrs r2, 24
	adds r0, r6, 0
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r2, r0, 24
	add r0, sp, 0x4
	ldrb r0, [r0]
	mov r5, r9
	adds r1, r0, r5
	cmp r1, r2
	ble _0801A3A8
	add r0, sp, 0x4
	strb r2, [r0]
	b _0801A3AC
	.align 2, 0
_0801A3A0: .4byte gBattlePartyID
_0801A3A4: .4byte gEnemyParty
_0801A3A8:
	add r0, sp, 0x4
	strb r1, [r0]
_0801A3AC:
	ldr r1, _0801A3EC @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	strb r6, [r1, 0x2]
	lsrs r0, r6, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r0, _0801A3F0 @ =gUnknown_081D9A91
	bl b_call_bc_move_exec
	mov r1, r10
	adds r1, 0x9
	lsls r1, 24
	lsrs r1, 24
	add r0, sp, 0x4
	str r0, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0x1
	bl EmitSetAttributes
	ldr r0, _0801A3F4 @ =gActiveBank
	ldrb r0, [r0]
	bl MarkBufferBankForExecution
	movs r1, 0x3
	str r1, [sp, 0xC]
	bl _0801AD62
	.align 2, 0
_0801A3EC: .4byte gBattleTextBuff1
_0801A3F0: .4byte gUnknown_081D9A91
_0801A3F4: .4byte gActiveBank
_0801A3F8:
	ldr r0, _0801A450 @ =gBattleMons
	movs r1, 0x58
	muls r1, r7
	adds r0, 0x18
	adds r1, r0
	movs r2, 0x6
	movs r3, 0x7
	mov r10, r3
_0801A408:
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0x5
	bgt _0801A416
	strb r2, [r1]
	movs r4, 0x5
	str r4, [sp, 0xC]
_0801A416:
	adds r1, 0x1
	movs r5, 0x1
	negs r5, r5
	add r10, r5
	mov r0, r10
	cmp r0, 0
	bge _0801A408
	movs r1, 0x8
	mov r10, r1
	ldr r2, [sp, 0xC]
	cmp r2, 0
	bne _0801A432
	bl _0801B3CA
_0801A432:
	ldr r0, _0801A454 @ =0x02000000
	ldr r3, _0801A458 @ =0x00016003
	adds r0, r3
	strb r7, [r0]
	ldr r0, _0801A45C @ =gStringBank
	strb r7, [r0]
	ldr r1, _0801A460 @ =gActiveBank
	ldr r0, _0801A464 @ =gBankAttacker
	strb r7, [r0]
	strb r7, [r1]
	ldr r0, _0801A468 @ =gUnknown_081D9A5E
	bl b_call_bc_move_exec
	bl _0801AD5A
	.align 2, 0
_0801A450: .4byte gBattleMons
_0801A454: .4byte 0x02000000
_0801A458: .4byte 0x00016003
_0801A45C: .4byte gStringBank
_0801A460: .4byte gActiveBank
_0801A464: .4byte gBankAttacker
_0801A468: .4byte gUnknown_081D9A5E
_0801A46C:
	movs r0, 0x58
	muls r0, r7
	mov r4, r8
	adds r1, r0, r4
	ldrh r0, [r1, 0x28]
	ldrh r2, [r1, 0x2C]
	cmp r0, r2
	bcc _0801A480
	bl _0801AD5A
_0801A480:
	cmp r6, 0
	beq _0801A488
	bl _0801AD5A
_0801A488:
	ldr r3, _0801A4C4 @ =gBattleMoveDamage
	ldrh r0, [r1, 0x2C]
	lsrs r0, 4
	str r0, [r3]
	cmp r0, 0
	bne _0801A498
	movs r0, 0x1
	str r0, [r3]
_0801A498:
	ldrh r2, [r1, 0x28]
	ldr r0, [r3]
	adds r0, r2, r0
	ldrh r1, [r1, 0x2C]
	cmp r0, r1
	ble _0801A4A8
	subs r0, r1, r2
	str r0, [r3]
_0801A4A8:
	ldr r0, [r3]
	negs r0, r0
	str r0, [r3]
	ldr r0, _0801A4C8 @ =gUnknown_081D9AA1
	bl b_call_bc_move_exec
	movs r3, 0x4
	str r3, [sp, 0xC]
	adds r0, r7, 0
	adds r1, r5, 0
	bl RecordItemBattle
	bl _0801AD5A
	.align 2, 0
_0801A4C4: .4byte gBattleMoveDamage
_0801A4C8: .4byte gUnknown_081D9AA1
_0801A4CC:
	movs r0, 0x58
	adds r4, r7, 0
	muls r4, r0
	str r4, [sp, 0x18]
	add r4, r8
	ldrh r0, [r4, 0x2C]
	ldrh r1, [r4, 0x28]
	lsrs r0, 1
	cmp r1, r0
	bls _0801A4E4
	bl _0801AD5A
_0801A4E4:
	cmp r6, 0
	beq _0801A4EC
	bl _0801AD5A
_0801A4EC:
	ldr r1, _0801A540 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x8
	strb r0, [r1, 0x1]
	strb r6, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r5, _0801A544 @ =gBattleMoveDamage
	ldrh r0, [r4, 0x2C]
	mov r1, r9
	bl __divsi3
	str r0, [r5]
	cmp r0, 0
	bne _0801A510
	movs r0, 0x1
	str r0, [r5]
_0801A510:
	ldrh r2, [r4, 0x28]
	ldr r0, [r5]
	adds r0, r2, r0
	ldrh r1, [r4, 0x2C]
	cmp r0, r1
	ble _0801A520
	subs r0, r1, r2
	str r0, [r5]
_0801A520:
	ldr r0, [r5]
	negs r0, r0
	str r0, [r5]
	mov r0, r8
	adds r0, 0x48
	ldr r5, [sp, 0x18]
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, 0
_0801A532:
	bl sub_8040A7C
	lsls r0, 24
	cmp r0, 0
	bge _0801A53E
	b _0801A738
_0801A53E:
	b _0801A74C
	.align 2, 0
_0801A540: .4byte gBattleTextBuff1
_0801A544: .4byte gBattleMoveDamage
_0801A548:
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	str r1, [sp, 0x1C]
	adds r5, r1, 0
	add r5, r8
	ldrh r0, [r5, 0x2C]
	ldrh r1, [r5, 0x28]
	lsrs r0, 1
	cmp r1, r0
	bls _0801A562
	bl _0801AD5A
_0801A562:
	cmp r6, 0
	beq _0801A56A
	bl _0801AD5A
_0801A56A:
	ldr r1, _0801A5BC @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x8
	strb r0, [r1, 0x1]
	movs r6, 0x1
	strb r6, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r4, _0801A5C0 @ =gBattleMoveDamage
	ldrh r0, [r5, 0x2C]
	mov r1, r9
	bl __divsi3
	str r0, [r4]
	cmp r0, 0
	bne _0801A58E
	str r6, [r4]
_0801A58E:
	ldrh r2, [r5, 0x28]
	ldr r0, [r4]
	adds r0, r2, r0
	ldrh r1, [r5, 0x2C]
	cmp r0, r1
	ble _0801A59E
	subs r0, r1, r2
	str r0, [r4]
_0801A59E:
	ldr r0, [r4]
	negs r0, r0
	str r0, [r4]
	mov r0, r8
	adds r0, 0x48
	ldr r2, [sp, 0x1C]
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, 0x1
	bl sub_8040A7C
	lsls r0, 24
	cmp r0, 0
	blt _0801A6A4
	b _0801A6B8
	.align 2, 0
_0801A5BC: .4byte gBattleTextBuff1
_0801A5C0: .4byte gBattleMoveDamage
_0801A5C4:
	movs r0, 0x58
	adds r4, r7, 0
	muls r4, r0
	str r4, [sp, 0x20]
	adds r5, r4, 0
	add r5, r8
	ldrh r0, [r5, 0x2C]
	ldrh r1, [r5, 0x28]
	lsrs r0, 1
	cmp r1, r0
	bls _0801A5DC
	b _0801AD5A
_0801A5DC:
	cmp r6, 0
	beq _0801A5E2
	b _0801AD5A
_0801A5E2:
	ldr r1, _0801A62C @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x8
	strb r0, [r1, 0x1]
	movs r0, 0x2
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r4, _0801A630 @ =gBattleMoveDamage
	ldrh r0, [r5, 0x2C]
	mov r1, r9
	bl __divsi3
	str r0, [r4]
	cmp r0, 0
	bne _0801A608
	movs r0, 0x1
	str r0, [r4]
_0801A608:
	ldrh r2, [r5, 0x28]
	ldr r0, [r4]
	adds r0, r2, r0
	ldrh r1, [r5, 0x2C]
	cmp r0, r1
	ble _0801A618
	subs r0, r1, r2
	str r0, [r4]
_0801A618:
	ldr r0, [r4]
	negs r0, r0
	str r0, [r4]
	mov r0, r8
	adds r0, 0x48
	ldr r5, [sp, 0x20]
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, 0x2
	b _0801A532
	.align 2, 0
_0801A62C: .4byte gBattleTextBuff1
_0801A630: .4byte gBattleMoveDamage
_0801A634:
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	str r1, [sp, 0x24]
	adds r5, r1, 0
	add r5, r8
	ldrh r0, [r5, 0x2C]
	ldrh r1, [r5, 0x28]
	lsrs r0, 1
	cmp r1, r0
	bls _0801A64C
	b _0801AD5A
_0801A64C:
	cmp r6, 0
	beq _0801A652
	b _0801AD5A
_0801A652:
	ldr r1, _0801A6AC @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x8
	strb r0, [r1, 0x1]
	movs r0, 0x3
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r4, _0801A6B0 @ =gBattleMoveDamage
	ldrh r0, [r5, 0x2C]
	mov r1, r9
	bl __divsi3
	str r0, [r4]
	cmp r0, 0
	bne _0801A678
	movs r0, 0x1
	str r0, [r4]
_0801A678:
	ldrh r2, [r5, 0x28]
	ldr r0, [r4]
	adds r0, r2, r0
	ldrh r1, [r5, 0x2C]
	cmp r0, r1
	ble _0801A688
	subs r0, r1, r2
	str r0, [r4]
_0801A688:
	ldr r0, [r4]
	negs r0, r0
	str r0, [r4]
	mov r0, r8
	adds r0, 0x48
	ldr r2, [sp, 0x24]
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, 0x3
	bl sub_8040A7C
	lsls r0, 24
	cmp r0, 0
	bge _0801A6B8
_0801A6A4:
	ldr r0, _0801A6B4 @ =gUnknown_081D9AD4
	bl b_call_bc_move_exec
	b _0801A6BE
	.align 2, 0
_0801A6AC: .4byte gBattleTextBuff1
_0801A6B0: .4byte gBattleMoveDamage
_0801A6B4: .4byte gUnknown_081D9AD4
_0801A6B8:
	ldr r0, _0801A6C4 @ =gUnknown_081D9A74
	bl b_call_bc_move_exec
_0801A6BE:
	movs r3, 0x4
	str r3, [sp, 0xC]
	b _0801AD62
	.align 2, 0
_0801A6C4: .4byte gUnknown_081D9A74
_0801A6C8:
	movs r0, 0x58
	adds r4, r7, 0
	muls r4, r0
	str r4, [sp, 0x28]
	adds r5, r4, 0
	add r5, r8
	ldrh r0, [r5, 0x2C]
	ldrh r1, [r5, 0x28]
	lsrs r0, 1
	cmp r1, r0
	bls _0801A6E0
	b _0801AD5A
_0801A6E0:
	cmp r6, 0
	beq _0801A6E6
	b _0801AD5A
_0801A6E6:
	ldr r1, _0801A740 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x8
	strb r0, [r1, 0x1]
	movs r0, 0x4
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r4, _0801A744 @ =gBattleMoveDamage
	ldrh r0, [r5, 0x2C]
	mov r1, r9
	bl __divsi3
	str r0, [r4]
	cmp r0, 0
	bne _0801A70C
	movs r0, 0x1
	str r0, [r4]
_0801A70C:
	ldrh r2, [r5, 0x28]
	ldr r0, [r4]
	adds r0, r2, r0
	ldrh r1, [r5, 0x2C]
	cmp r0, r1
	ble _0801A71C
	subs r0, r1, r2
	str r0, [r4]
_0801A71C:
	ldr r0, [r4]
	negs r0, r0
	str r0, [r4]
	mov r0, r8
	adds r0, 0x48
	ldr r5, [sp, 0x28]
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, 0x4
	bl sub_8040A7C
	lsls r0, 24
	cmp r0, 0
	bge _0801A74C
_0801A738:
	ldr r0, _0801A748 @ =gUnknown_081D9AD4
	bl b_call_bc_move_exec
	b _0801A752
	.align 2, 0
_0801A740: .4byte gBattleTextBuff1
_0801A744: .4byte gBattleMoveDamage
_0801A748: .4byte gUnknown_081D9AD4
_0801A74C:
	ldr r0, _0801A758 @ =gUnknown_081D9A74
	bl b_call_bc_move_exec
_0801A752:
	movs r0, 0x4
	str r0, [sp, 0xC]
	b _0801AD62
	.align 2, 0
_0801A758: .4byte gUnknown_081D9A74
_0801A75C:
	movs r0, 0x58
	muls r0, r7
	mov r1, r8
	adds r5, r0, r1
	ldrh r4, [r5, 0x28]
	ldrh r0, [r5, 0x2C]
	mov r1, r9
	bl __divsi3
	cmp r4, r0
	ble _0801A774
	b _0801AD5A
_0801A774:
	cmp r6, 0
	beq _0801A77A
	b _0801AD5A
_0801A77A:
	movs r0, 0x19
	ldrsb r0, [r5, r0]
	cmp r0, 0xB
	ble _0801A784
	b _0801AD5A
_0801A784:
	ldr r1, _0801A7BC @ =gBattleTextBuff1
	movs r2, 0xFD
	strb r2, [r1]
	movs r0, 0x5
	strb r0, [r1, 0x1]
	movs r0, 0x1
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r1, _0801A7C0 @ =gBattleTextBuff2
	strb r2, [r1]
	strb r6, [r1, 0x1]
	movs r0, 0xD2
	strb r0, [r1, 0x2]
	strb r6, [r1, 0x3]
	subs r0, 0xD3
	strb r0, [r1, 0x4]
	ldr r0, _0801A7C4 @ =gEffectBank
	strb r7, [r0]
	ldr r1, _0801A7C8 @ =0x02000000
	ldr r3, _0801A7CC @ =0x0001601e
	adds r2, r1, r3
	movs r0, 0x11
	strb r0, [r2]
	ldr r4, _0801A7D0 @ =0x000160a4
	adds r2, r1, r4
	movs r0, 0xF
	b _0801A94C
	.align 2, 0
_0801A7BC: .4byte gBattleTextBuff1
_0801A7C0: .4byte gBattleTextBuff2
_0801A7C4: .4byte gEffectBank
_0801A7C8: .4byte 0x02000000
_0801A7CC: .4byte 0x0001601e
_0801A7D0: .4byte 0x000160a4
_0801A7D4:
	movs r0, 0x58
	muls r0, r7
	mov r1, r8
	adds r5, r0, r1
	ldrh r4, [r5, 0x28]
	ldrh r0, [r5, 0x2C]
	mov r1, r9
	bl __divsi3
	cmp r4, r0
	ble _0801A7EC
	b _0801AD5A
_0801A7EC:
	cmp r6, 0
	beq _0801A7F2
	b _0801AD5A
_0801A7F2:
	movs r0, 0x1A
	ldrsb r0, [r5, r0]
	cmp r0, 0xB
	ble _0801A7FC
	b _0801AD5A
_0801A7FC:
	ldr r1, _0801A824 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x5
	strb r0, [r1, 0x1]
	movs r0, 0x2
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r0, _0801A828 @ =gEffectBank
	strb r7, [r0]
	ldr r1, _0801A82C @ =0x02000000
	ldr r3, _0801A830 @ =0x0001601e
	adds r2, r1, r3
	movs r0, 0x12
	strb r0, [r2]
	ldr r4, _0801A834 @ =0x000160a4
	adds r2, r1, r4
	movs r0, 0x10
	b _0801A94C
	.align 2, 0
_0801A824: .4byte gBattleTextBuff1
_0801A828: .4byte gEffectBank
_0801A82C: .4byte 0x02000000
_0801A830: .4byte 0x0001601e
_0801A834: .4byte 0x000160a4
_0801A838:
	movs r0, 0x58
	muls r0, r7
	mov r1, r8
	adds r5, r0, r1
	ldrh r4, [r5, 0x28]
	ldrh r0, [r5, 0x2C]
	mov r1, r9
	bl __divsi3
	cmp r4, r0
	ble _0801A850
	b _0801AD5A
_0801A850:
	cmp r6, 0
	beq _0801A856
	b _0801AD5A
_0801A856:
	movs r0, 0x1B
	ldrsb r0, [r5, r0]
	cmp r0, 0xB
	ble _0801A860
	b _0801AD5A
_0801A860:
	ldr r1, _0801A888 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x5
	strb r0, [r1, 0x1]
	movs r0, 0x3
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r0, _0801A88C @ =gEffectBank
	strb r7, [r0]
	ldr r1, _0801A890 @ =0x02000000
	ldr r3, _0801A894 @ =0x0001601e
	adds r2, r1, r3
	movs r0, 0x13
	strb r0, [r2]
	ldr r4, _0801A898 @ =0x000160a4
	adds r2, r1, r4
	movs r0, 0x11
	b _0801A94C
	.align 2, 0
_0801A888: .4byte gBattleTextBuff1
_0801A88C: .4byte gEffectBank
_0801A890: .4byte 0x02000000
_0801A894: .4byte 0x0001601e
_0801A898: .4byte 0x000160a4
_0801A89C:
	movs r0, 0x58
	muls r0, r7
	mov r1, r8
	adds r5, r0, r1
	ldrh r4, [r5, 0x28]
	ldrh r0, [r5, 0x2C]
	mov r1, r9
	bl __divsi3
	cmp r4, r0
	ble _0801A8B4
	b _0801AD5A
_0801A8B4:
	cmp r6, 0
	beq _0801A8BA
	b _0801AD5A
_0801A8BA:
	movs r0, 0x1C
	ldrsb r0, [r5, r0]
	cmp r0, 0xB
	ble _0801A8C4
	b _0801AD5A
_0801A8C4:
	ldr r1, _0801A8EC @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x5
	strb r0, [r1, 0x1]
	movs r0, 0x4
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r0, _0801A8F0 @ =gEffectBank
	strb r7, [r0]
	ldr r1, _0801A8F4 @ =0x02000000
	ldr r3, _0801A8F8 @ =0x0001601e
	adds r2, r1, r3
	movs r0, 0x14
	strb r0, [r2]
	ldr r4, _0801A8FC @ =0x000160a4
	adds r2, r1, r4
	movs r0, 0x12
	b _0801A94C
	.align 2, 0
_0801A8EC: .4byte gBattleTextBuff1
_0801A8F0: .4byte gEffectBank
_0801A8F4: .4byte 0x02000000
_0801A8F8: .4byte 0x0001601e
_0801A8FC: .4byte 0x000160a4
_0801A900:
	movs r0, 0x58
	muls r0, r7
	mov r1, r8
	adds r5, r0, r1
	ldrh r4, [r5, 0x28]
	ldrh r0, [r5, 0x2C]
	mov r1, r9
	bl __divsi3
	cmp r4, r0
	ble _0801A918
	b _0801AD5A
_0801A918:
	cmp r6, 0
	beq _0801A91E
	b _0801AD5A
_0801A91E:
	movs r0, 0x1D
	ldrsb r0, [r5, r0]
	cmp r0, 0xB
	ble _0801A928
	b _0801AD5A
_0801A928:
	ldr r1, _0801A960 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x5
	strb r0, [r1, 0x1]
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r0, _0801A964 @ =gEffectBank
	strb r7, [r0]
	ldr r1, _0801A968 @ =0x02000000
	ldr r3, _0801A96C @ =0x0001601e
	adds r2, r1, r3
	movs r0, 0x15
	strb r0, [r2]
	ldr r4, _0801A970 @ =0x000160a4
	adds r2, r1, r4
	movs r0, 0x13
_0801A94C:
	strb r0, [r2]
	ldr r5, _0801A974 @ =0x000160a5
	adds r1, r5
	strb r6, [r1]
	ldr r0, _0801A978 @ =gUnknown_081D9AFE
	bl b_call_bc_move_exec
	movs r0, 0x5
	str r0, [sp, 0xC]
	b _0801AD62
	.align 2, 0
_0801A960: .4byte gBattleTextBuff1
_0801A964: .4byte gEffectBank
_0801A968: .4byte 0x02000000
_0801A96C: .4byte 0x0001601e
_0801A970: .4byte 0x000160a4
_0801A974: .4byte 0x000160a5
_0801A978: .4byte gUnknown_081D9AFE
_0801A97C:
	movs r0, 0x58
	adds r5, r7, 0
	muls r5, r0
	mov r1, r8
	adds r0, r5, r1
	ldrh r4, [r0, 0x28]
	ldrh r0, [r0, 0x2C]
	mov r1, r9
	bl __divsi3
	cmp r4, r0
	ble _0801A996
	b _0801AD5A
_0801A996:
	cmp r6, 0
	beq _0801A99C
	b _0801AD5A
_0801A99C:
	mov r0, r8
	adds r0, 0x50
	adds r1, r5, r0
	ldr r2, [r1]
	movs r3, 0x80
	lsls r3, 13
	adds r0, r2, 0
	ands r0, r3
	cmp r0, 0
	beq _0801A9B2
	b _0801AD5A
_0801A9B2:
	orrs r2, r3
	str r2, [r1]
	ldr r0, _0801A9C4 @ =gUnknown_081D9B19
	bl b_call_bc_move_exec
	movs r2, 0x2
	str r2, [sp, 0xC]
	b _0801AD62
	.align 2, 0
_0801A9C4: .4byte gUnknown_081D9B19
_0801A9C8:
	cmp r6, 0
	beq _0801A9CE
	b _0801AD5A
_0801A9CE:
	movs r0, 0x58
	adds r5, r7, 0
	muls r5, r0
	mov r3, r8
	adds r0, r5, r3
	ldrh r4, [r0, 0x28]
	ldrh r0, [r0, 0x2C]
	mov r1, r9
	bl __divsi3
	cmp r4, r0
	ble _0801A9E8
	b _0801AD5A
_0801A9E8:
	movs r4, 0
	mov r10, r4
	adds r0, r5, 0x1
	mov r1, r8
	adds r1, 0x18
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0xB
	ble _0801AA18
	mov r0, r8
	adds r0, 0x19
	adds r1, r5, r0
_0801AA04:
	adds r1, 0x1
	movs r5, 0x1
	add r10, r5
	mov r0, r10
	cmp r0, 0x4
	bgt _0801AA18
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0xB
	bgt _0801AA04
_0801AA18:
	mov r1, r10
	cmp r1, 0x5
	bne _0801AA20
	b _0801AD5A
_0801AA20:
	movs r0, 0x58
	muls r0, r7
	adds r4, r0, 0x1
	ldr r5, _0801AAA4 @ =gUnknown_02024A98
_0801AA28:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	adds r0, r4
	adds r0, r5
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0xC
	beq _0801AA28
	ldr r1, _0801AAA8 @ =gBattleTextBuff1
	movs r3, 0
	movs r2, 0xFD
	strb r2, [r1]
	movs r0, 0x5
	strb r0, [r1, 0x1]
	mov r0, r10
	adds r0, 0x1
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r0, _0801AAAC @ =gBattleTextBuff2
	strb r2, [r0]
	strb r3, [r0, 0x1]
	movs r1, 0xD1
	strb r1, [r0, 0x2]
	strb r3, [r0, 0x3]
	strb r3, [r0, 0x4]
	movs r1, 0xD2
	strb r1, [r0, 0x5]
	strb r3, [r0, 0x6]
	subs r1, 0xD3
	strb r1, [r0, 0x7]
	ldr r0, _0801AAB0 @ =gEffectBank
	strb r7, [r0]
	ldr r1, _0801AAB4 @ =0x02000000
	mov r2, r10
	adds r2, 0x21
	ldr r4, _0801AAB8 @ =0x0001601e
	adds r0, r1, r4
	strb r2, [r0]
	adds r2, 0x6
	ldr r5, _0801AABC @ =0x000160a4
	adds r0, r1, r5
	strb r2, [r0]
	ldr r0, _0801AAC0 @ =0x000160a5
	adds r1, r0
	strb r3, [r1]
	ldr r0, _0801AAC4 @ =gUnknown_081D9AFE
	bl b_call_bc_move_exec
	movs r1, 0x5
	str r1, [sp, 0xC]
	b _0801AD62
	.align 2, 0
_0801AAA4: .4byte gUnknown_02024A98
_0801AAA8: .4byte gBattleTextBuff1
_0801AAAC: .4byte gBattleTextBuff2
_0801AAB0: .4byte gEffectBank
_0801AAB4: .4byte 0x02000000
_0801AAB8: .4byte 0x0001601e
_0801AABC: .4byte 0x000160a4
_0801AAC0: .4byte 0x000160a5
_0801AAC4: .4byte gUnknown_081D9AFE
_0801AAC8:
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	mov r0, r8
	adds r0, 0x4C
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0x40
	ands r0, r2
	cmp r0, 0
	bne _0801AAE0
	b _0801AD5A
_0801AAE0:
	movs r0, 0x41
	negs r0, r0
	ands r2, r0
	str r2, [r1]
	ldr r0, _0801AAF4 @ =gUnknown_081D99B6
	bl b_call_bc_move_exec
	movs r2, 0x1
	str r2, [sp, 0xC]
	b _0801AD62
	.align 2, 0
_0801AAF4: .4byte gUnknown_081D99B6
_0801AAF8:
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	mov r0, r8
	adds r0, 0x4C
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0x88
	ands r0, r2
	cmp r0, 0
	bne _0801AB10
	b _0801AD5A
_0801AB10:
	ldr r0, _0801AB24 @ =0xfffff077
	ands r2, r0
	str r2, [r1]
	ldr r0, _0801AB28 @ =gUnknown_081D99CE
	bl b_call_bc_move_exec
	movs r3, 0x1
	str r3, [sp, 0xC]
	b _0801AD62
	.align 2, 0
_0801AB24: .4byte 0xfffff077
_0801AB28: .4byte gUnknown_081D99CE
_0801AB2C:
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	mov r0, r8
	adds r0, 0x4C
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	bne _0801AB44
	b _0801AD5A
_0801AB44:
	movs r0, 0x11
	negs r0, r0
	ands r2, r0
	str r2, [r1]
	ldr r0, _0801AB58 @ =gUnknown_081D99E6
	bl b_call_bc_move_exec
	movs r4, 0x1
	str r4, [sp, 0xC]
	b _0801AD62
	.align 2, 0
_0801AB58: .4byte gUnknown_081D99E6
_0801AB5C:
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	mov r0, r8
	adds r0, 0x4C
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	bne _0801AB74
	b _0801AD5A
_0801AB74:
	movs r0, 0x21
	negs r0, r0
	ands r2, r0
	str r2, [r1]
	ldr r0, _0801AB80 @ =gUnknown_081D99FE
	b _0801AD0E
	.align 2, 0
_0801AB80: .4byte gUnknown_081D99FE
_0801AB84:
	movs r0, 0x58
	adds r3, r7, 0
	muls r3, r0
	mov r0, r8
	adds r0, 0x4C
	adds r2, r3, r0
	ldr r1, [r2]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0801AB9C
	b _0801AD5A
_0801AB9C:
	movs r0, 0x8
	negs r0, r0
	ands r1, r0
	str r1, [r2]
	mov r1, r8
	adds r1, 0x50
	adds r1, r3, r1
	ldr r0, [r1]
	ldr r2, _0801ABC0 @ =0xf7ffffff
	ands r0, r2
	str r0, [r1]
	ldr r0, _0801ABC4 @ =gUnknown_081D9A16
	bl b_call_bc_move_exec
	movs r0, 0x1
	str r0, [sp, 0xC]
	b _0801AD62
	.align 2, 0
_0801ABC0: .4byte 0xf7ffffff
_0801ABC4: .4byte gUnknown_081D9A16
_0801ABC8:
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	mov r0, r8
	adds r0, 0x50
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0x7
	ands r0, r2
	cmp r0, 0
	bne _0801ABE0
	b _0801AD5A
_0801ABE0:
	movs r0, 0x8
	negs r0, r0
	ands r2, r0
	str r2, [r1]
	ldr r0, _0801ABF4 @ =gUnknown_081D9A2E
	bl b_call_bc_move_exec
	movs r1, 0x2
	str r1, [sp, 0xC]
	b _0801AD62
	.align 2, 0
_0801ABF4: .4byte gUnknown_081D9A2E
_0801ABF8:
	movs r0, 0x58
	adds r5, r7, 0
	muls r5, r0
	mov r0, r8
	adds r0, 0x4C
	adds r4, r5, r0
	ldr r2, [r4]
	ldrb r0, [r4]
	cmp r0, 0
	bne _0801AC1E
	mov r0, r8
	adds r0, 0x50
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0801AC1E
	b _0801AD5A
_0801AC1E:
	movs r3, 0
	mov r10, r3
	movs r0, 0x88
	ands r2, r0
	cmp r2, 0
	beq _0801AC36
	ldr r0, _0801ACC4 @ =gBattleTextBuff1
	ldr r1, _0801ACC8 @ =gStatusConditionString_PoisonJpn
	bl StringCopy
	movs r0, 0x1
	mov r10, r0
_0801AC36:
	ldr r0, [r4]
	movs r1, 0x7
	mov r9, r1
	ands r0, r1
	mov r6, r8
	adds r6, 0x50
	cmp r0, 0
	beq _0801AC5C
	adds r2, r5, r6
	ldr r0, [r2]
	ldr r1, _0801ACCC @ =0xf7ffffff
	ands r0, r1
	str r0, [r2]
	ldr r0, _0801ACC4 @ =gBattleTextBuff1
	ldr r1, _0801ACD0 @ =gStatusConditionString_SleepJpn
	bl StringCopy
	movs r2, 0x1
	add r10, r2
_0801AC5C:
	ldr r0, [r4]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0801AC72
	ldr r0, _0801ACC4 @ =gBattleTextBuff1
	ldr r1, _0801ACD4 @ =gStatusConditionString_ParalysisJpn
	bl StringCopy
	movs r3, 0x1
	add r10, r3
_0801AC72:
	ldr r0, [r4]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0801AC88
	ldr r0, _0801ACC4 @ =gBattleTextBuff1
	ldr r1, _0801ACD8 @ =gStatusConditionString_BurnJpn
	bl StringCopy
	movs r0, 0x1
	add r10, r0
_0801AC88:
	ldr r0, [r4]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0801AC9E
	ldr r0, _0801ACC4 @ =gBattleTextBuff1
	ldr r1, _0801ACDC @ =gStatusConditionString_IceJpn
	bl StringCopy
	movs r1, 0x1
	add r10, r1
_0801AC9E:
	adds r0, r5, r6
	ldr r0, [r0]
	mov r2, r9
	ands r0, r2
	cmp r0, 0
	beq _0801ACB6
	ldr r0, _0801ACC4 @ =gBattleTextBuff1
	ldr r1, _0801ACE0 @ =gStatusConditionString_ConfusionJpn
	bl StringCopy
	movs r3, 0x1
	add r10, r3
_0801ACB6:
	mov r4, r10
	cmp r4, 0x1
	bgt _0801ACE8
	ldr r1, _0801ACE4 @ =gBattleCommunication
	movs r0, 0
	b _0801ACEC
	.align 2, 0
_0801ACC4: .4byte gBattleTextBuff1
_0801ACC8: .4byte gStatusConditionString_PoisonJpn
_0801ACCC: .4byte 0xf7ffffff
_0801ACD0: .4byte gStatusConditionString_SleepJpn
_0801ACD4: .4byte gStatusConditionString_ParalysisJpn
_0801ACD8: .4byte gStatusConditionString_BurnJpn
_0801ACDC: .4byte gStatusConditionString_IceJpn
_0801ACE0: .4byte gStatusConditionString_ConfusionJpn
_0801ACE4: .4byte gBattleCommunication
_0801ACE8:
	ldr r1, _0801AD18 @ =gBattleCommunication
	movs r0, 0x1
_0801ACEC:
	strb r0, [r1, 0x5]
	ldr r2, _0801AD1C @ =gBattleMons
	movs r0, 0x58
	adds r3, r7, 0
	muls r3, r0
	adds r0, r2, 0
	adds r0, 0x4C
	adds r0, r3, r0
	movs r1, 0
	str r1, [r0]
	adds r2, 0x50
	adds r3, r2
	ldr r0, [r3]
	subs r1, 0x8
	ands r0, r1
	str r0, [r3]
	ldr r0, _0801AD20 @ =gUnknown_081D9A44
_0801AD0E:
	bl b_call_bc_move_exec
	movs r5, 0x1
	str r5, [sp, 0xC]
	b _0801AD62
	.align 2, 0
_0801AD18: .4byte gBattleCommunication
_0801AD1C: .4byte gBattleMons
_0801AD20: .4byte gUnknown_081D9A44
_0801AD24:
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	mov r0, r8
	adds r0, 0x50
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0xF0
	lsls r0, 12
	ands r0, r2
	cmp r0, 0
	beq _0801AD5A
	ldr r0, _0801AD84 @ =0xfff0ffff
	ands r2, r0
	str r2, [r1]
	ldr r0, _0801AD88 @ =gBattleTextBuff1
	ldr r1, _0801AD8C @ =gStatusConditionString_LoveJpn
	bl StringCopy
	ldr r0, _0801AD90 @ =gUnknown_081D9A44
	bl b_call_bc_move_exec
	ldr r1, _0801AD94 @ =gBattleCommunication
	movs r0, 0
	strb r0, [r1, 0x5]
	movs r0, 0x2
	str r0, [sp, 0xC]
_0801AD5A:
	ldr r1, [sp, 0xC]
	cmp r1, 0
	bne _0801AD62
	b _0801B3CA
_0801AD62:
	ldr r0, _0801AD98 @ =0x02000000
	ldr r2, _0801AD9C @ =0x00016003
	adds r0, r2
	strb r7, [r0]
	ldr r0, _0801ADA0 @ =gStringBank
	strb r7, [r0]
	ldr r4, _0801ADA4 @ =gActiveBank
	ldr r0, _0801ADA8 @ =gBankAttacker
	strb r7, [r0]
	strb r7, [r4]
	ldr r3, [sp, 0xC]
	cmp r3, 0x1
	beq _0801ADAC
	cmp r3, 0x3
	beq _0801ADB2
	b _0801B3CA
	.align 2, 0
_0801AD84: .4byte 0xfff0ffff
_0801AD88: .4byte gBattleTextBuff1
_0801AD8C: .4byte gStatusConditionString_LoveJpn
_0801AD90: .4byte gUnknown_081D9A44
_0801AD94: .4byte gBattleCommunication
_0801AD98: .4byte 0x02000000
_0801AD9C: .4byte 0x00016003
_0801ADA0: .4byte gStringBank
_0801ADA4: .4byte gActiveBank
_0801ADA8: .4byte gBankAttacker
_0801ADAC:
	movs r0, 0x58
	muls r0, r7
	b _0801B224
_0801ADB2:
	ldr r4, _0801AE00 @ =gBattleMons
	movs r0, 0x58
	adds r3, r7, 0
	muls r3, r0
	adds r0, r4, 0
	adds r0, 0x50
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	beq _0801ADCE
	b _0801B3CA
_0801ADCE:
	ldr r1, _0801AE04 @ =gDisableStructs
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _0801AE08 @ =gBitTable
	mov r5, r10
	lsls r0, r5, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0801ADEE
	b _0801B3CA
_0801ADEE:
	adds r1, r5, r3
	adds r0, r4, 0
	adds r0, 0x24
	adds r1, r0
	add r0, sp, 0x4
	ldrb r0, [r0]
	strb r0, [r1]
	b _0801B3CA
	.align 2, 0
_0801AE00: .4byte gBattleMons
_0801AE04: .4byte gDisableStructs
_0801AE08: .4byte gBitTable
_0801AE0C:
	movs r7, 0
	ldr r0, _0801AE3C @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r7, r0
	bcc _0801AE18
	b _0801B3CA
_0801AE18:
	ldr r4, _0801AE40 @ =gLastUsedItem
	ldr r1, _0801AE44 @ =gBattleMons
	movs r0, 0x58
	muls r0, r7
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	strh r0, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _0801AE4C
	ldr r1, _0801AE48 @ =gEnigmaBerries
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r1
	ldrb r5, [r0, 0x7]
	b _0801AE5C
	.align 2, 0
_0801AE3C: .4byte gNoOfAllBanks
_0801AE40: .4byte gLastUsedItem
_0801AE44: .4byte gBattleMons
_0801AE48: .4byte gEnigmaBerries
_0801AE4C:
	ldrh r0, [r4]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r0, [r4]
	bl ItemId_GetHoldEffectParam
_0801AE5C:
	subs r0, r5, 0x2
	cmp r0, 0x1A
	bls _0801AE64
	b _0801B208
_0801AE64:
	lsls r0, 2
	ldr r1, _0801AE70 @ =_0801AE74
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801AE70: .4byte _0801AE74
	.align 2, 0
_0801AE74:
	.4byte _0801AEE0
	.4byte _0801AFC8
	.4byte _0801AF1C
	.4byte _0801AF58
	.4byte _0801AF94
	.4byte _0801B208
	.4byte _0801B018
	.4byte _0801B0AC
	.4byte _0801B208
	.4byte _0801B208
	.4byte _0801B208
	.4byte _0801B208
	.4byte _0801B208
	.4byte _0801B208
	.4byte _0801B208
	.4byte _0801B208
	.4byte _0801B208
	.4byte _0801B208
	.4byte _0801B208
	.4byte _0801B208
	.4byte _0801B208
	.4byte _0801B1A0
	.4byte _0801B208
	.4byte _0801B208
	.4byte _0801B208
	.4byte _0801B208
	.4byte _0801B054
_0801AEE0:
	ldr r1, _0801AF10 @ =gBattleMons
	movs r0, 0x58
	muls r0, r7
	adds r1, 0x4C
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0801AEF6
	b _0801B208
_0801AEF6:
	movs r0, 0x41
	negs r0, r0
	ands r1, r0
	str r1, [r2]
	bl b_movescr_stack_push_cursor
	ldr r1, _0801AF14 @ =gBattlescriptCurrInstr
	ldr r0, _0801AF18 @ =gUnknown_081D99BC
	str r0, [r1]
	movs r0, 0x1
	str r0, [sp, 0xC]
	b _0801B20E
	.align 2, 0
_0801AF10: .4byte gBattleMons
_0801AF14: .4byte gBattlescriptCurrInstr
_0801AF18: .4byte gUnknown_081D99BC
_0801AF1C:
	ldr r1, _0801AF48 @ =gBattleMons
	movs r0, 0x58
	muls r0, r7
	adds r1, 0x4C
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x88
	ands r0, r1
	cmp r0, 0
	bne _0801AF32
	b _0801B208
_0801AF32:
	ldr r0, _0801AF4C @ =0xfffff077
	ands r1, r0
	str r1, [r2]
	bl b_movescr_stack_push_cursor
	ldr r1, _0801AF50 @ =gBattlescriptCurrInstr
	ldr r0, _0801AF54 @ =gUnknown_081D99D4
	str r0, [r1]
	movs r1, 0x1
	str r1, [sp, 0xC]
	b _0801B20E
	.align 2, 0
_0801AF48: .4byte gBattleMons
_0801AF4C: .4byte 0xfffff077
_0801AF50: .4byte gBattlescriptCurrInstr
_0801AF54: .4byte gUnknown_081D99D4
_0801AF58:
	ldr r1, _0801AF88 @ =gBattleMons
	movs r0, 0x58
	muls r0, r7
	adds r1, 0x4C
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0801AF6E
	b _0801B208
_0801AF6E:
	movs r0, 0x11
	negs r0, r0
	ands r1, r0
	str r1, [r2]
	bl b_movescr_stack_push_cursor
	ldr r1, _0801AF8C @ =gBattlescriptCurrInstr
	ldr r0, _0801AF90 @ =gUnknown_081D99EC
	str r0, [r1]
	movs r2, 0x1
	str r2, [sp, 0xC]
	b _0801B20E
	.align 2, 0
_0801AF88: .4byte gBattleMons
_0801AF8C: .4byte gBattlescriptCurrInstr
_0801AF90: .4byte gUnknown_081D99EC
_0801AF94:
	ldr r1, _0801AFBC @ =gBattleMons
	movs r0, 0x58
	muls r0, r7
	adds r1, 0x4C
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _0801AFAA
	b _0801B208
_0801AFAA:
	movs r0, 0x21
	negs r0, r0
	ands r1, r0
	str r1, [r2]
	bl b_movescr_stack_push_cursor
	ldr r1, _0801AFC0 @ =gBattlescriptCurrInstr
	ldr r0, _0801AFC4 @ =gUnknown_081D9A04
	b _0801B168
	.align 2, 0
_0801AFBC: .4byte gBattleMons
_0801AFC0: .4byte gBattlescriptCurrInstr
_0801AFC4: .4byte gUnknown_081D9A04
_0801AFC8:
	ldr r2, _0801B008 @ =gBattleMons
	movs r0, 0x58
	adds r4, r7, 0
	muls r4, r0
	adds r0, r2, 0
	adds r0, 0x4C
	adds r3, r4, r0
	ldr r1, [r3]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0801AFE2
	b _0801B208
_0801AFE2:
	movs r0, 0x8
	negs r0, r0
	ands r1, r0
	str r1, [r3]
	adds r2, 0x50
	adds r2, r4, r2
	ldr r0, [r2]
	ldr r1, _0801B00C @ =0xf7ffffff
	ands r0, r1
	str r0, [r2]
	bl b_movescr_stack_push_cursor
	ldr r1, _0801B010 @ =gBattlescriptCurrInstr
	ldr r0, _0801B014 @ =gUnknown_081D9A1C
	str r0, [r1]
	movs r4, 0x1
	str r4, [sp, 0xC]
	b _0801B20E
	.align 2, 0
_0801B008: .4byte gBattleMons
_0801B00C: .4byte 0xf7ffffff
_0801B010: .4byte gBattlescriptCurrInstr
_0801B014: .4byte gUnknown_081D9A1C
_0801B018:
	ldr r1, _0801B048 @ =gBattleMons
	movs r0, 0x58
	muls r0, r7
	adds r1, 0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0801B02E
	b _0801B208
_0801B02E:
	movs r0, 0x8
	negs r0, r0
	ands r1, r0
	str r1, [r2]
	bl b_movescr_stack_push_cursor
	ldr r1, _0801B04C @ =gBattlescriptCurrInstr
	ldr r0, _0801B050 @ =gUnknown_081D9A34
	str r0, [r1]
	movs r5, 0x2
	str r5, [sp, 0xC]
	b _0801B20E
	.align 2, 0
_0801B048: .4byte gBattleMons
_0801B04C: .4byte gBattlescriptCurrInstr
_0801B050: .4byte gUnknown_081D9A34
_0801B054:
	ldr r1, _0801B090 @ =gBattleMons
	movs r0, 0x58
	muls r0, r7
	adds r1, 0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0xF0
	lsls r0, 12
	ands r0, r1
	cmp r0, 0
	bne _0801B06C
	b _0801B208
_0801B06C:
	ldr r0, _0801B094 @ =0xfff0ffff
	ands r1, r0
	str r1, [r2]
	ldr r0, _0801B098 @ =gBattleTextBuff1
	ldr r1, _0801B09C @ =gStatusConditionString_LoveJpn
	bl StringCopy
	bl b_movescr_stack_push_cursor
	ldr r1, _0801B0A0 @ =gBattleCommunication
	movs r0, 0
	strb r0, [r1, 0x5]
	ldr r1, _0801B0A4 @ =gBattlescriptCurrInstr
	ldr r0, _0801B0A8 @ =gUnknown_081D9A4A
	str r0, [r1]
	movs r0, 0x2
	str r0, [sp, 0xC]
	b _0801B20E
	.align 2, 0
_0801B090: .4byte gBattleMons
_0801B094: .4byte 0xfff0ffff
_0801B098: .4byte gBattleTextBuff1
_0801B09C: .4byte gStatusConditionString_LoveJpn
_0801B0A0: .4byte gBattleCommunication
_0801B0A4: .4byte gBattlescriptCurrInstr
_0801B0A8: .4byte gUnknown_081D9A4A
_0801B0AC:
	ldr r4, _0801B170 @ =gBattleMons
	movs r0, 0x58
	adds r5, r7, 0
	muls r5, r0
	adds r0, r4, 0
	adds r0, 0x4C
	adds r6, r5, r0
	ldr r2, [r6]
	ldrb r0, [r6]
	cmp r0, 0
	bne _0801B0D4
	adds r0, r4, 0
	adds r0, 0x50
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0801B0D4
	b _0801B208
_0801B0D4:
	movs r0, 0x88
	ands r2, r0
	cmp r2, 0
	beq _0801B0E4
	ldr r0, _0801B174 @ =gBattleTextBuff1
	ldr r1, _0801B178 @ =gStatusConditionString_PoisonJpn
	bl StringCopy
_0801B0E4:
	ldr r0, [r6]
	movs r1, 0x7
	mov r8, r1
	ands r0, r1
	adds r4, 0x50
	cmp r0, 0
	beq _0801B104
	adds r2, r5, r4
	ldr r0, [r2]
	ldr r1, _0801B17C @ =0xf7ffffff
	ands r0, r1
	str r0, [r2]
	ldr r0, _0801B174 @ =gBattleTextBuff1
	ldr r1, _0801B180 @ =gStatusConditionString_SleepJpn
	bl StringCopy
_0801B104:
	ldr r0, [r6]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0801B116
	ldr r0, _0801B174 @ =gBattleTextBuff1
	ldr r1, _0801B184 @ =gStatusConditionString_ParalysisJpn
	bl StringCopy
_0801B116:
	ldr r0, [r6]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0801B128
	ldr r0, _0801B174 @ =gBattleTextBuff1
	ldr r1, _0801B188 @ =gStatusConditionString_BurnJpn
	bl StringCopy
_0801B128:
	ldr r0, [r6]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0801B13A
	ldr r0, _0801B174 @ =gBattleTextBuff1
	ldr r1, _0801B18C @ =gStatusConditionString_IceJpn
	bl StringCopy
_0801B13A:
	adds r5, r4
	ldr r0, [r5]
	mov r2, r8
	ands r0, r2
	cmp r0, 0
	beq _0801B14E
	ldr r0, _0801B174 @ =gBattleTextBuff1
	ldr r1, _0801B190 @ =gStatusConditionString_ConfusionJpn
	bl StringCopy
_0801B14E:
	movs r4, 0
	str r4, [r6]
	ldr r0, [r5]
	movs r1, 0x8
	negs r1, r1
	ands r0, r1
	str r0, [r5]
	bl b_movescr_stack_push_cursor
	ldr r0, _0801B194 @ =gBattleCommunication
	strb r4, [r0, 0x5]
	ldr r1, _0801B198 @ =gBattlescriptCurrInstr
	ldr r0, _0801B19C @ =gUnknown_081D9A4A
_0801B168:
	str r0, [r1]
	movs r3, 0x1
	str r3, [sp, 0xC]
	b _0801B20E
	.align 2, 0
_0801B170: .4byte gBattleMons
_0801B174: .4byte gBattleTextBuff1
_0801B178: .4byte gStatusConditionString_PoisonJpn
_0801B17C: .4byte 0xf7ffffff
_0801B180: .4byte gStatusConditionString_SleepJpn
_0801B184: .4byte gStatusConditionString_ParalysisJpn
_0801B188: .4byte gStatusConditionString_BurnJpn
_0801B18C: .4byte gStatusConditionString_IceJpn
_0801B190: .4byte gStatusConditionString_ConfusionJpn
_0801B194: .4byte gBattleCommunication
_0801B198: .4byte gBattlescriptCurrInstr
_0801B19C: .4byte gUnknown_081D9A4A
_0801B1A0:
	ldr r4, _0801B1F0 @ =gBattleMons
	mov r8, r4
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	mov r0, r8
	adds r0, 0x18
	adds r1, r0
	movs r2, 0x6
	movs r5, 0x7
	mov r10, r5
_0801B1B6:
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0x5
	bgt _0801B1C4
	strb r2, [r1]
	movs r0, 0x5
	str r0, [sp, 0xC]
_0801B1C4:
	adds r1, 0x1
	movs r3, 0x1
	negs r3, r3
	add r10, r3
	mov r4, r10
	cmp r4, 0
	bge _0801B1B6
	ldr r5, [sp, 0xC]
	cmp r5, 0
	beq _0801B254
	ldr r0, _0801B1F4 @ =0x02000000
	ldr r1, _0801B1F8 @ =0x00016003
	adds r0, r1
	strb r7, [r0]
	ldr r0, _0801B1FC @ =gStringBank
	strb r7, [r0]
	bl b_movescr_stack_push_cursor
	ldr r1, _0801B200 @ =gBattlescriptCurrInstr
	ldr r0, _0801B204 @ =gUnknown_081D9A64
	str r0, [r1]
	b _0801B3CA
	.align 2, 0
_0801B1F0: .4byte gBattleMons
_0801B1F4: .4byte 0x02000000
_0801B1F8: .4byte 0x00016003
_0801B1FC: .4byte gStringBank
_0801B200: .4byte gBattlescriptCurrInstr
_0801B204: .4byte gUnknown_081D9A64
_0801B208:
	ldr r2, [sp, 0xC]
	cmp r2, 0
	beq _0801B254
_0801B20E:
	ldr r0, _0801B240 @ =0x02000000
	ldr r3, _0801B244 @ =0x00016003
	adds r0, r3
	strb r7, [r0]
	ldr r0, _0801B248 @ =gStringBank
	strb r7, [r0]
	ldr r4, _0801B24C @ =gActiveBank
	strb r7, [r4]
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
_0801B224:
	ldr r1, _0801B250 @ =gUnknown_02024ACC
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl EmitSetAttributes
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	b _0801B3CA
	.align 2, 0
_0801B240: .4byte 0x02000000
_0801B244: .4byte 0x00016003
_0801B248: .4byte gStringBank
_0801B24C: .4byte gActiveBank
_0801B250: .4byte gUnknown_02024ACC
_0801B254:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0801B268 @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r7, r0
	bcs _0801B264
	b _0801AE18
_0801B264:
	b _0801B3CA
	.align 2, 0
_0801B268: .4byte gNoOfAllBanks
_0801B26C:
	ldr r7, _0801B284 @ =gBattleMoveDamage
	ldr r0, [r7]
	cmp r0, 0
	bne _0801B276
	b _0801B3CA
_0801B276:
	mov r4, r8
	cmp r4, 0x1E
	beq _0801B288
	cmp r4, 0x3E
	beq _0801B330
	b _0801B3CA
	.align 2, 0
_0801B284: .4byte gBattleMoveDamage
_0801B288:
	ldr r0, _0801B314 @ =gBattleMoveFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _0801B296
	b _0801B3CA
_0801B296:
	ldr r2, _0801B318 @ =gSpecialStatuses
	ldr r4, _0801B31C @ =gBankTarget
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r1, r0, 2
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0801B2BC
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0801B2BC
	b _0801B3CA
_0801B2BC:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r9
	bcs _0801B3CA
	ldr r2, _0801B320 @ =gBattleMoves
	ldr r0, _0801B324 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x8]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0801B3CA
	ldr r2, _0801B328 @ =gBattleMons
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _0801B3CA
	ldr r1, _0801B32C @ =gBattleCommunication
	movs r0, 0x8
	strb r0, [r1, 0x3]
	bl b_movescr_stack_push_cursor
	movs r0, 0
	movs r1, 0
	bl SetMoveEffect
	bl b_movescr_stack_pop_cursor
	b _0801B3CA
	.align 2, 0
_0801B314: .4byte gBattleMoveFlags
_0801B318: .4byte gSpecialStatuses
_0801B31C: .4byte gBankTarget
_0801B320: .4byte gBattleMoves
_0801B324: .4byte gCurrentMove
_0801B328: .4byte gBattleMons
_0801B32C: .4byte gBattleCommunication
_0801B330:
	ldr r0, _0801B3DC @ =gBattleMoveFlags
	ldrb r0, [r0]
	movs r4, 0x29
	ands r4, r0
	cmp r4, 0
	bne _0801B3CA
	ldr r1, _0801B3E0 @ =gSpecialStatuses
	ldr r5, _0801B3E4 @ =gBankTarget
	ldrb r2, [r5]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 2
	adds r6, r1, 0x4
	adds r0, r6
	ldr r1, [r0]
	cmp r1, 0
	beq _0801B3CA
	ldr r0, _0801B3E8 @ =0x0000ffff
	cmp r1, r0
	beq _0801B3CA
	ldr r0, _0801B3EC @ =gBankAttacker
	ldrb r3, [r0]
	cmp r3, r2
	beq _0801B3CA
	ldr r2, _0801B3F0 @ =gBattleMons
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r1, [r0, 0x28]
	ldrh r0, [r0, 0x2C]
	cmp r1, r0
	beq _0801B3CA
	cmp r1, 0
	beq _0801B3CA
	ldr r0, _0801B3F4 @ =gLastUsedItem
	mov r1, sp
	ldrh r1, [r1, 0x14]
	strh r1, [r0]
	ldr r0, _0801B3F8 @ =gStringBank
	strb r3, [r0]
	ldr r0, _0801B3FC @ =0x02000000
	ldr r2, _0801B400 @ =0x00016003
	adds r0, r2
	strb r3, [r0]
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	ldr r1, [sp, 0x10]
	bl __divsi3
	negs r0, r0
	str r0, [r7]
	ldrb r1, [r5]
	cmp r0, 0
	bne _0801B3AC
	movs r0, 0x1
	negs r0, r0
	str r0, [r7]
_0801B3AC:
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	str r4, [r0]
	bl b_movescr_stack_push_cursor
	ldr r1, _0801B404 @ =gBattlescriptCurrInstr
	ldr r0, _0801B408 @ =gUnknown_081D9AA7
	str r0, [r1]
	ldr r0, [sp, 0xC]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0xC]
_0801B3CA:
	ldr r0, [sp, 0xC]
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801B3DC: .4byte gBattleMoveFlags
_0801B3E0: .4byte gSpecialStatuses
_0801B3E4: .4byte gBankTarget
_0801B3E8: .4byte 0x0000ffff
_0801B3EC: .4byte gBankAttacker
_0801B3F0: .4byte gBattleMons
_0801B3F4: .4byte gLastUsedItem
_0801B3F8: .4byte gStringBank
_0801B3FC: .4byte 0x02000000
_0801B400: .4byte 0x00016003
_0801B404: .4byte gBattlescriptCurrInstr
_0801B408: .4byte gUnknown_081D9AA7
	thumb_func_end ItemBattleEffects

	thumb_func_start unref_sub_801B40C
unref_sub_801B40C: @ 801B40C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r0, 0
	str r0, [sp]
	ldr r0, _0801B464 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0801B42A
	b _0801B56E
_0801B42A:
	movs r1, 0x1
	mov r9, r1
_0801B42E:
	movs r5, 0
	ldr r4, _0801B468 @ =gUnknown_081FC1D0
	ldr r2, [sp]
	adds r2, 0x1
	str r2, [sp, 0x4]
_0801B438:
	ldr r0, _0801B46C @ =gAbsentBankFlags
	ldrb r2, [r0]
	ldr r3, _0801B470 @ =gBitTable
	lsls r0, r5, 2
	adds r0, r3
	ldr r0, [r0]
	ands r0, r2
	cmp r0, 0
	bne _0801B45A
	adds r0, r5, 0x2
	lsls r1, r0, 2
	adds r1, r3
	ldr r1, [r1]
	ands r2, r1
	adds r7, r0, 0
	cmp r2, 0
	beq _0801B474
_0801B45A:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	b _0801B556
	.align 2, 0
_0801B464: .4byte gBattleTypeFlags
_0801B468: .4byte gUnknown_081FC1D0
_0801B46C: .4byte gAbsentBankFlags
_0801B470: .4byte gBitTable
_0801B474:
	ldr r0, _0801B580 @ =gUnknown_081FC1D0
	ldr r2, [sp]
	lsls r1, r2, 3
	adds r6, r1, r0
	ldr r4, _0801B584 @ =gChosenMovesByBanks
	lsls r0, r5, 1
	adds r3, r0, r4
	ldrh r2, [r6]
	mov r8, r1
	mov r10, r0
	ldrh r3, [r3]
	cmp r2, r3
	bne _0801B4E4
	lsls r0, r7, 1
	adds r0, r4
	ldrh r1, [r6, 0x2]
	ldrh r0, [r0]
	cmp r1, r0
	bne _0801B4E4
	adds r0, r5, 0
	bl GetBankIdentity
	mov r2, r9
	ands r2, r0
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	ldr r0, _0801B588 @ =gSideTimer
	adds r1, r0
	lsls r0, r7, 4
	orrs r0, r5
	strb r0, [r1, 0x3]
	adds r0, r5, 0
	bl GetBankIdentity
	mov r1, r9
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0801B588 @ =gSideTimer
	adds r0, r1
	ldrh r1, [r6, 0x4]
	strh r1, [r0, 0x4]
	adds r0, r5, 0
	bl GetBankIdentity
	mov r1, r9
	ands r1, r0
	lsls r1, 1
	ldr r2, _0801B58C @ =gSideAffecting
	adds r1, r2
	ldrh r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strh r0, [r1]
_0801B4E4:
	ldr r0, _0801B580 @ =gUnknown_081FC1D0
	mov r1, r8
	adds r4, r1, r0
	ldr r2, _0801B584 @ =gChosenMovesByBanks
	lsls r0, r7, 1
	adds r0, r2
	ldrh r1, [r4]
	ldrh r0, [r0]
	cmp r1, r0
	bne _0801B54E
	mov r0, r10
	adds r1, r0, r2
	ldrh r0, [r4, 0x2]
	ldrh r1, [r1]
	cmp r0, r1
	bne _0801B54E
	adds r0, r5, 0
	bl GetBankIdentity
	mov r2, r9
	ands r2, r0
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	ldr r2, _0801B588 @ =gSideTimer
	adds r1, r2
	lsls r0, r5, 4
	orrs r0, r7
	strb r0, [r1, 0x3]
	adds r0, r5, 0
	bl GetBankIdentity
	mov r1, r9
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0801B588 @ =gSideTimer
	adds r0, r1
	ldrh r1, [r4, 0x4]
	strh r1, [r0, 0x4]
	adds r0, r5, 0
	bl GetBankIdentity
	mov r1, r9
	ands r1, r0
	lsls r1, 1
	ldr r2, _0801B58C @ =gSideAffecting
	adds r1, r2
	ldrh r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strh r0, [r1]
_0801B54E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _0801B580 @ =gUnknown_081FC1D0
_0801B556:
	cmp r5, 0x1
	bhi _0801B55C
	b _0801B438
_0801B55C:
	ldr r0, [sp, 0x4]
	str r0, [sp]
	lsls r0, 3
	adds r0, r4
	ldrh r1, [r0]
	ldr r0, _0801B590 @ =0x0000ffff
	cmp r1, r0
	beq _0801B56E
	b _0801B42E
_0801B56E:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801B580: .4byte gUnknown_081FC1D0
_0801B584: .4byte gChosenMovesByBanks
_0801B588: .4byte gSideTimer
_0801B58C: .4byte gSideAffecting
_0801B590: .4byte 0x0000ffff
	thumb_func_end unref_sub_801B40C

	thumb_func_start sub_801B594
sub_801B594: @ 801B594
	push {lr}
	ldr r0, _0801B5B4 @ =gBattleExecBuffer
	ldr r0, [r0]
	cmp r0, 0
	bne _0801B5B0
	ldr r1, _0801B5B8 @ =gBattleScriptingCommandsTable
	ldr r0, _0801B5BC @ =gBattlescriptCurrInstr
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_0801B5B0:
	pop {r0}
	bx r0
	.align 2, 0
_0801B5B4: .4byte gBattleExecBuffer
_0801B5B8: .4byte gBattleScriptingCommandsTable
_0801B5BC: .4byte gBattlescriptCurrInstr
	thumb_func_end sub_801B594

	thumb_func_start sub_801B5C0
sub_801B5C0: @ 801B5C0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 16
	lsrs r7, r0, 16
	lsls r1, 24
	lsrs r0, r1, 24
	movs r5, 0
	cmp r0, 0
	beq _0801B5DE
	subs r0, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	b _0801B5EA
_0801B5DE:
	ldr r1, _0801B5FC @ =gBattleMoves
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 2
	adds r0, r1
	ldrb r6, [r0, 0x6]
_0801B5EA:
	cmp r6, 0x40
	bls _0801B5F0
	b _0801B900
_0801B5F0:
	lsls r0, r6, 2
	ldr r1, _0801B600 @ =_0801B604
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801B5FC: .4byte gBattleMoves
_0801B600: .4byte _0801B604
	.align 2, 0
_0801B604:
	.4byte _0801B708
	.4byte _0801B808
	.4byte _0801B8FC
	.4byte _0801B900
	.4byte _0801B820
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B808
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B8FC
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B808
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B900
	.4byte _0801B808
_0801B708:
	ldr r0, _0801B7E8 @ =gBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0801B7EC @ =gSideTimer
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r2, r0, r1
	ldrb r0, [r2, 0x8]
	cmp r0, 0
	beq _0801B73A
	ldr r1, _0801B7F0 @ =gBattleMons
	ldrb r4, [r2, 0x9]
	movs r0, 0x58
	muls r0, r4
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _0801B73A
	b _0801B850
_0801B73A:
	ldr r0, _0801B7E8 @ =gBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r7, 1
	mov r8, r0
_0801B74A:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0801B7F4 @ =gNoOfAllBanks
	ldrb r1, [r1]
	bl __modsi3
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _0801B7E8 @ =gBankAttacker
	ldrb r2, [r6]
	cmp r5, r2
	beq _0801B74A
	adds r0, r5, 0
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	beq _0801B74A
	ldr r0, _0801B7F8 @ =gAbsentBankFlags
	ldrb r2, [r0]
	ldr r1, _0801B7FC @ =gBitTable
	lsls r0, r5, 2
	adds r0, r1
	ldr r0, [r0]
	ands r2, r0
	cmp r2, 0
	bne _0801B74A
	ldr r0, _0801B800 @ =gBattleMoves
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x2]
	cmp r0, 0xD
	beq _0801B798
	b _0801B900
_0801B798:
	ldrb r1, [r6]
	str r2, [sp]
	movs r0, 0x10
	movs r2, 0x1F
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	bne _0801B7AE
	b _0801B900
_0801B7AE:
	ldr r2, _0801B7F0 @ =gBattleMons
	movs r1, 0x58
	adds r0, r5, 0
	muls r0, r1
	adds r0, r2
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x1F
	bne _0801B7C2
	b _0801B900
_0801B7C2:
	movs r4, 0x2
	eors r5, r4
	adds r0, r5, 0
	muls r0, r1
	adds r0, r2
	adds r0, 0x20
	ldrb r1, [r0]
	adds r0, r5, 0
	bl RecordAbilityBattle
	ldr r1, _0801B804 @ =gSpecialStatuses
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	orrs r1, r4
	strb r1, [r0]
	b _0801B900
	.align 2, 0
_0801B7E8: .4byte gBankAttacker
_0801B7EC: .4byte gSideTimer
_0801B7F0: .4byte gBattleMons
_0801B7F4: .4byte gNoOfAllBanks
_0801B7F8: .4byte gAbsentBankFlags
_0801B7FC: .4byte gBitTable
_0801B800: .4byte gBattleMoves
_0801B804: .4byte gSpecialStatuses
_0801B808:
	ldr r0, _0801B81C @ =gBankAttacker
	ldrb r0, [r0]
	bl GetBankIdentity
	adds r1, r0, 0
	movs r2, 0x1
	movs r0, 0x1
	ands r0, r1
	eors r0, r2
	b _0801B8B2
	.align 2, 0
_0801B81C: .4byte gBankAttacker
_0801B820:
	ldr r0, _0801B854 @ =gBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0801B858 @ =gSideTimer
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r2, r0, r1
	ldrb r0, [r2, 0x8]
	cmp r0, 0
	beq _0801B860
	ldr r1, _0801B85C @ =gBattleMons
	ldrb r4, [r2, 0x9]
	movs r0, 0x58
	muls r0, r4
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _0801B860
_0801B850:
	adds r5, r4, 0
	b _0801B900
	.align 2, 0
_0801B854: .4byte gBankAttacker
_0801B858: .4byte gSideTimer
_0801B85C: .4byte gBattleMons
_0801B860:
	ldr r0, _0801B894 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _0801B8DC
	movs r0, 0x4
	ands r6, r0
	cmp r6, 0
	beq _0801B8DC
	ldr r0, _0801B898 @ =gBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _0801B8A0
	bl Random
	adds r1, r4, 0
	ands r1, r0
	cmp r1, 0
	beq _0801B89C
	movs r0, 0x1
	b _0801B8B2
	.align 2, 0
_0801B894: .4byte gBattleTypeFlags
_0801B898: .4byte gBankAttacker
_0801B89C:
	movs r0, 0x3
	b _0801B8B2
_0801B8A0:
	bl Random
	adds r1, r4, 0
	ands r1, r0
	cmp r1, 0
	beq _0801B8B0
	movs r0, 0
	b _0801B8B2
_0801B8B0:
	movs r0, 0x2
_0801B8B2:
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0801B8D4 @ =gAbsentBankFlags
	ldrb r1, [r0]
	ldr r2, _0801B8D8 @ =gBitTable
	lsls r0, r5, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0801B900
	movs r0, 0x2
	eors r5, r0
	b _0801B900
	.align 2, 0
_0801B8D4: .4byte gAbsentBankFlags
_0801B8D8: .4byte gBitTable
_0801B8DC:
	ldr r0, _0801B8F8 @ =gBankAttacker
	ldrb r0, [r0]
	bl GetBankIdentity
	adds r1, r0, 0
	movs r2, 0x1
	movs r0, 0x1
	ands r0, r1
	eors r0, r2
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r5, r0, 24
	b _0801B900
	.align 2, 0
_0801B8F8: .4byte gBankAttacker
_0801B8FC:
	ldr r0, _0801B91C @ =gBankAttacker
	ldrb r5, [r0]
_0801B900:
	ldr r1, _0801B920 @ =0x02000000
	ldr r0, _0801B91C @ =gBankAttacker
	ldrb r0, [r0]
	ldr r2, _0801B924 @ =0x00016010
	adds r0, r2
	adds r0, r1
	strb r5, [r0]
	adds r0, r5, 0
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801B91C: .4byte gBankAttacker
_0801B920: .4byte 0x02000000
_0801B924: .4byte 0x00016010
	thumb_func_end sub_801B5C0

	thumb_func_start IsPokeDisobedient
IsPokeDisobedient: @ 801B928
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	ldr r0, _0801B9E0 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0801B9DA
	ldr r7, _0801B9E4 @ =gBankAttacker
	ldrb r0, [r7]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0801B9DA
	ldr r5, _0801B9E8 @ =gBattleMons
	ldrb r0, [r7]
	movs r1, 0x58
	mov r8, r1
	mov r1, r8
	muls r1, r0
	adds r0, r5, 0
	adds r0, 0x54
	adds r0, r1, r0
	ldr r0, [r0]
	adds r2, r5, 0
	adds r2, 0x3C
	adds r1, r2
	bl IsOtherTrainer
	lsls r0, 24
	cmp r0, 0
	beq _0801B9DA
	ldr r0, _0801B9EC @ =0x0000080e
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _0801B9DA
	movs r6, 0xA
	ldr r0, _0801B9F0 @ =0x00000808
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0801B98E
	movs r6, 0x1E
_0801B98E:
	ldr r0, _0801B9F4 @ =0x0000080a
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0801B99C
	movs r6, 0x32
_0801B99C:
	ldr r0, _0801B9F8 @ =0x0000080c
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0801B9AA
	movs r6, 0x46
_0801B9AA:
	ldrb r0, [r7]
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	adds r0, r5
	adds r0, 0x2A
	ldrb r0, [r0]
	cmp r0, r6
	bls _0801B9DA
	bl Random
	movs r1, 0xFF
	ands r1, r0
	ldrb r0, [r7]
	mov r2, r8
	muls r2, r0
	adds r0, r2, r5
	adds r0, 0x2A
	ldrb r0, [r0]
	adds r0, r6
	muls r0, r1
	asrs r4, r0, 8
	cmp r4, r6
	bge _0801B9FC
_0801B9DA:
	movs r0, 0
	b _0801BC24
	.align 2, 0
_0801B9E0: .4byte gBattleTypeFlags
_0801B9E4: .4byte gBankAttacker
_0801B9E8: .4byte gBattleMons
_0801B9EC: .4byte 0x0000080e
_0801B9F0: .4byte 0x00000808
_0801B9F4: .4byte 0x0000080a
_0801B9F8: .4byte 0x0000080c
_0801B9FC:
	ldr r3, _0801BA3C @ =gCurrentMove
	ldrh r0, [r3]
	cmp r0, 0x63
	bne _0801BA12
	adds r0, r5, 0
	adds r0, 0x50
	adds r0, r2, r0
	ldr r1, [r0]
	ldr r2, _0801BA40 @ =0xff7fffff
	ands r1, r2
	str r1, [r0]
_0801BA12:
	ldrb r0, [r7]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r1, r5, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	beq _0801BA4C
	ldrh r0, [r3]
	cmp r0, 0xAD
	beq _0801BA34
	cmp r0, 0xD6
	bne _0801BA4C
_0801BA34:
	ldr r1, _0801BA44 @ =gBattlescriptCurrInstr
	ldr r0, _0801BA48 @ =gUnknown_081D995F
	b _0801BBCE
	.align 2, 0
_0801BA3C: .4byte gCurrentMove
_0801BA40: .4byte 0xff7fffff
_0801BA44: .4byte gBattlescriptCurrInstr
_0801BA48: .4byte gUnknown_081D995F
_0801BA4C:
	bl Random
	movs r5, 0xFF
	adds r1, r5, 0
	ands r1, r0
	ldr r7, _0801BB04 @ =gBattleMons
	ldr r2, _0801BB08 @ =gBankAttacker
	mov r9, r2
	ldrb r3, [r2]
	movs r0, 0x58
	mov r8, r0
	mov r0, r8
	muls r0, r3
	adds r0, r7
	adds r0, 0x2A
	ldrb r2, [r0]
	adds r0, r2, r6
	muls r0, r1
	asrs r4, r0, 8
	cmp r4, r6
	bge _0801BB3C
	ldr r7, _0801BB0C @ =gBitTable
	ldr r5, _0801BB10 @ =gCurrMovePos
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r7
	ldrb r1, [r0]
	adds r0, r3, 0
	movs r2, 0xFF
	bl CheckMoveLimitations
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bne _0801BA94
	b _0801BBBE
_0801BA94:
	adds r6, r5, 0
	ldr r1, _0801BB14 @ =gUnknown_02024BE5
	mov r9, r1
	movs r2, 0x3
	mov r8, r2
_0801BA9E:
	bl Random
	mov r1, r8
	ands r0, r1
	mov r2, r9
	strb r0, [r2]
	strb r0, [r6]
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r7
	ldr r5, [r0]
	ands r5, r4
	cmp r5, 0
	bne _0801BA9E
	ldr r4, _0801BB18 @ =gRandomMove
	ldr r3, _0801BB04 @ =gBattleMons
	ldr r0, _0801BB10 @ =gCurrMovePos
	ldrb r0, [r0]
	lsls r0, 1
	ldr r1, _0801BB08 @ =gBankAttacker
	ldrb r2, [r1]
	movs r1, 0x58
	muls r1, r2
	adds r0, r1
	adds r3, 0xC
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r4]
	ldr r0, _0801BB1C @ =gBattleCommunication
	strb r5, [r0, 0x3]
	ldr r0, _0801BB20 @ =gDynamicBasePower
	movs r1, 0
	strh r5, [r0]
	ldr r0, _0801BB24 @ =0x02000000
	ldr r2, _0801BB28 @ =0x0001601c
	adds r0, r2
	strb r1, [r0]
	ldr r1, _0801BB2C @ =gBattlescriptCurrInstr
	ldr r0, _0801BB30 @ =gUnknown_081D996F
	str r0, [r1]
	ldrh r0, [r4]
	movs r1, 0
	bl sub_801B5C0
	ldr r1, _0801BB34 @ =gBankTarget
	strb r0, [r1]
	ldr r2, _0801BB38 @ =gHitMarker
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 14
	b _0801BC1E
	.align 2, 0
_0801BB04: .4byte gBattleMons
_0801BB08: .4byte gBankAttacker
_0801BB0C: .4byte gBitTable
_0801BB10: .4byte gCurrMovePos
_0801BB14: .4byte gUnknown_02024BE5
_0801BB18: .4byte gRandomMove
_0801BB1C: .4byte gBattleCommunication
_0801BB20: .4byte gDynamicBasePower
_0801BB24: .4byte 0x02000000
_0801BB28: .4byte 0x0001601c
_0801BB2C: .4byte gBattlescriptCurrInstr
_0801BB30: .4byte gUnknown_081D996F
_0801BB34: .4byte gBankTarget
_0801BB38: .4byte gHitMarker
_0801BB3C:
	subs r0, r2, r6
	lsls r0, 24
	lsrs r6, r0, 24
	bl Random
	adds r4, r5, 0
	ands r4, r0
	cmp r4, r6
	bge _0801BBB8
	mov r1, r9
	ldrb r0, [r1]
	mov r1, r8
	muls r1, r0
	adds r0, r7, 0
	adds r0, 0x4C
	adds r0, r1, r0
	ldr r0, [r0]
	ands r0, r5
	cmp r0, 0
	bne _0801BBB8
	adds r0, r1, r7
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x48
	beq _0801BBB8
	cmp r0, 0xF
	beq _0801BBB8
	movs r2, 0
	ldr r0, _0801BBAC @ =gNoOfAllBanks
	ldrb r3, [r0]
	mov r8, r0
	cmp r2, r3
	bge _0801BB9E
	ldr r0, [r7, 0x50]
	movs r1, 0x70
	ands r0, r1
	cmp r0, 0
	bne _0801BB9E
	adds r1, r7, 0
	adds r1, 0x50
	movs r5, 0x70
_0801BB8E:
	adds r1, 0x58
	adds r2, 0x1
	cmp r2, r3
	bge _0801BB9E
	ldr r0, [r1]
	ands r0, r5
	cmp r0, 0
	beq _0801BB8E
_0801BB9E:
	mov r0, r8
	ldrb r0, [r0]
	cmp r2, r0
	bne _0801BBB8
	ldr r1, _0801BBB0 @ =gBattlescriptCurrInstr
	ldr r0, _0801BBB4 @ =gUnknown_081D9989
	b _0801BBCE
	.align 2, 0
_0801BBAC: .4byte gNoOfAllBanks
_0801BBB0: .4byte gBattlescriptCurrInstr
_0801BBB4: .4byte gUnknown_081D9989
_0801BBB8:
	subs r4, r6
	cmp r4, r6
	blt _0801BBE0
_0801BBBE:
	bl Random
	ldr r2, _0801BBD4 @ =gBattleCommunication
	movs r1, 0x3
	ands r1, r0
	strb r1, [r2, 0x5]
	ldr r1, _0801BBD8 @ =gBattlescriptCurrInstr
	ldr r0, _0801BBDC @ =gUnknown_081D9977
_0801BBCE:
	str r0, [r1]
	movs r0, 0x1
	b _0801BC24
	.align 2, 0
_0801BBD4: .4byte gBattleCommunication
_0801BBD8: .4byte gBattlescriptCurrInstr
_0801BBDC: .4byte gUnknown_081D9977
_0801BBE0:
	ldr r4, _0801BC34 @ =gBankAttacker
	ldrb r1, [r4]
	movs r0, 0x58
	muls r1, r0
	ldr r0, _0801BC38 @ =gBattleMons
	adds r1, r0
	movs r0, 0x28
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	ldrb r0, [r4]
	str r0, [sp, 0x8]
	ldrb r0, [r4]
	str r0, [sp, 0xC]
	adds r0, r1, 0
	movs r2, 0x1
	movs r3, 0
	bl CalculateBaseDamage
	ldr r1, _0801BC3C @ =gBattleMoveDamage
	str r0, [r1]
	ldr r1, _0801BC40 @ =gBankTarget
	ldrb r0, [r4]
	strb r0, [r1]
	ldr r1, _0801BC44 @ =gBattlescriptCurrInstr
	ldr r0, _0801BC48 @ =gUnknown_081D99A0
	str r0, [r1]
	ldr r2, _0801BC4C @ =gHitMarker
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
_0801BC1E:
	orrs r0, r1
	str r0, [r2]
	movs r0, 0x2
_0801BC24:
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801BC34: .4byte gBankAttacker
_0801BC38: .4byte gBattleMons
_0801BC3C: .4byte gBattleMoveDamage
_0801BC40: .4byte gBankTarget
_0801BC44: .4byte gBattlescriptCurrInstr
_0801BC48: .4byte gUnknown_081D99A0
_0801BC4C: .4byte gHitMarker
	thumb_func_end IsPokeDisobedient

	.align 2, 0 @ Don't pad with nop.
