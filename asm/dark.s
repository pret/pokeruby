	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	@ dark

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
	ldr r0, _080E0888 @ =gScanlineEffectRegBuffers
	mov r12, r0
	ldr r7, _080E088C @ =gScanlineEffect
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
	ldr r0, _080E0888 @ =gScanlineEffectRegBuffers
	mov r12, r0
	ldr r7, _080E088C @ =gScanlineEffect
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
	ldr r7, _080E0888 @ =gScanlineEffectRegBuffers
	ldr r4, _080E088C @ =gScanlineEffect
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
_080E0888: .4byte gScanlineEffectRegBuffers
_080E088C: .4byte gScanlineEffect
_080E0890:
	movs r1, 0x1C
	ldrsh r0, [r6, r1]
	adds r5, r0, 0
	adds r5, 0x9F
	movs r4, 0
	ldr r3, _080E08C8 @ =gScanlineEffectRegBuffers
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
_080E08C8: .4byte gScanlineEffectRegBuffers
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
	ldr r6, _080E09B8 @ =gAnimBankAttacker
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
_080E09B8: .4byte gAnimBankAttacker
_080E09BC: .4byte gSprites
_080E09C0: .4byte gObjectBankIDs
	thumb_func_end sub_80E0918

	thumb_func_start sub_80E09C4
sub_80E09C4: @ 80E09C4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r4, _080E0A0C @ =gAnimBankAttacker
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
_080E0A0C: .4byte gAnimBankAttacker
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
	ldr r1, _080E0A48 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E0A40: .4byte gBattleAnimArgs
_080E0A44: .4byte sub_8078600
_080E0A48: .4byte DestroyAnimSprite
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
	ldr r0, _080E0B50 @ =gBattle_WIN0H
	strh r7, [r0]
	ldr r0, _080E0B54 @ =gBattle_WIN0V
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
	bl IsContest
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
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080E0B40
	ldr r4, _080E0B74 @ =gAnimBankAttacker
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
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _080E0B84
	ldr r0, _080E0B80 @ =gSharedMem + 0x19348
	ldrh r5, [r0]
	b _080E0BCC
	.align 2, 0
_080E0B50: .4byte gBattle_WIN0H
_080E0B54: .4byte gBattle_WIN0V
_080E0B58: .4byte REG_WININ
_080E0B5C: .4byte 0x00003f3f
_080E0B60: .4byte 0x00003f3d
_080E0B64: .4byte REG_BLDCNT
_080E0B68: .4byte 0x00003f42
_080E0B6C: .4byte 0x00000c08
_080E0B70: .4byte REG_BG1CNT
_080E0B74: .4byte gAnimBankAttacker
_080E0B78: .4byte gSprites
_080E0B7C: .4byte gObjectBankIDs
_080E0B80: .4byte gSharedMem + 0x19348
_080E0B84:
	ldr r4, _080E0BA4 @ =gAnimBankAttacker
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
_080E0BA4: .4byte gAnimBankAttacker
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
	ldr r0, _080E0C60 @ =gAnimBankAttacker
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
	ldr r2, _080E0C78 @ =gBattle_BG1_X
	ldr r0, _080E0C7C @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x20]
	negs r0, r0
	adds r0, 0x60
	strh r0, [r2]
	ldr r2, _080E0C80 @ =gBattle_BG1_Y
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
_080E0C60: .4byte gAnimBankAttacker
_080E0C64: .4byte 0x040000d4
_080E0C68: .4byte 0x85000400
_080E0C6C: .4byte gUnknown_08D1D574
_080E0C70: .4byte gUnknown_08D1D410
_080E0C74: .4byte gUnknown_08D1D54C
_080E0C78: .4byte gBattle_BG1_X
_080E0C7C: .4byte gSprites
_080E0C80: .4byte gBattle_BG1_Y
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
	ldr r2, _080E0DF4 @ =gBattle_BG1_X
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
	ldr r0, _080E0DF8 @ =gBattle_WIN0H
	strh r5, [r0]
	ldr r0, _080E0DFC @ =gBattle_WIN0V
	strh r5, [r0]
	ldr r0, _080E0E00 @ =REG_WININ
	ldr r2, _080E0E04 @ =0x00003f3f
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl IsContest
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
	ldr r0, _080E0E20 @ =gAnimBankAttacker
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
_080E0DF4: .4byte gBattle_BG1_X
_080E0DF8: .4byte gBattle_WIN0H
_080E0DFC: .4byte gBattle_WIN0V
_080E0E00: .4byte REG_WININ
_080E0E04: .4byte 0x00003f3f
_080E0E08: .4byte REG_BG1CNT
_080E0E0C: .4byte REG_BLDCNT
_080E0E10: .4byte gSprites
_080E0E14: .4byte 0x040000d4
_080E0E18: .4byte 0x85000200
_080E0E1C: .4byte gObjectBankIDs
_080E0E20: .4byte gAnimBankAttacker
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
	bl GetBankByIdentity
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
	ldr r2, _080E0F14 @ =gAnimMoveTurn
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
_080E0F14: .4byte gAnimMoveTurn
_080E0F18: .4byte gBattleAnimArgs
	thumb_func_end sub_80E0EE8
	
	.align 2, 0 @ Don't pad with nop.
