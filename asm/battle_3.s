	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text



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
