	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80FA8EC
sub_80FA8EC: @ 80FA8EC
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	bl sub_80FA904
_080FA8F6:
	bl sub_80FA940
	lsls r0, 24
	cmp r0, 0
	bne _080FA8F6
	pop {r0}
	bx r0
	thumb_func_end sub_80FA8EC

	thumb_func_start sub_80FA904
sub_80FA904: @ 80FA904
	push {r4,lr}
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _080FA928 @ =gUnknown_020388CC
	str r0, [r3]
	movs r2, 0x79
	adds r2, r0
	mov r12, r2
	movs r2, 0
	mov r4, r12
	strb r2, [r4]
	adds r0, 0x78
	strb r1, [r0]
	ldr r3, [r3]
	cmp r1, 0
	bne _080FA930
	ldr r0, _080FA92C @ =sub_80FAB78
	b _080FA932
	.align 2, 0
_080FA928: .4byte gUnknown_020388CC
_080FA92C: .4byte sub_80FAB78
_080FA930:
	ldr r0, _080FA93C @ =sub_80FAD04
_080FA932:
	str r0, [r3, 0x18]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FA93C: .4byte sub_80FAD04
	thumb_func_end sub_80FA904

	thumb_func_start sub_80FA940
sub_80FA940: @ 80FA940
	push {r4,r5,lr}
	sub sp, 0xC
	ldr r0, _080FA95C @ =gUnknown_020388CC
	ldr r0, [r0]
	adds r0, 0x79
	ldrb r0, [r0]
	cmp r0, 0x7
	bls _080FA952
	b _080FAAE2
_080FA952:
	lsls r0, 2
	ldr r1, _080FA960 @ =_080FA964
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FA95C: .4byte gUnknown_020388CC
_080FA960: .4byte _080FA964
	.align 2, 0
_080FA964:
	.4byte _080FA984
	.4byte _080FA998
	.4byte _080FA9AC
	.4byte _080FA9BC
	.4byte _080FA9D8
	.4byte _080FA9F4
	.4byte _080FAA38
	.4byte _080FAAB4
_080FA984:
	ldr r0, _080FA990 @ =gUnknown_083E5DA0
	ldr r1, _080FA994 @ =0x06008000
	bl LZ77UnCompVram
	b _080FAAF4
	.align 2, 0
_080FA990: .4byte gUnknown_083E5DA0
_080FA994: .4byte 0x06008000
_080FA998:
	ldr r0, _080FA9A4 @ =gUnknown_083E6B04
	ldr r1, _080FA9A8 @ =0x0600e000
	bl LZ77UnCompVram
	b _080FAAF4
	.align 2, 0
_080FA9A4: .4byte gUnknown_083E6B04
_080FA9A8: .4byte 0x0600e000
_080FA9AC:
	ldr r0, _080FA9B8 @ =gUnknown_083E5D60
	movs r1, 0x70
	movs r2, 0x60
	bl LoadPalette
	b _080FAAF4
	.align 2, 0
_080FA9B8: .4byte gUnknown_083E5D60
_080FA9BC:
	ldr r0, _080FA9D0 @ =gUnknown_083E5AF0
	ldr r1, _080FA9D4 @ =gUnknown_020388CC
	ldr r1, [r1]
	movs r2, 0xC0
	lsls r2, 1
	adds r1, r2
	bl LZ77UnCompWram
	b _080FAAF4
	.align 2, 0
_080FA9D0: .4byte gUnknown_083E5AF0
_080FA9D4: .4byte gUnknown_020388CC
_080FA9D8:
	ldr r0, _080FA9EC @ =gUnknown_083E5B34
	ldr r1, _080FA9F0 @ =gUnknown_020388CC
	ldr r1, [r1]
	movs r3, 0xA0
	lsls r3, 2
	adds r1, r3
	bl LZ77UnCompWram
	b _080FAAF4
	.align 2, 0
_080FA9EC: .4byte gUnknown_083E5B34
_080FA9F0: .4byte gUnknown_020388CC
_080FA9F4:
	bl sub_80FB32C
	ldr r4, _080FAA34 @ =gUnknown_020388CC
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x54
	ldrh r1, [r0]
	adds r0, 0x20
	strh r1, [r0]
	subs r0, 0x1E
	ldrh r0, [r0]
	adds r1, r2, 0
	adds r1, 0x76
	strh r0, [r1]
	ldrh r0, [r2, 0x14]
	bl sub_80FB758
	ldr r1, [r4]
	strb r0, [r1, 0x16]
	ldr r0, [r4]
	ldrh r0, [r0, 0x14]
	bl sub_80FB9C0
	adds r1, r0, 0
	ldr r0, [r4]
	strh r1, [r0, 0x14]
	ldrh r1, [r0, 0x14]
	movs r2, 0x10
	bl sub_80FBFB4
	b _080FAAF4
	.align 2, 0
_080FAA34: .4byte gUnknown_020388CC
_080FAA38:
	ldr r0, _080FAA60 @ =gUnknown_020388CC
	ldr r4, [r0]
	adds r0, r4, 0
	adds r0, 0x78
	ldrb r1, [r0]
	cmp r1, 0
	bne _080FAA64
	movs r0, 0x80
	lsls r0, 1
	str r0, [sp]
	str r0, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80FB170
	b _080FAAF4
	.align 2, 0
_080FAA60: .4byte gUnknown_020388CC
_080FAA64:
	adds r1, r4, 0
	adds r1, 0x54
	ldrh r0, [r1]
	lsls r0, 3
	subs r0, 0x34
	adds r2, r4, 0
	adds r2, 0x5C
	movs r3, 0
	strh r0, [r2]
	movs r5, 0x56
	adds r5, r4
	mov r12, r5
	ldrh r0, [r5]
	lsls r0, 3
	subs r0, 0x44
	adds r5, r4, 0
	adds r5, 0x5E
	strh r0, [r5]
	ldrh r1, [r1]
	adds r0, r4, 0
	adds r0, 0x64
	strh r1, [r0]
	mov r0, r12
	ldrh r1, [r0]
	adds r0, r4, 0
	adds r0, 0x66
	strh r1, [r0]
	movs r1, 0
	ldrsh r0, [r2, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	movs r2, 0x80
	str r2, [sp]
	str r2, [sp, 0x4]
	str r3, [sp, 0x8]
	movs r2, 0x38
	movs r3, 0x48
	bl sub_80FB170
	b _080FAAF4
_080FAAB4:
	bl sub_80FBA18
	bl sub_80FB260
	ldr r2, _080FAAE8 @ =gUnknown_020388CC
	ldr r0, [r2]
	movs r1, 0
	str r1, [r0, 0x1C]
	str r1, [r0, 0x20]
	adds r0, 0x7A
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, 0x7E
	strb r1, [r0]
	ldr r1, _080FAAEC @ =REG_BG2CNT
	ldr r3, _080FAAF0 @ =0x0000bc8a
	adds r0, r3, 0
	strh r0, [r1]
	ldr r1, [r2]
	adds r1, 0x79
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080FAAE2:
	movs r0, 0
	b _080FAB02
	.align 2, 0
_080FAAE8: .4byte gUnknown_020388CC
_080FAAEC: .4byte REG_BG2CNT
_080FAAF0: .4byte 0x0000bc8a
_080FAAF4:
	ldr r0, _080FAB0C @ =gUnknown_020388CC
	ldr r1, [r0]
	adds r1, 0x79
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0x1
_080FAB02:
	add sp, 0xC
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080FAB0C: .4byte gUnknown_020388CC
	thumb_func_end sub_80FA940

	thumb_func_start sub_80FAB10
sub_80FAB10: @ 80FAB10
	push {r4,lr}
	ldr r4, _080FAB5C @ =gUnknown_020388CC
	ldr r0, [r4]
	ldr r0, [r0, 0x1C]
	cmp r0, 0
	beq _080FAB34
	bl DestroySprite
	ldr r0, [r4]
	adds r0, 0x58
	ldrh r0, [r0]
	bl FreeSpriteTilesByTag
	ldr r0, [r4]
	adds r0, 0x5A
	ldrh r0, [r0]
	bl FreeSpritePaletteByTag
_080FAB34:
	ldr r0, [r4]
	ldr r0, [r0, 0x20]
	cmp r0, 0
	beq _080FAB54
	bl DestroySprite
	ldr r0, [r4]
	adds r0, 0x70
	ldrh r0, [r0]
	bl FreeSpriteTilesByTag
	ldr r0, [r4]
	adds r0, 0x72
	ldrh r0, [r0]
	bl FreeSpritePaletteByTag
_080FAB54:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FAB5C: .4byte gUnknown_020388CC
	thumb_func_end sub_80FAB10

	thumb_func_start sub_80FAB60
sub_80FAB60: @ 80FAB60
	push {lr}
	ldr r0, _080FAB74 @ =gUnknown_020388CC
	ldr r0, [r0]
	ldr r0, [r0, 0x18]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080FAB74: .4byte gUnknown_020388CC
	thumb_func_end sub_80FAB60

	thumb_func_start sub_80FAB78
sub_80FAB78: @ 80FAB78
	push {r4,lr}
	movs r4, 0
	ldr r2, _080FAC14 @ =gUnknown_020388CC
	ldr r0, [r2]
	adds r0, 0x7B
	strb r4, [r0]
	ldr r0, [r2]
	adds r0, 0x7C
	strb r4, [r0]
	ldr r3, _080FAC18 @ =gMain
	ldrh r1, [r3, 0x2C]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080FABAA
	ldr r1, [r2]
	adds r0, r1, 0
	adds r0, 0x56
	ldrh r0, [r0]
	cmp r0, 0x2
	bls _080FABAA
	adds r1, 0x7C
	movs r0, 0xFF
	strb r0, [r1]
	movs r4, 0x1
_080FABAA:
	ldrh r1, [r3, 0x2C]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080FABC8
	ldr r1, [r2]
	adds r0, r1, 0
	adds r0, 0x56
	ldrh r0, [r0]
	cmp r0, 0xF
	bhi _080FABC8
	adds r1, 0x7C
	movs r0, 0x1
	strb r0, [r1]
	movs r4, 0x1
_080FABC8:
	ldrh r1, [r3, 0x2C]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080FABE6
	ldr r1, [r2]
	adds r0, r1, 0
	adds r0, 0x54
	ldrh r0, [r0]
	cmp r0, 0x1
	bls _080FABE6
	adds r1, 0x7B
	movs r0, 0xFF
	strb r0, [r1]
	movs r4, 0x1
_080FABE6:
	ldrh r1, [r3, 0x2C]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080FAC04
	ldr r1, [r2]
	adds r0, r1, 0
	adds r0, 0x54
	ldrh r0, [r0]
	cmp r0, 0x1B
	bhi _080FAC04
	adds r1, 0x7B
	movs r0, 0x1
	strb r0, [r1]
	movs r4, 0x1
_080FAC04:
	ldrh r3, [r3, 0x2E]
	movs r0, 0x1
	ands r0, r3
	cmp r0, 0
	beq _080FAC1C
	movs r4, 0x4
	b _080FAC26
	.align 2, 0
_080FAC14: .4byte gUnknown_020388CC
_080FAC18: .4byte gMain
_080FAC1C:
	movs r0, 0x2
	ands r0, r3
	cmp r0, 0
	beq _080FAC26
	movs r4, 0x5
_080FAC26:
	cmp r4, 0x1
	bne _080FAC38
	ldr r0, [r2]
	adds r0, 0x7A
	movs r1, 0x4
	strb r1, [r0]
	ldr r1, [r2]
	ldr r0, _080FAC40 @ =_swiopen
	str r0, [r1, 0x18]
_080FAC38:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080FAC40: .4byte _swiopen
	thumb_func_end sub_80FAB78

	thumb_func_start _swiopen
_swiopen: @ 80FAC44
	push {r4,r5,lr}
	ldr r5, _080FAC5C @ =gUnknown_020388CC
	ldr r1, [r5]
	adds r0, r1, 0
	adds r0, 0x7A
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _080FAC60
	movs r0, 0x2
	b _080FACFA
	.align 2, 0
_080FAC5C: .4byte gUnknown_020388CC
_080FAC60:
	adds r0, r1, 0
	adds r0, 0x7B
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	ble _080FAC76
	adds r1, 0x54
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080FAC76:
	ldr r1, [r5]
	adds r0, r1, 0
	adds r0, 0x7B
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bge _080FAC8E
	adds r1, 0x54
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
_080FAC8E:
	ldr r1, [r5]
	adds r0, r1, 0
	adds r0, 0x7C
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	ble _080FACA6
	adds r1, 0x56
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080FACA6:
	ldr r1, [r5]
	adds r0, r1, 0
	adds r0, 0x7C
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bge _080FACBE
	adds r1, 0x56
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
_080FACBE:
	ldr r1, [r5]
	adds r0, r1, 0
	adds r0, 0x54
	ldrh r0, [r0]
	adds r1, 0x56
	ldrh r1, [r1]
	bl GetRegionMapSectionAt
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl sub_80FB758
	ldr r1, [r5]
	strb r0, [r1, 0x16]
	ldr r0, [r5]
	ldrh r1, [r0, 0x14]
	cmp r4, r1
	beq _080FACEE
	strh r4, [r0, 0x14]
	ldrh r1, [r0, 0x14]
	movs r2, 0x10
	bl sub_80FBFB4
_080FACEE:
	bl sub_80FBA18
	ldr r1, [r5]
	ldr r0, _080FAD00 @ =sub_80FAB78
	str r0, [r1, 0x18]
	movs r0, 0x3
_080FACFA:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080FAD00: .4byte sub_80FAB78
	thumb_func_end _swiopen

	thumb_func_start sub_80FAD04
sub_80FAD04: @ 80FAD04
	push {r4-r6,lr}
	movs r4, 0
	ldr r3, _080FADD4 @ =gUnknown_020388CC
	ldr r0, [r3]
	mov r12, r0
	adds r0, 0x6A
	strh r4, [r0]
	mov r5, r12
	adds r5, 0x68
	strh r4, [r5]
	ldr r2, _080FADD8 @ =gMain
	ldrh r1, [r2, 0x2C]
	movs r0, 0x40
	ands r0, r1
	adds r6, r3, 0
	adds r3, r2, 0
	cmp r0, 0
	beq _080FAD3E
	mov r0, r12
	adds r0, 0x5E
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0x34
	negs r0, r0
	cmp r1, r0
	ble _080FAD3E
	ldr r0, _080FADDC @ =0x0000ffff
	strh r0, [r5]
	movs r4, 0x1
_080FAD3E:
	ldrh r1, [r3, 0x2C]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080FAD5E
	ldr r1, [r6]
	adds r0, r1, 0
	adds r0, 0x5E
	movs r5, 0
	ldrsh r0, [r0, r5]
	cmp r0, 0x3B
	bgt _080FAD5E
	adds r1, 0x68
	movs r0, 0x1
	strh r0, [r1]
	movs r4, 0x1
_080FAD5E:
	ldrh r1, [r3, 0x2C]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080FAD84
	ldr r2, [r6]
	adds r0, r2, 0
	adds r0, 0x5C
	movs r5, 0
	ldrsh r1, [r0, r5]
	movs r0, 0x2C
	negs r0, r0
	cmp r1, r0
	ble _080FAD84
	adds r1, r2, 0
	adds r1, 0x6A
	ldr r0, _080FADDC @ =0x0000ffff
	strh r0, [r1]
	movs r4, 0x1
_080FAD84:
	ldrh r1, [r3, 0x2C]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080FADA4
	ldr r1, [r6]
	adds r0, r1, 0
	adds r0, 0x5C
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0xAB
	bgt _080FADA4
	adds r1, 0x6A
	movs r0, 0x1
	strh r0, [r1]
	movs r4, 0x1
_080FADA4:
	ldrh r2, [r3, 0x2E]
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	beq _080FADB0
	movs r4, 0x4
_080FADB0:
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _080FADBA
	movs r4, 0x5
_080FADBA:
	cmp r4, 0x1
	bne _080FADCA
	ldr r0, [r6]
	ldr r1, _080FADE0 @ =sub_80FADE4
	str r1, [r0, 0x18]
	adds r0, 0x6C
	movs r1, 0
	strh r1, [r0]
_080FADCA:
	adds r0, r4, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080FADD4: .4byte gUnknown_020388CC
_080FADD8: .4byte gMain
_080FADDC: .4byte 0x0000ffff
_080FADE0: .4byte sub_80FADE4
	thumb_func_end sub_80FAD04

	thumb_func_start sub_80FADE4
sub_80FADE4: @ 80FADE4
	push {r4,r5,lr}
	ldr r5, _080FAEB4 @ =gUnknown_020388CC
	ldr r2, [r5]
	adds r3, r2, 0
	adds r3, 0x5E
	adds r0, r2, 0
	adds r0, 0x68
	ldrh r0, [r0]
	ldrh r1, [r3]
	adds r0, r1
	strh r0, [r3]
	adds r1, r2, 0
	adds r1, 0x5C
	adds r0, r2, 0
	adds r0, 0x6A
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r2
	strh r0, [r1]
	movs r4, 0
	ldrsh r0, [r1, r4]
	movs r2, 0
	ldrsh r1, [r3, r2]
	bl sub_80FB238
	ldr r2, [r5]
	adds r1, r2, 0
	adds r1, 0x6C
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x8
	bne _080FAEBC
	adds r0, r2, 0
	adds r0, 0x5C
	movs r3, 0
	ldrsh r1, [r0, r3]
	adds r0, r1, 0
	adds r0, 0x2C
	cmp r0, 0
	bge _080FAE3C
	adds r0, 0x7
_080FAE3C:
	asrs r0, 3
	adds r0, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	adds r0, r2, 0
	adds r0, 0x5E
	movs r4, 0
	ldrsh r1, [r0, r4]
	adds r0, r1, 0
	adds r0, 0x34
	cmp r0, 0
	bge _080FAE56
	adds r0, 0x7
_080FAE56:
	asrs r0, 3
	adds r0, 0x2
	lsls r0, 16
	lsrs r1, r0, 16
	adds r4, r2, 0
	adds r4, 0x64
	adds r0, r2, 0
	adds r0, 0x66
	ldrh r2, [r4]
	cmp r3, r2
	bne _080FAE72
	ldrh r2, [r0]
	cmp r1, r2
	beq _080FAEA0
_080FAE72:
	strh r3, [r4]
	strh r1, [r0]
	adds r0, r3, 0
	bl GetRegionMapSectionAt
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl sub_80FB758
	ldr r1, [r5]
	strb r0, [r1, 0x16]
	ldr r0, [r5]
	ldrh r3, [r0, 0x14]
	cmp r4, r3
	beq _080FAE9C
	strh r4, [r0, 0x14]
	ldrh r1, [r0, 0x14]
	movs r2, 0x10
	bl sub_80FBFB4
_080FAE9C:
	bl sub_80FBA18
_080FAEA0:
	ldr r0, _080FAEB4 @ =gUnknown_020388CC
	ldr r2, [r0]
	adds r1, r2, 0
	adds r1, 0x6C
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080FAEB8 @ =sub_80FAD04
	str r0, [r2, 0x18]
	movs r0, 0x3
	b _080FAEBE
	.align 2, 0
_080FAEB4: .4byte gUnknown_020388CC
_080FAEB8: .4byte sub_80FAD04
_080FAEBC:
	movs r0, 0x2
_080FAEBE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80FADE4

	thumb_func_start sub_80FAEC4
sub_80FAEC4: @ 80FAEC4
	push {r4-r6,lr}
	ldr r1, _080FAF40 @ =gUnknown_020388CC
	ldr r2, [r1]
	adds r0, r2, 0
	adds r0, 0x78
	ldrb r3, [r0]
	adds r5, r1, 0
	cmp r3, 0
	bne _080FAF48
	subs r0, 0x1A
	strh r3, [r0]
	subs r0, 0x2
	strh r3, [r0]
	str r3, [r2, 0x40]
	str r3, [r2, 0x3C]
	adds r4, r2, 0
	adds r4, 0x54
	ldrh r0, [r4]
	lsls r0, 3
	subs r0, 0x34
	adds r1, r2, 0
	adds r1, 0x60
	strh r0, [r1]
	movs r0, 0x56
	adds r0, r2
	mov r12, r0
	ldrh r0, [r0]
	lsls r0, 3
	subs r0, 0x44
	adds r3, r2, 0
	adds r3, 0x62
	strh r0, [r3]
	movs r6, 0
	ldrsh r0, [r1, r6]
	lsls r0, 8
	cmp r0, 0
	bge _080FAF10
	adds r0, 0xF
_080FAF10:
	asrs r0, 4
	str r0, [r2, 0x44]
	movs r1, 0
	ldrsh r0, [r3, r1]
	lsls r0, 8
	cmp r0, 0
	bge _080FAF20
	adds r0, 0xF
_080FAF20:
	asrs r0, 4
	str r0, [r2, 0x48]
	ldrh r1, [r4]
	adds r0, r2, 0
	adds r0, 0x64
	strh r1, [r0]
	mov r3, r12
	ldrh r0, [r3]
	adds r1, r2, 0
	adds r1, 0x66
	strh r0, [r1]
	movs r0, 0x80
	lsls r0, 9
	str r0, [r2, 0x4C]
	ldr r0, _080FAF44 @ =0xfffff800
	b _080FAFA6
	.align 2, 0
_080FAF40: .4byte gUnknown_020388CC
_080FAF44: .4byte 0xfffff800
_080FAF48:
	adds r0, r2, 0
	adds r0, 0x5C
	movs r6, 0
	ldrsh r0, [r0, r6]
	lsls r0, 8
	str r0, [r2, 0x3C]
	adds r0, r2, 0
	adds r0, 0x5E
	movs r1, 0
	ldrsh r0, [r0, r1]
	lsls r0, 8
	str r0, [r2, 0x40]
	adds r0, r2, 0
	adds r0, 0x60
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r0, [r2, 0x3C]
	cmp r0, 0
	bge _080FAF74
	adds r0, 0xF
_080FAF74:
	asrs r0, 4
	negs r0, r0
	str r0, [r2, 0x44]
	ldr r0, [r2, 0x40]
	cmp r0, 0
	bge _080FAF82
	adds r0, 0xF
_080FAF82:
	asrs r0, 4
	negs r0, r0
	str r0, [r2, 0x48]
	adds r0, r2, 0
	adds r0, 0x64
	ldrh r1, [r0]
	subs r0, 0x10
	strh r1, [r0]
	adds r0, 0x12
	ldrh r0, [r0]
	adds r1, r2, 0
	adds r1, 0x56
	strh r0, [r1]
	movs r0, 0x80
	lsls r0, 8
	str r0, [r2, 0x4C]
	movs r0, 0x80
	lsls r0, 4
_080FAFA6:
	str r0, [r2, 0x50]
	ldr r0, [r5]
	adds r0, 0x6E
	movs r1, 0
	strh r1, [r0]
	bl sub_80FBCA0
	bl sub_80FBDF8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80FAEC4

	thumb_func_start sub_80FAFC0
sub_80FAFC0: @ 80FAFC0
	push {r4-r6,lr}
	sub sp, 0xC
	ldr r0, _080FAFD8 @ =gUnknown_020388CC
	ldr r3, [r0]
	adds r2, r3, 0
	adds r2, 0x6E
	ldrh r1, [r2]
	adds r5, r0, 0
	cmp r1, 0xF
	bls _080FAFDC
	movs r0, 0
	b _080FB164
	.align 2, 0
_080FAFD8: .4byte gUnknown_020388CC
_080FAFDC:
	adds r0, r1, 0x1
	movs r1, 0
	strh r0, [r2]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x10
	bne _080FB050
	str r1, [r3, 0x44]
	str r1, [r3, 0x48]
	adds r0, r3, 0
	adds r0, 0x60
	ldrh r1, [r0]
	subs r0, 0x4
	strh r1, [r0]
	adds r0, 0x6
	ldrh r0, [r0]
	adds r1, r3, 0
	adds r1, 0x5E
	strh r0, [r1]
	adds r1, 0x1A
	ldrb r0, [r1]
	movs r2, 0x80
	lsls r2, 9
	cmp r0, 0
	bne _080FB012
	movs r2, 0x80
	lsls r2, 8
_080FB012:
	str r2, [r3, 0x4C]
	movs r2, 0
	ldrb r0, [r1]
	cmp r0, 0
	bne _080FB01E
	movs r2, 0x1
_080FB01E:
	strb r2, [r1]
	ldr r1, [r5]
	adds r0, r1, 0
	adds r0, 0x78
	ldrb r0, [r0]
	ldr r2, _080FB048 @ =sub_80FAD04
	cmp r0, 0
	bne _080FB030
	ldr r2, _080FB04C @ =sub_80FAB78
_080FB030:
	str r2, [r1, 0x18]
	adds r0, r1, 0
	adds r0, 0x58
	ldrh r0, [r0]
	adds r1, 0x5A
	ldrh r1, [r1]
	bl sub_80FBB3C
	bl sub_80FBE24
	movs r4, 0
	b _080FB132
	.align 2, 0
_080FB048: .4byte sub_80FAD04
_080FB04C: .4byte sub_80FAB78
_080FB050:
	ldr r2, [r3, 0x3C]
	ldr r0, [r3, 0x44]
	adds r2, r0
	str r2, [r3, 0x3C]
	ldr r0, [r3, 0x40]
	ldr r1, [r3, 0x48]
	adds r0, r1
	str r0, [r3, 0x40]
	asrs r2, 8
	adds r4, r3, 0
	adds r4, 0x5C
	strh r2, [r4]
	ldr r0, [r3, 0x40]
	asrs r0, 8
	adds r1, r3, 0
	adds r1, 0x5E
	strh r0, [r1]
	ldr r0, [r3, 0x4C]
	ldr r1, [r3, 0x50]
	adds r0, r1
	str r0, [r3, 0x4C]
	ldr r2, [r3, 0x44]
	cmp r2, 0
	bge _080FB090
	adds r0, r3, 0
	adds r0, 0x60
	movs r6, 0
	ldrsh r1, [r4, r6]
	movs r6, 0
	ldrsh r0, [r0, r6]
	cmp r1, r0
	blt _080FB0A4
_080FB090:
	cmp r2, 0
	ble _080FB0B4
	adds r0, r3, 0
	adds r0, 0x60
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r6, 0
	ldrsh r0, [r0, r6]
	cmp r1, r0
	ble _080FB0B4
_080FB0A4:
	ldr r3, [r5]
	adds r0, r3, 0
	adds r0, 0x60
	ldrh r2, [r0]
	subs r0, 0x4
	movs r1, 0
	strh r2, [r0]
	str r1, [r3, 0x44]
_080FB0B4:
	ldr r2, [r5]
	ldr r4, [r2, 0x48]
	cmp r4, 0
	bge _080FB0D0
	adds r0, r2, 0
	adds r0, 0x5E
	adds r3, r2, 0
	adds r3, 0x62
	movs r6, 0
	ldrsh r1, [r0, r6]
	movs r6, 0
	ldrsh r0, [r3, r6]
	cmp r1, r0
	blt _080FB0E8
_080FB0D0:
	cmp r4, 0
	ble _080FB0FA
	adds r1, r2, 0
	adds r1, 0x5E
	adds r0, r2, 0
	adds r0, 0x62
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r6, 0
	ldrsh r0, [r0, r6]
	cmp r1, r0
	ble _080FB0FA
_080FB0E8:
	ldr r2, [r5]
	adds r0, r2, 0
	adds r0, 0x62
	ldrh r1, [r0]
	adds r3, r2, 0
	adds r3, 0x5E
	movs r0, 0
	strh r1, [r3]
	str r0, [r2, 0x48]
_080FB0FA:
	ldr r0, _080FB118 @ =gUnknown_020388CC
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x78
	ldrb r3, [r0]
	cmp r3, 0
	bne _080FB120
	ldr r1, [r2, 0x4C]
	ldr r0, _080FB11C @ =0x00007fff
	cmp r1, r0
	bgt _080FB130
	adds r0, 0x1
	str r0, [r2, 0x4C]
	str r3, [r2, 0x50]
	b _080FB130
	.align 2, 0
_080FB118: .4byte gUnknown_020388CC
_080FB11C: .4byte 0x00007fff
_080FB120:
	ldr r0, [r2, 0x4C]
	movs r1, 0x80
	lsls r1, 9
	cmp r0, r1
	ble _080FB130
	str r1, [r2, 0x4C]
	movs r0, 0
	str r0, [r2, 0x50]
_080FB130:
	movs r4, 0x1
_080FB132:
	ldr r0, _080FB16C @ =gUnknown_020388CC
	ldr r3, [r0]
	adds r0, r3, 0
	adds r0, 0x5C
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r1, r3, 0
	adds r1, 0x5E
	movs r2, 0
	ldrsh r1, [r1, r2]
	ldr r2, [r3, 0x4C]
	lsls r2, 8
	lsrs r2, 16
	str r2, [sp]
	ldr r2, [r3, 0x4C]
	lsls r2, 8
	lsrs r2, 16
	str r2, [sp, 0x4]
	movs r2, 0
	str r2, [sp, 0x8]
	movs r2, 0x38
	movs r3, 0x48
	bl sub_80FB170
	adds r0, r4, 0
_080FB164:
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080FB16C: .4byte gUnknown_020388CC
	thumb_func_end sub_80FAFC0

	thumb_func_start sub_80FB170
sub_80FB170: @ 80FB170
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r4, [sp, 0x24]
	ldr r7, [sp, 0x28]
	ldr r5, [sp, 0x2C]
	lsls r4, 16
	lsrs r4, 16
	mov r8, r4
	lsls r7, 16
	adds r4, r7, 0
	lsrs r4, 16
	mov r9, r4
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _080FB230 @ =gUnknown_020388CC
	ldr r6, [r4]
	ldr r7, _080FB234 @ =gSineTable
	mov r12, r7
	adds r4, r5, 0
	adds r4, 0x40
	lsls r4, 1
	add r4, r12
	movs r7, 0
	ldrsh r4, [r4, r7]
	str r4, [sp]
	mov r7, r8
	muls r7, r4
	adds r4, r7, 0
	asrs r4, 8
	mov r10, r4
	str r4, [r6, 0x2C]
	lsls r5, 1
	add r5, r12
	movs r7, 0
	ldrsh r5, [r5, r7]
	negs r4, r5
	mov r7, r8
	muls r7, r4
	adds r4, r7, 0
	asrs r4, 8
	mov r12, r4
	str r4, [r6, 0x30]
	mov r7, r9
	muls r7, r5
	adds r5, r7, 0
	asrs r5, 8
	str r5, [r6, 0x34]
	ldr r7, [sp]
	mov r4, r9
	muls r4, r7
	asrs r4, 8
	mov r8, r4
	str r4, [r6, 0x38]
	lsls r0, 16
	asrs r0, 8
	lsls r2, 16
	asrs r2, 16
	lsls r4, r2, 8
	adds r0, r4
	lsls r3, 16
	asrs r3, 16
	adds r4, r3, 0
	muls r4, r5
	mov r5, r10
	muls r5, r2
	adds r4, r5
	subs r0, r4
	str r0, [r6, 0x24]
	lsls r1, 16
	asrs r1, 8
	lsls r0, r3, 8
	adds r1, r0
	mov r0, r8
	muls r0, r3
	mov r3, r12
	muls r3, r2
	adds r2, r3, 0
	adds r0, r2
	subs r1, r0
	str r1, [r6, 0x28]
	adds r6, 0x7D
	movs r0, 0x1
	strb r0, [r6]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FB230: .4byte gUnknown_020388CC
_080FB234: .4byte gSineTable
	thumb_func_end sub_80FB170

	thumb_func_start sub_80FB238
sub_80FB238: @ 80FB238
	ldr r2, _080FB25C @ =gUnknown_020388CC
	ldr r2, [r2]
	lsls r0, 16
	asrs r0, 8
	movs r3, 0xE0
	lsls r3, 5
	adds r0, r3
	str r0, [r2, 0x24]
	lsls r1, 16
	asrs r1, 8
	movs r0, 0x90
	lsls r0, 6
	adds r1, r0
	str r1, [r2, 0x28]
	adds r2, 0x7D
	movs r0, 0x1
	strb r0, [r2]
	bx lr
	.align 2, 0
_080FB25C: .4byte gUnknown_020388CC
	thumb_func_end sub_80FB238

	thumb_func_start sub_80FB260
sub_80FB260: @ 80FB260
	push {lr}
	ldr r0, _080FB29C @ =gUnknown_020388CC
	ldr r2, [r0]
	adds r3, r2, 0
	adds r3, 0x7D
	ldrb r0, [r3]
	cmp r0, 0
	beq _080FB298
	ldr r1, _080FB2A0 @ =REG_BG2PA
	ldr r0, [r2, 0x2C]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, [r2, 0x34]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, [r2, 0x30]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, [r2, 0x38]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, [r2, 0x24]
	str r0, [r1]
	adds r1, 0x4
	ldr r0, [r2, 0x28]
	str r0, [r1]
	movs r0, 0
	strb r0, [r3]
_080FB298:
	pop {r0}
	bx r0
	.align 2, 0
_080FB29C: .4byte gUnknown_020388CC
_080FB2A0: .4byte REG_BG2PA
	thumb_func_end sub_80FB260

	thumb_func_start sub_80FB2A4
sub_80FB2A4: @ 80FB2A4
	push {r4,r5,lr}
	sub sp, 0xC
	lsls r0, 16
	asrs r4, r0, 16
	lsls r1, 16
	asrs r5, r1, 16
	movs r0, 0x80
	lsls r0, 1
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x38
	movs r3, 0x48
	bl sub_80FB170
	bl sub_80FB260
	ldr r0, _080FB2E8 @ =gUnknown_020388CC
	ldr r2, [r0]
	ldr r1, [r2, 0x20]
	cmp r1, 0
	beq _080FB2E0
	negs r0, r4
	strh r0, [r1, 0x24]
	ldr r1, [r2, 0x20]
	negs r0, r5
	strh r0, [r1, 0x26]
_080FB2E0:
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FB2E8: .4byte gUnknown_020388CC
	thumb_func_end sub_80FB2A4

	thumb_func_start GetRegionMapSectionAt
GetRegionMapSectionAt: @ 80FB2EC
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	ldr r0, _080FB30C @ =0xfffe0000
	adds r1, r0
	lsrs r2, r1, 16
	cmp r2, 0xE
	bhi _080FB306
	cmp r3, 0
	beq _080FB306
	cmp r3, 0x1C
	bls _080FB310
_080FB306:
	movs r0, 0x58
	b _080FB324
	.align 2, 0
_080FB30C: .4byte 0xfffe0000
_080FB310:
	subs r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r1, _080FB328 @ =gRegionMapSections
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r3, r0
	adds r0, r1
	ldrb r0, [r0]
_080FB324:
	pop {r1}
	bx r1
	.align 2, 0
_080FB328: .4byte gRegionMapSections
	thumb_func_end GetRegionMapSectionAt

	thumb_func_start sub_80FB32C
sub_80FB32C: @ 80FB32C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r0, _080FB358 @ =gSaveBlock1
	movs r1, 0x4
	ldrsb r1, [r0, r1]
	adds r2, r0, 0
	cmp r1, 0x19
	bne _080FB35C
	ldrb r0, [r2, 0x5]
	subs r0, 0x29
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bhi _080FB35C
	bl sub_80FB600
	b _080FB5E8
	.align 2, 0
_080FB358: .4byte gSaveBlock1
_080FB35C:
	movs r0, 0x4
	ldrsb r0, [r2, r0]
	movs r1, 0x5
	ldrsb r1, [r2, r1]
	bl get_map_light_level_by_bank_and_number
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x8
	bhi _080FB3A4
	lsls r0, 2
	ldr r1, _080FB37C @ =_080FB380
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FB37C: .4byte _080FB380
	.align 2, 0
_080FB380:
	.4byte _080FB3A4
	.4byte _080FB3A4
	.4byte _080FB3A4
	.4byte _080FB3E0
	.4byte _080FB3A4
	.4byte _080FB3A4
	.4byte _080FB3E0
	.4byte _080FB464
	.4byte _080FB428
_080FB3A4:
	ldr r4, _080FB3D4 @ =gUnknown_020388CC
	ldr r0, [r4]
	ldr r3, _080FB3D8 @ =gMapHeader
	ldrb r1, [r3, 0x14]
	movs r2, 0
	strh r1, [r0, 0x14]
	adds r0, 0x7F
	strb r2, [r0]
	ldr r0, [r3]
	ldrh r2, [r0]
	ldrh r0, [r0, 0x4]
	mov r8, r0
	ldr r0, _080FB3DC @ =gSaveBlock1
	ldrh r6, [r0]
	ldrh r3, [r0, 0x2]
	ldr r1, [r4]
	ldrh r0, [r1, 0x14]
	cmp r0, 0x45
	beq _080FB3CC
	b _080FB4CC
_080FB3CC:
	adds r1, 0x7F
	movs r0, 0x1
	strb r0, [r1]
	b _080FB4CC
	.align 2, 0
_080FB3D4: .4byte gUnknown_020388CC
_080FB3D8: .4byte gMapHeader
_080FB3DC: .4byte gSaveBlock1
_080FB3E0:
	ldr r4, _080FB420 @ =gSaveBlock1
	adds r0, r4, 0
	adds r0, 0x24
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0
	adds r1, 0x25
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	adds r2, r0, 0
	ldr r0, _080FB424 @ =gUnknown_020388CC
	ldr r0, [r0]
	ldrb r1, [r2, 0x14]
	strh r1, [r0, 0x14]
	adds r0, 0x7F
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, [r2]
	ldrh r2, [r0]
	ldrh r0, [r0, 0x4]
	mov r8, r0
	ldrh r6, [r4, 0x28]
	ldrh r3, [r4, 0x2A]
	b _080FB4CC
	.align 2, 0
_080FB420: .4byte gSaveBlock1
_080FB424: .4byte gUnknown_020388CC
_080FB428:
	ldr r4, _080FB45C @ =gSaveBlock1
	movs r0, 0x14
	ldrsb r0, [r4, r0]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x15
	ldrsb r1, [r4, r1]
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	adds r2, r0, 0
	ldr r0, _080FB460 @ =gUnknown_020388CC
	ldr r0, [r0]
	ldrb r1, [r2, 0x14]
	strh r1, [r0, 0x14]
	adds r0, 0x7F
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, [r2]
	ldrh r2, [r0]
	ldrh r0, [r0, 0x4]
	mov r8, r0
	ldrh r6, [r4, 0x18]
	ldrh r3, [r4, 0x1A]
	b _080FB4CC
	.align 2, 0
_080FB45C: .4byte gSaveBlock1
_080FB460: .4byte gUnknown_020388CC
_080FB464:
	ldr r5, _080FB48C @ =gUnknown_020388CC
	ldr r0, [r5]
	ldr r1, _080FB490 @ =gMapHeader
	ldrb r1, [r1, 0x14]
	strh r1, [r0, 0x14]
	cmp r1, 0x57
	beq _080FB498
	ldr r4, _080FB494 @ =gSaveBlock1 + 0x24
	movs r0, 0
	ldrsb r0, [r4, r0]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ldrsb r1, [r4, r1]
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	adds r2, r0, 0
	b _080FB4B6
	.align 2, 0
_080FB48C: .4byte gUnknown_020388CC
_080FB490: .4byte gMapHeader
_080FB494: .4byte gSaveBlock1 + 0x24
_080FB498:
	ldr r4, _080FB548 @ =gSaveBlock1 + 0x14
	movs r0, 0
	ldrsb r0, [r4, r0]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ldrsb r1, [r4, r1]
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	adds r2, r0, 0
	ldr r1, [r5]
	ldrb r0, [r2, 0x14]
	strh r0, [r1, 0x14]
_080FB4B6:
	ldr r0, _080FB54C @ =gUnknown_020388CC
	ldr r0, [r0]
	adds r0, 0x7F
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	ldrh r2, [r0]
	ldrh r0, [r0, 0x4]
	mov r8, r0
	ldrh r6, [r4, 0x4]
	ldrh r3, [r4, 0x6]
_080FB4CC:
	mov r9, r6
	ldr r4, _080FB54C @ =gUnknown_020388CC
	ldr r0, [r4]
	ldrh r5, [r0, 0x14]
	lsls r0, r5, 3
	ldr r1, _080FB550 @ =gRegionMapLocations
	adds r0, r1
	mov r10, r0
	ldrb r7, [r0, 0x2]
	adds r0, r2, 0
	adds r1, r7, 0
	str r3, [sp]
	bl __divsi3
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r3, [sp]
	cmp r1, 0
	bne _080FB4F4
	movs r1, 0x1
_080FB4F4:
	adds r0, r6, 0
	str r3, [sp]
	bl __udivsi3
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r3, [sp]
	cmp r6, r7
	bcc _080FB50C
	subs r0, r7, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_080FB50C:
	mov r2, r10
	ldrb r4, [r2, 0x3]
	mov r0, r8
	adds r1, r4, 0
	str r3, [sp]
	bl __divsi3
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r3, [sp]
	cmp r1, 0
	bne _080FB526
	movs r1, 0x1
_080FB526:
	adds r0, r3, 0
	bl __udivsi3
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r4
	bcc _080FB53A
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
_080FB53A:
	cmp r5, 0x24
	beq _080FB59C
	cmp r5, 0x24
	bgt _080FB554
	cmp r5, 0x1D
	beq _080FB55E
	b _080FB5BE
	.align 2, 0
_080FB548: .4byte gSaveBlock1 + 0x14
_080FB54C: .4byte gUnknown_020388CC
_080FB550: .4byte gRegionMapLocations
_080FB554:
	cmp r5, 0x29
	beq _080FB566
	cmp r5, 0x33
	beq _080FB566
	b _080FB5BE
_080FB55E:
	cmp r3, 0
	beq _080FB5BE
	movs r6, 0
	b _080FB5BE
_080FB566:
	movs r6, 0
	ldr r1, _080FB598 @ =gSaveBlock1
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0x20
	ble _080FB574
	movs r6, 0x1
_080FB574:
	cmp r0, 0x33
	ble _080FB57E
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_080FB57E:
	movs r3, 0
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	cmp r0, 0x25
	ble _080FB58A
	movs r3, 0x1
_080FB58A:
	cmp r0, 0x38
	ble _080FB5BE
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	b _080FB5BE
	.align 2, 0
_080FB598: .4byte gSaveBlock1
_080FB59C:
	movs r6, 0
	mov r0, r9
	cmp r0, 0xE
	bls _080FB5A6
	movs r6, 0x1
_080FB5A6:
	mov r1, r9
	cmp r1, 0x1C
	bls _080FB5B2
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_080FB5B2:
	mov r2, r9
	cmp r2, 0x36
	bls _080FB5BE
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_080FB5BE:
	ldr r0, _080FB5F8 @ =gUnknown_020388CC
	ldr r2, [r0]
	ldrh r0, [r2, 0x14]
	lsls r0, 3
	ldr r1, _080FB5FC @ =gRegionMapLocations
	adds r0, r1
	ldrb r0, [r0]
	adds r0, r6, r0
	adds r0, 0x1
	adds r1, r2, 0
	adds r1, 0x54
	strh r0, [r1]
	ldrh r0, [r2, 0x14]
	lsls r0, 3
	ldr r1, _080FB5FC @ =gRegionMapLocations
	adds r0, r1
	ldrb r0, [r0, 0x1]
	adds r0, r3, r0
	adds r0, 0x2
	adds r2, 0x56
	strh r0, [r2]
_080FB5E8:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FB5F8: .4byte gUnknown_020388CC
_080FB5FC: .4byte gRegionMapLocations
	thumb_func_end sub_80FB32C

	thumb_func_start sub_80FB600
sub_80FB600: @ 80FB600
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r7, 0
	movs r0, 0
	mov r8, r0
	mov r4, sp
	adds r4, 0x1
	mov r5, sp
	adds r5, 0x2
	add r6, sp, 0x4
	mov r0, sp
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl GetSSTidalLocation
	lsls r0, 24
	lsrs r0, 24
	mov r10, r5
	cmp r0, 0x4
	bhi _080FB694
	lsls r0, 2
	ldr r1, _080FB63C @ =_080FB640
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FB63C: .4byte _080FB640
	.align 2, 0
_080FB640:
	.4byte _080FB694
	.4byte _080FB654
	.4byte _080FB664
	.4byte _080FB674
	.4byte _080FB684
_080FB654:
	ldr r2, _080FB660 @ =gUnknown_020388CC
	ldr r1, [r2]
	movs r0, 0x8
	strh r0, [r1, 0x14]
	b _080FB710
	.align 2, 0
_080FB660: .4byte gUnknown_020388CC
_080FB664:
	ldr r2, _080FB670 @ =gUnknown_020388CC
	ldr r1, [r2]
	movs r0, 0xC
	strh r0, [r1, 0x14]
	b _080FB710
	.align 2, 0
_080FB670: .4byte gUnknown_020388CC
_080FB674:
	ldr r2, _080FB680 @ =gUnknown_020388CC
	ldr r1, [r2]
	movs r0, 0x27
	strh r0, [r1, 0x14]
	b _080FB710
	.align 2, 0
_080FB680: .4byte gUnknown_020388CC
_080FB684:
	ldr r2, _080FB690 @ =gUnknown_020388CC
	ldr r1, [r2]
	movs r0, 0x2E
	strh r0, [r1, 0x14]
	b _080FB710
	.align 2, 0
_080FB690: .4byte gUnknown_020388CC
_080FB694:
	mov r0, sp
	ldrb r0, [r0]
	ldrb r1, [r4]
	bl get_mapheader_by_bank_and_number
	ldr r1, _080FB750 @ =gUnknown_020388CC
	mov r9, r1
	ldr r2, [r1]
	ldrb r1, [r0, 0x14]
	strh r1, [r2, 0x14]
	ldr r6, [r0]
	ldr r1, _080FB754 @ =gRegionMapLocations
	ldrh r0, [r2, 0x14]
	lsls r0, 3
	adds r5, r0, r1
	ldrb r4, [r5, 0x2]
	ldr r0, [r6]
	adds r1, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _080FB6C6
	movs r1, 0x1
_080FB6C6:
	mov r2, r10
	movs r3, 0
	ldrsh r0, [r2, r3]
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r8, r4
	bcc _080FB6E2
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
_080FB6E2:
	ldrb r4, [r5, 0x3]
	ldr r0, [r6, 0x4]
	adds r1, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _080FB6F6
	movs r1, 0x1
_080FB6F6:
	mov r2, sp
	movs r3, 0x4
	ldrsh r0, [r2, r3]
	bl __divsi3
	lsls r0, 16
	lsrs r7, r0, 16
	mov r2, r9
	cmp r7, r4
	bcc _080FB710
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
_080FB710:
	ldr r0, [r2]
	adds r0, 0x7F
	movs r1, 0
	strb r1, [r0]
	ldr r2, [r2]
	ldr r3, _080FB754 @ =gRegionMapLocations
	ldrh r0, [r2, 0x14]
	lsls r0, 3
	adds r0, r3
	ldrb r0, [r0]
	add r0, r8
	adds r0, 0x1
	adds r1, r2, 0
	adds r1, 0x54
	strh r0, [r1]
	ldrh r0, [r2, 0x14]
	lsls r0, 3
	adds r0, r3
	ldrb r0, [r0, 0x1]
	adds r0, r7, r0
	adds r0, 0x2
	adds r2, 0x56
	strh r0, [r2]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FB750: .4byte gUnknown_020388CC
_080FB754: .4byte gRegionMapLocations
	thumb_func_end sub_80FB600

	thumb_func_start sub_80FB758
sub_80FB758: @ 80FB758
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x58
	bls _080FB764
	b _080FB9A0
_080FB764:
	lsls r0, 2
	ldr r1, _080FB770 @ =_080FB774
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FB770: .4byte _080FB774
	.align 2, 0
_080FB774:
	.4byte _080FB8DC
	.4byte _080FB8E4
	.4byte _080FB8EA
	.4byte _080FB8F4
	.4byte _080FB8FC
	.4byte _080FB904
	.4byte _080FB90C
	.4byte _080FB914
	.4byte _080FB91C
	.4byte _080FB924
	.4byte _080FB92C
	.4byte _080FB934
	.4byte _080FB93C
	.4byte _080FB944
	.4byte _080FB94C
	.4byte _080FB954
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB96C
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB988
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB9A0
	.4byte _080FB8D8
_080FB8D8:
	movs r0, 0
	b _080FB9A2
_080FB8DC:
	ldr r0, _080FB8E0 @ =0x0000080f
	b _080FB956
	.align 2, 0
_080FB8E0: .4byte 0x0000080f
_080FB8E4:
	movs r0, 0x81
	lsls r0, 4
	b _080FB956
_080FB8EA:
	ldr r0, _080FB8F0 @ =0x00000811
	b _080FB956
	.align 2, 0
_080FB8F0: .4byte 0x00000811
_080FB8F4:
	ldr r0, _080FB8F8 @ =0x00000812
	b _080FB956
	.align 2, 0
_080FB8F8: .4byte 0x00000812
_080FB8FC:
	ldr r0, _080FB900 @ =0x00000813
	b _080FB956
	.align 2, 0
_080FB900: .4byte 0x00000813
_080FB904:
	ldr r0, _080FB908 @ =0x00000814
	b _080FB956
	.align 2, 0
_080FB908: .4byte 0x00000814
_080FB90C:
	ldr r0, _080FB910 @ =0x00000815
	b _080FB956
	.align 2, 0
_080FB910: .4byte 0x00000815
_080FB914:
	ldr r0, _080FB918 @ =0x00000816
	b _080FB956
	.align 2, 0
_080FB918: .4byte 0x00000816
_080FB91C:
	ldr r0, _080FB920 @ =0x00000817
	b _080FB956
	.align 2, 0
_080FB920: .4byte 0x00000817
_080FB924:
	ldr r0, _080FB928 @ =0x00000818
	b _080FB956
	.align 2, 0
_080FB928: .4byte 0x00000818
_080FB92C:
	ldr r0, _080FB930 @ =0x00000819
	b _080FB956
	.align 2, 0
_080FB930: .4byte 0x00000819
_080FB934:
	ldr r0, _080FB938 @ =0x0000081a
	b _080FB956
	.align 2, 0
_080FB938: .4byte 0x0000081a
_080FB93C:
	ldr r0, _080FB940 @ =0x0000081b
	b _080FB956
	.align 2, 0
_080FB940: .4byte 0x0000081b
_080FB944:
	ldr r0, _080FB948 @ =0x0000081c
	b _080FB956
	.align 2, 0
_080FB948: .4byte 0x0000081c
_080FB94C:
	ldr r0, _080FB950 @ =0x0000081d
	b _080FB956
	.align 2, 0
_080FB950: .4byte 0x0000081d
_080FB954:
	ldr r0, _080FB968 @ =0x0000081e
_080FB956:
	bl FlagGet
	lsls r0, 24
	movs r1, 0x3
	cmp r0, 0
	beq _080FB964
	movs r1, 0x2
_080FB964:
	adds r0, r1, 0
	b _080FB9A2
	.align 2, 0
_080FB968: .4byte 0x0000081e
_080FB96C:
	ldr r0, _080FB984 @ =0x00000848
	bl FlagGet
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	negs r0, r1
	orrs r0, r1
	asrs r0, 31
	movs r1, 0x4
	ands r0, r1
	b _080FB9A2
	.align 2, 0
_080FB984: .4byte 0x00000848
_080FB988:
	ldr r0, _080FB99C @ =0x00000849
	bl FlagGet
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	b _080FB9A2
	.align 2, 0
_080FB99C: .4byte 0x00000849
_080FB9A0:
	movs r0, 0x1
_080FB9A2:
	pop {r1}
	bx r1
	thumb_func_end sub_80FB758

	thumb_func_start GetRegionMapSectionAt_
GetRegionMapSectionAt_: @ 80FB9A8
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	bl GetRegionMapSectionAt
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end GetRegionMapSectionAt_

	thumb_func_start sub_80FB9C0
sub_80FB9C0: @ 80FB9C0
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	ldr r0, _080FB9E8 @ =gUnknown_083E7684
	ldrh r1, [r0]
	adds r4, r0, 0
	cmp r1, 0x58
	beq _080FB9FC
	adds r5, r4, 0
	adds r6, r4, 0x2
_080FB9D6:
	lsls r1, r2, 2
	adds r0, r1, r5
	ldrh r0, [r0]
	cmp r0, r3
	bne _080FB9EC
	adds r0, r1, r6
	ldrh r0, [r0]
	b _080FB9FE
	.align 2, 0
_080FB9E8: .4byte gUnknown_083E7684
_080FB9EC:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r0, r2, 2
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, 0x58
	bne _080FB9D6
_080FB9FC:
	adds r0, r3, 0
_080FB9FE:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80FB9C0

	thumb_func_start sub_80FBA04
sub_80FBA04: @ 80FBA04
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl sub_80FB9C0
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_80FBA04

	thumb_func_start sub_80FBA18
sub_80FBA18: @ 80FBA18
	push {r4-r6,lr}
	ldr r0, _080FBA2C @ =gUnknown_020388CC
	ldr r1, [r0]
	ldrh r0, [r1, 0x14]
	cmp r0, 0x58
	bne _080FBA30
	movs r0, 0
	strb r0, [r1, 0x17]
	b _080FBA96
	.align 2, 0
_080FBA2C: .4byte gUnknown_020388CC
_080FBA30:
	adds r0, r1, 0
	adds r0, 0x78
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FBA40
	adds r0, r1, 0
	adds r0, 0x54
	b _080FBA44
_080FBA40:
	adds r0, r1, 0
	adds r0, 0x64
_080FBA44:
	ldrh r4, [r0]
	adds r0, 0x2
	ldrh r5, [r0]
	movs r6, 0
	b _080FBA70
_080FBA4E:
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetRegionMapSectionAt
	ldr r1, _080FBA8C @ =gUnknown_020388CC
	ldr r1, [r1]
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r1, 0x14]
	cmp r0, r1
	bne _080FBA70
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_080FBA70:
	cmp r4, 0x1
	bhi _080FBA4E
	adds r0, r5, 0
	bl sub_80FBAA0
	lsls r0, 24
	cmp r0, 0
	beq _080FBA90
	subs r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	movs r4, 0x1D
	b _080FBA70
	.align 2, 0
_080FBA8C: .4byte gUnknown_020388CC
_080FBA90:
	ldr r0, _080FBA9C @ =gUnknown_020388CC
	ldr r0, [r0]
	strb r6, [r0, 0x17]
_080FBA96:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FBA9C: .4byte gUnknown_020388CC
	thumb_func_end sub_80FBA18

	thumb_func_start sub_80FBAA0
sub_80FBAA0: @ 80FBAA0
	push {r4,r5,lr}
	lsls r0, 16
	ldr r1, _080FBAB4 @ =0xffff0000
	adds r0, r1
	lsrs r5, r0, 16
	ldr r0, _080FBAB8 @ =0x0000ffff
	cmp r5, r0
	bne _080FBAC0
	b _080FBAE2
	.align 2, 0
_080FBAB4: .4byte 0xffff0000
_080FBAB8: .4byte 0x0000ffff
_080FBABC:
	movs r0, 0x1
	b _080FBAE4
_080FBAC0:
	movs r4, 0x1
_080FBAC2:
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetRegionMapSectionAt
	ldr r1, _080FBAEC @ =gUnknown_020388CC
	ldr r1, [r1]
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r1, 0x14]
	cmp r0, r1
	beq _080FBABC
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1C
	bls _080FBAC2
_080FBAE2:
	movs r0, 0
_080FBAE4:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080FBAEC: .4byte gUnknown_020388CC
	thumb_func_end sub_80FBAA0

	thumb_func_start sub_80FBAF0
sub_80FBAF0: @ 80FBAF0
	push {r4,lr}
	adds r2, r0, 0
	ldr r0, _080FBB34 @ =gUnknown_020388CC
	ldr r1, [r0]
	adds r3, r1, 0
	adds r3, 0x7A
	movs r0, 0
	ldrsb r0, [r3, r0]
	cmp r0, 0
	beq _080FBB2E
	adds r0, r1, 0
	adds r0, 0x7B
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 1
	ldrh r4, [r2, 0x20]
	adds r0, r4
	strh r0, [r2, 0x20]
	adds r0, r1, 0
	adds r0, 0x7C
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 1
	ldrh r1, [r2, 0x22]
	adds r0, r1
	strh r0, [r2, 0x22]
	ldrb r0, [r3]
	subs r0, 0x1
	strb r0, [r3]
_080FBB2E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FBB34: .4byte gUnknown_020388CC
	thumb_func_end sub_80FBAF0

	thumb_func_start nullsub_66
nullsub_66: @ 80FBB38
	bx lr
	thumb_func_end nullsub_66

	thumb_func_start sub_80FBB3C
sub_80FBB3C: @ 80FBB3C
	push {r4-r7,lr}
	sub sp, 0x28
	lsls r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	ldr r1, _080FBBAC @ =gUnknown_083E76E8
	ldr r2, [r1, 0x4]
	ldr r1, [r1]
	str r1, [sp, 0x20]
	str r2, [sp, 0x24]
	mov r2, sp
	ldr r1, _080FBBB0 @ =gSpriteTemplate_83E76F0
	ldm r1!, {r3-r5}
	stm r2!, {r3-r5}
	ldm r1!, {r3-r5}
	stm r2!, {r3-r5}
	lsrs r3, r0, 16
	add r2, sp, 0x18
	ldrh r1, [r2, 0x4]
	orrs r1, r0
	str r1, [r2, 0x4]
	mov r0, sp
	strh r3, [r0]
	ldr r0, _080FBBB4 @ =gUnknown_020388CC
	ldr r4, [r0]
	adds r0, r4, 0
	adds r0, 0x58
	strh r3, [r0]
	ldr r5, _080FBBB8 @ =0xffff0000
	add r1, sp, 0x20
	ldr r0, [r1, 0x4]
	ands r0, r5
	orrs r0, r6
	str r0, [r1, 0x4]
	mov r0, sp
	strh r6, [r0, 0x2]
	adds r3, r4, 0
	adds r0, r3, 0
	adds r0, 0x5A
	strh r6, [r0]
	adds r0, 0x1E
	ldrb r0, [r0]
	adds r7, r1, 0
	cmp r0, 0
	bne _080FBBC0
	movs r1, 0xC0
	lsls r1, 1
	adds r0, r3, r1
	str r0, [sp, 0x18]
	ldr r0, [r2, 0x4]
	ands r0, r5
	subs r1, 0x80
	orrs r0, r1
	str r0, [r2, 0x4]
	ldr r0, _080FBBBC @ =sub_80FBAF0
	b _080FBBD6
	.align 2, 0
_080FBBAC: .4byte gUnknown_083E76E8
_080FBBB0: .4byte gSpriteTemplate_83E76F0
_080FBBB4: .4byte gUnknown_020388CC
_080FBBB8: .4byte 0xffff0000
_080FBBBC: .4byte sub_80FBAF0
_080FBBC0:
	movs r3, 0xA0
	lsls r3, 2
	adds r0, r4, r3
	str r0, [sp, 0x18]
	ldr r0, [r2, 0x4]
	ands r0, r5
	movs r1, 0xC0
	lsls r1, 3
	orrs r0, r1
	str r0, [r2, 0x4]
	ldr r0, _080FBC38 @ =nullsub_66
_080FBBD6:
	str r0, [sp, 0x14]
	adds r0, r2, 0
	bl LoadSpriteSheet
	adds r0, r7, 0
	bl LoadSpritePalette
	mov r0, sp
	movs r1, 0x38
	movs r2, 0x48
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080FBC90
	ldr r4, _080FBC3C @ =gUnknown_020388CC
	ldr r2, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080FBC40 @ =gSprites
	adds r3, r0, r1
	str r3, [r2, 0x1C]
	adds r2, 0x78
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _080FBC44
	ldrb r1, [r3, 0x3]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r3, 0x3]
	ldr r2, [r4]
	ldr r1, [r2, 0x1C]
	ldrh r0, [r1, 0x20]
	subs r0, 0x8
	strh r0, [r1, 0x20]
	ldr r1, [r2, 0x1C]
	ldrh r0, [r1, 0x22]
	subs r0, 0x8
	strh r0, [r1, 0x22]
	ldr r0, [r2, 0x1C]
	movs r1, 0x1
	bl StartSpriteAnim
	b _080FBC6C
	.align 2, 0
_080FBC38: .4byte nullsub_66
_080FBC3C: .4byte gUnknown_020388CC
_080FBC40: .4byte gSprites
_080FBC44:
	ldrb r1, [r3, 0x3]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r3, 0x3]
	ldr r1, [r4]
	ldr r2, [r1, 0x1C]
	adds r0, r1, 0
	adds r0, 0x54
	ldrh r0, [r0]
	lsls r0, 3
	adds r0, 0x4
	strh r0, [r2, 0x20]
	ldr r2, [r1, 0x1C]
	adds r1, 0x56
	ldrh r0, [r1]
	lsls r0, 3
	adds r0, 0x4
	strh r0, [r2, 0x22]
_080FBC6C:
	ldr r4, _080FBC98 @ =gUnknown_020388CC
	ldr r0, [r4]
	ldr r1, [r0, 0x1C]
	movs r0, 0x2
	strh r0, [r1, 0x30]
	adds r0, r6, 0
	bl IndexOfSpritePaletteTag
	ldr r1, [r4]
	ldr r2, [r1, 0x1C]
	lsls r0, 24
	lsrs r0, 20
	ldr r4, _080FBC9C @ =0x00000101
	adds r0, r4
	strh r0, [r2, 0x32]
	ldr r1, [r1, 0x1C]
	movs r0, 0x1
	strh r0, [r1, 0x34]
_080FBC90:
	add sp, 0x28
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FBC98: .4byte gUnknown_020388CC
_080FBC9C: .4byte 0x00000101
	thumb_func_end sub_80FBB3C

	thumb_func_start sub_80FBCA0
sub_80FBCA0: @ 80FBCA0
	push {r4,lr}
	ldr r4, _080FBCCC @ =gUnknown_020388CC
	ldr r0, [r4]
	ldr r0, [r0, 0x1C]
	cmp r0, 0
	beq _080FBCC4
	bl DestroySprite
	ldr r0, [r4]
	adds r0, 0x58
	ldrh r0, [r0]
	bl FreeSpriteTilesByTag
	ldr r0, [r4]
	adds r0, 0x5A
	ldrh r0, [r0]
	bl FreeSpritePaletteByTag
_080FBCC4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FBCCC: .4byte gUnknown_020388CC
	thumb_func_end sub_80FBCA0

	thumb_func_start unref_sub_80FBCD0
unref_sub_80FBCD0: @ 80FBCD0
	ldr r0, _080FBCDC @ =gUnknown_020388CC
	ldr r0, [r0]
	ldr r1, [r0, 0x1C]
	movs r0, 0x1
	strh r0, [r1, 0x34]
	bx lr
	.align 2, 0
_080FBCDC: .4byte gUnknown_020388CC
	thumb_func_end unref_sub_80FBCD0

	thumb_func_start unref_sub_80FBCE0
unref_sub_80FBCE0: @ 80FBCE0
	ldr r0, _080FBCEC @ =gUnknown_020388CC
	ldr r0, [r0]
	ldr r1, [r0, 0x1C]
	movs r0, 0
	strh r0, [r1, 0x34]
	bx lr
	.align 2, 0
_080FBCEC: .4byte gUnknown_020388CC
	thumb_func_end unref_sub_80FBCE0

	thumb_func_start sub_80FBCF0
sub_80FBCF0: @ 80FBCF0
	push {r4,r5,lr}
	sub sp, 0x28
	lsls r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _080FBD98 @ =gRegionMapBrendanIconTiles
	str r2, [sp, 0x18]
	movs r2, 0x80
	add r5, sp, 0x18
	lsrs r3, r0, 16
	orrs r0, r2
	str r0, [r5, 0x4]
	ldr r0, _080FBD9C @ =gRegionMapBrendanIconPalette
	str r0, [sp, 0x20]
	ldr r2, _080FBDA0 @ =0xffff0000
	add r4, sp, 0x20
	ldr r0, [r4, 0x4]
	ands r0, r2
	orrs r0, r1
	str r0, [r4, 0x4]
	mov r0, sp
	movs r2, 0
	strh r3, [r0]
	strh r1, [r0, 0x2]
	ldr r0, _080FBDA4 @ =gOamData_083E7708
	str r0, [sp, 0x4]
	ldr r0, _080FBDA8 @ =gSpriteAnimTable_083E7718
	str r0, [sp, 0x8]
	str r2, [sp, 0xC]
	ldr r0, _080FBDAC @ =gDummySpriteAffineAnimTable
	str r0, [sp, 0x10]
	ldr r0, _080FBDB0 @ =SpriteCallbackDummy
	str r0, [sp, 0x14]
	ldr r0, _080FBDB4 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	cmp r0, 0x1
	bne _080FBD42
	ldr r0, _080FBDB8 @ =gRegionMapMayIconTiles
	str r0, [sp, 0x18]
	ldr r0, _080FBDBC @ =gRegionMapMayIconPalette
	str r0, [sp, 0x20]
_080FBD42:
	adds r0, r5, 0
	bl LoadSpriteSheet
	adds r0, r4, 0
	bl LoadSpritePalette
	mov r0, sp
	movs r1, 0
	movs r2, 0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080FBDC0 @ =gUnknown_020388CC
	ldr r2, [r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _080FBDC4 @ =gSprites
	adds r1, r0
	str r1, [r2, 0x20]
	adds r0, r2, 0
	adds r0, 0x78
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FBDCC
	adds r0, r2, 0
	adds r0, 0x74
	ldrh r0, [r0]
	lsls r0, 3
	adds r0, 0x4
	strh r0, [r1, 0x20]
	ldr r1, [r2, 0x20]
	adds r0, r2, 0
	adds r0, 0x76
	ldrh r0, [r0]
	lsls r0, 3
	adds r0, 0x4
	strh r0, [r1, 0x22]
	ldr r1, [r2, 0x20]
	ldr r0, _080FBDC8 @ =sub_80FBF34
	b _080FBDEA
	.align 2, 0
_080FBD98: .4byte gRegionMapBrendanIconTiles
_080FBD9C: .4byte gRegionMapBrendanIconPalette
_080FBDA0: .4byte 0xffff0000
_080FBDA4: .4byte gOamData_083E7708
_080FBDA8: .4byte gSpriteAnimTable_083E7718
_080FBDAC: .4byte gDummySpriteAffineAnimTable
_080FBDB0: .4byte SpriteCallbackDummy
_080FBDB4: .4byte gSaveBlock2
_080FBDB8: .4byte gRegionMapMayIconTiles
_080FBDBC: .4byte gRegionMapMayIconPalette
_080FBDC0: .4byte gUnknown_020388CC
_080FBDC4: .4byte gSprites
_080FBDC8: .4byte sub_80FBF34
_080FBDCC:
	adds r0, r2, 0
	adds r0, 0x74
	ldrh r0, [r0]
	lsls r0, 4
	subs r0, 0x30
	strh r0, [r1, 0x20]
	ldr r1, [r2, 0x20]
	adds r0, r2, 0
	adds r0, 0x76
	ldrh r0, [r0]
	lsls r0, 4
	subs r0, 0x42
	strh r0, [r1, 0x22]
	ldr r1, [r2, 0x20]
	ldr r0, _080FBDF4 @ =sub_80FBEA4
_080FBDEA:
	str r0, [r1, 0x1C]
	add sp, 0x28
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FBDF4: .4byte sub_80FBEA4
	thumb_func_end sub_80FBCF0

	thumb_func_start sub_80FBDF8
sub_80FBDF8: @ 80FBDF8
	push {lr}
	ldr r3, _080FBE1C @ =gUnknown_020388CC
	ldr r0, [r3]
	ldr r2, [r0, 0x20]
	cmp r2, 0
	beq _080FBE16
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	ldr r1, [r0, 0x20]
	ldr r0, _080FBE20 @ =SpriteCallbackDummy
	str r0, [r1, 0x1C]
_080FBE16:
	pop {r0}
	bx r0
	.align 2, 0
_080FBE1C: .4byte gUnknown_020388CC
_080FBE20: .4byte SpriteCallbackDummy
	thumb_func_end sub_80FBDF8

	thumb_func_start sub_80FBE24
sub_80FBE24: @ 80FBE24
	push {lr}
	ldr r0, _080FBE5C @ =gUnknown_020388CC
	ldr r3, [r0]
	ldr r1, [r3, 0x20]
	cmp r1, 0
	beq _080FBE9A
	adds r0, r3, 0
	adds r0, 0x78
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080FBE64
	adds r0, r3, 0
	adds r0, 0x74
	ldrh r0, [r0]
	lsls r0, 4
	subs r0, 0x30
	strh r0, [r1, 0x20]
	ldr r1, [r3, 0x20]
	adds r0, r3, 0
	adds r0, 0x76
	ldrh r0, [r0]
	lsls r0, 4
	subs r0, 0x42
	strh r0, [r1, 0x22]
	ldr r1, [r3, 0x20]
	ldr r0, _080FBE60 @ =sub_80FBEA4
	b _080FBE8C
	.align 2, 0
_080FBE5C: .4byte gUnknown_020388CC
_080FBE60: .4byte sub_80FBEA4
_080FBE64:
	adds r0, r3, 0
	adds r0, 0x74
	ldrh r0, [r0]
	lsls r0, 3
	adds r0, 0x4
	movs r2, 0
	strh r0, [r1, 0x20]
	ldr r1, [r3, 0x20]
	adds r0, r3, 0
	adds r0, 0x76
	ldrh r0, [r0]
	lsls r0, 3
	adds r0, 0x4
	strh r0, [r1, 0x22]
	ldr r0, [r3, 0x20]
	strh r2, [r0, 0x24]
	ldr r0, [r3, 0x20]
	strh r2, [r0, 0x26]
	ldr r1, [r3, 0x20]
	ldr r0, _080FBEA0 @ =sub_80FBF34
_080FBE8C:
	str r0, [r1, 0x1C]
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
_080FBE9A:
	pop {r0}
	bx r0
	.align 2, 0
_080FBEA0: .4byte sub_80FBF34
	thumb_func_end sub_80FBE24

	thumb_func_start sub_80FBEA4
sub_80FBEA4: @ 80FBEA4
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _080FBF08 @ =gUnknown_020388CC
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x5C
	movs r4, 0
	ldrsh r2, [r0, r4]
	lsls r2, 1
	negs r2, r2
	strh r2, [r3, 0x24]
	adds r1, 0x5E
	movs r4, 0
	ldrsh r0, [r1, r4]
	lsls r0, 1
	negs r0, r0
	strh r0, [r3, 0x26]
	ldrh r1, [r3, 0x22]
	adds r1, r0
	adds r0, r3, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	strh r0, [r3, 0x2E]
	ldrh r1, [r3, 0x20]
	adds r1, r2
	adds r2, r3, 0
	adds r2, 0x28
	ldrb r2, [r2]
	lsls r2, 24
	asrs r2, 24
	adds r2, r1
	strh r2, [r3, 0x30]
	adds r0, 0x8
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xB0
	bhi _080FBF04
	lsls r0, r2, 16
	asrs r2, r0, 16
	movs r0, 0x8
	negs r0, r0
	cmp r2, r0
	blt _080FBF04
	cmp r2, 0xF8
	ble _080FBF0C
_080FBF04:
	movs r0, 0
	b _080FBF0E
	.align 2, 0
_080FBF08: .4byte gUnknown_020388CC
_080FBF0C:
	movs r0, 0x1
_080FBF0E:
	strh r0, [r3, 0x32]
	movs r1, 0x32
	ldrsh r0, [r3, r1]
	cmp r0, 0x1
	bne _080FBF20
	adds r0, r3, 0
	bl sub_80FBF40
	b _080FBF2C
_080FBF20:
	adds r0, r3, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_080FBF2C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80FBEA4

	thumb_func_start sub_80FBF34
sub_80FBF34: @ 80FBF34
	push {lr}
	bl sub_80FBF40
	pop {r0}
	bx r0
	thumb_func_end sub_80FBF34

	thumb_func_start sub_80FBF40
sub_80FBF40: @ 80FBF40
	push {lr}
	adds r2, r0, 0
	ldr r0, _080FBF80 @ =gUnknown_020388CC
	ldr r0, [r0]
	adds r0, 0x7E
	ldrb r0, [r0]
	cmp r0, 0
	beq _080FBF84
	ldrh r0, [r2, 0x3C]
	adds r0, 0x1
	strh r0, [r2, 0x3C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080FBF90
	movs r0, 0
	strh r0, [r2, 0x3C]
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsrs r1, r2, 2
	movs r0, 0x1
	eors r1, r0
	ands r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _080FBF90
	.align 2, 0
_080FBF80: .4byte gUnknown_020388CC
_080FBF84:
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080FBF90:
	pop {r0}
	bx r0
	thumb_func_end sub_80FBF40

	thumb_func_start sub_80FBF94
sub_80FBF94: @ 80FBF94
	push {lr}
	ldr r0, _080FBFB0 @ =gUnknown_020388CC
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x7F
	ldrb r0, [r0]
	cmp r0, 0
	beq _080FBFAA
	adds r1, 0x7E
	movs r0, 0x1
	strb r0, [r1]
_080FBFAA:
	pop {r0}
	bx r0
	.align 2, 0
_080FBFB0: .4byte gUnknown_020388CC
	thumb_func_end sub_80FBF94

	thumb_func_start sub_80FBFB4
sub_80FBFB4: @ 80FBFB4
	push {lr}
	adds r3, r0, 0
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	cmp r1, 0x56
	bne _080FBFCA
	bl GetSecretBaseMapName
	b _080FBFF2
_080FBFCA:
	cmp r1, 0x57
	bhi _080FBFE4
	ldr r0, _080FBFE0 @ =gRegionMapLocations
	lsls r1, 3
	adds r0, 0x4
	adds r1, r0
	ldr r1, [r1]
	adds r0, r3, 0
	bl StringCopy
	b _080FBFF2
	.align 2, 0
_080FBFE0: .4byte gRegionMapLocations
_080FBFE4:
	cmp r2, 0
	bne _080FBFEA
	movs r2, 0x12
_080FBFEA:
	adds r0, r3, 0
	movs r1, 0
	bl StringFill
_080FBFF2:
	pop {r1}
	bx r1
	thumb_func_end sub_80FBFB4

	thumb_func_start CopyMapName
CopyMapName: @ 80FBFF8
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	cmp r1, 0x56
	beq _080FC014
	cmp r1, 0x57
	bne _080FC020
	ldr r1, _080FC010 @ =gOtherText_Ferry
	bl StringCopy
	b _080FC026
	.align 2, 0
_080FC010: .4byte gOtherText_Ferry
_080FC014:
	ldr r1, _080FC01C @ =gOtherText_SecretBase
	bl StringCopy
	b _080FC026
	.align 2, 0
_080FC01C: .4byte gOtherText_SecretBase
_080FC020:
	movs r2, 0
	bl sub_80FBFB4
_080FC026:
	pop {r1}
	bx r1
	thumb_func_end CopyMapName

	thumb_func_start CopyLocationName
CopyLocationName: @ 80FC02C
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	cmp r1, 0x42
	beq _080FC03C
	bl CopyMapName
	b _080FC042
_080FC03C:
	ldr r1, _080FC048 @ =gOtherText_Hideout
	bl StringCopy
_080FC042:
	pop {r1}
	bx r1
	.align 2, 0
_080FC048: .4byte gOtherText_Hideout
	thumb_func_end CopyLocationName

	thumb_func_start sub_80FC04C
sub_80FC04C: @ 80FC04C
	push {r4,r5,lr}
	ldr r5, [sp, 0xC]
	lsls r0, 16
	ldr r4, _080FC070 @ =gRegionMapLocations
	lsrs r0, 13
	adds r0, r4
	ldrb r4, [r0]
	strh r4, [r1]
	ldrb r1, [r0, 0x1]
	strh r1, [r2]
	ldrb r1, [r0, 0x2]
	strh r1, [r3]
	ldrb r0, [r0, 0x3]
	strh r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FC070: .4byte gRegionMapLocations
	thumb_func_end sub_80FC04C

	thumb_func_start sub_80FC074
sub_80FC074: @ 80FC074
	push {r4,lr}
	ldr r0, _080FC090 @ =gMain
	ldr r1, _080FC094 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x9
	bls _080FC084
	b _080FC1F2
_080FC084:
	lsls r0, 2
	ldr r1, _080FC098 @ =_080FC09C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FC090: .4byte gMain
_080FC094: .4byte 0x0000043c
_080FC098: .4byte _080FC09C
	.align 2, 0
_080FC09C:
	.4byte _080FC0C4
	.4byte _080FC104
	.4byte _080FC110
	.4byte _080FC120
	.4byte _080FC15C
	.4byte _080FC170
	.4byte _080FC184
	.4byte _080FC1A4
	.4byte _080FC1AA
	.4byte _080FC1C4
_080FC0C4:
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0x80
	lsls r0, 19
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x10
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl ResetPaletteFade
	bl ResetSpriteData
	bl FreeSpriteTileRanges
	bl FreeAllSpritePalettes
	b _080FC1E6
_080FC104:
	ldr r0, _080FC10C @ =gWindowConfig_81E7224
	bl SetUpWindowConfig
	b _080FC1E6
	.align 2, 0
_080FC10C: .4byte gWindowConfig_81E7224
_080FC110:
	ldr r0, _080FC11C @ =gWindowConfig_81E7224
	bl InitMenuWindow
	bl MenuZeroFillScreen
	b _080FC1E6
	.align 2, 0
_080FC11C: .4byte gWindowConfig_81E7224
_080FC120:
	ldr r4, _080FC158 @ =0x02000008
	adds r0, r4, 0
	movs r1, 0
	bl sub_80FA8EC
	movs r0, 0
	movs r1, 0
	bl sub_80FBB3C
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80FBCF0
	adds r1, r4, 0
	subs r1, 0x8
	ldrh r0, [r1, 0x1C]
	strh r0, [r1, 0x6]
	movs r2, 0xA4
	lsls r2, 4
	adds r4, r2
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0xC
	bl StringFill
	bl sub_80FC254
	b _080FC1E6
	.align 2, 0
_080FC158: .4byte 0x02000008
_080FC15C:
	ldr r0, _080FC168 @ =gUnknown_083E773C
	ldr r1, _080FC16C @ =0x0600c000
	bl LZ77UnCompVram
	b _080FC1E6
	.align 2, 0
_080FC168: .4byte gUnknown_083E773C
_080FC16C: .4byte 0x0600c000
_080FC170:
	ldr r0, _080FC17C @ =gUnknown_083E7774
	ldr r1, _080FC180 @ =0x0600f000
	bl LZ77UnCompVram
	b _080FC1E6
	.align 2, 0
_080FC17C: .4byte gUnknown_083E7774
_080FC180: .4byte 0x0600f000
_080FC184:
	ldr r0, _080FC19C @ =gUnknown_083E771C
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _080FC1A0 @ =gOtherText_FlyToWhere
	movs r1, 0x1
	movs r2, 0x90
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	b _080FC1E6
	.align 2, 0
_080FC19C: .4byte gUnknown_083E771C
_080FC1A0: .4byte gOtherText_FlyToWhere
_080FC1A4:
	bl sub_80FC31C
	b _080FC1E6
_080FC1AA:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	ldr r0, _080FC1C0 @ =sub_80FC214
	bl SetVBlankCallback
	b _080FC1E6
	.align 2, 0
_080FC1C0: .4byte sub_80FC214
_080FC1C4:
	ldr r1, _080FC1F8 @ =REG_BLDCNT
	movs r0, 0
	strh r0, [r1]
	subs r1, 0x46
	ldr r2, _080FC1FC @ =0x00001e0d
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xA
	ldr r2, _080FC200 @ =0x00001741
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080FC204 @ =sub_80FC5B4
	bl sub_80FC244
	ldr r0, _080FC208 @ =sub_80FC228
	bl SetMainCallback2
_080FC1E6:
	ldr r1, _080FC20C @ =gMain
	ldr r0, _080FC210 @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080FC1F2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FC1F8: .4byte REG_BLDCNT
_080FC1FC: .4byte 0x00001e0d
_080FC200: .4byte 0x00001741
_080FC204: .4byte sub_80FC5B4
_080FC208: .4byte sub_80FC228
_080FC20C: .4byte gMain
_080FC210: .4byte 0x0000043c
	thumb_func_end sub_80FC074

	thumb_func_start sub_80FC214
sub_80FC214: @ 80FC214
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_80FC214

	thumb_func_start sub_80FC228
sub_80FC228: @ 80FC228
	push {lr}
	ldr r0, _080FC240 @ =0x02000000
	ldr r0, [r0]
	bl _call_via_r0
	bl AnimateSprites
	bl BuildOamBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080FC240: .4byte 0x02000000
	thumb_func_end sub_80FC228

	thumb_func_start sub_80FC244
sub_80FC244: @ 80FC244
	ldr r1, _080FC250 @ =0x02000000
	str r0, [r1]
	movs r0, 0
	strh r0, [r1, 0x4]
	bx lr
	.align 2, 0
_080FC250: .4byte 0x02000000
	thumb_func_end sub_80FC244

	thumb_func_start sub_80FC254
sub_80FC254: @ 80FC254
	push {r4,r5,lr}
	ldr r4, _080FC2AC @ =0x02000000
	ldrb r0, [r4, 0x1E]
	cmp r0, 0x2
	beq _080FC262
	cmp r0, 0x4
	bne _080FC2EC
_080FC262:
	movs r1, 0
	ldr r2, _080FC2B0 @ =gUnknown_083E79C0
	adds r5, r4, 0
_080FC268:
	lsls r0, r1, 3
	adds r4, r0, r2
	ldrh r0, [r5, 0x1C]
	ldrh r3, [r4, 0x4]
	cmp r0, r3
	bne _080FC2B4
	ldrh r0, [r4, 0x6]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080FC2BE
	movs r0, 0x10
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	adds r0, r5, 0
	adds r0, 0x8
	movs r1, 0x11
	movs r2, 0xF
	bl MenuPrint
	ldrb r0, [r5, 0x1F]
	ldr r1, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x1D
	movs r2, 0x11
	bl MenuPrint_RightAligned
	b _080FC310
	.align 2, 0
_080FC2AC: .4byte 0x02000000
_080FC2B0: .4byte gUnknown_083E79C0
_080FC2B4:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _080FC268
_080FC2BE:
	movs r0, 0
	cmp r0, 0
	bne _080FC310
	movs r0, 0x10
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _080FC2E8 @ =0x02000008
	movs r1, 0x11
	movs r2, 0x11
	bl MenuPrint
	movs r0, 0x10
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0xF
	bl MenuZeroFillWindowRect
	b _080FC310
	.align 2, 0
_080FC2E8: .4byte 0x02000008
_080FC2EC:
	movs r0, 0x10
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r1, _080FC318 @ =0x00000a48
	adds r0, r4, r1
	movs r1, 0x11
	movs r2, 0x11
	bl MenuPrint
	movs r0, 0x10
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0xF
	bl MenuZeroFillWindowRect
_080FC310:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FC318: .4byte 0x00000a48
	thumb_func_end sub_80FC254

	thumb_func_start sub_80FC31C
sub_80FC31C: @ 80FC31C
	push {r4,lr}
	sub sp, 0x8
	ldr r0, _080FC360 @ =gUnknown_083E784C
	ldr r4, _080FC364 @ =0x02000888
	adds r1, r4, 0
	bl LZ77UnCompWram
	str r4, [sp]
	ldr r1, _080FC368 @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r1
	movs r1, 0xE0
	lsls r1, 1
	orrs r0, r1
	ldr r1, _080FC36C @ =0x0000ffff
	ands r0, r1
	movs r1, 0x80
	lsls r1, 10
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	ldr r0, _080FC370 @ =gUnknown_083E79CC
	bl LoadSpritePalette
	bl sub_80FC374
	bl sub_80FC484
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FC360: .4byte gUnknown_083E784C
_080FC364: .4byte 0x02000888
_080FC368: .4byte 0xffff0000
_080FC36C: .4byte 0x0000ffff
_080FC370: .4byte gUnknown_083E79CC
	thumb_func_end sub_80FC31C

	thumb_func_start sub_80FC374
sub_80FC374: @ 80FC374
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	ldr r0, _080FC3D4 @ =0x0000080f
	str r0, [sp, 0xC]
	movs r1, 0
	mov r9, r1
	mov r2, sp
	adds r2, 0x6
	str r2, [sp, 0x14]
	mov r3, sp
	adds r3, 0xA
	str r3, [sp, 0x18]
	mov r0, sp
	adds r0, 0x8
	str r0, [sp, 0x10]
	add r1, sp, 0x4
	mov r10, r1
_080FC39E:
	ldr r2, [sp, 0x18]
	str r2, [sp]
	mov r0, r9
	add r1, sp, 0x4
	mov r2, sp
	adds r2, 0x6
	ldr r3, [sp, 0x10]
	bl sub_80FC04C
	mov r3, r10
	ldrh r0, [r3]
	adds r0, 0x1
	lsls r0, 3
	adds r0, 0x4
	strh r0, [r3]
	mov r1, sp
	ldrh r0, [r1, 0x6]
	adds r0, 0x2
	lsls r0, 3
	adds r0, 0x4
	strh r0, [r1, 0x6]
	ldr r2, [sp, 0x10]
	ldrh r0, [r2]
	cmp r0, 0x2
	bne _080FC3D8
	movs r7, 0x1
	b _080FC3E4
	.align 2, 0
_080FC3D4: .4byte 0x0000080f
_080FC3D8:
	ldr r3, [sp, 0x18]
	ldrh r0, [r3]
	movs r7, 0
	cmp r0, 0x2
	bne _080FC3E4
	movs r7, 0x2
_080FC3E4:
	mov r0, r10
	movs r2, 0
	ldrsh r1, [r0, r2]
	ldr r3, [sp, 0x14]
	movs r0, 0
	ldrsh r2, [r3, r0]
	ldr r0, _080FC430 @ =gSpriteTemplate_83E7A38
	movs r3, 0xA
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x40
	beq _080FC458
	ldr r1, _080FC434 @ =gSprites
	mov r8, r1
	lsls r4, r5, 4
	adds r0, r4, r5
	lsls r6, r0, 2
	adds r2, r6, r1
	lsls r3, r7, 6
	ldrb r1, [r2, 0x1]
	movs r0, 0x3F
	ands r0, r1
	orrs r0, r3
	strb r0, [r2, 0x1]
	ldr r0, [sp, 0xC]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080FC43C
	mov r0, r8
	adds r0, 0x1C
	adds r0, r6, r0
	ldr r1, _080FC438 @ =sub_80FC55C
	str r1, [r0]
	b _080FC442
	.align 2, 0
_080FC430: .4byte gSpriteTemplate_83E7A38
_080FC434: .4byte gSprites
_080FC438: .4byte sub_80FC55C
_080FC43C:
	adds r0, r7, 0x3
	lsls r0, 16
	lsrs r7, r0, 16
_080FC442:
	adds r4, r5
	lsls r4, 2
	ldr r0, _080FC480 @ =gSprites
	adds r4, r0
	lsls r1, r7, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	mov r2, r9
	strh r2, [r4, 0x2E]
_080FC458:
	ldr r0, [sp, 0xC]
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0xC]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	cmp r0, 0xF
	bls _080FC39E
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FC480: .4byte gSprites
	thumb_func_end sub_80FC374

	thumb_func_start sub_80FC484
sub_80FC484: @ 80FC484
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	movs r0, 0
	mov r8, r0
	ldr r6, _080FC54C @ =gUnknown_083E79D4
	ldrh r0, [r6, 0x2]
	cmp r0, 0x58
	beq _080FC53C
	mov r5, sp
	adds r5, 0x6
	add r7, sp, 0x4
	ldr r1, _080FC550 @ =gSprites
	mov r9, r1
	movs r0, 0x1C
	add r0, r9
	mov r10, r0
_080FC4AC:
	mov r1, r8
	lsls r4, r1, 2
	adds r0, r4, r6
	ldrh r0, [r0]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080FC524
	adds r0, r6, 0x2
	adds r0, r4, r0
	ldrh r6, [r0]
	mov r0, sp
	adds r0, 0xA
	str r0, [sp]
	adds r0, r6, 0
	add r1, sp, 0x4
	adds r2, r5, 0
	add r3, sp, 0x8
	bl sub_80FC04C
	ldrh r0, [r7]
	adds r0, 0x1
	lsls r0, 3
	strh r0, [r7]
	ldrh r0, [r5]
	adds r0, 0x2
	lsls r0, 3
	strh r0, [r5]
	movs r0, 0
	ldrsh r1, [r7, r0]
	movs r0, 0
	ldrsh r2, [r5, r0]
	ldr r0, _080FC554 @ =gSpriteTemplate_83E7A38
	movs r3, 0xA
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080FC524
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	mov r1, r9
	adds r4, r2, r1
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r4, 0x3]
	add r2, r10
	ldr r0, _080FC558 @ =sub_80FC55C
	str r0, [r2]
	adds r0, r4, 0
	movs r1, 0x6
	bl StartSpriteAnim
	strh r6, [r4, 0x2E]
_080FC524:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r6, _080FC54C @ =gUnknown_083E79D4
	lsls r0, 2
	adds r1, r6, 0x2
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0x58
	bne _080FC4AC
_080FC53C:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FC54C: .4byte gUnknown_083E79D4
_080FC550: .4byte gSprites
_080FC554: .4byte gSpriteTemplate_83E7A38
_080FC558: .4byte sub_80FC55C
	thumb_func_end sub_80FC484

	thumb_func_start sub_80FC55C
sub_80FC55C: @ 80FC55C
	push {lr}
	adds r2, r0, 0
	ldr r0, _080FC59C @ =0x02000000
	ldrh r1, [r0, 0x1C]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bne _080FC5A0
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080FC5AE
	movs r0, 0
	strh r0, [r2, 0x30]
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsrs r1, r2, 2
	movs r0, 0x1
	eors r1, r0
	ands r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _080FC5AE
	.align 2, 0
_080FC59C: .4byte 0x02000000
_080FC5A0:
	movs r0, 0x10
	strh r0, [r2, 0x30]
	adds r2, 0x3E
	ldrb r1, [r2]
	subs r0, 0x15
	ands r0, r1
	strb r0, [r2]
_080FC5AE:
	pop {r0}
	bx r0
	thumb_func_end sub_80FC55C

	thumb_func_start sub_80FC5B4
sub_80FC5B4: @ 80FC5B4
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _080FC5C8 @ =0x02000000
	ldrh r1, [r4, 0x4]
	cmp r1, 0
	beq _080FC5CC
	cmp r1, 0x1
	beq _080FC5E4
	b _080FC5F4
	.align 2, 0
_080FC5C8: .4byte 0x02000000
_080FC5CC:
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
	strh r0, [r4, 0x4]
	b _080FC5F4
_080FC5E4:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _080FC5F4
	ldr r0, _080FC5FC @ =sub_80FC600
	bl sub_80FC244
_080FC5F4:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FC5FC: .4byte sub_80FC600
	thumb_func_end sub_80FC5B4

	thumb_func_start sub_80FC600
sub_80FC600: @ 80FC600
	push {r4,lr}
	ldr r0, _080FC620 @ =0x02000000
	ldrh r0, [r0, 0x4]
	cmp r0, 0
	bne _080FC68A
	bl sub_80FAB60
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bhi _080FC68A
	lsls r0, 2
	ldr r1, _080FC624 @ =_080FC628
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FC620: .4byte 0x02000000
_080FC624: .4byte _080FC628
	.align 2, 0
_080FC628:
	.4byte _080FC68A
	.4byte _080FC68A
	.4byte _080FC68A
	.4byte _080FC640
	.4byte _080FC646
	.4byte _080FC674
_080FC640:
	bl sub_80FC254
	b _080FC68A
_080FC646:
	ldr r4, _080FC668 @ =0x02000000
	ldrb r0, [r4, 0x1E]
	cmp r0, 0x2
	beq _080FC652
	cmp r0, 0x4
	bne _080FC68A
_080FC652:
	movs r0, 0x5
	bl m4aSongNumStart
	ldr r1, _080FC66C @ =0x00000a6e
	adds r0, r4, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, _080FC670 @ =sub_80FC69C
	bl sub_80FC244
	b _080FC68A
	.align 2, 0
_080FC668: .4byte 0x02000000
_080FC66C: .4byte 0x00000a6e
_080FC670: .4byte sub_80FC69C
_080FC674:
	movs r0, 0x5
	bl m4aSongNumStart
	ldr r0, _080FC690 @ =0x02000000
	ldr r1, _080FC694 @ =0x00000a6e
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080FC698 @ =sub_80FC69C
	bl sub_80FC244
_080FC68A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FC690: .4byte 0x02000000
_080FC694: .4byte 0x00000a6e
_080FC698: .4byte sub_80FC69C
	thumb_func_end sub_80FC600

	thumb_func_start sub_80FC69C
sub_80FC69C: @ 80FC69C
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _080FC6B0 @ =0x02000000
	ldrh r1, [r4, 0x4]
	cmp r1, 0
	beq _080FC6B4
	cmp r1, 0x1
	beq _080FC6CC
	b _080FC792
	.align 2, 0
_080FC6B0: .4byte 0x02000000
_080FC6B4:
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
	strh r0, [r4, 0x4]
	b _080FC792
_080FC6CC:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _080FC792
	bl sub_80FAB10
	ldr r1, _080FC6F4 @ =0x00000a6e
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080FC78C
	ldrh r0, [r4, 0x1C]
	cmp r0, 0xF
	beq _080FC724
	cmp r0, 0xF
	bgt _080FC6F8
	cmp r0, 0
	beq _080FC710
	b _080FC748
	.align 2, 0
_080FC6F4: .4byte 0x00000a6e
_080FC6F8:
	cmp r0, 0x3A
	beq _080FC708
	cmp r0, 0x49
	bne _080FC748
	movs r0, 0x16
	bl sub_8053538
	b _080FC786
_080FC708:
	movs r0, 0x15
	bl sub_8053538
	b _080FC786
_080FC710:
	ldr r0, _080FC720 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	movs r1, 0xD
	cmp r0, 0
	bne _080FC73A
	movs r1, 0xC
	b _080FC73A
	.align 2, 0
_080FC720: .4byte gSaveBlock2
_080FC724:
	ldr r0, _080FC744 @ =0x00000854
	bl FlagGet
	lsls r0, 24
	movs r1, 0xB
	cmp r0, 0
	beq _080FC73A
	ldrb r0, [r4, 0x1F]
	cmp r0, 0
	bne _080FC73A
	movs r1, 0x14
_080FC73A:
	adds r0, r1, 0
	bl sub_8053538
	b _080FC786
	.align 2, 0
_080FC744: .4byte 0x00000854
_080FC748:
	ldr r3, _080FC764 @ =gUnknown_083E7920
	ldr r0, _080FC768 @ =0x02000000
	ldrh r1, [r0, 0x1C]
	lsls r0, r1, 1
	adds r2, r0, r1
	adds r0, r3, 0x2
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _080FC76C
	bl sub_8053538
	b _080FC786
	.align 2, 0
_080FC764: .4byte gUnknown_083E7920
_080FC768: .4byte 0x02000000
_080FC76C:
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	movs r2, 0x1
	negs r2, r2
	bl warp1_set_2
_080FC786:
	bl sub_80865BC
	b _080FC792
_080FC78C:
	ldr r0, _080FC79C @ =sub_808AD58
	bl SetMainCallback2
_080FC792:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FC79C: .4byte sub_808AD58
	thumb_func_end sub_80FC69C

	.align 2, 0 @ Don't pad with nop.
