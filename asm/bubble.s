	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	@ bubble

	thumb_func_start sub_80D31C8
sub_80D31C8: @ 80D31C8
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r5, _080D31F0 @ =gBattleAnimBankAttacker
	ldrb r0, [r5]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080D31F8
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _080D31F4 @ =gBattleAnimArgs
	ldrh r1, [r4]
	subs r0, r1
	b _080D320A
	.align 2, 0
_080D31F0: .4byte gBattleAnimBankAttacker
_080D31F4: .4byte gBattleAnimArgs
_080D31F8:
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	ldr r4, _080D32D0 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
_080D320A:
	strh r0, [r6, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x2]
	adds r0, r4
	strh r0, [r6, 0x22]
	adds r2, r6, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080D32D4 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080D3240
	ldr r1, _080D32D0 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080D3240:
	ldr r5, _080D32D0 @ =gBattleAnimArgs
	ldrh r0, [r5, 0xC]
	strh r0, [r6, 0x2E]
	ldrh r0, [r6, 0x20]
	strh r0, [r6, 0x30]
	ldr r4, _080D32D8 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x32]
	ldrh r0, [r6, 0x22]
	strh r0, [r6, 0x34]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x36]
	adds r0, r6, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r0, _080D32DC @ =SpriteCallbackDummy
	bl CreateInvisibleSpriteWithCallback
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	strh r4, [r6, 0x38]
	ldrb r0, [r5, 0x8]
	movs r2, 0x4
	ldrsh r1, [r5, r2]
	bl Sin
	ldrh r1, [r6, 0x20]
	subs r1, r0
	strh r1, [r6, 0x20]
	ldrb r0, [r5, 0x8]
	movs r2, 0x6
	ldrsh r1, [r5, r2]
	bl Cos
	ldrh r1, [r6, 0x22]
	subs r1, r0
	strh r1, [r6, 0x22]
	ldr r0, _080D32E0 @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r5, 0x4]
	strh r0, [r1, 0x2E]
	ldrh r0, [r5, 0x6]
	strh r0, [r1, 0x30]
	ldrh r0, [r5, 0xA]
	strh r0, [r1, 0x32]
	ldrb r0, [r5, 0x8]
	lsls r0, 8
	strh r0, [r1, 0x34]
	ldrh r0, [r5, 0xC]
	strh r0, [r1, 0x36]
	ldr r1, _080D32E4 @ =sub_80D32E8
	str r1, [r6, 0x1C]
	adds r0, r6, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D32D0: .4byte gBattleAnimArgs
_080D32D4: .4byte gBattleAnimBankAttacker
_080D32D8: .4byte gBattleAnimBankTarget
_080D32DC: .4byte SpriteCallbackDummy
_080D32E0: .4byte gSprites
_080D32E4: .4byte sub_80D32E8
	thumb_func_end sub_80D31C8

	thumb_func_start sub_80D32E8
sub_80D32E8: @ 80D32E8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r1, [r5, 0x38]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080D3350 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r7, r0, r2
	ldrh r4, [r7, 0x36]
	lsls r4, 24
	lsrs r4, 24
	ldrh r0, [r7, 0x34]
	mov r8, r0
	movs r0, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r5, 0
	bl sub_8078B5C
	mov r1, r8
	lsrs r6, r1, 8
	movs r0, 0x2E
	ldrsh r1, [r7, r0]
	adds r0, r6, 0
	bl Sin
	ldrh r1, [r5, 0x24]
	adds r0, r1
	strh r0, [r5, 0x24]
	movs r0, 0x30
	ldrsh r1, [r7, r0]
	adds r0, r6, 0
	bl Cos
	ldrh r1, [r5, 0x26]
	adds r0, r1
	strh r0, [r5, 0x26]
	ldrh r0, [r7, 0x32]
	mov r1, r8
	adds r1, r0
	strh r1, [r7, 0x34]
	subs r4, 0x1
	lsls r4, 24
	lsrs r4, 24
	cmp r4, 0
	beq _080D3354
	strh r4, [r7, 0x36]
	b _080D335E
	.align 2, 0
_080D3350: .4byte gSprites
_080D3354:
	ldr r0, _080D336C @ =sub_80D3370
	str r0, [r5, 0x1C]
	adds r0, r7, 0
	bl DestroySprite
_080D335E:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D336C: .4byte sub_80D3370
	thumb_func_end sub_80D32E8

	thumb_func_start sub_80D3370
sub_80D3370: @ 80D3370
	push {lr}
	adds r3, r0, 0
	adds r3, 0x2C
	ldrb r2, [r3]
	movs r1, 0x41
	negs r1, r1
	ands r1, r2
	strb r1, [r3]
	ldr r1, _080D3390 @ =sub_8078600
	str r1, [r0, 0x1C]
	ldr r1, _080D3394 @ =sub_80D3398
	bl StoreSpriteCallbackInData
	pop {r0}
	bx r0
	.align 2, 0
_080D3390: .4byte sub_8078600
_080D3394: .4byte sub_80D3398
	thumb_func_end sub_80D3370

	thumb_func_start sub_80D3398
sub_80D3398: @ 80D3398
	push {lr}
	movs r1, 0xA
	strh r1, [r0, 0x2E]
	ldr r1, _080D33AC @ =sub_80782D8
	str r1, [r0, 0x1C]
	ldr r1, _080D33B0 @ =move_anim_8074EE0
	bl StoreSpriteCallbackInData
	pop {r0}
	bx r0
	.align 2, 0
_080D33AC: .4byte sub_80782D8
_080D33B0: .4byte move_anim_8074EE0
	thumb_func_end sub_80D3398
	
	.align 2, 0 @ Don't pad with nop.
