	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text
	
	thumb_func_start AI_SwitchIfPerishSong
AI_SwitchIfPerishSong: @ 8035FEC
	push {lr}
	ldr r1, _08036038 @ =gStatuses3
	ldr r0, _0803603C @ =gActiveBank
	ldrb r2, [r0]
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0803604C
	ldr r0, _08036040 @ =gDisableStructs
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xF]
	lsls r0, 28
	cmp r0, 0
	bne _0803604C
	adds r0, r2, 0
	bl GetBankIdentity
	ldr r1, _08036044 @ =gSharedMem
	lsls r0, 24
	lsrs r0, 25
	ldr r2, _08036048 @ =0x000160c8
	adds r0, r2
	adds r0, r1
	movs r1, 0x6
	strb r1, [r0]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0
	bl Emitcmd33
	movs r0, 0x1
	b _0803604E
	.align 2, 0
_08036038: .4byte gStatuses3
_0803603C: .4byte gActiveBank
_08036040: .4byte gDisableStructs
_08036044: .4byte gSharedMem
_08036048: .4byte 0x000160c8
_0803604C:
	movs r0, 0
_0803604E:
	pop {r1}
	bx r1
	thumb_func_end AI_SwitchIfPerishSong

	thumb_func_start AI_SwitchIfWonderguard
AI_SwitchIfWonderguard: @ 8036054
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _0803606C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080360A0
	b _080361C8
	.align 2, 0
_0803606C: .4byte gBattleTypeFlags
_08036070:
	ldr r0, _08036094 @ =gActiveBank
	ldrb r0, [r0]
	bl GetBankIdentity
	ldr r1, _08036098 @ =gSharedMem
	lsls r0, 24
	lsrs r0, 25
	ldr r2, _0803609C @ =0x000160c8
	adds r0, r2
	adds r0, r1
	strb r6, [r0]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0
	bl Emitcmd33
	movs r0, 0x1
	b _080361CA
	.align 2, 0
_08036094: .4byte gActiveBank
_08036098: .4byte gSharedMem
_0803609C: .4byte 0x000160c8
_080360A0:
	ldr r4, _080361D8 @ =gBattleMons
	movs r0, 0
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x58
	muls r0, r1
	adds r0, r4
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x19
	beq _080360BC
	b _080361C8
_080360BC:
	movs r0, 0
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r2, r0, 24
	movs r6, 0
	adds r7, r4, 0
	movs r5, 0x58
	adds r0, r2, 0
	muls r0, r5
	adds r4, r0, r7
	movs r3, 0x20
	adds r3, r4
	mov r8, r3
_080360D8:
	lsls r1, r6, 1
	ldr r0, _080361DC @ =gActiveBank
	ldrb r0, [r0]
	muls r0, r5
	adds r1, r0
	adds r0, r7, 0
	adds r0, 0xC
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	beq _08036104
	ldrh r1, [r4]
	mov r3, r8
	ldrb r2, [r3]
	bl AI_TypeCalc
	lsls r0, 24
	lsrs r1, r0, 24
	movs r0, 0x2
	ands r1, r0
	cmp r1, 0
	bne _080361C8
_08036104:
	adds r6, 0x1
	cmp r6, 0x3
	ble _080360D8
	movs r6, 0
	ldr r0, _080361E0 @ =gEnemyParty
	mov r9, r0
_08036110:
	movs r0, 0x64
	adds r5, r6, 0
	muls r5, r0
	mov r2, r9
	adds r4, r5, r2
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _080361C2
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _080361C2
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _080361C2
	ldr r1, _080361E4 @ =gBattlePartyID
	ldr r0, _080361DC @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r6, r0
	beq _080361C2
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	adds r0, r4, 0
	movs r1, 0x2E
	bl GetMonData
	movs r0, 0
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r2, r0, 24
	movs r4, 0
	mov r8, r5
	ldr r1, _080361D8 @ =gBattleMons
	movs r0, 0x58
	muls r0, r2
	adds r5, r0, r1
	adds r7, r5, 0
	adds r7, 0x20
_0803617C:
	adds r1, r4, 0
	adds r1, 0xD
	mov r0, r8
	add r0, r9
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	beq _080361BC
	ldrh r1, [r5]
	ldrb r2, [r7]
	bl AI_TypeCalc
	lsls r0, 24
	lsrs r1, r0, 24
	movs r0, 0x2
	ands r1, r0
	cmp r1, 0
	beq _080361BC
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080361BC
	b _08036070
_080361BC:
	adds r4, 0x1
	cmp r4, 0x3
	ble _0803617C
_080361C2:
	adds r6, 0x1
	cmp r6, 0x5
	ble _08036110
_080361C8:
	movs r0, 0
_080361CA:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080361D8: .4byte gBattleMons
_080361DC: .4byte gActiveBank
_080361E0: .4byte gEnemyParty
_080361E4: .4byte gBattlePartyID
	thumb_func_end AI_SwitchIfWonderguard

	thumb_func_start sub_80361E8
sub_80361E8: @ 80361E8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r0, 0x1
	bl ai_has_super_effective_move_on_field
	lsls r0, 24
	cmp r0, 0
	beq _08036214
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	beq _08036214
	b _08036400
_08036214:
	ldr r1, _0803627C @ =gMoveHitWith
	ldr r5, _08036280 @ =gActiveBank
	ldrb r3, [r5]
	lsls r0, r3, 1
	adds r4, r0, r1
	ldrh r1, [r4]
	cmp r1, 0
	bne _08036226
	b _08036400
_08036226:
	ldr r0, _08036284 @ =0x0000ffff
	cmp r1, r0
	bne _0803622E
	b _08036400
_0803622E:
	ldr r2, _08036288 @ =gBattleMoves
	ldrh r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	bne _08036242
	b _08036400
_08036242:
	ldr r0, _0803628C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080362AE
	mov r8, r3
	mov r0, r8
	bl GetBankIdentity
	movs r4, 0x2
	eors r0, r4
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByPlayerAI
	ldr r1, _08036290 @ =gAbsentBankFlags
	ldrb r1, [r1]
	ldr r2, _08036294 @ =gBitTable
	lsls r0, 24
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08036298
	ldrb r7, [r5]
	b _080362B2
	.align 2, 0
_0803627C: .4byte gMoveHitWith
_08036280: .4byte gActiveBank
_08036284: .4byte 0x0000ffff
_08036288: .4byte gBattleMoves
_0803628C: .4byte gBattleTypeFlags
_08036290: .4byte gAbsentBankFlags
_08036294: .4byte gBitTable
_08036298:
	ldrb r0, [r5]
	bl GetBankIdentity
	eors r0, r4
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r7, r0, 24
	b _080362B2
_080362AE:
	adds r7, r3, 0
	mov r8, r7
_080362B2:
	ldr r3, _080362D4 @ =gBattleMoves
	ldr r1, _080362D8 @ =gMoveHitWith
	ldr r2, _080362DC @ =gActiveBank
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x2]
	adds r1, r2, 0
	cmp r0, 0xA
	bne _080362E0
	movs r0, 0x12
	b _080362F2
	.align 2, 0
_080362D4: .4byte gBattleMoves
_080362D8: .4byte gMoveHitWith
_080362DC: .4byte gActiveBank
_080362E0:
	cmp r0, 0xB
	bne _080362EA
	movs r2, 0xB
	mov r10, r2
	b _080362F4
_080362EA:
	cmp r0, 0xD
	beq _080362F0
	b _08036400
_080362F0:
	movs r0, 0xA
_080362F2:
	mov r10, r0
_080362F4:
	ldr r2, _08036308 @ =gBattleMons
	ldrb r1, [r1]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, r10
	bne _0803633C
	b _08036400
	.align 2, 0
_08036308: .4byte gBattleMons
_0803630C:
	ldr r0, _08036330 @ =gActiveBank
	ldrb r0, [r0]
	bl GetBankIdentity
	ldr r1, _08036334 @ =gSharedMem
	lsls r0, 24
	lsrs r0, 25
	ldr r2, _08036338 @ =0x000160c8
	adds r0, r2
	adds r0, r1
	strb r6, [r0]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0
	bl Emitcmd33
	movs r0, 0x1
	b _08036402
	.align 2, 0
_08036330: .4byte gActiveBank
_08036334: .4byte gSharedMem
_08036338: .4byte 0x000160c8
_0803633C:
	movs r6, 0
	ldr r0, _080363CC @ =gBaseStats
	mov r9, r0
_08036342:
	movs r0, 0x64
	adds r1, r6, 0
	muls r1, r0
	ldr r0, _080363D0 @ =gEnemyParty
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _080363FA
	adds r0, r5, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _080363FA
	adds r0, r5, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _080363FA
	ldr r1, _080363D4 @ =gBattlePartyID
	mov r2, r8
	lsls r0, r2, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r6, r0
	beq _080363FA
	lsls r0, r7, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r6, r0
	beq _080363FA
	ldr r1, _080363D8 @ =gSharedMem
	ldr r0, _080363DC @ =0x00016068
	add r0, r8
	adds r0, r1
	ldrb r0, [r0]
	cmp r6, r0
	beq _080363FA
	ldr r2, _080363DC @ =0x00016068
	adds r0, r7, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r6, r0
	beq _080363FA
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r5, 0
	movs r1, 0x2E
	bl GetMonData
	cmp r0, 0
	beq _080363E0
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	add r0, r9
	ldrb r0, [r0, 0x17]
	b _080363EA
	.align 2, 0
_080363CC: .4byte gBaseStats
_080363D0: .4byte gEnemyParty
_080363D4: .4byte gBattlePartyID
_080363D8: .4byte gSharedMem
_080363DC: .4byte 0x00016068
_080363E0:
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	add r0, r9
	ldrb r0, [r0, 0x16]
_080363EA:
	cmp r10, r0
	bne _080363FA
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	bne _0803630C
_080363FA:
	adds r6, 0x1
	cmp r6, 0x5
	ble _08036342
_08036400:
	movs r0, 0
_08036402:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80361E8

	thumb_func_start AI_SwitchIfNaturalCure
AI_SwitchIfNaturalCure: @ 8036410
	push {r4,r5,lr}
	ldr r3, _08036468 @ =gBattleMons
	ldr r5, _0803646C @ =gActiveBank
	ldrb r4, [r5]
	movs r0, 0x58
	adds r2, r4, 0
	muls r2, r0
	adds r0, r3, 0
	adds r0, 0x4C
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	beq _080364D8
	adds r1, r2, r3
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x1E
	bne _080364D8
	ldrh r0, [r1, 0x2C]
	ldrh r1, [r1, 0x28]
	lsrs r0, 1
	cmp r1, r0
	bcc _080364D8
	ldr r1, _08036470 @ =gMoveHitWith
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	cmp r1, 0
	beq _08036456
	ldr r0, _08036474 @ =0x0000ffff
	cmp r1, r0
	bne _08036478
_08036456:
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08036478
	ldrb r0, [r5]
	b _080364E0
	.align 2, 0
_08036468: .4byte gBattleMons
_0803646C: .4byte gActiveBank
_08036470: .4byte gMoveHitWith
_08036474: .4byte 0x0000ffff
_08036478:
	ldr r2, _080364A4 @ =gBattleMoves
	ldr r1, _080364A8 @ =gMoveHitWith
	ldr r4, _080364AC @ =gActiveBank
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	bne _080364B0
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _080364B0
	ldrb r0, [r4]
	b _080364E0
	.align 2, 0
_080364A4: .4byte gBattleMoves
_080364A8: .4byte gMoveHitWith
_080364AC: .4byte gActiveBank
_080364B0:
	movs r0, 0x8
	movs r1, 0x1
	bl sub_80366A4
	lsls r0, 24
	cmp r0, 0
	bne _080364FE
	movs r0, 0x4
	movs r1, 0x1
	bl sub_80366A4
	lsls r0, 24
	cmp r0, 0
	bne _080364FE
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	bne _080364DC
_080364D8:
	movs r0, 0
	b _08036500
_080364DC:
	ldr r0, _08036508 @ =gActiveBank
	ldrb r0, [r0]
_080364E0:
	bl GetBankIdentity
	ldr r1, _0803650C @ =gSharedMem
	lsls r0, 24
	lsrs r0, 25
	ldr r2, _08036510 @ =0x000160c8
	adds r0, r2
	adds r0, r1
	movs r1, 0x6
	strb r1, [r0]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0
	bl Emitcmd33
_080364FE:
	movs r0, 0x1
_08036500:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08036508: .4byte gActiveBank
_0803650C: .4byte gSharedMem
_08036510: .4byte 0x000160c8
	thumb_func_end AI_SwitchIfNaturalCure

	thumb_func_start ai_has_super_effective_move_on_field
ai_has_super_effective_move_on_field: @ 8036514
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r0, 0
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _080365AC @ =gAbsentBankFlags
	ldrb r1, [r0]
	ldr r2, _080365B0 @ =gBitTable
	lsls r0, r3, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0803659C
	movs r4, 0
	ldr r6, _080365B4 @ =gBattleMons
	movs r7, 0x58
	adds r0, r3, 0
	muls r0, r7
	adds r5, r0, r6
	movs r0, 0x20
	adds r0, r5
	mov r9, r0
_08036550:
	lsls r1, r4, 1
	ldr r0, _080365B8 @ =gActiveBank
	ldrb r0, [r0]
	muls r0, r7
	adds r1, r0
	adds r0, r6, 0
	adds r0, 0xC
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	beq _08036596
	ldrh r1, [r5]
	mov r3, r9
	ldrb r2, [r3]
	bl AI_TypeCalc
	lsls r0, 24
	lsrs r1, r0, 24
	movs r0, 0x2
	ands r1, r0
	cmp r1, 0
	beq _08036596
	mov r0, r8
	cmp r0, 0
	bne _080365C0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	bne _080365C0
_08036596:
	adds r4, 0x1
	cmp r4, 0x3
	ble _08036550
_0803659C:
	ldr r0, _080365BC @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080365C4
	b _0803663E
	.align 2, 0
_080365AC: .4byte gAbsentBankFlags
_080365B0: .4byte gBitTable
_080365B4: .4byte gBattleMons
_080365B8: .4byte gActiveBank
_080365BC: .4byte gBattleTypeFlags
_080365C0:
	movs r0, 0x1
	b _08036640
_080365C4:
	movs r0, 0x2
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _0803664C @ =gAbsentBankFlags
	ldrb r1, [r0]
	ldr r2, _08036650 @ =gBitTable
	lsls r0, r3, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0803663E
	movs r4, 0
	ldr r6, _08036654 @ =gBattleMons
	movs r7, 0x58
	adds r0, r3, 0
	muls r0, r7
	adds r5, r0, r6
	movs r3, 0x20
	adds r3, r5
	mov r9, r3
_080365F2:
	lsls r1, r4, 1
	ldr r0, _08036658 @ =gActiveBank
	ldrb r0, [r0]
	muls r0, r7
	adds r1, r0
	adds r0, r6, 0
	adds r0, 0xC
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	beq _08036638
	ldrh r1, [r5]
	mov r3, r9
	ldrb r2, [r3]
	bl AI_TypeCalc
	lsls r0, 24
	lsrs r1, r0, 24
	movs r0, 0x2
	ands r1, r0
	cmp r1, 0
	beq _08036638
	mov r0, r8
	cmp r0, 0
	bne _080365C0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	bne _080365C0
_08036638:
	adds r4, 0x1
	cmp r4, 0x3
	ble _080365F2
_0803663E:
	movs r0, 0
_08036640:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803664C: .4byte gAbsentBankFlags
_08036650: .4byte gBitTable
_08036654: .4byte gBattleMons
_08036658: .4byte gActiveBank
	thumb_func_end ai_has_super_effective_move_on_field

	thumb_func_start AI_AreStatsRaised
AI_AreStatsRaised: @ 803665C
	push {r4,lr}
	movs r4, 0
	ldr r1, _0803669C @ =gBattleMons
	ldr r0, _080366A0 @ =gActiveBank
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x18
	adds r2, r0, r1
	movs r3, 0x7
_08036670:
	ldrb r1, [r2]
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r0, 0x6
	ble _08036686
	subs r1, 0x6
	lsls r0, r4, 24
	asrs r0, 24
	adds r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
_08036686:
	adds r2, 0x1
	subs r3, 0x1
	cmp r3, 0
	bge _08036670
	movs r0, 0
	cmp r4, 0x3
	bls _08036696
	movs r0, 0x1
_08036696:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803669C: .4byte gBattleMons
_080366A0: .4byte gActiveBank
	thumb_func_end AI_AreStatsRaised

	thumb_func_start sub_80366A4
sub_80366A4: @ 80366A4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0x4]
	ldr r1, _08036730 @ =gMoveHitWith
	ldr r5, _08036734 @ =gActiveBank
	ldrb r3, [r5]
	lsls r0, r3, 1
	adds r4, r0, r1
	ldrh r1, [r4]
	cmp r1, 0
	bne _080366CE
	b _080368D8
_080366CE:
	ldr r0, _08036738 @ =0x0000ffff
	cmp r1, r0
	bne _080366D6
	b _080368D8
_080366D6:
	ldr r0, _0803673C @ =gUnknown_02024C5C
	adds r0, r3, r0
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080366E2
	b _080368D8
_080366E2:
	ldr r2, _08036740 @ =gBattleMoves
	ldrh r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	bne _080366F6
	b _080368D8
_080366F6:
	ldr r0, _08036744 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08036798
	mov r9, r3
	mov r0, r9
	bl GetBankIdentity
	movs r4, 0x2
	eors r0, r4
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByPlayerAI
	ldr r1, _08036748 @ =gAbsentBankFlags
	ldrb r1, [r1]
	ldr r2, _0803674C @ =gBitTable
	lsls r0, 24
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08036750
	ldrb r5, [r5]
	mov r10, r5
	b _0803679C
	.align 2, 0
_08036730: .4byte gMoveHitWith
_08036734: .4byte gActiveBank
_08036738: .4byte 0x0000ffff
_0803673C: .4byte gUnknown_02024C5C
_08036740: .4byte gBattleMoves
_08036744: .4byte gBattleTypeFlags
_08036748: .4byte gAbsentBankFlags
_0803674C: .4byte gBitTable
_08036750:
	ldrb r0, [r5]
	bl GetBankIdentity
	eors r0, r4
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	b _0803679C
_08036768:
	ldr r0, _0803678C @ =gActiveBank
	ldrb r0, [r0]
	bl GetBankIdentity
	ldr r1, _08036790 @ =gSharedMem
	lsls r0, 24
	lsrs r0, 25
	ldr r2, _08036794 @ =0x000160c8
	adds r0, r2
	adds r0, r1
	strb r6, [r0]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0
	bl Emitcmd33
	movs r0, 0x1
	b _080368DA
	.align 2, 0
_0803678C: .4byte gActiveBank
_08036790: .4byte gSharedMem
_08036794: .4byte 0x000160c8
_08036798:
	mov r9, r3
	mov r10, r9
_0803679C:
	movs r6, 0
_0803679E:
	movs r0, 0x64
	adds r1, r6, 0
	muls r1, r0
	ldr r0, _08036830 @ =gEnemyParty
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _080367B6
	b _080368D0
_080367B6:
	adds r0, r5, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	bne _080367C4
	b _080368D0
_080367C4:
	adds r0, r5, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _080368D0
	ldr r1, _08036834 @ =gBattlePartyID
	mov r2, r9
	lsls r0, r2, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r6, r0
	beq _080368D0
	mov r2, r10
	lsls r0, r2, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r6, r0
	beq _080368D0
	ldr r1, _08036838 @ =gSharedMem
	ldr r0, _0803683C @ =0x00016068
	add r0, r9
	adds r0, r1
	ldrb r0, [r0]
	cmp r6, r0
	beq _080368D0
	ldr r0, _0803683C @ =0x00016068
	add r0, r10
	adds r0, r1
	ldrb r0, [r0]
	cmp r6, r0
	beq _080368D0
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r5, 0
	movs r1, 0x2E
	bl GetMonData
	cmp r0, 0
	beq _08036844
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	ldr r1, _08036840 @ =gBaseStats
	adds r0, r1
	ldrb r2, [r0, 0x17]
	b _08036850
	.align 2, 0
_08036830: .4byte gEnemyParty
_08036834: .4byte gBattlePartyID
_08036838: .4byte gSharedMem
_0803683C: .4byte 0x00016068
_08036840: .4byte gBaseStats
_08036844:
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	ldr r2, _080368EC @ =gBaseStats
	adds r0, r2
	ldrb r2, [r0, 0x16]
_08036850:
	ldr r1, _080368F0 @ =gMoveHitWith
	ldr r5, _080368F4 @ =gActiveBank
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	adds r1, r4, 0
	bl AI_TypeCalc
	ldr r1, [sp]
	ands r1, r0
	cmp r1, 0
	beq _080368D0
	ldr r1, _080368F8 @ =gUnknown_02024C5C
	ldrb r0, [r5]
	adds r0, r1
	ldrb r0, [r0]
	mov r9, r0
	movs r4, 0
	movs r0, 0x64
	adds r1, r6, 0
	muls r1, r0
	mov r8, r1
	ldr r1, _080368FC @ =gBattleMons
	movs r0, 0x58
	mov r2, r9
	muls r2, r0
	adds r0, r2, 0
	adds r5, r0, r1
	adds r7, r5, 0
	adds r7, 0x20
_0803688E:
	ldr r0, _08036900 @ =gEnemyParty
	adds r1, r4, 0
	adds r1, 0xD
	add r0, r8
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	beq _080368CA
	ldrh r1, [r5]
	ldrb r2, [r7]
	bl AI_TypeCalc
	lsls r0, 24
	lsrs r1, r0, 24
	movs r0, 0x2
	ands r1, r0
	cmp r1, 0
	beq _080368CA
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ldr r1, [sp, 0x4]
	bl __modsi3
	cmp r0, 0
	bne _080368CA
	b _08036768
_080368CA:
	adds r4, 0x1
	cmp r4, 0x3
	ble _0803688E
_080368D0:
	adds r6, 0x1
	cmp r6, 0x5
	bgt _080368D8
	b _0803679E
_080368D8:
	movs r0, 0
_080368DA:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080368EC: .4byte gBaseStats
_080368F0: .4byte gMoveHitWith
_080368F4: .4byte gActiveBank
_080368F8: .4byte gUnknown_02024C5C
_080368FC: .4byte gBattleMons
_08036900: .4byte gEnemyParty
	thumb_func_end sub_80366A4

	thumb_func_start AI_ShouldSwitch
AI_ShouldSwitch: @ 8036904
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r6, _080369E0 @ =gBattleMons
	ldr r4, _080369E4 @ =gActiveBank
	ldrb r2, [r4]
	movs r5, 0x58
	adds r0, r2, 0
	muls r0, r5
	adds r1, r6, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080369E8 @ =0x0400e000
	ands r0, r1
	cmp r0, 0
	beq _0803692A
	b _08036AFC
_0803692A:
	ldr r0, _080369EC @ =gStatuses3
	lsls r1, r2, 2
	adds r1, r0
	ldr r1, [r1]
	movs r0, 0x80
	lsls r0, 3
	ands r1, r0
	cmp r1, 0
	beq _0803693E
	b _08036AFC
_0803693E:
	str r1, [sp]
	movs r0, 0xC
	adds r1, r2, 0
	movs r2, 0x17
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08036956
	b _08036AFC
_08036956:
	ldrb r1, [r4]
	str r0, [sp]
	movs r0, 0xC
	movs r2, 0x47
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0803696E
	b _08036AFC
_0803696E:
	str r0, [sp]
	movs r0, 0xE
	movs r1, 0
	movs r2, 0x2A
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	beq _080369A0
	ldrb r0, [r4]
	muls r0, r5
	adds r1, r0, r6
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x8
	bne _08036994
	b _08036AFC
_08036994:
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x8
	bne _080369A0
	b _08036AFC
_080369A0:
	movs r0, 0
	mov r8, r0
	ldr r0, _080369F0 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08036A12
	ldr r4, _080369E4 @ =gActiveBank
	ldrb r7, [r4]
	adds r0, r7, 0
	bl GetBankIdentity
	movs r5, 0x2
	eors r0, r5
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByPlayerAI
	ldr r1, _080369F4 @ =gAbsentBankFlags
	ldrb r1, [r1]
	ldr r2, _080369F8 @ =gBitTable
	lsls r0, 24
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _080369FC
	ldrb r6, [r4]
	b _08036A18
	.align 2, 0
_080369E0: .4byte gBattleMons
_080369E4: .4byte gActiveBank
_080369E8: .4byte 0x0400e000
_080369EC: .4byte gStatuses3
_080369F0: .4byte gBattleTypeFlags
_080369F4: .4byte gAbsentBankFlags
_080369F8: .4byte gBitTable
_080369FC:
	ldrb r0, [r4]
	bl GetBankIdentity
	eors r0, r5
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r6, r0, 24
	b _08036A18
_08036A12:
	ldr r0, _08036AE8 @ =gActiveBank
	ldrb r6, [r0]
	adds r7, r6, 0
_08036A18:
	movs r5, 0
_08036A1A:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08036AEC @ =gEnemyParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08036A7E
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _08036A7E
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _08036A7E
	ldr r1, _08036AF0 @ =gBattlePartyID
	lsls r0, r7, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r5, r0
	beq _08036A7E
	lsls r0, r6, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r5, r0
	beq _08036A7E
	ldr r1, _08036AF4 @ =gSharedMem
	ldr r2, _08036AF8 @ =0x00016068
	adds r0, r7, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r5, r0
	beq _08036A7E
	adds r0, r6, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r5, r0
	beq _08036A7E
	movs r0, 0x1
	add r8, r0
_08036A7E:
	adds r5, 0x1
	cmp r5, 0x5
	ble _08036A1A
	mov r2, r8
	cmp r2, 0
	beq _08036AFC
	bl AI_SwitchIfPerishSong
	lsls r0, 24
	cmp r0, 0
	bne _08036AE4
	bl AI_SwitchIfWonderguard
	lsls r0, 24
	cmp r0, 0
	bne _08036AE4
	bl sub_80361E8
	lsls r0, 24
	cmp r0, 0
	bne _08036AE4
	bl AI_SwitchIfNaturalCure
	lsls r0, 24
	cmp r0, 0
	bne _08036AE4
	movs r0, 0
	bl ai_has_super_effective_move_on_field
	lsls r0, 24
	cmp r0, 0
	bne _08036AFC
	bl AI_AreStatsRaised
	lsls r0, 24
	cmp r0, 0
	bne _08036AFC
	movs r0, 0x8
	movs r1, 0x2
	bl sub_80366A4
	lsls r0, 24
	cmp r0, 0
	bne _08036AE4
	movs r0, 0x4
	movs r1, 0x3
	bl sub_80366A4
	lsls r0, 24
	cmp r0, 0
	beq _08036AFC
_08036AE4:
	movs r0, 0x1
	b _08036AFE
	.align 2, 0
_08036AE8: .4byte gActiveBank
_08036AEC: .4byte gEnemyParty
_08036AF0: .4byte gBattlePartyID
_08036AF4: .4byte gSharedMem
_08036AF8: .4byte 0x00016068
_08036AFC:
	movs r0, 0
_08036AFE:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end AI_ShouldSwitch

	thumb_func_start sub_8036B0C
sub_8036B0C: @ 8036B0C
	push {r4-r6,lr}
	ldr r5, _08036B68 @ =gBattleTypeFlags
	ldrh r1, [r5]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _08036B1C
	b _08036C2E
_08036B1C:
	bl AI_ShouldSwitch
	lsls r0, 24
	cmp r0, 0
	bne _08036B28
	b _08036C24
_08036B28:
	ldr r4, _08036B6C @ =gSharedMem
	ldr r0, _08036B70 @ =gActiveBank
	ldrb r0, [r0]
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 25
	ldr r1, _08036B74 @ =0x000160c8
	adds r0, r1
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x6
	bne _08036BEA
	bl sub_8036CD4
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	bne _08036BD4
	ldrh r1, [r5]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08036B78
	movs r0, 0x1
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	b _08036B8C
	.align 2, 0
_08036B68: .4byte gBattleTypeFlags
_08036B6C: .4byte gSharedMem
_08036B70: .4byte gActiveBank
_08036B74: .4byte 0x000160c8
_08036B78:
	movs r0, 0x1
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0x3
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r5, r0, 24
_08036B8C:
	movs r4, 0
_08036B8E:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _08036C0C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08036BCE
	ldr r1, _08036C10 @ =gBattlePartyID
	lsls r0, r6, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	beq _08036BCE
	lsls r0, r5, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	beq _08036BCE
	ldr r1, _08036C14 @ =gSharedMem
	ldr r2, _08036C18 @ =0x00016068
	adds r0, r6, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r4, r0
	beq _08036BCE
	adds r0, r5, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r4, r0
	bne _08036BD4
_08036BCE:
	adds r4, 0x1
	cmp r4, 0x5
	ble _08036B8E
_08036BD4:
	ldr r0, _08036C1C @ =gActiveBank
	ldrb r0, [r0]
	bl GetBankIdentity
	ldr r1, _08036C14 @ =gSharedMem
	lsls r0, 24
	lsrs r0, 25
	ldr r3, _08036C20 @ =0x000160c8
	adds r0, r3
	adds r0, r1
	strb r4, [r0]
_08036BEA:
	ldr r4, _08036C1C @ =gActiveBank
	ldrb r0, [r4]
	bl GetBankIdentity
	ldr r2, _08036C14 @ =gSharedMem
	ldrb r1, [r4]
	ldr r3, _08036C18 @ =0x00016068
	adds r1, r3
	adds r1, r2
	lsls r0, 24
	lsrs r0, 25
	adds r3, 0x60
	adds r0, r3
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	b _08036C40
	.align 2, 0
_08036C0C: .4byte gEnemyParty
_08036C10: .4byte gBattlePartyID
_08036C14: .4byte gSharedMem
_08036C18: .4byte 0x00016068
_08036C1C: .4byte gActiveBank
_08036C20: .4byte 0x000160c8
_08036C24:
	bl AI_ShouldUseItem
	lsls r0, 24
	cmp r0, 0
	bne _08036C40
_08036C2E:
	ldr r0, _08036C48 @ =gActiveBank
	ldrb r0, [r0]
	movs r2, 0x1
	eors r2, r0
	lsls r2, 8
	movs r0, 0x1
	movs r1, 0
	bl Emitcmd33
_08036C40:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08036C48: .4byte gActiveBank
	thumb_func_end sub_8036B0C

	thumb_func_start sub_8036C4C
sub_8036C4C: @ 8036C4C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r6, r3, 0
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	movs r7, 0
	ldr r0, _08036CD0 @ =gTypeEffectiveness
	mov r10, r0
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _08036CBE
	mov r5, r10
_08036C7A:
	ldrb r0, [r5]
	cmp r0, 0xFE
	beq _08036CB0
	ldr r1, [sp]
	cmp r0, r1
	bne _08036CB0
	ldrb r4, [r5, 0x1]
	cmp r4, r9
	bne _08036C9A
	ldrb r1, [r6]
	ldrb r0, [r5, 0x2]
	muls r0, r1
	movs r1, 0xA
	bl __divsi3
	strb r0, [r6]
_08036C9A:
	cmp r4, r8
	bne _08036CB0
	cmp r9, r8
	beq _08036CB0
	ldrb r1, [r6]
	ldrb r0, [r5, 0x2]
	muls r0, r1
	movs r1, 0xA
	bl __divsi3
	strb r0, [r6]
_08036CB0:
	adds r5, 0x3
	adds r7, 0x3
	mov r1, r10
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08036C7A
_08036CBE:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036CD0: .4byte gTypeEffectiveness
	thumb_func_end sub_8036C4C

	thumb_func_start sub_8036CD4
sub_8036CD4: @ 8036CD4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	ldr r0, _08036D1C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08036D78
	ldr r4, _08036D20 @ =gActiveBank
	ldrb r0, [r4]
	str r0, [sp, 0xC]
	bl GetBankIdentity
	movs r5, 0x2
	eors r0, r5
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByPlayerAI
	ldr r1, _08036D24 @ =gAbsentBankFlags
	ldrb r1, [r1]
	ldr r2, _08036D28 @ =gBitTable
	lsls r0, 24
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08036D2C
	ldrb r4, [r4]
	str r4, [sp, 0x10]
	b _08036D42
	.align 2, 0
_08036D1C: .4byte gBattleTypeFlags
_08036D20: .4byte gActiveBank
_08036D24: .4byte gAbsentBankFlags
_08036D28: .4byte gBitTable
_08036D2C:
	ldrb r0, [r4]
	bl GetBankIdentity
	eors r0, r5
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x10]
_08036D42:
	bl Random
	movs r3, 0x2
	ands r0, r3
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, _08036D70 @ =gAbsentBankFlags
	ldrb r1, [r0]
	ldr r2, _08036D74 @ =gBitTable
	mov r4, r10
	lsls r0, r4, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08036D8C
	eors r4, r3
	lsls r0, r4, 24
	lsrs r0, 24
	mov r10, r0
	b _08036D8C
	.align 2, 0
_08036D70: .4byte gAbsentBankFlags
_08036D74: .4byte gBitTable
_08036D78:
	movs r0, 0
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, _08036E5C @ =gActiveBank
	ldrb r0, [r0]
	str r0, [sp, 0x10]
	str r0, [sp, 0xC]
_08036D8C:
	movs r0, 0
	mov r9, r0
	mov r1, sp
	str r1, [sp, 0x14]
_08036D94:
	movs r2, 0
	str r2, [sp, 0x4]
	movs r3, 0x6
	str r3, [sp, 0x8]
	movs r7, 0
	ldr r4, _08036E60 @ =gBitTable
	mov r8, r4
_08036DA2:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _08036E64 @ =gEnemyParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	beq _08036E7C
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08036E7C
	mov r1, r8
	ldr r0, [r1]
	mov r2, r9
	ands r0, r2
	cmp r0, 0
	bne _08036E7C
	ldr r1, _08036E68 @ =gBattlePartyID
	ldr r3, [sp, 0xC]
	lsls r0, r3, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r7
	beq _08036E7C
	ldr r4, [sp, 0x10]
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r7
	beq _08036E7C
	ldr r1, _08036E6C @ =gSharedMem
	ldr r2, _08036E70 @ =0x00016068
	adds r0, r3, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r7, r0
	beq _08036E7C
	adds r0, r4, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r7, r0
	beq _08036E7C
	ldr r1, _08036E74 @ =gBaseStats
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r5, [r0, 0x6]
	ldrb r6, [r0, 0x7]
	movs r0, 0xA
	ldr r3, [sp, 0x14]
	strb r0, [r3]
	movs r0, 0x58
	mov r4, r10
	muls r4, r0
	ldr r0, _08036E78 @ =gBattleMons
	adds r4, r0
	adds r0, r4, 0
	adds r0, 0x21
	ldrb r0, [r0]
	adds r1, r5, 0
	adds r2, r6, 0
	mov r3, sp
	bl sub_8036C4C
	adds r4, 0x22
	ldrb r0, [r4]
	adds r1, r5, 0
	adds r2, r6, 0
	mov r3, sp
	bl sub_8036C4C
	ldr r2, [sp, 0x4]
	ldr r1, [sp, 0x14]
	ldrb r1, [r1]
	cmp r2, r1
	bcs _08036E8A
	ldr r2, [sp, 0x14]
	ldrb r2, [r2]
	str r2, [sp, 0x4]
	lsls r0, r7, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	b _08036E8A
	.align 2, 0
_08036E5C: .4byte gActiveBank
_08036E60: .4byte gBitTable
_08036E64: .4byte gEnemyParty
_08036E68: .4byte gBattlePartyID
_08036E6C: .4byte gSharedMem
_08036E70: .4byte 0x00016068
_08036E74: .4byte gBaseStats
_08036E78: .4byte gBattleMons
_08036E7C:
	mov r3, r8
	ldr r0, [r3]
	mov r4, r9
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r0, 24
	mov r9, r0
_08036E8A:
	movs r0, 0x4
	add r8, r0
	adds r7, 0x1
	cmp r7, 0x5
	ble _08036DA2
	ldr r1, [sp, 0x8]
	cmp r1, 0x6
	beq _08036EF8
	movs r7, 0
	movs r0, 0x64
	adds r5, r1, 0
	muls r5, r0
	ldr r6, _08036EEC @ =gEnemyParty
_08036EA4:
	adds r1, r7, 0
	adds r1, 0xD
	adds r0, r5, r6
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _08036ECA
	ldr r0, _08036EF0 @ =gActiveBank
	ldrb r1, [r0]
	adds r0, r4, 0
	mov r2, r10
	bl TypeCalc
	movs r1, 0x2
	ands r1, r0
	cmp r1, 0
	bne _08036ED0
_08036ECA:
	adds r7, 0x1
	cmp r7, 0x3
	ble _08036EA4
_08036ED0:
	cmp r7, 0x4
	beq _08036ED6
	b _08036FEE
_08036ED6:
	ldr r2, [sp, 0x8]
	lsls r0, r2, 2
	ldr r3, _08036EF4 @ =gBitTable
	adds r0, r3
	ldr r0, [r0]
	mov r4, r9
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r0, 24
	b _08036EFA
	.align 2, 0
_08036EEC: .4byte gEnemyParty
_08036EF0: .4byte gActiveBank
_08036EF4: .4byte gBitTable
_08036EF8:
	movs r0, 0x3F
_08036EFA:
	mov r9, r0
	mov r1, r9
	cmp r1, 0x3F
	beq _08036F04
	b _08036D94
_08036F04:
	ldr r0, _08037000 @ =gDynamicBasePower
	movs r2, 0
	strh r2, [r0]
	ldr r0, _08037004 @ =gSharedMem
	ldr r3, _08037008 @ =0x0001601c
	adds r1, r0, r3
	strb r2, [r1]
	ldr r4, _0803700C @ =0x0001601f
	adds r0, r4
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, _08037010 @ =gBattleMoveFlags
	strb r2, [r0]
	ldr r0, _08037014 @ =gCritMultiplier
	strb r1, [r0]
	movs r0, 0
	str r0, [sp, 0x4]
	movs r1, 0x6
	str r1, [sp, 0x8]
	movs r7, 0
_08036F2C:
	movs r0, 0x64
	adds r6, r7, 0
	muls r6, r0
	ldr r2, _08037018 @ =gEnemyParty
	adds r4, r6, r2
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	adds r3, r7, 0x1
	str r3, [sp, 0x18]
	cmp r0, 0
	beq _08036FE8
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08036FE8
	ldr r1, _0803701C @ =gBattlePartyID
	ldr r4, [sp, 0xC]
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r7
	beq _08036FE8
	ldr r2, [sp, 0x10]
	lsls r0, r2, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r7
	beq _08036FE8
	ldr r1, _08037004 @ =gSharedMem
	ldr r3, _08037020 @ =0x00016068
	adds r0, r4, r3
	adds r0, r1
	ldrb r0, [r0]
	cmp r7, r0
	beq _08036FE8
	adds r0, r2, r3
	adds r0, r1
	ldrb r0, [r0]
	cmp r7, r0
	beq _08036FE8
	movs r5, 0
	mov r9, r6
	ldr r4, _08037024 @ =gBattleMoveDamage
	mov r8, r4
	ldr r6, _08037028 @ =gActiveBank
_08036F90:
	adds r1, r5, 0
	adds r1, 0xD
	ldr r0, _08037018 @ =gEnemyParty
	add r0, r9
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0
	mov r1, r8
	str r0, [r1]
	cmp r4, 0
	beq _08036FCC
	ldr r0, _0803702C @ =gBattleMoves
	lsls r1, r4, 1
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0x1
	beq _08036FCC
	ldrb r0, [r6]
	mov r1, r10
	bl AI_CalcDmg
	ldrb r1, [r6]
	adds r0, r4, 0
	mov r2, r10
	bl TypeCalc
_08036FCC:
	mov r2, r8
	ldr r0, [r2]
	ldr r3, [sp, 0x4]
	cmp r3, r0
	bge _08036FE2
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	lsls r0, r7, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
_08036FE2:
	adds r5, 0x1
	cmp r5, 0x3
	ble _08036F90
_08036FE8:
	ldr r7, [sp, 0x18]
	cmp r7, 0x5
	ble _08036F2C
_08036FEE:
	ldr r0, [sp, 0x8]
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08037000: .4byte gDynamicBasePower
_08037004: .4byte gSharedMem
_08037008: .4byte 0x0001601c
_0803700C: .4byte 0x0001601f
_08037010: .4byte gBattleMoveFlags
_08037014: .4byte gCritMultiplier
_08037018: .4byte gEnemyParty
_0803701C: .4byte gBattlePartyID
_08037020: .4byte 0x00016068
_08037024: .4byte gBattleMoveDamage
_08037028: .4byte gActiveBank
_0803702C: .4byte gBattleMoves
	thumb_func_end sub_8036CD4

	thumb_func_start ai_identify_item_effect
ai_identify_item_effect: @ 8037030
	push {r4,lr}
	adds r2, r1, 0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bne _08037040
	movs r0, 0x1
	b _08037086
_08037040:
	ldrb r1, [r2, 0x4]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0803704E
	movs r0, 0x2
	b _08037086
_0803704E:
	ldrb r4, [r2, 0x3]
	movs r3, 0x3F
	adds r0, r3, 0
	ands r0, r4
	cmp r0, 0
	beq _0803705E
	movs r0, 0x3
	b _08037086
_0803705E:
	ldrb r1, [r2]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _08037074
	ldrb r0, [r2, 0x1]
	cmp r0, 0
	bne _08037074
	ldrb r0, [r2, 0x2]
	cmp r0, 0
	beq _08037078
_08037074:
	movs r0, 0x4
	b _08037086
_08037078:
	movs r0, 0x80
	ands r0, r4
	cmp r0, 0
	bne _08037084
	movs r0, 0x6
	b _08037086
_08037084:
	movs r0, 0x5
_08037086:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ai_identify_item_effect

	thumb_func_start AI_ShouldUseItem
AI_ShouldUseItem: @ 803708C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r0, 0
	str r0, [sp]
	mov r8, r0
	mov r9, r0
_080370A0:
	movs r0, 0x64
	mov r1, r9
	muls r1, r0
	ldr r0, _08037170 @ =gEnemyParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _080370DC
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _080370DC
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _080370DC
	ldr r0, [sp]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
_080370DC:
	movs r1, 0x1
	add r9, r1
	mov r2, r9
	cmp r2, 0x5
	ble _080370A0
	movs r3, 0
	mov r9, r3
_080370EA:
	ldr r4, _08037174 @ =gSharedMem + 0x16A00
	mov r0, r9
	cmp r0, 0
	beq _08037106
	adds r0, r4, 0
	adds r0, 0x2C
	ldrb r0, [r0]
	mov r1, r9
	subs r0, r1
	adds r0, 0x1
	ldr r2, [sp]
	cmp r2, r0
	ble _08037106
	b _080374EC
_08037106:
	mov r3, r9
	lsls r1, r3, 1
	adds r0, r4, 0
	adds r0, 0x24
	adds r0, r1, r0
	ldrh r0, [r0]
	mov r10, r0
	str r1, [sp, 0x4]
	cmp r0, 0
	bne _0803711C
	b _080374EC
_0803711C:
	ldr r1, _08037178 @ =gItemEffectTable
	subs r0, 0xD
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	cmp r1, 0
	bne _0803712C
	b _080374EC
_0803712C:
	adds r5, r1, 0
	mov r0, r10
	cmp r0, 0xAF
	bne _08037136
	ldr r5, _0803717C @ =gSaveBlock1 + 0x3676
_08037136:
	mov r1, r10
	lsls r0, r1, 24
	lsrs r0, 24
	adds r1, r5, 0
	bl ai_identify_item_effect
	ldr r2, _08037180 @ =0xfffe9600
	adds r4, r2
	ldr r3, _08037184 @ =gActiveBank
	ldrb r1, [r3]
	lsrs r1, 1
	ldr r2, _08037188 @ =0x000160d8
	adds r1, r2
	adds r1, r4
	strb r0, [r1]
	ldrb r0, [r3]
	lsrs r0, 1
	adds r0, r2
	adds r0, r4
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r0, 0x5
	bls _08037166
	b _080374A8
_08037166:
	lsls r0, 2
	ldr r1, _0803718C @ =_08037190
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08037170: .4byte gEnemyParty
_08037174: .4byte gSharedMem + 0x16A00
_08037178: .4byte gItemEffectTable
_0803717C: .4byte gSaveBlock1 + 0x3676
_08037180: .4byte 0xfffe9600
_08037184: .4byte gActiveBank
_08037188: .4byte 0x000160d8
_0803718C: .4byte _08037190
	.align 2, 0
_08037190:
	.4byte _080371A8
	.4byte _080371D0
	.4byte _0803721C
	.4byte _08037388
	.4byte _08037468
	.4byte _080374F8
_080371A8:
	ldr r2, _080371C8 @ =gBattleMons
	ldr r0, _080371CC @ =gActiveBank
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r1, [r0, 0x2C]
	ldrh r0, [r0, 0x28]
	lsrs r1, 2
	cmp r0, r1
	bcc _080371C0
	b _080374A8
_080371C0:
	cmp r0, 0
	bne _080371C6
	b _080374A8
_080371C6:
	b _08037450
	.align 2, 0
_080371C8: .4byte gBattleMons
_080371CC: .4byte gActiveBank
_080371D0:
	mov r0, r10
	movs r1, 0x4
	movs r2, 0x4
	bl GetItemEffectParamOffset
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080371E4
	b _080374A8
_080371E4:
	ldr r2, _08037214 @ =gBattleMons
	ldr r0, _08037218 @ =gActiveBank
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r1, r0, r2
	ldrh r2, [r1, 0x28]
	cmp r2, 0
	bne _080371F8
	b _080374A8
_080371F8:
	ldrh r3, [r1, 0x2C]
	lsrs r0, r3, 2
	cmp r2, r0
	bcs _08037202
	b _08037496
_08037202:
	adds r0, r2, 0
	subs r0, r3, r0
	adds r1, r5, r4
	ldrb r1, [r1]
	cmp r0, r1
	bgt _08037210
	b _080374A8
_08037210:
	b _08037496
	.align 2, 0
_08037214: .4byte gBattleMons
_08037218: .4byte gActiveBank
_0803721C:
	ldr r2, _08037378 @ =gSharedMem
	ldr r3, _0803737C @ =gActiveBank
	ldrb r0, [r3]
	lsrs r0, 1
	ldr r6, _08037380 @ =0x000160da
	adds r0, r6
	adds r0, r2
	movs r1, 0
	mov r12, r1
	movs r1, 0
	strb r1, [r0]
	ldrb r1, [r5, 0x3]
	movs r7, 0x20
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08037264
	ldr r1, _08037384 @ =gBattleMons
	ldrb r4, [r3]
	movs r0, 0x58
	muls r0, r4
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	beq _08037264
	lsrs r1, r4, 1
	adds r1, r6
	adds r1, r2
	ldrb r0, [r1]
	orrs r0, r7
	strb r0, [r1]
	movs r0, 0x1
	mov r8, r0
_08037264:
	ldrb r1, [r5, 0x3]
	movs r6, 0x10
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080372A0
	ldr r1, _08037384 @ =gBattleMons
	ldrb r4, [r3]
	movs r0, 0x58
	muls r0, r4
	adds r1, 0x4C
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _0803728E
	movs r0, 0x80
	ands r1, r0
	cmp r1, 0
	beq _080372A0
_0803728E:
	lsrs r1, r4, 1
	ldr r0, _08037380 @ =0x000160da
	adds r1, r0
	adds r1, r2
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	movs r1, 0x1
	mov r8, r1
_080372A0:
	ldrb r1, [r5, 0x3]
	movs r6, 0x8
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080372D4
	ldr r1, _08037384 @ =gBattleMons
	ldrb r4, [r3]
	movs r0, 0x58
	muls r0, r4
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080372D4
	lsrs r0, r4, 1
	ldr r1, _08037380 @ =0x000160da
	adds r0, r1
	adds r0, r2
	ldrb r1, [r0]
	orrs r1, r6
	strb r1, [r0]
	movs r0, 0x1
	mov r8, r0
_080372D4:
	ldrb r1, [r5, 0x3]
	movs r6, 0x4
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08037308
	ldr r1, _08037384 @ =gBattleMons
	ldrb r4, [r3]
	movs r0, 0x58
	muls r0, r4
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08037308
	lsrs r0, r4, 1
	ldr r1, _08037380 @ =0x000160da
	adds r0, r1
	adds r0, r2
	ldrb r1, [r0]
	orrs r1, r6
	strb r1, [r0]
	movs r0, 0x1
	mov r8, r0
_08037308:
	ldrb r1, [r5, 0x3]
	movs r6, 0x2
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803733C
	ldr r1, _08037384 @ =gBattleMons
	ldrb r4, [r3]
	movs r0, 0x58
	muls r0, r4
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0803733C
	lsrs r0, r4, 1
	ldr r1, _08037380 @ =0x000160da
	adds r0, r1
	adds r0, r2
	ldrb r1, [r0]
	orrs r1, r6
	strb r1, [r0]
	movs r0, 0x1
	mov r8, r0
_0803733C:
	ldrb r1, [r5, 0x3]
	movs r4, 0x1
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0803734A
	b _080374A8
_0803734A:
	ldr r1, _08037384 @ =gBattleMons
	ldrb r3, [r3]
	movs r0, 0x58
	muls r0, r3
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _08037362
	b _080374A8
_08037362:
	lsrs r0, r3, 1
	ldr r1, _08037380 @ =0x000160da
	adds r0, r1
	adds r0, r2
	ldrb r1, [r0]
	orrs r1, r4
	strb r1, [r0]
	movs r2, 0x1
	mov r8, r2
	b _080374AE
	.align 2, 0
_08037378: .4byte gSharedMem
_0803737C: .4byte gActiveBank
_08037380: .4byte 0x000160da
_08037384: .4byte gBattleMons
_08037388:
	ldr r6, _08037458 @ =gSharedMem
	ldr r4, _0803745C @ =gActiveBank
	ldrb r0, [r4]
	lsrs r0, 1
	ldr r3, _08037460 @ =0x000160da
	adds r0, r3
	adds r0, r6
	movs r1, 0
	mov r12, r1
	movs r1, 0
	strb r1, [r0]
	ldr r1, _08037464 @ =gDisableStructs
	ldrb r2, [r4]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x16]
	cmp r0, 0
	beq _080374A8
	ldrb r1, [r5]
	movs r7, 0xF
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _080373CA
	lsrs r0, r2, 1
	adds r0, r3
	adds r0, r6
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
_080373CA:
	ldrb r1, [r5, 0x1]
	movs r2, 0xF0
	mov r8, r2
	mov r0, r8
	ands r0, r1
	cmp r0, 0
	beq _080373E8
	ldrb r0, [r4]
	lsrs r0, 1
	adds r0, r3
	adds r0, r6
	ldrb r1, [r0]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
_080373E8:
	ldrb r1, [r5, 0x1]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _08037402
	ldrb r0, [r4]
	lsrs r0, 1
	adds r0, r3
	adds r0, r6
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_08037402:
	ldrb r1, [r5, 0x2]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _0803741C
	ldrb r0, [r4]
	lsrs r0, 1
	adds r0, r3
	adds r0, r6
	ldrb r1, [r0]
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0]
_0803741C:
	ldrb r1, [r5, 0x2]
	mov r0, r8
	ands r0, r1
	cmp r0, 0
	beq _08037436
	ldrb r0, [r4]
	lsrs r0, 1
	adds r0, r3
	adds r0, r6
	ldrb r1, [r0]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0]
_08037436:
	ldrb r1, [r5]
	movs r0, 0x30
	ands r0, r1
	cmp r0, 0
	beq _08037450
	ldrb r0, [r4]
	lsrs r0, 1
	adds r0, r3
	adds r0, r6
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
_08037450:
	movs r3, 0x1
	mov r8, r3
	b _080374AE
	.align 2, 0
_08037458: .4byte gSharedMem
_0803745C: .4byte gActiveBank
_08037460: .4byte 0x000160da
_08037464: .4byte gDisableStructs
_08037468:
	ldr r4, _0803749C @ =gActiveBank
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _080374A0 @ =gDisableStructs
	ldrb r1, [r4]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x16]
	cmp r0, 0
	beq _080374A8
	ldr r0, _080374A4 @ =gSideTimer
	lsls r1, r3, 1
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x2]
	cmp r0, 0
	bne _080374A8
_08037496:
	movs r0, 0x1
	mov r8, r0
	b _080374AE
	.align 2, 0
_0803749C: .4byte gActiveBank
_080374A0: .4byte gDisableStructs
_080374A4: .4byte gSideTimer
_080374A8:
	mov r1, r8
	cmp r1, 0
	beq _080374EC
_080374AE:
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl Emitcmd33
	ldr r1, _080374DC @ =gSharedMem
	ldr r0, _080374E0 @ =gActiveBank
	ldrb r0, [r0]
	lsrs r0, 1
	lsls r0, 1
	ldr r2, _080374E4 @ =0x000160d4
	adds r0, r2
	adds r0, r1
	movs r2, 0
	mov r3, r10
	strb r3, [r0]
	ldr r0, _080374E8 @ =0x00016a24
	adds r1, r0
	ldr r3, [sp, 0x4]
	adds r1, r3, r1
	strh r2, [r1]
	mov r0, r8
	b _080374FA
	.align 2, 0
_080374DC: .4byte gSharedMem
_080374E0: .4byte gActiveBank
_080374E4: .4byte 0x000160d4
_080374E8: .4byte 0x00016a24
_080374EC:
	movs r0, 0x1
	add r9, r0
	mov r1, r9
	cmp r1, 0x3
	bgt _080374F8
	b _080370EA
_080374F8:
	movs r0, 0
_080374FA:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end AI_ShouldUseItem

	.align 2, 0 @ Don't pad with nop.
