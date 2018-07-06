	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	@ ice

	thumb_func_start sub_80D7704
sub_80D7704: @ 80D7704
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r2, [r5, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x7
	ldr r3, _080D780C @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080D7810 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	ldr r4, _080D7814 @ =gAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r4, _080D7818 @ =gAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r3, r0, 24
	ldrb r0, [r4]
	movs r1, 0x3
	str r3, [sp]
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080D781C @ =gBattleAnimArgs
	ldrh r0, [r1, 0x8]
	strh r0, [r5, 0x2E]
	ldrh r0, [r1]
	ldr r3, [sp]
	adds r0, r3
	strh r0, [r5, 0x30]
	ldrh r0, [r1, 0x4]
	mov r4, r9
	adds r0, r4, r0
	strh r0, [r5, 0x32]
	ldrh r0, [r1, 0x2]
	adds r0, r6
	strh r0, [r5, 0x34]
	ldrh r0, [r1, 0x6]
	mov r7, r8
	adds r0, r7, r0
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl sub_8078314
	adds r4, 0x20
	movs r0, 0x98
	lsls r0, 1
	mov r12, r0
	ldr r3, [sp]
	cmp r4, r12
	bhi _080D77DE
	adds r0, r7, 0
	adds r0, 0x20
	ldrh r1, [r5, 0x30]
	ldrh r2, [r5, 0x32]
	cmp r0, 0xE0
	bhi _080D77DE
	adds r4, r1, 0
	mov r10, r12
_080D77AA:
	mov r7, r9
	lsls r1, r7, 16
	asrs r1, 16
	adds r1, r4
	lsls r1, 16
	mov r7, r8
	lsls r0, r7, 16
	asrs r0, 16
	adds r0, r2
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsrs r0, r1, 16
	mov r9, r0
	movs r7, 0x80
	lsls r7, 14
	adds r1, r7
	lsrs r1, 16
	cmp r1, r10
	bhi _080D77DE
	mov r1, r8
	lsls r0, r1, 16
	adds r0, r7
	lsrs r0, 16
	cmp r0, 0xE0
	bls _080D77AA
_080D77DE:
	ldrh r0, [r5, 0x30]
	negs r7, r0
	strh r7, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	negs r4, r0
	strh r4, [r5, 0x32]
	lsls r0, r3, 16
	movs r1, 0x80
	lsls r1, 14
	adds r0, r1
	lsrs r0, 16
	movs r2, 0x98
	lsls r2, 1
	mov r12, r2
	ldr r1, _080D781C @ =gBattleAnimArgs
	mov r10, r1
	cmp r0, r12
	bhi _080D784A
	lsls r1, r6, 16
	movs r2, 0x80
	lsls r2, 14
	adds r0, r1, r2
	b _080D7842
	.align 2, 0
_080D780C: .4byte 0x000003ff
_080D7810: .4byte 0xfffffc00
_080D7814: .4byte gAnimBankTarget
_080D7818: .4byte gAnimBankAttacker
_080D781C: .4byte gBattleAnimArgs
_080D7820:
	lsls r1, r3, 16
	asrs r1, 16
	adds r1, r7
	lsls r1, 16
	asrs r0, r2, 16
	adds r0, r4
	lsls r0, 16
	lsrs r6, r0, 16
	lsrs r3, r1, 16
	movs r0, 0x80
	lsls r0, 14
	adds r1, r0
	lsrs r1, 16
	cmp r1, r12
	bhi _080D784A
	lsls r1, r6, 16
	adds r0, r1, r0
_080D7842:
	lsrs r0, 16
	adds r2, r1, 0
	cmp r0, 0xE0
	bls _080D7820
_080D784A:
	strh r3, [r5, 0x20]
	strh r6, [r5, 0x22]
	mov r1, r10
	ldrh r0, [r1, 0x8]
	strh r0, [r5, 0x2E]
	strh r3, [r5, 0x30]
	mov r2, r9
	strh r2, [r5, 0x32]
	strh r6, [r5, 0x34]
	mov r3, r8
	strh r3, [r5, 0x36]
	adds r0, r5, 0
	bl sub_8078314
	mov r7, r10
	ldrh r0, [r7, 0xA]
	strh r0, [r5, 0x34]
	ldrh r0, [r7, 0xC]
	strh r0, [r5, 0x36]
	ldr r0, _080D7884 @ =sub_80D7888
	str r0, [r5, 0x1C]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D7884: .4byte sub_80D7888
	thumb_func_end sub_80D7704

	thumb_func_start sub_80D7888
sub_80D7888: @ 80D7888
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D78E0
	ldrh r1, [r4, 0x30]
	ldrh r2, [r4, 0x38]
	adds r1, r2
	strh r1, [r4, 0x38]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x3A]
	adds r0, r2
	strh r0, [r4, 0x3A]
	strh r1, [r4, 0x24]
	strh r0, [r4, 0x26]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x36]
	ldrh r2, [r4, 0x3C]
	adds r0, r2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3C]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	b _080D78E6
_080D78E0:
	adds r0, r4, 0
	bl DestroyAnimSprite
_080D78E6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D7888

	thumb_func_start sub_80D78EC
sub_80D78EC: @ 80D78EC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080D7920 @ =gBattleAnimArgs
	ldrh r0, [r0]
	strh r0, [r4, 0x2E]
	movs r0, 0x3C
	strh r0, [r4, 0x30]
	movs r0, 0x9
	strh r0, [r4, 0x32]
	movs r0, 0x1E
	strh r0, [r4, 0x34]
	movs r0, 0xFE
	lsls r0, 8
	strh r0, [r4, 0x36]
	ldr r1, _080D7924 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	ldr r1, _080D7928 @ =sub_8078174
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D7920: .4byte gBattleAnimArgs
_080D7924: .4byte DestroyAnimSprite
_080D7928: .4byte sub_8078174
	thumb_func_end sub_80D78EC

	thumb_func_start sub_80D792C
sub_80D792C: @ 80D792C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl InitAnimSpritePos
	ldr r0, _080D7960 @ =gAnimBankTarget
	ldrb r0, [r0]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldr r0, _080D7964 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080D796C
	ldr r0, _080D7968 @ =gBattleAnimArgs
	ldrh r1, [r4, 0x32]
	ldrh r0, [r0, 0x4]
	subs r1, r0
	strh r1, [r4, 0x32]
	b _080D7976
	.align 2, 0
_080D7960: .4byte gAnimBankTarget
_080D7964: .4byte gAnimBankAttacker
_080D7968: .4byte gBattleAnimArgs
_080D796C:
	ldr r0, _080D79A4 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
_080D7976:
	ldr r0, _080D79A8 @ =gAnimBankTarget
	ldrb r0, [r0]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	ldr r1, _080D79A4 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r2, [r1, 0x6]
	adds r0, r2
	strh r0, [r4, 0x36]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x2E]
	ldr r1, _080D79AC @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	ldr r0, _080D79B0 @ =StartAnimLinearTranslation
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D79A4: .4byte gBattleAnimArgs
_080D79A8: .4byte gAnimBankTarget
_080D79AC: .4byte DestroyAnimSprite
_080D79B0: .4byte StartAnimLinearTranslation
	thumb_func_end sub_80D792C

	thumb_func_start sub_80D79B4
sub_80D79B4: @ 80D79B4
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080D79CC @ =gBattleAnimArgs
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080D79D0
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8078764
	b _080D7A06
	.align 2, 0
_080D79CC: .4byte gBattleAnimArgs
_080D79D0:
	ldr r0, _080D7A18 @ =gAnimBankTarget
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0x1
	bl SetAverageBattlerPositions
	ldr r0, _080D7A1C @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080D79F6
	ldrh r0, [r5]
	negs r0, r0
	strh r0, [r5]
_080D79F6:
	ldrh r0, [r5]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
_080D7A06:
	ldr r1, _080D7A20 @ =sub_80D7A28
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	ldr r0, _080D7A24 @ =sub_80785E4
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D7A18: .4byte gAnimBankTarget
_080D7A1C: .4byte gAnimBankAttacker
_080D7A20: .4byte sub_80D7A28
_080D7A24: .4byte sub_80785E4
	thumb_func_end sub_80D79B4

	thumb_func_start sub_80D7A28
sub_80D7A28: @ 80D7A28
	push {lr}
	adds r3, r0, 0
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
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
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bne _080D7A5E
	adds r0, r3, 0
	bl move_anim_8074EE0
_080D7A5E:
	pop {r0}
	bx r0
	thumb_func_end sub_80D7A28

	thumb_func_start sub_80D7A64
sub_80D7A64: @ 80D7A64
	push {r4-r7,lr}
	sub sp, 0x10
	adds r5, r0, 0
	movs r1, 0x1
	bl InitAnimSpritePos
	ldr r6, _080D7AAC @ =gBattleAnimArgs
	ldrh r0, [r6, 0x8]
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	movs r1, 0xA
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080D7AB4
	ldr r4, _080D7AB0 @ =gAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x6]
	adds r0, r6
	strh r0, [r5, 0x36]
	b _080D7AC6
	.align 2, 0
_080D7AAC: .4byte gBattleAnimArgs
_080D7AB0: .4byte gAnimBankTarget
_080D7AB4:
	ldr r0, _080D7AE0 @ =gAnimBankTarget
	ldrb r0, [r0]
	adds r2, r5, 0
	adds r2, 0x32
	adds r3, r5, 0
	adds r3, 0x36
	movs r1, 0x1
	bl SetAverageBattlerPositions
_080D7AC6:
	ldr r0, _080D7AE4 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080D7AEC
	ldr r0, _080D7AE8 @ =gBattleAnimArgs
	ldrh r1, [r5, 0x32]
	ldrh r0, [r0, 0x4]
	subs r1, r0
	strh r1, [r5, 0x32]
	b _080D7AF6
	.align 2, 0
_080D7AE0: .4byte gAnimBankTarget
_080D7AE4: .4byte gAnimBankAttacker
_080D7AE8: .4byte gBattleAnimArgs
_080D7AEC:
	ldr r0, _080D7B94 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	ldrh r2, [r5, 0x32]
	adds r0, r2
	strh r0, [r5, 0x32]
_080D7AF6:
	adds r7, r5, 0
	adds r7, 0x2E
	adds r2, r7, 0
	mov r1, sp
	movs r4, 0x7
_080D7B00:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _080D7B00
	adds r0, r5, 0
	bl sub_8078D60
	ldrh r0, [r5, 0x30]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	eors r0, r1
	strh r0, [r5, 0x32]
_080D7B22:
	movs r0, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r5, 0
	bl sub_8078CE8
	movs r0, 0x20
	ldrsh r1, [r5, r0]
	movs r2, 0x24
	ldrsh r0, [r5, r2]
	adds r1, r0
	adds r1, 0x10
	movs r0, 0x88
	lsls r0, 1
	cmp r1, r0
	bhi _080D7B56
	movs r0, 0x22
	ldrsh r1, [r5, r0]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	adds r1, r0
	cmp r1, 0xA0
	bgt _080D7B56
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	bge _080D7B22
_080D7B56:
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
	ldr r6, _080D7B98 @ =sub_8078D8C
	ldr r1, _080D7B9C @ =sub_80D7BA0
	mov r3, sp
	adds r2, r7, 0
	movs r4, 0x7
_080D7B76:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, 0x2
	adds r2, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _080D7B76
	str r6, [r5, 0x1C]
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D7B94: .4byte gBattleAnimArgs
_080D7B98: .4byte sub_8078D8C
_080D7B9C: .4byte sub_80D7BA0
	thumb_func_end sub_80D7A64

	thumb_func_start sub_80D7BA0
sub_80D7BA0: @ 80D7BA0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	movs r5, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	strh r5, [r4, 0x26]
	strh r5, [r4, 0x24]
	movs r0, 0x80
	strh r0, [r4, 0x2E]
	ldr r0, _080D7BFC @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	ldr r1, _080D7C00 @ =0x0000ffec
	cmp r0, 0
	beq _080D7BD0
	movs r1, 0x14
_080D7BD0:
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	lsls r1, 16
	asrs r1, 16
	bl Sin
	strh r0, [r4, 0x34]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0xF
	bl Cos
	strh r0, [r4, 0x36]
	strh r5, [r4, 0x38]
	ldr r1, _080D7C04 @ =sub_80D7C08
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D7BFC: .4byte gAnimBankAttacker
_080D7C00: .4byte 0x0000ffec
_080D7C04: .4byte sub_80D7C08
	thumb_func_end sub_80D7BA0

	thumb_func_start sub_80D7C08
sub_80D7C08: @ 80D7C08
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080D7C5C @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	ldr r1, _080D7C60 @ =0x0000ffec
	cmp r0, 0
	beq _080D7C1E
	movs r1, 0x14
_080D7C1E:
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	cmp r0, 0x1F
	bgt _080D7C64
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	lsls r1, 16
	asrs r1, 16
	bl Sin
	ldrh r1, [r4, 0x34]
	subs r0, r1
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0xF
	bl Cos
	ldrh r1, [r4, 0x36]
	subs r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x10
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	b _080D7C82
	.align 2, 0
_080D7C5C: .4byte gAnimBankAttacker
_080D7C60: .4byte 0x0000ffec
_080D7C64:
	ldrh r0, [r4, 0x24]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	movs r1, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	strh r1, [r4, 0x26]
	strh r1, [r4, 0x24]
	strh r1, [r4, 0x36]
	strh r1, [r4, 0x34]
	ldr r0, _080D7C88 @ =sub_80D7C8C
	str r0, [r4, 0x1C]
_080D7C82:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D7C88: .4byte sub_80D7C8C
	thumb_func_end sub_80D7C08

	thumb_func_start sub_80D7C8C
sub_80D7C8C: @ 80D7C8C
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x1
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl sub_8078CE8
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	adds r0, r1
	adds r0, 0x10
	movs r1, 0x88
	lsls r1, 1
	cmp r0, r1
	bhi _080D7CC8
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	adds r1, r0, r1
	movs r0, 0x80
	lsls r0, 1
	cmp r1, r0
	bgt _080D7CC8
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	bge _080D7CCE
_080D7CC8:
	adds r0, r4, 0
	bl DestroyAnimSprite
_080D7CCE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D7C8C

	thumb_func_start sub_80D7CD4
sub_80D7CD4: @ 80D7CD4
	push {r4-r7,lr}
	sub sp, 0x10
	adds r5, r0, 0
	movs r1, 0x1
	bl InitAnimSpritePos
	ldr r1, _080D7D18 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x8]
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	movs r2, 0xE
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080D7D20
	ldr r4, _080D7D1C @ =gAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	b _080D7D32
	.align 2, 0
_080D7D18: .4byte gBattleAnimArgs
_080D7D1C: .4byte gAnimBankTarget
_080D7D20:
	ldr r0, _080D7D50 @ =gAnimBankTarget
	ldrb r0, [r0]
	adds r2, r5, 0
	adds r2, 0x32
	adds r3, r5, 0
	adds r3, 0x36
	movs r1, 0x1
	bl SetAverageBattlerPositions
_080D7D32:
	ldr r0, _080D7D54 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080D7D5C
	ldr r0, _080D7D58 @ =gBattleAnimArgs
	ldrh r1, [r5, 0x32]
	ldrh r2, [r0, 0x4]
	subs r1, r2
	strh r1, [r5, 0x32]
	adds r1, r0, 0
	b _080D7D66
	.align 2, 0
_080D7D50: .4byte gAnimBankTarget
_080D7D54: .4byte gAnimBankAttacker
_080D7D58: .4byte gBattleAnimArgs
_080D7D5C:
	ldr r1, _080D7E10 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	ldrh r2, [r5, 0x32]
	adds r0, r2
	strh r0, [r5, 0x32]
_080D7D66:
	ldrh r0, [r1, 0x6]
	ldrh r1, [r5, 0x36]
	adds r0, r1
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl sub_8078D60
	adds r7, r5, 0
	adds r7, 0x2E
	adds r2, r7, 0
	mov r1, sp
	movs r4, 0x7
_080D7D7E:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _080D7D7E
	ldrh r0, [r5, 0x30]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	eors r0, r1
	strh r0, [r5, 0x32]
_080D7D9A:
	movs r0, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r5, 0
	bl sub_8078CE8
	movs r2, 0x20
	ldrsh r1, [r5, r2]
	movs r2, 0x24
	ldrsh r0, [r5, r2]
	adds r1, r0
	adds r1, 0x10
	movs r0, 0x88
	lsls r0, 1
	cmp r1, r0
	bhi _080D7DCE
	movs r0, 0x22
	ldrsh r1, [r5, r0]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	adds r1, r0
	cmp r1, 0xA0
	bgt _080D7DCE
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	bge _080D7D9A
_080D7DCE:
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
	ldr r1, _080D7E10 @ =gBattleAnimArgs
	ldr r6, _080D7E14 @ =sub_80D7E18
	mov r3, sp
	adds r2, r7, 0
	movs r4, 0x7
_080D7DEE:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, 0x2
	adds r2, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _080D7DEE
	ldrh r0, [r1, 0xA]
	strh r0, [r5, 0x38]
	ldrh r0, [r1, 0xC]
	strh r0, [r5, 0x3A]
	str r6, [r5, 0x1C]
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D7E10: .4byte gBattleAnimArgs
_080D7E14: .4byte sub_80D7E18
	thumb_func_end sub_80D7CD4

	thumb_func_start sub_80D7E18
sub_80D7E18: @ 80D7E18
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078CE8
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D7E2C
	movs r0, 0x1
	strh r0, [r4, 0x2E]
_080D7E2C:
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	ldrh r2, [r4, 0x3C]
	adds r0, r2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3C]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080D7E82
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	adds r0, r1
	adds r0, 0x10
	movs r1, 0x88
	lsls r1, 1
	cmp r0, r1
	bhi _080D7E7C
	movs r0, 0x22
	ldrsh r1, [r4, r0]
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	adds r1, r0
	cmp r1, 0xA0
	bgt _080D7E7C
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	bge _080D7E82
_080D7E7C:
	adds r0, r4, 0
	bl DestroyAnimSprite
_080D7E82:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D7E18

	thumb_func_start sub_80D7E88
sub_80D7E88: @ 80D7E88
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D7EF4
	ldr r5, _080D7EA8 @ =gBattleAnimArgs
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080D7EAC
	adds r0, r4, 0
	movs r1, 0
	bl sub_8078764
	b _080D7EE2
	.align 2, 0
_080D7EA8: .4byte gBattleAnimArgs
_080D7EAC:
	ldr r0, _080D7EEC @ =gAnimBankTarget
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0
	bl SetAverageBattlerPositions
	ldr r0, _080D7EF0 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080D7ED2
	ldrh r0, [r5]
	negs r0, r0
	strh r0, [r5]
_080D7ED2:
	ldrh r0, [r5]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
_080D7EE2:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080D7F08
	.align 2, 0
_080D7EEC: .4byte gAnimBankTarget
_080D7EF0: .4byte gAnimBankAttacker
_080D7EF4:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080D7F08
	adds r0, r4, 0
	bl DestroyAnimSprite
_080D7F08:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80D7E88

	thumb_func_start sub_80D7F10
sub_80D7F10: @ 80D7F10
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080D7F30 @ =gBattleAnimArgs
	movs r1, 0x8
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080D7F80
	movs r1, 0xA
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080D7F34
	adds r0, r5, 0
	movs r1, 0
	bl InitAnimSpritePos
	b _080D7F72
	.align 2, 0
_080D7F30: .4byte gBattleAnimArgs
_080D7F34:
	ldr r4, _080D7F5C @ =gAnimBankAttacker
	ldrb r0, [r4]
	adds r2, r5, 0
	adds r2, 0x20
	adds r3, r5, 0
	adds r3, 0x22
	movs r1, 0
	bl SetAverageBattlerPositions
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080D7F60
	ldrh r0, [r5, 0x20]
	ldrh r1, [r6]
	subs r0, r1
	b _080D7F66
	.align 2, 0
_080D7F5C: .4byte gAnimBankAttacker
_080D7F60:
	ldrh r0, [r6]
	ldrh r1, [r5, 0x20]
	adds r0, r1
_080D7F66:
	strh r0, [r5, 0x20]
	ldr r0, _080D7F78 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x2]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
_080D7F72:
	ldr r0, _080D7F7C @ =gAnimBankAttacker
	b _080D7FD0
	.align 2, 0
_080D7F78: .4byte gBattleAnimArgs
_080D7F7C: .4byte gAnimBankAttacker
_080D7F80:
	movs r1, 0xA
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080D7F92
	adds r0, r5, 0
	movs r1, 0
	bl sub_8078764
	b _080D7FCE
_080D7F92:
	ldr r4, _080D7FB8 @ =gAnimBankTarget
	ldrb r0, [r4]
	adds r2, r5, 0
	adds r2, 0x20
	adds r3, r5, 0
	adds r3, 0x22
	movs r1, 0
	bl SetAverageBattlerPositions
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080D7FBC
	ldrh r0, [r5, 0x20]
	ldrh r1, [r6]
	subs r0, r1
	b _080D7FC2
	.align 2, 0
_080D7FB8: .4byte gAnimBankTarget
_080D7FBC:
	ldrh r0, [r6]
	ldrh r1, [r5, 0x20]
	adds r0, r1
_080D7FC2:
	strh r0, [r5, 0x20]
	ldr r0, _080D7FEC @ =gBattleAnimArgs
	ldrh r0, [r0, 0x2]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
_080D7FCE:
	ldr r0, _080D7FF0 @ =gAnimBankTarget
_080D7FD0:
	ldrb r0, [r0]
	strh r0, [r5, 0x3C]
	ldr r0, _080D7FEC @ =gBattleAnimArgs
	movs r1, 0xA
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080D7FE8
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	bne _080D7FF4
_080D7FE8:
	movs r0, 0x20
	b _080D7FF6
	.align 2, 0
_080D7FEC: .4byte gBattleAnimArgs
_080D7FF0: .4byte gAnimBankTarget
_080D7FF4:
	movs r0, 0x40
_080D7FF6:
	strh r0, [r5, 0x3A]
	ldr r0, _080D803C @ =gAnimBankTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080D800C
	ldrh r0, [r5, 0x22]
	adds r0, 0x8
	strh r0, [r5, 0x22]
_080D800C:
	ldr r1, _080D8040 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x6]
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	ldrh r1, [r1, 0x4]
	adds r0, r1
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl InitAnimLinearTranslation
	movs r0, 0x40
	strh r0, [r5, 0x38]
	ldr r1, _080D8044 @ =sub_80D8048
	str r1, [r5, 0x1C]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D803C: .4byte gAnimBankTarget
_080D8040: .4byte gBattleAnimArgs
_080D8044: .4byte sub_80D8048
	thumb_func_end sub_80D7F10

	thumb_func_start sub_80D8048
sub_80D8048: @ 80D8048
	push {r4,lr}
	adds r4, r0, 0
	bl TranslateAnimLinear
	lsls r0, 24
	cmp r0, 0
	bne _080D80D2
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r2, 0x3A
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	movs r1, 0x6
	negs r1, r1
	bl Cos
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x38]
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x7F
	bhi _080D80A4
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8079ED4
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	b _080D80C6
_080D80A4:
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8079ED4
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	lsls r0, 2
	ldrb r2, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x5]
_080D80C6:
	ldrh r0, [r4, 0x38]
	adds r0, 0x3
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	b _080D80D8
_080D80D2:
	adds r0, r4, 0
	bl DestroyAnimSprite
_080D80D8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D8048

	thumb_func_start sub_80D80E0
sub_80D80E0: @ 80D80E0
	push {r4,r5,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080D81A8 @ =REG_BLDCNT
	ldr r2, _080D81AC @ =0x00003f42
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0x80
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r4, _080D81B0 @ =REG_BG1CNT
	ldrb r1, [r4]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4]
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r4, 0x1]
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080D812A
	ldrb r0, [r4]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4]
_080D812A:
	ldr r0, _080D81B4 @ =gBattle_BG1_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080D81B8 @ =gBattle_BG1_Y
	strh r1, [r0]
	ldr r0, _080D81BC @ =REG_BG1HOFS
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	mov r0, sp
	bl sub_8078914
	ldr r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0xC]
	ldr r0, _080D81C0 @ =0x040000d4
	add r2, sp, 0xC
	str r2, [r0]
	str r1, [r0, 0x4]
	ldr r2, _080D81C4 @ =0x85000400
	str r2, [r0, 0x8]
	ldr r2, [r0, 0x8]
	ldr r2, _080D81C8 @ =gWeatherFog1Tiles
	ldr r3, [sp]
	str r2, [r0]
	str r3, [r0, 0x4]
	ldr r2, _080D81CC @ =0x80000400
	str r2, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _080D81D0 @ =gBattleAnimFogTilemap
	bl LZDecompressVram
	ldr r0, _080D81D4 @ =gUnknown_083970E8
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadPalette
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _080D8190
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80763FC
_080D8190:
	ldr r0, _080D81D8 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080D81DC @ =sub_80D81E0
	str r0, [r1]
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D81A8: .4byte REG_BLDCNT
_080D81AC: .4byte 0x00003f42
_080D81B0: .4byte REG_BG1CNT
_080D81B4: .4byte gBattle_BG1_X
_080D81B8: .4byte gBattle_BG1_Y
_080D81BC: .4byte REG_BG1HOFS
_080D81C0: .4byte 0x040000d4
_080D81C4: .4byte 0x85000400
_080D81C8: .4byte gWeatherFog1Tiles
_080D81CC: .4byte 0x80000400
_080D81D0: .4byte gBattleAnimFogTilemap
_080D81D4: .4byte gUnknown_083970E8
_080D81D8: .4byte gTasks
_080D81DC: .4byte sub_80D81E0
	thumb_func_end sub_80D80E0

	thumb_func_start sub_80D81E0
sub_80D81E0: @ 80D81E0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, _080D8220 @ =gBattle_BG1_X
	ldr r1, _080D8224 @ =0x0000ffff
	adds r0, r1, 0
	ldrh r4, [r2]
	adds r0, r4
	strh r0, [r2]
	ldr r1, _080D8228 @ =gBattle_BG1_Y
	ldr r3, _080D822C @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r3
	movs r4, 0x20
	ldrsh r0, [r0, r4]
	adds r4, r1, 0
	cmp r0, 0x4
	bls _080D8214
	b _080D83B0
_080D8214:
	lsls r0, 2
	ldr r1, _080D8230 @ =_080D8234
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D8220: .4byte gBattle_BG1_X
_080D8224: .4byte 0x0000ffff
_080D8228: .4byte gBattle_BG1_Y
_080D822C: .4byte gTasks
_080D8230: .4byte _080D8234
	.align 2, 0
_080D8234:
	.4byte _080D8248
	.4byte _080D82A0
	.4byte _080D82C2
	.4byte _080D8304
	.4byte _080D838C
_080D8248:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r3, r0, r3
	ldrh r0, [r3, 0x1C]
	adds r0, 0x1
	movs r4, 0
	strh r0, [r3, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	beq _080D8262
	b _080D83B0
_080D8262:
	strh r4, [r3, 0x1C]
	ldrh r0, [r3, 0x1A]
	adds r0, 0x1
	strh r0, [r3, 0x1A]
	ldr r1, _080D8298 @ =gUnknown_083D9D6C
	movs r2, 0x1A
	ldrsh r0, [r3, r2]
	adds r0, r1
	ldrb r1, [r0]
	strh r1, [r3, 0x1E]
	ldr r2, _080D829C @ =REG_BLDALPHA
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r1, 0x1E
	ldrsh r0, [r3, r1]
	cmp r0, 0x9
	beq _080D828C
	b _080D83B0
_080D828C:
	ldrh r0, [r3, 0x20]
	adds r0, 0x1
	strh r0, [r3, 0x20]
	strh r4, [r3, 0x1E]
	b _080D83B0
	.align 2, 0
_080D8298: .4byte gUnknown_083D9D6C
_080D829C: .4byte REG_BLDALPHA
_080D82A0:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r3, r0, r3
	ldrh r0, [r3, 0x1E]
	adds r0, 0x1
	strh r0, [r3, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x51
	bne _080D83B0
	movs r0, 0x9
	strh r0, [r3, 0x1E]
	ldrh r0, [r3, 0x20]
	adds r0, 0x1
	strh r0, [r3, 0x20]
	b _080D83B0
_080D82C2:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r3, r0, r3
	ldrh r0, [r3, 0x1C]
	adds r0, 0x1
	strh r0, [r3, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080D83B0
	movs r0, 0
	strh r0, [r3, 0x1C]
	ldrh r1, [r3, 0x1E]
	subs r1, 0x1
	strh r1, [r3, 0x1E]
	ldr r2, _080D8300 @ =REG_BLDALPHA
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r2, 0x1E
	ldrsh r1, [r3, r2]
	cmp r1, 0
	bne _080D83B0
	ldrh r0, [r3, 0x20]
	adds r0, 0x1
	strh r0, [r3, 0x20]
	strh r1, [r3, 0x1E]
	b _080D83B0
	.align 2, 0
_080D8300: .4byte REG_BLDALPHA
_080D8304:
	mov r0, sp
	bl sub_8078914
	ldr r2, [sp]
	movs r3, 0x80
	lsls r3, 6
	lsls r4, r6, 2
	mov r10, r4
	add r5, sp, 0xC
	movs r7, 0
	ldr r1, _080D83C0 @ =0x040000d4
	movs r4, 0x80
	lsls r4, 5
	mov r8, r5
	ldr r0, _080D83C4 @ =0x85000400
	mov r12, r0
	movs r0, 0x85
	lsls r0, 24
	mov r9, r0
_080D832A:
	str r7, [sp, 0xC]
	mov r0, r8
	str r0, [r1]
	str r2, [r1, 0x4]
	mov r0, r12
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080D832A
	str r7, [sp, 0xC]
	str r5, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r9
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0xC]
	ldr r0, _080D83C0 @ =0x040000d4
	str r5, [r0]
	str r1, [r0, 0x4]
	ldr r1, _080D83C8 @ =0x85000200
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080D8378
	ldr r2, _080D83CC @ =REG_BG1CNT
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080D8378:
	ldr r0, _080D83D0 @ =gTasks
	mov r4, r10
	adds r1, r4, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
	ldr r2, _080D83D4 @ =gBattle_BG1_X
	ldr r4, _080D83D8 @ =gBattle_BG1_Y
_080D838C:
	movs r1, 0
	strh r1, [r2]
	strh r1, [r4]
	ldr r0, _080D83DC @ =REG_BLDCNT
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r2, _080D83CC @ =REG_BG1CNT
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080D83B0:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D83C0: .4byte 0x040000d4
_080D83C4: .4byte 0x85000400
_080D83C8: .4byte 0x85000200
_080D83CC: .4byte REG_BG1CNT
_080D83D0: .4byte gTasks
_080D83D4: .4byte gBattle_BG1_X
_080D83D8: .4byte gBattle_BG1_Y
_080D83DC: .4byte REG_BLDCNT
	thumb_func_end sub_80D81E0

	thumb_func_start sub_80D83E0
sub_80D83E0: @ 80D83E0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080D840C @ =gAnimBankAttacker
	ldrb r0, [r5]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	ldr r0, _080D8410 @ =TranslateAnimSpriteToTargetMonLocation
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D840C: .4byte gAnimBankAttacker
_080D8410: .4byte TranslateAnimSpriteToTargetMonLocation
	thumb_func_end sub_80D83E0

	thumb_func_start sub_80D8414
sub_80D8414: @ 80D8414
	push {r4,r5,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080D84E0 @ =REG_BLDCNT
	ldr r2, _080D84E4 @ =0x00003f42
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0x80
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r4, _080D84E8 @ =REG_BG1CNT
	ldrb r1, [r4]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4]
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r4, 0x1]
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080D845E
	ldrb r0, [r4]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4]
_080D845E:
	ldr r0, _080D84EC @ =gBattle_BG1_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080D84F0 @ =gBattle_BG1_Y
	strh r1, [r0]
	ldr r0, _080D84F4 @ =REG_BG1HOFS
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	mov r0, sp
	bl sub_8078914
	ldr r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0xC]
	ldr r0, _080D84F8 @ =0x040000d4
	add r2, sp, 0xC
	str r2, [r0]
	str r1, [r0, 0x4]
	ldr r2, _080D84FC @ =0x85000400
	str r2, [r0, 0x8]
	ldr r2, [r0, 0x8]
	ldr r2, _080D8500 @ =gWeatherFog1Tiles
	ldr r3, [sp]
	str r2, [r0]
	str r3, [r0, 0x4]
	ldr r2, _080D8504 @ =0x80000400
	str r2, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _080D8508 @ =gBattleAnimFogTilemap
	bl LZDecompressVram
	ldr r0, _080D850C @ =gUnknown_083970E8
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadPalette
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _080D84C4
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80763FC
_080D84C4:
	ldr r1, _080D8510 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080D8514 @ =0x0000ffff
	strh r1, [r0, 0x26]
	ldr r1, _080D8518 @ =sub_80D851C
	str r1, [r0]
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D84E0: .4byte REG_BLDCNT
_080D84E4: .4byte 0x00003f42
_080D84E8: .4byte REG_BG1CNT
_080D84EC: .4byte gBattle_BG1_X
_080D84F0: .4byte gBattle_BG1_Y
_080D84F4: .4byte REG_BG1HOFS
_080D84F8: .4byte 0x040000d4
_080D84FC: .4byte 0x85000400
_080D8500: .4byte gWeatherFog1Tiles
_080D8504: .4byte 0x80000400
_080D8508: .4byte gBattleAnimFogTilemap
_080D850C: .4byte gUnknown_083970E8
_080D8510: .4byte gTasks
_080D8514: .4byte 0x0000ffff
_080D8518: .4byte sub_80D851C
	thumb_func_end sub_80D8414

	thumb_func_start sub_80D851C
sub_80D851C: @ 80D851C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r3, _080D8558 @ =gBattle_BG1_X
	ldr r4, _080D855C @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r4
	ldrh r0, [r1, 0x26]
	ldrh r2, [r3]
	adds r0, r2
	strh r0, [r3]
	ldr r2, _080D8560 @ =gBattle_BG1_Y
	movs r5, 0x20
	ldrsh r0, [r1, r5]
	cmp r0, 0x4
	bls _080D854C
	b _080D86D0
_080D854C:
	lsls r0, 2
	ldr r1, _080D8564 @ =_080D8568
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D8558: .4byte gBattle_BG1_X
_080D855C: .4byte gTasks
_080D8560: .4byte gBattle_BG1_Y
_080D8564: .4byte _080D8568
	.align 2, 0
_080D8568:
	.4byte _080D857C
	.4byte _080D85C0
	.4byte _080D85E2
	.4byte _080D8624
	.4byte _080D86AC
_080D857C:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r4
	ldrh r0, [r4, 0x1A]
	adds r0, 0x1
	strh r0, [r4, 0x1A]
	ldr r1, _080D85B8 @ =gUnknown_083D9D98
	movs r2, 0x1A
	ldrsh r0, [r4, r2]
	adds r0, r1
	ldrb r1, [r0]
	strh r1, [r4, 0x1E]
	ldr r2, _080D85BC @ =REG_BLDALPHA
	movs r0, 0x11
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r5, 0x1E
	ldrsh r0, [r4, r5]
	cmp r0, 0x5
	beq _080D85AC
	b _080D86D0
_080D85AC:
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	movs r0, 0
	strh r0, [r4, 0x1E]
	b _080D86D0
	.align 2, 0
_080D85B8: .4byte gUnknown_083D9D98
_080D85BC: .4byte REG_BLDALPHA
_080D85C0:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r1, r0, r4
	ldrh r0, [r1, 0x1E]
	adds r0, 0x1
	strh r0, [r1, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x51
	bne _080D86D0
	movs r0, 0x5
	strh r0, [r1, 0x1E]
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
	b _080D86D0
_080D85E2:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r4
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080D86D0
	movs r0, 0
	strh r0, [r4, 0x1C]
	ldrh r1, [r4, 0x1E]
	subs r1, 0x1
	strh r1, [r4, 0x1E]
	ldr r2, _080D8620 @ =REG_BLDALPHA
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r0, 0x1E
	ldrsh r1, [r4, r0]
	cmp r1, 0
	bne _080D86D0
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	strh r1, [r4, 0x1E]
	b _080D86D0
	.align 2, 0
_080D8620: .4byte REG_BLDALPHA
_080D8624:
	mov r0, sp
	bl sub_8078914
	ldr r2, [sp]
	movs r3, 0x80
	lsls r3, 6
	lsls r1, r6, 2
	mov r10, r1
	add r5, sp, 0xC
	movs r7, 0
	ldr r1, _080D86E0 @ =0x040000d4
	movs r4, 0x80
	lsls r4, 5
	mov r8, r5
	ldr r0, _080D86E4 @ =0x85000400
	mov r12, r0
	movs r0, 0x85
	lsls r0, 24
	mov r9, r0
_080D864A:
	str r7, [sp, 0xC]
	mov r0, r8
	str r0, [r1]
	str r2, [r1, 0x4]
	mov r0, r12
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080D864A
	str r7, [sp, 0xC]
	str r5, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r9
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0xC]
	ldr r0, _080D86E0 @ =0x040000d4
	str r5, [r0]
	str r1, [r0, 0x4]
	ldr r1, _080D86E8 @ =0x85000200
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080D8698
	ldr r2, _080D86EC @ =REG_BG1CNT
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080D8698:
	ldr r0, _080D86F0 @ =gTasks
	mov r5, r10
	adds r1, r5, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
	ldr r3, _080D86F4 @ =gBattle_BG1_X
	ldr r2, _080D86F8 @ =gBattle_BG1_Y
_080D86AC:
	movs r1, 0
	strh r1, [r3]
	strh r1, [r2]
	ldr r0, _080D86FC @ =REG_BLDCNT
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r2, _080D86EC @ =REG_BG1CNT
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080D86D0:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D86E0: .4byte 0x040000d4
_080D86E4: .4byte 0x85000400
_080D86E8: .4byte 0x85000200
_080D86EC: .4byte REG_BG1CNT
_080D86F0: .4byte gTasks
_080D86F4: .4byte gBattle_BG1_X
_080D86F8: .4byte gBattle_BG1_Y
_080D86FC: .4byte REG_BLDCNT
	thumb_func_end sub_80D851C

	thumb_func_start sub_80D8700
sub_80D8700: @ 80D8700
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	ldr r6, _080D87E8 @ =gBattleAnimArgs
	ldrh r0, [r6]
	strh r0, [r5, 0x2E]
	ldr r0, _080D87EC @ =gAnimBankAttacker
	mov r8, r0
	ldrb r0, [r0]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	adds r4, r0, 0
	ldr r7, _080D87F0 @ =gAnimBankTarget
	ldrb r0, [r7]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bcs _080D8734
	movs r0, 0x80
	lsls r0, 8
	strh r0, [r5, 0x3C]
_080D8734:
	ldr r3, _080D87F4 @ =gBanksBySide
	ldrb r0, [r7]
	adds r0, r3
	ldrb r1, [r0]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _080D8794
	ldrh r0, [r6, 0x2]
	negs r0, r0
	strh r0, [r6, 0x2]
	ldrh r0, [r6, 0x6]
	negs r0, r0
	strh r0, [r6, 0x6]
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080D8790
	mov r1, r8
	ldrb r0, [r1]
	adds r0, r3
	ldrb r1, [r0]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _080D8790
	movs r0, 0x1
	bl GetAnimBattlerSpriteId
	ldr r2, _080D87F8 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0x1
	adds r1, r5, 0
	adds r1, 0x43
	strb r0, [r1]
_080D8790:
	movs r0, 0x1
	strh r0, [r5, 0x3A]
_080D8794:
	ldr r4, _080D87EC @ =gAnimBankAttacker
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
	ldr r6, _080D87E8 @ =gBattleAnimArgs
	movs r1, 0xE
	ldrsh r0, [r6, r1]
	cmp r0, 0
	beq _080D87FC
	ldrh r0, [r6, 0x2]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	strh r0, [r5, 0x30]
	ldr r4, _080D87F0 @ =gAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x6]
	adds r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r6, 0x4]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x34]
	ldrb r0, [r4]
	movs r1, 0x3
	b _080D8824
	.align 2, 0
_080D87E8: .4byte gBattleAnimArgs
_080D87EC: .4byte gAnimBankAttacker
_080D87F0: .4byte gAnimBankTarget
_080D87F4: .4byte gBanksBySide
_080D87F8: .4byte gSprites
_080D87FC:
	ldrh r0, [r6, 0x2]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	strh r0, [r5, 0x30]
	ldr r4, _080D886C @ =gAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x6]
	adds r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r6, 0x4]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x34]
	ldrb r0, [r4]
	movs r1, 0x1
_080D8824:
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x8]
	adds r0, r6
	strh r0, [r5, 0x36]
	ldrb r0, [r4]
	bl sub_8079ED4
	lsls r0, 24
	lsrs r0, 16
	ldrh r1, [r5, 0x3C]
	orrs r0, r1
	strh r0, [r5, 0x3C]
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _080D8858
	movs r0, 0x1
	strh r0, [r5, 0x3A]
	adds r1, r5, 0
	adds r1, 0x43
	movs r0, 0x80
	strb r0, [r1]
_080D8858:
	adds r0, r5, 0
	bl InitAnimLinearTranslation
	ldr r0, _080D8870 @ =sub_80D8874
	str r0, [r5, 0x1C]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D886C: .4byte gAnimBankTarget
_080D8870: .4byte sub_80D8874
	thumb_func_end sub_80D8700

	thumb_func_start sub_80D8874
sub_80D8874: @ 80D8874
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x3C]
	movs r5, 0xFF
	movs r1, 0xFF
	ands r1, r0
	cmp r1, 0x1
	beq _080D8968
	cmp r1, 0x1
	bgt _080D888E
	cmp r1, 0
	beq _080D8896
	b _080D8AD0
_080D888E:
	cmp r1, 0x2
	bne _080D8894
	b _080D8A94
_080D8894:
	b _080D8AD0
_080D8896:
	adds r0, r4, 0
	bl TranslateAnimLinear
	ldr r1, _080D88C0 @ =gSineTable
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	asrs r0, 4
	ldrh r2, [r4, 0x24]
	adds r0, r2
	strh r0, [r4, 0x24]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D88C4
	ldrh r0, [r4, 0x38]
	subs r0, 0x8
	b _080D88C8
	.align 2, 0
_080D88C0: .4byte gSineTable
_080D88C4:
	ldrh r0, [r4, 0x38]
	adds r0, 0x8
_080D88C8:
	ands r0, r5
	strh r0, [r4, 0x38]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080D88D6
	b _080D8AD0
_080D88D6:
	movs r5, 0x50
	strh r5, [r4, 0x2E]
	ldr r6, _080D8928 @ =gAnimBankTarget
	ldrb r0, [r6]
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x26]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, 0x1D
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	ldr r0, _080D892C @ =gMain
	ldr r2, _080D8930 @ =0x0000043d
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080D8938
	ldr r1, _080D8934 @ =gBanksBySide
	ldrb r0, [r6]
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D8938
	movs r0, 0xCC
	strh r0, [r4, 0x38]
	b _080D893A
	.align 2, 0
_080D8928: .4byte gAnimBankTarget
_080D892C: .4byte gMain
_080D8930: .4byte 0x0000043d
_080D8934: .4byte gBanksBySide
_080D8938:
	strh r5, [r4, 0x38]
_080D893A:
	movs r0, 0
	strh r0, [r4, 0x26]
	ldr r1, _080D8964 @ =gSineTable
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	asrs r0, 3
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x38]
	adds r0, 0x2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl InitAnimLinearTranslation
	b _080D8AD0
	.align 2, 0
_080D8964: .4byte gSineTable
_080D8968:
	adds r0, r4, 0
	bl TranslateAnimLinear
	ldr r1, _080D89C8 @ =gSineTable
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r2, 0
	ldrsh r0, [r0, r2]
	asrs r0, 3
	ldrh r2, [r4, 0x24]
	adds r0, r2
	strh r0, [r4, 0x24]
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	adds r0, 0x40
	lsls r0, 1
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r0, r2]
	lsls r0, r1, 1
	adds r0, r1
	negs r0, r0
	asrs r0, 8
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldr r0, _080D89CC @ =gMain
	ldr r2, _080D89D0 @ =0x0000043d
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080D89F2
	ldrh r1, [r4, 0x38]
	adds r0, r1, 0
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	adds r3, r1, 0
	cmp r0, 0x7F
	bhi _080D89D4
	ldrh r1, [r4, 0x3C]
	lsls r1, 16
	asrs r1, 24
	b _080D89DC
	.align 2, 0
_080D89C8: .4byte gSineTable
_080D89CC: .4byte gMain
_080D89D0: .4byte 0x0000043d
_080D89D4:
	ldrh r1, [r4, 0x3C]
	lsls r1, 16
	asrs r1, 24
	adds r1, 0x1
_080D89DC:
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	adds r0, r3, 0x4
	b _080D8A12
_080D89F2:
	ldrh r0, [r4, 0x38]
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x7F
	bhi _080D8A06
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x80
	b _080D8A0C
_080D8A06:
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x8C
_080D8A0C:
	strb r0, [r1]
	ldrh r0, [r4, 0x38]
	subs r0, 0x4
_080D8A12:
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bgt _080D8AD0
	movs r2, 0
	movs r0, 0xC0
	lsls r0, 2
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x26]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, 0x4
	strh r0, [r4, 0x36]
	ldr r0, _080D8A68 @ =gMain
	ldr r1, _080D8A6C @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080D8A78
	ldr r1, _080D8A70 @ =gBanksBySide
	ldr r0, _080D8A74 @ =gAnimBankTarget
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D8A78
	movs r0, 0x80
	lsls r0, 1
	b _080D8A7A
	.align 2, 0
_080D8A68: .4byte gMain
_080D8A6C: .4byte 0x0000043d
_080D8A70: .4byte gBanksBySide
_080D8A74: .4byte gAnimBankTarget
_080D8A78:
	ldr r0, _080D8A90 @ =0x0000fff0
_080D8A7A:
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x3C]
	strh r1, [r4, 0x26]
	strh r1, [r4, 0x24]
	adds r0, r4, 0
	bl sub_8078BD4
	b _080D8AD0
	.align 2, 0
_080D8A90: .4byte 0x0000fff0
_080D8A94:
	adds r0, r4, 0
	bl TranslateAnimLinear
	lsls r0, 24
	cmp r0, 0
	beq _080D8AD0
	ldrb r0, [r4, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D8AC2
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
_080D8AC2:
	adds r0, r4, 0
	bl DestroySprite
	ldr r1, _080D8AD8 @ =gAnimVisualTaskCount
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_080D8AD0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D8AD8: .4byte gAnimVisualTaskCount
	thumb_func_end sub_80D8874

	thumb_func_start sub_80D8ADC
sub_80D8ADC: @ 80D8ADC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080D8AF0 @ =gTasks
	adds r1, r0
	ldr r0, _080D8AF4 @ =sub_80D8AF8
	str r0, [r1]
	bx lr
	.align 2, 0
_080D8AF0: .4byte gTasks
_080D8AF4: .4byte sub_80D8AF8
	thumb_func_end sub_80D8ADC

	thumb_func_start sub_80D8AF8
sub_80D8AF8: @ 80D8AF8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080D8B1C @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r5, [r4, r0]
	cmp r5, 0x1
	beq _080D8B3C
	cmp r5, 0x1
	bgt _080D8B20
	cmp r5, 0
	beq _080D8B26
	b _080D8BA0
	.align 2, 0
_080D8B1C: .4byte gTasks
_080D8B20:
	cmp r5, 0x2
	beq _080D8B92
	b _080D8BA0
_080D8B26:
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080D8BA0
	strh r5, [r4, 0x10]
	strh r5, [r4, 0x12]
	strh r5, [r4, 0xC]
	b _080D8B78
_080D8B3C:
	ldrh r1, [r4, 0x12]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _080D8B8C
	ldrb r0, [r4, 0xE]
	ldrb r1, [r4, 0xC]
	movs r3, 0x1
	bl sub_80D8BA8
	lsls r0, 24
	cmp r0, 0
	beq _080D8B5C
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
_080D8B5C:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080D8B88
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _080D8B80
_080D8B78:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080D8BA0
_080D8B80:
	ldrh r0, [r4, 0x8]
	subs r0, 0x1
	strh r0, [r4, 0x8]
	b _080D8BA0
_080D8B88:
	strh r5, [r4, 0x12]
	b _080D8BA0
_080D8B8C:
	subs r0, r1, 0x1
	strh r0, [r4, 0x12]
	b _080D8BA0
_080D8B92:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D8BA0
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080D8BA0:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80D8AF8

	thumb_func_start sub_80D8BA8
sub_80D8BA8: @ 80D8BA8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp]
	lsls r3, 24
	lsrs r3, 24
	mov r10, r3
	movs r1, 0
	str r1, [sp, 0x4]
	ldr r1, _080D8C20 @ =gUnknown_083D9DC4
	lsrs r0, 22
	adds r4, r0, r1
	ldrb r0, [r4, 0x3]
	lsls r0, 24
	asrs r0, 28
	mov r8, r0
	cmp r0, 0x2
	beq _080D8C94
	ldrh r0, [r4, 0x2]
	lsls r0, 20
	lsrs r0, 24
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080D8C94
	movs r0, 0x1
	str r0, [sp, 0x4]
	adds r0, r5, 0
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r5, 0
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r6, r0, 24
	mov r1, r8
	cmp r1, 0
	beq _080D8C24
	cmp r1, 0x1
	beq _080D8C5A
	b _080D8CA6
	.align 2, 0
_080D8C20: .4byte gUnknown_083D9DC4
_080D8C24:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_807A100
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x6
	bl __divsi3
	lsls r1, r7, 16
	asrs r1, 16
	subs r1, r0
	lsls r1, 16
	lsrs r7, r1, 16
	adds r0, r5, 0
	movs r1, 0
	bl sub_807A100
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x6
	bl __divsi3
	lsls r1, r6, 16
	asrs r1, 16
	subs r1, r0
	b _080D8C8E
_080D8C5A:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_807A100
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x6
	bl __divsi3
	lsls r1, r7, 16
	asrs r1, 16
	adds r1, r0
	lsls r1, 16
	lsrs r7, r1, 16
	adds r0, r5, 0
	movs r1, 0
	bl sub_807A100
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x6
	bl __divsi3
	lsls r1, r6, 16
	asrs r1, 16
	adds r1, r0
_080D8C8E:
	lsls r1, 16
	lsrs r6, r1, 16
	b _080D8CA6
_080D8C94:
	ldrh r0, [r4]
	lsls r0, 22
	asrs r0, 6
	lsrs r7, r0, 16
	ldr r0, [r4]
	lsls r0, 12
	asrs r0, 22
	lsls r0, 16
	lsrs r6, r0, 16
_080D8CA6:
	lsls r0, r6, 16
	asrs r0, 16
	adds r0, 0x8
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	lsls r1, r7, 16
	asrs r1, 16
	subs r1, r0
	ldr r0, _080D8D00 @ =gSpriteTemplate_83D9E3C
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x8
	negs r2, r2
	movs r3, 0x12
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x40
	beq _080D8D08
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	ldr r0, _080D8D04 @ =gSprites
	adds r4, r0
	adds r0, r4, 0
	mov r1, r9
	bl StartSpriteAffineAnim
	mov r0, sp
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x2E]
	strh r7, [r4, 0x34]
	strh r6, [r4, 0x36]
	mov r1, r9
	strh r1, [r4, 0x38]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x3A]
	mov r1, r10
	strh r1, [r4, 0x3C]
	movs r0, 0x1
	b _080D8D0A
	.align 2, 0
_080D8D00: .4byte gSpriteTemplate_83D9E3C
_080D8D04: .4byte gSprites
_080D8D08:
	movs r0, 0
_080D8D0A:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80D8BA8

	thumb_func_start sub_80D8D1C
sub_80D8D1C: @ 80D8D1C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	adds r0, 0x4
	strh r0, [r4, 0x20]
	ldrh r1, [r4, 0x22]
	adds r2, r1, 0
	adds r2, 0x8
	strh r2, [r4, 0x22]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x34
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bge _080D8D46
	lsls r0, r2, 16
	asrs r0, 16
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _080D8DF6
_080D8D46:
	movs r3, 0x2E
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	bne _080D8DC8
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D8DC8
	ldr r0, _080D8DBC @ =gBattleAnimSpriteTemplate_83D9C78
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	movs r3, 0x36
	ldrsh r2, [r4, r3]
	adds r3, r4, 0
	adds r3, 0x43
	ldrb r3, [r3]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x2E]
	cmp r0, 0x40
	beq _080D8DAA
	ldr r2, _080D8DC0 @ =gSprites
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r2, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _080D8DC4 @ =sub_80D8E00
	str r1, [r0]
	movs r3, 0x2E
	ldrsh r1, [r4, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x3A]
	strh r1, [r0, 0x3A]
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x3C]
	strh r1, [r0, 0x3C]
_080D8DAA:
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	b _080D8DF6
	.align 2, 0
_080D8DBC: .4byte gBattleAnimSpriteTemplate_83D9C78
_080D8DC0: .4byte gSprites
_080D8DC4: .4byte sub_80D8E00
_080D8DC8:
	ldr r3, _080D8DFC @ =gTasks
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
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
_080D8DF6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D8DFC: .4byte gTasks
	thumb_func_end sub_80D8D1C

	thumb_func_start sub_80D8E00
sub_80D8E00: @ 80D8E00
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bne _080D8E40
	ldr r3, _080D8E48 @ =gTasks
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
_080D8E40:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D8E48: .4byte gTasks
	thumb_func_end sub_80D8E00

	thumb_func_start unc_080B06FC
unc_080B06FC: @ 80D8E4C
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _080D8ECC @ =gAnimDisableStructPtr
	ldr r0, [r0]
	ldrb r1, [r0, 0x11]
	lsrs r0, r1, 4
	lsls r1, 28
	lsrs r1, 28
	subs r0, r1
	subs r0, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x4
	bls _080D8E6A
	movs r1, 0x4
_080D8E6A:
	adds r0, r5, 0
	bl StartSpriteAffineAnim
	adds r0, r5, 0
	movs r1, 0x1
	bl InitAnimSpritePos
	ldr r6, _080D8ED0 @ =gBattleAnimArgs
	ldrh r0, [r6, 0x8]
	strh r0, [r5, 0x2E]
	ldr r0, _080D8ED4 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080D8E92
	ldrh r0, [r6, 0x4]
	negs r0, r0
	strh r0, [r6, 0x4]
_080D8E92:
	ldr r4, _080D8ED8 @ =gAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x4]
	adds r0, r1
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x6]
	adds r0, r1
	strh r0, [r5, 0x36]
	ldrh r0, [r6, 0xA]
	strh r0, [r5, 0x38]
	adds r0, r5, 0
	bl InitAnimArcTranslation
	ldr r0, _080D8EDC @ =sub_80D8EE0
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D8ECC: .4byte gAnimDisableStructPtr
_080D8ED0: .4byte gBattleAnimArgs
_080D8ED4: .4byte gAnimBankAttacker
_080D8ED8: .4byte gAnimBankTarget
_080D8EDC: .4byte sub_80D8EE0
	thumb_func_end unc_080B06FC

	thumb_func_start sub_80D8EE0
sub_80D8EE0: @ 80D8EE0
	push {r4,lr}
	adds r4, r0, 0
	bl TranslateAnimArc
	lsls r0, 24
	cmp r0, 0
	beq _080D8F02
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, _080D8F08 @ =sub_8078600
	str r0, [r4, 0x1C]
	ldr r1, _080D8F0C @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
_080D8F02:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D8F08: .4byte sub_8078600
_080D8F0C: .4byte DestroyAnimSprite
	thumb_func_end sub_80D8EE0

	thumb_func_start sub_80D8F10
sub_80D8F10: @ 80D8F10
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x8
	ldr r3, _080D8F64 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080D8F68 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8078764
	bl Random
	movs r5, 0xFF
	ands r5, r0
	movs r0, 0x80
	lsls r0, 1
	adds r6, r0, 0
	orrs r5, r6
	bl Random
	ldr r1, _080D8F6C @ =0x000001ff
	ands r1, r0
	adds r0, r1, 0
	cmp r0, 0xFF
	ble _080D8F56
	subs r0, r6, r0
	lsls r0, 16
	lsrs r1, r0, 16
_080D8F56:
	strh r5, [r4, 0x30]
	strh r1, [r4, 0x32]
	ldr r0, _080D8F70 @ =sub_80D8F74
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D8F64: .4byte 0x000003ff
_080D8F68: .4byte 0xfffffc00
_080D8F6C: .4byte 0x000001ff
_080D8F70: .4byte sub_80D8F74
	thumb_func_end sub_80D8F10

	thumb_func_start sub_80D8F74
sub_80D8F74: @ 80D8F74
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x34]
	adds r3, r0, r1
	strh r3, [r2, 0x34]
	ldrh r1, [r2, 0x32]
	ldrh r4, [r2, 0x36]
	adds r1, r4
	strh r1, [r2, 0x36]
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _080D8F98
	lsls r0, r3, 16
	asrs r0, 24
	negs r0, r0
	b _080D8F9C
_080D8F98:
	lsls r0, r3, 16
	asrs r0, 24
_080D8F9C:
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r2, 0x26]
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x15
	bne _080D8FBA
	adds r0, r2, 0
	bl DestroyAnimSprite
_080D8FBA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D8F74

	thumb_func_start sub_80D8FC0
sub_80D8FC0: @ 80D8FC0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080D8FE8 @ =gBattleAnimArgs
	ldrb r3, [r1]
	lsls r3, 1
	adds r3, r1
	ldr r1, _080D8FEC @ =gAnimDisableStructPtr
	ldr r1, [r1]
	ldrb r1, [r1, 0x11]
	lsrs r2, r1, 4
	lsls r1, 28
	lsrs r1, 28
	subs r2, r1
	subs r2, 0x1
	strh r2, [r3]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080D8FE8: .4byte gBattleAnimArgs
_080D8FEC: .4byte gAnimDisableStructPtr
	thumb_func_end sub_80D8FC0
	
	.align 2, 0 @ Don't pad with nop.
