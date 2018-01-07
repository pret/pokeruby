	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start GetBattleBank
GetBattleBank: @ 8015150
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	cmp r0, 0xA
	bhi _080151C8
	lsls r0, 2
	ldr r1, _08015168 @ =_0801516C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08015168: .4byte _0801516C
	.align 2, 0
_0801516C:
	.4byte _08015198
	.4byte _080151A0
	.4byte _080151A8
	.4byte _080151C4
	.4byte _080151C8
	.4byte _080151C4
	.4byte _080151C8
	.4byte _080151B0
	.4byte _080151C8
	.4byte _080151C8
	.4byte _080151B4
_08015198:
	ldr r0, _0801519C @ =gBankTarget
	b _080151C6
	.align 2, 0
_0801519C: .4byte gBankTarget
_080151A0:
	ldr r0, _080151A4 @ =gBankAttacker
	b _080151C6
	.align 2, 0
_080151A4: .4byte gBankAttacker
_080151A8:
	ldr r0, _080151AC @ =gEffectBank
	b _080151C6
	.align 2, 0
_080151AC: .4byte gEffectBank
_080151B0:
	movs r2, 0
	b _080151C8
_080151B4:
	ldr r0, _080151BC @ =gSharedMem
	ldr r1, _080151C0 @ =0x00016003
	adds r0, r1
	b _080151C6
	.align 2, 0
_080151BC: .4byte gSharedMem
_080151C0: .4byte 0x00016003
_080151C4:
	ldr r0, _080151D0 @ =gBank1
_080151C6:
	ldrb r2, [r0]
_080151C8:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_080151D0: .4byte gBank1
	thumb_func_end GetBattleBank

	thumb_func_start PressurePPLose
PressurePPLose: @ 80151D4
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 16
	lsrs r2, 16
	ldr r1, _08015204 @ =gBattleMons
	movs r4, 0x58
	muls r0, r4
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
	mov r12, r1
	cmp r0, 0x2E
	bne _08015286
	movs r3, 0
	adds r0, r5, 0
	muls r0, r4
	adds r1, 0xC
	adds r1, r0, r1
	b _08015210
	.align 2, 0
_08015204: .4byte gBattleMons
_08015208:
	adds r1, 0x2
	adds r3, 0x1
	cmp r3, 0x3
	bgt _08015216
_08015210:
	ldrh r0, [r1]
	cmp r0, r2
	bne _08015208
_08015216:
	cmp r3, 0x4
	beq _08015286
	movs r7, 0x58
	adds r2, r5, 0
	muls r2, r7
	adds r0, r3, r2
	mov r6, r12
	adds r6, 0x24
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, 0
	beq _08015232
	subs r0, 0x1
	strb r0, [r1]
_08015232:
	mov r0, r12
	adds r0, 0x50
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _08015286
	ldr r1, _08015290 @ =gDisableStructs
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _08015294 @ =gBitTable
	lsls r0, r3, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08015286
	ldr r4, _08015298 @ =gActiveBank
	strb r5, [r4]
	adds r1, r3, 0
	adds r1, 0x9
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r4]
	muls r0, r7
	adds r0, r6
	adds r0, r3
	str r0, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0x1
	bl EmitSetAttributes
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
_08015286:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08015290: .4byte gDisableStructs
_08015294: .4byte gBitTable
_08015298: .4byte gActiveBank
	thumb_func_end PressurePPLose

	thumb_func_start sub_801529C
sub_801529C: @ 801529C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0x4
	mov r8, r0
	adds r0, r5, 0
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r4, 0
	ldr r0, _080153BC @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r4, r0
	bge _08015344
	ldr r1, _080153C0 @ =gBattleMons
	movs r0, 0x58
	adds r7, r5, 0
	muls r7, r0
	adds r1, 0xC
	mov r10, r1
_080152D2:
	lsls r0, r4, 24
	lsrs r0, 24
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	adds r6, r4, 0x1
	cmp r9, r0
	beq _0801533A
	ldr r0, _080153C0 @ =gBattleMons
	movs r3, 0x58
	adds r1, r4, 0
	muls r1, r3
	adds r1, r0
	adds r1, 0x20
	ldrb r1, [r1]
	adds r4, r0, 0
	cmp r1, 0x2E
	bne _0801533A
	movs r2, 0
	adds r0, r5, 0
	muls r0, r3
	adds r1, r4, 0
	adds r1, 0xC
	adds r0, r1
	ldrh r0, [r0]
	movs r1, 0x8F
	lsls r1, 1
	cmp r0, r1
	beq _08015322
	adds r3, r1, 0
	mov r0, r10
	adds r1, r7, r0
_08015314:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, 0x3
	bgt _08015322
	ldrh r0, [r1]
	cmp r0, r3
	bne _08015314
_08015322:
	cmp r2, 0x4
	beq _0801533A
	mov r8, r2
	adds r1, r2, r7
	adds r0, r4, 0
	adds r0, 0x24
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _0801533A
	subs r0, 0x1
	strb r0, [r1]
_0801533A:
	adds r4, r6, 0
	ldr r0, _080153BC @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r4, r0
	blt _080152D2
_08015344:
	mov r1, r8
	cmp r1, 0x4
	beq _080153AC
	ldr r6, _080153C0 @ =gBattleMons
	movs r3, 0x58
	adds r0, r5, 0
	muls r0, r3
	adds r1, r6, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _080153AC
	ldr r1, _080153C4 @ =gDisableStructs
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _080153C8 @ =gBitTable
	mov r4, r8
	lsls r0, r4, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _080153AC
	ldr r4, _080153CC @ =gActiveBank
	strb r5, [r4]
	mov r1, r8
	adds r1, 0x9
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r4]
	muls r0, r3
	adds r2, r6, 0
	adds r2, 0x24
	adds r0, r2
	add r0, r8
	str r0, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0x1
	bl EmitSetAttributes
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
_080153AC:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080153BC: .4byte gNoOfAllBanks
_080153C0: .4byte gBattleMons
_080153C4: .4byte gDisableStructs
_080153C8: .4byte gBitTable
_080153CC: .4byte gActiveBank
	thumb_func_end sub_801529C

	thumb_func_start sub_80153D0
sub_80153D0: @ 80153D0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r3, r0, 24
	movs r6, 0x4
	movs r1, 0
	ldr r0, _080154C8 @ =gNoOfAllBanks
	mov r8, r0
	ldrb r0, [r0]
	cmp r1, r0
	bge _08015452
	ldr r7, _080154CC @ =gBattleMons
	movs r2, 0x58
	mov r12, r2
	mov r5, r12
	muls r5, r3
	adds r0, r7, 0
	adds r0, 0xC
	adds r2, r5, r0
	mov r10, r2
	mov r9, r5
_08015402:
	mov r0, r12
	muls r0, r1
	adds r0, r7
	adds r0, 0x20
	ldrb r0, [r0]
	adds r4, r1, 0x1
	cmp r0, 0x2E
	bne _08015448
	cmp r1, r3
	beq _08015448
	movs r2, 0
	mov r1, r10
	ldrh r0, [r1]
	cmp r0, 0xC3
	beq _08015432
	ldr r1, _080154D0 @ =gUnknown_02024A8C
	add r1, r9
_08015424:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, 0x3
	bgt _08015432
	ldrh r0, [r1]
	cmp r0, 0xC3
	bne _08015424
_08015432:
	cmp r2, 0x4
	beq _08015448
	adds r6, r2, 0
	adds r0, r6, r5
	ldr r2, _080154D4 @ =gUnknown_02024AA4
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _08015448
	subs r0, 0x1
	strb r0, [r1]
_08015448:
	adds r1, r4, 0
	mov r0, r8
	ldrb r0, [r0]
	cmp r1, r0
	blt _08015402
_08015452:
	cmp r6, 0x4
	beq _080154B6
	ldr r7, _080154CC @ =gBattleMons
	movs r5, 0x58
	adds r0, r3, 0
	muls r0, r5
	adds r1, r7, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _080154B6
	ldr r1, _080154D8 @ =gDisableStructs
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _080154DC @ =gBitTable
	lsls r0, r6, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _080154B6
	ldr r4, _080154E0 @ =gActiveBank
	strb r3, [r4]
	adds r1, r6, 0
	adds r1, 0x9
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r4]
	muls r0, r5
	adds r2, r7, 0
	adds r2, 0x24
	adds r0, r2
	adds r0, r6
	str r0, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0x1
	bl EmitSetAttributes
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
_080154B6:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080154C8: .4byte gNoOfAllBanks
_080154CC: .4byte gBattleMons
_080154D0: .4byte gUnknown_02024A8C
_080154D4: .4byte gUnknown_02024AA4
_080154D8: .4byte gDisableStructs
_080154DC: .4byte gBitTable
_080154E0: .4byte gActiveBank
	thumb_func_end sub_80153D0

	thumb_func_start unref_sub_80154E4
unref_sub_80154E4: @ 80154E4
	push {r4,r5,lr}
	ldr r0, _08015514 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08015524
	movs r2, 0
	ldr r4, _08015518 @ =gNoOfAllBanks
	ldrb r0, [r4]
	cmp r2, r0
	bge _08015542
	ldr r3, _0801551C @ =gBattleExecBuffer
	ldr r5, _08015520 @ =gBitTable
_08015500:
	ldm r5!, {r1}
	lsls r1, 28
	ldr r0, [r3]
	orrs r0, r1
	str r0, [r3]
	adds r2, 0x1
	ldrb r0, [r4]
	cmp r2, r0
	blt _08015500
	b _08015542
	.align 2, 0
_08015514: .4byte gBattleTypeFlags
_08015518: .4byte gNoOfAllBanks
_0801551C: .4byte gBattleExecBuffer
_08015520: .4byte gBitTable
_08015524:
	movs r2, 0
	ldr r4, _08015548 @ =gNoOfAllBanks
	ldrb r0, [r4]
	cmp r2, r0
	bge _08015542
	ldr r3, _0801554C @ =gBattleExecBuffer
	ldr r5, _08015550 @ =gBitTable
_08015532:
	ldr r0, [r3]
	ldm r5!, {r1}
	orrs r0, r1
	str r0, [r3]
	adds r2, 0x1
	ldrb r0, [r4]
	cmp r2, r0
	blt _08015532
_08015542:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015548: .4byte gNoOfAllBanks
_0801554C: .4byte gBattleExecBuffer
_08015550: .4byte gBitTable
	thumb_func_end unref_sub_80154E4

	thumb_func_start MarkBufferBankForExecution
MarkBufferBankForExecution: @ 8015554
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _0801557C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08015588
	ldr r2, _08015580 @ =gBattleExecBuffer
	ldr r1, _08015584 @ =gBitTable
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	b _08015598
	.align 2, 0
_0801557C: .4byte gBattleTypeFlags
_08015580: .4byte gBattleExecBuffer
_08015584: .4byte gBitTable
_08015588:
	ldr r2, _0801559C @ =gBattleExecBuffer
	ldr r1, _080155A0 @ =gBitTable
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	orrs r1, r0
	str r1, [r2]
_08015598:
	pop {r0}
	bx r0
	.align 2, 0
_0801559C: .4byte gBattleExecBuffer
_080155A0: .4byte gBitTable
	thumb_func_end MarkBufferBankForExecution

	thumb_func_start sub_80155A4
sub_80155A4: @ 80155A4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r4, 0
	ldr r5, _080155B8 @ =gBattleExecBuffer
	ldr r1, _080155BC @ =gBitTable
	lsls r0, r7, 2
	adds r6, r0, r1
	b _080155CE
	.align 2, 0
_080155B8: .4byte gBattleExecBuffer
_080155BC: .4byte gBitTable
_080155C0:
	lsls r0, r4, 2
	ldr r1, [r6]
	lsls r1, r0
	ldr r0, [r5]
	orrs r0, r1
	str r0, [r5]
	adds r4, 0x1
_080155CE:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	blt _080155C0
	ldr r2, _080155F0 @ =gBattleExecBuffer
	movs r1, 0x80
	lsls r1, 21
	lsls r1, r7
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080155F0: .4byte gBattleExecBuffer
	thumb_func_end sub_80155A4

	thumb_func_start CancelMultiTurnMoves
CancelMultiTurnMoves: @ 80155F4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08015644 @ =gBattleMons
	movs r2, 0x58
	adds r3, r0, 0
	muls r3, r2
	adds r1, 0x50
	adds r3, r1
	ldr r1, [r3]
	ldr r2, _08015648 @ =0xffffefff
	ands r1, r2
	ldr r2, _0801564C @ =0xfffff3ff
	ands r1, r2
	movs r2, 0x71
	negs r2, r2
	ands r1, r2
	ldr r2, _08015650 @ =0xfffffcff
	ands r1, r2
	str r1, [r3]
	ldr r1, _08015654 @ =gStatuses3
	lsls r2, r0, 2
	adds r2, r1
	ldr r1, [r2]
	ldr r3, _08015658 @ =0xfffbff3f
	ands r1, r3
	str r1, [r2]
	ldr r2, _0801565C @ =gDisableStructs
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x11]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x11]
	movs r0, 0
	strb r0, [r1, 0x10]
	bx lr
	.align 2, 0
_08015644: .4byte gBattleMons
_08015648: .4byte 0xffffefff
_0801564C: .4byte 0xfffff3ff
_08015650: .4byte 0xfffffcff
_08015654: .4byte gStatuses3
_08015658: .4byte 0xfffbff3f
_0801565C: .4byte gDisableStructs
	thumb_func_end CancelMultiTurnMoves

	thumb_func_start sub_8015660
sub_8015660: @ 8015660
	push {lr}
	lsls r0, 24
	ldr r1, _080156AC @ =gProtectStructs
	lsrs r0, 20
	adds r1, r0, r1
	ldrb r0, [r1]
	lsrs r0, 7
	cmp r0, 0
	bne _080156A6
	ldrb r2, [r1, 0x1]
	lsls r0, r2, 30
	cmp r0, 0
	blt _080156A6
	lsls r0, r2, 26
	cmp r0, 0
	blt _080156A6
	lsls r0, r2, 25
	cmp r0, 0
	blt _080156A6
	lsrs r0, r2, 7
	cmp r0, 0
	bne _080156A6
	ldrb r1, [r1, 0x2]
	lsls r0, r1, 31
	cmp r0, 0
	bne _080156A6
	lsls r0, r1, 30
	cmp r0, 0
	blt _080156A6
	lsls r0, r1, 29
	cmp r0, 0
	blt _080156A6
	lsls r0, r2, 31
	cmp r0, 0
	beq _080156B0
_080156A6:
	movs r0, 0x1
	b _080156B2
	.align 2, 0
_080156AC: .4byte gProtectStructs
_080156B0:
	movs r0, 0
_080156B2:
	pop {r1}
	bx r1
	thumb_func_end sub_8015660

	thumb_func_start PrepareStringBattle
PrepareStringBattle: @ 80156B8
	push {r4,lr}
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	ldr r4, _080156D8 @ =gActiveBank
	strb r1, [r4]
	movs r0, 0
	adds r1, r2, 0
	bl EmitPrintString
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080156D8: .4byte gActiveBank
	thumb_func_end PrepareStringBattle

	thumb_func_start sub_80156DC
sub_80156DC: @ 80156DC
	push {r4-r6,lr}
	movs r3, 0
	ldr r0, _08015730 @ =gSentPokesToOpponent
	strb r3, [r0]
	strb r3, [r0, 0x1]
	movs r1, 0
	ldr r0, _08015734 @ =gNoOfAllBanks
	ldrb r2, [r0]
	adds r6, r0, 0
	cmp r1, r2
	bge _0801570A
	ldr r5, _08015738 @ =gBitTable
	adds r4, r2, 0
	ldr r2, _0801573C @ =gBattlePartyID
_080156F8:
	ldrh r0, [r2]
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	orrs r3, r0
	adds r2, 0x4
	adds r1, 0x2
	cmp r1, r4
	blt _080156F8
_0801570A:
	movs r1, 0x1
	adds r2, r6, 0
	ldrb r0, [r2]
	cmp r1, r0
	bge _0801572A
	ldr r5, _08015730 @ =gSentPokesToOpponent
	movs r4, 0x2
_08015718:
	adds r0, r1, 0
	ands r0, r4
	asrs r0, 1
	adds r0, r5
	strb r3, [r0]
	adds r1, 0x2
	ldrb r0, [r2]
	cmp r1, r0
	blt _08015718
_0801572A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015730: .4byte gSentPokesToOpponent
_08015734: .4byte gNoOfAllBanks
_08015738: .4byte gBitTable
_0801573C: .4byte gBattlePartyID
	thumb_func_end sub_80156DC

	thumb_func_start sub_8015740
sub_8015740: @ 8015740
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	adds r0, r5, 0
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080157A4
	movs r0, 0x2
	ands r0, r5
	lsls r0, 24
	lsrs r0, 25
	mov r12, r0
	ldr r1, _080157B0 @ =gSentPokesToOpponent
	adds r0, r1
	strb r4, [r0]
	adds r5, r4, 0
	ldr r0, _080157B4 @ =gNoOfAllBanks
	ldrb r2, [r0]
	mov r8, r1
	cmp r4, r2
	bge _0801579E
	ldr r0, _080157B8 @ =gAbsentBankFlags
	ldrb r7, [r0]
	ldr r1, _080157BC @ =gBitTable
	adds r6, r2, 0
	ldr r3, _080157C0 @ =gBattlePartyID
	adds r2, r1, 0
_08015782:
	ldr r0, [r2]
	ands r0, r7
	cmp r0, 0
	bne _08015794
	ldrh r0, [r3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	orrs r4, r0
_08015794:
	adds r3, 0x4
	adds r2, 0x8
	adds r5, 0x2
	cmp r5, r6
	blt _08015782
_0801579E:
	mov r0, r12
	add r0, r8
	strb r4, [r0]
_080157A4:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080157B0: .4byte gSentPokesToOpponent
_080157B4: .4byte gNoOfAllBanks
_080157B8: .4byte gAbsentBankFlags
_080157BC: .4byte gBitTable
_080157C0: .4byte gBattlePartyID
	thumb_func_end sub_8015740

	thumb_func_start sub_80157C4
sub_80157C4: @ 80157C4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080157E0
	adds r0, r4, 0
	bl sub_8015740
	b _08015816
_080157E0:
	movs r3, 0x1
	ldr r5, _0801581C @ =gNoOfAllBanks
	ldrb r0, [r5]
	cmp r3, r0
	bge _08015816
	ldr r0, _08015820 @ =gSentPokesToOpponent
	mov r12, r0
	movs r7, 0x2
	ldr r6, _08015824 @ =gBitTable
	ldr r1, _08015828 @ =gBattlePartyID
	lsls r0, r4, 1
	adds r4, r0, r1
_080157F8:
	adds r2, r3, 0
	ands r2, r7
	asrs r2, 1
	add r2, r12
	ldrh r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r3, 0x1
	ldrb r0, [r5]
	cmp r3, r0
	blt _080157F8
_08015816:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801581C: .4byte gNoOfAllBanks
_08015820: .4byte gSentPokesToOpponent
_08015824: .4byte gBitTable
_08015828: .4byte gBattlePartyID
	thumb_func_end sub_80157C4

	.align 2, 0 @ Don't pad with nop.
