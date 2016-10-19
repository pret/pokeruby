	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

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
	ldr r0, _0803E21C
	ldr r4, _0803E220
	adds r0, r4
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803E22C
	ldr r2, _0803E224
	ldr r0, _0803E228
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
_0803E228: .4byte gUnknown_02024E6C
_0803E22C:
	ldr r0, _0803E238
	ldr r5, _0803E23C
	adds r0, r5
	ldrb r0, [r0]
	b _0803E248
	.align 2, 0
_0803E238: .4byte gSaveBlock1
_0803E23C: .4byte 0x00003688
_0803E240:
	bl itemid_get_x12
	lsls r0, 24
	lsrs r0, 24
_0803E248:
	str r0, [sp, 0x30]
	ldr r1, _0803E2A4
	ldr r0, _0803E2A8
	ldrb r2, [r0]
	strb r2, [r1]
	ldr r0, _0803E2AC
	ldr r1, _0803E2B0
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _0803E2E8
	ldr r0, _0803E2B4
	strb r2, [r0]
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	negs r1, r0
	orrs r1, r0
	lsrs r1, 31
	str r1, [sp, 0x18]
	ldr r0, _0803E2B8
	ldr r4, [sp, 0x8]
	subs r4, 0xD
	ldrb r0, [r0]
	cmp r1, r0
	bge _0803E2F4
	ldr r2, _0803E2BC
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
_0803E2A4: .4byte gUnknown_02024C0B
_0803E2A8: .4byte gUnknown_02024E6C
_0803E2AC: .4byte gMain
_0803E2B0: .4byte 0x0000043d
_0803E2B4: .4byte gUnknown_02024A60
_0803E2B8: .4byte gUnknown_02024A68
_0803E2BC: .4byte gUnknown_02024A6A
_0803E2C0:
	ldr r1, [sp, 0x18]
	adds r1, 0x2
	str r1, [sp, 0x18]
	ldr r0, _0803E2E4
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
_0803E2E4: .4byte gUnknown_02024A68
_0803E2E8:
	ldr r0, _0803E310
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
	ldr r1, _0803E314
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
_0803E310: .4byte gUnknown_02024A60
_0803E314: .4byte gItemEffectTable
_0803E318:
	ldr r5, [sp, 0x8]
	cmp r5, 0xAF
	bne _0803E372
_0803E31E:
	ldr r0, _0803E340
	ldr r1, _0803E344
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803E350
	ldr r0, _0803E348
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	ldr r1, _0803E34C
	adds r0, r1
	b _0803E372
	.align 2, 0
_0803E340: .4byte gMain
_0803E344: .4byte 0x0000043d
_0803E348: .4byte gUnknown_02024A60
_0803E34C: .4byte gUnknown_02024DF8
_0803E350:
	ldr r2, _0803E358
	str r2, [sp, 0x20]
	b _0803E374
	.align 2, 0
_0803E358: .4byte gSaveBlock1 + 0x3676
_0803E35C:
	mov r0, r8
	movs r2, 0
	ldr r3, [sp, 0xC]
	bl sub_8111924
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
	ldr r1, _0803E38C
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
	ldr r0, _0803E460
	ldr r1, _0803E464
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803E3F0
	ldr r2, [sp, 0x34]
	cmp r2, 0x4
	beq _0803E3F0
	ldr r1, _0803E468
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
	ldr r0, _0803E46C
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
	ldr r1, _0803E468
	ldr r0, _0803E470
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
	ldr r6, _0803E468
	ldr r5, _0803E470
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
_0803E470: .4byte gUnknown_02024A60
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
	ldr r7, _0803E500
	ldr r5, _0803E504
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
	ldr r6, _0803E500
	ldr r5, _0803E504
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
_0803E504: .4byte gUnknown_02024A60
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
	ldr r7, _0803E594
	ldr r5, _0803E598
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
	ldr r6, _0803E594
	ldr r5, _0803E598
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
_0803E598: .4byte gUnknown_02024A60
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
	ldr r5, _0803E758
	ldr r4, _0803E75C
	ldrb r0, [r4]
	bl battle_side_get_owner
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
	bl battle_side_get_owner
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
	ldr r5, _0803E760
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
	ldr r2, _0803E764
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
	ldr r1, _0803E768
	movs r0, 0x58
	ldr r3, [sp, 0x34]
	adds r2, r3, 0
	muls r2, r0
	adds r1, 0x50
	adds r2, r1
	ldr r0, [r2]
	ldr r1, _0803E76C
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
	ldr r2, _0803E770
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
	ldr r0, _0803E774
	ldr r3, _0803E778
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
	ldr r1, _0803E768
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
_0803E758: .4byte gUnknown_02024C80
_0803E75C: .4byte gUnknown_02024A60
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
	ldr r1, _0803E880
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
	ldr r1, _0803E884
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
	ldr r1, _0803E888
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
	bl sub_8040020
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _0803E8EC
	cmp r5, r0
	bls _0803E8BE
	b _0803E36C
_0803E8BE:
	ldr r0, _0803E8F0
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
	ldr r0, _0803E930
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
	ldr r0, _0803E99C
	ldr r1, _0803E9A0
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
	ldr r2, _0803E9A4
	ldr r1, _0803E9A8
	ldr r3, [sp, 0x34]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r0]
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	ldr r1, _0803E9AC
	lsls r0, r3, 1
	adds r0, r1
	ldrb r0, [r0]
	bl pokemon_order_func
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, [sp, 0x34]
	bl CopyPlayerPartyMonToBattleData
	ldr r0, _0803E9B0
	ldrb r0, [r0]
	b _0803E9CC
	.align 2, 0
_0803E99C: .4byte gMain
_0803E9A0: .4byte 0x0000043d
_0803E9A4: .4byte gUnknown_02024C0C
_0803E9A8: .4byte gBitTable
_0803E9AC: .4byte gUnknown_02024A6A
_0803E9B0: .4byte gUnknown_02024A60
_0803E9B4:
	ldr r3, _0803E9E4
	ldr r1, _0803E9E8
	ldr r2, _0803E9EC
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
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0803EA0A
	ldr r1, _0803E9F0
	ldrb r0, [r1, 0x4]
	cmp r0, 0xFE
	bhi _0803EA0A
	adds r0, 0x1
	strb r0, [r1, 0x4]
	b _0803EA0A
	.align 2, 0
_0803E9E4: .4byte gUnknown_02024C0C
_0803E9E8: .4byte gBitTable
_0803E9EC: .4byte gUnknown_02024A60
_0803E9F0: .4byte gUnknown_030042E0
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
	ldr r0, _0803EB24
	ldr r5, _0803EB28
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
	ldr r0, _0803EB2C
	ldr r1, _0803EB30
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803EB48
	ldr r2, [sp, 0x34]
	cmp r2, 0x4
	beq _0803EB48
	ldr r1, _0803EB34
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
	ldr r4, _0803EB38
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0803EB48
	ldr r1, _0803EB3C
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
	bl dp01_build_cmdbuf_x00_a_b_0
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	strb r5, [r4]
	b _0803EB48
	.align 2, 0
_0803EB24: .4byte 0x02000000
_0803EB28: .4byte 0x000160fa
_0803EB2C: .4byte gMain
_0803EB30: .4byte 0x0000043d
_0803EB34: .4byte gBattleMons
_0803EB38: .4byte gUnknown_02024A60
_0803EB3C: .4byte gUnknown_030042E0
_0803EB40:
	ldr r1, _0803EB58
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
_0803EB58: .4byte gUnknown_02024BEC
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
	ldr r0, _0803ECA4
	ldr r4, _0803ECA8
	adds r0, r4
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803EC8E
	ldr r0, [sp, 0x34]
	cmp r0, 0x4
	beq _0803EC8E
	ldr r4, _0803ECAC
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
	ldr r1, _0803ECB0
	ldr r2, [sp, 0x34]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _0803ECB4
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
_0803ECB0: .4byte gUnknown_02024CA8
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
	ldr r0, _0803EDE0
	ldr r1, _0803EDE4
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _0803EDD8
	ldr r2, [sp, 0x34]
	cmp r2, 0x4
	beq _0803EDD8
	ldr r4, _0803EDE8
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
	ldr r1, _0803EDEC
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _0803EDF0
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
_0803EDEC: .4byte gUnknown_02024CA8
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
	ldr r1, _0803EE50
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
	bl sub_8040020
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _0803EEBC
	cmp r5, r0
	bls _0803EE88
	bl _0803E36C
_0803EE88:
	ldr r0, _0803EEC0
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
	ldr r0, _0803EEF4
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
	ldr r1, _0803EFC0
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
	ldr r1, _0803EFC4
	ldr r3, [sp, 0x10]
	adds r1, r3, r1
	ldrb r2, [r1]
	ands r2, r0
	str r2, [sp]
	ldr r0, _0803EFC8
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

	thumb_func_start HealStatusConditions
HealStatusConditions: @ 803F16C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r4, r2, 0
	lsls r3, 24
	lsrs r6, r3, 24
	movs r1, 0x37
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	str r1, [sp]
	ands r0, r4
	cmp r0, 0
	beq _0803F1D0
	mvns r4, r4
	ands r1, r4
	str r1, [sp]
	adds r0, r5, 0
	movs r1, 0x37
	mov r2, sp
	bl SetMonData
	ldr r0, _0803F1C4
	ldr r1, _0803F1C8
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803F1BE
	cmp r6, 0x4
	beq _0803F1BE
	ldr r0, _0803F1CC
	movs r1, 0x58
	muls r1, r6
	adds r0, 0x4C
	adds r1, r0
	ldr r0, [r1]
	ands r0, r4
	str r0, [r1]
_0803F1BE:
	movs r0, 0
	b _0803F1D2
	.align 2, 0
_0803F1C4: .4byte gMain
_0803F1C8: .4byte 0x0000043d
_0803F1CC: .4byte gBattleMons
_0803F1D0:
	movs r0, 0x1
_0803F1D2:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end HealStatusConditions

	thumb_func_start sub_803F1DC
sub_803F1DC: @ 803F1DC
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	movs r7, 0x6
	ldr r1, _0803F204
	adds r0, r3, 0
	subs r0, 0xD
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	bne _0803F208
	cmp r3, 0xAF
	beq _0803F20C
_0803F200:
	movs r0, 0
	b _0803F31C
	.align 2, 0
_0803F204: .4byte gItemEffectTable
_0803F208:
	cmp r3, 0xAF
	bne _0803F21A
_0803F20C:
	ldr r0, _0803F22C
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	ldr r1, _0803F230
	adds r0, r1
_0803F21A:
	mov r12, r0
	movs r2, 0
_0803F21E:
	cmp r2, 0x4
	beq _0803F23E
	cmp r2, 0x4
	ble _0803F234
	cmp r2, 0x5
	beq _0803F2C8
	b _0803F312
	.align 2, 0
_0803F22C: .4byte gUnknown_02024A60
_0803F230: .4byte gUnknown_02024DF8
_0803F234:
	cmp r2, 0
	blt _0803F312
	cmp r2, r4
	bne _0803F312
	b _0803F200
_0803F23E:
	mov r0, r12
	ldrb r3, [r0, 0x4]
	movs r0, 0x20
	ands r0, r3
	cmp r0, 0
	beq _0803F24E
	movs r0, 0xDF
	ands r3, r0
_0803F24E:
	movs r6, 0
	cmp r3, 0
	beq _0803F312
_0803F254:
	movs r0, 0x1
	ands r0, r3
	cmp r0, 0
	beq _0803F2B4
	cmp r6, 0x7
	bhi _0803F2B4
	lsls r0, r6, 2
	ldr r1, _0803F26C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803F26C: .4byte _0803F270
	.align 2, 0
_0803F270:
	.4byte _0803F29C
	.4byte _0803F29C
	.4byte _0803F290
	.4byte _0803F29C
	.4byte _0803F2B4
	.4byte _0803F2B4
	.4byte _0803F2B4
	.4byte _0803F2B0
_0803F290:
	movs r0, 0x10
	ands r0, r3
	cmp r0, 0
	beq _0803F29C
	movs r0, 0xEF
	ands r3, r0
_0803F29C:
	cmp r2, r4
	bne _0803F2A8
	adds r0, r3, 0
	ands r0, r5
	cmp r0, 0
	bne _0803F31A
_0803F2A8:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	b _0803F2B4
_0803F2B0:
	cmp r2, r4
	beq _0803F200
_0803F2B4:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	lsrs r3, 1
	cmp r2, r4
	bne _0803F2C2
	lsrs r5, 1
_0803F2C2:
	cmp r3, 0
	bne _0803F254
	b _0803F312
_0803F2C8:
	mov r0, r12
	ldrb r3, [r0, 0x5]
	movs r6, 0
_0803F2CE:
	cmp r3, 0
	beq _0803F312
	movs r0, 0x1
	ands r0, r3
	cmp r0, 0
	beq _0803F302
	cmp r6, 0
	blt _0803F302
	cmp r6, 0x6
	ble _0803F2E8
	cmp r6, 0x7
	beq _0803F2FC
	b _0803F302
_0803F2E8:
	cmp r2, r4
	bne _0803F2F4
	adds r0, r3, 0
	ands r0, r5
	cmp r0, 0
	bne _0803F31A
_0803F2F4:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	b _0803F302
_0803F2FC:
	cmp r2, r4
	bne _0803F302
	b _0803F200
_0803F302:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	lsrs r3, 1
	cmp r2, r4
	bne _0803F2CE
	lsrs r5, 1
	b _0803F2CE
_0803F312:
	adds r2, 0x1
	cmp r2, 0x5
	bgt _0803F31A
	b _0803F21E
_0803F31A:
	adds r0, r7, 0
_0803F31C:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_803F1DC

	thumb_func_start sub_803F324
sub_803F324: @ 803F324
	push {lr}
	ldr r2, _0803F358
	ldr r1, _0803F35C
	ldrb r1, [r1]
	strb r1, [r2]
	ldr r3, _0803F360
	ldr r2, _0803F364
	ldr r1, _0803F368
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldr r1, [r0]
	adds r0, r3, 0
	bl StringCopy
	ldr r0, _0803F36C
	ldr r1, _0803F370
	bl StringCopy
	ldr r0, _0803F374
	bl get_battle_strings_
	pop {r0}
	bx r0
	.align 2, 0
_0803F358: .4byte gUnknown_02024C08
_0803F35C: .4byte gUnknown_02024E6C
_0803F360: .4byte gUnknown_030041C0
_0803F364: .4byte gUnknown_08400F58
_0803F368: .4byte gUnknown_082082F8
_0803F36C: .4byte gUnknown_03004290
_0803F370: .4byte gUnknown_083FFDB3
_0803F374: .4byte gUnknown_083FFDD3
	thumb_func_end sub_803F324

	thumb_func_start sub_803F378
sub_803F378: @ 803F378
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _0803F3C0
	ldr r0, _0803F3A8
	ldr r1, _0803F3AC
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803F3B8
	ldr r2, _0803F3B0
	ldrb r1, [r2]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	ldr r1, _0803F3B4
	adds r7, r0, r1
	b _0803F3CC
	.align 2, 0
_0803F3A8: .4byte gMain
_0803F3AC: .4byte 0x0000043d
_0803F3B0: .4byte gUnknown_02024E6C
_0803F3B4: .4byte gUnknown_02024DF8
_0803F3B8:
	ldr r7, _0803F3BC
	b _0803F3CA
	.align 2, 0
_0803F3BC: .4byte gSaveBlock1 + 0x3676
_0803F3C0:
	ldr r1, _0803F404
	subs r0, 0xD
	lsls r0, 2
	adds r0, r1
	ldr r7, [r0]
_0803F3CA:
	ldr r2, _0803F408
_0803F3CC:
	ldr r1, _0803F40C
	ldrb r0, [r2]
	strb r0, [r1]
	movs r5, 0
	ldr r0, _0803F410
	mov r8, r0
	movs r6, 0
_0803F3DA:
	adds r4, r7, r5
	ldrb r1, [r4]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	beq _0803F3EC
	adds r0, r6, 0
	bl sub_803F324
_0803F3EC:
	ldrb r1, [r4]
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0
	beq _0803F422
	cmp r5, 0
	beq _0803F414
	adds r0, r6, 0x1
	bl sub_803F324
	b _0803F422
	.align 2, 0
_0803F404: .4byte gItemEffectTable
_0803F408: .4byte gUnknown_02024E6C
_0803F40C: .4byte gUnknown_02024C0B
_0803F410: .4byte gUnknown_02024C07
_0803F414:
	ldr r0, _0803F450
	ldrb r0, [r0]
	mov r1, r8
	strb r0, [r1]
	ldr r0, _0803F454
	bl get_battle_strings_
_0803F422:
	adds r6, 0x2
	adds r5, 0x1
	cmp r5, 0x2
	ble _0803F3DA
	ldrb r1, [r7, 0x3]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0803F442
	ldr r1, _0803F458
	ldr r0, _0803F450
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0803F45C
	bl get_battle_strings_
_0803F442:
	ldr r0, _0803F460
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803F450: .4byte gUnknown_02024E6C
_0803F454: .4byte gUnknown_083FEE92
_0803F458: .4byte gUnknown_02024C07
_0803F45C: .4byte gUnknown_083FEE5D
_0803F460: .4byte gUnknown_020238CC
	thumb_func_end sub_803F378

	thumb_func_start GetNature
GetNature: @ 803F464
	push {lr}
	movs r1, 0
	movs r2, 0
	bl GetMonData
	movs r1, 0x19
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end GetNature

	thumb_func_start GetNatureFromPersonality
GetNatureFromPersonality: @ 803F47C
	push {lr}
	movs r1, 0x19
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end GetNatureFromPersonality

	thumb_func_start GetEvolutionTargetSpecies
GetEvolutionTargetSpecies: @ 803F48C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	mov r8, r0
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 16
	lsrs r2, 16
	mov r9, r2
	movs r0, 0
	mov r10, r0
	mov r0, r8
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r7, r0, 16
	mov r0, r8
	movs r1, 0xC
	movs r2, 0
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	mov r0, r8
	movs r1, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0x17
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0xC]
	lsrs r4, 16
	str r4, [sp, 0x10]
	mov r0, sp
	ldrh r0, [r0]
	cmp r0, 0xAF
	bne _0803F500
	ldr r0, _0803F4F8
	ldr r1, _0803F4FC
	adds r0, r1
	ldrb r0, [r0]
	b _0803F508
	.align 2, 0
_0803F4F8: .4byte gSaveBlock1
_0803F4FC: .4byte 0x00003688
_0803F500:
	bl itemid_get_x12
	lsls r0, 24
	lsrs r0, 24
_0803F508:
	cmp r0, 0x26
	bne _0803F514
	cmp r5, 0x3
	beq _0803F514
	movs r0, 0
	b _0803F7A4
_0803F514:
	cmp r5, 0x1
	bne _0803F51A
	b _0803F734
_0803F51A:
	cmp r5, 0x1
	bgt _0803F524
	cmp r5, 0
	beq _0803F538
	b _0803F7A2
_0803F524:
	cmp r5, 0x3
	ble _0803F52A
	b _0803F7A2
_0803F52A:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r3, _0803F534
	lsls r6, r7, 2
	b _0803F782
	.align 2, 0
_0803F534: .4byte gEvolutionTable
_0803F538:
	mov r0, r8
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	movs r0, 0
	str r0, [sp, 0x4]
	lsls r6, r7, 2
_0803F55E:
	ldr r1, _0803F584
	ldr r0, [sp, 0x4]
	lsls r2, r0, 3
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r2, r0
	adds r0, r1
	ldrh r0, [r0]
	subs r0, 0x1
	adds r3, r1, 0
	adds r4, r2, 0
	cmp r0, 0xE
	bls _0803F57A
	b _0803F726
_0803F57A:
	lsls r0, 2
	ldr r1, _0803F588
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803F584: .4byte gEvolutionTable
_0803F588: .4byte _0803F58C
	.align 2, 0
_0803F58C:
	.4byte _0803F5C8
	.4byte _0803F5DA
	.4byte _0803F5FC
	.4byte _0803F62C
	.4byte _0803F726
	.4byte _0803F726
	.4byte _0803F726
	.4byte _0803F63C
	.4byte _0803F666
	.4byte _0803F690
	.4byte _0803F6BE
	.4byte _0803F6DE
	.4byte _0803F702
	.4byte _0803F726
	.4byte _0803F712
_0803F5C8:
	ldr r1, [sp, 0x8]
	cmp r1, 0xDB
	bhi _0803F5D0
	b _0803F726
_0803F5D0:
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r4, r0
	adds r0, r3
	b _0803F61C
_0803F5DA:
	bl RtcCalcLocalTime
	ldr r0, _0803F5F8
	ldrb r0, [r0, 0x2]
	subs r0, 0xC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB
	bls _0803F5EE
	b _0803F726
_0803F5EE:
	ldr r2, [sp, 0x8]
	cmp r2, 0xDB
	bhi _0803F5F6
	b _0803F726
_0803F5F6:
	b _0803F612
	.align 2, 0
_0803F5F8: .4byte gLocalTime
_0803F5FC:
	bl RtcCalcLocalTime
	ldr r0, _0803F624
	ldrb r0, [r0, 0x2]
	cmp r0, 0xB
	bls _0803F60A
	b _0803F726
_0803F60A:
	ldr r0, [sp, 0x8]
	cmp r0, 0xDB
	bhi _0803F612
	b _0803F726
_0803F612:
	ldr r1, _0803F628
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r4, r0
	adds r0, r1
_0803F61C:
	ldrh r0, [r0, 0x4]
	mov r10, r0
	b _0803F726
	.align 2, 0
_0803F624: .4byte gLocalTime
_0803F628: .4byte gEvolutionTable
_0803F62C:
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r4, r0
	adds r1, r0, r3
	ldrh r0, [r1, 0x2]
	cmp r0, r9
	bhi _0803F726
	b _0803F722
_0803F63C:
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r4, r0
	adds r5, r0, r3
	ldrh r0, [r5, 0x2]
	cmp r0, r9
	bhi _0803F726
	mov r0, r8
	movs r1, 0x3B
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0x3C
	movs r2, 0
	bl GetMonData
	cmp r4, r0
	bls _0803F726
	b _0803F6B8
_0803F666:
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r4, r0
	adds r5, r0, r3
	ldrh r0, [r5, 0x2]
	cmp r0, r9
	bhi _0803F726
	mov r0, r8
	movs r1, 0x3B
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0x3C
	movs r2, 0
	bl GetMonData
	cmp r4, r0
	bne _0803F726
	b _0803F6B8
_0803F690:
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r4, r0
	adds r5, r0, r3
	ldrh r0, [r5, 0x2]
	cmp r0, r9
	bhi _0803F726
	mov r0, r8
	movs r1, 0x3B
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0x3C
	movs r2, 0
	bl GetMonData
	cmp r4, r0
	bcs _0803F726
_0803F6B8:
	ldrh r5, [r5, 0x4]
	mov r10, r5
	b _0803F726
_0803F6BE:
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r4, r0
	adds r4, r0, r3
	ldrh r0, [r4, 0x2]
	cmp r0, r9
	bhi _0803F726
	ldr r0, [sp, 0x10]
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4
	bhi _0803F726
	b _0803F6FC
_0803F6DE:
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r4, r0
	adds r4, r0, r3
	ldrh r0, [r4, 0x2]
	cmp r0, r9
	bhi _0803F726
	ldr r0, [sp, 0x10]
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4
	bls _0803F726
_0803F6FC:
	ldrh r4, [r4, 0x4]
	mov r10, r4
	b _0803F726
_0803F702:
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r4, r0
	adds r1, r0, r3
	ldrh r0, [r1, 0x2]
	cmp r0, r9
	bhi _0803F726
	b _0803F722
_0803F712:
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r4, r0
	adds r1, r0, r3
	ldrh r0, [r1, 0x2]
	ldr r2, [sp, 0xC]
	cmp r0, r2
	bhi _0803F726
_0803F722:
	ldrh r1, [r1, 0x4]
	mov r10, r1
_0803F726:
	ldr r0, [sp, 0x4]
	adds r0, 0x1
	str r0, [sp, 0x4]
	cmp r0, 0x4
	bgt _0803F732
	b _0803F55E
_0803F732:
	b _0803F7A2
_0803F734:
	lsls r6, r7, 2
	ldr r1, _0803F778
	adds r0, r6, r7
	lsls r0, 3
	adds r4, r0, r1
	mov r5, sp
	movs r1, 0x4
	str r1, [sp, 0x4]
_0803F744:
	ldrh r0, [r4]
	cmp r0, 0x5
	beq _0803F764
	cmp r0, 0x6
	bne _0803F768
	ldrh r0, [r4, 0x2]
	ldrh r1, [r5]
	cmp r0, r1
	bne _0803F768
	movs r0, 0
	strh r0, [r5]
	mov r0, r8
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
_0803F764:
	ldrh r2, [r4, 0x4]
	mov r10, r2
_0803F768:
	adds r4, 0x8
	ldr r0, [sp, 0x4]
	subs r0, 0x1
	str r0, [sp, 0x4]
	cmp r0, 0
	bge _0803F744
	b _0803F7A2
	.align 2, 0
_0803F778: .4byte gEvolutionTable
_0803F77C:
	ldrh r1, [r1, 0x4]
	mov r10, r1
	b _0803F7A2
_0803F782:
	adds r0, r6, r7
	ldr r1, [sp, 0x4]
	adds r0, r1
	lsls r0, 3
	adds r1, r0, r3
	ldrh r0, [r1]
	cmp r0, 0x7
	bne _0803F798
	ldrh r0, [r1, 0x2]
	cmp r0, r9
	beq _0803F77C
_0803F798:
	ldr r2, [sp, 0x4]
	adds r2, 0x1
	str r2, [sp, 0x4]
	cmp r2, 0x4
	ble _0803F782
_0803F7A2:
	mov r0, r10
_0803F7A4:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetEvolutionTargetSpecies

	thumb_func_start HoennPokedexNumToSpecies
HoennPokedexNumToSpecies: @ 803F7B4
	push {r4,lr}
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _0803F7F8
	movs r1, 0
	ldr r3, _0803F7F0
	ldrh r0, [r3]
	cmp r0, r2
	beq _0803F7E0
	movs r4, 0xCD
	lsls r4, 1
_0803F7CC:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r4
	bhi _0803F7E0
	lsls r0, r1, 1
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _0803F7CC
_0803F7E0:
	ldr r0, _0803F7F4
	cmp r1, r0
	beq _0803F7F8
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	b _0803F7FA
	.align 2, 0
_0803F7F0: .4byte gSpeciesToHoennPokedexNum
_0803F7F4: .4byte 0x0000019b
_0803F7F8:
	movs r0, 0
_0803F7FA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end HoennPokedexNumToSpecies

	thumb_func_start NationalPokedexNumToSpecies
NationalPokedexNumToSpecies: @ 803F800
	push {r4,lr}
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _0803F844
	movs r1, 0
	ldr r3, _0803F83C
	ldrh r0, [r3]
	cmp r0, r2
	beq _0803F82C
	movs r4, 0xCD
	lsls r4, 1
_0803F818:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r4
	bhi _0803F82C
	lsls r0, r1, 1
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _0803F818
_0803F82C:
	ldr r0, _0803F840
	cmp r1, r0
	beq _0803F844
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	b _0803F846
	.align 2, 0
_0803F83C: .4byte gSpeciesToNationalPokedexNum
_0803F840: .4byte 0x0000019b
_0803F844:
	movs r0, 0
_0803F846:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end NationalPokedexNumToSpecies

	thumb_func_start NationalToHoennOrder
NationalToHoennOrder: @ 803F84C
	push {r4,lr}
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _0803F890
	movs r1, 0
	ldr r3, _0803F888
	ldrh r0, [r3]
	cmp r0, r2
	beq _0803F878
	movs r4, 0xCD
	lsls r4, 1
_0803F864:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r4
	bhi _0803F878
	lsls r0, r1, 1
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _0803F864
_0803F878:
	ldr r0, _0803F88C
	cmp r1, r0
	beq _0803F890
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	b _0803F892
	.align 2, 0
_0803F888: .4byte gHoennToNationalOrder
_0803F88C: .4byte 0x0000019b
_0803F890:
	movs r0, 0
_0803F892:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end NationalToHoennOrder

	thumb_func_start SpeciesToNationalPokedexNum
SpeciesToNationalPokedexNum: @ 803F898
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _0803F8B4
	ldr r0, _0803F8B0
	subs r1, 0x1
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	b _0803F8B6
	.align 2, 0
_0803F8B0: .4byte gSpeciesToNationalPokedexNum
_0803F8B4:
	movs r0, 0
_0803F8B6:
	pop {r1}
	bx r1
	thumb_func_end SpeciesToNationalPokedexNum

	thumb_func_start SpeciesToHoennPokedexNum
SpeciesToHoennPokedexNum: @ 803F8BC
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _0803F8D8
	ldr r0, _0803F8D4
	subs r1, 0x1
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	b _0803F8DA
	.align 2, 0
_0803F8D4: .4byte gSpeciesToHoennPokedexNum
_0803F8D8:
	movs r0, 0
_0803F8DA:
	pop {r1}
	bx r1
	thumb_func_end SpeciesToHoennPokedexNum

	thumb_func_start HoennToNationalOrder
HoennToNationalOrder: @ 803F8E0
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _0803F8FC
	ldr r0, _0803F8F8
	subs r1, 0x1
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	b _0803F8FE
	.align 2, 0
_0803F8F8: .4byte gHoennToNationalOrder
_0803F8FC:
	movs r0, 0
_0803F8FE:
	pop {r1}
	bx r1
	thumb_func_end HoennToNationalOrder

	thumb_func_start SpeciesToCryId
SpeciesToCryId: @ 803F904
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	adds r1, r0, 0
	cmp r0, 0xFA
	bls _0803F932
	ldr r0, _0803F924
	cmp r1, r0
	bls _0803F930
	ldr r0, _0803F928
	ldr r2, _0803F92C
	adds r1, r2
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	b _0803F932
	.align 2, 0
_0803F924: .4byte 0x00000113
_0803F928: .4byte gSpeciesIdToCryId
_0803F92C: .4byte 0xfffffeec
_0803F930:
	movs r0, 0xC8
_0803F932:
	pop {r1}
	bx r1
	thumb_func_end SpeciesToCryId

	thumb_func_start unref_sub_803F938
unref_sub_803F938: @ 803F938
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r5, r1, 0
	mov r10, r2
	lsls r0, 16
	movs r1, 0x9A
	lsls r1, 17
	cmp r0, r1
	bne _0803FA42
	ldr r1, _0803FA04
	ldr r0, [r1]
	cmp r10, r0
	beq _0803FA42
	ldr r0, [r1, 0x8]
	cmp r10, r0
	beq _0803FA42
	movs r6, 0
_0803F962:
	lsls r3, r6, 3
	adds r3, r6
	lsls r3, 2
	ldr r0, _0803FA08
	adds r4, r3, r0
	ldrb r1, [r4]
	adds r1, 0xF8
	movs r2, 0xF
	adds r0, r5, 0
	ands r0, r2
	adds r1, r0
	lsls r1, 24
	lsrs r1, 24
	mov r12, r1
	ldrb r1, [r4, 0x1]
	adds r1, 0xF8
	movs r0, 0xF0
	ands r0, r5
	lsrs r0, 4
	adds r1, r0
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	lsrs r5, 8
	str r5, [sp, 0x4]
	adds r6, 0x1
	str r6, [sp]
	mov r9, r3
_0803F99A:
	lsls r0, r2, 1
	add r0, r9
	ldr r3, _0803FA0C
	adds r0, r3
	ldrh r3, [r0]
	mov r4, r12
	adds r0, r4, 0
	adds r0, 0x10
	adds r7, r1, 0x1
	adds r2, 0x1
	mov r8, r2
	cmp r4, r0
	bge _0803FA30
	lsrs r0, r1, 3
	lsls r6, r0, 8
	movs r0, 0x7
	ands r1, r0
	lsls r5, r1, 2
_0803F9BE:
	adds r0, r4, 0
	cmp r4, 0
	bge _0803F9C6
	adds r0, r4, 0x7
_0803F9C6:
	asrs r0, 3
	lsls r2, r0, 5
	add r2, r10
	lsls r0, 3
	subs r0, r4, r0
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r2, r0
	adds r2, r6
	adds r2, r5
	movs r1, 0x1
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0803FA24
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _0803FA10
	ldrb r1, [r2]
	movs r0, 0xF0
	ands r0, r1
	subs r0, 0x10
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x20
	bhi _0803FA24
	adds r0, r1, 0
	adds r0, 0x40
	b _0803FA22
	.align 2, 0
_0803FA04: .4byte gUnknown_081FAF4C
_0803FA08: .4byte gSpindaSpotGraphics
_0803FA0C: .4byte gSpindaSpotGraphics + 0x2
_0803FA10:
	ldrb r1, [r2]
	movs r0, 0xF
	ands r0, r1
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bhi _0803FA24
	adds r0, r1, 0x4
_0803FA22:
	strb r0, [r2]
_0803FA24:
	asrs r3, 1
	adds r4, 0x1
	mov r0, r12
	adds r0, 0x10
	cmp r4, r0
	blt _0803F9BE
_0803FA30:
	lsls r0, r7, 24
	lsrs r1, r0, 24
	mov r2, r8
	cmp r2, 0xF
	ble _0803F99A
	ldr r5, [sp, 0x4]
	ldr r6, [sp]
	cmp r6, 0x3
	ble _0803F962
_0803FA42:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_803F938

	thumb_func_start DrawSpindaSpots
DrawSpindaSpots: @ 803FA54
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r5, r1, 0
	str r2, [sp]
	lsls r0, 16
	lsls r3, 24
	lsrs r3, 24
	movs r1, 0x9A
	lsls r1, 17
	cmp r0, r1
	bne _0803FB56
	cmp r3, 0
	beq _0803FB56
	movs r6, 0
_0803FA78:
	lsls r3, r6, 3
	adds r3, r6
	lsls r3, 2
	ldr r0, _0803FB1C
	adds r4, r3, r0
	ldrb r1, [r4]
	adds r1, 0xF8
	movs r2, 0xF
	adds r0, r5, 0
	ands r0, r2
	adds r1, r0
	lsls r1, 24
	lsrs r1, 24
	mov r12, r1
	ldrb r1, [r4, 0x1]
	adds r1, 0xF8
	movs r0, 0xF0
	ands r0, r5
	lsrs r0, 4
	adds r1, r0
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	lsrs r5, 8
	str r5, [sp, 0x4]
	adds r6, 0x1
	mov r10, r6
	mov r9, r3
_0803FAB0:
	lsls r0, r2, 1
	add r0, r9
	ldr r3, _0803FB20
	adds r0, r3
	ldrh r3, [r0]
	mov r4, r12
	adds r0, r4, 0
	adds r0, 0x10
	adds r7, r1, 0x1
	adds r2, 0x1
	mov r8, r2
	cmp r4, r0
	bge _0803FB44
	lsrs r0, r1, 3
	lsls r6, r0, 8
	movs r0, 0x7
	ands r1, r0
	lsls r5, r1, 2
_0803FAD4:
	adds r0, r4, 0
	cmp r4, 0
	bge _0803FADC
	adds r0, r4, 0x7
_0803FADC:
	asrs r0, 3
	lsls r2, r0, 5
	ldr r1, [sp]
	adds r2, r1, r2
	lsls r0, 3
	subs r0, r4, r0
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r2, r0
	adds r2, r6
	adds r2, r5
	movs r1, 0x1
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0803FB38
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _0803FB24
	ldrb r1, [r2]
	movs r0, 0xF0
	ands r0, r1
	subs r0, 0x10
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x20
	bhi _0803FB38
	adds r0, r1, 0
	adds r0, 0x40
	b _0803FB36
	.align 2, 0
_0803FB1C: .4byte gSpindaSpotGraphics
_0803FB20: .4byte gSpindaSpotGraphics + 0x2
_0803FB24:
	ldrb r1, [r2]
	movs r0, 0xF
	ands r0, r1
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bhi _0803FB38
	adds r0, r1, 0x4
_0803FB36:
	strb r0, [r2]
_0803FB38:
	asrs r3, 1
	adds r4, 0x1
	mov r0, r12
	adds r0, 0x10
	cmp r4, r0
	blt _0803FAD4
_0803FB44:
	lsls r0, r7, 24
	lsrs r1, r0, 24
	mov r2, r8
	cmp r2, 0xF
	ble _0803FAB0
	ldr r5, [sp, 0x4]
	mov r6, r10
	cmp r6, 0x3
	ble _0803FA78
_0803FB56:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end DrawSpindaSpots

	.if REVISION >= 1
	thumb_func_start sub_803FB68
sub_803FB68: @ 803FB68
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	ldr r0, =gStringVar1
	mov r9, r0
	adds r0, r5, 0
	movs r1, 0x2
	mov r2, r9
	bl GetMonData
	mov r4, sp
	adds r0, r5, 0
	movs r1, 0x3
	mov r2, sp
	bl GetMonData
	strb r0, [r4, 0x0]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0803FBC4
	movs r6, 0xB
	adds r0, r7, 0
	muls r0, r6
	ldr r4, =gSpeciesNames
	adds r0, r4
	mov r1, r9
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	bne _0803FBC4
	mov r2, r8
	muls r2, r6
	adds r2, r4
	adds r0, r5, 0
	movs r1, 0x2
	bl SetMonData
_0803FBC4:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_803FB68
	.else
	thumb_func_start sub_803FB68
sub_803FB68: @ 803FB68
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	adds r4, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	ldr r5, _0803FBB4
	movs r1, 0x2
	adds r2, r5, 0
	bl GetMonData
	movs r6, 0xB
	adds r0, r4, 0
	muls r0, r6
	ldr r4, _0803FBB8
	adds r0, r4
	adds r1, r5, 0
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	bne _0803FBA8
	mov r2, r8
	muls r2, r6
	adds r2, r4
	adds r0, r7, 0
	movs r1, 0x2
	bl SetMonData
_0803FBA8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FBB4: .4byte gStringVar1
_0803FBB8: .4byte gSpeciesNames
	thumb_func_end sub_803FB68
	.endif

	thumb_func_start sub_803FBBC
sub_803FBBC: @ 803FBBC
	push {r4,r5,lr}
	movs r5, 0
	ldr r4, _0803FBE4
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r1, 0x18]
	cmp r0, 0x2
	bgt _0803FBE8
	cmp r0, 0x1
	bge _0803FBF0
	cmp r0, 0
	beq _0803FBEC
	b _0803FBF2
	.align 2, 0
_0803FBE4: .4byte gLinkPlayers
_0803FBE8:
	cmp r0, 0x3
	bne _0803FBF2
_0803FBEC:
	movs r5, 0
	b _0803FBF2
_0803FBF0:
	movs r5, 0x1
_0803FBF2:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_803FBBC

	thumb_func_start sub_803FBFC
sub_803FBFC: @ 803FBFC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0
	ldr r2, _0803FC20
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x18]
	cmp r0, 0x2
	bgt _0803FC24
	cmp r0, 0x1
	bge _0803FC2C
	cmp r0, 0
	beq _0803FC28
	b _0803FC2E
	.align 2, 0
_0803FC20: .4byte gLinkPlayers
_0803FC24:
	cmp r0, 0x3
	bne _0803FC2E
_0803FC28:
	movs r3, 0
	b _0803FC2E
_0803FC2C:
	movs r3, 0x1
_0803FC2E:
	adds r0, r3, 0
	pop {r1}
	bx r1
	thumb_func_end sub_803FBFC

	thumb_func_start sub_803FC34
sub_803FC34: @ 803FC34
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	ldr r1, _0803FC40
	b _0803FC4C
	.align 2, 0
_0803FC40: .4byte gLinkPlayers
_0803FC44:
	adds r1, 0x1C
	adds r2, 0x1
	cmp r2, 0x3
	bgt _0803FC52
_0803FC4C:
	ldrh r0, [r1, 0x18]
	cmp r0, r3
	bne _0803FC44
_0803FC52:
	adds r0, r2, 0
	pop {r1}
	bx r1
	thumb_func_end sub_803FC34

	thumb_func_start sub_803FC58
sub_803FC58: @ 803FC58
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _0803FC70
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r1, [r1, 0x2]
	movs r0, 0x7F
	ands r0, r1
	bx lr
	.align 2, 0
_0803FC70: .4byte gTrainers
	thumb_func_end sub_803FC58

	thumb_func_start nature_stat_mod
nature_stat_mod: @ 803FC74
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 16
	lsrs r3, r1, 16
	lsls r2, 24
	lsrs r5, r2, 24
	movs r0, 0xFF
	lsls r0, 24
	adds r2, r0
	lsrs r2, 24
	cmp r2, 0x4
	bls _0803FC92
	adds r0, r3, 0
	b _0803FCCE
_0803FC92:
	ldr r0, _0803FCB4
	lsls r1, r4, 2
	adds r1, r4
	subs r1, 0x1
	adds r1, r5, r1
	adds r1, r0
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0803FCB8
	cmp r1, 0x1
	bne _0803FCCC
	movs r0, 0x6E
	b _0803FCBA
	.align 2, 0
_0803FCB4: .4byte gNatureStatTable
_0803FCB8:
	movs r0, 0x5A
_0803FCBA:
	muls r0, r3
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __udivsi3
	lsls r0, 16
	lsrs r0, 16
	b _0803FCCE
_0803FCCC:
	adds r0, r3, 0
_0803FCCE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end nature_stat_mod

	thumb_func_start sub_803FCD4
sub_803FCD4: @ 803FCD4
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r7, 0
	movs r1, 0xC
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _0803FD34
	ldr r0, _0803FD14
	ldr r1, _0803FD18
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803FD20
	ldr r0, _0803FD1C
	ldrb r4, [r0, 0x7]
	b _0803FD3C
	.align 2, 0
_0803FD14: .4byte gMain
_0803FD18: .4byte 0x0000043d
_0803FD1C: .4byte gEnigmaBerries
_0803FD20:
	ldr r0, _0803FD2C
	ldr r1, _0803FD30
	adds r0, r1
	ldrb r4, [r0]
	b _0803FD3C
	.align 2, 0
_0803FD2C: .4byte gSaveBlock1
_0803FD30: .4byte 0x00003688
_0803FD34:
	bl itemid_get_x12
	lsls r0, 24
	lsrs r4, r0, 24
_0803FD3C:
	cmp r6, 0
	bne _0803FD42
	b _0803FE56
_0803FD42:
	movs r0, 0xCE
	lsls r0, 1
	cmp r6, r0
	bne _0803FD4C
	b _0803FE56
_0803FD4C:
	movs r6, 0
	adds r0, r7, 0
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	mov r1, sp
	strh r0, [r1]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x63
	ble _0803FD6A
	movs r6, 0x1
_0803FD6A:
	cmp r0, 0xC7
	ble _0803FD74
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0803FD74:
	cmp r5, 0x5
	bne _0803FD84
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	bne _0803FE56
_0803FD84:
	cmp r5, 0x3
	bne _0803FDB4
	ldr r0, _0803FE60
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0803FE56
	ldr r2, _0803FE64
	ldr r0, _0803FE68
	ldrh r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r1, [r0, 0x1]
	adds r0, r1, 0
	subs r0, 0x18
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0803FDB4
	cmp r1, 0x20
	bne _0803FE56
_0803FDB4:
	ldr r1, _0803FE6C
	lsls r0, r5, 1
	adds r0, r5
	adds r0, r6, r0
	adds r0, r1
	ldrb r2, [r0]
	movs r1, 0
	ldrsb r1, [r0, r1]
	cmp r1, 0
	ble _0803FDDA
	cmp r4, 0x1B
	bne _0803FDDA
	movs r0, 0x96
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	lsls r0, 24
	lsrs r2, r0, 24
_0803FDDA:
	lsls r2, 24
	asrs r2, 24
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r0, r2
	mov r1, sp
	strh r0, [r1]
	cmp r2, 0
	ble _0803FE2C
	adds r0, r7, 0
	movs r1, 0x26
	movs r2, 0
	bl GetMonData
	cmp r0, 0xB
	bne _0803FE08
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r0, 0x1
	mov r1, sp
	strh r0, [r1]
_0803FE08:
	adds r0, r7, 0
	movs r1, 0x23
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	bl sav1_map_get_name
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _0803FE2C
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r0, 0x1
	mov r1, sp
	strh r0, [r1]
_0803FE2C:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _0803FE3C
	movs r1, 0
	mov r0, sp
	strh r1, [r0]
_0803FE3C:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0xFF
	ble _0803FE4C
	movs r1, 0xFF
	mov r0, sp
	strh r1, [r0]
_0803FE4C:
	adds r0, r7, 0
	movs r1, 0x20
	mov r2, sp
	bl SetMonData
_0803FE56:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FE60: .4byte gUnknown_020239F8
_0803FE64: .4byte gTrainers
_0803FE68: .4byte gTrainerBattleOpponent
_0803FE6C: .4byte gUnknown_082082FE
	thumb_func_end sub_803FCD4

	thumb_func_start sub_803FE70
sub_803FE70: @ 803FE70
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	mov r8, r0
	lsls r1, 16
	lsrs r5, r1, 16
	movs r4, 0
	movs r7, 0
	movs r6, 0
_0803FE84:
	adds r1, r6, 0
	adds r1, 0x1A
	mov r0, r8
	movs r2, 0
	bl GetMonData
	mov r2, sp
	adds r1, r2, r6
	strb r0, [r1]
	ldrb r0, [r1]
	adds r0, r7, r0
	lsls r0, 16
	lsrs r7, r0, 16
	adds r6, 0x1
	cmp r6, 0x5
	ble _0803FE84
	movs r6, 0
	b _08040006
_0803FEA8:
	mov r0, r8
	movs r1, 0
	bl sub_8040178
	lsls r0, 24
	movs r2, 0x1
	cmp r0, 0
	beq _0803FEBA
	movs r2, 0x2
_0803FEBA:
	cmp r6, 0x5
	bhi _0803FF5C
	lsls r0, r6, 2
	ldr r1, _0803FEC8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803FEC8: .4byte _0803FECC
	.align 2, 0
_0803FECC:
	.4byte _0803FEE4
	.4byte _0803FEF8
	.4byte _0803FF0C
	.4byte _0803FF20
	.4byte _0803FF34
	.4byte _0803FF48
_0803FEE4:
	ldr r0, _0803FEF4
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xA]
	lsls r0, 30
	b _0803FF56
	.align 2, 0
_0803FEF4: .4byte gBaseStats
_0803FEF8:
	ldr r0, _0803FF08
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xA]
	b _0803FF54
	.align 2, 0
_0803FF08: .4byte gBaseStats
_0803FF0C:
	ldr r0, _0803FF1C
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xA]
	lsls r0, 26
	b _0803FF56
	.align 2, 0
_0803FF1C: .4byte gBaseStats
_0803FF20:
	ldr r0, _0803FF30
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xA]
	lsrs r0, 6
	b _0803FF58
	.align 2, 0
_0803FF30: .4byte gBaseStats
_0803FF34:
	ldr r0, _0803FF44
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xB]
	lsls r0, 30
	b _0803FF56
	.align 2, 0
_0803FF44: .4byte gBaseStats
_0803FF48:
	ldr r0, _0803FF84
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xB]
_0803FF54:
	lsls r0, 28
_0803FF56:
	lsrs r0, 30
_0803FF58:
	adds r4, r0, 0
	muls r4, r2
_0803FF5C:
	mov r0, r8
	movs r1, 0xC
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _0803FFA8
	ldr r0, _0803FF88
	ldr r1, _0803FF8C
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803FF94
	ldr r0, _0803FF90
	ldrb r0, [r0, 0x7]
	b _0803FFB0
	.align 2, 0
_0803FF84: .4byte gBaseStats
_0803FF88: .4byte gMain
_0803FF8C: .4byte 0x0000043d
_0803FF90: .4byte gEnigmaBerries
_0803FF94:
	ldr r0, _0803FFA0
	ldr r2, _0803FFA4
	adds r0, r2
	ldrb r0, [r0]
	b _0803FFB0
	.align 2, 0
_0803FFA0: .4byte gSaveBlock1
_0803FFA4: .4byte 0x00003688
_0803FFA8:
	bl itemid_get_x12
	lsls r0, 24
	lsrs r0, 24
_0803FFB0:
	cmp r0, 0x18
	bne _0803FFB8
	lsls r0, r4, 17
	lsrs r4, r0, 16
_0803FFB8:
	lsls r0, r4, 16
	asrs r2, r0, 16
	adds r1, r7, r2
	movs r0, 0xFF
	lsls r0, 1
	cmp r1, r0
	ble _0803FFD0
	adds r0, r2, r0
	adds r1, r7, r4
	subs r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
_0803FFD0:
	mov r0, sp
	adds r2, r0, r6
	ldrb r3, [r2]
	lsls r0, r4, 16
	asrs r1, r0, 16
	adds r0, r3, r1
	cmp r0, 0xFF
	ble _0803FFEC
	adds r0, r1, 0
	adds r0, 0xFF
	adds r1, r3, r4
	subs r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
_0803FFEC:
	adds r0, r3, r4
	strb r0, [r2]
	adds r0, r7, r4
	lsls r0, 16
	lsrs r7, r0, 16
	adds r1, r6, 0
	adds r1, 0x1A
	mov r0, r8
	bl SetMonData
	adds r6, 0x1
	cmp r6, 0x5
	bgt _0804000E
_08040006:
	ldr r0, _0804001C
	cmp r7, r0
	bhi _0804000E
	b _0803FEA8
_0804000E:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804001C: .4byte 0x000001fd
	thumb_func_end sub_803FE70

	thumb_func_start sub_8040020
sub_8040020: @ 8040020
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r5, 0
	movs r4, 0
_08040028:
	adds r1, r4, 0
	adds r1, 0x1A
	adds r0, r6, 0
	movs r2, 0
	bl GetMonData
	adds r0, r5, r0
	lsls r0, 16
	lsrs r5, r0, 16
	adds r4, 0x1
	cmp r4, 0x5
	ble _08040028
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8040020

	thumb_func_start sub_8040048
sub_8040048: @ 8040048
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	bl Random
	lsls r0, 16
	lsrs r5, r0, 16
	movs r0, 0x80
	lsls r0, 7
	cmp r5, r0
	beq _0804006E
	movs r0, 0x80
	lsls r0, 8
	cmp r5, r0
	beq _0804006E
	movs r0, 0xC0
	lsls r0, 8
	cmp r5, r0
	bne _08040104
_0804006E:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 16
	lsrs r5, r0, 16
	movs r0, 0x64
	muls r0, r5
	adds r4, r6, r0
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _0804006E
	adds r0, r4, 0
	movs r1, 0x2D
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	bne _0804006E
	ldr r1, _0804010C
	lsls r0, r5, 2
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r6, 0
	bl sub_8040178
	lsls r0, 24
	cmp r0, 0
	bne _08040104
	mov r4, sp
_080400B8:
	bl Random
	lsls r0, 24
	lsrs r0, 24
	strb r0, [r4]
	cmp r0, 0
	beq _080400B8
	movs r0, 0xF0
	mov r1, sp
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, 0
	beq _080400DA
	movs r0, 0x7
	ands r1, r0
	mov r0, sp
	strb r1, [r0]
_080400DA:
	mov r0, sp
	ldrb r0, [r0]
	lsls r1, r0, 4
	orrs r0, r1
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	strb r0, [r1]
	movs r1, 0xF3
	ands r1, r0
	mov r0, sp
	strb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	movs r0, 0x64
	muls r0, r5
	adds r0, r6, r0
	movs r1, 0x22
	mov r2, sp
	bl SetMonData
_08040104:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804010C: .4byte gBitTable
	thumb_func_end sub_8040048

	thumb_func_start sub_8040110
sub_8040110: @ 8040110
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	movs r3, 0
	movs r6, 0x1
	movs r5, 0
	cmp r4, 0
	beq _08040158
_08040124:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _0804014C
	movs r0, 0x64
	muls r0, r3
	adds r0, r7, r0
	movs r1, 0x22
	movs r2, 0
	str r3, [sp]
	bl GetMonData
	movs r1, 0xF
	ands r1, r0
	ldr r3, [sp]
	cmp r1, 0
	beq _0804014C
	orrs r5, r6
	lsls r0, r5, 24
	lsrs r5, r0, 24
_0804014C:
	adds r3, 0x1
	lsls r6, 1
	lsrs r4, 1
	cmp r4, 0
	bne _08040124
	b _0804016C
_08040158:
	adds r0, r7, 0
	movs r1, 0x22
	movs r2, 0
	bl GetMonData
	movs r1, 0xF
	ands r1, r0
	cmp r1, 0
	beq _0804016C
	movs r5, 0x1
_0804016C:
	adds r0, r5, 0
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8040110

	thumb_func_start sub_8040178
sub_8040178: @ 8040178
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	movs r3, 0
	movs r6, 0x1
	movs r5, 0
	cmp r4, 0
	beq _080401BC
_0804018C:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080401B0
	movs r0, 0x64
	muls r0, r3
	adds r0, r7, r0
	movs r1, 0x22
	movs r2, 0
	str r3, [sp]
	bl GetMonData
	ldr r3, [sp]
	cmp r0, 0
	beq _080401B0
	orrs r5, r6
	lsls r0, r5, 24
	lsrs r5, r0, 24
_080401B0:
	adds r3, 0x1
	lsls r6, 1
	lsrs r4, 1
	cmp r4, 0
	bne _0804018C
	b _080401CC
_080401BC:
	adds r0, r7, 0
	movs r1, 0x22
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _080401CC
	movs r5, 0x1
_080401CC:
	adds r0, r5, 0
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8040178

	thumb_func_start sub_80401D8
sub_80401D8: @ 80401D8
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r7, r0, 16
	movs r5, 0
	mov r6, sp
_080401E4:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08040224
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _0804023C
	adds r0, r4, 0
	movs r1, 0x22
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	strb r0, [r6]
	movs r1, 0xF
	adds r2, r0, 0
	ands r1, r2
	cmp r1, 0
	beq _0804023C
	cmp r1, r7
	bcc _0804021E
	cmp r7, 0x4
	bls _08040228
_0804021E:
	movs r0, 0xF0
	ands r0, r2
	b _0804022A
	.align 2, 0
_08040224: .4byte gPlayerParty
_08040228:
	subs r0, r2, r7
_0804022A:
	strb r0, [r6]
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0804024C
	adds r0, r1
	movs r1, 0x22
	mov r2, sp
	bl SetMonData
_0804023C:
	adds r5, 0x1
	cmp r5, 0x5
	ble _080401E4
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804024C: .4byte gPlayerParty
	thumb_func_end sub_80401D8

	thumb_func_start atkE5_pickupitemcalculation
atkE5_pickupitemcalculation: @ 8040250
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	bne _080402F6
	movs r5, 0
_0804026C:
	movs r0, 0x64
	adds r6, r5, 0
	muls r6, r0
	adds r4, r7, r6
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _080402F0
	adds r0, r4, 0
	movs r1, 0x22
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r1, r0, 24
	mov r0, sp
	strb r1, [r0]
	cmp r1, 0
	beq _080402F0
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	beq _080402F0
	cmp r5, 0
	beq _080402C6
	adds r0, r6, 0
	subs r0, 0x64
	adds r4, r7, r0
	adds r0, r4, 0
	movs r1, 0x22
	movs r2, 0
	bl GetMonData
	movs r1, 0xF0
	ands r1, r0
	cmp r1, 0
	bne _080402C6
	adds r0, r4, 0
	movs r1, 0x22
	mov r2, sp
	bl SetMonData
_080402C6:
	cmp r5, 0x5
	beq _080402F0
	movs r0, 0x64
	muls r0, r5
	adds r0, 0x64
	adds r4, r7, r0
	adds r0, r4, 0
	movs r1, 0x22
	movs r2, 0
	bl GetMonData
	movs r1, 0xF0
	ands r1, r0
	cmp r1, 0
	bne _080402F0
	adds r0, r4, 0
	movs r1, 0x22
	mov r2, sp
	bl SetMonData
	adds r5, 0x1
_080402F0:
	adds r5, 0x1
	cmp r5, 0x5
	ble _0804026C
_080402F6:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end atkE5_pickupitemcalculation

	thumb_func_start sub_8040300
sub_8040300: @ 8040300
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r6, 0
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	adds r0, 0x1
	mov r1, sp
	strb r0, [r1]
	adds r0, r6, 0
	movs r1, 0x19
	movs r2, 0
	bl GetMonData
	ldr r5, _08040358
	mov r1, sp
	ldrb r2, [r1]
	lsls r2, 2
	ldr r3, _0804035C
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 2
	adds r1, r3
	ldrb r3, [r1, 0x13]
	movs r1, 0xCA
	lsls r1, 1
	muls r1, r3
	adds r2, r1
	adds r2, r5
	ldr r1, [r2]
	cmp r0, r1
	bhi _08040360
	movs r0, 0
	b _0804036C
	.align 2, 0
_08040358: .4byte gExperienceTables
_0804035C: .4byte gBaseStats
_08040360:
	adds r0, r6, 0
	movs r1, 0x38
	mov r2, sp
	bl SetMonData
	movs r0, 0x1
_0804036C:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8040300

	thumb_func_start sub_8040374
sub_8040374: @ 8040374
	push {r4,r5,lr}
	lsls r1, 24
	lsrs r4, r1, 24
	adds r5, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	adds r3, r1, 0
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	bne _08040396
	movs r0, 0
	b _080403C2
_08040396:
	cmp r4, 0x1F
	bls _080403B4
	adds r0, r4, 0
	subs r0, 0x20
	movs r2, 0x1
	lsls r2, r0
	ldr r0, _080403B0
	lsls r1, 3
	adds r0, 0x4
	adds r1, r0
	ldr r0, [r1]
	ands r0, r2
	b _080403C2
	.align 2, 0
_080403B0: .4byte gTMHMLearnsets
_080403B4:
	movs r1, 0x1
	lsls r1, r5
	ldr r2, _080403C8
	lsls r0, r3, 3
	adds r0, r2
	ldr r0, [r0]
	ands r0, r1
_080403C2:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080403C8: .4byte gTMHMLearnsets
	thumb_func_end sub_8040374

	thumb_func_start sub_80403CC
sub_80403CC: @ 80403CC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	adds r6, r0, 0
	str r1, [sp, 0x8]
	movs r0, 0
	mov r10, r0
	adds r0, r6, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r6, 0
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0xC]
	movs r5, 0
	mov r4, sp
_08040402:
	adds r1, r5, 0
	adds r1, 0xD
	adds r0, r6, 0
	movs r2, 0
	bl GetMonData
	strh r0, [r4]
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _08040402
	movs r5, 0
	ldr r6, _08040510
	lsls r1, r7, 2
	adds r2, r1, r6
	ldr r3, [r2]
	ldrh r0, [r3]
	ldr r4, _08040514
	str r1, [sp, 0x14]
	cmp r0, r4
	beq _080404FC
	mov r9, r2
	str r3, [sp, 0x10]
_08040430:
	lsls r2, r5, 1
	ldr r1, [sp, 0x10]
	adds r0, r2, r1
	ldrh r3, [r0]
	movs r0, 0xFE
	lsls r0, 8
	ands r0, r3
	ldr r4, [sp, 0xC]
	lsls r1, r4, 9
	adds r7, r2, 0
	adds r5, 0x1
	mov r12, r5
	cmp r0, r1
	bgt _080404E6
	movs r4, 0
	mov r0, sp
	ldrh r1, [r0]
	ldr r0, _08040518
	ands r0, r3
	cmp r1, r0
	beq _08040480
	ldr r0, [sp, 0x14]
	ldr r1, _08040510
	adds r6, r0, r1
	ldr r2, _08040518
	mov r8, r2
	mov r3, sp
	adds r5, r7, 0
_08040468:
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	bgt _08040480
	ldr r0, [r6]
	adds r0, r5, r0
	ldrh r1, [r0]
	ldrh r2, [r3]
	mov r0, r8
	ands r0, r1
	cmp r2, r0
	bne _08040468
_08040480:
	cmp r4, 0x4
	bne _080404E6
	movs r4, 0
	cmp r4, r10
	bge _080404C4
	mov r1, r9
	ldr r0, [r1]
	adds r0, r7, r0
	ldrh r1, [r0]
	ldr r0, [sp, 0x8]
	ldrh r2, [r0]
	ldr r0, _08040518
	ands r0, r1
	cmp r2, r0
	beq _080404C4
	ldr r1, [sp, 0x14]
	ldr r2, _08040510
	adds r6, r1, r2
	ldr r0, _08040518
	mov r8, r0
	ldr r3, [sp, 0x8]
	adds r5, r7, 0
_080404AC:
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, r10
	bge _080404C4
	ldr r0, [r6]
	adds r0, r5, r0
	ldrh r1, [r0]
	ldrh r2, [r3]
	mov r0, r8
	ands r0, r1
	cmp r2, r0
	bne _080404AC
_080404C4:
	cmp r4, r10
	bne _080404E6
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r2, r4, 1
	ldr r1, [sp, 0x8]
	adds r2, r1
	mov r4, r9
	ldr r0, [r4]
	adds r0, r7, r0
	ldrh r1, [r0]
	ldr r0, _08040518
	ands r0, r1
	strh r0, [r2]
_080404E6:
	mov r5, r12
	cmp r5, 0x13
	bgt _080404FC
	mov r1, r9
	ldr r0, [r1]
	lsls r1, r5, 1
	adds r1, r0
	ldrh r0, [r1]
	ldr r2, _08040514
	cmp r0, r2
	bne _08040430
_080404FC:
	mov r0, r10
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08040510: .4byte gLevelUpLearnsets
_08040514: .4byte 0x0000ffff
_08040518: .4byte 0x000001ff
	thumb_func_end sub_80403CC

	thumb_func_start sub_804051C
sub_804051C: @ 804051C
	push {r4-r7,lr}
	adds r6, r1, 0
	lsls r0, 16
	movs r5, 0
	movs r4, 0
	ldr r1, _08040568
	lsrs r0, 14
	adds r0, r1
	ldr r2, [r0]
	ldrh r0, [r2]
	ldr r1, _0804056C
	cmp r0, r1
	beq _08040560
	ldr r0, _08040570
	mov r12, r0
	adds r7, r1, 0
	adds r3, r2, 0
_0804053E:
	adds r1, r5, 0
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 1
	adds r1, r6
	ldrh r2, [r3]
	mov r0, r12
	ands r0, r2
	strh r0, [r1]
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x13
	bgt _08040560
	ldrh r0, [r3]
	cmp r0, r7
	bne _0804053E
_08040560:
	adds r0, r5, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08040568: .4byte gLevelUpLearnsets
_0804056C: .4byte 0x0000ffff
_08040570: .4byte 0x000001ff
	thumb_func_end sub_804051C

	thumb_func_start sub_8040574
sub_8040574: @ 8040574
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x3C
	adds r6, r0, 0
	movs r0, 0
	mov r10, r0
	adds r0, r6, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r6, 0
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x30]
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	bne _080405B0
	movs r0, 0
	b _080406BA
_080405B0:
	movs r5, 0
	lsls r4, 2
	str r4, [sp, 0x38]
	mov r4, sp
_080405B8:
	adds r1, r5, 0
	adds r1, 0xD
	adds r0, r6, 0
	movs r2, 0
	bl GetMonData
	strh r0, [r4]
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _080405B8
	movs r5, 0
	ldr r3, _080406CC
	ldr r2, [sp, 0x38]
	adds r1, r2, r3
	ldr r0, [r1]
	ldrh r0, [r0]
	ldr r2, _080406D0
	cmp r0, r2
	beq _080406B8
	mov r9, r1
	mov r4, sp
	adds r4, 0x8
	str r4, [sp, 0x34]
_080405E8:
	mov r1, r9
	ldr r0, [r1]
	lsls r2, r5, 1
	adds r0, r2, r0
	ldrh r3, [r0]
	movs r0, 0xFE
	lsls r0, 8
	ands r0, r3
	ldr r4, [sp, 0x30]
	lsls r1, r4, 9
	adds r7, r2, 0
	adds r5, 0x1
	mov r12, r5
	cmp r0, r1
	bgt _080406A2
	movs r4, 0
	mov r0, sp
	ldrh r1, [r0]
	ldr r0, _080406D4
	ands r0, r3
	cmp r1, r0
	beq _0804063A
	ldr r0, [sp, 0x38]
	ldr r1, _080406CC
	adds r6, r0, r1
	ldr r2, _080406D4
	mov r8, r2
	mov r3, sp
	adds r5, r7, 0
_08040622:
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	bgt _0804063A
	ldr r0, [r6]
	adds r0, r5, r0
	ldrh r1, [r0]
	ldrh r2, [r3]
	mov r0, r8
	ands r0, r1
	cmp r2, r0
	bne _08040622
_0804063A:
	cmp r4, 0x4
	bne _080406A2
	movs r4, 0
	cmp r4, r10
	bge _08040680
	mov r1, r9
	ldr r0, [r1]
	adds r0, r7, r0
	ldrh r1, [r0]
	ldr r0, [sp, 0x34]
	ldrh r2, [r0]
	ldr r0, _080406D4
	ands r0, r1
	add r1, sp, 0x8
	cmp r2, r0
	beq _08040680
	ldr r2, [sp, 0x38]
	ldr r0, _080406CC
	adds r6, r2, r0
	ldr r2, _080406D4
	mov r8, r2
	adds r3, r1, 0
	adds r5, r7, 0
_08040668:
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, r10
	bge _08040680
	ldr r0, [r6]
	adds r0, r5, r0
	ldrh r1, [r0]
	ldrh r2, [r3]
	mov r0, r8
	ands r0, r1
	cmp r2, r0
	bne _08040668
_08040680:
	cmp r4, r10
	bne _080406A2
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r2, r4, 1
	ldr r4, [sp, 0x34]
	adds r2, r4, r2
	mov r1, r9
	ldr r0, [r1]
	adds r0, r7, r0
	ldrh r1, [r0]
	ldr r0, _080406D4
	ands r0, r1
	strh r0, [r2]
_080406A2:
	mov r5, r12
	cmp r5, 0x13
	bgt _080406B8
	mov r2, r9
	ldr r0, [r2]
	lsls r1, r5, 1
	adds r1, r0
	ldrh r0, [r1]
	ldr r4, _080406D0
	cmp r0, r4
	bne _080405E8
_080406B8:
	mov r0, r10
_080406BA:
	add sp, 0x3C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080406CC: .4byte gLevelUpLearnsets
_080406D0: .4byte 0x0000ffff
_080406D4: .4byte 0x000001ff
	thumb_func_end sub_8040574

	thumb_func_start sub_80406D8
sub_80406D8: @ 80406D8
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl sub_806912C
	cmp r0, 0
	beq _080406F2
	adds r0, r4, 0
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	b _0804070A
_080406F2:
	adds r0, r4, 0
	bl SpeciesToHoennPokedexNum
	adds r4, r0, 0
	cmp r4, 0xCA
	bls _08040708
	ldr r0, _08040704
	b _0804070A
	.align 2, 0
_08040704: .4byte 0x0000ffff
_08040708:
	adds r0, r4, 0
_0804070A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80406D8

	thumb_func_start sub_8040710
sub_8040710: @ 8040710
	push {lr}
	ldr r1, _08040724
	movs r2, 0
	adds r0, r1, 0x3
_08040718:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _08040718
	pop {r0}
	bx r0
	.align 2, 0
_08040724: .4byte gUnknown_02024E84
	thumb_func_end sub_8040710

	thumb_func_start sub_8040728
sub_8040728: @ 8040728
	push {lr}
	ldr r0, _0804073C
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 5
	ands r0, r1
	cmp r0, 0
	beq _08040744
	ldr r0, _08040740
	b _080408B2
	.align 2, 0
_0804073C: .4byte gUnknown_020239F8
_08040740: .4byte 0x000001cf
_08040744:
	movs r0, 0x80
	lsls r0, 7
	ands r0, r1
	cmp r0, 0
	beq _08040754
	movs r0, 0xE7
	lsls r0, 1
	b _080408B2
_08040754:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0804075E
	b _080408A8
_0804075E:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _08040768
	b _080408B0
_08040768:
	ldr r3, _0804078C
	ldr r2, _08040790
	ldrh r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	ldrb r0, [r0, 0x1]
	subs r0, 0x2
	cmp r0, 0x31
	bls _08040780
	b _080408A8
_08040780:
	lsls r0, 2
	ldr r1, _08040794
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804078C: .4byte gTrainers
_08040790: .4byte gTrainerBattleOpponent
_08040794: .4byte _08040798
	.align 2, 0
_08040798:
	.4byte _08040860
	.4byte _08040866
	.4byte _08040866
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A0
	.4byte _0804086C
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _08040872
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _0804087C
	.4byte _080408A8
	.4byte _080408A8
	.4byte _08040860
	.4byte _08040866
	.4byte _08040866
_08040860:
	movs r0, 0xE9
	lsls r0, 1
	b _080408B2
_08040866:
	movs r0, 0xE5
	lsls r0, 1
	b _080408B2
_0804086C:
	movs r0, 0xE6
	lsls r0, 1
	b _080408B2
_08040872:
	ldr r0, _08040878
	b _080408B2
	.align 2, 0
_08040878: .4byte 0x000001cd
_0804087C:
	ldrh r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _08040898
	adds r0, r1
	ldr r1, _0804089C
	bl StringCompare
	cmp r0, 0
	beq _080408A8
	movs r0, 0xE8
	lsls r0, 1
	b _080408B2
	.align 2, 0
_08040898: .4byte gTrainers + 0x4
_0804089C: .4byte gUnknown_08400E42
_080408A0:
	ldr r0, _080408A4
	b _080408B2
	.align 2, 0
_080408A4: .4byte 0x000001d1
_080408A8:
	ldr r0, _080408AC
	b _080408B2
	.align 2, 0
_080408AC: .4byte 0x000001cb
_080408B0:
	ldr r0, _080408B8
_080408B2:
	pop {r1}
	bx r1
	.align 2, 0
_080408B8: .4byte 0x000001c9
	thumb_func_end sub_8040728

	thumb_func_start sub_80408BC
sub_80408BC: @ 80408BC
	push {lr}
	bl ResetMapMusic
	bl m4aMPlayAllStop
	bl sub_8040728
	lsls r0, 16
	lsrs r0, 16
	bl PlayBGM
	pop {r0}
	bx r0
	thumb_func_end sub_80408BC

	thumb_func_start current_map_music_set__default_for_battle
current_map_music_set__default_for_battle: @ 80408D8
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl ResetMapMusic
	bl m4aMPlayAllStop
	cmp r4, 0
	beq _080408F2
	adds r0, r4, 0
	bl PlayNewMapMusic
	b _080408FE
_080408F2:
	bl sub_8040728
	lsls r0, 16
	lsrs r0, 16
	bl PlayNewMapMusic
_080408FE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end current_map_music_set__default_for_battle

	thumb_func_start pokemon_get_pal
pokemon_get_pal: @ 8040904
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0
	bl GetMonData
	adds r6, r0, 0
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl GetMonData
	adds r2, r0, 0
	adds r0, r4, 0
	adds r1, r6, 0
	bl species_and_otid_get_pal
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end pokemon_get_pal

	thumb_func_start species_and_otid_get_pal
species_and_otid_get_pal: @ 804093C
	push {r4,r5,lr}
	adds r3, r2, 0
	lsls r0, 16
	lsrs r4, r0, 16
	adds r5, r4, 0
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	bls _08040958
	ldr r0, _08040954
	ldr r0, [r0]
	b _08040984
	.align 2, 0
_08040954: .4byte gMonPaletteTable
_08040958:
	lsrs r0, r1, 16
	ldr r2, _08040974
	ands r1, r2
	eors r0, r1
	lsrs r1, r3, 16
	eors r0, r1
	ands r3, r2
	eors r0, r3
	cmp r0, 0x7
	bls _0804097C
	ldr r0, _08040978
	lsls r1, r4, 3
	b _08040980
	.align 2, 0
_08040974: .4byte 0x0000ffff
_08040978: .4byte gMonPaletteTable
_0804097C:
	ldr r0, _0804098C
	lsls r1, r5, 3
_08040980:
	adds r1, r0
	ldr r0, [r1]
_08040984:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0804098C: .4byte gMonShinyPaletteTable
	thumb_func_end species_and_otid_get_pal

	thumb_func_start sub_8040990
sub_8040990: @ 8040990
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0
	bl GetMonData
	adds r6, r0, 0
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl GetMonData
	adds r2, r0, 0
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_80409C8
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8040990

	thumb_func_start sub_80409C8
sub_80409C8: @ 80409C8
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsrs r0, r1, 16
	ldr r3, _080409E8
	ands r1, r3
	eors r0, r1
	lsrs r1, r2, 16
	eors r0, r1
	ands r2, r3
	eors r0, r2
	cmp r0, 0x7
	bls _080409F0
	lsls r0, r4, 3
	ldr r1, _080409EC
	b _080409F4
	.align 2, 0
_080409E8: .4byte 0x0000ffff
_080409EC: .4byte gMonPaletteTable
_080409F0:
	lsls r0, r4, 3
	ldr r1, _080409FC
_080409F4:
	adds r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080409FC: .4byte gMonShinyPaletteTable
	thumb_func_end sub_80409C8

	thumb_func_start sub_8040A00
sub_8040A00: @ 8040A00
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r2, _08040A24
	ldrh r0, [r2]
	ldr r1, _08040A28
	cmp r0, r1
	beq _08040A32
	adds r4, r1, 0
	adds r1, r2, 0
_08040A14:
	ldrh r0, [r2]
	adds r1, 0x2
	adds r2, 0x2
	cmp r0, r3
	bne _08040A2C
	movs r0, 0x1
	b _08040A34
	.align 2, 0
_08040A24: .4byte gUnknown_0820831A
_08040A28: .4byte 0x0000ffff
_08040A2C:
	ldrh r0, [r1]
	cmp r0, r4
	bne _08040A14
_08040A32:
	movs r0, 0
_08040A34:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8040A00

	thumb_func_start sub_8040A3C
sub_8040A3C: @ 8040A3C
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08040A50
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x19]
	lsrs r0, 7
	bx lr
	.align 2, 0
_08040A50: .4byte gBaseStats
	thumb_func_end sub_8040A3C

	thumb_func_start sub_8040A54
sub_8040A54: @ 8040A54
	push {r4,lr}
	lsls r4, r1, 24
	lsrs r4, 24
	bl GetNature
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08040A78
	lsls r1, r0, 2
	adds r1, r0
	adds r1, r4
	adds r1, r2
	movs r0, 0
	ldrsb r0, [r1, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08040A78: .4byte gUnknown_083F7E28
	thumb_func_end sub_8040A54

	thumb_func_start sub_8040A7C
sub_8040A7C: @ 8040A7C
	push {r4,lr}
	lsls r4, r1, 24
	lsrs r4, 24
	bl GetNatureFromPersonality
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08040AA0
	lsls r1, r0, 2
	adds r1, r0
	adds r1, r4
	adds r1, r2
	movs r0, 0
	ldrsb r0, [r1, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08040AA0: .4byte gUnknown_083F7E28
	thumb_func_end sub_8040A7C

	thumb_func_start sub_8040AA4
sub_8040AA4: @ 8040AA4
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	movs r1, 0x7
	mov r2, sp
	bl GetMonData
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl GetMonData
	mov r1, sp
	bl sub_8040AD0
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8040AA4

	thumb_func_start sub_8040AD0
sub_8040AD0: @ 8040AD0
	push {r4,r5,lr}
	adds r5, r1, 0
	ldr r3, _08040B10
	ldrb r2, [r3, 0xA]
	ldrb r1, [r3, 0xB]
	lsls r1, 8
	orrs r2, r1
	ldrb r1, [r3, 0xC]
	lsls r1, 16
	orrs r2, r1
	ldrb r1, [r3, 0xD]
	lsls r1, 24
	orrs r2, r1
	cmp r0, r2
	bne _08040B14
	movs r4, 0
	ldrb r0, [r5]
	cmp r0, 0xFF
	beq _08040B0C
	adds r2, r5, 0
_08040AF8:
	adds r1, r4, r3
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08040B14
	adds r2, 0x1
	adds r4, 0x1
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _08040AF8
_08040B0C:
	movs r0, 0
	b _08040B16
	.align 2, 0
_08040B10: .4byte gSaveBlock2
_08040B14:
	movs r0, 0x1
_08040B16:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8040AD0

	thumb_func_start sub_8040B1C
sub_8040B1C: @ 8040B1C
	push {lr}
	bl pokemon_restore_pp
	pop {r0}
	bx r0
	thumb_func_end sub_8040B1C

	thumb_func_start pokemon_restore_pp
pokemon_restore_pp: @ 8040B28
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r6, 0
_08040B30:
	adds r4, r6, 0
	adds r4, 0xD
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0
	bl GetBoxMonData
	cmp r0, 0
	beq _08040B7C
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0
	bl GetBoxMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x15
	movs r2, 0
	bl GetBoxMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r2, r6, 24
	lsrs r2, 24
	adds r0, r4, 0
	bl CalculatePPWithBonus
	mov r1, sp
	strb r0, [r1]
	adds r1, r6, 0
	adds r1, 0x11
	adds r0, r5, 0
	mov r2, sp
	bl SetBoxMonData
_08040B7C:
	adds r6, 0x1
	cmp r6, 0x3
	ble _08040B30
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end pokemon_restore_pp

	thumb_func_start sub_8040B8C
sub_8040B8C: @ 8040B8C
	push {r4,r5,lr}
	ldr r1, _08040BCC
	ldr r2, _08040BD0
	ldr r3, _08040BD4
	adds r0, r2, r3
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r5, _08040BD8
	movs r0, 0xFD
	strb r0, [r5]
	movs r0, 0x4
	strb r0, [r5, 0x1]
	ldr r0, _08040BDC
	adds r4, r2, r0
	ldrb r0, [r4]
	strb r0, [r5, 0x2]
	movs r0, 0xFF
	strb r0, [r5, 0x4]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08040BE4
	ldr r1, _08040BE0
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrb r0, [r0]
	bl pokemon_order_func
	b _08040BEE
	.align 2, 0
_08040BCC: .4byte byte_2024C06
_08040BD0: .4byte 0x02000000
_08040BD4: .4byte 0x000160c0
_08040BD8: .4byte gUnknown_030041C0
_08040BDC: .4byte 0x00016054
_08040BE0: .4byte gUnknown_02024A6A
_08040BE4:
	ldr r0, _08040C24
	ldrb r1, [r4]
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
_08040BEE:
	strb r0, [r5, 0x3]
	ldr r4, _08040C28
	movs r0, 0xFD
	strb r0, [r4]
	movs r0, 0x4
	strb r0, [r4, 0x1]
	ldr r1, _08040C2C
	ldrb r0, [r1]
	strb r0, [r4, 0x2]
	ldr r2, _08040C24
	ldrb r0, [r1]
	lsls r0, 1
	adds r0, r2
	ldrb r0, [r0]
	bl pokemon_order_func
	strb r0, [r4, 0x3]
	movs r0, 0xFF
	strb r0, [r4, 0x4]
	ldr r0, _08040C30
	ldr r1, _08040C34
	bl sub_8120FFC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08040C24: .4byte gUnknown_02024A6A
_08040C28: .4byte gUnknown_03004290
_08040C2C: .4byte gUnknown_02024E6C
_08040C30: .4byte gUnknown_083FFCCA
_08040C34: .4byte gStringVar4
	thumb_func_end sub_8040B8C

	thumb_func_start sub_8040C38
sub_8040C38: @ 8040C38
	push {r4,r5,lr}
	ldr r0, _08040C90
	ldrh r1, [r0]
	ldr r0, _08040C94
	ands r0, r1
	cmp r0, 0
	bne _08040CAC
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r4, _08040C98
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08040C9C
	lsls r1, r0, 3
	subs r1, r0
	lsls r3, r1, 2
	adds r1, r3, r2
	ldrh r0, [r1, 0xC]
	ldrh r1, [r1, 0xE]
	cmp r0, r1
	beq _08040C82
	cmp r5, 0x2C
	bls _08040CAC
	cmp r5, 0x5E
	bhi _08040CA0
_08040C82:
	adds r2, 0xC
	adds r2, r3, r2
	adds r0, r4, 0
	movs r1, 0xC
	bl SetMonData
	b _08040CAC
	.align 2, 0
_08040C90: .4byte gUnknown_020239F8
_08040C94: .4byte 0x00002008
_08040C98: .4byte gEnemyParty
_08040C9C: .4byte gBaseStats
_08040CA0:
	adds r2, 0xE
	adds r2, r3, r2
	adds r0, r4, 0
	movs r1, 0xC
	bl SetMonData
_08040CAC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8040C38

	thumb_func_start sub_8040CB4
sub_8040CB4: @ 8040CB4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	movs r2, 0
	bl GetMonData
	adds r5, r0, 0
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	adds r0, r5, 0
	bl sub_8040CE0
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8040CB4

	thumb_func_start sub_8040CE0
sub_8040CE0: @ 8040CE0
	push {r4,lr}
	movs r4, 0
	lsrs r2, r0, 16
	ldr r3, _08040D04
	ands r0, r3
	eors r2, r0
	lsrs r0, r1, 16
	eors r2, r0
	ands r1, r3
	eors r2, r1
	cmp r2, 0x7
	bhi _08040CFA
	movs r4, 0x1
_08040CFA:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08040D04: .4byte 0x0000ffff
	thumb_func_end sub_8040CE0

	thumb_func_start sub_8040D08
sub_8040D08: @ 8040D08
	push {r4,lr}
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08040D38
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x18]
	movs r0, 0x2
	eors r0, r1
	bl sub_803FC34
	adds r1, r0, 0
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r4, 0x8
	adds r0, r4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08040D38: .4byte gLinkPlayers
	thumb_func_end sub_8040D08

	thumb_func_start sub_8040D3C
sub_8040D3C: @ 8040D3C
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r1, r0, 16
	adds r0, r1, 0
	lsls r2, 24
	lsrs r2, 24
	movs r3, 0
	cmp r1, 0x20
	beq _08040D54
	cmp r1, 0x1D
	bne _08040D7E
_08040D54:
	cmp r2, 0x2
	bne _08040D68
	movs r0, 0xB
	muls r1, r0
	ldr r0, _08040D64
	adds r1, r0
	b _08040D70
	.align 2, 0
_08040D64: .4byte gSpeciesNames
_08040D68:
	ldr r1, _08040D88
	cmp r0, 0x20
	bne _08040D70
	subs r1, 0xB
_08040D70:
	adds r0, r4, 0
	bl StringCompareWithoutExtCtrlCodes
	movs r3, 0
	cmp r0, 0
	bne _08040D7E
	movs r3, 0x1
_08040D7E:
	adds r0, r3, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08040D88: .4byte gUnknown_08208337
	thumb_func_end sub_8040D3C

	thumb_func_start sub_8040D8C
sub_8040D8C: @ 8040D8C
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0x2
	ldrb r0, [r1]
	cmp r0, 0xFC
	bne _08040DA2
	ldrb r0, [r1, 0x1]
	cmp r0, 0x15
	bne _08040DA2
	movs r2, 0x1
_08040DA2:
	adds r0, r3, 0
	bl sub_8040D3C
	pop {r1}
	bx r1
	thumb_func_end sub_8040D8C

	thumb_func_start unref_sub_8040DAC
unref_sub_8040DAC: @ 8040DAC
	push {r4-r6,lr}
	sub sp, 0xC
	adds r6, r0, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	movs r1, 0x3
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	adds r0, r5, 0
	mov r1, sp
	adds r2, r4, 0
	bl sub_8040D3C
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8040DAC

	.align 2, 0 @ Don't pad with nop.
