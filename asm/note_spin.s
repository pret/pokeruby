	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

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
	
	.align 2, 0 @ Don't pad with nop.
