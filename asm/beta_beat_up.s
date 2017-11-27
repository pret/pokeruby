	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	@ beta_beat_up

	thumb_func_start sub_80D6234
sub_80D6234: @ 80D6234
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080D6254 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080D625C
	ldr r0, _080D6258 @ =gBattleAnimArgs
	ldrh r1, [r4, 0x20]
	ldrh r0, [r0]
	subs r1, r0
	strh r1, [r4, 0x20]
	b _080D6266
	.align 2, 0
_080D6254: .4byte gBattleAnimBankAttacker
_080D6258: .4byte gBattleAnimArgs
_080D625C:
	ldr r0, _080D6270 @ =gBattleAnimArgs
	ldrh r0, [r0]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
_080D6266:
	ldr r0, _080D6274 @ =sub_80D6278
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D6270: .4byte gBattleAnimArgs
_080D6274: .4byte sub_80D6278
	thumb_func_end sub_80D6234

	thumb_func_start sub_80D6278
sub_80D6278: @ 80D6278
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080D628E
	adds r0, r2, 0
	bl move_anim_8074EE0
_080D628E:
	pop {r0}
	bx r0
	thumb_func_end sub_80D6278
	
	.align 2, 0 @ Don't pad with nop.
