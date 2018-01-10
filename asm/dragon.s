	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	@ dragon

	thumb_func_start sub_80DF5A0
sub_80DF5A0: @ 80DF5A0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080DF5E8 @ =gAnimBankAttacker
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
_080DF5E8: .4byte gAnimBankAttacker
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
	ldr r4, _080DF694 @ =gAnimBankTarget
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
	ldr r0, _080DF698 @ =gAnimBankAttacker
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
_080DF694: .4byte gAnimBankTarget
_080DF698: .4byte gAnimBankAttacker
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
	ldr r4, _080DF708 @ =gAnimBankAttacker
	b _080DF70E
	.align 2, 0
_080DF704: .4byte gBattleAnimArgs
_080DF708: .4byte gAnimBankAttacker
_080DF70C:
	ldr r4, _080DF750 @ =gAnimBankTarget
_080DF70E:
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
_080DF750: .4byte gAnimBankTarget
_080DF754: .4byte gBattleAnimArgs
_080DF758: .4byte sub_8078600
_080DF75C: .4byte move_anim_8074EE0
	thumb_func_end sub_80DF6F0

	thumb_func_start sub_80DF760
sub_80DF760: @ 80DF760
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080DF788 @ =gAnimBankAttacker
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
_080DF788: .4byte gAnimBankAttacker
	thumb_func_end sub_80DF760

	thumb_func_start sub_80DF78C
sub_80DF78C: @ 80DF78C
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r4, _080DF7E0 @ =gAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r6, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBankPosition
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
_080DF7E0: .4byte gAnimBankAttacker
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
	bl DestroyAnimSprite
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
	ldr r0, _080DF954 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankIdentity_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080DF960
	ldr r0, _080DF958 @ =REG_BG1HOFS
	str r0, [sp]
	ldr r0, _080DF95C @ =gBattle_BG1_X
	b _080DF966
	.align 2, 0
_080DF950: .4byte gTasks
_080DF954: .4byte gAnimBankAttacker
_080DF958: .4byte REG_BG1HOFS
_080DF95C: .4byte gBattle_BG1_X
_080DF960:
	ldr r0, _080DF9DC @ =REG_BG2HOFS
	str r0, [sp]
	ldr r0, _080DF9E0 @ =gBattle_BG2_X
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
	ldr r0, _080DF9E8 @ =gAnimBankAttacker
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
_080DF9E0: .4byte gBattle_BG2_X
_080DF9E4: .4byte 0xa2600001
_080DF9E8: .4byte gAnimBankAttacker
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
	ldr r1, _080DFAA0 @ =gScanlineEffect
	movs r0, 0x3
	strb r0, [r1, 0x15]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _080DFAAA
	.align 2, 0
_080DFAA0: .4byte gScanlineEffect
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
	ldr r6, _080DFB24 @ =gScanlineEffect
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
_080DFB24: .4byte gScanlineEffect
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
	ldr r1, _080DFBCC @ =gAnimBankAttacker
	mov r8, r1
	ldrb r0, [r1]
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	mov r2, r8
	ldrb r0, [r2]
	movs r1, 0x3
	bl GetBankPosition
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
_080DFBCC: .4byte gAnimBankAttacker
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
	bl DestroyAnimSprite
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
