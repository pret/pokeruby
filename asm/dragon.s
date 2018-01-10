	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	@ dragon

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
	ldr r0, _080DFC60 @ =gAnimBankAttacker
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
_080DFC60: .4byte gAnimBankAttacker
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
	ldr r0, _080DFD14 @ =gAnimBankAttacker
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
_080DFD14: .4byte gAnimBankAttacker
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
	ldr r0, _080DFDEC @ =gAnimBankAttacker
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
_080DFDEC: .4byte gAnimBankAttacker
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
	ldr r6, _080DFE80 @ =gAnimBankTarget
	ldrb r0, [r6]
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x30]
	ldr r5, _080DFE84 @ =gAnimBankAttacker
	ldrb r0, [r5]
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r6]
	movs r1, 0x3
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x34]
	ldrb r0, [r5]
	movs r1, 0x3
	bl GetBankPosition
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
_080DFE80: .4byte gAnimBankTarget
_080DFE84: .4byte gAnimBankAttacker
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
	bl DestroyAnimSprite
_080DFF14:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80DFE90
	
	.align 2, 0 @ Don't pad with nop.
