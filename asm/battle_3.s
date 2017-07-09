	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start b_movescr_stack_push
b_movescr_stack_push: @ 801582C
	push {r4,lr}
	ldr r4, _08015848 @ =0x02017110
	adds r3, r4, 0
	adds r3, 0x20
	ldrb r1, [r3]
	adds r2, r1, 0x1
	strb r2, [r3]
	lsls r1, 24
	lsrs r1, 22
	adds r1, r4
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08015848: .4byte 0x02017110
	thumb_func_end b_movescr_stack_push

	thumb_func_start b_movescr_stack_push_cursor
b_movescr_stack_push_cursor: @ 801584C
	ldr r3, _08015868 @ =0x02017110
	adds r2, r3, 0
	adds r2, 0x20
	ldrb r0, [r2]
	adds r1, r0, 0x1
	strb r1, [r2]
	lsls r0, 24
	lsrs r0, 22
	adds r0, r3
	ldr r1, _0801586C @ =gBattlescriptCurrInstr
	ldr r1, [r1]
	str r1, [r0]
	bx lr
	.align 2, 0
_08015868: .4byte 0x02017110
_0801586C: .4byte gBattlescriptCurrInstr
	thumb_func_end b_movescr_stack_push_cursor

	thumb_func_start b_movescr_stack_pop_cursor
b_movescr_stack_pop_cursor: @ 8015870
	ldr r3, _0801588C @ =gBattlescriptCurrInstr
	ldr r2, _08015890 @ =0x02017110
	adds r1, r2, 0
	adds r1, 0x20
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	str r0, [r3]
	bx lr
	.align 2, 0
_0801588C: .4byte gBattlescriptCurrInstr
_08015890: .4byte 0x02017110
	thumb_func_end b_movescr_stack_pop_cursor

	thumb_func_start sub_8015894
sub_8015894: @ 8015894
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0
	ldr r2, _080159AC @ =gBattleMons
	ldr r1, _080159B0 @ =gBattleBufferB
	ldr r5, _080159B4 @ =gActiveBank
	ldrb r3, [r5]
	lsls r0, r3, 9
	adds r1, 0x2
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	movs r1, 0x58
	muls r1, r3
	adds r0, r1
	adds r2, 0xC
	adds r0, r2
	ldrh r4, [r0]
	lsls r0, r3, 1
	ldr r2, _080159B8 @ =0x020160e8
	adds r0, r2
	mov r8, r0
	ldr r1, _080159BC @ =gDisableStructs
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x4]
	cmp r0, r4
	bne _080158EE
	cmp r4, 0
	beq _080158EE
	adds r0, r2, 0
	subs r0, 0xE5
	strb r3, [r0]
	ldr r0, _080159C0 @ =gCurrentMove
	strh r4, [r0]
	ldr r1, _080159C4 @ =gUnknown_02024C1C
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080159C8 @ =gUnknown_081D9144
	str r1, [r0]
	movs r6, 0x1
_080158EE:
	ldr r1, _080159CC @ =gLastUsedMove
	ldr r5, _080159B4 @ =gActiveBank
	ldrb r2, [r5]
	lsls r0, r2, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	bne _0801592A
	cmp r4, 0xA5
	beq _0801592A
	ldr r1, _080159AC @ =gBattleMons
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	bge _0801592A
	adds r0, r2, 0
	bl CancelMultiTurnMoves
	ldr r1, _080159C4 @ =gUnknown_02024C1C
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080159D0 @ =gUnknown_081D937C
	str r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0801592A:
	ldr r2, _080159BC @ =gDisableStructs
	ldr r3, _080159B4 @ =gActiveBank
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x13]
	lsls r0, 28
	cmp r0, 0
	beq _08015966
	ldr r0, _080159D4 @ =gBattleMoves
	lsls r1, r4, 1
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _08015966
	ldr r0, _080159C0 @ =gCurrentMove
	strh r4, [r0]
	ldr r1, _080159C4 @ =gUnknown_02024C1C
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080159D8 @ =gUnknown_081D938B
	str r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08015966:
	ldr r5, _080159B4 @ =gActiveBank
	ldrb r0, [r5]
	adds r1, r4, 0
	bl sub_8015D5C
	lsls r0, 24
	cmp r0, 0
	beq _0801598C
	ldr r0, _080159C0 @ =gCurrentMove
	strh r4, [r0]
	ldr r1, _080159C4 @ =gUnknown_02024C1C
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080159DC @ =gUnknown_081D9464
	str r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0801598C:
	ldr r1, _080159AC @ =gBattleMons
	ldrb r2, [r5]
	movs r0, 0x58
	muls r0, r2
	adds r1, r0, r1
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _080159E4
	ldr r1, _080159E0 @ =gEnigmaBerries
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r3, [r0, 0x7]
	b _080159EE
	.align 2, 0
_080159AC: .4byte gBattleMons
_080159B0: .4byte gBattleBufferB
_080159B4: .4byte gActiveBank
_080159B8: .4byte 0x020160e8
_080159BC: .4byte gDisableStructs
_080159C0: .4byte gCurrentMove
_080159C4: .4byte gUnknown_02024C1C
_080159C8: .4byte gUnknown_081D9144
_080159CC: .4byte gLastUsedMove
_080159D0: .4byte gUnknown_081D937C
_080159D4: .4byte gBattleMoves
_080159D8: .4byte gUnknown_081D938B
_080159DC: .4byte gUnknown_081D9464
_080159E0: .4byte gEnigmaBerries
_080159E4:
	ldrh r0, [r1, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r3, r0, 24
_080159EE:
	ldr r2, _08015A70 @ =gStringBank
	ldr r1, _08015A74 @ =gActiveBank
	ldrb r0, [r1]
	strb r0, [r2]
	ldr r7, _08015A78 @ =gBattleMons
	adds r5, r1, 0
	cmp r3, 0x1D
	bne _08015A36
	mov r0, r8
	ldrh r2, [r0]
	adds r1, r2, 0
	cmp r1, 0
	beq _08015A36
	ldr r0, _08015A7C @ =0x0000ffff
	cmp r1, r0
	beq _08015A36
	cmp r1, r4
	beq _08015A36
	ldr r0, _08015A80 @ =gCurrentMove
	strh r2, [r0]
	ldr r2, _08015A84 @ =gLastUsedItem
	ldrb r1, [r5]
	movs r0, 0x58
	muls r0, r1
	adds r0, r7
	ldrh r0, [r0, 0x2E]
	strh r0, [r2]
	ldr r1, _08015A88 @ =gUnknown_02024C1C
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08015A8C @ =gUnknown_081D9AC2
	str r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08015A36:
	ldr r0, _08015A90 @ =gBattleBufferB
	ldrb r2, [r5]
	lsls r1, r2, 9
	adds r0, 0x2
	adds r1, r0
	movs r0, 0x58
	muls r0, r2
	ldrb r1, [r1]
	adds r0, r1
	adds r1, r7, 0
	adds r1, 0x24
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08015A64
	ldr r1, _08015A88 @ =gUnknown_02024C1C
	lsls r0, r2, 2
	adds r0, r1
	ldr r1, _08015A94 @ =gUnknown_081D9369
	str r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08015A64:
	adds r0, r6, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08015A70: .4byte gStringBank
_08015A74: .4byte gActiveBank
_08015A78: .4byte gBattleMons
_08015A7C: .4byte 0x0000ffff
_08015A80: .4byte gCurrentMove
_08015A84: .4byte gLastUsedItem
_08015A88: .4byte gUnknown_02024C1C
_08015A8C: .4byte gUnknown_081D9AC2
_08015A90: .4byte gBattleBufferB
_08015A94: .4byte gUnknown_081D9369
	thumb_func_end sub_8015894

	thumb_func_start sub_8015A98
sub_8015A98: @ 8015A98
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r2, 24
	lsrs r3, r2, 24
	lsls r1, r7, 1
	ldr r0, _08015AD8 @ =0x020160e8
	adds r1, r0
	str r1, [sp, 0x4]
	ldr r1, _08015ADC @ =gBattleMons
	movs r0, 0x58
	muls r0, r7
	adds r1, r0, r1
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _08015AE4
	ldr r2, _08015AE0 @ =gEnigmaBerries
	lsls r1, r7, 3
	subs r0, r1, r7
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x7]
	str r0, [sp]
	b _08015AF6
	.align 2, 0
_08015AD8: .4byte 0x020160e8
_08015ADC: .4byte gBattleMons
_08015AE0: .4byte gEnigmaBerries
_08015AE4:
	ldrh r0, [r1, 0x2E]
	str r3, [sp, 0x14]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	lsls r1, r7, 3
	ldr r3, [sp, 0x14]
_08015AF6:
	ldr r0, _08015C70 @ =gStringBank
	strb r7, [r0]
	movs r0, 0
	mov r9, r0
	lsls r2, r7, 1
	str r2, [sp, 0xC]
	ldr r5, _08015C74 @ =gDisableStructs
	mov r12, r5
	ldr r0, _08015C78 @ =gBattleMons
	movs r2, 0x58
	adds r6, r7, 0
	muls r6, r2
	str r6, [sp, 0x8]
	ldr r2, _08015C7C @ =gUnknown_02024A8C
	adds r5, r6, r2
	movs r6, 0
	str r6, [sp, 0x10]
	mov r10, r0
	subs r0, r1, r7
	lsls r0, 2
	mov r8, r0
	ldr r6, _08015C80 @ =gBitTable
_08015B22:
	ldrh r0, [r5]
	cmp r0, 0
	bne _08015B38
	movs r0, 0x1
	ands r0, r3
	cmp r0, 0
	beq _08015B38
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_08015B38:
	ldr r0, [sp, 0x8]
	add r0, r9
	mov r1, r10
	adds r1, 0x24
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08015B58
	movs r0, 0x2
	ands r0, r3
	cmp r0, 0
	beq _08015B58
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_08015B58:
	mov r1, r8
	add r1, r12
	ldrh r0, [r5]
	ldrh r1, [r1, 0x4]
	cmp r0, r1
	bne _08015B74
	movs r0, 0x4
	ands r0, r3
	cmp r0, 0
	beq _08015B74
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_08015B74:
	movs r0, 0x58
	adds r2, r7, 0
	muls r2, r0
	ldr r1, [sp, 0x10]
	adds r0, r1, r2
	ldr r1, _08015C7C @ =gUnknown_02024A8C
	adds r0, r1
	mov r12, r0
	ldr r1, _08015C84 @ =gLastUsedMove
	ldr r0, [sp, 0xC]
	adds r1, r0, r1
	str r1, [sp, 0x18]
	mov r1, r12
	ldrh r1, [r1]
	mov r12, r1
	ldr r0, [sp, 0x18]
	ldrh r0, [r0]
	cmp r12, r0
	bne _08015BB6
	movs r0, 0x8
	ands r0, r3
	cmp r0, 0
	beq _08015BB6
	mov r0, r10
	adds r0, 0x50
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, 0
	bge _08015BB6
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_08015BB6:
	ldr r0, _08015C74 @ =gDisableStructs
	add r0, r8
	ldrb r0, [r0, 0x13]
	lsls r0, 28
	cmp r0, 0
	beq _08015BE4
	movs r0, 0x10
	ands r0, r3
	cmp r0, 0
	beq _08015BE4
	ldr r2, _08015C88 @ =gBattleMoves
	ldrh r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	bne _08015BE4
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_08015BE4:
	ldrh r1, [r5]
	adds r0, r7, 0
	str r3, [sp, 0x14]
	bl sub_8015D5C
	lsls r0, 24
	ldr r3, [sp, 0x14]
	cmp r0, 0
	beq _08015C06
	movs r0, 0x20
	ands r0, r3
	cmp r0, 0
	beq _08015C06
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_08015C06:
	ldr r1, _08015C74 @ =gDisableStructs
	mov r0, r8
	adds r2, r0, r1
	ldrb r0, [r2, 0xE]
	lsls r0, 28
	mov r12, r1
	cmp r0, 0
	beq _08015C26
	ldrh r0, [r2, 0x6]
	ldrh r1, [r5]
	cmp r0, r1
	beq _08015C26
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_08015C26:
	ldr r2, [sp]
	cmp r2, 0x1D
	bne _08015C48
	ldr r0, [sp, 0x4]
	ldrh r1, [r0]
	cmp r1, 0
	beq _08015C48
	ldr r0, _08015C8C @ =0x0000ffff
	cmp r1, r0
	beq _08015C48
	ldrh r2, [r5]
	cmp r1, r2
	beq _08015C48
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_08015C48:
	adds r6, 0x4
	adds r5, 0x2
	ldr r0, [sp, 0x10]
	adds r0, 0x2
	str r0, [sp, 0x10]
	movs r1, 0x1
	add r9, r1
	mov r2, r9
	cmp r2, 0x3
	bgt _08015C5E
	b _08015B22
_08015C5E:
	adds r0, r4, 0
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08015C70: .4byte gStringBank
_08015C74: .4byte gDisableStructs
_08015C78: .4byte gBattleMons
_08015C7C: .4byte gUnknown_02024A8C
_08015C80: .4byte gBitTable
_08015C84: .4byte gLastUsedMove
_08015C88: .4byte gBattleMoves
_08015C8C: .4byte 0x0000ffff
	thumb_func_end sub_8015A98

	thumb_func_start sub_8015C90
sub_8015C90: @ 8015C90
	push {r4-r6,lr}
	ldr r5, _08015CFC @ =gActiveBank
	ldrb r0, [r5]
	movs r1, 0
	movs r2, 0xFF
	bl sub_8015A98
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xF
	bne _08015D38
	ldr r0, _08015D00 @ =gProtectStructs
	ldrb r1, [r5]
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	ldr r1, _08015D04 @ =gUnknown_02024C1C
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08015D08 @ =gUnknown_081D9365
	str r1, [r0]
	ldr r0, _08015D0C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08015D14
	ldrb r0, [r5]
	bl GetBankIdentity
	adds r4, r0, 0
	bl Random
	movs r1, 0x1
	eors r4, r1
	movs r1, 0x2
	ands r1, r0
	orrs r4, r1
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl GetBankByPlayerAI
	ldr r2, _08015D10 @ =gBattleBufferB
	ldrb r1, [r5]
	lsls r1, 9
	adds r2, 0x3
	adds r1, r2
	b _08015D48
	.align 2, 0
_08015CFC: .4byte gActiveBank
_08015D00: .4byte gProtectStructs
_08015D04: .4byte gUnknown_02024C1C
_08015D08: .4byte gUnknown_081D9365
_08015D0C: .4byte gBattleTypeFlags
_08015D10: .4byte gBattleBufferB
_08015D14:
	ldrb r0, [r5]
	bl GetBankIdentity
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByPlayerAI
	ldr r2, _08015D34 @ =gBattleBufferB
	ldrb r1, [r5]
	lsls r1, 9
	adds r2, 0x3
	adds r1, r2
	b _08015D48
	.align 2, 0
_08015D34: .4byte gBattleBufferB
_08015D38:
	ldr r0, _08015D58 @ =gProtectStructs
	ldrb r1, [r5]
	lsls r1, 4
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
_08015D48:
	strb r0, [r1]
	movs r0, 0
	cmp r6, 0xF
	bne _08015D52
	movs r0, 0x1
_08015D52:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08015D58: .4byte gProtectStructs
	thumb_func_end sub_8015C90

	thumb_func_start sub_8015D5C
sub_8015D5C: @ 8015D5C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r5, r1, 16
	movs r6, 0
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r4, 0
	ldr r0, _08015DF0 @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r6, r0
	bge _08015DE0
	ldr r7, _08015DF4 @ =gUnknown_02024A8C
	mov r8, r7
_08015D86:
	lsls r0, r4, 24
	lsrs r0, 24
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	adds r3, r4, 0x1
	cmp r9, r0
	beq _08015DD6
	ldr r1, _08015DF8 @ =gStatuses3
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 6
	ands r0, r1
	cmp r0, 0
	beq _08015DD6
	movs r2, 0
	movs r0, 0x58
	adds r1, r4, 0
	muls r1, r0
	adds r0, r1, r7
	ldrh r0, [r0]
	cmp r5, r0
	beq _08015DCC
	mov r4, r8
	adds r0, r1, r4
_08015DBE:
	adds r0, 0x2
	adds r2, 0x1
	cmp r2, 0x3
	bgt _08015DD6
	ldrh r1, [r0]
	cmp r5, r1
	bne _08015DBE
_08015DCC:
	cmp r2, 0x3
	bgt _08015DD6
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08015DD6:
	adds r4, r3, 0
	ldr r0, _08015DF0 @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r4, r0
	blt _08015D86
_08015DE0:
	adds r0, r6, 0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08015DF0: .4byte gNoOfAllBanks
_08015DF4: .4byte gUnknown_02024A8C
_08015DF8: .4byte gStatuses3
	thumb_func_end sub_8015D5C

	thumb_func_start UpdateTurnCounters
UpdateTurnCounters: @ 8015DFC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r0, 0
	mov r9, r0
	ldr r1, _08015EA0 @ =gBankAttacker
	mov r2, r9
	strb r2, [r1]
	ldr r0, _08015EA4 @ =gNoOfAllBanks
	ldrb r4, [r0]
	adds r6, r1, 0
	mov r10, r0
	ldr r7, _08015EA8 @ =gBankTarget
	ldr r3, _08015EAC @ =0x02000000
	mov r12, r3
	cmp r9, r4
	bcs _08015E50
	ldr r2, _08015EB0 @ =gAbsentBankFlags
	ldrb r1, [r2]
	ldr r5, _08015EB4 @ =gBitTable
	ldr r0, [r5]
	ands r1, r0
	cmp r1, 0
	beq _08015E50
	adds r3, r6, 0
_08015E32:
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r4
	bcs _08015E50
	ldrb r0, [r2]
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r5
	ldr r1, [r1]
	ands r0, r1
	cmp r0, 0
	bne _08015E32
_08015E50:
	movs r0, 0
	strb r0, [r7]
	mov r0, r10
	ldrb r4, [r0]
	cmp r4, 0
	beq _08015E8A
	ldr r2, _08015EB0 @ =gAbsentBankFlags
	ldrb r1, [r2]
	ldr r5, _08015EB4 @ =gBitTable
	ldr r0, [r5]
	ands r1, r0
	cmp r1, 0
	beq _08015E8A
	adds r3, r7, 0
_08015E6C:
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r4
	bcs _08015E8A
	ldrb r0, [r2]
	ldrb r1, [r7]
	lsls r1, 2
	adds r1, r5
	ldr r1, [r1]
	ands r0, r1
	cmp r0, 0
	bne _08015E6C
_08015E8A:
	ldr r0, _08015EB8 @ =0x0001600e
	add r0, r12
	ldrb r0, [r0]
	cmp r0, 0xA
	bls _08015E96
	b _0801652A
_08015E96:
	lsls r0, 2
	ldr r1, _08015EBC @ =_08015EC0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08015EA0: .4byte gBankAttacker
_08015EA4: .4byte gNoOfAllBanks
_08015EA8: .4byte gBankTarget
_08015EAC: .4byte 0x02000000
_08015EB0: .4byte gAbsentBankFlags
_08015EB4: .4byte gBitTable
_08015EB8: .4byte 0x0001600e
_08015EBC: .4byte _08015EC0
	.align 2, 0
_08015EC0:
	.4byte _08015EEC
	.4byte _08015F74
	.4byte _08016034
	.4byte _080160F4
	.4byte _080161C8
	.4byte _08016274
	.4byte _08016324
	.4byte _080163A8
	.4byte _08016420
	.4byte _08016494
	.4byte _08016520
_08015EEC:
	movs r5, 0
	ldr r1, _08015F0C @ =gNoOfAllBanks
	mov r10, r1
	ldrb r2, [r1]
	cmp r5, r2
	bge _08015F06
	ldr r2, _08015F10 @ =gTurnOrder
_08015EFA:
	adds r0, r5, r2
	strb r5, [r0]
	adds r5, 0x1
	ldrb r3, [r1]
	cmp r5, r3
	blt _08015EFA
_08015F06:
	movs r5, 0
	b _08015F54
	.align 2, 0
_08015F0C: .4byte gNoOfAllBanks
_08015F10: .4byte gTurnOrder
_08015F14:
	adds r4, r5, 0x1
	adds r6, r4, 0
	ldrb r1, [r1]
	cmp r6, r1
	bge _08015F52
	ldr r7, _08016004 @ =gTurnOrder
	ldr r0, _08016008 @ =gNoOfAllBanks
	mov r10, r0
	lsls r1, r5, 24
	mov r8, r1
_08015F28:
	adds r0, r5, r7
	ldrb r0, [r0]
	adds r1, r4, r7
	ldrb r1, [r1]
	movs r2, 0
	bl b_first_side
	lsls r0, 24
	cmp r0, 0
	beq _08015F48
	lsls r1, r4, 24
	lsrs r1, 24
	mov r2, r8
	lsrs r0, r2, 24
	bl sub_8012FBC
_08015F48:
	adds r4, 0x1
	ldr r0, _08016008 @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r4, r0
	blt _08015F28
_08015F52:
	adds r5, r6, 0
_08015F54:
	mov r1, r10
	ldrb r0, [r1]
	subs r0, 0x1
	cmp r5, r0
	blt _08015F14
	ldr r1, _0801600C @ =0x02000000
	ldr r3, _08016010 @ =0x0001600e
	adds r2, r1, r3
	ldrb r0, [r2]
	adds r0, 0x1
	movs r3, 0
	strb r0, [r2]
	ldr r2, _08016014 @ =0x000160fc
	adds r0, r1, r2
	strb r3, [r0]
	mov r12, r1
_08015F74:
	ldr r1, _08016014 @ =0x000160fc
	add r1, r12
	ldrb r0, [r1]
	cmp r0, 0x1
	bls _08015F80
	b _08016236
_08015F80:
	ldr r3, _08016018 @ =gActiveBank
	mov r8, r3
	adds r6, r1, 0
	movs r7, 0
	ldr r5, _0801601C @ =gBattleTextBuff1
_08015F8A:
	ldr r0, _08016020 @ =gBankAttacker
	ldrb r4, [r6]
	strb r4, [r0]
	mov r0, r8
	strb r4, [r0]
	ldr r0, _08016024 @ =gSideAffecting
	lsls r2, r4, 1
	adds r3, r2, r0
	ldrh r1, [r3]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08015FE8
	ldr r0, _08016028 @ =gSideTimer
	adds r1, r2, r4
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	movs r4, 0xFF
	lsls r0, 24
	cmp r0, 0
	bne _08015FE8
	ldrh r0, [r3]
	ldr r2, _0801602C @ =0x0000fffe
	adds r1, r2, 0
	ands r0, r1
	strh r0, [r3]
	ldr r0, _08016030 @ =gUnknown_081D9030
	bl b_call_bc_move_exec
	movs r0, 0xFD
	strb r0, [r5]
	movs r0, 0x2
	strb r0, [r5, 0x1]
	movs r0, 0x73
	strb r0, [r5, 0x2]
	strb r7, [r5, 0x3]
	ldrb r0, [r5, 0x4]
	orrs r0, r4
	strb r0, [r5, 0x4]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08015FE8:
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	ldr r3, _0801600C @ =0x02000000
	mov r12, r3
	mov r1, r9
	cmp r1, 0
	beq _08015FFA
	b _08016532
_08015FFA:
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _08015F8A
	b _08016236
	.align 2, 0
_08016004: .4byte gTurnOrder
_08016008: .4byte gNoOfAllBanks
_0801600C: .4byte 0x02000000
_08016010: .4byte 0x0001600e
_08016014: .4byte 0x000160fc
_08016018: .4byte gActiveBank
_0801601C: .4byte gBattleTextBuff1
_08016020: .4byte gBankAttacker
_08016024: .4byte gSideAffecting
_08016028: .4byte gSideTimer
_0801602C: .4byte 0x0000fffe
_08016030: .4byte gUnknown_081D9030
_08016034:
	ldr r1, _080160CC @ =0x000160fc
	add r1, r12
	ldrb r0, [r1]
	cmp r0, 0x1
	bls _08016040
	b _08016182
_08016040:
	adds r7, r1, 0
	movs r3, 0x2
	mov r10, r3
	movs r0, 0
	mov r8, r0
	ldr r5, _080160D0 @ =gBattleTextBuff1
_0801604C:
	ldr r0, _080160D4 @ =gBankAttacker
	ldrb r4, [r7]
	strb r4, [r0]
	ldr r1, _080160D8 @ =gActiveBank
	strb r4, [r1]
	ldr r0, _080160DC @ =gSideAffecting
	lsls r2, r4, 1
	adds r3, r2, r0
	ldrh r1, [r3]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080160B0
	ldr r0, _080160E0 @ =gSideTimer
	adds r1, r2, r4
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	subs r0, 0x1
	strb r0, [r1, 0x1]
	movs r6, 0xFF
	lsls r0, 24
	cmp r0, 0
	bne _080160B0
	ldrh r0, [r3]
	ldr r2, _080160E4 @ =0x0000fffd
	adds r1, r2, 0
	ands r0, r1
	strh r0, [r3]
	ldr r0, _080160E8 @ =gUnknown_081D9030
	bl b_call_bc_move_exec
	ldr r0, _080160EC @ =gBattleCommunication
	strb r4, [r0, 0x5]
	movs r0, 0xFD
	strb r0, [r5]
	mov r3, r10
	strb r3, [r5, 0x1]
	movs r0, 0x71
	strb r0, [r5, 0x2]
	mov r0, r8
	strb r0, [r5, 0x3]
	ldrb r0, [r5, 0x4]
	orrs r0, r6
	strb r0, [r5, 0x4]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_080160B0:
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
	ldr r1, _080160F0 @ =0x02000000
	mov r12, r1
	mov r2, r9
	cmp r2, 0
	beq _080160C2
	b _08016532
_080160C2:
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0801604C
	b _08016182
	.align 2, 0
_080160CC: .4byte 0x000160fc
_080160D0: .4byte gBattleTextBuff1
_080160D4: .4byte gBankAttacker
_080160D8: .4byte gActiveBank
_080160DC: .4byte gSideAffecting
_080160E0: .4byte gSideTimer
_080160E4: .4byte 0x0000fffd
_080160E8: .4byte gUnknown_081D9030
_080160EC: .4byte gBattleCommunication
_080160F0: .4byte 0x02000000
_080160F4:
	ldr r1, _0801619C @ =0x000160fc
	add r1, r12
	ldrb r0, [r1]
	cmp r0, 0x1
	bhi _08016182
	ldr r0, _080161A0 @ =gActiveBank
	mov r10, r0
	adds r7, r1, 0
	movs r1, 0
	mov r8, r1
	ldr r5, _080161A4 @ =gBattleTextBuff1
_0801610A:
	ldr r0, _080161A8 @ =gBankAttacker
	ldrb r4, [r7]
	strb r4, [r0]
	mov r2, r10
	strb r4, [r2]
	ldr r1, _080161AC @ =gSideTimer
	lsls r3, r4, 1
	adds r0, r3, r4
	lsls r0, 2
	adds r1, r0, r1
	ldrb r0, [r1, 0x2]
	cmp r0, 0
	beq _08016168
	subs r0, 0x1
	strb r0, [r1, 0x2]
	movs r6, 0xFF
	lsls r0, 24
	cmp r0, 0
	bne _08016168
	ldr r2, _080161B0 @ =gSideAffecting
	adds r2, r3, r2
	ldrh r0, [r2]
	ldr r3, _080161B4 @ =0x0000feff
	adds r1, r3, 0
	ands r0, r1
	strh r0, [r2]
	ldr r0, _080161B8 @ =gUnknown_081D9030
	bl b_call_bc_move_exec
	ldr r0, _080161BC @ =gBattleCommunication
	strb r4, [r0, 0x5]
	movs r0, 0xFD
	strb r0, [r5]
	movs r0, 0x2
	strb r0, [r5, 0x1]
	movs r0, 0x36
	strb r0, [r5, 0x2]
	mov r0, r8
	strb r0, [r5, 0x3]
	ldrb r0, [r5, 0x4]
	orrs r0, r6
	strb r0, [r5, 0x4]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08016168:
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
	ldr r1, _080161C0 @ =0x02000000
	mov r12, r1
	mov r2, r9
	cmp r2, 0
	beq _0801617A
	b _08016532
_0801617A:
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0801610A
_08016182:
	mov r3, r9
	cmp r3, 0
	beq _0801618A
	b _08016532
_0801618A:
	ldr r0, _080161C4 @ =0x0001600e
	add r0, r12
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	ldr r0, _0801619C @ =0x000160fc
	add r0, r12
	strb r3, [r0]
	b _0801652A
	.align 2, 0
_0801619C: .4byte 0x000160fc
_080161A0: .4byte gActiveBank
_080161A4: .4byte gBattleTextBuff1
_080161A8: .4byte gBankAttacker
_080161AC: .4byte gSideTimer
_080161B0: .4byte gSideAffecting
_080161B4: .4byte 0x0000feff
_080161B8: .4byte gUnknown_081D9030
_080161BC: .4byte gBattleCommunication
_080161C0: .4byte 0x02000000
_080161C4: .4byte 0x0001600e
_080161C8:
	ldr r1, _08016250 @ =0x000160fc
	add r1, r12
	ldrb r0, [r1]
	cmp r0, 0x1
	bhi _08016236
	ldr r7, _08016254 @ =gActiveBank
	adds r5, r1, 0
	ldr r6, _08016258 @ =gBankAttacker
_080161D8:
	ldrb r4, [r5]
	strb r4, [r6]
	strb r4, [r7]
	ldr r0, _0801625C @ =gSideAffecting
	lsls r2, r4, 1
	adds r3, r2, r0
	ldrh r1, [r3]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0801621C
	ldr r0, _08016260 @ =gSideTimer
	adds r1, r2, r4
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x7]
	subs r0, 0x1
	strb r0, [r1, 0x7]
	lsls r0, 24
	cmp r0, 0
	bne _0801621C
	ldrh r0, [r3]
	ldr r2, _08016264 @ =0x0000ffdf
	adds r1, r2, 0
	ands r0, r1
	strh r0, [r3]
	ldr r0, _08016268 @ =gUnknown_081D9041
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_0801621C:
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	ldr r3, _0801626C @ =0x02000000
	mov r12, r3
	mov r1, r9
	cmp r1, 0
	beq _0801622E
	b _08016532
_0801622E:
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _080161D8
_08016236:
	mov r2, r9
	cmp r2, 0
	beq _0801623E
	b _08016532
_0801623E:
	ldr r0, _08016270 @ =0x0001600e
	add r0, r12
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	ldr r0, _08016250 @ =0x000160fc
	add r0, r12
	strb r2, [r0]
	b _0801652A
	.align 2, 0
_08016250: .4byte 0x000160fc
_08016254: .4byte gActiveBank
_08016258: .4byte gBankAttacker
_0801625C: .4byte gSideAffecting
_08016260: .4byte gSideTimer
_08016264: .4byte 0x0000ffdf
_08016268: .4byte gUnknown_081D9041
_0801626C: .4byte 0x02000000
_08016270: .4byte 0x0001600e
_08016274:
	ldr r2, _080162FC @ =0x000160fc
	add r2, r12
	ldr r1, _08016300 @ =gNoOfAllBanks
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bcs _080162E8
	ldr r5, _08016304 @ =gActiveBank
	adds r4, r2, 0
	ldr r6, _08016308 @ =gUnknown_02024DDC
_08016288:
	ldr r1, _0801630C @ =gTurnOrder
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r5]
	ldrb r0, [r5]
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, 0
	beq _080162CA
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _080162CA
	ldr r1, _08016310 @ =gBattleMons
	ldrb r2, [r5]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _080162CA
	ldr r0, _08016314 @ =gBankTarget
	strb r2, [r0]
	ldr r0, _08016318 @ =gUnknown_081D939A
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_080162CA:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r3, _0801631C @ =0x02000000
	mov r12, r3
	mov r1, r9
	cmp r1, 0
	beq _080162DC
	b _08016532
_080162DC:
	ldr r1, _08016300 @ =gNoOfAllBanks
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08016288
_080162E8:
	mov r2, r9
	cmp r2, 0
	beq _080162F0
	b _08016532
_080162F0:
	ldr r1, _08016320 @ =0x0001600e
	add r1, r12
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0801652A
	.align 2, 0
_080162FC: .4byte 0x000160fc
_08016300: .4byte gNoOfAllBanks
_08016304: .4byte gActiveBank
_08016308: .4byte gUnknown_02024DDC
_0801630C: .4byte gTurnOrder
_08016310: .4byte gBattleMons
_08016314: .4byte gBankTarget
_08016318: .4byte gUnknown_081D939A
_0801631C: .4byte 0x02000000
_08016320: .4byte 0x0001600e
_08016324:
	ldr r3, _0801635C @ =gBattleWeather
	ldrh r2, [r3]
	movs r0, 0x7
	ands r0, r2
	cmp r0, 0
	bne _08016332
	b _080164F8
_08016332:
	movs r0, 0x4
	ands r0, r2
	cmp r0, 0
	bne _0801637E
	ldr r1, _08016360 @ =gWishFutureKnock
	adds r1, 0x28
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _08016370
	ldr r0, _08016364 @ =0x0000fffe
	ands r0, r2
	ldr r1, _08016368 @ =0x0000fffd
	ands r0, r1
	strh r0, [r3]
	ldr r1, _0801636C @ =gBattleCommunication
	movs r0, 0x2
	strb r0, [r1, 0x5]
	b _0801639C
	.align 2, 0
_0801635C: .4byte gBattleWeather
_08016360: .4byte gWishFutureKnock
_08016364: .4byte 0x0000fffe
_08016368: .4byte 0x0000fffd
_0801636C: .4byte gBattleCommunication
_08016370:
	movs r0, 0x2
	ands r0, r2
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _0801638A
	b _08016398
_0801637E:
	movs r0, 0x2
	ands r0, r2
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _08016398
_0801638A:
	ldr r1, _08016394 @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _0801639C
	.align 2, 0
_08016394: .4byte gBattleCommunication
_08016398:
	ldr r0, _080163A0 @ =gBattleCommunication
	strb r1, [r0, 0x5]
_0801639C:
	ldr r0, _080163A4 @ =gUnknown_081D8F62
	b _080164EA
	.align 2, 0
_080163A0: .4byte gBattleCommunication
_080163A4: .4byte gUnknown_081D8F62
_080163A8:
	ldr r3, _080163DC @ =gBattleWeather
	ldrh r2, [r3]
	movs r0, 0x18
	ands r0, r2
	cmp r0, 0
	bne _080163B6
	b _080164F8
_080163B6:
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	bne _080163F0
	ldr r1, _080163E0 @ =gWishFutureKnock
	adds r1, 0x28
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _080163F0
	ldr r0, _080163E4 @ =0x0000fff7
	ands r0, r2
	strh r0, [r3]
	ldr r1, _080163E8 @ =gBattlescriptCurrInstr
	ldr r0, _080163EC @ =gUnknown_081D8FFF
	b _080163F4
	.align 2, 0
_080163DC: .4byte gBattleWeather
_080163E0: .4byte gWishFutureKnock
_080163E4: .4byte 0x0000fff7
_080163E8: .4byte gBattlescriptCurrInstr
_080163EC: .4byte gUnknown_081D8FFF
_080163F0:
	ldr r1, _0801640C @ =gBattlescriptCurrInstr
	ldr r0, _08016410 @ =gUnknown_081D8F7D
_080163F4:
	str r0, [r1]
	adds r3, r1, 0
	ldr r1, _08016414 @ =0x02000000
	ldr r0, _08016418 @ =0x000160a4
	adds r1, r0
	movs r2, 0
	movs r0, 0xC
	strb r0, [r1]
	ldr r0, _0801641C @ =gBattleCommunication
	strb r2, [r0, 0x5]
	b _080164E8
	.align 2, 0
_0801640C: .4byte gBattlescriptCurrInstr
_08016410: .4byte gUnknown_081D8F7D
_08016414: .4byte 0x02000000
_08016418: .4byte 0x000160a4
_0801641C: .4byte gBattleCommunication
_08016420:
	ldr r3, _08016450 @ =gBattleWeather
	ldrh r2, [r3]
	movs r0, 0x60
	ands r0, r2
	cmp r0, 0
	beq _0801647C
	movs r0, 0x40
	ands r0, r2
	cmp r0, 0
	bne _08016464
	ldr r1, _08016454 @ =gWishFutureKnock
	adds r1, 0x28
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _08016464
	ldr r0, _08016458 @ =0x0000ffdf
	ands r0, r2
	strh r0, [r3]
	ldr r1, _0801645C @ =gBattlescriptCurrInstr
	ldr r0, _08016460 @ =gUnknown_081D9016
	b _08016468
	.align 2, 0
_08016450: .4byte gBattleWeather
_08016454: .4byte gWishFutureKnock
_08016458: .4byte 0x0000ffdf
_0801645C: .4byte gBattlescriptCurrInstr
_08016460: .4byte gUnknown_081D9016
_08016464:
	ldr r1, _08016484 @ =gBattlescriptCurrInstr
	ldr r0, _08016488 @ =gUnknown_081D9008
_08016468:
	str r0, [r1]
	adds r3, r1, 0
	ldr r0, [r3]
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_0801647C:
	ldr r2, _0801648C @ =0x02000000
	ldr r0, _08016490 @ =0x0001600e
	adds r1, r2, r0
	b _080164FE
	.align 2, 0
_08016484: .4byte gBattlescriptCurrInstr
_08016488: .4byte gUnknown_081D9008
_0801648C: .4byte 0x02000000
_08016490: .4byte 0x0001600e
_08016494:
	ldr r3, _080164BC @ =gBattleWeather
	ldrh r2, [r3]
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _080164F8
	ldr r1, _080164C0 @ =gWishFutureKnock
	adds r1, 0x28
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _080164D0
	ldr r0, _080164C4 @ =0x0000ff7f
	ands r0, r2
	strh r0, [r3]
	ldr r1, _080164C8 @ =gBattlescriptCurrInstr
	ldr r0, _080164CC @ =gUnknown_081D8FFF
	b _080164D4
	.align 2, 0
_080164BC: .4byte gBattleWeather
_080164C0: .4byte gWishFutureKnock
_080164C4: .4byte 0x0000ff7f
_080164C8: .4byte gBattlescriptCurrInstr
_080164CC: .4byte gUnknown_081D8FFF
_080164D0:
	ldr r1, _08016508 @ =gBattlescriptCurrInstr
	ldr r0, _0801650C @ =gUnknown_081D8F7D
_080164D4:
	str r0, [r1]
	adds r3, r1, 0
	ldr r0, _08016510 @ =0x02000000
	ldr r1, _08016514 @ =0x000160a4
	adds r0, r1
	movs r1, 0xD
	strb r1, [r0]
	ldr r1, _08016518 @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1, 0x5]
_080164E8:
	ldr r0, [r3]
_080164EA:
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_080164F8:
	ldr r2, _08016510 @ =0x02000000
	ldr r3, _0801651C @ =0x0001600e
	adds r1, r2, r3
_080164FE:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r12, r2
	b _0801652A
	.align 2, 0
_08016508: .4byte gBattlescriptCurrInstr
_0801650C: .4byte gUnknown_081D8F7D
_08016510: .4byte 0x02000000
_08016514: .4byte 0x000160a4
_08016518: .4byte gBattleCommunication
_0801651C: .4byte 0x0001600e
_08016520:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_0801652A:
	mov r0, r9
	cmp r0, 0
	bne _08016532
	b _08015E8A
_08016532:
	ldr r0, _08016550 @ =gBattleMainFunc
	ldr r1, [r0]
	ldr r0, _08016554 @ =BattleTurnPassed
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08016550: .4byte gBattleMainFunc
_08016554: .4byte BattleTurnPassed
	thumb_func_end UpdateTurnCounters

	thumb_func_start TurnBasedEffects
TurnBasedEffects: @ 8016558
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r0, 0
	mov r9, r0
	ldr r2, _08016578 @ =gHitMarker
	ldr r0, [r2]
	ldr r1, _0801657C @ =0x01000020
	orrs r0, r1
	str r0, [r2]
	bl _08017088
	.align 2, 0
_08016578: .4byte gHitMarker
_0801657C: .4byte 0x01000020
_08016580:
	ldr r3, _080165B4 @ =gActiveBank
	ldr r4, _080165B8 @ =gBankAttacker
	ldr r1, _080165BC @ =gTurnOrder
	adds r5, r7, r2
	ldrb r0, [r5]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r4]
	strb r0, [r3]
	ldr r0, _080165C0 @ =gAbsentBankFlags
	ldrb r1, [r0]
	ldr r2, _080165C4 @ =gBitTable
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	adds r6, r3, 0
	cmp r1, 0
	beq _080165C8
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	bl _08017088
	.align 2, 0
_080165B4: .4byte gActiveBank
_080165B8: .4byte gBankAttacker
_080165BC: .4byte gTurnOrder
_080165C0: .4byte gAbsentBankFlags
_080165C4: .4byte gBitTable
_080165C8:
	movs r5, 0xB0
	lsls r5, 9
	adds r0, r7, r5
	ldrb r0, [r0]
	cmp r0, 0x13
	bls _080165D8
	bl _08017078
_080165D8:
	lsls r0, 2
	ldr r1, _080165E4 @ =_080165E8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080165E4: .4byte _080165E8
	.align 2, 0
_080165E8:
	.4byte _08016638
	.4byte _080166A8
	.4byte _080166D8
	.4byte _08016730
	.4byte _080167C8
	.4byte _08016828
	.4byte _080168C0
	.4byte _0801691C
	.4byte _0801697C
	.4byte _080169DC
	.4byte _08016B78
	.4byte _08016CA0
	.4byte _08016D58
	.4byte _08016E30
	.4byte _08016EFC
	.4byte _08016F20
	.4byte _08016F6C
	.4byte _08016F9C
	.4byte _08016704
	.4byte _08017064
_08016638:
	ldr r1, _08016694 @ =gStatuses3
	ldrb r3, [r6]
	lsls r0, r3, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 3
	ands r0, r1
	cmp r0, 0
	beq _08016686
	ldr r0, _08016698 @ =gBattleMons
	movs r1, 0x58
	muls r1, r3
	adds r0, r1, r0
	ldrh r2, [r0, 0x28]
	ldrh r7, [r0, 0x2C]
	cmp r2, r7
	beq _08016686
	cmp r2, 0
	beq _08016686
	ldr r1, _0801669C @ =gBattleMoveDamage
	ldrh r0, [r0, 0x2C]
	lsrs r0, 4
	str r0, [r1]
	cmp r0, 0
	bne _08016670
	movs r0, 0x1
	str r0, [r1]
_08016670:
	ldr r0, [r1]
	negs r0, r0
	str r0, [r1]
	ldr r0, _080166A0 @ =gUnknown_081D93D1
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08016686:
	ldr r1, _080166A4 @ =0x02000000
	movs r0, 0xB0
	lsls r0, 9
	adds r1, r0
	bl _08017072
	.align 2, 0
_08016694: .4byte gStatuses3
_08016698: .4byte gBattleMons
_0801669C: .4byte gBattleMoveDamage
_080166A0: .4byte gUnknown_081D93D1
_080166A4: .4byte 0x02000000
_080166A8:
	ldrb r1, [r6]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	beq _080166C8
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_080166C8:
	ldr r1, _080166D4 @ =0x02000000
	movs r2, 0xB0
	lsls r2, 9
	adds r1, r2
	bl _08017072
	.align 2, 0
_080166D4: .4byte 0x02000000
_080166D8:
	ldrb r1, [r6]
	movs r0, 0x1
	movs r2, 0
	bl sub_801A02C
	lsls r0, 24
	cmp r0, 0
	beq _080166F2
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_080166F2:
	ldr r1, _08016700 @ =0x02000000
	movs r3, 0xB0
	lsls r3, 9
	adds r1, r3
	bl _08017072
	.align 2, 0
_08016700: .4byte 0x02000000
_08016704:
	ldrb r1, [r6]
	movs r0, 0x1
	movs r2, 0x1
	bl sub_801A02C
	lsls r0, 24
	cmp r0, 0
	beq _0801671E
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_0801671E:
	ldr r1, _0801672C @ =0x02000000
	movs r5, 0xB0
	lsls r5, 9
	adds r1, r5
	bl _08017072
	.align 2, 0
_0801672C: .4byte 0x02000000
_08016730:
	ldr r0, _080167A8 @ =gStatuses3
	ldrb r2, [r6]
	lsls r1, r2, 2
	adds r1, r0
	ldr r1, [r1]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0801679C
	ldr r3, _080167AC @ =gBattleMons
	movs r5, 0x3
	ands r5, r1
	movs r1, 0x58
	adds r0, r5, 0
	muls r0, r1
	adds r0, r3
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _0801679C
	adds r0, r2, 0
	muls r0, r1
	adds r0, r3
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _0801679C
	ldr r0, _080167B0 @ =gBankTarget
	strb r5, [r0]
	ldr r2, _080167B4 @ =gBattleMoveDamage
	ldrb r0, [r6]
	muls r0, r1
	adds r0, r3
	ldrh r0, [r0, 0x2C]
	lsrs r0, 3
	str r0, [r2]
	cmp r0, 0
	bne _0801677C
	movs r0, 0x1
	str r0, [r2]
_0801677C:
	ldr r1, _080167B8 @ =0x02000000
	ldr r7, _080167BC @ =0x000160a4
	adds r0, r1, r7
	strb r5, [r0]
	ldrb r0, [r4]
	ldr r2, _080167C0 @ =0x000160a5
	adds r1, r2
	strb r0, [r1]
	ldr r0, _080167C4 @ =gUnknown_081D904B
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_0801679C:
	ldr r1, _080167B8 @ =0x02000000
	movs r3, 0xB0
	lsls r3, 9
	adds r1, r3
	bl _08017072
	.align 2, 0
_080167A8: .4byte gStatuses3
_080167AC: .4byte gBattleMons
_080167B0: .4byte gBankTarget
_080167B4: .4byte gBattleMoveDamage
_080167B8: .4byte 0x02000000
_080167BC: .4byte 0x000160a4
_080167C0: .4byte 0x000160a5
_080167C4: .4byte gUnknown_081D904B
_080167C8:
	ldr r2, _08016818 @ =gBattleMons
	ldrb r1, [r6]
	movs r0, 0x58
	adds r3, r1, 0
	muls r3, r0
	adds r0, r2, 0
	adds r0, 0x4C
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0801680A
	adds r1, r3, r2
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	beq _0801680A
	ldr r2, _0801681C @ =gBattleMoveDamage
	ldrh r0, [r1, 0x2C]
	lsrs r0, 3
	str r0, [r2]
	cmp r0, 0
	bne _080167FA
	movs r0, 0x1
	str r0, [r2]
_080167FA:
	ldr r0, _08016820 @ =gUnknown_081D9518
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_0801680A:
	ldr r1, _08016824 @ =0x02000000
	movs r5, 0xB0
	lsls r5, 9
	adds r1, r5
	bl _08017072
	.align 2, 0
_08016818: .4byte gBattleMons
_0801681C: .4byte gBattleMoveDamage
_08016820: .4byte gUnknown_081D9518
_08016824: .4byte 0x02000000
_08016828:
	ldr r4, _080168B0 @ =gBattleMons
	ldrb r0, [r6]
	movs r7, 0x58
	mov r8, r7
	mov r2, r8
	muls r2, r0
	adds r3, r4, 0
	adds r3, 0x4C
	adds r0, r2, r3
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080168A2
	adds r1, r2, r4
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	beq _080168A2
	ldr r5, _080168B4 @ =gBattleMoveDamage
	ldrh r0, [r1, 0x2C]
	lsrs r0, 4
	str r0, [r5]
	cmp r0, 0
	bne _0801685C
	movs r0, 0x1
	str r0, [r5]
_0801685C:
	ldrb r0, [r6]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r2, r0, r3
	ldr r1, [r2]
	movs r4, 0xF0
	lsls r4, 4
	adds r0, r1, 0
	ands r0, r4
	cmp r0, r4
	beq _0801687C
	movs r7, 0x80
	lsls r7, 1
	adds r0, r1, r7
	str r0, [r2]
_0801687C:
	ldrb r0, [r6]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r3
	ldr r0, [r0]
	ands r0, r4
	lsrs r0, 8
	ldr r1, [r5]
	muls r0, r1
	str r0, [r5]
	ldr r0, _080168B8 @ =gUnknown_081D9518
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_080168A2:
	ldr r1, _080168BC @ =0x02000000
	movs r2, 0xB0
	lsls r2, 9
	adds r1, r2
	bl _08017072
	.align 2, 0
_080168B0: .4byte gBattleMons
_080168B4: .4byte gBattleMoveDamage
_080168B8: .4byte gUnknown_081D9518
_080168BC: .4byte 0x02000000
_080168C0:
	ldr r2, _0801690C @ =gBattleMons
	ldrb r1, [r6]
	movs r0, 0x58
	adds r3, r1, 0
	muls r3, r0
	adds r0, r2, 0
	adds r0, 0x4C
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08016902
	adds r1, r3, r2
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	beq _08016902
	ldr r2, _08016910 @ =gBattleMoveDamage
	ldrh r0, [r1, 0x2C]
	lsrs r0, 3
	str r0, [r2]
	cmp r0, 0
	bne _080168F2
	movs r0, 0x1
	str r0, [r2]
_080168F2:
	ldr r0, _08016914 @ =gUnknown_081D953A
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08016902:
	ldr r1, _08016918 @ =0x02000000
	movs r3, 0xB0
	lsls r3, 9
	adds r1, r3
	b _08017072
	.align 2, 0
_0801690C: .4byte gBattleMons
_08016910: .4byte gBattleMoveDamage
_08016914: .4byte gUnknown_081D953A
_08016918: .4byte 0x02000000
_0801691C:
	ldr r2, _0801696C @ =gBattleMons
	ldrb r1, [r6]
	movs r0, 0x58
	adds r3, r1, 0
	muls r3, r0
	adds r0, r2, 0
	adds r0, 0x50
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 20
	ands r0, r1
	cmp r0, 0
	beq _08016960
	adds r1, r3, r2
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	beq _08016960
	ldr r2, _08016970 @ =gBattleMoveDamage
	ldrh r0, [r1, 0x2C]
	lsrs r0, 2
	str r0, [r2]
	cmp r0, 0
	bne _08016950
	movs r0, 0x1
	str r0, [r2]
_08016950:
	ldr r0, _08016974 @ =gUnknown_081D9613
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08016960:
	ldr r1, _08016978 @ =0x02000000
	movs r5, 0xB0
	lsls r5, 9
	adds r1, r5
	b _08017072
	.align 2, 0
_0801696C: .4byte gBattleMons
_08016970: .4byte gBattleMoveDamage
_08016974: .4byte gUnknown_081D9613
_08016978: .4byte 0x02000000
_0801697C:
	ldr r2, _080169CC @ =gBattleMons
	ldrb r1, [r6]
	movs r0, 0x58
	adds r3, r1, 0
	muls r3, r0
	adds r0, r2, 0
	adds r0, 0x50
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 21
	ands r0, r1
	cmp r0, 0
	beq _080169C0
	adds r1, r3, r2
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	beq _080169C0
	ldr r2, _080169D0 @ =gBattleMoveDamage
	ldrh r0, [r1, 0x2C]
	lsrs r0, 2
	str r0, [r2]
	cmp r0, 0
	bne _080169B0
	movs r0, 0x1
	str r0, [r2]
_080169B0:
	ldr r0, _080169D4 @ =gUnknown_081D9624
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_080169C0:
	ldr r1, _080169D8 @ =0x02000000
	movs r7, 0xB0
	lsls r7, 9
	adds r1, r7
	b _08017072
	.align 2, 0
_080169CC: .4byte gBattleMons
_080169D0: .4byte gBattleMoveDamage
_080169D4: .4byte gUnknown_081D9624
_080169D8: .4byte 0x02000000
_080169DC:
	ldr r0, _08016A8C @ =gBattleMons
	mov r8, r0
	ldrb r0, [r6]
	movs r1, 0x58
	mov r10, r1
	mov r1, r10
	muls r1, r0
	mov r5, r8
	adds r5, 0x50
	adds r3, r1, r5
	ldr r2, [r3]
	movs r4, 0xE0
	lsls r4, 8
	adds r0, r2, 0
	ands r0, r4
	cmp r0, 0
	beq _08016AF6
	mov r7, r8
	adds r0, r1, r7
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08016AF6
	ldr r1, _08016A90 @ =0xffffe000
	adds r0, r2, r1
	str r0, [r3]
	ldrb r1, [r6]
	mov r0, r10
	muls r0, r1
	adds r0, r5
	ldr r0, [r0]
	ands r0, r4
	cmp r0, 0
	beq _08016AB4
	ldr r2, _08016A94 @ =0x02000000
	lsls r0, r1, 1
	ldr r4, _08016A98 @ =0x00016004
	adds r0, r4
	adds r0, r2
	ldrb r1, [r0]
	ldr r3, _08016A9C @ =0x000160a4
	adds r0, r2, r3
	strb r1, [r0]
	ldrb r0, [r6]
	lsls r0, 1
	subs r3, 0x9F
	adds r0, r3
	adds r0, r2
	ldrb r1, [r0]
	ldr r5, _08016AA0 @ =0x000160a5
	adds r0, r2, r5
	strb r1, [r0]
	ldr r1, _08016AA4 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	ldrb r0, [r6]
	lsls r0, 1
	adds r0, r4
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1, 0x2]
	ldrb r0, [r6]
	lsls r0, 1
	adds r0, r3
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _08016AA8 @ =gBattlescriptCurrInstr
	ldr r0, _08016AAC @ =gUnknown_081D95E2
	str r0, [r1]
	ldr r2, _08016AB0 @ =gBattleMoveDamage
	ldrb r0, [r6]
	mov r7, r10
	muls r7, r0
	adds r0, r7, 0
	add r0, r8
	ldrh r0, [r0, 0x2C]
	lsrs r0, 4
	str r0, [r2]
	cmp r0, 0
	bne _08016AE6
	movs r0, 0x1
	str r0, [r2]
	b _08016AE6
	.align 2, 0
_08016A8C: .4byte gBattleMons
_08016A90: .4byte 0xffffe000
_08016A94: .4byte 0x02000000
_08016A98: .4byte 0x00016004
_08016A9C: .4byte 0x000160a4
_08016AA0: .4byte 0x000160a5
_08016AA4: .4byte gBattleTextBuff1
_08016AA8: .4byte gBattlescriptCurrInstr
_08016AAC: .4byte gUnknown_081D95E2
_08016AB0: .4byte gBattleMoveDamage
_08016AB4:
	ldr r1, _08016B00 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	ldr r2, _08016B04 @ =0x02000000
	ldrb r0, [r6]
	lsls r0, 1
	ldr r3, _08016B08 @ =0x00016004
	adds r0, r3
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1, 0x2]
	ldrb r0, [r6]
	lsls r0, 1
	ldr r5, _08016B0C @ =0x00016005
	adds r0, r5
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _08016B10 @ =gBattlescriptCurrInstr
	ldr r0, _08016B14 @ =gUnknown_081D95F4
	str r0, [r1]
_08016AE6:
	ldr r0, [r1]
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08016AF6:
	ldr r1, _08016B04 @ =0x02000000
	movs r7, 0xB0
	lsls r7, 9
	adds r1, r7
	b _08017072
	.align 2, 0
_08016B00: .4byte gBattleTextBuff1
_08016B04: .4byte 0x02000000
_08016B08: .4byte 0x00016004
_08016B0C: .4byte 0x00016005
_08016B10: .4byte gBattlescriptCurrInstr
_08016B14: .4byte gUnknown_081D95F4
_08016B18:
	movs r0, 0x8
	negs r0, r0
	ands r4, r0
	str r4, [r2]
	ldrb r0, [r6]
	mov r2, r8
	muls r2, r0
	mov r0, r10
	adds r0, 0x50
	adds r2, r0
	ldr r0, [r2]
	ldr r1, _08016B68 @ =0xf7ffffff
	ands r0, r1
	str r0, [r2]
	ldr r1, _08016B6C @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1, 0x5]
	ldr r0, _08016B70 @ =gUnknown_081D950F
	bl b_call_bc_move_exec
	ldr r4, _08016B74 @ =gActiveBank
	ldrb r0, [r6]
	strb r0, [r4]
	ldrb r0, [r4]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	add r0, r9
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl EmitSetAttributes
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	b _08016BE0
	.align 2, 0
_08016B68: .4byte 0xf7ffffff
_08016B6C: .4byte gBattleCommunication
_08016B70: .4byte gUnknown_081D950F
_08016B74: .4byte gActiveBank
_08016B78:
	ldr r2, _08016BF4 @ =gBattleMons
	ldrb r1, [r6]
	movs r0, 0x58
	muls r0, r1
	adds r1, r2, 0
	adds r1, 0x50
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x70
	ands r1, r0
	adds r7, r2, 0
	cmp r1, 0
	beq _08016C82
	movs r0, 0
	strb r0, [r4]
	mov r2, r8
	ldrb r1, [r2]
	cmp r1, 0
	beq _08016BE0
	mov r10, r7
	adds r6, r4, 0
	movs r3, 0x58
	mov r8, r3
	movs r5, 0x4C
	adds r5, r7
	mov r9, r5
	str r1, [sp, 0x4]
	movs r0, 0x7
	mov r12, r0
_08016BB2:
	ldrb r1, [r6]
	mov r3, r8
	muls r3, r1
	mov r5, r9
	adds r2, r3, r5
	ldr r4, [r2]
	adds r0, r4, 0
	mov r5, r12
	ands r0, r5
	cmp r0, 0
	beq _08016BD2
	adds r0, r3, r7
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x2B
	bne _08016B18
_08016BD2:
	adds r0, r1, 0x1
	strb r0, [r6]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [sp, 0x4]
	cmp r0, r1
	bcc _08016BB2
_08016BE0:
	ldr r2, _08016BF8 @ =gBankAttacker
	ldr r1, _08016BFC @ =gNoOfAllBanks
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	beq _08016C00
	movs r2, 0x2
	mov r9, r2
	b _0801707E
	.align 2, 0
_08016BF4: .4byte gBattleMons
_08016BF8: .4byte gBankAttacker
_08016BFC: .4byte gNoOfAllBanks
_08016C00:
	ldr r5, _08016C38 @ =gActiveBank
	ldrb r0, [r5]
	strb r0, [r2]
	ldr r2, _08016C3C @ =gBattleMons
	ldrb r0, [r5]
	movs r7, 0x58
	adds r1, r0, 0
	muls r1, r7
	adds r6, r2, 0
	adds r6, 0x50
	adds r1, r6
	ldr r0, [r1]
	subs r0, 0x10
	str r0, [r1]
	ldrb r0, [r5]
	bl sub_8015660
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _08016C44
	ldrb r0, [r5]
	bl CancelMultiTurnMoves
	ldr r1, _08016C40 @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _08016C78
	.align 2, 0
_08016C38: .4byte gActiveBank
_08016C3C: .4byte gBattleMons
_08016C40: .4byte gBattleCommunication
_08016C44:
	ldrb r3, [r5]
	adds r0, r3, 0
	muls r0, r7
	adds r2, r0, r6
	ldr r0, [r2]
	movs r1, 0x70
	ands r0, r1
	cmp r0, 0
	beq _08016C6C
	ldr r0, _08016C68 @ =gBattleCommunication
	strb r4, [r0, 0x5]
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 5
	orrs r0, r1
	str r0, [r2]
	b _08016C78
	.align 2, 0
_08016C68: .4byte gBattleCommunication
_08016C6C:
	ldr r1, _08016C94 @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1, 0x5]
	adds r0, r3, 0
	bl CancelMultiTurnMoves
_08016C78:
	ldr r0, _08016C98 @ =gUnknown_081D957E
	bl b_call_bc_move_exec
	movs r3, 0x1
	mov r9, r3
_08016C82:
	mov r5, r9
	cmp r5, 0x2
	bne _08016C8A
	b _08017078
_08016C8A:
	ldr r1, _08016C9C @ =0x02000000
	movs r7, 0xB0
	lsls r7, 9
	adds r1, r7
	b _08017072
	.align 2, 0
_08016C94: .4byte gBattleCommunication
_08016C98: .4byte gUnknown_081D957E
_08016C9C: .4byte 0x02000000
_08016CA0:
	ldr r1, _08016CD8 @ =gBattleMons
	ldrb r0, [r6]
	movs r7, 0x58
	muls r0, r7
	adds r5, r1, 0
	adds r5, 0x50
	adds r2, r0, r5
	ldr r1, [r2]
	movs r4, 0xC0
	lsls r4, 4
	adds r0, r1, 0
	ands r0, r4
	cmp r0, 0
	beq _08016D3C
	ldr r3, _08016CDC @ =0xfffffc00
	adds r0, r1, r3
	str r0, [r2]
	ldrb r0, [r6]
	bl sub_8015660
	lsls r0, 24
	cmp r0, 0
	beq _08016CE0
	ldrb r0, [r6]
	bl CancelMultiTurnMoves
	b _08016D3C
	.align 2, 0
_08016CD8: .4byte gBattleMons
_08016CDC: .4byte 0xfffffc00
_08016CE0:
	ldrb r0, [r6]
	muls r0, r7
	adds r2, r0, r5
	ldr r1, [r2]
	adds r0, r1, 0
	ands r0, r4
	cmp r0, 0
	bne _08016D3C
	movs r0, 0x80
	lsls r0, 5
	ands r0, r1
	cmp r0, 0
	beq _08016D3C
	ldr r0, _08016D48 @ =0xffffefff
	ands r1, r0
	str r1, [r2]
	ldrb r0, [r6]
	muls r0, r7
	adds r0, r5
	ldr r0, [r0]
	movs r4, 0x7
	ands r0, r4
	cmp r0, 0
	bne _08016D3C
	ldr r1, _08016D4C @ =gBattleCommunication
	movs r0, 0x47
	strb r0, [r1, 0x3]
	movs r0, 0x1
	movs r1, 0
	bl sub_801E3EC
	ldrb r0, [r6]
	muls r0, r7
	adds r0, r5
	ldr r0, [r0]
	ands r0, r4
	cmp r0, 0
	beq _08016D32
	ldr r0, _08016D50 @ =gUnknown_081D9587
	bl b_call_bc_move_exec
_08016D32:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08016D3C:
	ldr r1, _08016D54 @ =0x02000000
	movs r5, 0xB0
	lsls r5, 9
	adds r1, r5
	b _08017072
	.align 2, 0
_08016D48: .4byte 0xffffefff
_08016D4C: .4byte gBattleCommunication
_08016D50: .4byte gUnknown_081D9587
_08016D54: .4byte 0x02000000
_08016D58:
	ldr r0, _08016DD4 @ =gDisableStructs
	ldrb r3, [r6]
	lsls r1, r3, 3
	subs r1, r3
	lsls r1, 2
	adds r5, r1, r0
	ldrb r1, [r5, 0xB]
	lsls r1, 28
	adds r7, r0, 0
	cmp r1, 0
	beq _08016E1E
	movs r4, 0
	ldr r2, _08016DD8 @ =gBattleMons
	movs r0, 0x58
	adds r1, r3, 0
	muls r1, r0
	adds r2, 0xC
	adds r1, r2
	ldrh r0, [r5, 0x4]
	ldrh r1, [r1]
	cmp r0, r1
	beq _08016DAC
	mov r12, r7
	mov r8, r2
	adds r5, r6, 0
	movs r3, 0x58
_08016D8C:
	adds r4, 0x1
	cmp r4, 0x3
	bgt _08016DAC
	ldrb r2, [r5]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	add r1, r12
	lsls r0, r4, 1
	muls r2, r3
	adds r0, r2
	add r0, r8
	ldrh r1, [r1, 0x4]
	ldrh r0, [r0]
	cmp r1, r0
	bne _08016D8C
_08016DAC:
	cmp r4, 0x4
	bne _08016DDC
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r7
	movs r1, 0
	strh r1, [r0, 0x4]
	ldrb r0, [r6]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r7
	ldrb r2, [r1, 0xB]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0xB]
	b _08016E1E
	.align 2, 0
_08016DD4: .4byte gDisableStructs
_08016DD8: .4byte gBattleMons
_08016DDC:
	ldrb r0, [r6]
	lsls r2, r0, 3
	subs r2, r0
	lsls r2, 2
	adds r2, r7
	ldrb r3, [r2, 0xB]
	lsls r1, r3, 28
	lsrs r1, 28
	subs r1, 0x1
	movs r0, 0xF
	ands r1, r0
	movs r0, 0x10
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0xB]
	adds r2, r1, 0
	cmp r2, 0
	bne _08016E1E
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r7
	strh r2, [r0, 0x4]
	ldr r0, _08016E28 @ =gUnknown_081D9148
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08016E1E:
	ldr r1, _08016E2C @ =0x02000000
	movs r7, 0xB0
	lsls r7, 9
	adds r1, r7
	b _08017072
	.align 2, 0
_08016E28: .4byte gUnknown_081D9148
_08016E2C: .4byte 0x02000000
_08016E30:
	ldr r3, _08016E7C @ =gDisableStructs
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r2, r0, r3
	ldrb r5, [r2, 0xE]
	lsls r4, r5, 28
	cmp r4, 0
	beq _08016EE8
	ldr r0, _08016E80 @ =gBattleMons
	mov r8, r0
	ldrb r0, [r2, 0xC]
	lsls r0, 1
	movs r7, 0x58
	muls r1, r7
	adds r0, r1
	mov r1, r8
	adds r1, 0xC
	adds r0, r1
	ldrh r0, [r0]
	ldrh r1, [r2, 0x6]
	cmp r0, r1
	beq _08016E84
	movs r0, 0
	strh r0, [r2, 0x6]
	ldrb r0, [r6]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r1, 0xE]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0xE]
	b _08016EE8
	.align 2, 0
_08016E7C: .4byte gDisableStructs
_08016E80: .4byte gBattleMons
_08016E84:
	lsrs r1, r4, 28
	subs r1, 0x1
	movs r0, 0xF
	ands r1, r0
	movs r4, 0x10
	negs r4, r4
	adds r0, r4, 0
	ands r0, r5
	orrs r0, r1
	strb r0, [r2, 0xE]
	cmp r1, 0
	beq _08016EB8
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	muls r1, r7
	ldrb r0, [r0, 0xC]
	adds r1, r0
	mov r0, r8
	adds r0, 0x24
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _08016EE8
_08016EB8:
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x6]
	ldrb r0, [r6]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r1, 0xE]
	adds r0, r4, 0
	ands r0, r2
	strb r0, [r1, 0xE]
	ldr r0, _08016EF4 @ =gUnknown_081D914F
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08016EE8:
	ldr r1, _08016EF8 @ =0x02000000
	movs r2, 0xB0
	lsls r2, 9
	adds r1, r2
	b _08017072
	.align 2, 0
_08016EF4: .4byte gUnknown_081D914F
_08016EF8: .4byte 0x02000000
_08016EFC:
	ldr r0, _08016F1C @ =gStatuses3
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0x18
	ands r0, r2
	cmp r0, 0
	beq _08016F14
	adds r0, r2, 0
	subs r0, 0x8
	str r0, [r1]
_08016F14:
	movs r1, 0xB0
	lsls r1, 9
	b _08017070
	.align 2, 0
_08016F1C: .4byte gStatuses3
_08016F20:
	ldr r2, _08016F60 @ =gDisableStructs
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r3, r0, r2
	ldrb r2, [r3, 0x12]
	lsls r1, r2, 28
	cmp r1, 0
	beq _08016F5A
	lsrs r1, 28
	subs r1, 0x1
	movs r0, 0xF
	ands r1, r0
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x12]
	cmp r1, 0
	bne _08016F5A
	ldr r0, _08016F64 @ =gStatuses3
	ldrb r2, [r6]
	lsls r2, 2
	adds r2, r0
	ldr r0, [r2]
	ldr r1, _08016F68 @ =0xfffffdff
	ands r0, r1
	str r0, [r2]
_08016F5A:
	movs r1, 0xB0
	lsls r1, 9
	b _08017070
	.align 2, 0
_08016F60: .4byte gDisableStructs
_08016F64: .4byte gStatuses3
_08016F68: .4byte 0xfffffdff
_08016F6C:
	ldr r2, _08016F98 @ =gDisableStructs
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r3, r0, r2
	ldrb r2, [r3, 0x13]
	lsls r1, r2, 28
	cmp r1, 0
	beq _08016F92
	lsrs r1, 28
	subs r1, 0x1
	movs r0, 0xF
	ands r1, r0
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x13]
_08016F92:
	movs r1, 0xB0
	lsls r1, 9
	b _08017070
	.align 2, 0
_08016F98: .4byte gDisableStructs
_08016F9C:
	ldr r4, _0801704C @ =gStatuses3
	ldrb r0, [r6]
	lsls r0, 2
	adds r2, r0, r4
	ldr r1, [r2]
	movs r3, 0xC0
	lsls r3, 5
	adds r0, r1, 0
	ands r0, r3
	cmp r0, 0
	beq _08017042
	ldr r5, _08017050 @ =0xfffff800
	adds r0, r1, r5
	str r0, [r2]
	ldrb r2, [r6]
	lsls r0, r2, 2
	adds r0, r4
	ldr r0, [r0]
	ands r0, r3
	cmp r0, 0
	bne _08017042
	ldr r3, _08017054 @ =gBattleMons
	movs r5, 0x58
	adds r1, r2, 0
	muls r1, r5
	adds r4, r3, 0
	adds r4, 0x4C
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _08017042
	adds r0, r1, r3
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x48
	beq _08017042
	cmp r0, 0xF
	beq _08017042
	adds r0, r2, 0
	bl sub_8025A44
	lsls r0, 24
	cmp r0, 0
	bne _08017042
	ldrb r0, [r6]
	bl CancelMultiTurnMoves
	bl Random
	ldrb r1, [r6]
	adds r2, r1, 0
	muls r2, r5
	adds r2, r4
	movs r1, 0x3
	ands r1, r0
	adds r1, 0x2
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl EmitSetAttributes
	ldrb r0, [r6]
	bl MarkBufferBankForExecution
	ldr r1, _08017058 @ =gEffectBank
	ldrb r0, [r6]
	strb r0, [r1]
	ldr r0, _0801705C @ =gUnknown_081D964C
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08017042:
	ldr r1, _08017060 @ =0x02000000
	movs r7, 0xB0
	lsls r7, 9
	adds r1, r7
	b _08017072
	.align 2, 0
_0801704C: .4byte gStatuses3
_08017050: .4byte 0xfffff800
_08017054: .4byte gBattleMons
_08017058: .4byte gEffectBank
_0801705C: .4byte gUnknown_081D964C
_08017060: .4byte 0x02000000
_08017064:
	movs r1, 0xB0
	lsls r1, 9
	add r1, r10
	movs r0, 0
	strb r0, [r1]
	ldr r1, _08017084 @ =0x00016001
_08017070:
	add r1, r10
_08017072:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08017078:
	mov r0, r9
	cmp r0, 0
	beq _08017088
_0801707E:
	mov r0, r9
	b _080170B8
	.align 2, 0
_08017084: .4byte 0x00016001
_08017088:
	ldr r7, _080170C8 @ =0x02000000
	ldr r2, _080170CC @ =0x00016001
	adds r0, r7, r2
	ldr r1, _080170D0 @ =gNoOfAllBanks
	ldrb r0, [r0]
	mov r10, r7
	mov r8, r1
	ldrb r1, [r1]
	cmp r0, r1
	bcs _080170AC
	movs r3, 0xB0
	lsls r3, 9
	adds r0, r7, r3
	ldrb r0, [r0]
	cmp r0, 0x13
	bhi _080170AC
	bl _08016580
_080170AC:
	ldr r0, _080170D4 @ =gHitMarker
	ldr r1, [r0]
	ldr r2, _080170D8 @ =0xfeffffdf
	ands r1, r2
	str r1, [r0]
	movs r0, 0
_080170B8:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080170C8: .4byte 0x02000000
_080170CC: .4byte 0x00016001
_080170D0: .4byte gNoOfAllBanks
_080170D4: .4byte gHitMarker
_080170D8: .4byte 0xfeffffdf
	thumb_func_end TurnBasedEffects

	thumb_func_start sub_80170DC
sub_80170DC: @ 80170DC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r2, _08017108 @ =gHitMarker
	ldr r0, [r2]
	ldr r1, _0801710C @ =0x01000020
	orrs r0, r1
	str r0, [r2]
	ldr r1, _08017110 @ =0x02000000
	ldr r3, _08017114 @ =0x00016110
	adds r0, r1, r3
	ldrb r0, [r0]
	mov r8, r1
	cmp r0, 0
	beq _08017118
	cmp r0, 0x1
	bne _08017104
	b _08017258
_08017104:
	b _08017380
	.align 2, 0
_08017108: .4byte gHitMarker
_0801710C: .4byte 0x01000020
_08017110: .4byte 0x02000000
_08017114: .4byte 0x00016110
_08017118:
	ldr r2, _0801715C @ =0x00016111
	add r2, r8
	ldr r0, _08017160 @ =gNoOfAllBanks
	ldrb r1, [r2]
	mov r9, r0
	ldrb r0, [r0]
	cmp r1, r0
	bcc _0801712A
	b _08017248
_0801712A:
	ldr r4, _08017164 @ =gActiveBank
	adds r5, r2, 0
	ldr r1, _08017168 @ =gWishFutureKnock
	mov r12, r1
	movs r2, 0x8
	add r2, r12
	mov r10, r2
	mov r7, r12
	adds r7, 0x18
	ldr r6, _0801716C @ =gBattleTextBuff1
_0801713E:
	ldrb r3, [r5]
	strb r3, [r4]
	ldr r0, _08017170 @ =gAbsentBankFlags
	ldrb r1, [r0]
	ldr r2, _08017174 @ =gBitTable
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08017178
	adds r0, r3, 0x1
	strb r0, [r5]
	b _0801723C
	.align 2, 0
_0801715C: .4byte 0x00016111
_08017160: .4byte gNoOfAllBanks
_08017164: .4byte gActiveBank
_08017168: .4byte gWishFutureKnock
_0801716C: .4byte gBattleTextBuff1
_08017170: .4byte gAbsentBankFlags
_08017174: .4byte gBitTable
_08017178:
	adds r0, r3, 0x1
	strb r0, [r5]
	ldr r1, _080171B4 @ =gWishFutureKnock
	ldrb r0, [r4]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	beq _0801723C
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	bne _0801723C
	ldr r1, _080171B8 @ =gBattleMons
	ldrb r2, [r4]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _0801723C
	lsls r0, r2, 1
	adds r0, r7
	ldrh r0, [r0]
	cmp r0, 0xF8
	bne _080171C0
	ldr r0, _080171BC @ =gBattleCommunication
	strb r3, [r0, 0x5]
	b _080171C6
	.align 2, 0
_080171B4: .4byte gWishFutureKnock
_080171B8: .4byte gBattleMons
_080171BC: .4byte gBattleCommunication
_080171C0:
	ldr r1, _08017220 @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1, 0x5]
_080171C6:
	movs r0, 0xFD
	strb r0, [r6]
	movs r0, 0x2
	strb r0, [r6, 0x1]
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	strb r0, [r6, 0x2]
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	lsrs r0, 8
	strb r0, [r6, 0x3]
	movs r0, 0xFF
	strb r0, [r6, 0x4]
	ldr r3, _08017224 @ =gBankTarget
	ldrb r0, [r4]
	strb r0, [r3]
	ldr r1, _08017228 @ =gBankAttacker
	mov r0, r12
	adds r0, 0x4
	ldrb r2, [r4]
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0801722C @ =gBattleMoveDamage
	ldrb r0, [r4]
	lsls r0, 2
	add r0, r10
	ldr r0, [r0]
	str r0, [r1]
	ldr r2, _08017230 @ =gSpecialStatuses
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, 0x4
	adds r0, r2
	ldr r1, _08017234 @ =0x0000ffff
	str r1, [r0]
	ldr r0, _08017238 @ =gUnknown_081D92D7
	b _08017364
	.align 2, 0
_08017220: .4byte gBattleCommunication
_08017224: .4byte gBankTarget
_08017228: .4byte gBankAttacker
_0801722C: .4byte gBattleMoveDamage
_08017230: .4byte gSpecialStatuses
_08017234: .4byte 0x0000ffff
_08017238: .4byte gUnknown_081D92D7
_0801723C:
	ldrb r0, [r5]
	mov r3, r9
	ldrb r3, [r3]
	cmp r0, r3
	bcs _08017248
	b _0801713E
_08017248:
	ldr r1, _0801729C @ =0x00016110
	add r1, r8
	movs r2, 0
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _080172A0 @ =0x00016111
	add r0, r8
	strb r2, [r0]
_08017258:
	ldr r2, _080172A0 @ =0x00016111
	add r2, r8
	ldr r0, _080172A4 @ =gNoOfAllBanks
	ldrb r1, [r2]
	mov r9, r0
	ldrb r0, [r0]
	cmp r1, r0
	bcc _0801726A
	b _08017380
_0801726A:
	ldr r5, _080172A8 @ =gActiveBank
	adds r3, r2, 0
	ldr r4, _080172AC @ =gBattleTextBuff1
	ldr r7, _080172B0 @ =gDisableStructs
_08017272:
	ldr r2, _080172B4 @ =gBankAttacker
	ldr r1, _080172B8 @ =gTurnOrder
	ldrb r0, [r3]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	strb r0, [r5]
	ldr r0, _080172BC @ =gAbsentBankFlags
	ldrb r1, [r0]
	ldr r2, _080172C0 @ =gBitTable
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _080172C4
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	b _08017374
	.align 2, 0
_0801729C: .4byte 0x00016110
_080172A0: .4byte 0x00016111
_080172A4: .4byte gNoOfAllBanks
_080172A8: .4byte gActiveBank
_080172AC: .4byte gBattleTextBuff1
_080172B0: .4byte gDisableStructs
_080172B4: .4byte gBankAttacker
_080172B8: .4byte gTurnOrder
_080172BC: .4byte gAbsentBankFlags
_080172C0: .4byte gBitTable
_080172C4:
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	ldr r6, _08017334 @ =gStatuses3
	ldrb r2, [r5]
	lsls r0, r2, 2
	adds r0, r6
	ldr r0, [r0]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08017374
	movs r0, 0xFD
	strb r0, [r4]
	movs r0, 0x1
	strb r0, [r4, 0x1]
	strb r0, [r4, 0x2]
	strb r0, [r4, 0x3]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r7
	ldrb r0, [r0, 0xF]
	lsls r0, 28
	lsrs r0, 28
	strb r0, [r4, 0x4]
	movs r0, 0xFF
	strb r0, [r4, 0x5]
	ldrb r2, [r5]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r4, r0, r7
	ldrb r3, [r4, 0xF]
	lsls r1, r3, 28
	cmp r1, 0
	bne _08017348
	lsls r2, 2
	adds r2, r6
	ldr r0, [r2]
	movs r1, 0x21
	negs r1, r1
	ands r0, r1
	str r0, [r2]
	ldr r3, _08017338 @ =gBattleMoveDamage
	ldr r2, _0801733C @ =gBattleMons
	ldrb r1, [r5]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0, 0x28]
	str r0, [r3]
	ldr r1, _08017340 @ =gBattlescriptCurrInstr
	ldr r0, _08017344 @ =gUnknown_081D9202
	b _08017360
	.align 2, 0
_08017334: .4byte gStatuses3
_08017338: .4byte gBattleMoveDamage
_0801733C: .4byte gBattleMons
_08017340: .4byte gBattlescriptCurrInstr
_08017344: .4byte gUnknown_081D9202
_08017348:
	lsrs r1, 28
	subs r1, 0x1
	movs r0, 0xF
	ands r1, r0
	movs r2, 0x10
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	orrs r0, r1
	strb r0, [r4, 0xF]
	ldr r1, _0801736C @ =gBattlescriptCurrInstr
	ldr r0, _08017370 @ =gUnknown_081D921D
_08017360:
	str r0, [r1]
	ldr r0, [r1]
_08017364:
	bl b_call_bc_move_exec
	movs r0, 0x1
	b _0801738C
	.align 2, 0
_0801736C: .4byte gBattlescriptCurrInstr
_08017370: .4byte gUnknown_081D921D
_08017374:
	ldrb r0, [r3]
	mov r1, r9
	ldrb r1, [r1]
	cmp r0, r1
	bcs _08017380
	b _08017272
_08017380:
	ldr r2, _0801739C @ =gHitMarker
	ldr r0, [r2]
	ldr r1, _080173A0 @ =0xfeffffdf
	ands r0, r1
	str r0, [r2]
	movs r0, 0
_0801738C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801739C: .4byte gHitMarker
_080173A0: .4byte 0xfeffffdf
	thumb_func_end sub_80170DC

	thumb_func_start sub_80173A4
sub_80173A4: @ 80173A4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r0, _080173C0 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080173F8
	b _080176AC
	.align 2, 0
_080173C0: .4byte gBattleTypeFlags
_080173C4:
	ldr r0, _080173D4 @ =gUnknown_081D8C72
	bl b_call_bc_move_exec
	ldr r1, _080173D8 @ =0x00016059
	add r1, r10
	movs r0, 0x2
	b _080173E8
	.align 2, 0
_080173D4: .4byte gUnknown_081D8C72
_080173D8: .4byte 0x00016059
_080173DC:
	ldr r0, _080173F0 @ =gUnknown_081D8C7B
	bl b_call_bc_move_exec
	ldr r1, _080173F4 @ =0x00016059
	add r1, r8
	movs r0, 0x5
_080173E8:
	strb r0, [r1]
_080173EA:
	movs r0, 0x1
	b _080176AE
	.align 2, 0
_080173F0: .4byte gUnknown_081D8C7B
_080173F4: .4byte 0x00016059
_080173F8:
	ldr r0, _08017414 @ =0x02000000
	mov r9, r0
_080173FC:
	ldr r0, _08017418 @ =0x00016059
	add r0, r9
	ldrb r0, [r0]
	cmp r0, 0x7
	bls _08017408
	b _080176A0
_08017408:
	lsls r0, 2
	ldr r1, _0801741C @ =_08017420
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08017414: .4byte 0x02000000
_08017418: .4byte 0x00016059
_0801741C: .4byte _08017420
	.align 2, 0
_08017420:
	.4byte _08017440
	.4byte _08017490
	.4byte _08017534
	.4byte _0801757C
	.4byte _0801758E
	.4byte _080175FC
	.4byte _08017638
	.4byte _080176A0
_08017440:
	ldr r1, _08017508 @ =0x0001605a
	add r1, r9
	movs r0, 0
	strb r0, [r1]
	ldr r1, _0801750C @ =0x00016059
	add r1, r9
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r5, 0
	ldr r0, _08017510 @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r5, r0
	bge _08017490
	ldr r6, _08017514 @ =gAbsentBankFlags
_0801745E:
	ldrb r0, [r6]
	ldr r2, _08017518 @ =gBitTable
	lsls r1, r5, 2
	adds r1, r2
	ldr r4, [r1]
	ands r0, r4
	cmp r0, 0
	beq _08017486
	lsls r0, r5, 24
	lsrs r0, 24
	movs r1, 0x6
	movs r2, 0x6
	bl sub_8018018
	lsls r0, 24
	cmp r0, 0
	bne _08017486
	ldrb r0, [r6]
	bics r0, r4
	strb r0, [r6]
_08017486:
	adds r5, 0x1
	ldr r0, _08017510 @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r5, r0
	blt _0801745E
_08017490:
	ldr r1, _0801751C @ =0x02000000
	mov r9, r1
	ldr r0, _08017520 @ =gBank1
	mov r12, r0
	ldr r1, _08017524 @ =gBankTarget
	mov r8, r1
	mov r10, r9
	ldr r5, _08017508 @ =0x0001605a
	add r5, r9
	ldr r7, _08017528 @ =gBattleMons
	ldr r6, _0801752C @ =0x00016113
	add r6, r9
_080174A8:
	ldrb r0, [r5]
	mov r1, r8
	strb r0, [r1]
	mov r1, r12
	strb r0, [r1]
	ldrb r3, [r5]
	movs r0, 0x58
	muls r0, r3
	adds r0, r7
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _080174EA
	ldrb r2, [r6]
	ldr r4, _08017518 @ =gBitTable
	ldr r1, _08017530 @ =gBattlePartyID
	lsls r0, r3, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	ands r2, r0
	cmp r2, 0
	bne _080174EA
	ldr r0, _08017514 @ =gAbsentBankFlags
	ldrb r1, [r0]
	lsls r0, r3, 2
	adds r0, r4
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _080174EA
	b _080173C4
_080174EA:
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	ldr r1, _08017510 @ =gNoOfAllBanks
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bne _080174A8
	ldr r1, _0801750C @ =0x00016059
	add r1, r9
	movs r0, 0x3
	strb r0, [r1]
	b _080176A0
	.align 2, 0
_08017508: .4byte 0x0001605a
_0801750C: .4byte 0x00016059
_08017510: .4byte gNoOfAllBanks
_08017514: .4byte gAbsentBankFlags
_08017518: .4byte gBitTable
_0801751C: .4byte 0x02000000
_08017520: .4byte gBank1
_08017524: .4byte gBankTarget
_08017528: .4byte gBattleMons
_0801752C: .4byte 0x00016113
_08017530: .4byte gBattlePartyID
_08017534:
	ldr r0, _0801755C @ =gBank1
	ldrb r0, [r0]
	bl sub_8015740
	ldr r2, _08017560 @ =0x02000000
	ldr r0, _08017564 @ =0x0001605a
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, _08017568 @ =gNoOfAllBanks
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bne _08017570
	ldr r0, _0801756C @ =0x00016059
	adds r1, r2, r0
	movs r0, 0x3
	b _0801769C
	.align 2, 0
_0801755C: .4byte gBank1
_08017560: .4byte 0x02000000
_08017564: .4byte 0x0001605a
_08017568: .4byte gNoOfAllBanks
_0801756C: .4byte 0x00016059
_08017570:
	ldr r0, _08017578 @ =0x00016059
	adds r1, r2, r0
	movs r0, 0x1
	b _0801769C
	.align 2, 0
_08017578: .4byte 0x00016059
_0801757C:
	ldr r1, _080175D8 @ =0x0001605a
	add r1, r9
	movs r0, 0
	strb r0, [r1]
	ldr r1, _080175DC @ =0x00016059
	add r1, r9
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0801758E:
	ldr r7, _080175E0 @ =gBank1
	ldr r6, _080175E4 @ =gBankTarget
	ldr r1, _080175E8 @ =0x02000000
	mov r8, r1
	ldr r3, _080175D8 @ =0x0001605a
	add r3, r8
	ldr r5, _080175EC @ =gBattleMons
	ldr r4, _080175F0 @ =gBitTable
_0801759E:
	ldrb r0, [r3]
	strb r0, [r6]
	strb r0, [r7]
	ldrb r2, [r3]
	movs r0, 0x58
	muls r0, r2
	adds r0, r5
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _080175C4
	ldr r0, _080175F4 @ =gAbsentBankFlags
	ldrb r1, [r0]
	lsls r0, r2, 2
	adds r0, r4
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _080175C4
	b _080173DC
_080175C4:
	adds r0, r2, 0x1
	strb r0, [r3]
	ldr r1, _080175F8 @ =gNoOfAllBanks
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bne _0801759E
	b _08017612
	.align 2, 0
_080175D8: .4byte 0x0001605a
_080175DC: .4byte 0x00016059
_080175E0: .4byte gBank1
_080175E4: .4byte gBankTarget
_080175E8: .4byte 0x02000000
_080175EC: .4byte gBattleMons
_080175F0: .4byte gBitTable
_080175F4: .4byte gAbsentBankFlags
_080175F8: .4byte gNoOfAllBanks
_080175FC:
	ldr r0, _0801761C @ =0x0001605a
	add r0, r9
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	ldr r0, _08017620 @ =gNoOfAllBanks
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r0]
	cmp r1, r0
	bne _08017628
_08017612:
	ldr r1, _08017624 @ =0x00016059
	add r1, r9
	movs r0, 0x6
	strb r0, [r1]
	b _080176A0
	.align 2, 0
_0801761C: .4byte 0x0001605a
_08017620: .4byte gNoOfAllBanks
_08017624: .4byte 0x00016059
_08017628:
	ldr r1, _08017634 @ =0x00016059
	add r1, r9
	movs r0, 0x4
	strb r0, [r1]
	b _080176A0
	.align 2, 0
_08017634: .4byte 0x00016059
_08017638:
	movs r0, 0
	str r0, [sp]
	movs r0, 0x9
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08017652
	b _080173EA
_08017652:
	str r0, [sp]
	movs r0, 0xB
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	beq _08017668
	b _080173EA
_08017668:
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x1
	bl sub_801A02C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0801767C
	b _080173EA
_0801767C:
	str r0, [sp]
	movs r0, 0x6
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	beq _08017692
	b _080173EA
_08017692:
	ldr r2, _080176C0 @ =0x02000000
	ldr r0, _080176C4 @ =0x00016059
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
_0801769C:
	strb r0, [r1]
	mov r9, r2
_080176A0:
	ldr r0, _080176C4 @ =0x00016059
	add r0, r9
	ldrb r0, [r0]
	cmp r0, 0x7
	beq _080176AC
	b _080173FC
_080176AC:
	movs r0, 0
_080176AE:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080176C0: .4byte 0x02000000
_080176C4: .4byte 0x00016059
	thumb_func_end sub_80173A4

	thumb_func_start b_clear_atk_up_if_hit_flag_unless_enraged
b_clear_atk_up_if_hit_flag_unless_enraged: @ 80176C8
	push {r4-r6,lr}
	movs r3, 0
	ldr r0, _08017708 @ =gNoOfAllBanks
	adds r5, r0, 0
	ldrb r0, [r5]
	cmp r3, r0
	bge _08017700
	ldr r4, _0801770C @ =gChosenMovesByBanks
	movs r6, 0x80
	lsls r6, 16
	ldr r2, _08017710 @ =gUnknown_02024AD0
_080176DE:
	ldr r1, [r2]
	adds r0, r1, 0
	ands r0, r6
	cmp r0, 0
	beq _080176F4
	ldrh r0, [r4]
	cmp r0, 0x63
	beq _080176F4
	ldr r0, _08017714 @ =0xff7fffff
	ands r1, r0
	str r1, [r2]
_080176F4:
	adds r4, 0x2
	adds r2, 0x58
	adds r3, 0x1
	ldrb r0, [r5]
	cmp r3, r0
	blt _080176DE
_08017700:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08017708: .4byte gNoOfAllBanks
_0801770C: .4byte gChosenMovesByBanks
_08017710: .4byte gUnknown_02024AD0
_08017714: .4byte 0xff7fffff
	thumb_func_end b_clear_atk_up_if_hit_flag_unless_enraged

	thumb_func_start sub_8017718
sub_8017718: @ 8017718
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
	bl sub_8015D5C
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
	thumb_func_end sub_8017718

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
AbilityBattleEffects:
.syntax divided
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffd8
	ldr	r4, [sp, #0x48]
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	str	r0, [sp, #0x4]
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	mov	sl, r1
	lsl	r2, r2, #0x18
	lsr	r6, r2, #0x18
	lsl	r3, r3, #0x18
	lsr	r3, r3, #0x18
	mov	r8, r3
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	mov	r0, #0x0
	mov	r9, r0
	ldr	r5, ._718
	ldr	r1, ._718 + 4
	ldrb	r0, [r5]
	ldrb	r1, [r1]
	cmp	r0, r1
	bcc	._715	@cond_branch
	mov	r1, sl
	strb	r1, [r5]
._715:
	ldrb	r0, [r5]
	bl	GetBankSide
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	._716	@cond_branch
	ldr	r1, ._718 + 8
	ldrb	r0, [r5]
	lsl	r0, r0, #0x1
	add	r0, r0, r1
	ldrh	r1, [r0]
	mov	r0, #0x64
	mul	r1, r1, r0
	ldr	r0, ._718 + 12
	b	._717
._719:
	.align	2, 0
._718:
	.word	gBankAttacker
	.word	gNoOfAllBanks
	.word	gBattlePartyID
	.word	gPlayerParty
._716:
	ldr	r1, ._723
	ldrb	r0, [r5]
	lsl	r0, r0, #0x1
	add	r0, r0, r1
	ldrh	r1, [r0]
	mov	r0, #0x64
	mul	r1, r1, r0
	ldr	r0, ._723 + 4
._717:
	add	r7, r1, r0
	ldr	r5, ._723 + 8
	ldr	r1, ._723 + 12
	ldrb	r0, [r5]
	ldrb	r1, [r1]
	cmp	r0, r1
	bcc	._720	@cond_branch
	mov	r2, sl
	strb	r2, [r5]
._720:
	ldrb	r0, [r5]
	bl	GetBankSide
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	._721	@cond_branch
	ldr	r1, ._723
	ldrb	r0, [r5]
	lsl	r0, r0, #0x1
	add	r0, r0, r1
	ldrh	r1, [r0]
	mov	r0, #0x64
	mul	r1, r1, r0
	ldr	r0, ._723 + 16
	b	._722
._724:
	.align	2, 0
._723:
	.word	gBattlePartyID
	.word	gEnemyParty
	.word	gBankTarget
	.word	gNoOfAllBanks
	.word	gPlayerParty
._721:
	ldr	r1, ._729
	ldrb	r0, [r5]
	lsl	r0, r0, #0x1
	add	r0, r0, r1
	ldrh	r1, [r0]
	mov	r0, #0x64
	mul	r1, r1, r0
	ldr	r0, ._729 + 4
._722:
	add	r5, r1, r0
	add	r0, r7, #0
	mov	r1, #0xb
	bl	GetMonData
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x8]
	add	r0, r7, #0
	mov	r1, #0x0
	bl	GetMonData
	str	r0, [sp, #0x10]
	add	r0, r5, #0
	mov	r1, #0xb
	bl	GetMonData
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	str	r0, [sp, #0xc]
	add	r0, r5, #0
	mov	r1, #0x0
	bl	GetMonData
	str	r0, [sp, #0x14]
	ldr	r0, ._729 + 8
	ldrh	r1, [r0]
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	beq	._725	@cond_branch
	bl	._1540
._725:
	mov	r3, r8
	cmp	r3, #0
	beq	._727	@cond_branch
	ldr	r0, ._729 + 12
	strb	r3, [r0]
	mov	r8, r0
	b	._728
._730:
	.align	2, 0
._729:
	.word	gBattlePartyID
	.word	gEnemyParty
	.word	gBattleTypeFlags
	.word	gLastUsedAbility
._727:
	ldr	r2, ._733
	ldr	r1, ._733 + 4
	mov	r0, #0x58
	mov	r5, sl
	mul	r5, r5, r0
	add	r0, r5, #0
	add	r0, r0, r1
	add	r0, r0, #0x20
	ldrb	r0, [r0]
	strb	r0, [r2]
	mov	r8, r2
._728:
	cmp	r4, #0
	beq	._731	@cond_branch
	add	r3, r4, #0
	b	._732
._734:
	.align	2, 0
._733:
	.word	gLastUsedAbility
	.word	gBattleMons
._731:
	ldr	r0, ._737
	ldrh	r3, [r0]
._732:
	ldr	r1, ._737 + 4
	ldr	r2, ._737 + 8
	add	r0, r1, r2
	ldrb	r0, [r0]
	add	r7, r1, #0
	cmp	r0, #0
	beq	._735	@cond_branch
	mov	r4, #0x3f
	and	r4, r4, r0
	b	._736
._738:
	.align	2, 0
._737:
	.word	gCurrentMove
	.word	+0x2000000
	.word	0x1601c
._735:
	ldr	r1, ._741
	lsl	r0, r3, #0x1
	add	r0, r0, r3
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldrb	r4, [r0, #0x2]
._736:
	ldr	r5, [sp, #0x4]
	cmp	r5, #0x13
	bls	._739	@cond_branch
	bl	._1534
._739:
	lsl	r0, r5, #0x2
	ldr	r1, ._741 + 4
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
._742:
	.align	2, 0
._741:
	.word	gBattleMoves
	.word	._743
._743:
	.word	._744
	.word	._745
	.word	._746
	.word	._747
	.word	._748
	.word	._749
	.word	._750
	.word	._751
	.word	._752
	.word	._753
	.word	._754
	.word	._755
	.word	._756
	.word	._757
	.word	._758
	.word	._759
	.word	._760
	.word	._761
	.word	._762
	.word	._763
._744:
	ldr	r2, ._774
	ldr	r0, ._774 + 4
	ldrb	r1, [r2]
	add	r5, r0, #0
	ldrb	r0, [r5]
	cmp	r1, r0
	bcc	._764	@cond_branch
	mov	r1, sl
	strb	r1, [r2]
._764:
	mov	r2, r8
	ldrb	r0, [r2]
	cmp	r0, #0x2d
	bne	._765	@cond_branch
	b	._766
._765:
	cmp	r0, #0x2d
	bgt	._767	@cond_branch
	cmp	r0, #0xd
	bne	._768	@cond_branch
	b	._788
._768:
	cmp	r0, #0xd
	bgt	._770	@cond_branch
	cmp	r0, #0x2
	bne	._771	@cond_branch
	b	._772
._771:
	bl	._1534
._775:
	.align	2, 0
._774:
	.word	gBankAttacker
	.word	gNoOfAllBanks
._770:
	cmp	r0, #0x16
	bne	._776	@cond_branch
	b	._777
._776:
	cmp	r0, #0x24
	bne	._778	@cond_branch
	b	._779
._778:
	bl	._1534
._767:
	cmp	r0, #0x46
	bne	._781	@cond_branch
	b	._782
._781:
	cmp	r0, #0x46
	bgt	._783	@cond_branch
	cmp	r0, #0x3b
	bne	._784	@cond_branch
	b	._785
._784:
	bl	._1534
._783:
	cmp	r0, #0x4d
	bne	._787	@cond_branch
	b	._788
._787:
	cmp	r0, #0xff
	beq	._789	@cond_branch
	bl	._1534
._789:
	bl	weather_get_current
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	sub	r0, r0, #0x3
	cmp	r0, #0xa
	bhi	._814	@cond_branch
	lsl	r0, r0, #0x2
	ldr	r1, ._793
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
._794:
	.align	2, 0
._793:
	.word	._792
._792:
	.word	._805
	.word	._814
	.word	._805
	.word	._814
	.word	._814
	.word	._800
	.word	._814
	.word	._814
	.word	._814
	.word	._804
	.word	._805
._805:
	ldr	r2, ._808
	ldrh	r1, [r2]
	mov	r0, #0x7
	and	r0, r0, r1
	cmp	r0, #0
	bne	._814	@cond_branch
	mov	r0, #0x5
	strh	r0, [r2]
	ldr	r0, ._808 + 4
	ldr	r3, ._808 + 8
	add	r2, r0, r3
	mov	r1, #0xa
	b	._811
._809:
	.align	2, 0
._808:
	.word	gBattleWeather
	.word	+0x2000000
	.word	0x160a4
._800:
	ldr	r3, ._812
	ldrh	r1, [r3]
	mov	r2, #0x18
	add	r0, r2, #0
	and	r0, r0, r1
	cmp	r0, #0
	bne	._814	@cond_branch
	strh	r2, [r3]
	ldr	r0, ._812 + 4
	ldr	r3, ._812 + 8
	add	r2, r0, r3
	mov	r1, #0xc
	b	._811
._813:
	.align	2, 0
._812:
	.word	gBattleWeather
	.word	+0x2000000
	.word	0x160a4
._804:
	ldr	r3, ._818
	ldrh	r1, [r3]
	mov	r2, #0x60
	add	r0, r2, #0
	and	r0, r0, r1
	cmp	r0, #0
	bne	._814	@cond_branch
	strh	r2, [r3]
	ldr	r0, ._818 + 4
	ldr	r3, ._818 + 8
	add	r2, r0, r3
	mov	r1, #0xb
._811:
	strb	r1, [r2]
	ldr	r5, ._818 + 12
	add	r0, r0, r5
	mov	r1, sl
	strb	r1, [r0]
	mov	r0, r9
	add	r0, r0, #0x1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r9, r0
._814:
	mov	r2, r9
	cmp	r2, #0
	bne	._815	@cond_branch
	bl	._1540
._815:
	bl	weather_get_current
	ldr	r1, ._818 + 16
	strb	r0, [r1, #0x5]
	ldr	r0, ._818 + 20
	bl	b_push_move_exec
	bl	._1534
._819:
	.align	2, 0
._818:
	.word	gBattleWeather
	.word	+0x2000000
	.word	0x160a4
	.word	0x16003
	.word	gBattleCommunication
	.word	gUnknown_081D901D
._772:
	ldr	r2, ._823
	ldrh	r1, [r2]
	mov	r0, #0x4
	and	r0, r0, r1
	cmp	r0, #0
	beq	._820	@cond_branch
	bl	._1534
._820:
	mov	r0, #0x5
	strh	r0, [r2]
	ldr	r0, ._823 + 4
	bl	b_push_move_exec
	ldr	r0, ._823 + 8
	ldr	r3, ._823 + 12
	add	r0, r0, r3
	mov	r5, sl
	strb	r5, [r0]
	bl	._1392
._824:
	.align	2, 0
._823:
	.word	gBattleWeather
	.word	gUnknown_081D9704
	.word	+0x2000000
	.word	0x16003
._766:
	ldr	r2, ._828
	ldrh	r1, [r2]
	mov	r0, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	._825	@cond_branch
	bl	._1534
._825:
	mov	r0, #0x18
	strh	r0, [r2]
	ldr	r0, ._828 + 4
	bl	b_push_move_exec
	ldr	r0, ._828 + 8
	ldr	r1, ._828 + 12
	add	r0, r0, r1
	mov	r2, sl
	strb	r2, [r0]
	bl	._1392
._829:
	.align	2, 0
._828:
	.word	gBattleWeather
	.word	gUnknown_081D9744
	.word	+0x2000000
	.word	0x16003
._782:
	ldr	r2, ._833
	ldrh	r1, [r2]
	mov	r0, #0x40
	and	r0, r0, r1
	cmp	r0, #0
	beq	._830	@cond_branch
	bl	._1534
._830:
	mov	r0, #0x60
	strh	r0, [r2]
	ldr	r0, ._833 + 4
	bl	b_push_move_exec
	ldr	r0, ._833 + 8
	ldr	r3, ._833 + 12
	add	r0, r0, r3
	mov	r5, sl
	strb	r5, [r0]
	bl	._1392
._834:
	.align	2, 0
._833:
	.word	gBattleWeather
	.word	gUnknown_081D97FE
	.word	+0x2000000
	.word	0x16003
._777:
	ldr	r0, ._838
	mov	r1, sl
	lsl	r2, r1, #0x2
	add	r1, r2, r1
	lsl	r1, r1, #0x2
	add	r3, r1, r0
	ldrb	r0, [r3]
	lsl	r0, r0, #0x1c
	cmp	r0, #0
	bge	._835	@cond_branch
	bl	._1534
._835:
	ldr	r1, ._838 + 4
	add	r1, r2, r1
	ldr	r0, [r1]
	mov	r2, #0x80
	lsl	r2, r2, #0xc
	orr	r0, r0, r2
	str	r0, [r1]
	ldrb	r0, [r3]
	mov	r1, #0x8
	b	._837
._839:
	.align	2, 0
._838:
	.word	gSpecialStatuses
	.word	gStatuses3
._785:
	mov	r0, sl
	bl	castform_switch
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r9, r0
	cmp	r0, #0
	bne	._840	@cond_branch
	bl	._1540
._840:
	ldr	r0, ._843
	bl	b_push_move_exec
	ldr	r0, ._843 + 4
	ldr	r2, ._843 + 8
	add	r1, r0, r2
	mov	r3, sl
	strb	r3, [r1]
	mov	r1, r9
	sub	r1, r1, #0x1
	ldr	r5, ._843 + 12
	add	r0, r0, r5
	strb	r1, [r0]
	bl	._1534
._844:
	.align	2, 0
._843:
	.word	gUnknown_081D977D
	.word	+0x2000000
	.word	0x16003
	.word	0x1609b
._779:
	ldr	r0, ._848
	mov	r1, sl
	lsl	r2, r1, #0x2
	add	r1, r2, r1
	lsl	r1, r1, #0x2
	add	r3, r1, r0
	ldrb	r0, [r3]
	lsl	r0, r0, #0x1b
	cmp	r0, #0
	bge	._845	@cond_branch
	bl	._1534
._845:
	ldr	r1, ._848 + 4
	add	r1, r2, r1
	ldr	r0, [r1]
	mov	r2, #0x80
	lsl	r2, r2, #0xd
	orr	r0, r0, r2
	str	r0, [r1]
	ldrb	r0, [r3]
	mov	r1, #0x10
._837:
	orr	r0, r0, r1
	strb	r0, [r3]
	bl	._1534
._849:
	.align	2, 0
._848:
	.word	gSpecialStatuses
	.word	gStatuses3
._788:
	mov	r6, #0x0
	ldrb	r5, [r5]
	cmp	r6, r5
	bcc	._854	@cond_branch
	bl	._1534
._854:
	add	r0, r6, #0
	bl	castform_switch
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r9, r0
	cmp	r0, #0
	beq	._852	@cond_branch
	bl	._853
._852:
	add	r0, r6, #1
	lsl	r0, r0, #0x18
	lsr	r6, r0, #0x18
	ldr	r0, ._856
	ldrb	r0, [r0]
	cmp	r6, r0
	bcc	._854	@cond_branch
	bl	._1534
._857:
	.align	2, 0
._856:
	.word	gNoOfAllBanks
._745:
	ldr	r2, ._865
	mov	r0, #0x58
	mov	r1, sl
	mul	r1, r1, r0
	add	r4, r1, r2
	ldrh	r0, [r4, #0x28]
	cmp	r0, #0
	bne	._858	@cond_branch
	bl	._1534
._858:
	ldr	r0, ._865 + 4
	mov	r3, sl
	strb	r3, [r0]
	mov	r3, r8
	ldrb	r5, [r3]
	cmp	r5, #0x2c
	beq	._860	@cond_branch
	cmp	r5, #0x2c
	bgt	._861	@cond_branch
	cmp	r5, #0x3
	bne	._862	@cond_branch
	b	._863
._862:
	bl	._1534
._866:
	.align	2, 0
._865:
	.word	gBattleMons
	.word	gBankAttacker
._861:
	cmp	r5, #0x36
	bne	._867	@cond_branch
	b	._868
._867:
	cmp	r5, #0x3d
	beq	._869	@cond_branch
	bl	._1534
._860:
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x13
	mov	r1, #0x0
	mov	r2, #0xd
	mov	r3, #0x0
	bl	AbilityBattleEffects
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0
	beq	._871	@cond_branch
	bl	._1534
._871:
	str	r0, [sp]
	mov	r0, #0x13
	mov	r1, #0x0
	mov	r2, #0x4d
	mov	r3, #0x0
	bl	AbilityBattleEffects
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	._873	@cond_branch
	bl	._1534
._873:
	ldr	r0, ._881
	ldrh	r1, [r0]
	mov	r0, #0x7
	and	r0, r0, r1
	cmp	r0, #0
	bne	._875	@cond_branch
	bl	._1534
._875:
	ldrh	r0, [r4, #0x2c]
	ldrh	r1, [r4, #0x28]
	cmp	r0, r1
	bhi	._877	@cond_branch
	bl	._1534
._877:
	mov	r2, r8
	strb	r5, [r2]
	ldr	r0, ._881 + 4
	bl	b_push_move_exec
	ldr	r1, ._881 + 8
	ldrh	r0, [r4, #0x2c]
	lsr	r0, r0, #0x4
	str	r0, [r1]
	cmp	r0, #0
	bne	._879	@cond_branch
	mov	r0, #0x1
	str	r0, [r1]
._879:
	ldr	r0, [r1]
	neg	r0, r0
	str	r0, [r1]
	bl	._1392
._882:
	.align	2, 0
._881:
	.word	gBattleWeather
	.word	gUnknown_081D9730
	.word	gBattleMoveDamage
._869:
	add	r0, r2, #0
	add	r0, r0, #0x4c
	add	r5, r1, r0
	ldrb	r0, [r5]
	cmp	r0, #0
	bne	._883	@cond_branch
	bl	._1534
._883:
	bl	Random
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r1, #0x3
	bl	gScriptFuncs_End+0x43d0
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	cmp	r4, #0
	beq	._885	@cond_branch
	bl	._1534
._885:
	ldr	r0, [r5]
	mov	r1, #0x88
	and	r0, r0, r1
	cmp	r0, #0
	beq	._887	@cond_branch
	ldr	r0, ._893
	ldr	r1, ._893 + 4
	bl	StringCopy
._887:
	ldr	r0, [r5]
	mov	r1, #0x7
	and	r0, r0, r1
	cmp	r0, #0
	beq	._888	@cond_branch
	ldr	r0, ._893
	ldr	r1, ._893 + 8
	bl	StringCopy
._888:
	ldr	r0, [r5]
	mov	r1, #0x40
	and	r0, r0, r1
	cmp	r0, #0
	beq	._889	@cond_branch
	ldr	r0, ._893
	ldr	r1, ._893 + 12
	bl	StringCopy
._889:
	ldr	r0, [r5]
	mov	r1, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	._890	@cond_branch
	ldr	r0, ._893
	ldr	r1, ._893 + 16
	bl	StringCopy
._890:
	ldr	r0, [r5]
	mov	r1, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	._891	@cond_branch
	ldr	r0, ._893
	ldr	r1, ._893 + 20
	bl	StringCopy
._891:
	str	r4, [r5]
	ldr	r0, ._893 + 24
	ldr	r4, ._893 + 28
	mov	r3, sl
	strb	r3, [r4]
	ldr	r1, ._893 + 32
	add	r0, r0, r1
	strb	r3, [r0]
	ldr	r0, ._893 + 36
	bl	b_push_move_exec
	str	r5, [sp]
	mov	r0, #0x0
	mov	r1, #0x28
	mov	r2, #0x0
	mov	r3, #0x4
	bl	EmitSetAttributes
	ldrb	r0, [r4]
	bl	MarkBufferBankForExecution
	bl	._1392
._894:
	.align	2, 0
._893:
	.word	gBattleTextBuff1
	.word	gStatusConditionString_PoisonJpn
	.word	gStatusConditionString_SleepJpn
	.word	gStatusConditionString_ParalysisJpn
	.word	gStatusConditionString_BurnJpn
	.word	gStatusConditionString_IceJpn
	.word	+0x2000000
	.word	gActiveBank
	.word	0x16003
	.word	gUnknown_081D9758
._863:
	ldrb	r2, [r4, #0x1b]
	mov	r0, #0x1b
	ldsb	r0, [r4, r0]
	cmp	r0, #0xb
	ble	._895	@cond_branch
	bl	._1534
._895:
	ldr	r0, ._900
	mov	r3, sl
	lsl	r1, r3, #0x3
	sub	r1, r1, r3
	lsl	r1, r1, #0x2
	add	r1, r1, r0
	ldrb	r0, [r1, #0x16]
	cmp	r0, #0x2
	bne	._897	@cond_branch
	bl	._1534
._897:
	add	r0, r2, #1
	mov	r2, #0x0
	strb	r0, [r4, #0x1b]
	ldr	r5, ._900 + 4
	add	r1, r7, r5
	mov	r0, #0x11
	strb	r0, [r1]
	ldr	r1, ._900 + 8
	add	r0, r7, r1
	strb	r2, [r0]
	ldr	r0, ._900 + 12
	bl	b_push_move_exec
	ldr	r2, ._900 + 16
	add	r0, r7, r2
	mov	r3, sl
	strb	r3, [r0]
	bl	._1392
._901:
	.align	2, 0
._900:
	.word	gDisableStructs
	.word	0x160a4
	.word	0x160a5
	.word	gUnknown_081D9718
	.word	0x16003
._868:
	ldr	r2, ._903
	ldrb	r0, [r0]
	lsl	r1, r0, #0x3
	sub	r1, r1, r0
	lsl	r1, r1, #0x2
	add	r1, r1, r2
	ldrb	r3, [r1, #0x18]
	lsl	r0, r3, #0x1f
	lsr	r0, r0, #0x1f
	mov	r2, #0x1
	eor	r2, r2, r0
	mov	r0, #0x2
	neg	r0, r0
	and	r0, r0, r3
	orr	r0, r0, r2
	strb	r0, [r1, #0x18]
	bl	._1534
._904:
	.align	2, 0
._903:
	.word	gDisableStructs
._746:
	mov	r5, r8
	ldrb	r0, [r5]
	cmp	r0, #0x2b
	beq	._905	@cond_branch
	bl	._1534
._905:
	mov	r4, #0x0
	ldr	r0, ._917
	ldrh	r2, [r0]
	ldr	r5, ._917 + 4
	add	r1, r0, #0
	cmp	r2, r5
	bne	._907	@cond_branch
	bl	._1534
._907:
	cmp	r2, r3
	beq	._909	@cond_branch
	add	r2, r1, #0
._912:
	add	r2, r2, #0x2
	add	r4, r4, #0x1
	ldrh	r0, [r2]
	cmp	r0, r5
	bne	._910	@cond_branch
	bl	._1534
._910:
	cmp	r0, r3
	bne	._912	@cond_branch
._909:
	lsl	r0, r4, #0x1
	add	r0, r0, r1
	ldrh	r1, [r0]
	ldr	r0, ._917 + 4
	cmp	r1, r0
	bne	._913	@cond_branch
	bl	._1534
._913:
	ldr	r1, ._917 + 8
	ldr	r0, ._917 + 12
	ldrb	r2, [r0]
	mov	r0, #0x58
	mul	r0, r0, r2
	add	r1, r1, #0x50
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	r1, #0x80
	lsl	r1, r1, #0x5
	and	r0, r0, r1
	cmp	r0, #0
	beq	._915	@cond_branch
	ldr	r0, ._917 + 16
	ldr	r1, [r0]
	mov	r2, #0x80
	lsl	r2, r2, #0x4
	orr	r1, r1, r2
	str	r1, [r0]
._915:
	ldr	r1, ._917 + 20
	ldr	r0, ._917 + 24
	str	r0, [r1]
	mov	r0, #0x1
	mov	r9, r0
	bl	._916
._918:
	.align	2, 0
._917:
	.word	gUnknown_081FA724
	.word	0xffff
	.word	gBattleMons
	.word	gBankAttacker
	.word	gHitMarker
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D98F3
._747:
	cmp	r3, #0
	bne	._919	@cond_branch
	bl	._1534
._919:
	mov	r1, r8
	ldrb	r0, [r1]
	cmp	r0, #0xb
	beq	._921	@cond_branch
	cmp	r0, #0xb
	bgt	._922	@cond_branch
	cmp	r0, #0xa
	beq	._923	@cond_branch
	b	._956
._922:
	cmp	r0, #0x12
	beq	._925	@cond_branch
	b	._956
._923:
	cmp	r4, #0xd
	beq	._927	@cond_branch
	b	._956
._927:
	ldr	r0, ._933
	lsl	r1, r3, #0x1
	add	r1, r1, r3
	lsl	r1, r1, #0x2
	add	r1, r1, r0
	ldrb	r0, [r1, #0x1]
	cmp	r0, #0
	bne	._929	@cond_branch
	b	._956
._929:
	ldr	r1, ._933 + 4
	ldr	r0, ._933 + 8
	ldrb	r0, [r0]
	lsl	r0, r0, #0x4
	add	r0, r0, r1
	ldrb	r0, [r0, #0x2]
	lsl	r0, r0, #0x1c
	cmp	r0, #0
	bge	._931	@cond_branch
	ldr	r1, ._933 + 12
	ldr	r0, ._933 + 16
	b	._932
._934:
	.align	2, 0
._933:
	.word	gBattleMoves
	.word	gProtectStructs
	.word	gBankAttacker
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D9843
._931:
	ldr	r1, ._936
	ldr	r0, ._936 + 4
._932:
	str	r0, [r1]
	mov	r2, #0x1
	b	._935
._937:
	.align	2, 0
._936:
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D9842
._921:
	cmp	r4, #0xb
	beq	._938	@cond_branch
	b	._956
._938:
	ldr	r0, ._944
	lsl	r1, r3, #0x1
	add	r1, r1, r3
	lsl	r1, r1, #0x2
	add	r1, r1, r0
	ldrb	r0, [r1, #0x1]
	cmp	r0, #0
	bne	._940	@cond_branch
	b	._956
._940:
	ldr	r1, ._944 + 4
	ldr	r0, ._944 + 8
	ldrb	r0, [r0]
	lsl	r0, r0, #0x4
	add	r0, r0, r1
	ldrb	r0, [r0, #0x2]
	lsl	r0, r0, #0x1c
	cmp	r0, #0
	bge	._942	@cond_branch
	ldr	r1, ._944 + 12
	ldr	r0, ._944 + 16
	b	._943
._945:
	.align	2, 0
._944:
	.word	gBattleMoves
	.word	gProtectStructs
	.word	gBankAttacker
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D9843
._942:
	ldr	r1, ._947
	ldr	r0, ._947 + 4
._943:
	str	r0, [r1]
	mov	r3, #0x1
	mov	r9, r3
	b	._956
._948:
	.align	2, 0
._947:
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D9842
._925:
	cmp	r4, #0xa
	bne	._956	@cond_branch
	ldr	r1, ._954
	mov	r0, #0x58
	mov	r5, sl
	mul	r5, r5, r0
	add	r0, r5, #0
	add	r1, r1, #0x4c
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	r1, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	bne	._956	@cond_branch
	ldr	r2, ._954 + 4
	mov	r0, sl
	lsl	r1, r0, #0x2
	add	r0, r1, r2
	ldr	r3, [r0]
	mov	r4, #0x1
	and	r3, r3, r4
	add	r5, r1, #0
	cmp	r3, #0
	bne	._951	@cond_branch
	ldr	r0, ._954 + 8
	strb	r3, [r0, #0x5]
	ldr	r1, ._954 + 12
	ldr	r0, ._954 + 16
	ldrb	r0, [r0]
	lsl	r0, r0, #0x4
	add	r0, r0, r1
	ldrb	r0, [r0, #0x2]
	lsl	r0, r0, #0x1c
	cmp	r0, #0
	bge	._952	@cond_branch
	ldr	r1, ._954 + 20
	ldr	r0, ._954 + 24
	b	._953
._955:
	.align	2, 0
._954:
	.word	gBattleMons
	.word	+0x2017100
	.word	gBattleCommunication
	.word	gProtectStructs
	.word	gBankAttacker
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D987C
._952:
	ldr	r1, ._957
	ldr	r0, ._957 + 4
._953:
	str	r0, [r1]
	add	r0, r5, r2
	ldr	r1, [r0]
	mov	r2, #0x1
	orr	r1, r1, r2
	str	r1, [r0]
	mov	r1, #0x2
	mov	r9, r1
	b	._956
._958:
	.align	2, 0
._957:
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D987B
._951:
	ldr	r0, ._961
	strb	r4, [r0, #0x5]
	ldr	r1, ._961 + 4
	ldr	r0, ._961 + 8
	ldrb	r0, [r0]
	lsl	r0, r0, #0x4
	add	r0, r0, r1
	ldrb	r0, [r0, #0x2]
	lsl	r0, r0, #0x1c
	cmp	r0, #0
	bge	._959	@cond_branch
	ldr	r1, ._961 + 12
	ldr	r0, ._961 + 16
	b	._960
._962:
	.align	2, 0
._961:
	.word	gBattleCommunication
	.word	gProtectStructs
	.word	gBankAttacker
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D987C
._959:
	ldr	r1, ._968
	ldr	r0, ._968 + 4
._960:
	str	r0, [r1]
	mov	r2, #0x2
._935:
	mov	r9, r2
._956:
	mov	r3, r9
	cmp	r3, #0x1
	beq	._963	@cond_branch
	bl	._1534
._963:
	ldr	r1, ._968 + 8
	mov	r0, #0x58
	mov	r5, sl
	mul	r5, r5, r0
	add	r0, r5, #0
	add	r1, r0, r1
	ldrh	r0, [r1, #0x2c]
	ldrh	r2, [r1, #0x28]
	cmp	r0, r2
	bne	._965	@cond_branch
	ldr	r1, ._968 + 12
	ldr	r0, ._968 + 16
	ldrb	r0, [r0]
	lsl	r0, r0, #0x4
	add	r0, r0, r1
	ldrb	r0, [r0, #0x2]
	lsl	r0, r0, #0x1c
	cmp	r0, #0
	bge	._966	@cond_branch
	ldr	r1, ._968
	ldr	r0, ._968 + 20
	str	r0, [r1]
	bl	._1534
._969:
	.align	2, 0
._968:
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D987B
	.word	gBattleMons
	.word	gProtectStructs
	.word	gBankAttacker
	.word	gUnknown_081D9866
._966:
	ldr	r1, ._971
	ldr	r0, ._971 + 4
	str	r0, [r1]
	bl	._1534
._972:
	.align	2, 0
._971:
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D9865
._965:
	ldr	r2, ._975
	ldrh	r0, [r1, #0x2c]
	lsr	r0, r0, #0x2
	str	r0, [r2]
	cmp	r0, #0
	bne	._973	@cond_branch
	mov	r3, r9
	str	r3, [r2]
._973:
	ldr	r0, [r2]
	neg	r0, r0
	str	r0, [r2]
	bl	._1534
._976:
	.align	2, 0
._975:
	.word	gBattleMoveDamage
._748:
	mov	r5, r8
	ldrb	r0, [r5]
	sub	r0, r0, #0x9
	cmp	r0, #0x2f
	bls	._977	@cond_branch
	bl	._1534
._977:
	lsl	r0, r0, #0x2
	ldr	r1, ._980
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
._981:
	.align	2, 0
._980:
	.word	._979
._979:
	.word	._982
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._989
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._997
	.word	._1534
	.word	._1534
	.word	._1000
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._1011
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._1022
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._1534
	.word	._1029
._989:
	ldr	r0, ._1046
	ldrb	r1, [r0]
	mov	r0, #0x29
	and	r0, r0, r1
	cmp	r0, #0
	beq	._1030	@cond_branch
	bl	._1534
._1030:
	cmp	r3, #0xa5
	bne	._1032	@cond_branch
	bl	._1534
._1032:
	ldr	r0, ._1046 + 4
	lsl	r1, r3, #0x1
	add	r1, r1, r3
	lsl	r1, r1, #0x2
	add	r1, r1, r0
	ldrb	r0, [r1, #0x1]
	cmp	r0, #0
	bne	._1034	@cond_branch
	bl	._1534
._1034:
	ldr	r2, ._1046 + 8
	ldr	r0, ._1046 + 12
	ldrb	r1, [r0]
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r1, r0, #0x2
	add	r0, r2, #0
	add	r0, r0, #0x8
	add	r0, r1, r0
	ldr	r0, [r0]
	cmp	r0, #0
	bne	._1037	@cond_branch
	add	r0, r2, #0
	add	r0, r0, #0xc
	add	r0, r1, r0
	ldr	r0, [r0]
	cmp	r0, #0
	bne	._1037	@cond_branch
	bl	._1534
._1037:
	ldr	r1, ._1046 + 16
	mov	r0, #0x58
	mov	r2, sl
	mul	r2, r2, r0
	add	r0, r2, #0
	add	r1, r0, r1
	add	r3, r1, #0
	add	r3, r3, #0x21
	ldrb	r0, [r3]
	cmp	r0, r4
	bne	._1039	@cond_branch
	bl	._1534
._1039:
	add	r2, r1, #0
	add	r2, r2, #0x22
	ldrb	r0, [r2]
	cmp	r0, r4
	bne	._1041	@cond_branch
	bl	._1534
._1041:
	ldrh	r0, [r1, #0x28]
	cmp	r0, #0
	bne	._1043	@cond_branch
	bl	._1534
._1043:
	strb	r4, [r3]
	strb	r4, [r2]
	ldr	r1, ._1046 + 20
	mov	r0, #0xfd
	strb	r0, [r1]
	mov	r0, #0x3
	strb	r0, [r1, #0x1]
	strb	r4, [r1, #0x2]
	mov	r0, #0xff
	strb	r0, [r1, #0x3]
	bl	b_movescr_stack_push_cursor
	ldr	r1, ._1046 + 24
	ldr	r0, ._1046 + 28
	str	r0, [r1]
	bl	._1392
._1047:
	.align	2, 0
._1046:
	.word	gBattleMoveFlags
	.word	gBattleMoves
	.word	gSpecialStatuses
	.word	gBankTarget
	.word	gBattleMons
	.word	gBattleTextBuff1
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D9921
._997:
	ldr	r0, ._1061
	ldrb	r1, [r0]
	mov	r0, #0x29
	and	r0, r0, r1
	cmp	r0, #0
	beq	._1048	@cond_branch
	bl	._1534
._1048:
	ldr	r1, ._1061 + 4
	ldr	r0, ._1061 + 8
	ldrb	r2, [r0]
	mov	r0, #0x58
	mul	r0, r0, r2
	add	r4, r0, r1
	ldrh	r0, [r4, #0x28]
	cmp	r0, #0
	bne	._1050	@cond_branch
	bl	._1534
._1050:
	ldr	r0, ._1061 + 12
	lsl	r1, r2, #0x4
	add	r1, r1, r0
	ldrb	r0, [r1, #0x1]
	lsl	r0, r0, #0x1f
	cmp	r0, #0
	beq	._1052	@cond_branch
	bl	._1534
._1052:
	ldr	r2, ._1061 + 16
	ldr	r0, ._1061 + 20
	ldrb	r1, [r0]
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r1, r0, #0x2
	add	r0, r2, #0
	add	r0, r0, #0x8
	add	r0, r1, r0
	ldr	r0, [r0]
	cmp	r0, #0
	bne	._1055	@cond_branch
	add	r0, r2, #0
	add	r0, r0, #0xc
	add	r0, r1, r0
	ldr	r0, [r0]
	cmp	r0, #0
	bne	._1055	@cond_branch
	bl	._1534
._1055:
	ldr	r1, ._1061 + 24
	lsl	r0, r3, #0x1
	add	r0, r0, r3
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldrb	r1, [r0, #0x8]
	mov	r2, #0x1
	add	r0, r2, #0
	and	r0, r0, r1
	cmp	r0, #0
	bne	._1057	@cond_branch
	bl	._1534
._1057:
	ldr	r1, ._1061 + 28
	ldrh	r0, [r4, #0x2c]
	lsr	r0, r0, #0x4
	str	r0, [r1]
	cmp	r0, #0
	bne	._1059	@cond_branch
	str	r2, [r1]
._1059:
	bl	b_movescr_stack_push_cursor
	ldr	r1, ._1061 + 32
	ldr	r0, ._1061 + 36
	str	r0, [r1]
	bl	._1392
._1062:
	.align	2, 0
._1061:
	.word	gBattleMoveFlags
	.word	gBattleMons
	.word	gBankAttacker
	.word	gProtectStructs
	.word	gSpecialStatuses
	.word	gBankTarget
	.word	gBattleMoves
	.word	gBattleMoveDamage
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D9928
._1000:
	ldr	r0, ._1078
	ldrb	r1, [r0]
	mov	r0, #0x4
	and	r0, r0, r1
	cmp	r0, #0
	beq	._1063	@cond_branch
	ldr	r0, ._1078 + 4
	ldrb	r1, [r0]
	mov	r0, #0x29
	and	r0, r0, r1
	cmp	r0, #0
	beq	._1064	@cond_branch
	bl	._1534
._1064:
	ldr	r1, ._1078 + 8
	ldr	r0, ._1078 + 12
	ldrb	r2, [r0]
	mov	r0, #0x58
	mul	r0, r0, r2
	add	r0, r0, r1
	ldrh	r0, [r0, #0x28]
	cmp	r0, #0
	bne	._1066	@cond_branch
	bl	._1534
._1066:
	ldr	r0, ._1078 + 16
	lsl	r1, r2, #0x4
	add	r1, r1, r0
	ldrb	r0, [r1, #0x1]
	lsl	r0, r0, #0x1f
	cmp	r0, #0
	beq	._1068	@cond_branch
	bl	._1534
._1068:
	ldr	r2, ._1078 + 20
	ldr	r0, ._1078 + 24
	ldrb	r1, [r0]
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r1, r0, #0x2
	add	r0, r2, #0
	add	r0, r0, #0x8
	add	r0, r1, r0
	ldr	r0, [r0]
	cmp	r0, #0
	bne	._1071	@cond_branch
	add	r0, r2, #0
	add	r0, r0, #0xc
	add	r0, r1, r0
	ldr	r0, [r0]
	cmp	r0, #0
	bne	._1071	@cond_branch
	bl	._1534
._1071:
	ldr	r1, ._1078 + 28
	lsl	r0, r3, #0x1
	add	r0, r0, r3
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldrb	r1, [r0, #0x8]
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	bne	._1073	@cond_branch
	bl	._1534
._1073:
	ldr	r5, ._1078 + 32
	mov	r4, #0x3
._1075:
	bl	Random
	and	r0, r0, r4
	strb	r0, [r5, #0x3]
	cmp	r0, #0
	beq	._1075	@cond_branch
	ldr	r1, ._1078 + 32
	ldrb	r0, [r1, #0x3]
	cmp	r0, #0x3
	bne	._1076	@cond_branch
	add	r0, r0, #0x2
	strb	r0, [r1, #0x3]
._1076:
	ldrb	r0, [r1, #0x3]
	add	r0, r0, #0x40
	strb	r0, [r1, #0x3]
	bl	b_movescr_stack_push_cursor
	ldr	r1, ._1078 + 36
	ldr	r0, ._1078 + 40
	str	r0, [r1]
	ldr	r2, ._1078 + 44
	ldr	r0, [r2]
	mov	r1, #0x80
	lsl	r1, r1, #0x6
	orr	r0, r0, r1
	str	r0, [r2]
	bl	._1392
._1079:
	.align	2, 0
._1078:
	.word	gUnknown_02023A14+0x50
	.word	gBattleMoveFlags
	.word	gBattleMons
	.word	gBankAttacker
	.word	gProtectStructs
	.word	gSpecialStatuses
	.word	gBankTarget
	.word	gBattleMoves
	.word	gBattleCommunication
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D9950
	.word	gHitMarker
._1063:
	ldr	r0, ._1096
	ldrb	r1, [r0]
	mov	r0, #0x29
	and	r0, r0, r1
	cmp	r0, #0
	beq	._1080	@cond_branch
	bl	._1534
._1080:
	ldr	r1, ._1096 + 4
	ldr	r0, ._1096 + 8
	ldrb	r2, [r0]
	mov	r0, #0x58
	mul	r0, r0, r2
	add	r0, r0, r1
	ldrh	r0, [r0, #0x28]
	cmp	r0, #0
	bne	._1082	@cond_branch
	bl	._1534
._1082:
	ldr	r0, ._1096 + 12
	lsl	r1, r2, #0x4
	add	r1, r1, r0
	ldrb	r0, [r1, #0x1]
	lsl	r0, r0, #0x1f
	cmp	r0, #0
	beq	._1084	@cond_branch
	bl	._1534
._1084:
	ldr	r2, ._1096 + 16
	ldr	r0, ._1096 + 20
	ldrb	r1, [r0]
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r1, r0, #0x2
	add	r0, r2, #0
	add	r0, r0, #0x8
	add	r0, r1, r0
	ldr	r0, [r0]
	cmp	r0, #0
	bne	._1087	@cond_branch
	add	r0, r2, #0
	add	r0, r0, #0xc
	add	r0, r1, r0
	ldr	r0, [r0]
	cmp	r0, #0
	bne	._1087	@cond_branch
	bl	._1534
._1087:
	ldr	r1, ._1096 + 24
	lsl	r0, r3, #0x1
	add	r0, r0, r3
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldrb	r1, [r0, #0x8]
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	bne	._1089	@cond_branch
	bl	._1534
._1089:
	bl	Random
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r1, #0xa
	bl	gScriptFuncs_End+0x43d0
	lsl	r0, r0, #0x10
	cmp	r0, #0
	beq	._1091	@cond_branch
	bl	._1534
._1091:
	ldr	r5, ._1096 + 28
	mov	r4, #0x3
._1093:
	bl	Random
	and	r0, r0, r4
	strb	r0, [r5, #0x3]
	cmp	r0, #0
	beq	._1093	@cond_branch
	ldr	r1, ._1096 + 28
	ldrb	r0, [r1, #0x3]
	cmp	r0, #0x3
	bne	._1094	@cond_branch
	add	r0, r0, #0x2
	strb	r0, [r1, #0x3]
._1094:
	ldrb	r0, [r1, #0x3]
	add	r0, r0, #0x40
	strb	r0, [r1, #0x3]
	bl	b_movescr_stack_push_cursor
	ldr	r1, ._1096 + 32
	ldr	r0, ._1096 + 36
	str	r0, [r1]
	ldr	r2, ._1096 + 40
	ldr	r0, [r2]
	mov	r1, #0x80
	lsl	r1, r1, #0x6
	orr	r0, r0, r1
	str	r0, [r2]
	bl	._1392
._1097:
	.align	2, 0
._1096:
	.word	gBattleMoveFlags
	.word	gBattleMons
	.word	gBankAttacker
	.word	gProtectStructs
	.word	gSpecialStatuses
	.word	gBankTarget
	.word	gBattleMoves
	.word	gBattleCommunication
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D9950
	.word	gHitMarker
._1011:
	ldr	r0, ._1111
	ldrb	r1, [r0]
	mov	r0, #0x4
	and	r0, r0, r1
	cmp	r0, #0
	beq	._1098	@cond_branch
	ldr	r0, ._1111 + 4
	ldrb	r1, [r0]
	mov	r0, #0x29
	and	r0, r0, r1
	cmp	r0, #0
	beq	._1099	@cond_branch
	bl	._1534
._1099:
	ldr	r1, ._1111 + 8
	ldr	r0, ._1111 + 12
	ldrb	r2, [r0]
	mov	r0, #0x58
	mul	r0, r0, r2
	add	r0, r0, r1
	ldrh	r0, [r0, #0x28]
	cmp	r0, #0
	bne	._1101	@cond_branch
	bl	._1534
._1101:
	ldr	r0, ._1111 + 16
	lsl	r1, r2, #0x4
	add	r1, r1, r0
	ldrb	r0, [r1, #0x1]
	lsl	r0, r0, #0x1f
	cmp	r0, #0
	beq	._1103	@cond_branch
	bl	._1534
._1103:
	ldr	r2, ._1111 + 20
	ldr	r0, ._1111 + 24
	ldrb	r1, [r0]
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r1, r0, #0x2
	add	r0, r2, #0
	add	r0, r0, #0x8
	add	r0, r1, r0
	ldr	r0, [r0]
	cmp	r0, #0
	bne	._1106	@cond_branch
	add	r0, r2, #0
	add	r0, r0, #0xc
	add	r0, r1, r0
	ldr	r0, [r0]
	cmp	r0, #0
	bne	._1106	@cond_branch
	bl	._1534
._1106:
	ldr	r1, ._1111 + 28
	lsl	r0, r3, #0x1
	add	r0, r0, r3
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldrb	r1, [r0, #0x8]
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	bne	._1108	@cond_branch
	bl	._1534
._1108:
	ldr	r1, ._1111 + 32
	mov	r0, #0x42
	strb	r0, [r1, #0x3]
	bl	b_movescr_stack_push_cursor
	ldr	r1, ._1111 + 36
	ldr	r0, ._1111 + 40
	str	r0, [r1]
	ldr	r2, ._1111 + 44
	ldr	r0, [r2]
	mov	r1, #0x80
	lsl	r1, r1, #0x6
	orr	r0, r0, r1
	str	r0, [r2]
	bl	._1392
._1112:
	.align	2, 0
._1111:
	.word	gUnknown_02023A14+0x50
	.word	gBattleMoveFlags
	.word	gBattleMons
	.word	gBankAttacker
	.word	gProtectStructs
	.word	gSpecialStatuses
	.word	gBankTarget
	.word	gBattleMoves
	.word	gBattleCommunication
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D9950
	.word	gHitMarker
._1098:
	ldr	r0, ._1127
	ldrb	r1, [r0]
	mov	r0, #0x29
	and	r0, r0, r1
	cmp	r0, #0
	beq	._1113	@cond_branch
	bl	._1534
._1113:
	ldr	r1, ._1127 + 4
	ldr	r0, ._1127 + 8
	ldrb	r2, [r0]
	mov	r0, #0x58
	mul	r0, r0, r2
	add	r0, r0, r1
	ldrh	r0, [r0, #0x28]
	cmp	r0, #0
	bne	._1115	@cond_branch
	bl	._1534
._1115:
	ldr	r0, ._1127 + 12
	lsl	r1, r2, #0x4
	add	r1, r1, r0
	ldrb	r0, [r1, #0x1]
	lsl	r0, r0, #0x1f
	cmp	r0, #0
	beq	._1117	@cond_branch
	bl	._1534
._1117:
	ldr	r2, ._1127 + 16
	ldr	r0, ._1127 + 20
	ldrb	r1, [r0]
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r1, r0, #0x2
	add	r0, r2, #0
	add	r0, r0, #0x8
	add	r0, r1, r0
	ldr	r0, [r0]
	cmp	r0, #0
	bne	._1120	@cond_branch
	add	r0, r2, #0
	add	r0, r0, #0xc
	add	r0, r1, r0
	ldr	r0, [r0]
	cmp	r0, #0
	bne	._1120	@cond_branch
	bl	._1534
._1120:
	ldr	r1, ._1127 + 24
	lsl	r0, r3, #0x1
	add	r0, r0, r3
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldrb	r1, [r0, #0x8]
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	bne	._1122	@cond_branch
	bl	._1534
._1122:
	bl	Random
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r1, #0x3
	bl	gScriptFuncs_End+0x43d0
	lsl	r0, r0, #0x10
	cmp	r0, #0
	beq	._1124	@cond_branch
	bl	._1534
._1124:
	ldr	r1, ._1127 + 28
	mov	r0, #0x42
	strb	r0, [r1, #0x3]
	bl	b_movescr_stack_push_cursor
	ldr	r1, ._1127 + 32
	ldr	r0, ._1127 + 36
	str	r0, [r1]
	ldr	r2, ._1127 + 40
	ldr	r0, [r2]
	mov	r1, #0x80
	lsl	r1, r1, #0x6
	orr	r0, r0, r1
	str	r0, [r2]
	bl	._1392
._1128:
	.align	2, 0
._1127:
	.word	gBattleMoveFlags
	.word	gBattleMons
	.word	gBankAttacker
	.word	gProtectStructs
	.word	gSpecialStatuses
	.word	gBankTarget
	.word	gBattleMoves
	.word	gBattleCommunication
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D9950
	.word	gHitMarker
._982:
	ldr	r0, ._1142
	ldrb	r1, [r0]
	mov	r0, #0x4
	and	r0, r0, r1
	cmp	r0, #0
	beq	._1129	@cond_branch
	ldr	r0, ._1142 + 4
	ldrb	r1, [r0]
	mov	r0, #0x29
	and	r0, r0, r1
	cmp	r0, #0
	beq	._1130	@cond_branch
	bl	._1534
._1130:
	ldr	r1, ._1142 + 8
	ldr	r0, ._1142 + 12
	ldrb	r2, [r0]
	mov	r0, #0x58
	mul	r0, r0, r2
	add	r0, r0, r1
	ldrh	r0, [r0, #0x28]
	cmp	r0, #0
	bne	._1132	@cond_branch
	bl	._1534
._1132:
	ldr	r0, ._1142 + 16
	lsl	r1, r2, #0x4
	add	r1, r1, r0
	ldrb	r0, [r1, #0x1]
	lsl	r0, r0, #0x1f
	cmp	r0, #0
	beq	._1134	@cond_branch
	bl	._1534
._1134:
	ldr	r2, ._1142 + 20
	ldr	r0, ._1142 + 24
	ldrb	r1, [r0]
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r1, r0, #0x2
	add	r0, r2, #0
	add	r0, r0, #0x8
	add	r0, r1, r0
	ldr	r0, [r0]
	cmp	r0, #0
	bne	._1137	@cond_branch
	add	r0, r2, #0
	add	r0, r0, #0xc
	add	r0, r1, r0
	ldr	r0, [r0]
	cmp	r0, #0
	bne	._1137	@cond_branch
	bl	._1534
._1137:
	ldr	r1, ._1142 + 28
	lsl	r0, r3, #0x1
	add	r0, r0, r3
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldrb	r1, [r0, #0x8]
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	bne	._1139	@cond_branch
	bl	._1534
._1139:
	ldr	r1, ._1142 + 32
	mov	r0, #0x45
	strb	r0, [r1, #0x3]
	bl	b_movescr_stack_push_cursor
	ldr	r1, ._1142 + 36
	ldr	r0, ._1142 + 40
	str	r0, [r1]
	ldr	r2, ._1142 + 44
	ldr	r0, [r2]
	mov	r1, #0x80
	lsl	r1, r1, #0x6
	orr	r0, r0, r1
	str	r0, [r2]
	bl	._1392
._1143:
	.align	2, 0
._1142:
	.word	gUnknown_02023A14+0x50
	.word	gBattleMoveFlags
	.word	gBattleMons
	.word	gBankAttacker
	.word	gProtectStructs
	.word	gSpecialStatuses
	.word	gBankTarget
	.word	gBattleMoves
	.word	gBattleCommunication
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D9950
	.word	gHitMarker
._1129:
	ldr	r0, ._1158
	ldrb	r1, [r0]
	mov	r0, #0x29
	and	r0, r0, r1
	cmp	r0, #0
	beq	._1144	@cond_branch
	bl	._1534
._1144:
	ldr	r1, ._1158 + 4
	ldr	r0, ._1158 + 8
	ldrb	r2, [r0]
	mov	r0, #0x58
	mul	r0, r0, r2
	add	r0, r0, r1
	ldrh	r0, [r0, #0x28]
	cmp	r0, #0
	bne	._1146	@cond_branch
	bl	._1534
._1146:
	ldr	r0, ._1158 + 12
	lsl	r1, r2, #0x4
	add	r1, r1, r0
	ldrb	r0, [r1, #0x1]
	lsl	r0, r0, #0x1f
	cmp	r0, #0
	beq	._1148	@cond_branch
	bl	._1534
._1148:
	ldr	r2, ._1158 + 16
	ldr	r0, ._1158 + 20
	ldrb	r1, [r0]
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r1, r0, #0x2
	add	r0, r2, #0
	add	r0, r0, #0x8
	add	r0, r1, r0
	ldr	r0, [r0]
	cmp	r0, #0
	bne	._1151	@cond_branch
	add	r0, r2, #0
	add	r0, r0, #0xc
	add	r0, r1, r0
	ldr	r0, [r0]
	cmp	r0, #0
	bne	._1151	@cond_branch
	bl	._1534
._1151:
	ldr	r1, ._1158 + 24
	lsl	r0, r3, #0x1
	add	r0, r0, r3
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldrb	r1, [r0, #0x8]
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	bne	._1153	@cond_branch
	bl	._1534
._1153:
	bl	Random
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r1, #0x3
	bl	gScriptFuncs_End+0x43d0
	lsl	r0, r0, #0x10
	cmp	r0, #0
	beq	._1155	@cond_branch
	bl	._1534
._1155:
	ldr	r1, ._1158 + 28
	mov	r0, #0x45
	strb	r0, [r1, #0x3]
	bl	b_movescr_stack_push_cursor
	ldr	r1, ._1158 + 32
	ldr	r0, ._1158 + 36
	str	r0, [r1]
	ldr	r2, ._1158 + 40
	ldr	r0, [r2]
	mov	r1, #0x80
	lsl	r1, r1, #0x6
	orr	r0, r0, r1
	str	r0, [r2]
	bl	._1392
._1159:
	.align	2, 0
._1158:
	.word	gBattleMoveFlags
	.word	gBattleMons
	.word	gBankAttacker
	.word	gProtectStructs
	.word	gSpecialStatuses
	.word	gBankTarget
	.word	gBattleMoves
	.word	gBattleCommunication
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D9950
	.word	gHitMarker
._1022:
	ldr	r0, ._1173
	ldrb	r1, [r0]
	mov	r0, #0x4
	and	r0, r0, r1
	cmp	r0, #0
	beq	._1160	@cond_branch
	ldr	r0, ._1173 + 4
	ldrb	r1, [r0]
	mov	r0, #0x29
	and	r0, r0, r1
	cmp	r0, #0
	beq	._1161	@cond_branch
	bl	._1534
._1161:
	ldr	r1, ._1173 + 8
	ldr	r0, ._1173 + 12
	ldrb	r2, [r0]
	mov	r0, #0x58
	mul	r0, r0, r2
	add	r0, r0, r1
	ldrh	r0, [r0, #0x28]
	cmp	r0, #0
	bne	._1163	@cond_branch
	bl	._1534
._1163:
	ldr	r0, ._1173 + 16
	lsl	r1, r2, #0x4
	add	r1, r1, r0
	ldrb	r0, [r1, #0x1]
	lsl	r0, r0, #0x1f
	cmp	r0, #0
	beq	._1165	@cond_branch
	bl	._1534
._1165:
	ldr	r1, ._1173 + 20
	lsl	r0, r3, #0x1
	add	r0, r0, r3
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldrb	r1, [r0, #0x8]
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	bne	._1167	@cond_branch
	bl	._1534
._1167:
	ldr	r2, ._1173 + 24
	ldr	r0, ._1173 + 28
	ldrb	r1, [r0]
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r1, r0, #0x2
	add	r0, r2, #0
	add	r0, r0, #0x8
	add	r0, r1, r0
	ldr	r0, [r0]
	cmp	r0, #0
	bne	._1170	@cond_branch
	add	r0, r2, #0
	add	r0, r0, #0xc
	add	r0, r1, r0
	ldr	r0, [r0]
	cmp	r0, #0
	bne	._1170	@cond_branch
	bl	._1534
._1170:
	ldr	r1, ._1173 + 32
	mov	r0, #0x43
	strb	r0, [r1, #0x3]
	bl	b_movescr_stack_push_cursor
	ldr	r1, ._1173 + 36
	ldr	r0, ._1173 + 40
	str	r0, [r1]
	ldr	r2, ._1173 + 44
	ldr	r0, [r2]
	mov	r1, #0x80
	lsl	r1, r1, #0x6
	orr	r0, r0, r1
	str	r0, [r2]
	bl	._1392
._1174:
	.align	2, 0
._1173:
	.word	gUnknown_02023A14+0x50
	.word	gBattleMoveFlags
	.word	gBattleMons
	.word	gBankAttacker
	.word	gProtectStructs
	.word	gBattleMoves
	.word	gSpecialStatuses
	.word	gBankTarget
	.word	gBattleCommunication
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D9950
	.word	gHitMarker
._1160:
	ldr	r0, ._1189
	ldrb	r1, [r0]
	mov	r0, #0x29
	and	r0, r0, r1
	cmp	r0, #0
	beq	._1175	@cond_branch
	bl	._1534
._1175:
	ldr	r1, ._1189 + 4
	ldr	r0, ._1189 + 8
	ldrb	r2, [r0]
	mov	r0, #0x58
	mul	r0, r0, r2
	add	r0, r0, r1
	ldrh	r0, [r0, #0x28]
	cmp	r0, #0
	bne	._1177	@cond_branch
	bl	._1534
._1177:
	ldr	r0, ._1189 + 12
	lsl	r1, r2, #0x4
	add	r1, r1, r0
	ldrb	r0, [r1, #0x1]
	lsl	r0, r0, #0x1f
	cmp	r0, #0
	beq	._1179	@cond_branch
	bl	._1534
._1179:
	ldr	r1, ._1189 + 16
	lsl	r0, r3, #0x1
	add	r0, r0, r3
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldrb	r1, [r0, #0x8]
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	bne	._1181	@cond_branch
	bl	._1534
._1181:
	ldr	r2, ._1189 + 20
	ldr	r0, ._1189 + 24
	ldrb	r1, [r0]
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r1, r0, #0x2
	add	r0, r2, #0
	add	r0, r0, #0x8
	add	r0, r1, r0
	ldr	r0, [r0]
	cmp	r0, #0
	bne	._1184	@cond_branch
	add	r0, r2, #0
	add	r0, r0, #0xc
	add	r0, r1, r0
	ldr	r0, [r0]
	cmp	r0, #0
	bne	._1184	@cond_branch
	bl	._1534
._1184:
	bl	Random
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r1, #0x3
	bl	gScriptFuncs_End+0x43d0
	lsl	r0, r0, #0x10
	cmp	r0, #0
	beq	._1186	@cond_branch
	bl	._1534
._1186:
	ldr	r1, ._1189 + 28
	mov	r0, #0x43
	strb	r0, [r1, #0x3]
	bl	b_movescr_stack_push_cursor
	ldr	r1, ._1189 + 32
	ldr	r0, ._1189 + 36
	str	r0, [r1]
	ldr	r2, ._1189 + 40
	ldr	r0, [r2]
	mov	r1, #0x80
	lsl	r1, r1, #0x6
	orr	r0, r0, r1
	str	r0, [r2]
	bl	._1392
._1190:
	.align	2, 0
._1189:
	.word	gBattleMoveFlags
	.word	gBattleMons
	.word	gBankAttacker
	.word	gProtectStructs
	.word	gBattleMoves
	.word	gSpecialStatuses
	.word	gBankTarget
	.word	gBattleCommunication
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D9950
	.word	gHitMarker
._1029:
	ldr	r0, ._1217
	ldrb	r1, [r0]
	mov	r0, #0x4
	and	r0, r0, r1
	cmp	r0, #0
	bne	._1191	@cond_branch
	b	._1192
._1191:
	ldr	r0, ._1217 + 4
	ldrb	r1, [r0]
	mov	r0, #0x29
	and	r0, r0, r1
	cmp	r0, #0
	beq	._1193	@cond_branch
	bl	._1534
._1193:
	ldr	r5, ._1217 + 8
	ldr	r7, ._1217 + 12
	ldrb	r1, [r7]
	mov	r6, #0x58
	add	r0, r1, #0
	mul	r0, r0, r6
	add	r4, r0, r5
	ldrh	r0, [r4, #0x28]
	cmp	r0, #0
	bne	._1195	@cond_branch
	bl	._1534
._1195:
	ldr	r0, ._1217 + 16
	lsl	r1, r1, #0x4
	add	r1, r1, r0
	ldrb	r0, [r1, #0x1]
	lsl	r0, r0, #0x1f
	cmp	r0, #0
	beq	._1197	@cond_branch
	bl	._1534
._1197:
	ldr	r1, ._1217 + 20
	lsl	r0, r3, #0x1
	add	r0, r0, r3
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldrb	r1, [r0, #0x8]
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	bne	._1199	@cond_branch
	bl	._1534
._1199:
	ldr	r3, ._1217 + 24
	ldr	r0, ._1217 + 28
	mov	r8, r0
	ldrb	r1, [r0]
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r2, r0, #0x2
	add	r0, r3, #0
	add	r0, r0, #0x8
	add	r0, r2, r0
	ldr	r0, [r0]
	cmp	r0, #0
	bne	._1202	@cond_branch
	add	r0, r3, #0
	add	r0, r0, #0xc
	add	r0, r2, r0
	ldr	r0, [r0]
	cmp	r0, #0
	bne	._1202	@cond_branch
	bl	._1534
._1202:
	add	r0, r1, #0
	mul	r0, r0, r6
	add	r0, r0, r5
	ldrh	r0, [r0, #0x28]
	cmp	r0, #0
	bne	._1204	@cond_branch
	bl	._1534
._1204:
	add	r0, r4, #0
	add	r0, r0, #0x20
	ldrb	r0, [r0]
	cmp	r0, #0xc
	bne	._1206	@cond_branch
	bl	._1534
._1206:
	ldr	r0, [sp, #0x8]
	ldr	r1, [sp, #0x10]
	bl	GetGenderFromSpeciesAndPersonality
	add	r4, r0, #0
	ldr	r0, [sp, #0xc]
	ldr	r1, [sp, #0x14]
	bl	GetGenderFromSpeciesAndPersonality
	lsl	r4, r4, #0x18
	lsl	r0, r0, #0x18
	cmp	r4, r0
	bne	._1208	@cond_branch
	bl	._1534
._1208:
	ldrb	r0, [r7]
	mul	r0, r0, r6
	add	r4, r5, #0
	add	r4, r4, #0x50
	add	r0, r0, r4
	ldr	r0, [r0]
	mov	r1, #0xf0
	lsl	r1, r1, #0xc
	and	r0, r0, r1
	cmp	r0, #0
	beq	._1210	@cond_branch
	bl	._1534
._1210:
	ldr	r0, [sp, #0x8]
	ldr	r1, [sp, #0x10]
	bl	GetGenderFromSpeciesAndPersonality
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0xff
	bne	._1212	@cond_branch
	bl	._1534
._1212:
	ldr	r0, [sp, #0xc]
	ldr	r1, [sp, #0x14]
	bl	GetGenderFromSpeciesAndPersonality
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0xff
	bne	._1214	@cond_branch
	bl	._1534
._1214:
	ldrb	r0, [r7]
	add	r2, r0, #0
	mul	r2, r2, r6
	add	r2, r2, r4
	ldr	r1, ._1217 + 32
	mov	r3, r8
	ldrb	r0, [r3]
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldr	r1, [r0]
	lsl	r1, r1, #0x10
	ldr	r0, [r2]
	orr	r0, r0, r1
	str	r0, [r2]
	bl	b_movescr_stack_push_cursor
	ldr	r1, ._1217 + 36
	ldr	r0, ._1217 + 40
	str	r0, [r1]
	bl	._1392
._1218:
	.align	2, 0
._1217:
	.word	gUnknown_02023A14+0x50
	.word	gBattleMoveFlags
	.word	gBattleMons
	.word	gBankAttacker
	.word	gProtectStructs
	.word	gBattleMoves
	.word	gSpecialStatuses
	.word	gBankTarget
	.word	gBitTable
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D9943
._1192:
	ldr	r0, ._1245
	ldrb	r1, [r0]
	mov	r0, #0x29
	and	r0, r0, r1
	cmp	r0, #0
	beq	._1219	@cond_branch
	bl	._1534
._1219:
	ldr	r5, ._1245 + 4
	ldr	r7, ._1245 + 8
	ldrb	r1, [r7]
	mov	r6, #0x58
	add	r0, r1, #0
	mul	r0, r0, r6
	add	r0, r0, r5
	ldrh	r0, [r0, #0x28]
	cmp	r0, #0
	bne	._1221	@cond_branch
	bl	._1534
._1221:
	ldr	r0, ._1245 + 12
	lsl	r1, r1, #0x4
	add	r1, r1, r0
	ldrb	r0, [r1, #0x1]
	lsl	r0, r0, #0x1f
	cmp	r0, #0
	beq	._1223	@cond_branch
	bl	._1534
._1223:
	ldr	r1, ._1245 + 16
	lsl	r0, r3, #0x1
	add	r0, r0, r3
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldrb	r1, [r0, #0x8]
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	bne	._1225	@cond_branch
	bl	._1534
._1225:
	ldr	r3, ._1245 + 20
	ldr	r0, ._1245 + 24
	mov	r8, r0
	ldrb	r1, [r0]
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r2, r0, #0x2
	add	r0, r3, #0
	add	r0, r0, #0x8
	add	r0, r2, r0
	ldr	r0, [r0]
	cmp	r0, #0
	bne	._1228	@cond_branch
	add	r0, r3, #0
	add	r0, r0, #0xc
	add	r0, r2, r0
	ldr	r0, [r0]
	cmp	r0, #0
	bne	._1228	@cond_branch
	bl	._1534
._1228:
	add	r0, r1, #0
	mul	r0, r0, r6
	add	r0, r0, r5
	ldrh	r0, [r0, #0x28]
	cmp	r0, #0
	bne	._1230	@cond_branch
	bl	._1534
._1230:
	bl	Random
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r1, #0x3
	bl	gScriptFuncs_End+0x43d0
	lsl	r0, r0, #0x10
	cmp	r0, #0
	beq	._1232	@cond_branch
	bl	._1534
._1232:
	ldrb	r0, [r7]
	mul	r0, r0, r6
	add	r0, r0, r5
	add	r0, r0, #0x20
	ldrb	r0, [r0]
	cmp	r0, #0xc
	bne	._1234	@cond_branch
	bl	._1534
._1234:
	ldr	r0, [sp, #0x8]
	ldr	r1, [sp, #0x10]
	bl	GetGenderFromSpeciesAndPersonality
	add	r4, r0, #0
	ldr	r0, [sp, #0xc]
	ldr	r1, [sp, #0x14]
	bl	GetGenderFromSpeciesAndPersonality
	lsl	r4, r4, #0x18
	lsl	r0, r0, #0x18
	cmp	r4, r0
	bne	._1236	@cond_branch
	bl	._1534
._1236:
	ldrb	r0, [r7]
	mul	r0, r0, r6
	add	r4, r5, #0
	add	r4, r4, #0x50
	add	r0, r0, r4
	ldr	r0, [r0]
	mov	r1, #0xf0
	lsl	r1, r1, #0xc
	and	r0, r0, r1
	cmp	r0, #0
	beq	._1238	@cond_branch
	bl	._1534
._1238:
	ldr	r0, [sp, #0x8]
	ldr	r1, [sp, #0x10]
	bl	GetGenderFromSpeciesAndPersonality
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0xff
	bne	._1240	@cond_branch
	bl	._1534
._1240:
	ldr	r0, [sp, #0xc]
	ldr	r1, [sp, #0x14]
	bl	GetGenderFromSpeciesAndPersonality
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0xff
	bne	._1242	@cond_branch
	bl	._1534
._1242:
	ldrb	r0, [r7]
	add	r2, r0, #0
	mul	r2, r2, r6
	add	r2, r2, r4
	ldr	r1, ._1245 + 28
	mov	r3, r8
	ldrb	r0, [r3]
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldr	r1, [r0]
	lsl	r1, r1, #0x10
	ldr	r0, [r2]
	orr	r0, r0, r1
	str	r0, [r2]
	bl	b_movescr_stack_push_cursor
	ldr	r1, ._1245 + 32
	ldr	r0, ._1245 + 36
	str	r0, [r1]
	bl	._1392
._1246:
	.align	2, 0
._1245:
	.word	gBattleMoveFlags
	.word	gBattleMons
	.word	gBankAttacker
	.word	gProtectStructs
	.word	gBattleMoves
	.word	gSpecialStatuses
	.word	gBankTarget
	.word	gBitTable
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D9943
._749:
	mov	r5, #0x0
	mov	sl, r5
	ldr	r0, ._1251
	ldrb	r0, [r0]
	cmp	sl, r0
	bcc	._1366	@cond_branch
	bl	._1534
._1366:
	ldr	r1, ._1251 + 4
	mov	r0, #0x58
	mov	r2, sl
	mul	r2, r2, r0
	add	r0, r2, #0
	add	r0, r0, r1
	add	r0, r0, #0x20
	ldrb	r0, [r0]
	sub	r0, r0, #0x7
	add	r2, r1, #0
	cmp	r0, #0x41
	bls	._1249	@cond_branch
	b	._1346
._1249:
	lsl	r0, r0, #0x2
	ldr	r1, ._1251 + 8
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
._1252:
	.align	2, 0
._1251:
	.word	gNoOfAllBanks
	.word	gBattleMons
	.word	._1253
._1253:
	.word	._1254
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1259
	.word	._1346
	.word	._1346
	.word	._1319
	.word	._1346
	.word	._1264
	.word	._1346
	.word	._1346
	.word	._1267
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1287
	.word	._1288
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1346
	.word	._1319
._1264:
	mov	r0, #0x58
	mov	r3, sl
	mul	r3, r3, r0
	add	r0, r3, #0
	add	r1, r2, #0
	add	r1, r1, #0x4c
	add	r0, r0, r1
	ldr	r0, [r0]
	ldr	r1, ._1323
	and	r0, r0, r1
	cmp	r0, #0
	bne	._1320	@cond_branch
	b	._1346
._1320:
	ldr	r0, ._1323 + 4
	ldr	r1, ._1323 + 8
	b	._1331
._1324:
	.align	2, 0
._1323:
	.word	0xf88
	.word	gBattleTextBuff1
	.word	gStatusConditionString_PoisonJpn
._1267:
	mov	r0, #0x58
	mov	r1, sl
	mul	r1, r1, r0
	add	r0, r1, #0
	add	r1, r2, #0
	add	r1, r1, #0x50
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	r1, #0x7
	and	r0, r0, r1
	cmp	r0, #0
	bne	._1325	@cond_branch
	b	._1346
._1325:
	ldr	r0, ._1328
	ldr	r1, ._1328 + 4
	bl	StringCopy
	mov	r2, #0x2
	mov	r9, r2
	b	._1343
._1329:
	.align	2, 0
._1328:
	.word	gBattleTextBuff1
	.word	gStatusConditionString_ConfusionJpn
._1254:
	mov	r0, #0x58
	mov	r3, sl
	mul	r3, r3, r0
	add	r0, r3, #0
	add	r1, r2, #0
	add	r1, r1, #0x4c
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	r1, #0x40
	and	r0, r0, r1
	cmp	r0, #0
	beq	._1346	@cond_branch
	ldr	r0, ._1332
	ldr	r1, ._1332 + 4
	b	._1331
._1333:
	.align	2, 0
._1332:
	.word	gBattleTextBuff1
	.word	gStatusConditionString_ParalysisJpn
._1319:
	mov	r0, #0x58
	mov	r3, sl
	mul	r3, r3, r0
	add	r0, r2, #0
	add	r0, r0, #0x4c
	add	r0, r3, r0
	ldr	r0, [r0]
	mov	r1, #0x7
	and	r0, r0, r1
	cmp	r0, #0
	beq	._1346	@cond_branch
	add	r2, r2, #0x50
	add	r2, r3, r2
	ldr	r0, [r2]
	ldr	r1, ._1336
	and	r0, r0, r1
	str	r0, [r2]
	ldr	r0, ._1336 + 4
	ldr	r1, ._1336 + 8
	bl	StringCopy
	mov	r0, #0x1
	mov	r9, r0
	b	._1343
._1337:
	.align	2, 0
._1336:
	.word	0xf7ffffff
	.word	gBattleTextBuff1
	.word	gStatusConditionString_SleepJpn
._1288:
	mov	r0, #0x58
	mov	r1, sl
	mul	r1, r1, r0
	add	r0, r1, #0
	add	r1, r2, #0
	add	r1, r1, #0x4c
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	r1, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	._1346	@cond_branch
	ldr	r0, ._1340
	ldr	r1, ._1340 + 4
	bl	StringCopy
	mov	r2, #0x1
	mov	r9, r2
	b	._1343
._1341:
	.align	2, 0
._1340:
	.word	gBattleTextBuff1
	.word	gStatusConditionString_BurnJpn
._1287:
	mov	r0, #0x58
	mov	r3, sl
	mul	r3, r3, r0
	add	r0, r3, #0
	add	r1, r2, #0
	add	r1, r1, #0x4c
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	r1, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	._1346	@cond_branch
	ldr	r0, ._1344
	ldr	r1, ._1344 + 4
._1331:
	bl	StringCopy
	mov	r5, #0x1
	mov	r9, r5
	b	._1343
._1345:
	.align	2, 0
._1344:
	.word	gBattleTextBuff1
	.word	gStatusConditionString_IceJpn
._1259:
	mov	r0, #0x58
	mov	r1, sl
	mul	r1, r1, r0
	add	r0, r1, #0
	add	r1, r2, #0
	add	r1, r1, #0x50
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	r1, #0xf0
	lsl	r1, r1, #0xc
	and	r0, r0, r1
	cmp	r0, #0
	beq	._1346	@cond_branch
	ldr	r0, ._1352
	ldr	r1, ._1352 + 4
	bl	StringCopy
	mov	r2, #0x3
	mov	r9, r2
._1346:
	mov	r3, r9
	cmp	r3, #0
	beq	._1347	@cond_branch
._1343:
	mov	r5, r9
	cmp	r5, #0x2
	beq	._1348	@cond_branch
	cmp	r5, #0x2
	bgt	._1349	@cond_branch
	cmp	r5, #0x1
	beq	._1350	@cond_branch
	b	._1355
._1353:
	.align	2, 0
._1352:
	.word	gBattleTextBuff1
	.word	gStatusConditionString_LoveJpn
._1349:
	mov	r0, r9
	cmp	r0, #0x3
	beq	._1354	@cond_branch
	b	._1355
._1350:
	ldr	r1, ._1357
	mov	r0, #0x58
	mov	r2, sl
	mul	r2, r2, r0
	add	r1, r1, #0x4c
	add	r2, r2, r1
	mov	r0, #0x0
	b	._1356
._1358:
	.align	2, 0
._1357:
	.word	gBattleMons
._1348:
	ldr	r1, ._1360
	mov	r0, #0x58
	mov	r2, sl
	mul	r2, r2, r0
	add	r1, r1, #0x50
	add	r2, r2, r1
	ldr	r0, [r2]
	mov	r1, #0x8
	neg	r1, r1
	b	._1359
._1361:
	.align	2, 0
._1360:
	.word	gBattleMons
._1354:
	ldr	r1, ._1363
	mov	r0, #0x58
	mov	r2, sl
	mul	r2, r2, r0
	add	r1, r1, #0x50
	add	r2, r2, r1
	ldr	r0, [r2]
	ldr	r1, ._1363 + 4
._1359:
	and	r0, r0, r1
._1356:
	str	r0, [r2]
._1355:
	bl	b_movescr_stack_push_cursor
	ldr	r1, ._1363 + 8
	ldr	r0, ._1363 + 12
	str	r0, [r1]
	ldr	r0, ._1363 + 16
	ldr	r1, ._1363 + 20
	add	r0, r0, r1
	mov	r2, sl
	strb	r2, [r0]
	ldr	r4, ._1363 + 24
	strb	r2, [r4]
	ldrb	r1, [r4]
	mov	r0, #0x58
	mul	r0, r0, r1
	ldr	r1, ._1363 + 28
	add	r0, r0, r1
	str	r0, [sp]
	mov	r0, #0x0
	mov	r1, #0x28
	mov	r2, #0x0
	mov	r3, #0x4
	bl	EmitSetAttributes
	ldrb	r0, [r4]
	bl	MarkBufferBankForExecution
	bl	._1540
._1364:
	.align	2, 0
._1363:
	.word	gBattleMons
	.word	0xfff0ffff
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D9956
	.word	+0x2000000
	.word	0x16003
	.word	gActiveBank
	.word	gUnknown_02024ACC
._1347:
	mov	r0, sl
	add	r0, r0, #0x1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	sl, r0
	ldr	r0, ._1368
	ldrb	r0, [r0]
	cmp	sl, r0
	bcs	._1365	@cond_branch
	b	._1366
._1365:
	bl	._1534
._1369:
	.align	2, 0
._1368:
	.word	gNoOfAllBanks
._750:
	mov	r3, #0x0
	mov	sl, r3
	ldr	r0, ._1377
	ldrb	r0, [r0]
	cmp	sl, r0
	bcc	._1370	@cond_branch
	b	._1534
._1370:
	ldr	r4, ._1377 + 4
._1375:
	mov	r0, #0x58
	mov	r5, sl
	mul	r5, r5, r0
	add	r0, r5, #0
	add	r0, r0, r4
	add	r0, r0, #0x20
	ldrb	r0, [r0]
	cmp	r0, #0x3b
	bne	._1373	@cond_branch
	mov	r0, sl
	bl	castform_switch
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r9, r0
	cmp	r0, #0
	beq	._1373	@cond_branch
	b	._1374
._1373:
	mov	r0, sl
	add	r0, r0, #0x1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	sl, r0
	ldr	r0, ._1377
	ldrb	r0, [r0]
	cmp	sl, r0
	bcc	._1375	@cond_branch
	b	._1534
._1378:
	.align	2, 0
._1377:
	.word	gNoOfAllBanks
	.word	gBattleMons
._751:
	mov	r1, r8
	ldrb	r0, [r1]
	cmp	r0, #0x1c
	beq	._1379	@cond_branch
	b	._1534
._1379:
	ldr	r4, ._1385
	ldr	r1, [r4]
	mov	r0, #0x80
	lsl	r0, r0, #0x7
	and	r0, r0, r1
	cmp	r0, #0
	bne	._1381	@cond_branch
	b	._1534
._1381:
	ldr	r0, ._1385 + 4
	and	r1, r1, r0
	str	r1, [r4]
	ldr	r3, ._1385 + 8
	add	r2, r7, r3
	ldrb	r1, [r2]
	mov	r0, #0x3f
	and	r0, r0, r1
	strb	r0, [r2]
	cmp	r0, #0x6
	bne	._1383	@cond_branch
	mov	r0, #0x2
	strb	r0, [r2]
._1383:
	ldr	r1, ._1385 + 12
	ldrb	r0, [r2]
	add	r0, r0, #0x40
	strb	r0, [r1, #0x3]
	ldr	r0, ._1385 + 16
	ldrb	r1, [r0]
	ldr	r5, ._1385 + 20
	add	r0, r7, r5
	strb	r1, [r0]
	bl	b_movescr_stack_push_cursor
	ldr	r1, ._1385 + 24
	ldr	r0, ._1385 + 28
	str	r0, [r1]
	ldr	r0, [r4]
	mov	r1, #0x80
	lsl	r1, r1, #0x6
	orr	r0, r0, r1
	str	r0, [r4]
	b	._1392
._1386:
	.align	2, 0
._1385:
	.word	gHitMarker
	.word	0xffffbfff
	.word	0x160ca
	.word	gBattleCommunication
	.word	gBankTarget
	.word	0x16003
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D9953
._752:
	mov	r1, r8
	ldrb	r0, [r1]
	cmp	r0, #0x1c
	beq	._1387	@cond_branch
	b	._1534
._1387:
	ldr	r4, ._1393
	ldr	r1, [r4]
	mov	r0, #0x80
	lsl	r0, r0, #0x7
	and	r0, r0, r1
	cmp	r0, #0
	bne	._1389	@cond_branch
	b	._1534
._1389:
	ldr	r0, ._1393 + 4
	and	r1, r1, r0
	str	r1, [r4]
	ldr	r3, ._1393 + 8
	add	r2, r7, r3
	ldrb	r1, [r2]
	mov	r0, #0x3f
	and	r0, r0, r1
	strb	r0, [r2]
	cmp	r0, #0x6
	bne	._1391	@cond_branch
	mov	r0, #0x2
	strb	r0, [r2]
._1391:
	ldr	r1, ._1393 + 12
	ldrb	r0, [r2]
	strb	r0, [r1, #0x3]
	ldr	r0, ._1393 + 16
	ldrb	r1, [r0]
	ldr	r5, ._1393 + 20
	add	r0, r7, r5
	strb	r1, [r0]
	bl	b_movescr_stack_push_cursor
	ldr	r1, ._1393 + 24
	ldr	r0, ._1393 + 28
	str	r0, [r1]
	ldr	r0, [r4]
	mov	r1, #0x80
	lsl	r1, r1, #0x6
	orr	r0, r0, r1
	str	r0, [r4]
	b	._1392
._1394:
	.align	2, 0
._1393:
	.word	gHitMarker
	.word	0xffffbfff
	.word	0x160ca
	.word	gBattleCommunication
	.word	gBankAttacker
	.word	0x16003
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D9953
._753:
	mov	r4, #0x0
	ldr	r0, ._1402
	ldrb	r1, [r0]
	cmp	r4, r1
	blt	._1395	@cond_branch
	b	._1534
._1395:
	ldr	r0, ._1402 + 4
	add	r5, r1, #0
	ldr	r2, ._1402 + 8
	add	r3, r0, #0
	add	r3, r3, #0x20
	mov	r6, #0x80
	lsl	r6, r6, #0xc
._1400:
	ldrb	r1, [r3]
	cmp	r1, #0x16
	bne	._1398	@cond_branch
	ldr	r0, [r2]
	and	r0, r0, r6
	cmp	r0, #0
	beq	._1398	@cond_branch
	b	._1399
._1398:
	add	r2, r2, #0x4
	add	r3, r3, #0x58
	add	r4, r4, #0x1
	cmp	r4, r5
	blt	._1400	@cond_branch
	b	._1534
._1403:
	.align	2, 0
._1402:
	.word	gNoOfAllBanks
	.word	gBattleMons
	.word	gStatuses3
._755:
	mov	r4, #0x0
	ldr	r0, ._1417
	ldrb	r0, [r0]
	cmp	r4, r0
	blt	._1404	@cond_branch
	b	._1534
._1404:
	ldr	r0, ._1417 + 4
	mov	r8, r0
	ldr	r1, ._1417 + 8
	add	r1, r1, #0x20
	str	r1, [sp, #0x1c]
	mov	r2, #0x0
	str	r2, [sp, #0x20]
._1434:
	ldr	r3, [sp, #0x1c]
	ldrb	r0, [r3]
	cmp	r0, #0x24
	beq	._1406	@cond_branch
	b	._1431
._1406:
	ldr	r0, ._1417 + 12
	ldr	r5, [sp, #0x20]
	add	r0, r5, r0
	ldr	r1, [r0]
	mov	r0, #0x80
	lsl	r0, r0, #0xd
	and	r1, r1, r0
	str	r5, [sp, #0x18]
	cmp	r1, #0
	bne	._1408	@cond_branch
	b	._1431
._1408:
	lsl	r0, r4, #0x18
	lsr	r0, r0, #0x18
	bl	GetBankIdentity
	mov	r1, #0x1
	add	r5, r0, #0
	eor	r5, r5, r1
	and	r5, r5, r1
	add	r0, r5, #0
	bl	GetBankByPlayerAI
	lsl	r0, r0, #0x18
	lsr	r6, r0, #0x18
	add	r0, r5, #2
	bl	GetBankByPlayerAI
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
	ldr	r0, ._1417 + 16
	ldrh	r1, [r0]
	mov	r2, #0x1
	add	r0, r2, #0
	and	r0, r0, r1
	cmp	r0, #0
	bne	._1410	@cond_branch
	b	._1411
._1410:
	mov	r1, #0x58
	add	r0, r6, #0
	mul	r0, r0, r1
	ldr	r3, ._1417 + 8
	add	r1, r0, r3
	add	r0, r1, #0
	add	r0, r0, #0x20
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	._1420	@cond_branch
	ldrh	r0, [r1, #0x28]
	cmp	r0, #0
	beq	._1415	@cond_branch
	mov	r1, #0x58
	add	r0, r7, #0
	mul	r0, r0, r1
	add	r1, r0, r3
	add	r0, r1, #0
	add	r0, r0, #0x20
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	._1415	@cond_branch
	ldrh	r0, [r1, #0x28]
	cmp	r0, #0
	beq	._1415	@cond_branch
	str	r2, [sp, #0x24]
	bl	Random
	ldr	r2, [sp, #0x24]
	add	r1, r2, #0
	and	r1, r1, r0
	lsl	r1, r1, #0x1
	orr	r5, r5, r1
	add	r0, r5, #0
	bl	GetBankByPlayerAI
	mov	r2, r8
	strb	r0, [r2]
	ldrb	r0, [r2]
	mov	r3, #0x58
	mul	r0, r0, r3
	ldr	r5, ._1417 + 8
	add	r0, r0, r5
	add	r0, r0, #0x20
	ldrb	r0, [r0]
	ldr	r1, [sp, #0x1c]
	strb	r0, [r1]
	ldrb	r0, [r2]
	mul	r0, r0, r3
	add	r0, r0, r5
	add	r0, r0, #0x20
	ldrb	r0, [r0]
	ldr	r2, ._1417 + 20
	strb	r0, [r2]
	b	._1416
._1418:
	.align	2, 0
._1417:
	.word	gNoOfAllBanks
	.word	gActiveBank
	.word	gBattleMons
	.word	gStatuses3
	.word	gBattleTypeFlags
	.word	gLastUsedAbility
._1415:
	ldr	r3, ._1422
	mov	r2, #0x58
	add	r0, r6, #0
	mul	r0, r0, r2
	add	r1, r0, r3
	add	r0, r1, #0
	add	r0, r0, #0x20
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	._1420	@cond_branch
	ldrh	r0, [r1, #0x28]
	cmp	r0, #0
	beq	._1420	@cond_branch
	mov	r5, r8
	strb	r6, [r5]
	add	r1, r4, #0
	mul	r1, r1, r2
	add	r1, r1, r3
	ldrb	r0, [r5]
	mul	r0, r0, r2
	add	r0, r0, r3
	add	r0, r0, #0x20
	ldrb	r0, [r0]
	add	r1, r1, #0x20
	strb	r0, [r1]
	ldrb	r0, [r5]
	mul	r0, r0, r2
	add	r0, r0, r3
	add	r0, r0, #0x20
	ldrb	r0, [r0]
	b	._1426
._1423:
	.align	2, 0
._1422:
	.word	gBattleMons
._1420:
	ldr	r3, ._1427
	mov	r2, #0x58
	add	r0, r7, #0
	mul	r0, r0, r2
	add	r1, r0, r3
	add	r0, r1, #0
	add	r0, r0, #0x20
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	._1430	@cond_branch
	ldrh	r0, [r1, #0x28]
	cmp	r0, #0
	beq	._1430	@cond_branch
	mov	r5, r8
	strb	r7, [r5]
	add	r1, r4, #0
	mul	r1, r1, r2
	add	r1, r1, r3
	ldrb	r0, [r5]
	mul	r0, r0, r2
	add	r0, r0, r3
	add	r0, r0, #0x20
	ldrb	r0, [r0]
	add	r1, r1, #0x20
	strb	r0, [r1]
	ldrb	r0, [r5]
	mul	r0, r0, r2
	add	r0, r0, r3
	add	r0, r0, #0x20
	ldrb	r0, [r0]
	b	._1426
._1428:
	.align	2, 0
._1427:
	.word	gBattleMons
._1411:
	mov	r2, r8
	strb	r6, [r2]
	mov	r3, #0x58
	add	r0, r6, #0
	mul	r0, r0, r3
	ldr	r5, ._1436
	add	r0, r0, r5
	add	r2, r0, #0
	add	r2, r2, #0x20
	ldrb	r1, [r2]
	cmp	r1, #0
	beq	._1430	@cond_branch
	ldrh	r0, [r0, #0x28]
	cmp	r0, #0
	beq	._1430	@cond_branch
	ldr	r0, [sp, #0x1c]
	strb	r1, [r0]
	ldrb	r0, [r2]
._1426:
	ldr	r1, ._1436 + 4
	strb	r0, [r1]
._1416:
	mov	r0, r9
	add	r0, r0, #0x1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r9, r0
._1430:
	mov	r2, r9
	cmp	r2, #0
	beq	._1431	@cond_branch
	b	._1432
._1431:
	ldr	r3, [sp, #0x1c]
	add	r3, r3, #0x58
	str	r3, [sp, #0x1c]
	ldr	r5, [sp, #0x20]
	add	r5, r5, #0x4
	str	r5, [sp, #0x20]
	add	r4, r4, #0x1
	ldr	r0, ._1436 + 8
	ldrb	r0, [r0]
	cmp	r4, r0
	bge	._1433	@cond_branch
	b	._1434
._1433:
	b	._1534
._1437:
	.align	2, 0
._1436:
	.word	gBattleMons
	.word	gLastUsedAbility
	.word	gNoOfAllBanks
._754:
	mov	r4, #0x0
	ldr	r0, ._1445
	ldrb	r1, [r0]
	cmp	r4, r1
	blt	._1438	@cond_branch
	b	._1534
._1438:
	ldr	r0, ._1445 + 4
	add	r5, r1, #0
	ldr	r2, ._1445 + 8
	add	r3, r0, #0
	add	r3, r3, #0x20
	mov	r6, #0x80
	lsl	r6, r6, #0xc
._1443:
	ldrb	r1, [r3]
	cmp	r1, #0x16
	bne	._1441	@cond_branch
	ldr	r0, [r2]
	and	r0, r0, r6
	cmp	r0, #0
	beq	._1441	@cond_branch
	b	._1442
._1441:
	add	r2, r2, #0x4
	add	r3, r3, #0x58
	add	r4, r4, #0x1
	cmp	r4, r5
	blt	._1443	@cond_branch
	b	._1534
._1446:
	.align	2, 0
._1445:
	.word	gNoOfAllBanks
	.word	gBattleMons
	.word	gStatuses3
._756:
	mov	r0, sl
	bl	GetBankSide
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	mov	r4, #0x0
	ldr	r0, ._1453
	ldrb	r0, [r0]
	cmp	r4, r0
	blt	._1447	@cond_branch
	b	._1534
._1447:
	ldr	r7, ._1453 + 4
._1451:
	lsl	r0, r4, #0x18
	lsr	r0, r0, #0x18
	bl	GetBankSide
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	add	r3, r4, #1
	cmp	r0, r5
	beq	._1450	@cond_branch
	mov	r0, #0x58
	mul	r0, r0, r4
	add	r0, r0, r7
	add	r0, r0, #0x20
	ldrb	r0, [r0]
	cmp	r0, r6
	bne	._1450	@cond_branch
	ldr	r0, ._1453 + 8
	strb	r6, [r0]
	lsl	r0, r3, #0x18
	lsr	r0, r0, #0x18
	mov	r9, r0
._1450:
	add	r4, r3, #0
	ldr	r0, ._1453
	ldrb	r0, [r0]
	cmp	r4, r0
	blt	._1451	@cond_branch
	b	._1534
._1454:
	.align	2, 0
._1453:
	.word	gNoOfAllBanks
	.word	gBattleMons
	.word	gLastUsedAbility
._757:
	mov	r0, sl
	bl	GetBankSide
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	mov	r4, #0x0
	ldr	r0, ._1461
	ldrb	r0, [r0]
	cmp	r4, r0
	blt	._1455	@cond_branch
	b	._1534
._1455:
	ldr	r7, ._1461 + 4
._1459:
	lsl	r0, r4, #0x18
	lsr	r0, r0, #0x18
	bl	GetBankSide
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	add	r3, r4, #1
	cmp	r0, r5
	bne	._1458	@cond_branch
	mov	r0, #0x58
	mul	r0, r0, r4
	add	r0, r0, r7
	add	r0, r0, #0x20
	ldrb	r0, [r0]
	cmp	r0, r6
	bne	._1458	@cond_branch
	ldr	r0, ._1461 + 8
	strb	r6, [r0]
	lsl	r0, r3, #0x18
	lsr	r0, r0, #0x18
	mov	r9, r0
._1458:
	add	r4, r3, #0
	ldr	r0, ._1461
	ldrb	r0, [r0]
	cmp	r4, r0
	blt	._1459	@cond_branch
	b	._1534
._1462:
	.align	2, 0
._1461:
	.word	gNoOfAllBanks
	.word	gBattleMons
	.word	gLastUsedAbility
._758:
	mov	r1, r8
	ldrb	r0, [r1]
	cmp	r0, #0xfd
	beq	._1463	@cond_branch
	cmp	r0, #0xfe
	beq	._1464	@cond_branch
	mov	r4, #0x0
	ldr	r0, ._1468
	add	r5, r0, #0
	ldrb	r2, [r5]
	cmp	r4, r2
	blt	._1465	@cond_branch
	b	._1534
._1465:
	ldr	r2, ._1468 + 4
	b	._1485
._1469:
	.align	2, 0
._1468:
	.word	gNoOfAllBanks
	.word	gBattleMons
._1463:
	mov	r4, #0x0
	ldr	r0, ._1475
	ldrb	r0, [r0]
	cmp	r4, r0
	blt	._1470	@cond_branch
	b	._1534
._1470:
	ldr	r5, ._1475 + 4
	mov	r2, #0x80
	lsl	r2, r2, #0x9
	add	r1, r0, #0
._1473:
	lsl	r0, r4, #0x2
	add	r0, r0, r5
	ldr	r0, [r0]
	and	r0, r0, r2
	add	r3, r4, #1
	cmp	r0, #0
	beq	._1472	@cond_branch
	lsl	r0, r3, #0x18
	lsr	r0, r0, #0x18
	mov	r9, r0
._1472:
	add	r4, r3, #0
	cmp	r4, r1
	blt	._1473	@cond_branch
	b	._1534
._1476:
	.align	2, 0
._1475:
	.word	gNoOfAllBanks
	.word	gStatuses3
._1464:
	mov	r4, #0x0
	ldr	r0, ._1482
	ldrb	r0, [r0]
	cmp	r4, r0
	blt	._1477	@cond_branch
	b	._1534
._1477:
	ldr	r5, ._1482 + 4
	mov	r2, #0x80
	lsl	r2, r2, #0xa
	add	r1, r0, #0
._1480:
	lsl	r0, r4, #0x2
	add	r0, r0, r5
	ldr	r0, [r0]
	and	r0, r0, r2
	add	r3, r4, #1
	cmp	r0, #0
	beq	._1479	@cond_branch
	lsl	r0, r3, #0x18
	lsr	r0, r0, #0x18
	mov	r9, r0
._1479:
	add	r4, r3, #0
	cmp	r4, r1
	blt	._1480	@cond_branch
	b	._1534
._1483:
	.align	2, 0
._1482:
	.word	gNoOfAllBanks
	.word	gStatuses3
._1485:
	mov	r0, #0x58
	mul	r0, r0, r4
	add	r0, r0, r2
	add	r0, r0, #0x20
	ldrb	r0, [r0]
	add	r3, r4, #1
	cmp	r0, r6
	bne	._1484	@cond_branch
	mov	r0, r8
	strb	r6, [r0]
	lsl	r0, r3, #0x18
	lsr	r0, r0, #0x18
	mov	r9, r0
._1484:
	add	r4, r3, #0
	ldrb	r1, [r5]
	cmp	r4, r1
	blt	._1485	@cond_branch
	b	._1534
._763:
	mov	r4, #0x0
	ldr	r0, ._1493
	ldrb	r0, [r0]
	cmp	r4, r0
	blt	._1487	@cond_branch
	b	._1534
._1487:
	ldr	r7, ._1493 + 4
	add	r2, r0, #0
	mov	r5, #0x58
._1491:
	add	r0, r4, #0
	mul	r0, r0, r5
	add	r1, r0, r7
	add	r0, r1, #0
	add	r0, r0, #0x20
	ldrb	r0, [r0]
	add	r3, r4, #1
	cmp	r0, r6
	bne	._1490	@cond_branch
	ldrh	r0, [r1, #0x28]
	cmp	r0, #0
	beq	._1490	@cond_branch
	mov	r0, r8
	strb	r6, [r0]
	lsl	r0, r3, #0x18
	lsr	r0, r0, #0x18
	mov	r9, r0
._1490:
	add	r4, r3, #0
	cmp	r4, r2
	blt	._1491	@cond_branch
	b	._1534
._1494:
	.align	2, 0
._1493:
	.word	gNoOfAllBanks
	.word	gBattleMons
._759:
	mov	r4, #0x0
	ldr	r0, ._1501
	ldrb	r0, [r0]
	cmp	r4, r0
	blt	._1495	@cond_branch
	b	._1534
._1495:
	ldr	r7, ._1501 + 4
	add	r1, r0, #0
	mov	r5, #0x58
	ldr	r2, ._1501 + 8
._1499:
	add	r0, r4, #0
	mul	r0, r0, r5
	add	r0, r0, r7
	add	r0, r0, #0x20
	ldrb	r0, [r0]
	add	r3, r4, #1
	cmp	r0, r6
	bne	._1498	@cond_branch
	cmp	r4, sl
	beq	._1498	@cond_branch
	strb	r6, [r2]
	lsl	r0, r3, #0x18
	lsr	r0, r0, #0x18
	mov	r9, r0
._1498:
	add	r4, r3, #0
	cmp	r4, r1
	blt	._1499	@cond_branch
	b	._1534
._1502:
	.align	2, 0
._1501:
	.word	gNoOfAllBanks
	.word	gBattleMons
	.word	gLastUsedAbility
._760:
	mov	r0, sl
	bl	GetBankSide
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	mov	r4, #0x0
	ldr	r0, ._1509
	ldrb	r0, [r0]
	cmp	r4, r0
	blt	._1503	@cond_branch
	b	._1534
._1503:
	ldr	r7, ._1509 + 4
._1507:
	lsl	r0, r4, #0x18
	lsr	r0, r0, #0x18
	bl	GetBankSide
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, r5
	beq	._1506	@cond_branch
	mov	r0, #0x58
	mul	r0, r0, r4
	add	r0, r0, r7
	add	r0, r0, #0x20
	ldrb	r0, [r0]
	cmp	r0, r6
	bne	._1506	@cond_branch
	ldr	r0, ._1509 + 8
	strb	r6, [r0]
	mov	r0, r9
	add	r0, r0, #0x1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r9, r0
._1506:
	add	r4, r4, #0x1
	ldr	r0, ._1509
	ldrb	r0, [r0]
	cmp	r4, r0
	blt	._1507	@cond_branch
	b	._1534
._1510:
	.align	2, 0
._1509:
	.word	gNoOfAllBanks
	.word	gBattleMons
	.word	gLastUsedAbility
._761:
	mov	r0, sl
	bl	GetBankSide
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	mov	r4, #0x0
	ldr	r0, ._1517
	ldrb	r0, [r0]
	cmp	r4, r0
	blt	._1511	@cond_branch
	b	._1534
._1511:
	ldr	r7, ._1517 + 4
._1515:
	lsl	r0, r4, #0x18
	lsr	r0, r0, #0x18
	bl	GetBankSide
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, r5
	bne	._1514	@cond_branch
	mov	r0, #0x58
	mul	r0, r0, r4
	add	r0, r0, r7
	add	r0, r0, #0x20
	ldrb	r0, [r0]
	cmp	r0, r6
	bne	._1514	@cond_branch
	ldr	r0, ._1517 + 8
	strb	r6, [r0]
	mov	r0, r9
	add	r0, r0, #0x1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r9, r0
._1514:
	add	r4, r4, #0x1
	ldr	r0, ._1517
	ldrb	r0, [r0]
	cmp	r4, r0
	blt	._1515	@cond_branch
	b	._1534
._1518:
	.align	2, 0
._1517:
	.word	gNoOfAllBanks
	.word	gBattleMons
	.word	gLastUsedAbility
._853:
	ldr	r0, ._1520
	bl	b_push_move_exec
	ldr	r0, ._1520 + 4
	ldr	r2, ._1520 + 8
	add	r1, r0, r2
	strb	r6, [r1]
	mov	r1, r9
	sub	r1, r1, #0x1
	ldr	r3, ._1520 + 12
	add	r0, r0, r3
	strb	r1, [r0]
	b	._1534
._1521:
	.align	2, 0
._1520:
	.word	gUnknown_081D977D
	.word	+0x2000000
	.word	0x16003
	.word	0x1609b
._1374:
	ldr	r0, ._1523
	bl	b_push_move_exec
	ldr	r0, ._1523 + 4
	ldr	r5, ._1523 + 8
	add	r1, r0, r5
	mov	r2, sl
	strb	r2, [r1]
	mov	r1, r9
	sub	r1, r1, #0x1
	ldr	r3, ._1523 + 12
	add	r0, r0, r3
	strb	r1, [r0]
	b	._1540
._1524:
	.align	2, 0
._1523:
	.word	gUnknown_081D977D
	.word	+0x2000000
	.word	0x16003
	.word	0x1609b
._1399:
	mov	r5, r8
	strb	r1, [r5]
	ldr	r0, [r2]
	ldr	r1, ._1526
	and	r0, r0, r1
	str	r0, [r2]
	ldr	r0, ._1526 + 4
	bl	b_push_move_exec
	b	._1525
._1527:
	.align	2, 0
._1526:
	.word	0xfff7ffff
	.word	gUnknown_081D978C
._1432:
	ldr	r0, ._1529
	bl	b_push_move_exec
	ldr	r1, ._1529 + 4
	ldr	r2, [sp, #0x18]
	add	r1, r2, r1
	ldr	r0, [r1]
	ldr	r2, ._1529 + 8
	and	r0, r0, r2
	str	r0, [r1]
	ldr	r0, ._1529 + 12
	ldr	r3, ._1529 + 16
	add	r0, r0, r3
	strb	r4, [r0]
	ldr	r1, ._1529 + 20
	mov	r4, #0xfd
	strb	r4, [r1]
	mov	r0, #0x4
	strb	r0, [r1, #0x1]
	ldr	r2, ._1529 + 24
	ldrb	r0, [r2]
	strb	r0, [r1, #0x2]
	ldr	r3, ._1529 + 28
	ldrb	r0, [r2]
	lsl	r0, r0, #0x1
	add	r0, r0, r3
	ldrh	r0, [r0]
	strb	r0, [r1, #0x3]
	mov	r0, #0xff
	strb	r0, [r1, #0x4]
	ldr	r1, ._1529 + 32
	strb	r4, [r1]
	mov	r0, #0x9
	strb	r0, [r1, #0x1]
	ldr	r0, ._1529 + 36
	ldrb	r0, [r0]
	strb	r0, [r1, #0x2]
	mov	r0, #0x1
	neg	r0, r0
	strb	r0, [r1, #0x3]
	b	._1534
._1530:
	.align	2, 0
._1529:
	.word	gUnknown_081D9726
	.word	gStatuses3
	.word	0xffefffff
	.word	+0x2000000
	.word	0x16003
	.word	gBattleTextBuff1
	.word	gActiveBank
	.word	gBattlePartyID
	.word	gBattleTextBuff2
	.word	gLastUsedAbility
._1442:
	mov	r5, r8
	strb	r1, [r5]
	ldr	r0, [r2]
	ldr	r1, ._1532
	and	r0, r0, r1
	str	r0, [r2]
	bl	b_movescr_stack_push_cursor
	ldr	r1, ._1532 + 4
	ldr	r0, ._1532 + 8
	str	r0, [r1]
._1525:
	ldr	r0, ._1532 + 12
	ldr	r1, ._1532 + 16
	add	r0, r0, r1
	strb	r4, [r0]
._1392:
	mov	r0, r9
	add	r0, r0, #0x1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r9, r0
	b	._1534
._1533:
	.align	2, 0
._1532:
	.word	0xfff7ffff
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D9795
	.word	+0x2000000
	.word	0x160dd
._762:
	mov	r4, #0x0
	ldr	r0, ._1541
	ldrb	r1, [r0]
	cmp	r4, r1
	bge	._1534	@cond_branch
	ldr	r0, ._1541 + 4
	add	r2, r1, #0
	add	r1, r0, #0
	add	r1, r1, #0x20
	ldr	r3, ._1541 + 8
._1537:
	ldrb	r0, [r1]
	cmp	r0, r6
	bne	._1536	@cond_branch
	cmp	r4, sl
	beq	._1536	@cond_branch
	strb	r6, [r3]
	mov	r0, r9
	add	r0, r0, #0x1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r9, r0
._1536:
	add	r1, r1, #0x58
	add	r4, r4, #0x1
	cmp	r4, r2
	blt	._1537	@cond_branch
._1534:
	mov	r2, r9
	cmp	r2, #0
	beq	._1540	@cond_branch
._916:
	ldr	r3, [sp, #0x4]
	cmp	r3, #0xb
	bhi	._1540	@cond_branch
	ldr	r1, ._1541 + 8
	ldrb	r0, [r1]
	cmp	r0, #0xff
	beq	._1540	@cond_branch
	add	r1, r0, #0
	mov	r0, sl
	bl	RecordAbilityBattle
._1540:
	mov	r0, r9
	add	sp, sp, #0x28
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
._1542:
	.align	2, 0
._1541:
	.word	gNoOfAllBanks
	.word	gBattleMons
	.word	gLastUsedAbility
.syntax unified
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

	thumb_func_start sub_801A02C
sub_801A02C: @ 801A02C
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
	bl sub_801E3EC
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
	thumb_func_end sub_801A02C

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

	thumb_func_start sub_801B928
sub_801B928:
.syntax divided
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	sp, sp, #0xfffffff0
	ldr	r0, ._1785
	ldrh	r1, [r0]
	mov	r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	bne	._1791	@cond_branch
	ldr	r4, ._1785 + 4
	ldrb	r0, [r4]
	bl	GetBankSide
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1
	beq	._1791	@cond_branch
	ldr	r2, ._1785 + 8
	ldrb	r1, [r4]
	mov	r0, #0x58
	mul	r1, r1, r0
	add	r0, r2, #0
	add	r0, r0, #0x54
	add	r0, r1, r0
	ldr	r0, [r0]
	add	r2, r2, #0x3c
	add	r1, r1, r2
	bl	IsOtherTrainer
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	._1791	@cond_branch
	ldr	r0, ._1785 + 12
	ldrb	r1, [r0]
	mov	r0, #0x40
	and	r0, r0, r1
	cmp	r0, #0
	beq	._1783	@cond_branch
	mov	r0, #0xa
	b	._1784
._1786:
	.align	2, 0
._1785:
	.word	gBattleTypeFlags
	.word	gBankAttacker
	.word	gBattleMons
	.word	gUnknown_02023A14+0x50
._1783:
	ldr	r0, ._1794
	bl	FlagGet
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	._1791	@cond_branch
	mov	r1, #0xa
	mov	r8, r1
	ldr	r0, ._1794 + 4
	bl	FlagGet
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	._1788	@cond_branch
	mov	r2, #0x1e
	mov	r8, r2
._1788:
	ldr	r0, ._1794 + 8
	bl	FlagGet
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	._1789	@cond_branch
	mov	r4, #0x32
	mov	r8, r4
._1789:
	ldr	r0, ._1794 + 12
	bl	FlagGet
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	._1790	@cond_branch
	mov	r0, #0x46
._1784:
	mov	r8, r0
._1790:
	ldr	r5, ._1794 + 16
	ldr	r7, ._1794 + 20
	ldrb	r0, [r7]
	mov	r6, #0x58
	mul	r0, r0, r6
	add	r0, r0, r5
	add	r0, r0, #0x2a
	ldrb	r0, [r0]
	cmp	r0, r8
	bls	._1791	@cond_branch
	bl	Random
	mov	r1, #0xff
	and	r1, r1, r0
	ldrb	r0, [r7]
	add	r2, r0, #0
	mul	r2, r2, r6
	add	r0, r2, r5
	add	r0, r0, #0x2a
	ldrb	r0, [r0]
	add r0, r0, r8
	mul	r0, r0, r1
	asr	r4, r0, #0x8
	cmp	r4, r8
	bge	._1792	@cond_branch
._1791:
	mov	r0, #0x0
	b	._1823
._1795:
	.align	2, 0
._1794:
	.word	0x80e
	.word	0x808
	.word	0x80a
	.word	0x80c
	.word	gBattleMons
	.word	gBankAttacker
._1792:
	ldr	r3, ._1801
	ldrh	r0, [r3]
	cmp	r0, #0x63
	bne	._1796	@cond_branch
	add	r0, r5, #0
	add	r0, r0, #0x50
	add	r0, r2, r0
	ldr	r1, [r0]
	ldr	r2, ._1801 + 4
	and	r1, r1, r2
	str	r1, [r0]
._1796:
	ldrb	r0, [r7]
	mul	r0, r0, r6
	add	r1, r5, #0
	add	r1, r1, #0x4c
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	r1, #0x7
	and	r0, r0, r1
	cmp	r0, #0
	beq	._1799	@cond_branch
	ldrh	r0, [r3]
	cmp	r0, #0xad
	beq	._1798	@cond_branch
	cmp	r0, #0xd6
	bne	._1799	@cond_branch
._1798:
	ldr	r1, ._1801 + 8
	ldr	r0, ._1801 + 12
	b	._1819
._1802:
	.align	2, 0
._1801:
	.word	gCurrentMove
	.word	0xff7fffff
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D995F
._1799:
	bl	Random
	mov	r5, #0xff
	add	r1, r5, #0
	and	r1, r1, r0
	ldr	r6, ._1808
	ldr	r2, ._1808 + 4
	mov	r9, r2
	ldrb	r3, [r2]
	mov	r7, #0x58
	add	r0, r3, #0
	mul	r0, r0, r7
	add	r0, r0, r6
	add	r0, r0, #0x2a
	ldrb	r2, [r0]
	mov	r4, r8
	add	r0, r2, r4
	mul	r0, r0, r1
	asr	r4, r0, #0x8
	cmp	r4, r8
	bge	._1803	@cond_branch
	ldr	r7, ._1808 + 8
	ldr	r5, ._1808 + 12
	ldrb	r0, [r5]
	lsl	r0, r0, #0x2
	add	r0, r0, r7
	ldrb	r1, [r0]
	add	r0, r3, #0
	mov	r2, #0xff
	bl	sub_8015A98
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	cmp	r4, #0xf
	bne	._1804	@cond_branch
	b	._1805
._1804:
	add	r6, r5, #0
	ldr	r0, ._1808 + 16
	mov	r9, r0
	mov	r1, #0x3
	mov	r8, r1
._1806:
	bl	Random
	mov	r2, r8
	and	r0, r0, r2
	mov	r1, r9
	strb	r0, [r1]
	strb	r0, [r6]
	ldrb	r0, [r6]
	lsl	r0, r0, #0x2
	add	r0, r0, r7
	ldr	r5, [r0]
	and	r5, r5, r4
	cmp	r5, #0
	bne	._1806	@cond_branch
	ldr	r4, ._1808 + 20
	ldr	r3, ._1808
	ldr	r0, ._1808 + 12
	ldrb	r0, [r0]
	lsl	r0, r0, #0x1
	ldr	r1, ._1808 + 4
	ldrb	r2, [r1]
	mov	r1, #0x58
	mul	r1, r1, r2
	add	r0, r0, r1
	add	r3, r3, #0xc
	add	r0, r0, r3
	ldrh	r0, [r0]
	strh	r0, [r4]
	ldr	r0, ._1808 + 24
	strb	r5, [r0, #0x3]
	ldr	r0, ._1808 + 28
	mov	r1, #0x0
	strh	r5, [r0]
	ldr	r0, ._1808 + 32
	ldr	r2, ._1808 + 36
	add	r0, r0, r2
	strb	r1, [r0]
	ldr	r1, ._1808 + 40
	ldr	r0, ._1808 + 44
	str	r0, [r1]
	ldrh	r0, [r4]
	mov	r1, #0x0
	bl	sub_801B5C0
	ldr	r1, ._1808 + 48
	strb	r0, [r1]
	ldr	r2, ._1808 + 52
	ldr	r0, [r2]
	mov	r1, #0x80
	lsl	r1, r1, #0xe
	b	._1807
._1809:
	.align	2, 0
._1808:
	.word	gBattleMons
	.word	gBankAttacker
	.word	gBitTable
	.word	gCurrMovePos
	.word	gUnknown_02024BE5
	.word	gUnknown_02024BEA
	.word	gBattleCommunication
	.word	gDynamicBasePower
	.word	+0x2000000
	.word	0x1601c
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D996F
	.word	gBankTarget
	.word	gHitMarker
._1803:
	mov	r4, r8
	sub	r0, r2, r4
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r8, r0
	bl	Random
	add	r4, r5, #0
	and	r4, r4, r0
	cmp	r4, r8
	bge	._1818	@cond_branch
	mov	r1, r9
	ldrb	r0, [r1]
	add	r1, r0, #0
	mul	r1, r1, r7
	add	r0, r6, #0
	add	r0, r0, #0x4c
	add	r0, r1, r0
	ldr	r0, [r0]
	and	r0, r0, r5
	cmp	r0, #0
	bne	._1818	@cond_branch
	add	r0, r1, r6
	add	r0, r0, #0x20
	ldrb	r0, [r0]
	cmp	r0, #0x48
	beq	._1818	@cond_branch
	cmp	r0, #0xf
	beq	._1818	@cond_branch
	mov	r2, #0x0
	ldr	r0, ._1820
	ldrb	r3, [r0]
	add	r7, r0, #0
	cmp	r2, r3
	bge	._1816	@cond_branch
	ldr	r0, [r6, #0x50]
	mov	r1, #0x70
	and	r0, r0, r1
	cmp	r0, #0
	bne	._1816	@cond_branch
	add	r1, r6, #0
	add	r1, r1, #0x50
	mov	r5, #0x70
._1817:
	add	r1, r1, #0x58
	add	r2, r2, #0x1
	cmp	r2, r3
	bge	._1816	@cond_branch
	ldr	r0, [r1]
	and	r0, r0, r5
	cmp	r0, #0
	beq	._1817	@cond_branch
._1816:
	ldrb	r7, [r7]
	cmp	r2, r7
	bne	._1818	@cond_branch
	ldr	r1, ._1820 + 4
	ldr	r0, ._1820 + 8
	b	._1819
._1821:
	.align	2, 0
._1820:
	.word	gNoOfAllBanks
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D9989
._1818:
	mov	r2, r8
	sub	r4, r4, r2
	cmp	r4, r8
	blt	._1822	@cond_branch
._1805:
	bl	Random
	ldr	r2, ._1824
	mov	r1, #0x3
	and	r1, r1, r0
	strb	r1, [r2, #0x5]
	ldr	r1, ._1824 + 4
	ldr	r0, ._1824 + 8
._1819:
	str	r0, [r1]
	mov	r0, #0x1
	b	._1823
._1825:
	.align	2, 0
._1824:
	.word	gBattleCommunication
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D9977
._1822:
	ldr	r4, ._1826
	ldrb	r1, [r4]
	mov	r0, #0x58
	mul	r1, r1, r0
	ldr	r0, ._1826 + 4
	add	r1, r1, r0
	mov	r0, #0x28
	str	r0, [sp]
	mov	r0, #0x0
	str	r0, [sp, #0x4]
	ldrb	r0, [r4]
	str	r0, [sp, #0x8]
	ldrb	r0, [r4]
	str	r0, [sp, #0xc]
	add	r0, r1, #0
	mov	r2, #0x1
	mov	r3, #0x0
	bl	CalculateBaseDamage
	ldr	r1, ._1826 + 8
	str	r0, [r1]
	ldr	r1, ._1826 + 12
	ldrb	r0, [r4]
	strb	r0, [r1]
	ldr	r1, ._1826 + 16
	ldr	r0, ._1826 + 20
	str	r0, [r1]
	ldr	r2, ._1826 + 24
	ldr	r0, [r2]
	mov	r1, #0x80
	lsl	r1, r1, #0xc
._1807:
	orr	r0, r0, r1
	str	r0, [r2]
	mov	r0, #0x2
._1823:
	add	sp, sp, #0x10
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
._1827:
	.align	2, 0
._1826:
	.word	gBankAttacker
	.word	gBattleMons
	.word	gBattleMoveDamage
	.word	gBankTarget
	.word	gBattlescriptCurrInstr
	.word	gUnknown_081D99A0
	.word	gHitMarker
.syntax unified
	thumb_func_end sub_801B928

	.align 2, 0 @ Don't pad with nop.
