	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	@ fight

	thumb_func_start unc_080B08A0
unc_080B08A0: @ 80D8FF0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080D9020 @ =gBattleAnimArgs
	movs r0, 0
	ldrsh r1, [r5, r0]
	adds r0, r4, 0
	bl sub_807867C
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	movs r0, 0xF
	strh r0, [r4, 0x2E]
	ldr r0, _080D9024 @ =sub_80782D8
	str r0, [r4, 0x1C]
	ldr r1, _080D9028 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D9020: .4byte gBattleAnimArgs
_080D9024: .4byte sub_80782D8
_080D9028: .4byte DestroyAnimSprite
	thumb_func_end unc_080B08A0

	thumb_func_start sub_80D902C
sub_80D902C: @ 80D902C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080D9070 @ =gBattleAnimArgs
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080D9054
	ldr r0, _080D9074 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080D9054
	ldrh r0, [r4, 0x2]
	negs r0, r0
	strh r0, [r4, 0x2]
	ldrh r0, [r4, 0x6]
	negs r0, r0
	strh r0, [r4, 0x6]
_080D9054:
	ldr r4, _080D9070 @ =gBattleAnimArgs
	ldrb r1, [r4, 0xC]
	adds r0, r5, 0
	bl StartSpriteAnim
	movs r0, 0
	strh r0, [r4, 0xC]
	adds r0, r5, 0
	bl sub_8079534
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D9070: .4byte gBattleAnimArgs
_080D9074: .4byte gAnimBankAttacker
	thumb_func_end sub_80D902C

	thumb_func_start sub_80D9078
sub_80D9078: @ 80D9078
	push {r4,lr}
	adds r4, r0, 0
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _080D9094
	ldr r0, _080D90A0 @ =gBattleAnimArgs
	ldrh r1, [r0, 0x2]
	negs r1, r1
	strh r1, [r0, 0x2]
	ldrh r1, [r0, 0x6]
	negs r1, r1
	strh r1, [r0, 0x6]
_080D9094:
	adds r0, r4, 0
	bl sub_80D902C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D90A0: .4byte gBattleAnimArgs
	thumb_func_end sub_80D9078

	thumb_func_start sub_80D90A4
sub_80D90A4: @ 80D90A4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080D90C4 @ =gBattleAnimArgs
	ldrb r1, [r4, 0x8]
	bl StartSpriteAnim
	movs r1, 0x6
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D90C8
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80787B0
	b _080D90D0
	.align 2, 0
_080D90C4: .4byte gBattleAnimArgs
_080D90C8:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8078764
_080D90D0:
	ldr r0, _080D90E8 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	strh r0, [r5, 0x2E]
	ldr r0, _080D90EC @ =sub_80782D8
	str r0, [r5, 0x1C]
	ldr r1, _080D90F0 @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D90E8: .4byte gBattleAnimArgs
_080D90EC: .4byte sub_80782D8
_080D90F0: .4byte DestroyAnimSprite
	thumb_func_end sub_80D90A4

	thumb_func_start sub_80D90F4
sub_80D90F4: @ 80D90F4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r5, r0, 0
	ldr r0, _080D9110 @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r1, [r0, r2]
	mov r9, r0
	cmp r1, 0
	bne _080D9118
	ldr r0, _080D9114 @ =gAnimBankAttacker
	b _080D911A
	.align 2, 0
_080D9110: .4byte gBattleAnimArgs
_080D9114: .4byte gAnimBankAttacker
_080D9118:
	ldr r0, _080D9260 @ =gAnimBankTarget
_080D911A:
	ldrb r0, [r0]
	mov r8, r0
	mov r4, r9
	movs r3, 0x4
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bge _080D9138
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x5
	bl __umodsi3
	strh r0, [r4, 0x4]
_080D9138:
	ldrb r1, [r4, 0x4]
	adds r0, r5, 0
	bl StartSpriteAnim
	mov r0, r8
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	mov r0, r8
	movs r1, 0x3
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	mov r0, r8
	movs r1, 0x1
	bl sub_807A100
	lsls r0, 16
	asrs r1, r0, 16
	lsrs r0, 31
	adds r1, r0
	lsls r1, 15
	lsrs r6, r1, 16
	mov r0, r8
	movs r1, 0
	bl sub_807A100
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _080D9182
	adds r0, 0x3
_080D9182:
	lsls r4, r0, 14
	lsrs r4, 16
	bl Random
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r6, 16
	asrs r1, 16
	bl __modsi3
	lsls r0, 16
	lsrs r6, r0, 16
	bl Random
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 16
	asrs r4, 16
	adds r1, r4, 0
	bl __modsi3
	lsls r0, 16
	lsrs r4, r0, 16
	bl Random
	movs r7, 0x1
	adds r1, r7, 0
	ands r1, r0
	cmp r1, 0
	beq _080D91C4
	lsls r0, r6, 16
	negs r0, r0
	lsrs r6, r0, 16
_080D91C4:
	bl Random
	adds r1, r7, 0
	ands r1, r0
	cmp r1, 0
	beq _080D91D6
	lsls r0, r4, 16
	negs r0, r0
	lsrs r4, r0, 16
_080D91D6:
	ldr r0, _080D9264 @ =gBanksBySide
	add r0, r8
	ldrb r1, [r0]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	bne _080D91EC
	lsls r0, r4, 16
	ldr r1, _080D9268 @ =0xfff00000
	adds r0, r1
	lsrs r4, r0, 16
_080D91EC:
	lsls r0, r6, 16
	asrs r0, 16
	ldrh r2, [r5, 0x20]
	adds r0, r2
	strh r0, [r5, 0x20]
	lsls r0, r4, 16
	asrs r0, 16
	ldrh r3, [r5, 0x22]
	adds r0, r3
	strh r0, [r5, 0x22]
	mov r1, r9
	ldrh r0, [r1, 0x2]
	strh r0, [r5, 0x2E]
	ldr r0, _080D926C @ =gBattleAnimSpriteTemplate_83DB4A8
	movs r2, 0x20
	ldrsh r1, [r5, r2]
	movs r3, 0x22
	ldrsh r2, [r5, r3]
	adds r3, r5, 0
	adds r3, 0x43
	ldrb r3, [r3]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x3C]
	cmp r0, 0x40
	beq _080D9250
	movs r0, 0x3C
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080D9270 @ =gSprites
	adds r0, r4
	movs r1, 0
	bl StartSpriteAffineAnim
	movs r2, 0x3C
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _080D9274 @ =SpriteCallbackDummy
	str r1, [r0]
_080D9250:
	ldr r0, _080D9278 @ =sub_80D927C
	str r0, [r5, 0x1C]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D9260: .4byte gAnimBankTarget
_080D9264: .4byte gBanksBySide
_080D9268: .4byte 0xfff00000
_080D926C: .4byte gBattleAnimSpriteTemplate_83DB4A8
_080D9270: .4byte gSprites
_080D9274: .4byte SpriteCallbackDummy
_080D9278: .4byte sub_80D927C
	thumb_func_end sub_80D90F4

	thumb_func_start sub_80D927C
sub_80D927C: @ 80D927C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r1, [r5, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bne _080D92C4
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	cmp r0, 0x40
	beq _080D92B8
	ldr r4, _080D92C0 @ =gSprites
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	movs r0, 0x3C
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
_080D92B8:
	adds r0, r5, 0
	bl DestroyAnimSprite
	b _080D92C8
	.align 2, 0
_080D92C0: .4byte gSprites
_080D92C4:
	subs r0, r1, 0x1
	strh r0, [r5, 0x2E]
_080D92C8:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80D927C

	thumb_func_start sub_80D92D0
sub_80D92D0: @ 80D92D0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8078764
	movs r0, 0x1E
	strh r0, [r4, 0x2E]
	ldr r0, _080D92F0 @ =gBattleAnimArgs
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080D92F4
	ldrh r0, [r4, 0x20]
	subs r0, 0x14
	strh r0, [r4, 0x32]
	b _080D9306
	.align 2, 0
_080D92F0: .4byte gBattleAnimArgs
_080D92F4:
	ldrh r0, [r4, 0x20]
	adds r0, 0x14
	strh r0, [r4, 0x32]
	adds r2, r4, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
_080D9306:
	ldrh r0, [r4, 0x22]
	subs r0, 0x14
	strh r0, [r4, 0x36]
	ldr r0, _080D9320 @ =sub_8078B34
	str r0, [r4, 0x1C]
	ldr r1, _080D9324 @ =sub_80D9328
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D9320: .4byte sub_8078B34
_080D9324: .4byte sub_80D9328
	thumb_func_end sub_80D92D0

	thumb_func_start sub_80D9328
sub_80D9328: @ 80D9328
	push {r4-r6,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x38]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r5, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	bne _080D9368
	ldrh r2, [r5, 0x20]
	ldrh r4, [r5, 0x24]
	subs r0, r2, r4
	strh r0, [r5, 0x32]
	ldrh r1, [r5, 0x22]
	ldrh r3, [r5, 0x26]
	subs r0, r1, r3
	strh r0, [r5, 0x36]
	movs r0, 0x8
	strh r0, [r5, 0x2E]
	adds r2, r4
	strh r2, [r5, 0x20]
	adds r1, r3
	strh r1, [r5, 0x22]
	strh r6, [r5, 0x26]
	strh r6, [r5, 0x24]
	ldr r0, _080D9370 @ =sub_8078B34
	str r0, [r5, 0x1C]
	ldr r1, _080D9374 @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
_080D9368:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D9370: .4byte sub_8078B34
_080D9374: .4byte DestroyAnimSprite
	thumb_func_end sub_80D9328

	thumb_func_start sub_80D9378
sub_80D9378: @ 80D9378
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r0, _080D93F4 @ =gAnimBankAttacker
	ldrb r1, [r0]
	movs r0, 0x2
	ldr r2, _080D93F8 @ =gAnimBankTarget
	eors r0, r1
	ldrb r1, [r2]
	cmp r0, r1
	bne _080D93A4
	ldrb r0, [r2]
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080D93A4
	ldr r1, _080D93FC @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1]
_080D93A4:
	adds r0, r6, 0
	movs r1, 0x1
	bl sub_8078764
	ldr r0, _080D93F4 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080D93C2
	ldr r1, _080D93FC @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080D93C2:
	ldr r4, _080D93FC @ =gBattleAnimArgs
	ldrh r0, [r4, 0x6]
	movs r5, 0
	strh r0, [r6, 0x2E]
	ldrh r0, [r6, 0x20]
	strh r0, [r6, 0x30]
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrh r0, [r6, 0x22]
	strh r0, [r6, 0x34]
	strh r0, [r6, 0x36]
	adds r0, r6, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldrh r0, [r4, 0xA]
	strh r0, [r6, 0x38]
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x3A]
	strh r5, [r6, 0x3C]
	ldr r0, _080D9400 @ =sub_80D9404
	str r0, [r6, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D93F4: .4byte gAnimBankAttacker
_080D93F8: .4byte gAnimBankTarget
_080D93FC: .4byte gBattleAnimArgs
_080D9400: .4byte sub_80D9404
	thumb_func_end sub_80D9378

	thumb_func_start sub_80D9404
sub_80D9404: @ 80D9404
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	bne _080D9430
	ldrh r0, [r4, 0x3C]
	lsls r0, 16
	asrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	ldrh r2, [r4, 0x3C]
	adds r0, r2
	strh r0, [r4, 0x3C]
	b _080D9436
_080D9430:
	adds r0, r4, 0
	bl DestroyAnimSprite
_080D9436:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D9404

	thumb_func_start sub_80D943C
sub_80D943C: @ 80D943C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8078764
	ldr r5, _080D9468 @ =gBattleAnimArgs
	ldrb r1, [r5, 0x4]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x2E]
	ldr r0, _080D946C @ =sub_80782D8
	str r0, [r4, 0x1C]
	ldr r1, _080D9470 @ =sub_80D9474
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D9468: .4byte gBattleAnimArgs
_080D946C: .4byte sub_80782D8
_080D9470: .4byte sub_80D9474
	thumb_func_end sub_80D943C

	thumb_func_start sub_80D9474
sub_80D9474: @ 80D9474
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x14
	strh r0, [r4, 0x2E]
	ldr r0, _080D94A0 @ =sub_80782D8
	str r0, [r4, 0x1C]
	ldr r1, _080D94A4 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D94A0: .4byte sub_80782D8
_080D94A4: .4byte DestroyAnimSprite
	thumb_func_end sub_80D9474

	thumb_func_start sub_80D94A8
sub_80D94A8: @ 80D94A8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8078764
	ldr r0, _080D94C4 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x2E]
	ldr r0, _080D94C8 @ =sub_80D94CC
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D94C4: .4byte gBattleAnimArgs
_080D94C8: .4byte sub_80D94CC
	thumb_func_end sub_80D94A8

	thumb_func_start sub_80D94CC
sub_80D94CC: @ 80D94CC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x2E]
	subs r0, 0x1
	strh r0, [r5, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080D9510
	movs r0, 0x6
	strh r0, [r5, 0x2E]
	ldr r4, _080D9518 @ =gAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	ldr r0, _080D951C @ =sub_8078B34
	str r0, [r5, 0x1C]
	ldr r1, _080D9520 @ =sub_80D9524
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
_080D9510:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D9518: .4byte gAnimBankTarget
_080D951C: .4byte sub_8078B34
_080D9520: .4byte sub_80D9524
	thumb_func_end sub_80D94CC

	thumb_func_start sub_80D9524
sub_80D9524: @ 80D9524
	push {lr}
	movs r1, 0xF
	strh r1, [r0, 0x2E]
	ldr r1, _080D9538 @ =sub_80782D8
	str r1, [r0, 0x1C]
	ldr r1, _080D953C @ =DestroyAnimSprite
	bl StoreSpriteCallbackInData
	pop {r0}
	bx r0
	.align 2, 0
_080D9538: .4byte sub_80782D8
_080D953C: .4byte DestroyAnimSprite
	thumb_func_end sub_80D9524

	thumb_func_start sub_80D9540
sub_80D9540: @ 80D9540
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D956C
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8078764
	ldr r1, _080D9568 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080D95C8
	.align 2, 0
_080D9568: .4byte gBattleAnimArgs
_080D956C:
	ldrh r0, [r4, 0x30]
	ldrh r2, [r4, 0x36]
	adds r0, r2
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x34]
	adds r0, 0x3
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x34]
	cmp r0, 0x64
	ble _080D95BA
	movs r0, 0x34
	ldrsh r1, [r4, r0]
	lsrs r0, r1, 31
	adds r0, r1, r0
	asrs r0, 1
	lsls r0, 1
	subs r1, r0
	adds r3, r4, 0
	adds r3, 0x3E
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080D95BA:
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0x78
	ble _080D95C8
	adds r0, r4, 0
	bl DestroyAnimSprite
_080D95C8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D9540

	thumb_func_start sub_80D95D0
sub_80D95D0: @ 80D95D0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080D95E4 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080D95EC
	ldr r4, _080D95E8 @ =gAnimBankAttacker
	b _080D95EE
	.align 2, 0
_080D95E4: .4byte gBattleAnimArgs
_080D95E8: .4byte gAnimBankAttacker
_080D95EC:
	ldr r4, _080D9634 @ =gAnimBankTarget
_080D95EE:
	ldrb r0, [r4]
	movs r1, 0
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r1, _080D9638 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x2]
	ldrh r2, [r5, 0x20]
	adds r0, r2
	movs r2, 0
	strh r0, [r5, 0x20]
	ldrh r0, [r1, 0x4]
	ldrh r3, [r5, 0x22]
	adds r0, r3
	strh r0, [r5, 0x22]
	strh r2, [r5, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r5, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r5, 0x32]
	strh r2, [r5, 0x34]
	ldr r0, _080D963C @ =sub_80D9640
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D9634: .4byte gAnimBankTarget
_080D9638: .4byte gBattleAnimArgs
_080D963C: .4byte sub_80D9640
	thumb_func_end sub_80D95D0

	thumb_func_start sub_80D9640
sub_80D9640: @ 80D9640
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	cmp r2, 0
	beq _080D9652
	cmp r2, 0x1
	beq _080D9676
	b _080D96B0
_080D9652:
	ldrh r0, [r1, 0x30]
	subs r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _080D96B0
	movs r2, 0x32
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080D966E
	adds r0, r1, 0
	bl DestroyAnimSprite
	b _080D96B0
_080D966E:
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	b _080D96B0
_080D9676:
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D969E
	movs r0, 0
	strh r0, [r1, 0x30]
	ldrh r0, [r1, 0x34]
	adds r0, 0x1
	strh r0, [r1, 0x34]
	ands r0, r2
	lsls r0, 16
	cmp r0, 0
	beq _080D969A
	movs r0, 0x2
	b _080D969C
_080D969A:
	ldr r0, _080D96B4 @ =0x0000fffe
_080D969C:
	strh r0, [r1, 0x24]
_080D969E:
	ldrh r0, [r1, 0x32]
	subs r0, 0x1
	strh r0, [r1, 0x32]
	lsls r0, 16
	cmp r0, 0
	bne _080D96B0
	adds r0, r1, 0
	bl DestroyAnimSprite
_080D96B0:
	pop {r0}
	bx r0
	.align 2, 0
_080D96B4: .4byte 0x0000fffe
	thumb_func_end sub_80D9640

	thumb_func_start sub_80D96B8
sub_80D96B8: @ 80D96B8
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080D96DC @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080D96E4
	ldr r4, _080D96E0 @ =gAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r6, 0x4]
	adds r0, r2
	b _080D96F6
	.align 2, 0
_080D96DC: .4byte gBattleAnimArgs
_080D96E0: .4byte gAnimBankAttacker
_080D96E4:
	ldr r4, _080D9740 @ =gAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x4]
	adds r0, r1
_080D96F6:
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x6]
	adds r0, r6
	strh r0, [r5, 0x22]
	ldrh r2, [r5, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	ldr r3, _080D9744 @ =gBattleAnimArgs
	movs r4, 0x2
	ldrsh r0, [r3, r4]
	lsls r0, 4
	adds r1, r0
	ldr r4, _080D9748 @ =0x000003ff
	adds r0, r4, 0
	ands r1, r0
	ldr r0, _080D974C @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	movs r1, 0
	movs r0, 0
	strh r0, [r5, 0x2E]
	movs r2, 0x2
	ldrsh r0, [r3, r2]
	cmp r0, 0x1
	beq _080D9764
	cmp r0, 0x1
	bgt _080D9750
	cmp r0, 0
	beq _080D975A
	b _080D978A
	.align 2, 0
_080D9740: .4byte gAnimBankTarget
_080D9744: .4byte gBattleAnimArgs
_080D9748: .4byte 0x000003ff
_080D974C: .4byte 0xfffffc00
_080D9750:
	cmp r0, 0x2
	beq _080D9774
	cmp r0, 0x3
	beq _080D9784
	b _080D978A
_080D975A:
	ldr r0, _080D9760 @ =0x0000fffd
	b _080D9784
	.align 2, 0
_080D9760: .4byte 0x0000fffd
_080D9764:
	movs r0, 0x3
	strh r0, [r5, 0x3A]
	ldr r0, _080D9770 @ =0x0000fffd
	strh r0, [r5, 0x3C]
	b _080D9792
	.align 2, 0
_080D9770: .4byte 0x0000fffd
_080D9774:
	ldr r0, _080D9780 @ =0x0000fffd
	strh r0, [r5, 0x3A]
	movs r0, 0x3
	strh r0, [r5, 0x3C]
	b _080D9792
	.align 2, 0
_080D9780: .4byte 0x0000fffd
_080D9784:
	strh r0, [r5, 0x3A]
	strh r0, [r5, 0x3C]
	b _080D9792
_080D978A:
	adds r0, r5, 0
	bl DestroyAnimSprite
	b _080D9796
_080D9792:
	ldr r0, _080D979C @ =sub_80D97A0
	str r0, [r5, 0x1C]
_080D9796:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D979C: .4byte sub_80D97A0
	thumb_func_end sub_80D96B8

	thumb_func_start sub_80D97A0
sub_80D97A0: @ 80D97A0
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x3A]
	ldrh r2, [r1, 0x20]
	adds r0, r2
	strh r0, [r1, 0x20]
	ldrh r0, [r1, 0x3C]
	ldrh r2, [r1, 0x22]
	adds r0, r2
	strh r0, [r1, 0x22]
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x28
	ble _080D97C8
	adds r0, r1, 0
	bl DestroyAnimSprite
_080D97C8:
	pop {r0}
	bx r0
	thumb_func_end sub_80D97A0

	thumb_func_start sub_80D97CC
sub_80D97CC: @ 80D97CC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080D9818 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080D9828
	ldr r4, _080D981C @ =gBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r0, _080D9820 @ =gAnimBankAttacker
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
	ldr r0, _080D9824 @ =gAnimBankTarget
	b _080D9844
	.align 2, 0
_080D9818: .4byte gBattleAnimArgs
_080D981C: .4byte gBankAttacker
_080D9820: .4byte gAnimBankAttacker
_080D9824: .4byte gAnimBankTarget
_080D9828:
	ldr r0, _080D9860 @ =gAnimBankTarget
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
	ldr r0, _080D9864 @ =gAnimBankAttacker
_080D9844:
	ldrb r0, [r0]
	strh r0, [r5, 0x3C]
	movs r0, 0
	strh r0, [r5, 0x2E]
	movs r0, 0xC
	strh r0, [r5, 0x30]
	movs r0, 0x8
	strh r0, [r5, 0x32]
	ldr r0, _080D9868 @ =sub_80D986C
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D9860: .4byte gAnimBankTarget
_080D9864: .4byte gAnimBankAttacker
_080D9868: .4byte sub_80D986C
	thumb_func_end sub_80D97CC

	thumb_func_start sub_80D986C
sub_80D986C: @ 80D986C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB4
	bne _080D98C6
	ldr r1, _080D98CC @ =REG_BLDCNT
	movs r0, 0
	strh r0, [r1]
	movs r0, 0x10
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r1, _080D98D0 @ =move_anim_8074EE0
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	ldr r0, _080D98D4 @ =sub_8078BB8
	str r0, [r4, 0x1C]
_080D98C6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D98CC: .4byte REG_BLDCNT
_080D98D0: .4byte move_anim_8074EE0
_080D98D4: .4byte sub_8078BB8
	thumb_func_end sub_80D986C

	thumb_func_start sub_80D98D8
sub_80D98D8: @ 80D98D8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080D9924 @ =gBattleAnimArgs
	ldrh r0, [r4]
	strh r0, [r5, 0x20]
	movs r2, 0x78
	strh r2, [r5, 0x22]
	ldrh r0, [r4, 0x6]
	strh r0, [r5, 0x2E]
	adds r0, r5, 0
	adds r0, 0x36
	adds r1, r5, 0
	adds r1, 0x38
	lsls r2, 8
	bl sub_8079BF4
	ldrh r0, [r4, 0x2]
	strh r0, [r5, 0x3A]
	ldrh r2, [r5, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	movs r3, 0x4
	ldrsh r0, [r4, r3]
	lsls r0, 2
	adds r1, r0
	ldr r3, _080D9928 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080D992C @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	ldr r0, _080D9930 @ =sub_80D9934
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D9924: .4byte gBattleAnimArgs
_080D9928: .4byte 0x000003ff
_080D992C: .4byte 0xfffffc00
_080D9930: .4byte sub_80D9934
	thumb_func_end sub_80D98D8

	thumb_func_start sub_80D9934
sub_80D9934: @ 80D9934
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r7, r1]
	cmp r0, 0
	beq _080D9986
	movs r2, 0x36
	ldrsh r0, [r7, r2]
	movs r2, 0x38
	ldrsh r1, [r7, r2]
	bl sub_8079BFC
	adds r4, r0, 0
	movs r1, 0x3A
	ldrsh r0, [r7, r1]
	subs r4, r0
	adds r0, r7, 0
	adds r0, 0x36
	adds r1, r7, 0
	adds r1, 0x38
	adds r2, r4, 0
	bl sub_8079BF4
	asrs r4, 8
	strh r4, [r7, 0x22]
	lsls r4, 16
	asrs r4, 16
	movs r0, 0x8
	negs r0, r0
	cmp r4, r0
	bge _080D997E
	adds r0, r7, 0
	bl DestroyAnimSprite
	b _080D99DC
_080D997E:
	ldrh r0, [r7, 0x2E]
	subs r0, 0x1
	strh r0, [r7, 0x2E]
	b _080D99DC
_080D9986:
	ldr r4, _080D99E8 @ =gAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBankPosition
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBankPosition
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r2, _080D99EC @ =gAnimBankTarget
	mov r8, r2
	ldrb r0, [r2]
	movs r1, 0x2
	bl GetBankPosition
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x3
	bl GetBankPosition
	lsls r0, 24
	subs r4, r6
	strh r4, [r7, 0x2E]
	lsrs r0, 24
	subs r0, r5
	strh r0, [r7, 0x30]
	ldrh r0, [r7, 0x20]
	lsls r0, 4
	strh r0, [r7, 0x32]
	ldrh r0, [r7, 0x22]
	lsls r0, 4
	strh r0, [r7, 0x34]
	ldr r0, _080D99F0 @ =sub_80D99F4
	str r0, [r7, 0x1C]
_080D99DC:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D99E8: .4byte gAnimBankAttacker
_080D99EC: .4byte gAnimBankTarget
_080D99F0: .4byte sub_80D99F4
	thumb_func_end sub_80D9934

	thumb_func_start sub_80D99F4
sub_80D99F4: @ 80D99F4
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x32]
	adds r0, r1
	strh r0, [r2, 0x32]
	ldrh r1, [r2, 0x30]
	ldrh r3, [r2, 0x34]
	adds r1, r3
	strh r1, [r2, 0x34]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r2, 0x20]
	lsls r1, 16
	asrs r3, r1, 20
	strh r3, [r2, 0x22]
	adds r0, 0x8
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 17
	cmp r0, r1
	bhi _080D9A2E
	adds r1, r3, 0
	movs r0, 0x8
	negs r0, r0
	cmp r1, r0
	blt _080D9A2E
	cmp r1, 0x78
	ble _080D9A34
_080D9A2E:
	adds r0, r2, 0
	bl DestroyAnimSprite
_080D9A34:
	pop {r0}
	bx r0
	thumb_func_end sub_80D99F4

	thumb_func_start sub_80D9A38
sub_80D9A38: @ 80D9A38
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080D9A6C @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080D9A7C
	ldr r4, _080D9A70 @ =gBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r0, _080D9A74 @ =gAnimBankTarget
	ldrb r4, [r0]
	ldr r0, _080D9A78 @ =gAnimBankAttacker
	b _080D9A82
	.align 2, 0
_080D9A6C: .4byte gBattleAnimArgs
_080D9A70: .4byte gBankAttacker
_080D9A74: .4byte gAnimBankTarget
_080D9A78: .4byte gAnimBankAttacker
_080D9A7C:
	ldr r0, _080D9AB4 @ =gAnimBankAttacker
	ldrb r4, [r0]
	ldr r0, _080D9AB8 @ =gAnimBankTarget
_080D9A82:
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
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _080D9ABC
	ldrb r2, [r5, 0x3]
	lsls r1, r2, 26
	lsrs r1, 27
	movs r0, 0x8
	orrs r1, r0
	lsls r1, 1
	subs r0, 0x47
	b _080D9AD6
	.align 2, 0
_080D9AB4: .4byte gAnimBankAttacker
_080D9AB8: .4byte gAnimBankTarget
_080D9ABC:
	adds r0, r4, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080D9ADC
	ldrb r2, [r5, 0x3]
	lsls r1, r2, 26
	lsrs r1, 27
	movs r0, 0x18
	orrs r1, r0
	lsls r1, 1
	subs r0, 0x57
_080D9AD6:
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x3]
_080D9ADC:
	movs r0, 0x10
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	adds r0, r4, 0
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	adds r0, r4, 0
	movs r1, 0x3
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r1, _080D9B1C @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	ldr r0, _080D9B20 @ =sub_8078BB8
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D9B1C: .4byte DestroyAnimSprite
_080D9B20: .4byte sub_8078BB8
	thumb_func_end sub_80D9A38

	thumb_func_start sub_80D9B24
sub_80D9B24: @ 80D9B24
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080D9B3A
	adds r0, r4, 0
	bl DestroyAnimSprite
_080D9B3A:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D9B24

	thumb_func_start sub_80D9B48
sub_80D9B48: @ 80D9B48
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r4, _080D9BC4 @ =gAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r1, _080D9BC8 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x6]
	strh r0, [r5, 0x30]
	ldrh r0, [r1]
	strh r0, [r5, 0x32]
	ldrh r0, [r1, 0x2]
	strh r0, [r5, 0x34]
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x36]
	ldr r0, _080D9BCC @ =gAnimMoveTurn
	ldrb r6, [r0]
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080D9B92
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_080D9B92:
	movs r0, 0x1
	ands r6, r0
	cmp r6, 0
	beq _080D9BA6
	ldrh r0, [r5, 0x32]
	negs r0, r0
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
_080D9BA6:
	ldrh r1, [r5, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	ldrh r0, [r5, 0x32]
	strh r0, [r5, 0x24]
	ldrh r0, [r5, 0x34]
	strh r0, [r5, 0x26]
	ldr r0, _080D9BD0 @ =sub_80D9B24
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D9BC4: .4byte gAnimBankTarget
_080D9BC8: .4byte gBattleAnimArgs
_080D9BCC: .4byte gAnimMoveTurn
_080D9BD0: .4byte sub_80D9B24
	thumb_func_end sub_80D9B48

	thumb_func_start sub_80D9BD4
sub_80D9BD4: @ 80D9BD4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080D9BEC @ =gBattleAnimArgs
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080D9BF0
	adds r0, r4, 0
	movs r1, 0
	bl sub_80787B0
	b _080D9BF8
	.align 2, 0
_080D9BEC: .4byte gBattleAnimArgs
_080D9BF0:
	adds r0, r4, 0
	movs r1, 0
	bl sub_8078764
_080D9BF8:
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _080D9C0C
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	b _080D9C22
_080D9C0C:
	ldr r0, _080D9C34 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080D9C22
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
_080D9C22:
	ldr r0, _080D9C38 @ =sub_8078600
	str r0, [r4, 0x1C]
	ldr r1, _080D9C3C @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D9C34: .4byte gAnimBankAttacker
_080D9C38: .4byte sub_8078600
_080D9C3C: .4byte DestroyAnimSprite
	thumb_func_end sub_80D9BD4

	thumb_func_start sub_80D9C40
sub_80D9C40: @ 80D9C40
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080D9C7A
	ldrh r0, [r4, 0x30]
	adds r0, 0x28
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x2
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x28
	ble _080D9C7A
	adds r0, r4, 0
	bl DestroyAnimSprite
_080D9C7A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D9C40

	thumb_func_start sub_80D9C80
sub_80D9C80: @ 80D9C80
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080D9CB0 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080D9CB8
	cmp r0, 0x1
	bgt _080D9CD2
	cmp r0, 0
	bne _080D9CD2
	movs r0, 0
	bl sub_80789D4
	ldr r0, _080D9CB4 @ =gBattleAnimArgs
	ldrh r0, [r0]
	strh r0, [r4, 0x18]
	b _080D9CCA
	.align 2, 0
_080D9CB0: .4byte gTasks
_080D9CB4: .4byte gBattleAnimArgs
_080D9CB8:
	ldrh r0, [r4, 0x18]
	subs r0, 0x1
	strh r0, [r4, 0x18]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080D9CDE
_080D9CCA:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080D9CDE
_080D9CD2:
	movs r2, 0xA0
	lsls r2, 3
	adds r0, r2, 0
	ldrh r1, [r4, 0x1A]
	adds r0, r1
	strh r0, [r4, 0x1A]
_080D9CDE:
	movs r2, 0xB0
	lsls r2, 4
	adds r0, r2, 0
	ldrh r1, [r4, 0x1C]
	adds r0, r1
	strh r0, [r4, 0x1C]
	ldr r0, _080D9D0C @ =gAnimBankTarget
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080D9D14
	ldr r1, _080D9D10 @ =gBattle_BG3_X
	ldrh r0, [r4, 0x1A]
	lsls r0, 16
	asrs r0, 24
	ldrh r2, [r1]
	adds r0, r2
	strh r0, [r1]
	adds r7, r1, 0
	b _080D9D24
	.align 2, 0
_080D9D0C: .4byte gAnimBankTarget
_080D9D10: .4byte gBattle_BG3_X
_080D9D14:
	ldr r2, _080D9D64 @ =gBattle_BG3_X
	ldrh r1, [r4, 0x1A]
	lsls r1, 16
	asrs r1, 24
	ldrh r0, [r2]
	subs r0, r1
	strh r0, [r2]
	adds r7, r2, 0
_080D9D24:
	ldr r3, _080D9D68 @ =gBattle_BG3_Y
	ldrh r2, [r4, 0x1C]
	lsls r0, r2, 16
	asrs r0, 24
	ldrh r1, [r3]
	adds r0, r1
	strh r0, [r3]
	movs r0, 0xFF
	ldrb r1, [r4, 0x1A]
	movs r5, 0
	strh r1, [r4, 0x1A]
	ands r0, r2
	strh r0, [r4, 0x1C]
	ldr r0, _080D9D6C @ =gBattleAnimArgs
	movs r2, 0xE
	ldrsh r1, [r0, r2]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _080D9D5C
	strh r5, [r7]
	strh r5, [r3]
	movs r0, 0x1
	bl sub_80789D4
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080D9D5C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D9D64: .4byte gBattle_BG3_X
_080D9D68: .4byte gBattle_BG3_Y
_080D9D6C: .4byte gBattleAnimArgs
	thumb_func_end sub_80D9C80
	
	.align 2, 0 @ Don't pad with nop.
