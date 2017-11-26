	.include "constants/gba_constants.inc"

	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start ExecuteTableBasedItemEffect_
ExecuteTableBasedItemEffect_: @ 803E18C
	push {r4,lr}
	sub sp, 0x4
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	movs r4, 0
	str r4, [sp]
	bl sub_803E1B0
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ExecuteTableBasedItemEffect_

	thumb_func_start sub_803E1B0
sub_803E1B0: @ 803E1B0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x3C
	mov r8, r0
	ldr r0, [sp, 0x5C]
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0x8]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0xC]
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x10]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x14]
	movs r0, 0x1
	str r0, [sp, 0x1C]
	movs r1, 0x6
	str r1, [sp, 0x24]
	movs r2, 0
	str r2, [sp, 0x2C]
	movs r3, 0x4
	str r3, [sp, 0x34]
	mov r0, r8
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _0803E240
	ldr r0, _0803E21C @ =gMain
	ldr r4, _0803E220 @ =0x0000043d
	adds r0, r4
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803E22C
	ldr r2, _0803E224 @ =gEnigmaBerries
	ldr r0, _0803E228 @ =gBankInMenu
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x7]
	b _0803E248
	.align 2, 0
_0803E21C: .4byte gMain
_0803E220: .4byte 0x0000043d
_0803E224: .4byte gEnigmaBerries
_0803E228: .4byte gBankInMenu
_0803E22C:
	ldr r0, _0803E238 @ =gSaveBlock1
	ldr r5, _0803E23C @ =0x00003688
	adds r0, r5
	ldrb r0, [r0]
	b _0803E248
	.align 2, 0
_0803E238: .4byte gSaveBlock1
_0803E23C: .4byte 0x00003688
_0803E240:
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r0, 24
_0803E248:
	str r0, [sp, 0x30]
	ldr r1, _0803E2A4 @ =gStringBank
	ldr r0, _0803E2A8 @ =gBankInMenu
	ldrb r2, [r0]
	strb r2, [r1]
	ldr r0, _0803E2AC @ =gMain
	ldr r1, _0803E2B0 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _0803E2E8
	ldr r0, _0803E2B4 @ =gActiveBank
	strb r2, [r0]
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	negs r1, r0
	orrs r1, r0
	lsrs r1, 31
	str r1, [sp, 0x18]
	ldr r0, _0803E2B8 @ =gNoOfAllBanks
	ldr r4, [sp, 0x8]
	subs r4, 0xD
	ldrb r0, [r0]
	cmp r1, r0
	bge _0803E2F4
	ldr r2, _0803E2BC @ =gBattlePartyID
	lsls r0, r1, 1
	adds r0, r2
	ldrh r3, [r0]
	ldr r5, [sp, 0xC]
	lsls r0, r5, 16
	lsrs r1, r0, 16
	adds r5, r0, 0
	cmp r3, r1
	bne _0803E2C0
	ldr r0, [sp, 0x18]
	str r0, [sp, 0x34]
	b _0803E2F4
	.align 2, 0
_0803E2A4: .4byte gStringBank
_0803E2A8: .4byte gBankInMenu
_0803E2AC: .4byte gMain
_0803E2B0: .4byte 0x0000043d
_0803E2B4: .4byte gActiveBank
_0803E2B8: .4byte gNoOfAllBanks
_0803E2BC: .4byte gBattlePartyID
_0803E2C0:
	ldr r1, [sp, 0x18]
	adds r1, 0x2
	str r1, [sp, 0x18]
	ldr r0, _0803E2E4 @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r1, r0
	bge _0803E2F4
	lsls r0, r1, 1
	adds r0, r2
	ldrh r1, [r0]
	lsrs r0, r5, 16
	cmp r1, r0
	bne _0803E2C0
	ldr r2, [sp, 0x18]
	lsls r0, r2, 24
	lsrs r0, 24
	str r0, [sp, 0x34]
	b _0803E2F4
	.align 2, 0
_0803E2E4: .4byte gNoOfAllBanks
_0803E2E8:
	ldr r0, _0803E310 @ =gActiveBank
	strb r1, [r0]
	movs r3, 0x4
	str r3, [sp, 0x34]
	ldr r4, [sp, 0x8]
	subs r4, 0xD
_0803E2F4:
	lsls r0, r4, 16
	lsrs r0, 16
	cmp r0, 0xA5
	bhi _0803E36C
	ldr r1, _0803E314 @ =gItemEffectTable
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	bne _0803E318
	ldr r4, [sp, 0x8]
	cmp r4, 0xAF
	beq _0803E31E
	b _0803E36C
	.align 2, 0
_0803E310: .4byte gActiveBank
_0803E314: .4byte gItemEffectTable
_0803E318:
	ldr r5, [sp, 0x8]
	cmp r5, 0xAF
	bne _0803E372
_0803E31E:
	ldr r0, _0803E340 @ =gMain
	ldr r1, _0803E344 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803E350
	ldr r0, _0803E348 @ =gActiveBank
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	ldr r1, _0803E34C @ =gUnknown_02024DF8
	adds r0, r1
	b _0803E372
	.align 2, 0
_0803E340: .4byte gMain
_0803E344: .4byte 0x0000043d
_0803E348: .4byte gActiveBank
_0803E34C: .4byte gUnknown_02024DF8
_0803E350:
	ldr r2, _0803E358 @ =gSaveBlock1 + 0x3676
	str r2, [sp, 0x20]
	b _0803E374
	.align 2, 0
_0803E358: .4byte gSaveBlock1 + 0x3676
_0803E35C:
	mov r0, r8
	movs r2, 0
	ldr r3, [sp, 0xC]
	bl BeginEvolutionScene
	movs r0, 0
	bl _0803F15C
_0803E36C:
	movs r0, 0x1
	bl _0803F15C
_0803E372:
	str r0, [sp, 0x20]
_0803E374:
	movs r3, 0
	str r3, [sp, 0x18]
_0803E378:
	ldr r4, [sp, 0x18]
	cmp r4, 0x5
	bls _0803E382
	bl _0803F14C
_0803E382:
	lsls r0, r4, 2
	ldr r1, _0803E38C @ =_0803E390
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803E38C: .4byte _0803E390
	.align 2, 0
_0803E390:
	.4byte _0803E3A8
	.4byte _0803E474
	.4byte _0803E508
	.4byte _0803E59C
	.4byte _0803E77C
	.4byte _0803EE1E
_0803E3A8:
	ldr r5, [sp, 0x20]
	ldr r0, [sp, 0x18]
	adds r2, r5, r0
	ldrb r1, [r2]
	movs r0, 0x80
	ands r0, r1
	adds r6, r2, 0
	cmp r0, 0
	beq _0803E3F0
	ldr r0, _0803E460 @ =gMain
	ldr r1, _0803E464 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803E3F0
	ldr r2, [sp, 0x34]
	cmp r2, 0x4
	beq _0803E3F0
	ldr r1, _0803E468 @ =gBattleMons
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0xF0
	lsls r0, 12
	ands r0, r1
	cmp r0, 0
	beq _0803E3F0
	ldr r0, _0803E46C @ =0xfff0ffff
	ands r1, r0
	str r1, [r2]
	movs r3, 0
	str r3, [sp, 0x1C]
_0803E3F0:
	ldrb r1, [r6]
	movs r0, 0x30
	ands r0, r1
	cmp r0, 0
	beq _0803E41E
	ldr r1, _0803E468 @ =gBattleMons
	ldr r0, _0803E470 @ =gActiveBank
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r3, 0x80
	lsls r3, 13
	adds r0, r1, 0
	ands r0, r3
	cmp r0, 0
	bne _0803E41E
	orrs r1, r3
	str r1, [r2]
	movs r4, 0
	str r4, [sp, 0x1C]
_0803E41E:
	ldrb r0, [r6]
	movs r3, 0xF
	ands r3, r0
	cmp r3, 0
	bne _0803E42C
	bl _0803F14C
_0803E42C:
	ldr r6, _0803E468 @ =gBattleMons
	ldr r5, _0803E470 @ =gActiveBank
	ldrb r0, [r5]
	movs r4, 0x58
	muls r0, r4
	adds r1, r0, r6
	ldrb r2, [r1, 0x19]
	movs r0, 0x19
	ldrsb r0, [r1, r0]
	cmp r0, 0xB
	ble _0803E446
	bl _0803F14C
_0803E446:
	adds r0, r2, r3
	strb r0, [r1, 0x19]
	ldrb r0, [r5]
	muls r0, r4
	adds r1, r0, r6
	movs r0, 0x19
	ldrsb r0, [r1, r0]
	cmp r0, 0xC
	bgt _0803E45A
	b _0803E74E
_0803E45A:
	movs r0, 0xC
	strb r0, [r1, 0x19]
	b _0803E74E
	.align 2, 0
_0803E460: .4byte gMain
_0803E464: .4byte 0x0000043d
_0803E468: .4byte gBattleMons
_0803E46C: .4byte 0xfff0ffff
_0803E470: .4byte gActiveBank
_0803E474:
	ldr r0, [sp, 0x20]
	ldr r1, [sp, 0x18]
	adds r2, r0, r1
	ldrb r1, [r2]
	movs r0, 0xF0
	ands r0, r1
	lsls r3, r0, 24
	adds r6, r2, 0
	cmp r3, 0
	beq _0803E4BA
	ldr r7, _0803E500 @ =gBattleMons
	ldr r5, _0803E504 @ =gActiveBank
	ldrb r0, [r5]
	movs r4, 0x58
	muls r0, r4
	adds r1, r0, r7
	ldrb r2, [r1, 0x1A]
	movs r0, 0x1A
	ldrsb r0, [r1, r0]
	cmp r0, 0xB
	bgt _0803E4BA
	lsrs r0, r3, 28
	adds r0, r2, r0
	strb r0, [r1, 0x1A]
	ldrb r0, [r5]
	muls r0, r4
	adds r1, r0, r7
	movs r0, 0x1A
	ldrsb r0, [r1, r0]
	cmp r0, 0xC
	ble _0803E4B6
	movs r0, 0xC
	strb r0, [r1, 0x1A]
_0803E4B6:
	movs r2, 0
	str r2, [sp, 0x1C]
_0803E4BA:
	ldrb r0, [r6]
	movs r3, 0xF
	ands r3, r0
	cmp r3, 0
	bne _0803E4C8
	bl _0803F14C
_0803E4C8:
	ldr r6, _0803E500 @ =gBattleMons
	ldr r5, _0803E504 @ =gActiveBank
	ldrb r0, [r5]
	movs r4, 0x58
	muls r0, r4
	adds r1, r0, r6
	ldrb r2, [r1, 0x1B]
	movs r0, 0x1B
	ldrsb r0, [r1, r0]
	cmp r0, 0xB
	ble _0803E4E2
	bl _0803F14C
_0803E4E2:
	adds r0, r2, r3
	strb r0, [r1, 0x1B]
	ldrb r0, [r5]
	muls r0, r4
	adds r1, r0, r6
	movs r0, 0x1B
	ldrsb r0, [r1, r0]
	cmp r0, 0xC
	ble _0803E4F8
	movs r0, 0xC
	strb r0, [r1, 0x1B]
_0803E4F8:
	movs r3, 0
	str r3, [sp, 0x1C]
	bl _0803F14C
	.align 2, 0
_0803E500: .4byte gBattleMons
_0803E504: .4byte gActiveBank
_0803E508:
	ldr r4, [sp, 0x20]
	ldr r5, [sp, 0x18]
	adds r2, r4, r5
	ldrb r1, [r2]
	movs r0, 0xF0
	ands r0, r1
	lsls r3, r0, 24
	adds r6, r2, 0
	cmp r3, 0
	beq _0803E54E
	ldr r7, _0803E594 @ =gBattleMons
	ldr r5, _0803E598 @ =gActiveBank
	ldrb r0, [r5]
	movs r4, 0x58
	muls r0, r4
	adds r1, r0, r7
	ldrb r2, [r1, 0x1E]
	movs r0, 0x1E
	ldrsb r0, [r1, r0]
	cmp r0, 0xB
	bgt _0803E54E
	lsrs r0, r3, 28
	adds r0, r2, r0
	strb r0, [r1, 0x1E]
	ldrb r0, [r5]
	muls r0, r4
	adds r1, r0, r7
	movs r0, 0x1E
	ldrsb r0, [r1, r0]
	cmp r0, 0xC
	ble _0803E54A
	movs r0, 0xC
	strb r0, [r1, 0x1E]
_0803E54A:
	movs r0, 0
	str r0, [sp, 0x1C]
_0803E54E:
	ldrb r0, [r6]
	movs r3, 0xF
	ands r3, r0
	cmp r3, 0
	bne _0803E55C
	bl _0803F14C
_0803E55C:
	ldr r6, _0803E594 @ =gBattleMons
	ldr r5, _0803E598 @ =gActiveBank
	ldrb r0, [r5]
	movs r4, 0x58
	muls r0, r4
	adds r1, r0, r6
	ldrb r2, [r1, 0x1C]
	movs r0, 0x1C
	ldrsb r0, [r1, r0]
	cmp r0, 0xB
	ble _0803E576
	bl _0803F14C
_0803E576:
	adds r0, r2, r3
	strb r0, [r1, 0x1C]
	ldrb r0, [r5]
	muls r0, r4
	adds r1, r0, r6
	movs r0, 0x1C
	ldrsb r0, [r1, r0]
	cmp r0, 0xC
	ble _0803E58C
	movs r0, 0xC
	strb r0, [r1, 0x1C]
_0803E58C:
	movs r1, 0
	str r1, [sp, 0x1C]
	bl _0803F14C
	.align 2, 0
_0803E594: .4byte gBattleMons
_0803E598: .4byte gActiveBank
_0803E59C:
	ldr r3, [sp, 0x20]
	ldr r4, [sp, 0x18]
	adds r2, r3, r4
	ldrb r1, [r2]
	movs r0, 0x80
	ands r0, r1
	adds r6, r2, 0
	cmp r0, 0
	beq _0803E5E4
	ldr r5, _0803E758 @ =gSideTimer
	ldr r4, _0803E75C @ =gActiveBank
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r0, [r1, 0x2]
	cmp r0, 0
	bne _0803E5E4
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	movs r0, 0x5
	strb r0, [r1, 0x2]
	movs r5, 0
	str r5, [sp, 0x1C]
_0803E5E4:
	ldrb r1, [r6]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0803E646
	mov r0, r8
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	cmp r0, 0x64
	beq _0803E646
	ldr r5, _0803E760 @ =gExperienceTables
	mov r0, r8
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	adds r4, 0x1
	lsls r4, 2
	ldr r2, _0803E764 @ =gBaseStats
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x13]
	movs r0, 0xCA
	lsls r0, 1
	muls r0, r1
	adds r4, r0
	adds r4, r5
	ldr r0, [r4]
	str r0, [sp]
	mov r0, r8
	movs r1, 0x19
	mov r2, sp
	bl SetMonData
	mov r0, r8
	bl CalculateMonStats
	movs r0, 0
	str r0, [sp, 0x1C]
_0803E646:
	ldrb r1, [r6]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0803E682
	mov r0, r8
	ldr r1, [sp, 0xC]
	movs r2, 0x7
	ldr r3, [sp, 0x34]
	bl HealStatusConditions
	lsls r0, 24
	cmp r0, 0
	bne _0803E682
	ldr r1, [sp, 0x34]
	cmp r1, 0x4
	beq _0803E67E
	ldr r1, _0803E768 @ =gBattleMons
	movs r0, 0x58
	ldr r3, [sp, 0x34]
	adds r2, r3, 0
	muls r2, r0
	adds r1, 0x50
	adds r2, r1
	ldr r0, [r2]
	ldr r1, _0803E76C @ =0xf7ffffff
	ands r0, r1
	str r0, [r2]
_0803E67E:
	movs r4, 0
	str r4, [sp, 0x1C]
_0803E682:
	ldrb r1, [r6]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0803E6A2
	ldr r2, _0803E770 @ =0x00000f88
	mov r0, r8
	ldr r1, [sp, 0xC]
	ldr r3, [sp, 0x34]
	bl HealStatusConditions
	lsls r0, 24
	cmp r0, 0
	bne _0803E6A2
	movs r5, 0
	str r5, [sp, 0x1C]
_0803E6A2:
	ldrb r1, [r6]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0803E6C2
	mov r0, r8
	ldr r1, [sp, 0xC]
	movs r2, 0x10
	ldr r3, [sp, 0x34]
	bl HealStatusConditions
	lsls r0, 24
	cmp r0, 0
	bne _0803E6C2
	movs r0, 0
	str r0, [sp, 0x1C]
_0803E6C2:
	ldrb r1, [r6]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0803E6E2
	mov r0, r8
	ldr r1, [sp, 0xC]
	movs r2, 0x20
	ldr r3, [sp, 0x34]
	bl HealStatusConditions
	lsls r0, 24
	cmp r0, 0
	bne _0803E6E2
	movs r1, 0
	str r1, [sp, 0x1C]
_0803E6E2:
	ldrb r1, [r6]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803E702
	mov r0, r8
	ldr r1, [sp, 0xC]
	movs r2, 0x40
	ldr r3, [sp, 0x34]
	bl HealStatusConditions
	lsls r0, 24
	cmp r0, 0
	bne _0803E702
	movs r2, 0
	str r2, [sp, 0x1C]
_0803E702:
	ldrb r1, [r6]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0803E710
	bl _0803F14C
_0803E710:
	ldr r0, _0803E774 @ =gMain
	ldr r3, _0803E778 @ =0x0000043d
	adds r0, r3
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0803E724
	bl _0803F14C
_0803E724:
	ldr r4, [sp, 0x34]
	cmp r4, 0x4
	bne _0803E72E
	bl _0803F14C
_0803E72E:
	ldr r1, _0803E768 @ =gBattleMons
	movs r0, 0x58
	muls r0, r4
	adds r1, 0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0803E746
	bl _0803F14C
_0803E746:
	movs r0, 0x8
	negs r0, r0
	ands r1, r0
	str r1, [r2]
_0803E74E:
	movs r5, 0
	str r5, [sp, 0x1C]
	bl _0803F14C
	.align 2, 0
_0803E758: .4byte gSideTimer
_0803E75C: .4byte gActiveBank
_0803E760: .4byte gExperienceTables
_0803E764: .4byte gBaseStats
_0803E768: .4byte gBattleMons
_0803E76C: .4byte 0xf7ffffff
_0803E770: .4byte 0x00000f88
_0803E774: .4byte gMain
_0803E778: .4byte 0x0000043d
_0803E77C:
	ldr r1, [sp, 0x20]
	ldr r2, [sp, 0x18]
	adds r0, r1, r2
	ldrb r0, [r0]
	mov r10, r0
	movs r0, 0x20
	mov r3, r10
	ands r0, r3
	cmp r0, 0
	beq _0803E854
	movs r0, 0xDF
	ands r3, r0
	mov r10, r3
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	ldr r1, _0803E880 @ =gUnknown_08208238
	ldr r4, [sp, 0x10]
	adds r1, r4, r1
	ldrb r1, [r1]
	ands r0, r1
	lsls r1, r4, 1
	lsrs r0, r1
	str r0, [sp]
	adds r5, r4, 0
	adds r5, 0xD
	mov r0, r8
	adds r1, r5, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	ldr r2, [sp, 0x10]
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x28]
	ldr r0, [sp]
	cmp r0, 0x2
	bhi _0803E854
	ldr r0, [sp, 0x28]
	cmp r0, 0x4
	bls _0803E854
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	ldr r1, _0803E884 @ =gUnknown_08208240
	ldr r2, [sp, 0x10]
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r0, r1
	str r0, [sp]
	mov r0, r8
	movs r1, 0x15
	mov r2, sp
	bl SetMonData
	mov r0, r8
	adds r1, r5, 0
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	ldr r1, [sp]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, [sp, 0x10]
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	ldr r3, [sp, 0x28]
	subs r0, r3
	str r0, [sp]
	ldr r4, [sp, 0x10]
	adds r4, 0x11
	mov r0, r8
	adds r1, r4, 0
	movs r2, 0
	bl GetMonData
	ldr r1, [sp]
	adds r0, r1
	str r0, [sp]
	mov r0, r8
	adds r1, r4, 0
	mov r2, sp
	bl SetMonData
	movs r4, 0
	str r4, [sp, 0x1C]
_0803E854:
	movs r5, 0
	str r5, [sp, 0x28]
	mov r0, r10
	cmp r0, 0
	bne _0803E862
	bl _0803F14C
_0803E862:
	movs r0, 0x1
	mov r1, r10
	ands r0, r1
	cmp r0, 0
	bne _0803E86E
	b _0803EE0A
_0803E86E:
	ldr r2, [sp, 0x28]
	cmp r2, 0x7
	bls _0803E876
	b _0803EE0A
_0803E876:
	lsls r0, r2, 2
	ldr r1, _0803E888 @ =_0803E88C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803E880: .4byte gUnknown_08208238
_0803E884: .4byte gUnknown_08208240
_0803E888: .4byte _0803E88C
	.align 2, 0
_0803E88C:
	.4byte _0803E8AC
	.4byte _0803E8AC
	.4byte _0803E934
	.4byte _0803EB5C
	.4byte _0803EE0A
	.4byte _0803EE0A
	.4byte _0803EE0A
	.4byte _0803EDF4
_0803E8AC:
	mov r0, r8
	bl GetMonEVCount
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _0803E8EC @ =0x000001fd
	cmp r5, r0
	bls _0803E8BE
	b _0803E36C
_0803E8BE:
	ldr r0, _0803E8F0 @ =gUnknown_082082F2
	ldr r3, [sp, 0x28]
	adds r0, r3, r0
	ldrb r1, [r0]
	mov r0, r8
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	str r1, [sp]
	cmp r1, 0x63
	bls _0803E8D8
	b _0803EE0A
_0803E8D8:
	ldr r4, [sp, 0x20]
	ldr r2, [sp, 0x24]
	adds r0, r4, r2
	ldrb r0, [r0]
	adds r1, r0
	cmp r1, 0x64
	bls _0803E8F4
	adds r0, 0x64
	subs r4, r0, r1
	b _0803E8F6
	.align 2, 0
_0803E8EC: .4byte 0x000001fd
_0803E8F0: .4byte gUnknown_082082F2
_0803E8F4:
	adds r4, r0, 0
_0803E8F6:
	adds r1, r5, r4
	movs r0, 0xFF
	lsls r0, 1
	cmp r1, r0
	bls _0803E904
	adds r0, r4, r0
	subs r4, r0, r1
_0803E904:
	ldr r0, [sp]
	adds r0, r4
	str r0, [sp]
	ldr r0, _0803E930 @ =gUnknown_082082F2
	ldr r3, [sp, 0x28]
	adds r0, r3, r0
	ldrb r1, [r0]
	mov r0, r8
	mov r2, sp
	bl SetMonData
	mov r0, r8
	bl CalculateMonStats
	ldr r0, [sp, 0x24]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x24]
	movs r4, 0
	str r4, [sp, 0x1C]
	b _0803EE0A
	.align 2, 0
_0803E930: .4byte gUnknown_082082F2
_0803E934:
	movs r0, 0x10
	mov r5, r10
	ands r0, r5
	cmp r0, 0
	beq _0803E9F4
	mov r0, r8
	movs r1, 0x39
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _0803E954
	ldr r0, [sp, 0x24]
	adds r0, 0x1
	lsls r0, 24
	b _0803EC9E
_0803E954:
	ldr r0, _0803E99C @ =gMain
	ldr r1, _0803E9A0 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r4, 0x2
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803EA0A
	ldr r2, [sp, 0x34]
	cmp r2, 0x4
	beq _0803E9B4
	ldr r2, _0803E9A4 @ =gAbsentBankFlags
	ldr r1, _0803E9A8 @ =gBitTable
	ldr r3, [sp, 0x34]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r0]
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	ldr r1, _0803E9AC @ =gBattlePartyID
	lsls r0, r3, 1
	adds r0, r1
	ldrb r0, [r0]
	bl pokemon_order_func
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, [sp, 0x34]
	bl CopyPlayerPartyMonToBattleData
	ldr r0, _0803E9B0 @ =gActiveBank
	ldrb r0, [r0]
	b _0803E9CC
	.align 2, 0
_0803E99C: .4byte gMain
_0803E9A0: .4byte 0x0000043d
_0803E9A4: .4byte gAbsentBankFlags
_0803E9A8: .4byte gBitTable
_0803E9AC: .4byte gBattlePartyID
_0803E9B0: .4byte gActiveBank
_0803E9B4:
	ldr r3, _0803E9E4 @ =gAbsentBankFlags
	ldr r1, _0803E9E8 @ =gBitTable
	ldr r2, _0803E9EC @ =gActiveBank
	ldrb r0, [r2]
	eors r0, r4
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldrb r0, [r3]
	bics r0, r1
	strb r0, [r3]
	ldrb r0, [r2]
_0803E9CC:
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _0803EA0A
	ldr r1, _0803E9F0 @ =gBattleResults
	ldrb r0, [r1, 0x4]
	cmp r0, 0xFE
	bhi _0803EA0A
	adds r0, 0x1
	strb r0, [r1, 0x4]
	b _0803EA0A
	.align 2, 0
_0803E9E4: .4byte gAbsentBankFlags
_0803E9E8: .4byte gBitTable
_0803E9EC: .4byte gActiveBank
_0803E9F0: .4byte gBattleResults
_0803E9F4:
	mov r0, r8
	movs r1, 0x39
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	bne _0803EA0A
	ldr r0, [sp, 0x24]
	adds r0, 0x1
	lsls r0, 24
	b _0803EC9E
_0803EA0A:
	ldr r1, [sp, 0x24]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x24]
	ldr r4, [sp, 0x20]
	adds r1, r4, r1
	ldrb r1, [r1]
	str r1, [sp]
	adds r0, r1, 0
	cmp r0, 0xFE
	beq _0803EA4C
	cmp r0, 0xFE
	bhi _0803EA2C
	cmp r0, 0xFD
	beq _0803EA62
	b _0803EA6C
_0803EA2C:
	cmp r1, 0xFF
	bne _0803EA6C
	mov r0, r8
	movs r1, 0x3A
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0x39
	movs r2, 0
	bl GetMonData
	subs r4, r0
	str r4, [sp]
	b _0803EA6C
_0803EA4C:
	mov r0, r8
	movs r1, 0x3A
	movs r2, 0
	bl GetMonData
	lsrs r0, 1
	str r0, [sp]
	cmp r0, 0
	bne _0803EA6C
	movs r0, 0x1
	b _0803EA6A
_0803EA62:
	ldr r0, _0803EB24 @ =gSharedMem
	ldr r5, _0803EB28 @ =0x000160fa
	adds r0, r5
	ldrb r0, [r0]
_0803EA6A:
	str r0, [sp]
_0803EA6C:
	mov r0, r8
	movs r1, 0x3A
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0x39
	movs r2, 0
	bl GetMonData
	cmp r4, r0
	beq _0803EB4C
	ldr r0, [sp, 0x14]
	cmp r0, 0
	bne _0803EB40
	mov r0, r8
	movs r1, 0x39
	movs r2, 0
	bl GetMonData
	ldr r1, [sp]
	adds r0, r1
	str r0, [sp]
	mov r0, r8
	movs r1, 0x3A
	movs r2, 0
	bl GetMonData
	ldr r1, [sp]
	cmp r1, r0
	bls _0803EAB8
	mov r0, r8
	movs r1, 0x3A
	movs r2, 0
	bl GetMonData
	str r0, [sp]
_0803EAB8:
	mov r0, r8
	movs r1, 0x39
	mov r2, sp
	bl SetMonData
	ldr r0, _0803EB2C @ =gMain
	ldr r1, _0803EB30 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803EB48
	ldr r2, [sp, 0x34]
	cmp r2, 0x4
	beq _0803EB48
	ldr r1, _0803EB34 @ =gBattleMons
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldr r1, [sp]
	strh r1, [r0, 0x28]
	movs r0, 0x10
	mov r3, r10
	ands r0, r3
	cmp r0, 0
	bne _0803EB48
	ldr r4, _0803EB38 @ =gActiveBank
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _0803EB48
	ldr r1, _0803EB3C @ =gBattleResults
	ldrb r0, [r1, 0x3]
	cmp r0, 0xFE
	bhi _0803EB08
	adds r0, 0x1
	strb r0, [r1, 0x3]
_0803EB08:
	ldrb r5, [r4]
	add r0, sp, 0x34
	ldrb r0, [r0]
	strb r0, [r4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl EmitGetAttributes
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	strb r5, [r4]
	b _0803EB48
	.align 2, 0
_0803EB24: .4byte gSharedMem
_0803EB28: .4byte 0x000160fa
_0803EB2C: .4byte gMain
_0803EB30: .4byte 0x0000043d
_0803EB34: .4byte gBattleMons
_0803EB38: .4byte gActiveBank
_0803EB3C: .4byte gBattleResults
_0803EB40:
	ldr r1, _0803EB58 @ =gBattleMoveDamage
	ldr r0, [sp]
	negs r0, r0
	str r0, [r1]
_0803EB48:
	movs r1, 0
	str r1, [sp, 0x1C]
_0803EB4C:
	movs r0, 0xEF
	mov r2, r10
	ands r2, r0
	mov r10, r2
	b _0803EE0A
	.align 2, 0
_0803EB58: .4byte gBattleMoveDamage
_0803EB5C:
	movs r7, 0x2
	mov r0, r10
	ands r0, r7
	cmp r0, 0
	beq _0803EB68
	b _0803ECB8
_0803EB68:
	movs r5, 0
	ldr r3, [sp, 0x24]
	adds r3, 0x1
	str r3, [sp, 0x38]
_0803EB70:
	movs r4, 0x11
	adds r4, r5
	mov r9, r4
	mov r0, r8
	mov r1, r9
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	adds r7, r5, 0
	adds r7, 0xD
	mov r0, r8
	adds r1, r7, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r5, 24
	lsrs r6, r0, 24
	adds r0, r4, 0
	adds r2, r6, 0
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [sp]
	cmp r1, r0
	beq _0803EC92
	ldr r2, [sp, 0x20]
	ldr r3, [sp, 0x24]
	adds r0, r2, r3
	ldrb r0, [r0]
	adds r0, r1, r0
	str r0, [sp]
	mov r0, r8
	adds r1, r7, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	adds r2, r6, 0
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [sp]
	cmp r1, r0
	bls _0803EC28
	mov r0, r8
	adds r1, r7, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	adds r2, r6, 0
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
_0803EC28:
	mov r0, r8
	mov r1, r9
	mov r2, sp
	bl SetMonData
	ldr r0, _0803ECA4 @ =gMain
	ldr r4, _0803ECA8 @ =0x0000043d
	adds r0, r4
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803EC8E
	ldr r0, [sp, 0x34]
	cmp r0, 0x4
	beq _0803EC8E
	ldr r4, _0803ECAC @ =gBattleMons
	movs r0, 0x58
	ldr r1, [sp, 0x34]
	adds r3, r1, 0
	muls r3, r0
	adds r0, r4, 0
	adds r0, 0x50
	adds r0, r3, r0
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 14
	ands r1, r0
	cmp r1, 0
	bne _0803EC8E
	ldr r1, _0803ECB0 @ =gDisableStructs
	ldr r2, [sp, 0x34]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _0803ECB4 @ =gBitTable
	lsls r0, r5, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0803EC8E
	adds r0, r5, r3
	adds r1, r4, 0
	adds r1, 0x24
	adds r0, r1
	ldr r1, [sp]
	strb r1, [r0]
_0803EC8E:
	movs r3, 0
	str r3, [sp, 0x1C]
_0803EC92:
	adds r5, 0x1
	cmp r5, 0x3
	bgt _0803EC9A
	b _0803EB70
_0803EC9A:
	ldr r4, [sp, 0x38]
	lsls r0, r4, 24
_0803EC9E:
	lsrs r0, 24
	str r0, [sp, 0x24]
	b _0803EE0A
	.align 2, 0
_0803ECA4: .4byte gMain
_0803ECA8: .4byte 0x0000043d
_0803ECAC: .4byte gBattleMons
_0803ECB0: .4byte gDisableStructs
_0803ECB4: .4byte gBitTable
_0803ECB8:
	ldr r6, [sp, 0x10]
	adds r6, 0x11
	mov r0, r8
	adds r1, r6, 0
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	ldr r5, [sp, 0x10]
	adds r5, 0xD
	mov r0, r8
	adds r1, r5, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	ldr r2, [sp, 0x10]
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [sp]
	cmp r2, r0
	bne _0803ED00
	b _0803EE0A
_0803ED00:
	ldr r1, [sp, 0x24]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x24]
	ldr r0, [sp, 0x20]
	adds r1, r0, r1
	ldrb r0, [r1]
	adds r0, r2, r0
	str r0, [sp]
	mov r0, r8
	adds r1, r5, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	ldr r2, [sp, 0x10]
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [sp]
	cmp r1, r0
	bls _0803ED74
	mov r0, r8
	adds r1, r5, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	ldr r2, [sp, 0x10]
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
_0803ED74:
	mov r0, r8
	adds r1, r6, 0
	mov r2, sp
	bl SetMonData
	ldr r0, _0803EDE0 @ =gMain
	ldr r1, _0803EDE4 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _0803EDD8
	ldr r2, [sp, 0x34]
	cmp r2, 0x4
	beq _0803EDD8
	ldr r4, _0803EDE8 @ =gBattleMons
	movs r0, 0x58
	adds r3, r2, 0
	muls r3, r0
	adds r0, r4, 0
	adds r0, 0x50
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _0803EDD8
	ldr r1, _0803EDEC @ =gDisableStructs
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _0803EDF0 @ =gBitTable
	ldr r5, [sp, 0x10]
	lsls r0, r5, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0803EDD8
	adds r0, r5, r3
	adds r1, r4, 0
	adds r1, 0x24
	adds r0, r1
	ldr r1, [sp]
	strb r1, [r0]
_0803EDD8:
	movs r0, 0
	str r0, [sp, 0x1C]
	b _0803EE0A
	.align 2, 0
_0803EDE0: .4byte gMain
_0803EDE4: .4byte 0x0000043d
_0803EDE8: .4byte gBattleMons
_0803EDEC: .4byte gDisableStructs
_0803EDF0: .4byte gBitTable
_0803EDF4:
	mov r0, r8
	movs r1, 0x2
	ldr r2, [sp, 0x8]
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _0803EE0A
	bl _0803E35C
_0803EE0A:
	ldr r1, [sp, 0x28]
	adds r1, 0x1
	str r1, [sp, 0x28]
	mov r2, r10
	lsrs r2, 1
	mov r10, r2
	cmp r2, 0
	beq _0803EE1C
	b _0803E862
_0803EE1C:
	b _0803F14C
_0803EE1E:
	ldr r3, [sp, 0x20]
	ldr r4, [sp, 0x18]
	adds r0, r3, r4
	ldrb r0, [r0]
	mov r10, r0
	movs r5, 0
	str r5, [sp, 0x28]
	cmp r0, 0
	bne _0803EE32
	b _0803F14C
_0803EE32:
	movs r0, 0x1
	mov r1, r10
	ands r0, r1
	cmp r0, 0
	bne _0803EE3E
	b _0803F13A
_0803EE3E:
	ldr r2, [sp, 0x28]
	cmp r2, 0x7
	bls _0803EE46
	b _0803F13A
_0803EE46:
	lsls r0, r2, 2
	ldr r1, _0803EE50 @ =_0803EE54
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803EE50: .4byte _0803EE54
	.align 2, 0
_0803EE54:
	.4byte _0803EE74
	.4byte _0803EE74
	.4byte _0803EE74
	.4byte _0803EE74
	.4byte _0803EEF8
	.4byte _0803EFCC
	.4byte _0803F026
	.4byte _0803F07C
_0803EE74:
	mov r0, r8
	bl GetMonEVCount
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _0803EEBC @ =0x000001fd
	cmp r5, r0
	bls _0803EE88
	bl _0803E36C
_0803EE88:
	ldr r0, _0803EEC0 @ =gUnknown_082082F2
	ldr r4, [sp, 0x28]
	adds r4, 0x2
	adds r0, r4, r0
	ldrb r1, [r0]
	mov r0, r8
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	str r1, [sp]
	adds r2, r4, 0
	cmp r1, 0x63
	bls _0803EEA6
	b _0803F13A
_0803EEA6:
	ldr r3, [sp, 0x20]
	ldr r4, [sp, 0x24]
	adds r0, r3, r4
	ldrb r0, [r0]
	adds r1, r0
	cmp r1, 0x64
	bls _0803EEC4
	adds r0, 0x64
	subs r4, r0, r1
	b _0803EEC6
	.align 2, 0
_0803EEBC: .4byte 0x000001fd
_0803EEC0: .4byte gUnknown_082082F2
_0803EEC4:
	adds r4, r0, 0
_0803EEC6:
	adds r1, r5, r4
	movs r0, 0xFF
	lsls r0, 1
	cmp r1, r0
	bls _0803EED4
	adds r0, r4, r0
	subs r4, r0, r1
_0803EED4:
	ldr r0, [sp]
	adds r0, r4
	str r0, [sp]
	ldr r0, _0803EEF4 @ =gUnknown_082082F2
	adds r0, r2, r0
	ldrb r1, [r0]
	mov r0, r8
	mov r2, sp
	bl SetMonData
	mov r0, r8
	bl CalculateMonStats
	movs r5, 0
	str r5, [sp, 0x1C]
	b _0803F130
	.align 2, 0
_0803EEF4: .4byte gUnknown_082082F2
_0803EEF8:
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	ldr r1, _0803EFC0 @ =gUnknown_08208238
	ldr r2, [sp, 0x10]
	adds r1, r2, r1
	ldrb r1, [r1]
	ands r0, r1
	lsls r1, r2, 1
	lsrs r0, r1
	str r0, [sp]
	cmp r0, 0x2
	bls _0803EF18
	b _0803F13A
_0803EF18:
	adds r5, r2, 0
	adds r5, 0xD
	mov r0, r8
	adds r1, r5, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	ldr r2, [sp, 0x10]
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r4, r0, 24
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	ldr r1, _0803EFC4 @ =gUnknown_0820823C
	ldr r3, [sp, 0x10]
	adds r1, r3, r1
	ldrb r2, [r1]
	ands r2, r0
	str r2, [sp]
	ldr r0, _0803EFC8 @ =gUnknown_08208240
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	adds r2, r0
	str r2, [sp]
	mov r0, r8
	movs r1, 0x15
	mov r2, sp
	bl SetMonData
	mov r0, r8
	adds r1, r5, 0
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	ldr r1, [sp]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, [sp, 0x10]
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	subs r0, r4
	str r0, [sp]
	ldr r4, [sp, 0x10]
	adds r4, 0x11
	mov r0, r8
	adds r1, r4, 0
	movs r2, 0
	bl GetMonData
	ldr r1, [sp]
	adds r0, r1
	str r0, [sp]
	mov r0, r8
	adds r1, r4, 0
	mov r2, sp
	bl SetMonData
	movs r4, 0
	str r4, [sp, 0x1C]
	b _0803F13A
	.align 2, 0
_0803EFC0: .4byte gUnknown_08208238
_0803EFC4: .4byte gUnknown_0820823C
_0803EFC8: .4byte gUnknown_08208240
_0803EFCC:
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	cmp r0, 0x63
	bls _0803EFDC
	b _0803F130
_0803EFDC:
	ldr r5, [sp, 0x1C]
	cmp r5, 0
	beq _0803EFE4
	b _0803F130
_0803EFE4:
	ldr r0, [sp, 0x2C]
	cmp r0, 0
	beq _0803EFEC
	b _0803F130
_0803EFEC:
	ldr r1, [sp, 0x20]
	ldr r2, [sp, 0x24]
	adds r0, r1, r2
	ldrb r0, [r0]
	str r0, [sp, 0x2C]
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	adds r5, r0, 0
	str r5, [sp, 0x4]
	ldr r3, [sp, 0x2C]
	lsls r4, r3, 24
	asrs r1, r4, 24
	cmp r1, 0
	ble _0803F0D0
	ldr r0, [sp, 0x30]
	cmp r0, 0x1B
	bne _0803F0D0
	movs r0, 0x96
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	adds r0, r5, r0
	str r0, [sp, 0x4]
	adds r2, r4, 0
	b _0803F0DC
_0803F026:
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	cmp r0, 0x63
	bls _0803F130
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	cmp r0, 0xC7
	bhi _0803F130
	ldr r2, [sp, 0x1C]
	cmp r2, 0
	bne _0803F130
	ldr r3, [sp, 0x2C]
	cmp r3, 0
	bne _0803F130
	ldr r4, [sp, 0x20]
	ldr r5, [sp, 0x24]
	adds r0, r4, r5
	ldrb r0, [r0]
	str r0, [sp, 0x2C]
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	str r4, [sp, 0x4]
	ldr r0, [sp, 0x2C]
	lsls r5, r0, 24
	asrs r1, r5, 24
	cmp r1, 0
	ble _0803F076
	ldr r2, [sp, 0x30]
	cmp r2, 0x1B
	beq _0803F0BE
_0803F076:
	ldr r3, [sp, 0x2C]
	lsls r2, r3, 24
	b _0803F0D4
_0803F07C:
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	cmp r0, 0xC7
	bls _0803F130
	ldr r4, [sp, 0x1C]
	cmp r4, 0
	bne _0803F130
	ldr r5, [sp, 0x2C]
	cmp r5, 0
	bne _0803F130
	ldr r1, [sp, 0x20]
	ldr r2, [sp, 0x24]
	adds r0, r1, r2
	ldrb r0, [r0]
	str r0, [sp, 0x2C]
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	str r4, [sp, 0x4]
	ldr r3, [sp, 0x2C]
	lsls r5, r3, 24
	asrs r1, r5, 24
	cmp r1, 0
	ble _0803F0D0
	ldr r0, [sp, 0x30]
	cmp r0, 0x1B
	bne _0803F0D0
_0803F0BE:
	movs r0, 0x96
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	adds r0, r4, r0
	str r0, [sp, 0x4]
	adds r2, r5, 0
	b _0803F0DC
_0803F0D0:
	ldr r1, [sp, 0x2C]
	lsls r2, r1, 24
_0803F0D4:
	asrs r1, r2, 24
	ldr r0, [sp, 0x4]
	adds r0, r1
	str r0, [sp, 0x4]
_0803F0DC:
	cmp r2, 0
	ble _0803F112
	mov r0, r8
	movs r1, 0x26
	movs r2, 0
	bl GetMonData
	cmp r0, 0xB
	bne _0803F0F4
	ldr r0, [sp, 0x4]
	adds r0, 0x1
	str r0, [sp, 0x4]
_0803F0F4:
	mov r0, r8
	movs r1, 0x23
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	bl sav1_map_get_name
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _0803F112
	ldr r0, [sp, 0x4]
	adds r0, 0x1
	str r0, [sp, 0x4]
_0803F112:
	ldr r0, [sp, 0x4]
	cmp r0, 0
	bge _0803F11C
	movs r0, 0
	str r0, [sp, 0x4]
_0803F11C:
	ldr r0, [sp, 0x4]
	cmp r0, 0xFF
	ble _0803F126
	movs r0, 0xFF
	str r0, [sp, 0x4]
_0803F126:
	add r2, sp, 0x4
	mov r0, r8
	movs r1, 0x20
	bl SetMonData
_0803F130:
	ldr r0, [sp, 0x24]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x24]
_0803F13A:
	ldr r2, [sp, 0x28]
	adds r2, 0x1
	str r2, [sp, 0x28]
	mov r3, r10
	lsrs r3, 1
	mov r10, r3
	cmp r3, 0
	beq _0803F14C
	b _0803EE32
_0803F14C:
	ldr r4, [sp, 0x18]
	adds r4, 0x1
	str r4, [sp, 0x18]
	cmp r4, 0x5
	bgt _0803F15A
	bl _0803E378
_0803F15A:
	ldr r0, [sp, 0x1C]
_0803F15C:
	add sp, 0x3C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_803E1B0

	.align 2, 0 @ Don't pad with nop.
