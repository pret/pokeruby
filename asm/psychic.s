	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	@ psychic

	thumb_func_start sub_80DC3F4
sub_80DC3F4: @ 80DC3F4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080DC41C @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080DC4CE
	cmp r0, 0x1
	bgt _080DC420
	cmp r0, 0
	beq _080DC426
	b _080DC4E6
	.align 2, 0
_080DC41C: .4byte gTasks
_080DC420:
	cmp r0, 0x2
	beq _080DC4E0
	b _080DC4E6
_080DC426:
	ldrh r3, [r5, 0x22]
	ldrh r4, [r5, 0x24]
	movs r2, 0x24
	ldrsh r1, [r5, r2]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bgt _080DC4BE
	ldr r0, _080DC470 @ =gSineTable
	mov r9, r0
	movs r7, 0x3
	ldr r1, _080DC474 @ =gScanlineEffectRegBuffers
	mov r12, r1
	movs r2, 0xF0
	lsls r2, 3
	add r2, r12
	mov r8, r2
_080DC448:
	lsls r2, r3, 16
	asrs r0, r2, 15
	add r0, r9
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r3, 0x20
	ldrsh r1, [r5, r3]
	asrs r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	asrs r3, r0, 16
	adds r6, r2, 0
	cmp r3, 0
	ble _080DC478
	ldrh r1, [r5, 0xA]
	adds r0, r7, 0
	ands r0, r1
	adds r0, r3, r0
	b _080DC484
	.align 2, 0
_080DC470: .4byte gSineTable
_080DC474: .4byte gScanlineEffectRegBuffers
_080DC478:
	cmp r3, 0
	bge _080DC488
	ldrh r1, [r5, 0xA]
	adds r0, r7, 0
	ands r0, r1
	subs r0, r3, r0
_080DC484:
	lsls r0, 16
	lsrs r1, r0, 16
_080DC488:
	lsls r2, r4, 16
	asrs r2, 16
	lsls r3, r2, 1
	mov r0, r12
	adds r4, r3, r0
	ldrh r0, [r5, 0x1C]
	lsls r1, 16
	asrs r1, 16
	adds r0, r1, r0
	strh r0, [r4]
	add r3, r8
	ldrh r0, [r5, 0x1C]
	adds r1, r0
	strh r1, [r3]
	asrs r0, r6, 16
	ldrh r1, [r5, 0x1E]
	adds r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	adds r2, 0x1
	lsls r2, 16
	lsrs r4, r2, 16
	asrs r2, 16
	movs r1, 0x26
	ldrsh r0, [r5, r1]
	cmp r2, r0
	ble _080DC448
_080DC4BE:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x17
	ble _080DC4E6
	b _080DC4D4
_080DC4CE:
	ldr r1, _080DC4DC @ =gScanlineEffect
	movs r0, 0x3
	strb r0, [r1, 0x15]
_080DC4D4:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080DC4E6
	.align 2, 0
_080DC4DC: .4byte gScanlineEffect
_080DC4E0:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080DC4E6:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80DC3F4

	thumb_func_start sub_80DC4F4
sub_80DC4F4: @ 80DC4F4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r4, r0, 24
	mov r8, r4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080DC528 @ =gTasks
	adds r7, r0, r1
	bl AllocOamMatrix
	lsls r0, 24
	lsrs r5, r0, 24
	mov r10, r5
	adds r6, r5, 0
	cmp r6, 0xFF
	bne _080DC52C
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	b _080DC5D6
	.align 2, 0
_080DC528: .4byte gTasks
_080DC52C:
	ldr r1, _080DC550 @ =gBattleAnimArgs
	ldrb r0, [r1]
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	lsls r0, 16
	lsrs r1, r0, 16
	mov r9, r1
	asrs r0, 16
	cmp r0, 0
	bge _080DC554
	adds r0, r5, 0
	bl FreeOamMatrix
	mov r0, r8
	bl DestroyAnimVisualTask
	b _080DC5D6
	.align 2, 0
_080DC550: .4byte gBattleAnimArgs
_080DC554:
	ldr r2, _080DC5E4 @ =gSprites
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r0, r2, 0
	adds r0, 0x1C
	adds r0, r4, r0
	ldr r1, _080DC5E8 @ =SpriteCallbackDummy
	str r1, [r0]
	adds r4, r2
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x1F
	ands r6, r0
	lsls r2, r6, 1
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x3]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, 0
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r1, r9
	lsls r0, r1, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrb r3, [r4, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	adds r0, r4, 0
	bl CalcCenterToCornerVec
	ldr r1, _080DC5EC @ =gBattleAnimArgs
	ldrb r0, [r1]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7, 0x22]
	mov r0, r10
	strh r0, [r7, 0x24]
	mov r1, r9
	strh r1, [r7, 0x26]
	ldr r0, _080DC5F0 @ =sub_80DC5F4
	str r0, [r7]
_080DC5D6:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DC5E4: .4byte gSprites
_080DC5E8: .4byte SpriteCallbackDummy
_080DC5EC: .4byte gBattleAnimArgs
_080DC5F0: .4byte sub_80DC5F4
	thumb_func_end sub_80DC4F4

	thumb_func_start sub_80DC5F4
sub_80DC5F4: @ 80DC5F4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080DC618 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080DC678
	cmp r0, 0x1
	bgt _080DC61C
	cmp r0, 0
	beq _080DC626
	b _080DC6F8
	.align 2, 0
_080DC618: .4byte gTasks
_080DC61C:
	cmp r0, 0x2
	beq _080DC6C8
	cmp r0, 0x3
	beq _080DC6E8
	b _080DC6F8
_080DC626:
	ldrh r0, [r4, 0xA]
	adds r0, 0x4
	strh r0, [r4, 0xA]
	ldr r1, _080DC674 @ =gSineTable
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	lsls r1, 16
	asrs r1, 17
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	subs r0, r1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x22]
	lsls r1, 24
	lsrs r1, 24
	bl sub_8079AB8
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0x30
	bne _080DC6F8
	b _080DC6DA
	.align 2, 0
_080DC674: .4byte gSineTable
_080DC678:
	ldrh r0, [r4, 0xA]
	subs r0, 0x4
	strh r0, [r4, 0xA]
	ldr r1, _080DC6C4 @ =gSineTable
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	lsls r1, 16
	asrs r1, 17
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	subs r0, r1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x22]
	lsls r1, 24
	lsrs r1, 24
	bl sub_8079AB8
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080DC6F8
	b _080DC6DA
	.align 2, 0
_080DC6C4: .4byte gSineTable
_080DC6C8:
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080DC6E4 @ =gSprites
	adds r0, r1
	bl obj_delete_but_dont_free_vram
_080DC6DA:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080DC6F8
	.align 2, 0
_080DC6E4: .4byte gSprites
_080DC6E8:
	ldrh r0, [r4, 0x24]
	lsls r0, 24
	lsrs r0, 24
	bl FreeOamMatrix
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080DC6F8:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80DC5F4

	thumb_func_start sub_80DC700
sub_80DC700: @ 80DC700
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080DC778
	cmp r0, 0x1
	bgt _080DC716
	cmp r0, 0
	beq _080DC720
	b _080DC818
_080DC716:
	cmp r0, 0x2
	beq _080DC7AA
	cmp r0, 0x3
	beq _080DC808
	b _080DC818
_080DC720:
	ldr r4, _080DC76C @ =gAnimBankAttacker
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
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _080DC74E
	ldrh r0, [r5, 0x22]
	adds r0, 0xC
	strh r0, [r5, 0x22]
_080DC74E:
	movs r0, 0x8
	strh r0, [r5, 0x30]
	ldr r1, _080DC770 @ =REG_BLDCNT
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _080DC774 @ =REG_BLDALPHA
	ldrh r1, [r5, 0x30]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r0, r1
	strh r0, [r2]
	b _080DC7A2
	.align 2, 0
_080DC76C: .4byte gAnimBankAttacker
_080DC770: .4byte REG_BLDCNT
_080DC774: .4byte REG_BLDALPHA
_080DC778:
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080DC818
	movs r0, 0x40
	negs r0, r0
	bl BattleAnimAdjustPanning
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xCB
	bl PlaySE12WithPanning
	adds r0, r5, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnim
_080DC7A2:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080DC818
_080DC7AA:
	ldrh r0, [r5, 0x32]
	adds r1, r0, 0x1
	strh r1, [r5, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080DC7E8
	movs r0, 0
	strh r0, [r5, 0x32]
	ldrh r1, [r5, 0x30]
	subs r1, 0x1
	strh r1, [r5, 0x30]
	ldr r2, _080DC804 @ =REG_BLDALPHA
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080DC7E8
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_080DC7E8:
	movs r0, 0xE0
	lsls r0, 2
	adds r2, r0, 0
	ldrh r1, [r5, 0x34]
	adds r2, r1
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r5, 0x26]
	subs r0, r1
	strh r0, [r5, 0x26]
	movs r0, 0xFF
	ands r2, r0
	strh r2, [r5, 0x34]
	b _080DC818
	.align 2, 0
_080DC804: .4byte REG_BLDALPHA
_080DC808:
	ldr r0, _080DC820 @ =REG_BLDCNT
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, r5, 0
	bl DestroyAnimSprite
_080DC818:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DC820: .4byte REG_BLDCNT
	thumb_func_end sub_80DC700
	
	.align 2, 0 @ Don't pad with nop.
