	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80B6998
sub_80B6998: @ 80B6998
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080B69B0
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
_080B69B0:
	ldrh r1, [r4, 0x36]
	movs r0, 0xFF
	ands r0, r1
	adds r3, r4, 0
	adds r3, 0x3E
	movs r1, 0x1
	ands r0, r1
	lsls r0, 2
	ldrb r1, [r3]
	movs r2, 0x5
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r3]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	bne _080B69DA
	movs r0, 0x4
	orrs r2, r0
	strb r2, [r3]
_080B69DA:
	ldrb r1, [r3]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _080B6A0A
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080B6A0A
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080B6A0A
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r1, r0
	beq _080B6A16
_080B6A0A:
	movs r0, 0
	strh r0, [r4, 0x38]
	movs r0, 0x1
	strh r0, [r4, 0x3A]
	movs r0, 0x2
	strh r0, [r4, 0x3C]
_080B6A16:
	ldrh r0, [r4, 0x3C]
	subs r0, 0x1
	strh r0, [r4, 0x3C]
	lsls r0, 16
	cmp r0, 0
	bne _080B6A3E
	ldrh r1, [r4, 0x3A]
	ldrh r2, [r4, 0x38]
	adds r0, r1, r2
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	beq _080B6A36
	cmp r0, 0
	bne _080B6A3A
_080B6A36:
	negs r0, r1
	strh r0, [r4, 0x3A]
_080B6A3A:
	movs r0, 0x2
	strh r0, [r4, 0x3C]
_080B6A3E:
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080B6A74
	ldrh r4, [r4, 0x38]
	lsls r5, r4, 24
	lsrs r5, 24
	lsls r4, 16
	asrs r4, 17
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	ldr r2, _080B6A7C @ =0x01010000
	adds r0, r2
	lsrs r0, 16
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r5, 0
	bl MultiplyInvertedPaletteRGBComponents
_080B6A74:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6A7C: .4byte 0x01010000
	thumb_func_end sub_80B6998

	thumb_func_start sub_80B6A80
sub_80B6A80: @ 80B6A80
	push {r4,r5,lr}
	ldr r0, _080B6AF8 @ =gSpriteTemplate_83CE5C8
	movs r1, 0xCC
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B6AFC @ =0x02000000
	strb r0, [r1, 0x10]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r5, _080B6B00 @ =gSprites
	adds r4, r5
	ldr r1, _080B6B04 @ =gSubspriteTables_83CE558
	adds r0, r4, 0
	bl SetSubspriteTables
	ldr r0, _080B6B08 @ =gSpriteTemplate_83CE5F8
	movs r1, 0xCC
	movs r2, 0x4C
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x3A]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	ldr r1, _080B6B0C @ =gSubspriteTables_83CE560
	adds r0, r2, 0
	bl SetSubspriteTables
	ldr r0, _080B6B10 @ =gSpriteTemplate_83CE5E0
	movs r1, 0xCC
	movs r2, 0x4B
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r3, [r1, 0x5]
	movs r2, 0xD
	negs r2, r2
	ands r2, r3
	movs r3, 0x4
	orrs r2, r3
	strb r2, [r1, 0x5]
	strh r0, [r4, 0x3C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6AF8: .4byte gSpriteTemplate_83CE5C8
_080B6AFC: .4byte 0x02000000
_080B6B00: .4byte gSprites
_080B6B04: .4byte gSubspriteTables_83CE558
_080B6B08: .4byte gSpriteTemplate_83CE5F8
_080B6B0C: .4byte gSubspriteTables_83CE560
_080B6B10: .4byte gSpriteTemplate_83CE5E0
	thumb_func_end sub_80B6A80

	thumb_func_start sub_80B6B14
sub_80B6B14: @ 80B6B14
	ldr r2, _080B6B2C @ =0x02000000
	ldrb r1, [r2, 0x10]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B6B30 @ =gSprites
	adds r0, r1
	movs r1, 0x2
	strh r1, [r0, 0x2E]
	ldrb r1, [r2, 0xE]
	strh r1, [r0, 0x30]
	bx lr
	.align 2, 0
_080B6B2C: .4byte 0x02000000
_080B6B30: .4byte gSprites
	thumb_func_end sub_80B6B14

	thumb_func_start sub_80B6B34
sub_80B6B34: @ 80B6B34
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080B6B58 @ =gUnknown_083CE2B4
_080B6B3A:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080B6B3A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6B58: .4byte gUnknown_083CE2B4
	thumb_func_end sub_80B6B34

	thumb_func_start sub_80B6B5C
sub_80B6B5C: @ 80B6B5C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r3, _080B6B90 @ =gSprites
	adds r1, r3
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldr r0, _080B6B94 @ =0x02000000
	ldrb r0, [r0, 0xE]
	bl sub_80B6C48
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B6B90: .4byte gSprites
_080B6B94: .4byte 0x02000000
	thumb_func_end sub_80B6B5C

	thumb_func_start sub_80B6B98
sub_80B6B98: @ 80B6B98
	movs r0, 0
	bx lr
	thumb_func_end sub_80B6B98

	thumb_func_start sub_80B6B9C
sub_80B6B9C: @ 80B6B9C
	push {r4,r5,lr}
	adds r3, r0, 0
	movs r0, 0x3A
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r2, _080B6C00 @ =gSprites
	adds r4, r0, r2
	movs r0, 0x3C
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r5, r0, r2
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080B6BF8
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	ldr r0, _080B6C04 @ =0x0000fffc
	strh r0, [r4, 0x26]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r3, 0x30]
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	movs r1, 0x3
	bl __modsi3
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_80B6C48
_080B6BF8:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B6C00: .4byte gSprites
_080B6C04: .4byte 0x0000fffc
	thumb_func_end sub_80B6B9C

	thumb_func_start sub_80B6C08
sub_80B6C08: @ 80B6C08
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B6C44 @ =gSprites
	adds r2, r0, r1
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldrh r0, [r2, 0x26]
	adds r0, 0x1
	strh r0, [r2, 0x26]
	lsls r0, 16
	cmp r0, 0
	blt _080B6C3C
	movs r0, 0
	strh r0, [r2, 0x26]
	movs r0, 0x1
	strh r0, [r4, 0x2E]
_080B6C3C:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B6C44: .4byte gSprites
	thumb_func_end sub_80B6C08

	thumb_func_start sub_80B6C48
sub_80B6C48: @ 80B6C48
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	adds r6, r1, 0
	mov r8, r2
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _080B6CA0 @ =gUnknown_083CE2C4
	lsls r4, r5, 1
	adds r0, r4, r0
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, 4
	mov r1, r8
	ldrb r2, [r1, 0x5]
	movs r1, 0xF
	ands r1, r2
	orrs r1, r0
	mov r0, r8
	strb r1, [r0, 0x5]
	ldr r0, _080B6CA4 @ =gUnknown_083CE2CA
	adds r4, r0
	ldrh r0, [r4]
	bl GetSpriteTileStartByTag
	adds r1, r6, 0
	adds r1, 0x40
	strh r0, [r1]
	adds r6, 0x42
	movs r1, 0x3F
	ands r1, r5
	ldrb r2, [r6]
	movs r0, 0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B6CA0: .4byte gUnknown_083CE2C4
_080B6CA4: .4byte gUnknown_083CE2CA
	thumb_func_end sub_80B6C48

	thumb_func_start sub_80B6CA8
sub_80B6CA8: @ 80B6CA8
	push {r4,r5,lr}
	ldr r0, _080B6CF4 @ =gSpriteTemplate_83CE610
	movs r1, 0xCC
	movs r2, 0x6C
	movs r3, 0
	bl CreateSprite
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080B6CF8 @ =gSprites
	adds r0, r4
	ldr r5, _080B6CFC @ =gSubspriteTables_83CE578
	adds r1, r5, 0
	bl SetSubspriteTables
	ldr r0, _080B6D00 @ =gSpriteTemplate_83CE628
	movs r1, 0xCC
	movs r2, 0x84
	movs r3, 0
	bl CreateSprite
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r1, r5, 0
	bl SetSubspriteTables
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6CF4: .4byte gSpriteTemplate_83CE610
_080B6CF8: .4byte gSprites
_080B6CFC: .4byte gSubspriteTables_83CE578
_080B6D00: .4byte gSpriteTemplate_83CE628
	thumb_func_end sub_80B6CA8

	thumb_func_start sub_80B6D04
sub_80B6D04: @ 80B6D04
	push {r4-r6,lr}
	ldr r4, _080B6D8C @ =0x02000000
	ldrh r1, [r4, 0x2]
	subs r1, 0x1
	lsls r1, 3
	adds r1, 0x4
	ldr r0, _080B6D90 @ =gSpriteTemplate_83CE658
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x28
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r3, _080B6D94 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldrh r0, [r4, 0x2]
	lsls r0, 3
	adds r0, 0x4
	lsls r0, 16
	lsrs r1, r0, 16
	movs r5, 0
	ldr r0, [r4, 0x34]
	ldrb r0, [r0, 0x1]
	cmp r5, r0
	bcs _080B6D86
	adds r6, r3, 0
_080B6D4A:
	lsls r4, r1, 16
	asrs r4, 16
	ldr r0, _080B6D98 @ =gSpriteTemplate_83CE670
	adds r1, r4, 0
	movs r2, 0x2C
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	strh r5, [r0, 0x2E]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x8
	lsls r4, 16
	lsrs r1, r4, 16
	ldr r0, _080B6D8C @ =0x02000000
	ldr r0, [r0, 0x34]
	ldrb r0, [r0, 0x1]
	cmp r5, r0
	bcc _080B6D4A
_080B6D86:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B6D8C: .4byte 0x02000000
_080B6D90: .4byte gSpriteTemplate_83CE658
_080B6D94: .4byte gSprites
_080B6D98: .4byte gSpriteTemplate_83CE670
	thumb_func_end sub_80B6D04

	thumb_func_start sub_80B6D9C
sub_80B6D9C: @ 80B6D9C
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _080B6DE4 @ =gUnknown_083CE2D0
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080B6DC0
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _080B6DCE
_080B6DC0:
	movs r0, 0x8
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	strh r0, [r4, 0x30]
_080B6DCE:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x24]
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B6DE4: .4byte gUnknown_083CE2D0
	thumb_func_end sub_80B6D9C

	thumb_func_start sub_80B6DE8
sub_80B6DE8: @ 80B6DE8
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _080B6E10 @ =gUnknown_083CE2D8
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	bl sub_80B6F44
	lsls r0, 24
	ldrh r1, [r4, 0x2E]
	lsls r1, 24
	cmp r0, r1
	beq _080B6E14
	movs r0, 0
	strh r0, [r4, 0x26]
	strh r0, [r4, 0x30]
	b _080B6E3A
	.align 2, 0
_080B6E10: .4byte gUnknown_083CE2D8
_080B6E14:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080B6E3C
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	strh r0, [r4, 0x30]
	movs r0, 0
_080B6E3A:
	strh r0, [r4, 0x32]
_080B6E3C:
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B6DE8

	thumb_func_start sub_80B6E44
sub_80B6E44: @ 80B6E44
	push {lr}
	ldr r1, _080B6E5C @ =gUnknown_083CE2E0
	ldr r0, _080B6E60 @ =0x02000000
	ldr r0, [r0, 0x34]
	ldrb r0, [r0, 0x2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	bx r0
	.align 2, 0
_080B6E5C: .4byte gUnknown_083CE2E0
_080B6E60: .4byte 0x02000000
	thumb_func_end sub_80B6E44

	thumb_func_start nullsub_40
nullsub_40: @ 80B6E64
	bx lr
	thumb_func_end nullsub_40

	thumb_func_start sub_80B6E68
sub_80B6E68: @ 80B6E68
	push {lr}
	sub sp, 0x4
	ldr r0, _080B6EB0 @ =0x02000000
	ldrh r1, [r0, 0x3E]
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_805983C
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B6EB4 @ =SpriteCallbackDummy
	movs r2, 0
	str r2, [sp]
	movs r2, 0x38
	movs r3, 0x18
	bl AddPseudoFieldObject
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080B6EB8 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	movs r1, 0x4
	bl StartSpriteAnim
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080B6EB0: .4byte 0x02000000
_080B6EB4: .4byte SpriteCallbackDummy
_080B6EB8: .4byte gSprites
	thumb_func_end sub_80B6E68

	thumb_func_start sub_80B6EBC
sub_80B6EBC: @ 80B6EBC
	push {r4,lr}
	ldr r0, _080B6EF0 @ =gSpriteTemplate_83CE688
	movs r1, 0x34
	movs r2, 0x18
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _080B6EF4 @ =gSprites
	adds r4, r0
	ldr r1, _080B6EF8 @ =gSubspriteTables_83CE580
	adds r0, r4, 0
	bl SetSubspriteTables
	ldrb r0, [r4, 0x5]
	movs r1, 0xC
	orrs r0, r1
	strb r0, [r4, 0x5]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B6EF0: .4byte gSpriteTemplate_83CE688
_080B6EF4: .4byte gSprites
_080B6EF8: .4byte gSubspriteTables_83CE580
	thumb_func_end sub_80B6EBC

	thumb_func_start sub_80B6EFC
sub_80B6EFC: @ 80B6EFC
	push {lr}
	sub sp, 0x8
	bl sub_809D51C
	ldr r3, _080B6F38 @ =0x02000000
	ldrh r0, [r3, 0x3E]
	ldr r1, _080B6F3C @ =SpriteCallbackDummy
	movs r2, 0
	str r2, [sp]
	ldr r2, [r3, 0x44]
	str r2, [sp, 0x4]
	movs r2, 0x34
	movs r3, 0x18
	bl CreateMonIcon
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B6F40 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x5]
	movs r2, 0xC
	orrs r0, r2
	strb r0, [r1, 0x5]
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_080B6F38: .4byte 0x02000000
_080B6F3C: .4byte SpriteCallbackDummy
_080B6F40: .4byte gSprites
	thumb_func_end sub_80B6EFC

	thumb_func_start sub_80B6F44
sub_80B6F44: @ 80B6F44
	push {r4,lr}
	movs r2, 0
	ldr r1, _080B6F64 @ =0x02000000
	ldr r0, [r1, 0x34]
	ldrb r0, [r0, 0x1]
	adds r4, r1, 0
	cmp r2, r0
	bcs _080B6F72
	adds r1, 0x11
	adds r3, r0, 0
_080B6F58:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080B6F68
	adds r0, r2, 0
	b _080B6F7C
	.align 2, 0
_080B6F64: .4byte 0x02000000
_080B6F68:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r3
	bcc _080B6F58
_080B6F72:
	ldr r0, [r4, 0x34]
	ldrb r0, [r0, 0x1]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
_080B6F7C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80B6F44

	thumb_func_start sub_80B6F84
sub_80B6F84: @ 80B6F84
	push {lr}
	ldr r2, _080B6FA8 @ =0x02000000
	ldr r0, [r2, 0x34]
	ldrb r0, [r0, 0x1]
	subs r0, 0x1
	lsls r1, r0, 24
	cmp r1, 0
	ble _080B6FB4
	adds r3, r2, 0
	adds r3, 0x11
_080B6F98:
	asrs r2, r1, 24
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _080B6FAC
	lsrs r0, r1, 24
	b _080B6FB6
	.align 2, 0
_080B6FA8: .4byte 0x02000000
_080B6FAC:
	subs r0, r2, 0x1
	lsls r1, r0, 24
	cmp r1, 0
	bgt _080B6F98
_080B6FB4:
	movs r0, 0
_080B6FB6:
	pop {r1}
	bx r1
	thumb_func_end sub_80B6F84

	thumb_func_start sub_80B6FBC
sub_80B6FBC: @ 80B6FBC
	push {r4,lr}
	bl sub_80B6F84
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080B7000 @ =0x02000000
	adds r0, 0x11
	adds r4, r0
	movs r0, 0
	strb r0, [r4]
	bl sub_80B7960
	movs r0, 0xFF
	strb r0, [r4]
	bl sub_80B6958
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080B6FEA
	cmp r0, 0x2
	bne _080B6FF4
_080B6FEA:
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x1
	bl sub_80B6460
_080B6FF4:
	movs r0, 0x17
	bl PlaySE
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7000: .4byte 0x02000000
	thumb_func_end sub_80B6FBC

	thumb_func_start sub_80B7004
sub_80B7004: @ 80B7004
	push {r4,r5,lr}
	sub sp, 0x4
	mov r5, sp
	adds r5, 0x2
	mov r0, sp
	adds r1, r5, 0
	bl get_cursor_pos
	mov r4, sp
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	bl sub_80B67EC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl sub_80B7768
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	movs r4, 0x1
	cmp r0, 0xFF
	bne _080B7046
	bl sub_80B7104
	b _080B704E
_080B7046:
	cmp r0, 0xFE
	bne _080B7054
	bl sub_80B713C
_080B704E:
	lsls r0, 24
	lsrs r4, r0, 24
	b _080B705A
_080B7054:
	adds r0, r1, 0
	bl sub_80B7174
_080B705A:
	bl sub_80B7960
	movs r0, 0x5
	bl PlaySE
	cmp r4, 0
	beq _080B7084
	bl sub_80B6F84
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B7080 @ =0x02000000
	ldr r1, [r1, 0x34]
	ldrb r1, [r1, 0x1]
	subs r1, 0x1
	cmp r0, r1
	bne _080B7084
	movs r0, 0x1
	b _080B7086
	.align 2, 0
_080B7080: .4byte 0x02000000
_080B7084:
	movs r0, 0
_080B7086:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80B7004

	thumb_func_start sub_80B7090
sub_80B7090: @ 80B7090
	push {r4-r7,lr}
	bl sub_80B6F84
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, r5, 0
	ldr r0, _080B70C8 @ =0x02000000
	adds r0, 0x11
	adds r0, r5, r0
	ldrb r4, [r0]
	adds r6, r4, 0
	adds r0, r4, 0
	bl sub_80B7198
	lsls r0, 24
	cmp r0, 0
	beq _080B70D6
	adds r0, r4, 0
	bl sub_80B7264
	lsls r0, 24
	cmp r0, 0
	beq _080B70CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80B7370
	b _080B70F4
	.align 2, 0
_080B70C8: .4byte 0x02000000
_080B70CC:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80B73CC
	b _080B70F4
_080B70D6:
	adds r0, r4, 0
	bl sub_80B71E4
	lsls r0, 24
	cmp r0, 0
	beq _080B70EC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80B7474
	b _080B70F4
_080B70EC:
	adds r0, r6, 0
	adds r1, r7, 0
	bl sub_80B72A4
_080B70F4:
	bl sub_80B7960
	movs r0, 0x5
	bl PlaySE
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B7090

	thumb_func_start sub_80B7104
sub_80B7104: @ 80B7104
	push {r4,r5,lr}
	bl sub_80B6F84
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080B7128 @ =0x02000000
	adds r0, 0x11
	adds r0, r5, r0
	ldrb r4, [r0]
	adds r0, r4, 0
	bl sub_80B720C
	lsls r0, 24
	cmp r0, 0
	bne _080B712C
	movs r0, 0
	b _080B7136
	.align 2, 0
_080B7128: .4byte 0x02000000
_080B712C:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80B72A4
	movs r0, 0x1
_080B7136:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80B7104

	thumb_func_start sub_80B713C
sub_80B713C: @ 80B713C
	push {r4,r5,lr}
	bl sub_80B6F84
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080B7160 @ =0x02000000
	adds r0, 0x11
	adds r0, r5, r0
	ldrb r4, [r0]
	adds r0, r4, 0
	bl sub_80B7264
	lsls r0, 24
	cmp r0, 0
	bne _080B7164
	movs r0, 0
	b _080B716E
	.align 2, 0
_080B7160: .4byte 0x02000000
_080B7164:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80B7370
	movs r0, 0x1
_080B716E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80B713C

	thumb_func_start sub_80B7174
sub_80B7174: @ 80B7174
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80B6F44
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B7194 @ =0x02000000
	adds r1, 0x11
	adds r0, r1
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7194: .4byte 0x02000000
	thumb_func_end sub_80B7174

	thumb_func_start sub_80B7198
sub_80B7198: @ 80B7198
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xC9
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x13
	bls _080B71DA
	adds r0, r1, 0
	adds r0, 0x79
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B71DA
	adds r0, r1, 0
	adds r0, 0x74
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B71DA
	adds r0, r1, 0
	adds r0, 0x6F
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B71DA
	adds r0, r1, 0
	adds r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B71DE
_080B71DA:
	movs r0, 0x1
	b _080B71E0
_080B71DE:
	movs r0, 0
_080B71E0:
	pop {r1}
	bx r1
	thumb_func_end sub_80B7198

	thumb_func_start sub_80B71E4
sub_80B71E4: @ 80B71E4
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xB5
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B7202
	adds r0, r1, 0
	adds r0, 0x65
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B7206
_080B7202:
	movs r0, 0x1
	b _080B7208
_080B7206:
	movs r0, 0
_080B7208:
	pop {r1}
	bx r1
	thumb_func_end sub_80B71E4

	thumb_func_start sub_80B720C
sub_80B720C: @ 80B720C
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xFA
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0xE
	bls _080B725A
	adds r0, r1, 0
	subs r0, 0x1A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B725A
	adds r0, r1, 0
	subs r0, 0x4B
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B725A
	adds r0, r1, 0
	subs r0, 0x56
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE
	bls _080B725A
	adds r0, r1, 0
	subs r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B725A
	adds r0, r1, 0
	adds r0, 0x65
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B725E
_080B725A:
	movs r0, 0x1
	b _080B7260
_080B725E:
	movs r0, 0
_080B7260:
	pop {r1}
	bx r1
	thumb_func_end sub_80B720C

	thumb_func_start sub_80B7264
sub_80B7264: @ 80B7264
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xE6
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B729A
	adds r0, r1, 0
	subs r0, 0x46
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B729A
	adds r0, r1, 0
	subs r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B729A
	adds r0, r1, 0
	adds r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B729E
_080B729A:
	movs r0, 0x1
	b _080B72A0
_080B729E:
	movs r0, 0
_080B72A0:
	pop {r1}
	bx r1
	thumb_func_end sub_80B7264

	thumb_func_start sub_80B72A4
sub_80B72A4: @ 80B72A4
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsrs r2, r0, 24
	movs r3, 0xFA
	lsls r3, 24
	adds r0, r3
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B72C0
	adds r0, r2, 0
	adds r0, 0x31
	b _080B735A
_080B72C0:
	adds r0, r2, 0
	subs r0, 0xB
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B72D2
	adds r0, r2, 0
	adds r0, 0x31
	b _080B735A
_080B72D2:
	adds r0, r2, 0
	subs r0, 0x10
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B72E4
	adds r0, r2, 0
	adds r0, 0x31
	b _080B735A
_080B72E4:
	adds r0, r2, 0
	subs r0, 0x1A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B72F6
	adds r0, r2, 0
	adds r0, 0x2C
	b _080B735A
_080B72F6:
	adds r0, r2, 0
	subs r0, 0x4B
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B7356
	adds r0, r2, 0
	subs r0, 0x56
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B7314
	adds r0, r2, 0
	adds r0, 0x31
	b _080B735A
_080B7314:
	adds r0, r2, 0
	subs r0, 0x5B
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B7326
	adds r0, r2, 0
	adds r0, 0x31
	b _080B735A
_080B7326:
	adds r0, r2, 0
	subs r0, 0x60
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B7338
	adds r0, r2, 0
	adds r0, 0x31
	b _080B735A
_080B7338:
	adds r0, r2, 0
	subs r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B734A
	adds r0, r2, 0
	adds r0, 0x2C
	b _080B735A
_080B734A:
	adds r0, r2, 0
	adds r0, 0x65
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B735E
_080B7356:
	adds r0, r2, 0
	adds r0, 0xFB
_080B735A:
	lsls r0, 24
	lsrs r2, r0, 24
_080B735E:
	ldr r0, _080B736C @ =0x02000000
	adds r0, 0x11
	adds r0, r1, r0
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080B736C: .4byte 0x02000000
	thumb_func_end sub_80B72A4

	thumb_func_start sub_80B7370
sub_80B7370: @ 80B7370
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsrs r2, r0, 24
	movs r3, 0xE6
	lsls r3, 24
	adds r0, r3
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B738C
	adds r0, r2, 0
	adds r0, 0x31
	b _080B73B8
_080B738C:
	adds r0, r2, 0
	subs r0, 0x46
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B73B6
	adds r0, r2, 0
	subs r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B73AA
	adds r0, r2, 0
	adds r0, 0x31
	b _080B73B8
_080B73AA:
	adds r0, r2, 0
	adds r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B73BC
_080B73B6:
	adds r0, r2, 0x5
_080B73B8:
	lsls r0, 24
	lsrs r2, r0, 24
_080B73BC:
	ldr r0, _080B73C8 @ =0x02000000
	adds r0, 0x11
	adds r0, r1, r0
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080B73C8: .4byte 0x02000000
	thumb_func_end sub_80B7370

	thumb_func_start sub_80B73CC
sub_80B73CC: @ 80B73CC
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsrs r2, r0, 24
	movs r3, 0xC9
	lsls r3, 24
	adds r0, r3
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B73E8
	adds r0, r2, 0
	adds r0, 0xCF
	b _080B745E
_080B73E8:
	adds r0, r2, 0
	subs r0, 0x3C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B73FA
	adds r0, r2, 0
	adds r0, 0xCF
	b _080B745E
_080B73FA:
	adds r0, r2, 0
	subs r0, 0x41
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B740C
	adds r0, r2, 0
	adds r0, 0xCF
	b _080B745E
_080B740C:
	adds r0, r2, 0
	subs r0, 0x46
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B745A
	adds r0, r2, 0
	adds r0, 0x79
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B742A
	adds r0, r2, 0
	adds r0, 0xCF
	b _080B745E
_080B742A:
	adds r0, r2, 0
	adds r0, 0x74
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B743C
	adds r0, r2, 0
	adds r0, 0xCF
	b _080B745E
_080B743C:
	adds r0, r2, 0
	adds r0, 0x6F
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B744E
	adds r0, r2, 0
	adds r0, 0xCF
	b _080B745E
_080B744E:
	adds r0, r2, 0
	adds r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B7462
_080B745A:
	adds r0, r2, 0
	adds r0, 0xD4
_080B745E:
	lsls r0, 24
	lsrs r2, r0, 24
_080B7462:
	ldr r0, _080B7470 @ =0x02000000
	adds r0, 0x11
	adds r0, r1, r0
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080B7470: .4byte 0x02000000
	thumb_func_end sub_80B73CC

	thumb_func_start sub_80B7474
sub_80B7474: @ 80B7474
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsrs r2, r0, 24
	movs r3, 0xB5
	lsls r3, 24
	adds r0, r3
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B7496
	adds r0, r2, 0
	adds r0, 0x65
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B749E
_080B7496:
	adds r0, r2, 0
	adds r0, 0xCF
	lsls r0, 24
	lsrs r2, r0, 24
_080B749E:
	ldr r0, _080B74AC @ =0x02000000
	adds r0, 0x11
	adds r0, r1, r0
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080B74AC: .4byte 0x02000000
	thumb_func_end sub_80B7474

	thumb_func_start sub_80B74B0
sub_80B74B0: @ 80B74B0
	push {r4,lr}
	movs r1, 0
	ldr r3, _080B74E4 @ =0x02000000
	ldr r0, [r3, 0x34]
	ldrb r0, [r0, 0x1]
	cmp r1, r0
	bcs _080B74F6
	adds r2, r3, 0
	adds r4, r3, 0
	adds r4, 0x11
_080B74C4:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _080B74E8
	cmp r0, 0xFF
	beq _080B74E8
	ldr r0, [r2, 0x38]
	ldr r1, [r2, 0x34]
	ldrb r2, [r1, 0x1]
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	adds r1, r4, 0
	bl StringCopyN
	b _080B74F6
	.align 2, 0
_080B74E4: .4byte 0x02000000
_080B74E8:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, [r3, 0x34]
	ldrb r0, [r0, 0x1]
	cmp r1, r0
	bcc _080B74C4
_080B74F6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B74B0

	thumb_func_start sub_80B74FC
sub_80B74FC: @ 80B74FC
	push {r4,lr}
	ldr r0, _080B7528 @ =gStringVar1
	ldr r1, _080B752C @ =0x02000000
	ldr r1, [r1, 0x38]
	bl StringCopy
	ldr r4, _080B7530 @ =gStringVar4
	ldr r1, _080B7534 @ =gOtherText_SentToPC
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _080B7538 @ =gWindowConfig_81E6E88
	bl BasicInitMenuWindow
	bl MenuDisplayMessageBox
	adds r0, r4, 0
	bl sub_8072044
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7528: .4byte gStringVar1
_080B752C: .4byte 0x02000000
_080B7530: .4byte gStringVar4
_080B7534: .4byte gOtherText_SentToPC
_080B7538: .4byte gWindowConfig_81E6E88
	thumb_func_end sub_80B74FC

	thumb_func_start sub_80B753C
sub_80B753C: @ 80B753C
	push {lr}
	ldr r0, _080B7550 @ =gUnknown_083CE6A0
	bl LoadSpriteSheets
	ldr r0, _080B7554 @ =gUnknown_083CE708
	bl LoadSpritePalettes
	pop {r0}
	bx r0
	.align 2, 0
_080B7550: .4byte gUnknown_083CE6A0
_080B7554: .4byte gUnknown_083CE708
	thumb_func_end sub_80B753C

	thumb_func_start sub_80B7558
sub_80B7558: @ 80B7558
	push {lr}
	bl sub_80B7568
	bl sub_80B75B0
	pop {r0}
	bx r0
	thumb_func_end sub_80B7558

	thumb_func_start sub_80B7568
sub_80B7568: @ 80B7568
	push {r4,lr}
	ldr r4, _080B759C @ =gNamingScreenMenu_Gfx
	ldr r3, _080B75A0 @ =gMenuMessageBoxContentTileOffset
	ldrh r0, [r3]
	lsls r0, 5
	movs r1, 0xC0
	lsls r1, 19
	adds r0, r1
	ldr r1, _080B75A4 @ =0x040000d4
	str r4, [r1]
	str r0, [r1, 0x4]
	ldr r2, _080B75A8 @ =0x80000400
	str r2, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldrh r0, [r3]
	lsls r0, 5
	ldr r3, _080B75AC @ =0x06008000
	adds r0, r3
	str r4, [r1]
	str r0, [r1, 0x4]
	str r2, [r1, 0x8]
	ldr r0, [r1, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B759C: .4byte gNamingScreenMenu_Gfx
_080B75A0: .4byte gMenuMessageBoxContentTileOffset
_080B75A4: .4byte 0x040000d4
_080B75A8: .4byte 0x80000400
_080B75AC: .4byte 0x06008000
	thumb_func_end sub_80B7568

	thumb_func_start sub_80B75B0
sub_80B75B0: @ 80B75B0
	push {lr}
	ldr r0, _080B75C0 @ =gNamingScreenPalettes
	movs r1, 0
	movs r2, 0x80
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_080B75C0: .4byte gNamingScreenPalettes
	thumb_func_end sub_80B75B0

	thumb_func_start sub_80B75C4
sub_80B75C4: @ 80B75C4
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r0, _080B7608 @ =gUnknown_083CE308
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r4, _080B760C @ =gUnknown_083CE2F0
	ldr r5, _080B7610 @ =0x02000000
	ldrb r1, [r5, 0xE]
	lsls r1, 3
	adds r1, r4
	ldrb r0, [r5, 0xC]
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	ldr r1, [r1]
	bl _call_via_r1
	ldrb r1, [r5, 0xE]
	lsls r1, 3
	adds r4, 0x4
	adds r1, r4
	ldrb r0, [r5, 0xD]
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	ldr r1, [r1]
	bl _call_via_r1
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7608: .4byte gUnknown_083CE308
_080B760C: .4byte gUnknown_083CE2F0
_080B7610: .4byte 0x02000000
	thumb_func_end sub_80B75C4

	thumb_func_start sub_80B7614
sub_80B7614: @ 80B7614
	push {lr}
	sub sp, 0x8
	ldr r0, _080B7644 @ =gUnknown_083CE308
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r0, _080B7648 @ =gUnknown_083CE2F0
	ldr r2, _080B764C @ =0x02000000
	ldrb r1, [r2, 0xE]
	lsls r1, 3
	adds r0, 0x4
	adds r1, r0
	ldrb r0, [r2, 0xD]
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	ldr r1, [r1]
	bl _call_via_r1
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_080B7644: .4byte gUnknown_083CE308
_080B7648: .4byte gUnknown_083CE2F0
_080B764C: .4byte 0x02000000
	thumb_func_end sub_80B7614

	thumb_func_start sub_80B7650
sub_80B7650: @ 80B7650
	push {lr}
	ldr r1, _080B765C @ =gUnknown_083CE748
	bl sub_80B7698
	pop {r0}
	bx r0
	.align 2, 0
_080B765C: .4byte gUnknown_083CE748
	thumb_func_end sub_80B7650

	thumb_func_start sub_80B7660
sub_80B7660: @ 80B7660
	push {lr}
	ldr r1, _080B766C @ =gUnknown_083CEBF8
	bl sub_80B7698
	pop {r0}
	bx r0
	.align 2, 0
_080B766C: .4byte gUnknown_083CEBF8
	thumb_func_end sub_80B7660

	thumb_func_start sub_80B7670
sub_80B7670: @ 80B7670
	push {lr}
	ldr r1, _080B767C @ =gUnknown_083CF0A8
	bl sub_80B7698
	pop {r0}
	bx r0
	.align 2, 0
_080B767C: .4byte gUnknown_083CF0A8
	thumb_func_end sub_80B7670

	thumb_func_start sub_80B7680
sub_80B7680: @ 80B7680
	push {lr}
	ldr r0, _080B7690 @ =0x0600f000
	ldr r1, _080B7694 @ =gUnknown_08E86258
	bl sub_80B76E0
	pop {r0}
	bx r0
	.align 2, 0
_080B7690: .4byte 0x0600f000
_080B7694: .4byte gUnknown_08E86258
	thumb_func_end sub_80B7680

	thumb_func_start sub_80B7698
sub_80B7698: @ 80B7698
	push {r4-r7,lr}
	mov r12, r0
	adds r3, r1, 0
	movs r4, 0
	ldr r0, _080B76DC @ =gMenuMessageBoxContentTileOffset
	ldrh r6, [r0]
_080B76A4:
	movs r1, 0
	lsls r4, 16
	asrs r5, r4, 11
_080B76AA:
	lsls r0, r1, 16
	asrs r0, 16
	adds r1, r5, r0
	lsls r1, 1
	add r1, r12
	ldrh r7, [r3]
	adds r2, r6, r7
	strh r2, [r1]
	adds r0, 0x1
	lsls r0, 16
	adds r3, 0x2
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x1D
	ble _080B76AA
	movs r1, 0x80
	lsls r1, 9
	adds r0, r4, r1
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080B76A4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B76DC: .4byte gMenuMessageBoxContentTileOffset
	thumb_func_end sub_80B7698

	thumb_func_start sub_80B76E0
sub_80B76E0: @ 80B76E0
	push {r4-r7,lr}
	mov r12, r0
	adds r3, r1, 0
	movs r4, 0
	ldr r0, _080B7728 @ =gMenuMessageBoxContentTileOffset
	ldrh r6, [r0]
_080B76EC:
	movs r1, 0
	lsls r5, r4, 16
	asrs r4, r5, 11
_080B76F2:
	lsls r0, r1, 16
	asrs r0, 16
	adds r1, r4, r0
	lsls r1, 1
	add r1, r12
	ldrh r7, [r3]
	adds r2, r6, r7
	strh r2, [r1]
	adds r0, 0x1
	lsls r0, 16
	adds r3, 0x2
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x1D
	ble _080B76F2
	adds r3, 0x4
	movs r1, 0x80
	lsls r1, 9
	adds r0, r5, r1
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080B76EC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B7728: .4byte gMenuMessageBoxContentTileOffset
	thumb_func_end sub_80B76E0

	thumb_func_start sub_80B772C
sub_80B772C: @ 80B772C
	push {lr}
	ldr r1, _080B773C @ =0x02000000
	ldrb r0, [r1, 0xE]
	ldrb r1, [r1, 0xC]
	bl nullsub_20
	pop {r0}
	bx r0
	.align 2, 0
_080B773C: .4byte 0x02000000
	thumb_func_end sub_80B772C

	thumb_func_start sub_80B7740
sub_80B7740: @ 80B7740
	push {r4,lr}
	ldr r4, _080B7760 @ =0x02000000
	ldrb r0, [r4, 0xE]
	adds r0, 0x1
	movs r1, 0x3
	bl __modsi3
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r4, 0xD]
	bl nullsub_20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7760: .4byte 0x02000000
	thumb_func_end sub_80B7740

	thumb_func_start nullsub_20
nullsub_20: @ 80B7764
	bx lr
	thumb_func_end nullsub_20

	thumb_func_start sub_80B7768
sub_80B7768: @ 80B7768
	ldr r3, _080B778C @ =gUnknown_083CE3A8
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	lsls r2, r1, 2
	adds r2, r1
	lsls r2, 2
	adds r0, r2
	ldr r1, _080B7790 @ =0x02000000
	ldrb r2, [r1, 0xE]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	adds r0, r1
	adds r0, r3
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080B778C: .4byte gUnknown_083CE3A8
_080B7790: .4byte 0x02000000
	thumb_func_end sub_80B7768

	thumb_func_start sub_80B7794
sub_80B7794: @ 80B7794
	push {r4-r6,lr}
	ldr r6, _080B77EC @ =gUnknown_083CE328
	ldr r4, _080B77F0 @ =0x02000000
	ldrb r0, [r4, 0xC]
	lsls r0, 2
	ldrb r1, [r4, 0xE]
	lsls r1, 4
	adds r0, r1
	adds r0, r6
	ldr r0, [r0]
	bl BasicInitMenuWindow
	ldr r5, _080B77F4 @ =gUnknown_083CE310
	ldrb r0, [r4, 0xE]
	lsls r0, 3
	adds r0, r5
	ldr r0, [r0]
	bl _call_via_r0
	ldrb r1, [r4, 0xD]
	lsls r1, 2
	ldrb r0, [r4, 0xE]
	lsls r0, 4
	adds r1, r0
	adds r6, 0x8
	adds r1, r6
	ldr r0, [r1]
	bl BasicInitMenuWindow
	ldrb r0, [r4, 0xE]
	lsls r0, 3
	adds r5, 0x4
	adds r0, r5
	ldr r0, [r0]
	bl _call_via_r0
	bl sub_80B772C
	bl sub_80B7740
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B77EC: .4byte gUnknown_083CE328
_080B77F0: .4byte 0x02000000
_080B77F4: .4byte gUnknown_083CE310
	thumb_func_end sub_80B7794

	thumb_func_start sub_80B77F8
sub_80B77F8: @ 80B77F8
	push {r4,lr}
	ldr r2, _080B782C @ =gUnknown_083CE328
	ldr r4, _080B7830 @ =0x02000000
	ldrb r1, [r4, 0xD]
	lsls r1, 2
	ldrb r0, [r4, 0xE]
	lsls r0, 4
	adds r1, r0
	adds r2, 0x8
	adds r1, r2
	ldr r0, [r1]
	bl BasicInitMenuWindow
	ldr r1, _080B7834 @ =gUnknown_083CE310
	ldrb r0, [r4, 0xE]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	bl sub_80B7740
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B782C: .4byte gUnknown_083CE328
_080B7830: .4byte 0x02000000
_080B7834: .4byte gUnknown_083CE310
	thumb_func_end sub_80B77F8

	thumb_func_start sub_80B7838
sub_80B7838: @ 80B7838
	push {lr}
	movs r0, 0x1
	bl sub_80B785C
	pop {r0}
	bx r0
	thumb_func_end sub_80B7838

	thumb_func_start sub_80B7844
sub_80B7844: @ 80B7844
	push {lr}
	movs r0, 0
	bl sub_80B785C
	pop {r0}
	bx r0
	thumb_func_end sub_80B7844

	thumb_func_start sub_80B7850
sub_80B7850: @ 80B7850
	push {lr}
	movs r0, 0x2
	bl sub_80B785C
	pop {r0}
	bx r0
	thumb_func_end sub_80B7850

	thumb_func_start sub_80B785C
sub_80B785C: @ 80B785C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	movs r5, 0x9
	lsls r1, r0, 2
	adds r1, r0
	lsls r6, r1, 4
_080B786C:
	lsls r4, r2, 16
	asrs r4, 16
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 2
	ldr r1, _080B78A4 @ =gUnknown_083CE3A8
	adds r0, r1
	adds r0, r6, r0
	lsls r2, r5, 24
	lsrs r2, 24
	movs r1, 0x3
	bl MenuPrint
	adds r4, 0x1
	lsls r4, 16
	lsls r0, r5, 16
	movs r1, 0x80
	lsls r1, 10
	adds r0, r1
	lsrs r5, r0, 16
	lsrs r2, r4, 16
	asrs r4, 16
	cmp r4, 0x3
	ble _080B786C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B78A4: .4byte gUnknown_083CE3A8
	thumb_func_end sub_80B785C

	thumb_func_start sub_80B78A8
sub_80B78A8: @ 80B78A8
	push {r4,lr}
	ldr r0, _080B78E4 @ =gWindowConfig_81E6F4C
	bl BasicInitMenuWindow
	ldr r1, _080B78E8 @ =gUnknown_083CE358
	ldr r4, _080B78EC @ =0x02000000
	ldrb r0, [r4, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldr r1, _080B78F0 @ =gUnknown_083CE368
	ldr r0, [r4, 0x34]
	ldrb r0, [r0, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, [r4, 0x34]
	ldr r0, [r0, 0x8]
	movs r1, 0x9
	movs r2, 0x2
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B78E4: .4byte gWindowConfig_81E6F4C
_080B78E8: .4byte gUnknown_083CE358
_080B78EC: .4byte 0x02000000
_080B78F0: .4byte gUnknown_083CE368
	thumb_func_end sub_80B78A8

	thumb_func_start nullsub_61
nullsub_61: @ 80B78F4
	bx lr
	thumb_func_end nullsub_61

	thumb_func_start sub_80B78F8
sub_80B78F8: @ 80B78F8
	push {lr}
	ldr r0, _080B7914 @ =gStringVar1
	ldr r1, _080B7918 @ =0x02000000
	movs r3, 0x3E
	ldrsh r2, [r1, r3]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080B791C @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	pop {r0}
	bx r0
	.align 2, 0
_080B7914: .4byte gStringVar1
_080B7918: .4byte 0x02000000
_080B791C: .4byte gSpeciesNames
	thumb_func_end sub_80B78F8

	thumb_func_start nullsub_62
nullsub_62: @ 80B7920
	bx lr
	thumb_func_end nullsub_62

	thumb_func_start sub_80B7924
sub_80B7924: @ 80B7924
	push {lr}
	sub sp, 0x4
	ldr r1, _080B7958 @ =gUnknown_083CE370
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	ldr r0, _080B795C @ =0x02000000
	adds r0, 0x40
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0xFF
	beq _080B7952
	cmp r0, 0xFE
	bne _080B7948
	mov r1, sp
	movs r0, 0xB6
	strb r0, [r1]
_080B7948:
	mov r0, sp
	movs r1, 0x14
	movs r2, 0x4
	bl MenuPrint
_080B7952:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080B7958: .4byte gUnknown_083CE370
_080B795C: .4byte 0x02000000
	thumb_func_end sub_80B7924

	thumb_func_start sub_80B7960
sub_80B7960: @ 80B7960
	push {r4,lr}
	ldr r0, _080B799C @ =gStringVar1
	movs r2, 0xFC
	strb r2, [r0]
	movs r1, 0x14
	strb r1, [r0, 0x1]
	movs r1, 0x8
	strb r1, [r0, 0x2]
	strb r2, [r0, 0x3]
	movs r1, 0x11
	strb r1, [r0, 0x4]
	movs r1, 0x1
	strb r1, [r0, 0x5]
	adds r0, 0x6
	ldr r4, _080B79A0 @ =0x02000011
	adds r1, r4, 0
	bl StringCopy
	ldr r0, _080B79A4 @ =gWindowConfig_81E6F4C
	bl BasicInitMenuWindow
	ldr r0, _080B799C @ =gStringVar1
	subs r4, 0x11
	ldrb r1, [r4, 0x2]
	movs r2, 0x4
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B799C: .4byte gStringVar1
_080B79A0: .4byte 0x02000011
_080B79A4: .4byte gWindowConfig_81E6F4C
	thumb_func_end sub_80B7960

	.align 2, 0 @ Don't pad with nop.
