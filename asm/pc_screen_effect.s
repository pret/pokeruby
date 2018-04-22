	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

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

	.align 2, 0 @ Don't pad with nop.
