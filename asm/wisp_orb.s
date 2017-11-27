	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	@ wisp_orb

	thumb_func_start sub_80D5B0C
sub_80D5B0C: @ 80D5B0C
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080D5B80
	cmp r0, 0x1
	bgt _080D5B22
	cmp r0, 0
	beq _080D5B28
	b _080D5C4E
_080D5B22:
	cmp r0, 0x2
	beq _080D5BDE
	b _080D5C4E
_080D5B28:
	adds r0, r5, 0
	movs r1, 0
	bl sub_80787B0
	ldr r4, _080D5B50 @ =gBattleAnimArgs
	ldrb r1, [r4, 0x4]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x3C]
	ldr r0, _080D5B54 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080D5B58
	movs r0, 0x4
	b _080D5B5A
	.align 2, 0
_080D5B50: .4byte gBattleAnimArgs
_080D5B54: .4byte gBattleAnimBankAttacker
_080D5B58:
	ldr r0, _080D5B78 @ =0x0000fffc
_080D5B5A:
	strh r0, [r5, 0x36]
	ldr r0, _080D5B7C @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	bl sub_8079ED4
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080D5BD6
	.align 2, 0
_080D5B78: .4byte 0x0000fffc
_080D5B7C: .4byte gBattleAnimBankTarget
_080D5B80:
	ldrh r0, [r5, 0x30]
	adds r0, 0xC0
	strh r0, [r5, 0x30]
	ldr r0, _080D5BA0 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080D5BA4
	ldrh r0, [r5, 0x30]
	lsls r0, 16
	asrs r0, 24
	negs r0, r0
	b _080D5BAA
	.align 2, 0
_080D5BA0: .4byte gBattleAnimBankAttacker
_080D5BA4:
	ldrh r0, [r5, 0x30]
	lsls r0, 16
	asrs r0, 24
_080D5BAA:
	strh r0, [r5, 0x26]
	movs r2, 0x32
	ldrsh r0, [r5, r2]
	movs r2, 0x36
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r5, 0x24]
	ldrh r0, [r5, 0x32]
	adds r0, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080D5C4E
	movs r0, 0
	strh r0, [r5, 0x34]
_080D5BD6:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080D5C4E
_080D5BDE:
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	movs r2, 0x36
	ldrsh r1, [r5, r2]
	bl Sin
	adds r2, r0, 0
	movs r3, 0
	strh r2, [r5, 0x24]
	ldrh r0, [r5, 0x32]
	adds r0, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _080D5C4E
	ldrh r0, [r5, 0x20]
	adds r1, r2, r0
	strh r1, [r5, 0x20]
	ldrh r0, [r5, 0x26]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	strh r3, [r5, 0x26]
	strh r3, [r5, 0x24]
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r5, 0x2E]
	strh r1, [r5, 0x30]
	ldr r4, _080D5C54 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl sub_8078BD4
	ldr r0, _080D5C58 @ =sub_80D5C5C
	str r0, [r5, 0x1C]
_080D5C4E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D5C54: .4byte gBattleAnimBankTarget
_080D5C58: .4byte sub_80D5C5C
	thumb_func_end sub_80D5B0C

	thumb_func_start sub_80D5C5C
sub_80D5C5C: @ 80D5C5C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	bne _080D5CB4
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0x10
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	ldrh r2, [r4, 0x38]
	adds r0, r2, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x38]
	lsls r2, 16
	asrs r2, 16
	cmp r2, 0
	beq _080D5C92
	cmp r2, 0xC4
	ble _080D5CBA
_080D5C92:
	lsls r0, 16
	cmp r0, 0
	ble _080D5CBA
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D5CBA
	ldr r0, _080D5CB0 @ =gUnknown_0202F7D2
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x90
	bl PlaySE12WithPanning
	b _080D5CBA
	.align 2, 0
_080D5CB0: .4byte gUnknown_0202F7D2
_080D5CB4:
	adds r0, r4, 0
	bl move_anim_8072740
_080D5CBA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D5C5C
	
	.align 2, 0 @ Don't pad with nop.
