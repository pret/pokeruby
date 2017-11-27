	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	@ heated_rock

	thumb_func_start sub_80D58FC
sub_80D58FC: @ 80D58FC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80D59B0
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080D5936
	ldr r3, _080D593C @ =gTasks
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x3A
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
	bl DestroySprite
_080D5936:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D593C: .4byte gTasks
	thumb_func_end sub_80D58FC

	thumb_func_start sub_80D5940
sub_80D5940: @ 80D5940
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080D5978 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r2, [r1, 0x26]
	ldrh r0, [r1, 0x22]
	adds r2, r0
	adds r1, 0x29
	movs r0, 0
	ldrsb r0, [r1, r0]
	adds r0, r2
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _080D597C @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080D5980
	lsls r0, r4, 16
	movs r1, 0x94
	lsls r1, 15
	b _080D5986
	.align 2, 0
_080D5978: .4byte gSprites
_080D597C: .4byte gBattleAnimBankAttacker
_080D5980:
	lsls r0, r4, 16
	movs r1, 0xB0
	lsls r1, 14
_080D5986:
	adds r0, r1
	lsrs r4, r0, 16
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80D5940

	thumb_func_start sub_80D5994
sub_80D5994: @ 80D5994
	movs r3, 0
	strh r3, [r0, 0x2E]
	strh r3, [r0, 0x30]
	ldrh r3, [r0, 0x20]
	lsls r3, 3
	strh r3, [r0, 0x32]
	ldrh r3, [r0, 0x22]
	lsls r3, 3
	strh r3, [r0, 0x34]
	lsls r1, 3
	strh r1, [r0, 0x36]
	lsls r2, 3
	strh r2, [r0, 0x38]
	bx lr
	thumb_func_end sub_80D5994

	thumb_func_start sub_80D59B0
sub_80D59B0: @ 80D59B0
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080D59DA
	movs r0, 0
	strh r0, [r2, 0x2E]
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	ldrh r0, [r2, 0x30]
	adds r1, r0, 0
	muls r1, r0
	adds r0, r1, 0
	ldrh r3, [r2, 0x34]
	adds r0, r3
	strh r0, [r2, 0x34]
_080D59DA:
	ldrh r0, [r2, 0x36]
	ldrh r1, [r2, 0x32]
	adds r0, r1
	strh r0, [r2, 0x32]
	lsls r0, 16
	asrs r0, 19
	strh r0, [r2, 0x20]
	ldrh r1, [r2, 0x38]
	ldrh r3, [r2, 0x34]
	adds r1, r3
	strh r1, [r2, 0x34]
	lsls r1, 16
	asrs r3, r1, 19
	strh r3, [r2, 0x22]
	adds r0, 0x8
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 17
	cmp r0, r1
	bhi _080D5A10
	adds r1, r3, 0
	movs r0, 0x8
	negs r0, r0
	cmp r1, r0
	blt _080D5A10
	cmp r1, 0x78
	ble _080D5A1C
_080D5A10:
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_080D5A1C:
	pop {r0}
	bx r0
	thumb_func_end sub_80D59B0

	thumb_func_start sub_80D5A20
sub_80D5A20: @ 80D5A20
	push {r4,r5,lr}
	ldr r3, _080D5A64 @ =gBattleAnimArgs
	ldrh r1, [r3]
	movs r2, 0
	strh r1, [r0, 0x20]
	ldrh r1, [r3, 0x2]
	strh r1, [r0, 0x22]
	strh r2, [r0, 0x2E]
	strh r2, [r0, 0x30]
	strh r2, [r0, 0x32]
	ldrh r1, [r3, 0x4]
	strh r1, [r0, 0x3A]
	ldrh r1, [r3, 0x6]
	strh r1, [r0, 0x3C]
	ldrh r4, [r0, 0x4]
	lsls r2, r4, 22
	lsrs r2, 22
	movs r5, 0x8
	ldrsh r1, [r3, r5]
	lsls r1, 4
	adds r2, r1
	ldr r3, _080D5A68 @ =0x000003ff
	adds r1, r3, 0
	ands r2, r1
	ldr r1, _080D5A6C @ =0xfffffc00
	ands r1, r4
	orrs r1, r2
	strh r1, [r0, 0x4]
	ldr r1, _080D5A70 @ =sub_80D5A74
	str r1, [r0, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D5A64: .4byte gBattleAnimArgs
_080D5A68: .4byte 0x000003ff
_080D5A6C: .4byte 0xfffffc00
_080D5A70: .4byte sub_80D5A74
	thumb_func_end sub_80D5A20

	thumb_func_start sub_80D5A74
sub_80D5A74: @ 80D5A74
	push {r4,lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	beq _080D5AA6
	cmp r0, 0x1
	bgt _080D5A8A
	cmp r0, 0
	beq _080D5A90
	b _080D5B04
_080D5A8A:
	cmp r0, 0x2
	beq _080D5AC4
	b _080D5B04
_080D5A90:
	ldrh r1, [r2, 0x3A]
	movs r3, 0x3A
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _080D5AA0
	subs r0, r1, 0x1
	strh r0, [r2, 0x3A]
	b _080D5B04
_080D5AA0:
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
_080D5AA6:
	ldrh r0, [r2, 0x22]
	adds r0, 0x8
	strh r0, [r2, 0x22]
	lsls r0, 16
	asrs r0, 16
	ldrh r3, [r2, 0x3C]
	movs r4, 0x3C
	ldrsh r1, [r2, r4]
	cmp r0, r1
	blt _080D5B04
	strh r3, [r2, 0x22]
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	b _080D5B04
_080D5AC4:
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D5AF0
	movs r0, 0
	strh r0, [r2, 0x30]
	ldrh r0, [r2, 0x32]
	adds r0, 0x1
	strh r0, [r2, 0x32]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D5AEC
	ldr r0, _080D5AE8 @ =0x0000fffd
	b _080D5AEE
	.align 2, 0
_080D5AE8: .4byte 0x0000fffd
_080D5AEC:
	movs r0, 0x3
_080D5AEE:
	strh r0, [r2, 0x26]
_080D5AF0:
	ldrh r0, [r2, 0x34]
	adds r0, 0x1
	strh r0, [r2, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080D5B04
	adds r0, r2, 0
	bl move_anim_8072740
_080D5B04:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D5A74
	
	.align 2, 0 @ Don't pad with nop.
