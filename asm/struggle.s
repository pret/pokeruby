	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80D2C38
sub_80D2C38: @ 80D2C38
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r1, _080D2C50 @ =gBattleAnimArgs
	movs r2, 0x4
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080D2C54
	adds r0, r5, 0
	bl move_anim_8072740
	b _080D2CB8
	.align 2, 0
_080D2C50: .4byte gBattleAnimArgs
_080D2C54:
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080D2C64
	ldr r4, _080D2C60 @ =gBattleAnimBankAttacker
	b _080D2C66
	.align 2, 0
_080D2C60: .4byte gBattleAnimBankAttacker
_080D2C64:
	ldr r4, _080D2C94 @ =gBattleAnimBankTarget
_080D2C66:
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
	ldr r0, _080D2C98 @ =gBattleAnimArgs
	movs r2, 0x2
	ldrsh r1, [r0, r2]
	adds r2, r0, 0
	cmp r1, 0
	bne _080D2C9C
	ldrh r0, [r5, 0x20]
	adds r0, 0x20
	b _080D2CA0
	.align 2, 0
_080D2C94: .4byte gBattleAnimBankTarget
_080D2C98: .4byte gBattleAnimArgs
_080D2C9C:
	ldrh r0, [r5, 0x20]
	subs r0, 0x20
_080D2CA0:
	strh r0, [r5, 0x20]
	ldrh r0, [r2, 0x4]
	strh r0, [r5, 0x2E]
	ldrh r1, [r2, 0x2]
	strh r1, [r5, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	ldr r0, _080D2CC0 @ =sub_80D2CC4
	str r0, [r5, 0x1C]
_080D2CB8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D2CC0: .4byte sub_80D2CC4
	thumb_func_end sub_80D2C38

	thumb_func_start sub_80D2CC4
sub_80D2CC4: @ 80D2CC4
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080D2CF4
	ldrh r0, [r2, 0x2E]
	subs r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	cmp r0, 0
	beq _080D2CEE
	ldrh r1, [r2, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r2, 0
	bl StartSpriteAnim
	b _080D2CF4
_080D2CEE:
	adds r0, r2, 0
	bl move_anim_8072740
_080D2CF4:
	pop {r0}
	bx r0
	thumb_func_end sub_80D2CC4
	
	.align 2, 0 @ Don't pad with nop.
