	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	@ fire_2

	thumb_func_start sub_80D51A8
sub_80D51A8: @ 80D51A8
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r5, _080D5200 @ =gBattleAnimBankAttacker
	ldrb r0, [r5]
	bl GetBankSide
	adds r4, r0, 0
	ldr r0, _080D5204 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	bl GetBankSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080D51EE
	movs r0, 0x2
	bl GetBankByPlayerAI
	ldrb r1, [r5]
	lsls r0, 24
	lsrs r0, 24
	cmp r1, r0
	beq _080D51E6
	movs r0, 0x3
	bl GetBankByPlayerAI
	ldrb r1, [r5]
	lsls r0, 24
	lsrs r0, 24
	cmp r1, r0
	bne _080D51EE
_080D51E6:
	ldr r1, _080D5208 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080D51EE:
	ldr r1, _080D520C @ =sub_8079534
	str r1, [r6, 0x1C]
	adds r0, r6, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D5200: .4byte gBattleAnimBankAttacker
_080D5204: .4byte gBattleAnimBankTarget
_080D5208: .4byte gBattleAnimArgs
_080D520C: .4byte sub_8079534
	thumb_func_end sub_80D51A8

	thumb_func_start sub_80D5210
sub_80D5210: @ 80D5210
	ldr r2, _080D5224 @ =gBattleAnimArgs
	ldrh r1, [r2]
	negs r1, r1
	strh r1, [r2]
	ldrh r1, [r2, 0x4]
	negs r1, r1
	strh r1, [r2, 0x4]
	ldr r1, _080D5228 @ =sub_8079534
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080D5224: .4byte gBattleAnimArgs
_080D5228: .4byte sub_8079534
	thumb_func_end sub_80D5210

	thumb_func_start sub_80D522C
sub_80D522C: @ 80D522C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _080D524C @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	movs r1, 0
	strh r0, [r4, 0x3C]
	strh r1, [r4, 0x2E]
	ldr r0, _080D5250 @ =sub_80D5254
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D524C: .4byte gBattleAnimArgs
_080D5250: .4byte sub_80D5254
	thumb_func_end sub_80D522C

	thumb_func_start sub_80D5254
sub_80D5254: @ 80D5254
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80D5348
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x12
	bne _080D529E
	movs r0, 0x19
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldr r4, _080D52A4 @ =gBattleAnimBankTarget
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
	ldr r0, _080D52A8 @ =sub_80D52AC
	str r0, [r5, 0x1C]
_080D529E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D52A4: .4byte gBattleAnimBankTarget
_080D52A8: .4byte sub_80D52AC
	thumb_func_end sub_80D5254

	thumb_func_start sub_80D52AC
sub_80D52AC: @ 80D52AC
	push {r4-r6,lr}
	adds r6, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	beq _080D52F4
	movs r4, 0
	strh r4, [r6, 0x2E]
	ldr r5, _080D52EC @ =gBattleAnimBankTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x22]
	strh r4, [r6, 0x26]
	strh r4, [r6, 0x24]
	ldr r1, _080D52F0 @ =sub_80D5324
	str r1, [r6, 0x1C]
	adds r0, r6, 0
	bl _call_via_r1
	b _080D531E
	.align 2, 0
_080D52EC: .4byte gBattleAnimBankTarget
_080D52F0: .4byte sub_80D5324
_080D52F4:
	movs r1, 0x3C
	ldrsh r0, [r6, r1]
	movs r1, 0x1C
	bl Sin
	ldrh r1, [r6, 0x24]
	adds r0, r1
	strh r0, [r6, 0x24]
	movs r1, 0x3C
	ldrsh r0, [r6, r1]
	movs r1, 0x1C
	bl Cos
	ldrh r1, [r6, 0x26]
	adds r0, r1
	strh r0, [r6, 0x26]
	ldrh r0, [r6, 0x3C]
	adds r0, 0x14
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r6, 0x3C]
_080D531E:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80D52AC

	thumb_func_start sub_80D5324
sub_80D5324: @ 80D5324
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80D5348
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _080D5340
	adds r0, r4, 0
	bl move_anim_8072740
_080D5340:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D5324

	thumb_func_start sub_80D5348
sub_80D5348: @ 80D5348
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r1, 0x1C
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r1, 0x1C
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x14
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3C]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D5348

	thumb_func_start sub_80D5374
sub_80D5374: @ 80D5374
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080D53A8 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x32]
	ldr r1, _080D53AC @ =move_anim_8072740
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	ldr r0, _080D53B0 @ =sub_8078364
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D53A8: .4byte gBattleAnimArgs
_080D53AC: .4byte move_anim_8072740
_080D53B0: .4byte sub_8078364
	thumb_func_end sub_80D5374

	thumb_func_start sub_80D53B4
sub_80D53B4: @ 80D53B4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r1, _080D53E8 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x2E]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080D53EC @ =sub_80782D8
	str r0, [r4, 0x1C]
	ldr r1, _080D53F0 @ =sub_80D53F4
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D53E8: .4byte gBattleAnimArgs
_080D53EC: .4byte sub_80782D8
_080D53F0: .4byte sub_80D53F4
	thumb_func_end sub_80D53B4

	thumb_func_start sub_80D53F4
sub_80D53F4: @ 80D53F4
	push {lr}
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r3]
	ldrh r1, [r0, 0x30]
	movs r2, 0
	strh r1, [r0, 0x2E]
	strh r2, [r0, 0x30]
	ldr r1, _080D5418 @ =sub_80D541C
	str r1, [r0, 0x1C]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080D5418: .4byte sub_80D541C
	thumb_func_end sub_80D53F4

	thumb_func_start sub_80D541C
sub_80D541C: @ 80D541C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x32]
	lsls r1, 16
	asrs r1, 24
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x32]
	lsls r1, 16
	asrs r1, 24
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0xA
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x32]
	adds r0, 0xD0
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080D5468
	adds r0, r4, 0
	bl move_anim_8072740
_080D5468:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D541C

	thumb_func_start sub_80D5470
sub_80D5470: @ 80D5470
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080D54D0 @ =gTasks
	adds r4, r0
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r4, 0x26]
	strh r5, [r4, 0x8]
	strh r5, [r4, 0xA]
	strh r5, [r4, 0xC]
	strh r5, [r4, 0xE]
	ldr r2, _080D54D4 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x22]
	strh r0, [r4, 0x10]
	ldr r0, _080D54D8 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x12]
	strh r5, [r4, 0x14]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_8078E70
	ldr r0, _080D54DC @ =sub_80D54E0
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D54D0: .4byte gTasks
_080D54D4: .4byte gSprites
_080D54D8: .4byte gBattleAnimBankAttacker
_080D54DC: .4byte sub_80D54E0
	thumb_func_end sub_80D5470

	thumb_func_start sub_80D54E0
sub_80D54E0: @ 80D54E0
	push {r4,r5,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080D5508 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	bls _080D54FC
	b _080D57BA
_080D54FC:
	lsls r0, 2
	ldr r1, _080D550C @ =_080D5510
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D5508: .4byte gTasks
_080D550C: .4byte _080D5510
	.align 2, 0
_080D5510:
	.4byte _080D552C
	.4byte _080D5552
	.4byte _080D5604
	.4byte _080D5664
	.4byte _080D5682
	.4byte _080D5758
	.4byte _080D57AC
_080D552C:
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0x80
	lsls r3, 1
	movs r0, 0xE0
	str r0, [sp]
	movs r0, 0x80
	lsls r0, 2
	str r0, [sp, 0x4]
	movs r0, 0x20
	str r0, [sp, 0x8]
	adds r0, r4, 0
	adds r2, r3, 0
	bl sub_8079C08
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080D5552:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D559A
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D5588
	ldr r2, _080D5584 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3
	b _080D5598
	.align 2, 0
_080D5584: .4byte gSprites
_080D5588:
	ldr r2, _080D55FC @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _080D5600 @ =0x0000fffd
_080D5598:
	strh r1, [r0, 0x24]
_080D559A:
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D55C8
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080D55C8
	movs r0, 0
	strh r0, [r4, 0xE]
	ldr r2, _080D55FC @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	adds r1, 0x1
	strh r1, [r0, 0x22]
_080D55C8:
	adds r0, r4, 0
	bl sub_8079C74
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	beq _080D55D8
	b _080D57BA
_080D55D8:
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8079A64
	ldr r2, _080D55FC @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r5, [r0, 0x24]
	strh r5, [r4, 0xA]
	strh r5, [r4, 0xC]
	strh r5, [r4, 0xE]
	b _080D57A0
	.align 2, 0
_080D55FC: .4byte gSprites
_080D5600: .4byte 0x0000fffd
_080D5604:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bgt _080D5614
	b _080D57BA
_080D5614:
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D563E
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0x80
	lsls r3, 2
	movs r0, 0xC0
	lsls r0, 1
	str r0, [sp]
	movs r0, 0xF0
	str r0, [sp, 0x4]
	movs r0, 0x6
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r2, 0xE0
	bl sub_8079C08
	b _080D565E
_080D563E:
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0x80
	lsls r3, 2
	movs r0, 0xC0
	lsls r0, 1
	str r0, [sp]
	movs r0, 0xC0
	str r0, [sp, 0x4]
	movs r0, 0x6
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r2, 0xE0
	bl sub_8079C08
_080D565E:
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080D57A0
_080D5664:
	adds r0, r4, 0
	bl sub_8079C74
	lsls r0, 24
	cmp r0, 0
	beq _080D5672
	b _080D57BA
_080D5672:
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	adds r1, r5, 0
	movs r2, 0x6
	bl sub_80D57C4
	b _080D57A0
_080D5682:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D56D0
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D56BC
	ldr r2, _080D56B8 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	b _080D56CE
	.align 2, 0
_080D56B8: .4byte gSprites
_080D56BC:
	ldr r2, _080D5708 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
_080D56CE:
	strh r1, [r0, 0x26]
_080D56D0:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x18
	ble _080D57BA
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D570C
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0xC0
	lsls r2, 1
	movs r0, 0x80
	lsls r0, 1
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x8
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r3, 0xF0
	bl sub_8079C08
	b _080D572A
	.align 2, 0
_080D5708: .4byte gSprites
_080D570C:
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0xC0
	lsls r2, 1
	movs r0, 0x80
	lsls r0, 1
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x8
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r3, 0xC0
	bl sub_8079C08
_080D572A:
	ldrh r1, [r4, 0xC]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D5748
	ldr r2, _080D5754 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
	strh r1, [r0, 0x26]
_080D5748:
	movs r0, 0
	strh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
	strh r0, [r4, 0xE]
	b _080D57A0
	.align 2, 0
_080D5754: .4byte gSprites
_080D5758:
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D5774
	ldr r2, _080D57A8 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	subs r1, 0x1
	strh r1, [r0, 0x22]
_080D5774:
	adds r0, r4, 0
	bl sub_8079C74
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080D57BA
	ldr r2, _080D57A8 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x10]
	strh r1, [r0, 0x22]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F40
	strh r5, [r4, 0xC]
_080D57A0:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080D57BA
	.align 2, 0
_080D57A8: .4byte gSprites
_080D57AC:
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D57BA
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080D57BA:
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80D54E0

	thumb_func_start sub_80D57C4
sub_80D57C4: @ 80D57C4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	adds r0, r4, 0
	bl sub_80D5940
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	ldr r1, _080D5814 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r4, [r0, 0x20]
	ldr r0, _080D5818 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080D581C
	adds r0, r4, 0
	subs r0, 0xC
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0x1
	b _080D5826
	.align 2, 0
_080D5814: .4byte gSprites
_080D5818: .4byte gBattleAnimBankAttacker
_080D581C:
	adds r0, r4, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0xFF
_080D5826:
	movs r6, 0
	movs r5, 0
	lsls r4, 16
	str r4, [sp, 0x8]
	mov r1, r9
	lsls r1, 16
	str r1, [sp, 0x4]
	ldr r2, _080D58E0 @ =gUnknown_083D96DC
	mov r9, r2
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r3, r8
	lsls r3, 1
	mov r10, r3
_080D5844:
	ldr r0, _080D58E4 @ =gSpriteTemplate_83D96C4
	ldr r2, [sp, 0x8]
	asrs r1, r2, 16
	ldr r3, [sp, 0x4]
	asrs r2, r3, 16
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080D58C6
	ldr r1, _080D58E8 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r4, r0, r1
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	lsls r0, r5, 2
	adds r0, 0x40
	adds r1, r0
	ldr r3, _080D58EC @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r3, _080D58F0 @ =0xfffffc00
	adds r0, r3, 0
	ands r2, r0
	orrs r2, r1
	strh r2, [r4, 0x4]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x4
	bls _080D588E
	movs r5, 0
_080D588E:
	lsls r2, r6, 2
	mov r1, r9
	adds r0, r2, r1
	ldrh r0, [r0]
	ldr r3, [sp]
	adds r1, r0, 0
	muls r1, r3
	lsls r1, 16
	asrs r1, 16
	ldr r0, _080D58F4 @ =gUnknown_083D96DC + 0x2
	adds r2, r0
	movs r3, 0
	ldrsh r2, [r2, r3]
	adds r0, r4, 0
	bl sub_80D5994
	strh r7, [r4, 0x3A]
	mov r0, r8
	strh r0, [r4, 0x3C]
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	add r0, r10
	ldr r1, _080D58F8 @ =gTasks + 0x8
	adds r0, r1
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
_080D58C6:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x6
	bls _080D5844
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D58E0: .4byte gUnknown_083D96DC
_080D58E4: .4byte gSpriteTemplate_83D96C4
_080D58E8: .4byte gSprites
_080D58EC: .4byte 0x000003ff
_080D58F0: .4byte 0xfffffc00
_080D58F4: .4byte gUnknown_083D96DC + 0x2
_080D58F8: .4byte gTasks + 0x8
	thumb_func_end sub_80D57C4
	
	.align 2, 0 @ Don't pad with nop.
