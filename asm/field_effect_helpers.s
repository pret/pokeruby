	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start SetUpReflection
SetUpReflection: @ 812680C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	adds r4, r1, 0
	lsls r5, r2, 24
	lsrs r5, 24
	movs r0, 0x20
	ldrsh r1, [r4, r0]
	movs r0, 0x22
	ldrsh r2, [r4, r0]
	adds r0, r4, 0
	movs r3, 0x98
	bl obj_unfreeze
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _081268BC @ =gSprites
	adds r7, r1, r0
	ldr r0, _081268C0 @ =sub_81269E0
	str r0, [r7, 0x1C]
	ldrb r1, [r7, 0x5]
	movs r0, 0xC
	orrs r1, r0
	strb r1, [r7, 0x5]
	ldr r2, _081268C4 @ =gUnknown_0830FD14
	lsrs r0, r1, 4
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 4
	movs r2, 0xF
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, 0x5]
	movs r1, 0x3F
	adds r1, r7
	mov r8, r1
	ldrb r0, [r1]
	movs r1, 0x40
	orrs r0, r1
	mov r1, r8
	strb r0, [r1]
	ldr r0, _081268C8 @ =gDummySpriteAnimTable
	str r0, [r7, 0x8]
	adds r0, r7, 0
	movs r1, 0
	bl StartSpriteAnim
	ldr r0, _081268CC @ =gDummySpriteAffineAnimTable
	str r0, [r7, 0x10]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x8
	orrs r0, r1
	mov r1, r8
	strb r0, [r1]
	adds r2, r7, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x2E]
	strh r0, [r7, 0x2E]
	ldrb r0, [r6, 0x8]
	strh r0, [r7, 0x30]
	strh r5, [r7, 0x3C]
	adds r0, r6, 0
	adds r1, r7, 0
	bl npc_pal_op
	cmp r5, 0
	bne _081268B2
	ldrb r0, [r7, 0x1]
	movs r1, 0x4
	negs r1, r1
	ands r1, r0
	movs r0, 0x1
	orrs r1, r0
	strb r1, [r7, 0x1]
_081268B2:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081268BC: .4byte gSprites
_081268C0: .4byte sub_81269E0
_081268C4: .4byte gUnknown_0830FD14
_081268C8: .4byte gDummySpriteAnimTable
_081268CC: .4byte gDummySpriteAffineAnimTable
	thumb_func_end SetUpReflection

	thumb_func_start sub_81268D0
sub_81268D0: @ 81268D0
	push {lr}
	ldrb r0, [r0, 0x5]
	bl GetFieldObjectGraphicsInfo
	ldrh r0, [r0, 0xA]
	subs r0, 0x2
	lsls r0, 16
	asrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_81268D0

	thumb_func_start npc_pal_op
npc_pal_op: @ 81268E4
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r1, _0812693C @ =gUnknown_08401E2C
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	movs r0, 0
	strh r0, [r4, 0x32]
	ldrb r0, [r5, 0x5]
	bl GetFieldObjectGraphicsInfo
	ldrb r1, [r0, 0xC]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08126940
	ldrb r0, [r5, 0x1F]
	bl sub_8057450
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _08126926
	ldrb r0, [r5, 0x1E]
	bl sub_8057450
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08126940
_08126926:
	subs r0, 0x1
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x32]
	ldrb r1, [r4, 0x5]
	lsrs r1, 4
	adds r0, r5, 0
	bl npc_pal_op_A
	b _0812694A
	.align 2, 0
_0812693C: .4byte gUnknown_08401E2C
_08126940:
	ldrb r1, [r4, 0x5]
	lsrs r1, 4
	adds r0, r5, 0
	bl npc_pal_op_B
_0812694A:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end npc_pal_op

	thumb_func_start npc_pal_op_B
npc_pal_op_B: @ 8126954
	push {r4,lr}
	lsls r1, 24
	lsrs r4, r1, 24
	ldrb r0, [r0, 0x5]
	bl GetFieldObjectGraphicsInfo
	adds r2, r0, 0
	ldrh r1, [r2, 0x4]
	ldr r0, _08126980 @ =0x000011ff
	cmp r1, r0
	beq _081269A8
	ldrb r0, [r2, 0xC]
	movs r1, 0xF
	ands r1, r0
	cmp r1, 0
	bne _08126984
	ldrh r0, [r2, 0x2]
	adds r1, r4, 0
	bl npc_load_two_palettes__no_record
	b _081269A2
	.align 2, 0
_08126980: .4byte 0x000011ff
_08126984:
	cmp r1, 0xA
	bne _08126992
	ldrh r0, [r2, 0x2]
	adds r1, r4, 0
	bl npc_load_two_palettes__and_record
	b _081269A2
_08126992:
	adds r0, r4, 0
	bl npc_paltag_by_palslot
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0
	bl pal_patch_for_npc
_081269A2:
	adds r0, r4, 0
	bl sub_807D78C
_081269A8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end npc_pal_op_B

	thumb_func_start npc_pal_op_A
npc_pal_op_A: @ 81269B0
	push {r4,lr}
	lsls r1, 24
	lsrs r4, r1, 24
	ldrb r0, [r0, 0x5]
	bl GetFieldObjectGraphicsInfo
	adds r2, r0, 0
	ldrh r1, [r2, 0x4]
	ldr r0, _081269DC @ =0x000011ff
	cmp r1, r0
	beq _081269D4
	adds r0, r1, 0
	adds r1, r4, 0
	bl pal_patch_for_npc
	adds r0, r4, 0
	bl sub_807D78C
_081269D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081269DC: .4byte 0x000011ff
	thumb_func_end npc_pal_op_A

	thumb_func_start sub_81269E0
sub_81269E0: @ 81269E0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08126A28 @ =gMapObjects
	adds r7, r0, r1
	ldrb r1, [r7, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08126A2C @ =gSprites
	adds r5, r0, r1
	ldr r0, [r7]
	ldr r1, _08126A30 @ =0x00020001
	ands r0, r1
	cmp r0, r1
	bne _08126A18
	ldrb r1, [r7, 0x8]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r1, r0
	beq _08126A34
_08126A18:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	b _08126B3E
	.align 2, 0
_08126A28: .4byte gMapObjects
_08126A2C: .4byte gSprites
_08126A30: .4byte 0x00020001
_08126A34:
	ldr r1, _08126B4C @ =gUnknown_0830FD14
	ldrb r0, [r5, 0x5]
	lsrs r0, 4
	adds r0, r1
	ldrb r1, [r0]
	lsls r1, 4
	ldrb r2, [r4, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	ldrb r1, [r5, 0x1]
	lsrs r1, 6
	lsls r1, 6
	ldrb r2, [r4, 0x1]
	movs r3, 0x3F
	adds r0, r3, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r5, 0x3]
	lsrs r0, 6
	lsls r0, 6
	ldrb r2, [r4, 0x3]
	adds r1, r3, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x3]
	ldrb r0, [r5, 0x3]
	lsls r0, 26
	lsrs r0, 27
	movs r2, 0x10
	orrs r0, r2
	lsls r0, 1
	subs r2, 0x4F
	mov r9, r2
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x3]
	ldrh r1, [r5, 0x4]
	lsls r1, 22
	lsrs r1, 22
	ldrh r2, [r4, 0x4]
	ldr r0, _08126B50 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	ldr r0, [r5, 0x18]
	str r0, [r4, 0x18]
	adds r0, r5, 0
	adds r0, 0x42
	ldrb r0, [r0]
	lsls r0, 26
	lsrs r0, 26
	adds r2, r4, 0
	adds r2, 0x42
	ands r3, r0
	ldrb r1, [r2]
	movs r0, 0x40
	negs r0, r0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	movs r0, 0x3E
	adds r0, r5
	mov r8, r0
	ldrb r0, [r0]
	adds r6, r4, 0
	adds r6, 0x3E
	movs r1, 0x4
	ands r1, r0
	ldrb r2, [r6]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6]
	ldrh r0, [r5, 0x20]
	strh r0, [r4, 0x20]
	adds r0, r7, 0
	bl sub_81268D0
	ldrh r1, [r5, 0x22]
	adds r0, r1
	ldrh r1, [r4, 0x32]
	adds r1, r0
	strh r1, [r4, 0x22]
	adds r0, r5, 0
	adds r0, 0x28
	ldrb r1, [r0]
	adds r0, r4, 0
	adds r0, 0x28
	strb r1, [r0]
	adds r0, r5, 0
	adds r0, 0x29
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x29
	strb r0, [r1]
	ldrh r0, [r5, 0x24]
	strh r0, [r4, 0x24]
	ldrh r0, [r5, 0x26]
	negs r0, r0
	strh r0, [r4, 0x26]
	mov r2, r8
	ldrb r0, [r2]
	movs r1, 0x2
	ands r1, r0
	ldrb r2, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08126B3E
	ldrb r0, [r4, 0x3]
	mov r2, r9
	ands r2, r0
	strb r2, [r4, 0x3]
	ldrb r0, [r5, 0x3]
	lsls r0, 26
	lsrs r0, 27
	movs r1, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08126B3E
	movs r1, 0x2
	adds r0, r2, 0
	orrs r0, r1
	strb r0, [r4, 0x3]
_08126B3E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126B4C: .4byte gUnknown_0830FD14
_08126B50: .4byte 0xfffffc00
	thumb_func_end sub_81269E0

	thumb_func_start sub_8126B54
sub_8126B54: @ 8126B54
	push {r4,lr}
	ldr r0, _08126B9C @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x20]
	movs r1, 0
	movs r2, 0
	movs r3, 0x52
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	cmp r0, 0x40
	beq _08126B92
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08126BA0 @ =gSprites
	adds r1, r0
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r1, 0x5]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x2
	orrs r0, r2
	orrs r0, r3
	strb r0, [r1]
_08126B92:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08126B9C: .4byte gFieldEffectObjectTemplatePointers
_08126BA0: .4byte gSprites
	thumb_func_end sub_8126B54

	thumb_func_start objid_set_invisible
objid_set_invisible: @ 8126BA4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08126BC0 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_08126BC0: .4byte gSprites
	thumb_func_end objid_set_invisible

	thumb_func_start sub_8126BC4
sub_8126BC4: @ 8126BC4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r2, 16
	lsrs r7, r2, 16
	lsls r3, 16
	lsrs r6, r3, 16
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	ldr r1, _08126C68 @ =gSprites
	adds r2, r0, r1
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _08126C0E
	movs r0, 0x2E
	ldrsh r1, [r2, r0]
	lsls r0, r7, 16
	asrs r0, 16
	cmp r1, r0
	bne _08126C0E
	movs r0, 0x30
	ldrsh r1, [r2, r0]
	lsls r0, r6, 16
	asrs r0, 16
	cmp r1, r0
	beq _08126C5A
_08126C0E:
	lsls r0, r7, 16
	asrs r0, 16
	lsls r1, r6, 16
	asrs r1, 16
	mov r4, sp
	adds r4, 0x2
	mov r2, sp
	adds r3, r4, 0
	bl sub_80603CC
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	ldr r1, _08126C68 @ =gSprites
	adds r2, r0, r1
	mov r0, sp
	ldrh r0, [r0]
	adds r0, 0x8
	strh r0, [r2, 0x20]
	ldrh r0, [r4]
	adds r0, 0x8
	strh r0, [r2, 0x22]
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	strh r7, [r2, 0x2E]
	strh r6, [r2, 0x30]
	mov r1, r8
	subs r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	adds r0, r2, 0
	bl StartSpriteAnim
_08126C5A:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126C68: .4byte gSprites
	thumb_func_end sub_8126BC4

	thumb_func_start FldEff_Shadow
FldEff_Shadow: @ 8126C6C
	push {r4,r5,lr}
	ldr r5, _08126CF8 @ =gUnknown_0202FF84
	ldrb r0, [r5]
	ldrb r1, [r5, 0x4]
	ldrb r2, [r5, 0x8]
	bl GetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08126CFC @ =gMapObjects
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x5]
	bl GetFieldObjectGraphicsInfo
	adds r4, r0, 0
	ldr r2, _08126D00 @ =gFieldEffectObjectTemplatePointers
	ldr r1, _08126D04 @ =gUnknown_08401E32
	ldrb r0, [r4, 0xC]
	lsls r0, 26
	lsrs r0, 30
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0
	movs r3, 0x94
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08126CF0
	ldr r0, _08126D08 @ =gSprites
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	ldr r0, [r5]
	strh r0, [r2, 0x2E]
	ldr r0, [r5, 0x4]
	strh r0, [r2, 0x30]
	ldr r0, [r5, 0x8]
	strh r0, [r2, 0x32]
	ldrh r1, [r4, 0xA]
	lsls r1, 16
	asrs r1, 17
	ldr r3, _08126D0C @ =gUnknown_08401E36
	ldrb r0, [r4, 0xC]
	lsls r0, 26
	lsrs r0, 30
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	subs r1, r0
	strh r1, [r2, 0x34]
_08126CF0:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08126CF8: .4byte gUnknown_0202FF84
_08126CFC: .4byte gMapObjects
_08126D00: .4byte gFieldEffectObjectTemplatePointers
_08126D04: .4byte gUnknown_08401E32
_08126D08: .4byte gSprites
_08126D0C: .4byte gUnknown_08401E36
	thumb_func_end FldEff_Shadow

	thumb_func_start oamc_shadow
oamc_shadow: @ 8126D10
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r0, [r5, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x30]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r5, 0x32]
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	beq _08126D3E
	adds r0, r5, 0
	movs r1, 0x3
	bl FieldEffectStop
	b _08126DC4
_08126D3E:
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08126DCC @ =gMapObjects
	adds r4, r0, r1
	ldrb r0, [r4, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08126DD0 @ =gSprites
	adds r1, r0
	ldrb r0, [r1, 0x5]
	movs r2, 0xC
	ands r2, r0
	ldrb r3, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r5, 0x5]
	ldrh r0, [r1, 0x20]
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x34]
	ldrh r1, [r1, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
	ldr r0, [r4]
	ldr r1, _08126DD4 @ =0x00400001
	ands r0, r1
	cmp r0, r1
	bne _08126DBC
	ldrb r0, [r4, 0x1E]
	bl sub_8056E14
	lsls r0, 24
	cmp r0, 0
	bne _08126DBC
	ldrb r0, [r4, 0x1E]
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	cmp r0, 0
	bne _08126DBC
	ldrb r0, [r4, 0x1F]
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	cmp r0, 0
	bne _08126DBC
	ldrb r0, [r4, 0x1E]
	bl MetatileBehavior_IsReflective
	lsls r0, 24
	cmp r0, 0
	bne _08126DBC
	ldrb r0, [r4, 0x1F]
	bl MetatileBehavior_IsReflective
	lsls r0, 24
	cmp r0, 0
	beq _08126DC4
_08126DBC:
	adds r0, r5, 0
	movs r1, 0x3
	bl FieldEffectStop
_08126DC4:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08126DCC: .4byte gMapObjects
_08126DD0: .4byte gSprites
_08126DD4: .4byte 0x00400001
	thumb_func_end oamc_shadow

	thumb_func_start FldEff_TallGrass
FldEff_TallGrass: @ 8126DD8
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _08126E70 @ =gUnknown_0202FF84
	ldrh r1, [r5]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r5, 0x4]
	mov r4, sp
	adds r4, 0x2
	strh r0, [r4]
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08126E74 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x10]
	mov r1, sp
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r3, 0
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08126E64
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08126E78 @ =gSprites
	adds r3, r0, r1
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x3
	ldrb r1, [r5, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x5]
	ldr r0, [r5, 0x8]
	strh r0, [r3, 0x2E]
	ldr r0, [r5]
	strh r0, [r3, 0x30]
	ldr r0, [r5, 0x4]
	strh r0, [r3, 0x32]
	ldr r0, [r5, 0x10]
	strh r0, [r3, 0x34]
	ldr r0, [r5, 0x14]
	strh r0, [r3, 0x36]
	ldr r0, [r5, 0x18]
	strh r0, [r3, 0x38]
	ldr r0, [r5, 0x1C]
	cmp r0, 0
	beq _08126E64
	adds r0, r3, 0
	movs r1, 0x4
	bl SeekSpriteAnim
_08126E64:
	movs r0, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08126E70: .4byte gUnknown_0202FF84
_08126E74: .4byte gFieldEffectObjectTemplatePointers
_08126E78: .4byte gSprites
	thumb_func_end FldEff_TallGrass

	thumb_func_start unc_grass_normal
unc_grass_normal: @ 8126E7C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r0, [r5, 0x38]
	lsrs r4, r0, 8
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r3, _08126F24 @ =gUnknown_0202E844
	ldrb r1, [r3]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08126EC6
	ldr r2, _08126F28 @ =gSaveBlock1
	movs r0, 0x5
	ldrsb r0, [r2, r0]
	cmp r0, r4
	bne _08126EAC
	movs r0, 0x4
	ldrsb r0, [r2, r0]
	cmp r0, r7
	beq _08126EC6
_08126EAC:
	ldr r1, [r3, 0x4]
	ldrh r0, [r5, 0x30]
	subs r0, r1
	strh r0, [r5, 0x30]
	ldr r1, [r3, 0x8]
	ldrh r0, [r5, 0x32]
	subs r0, r1
	strh r0, [r5, 0x32]
	ldrb r1, [r2, 0x5]
	lsls r1, 8
	ldrb r0, [r2, 0x4]
	orrs r0, r1
	strh r0, [r5, 0x38]
_08126EC6:
	ldrh r0, [r5, 0x34]
	lsrs r1, r0, 8
	mov r8, r1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrh r0, [r5, 0x36]
	lsls r0, 24
	lsrs r7, r0, 24
	movs r2, 0x30
	ldrsh r0, [r5, r2]
	movs r2, 0x32
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r6, r0, 24
	mov r0, r8
	adds r1, r4, 0
	adds r2, r7, 0
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _08126F1A
	adds r0, r6, 0
	bl MetatileBehavior_IsTallGrass
	lsls r0, 24
	cmp r0, 0
	beq _08126F1A
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08126F2C
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08126F2C
_08126F1A:
	adds r0, r5, 0
	movs r1, 0x4
	bl FieldEffectStop
	b _08126F70
	.align 2, 0
_08126F24: .4byte gUnknown_0202E844
_08126F28: .4byte gSaveBlock1
_08126F2C:
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08126F7C @ =gMapObjects
	adds r2, r0, r1
	ldr r0, [r2, 0x10]
	ldr r1, [r5, 0x30]
	cmp r0, r1
	beq _08126F4C
	ldr r0, [r2, 0x14]
	cmp r0, r1
	beq _08126F4C
	movs r0, 0x1
	strh r0, [r5, 0x3C]
_08126F4C:
	movs r6, 0
	adds r0, r5, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0
	bne _08126F5A
	movs r6, 0x4
_08126F5A:
	adds r0, r5, 0
	movs r1, 0
	bl sub_806487C
	ldrh r1, [r5, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	adds r2, r6, 0
	bl sub_812882C
_08126F70:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126F7C: .4byte gMapObjects
	thumb_func_end unc_grass_normal

	thumb_func_start FldEff_JumpTallGrass
FldEff_JumpTallGrass: @ 8126F80
	push {r4,lr}
	ldr r4, _08126FE4 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0xC
	bl sub_8060470
	ldr r0, _08126FE8 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x28]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08126FDC
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08126FEC @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r4, 0x8]
	strh r0, [r2, 0x2E]
	movs r0, 0xC
	strh r0, [r2, 0x30]
_08126FDC:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08126FE4: .4byte gUnknown_0202FF84
_08126FE8: .4byte gFieldEffectObjectTemplatePointers
_08126FEC: .4byte gSprites
	thumb_func_end FldEff_JumpTallGrass

	thumb_func_start sub_8126FF0
sub_8126FF0: @ 8126FF0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r4, [sp, 0x18]
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	movs r5, 0
	ldr r0, _08127060 @ =gSprites
	mov r8, r0
	lsls r3, 16
	asrs r3, 16
	lsls r4, 16
	asrs r4, 16
_08127014:
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	mov r1, r8
	adds r2, r0, r1
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _08127068
	ldr r1, [r2, 0x1C]
	ldr r0, _08127064 @ =unc_grass_normal
	cmp r1, r0
	bne _08127068
	movs r1, 0x30
	ldrsh r0, [r2, r1]
	cmp r3, r0
	bne _08127068
	movs r1, 0x32
	ldrsh r0, [r2, r1]
	cmp r4, r0
	bne _08127068
	ldrh r1, [r2, 0x34]
	lsrs r0, r1, 8
	cmp r12, r0
	bne _08127068
	movs r0, 0xFF
	ands r0, r1
	cmp r7, r0
	bne _08127068
	movs r1, 0x36
	ldrsh r0, [r2, r1]
	cmp r6, r0
	bne _08127068
	adds r0, r5, 0
	b _08127074
	.align 2, 0
_08127060: .4byte gSprites
_08127064: .4byte unc_grass_normal
_08127068:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3F
	bls _08127014
	movs r0, 0x40
_08127074:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8126FF0

	thumb_func_start FldEff_LongGrass
FldEff_LongGrass: @ 8127080
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _0812711C @ =gUnknown_0202FF84
	ldrh r1, [r5]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r5, 0x4]
	mov r4, sp
	adds r4, 0x2
	strh r0, [r4]
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08127120 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x3C]
	mov r1, sp
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r3, 0
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08127110
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08127124 @ =gSprites
	adds r4, r0, r1
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r5, 0x8]
	bl ZCoordToPriority
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	ldr r0, [r5, 0x8]
	strh r0, [r4, 0x2E]
	ldr r0, [r5]
	strh r0, [r4, 0x30]
	ldr r0, [r5, 0x4]
	strh r0, [r4, 0x32]
	ldr r0, [r5, 0x10]
	strh r0, [r4, 0x34]
	ldr r0, [r5, 0x14]
	strh r0, [r4, 0x36]
	ldr r0, [r5, 0x18]
	strh r0, [r4, 0x38]
	ldr r0, [r5, 0x1C]
	cmp r0, 0
	beq _08127110
	adds r0, r4, 0
	movs r1, 0x6
	bl SeekSpriteAnim
_08127110:
	movs r0, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0812711C: .4byte gUnknown_0202FF84
_08127120: .4byte gFieldEffectObjectTemplatePointers
_08127124: .4byte gSprites
	thumb_func_end FldEff_LongGrass

	thumb_func_start unc_grass_tall
unc_grass_tall: @ 8127128
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r0, [r5, 0x38]
	lsrs r7, r0, 8
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r3, _081271D0 @ =gUnknown_0202E844
	ldrb r1, [r3]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08127172
	ldr r2, _081271D4 @ =gSaveBlock1
	movs r0, 0x5
	ldrsb r0, [r2, r0]
	cmp r0, r7
	bne _08127158
	movs r0, 0x4
	ldrsb r0, [r2, r0]
	cmp r0, r6
	beq _08127172
_08127158:
	ldr r1, [r3, 0x4]
	ldrh r0, [r5, 0x30]
	subs r0, r1
	strh r0, [r5, 0x30]
	ldr r1, [r3, 0x8]
	ldrh r0, [r5, 0x32]
	subs r0, r1
	strh r0, [r5, 0x32]
	ldrb r1, [r2, 0x5]
	lsls r1, 8
	ldrb r0, [r2, 0x4]
	orrs r0, r1
	strh r0, [r5, 0x38]
_08127172:
	ldrh r0, [r5, 0x34]
	lsrs r1, r0, 8
	mov r8, r1
	lsls r0, 24
	lsrs r7, r0, 24
	ldrh r0, [r5, 0x36]
	lsls r0, 24
	lsrs r6, r0, 24
	movs r2, 0x30
	ldrsh r0, [r5, r2]
	movs r2, 0x32
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	mov r0, r8
	adds r1, r7, 0
	adds r2, r6, 0
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _081271C6
	adds r0, r4, 0
	bl MetatileBehavior_IsLongGrass
	lsls r0, 24
	cmp r0, 0
	beq _081271C6
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _081271D8
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _081271D8
_081271C6:
	adds r0, r5, 0
	movs r1, 0x11
	bl FieldEffectStop
	b _0812720E
	.align 2, 0
_081271D0: .4byte gUnknown_0202E844
_081271D4: .4byte gSaveBlock1
_081271D8:
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0812721C @ =gMapObjects
	adds r2, r0, r1
	ldr r0, [r2, 0x10]
	ldr r1, [r5, 0x30]
	cmp r0, r1
	beq _081271F8
	ldr r0, [r2, 0x14]
	cmp r0, r1
	beq _081271F8
	movs r0, 0x1
	strh r0, [r5, 0x3C]
_081271F8:
	adds r0, r5, 0
	movs r1, 0
	bl sub_806487C
	ldrh r1, [r5, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	movs r2, 0
	bl sub_812882C
_0812720E:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812721C: .4byte gMapObjects
	thumb_func_end unc_grass_tall

	thumb_func_start FldEff_JumpLongGrass
FldEff_JumpLongGrass: @ 8127220
	push {r4,lr}
	ldr r4, _08127284 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08127288 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x40]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0812727C
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _0812728C @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r4, 0x8]
	strh r0, [r2, 0x2E]
	movs r0, 0x12
	strh r0, [r2, 0x30]
_0812727C:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08127284: .4byte gUnknown_0202FF84
_08127288: .4byte gFieldEffectObjectTemplatePointers
_0812728C: .4byte gSprites
	thumb_func_end FldEff_JumpLongGrass

	thumb_func_start FldEff_ShortGrass
FldEff_ShortGrass: @ 8127290
	push {r4-r6,lr}
	ldr r6, _08127324 @ =gUnknown_0202FF84
	ldrb r0, [r6]
	ldrb r1, [r6, 0x4]
	ldrb r2, [r6, 0x8]
	bl GetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08127328 @ =gMapObjects
	adds r5, r1, r0
	ldr r0, _0812732C @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x78]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0812731C
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r4, _08127330 @ =gSprites
	adds r2, r4
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x5]
	movs r1, 0xC
	ands r1, r0
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r6]
	strh r0, [r2, 0x2E]
	ldr r0, [r6, 0x4]
	strh r0, [r2, 0x30]
	ldr r0, [r6, 0x8]
	strh r0, [r2, 0x32]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r0, [r0, 0x20]
	strh r0, [r2, 0x34]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r0, [r0, 0x22]
	strh r0, [r2, 0x36]
_0812731C:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08127324: .4byte gUnknown_0202FF84
_08127328: .4byte gMapObjects
_0812732C: .4byte gFieldEffectObjectTemplatePointers
_08127330: .4byte gSprites
	thumb_func_end FldEff_ShortGrass

	thumb_func_start sub_8127334
sub_8127334: @ 8127334
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x32]
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _08127372
	ldr r5, _0812737C @ =gMapObjects
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r5
	ldrb r0, [r1, 0x2]
	lsls r0, 29
	cmp r0, 0
	blt _08127380
_08127372:
	adds r0, r4, 0
	movs r1, 0x29
	bl FieldEffectStop
	b _08127416
	.align 2, 0
_0812737C: .4byte gMapObjects
_08127380:
	ldrb r0, [r1, 0x5]
	bl GetFieldObjectGraphicsInfo
	mov r8, r0
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08127424 @ =gSprites
	adds r6, r0, r1
	ldrh r5, [r6, 0x22]
	ldrh r7, [r6, 0x20]
	movs r0, 0x20
	ldrsh r1, [r6, r0]
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _081273BC
	lsls r0, r5, 16
	asrs r0, 16
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	cmp r0, r1
	beq _081273D6
_081273BC:
	strh r7, [r4, 0x34]
	strh r5, [r4, 0x36]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _081273D6
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
_081273D6:
	strh r7, [r4, 0x20]
	strh r5, [r4, 0x22]
	mov r1, r8
	ldrh r0, [r1, 0xA]
	lsls r0, 16
	asrs r0, 17
	subs r0, 0x8
	strh r0, [r4, 0x26]
	adds r0, r6, 0
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrb r0, [r6, 0x5]
	movs r1, 0xC
	ands r1, r0
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	adds r0, r6, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	lsls r1, 29
	lsrs r1, 31
	adds r0, r4, 0
	bl sub_806487C
_08127416:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08127424: .4byte gSprites
	thumb_func_end sub_8127334

	thumb_func_start FldEff_SandFootprints
FldEff_SandFootprints: @ 8127428
	push {r4,lr}
	ldr r4, _08127490 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08127494 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x2C]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08127486
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08127498 @ =gSprites
	adds r0, r1
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r3]
	movs r1, 0x3
	ldrb r2, [r4, 0xC]
	ands r2, r1
	lsls r2, 2
	ldrb r3, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, 0x5]
	movs r1, 0xD
	strh r1, [r0, 0x3C]
	ldrb r1, [r4, 0x10]
	bl StartSpriteAnim
_08127486:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08127490: .4byte gUnknown_0202FF84
_08127494: .4byte gFieldEffectObjectTemplatePointers
_08127498: .4byte gSprites
	thumb_func_end FldEff_SandFootprints

	thumb_func_start FldEff_DeepSandFootprints
FldEff_DeepSandFootprints: @ 812749C
	push {r4,r5,lr}
	ldr r4, _08127504 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08127508 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x5C]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	adds r5, r1, 0
	cmp r1, 0x40
	beq _081274FC
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0812750C @ =gSprites
	adds r0, r1
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r3]
	movs r1, 0x3
	ldrb r2, [r4, 0xC]
	ands r2, r1
	lsls r2, 2
	ldrb r3, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, 0x5]
	movs r1, 0x18
	strh r1, [r0, 0x3C]
	ldrb r1, [r4, 0x10]
	bl StartSpriteAnim
_081274FC:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08127504: .4byte gUnknown_0202FF84
_08127508: .4byte gFieldEffectObjectTemplatePointers
_0812750C: .4byte gSprites
	thumb_func_end FldEff_DeepSandFootprints

	thumb_func_start FldEff_BikeTireTracks
FldEff_BikeTireTracks: @ 8127510
	push {r4,r5,lr}
	ldr r4, _08127578 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _0812757C @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x6C]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	adds r5, r1, 0
	cmp r1, 0x40
	beq _08127570
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08127580 @ =gSprites
	adds r0, r1
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r3]
	movs r1, 0x3
	ldrb r2, [r4, 0xC]
	ands r2, r1
	lsls r2, 2
	ldrb r3, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, 0x5]
	movs r1, 0x23
	strh r1, [r0, 0x3C]
	ldrb r1, [r4, 0x10]
	bl StartSpriteAnim
_08127570:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08127578: .4byte gUnknown_0202FF84
_0812757C: .4byte gFieldEffectObjectTemplatePointers
_08127580: .4byte gSprites
	thumb_func_end FldEff_BikeTireTracks

	thumb_func_start sub_8127584
sub_8127584: @ 8127584
	push {lr}
	ldr r2, _0812759C @ =gUnknown_08401E40
	movs r3, 0x2E
	ldrsh r1, [r0, r3]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0812759C: .4byte gUnknown_08401E40
	thumb_func_end sub_8127584

	thumb_func_start sub_81275A0
sub_81275A0: @ 81275A0
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x28
	ble _081275B6
	movs r0, 0x1
	strh r0, [r1, 0x2E]
_081275B6:
	adds r0, r1, 0
	movs r1, 0
	bl sub_806487C
	pop {r0}
	bx r0
	thumb_func_end sub_81275A0

	thumb_func_start sub_81275C4
sub_81275C4: @ 81275C4
	push {r4,lr}
	adds r4, r0, 0
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
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	ldrb r1, [r3]
	lsls r1, 29
	lsrs r1, 31
	adds r0, r4, 0
	bl sub_806487C
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x38
	ble _08127608
	ldrh r1, [r4, 0x3C]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldEffectStop
_08127608:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81275C4

	thumb_func_start FldEff_Splash
FldEff_Splash: @ 8127610
	push {r4-r6,lr}
	ldr r6, _081276A4 @ =gUnknown_0202FF84
	ldrb r0, [r6]
	ldrb r1, [r6, 0x4]
	ldrb r2, [r6, 0x8]
	bl GetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _081276A8 @ =gMapObjects
	adds r5, r1, r0
	ldr r0, _081276AC @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x34]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x40
	beq _0812769A
	ldrb r0, [r5, 0x5]
	bl GetFieldObjectGraphicsInfo
	lsls r3, r4, 4
	adds r3, r4
	lsls r3, 2
	ldr r4, _081276B0 @ =gSprites
	adds r3, r4
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	ldrb r1, [r1]
	movs r2, 0x2
	orrs r1, r2
	mov r2, r12
	strb r1, [r2]
	ldrb r2, [r5, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrb r1, [r1, 0x5]
	movs r2, 0xC
	ands r2, r1
	ldrb r4, [r3, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r4
	orrs r1, r2
	strb r1, [r3, 0x5]
	ldr r1, [r6]
	strh r1, [r3, 0x2E]
	ldr r1, [r6, 0x4]
	strh r1, [r3, 0x30]
	ldr r1, [r6, 0x8]
	strh r1, [r3, 0x32]
	ldrh r0, [r0, 0xA]
	lsls r0, 16
	asrs r0, 17
	subs r0, 0x4
	strh r0, [r3, 0x26]
	movs r0, 0x46
	bl PlaySE
_0812769A:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081276A4: .4byte gUnknown_0202FF84
_081276A8: .4byte gMapObjects
_081276AC: .4byte gFieldEffectObjectTemplatePointers
_081276B0: .4byte gSprites
	thumb_func_end FldEff_Splash

	thumb_func_start sub_81276B4
sub_81276B4: @ 81276B4
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _081276E4
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x32]
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	beq _081276EE
_081276E4:
	adds r0, r4, 0
	movs r1, 0xF
	bl FieldEffectStop
	b _0812772E
_081276EE:
	ldr r3, _08127738 @ =gSprites
	ldr r2, _0812773C @ =gMapObjects
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x20]
	strh r0, [r4, 0x20]
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x22]
	strh r0, [r4, 0x22]
	adds r0, r4, 0
	movs r1, 0
	bl sub_806487C
_0812772E:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127738: .4byte gSprites
_0812773C: .4byte gMapObjects
	thumb_func_end sub_81276B4

	thumb_func_start FldEff_JumpSmallSplash
FldEff_JumpSmallSplash: @ 8127740
	push {r4,lr}
	ldr r4, _081277A4 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0xC
	bl sub_8060470
	ldr r0, _081277A8 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x38]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0812779C
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _081277AC @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r4, 0x8]
	strh r0, [r2, 0x2E]
	movs r0, 0x10
	strh r0, [r2, 0x30]
_0812779C:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081277A4: .4byte gUnknown_0202FF84
_081277A8: .4byte gFieldEffectObjectTemplatePointers
_081277AC: .4byte gSprites
	thumb_func_end FldEff_JumpSmallSplash

	thumb_func_start FldEff_JumpBigSplash
FldEff_JumpBigSplash: @ 81277B0
	push {r4,lr}
	ldr r4, _08127814 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08127818 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x30]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0812780C
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _0812781C @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r4, 0x8]
	strh r0, [r2, 0x2E]
	movs r0, 0xE
	strh r0, [r2, 0x30]
_0812780C:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08127814: .4byte gUnknown_0202FF84
_08127818: .4byte gFieldEffectObjectTemplatePointers
_0812781C: .4byte gSprites
	thumb_func_end FldEff_JumpBigSplash

	thumb_func_start FldEff_FeetInFlowingWater
FldEff_FeetInFlowingWater: @ 8127820
	push {r4-r7,lr}
	ldr r7, _081278C0 @ =gUnknown_0202FF84
	ldrb r0, [r7]
	ldrb r1, [r7, 0x4]
	ldrb r2, [r7, 0x8]
	bl GetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _081278C4 @ =gMapObjects
	adds r6, r1, r0
	ldr r0, _081278C8 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x34]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x40
	beq _081278B6
	ldrb r0, [r6, 0x5]
	bl GetFieldObjectGraphicsInfo
	adds r4, r0, 0
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	ldr r3, _081278CC @ =gSprites
	adds r0, r3
	ldr r1, _081278D0 @ =sub_81278D8
	str r1, [r0, 0x1C]
	adds r5, r0, 0
	adds r5, 0x3E
	ldrb r1, [r5]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r5]
	ldrb r2, [r6, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	ldrb r1, [r1, 0x5]
	movs r2, 0xC
	ands r2, r1
	ldrb r3, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldr r1, [r7]
	strh r1, [r0, 0x2E]
	ldr r1, [r7, 0x4]
	strh r1, [r0, 0x30]
	ldr r1, [r7, 0x8]
	strh r1, [r0, 0x32]
	ldr r1, _081278D4 @ =0x0000ffff
	strh r1, [r0, 0x34]
	movs r1, 0x1
	negs r1, r1
	strh r1, [r0, 0x36]
	ldrh r1, [r4, 0xA]
	lsls r1, 16
	asrs r1, 17
	subs r1, 0x4
	strh r1, [r0, 0x26]
	movs r1, 0x1
	bl StartSpriteAnim
_081278B6:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081278C0: .4byte gUnknown_0202FF84
_081278C4: .4byte gMapObjects
_081278C8: .4byte gFieldEffectObjectTemplatePointers
_081278CC: .4byte gSprites
_081278D0: .4byte sub_81278D8
_081278D4: .4byte 0x0000ffff
	thumb_func_end FldEff_FeetInFlowingWater

	thumb_func_start sub_81278D8
sub_81278D8: @ 81278D8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x32]
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _08127912
	ldr r2, _0812791C @ =gMapObjects
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r5, r0, r2
	ldrb r0, [r5, 0x2]
	lsls r0, 28
	cmp r0, 0
	blt _08127920
_08127912:
	adds r0, r4, 0
	movs r1, 0x22
	bl FieldEffectStop
	b _0812796A
	.align 2, 0
_0812791C: .4byte gMapObjects
_08127920:
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08127974 @ =gSprites
	adds r0, r1
	ldrh r1, [r0, 0x20]
	strh r1, [r4, 0x20]
	ldrh r1, [r0, 0x22]
	strh r1, [r4, 0x22]
	adds r0, 0x43
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0
	bl sub_806487C
	ldr r1, [r5, 0x10]
	ldr r0, [r4, 0x34]
	cmp r1, r0
	beq _0812796A
	ldrh r0, [r5, 0x10]
	strh r0, [r4, 0x34]
	ldrh r0, [r5, 0x12]
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _0812796A
	movs r0, 0x46
	bl PlaySE
_0812796A:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08127974: .4byte gSprites
	thumb_func_end sub_81278D8

	thumb_func_start FldEff_Ripple
FldEff_Ripple: @ 8127978
	push {r4,lr}
	ldr r0, _081279CC @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x14]
	ldr r4, _081279D0 @ =gUnknown_0202FF84
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _081279C4
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _081279D4 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	movs r0, 0x5
	strh r0, [r2, 0x2E]
_081279C4:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081279CC: .4byte gFieldEffectObjectTemplatePointers
_081279D0: .4byte gUnknown_0202FF84
_081279D4: .4byte gSprites
	thumb_func_end FldEff_Ripple

	thumb_func_start FldEff_HotSpringsWater
FldEff_HotSpringsWater: @ 81279D8
	push {r4-r6,lr}
	ldr r6, _08127A6C @ =gUnknown_0202FF84
	ldrb r0, [r6]
	ldrb r1, [r6, 0x4]
	ldrb r2, [r6, 0x8]
	bl GetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08127A70 @ =gMapObjects
	adds r5, r1, r0
	ldr r0, _08127A74 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x7C]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08127A64
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r4, _08127A78 @ =gSprites
	adds r2, r4
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x5]
	movs r1, 0xC
	ands r1, r0
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r6]
	strh r0, [r2, 0x2E]
	ldr r0, [r6, 0x4]
	strh r0, [r2, 0x30]
	ldr r0, [r6, 0x8]
	strh r0, [r2, 0x32]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r0, [r0, 0x20]
	strh r0, [r2, 0x34]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r0, [r0, 0x22]
	strh r0, [r2, 0x36]
_08127A64:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08127A6C: .4byte gUnknown_0202FF84
_08127A70: .4byte gMapObjects
_08127A74: .4byte gFieldEffectObjectTemplatePointers
_08127A78: .4byte gSprites
	thumb_func_end FldEff_HotSpringsWater

	thumb_func_start sub_8127A7C
sub_8127A7C: @ 8127A7C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x32]
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _08127AB6
	ldr r5, _08127AC0 @ =gMapObjects
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r5
	ldrb r0, [r1, 0x2]
	lsls r0, 26
	cmp r0, 0
	blt _08127AC4
_08127AB6:
	adds r0, r4, 0
	movs r1, 0x2A
	bl FieldEffectStop
	b _08127B08
	.align 2, 0
_08127AC0: .4byte gMapObjects
_08127AC4:
	ldrb r0, [r1, 0x5]
	bl GetFieldObjectGraphicsInfo
	mov r1, sp
	ldrb r2, [r1]
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	ldr r2, _08127B10 @ =gSprites
	adds r1, r2
	ldrh r2, [r1, 0x20]
	strh r2, [r4, 0x20]
	ldrh r0, [r0, 0xA]
	lsls r0, 16
	asrs r0, 17
	ldrh r2, [r1, 0x22]
	adds r0, r2
	subs r0, 0x8
	strh r0, [r4, 0x22]
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0x1
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0
	bl sub_806487C
_08127B08:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08127B10: .4byte gSprites
	thumb_func_end sub_8127A7C

	thumb_func_start FldEff_Unknown19
FldEff_Unknown19: @ 8127B14
	push {r4,lr}
	ldr r4, _08127B74 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08127B78 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x44]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08127B6C
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08127B7C @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	movs r0, 0x13
	strh r0, [r2, 0x2E]
_08127B6C:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08127B74: .4byte gUnknown_0202FF84
_08127B78: .4byte gFieldEffectObjectTemplatePointers
_08127B7C: .4byte gSprites
	thumb_func_end FldEff_Unknown19

	thumb_func_start FldEff_Unknown20
FldEff_Unknown20: @ 8127B80
	push {r4,lr}
	ldr r4, _08127BE0 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08127BE4 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x48]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08127BD8
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08127BE8 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	movs r0, 0x14
	strh r0, [r2, 0x2E]
_08127BD8:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08127BE0: .4byte gUnknown_0202FF84
_08127BE4: .4byte gFieldEffectObjectTemplatePointers
_08127BE8: .4byte gSprites
	thumb_func_end FldEff_Unknown20

	thumb_func_start FldEff_Unknown21
FldEff_Unknown21: @ 8127BEC
	push {r4,lr}
	ldr r4, _08127C4C @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08127C50 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x4C]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08127C44
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08127C54 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	movs r0, 0x15
	strh r0, [r2, 0x2E]
_08127C44:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08127C4C: .4byte gUnknown_0202FF84
_08127C50: .4byte gFieldEffectObjectTemplatePointers
_08127C54: .4byte gSprites
	thumb_func_end FldEff_Unknown21

	thumb_func_start FldEff_Unknown22
FldEff_Unknown22: @ 8127C58
	push {r4,lr}
	ldr r4, _08127CB8 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08127CBC @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x50]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08127CB0
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08127CC0 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	movs r0, 0x16
	strh r0, [r2, 0x2E]
_08127CB0:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08127CB8: .4byte gUnknown_0202FF84
_08127CBC: .4byte gFieldEffectObjectTemplatePointers
_08127CC0: .4byte gSprites
	thumb_func_end FldEff_Unknown22

	thumb_func_start ash
ash: @ 8127CC4
	push {r4,lr}
	lsls r2, 16
	lsrs r2, 16
	ldr r4, _08127CF4 @ =gUnknown_0202FF84
	lsls r0, 16
	asrs r0, 16
	str r0, [r4]
	lsls r1, 16
	asrs r1, 16
	str r1, [r4, 0x4]
	movs r0, 0x52
	str r0, [r4, 0x8]
	movs r0, 0x1
	str r0, [r4, 0xC]
	str r2, [r4, 0x10]
	lsls r3, 16
	asrs r3, 16
	str r3, [r4, 0x14]
	movs r0, 0x7
	bl FieldEffectStart
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127CF4: .4byte gUnknown_0202FF84
	thumb_func_end ash

	thumb_func_start FldEff_Ash
FldEff_Ash: @ 8127CF8
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _08127D78 @ =gUnknown_0202FF84
	ldrh r1, [r5]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r5, 0x4]
	mov r4, sp
	adds r4, 0x2
	strh r0, [r4]
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08127D7C @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x18]
	mov r1, sp
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r3, 0
	ldrsh r2, [r4, r3]
	ldrb r3, [r5, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08127D6E
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08127D80 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r5, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r5]
	strh r0, [r2, 0x30]
	ldr r0, [r5, 0x4]
	strh r0, [r2, 0x32]
	ldr r0, [r5, 0x10]
	strh r0, [r2, 0x34]
	ldr r0, [r5, 0x14]
	strh r0, [r2, 0x36]
_08127D6E:
	movs r0, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08127D78: .4byte gUnknown_0202FF84
_08127D7C: .4byte gFieldEffectObjectTemplatePointers
_08127D80: .4byte gSprites
	thumb_func_end FldEff_Ash

	thumb_func_start sub_8127D84
sub_8127D84: @ 8127D84
	push {lr}
	ldr r2, _08127D9C @ =gUnknown_08401E48
	movs r3, 0x2E
	ldrsh r1, [r0, r3]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08127D9C: .4byte gUnknown_08401E48
	thumb_func_end sub_8127D84

	thumb_func_start sub_8127DA0
sub_8127DA0: @ 8127DA0
	push {lr}
	adds r3, r0, 0
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	subs r2, 0x12
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r3, 0x36]
	subs r0, 0x1
	strh r0, [r3, 0x36]
	lsls r0, 16
	cmp r0, 0
	bne _08127DCA
	movs r0, 0x1
	strh r0, [r3, 0x2E]
_08127DCA:
	pop {r0}
	bx r0
	thumb_func_end sub_8127DA0

	thumb_func_start sub_8127DD0
sub_8127DD0: @ 8127DD0
	push {r4,lr}
	adds r4, r0, 0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	subs r2, 0x12
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, 0x34]
	bl MapGridSetMetatileIdAt
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	ldr r2, _08127E28 @ =gMapObjects
	ldr r0, _08127E2C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	movs r0, 0x2
	strh r0, [r4, 0x2E]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127E28: .4byte gMapObjects
_08127E2C: .4byte gPlayerAvatar
	thumb_func_end sub_8127DD0

	thumb_func_start sub_8127E30
sub_8127E30: @ 8127E30
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_806487C
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08127E50
	adds r0, r4, 0
	movs r1, 0x7
	bl FieldEffectStop
_08127E50:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8127E30

	thumb_func_start FldEff_SurfBlob
FldEff_SurfBlob: @ 8127E58
	push {r4,r5,lr}
	ldr r4, _08127EC0 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08127EC4 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x1C]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0x96
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	cmp r0, 0x40
	beq _08127EB2
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08127EC8 @ =gSprites
	adds r1, r0
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r3]
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	strb r0, [r1, 0x5]
	ldr r0, [r4, 0x8]
	strh r0, [r1, 0x32]
	ldr r0, _08127ECC @ =0x0000ffff
	strh r0, [r1, 0x34]
	movs r0, 0x1
	negs r0, r0
	strh r0, [r1, 0x3A]
	strh r0, [r1, 0x3C]
_08127EB2:
	movs r0, 0x8
	bl FieldEffectActiveListRemove
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08127EC0: .4byte gUnknown_0202FF84
_08127EC4: .4byte gFieldEffectObjectTemplatePointers
_08127EC8: .4byte gSprites
_08127ECC: .4byte 0x0000ffff
	thumb_func_end FldEff_SurfBlob

	thumb_func_start sub_8127ED0
sub_8127ED0: @ 8127ED0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r3, _08127EF8 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldrh r0, [r2, 0x2E]
	movs r3, 0x10
	negs r3, r3
	ands r3, r0
	movs r0, 0xF0
	lsls r0, 20
	ands r0, r1
	lsrs r0, 24
	orrs r0, r3
	strh r0, [r2, 0x2E]
	bx lr
	.align 2, 0
_08127EF8: .4byte gSprites
	thumb_func_end sub_8127ED0

	thumb_func_start sub_8127EFC
sub_8127EFC: @ 8127EFC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r3, _08127F24 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldrh r0, [r2, 0x2E]
	movs r3, 0xF1
	negs r3, r3
	ands r3, r0
	movs r0, 0xF0
	lsls r0, 20
	ands r0, r1
	lsrs r0, 20
	orrs r3, r0
	strh r3, [r2, 0x2E]
	bx lr
	.align 2, 0
_08127F24: .4byte gSprites
	thumb_func_end sub_8127EFC

	thumb_func_start sub_8127F28
sub_8127F28: @ 8127F28
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r4, _08127F54 @ =gSprites
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r3, r4
	ldrh r0, [r3, 0x2E]
	ldr r4, _08127F58 @ =0xfffff0ff
	ands r4, r0
	movs r0, 0xF0
	lsls r0, 20
	ands r0, r1
	lsrs r0, 16
	orrs r4, r0
	strh r4, [r3, 0x2E]
	strh r2, [r3, 0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127F54: .4byte gSprites
_08127F58: .4byte 0xfffff0ff
	thumb_func_end sub_8127F28

	thumb_func_start sub_8127F5C
sub_8127F5C: @ 8127F5C
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF
	ands r0, r1
	bx lr
	thumb_func_end sub_8127F5C

	thumb_func_start sub_8127F64
sub_8127F64: @ 8127F64
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF0
	ands r0, r1
	lsrs r0, 4
	bx lr
	thumb_func_end sub_8127F64

	thumb_func_start sub_8127F70
sub_8127F70: @ 8127F70
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF0
	lsls r0, 4
	ands r0, r1
	lsrs r0, 8
	bx lr
	thumb_func_end sub_8127F70

	thumb_func_start sub_8127F7C
sub_8127F7C: @ 8127F7C
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x32
	ldrsh r0, [r6, r1]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08127FCC @ =gMapObjects
	adds r4, r0
	ldrb r0, [r4, 0x4]
	lsls r5, r0, 4
	adds r5, r0
	lsls r5, 2
	ldr r0, _08127FD0 @ =gSprites
	adds r5, r0
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_8127FD4
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_812800C
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_81280A0
	ldrb r0, [r5, 0x5]
	movs r1, 0xC
	ands r1, r0
	ldrb r2, [r6, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, 0x5]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08127FCC: .4byte gMapObjects
_08127FD0: .4byte gSprites
	thumb_func_end sub_8127F7C

	thumb_func_start sub_8127FD4
sub_8127FD4: @ 8127FD4
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r1, _08128008 @ =gUnknown_08401E54
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	adds r0, r4, 0
	bl sub_8127F64
	lsls r0, 24
	cmp r0, 0
	bne _08128000
	ldrb r0, [r5, 0x18]
	lsrs r0, 4
	add r0, sp
	ldrb r1, [r0]
	adds r0, r4, 0
	bl StartSpriteAnimIfDifferent
_08128000:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08128008: .4byte gUnknown_08401E54
	thumb_func_end sub_8127FD4

	thumb_func_start sub_812800C
sub_812800C: @ 812800C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r1, 0
	ldrh r2, [r0, 0x10]
	mov r1, sp
	strh r2, [r1]
	ldrh r1, [r0, 0x12]
	mov r0, sp
	adds r0, 0x2
	strh r1, [r0]
	movs r2, 0x26
	ldrsh r3, [r4, r2]
	mov r8, r0
	cmp r3, 0
	bne _08128094
	mov r0, sp
	movs r5, 0
	ldrsh r2, [r0, r5]
	movs r5, 0x3A
	ldrsh r0, [r4, r5]
	cmp r2, r0
	bne _08128048
	lsls r0, r1, 16
	asrs r0, 16
	movs r5, 0x3C
	ldrsh r1, [r4, r5]
	cmp r0, r1
	beq _08128094
_08128048:
	strh r3, [r4, 0x38]
	strh r2, [r4, 0x3A]
	mov r1, r8
	movs r2, 0
	ldrsh r0, [r1, r2]
	strh r0, [r4, 0x3C]
	movs r5, 0x1
	mov r7, r8
	mov r6, sp
_0812805A:
	adds r0, r5, 0
	mov r1, sp
	adds r2, r7, 0
	bl MoveCoords
	movs r1, 0
	ldrsh r0, [r6, r1]
	movs r2, 0
	ldrsh r1, [r7, r2]
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _08128080
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	b _08128094
_08128080:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r0, [r4, 0x3A]
	strh r0, [r6]
	ldrh r0, [r4, 0x3C]
	mov r1, r8
	strh r0, [r1]
	cmp r5, 0x4
	bls _0812805A
_08128094:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_812800C

	thumb_func_start sub_81280A0
sub_81280A0: @ 81280A0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r1, 0
	adds r4, r2, 0
	ldr r1, _08128104 @ =gUnknown_08401E5A
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r0, r4, 0
	bl sub_8127F5C
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	cmp r2, 0
	beq _0812811A
	ldrh r1, [r4, 0x36]
	adds r1, 0x1
	strh r1, [r4, 0x36]
	movs r3, 0x38
	ldrsh r0, [r4, r3]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _081280E0
	ldrh r0, [r4, 0x34]
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
_081280E0:
	ldrh r1, [r4, 0x36]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _081280F0
	ldrh r0, [r4, 0x34]
	negs r0, r0
	strh r0, [r4, 0x34]
_081280F0:
	cmp r2, 0x2
	beq _0812811A
	adds r0, r4, 0
	bl sub_8127F70
	lsls r0, 24
	cmp r0, 0
	bne _08128108
	ldrh r0, [r4, 0x26]
	b _0812810E
	.align 2, 0
_08128104: .4byte gUnknown_08401E5A
_08128108:
	ldrh r0, [r4, 0x26]
	ldrh r3, [r4, 0x30]
	adds r0, r3
_0812810E:
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x20]
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x22]
	adds r0, 0x8
	strh r0, [r4, 0x22]
_0812811A:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81280A0

	thumb_func_start sub_8128124
sub_8128124: @ 8128124
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08128168 @ =gDummySpriteTemplate
	movs r1, 0
	movs r2, 0
	movs r3, 0xFF
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r1, _0812816C @ =gSprites
	adds r2, r1
	ldr r1, _08128170 @ =sub_8128174
	str r1, [r2, 0x1C]
	movs r1, 0x3E
	adds r1, r2
	mov r12, r1
	ldrb r1, [r1]
	movs r3, 0x4
	orrs r1, r3
	mov r3, r12
	strb r1, [r3]
	strh r4, [r2, 0x2E]
	movs r1, 0x1
	strh r1, [r2, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08128168: .4byte gDummySpriteTemplate
_0812816C: .4byte gSprites
_08128170: .4byte sub_8128174
	thumb_func_end sub_8128124

	thumb_func_start sub_8128174
sub_8128174: @ 8128174
	push {lr}
	adds r2, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081281B0 @ =gSprites
	adds r3, r0, r1
	ldrh r1, [r2, 0x32]
	adds r0, r1, 0x1
	strh r0, [r2, 0x32]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _0812819C
	ldrh r0, [r2, 0x30]
	ldrh r1, [r3, 0x26]
	adds r0, r1
	strh r0, [r3, 0x26]
_0812819C:
	ldrh r1, [r2, 0x32]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _081281AC
	ldrh r0, [r2, 0x30]
	negs r0, r0
	strh r0, [r2, 0x30]
_081281AC:
	pop {r0}
	bx r0
	.align 2, 0
_081281B0: .4byte gSprites
	thumb_func_end sub_8128174

	thumb_func_start FldEff_Dust
FldEff_Dust: @ 81281B4
	push {r4,lr}
	ldr r4, _08128218 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0xC
	bl sub_8060470
	ldr r0, _0812821C @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x24]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08128210
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08128220 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r4, 0x8]
	strh r0, [r2, 0x2E]
	movs r0, 0xA
	strh r0, [r2, 0x30]
_08128210:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08128218: .4byte gUnknown_0202FF84
_0812821C: .4byte gFieldEffectObjectTemplatePointers
_08128220: .4byte gSprites
	thumb_func_end FldEff_Dust

	thumb_func_start FldEff_SandPile
FldEff_SandPile: @ 8128224
	push {r4-r7,lr}
	ldr r7, _081282D0 @ =gUnknown_0202FF84
	ldrb r0, [r7]
	ldrb r1, [r7, 0x4]
	ldrb r2, [r7, 0x8]
	bl GetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _081282D4 @ =gMapObjects
	adds r6, r1, r0
	ldr r0, _081282D8 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x74]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x40
	beq _081282C8
	ldrb r0, [r6, 0x5]
	bl GetFieldObjectGraphicsInfo
	adds r5, r0, 0
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r4, _081282DC @ =gSprites
	adds r0, r4
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r3]
	ldrb r2, [r6, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrb r1, [r1, 0x5]
	movs r2, 0xC
	ands r2, r1
	ldrb r3, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldr r1, [r7]
	strh r1, [r0, 0x2E]
	ldr r1, [r7, 0x4]
	strh r1, [r0, 0x30]
	ldr r1, [r7, 0x8]
	strh r1, [r0, 0x32]
	ldrb r2, [r6, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x20]
	strh r1, [r0, 0x34]
	ldrb r2, [r6, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x22]
	strh r1, [r0, 0x36]
	ldrh r1, [r5, 0xA]
	lsls r1, 16
	asrs r1, 17
	subs r1, 0x2
	strh r1, [r0, 0x26]
	movs r1, 0x2
	bl SeekSpriteAnim
_081282C8:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081282D0: .4byte gUnknown_0202FF84
_081282D4: .4byte gMapObjects
_081282D8: .4byte gFieldEffectObjectTemplatePointers
_081282DC: .4byte gSprites
	thumb_func_end FldEff_SandPile

	thumb_func_start sub_81282E0
sub_81282E0: @ 81282E0
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x32]
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0812831A
	ldr r2, _08128324 @ =gMapObjects
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	ldrb r0, [r1, 0x2]
	lsls r0, 27
	cmp r0, 0
	blt _08128328
_0812831A:
	adds r0, r4, 0
	movs r1, 0x27
	bl FieldEffectStop
	b _0812839A
	.align 2, 0
_08128324: .4byte gMapObjects
_08128328:
	ldr r2, _081283A4 @ =gSprites
	ldrb r1, [r1, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r5, [r0, 0x22]
	ldrh r6, [r0, 0x20]
	movs r2, 0x20
	ldrsh r1, [r0, r2]
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _08128350
	lsls r0, r5, 16
	asrs r0, 16
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	cmp r0, r1
	beq _0812836A
_08128350:
	strh r6, [r4, 0x34]
	strh r5, [r4, 0x36]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0812836A
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
_0812836A:
	strh r6, [r4, 0x20]
	strh r5, [r4, 0x22]
	ldr r3, _081283A4 @ =gSprites
	ldr r2, _081283A8 @ =gMapObjects
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x43
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0
	bl sub_806487C
_0812839A:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081283A4: .4byte gSprites
_081283A8: .4byte gMapObjects
	thumb_func_end sub_81282E0

	thumb_func_start FldEff_Bubbles
FldEff_Bubbles: @ 81283AC
	push {r4,lr}
	ldr r4, _08128404 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0
	bl sub_8060470
	ldr r0, _08128408 @ =gFieldEffectObjectTemplatePointers
	adds r0, 0x88
	ldr r0, [r0]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0x52
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _081283FC
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0812840C @ =gSprites
	adds r1, r0
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r3]
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1, 0x5]
_081283FC:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08128404: .4byte gUnknown_0202FF84
_08128408: .4byte gFieldEffectObjectTemplatePointers
_0812840C: .4byte gSprites
	thumb_func_end FldEff_Bubbles

	thumb_func_start sub_8128410
sub_8128410: @ 8128410
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x80
	movs r1, 0x80
	lsls r1, 1
	ands r0, r1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x22]
	subs r1, r0
	strh r1, [r4, 0x22]
	adds r0, r4, 0
	movs r1, 0
	bl sub_806487C
	ldrh r1, [r4, 0x3E]
	ldr r0, _0812844C @ =0x00001004
	ands r0, r1
	cmp r0, 0
	beq _08128444
	adds r0, r4, 0
	movs r1, 0x35
	bl FieldEffectStop
_08128444:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812844C: .4byte 0x00001004
	thumb_func_end sub_8128410

	thumb_func_start FldEff_BerryTreeGrowthSparkle
FldEff_BerryTreeGrowthSparkle: @ 8128450
	push {r4,lr}
	ldr r4, _081284B8 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x4
	bl sub_8060470
	ldr r0, _081284BC @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x58]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _081284B0
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _081284C0 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	movs r1, 0xF
	ands r0, r1
	movs r1, 0x50
	orrs r0, r1
	strb r0, [r2, 0x5]
	movs r0, 0x17
	strh r0, [r2, 0x2E]
_081284B0:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081284B8: .4byte gUnknown_0202FF84
_081284BC: .4byte gFieldEffectObjectTemplatePointers
_081284C0: .4byte gSprites
	thumb_func_end FldEff_BerryTreeGrowthSparkle

	thumb_func_start FldEff_TreeDisguise
FldEff_TreeDisguise: @ 81284C4
	push {lr}
	movs r0, 0x1C
	movs r1, 0x18
	movs r2, 0x4
	bl ShowDisguiseFieldEffect
	pop {r1}
	bx r1
	thumb_func_end FldEff_TreeDisguise

	thumb_func_start FldEff_MountainDisguise
FldEff_MountainDisguise: @ 81284D4
	push {lr}
	movs r0, 0x1D
	movs r1, 0x19
	movs r2, 0x3
	bl ShowDisguiseFieldEffect
	pop {r1}
	bx r1
	thumb_func_end FldEff_MountainDisguise

	thumb_func_start FldEff_SandDisguise
FldEff_SandDisguise: @ 81284E4
	push {lr}
	movs r0, 0x24
	movs r1, 0x1C
	movs r2, 0x2
	bl ShowDisguiseFieldEffect
	pop {r1}
	bx r1
	thumb_func_end FldEff_SandDisguise

	thumb_func_start ShowDisguiseFieldEffect
ShowDisguiseFieldEffect: @ 81284F4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	mov r8, r4
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r7, r2, 24
	ldr r5, _08128528 @ =gUnknown_0202FF84
	ldrb r0, [r5]
	ldrb r1, [r5, 0x4]
	ldrb r2, [r5, 0x8]
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	beq _0812852C
	adds r0, r4, 0
	bl FieldEffectActiveListRemove
	movs r0, 0x40
	b _08128598
	.align 2, 0
_08128528: .4byte gUnknown_0202FF84
_0812852C:
	ldr r1, _081285A4 @ =gFieldEffectObjectTemplatePointers
	lsls r0, r6, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSpriteAtEnd
	mov r1, sp
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08128594
	mov r0, sp
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _081285A8 @ =gSprites
	adds r2, r0
	movs r0, 0x3E
	adds r0, r2
	mov r12, r0
	ldrb r3, [r0]
	lsls r1, r3, 30
	lsrs r1, 31
	adds r1, 0x1
	movs r0, 0x1
	ands r1, r0
	lsls r1, 1
	movs r0, 0x3
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	lsls r3, r7, 4
	ldrb r1, [r2, 0x5]
	movs r0, 0xF
	ands r0, r1
	orrs r0, r3
	strb r0, [r2, 0x5]
	mov r0, r8
	strh r0, [r2, 0x30]
	ldr r0, [r5]
	strh r0, [r2, 0x32]
	ldr r0, [r5, 0x4]
	strh r0, [r2, 0x34]
	ldr r0, [r5, 0x8]
	strh r0, [r2, 0x36]
_08128594:
	mov r0, sp
	ldrb r0, [r0]
_08128598:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081285A4: .4byte gFieldEffectObjectTemplatePointers
_081285A8: .4byte gSprites
	thumb_func_end ShowDisguiseFieldEffect

	thumb_func_start sub_81285AC
sub_81285AC: @ 81285AC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r0, [r5, 0x32]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x34]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r5, 0x36]
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	beq _081285DC
	ldrh r1, [r5, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldEffectStop
_081285DC:
	ldr r4, _08128694 @ =gMapObjects
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x5]
	bl GetFieldObjectGraphicsInfo
	mov r1, sp
	ldrb r2, [r1]
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	ldr r1, _08128698 @ =gSprites
	adds r2, r1
	adds r1, r2, 0
	adds r1, 0x3E
	ldrb r1, [r1]
	movs r3, 0x3E
	adds r3, r5
	mov r12, r3
	movs r3, 0x4
	ands r3, r1
	mov r1, r12
	ldrb r4, [r1]
	movs r1, 0x5
	negs r1, r1
	ands r1, r4
	orrs r1, r3
	mov r3, r12
	strb r1, [r3]
	ldrh r1, [r2, 0x20]
	strh r1, [r5, 0x20]
	ldrh r0, [r0, 0xA]
	lsls r0, 16
	asrs r0, 17
	ldrh r1, [r2, 0x22]
	adds r0, r1
	subs r0, 0x10
	strh r0, [r5, 0x22]
	adds r2, 0x43
	ldrb r0, [r2]
	subs r0, 0x1
	adds r1, r5, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrh r1, [r5, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0x1
	bne _0812865C
	adds r0, r1, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAnim
_0812865C:
	movs r3, 0x2E
	ldrsh r0, [r5, r3]
	ldrh r2, [r5, 0x2E]
	cmp r0, 0x2
	bne _08128678
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08128678
	movs r0, 0x1
	strh r0, [r5, 0x3C]
_08128678:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _0812868C
	ldrh r1, [r5, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldEffectStop
_0812868C:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08128694: .4byte gMapObjects
_08128698: .4byte gSprites
	thumb_func_end sub_81285AC

	thumb_func_start sub_812869C
sub_812869C: @ 812869C
	push {lr}
	adds r1, r0, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _081286BA
	ldr r2, _081286C0 @ =gSprites
	ldrb r1, [r1, 0x1A]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x2E]
	adds r1, 0x1
	strh r1, [r0, 0x2E]
_081286BA:
	pop {r0}
	bx r0
	.align 2, 0
_081286C0: .4byte gSprites
	thumb_func_end sub_812869C

	thumb_func_start sub_81286C4
sub_81286C4: @ 81286C4
	push {lr}
	adds r2, r0, 0
	adds r2, 0x21
	ldrb r1, [r2]
	cmp r1, 0x2
	beq _081286FA
	cmp r1, 0
	beq _081286FA
	ldrb r1, [r0, 0x1A]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081286EC @ =gSprites
	adds r1, r0, r1
	movs r3, 0x3C
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _081286F0
	movs r0, 0
	b _081286FC
	.align 2, 0
_081286EC: .4byte gSprites
_081286F0:
	movs r0, 0x2
	strb r0, [r2]
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
_081286FA:
	movs r0, 0x1
_081286FC:
	pop {r1}
	bx r1
	thumb_func_end sub_81286C4

	thumb_func_start FldEff_Sparkle
FldEff_Sparkle: @ 8128700
	push {r4,lr}
	ldr r4, _08128768 @ =gUnknown_0202FF84
	ldr r0, [r4]
	adds r0, 0x7
	str r0, [r4]
	ldr r0, [r4, 0x4]
	adds r0, 0x7
	str r0, [r4, 0x4]
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _0812876C @ =gFieldEffectObjectTemplatePointers
	adds r0, 0x8C
	ldr r0, [r0]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0x52
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _08128760
	ldr r0, _08128770 @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	movs r0, 0x3
	ldrb r2, [r4, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r3, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r1]
_08128760:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08128768: .4byte gUnknown_0202FF84
_0812876C: .4byte gFieldEffectObjectTemplatePointers
_08128770: .4byte gSprites
	thumb_func_end FldEff_Sparkle

	thumb_func_start sub_8128774
sub_8128774: @ 8128774
	push {lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _081287A8
	adds r0, r2, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _081287A0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
_081287A0:
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _081287BE
_081287A8:
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x22
	ble _081287BE
	adds r0, r2, 0
	movs r1, 0x36
	bl FieldEffectStop
_081287BE:
	pop {r0}
	bx r0
	thumb_func_end sub_8128774

	thumb_func_start sub_81287C4
sub_81287C4: @ 81287C4
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _081287E2
	ldrh r1, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldEffectStop
	b _081287F8
_081287E2:
	adds r0, r4, 0
	movs r1, 0
	bl sub_806487C
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	movs r2, 0
	bl SetObjectSubpriorityByZCoord
_081287F8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81287C4

	thumb_func_start sub_8128800
sub_8128800: @ 8128800
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0812881E
	ldrh r1, [r2, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r2, 0
	bl FieldEffectStop
	b _08128826
_0812881E:
	adds r0, r2, 0
	movs r1, 0
	bl sub_806487C
_08128826:
	pop {r0}
	bx r0
	thumb_func_end sub_8128800

	thumb_func_start sub_812882C
sub_812882C: @ 812882C
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r0, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 24
	lsrs r2, 24
	adds r1, r6, 0
	bl SetObjectSubpriorityByZCoord
	movs r7, 0
_08128842:
	lsls r0, r7, 3
	adds r0, r7
	lsls r0, 2
	ldr r1, _081288DC @ =gMapObjects
	adds r4, r0, r1
	ldrb r0, [r4]
	lsls r0, 31
	cmp r0, 0
	beq _081288E4
	ldrb r0, [r4, 0x5]
	bl GetFieldObjectGraphicsInfo
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081288E0 @ =gSprites
	adds r5, r0, r1
	adds r0, r6, 0
	adds r0, 0x28
	movs r2, 0
	ldrsb r2, [r0, r2]
	ldrh r0, [r6, 0x20]
	adds r1, r0, r2
	subs r0, r2
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x20
	ldrsh r2, [r5, r0]
	cmp r1, r2
	bge _081288E4
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, r2
	ble _081288E4
	adds r0, r5, 0
	adds r0, 0x29
	movs r3, 0
	ldrsb r3, [r0, r3]
	ldrh r2, [r5, 0x22]
	adds r2, r3
	ldrh r4, [r5, 0x22]
	adds r0, r6, 0
	adds r0, 0x29
	movs r1, 0
	ldrsb r1, [r0, r1]
	ldrh r0, [r6, 0x22]
	subs r0, r1
	lsls r0, 16
	asrs r0, 16
	adds r3, r0, r3
	lsls r2, 16
	asrs r2, 16
	lsls r3, 16
	asrs r3, 16
	cmp r2, r3
	blt _081288BC
	cmp r2, r0
	bge _081288E4
_081288BC:
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, r3
	ble _081288E4
	adds r2, r6, 0
	adds r2, 0x43
	adds r0, r5, 0
	adds r0, 0x43
	ldrb r1, [r0]
	ldrb r0, [r2]
	cmp r0, r1
	bhi _081288E4
	adds r0, r1, 0x2
	strb r0, [r2]
	b _081288EE
	.align 2, 0
_081288DC: .4byte gMapObjects
_081288E0: .4byte gSprites
_081288E4:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0xF
	bls _08128842
_081288EE:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_812882C

	.align 2, 0 @ Don't pad with nop.
