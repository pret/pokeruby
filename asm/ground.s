	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	@ ground

	thumb_func_start sub_80E0F1C
sub_80E0F1C: @ 80E0F1C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080E0F74 @ =gAnimBankAttacker
	ldrb r0, [r5]
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	movs r0, 0x14
	strh r0, [r4, 0x2E]
	ldr r5, _080E0F78 @ =gAnimBankTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	ldr r0, _080E0F7C @ =0x0000ffd8
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_80786EC
	ldr r0, _080E0F80 @ =sub_80E0F84
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E0F74: .4byte gAnimBankAttacker
_080E0F78: .4byte gAnimBankTarget
_080E0F7C: .4byte 0x0000ffd8
_080E0F80: .4byte sub_80E0F84
	thumb_func_end sub_80E0F1C

	thumb_func_start sub_80E0F84
sub_80E0F84: @ 80E0F84
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080E0FD8
	ldrh r0, [r5, 0x24]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x26]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	strh r1, [r5, 0x26]
	strh r1, [r5, 0x24]
	movs r0, 0x14
	strh r0, [r5, 0x2E]
	ldr r4, _080E0FE0 @ =gAnimBankAttacker
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
	movs r0, 0x28
	strh r0, [r5, 0x38]
	adds r0, r5, 0
	bl sub_80786EC
	ldr r0, _080E0FE4 @ =sub_80E0FE8
	str r0, [r5, 0x1C]
_080E0FD8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E0FE0: .4byte gAnimBankAttacker
_080E0FE4: .4byte sub_80E0FE8
	thumb_func_end sub_80E0F84

	thumb_func_start sub_80E0FE8
sub_80E0FE8: @ 80E0FE8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080E0FFC
	adds r0, r4, 0
	bl DestroyAnimSprite
_080E0FFC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E0FE8

	thumb_func_start sub_80E1004
sub_80E1004: @ 80E1004
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_8078764
	ldr r0, _080E1064 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080E1024
	ldr r1, _080E1068 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080E1024:
	ldr r4, _080E1068 @ =gBattleAnimArgs
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x2E]
	ldr r5, _080E106C @ =gAnimBankTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x6]
	adds r0, r4
	strh r0, [r6, 0x36]
	ldr r0, _080E1070 @ =sub_8078B34
	str r0, [r6, 0x1C]
	ldr r1, _080E1074 @ =DestroyAnimSprite
	adds r0, r6, 0
	bl StoreSpriteCallbackInData
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E1064: .4byte gAnimBankAttacker
_080E1068: .4byte gBattleAnimArgs
_080E106C: .4byte gAnimBankTarget
_080E1070: .4byte sub_8078B34
_080E1074: .4byte DestroyAnimSprite
	thumb_func_end sub_80E1004

	thumb_func_start sub_80E1078
sub_80E1078: @ 80E1078
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r4, _080E10F8 @ =gAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077EE4
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077EE4
	lsls r0, 24
	lsrs r7, r0, 24
	bl Random
	movs r4, 0x1F
	adds r5, r4, 0
	ands r5, r0
	bl Random
	ands r4, r0
	adds r1, r5, 0
	cmp r1, 0x10
	ble _080E10C0
	movs r0, 0x10
	subs r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
_080E10C0:
	lsls r0, r4, 16
	asrs r1, r0, 16
	cmp r1, 0x10
	ble _080E10D0
	movs r0, 0x10
	subs r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
_080E10D0:
	ldr r0, _080E10FC @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	strh r0, [r6, 0x2E]
	mov r1, r8
	adds r0, r1, r5
	strh r0, [r6, 0x32]
	adds r0, r7, r4
	strh r0, [r6, 0x36]
	ldr r0, _080E1100 @ =sub_8078B34
	str r0, [r6, 0x1C]
	ldr r1, _080E1104 @ =move_anim_8074EE0
	adds r0, r6, 0
	bl StoreSpriteCallbackInData
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E10F8: .4byte gAnimBankTarget
_080E10FC: .4byte gBattleAnimArgs
_080E1100: .4byte sub_8078B34
_080E1104: .4byte move_anim_8074EE0
	thumb_func_end sub_80E1078

	thumb_func_start sub_80E1108
sub_80E1108: @ 80E1108
	push {r4-r6,lr}
	adds r5, r0, 0
	ldrh r2, [r5, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x1
	ldr r3, _080E1168 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080E116C @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	ldr r6, _080E1170 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080E117C
	ldr r4, _080E1174 @ =gAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r6, 0x2]
	adds r0, r2
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	ldrh r3, [r6, 0x4]
	adds r0, r3
	strh r0, [r5, 0x22]
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	movs r2, 0x1
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	ble _080E1162
	movs r1, 0x1
_080E1162:
	strh r1, [r5, 0x2E]
	ldr r0, _080E1178 @ =sub_80E1198
	b _080E118A
	.align 2, 0
_080E1168: .4byte 0x000003ff
_080E116C: .4byte 0xfffffc00
_080E1170: .4byte gBattleAnimArgs
_080E1174: .4byte gAnimBankAttacker
_080E1178: .4byte sub_80E1198
_080E117C:
	ldrh r0, [r6, 0x2]
	strh r0, [r5, 0x20]
	ldrh r0, [r6, 0x4]
	strh r0, [r5, 0x22]
	negs r0, r0
	strh r0, [r5, 0x26]
	ldr r0, _080E1194 @ =sub_80E11D4
_080E118A:
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E1194: .4byte sub_80E11D4
	thumb_func_end sub_80E1108

	thumb_func_start sub_80E1198
sub_80E1198: @ 80E1198
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080E11B6
	movs r0, 0
	strh r0, [r2, 0x30]
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	strh r0, [r2, 0x20]
_080E11B6:
	ldrh r0, [r2, 0x22]
	subs r0, 0x4
	strh r0, [r2, 0x22]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x4
	negs r1, r1
	cmp r0, r1
	bge _080E11CE
	adds r0, r2, 0
	bl DestroyAnimSprite
_080E11CE:
	pop {r0}
	bx r0
	thumb_func_end sub_80E1198

	thumb_func_start sub_80E11D4
sub_80E11D4: @ 80E11D4
	push {lr}
	adds r3, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	cmp r1, 0
	beq _080E11E6
	cmp r1, 0x1
	beq _080E11FC
	b _080E123E
_080E11E6:
	ldrh r0, [r3, 0x26]
	adds r0, 0x4
	strh r0, [r3, 0x26]
	lsls r0, 16
	cmp r0, 0
	blt _080E123E
	strh r1, [r3, 0x26]
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	b _080E123E
_080E11FC:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	cmp r0, 0
	ble _080E123E
	movs r0, 0
	strh r0, [r3, 0x30]
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	ldrb r2, [r1]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _080E123E
	adds r0, r3, 0
	bl DestroyAnimSprite
_080E123E:
	pop {r0}
	bx r0
	thumb_func_end sub_80E11D4

	thumb_func_start sub_80E1244
sub_80E1244: @ 80E1244
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080E1264 @ =gTasks
	adds r1, r0, r1
	ldr r0, _080E1268 @ =gBattleAnimArgs
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r0, 0
	bne _080E1270
	ldr r0, _080E126C @ =sub_80E1284
	b _080E1272
	.align 2, 0
_080E1264: .4byte gTasks
_080E1268: .4byte gBattleAnimArgs
_080E126C: .4byte sub_80E1284
_080E1270:
	ldr r0, _080E1280 @ =sub_80E143C
_080E1272:
	str r0, [r1]
	ldr r1, [r1]
	adds r0, r2, 0
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080E1280: .4byte sub_80E143C
	thumb_func_end sub_80E1244

	thumb_func_start sub_80E1284
sub_80E1284: @ 80E1284
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080E12A8 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _080E129E
	b _080E1432
_080E129E:
	lsls r0, 2
	ldr r1, _080E12AC @ =_080E12B0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E12A8: .4byte gTasks
_080E12AC: .4byte _080E12B0
	.align 2, 0
_080E12B0:
	.4byte _080E12C4
	.4byte _080E134C
	.4byte _080E135C
	.4byte _080E1400
	.4byte _080E1414
_080E12C4:
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1C]
	ldr r0, _080E12EC @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankIdentity_permutated
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1E]
	cmp r0, 0x1
	bne _080E12F8
	ldr r0, _080E12F0 @ =gBattle_BG1_X
	ldrh r0, [r0]
	strh r0, [r4, 0x20]
	ldr r0, _080E12F4 @ =gBattle_BG1_Y
	b _080E1300
	.align 2, 0
_080E12EC: .4byte gAnimBankAttacker
_080E12F0: .4byte gBattle_BG1_X
_080E12F4: .4byte gBattle_BG1_Y
_080E12F8:
	ldr r0, _080E133C @ =gBattle_BG2_X
	ldrh r0, [r0]
	strh r0, [r4, 0x20]
	ldr r0, _080E1340 @ =gBattle_BG2_Y
_080E1300:
	ldrh r0, [r0]
	strh r0, [r4, 0x22]
	ldr r0, _080E1344 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl sub_8077FC0
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	subs r1, 0x20
	strh r1, [r4, 0x24]
	adds r0, 0x20
	strh r0, [r4, 0x26]
	cmp r1, 0
	bge _080E1322
	movs r0, 0
	strh r0, [r4, 0x24]
_080E1322:
	ldr r2, _080E1348 @ =gSprites
	movs r3, 0x1C
	ldrsh r1, [r4, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _080E1406
	.align 2, 0
_080E133C: .4byte gBattle_BG2_X
_080E1340: .4byte gBattle_BG2_Y
_080E1344: .4byte gAnimBankAttacker
_080E1348: .4byte gSprites
_080E134C:
	ldrb r0, [r4, 0x1E]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	movs r3, 0x26
	ldrsh r2, [r4, r3]
	bl sub_80E1668
	b _080E1406
_080E135C:
	ldrh r0, [r4, 0xC]
	adds r0, 0x6
	movs r1, 0x7F
	ands r0, r1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080E137E
	movs r0, 0
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
_080E137E:
	ldr r1, _080E13A0 @ =gSineTable
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 20
	ldrh r3, [r4, 0xE]
	adds r2, r0, r3
	strh r2, [r4, 0x12]
	movs r1, 0x1E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080E13A8
	ldr r1, _080E13A4 @ =gBattle_BG1_Y
	b _080E13AA
	.align 2, 0
_080E13A0: .4byte gSineTable
_080E13A4: .4byte gBattle_BG1_Y
_080E13A8:
	ldr r1, _080E13CC @ =gBattle_BG2_Y
_080E13AA:
	ldrh r0, [r4, 0x22]
	subs r0, r2
	strh r0, [r1]
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	cmp r0, 0x3F
	ble _080E1432
	ldrh r0, [r4, 0x24]
	movs r1, 0x78
	subs r2, r1, r0
	strh r2, [r4, 0x12]
	movs r3, 0x1E
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	bne _080E13D4
	ldr r1, _080E13D0 @ =gBattle_BG1_Y
	b _080E13D6
	.align 2, 0
_080E13CC: .4byte gBattle_BG2_Y
_080E13D0: .4byte gBattle_BG1_Y
_080E13D4:
	ldr r1, _080E13F8 @ =gBattle_BG2_Y
_080E13D6:
	ldrh r0, [r4, 0x22]
	subs r0, r2
	strh r0, [r1]
	ldr r2, _080E13FC @ =gSprites
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r2, [r1, 0x20]
	movs r3, 0x88
	lsls r3, 1
	adds r0, r3, 0
	subs r0, r2
	strh r0, [r1, 0x24]
	b _080E1406
	.align 2, 0
_080E13F8: .4byte gBattle_BG2_Y
_080E13FC: .4byte gSprites
_080E1400:
	ldr r1, _080E1410 @ =gScanlineEffect
	movs r0, 0x3
	strb r0, [r1, 0x15]
_080E1406:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080E1432
	.align 2, 0
_080E1410: .4byte gScanlineEffect
_080E1414:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
	ldr r2, _080E1438 @ =gSprites
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_080E1432:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E1438: .4byte gSprites
	thumb_func_end sub_80E1284

	thumb_func_start sub_80E143C
sub_80E143C: @ 80E143C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E147C @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r3]
	movs r4, 0
	strh r4, [r1, 0x24]
	strh r4, [r1, 0x26]
	ldr r0, _080E1480 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankIdentity_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080E1488
	ldr r0, _080E1484 @ =gBattle_BG1_Y
	b _080E148A
	.align 2, 0
_080E147C: .4byte gSprites
_080E1480: .4byte gAnimBankAttacker
_080E1484: .4byte gBattle_BG1_Y
_080E1488:
	ldr r0, _080E1498 @ =gBattle_BG2_Y
_080E148A:
	strh r4, [r0]
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E1498: .4byte gBattle_BG2_Y
	thumb_func_end sub_80E143C

	thumb_func_start sub_80E149C
sub_80E149C: @ 80E149C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080E14BC @ =gTasks
	adds r1, r0, r1
	ldr r0, _080E14C0 @ =gBattleAnimArgs
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r0, 0
	bne _080E14C8
	ldr r0, _080E14C4 @ =sub_80E14DC
	b _080E14CA
	.align 2, 0
_080E14BC: .4byte gTasks
_080E14C0: .4byte gBattleAnimArgs
_080E14C4: .4byte sub_80E14DC
_080E14C8:
	ldr r0, _080E14D8 @ =sub_80E1560
_080E14CA:
	str r0, [r1]
	ldr r1, [r1]
	adds r0, r2, 0
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080E14D8: .4byte sub_80E1560
	thumb_func_end sub_80E149C

	thumb_func_start sub_80E14DC
sub_80E14DC: @ 80E14DC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080E14FC @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r5, [r4, r0]
	cmp r5, 0
	beq _080E1500
	cmp r5, 0x1
	beq _080E1554
	b _080E155A
	.align 2, 0
_080E14FC: .4byte gTasks
_080E1500:
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1C]
	ldr r3, _080E1550 @ =gSprites
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r5, [r0, 0x24]
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrh r2, [r1, 0x22]
	movs r0, 0xA0
	subs r0, r2
	strh r0, [r1, 0x26]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080E155A
	.align 2, 0
_080E1550: .4byte gSprites
_080E1554:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080E155A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80E14DC

	thumb_func_start sub_80E1560
sub_80E1560: @ 80E1560
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080E1584 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bhi _080E1662
	lsls r0, 2
	ldr r1, _080E1588 @ =_080E158C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E1584: .4byte gTasks
_080E1588: .4byte _080E158C
	.align 2, 0
_080E158C:
	.4byte _080E15A0
	.4byte _080E15F4
	.4byte _080E1602
	.4byte _080E161C
	.4byte _080E165C
_080E15A0:
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1C]
	ldr r0, _080E15C4 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankIdentity_permutated
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1E]
	cmp r0, 0x1
	bne _080E15CC
	ldr r0, _080E15C8 @ =gBattle_BG1_X
	b _080E15CE
	.align 2, 0
_080E15C4: .4byte gAnimBankAttacker
_080E15C8: .4byte gBattle_BG1_X
_080E15CC:
	ldr r0, _080E15EC @ =gBattle_BG2_X
_080E15CE:
	ldrh r0, [r0]
	strh r0, [r4, 0x20]
	ldr r0, _080E15F0 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl sub_8077FC0
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	subs r1, 0x20
	strh r1, [r4, 0x24]
	adds r0, 0x20
	strh r0, [r4, 0x26]
	b _080E164A
	.align 2, 0
_080E15EC: .4byte gBattle_BG2_X
_080E15F0: .4byte gAnimBankAttacker
_080E15F4:
	ldrb r0, [r4, 0x1E]
	movs r1, 0x26
	ldrsh r2, [r4, r1]
	movs r1, 0
	bl sub_80E1668
	b _080E164A
_080E1602:
	ldr r2, _080E1618 @ =gSprites
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x60
	strh r1, [r0, 0x26]
	b _080E164A
	.align 2, 0
_080E1618: .4byte gSprites
_080E161C:
	ldr r2, _080E1654 @ =gSprites
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	subs r1, 0x8
	strh r1, [r0, 0x26]
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x26
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080E1662
	ldr r1, _080E1658 @ =gScanlineEffect
	movs r0, 0x3
	strb r0, [r1, 0x15]
_080E164A:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080E1662
	.align 2, 0
_080E1654: .4byte gSprites
_080E1658: .4byte gScanlineEffect
_080E165C:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080E1662:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E1560

	thumb_func_start sub_80E1668
sub_80E1668: @ 80E1668
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r4, r2, 16
	cmp r0, 0x1
	bne _080E168C
	ldr r0, _080E1684 @ =gBattle_BG1_X
	ldrh r3, [r0]
	ldr r0, _080E1688 @ =REG_BG1HOFS
	b _080E1692
	.align 2, 0
_080E1684: .4byte gBattle_BG1_X
_080E1688: .4byte REG_BG1HOFS
_080E168C:
	ldr r0, _080E1718 @ =gBattle_BG2_X
	ldrh r3, [r0]
	ldr r0, _080E171C @ =REG_BG2HOFS
_080E1692:
	str r0, [sp]
	lsls r0, r1, 16
	cmp r0, 0
	bge _080E169C
	movs r1, 0
_080E169C:
	lsls r2, r1, 16
	lsls r0, r4, 16
	asrs r4, r0, 16
	cmp r2, r0
	bge _080E16C8
	ldr r5, _080E1720 @ =gScanlineEffectRegBuffers
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r5, r0
_080E16AE:
	asrs r2, 16
	lsls r1, r2, 1
	adds r0, r1, r5
	strh r3, [r0]
	adds r1, r6
	strh r3, [r1]
	adds r2, 0x1
	lsls r2, 16
	lsrs r1, r2, 16
	lsls r2, r1, 16
	asrs r0, r2, 16
	cmp r0, r4
	blt _080E16AE
_080E16C8:
	lsls r1, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	bgt _080E16F6
	ldr r4, _080E1720 @ =gScanlineEffectRegBuffers
	lsls r0, r3, 16
	asrs r0, 16
	adds r3, r0, 0
	adds r3, 0xF0
	movs r0, 0xF0
	lsls r0, 3
	adds r5, r4, r0
_080E16E0:
	asrs r2, r1, 16
	lsls r1, r2, 1
	adds r0, r1, r4
	strh r3, [r0]
	adds r1, r5
	strh r3, [r1]
	adds r2, 0x1
	lsls r1, r2, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	ble _080E16E0
_080E16F6:
	ldr r0, _080E1724 @ =0xa2600001
	str r0, [sp, 0x4]
	mov r1, sp
	movs r2, 0
	movs r0, 0x1
	strb r0, [r1, 0x8]
	mov r0, sp
	strb r2, [r0, 0x9]
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl ScanlineEffect_SetParams
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E1718: .4byte gBattle_BG2_X
_080E171C: .4byte REG_BG2HOFS
_080E1720: .4byte gScanlineEffectRegBuffers
_080E1724: .4byte 0xa2600001
	thumb_func_end sub_80E1668

	thumb_func_start sub_80E1728
sub_80E1728: @ 80E1728
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r0, _080E173C @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r7, r0, 0
	cmp r1, 0
	bne _080E1744
	ldr r0, _080E1740 @ =gAnimBankAttacker
	b _080E1746
	.align 2, 0
_080E173C: .4byte gBattleAnimArgs
_080E1740: .4byte gAnimBankAttacker
_080E1744:
	ldr r0, _080E17A8 @ =gAnimBankTarget
_080E1746:
	ldrb r4, [r0]
	movs r6, 0x18
	adds r1, r7, 0
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	bne _080E1762
	negs r0, r6
	lsls r0, 16
	lsrs r6, r0, 16
	movs r2, 0x4
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1, 0x4]
_080E1762:
	adds r0, r4, 0
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	adds r0, r6
	strh r0, [r5, 0x20]
	adds r0, r4, 0
	bl sub_8077FC0
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1E
	strh r0, [r5, 0x22]
	ldrh r1, [r7, 0xA]
	strh r1, [r5, 0x2E]
	ldrh r1, [r7, 0x4]
	ldrh r2, [r5, 0x20]
	adds r1, r2
	strh r1, [r5, 0x32]
	ldrh r1, [r7, 0x6]
	adds r0, r1
	strh r0, [r5, 0x36]
	ldrh r0, [r7, 0x8]
	strh r0, [r5, 0x38]
	adds r0, r5, 0
	bl sub_80786EC
	ldr r0, _080E17AC @ =sub_80E17B0
	str r0, [r5, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E17A8: .4byte gAnimBankTarget
_080E17AC: .4byte sub_80E17B0
	thumb_func_end sub_80E1728

	thumb_func_start sub_80E17B0
sub_80E17B0: @ 80E17B0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080E17C4
	adds r0, r4, 0
	bl DestroyAnimSprite
_080E17C4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E17B0

	thumb_func_start sub_80E17CC
sub_80E17CC: @ 80E17CC
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r0, _080E17E0 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080E17E8
	ldr r0, _080E17E4 @ =gAnimBankAttacker
	b _080E17EA
	.align 2, 0
_080E17E0: .4byte gBattleAnimArgs
_080E17E4: .4byte gAnimBankAttacker
_080E17E8:
	ldr r0, _080E1848 @ =gAnimBankTarget
_080E17EA:
	ldrb r5, [r0]
	adds r0, r5, 0
	movs r1, 0
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E184C @ =0x0000fff0
	adds r0, r2
	ldr r4, _080E1850 @ =gBattleAnimArgs
	movs r3, 0x2
	ldrsh r1, [r4, r3]
	lsls r1, 5
	adds r0, r1
	strh r0, [r6, 0x20]
	adds r0, r5, 0
	bl sub_8077FC0
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x20
	strh r0, [r6, 0x22]
	ldrh r2, [r6, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	movs r3, 0x2
	ldrsh r0, [r4, r3]
	lsls r0, 3
	adds r1, r0
	ldr r3, _080E1854 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080E1858 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r6, 0x4]
	ldr r1, _080E185C @ =DestroyAnimSprite
	adds r0, r6, 0
	bl StoreSpriteCallbackInData
	ldrh r0, [r4, 0x4]
	strh r0, [r6, 0x2E]
	ldr r0, _080E1860 @ =sub_80782D8
	str r0, [r6, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E1848: .4byte gAnimBankTarget
_080E184C: .4byte 0x0000fff0
_080E1850: .4byte gBattleAnimArgs
_080E1854: .4byte 0x000003ff
_080E1858: .4byte 0xfffffc00
_080E185C: .4byte DestroyAnimSprite
_080E1860: .4byte sub_80782D8
	thumb_func_end sub_80E17CC

	thumb_func_start sub_80E1864
sub_80E1864: @ 80E1864
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080E1888 @ =gTasks
	adds r4, r0, r1
	ldr r0, _080E188C @ =gBattleAnimArgs
	ldrh r2, [r0, 0x2]
	movs r3, 0x2
	ldrsh r1, [r0, r3]
	adds r6, r0, 0
	cmp r1, 0
	beq _080E1890
	adds r0, r2, 0x3
	b _080E189C
	.align 2, 0
_080E1888: .4byte gTasks
_080E188C: .4byte gBattleAnimArgs
_080E1890:
	ldr r0, _080E18BC @ =gAnimMovePower
	ldrh r0, [r0]
	movs r1, 0xA
	bl __udivsi3
	adds r0, 0x3
_080E189C:
	strh r0, [r4, 0x26]
	strh r0, [r4, 0x24]
	adds r1, r6, 0
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0xE]
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0x4
	beq _080E18C8
	cmp r0, 0x5
	bne _080E1908
	ldr r0, _080E18C0 @ =gBattle_BG3_X
	ldrh r0, [r0]
	strh r0, [r4, 0x22]
	ldr r0, _080E18C4 @ =sub_80E1934
	b _080E1926
	.align 2, 0
_080E18BC: .4byte gAnimMovePower
_080E18C0: .4byte gBattle_BG3_X
_080E18C4: .4byte sub_80E1934
_080E18C8:
	movs r0, 0
	strh r0, [r4, 0x22]
	movs r5, 0
_080E18CE:
	lsls r0, r5, 24
	lsrs r0, 24
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080E18F8
	movs r3, 0x22
	ldrsh r0, [r4, r3]
	adds r0, 0x9
	lsls r0, 1
	adds r1, r4, 0
	adds r1, 0x8
	adds r1, r0
	ldr r0, _080E1904 @ =gBankSpriteIds
	adds r0, r5, r0
	ldrb r0, [r0]
	strh r0, [r1]
	ldrh r0, [r4, 0x22]
	adds r0, 0x1
	strh r0, [r4, 0x22]
_080E18F8:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _080E18CE
	b _080E1924
	.align 2, 0
_080E1904: .4byte gBankSpriteIds
_080E1908:
	ldrb r0, [r6]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1A]
	cmp r0, 0xFF
	bne _080E1920
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	b _080E1928
_080E1920:
	movs r0, 0x1
	strh r0, [r4, 0x22]
_080E1924:
	ldr r0, _080E1930 @ =sub_80E1A2C
_080E1926:
	str r0, [r4]
_080E1928:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E1930: .4byte sub_80E1A2C
	thumb_func_end sub_80E1864

	thumb_func_start sub_80E1934
sub_80E1934: @ 80E1934
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080E1958 @ =gTasks
	adds r3, r0, r1
	movs r0, 0x8
	ldrsh r1, [r3, r0]
	cmp r1, 0x1
	beq _080E19B8
	cmp r1, 0x1
	bgt _080E195C
	cmp r1, 0
	beq _080E1962
	b _080E1A24
	.align 2, 0
_080E1958: .4byte gTasks
_080E195C:
	cmp r1, 0x2
	beq _080E1A18
	b _080E1A24
_080E1962:
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080E1A24
	strh r1, [r3, 0xA]
	ldrh r1, [r3, 0xC]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080E198C
	ldr r1, _080E1988 @ =gBattle_BG3_X
	ldrh r0, [r3, 0x26]
	ldrh r2, [r3, 0x22]
	adds r0, r2
	strh r0, [r1]
	b _080E1996
	.align 2, 0
_080E1988: .4byte gBattle_BG3_X
_080E198C:
	ldr r0, _080E19B4 @ =gBattle_BG3_X
	ldrh r1, [r3, 0x22]
	ldrh r2, [r3, 0x26]
	subs r1, r2
	strh r1, [r0]
_080E1996:
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xE
	ldrsh r1, [r3, r2]
	cmp r0, r1
	bne _080E1A24
	movs r0, 0
	strh r0, [r3, 0xC]
	ldrh r0, [r3, 0x24]
	subs r0, 0x1
	strh r0, [r3, 0x24]
	b _080E1A0C
	.align 2, 0
_080E19B4: .4byte gBattle_BG3_X
_080E19B8:
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080E1A24
	movs r0, 0
	strh r0, [r3, 0xA]
	ldrh r0, [r3, 0xC]
	ands r1, r0
	cmp r1, 0
	bne _080E19E4
	ldr r1, _080E19E0 @ =gBattle_BG3_X
	ldrh r0, [r3, 0x24]
	ldrh r2, [r3, 0x22]
	adds r0, r2
	strh r0, [r1]
	b _080E19EE
	.align 2, 0
_080E19E0: .4byte gBattle_BG3_X
_080E19E4:
	ldr r0, _080E1A14 @ =gBattle_BG3_X
	ldrh r1, [r3, 0x22]
	ldrh r2, [r3, 0x24]
	subs r1, r2
	strh r1, [r0]
_080E19EE:
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080E1A24
	movs r0, 0
	strh r0, [r3, 0xC]
	ldrh r0, [r3, 0x24]
	subs r0, 0x1
	strh r0, [r3, 0x24]
	lsls r0, 16
	cmp r0, 0
	bne _080E1A24
_080E1A0C:
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	b _080E1A24
	.align 2, 0
_080E1A14: .4byte gBattle_BG3_X
_080E1A18:
	ldr r1, _080E1A28 @ =gBattle_BG3_X
	ldrh r0, [r3, 0x22]
	strh r0, [r1]
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080E1A24:
	pop {r0}
	bx r0
	.align 2, 0
_080E1A28: .4byte gBattle_BG3_X
	thumb_func_end sub_80E1934

	thumb_func_start sub_80E1A2C
sub_80E1A2C: @ 80E1A2C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	ldr r1, _080E1A50 @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r5, [r4, r0]
	cmp r5, 0x1
	beq _080E1A8C
	cmp r5, 0x1
	bgt _080E1A54
	cmp r5, 0
	beq _080E1A5A
	b _080E1B06
	.align 2, 0
_080E1A50: .4byte gTasks
_080E1A54:
	cmp r5, 0x2
	beq _080E1AC8
	b _080E1B06
_080E1A5A:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080E1B06
	strh r5, [r4, 0xA]
	adds r0, r4, 0
	bl sub_80E1B10
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080E1B06
	strh r5, [r4, 0xC]
	ldrh r0, [r4, 0x24]
	subs r0, 0x1
	strh r0, [r4, 0x24]
	b _080E1AC0
_080E1A8C:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080E1B06
	strh r5, [r4, 0xA]
	adds r0, r4, 0
	bl sub_80E1B10
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080E1B06
	strh r5, [r4, 0xC]
	ldrh r0, [r4, 0x24]
	subs r0, 0x1
	strh r0, [r4, 0x24]
	lsls r0, 16
	cmp r0, 0
	bne _080E1B06
_080E1AC0:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080E1B06
_080E1AC8:
	movs r2, 0
	movs r7, 0x22
	ldrsh r0, [r4, r7]
	cmp r2, r0
	bge _080E1B00
	ldr r0, _080E1B0C @ =gSprites
	mov r12, r0
	adds r5, r4, 0
	adds r5, 0x8
	movs r6, 0
_080E1ADC:
	adds r0, r2, 0
	adds r0, 0x9
	lsls r0, 1
	adds r0, r5, r0
	movs r7, 0
	ldrsh r1, [r0, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r12
	strh r6, [r0, 0x24]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	cmp r2, r0
	blt _080E1ADC
_080E1B00:
	adds r0, r3, 0
	bl DestroyAnimVisualTask
_080E1B06:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E1B0C: .4byte gSprites
	thumb_func_end sub_80E1A2C

	thumb_func_start sub_80E1B10
sub_80E1B10: @ 80E1B10
	push {r4-r7,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0xC]
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	bne _080E1B38
	movs r0, 0x24
	ldrsh r1, [r3, r0]
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	ldrh r2, [r3, 0x24]
	adds r0, r4, 0
	ands r0, r2
	adds r1, r0
	lsls r1, 16
	lsrs r4, r1, 16
	b _080E1B48
_080E1B38:
	movs r1, 0x24
	ldrsh r0, [r3, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	negs r0, r0
	lsls r0, 16
	lsrs r4, r0, 16
_080E1B48:
	movs r2, 0
	movs r7, 0x22
	ldrsh r0, [r3, r7]
	cmp r2, r0
	bge _080E1B7C
	ldr r6, _080E1B84 @ =gSprites
	adds r5, r3, 0
	adds r5, 0x8
_080E1B58:
	adds r0, r2, 0
	adds r0, 0x9
	lsls r0, 1
	adds r0, r5, r0
	movs r7, 0
	ldrsh r1, [r0, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r4, [r0, 0x24]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0x22
	ldrsh r0, [r3, r1]
	cmp r2, r0
	blt _080E1B58
_080E1B7C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E1B84: .4byte gSprites
	thumb_func_end sub_80E1B10

	thumb_func_start sub_80E1B88
sub_80E1B88: @ 80E1B88
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r3, _080E1BA8 @ =gBattleAnimArgs
	movs r2, 0
	ldr r0, _080E1BAC @ =gAnimMovePower
	ldrh r0, [r0]
	cmp r0, 0x63
	bls _080E1B9C
	movs r2, 0x1
_080E1B9C:
	strh r2, [r3, 0x1E]
	adds r0, r1, 0
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080E1BA8: .4byte gBattleAnimArgs
_080E1BAC: .4byte gAnimMovePower
	thumb_func_end sub_80E1B88

	thumb_func_start sub_80E1BB0
sub_80E1BB0: @ 80E1BB0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, _080E1BC8 @ =gBattleAnimArgs
	ldrh r1, [r2]
	movs r0, 0x1
	ands r0, r1
	adds r6, r2, 0
	cmp r0, 0
	beq _080E1BD0
	ldr r0, _080E1BCC @ =gAnimBankTarget
	b _080E1BD2
	.align 2, 0
_080E1BC8: .4byte gBattleAnimArgs
_080E1BCC: .4byte gAnimBankTarget
_080E1BD0:
	ldr r0, _080E1C40 @ =gAnimBankAttacker
_080E1BD2:
	ldrb r0, [r0]
	adds r5, r0, 0
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0x1
	ble _080E1BE2
	movs r0, 0x2
	eors r5, r0
_080E1BE2:
	ldr r0, _080E1C44 @ =sub_80E1C58
	ldrb r1, [r6, 0x2]
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080E1C48 @ =gTasks
	adds r4, r0
	adds r0, r5, 0
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x20
	subs r1, r0
	ldr r2, _080E1C4C @ =0x000001ff
	adds r0, r2, 0
	ands r1, r0
	strh r1, [r4, 0xA]
	adds r0, r5, 0
	movs r1, 0x3
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x40
	subs r1, r0
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r4, 0xC]
	ldr r2, _080E1C50 @ =gBattle_BG3_X
	ldrh r0, [r4, 0xA]
	strh r0, [r2]
	ldr r0, _080E1C54 @ =gBattle_BG3_Y
	strh r1, [r0]
	ldrh r0, [r6, 0x4]
	strh r0, [r4, 0xE]
	adds r0, r7, 0
	bl DestroyAnimVisualTask
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E1C40: .4byte gAnimBankAttacker
_080E1C44: .4byte sub_80E1C58
_080E1C48: .4byte gTasks
_080E1C4C: .4byte 0x000001ff
_080E1C50: .4byte gBattle_BG3_X
_080E1C54: .4byte gBattle_BG3_Y
	thumb_func_end sub_80E1BB0

	thumb_func_start sub_80E1C58
sub_80E1C58: @ 80E1C58
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	ldr r1, _080E1C88 @ =gTasks
	adds r2, r0, r1
	ldr r0, _080E1C8C @ =gBattleAnimArgs
	movs r4, 0xE
	ldrsh r1, [r0, r4]
	movs r4, 0xE
	ldrsh r0, [r2, r4]
	cmp r1, r0
	bne _080E1C98
	ldr r0, _080E1C90 @ =gBattle_BG3_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080E1C94 @ =gBattle_BG3_Y
	strh r1, [r0]
	adds r0, r3, 0
	bl DestroyTask
	b _080E1CA4
	.align 2, 0
_080E1C88: .4byte gTasks
_080E1C8C: .4byte gBattleAnimArgs
_080E1C90: .4byte gBattle_BG3_X
_080E1C94: .4byte gBattle_BG3_Y
_080E1C98:
	ldr r1, _080E1CAC @ =gBattle_BG3_X
	ldrh r0, [r2, 0xA]
	strh r0, [r1]
	ldr r1, _080E1CB0 @ =gBattle_BG3_Y
	ldrh r0, [r2, 0xC]
	strh r0, [r1]
_080E1CA4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E1CAC: .4byte gBattle_BG3_X
_080E1CB0: .4byte gBattle_BG3_Y
	thumb_func_end sub_80E1C58
	
	.align 2, 0 @ Don't pad with nop.
