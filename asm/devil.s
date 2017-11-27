	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80D2ABC
sub_80D2ABC: @ 80D2ABC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D2AF6
	ldr r1, _080D2BB8 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
	ldr r0, _080D2BBC @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	bl sub_8079E90
	subs r0, 0x1
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	movs r0, 0x1
	strh r0, [r4, 0x32]
_080D2AF6:
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x2E]
	adds r0, r2
	strh r0, [r4, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	lsls r1, r0, 2
	adds r0, r1, 0
	cmp r1, 0
	bge _080D2B0C
	adds r0, 0xFF
_080D2B0C:
	asrs r0, 8
	lsls r0, 8
	subs r0, r1, r0
	strh r0, [r4, 0x30]
	lsls r0, 16
	cmp r0, 0
	bge _080D2B1E
	movs r0, 0
	strh r0, [r4, 0x30]
_080D2B1E:
	movs r0, 0x30
	ldrsh r2, [r4, r0]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _080D2B2C
	adds r0, 0x3
_080D2B2C:
	asrs r0, 2
	movs r1, 0x1E
	subs r1, r0
	adds r0, r2, 0
	bl Cos
	strh r0, [r4, 0x24]
	movs r0, 0x30
	ldrsh r2, [r4, r0]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _080D2B48
	adds r0, 0x7
_080D2B48:
	asrs r0, 3
	movs r1, 0xA
	subs r1, r0
	adds r0, r2, 0
	bl Sin
	strh r0, [r4, 0x26]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0x80
	ble _080D2B6C
	ldrh r1, [r4, 0x32]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080D2B6C
	ldr r0, _080D2BC0 @ =0x0000ffff
	strh r0, [r4, 0x32]
_080D2B6C:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D2B80
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bge _080D2B80
	movs r0, 0x1
	strh r0, [r4, 0x32]
_080D2B80:
	ldrh r0, [r4, 0x34]
	adds r1, r0, 0x1
	strh r1, [r4, 0x34]
	subs r0, 0x9
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x46
	bls _080D2BC4
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsrs r0, r1, 31
	adds r0, r1, r0
	asrs r0, 1
	lsls r0, 1
	subs r1, r0
	adds r3, r4, 0
	adds r3, 0x3E
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _080D2BD2
	.align 2, 0
_080D2BB8: .4byte gBattleAnimArgs
_080D2BBC: .4byte gBattleAnimBankTarget
_080D2BC0: .4byte 0x0000ffff
_080D2BC4:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080D2BD2:
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0x5A
	ble _080D2BE0
	adds r0, r4, 0
	bl move_anim_8072740
_080D2BE0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D2ABC
	
	.align 2, 0 @ Don't pad with nop.
