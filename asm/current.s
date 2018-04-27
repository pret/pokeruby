	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	@ current

	thumb_func_start sub_80D700C
sub_80D700C: @ 80D700C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080D7030 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _080D7026
	b _080D714C
_080D7026:
	cmp r0, 0x1
	bgt _080D7034
	cmp r0, 0
	beq _080D703C
	b _080D718E
	.align 2, 0
_080D7030: .4byte gTasks
_080D7034:
	cmp r0, 0x2
	bne _080D703A
	b _080D7180
_080D703A:
	b _080D718E
_080D703C:
	ldr r4, _080D707C @ =gAnimBankAttacker
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	movs r2, 0x1
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	bne _080D7052
	movs r1, 0x1
_080D7052:
	movs r6, 0
	strh r1, [r5, 0xA]
	ldr r0, _080D7080 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r2, [r0, r1]
	adds r3, r0, 0
	cmp r2, 0
	beq _080D7088
	cmp r2, 0x4
	beq _080D70B0
	ldrh r1, [r3]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D70E8
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r5, 0xE]
	ldr r0, _080D7084 @ =0x0000fff0
	b _080D70F0
	.align 2, 0
_080D707C: .4byte gAnimBankAttacker
_080D7080: .4byte gBattleAnimArgs
_080D7084: .4byte 0x0000fff0
_080D7088:
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xE]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x12]
	movs r2, 0xA
	ldrsh r0, [r5, r2]
	lsls r0, 7
	adds r0, 0x78
	strh r0, [r5, 0x10]
	b _080D7126
_080D70B0:
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r1, 7
	movs r0, 0x78
	subs r0, r1
	strh r0, [r5, 0xE]
	ldr r4, _080D70E4 @ =gAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x12]
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0xA
	ldrsh r1, [r5, r2]
	lsls r1, 5
	subs r0, r1
	strh r0, [r5, 0x10]
	b _080D7126
	.align 2, 0
_080D70E4: .4byte gAnimBankTarget
_080D70E8:
	ldr r0, _080D710C @ =0x0000fff0
	strh r0, [r5, 0xE]
	movs r0, 0x80
	lsls r0, 1
_080D70F0:
	strh r0, [r5, 0x10]
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _080D7110
	movs r2, 0
	ldrsh r0, [r3, r2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 1
	movs r0, 0x50
	subs r0, r1
	strh r0, [r5, 0x12]
	b _080D7126
	.align 2, 0
_080D710C: .4byte 0x0000fff0
_080D7110:
	movs r0, 0
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 1
	adds r0, 0x28
	strh r0, [r5, 0x12]
	ldrh r1, [r5, 0xE]
	ldrh r0, [r5, 0x10]
	strh r0, [r5, 0xE]
	strh r1, [r5, 0x10]
_080D7126:
	movs r2, 0xE
	ldrsh r1, [r5, r2]
	movs r2, 0x10
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bge _080D713C
	movs r1, 0
	movs r0, 0x1
	strh r0, [r5, 0xA]
	strh r1, [r5, 0x14]
	b _080D7178
_080D713C:
	ldr r0, _080D7148 @ =0x0000ffff
	strh r0, [r5, 0xA]
	movs r0, 0x3
	strh r0, [r5, 0x14]
	b _080D7178
	.align 2, 0
_080D7148: .4byte 0x0000ffff
_080D714C:
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	cmp r0, 0
	ble _080D718E
	movs r0, 0
	strh r0, [r5, 0xC]
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80D7194
	lsls r0, 24
	cmp r0, 0
	bne _080D7178
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80D7194
	lsls r0, 24
	cmp r0, 0
	beq _080D718E
_080D7178:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080D718E
_080D7180:
	movs r1, 0x16
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080D718E
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080D718E:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80D700C

	thumb_func_start sub_80D7194
sub_80D7194: @ 80D7194
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _080D7220 @ =gSpriteTemplate_83D9B10
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	movs r3, 0x12
	ldrsh r2, [r4, r3]
	movs r3, 0x23
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080D71CA
	ldr r1, _080D7224 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	strh r5, [r0, 0x3A]
	movs r1, 0x7
	strh r1, [r0, 0x3C]
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
_080D71CA:
	ldrh r1, [r4, 0xA]
	ldrh r5, [r4, 0x14]
	adds r0, r1, r5
	strh r0, [r4, 0x14]
	lsls r0, 16
	cmp r0, 0
	bge _080D71DC
	movs r0, 0x3
	strh r0, [r4, 0x14]
_080D71DC:
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0x3
	ble _080D71E8
	movs r0, 0
	strh r0, [r4, 0x14]
_080D71E8:
	movs r3, 0xA
	ldrsh r0, [r4, r3]
	lsls r0, 4
	ldrh r5, [r4, 0xE]
	adds r2, r0, r5
	strh r2, [r4, 0xE]
	lsls r0, r1, 16
	asrs r3, r0, 16
	cmp r3, 0x1
	bne _080D7208
	lsls r0, r2, 16
	asrs r0, 16
	movs r5, 0x10
	ldrsh r1, [r4, r5]
	cmp r0, r1
	bge _080D721C
_080D7208:
	movs r0, 0x1
	negs r0, r0
	cmp r3, r0
	bne _080D7228
	lsls r0, r2, 16
	asrs r0, 16
	movs r2, 0x10
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bgt _080D7228
_080D721C:
	movs r0, 0x1
	b _080D722A
	.align 2, 0
_080D7220: .4byte gSpriteTemplate_83D9B10
_080D7224: .4byte gSprites
_080D7228:
	movs r0, 0
_080D722A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80D7194

	thumb_func_start sub_80D7230
sub_80D7230: @ 80D7230
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _080D7270
	ldr r3, _080D7278 @ =gTasks
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x3A
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_080D7270:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D7278: .4byte gTasks
	thumb_func_end sub_80D7230

	thumb_func_start sub_80D727C
sub_80D727C: @ 80D727C
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080D728E
	cmp r0, 0x1
	beq _080D72C0
	b _080D72D4
_080D728E:
	ldr r4, _080D72BC @ =gAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	adds r0, r5, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080D72D4
	.align 2, 0
_080D72BC: .4byte gAnimBankAttacker
_080D72C0:
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080D72D4
	adds r0, r5, 0
	bl move_anim_8074EE0
_080D72D4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80D727C

	thumb_func_start sub_80D72DC
sub_80D72DC: @ 80D72DC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080D7300 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x4
	bls _080D72F6
	b _080D7468
_080D72F6:
	lsls r0, 2
	ldr r1, _080D7304 @ =_080D7308
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D7300: .4byte gTasks
_080D7304: .4byte _080D7308
	.align 2, 0
_080D7308:
	.4byte _080D731C
	.4byte _080D73AC
	.4byte _080D73E8
	.4byte _080D7444
	.4byte _080D7454
_080D731C:
	ldr r4, _080D73A0 @ =gAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x14]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x16]
	movs r0, 0x4
	strh r0, [r5, 0x18]
	ldr r0, _080D73A4 @ =gAnimBankTarget
	ldrb r0, [r0]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x1C]
	movs r2, 0x1C
	ldrsh r0, [r5, r2]
	movs r2, 0x14
	ldrsh r1, [r5, r2]
	subs r0, r1
	movs r1, 0x5
	bl __divsi3
	strh r0, [r5, 0x1A]
	movs r0, 0x7
	strh r0, [r5, 0x10]
	ldr r0, _080D73A8 @ =0x0000ffff
	strh r0, [r5, 0x12]
	movs r0, 0xC
	strh r0, [r5, 0x1E]
	subs r0, 0x4C
	bl BattleAnimAdjustPanning
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0x20]
	movs r0, 0x3F
	bl BattleAnimAdjustPanning
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0x22]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x24]
	movs r1, 0x22
	ldrsh r0, [r5, r1]
	movs r2, 0x20
	ldrsh r1, [r5, r2]
	subs r0, r1
	movs r1, 0x3
	bl __divsi3
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	b _080D7466
	.align 2, 0
_080D73A0: .4byte gAnimBankAttacker
_080D73A4: .4byte gAnimBankTarget
_080D73A8: .4byte 0x0000ffff
_080D73AC:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	cmp r0, 0
	ble _080D73DC
	movs r0, 0
	strh r0, [r5, 0xA]
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80D7470
	lsls r0, 24
	cmp r0, 0
	beq _080D73DC
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	cmp r0, 0x5
	bne _080D73D6
	movs r0, 0x3
	b _080D73DA
_080D73D6:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
_080D73DA:
	strh r0, [r5, 0x8]
_080D73DC:
	ldrh r1, [r5, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080D7468
	b _080D745E
_080D73E8:
	ldrh r1, [r5, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080D73F6
	subs r0, r1, 0x1
	strh r0, [r5, 0x1E]
_080D73F6:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	movs r3, 0
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080D7468
	strh r3, [r5, 0xA]
	ldrh r1, [r5, 0xC]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _080D7422
	movs r0, 0x4
	strh r0, [r5, 0x16]
	movs r0, 0x44
	strh r0, [r5, 0x18]
	strh r3, [r5, 0x10]
	strh r2, [r5, 0x12]
	b _080D7432
_080D7422:
	movs r0, 0x44
	strh r0, [r5, 0x16]
	movs r0, 0x4
	strh r0, [r5, 0x18]
	movs r0, 0x7
	strh r0, [r5, 0x10]
	ldr r0, _080D7440 @ =0x0000ffff
	strh r0, [r5, 0x12]
_080D7432:
	movs r1, 0x1E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080D7464
	movs r0, 0x4
	b _080D7466
	.align 2, 0
_080D7440: .4byte 0x0000ffff
_080D7444:
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080D7468
	adds r0, r2, 0
	bl DestroyAnimVisualTask
	b _080D7468
_080D7454:
	ldrh r1, [r5, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080D7464
_080D745E:
	subs r0, r1, 0x1
	strh r0, [r5, 0x1E]
	b _080D7468
_080D7464:
	movs r0, 0x1
_080D7466:
	strh r0, [r5, 0x8]
_080D7468:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80D72DC

	thumb_func_start sub_80D7470
sub_80D7470: @ 80D7470
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _080D7538 @ =gSpriteTemplate_83D9B40
	movs r2, 0x14
	ldrsh r1, [r4, r2]
	movs r3, 0x16
	ldrsh r2, [r4, r3]
	movs r3, 0x23
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080D74DC
	ldr r1, _080D753C @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r3, r0, r1
	ldrh r2, [r3, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	ldrh r6, [r4, 0x10]
	adds r1, r6
	ldr r6, _080D7540 @ =0x000003ff
	adds r0, r6, 0
	ands r1, r0
	ldr r0, _080D7544 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	ldrh r0, [r4, 0x12]
	ldrh r1, [r4, 0x10]
	adds r0, r1
	strh r0, [r4, 0x10]
	lsls r0, 16
	cmp r0, 0
	bge _080D74C4
	movs r0, 0x7
	strh r0, [r4, 0x10]
_080D74C4:
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0x7
	ble _080D74D0
	movs r0, 0
	strh r0, [r4, 0x10]
_080D74D0:
	strh r5, [r3, 0x3A]
	movs r0, 0x3
	strh r0, [r3, 0x3C]
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
_080D74DC:
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _080D74FE
	movs r5, 0x12
	ldrsh r0, [r4, r5]
	cmp r0, 0
	ble _080D74FE
	ldrh r1, [r4, 0x26]
	ldrh r6, [r4, 0x24]
	adds r1, r6
	strh r1, [r4, 0x24]
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x76
	bl PlaySE12WithPanning
_080D74FE:
	movs r0, 0x12
	ldrsh r3, [r4, r0]
	ldrh r2, [r4, 0x16]
	cmp r3, 0
	bge _080D7514
	lsls r0, r2, 16
	asrs r0, 16
	movs r5, 0x18
	ldrsh r1, [r4, r5]
	cmp r0, r1
	ble _080D7524
_080D7514:
	cmp r3, 0
	ble _080D7548
	lsls r0, r2, 16
	asrs r0, 16
	movs r6, 0x18
	ldrsh r1, [r4, r6]
	cmp r0, r1
	blt _080D7548
_080D7524:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x1A]
	ldrh r1, [r4, 0x14]
	adds r0, r1
	strh r0, [r4, 0x14]
	movs r0, 0x1
	b _080D7554
	.align 2, 0
_080D7538: .4byte gSpriteTemplate_83D9B40
_080D753C: .4byte gSprites
_080D7540: .4byte 0x000003ff
_080D7544: .4byte 0xfffffc00
_080D7548:
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	lsls r0, 3
	adds r0, r2, r0
	strh r0, [r4, 0x16]
	movs r0, 0
_080D7554:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80D7470

	thumb_func_start sub_80D755C
sub_80D755C: @ 80D755C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _080D7592
	ldr r3, _080D7598 @ =gTasks
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x3A
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	adds r0, r4, 0
	bl DestroySprite
_080D7592:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D7598: .4byte gTasks
	thumb_func_end sub_80D755C

	thumb_func_start sub_80D759C
sub_80D759C: @ 80D759C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080D75C0 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080D7618
	cmp r0, 0x1
	bgt _080D75C4
	cmp r0, 0
	beq _080D75CA
	b _080D764E
	.align 2, 0
_080D75C0: .4byte gTasks
_080D75C4:
	cmp r0, 0x2
	beq _080D7640
	b _080D764E
_080D75CA:
	ldr r0, _080D7614 @ =gAnimBankTarget
	ldrb r0, [r0]
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x20
	strh r0, [r5, 0x26]
	strh r0, [r5, 0x24]
	cmp r0, 0x10
	ble _080D75F4
	adds r2, r0, 0
_080D75E4:
	adds r1, r2, 0
	subs r1, 0x20
	adds r2, r1, 0
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x10
	bgt _080D75E4
	strh r1, [r5, 0x24]
_080D75F4:
	ldr r4, _080D7614 @ =gAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	bl sub_8079E90
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x2
	strh r0, [r5, 0x20]
	b _080D7638
	.align 2, 0
_080D7614: .4byte gAnimBankTarget
_080D7618:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D764E
	movs r0, 0
	strh r0, [r5, 0xA]
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80D7654
	lsls r0, 24
	cmp r0, 0
	beq _080D764E
_080D7638:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080D764E
_080D7640:
	movs r1, 0x1C
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080D764E
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080D764E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80D759C

	thumb_func_start sub_80D7654
sub_80D7654: @ 80D7654
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _080D76B0 @ =gBattleAnimSpriteTemplate_83D97D0
	movs r2, 0x22
	ldrsh r1, [r4, r2]
	movs r3, 0x24
	ldrsh r2, [r4, r3]
	ldrh r3, [r4, 0x20]
	lsls r3, 24
	lsrs r3, 24
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080D7698
	ldr r3, _080D76B4 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x1C
	adds r1, r0, r1
	ldr r2, _080D76B8 @ =sub_80D76C4
	str r2, [r1]
	adds r0, r3
	strh r5, [r0, 0x3A]
	movs r1, 0xA
	strh r1, [r0, 0x3C]
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
_080D7698:
	ldrh r2, [r4, 0x24]
	movs r0, 0x24
	ldrsh r1, [r4, r0]
	movs r3, 0x26
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _080D76BC
	adds r0, r2, 0
	adds r0, 0x20
	strh r0, [r4, 0x24]
	movs r0, 0
	b _080D76BE
	.align 2, 0
_080D76B0: .4byte gBattleAnimSpriteTemplate_83D97D0
_080D76B4: .4byte gSprites
_080D76B8: .4byte sub_80D76C4
_080D76BC:
	movs r0, 0x1
_080D76BE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80D7654
	
	.align 2, 0 @ Don't pad with nop.
