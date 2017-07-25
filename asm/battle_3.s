	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start AtkCanceller_UnableToUseMove
AtkCanceller_UnableToUseMove: @ 8017718
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	movs r0, 0
	mov r9, r0
	ldr r1, _08017734 @ =0x02016090
	mov r10, r1
	ldr r2, _08017738 @ =0xfffe9f70
	add r2, r10
	mov r8, r2
	b _08017746
	.align 2, 0
_08017734: .4byte 0x02016090
_08017738: .4byte 0xfffe9f70
_0801773C:
	mov r4, r9
	cmp r4, 0
	beq _08017746
	bl _08017FAC
_08017746:
	ldr r0, _08017760 @ =0x000160e7
	add r0, r8
	ldrb r0, [r0]
	cmp r0, 0xE
	bls _08017754
	bl _08017F9E
_08017754:
	lsls r0, 2
	ldr r1, _08017764 @ =_08017768
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08017760: .4byte 0x000160e7
_08017764: .4byte _08017768
	.align 2, 0
_08017768:
	.4byte _080177A4
	.4byte _080177E4
	.4byte _08017920
	.4byte _080179D8
	.4byte _08017A50
	.4byte _08017AC8
	.4byte _08017B1C
	.4byte _08017B98
	.4byte _08017C1C
	.4byte _08017C60
	.4byte _08017D3C
	.4byte _08017DC0
	.4byte _08017E5C
	.4byte _08017F48
	.4byte _08017F9E
_080177A4:
	ldr r1, _080177D0 @ =gBattleMons
	ldr r3, _080177D4 @ =gBankAttacker
	ldrb r2, [r3]
	movs r0, 0x58
	muls r2, r0
	adds r1, 0x50
	adds r2, r1
	ldr r0, [r2]
	ldr r1, _080177D8 @ =0xfdffffff
	ands r0, r1
	str r0, [r2]
	ldr r0, _080177DC @ =gStatuses3
	ldrb r2, [r3]
	lsls r2, 2
	adds r2, r0
	ldr r0, [r2]
	ldr r1, _080177E0 @ =0xffffbfff
	ands r0, r1
	str r0, [r2]
	bl _08017F94
	.align 2, 0
_080177D0: .4byte gBattleMons
_080177D4: .4byte gBankAttacker
_080177D8: .4byte 0xfdffffff
_080177DC: .4byte gStatuses3
_080177E0: .4byte 0xffffbfff
_080177E4:
	ldr r7, _0801784C @ =gBattleMons
	ldr r4, _08017850 @ =gBankAttacker
	ldrb r1, [r4]
	movs r5, 0x58
	adds r0, r1, 0
	muls r0, r5
	adds r6, r7, 0
	adds r6, 0x4C
	adds r0, r6
	ldr r0, [r0]
	movs r2, 0x7
	mov r8, r2
	ands r0, r2
	cmp r0, 0
	bne _08017804
	b _08017D90
_08017804:
	adds r0, r1, 0
	bl sub_8025A44
	lsls r0, 24
	cmp r0, 0
	beq _08017864
	ldrb r0, [r4]
	adds r2, r0, 0
	muls r2, r5
	adds r2, r6
	ldr r0, [r2]
	movs r1, 0x8
	negs r1, r1
	ands r0, r1
	str r0, [r2]
	ldrb r0, [r4]
	adds r2, r0, 0
	muls r2, r5
	adds r0, r7, 0
	adds r0, 0x50
	adds r2, r0
	ldr r0, [r2]
	ldr r1, _08017854 @ =0xf7ffffff
	ands r0, r1
	str r0, [r2]
	bl b_movescr_stack_push_cursor
	ldr r1, _08017858 @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1, 0x5]
	ldr r1, _0801785C @ =gBattlescriptCurrInstr
	ldr r0, _08017860 @ =gUnknown_081D94FB
	str r0, [r1]
	movs r4, 0x2
	mov r9, r4
	b _08017D90
	.align 2, 0
_0801784C: .4byte gBattleMons
_08017850: .4byte gBankAttacker
_08017854: .4byte 0xf7ffffff
_08017858: .4byte gBattleCommunication
_0801785C: .4byte gBattlescriptCurrInstr
_08017860: .4byte gUnknown_081D94FB
_08017864:
	ldrb r0, [r4]
	adds r1, r0, 0
	muls r1, r5
	adds r0, r1, r7
	adds r0, 0x20
	ldrb r0, [r0]
	movs r3, 0x1
	cmp r0, 0x30
	bne _08017878
	movs r3, 0x2
_08017878:
	adds r2, r1, r6
	ldr r1, [r2]
	adds r0, r1, 0
	mov r7, r8
	ands r0, r7
	cmp r0, r3
	bcs _08017890
	movs r0, 0x8
	negs r0, r0
	ands r1, r0
	str r1, [r2]
	b _08017894
_08017890:
	subs r0, r1, r3
	str r0, [r2]
_08017894:
	ldr r2, _080178D8 @ =gBattleMons
	ldr r0, _080178DC @ =gBankAttacker
	ldrb r1, [r0]
	movs r0, 0x58
	muls r1, r0
	adds r0, r2, 0
	adds r0, 0x4C
	adds r0, r1, r0
	ldr r4, [r0]
	movs r0, 0x7
	ands r4, r0
	cmp r4, 0
	beq _080178F0
	ldr r0, _080178E0 @ =gCurrentMove
	ldrh r0, [r0]
	cmp r0, 0xAD
	bne _080178B8
	b _08017D90
_080178B8:
	cmp r0, 0xD6
	bne _080178BE
	b _08017D90
_080178BE:
	ldr r1, _080178E4 @ =gBattlescriptCurrInstr
	ldr r0, _080178E8 @ =gUnknown_081D94EE
	str r0, [r1]
	ldr r2, _080178EC @ =gHitMarker
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r2]
	movs r0, 0x2
	mov r9, r0
	b _08017D90
	.align 2, 0
_080178D8: .4byte gBattleMons
_080178DC: .4byte gBankAttacker
_080178E0: .4byte gCurrentMove
_080178E4: .4byte gBattlescriptCurrInstr
_080178E8: .4byte gUnknown_081D94EE
_080178EC: .4byte gHitMarker
_080178F0:
	adds r2, 0x50
	adds r2, r1, r2
	ldr r0, [r2]
	ldr r1, _08017910 @ =0xf7ffffff
	ands r0, r1
	str r0, [r2]
	bl b_movescr_stack_push_cursor
	ldr r0, _08017914 @ =gBattleCommunication
	strb r4, [r0, 0x5]
	ldr r1, _08017918 @ =gBattlescriptCurrInstr
	ldr r0, _0801791C @ =gUnknown_081D94FB
	str r0, [r1]
	movs r1, 0x2
	b _08017D8E
	.align 2, 0
_08017910: .4byte 0xf7ffffff
_08017914: .4byte gBattleCommunication
_08017918: .4byte gBattlescriptCurrInstr
_0801791C: .4byte gUnknown_081D94FB
_08017920:
	ldr r1, _0801797C @ =gBattleMons
	ldr r7, _08017980 @ =gBankAttacker
	ldrb r0, [r7]
	movs r6, 0x58
	muls r0, r6
	adds r5, r1, 0
	adds r5, 0x4C
	adds r0, r5
	ldr r0, [r0]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	bne _0801793C
	b _08017F94
_0801793C:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _080179A8
	ldr r2, _08017984 @ =gBattleMoves
	ldr r0, _08017988 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x7D
	beq _08017998
	ldr r1, _0801798C @ =gBattlescriptCurrInstr
	ldr r0, _08017990 @ =gUnknown_081D9545
	str r0, [r1]
	ldr r2, _08017994 @ =gHitMarker
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 2
	orrs r0, r1
	str r0, [r2]
	b _080179C8
	.align 2, 0
_0801797C: .4byte gBattleMons
_08017980: .4byte gBankAttacker
_08017984: .4byte gBattleMoves
_08017988: .4byte gCurrentMove
_0801798C: .4byte gBattlescriptCurrInstr
_08017990: .4byte gUnknown_081D9545
_08017994: .4byte gHitMarker
_08017998:
	ldr r2, _080179A0 @ =0x02000000
	ldr r7, _080179A4 @ =0x000160e7
	adds r1, r2, r7
	b _08017D96
	.align 2, 0
_080179A0: .4byte 0x02000000
_080179A4: .4byte 0x000160e7
_080179A8:
	ldrb r0, [r7]
	adds r2, r0, 0
	muls r2, r6
	adds r2, r5
	ldr r0, [r2]
	movs r1, 0x21
	negs r1, r1
	ands r0, r1
	str r0, [r2]
	bl b_movescr_stack_push_cursor
	ldr r1, _080179CC @ =gBattlescriptCurrInstr
	ldr r0, _080179D0 @ =gUnknown_081D9552
	str r0, [r1]
	ldr r0, _080179D4 @ =gBattleCommunication
	strb r4, [r0, 0x5]
_080179C8:
	movs r0, 0x2
	b _08017E3C
	.align 2, 0
_080179CC: .4byte gBattlescriptCurrInstr
_080179D0: .4byte gUnknown_081D9552
_080179D4: .4byte gBattleCommunication
_080179D8:
	ldr r1, _08017A30 @ =gBattleMons
	ldr r0, _08017A34 @ =gBankAttacker
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x36
	beq _080179EE
	b _08017D90
_080179EE:
	ldr r0, _08017A38 @ =gDisableStructs
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x18]
	lsls r0, 31
	cmp r0, 0
	bne _08017A02
	b _08017D90
_08017A02:
	adds r0, r2, 0
	bl CancelMultiTurnMoves
	ldr r2, _08017A3C @ =gHitMarker
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r2]
	ldr r1, _08017A40 @ =gBattleCommunication
	movs r0, 0
	strb r0, [r1, 0x5]
	ldr r1, _08017A44 @ =gBattlescriptCurrInstr
	ldr r0, _08017A48 @ =gUnknown_081D9977
	str r0, [r1]
	ldr r2, _08017A4C @ =gBattleMoveFlags
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	movs r2, 0x1
	mov r9, r2
	b _08017D90
	.align 2, 0
_08017A30: .4byte gBattleMons
_08017A34: .4byte gBankAttacker
_08017A38: .4byte gDisableStructs
_08017A3C: .4byte gHitMarker
_08017A40: .4byte gBattleCommunication
_08017A44: .4byte gBattlescriptCurrInstr
_08017A48: .4byte gUnknown_081D9977
_08017A4C: .4byte gBattleMoveFlags
_08017A50:
	ldr r1, _08017AA4 @ =gBattleMons
	ldr r3, _08017AA8 @ =gBankAttacker
	ldrb r2, [r3]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x80
	lsls r0, 15
	ands r0, r1
	cmp r0, 0
	beq _08017A9C
	ldr r0, _08017AAC @ =0xffbfffff
	ands r1, r0
	str r1, [r2]
	ldr r2, _08017AB0 @ =gDisableStructs
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strb r1, [r0, 0x19]
	ldrb r0, [r3]
	bl CancelMultiTurnMoves
	ldr r1, _08017AB4 @ =gBattlescriptCurrInstr
	ldr r0, _08017AB8 @ =gUnknown_081D7956
	str r0, [r1]
	ldr r2, _08017ABC @ =gHitMarker
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r2]
	movs r7, 0x1
	mov r9, r7
_08017A9C:
	ldr r2, _08017AC0 @ =0x02000000
	ldr r0, _08017AC4 @ =0x000160e7
	adds r1, r2, r0
	b _08017D96
	.align 2, 0
_08017AA4: .4byte gBattleMons
_08017AA8: .4byte gBankAttacker
_08017AAC: .4byte 0xffbfffff
_08017AB0: .4byte gDisableStructs
_08017AB4: .4byte gBattlescriptCurrInstr
_08017AB8: .4byte gUnknown_081D7956
_08017ABC: .4byte gHitMarker
_08017AC0: .4byte 0x02000000
_08017AC4: .4byte 0x000160e7
_08017AC8:
	ldr r1, _08017B08 @ =gBattleMons
	ldr r3, _08017B0C @ =gBankAttacker
	ldrb r2, [r3]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _08017AE2
	b _08017D90
_08017AE2:
	movs r0, 0x9
	negs r0, r0
	ands r1, r0
	str r1, [r2]
	ldr r0, _08017B10 @ =gProtectStructs
	ldrb r2, [r3]
	lsls r2, 4
	adds r2, r0
	ldrb r0, [r2, 0x2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x2]
	ldrb r0, [r3]
	bl CancelMultiTurnMoves
	ldr r1, _08017B14 @ =gBattlescriptCurrInstr
	ldr r0, _08017B18 @ =gUnknown_081D9573
	b _08017D7E
	.align 2, 0
_08017B08: .4byte gBattleMons
_08017B0C: .4byte gBankAttacker
_08017B10: .4byte gProtectStructs
_08017B14: .4byte gBattlescriptCurrInstr
_08017B18: .4byte gUnknown_081D9573
_08017B1C:
	ldr r0, _08017B74 @ =gDisableStructs
	ldr r3, _08017B78 @ =gBankAttacker
	ldrb r2, [r3]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r0
	ldr r0, _08017B7C @ =gCurrentMove
	ldrh r1, [r1, 0x4]
	ldrh r0, [r0]
	cmp r1, r0
	beq _08017B36
	b _08017D90
_08017B36:
	cmp r1, 0
	bne _08017B3C
	b _08017D90
_08017B3C:
	ldr r0, _08017B80 @ =gProtectStructs
	lsls r2, 4
	adds r2, r0
	ldrb r0, [r2, 0x1]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldr r0, _08017B84 @ =0x02000000
	ldrb r1, [r3]
	ldr r7, _08017B88 @ =0x00016003
	adds r0, r7
	strb r1, [r0]
	ldrb r0, [r3]
	bl CancelMultiTurnMoves
	ldr r1, _08017B8C @ =gBattlescriptCurrInstr
	ldr r0, _08017B90 @ =gUnknown_081D9139
	str r0, [r1]
	ldr r2, _08017B94 @ =gHitMarker
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r2]
	movs r0, 0x1
	mov r9, r0
	b _08017D90
	.align 2, 0
_08017B74: .4byte gDisableStructs
_08017B78: .4byte gBankAttacker
_08017B7C: .4byte gCurrentMove
_08017B80: .4byte gProtectStructs
_08017B84: .4byte 0x02000000
_08017B88: .4byte 0x00016003
_08017B8C: .4byte gBattlescriptCurrInstr
_08017B90: .4byte gUnknown_081D9139
_08017B94: .4byte gHitMarker
_08017B98:
	ldr r0, _08017BF4 @ =gDisableStructs
	ldr r4, _08017BF8 @ =gBankAttacker
	ldrb r3, [r4]
	lsls r1, r3, 3
	subs r1, r3
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x13]
	lsls r0, 28
	cmp r0, 0
	beq _08017BEC
	ldr r2, _08017BFC @ =gBattleMoves
	ldr r0, _08017C00 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	bne _08017BEC
	ldr r0, _08017C04 @ =gProtectStructs
	lsls r2, r3, 4
	adds r2, r0
	ldrb r0, [r2, 0x2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x2]
	ldrb r0, [r4]
	bl CancelMultiTurnMoves
	ldr r1, _08017C08 @ =gBattlescriptCurrInstr
	ldr r0, _08017C0C @ =gUnknown_081D938F
	str r0, [r1]
	ldr r2, _08017C10 @ =gHitMarker
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r2]
	movs r7, 0x1
	mov r9, r7
_08017BEC:
	ldr r2, _08017C14 @ =0x02000000
	ldr r0, _08017C18 @ =0x000160e7
	adds r1, r2, r0
	b _08017D96
	.align 2, 0
_08017BF4: .4byte gDisableStructs
_08017BF8: .4byte gBankAttacker
_08017BFC: .4byte gBattleMoves
_08017C00: .4byte gCurrentMove
_08017C04: .4byte gProtectStructs
_08017C08: .4byte gBattlescriptCurrInstr
_08017C0C: .4byte gUnknown_081D938F
_08017C10: .4byte gHitMarker
_08017C14: .4byte 0x02000000
_08017C18: .4byte 0x000160e7
_08017C1C:
	ldr r4, _08017C4C @ =gBankAttacker
	ldrb r0, [r4]
	ldr r1, _08017C50 @ =gCurrentMove
	ldrh r1, [r1]
	bl IsImprisoned
	lsls r0, 24
	cmp r0, 0
	bne _08017C30
	b _08017D90
_08017C30:
	ldr r0, _08017C54 @ =gProtectStructs
	ldrb r2, [r4]
	lsls r2, 4
	adds r2, r0
	ldrb r0, [r2, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r0, [r4]
	bl CancelMultiTurnMoves
	ldr r1, _08017C58 @ =gBattlescriptCurrInstr
	ldr r0, _08017C5C @ =gUnknown_081D9459
	b _08017D7E
	.align 2, 0
_08017C4C: .4byte gBankAttacker
_08017C50: .4byte gCurrentMove
_08017C54: .4byte gProtectStructs
_08017C58: .4byte gBattlescriptCurrInstr
_08017C5C: .4byte gUnknown_081D9459
_08017C60:
	ldr r7, _08017CAC @ =gBattleMons
	ldr r5, _08017CB0 @ =gBankAttacker
	ldrb r0, [r5]
	movs r6, 0x58
	muls r0, r6
	adds r4, r7, 0
	adds r4, 0x50
	adds r2, r0, r4
	ldr r1, [r2]
	movs r3, 0x7
	adds r0, r1, 0
	ands r0, r3
	cmp r0, 0
	bne _08017C7E
	b _08017F94
_08017C7E:
	subs r0, r1, 0x1
	str r0, [r2]
	ldrb r0, [r5]
	muls r0, r6
	adds r0, r4
	ldr r0, [r0]
	ands r0, r3
	cmp r0, 0
	beq _08017D24
	bl Random
	movs r1, 0x1
	movs r2, 0x1
	ands r2, r0
	cmp r2, 0
	beq _08017CB8
	ldr r1, _08017CB4 @ =gBattleCommunication
	movs r0, 0
	strb r0, [r1, 0x5]
	bl b_movescr_stack_push_cursor
	b _08017D02
	.align 2, 0
_08017CAC: .4byte gBattleMons
_08017CB0: .4byte gBankAttacker
_08017CB4: .4byte gBattleCommunication
_08017CB8:
	ldr r0, _08017D08 @ =gBattleCommunication
	movs r4, 0x1
	strb r1, [r0, 0x5]
	ldr r1, _08017D0C @ =gBankTarget
	ldrb r0, [r5]
	strb r0, [r1]
	ldrb r0, [r5]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r7
	movs r0, 0x28
	str r0, [sp]
	str r2, [sp, 0x4]
	ldrb r0, [r5]
	str r0, [sp, 0x8]
	ldrb r0, [r5]
	str r0, [sp, 0xC]
	adds r0, r1, 0
	movs r2, 0x1
	movs r3, 0
	bl CalculateBaseDamage
	ldr r1, _08017D10 @ =gBattleMoveDamage
	str r0, [r1]
	ldr r0, _08017D14 @ =gProtectStructs
	ldrb r1, [r5]
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1, 0x1]
	orrs r0, r4
	strb r0, [r1, 0x1]
	ldr r2, _08017D18 @ =gHitMarker
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r2]
_08017D02:
	ldr r1, _08017D1C @ =gBattlescriptCurrInstr
	ldr r0, _08017D20 @ =gUnknown_081D9595
	b _08017D2C
	.align 2, 0
_08017D08: .4byte gBattleCommunication
_08017D0C: .4byte gBankTarget
_08017D10: .4byte gBattleMoveDamage
_08017D14: .4byte gProtectStructs
_08017D18: .4byte gHitMarker
_08017D1C: .4byte gBattlescriptCurrInstr
_08017D20: .4byte gUnknown_081D9595
_08017D24:
	bl b_movescr_stack_push_cursor
	ldr r1, _08017D34 @ =gBattlescriptCurrInstr
	ldr r0, _08017D38 @ =gUnknown_081D95D4
_08017D2C:
	str r0, [r1]
	movs r7, 0x1
	b _08017F8E
	.align 2, 0
_08017D34: .4byte gBattlescriptCurrInstr
_08017D38: .4byte gUnknown_081D95D4
_08017D3C:
	ldr r1, _08017DA0 @ =gBattleMons
	ldr r4, _08017DA4 @ =gBankAttacker
	ldrb r2, [r4]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08017D90
	bl Random
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	cmp r1, 0
	bne _08017D90
	ldr r0, _08017DA8 @ =gProtectStructs
	ldrb r2, [r4]
	lsls r2, 4
	adds r2, r0
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4]
	bl CancelMultiTurnMoves
	ldr r1, _08017DAC @ =gBattlescriptCurrInstr
	ldr r0, _08017DB0 @ =gUnknown_081D9566
_08017D7E:
	str r0, [r1]
	ldr r2, _08017DB4 @ =gHitMarker
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r2]
	movs r1, 0x1
_08017D8E:
	mov r9, r1
_08017D90:
	ldr r2, _08017DB8 @ =0x02000000
	ldr r4, _08017DBC @ =0x000160e7
	adds r1, r2, r4
_08017D96:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r8, r2
	b _08017F9E
	.align 2, 0
_08017DA0: .4byte gBattleMons
_08017DA4: .4byte gBankAttacker
_08017DA8: .4byte gProtectStructs
_08017DAC: .4byte gBattlescriptCurrInstr
_08017DB0: .4byte gUnknown_081D9566
_08017DB4: .4byte gHitMarker
_08017DB8: .4byte 0x02000000
_08017DBC: .4byte 0x000160e7
_08017DC0:
	ldr r1, _08017DFC @ =gBattleMons
	ldr r4, _08017E00 @ =gBankAttacker
	ldrb r2, [r4]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0xF0
	lsls r0, 12
	ands r1, r0
	cmp r1, 0
	bne _08017DDC
	b _08017F94
_08017DDC:
	lsrs r0, r1, 16
	bl CountTrailingZeroBits
	ldr r1, _08017E04 @ =0x02000000
	ldr r7, _08017E08 @ =0x00016003
	adds r1, r7
	strb r0, [r1]
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08017E0C
	bl b_movescr_stack_push_cursor
	b _08017E34
	.align 2, 0
_08017DFC: .4byte gBattleMons
_08017E00: .4byte gBankAttacker
_08017E04: .4byte 0x02000000
_08017E08: .4byte 0x00016003
_08017E0C:
	ldr r0, _08017E44 @ =gUnknown_081D9608
	bl b_movescr_stack_push
	ldr r2, _08017E48 @ =gHitMarker
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r2]
	ldr r0, _08017E4C @ =gProtectStructs
	ldrb r2, [r4]
	lsls r2, 4
	adds r2, r0
	ldrb r0, [r2, 0x1]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r0, [r4]
	bl CancelMultiTurnMoves
_08017E34:
	ldr r1, _08017E50 @ =gBattlescriptCurrInstr
	ldr r0, _08017E54 @ =gUnknown_081D95FB
	str r0, [r1]
	movs r0, 0x1
_08017E3C:
	mov r9, r0
	ldr r1, _08017E58 @ =0x02000000
	mov r8, r1
	b _08017F94
	.align 2, 0
_08017E44: .4byte gUnknown_081D9608
_08017E48: .4byte gHitMarker
_08017E4C: .4byte gProtectStructs
_08017E50: .4byte gBattlescriptCurrInstr
_08017E54: .4byte gUnknown_081D95FB
_08017E58: .4byte 0x02000000
_08017E5C:
	ldr r1, _08017E98 @ =gBattleMons
	ldr r6, _08017E9C @ =gBankAttacker
	ldrb r0, [r6]
	movs r5, 0x58
	muls r0, r5
	adds r1, 0x50
	adds r3, r0, r1
	ldr r2, [r3]
	movs r4, 0xC0
	lsls r4, 2
	adds r0, r2, 0
	ands r0, r4
	cmp r0, 0
	bne _08017E7A
	b _08017F94
_08017E7A:
	ldr r7, _08017EA0 @ =0xffffff00
	adds r0, r2, r7
	str r0, [r3]
	ldrb r0, [r6]
	muls r0, r5
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, 0
	ands r0, r4
	cmp r0, 0
	beq _08017EAC
	ldr r1, _08017EA4 @ =gBattlescriptCurrInstr
	ldr r0, _08017EA8 @ =gUnknown_081D90A7
	b _08017F38
	.align 2, 0
_08017E98: .4byte gBattleMons
_08017E9C: .4byte gBankAttacker
_08017EA0: .4byte 0xffffff00
_08017EA4: .4byte gBattlescriptCurrInstr
_08017EA8: .4byte gUnknown_081D90A7
_08017EAC:
	ldr r0, _08017F0C @ =0xffffefff
	ands r2, r0
	str r2, [r1]
	ldr r2, _08017F10 @ =gTakenDmg
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	cmp r0, 0
	beq _08017F34
	ldr r1, _08017F14 @ =gCurrentMove
	movs r0, 0x75
	strh r0, [r1]
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	lsls r0, 1
	mov r1, r10
	str r0, [r1]
	ldr r4, _08017F18 @ =gBankTarget
	ldr r1, _08017F1C @ =gTakenDmgBanks
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r0, _08017F20 @ =gAbsentBankFlags
	ldrb r1, [r0]
	ldr r2, _08017F24 @ =gBitTable
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08017EFE
	movs r0, 0x75
	movs r1, 0x1
	bl sub_801B5C0
	strb r0, [r4]
_08017EFE:
	ldr r1, _08017F28 @ =gBattlescriptCurrInstr
	ldr r0, _08017F2C @ =gUnknown_081D90B2
	str r0, [r1]
	ldr r2, _08017F30 @ =0x02000000
	mov r8, r2
	b _08017F3A
	.align 2, 0
_08017F0C: .4byte 0xffffefff
_08017F10: .4byte gTakenDmg
_08017F14: .4byte gCurrentMove
_08017F18: .4byte gBankTarget
_08017F1C: .4byte gTakenDmgBanks
_08017F20: .4byte gAbsentBankFlags
_08017F24: .4byte gBitTable
_08017F28: .4byte gBattlescriptCurrInstr
_08017F2C: .4byte gUnknown_081D90B2
_08017F30: .4byte 0x02000000
_08017F34:
	ldr r1, _08017F40 @ =gBattlescriptCurrInstr
	ldr r0, _08017F44 @ =gUnknown_081D90F1
_08017F38:
	str r0, [r1]
_08017F3A:
	movs r4, 0x1
	mov r9, r4
	b _08017F94
	.align 2, 0
_08017F40: .4byte gBattlescriptCurrInstr
_08017F44: .4byte gUnknown_081D90F1
_08017F48:
	ldr r1, _08017FEC @ =gBattleMons
	ldr r0, _08017FF0 @ =gBankAttacker
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x4C
	adds r4, r0, r1
	ldr r3, [r4]
	movs r0, 0x20
	ands r0, r3
	cmp r0, 0
	beq _08017F94
	ldr r2, _08017FF4 @ =gBattleMoves
	ldr r0, _08017FF8 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x7D
	bne _08017F8C
	movs r0, 0x21
	negs r0, r0
	ands r3, r0
	str r3, [r4]
	bl b_movescr_stack_push_cursor
	ldr r1, _08017FFC @ =gBattlescriptCurrInstr
	ldr r0, _08018000 @ =gUnknown_081D9552
	str r0, [r1]
	ldr r1, _08018004 @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1, 0x5]
_08017F8C:
	movs r7, 0x2
_08017F8E:
	mov r9, r7
	ldr r0, _08018008 @ =0x02000000
	mov r8, r0
_08017F94:
	ldr r1, _0801800C @ =0x000160e7
	add r1, r8
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08017F9E:
	ldr r0, _0801800C @ =0x000160e7
	add r0, r8
	ldrb r0, [r0]
	cmp r0, 0xE
	beq _08017FAC
	bl _0801773C
_08017FAC:
	mov r1, r9
	cmp r1, 0x2
	bne _08017FD8
	ldr r4, _08018010 @ =gActiveBank
	ldr r0, _08017FF0 @ =gBankAttacker
	ldrb r0, [r0]
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
	ldr r1, _08018014 @ =gUnknown_02024ACC
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl EmitSetAttributes
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
_08017FD8:
	mov r0, r9
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08017FEC: .4byte gBattleMons
_08017FF0: .4byte gBankAttacker
_08017FF4: .4byte gBattleMoves
_08017FF8: .4byte gCurrentMove
_08017FFC: .4byte gBattlescriptCurrInstr
_08018000: .4byte gUnknown_081D9552
_08018004: .4byte gBattleCommunication
_08018008: .4byte 0x02000000
_0801800C: .4byte 0x000160e7
_08018010: .4byte gActiveBank
_08018014: .4byte gUnknown_02024ACC
	thumb_func_end AtkCanceller_UnableToUseMove

	thumb_func_start sub_8018018
sub_8018018: @ 8018018
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r3, r4, 0
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	ldr r0, _08018044 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08018048
	movs r0, 0
	b _08018198
	.align 2, 0
_08018044: .4byte gBattleTypeFlags
_08018048:
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080180D4
	adds r0, r4, 0
	bl sub_803FC34
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r4, 0
	bl GetBankSide
	lsls r0, 24
	ldr r1, _080180CC @ =gEnemyParty
	mov r8, r1
	cmp r0, 0
	bne _0801806E
	ldr r2, _080180D0 @ =gPlayerParty
	mov r8, r2
_0801806E:
	adds r0, r7, 0
	bl sub_803FBFC
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 1
	adds r5, r0, r6
	adds r0, r5, 0x3
	cmp r5, r0
	bge _080180BA
	adds r7, r0, 0
_08018084:
	movs r0, 0x64
	muls r0, r5
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _080180B4
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _080180B4
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	bne _080180BA
_080180B4:
	adds r5, 0x1
	cmp r5, r7
	blt _08018084
_080180BA:
	movs r1, 0
	lsls r0, r6, 1
	adds r0, r6
	adds r0, 0x3
	cmp r5, r0
	bne _080180C8
	movs r1, 0x1
_080180C8:
	adds r0, r1, 0
	b _08018198
	.align 2, 0
_080180CC: .4byte gEnemyParty
_080180D0: .4byte gPlayerParty
_080180D4:
	adds r0, r3, 0
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08018100
	movs r0, 0x1
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0x3
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, _080180FC @ =gEnemyParty
	mov r8, r2
	b _08018118
	.align 2, 0
_080180FC: .4byte gEnemyParty
_08018100:
	movs r0, 0
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0x2
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080181A8 @ =gPlayerParty
	mov r8, r0
_08018118:
	mov r1, r10
	cmp r1, 0x6
	bne _08018128
	ldr r1, _080181AC @ =gBattlePartyID
	lsls r0, r7, 1
	adds r0, r1
	ldrb r0, [r0]
	mov r10, r0
_08018128:
	mov r2, r9
	cmp r2, 0x6
	bne _08018138
	ldr r1, _080181AC @ =gBattlePartyID
	lsls r0, r6, 1
	adds r0, r1
	ldrb r0, [r0]
	mov r9, r0
_08018138:
	movs r5, 0
_0801813A:
	movs r0, 0x64
	muls r0, r5
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _0801818A
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _0801818A
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _0801818A
	cmp r5, r10
	beq _0801818A
	cmp r5, r9
	beq _0801818A
	ldr r1, _080181B0 @ =0x02000000
	ldr r2, _080181B4 @ =0x00016068
	adds r0, r7, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r5, r0
	beq _0801818A
	adds r0, r6, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r5, r0
	bne _08018190
_0801818A:
	adds r5, 0x1
	cmp r5, 0x5
	ble _0801813A
_08018190:
	movs r0, 0
	cmp r5, 0x6
	bne _08018198
	movs r0, 0x1
_08018198:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080181A8: .4byte gPlayerParty
_080181AC: .4byte gBattlePartyID
_080181B0: .4byte 0x02000000
_080181B4: .4byte 0x00016068
	thumb_func_end sub_8018018

	thumb_func_start castform_switch
castform_switch: @ 80181B8
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	ldr r1, _08018228 @ =gBattleMons
	movs r0, 0x58
	muls r0, r6
	adds r4, r0, r1
	ldrh r1, [r4]
	ldr r0, _0801822C @ =SPECIES_CASTFORM
	cmp r1, r0
	bne _0801825C
	adds r0, r4, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x3B
	bne _0801825C
	ldrh r0, [r4, 0x28]
	cmp r0, 0
	beq _0801825C
	str r5, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	bne _0801820A
	str r5, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	beq _08018230
_0801820A:
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0
	beq _08018230
	adds r1, r4, 0
	adds r1, 0x22
	ldrb r0, [r1]
	cmp r0, 0
	beq _08018230
	strb r5, [r2]
	strb r5, [r1]
	movs r0, 0x1
	b _08018314
	.align 2, 0
_08018228: .4byte gBattleMons
_0801822C: .4byte SPECIES_CASTFORM
_08018230:
	movs r0, 0
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0801825C
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	beq _08018260
_0801825C:
	movs r0, 0
	b _08018314
_08018260:
	ldr r1, _0801831C @ =gBattleWeather
	ldrh r0, [r1]
	movs r2, 0xE7
	ands r2, r0
	adds r4, r1, 0
	cmp r2, 0
	bne _0801828E
	ldr r1, _08018320 @ =gBattleMons
	movs r0, 0x58
	muls r0, r6
	adds r1, r0, r1
	adds r3, r1, 0
	adds r3, 0x21
	ldrb r0, [r3]
	cmp r0, 0
	beq _0801828E
	adds r1, 0x22
	ldrb r0, [r1]
	cmp r0, 0
	beq _0801828E
	strb r2, [r3]
	strb r2, [r1]
	movs r5, 0x1
_0801828E:
	ldrh r1, [r4]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _080182BA
	ldr r1, _08018320 @ =gBattleMons
	movs r0, 0x58
	muls r0, r6
	adds r1, r0, r1
	adds r2, r1, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0xA
	beq _080182BA
	adds r1, 0x22
	ldrb r0, [r1]
	cmp r0, 0xA
	beq _080182BA
	movs r0, 0xA
	strb r0, [r2]
	strb r0, [r1]
	movs r5, 0x2
_080182BA:
	ldrh r1, [r4]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	beq _080182E6
	ldr r1, _08018320 @ =gBattleMons
	movs r0, 0x58
	muls r0, r6
	adds r1, r0, r1
	adds r2, r1, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0xB
	beq _080182E6
	adds r1, 0x22
	ldrb r0, [r1]
	cmp r0, 0xB
	beq _080182E6
	movs r0, 0xB
	strb r0, [r2]
	strb r0, [r1]
	movs r5, 0x3
_080182E6:
	ldrh r1, [r4]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08018312
	ldr r1, _08018320 @ =gBattleMons
	movs r0, 0x58
	muls r0, r6
	adds r1, r0, r1
	adds r2, r1, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0xF
	beq _08018312
	adds r1, 0x22
	ldrb r0, [r1]
	cmp r0, 0xF
	beq _08018312
	movs r0, 0xF
	strb r0, [r2]
	strb r0, [r1]
	movs r5, 0x4
_08018312:
	adds r0, r5, 0
_08018314:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801831C: .4byte gBattleWeather
_08018320: .4byte gBattleMons
	thumb_func_end castform_switch

	thumb_func_start AbilityBattleEffects
AbilityBattleEffects: @ 8018324
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	ldr r4, [sp, 0x48]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0
	mov r9, r0
	ldr r5, _08018380 @ =gBankAttacker
	ldr r1, _08018384 @ =gNoOfAllBanks
	ldrb r0, [r5]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08018360
	mov r1, r10
	strb r1, [r5]
_08018360:
	ldrb r0, [r5]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _08018390
	ldr r1, _08018388 @ =gBattlePartyID
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0801838C @ =gPlayerParty
	b _080183A0
	.align 2, 0
_08018380: .4byte gBankAttacker
_08018384: .4byte gNoOfAllBanks
_08018388: .4byte gBattlePartyID
_0801838C: .4byte gPlayerParty
_08018390:
	ldr r1, _080183D0 @ =gBattlePartyID
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080183D4 @ =gEnemyParty
_080183A0:
	adds r7, r1, r0
	ldr r5, _080183D8 @ =gBankTarget
	ldr r1, _080183DC @ =gNoOfAllBanks
	ldrb r0, [r5]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _080183B2
	mov r2, r10
	strb r2, [r5]
_080183B2:
	ldrb r0, [r5]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080183E4
	ldr r1, _080183D0 @ =gBattlePartyID
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080183E0 @ =gPlayerParty
	b _080183F4
	.align 2, 0
_080183D0: .4byte gBattlePartyID
_080183D4: .4byte gEnemyParty
_080183D8: .4byte gBankTarget
_080183DC: .4byte gNoOfAllBanks
_080183E0: .4byte gPlayerParty
_080183E4:
	ldr r1, _08018444 @ =gBattlePartyID
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08018448 @ =gEnemyParty
_080183F4:
	adds r5, r1, r0
	adds r0, r7, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	adds r0, r7, 0
	movs r1, 0
	bl GetMonData
	str r0, [sp, 0x10]
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0xC]
	adds r0, r5, 0
	movs r1, 0
	bl GetMonData
	str r0, [sp, 0x14]
	ldr r0, _0801844C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08018436
	bl _08019F92
_08018436:
	mov r3, r8
	cmp r3, 0
	beq _08018454
	ldr r0, _08018450 @ =gLastUsedAbility
	strb r3, [r0]
	mov r8, r0
	b _0801846A
	.align 2, 0
_08018444: .4byte gBattlePartyID
_08018448: .4byte gEnemyParty
_0801844C: .4byte gBattleTypeFlags
_08018450: .4byte gLastUsedAbility
_08018454:
	ldr r2, _08018474 @ =gLastUsedAbility
	ldr r1, _08018478 @ =gBattleMons
	movs r0, 0x58
	mov r5, r10
	muls r5, r0
	adds r0, r5, 0
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r2]
	mov r8, r2
_0801846A:
	cmp r4, 0
	beq _0801847C
	adds r3, r4, 0
	b _08018480
	.align 2, 0
_08018474: .4byte gLastUsedAbility
_08018478: .4byte gBattleMons
_0801847C:
	ldr r0, _08018494 @ =gCurrentMove
	ldrh r3, [r0]
_08018480:
	ldr r1, _08018498 @ =0x02000000
	ldr r2, _0801849C @ =0x0001601c
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r7, r1, 0
	cmp r0, 0
	beq _080184A0
	movs r4, 0x3F
	ands r4, r0
	b _080184AC
	.align 2, 0
_08018494: .4byte gCurrentMove
_08018498: .4byte 0x02000000
_0801849C: .4byte 0x0001601c
_080184A0:
	ldr r1, _080184C0 @ =gBattleMoves
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r4, [r0, 0x2]
_080184AC:
	ldr r5, [sp, 0x4]
	cmp r5, 0x13
	bls _080184B6
	bl _08019F76
_080184B6:
	lsls r0, r5, 2
	ldr r1, _080184C4 @ =_080184C8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080184C0: .4byte gBattleMoves
_080184C4: .4byte _080184C8
	.align 2, 0
_080184C8:
	.4byte _08018518
	.4byte _08018814
	.4byte _08018A40
	.4byte _08018AD8
	.4byte _08018CF0
	.4byte _08019448
	.4byte _080197B4
	.4byte _08019804
	.4byte _08019880
	.4byte _080198FC
	.4byte _08019B1C
	.4byte _08019940
	.4byte _08019B60
	.4byte _08019BBC
	.4byte _08019C18
	.4byte _08019D18
	.4byte _08019D5C
	.4byte _08019DB8
	.4byte _08019F44
	.4byte _08019CD4
_08018518:
	ldr r2, _0801854C @ =gBankAttacker
	ldr r0, _08018550 @ =gNoOfAllBanks
	ldrb r1, [r2]
	adds r5, r0, 0
	ldrb r0, [r5]
	cmp r1, r0
	bcc _0801852A
	mov r1, r10
	strb r1, [r2]
_0801852A:
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, 0x2D
	bne _08018534
	b _080186B8
_08018534:
	cmp r0, 0x2D
	bgt _08018564
	cmp r0, 0xD
	bne _0801853E
	b _080187DC
_0801853E:
	cmp r0, 0xD
	bgt _08018554
	cmp r0, 0x2
	bne _08018548
	b _08018680
_08018548:
	bl _08019F76
	.align 2, 0
_0801854C: .4byte gBankAttacker
_08018550: .4byte gNoOfAllBanks
_08018554:
	cmp r0, 0x16
	bne _0801855A
	b _08018728
_0801855A:
	cmp r0, 0x24
	bne _08018560
	b _080187A0
_08018560:
	bl _08019F76
_08018564:
	cmp r0, 0x46
	bne _0801856A
	b _080186F0
_0801856A:
	cmp r0, 0x46
	bgt _08018578
	cmp r0, 0x3B
	bne _08018574
	b _0801875C
_08018574:
	bl _08019F76
_08018578:
	cmp r0, 0x4D
	bne _0801857E
	b _080187DC
_0801857E:
	cmp r0, 0xFF
	beq _08018586
	bl _08019F76
_08018586:
	bl weather_get_current
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x3
	cmp r0, 0xA
	bhi _0801864C
	lsls r0, 2
	ldr r1, _080185A0 @ =_080185A4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080185A0: .4byte _080185A4
	.align 2, 0
_080185A4:
	.4byte _080185D0
	.4byte _0801864C
	.4byte _080185D0
	.4byte _0801864C
	.4byte _0801864C
	.4byte _080185F8
	.4byte _0801864C
	.4byte _0801864C
	.4byte _0801864C
	.4byte _08018620
	.4byte _080185D0
_080185D0:
	ldr r2, _080185EC @ =gBattleWeather
	ldrh r1, [r2]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0801864C
	movs r0, 0x5
	strh r0, [r2]
	ldr r0, _080185F0 @ =0x02000000
	ldr r3, _080185F4 @ =0x000160a4
	adds r2, r0, r3
	movs r1, 0xA
	b _08018638
	.align 2, 0
_080185EC: .4byte gBattleWeather
_080185F0: .4byte 0x02000000
_080185F4: .4byte 0x000160a4
_080185F8:
	ldr r3, _08018614 @ =gBattleWeather
	ldrh r1, [r3]
	movs r2, 0x18
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _0801864C
	strh r2, [r3]
	ldr r0, _08018618 @ =0x02000000
	ldr r3, _0801861C @ =0x000160a4
	adds r2, r0, r3
	movs r1, 0xC
	b _08018638
	.align 2, 0
_08018614: .4byte gBattleWeather
_08018618: .4byte 0x02000000
_0801861C: .4byte 0x000160a4
_08018620:
	ldr r3, _08018668 @ =gBattleWeather
	ldrh r1, [r3]
	movs r2, 0x60
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _0801864C
	strh r2, [r3]
	ldr r0, _0801866C @ =0x02000000
	ldr r3, _08018670 @ =0x000160a4
	adds r2, r0, r3
	movs r1, 0xB
_08018638:
	strb r1, [r2]
	ldr r5, _08018674 @ =0x00016003
	adds r0, r5
	mov r1, r10
	strb r1, [r0]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_0801864C:
	mov r2, r9
	cmp r2, 0
	bne _08018656
	bl _08019F92
_08018656:
	bl weather_get_current
	ldr r1, _08018678 @ =gBattleCommunication
	strb r0, [r1, 0x5]
	ldr r0, _0801867C @ =gUnknown_081D901D
	bl b_push_move_exec
	bl _08019F76
	.align 2, 0
_08018668: .4byte gBattleWeather
_0801866C: .4byte 0x02000000
_08018670: .4byte 0x000160a4
_08018674: .4byte 0x00016003
_08018678: .4byte gBattleCommunication
_0801867C: .4byte gUnknown_081D901D
_08018680:
	ldr r2, _080186A8 @ =gBattleWeather
	ldrh r1, [r2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08018690
	bl _08019F76
_08018690:
	movs r0, 0x5
	strh r0, [r2]
	ldr r0, _080186AC @ =gUnknown_081D9704
	bl b_push_move_exec
	ldr r0, _080186B0 @ =0x02000000
	ldr r3, _080186B4 @ =0x00016003
	adds r0, r3
	mov r5, r10
	strb r5, [r0]
	bl _08019F22
	.align 2, 0
_080186A8: .4byte gBattleWeather
_080186AC: .4byte gUnknown_081D9704
_080186B0: .4byte 0x02000000
_080186B4: .4byte 0x00016003
_080186B8:
	ldr r2, _080186E0 @ =gBattleWeather
	ldrh r1, [r2]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080186C8
	bl _08019F76
_080186C8:
	movs r0, 0x18
	strh r0, [r2]
	ldr r0, _080186E4 @ =gUnknown_081D9744
	bl b_push_move_exec
	ldr r0, _080186E8 @ =0x02000000
	ldr r1, _080186EC @ =0x00016003
	adds r0, r1
	mov r2, r10
	strb r2, [r0]
	bl _08019F22
	.align 2, 0
_080186E0: .4byte gBattleWeather
_080186E4: .4byte gUnknown_081D9744
_080186E8: .4byte 0x02000000
_080186EC: .4byte 0x00016003
_080186F0:
	ldr r2, _08018718 @ =gBattleWeather
	ldrh r1, [r2]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08018700
	bl _08019F76
_08018700:
	movs r0, 0x60
	strh r0, [r2]
	ldr r0, _0801871C @ =gUnknown_081D97FE
	bl b_push_move_exec
	ldr r0, _08018720 @ =0x02000000
	ldr r3, _08018724 @ =0x00016003
	adds r0, r3
	mov r5, r10
	strb r5, [r0]
	bl _08019F22
	.align 2, 0
_08018718: .4byte gBattleWeather
_0801871C: .4byte gUnknown_081D97FE
_08018720: .4byte 0x02000000
_08018724: .4byte 0x00016003
_08018728:
	ldr r0, _08018754 @ =gSpecialStatuses
	mov r1, r10
	lsls r2, r1, 2
	adds r1, r2, r1
	lsls r1, 2
	adds r3, r1, r0
	ldrb r0, [r3]
	lsls r0, 28
	cmp r0, 0
	bge _08018740
	bl _08019F76
_08018740:
	ldr r1, _08018758 @ =gStatuses3
	adds r1, r2, r1
	ldr r0, [r1]
	movs r2, 0x80
	lsls r2, 12
	orrs r0, r2
	str r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x8
	b _080187CA
	.align 2, 0
_08018754: .4byte gSpecialStatuses
_08018758: .4byte gStatuses3
_0801875C:
	mov r0, r10
	bl castform_switch
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	cmp r0, 0
	bne _08018770
	bl _08019F92
_08018770:
	ldr r0, _08018790 @ =gUnknown_081D977D
	bl b_push_move_exec
	ldr r0, _08018794 @ =0x02000000
	ldr r2, _08018798 @ =0x00016003
	adds r1, r0, r2
	mov r3, r10
	strb r3, [r1]
	mov r1, r9
	subs r1, 0x1
	ldr r5, _0801879C @ =0x0001609b
	adds r0, r5
	strb r1, [r0]
	bl _08019F76
	.align 2, 0
_08018790: .4byte gUnknown_081D977D
_08018794: .4byte 0x02000000
_08018798: .4byte 0x00016003
_0801879C: .4byte 0x0001609b
_080187A0:
	ldr r0, _080187D4 @ =gSpecialStatuses
	mov r1, r10
	lsls r2, r1, 2
	adds r1, r2, r1
	lsls r1, 2
	adds r3, r1, r0
	ldrb r0, [r3]
	lsls r0, 27
	cmp r0, 0
	bge _080187B8
	bl _08019F76
_080187B8:
	ldr r1, _080187D8 @ =gStatuses3
	adds r1, r2, r1
	ldr r0, [r1]
	movs r2, 0x80
	lsls r2, 13
	orrs r0, r2
	str r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x10
_080187CA:
	orrs r0, r1
	strb r0, [r3]
	bl _08019F76
	.align 2, 0
_080187D4: .4byte gSpecialStatuses
_080187D8: .4byte gStatuses3
_080187DC:
	movs r6, 0
	ldrb r5, [r5]
	cmp r6, r5
	bcc _080187E8
	bl _08019F76
_080187E8:
	adds r0, r6, 0
	bl castform_switch
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	cmp r0, 0
	beq _080187FC
	bl _08019E14
_080187FC:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08018810 @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r6, r0
	bcc _080187E8
	bl _08019F76
	.align 2, 0
_08018810: .4byte gNoOfAllBanks
_08018814:
	ldr r2, _08018844 @ =gBattleMons
	movs r0, 0x58
	mov r1, r10
	muls r1, r0
	adds r4, r1, r2
	ldrh r0, [r4, 0x28]
	cmp r0, 0
	bne _08018828
	bl _08019F76
_08018828:
	ldr r0, _08018848 @ =gBankAttacker
	mov r3, r10
	strb r3, [r0]
	mov r3, r8
	ldrb r5, [r3]
	cmp r5, 0x2C
	beq _0801885A
	cmp r5, 0x2C
	bgt _0801884C
	cmp r5, 0x3
	bne _08018840
	b _080189B8
_08018840:
	bl _08019F76
	.align 2, 0
_08018844: .4byte gBattleMons
_08018848: .4byte gBankAttacker
_0801884C:
	cmp r5, 0x36
	bne _08018852
	b _08018A18
_08018852:
	cmp r5, 0x3D
	beq _080188DC
	bl _08019F76
_0801885A:
	movs r0, 0
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08018876
	bl _08019F76
_08018876:
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	beq _0801888E
	bl _08019F76
_0801888E:
	ldr r0, _080188D0 @ =gBattleWeather
	ldrh r1, [r0]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0801889E
	bl _08019F76
_0801889E:
	ldrh r0, [r4, 0x2C]
	ldrh r1, [r4, 0x28]
	cmp r0, r1
	bhi _080188AA
	bl _08019F76
_080188AA:
	mov r2, r8
	strb r5, [r2]
	ldr r0, _080188D4 @ =gUnknown_081D9730
	bl b_push_move_exec
	ldr r1, _080188D8 @ =gBattleMoveDamage
	ldrh r0, [r4, 0x2C]
	lsrs r0, 4
	str r0, [r1]
	cmp r0, 0
	bne _080188C4
	movs r0, 0x1
	str r0, [r1]
_080188C4:
	ldr r0, [r1]
	negs r0, r0
	str r0, [r1]
	bl _08019F22
	.align 2, 0
_080188D0: .4byte gBattleWeather
_080188D4: .4byte gUnknown_081D9730
_080188D8: .4byte gBattleMoveDamage
_080188DC:
	adds r0, r2, 0
	adds r0, 0x4C
	adds r5, r1, r0
	ldrb r0, [r5]
	cmp r0, 0
	bne _080188EC
	bl _08019F76
_080188EC:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _08018906
	bl _08019F76
_08018906:
	ldr r0, [r5]
	movs r1, 0x88
	ands r0, r1
	cmp r0, 0
	beq _08018918
	ldr r0, _08018990 @ =gBattleTextBuff1
	ldr r1, _08018994 @ =gStatusConditionString_PoisonJpn
	bl StringCopy
_08018918:
	ldr r0, [r5]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	beq _0801892A
	ldr r0, _08018990 @ =gBattleTextBuff1
	ldr r1, _08018998 @ =gStatusConditionString_SleepJpn
	bl StringCopy
_0801892A:
	ldr r0, [r5]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0801893C
	ldr r0, _08018990 @ =gBattleTextBuff1
	ldr r1, _0801899C @ =gStatusConditionString_ParalysisJpn
	bl StringCopy
_0801893C:
	ldr r0, [r5]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0801894E
	ldr r0, _08018990 @ =gBattleTextBuff1
	ldr r1, _080189A0 @ =gStatusConditionString_BurnJpn
	bl StringCopy
_0801894E:
	ldr r0, [r5]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08018960
	ldr r0, _08018990 @ =gBattleTextBuff1
	ldr r1, _080189A4 @ =gStatusConditionString_IceJpn
	bl StringCopy
_08018960:
	str r4, [r5]
	ldr r0, _080189A8 @ =0x02000000
	ldr r4, _080189AC @ =gActiveBank
	mov r3, r10
	strb r3, [r4]
	ldr r1, _080189B0 @ =0x00016003
	adds r0, r1
	strb r3, [r0]
	ldr r0, _080189B4 @ =gUnknown_081D9758
	bl b_push_move_exec
	str r5, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl EmitSetAttributes
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	bl _08019F22
	.align 2, 0
_08018990: .4byte gBattleTextBuff1
_08018994: .4byte gStatusConditionString_PoisonJpn
_08018998: .4byte gStatusConditionString_SleepJpn
_0801899C: .4byte gStatusConditionString_ParalysisJpn
_080189A0: .4byte gStatusConditionString_BurnJpn
_080189A4: .4byte gStatusConditionString_IceJpn
_080189A8: .4byte 0x02000000
_080189AC: .4byte gActiveBank
_080189B0: .4byte 0x00016003
_080189B4: .4byte gUnknown_081D9758
_080189B8:
	ldrb r2, [r4, 0x1B]
	movs r0, 0x1B
	ldrsb r0, [r4, r0]
	cmp r0, 0xB
	ble _080189C6
	bl _08019F76
_080189C6:
	ldr r0, _08018A04 @ =gDisableStructs
	mov r3, r10
	lsls r1, r3, 3
	subs r1, r3
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x16]
	cmp r0, 0x2
	bne _080189DC
	bl _08019F76
_080189DC:
	adds r0, r2, 0x1
	movs r2, 0
	strb r0, [r4, 0x1B]
	ldr r5, _08018A08 @ =0x000160a4
	adds r1, r7, r5
	movs r0, 0x11
	strb r0, [r1]
	ldr r1, _08018A0C @ =0x000160a5
	adds r0, r7, r1
	strb r2, [r0]
	ldr r0, _08018A10 @ =gUnknown_081D9718
	bl b_push_move_exec
	ldr r2, _08018A14 @ =0x00016003
	adds r0, r7, r2
	mov r3, r10
	strb r3, [r0]
	bl _08019F22
	.align 2, 0
_08018A04: .4byte gDisableStructs
_08018A08: .4byte 0x000160a4
_08018A0C: .4byte 0x000160a5
_08018A10: .4byte gUnknown_081D9718
_08018A14: .4byte 0x00016003
_08018A18:
	ldr r2, _08018A3C @ =gDisableStructs
	ldrb r0, [r0]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r3, [r1, 0x18]
	lsls r0, r3, 31
	lsrs r0, 31
	movs r2, 0x1
	eors r2, r0
	movs r0, 0x2
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x18]
	bl _08019F76
	.align 2, 0
_08018A3C: .4byte gDisableStructs
_08018A40:
	mov r5, r8
	ldrb r0, [r5]
	cmp r0, 0x2B
	beq _08018A4C
	bl _08019F76
_08018A4C:
	movs r4, 0
	ldr r0, _08018ABC @ =gUnknown_081FA724
	ldrh r2, [r0]
	ldr r5, _08018AC0 @ =0x0000ffff
	adds r1, r0, 0
	cmp r2, r5
	bne _08018A5E
	bl _08019F76
_08018A5E:
	cmp r2, r3
	beq _08018A76
	adds r2, r1, 0
_08018A64:
	adds r2, 0x2
	adds r4, 0x1
	ldrh r0, [r2]
	cmp r0, r5
	bne _08018A72
	bl _08019F76
_08018A72:
	cmp r0, r3
	bne _08018A64
_08018A76:
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _08018AC0 @ =0x0000ffff
	cmp r1, r0
	bne _08018A86
	bl _08019F76
_08018A86:
	ldr r1, _08018AC4 @ =gBattleMons
	ldr r0, _08018AC8 @ =gBankAttacker
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 5
	ands r0, r1
	cmp r0, 0
	beq _08018AAC
	ldr r0, _08018ACC @ =gHitMarker
	ldr r1, [r0]
	movs r2, 0x80
	lsls r2, 4
	orrs r1, r2
	str r1, [r0]
_08018AAC:
	ldr r1, _08018AD0 @ =gBattlescriptCurrInstr
	ldr r0, _08018AD4 @ =gUnknown_081D98F3
	str r0, [r1]
	movs r0, 0x1
	mov r9, r0
	bl _08019F7C
	.align 2, 0
_08018ABC: .4byte gUnknown_081FA724
_08018AC0: .4byte 0x0000ffff
_08018AC4: .4byte gBattleMons
_08018AC8: .4byte gBankAttacker
_08018ACC: .4byte gHitMarker
_08018AD0: .4byte gBattlescriptCurrInstr
_08018AD4: .4byte gUnknown_081D98F3
_08018AD8:
	cmp r3, 0
	bne _08018AE0
	bl _08019F76
_08018AE0:
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, 0xB
	beq _08018B50
	cmp r0, 0xB
	bgt _08018AF2
	cmp r0, 0xA
	beq _08018AF8
	b _08018C6A
_08018AF2:
	cmp r0, 0x12
	beq _08018BA8
	b _08018C6A
_08018AF8:
	cmp r4, 0xD
	beq _08018AFE
	b _08018C6A
_08018AFE:
	ldr r0, _08018B28 @ =gBattleMoves
	lsls r1, r3, 1
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _08018B10
	b _08018C6A
_08018B10:
	ldr r1, _08018B2C @ =gProtectStructs
	ldr r0, _08018B30 @ =gBankAttacker
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x2]
	lsls r0, 28
	cmp r0, 0
	bge _08018B3C
	ldr r1, _08018B34 @ =gBattlescriptCurrInstr
	ldr r0, _08018B38 @ =gUnknown_081D9843
	b _08018B40
	.align 2, 0
_08018B28: .4byte gBattleMoves
_08018B2C: .4byte gProtectStructs
_08018B30: .4byte gBankAttacker
_08018B34: .4byte gBattlescriptCurrInstr
_08018B38: .4byte gUnknown_081D9843
_08018B3C:
	ldr r1, _08018B48 @ =gBattlescriptCurrInstr
	ldr r0, _08018B4C @ =gUnknown_081D9842
_08018B40:
	str r0, [r1]
	movs r2, 0x1
	b _08018C68
	.align 2, 0
_08018B48: .4byte gBattlescriptCurrInstr
_08018B4C: .4byte gUnknown_081D9842
_08018B50:
	cmp r4, 0xB
	beq _08018B56
	b _08018C6A
_08018B56:
	ldr r0, _08018B80 @ =gBattleMoves
	lsls r1, r3, 1
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _08018B68
	b _08018C6A
_08018B68:
	ldr r1, _08018B84 @ =gProtectStructs
	ldr r0, _08018B88 @ =gBankAttacker
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x2]
	lsls r0, 28
	cmp r0, 0
	bge _08018B94
	ldr r1, _08018B8C @ =gBattlescriptCurrInstr
	ldr r0, _08018B90 @ =gUnknown_081D9843
	b _08018B98
	.align 2, 0
_08018B80: .4byte gBattleMoves
_08018B84: .4byte gProtectStructs
_08018B88: .4byte gBankAttacker
_08018B8C: .4byte gBattlescriptCurrInstr
_08018B90: .4byte gUnknown_081D9843
_08018B94:
	ldr r1, _08018BA0 @ =gBattlescriptCurrInstr
	ldr r0, _08018BA4 @ =gUnknown_081D9842
_08018B98:
	str r0, [r1]
	movs r3, 0x1
	mov r9, r3
	b _08018C6A
	.align 2, 0
_08018BA0: .4byte gBattlescriptCurrInstr
_08018BA4: .4byte gUnknown_081D9842
_08018BA8:
	cmp r4, 0xA
	bne _08018C6A
	ldr r1, _08018BF4 @ =gBattleMons
	movs r0, 0x58
	mov r5, r10
	muls r5, r0
	adds r0, r5, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	bne _08018C6A
	ldr r2, _08018BF8 @ =0x02017100
	mov r0, r10
	lsls r1, r0, 2
	adds r0, r1, r2
	ldr r3, [r0]
	movs r4, 0x1
	ands r3, r4
	adds r5, r1, 0
	cmp r3, 0
	bne _08018C30
	ldr r0, _08018BFC @ =gBattleCommunication
	strb r3, [r0, 0x5]
	ldr r1, _08018C00 @ =gProtectStructs
	ldr r0, _08018C04 @ =gBankAttacker
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x2]
	lsls r0, 28
	cmp r0, 0
	bge _08018C10
	ldr r1, _08018C08 @ =gBattlescriptCurrInstr
	ldr r0, _08018C0C @ =gUnknown_081D987C
	b _08018C14
	.align 2, 0
_08018BF4: .4byte gBattleMons
_08018BF8: .4byte 0x02017100
_08018BFC: .4byte gBattleCommunication
_08018C00: .4byte gProtectStructs
_08018C04: .4byte gBankAttacker
_08018C08: .4byte gBattlescriptCurrInstr
_08018C0C: .4byte gUnknown_081D987C
_08018C10:
	ldr r1, _08018C28 @ =gBattlescriptCurrInstr
	ldr r0, _08018C2C @ =gUnknown_081D987B
_08018C14:
	str r0, [r1]
	adds r0, r5, r2
	ldr r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	str r1, [r0]
	movs r1, 0x2
	mov r9, r1
	b _08018C6A
	.align 2, 0
_08018C28: .4byte gBattlescriptCurrInstr
_08018C2C: .4byte gUnknown_081D987B
_08018C30:
	ldr r0, _08018C4C @ =gBattleCommunication
	strb r4, [r0, 0x5]
	ldr r1, _08018C50 @ =gProtectStructs
	ldr r0, _08018C54 @ =gBankAttacker
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x2]
	lsls r0, 28
	cmp r0, 0
	bge _08018C60
	ldr r1, _08018C58 @ =gBattlescriptCurrInstr
	ldr r0, _08018C5C @ =gUnknown_081D987C
	b _08018C64
	.align 2, 0
_08018C4C: .4byte gBattleCommunication
_08018C50: .4byte gProtectStructs
_08018C54: .4byte gBankAttacker
_08018C58: .4byte gBattlescriptCurrInstr
_08018C5C: .4byte gUnknown_081D987C
_08018C60:
	ldr r1, _08018CA4 @ =gBattlescriptCurrInstr
	ldr r0, _08018CA8 @ =gUnknown_081D987B
_08018C64:
	str r0, [r1]
	movs r2, 0x2
_08018C68:
	mov r9, r2
_08018C6A:
	mov r3, r9
	cmp r3, 0x1
	beq _08018C74
	bl _08019F76
_08018C74:
	ldr r1, _08018CAC @ =gBattleMons
	movs r0, 0x58
	mov r5, r10
	muls r5, r0
	adds r0, r5, 0
	adds r1, r0, r1
	ldrh r0, [r1, 0x2C]
	ldrh r2, [r1, 0x28]
	cmp r0, r2
	bne _08018CD0
	ldr r1, _08018CB0 @ =gProtectStructs
	ldr r0, _08018CB4 @ =gBankAttacker
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x2]
	lsls r0, 28
	cmp r0, 0
	bge _08018CBC
	ldr r1, _08018CA4 @ =gBattlescriptCurrInstr
	ldr r0, _08018CB8 @ =gUnknown_081D9866
	str r0, [r1]
	bl _08019F76
	.align 2, 0
_08018CA4: .4byte gBattlescriptCurrInstr
_08018CA8: .4byte gUnknown_081D987B
_08018CAC: .4byte gBattleMons
_08018CB0: .4byte gProtectStructs
_08018CB4: .4byte gBankAttacker
_08018CB8: .4byte gUnknown_081D9866
_08018CBC:
	ldr r1, _08018CC8 @ =gBattlescriptCurrInstr
	ldr r0, _08018CCC @ =gUnknown_081D9865
	str r0, [r1]
	bl _08019F76
	.align 2, 0
_08018CC8: .4byte gBattlescriptCurrInstr
_08018CCC: .4byte gUnknown_081D9865
_08018CD0:
	ldr r2, _08018CEC @ =gBattleMoveDamage
	ldrh r0, [r1, 0x2C]
	lsrs r0, 2
	str r0, [r2]
	cmp r0, 0
	bne _08018CE0
	mov r3, r9
	str r3, [r2]
_08018CE0:
	ldr r0, [r2]
	negs r0, r0
	str r0, [r2]
	bl _08019F76
	.align 2, 0
_08018CEC: .4byte gBattleMoveDamage
_08018CF0:
	mov r5, r8
	ldrb r0, [r5]
	subs r0, 0x9
	cmp r0, 0x2F
	bls _08018CFE
	bl _08019F76
_08018CFE:
	lsls r0, 2
	ldr r1, _08018D08 @ =_08018D0C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08018D08: .4byte _08018D0C
	.align 2, 0
_08018D0C:
	.4byte _08019128
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08018DCC
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08018E94
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08018F54
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _0801904C
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019204
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _08019F76
	.4byte _080192E0
_08018DCC:
	ldr r0, _08018E74 @ =gBattleMoveFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _08018DDC
	bl _08019F76
_08018DDC:
	cmp r3, 0xA5
	bne _08018DE4
	bl _08019F76
_08018DE4:
	ldr r0, _08018E78 @ =gBattleMoves
	lsls r1, r3, 1
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _08018DF8
	bl _08019F76
_08018DF8:
	ldr r2, _08018E7C @ =gSpecialStatuses
	ldr r0, _08018E80 @ =gBankTarget
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r1, r0, 2
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _08018E20
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _08018E20
	bl _08019F76
_08018E20:
	ldr r1, _08018E84 @ =gBattleMons
	movs r0, 0x58
	mov r2, r10
	muls r2, r0
	adds r0, r2, 0
	adds r1, r0, r1
	adds r3, r1, 0
	adds r3, 0x21
	ldrb r0, [r3]
	cmp r0, r4
	bne _08018E3A
	bl _08019F76
_08018E3A:
	adds r2, r1, 0
	adds r2, 0x22
	ldrb r0, [r2]
	cmp r0, r4
	bne _08018E48
	bl _08019F76
_08018E48:
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	bne _08018E52
	bl _08019F76
_08018E52:
	strb r4, [r3]
	strb r4, [r2]
	ldr r1, _08018E88 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x3
	strb r0, [r1, 0x1]
	strb r4, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	bl b_movescr_stack_push_cursor
	ldr r1, _08018E8C @ =gBattlescriptCurrInstr
	ldr r0, _08018E90 @ =gUnknown_081D9921
	str r0, [r1]
	bl _08019F22
	.align 2, 0
_08018E74: .4byte gBattleMoveFlags
_08018E78: .4byte gBattleMoves
_08018E7C: .4byte gSpecialStatuses
_08018E80: .4byte gBankTarget
_08018E84: .4byte gBattleMons
_08018E88: .4byte gBattleTextBuff1
_08018E8C: .4byte gBattlescriptCurrInstr
_08018E90: .4byte gUnknown_081D9921
_08018E94:
	ldr r0, _08018F2C @ =gBattleMoveFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _08018EA4
	bl _08019F76
_08018EA4:
	ldr r1, _08018F30 @ =gBattleMons
	ldr r0, _08018F34 @ =gBankAttacker
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r4, r0, r1
	ldrh r0, [r4, 0x28]
	cmp r0, 0
	bne _08018EBA
	bl _08019F76
_08018EBA:
	ldr r0, _08018F38 @ =gProtectStructs
	lsls r1, r2, 4
	adds r1, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 31
	cmp r0, 0
	beq _08018ECC
	bl _08019F76
_08018ECC:
	ldr r2, _08018F3C @ =gSpecialStatuses
	ldr r0, _08018F40 @ =gBankTarget
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r1, r0, 2
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _08018EF4
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _08018EF4
	bl _08019F76
_08018EF4:
	ldr r1, _08018F44 @ =gBattleMoves
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x8]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _08018F0E
	bl _08019F76
_08018F0E:
	ldr r1, _08018F48 @ =gBattleMoveDamage
	ldrh r0, [r4, 0x2C]
	lsrs r0, 4
	str r0, [r1]
	cmp r0, 0
	bne _08018F1C
	str r2, [r1]
_08018F1C:
	bl b_movescr_stack_push_cursor
	ldr r1, _08018F4C @ =gBattlescriptCurrInstr
	ldr r0, _08018F50 @ =gUnknown_081D9928
	str r0, [r1]
	bl _08019F22
	.align 2, 0
_08018F2C: .4byte gBattleMoveFlags
_08018F30: .4byte gBattleMons
_08018F34: .4byte gBankAttacker
_08018F38: .4byte gProtectStructs
_08018F3C: .4byte gSpecialStatuses
_08018F40: .4byte gBankTarget
_08018F44: .4byte gBattleMoves
_08018F48: .4byte gBattleMoveDamage
_08018F4C: .4byte gBattlescriptCurrInstr
_08018F50: .4byte gUnknown_081D9928
_08018F54:
	ldr r0, _08019020 @ =gBattleMoveFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _08018F64
	bl _08019F76
_08018F64:
	ldr r1, _08019024 @ =gBattleMons
	ldr r0, _08019028 @ =gBankAttacker
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _08018F7A
	bl _08019F76
_08018F7A:
	ldr r0, _0801902C @ =gProtectStructs
	lsls r1, r2, 4
	adds r1, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 31
	cmp r0, 0
	beq _08018F8C
	bl _08019F76
_08018F8C:
	ldr r2, _08019030 @ =gSpecialStatuses
	ldr r0, _08019034 @ =gBankTarget
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r1, r0, 2
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _08018FB4
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _08018FB4
	bl _08019F76
_08018FB4:
	ldr r1, _08019038 @ =gBattleMoves
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08018FCC
	bl _08019F76
_08018FCC:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	beq _08018FE4
	bl _08019F76
_08018FE4:
	ldr r5, _0801903C @ =gBattleCommunication
	movs r4, 0x3
_08018FE8:
	bl Random
	ands r0, r4
	strb r0, [r5, 0x3]
	cmp r0, 0
	beq _08018FE8
	ldr r1, _0801903C @ =gBattleCommunication
	ldrb r0, [r1, 0x3]
	cmp r0, 0x3
	bne _08019000
	adds r0, 0x2
	strb r0, [r1, 0x3]
_08019000:
	ldrb r0, [r1, 0x3]
	adds r0, 0x40
	strb r0, [r1, 0x3]
	bl b_movescr_stack_push_cursor
	ldr r1, _08019040 @ =gBattlescriptCurrInstr
	ldr r0, _08019044 @ =gUnknown_081D9950
	str r0, [r1]
	ldr r2, _08019048 @ =gHitMarker
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 6
	orrs r0, r1
	str r0, [r2]
	bl _08019F22
	.align 2, 0
_08019020: .4byte gBattleMoveFlags
_08019024: .4byte gBattleMons
_08019028: .4byte gBankAttacker
_0801902C: .4byte gProtectStructs
_08019030: .4byte gSpecialStatuses
_08019034: .4byte gBankTarget
_08019038: .4byte gBattleMoves
_0801903C: .4byte gBattleCommunication
_08019040: .4byte gBattlescriptCurrInstr
_08019044: .4byte gUnknown_081D9950
_08019048: .4byte gHitMarker
_0801904C:
	ldr r0, _080190FC @ =gBattleMoveFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _0801905C
	bl _08019F76
_0801905C:
	ldr r1, _08019100 @ =gBattleMons
	ldr r0, _08019104 @ =gBankAttacker
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _08019072
	bl _08019F76
_08019072:
	ldr r0, _08019108 @ =gProtectStructs
	lsls r1, r2, 4
	adds r1, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 31
	cmp r0, 0
	beq _08019084
	bl _08019F76
_08019084:
	ldr r2, _0801910C @ =gSpecialStatuses
	ldr r0, _08019110 @ =gBankTarget
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r1, r0, 2
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _080190AC
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _080190AC
	bl _08019F76
_080190AC:
	ldr r1, _08019114 @ =gBattleMoves
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080190C4
	bl _08019F76
_080190C4:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	beq _080190DC
	bl _08019F76
_080190DC:
	ldr r1, _08019118 @ =gBattleCommunication
	movs r0, 0x42
	strb r0, [r1, 0x3]
	bl b_movescr_stack_push_cursor
	ldr r1, _0801911C @ =gBattlescriptCurrInstr
	ldr r0, _08019120 @ =gUnknown_081D9950
	str r0, [r1]
	ldr r2, _08019124 @ =gHitMarker
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 6
	orrs r0, r1
	str r0, [r2]
	bl _08019F22
	.align 2, 0
_080190FC: .4byte gBattleMoveFlags
_08019100: .4byte gBattleMons
_08019104: .4byte gBankAttacker
_08019108: .4byte gProtectStructs
_0801910C: .4byte gSpecialStatuses
_08019110: .4byte gBankTarget
_08019114: .4byte gBattleMoves
_08019118: .4byte gBattleCommunication
_0801911C: .4byte gBattlescriptCurrInstr
_08019120: .4byte gUnknown_081D9950
_08019124: .4byte gHitMarker
_08019128:
	ldr r0, _080191D8 @ =gBattleMoveFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _08019138
	bl _08019F76
_08019138:
	ldr r1, _080191DC @ =gBattleMons
	ldr r0, _080191E0 @ =gBankAttacker
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _0801914E
	bl _08019F76
_0801914E:
	ldr r0, _080191E4 @ =gProtectStructs
	lsls r1, r2, 4
	adds r1, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 31
	cmp r0, 0
	beq _08019160
	bl _08019F76
_08019160:
	ldr r2, _080191E8 @ =gSpecialStatuses
	ldr r0, _080191EC @ =gBankTarget
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r1, r0, 2
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _08019188
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _08019188
	bl _08019F76
_08019188:
	ldr r1, _080191F0 @ =gBattleMoves
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080191A0
	bl _08019F76
_080191A0:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	beq _080191B8
	bl _08019F76
_080191B8:
	ldr r1, _080191F4 @ =gBattleCommunication
	movs r0, 0x45
	strb r0, [r1, 0x3]
	bl b_movescr_stack_push_cursor
	ldr r1, _080191F8 @ =gBattlescriptCurrInstr
	ldr r0, _080191FC @ =gUnknown_081D9950
	str r0, [r1]
	ldr r2, _08019200 @ =gHitMarker
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 6
	orrs r0, r1
	str r0, [r2]
	bl _08019F22
	.align 2, 0
_080191D8: .4byte gBattleMoveFlags
_080191DC: .4byte gBattleMons
_080191E0: .4byte gBankAttacker
_080191E4: .4byte gProtectStructs
_080191E8: .4byte gSpecialStatuses
_080191EC: .4byte gBankTarget
_080191F0: .4byte gBattleMoves
_080191F4: .4byte gBattleCommunication
_080191F8: .4byte gBattlescriptCurrInstr
_080191FC: .4byte gUnknown_081D9950
_08019200: .4byte gHitMarker
_08019204:
	ldr r0, _080192B4 @ =gBattleMoveFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _08019214
	bl _08019F76
_08019214:
	ldr r1, _080192B8 @ =gBattleMons
	ldr r0, _080192BC @ =gBankAttacker
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _0801922A
	bl _08019F76
_0801922A:
	ldr r0, _080192C0 @ =gProtectStructs
	lsls r1, r2, 4
	adds r1, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 31
	cmp r0, 0
	beq _0801923C
	bl _08019F76
_0801923C:
	ldr r1, _080192C4 @ =gBattleMoves
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08019254
	bl _08019F76
_08019254:
	ldr r2, _080192C8 @ =gSpecialStatuses
	ldr r0, _080192CC @ =gBankTarget
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r1, r0, 2
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0801927C
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0801927C
	bl _08019F76
_0801927C:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	beq _08019294
	bl _08019F76
_08019294:
	ldr r1, _080192D0 @ =gBattleCommunication
	movs r0, 0x43
	strb r0, [r1, 0x3]
	bl b_movescr_stack_push_cursor
	ldr r1, _080192D4 @ =gBattlescriptCurrInstr
	ldr r0, _080192D8 @ =gUnknown_081D9950
	str r0, [r1]
	ldr r2, _080192DC @ =gHitMarker
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 6
	orrs r0, r1
	str r0, [r2]
	bl _08019F22
	.align 2, 0
_080192B4: .4byte gBattleMoveFlags
_080192B8: .4byte gBattleMons
_080192BC: .4byte gBankAttacker
_080192C0: .4byte gProtectStructs
_080192C4: .4byte gBattleMoves
_080192C8: .4byte gSpecialStatuses
_080192CC: .4byte gBankTarget
_080192D0: .4byte gBattleCommunication
_080192D4: .4byte gBattlescriptCurrInstr
_080192D8: .4byte gUnknown_081D9950
_080192DC: .4byte gHitMarker
_080192E0:
	ldr r0, _08019420 @ =gBattleMoveFlags
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _080192F0
	bl _08019F76
_080192F0:
	ldr r5, _08019424 @ =gBattleMons
	ldr r7, _08019428 @ =gBankAttacker
	ldrb r1, [r7]
	movs r6, 0x58
	adds r0, r1, 0
	muls r0, r6
	adds r0, r5
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _08019308
	bl _08019F76
_08019308:
	ldr r0, _0801942C @ =gProtectStructs
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 31
	cmp r0, 0
	beq _0801931A
	bl _08019F76
_0801931A:
	ldr r1, _08019430 @ =gBattleMoves
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08019332
	bl _08019F76
_08019332:
	ldr r3, _08019434 @ =gSpecialStatuses
	ldr r0, _08019438 @ =gBankTarget
	mov r8, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r2, r0, 2
	adds r0, r3, 0
	adds r0, 0x8
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0801935C
	adds r0, r3, 0
	adds r0, 0xC
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0801935C
	bl _08019F76
_0801935C:
	adds r0, r1, 0
	muls r0, r6
	adds r0, r5
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _0801936C
	bl _08019F76
_0801936C:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	beq _08019384
	bl _08019F76
_08019384:
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r5
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0xC
	bne _08019396
	bl _08019F76
_08019396:
	ldr r0, [sp, 0x8]
	ldr r1, [sp, 0x10]
	bl GetGenderFromSpeciesAndPersonality
	adds r4, r0, 0
	ldr r0, [sp, 0xC]
	ldr r1, [sp, 0x14]
	bl GetGenderFromSpeciesAndPersonality
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080193B4
	bl _08019F76
_080193B4:
	ldrb r0, [r7]
	muls r0, r6
	adds r4, r5, 0
	adds r4, 0x50
	adds r0, r4
	ldr r0, [r0]
	movs r1, 0xF0
	lsls r1, 12
	ands r0, r1
	cmp r0, 0
	beq _080193CE
	bl _08019F76
_080193CE:
	ldr r0, [sp, 0x8]
	ldr r1, [sp, 0x10]
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080193E2
	bl _08019F76
_080193E2:
	ldr r0, [sp, 0xC]
	ldr r1, [sp, 0x14]
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080193F6
	bl _08019F76
_080193F6:
	ldrb r0, [r7]
	adds r2, r0, 0
	muls r2, r6
	adds r2, r4
	ldr r1, _0801943C @ =gBitTable
	mov r3, r8
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r1, 16
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	bl b_movescr_stack_push_cursor
	ldr r1, _08019440 @ =gBattlescriptCurrInstr
	ldr r0, _08019444 @ =gUnknown_081D9943
	str r0, [r1]
	bl _08019F22
	.align 2, 0
_08019420: .4byte gBattleMoveFlags
_08019424: .4byte gBattleMons
_08019428: .4byte gBankAttacker
_0801942C: .4byte gProtectStructs
_08019430: .4byte gBattleMoves
_08019434: .4byte gSpecialStatuses
_08019438: .4byte gBankTarget
_0801943C: .4byte gBitTable
_08019440: .4byte gBattlescriptCurrInstr
_08019444: .4byte gUnknown_081D9943
_08019448:
	movs r5, 0
	mov r10, r5
	ldr r0, _0801947C @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r10, r0
	bcc _08019458
	bl _08019F76
_08019458:
	ldr r1, _08019480 @ =gBattleMons
	movs r0, 0x58
	mov r2, r10
	muls r2, r0
	adds r0, r2, 0
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
	subs r0, 0x7
	adds r2, r1, 0
	cmp r0, 0x41
	bls _08019472
	b _080196D6
_08019472:
	lsls r0, 2
	ldr r1, _08019484 @ =_08019488
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801947C: .4byte gNoOfAllBanks
_08019480: .4byte gBattleMons
_08019484: .4byte _08019488
	.align 2, 0
_08019488:
	.4byte _080195EC
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196B0
	.4byte _080196D6
	.4byte _080196D6
	.4byte _08019614
	.4byte _080196D6
	.4byte _08019590
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080195BC
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _08019680
	.4byte _08019650
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _080196D6
	.4byte _08019614
_08019590:
	movs r0, 0x58
	mov r3, r10
	muls r3, r0
	adds r0, r3, 0
	adds r1, r2, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080195B0 @ =0x00000f88
	ands r0, r1
	cmp r0, 0
	bne _080195AA
	b _080196D6
_080195AA:
	ldr r0, _080195B4 @ =gBattleTextBuff1
	ldr r1, _080195B8 @ =gStatusConditionString_PoisonJpn
	b _0801969C
	.align 2, 0
_080195B0: .4byte 0x00000f88
_080195B4: .4byte gBattleTextBuff1
_080195B8: .4byte gStatusConditionString_PoisonJpn
_080195BC:
	movs r0, 0x58
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	adds r1, r2, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _080195D6
	b _080196D6
_080195D6:
	ldr r0, _080195E4 @ =gBattleTextBuff1
	ldr r1, _080195E8 @ =gStatusConditionString_ConfusionJpn
	bl StringCopy
	movs r2, 0x2
	mov r9, r2
	b _080196DC
	.align 2, 0
_080195E4: .4byte gBattleTextBuff1
_080195E8: .4byte gStatusConditionString_ConfusionJpn
_080195EC:
	movs r0, 0x58
	mov r3, r10
	muls r3, r0
	adds r0, r3, 0
	adds r1, r2, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080196D6
	ldr r0, _0801960C @ =gBattleTextBuff1
	ldr r1, _08019610 @ =gStatusConditionString_ParalysisJpn
	b _0801969C
	.align 2, 0
_0801960C: .4byte gBattleTextBuff1
_08019610: .4byte gStatusConditionString_ParalysisJpn
_08019614:
	movs r0, 0x58
	mov r3, r10
	muls r3, r0
	adds r0, r2, 0
	adds r0, 0x4C
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	beq _080196D6
	adds r2, 0x50
	adds r2, r3, r2
	ldr r0, [r2]
	ldr r1, _08019644 @ =0xf7ffffff
	ands r0, r1
	str r0, [r2]
	ldr r0, _08019648 @ =gBattleTextBuff1
	ldr r1, _0801964C @ =gStatusConditionString_SleepJpn
	bl StringCopy
	movs r0, 0x1
	mov r9, r0
	b _080196DC
	.align 2, 0
_08019644: .4byte 0xf7ffffff
_08019648: .4byte gBattleTextBuff1
_0801964C: .4byte gStatusConditionString_SleepJpn
_08019650:
	movs r0, 0x58
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	adds r1, r2, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080196D6
	ldr r0, _08019678 @ =gBattleTextBuff1
	ldr r1, _0801967C @ =gStatusConditionString_BurnJpn
	bl StringCopy
	movs r2, 0x1
	mov r9, r2
	b _080196DC
	.align 2, 0
_08019678: .4byte gBattleTextBuff1
_0801967C: .4byte gStatusConditionString_BurnJpn
_08019680:
	movs r0, 0x58
	mov r3, r10
	muls r3, r0
	adds r0, r3, 0
	adds r1, r2, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080196D6
	ldr r0, _080196A8 @ =gBattleTextBuff1
	ldr r1, _080196AC @ =gStatusConditionString_IceJpn
_0801969C:
	bl StringCopy
	movs r5, 0x1
	mov r9, r5
	b _080196DC
	.align 2, 0
_080196A8: .4byte gBattleTextBuff1
_080196AC: .4byte gStatusConditionString_IceJpn
_080196B0:
	movs r0, 0x58
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	adds r1, r2, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0xF0
	lsls r1, 12
	ands r0, r1
	cmp r0, 0
	beq _080196D6
	ldr r0, _080196EC @ =gBattleTextBuff1
	ldr r1, _080196F0 @ =gStatusConditionString_LoveJpn
	bl StringCopy
	movs r2, 0x3
	mov r9, r2
_080196D6:
	mov r3, r9
	cmp r3, 0
	beq _08019798
_080196DC:
	mov r5, r9
	cmp r5, 0x2
	beq _08019710
	cmp r5, 0x2
	bgt _080196F4
	cmp r5, 0x1
	beq _080196FC
	b _0801973C
	.align 2, 0
_080196EC: .4byte gBattleTextBuff1
_080196F0: .4byte gStatusConditionString_LoveJpn
_080196F4:
	mov r0, r9
	cmp r0, 0x3
	beq _08019728
	b _0801973C
_080196FC:
	ldr r1, _0801970C @ =gBattleMons
	movs r0, 0x58
	mov r2, r10
	muls r2, r0
	adds r1, 0x4C
	adds r2, r1
	movs r0, 0
	b _0801973A
	.align 2, 0
_0801970C: .4byte gBattleMons
_08019710:
	ldr r1, _08019724 @ =gBattleMons
	movs r0, 0x58
	mov r2, r10
	muls r2, r0
	adds r1, 0x50
	adds r2, r1
	ldr r0, [r2]
	movs r1, 0x8
	negs r1, r1
	b _08019738
	.align 2, 0
_08019724: .4byte gBattleMons
_08019728:
	ldr r1, _08019778 @ =gBattleMons
	movs r0, 0x58
	mov r2, r10
	muls r2, r0
	adds r1, 0x50
	adds r2, r1
	ldr r0, [r2]
	ldr r1, _0801977C @ =0xfff0ffff
_08019738:
	ands r0, r1
_0801973A:
	str r0, [r2]
_0801973C:
	bl b_movescr_stack_push_cursor
	ldr r1, _08019780 @ =gBattlescriptCurrInstr
	ldr r0, _08019784 @ =gUnknown_081D9956
	str r0, [r1]
	ldr r0, _08019788 @ =0x02000000
	ldr r1, _0801978C @ =0x00016003
	adds r0, r1
	mov r2, r10
	strb r2, [r0]
	ldr r4, _08019790 @ =gActiveBank
	strb r2, [r4]
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
	ldr r1, _08019794 @ =gUnknown_02024ACC
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl EmitSetAttributes
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	bl _08019F92
	.align 2, 0
_08019778: .4byte gBattleMons
_0801977C: .4byte 0xfff0ffff
_08019780: .4byte gBattlescriptCurrInstr
_08019784: .4byte gUnknown_081D9956
_08019788: .4byte 0x02000000
_0801978C: .4byte 0x00016003
_08019790: .4byte gActiveBank
_08019794: .4byte gUnknown_02024ACC
_08019798:
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, _080197B0 @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r10, r0
	bcs _080197AC
	b _08019458
_080197AC:
	bl _08019F76
	.align 2, 0
_080197B0: .4byte gNoOfAllBanks
_080197B4:
	movs r3, 0
	mov r10, r3
	ldr r0, _080197FC @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r10, r0
	bcc _080197C2
	b _08019F76
_080197C2:
	ldr r4, _08019800 @ =gBattleMons
_080197C4:
	movs r0, 0x58
	mov r5, r10
	muls r5, r0
	adds r0, r5, 0
	adds r0, r4
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x3B
	bne _080197E8
	mov r0, r10
	bl castform_switch
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	cmp r0, 0
	beq _080197E8
	b _08019E40
_080197E8:
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, _080197FC @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r10, r0
	bcc _080197C4
	b _08019F76
	.align 2, 0
_080197FC: .4byte gNoOfAllBanks
_08019800: .4byte gBattleMons
_08019804:
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, 0x1C
	beq _0801980E
	b _08019F76
_0801980E:
	ldr r4, _08019860 @ =gHitMarker
	ldr r1, [r4]
	movs r0, 0x80
	lsls r0, 7
	ands r0, r1
	cmp r0, 0
	bne _0801981E
	b _08019F76
_0801981E:
	ldr r0, _08019864 @ =0xffffbfff
	ands r1, r0
	str r1, [r4]
	ldr r3, _08019868 @ =0x000160ca
	adds r2, r7, r3
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2]
	cmp r0, 0x6
	bne _08019838
	movs r0, 0x2
	strb r0, [r2]
_08019838:
	ldr r1, _0801986C @ =gBattleCommunication
	ldrb r0, [r2]
	adds r0, 0x40
	strb r0, [r1, 0x3]
	ldr r0, _08019870 @ =gBankTarget
	ldrb r1, [r0]
	ldr r5, _08019874 @ =0x00016003
	adds r0, r7, r5
	strb r1, [r0]
	bl b_movescr_stack_push_cursor
	ldr r1, _08019878 @ =gBattlescriptCurrInstr
	ldr r0, _0801987C @ =gUnknown_081D9953
	str r0, [r1]
	ldr r0, [r4]
	movs r1, 0x80
	lsls r1, 6
	orrs r0, r1
	str r0, [r4]
	b _08019F22
	.align 2, 0
_08019860: .4byte gHitMarker
_08019864: .4byte 0xffffbfff
_08019868: .4byte 0x000160ca
_0801986C: .4byte gBattleCommunication
_08019870: .4byte gBankTarget
_08019874: .4byte 0x00016003
_08019878: .4byte gBattlescriptCurrInstr
_0801987C: .4byte gUnknown_081D9953
_08019880:
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, 0x1C
	beq _0801988A
	b _08019F76
_0801988A:
	ldr r4, _080198DC @ =gHitMarker
	ldr r1, [r4]
	movs r0, 0x80
	lsls r0, 7
	ands r0, r1
	cmp r0, 0
	bne _0801989A
	b _08019F76
_0801989A:
	ldr r0, _080198E0 @ =0xffffbfff
	ands r1, r0
	str r1, [r4]
	ldr r3, _080198E4 @ =0x000160ca
	adds r2, r7, r3
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2]
	cmp r0, 0x6
	bne _080198B4
	movs r0, 0x2
	strb r0, [r2]
_080198B4:
	ldr r1, _080198E8 @ =gBattleCommunication
	ldrb r0, [r2]
	strb r0, [r1, 0x3]
	ldr r0, _080198EC @ =gBankAttacker
	ldrb r1, [r0]
	ldr r5, _080198F0 @ =0x00016003
	adds r0, r7, r5
	strb r1, [r0]
	bl b_movescr_stack_push_cursor
	ldr r1, _080198F4 @ =gBattlescriptCurrInstr
	ldr r0, _080198F8 @ =gUnknown_081D9953
	str r0, [r1]
	ldr r0, [r4]
	movs r1, 0x80
	lsls r1, 6
	orrs r0, r1
	str r0, [r4]
	b _08019F22
	.align 2, 0
_080198DC: .4byte gHitMarker
_080198E0: .4byte 0xffffbfff
_080198E4: .4byte 0x000160ca
_080198E8: .4byte gBattleCommunication
_080198EC: .4byte gBankAttacker
_080198F0: .4byte 0x00016003
_080198F4: .4byte gBattlescriptCurrInstr
_080198F8: .4byte gUnknown_081D9953
_080198FC:
	movs r4, 0
	ldr r0, _08019934 @ =gNoOfAllBanks
	ldrb r1, [r0]
	cmp r4, r1
	blt _08019908
	b _08019F76
_08019908:
	ldr r0, _08019938 @ =gBattleMons
	adds r5, r1, 0
	ldr r2, _0801993C @ =gStatuses3
	adds r3, r0, 0
	adds r3, 0x20
	movs r6, 0x80
	lsls r6, 12
_08019916:
	ldrb r1, [r3]
	cmp r1, 0x16
	bne _08019926
	ldr r0, [r2]
	ands r0, r6
	cmp r0, 0
	beq _08019926
	b _08019E6C
_08019926:
	adds r2, 0x4
	adds r3, 0x58
	adds r4, 0x1
	cmp r4, r5
	blt _08019916
	b _08019F76
	.align 2, 0
_08019934: .4byte gNoOfAllBanks
_08019938: .4byte gBattleMons
_0801993C: .4byte gStatuses3
_08019940:
	movs r4, 0
	ldr r0, _08019A1C @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r4, r0
	blt _0801994C
	b _08019F76
_0801994C:
	ldr r0, _08019A20 @ =gActiveBank
	mov r8, r0
	ldr r1, _08019A24 @ =gBattleMons
	adds r1, 0x20
	str r1, [sp, 0x1C]
	movs r2, 0
	str r2, [sp, 0x20]
_0801995A:
	ldr r3, [sp, 0x1C]
	ldrb r0, [r3]
	cmp r0, 0x24
	beq _08019964
	b _08019AF6
_08019964:
	ldr r0, _08019A28 @ =gStatuses3
	ldr r5, [sp, 0x20]
	adds r0, r5, r0
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 13
	ands r1, r0
	str r5, [sp, 0x18]
	cmp r1, 0
	bne _0801997A
	b _08019AF6
_0801997A:
	lsls r0, r4, 24
	lsrs r0, 24
	bl GetBankIdentity
	movs r1, 0x1
	adds r5, r0, 0
	eors r5, r1
	ands r5, r1
	adds r0, r5, 0
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r5, 0x2
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08019A2C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _080199AE
	b _08019ABC
_080199AE:
	movs r1, 0x58
	adds r0, r6, 0
	muls r0, r1
	ldr r3, _08019A24 @ =gBattleMons
	adds r1, r0, r3
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0
	beq _08019A78
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	beq _08019A34
	movs r1, 0x58
	adds r0, r7, 0
	muls r0, r1
	adds r1, r0, r3
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0
	beq _08019A34
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	beq _08019A34
	str r2, [sp, 0x24]
	bl Random
	ldr r2, [sp, 0x24]
	adds r1, r2, 0
	ands r1, r0
	lsls r1, 1
	orrs r5, r1
	adds r0, r5, 0
	bl GetBankByPlayerAI
	mov r2, r8
	strb r0, [r2]
	ldrb r0, [r2]
	movs r3, 0x58
	muls r0, r3
	ldr r5, _08019A24 @ =gBattleMons
	adds r0, r5
	adds r0, 0x20
	ldrb r0, [r0]
	ldr r1, [sp, 0x1C]
	strb r0, [r1]
	ldrb r0, [r2]
	muls r0, r3
	adds r0, r5
	adds r0, 0x20
	ldrb r0, [r0]
	ldr r2, _08019A30 @ =gLastUsedAbility
	strb r0, [r2]
	b _08019AE4
	.align 2, 0
_08019A1C: .4byte gNoOfAllBanks
_08019A20: .4byte gActiveBank
_08019A24: .4byte gBattleMons
_08019A28: .4byte gStatuses3
_08019A2C: .4byte gBattleTypeFlags
_08019A30: .4byte gLastUsedAbility
_08019A34:
	ldr r3, _08019A74 @ =gBattleMons
	movs r2, 0x58
	adds r0, r6, 0
	muls r0, r2
	adds r1, r0, r3
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0
	beq _08019A78
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	beq _08019A78
	mov r5, r8
	strb r6, [r5]
	adds r1, r4, 0
	muls r1, r2
	adds r1, r3
	ldrb r0, [r5]
	muls r0, r2
	adds r0, r3
	adds r0, 0x20
	ldrb r0, [r0]
	adds r1, 0x20
	strb r0, [r1]
	ldrb r0, [r5]
	muls r0, r2
	adds r0, r3
	adds r0, 0x20
	ldrb r0, [r0]
	b _08019AE0
	.align 2, 0
_08019A74: .4byte gBattleMons
_08019A78:
	ldr r3, _08019AB8 @ =gBattleMons
	movs r2, 0x58
	adds r0, r7, 0
	muls r0, r2
	adds r1, r0, r3
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0
	beq _08019AEE
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	beq _08019AEE
	mov r5, r8
	strb r7, [r5]
	adds r1, r4, 0
	muls r1, r2
	adds r1, r3
	ldrb r0, [r5]
	muls r0, r2
	adds r0, r3
	adds r0, 0x20
	ldrb r0, [r0]
	adds r1, 0x20
	strb r0, [r1]
	ldrb r0, [r5]
	muls r0, r2
	adds r0, r3
	adds r0, 0x20
	ldrb r0, [r0]
	b _08019AE0
	.align 2, 0
_08019AB8: .4byte gBattleMons
_08019ABC:
	mov r2, r8
	strb r6, [r2]
	movs r3, 0x58
	adds r0, r6, 0
	muls r0, r3
	ldr r5, _08019B10 @ =gBattleMons
	adds r0, r5
	adds r2, r0, 0
	adds r2, 0x20
	ldrb r1, [r2]
	cmp r1, 0
	beq _08019AEE
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08019AEE
	ldr r0, [sp, 0x1C]
	strb r1, [r0]
	ldrb r0, [r2]
_08019AE0:
	ldr r1, _08019B14 @ =gLastUsedAbility
	strb r0, [r1]
_08019AE4:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08019AEE:
	mov r2, r9
	cmp r2, 0
	beq _08019AF6
	b _08019E88
_08019AF6:
	ldr r3, [sp, 0x1C]
	adds r3, 0x58
	str r3, [sp, 0x1C]
	ldr r5, [sp, 0x20]
	adds r5, 0x4
	str r5, [sp, 0x20]
	adds r4, 0x1
	ldr r0, _08019B18 @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r4, r0
	bge _08019B0E
	b _0801995A
_08019B0E:
	b _08019F76
	.align 2, 0
_08019B10: .4byte gBattleMons
_08019B14: .4byte gLastUsedAbility
_08019B18: .4byte gNoOfAllBanks
_08019B1C:
	movs r4, 0
	ldr r0, _08019B54 @ =gNoOfAllBanks
	ldrb r1, [r0]
	cmp r4, r1
	blt _08019B28
	b _08019F76
_08019B28:
	ldr r0, _08019B58 @ =gBattleMons
	adds r5, r1, 0
	ldr r2, _08019B5C @ =gStatuses3
	adds r3, r0, 0
	adds r3, 0x20
	movs r6, 0x80
	lsls r6, 12
_08019B36:
	ldrb r1, [r3]
	cmp r1, 0x16
	bne _08019B46
	ldr r0, [r2]
	ands r0, r6
	cmp r0, 0
	beq _08019B46
	b _08019F04
_08019B46:
	adds r2, 0x4
	adds r3, 0x58
	adds r4, 0x1
	cmp r4, r5
	blt _08019B36
	b _08019F76
	.align 2, 0
_08019B54: .4byte gNoOfAllBanks
_08019B58: .4byte gBattleMons
_08019B5C: .4byte gStatuses3
_08019B60:
	mov r0, r10
	bl GetBankSide
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _08019BB0 @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r4, r0
	blt _08019B76
	b _08019F76
_08019B76:
	ldr r7, _08019BB4 @ =gBattleMons
_08019B78:
	lsls r0, r4, 24
	lsrs r0, 24
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	adds r3, r4, 0x1
	cmp r0, r5
	beq _08019BA2
	movs r0, 0x58
	muls r0, r4
	adds r0, r7
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, r6
	bne _08019BA2
	ldr r0, _08019BB8 @ =gLastUsedAbility
	strb r6, [r0]
	lsls r0, r3, 24
	lsrs r0, 24
	mov r9, r0
_08019BA2:
	adds r4, r3, 0
	ldr r0, _08019BB0 @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r4, r0
	blt _08019B78
	b _08019F76
	.align 2, 0
_08019BB0: .4byte gNoOfAllBanks
_08019BB4: .4byte gBattleMons
_08019BB8: .4byte gLastUsedAbility
_08019BBC:
	mov r0, r10
	bl GetBankSide
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _08019C0C @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r4, r0
	blt _08019BD2
	b _08019F76
_08019BD2:
	ldr r7, _08019C10 @ =gBattleMons
_08019BD4:
	lsls r0, r4, 24
	lsrs r0, 24
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	adds r3, r4, 0x1
	cmp r0, r5
	bne _08019BFE
	movs r0, 0x58
	muls r0, r4
	adds r0, r7
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, r6
	bne _08019BFE
	ldr r0, _08019C14 @ =gLastUsedAbility
	strb r6, [r0]
	lsls r0, r3, 24
	lsrs r0, 24
	mov r9, r0
_08019BFE:
	adds r4, r3, 0
	ldr r0, _08019C0C @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r4, r0
	blt _08019BD4
	b _08019F76
	.align 2, 0
_08019C0C: .4byte gNoOfAllBanks
_08019C10: .4byte gBattleMons
_08019C14: .4byte gLastUsedAbility
_08019C18:
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, 0xFD
	beq _08019C40
	cmp r0, 0xFE
	beq _08019C78
	movs r4, 0
	ldr r0, _08019C38 @ =gNoOfAllBanks
	adds r5, r0, 0
	ldrb r2, [r5]
	cmp r4, r2
	blt _08019C32
	b _08019F76
_08019C32:
	ldr r2, _08019C3C @ =gBattleMons
	b _08019CB0
	.align 2, 0
_08019C38: .4byte gNoOfAllBanks
_08019C3C: .4byte gBattleMons
_08019C40:
	movs r4, 0
	ldr r0, _08019C70 @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r4, r0
	blt _08019C4C
	b _08019F76
_08019C4C:
	ldr r5, _08019C74 @ =gStatuses3
	movs r2, 0x80
	lsls r2, 9
	adds r1, r0, 0
_08019C54:
	lsls r0, r4, 2
	adds r0, r5
	ldr r0, [r0]
	ands r0, r2
	adds r3, r4, 0x1
	cmp r0, 0
	beq _08019C68
	lsls r0, r3, 24
	lsrs r0, 24
	mov r9, r0
_08019C68:
	adds r4, r3, 0
	cmp r4, r1
	blt _08019C54
	b _08019F76
	.align 2, 0
_08019C70: .4byte gNoOfAllBanks
_08019C74: .4byte gStatuses3
_08019C78:
	movs r4, 0
	ldr r0, _08019CA8 @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r4, r0
	blt _08019C84
	b _08019F76
_08019C84:
	ldr r5, _08019CAC @ =gStatuses3
	movs r2, 0x80
	lsls r2, 10
	adds r1, r0, 0
_08019C8C:
	lsls r0, r4, 2
	adds r0, r5
	ldr r0, [r0]
	ands r0, r2
	adds r3, r4, 0x1
	cmp r0, 0
	beq _08019CA0
	lsls r0, r3, 24
	lsrs r0, 24
	mov r9, r0
_08019CA0:
	adds r4, r3, 0
	cmp r4, r1
	blt _08019C8C
	b _08019F76
	.align 2, 0
_08019CA8: .4byte gNoOfAllBanks
_08019CAC: .4byte gStatuses3
_08019CB0:
	movs r0, 0x58
	muls r0, r4
	adds r0, r2
	adds r0, 0x20
	ldrb r0, [r0]
	adds r3, r4, 0x1
	cmp r0, r6
	bne _08019CCA
	mov r0, r8
	strb r6, [r0]
	lsls r0, r3, 24
	lsrs r0, 24
	mov r9, r0
_08019CCA:
	adds r4, r3, 0
	ldrb r1, [r5]
	cmp r4, r1
	blt _08019CB0
	b _08019F76
_08019CD4:
	movs r4, 0
	ldr r0, _08019D10 @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r4, r0
	blt _08019CE0
	b _08019F76
_08019CE0:
	ldr r7, _08019D14 @ =gBattleMons
	adds r2, r0, 0
	movs r5, 0x58
_08019CE6:
	adds r0, r4, 0
	muls r0, r5
	adds r1, r0, r7
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	adds r3, r4, 0x1
	cmp r0, r6
	bne _08019D08
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	beq _08019D08
	mov r0, r8
	strb r6, [r0]
	lsls r0, r3, 24
	lsrs r0, 24
	mov r9, r0
_08019D08:
	adds r4, r3, 0
	cmp r4, r2
	blt _08019CE6
	b _08019F76
	.align 2, 0
_08019D10: .4byte gNoOfAllBanks
_08019D14: .4byte gBattleMons
_08019D18:
	movs r4, 0
	ldr r0, _08019D50 @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r4, r0
	blt _08019D24
	b _08019F76
_08019D24:
	ldr r7, _08019D54 @ =gBattleMons
	adds r1, r0, 0
	movs r5, 0x58
	ldr r2, _08019D58 @ =gLastUsedAbility
_08019D2C:
	adds r0, r4, 0
	muls r0, r5
	adds r0, r7
	adds r0, 0x20
	ldrb r0, [r0]
	adds r3, r4, 0x1
	cmp r0, r6
	bne _08019D48
	cmp r4, r10
	beq _08019D48
	strb r6, [r2]
	lsls r0, r3, 24
	lsrs r0, 24
	mov r9, r0
_08019D48:
	adds r4, r3, 0
	cmp r4, r1
	blt _08019D2C
	b _08019F76
	.align 2, 0
_08019D50: .4byte gNoOfAllBanks
_08019D54: .4byte gBattleMons
_08019D58: .4byte gLastUsedAbility
_08019D5C:
	mov r0, r10
	bl GetBankSide
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _08019DAC @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r4, r0
	blt _08019D72
	b _08019F76
_08019D72:
	ldr r7, _08019DB0 @ =gBattleMons
_08019D74:
	lsls r0, r4, 24
	lsrs r0, 24
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r5
	beq _08019DA0
	movs r0, 0x58
	muls r0, r4
	adds r0, r7
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, r6
	bne _08019DA0
	ldr r0, _08019DB4 @ =gLastUsedAbility
	strb r6, [r0]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08019DA0:
	adds r4, 0x1
	ldr r0, _08019DAC @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r4, r0
	blt _08019D74
	b _08019F76
	.align 2, 0
_08019DAC: .4byte gNoOfAllBanks
_08019DB0: .4byte gBattleMons
_08019DB4: .4byte gLastUsedAbility
_08019DB8:
	mov r0, r10
	bl GetBankSide
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _08019E08 @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r4, r0
	blt _08019DCE
	b _08019F76
_08019DCE:
	ldr r7, _08019E0C @ =gBattleMons
_08019DD0:
	lsls r0, r4, 24
	lsrs r0, 24
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r5
	bne _08019DFC
	movs r0, 0x58
	muls r0, r4
	adds r0, r7
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, r6
	bne _08019DFC
	ldr r0, _08019E10 @ =gLastUsedAbility
	strb r6, [r0]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08019DFC:
	adds r4, 0x1
	ldr r0, _08019E08 @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r4, r0
	blt _08019DD0
	b _08019F76
	.align 2, 0
_08019E08: .4byte gNoOfAllBanks
_08019E0C: .4byte gBattleMons
_08019E10: .4byte gLastUsedAbility
_08019E14:
	ldr r0, _08019E30 @ =gUnknown_081D977D
	bl b_push_move_exec
	ldr r0, _08019E34 @ =0x02000000
	ldr r2, _08019E38 @ =0x00016003
	adds r1, r0, r2
	strb r6, [r1]
	mov r1, r9
	subs r1, 0x1
	ldr r3, _08019E3C @ =0x0001609b
	adds r0, r3
	strb r1, [r0]
	b _08019F76
	.align 2, 0
_08019E30: .4byte gUnknown_081D977D
_08019E34: .4byte 0x02000000
_08019E38: .4byte 0x00016003
_08019E3C: .4byte 0x0001609b
_08019E40:
	ldr r0, _08019E5C @ =gUnknown_081D977D
	bl b_push_move_exec
	ldr r0, _08019E60 @ =0x02000000
	ldr r5, _08019E64 @ =0x00016003
	adds r1, r0, r5
	mov r2, r10
	strb r2, [r1]
	mov r1, r9
	subs r1, 0x1
	ldr r3, _08019E68 @ =0x0001609b
	adds r0, r3
	strb r1, [r0]
	b _08019F92
	.align 2, 0
_08019E5C: .4byte gUnknown_081D977D
_08019E60: .4byte 0x02000000
_08019E64: .4byte 0x00016003
_08019E68: .4byte 0x0001609b
_08019E6C:
	mov r5, r8
	strb r1, [r5]
	ldr r0, [r2]
	ldr r1, _08019E80 @ =0xfff7ffff
	ands r0, r1
	str r0, [r2]
	ldr r0, _08019E84 @ =gUnknown_081D978C
	bl b_push_move_exec
	b _08019F1A
	.align 2, 0
_08019E80: .4byte 0xfff7ffff
_08019E84: .4byte gUnknown_081D978C
_08019E88:
	ldr r0, _08019EDC @ =gUnknown_081D9726
	bl b_push_move_exec
	ldr r1, _08019EE0 @ =gStatuses3
	ldr r2, [sp, 0x18]
	adds r1, r2, r1
	ldr r0, [r1]
	ldr r2, _08019EE4 @ =0xffefffff
	ands r0, r2
	str r0, [r1]
	ldr r0, _08019EE8 @ =0x02000000
	ldr r3, _08019EEC @ =0x00016003
	adds r0, r3
	strb r4, [r0]
	ldr r1, _08019EF0 @ =gBattleTextBuff1
	movs r4, 0xFD
	strb r4, [r1]
	movs r0, 0x4
	strb r0, [r1, 0x1]
	ldr r2, _08019EF4 @ =gActiveBank
	ldrb r0, [r2]
	strb r0, [r1, 0x2]
	ldr r3, _08019EF8 @ =gBattlePartyID
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _08019EFC @ =gBattleTextBuff2
	strb r4, [r1]
	movs r0, 0x9
	strb r0, [r1, 0x1]
	ldr r0, _08019F00 @ =gLastUsedAbility
	ldrb r0, [r0]
	strb r0, [r1, 0x2]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r1, 0x3]
	b _08019F76
	.align 2, 0
_08019EDC: .4byte gUnknown_081D9726
_08019EE0: .4byte gStatuses3
_08019EE4: .4byte 0xffefffff
_08019EE8: .4byte 0x02000000
_08019EEC: .4byte 0x00016003
_08019EF0: .4byte gBattleTextBuff1
_08019EF4: .4byte gActiveBank
_08019EF8: .4byte gBattlePartyID
_08019EFC: .4byte gBattleTextBuff2
_08019F00: .4byte gLastUsedAbility
_08019F04:
	mov r5, r8
	strb r1, [r5]
	ldr r0, [r2]
	ldr r1, _08019F30 @ =0xfff7ffff
	ands r0, r1
	str r0, [r2]
	bl b_movescr_stack_push_cursor
	ldr r1, _08019F34 @ =gBattlescriptCurrInstr
	ldr r0, _08019F38 @ =gUnknown_081D9795
	str r0, [r1]
_08019F1A:
	ldr r0, _08019F3C @ =0x02000000
	ldr r1, _08019F40 @ =0x000160dd
	adds r0, r1
	strb r4, [r0]
_08019F22:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	b _08019F76
	.align 2, 0
_08019F30: .4byte 0xfff7ffff
_08019F34: .4byte gBattlescriptCurrInstr
_08019F38: .4byte gUnknown_081D9795
_08019F3C: .4byte 0x02000000
_08019F40: .4byte 0x000160dd
_08019F44:
	movs r4, 0
	ldr r0, _08019FA4 @ =gNoOfAllBanks
	ldrb r1, [r0]
	cmp r4, r1
	bge _08019F76
	ldr r0, _08019FA8 @ =gBattleMons
	adds r2, r1, 0
	adds r1, r0, 0
	adds r1, 0x20
	ldr r3, _08019FAC @ =gLastUsedAbility
_08019F58:
	ldrb r0, [r1]
	cmp r0, r6
	bne _08019F6E
	cmp r4, r10
	beq _08019F6E
	strb r6, [r3]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08019F6E:
	adds r1, 0x58
	adds r4, 0x1
	cmp r4, r2
	blt _08019F58
_08019F76:
	mov r2, r9
	cmp r2, 0
	beq _08019F92
_08019F7C:
	ldr r3, [sp, 0x4]
	cmp r3, 0xB
	bhi _08019F92
	ldr r1, _08019FAC @ =gLastUsedAbility
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _08019F92
	adds r1, r0, 0
	mov r0, r10
	bl RecordAbilityBattle
_08019F92:
	mov r0, r9
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08019FA4: .4byte gNoOfAllBanks
_08019FA8: .4byte gBattleMons
_08019FAC: .4byte gLastUsedAbility
	thumb_func_end AbilityBattleEffects

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
