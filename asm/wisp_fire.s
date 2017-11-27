	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	@ wisp_fire

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
	
	.align 2, 0 @ Don't pad with nop.
