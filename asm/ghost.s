	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	@ ghost

	thumb_func_start sub_80DDE7C
sub_80DDE7C: @ 80DDE7C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080DDEC4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r3, r1, r2
	ldrh r0, [r3, 0x1C]
	adds r0, 0x1
	strh r0, [r3, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080DDEBE
	movs r0, 0
	strh r0, [r3, 0x1C]
	ldrh r1, [r3, 0xC]
	adds r1, 0x1
	strh r1, [r3, 0xC]
	ldrh r0, [r3, 0xE]
	subs r0, 0x1
	strh r0, [r3, 0xE]
	ldr r2, _080DDEC8 @ =REG_BLDALPHA
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r1, 0xC
	ldrsh r0, [r3, r1]
	cmp r0, 0x9
	bne _080DDEBE
	ldr r0, _080DDECC @ =sub_80DDED0
	str r0, [r3]
_080DDEBE:
	pop {r0}
	bx r0
	.align 2, 0
_080DDEC4: .4byte gTasks
_080DDEC8: .4byte REG_BLDALPHA
_080DDECC: .4byte sub_80DDED0
	thumb_func_end sub_80DDE7C

	thumb_func_start sub_80DDED0
sub_80DDED0: @ 80DDED0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _080DDEF4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080DDEF8
	subs r0, r1, 0x1
	strh r0, [r4, 0xA]
	b _080DDF36
	.align 2, 0
_080DDEF4: .4byte gTasks
_080DDEF8:
	movs r0, 0
	bl GetAnimBattlerSpriteId
	lsls r0, 24
	lsrs r1, r0, 24
	ldrh r0, [r4, 0x8]
	adds r0, 0x8
	movs r6, 0
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xFF
	bgt _080DDF22
	movs r0, 0x8
	ldrsh r2, [r4, r0]
	adds r0, r1, 0
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	b _080DDF36
_080DDF22:
	adds r0, r1, 0
	bl sub_8078F40
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	ldr r0, _080DDF3C @ =REG_BLDCNT
	strh r6, [r0]
	adds r0, 0x2
	strh r6, [r0]
_080DDF36:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DDF3C: .4byte REG_BLDCNT
	thumb_func_end sub_80DDED0

	thumb_func_start sub_80DDF40
sub_80DDF40: @ 80DDF40
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r5, [r4, 0x20]
	ldrh r6, [r4, 0x22]
	ldr r0, _080DDFDC @ =gAnimBankAttacker
	mov r8, r0
	ldrb r0, [r0]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	mov r9, r1
	strh r0, [r4, 0x20]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	mov r1, r9
	strh r1, [r4, 0x2E]
	ldr r2, _080DDFE0 @ =gBattleAnimArgs
	ldrh r1, [r2]
	strh r1, [r4, 0x30]
	ldrh r1, [r2, 0x2]
	strh r1, [r4, 0x32]
	ldrh r1, [r2, 0x4]
	strh r1, [r4, 0x34]
	ldrh r1, [r4, 0x20]
	lsls r1, 4
	strh r1, [r4, 0x36]
	lsls r0, 4
	strh r0, [r4, 0x38]
	lsls r5, 16
	asrs r5, 16
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	subs r5, r0
	lsls r5, 4
	movs r0, 0
	ldrsh r1, [r2, r0]
	lsls r1, 1
	adds r0, r5, 0
	str r2, [sp]
	bl __divsi3
	strh r0, [r4, 0x3A]
	lsls r6, 16
	asrs r6, 16
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	subs r6, r0
	lsls r6, 4
	ldr r2, [sp]
	movs r0, 0
	ldrsh r1, [r2, r0]
	lsls r1, 1
	adds r0, r6, 0
	bl __divsi3
	strh r0, [r4, 0x3C]
	ldr r0, _080DDFE4 @ =sub_80DDFE8
	str r0, [r4, 0x1C]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DDFDC: .4byte gAnimBankAttacker
_080DDFE0: .4byte gBattleAnimArgs
_080DDFE4: .4byte sub_80DDFE8
	thumb_func_end sub_80DDF40

	thumb_func_start sub_80DDFE8
sub_80DDFE8: @ 80DDFE8
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080DE032
	cmp r0, 0x1
	bgt _080DDFFE
	cmp r0, 0
	beq _080DE008
	b _080DE0F6
_080DDFFE:
	cmp r0, 0x2
	beq _080DE09C
	cmp r0, 0x3
	beq _080DE0F0
	b _080DE0F6
_080DE008:
	ldrh r0, [r5, 0x3A]
	ldrh r2, [r5, 0x36]
	adds r0, r2
	strh r0, [r5, 0x36]
	ldrh r1, [r5, 0x3C]
	ldrh r2, [r5, 0x38]
	adds r1, r2
	strh r1, [r5, 0x38]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r5, 0x20]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r5, 0x22]
	ldrh r0, [r5, 0x30]
	subs r0, 0x1
	strh r0, [r5, 0x30]
	lsls r0, 16
	cmp r0, 0
	bgt _080DE0F6
	b _080DE0E2
_080DE032:
	ldrh r0, [r5, 0x32]
	subs r0, 0x1
	strh r0, [r5, 0x32]
	lsls r0, 16
	cmp r0, 0
	bgt _080DE0F6
	ldr r4, _080DE098 @ =gAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x30]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x20]
	lsls r0, 4
	strh r0, [r5, 0x36]
	ldrh r0, [r5, 0x22]
	lsls r0, 4
	strh r0, [r5, 0x38]
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	movs r2, 0x20
	ldrsh r1, [r5, r2]
	subs r0, r1
	lsls r0, 4
	movs r2, 0x34
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r5, 0x3A]
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	movs r2, 0x22
	ldrsh r1, [r5, r2]
	subs r0, r1
	lsls r0, 4
	movs r2, 0x34
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r5, 0x3C]
	b _080DE0E2
	.align 2, 0
_080DE098: .4byte gAnimBankTarget
_080DE09C:
	ldrh r0, [r5, 0x3A]
	ldrh r1, [r5, 0x36]
	adds r0, r1
	strh r0, [r5, 0x36]
	ldrh r1, [r5, 0x3C]
	ldrh r2, [r5, 0x38]
	adds r1, r2
	strh r1, [r5, 0x38]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r5, 0x20]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r5, 0x22]
	ldrh r0, [r5, 0x34]
	subs r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	cmp r0, 0
	bgt _080DE0F6
	ldr r4, _080DE0EC @ =gAnimBankTarget
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
_080DE0E2:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080DE0F6
	.align 2, 0
_080DE0EC: .4byte gAnimBankTarget
_080DE0F0:
	adds r0, r5, 0
	bl move_anim_8074EE0
_080DE0F6:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80DDFE8

	thumb_func_start sub_80DE0FC
sub_80DE0FC: @ 80DE0FC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8078764
	ldr r0, _080DE110 @ =sub_80DE114
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DE110: .4byte sub_80DE114
	thumb_func_end sub_80DE0FC

	thumb_func_start sub_80DE114
sub_80DE114: @ 80DE114
	push {r4-r6,lr}
	adds r3, r0, 0
	movs r5, 0
	movs r6, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080DE1AA
	adds r1, r3, 0
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x4
	ands r0, r2
	adds r4, r1, 0
	cmp r0, 0
	bne _080DE13E
	movs r0, 0x4
	orrs r0, r2
	strb r0, [r4]
_080DE13E:
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _080DE14E
	cmp r0, 0x1
	beq _080DE158
	movs r6, 0x1
	b _080DE162
_080DE14E:
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	cmp r0, 0x2
	bne _080DE162
	b _080DE166
_080DE158:
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	cmp r0, 0x4
	bne _080DE162
	movs r5, 0x1
_080DE162:
	cmp r5, 0
	beq _080DE198
_080DE166:
	ldrb r2, [r4]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r3, 0x32]
	strh r1, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _080DE1AA
	strh r1, [r3, 0x32]
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	b _080DE1AA
_080DE198:
	cmp r6, 0
	beq _080DE1A4
	adds r0, r3, 0
	bl DestroyAnimSprite
	b _080DE1AA
_080DE1A4:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
_080DE1AA:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80DE114

	thumb_func_start sub_80DE1B0
sub_80DE1B0: @ 80DE1B0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080DE1DC @ =gTasks
	adds r5, r0, r1
	movs r0, 0x1
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	movs r6, 0
	movs r1, 0
	strh r0, [r5, 0x8]
	lsls r0, 16
	cmp r0, 0
	bge _080DE1E0
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	b _080DE2C0
	.align 2, 0
_080DE1DC: .4byte gTasks
_080DE1E0:
	strh r1, [r5, 0xA]
	movs r0, 0xF
	strh r0, [r5, 0xC]
	movs r0, 0x2
	strh r0, [r5, 0xE]
	strh r1, [r5, 0x10]
	ldr r1, _080DE244 @ =REG_BLDCNT
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _080DE248 @ =REG_BLDALPHA
	ldrh r0, [r5, 0xE]
	lsls r0, 8
	ldrh r1, [r5, 0xC]
	orrs r0, r1
	strh r0, [r2]
	ldr r4, _080DE24C @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x50
	strh r1, [r0, 0x2E]
	ldr r0, _080DE250 @ =gAnimBankTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080DE258
	movs r2, 0x8
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _080DE254 @ =0x0000ff70
	strh r1, [r0, 0x30]
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x70
	b _080DE276
	.align 2, 0
_080DE244: .4byte REG_BLDCNT
_080DE248: .4byte REG_BLDALPHA
_080DE24C: .4byte gSprites
_080DE250: .4byte gAnimBankTarget
_080DE254: .4byte 0x0000ff70
_080DE258:
	movs r2, 0x8
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x90
	strh r1, [r0, 0x30]
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _080DE2C8 @ =0x0000ff90
_080DE276:
	strh r1, [r0, 0x32]
	ldr r4, _080DE2CC @ =gSprites
	movs r2, 0x8
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r2, 0
	strh r2, [r0, 0x34]
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r2, [r0, 0x36]
	movs r2, 0x8
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _080DE2D0 @ =SpriteCallbackDummy
	bl StoreSpriteCallbackInData
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _080DE2D4 @ =sub_8078394
	str r1, [r0]
	ldr r0, _080DE2D8 @ =sub_80DE2DC
	str r0, [r5]
_080DE2C0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DE2C8: .4byte 0x0000ff90
_080DE2CC: .4byte gSprites
_080DE2D0: .4byte SpriteCallbackDummy
_080DE2D4: .4byte sub_8078394
_080DE2D8: .4byte sub_80DE2DC
	thumb_func_end sub_80DE1B0

	thumb_func_start sub_80DE2DC
sub_80DE2DC: @ 80DE2DC
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080DE300 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080DE37C
	cmp r0, 0x1
	bgt _080DE304
	cmp r0, 0
	beq _080DE30A
	b _080DE3A6
	.align 2, 0
_080DE300: .4byte gTasks
_080DE304:
	cmp r0, 0x2
	beq _080DE3A0
	b _080DE3A6
_080DE30A:
	ldrh r1, [r4, 0xA]
	adds r1, 0x1
	strh r1, [r4, 0xA]
	movs r0, 0x3
	ands r0, r1
	strh r0, [r4, 0x12]
	cmp r0, 0x1
	bne _080DE328
	ldrh r1, [r4, 0xC]
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080DE328
	subs r0, r1, 0x1
	strh r0, [r4, 0xC]
_080DE328:
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	bne _080DE33E
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080DE33E
	adds r0, r1, 0x1
	strh r0, [r4, 0xE]
_080DE33E:
	ldr r2, _080DE374 @ =REG_BLDALPHA
	ldrh r0, [r4, 0xE]
	lsls r0, 8
	ldrh r1, [r4, 0xC]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, [r4, 0xC]
	movs r0, 0x80
	lsls r0, 13
	cmp r1, r0
	bne _080DE3A6
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x50
	ble _080DE3A6
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080DE378 @ =gSprites
	adds r0, r1
	bl obj_delete_but_dont_free_vram
	movs r0, 0x1
	strh r0, [r4, 0x10]
	b _080DE3A6
	.align 2, 0
_080DE374: .4byte REG_BLDALPHA
_080DE378: .4byte gSprites
_080DE37C:
	ldrh r0, [r4, 0x14]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x14]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080DE3A6
	ldr r0, _080DE39C @ =REG_BLDCNT
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	b _080DE3A6
	.align 2, 0
_080DE39C: .4byte REG_BLDCNT
_080DE3A0:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080DE3A6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DE2DC

	thumb_func_start sub_80DE3AC
sub_80DE3AC: @ 80DE3AC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r2, _080DE3CC @ =gTasks
	adds r1, r2
	movs r2, 0
	strh r2, [r1, 0x26]
	ldr r2, _080DE3D0 @ =sub_80DE3D4
	str r2, [r1]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_080DE3CC: .4byte gTasks
_080DE3D0: .4byte sub_80DE3D4
	thumb_func_end sub_80DE3AC

	thumb_func_start sub_80DE3D4
sub_80DE3D4: @ 80DE3D4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080DE40C @ =gTasks
	adds r5, r0, r1
	ldr r0, _080DE410 @ =gAnimBankTarget
	ldrb r0, [r0]
	bl GetBattlerPosition_permutated
	lsls r0, 24
	lsrs r6, r0, 24
	movs r1, 0x26
	ldrsh r0, [r5, r1]
	cmp r0, 0x4
	bls _080DE400
	b _080DE604
_080DE400:
	lsls r0, 2
	ldr r1, _080DE414 @ =_080DE418
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DE40C: .4byte gTasks
_080DE410: .4byte gAnimBankTarget
_080DE414: .4byte _080DE418
	.align 2, 0
_080DE418:
	.4byte _080DE42C
	.4byte _080DE500
	.4byte _080DE544
	.4byte _080DE5AC
	.4byte _080DE5E0
_080DE42C:
	ldr r7, _080DE460 @ =0x00002771
	adds r0, r7, 0
	bl AllocSpritePalette
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	mov r8, r2
	strh r0, [r5, 0x24]
	cmp r0, 0xFF
	beq _080DE456
	movs r0, 0x1
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	strh r0, [r5, 0x8]
	lsls r0, 16
	cmp r0, 0
	bge _080DE464
	adds r0, r7, 0
	bl FreeSpritePaletteByTag
_080DE456:
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	b _080DE60A
	.align 2, 0
_080DE460: .4byte 0x00002771
_080DE464:
	ldr r4, _080DE4E4 @ =gSprites
	movs r3, 0x8
	ldrsh r0, [r5, r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r2, [r5, 0x24]
	lsls r2, 4
	ldrb r3, [r1, 0x5]
	movs r0, 0xF
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	movs r2, 0x8
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	mov r3, r8
	strh r3, [r5, 0xA]
	strh r3, [r5, 0xC]
	movs r0, 0x10
	strh r0, [r5, 0xE]
	movs r0, 0x1
	bl GetAnimBattlerSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	movs r0, 0x22
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	lsls r0, 4
	strh r0, [r5, 0x10]
	cmp r6, 0x1
	bne _080DE4EC
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _080DE4E8 @ =0x0000fdff
	b _080DE4F4
	.align 2, 0
_080DE4E4: .4byte gSprites
_080DE4E8: .4byte 0x0000fdff
_080DE4EC:
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _080DE4FC @ =0x0000fbff
_080DE4F4:
	ands r0, r1
	strh r0, [r2]
	b _080DE604
	.align 2, 0
_080DE4FC: .4byte 0x0000fbff
_080DE500:
	movs r1, 0x24
	ldrsh r0, [r5, r1]
	adds r0, 0x10
	lsls r0, 4
	strh r0, [r5, 0x24]
	movs r2, 0x10
	ldrsh r0, [r5, r2]
	lsls r0, 1
	ldr r1, _080DE534 @ =gPlttBufferUnfaded
	adds r0, r1
	movs r3, 0x24
	ldrsh r1, [r5, r3]
	lsls r1, 1
	ldr r2, _080DE538 @ =gPlttBufferFaded
	adds r1, r2
	ldr r2, _080DE53C @ =REG_BG0CNT
	bl CpuSet
	ldrh r0, [r5, 0x10]
	ldr r3, _080DE540 @ =0x00003c0d
	movs r1, 0x10
	movs r2, 0xA
	bl BlendPalette
	b _080DE604
	.align 2, 0
_080DE534: .4byte gPlttBufferUnfaded
_080DE538: .4byte gPlttBufferFaded
_080DE53C: .4byte REG_BG0CNT
_080DE540: .4byte 0x00003c0d
_080DE544:
	ldr r2, _080DE580 @ =gSprites
	movs r0, 0x22
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	subs r1, 0x20
	lsls r1, 16
	lsrs r2, r1, 16
	cmp r1, 0
	bge _080DE564
	movs r2, 0
_080DE564:
	cmp r6, 0x1
	bne _080DE584
	lsls r0, r2, 24
	lsrs r0, 24
	adds r1, r2, 0
	adds r1, 0x40
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	str r2, [sp]
	movs r2, 0x4
	str r2, [sp, 0x4]
	str r6, [sp, 0x8]
	b _080DE59C
	.align 2, 0
_080DE580: .4byte gSprites
_080DE584:
	lsls r0, r2, 24
	lsrs r0, 24
	adds r1, r2, 0
	adds r1, 0x40
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	str r2, [sp]
	movs r2, 0x8
	str r2, [sp, 0x4]
	movs r2, 0x1
	str r2, [sp, 0x8]
_080DE59C:
	movs r2, 0x2
	movs r3, 0x6
	bl ScanlineEffect_InitWave
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x1C]
	b _080DE604
_080DE5AC:
	cmp r6, 0x1
	bne _080DE5C0
	ldr r1, _080DE5B8 @ =REG_BLDCNT
	ldr r2, _080DE5BC @ =0x00003f42
	adds r0, r2, 0
	b _080DE5C6
	.align 2, 0
_080DE5B8: .4byte REG_BLDCNT
_080DE5BC: .4byte 0x00003f42
_080DE5C0:
	ldr r1, _080DE5D4 @ =REG_BLDCNT
	ldr r3, _080DE5D8 @ =0x00003f44
	adds r0, r3, 0
_080DE5C6:
	strh r0, [r1]
	ldr r1, _080DE5DC @ =REG_BLDALPHA
	movs r2, 0x80
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	b _080DE604
	.align 2, 0
_080DE5D4: .4byte REG_BLDCNT
_080DE5D8: .4byte 0x00003f44
_080DE5DC: .4byte REG_BLDALPHA
_080DE5E0:
	cmp r6, 0x1
	bne _080DE5F0
	movs r0, 0x80
	lsls r0, 19
	ldrh r1, [r0]
	movs r3, 0x80
	lsls r3, 2
	b _080DE5FA
_080DE5F0:
	movs r0, 0x80
	lsls r0, 19
	ldrh r1, [r0]
	movs r3, 0x80
	lsls r3, 3
_080DE5FA:
	adds r2, r3, 0
	orrs r1, r2
	strh r1, [r0]
	ldr r0, _080DE618 @ =sub_80DE61C
	str r0, [r5]
_080DE604:
	ldrh r0, [r5, 0x26]
	adds r0, 0x1
	strh r0, [r5, 0x26]
_080DE60A:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DE618: .4byte sub_80DE61C
	thumb_func_end sub_80DE3D4

	thumb_func_start sub_80DE61C
sub_80DE61C: @ 80DE61C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080DE6A0 @ =gTasks
	adds r4, r0, r1
	ldrh r1, [r4, 0xA]
	adds r1, 0x1
	strh r1, [r4, 0xA]
	movs r0, 0x1
	ands r0, r1
	strh r0, [r4, 0x12]
	cmp r0, 0
	bne _080DE654
	ldr r1, _080DE6A4 @ =gSineTable
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r1, 0x12
	bl __divsi3
	strh r0, [r4, 0xC]
_080DE654:
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	cmp r0, 0x1
	bne _080DE676
	ldr r1, _080DE6A4 @ =gSineTable
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r1, 0x12
	bl __divsi3
	movs r1, 0x10
	subs r1, r0
	strh r1, [r4, 0xE]
_080DE676:
	ldr r2, _080DE6A8 @ =REG_BLDALPHA
	ldrh r0, [r4, 0xE]
	lsls r0, 8
	ldrh r1, [r4, 0xC]
	orrs r0, r1
	strh r0, [r2]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0x80
	bne _080DE698
	movs r0, 0
	strh r0, [r4, 0x26]
	ldr r1, _080DE6AC @ =sub_80DE6B0
	str r1, [r4]
	adds r0, r5, 0
	bl _call_via_r1
_080DE698:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DE6A0: .4byte gTasks
_080DE6A4: .4byte gSineTable
_080DE6A8: .4byte REG_BLDALPHA
_080DE6AC: .4byte sub_80DE6B0
	thumb_func_end sub_80DE61C

	thumb_func_start sub_80DE6B0
sub_80DE6B0: @ 80DE6B0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080DE6E0 @ =gTasks
	adds r4, r0, r1
	ldr r0, _080DE6E4 @ =gAnimBankTarget
	ldrb r0, [r0]
	bl GetBattlerPosition_permutated
	lsls r0, 24
	lsrs r6, r0, 24
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080DE72C
	cmp r0, 0x1
	bgt _080DE6E8
	cmp r0, 0
	beq _080DE6EE
	b _080DE7AA
	.align 2, 0
_080DE6E0: .4byte gTasks
_080DE6E4: .4byte gAnimBankTarget
_080DE6E8:
	cmp r0, 0x2
	beq _080DE740
	b _080DE7AA
_080DE6EE:
	ldr r1, _080DE710 @ =gScanlineEffect
	movs r0, 0x3
	strb r0, [r1, 0x15]
	movs r0, 0x1
	bl GetAnimBattlerSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x24]
	cmp r6, 0x1
	bne _080DE718
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _080DE714 @ =0x0000fdff
	b _080DE720
	.align 2, 0
_080DE710: .4byte gScanlineEffect
_080DE714: .4byte 0x0000fdff
_080DE718:
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _080DE728 @ =0x0000fbff
_080DE720:
	ands r0, r1
	strh r0, [r2]
	b _080DE7AA
	.align 2, 0
_080DE728: .4byte 0x0000fbff
_080DE72C:
	ldrh r0, [r4, 0x10]
	ldr r3, _080DE73C @ =0x00003c0d
	movs r1, 0x10
	movs r2, 0
	bl BlendPalette
	b _080DE7AA
	.align 2, 0
_080DE73C: .4byte 0x00003c0d
_080DE740:
	ldr r3, _080DE788 @ =gSprites
	movs r0, 0x24
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	bl obj_delete_but_dont_free_vram
	ldr r0, _080DE78C @ =0x00002771
	bl FreeSpritePaletteByTag
	ldr r0, _080DE790 @ =REG_BLDCNT
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	cmp r6, 0x1
	bne _080DE794
	subs r0, 0x52
	ldrh r1, [r0]
	movs r3, 0x80
	lsls r3, 2
	b _080DE79E
	.align 2, 0
_080DE788: .4byte gSprites
_080DE78C: .4byte 0x00002771
_080DE790: .4byte REG_BLDCNT
_080DE794:
	movs r0, 0x80
	lsls r0, 19
	ldrh r1, [r0]
	movs r3, 0x80
	lsls r3, 3
_080DE79E:
	adds r2, r3, 0
	orrs r1, r2
	strh r1, [r0]
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080DE7AA:
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80DE6B0

	thumb_func_start sub_80DE7B8
sub_80DE7B8: @ 80DE7B8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r7, r0, 0
	ldr r0, _080DE7F4 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080DE800
	ldr r4, _080DE7F8 @ =gAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 8
	movs r2, 0xE0
	lsls r2, 13
	adds r0, r2
	lsrs r5, r0, 16
	ldr r4, _080DE7FC @ =gAnimBankTarget
	b _080DE824
	.align 2, 0
_080DE7F4: .4byte gBattleAnimArgs
_080DE7F8: .4byte gAnimBankAttacker
_080DE7FC: .4byte gAnimBankTarget
_080DE800:
	ldr r4, _080DE8C8 @ =gAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 8
	movs r2, 0xE0
	lsls r2, 13
	adds r0, r2
	lsrs r5, r0, 16
	ldr r4, _080DE8CC @ =gAnimBankAttacker
_080DE824:
	ldrb r0, [r4]
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldrb r0, [r4]
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 8
	movs r1, 0xE0
	lsls r1, 13
	adds r0, r1
	lsrs r0, 16
	mov r9, r0
	mov r8, r5
	mov r2, r9
	subs r4, r2, r5
	lsls r4, 16
	lsrs r4, 16
	lsls r0, r6, 4
	strh r0, [r7, 0x2E]
	lsls r0, r5, 4
	strh r0, [r7, 0x30]
	mov r1, r10
	subs r0, r1, r6
	lsls r0, 4
	ldr r5, _080DE8D0 @ =gBattleAnimArgs
	movs r2, 0x2
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r7, 0x32]
	lsls r4, 16
	asrs r4, 12
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	adds r0, r4, 0
	bl __divsi3
	strh r0, [r7, 0x34]
	ldrh r0, [r5, 0x2]
	strh r0, [r7, 0x36]
	mov r1, r10
	strh r1, [r7, 0x38]
	mov r2, r9
	strh r2, [r7, 0x3A]
	movs r1, 0x36
	ldrsh r0, [r7, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r7, 0x3C]
	ldrb r1, [r7, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r7, 0x5]
	strh r6, [r7, 0x20]
	mov r2, r8
	strh r2, [r7, 0x22]
	ldr r0, _080DE8D4 @ =sub_80DE8D8
	str r0, [r7, 0x1C]
	adds r2, r7, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DE8C8: .4byte gAnimBankTarget
_080DE8CC: .4byte gAnimBankAttacker
_080DE8D0: .4byte gBattleAnimArgs
_080DE8D4: .4byte sub_80DE8D8
	thumb_func_end sub_80DE7B8

	thumb_func_start sub_80DE8D8
sub_80DE8D8: @ 80DE8D8
	push {r4,lr}
	adds r2, r0, 0
	ldrh r3, [r2, 0x36]
	movs r1, 0x36
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _080DE910
	ldrh r0, [r2, 0x32]
	ldrh r4, [r2, 0x2E]
	adds r0, r4
	strh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x34]
	ldrh r4, [r2, 0x30]
	adds r1, r4
	strh r1, [r2, 0x30]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r2, 0x20]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r2, 0x22]
	subs r0, r3, 0x1
	strh r0, [r2, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bne _080DE910
	strh r0, [r2, 0x2E]
_080DE910:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DE8D8

	thumb_func_start sub_80DE918
sub_80DE918: @ 80DE918
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080DEA68 @ =gTasks
	adds r1, r0
	str r1, [sp]
	ldr r1, _080DEA6C @ =REG_BLDCNT
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r3, 0x80
	lsls r3, 5
	adds r0, r3, 0
	strh r0, [r1]
	movs r0, 0
	ldr r1, [sp]
	strh r0, [r1, 0x12]
	strh r0, [r1, 0x14]
	strh r0, [r1, 0x16]
	strh r0, [r1, 0x18]
	movs r0, 0x10
	strh r0, [r1, 0x1A]
	ldr r2, _080DEA70 @ =gBattleAnimArgs
	ldrh r0, [r2]
	strh r0, [r1, 0x1C]
	ldr r4, _080DEA74 @ =gAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_807A100
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _080DE988
	b _080DEA88
_080DE988:
	movs r4, 0
_080DE98A:
	lsls r1, r4, 16
	asrs r3, r1, 16
	ldr r0, _080DEA74 @ =gAnimBankAttacker
	ldrb r2, [r0]
	str r1, [sp, 0x10]
	cmp r3, r2
	beq _080DEA56
	movs r0, 0x2
	eors r2, r0
	cmp r3, r2
	beq _080DEA56
	lsls r0, r4, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080DEA56
	ldr r6, [sp, 0x4]
	ldr r3, [sp, 0x8]
	lsls r0, r3, 16
	asrs r7, r0, 16
	ldr r0, _080DEA78 @ =gSpriteTemplate_83DAF08
	adds r1, r6, 0
	adds r2, r7, 0
	movs r3, 0x37
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x40
	beq _080DEA56
	adds r0, r4, 0
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	adds r0, r4, 0
	movs r1, 0x3
	bl sub_807A100
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	mov r0, r8
	lsls r5, r0, 4
	add r5, r8
	lsls r5, 2
	ldr r1, _080DEA7C @ =gSprites
	adds r4, r5, r1
	lsls r0, r6, 4
	strh r0, [r4, 0x2E]
	lsls r0, r7, 4
	strh r0, [r4, 0x30]
	mov r2, r10
	subs r0, r2, r6
	lsls r0, 4
	ldr r3, _080DEA70 @ =gBattleAnimArgs
	movs r2, 0x2
	ldrsh r1, [r3, r2]
	bl __divsi3
	strh r0, [r4, 0x32]
	mov r3, r9
	lsls r0, r3, 16
	asrs r0, 16
	subs r0, r7
	lsls r0, 4
	ldr r2, _080DEA70 @ =gBattleAnimArgs
	movs r3, 0x2
	ldrsh r1, [r2, r3]
	bl __divsi3
	strh r0, [r4, 0x34]
	ldr r1, _080DEA70 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x36]
	mov r2, r10
	strh r2, [r4, 0x38]
	mov r3, r9
	strh r3, [r4, 0x3A]
	ldr r0, _080DEA80 @ =gSprites + 0x1C
	adds r5, r0
	ldr r0, _080DEA84 @ =sub_80DE8D8
	str r0, [r5]
	ldr r2, [sp]
	movs r3, 0x20
	ldrsh r1, [r2, r3]
	adds r1, 0xD
	lsls r1, 1
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1
	mov r1, r8
	strh r1, [r0]
	ldrh r0, [r2, 0x20]
	adds r0, 0x1
	strh r0, [r2, 0x20]
_080DEA56:
	ldr r2, [sp, 0x10]
	movs r3, 0x80
	lsls r3, 9
	adds r0, r2, r3
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080DE98A
	b _080DEB0C
	.align 2, 0
_080DEA68: .4byte gTasks
_080DEA6C: .4byte REG_BLDCNT
_080DEA70: .4byte gBattleAnimArgs
_080DEA74: .4byte gAnimBankAttacker
_080DEA78: .4byte gSpriteTemplate_83DAF08
_080DEA7C: .4byte gSprites
_080DEA80: .4byte gSprites + 0x1C
_080DEA84: .4byte sub_80DE8D8
_080DEA88:
	ldr r0, _080DEB24 @ =gSpriteTemplate_83DAF08
	ldr r7, [sp, 0x4]
	ldr r2, [sp, 0x8]
	lsls r1, r2, 16
	asrs r1, 16
	str r1, [sp, 0xC]
	adds r1, r7, 0
	ldr r2, [sp, 0xC]
	movs r3, 0x37
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x40
	beq _080DEB0C
	movs r3, 0x30
	mov r10, r3
	movs r0, 0x28
	mov r9, r0
	ldr r6, _080DEB28 @ =gSprites
	mov r1, r8
	lsls r5, r1, 4
	add r5, r8
	lsls r5, 2
	adds r4, r5, r6
	lsls r0, r7, 4
	strh r0, [r4, 0x2E]
	ldr r2, [sp, 0xC]
	lsls r0, r2, 4
	strh r0, [r4, 0x30]
	subs r0, r3, r7
	lsls r0, 4
	ldr r3, _080DEB2C @ =gBattleAnimArgs
	movs r2, 0x2
	ldrsh r1, [r3, r2]
	bl __divsi3
	strh r0, [r4, 0x32]
	mov r3, r9
	ldr r1, [sp, 0xC]
	subs r0, r3, r1
	lsls r0, 4
	ldr r2, _080DEB2C @ =gBattleAnimArgs
	movs r3, 0x2
	ldrsh r1, [r2, r3]
	bl __divsi3
	strh r0, [r4, 0x34]
	ldr r1, _080DEB2C @ =gBattleAnimArgs
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x36]
	mov r2, r10
	strh r2, [r4, 0x38]
	mov r3, r9
	strh r3, [r4, 0x3A]
	adds r6, 0x1C
	adds r5, r6
	ldr r0, _080DEB30 @ =sub_80DE8D8
	str r0, [r5]
	mov r1, r8
	ldr r0, [sp]
	strh r1, [r0, 0x22]
	movs r0, 0x1
	ldr r2, [sp]
	strh r0, [r2, 0x20]
_080DEB0C:
	ldr r0, _080DEB34 @ =sub_80DEB38
	ldr r3, [sp]
	str r0, [r3]
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DEB24: .4byte gSpriteTemplate_83DAF08
_080DEB28: .4byte gSprites
_080DEB2C: .4byte gBattleAnimArgs
_080DEB30: .4byte sub_80DE8D8
_080DEB34: .4byte sub_80DEB38
	thumb_func_end sub_80DE918

	thumb_func_start sub_80DEB38
sub_80DEB38: @ 80DEB38
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080DEB5C @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	cmp r1, 0x1
	beq _080DEBEE
	cmp r1, 0x1
	bgt _080DEB60
	cmp r1, 0
	beq _080DEB6E
	b _080DECA4
	.align 2, 0
_080DEB5C: .4byte gTasks
_080DEB60:
	cmp r1, 0x2
	bne _080DEB66
	b _080DEC80
_080DEB66:
	cmp r1, 0x3
	bne _080DEB6C
	b _080DEC94
_080DEB6C:
	b _080DECA4
_080DEB6E:
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080DEBCE
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080DEBCE
	strh r1, [r4, 0x12]
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080DEBA4
	ldrh r1, [r4, 0x18]
	movs r2, 0x18
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080DEBB2
	adds r0, r1, 0x1
	strh r0, [r4, 0x18]
	b _080DEBB2
_080DEBA4:
	ldrh r1, [r4, 0x1A]
	movs r2, 0x1A
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080DEBB2
	subs r0, r1, 0x1
	strh r0, [r4, 0x1A]
_080DEBB2:
	ldr r2, _080DEBE0 @ =REG_BLDALPHA
	ldrh r0, [r4, 0x1A]
	lsls r0, 8
	ldrh r1, [r4, 0x18]
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	cmp r0, 0x17
	ble _080DEBCE
	movs r0, 0
	strh r0, [r4, 0x16]
	movs r0, 0x1
	strh r0, [r4, 0x14]
_080DEBCE:
	ldrh r1, [r4, 0x1C]
	movs r2, 0x1C
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080DEBE4
	subs r0, r1, 0x1
	strh r0, [r4, 0x1C]
	b _080DECA4
	.align 2, 0
_080DEBE0: .4byte REG_BLDALPHA
_080DEBE4:
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080DECA4
	b _080DEC8C
_080DEBEE:
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080DECA4
	movs r0, 0
	strh r0, [r4, 0x12]
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
	ands r0, r1
	lsls r0, 16
	cmp r0, 0
	beq _080DEC1E
	ldrh r1, [r4, 0x18]
	movs r2, 0x18
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080DEC2C
	subs r0, r1, 0x1
	strh r0, [r4, 0x18]
	b _080DEC2C
_080DEC1E:
	ldrh r1, [r4, 0x1A]
	movs r2, 0x1A
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080DEC2C
	adds r0, r1, 0x1
	strh r0, [r4, 0x1A]
_080DEC2C:
	ldr r2, _080DEC48 @ =REG_BLDALPHA
	ldrh r0, [r4, 0x1A]
	lsls r0, 8
	ldrh r1, [r4, 0x18]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, [r4, 0x18]
	movs r0, 0x80
	lsls r0, 13
	cmp r1, r0
	bne _080DECA4
	movs r5, 0
	b _080DEC70
	.align 2, 0
_080DEC48: .4byte REG_BLDALPHA
_080DEC4C:
	adds r1, r5, 0
	adds r1, 0xD
	lsls r1, 1
	adds r0, r4, 0
	adds r0, 0x8
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r0, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080DEC7C @ =gSprites
	adds r0, r1
	bl DestroySprite
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_080DEC70:
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	cmp r5, r0
	blt _080DEC4C
	b _080DEC8C
	.align 2, 0
_080DEC7C: .4byte gSprites
_080DEC80:
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	cmp r0, 0
	ble _080DECA4
_080DEC8C:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080DECA4
_080DEC94:
	ldr r0, _080DECAC @ =REG_BLDCNT
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080DECA4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DECAC: .4byte REG_BLDCNT
	thumb_func_end sub_80DEB38

	thumb_func_start sub_80DECB0
sub_80DECB0: @ 80DECB0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _080DECF8 @ =gBattle_WIN0H
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080DECFC @ =gBattle_WIN0V
	strh r1, [r0]
	ldr r1, _080DED00 @ =REG_WININ
	ldr r2, _080DED04 @ =0x00003f3f
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	subs r2, 0x20
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x6
	movs r0, 0xC8
	strh r0, [r1]
	adds r1, 0x4
	movs r0, 0x10
	strh r0, [r1]
	ldr r0, _080DED08 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080DECF4
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _080DED0C
_080DECF4:
	movs r6, 0x28
	b _080DED0E
	.align 2, 0
_080DECF8: .4byte gBattle_WIN0H
_080DECFC: .4byte gBattle_WIN0V
_080DED00: .4byte REG_WININ
_080DED04: .4byte 0x00003f3f
_080DED08: .4byte gAnimBankAttacker
_080DED0C:
	movs r6, 0xC8
_080DED0E:
	ldr r1, _080DED4C @ =gBattle_WIN0H
	lsls r3, r6, 16
	asrs r2, r3, 16
	lsls r0, r2, 8
	orrs r0, r2
	strh r0, [r1]
	ldr r1, _080DED50 @ =gBattle_WIN0V
	movs r5, 0x28
	ldr r0, _080DED54 @ =0x00002828
	strh r0, [r1]
	lsrs r3, 16
	movs r1, 0xF0
	subs r1, r2
	movs r4, 0x48
	ldr r2, _080DED58 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r2
	strh r3, [r0, 0xA]
	strh r1, [r0, 0xC]
	strh r5, [r0, 0xE]
	strh r4, [r0, 0x10]
	strh r6, [r0, 0x12]
	strh r5, [r0, 0x14]
	ldr r1, _080DED5C @ =sub_80DED60
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DED4C: .4byte gBattle_WIN0H
_080DED50: .4byte gBattle_WIN0V
_080DED54: .4byte 0x00002828
_080DED58: .4byte gTasks
_080DED5C: .4byte sub_80DED60
	thumb_func_end sub_80DECB0

	thumb_func_start sub_80DED60
sub_80DED60: @ 80DED60
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080DEE80 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r1, [r4, 0x8]
	adds r0, r1, 0x1
	strh r0, [r4, 0x8]
	ldrh r5, [r4, 0xA]
	ldrh r7, [r4, 0xC]
	ldrh r0, [r4, 0xE]
	mov r10, r0
	ldrh r2, [r4, 0x10]
	str r2, [sp, 0xC]
	ldrh r0, [r4, 0x12]
	ldrh r2, [r4, 0x14]
	mov r8, r2
	lsls r1, 16
	asrs r6, r1, 16
	cmp r6, 0xF
	ble _080DED9C
	b _080DEE8C
_080DED9C:
	lsls r0, 16
	asrs r0, 16
	bl __floatsidf
	str r0, [sp, 0x10]
	str r1, [sp, 0x14]
	lsls r0, r5, 16
	asrs r0, 16
	bl __floatsidf
	ldr r2, _080DEE84 @ =0x3fb00000
	ldr r3, _080DEE88 @ =0x00000000
	bl __muldf3
	adds r5, r1, 0
	adds r4, r0, 0
	adds r0, r6, 0
	bl __floatsidf
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	adds r1, r5, 0
	adds r0, r4, 0
	ldr r2, [sp, 0x18]
	ldr r3, [sp, 0x1C]
	bl __muldf3
	adds r3, r1, 0
	adds r2, r0, 0
	ldr r0, [sp, 0x10]
	ldr r1, [sp, 0x14]
	bl __subdf3
	bl __fixunsdfsi
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	lsls r0, r7, 16
	asrs r0, 16
	bl __floatsidf
	ldr r2, _080DEE84 @ =0x3fb00000
	ldr r3, _080DEE88 @ =0x00000000
	bl __muldf3
	ldr r2, [sp, 0x18]
	ldr r3, [sp, 0x1C]
	bl __muldf3
	adds r3, r1, 0
	adds r2, r0, 0
	ldr r0, [sp, 0x10]
	ldr r1, [sp, 0x14]
	bl __adddf3
	bl __fixunsdfsi
	lsls r0, 16
	lsrs r7, r0, 16
	mov r1, r8
	lsls r0, r1, 16
	asrs r0, 16
	bl __floatsidf
	adds r5, r1, 0
	adds r4, r0, 0
	mov r2, r10
	lsls r0, r2, 16
	asrs r0, 16
	bl __floatsidf
	ldr r2, _080DEE84 @ =0x3fb00000
	ldr r3, _080DEE88 @ =0x00000000
	bl __muldf3
	ldr r2, [sp, 0x18]
	ldr r3, [sp, 0x1C]
	bl __muldf3
	adds r3, r1, 0
	adds r2, r0, 0
	adds r1, r5, 0
	adds r0, r4, 0
	bl __subdf3
	bl __fixunsdfsi
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r1, [sp, 0xC]
	lsls r0, r1, 16
	asrs r0, 16
	bl __floatsidf
	ldr r2, _080DEE84 @ =0x3fb00000
	ldr r3, _080DEE88 @ =0x00000000
	bl __muldf3
	ldr r2, [sp, 0x18]
	ldr r3, [sp, 0x1C]
	bl __muldf3
	adds r3, r1, 0
	adds r2, r0, 0
	adds r1, r5, 0
	adds r0, r4, 0
	bl __adddf3
	bl __fixunsdfsi
	lsls r0, 16
	lsrs r5, r0, 16
	b _080DEEBA
	.align 2, 0
_080DEE80: .4byte gTasks
_080DEE84: .4byte 0x3fb00000
_080DEE88: .4byte 0x00000000
_080DEE8C:
	movs r2, 0
	mov r9, r2
	movs r7, 0xF0
	movs r6, 0
	movs r5, 0x70
	str r6, [sp]
	str r6, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r3, 0
	bl sub_80791A8
	lsls r0, 16
	lsrs r0, 16
	str r6, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _080DEEDC @ =sub_80DEEE8
	str r0, [r4]
_080DEEBA:
	ldr r1, _080DEEE0 @ =gBattle_WIN0H
	mov r2, r9
	lsls r0, r2, 8
	orrs r7, r0
	strh r7, [r1]
	ldr r1, _080DEEE4 @ =gBattle_WIN0V
	lsls r0, r6, 8
	orrs r5, r0
	strh r5, [r1]
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DEEDC: .4byte sub_80DEEE8
_080DEEE0: .4byte gBattle_WIN0H
_080DEEE4: .4byte gBattle_WIN0V
	thumb_func_end sub_80DED60

	thumb_func_start sub_80DEEE8
sub_80DEEE8: @ 80DEEE8
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _080DEF28 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _080DEF20
	ldr r0, _080DEF2C @ =gBattle_WIN0H
	strh r2, [r0]
	ldr r0, _080DEF30 @ =gBattle_WIN0V
	strh r2, [r0]
	ldr r0, _080DEF34 @ =REG_WININ
	ldr r4, _080DEF38 @ =0x00003f3f
	adds r1, r4, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x6
	strh r2, [r0]
	adds r0, 0x4
	strh r2, [r0]
	adds r0, r3, 0
	bl DestroyAnimVisualTask
_080DEF20:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DEF28: .4byte gPaletteFade
_080DEF2C: .4byte gBattle_WIN0H
_080DEF30: .4byte gBattle_WIN0V
_080DEF34: .4byte REG_WININ
_080DEF38: .4byte 0x00003f3f
	thumb_func_end sub_80DEEE8

	thumb_func_start sub_80DEF3C
sub_80DEF3C: @ 80DEF3C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl InitAnimSpritePos
	ldr r0, _080DEF68 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080DEF70
	movs r2, 0x18
	ldr r3, _080DEF6C @ =0x0000fffe
	ldrb r0, [r4, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x10
	orrs r1, r0
	strb r1, [r4, 0x3]
	b _080DEF74
	.align 2, 0
_080DEF68: .4byte gAnimBankAttacker
_080DEF6C: .4byte 0x0000fffe
_080DEF70:
	ldr r2, _080DEF90 @ =0x0000ffe8
	movs r3, 0x2
_080DEF74:
	lsls r0, r2, 16
	asrs r0, 16
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	strh r3, [r4, 0x30]
	movs r0, 0x3C
	strh r0, [r4, 0x2E]
	ldr r0, _080DEF94 @ =sub_80DEF98
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DEF90: .4byte 0x0000ffe8
_080DEF94: .4byte sub_80DEF98
	thumb_func_end sub_80DEF3C

	thumb_func_start sub_80DEF98
sub_80DEF98: @ 80DEF98
	push {r4,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r3, r2]
	cmp r0, 0
	ble _080DEFAA
	subs r0, r1, 0x1
	b _080DF00E
_080DEFAA:
	ldrh r0, [r3, 0x30]
	ldrh r4, [r3, 0x24]
	adds r1, r0, r4
	strh r1, [r3, 0x24]
	adds r0, r1, 0x7
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xE
	bls _080DF010
	ldrh r0, [r3, 0x20]
	adds r0, r1
	strh r0, [r3, 0x20]
	movs r0, 0
	strh r0, [r3, 0x24]
	ldrh r2, [r3, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x8
	ldr r4, _080DEFFC @ =0x000003ff
	adds r0, r4, 0
	ands r1, r0
	ldr r0, _080DF000 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080DF00C
	movs r0, 0x1E
	strh r0, [r3, 0x2E]
	ldr r0, _080DF004 @ =WaitAnimForDuration
	str r0, [r3, 0x1C]
	ldr r1, _080DF008 @ =sub_80DF018
	adds r0, r3, 0
	bl StoreSpriteCallbackInData
	b _080DF010
	.align 2, 0
_080DEFFC: .4byte 0x000003ff
_080DF000: .4byte 0xfffffc00
_080DF004: .4byte WaitAnimForDuration
_080DF008: .4byte sub_80DF018
_080DF00C:
	movs r0, 0x28
_080DF00E:
	strh r0, [r3, 0x2E]
_080DF010:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DEF98

	thumb_func_start sub_80DF018
sub_80DF018: @ 80DF018
	push {r4,lr}
	adds r3, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r3, r0]
	cmp r2, 0
	bne _080DF044
	ldr r1, _080DF040 @ =REG_BLDCNT
	movs r4, 0xFD
	lsls r4, 6
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x10
	strh r0, [r1]
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	strh r2, [r3, 0x30]
	strh r2, [r3, 0x32]
	b _080DF082
	.align 2, 0
_080DF040: .4byte REG_BLDCNT
_080DF044:
	ldrh r1, [r3, 0x30]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r0, 0x1
	bgt _080DF054
	adds r0, r1, 0x1
	strh r0, [r3, 0x30]
	b _080DF082
_080DF054:
	movs r0, 0
	strh r0, [r3, 0x30]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	ldr r2, _080DF088 @ =REG_BLDALPHA
	movs r1, 0x10
	subs r1, r0
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r4, 0x32
	ldrsh r0, [r3, r4]
	cmp r0, 0x10
	bne _080DF082
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080DF08C @ =sub_80DF090
	str r0, [r3, 0x1C]
_080DF082:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DF088: .4byte REG_BLDALPHA
_080DF08C: .4byte sub_80DF090
	thumb_func_end sub_80DF018

	thumb_func_start sub_80DF090
sub_80DF090: @ 80DF090
	push {lr}
	ldr r1, _080DF0AC @ =REG_BLDCNT
	movs r2, 0
	strh r2, [r1]
	adds r1, 0x2
	strh r2, [r1]
	ldr r1, _080DF0B0 @ =gBattle_WIN0H
	strh r2, [r1]
	ldr r1, _080DF0B4 @ =gBattle_WIN0V
	strh r2, [r1]
	bl DestroyAnimSprite
	pop {r0}
	bx r0
	.align 2, 0
_080DF0AC: .4byte REG_BLDCNT
_080DF0B0: .4byte gBattle_WIN0H
_080DF0B4: .4byte gBattle_WIN0V
	thumb_func_end sub_80DF090

	thumb_func_start sub_80DF0B8
sub_80DF0B8: @ 80DF0B8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0xC
	bl Sin
	strh r0, [r4, 0x24]
	ldr r0, _080DF120 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080DF0DC
	ldrh r0, [r4, 0x24]
	negs r0, r0
	strh r0, [r4, 0x24]
_080DF0DC:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x6
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	ldrh r1, [r4, 0x30]
	adds r0, r1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080DF12C
	ldr r0, _080DF124 @ =0x0000050b
	strh r0, [r4, 0x3A]
	ldr r1, _080DF128 @ =REG_BLDCNT
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0x3A]
	strh r0, [r1]
	b _080DF17E
	.align 2, 0
_080DF120: .4byte gAnimBankAttacker
_080DF124: .4byte 0x0000050b
_080DF128: .4byte REG_BLDCNT
_080DF12C:
	cmp r0, 0x1E
	ble _080DF17E
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	ldrh r1, [r4, 0x3A]
	lsls r0, r1, 16
	asrs r0, 24
	lsls r0, 16
	movs r2, 0xFF
	ands r2, r1
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r3, r0, 16
	cmp r3, 0x10
	bls _080DF150
	movs r3, 0x10
_080DF150:
	subs r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r0, 0
	bge _080DF15C
	movs r2, 0
_080DF15C:
	ldr r1, _080DF184 @ =REG_BLDALPHA
	lsls r0, r3, 8
	orrs r0, r2
	strh r0, [r1]
	strh r0, [r4, 0x3A]
	cmp r3, 0x10
	bne _080DF17E
	cmp r2, 0
	bne _080DF17E
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080DF188 @ =sub_80DF18C
	str r0, [r4, 0x1C]
_080DF17E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DF184: .4byte REG_BLDALPHA
_080DF188: .4byte sub_80DF18C
	thumb_func_end sub_80DF0B8

	thumb_func_start sub_80DF18C
sub_80DF18C: @ 80DF18C
	push {lr}
	ldr r1, _080DF1A0 @ =REG_BLDCNT
	movs r2, 0
	strh r2, [r1]
	adds r1, 0x2
	strh r2, [r1]
	bl DestroyAnimSprite
	pop {r0}
	bx r0
	.align 2, 0
_080DF1A0: .4byte REG_BLDCNT
	thumb_func_end sub_80DF18C

	thumb_func_start sub_80DF1A4
sub_80DF1A4: @ 80DF1A4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080DF23C @ =gTasks
	adds r4, r0
	movs r6, 0
	strh r6, [r4, 0x8]
	movs r0, 0x10
	mov r8, r0
	mov r2, r8
	strh r2, [r4, 0xA]
	ldr r5, _080DF240 @ =gAnimBankAttacker
	ldrb r0, [r5]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1A]
	ldrb r0, [r5]
	bl sub_8077FC0
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1C]
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_807A100
	lsls r0, 16
	asrs r1, r0, 16
	lsrs r0, 31
	adds r1, r0
	asrs r1, 1
	adds r1, 0x8
	strh r1, [r4, 0x1E]
	strh r6, [r4, 0x16]
	ldrb r0, [r5]
	bl sub_8079ED4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x12]
	ldrb r0, [r5]
	bl sub_8079E90
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x2
	strh r0, [r4, 0x14]
	strh r6, [r4, 0xE]
	mov r0, r8
	strh r0, [r4, 0x10]
	ldr r1, _080DF244 @ =REG_BLDCNT
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0x80
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	strh r6, [r4, 0x18]
	ldr r0, _080DF248 @ =sub_80DF24C
	str r0, [r4]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DF23C: .4byte gTasks
_080DF240: .4byte gAnimBankAttacker
_080DF244: .4byte REG_BLDCNT
_080DF248: .4byte sub_80DF24C
	thumb_func_end sub_80DF1A4

	thumb_func_start sub_80DF24C
sub_80DF24C: @ 80DF24C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _080DF270 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bls _080DF266
	b _080DF3CC
_080DF266:
	lsls r0, 2
	ldr r1, _080DF274 @ =_080DF278
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DF270: .4byte gTasks
_080DF274: .4byte _080DF278
	.align 2, 0
_080DF278:
	.4byte _080DF290
	.4byte _080DF300
	.4byte _080DF342
	.4byte _080DF356
	.4byte _080DF3AC
	.4byte _080DF3BC
_080DF290:
	movs r6, 0
_080DF292:
	movs r2, 0x1A
	ldrsh r1, [r4, r2]
	movs r0, 0x1C
	ldrsh r2, [r4, r0]
	ldrb r3, [r4, 0x14]
	ldr r0, _080DF2F4 @ =gSpriteTemplate_83DAF80
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080DF2E6
	ldr r1, _080DF2F8 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r5, r0, r1
	strh r7, [r5, 0x2E]
	ldr r0, _080DF2FC @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	movs r1, 0
	lsls r0, 24
	cmp r0, 0
	bne _080DF2C8
	movs r1, 0x1
_080DF2C8:
	strh r1, [r5, 0x30]
	movs r0, 0x2A
	muls r0, r6
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r4, 0x1E]
	strh r0, [r5, 0x34]
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 1
	strh r0, [r5, 0x38]
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
_080DF2E6:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x5
	bls _080DF292
	b _080DF3B4
	.align 2, 0
_080DF2F4: .4byte gSpriteTemplate_83DAF80
_080DF2F8: .4byte gSprites
_080DF2FC: .4byte gAnimBankAttacker
_080DF300:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080DF31E
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0xD
	bgt _080DF32C
	adds r0, r1, 0x1
	strh r0, [r4, 0xE]
	b _080DF32C
_080DF31E:
	ldrh r1, [r4, 0x10]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0x4
	ble _080DF32C
	subs r0, r1, 0x1
	strh r0, [r4, 0x10]
_080DF32C:
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	ldrh r3, [r4, 0xE]
	ldrh r2, [r4, 0x10]
	cmp r0, 0xE
	bne _080DF39C
	cmp r2, 0x4
	bne _080DF39C
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080DF396
_080DF342:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1E
	ble _080DF3CC
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080DF3B4
_080DF356:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080DF374
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080DF382
	subs r0, r1, 0x1
	strh r0, [r4, 0xE]
	b _080DF382
_080DF374:
	ldrh r1, [r4, 0x10]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080DF382
	adds r0, r1, 0x1
	strh r0, [r4, 0x10]
_080DF382:
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	ldrh r3, [r4, 0xE]
	ldrh r2, [r4, 0x10]
	cmp r0, 0
	bne _080DF39C
	cmp r2, 0x10
	bne _080DF39C
	movs r0, 0x1
	strh r0, [r4, 0x18]
_080DF396:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080DF39C:
	ldr r1, _080DF3A8 @ =REG_BLDALPHA
	lsls r0, r2, 8
	orrs r0, r3
	strh r0, [r1]
	b _080DF3CC
	.align 2, 0
_080DF3A8: .4byte REG_BLDALPHA
_080DF3AC:
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080DF3CC
_080DF3B4:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080DF3CC
_080DF3BC:
	ldr r0, _080DF3D4 @ =REG_BLDCNT
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, r7, 0
	bl DestroyAnimVisualTask
_080DF3CC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DF3D4: .4byte REG_BLDCNT
	thumb_func_end sub_80DF24C

	thumb_func_start sub_80DF3D8
sub_80DF3D8: @ 80DF3D8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080DF3EA
	ldrh r0, [r4, 0x32]
	adds r0, 0x2
	b _080DF3EE
_080DF3EA:
	ldrh r0, [r4, 0x32]
	subs r0, 0x2
_080DF3EE:
	strh r0, [r4, 0x32]
	ldrh r1, [r4, 0x32]
	movs r0, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x32]
	subs r0, 0x41
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x7E
	bhi _080DF430
	ldr r2, _080DF42C @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x12]
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	b _080DF444
	.align 2, 0
_080DF42C: .4byte gTasks
_080DF430:
	ldr r2, _080DF498 @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x3
	ldrb r1, [r0, 0x12]
	ands r1, r2
_080DF444:
	lsls r1, 2
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	lsls r0, 3
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3A]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	movs r1, 0x7
	bl Sin
	strh r0, [r4, 0x26]
	ldr r2, _080DF498 @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r1, r0, r2
	movs r2, 0x18
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080DF492
	ldrh r0, [r1, 0x16]
	subs r0, 0x1
	strh r0, [r1, 0x16]
	adds r0, r4, 0
	bl DestroySprite
_080DF492:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DF498: .4byte gTasks
	thumb_func_end sub_80DF3D8

	thumb_func_start sub_80DF49C
sub_80DF49C: @ 80DF49C
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r3]
	ldr r2, _080DF4E0 @ =gBankSpriteIds
	ldr r1, _080DF4E4 @ =gAnimBankAttacker
	ldrb r1, [r1]
	adds r1, r2
	ldrb r1, [r1]
	strh r1, [r0, 0x38]
	movs r1, 0x80
	strh r1, [r0, 0x2E]
	movs r1, 0xA
	strh r1, [r0, 0x30]
	ldr r2, _080DF4E8 @ =gBattleAnimArgs
	ldrh r1, [r2]
	strh r1, [r0, 0x32]
	ldrh r1, [r2, 0x2]
	strh r1, [r0, 0x34]
	ldr r1, _080DF4EC @ =sub_80DF4F4
	str r1, [r0, 0x1C]
	ldr r2, _080DF4F0 @ =gSprites
	movs r3, 0x38
	ldrsh r1, [r0, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	adds r1, 0x8
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_080DF4E0: .4byte gBankSpriteIds
_080DF4E4: .4byte gAnimBankAttacker
_080DF4E8: .4byte gBattleAnimArgs
_080DF4EC: .4byte sub_80DF4F4
_080DF4F0: .4byte gSprites
	thumb_func_end sub_80DF49C

	thumb_func_start sub_80DF4F4
sub_80DF4F4: @ 80DF4F4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x34]
	movs r1, 0x34
	ldrsh r3, [r5, r1]
	cmp r3, 0
	beq _080DF55C
	subs r0, 0x1
	strh r0, [r5, 0x34]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	bl Sin
	ldr r4, _080DF554 @ =gSprites
	movs r1, 0x38
	ldrsh r2, [r5, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	strh r0, [r1, 0x24]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	bl Cos
	movs r1, 0x38
	ldrsh r2, [r5, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	strh r0, [r1, 0x26]
	ldrh r0, [r5, 0x32]
	ldrh r2, [r5, 0x2E]
	adds r1, r0, r2
	strh r1, [r5, 0x2E]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _080DF590
	ldr r2, _080DF558 @ =0xffffff00
	adds r0, r1, r2
	strh r0, [r5, 0x2E]
	b _080DF590
	.align 2, 0
_080DF554: .4byte gSprites
_080DF558: .4byte 0xffffff00
_080DF55C:
	ldr r2, _080DF598 @ =gSprites
	movs r0, 0x38
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r3, [r0, 0x24]
	movs r0, 0x38
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r3, [r0, 0x26]
	movs r0, 0x38
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	subs r1, 0x8
	strh r1, [r0, 0x22]
	ldr r0, _080DF59C @ =move_anim_8074EE0
	str r0, [r5, 0x1C]
_080DF590:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DF598: .4byte gSprites
_080DF59C: .4byte move_anim_8074EE0
	thumb_func_end sub_80DF4F4
	
	.align 2, 0 @ Don't pad with nop.
