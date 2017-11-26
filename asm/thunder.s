	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	@ thunder

	thumb_func_start sub_80D61C8
sub_80D61C8: @ 80D61C8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080D61E8 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080D61F0
	ldr r0, _080D61EC @ =gBattleAnimArgs
	ldrh r1, [r4, 0x20]
	ldrh r2, [r0]
	subs r1, r2
	strh r1, [r4, 0x20]
	b _080D61FC
	.align 2, 0
_080D61E8: .4byte gBattleAnimBankAttacker
_080D61EC: .4byte gBattleAnimArgs
_080D61F0:
	ldr r1, _080D6210 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	adds r0, r1, 0
_080D61FC:
	ldrh r0, [r0, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, _080D6214 @ =sub_80D6218
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D6210: .4byte gBattleAnimArgs
_080D6214: .4byte sub_80D6218
	thumb_func_end sub_80D61C8

	thumb_func_start sub_80D6218
sub_80D6218: @ 80D6218
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080D622E
	adds r0, r2, 0
	bl move_anim_8072740
_080D622E:
	pop {r0}
	bx r0
	thumb_func_end sub_80D6218
	
	.align 2, 0 @ Don't pad with nop.
