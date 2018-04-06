	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

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

	thumb_func_start ShouldUseItem
ShouldUseItem: @ 803708C
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
	ldr r3, _08037184 @ =gActiveBattler
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
_08037184: .4byte gActiveBattler
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
	ldr r0, _080371CC @ =gActiveBattler
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
_080371CC: .4byte gActiveBattler
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
	ldr r0, _08037218 @ =gActiveBattler
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
_08037218: .4byte gActiveBattler
_0803721C:
	ldr r2, _08037378 @ =gSharedMem
	ldr r3, _0803737C @ =gActiveBattler
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
_0803737C: .4byte gActiveBattler
_08037380: .4byte 0x000160da
_08037384: .4byte gBattleMons
_08037388:
	ldr r6, _08037458 @ =gSharedMem
	ldr r4, _0803745C @ =gActiveBattler
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
_0803745C: .4byte gActiveBattler
_08037460: .4byte 0x000160da
_08037464: .4byte gDisableStructs
_08037468:
	ldr r4, _0803749C @ =gActiveBattler
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
	ldr r0, _080374A4 @ =gSideTimers
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
_0803749C: .4byte gActiveBattler
_080374A0: .4byte gDisableStructs
_080374A4: .4byte gSideTimers
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
	ldr r0, _080374E0 @ =gActiveBattler
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
_080374E0: .4byte gActiveBattler
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
	thumb_func_end ShouldUseItem

	.align 2, 0 @ Don't pad with nop.
