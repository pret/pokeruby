	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_81318F0
sub_81318F0: @ 81318F0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r3, _0813193C @ =gBattleAnimArgs
	movs r2, 0
	strh r2, [r3, 0xE]
	ldr r1, _08131940 @ =gAnimFriendship
	ldrb r0, [r1]
	ldrb r1, [r1]
	adds r0, r1, 0
	subs r0, 0x3D
	lsls r0, 24
	lsrs r0, 24
	adds r2, r1, 0
	cmp r0, 0x1E
	bhi _08131914
	movs r0, 0x1
	strh r0, [r3, 0xE]
_08131914:
	adds r0, r2, 0
	subs r0, 0x5C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6C
	bhi _08131924
	movs r0, 0x2
	strh r0, [r3, 0xE]
_08131924:
	lsls r0, r1, 24
	lsrs r0, 24
	cmp r0, 0xC8
	bls _08131930
	movs r0, 0x3
	strh r0, [r3, 0xE]
_08131930:
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813193C: .4byte gBattleAnimArgs
_08131940: .4byte gAnimFriendship
	thumb_func_end sub_81318F0

	thumb_func_start sub_8131944
sub_8131944: @ 8131944
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _08131974 @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0x4
	bls _0813196A
	b _08131EA0
_0813196A:
	lsls r0, 2
	ldr r1, _08131978 @ =_0813197C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08131974: .4byte gTasks
_08131978: .4byte _0813197C
	.align 2, 0
_0813197C:
	.4byte _08131990
	.4byte _08131A44
	.4byte _08131C20
	.4byte _08131D40
	.4byte _08131DC4
_08131990:
	movs r0, 0
	bl GetAnimBattlerSpriteId
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _081319DC @ =gTasks
	mov r2, r8
	lsls r4, r2, 2
	adds r0, r4, r2
	lsls r0, 3
	adds r6, r0, r1
	movs r3, 0x80
	lsls r3, 4
	adds r0, r3, 0
	ldrh r1, [r6, 0xA]
	adds r0, r1
	strh r0, [r6, 0xA]
	ldr r0, _081319E0 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	mov r9, r4
	cmp r0, 0
	bne _081319E8
	ldr r2, _081319E4 @ =gSprites
	lsls r3, r7, 4
	adds r1, r3, r7
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r6, 0xA]
	lsls r0, 16
	asrs r0, 24
	ldrh r4, [r1, 0x24]
	adds r0, r4
	strh r0, [r1, 0x24]
	b _08131A02
	.align 2, 0
_081319DC: .4byte gTasks
_081319E0: .4byte gAnimBankAttacker
_081319E4: .4byte gSprites
_081319E8:
	ldr r3, _08131A3C @ =gSprites
	lsls r4, r7, 4
	adds r2, r4, r7
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r6, 0xA]
	lsls r1, 16
	asrs r1, 24
	ldrh r0, [r2, 0x24]
	subs r0, r1
	strh r0, [r2, 0x24]
	adds r2, r3, 0
	adds r3, r4, 0
_08131A02:
	ldr r1, _08131A40 @ =gTasks
	mov r0, r9
	add r0, r8
	lsls r0, 3
	adds r4, r0, r1
	ldrb r0, [r4, 0xA]
	strh r0, [r4, 0xA]
	adds r1, r3, r7
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x24]
	ldrh r1, [r1, 0x20]
	adds r0, r1
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 14
	adds r0, r1
	movs r1, 0x98
	lsls r1, 17
	cmp r0, r1
	bhi _08131A2E
	b _08131EA0
_08131A2E:
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08131EA0
	.align 2, 0
_08131A3C: .4byte gSprites
_08131A40: .4byte gTasks
_08131A44:
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _08131A74
	ldr r0, _08131A6C @ =gSharedMem + 0x19348
	ldr r2, [r0, 0x8]
	mov r10, r2
	ldr r3, [r0, 0xC]
	mov r9, r3
	ldrh r5, [r0]
	ldr r0, _08131A70 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl sub_8079E90
	lsls r0, 24
	lsrs r4, r0, 24
	movs r7, 0
	b _08131B92
	.align 2, 0
_08131A6C: .4byte gSharedMem + 0x19348
_08131A70: .4byte gAnimBankAttacker
_08131A74:
	ldr r4, _08131AD4 @ =gAnimBankAttacker
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08131B10
	ldr r7, _08131AD8 @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _08131ADC @ =gPlayerParty
	adds r0, r5
	movs r1, 0
	bl GetMonData
	mov r10, r0
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0x1
	bl GetMonData
	mov r9, r0
	ldrb r2, [r4]
	lsls r1, r2, 2
	ldr r0, _08131AE0 @ =gSharedMem + 0x17800
	adds r1, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08131AE4
	lsls r0, r2, 1
	adds r0, r7
	ldrh r0, [r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	b _08131AE6
	.align 2, 0
_08131AD4: .4byte gAnimBankAttacker
_08131AD8: .4byte gBattlerPartyIndexes
_08131ADC: .4byte gPlayerParty
_08131AE0: .4byte gSharedMem + 0x17800
_08131AE4:
	ldrh r5, [r1, 0x2]
_08131AE6:
	movs r0, 0x1
	bl GetAnimBattlerSpriteId
	ldr r2, _08131B0C @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	movs r7, 0
	movs r6, 0x88
	lsls r6, 1
	b _08131B94
	.align 2, 0
_08131B0C: .4byte gSprites
_08131B10:
	ldr r7, _08131B64 @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _08131B68 @ =gEnemyParty
	adds r0, r5
	movs r1, 0
	bl GetMonData
	mov r10, r0
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0x1
	bl GetMonData
	mov r9, r0
	ldrb r2, [r4]
	lsls r1, r2, 2
	ldr r0, _08131B6C @ =gSharedMem + 0x17800
	adds r1, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08131B70
	lsls r0, r2, 1
	adds r0, r7
	ldrh r0, [r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	b _08131B72
	.align 2, 0
_08131B64: .4byte gBattlerPartyIndexes
_08131B68: .4byte gEnemyParty
_08131B6C: .4byte gSharedMem + 0x17800
_08131B70:
	ldrh r5, [r1, 0x2]
_08131B72:
	movs r0, 0x1
	bl GetAnimBattlerSpriteId
	ldr r2, _08131C04 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	movs r7, 0x1
_08131B92:
	ldr r6, _08131C08 @ =0x0000ffe0
_08131B94:
	ldr r0, _08131C0C @ =gAnimBankTarget
	ldrb r0, [r0]
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	lsls r3, r6, 16
	asrs r3, 16
	str r0, [sp]
	str r4, [sp, 0x4]
	mov r4, r10
	str r4, [sp, 0x8]
	mov r0, r9
	str r0, [sp, 0xC]
	adds r0, r5, 0
	adds r1, r7, 0
	movs r2, 0
	bl sub_8079F44
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08131C10 @ =gAnimBankAttacker
	ldrb r0, [r0]
	lsls r0, 2
	ldr r1, _08131C14 @ =gSharedMem + 0x17800
	adds r0, r1
	ldrh r0, [r0, 0x2]
	cmp r0, 0
	beq _08131BF2
	ldr r1, _08131C04 @ =gSprites
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	lsls r0, 4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	orrs r0, r1
	ldr r3, _08131C18 @ =0x00007fff
	movs r1, 0x10
	movs r2, 0x6
	bl BlendPalette
_08131BF2:
	ldr r0, _08131C1C @ =gTasks
	mov r3, r8
	lsls r1, r3, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	strh r5, [r1, 0x26]
	b _08131DB6
	.align 2, 0
_08131C04: .4byte gSprites
_08131C08: .4byte 0x0000ffe0
_08131C0C: .4byte gAnimBankTarget
_08131C10: .4byte gAnimBankAttacker
_08131C14: .4byte gSharedMem + 0x17800
_08131C18: .4byte 0x00007fff
_08131C1C: .4byte gTasks
_08131C20:
	ldr r1, _08131C6C @ =gTasks
	mov r0, r8
	lsls r4, r0, 2
	adds r0, r4, r0
	lsls r0, 3
	adds r6, r0, r1
	ldrh r0, [r6, 0x26]
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0x80
	lsls r1, 4
	adds r0, r1, 0
	ldrh r2, [r6, 0xA]
	adds r0, r2
	strh r0, [r6, 0xA]
	ldr r0, _08131C70 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	mov r9, r4
	cmp r0, 0
	bne _08131C78
	ldr r3, _08131C74 @ =gSprites
	lsls r4, r5, 4
	adds r2, r4, r5
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r6, 0xA]
	lsls r1, 16
	asrs r1, 24
	ldrh r0, [r2, 0x24]
	subs r0, r1
	strh r0, [r2, 0x24]
	adds r2, r3, 0
	adds r3, r4, 0
	b _08131C8E
	.align 2, 0
_08131C6C: .4byte gTasks
_08131C70: .4byte gAnimBankAttacker
_08131C74: .4byte gSprites
_08131C78:
	ldr r2, _08131CDC @ =gSprites
	lsls r3, r5, 4
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r6, 0xA]
	lsls r0, 16
	asrs r0, 24
	ldrh r4, [r1, 0x24]
	adds r0, r4
	strh r0, [r1, 0x24]
_08131C8E:
	ldr r1, _08131CE0 @ =gTasks
	mov r0, r9
	add r0, r8
	lsls r0, 3
	adds r6, r0, r1
	ldrb r0, [r6, 0xA]
	strh r0, [r6, 0xA]
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x24]
	ldrh r1, [r1, 0x20]
	adds r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
	movs r1, 0x24
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _08131D0E
	ldr r0, _08131CE4 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08131CEC
	lsls r4, r5, 16
	asrs r4, 16
	ldr r0, _08131CE8 @ =gAnimBankTarget
	ldrb r0, [r0]
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bge _08131D0E
	b _08131D02
	.align 2, 0
_08131CDC: .4byte gSprites
_08131CE0: .4byte gTasks
_08131CE4: .4byte gAnimBankAttacker
_08131CE8: .4byte gAnimBankTarget
_08131CEC:
	lsls r4, r5, 16
	asrs r4, 16
	ldr r0, _08131D30 @ =gAnimBankTarget
	ldrb r0, [r0]
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	ble _08131D0E
_08131D02:
	ldrh r0, [r6, 0x24]
	adds r0, 0x1
	strh r0, [r6, 0x24]
	ldr r1, _08131D34 @ =gBattleAnimArgs
	ldr r0, _08131D38 @ =0x0000ffff
	strh r0, [r1, 0xE]
_08131D0E:
	lsls r0, r5, 16
	movs r2, 0x80
	lsls r2, 14
	adds r0, r2
	movs r1, 0x98
	lsls r1, 17
	cmp r0, r1
	bhi _08131D20
	b _08131EA0
_08131D20:
	ldr r0, _08131D3C @ =gTasks
	mov r1, r9
	add r1, r8
	lsls r1, 3
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0xA]
	b _08131DB6
	.align 2, 0
_08131D30: .4byte gAnimBankTarget
_08131D34: .4byte gBattleAnimArgs
_08131D38: .4byte 0x0000ffff
_08131D3C: .4byte gTasks
_08131D40:
	movs r0, 0
	bl GetAnimBattlerSpriteId
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08131D8C @ =gTasks
	mov r3, r8
	lsls r4, r3, 2
	adds r0, r4, r3
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x26]
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	ldr r5, _08131D90 @ =gSprites
	adds r0, r5
	bl sub_807A0F4
	ldr r0, _08131D94 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	mov r9, r4
	cmp r0, 0
	bne _08131D98
	lsls r1, r7, 4
	adds r1, r7
	lsls r1, 2
	adds r1, r5
	ldrh r0, [r1, 0x20]
	negs r0, r0
	subs r0, 0x20
	strh r0, [r1, 0x24]
	b _08131DAC
	.align 2, 0
_08131D8C: .4byte gTasks
_08131D90: .4byte gSprites
_08131D94: .4byte gAnimBankAttacker
_08131D98:
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	adds r0, r5
	ldrh r2, [r0, 0x20]
	movs r4, 0x88
	lsls r4, 1
	adds r1, r4, 0
	subs r1, r2
	strh r1, [r0, 0x24]
_08131DAC:
	ldr r0, _08131DC0 @ =gTasks
	mov r1, r9
	add r1, r8
	lsls r1, 3
	adds r1, r0
_08131DB6:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _08131EA0
	.align 2, 0
_08131DC0: .4byte gTasks
_08131DC4:
	movs r0, 0
	bl GetAnimBattlerSpriteId
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08131E38 @ =gTasks
	mov r0, r8
	lsls r4, r0, 2
	adds r0, r4, r0
	lsls r0, 3
	adds r2, r0, r1
	movs r1, 0x80
	lsls r1, 4
	adds r0, r1, 0
	ldrh r3, [r2, 0xA]
	adds r0, r3
	strh r0, [r2, 0xA]
	ldr r0, _08131E3C @ =gAnimBankAttacker
	mov r10, r0
	ldrb r0, [r0]
	str r2, [sp, 0x10]
	bl GetBattlerSide
	lsls r0, 24
	mov r9, r4
	ldr r2, [sp, 0x10]
	cmp r0, 0
	bne _08131E44
	ldr r1, _08131E40 @ =gSprites
	lsls r5, r7, 4
	adds r0, r5, r7
	lsls r0, 2
	adds r6, r0, r1
	ldrh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r6, 0x24]
	adds r0, r1
	strh r0, [r6, 0x24]
	movs r2, 0x24
	ldrsh r4, [r6, r2]
	movs r3, 0x20
	ldrsh r0, [r6, r3]
	adds r4, r0
	mov r1, r10
	ldrb r0, [r1]
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	adds r3, r5, 0
	cmp r4, r0
	blt _08131E7C
	movs r2, 0
	strh r2, [r6, 0x24]
	b _08131E7C
	.align 2, 0
_08131E38: .4byte gTasks
_08131E3C: .4byte gAnimBankAttacker
_08131E40: .4byte gSprites
_08131E44:
	ldr r1, _08131EB0 @ =gSprites
	lsls r5, r7, 4
	adds r0, r5, r7
	lsls r0, 2
	adds r6, r0, r1
	ldrh r1, [r2, 0xA]
	lsls r1, 16
	asrs r1, 24
	ldrh r0, [r6, 0x24]
	subs r0, r1
	strh r0, [r6, 0x24]
	movs r3, 0x24
	ldrsh r4, [r6, r3]
	movs r1, 0x20
	ldrsh r0, [r6, r1]
	adds r4, r0
	mov r2, r10
	ldrb r0, [r2]
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	adds r3, r5, 0
	cmp r4, r0
	bgt _08131E7C
	movs r4, 0
	strh r4, [r6, 0x24]
_08131E7C:
	ldr r1, _08131EB4 @ =gTasks
	mov r0, r9
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0xA]
	strh r1, [r0, 0xA]
	ldr r1, _08131EB0 @ =gSprites
	adds r0, r3, r7
	lsls r0, 2
	adds r0, r1
	movs r1, 0x24
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _08131EA0
	mov r0, r8
	bl DestroyAnimVisualTask
_08131EA0:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08131EB0: .4byte gSprites
_08131EB4: .4byte gTasks
	thumb_func_end sub_8131944

	thumb_func_start sub_8131EB8
sub_8131EB8: @ 8131EB8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08131ECA
	cmp r0, 0x1
	beq _08131F72
	b _08131FF4
_08131ECA:
	ldr r0, _08131F50 @ =gBattleAnimArgs
	movs r2, 0xE
	ldrsh r1, [r0, r2]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _08131F64
	movs r0, 0x3F
	bl BattleAnimAdjustPanning
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x7A
	bl PlaySE12WithPanning
	ldr r0, _08131F54 @ =gAnimBankTarget
	ldrb r0, [r0]
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	strh r0, [r4, 0x22]
	ldr r0, _08131F58 @ =0x0000ffe0
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08131F5C @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08131FF4
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _08131FF4
	movs r0, 0x1
	bl GetAnimBattlerSpriteId
	ldr r2, _08131F60 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0x1
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	b _08131FF4
	.align 2, 0
_08131F50: .4byte gBattleAnimArgs
_08131F54: .4byte gAnimBankTarget
_08131F58: .4byte 0x0000ffe0
_08131F5C: .4byte gAnimBankAttacker
_08131F60: .4byte gSprites
_08131F64:
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _08131FF4
_08131F72:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r2, [r4, 0x30]
	adds r0, r2, 0x5
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7F
	ble _08131FA6
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	adds r0, r2, 0
	subs r0, 0x7A
	strh r0, [r4, 0x30]
_08131FA6:
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldr r0, _08131FD0 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08131FD4
	ldrh r2, [r4, 0x32]
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r4, 0x24]
	subs r0, r1
	strh r0, [r4, 0x24]
	adds r1, r2, 0
	b _08131FE0
	.align 2, 0
_08131FD0: .4byte gAnimBankAttacker
_08131FD4:
	ldrh r1, [r4, 0x32]
	lsls r0, r1, 16
	asrs r0, 24
	ldrh r2, [r4, 0x24]
	adds r0, r2
	strh r0, [r4, 0x24]
_08131FE0:
	movs r0, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0x2
	bne _08131FF4
	adds r0, r4, 0
	bl DestroyAnimSprite
_08131FF4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8131EB8

	thumb_func_start sub_8131FFC
sub_8131FFC: @ 8131FFC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08132024 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x26
	ldrsh r0, [r0, r2]
	adds r3, r1, 0
	cmp r0, 0x4
	bls _08132018
	b _0813216A
_08132018:
	lsls r0, 2
	ldr r1, _08132028 @ =_0813202C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08132024: .4byte gTasks
_08132028: .4byte _0813202C
	.align 2, 0
_0813202C:
	.4byte _08132040
	.4byte _08132090
	.4byte _081320EC
	.4byte _08132104
	.4byte _0813216A
_08132040:
	ldr r0, _08132084 @ =gAnimBankAttacker
	ldrb r0, [r0]
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r0, _08132088 @ =gAnimBankTarget
	ldrb r0, [r0]
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	ldr r1, _0813208C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	movs r0, 0x6
	strh r0, [r1, 0x8]
	cmp r5, r2
	ble _08132076
	negs r0, r0
	strh r0, [r1, 0x8]
_08132076:
	strh r5, [r1, 0xA]
	strh r2, [r1, 0xC]
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _08132188
	.align 2, 0
_08132084: .4byte gAnimBankAttacker
_08132088: .4byte gAnimBankTarget
_0813208C: .4byte gTasks
_08132090:
	ldr r1, _081320CC @ =gBankSpriteIds
	ldr r0, _081320D0 @ =gAnimBankAttacker
	ldrb r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	ldr r1, _081320D4 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r1
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r3
	ldrh r0, [r2, 0x8]
	ldrh r3, [r1, 0x24]
	adds r0, r3
	strh r0, [r1, 0x24]
	movs r3, 0x8
	ldrsh r0, [r2, r3]
	cmp r0, 0
	ble _081320D8
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	movs r3, 0x24
	ldrsh r1, [r1, r3]
	adds r0, r1
	movs r3, 0xC
	ldrsh r1, [r2, r3]
	b _0813215E
	.align 2, 0
_081320CC: .4byte gBankSpriteIds
_081320D0: .4byte gAnimBankAttacker
_081320D4: .4byte gSprites
_081320D8:
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	movs r3, 0x24
	ldrsh r1, [r1, r3]
	adds r0, r1
	movs r3, 0xC
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bgt _08132188
	b _08132162
_081320EC:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r3
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	negs r1, r1
	strh r1, [r0, 0x8]
	ldrh r1, [r0, 0x26]
	adds r1, 0x1
	strh r1, [r0, 0x26]
	b _08132188
_08132104:
	ldr r1, _08132144 @ =gBankSpriteIds
	ldr r0, _08132148 @ =gAnimBankAttacker
	ldrb r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	ldr r1, _0813214C @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r1
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r3
	ldrh r0, [r2, 0x8]
	ldrh r3, [r1, 0x24]
	adds r0, r3
	strh r0, [r1, 0x24]
	movs r3, 0x8
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bge _08132150
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	movs r3, 0x24
	ldrsh r1, [r1, r3]
	adds r0, r1
	movs r3, 0xA
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bgt _08132188
	b _08132162
	.align 2, 0
_08132144: .4byte gBankSpriteIds
_08132148: .4byte gAnimBankAttacker
_0813214C: .4byte gSprites
_08132150:
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	movs r3, 0x24
	ldrsh r1, [r1, r3]
	adds r0, r1
	movs r3, 0xA
	ldrsh r1, [r2, r3]
_0813215E:
	cmp r0, r1
	blt _08132188
_08132162:
	ldrh r0, [r2, 0x26]
	adds r0, 0x1
	strh r0, [r2, 0x26]
	b _08132188
_0813216A:
	ldr r1, _08132190 @ =gBankSpriteIds
	ldr r0, _08132194 @ =gAnimBankAttacker
	ldrb r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	ldr r1, _08132198 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x24]
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_08132188:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08132190: .4byte gBankSpriteIds
_08132194: .4byte gAnimBankAttacker
_08132198: .4byte gSprites
	thumb_func_end sub_8131FFC

	thumb_func_start sub_813219C
sub_813219C: @ 813219C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08132204 @ =gTasks
	adds r4, r1, r0
	movs r0, 0
	bl GetAnimBattlerSpriteId
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r4, 0xE]
	ldr r0, _08132208 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	movs r2, 0x1
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	bne _081321D0
	movs r1, 0x1
_081321D0:
	strh r1, [r4, 0x10]
	ldr r2, _0813220C @ =gSprites
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x22]
	strh r0, [r4, 0x14]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x20]
	strh r0, [r4, 0x12]
	strh r5, [r4, 0x1A]
	strh r5, [r4, 0x1E]
	movs r0, 0x1
	strh r0, [r4, 0x1C]
	strh r5, [r4, 0x20]
	ldr r0, _08132210 @ =sub_8132214
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08132204: .4byte gTasks
_08132208: .4byte gAnimBankAttacker
_0813220C: .4byte gSprites
_08132210: .4byte sub_8132214
	thumb_func_end sub_813219C

	thumb_func_start sub_8132214
sub_8132214: @ 8132214
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _08132238 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _081322BC
	cmp r0, 0x1
	bgt _0813223C
	cmp r0, 0
	beq _08132242
	b _08132312
	.align 2, 0
_08132238: .4byte gTasks
_0813223C:
	cmp r0, 0x2
	beq _0813230C
	b _08132312
_08132242:
	ldrh r0, [r4, 0x1E]
	adds r0, 0x8
	movs r2, 0xFF
	ands r0, r2
	strh r0, [r4, 0x1E]
	ldr r5, _081322B4 @ =gSprites
	movs r6, 0xE
	ldrsh r0, [r4, r6]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldr r3, _081322B8 @ =gSineTable
	movs r6, 0x1E
	ldrsh r0, [r4, r6]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 21
	strh r0, [r1, 0x24]
	ldrh r0, [r4, 0x1A]
	adds r0, 0x2
	ands r0, r2
	strh r0, [r4, 0x1A]
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	movs r6, 0x1A
	ldrsh r0, [r4, r6]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 19
	ldrh r1, [r4, 0x10]
	muls r0, r1
	ldrh r1, [r4, 0x12]
	adds r0, r1
	strh r0, [r2, 0x20]
	movs r6, 0x1A
	ldrsh r0, [r4, r6]
	cmp r0, 0
	bne _08132312
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r4, 0x12]
	strh r1, [r0, 0x20]
	b _081322FC
	.align 2, 0
_081322B4: .4byte gSprites
_081322B8: .4byte gSineTable
_081322BC:
	ldrh r0, [r4, 0x1E]
	adds r0, 0x8
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x1E]
	ldr r3, _08132304 @ =gSprites
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldr r2, _08132308 @ =gSineTable
	movs r5, 0x1E
	ldrsh r0, [r4, r5]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 21
	strh r0, [r1, 0x24]
	movs r6, 0x1E
	ldrsh r2, [r4, r6]
	cmp r2, 0
	bne _08132312
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	strh r2, [r1, 0x24]
_081322FC:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08132312
	.align 2, 0
_08132304: .4byte gSprites
_08132308: .4byte gSineTable
_0813230C:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_08132312:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8132214

	thumb_func_start sub_8132318
sub_8132318: @ 8132318
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0813236C @ =gAnimBankTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	ldrh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x30]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x14
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x14
	bl Sin
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0813235E
	adds r0, r4, 0
	bl DestroyAnimSprite
_0813235E:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813236C: .4byte gAnimBankTarget
	thumb_func_end sub_8132318

	thumb_func_start sub_8132370
sub_8132370: @ 8132370
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _081323A8 @ =gAnimBankTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _081323B4
	ldr r2, _081323AC @ =gBattleAnimArgs
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, _081323B0 @ =0x0000fff5
	strh r0, [r4, 0x2E]
	movs r0, 0xC0
	strh r0, [r4, 0x30]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	b _081323CE
	.align 2, 0
_081323A8: .4byte gAnimBankTarget
_081323AC: .4byte gBattleAnimArgs
_081323B0: .4byte 0x0000fff5
_081323B4:
	movs r0, 0xB
	strh r0, [r4, 0x2E]
	movs r0, 0xC0
	strh r0, [r4, 0x30]
	ldr r1, _081323D8 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
_081323CE:
	ldr r0, _081323DC @ =sub_8132318
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081323D8: .4byte gBattleAnimArgs
_081323DC: .4byte sub_8132318
	thumb_func_end sub_8132370

	thumb_func_start sub_81323E0
sub_81323E0: @ 81323E0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _08132424 @ =gAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_807A100
	strh r0, [r5, 0x22]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	bgt _0813240A
	movs r0, 0x10
	strh r0, [r5, 0x22]
_0813240A:
	movs r0, 0
	strh r0, [r5, 0x3A]
	movs r1, 0x10
	strh r1, [r5, 0x3C]
	ldr r0, _08132428 @ =sub_8132430
	str r0, [r5, 0x1C]
	ldr r0, _0813242C @ =REG_BLDALPHA
	lsls r1, 8
	strh r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08132424: .4byte gAnimBankAttacker
_08132428: .4byte sub_8132430
_0813242C: .4byte REG_BLDALPHA
	thumb_func_end sub_81323E0

	thumb_func_start sub_8132430
sub_8132430: @ 8132430
	push {r4,lr}
	adds r3, r0, 0
	movs r0, 0x32
	ldrsh r1, [r3, r0]
	cmp r1, 0x1
	beq _081324A8
	cmp r1, 0x1
	bgt _08132446
	cmp r1, 0
	beq _08132450
	b _08132522
_08132446:
	cmp r1, 0x2
	beq _081324BE
	cmp r1, 0x3
	beq _0813251C
	b _08132522
_08132450:
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _08132522
	strh r1, [r3, 0x2E]
	ldrh r1, [r3, 0x30]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0813247A
	ldrh r2, [r3, 0x3A]
	movs r4, 0x3A
	ldrsh r0, [r3, r4]
	cmp r0, 0xF
	bgt _08132488
	adds r0, r2, 0x1
	strh r0, [r3, 0x3A]
	b _08132488
_0813247A:
	ldrh r2, [r3, 0x3C]
	movs r4, 0x3C
	ldrsh r0, [r3, r4]
	cmp r0, 0
	beq _08132488
	subs r0, r2, 0x1
	strh r0, [r3, 0x3C]
_08132488:
	adds r0, r1, 0x1
	strh r0, [r3, 0x30]
	ldr r2, _081324A4 @ =REG_BLDALPHA
	ldrh r0, [r3, 0x3C]
	lsls r0, 8
	ldrh r1, [r3, 0x3A]
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0x3C
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _08132522
	b _08132510
	.align 2, 0
_081324A4: .4byte REG_BLDALPHA
_081324A8:
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _08132522
	strh r1, [r3, 0x2E]
	strh r1, [r3, 0x30]
	b _08132510
_081324BE:
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _08132522
	movs r0, 0
	strh r0, [r3, 0x2E]
	ldrh r1, [r3, 0x30]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _081324EA
	ldrh r2, [r3, 0x3A]
	movs r4, 0x3A
	ldrsh r0, [r3, r4]
	cmp r0, 0
	beq _081324F8
	subs r0, r2, 0x1
	strh r0, [r3, 0x3A]
	b _081324F8
_081324EA:
	ldrh r2, [r3, 0x3C]
	movs r4, 0x3C
	ldrsh r0, [r3, r4]
	cmp r0, 0xF
	bgt _081324F8
	adds r0, r2, 0x1
	strh r0, [r3, 0x3C]
_081324F8:
	adds r0, r1, 0x1
	strh r0, [r3, 0x30]
	ldr r2, _08132518 @ =REG_BLDALPHA
	ldrh r0, [r3, 0x3C]
	lsls r0, 8
	ldrh r1, [r3, 0x3A]
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0x3C
	ldrsh r0, [r3, r1]
	cmp r0, 0x10
	bne _08132522
_08132510:
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	b _08132522
	.align 2, 0
_08132518: .4byte REG_BLDALPHA
_0813251C:
	adds r0, r3, 0
	bl move_anim_8074EE0
_08132522:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8132430

	thumb_func_start sub_8132528
sub_8132528: @ 8132528
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _08132544 @ =gBattleAnimArgs
	movs r0, 0
	strh r0, [r2, 0xE]
	ldr r0, _08132548 @ =gWeatherMoveAnim
	ldrh r1, [r0]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _0813254C
	movs r0, 0x1
	b _0813256E
	.align 2, 0
_08132544: .4byte gBattleAnimArgs
_08132548: .4byte gWeatherMoveAnim
_0813254C:
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	beq _08132558
	movs r0, 0x2
	b _0813256E
_08132558:
	movs r0, 0x18
	ands r0, r1
	cmp r0, 0
	beq _08132564
	movs r0, 0x3
	b _0813256E
_08132564:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08132570
	movs r0, 0x4
_0813256E:
	strh r0, [r2, 0xE]
_08132570:
	adds r0, r3, 0
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	thumb_func_end sub_8132528

	thumb_func_start sub_813257C
sub_813257C: @ 813257C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _081325B4 @ =gTasks
	adds r4, r0
	movs r0, 0
	strh r0, [r4, 0x8]
	ldr r0, _081325B8 @ =gBattleAnimArgs
	ldrb r0, [r0]
	bl GetAnimBattlerSpriteId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	strh r1, [r4, 0x26]
	ldr r2, _081325BC @ =gUnknown_08402B28
	adds r0, r4, 0
	bl sub_80798F4
	ldr r0, _081325C0 @ =sub_81325C4
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081325B4: .4byte gTasks
_081325B8: .4byte gBattleAnimArgs
_081325BC: .4byte gUnknown_08402B28
_081325C0: .4byte sub_81325C4
	thumb_func_end sub_813257C

	thumb_func_start sub_81325C4
sub_81325C4: @ 81325C4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r2, _0813261C @ =gTasks
	adds r3, r0, r2
	ldrh r0, [r3, 0x8]
	adds r1, r0, 0x1
	movs r5, 0
	strh r1, [r3, 0x8]
	subs r0, 0x10
	lsls r0, 16
	lsrs r0, 16
	adds r6, r2, 0
	cmp r0, 0x16
	bhi _08132628
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _08132638
	strh r5, [r3, 0xA]
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	movs r5, 0x1
	ands r0, r5
	cmp r0, 0
	bne _08132628
	ldr r2, _08132620 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _08132624 @ =0x0000ffff
	strh r1, [r0, 0x24]
	b _08132638
	.align 2, 0
_0813261C: .4byte gTasks
_08132620: .4byte gSprites
_08132624: .4byte 0x0000ffff
_08132628:
	ldr r2, _08132658 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r5, [r0, 0x24]
_08132638:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r6
	bl sub_807992C
	lsls r0, 24
	cmp r0, 0
	bne _08132650
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_08132650:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08132658: .4byte gSprites
	thumb_func_end sub_81325C4

	.align 2, 0 @ Don't pad with nop.
