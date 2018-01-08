	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_812B2B8
sub_812B2B8: @ 812B2B8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0x40
	negs r0, r0
	bl BattleAnimAdjustPanning
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _0812B2DC
	ldr r0, _0812B2D8 @ =gSharedMem + 0x19348
	b _0812B2E6
	.align 2, 0
_0812B2D8: .4byte gSharedMem + 0x19348
_0812B2DC:
	ldr r1, _0812B304 @ =gAnimSpeciesByBanks
	ldr r0, _0812B308 @ =gAnimBankAttacker
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
_0812B2E6:
	ldrh r0, [r0]
	cmp r0, 0
	beq _0812B2F6
	lsls r1, r4, 24
	asrs r1, 24
	movs r2, 0x4
	bl PlayCry3
_0812B2F6:
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B304: .4byte gAnimSpeciesByBanks
_0812B308: .4byte gAnimBankAttacker
	thumb_func_end sub_812B2B8

	thumb_func_start sub_812B30C
sub_812B30C: @ 812B30C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0812B33C @ =gBattleAnimArgs
	ldrh r5, [r0]
	ldrb r0, [r0, 0x2]
	lsls r0, 24
	asrs r0, 24
	bl BattleAnimAdjustPanning
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	adds r0, r5, 0
	bl PlaySE1WithPanning
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B33C: .4byte gBattleAnimArgs
	thumb_func_end sub_812B30C

	thumb_func_start sub_812B340
sub_812B340: @ 812B340
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0812B370 @ =gBattleAnimArgs
	ldrh r5, [r0]
	ldrb r0, [r0, 0x2]
	lsls r0, 24
	asrs r0, 24
	bl BattleAnimAdjustPanning
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	adds r0, r5, 0
	bl PlaySE2WithPanning
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B370: .4byte gBattleAnimArgs
	thumb_func_end sub_812B340

	thumb_func_start sub_812B374
sub_812B374: @ 812B374
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	mov r8, r0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0812B3F8 @ =gBattleAnimArgs
	ldrb r5, [r0, 0x2]
	ldrb r6, [r0, 0x4]
	ldrh r1, [r0, 0x6]
	mov r9, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	bl BattleAnimAdjustPanning
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	asrs r5, 24
	adds r0, r5, 0
	bl BattleAnimAdjustPanning
	adds r5, r0, 0
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	lsls r6, 24
	asrs r6, 24
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl CalculatePanIncrement
	ldr r2, _0812B3FC @ =gTasks
	mov r3, r8
	lsls r1, r3, 2
	add r1, r8
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	strh r4, [r1, 0xA]
	strh r5, [r1, 0xC]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r1, 0xE]
	mov r0, r9
	strh r0, [r1, 0x12]
	strh r2, [r1, 0x1C]
	strh r4, [r1, 0x1E]
	ldr r2, _0812B400 @ =sub_812B404
	str r2, [r1]
	mov r0, r8
	bl _call_via_r2
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812B3F8: .4byte gBattleAnimArgs
_0812B3FC: .4byte gTasks
_0812B400: .4byte sub_812B404
	thumb_func_end sub_812B374

	thumb_func_start sub_812B404
sub_812B404: @ 812B404
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _0812B45C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r2, [r4, 0xE]
	ldrh r0, [r4, 0x1C]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x12
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bne _0812B43E
	movs r0, 0
	strh r0, [r4, 0x1C]
	ldrh r1, [r4, 0x1E]
	adds r0, r2, r1
	strh r0, [r4, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r4, r2]
	bl sub_8077104
	strh r0, [r4, 0x1E]
_0812B43E:
	ldr r1, _0812B460 @ =gUnknown_0202F7D2
	ldrh r0, [r4, 0x1E]
	strb r0, [r1]
	movs r3, 0x1E
	ldrsh r1, [r4, r3]
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _0812B456
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_0812B456:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B45C: .4byte gTasks
_0812B460: .4byte gUnknown_0202F7D2
	thumb_func_end sub_812B404

    .align 2, 0 @ Don't pad with nop.
    