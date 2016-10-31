	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80C5CD4
sub_80C5CD4: @ 80C5CD4
	push {r4-r7,lr}
	sub sp, 0x28
	adds r7, r0, 0
	ldr r0, _080C5D64 @ =gUnknown_083D1898
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	ldr r0, _080C5D68 @ =gUnknown_083D18A0
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x20]
	str r1, [sp, 0x24]
	mov r1, sp
	ldr r0, _080C5D6C @ =gSpriteTemplate_83D18A8
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldrh r3, [r7]
	lsls r2, r3, 16
	add r0, sp, 0x18
	ldrh r1, [r0, 0x4]
	orrs r1, r2
	str r1, [r0, 0x4]
	mov r1, sp
	movs r6, 0
	strh r3, [r1]
	ldrh r2, [r7, 0x2]
	ldr r5, _080C5D70 @ =0xffff0000
	add r4, sp, 0x20
	ldr r1, [r4, 0x4]
	ands r1, r5
	orrs r1, r2
	str r1, [r4, 0x4]
	mov r1, sp
	strh r2, [r1, 0x2]
	bl LoadSpriteSheet
	adds r0, r4, 0
	bl LoadSpritePalette
	movs r0, 0x1
	strh r0, [r7, 0xC]
	strh r6, [r7, 0xA]
	strh r6, [r7, 0x8]
	ldrh r0, [r7, 0x2]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x80
	lsls r1, 9
	lsls r1, r0
	bics r5, r1
	str r5, [r7, 0x10]
	ldrh r0, [r7, 0x4]
	cmp r0, 0
	bne _080C5D4E
	movs r0, 0x10
	strh r0, [r7, 0x4]
_080C5D4E:
	ldrh r0, [r7, 0x6]
	cmp r0, 0
	bne _080C5D58
	movs r0, 0x14
	strh r0, [r7, 0x6]
_080C5D58:
	ldr r0, _080C5D74 @ =gUnknown_020387EC
	str r7, [r0]
	movs r4, 0
	ldr r5, _080C5D78 @ =gSprites
	b _080C5D94
	.align 2, 0
_080C5D64: .4byte gUnknown_083D1898
_080C5D68: .4byte gUnknown_083D18A0
_080C5D6C: .4byte gSpriteTemplate_83D18A8
_080C5D70: .4byte 0xffff0000
_080C5D74: .4byte gUnknown_020387EC
_080C5D78: .4byte gSprites
_080C5D7C:
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r7, 0x4]
	cmp r4, 0x3
	bhi _080C5D8C
	negs r1, r1
_080C5D8C:
	strh r1, [r0, 0x2E]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_080C5D94:
	cmp r4, 0x7
	bhi _080C5DB2
	lsls r1, r4, 5
	adds r1, 0x8
	lsls r1, 16
	asrs r1, 16
	mov r0, sp
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	bne _080C5D7C
_080C5DB2:
	ldr r1, _080C5DC8 @ =REG_BLDCNT
	movs r0, 0xBF
	strh r0, [r1]
	adds r1, 0x4
	movs r0, 0x10
	strh r0, [r1]
	add sp, 0x28
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C5DC8: .4byte REG_BLDCNT
	thumb_func_end sub_80C5CD4

	thumb_func_start sub_80C5DCC
sub_80C5DCC: @ 80C5DCC
	push {r4,lr}
	ldr r4, _080C5E10 @ =gUnknown_020387EC
	ldr r1, [r4]
	ldrh r0, [r1, 0x8]
	cmp r0, 0
	bne _080C5DF0
	ldr r0, [r1, 0x10]
	ldr r2, _080C5E14 @ =0x0000ffff
	movs r1, 0x10
	bl BlendPalettes
	ldr r0, _080C5E18 @ =sub_80C603C
	bl sub_80C61B0
	ldr r1, [r4]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_080C5DF0:
	ldr r1, [r4]
	ldrh r0, [r1, 0xA]
	cmp r0, 0x7
	bls _080C5E0A
	ldrh r0, [r1, 0x6]
	ldrh r2, [r1, 0xC]
	adds r0, r2
	movs r2, 0
	strh r0, [r1, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4F
	bgt _080C5E1C
_080C5E0A:
	movs r0, 0
	b _080C5E2E
	.align 2, 0
_080C5E10: .4byte gUnknown_020387EC
_080C5E14: .4byte 0x0000ffff
_080C5E18: .4byte sub_80C603C
_080C5E1C:
	movs r0, 0x50
	strh r0, [r1, 0xC]
	ldr r0, _080C5E34 @ =REG_BLDCNT
	strh r2, [r0]
	adds r0, 0x4
	strh r2, [r0]
	bl ClearGpuRegBits
	movs r0, 0x1
_080C5E2E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C5E34: .4byte REG_BLDCNT
	thumb_func_end sub_80C5DCC

	thumb_func_start sub_80C5E38
sub_80C5E38: @ 80C5E38
	push {r4-r7,lr}
	sub sp, 0x28
	adds r7, r0, 0
	ldr r0, _080C5EC8 @ =gUnknown_083D1898
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	ldr r0, _080C5ECC @ =gUnknown_083D18A0
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x20]
	str r1, [sp, 0x24]
	mov r1, sp
	ldr r0, _080C5ED0 @ =gSpriteTemplate_83D18C0
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldrh r3, [r7]
	lsls r2, r3, 16
	add r0, sp, 0x18
	ldrh r1, [r0, 0x4]
	orrs r1, r2
	str r1, [r0, 0x4]
	mov r1, sp
	movs r6, 0
	strh r3, [r1]
	ldrh r2, [r7, 0x2]
	ldr r5, _080C5ED4 @ =0xffff0000
	add r4, sp, 0x20
	ldr r1, [r4, 0x4]
	ands r1, r5
	orrs r1, r2
	str r1, [r4, 0x4]
	mov r1, sp
	strh r2, [r1, 0x2]
	bl LoadSpriteSheet
	adds r0, r4, 0
	bl LoadSpritePalette
	movs r0, 0x50
	strh r0, [r7, 0xC]
	strh r6, [r7, 0x8]
	strh r6, [r7, 0xA]
	ldrh r0, [r7, 0x2]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x80
	lsls r1, 9
	lsls r1, r0
	bics r5, r1
	str r5, [r7, 0x10]
	ldrh r0, [r7, 0x4]
	cmp r0, 0
	bne _080C5EB2
	movs r0, 0x10
	strh r0, [r7, 0x4]
_080C5EB2:
	ldrh r0, [r7, 0x6]
	cmp r0, 0
	bne _080C5EBC
	movs r0, 0x14
	strh r0, [r7, 0x6]
_080C5EBC:
	ldr r0, _080C5ED8 @ =gUnknown_020387EC
	str r7, [r0]
	movs r5, 0
	ldr r6, _080C5EDC @ =gSprites
	b _080C5F4A
	.align 2, 0
_080C5EC8: .4byte gUnknown_083D1898
_080C5ECC: .4byte gUnknown_083D18A0
_080C5ED0: .4byte gSpriteTemplate_83D18C0
_080C5ED4: .4byte 0xffff0000
_080C5ED8: .4byte gUnknown_020387EC
_080C5EDC: .4byte gSprites
_080C5EE0:
	lsls r2, r3, 4
	adds r1, r2, r3
	lsls r1, 2
	adds r1, r6
	ldrh r0, [r7, 0x4]
	strh r0, [r1, 0x2E]
	movs r0, 0x1
	strh r0, [r1, 0x30]
	ldr r1, _080C5EF4 @ =gSprites
	b _080C5F2A
	.align 2, 0
_080C5EF4: .4byte gSprites
_080C5EF8:
	lsls r1, r5, 21
	movs r0, 0x80
	lsls r0, 16
	adds r1, r0
	asrs r1, 16
	mov r0, sp
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	beq _080C5F6E
	lsls r2, r3, 4
	adds r1, r2, r3
	lsls r1, 2
	adds r1, r6
	ldrh r0, [r7, 0x4]
	negs r0, r0
	strh r0, [r1, 0x2E]
	ldr r0, _080C5F88 @ =0x0000ffff
	strh r0, [r1, 0x30]
	ldr r1, _080C5F8C @ =gSprites
	lsls r4, r5, 5
_080C5F2A:
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0x8
	movs r2, 0
	strh r1, [r0, 0x32]
	strh r2, [r0, 0x36]
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_080C5F4A:
	cmp r5, 0x7
	bhi _080C5F6E
	cmp r5, 0x3
	bhi _080C5EF8
	lsls r4, r5, 5
	adds r1, r4, 0
	subs r1, 0x70
	lsls r1, 16
	asrs r1, 16
	mov r0, sp
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	bne _080C5EE0
_080C5F6E:
	ldr r1, _080C5F90 @ =REG_BLDCNT
	movs r0, 0xFF
	strh r0, [r1]
	adds r1, 0x4
	movs r0, 0x10
	strh r0, [r1]
	ldr r0, _080C5F94 @ =sub_80C6078
	bl sub_80C61B0
	add sp, 0x28
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C5F88: .4byte 0x0000ffff
_080C5F8C: .4byte gSprites
_080C5F90: .4byte REG_BLDCNT
_080C5F94: .4byte sub_80C6078
	thumb_func_end sub_80C5E38

	thumb_func_start sub_80C5F98
sub_80C5F98: @ 80C5F98
	push {r4,lr}
	ldr r4, _080C5FB0 @ =gUnknown_020387EC
	ldr r2, [r4]
	ldrh r0, [r2, 0x8]
	cmp r0, 0x1
	beq _080C5FEC
	cmp r0, 0x1
	bgt _080C5FB4
	cmp r0, 0
	beq _080C5FBA
	b _080C602C
	.align 2, 0
_080C5FB0: .4byte gUnknown_020387EC
_080C5FB4:
	cmp r0, 0x2
	beq _080C6008
	b _080C602C
_080C5FBA:
	ldrh r0, [r2, 0xC]
	ldrh r1, [r2, 0x6]
	subs r0, r1
	strh r0, [r2, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bgt _080C6034
	ldr r0, [r2, 0x10]
	ldr r2, _080C5FE4 @ =0x0000ffff
	movs r1, 0x10
	bl BlendPalettes
	ldr r0, _080C5FE8 @ =sub_80C603C
	bl SetHBlankCallback
	ldr r1, [r4]
	movs r0, 0x1
	strh r0, [r1, 0xC]
	b _080C6000
	.align 2, 0
_080C5FE4: .4byte 0x0000ffff
_080C5FE8: .4byte sub_80C603C
_080C5FEC:
	ldrh r0, [r2, 0xA]
	cmp r0, 0x8
	bne _080C6034
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	ldr r1, [r4]
_080C6000:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080C6034
_080C6008:
	ldr r0, _080C6030 @ =REG_BLDCNT
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	ldrh r0, [r2]
	bl FreeSpriteTilesByTag
	ldr r0, [r4]
	ldrh r0, [r0, 0x2]
	bl FreeSpritePaletteByTag
	bl ClearGpuRegBits
	ldr r1, [r4]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_080C602C:
	movs r0, 0x1
	b _080C6036
	.align 2, 0
_080C6030: .4byte REG_BLDCNT
_080C6034:
	movs r0, 0
_080C6036:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80C5F98

	thumb_func_start sub_80C603C
sub_80C603C: @ 80C603C
	push {lr}
	sub sp, 0x4
	mov r2, sp
	ldr r0, _080C6060 @ =REG_VCOUNT
	ldrh r1, [r0]
	movs r3, 0xFF
	adds r0, r3, 0
	ands r0, r1
	strh r0, [r2]
	mov r0, sp
	ldrh r0, [r0]
	cmp r0, 0x50
	bne _080C6068
	ldr r1, _080C6064 @ =REG_BLDCNT
	movs r0, 0x8F
	strh r0, [r1]
	b _080C606C
	.align 2, 0
_080C6060: .4byte REG_VCOUNT
_080C6064: .4byte REG_BLDCNT
_080C6068:
	ldr r0, _080C6074 @ =REG_BLDCNT
	strh r3, [r0]
_080C606C:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080C6074: .4byte REG_BLDCNT
	thumb_func_end sub_80C603C

	thumb_func_start sub_80C6078
sub_80C6078: @ 80C6078
	push {lr}
	sub sp, 0x4
	mov r2, sp
	ldr r0, _080C60B0 @ =REG_VCOUNT
	ldrh r1, [r0]
	movs r0, 0xFF
	ands r0, r1
	strh r0, [r2]
	mov r0, sp
	ldrh r1, [r0]
	ldr r0, _080C60B4 @ =gUnknown_020387EC
	ldr r0, [r0]
	movs r3, 0xC
	ldrsh r2, [r0, r3]
	movs r0, 0x50
	subs r0, r2
	cmp r1, r0
	ble _080C60BC
	mov r0, sp
	ldrh r1, [r0]
	adds r0, r2, 0
	adds r0, 0x50
	cmp r1, r0
	bge _080C60BC
	ldr r1, _080C60B8 @ =REG_BLDY
	movs r0, 0
	b _080C60C0
	.align 2, 0
_080C60B0: .4byte REG_VCOUNT
_080C60B4: .4byte gUnknown_020387EC
_080C60B8: .4byte REG_BLDY
_080C60BC:
	ldr r1, _080C60C8 @ =REG_BLDY
	movs r0, 0x10
_080C60C0:
	strh r0, [r1]
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080C60C8: .4byte REG_BLDY
	thumb_func_end sub_80C6078

	thumb_func_start sub_80C60CC
sub_80C60CC: @ 80C60CC
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	strh r0, [r2, 0x20]
	adds r0, 0x8
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 17
	cmp r0, r1
	bls _080C611C
	adds r0, r2, 0
	bl DestroySprite
	ldr r4, _080C6124 @ =gUnknown_020387EC
	ldr r1, [r4]
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x8
	bne _080C611C
	ldrh r0, [r1]
	bl FreeSpriteTilesByTag
	ldr r0, [r4]
	ldrh r0, [r0, 0x2]
	bl FreeSpritePaletteByTag
	ldr r0, [r4]
	ldr r0, [r0, 0x10]
	ldr r2, _080C6128 @ =0x0000ffff
	movs r1, 0
	bl BlendPalettes
	ldr r0, _080C612C @ =sub_80C6078
	bl SetHBlankCallback
_080C611C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C6124: .4byte gUnknown_020387EC
_080C6128: .4byte 0x0000ffff
_080C612C: .4byte sub_80C6078
	thumb_func_end sub_80C60CC

	thumb_func_start sub_80C6130
sub_80C6130: @ 80C6130
	push {r4,r5,lr}
	adds r2, r0, 0
	movs r1, 0x36
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _080C61AA
	ldr r1, _080C6184 @ =gUnknown_020387EC
	ldr r0, [r1]
	movs r3, 0xC
	ldrsh r4, [r0, r3]
	adds r5, r1, 0
	cmp r4, 0x1
	bne _080C61AA
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	strh r0, [r2, 0x20]
	adds r0, 0xF
	lsls r0, 16
	movs r1, 0x87
	lsls r1, 17
	cmp r0, r1
	bhi _080C616C
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
_080C616C:
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	cmp r0, 0
	ble _080C6188
	movs r0, 0x20
	ldrsh r1, [r2, r0]
	movs r3, 0x32
	ldrsh r0, [r2, r3]
	cmp r1, r0
	blt _080C6196
	b _080C6194
	.align 2, 0
_080C6184: .4byte gUnknown_020387EC
_080C6188:
	movs r0, 0x20
	ldrsh r1, [r2, r0]
	movs r3, 0x32
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bgt _080C6196
_080C6194:
	strh r4, [r2, 0x36]
_080C6196:
	movs r1, 0x36
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _080C61AA
	ldr r0, [r5]
	ldrh r1, [r0, 0xA]
	adds r1, 0x1
	strh r1, [r0, 0xA]
	ldrh r0, [r2, 0x32]
	strh r0, [r2, 0x20]
_080C61AA:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C6130

	thumb_func_start sub_80C61B0
sub_80C61B0: @ 80C61B0
	push {r4-r6,lr}
	ldr r2, _080C61F0 @ =INTR_CHECK
	ldrh r1, [r2]
	movs r5, 0x2
	orrs r1, r5
	strh r1, [r2]
	ldr r3, _080C61F4 @ =REG_DISPSTAT
	ldrh r1, [r3]
	movs r2, 0x10
	orrs r1, r2
	strh r1, [r3]
	ldr r4, _080C61F8 @ =0x04000208
	ldrh r2, [r4]
	movs r6, 0
	strh r6, [r4]
	ldr r3, _080C61FC @ =0x04000200
	ldrh r1, [r3]
	orrs r1, r5
	strh r1, [r3]
	strh r2, [r4]
	ldr r2, _080C6200 @ =gMain
	ldrh r1, [r2, 0x1C]
	orrs r1, r5
	ldrh r3, [r2, 0x1C]
	orrs r1, r6
	strh r1, [r2, 0x1C]
	bl SetHBlankCallback
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C61F0: .4byte INTR_CHECK
_080C61F4: .4byte REG_DISPSTAT
_080C61F8: .4byte 0x04000208
_080C61FC: .4byte 0x04000200
_080C6200: .4byte gMain
	thumb_func_end sub_80C61B0

	thumb_func_start ClearGpuRegBits
ClearGpuRegBits: @ 80C6204
	push {r4,r5,lr}
	ldr r3, _080C6248 @ =INTR_CHECK
	ldrh r1, [r3]
	ldr r2, _080C624C @ =0x0000fffd
	adds r0, r2, 0
	ands r0, r1
	strh r0, [r3]
	ldr r3, _080C6250 @ =REG_DISPSTAT
	ldrh r1, [r3]
	ldr r0, _080C6254 @ =0x0000ffef
	ands r0, r1
	strh r0, [r3]
	ldr r4, _080C6258 @ =0x04000208
	ldrh r3, [r4]
	movs r0, 0
	strh r0, [r4]
	ldr r5, _080C625C @ =0x04000200
	ldrh r1, [r5]
	adds r0, r2, 0
	ands r0, r1
	strh r0, [r5]
	strh r3, [r4]
	ldr r0, _080C6260 @ =gMain
	ldrh r1, [r0, 0x1C]
	ands r2, r1
	ldrh r1, [r0, 0x1C]
	strh r2, [r0, 0x1C]
	movs r0, 0
	bl SetHBlankCallback
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C6248: .4byte INTR_CHECK
_080C624C: .4byte 0x0000fffd
_080C6250: .4byte REG_DISPSTAT
_080C6254: .4byte 0x0000ffef
_080C6258: .4byte 0x04000208
_080C625C: .4byte 0x04000200
_080C6260: .4byte gMain
	thumb_func_end ClearGpuRegBits

	thumb_func_start sub_80C6264
sub_80C6264: @ 80C6264
	push {lr}
	ldr r0, _080C6278 @ =gUnknown_0203923C
	ldr r1, _080C627C @ =gMapHeader
	ldr r1, [r1, 0x4]
	bl sub_80BBFD8
	bl sub_80BB5E4
	pop {r0}
	bx r0
	.align 2, 0
_080C6278: .4byte gUnknown_0203923C
_080C627C: .4byte gMapHeader
	thumb_func_end sub_80C6264

	thumb_func_start sub_80C6280
sub_80C6280: @ 80C6280
	push {lr}
	ldr r1, _080C6294 @ =gUnknown_0202FF84
	ldr r0, [r1, 0x4]
	cmp r0, 0x2
	beq _080C62AA
	cmp r0, 0x2
	bgt _080C6298
	cmp r0, 0x1
	beq _080C62A2
	b _080C62BE
	.align 2, 0
_080C6294: .4byte gUnknown_0202FF84
_080C6298:
	cmp r0, 0x3
	beq _080C62AE
	cmp r0, 0x4
	beq _080C62B8
	b _080C62BE
_080C62A2:
	movs r0, 0x8
	str r0, [r1, 0x14]
	movs r0, 0x28
	b _080C62BC
_080C62AA:
	movs r0, 0x8
	b _080C62BA
_080C62AE:
	movs r0, 0x8
	negs r0, r0
	str r0, [r1, 0x14]
	movs r0, 0x18
	b _080C62BC
_080C62B8:
	movs r0, 0x18
_080C62BA:
	str r0, [r1, 0x14]
_080C62BC:
	str r0, [r1, 0x18]
_080C62BE:
	pop {r0}
	bx r0
	thumb_func_end sub_80C6280

	thumb_func_start SetUpFieldMove_SecretPower
SetUpFieldMove_SecretPower: @ 80C62C4
	push {r4,lr}
	bl sub_80BB63C
	ldr r0, _080C6318 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _080C636E
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080C636E
	ldr r4, _080C631C @ =gUnknown_0203923C
	adds r1, r4, 0x2
	adds r0, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80571EC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C6330
	bl sub_80C6264
	ldr r1, _080C6320 @ =gUnknown_0300485C
	ldr r0, _080C6324 @ =sub_808AB90
	str r0, [r1]
	ldr r1, _080C6328 @ =gUnknown_03005CE4
	ldr r0, _080C632C @ =sub_80C639C
	b _080C6380
	.align 2, 0
_080C6318: .4byte gScriptResult
_080C631C: .4byte gUnknown_0203923C
_080C6320: .4byte gUnknown_0300485C
_080C6324: .4byte sub_808AB90
_080C6328: .4byte gUnknown_03005CE4
_080C632C: .4byte sub_80C639C
_080C6330:
	adds r0, r4, 0
	bl sub_805720C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C6360
	bl sub_80C6264
	ldr r1, _080C6350 @ =gUnknown_0300485C
	ldr r0, _080C6354 @ =sub_808AB90
	str r0, [r1]
	ldr r1, _080C6358 @ =gUnknown_03005CE4
	ldr r0, _080C635C @ =sub_80C64A8
	b _080C6380
	.align 2, 0
_080C6350: .4byte gUnknown_0300485C
_080C6354: .4byte sub_808AB90
_080C6358: .4byte gUnknown_03005CE4
_080C635C: .4byte sub_80C64A8
_080C6360:
	adds r0, r4, 0
	bl is_tile_x98
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C6372
_080C636E:
	movs r0, 0
	b _080C6384
_080C6372:
	bl sub_80C6264
	ldr r1, _080C638C @ =gUnknown_0300485C
	ldr r0, _080C6390 @ =sub_808AB90
	str r0, [r1]
	ldr r1, _080C6394 @ =gUnknown_03005CE4
	ldr r0, _080C6398 @ =sub_80C660C
_080C6380:
	str r0, [r1]
	movs r0, 0x1
_080C6384:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C638C: .4byte gUnknown_0300485C
_080C6390: .4byte sub_808AB90
_080C6394: .4byte gUnknown_03005CE4
_080C6398: .4byte sub_80C660C
	thumb_func_end SetUpFieldMove_SecretPower

	thumb_func_start sub_80C639C
sub_80C639C: @ 80C639C
	push {lr}
	ldr r1, _080C63B0 @ =gUnknown_0202FF84
	ldr r0, _080C63B4 @ =gUnknown_03005CE0
	ldrb r0, [r0]
	str r0, [r1]
	ldr r0, _080C63B8 @ =gUnknown_081A2CE6
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080C63B0: .4byte gUnknown_0202FF84
_080C63B4: .4byte gUnknown_03005CE0
_080C63B8: .4byte gUnknown_081A2CE6
	thumb_func_end sub_80C639C

	thumb_func_start FldEff_UseSecretPowerCave
FldEff_UseSecretPowerCave: @ 80C63BC
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C63E0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080C63E4 @ =sub_80C63E8
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080C63E0: .4byte gTasks
_080C63E4: .4byte sub_80C63E8
	thumb_func_end FldEff_UseSecretPowerCave

	thumb_func_start sub_80C63E8
sub_80C63E8: @ 80C63E8
	push {lr}
	movs r0, 0xB
	bl FieldEffectActiveListRemove
	movs r0, 0x37
	bl FieldEffectStart
	pop {r0}
	bx r0
	thumb_func_end sub_80C63E8

	thumb_func_start FldEff_SecretPowerCave
FldEff_SecretPowerCave: @ 80C63FC
	push {r4,lr}
	bl sub_80C6280
	ldr r0, _080C643C @ =gSpriteTemplate_83D2614
	ldr r3, _080C6440 @ =gSprites
	ldr r1, _080C6444 @ =gPlayerAvatar
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 23
	ldr r4, _080C6448 @ =gUnknown_0202FF84
	ldr r3, [r4, 0x14]
	adds r1, r3
	lsls r1, 16
	asrs r1, 16
	ldrb r2, [r2]
	ldr r3, [r4, 0x18]
	adds r2, r3
	lsls r2, 16
	asrs r2, 16
	movs r3, 0x94
	bl CreateSprite
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C643C: .4byte gSpriteTemplate_83D2614
_080C6440: .4byte gSprites
_080C6444: .4byte gPlayerAvatar
_080C6448: .4byte gUnknown_0202FF84
	thumb_func_end FldEff_SecretPowerCave

	thumb_func_start sub_80C644C
sub_80C644C: @ 80C644C
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x83
	bl PlaySE
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _080C6464 @ =sub_80C6468
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C6464: .4byte sub_80C6468
	thumb_func_end sub_80C644C

	thumb_func_start sub_80C6468
sub_80C6468: @ 80C6468
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r1, r3]
	cmp r0, 0x27
	bgt _080C6488
	adds r0, r2, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bne _080C6490
	bl sub_80BB800
	b _080C6490
_080C6488:
	movs r0, 0
	strh r0, [r1, 0x2E]
	ldr r0, _080C6494 @ =sub_80C6498
	str r0, [r1, 0x1C]
_080C6490:
	pop {r0}
	bx r0
	.align 2, 0
_080C6494: .4byte sub_80C6498
	thumb_func_end sub_80C6468

	thumb_func_start sub_80C6498
sub_80C6498: @ 80C6498
	push {lr}
	movs r1, 0x37
	bl FieldEffectStop
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_80C6498

	thumb_func_start sub_80C64A8
sub_80C64A8: @ 80C64A8
	push {lr}
	ldr r1, _080C64BC @ =gUnknown_0202FF84
	ldr r0, _080C64C0 @ =gUnknown_03005CE0
	ldrb r0, [r0]
	str r0, [r1]
	ldr r0, _080C64C4 @ =gUnknown_081A2D3E
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080C64BC: .4byte gUnknown_0202FF84
_080C64C0: .4byte gUnknown_03005CE0
_080C64C4: .4byte gUnknown_081A2D3E
	thumb_func_end sub_80C64A8

	thumb_func_start FldEff_UseSecretPowerTree
FldEff_UseSecretPowerTree: @ 80C64C8
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C64EC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080C64F0 @ =sub_80C64F4
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080C64EC: .4byte gTasks
_080C64F0: .4byte sub_80C64F4
	thumb_func_end FldEff_UseSecretPowerTree

	thumb_func_start sub_80C64F4
sub_80C64F4: @ 80C64F4
	push {lr}
	movs r0, 0x1A
	bl FieldEffectActiveListRemove
	movs r0, 0x38
	bl FieldEffectStart
	pop {r0}
	bx r0
	thumb_func_end sub_80C64F4

	thumb_func_start FldEff_SecretPowerTree
FldEff_SecretPowerTree: @ 80C6508
	push {r4,lr}
	ldr r1, _080C6580 @ =gUnknown_0203923C
	movs r2, 0
	ldrsh r0, [r1, r2]
	movs r2, 0x2
	ldrsh r1, [r1, r2]
	bl MapGridGetMetatileBehaviorAt
	adds r2, r0, 0
	ldr r1, _080C6584 @ =0x00000fff
	adds r0, r1, 0
	ands r2, r0
	cmp r2, 0x96
	bne _080C652A
	ldr r1, _080C6588 @ =gUnknown_0202FF84
	movs r0, 0
	str r0, [r1, 0x1C]
_080C652A:
	cmp r2, 0x9C
	bne _080C6534
	ldr r1, _080C6588 @ =gUnknown_0202FF84
	movs r0, 0x2
	str r0, [r1, 0x1C]
_080C6534:
	bl sub_80C6280
	ldr r0, _080C658C @ =gSpriteTemplate_83D262C
	ldr r3, _080C6590 @ =gSprites
	ldr r1, _080C6594 @ =gPlayerAvatar
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 23
	ldr r4, _080C6588 @ =gUnknown_0202FF84
	ldr r3, [r4, 0x14]
	adds r1, r3
	lsls r1, 16
	asrs r1, 16
	ldrb r2, [r2]
	ldr r3, [r4, 0x18]
	adds r2, r3
	lsls r2, 16
	asrs r2, 16
	movs r3, 0x94
	bl CreateSprite
	ldr r0, [r4, 0x1C]
	cmp r0, 0x1
	beq _080C6572
	cmp r0, 0x3
	bne _080C6576
_080C6572:
	bl sub_80BB800
_080C6576:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C6580: .4byte gUnknown_0203923C
_080C6584: .4byte 0x00000fff
_080C6588: .4byte gUnknown_0202FF84
_080C658C: .4byte gSpriteTemplate_83D262C
_080C6590: .4byte gSprites
_080C6594: .4byte gPlayerAvatar
	thumb_func_end FldEff_SecretPowerTree

	thumb_func_start sub_80C6598
sub_80C6598: @ 80C6598
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x9B
	bl PlaySE
	ldr r0, _080C65BC @ =gUnknown_0202FF84
	ldr r1, [r0, 0x1C]
	adds r2, r4, 0
	adds r2, 0x2A
	movs r0, 0
	strb r1, [r2]
	strh r0, [r4, 0x2E]
	ldr r0, _080C65C0 @ =sub_80C65C4
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C65BC: .4byte gUnknown_0202FF84
_080C65C0: .4byte sub_80C65C4
	thumb_func_end sub_80C6598

	thumb_func_start sub_80C65C4
sub_80C65C4: @ 80C65C4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x27
	ble _080C65EE
	ldr r0, _080C65F4 @ =gUnknown_0202FF84
	ldr r0, [r0, 0x1C]
	cmp r0, 0
	beq _080C65E2
	cmp r0, 0x2
	bne _080C65E6
_080C65E2:
	bl sub_80BB800
_080C65E6:
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _080C65F8 @ =sub_80C65FC
	str r0, [r4, 0x1C]
_080C65EE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C65F4: .4byte gUnknown_0202FF84
_080C65F8: .4byte sub_80C65FC
	thumb_func_end sub_80C65C4

	thumb_func_start sub_80C65FC
sub_80C65FC: @ 80C65FC
	push {lr}
	movs r1, 0x38
	bl FieldEffectStop
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_80C65FC

	thumb_func_start sub_80C660C
sub_80C660C: @ 80C660C
	push {lr}
	ldr r1, _080C6620 @ =gUnknown_0202FF84
	ldr r0, _080C6624 @ =gUnknown_03005CE0
	ldrb r0, [r0]
	str r0, [r1]
	ldr r0, _080C6628 @ =gUnknown_081A2D96
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080C6620: .4byte gUnknown_0202FF84
_080C6624: .4byte gUnknown_03005CE0
_080C6628: .4byte gUnknown_081A2D96
	thumb_func_end sub_80C660C

	thumb_func_start FldEff_UseSecretPowerShrub
FldEff_UseSecretPowerShrub: @ 80C662C
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C6650 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080C6654 @ =sub_80C6658
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080C6650: .4byte gTasks
_080C6654: .4byte sub_80C6658
	thumb_func_end FldEff_UseSecretPowerShrub

	thumb_func_start sub_80C6658
sub_80C6658: @ 80C6658
	push {lr}
	movs r0, 0x1B
	bl FieldEffectActiveListRemove
	movs r0, 0x39
	bl FieldEffectStart
	pop {r0}
	bx r0
	thumb_func_end sub_80C6658

	thumb_func_start FldEff_SecretPowerShrub
FldEff_SecretPowerShrub: @ 80C666C
	push {r4,lr}
	bl sub_80C6280
	ldr r0, _080C66AC @ =gSpriteTemplate_83D2644
	ldr r3, _080C66B0 @ =gSprites
	ldr r1, _080C66B4 @ =gPlayerAvatar
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 23
	ldr r4, _080C66B8 @ =gUnknown_0202FF84
	ldr r3, [r4, 0x14]
	adds r1, r3
	lsls r1, 16
	asrs r1, 16
	ldrb r2, [r2]
	ldr r3, [r4, 0x18]
	adds r2, r3
	lsls r2, 16
	asrs r2, 16
	movs r3, 0x94
	bl CreateSprite
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C66AC: .4byte gSpriteTemplate_83D2644
_080C66B0: .4byte gSprites
_080C66B4: .4byte gPlayerAvatar
_080C66B8: .4byte gUnknown_0202FF84
	thumb_func_end FldEff_SecretPowerShrub

	thumb_func_start sub_80C66BC
sub_80C66BC: @ 80C66BC
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0xA9
	bl PlaySE
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _080C66D4 @ =sub_80C66D8
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C66D4: .4byte sub_80C66D8
	thumb_func_end sub_80C66BC

	thumb_func_start sub_80C66D8
sub_80C66D8: @ 80C66D8
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r1, r3]
	cmp r0, 0x27
	bgt _080C66F8
	adds r0, r2, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bne _080C6700
	bl sub_80BB800
	b _080C6700
_080C66F8:
	movs r0, 0
	strh r0, [r1, 0x2E]
	ldr r0, _080C6704 @ =sub_80C6708
	str r0, [r1, 0x1C]
_080C6700:
	pop {r0}
	bx r0
	.align 2, 0
_080C6704: .4byte sub_80C6708
	thumb_func_end sub_80C66D8

	thumb_func_start sub_80C6708
sub_80C6708: @ 80C6708
	push {lr}
	movs r1, 0x39
	bl FieldEffectStop
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_80C6708

	thumb_func_start FldEff_PCTurnOn
FldEff_PCTurnOn: @ 80C6718
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	ldr r0, _080C6758 @ =sub_80C6760
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C675C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	mov r0, sp
	ldrh r0, [r0]
	movs r2, 0
	strh r0, [r1, 0x8]
	ldrh r0, [r4]
	strh r0, [r1, 0xA]
	strh r2, [r1, 0xC]
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C6758: .4byte sub_80C6760
_080C675C: .4byte gTasks
	thumb_func_end FldEff_PCTurnOn

	thumb_func_start sub_80C6760
sub_80C6760: @ 80C6760
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080C6788 @ =gTasks + 0x8
	adds r4, r0, r1
	ldrh r0, [r4, 0x4]
	subs r0, 0x4
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	bhi _080C682E
	lsls r0, 2
	ldr r1, _080C678C @ =_080C6790
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C6788: .4byte gTasks + 0x8
_080C678C: .4byte _080C6790
	.align 2, 0
_080C6790:
	.4byte _080C67D4
	.4byte _080C682E
	.4byte _080C682E
	.4byte _080C682E
	.4byte _080C67E2
	.4byte _080C682E
	.4byte _080C682E
	.4byte _080C682E
	.4byte _080C67D4
	.4byte _080C682E
	.4byte _080C682E
	.4byte _080C682E
	.4byte _080C67E2
	.4byte _080C682E
	.4byte _080C682E
	.4byte _080C682E
	.4byte _080C6800
_080C67D4:
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	movs r2, 0x89
	lsls r2, 2
	b _080C67EE
_080C67E2:
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	movs r2, 0x88
	lsls r2, 2
_080C67EE:
	bl MapGridSetMetatileIdAt
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	b _080C682E
_080C6800:
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	movs r2, 0x89
	lsls r2, 2
	bl MapGridSetMetatileIdAt
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	movs r0, 0x3D
	bl FieldEffectActiveListRemove
	bl EnableBothScriptContexts
	adds r0, r5, 0
	bl DestroyTask
	b _080C6834
_080C682E:
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
	strh r0, [r4, 0x4]
_080C6834:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C6760

	thumb_func_start sub_80C683C
sub_80C683C: @ 80C683C
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	movs r0, 0x3
	bl PlaySE
	ldr r0, _080C6874 @ =0x00004054
	bl VarGet
	lsls r0, 16
	cmp r0, 0
	bne _080C6878
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r2, 0xE2
	lsls r2, 4
	bl MapGridSetMetatileIdAt
	b _080C6888
	.align 2, 0
_080C6874: .4byte 0x00004054
_080C6878:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _080C68A0 @ =0x00000e21
	bl MapGridSetMetatileIdAt
_080C6888:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C68A0: .4byte 0x00000e21
	thumb_func_end sub_80C683C

	thumb_func_start sub_80C68A4
sub_80C68A4: @ 80C68A4
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	ldr r0, _080C68E4 @ =sub_80C68EC
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C68E8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r4, [r1, 0x8]
	strh r5, [r1, 0xA]
	strh r6, [r1, 0xC]
	strh r0, [r1, 0xE]
	movs r0, 0x1
	strh r0, [r1, 0x10]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C68E4: .4byte sub_80C68EC
_080C68E8: .4byte gTasks
	thumb_func_end sub_80C68A4

	thumb_func_start sub_80C68EC
sub_80C68EC: @ 80C68EC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080C690C @ =gTasks + 0x8
	adds r4, r0, r1
	ldrh r1, [r4, 0x6]
	movs r2, 0x6
	ldrsh r0, [r4, r2]
	cmp r0, 0x6
	bne _080C6910
	movs r0, 0
	b _080C6912
	.align 2, 0
_080C690C: .4byte gTasks + 0x8
_080C6910:
	adds r0, r1, 0x1
_080C6912:
	strh r0, [r4, 0x6]
	movs r3, 0x6
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _080C6964
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x2
	bne _080C692C
	movs r2, 0
	ldrsh r0, [r4, r2]
	bl DoBalloonSoundEffect
_080C692C:
	movs r3, 0x2
	ldrsh r0, [r4, r3]
	movs r2, 0x4
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, 0x8]
	ldrh r3, [r4]
	adds r2, r3
	lsls r2, 16
	lsrs r2, 16
	bl MapGridSetMetatileIdAt
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	movs r2, 0x4
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	ldrh r1, [r4, 0x8]
	movs r3, 0x8
	ldrsh r0, [r4, r3]
	cmp r0, 0x3
	bne _080C6960
	adds r0, r5, 0
	bl DestroyTask
	b _080C6964
_080C6960:
	adds r0, r1, 0x1
	strh r0, [r4, 0x8]
_080C6964:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C68EC

	thumb_func_start DoBalloonSoundEffect
DoBalloonSoundEffect: @ 80C696C
	push {lr}
	lsls r0, 16
	asrs r1, r0, 16
	movs r0, 0xCE
	lsls r0, 2
	cmp r1, r0
	beq _080C6998
	cmp r1, r0
	bgt _080C6988
	movs r0, 0x8A
	lsls r0, 2
	cmp r1, r0
	beq _080C69B0
	b _080C69B6
_080C6988:
	movs r0, 0xCF
	lsls r0, 2
	cmp r1, r0
	beq _080C69A0
	adds r0, 0x4
	cmp r1, r0
	beq _080C69A8
	b _080C69B6
_080C6998:
	movs r0, 0x4A
	bl PlaySE
	b _080C69B6
_080C69A0:
	movs r0, 0x4B
	bl PlaySE
	b _080C69B6
_080C69A8:
	movs r0, 0x4C
	bl PlaySE
	b _080C69B6
_080C69B0:
	movs r0, 0x4E
	bl PlaySE
_080C69B6:
	pop {r0}
	bx r0
	thumb_func_end DoBalloonSoundEffect

	thumb_func_start FldEff_Nop47
FldEff_Nop47: @ 80C69BC
	movs r0, 0
	bx lr
	thumb_func_end FldEff_Nop47

	thumb_func_start FldEff_Nop48
FldEff_Nop48: @ 80C69C0
	movs r0, 0
	bx lr
	thumb_func_end FldEff_Nop48

	thumb_func_start sub_80C69C4
sub_80C69C4: @ 80C69C4
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0x4D
	bl PlaySE
	lsls r5, 16
	asrs r5, 16
	lsls r4, 16
	asrs r4, 16
	ldr r2, _080C6A0C @ =0x00000276
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridSetMetatileIdAt
	subs r6, r4, 0x1
	ldr r2, _080C6A10 @ =0x0000026e
	adds r0, r5, 0
	adds r1, r6, 0
	bl MapGridSetMetatileIdAt
	adds r0, r5, 0
	adds r1, r4, 0
	bl CurrentMapDrawMetatileAt
	adds r0, r5, 0
	adds r1, r6, 0
	bl CurrentMapDrawMetatileAt
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C6A0C: .4byte 0x00000276
_080C6A10: .4byte 0x0000026e
	thumb_func_end sub_80C69C4

	thumb_func_start sub_80C6A14
sub_80C6A14: @ 80C6A14
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080C6A44 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0x8]
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	cmp r0, 0x7
	bne _080C6A48
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	movs r3, 0xC
	ldrsh r1, [r1, r3]
	bl sub_80C69C4
	adds r0, r4, 0
	bl DestroyTask
	b _080C6A4C
	.align 2, 0
_080C6A44: .4byte gTasks
_080C6A48:
	adds r0, r2, 0x1
	strh r0, [r1, 0x8]
_080C6A4C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C6A14

	thumb_func_start sub_80C6A54
sub_80C6A54: @ 80C6A54
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	adds r7, r5, 0
	lsls r1, 16
	lsrs r4, r1, 16
	adds r6, r4, 0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C6A7C
	lsls r0, r5, 16
	asrs r0, 16
	lsls r1, r4, 16
	asrs r1, 16
	bl sub_80C69C4
	b _080C6A9E
_080C6A7C:
	cmp r0, 0x2
	bne _080C6A9E
	ldr r0, _080C6AA4 @ =sub_80C6A14
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C6AA8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	strh r7, [r1, 0xA]
	strh r6, [r1, 0xC]
_080C6A9E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C6AA4: .4byte sub_80C6A14
_080C6AA8: .4byte gTasks
	thumb_func_end sub_80C6A54

	thumb_func_start Task_DecorationSoundEffect
Task_DecorationSoundEffect: @ 80C6AAC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080C6AE4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0xA]
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	cmp r0, 0x7
	beq _080C6AC8
	b _080C6C26
_080C6AC8:
	ldr r2, _080C6AE8 @ =0xfffffd88
	adds r0, r2, 0
	ldrh r1, [r1, 0x8]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3B
	bls _080C6ADA
	b _080C6C1E
_080C6ADA:
	lsls r0, 2
	ldr r1, _080C6AEC @ =_080C6AF0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C6AE4: .4byte gTasks
_080C6AE8: .4byte 0xfffffd88
_080C6AEC: .4byte _080C6AF0
	.align 2, 0
_080C6AF0:
	.4byte _080C6BE0
	.4byte _080C6BE8
	.4byte _080C6BF0
	.4byte _080C6BF8
	.4byte _080C6C00
	.4byte _080C6C08
	.4byte _080C6C10
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C18
_080C6BE0:
	movs r0, 0x3E
	bl PlaySE
	b _080C6C1E
_080C6BE8:
	movs r0, 0x3F
	bl PlaySE
	b _080C6C1E
_080C6BF0:
	movs r0, 0x40
	bl PlaySE
	b _080C6C1E
_080C6BF8:
	movs r0, 0x41
	bl PlaySE
	b _080C6C1E
_080C6C00:
	movs r0, 0x42
	bl PlaySE
	b _080C6C1E
_080C6C08:
	movs r0, 0x43
	bl PlaySE
	b _080C6C1E
_080C6C10:
	movs r0, 0x44
	bl PlaySE
	b _080C6C1E
_080C6C18:
	movs r0, 0x45
	bl PlaySE
_080C6C1E:
	adds r0, r4, 0
	bl DestroyTask
	b _080C6C2A
_080C6C26:
	adds r0, r2, 0x1
	strh r0, [r1, 0xA]
_080C6C2A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Task_DecorationSoundEffect

	thumb_func_start DoDecorationSoundEffect
DoDecorationSoundEffect: @ 80C6C30
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _080C6C5C @ =Task_DecorationSoundEffect
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C6C60 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r4, [r1, 0x8]
	strh r0, [r1, 0xA]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C6C5C: .4byte Task_DecorationSoundEffect
_080C6C60: .4byte gTasks
	thumb_func_end DoDecorationSoundEffect

	thumb_func_start SpriteCB_YellowCave4Sparkle
SpriteCB_YellowCave4Sparkle: @ 80C6C64
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	bne _080C6C7C
	movs r0, 0xC3
	bl PlaySE
_080C6C7C:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1F
	ble _080C6C8A
	adds r0, r4, 0
	bl DestroySprite
_080C6C8A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_YellowCave4Sparkle

	thumb_func_start DoYellowCave4Sparkle
DoYellowCave4Sparkle: @ 80C6C90
	push {r4,lr}
	sub sp, 0x4
	ldr r3, _080C6D28 @ =gMapObjects
	ldr r2, _080C6D2C @ =gPlayerAvatar
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x10]
	mov r0, sp
	strh r1, [r0]
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x12]
	mov r4, sp
	adds r4, 0x2
	strh r0, [r4]
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0x8
	movs r3, 0x4
	bl sub_8060470
	ldr r0, _080C6D30 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x58]
	mov r1, sp
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r3, 0
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080C6D1E
	ldr r3, _080C6D34 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r4, r2, r3
	movs r0, 0x3E
	adds r0, r4
	mov r12, r0
	ldrb r0, [r0]
	movs r1, 0x2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0xF
	ands r0, r1
	movs r1, 0x50
	orrs r0, r1
	strb r0, [r4, 0x5]
	adds r3, 0x1C
	adds r2, r3
	ldr r0, _080C6D38 @ =SpriteCB_YellowCave4Sparkle
	str r0, [r2]
	movs r0, 0
	strh r0, [r4, 0x2E]
_080C6D1E:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C6D28: .4byte gMapObjects
_080C6D2C: .4byte gPlayerAvatar
_080C6D30: .4byte gFieldEffectObjectTemplatePointers
_080C6D34: .4byte gSprites
_080C6D38: .4byte SpriteCB_YellowCave4Sparkle
	thumb_func_end DoYellowCave4Sparkle

	thumb_func_start FldEff_SandPillar
FldEff_SandPillar: @ 80C6D3C
	push {r4,lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	ldr r1, _080C6D78 @ =gUnknown_0202FF84
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	str r0, [r1, 0x14]
	movs r3, 0
	ldrsh r0, [r4, r3]
	str r0, [r1, 0x18]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _080C6DBC
	cmp r0, 0x2
	bgt _080C6D7C
	cmp r0, 0x1
	beq _080C6D86
	b _080C6E4C
	.align 2, 0
_080C6D78: .4byte gUnknown_0202FF84
_080C6D7C:
	cmp r0, 0x3
	beq _080C6DEC
	cmp r0, 0x4
	beq _080C6E24
	b _080C6E4C
_080C6D86:
	ldr r0, _080C6DB0 @ =gSpriteTemplate_83D26A0
	ldr r3, _080C6DB4 @ =gSprites
	ldr r1, _080C6DB8 @ =gPlayerAvatar
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 7
	movs r3, 0x80
	lsls r3, 12
	adds r1, r3
	asrs r1, 16
	ldrb r2, [r2]
	adds r2, 0x20
	movs r3, 0
	bl CreateSprite
	b _080C6E4C
	.align 2, 0
_080C6DB0: .4byte gSpriteTemplate_83D26A0
_080C6DB4: .4byte gSprites
_080C6DB8: .4byte gPlayerAvatar
_080C6DBC:
	ldr r0, _080C6DE0 @ =gSpriteTemplate_83D26A0
	ldr r3, _080C6DE4 @ =gSprites
	ldr r1, _080C6DE8 @ =gPlayerAvatar
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 7
	movs r3, 0x80
	lsls r3, 12
	adds r1, r3
	asrs r1, 16
	ldrb r2, [r2]
	b _080C6E0C
	.align 2, 0
_080C6DE0: .4byte gSpriteTemplate_83D26A0
_080C6DE4: .4byte gSprites
_080C6DE8: .4byte gPlayerAvatar
_080C6DEC:
	ldr r0, _080C6E14 @ =gSpriteTemplate_83D26A0
	ldr r3, _080C6E18 @ =gSprites
	ldr r1, _080C6E1C @ =gPlayerAvatar
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 7
	ldr r3, _080C6E20 @ =0xfff80000
	adds r1, r3
	asrs r1, 16
	ldrb r2, [r2]
	adds r2, 0x10
_080C6E0C:
	movs r3, 0x94
	bl CreateSprite
	b _080C6E4C
	.align 2, 0
_080C6E14: .4byte gSpriteTemplate_83D26A0
_080C6E18: .4byte gSprites
_080C6E1C: .4byte gPlayerAvatar
_080C6E20: .4byte 0xfff80000
_080C6E24:
	ldr r0, _080C6E58 @ =gSpriteTemplate_83D26A0
	ldr r3, _080C6E5C @ =gSprites
	ldr r1, _080C6E60 @ =gPlayerAvatar
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 7
	movs r3, 0xC0
	lsls r3, 13
	adds r1, r3
	asrs r1, 16
	ldrb r2, [r2]
	adds r2, 0x10
	movs r3, 0x94
	bl CreateSprite
_080C6E4C:
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C6E58: .4byte gSpriteTemplate_83D26A0
_080C6E5C: .4byte gSprites
_080C6E60: .4byte gPlayerAvatar
	thumb_func_end FldEff_SandPillar

	thumb_func_start SpriteCB_SandPillar_0
SpriteCB_SandPillar_0: @ 80C6E64
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r0, 0x83
	bl PlaySE
	ldr r4, _080C6E90 @ =gUnknown_0202FF84
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	subs r1, 0x1
	bl MapGridGetMetatileIdAt
	ldr r1, _080C6E94 @ =0x00000286
	cmp r0, r1
	bne _080C6E9C
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	subs r1, 0x1
	ldr r2, _080C6E98 @ =0x00000e02
	bl MapGridSetMetatileIdAt
	b _080C6EAA
	.align 2, 0
_080C6E90: .4byte gUnknown_0202FF84
_080C6E94: .4byte 0x00000286
_080C6E98: .4byte 0x00000e02
_080C6E9C:
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	subs r1, 0x1
	movs r2, 0xA1
	lsls r2, 2
	bl MapGridSetMetatileIdAt
_080C6EAA:
	ldr r4, _080C6ED8 @ =gUnknown_0202FF84
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	ldr r2, _080C6EDC @ =0x0000020a
	bl MapGridSetMetatileIdAt
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	subs r1, 0x1
	bl CurrentMapDrawMetatileAt
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	bl CurrentMapDrawMetatileAt
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldr r0, _080C6EE0 @ =SpriteCB_SandPillar_1
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C6ED8: .4byte gUnknown_0202FF84
_080C6EDC: .4byte 0x0000020a
_080C6EE0: .4byte SpriteCB_SandPillar_1
	thumb_func_end SpriteCB_SandPillar_0

	thumb_func_start SpriteCB_SandPillar_1
SpriteCB_SandPillar_1: @ 80C6EE4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r1, [r5, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0x11
	bgt _080C6EF8
	adds r0, r1, 0x1
	strh r0, [r5, 0x2E]
	b _080C6F14
_080C6EF8:
	ldr r4, _080C6F1C @ =gUnknown_0202FF84
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	ldr r2, _080C6F20 @ =0x00000e8c
	bl MapGridSetMetatileIdAt
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	bl CurrentMapDrawMetatileAt
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldr r0, _080C6F24 @ =SpriteCB_SandPillar_2
	str r0, [r5, 0x1C]
_080C6F14:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C6F1C: .4byte gUnknown_0202FF84
_080C6F20: .4byte 0x00000e8c
_080C6F24: .4byte SpriteCB_SandPillar_2
	thumb_func_end SpriteCB_SandPillar_1

	thumb_func_start SpriteCB_SandPillar_2
SpriteCB_SandPillar_2: @ 80C6F28
	push {lr}
	movs r1, 0x34
	bl FieldEffectStop
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_SandPillar_2

	thumb_func_start GetShieldToyTVDecorationInfo
GetShieldToyTVDecorationInfo: @ 80C6F38
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	ldr r0, _080C6F70 @ =0x000002f5
	cmp r1, r0
	beq _080C6FE8
	cmp r1, r0
	bgt _080C6F74
	subs r0, 0x17
	cmp r1, r0
	beq _080C6FB0
	adds r0, 0x16
	cmp r1, r0
	beq _080C6FDC
	b _080C6FFA
	.align 2, 0
_080C6F70: .4byte 0x000002f5
_080C6F74:
	ldr r0, _080C6F9C @ =0x000002f6
	cmp r1, r0
	beq _080C6FF4
	adds r0, 0x40
	cmp r1, r0
	bne _080C6FFA
	ldr r0, _080C6FA0 @ =gStringVar1
	movs r1, 0x64
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, _080C6FA4 @ =gStringVar2
	ldr r1, _080C6FA8 @ =gSecretBaseText_GoldRank
	bl StringCopy
	ldr r1, _080C6FAC @ =gScriptResult
	movs r0, 0
	b _080C6FF8
	.align 2, 0
_080C6F9C: .4byte 0x000002f6
_080C6FA0: .4byte gStringVar1
_080C6FA4: .4byte gStringVar2
_080C6FA8: .4byte gSecretBaseText_GoldRank
_080C6FAC: .4byte gScriptResult
_080C6FB0:
	ldr r0, _080C6FCC @ =gStringVar1
	movs r1, 0x32
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _080C6FD0 @ =gStringVar2
	ldr r1, _080C6FD4 @ =gSecretBaseText_SilverRank
	bl StringCopy
	ldr r1, _080C6FD8 @ =gScriptResult
	movs r0, 0
	b _080C6FF8
	.align 2, 0
_080C6FCC: .4byte gStringVar1
_080C6FD0: .4byte gStringVar2
_080C6FD4: .4byte gSecretBaseText_SilverRank
_080C6FD8: .4byte gScriptResult
_080C6FDC:
	ldr r1, _080C6FE4 @ =gScriptResult
	movs r0, 0x1
	b _080C6FF8
	.align 2, 0
_080C6FE4: .4byte gScriptResult
_080C6FE8:
	ldr r1, _080C6FF0 @ =gScriptResult
	movs r0, 0x2
	b _080C6FF8
	.align 2, 0
_080C6FF0: .4byte gScriptResult
_080C6FF4:
	ldr r1, _080C7004 @ =gScriptResult
	movs r0, 0x3
_080C6FF8:
	strh r0, [r1]
_080C6FFA:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C7004: .4byte gScriptResult
	thumb_func_end GetShieldToyTVDecorationInfo

	thumb_func_start Task_FieldPoisonEffect
Task_FieldPoisonEffect: @ 80C7008
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080C702C @ =gTasks + 0x8
	adds r1, r0, r1
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0x1
	beq _080C7046
	cmp r0, 0x1
	bgt _080C7030
	cmp r0, 0
	beq _080C7036
	b _080C7062
	.align 2, 0
_080C702C: .4byte gTasks + 0x8
_080C7030:
	cmp r0, 0x2
	beq _080C705A
	b _080C7062
_080C7036:
	ldrh r0, [r1, 0x2]
	adds r0, 0x2
	strh r0, [r1, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080C7062
	b _080C7052
_080C7046:
	ldrh r0, [r1, 0x2]
	subs r0, 0x2
	strh r0, [r1, 0x2]
	lsls r0, 16
	cmp r0, 0
	bne _080C7062
_080C7052:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080C7062
_080C705A:
	adds r0, r2, 0
	bl DestroyTask
	b _080C706C
_080C7062:
	ldr r2, _080C7070 @ =REG_MOSAIC
	ldrh r1, [r1, 0x2]
	lsls r0, r1, 4
	orrs r0, r1
	strh r0, [r2]
_080C706C:
	pop {r0}
	bx r0
	.align 2, 0
_080C7070: .4byte REG_MOSAIC
	thumb_func_end Task_FieldPoisonEffect

	thumb_func_start DoFieldPoisonEffect
DoFieldPoisonEffect: @ 80C7074
	push {lr}
	movs r0, 0x4F
	bl PlaySE
	ldr r0, _080C7088 @ =Task_FieldPoisonEffect
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080C7088: .4byte Task_FieldPoisonEffect
	thumb_func_end DoFieldPoisonEffect

	thumb_func_start FieldPoisonEffectIsRunning
FieldPoisonEffectIsRunning: @ 80C708C
	push {lr}
	ldr r0, _080C709C @ =Task_FieldPoisonEffect
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080C709C: .4byte Task_FieldPoisonEffect
	thumb_func_end FieldPoisonEffectIsRunning

	thumb_func_start Task_WateringBerryTreeAnim_0
Task_WateringBerryTreeAnim_0: @ 80C70A0
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C70B4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080C70B8 @ =Task_WateringBerryTreeAnim_1
	str r0, [r1]
	bx lr
	.align 2, 0
_080C70B4: .4byte gTasks
_080C70B8: .4byte Task_WateringBerryTreeAnim_1
	thumb_func_end Task_WateringBerryTreeAnim_0

	thumb_func_start Task_WateringBerryTreeAnim_1
Task_WateringBerryTreeAnim_1: @ 80C70BC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080C7120 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C7124 @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _080C70E8
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080C711A
_080C70E8:
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl sub_8059D08
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl GetStepInPlaceDelay16AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldr r1, _080C7128 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C712C @ =Task_WateringBerryTreeAnim_2
	str r1, [r0]
_080C711A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C7120: .4byte gPlayerAvatar
_080C7124: .4byte gMapObjects
_080C7128: .4byte gTasks
_080C712C: .4byte Task_WateringBerryTreeAnim_2
	thumb_func_end Task_WateringBerryTreeAnim_1

	thumb_func_start Task_WateringBerryTreeAnim_2
Task_WateringBerryTreeAnim_2: @ 80C7130
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C7184 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C7188 @ =gMapObjects
	adds r5, r0, r1
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080C7194
	ldr r1, _080C718C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0xA]
	adds r1, r0, 0x1
	strh r1, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	bgt _080C7190
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl GetStepInPlaceDelay16AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetSpecialAnim
	b _080C7194
	.align 2, 0
_080C7184: .4byte gPlayerAvatar
_080C7188: .4byte gMapObjects
_080C718C: .4byte gTasks
_080C7190:
	ldr r0, _080C719C @ =Task_WateringBerryTreeAnim_3
	str r0, [r2]
_080C7194:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C719C: .4byte Task_WateringBerryTreeAnim_3
	thumb_func_end Task_WateringBerryTreeAnim_2

	thumb_func_start Task_WateringBerryTreeAnim_3
Task_WateringBerryTreeAnim_3: @ 80C71A0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80597D0
	lsls r0, 24
	lsrs r0, 24
	bl SetPlayerAvatarTransitionFlags
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Task_WateringBerryTreeAnim_3

	thumb_func_start DoWateringBerryTreeAnim
DoWateringBerryTreeAnim: @ 80C71C4
	push {lr}
	ldr r0, _080C71D4 @ =Task_WateringBerryTreeAnim_0
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080C71D4: .4byte Task_WateringBerryTreeAnim_0
	thumb_func_end DoWateringBerryTreeAnim

	thumb_func_start CreateRecordMixingSprite
CreateRecordMixingSprite: @ 80C71D8
	push {r4,r5,lr}
	ldr r0, _080C722C @ =gUnknown_083D2878
	bl LoadSpritePalette
	ldr r0, _080C7230 @ =gSpriteTemplate_83D2894
	movs r1, 0
	movs r2, 0
	movs r3, 0x52
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x40
	beq _080C7238
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	ldr r1, _080C7234 @ =gSprites
	adds r4, r0, r1
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r0, 0x10
	movs r1, 0xD
	bl sub_8060388
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x20]
	adds r0, 0x10
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x22]
	adds r0, 0x2
	strh r0, [r4, 0x22]
	adds r0, r5, 0
	b _080C723A
	.align 2, 0
_080C722C: .4byte gUnknown_083D2878
_080C7230: .4byte gSpriteTemplate_83D2894
_080C7234: .4byte gSprites
_080C7238:
	movs r0, 0x40
_080C723A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end CreateRecordMixingSprite

	thumb_func_start DestroyRecordMixingSprite
DestroyRecordMixingSprite: @ 80C7240
	push {r4-r7,lr}
	ldr r4, _080C7274 @ =gSprites
	adds r7, r4, 0
	movs r6, 0
	movs r5, 0x3F
_080C724A:
	adds r0, r7, 0
	adds r0, 0x14
	adds r0, r6, r0
	ldr r1, [r0]
	ldr r0, _080C7278 @ =gSpriteTemplate_83D2894
	cmp r1, r0
	bne _080C7264
	adds r0, r4, 0
	bl FreeSpritePalette
	adds r0, r4, 0
	bl DestroySprite
_080C7264:
	adds r4, 0x44
	adds r6, 0x44
	subs r5, 0x1
	cmp r5, 0
	bge _080C724A
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C7274: .4byte gSprites
_080C7278: .4byte gSpriteTemplate_83D2894
	thumb_func_end DestroyRecordMixingSprite

	.align 2, 0 @ Don't pad with nop.
