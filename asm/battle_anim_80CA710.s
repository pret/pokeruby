	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80D2ABC
sub_80D2ABC: @ 80D2ABC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D2AF6
	ldr r1, _080D2BB8 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
	ldr r0, _080D2BBC @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	bl sub_8079E90
	subs r0, 0x1
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	movs r0, 0x1
	strh r0, [r4, 0x32]
_080D2AF6:
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x2E]
	adds r0, r2
	strh r0, [r4, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	lsls r1, r0, 2
	adds r0, r1, 0
	cmp r1, 0
	bge _080D2B0C
	adds r0, 0xFF
_080D2B0C:
	asrs r0, 8
	lsls r0, 8
	subs r0, r1, r0
	strh r0, [r4, 0x30]
	lsls r0, 16
	cmp r0, 0
	bge _080D2B1E
	movs r0, 0
	strh r0, [r4, 0x30]
_080D2B1E:
	movs r0, 0x30
	ldrsh r2, [r4, r0]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _080D2B2C
	adds r0, 0x3
_080D2B2C:
	asrs r0, 2
	movs r1, 0x1E
	subs r1, r0
	adds r0, r2, 0
	bl Cos
	strh r0, [r4, 0x24]
	movs r0, 0x30
	ldrsh r2, [r4, r0]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _080D2B48
	adds r0, 0x7
_080D2B48:
	asrs r0, 3
	movs r1, 0xA
	subs r1, r0
	adds r0, r2, 0
	bl Sin
	strh r0, [r4, 0x26]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0x80
	ble _080D2B6C
	ldrh r1, [r4, 0x32]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080D2B6C
	ldr r0, _080D2BC0 @ =0x0000ffff
	strh r0, [r4, 0x32]
_080D2B6C:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D2B80
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bge _080D2B80
	movs r0, 0x1
	strh r0, [r4, 0x32]
_080D2B80:
	ldrh r0, [r4, 0x34]
	adds r1, r0, 0x1
	strh r1, [r4, 0x34]
	subs r0, 0x9
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x46
	bls _080D2BC4
	movs r0, 0x2E
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
	b _080D2BD2
	.align 2, 0
_080D2BB8: .4byte gBattleAnimArgs
_080D2BBC: .4byte gBattleAnimBankTarget
_080D2BC0: .4byte 0x0000ffff
_080D2BC4:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080D2BD2:
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0x5A
	ble _080D2BE0
	adds r0, r4, 0
	bl move_anim_8072740
_080D2BE0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D2ABC

	thumb_func_start sub_80D2BE8
sub_80D2BE8: @ 80D2BE8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D2C1C
	ldr r1, _080D2C18 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrb r1, [r1, 0x4]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080D2C30
	.align 2, 0
_080D2C18: .4byte gBattleAnimArgs
_080D2C1C:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080D2C30
	adds r0, r4, 0
	bl move_anim_8072740
_080D2C30:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D2BE8

	thumb_func_start sub_80D2C38
sub_80D2C38: @ 80D2C38
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r1, _080D2C50 @ =gBattleAnimArgs
	movs r2, 0x4
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080D2C54
	adds r0, r5, 0
	bl move_anim_8072740
	b _080D2CB8
	.align 2, 0
_080D2C50: .4byte gBattleAnimArgs
_080D2C54:
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080D2C64
	ldr r4, _080D2C60 @ =gBattleAnimBankAttacker
	b _080D2C66
	.align 2, 0
_080D2C60: .4byte gBattleAnimBankAttacker
_080D2C64:
	ldr r4, _080D2C94 @ =gBattleAnimBankTarget
_080D2C66:
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r0, _080D2C98 @ =gBattleAnimArgs
	movs r2, 0x2
	ldrsh r1, [r0, r2]
	adds r2, r0, 0
	cmp r1, 0
	bne _080D2C9C
	ldrh r0, [r5, 0x20]
	adds r0, 0x20
	b _080D2CA0
	.align 2, 0
_080D2C94: .4byte gBattleAnimBankTarget
_080D2C98: .4byte gBattleAnimArgs
_080D2C9C:
	ldrh r0, [r5, 0x20]
	subs r0, 0x20
_080D2CA0:
	strh r0, [r5, 0x20]
	ldrh r0, [r2, 0x4]
	strh r0, [r5, 0x2E]
	ldrh r1, [r2, 0x2]
	strh r1, [r5, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	ldr r0, _080D2CC0 @ =sub_80D2CC4
	str r0, [r5, 0x1C]
_080D2CB8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D2CC0: .4byte sub_80D2CC4
	thumb_func_end sub_80D2C38

	thumb_func_start sub_80D2CC4
sub_80D2CC4: @ 80D2CC4
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080D2CF4
	ldrh r0, [r2, 0x2E]
	subs r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	cmp r0, 0
	beq _080D2CEE
	ldrh r1, [r2, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r2, 0
	bl StartSpriteAnim
	b _080D2CF4
_080D2CEE:
	adds r0, r2, 0
	bl move_anim_8072740
_080D2CF4:
	pop {r0}
	bx r0
	thumb_func_end sub_80D2CC4

	thumb_func_start sub_80D2CF8
sub_80D2CF8: @ 80D2CF8
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _080D2D2C @ =gBattleAnimArgs
	ldrb r0, [r0]
	bl GetAnimBankSpriteId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _080D2D30 @ =gTasks
	adds r4, r0
	ldr r2, _080D2D34 @ =gUnknown_083D7CA8
	adds r0, r4, 0
	bl sub_80798F4
	ldr r0, _080D2D38 @ =sub_80D2D3C
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D2D2C: .4byte gBattleAnimArgs
_080D2D30: .4byte gTasks
_080D2D34: .4byte gUnknown_083D7CA8
_080D2D38: .4byte sub_80D2D3C
	thumb_func_end sub_80D2CF8

	thumb_func_start sub_80D2D3C
sub_80D2D3C: @ 80D2D3C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080D2D64 @ =gTasks
	adds r0, r1
	bl sub_807992C
	lsls r0, 24
	cmp r0, 0
	bne _080D2D5C
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080D2D5C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D2D64: .4byte gTasks
	thumb_func_end sub_80D2D3C

	thumb_func_start sub_80D2D68
sub_80D2D68: @ 80D2D68
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r0, _080D2D7C @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080D2D84
	ldr r0, _080D2D80 @ =gBattleAnimBankAttacker
	b _080D2D86
	.align 2, 0
_080D2D7C: .4byte gBattleAnimArgs
_080D2D80: .4byte gBattleAnimBankAttacker
_080D2D84:
	ldr r0, _080D2E1C @ =gBattleAnimBankTarget
_080D2D86:
	ldrb r6, [r0]
	adds r0, r6, 0
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080D2DA0
	ldr r1, _080D2E20 @ =gBattleAnimArgs
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1, 0x2]
_080D2DA0:
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	ldr r7, _080D2E20 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r3, [r7, 0x2]
	adds r0, r3
	movs r4, 0
	strh r0, [r5, 0x20]
	adds r0, r6, 0
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r7, 0x4]
	adds r0, r1
	strh r0, [r5, 0x22]
	strh r4, [r5, 0x2E]
	ldrh r1, [r5, 0x20]
	lsls r1, 3
	strh r1, [r5, 0x30]
	lsls r0, 3
	strh r0, [r5, 0x32]
	movs r2, 0x2
	ldrsh r0, [r7, r2]
	lsls r0, 3
	cmp r0, 0
	bge _080D2DE0
	adds r0, 0x7
_080D2DE0:
	asrs r0, 3
	strh r0, [r5, 0x34]
	movs r3, 0x4
	ldrsh r0, [r7, r3]
	lsls r0, 3
	cmp r0, 0
	bge _080D2DF0
	adds r0, 0x7
_080D2DF0:
	asrs r0, 3
	strh r0, [r5, 0x36]
	ldrh r2, [r5, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	movs r3, 0x6
	ldrsh r0, [r7, r3]
	lsls r0, 4
	adds r1, r0
	ldr r3, _080D2E24 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080D2E28 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	ldr r0, _080D2E2C @ =sub_80D2E30
	str r0, [r5, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D2E1C: .4byte gBattleAnimBankTarget
_080D2E20: .4byte gBattleAnimArgs
_080D2E24: .4byte 0x000003ff
_080D2E28: .4byte 0xfffffc00
_080D2E2C: .4byte sub_80D2E30
	thumb_func_end sub_80D2D68

	thumb_func_start sub_80D2E30
sub_80D2E30: @ 80D2E30
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x34]
	ldrh r1, [r2, 0x30]
	adds r0, r1
	strh r0, [r2, 0x30]
	ldrh r1, [r2, 0x36]
	ldrh r3, [r2, 0x32]
	adds r1, r3
	strh r1, [r2, 0x32]
	lsls r0, 16
	asrs r0, 19
	strh r0, [r2, 0x20]
	lsls r1, 16
	asrs r1, 19
	strh r1, [r2, 0x22]
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080D2E64
	adds r0, r2, 0
	bl move_anim_8072740
_080D2E64:
	pop {r0}
	bx r0
	thumb_func_end sub_80D2E30

	thumb_func_start sub_80D2E68
sub_80D2E68: @ 80D2E68
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D2E8A
	ldr r0, _080D2EC4 @ =gBattleAnimArgs
	ldrh r1, [r0]
	movs r0, 0x78
	subs r0, r1
	strh r0, [r4, 0x30]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_080D2E8A:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080D2EA8
	ldrb r0, [r4, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	movs r1, 0
	bl sub_8079108
_080D2EA8:
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	adds r0, 0x50
	cmp r1, r0
	bne _080D2EBC
	adds r0, r4, 0
	bl move_anim_8072740
_080D2EBC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D2EC4: .4byte gBattleAnimArgs
	thumb_func_end sub_80D2E68

	thumb_func_start sub_80D2EC8
sub_80D2EC8: @ 80D2EC8
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080D2EF6
	movs r5, 0x78
	strh r5, [r6, 0x20]
	ldr r4, _080D2F78 @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r0, [r4, r2]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	subs r0, 0xF
	strh r0, [r6, 0x22]
	ldrb r1, [r4, 0x2]
	adds r0, r6, 0
	bl StartSpriteAnim
	strh r5, [r6, 0x38]
	ldrh r0, [r4, 0x4]
	strh r0, [r6, 0x34]
_080D2EF6:
	ldrh r0, [r6, 0x2E]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r6, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r6, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r6, 0x30]
	movs r2, 0x2E
	ldrsh r0, [r6, r2]
	lsls r4, r0, 1
	adds r4, r0
	ldrh r0, [r6, 0x34]
	adds r4, r0
	movs r2, 0xFF
	ldrh r0, [r6, 0x3A]
	adds r0, 0xA
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r6, 0x3A]
	ands r4, r2
	adds r0, r4, 0
	movs r1, 0x64
	bl Cos
	strh r0, [r6, 0x24]
	adds r0, r4, 0
	movs r1, 0xA
	bl Sin
	adds r4, r0, 0
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	movs r1, 0x4
	bl Cos
	ldrh r2, [r6, 0x30]
	adds r4, r2
	adds r0, r4
	strh r0, [r6, 0x26]
	movs r0, 0x2E
	ldrsh r1, [r6, r0]
	movs r2, 0x38
	ldrsh r0, [r6, r2]
	cmp r1, r0
	ble _080D2F72
	ldr r0, _080D2F7C @ =sub_80D2F80
	str r0, [r6, 0x1C]
	strh r5, [r6, 0x2E]
	adds r0, r6, 0
	bl oamt_add_pos2_onto_pos1
	movs r0, 0x5
	strh r0, [r6, 0x32]
	strh r5, [r6, 0x36]
	strh r5, [r6, 0x34]
	adds r0, r6, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_080D2F72:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D2F78: .4byte gBattleAnimArgs
_080D2F7C: .4byte sub_80D2F80
	thumb_func_end sub_80D2EC8

	thumb_func_start sub_80D2F80
sub_80D2F80: @ 80D2F80
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	ble _080D2F9A
	movs r0, 0
	strh r0, [r1, 0x2E]
	ldr r0, _080D2FA0 @ =sub_80D2FA4
	str r0, [r1, 0x1C]
_080D2F9A:
	pop {r0}
	bx r0
	.align 2, 0
_080D2FA0: .4byte sub_80D2FA4
	thumb_func_end sub_80D2F80

	thumb_func_start sub_80D2FA4
sub_80D2FA4: @ 80D2FA4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x32]
	ldrh r2, [r4, 0x34]
	adds r0, r1, r2
	strh r0, [r4, 0x34]
	strh r0, [r4, 0x26]
	adds r1, 0x1
	strh r1, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x30
	ble _080D2FCE
	lsls r0, r1, 16
	cmp r0, 0
	ble _080D2FCE
	ldrh r0, [r4, 0x36]
	subs r1, r0, 0x5
	strh r1, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x36]
_080D2FCE:
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	ble _080D3000
	movs r2, 0x32
	ldrsh r1, [r4, r2]
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
	adds r0, r4, 0
	bl move_anim_8072740
_080D3000:
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bne _080D300E
	adds r0, r4, 0
	bl move_anim_8072740
_080D300E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D2FA4

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

	thumb_func_start sub_80D30AC
sub_80D30AC: @ 80D30AC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080D30C8 @ =gBattleAnimArgs
	ldr r1, _080D30CC @ =gDisableStructMoveAnim
	ldr r1, [r1]
	ldrb r2, [r1, 0x10]
	movs r1, 0x1
	ands r1, r2
	strh r1, [r3, 0xE]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080D30C8: .4byte gBattleAnimArgs
_080D30CC: .4byte gDisableStructMoveAnim
	thumb_func_end sub_80D30AC

	thumb_func_start update_fury_cutter_counter_copy
update_fury_cutter_counter_copy: @ 80D30D0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080D30E8 @ =gBattleAnimArgs
	ldr r1, _080D30EC @ =gDisableStructMoveAnim
	ldr r1, [r1]
	ldrb r1, [r1, 0x10]
	strh r1, [r2, 0xE]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080D30E8: .4byte gBattleAnimArgs
_080D30EC: .4byte gDisableStructMoveAnim
	thumb_func_end update_fury_cutter_counter_copy

	thumb_func_start sub_80D30F0
sub_80D30F0: @ 80D30F0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	ldr r1, _080D3178 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080D3118
	ldr r1, _080D317C @ =gBattleAnimArgs
	ldrh r0, [r1]
	strh r0, [r5, 0xA]
	ldrh r0, [r1, 0x2]
	strh r0, [r5, 0xC]
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0xE]
_080D3118:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r2, 0x8
	ldrsh r0, [r5, r2]
	movs r2, 0xC
	ldrsh r1, [r5, r2]
	bl __modsi3
	cmp r0, 0x1
	bne _080D3160
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF0
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x50
	bl __umodsi3
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _080D3180 @ =gSpriteTemplate_83D9130
	adds r1, r4, 0
	movs r3, 0x4
	bl CreateSprite
_080D3160:
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	movs r2, 0xE
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _080D3172
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080D3172:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D3178: .4byte gTasks
_080D317C: .4byte gBattleAnimArgs
_080D3180: .4byte gSpriteTemplate_83D9130
	thumb_func_end sub_80D30F0

	thumb_func_start sub_80D3184
sub_80D3184: @ 80D3184
	ldr r1, _080D318C @ =sub_80D3190
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080D318C: .4byte sub_80D3190
	thumb_func_end sub_80D3184

	thumb_func_start sub_80D3190
sub_80D3190: @ 80D3190
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xD
	bgt _080D31AE
	ldrh r0, [r2, 0x24]
	adds r0, 0x1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x26]
	adds r0, 0x4
	strh r0, [r2, 0x26]
_080D31AE:
	adds r0, r2, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080D31C2
	adds r0, r2, 0
	bl DestroySprite
_080D31C2:
	pop {r0}
	bx r0
	thumb_func_end sub_80D3190

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

	thumb_func_start sub_80D37FC
sub_80D37FC: @ 80D37FC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8078764
	ldr r0, _080D382C @ =gBattleAnimArgs
	ldrh r1, [r0, 0x8]
	strh r1, [r4, 0x2E]
	ldrh r0, [r0, 0x4]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	adds r1, r0
	strh r1, [r4, 0x36]
	ldr r0, _080D3830 @ =sub_8078B34
	str r0, [r4, 0x1C]
	ldr r1, _080D3834 @ =move_anim_8072740
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D382C: .4byte gBattleAnimArgs
_080D3830: .4byte sub_8078B34
_080D3834: .4byte move_anim_8072740
	thumb_func_end sub_80D37FC

	thumb_func_start sub_80D3838
sub_80D3838: @ 80D3838
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080D3850 @ =gBattleAnimArgs
	movs r1, 0x6
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080D3854
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8078764
	b _080D385C
	.align 2, 0
_080D3850: .4byte gBattleAnimArgs
_080D3854:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80787B0
_080D385C:
	ldr r0, _080D386C @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x3C]
	ldr r0, _080D3870 @ =sub_80D3874
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D386C: .4byte gBattleAnimArgs
_080D3870: .4byte sub_80D3874
	thumb_func_end sub_80D3838

	thumb_func_start sub_80D3874
sub_80D3874: @ 80D3874
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0xB
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x4
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x30]
	adds r0, 0x30
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3C]
	subs r0, 0x1
	strh r0, [r4, 0x3C]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080D38B4
	adds r0, r4, 0
	bl move_anim_8072740
_080D38B4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D3874

	thumb_func_start sub_80D38BC
sub_80D38BC: @ 80D38BC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r1, _080D398C @ =REG_BLDCNT
	ldr r2, _080D3990 @ =0x00003f42
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r3, 0x80
	lsls r3, 5
	adds r0, r3, 0
	strh r0, [r1]
	ldr r2, _080D3994 @ =REG_BG1CNT
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r2, 0x1]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2, 0x1]
	mov r0, sp
	bl sub_8078914
	ldr r2, [sp]
	movs r3, 0x80
	lsls r3, 6
	add r6, sp, 0x10
	add r0, sp, 0xC
	mov r12, r0
	movs r5, 0
	ldr r1, _080D3998 @ =0x040000d4
	movs r4, 0x80
	lsls r4, 5
	mov r8, r6
	ldr r7, _080D399C @ =0x85000400
	movs r0, 0x85
	lsls r0, 24
	mov r9, r0
_080D3920:
	str r5, [sp, 0x10]
	mov r0, r8
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080D3920
	str r5, [sp, 0x10]
	str r6, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r9
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0
	mov r3, r12
	strb r0, [r3]
	strb r0, [r3]
	ldr r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x10]
	ldr r0, _080D3998 @ =0x040000d4
	str r6, [r0]
	str r1, [r0, 0x4]
	ldr r1, _080D399C @ =0x85000400
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080D39B8
	ldr r2, _080D3994 @ =REG_BG1CNT
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080D39A0 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080D39A8
	ldr r0, _080D39A4 @ =gUnknown_08E70968
	b _080D39AA
	.align 2, 0
_080D398C: .4byte REG_BLDCNT
_080D3990: .4byte 0x00003f42
_080D3994: .4byte REG_BG1CNT
_080D3998: .4byte 0x040000d4
_080D399C: .4byte 0x85000400
_080D39A0: .4byte gBattleAnimBankAttacker
_080D39A4: .4byte gUnknown_08E70968
_080D39A8:
	ldr r0, _080D39B4 @ =gUnknown_08E70C38
_080D39AA:
	ldr r1, [sp, 0x4]
	bl LZDecompressVram
	b _080D39CE
	.align 2, 0
_080D39B4: .4byte gUnknown_08E70C38
_080D39B8:
	ldr r0, _080D39F0 @ =gUnknown_08E70F0C
	ldr r1, [sp, 0x4]
	bl LZDecompressVram
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0x1
	bl sub_80763FC
_080D39CE:
	ldr r0, _080D39F4 @ =gBattleAnimBackgroundImage_Surf
	ldr r1, [sp]
	bl LZDecompressVram
	ldr r0, _080D39F8 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080D3A00
	ldr r0, _080D39FC @ =gBattleAnimBackgroundPalette_Surf
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	b _080D3A0E
	.align 2, 0
_080D39F0: .4byte gUnknown_08E70F0C
_080D39F4: .4byte gBattleAnimBackgroundImage_Surf
_080D39F8: .4byte gBattleAnimArgs
_080D39FC: .4byte gBattleAnimBackgroundPalette_Surf
_080D3A00:
	ldr r0, _080D3A78 @ =gBattleAnimBackgroundImageMuddyWater_Pal
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
_080D3A0E:
	ldr r0, _080D3A7C @ =sub_80D3D68
	ldr r4, _080D3A80 @ =gTasks
	mov r2, r10
	lsls r5, r2, 2
	adds r1, r5, r2
	lsls r1, 3
	adds r6, r1, r4
	ldrb r1, [r6, 0x7]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r3, 0
	mov r9, r3
	mov r0, r8
	strh r0, [r6, 0x26]
	mov r1, r8
	lsls r0, r1, 2
	add r0, r8
	lsls r0, 3
	adds r7, r0, r4
	mov r2, r9
	strh r2, [r7, 0x8]
	movs r0, 0x80
	lsls r0, 5
	strh r0, [r7, 0xA]
	strh r0, [r7, 0xC]
	bl NotInBattle
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _080D3A94
	ldr r3, _080D3A84 @ =0x0000ffb0
	adds r0, r3, 0
	ldr r1, _080D3A88 @ =gUnknown_030042C0
	strh r0, [r1]
	ldr r2, _080D3A8C @ =0x0000ffd0
	adds r0, r2, 0
	ldr r3, _080D3A90 @ =gUnknown_030041B4
	strh r0, [r3]
	movs r0, 0x2
	strh r0, [r6, 0x8]
	movs r0, 0x1
	strh r0, [r6, 0xA]
	mov r0, r9
	strh r0, [r7, 0xE]
	b _080D3AEE
	.align 2, 0
_080D3A78: .4byte gBattleAnimBackgroundImageMuddyWater_Pal
_080D3A7C: .4byte sub_80D3D68
_080D3A80: .4byte gTasks
_080D3A84: .4byte 0x0000ffb0
_080D3A88: .4byte gUnknown_030042C0
_080D3A8C: .4byte 0x0000ffd0
_080D3A90: .4byte gUnknown_030041B4
_080D3A94:
	ldr r0, _080D3AC4 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1
	bne _080D3AD8
	ldr r2, _080D3AC8 @ =0x0000ff20
	adds r0, r2, 0
	ldr r3, _080D3ACC @ =gUnknown_030042C0
	strh r0, [r3]
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	ldr r3, _080D3AD0 @ =gUnknown_030041B4
	strh r0, [r3]
	movs r0, 0x2
	strh r0, [r6, 0x8]
	ldr r0, _080D3AD4 @ =0x0000ffff
	strh r0, [r6, 0xA]
	strh r1, [r7, 0xE]
	b _080D3AEE
	.align 2, 0
_080D3AC4: .4byte gBattleAnimBankAttacker
_080D3AC8: .4byte 0x0000ff20
_080D3ACC: .4byte gUnknown_030042C0
_080D3AD0: .4byte gUnknown_030041B4
_080D3AD4: .4byte 0x0000ffff
_080D3AD8:
	ldr r0, _080D3B1C @ =gUnknown_030042C0
	strh r4, [r0]
	ldr r1, _080D3B20 @ =0x0000ffd0
	adds r0, r1, 0
	ldr r2, _080D3B24 @ =gUnknown_030041B4
	strh r0, [r2]
	ldr r0, _080D3B28 @ =0x0000fffe
	strh r0, [r6, 0x8]
	movs r0, 0x1
	strh r0, [r6, 0xA]
	strh r4, [r7, 0xE]
_080D3AEE:
	ldr r1, _080D3B2C @ =REG_BG1HOFS
	ldr r3, _080D3B1C @ =gUnknown_030042C0
	ldrh r0, [r3]
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080D3B24 @ =gUnknown_030041B4
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r1, _080D3B30 @ =gTasks
	mov r3, r8
	lsls r0, r3, 2
	add r0, r8
	lsls r0, 3
	adds r2, r0, r1
	movs r3, 0xE
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _080D3B34
	movs r0, 0x30
	strh r0, [r2, 0x10]
	movs r0, 0x70
	b _080D3B38
	.align 2, 0
_080D3B1C: .4byte gUnknown_030042C0
_080D3B20: .4byte 0x0000ffd0
_080D3B24: .4byte gUnknown_030041B4
_080D3B28: .4byte 0x0000fffe
_080D3B2C: .4byte REG_BG1HOFS
_080D3B30: .4byte gTasks
_080D3B34:
	movs r0, 0
	strh r0, [r2, 0x10]
_080D3B38:
	strh r0, [r2, 0x12]
	mov r2, r10
	adds r0, r5, r2
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0, 0x14]
	ldr r1, _080D3B5C @ =sub_80D3B60
	str r1, [r0]
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D3B5C: .4byte sub_80D3B60
	thumb_func_end sub_80D38BC

	thumb_func_start sub_80D3B60
sub_80D3B60: @ 80D3B60
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _080D3D44 @ =gTasks
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r4, 0x8]
	ldr r1, _080D3D48 @ =gUnknown_030042C0
	ldrh r1, [r1]
	adds r0, r1
	ldr r2, _080D3D48 @ =gUnknown_030042C0
	strh r0, [r2]
	ldrh r0, [r4, 0xA]
	ldr r3, _080D3D4C @ =gUnknown_030041B4
	ldrh r3, [r3]
	adds r0, r3
	ldr r1, _080D3D4C @ =gUnknown_030041B4
	strh r0, [r1]
	add r5, sp, 0x4
	adds r0, r5, 0
	bl sub_8078914
	ldrh r0, [r4, 0xA]
	ldrh r2, [r4, 0xC]
	adds r0, r2
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	mov r10, r5
	cmp r0, 0x4
	bne _080D3C02
	ldr r1, _080D3D50 @ =gPlttBufferFaded
	ldrb r0, [r5, 0x8]
	lsls r0, 4
	adds r0, 0x7
	lsls r0, 1
	adds r0, r1
	ldrh r6, [r0]
	movs r2, 0x6
	adds r5, r1, 0
	adds r3, r5, 0
	mov r4, r10
_080D3BC8:
	ldrb r0, [r4, 0x8]
	lsls r0, 4
	adds r1, r2, 0x1
	adds r0, r1
	lsls r1, r0, 1
	adds r1, r3
	subs r0, 0x1
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	subs r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _080D3BC8
	mov r3, r10
	ldrb r0, [r3, 0x8]
	lsls r0, 4
	adds r0, 0x1
	lsls r0, 1
	adds r0, r5
	strh r6, [r0]
	ldr r1, _080D3D44 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0x12]
_080D3C02:
	ldr r1, _080D3D44 @ =gTasks
	lsls r2, r7, 2
	adds r0, r2, r7
	lsls r0, 3
	adds r3, r0, r1
	ldrh r0, [r3, 0x14]
	adds r0, 0x1
	strh r0, [r3, 0x14]
	lsls r0, 16
	asrs r0, 16
	adds r4, r1, 0
	str r2, [sp, 0x14]
	cmp r0, 0x1
	ble _080D3C70
	movs r0, 0
	strh r0, [r3, 0x14]
	ldrh r0, [r3, 0xE]
	adds r2, r0, 0x1
	strh r2, [r3, 0xE]
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0xD
	bgt _080D3C4C
	movs r1, 0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	movs r0, 0x10
	subs r0, r2
	lsls r0, 8
	orrs r2, r0
	strh r2, [r1, 0xA]
	ldrh r0, [r3, 0x10]
	adds r0, 0x1
	strh r0, [r3, 0x10]
_080D3C4C:
	movs r2, 0xE
	ldrsh r0, [r3, r2]
	cmp r0, 0x36
	ble _080D3C70
	ldrh r2, [r3, 0x10]
	subs r2, 0x1
	strh r2, [r3, 0x10]
	movs r1, 0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	movs r0, 0x10
	subs r0, r2
	lsls r0, 8
	orrs r2, r0
	strh r2, [r1, 0xA]
_080D3C70:
	ldr r2, [sp, 0x14]
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r4
	movs r3, 0x26
	ldrsh r1, [r0, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	ldrh r1, [r0, 0xA]
	movs r0, 0x1F
	ands r0, r1
	cmp r0, 0
	bne _080D3D32
	ldr r2, [sp, 0x4]
	movs r3, 0x80
	lsls r3, 6
	add r6, sp, 0x10
	movs r5, 0
	ldr r1, _080D3D54 @ =0x040000d4
	movs r4, 0x80
	lsls r4, 5
	mov r8, r6
	ldr r0, _080D3D58 @ =0x85000400
	mov r12, r0
	movs r0, 0x85
	lsls r0, 24
	mov r9, r0
_080D3CAA:
	str r5, [sp, 0x10]
	mov r0, r8
	str r0, [r1]
	str r2, [r1, 0x4]
	mov r0, r12
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080D3CAA
	str r5, [sp, 0x10]
	str r6, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r9
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r0, sp
	movs r1, 0
	strb r1, [r0]
	strb r1, [r0]
	mov r3, r10
	ldr r1, [r3, 0x4]
	movs r4, 0
	str r4, [sp, 0x10]
	ldr r0, _080D3D54 @ =0x040000d4
	str r6, [r0]
	str r1, [r0, 0x4]
	ldr r1, _080D3D58 @ =0x85000400
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080D3D02
	ldr r2, _080D3D5C @ =REG_BG1CNT
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080D3D02:
	ldr r0, _080D3D48 @ =gUnknown_030042C0
	strh r4, [r0]
	ldr r1, _080D3D4C @ =gUnknown_030041B4
	strh r4, [r1]
	ldr r0, _080D3D60 @ =REG_BLDCNT
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	ldr r2, _080D3D44 @ =gTasks
	ldr r3, [sp, 0x14]
	adds r0, r3, r7
	lsls r0, 3
	adds r0, r2
	movs r3, 0x26
	ldrsh r1, [r0, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _080D3D64 @ =0x0000ffff
	strh r1, [r0, 0x26]
	adds r0, r7, 0
	bl DestroyAnimVisualTask
_080D3D32:
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D3D44: .4byte gTasks
_080D3D48: .4byte gUnknown_030042C0
_080D3D4C: .4byte gUnknown_030041B4
_080D3D50: .4byte gPlttBufferFaded
_080D3D54: .4byte 0x040000d4
_080D3D58: .4byte 0x85000400
_080D3D5C: .4byte REG_BG1CNT
_080D3D60: .4byte REG_BLDCNT
_080D3D64: .4byte 0x0000ffff
	thumb_func_end sub_80D3B60

	thumb_func_start sub_80D3D68
sub_80D3D68: @ 80D3D68
	push {r4-r7,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _080D3D90 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080D3D84
	b _080D3EBC
_080D3D84:
	cmp r0, 0x1
	bgt _080D3D94
	cmp r0, 0
	beq _080D3D9C
	b _080D4032
	.align 2, 0
_080D3D90: .4byte gTasks
_080D3D94:
	cmp r0, 0x2
	bne _080D3D9A
	b _080D3F88
_080D3D9A:
	b _080D4032
_080D3D9C:
	movs r3, 0
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	ldr r1, _080D3E6C @ =gUnknown_03004DE0
	mov r12, r1
	cmp r3, r0
	bge _080D3DDA
	mov r7, r12
	movs r5, 0xF0
	lsls r5, 3
	add r5, r12
	ldr r6, _080D3E70 @ =0x0000ffff
_080D3DB4:
	lsls r2, r3, 16
	asrs r2, 16
	lsls r1, r2, 1
	adds r3, r1, r7
	adds r1, r5
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	ldrh r1, [r4, 0xC]
	adds r0, r6, 0
	ands r0, r1
	strh r0, [r3]
	adds r2, 0x1
	lsls r2, 16
	lsrs r3, r2, 16
	asrs r2, 16
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r2, r0
	blt _080D3DB4
_080D3DDA:
	ldrh r3, [r4, 0x10]
	lsls r2, r3, 16
	asrs r1, r2, 16
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _080D3E14
	ldr r5, _080D3E6C @ =gUnknown_03004DE0
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r5, r0
	ldr r7, _080D3E70 @ =0x0000ffff
_080D3DF2:
	asrs r2, 16
	lsls r1, r2, 1
	adds r3, r1, r5
	adds r1, r6
	ldrh r0, [r4, 0xA]
	strh r0, [r1]
	ldrh r1, [r4, 0xA]
	adds r0, r7, 0
	ands r0, r1
	strh r0, [r3]
	adds r2, 0x1
	lsls r2, 16
	asrs r1, r2, 16
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _080D3DF2
_080D3E14:
	ldrh r3, [r4, 0x12]
	lsls r2, r3, 16
	asrs r0, r2, 16
	cmp r0, 0x9F
	bgt _080D3E4A
	ldr r5, _080D3E6C @ =gUnknown_03004DE0
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r5, r0
	ldr r7, _080D3E70 @ =0x0000ffff
_080D3E28:
	asrs r2, 16
	lsls r1, r2, 1
	adds r3, r1, r5
	adds r1, r6
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	ldrh r1, [r4, 0xC]
	adds r0, r7, 0
	ands r0, r1
	strh r0, [r3]
	adds r2, 0x1
	lsls r2, 16
	lsrs r3, r2, 16
	lsls r2, r3, 16
	asrs r0, r2, 16
	cmp r0, 0x9F
	ble _080D3E28
_080D3E4A:
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D3E74
	lsls r0, r3, 16
	asrs r0, 15
	mov r3, r12
	adds r2, r0, r3
	movs r1, 0xF0
	lsls r1, 3
	add r1, r12
	adds r0, r1
	ldrh r1, [r4, 0xA]
	strh r1, [r0]
	ldrh r0, [r4, 0xA]
	b _080D3E8A
	.align 2, 0
_080D3E6C: .4byte gUnknown_03004DE0
_080D3E70: .4byte 0x0000ffff
_080D3E74:
	lsls r0, r3, 16
	asrs r0, 15
	mov r1, r12
	adds r2, r0, r1
	movs r1, 0xF0
	lsls r1, 3
	add r1, r12
	adds r0, r1
	ldrh r1, [r4, 0xC]
	strh r1, [r0]
	ldrh r0, [r4, 0xC]
_080D3E8A:
	strh r0, [r2]
	ldr r0, _080D3EB4 @ =REG_BLDALPHA
	str r0, [sp]
	ldr r0, _080D3EB8 @ =0xa2600001
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
	bl sub_80895F8
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080D4032
	.align 2, 0
_080D3EB4: .4byte REG_BLDALPHA
_080D3EB8: .4byte 0xa2600001
_080D3EBC:
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	cmp r1, 0
	bne _080D3ED4
	ldrh r0, [r4, 0x10]
	subs r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	cmp r0, 0
	bgt _080D3EE8
	strh r1, [r4, 0x10]
	b _080D3EE2
_080D3ED4:
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6F
	ble _080D3EE8
_080D3EE2:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080D3EE8:
	movs r3, 0
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	bge _080D3F1C
	ldr r6, _080D3F80 @ =gUnknown_03004DE0
	ldr r5, _080D3F84 @ =gUnknown_03004DC0
_080D3EF6:
	lsls r1, r3, 16
	asrs r1, 16
	lsls r3, r1, 1
	ldrb r2, [r5, 0x14]
	lsls r0, r2, 4
	subs r0, r2
	lsls r0, 7
	adds r3, r0
	adds r3, r6
	ldrh r0, [r4, 0xC]
	strh r0, [r3]
	adds r1, 0x1
	lsls r1, 16
	lsrs r3, r1, 16
	asrs r1, 16
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _080D3EF6
_080D3F1C:
	ldrh r3, [r4, 0x10]
	lsls r2, r3, 16
	asrs r1, r2, 16
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _080D3F50
	ldr r6, _080D3F80 @ =gUnknown_03004DE0
	ldr r5, _080D3F84 @ =gUnknown_03004DC0
_080D3F2E:
	asrs r3, r2, 16
	lsls r2, r3, 1
	ldrb r1, [r5, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r6
	ldrh r0, [r4, 0xA]
	strh r0, [r2]
	adds r3, 0x1
	lsls r2, r3, 16
	asrs r1, r2, 16
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _080D3F2E
_080D3F50:
	ldrh r3, [r4, 0x12]
	lsls r1, r3, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	bgt _080D4032
	ldr r6, _080D3F80 @ =gUnknown_03004DE0
	ldr r5, _080D3F84 @ =gUnknown_03004DC0
_080D3F5E:
	asrs r3, r1, 16
	lsls r2, r3, 1
	ldrb r1, [r5, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r6
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	lsls r1, r3, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	ble _080D3F5E
	b _080D4032
	.align 2, 0
_080D3F80: .4byte gUnknown_03004DE0
_080D3F84: .4byte gUnknown_03004DC0
_080D3F88:
	movs r3, 0
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	bge _080D3FBC
	ldr r6, _080D403C @ =gUnknown_03004DE0
	ldr r5, _080D4040 @ =gUnknown_03004DC0
_080D3F96:
	lsls r1, r3, 16
	asrs r1, 16
	lsls r3, r1, 1
	ldrb r2, [r5, 0x14]
	lsls r0, r2, 4
	subs r0, r2
	lsls r0, 7
	adds r3, r0
	adds r3, r6
	ldrh r0, [r4, 0xC]
	strh r0, [r3]
	adds r1, 0x1
	lsls r1, 16
	lsrs r3, r1, 16
	asrs r1, 16
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _080D3F96
_080D3FBC:
	ldrh r3, [r4, 0x10]
	lsls r2, r3, 16
	asrs r1, r2, 16
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _080D3FF0
	ldr r6, _080D403C @ =gUnknown_03004DE0
	ldr r5, _080D4040 @ =gUnknown_03004DC0
_080D3FCE:
	asrs r3, r2, 16
	lsls r2, r3, 1
	ldrb r1, [r5, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r6
	ldrh r0, [r4, 0xA]
	strh r0, [r2]
	adds r3, 0x1
	lsls r2, r3, 16
	asrs r1, r2, 16
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _080D3FCE
_080D3FF0:
	ldrh r3, [r4, 0x12]
	lsls r1, r3, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	bgt _080D401C
	ldr r6, _080D403C @ =gUnknown_03004DE0
	ldr r5, _080D4040 @ =gUnknown_03004DC0
_080D3FFE:
	asrs r3, r1, 16
	lsls r2, r3, 1
	ldrb r1, [r5, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r6
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	lsls r1, r3, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	ble _080D3FFE
_080D401C:
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _080D4032
	bl remove_some_task
	adds r0, r7, 0
	bl DestroyTask
_080D4032:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D403C: .4byte gUnknown_03004DE0
_080D4040: .4byte gUnknown_03004DC0
	thumb_func_end sub_80D3D68

	thumb_func_start sub_80D4044
sub_80D4044: @ 80D4044
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x8
	ldr r3, _080D4098 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080D409C @ =0xfffffc00
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
	ldr r1, _080D40A0 @ =0x000001ff
	ands r1, r0
	adds r0, r1, 0
	cmp r0, 0xFF
	ble _080D408A
	subs r0, r6, r0
	lsls r0, 16
	lsrs r1, r0, 16
_080D408A:
	strh r5, [r4, 0x30]
	strh r1, [r4, 0x32]
	ldr r0, _080D40A4 @ =sub_80D40A8
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D4098: .4byte 0x000003ff
_080D409C: .4byte 0xfffffc00
_080D40A0: .4byte 0x000001ff
_080D40A4: .4byte sub_80D40A8
	thumb_func_end sub_80D4044

	thumb_func_start sub_80D40A8
sub_80D40A8: @ 80D40A8
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
	beq _080D40CC
	lsls r0, r3, 16
	asrs r0, 24
	negs r0, r0
	b _080D40D0
_080D40CC:
	lsls r0, r3, 16
	asrs r0, 24
_080D40D0:
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
	bne _080D40EE
	adds r0, r2, 0
	bl move_anim_8072740
_080D40EE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D40A8

	thumb_func_start sub_80D40F4
sub_80D40F4: @ 80D40F4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080D4144 @ =gTasks
	adds r4, r0
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	ldr r2, _080D4148 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x22]
	strh r0, [r4, 0x12]
	bl sub_80D4394
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_8078E70
	ldr r0, _080D414C @ =sub_80D4150
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D4144: .4byte gTasks
_080D4148: .4byte gSprites
_080D414C: .4byte sub_80D4150
	thumb_func_end sub_80D40F4

	thumb_func_start sub_80D4150
sub_80D4150: @ 80D4150
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080D4178 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	bls _080D416C
	b _080D438A
_080D416C:
	lsls r0, 2
	ldr r1, _080D417C @ =_080D4180
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D4178: .4byte gTasks
_080D417C: .4byte _080D4180
	.align 2, 0
_080D4180:
	.4byte _080D41A0
	.4byte _080D41C6
	.4byte _080D4258
	.4byte _080D428E
	.4byte _080D42A2
	.4byte _080D42B0
	.4byte _080D4330
	.4byte _080D437C
_080D41A0:
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
_080D41C6:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D4222
	movs r0, 0
	strh r0, [r4, 0xE]
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D4210
	ldr r2, _080D420C @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3
	strh r1, [r0, 0x24]
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	adds r1, 0x1
	strh r1, [r0, 0x22]
	b _080D4222
	.align 2, 0
_080D420C: .4byte gSprites
_080D4210:
	ldr r2, _080D4250 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _080D4254 @ =0x0000fffd
	strh r1, [r0, 0x24]
_080D4222:
	adds r0, r4, 0
	bl sub_8079C74
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	beq _080D4232
	b _080D438A
_080D4232:
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8079A64
	ldr r2, _080D4250 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r5, [r0, 0x24]
	strh r5, [r4, 0xE]
	b _080D436C
	.align 2, 0
_080D4250: .4byte gSprites
_080D4254: .4byte 0x0000fffd
_080D4258:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bgt _080D4268
	b _080D438A
_080D4268:
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0x80
	lsls r3, 2
	movs r0, 0xC0
	lsls r0, 1
	str r0, [sp]
	movs r0, 0xE0
	str r0, [sp, 0x4]
	movs r0, 0x8
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r2, 0xE0
	bl sub_8079C08
	movs r0, 0
	strh r0, [r4, 0xE]
	b _080D436E
_080D428E:
	adds r0, r4, 0
	bl sub_8079C74
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080D438A
	strh r0, [r4, 0xE]
	strh r0, [r4, 0x10]
	b _080D436E
_080D42A2:
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80D4418
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080D42B0:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D438A
	movs r0, 0
	strh r0, [r4, 0xE]
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D42E8
	ldr r2, _080D42E4 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	adds r1, 0x2
	b _080D42FA
	.align 2, 0
_080D42E4: .4byte gSprites
_080D42E8:
	ldr r2, _080D432C @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	subs r1, 0x2
_080D42FA:
	strh r1, [r0, 0x26]
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0xA
	bne _080D438A
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
	movs r3, 0xE0
	bl sub_8079C08
	movs r0, 0
	strh r0, [r4, 0xE]
	strh r0, [r4, 0x10]
	b _080D436E
	.align 2, 0
_080D432C: .4byte gSprites
_080D4330:
	ldr r6, _080D4378 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrh r1, [r0, 0x22]
	subs r1, 0x1
	strh r1, [r0, 0x22]
	adds r0, r4, 0
	bl sub_8079C74
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080D438A
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F40
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrh r1, [r4, 0x12]
	strh r1, [r0, 0x22]
_080D436C:
	strh r5, [r4, 0x10]
_080D436E:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080D438A
	.align 2, 0
_080D4378: .4byte gSprites
_080D437C:
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D438A
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080D438A:
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80D4150

	thumb_func_start sub_80D4394
sub_80D4394: @ 80D4394
	push {r4,r5,lr}
	ldr r4, _080D43B8 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080D43C8
	ldr r1, _080D43BC @ =gBattlePartyID
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080D43C0 @ =gPlayerParty
	b _080D43D8
	.align 2, 0
_080D43B8: .4byte gBattleAnimBankAttacker
_080D43BC: .4byte gBattlePartyID
_080D43C0: .4byte gPlayerParty
_080D43C4:
	adds r0, r2, 0
	b _080D440A
_080D43C8:
	ldr r1, _080D4410 @ =gBattlePartyID
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080D4414 @ =gEnemyParty
_080D43D8:
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0x3A
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r3, r0, 16
	lsrs r4, 18
	movs r2, 0
_080D43F6:
	adds r1, r2, 0x1
	adds r0, r4, 0
	muls r0, r1
	cmp r3, r0
	blt _080D43C4
	lsls r0, r1, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bls _080D43F6
	movs r0, 0x3
_080D440A:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080D4410: .4byte gBattlePartyID
_080D4414: .4byte gEnemyParty
	thumb_func_end sub_80D4394

	thumb_func_start sub_80D4418
sub_80D4418: @ 80D4418
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	adds r7, r0, 0
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp]
	ldr r4, _080D4520 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0xAC
	ldrb r0, [r4]
	bl sub_8079E90
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	ldrh r1, [r7, 0xA]
	movs r0, 0x4
	subs r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r0, 0
	bgt _080D4468
	movs r1, 0x1
_080D4468:
	movs r0, 0
	str r0, [sp, 0x4]
	lsls r0, r1, 16
	mov r10, r8
	mov r9, r6
	mov r1, r10
	lsls r1, 4
	str r1, [sp, 0xC]
	mov r1, r9
	lsls r1, 4
	str r1, [sp, 0x10]
	asrs r0, 16
	mov r8, r0
_080D4482:
	ldr r0, _080D4524 @ =gSpriteTemplate_83D9378
	mov r1, r10
	mov r2, r9
	ldr r3, [sp, 0x8]
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r6, r5, 16
	cmp r2, 0x40
	beq _080D44EA
	ldr r1, _080D4528 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r5, r0, r1
	mov r0, sp
	ldrh r0, [r0, 0x4]
	strh r0, [r5, 0x30]
	mov r1, sp
	ldrh r1, [r1, 0xC]
	strh r1, [r5, 0x32]
	mov r0, sp
	ldrh r0, [r0, 0x10]
	strh r0, [r5, 0x34]
	asrs r4, r6, 16
	adds r0, r4, 0
	movs r1, 0x40
	bl Cos
	strh r0, [r5, 0x36]
	adds r0, r4, 0
	movs r1, 0x40
	bl Sin
	strh r0, [r5, 0x38]
	mov r1, sp
	ldrh r1, [r1]
	strh r1, [r5, 0x3A]
	movs r0, 0x2
	strh r0, [r5, 0x3C]
	ldrh r1, [r7, 0xC]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D44E4
	adds r0, r5, 0
	bl sub_80D452C
_080D44E4:
	ldrh r0, [r7, 0xC]
	adds r0, 0x1
	strh r0, [r7, 0xC]
_080D44EA:
	mov r1, r8
	lsls r0, r1, 1
	asrs r1, r6, 16
	adds r1, r0
	lsls r1, 16
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r5, r0, 16
	ldr r1, [sp, 0x4]
	lsls r0, r1, 16
	asrs r0, 16
	add r0, r8
	lsls r0, 16
	lsrs r1, r0, 16
	str r1, [sp, 0x4]
	asrs r0, 16
	cmp r0, 0x13
	ble _080D4482
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D4520: .4byte gBattleAnimBankAttacker
_080D4524: .4byte gSpriteTemplate_83D9378
_080D4528: .4byte gSprites
	thumb_func_end sub_80D4418

	thumb_func_start sub_80D452C
sub_80D452C: @ 80D452C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D453E
	cmp r0, 0x1
	beq _080D4574
	b _080D45CE
_080D453E:
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	movs r1, 0x6
	bl __modsi3
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	ldrh r0, [r4, 0x36]
	adds r1, r0
	strh r1, [r4, 0x36]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x3
	bl __modsi3
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	ldrh r2, [r4, 0x38]
	adds r1, r2
	strh r1, [r4, 0x38]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_080D4574:
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldrh r1, [r4, 0x38]
	ldrh r2, [r4, 0x34]
	adds r1, r2
	strh r1, [r4, 0x34]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x20]
	lsls r1, 16
	asrs r2, r1, 20
	strh r2, [r4, 0x22]
	adds r0, 0x8
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 17
	cmp r0, r1
	bhi _080D45AA
	adds r1, r2, 0
	movs r0, 0x8
	negs r0, r0
	cmp r1, r0
	blt _080D45AA
	cmp r1, 0x78
	ble _080D45CE
_080D45AA:
	ldr r3, _080D45D4 @ =gTasks
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
_080D45CE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D45D4: .4byte gTasks
	thumb_func_end sub_80D452C

	thumb_func_start sub_80D45D8
sub_80D45D8: @ 80D45D8
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080D4608 @ =gTasks
	adds r4, r1, r0
	bl sub_80D4394
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xA]
	ldr r0, _080D460C @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080D4610
	movs r0, 0x88
	strh r0, [r4, 0x10]
	movs r0, 0x28
	b _080D4616
	.align 2, 0
_080D4608: .4byte gTasks
_080D460C: .4byte gBattleAnimBankAttacker
_080D4610:
	movs r0, 0x10
	strh r0, [r4, 0x10]
	movs r0, 0x50
_080D4616:
	strh r0, [r4, 0x14]
	movs r0, 0x62
	strh r0, [r4, 0x12]
	ldrh r0, [r4, 0x10]
	adds r0, 0x31
	strh r0, [r4, 0x16]
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	adds r0, 0x5
	strh r0, [r4, 0x20]
	ldr r0, _080D4638 @ =sub_80D463C
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D4638: .4byte sub_80D463C
	thumb_func_end sub_80D45D8

	thumb_func_start sub_80D463C
sub_80D463C: @ 80D463C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r7, _080D4660 @ =gTasks
	adds r4, r0, r7
	movs r0, 0x8
	ldrsh r2, [r4, r0]
	cmp r2, 0
	beq _080D4664
	cmp r2, 0x1
	beq _080D4714
	b _080D4722
	.align 2, 0
_080D4660: .4byte gTasks
_080D4664:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080D467A
	strh r2, [r4, 0xC]
	adds r0, r4, 0
	bl sub_80D472C
_080D467A:
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D46F4
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080D46F4
	ldr r5, _080D4708 @ =gBattleAnimArgs
	movs r1, 0x1
	mov r8, r1
	mov r2, r8
	strh r2, [r5]
	strh r0, [r5, 0x2]
	movs r0, 0xC
	strh r0, [r5, 0x4]
	ldr r6, _080D470C @ =sub_80E1864
	adds r0, r6, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080D46C4
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r7
	ldr r1, [r0]
	adds r0, r2, 0
	bl _call_via_r1
	ldr r1, _080D4710 @ =gAnimVisualTaskCount
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080D46C4:
	movs r0, 0x3
	strh r0, [r5]
	adds r0, r6, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080D46F0
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r7
	ldr r1, [r0]
	adds r0, r2, 0
	bl _call_via_r1
	ldr r1, _080D4710 @ =gAnimVisualTaskCount
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080D46F0:
	mov r0, r8
	strh r0, [r4, 0x22]
_080D46F4:
	movs r2, 0x1E
	ldrsh r1, [r4, r2]
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _080D4722
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080D4722
	.align 2, 0
_080D4708: .4byte gBattleAnimArgs
_080D470C: .4byte sub_80E1864
_080D4710: .4byte gAnimVisualTaskCount
_080D4714:
	movs r2, 0x1A
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080D4722
	adds r0, r1, 0
	bl DestroyAnimVisualTask
_080D4722:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80D463C

	thumb_func_start sub_80D472C
sub_80D472C: @ 80D472C
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r1, _080D47B8 @ =gSineTable
	movs r2, 0x18
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r0, 0x3
	asrs r0, 4
	ldrh r2, [r4, 0x14]
	adds r0, r2
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _080D47BC @ =gSpriteTemplate_83D9378
	movs r2, 0x16
	ldrsh r1, [r4, r2]
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080D4786
	ldr r3, _080D47C0 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x1C
	adds r1, r0, r1
	ldr r2, _080D47C4 @ =sub_80D47D0
	str r2, [r1]
	adds r0, r3
	strh r5, [r0, 0x38]
	strh r6, [r0, 0x3A]
	movs r1, 0x9
	strh r1, [r0, 0x3C]
	ldrh r0, [r4, 0x1A]
	adds r0, 0x1
	strh r0, [r4, 0x1A]
_080D4786:
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
	ldrh r0, [r4, 0x18]
	adds r0, 0x27
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x18]
	movs r0, 0x16
	ldrsh r1, [r4, r0]
	ldr r0, _080D47C8 @ =0x41c64e6d
	muls r0, r1
	ldr r1, _080D47CC @ =0x00003039
	adds r0, r1
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	bl __modsi3
	ldrh r1, [r4, 0x10]
	adds r1, r0
	strh r1, [r4, 0x16]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D47B8: .4byte gSineTable
_080D47BC: .4byte gSpriteTemplate_83D9378
_080D47C0: .4byte gSprites
_080D47C4: .4byte sub_80D47D0
_080D47C8: .4byte 0x41c64e6d
_080D47CC: .4byte 0x00003039
	thumb_func_end sub_80D472C

	thumb_func_start sub_80D47D0
sub_80D47D0: @ 80D47D0
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080D4866
	ldrh r0, [r5, 0x22]
	adds r0, 0x8
	strh r0, [r5, 0x22]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x38
	ldrsh r1, [r5, r2]
	cmp r0, r1
	blt _080D4866
	ldr r2, _080D486C @ =gTasks
	movs r3, 0x3A
	ldrsh r1, [r5, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0x1
	strh r1, [r0, 0x1C]
	ldr r0, _080D4870 @ =gBattleAnimSpriteTemplate_83DB4D8
	movs r2, 0x20
	ldrsh r1, [r5, r2]
	movs r3, 0x22
	ldrsh r2, [r5, r3]
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x30]
	cmp r0, 0x40
	beq _080D4860
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080D4874 @ =gSprites
	adds r0, r4
	movs r1, 0x3
	bl StartSpriteAffineAnim
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r5, 0x3A]
	strh r1, [r0, 0x3A]
	movs r3, 0x30
	ldrsh r1, [r5, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r5, 0x3C]
	strh r1, [r0, 0x3C]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _080D4878 @ =sub_80D487C
	str r1, [r0]
_080D4860:
	adds r0, r5, 0
	bl DestroySprite
_080D4866:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D486C: .4byte gTasks
_080D4870: .4byte gBattleAnimSpriteTemplate_83DB4D8
_080D4874: .4byte gSprites
_080D4878: .4byte sub_80D487C
	thumb_func_end sub_80D47D0

	thumb_func_start sub_80D487C
sub_80D487C: @ 80D487C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D48E8
	movs r0, 0
	strh r0, [r4, 0x30]
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	bne _080D48E8
	ldr r3, _080D48F0 @ =gTasks
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
_080D48E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D48F0: .4byte gTasks
	thumb_func_end sub_80D487C

	thumb_func_start sub_80D48F4
sub_80D48F4: @ 80D48F4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080D4978 @ =gTasks
	adds r5, r1, r0
	ldr r4, _080D497C @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0
	strh r0, [r5, 0xE]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x10]
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	movs r2, 0x1
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	bne _080D4938
	movs r1, 0x1
_080D4938:
	strh r1, [r5, 0x16]
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080D494C
	movs r1, 0x16
	ldrsh r0, [r5, r1]
	negs r0, r0
	strh r0, [r5, 0x16]
_080D494C:
	movs r2, 0x16
	ldrsh r0, [r5, r2]
	lsls r0, 3
	ldrh r1, [r5, 0xE]
	adds r0, r1
	strh r0, [r5, 0x12]
	movs r2, 0x16
	ldrsh r1, [r5, r2]
	lsls r1, 3
	ldrh r0, [r5, 0x10]
	subs r0, r1
	strh r0, [r5, 0x14]
	ldr r0, _080D4980 @ =0x0000ffe0
	strh r0, [r5, 0x1A]
	strh r6, [r5, 0xA]
	strh r6, [r5, 0x8]
	ldr r0, _080D4984 @ =sub_80D4988
	str r0, [r5]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D4978: .4byte gTasks
_080D497C: .4byte gBattleAnimBankAttacker
_080D4980: .4byte 0x0000ffe0
_080D4984: .4byte sub_80D4988
	thumb_func_end sub_80D48F4

	thumb_func_start sub_80D4988
sub_80D4988: @ 80D4988
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080D49AC @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	bls _080D49A2
	b _080D4AC2
_080D49A2:
	lsls r0, 2
	ldr r1, _080D49B0 @ =_080D49B4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D49AC: .4byte gTasks
_080D49B0: .4byte _080D49B4
	.align 2, 0
_080D49B4:
	.4byte _080D49D0
	.4byte _080D49E0
	.4byte _080D49FA
	.4byte _080D4A3C
	.4byte _080D4A5E
	.4byte _080D4A8C
	.4byte _080D4AB2
_080D49D0:
	adds r0, r4, 0
	bl sub_80D4AD0
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D4AC8
	b _080D4ABA
_080D49E0:
	adds r0, r4, 0
	bl sub_80D4AD0
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080D4AC8
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080D4ABA
_080D49FA:
	adds r0, r4, 0
	bl sub_80D4AD0
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	ldrh r0, [r4, 0x12]
	adds r1, r0
	movs r2, 0
	strh r1, [r4, 0x12]
	adds r1, 0x10
	lsls r1, 16
	movs r0, 0x88
	lsls r0, 17
	cmp r1, r0
	bls _080D4AC8
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080D4A38
	movs r0, 0x1
	strh r0, [r4, 0x22]
	movs r0, 0x6
	strh r0, [r4, 0x8]
	strh r2, [r4, 0xA]
	b _080D4AC8
_080D4A38:
	strh r2, [r4, 0xA]
	b _080D4ABA
_080D4A3C:
	adds r0, r4, 0
	bl sub_80D4AD0
	movs r0, 0x16
	ldrsh r1, [r4, r0]
	lsls r1, 1
	ldrh r0, [r4, 0x14]
	subs r0, r1
	strh r0, [r4, 0x14]
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080D4AC8
	b _080D4ABA
_080D4A5E:
	adds r0, r4, 0
	bl sub_80D4AD0
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	ldrh r0, [r4, 0x12]
	subs r0, r1
	strh r0, [r4, 0x12]
	adds r0, 0x10
	lsls r0, 16
	movs r1, 0x88
	lsls r1, 17
	cmp r0, r1
	bls _080D4AC8
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080D4ABA
_080D4A8C:
	adds r0, r4, 0
	bl sub_80D4AD0
	movs r0, 0x16
	ldrsh r1, [r4, r0]
	lsls r1, 1
	ldrh r0, [r4, 0x14]
	subs r0, r1
	strh r0, [r4, 0x14]
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080D4AC8
	movs r0, 0x2
	strh r0, [r4, 0x8]
	b _080D4AC8
_080D4AB2:
	movs r1, 0x18
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D4AC8
_080D4ABA:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080D4AC8
_080D4AC2:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080D4AC8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D4988

	thumb_func_start sub_80D4AD0
sub_80D4AD0: @ 80D4AD0
	push {r4-r6,lr}
	adds r6, r0, 0
	ldrh r0, [r6, 0xC]
	adds r0, 0x1
	strh r0, [r6, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D4B2A
	movs r0, 0
	strh r0, [r6, 0xC]
	ldr r0, _080D4B30 @ =gSpriteTemplate_83D9378
	movs r2, 0xE
	ldrsh r1, [r6, r2]
	movs r3, 0x10
	ldrsh r2, [r6, r3]
	movs r3, 0xA
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080D4B2A
	ldr r5, _080D4B34 @ =gSprites
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r0, r4, r5
	movs r1, 0x10
	strh r1, [r0, 0x2E]
	ldrh r1, [r6, 0x12]
	strh r1, [r0, 0x32]
	ldrh r1, [r6, 0x14]
	strh r1, [r0, 0x36]
	ldrh r1, [r6, 0x1A]
	strh r1, [r0, 0x38]
	bl sub_80786EC
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _080D4B38 @ =sub_80D4B3C
	str r0, [r4]
	ldrh r0, [r6, 0x18]
	adds r0, 0x1
	strh r0, [r6, 0x18]
_080D4B2A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D4B30: .4byte gSpriteTemplate_83D9378
_080D4B34: .4byte gSprites
_080D4B38: .4byte sub_80D4B3C
	thumb_func_end sub_80D4AD0

	thumb_func_start sub_80D4B3C
sub_80D4B3C: @ 80D4B3C
	push {r4-r6,lr}
	adds r6, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080D4B96
	ldrh r0, [r6, 0x24]
	ldrh r1, [r6, 0x20]
	adds r0, r1
	strh r0, [r6, 0x20]
	ldrh r0, [r6, 0x26]
	ldrh r1, [r6, 0x22]
	adds r0, r1
	strh r0, [r6, 0x22]
	movs r0, 0x6
	strh r0, [r6, 0x2E]
	bl Random
	movs r4, 0x1F
	adds r1, r4, 0
	ands r1, r0
	ldr r5, _080D4B9C @ =0x0000fff0
	adds r1, r5
	ldrh r0, [r6, 0x20]
	adds r1, r0
	strh r1, [r6, 0x32]
	bl Random
	ands r4, r0
	adds r4, r5
	ldrh r1, [r6, 0x22]
	adds r4, r1
	strh r4, [r6, 0x36]
	bl Random
	movs r1, 0x7
	ands r1, r0
	mvns r1, r1
	strh r1, [r6, 0x38]
	adds r0, r6, 0
	bl sub_80786EC
	ldr r0, _080D4BA0 @ =sub_80D4BA4
	str r0, [r6, 0x1C]
_080D4B96:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D4B9C: .4byte 0x0000fff0
_080D4BA0: .4byte sub_80D4BA4
	thumb_func_end sub_80D4B3C

	thumb_func_start sub_80D4BA4
sub_80D4BA4: @ 80D4BA4
	push {r4-r6,lr}
	adds r5, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080D4BE0
	movs r4, 0
	ldr r6, _080D4BE8 @ =gTasks
_080D4BB6:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r6
	ldr r1, [r2]
	ldr r0, _080D4BEC @ =sub_80D4988
	cmp r1, r0
	bne _080D4BD6
	movs r0, 0x1
	strh r0, [r2, 0x1C]
	ldrh r0, [r2, 0x18]
	subs r0, 0x1
	strh r0, [r2, 0x18]
	adds r0, r5, 0
	bl DestroySprite
_080D4BD6:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xF
	bls _080D4BB6
_080D4BE0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D4BE8: .4byte gTasks
_080D4BEC: .4byte sub_80D4988
	thumb_func_end sub_80D4BA4

	thumb_func_start sub_80D4BF0
sub_80D4BF0: @ 80D4BF0
	ldr r2, _080D4C10 @ =gBattleAnimArgs
	ldrh r1, [r2]
	strh r1, [r0, 0x20]
	ldrh r1, [r2, 0x2]
	strh r1, [r0, 0x22]
	ldrh r1, [r2, 0x4]
	strh r1, [r0, 0x2E]
	ldrh r1, [r2, 0x6]
	strh r1, [r0, 0x30]
	ldrh r1, [r2, 0x8]
	strh r1, [r0, 0x32]
	ldrh r1, [r2, 0xA]
	strh r1, [r0, 0x34]
	ldr r1, _080D4C14 @ =sub_80D4C18
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080D4C10: .4byte gBattleAnimArgs
_080D4C14: .4byte sub_80D4C18
	thumb_func_end sub_80D4BF0

	thumb_func_start sub_80D4C18
sub_80D4C18: @ 80D4C18
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x2E]
	subs r0, r1
	strh r0, [r4, 0x36]
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl __divsi3
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	ldrh r2, [r4, 0x38]
	adds r0, r2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	cmp r0, 0
	bne _080D4C5C
	adds r0, r4, 0
	bl move_anim_8072740
_080D4C5C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D4C18

	thumb_func_start sub_80D4C64
sub_80D4C64: @ 80D4C64
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	ldrh r1, [r4, 0x32]
	ldrh r2, [r4, 0x36]
	adds r1, r2
	strh r1, [r4, 0x36]
	lsls r0, 16
	asrs r0, 23
	strh r0, [r4, 0x24]
	lsls r1, 16
	asrs r1, 23
	strh r1, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _080D4C9C
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_080D4C9C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D4C64

	thumb_func_start sub_80D4CA4
sub_80D4CA4: @ 80D4CA4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r5, _080D4CE0 @ =gBattleAnimBankTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x30]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldr r1, _080D4CE4 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x34]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x36]
	ldr r0, _080D4CE8 @ =sub_80D4CEC
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D4CE0: .4byte gBattleAnimBankTarget
_080D4CE4: .4byte gBattleAnimArgs
_080D4CE8: .4byte sub_80D4CEC
	thumb_func_end sub_80D4CA4

	thumb_func_start sub_80D4CEC
sub_80D4CEC: @ 80D4CEC
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	subs r6, r1, r0
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	subs r5, r1, r0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	muls r0, r6
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl __divsi3
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	muls r0, r5
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl __divsi3
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080D4D44
	movs r0, 0
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_80D4D64
_080D4D44:
	movs r0, 0x34
	ldrsh r1, [r4, r0]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080D4D56
	adds r0, r4, 0
	bl move_anim_8072740
_080D4D56:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80D4CEC

	thumb_func_start sub_80D4D64
sub_80D4D64: @ 80D4D64
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	adds r4, r1, 0
	adds r5, r2, 0
	movs r2, 0x2E
	ldrsh r1, [r0, r2]
	lsrs r2, r1, 31
	adds r1, r2
	lsls r1, 15
	lsrs r1, 16
	str r1, [sp]
	ldrh r1, [r0, 0x24]
	ldrh r3, [r0, 0x20]
	adds r1, r3
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	adds r0, r5, r0
	subs r0, 0x5
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	bl Random
	negs r4, r4
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	adds r4, r0
	subs r4, 0x5
	lsls r4, 16
	lsrs r7, r4, 16
	movs r6, 0
	mov r0, r8
	lsls r0, 16
	mov r8, r0
	mov r1, r10
	lsls r1, 16
	str r1, [sp, 0xC]
	ldr r2, [sp]
	lsls r2, 16
	str r2, [sp, 0x10]
	asrs r1, 16
	lsls r0, r7, 16
	asrs r5, r0, 16
	str r0, [sp, 0x14]
	negs r3, r5
	str r3, [sp, 0x4]
	asrs r0, r2, 16
	adds r1, r0
	lsls r1, 16
	mov r10, r1
_080D4DF2:
	ldr r0, _080D4E34 @ =gSpriteTemplate_83D9420
	mov r2, r8
	asrs r1, r2, 16
	mov r3, r10
	asrs r2, r3, 16
	movs r3, 0x82
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080D4E38 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r4, r0, r1
	movs r0, 0x14
	strh r0, [r4, 0x2E]
	mov r0, r9
	strh r0, [r4, 0x30]
	ldr r0, _080D4E3C @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl sub_8079E90
	subs r0, 0x1
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	cmp r5, 0
	bge _080D4E40
	mov r1, sp
	ldrh r1, [r1, 0x4]
	strh r1, [r4, 0x32]
	b _080D4E42
	.align 2, 0
_080D4E34: .4byte gSpriteTemplate_83D9420
_080D4E38: .4byte gSprites
_080D4E3C: .4byte gBattleAnimBankAttacker
_080D4E40:
	strh r7, [r4, 0x32]
_080D4E42:
	lsls r0, r6, 16
	movs r2, 0x80
	lsls r2, 9
	adds r0, r2
	lsrs r6, r0, 16
	cmp r0, 0
	ble _080D4DF2
	movs r6, 0
	ldr r3, [sp, 0xC]
	asrs r1, r3, 16
	ldr r0, [sp, 0x14]
	asrs r5, r0, 16
	negs r2, r5
	str r2, [sp, 0x8]
	ldr r3, [sp, 0x10]
	asrs r0, r3, 16
	subs r1, r0
	lsls r1, 16
	mov r10, r1
_080D4E68:
	ldr r0, _080D4EAC @ =gSpriteTemplate_83D9420
	mov r2, r8
	asrs r1, r2, 16
	mov r3, r10
	asrs r2, r3, 16
	movs r3, 0x82
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080D4EB0 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r4, r0, r1
	movs r0, 0x14
	strh r0, [r4, 0x2E]
	mov r0, r9
	strh r0, [r4, 0x30]
	ldr r0, _080D4EB4 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl sub_8079E90
	subs r0, 0x1
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	cmp r5, 0
	ble _080D4EB8
	mov r1, sp
	ldrh r1, [r1, 0x8]
	strh r1, [r4, 0x32]
	b _080D4EBA
	.align 2, 0
_080D4EAC: .4byte gSpriteTemplate_83D9420
_080D4EB0: .4byte gSprites
_080D4EB4: .4byte gBattleAnimBankAttacker
_080D4EB8:
	strh r7, [r4, 0x32]
_080D4EBA:
	lsls r0, r6, 16
	movs r2, 0x80
	lsls r2, 9
	adds r0, r2
	lsrs r6, r0, 16
	cmp r0, 0
	ble _080D4E68
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80D4D64

	thumb_func_start sub_80D4ED8
sub_80D4ED8: @ 80D4ED8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080D4F0C @ =gBattleAnimArgs
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
	ldr r1, _080D4F10 @ =move_anim_8072740
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	ldr r1, _080D4F14 @ =sub_8078174
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D4F0C: .4byte gBattleAnimArgs
_080D4F10: .4byte move_anim_8072740
_080D4F14: .4byte sub_8078174
	thumb_func_end sub_80D4ED8

	thumb_func_start sub_80D4F18
sub_80D4F18: @ 80D4F18
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080D4F50 @ =gBattleAnimArgs
	movs r0, 0
	ldrsh r1, [r5, r0]
	adds r0, r4, 0
	bl sub_807867C
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x32]
	ldr r0, _080D4F54 @ =sub_8078394
	str r0, [r4, 0x1C]
	ldr r1, _080D4F58 @ =move_anim_8072740
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D4F50: .4byte gBattleAnimArgs
_080D4F54: .4byte sub_8078394
_080D4F58: .4byte move_anim_8072740
	thumb_func_end sub_80D4F18

	thumb_func_start sub_80D4F5C
sub_80D4F5C: @ 80D4F5C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078650
	ldr r0, _080D4F90 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080D4F98
	ldr r2, _080D4F94 @ =gBattleAnimArgs
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrh r0, [r2, 0x8]
	negs r0, r0
	strh r0, [r4, 0x32]
	adds r1, r2, 0
	b _080D4FAE
	.align 2, 0
_080D4F90: .4byte gBattleAnimBankAttacker
_080D4F94: .4byte gBattleAnimArgs
_080D4F98:
	ldr r1, _080D4FC4 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x32]
_080D4FAE:
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x36]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x34]
	ldr r0, _080D4FC8 @ =sub_80D5038
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D4FC4: .4byte gBattleAnimArgs
_080D4FC8: .4byte sub_80D5038
	thumb_func_end sub_80D4F5C

	thumb_func_start sub_80D4FCC
sub_80D4FCC: @ 80D4FCC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080D4FF8 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080D5000
	ldr r2, _080D4FFC @ =gBattleAnimArgs
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrh r0, [r2, 0x8]
	strh r0, [r4, 0x32]
	adds r1, r2, 0
	b _080D5018
	.align 2, 0
_080D4FF8: .4byte gBattleAnimBankAttacker
_080D4FFC: .4byte gBattleAnimArgs
_080D5000:
	ldr r1, _080D5030 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x8]
	negs r0, r0
	strh r0, [r4, 0x32]
_080D5018:
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x36]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x34]
	ldr r0, _080D5034 @ =sub_80D5038
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D5030: .4byte gBattleAnimArgs
_080D5034: .4byte sub_80D5038
	thumb_func_end sub_80D4FCC

	thumb_func_start sub_80D5038
sub_80D5038: @ 80D5038
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x36
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bge _080D505E
	ldrh r0, [r2, 0x32]
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x34]
	ldrh r3, [r2, 0x26]
	adds r0, r3
	strh r0, [r2, 0x26]
_080D505E:
	movs r0, 0x2E
	ldrsh r1, [r2, r0]
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bne _080D5070
	adds r0, r2, 0
	bl move_anim_8074EE0
_080D5070:
	pop {r0}
	bx r0
	thumb_func_end sub_80D5038

	thumb_func_start sub_80D5074
sub_80D5074: @ 80D5074
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078650
	ldr r0, _080D5098 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080D50A0
	ldr r0, _080D509C @ =gBattleAnimArgs
	ldrh r1, [r4, 0x20]
	ldrh r2, [r0]
	subs r1, r2
	strh r1, [r4, 0x20]
	b _080D50B2
	.align 2, 0
_080D5098: .4byte gBattleAnimBankAttacker
_080D509C: .4byte gBattleAnimArgs
_080D50A0:
	ldr r0, _080D50E0 @ =gBattleAnimArgs
	ldrh r1, [r0]
	ldrh r2, [r4, 0x20]
	adds r1, r2
	strh r1, [r4, 0x20]
	adds r2, r4, 0
	adds r2, 0x43
	movs r1, 0x8
	strb r1, [r2]
_080D50B2:
	adds r2, r0, 0
	ldrh r0, [r2, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	movs r1, 0
	strh r0, [r4, 0x22]
	ldrh r0, [r2, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r2, 0x6]
	strh r0, [r4, 0x30]
	ldrh r0, [r2, 0x8]
	strh r0, [r4, 0x32]
	ldrh r0, [r2, 0xA]
	strh r0, [r4, 0x34]
	ldrh r0, [r2, 0xC]
	strh r0, [r4, 0x36]
	strh r1, [r4, 0x38]
	ldr r0, _080D50E4 @ =sub_80D50E8
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D50E0: .4byte gBattleAnimArgs
_080D50E4: .4byte sub_80D50E8
	thumb_func_end sub_80D5074

	thumb_func_start sub_80D50E8
sub_80D50E8: @ 80D50E8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D5170
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	ldr r0, _080D5154 @ =0x00002710
	cmp r1, r0
	ble _080D5106
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1
	strb r0, [r1]
_080D5106:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x38]
	lsls r1, 16
	asrs r1, 24
	ldrh r2, [r4, 0x30]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x38]
	lsls r1, 16
	asrs r1, 24
	ldrh r2, [r4, 0x30]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x2E]
	adds r1, r0, r2
	strh r1, [r4, 0x2E]
	ldrh r0, [r4, 0x36]
	ldrh r2, [r4, 0x38]
	adds r0, r2
	strh r0, [r4, 0x38]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _080D515C
	ldr r2, _080D5158 @ =0xffffff00
	b _080D5164
	.align 2, 0
_080D5154: .4byte 0x00002710
_080D5158: .4byte 0xffffff00
_080D515C:
	cmp r0, 0
	bge _080D5168
	movs r2, 0x80
	lsls r2, 1
_080D5164:
	adds r0, r1, r2
	strh r0, [r4, 0x2E]
_080D5168:
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x34]
	b _080D5176
_080D5170:
	adds r0, r4, 0
	bl move_anim_8074EE0
_080D5176:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D50E8

	thumb_func_start sub_80D517C
sub_80D517C: @ 80D517C
	push {lr}
	movs r1, 0
	strh r1, [r0, 0x20]
	strh r1, [r0, 0x22]
	movs r1, 0x3C
	strh r1, [r0, 0x2E]
	movs r1, 0x8C
	strh r1, [r0, 0x32]
	movs r1, 0x50
	strh r1, [r0, 0x36]
	ldr r1, _080D51A0 @ =sub_8078B34
	str r1, [r0, 0x1C]
	ldr r1, _080D51A4 @ =move_anim_8072740
	bl StoreSpriteCallbackInData
	pop {r0}
	bx r0
	.align 2, 0
_080D51A0: .4byte sub_8078B34
_080D51A4: .4byte move_anim_8072740
	thumb_func_end sub_80D517C

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

	thumb_func_start sub_80D58FC
sub_80D58FC: @ 80D58FC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80D59B0
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080D5936
	ldr r3, _080D593C @ =gTasks
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
_080D5936:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D593C: .4byte gTasks
	thumb_func_end sub_80D58FC

	thumb_func_start sub_80D5940
sub_80D5940: @ 80D5940
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080D5978 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r2, [r1, 0x26]
	ldrh r0, [r1, 0x22]
	adds r2, r0
	adds r1, 0x29
	movs r0, 0
	ldrsb r0, [r1, r0]
	adds r0, r2
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _080D597C @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080D5980
	lsls r0, r4, 16
	movs r1, 0x94
	lsls r1, 15
	b _080D5986
	.align 2, 0
_080D5978: .4byte gSprites
_080D597C: .4byte gBattleAnimBankAttacker
_080D5980:
	lsls r0, r4, 16
	movs r1, 0xB0
	lsls r1, 14
_080D5986:
	adds r0, r1
	lsrs r4, r0, 16
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80D5940

	thumb_func_start sub_80D5994
sub_80D5994: @ 80D5994
	movs r3, 0
	strh r3, [r0, 0x2E]
	strh r3, [r0, 0x30]
	ldrh r3, [r0, 0x20]
	lsls r3, 3
	strh r3, [r0, 0x32]
	ldrh r3, [r0, 0x22]
	lsls r3, 3
	strh r3, [r0, 0x34]
	lsls r1, 3
	strh r1, [r0, 0x36]
	lsls r2, 3
	strh r2, [r0, 0x38]
	bx lr
	thumb_func_end sub_80D5994

	thumb_func_start sub_80D59B0
sub_80D59B0: @ 80D59B0
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080D59DA
	movs r0, 0
	strh r0, [r2, 0x2E]
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	ldrh r0, [r2, 0x30]
	adds r1, r0, 0
	muls r1, r0
	adds r0, r1, 0
	ldrh r3, [r2, 0x34]
	adds r0, r3
	strh r0, [r2, 0x34]
_080D59DA:
	ldrh r0, [r2, 0x36]
	ldrh r1, [r2, 0x32]
	adds r0, r1
	strh r0, [r2, 0x32]
	lsls r0, 16
	asrs r0, 19
	strh r0, [r2, 0x20]
	ldrh r1, [r2, 0x38]
	ldrh r3, [r2, 0x34]
	adds r1, r3
	strh r1, [r2, 0x34]
	lsls r1, 16
	asrs r3, r1, 19
	strh r3, [r2, 0x22]
	adds r0, 0x8
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 17
	cmp r0, r1
	bhi _080D5A10
	adds r1, r3, 0
	movs r0, 0x8
	negs r0, r0
	cmp r1, r0
	blt _080D5A10
	cmp r1, 0x78
	ble _080D5A1C
_080D5A10:
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_080D5A1C:
	pop {r0}
	bx r0
	thumb_func_end sub_80D59B0

	thumb_func_start sub_80D5A20
sub_80D5A20: @ 80D5A20
	push {r4,r5,lr}
	ldr r3, _080D5A64 @ =gBattleAnimArgs
	ldrh r1, [r3]
	movs r2, 0
	strh r1, [r0, 0x20]
	ldrh r1, [r3, 0x2]
	strh r1, [r0, 0x22]
	strh r2, [r0, 0x2E]
	strh r2, [r0, 0x30]
	strh r2, [r0, 0x32]
	ldrh r1, [r3, 0x4]
	strh r1, [r0, 0x3A]
	ldrh r1, [r3, 0x6]
	strh r1, [r0, 0x3C]
	ldrh r4, [r0, 0x4]
	lsls r2, r4, 22
	lsrs r2, 22
	movs r5, 0x8
	ldrsh r1, [r3, r5]
	lsls r1, 4
	adds r2, r1
	ldr r3, _080D5A68 @ =0x000003ff
	adds r1, r3, 0
	ands r2, r1
	ldr r1, _080D5A6C @ =0xfffffc00
	ands r1, r4
	orrs r1, r2
	strh r1, [r0, 0x4]
	ldr r1, _080D5A70 @ =sub_80D5A74
	str r1, [r0, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D5A64: .4byte gBattleAnimArgs
_080D5A68: .4byte 0x000003ff
_080D5A6C: .4byte 0xfffffc00
_080D5A70: .4byte sub_80D5A74
	thumb_func_end sub_80D5A20

	thumb_func_start sub_80D5A74
sub_80D5A74: @ 80D5A74
	push {r4,lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	beq _080D5AA6
	cmp r0, 0x1
	bgt _080D5A8A
	cmp r0, 0
	beq _080D5A90
	b _080D5B04
_080D5A8A:
	cmp r0, 0x2
	beq _080D5AC4
	b _080D5B04
_080D5A90:
	ldrh r1, [r2, 0x3A]
	movs r3, 0x3A
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _080D5AA0
	subs r0, r1, 0x1
	strh r0, [r2, 0x3A]
	b _080D5B04
_080D5AA0:
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
_080D5AA6:
	ldrh r0, [r2, 0x22]
	adds r0, 0x8
	strh r0, [r2, 0x22]
	lsls r0, 16
	asrs r0, 16
	ldrh r3, [r2, 0x3C]
	movs r4, 0x3C
	ldrsh r1, [r2, r4]
	cmp r0, r1
	blt _080D5B04
	strh r3, [r2, 0x22]
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	b _080D5B04
_080D5AC4:
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D5AF0
	movs r0, 0
	strh r0, [r2, 0x30]
	ldrh r0, [r2, 0x32]
	adds r0, 0x1
	strh r0, [r2, 0x32]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D5AEC
	ldr r0, _080D5AE8 @ =0x0000fffd
	b _080D5AEE
	.align 2, 0
_080D5AE8: .4byte 0x0000fffd
_080D5AEC:
	movs r0, 0x3
_080D5AEE:
	strh r0, [r2, 0x26]
_080D5AF0:
	ldrh r0, [r2, 0x34]
	adds r0, 0x1
	strh r0, [r2, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080D5B04
	adds r0, r2, 0
	bl move_anim_8072740
_080D5B04:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D5A74

	thumb_func_start sub_80D5B0C
sub_80D5B0C: @ 80D5B0C
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080D5B80
	cmp r0, 0x1
	bgt _080D5B22
	cmp r0, 0
	beq _080D5B28
	b _080D5C4E
_080D5B22:
	cmp r0, 0x2
	beq _080D5BDE
	b _080D5C4E
_080D5B28:
	adds r0, r5, 0
	movs r1, 0
	bl sub_80787B0
	ldr r4, _080D5B50 @ =gBattleAnimArgs
	ldrb r1, [r4, 0x4]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x3C]
	ldr r0, _080D5B54 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080D5B58
	movs r0, 0x4
	b _080D5B5A
	.align 2, 0
_080D5B50: .4byte gBattleAnimArgs
_080D5B54: .4byte gBattleAnimBankAttacker
_080D5B58:
	ldr r0, _080D5B78 @ =0x0000fffc
_080D5B5A:
	strh r0, [r5, 0x36]
	ldr r0, _080D5B7C @ =gBattleAnimBankTarget
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
	b _080D5BD6
	.align 2, 0
_080D5B78: .4byte 0x0000fffc
_080D5B7C: .4byte gBattleAnimBankTarget
_080D5B80:
	ldrh r0, [r5, 0x30]
	adds r0, 0xC0
	strh r0, [r5, 0x30]
	ldr r0, _080D5BA0 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080D5BA4
	ldrh r0, [r5, 0x30]
	lsls r0, 16
	asrs r0, 24
	negs r0, r0
	b _080D5BAA
	.align 2, 0
_080D5BA0: .4byte gBattleAnimBankAttacker
_080D5BA4:
	ldrh r0, [r5, 0x30]
	lsls r0, 16
	asrs r0, 24
_080D5BAA:
	strh r0, [r5, 0x26]
	movs r2, 0x32
	ldrsh r0, [r5, r2]
	movs r2, 0x36
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r5, 0x24]
	ldrh r0, [r5, 0x32]
	adds r0, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080D5C4E
	movs r0, 0
	strh r0, [r5, 0x34]
_080D5BD6:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080D5C4E
_080D5BDE:
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	movs r2, 0x36
	ldrsh r1, [r5, r2]
	bl Sin
	adds r2, r0, 0
	movs r3, 0
	strh r2, [r5, 0x24]
	ldrh r0, [r5, 0x32]
	adds r0, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _080D5C4E
	ldrh r0, [r5, 0x20]
	adds r1, r2, r0
	strh r1, [r5, 0x20]
	ldrh r0, [r5, 0x26]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	strh r3, [r5, 0x26]
	strh r3, [r5, 0x24]
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r5, 0x2E]
	strh r1, [r5, 0x30]
	ldr r4, _080D5C54 @ =gBattleAnimBankTarget
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
	bl sub_8078BD4
	ldr r0, _080D5C58 @ =sub_80D5C5C
	str r0, [r5, 0x1C]
_080D5C4E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D5C54: .4byte gBattleAnimBankTarget
_080D5C58: .4byte sub_80D5C5C
	thumb_func_end sub_80D5B0C

	thumb_func_start sub_80D5C5C
sub_80D5C5C: @ 80D5C5C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	bne _080D5CB4
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0x10
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	ldrh r2, [r4, 0x38]
	adds r0, r2, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x38]
	lsls r2, 16
	asrs r2, 16
	cmp r2, 0
	beq _080D5C92
	cmp r2, 0xC4
	ble _080D5CBA
_080D5C92:
	lsls r0, 16
	cmp r0, 0
	ble _080D5CBA
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D5CBA
	ldr r0, _080D5CB0 @ =gUnknown_0202F7D2
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x90
	bl PlaySE12WithPanning
	b _080D5CBA
	.align 2, 0
_080D5CB0: .4byte gUnknown_0202F7D2
_080D5CB4:
	adds r0, r4, 0
	bl move_anim_8072740
_080D5CBA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D5C5C

	thumb_func_start sub_80D5CC0
sub_80D5CC0: @ 80D5CC0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080D5CD8
	ldr r0, _080D5D4C @ =gBattleAnimArgs
	ldrh r0, [r0]
	strh r0, [r4, 0x30]
	adds r0, r1, 0x1
	strh r0, [r4, 0x2E]
_080D5CD8:
	movs r0, 0xC0
	lsls r0, 1
	adds r1, r0, 0
	ldrh r2, [r4, 0x34]
	adds r1, r2
	strh r1, [r4, 0x34]
	ldrh r0, [r4, 0x36]
	adds r0, 0xA0
	strh r0, [r4, 0x36]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	lsls r1, 16
	asrs r1, 24
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x36]
	lsls r1, 16
	asrs r1, 24
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r2, r0, 0x7
	movs r0, 0xFF
	ands r2, r0
	strh r2, [r4, 0x30]
	ldr r0, _080D5D50 @ =gMain
	ldr r1, _080D5D54 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080D5D84
	adds r0, r2, 0
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x83
	bls _080D5D5C
	ldr r0, _080D5D58 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
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
	b _080D5DA0
	.align 2, 0
_080D5D4C: .4byte gBattleAnimArgs
_080D5D50: .4byte gMain
_080D5D54: .4byte 0x0000043d
_080D5D58: .4byte gBattleAnimBankTarget
_080D5D5C:
	ldr r0, _080D5D80 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
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
	b _080D5DA0
	.align 2, 0
_080D5D80: .4byte gBattleAnimBankTarget
_080D5D84:
	adds r0, r2, 0
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x83
	bls _080D5D98
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1D
	b _080D5D9E
_080D5D98:
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1F
_080D5D9E:
	strb r0, [r1]
_080D5DA0:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080D5DC8
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080D5DC8:
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r0, 0x1E
	bne _080D5DD6
	adds r0, r4, 0
	bl move_anim_8072740
_080D5DD6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D5CC0

	thumb_func_start sub_80D5DDC
sub_80D5DDC: @ 80D5DDC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080D5E3C @ =gTasks
	adds r4, r1, r0
	ldr r0, _080D5E40 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	movs r2, 0x1
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	bne _080D5E02
	movs r1, 0x1
_080D5E02:
	strh r1, [r4, 0x20]
	ldr r0, _080D5E44 @ =gBattleAnimBankTarget
	ldrb r1, [r0]
	movs r0, 0x2
	eors r0, r1
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	strh r0, [r4, 0x22]
	movs r0, 0x1
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x24]
	movs r0, 0x3
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	ldr r0, _080D5E48 @ =sub_80D5E4C
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D5E3C: .4byte gTasks
_080D5E40: .4byte gBattleAnimBankAttacker
_080D5E44: .4byte gBattleAnimBankTarget
_080D5E48: .4byte sub_80D5E4C
	thumb_func_end sub_80D5DDC

	thumb_func_start sub_80D5E4C
sub_80D5E4C: @ 80D5E4C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080D5E70 @ =gTasks
	adds r2, r0, r1
	movs r0, 0x8
	ldrsh r3, [r2, r0]
	cmp r3, 0x1
	beq _080D5F14
	cmp r3, 0x1
	bgt _080D5E74
	cmp r3, 0
	beq _080D5E82
	b _080D6074
	.align 2, 0
_080D5E70: .4byte gTasks
_080D5E74:
	cmp r3, 0x2
	bne _080D5E7A
	b _080D5F9C
_080D5E7A:
	cmp r3, 0x3
	bne _080D5E80
	b _080D6030
_080D5E80:
	b _080D6074
_080D5E82:
	movs r1, 0x20
	ldrsh r0, [r2, r1]
	lsls r0, 1
	ldrh r5, [r2, 0x1C]
	adds r0, r5
	strh r0, [r2, 0x1C]
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D5EB4
	strh r3, [r2, 0xA]
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D5EB0
	movs r0, 0x2
	b _080D5EB2
_080D5EB0:
	ldr r0, _080D5F0C @ =0x0000fffe
_080D5EB2:
	strh r0, [r2, 0x1E]
_080D5EB4:
	movs r1, 0
	strh r1, [r2, 0xE]
	movs r7, 0x22
	ldrsh r0, [r2, r7]
	cmp r1, r0
	bge _080D5EF6
	ldr r4, _080D5F10 @ =gSprites
	adds r3, r2, 0
	adds r3, 0x8
_080D5EC6:
	movs r1, 0xE
	ldrsh r0, [r2, r1]
	adds r0, 0xE
	lsls r0, 1
	adds r0, r3, r0
	movs r5, 0
	ldrsh r0, [r0, r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r2, 0x1E]
	ldrh r7, [r2, 0x1C]
	adds r0, r7
	strh r0, [r1, 0x24]
	ldrh r0, [r2, 0xE]
	adds r0, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	asrs r0, 16
	movs r5, 0x22
	ldrsh r1, [r2, r5]
	cmp r0, r1
	blt _080D5EC6
_080D5EF6:
	ldrh r0, [r2, 0x1A]
	adds r0, 0x1
	strh r0, [r2, 0x1A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	beq _080D5F06
	b _080D6074
_080D5F06:
	movs r0, 0
	strh r0, [r2, 0x1A]
	b _080D6020
	.align 2, 0
_080D5F0C: .4byte 0x0000fffe
_080D5F10: .4byte gSprites
_080D5F14:
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080D5F3C
	movs r0, 0
	strh r0, [r2, 0xA]
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
	ands r0, r3
	lsls r0, 16
	cmp r0, 0
	beq _080D5F38
	movs r0, 0x2
	b _080D5F3A
_080D5F38:
	ldr r0, _080D5F94 @ =0x0000fffe
_080D5F3A:
	strh r0, [r2, 0x1E]
_080D5F3C:
	movs r1, 0
	strh r1, [r2, 0xE]
	movs r7, 0x22
	ldrsh r0, [r2, r7]
	cmp r1, r0
	bge _080D5F7E
	ldr r4, _080D5F98 @ =gSprites
	adds r3, r2, 0
	adds r3, 0x8
_080D5F4E:
	movs r1, 0xE
	ldrsh r0, [r2, r1]
	adds r0, 0xE
	lsls r0, 1
	adds r0, r3, r0
	movs r5, 0
	ldrsh r0, [r0, r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r2, 0x1E]
	ldrh r7, [r2, 0x1C]
	adds r0, r7
	strh r0, [r1, 0x24]
	ldrh r0, [r2, 0xE]
	adds r0, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	asrs r0, 16
	movs r5, 0x22
	ldrsh r1, [r2, r5]
	cmp r0, r1
	blt _080D5F4E
_080D5F7E:
	ldrh r0, [r2, 0x1A]
	adds r0, 0x1
	strh r0, [r2, 0x1A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x60
	bne _080D6074
	movs r0, 0
	strh r0, [r2, 0x1A]
	b _080D6020
	.align 2, 0
_080D5F94: .4byte 0x0000fffe
_080D5F98: .4byte gSprites
_080D5F9C:
	movs r7, 0x20
	ldrsh r1, [r2, r7]
	lsls r1, 1
	ldrh r0, [r2, 0x1C]
	subs r0, r1
	strh r0, [r2, 0x1C]
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D5FD0
	movs r0, 0
	strh r0, [r2, 0xA]
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D5FCC
	strh r3, [r2, 0x1E]
	b _080D5FD0
_080D5FCC:
	ldr r0, _080D6028 @ =0x0000fffe
	strh r0, [r2, 0x1E]
_080D5FD0:
	movs r1, 0
	strh r1, [r2, 0xE]
	movs r3, 0x22
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bge _080D6012
	ldr r4, _080D602C @ =gSprites
	adds r3, r2, 0
	adds r3, 0x8
_080D5FE2:
	movs r5, 0xE
	ldrsh r0, [r2, r5]
	adds r0, 0xE
	lsls r0, 1
	adds r0, r3, r0
	movs r7, 0
	ldrsh r0, [r0, r7]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r2, 0x1E]
	ldrh r5, [r2, 0x1C]
	adds r0, r5
	strh r0, [r1, 0x24]
	ldrh r0, [r2, 0xE]
	adds r0, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	asrs r0, 16
	movs r7, 0x22
	ldrsh r1, [r2, r7]
	cmp r0, r1
	blt _080D5FE2
_080D6012:
	ldrh r0, [r2, 0x1A]
	adds r0, 0x1
	strh r0, [r2, 0x1A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	bne _080D6074
_080D6020:
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _080D6074
	.align 2, 0
_080D6028: .4byte 0x0000fffe
_080D602C: .4byte gSprites
_080D6030:
	movs r1, 0
	strh r1, [r2, 0xE]
	movs r3, 0x22
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bge _080D606E
	ldr r6, _080D607C @ =gSprites
	adds r3, r2, 0
	adds r3, 0x8
	movs r5, 0
_080D6044:
	movs r7, 0xE
	ldrsh r0, [r2, r7]
	adds r0, 0xE
	lsls r0, 1
	adds r0, r3, r0
	movs r7, 0
	ldrsh r1, [r0, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r5, [r0, 0x24]
	ldrh r0, [r2, 0xE]
	adds r0, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	asrs r0, 16
	movs r7, 0x22
	ldrsh r1, [r2, r7]
	cmp r0, r1
	blt _080D6044
_080D606E:
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080D6074:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D607C: .4byte gSprites
	thumb_func_end sub_80D5E4C

	thumb_func_start sub_80D6080
sub_80D6080: @ 80D6080
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r0, sp
	bl sub_8078914
	mov r0, sp
	ldrb r0, [r0, 0x8]
	lsls r0, 4
	ldr r1, _080D60B0 @ =gBattleAnimArgs
	ldrb r2, [r1]
	ldrh r3, [r1, 0x2]
	movs r1, 0x10
	bl BlendPalette
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D60B0: .4byte gBattleAnimArgs
	thumb_func_end sub_80D6080

	thumb_func_start sub_80D60B4
sub_80D60B4: @ 80D60B4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _080D610C @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r2, r0, r1
	movs r3, 0x8
	ldrsh r0, [r2, r3]
	mov r9, r1
	ldr r4, _080D6110 @ =gBattleAnimArgs
	mov r8, r4
	cmp r0, 0
	bne _080D60EA
	ldrh r0, [r4]
	strh r0, [r2, 0xA]
	ldrh r0, [r4, 0x2]
	strh r0, [r2, 0xC]
	ldrh r0, [r4, 0x4]
	strh r0, [r2, 0xE]
	ldrh r0, [r4, 0x6]
	strh r0, [r2, 0x10]
_080D60EA:
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	ldr r1, _080D6114 @ =gObjectBankIDs
	ldr r0, _080D6118 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	adds r0, r1
	ldrb r6, [r0]
	movs r5, 0x10
	ldrsh r0, [r2, r5]
	cmp r0, 0
	bne _080D6120
	ldr r4, _080D611C @ =gUnknown_083D9794
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	b _080D6126
	.align 2, 0
_080D610C: .4byte gTasks
_080D6110: .4byte gBattleAnimArgs
_080D6114: .4byte gObjectBankIDs
_080D6118: .4byte gBattleAnimBankTarget
_080D611C: .4byte gUnknown_083D9794
_080D6120:
	ldr r4, _080D616C @ =gUnknown_083D97A4
	movs r3, 0x8
	ldrsh r0, [r2, r3]
_080D6126:
	movs r1, 0xA
	bl __modsi3
	lsls r0, 16
	asrs r0, 16
	adds r0, r4
	ldrb r5, [r0]
	lsls r0, r7, 2
	adds r1, r0, r7
	lsls r1, 3
	add r1, r9
	movs r4, 0xE
	ldrsh r1, [r1, r4]
	mov r12, r0
	cmp r1, 0x1
	bne _080D6174
	ldr r2, _080D6170 @ =gSprites
	lsls r3, r6, 4
	adds r0, r3, r6
	lsls r0, 2
	adds r0, r2
	mov r10, r0
	mov r0, r8
	movs r4, 0x2
	ldrsh r1, [r0, r4]
	lsls r0, r5, 24
	asrs r0, 24
	muls r0, r1
	cmp r0, 0
	bge _080D6164
	negs r0, r0
_080D6164:
	mov r5, r10
	strh r0, [r5, 0x26]
	b _080D618E
	.align 2, 0
_080D616C: .4byte gUnknown_083D97A4
_080D6170: .4byte gSprites
_080D6174:
	ldr r3, _080D61C4 @ =gSprites
	lsls r4, r6, 4
	adds r2, r4, r6
	lsls r2, 2
	adds r2, r3
	lsls r0, r5, 24
	asrs r0, 24
	mov r5, r8
	ldrh r1, [r5, 0x2]
	muls r0, r1
	strh r0, [r2, 0x24]
	adds r2, r3, 0
	adds r3, r4, 0
_080D618E:
	mov r1, r12
	adds r0, r1, r7
	lsls r0, 3
	add r0, r9
	movs r4, 0x8
	ldrsh r1, [r0, r4]
	movs r5, 0xA
	ldrsh r0, [r0, r5]
	cmp r1, r0
	bne _080D61B4
	adds r0, r3, r6
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x24]
	strh r1, [r0, 0x26]
	adds r0, r7, 0
	bl DestroyAnimVisualTask
_080D61B4:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D61C4: .4byte gSprites
	thumb_func_end sub_80D60B4

	thumb_func_start sub_80D61C8
sub_80D61C8: @ 80D61C8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080D61E8 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080D61F0
	ldr r0, _080D61EC @ =gBattleAnimArgs
	ldrh r1, [r4, 0x20]
	ldrh r2, [r0]
	subs r1, r2
	strh r1, [r4, 0x20]
	b _080D61FC
	.align 2, 0
_080D61E8: .4byte gBattleAnimBankAttacker
_080D61EC: .4byte gBattleAnimArgs
_080D61F0:
	ldr r1, _080D6210 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	adds r0, r1, 0
_080D61FC:
	ldrh r0, [r0, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, _080D6214 @ =sub_80D6218
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D6210: .4byte gBattleAnimArgs
_080D6214: .4byte sub_80D6218
	thumb_func_end sub_80D61C8

	thumb_func_start sub_80D6218
sub_80D6218: @ 80D6218
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080D622E
	adds r0, r2, 0
	bl move_anim_8072740
_080D622E:
	pop {r0}
	bx r0
	thumb_func_end sub_80D6218

	thumb_func_start sub_80D6234
sub_80D6234: @ 80D6234
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080D6254 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080D625C
	ldr r0, _080D6258 @ =gBattleAnimArgs
	ldrh r1, [r4, 0x20]
	ldrh r0, [r0]
	subs r1, r0
	strh r1, [r4, 0x20]
	b _080D6266
	.align 2, 0
_080D6254: .4byte gBattleAnimBankAttacker
_080D6258: .4byte gBattleAnimArgs
_080D625C:
	ldr r0, _080D6270 @ =gBattleAnimArgs
	ldrh r0, [r0]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
_080D6266:
	ldr r0, _080D6274 @ =sub_80D6278
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D6270: .4byte gBattleAnimArgs
_080D6274: .4byte sub_80D6278
	thumb_func_end sub_80D6234

	thumb_func_start sub_80D6278
sub_80D6278: @ 80D6278
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080D628E
	adds r0, r2, 0
	bl move_anim_8074EE0
_080D628E:
	pop {r0}
	bx r0
	thumb_func_end sub_80D6278

	thumb_func_start sub_80D6294
sub_80D6294: @ 80D6294
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080D62D8 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r0, _080D62DC @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080D62E4
	ldr r2, _080D62E0 @ =gBattleAnimArgs
	ldrh r0, [r5, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x22]
	ldrh r1, [r2, 0x2]
	subs r0, r1
	strh r0, [r5, 0x22]
	b _080D62F8
	.align 2, 0
_080D62D8: .4byte gBattleAnimBankTarget
_080D62DC: .4byte gBattleAnimBankAttacker
_080D62E0: .4byte gBattleAnimArgs
_080D62E4:
	ldr r0, _080D631C @ =gBattleAnimArgs
	ldrh r1, [r0]
	ldrh r2, [r5, 0x20]
	adds r1, r2
	strh r1, [r5, 0x20]
	ldrh r1, [r0, 0x2]
	ldrh r2, [r5, 0x22]
	adds r1, r2
	strh r1, [r5, 0x22]
	adds r2, r0, 0
_080D62F8:
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldrh r0, [r2, 0x4]
	strh r0, [r5, 0x30]
	ldrh r0, [r2, 0x6]
	strh r0, [r5, 0x32]
	ldrh r0, [r2, 0x8]
	strh r0, [r5, 0x34]
	ldr r1, _080D6320 @ =move_anim_8074EE0
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	ldr r0, _080D6324 @ =sub_8078114
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D631C: .4byte gBattleAnimArgs
_080D6320: .4byte move_anim_8074EE0
_080D6324: .4byte sub_8078114
	thumb_func_end sub_80D6294

	thumb_func_start sub_80D6328
sub_80D6328: @ 80D6328
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r0, _080D6340 @ =gBattleAnimArgs
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	beq _080D63A0
	cmp r0, 0x1
	bgt _080D6344
	cmp r0, 0
	beq _080D634E
	b _080D63A0
	.align 2, 0
_080D6340: .4byte gBattleAnimArgs
_080D6344:
	cmp r0, 0x2
	beq _080D6358
	cmp r0, 0x3
	beq _080D637C
	b _080D63A0
_080D634E:
	ldr r0, _080D6354 @ =gBattleAnimBankAttacker
	b _080D63A2
	.align 2, 0
_080D6354: .4byte gBattleAnimBankAttacker
_080D6358:
	ldr r4, _080D6370 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r6, 0x2
	eors r0, r6
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	bne _080D6374
	ldrb r4, [r4]
	b _080D63A4
	.align 2, 0
_080D6370: .4byte gBattleAnimBankAttacker
_080D6374:
	ldrb r0, [r4]
	adds r4, r6, 0
	eors r4, r0
	b _080D63A4
_080D637C:
	ldr r0, _080D6398 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	movs r4, 0x2
	eors r0, r4
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080D63A0
	ldr r0, _080D639C @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	eors r4, r0
	b _080D63A4
	.align 2, 0
_080D6398: .4byte gBattleAnimBankAttacker
_080D639C: .4byte gBattleAnimBankTarget
_080D63A0:
	ldr r0, _080D63C4 @ =gBattleAnimBankTarget
_080D63A2:
	ldrb r4, [r0]
_080D63A4:
	ldr r0, _080D63C8 @ =gBattleAnimArgs
	movs r2, 0xA
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bne _080D63CC
	adds r0, r4, 0
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	adds r0, r4, 0
	movs r1, 0x1
	b _080D63DE
	.align 2, 0
_080D63C4: .4byte gBattleAnimBankTarget
_080D63C8: .4byte gBattleAnimArgs
_080D63CC:
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	adds r0, r4, 0
	movs r1, 0x3
_080D63DE:
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r7, _080D647C @ =gSineTable
	ldr r6, _080D6480 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r6, r1]
	lsls r0, 1
	adds r0, r7
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r2, 0x2
	ldrsh r0, [r6, r2]
	muls r0, r1
	asrs r0, 8
	strh r0, [r5, 0x24]
	movs r1, 0
	ldrsh r0, [r6, r1]
	adds r0, 0x40
	lsls r0, 1
	adds r0, r7
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r2, 0x2
	ldrsh r0, [r6, r2]
	muls r0, r1
	asrs r0, 8
	strh r0, [r5, 0x26]
	ldrh r1, [r6, 0xC]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D6442
	adds r0, r4, 0
	bl sub_8079ED4
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	lsls r0, 2
	ldrb r2, [r5, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x5]
_080D6442:
	ldrb r2, [r5, 0x3]
	lsls r2, 26
	lsrs r2, 27
	movs r0, 0x4
	ldrsh r1, [r6, r0]
	lsls r0, r1, 1
	adds r0, r7
	ldrh r0, [r0]
	ldr r3, _080D6484 @ =gOamMatrices
	lsls r2, 3
	adds r2, r3
	adds r1, 0x40
	lsls r1, 1
	adds r1, r7
	ldrh r1, [r1]
	strh r1, [r2, 0x6]
	strh r1, [r2]
	strh r0, [r2, 0x2]
	lsls r0, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r2, 0x4]
	ldrh r0, [r6, 0x6]
	strh r0, [r5, 0x2E]
	ldr r0, _080D6488 @ =sub_80DA48C
	str r0, [r5, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D647C: .4byte gSineTable
_080D6480: .4byte gBattleAnimArgs
_080D6484: .4byte gOamMatrices
_080D6488: .4byte sub_80DA48C
	thumb_func_end sub_80D6328

	thumb_func_start sub_80D648C
sub_80D648C: @ 80D648C
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r5, _080D6500 @ =gBattleAnimArgs
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldr r6, _080D6504 @ =gBattleAnimBankTarget
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x38]
	ldrh r0, [r5, 0xA]
	strh r0, [r4, 0x3A]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x3C]
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	lsls r0, 2
	adds r1, r0
	ldr r3, _080D6508 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080D650C @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	ldr r1, _080D6510 @ =sub_80D6514
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D6500: .4byte gBattleAnimArgs
_080D6504: .4byte gBattleAnimBankTarget
_080D6508: .4byte 0x000003ff
_080D650C: .4byte 0xfffffc00
_080D6510: .4byte sub_80D6514
	thumb_func_end sub_80D648C

	thumb_func_start sub_80D6514
sub_80D6514: @ 80D6514
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	bne _080D657E
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	ldrh r2, [r4, 0x3C]
	adds r0, r2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3C]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r1, 0x3
	bl __modsi3
	lsls r0, 16
	cmp r0, 0
	bne _080D6584
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _080D6584
_080D657E:
	adds r0, r4, 0
	bl move_anim_8072740
_080D6584:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D6514

	thumb_func_start sub_80D658C
sub_80D658C: @ 80D658C
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x38]
	subs r0, 0x1
	strh r0, [r3, 0x38]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080D65C4
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
	ldrh r0, [r3, 0x36]
	strh r0, [r3, 0x38]
_080D65C4:
	ldrh r0, [r3, 0x34]
	subs r1, r0, 0x1
	strh r1, [r3, 0x34]
	lsls r0, 16
	cmp r0, 0
	bgt _080D65D6
	adds r0, r3, 0
	bl move_anim_8072740
_080D65D6:
	pop {r0}
	bx r0
	thumb_func_end sub_80D658C

	thumb_func_start sub_80D65DC
sub_80D65DC: @ 80D65DC
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r0, _080D6644 @ =gMain
	ldr r1, _080D6648 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080D65FE
	ldr r0, _080D664C @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080D6606
_080D65FE:
	ldr r1, _080D6650 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
_080D6606:
	ldr r5, _080D664C @ =gBattleAnimBankTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	ldr r4, _080D6650 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r6, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x22]
	ldrh r0, [r4]
	strh r0, [r6, 0x34]
	ldrh r0, [r4, 0x6]
	strh r0, [r6, 0x36]
	strh r0, [r6, 0x38]
	ldr r0, _080D6654 @ =sub_80D658C
	str r0, [r6, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D6644: .4byte gMain
_080D6648: .4byte 0x0000043d
_080D664C: .4byte gBattleAnimBankTarget
_080D6650: .4byte gBattleAnimArgs
_080D6654: .4byte sub_80D658C
	thumb_func_end sub_80D65DC

	thumb_func_start sub_80D6658
sub_80D6658: @ 80D6658
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r1, _080D6674 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x6]
	strh r0, [r5, 0x2E]
	movs r2, 0xE
	ldrsh r0, [r1, r2]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080D667C
	ldr r0, _080D6678 @ =gBattleAnimBankTarget
	b _080D667E
	.align 2, 0
_080D6674: .4byte gBattleAnimArgs
_080D6678: .4byte gBattleAnimBankTarget
_080D667C:
	ldr r0, _080D670C @ =gBattleAnimBankAttacker
_080D667E:
	ldrb r6, [r0]
	ldr r0, _080D6710 @ =gMain
	ldr r3, _080D6714 @ =0x0000043d
	adds r0, r3
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080D669C
	adds r0, r6, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080D66A4
_080D669C:
	ldr r1, _080D6718 @ =gBattleAnimArgs
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_080D66A4:
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	ldr r4, _080D6718 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r5, 0x20]
	adds r0, r6, 0
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r4, 0x2]
	adds r0, r2
	strh r0, [r5, 0x22]
	ldrh r1, [r4, 0xE]
	ldr r0, _080D671C @ =0x00007fff
	ands r0, r1
	strh r0, [r5, 0x36]
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x38]
	ldrh r0, [r4, 0xA]
	strh r0, [r5, 0x3A]
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x3C]
	ldrh r2, [r5, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	lsls r0, 2
	adds r1, r0
	ldr r3, _080D6720 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080D6724 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	ldr r1, _080D6728 @ =sub_80D672C
	str r1, [r5, 0x1C]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D670C: .4byte gBattleAnimBankAttacker
_080D6710: .4byte gMain
_080D6714: .4byte 0x0000043d
_080D6718: .4byte gBattleAnimArgs
_080D671C: .4byte 0x00007fff
_080D6720: .4byte 0x000003ff
_080D6724: .4byte 0xfffffc00
_080D6728: .4byte sub_80D672C
	thumb_func_end sub_80D6658

	thumb_func_start sub_80D672C
sub_80D672C: @ 80D672C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x3C]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3C]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl __modsi3
	cmp r0, 0
	bne _080D6782
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080D6782:
	ldrh r0, [r4, 0x2E]
	subs r1, r0, 0x1
	strh r1, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bgt _080D6794
	adds r0, r4, 0
	bl move_anim_8072740
_080D6794:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D672C

	thumb_func_start sub_80D679C
sub_80D679C: @ 80D679C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_8078764
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	ldr r3, _080D67D8 @ =gBattleAnimArgs
	movs r5, 0x6
	ldrsh r0, [r3, r5]
	lsls r0, 2
	adds r1, r0
	ldr r5, _080D67DC @ =0x000003ff
	adds r0, r5, 0
	ands r1, r0
	ldr r0, _080D67E0 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	movs r1, 0x6
	ldrsh r0, [r3, r1]
	cmp r0, 0x1
	bne _080D67E4
	ldrb r0, [r4, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x10
	b _080D67F2
	.align 2, 0
_080D67D8: .4byte gBattleAnimArgs
_080D67DC: .4byte 0x000003ff
_080D67E0: .4byte 0xfffffc00
_080D67E4:
	cmp r0, 0x2
	bne _080D67F6
	ldrb r0, [r4, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x20
_080D67F2:
	orrs r1, r0
	strb r1, [r4, 0x3]
_080D67F6:
	ldr r0, _080D6810 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x2E]
	ldr r0, _080D6814 @ =sub_80782D8
	str r0, [r4, 0x1C]
	ldr r1, _080D6818 @ =move_anim_8072740
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D6810: .4byte gBattleAnimArgs
_080D6814: .4byte sub_80782D8
_080D6818: .4byte move_anim_8072740
	thumb_func_end sub_80D679C

	thumb_func_start sub_80D681C
sub_80D681C: @ 80D681C
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _080D6864 @ =gBattleAnimBankTarget
	ldrb r0, [r6]
	movs r1, 0
	bl sub_8077ABC
	ldr r1, _080D6868 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r1
	lsls r0, 24
	ldr r5, _080D686C @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r5]
	adds r0, r1
	strh r0, [r4, 0x8]
	ldrb r0, [r6]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x2]
	adds r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0xC]
	ldr r0, _080D6870 @ =sub_80D6874
	str r0, [r4]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D6864: .4byte gBattleAnimBankTarget
_080D6868: .4byte gTasks
_080D686C: .4byte gBattleAnimArgs
_080D6870: .4byte sub_80D6874
	thumb_func_end sub_80D681C

	thumb_func_start sub_80D6874
sub_80D6874: @ 80D6874
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r5, 0
	movs r7, 0
	ldr r1, _080D68B4 @ =gTasks
	lsls r0, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	ldrb r2, [r0, 0xC]
	str r2, [sp]
	ldrh r4, [r0, 0x8]
	ldrh r6, [r0, 0xA]
	movs r3, 0xC
	ldrsh r0, [r0, r3]
	mov r10, r1
	cmp r0, 0
	bne _080D68B8
	movs r0, 0
	mov r8, r0
	movs r2, 0x1
	movs r1, 0x10
	mov r12, r1
	b _080D68C2
	.align 2, 0
_080D68B4: .4byte gTasks
_080D68B8:
	movs r2, 0x10
	mov r12, r2
	movs r3, 0x8
	mov r8, r3
	movs r2, 0x4
_080D68C2:
	mov r0, r9
	lsls r1, r0, 2
	adds r0, r1, r0
	lsls r0, 3
	add r0, r10
	movs r3, 0x1C
	ldrsh r0, [r0, r3]
	mov r10, r1
	cmp r0, 0xA
	bhi _080D69B8
	lsls r0, 2
	ldr r1, _080D68E0 @ =_080D68E4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D68E0: .4byte _080D68E4
	.align 2, 0
_080D68E4:
	.4byte _080D6910
	.4byte _080D69B8
	.4byte _080D6924
	.4byte _080D69B8
	.4byte _080D6944
	.4byte _080D69B8
	.4byte _080D695A
	.4byte _080D69B8
	.4byte _080D697C
	.4byte _080D69B8
	.4byte _080D69B0
_080D6910:
	ldr r0, _080D6920 @ =gSpriteTemplate_83D9938
	lsls r1, r4, 16
	asrs r1, 16
	lsls r2, r6, 16
	asrs r2, 16
	mov r4, r12
	lsls r3, r4, 16
	b _080D6992
	.align 2, 0
_080D6920: .4byte gSpriteTemplate_83D9938
_080D6924:
	mov r0, r12
	lsls r3, r0, 17
	mov r1, r8
	adds r0, r1, r2
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _080D6940 @ =gSpriteTemplate_83D9938
	lsls r1, r4, 16
	asrs r1, 16
	lsls r2, r6, 16
	asrs r2, 16
	b _080D6992
	.align 2, 0
_080D6940: .4byte gSpriteTemplate_83D9938
_080D6944:
	mov r3, r12
	lsls r0, r3, 16
	asrs r0, 16
	lsls r3, r0, 1
	adds r3, r0
	lsls r0, r2, 1
	add r0, r8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	b _080D6986
_080D695A:
	mov r0, r12
	lsls r3, r0, 18
	lsls r0, r2, 1
	adds r0, r2
	add r0, r8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _080D6978 @ =gSpriteTemplate_83D9938
	lsls r1, r4, 16
	asrs r1, 16
	lsls r2, r6, 16
	asrs r2, 16
	b _080D6992
	.align 2, 0
_080D6978: .4byte gSpriteTemplate_83D9938
_080D697C:
	mov r1, r12
	lsls r0, r1, 16
	asrs r0, 16
	lsls r3, r0, 2
	adds r3, r0
_080D6986:
	ldr r0, _080D69AC @ =gSpriteTemplate_83D9938
	lsls r1, r4, 16
	asrs r1, 16
	lsls r2, r6, 16
	asrs r2, 16
	lsls r3, 16
_080D6992:
	asrs r3, 16
	adds r2, r3
	lsls r2, 16
	asrs r2, 16
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	b _080D69B8
	.align 2, 0
_080D69AC: .4byte gSpriteTemplate_83D9938
_080D69B0:
	mov r0, r9
	bl DestroyAnimVisualTask
	b _080D69FC
_080D69B8:
	cmp r7, 0
	beq _080D69EC
	ldr r4, _080D6A0C @ =gSprites
	lsls r3, r5, 4
	adds r3, r5
	lsls r3, 2
	adds r0, r3, r4
	ldrh r5, [r0, 0x4]
	lsls r2, r5, 22
	lsrs r2, 22
	add r2, r8
	ldr r6, _080D6A10 @ =0x000003ff
	adds r1, r6, 0
	ands r2, r1
	ldr r1, _080D6A14 @ =0xfffffc00
	ands r1, r5
	orrs r1, r2
	strh r1, [r0, 0x4]
	mov r1, sp
	ldrh r1, [r1]
	strh r1, [r0, 0x2E]
	adds r4, 0x1C
	adds r3, r4
	ldr r1, [r3]
	bl _call_via_r1
_080D69EC:
	ldr r0, _080D6A18 @ =gTasks
	mov r1, r10
	add r1, r9
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1C]
	adds r0, 0x1
	strh r0, [r1, 0x1C]
_080D69FC:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D6A0C: .4byte gSprites
_080D6A10: .4byte 0x000003ff
_080D6A14: .4byte 0xfffffc00
_080D6A18: .4byte gTasks
	thumb_func_end sub_80D6874

	thumb_func_start sub_80D6A1C
sub_80D6A1C: @ 80D6A1C
	push {lr}
	adds r3, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080D6A3E
	ldrb r1, [r3, 0x1]
	movs r2, 0x3F
	adds r0, r2, 0
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r3, 0x1]
	ldrb r0, [r3, 0x3]
	ands r2, r0
	strb r2, [r3, 0x3]
	b _080D6A52
_080D6A3E:
	ldrb r2, [r3, 0x1]
	movs r1, 0x3F
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r3, 0x1]
	ldrb r0, [r3, 0x3]
	ands r1, r0
	movs r0, 0x40
	orrs r1, r0
	strb r1, [r3, 0x3]
_080D6A52:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	bne _080D6A66
	adds r0, r3, 0
	bl DestroySprite
_080D6A66:
	pop {r0}
	bx r0
	thumb_func_end sub_80D6A1C

	thumb_func_start sub_80D6A6C
sub_80D6A6C: @ 80D6A6C
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r0, _080D6AD4 @ =gBattleAnimArgs
	ldrh r1, [r0]
	ldrh r2, [r4, 0x20]
	adds r1, r2
	strh r1, [r4, 0x20]
	ldrh r0, [r0, 0x2]
	ldrh r3, [r4, 0x22]
	adds r0, r3
	strh r0, [r4, 0x22]
	ldr r0, _080D6AD8 @ =gBattleAnimSpriteTemplate_83D9950
	adds r1, 0x20
	lsls r1, 16
	asrs r1, 16
	movs r7, 0x22
	ldrsh r2, [r4, r7]
	adds r3, r4, 0
	adds r3, 0x43
	ldrb r3, [r3]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080D6ADC @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r6, r2, r3
	ldrh r5, [r6, 0x4]
	lsls r1, r5, 22
	lsrs r1, 22
	adds r1, 0x8
	ldr r7, _080D6AE0 @ =0x000003ff
	adds r0, r7, 0
	ands r1, r0
	ldr r0, _080D6AE4 @ =0xfffffc00
	ands r0, r5
	orrs r0, r1
	strh r0, [r6, 0x4]
	ldr r1, _080D6AE8 @ =gAnimVisualTaskCount
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	adds r3, 0x1C
	adds r2, r3
	ldr r0, _080D6AEC @ =sub_80D6AF0
	str r0, [r2]
	str r0, [r4, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D6AD4: .4byte gBattleAnimArgs
_080D6AD8: .4byte gBattleAnimSpriteTemplate_83D9950
_080D6ADC: .4byte gSprites
_080D6AE0: .4byte 0x000003ff
_080D6AE4: .4byte 0xfffffc00
_080D6AE8: .4byte gAnimVisualTaskCount
_080D6AEC: .4byte sub_80D6AF0
	thumb_func_end sub_80D6A6C

	thumb_func_start sub_80D6AF0
sub_80D6AF0: @ 80D6AF0
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080D6B24
	movs r0, 0
	strh r0, [r3, 0x2E]
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
_080D6B24:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x33
	bne _080D6B38
	adds r0, r3, 0
	bl move_anim_8072740
_080D6B38:
	pop {r0}
	bx r0
	thumb_func_end sub_80D6AF0

	thumb_func_start sub_80D6B3C
sub_80D6B3C: @ 80D6B3C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080D6B5C @ =gTasks
	adds r5, r1, r0
	ldr r0, _080D6B60 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080D6B68
	ldr r4, _080D6B64 @ =gBattleAnimBankAttacker
	b _080D6B6A
	.align 2, 0
_080D6B5C: .4byte gTasks
_080D6B60: .4byte gBattleAnimArgs
_080D6B64: .4byte gBattleAnimBankAttacker
_080D6B68:
	ldr r4, _080D6BAC @ =gBattleAnimBankTarget
_080D6B6A:
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x24]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x26]
	ldr r2, _080D6BB0 @ =gBattleAnimArgs
	ldrh r0, [r2, 0x2]
	movs r1, 0
	strh r0, [r5, 0x14]
	strh r1, [r5, 0x16]
	strh r1, [r5, 0x18]
	strh r1, [r5, 0x1A]
	strh r1, [r5, 0x1C]
	ldrh r0, [r2, 0x6]
	strh r0, [r5, 0x1E]
	strh r1, [r5, 0x20]
	ldrh r0, [r2, 0x4]
	strh r0, [r5, 0x22]
	ldr r0, _080D6BB4 @ =sub_80D6BB8
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D6BAC: .4byte gBattleAnimBankTarget
_080D6BB0: .4byte gBattleAnimArgs
_080D6BB4: .4byte sub_80D6BB8
	thumb_func_end sub_80D6B3C

	thumb_func_start sub_80D6BB8
sub_80D6BB8: @ 80D6BB8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	adds r2, r6, 0
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080D6CA0 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x14
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080D6CB8
	ldrh r0, [r5, 0x20]
	adds r0, 0x1
	movs r7, 0
	strh r0, [r5, 0x20]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x22
	ldrsh r1, [r5, r2]
	cmp r0, r1
	ble _080D6CC6
	strh r7, [r5, 0x20]
	ldr r0, _080D6CA4 @ =gSpriteTemplate_83D99B8
	movs r3, 0x24
	ldrsh r1, [r5, r3]
	movs r3, 0x26
	ldrsh r2, [r5, r3]
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080D6CC6
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _080D6CA8 @ =gSprites
	adds r4, r0
	ldr r1, _080D6CAC @ =gUnknown_083D9968
	movs r2, 0x1A
	ldrsh r0, [r5, r2]
	lsls r0, 1
	adds r0, r1
	movs r3, 0
	ldrsb r3, [r0, r3]
	ldrh r0, [r4, 0x20]
	adds r3, r0
	strh r3, [r4, 0x20]
	movs r2, 0x1A
	ldrsh r0, [r5, r2]
	lsls r0, 1
	adds r1, 0x1
	adds r0, r1
	movs r2, 0
	ldrsb r2, [r0, r2]
	ldrh r0, [r4, 0x22]
	adds r2, r0
	strh r2, [r4, 0x22]
	movs r1, 0x18
	ldrsh r0, [r5, r1]
	lsls r1, r0, 2
	adds r1, r0
	movs r0, 0x28
	subs r0, r1
	strh r0, [r4, 0x2E]
	strh r3, [r4, 0x30]
	ldrh r0, [r5, 0x24]
	strh r0, [r4, 0x32]
	strh r2, [r4, 0x34]
	ldrh r0, [r5, 0x26]
	strh r0, [r4, 0x36]
	strh r6, [r4, 0x38]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r1, _080D6CB0 @ =sub_80D6D00
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	ldr r0, _080D6CB4 @ =sub_8078600
	str r0, [r4, 0x1C]
	ldrh r0, [r5, 0x1A]
	adds r0, 0x1
	strh r0, [r5, 0x1A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _080D6C70
	strh r7, [r5, 0x1A]
_080D6C70:
	ldrh r0, [r5, 0x1C]
	adds r0, 0x1
	strh r0, [r5, 0x1C]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x1E
	ldrsh r1, [r5, r2]
	cmp r0, r1
	blt _080D6C92
	strh r7, [r5, 0x1C]
	ldrh r1, [r5, 0x18]
	movs r3, 0x18
	ldrsh r0, [r5, r3]
	cmp r0, 0x5
	bgt _080D6C92
	adds r0, r1, 0x1
	strh r0, [r5, 0x18]
_080D6C92:
	ldrh r0, [r5, 0x16]
	adds r0, 0x1
	strh r0, [r5, 0x16]
	ldrh r0, [r5, 0x14]
	subs r0, 0x1
	strh r0, [r5, 0x14]
	b _080D6CC6
	.align 2, 0
_080D6CA0: .4byte gTasks
_080D6CA4: .4byte gSpriteTemplate_83D99B8
_080D6CA8: .4byte gSprites
_080D6CAC: .4byte gUnknown_083D9968
_080D6CB0: .4byte sub_80D6D00
_080D6CB4: .4byte sub_8078600
_080D6CB8:
	movs r1, 0x16
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080D6CC6
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080D6CC6:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80D6BB8

	thumb_func_start sub_80D6CCC
sub_80D6CCC: @ 80D6CCC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	beq _080D6CF4
	ldr r2, _080D6CFC @ =gTasks
	movs r0, 0x38
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x16]
	subs r1, 0x1
	strh r1, [r0, 0x16]
	adds r0, r4, 0
	bl DestroySprite
_080D6CF4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D6CFC: .4byte gTasks
	thumb_func_end sub_80D6CCC

	thumb_func_start sub_80D6D00
sub_80D6D00: @ 80D6D00
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, _080D6D14 @ =sub_80D6CCC
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D6D14: .4byte sub_80D6CCC
	thumb_func_end sub_80D6D00

	thumb_func_start sub_80D6D18
sub_80D6D18: @ 80D6D18
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080D6D2C @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080D6D34
	ldr r4, _080D6D30 @ =gBattleAnimBankAttacker
	b _080D6D36
	.align 2, 0
_080D6D2C: .4byte gBattleAnimArgs
_080D6D30: .4byte gBattleAnimBankAttacker
_080D6D34:
	ldr r4, _080D6D64 @ =gBattleAnimBankTarget
_080D6D36:
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r1, _080D6D68 @ =move_anim_8074EE0
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	ldr r0, _080D6D6C @ =sub_80785E4
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D6D64: .4byte gBattleAnimBankTarget
_080D6D68: .4byte move_anim_8074EE0
_080D6D6C: .4byte sub_80785E4
	thumb_func_end sub_80D6D18

	thumb_func_start sub_80D6D70
sub_80D6D70: @ 80D6D70
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080D6D84 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080D6D8C
	ldr r4, _080D6D88 @ =gBattleAnimBankAttacker
	b _080D6D8E
	.align 2, 0
_080D6D84: .4byte gBattleAnimArgs
_080D6D88: .4byte gBattleAnimBankAttacker
_080D6D8C:
	ldr r4, _080D6DC8 @ =gBattleAnimBankTarget
_080D6D8E:
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r1, _080D6DCC @ =gBattleAnimArgs
	ldrh r0, [r1, 0x2]
	strh r0, [r5, 0x24]
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x26]
	ldr r1, _080D6DD0 @ =move_anim_8072740
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	ldr r0, _080D6DD4 @ =sub_8078600
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D6DC8: .4byte gBattleAnimBankTarget
_080D6DCC: .4byte gBattleAnimArgs
_080D6DD0: .4byte move_anim_8072740
_080D6DD4: .4byte sub_8078600
	thumb_func_end sub_80D6D70

	thumb_func_start sub_80D6DD8
sub_80D6DD8: @ 80D6DD8
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r4, _080D6E30 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x3A]
	movs r0, 0x10
	strh r0, [r5, 0x3C]
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080D6E26
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	negs r0, r0
	strh r0, [r5, 0x3C]
_080D6E26:
	ldr r0, _080D6E34 @ =sub_80D6E38
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D6E30: .4byte gBattleAnimBankAttacker
_080D6E34: .4byte sub_80D6E38
	thumb_func_end sub_80D6DD8

	thumb_func_start sub_80D6E38
sub_80D6E38: @ 80D6E38
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D6E4A
	cmp r0, 0x1
	beq _080D6E60
	b _080D6E90
_080D6E4A:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x28
	ble _080D6E90
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080D6E90
_080D6E60:
	ldrh r2, [r4, 0x3C]
	ldrh r1, [r4, 0x20]
	adds r0, r2, r1
	strh r0, [r4, 0x20]
	ldr r3, _080D6E98 @ =gSprites
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x24]
	adds r2, r1
	strh r2, [r0, 0x24]
	ldrh r0, [r4, 0x20]
	adds r0, 0x50
	lsls r0, 16
	movs r1, 0xC8
	lsls r1, 17
	cmp r0, r1
	bls _080D6E90
	adds r0, r4, 0
	bl move_anim_8074EE0
_080D6E90:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D6E98: .4byte gSprites
	thumb_func_end sub_80D6E38

	thumb_func_start sub_80D6E9C
sub_80D6E9C: @ 80D6E9C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	ldr r1, _080D6EC0 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080D6F30
	cmp r0, 0x1
	bgt _080D6EC4
	cmp r0, 0
	beq _080D6ED0
	b _080D7000
	.align 2, 0
_080D6EC0: .4byte gTasks
_080D6EC4:
	cmp r0, 0x2
	beq _080D6F8C
	cmp r0, 0x3
	bne _080D6ECE
	b _080D6FE0
_080D6ECE:
	b _080D7000
_080D6ED0:
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0
	strh r0, [r5, 0x26]
	ldr r4, _080D6F04 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x24]
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080D6F0C
	ldr r0, _080D6F08 @ =0x0000ffe0
	strh r0, [r5, 0x24]
	movs r0, 0x2
	b _080D6F12
	.align 2, 0
_080D6F04: .4byte gBattleAnimBankAttacker
_080D6F08: .4byte 0x0000ffe0
_080D6F0C:
	movs r0, 0x20
	strh r0, [r5, 0x24]
	ldr r0, _080D6F28 @ =0x0000fffe
_080D6F12:
	strh r0, [r5, 0x22]
	ldr r2, _080D6F2C @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r5, 0x24]
	strh r1, [r0, 0x24]
	b _080D6FD2
	.align 2, 0
_080D6F28: .4byte 0x0000fffe
_080D6F2C: .4byte gSprites
_080D6F30:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D7000
	movs r0, 0
	strh r0, [r5, 0xA]
	ldr r4, _080D6F88 @ =gSprites
	movs r1, 0x26
	ldrsh r0, [r5, r1]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	adds r2, 0x3E
	ldrb r3, [r2]
	lsls r0, r3, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldrh r1, [r5, 0x24]
	movs r2, 0x24
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080D6FD2
	ldrh r2, [r5, 0x22]
	adds r2, r1, r2
	strh r2, [r5, 0x24]
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r2, [r0, 0x24]
	b _080D7000
	.align 2, 0
_080D6F88: .4byte gSprites
_080D6F8C:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D7000
	movs r0, 0
	strh r0, [r5, 0xA]
	ldr r1, _080D6FDC @ =gSprites
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	adds r2, 0x3E
	ldrb r3, [r2]
	lsls r0, r3, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	bne _080D7000
_080D6FD2:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080D7000
	.align 2, 0
_080D6FDC: .4byte gSprites
_080D6FE0:
	ldr r2, _080D7008 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	adds r0, r3, 0
	bl DestroyAnimVisualTask
_080D7000:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D7008: .4byte gSprites
	thumb_func_end sub_80D6E9C

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
	ldr r4, _080D707C @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	bl GetBankSide
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
_080D707C: .4byte gBattleAnimBankAttacker
_080D7080: .4byte gBattleAnimArgs
_080D7084: .4byte 0x0000fff0
_080D7088:
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xE]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
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
	ldr r4, _080D70E4 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x12]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0xA
	ldrsh r1, [r5, r2]
	lsls r1, 5
	subs r0, r1
	strh r0, [r5, 0x10]
	b _080D7126
	.align 2, 0
_080D70E4: .4byte gBattleAnimBankTarget
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
	ldr r4, _080D72BC @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
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
_080D72BC: .4byte gBattleAnimBankAttacker
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
	ldr r4, _080D73A0 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x14]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x16]
	movs r0, 0x4
	strh r0, [r5, 0x18]
	ldr r0, _080D73A4 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_8077ABC
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
	bl sub_8076F98
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0x20]
	movs r0, 0x3F
	bl sub_8076F98
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
_080D73A0: .4byte gBattleAnimBankAttacker
_080D73A4: .4byte gBattleAnimBankTarget
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
	ldr r0, _080D7614 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_8077ABC
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
	ldr r4, _080D7614 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
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
_080D7614: .4byte gBattleAnimBankTarget
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

	thumb_func_start sub_80D76C4
sub_80D76C4: @ 80D76C4
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080D76F8
	ldr r3, _080D7700 @ =gTasks
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
_080D76F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D7700: .4byte gTasks
	thumb_func_end sub_80D76C4

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
	ldr r4, _080D7814 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r4, _080D7818 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r3, r0, 24
	ldrb r0, [r4]
	movs r1, 0x3
	str r3, [sp]
	bl sub_8077ABC
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
_080D7814: .4byte gBattleAnimBankTarget
_080D7818: .4byte gBattleAnimBankAttacker
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
	bl move_anim_8072740
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
	ldr r1, _080D7924 @ =move_anim_8072740
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
_080D7924: .4byte move_anim_8072740
_080D7928: .4byte sub_8078174
	thumb_func_end sub_80D78EC

	thumb_func_start sub_80D792C
sub_80D792C: @ 80D792C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _080D7960 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldr r0, _080D7964 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
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
_080D7960: .4byte gBattleAnimBankTarget
_080D7964: .4byte gBattleAnimBankAttacker
_080D7968: .4byte gBattleAnimArgs
_080D796C:
	ldr r0, _080D79A4 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
_080D7976:
	ldr r0, _080D79A8 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	ldr r1, _080D79A4 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r2, [r1, 0x6]
	adds r0, r2
	strh r0, [r4, 0x36]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x2E]
	ldr r1, _080D79AC @ =move_anim_8072740
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	ldr r0, _080D79B0 @ =sub_8078B34
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D79A4: .4byte gBattleAnimArgs
_080D79A8: .4byte gBattleAnimBankTarget
_080D79AC: .4byte move_anim_8072740
_080D79B0: .4byte sub_8078B34
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
	ldr r0, _080D7A18 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0x1
	bl sub_807A3FC
	ldr r0, _080D7A1C @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
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
_080D7A18: .4byte gBattleAnimBankTarget
_080D7A1C: .4byte gBattleAnimBankAttacker
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
	bl sub_80787B0
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
	ldr r4, _080D7AB0 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x6]
	adds r0, r6
	strh r0, [r5, 0x36]
	b _080D7AC6
	.align 2, 0
_080D7AAC: .4byte gBattleAnimArgs
_080D7AB0: .4byte gBattleAnimBankTarget
_080D7AB4:
	ldr r0, _080D7AE0 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	adds r2, r5, 0
	adds r2, 0x32
	adds r3, r5, 0
	adds r3, 0x36
	movs r1, 0x1
	bl sub_807A3FC
_080D7AC6:
	ldr r0, _080D7AE4 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
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
_080D7AE0: .4byte gBattleAnimBankTarget
_080D7AE4: .4byte gBattleAnimBankAttacker
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
	ldr r0, _080D7BFC @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
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
_080D7BFC: .4byte gBattleAnimBankAttacker
_080D7C00: .4byte 0x0000ffec
_080D7C04: .4byte sub_80D7C08
	thumb_func_end sub_80D7BA0

	thumb_func_start sub_80D7C08
sub_80D7C08: @ 80D7C08
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080D7C5C @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
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
_080D7C5C: .4byte gBattleAnimBankAttacker
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
	bl move_anim_8072740
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
	bl sub_80787B0
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
	ldr r4, _080D7D1C @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	b _080D7D32
	.align 2, 0
_080D7D18: .4byte gBattleAnimArgs
_080D7D1C: .4byte gBattleAnimBankTarget
_080D7D20:
	ldr r0, _080D7D50 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	adds r2, r5, 0
	adds r2, 0x32
	adds r3, r5, 0
	adds r3, 0x36
	movs r1, 0x1
	bl sub_807A3FC
_080D7D32:
	ldr r0, _080D7D54 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
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
_080D7D50: .4byte gBattleAnimBankTarget
_080D7D54: .4byte gBattleAnimBankAttacker
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
	bl move_anim_8072740
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
	ldr r0, _080D7EEC @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0
	bl sub_807A3FC
	ldr r0, _080D7EF0 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
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
_080D7EEC: .4byte gBattleAnimBankTarget
_080D7EF0: .4byte gBattleAnimBankAttacker
_080D7EF4:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080D7F08
	adds r0, r4, 0
	bl move_anim_8072740
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
	bl sub_80787B0
	b _080D7F72
	.align 2, 0
_080D7F30: .4byte gBattleAnimArgs
_080D7F34:
	ldr r4, _080D7F5C @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	adds r2, r5, 0
	adds r2, 0x20
	adds r3, r5, 0
	adds r3, 0x22
	movs r1, 0
	bl sub_807A3FC
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080D7F60
	ldrh r0, [r5, 0x20]
	ldrh r1, [r6]
	subs r0, r1
	b _080D7F66
	.align 2, 0
_080D7F5C: .4byte gBattleAnimBankAttacker
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
	ldr r0, _080D7F7C @ =gBattleAnimBankAttacker
	b _080D7FD0
	.align 2, 0
_080D7F78: .4byte gBattleAnimArgs
_080D7F7C: .4byte gBattleAnimBankAttacker
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
	ldr r4, _080D7FB8 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	adds r2, r5, 0
	adds r2, 0x20
	adds r3, r5, 0
	adds r3, 0x22
	movs r1, 0
	bl sub_807A3FC
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080D7FBC
	ldrh r0, [r5, 0x20]
	ldrh r1, [r6]
	subs r0, r1
	b _080D7FC2
	.align 2, 0
_080D7FB8: .4byte gBattleAnimBankTarget
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
	ldr r0, _080D7FF0 @ =gBattleAnimBankTarget
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
_080D7FF0: .4byte gBattleAnimBankTarget
_080D7FF4:
	movs r0, 0x40
_080D7FF6:
	strh r0, [r5, 0x3A]
	ldr r0, _080D803C @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	bl GetBankSide
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
	bl obj_translate_based_on_private_1_2_3_4
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
_080D803C: .4byte gBattleAnimBankTarget
_080D8040: .4byte gBattleAnimArgs
_080D8044: .4byte sub_80D8048
	thumb_func_end sub_80D7F10

	thumb_func_start sub_80D8048
sub_80D8048: @ 80D8048
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
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
	bl move_anim_8072740
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
	bl NotInBattle
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
	ldr r0, _080D81B4 @ =gUnknown_030042C0
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080D81B8 @ =gUnknown_030041B4
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
	bl NotInBattle
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
_080D81B4: .4byte gUnknown_030042C0
_080D81B8: .4byte gUnknown_030041B4
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
	ldr r2, _080D8220 @ =gUnknown_030042C0
	ldr r1, _080D8224 @ =0x0000ffff
	adds r0, r1, 0
	ldrh r4, [r2]
	adds r0, r4
	strh r0, [r2]
	ldr r1, _080D8228 @ =gUnknown_030041B4
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
_080D8220: .4byte gUnknown_030042C0
_080D8224: .4byte 0x0000ffff
_080D8228: .4byte gUnknown_030041B4
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
	bl NotInBattle
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
	ldr r2, _080D83D4 @ =gUnknown_030042C0
	ldr r4, _080D83D8 @ =gUnknown_030041B4
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
_080D83D4: .4byte gUnknown_030042C0
_080D83D8: .4byte gUnknown_030041B4
_080D83DC: .4byte REG_BLDCNT
	thumb_func_end sub_80D81E0

	thumb_func_start sub_80D83E0
sub_80D83E0: @ 80D83E0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080D840C @ =gBattleAnimBankAttacker
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	ldr r0, _080D8410 @ =sub_807941C
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D840C: .4byte gBattleAnimBankAttacker
_080D8410: .4byte sub_807941C
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
	bl NotInBattle
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
	ldr r0, _080D84EC @ =gUnknown_030042C0
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080D84F0 @ =gUnknown_030041B4
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
	bl NotInBattle
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
_080D84EC: .4byte gUnknown_030042C0
_080D84F0: .4byte gUnknown_030041B4
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
	ldr r3, _080D8558 @ =gUnknown_030042C0
	ldr r4, _080D855C @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r4
	ldrh r0, [r1, 0x26]
	ldrh r2, [r3]
	adds r0, r2
	strh r0, [r3]
	ldr r2, _080D8560 @ =gUnknown_030041B4
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
_080D8558: .4byte gUnknown_030042C0
_080D855C: .4byte gTasks
_080D8560: .4byte gUnknown_030041B4
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
	bl NotInBattle
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
	ldr r3, _080D86F4 @ =gUnknown_030042C0
	ldr r2, _080D86F8 @ =gUnknown_030041B4
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
_080D86F4: .4byte gUnknown_030042C0
_080D86F8: .4byte gUnknown_030041B4
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
	ldr r0, _080D87EC @ =gBattleAnimBankAttacker
	mov r8, r0
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_8077ABC
	adds r4, r0, 0
	ldr r7, _080D87F0 @ =gBattleAnimBankTarget
	ldrb r0, [r7]
	movs r1, 0x2
	bl sub_8077ABC
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
	bl GetAnimBankSpriteId
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
	ldr r4, _080D87EC @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
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
	ldr r4, _080D87F0 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
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
_080D87EC: .4byte gBattleAnimBankAttacker
_080D87F0: .4byte gBattleAnimBankTarget
_080D87F4: .4byte gBanksBySide
_080D87F8: .4byte gSprites
_080D87FC:
	ldrh r0, [r6, 0x2]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	strh r0, [r5, 0x30]
	ldr r4, _080D886C @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
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
	bl sub_8077ABC
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
	bl NotInBattle
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
	bl obj_translate_based_on_private_1_2_3_4
	ldr r0, _080D8870 @ =sub_80D8874
	str r0, [r5, 0x1C]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D886C: .4byte gBattleAnimBankTarget
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
	bl sub_8078B5C
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
	ldr r6, _080D8928 @ =gBattleAnimBankTarget
	ldrb r0, [r6]
	movs r1, 0
	bl sub_8077ABC
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
_080D8928: .4byte gBattleAnimBankTarget
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
	bl obj_translate_based_on_private_1_2_3_4
	b _080D8AD0
	.align 2, 0
_080D8964: .4byte gSineTable
_080D8968:
	adds r0, r4, 0
	bl sub_8078B5C
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
	ldr r0, _080D8A74 @ =gBattleAnimBankTarget
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
_080D8A74: .4byte gBattleAnimBankTarget
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
	bl sub_8078B5C
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
	bl GetBankByPlayerAI
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
	bl sub_8077ABC
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_8077ABC
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
	ldr r0, _080D8ECC @ =gDisableStructMoveAnim
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
	bl sub_80787B0
	ldr r6, _080D8ED0 @ =gBattleAnimArgs
	ldrh r0, [r6, 0x8]
	strh r0, [r5, 0x2E]
	ldr r0, _080D8ED4 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080D8E92
	ldrh r0, [r6, 0x4]
	negs r0, r0
	strh r0, [r6, 0x4]
_080D8E92:
	ldr r4, _080D8ED8 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x4]
	adds r0, r1
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x6]
	adds r0, r1
	strh r0, [r5, 0x36]
	ldrh r0, [r6, 0xA]
	strh r0, [r5, 0x38]
	adds r0, r5, 0
	bl sub_80786EC
	ldr r0, _080D8EDC @ =sub_80D8EE0
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D8ECC: .4byte gDisableStructMoveAnim
_080D8ED0: .4byte gBattleAnimArgs
_080D8ED4: .4byte gBattleAnimBankAttacker
_080D8ED8: .4byte gBattleAnimBankTarget
_080D8EDC: .4byte sub_80D8EE0
	thumb_func_end unc_080B06FC

	thumb_func_start sub_80D8EE0
sub_80D8EE0: @ 80D8EE0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080D8F02
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, _080D8F08 @ =sub_8078600
	str r0, [r4, 0x1C]
	ldr r1, _080D8F0C @ =move_anim_8072740
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
_080D8F02:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D8F08: .4byte sub_8078600
_080D8F0C: .4byte move_anim_8072740
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
	bl move_anim_8072740
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
	ldr r1, _080D8FEC @ =gDisableStructMoveAnim
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
_080D8FEC: .4byte gDisableStructMoveAnim
	thumb_func_end sub_80D8FC0

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
	ldr r1, _080D9028 @ =move_anim_8072740
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D9020: .4byte gBattleAnimArgs
_080D9024: .4byte sub_80782D8
_080D9028: .4byte move_anim_8072740
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
	ldr r0, _080D9074 @ =gBattleAnimBankAttacker
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
_080D9074: .4byte gBattleAnimBankAttacker
	thumb_func_end sub_80D902C

	thumb_func_start sub_80D9078
sub_80D9078: @ 80D9078
	push {r4,lr}
	adds r4, r0, 0
	bl NotInBattle
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
	ldr r1, _080D90F0 @ =move_anim_8072740
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D90E8: .4byte gBattleAnimArgs
_080D90EC: .4byte sub_80782D8
_080D90F0: .4byte move_anim_8072740
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
	ldr r0, _080D9114 @ =gBattleAnimBankAttacker
	b _080D911A
	.align 2, 0
_080D9110: .4byte gBattleAnimArgs
_080D9114: .4byte gBattleAnimBankAttacker
_080D9118:
	ldr r0, _080D9260 @ =gBattleAnimBankTarget
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
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	mov r0, r8
	movs r1, 0x3
	bl sub_8077ABC
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
_080D9260: .4byte gBattleAnimBankTarget
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
	bl move_anim_8072740
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
	ldr r1, _080D9374 @ =move_anim_8072740
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
_080D9368:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D9370: .4byte sub_8078B34
_080D9374: .4byte move_anim_8072740
	thumb_func_end sub_80D9328

	thumb_func_start sub_80D9378
sub_80D9378: @ 80D9378
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r0, _080D93F4 @ =gBattleAnimBankAttacker
	ldrb r1, [r0]
	movs r0, 0x2
	ldr r2, _080D93F8 @ =gBattleAnimBankTarget
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
	ldr r0, _080D93F4 @ =gBattleAnimBankAttacker
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
_080D93F4: .4byte gBattleAnimBankAttacker
_080D93F8: .4byte gBattleAnimBankTarget
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
	bl move_anim_8072740
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
	ldr r1, _080D94A4 @ =move_anim_8072740
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D94A0: .4byte sub_80782D8
_080D94A4: .4byte move_anim_8072740
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
	ldr r4, _080D9518 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
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
_080D9518: .4byte gBattleAnimBankTarget
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
	ldr r1, _080D953C @ =move_anim_8072740
	bl StoreSpriteCallbackInData
	pop {r0}
	bx r0
	.align 2, 0
_080D9538: .4byte sub_80782D8
_080D953C: .4byte move_anim_8072740
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
	bl move_anim_8072740
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
	ldr r4, _080D95E8 @ =gBattleAnimBankAttacker
	b _080D95EE
	.align 2, 0
_080D95E4: .4byte gBattleAnimArgs
_080D95E8: .4byte gBattleAnimBankAttacker
_080D95EC:
	ldr r4, _080D9634 @ =gBattleAnimBankTarget
_080D95EE:
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
_080D9634: .4byte gBattleAnimBankTarget
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
	bl move_anim_8072740
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
	bl move_anim_8072740
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
	ldr r4, _080D96E0 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r6, 0x4]
	adds r0, r2
	b _080D96F6
	.align 2, 0
_080D96DC: .4byte gBattleAnimArgs
_080D96E0: .4byte gBattleAnimBankAttacker
_080D96E4:
	ldr r4, _080D9740 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x4]
	adds r0, r1
_080D96F6:
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
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
_080D9740: .4byte gBattleAnimBankTarget
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
	bl move_anim_8072740
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
	bl move_anim_8072740
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
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r0, _080D9820 @ =gBattleAnimBankAttacker
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
	ldr r0, _080D9824 @ =gBattleAnimBankTarget
	b _080D9844
	.align 2, 0
_080D9818: .4byte gBattleAnimArgs
_080D981C: .4byte gBankAttacker
_080D9820: .4byte gBattleAnimBankAttacker
_080D9824: .4byte gBattleAnimBankTarget
_080D9828:
	ldr r0, _080D9860 @ =gBattleAnimBankTarget
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
	ldr r0, _080D9864 @ =gBattleAnimBankAttacker
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
_080D9860: .4byte gBattleAnimBankTarget
_080D9864: .4byte gBattleAnimBankAttacker
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
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	bl sub_8077ABC
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
	bl move_anim_8072740
	b _080D99DC
_080D997E:
	ldrh r0, [r7, 0x2E]
	subs r0, 0x1
	strh r0, [r7, 0x2E]
	b _080D99DC
_080D9986:
	ldr r4, _080D99E8 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r2, _080D99EC @ =gBattleAnimBankTarget
	mov r8, r2
	ldrb r0, [r2]
	movs r1, 0x2
	bl sub_8077ABC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x3
	bl sub_8077ABC
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
_080D99E8: .4byte gBattleAnimBankAttacker
_080D99EC: .4byte gBattleAnimBankTarget
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
	bl move_anim_8072740
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
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r0, _080D9A74 @ =gBattleAnimBankTarget
	ldrb r4, [r0]
	ldr r0, _080D9A78 @ =gBattleAnimBankAttacker
	b _080D9A82
	.align 2, 0
_080D9A6C: .4byte gBattleAnimArgs
_080D9A70: .4byte gBankAttacker
_080D9A74: .4byte gBattleAnimBankTarget
_080D9A78: .4byte gBattleAnimBankAttacker
_080D9A7C:
	ldr r0, _080D9AB4 @ =gBattleAnimBankAttacker
	ldrb r4, [r0]
	ldr r0, _080D9AB8 @ =gBattleAnimBankTarget
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
	bl NotInBattle
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
_080D9AB4: .4byte gBattleAnimBankAttacker
_080D9AB8: .4byte gBattleAnimBankTarget
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
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	adds r0, r4, 0
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r1, _080D9B1C @ =move_anim_8072740
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	ldr r0, _080D9B20 @ =sub_8078BB8
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D9B1C: .4byte move_anim_8072740
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
	bl move_anim_8072740
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
	ldr r4, _080D9BC4 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
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
	ldr r0, _080D9BCC @ =gUnknown_0202F7C4
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
_080D9BC4: .4byte gBattleAnimBankTarget
_080D9BC8: .4byte gBattleAnimArgs
_080D9BCC: .4byte gUnknown_0202F7C4
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
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080D9C0C
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	b _080D9C22
_080D9C0C:
	ldr r0, _080D9C34 @ =gBattleAnimBankAttacker
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
	ldr r1, _080D9C3C @ =move_anim_8072740
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D9C34: .4byte gBattleAnimBankAttacker
_080D9C38: .4byte sub_8078600
_080D9C3C: .4byte move_anim_8072740
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
	bl move_anim_8072740
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
	ldr r0, _080D9D0C @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080D9D14
	ldr r1, _080D9D10 @ =gUnknown_030041B0
	ldrh r0, [r4, 0x1A]
	lsls r0, 16
	asrs r0, 24
	ldrh r2, [r1]
	adds r0, r2
	strh r0, [r1]
	adds r7, r1, 0
	b _080D9D24
	.align 2, 0
_080D9D0C: .4byte gBattleAnimBankTarget
_080D9D10: .4byte gUnknown_030041B0
_080D9D14:
	ldr r2, _080D9D64 @ =gUnknown_030041B0
	ldrh r1, [r4, 0x1A]
	lsls r1, 16
	asrs r1, 24
	ldrh r0, [r2]
	subs r0, r1
	strh r0, [r2]
	adds r7, r2, 0
_080D9D24:
	ldr r3, _080D9D68 @ =gUnknown_030041B8
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
_080D9D64: .4byte gUnknown_030041B0
_080D9D68: .4byte gUnknown_030041B8
_080D9D6C: .4byte gBattleAnimArgs
	thumb_func_end sub_80D9C80

	thumb_func_start sub_80D9D70
sub_80D9D70: @ 80D9D70
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080D9DC4 @ =gBattleAnimArgs
	movs r1, 0x6
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D9D86
	adds r0, r5, 0
	movs r1, 0x2
	bl StartSpriteAnim
_080D9D86:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80787B0
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x2E]
	ldr r4, _080D9DC8 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	ldr r0, _080D9DCC @ =0x0000ffe2
	strh r0, [r5, 0x38]
	adds r0, r5, 0
	bl sub_80786EC
	ldr r0, _080D9DD0 @ =sub_80D9DD4
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D9DC4: .4byte gBattleAnimArgs
_080D9DC8: .4byte gBattleAnimBankTarget
_080D9DCC: .4byte 0x0000ffe2
_080D9DD0: .4byte sub_80D9DD4
	thumb_func_end sub_80D9D70

	thumb_func_start sub_80D9DD4
sub_80D9DD4: @ 80D9DD4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080D9DE8
	adds r0, r4, 0
	bl move_anim_8072740
_080D9DE8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D9DD4

	thumb_func_start sub_80D9DF0
sub_80D9DF0: @ 80D9DF0
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r5, _080D9E64 @ =gBattleAnimArgs
	movs r1, 0x6
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080D9E08
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
_080D9E08:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _080D9E68 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	mov r6, sp
	adds r6, 0x2
	movs r1, 0x1
	mov r2, sp
	adds r3, r6, 0
	bl sub_807A3FC
	ldr r0, _080D9E6C @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080D9E36
	ldrh r0, [r5, 0x8]
	negs r0, r0
	strh r0, [r5, 0x8]
_080D9E36:
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2E]
	mov r1, sp
	ldrh r0, [r5, 0x8]
	ldrh r1, [r1]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldrh r0, [r5, 0xA]
	ldrh r6, [r6]
	adds r0, r6
	strh r0, [r4, 0x36]
	ldr r0, _080D9E70 @ =0x0000ffe2
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_80786EC
	ldr r0, _080D9E74 @ =sub_80D9E78
	str r0, [r4, 0x1C]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D9E64: .4byte gBattleAnimArgs
_080D9E68: .4byte gBattleAnimBankTarget
_080D9E6C: .4byte gBattleAnimBankAttacker
_080D9E70: .4byte 0x0000ffe2
_080D9E74: .4byte sub_80D9E78
	thumb_func_end sub_80D9DF0

	thumb_func_start sub_80D9E78
sub_80D9E78: @ 80D9E78
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080D9E8C
	adds r0, r4, 0
	bl move_anim_8072740
_080D9E8C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D9E78

	thumb_func_start sub_80D9E94
sub_80D9E94: @ 80D9E94
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080D9EE0 @ =gBattleAnimArgs
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r1, [r5]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldrh r1, [r5, 0x2]
	adds r0, r1
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_8078A5C
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r2, 0x4
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r4, 0x38]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r2, 0x4
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r4, 0x3A]
	ldr r0, _080D9EE4 @ =sub_80D9EE8
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D9EE0: .4byte gBattleAnimArgs
_080D9EE4: .4byte sub_80D9EE8
	thumb_func_end sub_80D9E94

	thumb_func_start sub_80D9EE8
sub_80D9EE8: @ 80D9EE8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078394
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x38]
	subs r0, r1
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x32]
	ldrh r1, [r4, 0x3A]
	subs r0, r1
	strh r0, [r4, 0x32]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D9F0E
	adds r0, r4, 0
	bl move_anim_8072740
_080D9F0E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D9EE8

	thumb_func_start sub_80D9F14
sub_80D9F14: @ 80D9F14
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080D9F74 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0x1
	bl sub_807A3FC
	ldr r0, _080D9F78 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080D9F40
	ldr r1, _080D9F7C @ =gBattleAnimArgs
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_080D9F40:
	ldr r0, _080D9F7C @ =gBattleAnimArgs
	ldrh r2, [r0]
	ldrh r1, [r4, 0x20]
	adds r2, r1
	strh r2, [r4, 0x20]
	ldrh r1, [r0, 0x2]
	ldrh r3, [r4, 0x22]
	adds r1, r3
	strh r1, [r4, 0x22]
	ldrh r3, [r0, 0x8]
	strh r3, [r4, 0x2E]
	ldrh r0, [r0, 0x4]
	adds r2, r0
	strh r2, [r4, 0x32]
	adds r1, r3
	strh r1, [r4, 0x36]
	ldr r0, _080D9F80 @ =sub_8078B34
	str r0, [r4, 0x1C]
	ldr r1, _080D9F84 @ =move_anim_8072740
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D9F74: .4byte gBattleAnimBankTarget
_080D9F78: .4byte gBattleAnimBankAttacker
_080D9F7C: .4byte gBattleAnimArgs
_080D9F80: .4byte sub_8078B34
_080D9F84: .4byte move_anim_8072740
	thumb_func_end sub_80D9F14

	thumb_func_start sub_80D9F88
sub_80D9F88: @ 80D9F88
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080D9FA0 @ =gBattleAnimArgs
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080D9FA4
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8078764
	b _080D9FDA
	.align 2, 0
_080D9FA0: .4byte gBattleAnimArgs
_080D9FA4:
	ldr r0, _080D9FE4 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0x1
	bl sub_807A3FC
	ldr r0, _080D9FE8 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080D9FCA
	ldrh r0, [r5]
	negs r0, r0
	strh r0, [r5]
_080D9FCA:
	ldrh r0, [r5]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
_080D9FDA:
	ldr r0, _080D9FEC @ =sub_80D9FF0
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D9FE4: .4byte gBattleAnimBankTarget
_080D9FE8: .4byte gBattleAnimBankAttacker
_080D9FEC: .4byte sub_80D9FF0
	thumb_func_end sub_80D9F88

	thumb_func_start sub_80D9FF0
sub_80D9FF0: @ 80D9FF0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0xB
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x4
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x30]
	adds r0, 0x30
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	negs r0, r0
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080DA02C
	adds r0, r4, 0
	bl move_anim_8072740
_080DA02C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D9FF0

	thumb_func_start sub_80DA034
sub_80DA034: @ 80DA034
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_8078764
	ldrh r0, [r4, 0x22]
	adds r0, 0x14
	strh r0, [r4, 0x22]
	movs r0, 0xBF
	strh r0, [r4, 0x30]
	ldr r1, _080DA058 @ =sub_80DA05C
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DA058: .4byte sub_80DA05C
	thumb_func_end sub_80DA034

	thumb_func_start sub_80DA05C
sub_80DA05C: @ 80DA05C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x20
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x8
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0x5
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x47
	bne _080DA096
	adds r0, r4, 0
	bl move_anim_8072740
_080DA096:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DA05C

	thumb_func_start sub_80DA09C
sub_80DA09C: @ 80DA09C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080DA0CC @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldr r1, _080DA0D0 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x8]
	ldrh r0, [r1]
	strh r0, [r4, 0xA]
	ldr r0, _080DA0D4 @ =0x00002719
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xC]
	ldr r0, _080DA0D8 @ =sub_80DA0DC
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DA0CC: .4byte gTasks
_080DA0D0: .4byte gBattleAnimArgs
_080DA0D4: .4byte 0x00002719
_080DA0D8: .4byte sub_80DA0DC
	thumb_func_end sub_80DA09C

	thumb_func_start sub_80DA0DC
sub_80DA0DC: @ 80DA0DC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _080DA15C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r2
	ldrh r0, [r3, 0x1C]
	adds r1, r0, 0x1
	strh r1, [r3, 0x1C]
	lsls r0, 16
	asrs r0, 16
	movs r4, 0xA
	ldrsh r1, [r3, r4]
	adds r7, r2, 0
	cmp r0, r1
	bne _080DA13A
	movs r0, 0
	strh r0, [r3, 0x1C]
	ldrb r0, [r3, 0xC]
	ldr r2, _080DA160 @ =gPlttBufferFaded
	lsls r0, 4
	movs r3, 0x84
	lsls r3, 1
	adds r1, r0, r3
	lsls r1, 1
	adds r1, r2
	ldrh r6, [r1]
	movs r4, 0x7
	mov r12, r0
	ldr r0, _080DA164 @ =0x00000107
	add r0, r12
	lsls r0, 1
	adds r3, r0, r2
_080DA122:
	ldrh r0, [r3]
	strh r0, [r1]
	subs r3, 0x2
	subs r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bgt _080DA122
	ldr r0, _080DA168 @ =0x00000101
	add r0, r12
	lsls r0, 1
	adds r0, r2
	strh r6, [r0]
_080DA13A:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r7
	ldrh r1, [r0, 0x8]
	subs r1, 0x1
	strh r1, [r0, 0x8]
	lsls r1, 16
	cmp r1, 0
	bne _080DA154
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080DA154:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DA15C: .4byte gTasks
_080DA160: .4byte gPlttBufferFaded
_080DA164: .4byte 0x00000107
_080DA168: .4byte 0x00000101
	thumb_func_end sub_80DA0DC

	thumb_func_start sub_80DA16C
sub_80DA16C: @ 80DA16C
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _080DA1D8 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080DA18C
	ldr r1, _080DA1DC @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080DA18C:
	ldr r4, _080DA1DC @ =gBattleAnimArgs
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x2E]
	ldrh r0, [r6, 0x20]
	strh r0, [r6, 0x30]
	ldr r5, _080DA1E0 @ =gBattleAnimBankTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrh r0, [r6, 0x22]
	strh r0, [r6, 0x34]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x6]
	adds r0, r4
	strh r0, [r6, 0x36]
	adds r0, r6, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r0, _080DA1E4 @ =sub_80785E4
	str r0, [r6, 0x1C]
	ldr r1, _080DA1E8 @ =sub_80DA1EC
	adds r0, r6, 0
	bl StoreSpriteCallbackInData
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DA1D8: .4byte gBattleAnimBankAttacker
_080DA1DC: .4byte gBattleAnimArgs
_080DA1E0: .4byte gBattleAnimBankTarget
_080DA1E4: .4byte sub_80785E4
_080DA1E8: .4byte sub_80DA1EC
	thumb_func_end sub_80DA16C

	thumb_func_start sub_80DA1EC
sub_80DA1EC: @ 80DA1EC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	beq _080DA200
	adds r0, r4, 0
	bl move_anim_8072740
_080DA200:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DA1EC

	thumb_func_start sub_80DA208
sub_80DA208: @ 80DA208
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080DA2A4 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080DA234
	ldr r1, _080DA2A8 @ =gBattleAnimArgs
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
	ldrh r0, [r1, 0x6]
	negs r0, r0
	strh r0, [r1, 0x6]
_080DA234:
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080DA24C
	ldr r0, _080DA2A8 @ =gBattleAnimArgs
	ldrh r1, [r0, 0x2]
	negs r1, r1
	strh r1, [r0, 0x2]
	ldrh r1, [r0, 0x6]
	negs r1, r1
	strh r1, [r0, 0x6]
_080DA24C:
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	ldr r2, _080DA2A8 @ =gBattleAnimArgs
	ldrh r1, [r2]
	ldrh r3, [r5, 0x20]
	adds r1, r3
	strh r1, [r5, 0x20]
	lsrs r0, 24
	ldrh r1, [r2, 0x2]
	adds r0, r1
	strh r0, [r5, 0x22]
	ldrh r0, [r2, 0x8]
	strh r0, [r5, 0x2E]
	movs r3, 0xC
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _080DA2B0
	ldr r4, _080DA2AC @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	b _080DA2C2
	.align 2, 0
_080DA2A4: .4byte gBattleAnimBankAttacker
_080DA2A8: .4byte gBattleAnimArgs
_080DA2AC: .4byte gBattleAnimBankTarget
_080DA2B0:
	ldr r0, _080DA2F0 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	adds r2, r5, 0
	adds r2, 0x32
	adds r3, r5, 0
	adds r3, 0x36
	movs r1, 0x1
	bl sub_807A3FC
_080DA2C2:
	ldr r4, _080DA2F4 @ =gBattleAnimArgs
	ldrh r0, [r4, 0x4]
	ldrh r1, [r5, 0x32]
	adds r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r4, 0x6]
	ldrh r3, [r5, 0x36]
	adds r0, r3
	strh r0, [r5, 0x36]
	ldr r0, _080DA2F8 @ =sub_8078B34
	str r0, [r5, 0x1C]
	ldr r1, _080DA2FC @ =move_anim_8072740
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	ldrb r1, [r4, 0xA]
	adds r0, r5, 0
	bl SeekSpriteAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DA2F0: .4byte gBattleAnimBankTarget
_080DA2F4: .4byte gBattleAnimArgs
_080DA2F8: .4byte sub_8078B34
_080DA2FC: .4byte move_anim_8072740
	thumb_func_end sub_80DA208

	thumb_func_start sub_80DA300
sub_80DA300: @ 80DA300
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r1, _080DA33C @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x30]
	ldr r0, _080DA340 @ =sub_80DA348
	str r0, [r4, 0x1C]
	movs r0, 0
	bl GetAnimBankSpriteId
	ldr r2, _080DA344 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DA33C: .4byte gBattleAnimArgs
_080DA340: .4byte sub_80DA348
_080DA344: .4byte gSprites
	thumb_func_end sub_80DA300

	thumb_func_start sub_80DA348
sub_80DA348: @ 80DA348
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	cmp r0, 0
	ble _080DA35C
	subs r0, r1, 0x1
	strh r0, [r2, 0x2E]
	b _080DA36E
_080DA35C:
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x32]
	adds r0, r1
	strh r0, [r2, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r2, 0x26]
	subs r1, r0
	strh r1, [r2, 0x26]
_080DA36E:
	movs r3, 0x22
	ldrsh r0, [r2, r3]
	movs r3, 0x26
	ldrsh r1, [r2, r3]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	bge _080DA386
	adds r0, r2, 0
	bl move_anim_8072740
_080DA386:
	pop {r0}
	bx r0
	thumb_func_end sub_80DA348

	thumb_func_start sub_80DA38C
sub_80DA38C: @ 80DA38C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080DA3B4 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080DA3BC
	movs r0, 0x88
	lsls r0, 1
	strh r0, [r5, 0x20]
	ldr r0, _080DA3B8 @ =0x0000ffe0
	strh r0, [r5, 0x22]
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	b _080DA3C2
	.align 2, 0
_080DA3B4: .4byte gBattleAnimBankAttacker
_080DA3B8: .4byte 0x0000ffe0
_080DA3BC:
	ldr r0, _080DA400 @ =0x0000ffe0
	strh r0, [r5, 0x20]
	strh r0, [r5, 0x22]
_080DA3C2:
	ldr r0, _080DA404 @ =gBattleAnimArgs
	ldrh r0, [r0]
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldr r4, _080DA408 @ =gBattleAnimBankTarget
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
	ldr r0, _080DA40C @ =sub_80DA410
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DA400: .4byte 0x0000ffe0
_080DA404: .4byte gBattleAnimArgs
_080DA408: .4byte gBattleAnimBankTarget
_080DA40C: .4byte sub_80DA410
	thumb_func_end sub_80DA38C

	thumb_func_start sub_80DA410
sub_80DA410: @ 80DA410
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x1
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl sub_8078B5C
	ldrh r1, [r4, 0x34]
	lsrs r0, r1, 8
	cmp r0, 0xC8
	bls _080DA438
	ldrh r0, [r4, 0x24]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	movs r0, 0
	strh r0, [r4, 0x24]
	movs r0, 0xFF
	ands r0, r1
	strh r0, [r4, 0x34]
_080DA438:
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	adds r0, r1
	adds r0, 0x20
	movs r1, 0x98
	lsls r1, 1
	cmp r0, r1
	bhi _080DA45A
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	adds r0, r1
	cmp r0, 0xA0
	ble _080DA480
_080DA45A:
	movs r0, 0
	bl GetAnimBankSpriteId
	ldr r2, _080DA488 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, 0
	bl move_anim_8072740
_080DA480:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DA488: .4byte gSprites
	thumb_func_end sub_80DA410

	thumb_func_start sub_80DA48C
sub_80DA48C: @ 80DA48C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	subs r1, r0, 0x1
	strh r1, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bgt _080DA4CC
	ldrb r0, [r4, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080DA4BE
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
_080DA4BE:
	adds r0, r4, 0
	bl DestroySprite
	ldr r1, _080DA4D4 @ =gAnimVisualTaskCount
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_080DA4CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DA4D4: .4byte gAnimVisualTaskCount
	thumb_func_end sub_80DA48C

	thumb_func_start sub_80DA4D8
sub_80DA4D8: @ 80DA4D8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	adds r5, r7, 0
	adds r5, 0x2E
	ldr r0, _080DA4F8 @ =gBattleAnimArgs
	ldrh r1, [r0, 0xE]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080DA500
	ldr r0, _080DA4FC @ =gBattleAnimBankAttacker
	b _080DA502
	.align 2, 0
_080DA4F8: .4byte gBattleAnimArgs
_080DA4FC: .4byte gBattleAnimBankAttacker
_080DA500:
	ldr r0, _080DA5B0 @ =gBattleAnimBankTarget
_080DA502:
	ldrb r6, [r0]
	adds r0, r6, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080DA518
	ldr r1, _080DA5B4 @ =gBattleAnimArgs
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_080DA518:
	adds r0, r6, 0
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	ldr r4, _080DA5B4 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r7, 0x20]
	adds r0, r6, 0
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	ldrh r1, [r4, 0x2]
	lsrs r0, 24
	adds r1, r0, r1
	strh r1, [r7, 0x22]
	lsls r1, 8
	strh r1, [r5, 0x8]
	ldrh r1, [r4, 0xC]
	adds r0, r1
	lsls r0, 1
	ldrh r2, [r5, 0xE]
	movs r1, 0x1
	ands r1, r2
	orrs r1, r0
	strh r1, [r5, 0xE]
	ldrb r0, [r5]
	movs r2, 0x4
	mov r8, r2
	mov r1, r8
	orrs r0, r1
	strb r0, [r5]
	ldrh r0, [r4, 0x4]
	ldrb r1, [r4, 0x4]
	strh r1, [r5, 0x2]
	lsls r0, 16
	lsrs r0, 24
	strh r0, [r5, 0xA]
	ldrh r0, [r4, 0x6]
	strh r0, [r5, 0x4]
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x6]
	ldrh r0, [r4, 0xA]
	strh r0, [r5, 0xC]
	subs r1, 0x40
	lsls r1, 16
	lsrs r1, 16
	cmp r1, 0x7F
	bhi _080DA618
	ldr r0, _080DA5B8 @ =gMain
	ldr r2, _080DA5BC @ =0x0000043d
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080DA5C0
	adds r0, r6, 0
	bl sub_8079ED4
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	lsls r0, 2
	ldrb r2, [r7, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, 0x5]
	b _080DA5D8
	.align 2, 0
_080DA5B0: .4byte gBattleAnimBankTarget
_080DA5B4: .4byte gBattleAnimArgs
_080DA5B8: .4byte gMain
_080DA5BC: .4byte 0x0000043d
_080DA5C0:
	adds r0, r6, 0
	bl sub_8079ED4
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r7, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, 0x5]
_080DA5D8:
	ldrb r1, [r5, 0xE]
	movs r4, 0x2
	negs r4, r4
	adds r0, r4, 0
	ands r0, r1
	strb r0, [r5, 0xE]
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	bne _080DA678
	adds r3, r7, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r0, r2, 31
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	adds r0, r4, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r7, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x4
	b _080DA66E
_080DA618:
	adds r0, r6, 0
	bl sub_8079ED4
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r7, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, 0x5]
	ldrb r0, [r5, 0xE]
	movs r4, 0x1
	orrs r0, r4
	strb r0, [r5, 0xE]
	movs r2, 0x4
	ldrsh r0, [r5, r2]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080DA678
	adds r3, r7, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r1, r2, 31
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	ands r1, r4
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r7, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	mov r1, r8
_080DA66E:
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
_080DA678:
	ldrh r1, [r5, 0x2]
	lsrs r1, 6
	lsls r1, 4
	ldrb r2, [r5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	ldr r3, _080DA6E4 @ =gSineTable
	ldrh r0, [r5, 0x2]
	lsls r0, 1
	adds r0, r3
	movs r2, 0
	ldrsh r1, [r0, r2]
	ldrb r0, [r5, 0xC]
	muls r0, r1
	asrs r0, 8
	strh r0, [r7, 0x24]
	ldrb r2, [r7, 0x3]
	lsls r2, 26
	lsrs r2, 27
	movs r1, 0x24
	ldrsh r0, [r7, r1]
	negs r0, r0
	asrs r0, 1
	ldrb r5, [r5, 0xA]
	adds r0, r5
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r3
	ldrh r4, [r1]
	ldr r1, _080DA6E8 @ =gOamMatrices
	lsls r2, 3
	adds r2, r1
	adds r0, 0x40
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r2, 0x6]
	strh r0, [r2]
	strh r4, [r2, 0x2]
	lsls r0, r4, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r2, 0x4]
	ldr r0, _080DA6EC @ =sub_80DA6F0
	str r0, [r7, 0x1C]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DA6E4: .4byte gSineTable
_080DA6E8: .4byte gOamMatrices
_080DA6EC: .4byte sub_80DA6F0
	thumb_func_end sub_80DA4D8

	thumb_func_start sub_80DA6F0
sub_80DA6F0: @ 80DA6F0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r5, r0, 0
	movs r6, 0
	movs r0, 0x2E
	adds r0, r5
	mov r12, r0
	ldrb r2, [r0]
	movs r7, 0x1
	movs r1, 0x1
	mov r9, r1
	mov r0, r9
	ands r0, r2
	cmp r0, 0
	beq _080DA730
	mov r3, r12
	ldrb r0, [r3, 0x1]
	adds r1, r0, 0
	adds r1, 0xFF
	strb r1, [r3, 0x1]
	lsls r0, 24
	cmp r0, 0
	beq _080DA724
	b _080DAD1A
_080DA724:
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r3]
	strb r6, [r3, 0x1]
	b _080DAD1A
_080DA730:
	mov r4, r12
	ldrh r0, [r4, 0x2]
	lsrs r4, r0, 6
	mov r8, r0
	cmp r4, 0x1
	bne _080DA73E
	b _080DA896
_080DA73E:
	cmp r4, 0x1
	bgt _080DA748
	cmp r4, 0
	beq _080DA756
	b _080DAC52
_080DA748:
	cmp r4, 0x2
	bne _080DA74E
	b _080DA9C8
_080DA74E:
	cmp r4, 0x3
	bne _080DA754
	b _080DAB0E
_080DA754:
	b _080DAC52
_080DA756:
	lsls r1, r2, 24
	lsrs r0, r1, 28
	cmp r0, 0x1
	bne _080DA76C
	movs r0, 0x8
	orrs r0, r2
	orrs r0, r7
	mov r1, r12
	strb r0, [r1]
	strb r6, [r1, 0x1]
	b _080DA88A
_080DA76C:
	lsrs r0, r1, 28
	cmp r0, 0x3
	bne _080DA790
	lsls r0, r2, 30
	lsrs r0, 31
	movs r1, 0x1
	eors r0, r1
	ands r0, r7
	lsls r0, 1
	movs r1, 0x3
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	orrs r1, r7
	mov r2, r12
	strb r1, [r2]
	strb r6, [r2, 0x1]
	b _080DA88A
_080DA790:
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _080DA88A
	adds r3, r5, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r1, r2, 31
	lsrs r1, 31
	movs r4, 0x1
	eors r1, r4
	ands r1, r7
	movs r6, 0x2
	negs r6, r6
	adds r0, r6, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r5, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	mov r3, r12
	ldrb r1, [r3]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080DA87A
	ldr r0, _080DA80C @ =gMain
	ldr r1, _080DA810 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080DA82E
	ldrb r1, [r3, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080DA814
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080DA868
	.align 2, 0
_080DA80C: .4byte gMain
_080DA810: .4byte 0x0000043d
_080DA814:
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080DA866
_080DA82E:
	mov r0, r12
	ldrb r1, [r0, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080DA85C
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0xC
	strb r0, [r1]
	mov r1, r12
	ldrb r2, [r1, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r4
	ands r0, r7
	adds r1, r6, 0
	ands r1, r2
	orrs r1, r0
	mov r2, r12
	strb r1, [r2, 0xE]
	b _080DA87A
_080DA85C:
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0xC
	strb r0, [r1]
_080DA866:
	mov r3, r12
_080DA868:
	ldrb r2, [r3, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r4
	ands r0, r7
	adds r1, r6, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0xE]
_080DA87A:
	mov r4, r12
	ldrb r1, [r4]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldrh r0, [r4, 0x2]
	mov r8, r0
_080DA88A:
	mov r2, r12
	ldrb r1, [r2]
	movs r0, 0xF
	ands r0, r1
	strb r0, [r2]
	b _080DAC52
_080DA896:
	lsls r1, r2, 24
	lsrs r0, r1, 28
	cmp r0, 0
	bne _080DA8AC
	movs r0, 0x8
	orrs r0, r2
	orrs r0, r7
	mov r3, r12
	strb r0, [r3]
	strb r6, [r3, 0x1]
	b _080DA9BC
_080DA8AC:
	lsrs r0, r1, 28
	cmp r0, 0x2
	bne _080DA8BE
	adds r0, r2, 0
	orrs r0, r7
	mov r4, r12
	strb r0, [r4]
	strb r6, [r4, 0x1]
	b _080DA9BC
_080DA8BE:
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _080DA9BC
	adds r3, r5, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r1, r2, 31
	lsrs r1, 31
	movs r4, 0x1
	eors r1, r4
	ands r1, r7
	movs r6, 0x2
	negs r6, r6
	adds r0, r6, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r5, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	mov r0, r12
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080DA9AC
	ldr r0, _080DA940 @ =gMain
	ldr r1, _080DA944 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080DA962
	mov r2, r12
	ldrb r1, [r2, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080DA948
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	mov r3, r12
	b _080DA978
	.align 2, 0
_080DA940: .4byte gMain
_080DA944: .4byte 0x0000043d
_080DA948:
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080DA996
_080DA962:
	mov r3, r12
	ldrb r1, [r3, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080DA98C
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0xC
	strb r0, [r1]
_080DA978:
	ldrb r2, [r3, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r4
	ands r0, r7
	adds r1, r6, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0xE]
	b _080DA9AC
_080DA98C:
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0xC
	strb r0, [r1]
_080DA996:
	mov r0, r12
	ldrb r2, [r0, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r4
	ands r0, r7
	adds r1, r6, 0
	ands r1, r2
	orrs r1, r0
	mov r2, r12
	strb r1, [r2, 0xE]
_080DA9AC:
	mov r3, r12
	ldrb r1, [r3]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldrh r4, [r3, 0x2]
	mov r8, r4
_080DA9BC:
	mov r1, r12
	ldrb r0, [r1]
	movs r1, 0xF
	ands r1, r0
	movs r0, 0x10
	b _080DAC4C
_080DA9C8:
	lsls r1, r2, 24
	lsrs r0, r1, 28
	cmp r0, 0x3
	bne _080DA9DE
	movs r0, 0x8
	orrs r0, r2
	orrs r0, r7
	mov r3, r12
	strb r0, [r3]
	strb r6, [r3, 0x1]
	b _080DAAFE
_080DA9DE:
	lsrs r0, r1, 28
	cmp r0, 0x1
	bne _080DA9F0
	adds r0, r2, 0
	orrs r0, r7
	mov r4, r12
	strb r0, [r4]
	strb r6, [r4, 0x1]
	b _080DAAFE
_080DA9F0:
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	bne _080DA9FA
	b _080DAAFE
_080DA9FA:
	adds r3, r5, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r1, r2, 31
	lsrs r1, 31
	movs r6, 0x1
	eors r1, r6
	ands r1, r7
	movs r0, 0x2
	negs r0, r0
	mov r8, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r5, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	mov r2, r12
	ldrb r1, [r2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080DAAEC
	ldr r0, _080DAA6C @ =gMain
	ldr r3, _080DAA70 @ =0x0000043d
	adds r0, r3
	ldrb r0, [r0]
	ands r4, r0
	cmp r4, 0
	beq _080DAAA4
	ldrb r1, [r2, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080DAA74
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080DAAD8
	.align 2, 0
_080DAA6C: .4byte gMain
_080DAA70: .4byte 0x0000043d
_080DAA74:
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	mov r0, r12
	ldrb r2, [r0, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r6
	ands r0, r7
	mov r1, r8
	ands r1, r2
	orrs r1, r0
	mov r2, r12
	strb r1, [r2, 0xE]
	b _080DAAEC
_080DAAA4:
	mov r3, r12
	ldrb r1, [r3, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080DAACE
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0xC
	strb r0, [r1]
	ldrb r2, [r3, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r6
	ands r0, r7
	mov r1, r8
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0xE]
	b _080DAAEC
_080DAACE:
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0xC
	strb r0, [r1]
_080DAAD8:
	mov r4, r12
	ldrb r2, [r4, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r6
	ands r0, r7
	mov r1, r8
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0xE]
_080DAAEC:
	mov r0, r12
	ldrb r1, [r0]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r2, [r1, 0x2]
	mov r8, r2
_080DAAFE:
	mov r3, r12
	ldrb r0, [r3]
	movs r1, 0xF
	ands r1, r0
	movs r0, 0x20
	orrs r1, r0
	strb r1, [r3]
	b _080DAC52
_080DAB0E:
	lsls r1, r2, 24
	lsrs r0, r1, 28
	cmp r0, 0x2
	bne _080DAB20
	movs r0, 0x8
	orrs r0, r2
	mov r4, r12
	strb r0, [r4]
	b _080DAC42
_080DAB20:
	lsrs r0, r1, 28
	cmp r0, 0
	bne _080DAB44
	lsls r0, r2, 30
	lsrs r0, 31
	movs r1, 0x1
	eors r0, r1
	ands r0, r7
	lsls r0, 1
	movs r1, 0x3
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	orrs r1, r7
	mov r0, r12
	strb r1, [r0]
	strb r6, [r0, 0x1]
	b _080DAC42
_080DAB44:
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _080DAC42
	adds r3, r5, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r1, r2, 31
	lsrs r1, 31
	movs r4, 0x1
	eors r1, r4
	ands r1, r7
	movs r6, 0x2
	negs r6, r6
	adds r0, r6, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r5, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	mov r2, r12
	ldrb r1, [r2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080DAC32
	ldr r0, _080DABC4 @ =gMain
	ldr r3, _080DABC8 @ =0x0000043d
	adds r0, r3
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080DABE6
	ldrb r1, [r2, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080DABCC
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	mov r0, r12
	ldrb r2, [r0, 0xE]
	b _080DAC00
	.align 2, 0
_080DABC4: .4byte gMain
_080DABC8: .4byte 0x0000043d
_080DABCC:
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080DAC1E
_080DABE6:
	mov r0, r12
	ldrb r1, [r0, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080DAC14
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0xC
	strb r0, [r1]
	mov r1, r12
	ldrb r2, [r1, 0xE]
_080DAC00:
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r4
	ands r0, r7
	adds r1, r6, 0
	ands r1, r2
	orrs r1, r0
	mov r2, r12
	strb r1, [r2, 0xE]
	b _080DAC32
_080DAC14:
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0xC
	strb r0, [r1]
_080DAC1E:
	mov r3, r12
	ldrb r2, [r3, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r4
	ands r0, r7
	adds r1, r6, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0xE]
_080DAC32:
	mov r4, r12
	ldrb r1, [r4]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldrh r0, [r4, 0x2]
	mov r8, r0
_080DAC42:
	mov r1, r12
	ldrb r0, [r1]
	movs r1, 0xF
	ands r1, r0
	movs r0, 0x30
_080DAC4C:
	orrs r1, r0
	mov r2, r12
	strb r1, [r2]
_080DAC52:
	mov r3, r12
	ldrb r1, [r3]
	lsls r1, 30
	lsrs r1, 31
	mov r0, r12
	adds r0, 0xC
	adds r0, r1
	ldrb r1, [r0]
	ldr r3, _080DACE0 @ =gSineTable
	mov r4, r8
	lsls r0, r4, 1
	adds r0, r3
	movs r2, 0
	ldrsh r0, [r0, r2]
	muls r0, r1
	asrs r0, 8
	strh r0, [r5, 0x24]
	ldrb r2, [r5, 0x3]
	lsls r2, 26
	lsrs r2, 27
	movs r4, 0x24
	ldrsh r0, [r5, r4]
	negs r0, r0
	asrs r0, 1
	mov r1, r12
	ldrb r1, [r1, 0xA]
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r3
	ldrh r6, [r1]
	ldr r1, _080DACE4 @ =gOamMatrices
	lsls r2, 3
	adds r2, r1
	adds r0, 0x40
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r2, 0x6]
	strh r0, [r2]
	strh r6, [r2, 0x2]
	lsls r0, r6, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r2, 0x4]
	mov r2, r12
	ldrh r0, [r2, 0x6]
	ldrh r3, [r2, 0x8]
	adds r0, r3
	strh r0, [r2, 0x8]
	lsls r0, 16
	lsrs r0, 24
	strh r0, [r5, 0x22]
	movs r4, 0x4
	ldrsh r0, [r2, r4]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080DACE8
	ldrh r0, [r2, 0x4]
	subs r1, 0x1
	ands r1, r0
	ldrh r0, [r2, 0x2]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r2, 0x2]
	b _080DACFE
	.align 2, 0
_080DACE0: .4byte gSineTable
_080DACE4: .4byte gOamMatrices
_080DACE8:
	mov r1, r12
	ldrh r0, [r1, 0x4]
	ldr r1, _080DAD28 @ =0x00007fff
	ands r1, r0
	mov r2, r12
	ldrh r2, [r2, 0x2]
	adds r1, r2
	movs r0, 0xFF
	ands r1, r0
	mov r3, r12
	strh r1, [r3, 0x2]
_080DACFE:
	movs r4, 0x22
	ldrsh r1, [r5, r4]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	adds r1, r0
	mov r3, r12
	ldrh r0, [r3, 0xE]
	lsrs r0, 1
	cmp r1, r0
	blt _080DAD1A
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldr r0, _080DAD2C @ =sub_80DA48C
	str r0, [r5, 0x1C]
_080DAD1A:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DAD28: .4byte 0x00007fff
_080DAD2C: .4byte sub_80DA48C
	thumb_func_end sub_80DA6F0

	thumb_func_start sub_80DAD30
sub_80DAD30: @ 80DAD30
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _080DAD78 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
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
	ldr r5, _080DAD7C @ =gBattleAnimBankAttacker
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	ldr r0, _080DAD80 @ =sub_807941C
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DAD78: .4byte gBattleAnimBankTarget
_080DAD7C: .4byte gBattleAnimBankAttacker
_080DAD80: .4byte sub_807941C
	thumb_func_end sub_80DAD30

	thumb_func_start sub_80DAD84
sub_80DAD84: @ 80DAD84
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r5, _080DADCC @ =gBattleAnimArgs
	ldrh r0, [r5]
	strh r0, [r4, 0x30]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x32]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x34]
	ldr r0, _080DADD0 @ =gMain
	ldr r1, _080DADD4 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080DAE44
	ldr r0, _080DADD8 @ =gBanksBySide
	ldr r1, _080DADDC @ =gBattleAnimBankTarget
	ldrb r2, [r1]
	adds r0, r2, r0
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080DADE0
	adds r0, r2, 0
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5, 0x6]
	adds r0, r5
	b _080DADEE
	.align 2, 0
_080DADCC: .4byte gBattleAnimArgs
_080DADD0: .4byte gMain
_080DADD4: .4byte 0x0000043d
_080DADD8: .4byte gBanksBySide
_080DADDC: .4byte gBattleAnimBankTarget
_080DADE0:
	adds r0, r2, 0
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x28
_080DADEE:
	strh r0, [r4, 0x3C]
	ldr r0, _080DAE1C @ =gBattleAnimArgs
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080DAE24
	ldr r0, _080DAE20 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
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
	b _080DAE58
	.align 2, 0
_080DAE1C: .4byte gBattleAnimArgs
_080DAE20: .4byte gBattleAnimBankTarget
_080DAE24:
	ldr r0, _080DAE40 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
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
	b _080DAE58
	.align 2, 0
_080DAE40: .4byte gBattleAnimBankTarget
_080DAE44:
	ldr r0, _080DAEFC @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5, 0x6]
	adds r0, r5
	strh r0, [r4, 0x3C]
_080DAE58:
	ldr r5, _080DAF00 @ =gSineTable
	ldrh r3, [r4, 0x30]
	movs r1, 0xFF
	ands r1, r3
	lsls r0, r1, 1
	adds r0, r5
	ldrh r0, [r0]
	movs r2, 0
	strh r0, [r4, 0x36]
	adds r1, 0x40
	lsls r1, 1
	adds r1, r5
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r4, 0x38]
	strh r2, [r4, 0x3A]
	strh r2, [r4, 0x26]
	strh r2, [r4, 0x24]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r6, r0, 27
	lsls r3, 16
	lsrs r3, 24
	strh r3, [r4, 0x30]
	bl Random
	lsls r0, 16
	asrs r7, r0, 16
	movs r0, 0x80
	lsls r0, 8
	ands r0, r7
	cmp r0, 0
	beq _080DAEA2
	ldrh r1, [r4, 0x30]
	movs r0, 0xFF
	subs r0, r1
	strh r0, [r4, 0x30]
_080DAEA2:
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	lsls r0, r1, 1
	adds r0, r5
	ldrh r0, [r0]
	ldr r3, _080DAF04 @ =gOamMatrices
	lsls r2, r6, 3
	adds r2, r3
	adds r1, 0x40
	lsls r1, 1
	adds r1, r5
	ldrh r1, [r1]
	strh r1, [r2, 0x6]
	strh r1, [r2]
	strh r0, [r2, 0x2]
	lsls r0, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r2, 0x4]
	adds r3, r4, 0
	adds r3, 0x3F
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	movs r0, 0x1
	ands r0, r7
	cmp r0, 0
	beq _080DAEF2
	adds r2, r4, 0
	adds r2, 0x2A
	movs r1, 0x1
	movs r0, 0x1
	strb r0, [r2]
	ldrb r0, [r3]
	orrs r0, r1
	strb r0, [r3]
_080DAEF2:
	ldr r0, _080DAF08 @ =sub_80DAF0C
	str r0, [r4, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DAEFC: .4byte gBattleAnimBankTarget
_080DAF00: .4byte gSineTable
_080DAF04: .4byte gOamMatrices
_080DAF08: .4byte sub_80DAF0C
	thumb_func_end sub_80DAD84

	thumb_func_start sub_80DAF0C
sub_80DAF0C: @ 80DAF0C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r4, r0, 0
	adds r5, r4, 0
	adds r5, 0x2E
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	movs r1, 0
	mov r8, r1
	movs r7, 0
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080DAFF0
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	muls r0, r1
	asrs r6, r0, 8
	strh r6, [r4, 0x24]
	movs r0, 0x38
	ldrsh r1, [r4, r0]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	muls r0, r1
	asrs r3, r0, 8
	strh r3, [r4, 0x26]
	ldrh r2, [r4, 0x34]
	movs r1, 0xFF
	adds r0, r1, 0
	ands r0, r2
	ldrh r2, [r4, 0x3A]
	adds r0, r2
	strh r0, [r4, 0x3A]
	ldrh r2, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	ands r1, r2
	cmp r0, r1
	blt _080DAFF0
	ldrh r0, [r4, 0x20]
	adds r0, r6
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x22]
	adds r0, r3
	strh r0, [r4, 0x22]
	strh r7, [r4, 0x24]
	strh r7, [r4, 0x26]
	mov r0, sp
	adds r1, r5, 0
	movs r2, 0x10
	bl memcpy
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x10
	bl memset
	ldrh r0, [r4, 0x22]
	lsls r0, 8
	strh r0, [r5, 0x8]
	mov r0, sp
	ldrh r0, [r0, 0x6]
	lsrs r1, r0, 8
	strh r1, [r5, 0x6]
	strh r7, [r5, 0x2]
	mov r0, sp
	ldrh r0, [r0, 0x2]
	strh r0, [r5, 0xA]
	adds r0, r4, 0
	adds r0, 0x2A
	ldrb r0, [r0]
	cmp r0, 0
	beq _080DAFC0
	movs r0, 0x8
	ands r1, r0
	cmp r1, 0
	beq _080DAFB8
	ldr r0, _080DAFB4 @ =0x00008001
	b _080DAFCE
	.align 2, 0
_080DAFB4: .4byte 0x00008001
_080DAFB8:
	ldr r0, _080DAFBC @ =0x00008002
	b _080DAFCE
	.align 2, 0
_080DAFBC: .4byte 0x00008002
_080DAFC0:
	movs r0, 0x8
	ands r1, r0
	cmp r1, 0
	beq _080DAFCC
	movs r0, 0x1
	b _080DAFCE
_080DAFCC:
	movs r0, 0x2
_080DAFCE:
	strh r0, [r5, 0x4]
	mov r0, sp
	ldrh r0, [r0, 0x4]
	lsrs r0, 8
	strb r0, [r5, 0xC]
	subs r0, 0x2
	strb r0, [r5, 0xD]
	mov r0, sp
	ldrh r1, [r0, 0xE]
	lsls r1, 1
	ldrh r2, [r5, 0xE]
	movs r0, 0x1
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0xE]
	ldr r0, _080DAFFC @ =sub_80DA6F0
	str r0, [r4, 0x1C]
_080DAFF0:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DAFFC: .4byte sub_80DA6F0
	thumb_func_end sub_80DAF0C

	thumb_func_start sub_80DB000
sub_80DB000: @ 80DB000
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080DB018 @ =gBattleAnimArgs
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080DB01C
	adds r0, r5, 0
	movs r1, 0
	bl sub_80787B0
	b _080DB024
	.align 2, 0
_080DB018: .4byte gBattleAnimArgs
_080DB01C:
	adds r0, r5, 0
	movs r1, 0
	bl sub_8078764
_080DB024:
	ldr r4, _080DB08C @ =gBattleAnimArgs
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080DB03C
	ldr r0, _080DB090 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080DB052
_080DB03C:
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080DB058
	ldr r0, _080DB094 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080DB058
_080DB052:
	ldrh r0, [r5, 0x20]
	adds r0, 0x8
	strh r0, [r5, 0x20]
_080DB058:
	ldr r4, _080DB08C @ =gBattleAnimArgs
	ldrb r1, [r4, 0x8]
	adds r0, r5, 0
	bl SeekSpriteAnim
	ldrh r0, [r5, 0x20]
	subs r0, 0x20
	strh r0, [r5, 0x20]
	ldr r0, _080DB098 @ =0x00000ccc
	strh r0, [r5, 0x30]
	ldrh r1, [r4, 0x8]
	movs r0, 0xC
	adds r2, r0, 0
	muls r2, r1
	adds r0, r2, 0
	ldrh r2, [r5, 0x24]
	adds r0, r2
	strh r0, [r5, 0x24]
	strh r1, [r5, 0x2E]
	ldrh r0, [r4, 0x6]
	strh r0, [r5, 0x3C]
	ldr r0, _080DB09C @ =sub_80DB0A0
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DB08C: .4byte gBattleAnimArgs
_080DB090: .4byte gBattleAnimBankAttacker
_080DB094: .4byte gBattleAnimBankTarget
_080DB098: .4byte 0x00000ccc
_080DB09C: .4byte sub_80DB0A0
	thumb_func_end sub_80DB000

	thumb_func_start sub_80DB0A0
sub_80DB0A0: @ 80DB0A0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x24]
	adds r0, r1
	movs r1, 0
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	bne _080DB0CA
	strh r1, [r4, 0x2E]
	strh r1, [r4, 0x24]
	adds r0, r4, 0
	bl StartSpriteAnim
_080DB0CA:
	ldrh r0, [r4, 0x3C]
	subs r0, 0x1
	strh r0, [r4, 0x3C]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080DB0E2
	adds r0, r4, 0
	bl move_anim_8072740
_080DB0E2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DB0A0

	thumb_func_start sub_80DB0E8
sub_80DB0E8: @ 80DB0E8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	ldr r1, _080DB180 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r7, r0, r1
	ldrh r0, [r7, 0x8]
	movs r1, 0x1F
	ands r0, r1
	cmp r0, 0
	bne _080DB162
	ldr r1, _080DB184 @ =gAnimVisualTaskCount
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r1, 0x8
	ldrsh r0, [r7, r1]
	movs r5, 0xD
	negs r5, r5
	adds r1, r5, 0
	bl Sin
	ldr r4, _080DB188 @ =gBattleAnimArgs
	strh r0, [r4]
	movs r1, 0x8
	ldrsh r0, [r7, r1]
	adds r1, r5, 0
	bl Cos
	strh r0, [r4, 0x2]
	movs r0, 0x1
	strh r0, [r4, 0x4]
	movs r0, 0x3
	strh r0, [r4, 0x6]
	ldr r0, _080DB18C @ =gBattleAnimSpriteTemplate_83DB538
	mov r8, r0
	ldr r5, _080DB190 @ =gBattleAnimBankTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	mov r0, r8
	adds r1, r4, 0
	movs r3, 0x3
	bl CreateSpriteAndAnimate
_080DB162:
	ldrh r0, [r7, 0x8]
	adds r0, 0x8
	strh r0, [r7, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _080DB176
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080DB176:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DB180: .4byte gTasks
_080DB184: .4byte gAnimVisualTaskCount
_080DB188: .4byte gBattleAnimArgs
_080DB18C: .4byte gBattleAnimSpriteTemplate_83DB538
_080DB190: .4byte gBattleAnimBankTarget
	thumb_func_end sub_80DB0E8

	thumb_func_start sub_80DB194
sub_80DB194: @ 80DB194
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080DB1A6
	cmp r0, 0x1
	beq _080DB1D8
	b _080DB1EC
_080DB1A6:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80787B0
	movs r0, 0
	bl GetAnimBankSpriteId
	ldr r2, _080DB1D4 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080DB1EC
	.align 2, 0
_080DB1D4: .4byte gSprites
_080DB1D8:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080DB1EC
	adds r0, r4, 0
	bl move_anim_8072740
_080DB1EC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DB194

	thumb_func_start sub_80DB1F4
sub_80DB1F4: @ 80DB1F4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080DB22C
	cmp r0, 0x1
	bgt _080DB20A
	cmp r0, 0
	beq _080DB210
	b _080DB27E
_080DB20A:
	cmp r0, 0x2
	beq _080DB240
	b _080DB27E
_080DB210:
	ldr r0, _080DB228 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	negs r0, r0
	subs r0, 0x20
	strh r0, [r4, 0x26]
	b _080DB238
	.align 2, 0
_080DB228: .4byte gBattleAnimBankTarget
_080DB22C:
	ldrh r0, [r4, 0x26]
	adds r0, 0xA
	strh r0, [r4, 0x26]
	lsls r0, 16
	cmp r0, 0
	blt _080DB27E
_080DB238:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080DB27E
_080DB240:
	ldrh r0, [r4, 0x26]
	subs r0, 0xA
	strh r0, [r4, 0x26]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	bge _080DB27E
	movs r0, 0
	bl GetAnimBankSpriteId
	ldr r2, _080DB284 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, 0
	bl move_anim_8072740
_080DB27E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DB284: .4byte gSprites
	thumb_func_end sub_80DB1F4

	thumb_func_start sub_80DB288
sub_80DB288: @ 80DB288
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r1, _080DB2C4 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x30]
	ldr r0, _080DB2C8 @ =sub_80DB2D0
	str r0, [r4, 0x1C]
	movs r0, 0
	bl GetAnimBankSpriteId
	ldr r2, _080DB2CC @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DB2C4: .4byte gBattleAnimArgs
_080DB2C8: .4byte sub_80DB2D0
_080DB2CC: .4byte gSprites
	thumb_func_end sub_80DB288

	thumb_func_start sub_80DB2D0
sub_80DB2D0: @ 80DB2D0
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	cmp r0, 0
	ble _080DB2E4
	subs r0, r1, 0x1
	strh r0, [r2, 0x2E]
	b _080DB328
_080DB2E4:
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	movs r3, 0x26
	ldrsh r1, [r2, r3]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	ble _080DB30A
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x32]
	adds r0, r1
	strh r0, [r2, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r2, 0x26]
	subs r1, r0
	strh r1, [r2, 0x26]
	b _080DB328
_080DB30A:
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r2, 0x34]
	adds r1, r0, 0x1
	strh r1, [r2, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080DB328
	ldr r0, _080DB32C @ =sub_80DB330
	str r0, [r2, 0x1C]
_080DB328:
	pop {r0}
	bx r0
	.align 2, 0
_080DB32C: .4byte sub_80DB330
	thumb_func_end sub_80DB2D0

	thumb_func_start sub_80DB330
sub_80DB330: @ 80DB330
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r2, 0x26]
	adds r0, r1
	strh r0, [r2, 0x26]
	movs r3, 0x22
	ldrsh r0, [r2, r3]
	movs r3, 0x26
	ldrsh r1, [r2, r3]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	ble _080DB360
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
_080DB360:
	movs r1, 0x26
	ldrsh r0, [r2, r1]
	cmp r0, 0
	ble _080DB36E
	adds r0, r2, 0
	bl move_anim_8072740
_080DB36E:
	pop {r0}
	bx r0
	thumb_func_end sub_80DB330

	thumb_func_start sub_80DB374
sub_80DB374: @ 80DB374
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080DB388
	cmp r0, 0x1
	beq _080DB3E0
	b _080DB44C
_080DB388:
	ldr r0, _080DB398 @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bne _080DB3A0
	ldr r4, _080DB39C @ =gBattleAnimBankAttacker
	b _080DB3A2
	.align 2, 0
_080DB398: .4byte gBattleAnimArgs
_080DB39C: .4byte gBattleAnimBankAttacker
_080DB3A0:
	ldr r4, _080DB3DC @ =gBattleAnimBankTarget
_080DB3A2:
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
	strh r0, [r5, 0x22]
	movs r0, 0
	movs r3, 0x80
	lsls r3, 2
	strh r3, [r5, 0x30]
	movs r2, 0x80
	lsls r2, 1
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0
	bl sub_8078FDC
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080DB44C
	.align 2, 0
_080DB3DC: .4byte gBattleAnimBankTarget
_080DB3E0:
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	cmp r0, 0xB
	bgt _080DB3EE
	ldrh r0, [r5, 0x30]
	subs r0, 0x28
	b _080DB3F2
_080DB3EE:
	ldrh r0, [r5, 0x30]
	adds r0, 0x28
_080DB3F2:
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r5, 0x32]
	movs r2, 0x80
	lsls r2, 1
	movs r0, 0x30
	ldrsh r3, [r5, r0]
	str r1, [sp]
	adds r0, r5, 0
	bl sub_8078FDC
	ldrb r1, [r5, 0x3]
	lsls r1, 26
	lsrs r1, 27
	movs r0, 0xF4
	lsls r0, 6
	ldr r2, _080DB454 @ =gOamMatrices
	lsls r1, 3
	adds r1, r2
	movs r2, 0x6
	ldrsh r1, [r1, r2]
	bl __divsi3
	adds r1, r0, 0x1
	cmp r1, 0x80
	ble _080DB42C
	movs r1, 0x80
_080DB42C:
	movs r0, 0x40
	subs r0, r1
	lsrs r1, r0, 31
	adds r0, r1
	asrs r1, r0, 1
	strh r1, [r5, 0x26]
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	cmp r0, 0x18
	bne _080DB44C
	adds r0, r5, 0
	bl sub_8079098
	adds r0, r5, 0
	bl move_anim_8072740
_080DB44C:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DB454: .4byte gOamMatrices
	thumb_func_end sub_80DB374

	thumb_func_start sub_80DB458
sub_80DB458: @ 80DB458
	push {r4,r5,lr}
	adds r5, r0, 0
	bl Random
	ldr r4, _080DB47C @ =0x000001ff
	ands r4, r0
	bl Random
	movs r1, 0x7F
	ands r1, r0
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080DB480
	movs r2, 0xB8
	lsls r2, 2
	adds r0, r4, r2
	b _080DB488
	.align 2, 0
_080DB47C: .4byte 0x000001ff
_080DB480:
	movs r2, 0xB8
	lsls r2, 2
	adds r0, r2, 0
	subs r0, r4
_080DB488:
	strh r0, [r5, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080DB49C
	movs r2, 0xE0
	lsls r2, 2
	adds r0, r2, 0
	adds r0, r1, r0
	b _080DB4A4
_080DB49C:
	movs r2, 0xE0
	lsls r2, 2
	adds r0, r2, 0
	subs r0, r1
_080DB4A4:
	strh r0, [r5, 0x30]
	ldr r2, _080DB4CC @ =gBattleAnimArgs
	ldrh r0, [r2]
	strh r0, [r5, 0x32]
	lsls r0, 16
	cmp r0, 0
	beq _080DB4C0
	ldrb r0, [r5, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x10
	orrs r1, r0
	strb r1, [r5, 0x3]
_080DB4C0:
	movs r1, 0x2
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _080DB4D4
	ldr r4, _080DB4D0 @ =gBattleAnimBankAttacker
	b _080DB4D6
	.align 2, 0
_080DB4CC: .4byte gBattleAnimArgs
_080DB4D0: .4byte gBattleAnimBankAttacker
_080DB4D4:
	ldr r4, _080DB500 @ =gBattleAnimBankTarget
_080DB4D6:
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
	adds r0, 0x20
	strh r0, [r5, 0x22]
	ldr r0, _080DB504 @ =sub_80DB508
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DB500: .4byte gBattleAnimBankTarget
_080DB504: .4byte sub_80DB508
	thumb_func_end sub_80DB458

	thumb_func_start sub_80DB508
sub_80DB508: @ 80DB508
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080DB520
	ldrh r3, [r4, 0x2E]
	lsls r0, r3, 16
	asrs r0, 24
	ldrh r1, [r4, 0x24]
	adds r0, r1
	b _080DB52A
_080DB520:
	ldrh r3, [r4, 0x2E]
	lsls r1, r3, 16
	asrs r1, 24
	ldrh r0, [r4, 0x24]
	subs r0, r1
_080DB52A:
	strh r0, [r4, 0x24]
	ldrh r2, [r4, 0x30]
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r4, 0x26]
	subs r0, r1
	strh r0, [r4, 0x26]
	strh r3, [r4, 0x2E]
	adds r0, r2, 0
	subs r0, 0x20
	strh r0, [r4, 0x30]
	lsls r0, r3, 16
	cmp r0, 0
	bge _080DB54A
	movs r0, 0
	strh r0, [r4, 0x2E]
_080DB54A:
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _080DB55E
	adds r0, r4, 0
	bl move_anim_8072740
_080DB55E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DB508

	thumb_func_start sub_80DB564
sub_80DB564: @ 80DB564
	movs r1, 0
	strh r1, [r0, 0x3A]
	movs r1, 0x40
	strh r1, [r0, 0x3C]
	ldr r1, _080DB574 @ =sub_80DB578
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080DB574: .4byte sub_80DB578
	thumb_func_end sub_80DB564

	thumb_func_start sub_80DB578
sub_80DB578: @ 80DB578
	push {lr}
	adds r3, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	cmp r1, 0
	beq _080DB58A
	cmp r1, 0x1
	beq _080DB5D8
	b _080DB5DE
_080DB58A:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080DB5DE
	strh r1, [r3, 0x30]
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
	cmp r0, 0x5
	ble _080DB5DE
	ldrb r1, [r1]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080DB5DE
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	b _080DB5DE
_080DB5D8:
	adds r0, r3, 0
	bl move_anim_8072740
_080DB5DE:
	pop {r0}
	bx r0
	thumb_func_end sub_80DB578

	thumb_func_start sub_80DB5E4
sub_80DB5E4: @ 80DB5E4
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	mov r8, r0
	ldrh r4, [r0, 0x20]
	ldrh r5, [r0, 0x22]
	ldr r6, _080DB698 @ =gBattleAnimBankAttacker
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	mov r1, r8
	strh r0, [r1, 0x20]
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8077ABC
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	mov r2, r8
	strh r6, [r2, 0x22]
	ldrh r0, [r2, 0x20]
	mov r9, r0
	mov r1, r9
	lsls r0, r1, 4
	strh r0, [r2, 0x36]
	lsls r0, r6, 4
	strh r0, [r2, 0x38]
	lsls r4, 16
	asrs r4, 16
	movs r1, 0x20
	ldrsh r0, [r2, r1]
	subs r0, r4, r0
	lsls r0, 4
	movs r1, 0xC
	bl __divsi3
	mov r2, r8
	strh r0, [r2, 0x3A]
	lsls r5, 16
	asrs r5, 16
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	subs r0, r5, r0
	lsls r0, 4
	movs r1, 0xC
	bl __divsi3
	mov r2, r8
	strh r0, [r2, 0x3C]
	mov r0, r9
	subs r4, r0
	lsls r4, 16
	asrs r4, 16
	subs r5, r6
	lsls r5, 16
	asrs r5, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80790F0
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 24
	adds r0, r1
	lsrs r0, 16
	movs r3, 0x80
	lsls r3, 1
	str r0, [sp]
	mov r0, r8
	movs r1, 0x1
	adds r2, r3, 0
	bl sub_8078FDC
	ldr r0, _080DB69C @ =sub_80DB6A0
	mov r2, r8
	str r0, [r2, 0x1C]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DB698: .4byte gBattleAnimBankAttacker
_080DB69C: .4byte sub_80DB6A0
	thumb_func_end sub_80DB5E4

	thumb_func_start sub_80DB6A0
sub_80DB6A0: @ 80DB6A0
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x3A]
	ldrh r1, [r2, 0x36]
	adds r0, r1
	strh r0, [r2, 0x36]
	ldrh r1, [r2, 0x3C]
	ldrh r3, [r2, 0x38]
	adds r1, r3
	strh r1, [r2, 0x38]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r2, 0x20]
	lsls r1, 16
	asrs r3, r1, 20
	strh r3, [r2, 0x22]
	adds r0, 0x2D
	lsls r0, 16
	movs r1, 0xA5
	lsls r1, 17
	cmp r0, r1
	bhi _080DB6DA
	adds r1, r3, 0
	cmp r1, 0x9D
	bgt _080DB6DA
	movs r0, 0x2D
	negs r0, r0
	cmp r1, r0
	bge _080DB6E0
_080DB6DA:
	adds r0, r2, 0
	bl move_anim_8074EE0
_080DB6E0:
	pop {r0}
	bx r0
	thumb_func_end sub_80DB6A0

	thumb_func_start unref_sub_80DB6E4
unref_sub_80DB6E4: @ 80DB6E4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080DB714 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080DB71C
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080DB718 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	b _080DB73A
	.align 2, 0
_080DB714: .4byte gBattleAnimArgs
_080DB718: .4byte gSprites
_080DB71C:
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080DB748 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
_080DB73A:
	strb r0, [r1]
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DB748: .4byte gSprites
	thumb_func_end unref_sub_80DB6E4

	thumb_func_start sub_80DB74C
sub_80DB74C: @ 80DB74C
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r0, _080DB804 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080DB768
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080DB77E
_080DB768:
	ldrb r1, [r6, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r6, 0x5]
	adds r1, r6, 0
	adds r1, 0x43
	movs r0, 0xC8
	strb r0, [r1]
_080DB77E:
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080DB7DA
	movs r0, 0x1
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r4, r0, 24
	adds r7, r4, 0
	adds r0, r4, 0
	bl GetBankIdentity_permutated
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	eors r0, r1
	negs r1, r0
	orrs r1, r0
	lsrs r5, r1, 31
	adds r0, r4, 0
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080DB7BC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8076034
_080DB7BC:
	movs r0, 0x2
	adds r4, r0, 0
	eors r4, r7
	adds r0, r4, 0
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080DB7DA
	movs r0, 0x1
	eors r5, r0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8076034
_080DB7DA:
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080DB810
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _080DB810
	ldr r0, _080DB804 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080DB808
	movs r0, 0x48
	strh r0, [r6, 0x20]
	movs r0, 0x50
	b _080DB84A
	.align 2, 0
_080DB804: .4byte gBattleAnimBankAttacker
_080DB808:
	movs r0, 0xB0
	strh r0, [r6, 0x20]
	movs r0, 0x28
	b _080DB84A
_080DB810:
	ldr r5, _080DB880 @ =gBattleAnimBankAttacker
	ldrb r0, [r5]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080DB826
	ldr r1, _080DB884 @ =gBattleAnimArgs
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_080DB826:
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	ldr r4, _080DB884 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r6, 0x20]
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x2]
	adds r0, r4
_080DB84A:
	strh r0, [r6, 0x22]
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080DB85C
	ldrh r0, [r6, 0x22]
	adds r0, 0x9
	strh r0, [r6, 0x22]
_080DB85C:
	ldr r0, _080DB884 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	strh r0, [r6, 0x2E]
	ldr r1, _080DB888 @ =sub_80DB88C
	str r1, [r6, 0x1C]
	adds r0, r6, 0
	bl _call_via_r1
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DB880: .4byte gBattleAnimBankAttacker
_080DB884: .4byte gBattleAnimArgs
_080DB888: .4byte sub_80DB88C
	thumb_func_end sub_80DB74C

	thumb_func_start sub_80DB88C
sub_80DB88C: @ 80DB88C
	push {lr}
	adds r3, r0, 0
	ldr r2, _080DB8B0 @ =REG_BLDALPHA
	ldrh r1, [r3, 0x34]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r0, r1
	strh r0, [r2]
	ldrh r1, [r3, 0x34]
	movs r2, 0x34
	ldrsh r0, [r3, r2]
	cmp r0, 0xD
	bne _080DB8B8
	ldr r0, _080DB8B4 @ =sub_80DB8C0
	str r0, [r3, 0x1C]
	b _080DB8BC
	.align 2, 0
_080DB8B0: .4byte REG_BLDALPHA
_080DB8B4: .4byte sub_80DB8C0
_080DB8B8:
	adds r0, r1, 0x1
	strh r0, [r3, 0x34]
_080DB8BC:
	pop {r0}
	bx r0
	thumb_func_end sub_80DB88C

	thumb_func_start sub_80DB8C0
sub_80DB8C0: @ 80DB8C0
	push {r4-r7,lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _080DB91E
	movs r0, 0
	strh r0, [r3, 0x30]
	ldrh r4, [r3, 0x2E]
	ldr r1, _080DB924 @ =gPlttBufferFaded
	adds r0, r4, 0
	adds r0, 0x8
	lsls r0, 1
	adds r0, r1
	ldrh r7, [r0]
	movs r5, 0x8
	adds r6, r1, 0
	adds r1, r4, 0x7
	lsls r0, r4, 1
	adds r0, r6
	adds r2, r0, 0
	adds r2, 0x10
	lsls r1, 1
	adds r1, r6
_080DB8F6:
	ldrh r0, [r1]
	strh r0, [r2]
	subs r1, 0x2
	subs r2, 0x2
	subs r5, 0x1
	cmp r5, 0
	bgt _080DB8F6
	adds r0, r4, 0x1
	lsls r0, 1
	adds r0, r6
	strh r7, [r0]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	bne _080DB91E
	ldr r0, _080DB928 @ =sub_80DB92C
	str r0, [r3, 0x1C]
_080DB91E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DB924: .4byte gPlttBufferFaded
_080DB928: .4byte sub_80DB92C
	thumb_func_end sub_80DB8C0

	thumb_func_start sub_80DB92C
sub_80DB92C: @ 80DB92C
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r2, _080DB9D4 @ =REG_BLDALPHA
	ldrh r1, [r5, 0x34]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r5, 0x34]
	subs r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080DB9CC
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080DB9BC
	movs r0, 0x1
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	adds r0, r4, 0
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080DB98E
	ldr r2, _080DB9D8 @ =gSprites
	ldr r0, _080DB9DC @ =gObjectBankIDs
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_080DB98E:
	movs r0, 0x2
	adds r4, r0, 0
	eors r4, r6
	adds r0, r4, 0
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080DB9BC
	ldr r2, _080DB9D8 @ =gSprites
	ldr r0, _080DB9DC @ =gObjectBankIDs
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_080DB9BC:
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080DB9E0 @ =sub_80DB9E4
	str r0, [r5, 0x1C]
_080DB9CC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DB9D4: .4byte REG_BLDALPHA
_080DB9D8: .4byte gSprites
_080DB9DC: .4byte gObjectBankIDs
_080DB9E0: .4byte sub_80DB9E4
	thumb_func_end sub_80DB92C

	thumb_func_start sub_80DB9E4
sub_80DB9E4: @ 80DB9E4
	push {r4-r6,lr}
	adds r6, r0, 0
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080DBA3C
	movs r0, 0x1
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	bl GetBankIdentity_permutated
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	eors r0, r1
	negs r1, r0
	orrs r1, r0
	lsrs r5, r1, 31
	adds r0, r4, 0
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080DBA22
	adds r0, r5, 0
	bl sub_8076464
_080DBA22:
	movs r0, 0x2
	eors r4, r0
	adds r0, r4, 0
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080DBA3C
	movs r0, 0x1
	eors r5, r0
	adds r0, r5, 0
	bl sub_8076464
_080DBA3C:
	ldr r0, _080DBA48 @ =move_anim_8072740
	str r0, [r6, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DBA48: .4byte move_anim_8072740
	thumb_func_end sub_80DB9E4

	thumb_func_start sub_80DBA4C
sub_80DBA4C: @ 80DBA4C
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080DBAD8
	ldr r5, _080DBA98 @ =gBattleAnimArgs
	movs r1, 0x6
	ldrsh r0, [r5, r1]
	movs r6, 0
	cmp r0, 0
	bne _080DBA66
	movs r6, 0x1
_080DBA66:
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080DBAAE
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _080DBAAE
	ldr r0, _080DBA9C @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080DBAA0
	ldrh r0, [r5]
	movs r1, 0x48
	subs r1, r0
	strh r1, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	adds r0, 0x50
	strh r0, [r4, 0x22]
	b _080DBAD0
	.align 2, 0
_080DBA98: .4byte gBattleAnimArgs
_080DBA9C: .4byte gBattleAnimBankAttacker
_080DBAA0:
	ldrh r0, [r5]
	adds r0, 0xB0
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	adds r0, 0x28
	strh r0, [r4, 0x22]
	b _080DBAD0
_080DBAAE:
	ldr r0, _080DBAC4 @ =gBattleAnimArgs
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080DBAC8
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_80787B0
	b _080DBAD0
	.align 2, 0
_080DBAC4: .4byte gBattleAnimArgs
_080DBAC8:
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_8078764
_080DBAD0:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080DBAEC
_080DBAD8:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x30
	ands r0, r1
	cmp r0, 0
	beq _080DBAEC
	adds r0, r4, 0
	bl move_anim_8074EE0
_080DBAEC:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80DBA4C

	thumb_func_start sub_80DBAF4
sub_80DBAF4: @ 80DBAF4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080DBB3C @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080DBB44
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldrh r0, [r5, 0x20]
	subs r0, 0x28
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x22]
	adds r0, 0xA
	strh r0, [r5, 0x22]
	ldr r0, _080DBB40 @ =0x0000ffff
	b _080DBB52
	.align 2, 0
_080DBB3C: .4byte gBattleAnimBankAttacker
_080DBB40: .4byte 0x0000ffff
_080DBB44:
	ldrh r0, [r5, 0x20]
	adds r0, 0x28
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x22]
	subs r0, 0xA
	strh r0, [r5, 0x22]
	movs r0, 0x1
_080DBB52:
	strh r0, [r5, 0x30]
	ldr r1, _080DBB68 @ =move_anim_8072740
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	ldr r0, _080DBB6C @ =sub_8078600
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DBB68: .4byte move_anim_8072740
_080DBB6C: .4byte sub_8078600
	thumb_func_end sub_80DBAF4

	thumb_func_start sub_80DBB70
sub_80DBB70: @ 80DBB70
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r6, _080DBBF4 @ =gBattleAnimBankAttacker
	ldrb r0, [r6]
	movs r1, 0x1
	bl sub_807A100
	lsls r0, 16
	asrs r1, r0, 16
	lsrs r0, 31
	adds r1, r0
	lsls r1, 15
	lsrs r4, r1, 16
	ldrb r0, [r6]
	movs r1, 0
	bl sub_807A100
	lsls r0, 16
	asrs r1, r0, 16
	lsrs r0, 31
	adds r1, r0
	asrs r1, 1
	negs r1, r1
	lsls r1, 16
	lsrs r7, r1, 16
	ldrb r0, [r6]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080DBBB6
	lsls r0, r4, 16
	negs r0, r0
	lsrs r4, r0, 16
_080DBBB6:
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	strh r0, [r5, 0x20]
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, r7
	strh r0, [r5, 0x22]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	bgt _080DBBE2
	movs r0, 0x10
	strh r0, [r5, 0x22]
_080DBBE2:
	ldr r1, _080DBBF8 @ =sub_80DBC00
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	ldr r0, _080DBBFC @ =sub_8078600
	str r0, [r5, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DBBF4: .4byte gBattleAnimBankAttacker
_080DBBF8: .4byte sub_80DBC00
_080DBBFC: .4byte sub_8078600
	thumb_func_end sub_80DBB70

	thumb_func_start sub_80DBC00
sub_80DBC00: @ 80DBC00
	push {r4,lr}
	adds r4, r0, 0
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _080DBC2C @ =gUnknown_083DA888
	str r0, [r4, 0x10]
	movs r0, 0
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	ldr r0, _080DBC30 @ =sub_80DBC34
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DBC2C: .4byte gUnknown_083DA888
_080DBC30: .4byte sub_80DBC34
	thumb_func_end sub_80DBC00

	thumb_func_start sub_80DBC34
sub_80DBC34: @ 80DBC34
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080DBC46
	cmp r0, 0x1
	beq _080DBC74
	b _080DBC8C
_080DBC46:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080DBC8C
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x12
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080DBC8C
_080DBC74:
	ldrh r0, [r4, 0x30]
	subs r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080DBC8C
	adds r0, r4, 0
	bl move_anim_8072740
_080DBC8C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DBC34

	thumb_func_start sub_80DBC94
sub_80DBC94: @ 80DBC94
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080DBCC4 @ =gTasks
	adds r4, r0
	movs r0, 0
	bl GetAnimBankSpriteId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	strh r1, [r4, 0x8]
	ldr r2, _080DBCC8 @ =gUnknown_083DA8A4
	adds r0, r4, 0
	bl sub_80798F4
	ldr r0, _080DBCCC @ =sub_80DBCD0
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DBCC4: .4byte gTasks
_080DBCC8: .4byte gUnknown_083DA8A4
_080DBCCC: .4byte sub_80DBCD0
	thumb_func_end sub_80DBC94

	thumb_func_start sub_80DBCD0
sub_80DBCD0: @ 80DBCD0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080DBCF8 @ =gTasks
	adds r0, r1
	bl sub_807992C
	lsls r0, 24
	cmp r0, 0
	bne _080DBCF0
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080DBCF0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DBCF8: .4byte gTasks
	thumb_func_end sub_80DBCD0

	thumb_func_start sub_80DBCFC
sub_80DBCFC: @ 80DBCFC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080DBD48 @ =gTasks
	adds r4, r1, r0
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xA]
	strh r1, [r4, 0xC]
	ldr r0, _080DBD4C @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	movs r1, 0x8
	cmp r0, 0
	beq _080DBD30
	movs r1, 0x4
_080DBD30:
	strh r1, [r4, 0xE]
	ldrb r1, [r4, 0x8]
	ldr r2, _080DBD50 @ =gUnknown_083DA8C4
	adds r0, r4, 0
	bl sub_80798F4
	ldr r0, _080DBD54 @ =sub_80DBD58
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DBD48: .4byte gTasks
_080DBD4C: .4byte gBattleAnimBankAttacker
_080DBD50: .4byte gUnknown_083DA8C4
_080DBD54: .4byte sub_80DBD58
	thumb_func_end sub_80DBCFC

	thumb_func_start sub_80DBD58
sub_80DBD58: @ 80DBD58
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080DBD78 @ =gTasks
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080DBD7C
	cmp r0, 0x1
	beq _080DBD98
	b _080DBDF6
	.align 2, 0
_080DBD78: .4byte gTasks
_080DBD7C:
	adds r0, r4, 0
	bl sub_807992C
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080DBDF6
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	b _080DBDF6
_080DBD98:
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080DBDC0
	ldr r2, _080DBDBC @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	subs r1, 0x8
	strh r1, [r0, 0x26]
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	b _080DBDF6
	.align 2, 0
_080DBDBC: .4byte gSprites
_080DBDC0:
	ldr r3, _080DBDFC @ =gSprites
	movs r0, 0x8
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
	movs r1, 0x88
	lsls r1, 1
	strh r1, [r0, 0x20]
	ldrb r0, [r4, 0x8]
	bl sub_8078F40
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080DBDF6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DBDFC: .4byte gSprites
	thumb_func_end sub_80DBD58

	thumb_func_start sub_80DBE00
sub_80DBE00: @ 80DBE00
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080DBE84 @ =gTasks
	adds r5, r1, r0
	movs r0, 0
	movs r7, 0x10
	strh r7, [r5, 0xE]
	strh r0, [r5, 0x10]
	ldr r4, _080DBE88 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x24]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_807A100
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
	ldrb r0, [r4]
	movs r1, 0
	bl sub_807A100
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	adds r1, r0, 0
	cmp r0, r6
	bcs _080DBE6A
	adds r1, r6, 0
_080DBE6A:
	strh r1, [r5, 0x20]
	ldr r1, _080DBE8C @ =REG_BLDCNT
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080DBE90 @ =REG_BLDALPHA
	strh r7, [r0]
	ldr r0, _080DBE94 @ =sub_80DBE98
	str r0, [r5]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DBE84: .4byte gTasks
_080DBE88: .4byte gBattleAnimBankAttacker
_080DBE8C: .4byte REG_BLDCNT
_080DBE90: .4byte REG_BLDALPHA
_080DBE94: .4byte sub_80DBE98
	thumb_func_end sub_80DBE00

	thumb_func_start sub_80DBE98
sub_80DBE98: @ 80DBE98
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080DBEBC @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	cmp r1, 0x1
	beq _080DBF98
	cmp r1, 0x1
	bgt _080DBEC0
	cmp r1, 0
	beq _080DBECE
	b _080DC014
	.align 2, 0
_080DBEBC: .4byte gTasks
_080DBEC0:
	cmp r1, 0x2
	bne _080DBEC6
	b _080DBFF4
_080DBEC6:
	cmp r1, 0x3
	bne _080DBECC
	b _080DC004
_080DBECC:
	b _080DC014
_080DBECE:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	bgt _080DBEDE
	b _080DC014
_080DBEDE:
	strh r1, [r4, 0xA]
	ldr r0, _080DBF1C @ =gSpriteTemplate_83DA8DC
	movs r2, 0x22
	ldrsh r1, [r4, r2]
	movs r3, 0x24
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	adds r1, 0x8
	lsls r1, 1
	adds r0, r4, 0
	adds r0, 0x8
	adds r0, r1
	strh r2, [r0]
	cmp r2, 0x40
	beq _080DBF82
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080DBF3C
	cmp r0, 0x1
	bgt _080DBF20
	cmp r0, 0
	beq _080DBF2A
	b _080DBF82
	.align 2, 0
_080DBF1C: .4byte gSpriteTemplate_83DA8DC
_080DBF20:
	cmp r0, 0x2
	beq _080DBF54
	cmp r0, 0x3
	beq _080DBF6C
	b _080DBF82
_080DBF2A:
	ldr r0, _080DBF38 @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r4, 0x20]
	b _080DBF7A
	.align 2, 0
_080DBF38: .4byte gSprites
_080DBF3C:
	ldr r0, _080DBF50 @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r4, 0x20]
	negs r0, r0
	strh r0, [r1, 0x24]
	ldrh r0, [r4, 0x20]
	b _080DBF80
	.align 2, 0
_080DBF50: .4byte gSprites
_080DBF54:
	ldr r1, _080DBF68 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r4, 0x20]
	strh r1, [r0, 0x24]
	ldrh r1, [r4, 0x20]
	strh r1, [r0, 0x26]
	b _080DBF82
	.align 2, 0
_080DBF68: .4byte gSprites
_080DBF6C:
	ldr r0, _080DBF94 @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r4, 0x20]
	negs r0, r0
_080DBF7A:
	strh r0, [r1, 0x24]
	ldrh r0, [r4, 0x20]
	negs r0, r0
_080DBF80:
	strh r0, [r1, 0x26]
_080DBF82:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _080DC014
	b _080DBFF4
	.align 2, 0
_080DBF94: .4byte gSprites
_080DBF98:
	ldrh r0, [r4, 0xA]
	ands r1, r0
	cmp r1, 0
	beq _080DBFA8
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	b _080DBFAE
_080DBFA8:
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
_080DBFAE:
	ldr r2, _080DBFFC @ =REG_BLDALPHA
	ldrh r0, [r4, 0x10]
	lsls r0, 8
	ldrh r1, [r4, 0xE]
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x20
	bne _080DC014
	movs r5, 0x8
	adds r6, r4, 0
	adds r6, 0x8
_080DBFCE:
	lsls r0, r5, 1
	adds r1, r6, r0
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0x40
	beq _080DBFEA
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080DC000 @ =gSprites
	adds r0, r1
	bl DestroySprite
_080DBFEA:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0xC
	bls _080DBFCE
_080DBFF4:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080DC014
	.align 2, 0
_080DBFFC: .4byte REG_BLDALPHA
_080DC000: .4byte gSprites
_080DC004:
	ldr r0, _080DC01C @ =REG_BLDALPHA
	movs r1, 0
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080DC014:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DC01C: .4byte REG_BLDALPHA
	thumb_func_end sub_80DBE98

	thumb_func_start sub_80DC020
sub_80DC020: @ 80DC020
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	subs r0, 0xA
	cmp r1, r0
	ble _080DC04A
	ldrh r0, [r4, 0x30]
	movs r1, 0x1
	ands r1, r0
	adds r3, r4, 0
	adds r3, 0x3E
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080DC04A:
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080DC05C
	adds r0, r4, 0
	bl move_anim_8072740
_080DC05C:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DC020

	thumb_func_start sub_80DC068
sub_80DC068: @ 80DC068
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080DC0A4 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080DC094
	ldr r4, _080DC0A8 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
_080DC094:
	ldrh r0, [r6, 0x2]
	strh r0, [r5, 0x2E]
	ldr r0, _080DC0AC @ =sub_80DC020
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DC0A4: .4byte gBattleAnimArgs
_080DC0A8: .4byte gBattleAnimBankAttacker
_080DC0AC: .4byte sub_80DC020
	thumb_func_end sub_80DC068

	thumb_func_start sub_80DC0B0
sub_80DC0B0: @ 80DC0B0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080DC10C @ =gTasks
	adds r5, r1, r0
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080DC154
	ldr r0, _080DC110 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	bne _080DC120
	ldr r0, _080DC114 @ =0x0000fff6
	strh r0, [r5, 0x1C]
	ldr r4, _080DC118 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x5
	bl sub_807A100
	subs r0, 0x8
	strh r0, [r5, 0x1E]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_807A100
	adds r0, 0x8
	strh r0, [r5, 0x20]
	ldr r4, _080DC11C @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x5
	bl sub_807A100
	subs r0, 0x8
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_807A100
	adds r0, 0x8
	b _080DC1DE
	.align 2, 0
_080DC10C: .4byte gTasks
_080DC110: .4byte gBattleAnimArgs
_080DC114: .4byte 0x0000fff6
_080DC118: .4byte gBattleAnimBankTarget
_080DC11C: .4byte gBattleAnimBankAttacker
_080DC120:
	movs r0, 0xA
	strh r0, [r5, 0x1C]
	ldr r4, _080DC14C @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x4
	bl sub_807A100
	adds r0, 0x8
	strh r0, [r5, 0x1E]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_807A100
	subs r0, 0x8
	strh r0, [r5, 0x20]
	ldr r4, _080DC150 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x4
	bl sub_807A100
	adds r0, 0x8
	b _080DC1D2
	.align 2, 0
_080DC14C: .4byte gBattleAnimBankAttacker
_080DC150: .4byte gBattleAnimBankTarget
_080DC154:
	ldr r0, _080DC198 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	bne _080DC1A8
	ldr r0, _080DC19C @ =0x0000fff6
	strh r0, [r5, 0x1C]
	ldr r4, _080DC1A0 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x4
	bl sub_807A100
	adds r0, 0x8
	strh r0, [r5, 0x1E]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_807A100
	adds r0, 0x8
	strh r0, [r5, 0x20]
	ldr r4, _080DC1A4 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x4
	bl sub_807A100
	adds r0, 0x8
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_807A100
	adds r0, 0x8
	b _080DC1DE
	.align 2, 0
_080DC198: .4byte gBattleAnimArgs
_080DC19C: .4byte 0x0000fff6
_080DC1A0: .4byte gBattleAnimBankTarget
_080DC1A4: .4byte gBattleAnimBankAttacker
_080DC1A8:
	movs r0, 0xA
	strh r0, [r5, 0x1C]
	ldr r4, _080DC1F0 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x5
	bl sub_807A100
	subs r0, 0x8
	strh r0, [r5, 0x1E]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_807A100
	subs r0, 0x8
	strh r0, [r5, 0x20]
	ldr r4, _080DC1F4 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x5
	bl sub_807A100
	subs r0, 0x8
_080DC1D2:
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_807A100
	subs r0, 0x8
_080DC1DE:
	strh r0, [r5, 0x24]
	movs r0, 0x6
	strh r0, [r5, 0xA]
	ldr r0, _080DC1F8 @ =sub_80DC1FC
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DC1F0: .4byte gBattleAnimBankAttacker
_080DC1F4: .4byte gBattleAnimBankTarget
_080DC1F8: .4byte sub_80DC1FC
	thumb_func_end sub_80DC0B0

	thumb_func_start sub_80DC1FC
sub_80DC1FC: @ 80DC1FC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080DC21C @ =gTasks
	adds r5, r0, r1
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	cmp r1, 0
	beq _080DC220
	cmp r1, 0x1
	beq _080DC294
	b _080DC2A8
	.align 2, 0
_080DC21C: .4byte gTasks
_080DC220:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	ble _080DC2A8
	strh r1, [r5, 0xA]
	ldr r0, _080DC28C @ =gSpriteTemplate_83DA9AC
	movs r2, 0x1E
	ldrsh r1, [r5, r2]
	movs r3, 0x20
	ldrsh r2, [r5, r3]
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080DC274
	ldr r0, _080DC290 @ =gSprites
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	adds r4, r0
	movs r0, 0x10
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x22]
	strh r0, [r4, 0x32]
	ldrh r0, [r5, 0x24]
	strh r0, [r4, 0x36]
	ldrh r0, [r5, 0x1C]
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_80786EC
	ldrb r0, [r5, 0xC]
	movs r1, 0x3
	ands r1, r0
	adds r0, r4, 0
	bl StartSpriteAffineAnim
_080DC274:
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	bne _080DC2A8
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080DC2A8
	.align 2, 0
_080DC28C: .4byte gSpriteTemplate_83DA9AC
_080DC290: .4byte gSprites
_080DC294:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x11
	ble _080DC2A8
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080DC2A8:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80DC1FC

	thumb_func_start sub_80DC2B0
sub_80DC2B0: @ 80DC2B0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080DC2CE
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_080DC2CE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DC2B0

	thumb_func_start sub_80DC2D4
sub_80DC2D4: @ 80DC2D4
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080DC30C @ =gTasks
	adds r4, r1, r0
	ldr r0, _080DC310 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	bl sub_8077FC0
	lsls r0, 24
	lsrs r1, r0, 24
	adds r0, r1, 0
	subs r0, 0x20
	strh r0, [r4, 0x24]
	ldr r0, _080DC314 @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0x1
	beq _080DC32A
	cmp r0, 0x1
	bgt _080DC318
	cmp r0, 0
	beq _080DC31E
	b _080DC346
	.align 2, 0
_080DC30C: .4byte gTasks
_080DC310: .4byte gBattleAnimBankTarget
_080DC314: .4byte gBattleAnimArgs
_080DC318:
	cmp r0, 0x2
	beq _080DC336
	b _080DC346
_080DC31E:
	movs r0, 0x2
	strh r0, [r4, 0x1E]
	movs r0, 0x5
	strh r0, [r4, 0x20]
	movs r0, 0x40
	b _080DC33E
_080DC32A:
	movs r0, 0x2
	strh r0, [r4, 0x1E]
	movs r0, 0x5
	strh r0, [r4, 0x20]
	movs r0, 0xC0
	b _080DC33E
_080DC336:
	movs r0, 0x4
	strh r0, [r4, 0x1E]
	strh r0, [r4, 0x20]
	movs r0, 0
_080DC33E:
	strh r0, [r4, 0x22]
	adds r0, r1, 0
	adds r0, 0x20
	strh r0, [r4, 0x26]
_080DC346:
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _080DC352
	movs r0, 0
	strh r0, [r4, 0x24]
_080DC352:
	ldr r0, _080DC36C @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	bl GetBankIdentity_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080DC378
	ldr r0, _080DC370 @ =gUnknown_030042C0
	ldrh r0, [r0]
	strh r0, [r4, 0x1C]
	ldr r0, _080DC374 @ =REG_BG1HOFS
	b _080DC380
	.align 2, 0
_080DC36C: .4byte gBattleAnimBankTarget
_080DC370: .4byte gUnknown_030042C0
_080DC374: .4byte REG_BG1HOFS
_080DC378:
	ldr r0, _080DC3E0 @ =gUnknown_03004288
	ldrh r0, [r0]
	strh r0, [r4, 0x1C]
	ldr r0, _080DC3E4 @ =REG_BG2HOFS
_080DC380:
	str r0, [sp]
	ldrh r1, [r4, 0x24]
	lsls r3, r1, 16
	asrs r1, r3, 16
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	adds r0, 0x40
	cmp r1, r0
	bgt _080DC3BA
	ldr r5, _080DC3E8 @ =gUnknown_03004DE0
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r5, r0
_080DC39A:
	asrs r3, 16
	lsls r1, r3, 1
	adds r2, r1, r5
	ldrh r0, [r4, 0x1C]
	strh r0, [r2]
	adds r1, r6
	ldrh r0, [r4, 0x1C]
	strh r0, [r1]
	adds r3, 0x1
	lsls r3, 16
	asrs r1, r3, 16
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	adds r0, 0x40
	cmp r1, r0
	ble _080DC39A
_080DC3BA:
	ldr r0, _080DC3EC @ =0xa2600001
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
	bl sub_80895F8
	ldr r0, _080DC3F0 @ =sub_80DC3F4
	str r0, [r4]
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DC3E0: .4byte gUnknown_03004288
_080DC3E4: .4byte REG_BG2HOFS
_080DC3E8: .4byte gUnknown_03004DE0
_080DC3EC: .4byte 0xa2600001
_080DC3F0: .4byte sub_80DC3F4
	thumb_func_end sub_80DC2D4

	thumb_func_start sub_80DC3F4
sub_80DC3F4: @ 80DC3F4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080DC41C @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080DC4CE
	cmp r0, 0x1
	bgt _080DC420
	cmp r0, 0
	beq _080DC426
	b _080DC4E6
	.align 2, 0
_080DC41C: .4byte gTasks
_080DC420:
	cmp r0, 0x2
	beq _080DC4E0
	b _080DC4E6
_080DC426:
	ldrh r3, [r5, 0x22]
	ldrh r4, [r5, 0x24]
	movs r2, 0x24
	ldrsh r1, [r5, r2]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bgt _080DC4BE
	ldr r0, _080DC470 @ =gSineTable
	mov r9, r0
	movs r7, 0x3
	ldr r1, _080DC474 @ =gUnknown_03004DE0
	mov r12, r1
	movs r2, 0xF0
	lsls r2, 3
	add r2, r12
	mov r8, r2
_080DC448:
	lsls r2, r3, 16
	asrs r0, r2, 15
	add r0, r9
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r3, 0x20
	ldrsh r1, [r5, r3]
	asrs r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	asrs r3, r0, 16
	adds r6, r2, 0
	cmp r3, 0
	ble _080DC478
	ldrh r1, [r5, 0xA]
	adds r0, r7, 0
	ands r0, r1
	adds r0, r3, r0
	b _080DC484
	.align 2, 0
_080DC470: .4byte gSineTable
_080DC474: .4byte gUnknown_03004DE0
_080DC478:
	cmp r3, 0
	bge _080DC488
	ldrh r1, [r5, 0xA]
	adds r0, r7, 0
	ands r0, r1
	subs r0, r3, r0
_080DC484:
	lsls r0, 16
	lsrs r1, r0, 16
_080DC488:
	lsls r2, r4, 16
	asrs r2, 16
	lsls r3, r2, 1
	mov r0, r12
	adds r4, r3, r0
	ldrh r0, [r5, 0x1C]
	lsls r1, 16
	asrs r1, 16
	adds r0, r1, r0
	strh r0, [r4]
	add r3, r8
	ldrh r0, [r5, 0x1C]
	adds r1, r0
	strh r1, [r3]
	asrs r0, r6, 16
	ldrh r1, [r5, 0x1E]
	adds r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	adds r2, 0x1
	lsls r2, 16
	lsrs r4, r2, 16
	asrs r2, 16
	movs r1, 0x26
	ldrsh r0, [r5, r1]
	cmp r2, r0
	ble _080DC448
_080DC4BE:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x17
	ble _080DC4E6
	b _080DC4D4
_080DC4CE:
	ldr r1, _080DC4DC @ =gUnknown_03004DC0
	movs r0, 0x3
	strb r0, [r1, 0x15]
_080DC4D4:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080DC4E6
	.align 2, 0
_080DC4DC: .4byte gUnknown_03004DC0
_080DC4E0:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080DC4E6:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80DC3F4

	thumb_func_start sub_80DC4F4
sub_80DC4F4: @ 80DC4F4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r4, r0, 24
	mov r8, r4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080DC528 @ =gTasks
	adds r7, r0, r1
	bl AllocOamMatrix
	lsls r0, 24
	lsrs r5, r0, 24
	mov r10, r5
	adds r6, r5, 0
	cmp r6, 0xFF
	bne _080DC52C
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	b _080DC5D6
	.align 2, 0
_080DC528: .4byte gTasks
_080DC52C:
	ldr r1, _080DC550 @ =gBattleAnimArgs
	ldrb r0, [r1]
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	lsls r0, 16
	lsrs r1, r0, 16
	mov r9, r1
	asrs r0, 16
	cmp r0, 0
	bge _080DC554
	adds r0, r5, 0
	bl FreeOamMatrix
	mov r0, r8
	bl DestroyAnimVisualTask
	b _080DC5D6
	.align 2, 0
_080DC550: .4byte gBattleAnimArgs
_080DC554:
	ldr r2, _080DC5E4 @ =gSprites
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r0, r2, 0
	adds r0, 0x1C
	adds r0, r4, r0
	ldr r1, _080DC5E8 @ =SpriteCallbackDummy
	str r1, [r0]
	adds r4, r2
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x1F
	ands r6, r0
	lsls r2, r6, 1
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x3]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, 0
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r1, r9
	lsls r0, r1, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrb r3, [r4, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	adds r0, r4, 0
	bl CalcCenterToCornerVec
	ldr r1, _080DC5EC @ =gBattleAnimArgs
	ldrb r0, [r1]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7, 0x22]
	mov r0, r10
	strh r0, [r7, 0x24]
	mov r1, r9
	strh r1, [r7, 0x26]
	ldr r0, _080DC5F0 @ =sub_80DC5F4
	str r0, [r7]
_080DC5D6:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DC5E4: .4byte gSprites
_080DC5E8: .4byte SpriteCallbackDummy
_080DC5EC: .4byte gBattleAnimArgs
_080DC5F0: .4byte sub_80DC5F4
	thumb_func_end sub_80DC4F4

	thumb_func_start sub_80DC5F4
sub_80DC5F4: @ 80DC5F4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080DC618 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080DC678
	cmp r0, 0x1
	bgt _080DC61C
	cmp r0, 0
	beq _080DC626
	b _080DC6F8
	.align 2, 0
_080DC618: .4byte gTasks
_080DC61C:
	cmp r0, 0x2
	beq _080DC6C8
	cmp r0, 0x3
	beq _080DC6E8
	b _080DC6F8
_080DC626:
	ldrh r0, [r4, 0xA]
	adds r0, 0x4
	strh r0, [r4, 0xA]
	ldr r1, _080DC674 @ =gSineTable
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	lsls r1, 16
	asrs r1, 17
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	subs r0, r1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x22]
	lsls r1, 24
	lsrs r1, 24
	bl sub_8079AB8
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0x30
	bne _080DC6F8
	b _080DC6DA
	.align 2, 0
_080DC674: .4byte gSineTable
_080DC678:
	ldrh r0, [r4, 0xA]
	subs r0, 0x4
	strh r0, [r4, 0xA]
	ldr r1, _080DC6C4 @ =gSineTable
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	lsls r1, 16
	asrs r1, 17
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	subs r0, r1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x22]
	lsls r1, 24
	lsrs r1, 24
	bl sub_8079AB8
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080DC6F8
	b _080DC6DA
	.align 2, 0
_080DC6C4: .4byte gSineTable
_080DC6C8:
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080DC6E4 @ =gSprites
	adds r0, r1
	bl obj_delete_but_dont_free_vram
_080DC6DA:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080DC6F8
	.align 2, 0
_080DC6E4: .4byte gSprites
_080DC6E8:
	ldrh r0, [r4, 0x24]
	lsls r0, 24
	lsrs r0, 24
	bl FreeOamMatrix
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080DC6F8:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80DC5F4

	thumb_func_start sub_80DC700
sub_80DC700: @ 80DC700
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080DC778
	cmp r0, 0x1
	bgt _080DC716
	cmp r0, 0
	beq _080DC720
	b _080DC818
_080DC716:
	cmp r0, 0x2
	beq _080DC7AA
	cmp r0, 0x3
	beq _080DC808
	b _080DC818
_080DC720:
	ldr r4, _080DC76C @ =gBattleAnimBankAttacker
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
	strh r0, [r5, 0x22]
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080DC74E
	ldrh r0, [r5, 0x22]
	adds r0, 0xC
	strh r0, [r5, 0x22]
_080DC74E:
	movs r0, 0x8
	strh r0, [r5, 0x30]
	ldr r1, _080DC770 @ =REG_BLDCNT
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _080DC774 @ =REG_BLDALPHA
	ldrh r1, [r5, 0x30]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r0, r1
	strh r0, [r2]
	b _080DC7A2
	.align 2, 0
_080DC76C: .4byte gBattleAnimBankAttacker
_080DC770: .4byte REG_BLDCNT
_080DC774: .4byte REG_BLDALPHA
_080DC778:
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080DC818
	movs r0, 0x40
	negs r0, r0
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xCB
	bl PlaySE12WithPanning
	adds r0, r5, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnim
_080DC7A2:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080DC818
_080DC7AA:
	ldrh r0, [r5, 0x32]
	adds r1, r0, 0x1
	strh r1, [r5, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080DC7E8
	movs r0, 0
	strh r0, [r5, 0x32]
	ldrh r1, [r5, 0x30]
	subs r1, 0x1
	strh r1, [r5, 0x30]
	ldr r2, _080DC804 @ =REG_BLDALPHA
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080DC7E8
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_080DC7E8:
	movs r0, 0xE0
	lsls r0, 2
	adds r2, r0, 0
	ldrh r1, [r5, 0x34]
	adds r2, r1
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r5, 0x26]
	subs r0, r1
	strh r0, [r5, 0x26]
	movs r0, 0xFF
	ands r2, r0
	strh r2, [r5, 0x34]
	b _080DC818
	.align 2, 0
_080DC804: .4byte REG_BLDALPHA
_080DC808:
	ldr r0, _080DC820 @ =REG_BLDCNT
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, r5, 0
	bl move_anim_8072740
_080DC818:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DC820: .4byte REG_BLDCNT
	thumb_func_end sub_80DC700

	thumb_func_start sub_80DC824
sub_80DC824: @ 80DC824
	push {r4-r6,lr}
	adds r6, r0, 0
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080DC850
	adds r0, r6, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	ldr r0, _080DC84C @ =gBattleAnimArgs
	ldrh r1, [r0, 0x4]
	negs r1, r1
	strh r1, [r0, 0x4]
	ldrh r1, [r0]
	negs r1, r1
	strh r1, [r0]
	b _080DC880
	.align 2, 0
_080DC84C: .4byte gBattleAnimArgs
_080DC850:
	ldr r0, _080DC8E4 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080DC880
	adds r0, r6, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r1, _080DC8E8 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
	ldrh r0, [r1, 0x6]
	negs r0, r0
	strh r0, [r1, 0x6]
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_080DC880:
	ldr r5, _080DC8E4 @ =gBattleAnimBankTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077EE4
	lsls r0, 24
	ldr r4, _080DC8E8 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r6, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077EE4
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r6, 0x22]
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x2E]
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x6]
	adds r0, r4
	strh r0, [r6, 0x36]
	ldr r0, _080DC8EC @ =sub_8078B34
	str r0, [r6, 0x1C]
	ldr r1, _080DC8F0 @ =move_anim_8072740
	adds r0, r6, 0
	bl StoreSpriteCallbackInData
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DC8E4: .4byte gBattleAnimBankTarget
_080DC8E8: .4byte gBattleAnimArgs
_080DC8EC: .4byte sub_8078B34
_080DC8F0: .4byte move_anim_8072740
	thumb_func_end sub_80DC824

	thumb_func_start sub_80DC8F4
sub_80DC8F4: @ 80DC8F4
	push {r4-r6,lr}
	adds r6, r0, 0
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080DC918
	ldr r1, _080DC914 @ =gBattleAnimArgs
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
	adds r0, r6, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	b _080DC934
	.align 2, 0
_080DC914: .4byte gBattleAnimArgs
_080DC918:
	ldr r0, _080DC990 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080DC934
	ldr r0, _080DC994 @ =gBattleAnimArgs
	ldrh r1, [r0, 0x2]
	negs r1, r1
	strh r1, [r0, 0x2]
	ldrh r1, [r0]
	negs r1, r1
	strh r1, [r0]
_080DC934:
	ldr r5, _080DC990 @ =gBattleAnimBankTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077EE4
	lsls r0, 24
	ldr r4, _080DC994 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r6, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077EE4
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r6, 0x22]
	ldrh r0, [r4, 0x4]
	strh r0, [r6, 0x2E]
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x36]
	ldr r0, _080DC998 @ =sub_8078B34
	str r0, [r6, 0x1C]
	ldr r1, _080DC99C @ =move_anim_8072740
	adds r0, r6, 0
	bl StoreSpriteCallbackInData
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DC990: .4byte gBattleAnimBankTarget
_080DC994: .4byte gBattleAnimArgs
_080DC998: .4byte sub_8078B34
_080DC99C: .4byte move_anim_8072740
	thumb_func_end sub_80DC8F4

	thumb_func_start sub_80DC9A0
sub_80DC9A0: @ 80DC9A0
	push {r4,r5,lr}
	adds r5, r0, 0
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080DC9BC
	ldr r0, _080DC9FC @ =gBattleAnimArgs
	movs r2, 0x4
	ldrsh r1, [r0, r2]
	lsrs r2, r1, 31
	adds r1, r2
	asrs r1, 1
	strh r1, [r0, 0x4]
_080DC9BC:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r1, _080DC9FC @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080DCA04
	ldr r4, _080DCA00 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	b _080DCA16
	.align 2, 0
_080DC9FC: .4byte gBattleAnimArgs
_080DCA00: .4byte gBattleAnimBankTarget
_080DCA04:
	ldr r0, _080DCA2C @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	adds r2, r5, 0
	adds r2, 0x32
	adds r3, r5, 0
	adds r3, 0x36
	movs r1, 0x1
	bl sub_807A3FC
_080DCA16:
	adds r0, r5, 0
	bl sub_8078BD4
	ldr r0, _080DCA30 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x6]
	strh r0, [r5, 0x38]
	ldr r0, _080DCA34 @ =sub_80DCA38
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DCA2C: .4byte gBattleAnimBankTarget
_080DCA30: .4byte gBattleAnimArgs
_080DCA34: .4byte sub_80DCA38
	thumb_func_end sub_80DC9A0

	thumb_func_start sub_80DCA38
sub_80DCA38: @ 80DCA38
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	beq _080DCA4E
	adds r0, r4, 0
	bl move_anim_8072740
	b _080DCA6A
_080DCA4E:
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x3A]
	adds r0, 0xD
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3A]
_080DCA6A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DCA38

	thumb_func_start sub_80DCA70
sub_80DCA70: @ 80DCA70
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080DCAA0 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0
	bl sub_807A3FC
	ldr r0, _080DCAA4 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080DCAAC
	ldr r0, _080DCAA8 @ =gBattleAnimArgs
	ldrh r1, [r4, 0x20]
	ldrh r2, [r0]
	subs r1, r2
	strh r1, [r4, 0x20]
	b _080DCAB8
	.align 2, 0
_080DCAA0: .4byte gBattleAnimBankTarget
_080DCAA4: .4byte gBattleAnimBankAttacker
_080DCAA8: .4byte gBattleAnimArgs
_080DCAAC:
	ldr r1, _080DCAE0 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	adds r0, r1, 0
_080DCAB8:
	ldrh r0, [r0, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, _080DCAE4 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080DCAD4
	ldrh r0, [r4, 0x22]
	adds r0, 0x8
	strh r0, [r4, 0x22]
_080DCAD4:
	ldr r0, _080DCAE8 @ =sub_80DCAEC
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DCAE0: .4byte gBattleAnimArgs
_080DCAE4: .4byte gBattleAnimBankTarget
_080DCAE8: .4byte sub_80DCAEC
	thumb_func_end sub_80DCA70

	thumb_func_start sub_80DCAEC
sub_80DCAEC: @ 80DCAEC
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080DCB20
	movs r0, 0
	strh r0, [r3, 0x2E]
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
_080DCB20:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x33
	bne _080DCB34
	adds r0, r3, 0
	bl move_anim_8072740
_080DCB34:
	pop {r0}
	bx r0
	thumb_func_end sub_80DCAEC

	thumb_func_start sub_80DCB38
sub_80DCB38: @ 80DCB38
	ldr r2, _080DCB54 @ =REG_BLDCNT
	movs r3, 0xFD
	lsls r3, 6
	adds r1, r3, 0
	strh r1, [r2]
	adds r2, 0x2
	movs r1, 0x10
	strh r1, [r2]
	movs r1, 0x10
	strh r1, [r0, 0x2E]
	ldr r1, _080DCB58 @ =sub_80DCB5C
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080DCB54: .4byte REG_BLDCNT
_080DCB58: .4byte sub_80DCB5C
	thumb_func_end sub_80DCB38

	thumb_func_start sub_80DCB5C
sub_80DCB5C: @ 80DCB5C
	push {lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x32]
	movs r2, 0x32
	ldrsh r0, [r3, r2]
	cmp r0, 0x13
	bgt _080DCB70
	adds r0, r1, 0x1
	strh r0, [r3, 0x32]
	b _080DCBA8
_080DCB70:
	ldrh r1, [r3, 0x30]
	adds r0, r1, 0x1
	strh r0, [r3, 0x30]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080DCBA8
	ldrh r1, [r3, 0x2E]
	subs r1, 0x1
	strh r1, [r3, 0x2E]
	ldr r2, _080DCBAC @ =REG_BLDALPHA
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080DCBA8
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080DCBB0 @ =sub_80DCBB4
	str r0, [r3, 0x1C]
_080DCBA8:
	pop {r0}
	bx r0
	.align 2, 0
_080DCBAC: .4byte REG_BLDALPHA
_080DCBB0: .4byte sub_80DCBB4
	thumb_func_end sub_80DCB5C

	thumb_func_start sub_80DCBB4
sub_80DCBB4: @ 80DCBB4
	push {lr}
	ldr r1, _080DCBC8 @ =REG_BLDCNT
	movs r2, 0
	strh r2, [r1]
	adds r1, 0x2
	strh r2, [r1]
	bl move_anim_8072740
	pop {r0}
	bx r0
	.align 2, 0
_080DCBC8: .4byte REG_BLDCNT
	thumb_func_end sub_80DCBB4

	thumb_func_start sub_80DCBCC
sub_80DCBCC: @ 80DCBCC
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080DCBEC
	ldr r1, _080DCBE8 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
	b _080DCC0E
	.align 2, 0
_080DCBE8: .4byte gBattleAnimArgs
_080DCBEC:
	ldr r0, _080DCCE8 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080DCC0E
	ldr r1, _080DCCEC @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
	ldrh r0, [r1, 0x6]
	negs r0, r0
	strh r0, [r1, 0x6]
_080DCC0E:
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080DCC5E
	ldr r0, _080DCCE8 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	adds r4, r0, 0
	ldr r5, _080DCCF0 @ =gBattleAnimBankTarget
	ldrb r0, [r5]
	bl GetBankSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080DCC5E
	ldrb r0, [r5]
	bl GetBankIdentity
	lsls r0, 24
	cmp r0, 0
	beq _080DCC4C
	ldrb r0, [r5]
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080DCC5E
_080DCC4C:
	ldr r0, _080DCCEC @ =gBattleAnimArgs
	movs r2, 0x4
	ldrsh r1, [r0, r2]
	negs r1, r1
	strh r1, [r0, 0x4]
	movs r2, 0
	ldrsh r1, [r0, r2]
	negs r1, r1
	strh r1, [r0]
_080DCC5E:
	adds r0, r7, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r5, _080DCCF0 @ =gBattleAnimBankTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	adds r4, r0, 0
	lsls r4, 24
	ldr r6, _080DCCEC @ =gBattleAnimArgs
	lsrs r4, 24
	ldrh r0, [r6, 0x4]
	adds r4, r0
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r6, 0x6]
	adds r1, r2
	lsls r1, 16
	ldrh r2, [r7, 0x20]
	lsls r0, r4, 16
	asrs r0, 16
	subs r0, r2
	lsls r0, 16
	asrs r0, 16
	ldrh r2, [r7, 0x22]
	lsrs r5, r1, 16
	asrs r1, 16
	subs r1, r2
	lsls r1, 16
	asrs r1, 16
	bl sub_80790F0
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 24
	adds r0, r1
	lsrs r0, 16
	movs r3, 0x80
	lsls r3, 1
	str r0, [sp]
	adds r0, r7, 0
	movs r1, 0
	adds r2, r3, 0
	bl sub_8078FDC
	ldrh r0, [r6, 0x8]
	strh r0, [r7, 0x2E]
	strh r4, [r7, 0x32]
	strh r5, [r7, 0x36]
	ldr r0, _080DCCF4 @ =sub_8078B34
	str r0, [r7, 0x1C]
	ldr r1, _080DCCF8 @ =move_anim_8072740
	adds r0, r7, 0
	bl StoreSpriteCallbackInData
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DCCE8: .4byte gBattleAnimBankAttacker
_080DCCEC: .4byte gBattleAnimArgs
_080DCCF0: .4byte gBattleAnimBankTarget
_080DCCF4: .4byte sub_8078B34
_080DCCF8: .4byte move_anim_8072740
	thumb_func_end sub_80DCBCC

	thumb_func_start sub_80DCCFC
sub_80DCCFC: @ 80DCCFC
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _080DCD68 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080DCD1C
	ldr r1, _080DCD6C @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080DCD1C:
	ldr r4, _080DCD6C @ =gBattleAnimArgs
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x2E]
	ldr r5, _080DCD70 @ =gBattleAnimBankTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x6]
	adds r0, r1
	strh r0, [r6, 0x36]
	ldrh r0, [r4, 0xA]
	strh r0, [r6, 0x38]
	adds r0, r6, 0
	bl sub_80786EC
	ldr r0, _080DCD74 @ =sub_80DCD78
	str r0, [r6, 0x1C]
	adds r2, r6, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DCD68: .4byte gBattleAnimBankAttacker
_080DCD6C: .4byte gBattleAnimArgs
_080DCD70: .4byte gBattleAnimBankTarget
_080DCD74: .4byte sub_80DCD78
	thumb_func_end sub_80DCCFC

	thumb_func_start sub_80DCD78
sub_80DCD78: @ 80DCD78
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	adds r4, r0, 0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r2]
	adds r0, r4, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080DCDA4
	adds r0, r4, 0
	bl move_anim_8072740
	b _080DCE34
_080DCDA4:
	movs r0, 0x2E
	adds r0, r4
	mov r8, r0
	ldrh r7, [r4, 0x20]
	ldrh r5, [r4, 0x24]
	ldrh r1, [r4, 0x22]
	mov r12, r1
	ldrh r6, [r4, 0x26]
	mov r2, r8
	add r1, sp, 0x4
	movs r3, 0x7
_080DCDBA:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080DCDBA
	adds r0, r7, r5
	lsls r0, 16
	lsrs r5, r0, 16
	mov r2, r12
	adds r0, r2, r6
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	bne _080DCE34
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	lsls r1, r5, 16
	asrs r1, 16
	subs r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r1, r2
	lsls r2, r6, 16
	asrs r2, 16
	subs r1, r2
	lsls r1, 16
	asrs r1, 16
	bl sub_80790F0
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 24
	adds r0, r1
	lsrs r0, 16
	movs r3, 0x80
	lsls r3, 1
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0
	adds r2, r3, 0
	bl sub_8078FDC
	add r2, sp, 0x4
	mov r1, r8
	movs r3, 0x7
_080DCE26:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080DCE26
_080DCE34:
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80DCD78

	thumb_func_start sub_80DCE40
sub_80DCE40: @ 80DCE40
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080DCE54 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080DCE5C
	ldr r4, _080DCE58 @ =gBattleAnimBankAttacker
	b _080DCE5E
	.align 2, 0
_080DCE54: .4byte gBattleAnimArgs
_080DCE58: .4byte gBattleAnimBankAttacker
_080DCE5C:
	ldr r4, _080DCE90 @ =gBattleAnimBankTarget
_080DCE5E:
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x12
	strh r0, [r5, 0x22]
	ldr r1, _080DCE94 @ =move_anim_8074EE0
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	ldr r0, _080DCE98 @ =sub_80785E4
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DCE90: .4byte gBattleAnimBankTarget
_080DCE94: .4byte move_anim_8074EE0
_080DCE98: .4byte sub_80785E4
	thumb_func_end sub_80DCE40

	thumb_func_start sub_80DCE9C
sub_80DCE9C: @ 80DCE9C
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080DCF08 @ =gBattleAnimArgs
	movs r1, 0x6
	ldrsh r0, [r6, r1]
	cmp r0, 0
	beq _080DCEBC
	ldr r0, _080DCF0C @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	adds r2, r5, 0
	adds r2, 0x20
	adds r3, r5, 0
	adds r3, 0x22
	movs r1, 0
	bl sub_807A3FC
_080DCEBC:
	ldrh r0, [r6]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	movs r4, 0
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x22]
	adds r0, 0xE
	strh r0, [r5, 0x22]
	ldrb r1, [r6, 0x2]
	adds r0, r5, 0
	bl StartSpriteAnim
	adds r0, r5, 0
	bl AnimateSprite
	strh r4, [r5, 0x2E]
	strh r4, [r5, 0x30]
	movs r0, 0x4
	strh r0, [r5, 0x32]
	movs r0, 0x10
	strh r0, [r5, 0x34]
	ldr r0, _080DCF10 @ =0x0000ffba
	strh r0, [r5, 0x36]
	ldrh r0, [r6, 0x4]
	strh r0, [r5, 0x38]
	ldr r1, _080DCF14 @ =sub_80DCF1C
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	ldr r1, _080DCF18 @ =sub_8078278
	str r1, [r5, 0x1C]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DCF08: .4byte gBattleAnimArgs
_080DCF0C: .4byte gBattleAnimBankTarget
_080DCF10: .4byte 0x0000ffba
_080DCF14: .4byte sub_80DCF1C
_080DCF18: .4byte sub_8078278
	thumb_func_end sub_80DCE9C

	thumb_func_start sub_80DCF1C
sub_80DCF1C: @ 80DCF1C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x38]
	ldrh r2, [r4, 0x20]
	adds r0, r1, r2
	strh r0, [r4, 0x20]
	movs r0, 0xC0
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x30]
	movs r0, 0x4
	strh r0, [r4, 0x32]
	movs r0, 0x20
	strh r0, [r4, 0x34]
	ldr r0, _080DCF54 @ =0x0000ffe8
	strh r0, [r4, 0x36]
	ldr r1, _080DCF58 @ =move_anim_8074EE0
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	ldr r1, _080DCF5C @ =sub_8078278
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DCF54: .4byte 0x0000ffe8
_080DCF58: .4byte move_anim_8074EE0
_080DCF5C: .4byte sub_8078278
	thumb_func_end sub_80DCF1C

	thumb_func_start sub_80DCF60
sub_80DCF60: @ 80DCF60
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080DCF88 @ =gBattleAnimArgs
	ldrb r1, [r4, 0xA]
	bl StartSpriteAnim
	adds r0, r5, 0
	bl AnimateSprite
	ldr r0, _080DCF8C @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080DCF90
	ldrh r0, [r5, 0x20]
	ldrh r1, [r4]
	subs r0, r1
	b _080DCF96
	.align 2, 0
_080DCF88: .4byte gBattleAnimArgs
_080DCF8C: .4byte gBattleAnimBankAttacker
_080DCF90:
	ldrh r0, [r4]
	ldrh r1, [r5, 0x20]
	adds r0, r1
_080DCF96:
	strh r0, [r5, 0x20]
	ldr r3, _080DCFD8 @ =gBattleAnimArgs
	ldrh r2, [r3, 0x2]
	ldrh r0, [r5, 0x22]
	adds r2, r0
	movs r4, 0
	strh r2, [r5, 0x22]
	ldrh r0, [r3, 0x8]
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldrh r1, [r3, 0x4]
	adds r0, r1
	strh r0, [r5, 0x32]
	strh r2, [r5, 0x34]
	ldrh r0, [r3, 0x6]
	adds r2, r0
	strh r2, [r5, 0x36]
	adds r0, r5, 0
	bl sub_8078A5C
	strh r4, [r5, 0x34]
	strh r4, [r5, 0x36]
	ldr r0, _080DCFDC @ =sub_8078394
	str r0, [r5, 0x1C]
	ldr r1, _080DCFE0 @ =move_anim_8074EE0
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DCFD8: .4byte gBattleAnimArgs
_080DCFDC: .4byte sub_8078394
_080DCFE0: .4byte move_anim_8074EE0
	thumb_func_end sub_80DCF60

	thumb_func_start sub_80DCFE4
sub_80DCFE4: @ 80DCFE4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080DCFFC @ =gBattleAnimArgs
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080DD000
	adds r0, r4, 0
	movs r1, 0
	bl sub_80787B0
	b _080DD008
	.align 2, 0
_080DCFFC: .4byte gBattleAnimArgs
_080DD000:
	adds r0, r4, 0
	movs r1, 0
	bl sub_8078764
_080DD008:
	ldr r1, _080DD024 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x32]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x34]
	ldr r0, _080DD028 @ =sub_80DD02C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DD024: .4byte gBattleAnimArgs
_080DD028: .4byte sub_80DD02C
	thumb_func_end sub_80DCFE4

	thumb_func_start sub_80DD02C
sub_80DD02C: @ 80DD02C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x36]
	adds r0, r1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 24
	negs r0, r0
	strh r0, [r4, 0x26]
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x32]
	ldrh r1, [r4, 0x38]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080DD072
	adds r0, r4, 0
	bl move_anim_8072740
_080DD072:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DD02C

	thumb_func_start do_boulder_dust
do_boulder_dust: @ 80DD078
	push {r4-r6,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	ldr r1, _080DD154 @ =REG_BLDCNT
	ldr r2, _080DD158 @ =0x00003f42
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0x80
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r4, _080DD15C @ =REG_BG1CNT
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
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080DD0C4
	ldrb r0, [r4]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4]
_080DD0C4:
	ldr r0, _080DD160 @ =gUnknown_030042C0
	strh r5, [r0]
	ldr r0, _080DD164 @ =gUnknown_030041B4
	strh r5, [r0]
	ldr r0, _080DD168 @ =REG_BG1HOFS
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	mov r0, sp
	bl sub_8078914
	ldr r1, [sp, 0x4]
	str r5, [sp, 0xC]
	ldr r2, _080DD16C @ =0x040000d4
	add r0, sp, 0xC
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _080DD170 @ =0x85000400
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _080DD174 @ =gBattleAnimBackgroundTilemap_SandstormBrew
	bl LZDecompressVram
	ldr r0, _080DD178 @ =gBattleAnimBackgroundImage_SandstormBrew
	ldr r1, [sp]
	bl LZDecompressVram
	ldr r0, _080DD17C @ =gBattleAnimSpritePalette_261
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080DD120
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80763FC
_080DD120:
	ldr r0, _080DD180 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080DD13A
	ldr r0, _080DD184 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080DD13A
	movs r5, 0x1
_080DD13A:
	ldr r0, _080DD188 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	strh r5, [r1, 0x8]
	ldr r0, _080DD18C @ =sub_80DD190
	str r0, [r1]
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DD154: .4byte REG_BLDCNT
_080DD158: .4byte 0x00003f42
_080DD15C: .4byte REG_BG1CNT
_080DD160: .4byte gUnknown_030042C0
_080DD164: .4byte gUnknown_030041B4
_080DD168: .4byte REG_BG1HOFS
_080DD16C: .4byte 0x040000d4
_080DD170: .4byte 0x85000400
_080DD174: .4byte gBattleAnimBackgroundTilemap_SandstormBrew
_080DD178: .4byte gBattleAnimBackgroundImage_SandstormBrew
_080DD17C: .4byte gBattleAnimSpritePalette_261
_080DD180: .4byte gBattleAnimArgs
_080DD184: .4byte gBattleAnimBankAttacker
_080DD188: .4byte gTasks
_080DD18C: .4byte sub_80DD190
	thumb_func_end do_boulder_dust

	thumb_func_start sub_80DD190
sub_80DD190: @ 80DD190
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _080DD1C0 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r3, r1, 0
	cmp r0, 0
	bne _080DD1CC
	ldr r1, _080DD1C4 @ =gUnknown_030042C0
	ldr r5, _080DD1C8 @ =0x0000fffa
	adds r0, r5, 0
	ldrh r2, [r1]
	adds r0, r2
	b _080DD1D2
	.align 2, 0
_080DD1C0: .4byte gTasks
_080DD1C4: .4byte gUnknown_030042C0
_080DD1C8: .4byte 0x0000fffa
_080DD1CC:
	ldr r1, _080DD204 @ =gUnknown_030042C0
	ldrh r0, [r1]
	adds r0, 0x6
_080DD1D2:
	strh r0, [r1]
	adds r4, r1, 0
	ldr r1, _080DD208 @ =gUnknown_030041B4
	ldr r5, _080DD20C @ =0x0000ffff
	adds r0, r5, 0
	ldrh r2, [r1]
	adds r0, r2
	strh r0, [r1]
	lsls r2, r7, 2
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r3
	movs r5, 0x20
	ldrsh r0, [r0, r5]
	mov r8, r2
	adds r2, r1, 0
	cmp r0, 0x4
	bls _080DD1F8
	b _080DD37C
_080DD1F8:
	lsls r0, 2
	ldr r1, _080DD210 @ =_080DD214
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DD204: .4byte gUnknown_030042C0
_080DD208: .4byte gUnknown_030041B4
_080DD20C: .4byte 0x0000ffff
_080DD210: .4byte _080DD214
	.align 2, 0
_080DD214:
	.4byte _080DD228
	.4byte _080DD270
	.4byte _080DD292
	.4byte _080DD2D4
	.4byte _080DD358
_080DD228:
	mov r1, r8
	adds r0, r1, r7
	lsls r0, 3
	adds r3, r0, r3
	ldrh r0, [r3, 0x1C]
	adds r0, 0x1
	movs r4, 0
	strh r0, [r3, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	beq _080DD242
	b _080DD37C
_080DD242:
	strh r4, [r3, 0x1C]
	ldrh r1, [r3, 0x1E]
	adds r1, 0x1
	strh r1, [r3, 0x1E]
	ldr r2, _080DD26C @ =REG_BLDALPHA
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r2, 0x1E
	ldrsh r0, [r3, r2]
	cmp r0, 0x7
	beq _080DD260
	b _080DD37C
_080DD260:
	ldrh r0, [r3, 0x20]
	adds r0, 0x1
	strh r0, [r3, 0x20]
	strh r4, [r3, 0x1E]
	b _080DD37C
	.align 2, 0
_080DD26C: .4byte REG_BLDALPHA
_080DD270:
	mov r5, r8
	adds r0, r5, r7
	lsls r0, 3
	adds r1, r0, r3
	ldrh r0, [r1, 0x1E]
	adds r0, 0x1
	strh r0, [r1, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x65
	bne _080DD37C
	movs r0, 0x7
	strh r0, [r1, 0x1E]
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
	b _080DD37C
_080DD292:
	mov r1, r8
	adds r0, r1, r7
	lsls r0, 3
	adds r3, r0, r3
	ldrh r0, [r3, 0x1C]
	adds r0, 0x1
	strh r0, [r3, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080DD37C
	movs r0, 0
	strh r0, [r3, 0x1C]
	ldrh r1, [r3, 0x1E]
	subs r1, 0x1
	strh r1, [r3, 0x1E]
	ldr r2, _080DD2D0 @ =REG_BLDALPHA
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r2, 0x1E
	ldrsh r1, [r3, r2]
	cmp r1, 0
	bne _080DD37C
	ldrh r0, [r3, 0x20]
	adds r0, 0x1
	strh r0, [r3, 0x20]
	strh r1, [r3, 0x1E]
	b _080DD37C
	.align 2, 0
_080DD2D0: .4byte REG_BLDALPHA
_080DD2D4:
	mov r0, sp
	bl sub_8078914
	ldr r2, [sp]
	movs r3, 0x80
	lsls r3, 6
	add r5, sp, 0xC
	movs r6, 0
	ldr r1, _080DD38C @ =0x040000d4
	movs r4, 0x80
	lsls r4, 5
	mov r9, r5
	ldr r0, _080DD390 @ =0x85000400
	mov r12, r0
	movs r0, 0x85
	lsls r0, 24
	mov r10, r0
_080DD2F6:
	str r6, [sp, 0xC]
	mov r0, r9
	str r0, [r1]
	str r2, [r1, 0x4]
	mov r0, r12
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080DD2F6
	str r6, [sp, 0xC]
	str r5, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r10
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0xC]
	ldr r0, _080DD38C @ =0x040000d4
	str r5, [r0]
	str r1, [r0, 0x4]
	ldr r1, _080DD394 @ =0x85000200
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080DD344
	ldr r2, _080DD398 @ =REG_BG1CNT
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080DD344:
	ldr r0, _080DD39C @ =gTasks
	mov r5, r8
	adds r1, r5, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
	ldr r4, _080DD3A0 @ =gUnknown_030042C0
	ldr r2, _080DD3A4 @ =gUnknown_030041B4
_080DD358:
	movs r1, 0
	strh r1, [r4]
	strh r1, [r2]
	ldr r0, _080DD3A8 @ =REG_BLDCNT
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r2, _080DD398 @ =REG_BG1CNT
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	adds r0, r7, 0
	bl DestroyAnimVisualTask
_080DD37C:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DD38C: .4byte 0x040000d4
_080DD390: .4byte 0x85000400
_080DD394: .4byte 0x85000200
_080DD398: .4byte REG_BG1CNT
_080DD39C: .4byte gTasks
_080DD3A0: .4byte gUnknown_030042C0
_080DD3A4: .4byte gUnknown_030041B4
_080DD3A8: .4byte REG_BLDCNT
	thumb_func_end sub_80DD190

	thumb_func_start sub_80DD3AC
sub_80DD3AC: @ 80DD3AC
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080DD428
	ldr r4, _080DD3F0 @ =gBattleAnimArgs
	movs r2, 0x6
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080DD3F8
	ldr r0, _080DD3F4 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080DD3F8
	movs r0, 0x98
	lsls r0, 1
	strh r0, [r5, 0x20]
	ldrh r0, [r4, 0x2]
	negs r0, r0
	strh r0, [r4, 0x2]
	movs r0, 0x1
	strh r0, [r5, 0x38]
	ldrb r1, [r5, 0x3]
	subs r0, 0x40
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r5, 0x3]
	b _080DD3FC
	.align 2, 0
_080DD3F0: .4byte gBattleAnimArgs
_080DD3F4: .4byte gBattleAnimBankAttacker
_080DD3F8:
	ldr r0, _080DD41C @ =0x0000ffc0
	strh r0, [r5, 0x20]
_080DD3FC:
	ldr r4, _080DD420 @ =gBattleAnimArgs
	ldrh r0, [r4]
	strh r0, [r5, 0x22]
	ldr r1, _080DD424 @ =gUnknown_083DAD10
	adds r0, r5, 0
	bl SetSubspriteTables
	ldrh r0, [r4, 0x2]
	strh r0, [r5, 0x30]
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080DD484
	.align 2, 0
_080DD41C: .4byte 0x0000ffc0
_080DD420: .4byte gBattleAnimArgs
_080DD424: .4byte gUnknown_083DAD10
_080DD428:
	ldrh r1, [r5, 0x30]
	ldrh r3, [r5, 0x34]
	adds r1, r3
	ldrh r2, [r5, 0x32]
	ldrh r0, [r5, 0x36]
	adds r2, r0
	lsls r0, r1, 16
	asrs r0, 24
	ldrh r3, [r5, 0x24]
	adds r0, r3
	strh r0, [r5, 0x24]
	lsls r0, r2, 16
	asrs r0, 24
	ldrh r3, [r5, 0x26]
	adds r0, r3
	strh r0, [r5, 0x26]
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r5, 0x34]
	ands r2, r0
	strh r2, [r5, 0x36]
	movs r1, 0x38
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080DD46E
	movs r2, 0x20
	ldrsh r0, [r5, r2]
	movs r3, 0x24
	ldrsh r1, [r5, r3]
	adds r0, r1
	movs r1, 0x88
	lsls r1, 1
	cmp r0, r1
	ble _080DD484
	b _080DD480
_080DD46E:
	movs r1, 0x20
	ldrsh r0, [r5, r1]
	movs r2, 0x24
	ldrsh r1, [r5, r2]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	bge _080DD484
_080DD480:
	ldr r0, _080DD48C @ =move_anim_8072740
	str r0, [r5, 0x1C]
_080DD484:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DD48C: .4byte move_anim_8072740
	thumb_func_end sub_80DD3AC

	thumb_func_start sub_80DD490
sub_80DD490: @ 80DD490
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080DD4C8 @ =gBattleAnimArgs
	ldrb r1, [r5, 0x8]
	bl StartSpriteAnim
	adds r0, r4, 0
	movs r1, 0
	bl sub_80787B0
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x32]
	ldrh r0, [r5, 0x4]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x36]
	ldr r0, _080DD4CC @ =sub_8078B34
	str r0, [r4, 0x1C]
	ldr r1, _080DD4D0 @ =move_anim_8072740
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DD4C8: .4byte gBattleAnimArgs
_080DD4CC: .4byte sub_8078B34
_080DD4D0: .4byte move_anim_8072740
	thumb_func_end sub_80DD490

	thumb_func_start sub_80DD4D4
sub_80DD4D4: @ 80DD4D4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080DD554 @ =gTasks
	adds r6, r1, r0
	ldr r5, _080DD558 @ =gBattleAnimBankAttacker
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 8
	movs r1, 0xC0
	lsls r1, 13
	adds r0, r1
	lsrs r7, r0, 16
	ldr r4, _080DD55C @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 8
	movs r2, 0xC0
	lsls r2, 13
	adds r0, r2
	lsrs r0, 16
	mov r8, r0
	ldrb r1, [r5]
	movs r0, 0x2
	eors r0, r1
	ldrb r4, [r4]
	cmp r0, r4
	bne _080DD544
	mov r8, r7
_080DD544:
	bl sub_80DD8BC
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bne _080DD560
	movs r0, 0x20
	b _080DD566
	.align 2, 0
_080DD554: .4byte gTasks
_080DD558: .4byte gBattleAnimBankAttacker
_080DD55C: .4byte gBattleAnimBankTarget
_080DD560:
	lsls r1, r5, 3
	movs r0, 0x30
	subs r0, r1
_080DD566:
	strh r0, [r6, 0x18]
	movs r4, 0
	strh r4, [r6, 0x8]
	strh r4, [r6, 0x1E]
	strh r4, [r6, 0x1A]
	movs r0, 0x1
	strh r0, [r6, 0x20]
	movs r1, 0x18
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bge _080DD57E
	adds r0, 0x7
_080DD57E:
	asrs r0, 3
	subs r0, 0x1
	strh r0, [r6, 0x1C]
	mov r2, r9
	lsls r0, r2, 3
	strh r0, [r6, 0xC]
	lsls r0, r7, 3
	strh r0, [r6, 0xE]
	mov r1, r10
	subs r0, r1, r2
	lsls r0, 3
	movs r2, 0x18
	ldrsh r1, [r6, r2]
	bl __divsi3
	strh r0, [r6, 0x10]
	mov r1, r8
	subs r0, r1, r7
	lsls r0, 3
	movs r2, 0x18
	ldrsh r1, [r6, r2]
	bl __divsi3
	strh r0, [r6, 0x12]
	strh r4, [r6, 0x14]
	strh r4, [r6, 0x16]
	movs r0, 0x40
	negs r0, r0
	bl sub_8076F98
	adds r4, r0, 0
	lsls r4, 24
	asrs r4, 8
	lsrs r4, 16
	movs r0, 0x3F
	bl sub_8076F98
	lsls r0, 24
	strh r4, [r6, 0x22]
	asrs r0, 24
	lsls r4, 16
	asrs r4, 16
	subs r0, r4
	movs r2, 0x18
	ldrsh r1, [r6, r2]
	bl __divsi3
	strh r0, [r6, 0x24]
	strh r5, [r6, 0xA]
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x26]
	ldr r0, _080DD600 @ =sub_80DD604
	str r0, [r6]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DD600: .4byte sub_80DD604
	thumb_func_end sub_80DD4D4

	thumb_func_start sub_80DD604
sub_80DD604: @ 80DD604
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080DD628 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _080DD61E
	b _080DD76C
_080DD61E:
	lsls r0, 2
	ldr r1, _080DD62C @ =_080DD630
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DD628: .4byte gTasks
_080DD62C: .4byte _080DD630
	.align 2, 0
_080DD630:
	.4byte _080DD644
	.4byte _080DD6A8
	.4byte _080DD6B0
	.4byte _080DD70C
	.4byte _080DD75E
_080DD644:
	ldrh r2, [r4, 0x14]
	ldrh r0, [r4, 0x10]
	subs r2, r0
	strh r2, [r4, 0x14]
	ldrh r0, [r4, 0x16]
	ldrh r1, [r4, 0x12]
	subs r0, r1
	strh r0, [r4, 0x16]
	ldr r3, _080DD6A4 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	lsls r2, 16
	asrs r2, 19
	strh r2, [r0, 0x24]
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrh r0, [r4, 0x16]
	lsls r0, 16
	asrs r0, 19
	strh r0, [r1, 0x26]
	ldrh r0, [r4, 0x1A]
	adds r0, 0x1
	strh r0, [r4, 0x1A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _080DD694
	movs r0, 0x14
	strh r0, [r4, 0x1E]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080DD694:
	ldrh r1, [r4, 0x22]
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xA2
	bl PlaySE12WithPanning
	b _080DD76C
	.align 2, 0
_080DD6A4: .4byte gSprites
_080DD6A8:
	ldrh r0, [r4, 0x1E]
	subs r0, 0x1
	strh r0, [r4, 0x1E]
	b _080DD750
_080DD6B0:
	ldrh r0, [r4, 0x1A]
	subs r0, 0x1
	strh r0, [r4, 0x1A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	beq _080DD6D0
	ldrh r0, [r4, 0x10]
	ldrh r2, [r4, 0x14]
	adds r0, r2
	strh r0, [r4, 0x14]
	ldrh r0, [r4, 0x12]
	ldrh r1, [r4, 0x16]
	adds r0, r1
	strh r0, [r4, 0x16]
	b _080DD6DA
_080DD6D0:
	strh r0, [r4, 0x14]
	strh r0, [r4, 0x16]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080DD6DA:
	ldr r2, _080DD708 @ =gSprites
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r4, 0x14]
	lsls r0, 16
	asrs r0, 19
	strh r0, [r1, 0x24]
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r4, 0x16]
	lsls r0, 16
	asrs r0, 19
	strh r0, [r1, 0x26]
	b _080DD76C
	.align 2, 0
_080DD708: .4byte gSprites
_080DD70C:
	ldrh r0, [r4, 0x10]
	ldrh r2, [r4, 0xC]
	adds r0, r2
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x12]
	ldrh r1, [r4, 0xE]
	adds r0, r1
	strh r0, [r4, 0xE]
	ldrh r0, [r4, 0x1A]
	adds r0, 0x1
	strh r0, [r4, 0x1A]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x1C
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _080DD74A
	movs r0, 0
	strh r0, [r4, 0x1A]
	adds r0, r4, 0
	bl sub_80DD774
	ldrh r1, [r4, 0x24]
	ldrh r0, [r4, 0x22]
	adds r1, r0
	strh r1, [r4, 0x22]
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xAF
	bl PlaySE12WithPanning
_080DD74A:
	ldrh r0, [r4, 0x18]
	subs r0, 0x1
	strh r0, [r4, 0x18]
_080DD750:
	lsls r0, 16
	cmp r0, 0
	bne _080DD76C
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080DD76C
_080DD75E:
	movs r1, 0x1E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080DD76C
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080DD76C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DD604

	thumb_func_start sub_80DD774
sub_80DD774: @ 80DD774
	push {r4-r7,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bhi _080DD864
	lsls r0, 2
	ldr r1, _080DD790 @ =_080DD794
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DD790: .4byte _080DD794
	.align 2, 0
_080DD794:
	.4byte _080DD7A8
	.4byte _080DD7B4
	.4byte _080DD7B4
	.4byte _080DD7C0
	.4byte _080DD7CC
_080DD7A8:
	ldr r3, _080DD7B0 @ =gSpriteTemplate_83DAD78
	movs r5, 0
	b _080DD7D0
	.align 2, 0
_080DD7B0: .4byte gSpriteTemplate_83DAD78
_080DD7B4:
	ldr r3, _080DD7BC @ =gSpriteTemplate_83DAD90
	movs r5, 0x50
	b _080DD7D0
	.align 2, 0
_080DD7BC: .4byte gSpriteTemplate_83DAD90
_080DD7C0:
	ldr r3, _080DD7C8 @ =gSpriteTemplate_83DAD90
	movs r5, 0x40
	b _080DD7D0
	.align 2, 0
_080DD7C8: .4byte gSpriteTemplate_83DAD90
_080DD7CC:
	ldr r3, _080DD86C @ =gSpriteTemplate_83DAD90
	movs r5, 0x30
_080DD7D0:
	ldrh r1, [r4, 0xC]
	lsls r1, 16
	asrs r1, 19
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r4, 0xE]
	lsls r2, 16
	asrs r2, 19
	lsls r2, 16
	movs r6, 0x20
	ldrsh r0, [r4, r6]
	lsls r0, 2
	adds r1, r0
	lsls r1, 16
	lsrs r6, r1, 16
	asrs r1, 16
	lsrs r7, r2, 16
	asrs r2, 16
	adds r0, r3, 0
	movs r3, 0x23
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080DD85C
	ldr r1, _080DD870 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0x12
	strh r1, [r0, 0x2E]
	movs r2, 0x20
	ldrsh r1, [r4, r2]
	lsls r2, r1, 2
	adds r2, r1
	lsls r2, 2
	adds r2, r6, r2
	movs r6, 0xA
	ldrsh r3, [r4, r6]
	lsls r1, r3, 1
	adds r1, r3
	adds r2, r1
	strh r2, [r0, 0x32]
	strh r7, [r0, 0x36]
	movs r1, 0xA
	ldrsh r2, [r4, r1]
	lsls r2, 1
	movs r3, 0x10
	negs r3, r3
	adds r1, r3, 0
	subs r1, r2
	strh r1, [r0, 0x38]
	ldrh r3, [r0, 0x4]
	lsls r2, r3, 22
	lsrs r2, 22
	adds r2, r5
	ldr r5, _080DD874 @ =0x000003ff
	adds r1, r5, 0
	ands r2, r1
	ldr r1, _080DD878 @ =0xfffffc00
	ands r1, r3
	orrs r1, r2
	strh r1, [r0, 0x4]
	bl sub_80786EC
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
_080DD85C:
	movs r6, 0x20
	ldrsh r0, [r4, r6]
	negs r0, r0
	strh r0, [r4, 0x20]
_080DD864:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DD86C: .4byte gSpriteTemplate_83DAD90
_080DD870: .4byte gSprites
_080DD874: .4byte 0x000003ff
_080DD878: .4byte 0xfffffc00
	thumb_func_end sub_80DD774

	thumb_func_start sub_80DD87C
sub_80DD87C: @ 80DD87C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080DD8AE
	ldr r0, _080DD8B4 @ =sub_80DD604
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080DD8A8
	ldr r0, _080DD8B8 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1E]
	subs r0, 0x1
	strh r0, [r1, 0x1E]
_080DD8A8:
	adds r0, r4, 0
	bl DestroySprite
_080DD8AE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DD8B4: .4byte sub_80DD604
_080DD8B8: .4byte gTasks
	thumb_func_end sub_80DD87C

	thumb_func_start sub_80DD8BC
sub_80DD8BC: @ 80DD8BC
	push {lr}
	ldr r0, _080DD8E4 @ =gDisableStructMoveAnim
	ldr r0, [r0]
	ldrb r1, [r0, 0x11]
	lsrs r0, r1, 4
	lsls r1, 28
	lsrs r1, 28
	subs r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xFF
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x4
	bls _080DD8DE
	movs r1, 0x1
_080DD8DE:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_080DD8E4: .4byte gDisableStructMoveAnim
	thumb_func_end sub_80DD8BC

	thumb_func_start sub_80DD8E8
sub_80DD8E8: @ 80DD8E8
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080DD920 @ =gBattleAnimArgs
	ldrb r1, [r5, 0x8]
	bl StartSpriteAnim
	ldrh r0, [r5]
	strh r0, [r4, 0x24]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x34]
	ldrh r1, [r5, 0x4]
	subs r0, r1
	strh r0, [r4, 0x34]
	movs r0, 0x3
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x30]
	ldr r0, _080DD924 @ =sub_80DD928
	str r0, [r4, 0x1C]
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DD920: .4byte gBattleAnimArgs
_080DD924: .4byte sub_80DD928
	thumb_func_end sub_80DD8E8

	thumb_func_start sub_80DD928
sub_80DD928: @ 80DD928
	push {lr}
	adds r2, r0, 0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r3]
	ldrh r1, [r2, 0x34]
	movs r3, 0x34
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _080DD960
	ldrh r3, [r2, 0x32]
	adds r0, r1, r3
	strh r0, [r2, 0x26]
	ldrh r0, [r2, 0x2E]
	adds r1, r0
	strh r1, [r2, 0x34]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r1, 16
	cmp r1, 0
	ble _080DD972
	movs r0, 0
	strh r0, [r2, 0x34]
	b _080DD972
_080DD960:
	ldrh r0, [r2, 0x30]
	subs r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _080DD972
	adds r0, r2, 0
	bl move_anim_8072740
_080DD972:
	pop {r0}
	bx r0
	thumb_func_end sub_80DD928

	thumb_func_start sub_80DD978
sub_80DD978: @ 80DD978
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080DD9A0 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080DD994
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_080DD994:
	adds r0, r4, 0
	bl sub_807941C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DD9A0: .4byte gBattleAnimBankAttacker
	thumb_func_end sub_80DD978

	thumb_func_start sub_80DD9A4
sub_80DD9A4: @ 80DD9A4
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080DD9F0 @ =gBattleAnimBankTarget
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080DD9F4 @ =gBattleAnimArgs
	ldrh r3, [r2]
	ldrh r5, [r4, 0x20]
	adds r1, r3, r5
	strh r1, [r4, 0x20]
	ldrh r1, [r2, 0x2]
	adds r0, r1
	strh r0, [r4, 0x22]
	strh r3, [r4, 0x30]
	strh r1, [r4, 0x32]
	ldrh r0, [r2, 0x4]
	strh r0, [r4, 0x38]
	ldrb r1, [r2, 0x6]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _080DD9F8 @ =sub_80DD9FC
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DD9F0: .4byte gBattleAnimBankTarget
_080DD9F4: .4byte gBattleAnimArgs
_080DD9F8: .4byte sub_80DD9FC
	thumb_func_end sub_80DD9A4

	thumb_func_start sub_80DD9FC
sub_80DD9FC: @ 80DD9FC
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x8
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x36]
	adds r0, r2
	strh r0, [r4, 0x36]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	movs r1, 0x28
	bl __divsi3
	ldrh r1, [r4, 0x24]
	adds r1, r0
	strh r1, [r4, 0x24]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x26]
	subs r1, r0
	strh r1, [r4, 0x26]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x8C
	ble _080DDA46
	adds r0, r4, 0
	bl move_anim_8072740
_080DDA46:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DD9FC

	thumb_func_start sub_80DDA4C
sub_80DDA4C: @ 80DDA4C
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _080DDA84 @ =gMoveDmgMoveAnim
	ldr r0, [r2]
	cmp r0, 0x20
	bgt _080DDA60
	ldr r1, _080DDA88 @ =gBattleAnimArgs
	movs r0, 0
	strh r0, [r1, 0xE]
_080DDA60:
	ldr r2, [r2]
	adds r0, r2, 0
	subs r0, 0x21
	cmp r0, 0x20
	bhi _080DDA70
	ldr r1, _080DDA88 @ =gBattleAnimArgs
	movs r0, 0x1
	strh r0, [r1, 0xE]
_080DDA70:
	cmp r2, 0x41
	ble _080DDA7A
	ldr r1, _080DDA88 @ =gBattleAnimArgs
	movs r0, 0x2
	strh r0, [r1, 0xE]
_080DDA7A:
	adds r0, r3, 0
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080DDA84: .4byte gMoveDmgMoveAnim
_080DDA88: .4byte gBattleAnimArgs
	thumb_func_end sub_80DDA4C

	thumb_func_start sub_80DDA8C
sub_80DDA8C: @ 80DDA8C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080DDAE8 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080DDAAE
	movs r0, 0
	bl sub_80789D4
	movs r0, 0xC8
	strh r0, [r5, 0xA]
_080DDAAE:
	ldr r4, _080DDAEC @ =gUnknown_030041B8
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	movs r1, 0xA
	bl __divsi3
	ldrh r1, [r4]
	adds r1, r0
	strh r1, [r4]
	ldrh r0, [r5, 0xA]
	subs r0, 0x3
	strh r0, [r5, 0xA]
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x78
	bne _080DDADA
	movs r0, 0x1
	bl sub_80789D4
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080DDADA:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DDAE8: .4byte gTasks
_080DDAEC: .4byte gUnknown_030041B8
	thumb_func_end sub_80DDA8C

	thumb_func_start sub_80DDAF0
sub_80DDAF0: @ 80DDAF0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _080DDB5C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080DDB1C
	movs r0, 0
	bl sub_80789D4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldr r0, _080DDB60 @ =gUnknown_030041B8
	ldrh r0, [r0]
	strh r0, [r4, 0xC]
_080DDB1C:
	ldrh r0, [r4, 0xA]
	adds r0, 0x50
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0xA]
	ldr r6, _080DDB60 @ =gUnknown_030041B8
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	movs r0, 0x4
	bl Cos
	ldrh r4, [r4, 0xC]
	adds r0, r4
	strh r0, [r6]
	ldr r0, _080DDB64 @ =gBattleAnimArgs
	movs r2, 0xE
	ldrsh r1, [r0, r2]
	ldr r0, _080DDB68 @ =0x00000fff
	cmp r1, r0
	bne _080DDB54
	movs r0, 0
	strh r0, [r6]
	movs r0, 0x1
	bl sub_80789D4
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080DDB54:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DDB5C: .4byte gTasks
_080DDB60: .4byte gUnknown_030041B8
_080DDB64: .4byte gBattleAnimArgs
_080DDB68: .4byte 0x00000fff
	thumb_func_end sub_80DDAF0

	thumb_func_start sub_80DDB6C
sub_80DDB6C: @ 80DDB6C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _080DDBC8 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldr r5, _080DDBCC @ =gBattleAnimBankTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_8078BD4
	ldr r0, _080DDBD0 @ =sub_80DDBD8
	str r0, [r4, 0x1C]
	movs r0, 0x10
	strh r0, [r4, 0x3A]
	ldr r1, _080DDBD4 @ =REG_BLDCNT
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0x3A]
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DDBC8: .4byte gBattleAnimArgs
_080DDBCC: .4byte gBattleAnimBankTarget
_080DDBD0: .4byte sub_80DDBD8
_080DDBD4: .4byte REG_BLDCNT
	thumb_func_end sub_80DDB6C

	thumb_func_start sub_80DDBD8
sub_80DDBD8: @ 80DDBD8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80DDCC8
	adds r0, r4, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	beq _080DDBF8
	ldr r0, _080DDBF4 @ =sub_80DDC4C
	str r0, [r4, 0x1C]
	b _080DDC42
	.align 2, 0
_080DDBF4: .4byte sub_80DDC4C
_080DDBF8:
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0xF
	bl Cos
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r2, [r4, 0x38]
	adds r0, r2, 0x5
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x38]
	lsls r2, 16
	asrs r2, 16
	cmp r2, 0
	beq _080DDC30
	cmp r2, 0xC4
	ble _080DDC42
_080DDC30:
	lsls r0, 16
	cmp r0, 0
	ble _080DDC42
	ldr r0, _080DDC48 @ =gUnknown_0202F7D2
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0xC4
	bl PlaySE12WithPanning
_080DDC42:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DDC48: .4byte gUnknown_0202F7D2
	thumb_func_end sub_80DDBD8

	thumb_func_start sub_80DDC4C
sub_80DDC4C: @ 80DDC4C
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x1
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl sub_8078B5C
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0xF
	bl Cos
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r2, [r4, 0x38]
	adds r0, r2, 0x5
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x38]
	lsls r2, 16
	asrs r2, 16
	cmp r2, 0
	beq _080DDC92
	cmp r2, 0xC4
	ble _080DDC9E
_080DDC92:
	lsls r0, 16
	cmp r0, 0
	ble _080DDC9E
	movs r0, 0xC4
	bl PlaySE
_080DDC9E:
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080DDCBC
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080DDCB8 @ =sub_807861C
	str r0, [r4, 0x1C]
	b _080DDCC2
	.align 2, 0
_080DDCB8: .4byte sub_807861C
_080DDCBC:
	adds r0, r4, 0
	bl sub_80DDCC8
_080DDCC2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DDC4C

	thumb_func_start sub_80DDCC8
sub_80DDCC8: @ 80DDCC8
	push {r4,lr}
	adds r3, r0, 0
	ldrh r2, [r3, 0x3A]
	movs r1, 0x3A
	ldrsh r0, [r3, r1]
	cmp r0, 0xFF
	ble _080DDCEC
	adds r0, r2, 0x1
	strh r0, [r3, 0x3A]
	lsls r0, 16
	ldr r1, _080DDCE8 @ =0x010d0000
	cmp r0, r1
	bne _080DDD4C
	movs r0, 0
	b _080DDD4A
	.align 2, 0
_080DDCE8: .4byte 0x010d0000
_080DDCEC:
	ldrh r1, [r3, 0x3C]
	adds r4, r1, 0x1
	strh r4, [r3, 0x3C]
	movs r0, 0xFF
	ands r0, r1
	cmp r0, 0
	bne _080DDD4C
	ldr r1, _080DDD10 @ =0xffffff00
	ands r1, r4
	strh r1, [r3, 0x3C]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080DDD14
	adds r0, r2, 0x1
	b _080DDD16
	.align 2, 0
_080DDD10: .4byte 0xffffff00
_080DDD14:
	subs r0, r2, 0x1
_080DDD16:
	strh r0, [r3, 0x3A]
	ldr r2, _080DDD54 @ =REG_BLDALPHA
	ldrh r1, [r3, 0x3A]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r0, r1
	strh r0, [r2]
	movs r2, 0x3A
	ldrsh r0, [r3, r2]
	cmp r0, 0
	beq _080DDD32
	cmp r0, 0x10
	bne _080DDD3E
_080DDD32:
	ldrh r0, [r3, 0x3C]
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	eors r0, r1
	strh r0, [r3, 0x3C]
_080DDD3E:
	movs r1, 0x3A
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080DDD4C
	movs r0, 0x80
	lsls r0, 1
_080DDD4A:
	strh r0, [r3, 0x3A]
_080DDD4C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DDD54: .4byte REG_BLDALPHA
	thumb_func_end sub_80DDCC8

	thumb_func_start sub_80DDD58
sub_80DDD58: @ 80DDD58
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8078764
	ldr r1, _080DDD74 @ =sub_80DDD78
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DDD74: .4byte sub_80DDD78
	thumb_func_end sub_80DDD58

	thumb_func_start sub_80DDD78
sub_80DDD78: @ 80DDD78
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x20
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x8
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x41
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x82
	bhi _080DDDAC
	ldrb r0, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x8
	b _080DDDB6
_080DDDAC:
	ldrb r0, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
_080DDDB6:
	orrs r1, r0
	strb r1, [r4, 0x5]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x13
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x32]
	adds r0, 0x50
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3D
	bne _080DDDE8
	adds r0, r4, 0
	bl move_anim_8072740
_080DDDE8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DDD78

	thumb_func_start sub_80DDDF0
sub_80DDDF0: @ 80DDDF0
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _080DDE68 @ =REG_BLDCNT
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0x80
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0
	bl GetAnimBankSpriteId
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8078E70
	adds r0, r4, 0
	movs r1, 0x80
	movs r2, 0x80
	movs r3, 0
	bl obj_id_set_rotscale
	ldr r1, _080DDE6C @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldr r1, _080DDE70 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	movs r1, 0x80
	strh r1, [r0, 0x8]
	ldr r1, _080DDE74 @ =gBattleAnimArgs
	ldrh r1, [r1]
	strh r1, [r0, 0xA]
	strh r2, [r0, 0xC]
	movs r1, 0x10
	strh r1, [r0, 0xE]
	ldr r1, _080DDE78 @ =sub_80DDE7C
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DDE68: .4byte REG_BLDCNT
_080DDE6C: .4byte gSprites
_080DDE70: .4byte gTasks
_080DDE74: .4byte gBattleAnimArgs
_080DDE78: .4byte sub_80DDE7C
	thumb_func_end sub_80DDDF0

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
	bl GetAnimBankSpriteId
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
	ldr r0, _080DDFDC @ =gBattleAnimBankAttacker
	mov r8, r0
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	mov r9, r1
	strh r0, [r4, 0x20]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x3
	bl sub_8077ABC
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
_080DDFDC: .4byte gBattleAnimBankAttacker
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
	ldr r4, _080DE098 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x30]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
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
_080DE098: .4byte gBattleAnimBankTarget
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
	ldr r4, _080DE0EC @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
_080DE0E2:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080DE0F6
	.align 2, 0
_080DE0EC: .4byte gBattleAnimBankTarget
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
	bl move_anim_8072740
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
	ldr r0, _080DE250 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	bl GetBankSide
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
_080DE250: .4byte gBattleAnimBankTarget
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
	ldr r0, _080DE410 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	bl GetBankIdentity_permutated
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
_080DE410: .4byte gBattleAnimBankTarget
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
	bl GetAnimBankSpriteId
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
	bl sub_8089944
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
	ldr r0, _080DE6E4 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	bl GetBankIdentity_permutated
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
_080DE6E4: .4byte gBattleAnimBankTarget
_080DE6E8:
	cmp r0, 0x2
	beq _080DE740
	b _080DE7AA
_080DE6EE:
	ldr r1, _080DE710 @ =gUnknown_03004DC0
	movs r0, 0x3
	strb r0, [r1, 0x15]
	movs r0, 0x1
	bl GetAnimBankSpriteId
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
_080DE710: .4byte gUnknown_03004DC0
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
	ldr r4, _080DE7F8 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 8
	movs r2, 0xE0
	lsls r2, 13
	adds r0, r2
	lsrs r5, r0, 16
	ldr r4, _080DE7FC @ =gBattleAnimBankTarget
	b _080DE824
	.align 2, 0
_080DE7F4: .4byte gBattleAnimArgs
_080DE7F8: .4byte gBattleAnimBankAttacker
_080DE7FC: .4byte gBattleAnimBankTarget
_080DE800:
	ldr r4, _080DE8C8 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 8
	movs r2, 0xE0
	lsls r2, 13
	adds r0, r2
	lsrs r5, r0, 16
	ldr r4, _080DE8CC @ =gBattleAnimBankAttacker
_080DE824:
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
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
_080DE8C8: .4byte gBattleAnimBankTarget
_080DE8CC: .4byte gBattleAnimBankAttacker
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
	ldr r4, _080DEA74 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_807A100
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080DE988
	b _080DEA88
_080DE988:
	movs r4, 0
_080DE98A:
	lsls r1, r4, 16
	asrs r3, r1, 16
	ldr r0, _080DEA74 @ =gBattleAnimBankAttacker
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
	bl sub_8077ABC
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
_080DEA74: .4byte gBattleAnimBankAttacker
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
	ldr r0, _080DECF8 @ =gUnknown_030042C4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080DECFC @ =gUnknown_03004240
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
	ldr r0, _080DED08 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080DECF4
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080DED0C
_080DECF4:
	movs r6, 0x28
	b _080DED0E
	.align 2, 0
_080DECF8: .4byte gUnknown_030042C4
_080DECFC: .4byte gUnknown_03004240
_080DED00: .4byte REG_WININ
_080DED04: .4byte 0x00003f3f
_080DED08: .4byte gBattleAnimBankAttacker
_080DED0C:
	movs r6, 0xC8
_080DED0E:
	ldr r1, _080DED4C @ =gUnknown_030042C4
	lsls r3, r6, 16
	asrs r2, r3, 16
	lsls r0, r2, 8
	orrs r0, r2
	strh r0, [r1]
	ldr r1, _080DED50 @ =gUnknown_03004240
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
_080DED4C: .4byte gUnknown_030042C4
_080DED50: .4byte gUnknown_03004240
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
	ldr r1, _080DEEE0 @ =gUnknown_030042C4
	mov r2, r9
	lsls r0, r2, 8
	orrs r7, r0
	strh r7, [r1]
	ldr r1, _080DEEE4 @ =gUnknown_03004240
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
_080DEEE0: .4byte gUnknown_030042C4
_080DEEE4: .4byte gUnknown_03004240
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
	ldr r0, _080DEF2C @ =gUnknown_030042C4
	strh r2, [r0]
	ldr r0, _080DEF30 @ =gUnknown_03004240
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
_080DEF2C: .4byte gUnknown_030042C4
_080DEF30: .4byte gUnknown_03004240
_080DEF34: .4byte REG_WININ
_080DEF38: .4byte 0x00003f3f
	thumb_func_end sub_80DEEE8

	thumb_func_start sub_80DEF3C
sub_80DEF3C: @ 80DEF3C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _080DEF68 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
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
_080DEF68: .4byte gBattleAnimBankAttacker
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
	ldr r0, _080DF004 @ =sub_80782D8
	str r0, [r3, 0x1C]
	ldr r1, _080DF008 @ =sub_80DF018
	adds r0, r3, 0
	bl StoreSpriteCallbackInData
	b _080DF010
	.align 2, 0
_080DEFFC: .4byte 0x000003ff
_080DF000: .4byte 0xfffffc00
_080DF004: .4byte sub_80782D8
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
	ldr r1, _080DF0B0 @ =gUnknown_030042C4
	strh r2, [r1]
	ldr r1, _080DF0B4 @ =gUnknown_03004240
	strh r2, [r1]
	bl move_anim_8072740
	pop {r0}
	bx r0
	.align 2, 0
_080DF0AC: .4byte REG_BLDCNT
_080DF0B0: .4byte gUnknown_030042C4
_080DF0B4: .4byte gUnknown_03004240
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
	ldr r0, _080DF120 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
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
_080DF120: .4byte gBattleAnimBankAttacker
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
	bl move_anim_8072740
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
	ldr r5, _080DF240 @ =gBattleAnimBankAttacker
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
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
_080DF240: .4byte gBattleAnimBankAttacker
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
	ldr r0, _080DF2FC @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
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
_080DF2FC: .4byte gBattleAnimBankAttacker
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
	ldr r2, _080DF4E0 @ =gObjectBankIDs
	ldr r1, _080DF4E4 @ =gBattleAnimBankAttacker
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
_080DF4E0: .4byte gObjectBankIDs
_080DF4E4: .4byte gBattleAnimBankAttacker
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

	thumb_func_start sub_80DF5A0
sub_80DF5A0: @ 80DF5A0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080DF5E8 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080DF5F0
	ldr r2, _080DF5EC @ =gBattleAnimArgs
	ldrh r0, [r5, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r5, 0x20]
	ldrh r0, [r2, 0x6]
	negs r0, r0
	strh r0, [r2, 0x6]
	ldrh r0, [r2, 0x8]
	negs r0, r0
	strh r0, [r2, 0x8]
	adds r1, r2, 0
	b _080DF5FA
	.align 2, 0
_080DF5E8: .4byte gBattleAnimBankAttacker
_080DF5EC: .4byte gBattleAnimArgs
_080DF5F0:
	ldr r1, _080DF630 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r5, 0x20]
	adds r0, r2
	strh r0, [r5, 0x20]
_080DF5FA:
	ldrh r0, [r1, 0x2]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r5, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r5, 0x34]
	ldrh r0, [r1, 0xA]
	strh r0, [r5, 0x38]
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080DF634 @ =move_anim_8074EE0
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	ldr r0, _080DF638 @ =sub_8078504
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DF630: .4byte gBattleAnimArgs
_080DF634: .4byte move_anim_8074EE0
_080DF638: .4byte sub_8078504
	thumb_func_end sub_80DF5A0

	thumb_func_start sub_80DF63C
sub_80DF63C: @ 80DF63C
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_8078650
	ldr r4, _080DF694 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	ldr r0, _080DF698 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080DF6A0
	ldr r2, _080DF69C @ =gBattleAnimArgs
	ldrh r0, [r5, 0x20]
	ldrh r1, [r2, 0x2]
	subs r0, r1
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x22]
	adds r1, r0
	strh r1, [r5, 0x22]
	ldrh r0, [r5, 0x32]
	ldrh r1, [r2, 0x4]
	subs r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r2, 0x6]
	ldrh r1, [r5, 0x36]
	adds r0, r1
	strh r0, [r5, 0x36]
	b _080DF6CA
	.align 2, 0
_080DF694: .4byte gBattleAnimBankTarget
_080DF698: .4byte gBattleAnimBankAttacker
_080DF69C: .4byte gBattleAnimArgs
_080DF6A0:
	ldr r1, _080DF6E4 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r5, 0x20]
	adds r0, r2
	strh r0, [r5, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	ldrh r0, [r1, 0x4]
	ldrh r2, [r5, 0x32]
	adds r0, r2
	strh r0, [r5, 0x32]
	ldrh r0, [r1, 0x6]
	ldrh r1, [r5, 0x36]
	adds r0, r1
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAnim
_080DF6CA:
	ldr r0, _080DF6E4 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x8]
	strh r0, [r5, 0x2E]
	ldr r0, _080DF6E8 @ =sub_8078B34
	str r0, [r5, 0x1C]
	ldr r1, _080DF6EC @ =move_anim_8074EE0
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DF6E4: .4byte gBattleAnimArgs
_080DF6E8: .4byte sub_8078B34
_080DF6EC: .4byte move_anim_8074EE0
	thumb_func_end sub_80DF63C

	thumb_func_start sub_80DF6F0
sub_80DF6F0: @ 80DF6F0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080DF704 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080DF70C
	ldr r4, _080DF708 @ =gBattleAnimBankAttacker
	b _080DF70E
	.align 2, 0
_080DF704: .4byte gBattleAnimArgs
_080DF708: .4byte gBattleAnimBankAttacker
_080DF70C:
	ldr r4, _080DF750 @ =gBattleAnimBankTarget
_080DF70E:
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
	strh r0, [r5, 0x22]
	ldr r4, _080DF754 @ =gBattleAnimArgs
	movs r0, 0x2
	ldrsh r1, [r4, r0]
	adds r0, r5, 0
	bl sub_807867C
	ldrh r0, [r4, 0x4]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
	ldr r0, _080DF758 @ =sub_8078600
	str r0, [r5, 0x1C]
	ldr r1, _080DF75C @ =move_anim_8074EE0
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DF750: .4byte gBattleAnimBankTarget
_080DF754: .4byte gBattleAnimArgs
_080DF758: .4byte sub_8078600
_080DF75C: .4byte move_anim_8074EE0
	thumb_func_end sub_80DF6F0

	thumb_func_start sub_80DF760
sub_80DF760: @ 80DF760
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080DF788 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080DF77A
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_080DF77A:
	adds r0, r4, 0
	bl sub_80DF63C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DF788: .4byte gBattleAnimBankAttacker
	thumb_func_end sub_80DF760

	thumb_func_start sub_80DF78C
sub_80DF78C: @ 80DF78C
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r4, _080DF7E0 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r6, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x22]
	strh r5, [r6, 0x36]
	movs r0, 0x1
	strh r0, [r6, 0x38]
	ldr r0, _080DF7E4 @ =gBattleAnimArgs
	ldrh r0, [r0]
	strh r0, [r6, 0x3A]
	ldr r4, _080DF7E8 @ =gBankAttacker
	ldrb r0, [r4]
	movs r1, 0
	bl sub_807A100
	lsls r7, r0, 16
	lsrs r5, r7, 16
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_807A100
	lsls r1, r0, 16
	lsrs r0, r1, 16
	cmp r5, r0
	bls _080DF7EC
	lsrs r0, r7, 17
	b _080DF7EE
	.align 2, 0
_080DF7E0: .4byte gBattleAnimBankAttacker
_080DF7E4: .4byte gBattleAnimArgs
_080DF7E8: .4byte gBankAttacker
_080DF7EC:
	lsrs r0, r1, 17
_080DF7EE:
	strh r0, [r6, 0x3C]
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	movs r2, 0x3C
	ldrsh r1, [r6, r2]
	bl Cos
	strh r0, [r6, 0x24]
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	movs r2, 0x3C
	ldrsh r1, [r6, r2]
	bl Sin
	strh r0, [r6, 0x26]
	ldr r0, _080DF818 @ =sub_80DF81C
	str r0, [r6, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DF818: .4byte sub_80DF81C
	thumb_func_end sub_80DF78C

	thumb_func_start sub_80DF81C
sub_80DF81C: @ 80DF81C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r5, [r4, r0]
	cmp r5, 0
	beq _080DF82E
	cmp r5, 0x1
	beq _080DF89A
	b _080DF91E
_080DF82E:
	ldrh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x38]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3A]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080DF880
	strh r5, [r4, 0x36]
	ldrh r1, [r4, 0x38]
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080DF880
	adds r0, r1, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _080DF880
	movs r0, 0x10
	strh r0, [r4, 0x38]
_080DF880:
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3C
	ble _080DF91E
	movs r0, 0
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080DF91E
_080DF89A:
	ldrh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x38]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x3C]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	cmp r0, 0x95
	bgt _080DF8C2
	adds r0, r1, 0
	adds r0, 0x8
	strh r0, [r4, 0x3C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x95
	ble _080DF8C2
	movs r0, 0x96
	strh r0, [r4, 0x3C]
_080DF8C2:
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080DF90A
	movs r0, 0
	strh r0, [r4, 0x36]
	ldrh r1, [r4, 0x38]
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080DF90A
	adds r0, r1, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _080DF90A
	movs r0, 0x10
	strh r0, [r4, 0x38]
_080DF90A:
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080DF91E
	adds r0, r4, 0
	bl move_anim_8072740
_080DF91E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80DF81C

	thumb_func_start sub_80DF924
sub_80DF924: @ 80DF924
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080DF950 @ =gTasks
	adds r4, r1, r0
	ldr r0, _080DF954 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankIdentity_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080DF960
	ldr r0, _080DF958 @ =REG_BG1HOFS
	str r0, [sp]
	ldr r0, _080DF95C @ =gUnknown_030042C0
	b _080DF966
	.align 2, 0
_080DF950: .4byte gTasks
_080DF954: .4byte gBattleAnimBankAttacker
_080DF958: .4byte REG_BG1HOFS
_080DF95C: .4byte gUnknown_030042C0
_080DF960:
	ldr r0, _080DF9DC @ =REG_BG2HOFS
	str r0, [sp]
	ldr r0, _080DF9E0 @ =gUnknown_03004288
_080DF966:
	ldrh r0, [r0]
	strh r0, [r4, 0xC]
	ldr r0, _080DF9E4 @ =0xa2600001
	str r0, [sp, 0x4]
	mov r1, sp
	movs r5, 0
	movs r0, 0x1
	strb r0, [r1, 0x8]
	mov r0, sp
	strb r5, [r0, 0x9]
	ldr r0, _080DF9E8 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl sub_8077FC0
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	subs r1, 0x20
	strh r1, [r4, 0xE]
	adds r0, 0x20
	strh r0, [r4, 0x10]
	cmp r1, 0
	bge _080DF996
	strh r5, [r4, 0xE]
_080DF996:
	ldrh r3, [r4, 0xE]
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	bgt _080DF9C4
	ldr r5, _080DF9EC @ =gUnknown_03004DE0
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r5, r0
_080DF9A8:
	lsls r1, r3, 1
	adds r2, r1, r5
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	adds r1, r6
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	ble _080DF9A8
_080DF9C4:
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl sub_80895F8
	ldr r0, _080DF9F0 @ =sub_80DF9F4
	str r0, [r4]
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DF9DC: .4byte REG_BG2HOFS
_080DF9E0: .4byte gUnknown_03004288
_080DF9E4: .4byte 0xa2600001
_080DF9E8: .4byte gBattleAnimBankAttacker
_080DF9EC: .4byte gUnknown_03004DE0
_080DF9F0: .4byte sub_80DF9F4
	thumb_func_end sub_80DF924

	thumb_func_start sub_80DF9F4
sub_80DF9F4: @ 80DF9F4
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	ldr r1, _080DFA18 @ =gTasks
	adds r2, r0, r1
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	cmp r0, 0x4
	bhi _080DFAAA
	lsls r0, 2
	ldr r1, _080DFA1C @ =_080DFA20
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DFA18: .4byte gTasks
_080DFA1C: .4byte _080DFA20
	.align 2, 0
_080DFA20:
	.4byte _080DFA34
	.4byte _080DFA56
	.4byte _080DFA66
	.4byte _080DFA92
	.4byte _080DFAA4
_080DFA34:
	ldrh r0, [r2, 0x16]
	adds r0, 0x1
	strh r0, [r2, 0x16]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080DFA8A
	movs r0, 0
	strh r0, [r2, 0x16]
	ldrh r0, [r2, 0x14]
	adds r0, 0x1
	strh r0, [r2, 0x14]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080DFA8A
	b _080DFA84
_080DFA56:
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3C
	ble _080DFA8A
	b _080DFA84
_080DFA66:
	ldrh r0, [r2, 0x16]
	adds r0, 0x1
	strh r0, [r2, 0x16]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080DFA8A
	movs r0, 0
	strh r0, [r2, 0x16]
	ldrh r0, [r2, 0x14]
	subs r0, 0x1
	strh r0, [r2, 0x14]
	lsls r0, 16
	cmp r0, 0
	bne _080DFA8A
_080DFA84:
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
_080DFA8A:
	adds r0, r2, 0
	bl sub_80DFAB0
	b _080DFAAA
_080DFA92:
	ldr r1, _080DFAA0 @ =gUnknown_03004DC0
	movs r0, 0x3
	strb r0, [r1, 0x15]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _080DFAAA
	.align 2, 0
_080DFAA0: .4byte gUnknown_03004DC0
_080DFAA4:
	adds r0, r3, 0
	bl DestroyAnimVisualTask
_080DFAAA:
	pop {r0}
	bx r0
	thumb_func_end sub_80DF9F4

	thumb_func_start sub_80DFAB0
sub_80DFAB0: @ 80DFAB0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	ldrh r3, [r5, 0x12]
	ldrh r4, [r5, 0xE]
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r4, r0
	bgt _080DFB06
	ldr r7, _080DFB1C @ =gUnknown_03004DE0
	mov r12, r7
	ldr r0, _080DFB20 @ =gSineTable
	mov r8, r0
	ldr r6, _080DFB24 @ =gUnknown_03004DC0
_080DFACE:
	lsls r2, r4, 1
	ldrb r1, [r6, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	add r2, r12
	lsls r0, r3, 1
	add r0, r8
	movs r7, 0
	ldrsh r1, [r0, r7]
	movs r7, 0x14
	ldrsh r0, [r5, r7]
	muls r0, r1
	asrs r0, 7
	ldrh r1, [r5, 0xC]
	adds r0, r1
	strh r0, [r2]
	adds r3, 0x8
	movs r0, 0xFF
	ands r3, r0
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	movs r7, 0x10
	ldrsh r0, [r5, r7]
	cmp r4, r0
	ble _080DFACE
_080DFB06:
	ldrh r0, [r5, 0x12]
	adds r0, 0x9
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x12]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DFB1C: .4byte gUnknown_03004DE0
_080DFB20: .4byte gSineTable
_080DFB24: .4byte gUnknown_03004DC0
	thumb_func_end sub_80DFAB0

	thumb_func_start sub_80DFB28
sub_80DFB28: @ 80DFB28
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	ldr r5, _080DFBC8 @ =gBattleAnimArgs
	movs r0, 0x4
	ldrsh r1, [r5, r0]
	lsls r0, r1, 1
	adds r0, r1
	movs r1, 0x5
	bl __divsi3
	adds r6, r0, 0
	ldr r1, _080DFBCC @ =gBattleAnimBankAttacker
	mov r8, r1
	ldrb r0, [r1]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	mov r2, r8
	ldrb r0, [r2]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r3, [r5, 0x8]
	adds r0, r3
	strh r0, [r4, 0x22]
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	movs r2, 0x4
	ldrsh r1, [r5, r2]
	bl Cos
	strh r0, [r4, 0x30]
	movs r3, 0x2
	ldrsh r0, [r5, r3]
	lsls r6, 16
	asrs r6, 16
	adds r1, r6, 0
	bl Sin
	strh r0, [r4, 0x32]
	ldrh r1, [r4, 0x30]
	ldrh r2, [r5]
	adds r3, r2, 0
	muls r3, r1
	adds r1, r3, 0
	ldrh r3, [r4, 0x20]
	adds r1, r3
	strh r1, [r4, 0x20]
	adds r1, r2, 0
	muls r1, r0
	adds r0, r1, 0
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x34]
	ldr r0, _080DFBD0 @ =sub_80DFBD8
	str r0, [r4, 0x1C]
	adds r4, 0x2E
	ldr r2, _080DFBD4 @ =gUnknown_03000730
	movs r1, 0x6
_080DFBB0:
	ldrh r0, [r4]
	strh r0, [r2]
	adds r4, 0x2
	adds r2, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _080DFBB0
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DFBC8: .4byte gBattleAnimArgs
_080DFBCC: .4byte gBattleAnimBankAttacker
_080DFBD0: .4byte sub_80DFBD8
_080DFBD4: .4byte gUnknown_03000730
	thumb_func_end sub_80DFB28

	thumb_func_start sub_80DFBD8
sub_80DFBD8: @ 80DFBD8
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x36]
	adds r0, r1
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x38]
	adds r0, r2
	strh r0, [r4, 0x38]
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl __divsi3
	strh r0, [r4, 0x24]
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	movs r1, 0xA
	bl __divsi3
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _080DFC1C
	adds r0, r4, 0
	bl move_anim_8072740
_080DFC1C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DFBD8

	thumb_func_start sub_80DFC24
sub_80DFC24: @ 80DFC24
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080DFC58 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080DFC5C @ =gBattleAnimArgs
	ldrh r0, [r0]
	strh r0, [r1, 0x8]
	ldr r0, _080DFC60 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	movs r2, 0x10
	strh r2, [r1, 0xA]
	ldr r1, _080DFC64 @ =REG_BLDALPHA
	strh r2, [r1]
	bl GetBankIdentity_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080DFC70
	ldr r1, _080DFC68 @ =REG_BLDCNT
	ldr r2, _080DFC6C @ =0x00003f42
	b _080DFC74
	.align 2, 0
_080DFC58: .4byte gTasks
_080DFC5C: .4byte gBattleAnimArgs
_080DFC60: .4byte gBattleAnimBankAttacker
_080DFC64: .4byte REG_BLDALPHA
_080DFC68: .4byte REG_BLDCNT
_080DFC6C: .4byte 0x00003f42
_080DFC70:
	ldr r1, _080DFC8C @ =REG_BLDCNT
	ldr r2, _080DFC90 @ =0x00003f44
_080DFC74:
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080DFC94 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080DFC98 @ =sub_80DFC9C
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DFC8C: .4byte REG_BLDCNT
_080DFC90: .4byte 0x00003f44
_080DFC94: .4byte gTasks
_080DFC98: .4byte sub_80DFC9C
	thumb_func_end sub_80DFC24

	thumb_func_start sub_80DFC9C
sub_80DFC9C: @ 80DFC9C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080DFD04 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0xA]
	lsrs r2, r0, 8
	lsls r0, 24
	lsrs r1, r0, 24
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	ldrb r3, [r4, 0x8]
	cmp r0, r3
	bne _080DFD18
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	subs r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r2, 8
	orrs r1, r0
	movs r3, 0
	strh r1, [r4, 0xA]
	ldr r0, _080DFD08 @ =REG_BLDALPHA
	strh r1, [r0]
	strh r3, [r4, 0xC]
	cmp r2, 0x10
	bne _080DFD1E
	ldr r2, _080DFD0C @ =gSprites
	ldr r1, _080DFD10 @ =gObjectBankIDs
	ldr r0, _080DFD14 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	b _080DFD1E
	.align 2, 0
_080DFD04: .4byte gTasks
_080DFD08: .4byte REG_BLDALPHA
_080DFD0C: .4byte gSprites
_080DFD10: .4byte gObjectBankIDs
_080DFD14: .4byte gBattleAnimBankAttacker
_080DFD18:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
_080DFD1E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80DFC9C

	thumb_func_start sub_80DFD24
sub_80DFD24: @ 80DFD24
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080DFD48 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080DFD4C @ =gBattleAnimArgs
	ldrh r0, [r0]
	strh r0, [r1, 0x8]
	movs r2, 0x80
	lsls r2, 5
	strh r2, [r1, 0xA]
	ldr r0, _080DFD50 @ =sub_80DFD58
	str r0, [r1]
	ldr r0, _080DFD54 @ =REG_BLDALPHA
	strh r2, [r0]
	bx lr
	.align 2, 0
_080DFD48: .4byte gTasks
_080DFD4C: .4byte gBattleAnimArgs
_080DFD50: .4byte sub_80DFD58
_080DFD54: .4byte REG_BLDALPHA
	thumb_func_end sub_80DFD24

	thumb_func_start sub_80DFD58
sub_80DFD58: @ 80DFD58
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080DFDA8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0xA]
	lsrs r1, r0, 8
	lsls r0, 24
	lsrs r5, r0, 24
	movs r3, 0xC
	ldrsh r0, [r2, r3]
	ldrb r3, [r2, 0x8]
	cmp r0, r3
	bne _080DFDB4
	subs r0, r1, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r3, 8
	orrs r1, r0
	movs r0, 0
	strh r1, [r2, 0xA]
	ldr r5, _080DFDAC @ =REG_BLDALPHA
	strh r1, [r5]
	strh r0, [r2, 0xC]
	cmp r3, 0
	bne _080DFDBA
	ldr r0, _080DFDB0 @ =REG_BLDCNT
	strh r3, [r0]
	strh r3, [r5]
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	b _080DFDBA
	.align 2, 0
_080DFDA8: .4byte gTasks
_080DFDAC: .4byte REG_BLDALPHA
_080DFDB0: .4byte REG_BLDCNT
_080DFDB4:
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
_080DFDBA:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80DFD58

	thumb_func_start sub_80DFDC0
sub_80DFDC0: @ 80DFDC0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080DFDE8 @ =REG_BLDALPHA
	movs r2, 0x80
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080DFDEC @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankIdentity_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080DFDF8
	ldr r1, _080DFDF0 @ =REG_BLDCNT
	ldr r2, _080DFDF4 @ =0x00003f42
	b _080DFDFC
	.align 2, 0
_080DFDE8: .4byte REG_BLDALPHA
_080DFDEC: .4byte gBattleAnimBankAttacker
_080DFDF0: .4byte REG_BLDCNT
_080DFDF4: .4byte 0x00003f42
_080DFDF8:
	ldr r1, _080DFE0C @ =REG_BLDCNT
	ldr r2, _080DFE10 @ =0x00003f44
_080DFDFC:
	adds r0, r2, 0
	strh r0, [r1]
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DFE0C: .4byte REG_BLDCNT
_080DFE10: .4byte 0x00003f44
	thumb_func_end sub_80DFDC0

	thumb_func_start sub_80DFE14
sub_80DFE14: @ 80DFE14
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r6, _080DFE80 @ =gBattleAnimBankTarget
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x30]
	ldr r5, _080DFE84 @ =gBattleAnimBankAttacker
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x34]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	movs r0, 0x7E
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl sub_8078A5C
	ldrh r0, [r4, 0x30]
	negs r0, r0
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x32]
	negs r0, r0
	strh r0, [r4, 0x36]
	ldr r0, _080DFE88 @ =0x0000ffd8
	strh r0, [r4, 0x3A]
	ldr r1, _080DFE8C @ =sub_80DFE90
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DFE80: .4byte gBattleAnimBankTarget
_080DFE84: .4byte gBattleAnimBankAttacker
_080DFE88: .4byte 0x0000ffd8
_080DFE8C: .4byte sub_80DFE90
	thumb_func_end sub_80DFE14

	thumb_func_start sub_80DFE90
sub_80DFE90: @ 80DFE90
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrh r5, [r4, 0x30]
	ldrh r0, [r4, 0x34]
	adds r2, r5, r0
	strh r2, [r4, 0x34]
	ldrh r3, [r4, 0x32]
	ldrh r6, [r4, 0x36]
	adds r1, r3, r6
	strh r1, [r4, 0x36]
	lsls r0, r2, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	lsls r0, r1, 16
	asrs r0, 24
	strh r0, [r4, 0x26]
	movs r6, 0x3C
	ldrsh r0, [r4, r6]
	cmp r0, 0
	bne _080DFED2
	adds r0, r2, r5
	strh r0, [r4, 0x34]
	adds r1, r3
	strh r1, [r4, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	lsls r1, 16
	asrs r1, 24
	strh r1, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
_080DFED2:
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r2, 0x3A
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r6, [r4, 0x26]
	adds r0, r6
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x38]
	adds r0, 0x3
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	cmp r0, 0x7F
	ble _080DFF02
	movs r0, 0
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x3A]
	adds r0, 0x14
	strh r0, [r4, 0x3A]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
_080DFF02:
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _080DFF14
	adds r0, r4, 0
	bl move_anim_8072740
_080DFF14:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80DFE90

	thumb_func_start sub_80DFF1C
sub_80DFF1C: @ 80DFF1C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080DFF50 @ =gBattleAnimArgs
	ldrh r0, [r5]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrb r1, [r5, 0x4]
	adds r0, r4, 0
	bl StartSpriteAffineAnim
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x30]
	ldrh r0, [r5, 0xA]
	strh r0, [r4, 0x32]
	ldr r0, _080DFF54 @ =sub_80DFF58
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DFF50: .4byte gBattleAnimArgs
_080DFF54: .4byte sub_80DFF58
	thumb_func_end sub_80DFF1C

	thumb_func_start sub_80DFF58
sub_80DFF58: @ 80DFF58
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x36]
	adds r0, r1
	strh r0, [r2, 0x36]
	ldrh r1, [r2, 0x30]
	ldrh r3, [r2, 0x38]
	adds r1, r3
	strh r1, [r2, 0x38]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r2, 0x24]
	lsls r1, 16
	asrs r1, 24
	strh r1, [r2, 0x26]
	ldrh r0, [r2, 0x34]
	adds r0, 0x1
	strh r0, [r2, 0x34]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x32
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bne _080DFF8E
	ldr r0, _080DFF94 @ =sub_80DFF98
	str r0, [r2, 0x1C]
_080DFF8E:
	pop {r0}
	bx r0
	.align 2, 0
_080DFF94: .4byte sub_80DFF98
	thumb_func_end sub_80DFF58

	thumb_func_start sub_80DFF98
sub_80DFF98: @ 80DFF98
	push {lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x36]
	ldrh r0, [r3, 0x2E]
	subs r1, r0
	strh r1, [r3, 0x36]
	ldrh r0, [r3, 0x38]
	ldrh r2, [r3, 0x30]
	subs r0, r2
	strh r0, [r3, 0x38]
	lsls r1, 16
	asrs r1, 24
	strh r1, [r3, 0x24]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r3, 0x26]
	ldrh r0, [r3, 0x34]
	subs r0, 0x1
	strh r0, [r3, 0x34]
	lsls r0, 16
	cmp r0, 0
	bne _080DFFCA
	adds r0, r3, 0
	bl move_anim_8074EE0
_080DFFCA:
	pop {r0}
	bx r0
	thumb_func_end sub_80DFF98

	thumb_func_start sub_80DFFD0
sub_80DFFD0: @ 80DFFD0
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r0, _080DFFE4 @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r3, r0, 0
	cmp r1, 0
	bne _080DFFEC
	ldr r0, _080DFFE8 @ =gBattleAnimBankAttacker
	b _080DFFEE
	.align 2, 0
_080DFFE4: .4byte gBattleAnimArgs
_080DFFE8: .4byte gBattleAnimBankAttacker
_080DFFEC:
	ldr r0, _080E001C @ =gBattleAnimBankTarget
_080DFFEE:
	ldrb r5, [r0]
	movs r6, 0x14
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x4
	ldr r7, _080E0020 @ =0x000003ff
	adds r0, r7, 0
	ands r1, r0
	ldr r0, _080E0024 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	movs r1, 0x2
	ldrsh r0, [r3, r1]
	cmp r0, 0x1
	beq _080E004C
	cmp r0, 0x1
	bgt _080E0028
	cmp r0, 0
	beq _080E0032
	b _080E00A0
	.align 2, 0
_080E001C: .4byte gBattleAnimBankTarget
_080E0020: .4byte 0x000003ff
_080E0024: .4byte 0xfffffc00
_080E0028:
	cmp r0, 0x2
	beq _080E0066
	cmp r0, 0x3
	beq _080E007E
	b _080E00A0
_080E0032:
	adds r0, r5, 0
	movs r1, 0x5
	bl sub_807A100
	subs r0, 0x8
	strh r0, [r4, 0x20]
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_807A100
	adds r0, 0x8
	strh r0, [r4, 0x22]
	b _080E00A0
_080E004C:
	adds r0, r5, 0
	movs r1, 0x5
	bl sub_807A100
	subs r0, 0xE
	strh r0, [r4, 0x20]
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_807A100
	adds r0, 0x10
	strh r0, [r4, 0x22]
	b _080E00A0
_080E0066:
	adds r0, r5, 0
	movs r1, 0x4
	bl sub_807A100
	adds r0, 0x8
	strh r0, [r4, 0x20]
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_807A100
	adds r0, 0x8
	b _080E0094
_080E007E:
	adds r0, r5, 0
	movs r1, 0x4
	bl sub_807A100
	adds r0, 0xE
	strh r0, [r4, 0x20]
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_807A100
	adds r0, 0x10
_080E0094:
	strh r0, [r4, 0x22]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	movs r6, 0xEC
_080E00A0:
	movs r0, 0x20
	strh r0, [r4, 0x2E]
	lsls r0, r6, 24
	asrs r0, 24
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	adds r0, 0xC
	strh r0, [r4, 0x36]
	ldr r0, _080E00C8 @ =0x0000fff4
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_80786EC
	ldr r0, _080E00CC @ =sub_80E00D0
	str r0, [r4, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E00C8: .4byte 0x0000fff4
_080E00CC: .4byte sub_80E00D0
	thumb_func_end sub_80DFFD0

	thumb_func_start sub_80E00D0
sub_80E00D0: @ 80E00D0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080E00E4
	adds r0, r4, 0
	bl move_anim_8074EE0
_080E00E4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E00D0

	thumb_func_start sub_80E00EC
sub_80E00EC: @ 80E00EC
	push {r4-r7,lr}
	sub sp, 0x18
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080E0150 @ =gTasks
	adds r5, r1, r0
	ldr r4, _080E0154 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1F
	movs r6, 0
	strh r0, [r5, 0x16]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_807A100
	subs r0, 0x7
	strh r0, [r5, 0x14]
	ldrh r1, [r5, 0x16]
	strh r1, [r5, 0x12]
	strh r0, [r5, 0x10]
	subs r1, r0
	lsls r1, 8
	strh r1, [r5, 0x22]
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	subs r1, 0x20
	strh r1, [r5, 0x24]
	adds r0, 0x20
	strh r0, [r5, 0x26]
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080E015C
	ldr r0, _080E0158 @ =0x0000fff4
	b _080E015E
	.align 2, 0
_080E0150: .4byte gTasks
_080E0154: .4byte gBattleAnimBankAttacker
_080E0158: .4byte 0x0000fff4
_080E015C:
	ldr r0, _080E01A8 @ =0x0000ffc0
_080E015E:
	strh r0, [r5, 0x18]
	ldr r0, _080E01AC @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankIdentity_permutated
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xE]
	cmp r0, 0x1
	bne _080E01C4
	add r4, sp, 0xC
	adds r0, r4, 0
	bl sub_8078914
	ldr r0, _080E01B0 @ =gUnknown_030041B4
	ldrh r0, [r0]
	strh r0, [r5, 0x1C]
	ldr r1, _080E01B4 @ =REG_BLDCNT
	ldr r2, _080E01B8 @ =0x00003f42
	adds r0, r2, 0
	strh r0, [r1]
	ldrb r1, [r4, 0x8]
	lsls r1, 4
	movs r0, 0
	movs r2, 0x20
	bl FillPalette
	ldr r0, _080E01BC @ =REG_BG1VOFS
	str r0, [sp]
	movs r7, 0x2
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080E01F4
	ldr r1, _080E01C0 @ =gUnknown_03004288
	b _080E01EE
	.align 2, 0
_080E01A8: .4byte 0x0000ffc0
_080E01AC: .4byte gBattleAnimBankAttacker
_080E01B0: .4byte gUnknown_030041B4
_080E01B4: .4byte REG_BLDCNT
_080E01B8: .4byte 0x00003f42
_080E01BC: .4byte REG_BG1VOFS
_080E01C0: .4byte gUnknown_03004288
_080E01C4:
	ldr r0, _080E0278 @ =gUnknown_03004280
	ldrh r0, [r0]
	strh r0, [r5, 0x1C]
	ldr r1, _080E027C @ =REG_BLDCNT
	ldr r2, _080E0280 @ =0x00003f44
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0
	movs r1, 0x90
	movs r2, 0x20
	bl FillPalette
	ldr r0, _080E0284 @ =REG_BG2VOFS
	str r0, [sp]
	movs r7, 0x4
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080E01F4
	ldr r1, _080E0288 @ =gUnknown_030042C0
_080E01EE:
	ldrh r0, [r1]
	adds r0, 0xF0
	strh r0, [r1]
_080E01F4:
	ldr r0, _080E028C @ =0xa2600001
	str r0, [sp, 0x4]
	mov r2, sp
	movs r1, 0
	movs r0, 0x1
	strb r0, [r2, 0x8]
	mov r0, sp
	strb r1, [r0, 0x9]
	strh r1, [r5, 0x1E]
	movs r0, 0x10
	strh r0, [r5, 0x20]
	strh r1, [r5, 0x8]
	strh r1, [r5, 0xA]
	strh r1, [r5, 0xC]
	movs r0, 0x3
	bl sub_80E08CC
	movs r3, 0
	ldr r4, _080E0290 @ =gUnknown_03004DE0
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r4, r0
_080E0220:
	lsls r1, r3, 1
	adds r2, r1, r4
	ldrh r0, [r5, 0x1C]
	strh r0, [r2]
	adds r1, r6
	ldrh r0, [r5, 0x1C]
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x6F
	bls _080E0220
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl sub_80895F8
	ldr r1, _080E0294 @ =REG_WINOUT
	movs r0, 0x3F
	eors r7, r0
	movs r2, 0xFC
	lsls r2, 6
	adds r0, r2, 0
	orrs r7, r0
	strh r7, [r1]
	subs r1, 0x2
	adds r2, 0x3F
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _080E0298 @ =gUnknown_030042C4
	ldrh r0, [r5, 0x24]
	lsls r0, 8
	ldrh r1, [r5, 0x26]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080E029C @ =gUnknown_03004240
	movs r0, 0xA0
	strh r0, [r1]
	ldr r0, _080E02A0 @ =sub_80E02A4
	str r0, [r5]
	add sp, 0x18
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E0278: .4byte gUnknown_03004280
_080E027C: .4byte REG_BLDCNT
_080E0280: .4byte 0x00003f44
_080E0284: .4byte REG_BG2VOFS
_080E0288: .4byte gUnknown_030042C0
_080E028C: .4byte 0xa2600001
_080E0290: .4byte gUnknown_03004DE0
_080E0294: .4byte REG_WINOUT
_080E0298: .4byte gUnknown_030042C4
_080E029C: .4byte gUnknown_03004240
_080E02A0: .4byte sub_80E02A4
	thumb_func_end sub_80E00EC

	thumb_func_start sub_80E02A4
sub_80E02A4: @ 80E02A4
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080E02C8 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _080E02BE
	b _080E03B6
_080E02BE:
	lsls r0, 2
	ldr r1, _080E02CC @ =_080E02D0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E02C8: .4byte gTasks
_080E02CC: .4byte _080E02D0
	.align 2, 0
_080E02D0:
	.4byte _080E02E4
	.4byte _080E0344
	.4byte _080E035E
	.4byte _080E039C
	.4byte _080E03B0
_080E02E4:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080E03B6
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080E0314
	ldrh r1, [r4, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r4, r2]
	cmp r0, 0xC
	beq _080E0322
	adds r0, r1, 0x1
	strh r0, [r4, 0x1E]
	b _080E0322
_080E0314:
	ldrh r1, [r4, 0x20]
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0x8
	beq _080E0322
	subs r0, r1, 0x1
	strh r0, [r4, 0x20]
_080E0322:
	ldr r2, _080E0340 @ =REG_BLDALPHA
	ldrh r0, [r4, 0x20]
	lsls r0, 8
	ldrh r1, [r4, 0x1E]
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0x1E
	ldrsh r0, [r4, r1]
	cmp r0, 0xC
	bne _080E03B6
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0x8
	bne _080E03B6
	b _080E03A2
	.align 2, 0
_080E0340: .4byte REG_BLDALPHA
_080E0344:
	ldrh r0, [r4, 0x10]
	subs r0, 0x8
	strh r0, [r4, 0x10]
	adds r0, r4, 0
	bl sub_80E079C
	movs r0, 0x10
	ldrsh r1, [r4, r0]
	movs r2, 0x18
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bge _080E03B6
	b _080E03A2
_080E035E:
	ldrh r0, [r4, 0x10]
	subs r0, 0x8
	strh r0, [r4, 0x10]
	adds r0, r4, 0
	bl sub_80E079C
	ldrh r1, [r4, 0x24]
	adds r1, 0x4
	strh r1, [r4, 0x24]
	ldrh r0, [r4, 0x26]
	subs r2, r0, 0x4
	strh r2, [r4, 0x26]
	lsls r1, 16
	lsls r0, r2, 16
	cmp r1, r0
	blt _080E0380
	strh r2, [r4, 0x24]
_080E0380:
	ldr r3, _080E0398 @ =gUnknown_030042C4
	ldrh r2, [r4, 0x24]
	lsls r0, r2, 8
	ldrh r1, [r4, 0x26]
	orrs r0, r1
	strh r0, [r3]
	lsls r2, 16
	lsls r1, 16
	cmp r2, r1
	bne _080E03B6
	b _080E03A2
	.align 2, 0
_080E0398: .4byte gUnknown_030042C4
_080E039C:
	ldr r1, _080E03AC @ =gUnknown_03004DC0
	movs r0, 0x3
	strb r0, [r1, 0x15]
_080E03A2:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080E03B6
	.align 2, 0
_080E03AC: .4byte gUnknown_03004DC0
_080E03B0:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080E03B6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E02A4

	thumb_func_start sub_80E03BC
sub_80E03BC: @ 80E03BC
	push {r4-r7,lr}
	sub sp, 0x18
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080E03E4 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x4
	bls _080E03D8
	b _080E05F2
_080E03D8:
	lsls r0, 2
	ldr r1, _080E03E8 @ =_080E03EC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E03E4: .4byte gTasks
_080E03E8: .4byte _080E03EC
	.align 2, 0
_080E03EC:
	.4byte _080E0400
	.4byte _080E048C
	.4byte _080E04D0
	.4byte _080E053C
	.4byte _080E05A4
_080E0400:
	bl NotInBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080E043C
	ldr r0, _080E042C @ =gUnknown_030042C4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080E0430 @ =gUnknown_03004240
	strh r1, [r0]
	ldr r0, _080E0434 @ =REG_WININ
	ldr r2, _080E0438 @ =0x00003f3f
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	b _080E05F2
	.align 2, 0
_080E042C: .4byte gUnknown_030042C4
_080E0430: .4byte gUnknown_03004240
_080E0434: .4byte REG_WININ
_080E0438: .4byte 0x00003f3f
_080E043C:
	ldr r0, _080E045C @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	bl GetBankIdentity_permutated
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xE]
	cmp r0, 0x1
	bne _080E046C
	ldr r1, _080E0460 @ =REG_BLDCNT
	ldr r2, _080E0464 @ =0x00003f42
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _080E0468 @ =gUnknown_03004288
	b _080E0476
	.align 2, 0
_080E045C: .4byte gBattleAnimBankTarget
_080E0460: .4byte REG_BLDCNT
_080E0464: .4byte 0x00003f42
_080E0468: .4byte gUnknown_03004288
_080E046C:
	ldr r1, _080E0480 @ =REG_BLDCNT
	ldr r2, _080E0484 @ =0x00003f44
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _080E0488 @ =gUnknown_030042C0
_080E0476:
	ldrh r0, [r1]
	adds r0, 0xF0
	strh r0, [r1]
	b _080E0590
	.align 2, 0
_080E0480: .4byte REG_BLDCNT
_080E0484: .4byte 0x00003f44
_080E0488: .4byte gUnknown_030042C0
_080E048C:
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _080E04B4
	mov r0, sp
	bl sub_8078914
	ldr r0, _080E04B0 @ =gUnknown_030041B4
	ldrh r0, [r0]
	strh r0, [r5, 0x1C]
	mov r0, sp
	ldrb r1, [r0, 0x8]
	lsls r1, 4
	movs r0, 0
	movs r2, 0x20
	bl FillPalette
	b _080E04C4
	.align 2, 0
_080E04B0: .4byte gUnknown_030041B4
_080E04B4:
	ldr r0, _080E04CC @ =gUnknown_03004280
	ldrh r0, [r0]
	strh r0, [r5, 0x1C]
	movs r0, 0
	movs r1, 0x90
	movs r2, 0x20
	bl FillPalette
_080E04C4:
	movs r0, 0x3
	bl sub_80E08CC
	b _080E0590
	.align 2, 0
_080E04CC: .4byte gUnknown_03004280
_080E04D0:
	ldr r4, _080E051C @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1F
	movs r6, 0
	strh r0, [r5, 0x16]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_807A100
	subs r0, 0x7
	strh r0, [r5, 0x14]
	ldrh r1, [r5, 0x16]
	subs r1, r0
	lsls r1, 8
	strh r1, [r5, 0x22]
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	subs r1, r0, 0x4
	strh r1, [r5, 0x24]
	adds r0, 0x4
	strh r0, [r5, 0x26]
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080E0524
	ldr r0, _080E0520 @ =0x0000fff4
	b _080E0526
	.align 2, 0
_080E051C: .4byte gBattleAnimBankTarget
_080E0520: .4byte 0x0000fff4
_080E0524:
	ldr r0, _080E0538 @ =0x0000ffc0
_080E0526:
	strh r0, [r5, 0x18]
	ldrh r0, [r5, 0x18]
	strh r0, [r5, 0x10]
	strh r0, [r5, 0x12]
	movs r0, 0xC
	strh r0, [r5, 0x1E]
	movs r0, 0x8
	strh r0, [r5, 0x20]
	b _080E0590
	.align 2, 0
_080E0538: .4byte 0x0000ffc0
_080E053C:
	movs r2, 0xE
	ldrsh r0, [r5, r2]
	cmp r0, 0x1
	bne _080E054C
	ldr r0, _080E0548 @ =REG_BG1VOFS
	b _080E054E
	.align 2, 0
_080E0548: .4byte REG_BG1VOFS
_080E054C:
	ldr r0, _080E0598 @ =REG_BG2VOFS
_080E054E:
	str r0, [sp, 0xC]
	movs r3, 0
	add r4, sp, 0xC
	ldr r6, _080E059C @ =gUnknown_03004DE0
	movs r0, 0xF0
	lsls r0, 3
	adds r7, r6, r0
_080E055C:
	lsls r1, r3, 1
	adds r2, r1, r6
	ldrh r0, [r5, 0x1C]
	adds r0, 0x9F
	subs r0, r3
	strh r0, [r2]
	adds r1, r7
	ldrh r0, [r5, 0x1C]
	adds r0, 0x9F
	subs r0, r3
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x6F
	bls _080E055C
	ldr r1, _080E05A0 @ =0xa2600001
	str r1, [r4, 0x4]
	movs r2, 0
	movs r0, 0x1
	strb r0, [r4, 0x8]
	strb r2, [r4, 0x9]
	ldr r0, [sp, 0xC]
	ldr r2, [r4, 0x8]
	bl sub_80895F8
_080E0590:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080E05F2
	.align 2, 0
_080E0598: .4byte REG_BG2VOFS
_080E059C: .4byte gUnknown_03004DE0
_080E05A0: .4byte 0xa2600001
_080E05A4:
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _080E05BC
	ldr r1, _080E05B4 @ =REG_WINOUT
	ldr r2, _080E05B8 @ =0x00003f3d
	b _080E05C0
	.align 2, 0
_080E05B4: .4byte REG_WINOUT
_080E05B8: .4byte 0x00003f3d
_080E05BC:
	ldr r1, _080E05FC @ =REG_WINOUT
	ldr r2, _080E0600 @ =0x00003f3b
_080E05C0:
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _080E0604 @ =REG_WININ
	ldr r2, _080E0608 @ =0x00003f3f
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _080E060C @ =gUnknown_030042C4
	ldrh r0, [r5, 0x24]
	lsls r0, 8
	ldrh r1, [r5, 0x26]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080E0610 @ =gUnknown_03004240
	movs r0, 0xA0
	strh r0, [r1]
	movs r0, 0
	strh r0, [r5, 0x8]
	strh r0, [r5, 0xA]
	strh r0, [r5, 0xC]
	ldr r1, _080E0614 @ =REG_BLDALPHA
	ldr r2, _080E0618 @ =0x0000080c
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080E061C @ =sub_80E0620
	str r0, [r5]
_080E05F2:
	add sp, 0x18
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E05FC: .4byte REG_WINOUT
_080E0600: .4byte 0x00003f3b
_080E0604: .4byte REG_WININ
_080E0608: .4byte 0x00003f3f
_080E060C: .4byte gUnknown_030042C4
_080E0610: .4byte gUnknown_03004240
_080E0614: .4byte REG_BLDALPHA
_080E0618: .4byte 0x0000080c
_080E061C: .4byte sub_80E0620
	thumb_func_end sub_80E03BC

	thumb_func_start sub_80E0620
sub_80E0620: @ 80E0620
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080E0644 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _080E063A
	b _080E0784
_080E063A:
	lsls r0, 2
	ldr r1, _080E0648 @ =_080E064C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E0644: .4byte gTasks
_080E0648: .4byte _080E064C
	.align 2, 0
_080E064C:
	.4byte _080E0660
	.4byte _080E068C
	.4byte _080E06F4
	.4byte _080E0754
	.4byte _080E0768
_080E0660:
	ldrh r0, [r4, 0x12]
	adds r0, 0x8
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	ldrh r2, [r4, 0x16]
	movs r3, 0x16
	ldrsh r1, [r4, r3]
	cmp r0, r1
	blt _080E0676
	strh r2, [r4, 0x12]
_080E0676:
	adds r0, r4, 0
	bl sub_80E079C
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	cmp r1, r0
	beq _080E068A
	b _080E0784
_080E068A:
	b _080E075A
_080E068C:
	movs r3, 0x26
	ldrsh r0, [r4, r3]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	subs r0, r1
	cmp r0, 0x3F
	bgt _080E06A8
	ldrh r0, [r4, 0x24]
	subs r0, 0x4
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x26]
	adds r0, 0x4
	strh r0, [r4, 0x26]
	b _080E06AC
_080E06A8:
	movs r0, 0x1
	strh r0, [r4, 0xA]
_080E06AC:
	ldr r2, _080E06F0 @ =gUnknown_030042C4
	ldrh r0, [r4, 0x24]
	lsls r0, 8
	ldrh r1, [r4, 0x26]
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r4, 0x10]
	adds r0, 0x8
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	ldrh r2, [r4, 0x14]
	movs r3, 0x14
	ldrsh r1, [r4, r3]
	cmp r0, r1
	blt _080E06CE
	strh r2, [r4, 0x10]
_080E06CE:
	adds r0, r4, 0
	bl sub_80E079C
	movs r0, 0x10
	ldrsh r1, [r4, r0]
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080E0784
	movs r3, 0xA
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _080E0784
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080E075A
	.align 2, 0
_080E06F0: .4byte gUnknown_030042C4
_080E06F4:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080E0784
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080E0724
	ldrh r1, [r4, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080E0732
	subs r0, r1, 0x1
	strh r0, [r4, 0x1E]
	b _080E0732
_080E0724:
	ldrh r1, [r4, 0x20]
	movs r3, 0x20
	ldrsh r0, [r4, r3]
	cmp r0, 0xF
	bgt _080E0732
	adds r0, r1, 0x1
	strh r0, [r4, 0x20]
_080E0732:
	ldr r2, _080E0750 @ =REG_BLDALPHA
	ldrh r0, [r4, 0x20]
	lsls r0, 8
	ldrh r1, [r4, 0x1E]
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0x1E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E0784
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0x10
	bne _080E0784
	b _080E075A
	.align 2, 0
_080E0750: .4byte REG_BLDALPHA
_080E0754:
	ldr r1, _080E0764 @ =gUnknown_03004DC0
	movs r0, 0x3
	strb r0, [r1, 0x15]
_080E075A:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080E0784
	.align 2, 0
_080E0764: .4byte gUnknown_03004DC0
_080E0768:
	ldr r0, _080E078C @ =gUnknown_030042C4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080E0790 @ =gUnknown_03004240
	strh r1, [r0]
	ldr r0, _080E0794 @ =REG_WININ
	ldr r3, _080E0798 @ =0x00003f3f
	adds r1, r3, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080E0784:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E078C: .4byte gUnknown_030042C4
_080E0790: .4byte gUnknown_03004240
_080E0794: .4byte REG_WININ
_080E0798: .4byte 0x00003f3f
	thumb_func_end sub_80E0620

	thumb_func_start sub_80E079C
sub_80E079C: @ 80E079C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	ldrh r0, [r6, 0x12]
	ldrh r4, [r6, 0x10]
	subs r0, r4
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0
	beq _080E0890
	movs r2, 0x22
	ldrsh r0, [r6, r2]
	bl __divsi3
	mov r8, r0
	movs r3, 0x14
	ldrsh r0, [r6, r3]
	lsls r5, r0, 8
	lsls r0, r4, 16
	movs r4, 0
	cmp r0, 0
	ble _080E07FC
	ldr r0, _080E0888 @ =gUnknown_03004DE0
	mov r12, r0
	ldr r7, _080E088C @ =gUnknown_03004DC0
_080E07D0:
	lsls r2, r4, 16
	asrs r2, 16
	lsls r3, r2, 1
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r3, r0
	add r3, r12
	adds r1, r2, 0
	subs r1, 0x9F
	ldrh r0, [r6, 0x1C]
	subs r0, r1
	strh r0, [r3]
	adds r2, 0x1
	lsls r2, 16
	lsrs r4, r2, 16
	asrs r2, 16
	movs r1, 0x10
	ldrsh r0, [r6, r1]
	cmp r2, r0
	blt _080E07D0
_080E07FC:
	ldrh r4, [r6, 0x10]
	lsls r3, r4, 16
	asrs r1, r3, 16
	movs r2, 0x12
	ldrsh r0, [r6, r2]
	cmp r1, r0
	bgt _080E0846
	ldr r0, _080E0888 @ =gUnknown_03004DE0
	mov r12, r0
	ldr r7, _080E088C @ =gUnknown_03004DC0
_080E0810:
	asrs r4, r3, 16
	cmp r4, 0
	blt _080E0832
	asrs r1, r5, 8
	subs r1, r4
	lsls r3, r4, 1
	ldrb r2, [r7, 0x14]
	lsls r0, r2, 4
	subs r0, r2
	lsls r0, 7
	adds r3, r0
	add r3, r12
	lsls r1, 16
	asrs r1, 16
	ldrh r2, [r6, 0x1C]
	adds r1, r2
	strh r1, [r3]
_080E0832:
	add r5, r8
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r3, r4, 16
	asrs r1, r3, 16
	movs r2, 0x12
	ldrsh r0, [r6, r2]
	cmp r1, r0
	ble _080E0810
_080E0846:
	movs r3, 0x1C
	ldrsh r0, [r6, r3]
	adds r0, 0x9F
	lsls r2, r4, 16
	asrs r1, r2, 16
	subs r5, r0, r1
	movs r3, 0x16
	ldrsh r0, [r6, r3]
	cmp r1, r0
	bge _080E08BE
	ldr r7, _080E0888 @ =gUnknown_03004DE0
	ldr r4, _080E088C @ =gUnknown_03004DC0
_080E085E:
	asrs r3, r2, 16
	cmp r3, 0
	blt _080E0876
	lsls r2, r3, 1
	ldrb r1, [r4, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r7
	strh r5, [r2]
	subs r5, 0x1
_080E0876:
	adds r0, r3, 0x1
	lsls r2, r0, 16
	asrs r1, r2, 16
	movs r3, 0x16
	ldrsh r0, [r6, r3]
	cmp r1, r0
	blt _080E085E
	b _080E08BE
	.align 2, 0
_080E0888: .4byte gUnknown_03004DE0
_080E088C: .4byte gUnknown_03004DC0
_080E0890:
	movs r1, 0x1C
	ldrsh r0, [r6, r1]
	adds r5, r0, 0
	adds r5, 0x9F
	movs r4, 0
	ldr r3, _080E08C8 @ =gUnknown_03004DE0
	movs r2, 0xF0
	lsls r2, 3
	adds r6, r3, r2
_080E08A2:
	lsls r0, r4, 16
	asrs r0, 16
	lsls r2, r0, 1
	adds r1, r2, r3
	strh r5, [r1]
	adds r2, r6
	strh r5, [r2]
	subs r5, 0x1
	adds r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x6F
	ble _080E08A2
_080E08BE:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E08C8: .4byte gUnknown_03004DE0
	thumb_func_end sub_80E079C

	thumb_func_start sub_80E08CC
sub_80E08CC: @ 80E08CC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0
	ldr r7, _080E0914 @ =gSprites
	movs r1, 0x3
	ands r0, r1
	lsls r5, r0, 2
	movs r0, 0xD
	negs r0, r0
	adds r6, r0, 0
_080E08E2:
	lsls r0, r4, 24
	lsrs r0, 24
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080E0902
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	ldrb r0, [r1, 0x5]
	ands r0, r6
	orrs r0, r5
	strb r0, [r1, 0x5]
_080E0902:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _080E08E2
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E0914: .4byte gSprites
	thumb_func_end sub_80E08CC

	thumb_func_start sub_80E0918
sub_80E0918: @ 80E0918
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r6, _080E09B8 @ =gBattleAnimBankAttacker
	ldrb r0, [r6]
	bl GetBankIdentity_permutated
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	eors r0, r1
	negs r1, r0
	orrs r1, r0
	lsrs r4, r1, 31
	ldrb r0, [r6]
	adds r1, r4, 0
	bl sub_8076034
	ldr r0, _080E09BC @ =gSprites
	mov r9, r0
	ldr r0, _080E09C0 @ =gObjectBankIDs
	mov r8, r0
	ldrb r0, [r6]
	add r0, r8
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r9
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r7, 0x5
	negs r7, r7
	adds r0, r7, 0
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r6]
	movs r5, 0x2
	eors r0, r5
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080E09A2
	ldrb r0, [r6]
	eors r0, r5
	movs r1, 0x1
	eors r4, r1
	adds r1, r4, 0
	bl sub_8076034
	ldrb r0, [r6]
	eors r0, r5
	add r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	adds r0, 0x3E
	ldrb r2, [r0]
	adds r1, r7, 0
	ands r1, r2
	strb r1, [r0]
_080E09A2:
	mov r0, r10
	bl DestroyAnimVisualTask
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E09B8: .4byte gBattleAnimBankAttacker
_080E09BC: .4byte gSprites
_080E09C0: .4byte gObjectBankIDs
	thumb_func_end sub_80E0918

	thumb_func_start sub_80E09C4
sub_80E09C4: @ 80E09C4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r4, _080E0A0C @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	bl GetBankIdentity_permutated
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	eors r0, r1
	negs r1, r0
	orrs r1, r0
	lsrs r5, r1, 31
	adds r0, r5, 0
	bl sub_8076464
	ldrb r1, [r4]
	movs r0, 0x2
	eors r0, r1
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080E0A00
	movs r0, 0x1
	eors r5, r0
	adds r0, r5, 0
	bl sub_8076464
_080E0A00:
	adds r0, r6, 0
	bl DestroyAnimVisualTask
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E0A0C: .4byte gBattleAnimBankAttacker
	thumb_func_end sub_80E09C4

	thumb_func_start sub_80E0A10
sub_80E0A10: @ 80E0A10
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080E0A40 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrb r1, [r1, 0x4]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _080E0A44 @ =sub_8078600
	str r0, [r4, 0x1C]
	ldr r1, _080E0A48 @ =move_anim_8072740
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E0A40: .4byte gBattleAnimArgs
_080E0A44: .4byte sub_8078600
_080E0A48: .4byte move_anim_8072740
	thumb_func_end sub_80E0A10

	thumb_func_start sub_80E0A4C
sub_80E0A4C: @ 80E0A4C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r7, 0
	ldr r0, _080E0B50 @ =gUnknown_030042C4
	strh r7, [r0]
	ldr r0, _080E0B54 @ =gUnknown_03004240
	strh r7, [r0]
	ldr r1, _080E0B58 @ =REG_WININ
	ldr r2, _080E0B5C @ =0x00003f3f
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _080E0B60 @ =0x00003f3d
	adds r0, r3, 0
	strh r0, [r1]
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080E0B64 @ =REG_BLDCNT
	ldr r2, _080E0B68 @ =0x00003f42
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _080E0B6C @ =0x00000c08
	adds r0, r3, 0
	strh r0, [r1]
	ldr r5, _080E0B70 @ =REG_BG1CNT
	ldrb r1, [r5]
	movs r0, 0x4
	negs r0, r0
	mov r8, r0
	ands r0, r1
	strb r0, [r5]
	ldrb r1, [r5, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r5, 0x1]
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080E0AC4
	ldrb r0, [r5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r5]
_080E0AC4:
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _080E0B40
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080E0B40
	ldr r4, _080E0B74 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _080E0AF4
	ldrb r0, [r4]
	bl GetBankIdentity
	lsls r0, 24
	cmp r0, 0
	bne _080E0B40
_080E0AF4:
	ldrb r0, [r4]
	movs r6, 0x2
	eors r0, r6
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080E0B40
	ldr r3, _080E0B78 @ =gSprites
	ldr r1, _080E0B7C @ =gObjectBankIDs
	ldrb r0, [r4]
	eors r0, r6
	adds r0, r1
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldrb r3, [r2, 0x5]
	lsls r1, r3, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldrb r1, [r5]
	mov r0, r8
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r5]
	movs r7, 0x1
_080E0B40:
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080E0B84
	ldr r0, _080E0B80 @ =gSharedMem + 0x19348
	ldrh r5, [r0]
	b _080E0BCC
	.align 2, 0
_080E0B50: .4byte gUnknown_030042C4
_080E0B54: .4byte gUnknown_03004240
_080E0B58: .4byte REG_WININ
_080E0B5C: .4byte 0x00003f3f
_080E0B60: .4byte 0x00003f3d
_080E0B64: .4byte REG_BLDCNT
_080E0B68: .4byte 0x00003f42
_080E0B6C: .4byte 0x00000c08
_080E0B70: .4byte REG_BG1CNT
_080E0B74: .4byte gBattleAnimBankAttacker
_080E0B78: .4byte gSprites
_080E0B7C: .4byte gObjectBankIDs
_080E0B80: .4byte gSharedMem + 0x19348
_080E0B84:
	ldr r4, _080E0BA4 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080E0BB0
	ldr r1, _080E0BA8 @ =gBattlePartyID
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080E0BAC @ =gEnemyParty
	b _080E0BC0
	.align 2, 0
_080E0BA4: .4byte gBattleAnimBankAttacker
_080E0BA8: .4byte gBattlePartyID
_080E0BAC: .4byte gEnemyParty
_080E0BB0:
	ldr r1, _080E0C58 @ =gBattlePartyID
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080E0C5C @ =gPlayerParty
_080E0BC0:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
_080E0BCC:
	movs r0, 0
	bl GetAnimBankSpriteId
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080E0C60 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_807A4A0
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, sp
	bl sub_8078914
	ldr r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0xC]
	ldr r2, _080E0C64 @ =0x040000d4
	add r0, sp, 0xC
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _080E0C68 @ =0x85000400
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _080E0C6C @ =gUnknown_08D1D574
	bl LZDecompressVram
	ldr r0, _080E0C70 @ =gUnknown_08D1D410
	ldr r1, [sp]
	bl LZDecompressVram
	ldr r0, _080E0C74 @ =gUnknown_08D1D54C
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r2, _080E0C78 @ =gUnknown_030042C0
	ldr r0, _080E0C7C @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x20]
	negs r0, r0
	adds r0, 0x60
	strh r0, [r2]
	ldr r2, _080E0C80 @ =gUnknown_030041B4
	ldrh r0, [r1, 0x22]
	negs r0, r0
	adds r0, 0x20
	strh r0, [r2]
	ldrb r0, [r1, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	adds r1, r0, 0
	ldr r2, _080E0C84 @ =gBattleAnimArgs
	movs r3, 0x2
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _080E0C88
	adds r0, r1, 0
	movs r1, 0
	bl sub_8079108
	b _080E0C94
	.align 2, 0
_080E0C58: .4byte gBattlePartyID
_080E0C5C: .4byte gPlayerParty
_080E0C60: .4byte gBattleAnimBankAttacker
_080E0C64: .4byte 0x040000d4
_080E0C68: .4byte 0x85000400
_080E0C6C: .4byte gUnknown_08D1D574
_080E0C70: .4byte gUnknown_08D1D410
_080E0C74: .4byte gUnknown_08D1D54C
_080E0C78: .4byte gUnknown_030042C0
_080E0C7C: .4byte gSprites
_080E0C80: .4byte gUnknown_030041B4
_080E0C84: .4byte gBattleAnimArgs
_080E0C88:
	lsls r0, r1, 4
	ldrh r3, [r2, 0x4]
	movs r1, 0x10
	movs r2, 0xB
	bl BlendPalette
_080E0C94:
	ldr r1, _080E0CC4 @ =gTasks
	mov r2, r9
	lsls r0, r2, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x8]
	ldr r2, _080E0CC8 @ =gBattleAnimArgs
	ldrh r1, [r2]
	strh r1, [r0, 0xA]
	ldrh r1, [r2, 0x2]
	strh r1, [r0, 0xC]
	ldrh r1, [r2, 0x4]
	strh r1, [r0, 0xE]
	strh r7, [r0, 0x14]
	ldr r1, _080E0CCC @ =sub_80E0CD0
	str r1, [r0]
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E0CC4: .4byte gTasks
_080E0CC8: .4byte gBattleAnimArgs
_080E0CCC: .4byte sub_80E0CD0
	thumb_func_end sub_80E0A4C

	thumb_func_start sub_80E0CD0
sub_80E0CD0: @ 80E0CD0
	push {r4-r7,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _080E0DF0 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x1C]
	adds r0, 0x4
	movs r5, 0
	strh r0, [r4, 0x1C]
	ldr r2, _080E0DF4 @ =gUnknown_030042C0
	ldrh r3, [r2]
	subs r1, r3, 0x4
	strh r1, [r2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x80
	bne _080E0DE8
	strh r5, [r4, 0x1C]
	adds r0, r3, 0
	adds r0, 0x7C
	strh r0, [r2]
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _080E0DE8
	movs r0, 0
	bl sub_8076464
	ldr r0, _080E0DF8 @ =gUnknown_030042C4
	strh r5, [r0]
	ldr r0, _080E0DFC @ =gUnknown_03004240
	strh r5, [r0]
	ldr r0, _080E0E00 @ =REG_WININ
	ldr r2, _080E0E04 @ =0x00003f3f
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080E0D40
	ldr r2, _080E0E08 @ =REG_BG1CNT
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080E0D40:
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	eors r0, r1
	strh r0, [r2]
	ldr r0, _080E0E0C @ =REG_BLDCNT
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _080E0E10 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r0, [r1, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	adds r1, r0, 0
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080E0D84
	adds r0, r1, 0
	movs r1, 0x1
	bl sub_8079108
_080E0D84:
	movs r3, 0x8
	ldrsh r1, [r4, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl DestroySprite
	mov r0, sp
	bl sub_8078914
	ldr r2, [sp, 0x4]
	str r5, [sp, 0xC]
	ldr r1, _080E0E14 @ =0x040000d4
	add r0, sp, 0xC
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _080E0E18 @ =0x85000200
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080E0DE2
	ldr r2, _080E0E1C @ =gObjectBankIDs
	ldr r0, _080E0E20 @ =gBattleAnimBankAttacker
	ldrb r1, [r0]
	movs r0, 0x2
	eors r0, r1
	adds r0, r2
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r6
	ldrb r3, [r2, 0x5]
	lsls r1, r3, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
_080E0DE2:
	adds r0, r7, 0
	bl DestroyAnimVisualTask
_080E0DE8:
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E0DF0: .4byte gTasks
_080E0DF4: .4byte gUnknown_030042C0
_080E0DF8: .4byte gUnknown_030042C4
_080E0DFC: .4byte gUnknown_03004240
_080E0E00: .4byte REG_WININ
_080E0E04: .4byte 0x00003f3f
_080E0E08: .4byte REG_BG1CNT
_080E0E0C: .4byte REG_BLDCNT
_080E0E10: .4byte gSprites
_080E0E14: .4byte 0x040000d4
_080E0E18: .4byte 0x85000200
_080E0E1C: .4byte gObjectBankIDs
_080E0E20: .4byte gBattleAnimBankAttacker
	thumb_func_end sub_80E0CD0

	thumb_func_start sub_80E0E24
sub_80E0E24: @ 80E0E24
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _080E0E44 @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r2, r0, 0
	cmp r1, 0x7
	bhi _080E0E88
	lsls r0, r1, 2
	ldr r1, _080E0E48 @ =_080E0E4C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E0E44: .4byte gBattleAnimArgs
_080E0E48: .4byte _080E0E4C
	.align 2, 0
_080E0E4C:
	.4byte _080E0E6C
	.4byte _080E0E6C
	.4byte _080E0E6C
	.4byte _080E0E6C
	.4byte _080E0E78
	.4byte _080E0E7C
	.4byte _080E0E80
	.4byte _080E0E84
_080E0E6C:
	ldrb r0, [r2]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r2, r0, 24
	b _080E0E8A
_080E0E78:
	movs r4, 0
	b _080E0E90
_080E0E7C:
	movs r4, 0x2
	b _080E0E90
_080E0E80:
	movs r4, 0x1
	b _080E0E90
_080E0E84:
	movs r4, 0x3
	b _080E0E90
_080E0E88:
	movs r2, 0xFF
_080E0E8A:
	movs r0, 0
	cmp r0, 0
	beq _080E0EB6
_080E0E90:
	adds r0, r4, 0
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080E0EB4
	ldr r0, _080E0EB0 @ =gObjectBankIDs
	adds r0, r4, r0
	ldrb r2, [r0]
	b _080E0EB6
	.align 2, 0
_080E0EB0: .4byte gObjectBankIDs
_080E0EB4:
	movs r2, 0xFF
_080E0EB6:
	cmp r2, 0xFF
	beq _080E0ED2
	ldr r1, _080E0EE0 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	ldr r1, _080E0EE4 @ =gBattleAnimArgs
	ldrb r1, [r1, 0x2]
	bl sub_8079108
_080E0ED2:
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E0EE0: .4byte gSprites
_080E0EE4: .4byte gBattleAnimArgs
	thumb_func_end sub_80E0E24

	thumb_func_start sub_80E0EE8
sub_80E0EE8: @ 80E0EE8
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _080E0F14 @ =gUnknown_0202F7C4
	ldrb r0, [r2]
	cmp r0, 0x1
	bhi _080E0EFC
	ldr r1, _080E0F18 @ =gBattleAnimArgs
	movs r0, 0
	strh r0, [r1, 0xE]
_080E0EFC:
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _080E0F08
	ldr r1, _080E0F18 @ =gBattleAnimArgs
	movs r0, 0x1
	strh r0, [r1, 0xE]
_080E0F08:
	adds r0, r3, 0
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080E0F14: .4byte gUnknown_0202F7C4
_080E0F18: .4byte gBattleAnimArgs
	thumb_func_end sub_80E0EE8

	thumb_func_start sub_80E0F1C
sub_80E0F1C: @ 80E0F1C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080E0F74 @ =gBattleAnimBankAttacker
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	movs r0, 0x14
	strh r0, [r4, 0x2E]
	ldr r5, _080E0F78 @ =gBattleAnimBankTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
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
_080E0F74: .4byte gBattleAnimBankAttacker
_080E0F78: .4byte gBattleAnimBankTarget
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
	ldr r4, _080E0FE0 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
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
_080E0FE0: .4byte gBattleAnimBankAttacker
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
	bl move_anim_8072740
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
	ldr r0, _080E1064 @ =gBattleAnimBankAttacker
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
	ldr r5, _080E106C @ =gBattleAnimBankTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x6]
	adds r0, r4
	strh r0, [r6, 0x36]
	ldr r0, _080E1070 @ =sub_8078B34
	str r0, [r6, 0x1C]
	ldr r1, _080E1074 @ =move_anim_8072740
	adds r0, r6, 0
	bl StoreSpriteCallbackInData
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E1064: .4byte gBattleAnimBankAttacker
_080E1068: .4byte gBattleAnimArgs
_080E106C: .4byte gBattleAnimBankTarget
_080E1070: .4byte sub_8078B34
_080E1074: .4byte move_anim_8072740
	thumb_func_end sub_80E1004

	thumb_func_start sub_80E1078
sub_80E1078: @ 80E1078
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r4, _080E10F8 @ =gBattleAnimBankTarget
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
_080E10F8: .4byte gBattleAnimBankTarget
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
	ldr r4, _080E1174 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r6, 0x2]
	adds r0, r2
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
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
_080E1174: .4byte gBattleAnimBankAttacker
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
	bl move_anim_8072740
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
	bl move_anim_8072740
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
	ldr r0, _080E12EC @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankIdentity_permutated
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1E]
	cmp r0, 0x1
	bne _080E12F8
	ldr r0, _080E12F0 @ =gUnknown_030042C0
	ldrh r0, [r0]
	strh r0, [r4, 0x20]
	ldr r0, _080E12F4 @ =gUnknown_030041B4
	b _080E1300
	.align 2, 0
_080E12EC: .4byte gBattleAnimBankAttacker
_080E12F0: .4byte gUnknown_030042C0
_080E12F4: .4byte gUnknown_030041B4
_080E12F8:
	ldr r0, _080E133C @ =gUnknown_03004288
	ldrh r0, [r0]
	strh r0, [r4, 0x20]
	ldr r0, _080E1340 @ =gUnknown_03004280
_080E1300:
	ldrh r0, [r0]
	strh r0, [r4, 0x22]
	ldr r0, _080E1344 @ =gBattleAnimBankAttacker
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
_080E133C: .4byte gUnknown_03004288
_080E1340: .4byte gUnknown_03004280
_080E1344: .4byte gBattleAnimBankAttacker
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
	ldr r1, _080E13A4 @ =gUnknown_030041B4
	b _080E13AA
	.align 2, 0
_080E13A0: .4byte gSineTable
_080E13A4: .4byte gUnknown_030041B4
_080E13A8:
	ldr r1, _080E13CC @ =gUnknown_03004280
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
	ldr r1, _080E13D0 @ =gUnknown_030041B4
	b _080E13D6
	.align 2, 0
_080E13CC: .4byte gUnknown_03004280
_080E13D0: .4byte gUnknown_030041B4
_080E13D4:
	ldr r1, _080E13F8 @ =gUnknown_03004280
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
_080E13F8: .4byte gUnknown_03004280
_080E13FC: .4byte gSprites
_080E1400:
	ldr r1, _080E1410 @ =gUnknown_03004DC0
	movs r0, 0x3
	strb r0, [r1, 0x15]
_080E1406:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080E1432
	.align 2, 0
_080E1410: .4byte gUnknown_03004DC0
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
	ldr r0, _080E1480 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankIdentity_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080E1488
	ldr r0, _080E1484 @ =gUnknown_030041B4
	b _080E148A
	.align 2, 0
_080E147C: .4byte gSprites
_080E1480: .4byte gBattleAnimBankAttacker
_080E1484: .4byte gUnknown_030041B4
_080E1488:
	ldr r0, _080E1498 @ =gUnknown_03004280
_080E148A:
	strh r4, [r0]
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E1498: .4byte gUnknown_03004280
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
	ldr r0, _080E15C4 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankIdentity_permutated
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1E]
	cmp r0, 0x1
	bne _080E15CC
	ldr r0, _080E15C8 @ =gUnknown_030042C0
	b _080E15CE
	.align 2, 0
_080E15C4: .4byte gBattleAnimBankAttacker
_080E15C8: .4byte gUnknown_030042C0
_080E15CC:
	ldr r0, _080E15EC @ =gUnknown_03004288
_080E15CE:
	ldrh r0, [r0]
	strh r0, [r4, 0x20]
	ldr r0, _080E15F0 @ =gBattleAnimBankAttacker
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
_080E15EC: .4byte gUnknown_03004288
_080E15F0: .4byte gBattleAnimBankAttacker
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
	ldr r1, _080E1658 @ =gUnknown_03004DC0
	movs r0, 0x3
	strb r0, [r1, 0x15]
_080E164A:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080E1662
	.align 2, 0
_080E1654: .4byte gSprites
_080E1658: .4byte gUnknown_03004DC0
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
	ldr r0, _080E1684 @ =gUnknown_030042C0
	ldrh r3, [r0]
	ldr r0, _080E1688 @ =REG_BG1HOFS
	b _080E1692
	.align 2, 0
_080E1684: .4byte gUnknown_030042C0
_080E1688: .4byte REG_BG1HOFS
_080E168C:
	ldr r0, _080E1718 @ =gUnknown_03004288
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
	ldr r5, _080E1720 @ =gUnknown_03004DE0
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
	ldr r4, _080E1720 @ =gUnknown_03004DE0
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
	bl sub_80895F8
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E1718: .4byte gUnknown_03004288
_080E171C: .4byte REG_BG2HOFS
_080E1720: .4byte gUnknown_03004DE0
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
	ldr r0, _080E1740 @ =gBattleAnimBankAttacker
	b _080E1746
	.align 2, 0
_080E173C: .4byte gBattleAnimArgs
_080E1740: .4byte gBattleAnimBankAttacker
_080E1744:
	ldr r0, _080E17A8 @ =gBattleAnimBankTarget
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
	bl sub_8077ABC
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
_080E17A8: .4byte gBattleAnimBankTarget
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
	bl move_anim_8072740
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
	ldr r0, _080E17E4 @ =gBattleAnimBankAttacker
	b _080E17EA
	.align 2, 0
_080E17E0: .4byte gBattleAnimArgs
_080E17E4: .4byte gBattleAnimBankAttacker
_080E17E8:
	ldr r0, _080E1848 @ =gBattleAnimBankTarget
_080E17EA:
	ldrb r5, [r0]
	adds r0, r5, 0
	movs r1, 0
	bl sub_8077ABC
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
	ldr r1, _080E185C @ =move_anim_8072740
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
_080E1848: .4byte gBattleAnimBankTarget
_080E184C: .4byte 0x0000fff0
_080E1850: .4byte gBattleAnimArgs
_080E1854: .4byte 0x000003ff
_080E1858: .4byte 0xfffffc00
_080E185C: .4byte move_anim_8072740
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
	ldr r0, _080E18BC @ =gMovePowerMoveAnim
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
	ldr r0, _080E18C0 @ =gUnknown_030041B0
	ldrh r0, [r0]
	strh r0, [r4, 0x22]
	ldr r0, _080E18C4 @ =sub_80E1934
	b _080E1926
	.align 2, 0
_080E18BC: .4byte gMovePowerMoveAnim
_080E18C0: .4byte gUnknown_030041B0
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
	ldr r0, _080E1904 @ =gObjectBankIDs
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
_080E1904: .4byte gObjectBankIDs
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
	ldr r1, _080E1988 @ =gUnknown_030041B0
	ldrh r0, [r3, 0x26]
	ldrh r2, [r3, 0x22]
	adds r0, r2
	strh r0, [r1]
	b _080E1996
	.align 2, 0
_080E1988: .4byte gUnknown_030041B0
_080E198C:
	ldr r0, _080E19B4 @ =gUnknown_030041B0
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
_080E19B4: .4byte gUnknown_030041B0
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
	ldr r1, _080E19E0 @ =gUnknown_030041B0
	ldrh r0, [r3, 0x24]
	ldrh r2, [r3, 0x22]
	adds r0, r2
	strh r0, [r1]
	b _080E19EE
	.align 2, 0
_080E19E0: .4byte gUnknown_030041B0
_080E19E4:
	ldr r0, _080E1A14 @ =gUnknown_030041B0
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
_080E1A14: .4byte gUnknown_030041B0
_080E1A18:
	ldr r1, _080E1A28 @ =gUnknown_030041B0
	ldrh r0, [r3, 0x22]
	strh r0, [r1]
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080E1A24:
	pop {r0}
	bx r0
	.align 2, 0
_080E1A28: .4byte gUnknown_030041B0
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
	ldr r0, _080E1BAC @ =gMovePowerMoveAnim
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
_080E1BAC: .4byte gMovePowerMoveAnim
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
	ldr r0, _080E1BCC @ =gBattleAnimBankTarget
	b _080E1BD2
	.align 2, 0
_080E1BC8: .4byte gBattleAnimArgs
_080E1BCC: .4byte gBattleAnimBankTarget
_080E1BD0:
	ldr r0, _080E1C40 @ =gBattleAnimBankAttacker
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
	bl sub_8077ABC
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
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x40
	subs r1, r0
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r4, 0xC]
	ldr r2, _080E1C50 @ =gUnknown_030041B0
	ldrh r0, [r4, 0xA]
	strh r0, [r2]
	ldr r0, _080E1C54 @ =gUnknown_030041B8
	strh r1, [r0]
	ldrh r0, [r6, 0x4]
	strh r0, [r4, 0xE]
	adds r0, r7, 0
	bl DestroyAnimVisualTask
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E1C40: .4byte gBattleAnimBankAttacker
_080E1C44: .4byte sub_80E1C58
_080E1C48: .4byte gTasks
_080E1C4C: .4byte 0x000001ff
_080E1C50: .4byte gUnknown_030041B0
_080E1C54: .4byte gUnknown_030041B8
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
	ldr r0, _080E1C90 @ =gUnknown_030041B0
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080E1C94 @ =gUnknown_030041B8
	strh r1, [r0]
	adds r0, r3, 0
	bl DestroyTask
	b _080E1CA4
	.align 2, 0
_080E1C88: .4byte gTasks
_080E1C8C: .4byte gBattleAnimArgs
_080E1C90: .4byte gUnknown_030041B0
_080E1C94: .4byte gUnknown_030041B8
_080E1C98:
	ldr r1, _080E1CAC @ =gUnknown_030041B0
	ldrh r0, [r2, 0xA]
	strh r0, [r1]
	ldr r1, _080E1CB0 @ =gUnknown_030041B8
	ldrh r0, [r2, 0xC]
	strh r0, [r1]
_080E1CA4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E1CAC: .4byte gUnknown_030041B0
_080E1CB0: .4byte gUnknown_030041B8
	thumb_func_end sub_80E1C58

	thumb_func_start sub_80E1CB4
sub_80E1CB4: @ 80E1CB4
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080E1CEC @ =gBattleAnimArgs
	ldrh r0, [r5]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2E]
	ldr r0, _080E1CF0 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _080E1CF4
	ldrh r0, [r5, 0x6]
	negs r0, r0
	strh r0, [r4, 0x30]
	movs r0, 0x1
	strh r0, [r4, 0x36]
	b _080E1D02
	.align 2, 0
_080E1CEC: .4byte gBattleAnimArgs
_080E1CF0: .4byte gBattleAnimBankAttacker
_080E1CF4:
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x30]
	strh r1, [r4, 0x36]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
_080E1D02:
	ldr r0, _080E1D18 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x8]
	strh r0, [r4, 0x34]
	ldr r1, _080E1D1C @ =sub_80E1D20
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E1D18: .4byte gBattleAnimArgs
_080E1D1C: .4byte sub_80E1D20
	thumb_func_end sub_80E1CB4

	thumb_func_start sub_80E1D20
sub_80E1D20: @ 80E1D20
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x1E
	bl Cos
	strh r0, [r4, 0x24]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	movs r1, 0xA
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	cmp r0, 0x7F
	bhi _080E1D52
	ldrb r0, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4, 0x5]
	b _080E1D5A
_080E1D52:
	ldrb r0, [r4, 0x5]
	movs r1, 0xC
	orrs r0, r1
	strb r0, [r4, 0x5]
_080E1D5A:
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x2E]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080E1D7E
	adds r0, r4, 0
	bl move_anim_8072740
_080E1D7E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E1D20

	thumb_func_start sub_80E1D84
sub_80E1D84: @ 80E1D84
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r4, _080E1DBC @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r4, r1]
	bl sub_80E1DC4
	movs r1, 0x2
	ldrsb r1, [r4, r1]
	ldrb r2, [r4, 0x4]
	ldrb r3, [r4, 0x6]
	ldrh r4, [r4, 0x8]
	str r4, [sp]
	bl BeginNormalPaletteFade
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080E1DC0 @ =sub_80E1E0C
	str r0, [r5, 0x1C]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E1DBC: .4byte gBattleAnimArgs
_080E1DC0: .4byte sub_80E1E0C
	thumb_func_end sub_80E1D84

	thumb_func_start sub_80E1DC4
sub_80E1DC4: @ 80E1DC4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	lsls r0, 16
	lsrs r0, 16
	movs r4, 0x1
	mov r8, r0
	mov r1, r8
	ands r1, r4
	mov r8, r1
	lsls r0, 16
	asrs r1, r0, 17
	ands r1, r4
	asrs r2, r0, 18
	ands r2, r4
	asrs r3, r0, 19
	ands r3, r4
	asrs r6, r0, 20
	ands r6, r4
	asrs r5, r0, 21
	ands r5, r4
	asrs r0, 22
	ands r0, r4
	str r6, [sp]
	str r5, [sp, 0x4]
	str r0, [sp, 0x8]
	mov r0, r8
	bl sub_80791A8
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80E1DC4

	thumb_func_start sub_80E1E0C
sub_80E1E0C: @ 80E1E0C
	push {lr}
	adds r2, r0, 0
	ldr r0, _080E1E28 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E1E22
	adds r0, r2, 0
	bl move_anim_8072740
_080E1E22:
	pop {r0}
	bx r0
	.align 2, 0
_080E1E28: .4byte gPaletteFade
	thumb_func_end sub_80E1E0C

	thumb_func_start sub_80E1E2C
sub_80E1E2C: @ 80E1E2C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080E1E78 @ =gBattleAnimArgs
	ldrh r0, [r4, 0x2]
	strh r0, [r5, 0x2E]
	strh r0, [r5, 0x30]
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x32]
	ldrh r0, [r4, 0x6]
	strh r0, [r5, 0x34]
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x36]
	ldrh r0, [r4, 0xA]
	strh r0, [r5, 0x38]
	ldrh r0, [r4, 0xC]
	strh r0, [r5, 0x3A]
	ldrh r0, [r4]
	strh r0, [r5, 0x3C]
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	bl sub_80E1DC4
	ldrb r1, [r4, 0x8]
	ldrh r2, [r4, 0x6]
	bl BlendPalettes
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080E1E7C @ =sub_80E1E80
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E1E78: .4byte gBattleAnimArgs
_080E1E7C: .4byte sub_80E1E80
	thumb_func_end sub_80E1E2C

	thumb_func_start sub_80E1E80
sub_80E1E80: @ 80E1E80
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080E1E94
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	b _080E1F04
_080E1E94:
	ldr r0, _080E1EB0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E1F04
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E1EB8
	ldr r0, _080E1EB4 @ =sub_80E1F0C
	str r0, [r4, 0x1C]
	b _080E1F04
	.align 2, 0
_080E1EB0: .4byte gPaletteFade
_080E1EB4: .4byte sub_80E1F0C
_080E1EB8:
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	bl sub_80E1DC4
	adds r3, r0, 0
	ldrh r1, [r4, 0x30]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080E1EDE
	ldrh r1, [r4, 0x36]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x34]
	adds r0, r3, 0
	bl BlendPalettes
	b _080E1EEC
_080E1EDE:
	ldrh r1, [r4, 0x3A]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x38]
	adds r0, r3, 0
	bl BlendPalettes
_080E1EEC:
	ldrh r0, [r4, 0x30]
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	eors r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x32]
	subs r0, 0x1
	strh r0, [r4, 0x32]
_080E1F04:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E1E80

	thumb_func_start sub_80E1F0C
sub_80E1F0C: @ 80E1F0C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080E1F38 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E1F32
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	bl sub_80E1DC4
	movs r1, 0
	movs r2, 0
	bl BlendPalettes
	adds r0, r4, 0
	bl move_anim_8072740
_080E1F32:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E1F38: .4byte gPaletteFade
	thumb_func_end sub_80E1F0C

	thumb_func_start sub_80E1F3C
sub_80E1F3C: @ 80E1F3C
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080E1F80 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	movs r2, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	strh r2, [r4, 0x2E]
	movs r0, 0xA
	strh r0, [r4, 0x30]
	movs r0, 0x8
	strh r0, [r4, 0x32]
	movs r0, 0x28
	strh r0, [r4, 0x34]
	movs r0, 0x70
	strh r0, [r4, 0x36]
	strh r2, [r4, 0x38]
	ldr r1, _080E1F84 @ =move_anim_8074EE0
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	ldr r1, _080E1F88 @ =sub_8078174
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E1F80: .4byte gBattleAnimArgs
_080E1F84: .4byte move_anim_8074EE0
_080E1F88: .4byte sub_8078174
	thumb_func_end sub_80E1F3C

	thumb_func_start sub_80E1F8C
sub_80E1F8C: @ 80E1F8C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080E1FD0 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldr r3, _080E1FD4 @ =gBattleAnimArgs
	ldrh r1, [r3]
	movs r5, 0
	strh r1, [r4, 0x8]
	ldrh r1, [r3, 0x2]
	strh r1, [r4, 0xA]
	ldrh r1, [r3, 0x4]
	strh r1, [r4, 0xC]
	ldrh r1, [r3, 0x6]
	strh r1, [r4, 0xE]
	ldrh r2, [r3, 0x8]
	strh r2, [r4, 0x10]
	ldrh r1, [r3, 0xA]
	strh r1, [r4, 0x12]
	strh r5, [r4, 0x18]
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0
	bl sub_80E1FDC
	ldr r0, _080E1FD8 @ =sub_80E202C
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E1FD0: .4byte gTasks
_080E1FD4: .4byte gBattleAnimArgs
_080E1FD8: .4byte sub_80E202C
	thumb_func_end sub_80E1F8C

	thumb_func_start sub_80E1FDC
sub_80E1FDC: @ 80E1FDC
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	ldr r1, _080E2028 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	bl sub_80E1DC4
	movs r1, 0xA
	ldrsb r1, [r4, r1]
	ldrh r2, [r4, 0x12]
	str r2, [sp]
	adds r2, r5, 0
	adds r3, r6, 0
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x18]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x18]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E2028: .4byte gTasks
	thumb_func_end sub_80E1FDC

	thumb_func_start sub_80E202C
sub_80E202C: @ 80E202C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	adds r4, r3, 0
	ldr r0, _080E2064 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E208E
	ldr r1, _080E2068 @ =gTasks
	lsls r2, r3, 2
	adds r0, r2, r3
	lsls r0, 3
	adds r3, r0, r1
	movs r5, 0xC
	ldrsh r0, [r3, r5]
	adds r6, r1, 0
	adds r5, r2, 0
	cmp r0, 0
	ble _080E2088
	movs r1, 0x18
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080E206C
	ldrb r1, [r3, 0xE]
	ldrb r2, [r3, 0x10]
	b _080E2070
	.align 2, 0
_080E2064: .4byte gPaletteFade
_080E2068: .4byte gTasks
_080E206C:
	ldrb r1, [r3, 0x10]
	ldrb r2, [r3, 0xE]
_080E2070:
	adds r0, r5, r4
	lsls r0, 3
	adds r0, r6
	movs r3, 0xC
	ldrsh r0, [r0, r3]
	cmp r0, 0x1
	bne _080E2080
	movs r2, 0
_080E2080:
	adds r0, r4, 0
	bl sub_80E1FDC
	b _080E208E
_080E2088:
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080E208E:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80E202C

	thumb_func_start sub_80E2094
sub_80E2094: @ 80E2094
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080E20D8 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldr r3, _080E20DC @ =gBattleAnimArgs
	ldrh r1, [r3]
	movs r5, 0
	strh r1, [r4, 0x8]
	ldrh r1, [r3, 0x2]
	strh r1, [r4, 0xA]
	ldrh r1, [r3, 0x4]
	strh r1, [r4, 0xC]
	ldrh r1, [r3, 0x6]
	strh r1, [r4, 0xE]
	ldrh r2, [r3, 0x8]
	strh r2, [r4, 0x10]
	ldrh r1, [r3, 0xA]
	strh r1, [r4, 0x12]
	strh r5, [r4, 0x18]
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0
	bl sub_80E20E4
	ldr r0, _080E20E0 @ =sub_80E2140
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E20D8: .4byte gTasks
_080E20DC: .4byte gBattleAnimArgs
_080E20E0: .4byte sub_80E2140
	thumb_func_end sub_80E2094

	thumb_func_start sub_80E20E4
sub_80E20E4: @ 80E20E4
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	ldr r1, _080E213C @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldrh r0, [r4, 0x8]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r2, 0x1
	lsls r2, r0
	movs r1, 0xA
	ldrsb r1, [r4, r1]
	ldrh r0, [r4, 0x12]
	str r0, [sp]
	adds r0, r2, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x18]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x18]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E213C: .4byte gTasks
	thumb_func_end sub_80E20E4

	thumb_func_start sub_80E2140
sub_80E2140: @ 80E2140
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	adds r4, r3, 0
	ldr r0, _080E2178 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E21A2
	ldr r1, _080E217C @ =gTasks
	lsls r2, r3, 2
	adds r0, r2, r3
	lsls r0, 3
	adds r3, r0, r1
	movs r5, 0xC
	ldrsh r0, [r3, r5]
	adds r6, r1, 0
	adds r5, r2, 0
	cmp r0, 0
	ble _080E219C
	movs r1, 0x18
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080E2180
	ldrb r1, [r3, 0xE]
	ldrb r2, [r3, 0x10]
	b _080E2184
	.align 2, 0
_080E2178: .4byte gPaletteFade
_080E217C: .4byte gTasks
_080E2180:
	ldrb r1, [r3, 0x10]
	ldrb r2, [r3, 0xE]
_080E2184:
	adds r0, r5, r4
	lsls r0, 3
	adds r0, r6
	movs r3, 0xC
	ldrsh r0, [r0, r3]
	cmp r0, 0x1
	bne _080E2194
	movs r2, 0
_080E2194:
	adds r0, r4, 0
	bl sub_80E20E4
	b _080E21A2
_080E219C:
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080E21A2:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80E2140

	thumb_func_start sub_80E21A8
sub_80E21A8: @ 80E21A8
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080E2208 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldr r5, _080E220C @ =gBattleAnimArgs
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x8]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0xA]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0xC]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0xE]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x10]
	ldrh r0, [r5, 0xA]
	strh r0, [r4, 0x12]
	ldrh r0, [r5, 0xC]
	strh r0, [r4, 0x14]
	ldrh r0, [r5]
	strh r0, [r4, 0x16]
	ldrh r0, [r5]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r1, 0x1
	lsls r1, r0
	ldrb r3, [r5, 0x8]
	ldrh r0, [r5, 0x6]
	str r0, [sp]
	adds r0, r1, 0
	movs r1, 0
	adds r2, r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _080E2210 @ =sub_80E2214
	str r0, [r4]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E2208: .4byte gTasks
_080E220C: .4byte gBattleAnimArgs
_080E2210: .4byte sub_80E2214
	thumb_func_end sub_80E21A8

	thumb_func_start sub_80E2214
sub_80E2214: @ 80E2214
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080E2238 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0x8]
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080E223C
	subs r0, r1, 0x1
	strh r0, [r4, 0x8]
	b _080E22C0
	.align 2, 0
_080E2238: .4byte gTasks
_080E223C:
	ldr r0, _080E2258 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E22C0
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _080E2260
	ldr r0, _080E225C @ =sub_80E22CC
	str r0, [r4]
	b _080E22C0
	.align 2, 0
_080E2258: .4byte gPaletteFade
_080E225C: .4byte sub_80E22CC
_080E2260:
	ldrh r0, [r4, 0x16]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r2, 0x1
	lsls r2, r0
	ldrh r1, [r4, 0xA]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080E228E
	ldrb r3, [r4, 0x10]
	ldrh r0, [r4, 0xE]
	str r0, [sp]
	adds r0, r2, 0
	movs r1, 0
	adds r2, r3, 0
	bl BeginNormalPaletteFade
	b _080E229E
_080E228E:
	ldrb r3, [r4, 0x14]
	ldrh r0, [r4, 0x12]
	str r0, [sp]
	adds r0, r2, 0
	movs r1, 0
	adds r2, r3, 0
	bl BeginNormalPaletteFade
_080E229E:
	ldr r0, _080E22C8 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xA]
	movs r3, 0x80
	lsls r3, 1
	adds r2, r3, 0
	eors r0, r2
	strh r0, [r1, 0xA]
	movs r2, 0xFF
	ands r0, r2
	strh r0, [r1, 0x8]
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
_080E22C0:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E22C8: .4byte gTasks
	thumb_func_end sub_80E2214

	thumb_func_start sub_80E22CC
sub_80E22CC: @ 80E22CC
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080E231C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080E2312
	ldr r1, _080E2320 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x16]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r1, 0x1
	lsls r1, r0
	str r5, [sp]
	adds r0, r1, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl BeginNormalPaletteFade
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080E2312:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E231C: .4byte gPaletteFade
_080E2320: .4byte gTasks
	thumb_func_end sub_80E22CC

	thumb_func_start sub_80E2324
sub_80E2324: @ 80E2324
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r2, 0
	ldr r0, _080E239C @ =gBattleAnimBankAttacker
	ldrb r6, [r0]
	ldr r0, _080E23A0 @ =gBattleAnimBankTarget
	ldrb r7, [r0]
	ldr r4, _080E23A4 @ =gBattleAnimArgs
	ldrh r1, [r4]
	movs r5, 0x80
	lsls r5, 1
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _080E235E
	str r2, [sp]
	str r2, [sp, 0x4]
	str r2, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r3, 0
	bl sub_80791A8
	adds r2, r0, 0
_080E235E:
	ldrh r1, [r4, 0x2]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _080E2370
	movs r0, 0x80
	lsls r0, 9
	lsls r0, r6
	orrs r2, r0
_080E2370:
	ldrh r1, [r4, 0x4]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _080E2382
	movs r0, 0x80
	lsls r0, 9
	lsls r0, r7
	orrs r2, r0
_080E2382:
	adds r0, r2, 0
	bl InvertPlttBuffer
	mov r0, r8
	bl DestroyAnimVisualTask
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E239C: .4byte gBattleAnimBankAttacker
_080E23A0: .4byte gBattleAnimBankTarget
_080E23A4: .4byte gBattleAnimArgs
	thumb_func_end sub_80E2324

	thumb_func_start unref_sub_80E23A8
unref_sub_80E23A8: @ 80E23A8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r5, 0
	ldr r1, _080E249C @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E23EA
	ldr r1, _080E24A0 @ =gBattleAnimArgs
	ldrh r0, [r1]
	strh r0, [r4, 0xC]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0xE]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x10]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0xA]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x12]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x14]
	ldrh r0, [r1, 0xC]
	strh r0, [r4, 0x16]
_080E23EA:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldr r0, _080E24A4 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	mov r9, r0
	ldr r0, _080E24A8 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	mov r10, r0
	ldrh r1, [r4, 0xC]
	movs r7, 0x80
	lsls r7, 1
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _080E240C
	ldr r5, _080E24AC @ =0x0000ffff
_080E240C:
	movs r6, 0x1
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	beq _080E243C
	ldr r2, _080E24B0 @ =gSprites
	ldr r0, _080E24B4 @ =gHealthboxIDs
	add r0, r9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x14
	adds r0, r2
	ldr r0, [r0]
	ldrh r0, [r0, 0x2]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r1, r6, 0
	lsls r1, r0
	lsls r1, 16
	orrs r5, r1
_080E243C:
	ldrh r1, [r4, 0xE]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _080E2450
	adds r0, r6, 0
	mov r2, r9
	lsls r0, r2
	lsls r0, 16
	orrs r5, r0
_080E2450:
	ldrh r1, [r4, 0x10]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _080E2464
	adds r0, r6, 0
	mov r1, r10
	lsls r0, r1
	lsls r0, 16
	orrs r5, r0
_080E2464:
	movs r1, 0x12
	ldrsb r1, [r4, r1]
	movs r2, 0x14
	ldrsb r2, [r4, r2]
	movs r3, 0x16
	ldrsb r3, [r4, r3]
	adds r0, r5, 0
	bl TintPlttBuffer
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080E248E
	adds r0, r5, 0
	bl UnfadePlttBuffer
	mov r0, r8
	bl DestroyAnimVisualTask
_080E248E:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E249C: .4byte gTasks
_080E24A0: .4byte gBattleAnimArgs
_080E24A4: .4byte gBattleAnimBankAttacker
_080E24A8: .4byte gBattleAnimBankTarget
_080E24AC: .4byte 0x0000ffff
_080E24B0: .4byte gSprites
_080E24B4: .4byte gHealthboxIDs
	thumb_func_end unref_sub_80E23A8

	thumb_func_start sub_80E24B8
sub_80E24B8: @ 80E24B8
	push {r4,lr}
	adds r4, r0, 0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080E24EC @ =gBattleAnimArgs
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x30]
	strh r0, [r4, 0x32]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x34]
	movs r2, 0x6
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	beq _080E2500
	cmp r0, 0x1
	bgt _080E24F0
	cmp r0, 0
	beq _080E24F6
	b _080E2518
	.align 2, 0
_080E24EC: .4byte gBattleAnimArgs
_080E24F0:
	cmp r0, 0x2
	beq _080E2508
	b _080E2518
_080E24F6:
	ldr r1, _080E24FC @ =gUnknown_030041B0
	b _080E250A
	.align 2, 0
_080E24FC: .4byte gUnknown_030041B0
_080E2500:
	ldr r1, _080E2504 @ =gUnknown_030041B8
	b _080E250A
	.align 2, 0
_080E2504: .4byte gUnknown_030041B8
_080E2508:
	ldr r1, _080E2514 @ =gSpriteCoordOffsetX
_080E250A:
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	b _080E2520
	.align 2, 0
_080E2514: .4byte gSpriteCoordOffsetX
_080E2518:
	ldr r1, _080E2550 @ =gSpriteCoordOffsetY
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
_080E2520:
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	lsls r0, 16
	orrs r1, r0
	ldr r0, [r1]
	strh r0, [r4, 0x36]
	ldr r0, _080E2554 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x6]
	strh r0, [r4, 0x38]
	subs r0, 0x2
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080E2544
	bl sub_80E260C
_080E2544:
	ldr r0, _080E2558 @ =sub_80E255C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E2550: .4byte gSpriteCoordOffsetY
_080E2554: .4byte gBattleAnimArgs
_080E2558: .4byte sub_80E255C
	thumb_func_end sub_80E24B8

	thumb_func_start sub_80E255C
sub_80E255C: @ 80E255C
	push {r4-r7,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x34]
	movs r2, 0x34
	ldrsh r0, [r3, r2]
	cmp r0, 0
	ble _080E25A0
	subs r0, r1, 0x1
	strh r0, [r3, 0x34]
	ldrh r1, [r3, 0x30]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r0, 0
	ble _080E257E
	subs r0, r1, 0x1
	strh r0, [r3, 0x30]
	b _080E25FA
_080E257E:
	ldrh r0, [r3, 0x32]
	strh r0, [r3, 0x30]
	movs r0, 0x3A
	ldrsh r1, [r3, r0]
	movs r2, 0x3C
	ldrsh r0, [r3, r2]
	lsls r0, 16
	orrs r1, r0
	movs r0, 0x2E
	ldrsh r2, [r3, r0]
	ldr r0, [r1]
	adds r0, r2
	str r0, [r1]
	ldrh r0, [r3, 0x2E]
	negs r0, r0
	strh r0, [r3, 0x2E]
	b _080E25FA
_080E25A0:
	movs r2, 0x3A
	ldrsh r1, [r3, r2]
	movs r2, 0x3C
	ldrsh r0, [r3, r2]
	lsls r0, 16
	orrs r1, r0
	movs r2, 0x36
	ldrsh r0, [r3, r2]
	str r0, [r1]
	ldrh r0, [r3, 0x38]
	subs r0, 0x2
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080E25F4
	movs r4, 0
	ldr r5, _080E2600 @ =gNoOfAllBanks
	ldrb r0, [r5]
	cmp r4, r0
	bcs _080E25F4
	ldr r2, _080E2604 @ =gSprites
	mov r12, r2
	ldr r6, _080E2608 @ =gObjectBankIDs
	movs r7, 0x3
	negs r7, r7
_080E25D2:
	adds r0, r4, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r12
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r7, 0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r5]
	cmp r4, r0
	bcc _080E25D2
_080E25F4:
	adds r0, r3, 0
	bl move_anim_8072740
_080E25FA:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E2600: .4byte gNoOfAllBanks
_080E2604: .4byte gSprites
_080E2608: .4byte gObjectBankIDs
	thumb_func_end sub_80E255C

	thumb_func_start sub_80E260C
sub_80E260C: @ 80E260C
	push {r4-r6,lr}
	ldr r6, _080E2680 @ =gSprites
	ldr r4, _080E2684 @ =gObjectBankIDs
	ldr r5, _080E2688 @ =gBattleAnimBankAttacker
	ldrb r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x3
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	ldr r3, _080E268C @ =gBattleAnimBankTarget
	ldrb r0, [r3]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	ldr r0, _080E2690 @ =gBattleAnimArgs
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0x2
	bne _080E2694
	ldrb r0, [r5]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
	ldrb r0, [r3]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	b _080E26B0
	.align 2, 0
_080E2680: .4byte gSprites
_080E2684: .4byte gObjectBankIDs
_080E2688: .4byte gBattleAnimBankAttacker
_080E268C: .4byte gBattleAnimBankTarget
_080E2690: .4byte gBattleAnimArgs
_080E2694:
	cmp r0, 0
	bne _080E269C
	ldrb r0, [r5]
	b _080E269E
_080E269C:
	ldrb r0, [r3]
_080E269E:
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x2
_080E26B0:
	orrs r1, r2
	strb r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80E260C

	thumb_func_start sub_80E26BC
sub_80E26BC: @ 80E26BC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080E26FC @ =gTasks
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r1
	ldr r3, _080E2700 @ =gBattleAnimArgs
	ldrh r1, [r3]
	strh r1, [r2, 0x8]
	ldrh r1, [r3, 0x2]
	strh r1, [r2, 0xA]
	ldrh r1, [r3, 0x4]
	strh r1, [r2, 0xC]
	ldrh r1, [r3, 0x6]
	strh r1, [r2, 0xE]
	ldrh r1, [r3, 0x6]
	strh r1, [r2, 0x18]
	ldr r4, _080E2704 @ =gUnknown_030041B0
	ldrh r1, [r3]
	strh r1, [r4]
	ldr r4, _080E2708 @ =gUnknown_030041B8
	ldrh r1, [r3, 0x2]
	strh r1, [r4]
	ldr r1, _080E270C @ =sub_80E2710
	str r1, [r2]
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E26FC: .4byte gTasks
_080E2700: .4byte gBattleAnimArgs
_080E2704: .4byte gUnknown_030041B0
_080E2708: .4byte gUnknown_030041B8
_080E270C: .4byte sub_80E2710
	thumb_func_end sub_80E26BC

	thumb_func_start sub_80E2710
sub_80E2710: @ 80E2710
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080E2740 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r1
	ldrh r2, [r3, 0xE]
	movs r4, 0xE
	ldrsh r0, [r3, r4]
	mov r12, r1
	cmp r0, 0
	bne _080E2796
	ldr r0, _080E2744 @ =gUnknown_030041B0
	ldrh r2, [r0]
	movs r7, 0x8
	ldrsh r1, [r3, r7]
	adds r6, r0, 0
	cmp r2, r1
	bne _080E2748
	ldrh r0, [r3, 0x8]
	negs r0, r0
	b _080E274A
	.align 2, 0
_080E2740: .4byte gTasks
_080E2744: .4byte gUnknown_030041B0
_080E2748:
	ldrh r0, [r3, 0x8]
_080E274A:
	strh r0, [r6]
	ldr r2, _080E2768 @ =gUnknown_030041B8
	ldrh r3, [r2]
	lsls r1, r5, 2
	adds r0, r1, r5
	lsls r0, 3
	mov r7, r12
	adds r4, r0, r7
	movs r7, 0xA
	ldrsh r0, [r4, r7]
	cmn r3, r0
	bne _080E276C
	movs r0, 0
	b _080E2770
	.align 2, 0
_080E2768: .4byte gUnknown_030041B8
_080E276C:
	ldrh r0, [r4, 0xA]
	negs r0, r0
_080E2770:
	strh r0, [r2]
	adds r0, r1, r5
	lsls r0, 3
	add r0, r12
	ldrh r1, [r0, 0x18]
	strh r1, [r0, 0xE]
	ldrh r1, [r0, 0xC]
	subs r1, 0x1
	strh r1, [r0, 0xC]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0
	bne _080E279A
	strh r1, [r6]
	strh r1, [r2]
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	b _080E279A
_080E2796:
	subs r0, r2, 0x1
	strh r0, [r3, 0xE]
_080E279A:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80E2710

	thumb_func_start sub_80E27A0
sub_80E27A0: @ 80E27A0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080E27C0 @ =gBattleAnimArgs
	ldrb r1, [r4, 0x6]
	bl StartSpriteAffineAnim
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E27C4
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80787B0
	b _080E27CC
	.align 2, 0
_080E27C0: .4byte gBattleAnimArgs
_080E27C4:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8078764
_080E27CC:
	ldr r0, _080E27E0 @ =sub_80785E4
	str r0, [r5, 0x1C]
	ldr r1, _080E27E4 @ =move_anim_8072740
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E27E0: .4byte sub_80785E4
_080E27E4: .4byte move_anim_8072740
	thumb_func_end sub_80E27A0

	thumb_func_start sub_80E27E8
sub_80E27E8: @ 80E27E8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080E2808 @ =gBattleAnimArgs
	ldrb r1, [r4, 0x6]
	bl StartSpriteAffineAnim
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E280C
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80787B0
	b _080E2814
	.align 2, 0
_080E2808: .4byte gBattleAnimArgs
_080E280C:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8078764
_080E2814:
	ldr r0, _080E282C @ =gBattleAnimArgs
	ldrh r0, [r0, 0x8]
	strh r0, [r5, 0x2E]
	ldr r0, _080E2830 @ =sub_80785E4
	str r0, [r5, 0x1C]
	ldr r1, _080E2834 @ =sub_80DA48C
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E282C: .4byte gBattleAnimArgs
_080E2830: .4byte sub_80785E4
_080E2834: .4byte sub_80DA48C
	thumb_func_end sub_80E27E8

	thumb_func_start sub_80E2838
sub_80E2838: @ 80E2838
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080E2868 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080E285C
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080E285C
	ldr r1, _080E286C @ =gBattleAnimArgs
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
_080E285C:
	adds r0, r4, 0
	bl sub_80E27A0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E2868: .4byte gBattleAnimBankAttacker
_080E286C: .4byte gBattleAnimArgs
	thumb_func_end sub_80E2838

	thumb_func_start sub_80E2870
sub_80E2870: @ 80E2870
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080E28A8 @ =gBattleAnimArgs
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _080E288C
	bl Random
	movs r1, 0x3
	ands r1, r0
	strh r1, [r5, 0x2]
_080E288C:
	ldrb r1, [r5, 0x2]
	adds r0, r4, 0
	bl StartSpriteAffineAnim
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080E28AC
	adds r0, r4, 0
	movs r1, 0
	bl sub_80787B0
	b _080E28B4
	.align 2, 0
_080E28A8: .4byte gBattleAnimArgs
_080E28AC:
	adds r0, r4, 0
	movs r1, 0
	bl sub_8078764
_080E28B4:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x30
	bl __umodsi3
	ldr r1, _080E28F8 @ =0x0000ffe8
	adds r0, r1
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x18
	bl __umodsi3
	ldr r1, _080E28FC @ =0x0000fff4
	adds r0, r1
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldr r1, _080E2900 @ =move_anim_8074EE0
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	ldr r0, _080E2904 @ =sub_80785E4
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E28F8: .4byte 0x0000ffe8
_080E28FC: .4byte 0x0000fff4
_080E2900: .4byte move_anim_8074EE0
_080E2904: .4byte sub_80785E4
	thumb_func_end sub_80E2870

	thumb_func_start sub_80E2908
sub_80E2908: @ 80E2908
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080E2968 @ =gBattleAnimArgs
	ldrb r0, [r5]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x2E]
	ldr r2, _080E296C @ =gSprites
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x24]
	ldrh r0, [r0, 0x20]
	adds r1, r0
	strh r1, [r4, 0x20]
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	strh r1, [r4, 0x22]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x24]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x26]
	ldrb r1, [r5, 0x6]
	adds r0, r4, 0
	bl StartSpriteAffineAnim
	ldr r1, _080E2970 @ =move_anim_8074EE0
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	ldr r0, _080E2974 @ =sub_80785E4
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E2968: .4byte gBattleAnimArgs
_080E296C: .4byte gSprites
_080E2970: .4byte move_anim_8074EE0
_080E2974: .4byte sub_80785E4
	thumb_func_end sub_80E2908

	thumb_func_start sub_80E2978
sub_80E2978: @ 80E2978
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080E2990 @ =gBattleAnimArgs
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080E2994
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80787B0
	b _080E299C
	.align 2, 0
_080E2990: .4byte gBattleAnimArgs
_080E2994:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8078764
_080E299C:
	ldr r0, _080E29B4 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x6]
	strh r0, [r4, 0x2E]
	ldr r1, _080E29B8 @ =move_anim_8072740
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	ldr r0, _080E29BC @ =sub_80782D8
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E29B4: .4byte gBattleAnimArgs
_080E29B8: .4byte move_anim_8072740
_080E29BC: .4byte sub_80782D8
	thumb_func_end sub_80E2978

	thumb_func_start sub_80E29C0
sub_80E29C0: @ 80E29C0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080E29E0 @ =gBattleAnimArgs
	ldrb r1, [r4, 0x6]
	bl StartSpriteAffineAnim
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E29E4
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80787B0
	b _080E29EC
	.align 2, 0
_080E29E0: .4byte gBattleAnimArgs
_080E29E4:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8078764
_080E29EC:
	ldr r0, _080E29F8 @ =sub_80E29FC
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E29F8: .4byte sub_80E29FC
	thumb_func_end sub_80E29C0

	thumb_func_start sub_80E29FC
sub_80E29FC: @ 80E29FC
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
	adds r1, r0, 0x1
	strh r1, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _080E2A32
	adds r0, r3, 0
	bl move_anim_8072740
_080E2A32:
	pop {r0}
	bx r0
	thumb_func_end sub_80E29FC

	thumb_func_start sub_80E2A38
sub_80E2A38: @ 80E2A38
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _080E2A78 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r4, r1]
	bl sub_80E1DC4
	adds r6, r0, 0
	ldrh r3, [r4]
	lsls r3, 16
	asrs r0, r3, 23
	movs r4, 0x1
	ands r0, r4
	asrs r1, r3, 24
	ands r1, r4
	asrs r2, r3, 25
	ands r2, r4
	asrs r3, 26
	ands r3, r4
	bl sub_80792C0
	orrs r6, r0
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_80E2C8C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E2A78: .4byte gBattleAnimArgs
	thumb_func_end sub_80E2A38

	thumb_func_start sub_80E2A7C
sub_80E2A7C: @ 80E2A7C
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	mov r1, sp
	movs r0, 0xFF
	strb r0, [r1, 0x1]
	movs r0, 0x1
	bl sub_80E1DC4
	adds r5, r0, 0
	ldr r0, _080E2AA8 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x7
	bhi _080E2B26
	lsls r0, 2
	ldr r1, _080E2AAC @ =_080E2AB0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E2AA8: .4byte gBattleAnimArgs
_080E2AAC: .4byte _080E2AB0
	.align 2, 0
_080E2AB0:
	.4byte _080E2AD2
	.4byte _080E2ADE
	.4byte _080E2AD0
	.4byte _080E2ADC
	.4byte _080E2AEC
	.4byte _080E2B04
	.4byte _080E2B0C
	.4byte _080E2B18
_080E2AD0:
	movs r5, 0
_080E2AD2:
	mov r0, sp
	ldr r1, _080E2AD8 @ =gBattleAnimBankAttacker
	b _080E2AE2
	.align 2, 0
_080E2AD8: .4byte gBattleAnimBankAttacker
_080E2ADC:
	movs r5, 0
_080E2ADE:
	mov r0, sp
	ldr r1, _080E2AE8 @ =gBattleAnimBankTarget
_080E2AE2:
	ldrb r1, [r1]
	strb r1, [r0]
	b _080E2B26
	.align 2, 0
_080E2AE8: .4byte gBattleAnimBankTarget
_080E2AEC:
	mov r1, sp
	ldr r0, _080E2AFC @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080E2B00 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	strb r0, [r1, 0x1]
	b _080E2B26
	.align 2, 0
_080E2AFC: .4byte gBattleAnimBankAttacker
_080E2B00: .4byte gBattleAnimBankTarget
_080E2B04:
	mov r1, sp
	movs r0, 0xFF
	strb r0, [r1]
	b _080E2B26
_080E2B0C:
	movs r5, 0
	mov r2, sp
	ldr r0, _080E2B14 @ =gBattleAnimBankAttacker
	b _080E2B1E
	.align 2, 0
_080E2B14: .4byte gBattleAnimBankAttacker
_080E2B18:
	movs r5, 0
	mov r2, sp
	ldr r0, _080E2B70 @ =gBattleAnimBankTarget
_080E2B1E:
	ldrb r0, [r0]
	movs r1, 0x2
	eors r0, r1
	strb r0, [r2]
_080E2B26:
	movs r4, 0
	mov r6, sp
_080E2B2A:
	ldrb r0, [r6]
	cmp r4, r0
	beq _080E2B54
	ldrb r0, [r6, 0x1]
	cmp r4, r0
	beq _080E2B54
	adds r0, r4, 0
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080E2B54
	adds r0, r4, 0
	bl sub_80793A8
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x80
	lsls r1, 9
	lsls r1, r0
	orrs r5, r1
_080E2B54:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080E2B2A
	adds r0, r7, 0
	adds r1, r5, 0
	bl sub_80E2C8C
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E2B70: .4byte gBattleAnimBankTarget
	thumb_func_end sub_80E2A7C

	thumb_func_start sub_80E2B74
sub_80E2B74: @ 80E2B74
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080E2B98 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	bl sub_80E1DC4
	adds r2, r0, 0
	ldr r0, _080E2B9C @ =gBattleTerrain
	ldrb r0, [r0]
	cmp r0, 0x9
	bhi _080E2C4A
	lsls r0, 2
	ldr r1, _080E2BA0 @ =_080E2BA4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E2B98: .4byte gBattleAnimArgs
_080E2B9C: .4byte gBattleTerrain
_080E2BA0: .4byte _080E2BA4
	.align 2, 0
_080E2BA4:
	.4byte _080E2BCC
	.4byte _080E2BDC
	.4byte _080E2BE8
	.4byte _080E2BF8
	.4byte _080E2C04
	.4byte _080E2C14
	.4byte _080E2C24
	.4byte _080E2C34
	.4byte _080E2C44
	.4byte _080E2C44
_080E2BCC:
	ldr r1, _080E2BD4 @ =gBattleAnimArgs
	ldr r0, _080E2BD8 @ =0x00000b0c
	b _080E2C48
	.align 2, 0
_080E2BD4: .4byte gBattleAnimArgs
_080E2BD8: .4byte 0x00000b0c
_080E2BDC:
	ldr r1, _080E2BE4 @ =gBattleAnimArgs
	movs r0, 0x9E
	lsls r0, 4
	b _080E2C48
	.align 2, 0
_080E2BE4: .4byte gBattleAnimArgs
_080E2BE8:
	ldr r1, _080E2BF0 @ =gBattleAnimArgs
	ldr r0, _080E2BF4 @ =0x00002f1e
	b _080E2C48
	.align 2, 0
_080E2BF0: .4byte gBattleAnimArgs
_080E2BF4: .4byte 0x00002f1e
_080E2BF8:
	ldr r1, _080E2C00 @ =gBattleAnimArgs
	movs r0, 0x90
	lsls r0, 7
	b _080E2C48
	.align 2, 0
_080E2C00: .4byte gBattleAnimArgs
_080E2C04:
	ldr r1, _080E2C0C @ =gBattleAnimArgs
	ldr r0, _080E2C10 @ =0x00007ecb
	b _080E2C48
	.align 2, 0
_080E2C0C: .4byte gBattleAnimArgs
_080E2C10: .4byte 0x00007ecb
_080E2C14:
	ldr r1, _080E2C1C @ =gBattleAnimArgs
	ldr r0, _080E2C20 @ =0x00007ecb
	b _080E2C48
	.align 2, 0
_080E2C1C: .4byte gBattleAnimArgs
_080E2C20: .4byte 0x00007ecb
_080E2C24:
	ldr r1, _080E2C2C @ =gBattleAnimArgs
	ldr r0, _080E2C30 @ =0x00002a16
	b _080E2C48
	.align 2, 0
_080E2C2C: .4byte gBattleAnimArgs
_080E2C30: .4byte 0x00002a16
_080E2C34:
	ldr r1, _080E2C3C @ =gBattleAnimArgs
	ldr r0, _080E2C40 @ =0x00000d2e
	b _080E2C48
	.align 2, 0
_080E2C3C: .4byte gBattleAnimArgs
_080E2C40: .4byte 0x00000d2e
_080E2C44:
	ldr r1, _080E2C58 @ =gBattleAnimArgs
	ldr r0, _080E2C5C @ =0x00007fff
_080E2C48:
	strh r0, [r1, 0x8]
_080E2C4A:
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80E2C8C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E2C58: .4byte gBattleAnimArgs
_080E2C5C: .4byte 0x00007fff
	thumb_func_end sub_80E2B74

	thumb_func_start sub_80E2C60
sub_80E2C60: @ 80E2C60
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080E2C88 @ =gBattleAnimArgs
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r1, 0x1
	lsls r1, r0
	adds r0, r4, 0
	bl sub_80E2C8C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E2C88: .4byte gBattleAnimArgs
	thumb_func_end sub_80E2C60

	thumb_func_start sub_80E2C8C
sub_80E2C8C: @ 80E2C8C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080E2CC4 @ =gTasks
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r3
	strh r1, [r2, 0x8]
	lsrs r1, 16
	strh r1, [r2, 0xA]
	ldr r3, _080E2CC8 @ =gBattleAnimArgs
	ldrh r1, [r3, 0x2]
	strh r1, [r2, 0xC]
	ldrh r1, [r3, 0x4]
	strh r1, [r2, 0xE]
	ldrh r1, [r3, 0x6]
	strh r1, [r2, 0x10]
	ldrh r1, [r3, 0x8]
	strh r1, [r2, 0x12]
	ldrh r1, [r3, 0x4]
	strh r1, [r2, 0x1C]
	ldr r1, _080E2CCC @ =sub_80E2CD0
	str r1, [r2]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080E2CC4: .4byte gTasks
_080E2CC8: .4byte gBattleAnimArgs
_080E2CCC: .4byte sub_80E2CD0
	thumb_func_end sub_80E2C8C

	thumb_func_start sub_80E2CD0
sub_80E2CD0: @ 80E2CD0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0
	ldr r2, _080E2D50 @ =gTasks
	lsls r5, r7, 2
	adds r0, r5, r7
	lsls r0, 3
	adds r3, r0, r2
	ldrh r0, [r3, 0x1A]
	mov r8, r0
	movs r4, 0x1A
	ldrsh r1, [r3, r4]
	movs r4, 0xC
	ldrsh r0, [r3, r4]
	mov r9, r2
	cmp r1, r0
	bne _080E2D66
	strh r6, [r3, 0x1A]
	movs r0, 0x8
	ldrsh r4, [r3, r0]
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	lsls r0, 16
	orrs r4, r0
	mov r8, r5
	cmp r4, 0
	beq _080E2D32
	adds r5, r3, 0
_080E2D10:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080E2D24
	ldrb r2, [r5, 0x1C]
	ldrh r3, [r5, 0x12]
	adds r0, r6, 0
	movs r1, 0x10
	bl BlendPalette
_080E2D24:
	adds r0, r6, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r6, r0, 16
	lsrs r4, 1
	cmp r4, 0
	bne _080E2D10
_080E2D32:
	mov r4, r8
	adds r0, r4, r7
	lsls r0, 3
	mov r1, r9
	adds r2, r0, r1
	ldrh r0, [r2, 0x1C]
	movs r4, 0x1C
	ldrsh r3, [r2, r4]
	movs r4, 0x10
	ldrsh r1, [r2, r4]
	cmp r3, r1
	bge _080E2D54
	adds r0, 0x1
	strh r0, [r2, 0x1C]
	b _080E2D6C
	.align 2, 0
_080E2D50: .4byte gTasks
_080E2D54:
	cmp r3, r1
	ble _080E2D5E
	subs r0, 0x1
	strh r0, [r2, 0x1C]
	b _080E2D6C
_080E2D5E:
	adds r0, r7, 0
	bl DestroyAnimVisualTask
	b _080E2D6C
_080E2D66:
	mov r0, r8
	adds r0, 0x1
	strh r0, [r3, 0x1A]
_080E2D6C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80E2CD0

	thumb_func_start sub_80E2D78
sub_80E2D78: @ 80E2D78
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _080E2DAC @ =gBattleAnimArgs
	ldrb r0, [r4]
	ldrb r1, [r4, 0x2]
	ldrb r2, [r4, 0x4]
	ldrb r3, [r4, 0x6]
	ldrb r4, [r4, 0x8]
	str r4, [sp]
	bl BeginHardwarePaletteFade
	ldr r1, _080E2DB0 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080E2DB4 @ =sub_80E2DB8
	str r1, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E2DAC: .4byte gBattleAnimArgs
_080E2DB0: .4byte gTasks
_080E2DB4: .4byte sub_80E2DB8
	thumb_func_end sub_80E2D78

	thumb_func_start sub_80E2DB8
sub_80E2DB8: @ 80E2DB8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080E2DD4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E2DD0
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080E2DD0:
	pop {r0}
	bx r0
	.align 2, 0
_080E2DD4: .4byte gPaletteFade
	thumb_func_end sub_80E2DB8

	thumb_func_start sub_80E2DD8
sub_80E2DD8: @ 80E2DD8
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080E2E04 @ =gTasks
	adds r1, r0
	ldr r2, _080E2E08 @ =gBattleAnimArgs
	ldrh r0, [r2]
	movs r3, 0
	strh r0, [r1, 0x8]
	strh r3, [r1, 0xA]
	ldrh r0, [r2, 0x2]
	strh r0, [r1, 0xC]
	ldrh r0, [r2, 0x4]
	strh r0, [r1, 0xE]
	ldrh r0, [r2, 0x6]
	strh r0, [r1, 0x10]
	strh r3, [r1, 0x12]
	ldr r0, _080E2E0C @ =sub_80E2E10
	str r0, [r1]
	bx lr
	.align 2, 0
_080E2E04: .4byte gTasks
_080E2E08: .4byte gBattleAnimArgs
_080E2E0C: .4byte sub_80E2E10
	thumb_func_end sub_80E2DD8

	thumb_func_start sub_80E2E10
sub_80E2E10: @ 80E2E10
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r2, r5, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080E2E3C @ =gTasks
	adds r4, r0, r1
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080E2ED4
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080E2E40
	subs r0, r1, 0x1
	strh r0, [r4, 0xA]
	b _080E2EE2
	.align 2, 0
_080E2E3C: .4byte gTasks
_080E2E40:
	ldrb r0, [r4, 0x8]
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	strh r0, [r4, 0x14]
	lsls r0, 16
	cmp r0, 0
	blt _080E2EBE
	ldr r6, _080E2ECC @ =gSprites
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r3, r1, r6
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	movs r2, 0x2
	cmp r0, 0
	beq _080E2E68
	movs r2, 0x1
_080E2E68:
	lsls r2, 2
	ldrb r1, [r3, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, 0x5]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrh r1, [r4, 0xE]
	strh r1, [r0, 0x2E]
	movs r2, 0x14
	ldrsh r1, [r4, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r5, [r0, 0x30]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x5
	strh r1, [r0, 0x32]
	movs r2, 0x14
	ldrsh r1, [r4, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r6, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _080E2ED0 @ =sub_80E2EE8
	str r1, [r0]
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
_080E2EBE:
	ldrh r0, [r4, 0x10]
	subs r0, 0x1
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0xC]
	strh r0, [r4, 0xA]
	b _080E2EE2
	.align 2, 0
_080E2ECC: .4byte gSprites
_080E2ED0: .4byte sub_80E2EE8
_080E2ED4:
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E2EE2
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080E2EE2:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80E2E10

	thumb_func_start sub_80E2EE8
sub_80E2EE8: @ 80E2EE8
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080E2EFC
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	b _080E2F20
_080E2EFC:
	ldr r3, _080E2F28 @ =gTasks
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x30
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
	bl obj_delete_but_dont_free_vram
_080E2F20:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E2F28: .4byte gTasks
	thumb_func_end sub_80E2EE8

	thumb_func_start sub_80E2F2C
sub_80E2F2C: @ 80E2F2C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r7, 0
	ldr r0, _080E3038 @ =gUnknown_030042C4
	strh r7, [r0]
	ldr r0, _080E303C @ =gUnknown_03004240
	strh r7, [r0]
	ldr r1, _080E3040 @ =REG_WININ
	ldr r2, _080E3044 @ =0x00003f3f
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _080E3048 @ =0x00003f3d
	adds r0, r3, 0
	strh r0, [r1]
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080E304C @ =REG_BLDCNT
	ldr r2, _080E3050 @ =0x00003f42
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _080E3054 @ =0x00000c08
	adds r0, r3, 0
	strh r0, [r1]
	ldr r4, _080E3058 @ =REG_BG1CNT
	ldrb r1, [r4]
	movs r0, 0x4
	negs r0, r0
	mov r8, r0
	ands r0, r1
	strb r0, [r4]
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080E2FAC
	ldrb r0, [r4]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4]
_080E2FAC:
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _080E3028
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080E3028
	ldr r5, _080E305C @ =gBattleAnimBankAttacker
	ldrb r0, [r5]
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _080E2FDC
	ldrb r0, [r5]
	bl GetBankIdentity
	lsls r0, 24
	cmp r0, 0
	bne _080E3028
_080E2FDC:
	ldrb r0, [r5]
	movs r6, 0x2
	eors r0, r6
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080E3028
	ldr r3, _080E3060 @ =gSprites
	ldr r1, _080E3064 @ =gObjectBankIDs
	ldrb r0, [r5]
	eors r0, r6
	adds r0, r1
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldrb r3, [r2, 0x5]
	lsls r1, r3, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldrb r1, [r4]
	mov r0, r8
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4]
	movs r7, 0x1
_080E3028:
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080E306C
	ldr r0, _080E3068 @ =gSharedMem + 0x19348
	ldrh r4, [r0]
	b _080E30B4
	.align 2, 0
_080E3038: .4byte gUnknown_030042C4
_080E303C: .4byte gUnknown_03004240
_080E3040: .4byte REG_WININ
_080E3044: .4byte 0x00003f3f
_080E3048: .4byte 0x00003f3d
_080E304C: .4byte REG_BLDCNT
_080E3050: .4byte 0x00003f42
_080E3054: .4byte 0x00000c08
_080E3058: .4byte REG_BG1CNT
_080E305C: .4byte gBattleAnimBankAttacker
_080E3060: .4byte gSprites
_080E3064: .4byte gObjectBankIDs
_080E3068: .4byte gSharedMem + 0x19348
_080E306C:
	ldr r4, _080E308C @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080E3098
	ldr r1, _080E3090 @ =gBattlePartyID
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080E3094 @ =gEnemyParty
	b _080E30A8
	.align 2, 0
_080E308C: .4byte gBattleAnimBankAttacker
_080E3090: .4byte gBattlePartyID
_080E3094: .4byte gEnemyParty
_080E3098:
	ldr r1, _080E3160 @ =gBattlePartyID
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080E3164 @ =gPlayerParty
_080E30A8:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
_080E30B4:
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080E3168 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_807A4A0
	lsls r0, 24
	lsrs r4, r0, 24
	mov r0, sp
	bl sub_8078914
	ldr r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0xC]
	ldr r2, _080E316C @ =0x040000d4
	add r0, sp, 0xC
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _080E3170 @ =0x85000400
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _080E3174 @ =gUnknown_08D20A30
	bl LZDecompressVram
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080E3106
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80763FC
_080E3106:
	ldr r0, _080E3178 @ =gUnknown_08D20A14
	ldr r1, [sp]
	bl LZDecompressVram
	ldr r0, _080E317C @ =gUnknown_083DB568
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	adds r1, 0x1
	movs r2, 0x2
	bl LoadPalette
	ldr r2, _080E3180 @ =gUnknown_030042C0
	ldr r0, _080E3184 @ =gSprites
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x20]
	negs r0, r0
	adds r0, 0x20
	strh r0, [r2]
	ldr r2, _080E3188 @ =gUnknown_030041B4
	ldrh r0, [r1, 0x22]
	negs r0, r0
	adds r0, 0x20
	strh r0, [r2]
	ldr r1, _080E318C @ =gTasks
	mov r2, r9
	lsls r0, r2, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	strh r4, [r0, 0x8]
	strh r7, [r0, 0x14]
	ldr r1, _080E3190 @ =sub_80E3194
	str r1, [r0]
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E3160: .4byte gBattlePartyID
_080E3164: .4byte gPlayerParty
_080E3168: .4byte gBattleAnimBankAttacker
_080E316C: .4byte 0x040000d4
_080E3170: .4byte 0x85000400
_080E3174: .4byte gUnknown_08D20A30
_080E3178: .4byte gUnknown_08D20A14
_080E317C: .4byte gUnknown_083DB568
_080E3180: .4byte gUnknown_030042C0
_080E3184: .4byte gSprites
_080E3188: .4byte gUnknown_030041B4
_080E318C: .4byte gTasks
_080E3190: .4byte sub_80E3194
	thumb_func_end sub_80E2F2C

	thumb_func_start sub_80E3194
sub_80E3194: @ 80E3194
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080E32AC @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x1C]
	adds r0, 0x4
	movs r5, 0
	strh r0, [r4, 0x1C]
	ldr r7, _080E32B0 @ =gUnknown_030041B4
	ldrh r2, [r7]
	subs r1, r2, 0x4
	strh r1, [r7]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x40
	bne _080E329E
	strh r5, [r4, 0x1C]
	adds r0, r2, 0
	adds r0, 0x3C
	strh r0, [r7]
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080E329E
	movs r0, 0
	bl sub_8076464
	ldr r0, _080E32B4 @ =gUnknown_030042C4
	strh r5, [r0]
	ldr r0, _080E32B8 @ =gUnknown_03004240
	strh r5, [r0]
	ldr r0, _080E32BC @ =REG_WININ
	ldr r2, _080E32C0 @ =0x00003f3f
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080E3208
	ldr r2, _080E32C4 @ =REG_BG1CNT
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080E3208:
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	eors r0, r1
	strh r0, [r2]
	ldr r0, _080E32C8 @ =REG_BLDCNT
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	movs r0, 0
	bl GetAnimBankSpriteId
	ldr r0, _080E32CC @ =gSprites
	mov r8, r0
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	bl DestroySprite
	mov r0, sp
	bl sub_8078914
	ldr r2, [sp, 0x4]
	str r5, [sp, 0xC]
	ldr r1, _080E32D0 @ =0x040000d4
	add r0, sp, 0xC
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _080E32D4 @ =0x85000200
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r3, 0x14
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	bne _080E3288
	ldr r2, _080E32D8 @ =gObjectBankIDs
	ldr r0, _080E32DC @ =gBattleAnimBankAttacker
	ldrb r1, [r0]
	movs r0, 0x2
	eors r0, r1
	adds r0, r2
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	add r2, r8
	ldrb r3, [r2, 0x5]
	lsls r1, r3, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
_080E3288:
	ldr r2, _080E32C4 @ =REG_BG1CNT
	ldrb r1, [r2, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x1]
	movs r0, 0
	strh r0, [r7]
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080E329E:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E32AC: .4byte gTasks
_080E32B0: .4byte gUnknown_030041B4
_080E32B4: .4byte gUnknown_030042C4
_080E32B8: .4byte gUnknown_03004240
_080E32BC: .4byte REG_WININ
_080E32C0: .4byte 0x00003f3f
_080E32C4: .4byte REG_BG1CNT
_080E32C8: .4byte REG_BLDCNT
_080E32CC: .4byte gSprites
_080E32D0: .4byte 0x040000d4
_080E32D4: .4byte 0x85000200
_080E32D8: .4byte gObjectBankIDs
_080E32DC: .4byte gBattleAnimBankAttacker
	thumb_func_end sub_80E3194

	thumb_func_start sub_80E32E0
sub_80E32E0: @ 80E32E0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r2, 0
	ldr r0, _080E332C @ =gTasks
	mov r12, r0
	ldr r1, _080E3330 @ =sub_80E3338
	mov r8, r1
	lsls r1, r3, 2
	adds r0, r1, r3
	lsls r4, r0, 3
	mov r7, r12
	adds r7, 0x8
	adds r5, r1, 0
	ldr r6, _080E3334 @ =gBattleAnimArgs
_080E3302:
	lsls r0, r2, 1
	adds r1, r0, r4
	adds r1, r7
	adds r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _080E3302
	adds r0, r5, r3
	lsls r0, 3
	add r0, r12
	mov r1, r8
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E332C: .4byte gTasks
_080E3330: .4byte sub_80E3338
_080E3334: .4byte gBattleAnimArgs
	thumb_func_end sub_80E32E0

	thumb_func_start sub_80E3338
sub_80E3338: @ 80E3338
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r0, 0
	str r0, [sp, 0x1C]
	movs r1, 0
	str r1, [sp, 0x20]
	add r7, sp, 0xC
	ldr r2, _080E3388 @ =gTasks
	mov r3, r9
	lsls r1, r3, 2
	adds r0, r1, r3
	lsls r0, 3
	mov r10, r1
	adds r1, r2, 0
	adds r1, 0x8
	adds r1, r0, r1
	adds r3, r7, 0
	movs r4, 0
	movs r2, 0x7
_080E336C:
	ldrh r0, [r1]
	strh r0, [r3]
	strh r4, [r1]
	adds r1, 0x2
	adds r3, 0x2
	subs r2, 0x1
	cmp r2, 0
	bge _080E336C
	movs r1, 0x4
	ldrsh r0, [r7, r1]
	cmp r0, 0
	bne _080E3390
	ldr r0, _080E338C @ =gBattleAnimBankAttacker
	b _080E3392
	.align 2, 0
_080E3388: .4byte gTasks
_080E338C: .4byte gBattleAnimBankAttacker
_080E3390:
	ldr r0, _080E34B4 @ =gBattleAnimBankTarget
_080E3392:
	ldrb r5, [r0]
	movs r0, 0x2
	mov r8, r5
	mov r2, r8
	eors r2, r0
	mov r8, r2
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080E33BC
	movs r3, 0x6
	ldrsh r0, [r7, r3]
	cmp r0, 0
	beq _080E33C0
	mov r0, r8
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	bne _080E33C0
_080E33BC:
	movs r0, 0
	strh r0, [r7, 0x6]
_080E33C0:
	ldr r0, _080E34B8 @ =gUnknown_030042C4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080E34BC @ =gUnknown_03004240
	strh r1, [r0]
	ldr r1, _080E34C0 @ =REG_WININ
	ldr r2, _080E34C4 @ =0x00003f3f
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _080E34C8 @ =0x00003f3d
	adds r0, r3, 0
	strh r0, [r1]
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080E34CC @ =REG_BLDCNT
	ldr r2, _080E34D0 @ =0x00003f42
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r3, 0x80
	lsls r3, 5
	adds r0, r3, 0
	strh r0, [r1]
	ldr r4, _080E34D4 @ =REG_BG1CNT
	ldrb r1, [r4]
	movs r6, 0x4
	negs r6, r6
	adds r0, r6, 0
	ands r0, r1
	strb r0, [r4]
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080E3432
	ldrb r0, [r4]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4]
_080E3432:
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _080E34A4
	movs r1, 0x6
	ldrsh r0, [r7, r1]
	cmp r0, 0
	bne _080E34A4
	adds r0, r5, 0
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _080E345E
	adds r0, r5, 0
	bl GetBankIdentity
	lsls r0, 24
	cmp r0, 0
	bne _080E34A4
_080E345E:
	mov r0, r8
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080E34A4
	ldr r1, _080E34D8 @ =gSprites
	ldr r0, _080E34DC @ =gObjectBankIDs
	add r0, r8
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldrb r3, [r2, 0x5]
	lsls r1, r3, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldrb r1, [r4]
	adds r0, r6, 0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4]
	movs r2, 0x1
	str r2, [sp, 0x20]
_080E34A4:
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080E34E4
	ldr r0, _080E34E0 @ =gSharedMem + 0x19348
	ldrh r4, [r0]
	b _080E3522
	.align 2, 0
_080E34B4: .4byte gBattleAnimBankTarget
_080E34B8: .4byte gUnknown_030042C4
_080E34BC: .4byte gUnknown_03004240
_080E34C0: .4byte REG_WININ
_080E34C4: .4byte 0x00003f3f
_080E34C8: .4byte 0x00003f3d
_080E34CC: .4byte REG_BLDCNT
_080E34D0: .4byte 0x00003f42
_080E34D4: .4byte REG_BG1CNT
_080E34D8: .4byte gSprites
_080E34DC: .4byte gObjectBankIDs
_080E34E0: .4byte gSharedMem + 0x19348
_080E34E4:
	adds r0, r5, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080E3508
	ldr r1, _080E3500 @ =gBattlePartyID
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080E3504 @ =gEnemyParty
	b _080E3516
	.align 2, 0
_080E3500: .4byte gBattlePartyID
_080E3504: .4byte gEnemyParty
_080E3508:
	ldr r1, _080E3568 @ =gBattlePartyID
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080E356C @ =gPlayerParty
_080E3516:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
_080E3522:
	ldr r6, _080E3570 @ =gObjectBankIDs
	adds r0, r5, r6
	ldrb r1, [r0]
	adds r0, r5, 0
	adds r2, r4, 0
	bl sub_807A4A0
	lsls r0, 24
	lsrs r5, r0, 24
	movs r3, 0x6
	ldrsh r0, [r7, r3]
	cmp r0, 0
	beq _080E3550
	mov r1, r8
	adds r0, r1, r6
	ldrb r1, [r0]
	mov r0, r8
	adds r2, r4, 0
	bl sub_807A4A0
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x1C]
_080E3550:
	mov r0, sp
	bl sub_8078914
	movs r2, 0
	ldrsh r0, [r7, r2]
	cmp r0, 0
	bne _080E3578
	ldr r0, _080E3574 @ =gBattleStatMask1_Tilemap
	ldr r1, [sp, 0x4]
	bl LZDecompressVram
	b _080E3580
	.align 2, 0
_080E3568: .4byte gBattlePartyID
_080E356C: .4byte gPlayerParty
_080E3570: .4byte gObjectBankIDs
_080E3574: .4byte gBattleStatMask1_Tilemap
_080E3578:
	ldr r0, _080E35B0 @ =gBattleStatMask2_Tilemap
	ldr r1, [sp, 0x4]
	bl LZDecompressVram
_080E3580:
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080E3598
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80763FC
_080E3598:
	ldr r0, _080E35B4 @ =gBattleStatMask_Gfx
	ldr r1, [sp]
	bl LZDecompressVram
	ldrh r0, [r7, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bne _080E35BC
	ldr r0, _080E35B8 @ =gBattleStatMask2_Pal
	b _080E35FE
	.align 2, 0
_080E35B0: .4byte gBattleStatMask2_Tilemap
_080E35B4: .4byte gBattleStatMask_Gfx
_080E35B8: .4byte gBattleStatMask2_Pal
_080E35BC:
	cmp r0, 0x1
	bne _080E35C8
	ldr r0, _080E35C4 @ =gBattleStatMask1_Pal
	b _080E35FE
	.align 2, 0
_080E35C4: .4byte gBattleStatMask1_Pal
_080E35C8:
	cmp r0, 0x2
	bne _080E35D4
	ldr r0, _080E35D0 @ =gBattleStatMask3_Pal
	b _080E35FE
	.align 2, 0
_080E35D0: .4byte gBattleStatMask3_Pal
_080E35D4:
	cmp r0, 0x3
	bne _080E35E0
	ldr r0, _080E35DC @ =gBattleStatMask4_Pal
	b _080E35FE
	.align 2, 0
_080E35DC: .4byte gBattleStatMask4_Pal
_080E35E0:
	cmp r0, 0x4
	bne _080E35EC
	ldr r0, _080E35E8 @ =gBattleStatMask6_Pal
	b _080E35FE
	.align 2, 0
_080E35E8: .4byte gBattleStatMask6_Pal
_080E35EC:
	cmp r0, 0x5
	bne _080E35F8
	ldr r0, _080E35F4 @ =gBattleStatMask7_Pal
	b _080E35FE
	.align 2, 0
_080E35F4: .4byte gBattleStatMask7_Pal
_080E35F8:
	cmp r0, 0x6
	bne _080E3610
	ldr r0, _080E360C @ =gBattleStatMask8_Pal
_080E35FE:
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	b _080E361E
	.align 2, 0
_080E360C: .4byte gBattleStatMask8_Pal
_080E3610:
	ldr r0, _080E3644 @ =gBattleStatMask5_Pal
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
_080E361E:
	ldr r2, _080E3648 @ =gUnknown_030042C0
	movs r1, 0
	strh r1, [r2]
	ldr r0, _080E364C @ =gUnknown_030041B4
	strh r1, [r0]
	movs r3, 0
	ldrsh r0, [r7, r3]
	cmp r0, 0x1
	bne _080E3658
	movs r0, 0x40
	strh r0, [r2]
	ldr r2, _080E3650 @ =gTasks
	mov r0, r10
	add r0, r9
	lsls r0, 3
	adds r0, r2
	ldr r1, _080E3654 @ =0x0000fffd
	strh r1, [r0, 0xA]
	b _080E3668
	.align 2, 0
_080E3644: .4byte gBattleStatMask5_Pal
_080E3648: .4byte gUnknown_030042C0
_080E364C: .4byte gUnknown_030041B4
_080E3650: .4byte gTasks
_080E3654: .4byte 0x0000fffd
_080E3658:
	ldr r0, _080E3680 @ =gTasks
	mov r1, r10
	add r1, r9
	lsls r1, 3
	adds r1, r0
	movs r2, 0x3
	strh r2, [r1, 0xA]
	adds r2, r0, 0
_080E3668:
	movs r1, 0x8
	ldrsh r0, [r7, r1]
	cmp r0, 0
	bne _080E3684
	mov r0, r10
	add r0, r9
	lsls r0, 3
	adds r0, r2
	movs r1, 0xA
	strh r1, [r0, 0x10]
	movs r1, 0x14
	b _080E3692
	.align 2, 0
_080E3680: .4byte gTasks
_080E3684:
	mov r0, r10
	add r0, r9
	lsls r0, 3
	adds r0, r2
	movs r1, 0xD
	strh r1, [r0, 0x10]
	movs r1, 0x1E
_080E3692:
	strh r1, [r0, 0x12]
	mov r1, r10
	add r1, r9
	lsls r1, 3
	adds r1, r2
	strh r5, [r1, 0x8]
	ldrh r0, [r7, 0x6]
	strh r0, [r1, 0xC]
	mov r2, sp
	ldrh r2, [r2, 0x1C]
	strh r2, [r1, 0xE]
	mov r3, sp
	ldrh r3, [r3, 0x20]
	strh r3, [r1, 0x14]
	ldr r0, _080E36D8 @ =gObjectBankIDs
	add r0, r8
	ldrb r0, [r0]
	strh r0, [r1, 0x16]
	ldr r0, _080E36DC @ =sub_80E3704
	str r0, [r1]
	movs r1, 0
	ldrsh r0, [r7, r1]
	cmp r0, 0
	bne _080E36E0
	movs r0, 0x40
	negs r0, r0
	bl sub_8077094
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xEF
	bl PlaySE12WithPanning
	b _080E36F4
	.align 2, 0
_080E36D8: .4byte gObjectBankIDs
_080E36DC: .4byte sub_80E3704
_080E36E0:
	movs r0, 0x40
	negs r0, r0
	bl sub_8077094
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xF5
	bl PlaySE12WithPanning
_080E36F4:
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80E3338

	thumb_func_start sub_80E3704
sub_80E3704: @ 80E3704
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, _080E3730 @ =gUnknown_030041B4
	ldr r1, _080E3734 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0xA]
	ldrh r1, [r2]
	adds r0, r1
	strh r0, [r2]
	movs r3, 0x26
	ldrsh r2, [r4, r3]
	cmp r2, 0x1
	beq _080E3774
	cmp r2, 0x1
	bgt _080E3738
	cmp r2, 0
	beq _080E373E
	b _080E3866
	.align 2, 0
_080E3730: .4byte gUnknown_030041B4
_080E3734: .4byte gTasks
_080E3738:
	cmp r2, 0x2
	beq _080E378E
	b _080E3866
_080E373E:
	ldrh r0, [r4, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1E]
	lsls r0, 16
	cmp r0, 0
	bgt _080E374C
	b _080E3866
_080E374C:
	strh r2, [r4, 0x1E]
	ldrh r1, [r4, 0x20]
	adds r1, 0x1
	strh r1, [r4, 0x20]
	ldr r2, _080E3770 @ =REG_BLDALPHA
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r0, 0x20
	ldrsh r1, [r4, r0]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080E3866
	b _080E3786
	.align 2, 0
_080E3770: .4byte REG_BLDALPHA
_080E3774:
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x12
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bne _080E3866
_080E3786:
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
	b _080E3866
_080E378E:
	ldrh r0, [r4, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1E]
	lsls r0, 16
	cmp r0, 0
	ble _080E3866
	movs r0, 0
	strh r0, [r4, 0x1E]
	ldrh r1, [r4, 0x20]
	subs r1, 0x1
	strh r1, [r4, 0x20]
	ldr r7, _080E386C @ =REG_BLDALPHA
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r7]
	movs r0, 0x20
	ldrsh r5, [r4, r0]
	cmp r5, 0
	bne _080E3866
	movs r0, 0
	bl sub_8076464
	ldr r0, _080E3870 @ =gUnknown_030042C4
	strh r5, [r0]
	ldr r0, _080E3874 @ =gUnknown_03004240
	strh r5, [r0]
	ldr r0, _080E3878 @ =REG_WININ
	ldr r2, _080E387C @ =0x00003f3f
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080E37E8
	ldr r2, _080E3880 @ =REG_BG1CNT
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080E37E8:
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	eors r0, r1
	strh r0, [r2]
	ldr r0, _080E3884 @ =REG_BLDCNT
	strh r5, [r0]
	strh r5, [r7]
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _080E3888 @ =gSprites
	adds r0, r5
	bl DestroySprite
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080E3828
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
_080E3828:
	movs r3, 0x14
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	bne _080E3854
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	ldrb r3, [r2, 0x5]
	lsls r1, r3, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
_080E3854:
	ldr r2, _080E3880 @ =REG_BG1CNT
	ldrb r1, [r2, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x1]
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080E3866:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E386C: .4byte REG_BLDALPHA
_080E3870: .4byte gUnknown_030042C4
_080E3874: .4byte gUnknown_03004240
_080E3878: .4byte REG_WININ
_080E387C: .4byte 0x00003f3f
_080E3880: .4byte REG_BG1CNT
_080E3884: .4byte REG_BLDCNT
_080E3888: .4byte gSprites
	thumb_func_end sub_80E3704

	thumb_func_start sub_80E388C
sub_80E388C: @ 80E388C
	push {r4-r6,lr}
	sub sp, 0xC
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x1
	bl sub_80792C0
	adds r6, r0, 0
	movs r1, 0
	bl sub_80E39BC
	ldr r0, _080E38EC @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	lsrs r0, r6, 16
	movs r5, 0
	strh r0, [r4, 0x24]
	str r5, [sp]
	str r5, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80791A8
	adds r6, r0, 0
	ldr r1, _080E38F0 @ =0x0000ffff
	ands r6, r1
	adds r0, r6, 0
	bl sub_80E39BC
	strh r6, [r4, 0x26]
	strh r5, [r4, 0x8]
	strh r5, [r4, 0xA]
	ldr r0, _080E38F4 @ =sub_80E38F8
	str r0, [r4]
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E38EC: .4byte gTasks
_080E38F0: .4byte 0x0000ffff
_080E38F4: .4byte sub_80E38F8
	thumb_func_end sub_80E388C

	thumb_func_start sub_80E38F8
sub_80E38F8: @ 80E38F8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080E391C @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	cmp r1, 0x1
	beq _080E393C
	cmp r1, 0x1
	bgt _080E3920
	cmp r1, 0
	beq _080E3926
	b _080E39B6
	.align 2, 0
_080E391C: .4byte gTasks
_080E3920:
	cmp r1, 0x2
	beq _080E39B0
	b _080E39B6
_080E3926:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	ble _080E39B6
	strh r1, [r4, 0xA]
	movs r0, 0x10
	strh r0, [r4, 0xC]
	b _080E39A4
_080E393C:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080E39B6
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	movs r5, 0
	movs r6, 0x1
_080E3958:
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	asrs r0, r5
	ands r0, r6
	cmp r0, 0
	beq _080E3972
	lsls r0, r5, 20
	lsrs r0, 16
	ldrb r2, [r4, 0xC]
	movs r1, 0x10
	ldr r3, _080E39AC @ =0x0000ffff
	bl BlendPalette
_080E3972:
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	asrs r0, r5
	ands r0, r6
	cmp r0, 0
	beq _080E3992
	lsls r0, r5, 20
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	ldrb r2, [r4, 0xC]
	movs r1, 0x10
	movs r3, 0
	bl BlendPalette
_080E3992:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0xF
	bls _080E3958
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E39B6
_080E39A4:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080E39B6
	.align 2, 0
_080E39AC: .4byte 0x0000ffff
_080E39B0:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080E39B6:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80E38F8

	thumb_func_start sub_80E39BC
sub_80E39BC: @ 80E39BC
	push {r4-r6,lr}
	adds r3, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	movs r2, 0
_080E39C6:
	movs r0, 0x1
	ands r0, r3
	lsrs r4, r3, 1
	adds r5, r2, 0x1
	cmp r0, 0
	beq _080E39F2
	lsls r0, r2, 20
	lsrs r2, r0, 16
	adds r0, r2, 0
	adds r0, 0x10
	cmp r2, r0
	bge _080E39F2
	ldr r1, _080E3A04 @ =gPlttBufferFaded
	adds r3, r0, 0
_080E39E2:
	lsls r0, r2, 1
	adds r0, r1
	strh r6, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r3
	blt _080E39E2
_080E39F2:
	adds r3, r4, 0
	lsls r0, r5, 16
	lsrs r2, r0, 16
	cmp r2, 0x1F
	bls _080E39C6
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E3A04: .4byte gPlttBufferFaded
	thumb_func_end sub_80E39BC

	thumb_func_start sub_80E3A08
sub_80E3A08: @ 80E3A08
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	movs r2, 0
	ldr r0, _080E3A50 @ =gBattleAnimBankAttacker
	ldrb r3, [r0]
	movs r5, 0x1
_080E3A18:
	cmp r3, r2
	beq _080E3A26
	adds r1, r2, 0
	adds r1, 0x10
	adds r0, r5, 0
	lsls r0, r1
	orrs r4, r0
_080E3A26:
	adds r2, 0x1
	cmp r2, 0x3
	bls _080E3A18
	movs r2, 0x5
	ldr r0, _080E3A54 @ =gBattleAnimArgs
	adds r1, r0, 0
	adds r1, 0x8
_080E3A34:
	ldrh r0, [r1]
	strh r0, [r1, 0x2]
	subs r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bne _080E3A34
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_80E2C8C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E3A50: .4byte gBattleAnimBankAttacker
_080E3A54: .4byte gBattleAnimArgs
	thumb_func_end sub_80E3A08

	thumb_func_start sub_80E3A58
sub_80E3A58: @ 80E3A58
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0
	bl sub_80789D4
	ldr r0, _080E3AC0 @ =sub_80E3AD0
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080E3AC4 @ =gBattleAnimArgs
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080E3A94
	ldr r0, _080E3AC8 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080E3A94
	ldrh r0, [r4]
	negs r0, r0
	strh r0, [r4]
	ldrh r0, [r4, 0x2]
	negs r0, r0
	strh r0, [r4, 0x2]
_080E3A94:
	ldr r0, _080E3ACC @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r2, _080E3AC4 @ =gBattleAnimArgs
	ldrh r0, [r2]
	strh r0, [r1, 0xA]
	ldrh r0, [r2, 0x2]
	strh r0, [r1, 0xC]
	ldrh r0, [r2, 0x6]
	strh r0, [r1, 0xE]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	adds r0, r6, 0
	bl DestroyAnimVisualTask
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E3AC0: .4byte sub_80E3AD0
_080E3AC4: .4byte gBattleAnimArgs
_080E3AC8: .4byte gBattleAnimBankAttacker
_080E3ACC: .4byte gTasks
	thumb_func_end sub_80E3A58

	thumb_func_start sub_80E3AD0
sub_80E3AD0: @ 80E3AD0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080E3B3C @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r3, [r1, 0xA]
	ldrh r0, [r1, 0x1C]
	adds r3, r0
	movs r4, 0
	mov r12, r4
	strh r3, [r1, 0x1C]
	ldrh r2, [r1, 0xC]
	ldrh r7, [r1, 0x1E]
	adds r2, r7
	strh r2, [r1, 0x1E]
	ldr r6, _080E3B40 @ =gUnknown_030041B0
	lsls r0, r3, 16
	asrs r0, 24
	ldrh r4, [r6]
	adds r0, r4
	strh r0, [r6]
	ldr r4, _080E3B44 @ =gUnknown_030041B8
	lsls r0, r2, 16
	asrs r0, 24
	ldrh r7, [r4]
	adds r0, r7
	strh r0, [r4]
	movs r0, 0xFF
	ands r3, r0
	strh r3, [r1, 0x1C]
	ands r2, r0
	strh r2, [r1, 0x1E]
	ldr r0, _080E3B48 @ =gBattleAnimArgs
	movs r3, 0xE
	ldrsh r2, [r0, r3]
	movs r7, 0xE
	ldrsh r0, [r1, r7]
	cmp r2, r0
	bne _080E3B36
	mov r0, r12
	strh r0, [r6]
	strh r0, [r4]
	movs r0, 0x1
	bl sub_80789D4
	adds r0, r5, 0
	bl DestroyTask
_080E3B36:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E3B3C: .4byte gTasks
_080E3B40: .4byte gUnknown_030041B0
_080E3B44: .4byte gUnknown_030041B8
_080E3B48: .4byte gBattleAnimArgs
	thumb_func_end sub_80E3AD0

	thumb_func_start sub_80E3B4C
sub_80E3B4C: @ 80E3B4C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080E3B70 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	ldr r1, _080E3B74 @ =gBattleAnimArgs
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0xE]
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E3B70: .4byte gBattleAnimBankAttacker
_080E3B74: .4byte gBattleAnimArgs
	thumb_func_end sub_80E3B4C

	thumb_func_start sub_80E3B78
sub_80E3B78: @ 80E3B78
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080E3B9C @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	bl GetBankSide
	ldr r1, _080E3BA0 @ =gBattleAnimArgs
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0xE]
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E3B9C: .4byte gBattleAnimBankTarget
_080E3BA0: .4byte gBattleAnimArgs
	thumb_func_end sub_80E3B78

	thumb_func_start sub_80E3BA4
sub_80E3BA4: @ 80E3BA4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r5, _080E3BD0 @ =gBattleAnimArgs
	movs r4, 0
	ldr r0, _080E3BD4 @ =gBattleAnimBankAttacker
	ldrb r2, [r0]
	movs r0, 0x2
	ldr r1, _080E3BD8 @ =gBattleAnimBankTarget
	eors r0, r2
	ldrb r1, [r1]
	cmp r0, r1
	bne _080E3BC0
	movs r4, 0x1
_080E3BC0:
	strh r4, [r5, 0xE]
	adds r0, r3, 0
	bl DestroyAnimVisualTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E3BD0: .4byte gBattleAnimArgs
_080E3BD4: .4byte gBattleAnimBankAttacker
_080E3BD8: .4byte gBattleAnimBankTarget
	thumb_func_end sub_80E3BA4

	thumb_func_start sub_80E3BDC
sub_80E3BDC: @ 80E3BDC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r6, _080E3C3C @ =gSprites
_080E3BE6:
	ldr r0, _080E3C40 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	cmp r4, r0
	beq _080E3C24
	lsls r0, r4, 24
	lsrs r0, 24
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080E3C24
	ldr r0, _080E3C44 @ =gObjectBankIDs
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r6
	ldr r1, _080E3C48 @ =gBattleAnimArgs
	adds r2, 0x3E
	movs r0, 0x1
	ldrb r3, [r1]
	ands r3, r0
	lsls r3, 2
	ldrb r0, [r2]
	movs r7, 0x5
	negs r7, r7
	adds r1, r7, 0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
_080E3C24:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _080E3BE6
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E3C3C: .4byte gSprites
_080E3C40: .4byte gBattleAnimBankAttacker
_080E3C44: .4byte gObjectBankIDs
_080E3C48: .4byte gBattleAnimArgs
	thumb_func_end sub_80E3BDC

	thumb_func_start sub_80E3C4C
sub_80E3C4C: @ 80E3C4C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	ldr r1, [sp, 0x3C]
	ldr r4, [sp, 0x40]
	ldr r5, [sp, 0x44]
	ldr r6, [sp, 0x48]
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r2, 16
	lsrs r2, 16
	str r2, [sp, 0xC]
	lsls r3, 24
	lsrs r7, r3, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp, 0x10]
	lsls r5, 24
	lsrs r5, 24
	str r5, [sp, 0x14]
	lsls r6, 24
	lsrs r6, 24
	mov r10, r6
	movs r0, 0
	str r0, [sp, 0x18]
	movs r0, 0x2
	adds r6, r7, 0
	eors r6, r0
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080E3CAE
	mov r1, r8
	cmp r1, 0
	beq _080E3CB2
	adds r0, r6, 0
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	bne _080E3CB2
_080E3CAE:
	movs r2, 0
	mov r8, r2
_080E3CB2:
	ldr r0, _080E3D34 @ =gUnknown_030042C4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080E3D38 @ =gUnknown_03004240
	strh r1, [r0]
	ldr r1, _080E3D3C @ =REG_WININ
	ldr r3, _080E3D40 @ =0x00003f3f
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080E3D44 @ =0x00003f3d
	adds r0, r2, 0
	strh r0, [r1]
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080E3D48 @ =REG_BLDCNT
	ldr r2, _080E3D4C @ =0x00003f42
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r3, 0x80
	lsls r3, 5
	adds r0, r3, 0
	strh r0, [r1]
	ldr r4, _080E3D50 @ =REG_BG1CNT
	ldrb r1, [r4]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080E3D22
	ldrb r0, [r4]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4]
_080E3D22:
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080E3D58
	ldr r0, _080E3D54 @ =gSharedMem + 0x19348
	ldrh r4, [r0]
	b _080E3D96
	.align 2, 0
_080E3D34: .4byte gUnknown_030042C4
_080E3D38: .4byte gUnknown_03004240
_080E3D3C: .4byte REG_WININ
_080E3D40: .4byte 0x00003f3f
_080E3D44: .4byte 0x00003f3d
_080E3D48: .4byte REG_BLDCNT
_080E3D4C: .4byte 0x00003f42
_080E3D50: .4byte REG_BG1CNT
_080E3D54: .4byte gSharedMem + 0x19348
_080E3D58:
	adds r0, r7, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080E3D7C
	ldr r1, _080E3D74 @ =gBattlePartyID
	lsls r0, r7, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080E3D78 @ =gEnemyParty
	b _080E3D8A
	.align 2, 0
_080E3D74: .4byte gBattlePartyID
_080E3D78: .4byte gEnemyParty
_080E3D7C:
	ldr r1, _080E3E48 @ =gBattlePartyID
	lsls r0, r7, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080E3E4C @ =gPlayerParty
_080E3D8A:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
_080E3D96:
	ldr r5, _080E3E50 @ =gObjectBankIDs
	adds r0, r7, r5
	ldrb r1, [r0]
	adds r0, r7, 0
	adds r2, r4, 0
	bl sub_807A4A0
	lsls r0, 24
	lsrs r7, r0, 24
	mov r0, r8
	cmp r0, 0
	beq _080E3DC0
	adds r0, r6, r5
	ldrb r1, [r0]
	adds r0, r6, 0
	adds r2, r4, 0
	bl sub_807A4A0
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x18]
_080E3DC0:
	mov r0, sp
	bl sub_8078914
	ldr r1, [sp, 0x4]
	ldr r0, [sp, 0x50]
	bl LZDecompressVram
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080E3DE6
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80763FC
_080E3DE6:
	ldr r1, [sp]
	ldr r0, [sp, 0x4C]
	bl LZDecompressVram
	mov r0, sp
	ldrb r1, [r0, 0x8]
	lsls r1, 4
	ldr r0, [sp, 0x54]
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r0, _080E3E54 @ =gUnknown_030042C0
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080E3E58 @ =gUnknown_030041B4
	strh r1, [r0]
	ldr r1, _080E3E5C @ =gTasks
	mov r2, r9
	lsls r0, r2, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	mov r3, sp
	ldrh r3, [r3, 0xC]
	strh r3, [r0, 0xA]
	mov r1, sp
	ldrh r1, [r1, 0x10]
	strh r1, [r0, 0x10]
	mov r2, r10
	strh r2, [r0, 0x12]
	mov r3, sp
	ldrh r3, [r3, 0x14]
	strh r3, [r0, 0x14]
	strh r7, [r0, 0x8]
	mov r1, r8
	strh r1, [r0, 0xC]
	mov r2, sp
	ldrh r2, [r2, 0x18]
	strh r2, [r0, 0xE]
	ldr r1, _080E3E60 @ =sub_80E3E64
	str r1, [r0]
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E3E48: .4byte gBattlePartyID
_080E3E4C: .4byte gPlayerParty
_080E3E50: .4byte gObjectBankIDs
_080E3E54: .4byte gUnknown_030042C0
_080E3E58: .4byte gUnknown_030041B4
_080E3E5C: .4byte gTasks
_080E3E60: .4byte sub_80E3E64
	thumb_func_end sub_80E3C4C

	thumb_func_start sub_80E3E64
sub_80E3E64: @ 80E3E64
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080E3E9C @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r3, r0, r1
	movs r0, 0xA
	ldrsh r2, [r3, r0]
	adds r5, r1, 0
	cmp r2, 0
	bge _080E3E80
	negs r2, r2
_080E3E80:
	ldrh r0, [r3, 0x22]
	adds r4, r0, r2
	strh r4, [r3, 0x22]
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bge _080E3EA4
	ldr r2, _080E3EA0 @ =gUnknown_030041B4
	lsls r1, r4, 16
	asrs r1, 24
	ldrh r0, [r2]
	subs r0, r1
	strh r0, [r2]
	b _080E3EB0
	.align 2, 0
_080E3E9C: .4byte gTasks
_080E3EA0: .4byte gUnknown_030041B4
_080E3EA4:
	ldr r1, _080E3ED4 @ =gUnknown_030041B4
	lsls r0, r4, 16
	asrs r0, 24
	ldrh r2, [r1]
	adds r0, r2
	strh r0, [r1]
_080E3EB0:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r5
	ldrh r1, [r4, 0x22]
	movs r0, 0xFF
	ands r0, r1
	movs r2, 0
	strh r0, [r4, 0x22]
	movs r3, 0x26
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	beq _080E3F18
	cmp r0, 0x1
	bgt _080E3ED8
	cmp r0, 0
	beq _080E3EDE
	b _080E3FE2
	.align 2, 0
_080E3ED4: .4byte gUnknown_030041B4
_080E3ED8:
	cmp r0, 0x2
	beq _080E3F32
	b _080E3FE2
_080E3EDE:
	ldrh r0, [r4, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1E]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x14
	ldrsh r1, [r4, r3]
	cmp r0, r1
	blt _080E3FE2
	strh r2, [r4, 0x1E]
	ldrh r1, [r4, 0x20]
	adds r1, 0x1
	strh r1, [r4, 0x20]
	ldr r2, _080E3F14 @ =REG_BLDALPHA
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r0, 0x20
	ldrsh r1, [r4, r0]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080E3FE2
	b _080E3F2A
	.align 2, 0
_080E3F14: .4byte REG_BLDALPHA
_080E3F18:
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x12
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bne _080E3FE2
_080E3F2A:
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
	b _080E3FE2
_080E3F32:
	ldrh r0, [r4, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1E]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x14
	ldrsh r1, [r4, r3]
	cmp r0, r1
	blt _080E3FE2
	strh r2, [r4, 0x1E]
	ldrh r1, [r4, 0x20]
	subs r1, 0x1
	strh r1, [r4, 0x20]
	ldr r7, _080E3FE8 @ =REG_BLDALPHA
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r7]
	movs r0, 0x20
	ldrsh r5, [r4, r0]
	cmp r5, 0
	bne _080E3FE2
	movs r0, 0
	bl sub_8076464
	ldr r0, _080E3FEC @ =gUnknown_030042C4
	strh r5, [r0]
	ldr r0, _080E3FF0 @ =gUnknown_03004240
	strh r5, [r0]
	ldr r0, _080E3FF4 @ =REG_WININ
	ldr r2, _080E3FF8 @ =0x00003f3f
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080E3F90
	ldr r2, _080E3FFC @ =REG_BG1CNT
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080E3F90:
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	eors r0, r1
	strh r0, [r2]
	ldr r0, _080E4000 @ =REG_BLDCNT
	strh r5, [r0]
	strh r5, [r7]
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _080E4004 @ =gSprites
	adds r0, r5
	bl DestroySprite
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080E3FD0
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
_080E3FD0:
	ldr r2, _080E3FFC @ =REG_BG1CNT
	ldrb r1, [r2, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x1]
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080E3FE2:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E3FE8: .4byte REG_BLDALPHA
_080E3FEC: .4byte gUnknown_030042C4
_080E3FF0: .4byte gUnknown_03004240
_080E3FF4: .4byte REG_WININ
_080E3FF8: .4byte 0x00003f3f
_080E3FFC: .4byte REG_BG1CNT
_080E4000: .4byte REG_BLDCNT
_080E4004: .4byte gSprites
	thumb_func_end sub_80E3E64

	thumb_func_start sub_80E4008
sub_80E4008: @ 80E4008
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E4020 @ =gBattleAnimArgs
	ldr r1, _080E4024 @ =gBattleTerrain
	ldrb r1, [r1]
	strh r1, [r2]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080E4020: .4byte gBattleAnimArgs
_080E4024: .4byte gBattleTerrain
	thumb_func_end sub_80E4008

	thumb_func_start sub_80E4028
sub_80E4028: @ 80E4028
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	ldr r0, _080E4068 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080E406C
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80791A8
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080E4084
	movs r2, 0x1
_080E405A:
	lsrs r1, 1
	adds r4, 0x1
	adds r0, r1, 0
	ands r0, r2
	cmp r0, 0
	beq _080E405A
	b _080E4084
	.align 2, 0
_080E4068: .4byte gBattleAnimArgs
_080E406C:
	cmp r0, 0x1
	bne _080E4078
	ldr r0, _080E4074 @ =gBattleAnimBankAttacker
	b _080E407E
	.align 2, 0
_080E4074: .4byte gBattleAnimBankAttacker
_080E4078:
	cmp r0, 0x2
	bne _080E4084
	ldr r0, _080E409C @ =gBattleAnimBankTarget
_080E407E:
	ldrb r0, [r0]
	adds r4, r0, 0
	adds r4, 0x10
_080E4084:
	ldr r0, _080E40A0 @ =gBattleAnimArgs
	movs r1, 0x2
	ldrsh r0, [r0, r1]
	lsls r5, r0, 5
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080E40A8
	ldr r0, _080E40A4 @ =gSharedMem + 0x14800
	b _080E40AA
	.align 2, 0
_080E409C: .4byte gBattleAnimBankTarget
_080E40A0: .4byte gBattleAnimArgs
_080E40A4: .4byte gSharedMem + 0x14800
_080E40A8:
	ldr r0, _080E40C8 @ =gSharedMem + 0x18000
_080E40AA:
	adds r2, r5, r0
	lsls r1, r4, 5
	ldr r0, _080E40CC @ =gPlttBufferUnfaded
	adds r1, r0
	adds r0, r2, 0
	movs r2, 0x20
	bl memcpy
	adds r0, r6, 0
	bl DestroyAnimVisualTask
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E40C8: .4byte gSharedMem + 0x18000
_080E40CC: .4byte gPlttBufferUnfaded
	thumb_func_end sub_80E4028

	thumb_func_start sub_80E40D0
sub_80E40D0: @ 80E40D0
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	ldr r0, _080E4110 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080E4114
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80791A8
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080E412C
	movs r2, 0x1
_080E4102:
	lsrs r1, 1
	adds r4, 0x1
	adds r0, r1, 0
	ands r0, r2
	cmp r0, 0
	beq _080E4102
	b _080E412C
	.align 2, 0
_080E4110: .4byte gBattleAnimArgs
_080E4114:
	cmp r0, 0x1
	bne _080E4120
	ldr r0, _080E411C @ =gBattleAnimBankAttacker
	b _080E4126
	.align 2, 0
_080E411C: .4byte gBattleAnimBankAttacker
_080E4120:
	cmp r0, 0x2
	bne _080E412C
	ldr r0, _080E4148 @ =gBattleAnimBankTarget
_080E4126:
	ldrb r0, [r0]
	adds r4, r0, 0
	adds r4, 0x10
_080E412C:
	lsls r1, r4, 5
	ldr r0, _080E414C @ =gPlttBufferUnfaded
	adds r5, r1, r0
	ldr r0, _080E4150 @ =gBattleAnimArgs
	movs r1, 0x2
	ldrsh r0, [r0, r1]
	lsls r4, r0, 5
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080E4158
	ldr r0, _080E4154 @ =gSharedMem + 0x14800
	b _080E415A
	.align 2, 0
_080E4148: .4byte gBattleAnimBankTarget
_080E414C: .4byte gPlttBufferUnfaded
_080E4150: .4byte gBattleAnimArgs
_080E4154: .4byte gSharedMem + 0x14800
_080E4158:
	ldr r0, _080E4174 @ =gSharedMem + 0x18000
_080E415A:
	adds r1, r4, r0
	adds r0, r5, 0
	movs r2, 0x20
	bl memcpy
	adds r0, r6, 0
	bl DestroyAnimVisualTask
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E4174: .4byte gSharedMem + 0x18000
	thumb_func_end sub_80E40D0

	thumb_func_start sub_80E4178
sub_80E4178: @ 80E4178
	push {r4,r5,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _080E41B8 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080E41BC
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80791A8
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080E41D4
	movs r2, 0x1
_080E41AA:
	lsrs r1, 1
	adds r4, 0x1
	adds r0, r1, 0
	ands r0, r2
	cmp r0, 0
	beq _080E41AA
	b _080E41D4
	.align 2, 0
_080E41B8: .4byte gBattleAnimArgs
_080E41BC:
	cmp r0, 0x1
	bne _080E41C8
	ldr r0, _080E41C4 @ =gBattleAnimBankAttacker
	b _080E41CE
	.align 2, 0
_080E41C4: .4byte gBattleAnimBankAttacker
_080E41C8:
	cmp r0, 0x2
	bne _080E41D4
	ldr r0, _080E41F4 @ =gBattleAnimBankTarget
_080E41CE:
	ldrb r0, [r0]
	adds r4, r0, 0
	adds r4, 0x10
_080E41D4:
	lsls r1, r4, 5
	ldr r0, _080E41F8 @ =gPlttBufferUnfaded
	adds r0, r1, r0
	ldr r2, _080E41FC @ =gPlttBufferFaded
	adds r1, r2
	movs r2, 0x20
	bl memcpy
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E41F4: .4byte gBattleAnimBankTarget
_080E41F8: .4byte gPlttBufferUnfaded
_080E41FC: .4byte gPlttBufferFaded
	thumb_func_end sub_80E4178

	thumb_func_start sub_80E4200
sub_80E4200: @ 80E4200
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl NotInBattle
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _080E4220
	ldr r1, _080E421C @ =gBattleAnimArgs
	movs r0, 0x1
	strh r0, [r1, 0xE]
	b _080E4224
	.align 2, 0
_080E421C: .4byte gBattleAnimArgs
_080E4220:
	ldr r0, _080E4230 @ =gBattleAnimArgs
	strh r1, [r0, 0xE]
_080E4224:
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E4230: .4byte gBattleAnimArgs
	thumb_func_end sub_80E4200

	thumb_func_start sub_80E4234
sub_80E4234: @ 80E4234
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E4254 @ =gBattleAnimBankAttacker
	ldr r1, _080E4258 @ =gBankTarget
	ldrb r1, [r1]
	strb r1, [r2]
	ldr r2, _080E425C @ =gBattleAnimBankTarget
	ldr r1, _080E4260 @ =gEffectBank
	ldrb r1, [r1]
	strb r1, [r2]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080E4254: .4byte gBattleAnimBankAttacker
_080E4258: .4byte gBankTarget
_080E425C: .4byte gBattleAnimBankTarget
_080E4260: .4byte gEffectBank
	thumb_func_end sub_80E4234

	thumb_func_start sub_80E4264
sub_80E4264: @ 80E4264
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080E428C @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	adds r4, r0, 0
	ldr r0, _080E4290 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	bl GetBankSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080E4298
	ldr r1, _080E4294 @ =gBattleAnimArgs
	movs r0, 0x1
	b _080E429C
	.align 2, 0
_080E428C: .4byte gBattleAnimBankAttacker
_080E4290: .4byte gBattleAnimBankTarget
_080E4294: .4byte gBattleAnimArgs
_080E4298:
	ldr r1, _080E42AC @ =gBattleAnimArgs
	movs r0, 0
_080E429C:
	strh r0, [r1, 0xE]
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E42AC: .4byte gBattleAnimArgs
	thumb_func_end sub_80E4264

	thumb_func_start sub_80E42B0
sub_80E42B0: @ 80E42B0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E42C8 @ =gBattleAnimBankTarget
	ldr r1, _080E42CC @ =gBankTarget
	ldrb r1, [r1]
	strb r1, [r2]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080E42C8: .4byte gBattleAnimBankTarget
_080E42CC: .4byte gBankTarget
	thumb_func_end sub_80E42B0

	thumb_func_start sub_80E42D0
sub_80E42D0: @ 80E42D0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E42F0 @ =gBattleAnimBankAttacker
	ldr r1, _080E42F4 @ =gBankAttacker
	ldrb r1, [r1]
	strb r1, [r2]
	ldr r2, _080E42F8 @ =gBattleAnimBankTarget
	ldr r1, _080E42FC @ =gEffectBank
	ldrb r1, [r1]
	strb r1, [r2]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080E42F0: .4byte gBattleAnimBankAttacker
_080E42F4: .4byte gBankAttacker
_080E42F8: .4byte gBattleAnimBankTarget
_080E42FC: .4byte gEffectBank
	thumb_func_end sub_80E42D0

	thumb_func_start sub_80E4300
sub_80E4300: @ 80E4300
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080E4318
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	b _080E434E
_080E4318:
	ldr r0, _080E4354 @ =gTasks
	lsls r3, r4, 2
	adds r3, r4
	lsls r3, 3
	adds r3, r0
	ldr r1, _080E4358 @ =gBattleAnimBankAttacker
	ldrb r0, [r1]
	lsls r0, 2
	ldr r2, _080E435C @ =gSharedMem + 0x17800
	adds r0, r2
	ldr r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	strh r0, [r3, 0x8]
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1]
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _080E4360 @ =sub_80E4368
	str r0, [r3]
	ldr r1, _080E4364 @ =gAnimVisualTaskCount
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_080E434E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E4354: .4byte gTasks
_080E4358: .4byte gBattleAnimBankAttacker
_080E435C: .4byte gSharedMem + 0x17800
_080E4360: .4byte sub_80E4368
_080E4364: .4byte gAnimVisualTaskCount
	thumb_func_end sub_80E4300

	thumb_func_start sub_80E4368
sub_80E4368: @ 80E4368
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080E43B0 @ =gBattleAnimArgs
	movs r2, 0xE
	ldrsh r1, [r0, r2]
	movs r0, 0x80
	lsls r0, 5
	cmp r1, r0
	bne _080E43A8
	ldr r0, _080E43B4 @ =gBattleAnimBankAttacker
	ldrb r3, [r0]
	lsls r3, 2
	ldr r0, _080E43B8 @ =gSharedMem + 0x17800
	adds r3, r0
	ldr r1, _080E43BC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x8]
	movs r1, 0x1
	ands r1, r0
	ldrb r2, [r3]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	adds r0, r4, 0
	bl DestroyTask
_080E43A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E43B0: .4byte gBattleAnimArgs
_080E43B4: .4byte gBattleAnimBankAttacker
_080E43B8: .4byte gSharedMem + 0x17800
_080E43BC: .4byte gTasks
	thumb_func_end sub_80E4368

	thumb_func_start sub_80E43C0
sub_80E43C0: @ 80E43C0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080E43D8 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080E43E0
	ldr r0, _080E43DC @ =sub_80E4C34
	b _080E4408
	.align 2, 0
_080E43D8: .4byte gBattleTypeFlags
_080E43DC: .4byte sub_80E4C34
_080E43E0:
	movs r0, 0x80
	lsls r0, 5
	ands r0, r1
	cmp r0, 0
	beq _080E4400
	ldr r0, _080E43F8 @ =gGameVersion
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080E4400
	movs r4, 0x3
	ldr r0, _080E43FC @ =task00_battle_intro_80BC6C8
	b _080E4408
	.align 2, 0
_080E43F8: .4byte gGameVersion
_080E43FC: .4byte task00_battle_intro_80BC6C8
_080E4400:
	ldr r1, _080E4434 @ =gUnknown_083DB56C
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
_080E4408:
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080E4438 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x8]
	strh r4, [r1, 0xA]
	strh r0, [r1, 0xC]
	strh r0, [r1, 0xE]
	strh r0, [r1, 0x10]
	strh r0, [r1, 0x12]
	strh r0, [r1, 0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E4434: .4byte gUnknown_083DB56C
_080E4438: .4byte gTasks
	thumb_func_end sub_80E43C0

	thumb_func_start sub_80E443C
sub_80E443C: @ 80E443C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	ldr r0, _080E4474 @ =gUnknown_030042C0
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080E4478 @ =gUnknown_030041B4
	strh r1, [r0]
	ldr r0, _080E447C @ =gUnknown_03004288
	strh r1, [r0]
	ldr r0, _080E4480 @ =gUnknown_03004280
	strh r1, [r0]
	ldr r0, _080E4484 @ =REG_BLDCNT
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0xC
	ldr r2, _080E4488 @ =0x00003f3f
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080E4474: .4byte gUnknown_030042C0
_080E4478: .4byte gUnknown_030041B4
_080E447C: .4byte gUnknown_03004288
_080E4480: .4byte gUnknown_03004280
_080E4484: .4byte REG_BLDCNT
_080E4488: .4byte 0x00003f3f
	thumb_func_end sub_80E443C

	thumb_func_start task_battle_intro_80BC47C
task_battle_intro_80BC47C: @ 80E448C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080E44C4 @ =gUnknown_030042C0
	ldrh r0, [r1]
	adds r0, 0x6
	strh r0, [r1]
	ldr r1, _080E44C8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	mov r8, r1
	cmp r0, 0x4
	bls _080E44B8
	b _080E46BE
_080E44B8:
	lsls r0, 2
	ldr r1, _080E44CC @ =_080E44D0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E44C4: .4byte gUnknown_030042C0
_080E44C8: .4byte gTasks
_080E44CC: .4byte _080E44D0
	.align 2, 0
_080E44D0:
	.4byte _080E44E4
	.4byte _080E4514
	.4byte _080E4540
	.4byte _080E4588
	.4byte _080E46B8
_080E44E4:
	ldr r0, _080E44FC @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080E4500
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	add r0, r8
	movs r1, 0x10
	b _080E450A
	.align 2, 0
_080E44FC: .4byte gBattleTypeFlags
_080E4500:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	add r0, r8
	movs r1, 0x1
_080E450A:
	strh r1, [r0, 0xC]
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _080E46BE
_080E4514:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	mov r3, r8
	adds r1, r0, r3
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
	lsls r0, 16
	cmp r0, 0
	beq _080E452C
	b _080E46BE
_080E452C:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r1, _080E453C @ =REG_WININ
	movs r0, 0x3F
	strh r0, [r1]
	b _080E46BE
	.align 2, 0
_080E453C: .4byte REG_WININ
_080E4540:
	ldr r1, _080E457C @ =gUnknown_03004240
	ldrh r0, [r1]
	subs r0, 0xFF
	strh r0, [r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 6
	cmp r0, r1
	beq _080E4558
	b _080E46BE
_080E4558:
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	add r1, r8
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0xF0
	strh r0, [r1, 0xC]
	movs r0, 0x20
	strh r0, [r1, 0xE]
	ldr r2, _080E4580 @ =gUnknown_02024DE8
	ldrh r1, [r2]
	ldr r0, _080E4584 @ =0x0000fffe
	ands r0, r1
	strh r0, [r2]
	b _080E46BE
	.align 2, 0
_080E457C: .4byte gUnknown_03004240
_080E4580: .4byte gUnknown_02024DE8
_080E4584: .4byte 0x0000fffe
_080E4588:
	lsls r0, r4, 2
	adds r1, r0, r4
	lsls r1, 3
	mov r5, r8
	adds r2, r1, r5
	ldrh r3, [r2, 0xE]
	movs r5, 0xE
	ldrsh r1, [r2, r5]
	mov r12, r0
	cmp r1, 0
	beq _080E45A4
	subs r0, r3, 0x1
	strh r0, [r2, 0xE]
	b _080E45D2
_080E45A4:
	movs r1, 0xA
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	bne _080E45C4
	ldr r2, _080E45BC @ =gUnknown_030041B4
	ldrh r1, [r2]
	ldr r0, _080E45C0 @ =0x0000ffb0
	cmp r1, r0
	beq _080E45D2
	subs r0, r1, 0x2
	b _080E45D0
	.align 2, 0
_080E45BC: .4byte gUnknown_030041B4
_080E45C0: .4byte 0x0000ffb0
_080E45C4:
	ldr r2, _080E4690 @ =gUnknown_030041B4
	ldrh r1, [r2]
	ldr r0, _080E4694 @ =0x0000ffc8
	cmp r1, r0
	beq _080E45D2
	subs r0, r1, 0x1
_080E45D0:
	strh r0, [r2]
_080E45D2:
	ldr r2, _080E4698 @ =gUnknown_03004240
	ldrh r1, [r2]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _080E45E6
	ldr r3, _080E469C @ =0xfffffc04
	adds r0, r1, r3
	strh r0, [r2]
_080E45E6:
	mov r5, r12
	adds r0, r5, r4
	lsls r0, 3
	mov r2, r8
	adds r1, r0, r2
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080E45FE
	subs r0, r2, 0x2
	strh r0, [r1, 0xC]
_080E45FE:
	movs r3, 0
	ldr r5, _080E46A0 @ =gUnknown_03004DC0
	mov r9, r5
	ldr r7, _080E46A4 @ =gUnknown_03004DE0
	mov r6, r9
	adds r5, r1, 0
_080E460A:
	lsls r2, r3, 1
	ldrb r1, [r6, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r7
	ldrh r0, [r5, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x4F
	ble _080E460A
	cmp r3, 0x9F
	bgt _080E464E
	ldr r7, _080E46A4 @ =gUnknown_03004DE0
	ldr r6, _080E46A0 @ =gUnknown_03004DC0
	ldr r1, _080E46A8 @ =gTasks
	mov r2, r12
	adds r0, r2, r4
	lsls r0, 3
	adds r5, r0, r1
_080E4634:
	lsls r2, r3, 1
	ldrb r1, [r6, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r7
	ldrh r0, [r5, 0xC]
	negs r0, r0
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x9F
	ble _080E4634
_080E464E:
	mov r3, r12
	adds r0, r3, r4
	lsls r0, 3
	mov r5, r8
	adds r1, r0, r5
	movs r0, 0xC
	ldrsh r2, [r1, r0]
	cmp r2, 0
	bne _080E46BE
	movs r0, 0x3
	mov r3, r9
	strb r0, [r3, 0x15]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	str r2, [sp]
	ldr r1, _080E46AC @ =0x0600e000
	ldr r2, _080E46B0 @ =0x05000200
	mov r0, sp
	bl CpuSet
	ldr r1, _080E46B4 @ =REG_BG1CNT
	movs r5, 0x9C
	lsls r5, 8
	adds r0, r5, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0xBC
	lsls r2, 7
	adds r0, r2, 0
	strh r0, [r1]
	b _080E46BE
	.align 2, 0
_080E4690: .4byte gUnknown_030041B4
_080E4694: .4byte 0x0000ffc8
_080E4698: .4byte gUnknown_03004240
_080E469C: .4byte 0xfffffc04
_080E46A0: .4byte gUnknown_03004DC0
_080E46A4: .4byte gUnknown_03004DE0
_080E46A8: .4byte gTasks
_080E46AC: .4byte 0x0600e000
_080E46B0: .4byte 0x05000200
_080E46B4: .4byte REG_BG1CNT
_080E46B8:
	adds r0, r4, 0
	bl sub_80E443C
_080E46BE:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end task_battle_intro_80BC47C

	thumb_func_start task00_battle_intro_80BC6C8
task00_battle_intro_80BC6C8: @ 80E46CC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080E46F8 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0xA
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0x3
	beq _080E470C
	cmp r0, 0x3
	bgt _080E46FC
	cmp r0, 0x2
	beq _080E4700
	b _080E4714
	.align 2, 0
_080E46F8: .4byte gTasks
_080E46FC:
	cmp r0, 0x4
	bne _080E4714
_080E4700:
	ldr r1, _080E4708 @ =gUnknown_030042C0
	ldrh r0, [r1]
	adds r0, 0x8
	b _080E4712
	.align 2, 0
_080E4708: .4byte gUnknown_030042C0
_080E470C:
	ldr r1, _080E4750 @ =gUnknown_030042C0
	ldrh r0, [r1]
	adds r0, 0x6
_080E4712:
	strh r0, [r1]
_080E4714:
	lsls r0, r5, 2
	adds r1, r0, r5
	lsls r1, 3
	adds r4, r1, r2
	movs r3, 0xA
	ldrsh r1, [r4, r3]
	adds r6, r0, 0
	cmp r1, 0x4
	bne _080E4778
	ldr r7, _080E4754 @ =gUnknown_030041B4
	ldrh r0, [r4, 0x14]
	bl Cos2
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _080E473A
	ldr r1, _080E4758 @ =0x000001ff
	adds r0, r1
_080E473A:
	asrs r0, 9
	subs r0, 0x8
	strh r0, [r7]
	ldrh r1, [r4, 0x14]
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0xB3
	bgt _080E475C
	adds r0, r1, 0x4
	b _080E475E
	.align 2, 0
_080E4750: .4byte gUnknown_030042C0
_080E4754: .4byte gUnknown_030041B4
_080E4758: .4byte 0x000001ff
_080E475C:
	adds r0, r1, 0x6
_080E475E:
	strh r0, [r4, 0x14]
	ldr r2, _080E4794 @ =gTasks
	adds r0, r6, r5
	lsls r0, 3
	adds r3, r0, r2
	movs r4, 0x14
	ldrsh r1, [r3, r4]
	movs r0, 0xB4
	lsls r0, 1
	cmp r1, r0
	bne _080E4778
	movs r0, 0
	strh r0, [r3, 0x14]
_080E4778:
	adds r0, r6, r5
	lsls r0, 3
	adds r0, r2
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0x4
	bls _080E4788
	b _080E4996
_080E4788:
	lsls r0, 2
	ldr r1, _080E4798 @ =_080E479C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E4794: .4byte gTasks
_080E4798: .4byte _080E479C
	.align 2, 0
_080E479C:
	.4byte _080E47B0
	.4byte _080E47E0
	.4byte _080E480C
	.4byte _080E485C
	.4byte _080E4990
_080E47B0:
	ldr r1, _080E47CC @ =gTasks
	adds r0, r6, r5
	lsls r0, 3
	adds r2, r0, r1
	movs r3, 0x10
	strh r3, [r2, 0x10]
	ldr r0, _080E47D0 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080E47D4
	strh r3, [r2, 0xC]
	b _080E47D8
	.align 2, 0
_080E47CC: .4byte gTasks
_080E47D0: .4byte gBattleTypeFlags
_080E47D4:
	movs r0, 0x1
	strh r0, [r2, 0xC]
_080E47D8:
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _080E4996
_080E47E0:
	ldr r0, _080E4804 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
	lsls r0, 16
	cmp r0, 0
	beq _080E47F6
	b _080E4996
_080E47F6:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r1, _080E4808 @ =REG_WININ
	movs r0, 0x3F
	strh r0, [r1]
	b _080E4996
	.align 2, 0
_080E4804: .4byte gTasks
_080E4808: .4byte REG_WININ
_080E480C:
	ldr r1, _080E484C @ =gUnknown_03004240
	ldrh r0, [r1]
	subs r0, 0xFF
	strh r0, [r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 6
	cmp r0, r1
	beq _080E4824
	b _080E4996
_080E4824:
	ldr r0, _080E4850 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0xF0
	strh r0, [r1, 0xC]
	movs r0, 0x20
	strh r0, [r1, 0xE]
	movs r0, 0x1
	strh r0, [r1, 0x12]
	ldr r2, _080E4854 @ =gUnknown_02024DE8
	ldrh r1, [r2]
	ldr r0, _080E4858 @ =0x0000fffe
	ands r0, r1
	strh r0, [r2]
	b _080E4996
	.align 2, 0
_080E484C: .4byte gUnknown_03004240
_080E4850: .4byte gTasks
_080E4854: .4byte gUnknown_02024DE8
_080E4858: .4byte 0x0000fffe
_080E485C:
	adds r0, r6, r5
	lsls r0, 3
	adds r1, r0, r2
	ldrh r3, [r1, 0xE]
	movs r4, 0xE
	ldrsh r0, [r1, r4]
	cmp r0, 0
	beq _080E4898
	subs r0, r3, 0x1
	strh r0, [r1, 0xE]
	lsls r0, 16
	asrs r3, r0, 16
	cmp r3, 0
	bne _080E48B8
	ldr r1, _080E488C @ =REG_BLDCNT
	ldr r4, _080E4890 @ =0x00001842
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0xF
	strh r0, [r1]
	ldr r0, _080E4894 @ =REG_BLDY
	strh r3, [r0]
	b _080E48B8
	.align 2, 0
_080E488C: .4byte REG_BLDCNT
_080E4890: .4byte 0x00001842
_080E4894: .4byte REG_BLDY
_080E4898:
	ldrh r3, [r1, 0x10]
	movs r0, 0x1F
	ands r0, r3
	cmp r0, 0
	beq _080E48B8
	ldrh r0, [r1, 0x12]
	subs r0, 0x1
	strh r0, [r1, 0x12]
	lsls r0, 16
	cmp r0, 0
	bne _080E48B8
	adds r0, r3, 0
	adds r0, 0xFF
	strh r0, [r1, 0x10]
	movs r0, 0x4
	strh r0, [r1, 0x12]
_080E48B8:
	ldr r3, _080E4970 @ =gUnknown_03004240
	ldrh r1, [r3]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _080E48CC
	ldr r4, _080E4974 @ =0xfffffc04
	adds r0, r1, r4
	strh r0, [r3]
_080E48CC:
	adds r0, r6, r5
	lsls r0, 3
	adds r1, r0, r2
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080E48E0
	subs r0, r2, 0x2
	strh r0, [r1, 0xC]
_080E48E0:
	movs r3, 0
	ldr r4, _080E4978 @ =gUnknown_03004DC0
	mov r8, r4
	ldr r0, _080E497C @ =gUnknown_03004DE0
	mov r12, r0
	mov r7, r8
	adds r4, r1, 0
_080E48EE:
	lsls r2, r3, 1
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	add r2, r12
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x4F
	ble _080E48EE
	cmp r3, 0x9F
	bgt _080E4932
	ldr r1, _080E497C @ =gUnknown_03004DE0
	mov r12, r1
	ldr r7, _080E4978 @ =gUnknown_03004DC0
	ldr r1, _080E4980 @ =gTasks
	adds r0, r6, r5
	lsls r0, 3
	adds r4, r0, r1
_080E4918:
	lsls r2, r3, 1
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	add r2, r12
	ldrh r0, [r4, 0xC]
	negs r0, r0
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x9F
	ble _080E4918
_080E4932:
	ldr r1, _080E4980 @ =gTasks
	adds r0, r6, r5
	lsls r0, 3
	adds r1, r0, r1
	movs r3, 0xC
	ldrsh r2, [r1, r3]
	cmp r2, 0
	bne _080E4996
	movs r0, 0x3
	mov r4, r8
	strb r0, [r4, 0x15]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	str r2, [sp]
	ldr r1, _080E4984 @ =0x0600e000
	ldr r2, _080E4988 @ =0x05000200
	mov r0, sp
	bl CpuSet
	ldr r1, _080E498C @ =REG_BG1CNT
	movs r2, 0x9C
	lsls r2, 8
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r3, 0xBC
	lsls r3, 7
	adds r0, r3, 0
	strh r0, [r1]
	b _080E4996
	.align 2, 0
_080E4970: .4byte gUnknown_03004240
_080E4974: .4byte 0xfffffc04
_080E4978: .4byte gUnknown_03004DC0
_080E497C: .4byte gUnknown_03004DE0
_080E4980: .4byte gTasks
_080E4984: .4byte 0x0600e000
_080E4988: .4byte 0x05000200
_080E498C: .4byte REG_BG1CNT
_080E4990:
	adds r0, r5, 0
	bl sub_80E443C
_080E4996:
	ldr r0, _080E49B8 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r2, r1, r0
	movs r4, 0x8
	ldrsh r0, [r2, r4]
	cmp r0, 0x4
	beq _080E49AC
	ldr r1, _080E49BC @ =REG_BLDALPHA
	ldrh r0, [r2, 0x10]
	strh r0, [r1]
_080E49AC:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E49B8: .4byte gTasks
_080E49BC: .4byte REG_BLDALPHA
	thumb_func_end task00_battle_intro_80BC6C8

	thumb_func_start task_battle_intro_anim
task_battle_intro_anim: @ 80E49C0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080E49F4 @ =gUnknown_030042C0
	ldrh r0, [r1]
	adds r0, 0x8
	strh r0, [r1]
	ldr r1, _080E49F8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r5, r1, 0
	cmp r0, 0x4
	bls _080E49EA
	b _080E4C06
_080E49EA:
	lsls r0, 2
	ldr r1, _080E49FC @ =_080E4A00
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E49F4: .4byte gUnknown_030042C0
_080E49F8: .4byte gTasks
_080E49FC: .4byte _080E4A00
	.align 2, 0
_080E4A00:
	.4byte _080E4A14
	.4byte _080E4A6C
	.4byte _080E4A9C
	.4byte _080E4AEC
	.4byte _080E4C00
_080E4A14:
	ldr r1, _080E4A48 @ =REG_BLDCNT
	ldr r3, _080E4A4C @ =0x00001842
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _080E4A50 @ =REG_BLDALPHA
	ldr r6, _080E4A54 @ =0x00000808
	adds r2, r6, 0
	strh r2, [r0]
	adds r1, 0x4
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080E4A58 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r3, r0, r1
	strh r2, [r3, 0x10]
	ldr r0, _080E4A5C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080E4A60
	movs r0, 0x10
	b _080E4A62
	.align 2, 0
_080E4A48: .4byte REG_BLDCNT
_080E4A4C: .4byte 0x00001842
_080E4A50: .4byte REG_BLDALPHA
_080E4A54: .4byte 0x00000808
_080E4A58: .4byte gTasks
_080E4A5C: .4byte gBattleTypeFlags
_080E4A60:
	movs r0, 0x1
_080E4A62:
	strh r0, [r3, 0xC]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	b _080E4C06
_080E4A6C:
	ldr r0, _080E4A94 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
	lsls r0, 16
	cmp r0, 0
	beq _080E4A84
	b _080E4C06
_080E4A84:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r1, _080E4A98 @ =REG_WININ
	movs r0, 0x3F
	strh r0, [r1]
	b _080E4C06
	.align 2, 0
_080E4A94: .4byte gTasks
_080E4A98: .4byte REG_WININ
_080E4A9C:
	ldr r1, _080E4ADC @ =gUnknown_03004240
	ldrh r0, [r1]
	subs r0, 0xFF
	strh r0, [r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 6
	cmp r0, r1
	beq _080E4AB4
	b _080E4C06
_080E4AB4:
	ldr r0, _080E4AE0 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0xF0
	strh r0, [r1, 0xC]
	movs r0, 0x20
	strh r0, [r1, 0xE]
	movs r0, 0x1
	strh r0, [r1, 0x12]
	ldr r2, _080E4AE4 @ =gUnknown_02024DE8
	ldrh r1, [r2]
	ldr r0, _080E4AE8 @ =0x0000fffe
	ands r0, r1
	strh r0, [r2]
	b _080E4C06
	.align 2, 0
_080E4ADC: .4byte gUnknown_03004240
_080E4AE0: .4byte gTasks
_080E4AE4: .4byte gUnknown_02024DE8
_080E4AE8: .4byte 0x0000fffe
_080E4AEC:
	lsls r0, r4, 2
	adds r1, r0, r4
	lsls r1, 3
	adds r2, r1, r5
	ldrh r3, [r2, 0xE]
	movs r6, 0xE
	ldrsh r1, [r2, r6]
	mov r12, r0
	cmp r1, 0
	beq _080E4B06
	subs r0, r3, 0x1
	strh r0, [r2, 0xE]
	b _080E4B26
_080E4B06:
	ldrh r1, [r2, 0x10]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	beq _080E4B26
	ldrh r0, [r2, 0x12]
	subs r0, 0x1
	strh r0, [r2, 0x12]
	lsls r0, 16
	cmp r0, 0
	bne _080E4B26
	adds r0, r1, 0
	adds r0, 0xFF
	strh r0, [r2, 0x10]
	movs r0, 0x6
	strh r0, [r2, 0x12]
_080E4B26:
	ldr r2, _080E4BE0 @ =gUnknown_03004240
	ldrh r1, [r2]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _080E4B3A
	ldr r3, _080E4BE4 @ =0xfffffc04
	adds r0, r1, r3
	strh r0, [r2]
_080E4B3A:
	mov r6, r12
	adds r0, r6, r4
	lsls r0, 3
	adds r1, r0, r5
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080E4B50
	subs r0, r2, 0x2
	strh r0, [r1, 0xC]
_080E4B50:
	movs r3, 0
	ldr r6, _080E4BE8 @ =gUnknown_03004DC0
	mov r8, r6
	ldr r7, _080E4BEC @ =gUnknown_03004DE0
	adds r5, r1, 0
_080E4B5A:
	lsls r2, r3, 1
	ldrb r1, [r6, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r7
	ldrh r0, [r5, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x4F
	ble _080E4B5A
	cmp r3, 0x9F
	bgt _080E4B9E
	ldr r7, _080E4BEC @ =gUnknown_03004DE0
	ldr r6, _080E4BE8 @ =gUnknown_03004DC0
	ldr r1, _080E4BF0 @ =gTasks
	mov r2, r12
	adds r0, r2, r4
	lsls r0, 3
	adds r5, r0, r1
_080E4B84:
	lsls r2, r3, 1
	ldrb r1, [r6, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r7
	ldrh r0, [r5, 0xC]
	negs r0, r0
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x9F
	ble _080E4B84
_080E4B9E:
	ldr r1, _080E4BF0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	movs r3, 0xC
	ldrsh r2, [r1, r3]
	cmp r2, 0
	bne _080E4C06
	movs r0, 0x3
	mov r6, r8
	strb r0, [r6, 0x15]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	str r2, [sp]
	ldr r1, _080E4BF4 @ =0x0600e000
	ldr r2, _080E4BF8 @ =0x05000200
	mov r0, sp
	bl CpuSet
	ldr r1, _080E4BFC @ =REG_BG1CNT
	movs r2, 0x9C
	lsls r2, 8
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r3, 0xBC
	lsls r3, 7
	adds r0, r3, 0
	strh r0, [r1]
	b _080E4C06
	.align 2, 0
_080E4BE0: .4byte gUnknown_03004240
_080E4BE4: .4byte 0xfffffc04
_080E4BE8: .4byte gUnknown_03004DC0
_080E4BEC: .4byte gUnknown_03004DE0
_080E4BF0: .4byte gTasks
_080E4BF4: .4byte 0x0600e000
_080E4BF8: .4byte 0x05000200
_080E4BFC: .4byte REG_BG1CNT
_080E4C00:
	adds r0, r4, 0
	bl sub_80E443C
_080E4C06:
	ldr r0, _080E4C2C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r2, r1, r0
	movs r6, 0x8
	ldrsh r0, [r2, r6]
	cmp r0, 0x4
	beq _080E4C1E
	ldr r1, _080E4C30 @ =REG_BLDALPHA
	ldrh r0, [r2, 0x10]
	strh r0, [r1]
_080E4C1E:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E4C2C: .4byte gTasks
_080E4C30: .4byte REG_BLDALPHA
	thumb_func_end task_battle_intro_anim

	thumb_func_start sub_80E4C34
sub_80E4C34: @ 80E4C34
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080E4C80 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r7, r0, r1
	movs r1, 0x8
	ldrsh r0, [r7, r1]
	cmp r0, 0x1
	ble _080E4CAA
	movs r2, 0x10
	ldrsh r0, [r7, r2]
	cmp r0, 0
	bne _080E4CAA
	ldr r2, _080E4C84 @ =gUnknown_030042C0
	ldrh r1, [r2]
	movs r0, 0x80
	lsls r0, 8
	ands r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	bne _080E4C72
	cmp r1, 0x4F
	bhi _080E4C8C
_080E4C72:
	adds r0, r1, 0x3
	strh r0, [r2]
	ldr r1, _080E4C88 @ =gUnknown_03004288
	ldrh r0, [r1]
	subs r0, 0x3
	strh r0, [r1]
	b _080E4CAA
	.align 2, 0
_080E4C80: .4byte gTasks
_080E4C84: .4byte gUnknown_030042C0
_080E4C88: .4byte gUnknown_03004288
_080E4C8C:
	str r5, [sp]
	ldr r1, _080E4CCC @ =0x0600e000
	ldr r4, _080E4CD0 @ =0x05000200
	mov r0, sp
	adds r2, r4, 0
	bl CpuSet
	str r5, [sp, 0x4]
	add r0, sp, 0x4
	ldr r1, _080E4CD4 @ =0x0600f000
	adds r2, r4, 0
	bl CpuSet
	movs r0, 0x1
	strh r0, [r7, 0x10]
_080E4CAA:
	ldr r0, _080E4CD8 @ =gTasks
	lsls r2, r6, 2
	adds r1, r2, r6
	lsls r1, 3
	adds r1, r0
	movs r3, 0x8
	ldrsh r1, [r1, r3]
	mov r12, r0
	adds r5, r2, 0
	cmp r1, 0x4
	bls _080E4CC2
	b _080E4EBA
_080E4CC2:
	lsls r0, r1, 2
	ldr r1, _080E4CDC @ =_080E4CE0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E4CCC: .4byte 0x0600e000
_080E4CD0: .4byte 0x05000200
_080E4CD4: .4byte 0x0600f000
_080E4CD8: .4byte gTasks
_080E4CDC: .4byte _080E4CE0
	.align 2, 0
_080E4CE0:
	.4byte _080E4CF4
	.4byte _080E4D06
	.4byte _080E4DA8
	.4byte _080E4DEC
	.4byte _080E4EB4
_080E4CF4:
	adds r0, r5, r6
	lsls r0, 3
	add r0, r12
	movs r1, 0x10
	strh r1, [r0, 0xC]
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _080E4EBA
_080E4D06:
	adds r0, r5, r6
	lsls r0, 3
	mov r2, r12
	adds r1, r0, r2
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
	lsls r0, 16
	cmp r0, 0
	beq _080E4D1C
	b _080E4EBA
_080E4D1C:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r5, _080E4D8C @ =gSprites
	ldr r4, _080E4D90 @ =gSharedMem
	ldr r3, _080E4D94 @ =0x0001608a
	adds r6, r4, r3
	ldrb r0, [r6]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r3, [r1, 0x1]
	movs r2, 0xD
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	movs r3, 0x8
	mov r8, r3
	mov r3, r8
	orrs r0, r3
	strb r0, [r1, 0x1]
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r6, r5, 0
	adds r6, 0x1C
	adds r0, r6
	ldr r3, _080E4D98 @ =sub_800FE20
	str r3, [r0]
	ldr r0, _080E4D9C @ =0x0001608b
	adds r4, r0
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0, 0x1]
	ands r2, r1
	mov r1, r8
	orrs r2, r1
	strb r2, [r0, 0x1]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	str r3, [r0]
	ldr r1, _080E4DA0 @ =REG_WININ
	movs r0, 0x3F
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080E4DA4 @ =0x00003f06
	b _080E4E94
	.align 2, 0
_080E4D8C: .4byte gSprites
_080E4D90: .4byte gSharedMem
_080E4D94: .4byte 0x0001608a
_080E4D98: .4byte sub_800FE20
_080E4D9C: .4byte 0x0001608b
_080E4DA0: .4byte REG_WININ
_080E4DA4: .4byte 0x00003f06
_080E4DA8:
	ldr r1, _080E4DE0 @ =gUnknown_03004240
	ldrh r0, [r1]
	subs r0, 0xFF
	strh r0, [r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 6
	cmp r0, r1
	beq _080E4DC0
	b _080E4EBA
_080E4DC0:
	adds r1, r5, r6
	lsls r1, 3
	add r1, r12
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0xF0
	strh r0, [r1, 0xC]
	movs r0, 0x20
	strh r0, [r1, 0xE]
	ldr r2, _080E4DE4 @ =gUnknown_02024DE8
	ldrh r1, [r2]
	ldr r0, _080E4DE8 @ =0x0000fffe
	ands r0, r1
	strh r0, [r2]
	b _080E4EBA
	.align 2, 0
_080E4DE0: .4byte gUnknown_03004240
_080E4DE4: .4byte gUnknown_02024DE8
_080E4DE8: .4byte 0x0000fffe
_080E4DEC:
	ldr r2, _080E4E9C @ =gUnknown_03004240
	ldrh r1, [r2]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _080E4E00
	ldr r3, _080E4EA0 @ =0xfffffc04
	adds r0, r1, r3
	strh r0, [r2]
_080E4E00:
	adds r0, r5, r6
	lsls r0, 3
	mov r2, r12
	adds r1, r0, r2
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080E4E16
	subs r0, r2, 0x2
	strh r0, [r1, 0xC]
_080E4E16:
	movs r3, 0
	ldr r0, _080E4EA4 @ =gUnknown_03004DC0
	mov r9, r0
	ldr r2, _080E4EA8 @ =gUnknown_03004DE0
	mov r8, r2
	mov r7, r9
	adds r4, r1, 0
_080E4E24:
	lsls r2, r3, 1
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	add r2, r8
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x4F
	ble _080E4E24
	cmp r3, 0x9F
	bgt _080E4E68
	ldr r0, _080E4EA8 @ =gUnknown_03004DE0
	mov r8, r0
	ldr r7, _080E4EA4 @ =gUnknown_03004DC0
	ldr r1, _080E4EAC @ =gTasks
	adds r0, r5, r6
	lsls r0, 3
	adds r4, r0, r1
_080E4E4E:
	lsls r2, r3, 1
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	add r2, r8
	ldrh r0, [r4, 0xC]
	negs r0, r0
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x9F
	ble _080E4E4E
_080E4E68:
	adds r0, r5, r6
	lsls r0, 3
	mov r2, r12
	adds r1, r0, r2
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _080E4EBA
	movs r0, 0x3
	mov r2, r9
	strb r0, [r2, 0x15]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r1, _080E4EB0 @ =REG_BG1CNT
	movs r3, 0x9C
	lsls r3, 8
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0xBC
	lsls r2, 7
_080E4E94:
	adds r0, r2, 0
	strh r0, [r1]
	b _080E4EBA
	.align 2, 0
_080E4E9C: .4byte gUnknown_03004240
_080E4EA0: .4byte 0xfffffc04
_080E4EA4: .4byte gUnknown_03004DC0
_080E4EA8: .4byte gUnknown_03004DE0
_080E4EAC: .4byte gTasks
_080E4EB0: .4byte REG_BG1CNT
_080E4EB4:
	adds r0, r6, 0
	bl sub_80E443C
_080E4EBA:
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80E4C34

	thumb_func_start unref_sub_80E4EC8
unref_sub_80E4EC8: @ 80E4EC8
	push {r4,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	movs r4, 0x80
	lsls r4, 7
	str r4, [sp]
	movs r4, 0x1E
	str r4, [sp, 0x4]
	movs r4, 0x1
	str r4, [sp, 0x8]
	bl sub_80E4EF8
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_80E4EC8

	thumb_func_start sub_80E4EF8
sub_80E4EF8: @ 80E4EF8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r9, r1
	adds r4, r2, 0
	ldr r1, [sp, 0x24]
	mov r8, r1
	ldr r1, [sp, 0x28]
	ldr r5, [sp, 0x2C]
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	mov r7, r9
	lsls r7, 24
	adds r0, r7, 0
	lsrs r0, 24
	mov r9, r0
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp]
	mov r3, r8
	lsls r3, 16
	mov r8, r3
	lsrs r6, r3, 16
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r5, 24
	lsrs r5, 24
	adds r0, r4, 0
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E4FCC @ =0x040000d4
	ldr r1, _080E4FD0 @ =gUnknown_081FAF4C
	lsls r4, 2
	adds r4, r1
	ldr r1, _080E4FD4 @ =gBattleMonForms
	adds r0, r1
	ldrb r1, [r0]
	lsls r1, 11
	ldr r0, [r4]
	adds r0, r1
	str r0, [r2]
	movs r0, 0xC0
	lsls r0, 19
	adds r6, r0
	str r6, [r2, 0x4]
	ldr r0, _080E4FD8 @ =0x80000400
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	mov r0, r8
	lsrs r0, 21
	lsls r5, 9
	subs r5, r0, r5
	mov r0, r9
	adds r1, r0, 0
	adds r1, 0x8
	cmp r0, r1
	bge _080E4FBC
	mov r9, r1
	mov r1, r10
	lsls r1, 1
	mov r8, r1
	lsls r7, 11
	mov r12, r7
_080E4F86:
	mov r2, r10
	adds r4, r2, 0
	adds r4, 0x8
	adds r1, r0, 0x1
	cmp r2, r4
	bge _080E4FB6
	ldr r3, [sp]
	lsls r6, r3, 12
	lsls r0, 6
	movs r7, 0xC0
	lsls r7, 19
	adds r0, r7
	add r0, r12
	mov r7, r8
	adds r3, r7, r0
	subs r2, r4, r2
_080E4FA6:
	adds r0, r5, 0
	orrs r0, r6
	strh r0, [r3]
	adds r5, 0x1
	adds r3, 0x2
	subs r2, 0x1
	cmp r2, 0
	bne _080E4FA6
_080E4FB6:
	adds r0, r1, 0
	cmp r0, r9
	blt _080E4F86
_080E4FBC:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E4FCC: .4byte 0x040000d4
_080E4FD0: .4byte gUnknown_081FAF4C
_080E4FD4: .4byte gBattleMonForms
_080E4FD8: .4byte 0x80000400
	thumb_func_end sub_80E4EF8

	thumb_func_start unref_sub_80E4FDC
unref_sub_80E4FDC: @ 80E4FDC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r4, [sp, 0x24]
	ldr r5, [sp, 0x28]
	mov r8, r5
	ldr r5, [sp, 0x2C]
	ldr r6, [sp, 0x30]
	mov r9, r6
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	lsls r1, 24
	lsls r2, 24
	lsls r3, 24
	lsls r4, 24
	lsrs r4, 24
	mov r10, r4
	mov r7, r8
	lsls r7, 16
	lsrs r6, r7, 16
	lsls r5, 24
	lsrs r5, 24
	mov r0, r9
	lsls r0, 24
	mov r9, r0
	ldr r4, _080E509C @ =0x040000d4
	ldr r0, _080E50A0 @ =gUnknown_081FAF4C
	lsrs r2, 22
	adds r2, r0
	lsrs r3, 13
	ldr r0, [r2]
	adds r0, r3
	str r0, [r4]
	movs r0, 0xC0
	lsls r0, 19
	adds r6, r0
	str r6, [r4, 0x4]
	ldr r0, _080E50A4 @ =0x80000400
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	adds r2, r7, 0
	lsrs r2, 21
	mov r6, r9
	lsrs r6, 15
	subs r4, r2, r6
	lsrs r0, r1, 24
	adds r1, r0, 0
	adds r1, 0x8
	cmp r0, r1
	bge _080E508C
	mov r9, r1
	mov r7, r12
	lsls r7, 1
	mov r8, r7
	lsls r5, 11
	str r5, [sp]
_080E5054:
	mov r2, r12
	adds r3, r2, 0
	adds r3, 0x8
	adds r5, r0, 0x1
	cmp r2, r3
	bge _080E5086
	mov r1, r10
	lsls r6, r1, 12
	lsls r0, 6
	movs r7, 0xC0
	lsls r7, 19
	adds r0, r7
	ldr r1, [sp]
	adds r0, r1, r0
	mov r7, r8
	adds r1, r7, r0
	subs r2, r3, r2
_080E5076:
	adds r0, r4, 0
	orrs r0, r6
	strh r0, [r1]
	adds r4, 0x1
	adds r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bne _080E5076
_080E5086:
	adds r0, r5, 0
	cmp r0, r9
	blt _080E5054
_080E508C:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E509C: .4byte 0x040000d4
_080E50A0: .4byte gUnknown_081FAF4C
_080E50A4: .4byte 0x80000400
	thumb_func_end unref_sub_80E4FDC

	.align 2, 0 @ Don't pad with nop.
