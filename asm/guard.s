	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80D3014
sub_80D3014: @ 80D3014
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080D3058 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D3060
	ldr r4, _080D305C @ =gBattleAnimBankAttacker
	ldrb r1, [r4]
	movs r0, 0x2
	eors r0, r1
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080D3060
	ldrb r0, [r4]
	adds r2, r5, 0
	adds r2, 0x20
	adds r3, r5, 0
	adds r3, 0x22
	movs r1, 0
	bl sub_807A3FC
	ldrh r0, [r5, 0x22]
	adds r0, 0x28
	strh r0, [r5, 0x22]
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	b _080D3080
	.align 2, 0
_080D3058: .4byte gBattleTypeFlags
_080D305C: .4byte gBattleAnimBankAttacker
_080D3060:
	ldr r4, _080D30A0 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x28
	strh r0, [r5, 0x22]
_080D3080:
	movs r0, 0xD
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x22]
	subs r0, 0x48
	strh r0, [r5, 0x36]
	ldr r0, _080D30A4 @ =sub_8078B34
	str r0, [r5, 0x1C]
	ldr r1, _080D30A8 @ =move_anim_8072740
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D30A0: .4byte gBattleAnimBankAttacker
_080D30A4: .4byte sub_8078B34
_080D30A8: .4byte move_anim_8072740
	thumb_func_end sub_80D3014
	
	.align 2, 0 @ Don't pad with nop.
