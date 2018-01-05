	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	@ poison

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
	ldr r4, _080D9DC8 @ =gAnimBankTarget
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
_080D9DC8: .4byte gAnimBankTarget
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
	bl DestroyAnimSprite
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
	ldr r0, _080D9E68 @ =gAnimBankTarget
	ldrb r0, [r0]
	mov r6, sp
	adds r6, 0x2
	movs r1, 0x1
	mov r2, sp
	adds r3, r6, 0
	bl sub_807A3FC
	ldr r0, _080D9E6C @ =gAnimBankAttacker
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
_080D9E68: .4byte gAnimBankTarget
_080D9E6C: .4byte gAnimBankAttacker
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
	bl DestroyAnimSprite
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
	bl DestroyAnimSprite
_080D9F0E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D9EE8

	thumb_func_start sub_80D9F14
sub_80D9F14: @ 80D9F14
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080D9F74 @ =gAnimBankTarget
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0x1
	bl sub_807A3FC
	ldr r0, _080D9F78 @ =gAnimBankAttacker
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
	ldr r1, _080D9F84 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D9F74: .4byte gAnimBankTarget
_080D9F78: .4byte gAnimBankAttacker
_080D9F7C: .4byte gBattleAnimArgs
_080D9F80: .4byte sub_8078B34
_080D9F84: .4byte DestroyAnimSprite
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
	ldr r0, _080D9FE4 @ =gAnimBankTarget
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0x1
	bl sub_807A3FC
	ldr r0, _080D9FE8 @ =gAnimBankAttacker
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
_080D9FE4: .4byte gAnimBankTarget
_080D9FE8: .4byte gAnimBankAttacker
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
	bl DestroyAnimSprite
_080DA02C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D9FF0
	
	.align 2, 0 @ Don't pad with nop.
