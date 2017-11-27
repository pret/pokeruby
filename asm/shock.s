	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	@ shock

	thumb_func_start sub_80D6294
sub_80D6294: @ 80D6294
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080D62D8 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r0, _080D62DC @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080D62E4
	ldr r2, _080D62E0 @ =gBattleAnimArgs
	ldrh r0, [r5, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x22]
	ldrh r1, [r2, 0x2]
	subs r0, r1
	strh r0, [r5, 0x22]
	b _080D62F8
	.align 2, 0
_080D62D8: .4byte gBattleAnimBankTarget
_080D62DC: .4byte gBattleAnimBankAttacker
_080D62E0: .4byte gBattleAnimArgs
_080D62E4:
	ldr r0, _080D631C @ =gBattleAnimArgs
	ldrh r1, [r0]
	ldrh r2, [r5, 0x20]
	adds r1, r2
	strh r1, [r5, 0x20]
	ldrh r1, [r0, 0x2]
	ldrh r2, [r5, 0x22]
	adds r1, r2
	strh r1, [r5, 0x22]
	adds r2, r0, 0
_080D62F8:
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldrh r0, [r2, 0x4]
	strh r0, [r5, 0x30]
	ldrh r0, [r2, 0x6]
	strh r0, [r5, 0x32]
	ldrh r0, [r2, 0x8]
	strh r0, [r5, 0x34]
	ldr r1, _080D6320 @ =move_anim_8074EE0
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	ldr r0, _080D6324 @ =sub_8078114
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D631C: .4byte gBattleAnimArgs
_080D6320: .4byte move_anim_8074EE0
_080D6324: .4byte sub_8078114
	thumb_func_end sub_80D6294

	thumb_func_start sub_80D6328
sub_80D6328: @ 80D6328
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r0, _080D6340 @ =gBattleAnimArgs
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	beq _080D63A0
	cmp r0, 0x1
	bgt _080D6344
	cmp r0, 0
	beq _080D634E
	b _080D63A0
	.align 2, 0
_080D6340: .4byte gBattleAnimArgs
_080D6344:
	cmp r0, 0x2
	beq _080D6358
	cmp r0, 0x3
	beq _080D637C
	b _080D63A0
_080D634E:
	ldr r0, _080D6354 @ =gBattleAnimBankAttacker
	b _080D63A2
	.align 2, 0
_080D6354: .4byte gBattleAnimBankAttacker
_080D6358:
	ldr r4, _080D6370 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r6, 0x2
	eors r0, r6
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	bne _080D6374
	ldrb r4, [r4]
	b _080D63A4
	.align 2, 0
_080D6370: .4byte gBattleAnimBankAttacker
_080D6374:
	ldrb r0, [r4]
	adds r4, r6, 0
	eors r4, r0
	b _080D63A4
_080D637C:
	ldr r0, _080D6398 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	movs r4, 0x2
	eors r0, r4
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080D63A0
	ldr r0, _080D639C @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	eors r4, r0
	b _080D63A4
	.align 2, 0
_080D6398: .4byte gBattleAnimBankAttacker
_080D639C: .4byte gBattleAnimBankTarget
_080D63A0:
	ldr r0, _080D63C4 @ =gBattleAnimBankTarget
_080D63A2:
	ldrb r4, [r0]
_080D63A4:
	ldr r0, _080D63C8 @ =gBattleAnimArgs
	movs r2, 0xA
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bne _080D63CC
	adds r0, r4, 0
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	adds r0, r4, 0
	movs r1, 0x1
	b _080D63DE
	.align 2, 0
_080D63C4: .4byte gBattleAnimBankTarget
_080D63C8: .4byte gBattleAnimArgs
_080D63CC:
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	adds r0, r4, 0
	movs r1, 0x3
_080D63DE:
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r7, _080D647C @ =gSineTable
	ldr r6, _080D6480 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r6, r1]
	lsls r0, 1
	adds r0, r7
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r2, 0x2
	ldrsh r0, [r6, r2]
	muls r0, r1
	asrs r0, 8
	strh r0, [r5, 0x24]
	movs r1, 0
	ldrsh r0, [r6, r1]
	adds r0, 0x40
	lsls r0, 1
	adds r0, r7
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r2, 0x2
	ldrsh r0, [r6, r2]
	muls r0, r1
	asrs r0, 8
	strh r0, [r5, 0x26]
	ldrh r1, [r6, 0xC]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D6442
	adds r0, r4, 0
	bl sub_8079ED4
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	lsls r0, 2
	ldrb r2, [r5, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x5]
_080D6442:
	ldrb r2, [r5, 0x3]
	lsls r2, 26
	lsrs r2, 27
	movs r0, 0x4
	ldrsh r1, [r6, r0]
	lsls r0, r1, 1
	adds r0, r7
	ldrh r0, [r0]
	ldr r3, _080D6484 @ =gOamMatrices
	lsls r2, 3
	adds r2, r3
	adds r1, 0x40
	lsls r1, 1
	adds r1, r7
	ldrh r1, [r1]
	strh r1, [r2, 0x6]
	strh r1, [r2]
	strh r0, [r2, 0x2]
	lsls r0, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r2, 0x4]
	ldrh r0, [r6, 0x6]
	strh r0, [r5, 0x2E]
	ldr r0, _080D6488 @ =sub_80DA48C
	str r0, [r5, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D647C: .4byte gSineTable
_080D6480: .4byte gBattleAnimArgs
_080D6484: .4byte gOamMatrices
_080D6488: .4byte sub_80DA48C
	thumb_func_end sub_80D6328
	
	.align 2, 0 @ Don't pad with nop.
