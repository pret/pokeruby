	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	@ aurora

	thumb_func_start sub_80D33B4
sub_80D33B4: @ 80D33B4
	push {r4-r7,lr}
	adds r5, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _080D33DC @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080D33E4
	ldr r1, _080D33E0 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	lsls r0, 16
	lsrs r6, r0, 16
	adds r7, r1, 0
	b _080D33EA
	.align 2, 0
_080D33DC: .4byte gBattleAnimBankAttacker
_080D33E0: .4byte gBattleAnimArgs
_080D33E4:
	ldr r0, _080D3440 @ =gBattleAnimArgs
	ldrh r6, [r0, 0x4]
	adds r7, r0, 0
_080D33EA:
	ldrh r0, [r7, 0x8]
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldr r4, _080D3444 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, r6
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r7, [r7, 0x6]
	adds r0, r7
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r0, _080D3448 @ =sub_80D344C
	str r0, [r5, 0x1C]
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r1, [r5, 0x1C]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D3440: .4byte gBattleAnimArgs
_080D3444: .4byte gBattleAnimBankTarget
_080D3448: .4byte sub_80D344C
	thumb_func_end sub_80D33B4

	thumb_func_start sub_80D344C
sub_80D344C: @ 80D344C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080D3488 @ =gBattleAnimArgs
	ldrh r1, [r0, 0xE]
	ldr r0, _080D348C @ =0x0000ffff
	cmp r1, r0
	bne _080D346E
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
_080D346E:
	adds r0, r4, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	beq _080D3480
	adds r0, r4, 0
	bl move_anim_8072740
_080D3480:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D3488: .4byte gBattleAnimArgs
_080D348C: .4byte 0x0000ffff
	thumb_func_end sub_80D344C

	thumb_func_start sub_80D3490
sub_80D3490: @ 80D3490
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080D34C4 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldr r0, _080D34C8 @ =gBattleAnimArgs
	ldrh r0, [r0]
	strh r0, [r4, 0x8]
	ldr r0, _080D34CC @ =0x0000279c
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	strh r0, [r4, 0xC]
	ldr r0, _080D34D0 @ =sub_80D34D4
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D34C4: .4byte gTasks
_080D34C8: .4byte gBattleAnimArgs
_080D34CC: .4byte 0x0000279c
_080D34D0: .4byte sub_80D34D4
	thumb_func_end sub_80D3490

	thumb_func_start sub_80D34D4
sub_80D34D4: @ 80D34D4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080D354C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0x1C]
	adds r0, 0x1
	strh r0, [r2, 0x1C]
	lsls r0, 16
	asrs r0, 16
	mov r12, r1
	cmp r0, 0x3
	bne _080D3526
	movs r0, 0
	strh r0, [r2, 0x1C]
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r1, _080D3550 @ =gPlttBufferFaded
	lsls r0, r5, 1
	adds r0, r1
	ldrh r6, [r0]
	adds r7, r1, 0
	adds r3, r0, 0x2
	movs r1, 0x6
	adds r2, r0, 0
_080D3510:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, 0x2
	adds r2, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _080D3510
	adds r0, r5, 0x7
	lsls r0, 1
	adds r0, r7
	strh r6, [r0]
_080D3526:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	add r0, r12
	ldrh r1, [r0, 0x1E]
	adds r1, 0x1
	strh r1, [r0, 0x1E]
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	cmp r1, r0
	bne _080D3546
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080D3546:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D354C: .4byte gTasks
_080D3550: .4byte gPlttBufferFaded
	thumb_func_end sub_80D34D4
	
	.align 2, 0 @ Don't pad with nop.
