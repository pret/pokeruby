	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	@ rain

	thumb_func_start sub_80D30F0
sub_80D30F0: @ 80D30F0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	ldr r1, _080D3178 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080D3118
	ldr r1, _080D317C @ =gBattleAnimArgs
	ldrh r0, [r1]
	strh r0, [r5, 0xA]
	ldrh r0, [r1, 0x2]
	strh r0, [r5, 0xC]
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0xE]
_080D3118:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r2, 0x8
	ldrsh r0, [r5, r2]
	movs r2, 0xC
	ldrsh r1, [r5, r2]
	bl __modsi3
	cmp r0, 0x1
	bne _080D3160
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF0
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x50
	bl __umodsi3
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _080D3180 @ =gSpriteTemplate_83D9130
	adds r1, r4, 0
	movs r3, 0x4
	bl CreateSprite
_080D3160:
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	movs r2, 0xE
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _080D3172
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080D3172:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D3178: .4byte gTasks
_080D317C: .4byte gBattleAnimArgs
_080D3180: .4byte gSpriteTemplate_83D9130
	thumb_func_end sub_80D30F0

	thumb_func_start sub_80D3184
sub_80D3184: @ 80D3184
	ldr r1, _080D318C @ =sub_80D3190
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080D318C: .4byte sub_80D3190
	thumb_func_end sub_80D3184

	thumb_func_start sub_80D3190
sub_80D3190: @ 80D3190
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xD
	bgt _080D31AE
	ldrh r0, [r2, 0x24]
	adds r0, 0x1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x26]
	adds r0, 0x4
	strh r0, [r2, 0x26]
_080D31AE:
	adds r0, r2, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080D31C2
	adds r0, r2, 0
	bl DestroySprite
_080D31C2:
	pop {r0}
	bx r0
	thumb_func_end sub_80D3190
	
	.align 2, 0 @ Don't pad with nop.
