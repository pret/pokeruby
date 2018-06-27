	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	@ normal

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
	ldr r0, _080E3038 @ =gBattle_WIN0H
	strh r7, [r0]
	ldr r0, _080E303C @ =gBattle_WIN0V
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
	bl IsContest
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
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080E3028
	ldr r5, _080E305C @ =gAnimBankAttacker
	ldrb r0, [r5]
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _080E2FDC
	ldrb r0, [r5]
	bl GetBattlerPosition
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
	ldr r1, _080E3064 @ =gBankSpriteIds
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
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _080E306C
	ldr r0, _080E3068 @ =gSharedMem + 0x19348
	ldrh r4, [r0]
	b _080E30B4
	.align 2, 0
_080E3038: .4byte gBattle_WIN0H
_080E303C: .4byte gBattle_WIN0V
_080E3040: .4byte REG_WININ
_080E3044: .4byte 0x00003f3f
_080E3048: .4byte 0x00003f3d
_080E304C: .4byte REG_BLDCNT
_080E3050: .4byte 0x00003f42
_080E3054: .4byte 0x00000c08
_080E3058: .4byte REG_BG1CNT
_080E305C: .4byte gAnimBankAttacker
_080E3060: .4byte gSprites
_080E3064: .4byte gBankSpriteIds
_080E3068: .4byte gSharedMem + 0x19348
_080E306C:
	ldr r4, _080E308C @ =gAnimBankAttacker
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080E3098
	ldr r1, _080E3090 @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080E3094 @ =gEnemyParty
	b _080E30A8
	.align 2, 0
_080E308C: .4byte gAnimBankAttacker
_080E3090: .4byte gBattlerPartyIndexes
_080E3094: .4byte gEnemyParty
_080E3098:
	ldr r1, _080E3160 @ =gBattlerPartyIndexes
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
	bl GetAnimBattlerSpriteId
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080E3168 @ =gAnimBankAttacker
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
	bl IsContest
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
	ldr r2, _080E3180 @ =gBattle_BG1_X
	ldr r0, _080E3184 @ =gSprites
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x20]
	negs r0, r0
	adds r0, 0x20
	strh r0, [r2]
	ldr r2, _080E3188 @ =gBattle_BG1_Y
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
_080E3160: .4byte gBattlerPartyIndexes
_080E3164: .4byte gPlayerParty
_080E3168: .4byte gAnimBankAttacker
_080E316C: .4byte 0x040000d4
_080E3170: .4byte 0x85000400
_080E3174: .4byte gUnknown_08D20A30
_080E3178: .4byte gUnknown_08D20A14
_080E317C: .4byte gUnknown_083DB568
_080E3180: .4byte gBattle_BG1_X
_080E3184: .4byte gSprites
_080E3188: .4byte gBattle_BG1_Y
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
	ldr r7, _080E32B0 @ =gBattle_BG1_Y
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
	ldr r0, _080E32B4 @ =gBattle_WIN0H
	strh r5, [r0]
	ldr r0, _080E32B8 @ =gBattle_WIN0V
	strh r5, [r0]
	ldr r0, _080E32BC @ =REG_WININ
	ldr r2, _080E32C0 @ =0x00003f3f
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl IsContest
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
	bl GetAnimBattlerSpriteId
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
	ldr r2, _080E32D8 @ =gBankSpriteIds
	ldr r0, _080E32DC @ =gAnimBankAttacker
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
_080E32B0: .4byte gBattle_BG1_Y
_080E32B4: .4byte gBattle_WIN0H
_080E32B8: .4byte gBattle_WIN0V
_080E32BC: .4byte REG_WININ
_080E32C0: .4byte 0x00003f3f
_080E32C4: .4byte REG_BG1CNT
_080E32C8: .4byte REG_BLDCNT
_080E32CC: .4byte gSprites
_080E32D0: .4byte 0x040000d4
_080E32D4: .4byte 0x85000200
_080E32D8: .4byte gBankSpriteIds
_080E32DC: .4byte gAnimBankAttacker
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
	ldr r0, _080E338C @ =gAnimBankAttacker
	b _080E3392
	.align 2, 0
_080E3388: .4byte gTasks
_080E338C: .4byte gAnimBankAttacker
_080E3390:
	ldr r0, _080E34B4 @ =gAnimBankTarget
_080E3392:
	ldrb r5, [r0]
	movs r0, 0x2
	mov r8, r5
	mov r2, r8
	eors r2, r0
	mov r8, r2
	bl IsContest
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
	ldr r0, _080E34B8 @ =gBattle_WIN0H
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080E34BC @ =gBattle_WIN0V
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
	bl IsContest
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
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _080E345E
	adds r0, r5, 0
	bl GetBattlerPosition
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
	ldr r0, _080E34DC @ =gBankSpriteIds
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
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _080E34E4
	ldr r0, _080E34E0 @ =gSharedMem + 0x19348
	ldrh r4, [r0]
	b _080E3522
	.align 2, 0
_080E34B4: .4byte gAnimBankTarget
_080E34B8: .4byte gBattle_WIN0H
_080E34BC: .4byte gBattle_WIN0V
_080E34C0: .4byte REG_WININ
_080E34C4: .4byte 0x00003f3f
_080E34C8: .4byte 0x00003f3d
_080E34CC: .4byte REG_BLDCNT
_080E34D0: .4byte 0x00003f42
_080E34D4: .4byte REG_BG1CNT
_080E34D8: .4byte gSprites
_080E34DC: .4byte gBankSpriteIds
_080E34E0: .4byte gSharedMem + 0x19348
_080E34E4:
	adds r0, r5, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080E3508
	ldr r1, _080E3500 @ =gBattlerPartyIndexes
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080E3504 @ =gEnemyParty
	b _080E3516
	.align 2, 0
_080E3500: .4byte gBattlerPartyIndexes
_080E3504: .4byte gEnemyParty
_080E3508:
	ldr r1, _080E3568 @ =gBattlerPartyIndexes
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
	ldr r6, _080E3570 @ =gBankSpriteIds
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
_080E3568: .4byte gBattlerPartyIndexes
_080E356C: .4byte gPlayerParty
_080E3570: .4byte gBankSpriteIds
_080E3574: .4byte gBattleStatMask1_Tilemap
_080E3578:
	ldr r0, _080E35B0 @ =gBattleStatMask2_Tilemap
	ldr r1, [sp, 0x4]
	bl LZDecompressVram
_080E3580:
	bl IsContest
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
	ldr r2, _080E3648 @ =gBattle_BG1_X
	movs r1, 0
	strh r1, [r2]
	ldr r0, _080E364C @ =gBattle_BG1_Y
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
_080E3648: .4byte gBattle_BG1_X
_080E364C: .4byte gBattle_BG1_Y
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
	ldr r0, _080E36D8 @ =gBankSpriteIds
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
	bl BattleAnimAdjustPanning2
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xEF
	bl PlaySE12WithPanning
	b _080E36F4
	.align 2, 0
_080E36D8: .4byte gBankSpriteIds
_080E36DC: .4byte sub_80E3704
_080E36E0:
	movs r0, 0x40
	negs r0, r0
	bl BattleAnimAdjustPanning2
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
	ldr r2, _080E3730 @ =gBattle_BG1_Y
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
_080E3730: .4byte gBattle_BG1_Y
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
	ldr r0, _080E3870 @ =gBattle_WIN0H
	strh r5, [r0]
	ldr r0, _080E3874 @ =gBattle_WIN0V
	strh r5, [r0]
	ldr r0, _080E3878 @ =REG_WININ
	ldr r2, _080E387C @ =0x00003f3f
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl IsContest
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
_080E3870: .4byte gBattle_WIN0H
_080E3874: .4byte gBattle_WIN0V
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
	ldr r0, _080E3A50 @ =gAnimBankAttacker
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
_080E3A50: .4byte gAnimBankAttacker
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
	ldr r0, _080E3AC8 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
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
_080E3AC8: .4byte gAnimBankAttacker
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
	ldr r6, _080E3B40 @ =gBattle_BG3_X
	lsls r0, r3, 16
	asrs r0, 24
	ldrh r4, [r6]
	adds r0, r4
	strh r0, [r6]
	ldr r4, _080E3B44 @ =gBattle_BG3_Y
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
_080E3B40: .4byte gBattle_BG3_X
_080E3B44: .4byte gBattle_BG3_Y
_080E3B48: .4byte gBattleAnimArgs
	thumb_func_end sub_80E3AD0

	thumb_func_start sub_80E3B4C
sub_80E3B4C: @ 80E3B4C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080E3B70 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
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
_080E3B70: .4byte gAnimBankAttacker
_080E3B74: .4byte gBattleAnimArgs
	thumb_func_end sub_80E3B4C

	thumb_func_start sub_80E3B78
sub_80E3B78: @ 80E3B78
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080E3B9C @ =gAnimBankTarget
	ldrb r0, [r0]
	bl GetBattlerSide
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
_080E3B9C: .4byte gAnimBankTarget
_080E3BA0: .4byte gBattleAnimArgs
	thumb_func_end sub_80E3B78

	thumb_func_start sub_80E3BA4
sub_80E3BA4: @ 80E3BA4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r5, _080E3BD0 @ =gBattleAnimArgs
	movs r4, 0
	ldr r0, _080E3BD4 @ =gAnimBankAttacker
	ldrb r2, [r0]
	movs r0, 0x2
	ldr r1, _080E3BD8 @ =gAnimBankTarget
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
_080E3BD4: .4byte gAnimBankAttacker
_080E3BD8: .4byte gAnimBankTarget
	thumb_func_end sub_80E3BA4

	thumb_func_start sub_80E3BDC
sub_80E3BDC: @ 80E3BDC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r6, _080E3C3C @ =gSprites
_080E3BE6:
	ldr r0, _080E3C40 @ =gAnimBankAttacker
	ldrb r0, [r0]
	cmp r4, r0
	beq _080E3C24
	lsls r0, r4, 24
	lsrs r0, 24
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080E3C24
	ldr r0, _080E3C44 @ =gBankSpriteIds
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
_080E3C40: .4byte gAnimBankAttacker
_080E3C44: .4byte gBankSpriteIds
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
	bl IsContest
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
	ldr r0, _080E3D34 @ =gBattle_WIN0H
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080E3D38 @ =gBattle_WIN0V
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
	bl IsContest
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
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _080E3D58
	ldr r0, _080E3D54 @ =gSharedMem + 0x19348
	ldrh r4, [r0]
	b _080E3D96
	.align 2, 0
_080E3D34: .4byte gBattle_WIN0H
_080E3D38: .4byte gBattle_WIN0V
_080E3D3C: .4byte REG_WININ
_080E3D40: .4byte 0x00003f3f
_080E3D44: .4byte 0x00003f3d
_080E3D48: .4byte REG_BLDCNT
_080E3D4C: .4byte 0x00003f42
_080E3D50: .4byte REG_BG1CNT
_080E3D54: .4byte gSharedMem + 0x19348
_080E3D58:
	adds r0, r7, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080E3D7C
	ldr r1, _080E3D74 @ =gBattlerPartyIndexes
	lsls r0, r7, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080E3D78 @ =gEnemyParty
	b _080E3D8A
	.align 2, 0
_080E3D74: .4byte gBattlerPartyIndexes
_080E3D78: .4byte gEnemyParty
_080E3D7C:
	ldr r1, _080E3E48 @ =gBattlerPartyIndexes
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
	ldr r5, _080E3E50 @ =gBankSpriteIds
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
	bl IsContest
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
	ldr r0, _080E3E54 @ =gBattle_BG1_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080E3E58 @ =gBattle_BG1_Y
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
_080E3E48: .4byte gBattlerPartyIndexes
_080E3E4C: .4byte gPlayerParty
_080E3E50: .4byte gBankSpriteIds
_080E3E54: .4byte gBattle_BG1_X
_080E3E58: .4byte gBattle_BG1_Y
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
	ldr r2, _080E3EA0 @ =gBattle_BG1_Y
	lsls r1, r4, 16
	asrs r1, 24
	ldrh r0, [r2]
	subs r0, r1
	strh r0, [r2]
	b _080E3EB0
	.align 2, 0
_080E3E9C: .4byte gTasks
_080E3EA0: .4byte gBattle_BG1_Y
_080E3EA4:
	ldr r1, _080E3ED4 @ =gBattle_BG1_Y
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
_080E3ED4: .4byte gBattle_BG1_Y
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
	ldr r0, _080E3FEC @ =gBattle_WIN0H
	strh r5, [r0]
	ldr r0, _080E3FF0 @ =gBattle_WIN0V
	strh r5, [r0]
	ldr r0, _080E3FF4 @ =REG_WININ
	ldr r2, _080E3FF8 @ =0x00003f3f
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl IsContest
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
_080E3FEC: .4byte gBattle_WIN0H
_080E3FF0: .4byte gBattle_WIN0V
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
	ldr r0, _080E4074 @ =gAnimBankAttacker
	b _080E407E
	.align 2, 0
_080E4074: .4byte gAnimBankAttacker
_080E4078:
	cmp r0, 0x2
	bne _080E4084
	ldr r0, _080E409C @ =gAnimBankTarget
_080E407E:
	ldrb r0, [r0]
	adds r4, r0, 0
	adds r4, 0x10
_080E4084:
	ldr r0, _080E40A0 @ =gBattleAnimArgs
	movs r1, 0x2
	ldrsh r0, [r0, r1]
	lsls r5, r0, 5
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _080E40A8
	ldr r0, _080E40A4 @ =gSharedMem + 0x14800
	b _080E40AA
	.align 2, 0
_080E409C: .4byte gAnimBankTarget
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
	ldr r0, _080E411C @ =gAnimBankAttacker
	b _080E4126
	.align 2, 0
_080E411C: .4byte gAnimBankAttacker
_080E4120:
	cmp r0, 0x2
	bne _080E412C
	ldr r0, _080E4148 @ =gAnimBankTarget
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
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _080E4158
	ldr r0, _080E4154 @ =gSharedMem + 0x14800
	b _080E415A
	.align 2, 0
_080E4148: .4byte gAnimBankTarget
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
	ldr r0, _080E41C4 @ =gAnimBankAttacker
	b _080E41CE
	.align 2, 0
_080E41C4: .4byte gAnimBankAttacker
_080E41C8:
	cmp r0, 0x2
	bne _080E41D4
	ldr r0, _080E41F4 @ =gAnimBankTarget
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
_080E41F4: .4byte gAnimBankTarget
_080E41F8: .4byte gPlttBufferUnfaded
_080E41FC: .4byte gPlttBufferFaded
	thumb_func_end sub_80E4178

	thumb_func_start sub_80E4200
sub_80E4200: @ 80E4200
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsContest
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
	ldr r2, _080E4254 @ =gAnimBankAttacker
	ldr r1, _080E4258 @ =gBankTarget
	ldrb r1, [r1]
	strb r1, [r2]
	ldr r2, _080E425C @ =gAnimBankTarget
	ldr r1, _080E4260 @ =gEffectBank
	ldrb r1, [r1]
	strb r1, [r2]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080E4254: .4byte gAnimBankAttacker
_080E4258: .4byte gBankTarget
_080E425C: .4byte gAnimBankTarget
_080E4260: .4byte gEffectBank
	thumb_func_end sub_80E4234

	thumb_func_start sub_80E4264
sub_80E4264: @ 80E4264
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080E428C @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	adds r4, r0, 0
	ldr r0, _080E4290 @ =gAnimBankTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080E4298
	ldr r1, _080E4294 @ =gBattleAnimArgs
	movs r0, 0x1
	b _080E429C
	.align 2, 0
_080E428C: .4byte gAnimBankAttacker
_080E4290: .4byte gAnimBankTarget
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
	ldr r2, _080E42C8 @ =gAnimBankTarget
	ldr r1, _080E42CC @ =gBankTarget
	ldrb r1, [r1]
	strb r1, [r2]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080E42C8: .4byte gAnimBankTarget
_080E42CC: .4byte gBankTarget
	thumb_func_end sub_80E42B0

	thumb_func_start sub_80E42D0
sub_80E42D0: @ 80E42D0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E42F0 @ =gAnimBankAttacker
	ldr r1, _080E42F4 @ =gBankAttacker
	ldrb r1, [r1]
	strb r1, [r2]
	ldr r2, _080E42F8 @ =gAnimBankTarget
	ldr r1, _080E42FC @ =gEffectBank
	ldrb r1, [r1]
	strb r1, [r2]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080E42F0: .4byte gAnimBankAttacker
_080E42F4: .4byte gBankAttacker
_080E42F8: .4byte gAnimBankTarget
_080E42FC: .4byte gEffectBank
	thumb_func_end sub_80E42D0

	thumb_func_start sub_80E4300
sub_80E4300: @ 80E4300
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsContest
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
	ldr r1, _080E4358 @ =gAnimBankAttacker
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
_080E4358: .4byte gAnimBankAttacker
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
	ldr r0, _080E43B4 @ =gAnimBankAttacker
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
_080E43B4: .4byte gAnimBankAttacker
_080E43B8: .4byte gSharedMem + 0x17800
_080E43BC: .4byte gTasks
	thumb_func_end sub_80E4368
	
	.align 2, 0 @ Don't pad with nop.
