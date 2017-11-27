	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	@ fire

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
	
	.align 2, 0 @ Don't pad with nop.
