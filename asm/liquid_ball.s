	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	@ liquid_ball

	thumb_func_start sub_80D3554
sub_80D3554: @ 80D3554
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	movs r0, 0x1E
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldr r4, _080D35BC @ =gBattleAnimBankTarget
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
	bl obj_translate_based_on_private_1_2_3_4
	movs r0, 0x2E
	ldrsh r1, [r5, r0]
	movs r0, 0xD2
	lsls r0, 8
	bl __divsi3
	strh r0, [r5, 0x38]
	ldr r0, _080D35C0 @ =gBattleAnimArgs
	ldrh r2, [r0, 0x6]
	strh r2, [r5, 0x3C]
	ldrh r1, [r0, 0xE]
	movs r3, 0xE
	ldrsh r0, [r0, r3]
	cmp r0, 0x7F
	ble _080D35C4
	adds r0, r1, 0
	subs r0, 0x7F
	lsls r0, 8
	strh r0, [r5, 0x3A]
	negs r0, r2
	strh r0, [r5, 0x3C]
	b _080D35C8
	.align 2, 0
_080D35BC: .4byte gBattleAnimBankTarget
_080D35C0: .4byte gBattleAnimArgs
_080D35C4:
	lsls r0, r1, 8
	strh r0, [r5, 0x3A]
_080D35C8:
	ldr r1, _080D35D8 @ =sub_80D35DC
	str r1, [r5, 0x1C]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D35D8: .4byte sub_80D35DC
	thumb_func_end sub_80D3554

	thumb_func_start sub_80D35DC
sub_80D35DC: @ 80D35DC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	beq _080D35F0
	adds r0, r4, 0
	bl move_anim_8072740
_080D35F0:
	ldrh r0, [r4, 0x3A]
	lsls r0, 16
	asrs r0, 24
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	adds r0, r1
	asrs r0, 8
	cmp r0, 0x7F
	ble _080D3620
	movs r0, 0
	strh r0, [r4, 0x3A]
	ldrh r0, [r4, 0x3C]
	negs r0, r0
	strh r0, [r4, 0x3C]
	b _080D3628
_080D3620:
	ldrh r0, [r4, 0x38]
	ldrh r1, [r4, 0x3A]
	adds r0, r1
	strh r0, [r4, 0x3A]
_080D3628:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D35DC

	thumb_func_start sub_80D3630
sub_80D3630: @ 80D3630
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080D3650 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r3, _080D3654 @ =gBattleAnimArgs
	ldrh r0, [r3]
	movs r2, 0
	strh r0, [r1, 0x8]
	strh r2, [r3, 0xE]
	ldr r0, _080D3658 @ =sub_80D365C
	str r0, [r1]
	bx lr
	.align 2, 0
_080D3650: .4byte gTasks
_080D3654: .4byte gBattleAnimArgs
_080D3658: .4byte sub_80D365C
	thumb_func_end sub_80D3630

	thumb_func_start sub_80D365C
sub_80D365C: @ 80D365C
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _080D3690 @ =gBattleAnimArgs
	ldrh r0, [r2, 0xE]
	adds r0, 0x3
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r2, 0xE]
	ldr r1, _080D3694 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x8]
	subs r1, 0x1
	strh r1, [r0, 0x8]
	lsls r1, 16
	cmp r1, 0
	bne _080D368A
	adds r0, r3, 0
	bl DestroyAnimVisualTask
_080D368A:
	pop {r0}
	bx r0
	.align 2, 0
_080D3690: .4byte gBattleAnimArgs
_080D3694: .4byte gTasks
	thumb_func_end sub_80D365C

	thumb_func_start sub_80D3698
sub_80D3698: @ 80D3698
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r7, _080D36E4 @ =gBattleAnimBankAttacker
	ldrb r0, [r7]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r7]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	ldr r6, _080D36E8 @ =0x0000fff6
	strh r6, [r4, 0x26]
	ldrb r0, [r7]
	bl sub_8079E90
	lsls r0, 24
	lsrs r5, r0, 24
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080D36F2
	ldrb r0, [r7]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080D36EC
	movs r0, 0xA
	strh r0, [r4, 0x24]
	b _080D36F4
	.align 2, 0
_080D36E4: .4byte gBattleAnimBankAttacker
_080D36E8: .4byte 0x0000fff6
_080D36EC:
	strh r6, [r4, 0x24]
	subs r0, r5, 0x2
	b _080D36F6
_080D36F2:
	strh r6, [r4, 0x24]
_080D36F4:
	adds r0, r5, 0x2
_080D36F6:
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	ldr r0, _080D3708 @ =sub_80D370C
	str r0, [r4, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D3708: .4byte sub_80D370C
	thumb_func_end sub_80D3698

	thumb_func_start sub_80D370C
sub_80D370C: @ 80D370C
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080D3722
	adds r0, r2, 0
	bl move_anim_8072740
_080D3722:
	pop {r0}
	bx r0
	thumb_func_end sub_80D370C

	thumb_func_start sub_80D3728
sub_80D3728: @ 80D3728
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r5, _080D37E8 @ =gBattleAnimBankAttacker
	ldrb r0, [r5]
	bl GetBankSide
	adds r4, r0, 0
	ldr r0, _080D37EC @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	bl GetBankSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080D3772
	ldr r4, _080D37F0 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r4, r1]
	negs r0, r0
	strh r0, [r4]
	ldrb r0, [r5]
	bl GetBankIdentity
	lsls r0, 24
	cmp r0, 0
	beq _080D376A
	ldrb r0, [r5]
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080D3772
_080D376A:
	movs r1, 0
	ldrsh r0, [r4, r1]
	negs r0, r0
	strh r0, [r4]
_080D3772:
	ldr r5, _080D37F0 @ =gBattleAnimArgs
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0
	cmp r0, 0
	bne _080D3786
	movs r1, 0x1
_080D3786:
	ldrb r0, [r5, 0xA]
	movs r7, 0x1
	cmp r0, 0
	bne _080D3790
	movs r7, 0x3
_080D3790:
	adds r0, r6, 0
	bl sub_80787B0
	ldr r0, _080D37E8 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080D37AA
	ldrh r0, [r5, 0x4]
	negs r0, r0
	strh r0, [r5, 0x4]
_080D37AA:
	ldrh r0, [r5, 0x8]
	strh r0, [r6, 0x2E]
	ldr r4, _080D37EC @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x4]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrb r0, [r4]
	adds r1, r7, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5, 0x6]
	adds r0, r5
	strh r0, [r6, 0x36]
	ldr r0, _080D37F4 @ =sub_8078B34
	str r0, [r6, 0x1C]
	ldr r1, _080D37F8 @ =move_anim_8072740
	adds r0, r6, 0
	bl StoreSpriteCallbackInData
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D37E8: .4byte gBattleAnimBankAttacker
_080D37EC: .4byte gBattleAnimBankTarget
_080D37F0: .4byte gBattleAnimArgs
_080D37F4: .4byte sub_8078B34
_080D37F8: .4byte move_anim_8072740
	thumb_func_end sub_80D3728
	
	.align 2, 0 @ Don't pad with nop.
