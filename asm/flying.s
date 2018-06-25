	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	@ flying

	thumb_func_start sub_80DA4D8
sub_80DA4D8: @ 80DA4D8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	adds r5, r7, 0
	adds r5, 0x2E
	ldr r0, _080DA4F8 @ =gBattleAnimArgs
	ldrh r1, [r0, 0xE]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080DA500
	ldr r0, _080DA4FC @ =gAnimBankAttacker
	b _080DA502
	.align 2, 0
_080DA4F8: .4byte gBattleAnimArgs
_080DA4FC: .4byte gAnimBankAttacker
_080DA500:
	ldr r0, _080DA5B0 @ =gAnimBankTarget
_080DA502:
	ldrb r6, [r0]
	adds r0, r6, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080DA518
	ldr r1, _080DA5B4 @ =gBattleAnimArgs
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_080DA518:
	adds r0, r6, 0
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	ldr r4, _080DA5B4 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r7, 0x20]
	adds r0, r6, 0
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	ldrh r1, [r4, 0x2]
	lsrs r0, 24
	adds r1, r0, r1
	strh r1, [r7, 0x22]
	lsls r1, 8
	strh r1, [r5, 0x8]
	ldrh r1, [r4, 0xC]
	adds r0, r1
	lsls r0, 1
	ldrh r2, [r5, 0xE]
	movs r1, 0x1
	ands r1, r2
	orrs r1, r0
	strh r1, [r5, 0xE]
	ldrb r0, [r5]
	movs r2, 0x4
	mov r8, r2
	mov r1, r8
	orrs r0, r1
	strb r0, [r5]
	ldrh r0, [r4, 0x4]
	ldrb r1, [r4, 0x4]
	strh r1, [r5, 0x2]
	lsls r0, 16
	lsrs r0, 24
	strh r0, [r5, 0xA]
	ldrh r0, [r4, 0x6]
	strh r0, [r5, 0x4]
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x6]
	ldrh r0, [r4, 0xA]
	strh r0, [r5, 0xC]
	subs r1, 0x40
	lsls r1, 16
	lsrs r1, 16
	cmp r1, 0x7F
	bhi _080DA618
	ldr r0, _080DA5B8 @ =gMain
	ldr r2, _080DA5BC @ =0x0000043d
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080DA5C0
	adds r0, r6, 0
	bl sub_8079ED4
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	lsls r0, 2
	ldrb r2, [r7, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, 0x5]
	b _080DA5D8
	.align 2, 0
_080DA5B0: .4byte gAnimBankTarget
_080DA5B4: .4byte gBattleAnimArgs
_080DA5B8: .4byte gMain
_080DA5BC: .4byte 0x0000043d
_080DA5C0:
	adds r0, r6, 0
	bl sub_8079ED4
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r7, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, 0x5]
_080DA5D8:
	ldrb r1, [r5, 0xE]
	movs r4, 0x2
	negs r4, r4
	adds r0, r4, 0
	ands r0, r1
	strb r0, [r5, 0xE]
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	bne _080DA678
	adds r3, r7, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r0, r2, 31
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	adds r0, r4, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r7, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x4
	b _080DA66E
_080DA618:
	adds r0, r6, 0
	bl sub_8079ED4
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r7, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, 0x5]
	ldrb r0, [r5, 0xE]
	movs r4, 0x1
	orrs r0, r4
	strb r0, [r5, 0xE]
	movs r2, 0x4
	ldrsh r0, [r5, r2]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080DA678
	adds r3, r7, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r1, r2, 31
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	ands r1, r4
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r7, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	mov r1, r8
_080DA66E:
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
_080DA678:
	ldrh r1, [r5, 0x2]
	lsrs r1, 6
	lsls r1, 4
	ldrb r2, [r5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	ldr r3, _080DA6E4 @ =gSineTable
	ldrh r0, [r5, 0x2]
	lsls r0, 1
	adds r0, r3
	movs r2, 0
	ldrsh r1, [r0, r2]
	ldrb r0, [r5, 0xC]
	muls r0, r1
	asrs r0, 8
	strh r0, [r7, 0x24]
	ldrb r2, [r7, 0x3]
	lsls r2, 26
	lsrs r2, 27
	movs r1, 0x24
	ldrsh r0, [r7, r1]
	negs r0, r0
	asrs r0, 1
	ldrb r5, [r5, 0xA]
	adds r0, r5
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r3
	ldrh r4, [r1]
	ldr r1, _080DA6E8 @ =gOamMatrices
	lsls r2, 3
	adds r2, r1
	adds r0, 0x40
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r2, 0x6]
	strh r0, [r2]
	strh r4, [r2, 0x2]
	lsls r0, r4, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r2, 0x4]
	ldr r0, _080DA6EC @ =sub_80DA6F0
	str r0, [r7, 0x1C]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DA6E4: .4byte gSineTable
_080DA6E8: .4byte gOamMatrices
_080DA6EC: .4byte sub_80DA6F0
	thumb_func_end sub_80DA4D8

	thumb_func_start sub_80DA6F0
sub_80DA6F0: @ 80DA6F0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r5, r0, 0
	movs r6, 0
	movs r0, 0x2E
	adds r0, r5
	mov r12, r0
	ldrb r2, [r0]
	movs r7, 0x1
	movs r1, 0x1
	mov r9, r1
	mov r0, r9
	ands r0, r2
	cmp r0, 0
	beq _080DA730
	mov r3, r12
	ldrb r0, [r3, 0x1]
	adds r1, r0, 0
	adds r1, 0xFF
	strb r1, [r3, 0x1]
	lsls r0, 24
	cmp r0, 0
	beq _080DA724
	b _080DAD1A
_080DA724:
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r3]
	strb r6, [r3, 0x1]
	b _080DAD1A
_080DA730:
	mov r4, r12
	ldrh r0, [r4, 0x2]
	lsrs r4, r0, 6
	mov r8, r0
	cmp r4, 0x1
	bne _080DA73E
	b _080DA896
_080DA73E:
	cmp r4, 0x1
	bgt _080DA748
	cmp r4, 0
	beq _080DA756
	b _080DAC52
_080DA748:
	cmp r4, 0x2
	bne _080DA74E
	b _080DA9C8
_080DA74E:
	cmp r4, 0x3
	bne _080DA754
	b _080DAB0E
_080DA754:
	b _080DAC52
_080DA756:
	lsls r1, r2, 24
	lsrs r0, r1, 28
	cmp r0, 0x1
	bne _080DA76C
	movs r0, 0x8
	orrs r0, r2
	orrs r0, r7
	mov r1, r12
	strb r0, [r1]
	strb r6, [r1, 0x1]
	b _080DA88A
_080DA76C:
	lsrs r0, r1, 28
	cmp r0, 0x3
	bne _080DA790
	lsls r0, r2, 30
	lsrs r0, 31
	movs r1, 0x1
	eors r0, r1
	ands r0, r7
	lsls r0, 1
	movs r1, 0x3
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	orrs r1, r7
	mov r2, r12
	strb r1, [r2]
	strb r6, [r2, 0x1]
	b _080DA88A
_080DA790:
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _080DA88A
	adds r3, r5, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r1, r2, 31
	lsrs r1, 31
	movs r4, 0x1
	eors r1, r4
	ands r1, r7
	movs r6, 0x2
	negs r6, r6
	adds r0, r6, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r5, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	mov r3, r12
	ldrb r1, [r3]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080DA87A
	ldr r0, _080DA80C @ =gMain
	ldr r1, _080DA810 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080DA82E
	ldrb r1, [r3, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080DA814
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080DA868
	.align 2, 0
_080DA80C: .4byte gMain
_080DA810: .4byte 0x0000043d
_080DA814:
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080DA866
_080DA82E:
	mov r0, r12
	ldrb r1, [r0, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080DA85C
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0xC
	strb r0, [r1]
	mov r1, r12
	ldrb r2, [r1, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r4
	ands r0, r7
	adds r1, r6, 0
	ands r1, r2
	orrs r1, r0
	mov r2, r12
	strb r1, [r2, 0xE]
	b _080DA87A
_080DA85C:
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0xC
	strb r0, [r1]
_080DA866:
	mov r3, r12
_080DA868:
	ldrb r2, [r3, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r4
	ands r0, r7
	adds r1, r6, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0xE]
_080DA87A:
	mov r4, r12
	ldrb r1, [r4]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldrh r0, [r4, 0x2]
	mov r8, r0
_080DA88A:
	mov r2, r12
	ldrb r1, [r2]
	movs r0, 0xF
	ands r0, r1
	strb r0, [r2]
	b _080DAC52
_080DA896:
	lsls r1, r2, 24
	lsrs r0, r1, 28
	cmp r0, 0
	bne _080DA8AC
	movs r0, 0x8
	orrs r0, r2
	orrs r0, r7
	mov r3, r12
	strb r0, [r3]
	strb r6, [r3, 0x1]
	b _080DA9BC
_080DA8AC:
	lsrs r0, r1, 28
	cmp r0, 0x2
	bne _080DA8BE
	adds r0, r2, 0
	orrs r0, r7
	mov r4, r12
	strb r0, [r4]
	strb r6, [r4, 0x1]
	b _080DA9BC
_080DA8BE:
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _080DA9BC
	adds r3, r5, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r1, r2, 31
	lsrs r1, 31
	movs r4, 0x1
	eors r1, r4
	ands r1, r7
	movs r6, 0x2
	negs r6, r6
	adds r0, r6, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r5, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	mov r0, r12
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080DA9AC
	ldr r0, _080DA940 @ =gMain
	ldr r1, _080DA944 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080DA962
	mov r2, r12
	ldrb r1, [r2, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080DA948
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	mov r3, r12
	b _080DA978
	.align 2, 0
_080DA940: .4byte gMain
_080DA944: .4byte 0x0000043d
_080DA948:
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080DA996
_080DA962:
	mov r3, r12
	ldrb r1, [r3, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080DA98C
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0xC
	strb r0, [r1]
_080DA978:
	ldrb r2, [r3, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r4
	ands r0, r7
	adds r1, r6, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0xE]
	b _080DA9AC
_080DA98C:
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0xC
	strb r0, [r1]
_080DA996:
	mov r0, r12
	ldrb r2, [r0, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r4
	ands r0, r7
	adds r1, r6, 0
	ands r1, r2
	orrs r1, r0
	mov r2, r12
	strb r1, [r2, 0xE]
_080DA9AC:
	mov r3, r12
	ldrb r1, [r3]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldrh r4, [r3, 0x2]
	mov r8, r4
_080DA9BC:
	mov r1, r12
	ldrb r0, [r1]
	movs r1, 0xF
	ands r1, r0
	movs r0, 0x10
	b _080DAC4C
_080DA9C8:
	lsls r1, r2, 24
	lsrs r0, r1, 28
	cmp r0, 0x3
	bne _080DA9DE
	movs r0, 0x8
	orrs r0, r2
	orrs r0, r7
	mov r3, r12
	strb r0, [r3]
	strb r6, [r3, 0x1]
	b _080DAAFE
_080DA9DE:
	lsrs r0, r1, 28
	cmp r0, 0x1
	bne _080DA9F0
	adds r0, r2, 0
	orrs r0, r7
	mov r4, r12
	strb r0, [r4]
	strb r6, [r4, 0x1]
	b _080DAAFE
_080DA9F0:
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	bne _080DA9FA
	b _080DAAFE
_080DA9FA:
	adds r3, r5, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r1, r2, 31
	lsrs r1, 31
	movs r6, 0x1
	eors r1, r6
	ands r1, r7
	movs r0, 0x2
	negs r0, r0
	mov r8, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r5, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	mov r2, r12
	ldrb r1, [r2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080DAAEC
	ldr r0, _080DAA6C @ =gMain
	ldr r3, _080DAA70 @ =0x0000043d
	adds r0, r3
	ldrb r0, [r0]
	ands r4, r0
	cmp r4, 0
	beq _080DAAA4
	ldrb r1, [r2, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080DAA74
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080DAAD8
	.align 2, 0
_080DAA6C: .4byte gMain
_080DAA70: .4byte 0x0000043d
_080DAA74:
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	mov r0, r12
	ldrb r2, [r0, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r6
	ands r0, r7
	mov r1, r8
	ands r1, r2
	orrs r1, r0
	mov r2, r12
	strb r1, [r2, 0xE]
	b _080DAAEC
_080DAAA4:
	mov r3, r12
	ldrb r1, [r3, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080DAACE
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0xC
	strb r0, [r1]
	ldrb r2, [r3, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r6
	ands r0, r7
	mov r1, r8
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0xE]
	b _080DAAEC
_080DAACE:
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0xC
	strb r0, [r1]
_080DAAD8:
	mov r4, r12
	ldrb r2, [r4, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r6
	ands r0, r7
	mov r1, r8
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0xE]
_080DAAEC:
	mov r0, r12
	ldrb r1, [r0]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r2, [r1, 0x2]
	mov r8, r2
_080DAAFE:
	mov r3, r12
	ldrb r0, [r3]
	movs r1, 0xF
	ands r1, r0
	movs r0, 0x20
	orrs r1, r0
	strb r1, [r3]
	b _080DAC52
_080DAB0E:
	lsls r1, r2, 24
	lsrs r0, r1, 28
	cmp r0, 0x2
	bne _080DAB20
	movs r0, 0x8
	orrs r0, r2
	mov r4, r12
	strb r0, [r4]
	b _080DAC42
_080DAB20:
	lsrs r0, r1, 28
	cmp r0, 0
	bne _080DAB44
	lsls r0, r2, 30
	lsrs r0, 31
	movs r1, 0x1
	eors r0, r1
	ands r0, r7
	lsls r0, 1
	movs r1, 0x3
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	orrs r1, r7
	mov r0, r12
	strb r1, [r0]
	strb r6, [r0, 0x1]
	b _080DAC42
_080DAB44:
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _080DAC42
	adds r3, r5, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r1, r2, 31
	lsrs r1, 31
	movs r4, 0x1
	eors r1, r4
	ands r1, r7
	movs r6, 0x2
	negs r6, r6
	adds r0, r6, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r5, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	mov r2, r12
	ldrb r1, [r2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080DAC32
	ldr r0, _080DABC4 @ =gMain
	ldr r3, _080DABC8 @ =0x0000043d
	adds r0, r3
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080DABE6
	ldrb r1, [r2, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080DABCC
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	mov r0, r12
	ldrb r2, [r0, 0xE]
	b _080DAC00
	.align 2, 0
_080DABC4: .4byte gMain
_080DABC8: .4byte 0x0000043d
_080DABCC:
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080DAC1E
_080DABE6:
	mov r0, r12
	ldrb r1, [r0, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080DAC14
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0xC
	strb r0, [r1]
	mov r1, r12
	ldrb r2, [r1, 0xE]
_080DAC00:
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r4
	ands r0, r7
	adds r1, r6, 0
	ands r1, r2
	orrs r1, r0
	mov r2, r12
	strb r1, [r2, 0xE]
	b _080DAC32
_080DAC14:
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0xC
	strb r0, [r1]
_080DAC1E:
	mov r3, r12
	ldrb r2, [r3, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r4
	ands r0, r7
	adds r1, r6, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0xE]
_080DAC32:
	mov r4, r12
	ldrb r1, [r4]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldrh r0, [r4, 0x2]
	mov r8, r0
_080DAC42:
	mov r1, r12
	ldrb r0, [r1]
	movs r1, 0xF
	ands r1, r0
	movs r0, 0x30
_080DAC4C:
	orrs r1, r0
	mov r2, r12
	strb r1, [r2]
_080DAC52:
	mov r3, r12
	ldrb r1, [r3]
	lsls r1, 30
	lsrs r1, 31
	mov r0, r12
	adds r0, 0xC
	adds r0, r1
	ldrb r1, [r0]
	ldr r3, _080DACE0 @ =gSineTable
	mov r4, r8
	lsls r0, r4, 1
	adds r0, r3
	movs r2, 0
	ldrsh r0, [r0, r2]
	muls r0, r1
	asrs r0, 8
	strh r0, [r5, 0x24]
	ldrb r2, [r5, 0x3]
	lsls r2, 26
	lsrs r2, 27
	movs r4, 0x24
	ldrsh r0, [r5, r4]
	negs r0, r0
	asrs r0, 1
	mov r1, r12
	ldrb r1, [r1, 0xA]
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r3
	ldrh r6, [r1]
	ldr r1, _080DACE4 @ =gOamMatrices
	lsls r2, 3
	adds r2, r1
	adds r0, 0x40
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r2, 0x6]
	strh r0, [r2]
	strh r6, [r2, 0x2]
	lsls r0, r6, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r2, 0x4]
	mov r2, r12
	ldrh r0, [r2, 0x6]
	ldrh r3, [r2, 0x8]
	adds r0, r3
	strh r0, [r2, 0x8]
	lsls r0, 16
	lsrs r0, 24
	strh r0, [r5, 0x22]
	movs r4, 0x4
	ldrsh r0, [r2, r4]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080DACE8
	ldrh r0, [r2, 0x4]
	subs r1, 0x1
	ands r1, r0
	ldrh r0, [r2, 0x2]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r2, 0x2]
	b _080DACFE
	.align 2, 0
_080DACE0: .4byte gSineTable
_080DACE4: .4byte gOamMatrices
_080DACE8:
	mov r1, r12
	ldrh r0, [r1, 0x4]
	ldr r1, _080DAD28 @ =0x00007fff
	ands r1, r0
	mov r2, r12
	ldrh r2, [r2, 0x2]
	adds r1, r2
	movs r0, 0xFF
	ands r1, r0
	mov r3, r12
	strh r1, [r3, 0x2]
_080DACFE:
	movs r4, 0x22
	ldrsh r1, [r5, r4]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	adds r1, r0
	mov r3, r12
	ldrh r0, [r3, 0xE]
	lsrs r0, 1
	cmp r1, r0
	blt _080DAD1A
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldr r0, _080DAD2C @ =sub_80DA48C
	str r0, [r5, 0x1C]
_080DAD1A:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DAD28: .4byte 0x00007fff
_080DAD2C: .4byte sub_80DA48C
	thumb_func_end sub_80DA6F0

	thumb_func_start sub_80DAD30
sub_80DAD30: @ 80DAD30
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _080DAD78 @ =gAnimBankTarget
	ldrb r0, [r0]
	bl sub_8079ED4
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	ldr r5, _080DAD7C @ =gAnimBankAttacker
	ldrb r0, [r5]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	ldr r0, _080DAD80 @ =TranslateAnimSpriteToTargetMonLocation
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DAD78: .4byte gAnimBankTarget
_080DAD7C: .4byte gAnimBankAttacker
_080DAD80: .4byte TranslateAnimSpriteToTargetMonLocation
	thumb_func_end sub_80DAD30

	thumb_func_start sub_80DAD84
sub_80DAD84: @ 80DAD84
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r5, _080DADCC @ =gBattleAnimArgs
	ldrh r0, [r5]
	strh r0, [r4, 0x30]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x32]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x34]
	ldr r0, _080DADD0 @ =gMain
	ldr r1, _080DADD4 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080DAE44
	ldr r0, _080DADD8 @ =gBanksBySide
	ldr r1, _080DADDC @ =gAnimBankTarget
	ldrb r2, [r1]
	adds r0, r2, r0
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080DADE0
	adds r0, r2, 0
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5, 0x6]
	adds r0, r5
	b _080DADEE
	.align 2, 0
_080DADCC: .4byte gBattleAnimArgs
_080DADD0: .4byte gMain
_080DADD4: .4byte 0x0000043d
_080DADD8: .4byte gBanksBySide
_080DADDC: .4byte gAnimBankTarget
_080DADE0:
	adds r0, r2, 0
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x28
_080DADEE:
	strh r0, [r4, 0x3C]
	ldr r0, _080DAE1C @ =gBattleAnimArgs
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080DAE24
	ldr r0, _080DAE20 @ =gAnimBankTarget
	ldrb r0, [r0]
	bl sub_8079ED4
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	lsls r0, 2
	ldrb r2, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x5]
	b _080DAE58
	.align 2, 0
_080DAE1C: .4byte gBattleAnimArgs
_080DAE20: .4byte gAnimBankTarget
_080DAE24:
	ldr r0, _080DAE40 @ =gAnimBankTarget
	ldrb r0, [r0]
	bl sub_8079ED4
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	b _080DAE58
	.align 2, 0
_080DAE40: .4byte gAnimBankTarget
_080DAE44:
	ldr r0, _080DAEFC @ =gAnimBankTarget
	ldrb r0, [r0]
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5, 0x6]
	adds r0, r5
	strh r0, [r4, 0x3C]
_080DAE58:
	ldr r5, _080DAF00 @ =gSineTable
	ldrh r3, [r4, 0x30]
	movs r1, 0xFF
	ands r1, r3
	lsls r0, r1, 1
	adds r0, r5
	ldrh r0, [r0]
	movs r2, 0
	strh r0, [r4, 0x36]
	adds r1, 0x40
	lsls r1, 1
	adds r1, r5
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r4, 0x38]
	strh r2, [r4, 0x3A]
	strh r2, [r4, 0x26]
	strh r2, [r4, 0x24]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r6, r0, 27
	lsls r3, 16
	lsrs r3, 24
	strh r3, [r4, 0x30]
	bl Random
	lsls r0, 16
	asrs r7, r0, 16
	movs r0, 0x80
	lsls r0, 8
	ands r0, r7
	cmp r0, 0
	beq _080DAEA2
	ldrh r1, [r4, 0x30]
	movs r0, 0xFF
	subs r0, r1
	strh r0, [r4, 0x30]
_080DAEA2:
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	lsls r0, r1, 1
	adds r0, r5
	ldrh r0, [r0]
	ldr r3, _080DAF04 @ =gOamMatrices
	lsls r2, r6, 3
	adds r2, r3
	adds r1, 0x40
	lsls r1, 1
	adds r1, r5
	ldrh r1, [r1]
	strh r1, [r2, 0x6]
	strh r1, [r2]
	strh r0, [r2, 0x2]
	lsls r0, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r2, 0x4]
	adds r3, r4, 0
	adds r3, 0x3F
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	movs r0, 0x1
	ands r0, r7
	cmp r0, 0
	beq _080DAEF2
	adds r2, r4, 0
	adds r2, 0x2A
	movs r1, 0x1
	movs r0, 0x1
	strb r0, [r2]
	ldrb r0, [r3]
	orrs r0, r1
	strb r0, [r3]
_080DAEF2:
	ldr r0, _080DAF08 @ =sub_80DAF0C
	str r0, [r4, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DAEFC: .4byte gAnimBankTarget
_080DAF00: .4byte gSineTable
_080DAF04: .4byte gOamMatrices
_080DAF08: .4byte sub_80DAF0C
	thumb_func_end sub_80DAD84

	thumb_func_start sub_80DAF0C
sub_80DAF0C: @ 80DAF0C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r4, r0, 0
	adds r5, r4, 0
	adds r5, 0x2E
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	movs r1, 0
	mov r8, r1
	movs r7, 0
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080DAFF0
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	muls r0, r1
	asrs r6, r0, 8
	strh r6, [r4, 0x24]
	movs r0, 0x38
	ldrsh r1, [r4, r0]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	muls r0, r1
	asrs r3, r0, 8
	strh r3, [r4, 0x26]
	ldrh r2, [r4, 0x34]
	movs r1, 0xFF
	adds r0, r1, 0
	ands r0, r2
	ldrh r2, [r4, 0x3A]
	adds r0, r2
	strh r0, [r4, 0x3A]
	ldrh r2, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	ands r1, r2
	cmp r0, r1
	blt _080DAFF0
	ldrh r0, [r4, 0x20]
	adds r0, r6
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x22]
	adds r0, r3
	strh r0, [r4, 0x22]
	strh r7, [r4, 0x24]
	strh r7, [r4, 0x26]
	mov r0, sp
	adds r1, r5, 0
	movs r2, 0x10
	bl memcpy
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x10
	bl memset
	ldrh r0, [r4, 0x22]
	lsls r0, 8
	strh r0, [r5, 0x8]
	mov r0, sp
	ldrh r0, [r0, 0x6]
	lsrs r1, r0, 8
	strh r1, [r5, 0x6]
	strh r7, [r5, 0x2]
	mov r0, sp
	ldrh r0, [r0, 0x2]
	strh r0, [r5, 0xA]
	adds r0, r4, 0
	adds r0, 0x2A
	ldrb r0, [r0]
	cmp r0, 0
	beq _080DAFC0
	movs r0, 0x8
	ands r1, r0
	cmp r1, 0
	beq _080DAFB8
	ldr r0, _080DAFB4 @ =0x00008001
	b _080DAFCE
	.align 2, 0
_080DAFB4: .4byte 0x00008001
_080DAFB8:
	ldr r0, _080DAFBC @ =0x00008002
	b _080DAFCE
	.align 2, 0
_080DAFBC: .4byte 0x00008002
_080DAFC0:
	movs r0, 0x8
	ands r1, r0
	cmp r1, 0
	beq _080DAFCC
	movs r0, 0x1
	b _080DAFCE
_080DAFCC:
	movs r0, 0x2
_080DAFCE:
	strh r0, [r5, 0x4]
	mov r0, sp
	ldrh r0, [r0, 0x4]
	lsrs r0, 8
	strb r0, [r5, 0xC]
	subs r0, 0x2
	strb r0, [r5, 0xD]
	mov r0, sp
	ldrh r1, [r0, 0xE]
	lsls r1, 1
	ldrh r2, [r5, 0xE]
	movs r0, 0x1
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0xE]
	ldr r0, _080DAFFC @ =sub_80DA6F0
	str r0, [r4, 0x1C]
_080DAFF0:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DAFFC: .4byte sub_80DA6F0
	thumb_func_end sub_80DAF0C

	thumb_func_start sub_80DB000
sub_80DB000: @ 80DB000
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080DB018 @ =gBattleAnimArgs
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080DB01C
	adds r0, r5, 0
	movs r1, 0
	bl InitAnimSpritePos
	b _080DB024
	.align 2, 0
_080DB018: .4byte gBattleAnimArgs
_080DB01C:
	adds r0, r5, 0
	movs r1, 0
	bl sub_8078764
_080DB024:
	ldr r4, _080DB08C @ =gBattleAnimArgs
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080DB03C
	ldr r0, _080DB090 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080DB052
_080DB03C:
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080DB058
	ldr r0, _080DB094 @ =gAnimBankTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080DB058
_080DB052:
	ldrh r0, [r5, 0x20]
	adds r0, 0x8
	strh r0, [r5, 0x20]
_080DB058:
	ldr r4, _080DB08C @ =gBattleAnimArgs
	ldrb r1, [r4, 0x8]
	adds r0, r5, 0
	bl SeekSpriteAnim
	ldrh r0, [r5, 0x20]
	subs r0, 0x20
	strh r0, [r5, 0x20]
	ldr r0, _080DB098 @ =0x00000ccc
	strh r0, [r5, 0x30]
	ldrh r1, [r4, 0x8]
	movs r0, 0xC
	adds r2, r0, 0
	muls r2, r1
	adds r0, r2, 0
	ldrh r2, [r5, 0x24]
	adds r0, r2
	strh r0, [r5, 0x24]
	strh r1, [r5, 0x2E]
	ldrh r0, [r4, 0x6]
	strh r0, [r5, 0x3C]
	ldr r0, _080DB09C @ =sub_80DB0A0
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DB08C: .4byte gBattleAnimArgs
_080DB090: .4byte gAnimBankAttacker
_080DB094: .4byte gAnimBankTarget
_080DB098: .4byte 0x00000ccc
_080DB09C: .4byte sub_80DB0A0
	thumb_func_end sub_80DB000

	thumb_func_start sub_80DB0A0
sub_80DB0A0: @ 80DB0A0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x24]
	adds r0, r1
	movs r1, 0
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	bne _080DB0CA
	strh r1, [r4, 0x2E]
	strh r1, [r4, 0x24]
	adds r0, r4, 0
	bl StartSpriteAnim
_080DB0CA:
	ldrh r0, [r4, 0x3C]
	subs r0, 0x1
	strh r0, [r4, 0x3C]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080DB0E2
	adds r0, r4, 0
	bl DestroyAnimSprite
_080DB0E2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DB0A0

	thumb_func_start sub_80DB0E8
sub_80DB0E8: @ 80DB0E8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	ldr r1, _080DB180 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r7, r0, r1
	ldrh r0, [r7, 0x8]
	movs r1, 0x1F
	ands r0, r1
	cmp r0, 0
	bne _080DB162
	ldr r1, _080DB184 @ =gAnimVisualTaskCount
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r1, 0x8
	ldrsh r0, [r7, r1]
	movs r5, 0xD
	negs r5, r5
	adds r1, r5, 0
	bl Sin
	ldr r4, _080DB188 @ =gBattleAnimArgs
	strh r0, [r4]
	movs r1, 0x8
	ldrsh r0, [r7, r1]
	adds r1, r5, 0
	bl Cos
	strh r0, [r4, 0x2]
	movs r0, 0x1
	strh r0, [r4, 0x4]
	movs r0, 0x3
	strh r0, [r4, 0x6]
	ldr r0, _080DB18C @ =gBattleAnimSpriteTemplate_83DB538
	mov r8, r0
	ldr r5, _080DB190 @ =gAnimBankTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r5]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	mov r0, r8
	adds r1, r4, 0
	movs r3, 0x3
	bl CreateSpriteAndAnimate
_080DB162:
	ldrh r0, [r7, 0x8]
	adds r0, 0x8
	strh r0, [r7, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _080DB176
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080DB176:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DB180: .4byte gTasks
_080DB184: .4byte gAnimVisualTaskCount
_080DB188: .4byte gBattleAnimArgs
_080DB18C: .4byte gBattleAnimSpriteTemplate_83DB538
_080DB190: .4byte gAnimBankTarget
	thumb_func_end sub_80DB0E8

	thumb_func_start sub_80DB194
sub_80DB194: @ 80DB194
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080DB1A6
	cmp r0, 0x1
	beq _080DB1D8
	b _080DB1EC
_080DB1A6:
	adds r0, r4, 0
	movs r1, 0x1
	bl InitAnimSpritePos
	movs r0, 0
	bl GetAnimBattlerSpriteId
	ldr r2, _080DB1D4 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080DB1EC
	.align 2, 0
_080DB1D4: .4byte gSprites
_080DB1D8:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080DB1EC
	adds r0, r4, 0
	bl DestroyAnimSprite
_080DB1EC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DB194

	thumb_func_start sub_80DB1F4
sub_80DB1F4: @ 80DB1F4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080DB22C
	cmp r0, 0x1
	bgt _080DB20A
	cmp r0, 0
	beq _080DB210
	b _080DB27E
_080DB20A:
	cmp r0, 0x2
	beq _080DB240
	b _080DB27E
_080DB210:
	ldr r0, _080DB228 @ =gAnimBankTarget
	ldrb r0, [r0]
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	negs r0, r0
	subs r0, 0x20
	strh r0, [r4, 0x26]
	b _080DB238
	.align 2, 0
_080DB228: .4byte gAnimBankTarget
_080DB22C:
	ldrh r0, [r4, 0x26]
	adds r0, 0xA
	strh r0, [r4, 0x26]
	lsls r0, 16
	cmp r0, 0
	blt _080DB27E
_080DB238:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080DB27E
_080DB240:
	ldrh r0, [r4, 0x26]
	subs r0, 0xA
	strh r0, [r4, 0x26]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	bge _080DB27E
	movs r0, 0
	bl GetAnimBattlerSpriteId
	ldr r2, _080DB284 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, 0
	bl DestroyAnimSprite
_080DB27E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DB284: .4byte gSprites
	thumb_func_end sub_80DB1F4

	thumb_func_start sub_80DB288
sub_80DB288: @ 80DB288
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl InitAnimSpritePos
	ldr r1, _080DB2C4 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x30]
	ldr r0, _080DB2C8 @ =sub_80DB2D0
	str r0, [r4, 0x1C]
	movs r0, 0
	bl GetAnimBattlerSpriteId
	ldr r2, _080DB2CC @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DB2C4: .4byte gBattleAnimArgs
_080DB2C8: .4byte sub_80DB2D0
_080DB2CC: .4byte gSprites
	thumb_func_end sub_80DB288

	thumb_func_start sub_80DB2D0
sub_80DB2D0: @ 80DB2D0
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	cmp r0, 0
	ble _080DB2E4
	subs r0, r1, 0x1
	strh r0, [r2, 0x2E]
	b _080DB328
_080DB2E4:
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	movs r3, 0x26
	ldrsh r1, [r2, r3]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	ble _080DB30A
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x32]
	adds r0, r1
	strh r0, [r2, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r2, 0x26]
	subs r1, r0
	strh r1, [r2, 0x26]
	b _080DB328
_080DB30A:
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r2, 0x34]
	adds r1, r0, 0x1
	strh r1, [r2, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080DB328
	ldr r0, _080DB32C @ =sub_80DB330
	str r0, [r2, 0x1C]
_080DB328:
	pop {r0}
	bx r0
	.align 2, 0
_080DB32C: .4byte sub_80DB330
	thumb_func_end sub_80DB2D0

	thumb_func_start sub_80DB330
sub_80DB330: @ 80DB330
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r2, 0x26]
	adds r0, r1
	strh r0, [r2, 0x26]
	movs r3, 0x22
	ldrsh r0, [r2, r3]
	movs r3, 0x26
	ldrsh r1, [r2, r3]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	ble _080DB360
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
_080DB360:
	movs r1, 0x26
	ldrsh r0, [r2, r1]
	cmp r0, 0
	ble _080DB36E
	adds r0, r2, 0
	bl DestroyAnimSprite
_080DB36E:
	pop {r0}
	bx r0
	thumb_func_end sub_80DB330

	thumb_func_start sub_80DB374
sub_80DB374: @ 80DB374
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080DB388
	cmp r0, 0x1
	beq _080DB3E0
	b _080DB44C
_080DB388:
	ldr r0, _080DB398 @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bne _080DB3A0
	ldr r4, _080DB39C @ =gAnimBankAttacker
	b _080DB3A2
	.align 2, 0
_080DB398: .4byte gBattleAnimArgs
_080DB39C: .4byte gAnimBankAttacker
_080DB3A0:
	ldr r4, _080DB3DC @ =gAnimBankTarget
_080DB3A2:
	ldrb r0, [r4]
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	movs r0, 0
	movs r3, 0x80
	lsls r3, 2
	strh r3, [r5, 0x30]
	movs r2, 0x80
	lsls r2, 1
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0
	bl sub_8078FDC
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080DB44C
	.align 2, 0
_080DB3DC: .4byte gAnimBankTarget
_080DB3E0:
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	cmp r0, 0xB
	bgt _080DB3EE
	ldrh r0, [r5, 0x30]
	subs r0, 0x28
	b _080DB3F2
_080DB3EE:
	ldrh r0, [r5, 0x30]
	adds r0, 0x28
_080DB3F2:
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r5, 0x32]
	movs r2, 0x80
	lsls r2, 1
	movs r0, 0x30
	ldrsh r3, [r5, r0]
	str r1, [sp]
	adds r0, r5, 0
	bl sub_8078FDC
	ldrb r1, [r5, 0x3]
	lsls r1, 26
	lsrs r1, 27
	movs r0, 0xF4
	lsls r0, 6
	ldr r2, _080DB454 @ =gOamMatrices
	lsls r1, 3
	adds r1, r2
	movs r2, 0x6
	ldrsh r1, [r1, r2]
	bl __divsi3
	adds r1, r0, 0x1
	cmp r1, 0x80
	ble _080DB42C
	movs r1, 0x80
_080DB42C:
	movs r0, 0x40
	subs r0, r1
	lsrs r1, r0, 31
	adds r0, r1
	asrs r1, r0, 1
	strh r1, [r5, 0x26]
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	cmp r0, 0x18
	bne _080DB44C
	adds r0, r5, 0
	bl sub_8079098
	adds r0, r5, 0
	bl DestroyAnimSprite
_080DB44C:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DB454: .4byte gOamMatrices
	thumb_func_end sub_80DB374

	thumb_func_start sub_80DB458
sub_80DB458: @ 80DB458
	push {r4,r5,lr}
	adds r5, r0, 0
	bl Random
	ldr r4, _080DB47C @ =0x000001ff
	ands r4, r0
	bl Random
	movs r1, 0x7F
	ands r1, r0
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080DB480
	movs r2, 0xB8
	lsls r2, 2
	adds r0, r4, r2
	b _080DB488
	.align 2, 0
_080DB47C: .4byte 0x000001ff
_080DB480:
	movs r2, 0xB8
	lsls r2, 2
	adds r0, r2, 0
	subs r0, r4
_080DB488:
	strh r0, [r5, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080DB49C
	movs r2, 0xE0
	lsls r2, 2
	adds r0, r2, 0
	adds r0, r1, r0
	b _080DB4A4
_080DB49C:
	movs r2, 0xE0
	lsls r2, 2
	adds r0, r2, 0
	subs r0, r1
_080DB4A4:
	strh r0, [r5, 0x30]
	ldr r2, _080DB4CC @ =gBattleAnimArgs
	ldrh r0, [r2]
	strh r0, [r5, 0x32]
	lsls r0, 16
	cmp r0, 0
	beq _080DB4C0
	ldrb r0, [r5, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x10
	orrs r1, r0
	strb r1, [r5, 0x3]
_080DB4C0:
	movs r1, 0x2
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _080DB4D4
	ldr r4, _080DB4D0 @ =gAnimBankAttacker
	b _080DB4D6
	.align 2, 0
_080DB4CC: .4byte gBattleAnimArgs
_080DB4D0: .4byte gAnimBankAttacker
_080DB4D4:
	ldr r4, _080DB500 @ =gAnimBankTarget
_080DB4D6:
	ldrb r0, [r4]
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x20
	strh r0, [r5, 0x22]
	ldr r0, _080DB504 @ =sub_80DB508
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DB500: .4byte gAnimBankTarget
_080DB504: .4byte sub_80DB508
	thumb_func_end sub_80DB458

	thumb_func_start sub_80DB508
sub_80DB508: @ 80DB508
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080DB520
	ldrh r3, [r4, 0x2E]
	lsls r0, r3, 16
	asrs r0, 24
	ldrh r1, [r4, 0x24]
	adds r0, r1
	b _080DB52A
_080DB520:
	ldrh r3, [r4, 0x2E]
	lsls r1, r3, 16
	asrs r1, 24
	ldrh r0, [r4, 0x24]
	subs r0, r1
_080DB52A:
	strh r0, [r4, 0x24]
	ldrh r2, [r4, 0x30]
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r4, 0x26]
	subs r0, r1
	strh r0, [r4, 0x26]
	strh r3, [r4, 0x2E]
	adds r0, r2, 0
	subs r0, 0x20
	strh r0, [r4, 0x30]
	lsls r0, r3, 16
	cmp r0, 0
	bge _080DB54A
	movs r0, 0
	strh r0, [r4, 0x2E]
_080DB54A:
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _080DB55E
	adds r0, r4, 0
	bl DestroyAnimSprite
_080DB55E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DB508

	thumb_func_start sub_80DB564
sub_80DB564: @ 80DB564
	movs r1, 0
	strh r1, [r0, 0x3A]
	movs r1, 0x40
	strh r1, [r0, 0x3C]
	ldr r1, _080DB574 @ =sub_80DB578
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080DB574: .4byte sub_80DB578
	thumb_func_end sub_80DB564

	thumb_func_start sub_80DB578
sub_80DB578: @ 80DB578
	push {lr}
	adds r3, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	cmp r1, 0
	beq _080DB58A
	cmp r1, 0x1
	beq _080DB5D8
	b _080DB5DE
_080DB58A:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080DB5DE
	strh r1, [r3, 0x30]
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	ldrb r2, [r1]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080DB5DE
	ldrb r1, [r1]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080DB5DE
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	b _080DB5DE
_080DB5D8:
	adds r0, r3, 0
	bl DestroyAnimSprite
_080DB5DE:
	pop {r0}
	bx r0
	thumb_func_end sub_80DB578

	thumb_func_start sub_80DB5E4
sub_80DB5E4: @ 80DB5E4
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	mov r8, r0
	ldrh r4, [r0, 0x20]
	ldrh r5, [r0, 0x22]
	ldr r6, _080DB698 @ =gAnimBankAttacker
	ldrb r0, [r6]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	mov r1, r8
	strh r0, [r1, 0x20]
	ldrb r0, [r6]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	mov r2, r8
	strh r6, [r2, 0x22]
	ldrh r0, [r2, 0x20]
	mov r9, r0
	mov r1, r9
	lsls r0, r1, 4
	strh r0, [r2, 0x36]
	lsls r0, r6, 4
	strh r0, [r2, 0x38]
	lsls r4, 16
	asrs r4, 16
	movs r1, 0x20
	ldrsh r0, [r2, r1]
	subs r0, r4, r0
	lsls r0, 4
	movs r1, 0xC
	bl __divsi3
	mov r2, r8
	strh r0, [r2, 0x3A]
	lsls r5, 16
	asrs r5, 16
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	subs r0, r5, r0
	lsls r0, 4
	movs r1, 0xC
	bl __divsi3
	mov r2, r8
	strh r0, [r2, 0x3C]
	mov r0, r9
	subs r4, r0
	lsls r4, 16
	asrs r4, 16
	subs r5, r6
	lsls r5, 16
	asrs r5, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl ArcTan2Neg
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 24
	adds r0, r1
	lsrs r0, 16
	movs r3, 0x80
	lsls r3, 1
	str r0, [sp]
	mov r0, r8
	movs r1, 0x1
	adds r2, r3, 0
	bl sub_8078FDC
	ldr r0, _080DB69C @ =sub_80DB6A0
	mov r2, r8
	str r0, [r2, 0x1C]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DB698: .4byte gAnimBankAttacker
_080DB69C: .4byte sub_80DB6A0
	thumb_func_end sub_80DB5E4

	thumb_func_start sub_80DB6A0
sub_80DB6A0: @ 80DB6A0
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x3A]
	ldrh r1, [r2, 0x36]
	adds r0, r1
	strh r0, [r2, 0x36]
	ldrh r1, [r2, 0x3C]
	ldrh r3, [r2, 0x38]
	adds r1, r3
	strh r1, [r2, 0x38]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r2, 0x20]
	lsls r1, 16
	asrs r3, r1, 20
	strh r3, [r2, 0x22]
	adds r0, 0x2D
	lsls r0, 16
	movs r1, 0xA5
	lsls r1, 17
	cmp r0, r1
	bhi _080DB6DA
	adds r1, r3, 0
	cmp r1, 0x9D
	bgt _080DB6DA
	movs r0, 0x2D
	negs r0, r0
	cmp r1, r0
	bge _080DB6E0
_080DB6DA:
	adds r0, r2, 0
	bl move_anim_8074EE0
_080DB6E0:
	pop {r0}
	bx r0
	thumb_func_end sub_80DB6A0

	thumb_func_start unref_sub_80DB6E4
unref_sub_80DB6E4: @ 80DB6E4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080DB714 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080DB71C
	movs r0, 0
	bl GetAnimBattlerSpriteId
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080DB718 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	b _080DB73A
	.align 2, 0
_080DB714: .4byte gBattleAnimArgs
_080DB718: .4byte gSprites
_080DB71C:
	movs r0, 0
	bl GetAnimBattlerSpriteId
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080DB748 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
_080DB73A:
	strb r0, [r1]
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DB748: .4byte gSprites
	thumb_func_end unref_sub_80DB6E4
	
	.align 2, 0 @ Don't pad with nop.
