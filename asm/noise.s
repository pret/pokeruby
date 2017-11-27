	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80D2D68
sub_80D2D68: @ 80D2D68
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r0, _080D2D7C @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080D2D84
	ldr r0, _080D2D80 @ =gBattleAnimBankAttacker
	b _080D2D86
	.align 2, 0
_080D2D7C: .4byte gBattleAnimArgs
_080D2D80: .4byte gBattleAnimBankAttacker
_080D2D84:
	ldr r0, _080D2E1C @ =gBattleAnimBankTarget
_080D2D86:
	ldrb r6, [r0]
	adds r0, r6, 0
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080D2DA0
	ldr r1, _080D2E20 @ =gBattleAnimArgs
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1, 0x2]
_080D2DA0:
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	ldr r7, _080D2E20 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r3, [r7, 0x2]
	adds r0, r3
	movs r4, 0
	strh r0, [r5, 0x20]
	adds r0, r6, 0
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r7, 0x4]
	adds r0, r1
	strh r0, [r5, 0x22]
	strh r4, [r5, 0x2E]
	ldrh r1, [r5, 0x20]
	lsls r1, 3
	strh r1, [r5, 0x30]
	lsls r0, 3
	strh r0, [r5, 0x32]
	movs r2, 0x2
	ldrsh r0, [r7, r2]
	lsls r0, 3
	cmp r0, 0
	bge _080D2DE0
	adds r0, 0x7
_080D2DE0:
	asrs r0, 3
	strh r0, [r5, 0x34]
	movs r3, 0x4
	ldrsh r0, [r7, r3]
	lsls r0, 3
	cmp r0, 0
	bge _080D2DF0
	adds r0, 0x7
_080D2DF0:
	asrs r0, 3
	strh r0, [r5, 0x36]
	ldrh r2, [r5, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	movs r3, 0x6
	ldrsh r0, [r7, r3]
	lsls r0, 4
	adds r1, r0
	ldr r3, _080D2E24 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080D2E28 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	ldr r0, _080D2E2C @ =sub_80D2E30
	str r0, [r5, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D2E1C: .4byte gBattleAnimBankTarget
_080D2E20: .4byte gBattleAnimArgs
_080D2E24: .4byte 0x000003ff
_080D2E28: .4byte 0xfffffc00
_080D2E2C: .4byte sub_80D2E30
	thumb_func_end sub_80D2D68

	thumb_func_start sub_80D2E30
sub_80D2E30: @ 80D2E30
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x34]
	ldrh r1, [r2, 0x30]
	adds r0, r1
	strh r0, [r2, 0x30]
	ldrh r1, [r2, 0x36]
	ldrh r3, [r2, 0x32]
	adds r1, r3
	strh r1, [r2, 0x32]
	lsls r0, 16
	asrs r0, 19
	strh r0, [r2, 0x20]
	lsls r1, 16
	asrs r1, 19
	strh r1, [r2, 0x22]
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080D2E64
	adds r0, r2, 0
	bl move_anim_8072740
_080D2E64:
	pop {r0}
	bx r0
	thumb_func_end sub_80D2E30
	
	.align 2, 0 @ Don't pad with nop.
