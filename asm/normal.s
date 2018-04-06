	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	@ normal

	thumb_func_start sub_80E1CB4
sub_80E1CB4: @ 80E1CB4
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080E1CEC @ =gBattleAnimArgs
	ldrh r0, [r5]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2E]
	ldr r0, _080E1CF0 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _080E1CF4
	ldrh r0, [r5, 0x6]
	negs r0, r0
	strh r0, [r4, 0x30]
	movs r0, 0x1
	strh r0, [r4, 0x36]
	b _080E1D02
	.align 2, 0
_080E1CEC: .4byte gBattleAnimArgs
_080E1CF0: .4byte gAnimBankAttacker
_080E1CF4:
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x30]
	strh r1, [r4, 0x36]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
_080E1D02:
	ldr r0, _080E1D18 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x8]
	strh r0, [r4, 0x34]
	ldr r1, _080E1D1C @ =sub_80E1D20
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E1D18: .4byte gBattleAnimArgs
_080E1D1C: .4byte sub_80E1D20
	thumb_func_end sub_80E1CB4

	thumb_func_start sub_80E1D20
sub_80E1D20: @ 80E1D20
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x1E
	bl Cos
	strh r0, [r4, 0x24]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	movs r1, 0xA
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	cmp r0, 0x7F
	bhi _080E1D52
	ldrb r0, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4, 0x5]
	b _080E1D5A
_080E1D52:
	ldrb r0, [r4, 0x5]
	movs r1, 0xC
	orrs r0, r1
	strb r0, [r4, 0x5]
_080E1D5A:
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x2E]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080E1D7E
	adds r0, r4, 0
	bl DestroyAnimSprite
_080E1D7E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E1D20

	thumb_func_start sub_80E1D84
sub_80E1D84: @ 80E1D84
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r4, _080E1DBC @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r4, r1]
	bl sub_80E1DC4
	movs r1, 0x2
	ldrsb r1, [r4, r1]
	ldrb r2, [r4, 0x4]
	ldrb r3, [r4, 0x6]
	ldrh r4, [r4, 0x8]
	str r4, [sp]
	bl BeginNormalPaletteFade
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080E1DC0 @ =sub_80E1E0C
	str r0, [r5, 0x1C]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E1DBC: .4byte gBattleAnimArgs
_080E1DC0: .4byte sub_80E1E0C
	thumb_func_end sub_80E1D84

	thumb_func_start sub_80E1DC4
sub_80E1DC4: @ 80E1DC4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	lsls r0, 16
	lsrs r0, 16
	movs r4, 0x1
	mov r8, r0
	mov r1, r8
	ands r1, r4
	mov r8, r1
	lsls r0, 16
	asrs r1, r0, 17
	ands r1, r4
	asrs r2, r0, 18
	ands r2, r4
	asrs r3, r0, 19
	ands r3, r4
	asrs r6, r0, 20
	ands r6, r4
	asrs r5, r0, 21
	ands r5, r4
	asrs r0, 22
	ands r0, r4
	str r6, [sp]
	str r5, [sp, 0x4]
	str r0, [sp, 0x8]
	mov r0, r8
	bl sub_80791A8
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80E1DC4

	thumb_func_start sub_80E1E0C
sub_80E1E0C: @ 80E1E0C
	push {lr}
	adds r2, r0, 0
	ldr r0, _080E1E28 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E1E22
	adds r0, r2, 0
	bl DestroyAnimSprite
_080E1E22:
	pop {r0}
	bx r0
	.align 2, 0
_080E1E28: .4byte gPaletteFade
	thumb_func_end sub_80E1E0C

	thumb_func_start sub_80E1E2C
sub_80E1E2C: @ 80E1E2C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080E1E78 @ =gBattleAnimArgs
	ldrh r0, [r4, 0x2]
	strh r0, [r5, 0x2E]
	strh r0, [r5, 0x30]
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x32]
	ldrh r0, [r4, 0x6]
	strh r0, [r5, 0x34]
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x36]
	ldrh r0, [r4, 0xA]
	strh r0, [r5, 0x38]
	ldrh r0, [r4, 0xC]
	strh r0, [r5, 0x3A]
	ldrh r0, [r4]
	strh r0, [r5, 0x3C]
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	bl sub_80E1DC4
	ldrb r1, [r4, 0x8]
	ldrh r2, [r4, 0x6]
	bl BlendPalettes
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080E1E7C @ =sub_80E1E80
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E1E78: .4byte gBattleAnimArgs
_080E1E7C: .4byte sub_80E1E80
	thumb_func_end sub_80E1E2C

	thumb_func_start sub_80E1E80
sub_80E1E80: @ 80E1E80
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080E1E94
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	b _080E1F04
_080E1E94:
	ldr r0, _080E1EB0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E1F04
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E1EB8
	ldr r0, _080E1EB4 @ =sub_80E1F0C
	str r0, [r4, 0x1C]
	b _080E1F04
	.align 2, 0
_080E1EB0: .4byte gPaletteFade
_080E1EB4: .4byte sub_80E1F0C
_080E1EB8:
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	bl sub_80E1DC4
	adds r3, r0, 0
	ldrh r1, [r4, 0x30]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080E1EDE
	ldrh r1, [r4, 0x36]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x34]
	adds r0, r3, 0
	bl BlendPalettes
	b _080E1EEC
_080E1EDE:
	ldrh r1, [r4, 0x3A]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x38]
	adds r0, r3, 0
	bl BlendPalettes
_080E1EEC:
	ldrh r0, [r4, 0x30]
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	eors r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x32]
	subs r0, 0x1
	strh r0, [r4, 0x32]
_080E1F04:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E1E80

	thumb_func_start sub_80E1F0C
sub_80E1F0C: @ 80E1F0C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080E1F38 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E1F32
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	bl sub_80E1DC4
	movs r1, 0
	movs r2, 0
	bl BlendPalettes
	adds r0, r4, 0
	bl DestroyAnimSprite
_080E1F32:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E1F38: .4byte gPaletteFade
	thumb_func_end sub_80E1F0C

	thumb_func_start sub_80E1F3C
sub_80E1F3C: @ 80E1F3C
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080E1F80 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	movs r2, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	strh r2, [r4, 0x2E]
	movs r0, 0xA
	strh r0, [r4, 0x30]
	movs r0, 0x8
	strh r0, [r4, 0x32]
	movs r0, 0x28
	strh r0, [r4, 0x34]
	movs r0, 0x70
	strh r0, [r4, 0x36]
	strh r2, [r4, 0x38]
	ldr r1, _080E1F84 @ =move_anim_8074EE0
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	ldr r1, _080E1F88 @ =sub_8078174
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E1F80: .4byte gBattleAnimArgs
_080E1F84: .4byte move_anim_8074EE0
_080E1F88: .4byte sub_8078174
	thumb_func_end sub_80E1F3C

	thumb_func_start sub_80E1F8C
sub_80E1F8C: @ 80E1F8C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080E1FD0 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldr r3, _080E1FD4 @ =gBattleAnimArgs
	ldrh r1, [r3]
	movs r5, 0
	strh r1, [r4, 0x8]
	ldrh r1, [r3, 0x2]
	strh r1, [r4, 0xA]
	ldrh r1, [r3, 0x4]
	strh r1, [r4, 0xC]
	ldrh r1, [r3, 0x6]
	strh r1, [r4, 0xE]
	ldrh r2, [r3, 0x8]
	strh r2, [r4, 0x10]
	ldrh r1, [r3, 0xA]
	strh r1, [r4, 0x12]
	strh r5, [r4, 0x18]
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0
	bl sub_80E1FDC
	ldr r0, _080E1FD8 @ =sub_80E202C
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E1FD0: .4byte gTasks
_080E1FD4: .4byte gBattleAnimArgs
_080E1FD8: .4byte sub_80E202C
	thumb_func_end sub_80E1F8C

	thumb_func_start sub_80E1FDC
sub_80E1FDC: @ 80E1FDC
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	ldr r1, _080E2028 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	bl sub_80E1DC4
	movs r1, 0xA
	ldrsb r1, [r4, r1]
	ldrh r2, [r4, 0x12]
	str r2, [sp]
	adds r2, r5, 0
	adds r3, r6, 0
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x18]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x18]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E2028: .4byte gTasks
	thumb_func_end sub_80E1FDC

	thumb_func_start sub_80E202C
sub_80E202C: @ 80E202C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	adds r4, r3, 0
	ldr r0, _080E2064 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E208E
	ldr r1, _080E2068 @ =gTasks
	lsls r2, r3, 2
	adds r0, r2, r3
	lsls r0, 3
	adds r3, r0, r1
	movs r5, 0xC
	ldrsh r0, [r3, r5]
	adds r6, r1, 0
	adds r5, r2, 0
	cmp r0, 0
	ble _080E2088
	movs r1, 0x18
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080E206C
	ldrb r1, [r3, 0xE]
	ldrb r2, [r3, 0x10]
	b _080E2070
	.align 2, 0
_080E2064: .4byte gPaletteFade
_080E2068: .4byte gTasks
_080E206C:
	ldrb r1, [r3, 0x10]
	ldrb r2, [r3, 0xE]
_080E2070:
	adds r0, r5, r4
	lsls r0, 3
	adds r0, r6
	movs r3, 0xC
	ldrsh r0, [r0, r3]
	cmp r0, 0x1
	bne _080E2080
	movs r2, 0
_080E2080:
	adds r0, r4, 0
	bl sub_80E1FDC
	b _080E208E
_080E2088:
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080E208E:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80E202C

	thumb_func_start sub_80E2094
sub_80E2094: @ 80E2094
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080E20D8 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldr r3, _080E20DC @ =gBattleAnimArgs
	ldrh r1, [r3]
	movs r5, 0
	strh r1, [r4, 0x8]
	ldrh r1, [r3, 0x2]
	strh r1, [r4, 0xA]
	ldrh r1, [r3, 0x4]
	strh r1, [r4, 0xC]
	ldrh r1, [r3, 0x6]
	strh r1, [r4, 0xE]
	ldrh r2, [r3, 0x8]
	strh r2, [r4, 0x10]
	ldrh r1, [r3, 0xA]
	strh r1, [r4, 0x12]
	strh r5, [r4, 0x18]
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0
	bl sub_80E20E4
	ldr r0, _080E20E0 @ =sub_80E2140
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E20D8: .4byte gTasks
_080E20DC: .4byte gBattleAnimArgs
_080E20E0: .4byte sub_80E2140
	thumb_func_end sub_80E2094

	thumb_func_start sub_80E20E4
sub_80E20E4: @ 80E20E4
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	ldr r1, _080E213C @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldrh r0, [r4, 0x8]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r2, 0x1
	lsls r2, r0
	movs r1, 0xA
	ldrsb r1, [r4, r1]
	ldrh r0, [r4, 0x12]
	str r0, [sp]
	adds r0, r2, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x18]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x18]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E213C: .4byte gTasks
	thumb_func_end sub_80E20E4

	thumb_func_start sub_80E2140
sub_80E2140: @ 80E2140
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	adds r4, r3, 0
	ldr r0, _080E2178 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E21A2
	ldr r1, _080E217C @ =gTasks
	lsls r2, r3, 2
	adds r0, r2, r3
	lsls r0, 3
	adds r3, r0, r1
	movs r5, 0xC
	ldrsh r0, [r3, r5]
	adds r6, r1, 0
	adds r5, r2, 0
	cmp r0, 0
	ble _080E219C
	movs r1, 0x18
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080E2180
	ldrb r1, [r3, 0xE]
	ldrb r2, [r3, 0x10]
	b _080E2184
	.align 2, 0
_080E2178: .4byte gPaletteFade
_080E217C: .4byte gTasks
_080E2180:
	ldrb r1, [r3, 0x10]
	ldrb r2, [r3, 0xE]
_080E2184:
	adds r0, r5, r4
	lsls r0, 3
	adds r0, r6
	movs r3, 0xC
	ldrsh r0, [r0, r3]
	cmp r0, 0x1
	bne _080E2194
	movs r2, 0
_080E2194:
	adds r0, r4, 0
	bl sub_80E20E4
	b _080E21A2
_080E219C:
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080E21A2:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80E2140

	thumb_func_start sub_80E21A8
sub_80E21A8: @ 80E21A8
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080E2208 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldr r5, _080E220C @ =gBattleAnimArgs
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x8]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0xA]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0xC]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0xE]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x10]
	ldrh r0, [r5, 0xA]
	strh r0, [r4, 0x12]
	ldrh r0, [r5, 0xC]
	strh r0, [r4, 0x14]
	ldrh r0, [r5]
	strh r0, [r4, 0x16]
	ldrh r0, [r5]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r1, 0x1
	lsls r1, r0
	ldrb r3, [r5, 0x8]
	ldrh r0, [r5, 0x6]
	str r0, [sp]
	adds r0, r1, 0
	movs r1, 0
	adds r2, r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _080E2210 @ =sub_80E2214
	str r0, [r4]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E2208: .4byte gTasks
_080E220C: .4byte gBattleAnimArgs
_080E2210: .4byte sub_80E2214
	thumb_func_end sub_80E21A8

	thumb_func_start sub_80E2214
sub_80E2214: @ 80E2214
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080E2238 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0x8]
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080E223C
	subs r0, r1, 0x1
	strh r0, [r4, 0x8]
	b _080E22C0
	.align 2, 0
_080E2238: .4byte gTasks
_080E223C:
	ldr r0, _080E2258 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E22C0
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _080E2260
	ldr r0, _080E225C @ =sub_80E22CC
	str r0, [r4]
	b _080E22C0
	.align 2, 0
_080E2258: .4byte gPaletteFade
_080E225C: .4byte sub_80E22CC
_080E2260:
	ldrh r0, [r4, 0x16]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r2, 0x1
	lsls r2, r0
	ldrh r1, [r4, 0xA]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080E228E
	ldrb r3, [r4, 0x10]
	ldrh r0, [r4, 0xE]
	str r0, [sp]
	adds r0, r2, 0
	movs r1, 0
	adds r2, r3, 0
	bl BeginNormalPaletteFade
	b _080E229E
_080E228E:
	ldrb r3, [r4, 0x14]
	ldrh r0, [r4, 0x12]
	str r0, [sp]
	adds r0, r2, 0
	movs r1, 0
	adds r2, r3, 0
	bl BeginNormalPaletteFade
_080E229E:
	ldr r0, _080E22C8 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xA]
	movs r3, 0x80
	lsls r3, 1
	adds r2, r3, 0
	eors r0, r2
	strh r0, [r1, 0xA]
	movs r2, 0xFF
	ands r0, r2
	strh r0, [r1, 0x8]
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
_080E22C0:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E22C8: .4byte gTasks
	thumb_func_end sub_80E2214

	thumb_func_start sub_80E22CC
sub_80E22CC: @ 80E22CC
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080E231C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080E2312
	ldr r1, _080E2320 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x16]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r1, 0x1
	lsls r1, r0
	str r5, [sp]
	adds r0, r1, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl BeginNormalPaletteFade
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080E2312:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E231C: .4byte gPaletteFade
_080E2320: .4byte gTasks
	thumb_func_end sub_80E22CC

	thumb_func_start sub_80E2324
sub_80E2324: @ 80E2324
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r2, 0
	ldr r0, _080E239C @ =gAnimBankAttacker
	ldrb r6, [r0]
	ldr r0, _080E23A0 @ =gAnimBankTarget
	ldrb r7, [r0]
	ldr r4, _080E23A4 @ =gBattleAnimArgs
	ldrh r1, [r4]
	movs r5, 0x80
	lsls r5, 1
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _080E235E
	str r2, [sp]
	str r2, [sp, 0x4]
	str r2, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r3, 0
	bl sub_80791A8
	adds r2, r0, 0
_080E235E:
	ldrh r1, [r4, 0x2]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _080E2370
	movs r0, 0x80
	lsls r0, 9
	lsls r0, r6
	orrs r2, r0
_080E2370:
	ldrh r1, [r4, 0x4]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _080E2382
	movs r0, 0x80
	lsls r0, 9
	lsls r0, r7
	orrs r2, r0
_080E2382:
	adds r0, r2, 0
	bl InvertPlttBuffer
	mov r0, r8
	bl DestroyAnimVisualTask
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E239C: .4byte gAnimBankAttacker
_080E23A0: .4byte gAnimBankTarget
_080E23A4: .4byte gBattleAnimArgs
	thumb_func_end sub_80E2324

	thumb_func_start unref_sub_80E23A8
unref_sub_80E23A8: @ 80E23A8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r5, 0
	ldr r1, _080E249C @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E23EA
	ldr r1, _080E24A0 @ =gBattleAnimArgs
	ldrh r0, [r1]
	strh r0, [r4, 0xC]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0xE]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x10]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0xA]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x12]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x14]
	ldrh r0, [r1, 0xC]
	strh r0, [r4, 0x16]
_080E23EA:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldr r0, _080E24A4 @ =gAnimBankAttacker
	ldrb r0, [r0]
	mov r9, r0
	ldr r0, _080E24A8 @ =gAnimBankTarget
	ldrb r0, [r0]
	mov r10, r0
	ldrh r1, [r4, 0xC]
	movs r7, 0x80
	lsls r7, 1
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _080E240C
	ldr r5, _080E24AC @ =0x0000ffff
_080E240C:
	movs r6, 0x1
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	beq _080E243C
	ldr r2, _080E24B0 @ =gSprites
	ldr r0, _080E24B4 @ =gHealthboxIDs
	add r0, r9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x14
	adds r0, r2
	ldr r0, [r0]
	ldrh r0, [r0, 0x2]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r1, r6, 0
	lsls r1, r0
	lsls r1, 16
	orrs r5, r1
_080E243C:
	ldrh r1, [r4, 0xE]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _080E2450
	adds r0, r6, 0
	mov r2, r9
	lsls r0, r2
	lsls r0, 16
	orrs r5, r0
_080E2450:
	ldrh r1, [r4, 0x10]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _080E2464
	adds r0, r6, 0
	mov r1, r10
	lsls r0, r1
	lsls r0, 16
	orrs r5, r0
_080E2464:
	movs r1, 0x12
	ldrsb r1, [r4, r1]
	movs r2, 0x14
	ldrsb r2, [r4, r2]
	movs r3, 0x16
	ldrsb r3, [r4, r3]
	adds r0, r5, 0
	bl TintPlttBuffer
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080E248E
	adds r0, r5, 0
	bl UnfadePlttBuffer
	mov r0, r8
	bl DestroyAnimVisualTask
_080E248E:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E249C: .4byte gTasks
_080E24A0: .4byte gBattleAnimArgs
_080E24A4: .4byte gAnimBankAttacker
_080E24A8: .4byte gAnimBankTarget
_080E24AC: .4byte 0x0000ffff
_080E24B0: .4byte gSprites
_080E24B4: .4byte gHealthboxIDs
	thumb_func_end unref_sub_80E23A8

	thumb_func_start sub_80E24B8
sub_80E24B8: @ 80E24B8
	push {r4,lr}
	adds r4, r0, 0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080E24EC @ =gBattleAnimArgs
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x30]
	strh r0, [r4, 0x32]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x34]
	movs r2, 0x6
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	beq _080E2500
	cmp r0, 0x1
	bgt _080E24F0
	cmp r0, 0
	beq _080E24F6
	b _080E2518
	.align 2, 0
_080E24EC: .4byte gBattleAnimArgs
_080E24F0:
	cmp r0, 0x2
	beq _080E2508
	b _080E2518
_080E24F6:
	ldr r1, _080E24FC @ =gBattle_BG3_X
	b _080E250A
	.align 2, 0
_080E24FC: .4byte gBattle_BG3_X
_080E2500:
	ldr r1, _080E2504 @ =gBattle_BG3_Y
	b _080E250A
	.align 2, 0
_080E2504: .4byte gBattle_BG3_Y
_080E2508:
	ldr r1, _080E2514 @ =gSpriteCoordOffsetX
_080E250A:
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	b _080E2520
	.align 2, 0
_080E2514: .4byte gSpriteCoordOffsetX
_080E2518:
	ldr r1, _080E2550 @ =gSpriteCoordOffsetY
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
_080E2520:
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	lsls r0, 16
	orrs r1, r0
	ldr r0, [r1]
	strh r0, [r4, 0x36]
	ldr r0, _080E2554 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x6]
	strh r0, [r4, 0x38]
	subs r0, 0x2
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080E2544
	bl sub_80E260C
_080E2544:
	ldr r0, _080E2558 @ =sub_80E255C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E2550: .4byte gSpriteCoordOffsetY
_080E2554: .4byte gBattleAnimArgs
_080E2558: .4byte sub_80E255C
	thumb_func_end sub_80E24B8

	thumb_func_start sub_80E255C
sub_80E255C: @ 80E255C
	push {r4-r7,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x34]
	movs r2, 0x34
	ldrsh r0, [r3, r2]
	cmp r0, 0
	ble _080E25A0
	subs r0, r1, 0x1
	strh r0, [r3, 0x34]
	ldrh r1, [r3, 0x30]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r0, 0
	ble _080E257E
	subs r0, r1, 0x1
	strh r0, [r3, 0x30]
	b _080E25FA
_080E257E:
	ldrh r0, [r3, 0x32]
	strh r0, [r3, 0x30]
	movs r0, 0x3A
	ldrsh r1, [r3, r0]
	movs r2, 0x3C
	ldrsh r0, [r3, r2]
	lsls r0, 16
	orrs r1, r0
	movs r0, 0x2E
	ldrsh r2, [r3, r0]
	ldr r0, [r1]
	adds r0, r2
	str r0, [r1]
	ldrh r0, [r3, 0x2E]
	negs r0, r0
	strh r0, [r3, 0x2E]
	b _080E25FA
_080E25A0:
	movs r2, 0x3A
	ldrsh r1, [r3, r2]
	movs r2, 0x3C
	ldrsh r0, [r3, r2]
	lsls r0, 16
	orrs r1, r0
	movs r2, 0x36
	ldrsh r0, [r3, r2]
	str r0, [r1]
	ldrh r0, [r3, 0x38]
	subs r0, 0x2
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080E25F4
	movs r4, 0
	ldr r5, _080E2600 @ =gNoOfAllBanks
	ldrb r0, [r5]
	cmp r4, r0
	bcs _080E25F4
	ldr r2, _080E2604 @ =gSprites
	mov r12, r2
	ldr r6, _080E2608 @ =gBankSpriteIds
	movs r7, 0x3
	negs r7, r7
_080E25D2:
	adds r0, r4, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r12
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r7, 0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r5]
	cmp r4, r0
	bcc _080E25D2
_080E25F4:
	adds r0, r3, 0
	bl DestroyAnimSprite
_080E25FA:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E2600: .4byte gNoOfAllBanks
_080E2604: .4byte gSprites
_080E2608: .4byte gBankSpriteIds
	thumb_func_end sub_80E255C

	thumb_func_start sub_80E260C
sub_80E260C: @ 80E260C
	push {r4-r6,lr}
	ldr r6, _080E2680 @ =gSprites
	ldr r4, _080E2684 @ =gBankSpriteIds
	ldr r5, _080E2688 @ =gAnimBankAttacker
	ldrb r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x3
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	ldr r3, _080E268C @ =gAnimBankTarget
	ldrb r0, [r3]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	ldr r0, _080E2690 @ =gBattleAnimArgs
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0x2
	bne _080E2694
	ldrb r0, [r5]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
	ldrb r0, [r3]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	b _080E26B0
	.align 2, 0
_080E2680: .4byte gSprites
_080E2684: .4byte gBankSpriteIds
_080E2688: .4byte gAnimBankAttacker
_080E268C: .4byte gAnimBankTarget
_080E2690: .4byte gBattleAnimArgs
_080E2694:
	cmp r0, 0
	bne _080E269C
	ldrb r0, [r5]
	b _080E269E
_080E269C:
	ldrb r0, [r3]
_080E269E:
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x2
_080E26B0:
	orrs r1, r2
	strb r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80E260C

	thumb_func_start sub_80E26BC
sub_80E26BC: @ 80E26BC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080E26FC @ =gTasks
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r1
	ldr r3, _080E2700 @ =gBattleAnimArgs
	ldrh r1, [r3]
	strh r1, [r2, 0x8]
	ldrh r1, [r3, 0x2]
	strh r1, [r2, 0xA]
	ldrh r1, [r3, 0x4]
	strh r1, [r2, 0xC]
	ldrh r1, [r3, 0x6]
	strh r1, [r2, 0xE]
	ldrh r1, [r3, 0x6]
	strh r1, [r2, 0x18]
	ldr r4, _080E2704 @ =gBattle_BG3_X
	ldrh r1, [r3]
	strh r1, [r4]
	ldr r4, _080E2708 @ =gBattle_BG3_Y
	ldrh r1, [r3, 0x2]
	strh r1, [r4]
	ldr r1, _080E270C @ =sub_80E2710
	str r1, [r2]
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E26FC: .4byte gTasks
_080E2700: .4byte gBattleAnimArgs
_080E2704: .4byte gBattle_BG3_X
_080E2708: .4byte gBattle_BG3_Y
_080E270C: .4byte sub_80E2710
	thumb_func_end sub_80E26BC

	thumb_func_start sub_80E2710
sub_80E2710: @ 80E2710
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080E2740 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r1
	ldrh r2, [r3, 0xE]
	movs r4, 0xE
	ldrsh r0, [r3, r4]
	mov r12, r1
	cmp r0, 0
	bne _080E2796
	ldr r0, _080E2744 @ =gBattle_BG3_X
	ldrh r2, [r0]
	movs r7, 0x8
	ldrsh r1, [r3, r7]
	adds r6, r0, 0
	cmp r2, r1
	bne _080E2748
	ldrh r0, [r3, 0x8]
	negs r0, r0
	b _080E274A
	.align 2, 0
_080E2740: .4byte gTasks
_080E2744: .4byte gBattle_BG3_X
_080E2748:
	ldrh r0, [r3, 0x8]
_080E274A:
	strh r0, [r6]
	ldr r2, _080E2768 @ =gBattle_BG3_Y
	ldrh r3, [r2]
	lsls r1, r5, 2
	adds r0, r1, r5
	lsls r0, 3
	mov r7, r12
	adds r4, r0, r7
	movs r7, 0xA
	ldrsh r0, [r4, r7]
	cmn r3, r0
	bne _080E276C
	movs r0, 0
	b _080E2770
	.align 2, 0
_080E2768: .4byte gBattle_BG3_Y
_080E276C:
	ldrh r0, [r4, 0xA]
	negs r0, r0
_080E2770:
	strh r0, [r2]
	adds r0, r1, r5
	lsls r0, 3
	add r0, r12
	ldrh r1, [r0, 0x18]
	strh r1, [r0, 0xE]
	ldrh r1, [r0, 0xC]
	subs r1, 0x1
	strh r1, [r0, 0xC]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0
	bne _080E279A
	strh r1, [r6]
	strh r1, [r2]
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	b _080E279A
_080E2796:
	subs r0, r2, 0x1
	strh r0, [r3, 0xE]
_080E279A:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80E2710

	thumb_func_start sub_80E27A0
sub_80E27A0: @ 80E27A0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080E27C0 @ =gBattleAnimArgs
	ldrb r1, [r4, 0x6]
	bl StartSpriteAffineAnim
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E27C4
	adds r0, r5, 0
	movs r1, 0x1
	bl InitAnimSpritePos
	b _080E27CC
	.align 2, 0
_080E27C0: .4byte gBattleAnimArgs
_080E27C4:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8078764
_080E27CC:
	ldr r0, _080E27E0 @ =sub_80785E4
	str r0, [r5, 0x1C]
	ldr r1, _080E27E4 @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E27E0: .4byte sub_80785E4
_080E27E4: .4byte DestroyAnimSprite
	thumb_func_end sub_80E27A0

	thumb_func_start sub_80E27E8
sub_80E27E8: @ 80E27E8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080E2808 @ =gBattleAnimArgs
	ldrb r1, [r4, 0x6]
	bl StartSpriteAffineAnim
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E280C
	adds r0, r5, 0
	movs r1, 0x1
	bl InitAnimSpritePos
	b _080E2814
	.align 2, 0
_080E2808: .4byte gBattleAnimArgs
_080E280C:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8078764
_080E2814:
	ldr r0, _080E282C @ =gBattleAnimArgs
	ldrh r0, [r0, 0x8]
	strh r0, [r5, 0x2E]
	ldr r0, _080E2830 @ =sub_80785E4
	str r0, [r5, 0x1C]
	ldr r1, _080E2834 @ =sub_80DA48C
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E282C: .4byte gBattleAnimArgs
_080E2830: .4byte sub_80785E4
_080E2834: .4byte sub_80DA48C
	thumb_func_end sub_80E27E8

	thumb_func_start sub_80E2838
sub_80E2838: @ 80E2838
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080E2868 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080E285C
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080E285C
	ldr r1, _080E286C @ =gBattleAnimArgs
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
_080E285C:
	adds r0, r4, 0
	bl sub_80E27A0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E2868: .4byte gAnimBankAttacker
_080E286C: .4byte gBattleAnimArgs
	thumb_func_end sub_80E2838

	thumb_func_start sub_80E2870
sub_80E2870: @ 80E2870
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080E28A8 @ =gBattleAnimArgs
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _080E288C
	bl Random
	movs r1, 0x3
	ands r1, r0
	strh r1, [r5, 0x2]
_080E288C:
	ldrb r1, [r5, 0x2]
	adds r0, r4, 0
	bl StartSpriteAffineAnim
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080E28AC
	adds r0, r4, 0
	movs r1, 0
	bl InitAnimSpritePos
	b _080E28B4
	.align 2, 0
_080E28A8: .4byte gBattleAnimArgs
_080E28AC:
	adds r0, r4, 0
	movs r1, 0
	bl sub_8078764
_080E28B4:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x30
	bl __umodsi3
	ldr r1, _080E28F8 @ =0x0000ffe8
	adds r0, r1
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x18
	bl __umodsi3
	ldr r1, _080E28FC @ =0x0000fff4
	adds r0, r1
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldr r1, _080E2900 @ =move_anim_8074EE0
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	ldr r0, _080E2904 @ =sub_80785E4
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E28F8: .4byte 0x0000ffe8
_080E28FC: .4byte 0x0000fff4
_080E2900: .4byte move_anim_8074EE0
_080E2904: .4byte sub_80785E4
	thumb_func_end sub_80E2870

	thumb_func_start sub_80E2908
sub_80E2908: @ 80E2908
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080E2968 @ =gBattleAnimArgs
	ldrb r0, [r5]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x2E]
	ldr r2, _080E296C @ =gSprites
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x24]
	ldrh r0, [r0, 0x20]
	adds r1, r0
	strh r1, [r4, 0x20]
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	strh r1, [r4, 0x22]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x24]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x26]
	ldrb r1, [r5, 0x6]
	adds r0, r4, 0
	bl StartSpriteAffineAnim
	ldr r1, _080E2970 @ =move_anim_8074EE0
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	ldr r0, _080E2974 @ =sub_80785E4
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E2968: .4byte gBattleAnimArgs
_080E296C: .4byte gSprites
_080E2970: .4byte move_anim_8074EE0
_080E2974: .4byte sub_80785E4
	thumb_func_end sub_80E2908

	thumb_func_start sub_80E2978
sub_80E2978: @ 80E2978
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080E2990 @ =gBattleAnimArgs
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080E2994
	adds r0, r4, 0
	movs r1, 0x1
	bl InitAnimSpritePos
	b _080E299C
	.align 2, 0
_080E2990: .4byte gBattleAnimArgs
_080E2994:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8078764
_080E299C:
	ldr r0, _080E29B4 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x6]
	strh r0, [r4, 0x2E]
	ldr r1, _080E29B8 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	ldr r0, _080E29BC @ =WaitAnimForDuration
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E29B4: .4byte gBattleAnimArgs
_080E29B8: .4byte DestroyAnimSprite
_080E29BC: .4byte WaitAnimForDuration
	thumb_func_end sub_80E2978

	thumb_func_start sub_80E29C0
sub_80E29C0: @ 80E29C0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080E29E0 @ =gBattleAnimArgs
	ldrb r1, [r4, 0x6]
	bl StartSpriteAffineAnim
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E29E4
	adds r0, r5, 0
	movs r1, 0x1
	bl InitAnimSpritePos
	b _080E29EC
	.align 2, 0
_080E29E0: .4byte gBattleAnimArgs
_080E29E4:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8078764
_080E29EC:
	ldr r0, _080E29F8 @ =sub_80E29FC
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E29F8: .4byte sub_80E29FC
	thumb_func_end sub_80E29C0

	thumb_func_start sub_80E29FC
sub_80E29FC: @ 80E29FC
	push {lr}
	adds r3, r0, 0
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r0, [r3, 0x2E]
	adds r1, r0, 0x1
	strh r1, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _080E2A32
	adds r0, r3, 0
	bl DestroyAnimSprite
_080E2A32:
	pop {r0}
	bx r0
	thumb_func_end sub_80E29FC

	thumb_func_start sub_80E2A38
sub_80E2A38: @ 80E2A38
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _080E2A78 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r4, r1]
	bl sub_80E1DC4
	adds r6, r0, 0
	ldrh r3, [r4]
	lsls r3, 16
	asrs r0, r3, 23
	movs r4, 0x1
	ands r0, r4
	asrs r1, r3, 24
	ands r1, r4
	asrs r2, r3, 25
	ands r2, r4
	asrs r3, 26
	ands r3, r4
	bl sub_80792C0
	orrs r6, r0
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_80E2C8C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E2A78: .4byte gBattleAnimArgs
	thumb_func_end sub_80E2A38

	thumb_func_start sub_80E2A7C
sub_80E2A7C: @ 80E2A7C
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	mov r1, sp
	movs r0, 0xFF
	strb r0, [r1, 0x1]
	movs r0, 0x1
	bl sub_80E1DC4
	adds r5, r0, 0
	ldr r0, _080E2AA8 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x7
	bhi _080E2B26
	lsls r0, 2
	ldr r1, _080E2AAC @ =_080E2AB0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E2AA8: .4byte gBattleAnimArgs
_080E2AAC: .4byte _080E2AB0
	.align 2, 0
_080E2AB0:
	.4byte _080E2AD2
	.4byte _080E2ADE
	.4byte _080E2AD0
	.4byte _080E2ADC
	.4byte _080E2AEC
	.4byte _080E2B04
	.4byte _080E2B0C
	.4byte _080E2B18
_080E2AD0:
	movs r5, 0
_080E2AD2:
	mov r0, sp
	ldr r1, _080E2AD8 @ =gAnimBankAttacker
	b _080E2AE2
	.align 2, 0
_080E2AD8: .4byte gAnimBankAttacker
_080E2ADC:
	movs r5, 0
_080E2ADE:
	mov r0, sp
	ldr r1, _080E2AE8 @ =gAnimBankTarget
_080E2AE2:
	ldrb r1, [r1]
	strb r1, [r0]
	b _080E2B26
	.align 2, 0
_080E2AE8: .4byte gAnimBankTarget
_080E2AEC:
	mov r1, sp
	ldr r0, _080E2AFC @ =gAnimBankAttacker
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080E2B00 @ =gAnimBankTarget
	ldrb r0, [r0]
	strb r0, [r1, 0x1]
	b _080E2B26
	.align 2, 0
_080E2AFC: .4byte gAnimBankAttacker
_080E2B00: .4byte gAnimBankTarget
_080E2B04:
	mov r1, sp
	movs r0, 0xFF
	strb r0, [r1]
	b _080E2B26
_080E2B0C:
	movs r5, 0
	mov r2, sp
	ldr r0, _080E2B14 @ =gAnimBankAttacker
	b _080E2B1E
	.align 2, 0
_080E2B14: .4byte gAnimBankAttacker
_080E2B18:
	movs r5, 0
	mov r2, sp
	ldr r0, _080E2B70 @ =gAnimBankTarget
_080E2B1E:
	ldrb r0, [r0]
	movs r1, 0x2
	eors r0, r1
	strb r0, [r2]
_080E2B26:
	movs r4, 0
	mov r6, sp
_080E2B2A:
	ldrb r0, [r6]
	cmp r4, r0
	beq _080E2B54
	ldrb r0, [r6, 0x1]
	cmp r4, r0
	beq _080E2B54
	adds r0, r4, 0
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080E2B54
	adds r0, r4, 0
	bl sub_80793A8
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x80
	lsls r1, 9
	lsls r1, r0
	orrs r5, r1
_080E2B54:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080E2B2A
	adds r0, r7, 0
	adds r1, r5, 0
	bl sub_80E2C8C
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E2B70: .4byte gAnimBankTarget
	thumb_func_end sub_80E2A7C

	thumb_func_start sub_80E2B74
sub_80E2B74: @ 80E2B74
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080E2B98 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	bl sub_80E1DC4
	adds r2, r0, 0
	ldr r0, _080E2B9C @ =gBattleTerrain
	ldrb r0, [r0]
	cmp r0, 0x9
	bhi _080E2C4A
	lsls r0, 2
	ldr r1, _080E2BA0 @ =_080E2BA4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E2B98: .4byte gBattleAnimArgs
_080E2B9C: .4byte gBattleTerrain
_080E2BA0: .4byte _080E2BA4
	.align 2, 0
_080E2BA4:
	.4byte _080E2BCC
	.4byte _080E2BDC
	.4byte _080E2BE8
	.4byte _080E2BF8
	.4byte _080E2C04
	.4byte _080E2C14
	.4byte _080E2C24
	.4byte _080E2C34
	.4byte _080E2C44
	.4byte _080E2C44
_080E2BCC:
	ldr r1, _080E2BD4 @ =gBattleAnimArgs
	ldr r0, _080E2BD8 @ =0x00000b0c
	b _080E2C48
	.align 2, 0
_080E2BD4: .4byte gBattleAnimArgs
_080E2BD8: .4byte 0x00000b0c
_080E2BDC:
	ldr r1, _080E2BE4 @ =gBattleAnimArgs
	movs r0, 0x9E
	lsls r0, 4
	b _080E2C48
	.align 2, 0
_080E2BE4: .4byte gBattleAnimArgs
_080E2BE8:
	ldr r1, _080E2BF0 @ =gBattleAnimArgs
	ldr r0, _080E2BF4 @ =0x00002f1e
	b _080E2C48
	.align 2, 0
_080E2BF0: .4byte gBattleAnimArgs
_080E2BF4: .4byte 0x00002f1e
_080E2BF8:
	ldr r1, _080E2C00 @ =gBattleAnimArgs
	movs r0, 0x90
	lsls r0, 7
	b _080E2C48
	.align 2, 0
_080E2C00: .4byte gBattleAnimArgs
_080E2C04:
	ldr r1, _080E2C0C @ =gBattleAnimArgs
	ldr r0, _080E2C10 @ =0x00007ecb
	b _080E2C48
	.align 2, 0
_080E2C0C: .4byte gBattleAnimArgs
_080E2C10: .4byte 0x00007ecb
_080E2C14:
	ldr r1, _080E2C1C @ =gBattleAnimArgs
	ldr r0, _080E2C20 @ =0x00007ecb
	b _080E2C48
	.align 2, 0
_080E2C1C: .4byte gBattleAnimArgs
_080E2C20: .4byte 0x00007ecb
_080E2C24:
	ldr r1, _080E2C2C @ =gBattleAnimArgs
	ldr r0, _080E2C30 @ =0x00002a16
	b _080E2C48
	.align 2, 0
_080E2C2C: .4byte gBattleAnimArgs
_080E2C30: .4byte 0x00002a16
_080E2C34:
	ldr r1, _080E2C3C @ =gBattleAnimArgs
	ldr r0, _080E2C40 @ =0x00000d2e
	b _080E2C48
	.align 2, 0
_080E2C3C: .4byte gBattleAnimArgs
_080E2C40: .4byte 0x00000d2e
_080E2C44:
	ldr r1, _080E2C58 @ =gBattleAnimArgs
	ldr r0, _080E2C5C @ =0x00007fff
_080E2C48:
	strh r0, [r1, 0x8]
_080E2C4A:
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80E2C8C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E2C58: .4byte gBattleAnimArgs
_080E2C5C: .4byte 0x00007fff
	thumb_func_end sub_80E2B74

	thumb_func_start sub_80E2C60
sub_80E2C60: @ 80E2C60
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080E2C88 @ =gBattleAnimArgs
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r1, 0x1
	lsls r1, r0
	adds r0, r4, 0
	bl sub_80E2C8C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E2C88: .4byte gBattleAnimArgs
	thumb_func_end sub_80E2C60

	thumb_func_start sub_80E2C8C
sub_80E2C8C: @ 80E2C8C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080E2CC4 @ =gTasks
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r3
	strh r1, [r2, 0x8]
	lsrs r1, 16
	strh r1, [r2, 0xA]
	ldr r3, _080E2CC8 @ =gBattleAnimArgs
	ldrh r1, [r3, 0x2]
	strh r1, [r2, 0xC]
	ldrh r1, [r3, 0x4]
	strh r1, [r2, 0xE]
	ldrh r1, [r3, 0x6]
	strh r1, [r2, 0x10]
	ldrh r1, [r3, 0x8]
	strh r1, [r2, 0x12]
	ldrh r1, [r3, 0x4]
	strh r1, [r2, 0x1C]
	ldr r1, _080E2CCC @ =sub_80E2CD0
	str r1, [r2]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080E2CC4: .4byte gTasks
_080E2CC8: .4byte gBattleAnimArgs
_080E2CCC: .4byte sub_80E2CD0
	thumb_func_end sub_80E2C8C

	thumb_func_start sub_80E2CD0
sub_80E2CD0: @ 80E2CD0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0
	ldr r2, _080E2D50 @ =gTasks
	lsls r5, r7, 2
	adds r0, r5, r7
	lsls r0, 3
	adds r3, r0, r2
	ldrh r0, [r3, 0x1A]
	mov r8, r0
	movs r4, 0x1A
	ldrsh r1, [r3, r4]
	movs r4, 0xC
	ldrsh r0, [r3, r4]
	mov r9, r2
	cmp r1, r0
	bne _080E2D66
	strh r6, [r3, 0x1A]
	movs r0, 0x8
	ldrsh r4, [r3, r0]
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	lsls r0, 16
	orrs r4, r0
	mov r8, r5
	cmp r4, 0
	beq _080E2D32
	adds r5, r3, 0
_080E2D10:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080E2D24
	ldrb r2, [r5, 0x1C]
	ldrh r3, [r5, 0x12]
	adds r0, r6, 0
	movs r1, 0x10
	bl BlendPalette
_080E2D24:
	adds r0, r6, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r6, r0, 16
	lsrs r4, 1
	cmp r4, 0
	bne _080E2D10
_080E2D32:
	mov r4, r8
	adds r0, r4, r7
	lsls r0, 3
	mov r1, r9
	adds r2, r0, r1
	ldrh r0, [r2, 0x1C]
	movs r4, 0x1C
	ldrsh r3, [r2, r4]
	movs r4, 0x10
	ldrsh r1, [r2, r4]
	cmp r3, r1
	bge _080E2D54
	adds r0, 0x1
	strh r0, [r2, 0x1C]
	b _080E2D6C
	.align 2, 0
_080E2D50: .4byte gTasks
_080E2D54:
	cmp r3, r1
	ble _080E2D5E
	subs r0, 0x1
	strh r0, [r2, 0x1C]
	b _080E2D6C
_080E2D5E:
	adds r0, r7, 0
	bl DestroyAnimVisualTask
	b _080E2D6C
_080E2D66:
	mov r0, r8
	adds r0, 0x1
	strh r0, [r3, 0x1A]
_080E2D6C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80E2CD0

	thumb_func_start sub_80E2D78
sub_80E2D78: @ 80E2D78
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _080E2DAC @ =gBattleAnimArgs
	ldrb r0, [r4]
	ldrb r1, [r4, 0x2]
	ldrb r2, [r4, 0x4]
	ldrb r3, [r4, 0x6]
	ldrb r4, [r4, 0x8]
	str r4, [sp]
	bl BeginHardwarePaletteFade
	ldr r1, _080E2DB0 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080E2DB4 @ =sub_80E2DB8
	str r1, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E2DAC: .4byte gBattleAnimArgs
_080E2DB0: .4byte gTasks
_080E2DB4: .4byte sub_80E2DB8
	thumb_func_end sub_80E2D78

	thumb_func_start sub_80E2DB8
sub_80E2DB8: @ 80E2DB8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080E2DD4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E2DD0
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080E2DD0:
	pop {r0}
	bx r0
	.align 2, 0
_080E2DD4: .4byte gPaletteFade
	thumb_func_end sub_80E2DB8

	thumb_func_start sub_80E2DD8
sub_80E2DD8: @ 80E2DD8
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080E2E04 @ =gTasks
	adds r1, r0
	ldr r2, _080E2E08 @ =gBattleAnimArgs
	ldrh r0, [r2]
	movs r3, 0
	strh r0, [r1, 0x8]
	strh r3, [r1, 0xA]
	ldrh r0, [r2, 0x2]
	strh r0, [r1, 0xC]
	ldrh r0, [r2, 0x4]
	strh r0, [r1, 0xE]
	ldrh r0, [r2, 0x6]
	strh r0, [r1, 0x10]
	strh r3, [r1, 0x12]
	ldr r0, _080E2E0C @ =sub_80E2E10
	str r0, [r1]
	bx lr
	.align 2, 0
_080E2E04: .4byte gTasks
_080E2E08: .4byte gBattleAnimArgs
_080E2E0C: .4byte sub_80E2E10
	thumb_func_end sub_80E2DD8

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
	bl GetBankSide
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
	bl GetAnimBankSpriteId
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
	bl GetAnimBankSpriteId
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
	bl GetBankSide
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
	bl GetBankSide
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
	bl GetBankSide
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
	bl GetBankSide
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
	bl GetBankSide
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
	bl GetBankSide
	adds r4, r0, 0
	ldr r0, _080E4290 @ =gAnimBankTarget
	ldrb r0, [r0]
	bl GetBankSide
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
