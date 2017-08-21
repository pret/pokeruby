	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80EE96C
sub_80EE96C: @ 80EE96C
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _080EE99C @ =0x02000000
	movs r1, 0xC1
	lsls r1, 2
	adds r5, r0, r1
	ldrh r4, [r5]
	cmp r4, 0
	bne _080EE9A0
	movs r0, 0x6F
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	b _080EE9B4
	.align 2, 0
_080EE99C: .4byte 0x02000000
_080EE9A0:
	ldr r0, _080EE9BC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080EE9B4
	bl sub_80F5BDC
	bl sub_805469C
_080EE9B4:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EE9BC: .4byte gPaletteFade
	thumb_func_end sub_80EE96C

	thumb_func_start sub_80EE9C0
sub_80EE9C0: @ 80EE9C0
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	bl sub_80F1E84
	ldr r1, _080EE9FC @ =0x02000000
	ldr r2, _080EEA00 @ =0x00006e14
	adds r0, r1, r2
	movs r2, 0
	strb r4, [r0]
	ldr r3, _080EEA04 @ =0x00006e15
	adds r0, r1, r3
	strb r5, [r0]
	adds r3, 0x1
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _080EEA08 @ =0x00006e17
	adds r1, r0
	strb r6, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EE9FC: .4byte 0x02000000
_080EEA00: .4byte 0x00006e14
_080EEA04: .4byte 0x00006e15
_080EEA08: .4byte 0x00006e17
	thumb_func_end sub_80EE9C0

	thumb_func_start sub_80EEA0C
sub_80EEA0C: @ 80EEA0C
	push {r4,lr}
	ldr r1, _080EEA28 @ =0x02000000
	ldr r2, _080EEA2C @ =0x00006e16
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r3, r1, 0
	cmp r0, 0x8
	bls _080EEA1E
	b _080EEBFA
_080EEA1E:
	lsls r0, 2
	ldr r1, _080EEA30 @ =_080EEA34
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EEA28: .4byte 0x02000000
_080EEA2C: .4byte 0x00006e16
_080EEA30: .4byte _080EEA34
	.align 2, 0
_080EEA34:
	.4byte _080EEA58
	.4byte _080EEA98
	.4byte _080EEAAE
	.4byte _080EEAD4
	.4byte _080EEB3E
	.4byte _080EEB68
	.4byte _080EEB88
	.4byte _080EEBAC
	.4byte _080EEBE4
_080EEA58:
	bl sub_80F1F10
	lsls r0, 24
	cmp r0, 0
	beq _080EEA64
	b _080EEC08
_080EEA64:
	ldr r1, _080EEA7C @ =0x02000000
	ldr r4, _080EEA80 @ =0x00006e17
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0xC
	beq _080EEA88
	ldr r0, _080EEA84 @ =0x00006e16
	adds r1, r0
	movs r0, 0x1
	strb r0, [r1]
	b _080EEC08
	.align 2, 0
_080EEA7C: .4byte 0x02000000
_080EEA80: .4byte 0x00006e17
_080EEA84: .4byte 0x00006e16
_080EEA88:
	ldr r2, _080EEA94 @ =0x00006e16
	adds r1, r2
	movs r0, 0x3
	strb r0, [r1]
	b _080EEC08
	.align 2, 0
_080EEA94: .4byte 0x00006e16
_080EEA98:
	ldr r4, _080EEAC8 @ =0x02000000
	ldr r1, _080EEACC @ =0x00006e17
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_80F2C80
	ldr r2, _080EEAD0 @ =0x00006e16
	adds r4, r2
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_080EEAAE:
	ldr r4, _080EEAC8 @ =0x02000000
	ldr r1, _080EEACC @ =0x00006e17
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_80F2CBC
	lsls r0, 24
	cmp r0, 0
	beq _080EEAC2
	b _080EEC08
_080EEAC2:
	ldr r2, _080EEAD0 @ =0x00006e16
	adds r1, r4, r2
	b _080EEB76
	.align 2, 0
_080EEAC8: .4byte 0x02000000
_080EEACC: .4byte 0x00006e17
_080EEAD0: .4byte 0x00006e16
_080EEAD4:
	adds r2, r3, 0
	ldr r4, _080EEAF8 @ =0x00006e15
	adds r0, r2, r4
	ldrb r1, [r0]
	subs r4, 0x68
	adds r0, r2, r4
	strb r1, [r0]
	ldr r1, _080EEAFC @ =0x00006e14
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080EEB14
	cmp r0, 0x1
	bgt _080EEB00
	cmp r0, 0
	beq _080EEB06
	b _080EEB28
	.align 2, 0
_080EEAF8: .4byte 0x00006e15
_080EEAFC: .4byte 0x00006e14
_080EEB00:
	cmp r0, 0x2
	beq _080EEB20
	b _080EEB28
_080EEB06:
	ldr r4, _080EEB10 @ =0x00006dae
	adds r1, r2, r4
	movs r0, 0x5
	b _080EEB26
	.align 2, 0
_080EEB10: .4byte 0x00006dae
_080EEB14:
	ldr r0, _080EEB1C @ =0x00006dae
	adds r1, r2, r0
	movs r0, 0x3
	b _080EEB26
	.align 2, 0
_080EEB1C: .4byte 0x00006dae
_080EEB20:
	ldr r2, _080EEB58 @ =0x00006dae
	adds r1, r3, r2
	movs r0, 0x6
_080EEB26:
	strb r0, [r1]
_080EEB28:
	ldr r4, _080EEB5C @ =0x02000000
	ldr r1, _080EEB60 @ =0x00006e14
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_80F1B8C
	ldr r2, _080EEB64 @ =0x00006e16
	adds r4, r2
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_080EEB3E:
	ldr r4, _080EEB5C @ =0x02000000
	ldr r1, _080EEB60 @ =0x00006e14
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_80F1BC8
	lsls r0, 24
	cmp r0, 0
	bne _080EEC08
	ldr r2, _080EEB64 @ =0x00006e16
	adds r1, r4, r2
	b _080EEB76
	.align 2, 0
_080EEB58: .4byte 0x00006dae
_080EEB5C: .4byte 0x02000000
_080EEB60: .4byte 0x00006e14
_080EEB64: .4byte 0x00006e16
_080EEB68:
	bl sub_8055870
	cmp r0, 0
	bne _080EEC08
	ldr r1, _080EEB80 @ =0x02000000
	ldr r4, _080EEB84 @ =0x00006e16
	adds r1, r4
_080EEB76:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080EEC08
	.align 2, 0
_080EEB80: .4byte 0x02000000
_080EEB84: .4byte 0x00006e16
_080EEB88:
	bl sub_80F1DF0
	ldr r4, _080EEBA0 @ =0x02000000
	ldr r1, _080EEBA4 @ =0x00006e14
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_80EF490
	ldr r2, _080EEBA8 @ =0x00006e16
	adds r4, r2
	b _080EEBCC
	.align 2, 0
_080EEBA0: .4byte 0x02000000
_080EEBA4: .4byte 0x00006e14
_080EEBA8: .4byte 0x00006e16
_080EEBAC:
	bl sub_80F1E50
	lsls r0, 24
	cmp r0, 0
	bne _080EEC08
	ldr r4, _080EEBD4 @ =0x02000000
	ldr r1, _080EEBD8 @ =0x00006e14
	adds r0, r4, r1
	ldrb r0, [r0]
	ldr r2, _080EEBDC @ =0x00006dad
	adds r1, r4, r2
	ldrb r1, [r1]
	bl sub_80EF428
	ldr r0, _080EEBE0 @ =0x00006e16
	adds r4, r0
_080EEBCC:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _080EEC08
	.align 2, 0
_080EEBD4: .4byte 0x02000000
_080EEBD8: .4byte 0x00006e14
_080EEBDC: .4byte 0x00006dad
_080EEBE0: .4byte 0x00006e16
_080EEBE4:
	bl sub_80EF4F8
	lsls r0, 24
	cmp r0, 0
	bne _080EEC08
	ldr r1, _080EEC00 @ =0x02000000
	ldr r2, _080EEC04 @ =0x00006e16
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080EEBFA:
	movs r0, 0
	b _080EEC0A
	.align 2, 0
_080EEC00: .4byte 0x02000000
_080EEC04: .4byte 0x00006e16
_080EEC08:
	movs r0, 0x1
_080EEC0A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80EEA0C

	thumb_func_start sub_80EEC10
sub_80EEC10: @ 80EEC10
	push {r4,lr}
	ldr r0, _080EEC48 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080EEC50
	ldr r1, _080EEC4C @ =0x02006dad
	adds r3, r1, 0x1
	adds r2, r1, 0x5
_080EEC24:
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bge _080EEC36
	ldrb r0, [r3]
	subs r0, 0x1
	strb r0, [r1]
_080EEC36:
	movs r0, 0
	ldrsb r0, [r1, r0]
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _080EEC24
	movs r0, 0x1
	b _080EEC8A
	.align 2, 0
_080EEC48: .4byte gMain
_080EEC4C: .4byte 0x02006dad
_080EEC50:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080EEC88
	ldr r1, _080EEC84 @ =0x02006dad
	movs r4, 0
	movs r2, 0x1
	ldrsb r2, [r1, r2]
	adds r3, r1, 0x5
_080EEC62:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	cmp r0, r2
	blt _080EEC72
	strb r4, [r1]
_080EEC72:
	movs r0, 0
	ldrsb r0, [r1, r0]
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, 0
	beq _080EEC62
	movs r0, 0x1
	b _080EEC8A
	.align 2, 0
_080EEC84: .4byte 0x02006dad
_080EEC88:
	movs r0, 0
_080EEC8A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80EEC10

	thumb_func_start sub_80EEC90
sub_80EEC90: @ 80EEC90
	push {r4,lr}
	ldr r0, _080EECC0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	beq _080EECD0
	ldr r2, _080EECC4 @ =0x02000000
	ldr r0, _080EECC8 @ =0x00006dad
	adds r1, r2, r0
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bge _080EECF8
	ldr r3, _080EECCC @ =0x00006dae
	adds r0, r2, r3
	ldrb r0, [r0]
	subs r0, 0x1
	strb r0, [r1]
	b _080EECF8
	.align 2, 0
_080EECC0: .4byte gMain
_080EECC4: .4byte 0x02000000
_080EECC8: .4byte 0x00006dad
_080EECCC: .4byte 0x00006dae
_080EECD0:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080EED04
	ldr r0, _080EECFC @ =0x02000000
	ldr r4, _080EED00 @ =0x00006dad
	adds r2, r0, r4
	ldrb r1, [r2]
	adds r1, 0x1
	strb r1, [r2]
	adds r4, 0x1
	adds r0, r4
	lsls r1, 24
	asrs r1, 24
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r1, r0
	blt _080EECF8
	strb r3, [r2]
_080EECF8:
	movs r0, 0x1
	b _080EED06
	.align 2, 0
_080EECFC: .4byte 0x02000000
_080EED00: .4byte 0x00006dad
_080EED04:
	movs r0, 0
_080EED06:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80EEC90

	thumb_func_start sub_80EED0C
sub_80EED0C: @ 80EED0C
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x80
	lsls r2, 2
	adds r0, r2, 0
	strh r0, [r1]
	bx lr
	thumb_func_end sub_80EED0C

	thumb_func_start sub_80EED1C
sub_80EED1C: @ 80EED1C
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x92
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	bx lr
	thumb_func_end sub_80EED1C

	thumb_func_start sub_80EED2C
sub_80EED2C: @ 80EED2C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bhi _080EED98
	lsls r0, 2
	ldr r1, _080EED40 @ =_080EED44
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EED40: .4byte _080EED44
	.align 2, 0
_080EED44:
	.4byte _080EED5C
	.4byte _080EED66
	.4byte _080EED7E
	.4byte _080EED74
	.4byte _080EED74
	.4byte _080EED8C
_080EED5C:
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	b _080EED94
_080EED66:
	movs r1, 0x80
	lsls r1, 19
	ldr r2, _080EED70 @ =0x00001741
	b _080EED94
	.align 2, 0
_080EED70: .4byte 0x00001741
_080EED74:
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	b _080EED94
_080EED7E:
	movs r1, 0x80
	lsls r1, 19
	ldr r2, _080EED88 @ =0x00007b40
	b _080EED94
	.align 2, 0
_080EED88: .4byte 0x00007b40
_080EED8C:
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFD
	lsls r2, 6
_080EED94:
	adds r0, r2, 0
	strh r0, [r1]
_080EED98:
	pop {r0}
	bx r0
	thumb_func_end sub_80EED2C

	thumb_func_start sub_80EED9C
sub_80EED9C: @ 80EED9C
	push {lr}
	ldr r2, _080EEDB8 @ =gUnknown_03000744
	ldr r0, _080EEDBC @ =0x02000000
	movs r1, 0xC0
	lsls r1, 2
	adds r0, r1
	ldr r1, [r0]
	str r1, [r2]
	ldr r1, _080EEDC0 @ =sub_80EEDC4
	str r1, [r0]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080EEDB8: .4byte gUnknown_03000744
_080EEDBC: .4byte 0x02000000
_080EEDC0: .4byte sub_80EEDC4
	thumb_func_end sub_80EED9C

	thumb_func_start sub_80EEDC4
sub_80EEDC4: @ 80EEDC4
	push {lr}
	bl sub_8055870
	cmp r0, 0x1
	beq _080EEDDC
	ldr r0, _080EEDE0 @ =0x02000000
	movs r1, 0xC0
	lsls r1, 2
	adds r0, r1
	ldr r1, _080EEDE4 @ =gUnknown_03000744
	ldr r1, [r1]
	str r1, [r0]
_080EEDDC:
	pop {r0}
	bx r0
	.align 2, 0
_080EEDE0: .4byte 0x02000000
_080EEDE4: .4byte gUnknown_03000744
	thumb_func_end sub_80EEDC4

	thumb_func_start sub_80EEDE8
sub_80EEDE8: @ 80EEDE8
	ldr r0, _080EEE04 @ =REG_BG0HOFS
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x8
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bx lr
	.align 2, 0
_080EEE04: .4byte REG_BG0HOFS
	thumb_func_end sub_80EEDE8

	thumb_func_start sub_80EEE08
sub_80EEE08: @ 80EEE08
	ldr r0, _080EEE18 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080EEE1C @ =0x0000d160
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
	bx lr
	.align 2, 0
_080EEE18: .4byte gUnknown_083DFEC4
_080EEE1C: .4byte 0x0000d160
	thumb_func_end sub_80EEE08

	thumb_func_start sub_80EEE20
sub_80EEE20: @ 80EEE20
	push {lr}
	ldr r0, _080EEE48 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080EEE4C @ =0x0000d160
	adds r2, r0, r1
	movs r1, 0
	strh r1, [r2]
	ldr r1, _080EEE50 @ =0x00006dac
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080EEE42
_080EEE38:
	bl sub_80EEE54
	lsls r0, 24
	cmp r0, 0
	bne _080EEE38
_080EEE42:
	pop {r0}
	bx r0
	.align 2, 0
_080EEE48: .4byte gUnknown_083DFEC4
_080EEE4C: .4byte 0x0000d160
_080EEE50: .4byte 0x00006dac
	thumb_func_end sub_80EEE20

	thumb_func_start sub_80EEE54
sub_80EEE54: @ 80EEE54
	push {lr}
	ldr r1, _080EEE70 @ =gUnknown_083DFEC4
	ldr r0, [r1]
	ldr r2, _080EEE74 @ =0x0000d160
	adds r0, r2
	ldrh r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x4
	bhi _080EEF02
	lsls r0, 2
	ldr r1, _080EEE78 @ =_080EEE7C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EEE70: .4byte gUnknown_083DFEC4
_080EEE74: .4byte 0x0000d160
_080EEE78: .4byte _080EEE7C
	.align 2, 0
_080EEE7C:
	.4byte _080EEE90
	.4byte _080EEEA4
	.4byte _080EEEB8
	.4byte _080EEEC8
	.4byte _080EEEDC
_080EEE90:
	ldr r0, _080EEE9C @ =gPokenavHoennMapMisc_Gfx
	ldr r1, _080EEEA0 @ =0x0600c000
	bl LZ77UnCompVram
	b _080EEF18
	.align 2, 0
_080EEE9C: .4byte gPokenavHoennMapMisc_Gfx
_080EEEA0: .4byte 0x0600c000
_080EEEA4:
	ldr r0, _080EEEB0 @ =gUnknown_08E99FB0
	ldr r1, _080EEEB4 @ =0x0600d800
	bl LZ77UnCompVram
	b _080EEF18
	.align 2, 0
_080EEEB0: .4byte gUnknown_08E99FB0
_080EEEB4: .4byte 0x0600d800
_080EEEB8:
	ldr r0, _080EEEC4 @ =gPokenavHoennMap1_Pal
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	b _080EEF18
	.align 2, 0
_080EEEC4: .4byte gPokenavHoennMap1_Pal
_080EEEC8:
	movs r0, 0
	bl sub_80EF58C
	movs r0, 0x1
	bl sub_80EF58C
	movs r0, 0x2
	bl sub_80EF58C
	b _080EEF18
_080EEEDC:
	ldr r2, [r2]
	movs r3, 0xC3
	lsls r3, 2
	adds r0, r2, r3
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080EEF08 @ =REG_BG1HOFS
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r1, _080EEF0C @ =REG_BG1CNT
	ldr r3, _080EEF10 @ =0x00001b0c
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _080EEF14 @ =0x0000d160
	adds r2, r0
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
_080EEF02:
	movs r0, 0
	b _080EEF28
	.align 2, 0
_080EEF08: .4byte REG_BG1HOFS
_080EEF0C: .4byte REG_BG1CNT
_080EEF10: .4byte 0x00001b0c
_080EEF14: .4byte 0x0000d160
_080EEF18:
	ldr r0, _080EEF2C @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _080EEF30 @ =0x0000d160
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x1
_080EEF28:
	pop {r1}
	bx r1
	.align 2, 0
_080EEF2C: .4byte gUnknown_083DFEC4
_080EEF30: .4byte 0x0000d160
	thumb_func_end sub_80EEE54

	thumb_func_start sub_80EEF34
sub_80EEF34: @ 80EEF34
	push {r4,lr}
	movs r3, 0x1
	ldr r0, _080EEF50 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	movs r1, 0xC3
	lsls r1, 2
	adds r2, r0, r1
	ldrh r1, [r2]
	movs r4, 0
	ldrsh r0, [r2, r4]
	cmp r0, 0x20
	bne _080EEF54
	movs r0, 0
	b _080EEF6E
	.align 2, 0
_080EEF50: .4byte gUnknown_083DFEC4
_080EEF54:
	adds r0, r1, 0x2
	strh r0, [r2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	ble _080EEF66
	movs r0, 0x20
	strh r0, [r2]
	movs r3, 0
_080EEF66:
	ldr r1, _080EEF74 @ =REG_BG1VOFS
	ldrh r0, [r2]
	strh r0, [r1]
	adds r0, r3, 0
_080EEF6E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080EEF74: .4byte REG_BG1VOFS
	thumb_func_end sub_80EEF34

	thumb_func_start sub_80EEF78
sub_80EEF78: @ 80EEF78
	push {r4,lr}
	movs r3, 0x1
	ldr r0, _080EEF94 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	movs r1, 0xC3
	lsls r1, 2
	adds r2, r0, r1
	ldrh r1, [r2]
	movs r4, 0
	ldrsh r0, [r2, r4]
	cmp r0, 0
	bne _080EEF98
	movs r0, 0
	b _080EEFB0
	.align 2, 0
_080EEF94: .4byte gUnknown_083DFEC4
_080EEF98:
	subs r0, r1, 0x2
	strh r0, [r2]
	lsls r0, 16
	cmp r0, 0
	bgt _080EEFA8
	movs r0, 0
	strh r0, [r2]
	movs r3, 0
_080EEFA8:
	ldr r1, _080EEFB8 @ =REG_BG1VOFS
	ldrh r0, [r2]
	strh r0, [r1]
	adds r0, r3, 0
_080EEFB0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080EEFB8: .4byte REG_BG1VOFS
	thumb_func_end sub_80EEF78

	thumb_func_start sub_80EEFBC
sub_80EEFBC: @ 80EEFBC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080EEFF4 @ =0x0600d800
	ldr r3, _080EEFF8 @ =gUnknown_08E9A100
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r1, 0x11
	str r1, [sp, 0x8]
	movs r1, 0x2
	str r1, [sp, 0xC]
	movs r1, 0
	movs r2, 0x16
	bl sub_809D104
	cmp r4, 0xB
	bls _080EEFE8
	b _080EF234
_080EEFE8:
	lsls r0, r4, 2
	ldr r1, _080EEFFC @ =_080EF000
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EEFF4: .4byte 0x0600d800
_080EEFF8: .4byte gUnknown_08E9A100
_080EEFFC: .4byte _080EF000
	.align 2, 0
_080EF000:
	.4byte _080EF030
	.4byte _080EF234
	.4byte _080EF08C
	.4byte _080EF100
	.4byte _080EF13C
	.4byte _080EF1D4
	.4byte _080EF234
	.4byte _080EF178
	.4byte _080EF190
	.4byte _080EF1D4
	.4byte _080EF218
	.4byte _080EF06C
_080EF030:
	ldr r6, _080EF064 @ =0x0600d800
	ldr r0, _080EF068 @ =gUnknown_08E9A100
	mov r8, r0
	movs r0, 0x11
	str r0, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	movs r0, 0xA
	str r0, [sp, 0x8]
	movs r5, 0x2
	str r5, [sp, 0xC]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0x16
	mov r3, r8
	bl sub_809D104
	str r4, [sp]
	movs r0, 0x6
	str r0, [sp, 0x4]
	movs r0, 0x7
	str r0, [sp, 0x8]
	str r5, [sp, 0xC]
	adds r0, r6, 0
	movs r1, 0xA
	b _080EF204
	.align 2, 0
_080EF064: .4byte 0x0600d800
_080EF068: .4byte gUnknown_08E9A100
_080EF06C:
	ldr r0, _080EF084 @ =0x0600d800
	ldr r3, _080EF088 @ =gUnknown_08E9A100
	movs r1, 0
	str r1, [sp]
	movs r1, 0x6
	str r1, [sp, 0x4]
	movs r1, 0x7
	str r1, [sp, 0x8]
	movs r1, 0x2
	str r1, [sp, 0xC]
	movs r1, 0x8
	b _080EF0EE
	.align 2, 0
_080EF084: .4byte 0x0600d800
_080EF088: .4byte gUnknown_08E9A100
_080EF08C:
	ldr r0, _080EF0C8 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080EF0CC @ =0x00006dac
	adds r0, r1
	ldrb r7, [r0]
	cmp r7, 0
	bne _080EF0D8
	ldr r5, _080EF0D0 @ =0x0600d800
	ldr r6, _080EF0D4 @ =gUnknown_08E9A100
	movs r0, 0xA
	str r0, [sp]
	movs r4, 0x2
	str r4, [sp, 0x4]
	str r0, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x16
	adds r3, r6, 0
	bl sub_809D104
	str r7, [sp]
	movs r0, 0x6
	str r0, [sp, 0x4]
	movs r0, 0x7
	str r0, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r0, r5, 0
	movs r1, 0xA
	b _080EF1C2
	.align 2, 0
_080EF0C8: .4byte gUnknown_083DFEC4
_080EF0CC: .4byte 0x00006dac
_080EF0D0: .4byte 0x0600d800
_080EF0D4: .4byte gUnknown_08E9A100
_080EF0D8:
	ldr r0, _080EF0F8 @ =0x0600d800
	ldr r3, _080EF0FC @ =gUnknown_08E9A100
	movs r1, 0
	str r1, [sp]
	movs r1, 0x6
	str r1, [sp, 0x4]
	movs r1, 0x7
	str r1, [sp, 0x8]
	movs r1, 0x2
	str r1, [sp, 0xC]
	movs r1, 0xA
_080EF0EE:
	movs r2, 0x16
	bl sub_809D104
	b _080EF234
	.align 2, 0
_080EF0F8: .4byte 0x0600d800
_080EF0FC: .4byte gUnknown_08E9A100
_080EF100:
	ldr r6, _080EF134 @ =0x0600d800
	ldr r0, _080EF138 @ =gUnknown_08E9A100
	mov r8, r0
	movs r5, 0
	str r5, [sp]
	movs r0, 0x4
	str r0, [sp, 0x4]
	movs r0, 0xA
	str r0, [sp, 0x8]
	movs r4, 0x2
	str r4, [sp, 0xC]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0x16
	mov r3, r8
	bl sub_809D104
	str r5, [sp]
	movs r0, 0x6
	str r0, [sp, 0x4]
	movs r0, 0x7
	str r0, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r0, r6, 0
	movs r1, 0xA
	b _080EF204
	.align 2, 0
_080EF134: .4byte 0x0600d800
_080EF138: .4byte gUnknown_08E9A100
_080EF13C:
	ldr r5, _080EF170 @ =0x0600d800
	ldr r6, _080EF174 @ =gUnknown_08E9A100
	movs r0, 0x14
	str r0, [sp]
	movs r4, 0x2
	str r4, [sp, 0x4]
	movs r0, 0xA
	str r0, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x16
	adds r3, r6, 0
	bl sub_809D104
	movs r0, 0
	str r0, [sp]
	movs r0, 0x6
	str r0, [sp, 0x4]
	movs r0, 0x7
	str r0, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r0, r5, 0
	movs r1, 0xA
	b _080EF1C2
	.align 2, 0
_080EF170: .4byte 0x0600d800
_080EF174: .4byte gUnknown_08E9A100
_080EF178:
	ldr r5, _080EF188 @ =0x0600d800
	ldr r6, _080EF18C @ =gUnknown_08E9A100
	movs r1, 0xA
	str r1, [sp]
	movs r0, 0x4
	str r0, [sp, 0x4]
	str r1, [sp, 0x8]
	b _080EF1A0
	.align 2, 0
_080EF188: .4byte 0x0600d800
_080EF18C: .4byte gUnknown_08E9A100
_080EF190:
	ldr r5, _080EF1CC @ =0x0600d800
	ldr r6, _080EF1D0 @ =gUnknown_08E9A100
	movs r0, 0x14
	str r0, [sp]
	movs r0, 0x4
	str r0, [sp, 0x4]
	movs r0, 0xA
	str r0, [sp, 0x8]
_080EF1A0:
	movs r4, 0x2
	str r4, [sp, 0xC]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x16
	adds r3, r6, 0
	bl sub_809D104
	movs r0, 0
	str r0, [sp]
	movs r0, 0x6
	str r0, [sp, 0x4]
	movs r0, 0x7
	str r0, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r0, r5, 0
	movs r1, 0x7
_080EF1C2:
	movs r2, 0x16
	adds r3, r6, 0
	bl sub_809D104
	b _080EF234
	.align 2, 0
_080EF1CC: .4byte 0x0600d800
_080EF1D0: .4byte gUnknown_08E9A100
_080EF1D4:
	ldr r6, _080EF210 @ =0x0600d800
	ldr r1, _080EF214 @ =gUnknown_08E9A100
	mov r8, r1
	movs r5, 0
	str r5, [sp]
	movs r4, 0x2
	str r4, [sp, 0x4]
	movs r0, 0xA
	str r0, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0x16
	mov r3, r8
	bl sub_809D104
	str r5, [sp]
	movs r0, 0x6
	str r0, [sp, 0x4]
	movs r0, 0x7
	str r0, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r0, r6, 0
	movs r1, 0x8
_080EF204:
	movs r2, 0x16
	mov r3, r8
	bl sub_809D104
	b _080EF234
	.align 2, 0
_080EF210: .4byte 0x0600d800
_080EF214: .4byte gUnknown_08E9A100
_080EF218:
	ldr r0, _080EF240 @ =0x0600d800
	ldr r3, _080EF244 @ =gUnknown_08E9A100
	movs r1, 0
	str r1, [sp]
	movs r1, 0x6
	str r1, [sp, 0x4]
	movs r1, 0x7
	str r1, [sp, 0x8]
	movs r1, 0x2
	str r1, [sp, 0xC]
	movs r1, 0x8
	movs r2, 0x16
	bl sub_809D104
_080EF234:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EF240: .4byte 0x0600d800
_080EF244: .4byte gUnknown_08E9A100
	thumb_func_end sub_80EEFBC

	thumb_func_start sub_80EF248
sub_80EF248: @ 80EF248
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080EF278 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080EF27C @ =0x0000d160
	adds r2, r0, r1
	movs r1, 0
	strh r1, [r2]
	ldr r1, _080EF280 @ =0x00006dac
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080EF270
_080EF264:
	adds r0, r4, 0
	bl sub_80EF284
	lsls r0, 24
	cmp r0, 0
	bne _080EF264
_080EF270:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EF278: .4byte gUnknown_083DFEC4
_080EF27C: .4byte 0x0000d160
_080EF280: .4byte 0x00006dac
	thumb_func_end sub_80EF248

	thumb_func_start sub_80EF284
sub_80EF284: @ 80EF284
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080EF2A8 @ =gUnknown_083DFEC4
	ldr r0, [r1]
	ldr r3, _080EF2AC @ =0x0000d160
	adds r0, r3
	ldrh r0, [r0]
	adds r3, r1, 0
	cmp r0, 0xB
	bls _080EF29C
	b _080EF3F6
_080EF29C:
	lsls r0, 2
	ldr r1, _080EF2B0 @ =_080EF2B4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EF2A8: .4byte gUnknown_083DFEC4
_080EF2AC: .4byte 0x0000d160
_080EF2B0: .4byte _080EF2B4
	.align 2, 0
_080EF2B4:
	.4byte _080EF2E4
	.4byte _080EF2EA
	.4byte _080EF2F8
	.4byte _080EF304
	.4byte _080EF310
	.4byte _080EF330
	.4byte _080EF344
	.4byte _080EF368
	.4byte _080EF37C
	.4byte _080EF390
	.4byte _080EF3A4
	.4byte _080EF3CC
_080EF2E4:
	bl sub_80EEDE8
	b _080EF40C
_080EF2EA:
	ldr r0, _080EF2F4 @ =gWindowConfig_81E7224
	bl SetUpWindowConfig
	b _080EF40C
	.align 2, 0
_080EF2F4: .4byte gWindowConfig_81E7224
_080EF2F8:
	ldr r0, _080EF300 @ =gWindowConfig_81E7224
	bl MultistepInitMenuWindowBegin
	b _080EF40C
	.align 2, 0
_080EF300: .4byte gWindowConfig_81E7224
_080EF304:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	beq _080EF30E
	b _080EF40C
_080EF30E:
	b _080EF41A
_080EF310:
	ldr r1, _080EF320 @ =gUnknown_083DFEEC
	ldr r2, _080EF324 @ =0x06005000
	ldr r0, _080EF328 @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _080EF32C @ =0x80000050
	b _080EF350
	.align 2, 0
_080EF320: .4byte gUnknown_083DFEEC
_080EF324: .4byte 0x06005000
_080EF328: .4byte 0x040000d4
_080EF32C: .4byte 0x80000050
_080EF330:
	ldr r0, _080EF33C @ =gUnknown_083DFF8C
	ldr r1, _080EF340 @ =0x0600f800
	bl LZ77UnCompVram
	b _080EF40C
	.align 2, 0
_080EF33C: .4byte gUnknown_083DFF8C
_080EF340: .4byte 0x0600f800
_080EF344:
	ldr r1, _080EF358 @ =gUnknown_083E005C
	ldr r2, _080EF35C @ =0x06008000
	ldr r0, _080EF360 @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _080EF364 @ =0x80000010
_080EF350:
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	b _080EF40C
	.align 2, 0
_080EF358: .4byte gUnknown_083E005C
_080EF35C: .4byte 0x06008000
_080EF360: .4byte 0x040000d4
_080EF364: .4byte 0x80000010
_080EF368:
	ldr r0, _080EF374 @ =gUnknown_083E007C
	ldr r1, _080EF378 @ =0x0600e000
	bl LZ77UnCompVram
	b _080EF40C
	.align 2, 0
_080EF374: .4byte gUnknown_083E007C
_080EF378: .4byte 0x0600e000
_080EF37C:
	ldr r0, _080EF388 @ =gPokenavOutlineTilemap
	ldr r1, _080EF38C @ =0x0600e800
	bl LZ77UnCompVram
	b _080EF40C
	.align 2, 0
_080EF388: .4byte gPokenavOutlineTilemap
_080EF38C: .4byte 0x0600e800
_080EF390:
	ldr r0, _080EF39C @ =gPokenavOutlineTiles
	ldr r1, _080EF3A0 @ =0x06008020
	bl LZ77UnCompVram
	b _080EF40C
	.align 2, 0
_080EF39C: .4byte gPokenavOutlineTiles
_080EF3A0: .4byte 0x06008020
_080EF3A4:
	adds r0, r2, 0
	bl sub_80EF54C
	ldr r0, _080EF3C4 @ =gUnknown_083DFECC
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _080EF3C8 @ =gPokenavOutlinePalette
	movs r1, 0x40
	movs r2, 0x20
	bl LoadPalette
	bl sub_80EF7D4
	b _080EF40C
	.align 2, 0
_080EF3C4: .4byte gUnknown_083DFECC
_080EF3C8: .4byte gPokenavOutlinePalette
_080EF3CC:
	ldr r1, _080EF3FC @ =REG_BG0CNT
	ldr r2, _080EF400 @ =0x00001f01
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080EF404 @ =0x00001d0a
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	subs r2, 0xFF
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x42
	movs r0, 0
	strh r0, [r1]
	ldr r1, [r3]
	ldr r3, _080EF408 @ =0x0000d160
	adds r1, r3
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EF3F6:
	movs r0, 0
	b _080EF41C
	.align 2, 0
_080EF3FC: .4byte REG_BG0CNT
_080EF400: .4byte 0x00001f01
_080EF404: .4byte 0x00001d0a
_080EF408: .4byte 0x0000d160
_080EF40C:
	ldr r0, _080EF420 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080EF424 @ =0x0000d160
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EF41A:
	movs r0, 0x1
_080EF41C:
	pop {r1}
	bx r1
	.align 2, 0
_080EF420: .4byte gUnknown_083DFEC4
_080EF424: .4byte 0x0000d160
	thumb_func_end sub_80EF284

	thumb_func_start sub_80EF428
sub_80EF428: @ 80EF428
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r3, r0, 0
	lsls r1, 24
	lsrs r2, r1, 24
	movs r1, 0
	cmp r0, 0x1
	beq _080EF454
	cmp r0, 0x1
	bgt _080EF444
	cmp r0, 0
	beq _080EF44A
	b _080EF464
_080EF444:
	cmp r3, 0x2
	beq _080EF45C
	b _080EF464
_080EF44A:
	ldr r1, _080EF450 @ =gUnknown_083E31B0
	b _080EF45E
	.align 2, 0
_080EF450: .4byte gUnknown_083E31B0
_080EF454:
	ldr r1, _080EF458 @ =gUnknown_083E31CC
	b _080EF45E
	.align 2, 0
_080EF458: .4byte gUnknown_083E31CC
_080EF45C:
	ldr r1, _080EF488 @ =gUnknown_083E31D8
_080EF45E:
	lsls r0, r2, 2
	adds r0, r1
	ldr r1, [r0]
_080EF464:
	ldr r0, _080EF48C @ =gUnknown_083DFEC8
	ldr r4, [r0]
	movs r0, 0x80
	lsls r0, 4
	adds r4, r0
	adds r0, r4, 0
	movs r2, 0xC0
	movs r3, 0x2
	bl sub_8072C74
	adds r0, r4, 0
	movs r1, 0x3
	movs r2, 0x11
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EF488: .4byte gUnknown_083E31D8
_080EF48C: .4byte gUnknown_083DFEC8
	thumb_func_end sub_80EF428

	thumb_func_start sub_80EF490
sub_80EF490: @ 80EF490
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bne _080EF49C
	movs r2, 0x1
_080EF49C:
	ldr r0, _080EF4C4 @ =gUnknown_083DFEC4
	ldr r3, [r0]
	lsls r1, r2, 4
	subs r1, r2
	lsls r2, r1, 1
	ldr r4, _080EF4C8 @ =0x0000ce4e
	adds r0, r3, r4
	strh r2, [r0]
	ldr r2, _080EF4CC @ =0x0000ce4c
	adds r0, r3, r2
	ldrh r2, [r0]
	lsls r1, 17
	lsrs r0, r1, 16
	cmp r2, r0
	bcs _080EF4D0
	adds r4, 0x2
	adds r1, r3, r4
	movs r0, 0x2
	b _080EF4EA
	.align 2, 0
_080EF4C4: .4byte gUnknown_083DFEC4
_080EF4C8: .4byte 0x0000ce4e
_080EF4CC: .4byte 0x0000ce4c
_080EF4D0:
	cmp r2, r0
	bls _080EF4E4
	ldr r0, _080EF4DC @ =0x0000ce50
	adds r1, r3, r0
	ldr r0, _080EF4E0 @ =0x0000fffe
	b _080EF4EA
	.align 2, 0
_080EF4DC: .4byte 0x0000ce50
_080EF4E0: .4byte 0x0000fffe
_080EF4E4:
	ldr r2, _080EF4F4 @ =0x0000ce50
	adds r1, r3, r2
	movs r0, 0
_080EF4EA:
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EF4F4: .4byte 0x0000ce50
	thumb_func_end sub_80EF490

	thumb_func_start sub_80EF4F8
sub_80EF4F8: @ 80EF4F8
	push {r4,lr}
	ldr r0, _080EF530 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080EF534 @ =0x0000ce4c
	adds r2, r1, r0
	ldr r3, _080EF538 @ =0x0000ce4e
	adds r0, r1, r3
	ldrh r3, [r2]
	ldrh r0, [r0]
	cmp r3, r0
	beq _080EF544
	ldr r4, _080EF53C @ =0x0000ce50
	adds r0, r1, r4
	ldrh r0, [r0]
	adds r0, r3, r0
	strh r0, [r2]
	ldr r3, _080EF540 @ =0x0000ce52
	adds r0, r1, r3
	ldrh r1, [r2]
	lsls r1, 1
	adds r0, r1
	movs r1, 0x31
	movs r2, 0x4
	bl LoadPalette
	movs r0, 0x1
	b _080EF546
	.align 2, 0
_080EF530: .4byte gUnknown_083DFEC4
_080EF534: .4byte 0x0000ce4c
_080EF538: .4byte 0x0000ce4e
_080EF53C: .4byte 0x0000ce50
_080EF540: .4byte 0x0000ce52
_080EF544:
	movs r0, 0
_080EF546:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80EF4F8

	thumb_func_start sub_80EF54C
sub_80EF54C: @ 80EF54C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bne _080EF558
	movs r2, 0x1
_080EF558:
	ldr r0, _080EF580 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	lsls r1, r2, 4
	subs r1, r2
	lsls r1, 1
	ldr r3, _080EF584 @ =0x0000ce4c
	adds r2, r0, r3
	strh r1, [r2]
	ldrh r1, [r2]
	lsls r1, 1
	ldr r2, _080EF588 @ =0x0000ce52
	adds r1, r2
	adds r0, r1
	movs r1, 0x31
	movs r2, 0x4
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_080EF580: .4byte gUnknown_083DFEC4
_080EF584: .4byte 0x0000ce4c
_080EF588: .4byte 0x0000ce52
	thumb_func_end sub_80EF54C

	thumb_func_start sub_80EF58C
sub_80EF58C: @ 80EF58C
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x1
	beq _080EF5D0
	cmp r0, 0x1
	bgt _080EF5A4
	cmp r0, 0
	beq _080EF5AA
	b _080EF610
_080EF5A4:
	cmp r1, 0x2
	beq _080EF5F8
	b _080EF610
_080EF5AA:
	movs r1, 0
	ldr r0, _080EF5C8 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r3, _080EF5CC @ =0x0000ce52
	adds r2, r0, r3
	movs r3, 0
_080EF5B6:
	lsls r0, r1, 1
	adds r0, r2, r0
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x3D
	bls _080EF5B6
	b _080EF610
	.align 2, 0
_080EF5C8: .4byte gUnknown_083DFEC4
_080EF5CC: .4byte 0x0000ce52
_080EF5D0:
	ldr r0, _080EF5EC @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080EF5F0 @ =0x0000ce52
	adds r2, r0, r1
	ldr r1, _080EF5F4 @ =gUnknown_083E003C
	adds r0, r1, 0x2
	adds r1, 0x6
	str r2, [sp]
	movs r2, 0x10
	movs r3, 0x2
	bl sub_80EF624
	b _080EF610
	.align 2, 0
_080EF5EC: .4byte gUnknown_083DFEC4
_080EF5F0: .4byte 0x0000ce52
_080EF5F4: .4byte gUnknown_083E003C
_080EF5F8:
	ldr r0, _080EF618 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r3, _080EF61C @ =0x0000ce8e
	adds r2, r0, r3
	ldr r1, _080EF620 @ =gUnknown_083E003C
	adds r0, r1, 0x6
	adds r1, 0xE
	str r2, [sp]
	movs r2, 0x10
	movs r3, 0x2
	bl sub_80EF624
_080EF610:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080EF618: .4byte gUnknown_083DFEC4
_080EF61C: .4byte 0x0000ce8e
_080EF620: .4byte gUnknown_083E003C
	thumb_func_end sub_80EF58C

	thumb_func_start sub_80EF624
sub_80EF624: @ 80EF624
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x38
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r4, [sp, 0x58]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x8]
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0xC]
	movs r0, 0
	str r0, [sp, 0x10]
	lsls r0, r3, 16
	ldr r1, [sp, 0x10]
	cmp r1, r3
	bcs _080EF72E
	subs r2, 0x1
	str r2, [sp, 0x20]
	str r0, [sp, 0x2C]
_080EF654:
	ldr r2, [sp]
	ldrh r1, [r2]
	movs r0, 0x1F
	ands r0, r1
	lsls r7, r0, 8
	lsls r1, 16
	lsrs r0, r1, 21
	movs r2, 0x1F
	ands r0, r2
	lsls r6, r0, 8
	lsrs r1, 26
	ands r1, r2
	lsls r5, r1, 8
	ldr r0, [sp, 0x4]
	ldrh r1, [r0]
	movs r0, 0x1F
	ands r0, r1
	lsls r0, 8
	str r0, [sp, 0x14]
	lsls r1, 16
	lsrs r0, r1, 21
	ands r0, r2
	lsls r0, 8
	str r0, [sp, 0x18]
	lsrs r1, 26
	ands r1, r2
	lsls r1, 8
	str r1, [sp, 0x1C]
	ldr r1, [sp, 0x14]
	subs r0, r1, r7
	ldr r1, [sp, 0x8]
	bl __divsi3
	mov r10, r0
	ldr r2, [sp, 0x18]
	subs r0, r2, r6
	ldr r1, [sp, 0x8]
	bl __divsi3
	mov r9, r0
	ldr r1, [sp, 0x1C]
	subs r0, r1, r5
	ldr r1, [sp, 0x8]
	bl __divsi3
	mov r8, r0
	adds r3, r4, 0
	movs r4, 0
	ldr r2, [sp]
	adds r2, 0x2
	str r2, [sp, 0x30]
	ldr r0, [sp, 0x4]
	adds r0, 0x2
	str r0, [sp, 0x34]
	adds r1, r3, 0x2
	str r1, [sp, 0x24]
	ldr r2, [sp, 0x10]
	adds r2, 0x1
	str r2, [sp, 0x28]
	ldr r0, [sp, 0x20]
	cmp r4, r0
	bge _080EF700
	ldr r1, [sp, 0xC]
	lsls r1, 1
	mov r12, r1
_080EF6D6:
	lsls r0, r7, 8
	lsrs r2, r0, 16
	lsls r0, r6, 8
	lsrs r1, r0, 16
	lsls r0, r5, 8
	lsrs r0, 16
	lsls r0, 10
	lsls r1, 5
	orrs r0, r1
	orrs r2, r0
	strh r2, [r3]
	add r3, r12
	add r7, r10
	add r6, r9
	add r5, r8
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r2, [sp, 0x20]
	cmp r4, r2
	blt _080EF6D6
_080EF700:
	ldr r4, [sp, 0x14]
	lsrs r2, r4, 8
	ldr r1, [sp, 0x1C]
	lsls r0, r1, 2
	ldr r4, [sp, 0x18]
	lsrs r1, r4, 3
	orrs r0, r1
	orrs r2, r0
	strh r2, [r3]
	ldr r0, [sp, 0x30]
	str r0, [sp]
	ldr r1, [sp, 0x34]
	str r1, [sp, 0x4]
	ldr r4, [sp, 0x24]
	ldr r2, [sp, 0x28]
	lsls r0, r2, 16
	lsrs r0, 16
	str r0, [sp, 0x10]
	ldr r1, [sp, 0x2C]
	lsrs r0, r1, 16
	ldr r2, [sp, 0x10]
	cmp r2, r0
	bcc _080EF654
_080EF72E:
	add sp, 0x38
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80EF624

	thumb_func_start sub_80EF740
sub_80EF740: @ 80EF740
	push {lr}
	ldr r0, _080EF770 @ =gUnknown_083DFEC4
	ldr r3, [r0]
	ldr r0, _080EF774 @ =0x00006da0
	adds r2, r3, r0
	ldrh r0, [r2]
	adds r0, 0x1
	movs r1, 0x1
	ands r0, r1
	strh r0, [r2]
	cmp r0, 0
	beq _080EF762
	ldr r2, _080EF778 @ =0x00006da2
	adds r1, r3, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EF762:
	ldr r0, _080EF77C @ =REG_BG3HOFS
	ldr r2, _080EF778 @ =0x00006da2
	adds r1, r3, r2
	ldrh r1, [r1]
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080EF770: .4byte gUnknown_083DFEC4
_080EF774: .4byte 0x00006da0
_080EF778: .4byte 0x00006da2
_080EF77C: .4byte REG_BG3HOFS
	thumb_func_end sub_80EF740

	thumb_func_start sub_80EF780
sub_80EF780: @ 80EF780
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080EF7B0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080EF7AA
	ldr r0, _080EF7B4 @ =gUnknown_083DFEC4
	ldr r3, [r0]
	ldr r0, _080EF7B8 @ =0x00006da2
	adds r2, r3, r0
	ldrh r0, [r2]
	movs r1, 0x7
	ands r1, r0
	cmp r1, 0
	beq _080EF7BC
_080EF7AA:
	bl sub_80EF740
	b _080EF7C8
	.align 2, 0
_080EF7B0: .4byte gTasks
_080EF7B4: .4byte gUnknown_083DFEC4
_080EF7B8: .4byte 0x00006da2
_080EF7BC:
	strh r1, [r2]
	ldr r2, _080EF7CC @ =0x00006da0
	adds r0, r3, r2
	strh r1, [r0]
	ldr r0, _080EF7D0 @ =REG_BG3HOFS
	strh r1, [r0]
_080EF7C8:
	pop {r0}
	bx r0
	.align 2, 0
_080EF7CC: .4byte 0x00006da0
_080EF7D0: .4byte REG_BG3HOFS
	thumb_func_end sub_80EF780

	thumb_func_start sub_80EF7D4
sub_80EF7D4: @ 80EF7D4
	push {r4,lr}
	ldr r0, _080EF800 @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r1, _080EF804 @ =0x00006da2
	adds r0, r4, r1
	movs r1, 0
	strh r1, [r0]
	ldr r2, _080EF808 @ =0x00006da0
	adds r0, r4, r2
	strh r1, [r0]
	ldr r0, _080EF80C @ =sub_80EF780
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080EF810 @ =0x00006da4
	adds r4, r1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EF800: .4byte gUnknown_083DFEC4
_080EF804: .4byte 0x00006da2
_080EF808: .4byte 0x00006da0
_080EF80C: .4byte sub_80EF780
_080EF810: .4byte 0x00006da4
	thumb_func_end sub_80EF7D4

	thumb_func_start sub_80EF814
sub_80EF814: @ 80EF814
	push {lr}
	ldr r0, _080EF834 @ =sub_80EF780
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	beq _080EF830
	ldr r0, _080EF838 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080EF83C @ =0x00006da4
	adds r0, r1
	ldrb r0, [r0]
	bl DestroyTask
_080EF830:
	pop {r0}
	bx r0
	.align 2, 0
_080EF834: .4byte sub_80EF780
_080EF838: .4byte gUnknown_083DFEC4
_080EF83C: .4byte 0x00006da4
	thumb_func_end sub_80EF814

	thumb_func_start sub_80EF840
sub_80EF840: @ 80EF840
	push {lr}
	ldr r0, _080EF868 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080EF86C @ =0x0000d160
	adds r2, r0, r1
	movs r1, 0
	strh r1, [r2]
	ldr r1, _080EF870 @ =0x00006dac
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080EF862
_080EF858:
	bl sub_80EF874
	lsls r0, 24
	cmp r0, 0
	bne _080EF858
_080EF862:
	pop {r0}
	bx r0
	.align 2, 0
_080EF868: .4byte gUnknown_083DFEC4
_080EF86C: .4byte 0x0000d160
_080EF870: .4byte 0x00006dac
	thumb_func_end sub_80EF840

	thumb_func_start sub_80EF874
sub_80EF874: @ 80EF874
	push {lr}
	ldr r0, _080EF890 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080EF894 @ =0x0000d160
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0xB
	bls _080EF886
	b _080EF9D8
_080EF886:
	lsls r0, 2
	ldr r1, _080EF898 @ =_080EF89C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EF890: .4byte gUnknown_083DFEC4
_080EF894: .4byte 0x0000d160
_080EF898: .4byte _080EF89C
	.align 2, 0
_080EF89C:
	.4byte _080EF8CC
	.4byte _080EF8D2
	.4byte _080EF8E0
	.4byte _080EF8EC
	.4byte _080EF8F6
	.4byte _080EF8FC
	.4byte _080EF920
	.4byte _080EF92C
	.4byte _080EF940
	.4byte _080EF954
	.4byte _080EF960
	.4byte _080EF972
_080EF8CC:
	bl sub_80EEDE8
	b _080EF9DC
_080EF8D2:
	ldr r0, _080EF8DC @ =gWindowConfig_81E7224
	bl SetUpWindowConfig
	b _080EF9DC
	.align 2, 0
_080EF8DC: .4byte gWindowConfig_81E7224
_080EF8E0:
	ldr r0, _080EF8E8 @ =gWindowConfig_81E7224
	bl MultistepInitMenuWindowBegin
	b _080EF9DC
	.align 2, 0
_080EF8E8: .4byte gWindowConfig_81E7224
_080EF8EC:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	bne _080EF9DC
	b _080EF9EA
_080EF8F6:
	bl MenuZeroFillScreen
	b _080EF9DC
_080EF8FC:
	ldr r0, _080EF914 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080EF918 @ =0x00006e18
	adds r0, r2
	ldr r1, _080EF91C @ =gSaveBlock2
	ldrb r1, [r1, 0x15]
	lsrs r1, 3
	movs r2, 0x1
	ands r1, r2
	bl sub_80FA904
	b _080EF9DC
	.align 2, 0
_080EF914: .4byte gUnknown_083DFEC4
_080EF918: .4byte 0x00006e18
_080EF91C: .4byte gSaveBlock2
_080EF920:
	bl sub_80FA940
	lsls r0, 24
	cmp r0, 0
	beq _080EF9DC
	b _080EF9EA
_080EF92C:
	ldr r0, _080EF938 @ =gPokenavHoennMapSquares_Gfx
	ldr r1, _080EF93C @ =0x06005000
	bl LZ77UnCompVram
	b _080EF9DC
	.align 2, 0
_080EF938: .4byte gPokenavHoennMapSquares_Gfx
_080EF93C: .4byte 0x06005000
_080EF940:
	ldr r0, _080EF950 @ =gPokenavHoennMapSquares_Pal
	movs r1, 0x30
	movs r2, 0x20
	bl LoadPalette
	bl sub_80EFC3C
	b _080EF9DC
	.align 2, 0
_080EF950: .4byte gPokenavHoennMapSquares_Pal
_080EF954:
	bl sub_80EFC64
	lsls r0, 24
	cmp r0, 0
	beq _080EF9DC
	b _080EF9EA
_080EF960:
	movs r0, 0xD
	movs r1, 0x3
	movs r2, 0x1D
	movs r3, 0x11
	bl MenuDrawTextWindow
	bl sub_80EF9F8
	b _080EF9DC
_080EF972:
	ldr r0, _080EF990 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _080EF994 @ =0x00006e90
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080EF9A0
	ldr r2, _080EF998 @ =0x00007698
	adds r0, r1, r2
	movs r1, 0xA0
	strh r1, [r0]
	ldr r0, _080EF99C @ =REG_BG0VOFS
	strh r1, [r0]
	b _080EF9B0
	.align 2, 0
_080EF990: .4byte gUnknown_083DFEC4
_080EF994: .4byte 0x00006e90
_080EF998: .4byte 0x00007698
_080EF99C: .4byte REG_BG0VOFS
_080EF9A0:
	ldr r0, _080EF9C8 @ =0x00007698
	adds r1, r0
	movs r2, 0
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r1]
	ldr r0, _080EF9CC @ =REG_BG0VOFS
	strh r2, [r0]
_080EF9B0:
	ldr r2, _080EF9D0 @ =REG_BG0CNT
	ldrh r0, [r2]
	strh r0, [r2]
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080EF9D4 @ =REG_BLDCNT
	movs r0, 0
	strh r0, [r1]
	b _080EF9DC
	.align 2, 0
_080EF9C8: .4byte 0x00007698
_080EF9CC: .4byte REG_BG0VOFS
_080EF9D0: .4byte REG_BG0CNT
_080EF9D4: .4byte REG_BLDCNT
_080EF9D8:
	movs r0, 0
	b _080EF9EC
_080EF9DC:
	ldr r0, _080EF9F0 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _080EF9F4 @ =0x0000d160
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EF9EA:
	movs r0, 0x1
_080EF9EC:
	pop {r1}
	bx r1
	.align 2, 0
_080EF9F0: .4byte gUnknown_083DFEC4
_080EF9F4: .4byte 0x0000d160
	thumb_func_end sub_80EF874

	thumb_func_start sub_80EF9F8
sub_80EF9F8: @ 80EF9F8
	push {r4-r6,lr}
	sub sp, 0x14
	movs r5, 0x4
	ldr r0, _080EFA18 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080EFA1C @ =0x00006e2e
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _080EFA0E
	b _080EFB6A
_080EFA0E:
	lsls r0, 2
	ldr r1, _080EFA20 @ =_080EFA24
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EFA18: .4byte gUnknown_083DFEC4
_080EFA1C: .4byte 0x00006e2e
_080EFA20: .4byte _080EFA24
	.align 2, 0
_080EFA24:
	.4byte _080EFB6A
	.4byte _080EFA38
	.4byte _080EFAC0
	.4byte _080EFB4C
	.4byte _080EFA38
_080EFA38:
	ldr r0, _080EFA64 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080EFA68 @ =0x00006e18
	adds r0, r2
	lsls r2, r5, 19
	lsrs r2, 16
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0x70
	movs r3, 0x78
	bl sub_8072A18
	adds r0, r5, 0x2
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _080EFA6C @ =gLinkOpen
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080EFA70
	bl sub_80F1A80
	b _080EFB82
	.align 2, 0
_080EFA64: .4byte gUnknown_083DFEC4
_080EFA68: .4byte 0x00006e18
_080EFA6C: .4byte gLinkOpen
_080EFA70:
	movs r4, 0
	b _080EFA92
_080EFA74:
	lsls r2, r5, 19
	lsrs r2, 16
	movs r0, 0x1
	str r0, [sp]
	adds r0, r1, 0
	movs r1, 0x70
	movs r3, 0x78
	bl sub_8072A18
	adds r0, r5, 0x2
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_080EFA92:
	cmp r4, 0x3
	bhi _080EFB6A
	ldr r0, _080EFAB8 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _080EFABC @ =0x00006e2c
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, 0x3
	adds r1, r2
	ldrb r1, [r1]
	lsls r2, r4, 24
	lsrs r2, 24
	bl GetLandmarkName
	adds r1, r0, 0
	cmp r1, 0
	bne _080EFA74
	b _080EFB6A
	.align 2, 0
_080EFAB8: .4byte gUnknown_083DFEC4
_080EFABC: .4byte 0x00006e2c
_080EFAC0:
	ldr r0, _080EFB38 @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r1, _080EFB3C @ =0x00006e18
	adds r0, r4, r1
	lsls r2, r5, 19
	lsrs r2, 16
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0x70
	movs r3, 0x78
	bl sub_8072A18
	adds r0, r5, 0x2
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r2, _080EFB40 @ =0x00006e2c
	adds r0, r4, r2
	ldrh r1, [r0]
	adds r2, 0x3
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, 2
	lsls r1, 3
	adds r0, r1
	ldr r1, _080EFB44 @ =0x0000cdcc
	adds r4, r1
	adds r6, r4, r0
	ldr r0, [r6]
	cmp r0, 0
	beq _080EFB6A
	lsls r4, r5, 24
	lsrs r4, 24
	movs r0, 0xE
	adds r1, r4, 0
	movs r2, 0xF
	movs r3, 0xF
	bl MenuFillWindowRectWithBlankTile
	movs r0, 0x1A
	adds r1, r4, 0
	movs r2, 0x1C
	movs r3, 0xF
	bl MenuFillWindowRectWithBlankTile
	ldr r0, _080EFB48 @ =0x0600f800
	ldr r3, [r6]
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r1, 0xA
	str r1, [sp, 0x8]
	str r1, [sp, 0xC]
	str r1, [sp, 0x10]
	movs r1, 0x10
	movs r2, 0x6
	bl sub_8095C8C
	adds r0, r5, 0
	adds r0, 0xB
	b _080EFB66
	.align 2, 0
_080EFB38: .4byte gUnknown_083DFEC4
_080EFB3C: .4byte 0x00006e18
_080EFB40: .4byte 0x00006e2c
_080EFB44: .4byte 0x0000cdcc
_080EFB48: .4byte 0x0600f800
_080EFB4C:
	ldr r0, _080EFB98 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080EFB9C @ =0x00006e18
	adds r0, r2
	lsls r2, r5, 19
	lsrs r2, 16
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0x70
	movs r3, 0x78
	bl sub_8072A18
	adds r0, r5, 0x2
_080EFB66:
	lsls r0, 16
	lsrs r5, r0, 16
_080EFB6A:
	movs r0, 0
	cmp r0, 0
	bne _080EFB82
	cmp r5, 0xF
	bhi _080EFB82
	lsls r1, r5, 24
	lsrs r1, 24
	movs r0, 0xE
	movs r2, 0x1C
	movs r3, 0xF
	bl MenuFillWindowRectWithBlankTile
_080EFB82:
	ldr r0, _080EFB98 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080EFBA0 @ =0x00006e2e
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _080EFBA4
	bl sub_80EFD74
	b _080EFBA8
	.align 2, 0
_080EFB98: .4byte gUnknown_083DFEC4
_080EFB9C: .4byte 0x00006e18
_080EFBA0: .4byte 0x00006e2e
_080EFBA4:
	bl sub_80EFDA0
_080EFBA8:
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80EF9F8

	thumb_func_start sub_80EFBB0
sub_80EFBB0: @ 80EFBB0
	push {lr}
	ldr r0, _080EFBC8 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080EFBCC @ =0x00006e90
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080EFBD0
	movs r0, 0x8
	bl sub_80EEFBC
	b _080EFBD6
	.align 2, 0
_080EFBC8: .4byte gUnknown_083DFEC4
_080EFBCC: .4byte 0x00006e90
_080EFBD0:
	movs r0, 0x7
	bl sub_80EEFBC
_080EFBD6:
	pop {r0}
	bx r0
	thumb_func_end sub_80EFBB0

	thumb_func_start sub_80EFBDC
sub_80EFBDC: @ 80EFBDC
	push {r4,lr}
	lsls r0, 24
	movs r4, 0x1
	ldr r2, _080EFBFC @ =gUnknown_083DFEC4
	ldr r1, [r2]
	ldr r3, _080EFC00 @ =0x00007698
	adds r1, r3
	ldrh r3, [r1]
	cmp r0, 0
	beq _080EFC08
	cmp r3, 0xA8
	bls _080EFC04
	adds r0, r3, 0
	subs r0, 0x8
	b _080EFC10
	.align 2, 0
_080EFBFC: .4byte gUnknown_083DFEC4
_080EFC00: .4byte 0x00007698
_080EFC04:
	movs r3, 0xA0
	b _080EFC1A
_080EFC08:
	cmp r3, 0xF7
	bhi _080EFC16
	adds r0, r3, 0
	adds r0, 0x8
_080EFC10:
	lsls r0, 16
	lsrs r3, r0, 16
	b _080EFC1C
_080EFC16:
	movs r3, 0x80
	lsls r3, 1
_080EFC1A:
	movs r4, 0
_080EFC1C:
	ldr r0, [r2]
	ldr r1, _080EFC34 @ =0x00007698
	adds r0, r1
	strh r3, [r0]
	ldr r1, _080EFC38 @ =REG_BG0VOFS
	movs r0, 0xFF
	ands r3, r0
	strh r3, [r1]
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080EFC34: .4byte 0x00007698
_080EFC38: .4byte REG_BG0VOFS
	thumb_func_end sub_80EFBDC

	thumb_func_start sub_80EFC3C
sub_80EFC3C: @ 80EFC3C
	push {lr}
	ldr r0, _080EFC58 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080EFC5C @ =0x0000bc9a
	adds r1, r0, r2
	movs r2, 0
	strb r2, [r1]
	ldr r1, _080EFC60 @ =0x0000bc9b
	adds r0, r1
	strb r2, [r0]
	bl sub_80EFD3C
	pop {r0}
	bx r0
	.align 2, 0
_080EFC58: .4byte gUnknown_083DFEC4
_080EFC5C: .4byte 0x0000bc9a
_080EFC60: .4byte 0x0000bc9b
	thumb_func_end sub_80EFC3C

	thumb_func_start sub_80EFC64
sub_80EFC64: @ 80EFC64
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	ldr r4, _080EFCD0 @ =gUnknown_083DFEC4
	ldr r2, [r4]
	ldr r0, _080EFCD4 @ =0x0000bc9a
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0xF
	bhi _080EFD2C
	ldrb r1, [r1]
	mov r8, r1
	ldr r1, _080EFCD8 @ =0x0000bc9b
	adds r0, r2, r1
	ldrb r7, [r0]
	movs r2, 0
	ldr r0, _080EFCDC @ =gPokenavCityMaps
	mov r9, r0
	adds r3, r4, 0
_080EFC8E:
	lsls r0, r2, 2
	mov r4, r8
	lsls r1, r4, 3
	adds r6, r0, r1
	mov r1, r9
	adds r0, r6, r1
	ldr r1, [r0]
	cmp r1, 0
	beq _080EFCE8
	movs r0, 0xC8
	adds r5, r7, 0
	muls r5, r0
	ldr r4, _080EFCE0 @ =0x0000bc9c
	adds r5, r4
	ldr r4, [r3]
	adds r5, r4, r5
	adds r0, r1, 0
	adds r1, r5, 0
	str r2, [sp]
	str r3, [sp, 0x4]
	bl LZ77UnCompVram
	ldr r0, _080EFCE4 @ =0x0000cdcc
	adds r4, r0
	adds r4, r6
	str r5, [r4]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r2, [sp]
	ldr r3, [sp, 0x4]
	b _080EFCF2
	.align 2, 0
_080EFCD0: .4byte gUnknown_083DFEC4
_080EFCD4: .4byte 0x0000bc9a
_080EFCD8: .4byte 0x0000bc9b
_080EFCDC: .4byte gPokenavCityMaps
_080EFCE0: .4byte 0x0000bc9c
_080EFCE4: .4byte 0x0000cdcc
_080EFCE8:
	ldr r0, [r3]
	ldr r4, _080EFD1C @ =0x0000cdcc
	adds r0, r4
	adds r0, r6
	str r1, [r0]
_080EFCF2:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x1
	bls _080EFC8E
	ldr r0, _080EFD20 @ =gUnknown_083DFEC4
	ldr r2, [r0]
	ldr r0, _080EFD24 @ =0x0000bc9a
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xF
	bhi _080EFD2C
	ldr r1, _080EFD28 @ =0x0000bc9b
	adds r0, r2, r1
	strb r7, [r0]
	movs r0, 0x1
	b _080EFD2E
	.align 2, 0
_080EFD1C: .4byte 0x0000cdcc
_080EFD20: .4byte gUnknown_083DFEC4
_080EFD24: .4byte 0x0000bc9a
_080EFD28: .4byte 0x0000bc9b
_080EFD2C:
	movs r0, 0
_080EFD2E:
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80EFC64

	thumb_func_start sub_80EFD3C
sub_80EFD3C: @ 80EFD3C
	ldr r0, _080EFD60 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _080EFD64 @ =0x0000769e
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	ldr r0, _080EFD68 @ =0x0000769c
	adds r3, r1, r0
	movs r0, 0x2F
	strb r0, [r3]
	ldr r3, _080EFD6C @ =0x0000769d
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _080EFD70 @ =0x0000769a
	adds r1, r0
	strh r2, [r1]
	bx lr
	.align 2, 0
_080EFD60: .4byte gUnknown_083DFEC4
_080EFD64: .4byte 0x0000769e
_080EFD68: .4byte 0x0000769c
_080EFD6C: .4byte 0x0000769d
_080EFD70: .4byte 0x0000769a
	thumb_func_end sub_80EFD3C

	thumb_func_start sub_80EFD74
sub_80EFD74: @ 80EFD74
	push {lr}
	ldr r0, _080EFD94 @ =gUnknown_083DFEC4
	ldr r2, [r0]
	ldr r0, _080EFD98 @ =0x0000769e
	adds r1, r2, r0
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _080EFD9C @ =0x0000769d
	adds r2, r0
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _080EFD90
	movs r0, 0x2
	strb r0, [r2]
_080EFD90:
	pop {r0}
	bx r0
	.align 2, 0
_080EFD94: .4byte gUnknown_083DFEC4
_080EFD98: .4byte 0x0000769e
_080EFD9C: .4byte 0x0000769d
	thumb_func_end sub_80EFD74

	thumb_func_start sub_80EFDA0
sub_80EFDA0: @ 80EFDA0
	push {r4,lr}
	sub sp, 0x14
	ldr r0, _080EFDD4 @ =0x0600f800
	ldr r3, _080EFDD8 @ =gUnknown_08E9AC2C
	movs r4, 0
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r2, 0xF
	str r2, [sp, 0x8]
	movs r1, 0x1
	str r1, [sp, 0xC]
	str r2, [sp, 0x10]
	movs r1, 0xE
	movs r2, 0x10
	bl sub_8095C8C
	ldr r0, _080EFDDC @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080EFDE0 @ =0x0000769e
	adds r0, r1
	strb r4, [r0]
	add sp, 0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EFDD4: .4byte 0x0600f800
_080EFDD8: .4byte gUnknown_08E9AC2C
_080EFDDC: .4byte gUnknown_083DFEC4
_080EFDE0: .4byte 0x0000769e
	thumb_func_end sub_80EFDA0

	thumb_func_start sub_80EFDE4
sub_80EFDE4: @ 80EFDE4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	ldr r0, _080EFE68 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _080EFE6C @ =0x0000769c
	adds r0, r1, r2
	ldrb r2, [r0]
	movs r0, 0x3C
	subs r0, r2
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xF
	bls _080EFE06
	movs r4, 0xF
_080EFE06:
	ldr r3, _080EFE70 @ =0x0000769e
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	beq _080EFE58
	ldr r0, _080EFE74 @ =0x0600f800
	mov r8, r0
	ldr r3, _080EFE78 @ =gUnknown_08E9ABB4
	mov r9, r3
	str r2, [sp]
	movs r5, 0
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r7, 0x1
	str r7, [sp, 0xC]
	movs r6, 0x3C
	str r6, [sp, 0x10]
	movs r1, 0xE
	movs r2, 0x10
	bl sub_8095C8C
	cmp r4, 0xE
	bhi _080EFE58
	adds r1, r4, 0
	adds r1, 0xE
	lsls r1, 16
	lsrs r1, 16
	str r5, [sp]
	str r5, [sp, 0x4]
	movs r0, 0xF
	subs r0, r4
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	str r7, [sp, 0xC]
	str r6, [sp, 0x10]
	mov r0, r8
	movs r2, 0x10
	mov r3, r9
	bl sub_8095C8C
_080EFE58:
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EFE68: .4byte gUnknown_083DFEC4
_080EFE6C: .4byte 0x0000769c
_080EFE70: .4byte 0x0000769e
_080EFE74: .4byte 0x0600f800
_080EFE78: .4byte gUnknown_08E9ABB4
	thumb_func_end sub_80EFDE4

	thumb_func_start sub_80EFE7C
sub_80EFE7C: @ 80EFE7C
	push {r4,lr}
	ldr r0, _080EFE98 @ =gUnknown_083DFEC4
	ldr r2, [r0]
	ldr r0, _080EFE9C @ =0x0000769d
	adds r4, r2, r0
	ldrb r1, [r4]
	cmp r1, 0x1
	beq _080EFF08
	cmp r1, 0x1
	bgt _080EFEA0
	cmp r1, 0
	beq _080EFEA6
	b _080EFF2E
	.align 2, 0
_080EFE98: .4byte gUnknown_083DFEC4
_080EFE9C: .4byte 0x0000769d
_080EFEA0:
	cmp r1, 0x2
	beq _080EFF24
	b _080EFF2E
_080EFEA6:
	ldr r0, _080EFED4 @ =0x0000769c
	adds r4, r2, r0
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3B
	bls _080EFEBA
	strb r1, [r4]
_080EFEBA:
	ldr r1, _080EFED8 @ =0x0000769e
	adds r0, r2, r1
	ldrb r0, [r0]
	bl sub_80EFDE4
	ldrb r0, [r4]
	cmp r0, 0xF
	beq _080EFEE4
	cmp r0, 0xF
	bgt _080EFEDC
	cmp r0, 0
	beq _080EFEE4
	b _080EFF2E
	.align 2, 0
_080EFED4: .4byte 0x0000769c
_080EFED8: .4byte 0x0000769e
_080EFEDC:
	cmp r0, 0x1E
	beq _080EFEE4
	cmp r0, 0x2D
	bne _080EFF2E
_080EFEE4:
	ldr r0, _080EFEFC @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080EFF00 @ =0x0000769d
	adds r2, r1, r0
	movs r3, 0
	movs r0, 0x1
	strb r0, [r2]
	ldr r0, _080EFF04 @ =0x0000769a
	adds r1, r0
	strh r3, [r1]
	b _080EFF2E
	.align 2, 0
_080EFEFC: .4byte gUnknown_083DFEC4
_080EFF00: .4byte 0x0000769d
_080EFF04: .4byte 0x0000769a
_080EFF08:
	ldr r0, _080EFF20 @ =0x0000769a
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x78
	bls _080EFF2E
	movs r0, 0
	strh r0, [r1]
	b _080EFF2C
	.align 2, 0
_080EFF20: .4byte 0x0000769a
_080EFF24:
	movs r0, 0x1
	bl sub_80EFDE4
	movs r0, 0x1
_080EFF2C:
	strb r0, [r4]
_080EFF2E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80EFE7C

	thumb_func_start sub_80EFF34
sub_80EFF34: @ 80EFF34
	push {lr}
	ldr r0, _080EFF5C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080EFF60 @ =0x0000d160
	adds r2, r0, r1
	movs r1, 0
	strh r1, [r2]
	ldr r1, _080EFF64 @ =0x00006dac
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080EFF56
_080EFF4C:
	bl sub_80EFF68
	lsls r0, 24
	cmp r0, 0
	bne _080EFF4C
_080EFF56:
	pop {r0}
	bx r0
	.align 2, 0
_080EFF5C: .4byte gUnknown_083DFEC4
_080EFF60: .4byte 0x0000d160
_080EFF64: .4byte 0x00006dac
	thumb_func_end sub_80EFF34

	thumb_func_start sub_80EFF68
sub_80EFF68: @ 80EFF68
	push {r4,lr}
	sub sp, 0x14
	ldr r0, _080EFF88 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080EFF8C @ =0x0000d160
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0xD
	bls _080EFF7C
	b _080F0150
_080EFF7C:
	lsls r0, 2
	ldr r1, _080EFF90 @ =_080EFF94
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EFF88: .4byte gUnknown_083DFEC4
_080EFF8C: .4byte 0x0000d160
_080EFF90: .4byte _080EFF94
	.align 2, 0
_080EFF94:
	.4byte _080EFFCC
	.4byte _080EFFE8
	.4byte _080EFFF4
	.4byte _080F0000
	.4byte _080F000C
	.4byte _080F0012
	.4byte _080F0018
	.4byte _080F0028
	.4byte _080F003C
	.4byte _080F005C
	.4byte _080F0098
	.4byte _080F00AC
	.4byte _080F00F8
	.4byte _080F0118
_080EFFCC:
	bl sub_80EEDE8
	ldr r0, _080EFFE0 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080EFFE4 @ =0x0000d162
	adds r0, r2
	movs r1, 0xB
	strb r1, [r0]
	b _080F0154
	.align 2, 0
_080EFFE0: .4byte gUnknown_083DFEC4
_080EFFE4: .4byte 0x0000d162
_080EFFE8:
	ldr r0, _080EFFF0 @ =gWindowConfig_81E7080
	bl SetUpWindowConfig
	b _080F0154
	.align 2, 0
_080EFFF0: .4byte gWindowConfig_81E7080
_080EFFF4:
	ldr r0, _080EFFFC @ =gWindowConfig_81E7080
	bl MultistepInitMenuWindowBegin
	b _080F0154
	.align 2, 0
_080EFFFC: .4byte gWindowConfig_81E7080
_080F0000:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	beq _080F000A
	b _080F0154
_080F000A:
	b _080F0162
_080F000C:
	bl MenuZeroFillScreen
	b _080F0154
_080F0012:
	bl sub_80F1614
	b _080F0154
_080F0018:
	movs r0, 0
	bl sub_80F162C
	lsls r0, 24
	cmp r0, 0
	bne _080F0026
	b _080F0154
_080F0026:
	b _080F0162
_080F0028:
	ldr r0, _080F0034 @ =gPokenavConditionView_Gfx
	ldr r1, _080F0038 @ =0x06005000
	bl LZ77UnCompVram
	b _080F0154
	.align 2, 0
_080F0034: .4byte gPokenavConditionView_Gfx
_080F0038: .4byte 0x06005000
_080F003C:
	ldr r0, _080F0050 @ =gUnknown_08E9AC4C
	ldr r1, _080F0054 @ =0x0600f000
	bl LZ77UnCompVram
	ldr r0, _080F0058 @ =gPokenavConditionMenu2_Pal
	movs r1, 0x20
	movs r2, 0x20
	bl LoadPalette
	b _080F0154
	.align 2, 0
_080F0050: .4byte gUnknown_08E9AC4C
_080F0054: .4byte 0x0600f000
_080F0058: .4byte gPokenavConditionMenu2_Pal
_080F005C:
	ldr r0, _080F0088 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F008C @ =0x000076aa
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080F0154
	ldr r0, _080F0090 @ =0x0600f000
	ldr r3, _080F0094 @ =gUnknown_083E01AC
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r2, 0x9
	str r2, [sp, 0x8]
	movs r1, 0x4
	str r1, [sp, 0xC]
	str r2, [sp, 0x10]
	movs r1, 0
	movs r2, 0x5
	bl sub_8095C8C
	b _080F0154
	.align 2, 0
_080F0088: .4byte gUnknown_083DFEC4
_080F008C: .4byte 0x000076aa
_080F0090: .4byte 0x0600f000
_080F0094: .4byte gUnknown_083E01AC
_080F0098:
	ldr r0, _080F00A4 @ =gUnknown_08E9FEB4
	ldr r1, _080F00A8 @ =0x0600b800
	bl LZ77UnCompVram
	b _080F0154
	.align 2, 0
_080F00A4: .4byte gUnknown_08E9FEB4
_080F00A8: .4byte 0x0600b800
_080F00AC:
	ldr r0, _080F00EC @ =gUnknown_083E0254
	movs r1, 0x30
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _080F00F0 @ =gUnknownPalette_81E6692
	movs r1, 0xB0
	movs r2, 0x20
	bl LoadPalette
	ldr r4, _080F00F4 @ =gPokenavConditionMenu2_Pal + 0x2
	adds r0, r4, 0
	movs r1, 0xB1
	movs r2, 0x2
	bl LoadPalette
	adds r0, r4, 0
	adds r0, 0xE
	movs r1, 0xB5
	movs r2, 0x2
	bl LoadPalette
	adds r4, 0x1C
	adds r0, r4, 0
	movs r1, 0xBF
	movs r2, 0x2
	bl LoadPalette
	bl sub_80F01A4
	b _080F0154
	.align 2, 0
_080F00EC: .4byte gUnknown_083E0254
_080F00F0: .4byte gUnknownPalette_81E6692
_080F00F4: .4byte gPokenavConditionMenu2_Pal + 0x2
_080F00F8:
	ldr r0, _080F0110 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080F0114 @ =0x00008fe9
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 16
	lsrs r0, 16
	bl sub_80F01E0
	b _080F0154
	.align 2, 0
_080F0110: .4byte gUnknown_083DFEC4
_080F0114: .4byte 0x00008fe9
_080F0118:
	ldr r1, _080F013C @ =REG_BG3CNT
	ldr r2, _080F0140 @ =0x00001e03
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	ldr r2, _080F0144 @ =0x00001702
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x44
	ldr r2, _080F0148 @ =0x00000844
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080F014C @ =0x0000040b
	adds r0, r2, 0
	strh r0, [r1]
	b _080F0154
	.align 2, 0
_080F013C: .4byte REG_BG3CNT
_080F0140: .4byte 0x00001e03
_080F0144: .4byte 0x00001702
_080F0148: .4byte 0x00000844
_080F014C: .4byte 0x0000040b
_080F0150:
	movs r0, 0
	b _080F0164
_080F0154:
	ldr r0, _080F016C @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F0170 @ =0x0000d160
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080F0162:
	movs r0, 0x1
_080F0164:
	add sp, 0x14
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F016C: .4byte gUnknown_083DFEC4
_080F0170: .4byte 0x0000d160
	thumb_func_end sub_80EFF68

	thumb_func_start sub_80F0174
sub_80F0174: @ 80F0174
	push {lr}
	lsls r0, 24
	cmp r0, 0
	beq _080F018E
	movs r0, 0x80
	lsls r0, 19
	ldrh r1, [r0]
	movs r3, 0x80
	lsls r3, 3
	adds r2, r3, 0
	orrs r1, r2
	strh r1, [r0]
	b _080F019A
_080F018E:
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _080F01A0 @ =0x0000fbff
	ands r0, r1
	strh r0, [r2]
_080F019A:
	pop {r0}
	bx r0
	.align 2, 0
_080F01A0: .4byte 0x0000fbff
	thumb_func_end sub_80F0174

	thumb_func_start sub_80F01A4
sub_80F01A4: @ 80F01A4
	ldr r1, _080F01CC @ =REG_WIN0H
	movs r0, 0xF0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x9B
	strh r0, [r1]
	ldr r0, _080F01D0 @ =REG_WIN0V
	ldr r2, _080F01D4 @ =0x00003879
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r1, _080F01D8 @ =REG_WININ
	ldr r2, _080F01DC @ =0x00003f3f
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x1B
	strh r0, [r1]
	bx lr
	.align 2, 0
_080F01CC: .4byte REG_WIN0H
_080F01D0: .4byte REG_WIN0V
_080F01D4: .4byte 0x00003879
_080F01D8: .4byte REG_WININ
_080F01DC: .4byte 0x00003f3f
	thumb_func_end sub_80F01A4

	thumb_func_start sub_80F01E0
sub_80F01E0: @ 80F01E0
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r1, _080F0248 @ =gUnknown_083DFEC4
	lsls r0, r4, 6
	ldr r2, _080F024C @ =0x00008829
	adds r0, r2
	ldr r5, [r1]
	adds r0, r5, r0
	movs r1, 0xD
	movs r2, 0x1
	bl MenuPrint
	ldr r1, _080F0250 @ =0x000076aa
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080F0242
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 3
	ldr r2, _080F0254 @ =0x000088e9
	adds r0, r2
	adds r0, r5, r0
	movs r1, 0xD
	movs r2, 0x3
	bl MenuPrint
	ldr r0, _080F0258 @ =0x00008788
	adds r4, r5, r0
	ldr r1, _080F025C @ =0x000087dc
	adds r0, r5, r1
	movs r2, 0
	ldrsh r0, [r0, r2]
	lsls r0, 2
	adds r0, r5, r0
	ldr r1, _080F0260 @ =0x0000893e
	adds r0, r1
	ldrh r1, [r0]
	lsls r1, 18
	lsrs r1, 23
	adds r0, r4, 0
	bl sub_80F443C
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0x6
	bl MenuPrint
_080F0242:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F0248: .4byte gUnknown_083DFEC4
_080F024C: .4byte 0x00008829
_080F0250: .4byte 0x000076aa
_080F0254: .4byte 0x000088e9
_080F0258: .4byte 0x00008788
_080F025C: .4byte 0x000087dc
_080F0260: .4byte 0x0000893e
	thumb_func_end sub_80F01E0

	thumb_func_start sub_80F0264
sub_80F0264: @ 80F0264
	push {lr}
	ldr r1, _080F0290 @ =gUnknown_083DFEC4
	ldr r2, [r1]
	ldr r1, _080F0294 @ =0x00000306
	adds r3, r2, r1
	movs r1, 0
	strh r1, [r3]
	ldr r3, _080F0298 @ =0x000087ca
	adds r1, r2, r3
	strb r0, [r1]
	ldr r0, _080F029C @ =0x00006dac
	adds r2, r0
	ldrb r0, [r2]
	cmp r0, 0
	bne _080F028C
_080F0282:
	bl sub_80F02A0
	lsls r0, 24
	cmp r0, 0
	bne _080F0282
_080F028C:
	pop {r0}
	bx r0
	.align 2, 0
_080F0290: .4byte gUnknown_083DFEC4
_080F0294: .4byte 0x00000306
_080F0298: .4byte 0x000087ca
_080F029C: .4byte 0x00006dac
	thumb_func_end sub_80F0264

	thumb_func_start sub_80F02A0
sub_80F02A0: @ 80F02A0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x18
	ldr r1, _080F02C4 @ =gUnknown_083DFEC4
	ldr r0, [r1]
	ldr r2, _080F02C8 @ =0x00000306
	adds r0, r2
	ldrh r0, [r0]
	adds r2, r1, 0
	cmp r0, 0xE
	bls _080F02BA
	b _080F05FA
_080F02BA:
	lsls r0, 2
	ldr r1, _080F02CC @ =_080F02D0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F02C4: .4byte gUnknown_083DFEC4
_080F02C8: .4byte 0x00000306
_080F02CC: .4byte _080F02D0
	.align 2, 0
_080F02D0:
	.4byte _080F030C
	.4byte _080F0344
	.4byte _080F0350
	.4byte _080F035C
	.4byte _080F0368
	.4byte _080F036E
	.4byte _080F0380
	.4byte _080F0394
	.4byte _080F04BC
	.4byte _080F053C
	.4byte _080F0550
	.4byte _080F0574
	.4byte _080F057A
	.4byte _080F0586
	.4byte _080F05BC
_080F030C:
	bl sub_80EEDE8
	ldr r0, _080F0334 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	movs r2, 0
	ldr r3, _080F0338 @ =0x000087ca
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080F0322
	movs r2, 0x1
_080F0322:
	ldr r3, _080F033C @ =0x000087c8
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _080F0340 @ =0x0000d162
	adds r1, r0
	movs r0, 0xB
	strb r0, [r1]
	b _080F0618
	.align 2, 0
_080F0334: .4byte gUnknown_083DFEC4
_080F0338: .4byte 0x000087ca
_080F033C: .4byte 0x000087c8
_080F0340: .4byte 0x0000d162
_080F0344:
	ldr r0, _080F034C @ =gWindowConfig_81E70D4
	bl SetUpWindowConfig
	b _080F0618
	.align 2, 0
_080F034C: .4byte gWindowConfig_81E70D4
_080F0350:
	ldr r0, _080F0358 @ =gWindowConfig_81E70D4
	bl MultistepInitMenuWindowBegin
	b _080F0618
	.align 2, 0
_080F0358: .4byte gWindowConfig_81E70D4
_080F035C:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	beq _080F0366
	b _080F0618
_080F0366:
	b _080F0626
_080F0368:
	bl MenuZeroFillScreen
	b _080F0618
_080F036E:
	ldr r0, _080F0378 @ =gUnknown_08E9FC64
	ldr r1, _080F037C @ =0x0600e800
	bl LZ77UnCompVram
	b _080F0618
	.align 2, 0
_080F0378: .4byte gUnknown_08E9FC64
_080F037C: .4byte 0x0600e800
_080F0380:
	ldr r0, _080F038C @ =gPokenavConditionSearch2_Gfx
	ldr r1, _080F0390 @ =0x06008000
	bl LZ77UnCompVram
	b _080F0618
	.align 2, 0
_080F038C: .4byte gPokenavConditionSearch2_Gfx
_080F0390: .4byte 0x06008000
_080F0394:
	ldr r6, _080F03FC @ =gUnknown_083E02B4
	adds r0, r6, 0
	movs r1, 0xB0
	movs r2, 0x20
	bl LoadPalette
	adds r0, r6, 0
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _080F0400 @ =gUnknown_083E0334
	movs r1, 0x40
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _080F0404 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F0408 @ =0x000087ca
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F0418
	ldr r4, _080F040C @ =gPokenavConditionSearch2_Pal
	adds r0, r4, 0
	movs r1, 0x30
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _080F0410 @ =gPlttBufferUnfaded
	ldrh r0, [r4, 0xA]
	strh r0, [r1]
	ldr r0, _080F0414 @ =gUnknownPalette_81E6692
	movs r1, 0xB0
	movs r2, 0x20
	bl LoadPalette
	adds r0, r6, 0x2
	movs r1, 0xB1
	movs r2, 0x2
	bl LoadPalette
	adds r0, r6, 0
	adds r0, 0x10
	movs r1, 0xB5
	movs r2, 0x2
	bl LoadPalette
	adds r4, 0xA
	adds r0, r4, 0
	movs r1, 0xBF
	b _080F04A8
	.align 2, 0
_080F03FC: .4byte gUnknown_083E02B4
_080F0400: .4byte gUnknown_083E0334
_080F0404: .4byte gUnknown_083DFEC4
_080F0408: .4byte 0x000087ca
_080F040C: .4byte gPokenavConditionSearch2_Pal
_080F0410: .4byte gPlttBufferUnfaded
_080F0414: .4byte gUnknownPalette_81E6692
_080F0418:
	cmp r0, 0x1
	bne _080F0464
	ldr r4, _080F0458 @ =gUnknown_083E0274
	adds r0, r4, 0
	movs r1, 0x30
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _080F045C @ =gPlttBufferUnfaded
	ldrh r0, [r4, 0xA]
	strh r0, [r1]
	ldr r0, _080F0460 @ =gUnknownPalette_81E6692
	movs r1, 0xB0
	movs r2, 0x20
	bl LoadPalette
	adds r0, r6, 0x2
	movs r1, 0xB1
	movs r2, 0x2
	bl LoadPalette
	adds r0, r6, 0
	adds r0, 0x10
	movs r1, 0xB5
	movs r2, 0x2
	bl LoadPalette
	adds r4, 0xA
	adds r0, r4, 0
	movs r1, 0xBF
	b _080F04A8
	.align 2, 0
_080F0458: .4byte gUnknown_083E0274
_080F045C: .4byte gPlttBufferUnfaded
_080F0460: .4byte gUnknownPalette_81E6692
_080F0464:
	ldr r4, _080F04B0 @ =gUnknown_08E9F9E8
	adds r0, r4, 0
	movs r1, 0x30
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _080F04B4 @ =gPlttBufferUnfaded
	adds r5, r4, 0
	adds r5, 0xA
	ldrh r0, [r4, 0xA]
	strh r0, [r1]
	ldr r0, _080F04B8 @ =gUnknown_083E0314
	movs r1, 0x50
	movs r2, 0x20
	bl LoadPalette
	adds r0, r6, 0x2
	movs r1, 0xB1
	movs r2, 0x2
	bl LoadPalette
	adds r0, r6, 0
	adds r0, 0x10
	movs r1, 0xB5
	movs r2, 0x2
	bl LoadPalette
	adds r0, r5, 0
	movs r1, 0xBF
	movs r2, 0x2
	bl LoadPalette
	adds r0, r5, 0
	movs r1, 0x5F
_080F04A8:
	movs r2, 0x2
	bl LoadPalette
	b _080F0618
	.align 2, 0
_080F04B0: .4byte gUnknown_08E9F9E8
_080F04B4: .4byte gPlttBufferUnfaded
_080F04B8: .4byte gUnknown_083E0314
_080F04BC:
	ldr r0, _080F04E8 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080F04EC @ =0x000087ca
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080F04F8
	ldr r0, _080F04F0 @ =0x0600e800
	ldr r3, _080F04F4 @ =gUnknown_08E9FD1C
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r2, 0x9
	str r2, [sp, 0x8]
	movs r1, 0x4
	str r1, [sp, 0xC]
	str r2, [sp, 0x10]
	movs r1, 0
	movs r2, 0x5
	bl sub_8095C8C
	b _080F0618
	.align 2, 0
_080F04E8: .4byte gUnknown_083DFEC4
_080F04EC: .4byte 0x000087ca
_080F04F0: .4byte 0x0600e800
_080F04F4: .4byte gUnknown_08E9FD1C
_080F04F8:
	ldr r3, _080F0530 @ =0x0600e800
	mov r8, r3
	ldr r3, _080F0534 @ =gUnknown_08E9FE54
	movs r4, 0
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r5, 0xC
	str r5, [sp, 0x8]
	movs r6, 0xA
	str r6, [sp, 0xC]
	str r5, [sp, 0x10]
	mov r0, r8
	movs r1, 0
	movs r2, 0x4
	bl sub_8095C8C
	ldr r3, _080F0538 @ =gUnknown_08E9FD64
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	str r6, [sp, 0xC]
	str r5, [sp, 0x10]
	mov r0, r8
	movs r1, 0
	movs r2, 0x8
	bl sub_8095C8C
	b _080F0618
	.align 2, 0
_080F0530: .4byte 0x0600e800
_080F0534: .4byte gUnknown_08E9FE54
_080F0538: .4byte gUnknown_08E9FD64
_080F053C:
	ldr r0, _080F0548 @ =gUnknown_083E0354
	ldr r1, _080F054C @ =0x06005000
	bl LZ77UnCompVram
	b _080F0618
	.align 2, 0
_080F0548: .4byte gUnknown_083E0354
_080F054C: .4byte 0x06005000
_080F0550:
	ldr r2, _080F0568 @ =0x0600f800
	add r1, sp, 0x14
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080F056C @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _080F0570 @ =0x81000400
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	b _080F0618
	.align 2, 0
_080F0568: .4byte 0x0600f800
_080F056C: .4byte 0x040000d4
_080F0570: .4byte 0x81000400
_080F0574:
	bl sub_80F0900
	b _080F0618
_080F057A:
	bl sub_80F0944
	lsls r0, 24
	cmp r0, 0
	beq _080F0618
	b _080F0626
_080F0586:
	ldr r0, _080F059C @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r1, _080F05A0 @ =0x000087ca
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080F05A4
	bl ShowMapNamePopUpWindow
	b _080F0618
	.align 2, 0
_080F059C: .4byte gUnknown_083DFEC4
_080F05A0: .4byte 0x000087ca
_080F05A4:
	movs r0, 0
	bl sub_80F081C
	ldr r2, _080F05B8 @ =0x0000876e
	adds r0, r4, r2
	ldrb r0, [r0]
	bl sub_80F0FFC
	b _080F0618
	.align 2, 0
_080F05B8: .4byte 0x0000876e
_080F05BC:
	ldr r1, _080F0600 @ =REG_BG2CNT
	ldr r3, _080F0604 @ =0x00001d0a
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	adds r3, 0xF9
	adds r0, r3, 0
	strh r0, [r1]
	subs r1, 0x6
	adds r3, 0xFE
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x16
	movs r0, 0xF8
	strh r0, [r1]
	ldr r1, [r2]
	ldr r0, _080F0608 @ =0x00008776
	adds r2, r1, r0
	movs r3, 0
	movs r0, 0xF8
	strh r0, [r2]
	ldr r2, _080F060C @ =0x00008778
	adds r0, r1, r2
	strh r3, [r0]
	ldr r0, _080F0610 @ =REG_BLDCNT
	strh r3, [r0]
	ldr r3, _080F0614 @ =0x0000d160
	adds r1, r3
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080F05FA:
	movs r0, 0
	b _080F0628
	.align 2, 0
_080F0600: .4byte REG_BG2CNT
_080F0604: .4byte 0x00001d0a
_080F0608: .4byte 0x00008776
_080F060C: .4byte 0x00008778
_080F0610: .4byte REG_BLDCNT
_080F0614: .4byte 0x0000d160
_080F0618:
	ldr r0, _080F0634 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F0638 @ =0x00000306
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080F0626:
	movs r0, 0x1
_080F0628:
	add sp, 0x18
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080F0634: .4byte gUnknown_083DFEC4
_080F0638: .4byte 0x00000306
	thumb_func_end sub_80F02A0

	thumb_func_start sub_80F063C
sub_80F063C: @ 80F063C
	push {r4-r7,lr}
	lsls r0, 16
	ldr r3, _080F0664 @ =gUnknown_083DFEC4
	ldr r2, [r3]
	lsrs r5, r0, 16
	asrs r4, r0, 16
	lsls r1, r4, 4
	ldr r6, _080F0668 @ =0x0000877c
	adds r0, r2, r6
	strh r1, [r0]
	adds r7, r3, 0
	cmp r4, 0x1
	beq _080F065E
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	bne _080F066C
_080F065E:
	movs r1, 0x4
	b _080F066E
	.align 2, 0
_080F0664: .4byte gUnknown_083DFEC4
_080F0668: .4byte 0x0000877c
_080F066C:
	movs r1, 0x8
_080F066E:
	ldr r3, _080F06C0 @ =0x0000877a
	adds r0, r2, r3
	strh r1, [r0]
	lsls r0, r5, 16
	asrs r3, r0, 16
	cmp r3, 0
	bge _080F06CC
	ldr r4, [r7]
	ldr r6, _080F06C0 @ =0x0000877a
	adds r1, r4, r6
	movs r2, 0
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1]
	subs r6, 0x2
	adds r1, r4, r6
	lsls r0, r3, 1
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r1, _080F06C4 @ =0x00008770
	adds r0, r4, r1
	ldrh r0, [r0]
	adds r0, r3, r0
	lsls r0, 16
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _080F06B8
	ldr r2, _080F06C8 @ =0x00008774
	adds r1, r4, r2
	adds r0, 0x1
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
_080F06B8:
	negs r0, r3
	lsls r0, 16
	lsrs r5, r0, 16
	b _080F06E6
	.align 2, 0
_080F06C0: .4byte 0x0000877a
_080F06C4: .4byte 0x00008770
_080F06C8: .4byte 0x00008774
_080F06CC:
	ldr r1, [r7]
	ldr r3, _080F070C @ =0x00008778
	adds r0, r1, r3
	ldrh r0, [r0]
	adds r0, 0x10
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _080F0710 @ =0x00008772
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
_080F06E6:
	ldr r0, [r7]
	ldr r1, _080F0714 @ =0x00008774
	adds r0, r1
	lsls r1, r2, 16
	asrs r1, 16
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	ble _080F06FA
	movs r2, 0
_080F06FA:
	movs r1, 0x1F
	adds r0, r2, 0
	ands r1, r6
	adds r2, r5, 0
	bl sub_80F0954
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F070C: .4byte 0x00008778
_080F0710: .4byte 0x00008772
_080F0714: .4byte 0x00008774
	thumb_func_end sub_80F063C

	thumb_func_start sub_80F0718
sub_80F0718: @ 80F0718
	push {r4,r5,lr}
	bl sub_80F098C
	lsls r0, 24
	cmp r0, 0
	bne _080F0790
	ldr r0, _080F073C @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r0, _080F0740 @ =0x0000877c
	adds r3, r4, r0
	ldrh r2, [r3]
	movs r1, 0
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080F0744
	movs r0, 0
	b _080F0792
	.align 2, 0
_080F073C: .4byte gUnknown_083DFEC4
_080F0740: .4byte 0x0000877c
_080F0744:
	ldr r0, _080F0780 @ =0x0000877a
	adds r1, r4, r0
	ldrh r0, [r1]
	subs r0, r2, r0
	strh r0, [r3]
	ldr r0, _080F0784 @ =0x00008776
	adds r2, r4, r0
	ldrh r0, [r1]
	ldrh r1, [r2]
	adds r0, r1
	movs r5, 0xFF
	ands r0, r5
	strh r0, [r2]
	ldr r1, _080F0788 @ =REG_BG3VOFS
	strh r0, [r1]
	movs r1, 0
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080F0790
	movs r1, 0
	ldrsh r0, [r2, r1]
	adds r0, 0x8
	ands r0, r5
	asrs r1, r0, 3
	ldr r2, _080F078C @ =0x00008778
	adds r0, r4, r2
	strh r1, [r0]
	movs r0, 0
	b _080F0792
	.align 2, 0
_080F0780: .4byte 0x0000877a
_080F0784: .4byte 0x00008776
_080F0788: .4byte REG_BG3VOFS
_080F078C: .4byte 0x00008778
_080F0790:
	movs r0, 0x1
_080F0792:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80F0718

	thumb_func_start ShowMapNamePopUpWindow
ShowMapNamePopUpWindow: @ 80F0798
	push {lr}
	ldr r0, _080F07B0 @ =gUnknown_083DFEC4
	ldr r2, [r0]
	ldr r1, _080F07B4 @ =0x000087ca
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F07B8
	cmp r0, 0x1
	beq _080F07E0
	b _080F080A
	.align 2, 0
_080F07B0: .4byte gUnknown_083DFEC4
_080F07B4: .4byte 0x000087ca
_080F07B8:
	ldr r3, _080F07D8 @ =0x00008788
	adds r0, r2, r3
	subs r3, 0x1A
	adds r1, r2, r3
	movs r3, 0
	ldrsh r1, [r1, r3]
	lsls r1, 2
	adds r1, r2, r1
	ldr r2, _080F07DC @ =0x0000893e
	adds r1, r2
	ldrh r1, [r1]
	lsls r1, 18
	lsrs r1, 23
	bl sub_80F443C
	b _080F07F4
	.align 2, 0
_080F07D8: .4byte 0x00008788
_080F07DC: .4byte 0x0000893e
_080F07E0:
	ldr r3, _080F0810 @ =0x00008788
	adds r0, r2, r3
	subs r3, 0x1A
	adds r1, r2, r3
	ldrh r1, [r1]
	adds r1, 0x1
	lsls r1, 16
	lsrs r1, 16
	bl sub_80F445C
_080F07F4:
	ldr r0, _080F0814 @ =gWindowConfig_81E710C
	bl BasicInitMenuWindow
	ldr r0, _080F0818 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F0810 @ =0x00008788
	adds r0, r1
	movs r1, 0x1
	movs r2, 0x6
	bl MenuPrint
_080F080A:
	pop {r0}
	bx r0
	.align 2, 0
_080F0810: .4byte 0x00008788
_080F0814: .4byte gWindowConfig_81E710C
_080F0818: .4byte gUnknown_083DFEC4
	thumb_func_end ShowMapNamePopUpWindow

	thumb_func_start sub_80F081C
sub_80F081C: @ 80F081C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080F0838 @ =gWindowConfig_81E710C
	bl BasicInitMenuWindow
	cmp r5, 0x4
	bhi _080F08C6
	lsls r0, r5, 2
	ldr r1, _080F083C @ =_080F0840
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F0838: .4byte gWindowConfig_81E710C
_080F083C: .4byte _080F0840
	.align 2, 0
_080F0840:
	.4byte _080F0854
	.4byte _080F0854
	.4byte _080F0862
	.4byte _080F088C
	.4byte _080F089A
_080F0854:
	ldr r0, _080F08CC @ =gOtherText_NumberRegistered
	movs r1, 0xA
	movs r2, 0x9
	bl MenuPrint_RightAligned
	cmp r5, 0
	bne _080F08C6
_080F0862:
	ldr r0, _080F08D0 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F08D4 @ =0x00008788
	adds r4, r0, r1
	ldr r2, _080F08D8 @ =0x00008774
	adds r0, r2
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r1, 0x1
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	adds r0, r4, 0
	movs r1, 0xA
	movs r2, 0xB
	bl MenuPrint_RightAligned
	cmp r5, 0
	bne _080F08C6
_080F088C:
	ldr r0, _080F08DC @ =gOtherText_NumberBattles
	movs r1, 0xA
	movs r2, 0xD
	bl MenuPrint_RightAligned
	cmp r5, 0
	bne _080F08C6
_080F089A:
	movs r0, 0x9
	bl GetGameStat
	adds r1, r0, 0
	ldr r0, _080F08E0 @ =0x0001869f
	cmp r1, r0
	bls _080F08AA
	adds r1, r0, 0
_080F08AA:
	ldr r0, _080F08D0 @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r0, _080F08D4 @ =0x00008788
	adds r4, r0
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	adds r0, r4, 0
	movs r1, 0xA
	movs r2, 0xF
	bl MenuPrint_RightAligned
_080F08C6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F08CC: .4byte gOtherText_NumberRegistered
_080F08D0: .4byte gUnknown_083DFEC4
_080F08D4: .4byte 0x00008788
_080F08D8: .4byte 0x00008774
_080F08DC: .4byte gOtherText_NumberBattles
_080F08E0: .4byte 0x0001869f
	thumb_func_end sub_80F081C

	thumb_func_start sub_80F08E4
sub_80F08E4: @ 80F08E4
	push {lr}
	ldr r0, _080F08FC @ =gWindowConfig_81E710C
	bl BasicInitMenuWindow
	movs r0, 0
	movs r1, 0x9
	movs r2, 0xB
	movs r3, 0x10
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	.align 2, 0
_080F08FC: .4byte gWindowConfig_81E710C
	thumb_func_end sub_80F08E4

	thumb_func_start sub_80F0900
sub_80F0900: @ 80F0900
	push {r4,r5,lr}
	ldr r0, _080F093C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080F0940 @ =0x00008772
	adds r1, r0, r2
	subs r2, 0x2
	adds r5, r0, r2
	ldrh r0, [r1]
	ldrh r1, [r5]
	subs r0, r1
	adds r0, 0x1
	lsls r4, r0, 16
	asrs r0, r4, 16
	cmp r0, 0x7
	bgt _080F092A
	movs r0, 0xC
	movs r1, 0x1
	movs r2, 0x1F
	movs r3, 0xF
	bl MenuZeroFillWindowRect
_080F092A:
	ldrh r0, [r5]
	lsrs r2, r4, 16
	movs r1, 0
	bl sub_80F0954
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F093C: .4byte gUnknown_083DFEC4
_080F0940: .4byte 0x00008772
	thumb_func_end sub_80F0900

	thumb_func_start sub_80F0944
sub_80F0944: @ 80F0944
	push {lr}
	bl sub_80F098C
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80F0944

	thumb_func_start sub_80F0954
sub_80F0954: @ 80F0954
	push {r4,r5,lr}
	ldr r3, _080F097C @ =gUnknown_083DFEC4
	ldr r3, [r3]
	ldr r5, _080F0980 @ =0x0000877e
	adds r4, r3, r5
	movs r5, 0
	strh r0, [r4]
	ldr r4, _080F0984 @ =0x00008780
	adds r0, r3, r4
	strh r1, [r0]
	ldr r1, _080F0988 @ =0x00008784
	adds r0, r3, r1
	strh r2, [r0]
	adds r4, 0x6
	adds r3, r4
	strh r5, [r3]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F097C: .4byte gUnknown_083DFEC4
_080F0980: .4byte 0x0000877e
_080F0984: .4byte 0x00008780
_080F0988: .4byte 0x00008784
	thumb_func_end sub_80F0954

	thumb_func_start sub_80F098C
sub_80F098C: @ 80F098C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _080F09A4 @ =gUnknown_083DFEC4
	ldr r6, [r0]
	ldr r0, _080F09A8 @ =0x00008784
	adds r7, r6, r0
	ldrh r0, [r7]
	cmp r0, 0
	bne _080F09AC
_080F09A0:
	movs r0, 0
	b _080F0A02
	.align 2, 0
_080F09A4: .4byte gUnknown_083DFEC4
_080F09A8: .4byte 0x00008784
_080F09AC:
	movs r1, 0
	mov r8, r1
	ldr r1, _080F0A0C @ =gUnknown_083E3270
	ldr r2, _080F0A10 @ =0x000087ca
	adds r0, r6, r2
	ldrb r2, [r0]
	lsls r2, 2
	adds r2, r1
	ldr r0, _080F0A14 @ =0x0000877e
	adds r4, r6, r0
	ldrh r0, [r4]
	ldr r1, _080F0A18 @ =0x00008780
	adds r5, r6, r1
	ldrh r1, [r5]
	ldr r2, [r2]
	bl _call_via_r2
	ldrh r0, [r7]
	subs r0, 0x1
	strh r0, [r7]
	ldr r2, _080F0A1C @ =0x0000ffff
	adds r1, r2, 0
	lsls r0, 16
	cmp r0, 0
	beq _080F09A0
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ands r0, r1
	ldr r2, _080F0A20 @ =0x00008774
	adds r1, r6, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	cmp r0, r1
	ble _080F09F6
	mov r0, r8
	strh r0, [r4]
_080F09F6:
	ldrh r0, [r5]
	adds r0, 0x2
	movs r1, 0x1F
	ands r0, r1
	strh r0, [r5]
	movs r0, 0x1
_080F0A02:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080F0A0C: .4byte gUnknown_083E3270
_080F0A10: .4byte 0x000087ca
_080F0A14: .4byte 0x0000877e
_080F0A18: .4byte 0x00008780
_080F0A1C: .4byte 0x0000ffff
_080F0A20: .4byte 0x00008774
	thumb_func_end sub_80F098C

	thumb_func_start sub_80F0A24
sub_80F0A24: @ 80F0A24
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	lsrs r5, r1, 16
	ldr r0, _080F0A64 @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r1, _080F0A68 @ =0x000087c8
	adds r0, r4, r1
	ldrb r0, [r0]
	movs r2, 0x1
	cmp r0, 0
	bne _080F0A40
	movs r2, 0x2
_080F0A40:
	ldr r0, _080F0A6C @ =0x00008788
	adds r4, r0
	adds r0, r4, 0
	adds r1, r3, 0
	bl sub_80F4428
	ldr r0, _080F0A70 @ =gWindowConfig_81E70D4
	bl BasicInitMenuWindow
	lsls r2, r5, 24
	lsrs r2, 24
	adds r0, r4, 0
	movs r1, 0xD
	bl MenuPrint
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F0A64: .4byte gUnknown_083DFEC4
_080F0A68: .4byte 0x000087c8
_080F0A6C: .4byte 0x00008788
_080F0A70: .4byte gWindowConfig_81E70D4
	thumb_func_end sub_80F0A24

	thumb_func_start sub_80F0A74
sub_80F0A74: @ 80F0A74
	push {r4-r7,lr}
	sub sp, 0x14
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r7, r1, 16
	ldr r0, _080F0ADC @ =gUnknown_083DFEC4
	ldr r5, [r0]
	ldr r0, _080F0AE0 @ =0x00008788
	adds r4, r5, r0
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_80F700C
	movs r0, 0x1F
	ands r7, r0
	ldr r0, _080F0AE4 @ =gWindowConfig_81E70D4
	bl BasicInitMenuWindow
	lsls r2, r7, 3
	adds r0, r4, 0
	movs r1, 0x61
	movs r3, 0
	bl MenuPrint_PixelCoords
	ldr r1, _080F0AE8 @ =0x0000d158
	adds r0, r5, r1
	ldrh r0, [r0]
	cmp r6, r0
	bcs _080F0AF8
	lsls r0, r6, 3
	adds r0, r5, r0
	ldr r1, _080F0AEC @ =0x0000ceed
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F0AF8
	ldr r0, _080F0AF0 @ =0x0600f000
	ldr r3, _080F0AF4 @ =gUnknown_083E039C
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r2, 0x1
	str r2, [sp, 0x8]
	movs r1, 0x2
	str r1, [sp, 0xC]
	str r2, [sp, 0x10]
	movs r1, 0x1D
	adds r2, r7, 0
	bl sub_8095C8C
	b _080F0B14
	.align 2, 0
_080F0ADC: .4byte gUnknown_083DFEC4
_080F0AE0: .4byte 0x00008788
_080F0AE4: .4byte gWindowConfig_81E70D4
_080F0AE8: .4byte 0x0000d158
_080F0AEC: .4byte 0x0000ceed
_080F0AF0: .4byte 0x0600f000
_080F0AF4: .4byte gUnknown_083E039C
_080F0AF8:
	ldr r0, _080F0B1C @ =0x0600f000
	ldr r3, _080F0B20 @ =gUnknown_083E03A0
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r2, 0x1
	str r2, [sp, 0x8]
	movs r1, 0x2
	str r1, [sp, 0xC]
	str r2, [sp, 0x10]
	movs r1, 0x1D
	adds r2, r7, 0
	bl sub_8095C8C
_080F0B14:
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F0B1C: .4byte 0x0600f000
_080F0B20: .4byte gUnknown_083E03A0
	thumb_func_end sub_80F0A74

	thumb_func_start sub_80F0B24
sub_80F0B24: @ 80F0B24
	ldr r0, _080F0B38 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080F0B3C @ =0x0000d15c
	adds r1, r0, r2
	movs r2, 0
	strh r2, [r1]
	ldr r1, _080F0B40 @ =0x00000306
	adds r0, r1
	strh r2, [r0]
	bx lr
	.align 2, 0
_080F0B38: .4byte gUnknown_083DFEC4
_080F0B3C: .4byte 0x0000d15c
_080F0B40: .4byte 0x00000306
	thumb_func_end sub_80F0B24

	thumb_func_start sub_80F0B44
sub_80F0B44: @ 80F0B44
	push {r4-r6,lr}
	ldr r0, _080F0B58 @ =gUnknown_083DFEC4
	ldr r5, [r0]
	ldr r0, _080F0B5C @ =0x0000d15c
	adds r6, r5, r0
	ldrh r0, [r6]
	cmp r0, 0x8
	bls _080F0B60
	movs r0, 0
	b _080F0C22
	.align 2, 0
_080F0B58: .4byte gUnknown_083DFEC4
_080F0B5C: .4byte 0x0000d15c
_080F0B60:
	ldr r0, _080F0BBC @ =0x00000306
	adds r1, r5, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _080F0C20
	movs r0, 0
	strh r0, [r1]
	ldrh r0, [r6]
	cmp r0, 0x7
	bhi _080F0BCC
	ldr r0, _080F0BC0 @ =0x00008778
	adds r1, r5, r0
	ldrh r2, [r6]
	lsls r0, r2, 1
	ldrh r1, [r1]
	adds r4, r0, r1
	movs r0, 0x1F
	ands r4, r0
	ldr r1, _080F0BC4 @ =0x0000876c
	adds r0, r5, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r2, r0
	beq _080F0BAA
	ldr r0, _080F0BC8 @ =gWindowConfig_81E70D4
	bl BasicInitMenuWindow
	adds r1, r4, 0
	adds r3, r1, 0x1
	movs r0, 0xC
	movs r2, 0x1F
	bl MenuZeroFillWindowRect
_080F0BAA:
	ldrh r0, [r6]
	cmp r0, 0
	bne _080F0BB4
	bl sub_80F08E4
_080F0BB4:
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	b _080F0C20
	.align 2, 0
_080F0BBC: .4byte 0x00000306
_080F0BC0: .4byte 0x00008778
_080F0BC4: .4byte 0x0000876c
_080F0BC8: .4byte gWindowConfig_81E70D4
_080F0BCC:
	ldr r0, _080F0C10 @ =gWindowConfig_81E70D4
	bl BasicInitMenuWindow
	ldr r1, _080F0C14 @ =0x00008778
	adds r0, r5, r1
	ldrh r0, [r0]
	adds r4, r0, 0
	adds r4, 0x10
	movs r0, 0x1F
	ands r4, r0
	movs r5, 0
_080F0BE2:
	adds r3, r4, 0x1
	movs r0, 0xC
	adds r1, r4, 0
	movs r2, 0x1F
	bl MenuZeroFillWindowRect
	adds r4, 0x2
	movs r0, 0x1F
	ands r4, r0
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x7
	bls _080F0BE2
	ldr r0, _080F0C18 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F0C1C @ =0x0000d15c
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0
	b _080F0C22
	.align 2, 0
_080F0C10: .4byte gWindowConfig_81E70D4
_080F0C14: .4byte 0x00008778
_080F0C18: .4byte gUnknown_083DFEC4
_080F0C1C: .4byte 0x0000d15c
_080F0C20:
	movs r0, 0x1
_080F0C22:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80F0B44

	thumb_func_start sub_80F0C28
sub_80F0C28: @ 80F0C28
	ldr r0, _080F0C3C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080F0C40 @ =0x0000d15c
	adds r1, r0, r2
	movs r2, 0
	strh r2, [r1]
	ldr r1, _080F0C44 @ =0x00000306
	adds r0, r1
	strh r2, [r0]
	bx lr
	.align 2, 0
_080F0C3C: .4byte gUnknown_083DFEC4
_080F0C40: .4byte 0x0000d15c
_080F0C44: .4byte 0x00000306
	thumb_func_end sub_80F0C28

	thumb_func_start sub_80F0C48
sub_80F0C48: @ 80F0C48
	push {r4-r6,lr}
	ldr r0, _080F0C5C @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r0, _080F0C60 @ =0x0000d15c
	adds r5, r4, r0
	ldrh r0, [r5]
	cmp r0, 0x7
	bls _080F0C64
	movs r0, 0
	b _080F0CD2
	.align 2, 0
_080F0C5C: .4byte gUnknown_083DFEC4
_080F0C60: .4byte 0x0000d15c
_080F0C64:
	ldr r2, _080F0CBC @ =0x00000306
	adds r1, r4, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	ldr r2, _080F0CC0 @ =0x0000ffff
	adds r6, r2, 0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _080F0CD0
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080F0CC4 @ =gWindowConfig_81E70D4
	bl BasicInitMenuWindow
	ldr r0, _080F0CC8 @ =0x00008770
	adds r1, r4, r0
	ldrh r0, [r5]
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _080F0CCC @ =0x00008778
	adds r2, r4, r1
	ldrh r1, [r5]
	lsls r1, 1
	ldrh r2, [r2]
	adds r1, r2
	lsls r1, 16
	lsrs r1, 16
	bl sub_80F0A74
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	ands r0, r6
	cmp r0, 0x7
	bls _080F0CD0
	movs r0, 0
	bl sub_80F081C
	movs r0, 0
	b _080F0CD2
	.align 2, 0
_080F0CBC: .4byte 0x00000306
_080F0CC0: .4byte 0x0000ffff
_080F0CC4: .4byte gWindowConfig_81E70D4
_080F0CC8: .4byte 0x00008770
_080F0CCC: .4byte 0x00008778
_080F0CD0:
	movs r0, 0x1
_080F0CD2:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80F0C48

	thumb_func_start sub_80F0CD8
sub_80F0CD8: @ 80F0CD8
	push {r4,r5,lr}
	ldr r4, _080F0D40 @ =gUnknown_083DFEC4
	ldr r1, [r4]
	ldr r2, _080F0D44 @ =0x00000306
	adds r0, r1, r2
	movs r2, 0
	strh r2, [r0]
	ldr r3, _080F0D48 @ =0x0000d15c
	adds r0, r1, r3
	strh r2, [r0]
	ldr r2, _080F0D4C @ =0x0000876e
	adds r0, r1, r2
	movs r3, 0
	ldrsh r0, [r0, r3]
	lsls r0, 3
	adds r0, r1, r0
	ldr r2, _080F0D50 @ =0x0000ceec
	adds r0, r2
	ldrb r0, [r0]
	ldr r3, _080F0D54 @ =0x0000d110
	adds r1, r3
	ldr r2, _080F0D58 @ =gTrainerEyeDescriptions
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	str r0, [r1]
	adds r2, r0, 0
	movs r1, 0
	adds r5, r4, 0
	adds r4, r3, 0
_080F0D14:
	ldrb r0, [r2]
	adds r3, r1, 0x1
	cmp r0, 0xFF
	beq _080F0D24
_080F0D1C:
	adds r2, 0x1
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _080F0D1C
_080F0D24:
	ldr r0, [r5]
	lsls r1, r3, 2
	adds r0, r4
	adds r0, r1
	adds r2, 0x1
	str r2, [r0]
	lsls r0, r3, 16
	lsrs r1, r0, 16
	cmp r1, 0x2
	bls _080F0D14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F0D40: .4byte gUnknown_083DFEC4
_080F0D44: .4byte 0x00000306
_080F0D48: .4byte 0x0000d15c
_080F0D4C: .4byte 0x0000876e
_080F0D50: .4byte 0x0000ceec
_080F0D54: .4byte 0x0000d110
_080F0D58: .4byte gTrainerEyeDescriptions
	thumb_func_end sub_80F0CD8

	thumb_func_start sub_80F0D5C
sub_80F0D5C: @ 80F0D5C
	push {r4,r5,lr}
	ldr r0, _080F0D70 @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r0, _080F0D74 @ =0x0000d15c
	adds r5, r4, r0
	ldrh r0, [r5]
	cmp r0, 0x7
	bne _080F0D78
_080F0D6C:
	movs r0, 0
	b _080F0EB0
	.align 2, 0
_080F0D70: .4byte gUnknown_083DFEC4
_080F0D74: .4byte 0x0000d15c
_080F0D78:
	ldr r0, _080F0DB8 @ =0x00000306
	adds r1, r4, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080F0D8C
	b _080F0EAE
_080F0D8C:
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080F0DBC @ =gWindowConfig_81E70D4
	bl BasicInitMenuWindow
	ldr r0, _080F0DC0 @ =0x00008778
	adds r1, r4, r0
	ldrh r3, [r5]
	lsls r0, r3, 1
	adds r0, 0x2
	ldrh r1, [r1]
	adds r5, r0, r1
	movs r0, 0x1F
	ands r5, r0
	cmp r3, 0x6
	bhi _080F0D6C
	lsls r0, r3, 2
	ldr r1, _080F0DC4 @ =_080F0DC8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F0DB8: .4byte 0x00000306
_080F0DBC: .4byte gWindowConfig_81E70D4
_080F0DC0: .4byte 0x00008778
_080F0DC4: .4byte _080F0DC8
	.align 2, 0
_080F0DC8:
	.4byte _080F0DE4
	.4byte _080F0DF0
	.4byte _080F0E08
	.4byte _080F0E14
	.4byte _080F0E2C
	.4byte _080F0E38
	.4byte _080F0E6C
_080F0DE4:
	ldr r0, _080F0DEC @ =gOtherText_Strategy
	lsls r2, r5, 3
	b _080F0E54
	.align 2, 0
_080F0DEC: .4byte gOtherText_Strategy
_080F0DF0:
	ldr r0, _080F0DFC @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F0E00 @ =0x00008788
	adds r4, r0, r1
	ldr r1, _080F0E04 @ =0x0000d110
	b _080F0E42
	.align 2, 0
_080F0DFC: .4byte gUnknown_083DFEC4
_080F0E00: .4byte 0x00008788
_080F0E04: .4byte 0x0000d110
_080F0E08:
	ldr r0, _080F0E10 @ =gOtherText_TrainersPokemon
	lsls r2, r5, 3
	b _080F0E54
	.align 2, 0
_080F0E10: .4byte gOtherText_TrainersPokemon
_080F0E14:
	ldr r0, _080F0E20 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F0E24 @ =0x00008788
	adds r4, r0, r1
	ldr r1, _080F0E28 @ =0x0000d114
	b _080F0E42
	.align 2, 0
_080F0E20: .4byte gUnknown_083DFEC4
_080F0E24: .4byte 0x00008788
_080F0E28: .4byte 0x0000d114
_080F0E2C:
	ldr r0, _080F0E34 @ =gOtherText_SelfIntroduction
	lsls r2, r5, 3
	b _080F0E54
	.align 2, 0
_080F0E34: .4byte gOtherText_SelfIntroduction
_080F0E38:
	ldr r0, _080F0E60 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F0E64 @ =0x00008788
	adds r4, r0, r1
	ldr r1, _080F0E68 @ =0x0000d118
_080F0E42:
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	movs r2, 0x88
	movs r3, 0
	bl sub_8072C74
	lsls r2, r5, 3
	adds r0, r4, 0
_080F0E54:
	movs r1, 0x61
	movs r3, 0
	bl MenuPrint_PixelCoords
	b _080F0EA0
	.align 2, 0
_080F0E60: .4byte gUnknown_083DFEC4
_080F0E64: .4byte 0x00008788
_080F0E68: .4byte 0x0000d118
_080F0E6C:
	ldr r0, _080F0E94 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F0E98 @ =0x00008788
	adds r4, r0, r1
	ldr r1, _080F0E9C @ =0x0000d11c
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	movs r2, 0x88
	movs r3, 0
	bl sub_8072C74
	lsls r2, r5, 3
	adds r0, r4, 0
	movs r1, 0x61
	movs r3, 0
	bl MenuPrint_PixelCoords
	b _080F0D6C
	.align 2, 0
_080F0E94: .4byte gUnknown_083DFEC4
_080F0E98: .4byte 0x00008788
_080F0E9C: .4byte 0x0000d11c
_080F0EA0:
	ldr r0, _080F0EB8 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F0EBC @ =0x0000d15c
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080F0EAE:
	movs r0, 0x1
_080F0EB0:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080F0EB8: .4byte gUnknown_083DFEC4
_080F0EBC: .4byte 0x0000d15c
	thumb_func_end sub_80F0D5C

	thumb_func_start sub_80F0EC0
sub_80F0EC0: @ 80F0EC0
	push {lr}
	ldr r0, _080F0EE4 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080F0EE8 @ =0x00000306
	adds r1, r0, r2
	movs r2, 0
	strh r2, [r1]
	ldr r3, _080F0EEC @ =0x0000d15c
	adds r1, r0, r3
	strh r2, [r1]
	ldr r1, _080F0EF0 @ =0x00008788
	adds r0, r1
	movs r1, 0
	movs r2, 0x10
	bl StringFill
	pop {r0}
	bx r0
	.align 2, 0
_080F0EE4: .4byte gUnknown_083DFEC4
_080F0EE8: .4byte 0x00000306
_080F0EEC: .4byte 0x0000d15c
_080F0EF0: .4byte 0x00008788
	thumb_func_end sub_80F0EC0

	thumb_func_start sub_80F0EF4
sub_80F0EF4: @ 80F0EF4
	push {r4,r5,lr}
	ldr r0, _080F0F08 @ =gUnknown_083DFEC4
	ldr r2, [r0]
	ldr r0, _080F0F0C @ =0x0000d15c
	adds r5, r2, r0
	ldrh r0, [r5]
	cmp r0, 0x6
	bls _080F0F10
	movs r0, 0
	b _080F0F52
	.align 2, 0
_080F0F08: .4byte gUnknown_083DFEC4
_080F0F0C: .4byte 0x0000d15c
_080F0F10:
	ldr r0, _080F0F58 @ =0x00000306
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _080F0F50
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080F0F5C @ =0x00008778
	adds r0, r2, r1
	ldrh r4, [r5]
	lsls r4, 1
	adds r4, 0x2
	ldrh r0, [r0]
	adds r4, r0
	movs r0, 0x1F
	ands r4, r0
	ldr r0, _080F0F60 @ =gWindowConfig_81E70D4
	bl BasicInitMenuWindow
	adds r3, r4, 0x1
	movs r0, 0xC
	adds r1, r4, 0
	movs r2, 0x1F
	bl MenuZeroFillWindowRect
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_080F0F50:
	movs r0, 0x1
_080F0F52:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080F0F58: .4byte 0x00000306
_080F0F5C: .4byte 0x00008778
_080F0F60: .4byte gWindowConfig_81E70D4
	thumb_func_end sub_80F0EF4

	thumb_func_start sub_80F0F64
sub_80F0F64: @ 80F0F64
	push {r4,lr}
	ldr r0, _080F0F90 @ =gUnknown_083DFEC4
	ldr r3, [r0]
	ldr r1, _080F0F94 @ =0x0000876c
	adds r0, r3, r1
	movs r4, 0
	ldrsh r2, [r0, r4]
	lsls r1, r2, 4
	ldr r4, _080F0F98 @ =0x0000877c
	adds r0, r3, r4
	strh r1, [r0]
	movs r1, 0x8
	cmp r2, 0x1
	bne _080F0F82
	movs r1, 0x4
_080F0F82:
	ldr r2, _080F0F9C @ =0x0000877a
	adds r0, r3, r2
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F0F90: .4byte gUnknown_083DFEC4
_080F0F94: .4byte 0x0000876c
_080F0F98: .4byte 0x0000877c
_080F0F9C: .4byte 0x0000877a
	thumb_func_end sub_80F0F64

	thumb_func_start sub_80F0FA0
sub_80F0FA0: @ 80F0FA0
	push {r4,lr}
	ldr r0, _080F0FDC @ =gUnknown_083DFEC4
	ldr r3, [r0]
	ldr r1, _080F0FE0 @ =0x0000876c
	adds r0, r3, r1
	movs r4, 0
	ldrsh r0, [r0, r4]
	negs r0, r0
	lsls r0, 16
	asrs r0, 16
	lsls r2, r0, 4
	ldr r4, _080F0FE4 @ =0x0000877c
	adds r1, r3, r4
	strh r2, [r1]
	movs r1, 0x1
	negs r1, r1
	movs r4, 0x8
	negs r4, r4
	adds r2, r4, 0
	cmp r0, r1
	bne _080F0FD0
	movs r0, 0x4
	negs r0, r0
	adds r2, r0, 0
_080F0FD0:
	ldr r1, _080F0FE8 @ =0x0000877a
	adds r0, r3, r1
	strh r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F0FDC: .4byte gUnknown_083DFEC4
_080F0FE0: .4byte 0x0000876c
_080F0FE4: .4byte 0x0000877c
_080F0FE8: .4byte 0x0000877a
	thumb_func_end sub_80F0FA0

	thumb_func_start sub_80F0FEC
sub_80F0FEC: @ 80F0FEC
	push {lr}
	bl sub_80F0718
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80F0FEC

	thumb_func_start sub_80F0FFC
sub_80F0FFC: @ 80F0FFC
	push {r4,r5,lr}
	lsls r0, 24
	ldr r1, _080F1048 @ =gUnknown_083DFEC4
	ldr r4, [r1]
	ldr r1, _080F104C @ =0x00008788
	adds r5, r4, r1
	lsrs r0, 21
	adds r0, r4, r0
	ldr r1, _080F1050 @ =0x0000ceea
	adds r0, r1
	ldrh r1, [r0]
	adds r0, r5, 0
	movs r2, 0
	bl GetMapSectionName
	ldr r0, _080F1054 @ =gWindowConfig_81E710C
	bl BasicInitMenuWindow
	adds r0, r5, 0
	bl sub_80F19DC
	ldr r0, _080F1058 @ =0x0000d138
	adds r4, r0
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x58
	movs r3, 0x2
	bl sub_8072C74
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x5
	bl MenuPrint
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F1048: .4byte gUnknown_083DFEC4
_080F104C: .4byte 0x00008788
_080F1050: .4byte 0x0000ceea
_080F1054: .4byte gWindowConfig_81E710C
_080F1058: .4byte 0x0000d138
	thumb_func_end sub_80F0FFC

	thumb_func_start sub_80F105C
sub_80F105C: @ 80F105C
	push {lr}
	ldr r0, _080F1078 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _080F107C @ =0x0000876e
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r2, 0xA
	adds r1, r2
	ldrh r1, [r1]
	bl sub_80F0A74
	pop {r0}
	bx r0
	.align 2, 0
_080F1078: .4byte gUnknown_083DFEC4
_080F107C: .4byte 0x0000876e
	thumb_func_end sub_80F105C

	thumb_func_start sub_80F1080
sub_80F1080: @ 80F1080
	push {r4,lr}
	ldr r1, _080F10A0 @ =gUnknown_083DFEC4
	ldr r0, [r1]
	ldr r2, _080F10A4 @ =0x0000d160
	adds r0, r2
	ldrh r0, [r0]
	adds r2, r1, 0
	cmp r0, 0xE
	bls _080F1094
	b _080F1204
_080F1094:
	lsls r0, 2
	ldr r1, _080F10A8 @ =_080F10AC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F10A0: .4byte gUnknown_083DFEC4
_080F10A4: .4byte 0x0000d160
_080F10A8: .4byte _080F10AC
	.align 2, 0
_080F10AC:
	.4byte _080F10E8
	.4byte _080F1104
	.4byte _080F1110
	.4byte _080F111C
	.4byte _080F1128
	.4byte _080F112E
	.4byte _080F1134
	.4byte _080F1142
	.4byte _080F1160
	.4byte _080F1166
	.4byte _080F116C
	.4byte _080F1180
	.4byte _080F1194
	.4byte _080F11DC
	.4byte _080F11E2
_080F10E8:
	bl sub_80EEDE8
	ldr r0, _080F10FC @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r3, _080F1100 @ =0x0000d162
	adds r0, r3
	movs r1, 0xB
	strb r1, [r0]
	b _080F1218
	.align 2, 0
_080F10FC: .4byte gUnknown_083DFEC4
_080F1100: .4byte 0x0000d162
_080F1104:
	ldr r0, _080F110C @ =gWindowConfig_81E70B8
	bl SetUpWindowConfig
	b _080F1218
	.align 2, 0
_080F110C: .4byte gWindowConfig_81E70B8
_080F1110:
	ldr r0, _080F1118 @ =gWindowConfig_81E70B8
	bl MultistepInitMenuWindowBegin
	b _080F1218
	.align 2, 0
_080F1118: .4byte gWindowConfig_81E70B8
_080F111C:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	beq _080F1126
	b _080F1218
_080F1126:
	b _080F1226
_080F1128:
	bl MenuZeroFillScreen
	b _080F1218
_080F112E:
	bl sub_80F1614
	b _080F1218
_080F1134:
	movs r0, 0x1
	bl sub_80F162C
	lsls r0, 24
	cmp r0, 0
	beq _080F1218
	b _080F1226
_080F1142:
	ldr r0, _080F1154 @ =gUnknown_08E9FBA0
	ldr r1, _080F1158 @ =gUnknown_083DFEC4
	ldr r1, [r1]
	ldr r2, _080F115C @ =0x0000934c
	adds r1, r2
	bl LZ77UnCompWram
	b _080F1218
	.align 2, 0
_080F1154: .4byte gUnknown_08E9FBA0
_080F1158: .4byte gUnknown_083DFEC4
_080F115C: .4byte 0x0000934c
_080F1160:
	bl sub_80F1238
	b _080F1218
_080F1166:
	bl sub_80F13FC
	b _080F1218
_080F116C:
	ldr r0, _080F1178 @ =gPokenavRibbonView_Gfx
	ldr r1, _080F117C @ =0x06008000
	bl LZ77UnCompVram
	b _080F1218
	.align 2, 0
_080F1178: .4byte gPokenavRibbonView_Gfx
_080F117C: .4byte 0x06008000
_080F1180:
	ldr r0, _080F118C @ =gUnknown_083E040C
	ldr r1, _080F1190 @ =0x06008200
	bl LZ77UnCompVram
	b _080F1218
	.align 2, 0
_080F118C: .4byte gUnknown_083E040C
_080F1190: .4byte 0x06008200
_080F1194:
	ldr r0, _080F11CC @ =gPokenavRibbonView_Pal
	movs r1, 0x20
	movs r2, 0x20
	bl LoadPalette
	ldr r4, _080F11D0 @ =gUnknown_083E03A8
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _080F11D4 @ =gUnknown_083E3C60
	movs r1, 0x30
	movs r2, 0xA0
	bl LoadPalette
	ldr r0, _080F11D8 @ =gUnknownPalette_81E6692
	movs r1, 0xB0
	movs r2, 0x20
	bl LoadPalette
	adds r4, 0x1E
	adds r0, r4, 0
	movs r1, 0xBF
	movs r2, 0x2
	bl LoadPalette
	b _080F1218
	.align 2, 0
_080F11CC: .4byte gPokenavRibbonView_Pal
_080F11D0: .4byte gUnknown_083E03A8
_080F11D4: .4byte gUnknown_083E3C60
_080F11D8: .4byte gUnknownPalette_81E6692
_080F11DC:
	bl sub_80F1438
	b _080F1218
_080F11E2:
	ldr r1, _080F1208 @ =REG_BG2CNT
	ldr r3, _080F120C @ =0x00001e02
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _080F1210 @ =0x0000170b
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x42
	movs r0, 0
	strh r0, [r1]
	ldr r1, [r2]
	ldr r0, _080F1214 @ =0x0000d160
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080F1204:
	movs r0, 0
	b _080F1228
	.align 2, 0
_080F1208: .4byte REG_BG2CNT
_080F120C: .4byte 0x00001e02
_080F1210: .4byte 0x0000170b
_080F1214: .4byte 0x0000d160
_080F1218:
	ldr r0, _080F1230 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _080F1234 @ =0x0000d160
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080F1226:
	movs r0, 0x1
_080F1228:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F1230: .4byte gUnknown_083DFEC4
_080F1234: .4byte 0x0000d160
	thumb_func_end sub_80F1080

	thumb_func_start sub_80F1238
sub_80F1238: @ 80F1238
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r6, 0x8B
	ldr r0, _080F1318 @ =gUnknown_083DFEC4
	ldr r2, [r0]
	ldr r1, _080F131C @ =0x0000bc8e
	adds r0, r2, r1
	ldr r3, _080F1320 @ =0x0000bc8f
	adds r1, r2, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	subs r0, r1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r7, 0
	mov r5, sp
	adds r4, r2, 0
_080F1264:
	movs r1, 0x80
	lsls r1, 6
	adds r0, r1, 0
	strh r0, [r5]
	lsls r1, r7, 5
	adds r1, r6, r1
	lsls r1, 1
	ldr r2, _080F1324 @ =0x0000934c
	adds r1, r2
	adds r1, r4, r1
	mov r0, sp
	ldr r2, _080F1328 @ =0x01000012
	bl CpuSet
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x7
	bls _080F1264
	ldr r3, [sp, 0x4]
	lsls r0, r3, 16
	movs r7, 0
	mov r9, r0
	cmp r0, 0
	beq _080F1342
	ldr r0, _080F1318 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	mov r8, r0
	ldr r1, _080F132C @ =gUnknown_083E4698
	mov r10, r1
	ldr r5, _080F1324 @ =0x0000934c
	add r5, r8
_080F12A4:
	ldr r0, _080F1330 @ =0x0000bc4c
	add r0, r8
	adds r0, r7
	ldrb r1, [r0]
	lsls r1, 2
	mov r0, r10
	adds r0, 0x2
	adds r0, r1, r0
	ldrb r2, [r0]
	adds r2, 0x3
	lsls r2, 24
	add r1, r10
	ldrh r0, [r1]
	lsls r0, 25
	movs r3, 0x80
	lsls r3, 21
	adds r0, r3
	lsrs r4, r0, 24
	lsls r1, r6, 1
	adds r1, r5, r1
	lsrs r2, 12
	adds r0, r2, 0
	orrs r0, r4
	strh r0, [r1]
	adds r1, r6, 0x1
	lsls r1, 1
	adds r1, r5, r1
	movs r3, 0x80
	lsls r3, 3
	adds r0, r3, 0
	adds r3, r2, 0
	orrs r3, r0
	adds r0, r3, 0
	orrs r0, r4
	strh r0, [r1]
	adds r0, r6, 0
	adds r0, 0x20
	lsls r0, 1
	adds r0, r5, r0
	adds r1, r4, 0x1
	orrs r2, r1
	strh r2, [r0]
	adds r0, r6, 0
	adds r0, 0x21
	lsls r0, 1
	adds r0, r5, r0
	orrs r3, r1
	strh r3, [r0]
	adds r4, r7, 0x1
	adds r0, r4, 0
	movs r1, 0x9
	bl __modsi3
	cmp r0, 0
	bne _080F1334
	adds r0, r6, 0
	adds r0, 0x30
	b _080F1336
	.align 2, 0
_080F1318: .4byte gUnknown_083DFEC4
_080F131C: .4byte 0x0000bc8e
_080F1320: .4byte 0x0000bc8f
_080F1324: .4byte 0x0000934c
_080F1328: .4byte 0x01000012
_080F132C: .4byte gUnknown_083E4698
_080F1330: .4byte 0x0000bc4c
_080F1334:
	adds r0, r6, 0x2
_080F1336:
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r0, r4, 16
	lsrs r7, r0, 16
	cmp r0, r9
	bcc _080F12A4
_080F1342:
	ldr r6, _080F13E8 @ =0x0000014b
	movs r7, 0
	ldr r1, _080F13EC @ =gUnknown_083DFEC4
	ldr r0, [r1]
	ldr r2, _080F13F0 @ =0x0000bc8f
	adds r1, r0, r2
	ldrb r3, [r1]
	cmp r7, r3
	bcs _080F13D8
	subs r2, 0x43
	adds r2, r0
	mov r10, r2
	ldr r3, _080F13F4 @ =gUnknown_083E4698
	mov r8, r3
	ldr r2, _080F13F8 @ =0x0000934c
	adds r5, r0, r2
	mov r9, r1
_080F1364:
	ldr r3, [sp, 0x4]
	adds r0, r3, r7
	add r0, r10
	ldrb r1, [r0]
	lsls r1, 2
	mov r0, r8
	adds r0, 0x2
	adds r0, r1, r0
	ldrb r2, [r0]
	adds r2, 0x3
	lsls r2, 24
	add r1, r8
	ldrh r0, [r1]
	lsls r0, 25
	movs r1, 0x80
	lsls r1, 21
	adds r0, r1
	lsrs r4, r0, 24
	lsls r1, r6, 1
	adds r1, r5, r1
	lsrs r2, 12
	adds r0, r2, 0
	orrs r0, r4
	strh r0, [r1]
	adds r1, r6, 0x1
	lsls r1, 1
	adds r1, r5, r1
	movs r3, 0x80
	lsls r3, 3
	adds r0, r3, 0
	adds r3, r2, 0
	orrs r3, r0
	adds r0, r3, 0
	orrs r0, r4
	strh r0, [r1]
	adds r0, r6, 0
	adds r0, 0x20
	lsls r0, 1
	adds r0, r5, r0
	adds r1, r4, 0x1
	orrs r2, r1
	strh r2, [r0]
	adds r0, r6, 0
	adds r0, 0x21
	lsls r0, 1
	adds r0, r5, r0
	orrs r3, r1
	strh r3, [r0]
	adds r0, r6, 0x2
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	mov r0, r9
	ldrb r0, [r0]
	cmp r7, r0
	bcc _080F1364
_080F13D8:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F13E8: .4byte 0x0000014b
_080F13EC: .4byte gUnknown_083DFEC4
_080F13F0: .4byte 0x0000bc8f
_080F13F4: .4byte gUnknown_083E4698
_080F13F8: .4byte 0x0000934c
	thumb_func_end sub_80F1238

	thumb_func_start sub_80F13FC
sub_80F13FC: @ 80F13FC
	ldr r0, _080F141C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F1420 @ =0x0000934c
	adds r0, r1
	ldr r2, _080F1424 @ =0x0600b800
	ldr r1, _080F1428 @ =0x040000d4
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _080F142C @ =0x84000140
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _080F1430 @ =gPlttBufferUnfaded
	ldr r0, _080F1434 @ =gPokenavRibbonView_Pal + 0x1C
	ldrh r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_080F141C: .4byte gUnknown_083DFEC4
_080F1420: .4byte 0x0000934c
_080F1424: .4byte 0x0600b800
_080F1428: .4byte 0x040000d4
_080F142C: .4byte 0x84000140
_080F1430: .4byte gPlttBufferUnfaded
_080F1434: .4byte gPokenavRibbonView_Pal + 0x1C
	thumb_func_end sub_80F13FC

	thumb_func_start sub_80F1438
sub_80F1438: @ 80F1438
	push {r4,r5,lr}
	ldr r0, _080F1470 @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r1, _080F1474 @ =0x00008829
	adds r0, r4, r1
	movs r1, 0xD
	movs r2, 0x1
	bl MenuPrint
	ldr r0, _080F1478 @ =0x00008788
	adds r5, r4, r0
	ldr r1, _080F147C @ =0x0000876e
	adds r4, r1
	ldrh r1, [r4]
	adds r1, 0x1
	lsls r1, 16
	lsrs r1, 16
	adds r0, r5, 0
	bl sub_80F445C
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0x5
	bl MenuPrint
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F1470: .4byte gUnknown_083DFEC4
_080F1474: .4byte 0x00008829
_080F1478: .4byte 0x00008788
_080F147C: .4byte 0x0000876e
	thumb_func_end sub_80F1438

	thumb_func_start sub_80F1480
sub_80F1480: @ 80F1480
	push {lr}
	movs r0, 0xC
	movs r1, 0xD
	movs r2, 0x1B
	movs r3, 0x10
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	thumb_func_end sub_80F1480

	thumb_func_start sub_80F1494
sub_80F1494: @ 80F1494
	push {r4-r7,lr}
	ldr r0, _080F14D4 @ =gUnknown_083DFEC8
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 4
	adds r6, r0, r1
	ldr r2, _080F14D8 @ =0x00000a98
	adds r7, r0, r2
	ldr r0, _080F14DC @ =gUnknown_083DFEC4
	ldr r3, [r0]
	ldr r4, _080F14E0 @ =0x0000bc91
	adds r1, r3, r4
	ldrb r0, [r1]
	cmp r0, 0x2
	bhi _080F14F0
	ldr r5, _080F14E4 @ =gUnknown_020388B4
	adds r1, r0, 0
	lsls r0, r1, 3
	subs r4, 0x1
	adds r2, r3, r4
	adds r0, r1
	ldrb r2, [r2]
	adds r0, r2
	strh r0, [r5]
	ldr r1, _080F14E8 @ =0x0000bc4c
	adds r0, r3, r1
	ldrh r2, [r5]
	adds r0, r2
	ldrb r0, [r0]
	strh r0, [r5]
	ldr r4, _080F14EC @ =gRibbonDescriptions
	b _080F152E
	.align 2, 0
_080F14D4: .4byte gUnknown_083DFEC8
_080F14D8: .4byte 0x00000a98
_080F14DC: .4byte gUnknown_083DFEC4
_080F14E0: .4byte 0x0000bc91
_080F14E4: .4byte gUnknown_020388B4
_080F14E8: .4byte 0x0000bc4c
_080F14EC: .4byte gRibbonDescriptions
_080F14F0:
	ldr r5, _080F1558 @ =gUnknown_020388B4
	ldr r4, _080F155C @ =0x0000bc8e
	adds r0, r3, r4
	ldrb r0, [r0]
	ldr r2, _080F1560 @ =0x0000bc8f
	adds r1, r3, r2
	ldrb r1, [r1]
	subs r0, r1
	strh r0, [r5]
	ldrh r1, [r5]
	adds r4, 0x2
	adds r0, r3, r4
	ldrb r0, [r0]
	adds r1, r0
	subs r2, 0x43
	adds r0, r3, r2
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r5]
	ldr r0, _080F1564 @ =gSaveBlock1
	ldrh r1, [r5]
	adds r0, r1
	ldr r4, _080F1568 @ =0x000030f7
	adds r0, r4
	ldrb r0, [r0]
	strh r0, [r5]
	cmp r0, 0
	beq _080F1570
	subs r0, 0x1
	strh r0, [r5]
	ldr r4, _080F156C @ =gGiftRibbonDescriptions
_080F152E:
	ldrh r0, [r5]
	lsls r0, 3
	adds r0, r4
	ldr r1, [r0]
	adds r0, r6, 0
	movs r2, 0x80
	movs r3, 0
	bl sub_8072C74
	ldrh r0, [r5]
	lsls r0, 3
	adds r4, 0x4
	adds r0, r4
	ldr r1, [r0]
	adds r0, r7, 0
	movs r2, 0x80
	movs r3, 0
	bl sub_8072C74
	b _080F158A
	.align 2, 0
_080F1558: .4byte gUnknown_020388B4
_080F155C: .4byte 0x0000bc8e
_080F1560: .4byte 0x0000bc8f
_080F1564: .4byte gSaveBlock1
_080F1568: .4byte 0x000030f7
_080F156C: .4byte gGiftRibbonDescriptions
_080F1570:
	ldr r4, _080F15A4 @ =gEmptyString_81E72B0
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0x80
	movs r3, 0
	bl sub_8072C74
	adds r0, r7, 0
	adds r1, r4, 0
	movs r2, 0x80
	movs r3, 0
	bl sub_8072C74
_080F158A:
	adds r0, r6, 0
	movs r1, 0xC
	movs r2, 0xD
	bl MenuPrint
	adds r0, r7, 0
	movs r1, 0xC
	movs r2, 0xF
	bl MenuPrint
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F15A4: .4byte gEmptyString_81E72B0
	thumb_func_end sub_80F1494

	thumb_func_start sub_80F15A8
sub_80F15A8: @ 80F15A8
	push {r4,r5,lr}
	movs r0, 0xC
	movs r1, 0xD
	movs r2, 0x1B
	movs r3, 0x10
	bl MenuZeroFillWindowRect
	ldr r0, _080F1600 @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r0, _080F1604 @ =0x00008788
	adds r5, r4, r0
	ldr r1, _080F1608 @ =gOtherText_Ribbons
	adds r0, r5, 0
	bl StringCopy
	adds r2, r0, 0
	movs r0, 0
	strb r0, [r2]
	adds r2, 0x1
	ldr r1, _080F160C @ =0x000087dc
	adds r0, r4, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	lsls r0, 2
	adds r4, r0
	ldr r0, _080F1610 @ =0x0000893c
	adds r4, r0
	ldrb r1, [r4]
	adds r0, r2, 0
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r2, r0, 0
	movs r0, 0xFF
	strb r0, [r2]
	adds r0, r5, 0
	movs r1, 0xC
	movs r2, 0xD
	bl MenuPrint
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F1600: .4byte gUnknown_083DFEC4
_080F1604: .4byte 0x00008788
_080F1608: .4byte gOtherText_Ribbons
_080F160C: .4byte 0x000087dc
_080F1610: .4byte 0x0000893c
	thumb_func_end sub_80F15A8

	thumb_func_start sub_80F1614
sub_80F1614: @ 80F1614
	ldr r0, _080F1624 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F1628 @ =0x00008764
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
	bx lr
	.align 2, 0
_080F1624: .4byte gUnknown_083DFEC4
_080F1628: .4byte 0x00008764
	thumb_func_end sub_80F1614

	thumb_func_start sub_80F162C
sub_80F162C: @ 80F162C
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _080F164C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080F1650 @ =0x00008764
	adds r0, r2
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _080F165E
	cmp r0, 0x1
	bgt _080F1654
	cmp r0, 0
	beq _080F16F0
	b _080F16D0
	.align 2, 0
_080F164C: .4byte gUnknown_083DFEC4
_080F1650: .4byte 0x00008764
_080F1654:
	cmp r0, 0x2
	beq _080F1670
	cmp r0, 0x3
	beq _080F1694
	b _080F16D0
_080F165E:
	ldr r0, _080F1668 @ =gUnknown_08E9FF58
	ldr r1, _080F166C @ =0x0600e800
	bl LZ77UnCompVram
	b _080F16F0
	.align 2, 0
_080F1668: .4byte gUnknown_08E9FF58
_080F166C: .4byte 0x0600e800
_080F1670:
	ldr r1, _080F1684 @ =gPokenavRibbonPokeView_Gfx
	ldr r2, _080F1688 @ =0x0600e000
	ldr r0, _080F168C @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _080F1690 @ =0x80000070
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	b _080F16F0
	.align 2, 0
_080F1684: .4byte gPokenavRibbonPokeView_Gfx
_080F1688: .4byte 0x0600e000
_080F168C: .4byte 0x040000d4
_080F1690: .4byte 0x80000070
_080F1694:
	cmp r1, 0
	bne _080F16A8
	ldr r0, _080F16A4 @ =gUnknown_083E0124
	movs r1, 0xD0
	movs r2, 0x20
	bl LoadPalette
	b _080F16B2
	.align 2, 0
_080F16A4: .4byte gUnknown_083E0124
_080F16A8:
	ldr r0, _080F16D4 @ =gUnknown_083E0144
	movs r1, 0xD0
	movs r2, 0x20
	bl LoadPalette
_080F16B2:
	ldr r0, _080F16D8 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r3, _080F16DC @ =0x00008766
	adds r2, r1, r3
	ldr r0, _080F16E0 @ =0x0000ffb0
	strh r0, [r2]
	ldr r2, _080F16E4 @ =REG_BG0CNT
	ldr r3, _080F16E8 @ =0x00001d0d
	adds r0, r3, 0
	strh r0, [r2]
	ldr r0, _080F16EC @ =0x00008764
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080F16D0:
	movs r0, 0
	b _080F1700
	.align 2, 0
_080F16D4: .4byte gUnknown_083E0144
_080F16D8: .4byte gUnknown_083DFEC4
_080F16DC: .4byte 0x00008766
_080F16E0: .4byte 0x0000ffb0
_080F16E4: .4byte REG_BG0CNT
_080F16E8: .4byte 0x00001d0d
_080F16EC: .4byte 0x00008764
_080F16F0:
	ldr r0, _080F1704 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _080F1708 @ =0x00008764
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x1
_080F1700:
	pop {r1}
	bx r1
	.align 2, 0
_080F1704: .4byte gUnknown_083DFEC4
_080F1708: .4byte 0x00008764
	thumb_func_end sub_80F162C

	thumb_func_start sub_80F170C
sub_80F170C: @ 80F170C
	push {lr}
	ldr r0, _080F1734 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080F1738 @ =0x00008766
	adds r1, r0, r2
	ldrh r0, [r1]
	adds r0, 0x10
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	ble _080F1726
	movs r0, 0
	strh r0, [r1]
_080F1726:
	movs r0, 0
	ldrsh r1, [r1, r0]
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	pop {r1}
	bx r1
	.align 2, 0
_080F1734: .4byte gUnknown_083DFEC4
_080F1738: .4byte 0x00008766
	thumb_func_end sub_80F170C

	thumb_func_start sub_80F173C
sub_80F173C: @ 80F173C
	push {lr}
	ldr r0, _080F176C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080F1770 @ =0x00008766
	adds r1, r0, r2
	ldrh r0, [r1]
	subs r0, 0x10
	strh r0, [r1]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x50
	negs r2, r2
	cmp r0, r2
	bge _080F175C
	ldr r0, _080F1774 @ =0x0000ffb0
	strh r0, [r1]
_080F175C:
	movs r0, 0
	ldrsh r1, [r1, r0]
	eors r1, r2
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	pop {r1}
	bx r1
	.align 2, 0
_080F176C: .4byte gUnknown_083DFEC4
_080F1770: .4byte 0x00008766
_080F1774: .4byte 0x0000ffb0
	thumb_func_end sub_80F173C

	thumb_func_start sub_80F1778
sub_80F1778: @ 80F1778
	push {r4,lr}
	sub sp, 0x14
	ldr r0, _080F1798 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F179C @ =0x0000d160
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0x9
	bls _080F178C
	b _080F1910
_080F178C:
	lsls r0, 2
	ldr r1, _080F17A0 @ =_080F17A4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F1798: .4byte gUnknown_083DFEC4
_080F179C: .4byte 0x0000d160
_080F17A0: .4byte _080F17A4
	.align 2, 0
_080F17A4:
	.4byte _080F17CC
	.4byte _080F17E8
	.4byte _080F17EE
	.4byte _080F17FE
	.4byte _080F1810
	.4byte _080F1830
	.4byte _080F1858
	.4byte _080F186C
	.4byte _080F18B8
	.4byte _080F18D8
_080F17CC:
	bl sub_80EEDE8
	ldr r0, _080F17E0 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080F17E4 @ =0x0000d162
	adds r0, r2
	movs r1, 0x2
	strb r1, [r0]
	b _080F1914
	.align 2, 0
_080F17E0: .4byte gUnknown_083DFEC4
_080F17E4: .4byte 0x0000d162
_080F17E8:
	bl sub_80F1614
	b _080F1914
_080F17EE:
	movs r0, 0
	bl sub_80F162C
	lsls r0, 24
	cmp r0, 0
	bne _080F17FC
	b _080F1914
_080F17FC:
	b _080F1922
_080F17FE:
	ldr r0, _080F1808 @ =gPokenavConditionView_Gfx
	ldr r1, _080F180C @ =0x06005000
	bl LZ77UnCompVram
	b _080F1914
	.align 2, 0
_080F1808: .4byte gPokenavConditionView_Gfx
_080F180C: .4byte 0x06005000
_080F1810:
	ldr r0, _080F1824 @ =gUnknown_08E9AC4C
	ldr r1, _080F1828 @ =0x0600f000
	bl LZ77UnCompVram
	ldr r0, _080F182C @ =gPokenavConditionMenu2_Pal
	movs r1, 0x20
	movs r2, 0x20
	bl LoadPalette
	b _080F1914
	.align 2, 0
_080F1824: .4byte gUnknown_08E9AC4C
_080F1828: .4byte 0x0600f000
_080F182C: .4byte gPokenavConditionMenu2_Pal
_080F1830:
	ldr r0, _080F1850 @ =0x0600f000
	ldr r3, _080F1854 @ =gUnknown_083E01F4
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r2, 0xC
	str r2, [sp, 0x8]
	movs r1, 0x4
	str r1, [sp, 0xC]
	str r2, [sp, 0x10]
	movs r1, 0
	movs r2, 0xD
	bl sub_8095C8C
	b _080F1914
	.align 2, 0
_080F1850: .4byte 0x0600f000
_080F1854: .4byte gUnknown_083E01F4
_080F1858:
	ldr r0, _080F1864 @ =gUnknown_08E9FEB4
	ldr r1, _080F1868 @ =0x0600b800
	bl LZ77UnCompVram
	b _080F1914
	.align 2, 0
_080F1864: .4byte gUnknown_08E9FEB4
_080F1868: .4byte 0x0600b800
_080F186C:
	ldr r0, _080F18AC @ =gUnknown_083E0254
	movs r1, 0x30
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _080F18B0 @ =gUnknownPalette_81E6692
	movs r1, 0xB0
	movs r2, 0x20
	bl LoadPalette
	ldr r4, _080F18B4 @ =gPokenavConditionMenu2_Pal + 0x2
	adds r0, r4, 0
	movs r1, 0xB1
	movs r2, 0x2
	bl LoadPalette
	adds r0, r4, 0
	adds r0, 0xE
	movs r1, 0xB5
	movs r2, 0x2
	bl LoadPalette
	adds r4, 0x1C
	adds r0, r4, 0
	movs r1, 0xBF
	movs r2, 0x2
	bl LoadPalette
	bl sub_80F01A4
	b _080F1914
	.align 2, 0
_080F18AC: .4byte gUnknown_083E0254
_080F18B0: .4byte gUnknownPalette_81E6692
_080F18B4: .4byte gPokenavConditionMenu2_Pal + 0x2
_080F18B8:
	ldr r0, _080F18D0 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F18D4 @ =0x00008fe9
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 16
	lsrs r0, 16
	bl sub_80F01E0
	b _080F1914
	.align 2, 0
_080F18D0: .4byte gUnknown_083DFEC4
_080F18D4: .4byte 0x00008fe9
_080F18D8:
	ldr r1, _080F18FC @ =REG_BG3CNT
	ldr r2, _080F1900 @ =0x00001e03
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	ldr r2, _080F1904 @ =0x00001702
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x44
	ldr r2, _080F1908 @ =0x00000844
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080F190C @ =0x0000040b
	adds r0, r2, 0
	strh r0, [r1]
	b _080F1914
	.align 2, 0
_080F18FC: .4byte REG_BG3CNT
_080F1900: .4byte 0x00001e03
_080F1904: .4byte 0x00001702
_080F1908: .4byte 0x00000844
_080F190C: .4byte 0x0000040b
_080F1910:
	movs r0, 0
	b _080F1924
_080F1914:
	ldr r0, _080F192C @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F1930 @ =0x0000d160
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080F1922:
	movs r0, 0x1
_080F1924:
	add sp, 0x14
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F192C: .4byte gUnknown_083DFEC4
_080F1930: .4byte 0x0000d160
	thumb_func_end sub_80F1778

	thumb_func_start sub_80F1934
sub_80F1934: @ 80F1934
	push {r4,r5,lr}
	ldr r0, _080F1990 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F1994 @ =0x00008788
	adds r5, r1, r0
	ldr r3, _080F1998 @ =0x000087dc
	adds r2, r1, r3
	movs r3, 0
	ldrsh r0, [r2, r3]
	lsls r0, 2
	adds r1, r0
	ldr r0, _080F199C @ =0x0000893f
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	bge _080F19AC
	ldrb r0, [r2]
	bl sub_8137124
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _080F19A0 @ =gPlayerParty
	adds r0, r1
	bl GetNature
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080F19A4 @ =gOtherText_Nature2
	adds r0, r5, 0
	bl StringCopy
	adds r5, r0, 0
	ldr r0, _080F19A8 @ =gNatureNames
	lsls r4, 2
	adds r4, r0
	ldr r1, [r4]
	adds r0, r5, 0
	movs r2, 0x57
	movs r3, 0
	bl sub_8072C74
	b _080F19B8
	.align 2, 0
_080F1990: .4byte gUnknown_083DFEC4
_080F1994: .4byte 0x00008788
_080F1998: .4byte 0x000087dc
_080F199C: .4byte 0x0000893f
_080F19A0: .4byte gPlayerParty
_080F19A4: .4byte gOtherText_Nature2
_080F19A8: .4byte gNatureNames
_080F19AC:
	ldr r1, _080F19D0 @ =gEmptyString_81E72B0
	adds r0, r5, 0
	movs r2, 0x57
	movs r3, 0
	bl sub_8072C74
_080F19B8:
	ldr r0, _080F19D4 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F19D8 @ =0x00008788
	adds r0, r1
	movs r1, 0x1
	movs r2, 0x70
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F19D0: .4byte gEmptyString_81E72B0
_080F19D4: .4byte gUnknown_083DFEC4
_080F19D8: .4byte 0x00008788
	thumb_func_end sub_80F1934

	thumb_func_start sub_80F19DC
sub_80F19DC: @ 80F19DC
	push {lr}
	adds r1, r0, 0
	b _080F19E4
_080F19E2:
	adds r1, 0x1
_080F19E4:
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _080F19F8
	cmp r0, 0xFC
	bne _080F19E2
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _080F19E2
	movs r0, 0xFF
	strb r0, [r1]
_080F19F8:
	pop {r0}
	bx r0
	thumb_func_end sub_80F19DC

	thumb_func_start sub_80F19FC
sub_80F19FC: @ 80F19FC
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _080F1A68 @ =gUnknown_020388B0
	ldrb r4, [r5]
	cmp r4, 0x1
	bne _080F1A60
	ldr r0, _080F1A6C @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _080F1A70 @ =0x00006e2c
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, 0x3
	adds r1, r2
	ldrb r1, [r1]
	ldrb r2, [r5, 0x1]
	bl GetLandmarkName
	cmp r0, 0
	beq _080F1A46
	ldrb r2, [r5, 0x1]
	lsls r2, 20
	movs r1, 0xC0
	lsls r1, 14
	adds r2, r1
	lsrs r2, 16
	str r4, [sp]
	movs r1, 0x70
	movs r3, 0x78
	bl sub_8072A18
	ldrb r0, [r5, 0x1]
	adds r0, 0x1
	strb r0, [r5, 0x1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _080F1A60
_080F1A46:
	ldrb r1, [r5, 0x1]
	lsls r1, 25
	movs r2, 0xC0
	lsls r2, 19
	adds r1, r2
	lsrs r1, 24
	movs r0, 0xE
	movs r2, 0x1C
	movs r3, 0xF
	bl MenuFillWindowRectWithBlankTile
	movs r0, 0
	strb r0, [r5]
_080F1A60:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F1A68: .4byte gUnknown_020388B0
_080F1A6C: .4byte gUnknown_083DFEC4
_080F1A70: .4byte 0x00006e2c
	thumb_func_end sub_80F19FC

	thumb_func_start sub_80F1A74
sub_80F1A74: @ 80F1A74
	ldr r1, _080F1A7C @ =gUnknown_020388B0
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080F1A7C: .4byte gUnknown_020388B0
	thumb_func_end sub_80F1A74

	thumb_func_start sub_80F1A80
sub_80F1A80: @ 80F1A80
	ldr r0, _080F1A8C @ =gUnknown_020388B0
	movs r2, 0
	movs r1, 0x1
	strb r1, [r0]
	strb r2, [r0, 0x1]
	bx lr
	.align 2, 0
_080F1A8C: .4byte gUnknown_020388B0
	thumb_func_end sub_80F1A80

	thumb_func_start sub_80F1A90
sub_80F1A90: @ 80F1A90
	push {lr}
	ldr r0, _080F1AB8 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F1ABC @ =0x00000306
	adds r2, r0, r1
	movs r1, 0
	strh r1, [r2]
	ldr r1, _080F1AC0 @ =0x00006dac
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F1AB2
_080F1AA8:
	bl sub_80F1AC4
	lsls r0, 24
	cmp r0, 0
	bne _080F1AA8
_080F1AB2:
	pop {r0}
	bx r0
	.align 2, 0
_080F1AB8: .4byte gUnknown_083DFEC4
_080F1ABC: .4byte 0x00000306
_080F1AC0: .4byte 0x00006dac
	thumb_func_end sub_80F1A90

	thumb_func_start sub_80F1AC4
sub_80F1AC4: @ 80F1AC4
	push {r4,r5,lr}
	ldr r0, _080F1AE0 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _080F1AE4 @ =0x00000306
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _080F1B34
	cmp r0, 0x1
	bgt _080F1AE8
	cmp r0, 0
	beq _080F1AF2
	b _080F1B6C
	.align 2, 0
_080F1AE0: .4byte gUnknown_083DFEC4
_080F1AE4: .4byte 0x00000306
_080F1AE8:
	cmp r0, 0x2
	beq _080F1B40
	cmp r0, 0x3
	beq _080F1B54
	b _080F1B6C
_080F1AF2:
	movs r0, 0
	movs r2, 0xC8
	lsls r2, 2
	adds r4, r1, r2
	movs r5, 0
_080F1AFC:
	movs r2, 0
	adds r1, r0, 0x1
	lsls r3, r0, 4
_080F1B02:
	lsls r0, r2, 2
	adds r0, r3
	adds r0, r4, r0
	str r5, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x3
	bls _080F1B02
	lsls r0, r1, 16
	lsrs r0, 16
	cmp r0, 0x5
	bls _080F1AFC
	ldr r0, _080F1B2C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F1B30 @ =0x00000311
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	b _080F1B6C
	.align 2, 0
_080F1B2C: .4byte gUnknown_083DFEC4
_080F1B30: .4byte 0x00000311
_080F1B34:
	ldr r0, _080F1B3C @ =gPokenavMenuOptions_Gfx
	movs r2, 0xE2
	lsls r2, 2
	b _080F1B44
	.align 2, 0
_080F1B3C: .4byte gPokenavMenuOptions_Gfx
_080F1B40:
	ldr r0, _080F1B4C @ =gPokenavConditionMenu_Gfx
	ldr r2, _080F1B50 @ =0x00001788
_080F1B44:
	adds r1, r2
	bl LZ77UnCompWram
	b _080F1B6C
	.align 2, 0
_080F1B4C: .4byte gPokenavConditionMenu_Gfx
_080F1B50: .4byte 0x00001788
_080F1B54:
	ldr r0, _080F1B64 @ =gPokenavConditionSearch_Gfx
	ldr r2, _080F1B68 @ =0x00002388
	adds r1, r2
	bl LZ77UnCompWram
	movs r0, 0
	b _080F1B7C
	.align 2, 0
_080F1B64: .4byte gPokenavConditionSearch_Gfx
_080F1B68: .4byte 0x00002388
_080F1B6C:
	ldr r0, _080F1B84 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F1B88 @ =0x00000306
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x1
_080F1B7C:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080F1B84: .4byte gUnknown_083DFEC4
_080F1B88: .4byte 0x00000306
	thumb_func_end sub_80F1AC4

	thumb_func_start sub_80F1B8C
sub_80F1B8C: @ 80F1B8C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080F1BBC @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F1BC0 @ =0x00000306
	adds r2, r0, r1
	movs r1, 0
	strh r1, [r2]
	ldr r1, _080F1BC4 @ =0x00006dac
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F1BB4
_080F1BA8:
	adds r0, r4, 0
	bl sub_80F1BC8
	lsls r0, 24
	cmp r0, 0
	bne _080F1BA8
_080F1BB4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F1BBC: .4byte gUnknown_083DFEC4
_080F1BC0: .4byte 0x00000306
_080F1BC4: .4byte 0x00006dac
	thumb_func_end sub_80F1B8C

	thumb_func_start sub_80F1BC8
sub_80F1BC8: @ 80F1BC8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, _080F1BF4 @ =gUnknown_083DFEC4
	ldr r2, [r1]
	ldr r3, _080F1BF8 @ =0x00000306
	adds r0, r2, r3
	ldrh r0, [r0]
	adds r3, r1, 0
	cmp r0, 0x1
	beq _080F1C0A
	cmp r0, 0x1
	bgt _080F1BFC
	cmp r0, 0
	beq _080F1C02
	b _080F1DC4
	.align 2, 0
_080F1BF4: .4byte gUnknown_083DFEC4
_080F1BF8: .4byte 0x00000306
_080F1BFC:
	cmp r0, 0x2
	beq _080F1C12
	b _080F1DC4
_080F1C02:
	mov r0, r9
	bl sub_80F2458
	b _080F1DC8
_080F1C0A:
	mov r0, r9
	bl sub_80F2514
	b _080F1DC8
_080F1C12:
	mov r4, r9
	cmp r4, 0x1
	beq _080F1C40
	cmp r4, 0x1
	bgt _080F1C22
	cmp r4, 0
	beq _080F1C2A
	b _080F1DC4
_080F1C22:
	mov r5, r9
	cmp r5, 0x2
	beq _080F1C54
	b _080F1DC4
_080F1C2A:
	movs r0, 0x2A
	str r0, [sp, 0x4]
	movs r1, 0x14
	str r1, [sp, 0x8]
	ldr r4, _080F1C3C @ =0x0000030e
	adds r1, r2, r4
	movs r0, 0x5
	b _080F1C62
	.align 2, 0
_080F1C3C: .4byte 0x0000030e
_080F1C40:
	movs r5, 0x38
	str r5, [sp, 0x4]
	movs r0, 0x14
	str r0, [sp, 0x8]
	ldr r4, _080F1C50 @ =0x0000030e
	adds r1, r2, r4
	movs r0, 0x3
	b _080F1C62
	.align 2, 0
_080F1C50: .4byte 0x0000030e
_080F1C54:
	movs r5, 0x28
	str r5, [sp, 0x4]
	movs r0, 0x10
	str r0, [sp, 0x8]
	ldr r4, _080F1CDC @ =0x0000030e
	adds r1, r2, r4
	movs r0, 0x6
_080F1C62:
	strb r0, [r1]
	movs r5, 0
	str r5, [sp]
	mov r8, r5
	adds r1, r3, 0
	ldr r0, [r1]
	ldr r2, _080F1CDC @ =0x0000030e
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r8, r0
	blt _080F1C7E
	b _080F1DC8
_080F1C7E:
	ldr r4, [sp, 0x8]
	mov r3, r8
	muls r3, r4
	ldr r5, [sp, 0x4]
	adds r0, r5, r3
	subs r0, 0x8
	lsls r0, 16
	lsrs r0, 16
	ldr r4, [r1]
	mov r2, r8
	lsls r1, r2, 1
	movs r5, 0xC5
	lsls r5, 2
	adds r2, r4, r5
	adds r2, r1
	lsls r1, r0, 8
	adds r0, 0x11
	orrs r1, r0
	strh r1, [r2]
	mov r0, r9
	cmp r0, 0
	bne _080F1CF2
	ldr r1, _080F1CE0 @ =0x00006db2
	adds r0, r4, r1
	mov r2, r8
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	bne _080F1CE8
	movs r5, 0
	ldr r0, _080F1CE4 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	lsls r2, 4
	movs r3, 0xC8
	lsls r3, 2
	adds r1, r0, r3
	movs r3, 0
_080F1CC8:
	lsls r0, r5, 2
	adds r0, r2
	adds r0, r1, r0
	str r3, [r0]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _080F1CC8
	b _080F1D92
	.align 2, 0
_080F1CDC: .4byte 0x0000030e
_080F1CE0: .4byte 0x00006db2
_080F1CE4: .4byte gUnknown_083DFEC4
_080F1CE8:
	ldrb r0, [r1]
	subs r0, 0x1
	lsls r0, 18
	lsrs r0, 16
	str r0, [sp]
_080F1CF2:
	movs r5, 0
	ldr r4, [sp, 0x4]
	adds r0, r4, r3
	lsls r0, 16
	mov r10, r0
_080F1CFC:
	lsls r6, r5, 5
	movs r0, 0x80
	lsls r0, 1
	adds r7, r6, r0
	lsls r1, r7, 16
	asrs r1, 16
	ldr r0, _080F1DB4 @ =gSpriteTemplate_83E4454
	mov r3, r10
	asrs r2, r3, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	beq _080F1DC4
	ldr r0, _080F1DB8 @ =gUnknown_083DFEC4
	ldr r2, [r0]
	lsls r1, r5, 2
	mov r4, r8
	lsls r0, r4, 4
	adds r1, r0
	movs r0, 0xC8
	lsls r0, 2
	adds r2, r0
	adds r4, r2, r1
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	ldr r1, _080F1DBC @ =gSprites
	adds r0, r1
	str r0, [r4]
	mov r1, r8
	strh r1, [r0, 0x2E]
	ldr r0, [r4]
	strh r5, [r0, 0x30]
	ldr r1, [r4]
	adds r0, r6, 0
	adds r0, 0x98
	strh r0, [r1, 0x32]
	ldr r0, [r4]
	strh r7, [r0, 0x34]
	ldr r0, [r4]
	ldr r1, [sp]
	adds r2, r1, 0x1
	lsls r2, 16
	lsrs r2, 16
	str r2, [sp]
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnim
	mov r2, r9
	cmp r2, 0x2
	beq _080F1D6E
	cmp r2, 0
	bne _080F1D88
_080F1D6E:
	mov r3, r8
	cmp r3, 0x2
	bls _080F1D88
	movs r0, 0x1
	bl IndexOfSpritePaletteTag
	ldr r3, [r4]
	lsls r0, 4
	ldrb r2, [r3, 0x5]
	movs r1, 0xF
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x5]
_080F1D88:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _080F1CFC
_080F1D92:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r1, _080F1DB8 @ =gUnknown_083DFEC4
	ldr r0, [r1]
	ldr r4, _080F1DC0 @ =0x0000030e
	adds r0, r4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r8, r0
	bge _080F1DB0
	b _080F1C7E
_080F1DB0:
	b _080F1DC8
	.align 2, 0
_080F1DB4: .4byte gSpriteTemplate_83E4454
_080F1DB8: .4byte gUnknown_083DFEC4
_080F1DBC: .4byte gSprites
_080F1DC0: .4byte 0x0000030e
_080F1DC4:
	movs r0, 0
	b _080F1DD8
_080F1DC8:
	ldr r0, _080F1DE8 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r5, _080F1DEC @ =0x00000306
	adds r1, r5
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x1
_080F1DD8:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080F1DE8: .4byte gUnknown_083DFEC4
_080F1DEC: .4byte 0x00000306
	thumb_func_end sub_80F1BC8

	thumb_func_start sub_80F1DF0
sub_80F1DF0: @ 80F1DF0
	push {r4-r6,lr}
	movs r2, 0
	ldr r0, _080F1E44 @ =gUnknown_083DFEC4
	ldr r3, [r0]
	ldr r0, _080F1E48 @ =0x0000030e
	adds r1, r3, r0
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	bge _080F1E38
	movs r0, 0xC8
	lsls r0, 2
	adds r4, r3, r0
	adds r6, r1, 0
	ldr r5, _080F1E4C @ =sub_80F2218
_080F1E0E:
	movs r1, 0
	adds r3, r2, 0x1
	lsls r2, 4
_080F1E14:
	lsls r0, r1, 2
	adds r0, r2
	adds r0, r4, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _080F1E22
	str r5, [r0, 0x1C]
_080F1E22:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x3
	bls _080F1E14
	lsls r0, r3, 16
	lsrs r2, r0, 16
	movs r0, 0
	ldrsb r0, [r6, r0]
	cmp r2, r0
	blt _080F1E0E
_080F1E38:
	movs r0, 0x6
	bl PlaySE
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F1E44: .4byte gUnknown_083DFEC4
_080F1E48: .4byte 0x0000030e
_080F1E4C: .4byte sub_80F2218
	thumb_func_end sub_80F1DF0

	thumb_func_start sub_80F1E50
sub_80F1E50: @ 80F1E50
	push {lr}
	bl sub_80F22F8
	lsls r0, 24
	cmp r0, 0
	bne _080F1E60
	movs r0, 0x1
	b _080F1E66
_080F1E60:
	bl sub_80F2108
	movs r0, 0
_080F1E66:
	pop {r1}
	bx r1
	thumb_func_end sub_80F1E50

	thumb_func_start sub_80F1E6C
sub_80F1E6C: @ 80F1E6C
	push {lr}
	bl sub_80F22F8
	movs r1, 0
	lsls r0, 24
	cmp r0, 0
	bne _080F1E7C
	movs r1, 0x1
_080F1E7C:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80F1E6C

	thumb_func_start sub_80F1E84
sub_80F1E84: @ 80F1E84
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r5, _080F1EFC @ =gUnknown_083DFEC4
	ldr r4, [r5]
	ldr r1, _080F1F00 @ =0x0000030f
	adds r0, r4, r1
	movs r1, 0
	strb r1, [r0]
	bl sub_80F2148
	movs r2, 0
	ldr r3, _080F1F04 @ =0x0000030e
	adds r1, r4, r3
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	bge _080F1EF2
	ldr r0, _080F1F08 @ =0x00006dad
	adds r7, r4, r0
	adds r6, r1, 0
	mov r8, r5
	ldr r1, _080F1F0C @ =sub_80F2240
	mov r12, r1
_080F1EB4:
	movs r0, 0
	ldrsb r0, [r7, r0]
	adds r5, r2, 0x1
	cmp r2, r0
	beq _080F1EE6
	movs r1, 0
	mov r3, r8
	ldr r0, [r3]
	lsls r3, r2, 4
	movs r4, 0xC8
	lsls r4, 2
	adds r2, r0, r4
	mov r4, r12
_080F1ECE:
	lsls r0, r1, 2
	adds r0, r3
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _080F1EDC
	str r4, [r0, 0x1C]
_080F1EDC:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x3
	bls _080F1ECE
_080F1EE6:
	lsls r0, r5, 16
	lsrs r2, r0, 16
	movs r0, 0
	ldrsb r0, [r6, r0]
	cmp r2, r0
	blt _080F1EB4
_080F1EF2:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F1EFC: .4byte gUnknown_083DFEC4
_080F1F00: .4byte 0x0000030f
_080F1F04: .4byte 0x0000030e
_080F1F08: .4byte 0x00006dad
_080F1F0C: .4byte sub_80F2240
	thumb_func_end sub_80F1E84

	thumb_func_start sub_80F1F10
sub_80F1F10: @ 80F1F10
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _080F1F2C @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r1, _080F1F30 @ =0x0000030f
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F1F34
	cmp r0, 0x1
	beq _080F1FC0
	b _080F1FE4
	.align 2, 0
_080F1F2C: .4byte gUnknown_083DFEC4
_080F1F30: .4byte 0x0000030f
_080F1F34:
	bl sub_80F2360
	lsls r0, 24
	cmp r0, 0
	beq _080F1FE4
	movs r6, 0
	adds r7, r4, 0
	movs r0, 0xC8
	lsls r0, 2
	adds r0, r7
	mov r8, r0
_080F1F4A:
	lsls r5, r6, 2
	ldr r1, _080F1FAC @ =0x00006dad
	adds r0, r7, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 4
	adds r0, r5, r0
	add r0, r8
	ldr r4, [r0]
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _080F1FB0 @ =gSpriteAffineAnimTable_83E4450
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	subs r5, 0x6
	strh r5, [r4, 0x36]
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r4, 0x36]
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	lsls r0, 3
	strh r0, [r4, 0x38]
	ldr r0, _080F1FB4 @ =sub_80F2240
	str r0, [r4, 0x1C]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bls _080F1F4A
	bl sub_80F2170
	ldr r0, _080F1FB8 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F1FBC @ =0x0000030f
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080F1FE4
	.align 2, 0
_080F1FAC: .4byte 0x00006dad
_080F1FB0: .4byte gSpriteAffineAnimTable_83E4450
_080F1FB4: .4byte sub_80F2240
_080F1FB8: .4byte gUnknown_083DFEC4
_080F1FBC: .4byte 0x0000030f
_080F1FC0:
	bl sub_80F23C8
	lsls r0, 24
	cmp r0, 0
	beq _080F1FE4
	bl sub_80F21F8
	movs r0, 0
	bl FreeSpriteTilesByTag
	movs r0, 0
	bl FreeSpritePaletteByTag
	movs r0, 0x1
	bl FreeSpritePaletteByTag
	movs r0, 0
	b _080F1FE6
_080F1FE4:
	movs r0, 0x1
_080F1FE6:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80F1F10

	thumb_func_start sub_80F1FF0
sub_80F1FF0: @ 80F1FF0
	push {r4,lr}
	ldr r0, _080F203C @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r1, _080F2040 @ =0x00000311
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080F2058
	ldr r2, _080F2044 @ =REG_WIN0V
	ldr r3, _080F2048 @ =0x00006dad
	adds r0, r4, r3
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r1, 1
	movs r3, 0xC5
	lsls r3, 2
	adds r0, r4, r3
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r3, _080F204C @ =REG_BLDY
	ldr r1, _080F2050 @ =gSineTable
	ldr r0, _080F2054 @ =0x00000312
	adds r2, r4, r0
	ldrh r0, [r2]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 21
	strh r0, [r3]
	ldrh r0, [r2]
	adds r0, 0x3
	movs r1, 0x7F
	ands r0, r1
	strh r0, [r2]
	b _080F2078
	.align 2, 0
_080F203C: .4byte gUnknown_083DFEC4
_080F2040: .4byte 0x00000311
_080F2044: .4byte REG_WIN0V
_080F2048: .4byte 0x00006dad
_080F204C: .4byte REG_BLDY
_080F2050: .4byte gSineTable
_080F2054: .4byte 0x00000312
_080F2058:
	cmp r0, 0x2
	bne _080F2078
	ldr r2, _080F2080 @ =REG_BLDALPHA
	ldr r1, _080F2084 @ =gUnknown_083E42F8
	ldr r0, _080F2088 @ =0x00000312
	adds r3, r4, r0
	ldrh r0, [r3]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrh r0, [r3]
	cmp r0, 0xE
	bhi _080F2078
	adds r0, 0x1
	strh r0, [r3]
_080F2078:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F2080: .4byte REG_BLDALPHA
_080F2084: .4byte gUnknown_083E42F8
_080F2088: .4byte 0x00000312
	thumb_func_end sub_80F1FF0

	thumb_func_start sub_80F208C
sub_80F208C: @ 80F208C
	push {lr}
	bl sub_80F2148
	pop {r0}
	bx r0
	thumb_func_end sub_80F208C

	thumb_func_start sub_80F2098
sub_80F2098: @ 80F2098
	ldr r1, _080F20DC @ =REG_WIN0H
	ldr r2, _080F20E0 @ =0x000077f0
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _080F20E4 @ =REG_WIN0V
	ldr r0, _080F20E8 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r3, _080F20EC @ =0x00006dad
	adds r0, r1, r3
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 1
	movs r3, 0xC5
	lsls r3, 2
	adds r1, r3
	adds r1, r0
	ldrh r0, [r1]
	strh r0, [r2]
	ldr r1, _080F20F0 @ =REG_WININ
	movs r0, 0x3F
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x1F
	strh r0, [r1]
	subs r2, 0x44
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 6
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_080F20DC: .4byte REG_WIN0H
_080F20E0: .4byte 0x000077f0
_080F20E4: .4byte REG_WIN0V
_080F20E8: .4byte gUnknown_083DFEC4
_080F20EC: .4byte 0x00006dad
_080F20F0: .4byte REG_WININ
	thumb_func_end sub_80F2098

	thumb_func_start sub_80F20F4
sub_80F20F4: @ 80F20F4
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _080F2104 @ =0x0000dfff
	ands r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_080F2104: .4byte 0x0000dfff
	thumb_func_end sub_80F20F4

	thumb_func_start sub_80F2108
sub_80F2108: @ 80F2108
	push {lr}
	ldr r0, _080F2134 @ =gUnknown_083DFEC4
	ldr r3, [r0]
	ldr r0, _080F2138 @ =0x00000311
	adds r1, r3, r0
	ldrb r2, [r1]
	cmp r2, 0
	bne _080F2130
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _080F213C @ =0x00000312
	adds r0, r3, r1
	strh r2, [r0]
	ldr r1, _080F2140 @ =REG_BLDCNT
	movs r0, 0x90
	strh r0, [r1]
	ldr r0, _080F2144 @ =REG_BLDY
	strh r2, [r0]
	bl sub_80F2098
_080F2130:
	pop {r0}
	bx r0
	.align 2, 0
_080F2134: .4byte gUnknown_083DFEC4
_080F2138: .4byte 0x00000311
_080F213C: .4byte 0x00000312
_080F2140: .4byte REG_BLDCNT
_080F2144: .4byte REG_BLDY
	thumb_func_end sub_80F2108

	thumb_func_start sub_80F2148
sub_80F2148: @ 80F2148
	push {lr}
	ldr r0, _080F2164 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F2168 @ =0x00000311
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080F216C @ =REG_BLDCNT
	strh r1, [r0]
	bl sub_80F20F4
	pop {r0}
	bx r0
	.align 2, 0
_080F2164: .4byte gUnknown_083DFEC4
_080F2168: .4byte 0x00000311
_080F216C: .4byte REG_BLDCNT
	thumb_func_end sub_80F2148

	thumb_func_start sub_80F2170
sub_80F2170: @ 80F2170
	push {r4-r7,lr}
	ldr r7, _080F21E4 @ =gUnknown_083DFEC4
	ldr r4, [r7]
	ldr r1, _080F21E8 @ =0x00000311
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F21DC
	bl sub_80F20F4
	movs r3, 0
	ldr r2, _080F21EC @ =0x00006dad
	adds r5, r4, r2
	movs r0, 0xC8
	lsls r0, 2
	adds r4, r0
	movs r1, 0xD
	negs r1, r1
	mov r12, r1
	movs r6, 0x4
_080F2198:
	lsls r1, r3, 2
	movs r0, 0
	ldrsb r0, [r5, r0]
	lsls r0, 4
	adds r1, r0
	adds r1, r4, r1
	ldr r2, [r1]
	ldrb r1, [r2, 0x1]
	mov r0, r12
	ands r0, r1
	orrs r0, r6
	strb r0, [r2, 0x1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3
	bls _080F2198
	ldr r1, [r7]
	ldr r0, _080F21E8 @ =0x00000311
	adds r2, r1, r0
	movs r3, 0
	movs r0, 0x2
	strb r0, [r2]
	ldr r2, _080F21F0 @ =0x00000312
	adds r1, r2
	strh r3, [r1]
	ldr r1, _080F21F4 @ =REG_BLDCNT
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x10
	strh r0, [r1]
_080F21DC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F21E4: .4byte gUnknown_083DFEC4
_080F21E8: .4byte 0x00000311
_080F21EC: .4byte 0x00006dad
_080F21F0: .4byte 0x00000312
_080F21F4: .4byte REG_BLDCNT
	thumb_func_end sub_80F2170

	thumb_func_start sub_80F21F8
sub_80F21F8: @ 80F21F8
	ldr r0, _080F220C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F2210 @ =0x00000311
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080F2214 @ =REG_BLDCNT
	strh r1, [r0]
	bx lr
	.align 2, 0
_080F220C: .4byte gUnknown_083DFEC4
_080F2210: .4byte 0x00000311
_080F2214: .4byte REG_BLDCNT
	thumb_func_end sub_80F21F8

	thumb_func_start sub_80F2218
sub_80F2218: @ 80F2218
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x20]
	subs r0, 0x8
	strh r0, [r2, 0x20]
	lsls r0, 16
	asrs r0, 16
	ldrh r3, [r2, 0x32]
	movs r4, 0x32
	ldrsh r1, [r2, r4]
	cmp r0, r1
	bgt _080F2236
	strh r3, [r2, 0x20]
	ldr r0, _080F223C @ =sub_80F22B0
	str r0, [r2, 0x1C]
_080F2236:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F223C: .4byte sub_80F22B0
	thumb_func_end sub_80F2218

	thumb_func_start sub_80F2240
sub_80F2240: @ 80F2240
	push {r4,lr}
	adds r2, r0, 0
	ldr r0, _080F2288 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F228C @ =0x00006dad
	adds r0, r1
	movs r3, 0x2E
	ldrsh r1, [r2, r3]
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r1, r0
	bne _080F2290
	ldrh r3, [r2, 0x38]
	movs r4, 0x38
	ldrsh r0, [r2, r4]
	cmp r0, 0
	beq _080F2270
	ldrh r0, [r2, 0x36]
	ldrh r4, [r2, 0x20]
	adds r1, r0, r4
	strh r1, [r2, 0x20]
	subs r0, r3, r0
	strh r0, [r2, 0x38]
_080F2270:
	adds r0, r2, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080F22A8
	adds r0, r2, 0
	bl sub_80F240C
	b _080F22A8
	.align 2, 0
_080F2288: .4byte gUnknown_083DFEC4
_080F228C: .4byte 0x00006dad
_080F2290:
	ldrh r0, [r2, 0x20]
	adds r0, 0x8
	strh r0, [r2, 0x20]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x34
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _080F22A8
	adds r0, r2, 0
	bl sub_80F240C
_080F22A8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80F2240

	thumb_func_start sub_80F22B0
sub_80F22B0: @ 80F22B0
	push {lr}
	adds r2, r0, 0
	ldr r0, _080F22DC @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F22E0 @ =0x00006dad
	adds r0, r1
	movs r3, 0x2E
	ldrsh r1, [r2, r3]
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r1, r0
	bne _080F22E4
	ldrh r3, [r2, 0x24]
	movs r0, 0x24
	ldrsh r1, [r2, r0]
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	ble _080F22F2
	subs r0, r3, 0x4
	b _080F22F0
	.align 2, 0
_080F22DC: .4byte gUnknown_083DFEC4
_080F22E0: .4byte 0x00006dad
_080F22E4:
	ldrh r1, [r2, 0x24]
	movs r3, 0x24
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bge _080F22F2
	adds r0, r1, 0x4
_080F22F0:
	strh r0, [r2, 0x24]
_080F22F2:
	pop {r0}
	bx r0
	thumb_func_end sub_80F22B0

	thumb_func_start sub_80F22F8
sub_80F22F8: @ 80F22F8
	push {r4-r7,lr}
	movs r3, 0
	ldr r0, _080F233C @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _080F2340 @ =0x00006dae
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r3, r0
	bge _080F2358
	movs r7, 0xC8
	lsls r7, 2
	adds r4, r1, r7
	movs r5, 0x10
	negs r5, r5
	adds r6, r0, 0
_080F231A:
	movs r1, 0
	lsls r2, r3, 4
_080F231E:
	lsls r0, r1, 2
	adds r0, r2
	adds r0, r4, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _080F2358
	movs r7, 0x24
	ldrsh r0, [r0, r7]
	cmp r0, 0
	beq _080F2344
	cmp r0, r5
	beq _080F2344
	movs r0, 0
	b _080F235A
	.align 2, 0
_080F233C: .4byte gUnknown_083DFEC4
_080F2340: .4byte 0x00006dae
_080F2344:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x3
	bls _080F231E
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r6
	blt _080F231A
_080F2358:
	movs r0, 0x1
_080F235A:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80F22F8

	thumb_func_start sub_80F2360
sub_80F2360: @ 80F2360
	push {r4-r7,lr}
	movs r4, 0
	ldr r0, _080F23A0 @ =gUnknown_083DFEC4
	ldr r2, [r0]
	ldr r1, _080F23A4 @ =0x0000030e
	adds r0, r2, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	cmp r4, r1
	bge _080F23C0
	ldr r3, _080F23A8 @ =0x00006dad
	adds r0, r2, r3
	movs r6, 0
	ldrsb r6, [r0, r6]
	adds r5, r1, 0
_080F237E:
	cmp r4, r6
	beq _080F23B6
	movs r1, 0
	ldr r0, _080F23A0 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	lsls r3, r4, 4
	movs r7, 0xC8
	lsls r7, 2
	adds r2, r0, r7
_080F2390:
	lsls r0, r1, 2
	adds r0, r3
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _080F23AC
	movs r0, 0
	b _080F23C2
	.align 2, 0
_080F23A0: .4byte gUnknown_083DFEC4
_080F23A4: .4byte 0x0000030e
_080F23A8: .4byte 0x00006dad
_080F23AC:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x3
	bls _080F2390
_080F23B6:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r5
	blt _080F237E
_080F23C0:
	movs r0, 0x1
_080F23C2:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80F2360

	thumb_func_start sub_80F23C8
sub_80F23C8: @ 80F23C8
	push {lr}
	movs r2, 0
	ldr r0, _080F23F4 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r3, _080F23F8 @ =0x00006dad
	adds r0, r1, r3
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r3, r0, 4
	movs r0, 0xC8
	lsls r0, 2
	adds r1, r0
_080F23E2:
	lsls r0, r2, 2
	adds r0, r3
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _080F23FC
	movs r0, 0
	b _080F2408
	.align 2, 0
_080F23F4: .4byte gUnknown_083DFEC4
_080F23F8: .4byte 0x00006dad
_080F23FC:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x3
	bls _080F23E2
	movs r0, 0x1
_080F2408:
	pop {r1}
	bx r1
	thumb_func_end sub_80F23C8

	thumb_func_start sub_80F240C
sub_80F240C: @ 80F240C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080F2454 @ =gUnknown_083DFEC4
	ldr r2, [r0]
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	lsls r1, 2
	movs r3, 0x2E
	ldrsh r0, [r4, r3]
	lsls r0, 4
	adds r1, r0
	movs r0, 0xC8
	lsls r0, 2
	adds r2, r0
	adds r2, r1
	movs r0, 0
	str r0, [r2]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080F2446
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
_080F2446:
	adds r0, r4, 0
	bl DestroySprite
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F2454: .4byte gUnknown_083DFEC4
	thumb_func_end sub_80F240C

	thumb_func_start sub_80F2458
sub_80F2458: @ 80F2458
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	beq _080F24A0
	cmp r4, 0x1
	bgt _080F246C
	cmp r4, 0
	beq _080F2472
	b _080F2502
_080F246C:
	cmp r4, 0x2
	beq _080F24D0
	b _080F2502
_080F2472:
	ldr r2, _080F2498 @ =gUnknown_083DFEC4
	ldr r3, [r2]
	movs r0, 0xE0
	lsls r0, 2
	adds r1, r3, r0
	movs r5, 0xE2
	lsls r5, 2
	adds r0, r3, r5
	str r0, [r1]
	movs r0, 0xE1
	lsls r0, 2
	adds r1, r3, r0
	movs r0, 0xA0
	lsls r0, 5
	strh r0, [r1]
	ldr r1, _080F249C @ =0x00000386
	adds r0, r3, r1
	strh r4, [r0]
	b _080F24F6
	.align 2, 0
_080F2498: .4byte gUnknown_083DFEC4
_080F249C: .4byte 0x00000386
_080F24A0:
	ldr r4, _080F24C4 @ =gUnknown_083DFEC4
	ldr r1, [r4]
	movs r3, 0xE0
	lsls r3, 2
	adds r2, r1, r3
	ldr r5, _080F24C8 @ =0x00001788
	adds r0, r1, r5
	str r0, [r2]
	movs r0, 0xE1
	lsls r0, 2
	adds r2, r1, r0
	movs r3, 0
	movs r0, 0xC0
	lsls r0, 4
	strh r0, [r2]
	ldr r5, _080F24CC @ =0x00000386
	adds r1, r5
	b _080F24F2
	.align 2, 0
_080F24C4: .4byte gUnknown_083DFEC4
_080F24C8: .4byte 0x00001788
_080F24CC: .4byte 0x00000386
_080F24D0:
	ldr r4, _080F2508 @ =gUnknown_083DFEC4
	ldr r1, [r4]
	movs r0, 0xE0
	lsls r0, 2
	adds r2, r1, r0
	ldr r3, _080F250C @ =0x00002388
	adds r0, r1, r3
	str r0, [r2]
	movs r5, 0xE1
	lsls r5, 2
	adds r2, r1, r5
	movs r3, 0
	movs r0, 0xC0
	lsls r0, 5
	strh r0, [r2]
	ldr r0, _080F2510 @ =0x00000386
	adds r1, r0
_080F24F2:
	strh r3, [r1]
	adds r2, r4, 0
_080F24F6:
	ldr r0, [r2]
	movs r1, 0xE0
	lsls r1, 2
	adds r0, r1
	bl LoadSpriteSheet
_080F2502:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F2508: .4byte gUnknown_083DFEC4
_080F250C: .4byte 0x00002388
_080F2510: .4byte 0x00000386
	thumb_func_end sub_80F2458

	thumb_func_start sub_80F2514
sub_80F2514: @ 80F2514
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x1
	beq _080F2558
	cmp r0, 0x1
	bgt _080F252C
	cmp r0, 0
	beq _080F2532
	b _080F2586
_080F252C:
	cmp r1, 0x2
	beq _080F2568
	b _080F2586
_080F2532:
	ldr r0, _080F254C @ =gPokenavMenuOptions1_Pal
	str r0, [sp]
	ldr r1, _080F2550 @ =0xffff0000
	mov r4, sp
	ldr r0, [sp, 0x4]
	ands r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpritePalette
	ldr r0, _080F2554 @ =gPokenavMenuOptions2_Pal
	b _080F257A
	.align 2, 0
_080F254C: .4byte gPokenavMenuOptions1_Pal
_080F2550: .4byte 0xffff0000
_080F2554: .4byte gPokenavMenuOptions2_Pal
_080F2558:
	ldr r0, _080F2564 @ =gPokenavConditionMenu_Pal
	str r0, [sp]
	mov r1, sp
	movs r0, 0
	strh r0, [r1, 0x4]
	b _080F2580
	.align 2, 0
_080F2564: .4byte gPokenavConditionMenu_Pal
_080F2568:
	ldr r0, _080F2590 @ =gPokenavCondition6_Pal
	str r0, [sp]
	mov r4, sp
	movs r0, 0
	strh r0, [r4, 0x4]
	mov r0, sp
	bl LoadSpritePalette
	ldr r0, _080F2594 @ =gPokenavCondition7_Pal
_080F257A:
	str r0, [sp]
	movs r0, 0x1
	strh r0, [r4, 0x4]
_080F2580:
	mov r0, sp
	bl LoadSpritePalette
_080F2586:
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F2590: .4byte gPokenavCondition6_Pal
_080F2594: .4byte gPokenavCondition7_Pal
	thumb_func_end sub_80F2514

	thumb_func_start sub_80F2598
sub_80F2598: @ 80F2598
	push {r4,lr}
	ldr r0, _080F25F0 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F25F4 @ =0x00006d9c
	adds r4, r0, r1
	movs r0, 0
	str r0, [r4]
	ldr r1, _080F25F8 @ =gSaveBlock1
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl sub_8082C0C
	cmp r0, 0x1
	bne _080F2618
	ldr r0, _080F25FC @ =gSpriteSheet_PokenavBlueLight
	bl LoadSpriteSheet
	ldr r0, _080F2600 @ =gSpritePalette_PokenavBlueLight
	bl LoadSpritePalette
	ldr r0, _080F2604 @ =gSpriteTemplate_83E4484
	movs r1, 0xC
	movs r2, 0x60
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080F260C
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F2608 @ =gSprites
	adds r0, r1
	str r0, [r4]
	b _080F2618
	.align 2, 0
_080F25F0: .4byte gUnknown_083DFEC4
_080F25F4: .4byte 0x00006d9c
_080F25F8: .4byte gSaveBlock1
_080F25FC: .4byte gSpriteSheet_PokenavBlueLight
_080F2600: .4byte gSpritePalette_PokenavBlueLight
_080F2604: .4byte gSpriteTemplate_83E4484
_080F2608: .4byte gSprites
_080F260C:
	movs r0, 0x19
	bl FreeSpriteTilesByTag
	movs r0, 0x11
	bl FreeSpritePaletteByTag
_080F2618:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80F2598

	thumb_func_start sub_80F2620
sub_80F2620: @ 80F2620
	push {r4,lr}
	ldr r0, _080F264C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F2650 @ =0x00006d9c
	adds r4, r0, r1
	ldr r0, [r4]
	cmp r0, 0
	beq _080F2644
	bl DestroySprite
	movs r0, 0x19
	bl FreeSpriteTilesByTag
	movs r0, 0x11
	bl FreeSpritePaletteByTag
	movs r0, 0
	str r0, [r4]
_080F2644:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F264C: .4byte gUnknown_083DFEC4
_080F2650: .4byte 0x00006d9c
	thumb_func_end sub_80F2620

	thumb_func_start sub_80F2654
sub_80F2654: @ 80F2654
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	ble _080F2682
	movs r0, 0
	strh r0, [r3, 0x2E]
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
_080F2682:
	pop {r0}
	bx r0
	thumb_func_end sub_80F2654

	thumb_func_start sub_80F2688
sub_80F2688: @ 80F2688
	push {lr}
	ldr r0, _080F26B0 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F26B4 @ =0x00000306
	adds r2, r0, r1
	movs r1, 0
	strh r1, [r2]
	ldr r1, _080F26B8 @ =0x00006dac
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F26AA
_080F26A0:
	bl sub_80F26BC
	lsls r0, 24
	cmp r0, 0
	bne _080F26A0
_080F26AA:
	pop {r0}
	bx r0
	.align 2, 0
_080F26B0: .4byte gUnknown_083DFEC4
_080F26B4: .4byte 0x00000306
_080F26B8: .4byte 0x00006dac
	thumb_func_end sub_80F2688

	thumb_func_start sub_80F26BC
sub_80F26BC: @ 80F26BC
	push {lr}
	ldr r0, _080F26D8 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F26DC @ =0x00000306
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0x7
	bls _080F26CE
	b _080F27BC
_080F26CE:
	lsls r0, 2
	ldr r1, _080F26E0 @ =_080F26E4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F26D8: .4byte gUnknown_083DFEC4
_080F26DC: .4byte 0x00000306
_080F26E0: .4byte _080F26E4
	.align 2, 0
_080F26E4:
	.4byte _080F2704
	.4byte _080F271C
	.4byte _080F2734
	.4byte _080F274C
	.4byte _080F2764
	.4byte _080F277C
	.4byte _080F2794
	.4byte _080F27B0
_080F2704:
	ldr r0, _080F2710 @ =gPokenavMainMenu_Gfx
	ldr r1, _080F2714 @ =gUnknown_083DFEC4
	ldr r1, [r1]
	ldr r2, _080F2718 @ =0x00003b98
	b _080F279C
	.align 2, 0
_080F2710: .4byte gPokenavMainMenu_Gfx
_080F2714: .4byte gUnknown_083DFEC4
_080F2718: .4byte 0x00003b98
_080F271C:
	ldr r0, _080F2728 @ =gPokenavConditionMenuHeader_Gfx
	ldr r1, _080F272C @ =gUnknown_083DFEC4
	ldr r1, [r1]
	ldr r2, _080F2730 @ =0x00004198
	b _080F279C
	.align 2, 0
_080F2728: .4byte gPokenavConditionMenuHeader_Gfx
_080F272C: .4byte gUnknown_083DFEC4
_080F2730: .4byte 0x00004198
_080F2734:
	ldr r0, _080F2740 @ =gPokenavRibbonsHeader_Gfx
	ldr r1, _080F2744 @ =gUnknown_083DFEC4
	ldr r1, [r1]
	ldr r2, _080F2748 @ =0x00004d98
	b _080F279C
	.align 2, 0
_080F2740: .4byte gPokenavRibbonsHeader_Gfx
_080F2744: .4byte gUnknown_083DFEC4
_080F2748: .4byte 0x00004d98
_080F274C:
	ldr r0, _080F2758 @ =gPokenavHoennMapHeader_Gfx
	ldr r1, _080F275C @ =gUnknown_083DFEC4
	ldr r1, [r1]
	ldr r2, _080F2760 @ =0x00005398
	b _080F279C
	.align 2, 0
_080F2758: .4byte gPokenavHoennMapHeader_Gfx
_080F275C: .4byte gUnknown_083DFEC4
_080F2760: .4byte 0x00005398
_080F2764:
	ldr r0, _080F2770 @ =gPokenavConditionMenuOptions_Gfx
	ldr r1, _080F2774 @ =gUnknown_083DFEC4
	ldr r1, [r1]
	ldr r2, _080F2778 @ =0x00005f98
	b _080F279C
	.align 2, 0
_080F2770: .4byte gPokenavConditionMenuOptions_Gfx
_080F2774: .4byte gUnknown_083DFEC4
_080F2778: .4byte 0x00005f98
_080F277C:
	ldr r0, _080F2788 @ =gPokenavConditionMenuOptions2_Gfx
	ldr r1, _080F278C @ =gUnknown_083DFEC4
	ldr r1, [r1]
	ldr r2, _080F2790 @ =0x00006798
	b _080F279C
	.align 2, 0
_080F2788: .4byte gPokenavConditionMenuOptions2_Gfx
_080F278C: .4byte gUnknown_083DFEC4
_080F2790: .4byte 0x00006798
_080F2794:
	ldr r0, _080F27A4 @ =gPokenavTrainersEyesHeader_Gfx
	ldr r1, _080F27A8 @ =gUnknown_083DFEC4
	ldr r1, [r1]
	ldr r2, _080F27AC @ =0x00004798
_080F279C:
	adds r1, r2
	bl LZ77UnCompWram
	b _080F27C0
	.align 2, 0
_080F27A4: .4byte gPokenavTrainersEyesHeader_Gfx
_080F27A8: .4byte gUnknown_083DFEC4
_080F27AC: .4byte 0x00004798
_080F27B0:
	ldr r0, _080F27B8 @ =gUnknown_083E449C
	bl LoadSpritePalettes
	b _080F27C0
	.align 2, 0
_080F27B8: .4byte gUnknown_083E449C
_080F27BC:
	movs r0, 0
	b _080F27D0
_080F27C0:
	ldr r0, _080F27D4 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F27D8 @ =0x00000306
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x1
_080F27D0:
	pop {r1}
	bx r1
	.align 2, 0
_080F27D4: .4byte gUnknown_083DFEC4
_080F27D8: .4byte 0x00000306
	thumb_func_end sub_80F26BC

	thumb_func_start sub_80F27DC
sub_80F27DC: @ 80F27DC
	push {lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB
	bls _080F27EA
	b _080F29A0
_080F27EA:
	lsls r0, 2
	ldr r1, _080F27F4 @ =_080F27F8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F27F4: .4byte _080F27F8
	.align 2, 0
_080F27F8:
	.4byte _080F2828
	.4byte _080F2858
	.4byte _080F28B8
	.4byte _080F2888
	.4byte _080F28E8
	.4byte _080F2918
	.4byte _080F2928
	.4byte _080F2978
	.4byte _080F2938
	.4byte _080F2948
	.4byte _080F2968
	.4byte _080F2958
_080F2828:
	ldr r0, _080F2848 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F284C @ =0x00003b98
	adds r0, r1
	str r0, [sp]
	ldr r1, _080F2850 @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 3
	orrs r0, r1
	ldr r1, _080F2854 @ =0x0000ffff
	ands r0, r1
	adds r1, 0x1
	b _080F2996
	.align 2, 0
_080F2848: .4byte gUnknown_083DFEC4
_080F284C: .4byte 0x00003b98
_080F2850: .4byte 0xffff0000
_080F2854: .4byte 0x0000ffff
_080F2858:
	ldr r0, _080F2878 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F287C @ =0x00004198
	adds r0, r1
	str r0, [sp]
	ldr r1, _080F2880 @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 3
	orrs r0, r1
	ldr r1, _080F2884 @ =0x0000ffff
	ands r0, r1
	adds r1, 0x1
	b _080F2996
	.align 2, 0
_080F2878: .4byte gUnknown_083DFEC4
_080F287C: .4byte 0x00004198
_080F2880: .4byte 0xffff0000
_080F2884: .4byte 0x0000ffff
_080F2888:
	ldr r0, _080F28A8 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F28AC @ =0x00004798
	adds r0, r1
	str r0, [sp]
	ldr r1, _080F28B0 @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 3
	orrs r0, r1
	ldr r1, _080F28B4 @ =0x0000ffff
	ands r0, r1
	adds r1, 0x1
	b _080F2996
	.align 2, 0
_080F28A8: .4byte gUnknown_083DFEC4
_080F28AC: .4byte 0x00004798
_080F28B0: .4byte 0xffff0000
_080F28B4: .4byte 0x0000ffff
_080F28B8:
	ldr r0, _080F28D8 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F28DC @ =0x00004d98
	adds r0, r1
	str r0, [sp]
	ldr r1, _080F28E0 @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 3
	orrs r0, r1
	ldr r1, _080F28E4 @ =0x0000ffff
	ands r0, r1
	adds r1, 0x1
	b _080F2996
	.align 2, 0
_080F28D8: .4byte gUnknown_083DFEC4
_080F28DC: .4byte 0x00004d98
_080F28E0: .4byte 0xffff0000
_080F28E4: .4byte 0x0000ffff
_080F28E8:
	ldr r0, _080F2908 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F290C @ =0x00005398
	adds r0, r1
	str r0, [sp]
	ldr r1, _080F2910 @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 4
	orrs r0, r1
	ldr r1, _080F2914 @ =0x0000ffff
	ands r0, r1
	adds r1, 0x1
	b _080F2996
	.align 2, 0
_080F2908: .4byte gUnknown_083DFEC4
_080F290C: .4byte 0x00005398
_080F2910: .4byte 0xffff0000
_080F2914: .4byte 0x0000ffff
_080F2918:
	ldr r0, _080F2920 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F2924 @ =0x00005f98
	b _080F297E
	.align 2, 0
_080F2920: .4byte gUnknown_083DFEC4
_080F2924: .4byte 0x00005f98
_080F2928:
	ldr r0, _080F2930 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F2934 @ =0x00006198
	b _080F297E
	.align 2, 0
_080F2930: .4byte gUnknown_083DFEC4
_080F2934: .4byte 0x00006198
_080F2938:
	ldr r0, _080F2940 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F2944 @ =0x00006398
	b _080F297E
	.align 2, 0
_080F2940: .4byte gUnknown_083DFEC4
_080F2944: .4byte 0x00006398
_080F2948:
	ldr r0, _080F2950 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F2954 @ =0x00006598
	b _080F297E
	.align 2, 0
_080F2950: .4byte gUnknown_083DFEC4
_080F2954: .4byte 0x00006598
_080F2958:
	ldr r0, _080F2960 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F2964 @ =0x00006998
	b _080F297E
	.align 2, 0
_080F2960: .4byte gUnknown_083DFEC4
_080F2964: .4byte 0x00006998
_080F2968:
	ldr r0, _080F2970 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F2974 @ =0x00006798
	b _080F297E
	.align 2, 0
_080F2970: .4byte gUnknown_083DFEC4
_080F2974: .4byte 0x00006798
_080F2978:
	ldr r0, _080F29A8 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F29AC @ =0x00006b98
_080F297E:
	adds r0, r1
	str r0, [sp]
	ldr r1, _080F29B0 @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r1
	movs r1, 0x80
	lsls r1, 2
	orrs r0, r1
	ldr r1, _080F29B4 @ =0x0000ffff
	ands r0, r1
	movs r1, 0x80
	lsls r1, 10
_080F2996:
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
_080F29A0:
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_080F29A8: .4byte gUnknown_083DFEC4
_080F29AC: .4byte 0x00006b98
_080F29B0: .4byte 0xffff0000
_080F29B4: .4byte 0x0000ffff
	thumb_func_end sub_80F27DC

	thumb_func_start sub_80F29B8
sub_80F29B8: @ 80F29B8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0
	mov r8, r0
	cmp r7, 0xB
	bls _080F29D2
	b _080F2BA6
_080F29D2:
	lsls r0, r7, 2
	ldr r1, _080F29DC @ =_080F29E0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F29DC: .4byte _080F29E0
	.align 2, 0
_080F29E0:
	.4byte _080F2A10
	.4byte _080F2A10
	.4byte _080F2A10
	.4byte _080F2A10
	.4byte _080F2A58
	.4byte _080F2A94
	.4byte _080F2A94
	.4byte _080F2A98
	.4byte _080F2A94
	.4byte _080F2A94
	.4byte _080F2A98
	.4byte _080F2A98
_080F2A10:
	ldr r3, _080F2A44 @ =0x0000ffa0
	ldr r0, _080F2A48 @ =gUnknown_083DFEC4
	ldr r2, [r0]
	movs r1, 0xC3
	lsls r1, 2
	adds r0, r2, r1
	ldrh r1, [r0]
	movs r0, 0x31
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	movs r4, 0x8
	str r4, [sp]
	movs r1, 0x20
	str r1, [sp, 0x4]
	movs r1, 0x40
	ldr r4, _080F2A4C @ =0x00003b88
	adds r4, r2
	mov r9, r4
	ldr r2, _080F2A50 @ =gSpriteTemplate_83E44F8
	mov r8, r2
	cmp r7, 0x3
	beq _080F2AC8
	ldr r4, _080F2A54 @ =gSpriteTemplate_83E44E0
	mov r8, r4
	b _080F2AC8
	.align 2, 0
_080F2A44: .4byte 0x0000ffa0
_080F2A48: .4byte gUnknown_083DFEC4
_080F2A4C: .4byte 0x00003b88
_080F2A50: .4byte gSpriteTemplate_83E44F8
_080F2A54: .4byte gSpriteTemplate_83E44E0
_080F2A58:
	movs r3, 0x88
	lsls r3, 1
	ldr r0, _080F2A84 @ =gUnknown_083DFEC4
	ldr r2, [r0]
	movs r1, 0xC3
	lsls r1, 2
	adds r0, r2, r1
	ldrh r1, [r0]
	movs r0, 0x31
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080F2A88 @ =0x0000fff8
	str r4, [sp]
	movs r1, 0x98
	str r1, [sp, 0x4]
	movs r1, 0x40
	ldr r4, _080F2A8C @ =gSpriteTemplate_83E44E0
	mov r8, r4
	ldr r4, _080F2A90 @ =0x00003b88
	b _080F2AC4
	.align 2, 0
_080F2A84: .4byte gUnknown_083DFEC4
_080F2A88: .4byte 0x0000fff8
_080F2A8C: .4byte gSpriteTemplate_83E44E0
_080F2A90: .4byte 0x00003b88
_080F2A94:
	ldr r0, _080F2B40 @ =gSpriteTemplate_83E4530
	mov r8, r0
_080F2A98:
	mov r1, r8
	cmp r1, 0
	bne _080F2AA2
	ldr r2, _080F2B44 @ =gSpriteTemplate_83E4548
	mov r8, r2
_080F2AA2:
	ldr r3, _080F2B48 @ =0x0000ffa0
	ldr r0, _080F2B4C @ =gUnknown_083DFEC4
	ldr r2, [r0]
	movs r4, 0xC3
	lsls r4, 2
	adds r0, r2, r4
	ldrh r1, [r0]
	movs r0, 0x44
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x8
	str r1, [sp]
	movs r4, 0x10
	str r4, [sp, 0x4]
	movs r1, 0x20
	ldr r4, _080F2B50 @ =0x00003b90
_080F2AC4:
	adds r4, r2
	mov r9, r4
_080F2AC8:
	movs r6, 0
	lsls r1, 16
	str r1, [sp, 0x10]
	lsls r3, 16
	str r3, [sp, 0x8]
	lsls r0, 16
	str r0, [sp, 0xC]
	ldr r0, _080F2B54 @ =gSprites
	mov r10, r0
_080F2ADA:
	ldr r1, [sp, 0x10]
	asrs r0, r1, 16
	adds r5, r6, 0
	muls r5, r0
	ldr r2, [sp, 0x8]
	asrs r1, r2, 16
	adds r1, r5
	lsls r1, 16
	asrs r1, 16
	mov r0, r8
	ldr r3, [sp, 0xC]
	asrs r2, r3, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x40
	beq _080F2B9C
	lsls r0, r4, 4
	adds r1, r0, r4
	lsls r1, 2
	mov r2, r10
	adds r3, r1, r2
	mov r1, sp
	ldrh r1, [r1]
	strh r1, [r3, 0x2E]
	ldr r2, [sp, 0x4]
	adds r1, r2, r5
	strh r1, [r3, 0x30]
	strh r6, [r3, 0x32]
	strh r7, [r3, 0x34]
	adds r5, r0, 0
	cmp r7, 0x4
	bne _080F2B5C
	cmp r6, 0x1
	bne _080F2B5C
	ldr r0, _080F2B4C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F2B58 @ =0x00006e90
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	cmp r0, 0
	bne _080F2B36
	movs r1, 0x1
_080F2B36:
	adds r0, r3, 0
	bl StartSpriteAnim
	b _080F2B6A
	.align 2, 0
_080F2B40: .4byte gSpriteTemplate_83E4530
_080F2B44: .4byte gSpriteTemplate_83E4548
_080F2B48: .4byte 0x0000ffa0
_080F2B4C: .4byte gUnknown_083DFEC4
_080F2B50: .4byte 0x00003b90
_080F2B54: .4byte gSprites
_080F2B58: .4byte 0x00006e90
_080F2B5C:
	adds r0, r5, r4
	lsls r0, 2
	add r0, r10
	lsls r1, r6, 24
	lsrs r1, 24
	bl StartSpriteAnim
_080F2B6A:
	ldr r2, _080F2BB8 @ =gSprites
	mov r12, r2
	cmp r7, 0x3
	bhi _080F2B90
	cmp r6, 0x1
	bne _080F2B90
	adds r2, r5, r4
	lsls r2, 2
	add r2, r10
	ldrb r3, [r2, 0x1]
	movs r1, 0x3F
	adds r0, r1, 0
	ands r0, r3
	strb r0, [r2, 0x1]
	ldrb r0, [r2, 0x3]
	ands r1, r0
	movs r0, 0x80
	orrs r1, r0
	strb r1, [r2, 0x3]
_080F2B90:
	lsls r1, r6, 2
	add r1, r9
	adds r0, r5, r4
	lsls r0, 2
	add r0, r12
	str r0, [r1]
_080F2B9C:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x1
	bls _080F2ADA
_080F2BA6:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F2BB8: .4byte gSprites
	thumb_func_end sub_80F29B8

	thumb_func_start sub_80F2BBC
sub_80F2BBC: @ 80F2BBC
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x20]
	ldrh r1, [r2, 0x2E]
	adds r3, r0, r1
	strh r3, [r2, 0x20]
	lsls r0, 16
	asrs r4, r0, 16
	movs r0, 0x30
	ldrsh r1, [r2, r0]
	cmp r4, r1
	bgt _080F2BE0
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, r1
	bge _080F2BE8
	cmp r4, r1
	blt _080F2C08
_080F2BE0:
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, r1
	bgt _080F2C08
_080F2BE8:
	ldrh r0, [r2, 0x30]
	strh r0, [r2, 0x20]
	movs r1, 0x34
	ldrsh r0, [r2, r1]
	cmp r0, 0x4
	bne _080F2C04
	movs r1, 0x32
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	bne _080F2C04
	ldr r0, _080F2C00 @ =sub_80F2C58
	b _080F2C06
	.align 2, 0
_080F2C00: .4byte sub_80F2C58
_080F2C04:
	ldr r0, _080F2C10 @ =SpriteCallbackDummy
_080F2C06:
	str r0, [r2, 0x1C]
_080F2C08:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F2C10: .4byte SpriteCallbackDummy
	thumb_func_end sub_80F2BBC

	thumb_func_start sub_80F2C14
sub_80F2C14: @ 80F2C14
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	ldrh r1, [r4, 0x2E]
	subs r0, r1
	strh r0, [r4, 0x20]
	adds r0, 0x20
	lsls r0, 16
	movs r1, 0x98
	lsls r1, 17
	cmp r0, r1
	bls _080F2C50
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080F2C4A
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bgt _080F2C44
	movs r0, 0x1
	bl FreeSpriteTilesByTag
	b _080F2C4A
_080F2C44:
	movs r0, 0x2
	bl FreeSpriteTilesByTag
_080F2C4A:
	adds r0, r4, 0
	bl DestroySprite
_080F2C50:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80F2C14

	thumb_func_start sub_80F2C58
sub_80F2C58: @ 80F2C58
	push {lr}
	adds r2, r0, 0
	ldr r0, _080F2C78 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F2C7C @ =0x00006e90
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	cmp r0, 0
	bne _080F2C6E
	movs r1, 0x1
_080F2C6E:
	adds r0, r2, 0
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_080F2C78: .4byte gUnknown_083DFEC4
_080F2C7C: .4byte 0x00006e90
	thumb_func_end sub_80F2C58

	thumb_func_start sub_80F2C80
sub_80F2C80: @ 80F2C80
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080F2CB0 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F2CB4 @ =0x00000306
	adds r2, r0, r1
	movs r1, 0
	strh r1, [r2]
	ldr r1, _080F2CB8 @ =0x00006dac
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F2CA8
_080F2C9C:
	adds r0, r4, 0
	bl sub_80F2CBC
	lsls r0, 24
	cmp r0, 0
	bne _080F2C9C
_080F2CA8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F2CB0: .4byte gUnknown_083DFEC4
_080F2CB4: .4byte 0x00000306
_080F2CB8: .4byte 0x00006dac
	thumb_func_end sub_80F2C80

	thumb_func_start sub_80F2CBC
sub_80F2CBC: @ 80F2CBC
	push {r4,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _080F2CD8 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080F2CDC @ =0x00000306
	adds r4, r0, r2
	ldrh r0, [r4]
	cmp r0, 0
	beq _080F2CE0
	cmp r0, 0x1
	beq _080F2CF0
	b _080F2CFC
	.align 2, 0
_080F2CD8: .4byte gUnknown_083DFEC4
_080F2CDC: .4byte 0x00000306
_080F2CE0:
	adds r0, r1, 0
	bl sub_80F27DC
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	movs r0, 0x1
	b _080F2CFE
_080F2CF0:
	adds r0, r1, 0
	bl sub_80F29B8
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_080F2CFC:
	movs r0, 0
_080F2CFE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80F2CBC

	thumb_func_start sub_80F2D04
sub_80F2D04: @ 80F2D04
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080F2D3C
	movs r1, 0
	ldr r0, _080F2D30 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r3, _080F2D34 @ =0x00003b88
	adds r2, r0, r3
	ldr r3, _080F2D38 @ =sub_80F2C14
_080F2D1A:
	lsls r0, r1, 2
	adds r0, r2, r0
	ldr r0, [r0]
	str r3, [r0, 0x1C]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x1
	bls _080F2D1A
	b _080F2D5A
	.align 2, 0
_080F2D30: .4byte gUnknown_083DFEC4
_080F2D34: .4byte 0x00003b88
_080F2D38: .4byte sub_80F2C14
_080F2D3C:
	movs r1, 0
	ldr r0, _080F2D60 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r3, _080F2D64 @ =0x00003b90
	adds r2, r0, r3
	ldr r3, _080F2D68 @ =sub_80F2C14
_080F2D48:
	lsls r0, r1, 2
	adds r0, r2, r0
	ldr r0, [r0]
	str r3, [r0, 0x1C]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x1
	bls _080F2D48
_080F2D5A:
	pop {r0}
	bx r0
	.align 2, 0
_080F2D60: .4byte gUnknown_083DFEC4
_080F2D64: .4byte 0x00003b90
_080F2D68: .4byte sub_80F2C14
	thumb_func_end sub_80F2D04

	thumb_func_start sub_80F2D6C
sub_80F2D6C: @ 80F2D6C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080F2DA4
	movs r0, 0x1
	bl FreeSpriteTilesByTag
	movs r4, 0
	ldr r0, _080F2D9C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F2DA0 @ =0x00003b88
	adds r5, r0, r1
_080F2D86:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _080F2D86
	b _080F2DC8
	.align 2, 0
_080F2D9C: .4byte gUnknown_083DFEC4
_080F2DA0: .4byte 0x00003b88
_080F2DA4:
	movs r0, 0x2
	bl FreeSpriteTilesByTag
	movs r4, 0
	ldr r0, _080F2DD0 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F2DD4 @ =0x00003b90
	adds r5, r0, r1
_080F2DB4:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _080F2DB4
_080F2DC8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F2DD0: .4byte gUnknown_083DFEC4
_080F2DD4: .4byte 0x00003b90
	thumb_func_end sub_80F2D6C

	thumb_func_start sub_80F2DD8
sub_80F2DD8: @ 80F2DD8
	push {lr}
	movs r0, 0x7
	movs r1, 0x7
	bl CreateRegionMapCursor
	movs r0, 0x8
	movs r1, 0x8
	bl CreateRegionMapPlayerIcon
	bl sub_80FBF94
	pop {r0}
	bx r0
	thumb_func_end sub_80F2DD8

	thumb_func_start sub_80F2DF4
sub_80F2DF4: @ 80F2DF4
	push {lr}
	bl FreeRegionMapIconResources
	pop {r0}
	bx r0
	thumb_func_end sub_80F2DF4

	thumb_func_start sub_80F2E00
sub_80F2E00: @ 80F2E00
	ldr r1, _080F2E10 @ =gUnknown_083DFEC4
	ldr r1, [r1]
	ldr r2, _080F2E14 @ =0x00008766
	adds r1, r2
	ldrh r1, [r1]
	adds r1, 0x26
	strh r1, [r0, 0x20]
	bx lr
	.align 2, 0
_080F2E10: .4byte gUnknown_083DFEC4
_080F2E14: .4byte 0x00008766
	thumb_func_end sub_80F2E00

	thumb_func_start sub_80F2E18
sub_80F2E18: @ 80F2E18
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x28
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _080F2EA8 @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r0, _080F2EAC @ =0x00008768
	adds r7, r4, r0
	ldr r1, [r7]
	mov r8, r1
	cmp r1, 0
	bne _080F2EFC
	ldr r0, _080F2EB0 @ =gUnknown_083E4568
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x20]
	str r1, [sp, 0x24]
	mov r1, sp
	ldr r0, _080F2EB4 @ =gSpriteTemplate_83E4570
	ldm r0!, {r2,r5,r6}
	stm r1!, {r2,r5,r6}
	ldm r0!, {r2,r5,r6}
	stm r1!, {r2,r5,r6}
	ldr r0, _080F2EB8 @ =gUnknown_083E4588
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	lsls r0, r3, 13
	ldr r1, _080F2EBC @ =0x0000d1e4
	adds r0, r1
	adds r0, r4, r0
	str r0, [sp, 0x20]
	lsls r0, r3, 7
	adds r0, r4, r0
	str r0, [sp, 0x18]
	add r0, sp, 0x18
	bl LoadSpritePalette
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080F2EC0 @ =0x0000d1dc
	adds r5, r4, r2
	strh r0, [r5]
	add r0, sp, 0x20
	bl LoadSpriteSheet
	ldr r1, _080F2EC4 @ =0x0000d1de
	adds r6, r4, r1
	strh r0, [r6]
	mov r0, sp
	movs r1, 0x26
	movs r2, 0x68
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	bne _080F2EC8
	movs r0, 0x6
	bl FreeSpriteTilesByTag
	movs r0, 0x6
	bl FreeSpritePaletteByTag
	mov r2, r8
	str r2, [r7]
	b _080F2F26
	.align 2, 0
_080F2EA8: .4byte gUnknown_083DFEC4
_080F2EAC: .4byte 0x00008768
_080F2EB0: .4byte gUnknown_083E4568
_080F2EB4: .4byte gSpriteTemplate_83E4570
_080F2EB8: .4byte gUnknown_083E4588
_080F2EBC: .4byte 0x0000d1e4
_080F2EC0: .4byte 0x0000d1dc
_080F2EC4: .4byte 0x0000d1de
_080F2EC8:
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F2EF0 @ =gSprites
	adds r0, r1
	str r0, [r7]
	ldr r0, _080F2EF4 @ =0x0000d1e0
	adds r1, r4, r0
	ldrh r0, [r6]
	lsls r0, 5
	ldr r2, _080F2EF8 @ =0x06010000
	adds r0, r2
	str r0, [r1]
	ldrh r0, [r5]
	lsls r0, 4
	movs r6, 0x80
	lsls r6, 1
	adds r0, r6
	strh r0, [r5]
	b _080F2F26
	.align 2, 0
_080F2EF0: .4byte gSprites
_080F2EF4: .4byte 0x0000d1e0
_080F2EF8: .4byte 0x06010000
_080F2EFC:
	lsls r0, r3, 13
	ldr r1, _080F2F34 @ =0x0000d1e4
	adds r0, r1
	adds r0, r4, r0
	ldr r2, _080F2F38 @ =0x0000d1e0
	adds r1, r4, r2
	ldr r2, [r1]
	ldr r1, _080F2F3C @ =0x040000d4
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _080F2F40 @ =0x80000400
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	lsls r0, r3, 7
	adds r0, r4, r0
	ldr r5, _080F2F44 @ =0x0000d1dc
	adds r1, r4, r5
	ldrh r1, [r1]
	movs r2, 0x20
	bl LoadPalette
_080F2F26:
	add sp, 0x28
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F2F34: .4byte 0x0000d1e4
_080F2F38: .4byte 0x0000d1e0
_080F2F3C: .4byte 0x040000d4
_080F2F40: .4byte 0x80000400
_080F2F44: .4byte 0x0000d1dc
	thumb_func_end sub_80F2E18

	thumb_func_start sub_80F2F48
sub_80F2F48: @ 80F2F48
	push {r4,lr}
	ldr r0, _080F2F74 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F2F78 @ =0x00008768
	adds r4, r0, r1
	ldr r0, [r4]
	cmp r0, 0
	beq _080F2F6C
	bl DestroySprite
	movs r0, 0x6
	bl FreeSpriteTilesByTag
	movs r0, 0x6
	bl FreeSpritePaletteByTag
	movs r0, 0
	str r0, [r4]
_080F2F6C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F2F74: .4byte gUnknown_083DFEC4
_080F2F78: .4byte 0x00008768
	thumb_func_end sub_80F2F48

	thumb_func_start sub_80F2F7C
sub_80F2F7C: @ 80F2F7C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80F2E18
	ldr r0, _080F2FA0 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F2FA4 @ =0x0000ced0
	adds r2, r0, r1
	ldr r1, _080F2FA8 @ =0x00008768
	adds r0, r1
	ldr r1, [r0]
	str r1, [r2]
	ldr r0, _080F2FAC @ =sub_80F2FEC
	str r0, [r1, 0x1C]
	pop {r0}
	bx r0
	.align 2, 0
_080F2FA0: .4byte gUnknown_083DFEC4
_080F2FA4: .4byte 0x0000ced0
_080F2FA8: .4byte 0x00008768
_080F2FAC: .4byte sub_80F2FEC
	thumb_func_end sub_80F2F7C

	thumb_func_start sub_80F2FB0
sub_80F2FB0: @ 80F2FB0
	push {r4,r5,lr}
	ldr r0, _080F2FE0 @ =gUnknown_083DFEC4
	ldr r5, [r0]
	ldr r0, _080F2FE4 @ =0x0000ced0
	adds r4, r5, r0
	ldr r0, [r4]
	cmp r0, 0
	beq _080F2FDA
	bl DestroySprite
	movs r0, 0x6
	bl FreeSpriteTilesByTag
	movs r0, 0x6
	bl FreeSpritePaletteByTag
	movs r1, 0
	str r1, [r4]
	ldr r2, _080F2FE8 @ =0x00008768
	adds r0, r5, r2
	str r1, [r0]
_080F2FDA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F2FE0: .4byte gUnknown_083DFEC4
_080F2FE4: .4byte 0x0000ced0
_080F2FE8: .4byte 0x00008768
	thumb_func_end sub_80F2FB0

	thumb_func_start sub_80F2FEC
sub_80F2FEC: @ 80F2FEC
	ldr r1, _080F3000 @ =gUnknown_083DFEC4
	ldr r1, [r1]
	ldr r2, _080F3004 @ =0x0000d15a
	adds r1, r2
	ldrh r1, [r1]
	adds r1, 0x28
	strh r1, [r0, 0x20]
	movs r1, 0x68
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_080F3000: .4byte gUnknown_083DFEC4
_080F3004: .4byte 0x0000d15a
	thumb_func_end sub_80F2FEC

	thumb_func_start sub_80F3008
sub_80F3008: @ 80F3008
	push {r4,r5,lr}
	sub sp, 0x20
	lsls r0, 24
	lsrs r2, r0, 24
	mov r1, sp
	ldr r0, _080F3060 @ =gUnknown_083E4590
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	ldr r0, _080F3064 @ =gUnknown_083E45A8
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	cmp r2, 0x2
	bgt _080F3032
	cmp r2, 0x1
	blt _080F3032
	ldr r0, _080F3068 @ =gUnknown_08E9F988
	str r0, [sp, 0x18]
_080F3032:
	mov r0, sp
	bl LoadSpriteSheets
	add r0, sp, 0x18
	bl LoadSpritePalette
	ldr r0, _080F306C @ =gSpriteTemplate_83E45B8
	movs r1, 0x5F
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	bne _080F3078
	ldr r0, _080F3070 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F3074 @ =0x000087cc
	adds r0, r1
	movs r1, 0
	str r1, [r0]
	b _080F3120
	.align 2, 0
_080F3060: .4byte gUnknown_083E4590
_080F3064: .4byte gUnknown_083E45A8
_080F3068: .4byte gUnknown_08E9F988
_080F306C: .4byte gSpriteTemplate_83E45B8
_080F3070: .4byte gUnknown_083DFEC4
_080F3074: .4byte 0x000087cc
_080F3078:
	ldr r0, _080F30F4 @ =gUnknown_083DFEC4
	ldr r2, [r0]
	ldr r3, _080F30F8 @ =0x000087cc
	adds r2, r3
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F30FC @ =gSprites
	adds r0, r1
	str r0, [r2]
	movs r4, 0
	movs r5, 0
_080F3090:
	lsls r2, r4, 7
	adds r2, 0x8
	lsls r2, 16
	asrs r2, 16
	ldr r0, _080F3100 @ =gSpriteTemplate_83E45F0
	movs r1, 0xA8
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080F3108
	ldr r0, _080F30F4 @ =gUnknown_083DFEC4
	ldr r2, [r0]
	lsls r0, r4, 2
	ldr r3, _080F3104 @ =0x000087d0
	adds r2, r3
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F30FC @ =gSprites
	adds r3, r0, r1
	str r3, [r2]
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	strh r5, [r3, 0x2E]
	strh r5, [r3, 0x30]
	movs r0, 0x1
	cmp r4, 0
	bne _080F30DE
	movs r1, 0x1
	negs r1, r1
	adds r0, r1, 0
_080F30DE:
	strh r0, [r3, 0x32]
	strh r4, [r3, 0x34]
	movs r0, 0x1
	strh r0, [r3, 0x36]
	lsls r1, r4, 24
	lsrs r1, 24
	adds r0, r3, 0
	bl StartSpriteAnim
	b _080F3116
	.align 2, 0
_080F30F4: .4byte gUnknown_083DFEC4
_080F30F8: .4byte 0x000087cc
_080F30FC: .4byte gSprites
_080F3100: .4byte gSpriteTemplate_83E45F0
_080F3104: .4byte 0x000087d0
_080F3108:
	ldr r0, _080F3128 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	lsls r1, r4, 2
	ldr r2, _080F312C @ =0x000087d0
	adds r0, r2
	adds r0, r1
	str r5, [r0]
_080F3116:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _080F3090
_080F3120:
	add sp, 0x20
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F3128: .4byte gUnknown_083DFEC4
_080F312C: .4byte 0x000087d0
	thumb_func_end sub_80F3008

	thumb_func_start sub_80F3130
sub_80F3130: @ 80F3130
	push {r4-r6,lr}
	ldr r0, _080F3184 @ =gUnknown_083DFEC4
	ldr r6, [r0]
	ldr r0, _080F3188 @ =0x000087cc
	adds r4, r6, r0
	ldr r0, [r4]
	cmp r0, 0
	beq _080F3154
	bl DestroySprite
	movs r0, 0x9
	bl FreeSpriteTilesByTag
	movs r0, 0x9
	bl FreeSpritePaletteByTag
	movs r0, 0
	str r0, [r4]
_080F3154:
	movs r5, 0
	ldr r0, _080F318C @ =0x000087d0
	adds r6, r0
_080F315A:
	lsls r0, r5, 2
	adds r4, r6, r0
	ldr r0, [r4]
	cmp r0, 0
	beq _080F316C
	bl DestroySprite
	movs r0, 0
	str r0, [r4]
_080F316C:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1
	bls _080F315A
	movs r0, 0xA
	bl FreeSpriteTilesByTag
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F3184: .4byte gUnknown_083DFEC4
_080F3188: .4byte 0x000087cc
_080F318C: .4byte 0x000087d0
	thumb_func_end sub_80F3130

	thumb_func_start sub_80F3190
sub_80F3190: @ 80F3190
	ldr r1, _080F31A4 @ =gUnknown_083DFEC4
	ldr r1, [r1]
	ldr r2, _080F31A8 @ =0x0000876c
	adds r1, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	lsls r1, 4
	adds r1, 0x10
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_080F31A4: .4byte gUnknown_083DFEC4
_080F31A8: .4byte 0x0000876c
	thumb_func_end sub_80F3190

	thumb_func_start sub_80F31AC
sub_80F31AC: @ 80F31AC
	push {r4,r5,lr}
	adds r3, r0, 0
	ldr r0, _080F31E8 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _080F31EC @ =0x000087c9
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F325C
	movs r4, 0x36
	ldrsh r0, [r3, r4]
	cmp r0, 0
	beq _080F3226
	movs r5, 0x34
	ldrsh r0, [r3, r5]
	cmp r0, 0
	bne _080F31F4
	movs r2, 0
	ldr r4, _080F31F0 @ =0x00008770
	adds r0, r1, r4
	movs r5, 0
	ldrsh r0, [r0, r5]
	cmp r0, 0
	bne _080F31DE
	movs r2, 0x1
_080F31DE:
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	lsls r2, 2
	b _080F3214
	.align 2, 0
_080F31E8: .4byte gUnknown_083DFEC4
_080F31EC: .4byte 0x000087c9
_080F31F0: .4byte 0x00008770
_080F31F4:
	movs r4, 0
	ldr r2, _080F3250 @ =0x00008772
	adds r0, r1, r2
	ldr r5, _080F3254 @ =0x00008774
	adds r1, r5
	movs r5, 0
	ldrsh r2, [r0, r5]
	movs r5, 0
	ldrsh r0, [r1, r5]
	cmp r2, r0
	bne _080F320C
	movs r4, 0x1
_080F320C:
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	lsls r2, r4, 2
_080F3214:
	ldrb r1, [r0]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	mov r1, r12
	strb r0, [r1]
	movs r0, 0
	strh r0, [r3, 0x36]
_080F3226:
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080F325C
	strh r1, [r3, 0x2E]
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bgt _080F3258
	ldrh r0, [r3, 0x32]
	ldrh r2, [r3, 0x26]
	adds r0, r2
	strh r0, [r3, 0x26]
	b _080F325C
	.align 2, 0
_080F3250: .4byte 0x00008772
_080F3254: .4byte 0x00008774
_080F3258:
	strh r1, [r3, 0x30]
	strh r1, [r3, 0x26]
_080F325C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80F31AC

	thumb_func_start sub_80F3264
sub_80F3264: @ 80F3264
	push {lr}
	movs r1, 0
	ldr r0, _080F328C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r3, _080F3290 @ =0x000087d0
	adds r2, r0, r3
	movs r3, 0x1
_080F3272:
	lsls r0, r1, 2
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _080F327E
	strh r3, [r0, 0x36]
_080F327E:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x1
	bls _080F3272
	pop {r0}
	bx r0
	.align 2, 0
_080F328C: .4byte gUnknown_083DFEC4
_080F3290: .4byte 0x000087d0
	thumb_func_end sub_80F3264

	thumb_func_start sub_80F3294
sub_80F3294: @ 80F3294
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080F32F4 @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r1, _080F32F8 @ =0x000087cc
	adds r0, r4, r1
	ldr r2, [r0]
	adds r2, 0x3E
	movs r0, 0x1
	adds r1, r6, 0
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2]
	movs r5, 0x5
	negs r5, r5
	adds r0, r5, 0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldr r2, _080F32FC @ =0x000087c9
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F331A
	cmp r6, 0x1
	bne _080F3308
	ldr r1, _080F3300 @ =0x000087d0
	adds r0, r4, r1
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r5, 0
	ands r0, r2
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r1]
	ldr r2, _080F3304 @ =0x000087d4
	adds r0, r4, r2
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r5, 0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1]
	b _080F331A
	.align 2, 0
_080F32F4: .4byte gUnknown_083DFEC4
_080F32F8: .4byte 0x000087cc
_080F32FC: .4byte 0x000087c9
_080F3300: .4byte 0x000087d0
_080F3304: .4byte 0x000087d4
_080F3308:
	ldr r1, _080F3320 @ =0x000087d0
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x1
	strh r1, [r0, 0x36]
	ldr r2, _080F3324 @ =0x000087d4
	adds r0, r4, r2
	ldr r0, [r0]
	strh r1, [r0, 0x36]
_080F331A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F3320: .4byte 0x000087d0
_080F3324: .4byte 0x000087d4
	thumb_func_end sub_80F3294

	thumb_func_start sub_80F3328
sub_80F3328: @ 80F3328
	push {lr}
	adds r2, r0, 0
	ldr r0, _080F334C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F3350 @ =0x000087dc
	adds r0, r1
	movs r3, 0x2E
	ldrsh r1, [r2, r3]
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bne _080F3354
	adds r0, r2, 0
	movs r1, 0
	bl StartSpriteAnim
	b _080F335C
	.align 2, 0
_080F334C: .4byte gUnknown_083DFEC4
_080F3350: .4byte 0x000087dc
_080F3354:
	adds r0, r2, 0
	movs r1, 0x1
	bl StartSpriteAnim
_080F335C:
	pop {r0}
	bx r0
	thumb_func_end sub_80F3328

	thumb_func_start sub_80F3360
sub_80F3360: @ 80F3360
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080F3384 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080F3388 @ =0x000087dc
	adds r1, r0, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	ldr r2, _080F338C @ =0x000087da
	adds r0, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	subs r0, 0x1
	cmp r1, r0
	bne _080F3390
	movs r0, 0x4
	b _080F3392
	.align 2, 0
_080F3384: .4byte gUnknown_083DFEC4
_080F3388: .4byte 0x000087dc
_080F338C: .4byte 0x000087da
_080F3390:
	movs r0, 0x5
_080F3392:
	bl IndexOfSpritePaletteTag
	lsls r0, 4
	ldrb r2, [r4, 0x5]
	movs r1, 0xF
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x5]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80F3360

	thumb_func_start sub_80F33A8
sub_80F33A8: @ 80F33A8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x50
	mov r1, sp
	ldr r0, _080F3440 @ =gUnknown_083E4628
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2,r5,r6}
	stm r1!, {r2,r5,r6}
	ldm r0!, {r3,r4}
	stm r1!, {r3,r4}
	add r4, sp, 0x20
	adds r1, r4, 0
	ldr r0, _080F3444 @ =gUnknown_083E4648
	ldm r0!, {r2,r5,r6}
	stm r1!, {r2,r5,r6}
	ldm r0!, {r3,r5,r6}
	stm r1!, {r3,r5,r6}
	add r5, sp, 0x38
	adds r1, r5, 0
	ldr r0, _080F3448 @ =gSpriteTemplate_83E4660
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	mov r0, sp
	bl LoadSpriteSheets
	adds r0, r4, 0
	bl LoadSpritePalettes
	movs r6, 0
	ldr r2, _080F344C @ =gUnknown_083DFEC4
	ldr r1, [r2]
	ldr r3, _080F3450 @ =0x000087da
	adds r0, r1, r3
	movs r4, 0
	ldrsh r0, [r0, r4]
	subs r0, 0x1
	adds r7, r5, 0
	cmp r6, r0
	bge _080F347A
	adds r5, r2, 0
	adds r0, r3, 0
	adds r0, r1
	mov r8, r0
_080F3406:
	lsls r4, r6, 2
	adds r2, r4, r6
	lsls r2, 18
	movs r1, 0x80
	lsls r1, 12
	adds r2, r1
	asrs r2, 16
	adds r0, r7, 0
	movs r1, 0xE2
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	beq _080F345C
	ldr r0, [r5]
	ldr r2, _080F3454 @ =0x000087e4
	adds r0, r2
	adds r0, r4
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	ldr r2, _080F3458 @ =gSprites
	adds r1, r2
	str r1, [r0]
	strh r6, [r1, 0x2E]
	b _080F3468
	.align 2, 0
_080F3440: .4byte gUnknown_083E4628
_080F3444: .4byte gUnknown_083E4648
_080F3448: .4byte gSpriteTemplate_83E4660
_080F344C: .4byte gUnknown_083DFEC4
_080F3450: .4byte 0x000087da
_080F3454: .4byte 0x000087e4
_080F3458: .4byte gSprites
_080F345C:
	ldr r0, [r5]
	ldr r3, _080F34C8 @ =0x000087e4
	adds r0, r3
	adds r0, r4
	movs r1, 0
	str r1, [r0]
_080F3468:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	mov r4, r8
	movs r1, 0
	ldrsh r0, [r4, r1]
	subs r0, 0x1
	cmp r6, r0
	blt _080F3406
_080F347A:
	movs r0, 0x4
	strh r0, [r7]
	ldr r0, _080F34CC @ =SpriteCallbackDummy
	str r0, [r7, 0x14]
	cmp r6, 0x5
	bhi _080F34EE
	ldr r5, _080F34D0 @ =gUnknown_083DFEC4
_080F3488:
	lsls r4, r6, 2
	adds r2, r4, r6
	lsls r2, 18
	movs r3, 0x80
	lsls r3, 12
	adds r2, r3
	asrs r2, 16
	adds r0, r7, 0
	movs r1, 0xE6
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	beq _080F34D8
	ldr r2, [r5]
	ldr r0, _080F34C8 @ =0x000087e4
	adds r2, r0
	adds r2, r4
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	ldr r0, _080F34D4 @ =gSprites
	adds r1, r0
	str r1, [r2]
	ldrb r2, [r1, 0x3]
	movs r0, 0x3F
	ands r0, r2
	strb r0, [r1, 0x3]
	b _080F34E4
	.align 2, 0
_080F34C8: .4byte 0x000087e4
_080F34CC: .4byte SpriteCallbackDummy
_080F34D0: .4byte gUnknown_083DFEC4
_080F34D4: .4byte gSprites
_080F34D8:
	ldr r0, [r5]
	ldr r1, _080F3548 @ =0x000087e4
	adds r0, r1
	adds r0, r4
	movs r1, 0
	str r1, [r0]
_080F34E4:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x5
	bls _080F3488
_080F34EE:
	movs r0, 0x5
	strh r0, [r7]
	ldr r0, _080F354C @ =sub_80F3360
	str r0, [r7, 0x14]
	lsls r5, r6, 2
	adds r2, r5, r6
	lsls r2, 18
	movs r3, 0x80
	lsls r3, 12
	adds r2, r3
	asrs r2, 16
	adds r0, r7, 0
	movs r1, 0xDE
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	beq _080F3558
	ldr r0, _080F3550 @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r6, _080F3548 @ =0x000087e4
	adds r4, r6
	adds r4, r5
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	ldr r0, _080F3554 @ =gSprites
	adds r1, r0
	str r1, [r4]
	ldrb r3, [r1, 0x1]
	movs r2, 0x3F
	adds r0, r2, 0
	ands r0, r3
	movs r3, 0x40
	orrs r0, r3
	strb r0, [r1, 0x1]
	ldr r1, [r4]
	ldrb r0, [r1, 0x3]
	ands r2, r0
	movs r0, 0x80
	orrs r2, r0
	strb r2, [r1, 0x3]
	b _080F3566
	.align 2, 0
_080F3548: .4byte 0x000087e4
_080F354C: .4byte sub_80F3360
_080F3550: .4byte gUnknown_083DFEC4
_080F3554: .4byte gSprites
_080F3558:
	ldr r0, _080F3574 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F3578 @ =0x000087e4
	adds r0, r1
	adds r0, r5
	movs r1, 0
	str r1, [r0]
_080F3566:
	add sp, 0x50
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F3574: .4byte gUnknown_083DFEC4
_080F3578: .4byte 0x000087e4
	thumb_func_end sub_80F33A8

	thumb_func_start sub_80F357C
sub_80F357C: @ 80F357C
	push {r4-r6,lr}
	movs r5, 0
	ldr r0, _080F35AC @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F35B0 @ =0x000087e4
	adds r6, r0, r1
_080F3588:
	lsls r0, r5, 2
	adds r4, r6, r0
	ldr r0, [r4]
	cmp r0, 0
	beq _080F359A
	bl DestroySprite
	movs r0, 0
	str r0, [r4]
_080F359A:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x6
	bls _080F3588
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F35AC: .4byte gUnknown_083DFEC4
_080F35B0: .4byte 0x000087e4
	thumb_func_end sub_80F357C

	thumb_func_start sub_80F35B4
sub_80F35B4: @ 80F35B4
	push {r4,lr}
	ldr r0, _080F35FC @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r1, _080F3600 @ =0x000076b0
	adds r0, r4, r1
	movs r1, 0x1C
	strh r1, [r0]
	ldr r1, _080F3604 @ =0x000076b2
	adds r2, r4, r1
	movs r1, 0x13
	strh r1, [r2]
	bl sub_80F727C
	bl sub_80F7404
	ldr r2, _080F3608 @ =gUnknown_083E4678
	movs r0, 0x1B
	movs r1, 0x15
	bl sub_80F7920
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	movs r1, 0xC0
	strh r1, [r0, 0x20]
	movs r1, 0x20
	strh r1, [r0, 0x22]
	ldr r1, _080F360C @ =sub_80F363C
	str r1, [r0, 0x1C]
	ldr r1, _080F3610 @ =0x000076ac
	adds r4, r1
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F35FC: .4byte gUnknown_083DFEC4
_080F3600: .4byte 0x000076b0
_080F3604: .4byte 0x000076b2
_080F3608: .4byte gUnknown_083E4678
_080F360C: .4byte sub_80F363C
_080F3610: .4byte 0x000076ac
	thumb_func_end sub_80F35B4

	thumb_func_start sub_80F3614
sub_80F3614: @ 80F3614
	push {lr}
	ldr r0, _080F3634 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F3638 @ =0x000076ac
	adds r0, r1
	ldr r0, [r0]
	bl DestroySprite
	movs r0, 0x1B
	bl FreeSpriteTilesByTag
	movs r0, 0x15
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	.align 2, 0
_080F3634: .4byte gUnknown_083DFEC4
_080F3638: .4byte 0x000076ac
	thumb_func_end sub_80F3614

	thumb_func_start sub_80F363C
sub_80F363C: @ 80F363C
	push {lr}
	ldr r1, _080F365C @ =gUnknown_083DFEC4
	ldr r1, [r1]
	ldr r3, _080F3660 @ =0x00008fe9
	adds r2, r1, r3
	ldrb r2, [r2]
	lsls r2, 24
	asrs r2, 24
	ldr r3, _080F3664 @ =0x00008934
	adds r1, r3
	adds r1, r2
	ldrb r1, [r1]
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_080F365C: .4byte gUnknown_083DFEC4
_080F3660: .4byte 0x00008fe9
_080F3664: .4byte 0x00008934
	thumb_func_end sub_80F363C

	thumb_func_start sub_80F3668
sub_80F3668: @ 80F3668
	push {lr}
	ldr r0, _080F368C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080F3690 @ =0x00008fe9
	adds r1, r0, r2
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	ldr r2, _080F3694 @ =0x00008934
	adds r0, r2
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0xB0
	movs r2, 0x20
	bl sub_80F7418
	pop {r0}
	bx r0
	.align 2, 0
_080F368C: .4byte gUnknown_083DFEC4
_080F3690: .4byte 0x00008fe9
_080F3694: .4byte 0x00008934
	thumb_func_end sub_80F3668

	thumb_func_start sub_80F3698
sub_80F3698: @ 80F3698
	push {r4,lr}
	ldr r0, _080F36DC @ =gUnknown_083DFEC4
	ldr r3, [r0]
	ldr r1, _080F36E0 @ =0x000087dc
	adds r0, r3, r1
	movs r2, 0
	ldrsh r1, [r0, r2]
	lsls r1, 2
	ldr r4, _080F36E4 @ =0x0000893c
	adds r1, r4
	adds r1, r3, r1
	ldr r2, _080F36E8 @ =0x00008fe9
	adds r0, r3, r2
	movs r2, 0
	ldrsb r2, [r0, r2]
	subs r4, 0x8
	adds r0, r3, r4
	adds r0, r2
	ldr r2, _080F36EC @ =0x000076b4
	adds r3, r2
	ldrb r2, [r3]
	strb r2, [r0]
	ldrb r0, [r1, 0x1]
	ldr r1, [r1]
	lsls r1, 11
	lsrs r1, 27
	ldrb r2, [r3]
	bl sub_80F4548
	bl sub_80F7470
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F36DC: .4byte gUnknown_083DFEC4
_080F36E0: .4byte 0x000087dc
_080F36E4: .4byte 0x0000893c
_080F36E8: .4byte 0x00008fe9
_080F36EC: .4byte 0x000076b4
	thumb_func_end sub_80F3698

	thumb_func_start sub_80F36F0
sub_80F36F0: @ 80F36F0
	push {lr}
	ldr r0, _080F3718 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F371C @ =0x00000306
	adds r2, r0, r1
	movs r1, 0
	strh r1, [r2]
	ldr r1, _080F3720 @ =0x00006dac
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F3712
_080F3708:
	bl sub_80F3724
	lsls r0, 24
	cmp r0, 0
	bne _080F3708
_080F3712:
	pop {r0}
	bx r0
	.align 2, 0
_080F3718: .4byte gUnknown_083DFEC4
_080F371C: .4byte 0x00000306
_080F3720: .4byte 0x00006dac
	thumb_func_end sub_80F36F0

	thumb_func_start sub_80F3724
sub_80F3724: @ 80F3724
	push {r4,lr}
	ldr r0, _080F3740 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F3744 @ =0x00000306
	adds r4, r1, r0
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _080F3764
	cmp r0, 0x1
	bgt _080F3748
	cmp r0, 0
	beq _080F374E
	b _080F377A
	.align 2, 0
_080F3740: .4byte gUnknown_083DFEC4
_080F3744: .4byte 0x00000306
_080F3748:
	cmp r0, 0x2
	beq _080F376E
	b _080F377A
_080F374E:
	ldr r0, _080F375C @ =gUnknown_083E3D00
	ldr r2, _080F3760 @ =0x0000984c
	adds r1, r2
	bl LZ77UnCompWram
	b _080F377E
	.align 2, 0
_080F375C: .4byte gUnknown_083E3D00
_080F3760: .4byte 0x0000984c
_080F3764:
	bl sub_80F379C
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_080F376E:
	bl sub_80F37D0
	lsls r0, 24
	cmp r0, 0
	beq _080F377E
	b _080F378C
_080F377A:
	movs r0, 0
	b _080F378E
_080F377E:
	ldr r0, _080F3794 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F3798 @ =0x00000306
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080F378C:
	movs r0, 0x1
_080F378E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F3794: .4byte gUnknown_083DFEC4
_080F3798: .4byte 0x00000306
	thumb_func_end sub_80F3724

	thumb_func_start sub_80F379C
sub_80F379C: @ 80F379C
	push {lr}
	ldr r0, _080F37C4 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F37C8 @ =0x0000bc93
	adds r2, r0, r1
	movs r1, 0
	strb r1, [r2]
	ldr r1, _080F37CC @ =0x00006dac
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F37BE
_080F37B4:
	bl sub_80F37D0
	lsls r0, 24
	cmp r0, 0
	bne _080F37B4
_080F37BE:
	pop {r0}
	bx r0
	.align 2, 0
_080F37C4: .4byte gUnknown_083DFEC4
_080F37C8: .4byte 0x0000bc93
_080F37CC: .4byte 0x00006dac
	thumb_func_end sub_80F379C

	thumb_func_start sub_80F37D0
sub_80F37D0: @ 80F37D0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _080F3898 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _080F389C @ =0x0000bc93
	adds r1, r2
	ldrb r1, [r1]
	adds r2, r0, 0
	cmp r1, 0xB
	bhi _080F38A8
	movs r3, 0
	mov r8, r3
	movs r7, 0xF
	mov r9, r7
_080F37F0:
	ldr r2, [r2]
	ldr r1, _080F389C @ =0x0000bc93
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r0, r1, 8
	ldr r3, _080F38A0 @ =0x0000984c
	adds r0, r3
	adds r4, r2, r0
	lsls r1, 9
	ldr r7, _080F38A4 @ =0x0000a44c
	adds r1, r7
	adds r5, r2, r1
	movs r6, 0
_080F380A:
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x10
	bl CpuFastSet
	adds r5, 0x40
	adds r4, 0x20
	movs r1, 0
	adds r6, 0x1
	mov r12, r6
_080F381E:
	movs r0, 0
	adds r6, r1, 0x1
_080F3822:
	adds r4, 0x4
	movs r2, 0
	adds r3, r0, 0x1
_080F3828:
	subs r4, 0x1
	ldrb r0, [r4]
	lsls r1, r0, 4
	lsrs r0, 4
	mov r7, r9
	ands r0, r7
	orrs r1, r0
	strb r1, [r5]
	adds r5, 0x1
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _080F3828
	adds r4, 0x4
	lsls r0, r3, 24
	lsrs r0, 24
	cmp r0, 0x7
	bls _080F3822
	subs r4, 0x40
	lsls r0, r6, 24
	lsrs r1, r0, 24
	cmp r1, 0x1
	bls _080F381E
	adds r4, 0x60
	mov r1, r12
	lsls r0, r1, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bls _080F380A
	ldr r2, _080F3898 @ =gUnknown_083DFEC4
	ldr r3, [r2]
	ldr r7, _080F389C @ =0x0000bc93
	adds r1, r3, r7
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB
	bhi _080F38A8
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r0, 0x1
	bls _080F37F0
	adds r1, r7, 0
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0xB
	bhi _080F38A8
	movs r0, 0x1
	b _080F38AA
	.align 2, 0
_080F3898: .4byte gUnknown_083DFEC4
_080F389C: .4byte 0x0000bc93
_080F38A0: .4byte 0x0000984c
_080F38A4: .4byte 0x0000a44c
_080F38A8:
	movs r0, 0
_080F38AA:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80F37D0

	thumb_func_start sub_80F38B8
sub_80F38B8: @ 80F38B8
	push {lr}
	ldr r0, _080F38E0 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F38E4 @ =0x00000306
	adds r2, r0, r1
	movs r1, 0
	strh r1, [r2]
	ldr r1, _080F38E8 @ =0x00006dac
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F38DA
_080F38D0:
	bl sub_80F38EC
	lsls r0, 24
	cmp r0, 0
	bne _080F38D0
_080F38DA:
	pop {r0}
	bx r0
	.align 2, 0
_080F38E0: .4byte gUnknown_083DFEC4
_080F38E4: .4byte 0x00000306
_080F38E8: .4byte 0x00006dac
	thumb_func_end sub_80F38B8

	thumb_func_start sub_80F38EC
sub_80F38EC: @ 80F38EC
	push {r4,lr}
	ldr r0, _080F3908 @ =gUnknown_083DFEC4
	ldr r2, [r0]
	ldr r0, _080F390C @ =0x00000306
	adds r4, r2, r0
	ldrh r1, [r4]
	cmp r1, 0x1
	beq _080F3930
	cmp r1, 0x1
	bgt _080F3910
	cmp r1, 0
	beq _080F391A
	b _080F394E
	.align 2, 0
_080F3908: .4byte gUnknown_083DFEC4
_080F390C: .4byte 0x00000306
_080F3910:
	cmp r1, 0x2
	beq _080F3938
	cmp r1, 0x3
	beq _080F3942
	b _080F394E
_080F391A:
	ldr r3, _080F3928 @ =0x00009348
	adds r0, r2, r3
	str r1, [r0]
	ldr r3, _080F392C @ =0x0000bc92
	adds r0, r2, r3
	strb r1, [r0]
	b _080F3952
	.align 2, 0
_080F3928: .4byte 0x00009348
_080F392C: .4byte 0x0000bc92
_080F3930:
	movs r0, 0
	bl sub_80F2E18
	b _080F3952
_080F3938:
	bl sub_80F3970
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_080F3942:
	bl sub_80F39A4
	lsls r0, 24
	cmp r0, 0
	beq _080F3952
	b _080F3960
_080F394E:
	movs r0, 0
	b _080F3962
_080F3952:
	ldr r0, _080F3968 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F396C @ =0x00000306
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080F3960:
	movs r0, 0x1
_080F3962:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F3968: .4byte gUnknown_083DFEC4
_080F396C: .4byte 0x00000306
	thumb_func_end sub_80F38EC

	thumb_func_start sub_80F3970
sub_80F3970: @ 80F3970
	push {lr}
	ldr r0, _080F3998 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F399C @ =0x0000bc93
	adds r2, r0, r1
	movs r1, 0
	strb r1, [r2]
	ldr r1, _080F39A0 @ =0x00006dac
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F3992
_080F3988:
	bl sub_80F39A4
	lsls r0, 24
	cmp r0, 0
	bne _080F3988
_080F3992:
	pop {r0}
	bx r0
	.align 2, 0
_080F3998: .4byte gUnknown_083DFEC4
_080F399C: .4byte 0x0000bc93
_080F39A0: .4byte 0x00006dac
	thumb_func_end sub_80F3970

	thumb_func_start sub_80F39A4
sub_80F39A4: @ 80F39A4
	push {r4,r5,lr}
	sub sp, 0x10
	ldr r0, _080F3A18 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F3A1C @ =0x0000bc93
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, 0xB
	bhi _080F3A30
	ldrb r0, [r4]
	lsls r0, 9
	ldr r2, _080F3A20 @ =0x0000a44c
	adds r0, r2
	adds r0, r1, r0
	str r0, [sp]
	ldr r5, _080F3A24 @ =0xffff0000
	ldr r2, [sp, 0x4]
	ands r2, r5
	movs r0, 0x80
	lsls r0, 2
	orrs r2, r0
	str r2, [sp, 0x4]
	ldrb r1, [r4]
	adds r1, 0xB
	lsls r1, 16
	ldr r0, _080F3A28 @ =0x0000ffff
	ands r0, r2
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	ldrb r0, [r4]
	cmp r0, 0x4
	bhi _080F3A04
	lsls r0, 5
	ldr r1, _080F3A2C @ =gUnknown_083E3C60
	adds r0, r1
	str r0, [sp, 0x8]
	ldrb r2, [r4]
	adds r2, 0xA
	add r0, sp, 0x8
	ldr r1, [r0, 0x4]
	ands r1, r5
	orrs r1, r2
	str r1, [r0, 0x4]
	bl LoadSpritePalette
_080F3A04:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB
	bhi _080F3A30
	movs r0, 0x1
	b _080F3A32
	.align 2, 0
_080F3A18: .4byte gUnknown_083DFEC4
_080F3A1C: .4byte 0x0000bc93
_080F3A20: .4byte 0x0000a44c
_080F3A24: .4byte 0xffff0000
_080F3A28: .4byte 0x0000ffff
_080F3A2C: .4byte gUnknown_083E3C60
_080F3A30:
	movs r0, 0
_080F3A32:
	add sp, 0x10
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80F39A4

	thumb_func_start sub_80F3A3C
sub_80F3A3C: @ 80F3A3C
	push {r4-r7,lr}
	sub sp, 0x18
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	cmp r4, 0x2
	bhi _080F3A60
	lsls r0, r4, 3
	adds r0, r4
	adds r0, r5, r0
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r2, _080F3A5C @ =gUnknown_083DFEC4
	b _080F3A78
	.align 2, 0
_080F3A5C: .4byte gUnknown_083DFEC4
_080F3A60:
	ldr r2, _080F3AD0 @ =gUnknown_083DFEC4
	ldr r1, [r2]
	ldr r3, _080F3AD4 @ =0x0000bc8e
	adds r0, r1, r3
	ldrb r0, [r0]
	ldr r6, _080F3AD8 @ =0x0000bc8f
	adds r1, r6
	ldrb r1, [r1]
	subs r0, r1
	adds r0, r5, r0
	lsls r0, 16
	lsrs r1, r0, 16
_080F3A78:
	ldr r0, [r2]
	ldr r7, _080F3ADC @ =0x0000bc4c
	adds r0, r7
	adds r0, r1
	ldrb r2, [r0]
	mov r1, sp
	ldr r0, _080F3AE0 @ =gSpriteTemplate_83E476C
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	mov r3, sp
	ldr r1, _080F3AE4 @ =gUnknown_083E4698
	lsls r2, 2
	adds r0, r2, r1
	ldrh r0, [r0]
	adds r0, 0xB
	strh r0, [r3]
	adds r1, 0x2
	adds r2, r1
	ldrh r0, [r2]
	adds r0, 0xA
	strh r0, [r3, 0x2]
	lsls r1, r5, 20
	movs r0, 0xC0
	lsls r0, 15
	adds r1, r0
	asrs r1, 16
	lsls r2, r4, 20
	movs r3, 0xA0
	lsls r3, 14
	adds r2, r3
	asrs r2, 16
	mov r0, sp
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	bne _080F3AE8
	movs r0, 0
	b _080F3AF2
	.align 2, 0
_080F3AD0: .4byte gUnknown_083DFEC4
_080F3AD4: .4byte 0x0000bc8e
_080F3AD8: .4byte 0x0000bc8f
_080F3ADC: .4byte 0x0000bc4c
_080F3AE0: .4byte gSpriteTemplate_83E476C
_080F3AE4: .4byte gUnknown_083E4698
_080F3AE8:
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F3AFC @ =gSprites
	adds r0, r1
_080F3AF2:
	add sp, 0x18
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080F3AFC: .4byte gSprites
	thumb_func_end sub_80F3A3C

	thumb_func_start sub_80F3B00
sub_80F3B00: @ 80F3B00
	push {r4,lr}
	ldr r0, _080F3B34 @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r1, _080F3B38 @ =0x0000bc90
	adds r0, r4, r1
	ldrb r0, [r0]
	ldr r2, _080F3B3C @ =0x0000bc91
	adds r1, r4, r2
	ldrb r1, [r1]
	bl sub_80F3A3C
	adds r2, r0, 0
	ldr r1, _080F3B40 @ =0x00009348
	adds r0, r4, r1
	str r2, [r0]
	cmp r2, 0
	beq _080F3B48
	adds r0, r2, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r2, _080F3B44 @ =0x0000bc92
	adds r1, r4, r2
	movs r0, 0x1
	strb r0, [r1]
	b _080F3B4E
	.align 2, 0
_080F3B34: .4byte gUnknown_083DFEC4
_080F3B38: .4byte 0x0000bc90
_080F3B3C: .4byte 0x0000bc91
_080F3B40: .4byte 0x00009348
_080F3B44: .4byte 0x0000bc92
_080F3B48:
	ldr r1, _080F3B54 @ =0x0000bc92
	adds r0, r4, r1
	strb r2, [r0]
_080F3B4E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F3B54: .4byte 0x0000bc92
	thumb_func_end sub_80F3B00

	thumb_func_start sub_80F3B58
sub_80F3B58: @ 80F3B58
	push {lr}
	ldr r0, _080F3B6C @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F3B70 @ =0x0000bc92
	adds r2, r1, r0
	ldrb r0, [r2]
	cmp r0, 0
	bne _080F3B74
	movs r0, 0
	b _080F3B8A
	.align 2, 0
_080F3B6C: .4byte gUnknown_083DFEC4
_080F3B70: .4byte 0x0000bc92
_080F3B74:
	ldr r3, _080F3B90 @ =0x00009348
	adds r0, r1, r3
	ldr r0, [r0]
	adds r0, 0x3F
	ldrb r0, [r0]
	lsrs r0, 5
	movs r1, 0x1
	eors r0, r1
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r2]
_080F3B8A:
	pop {r1}
	bx r1
	.align 2, 0
_080F3B90: .4byte 0x00009348
	thumb_func_end sub_80F3B58

	thumb_func_start sub_80F3B94
sub_80F3B94: @ 80F3B94
	push {r4,lr}
	ldr r0, _080F3BB8 @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r1, _080F3BBC @ =0x00009348
	adds r0, r4, r1
	ldr r2, [r0]
	cmp r2, 0
	beq _080F3BC4
	adds r0, r2, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	ldr r0, _080F3BC0 @ =0x0000bc92
	adds r1, r4, r0
	movs r0, 0x1
	strb r0, [r1]
	b _080F3BCA
	.align 2, 0
_080F3BB8: .4byte gUnknown_083DFEC4
_080F3BBC: .4byte 0x00009348
_080F3BC0: .4byte 0x0000bc92
_080F3BC4:
	ldr r1, _080F3BD0 @ =0x0000bc92
	adds r0, r4, r1
	strb r2, [r0]
_080F3BCA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F3BD0: .4byte 0x0000bc92
	thumb_func_end sub_80F3B94

	thumb_func_start sub_80F3BD4
sub_80F3BD4: @ 80F3BD4
	push {r4-r6,lr}
	ldr r0, _080F3C18 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F3C1C @ =0x0000bc92
	adds r5, r1, r0
	ldrb r0, [r5]
	cmp r0, 0
	beq _080F3C24
	ldr r0, _080F3C20 @ =0x00009348
	adds r4, r1, r0
	ldr r0, [r4]
	adds r0, 0x3F
	ldrb r0, [r0]
	lsrs r0, 5
	movs r1, 0x1
	eors r0, r1
	ands r0, r1
	strb r0, [r5]
	adds r6, r0, 0
	cmp r6, 0
	bne _080F3C12
	ldr r0, [r4]
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldr r0, [r4]
	bl DestroySprite
	str r6, [r4]
_080F3C12:
	ldrb r0, [r5]
	b _080F3C26
	.align 2, 0
_080F3C18: .4byte gUnknown_083DFEC4
_080F3C1C: .4byte 0x0000bc92
_080F3C20: .4byte 0x00009348
_080F3C24:
	movs r0, 0
_080F3C26:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80F3BD4

	thumb_func_start sub_80F3C2C
sub_80F3C2C: @ 80F3C2C
	push {r4,lr}
	ldr r0, _080F3C8C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F3C90 @ =0x00009348
	adds r4, r0, r1
	ldr r0, [r4]
	cmp r0, 0
	beq _080F3C50
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldr r0, [r4]
	bl DestroySprite
	movs r0, 0
	str r0, [r4]
_080F3C50:
	movs r4, 0
_080F3C52:
	adds r0, r4, 0
	adds r0, 0xB
	lsls r0, 16
	lsrs r0, 16
	bl FreeSpriteTilesByTag
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xB
	bls _080F3C52
	movs r4, 0
_080F3C6A:
	adds r0, r4, 0
	adds r0, 0xA
	lsls r0, 16
	lsrs r0, 16
	bl FreeSpritePaletteByTag
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _080F3C6A
	bl sub_80F2F48
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F3C8C: .4byte gUnknown_083DFEC4
_080F3C90: .4byte 0x00009348
	thumb_func_end sub_80F3C2C

	thumb_func_start sub_80F3C94
sub_80F3C94: @ 80F3C94
	push {lr}
	sub sp, 0x10
	ldr r0, _080F3CDC @ =gUnknown_083E4784
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r0, _080F3CE0 @ =gUnknown_083E478C
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x8]
	str r1, [sp, 0xC]
	mov r0, sp
	bl LoadSpriteSheet
	add r0, sp, 0x8
	bl LoadSpritePalette
	movs r1, 0
	ldr r0, _080F3CE4 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	movs r3, 0x88
	lsls r3, 8
	adds r2, r0, r3
	movs r3, 0
_080F3CC6:
	lsls r0, r1, 2
	adds r0, r2, r0
	str r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x9
	bls _080F3CC6
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_080F3CDC: .4byte gUnknown_083E4784
_080F3CE0: .4byte gUnknown_083E478C
_080F3CE4: .4byte gUnknown_083DFEC4
	thumb_func_end sub_80F3C94

	thumb_func_start sub_80F3CE8
sub_80F3CE8: @ 80F3CE8
	push {lr}
	bl move_anim_execute
	movs r0, 0x17
	bl FreeSpriteTilesByTag
	movs r0, 0xF
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	thumb_func_end sub_80F3CE8

	thumb_func_start sub_80F3D00
sub_80F3D00: @ 80F3D00
	push {r4,r5,lr}
	ldr r0, _080F3D34 @ =gUnknown_083DFEC4
	ldr r2, [r0]
	ldr r1, _080F3D38 @ =0x000087dc
	adds r0, r2, r1
	movs r3, 0
	ldrsh r0, [r0, r3]
	lsls r0, 2
	ldr r1, _080F3D3C @ =0x0000893c
	adds r0, r1
	adds r0, r2, r0
	ldrb r1, [r0, 0x3]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080F3D94
	ldr r3, _080F3D40 @ =0x00008fe9
	adds r0, r2, r3
	movs r1, 0
	ldrsb r1, [r0, r1]
	ldr r3, _080F3D44 @ =0x00008931
	adds r0, r2, r3
	adds r0, r1
	ldrb r5, [r0]
	movs r4, 0
	b _080F3D86
	.align 2, 0
_080F3D34: .4byte gUnknown_083DFEC4
_080F3D38: .4byte 0x000087dc
_080F3D3C: .4byte 0x0000893c
_080F3D40: .4byte 0x00008fe9
_080F3D44: .4byte 0x00008931
_080F3D48:
	ldr r0, _080F3D9C @ =gSpriteTemplate_83E4800
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080F3D8C
	ldr r0, _080F3DA0 @ =gUnknown_083DFEC4
	ldr r2, [r0]
	lsls r0, r4, 2
	movs r3, 0x88
	lsls r3, 8
	adds r2, r3
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F3DA4 @ =gSprites
	adds r0, r1
	str r0, [r2]
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_080F3D86:
	adds r0, r5, 0x1
	cmp r4, r0
	blt _080F3D48
_080F3D8C:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80F3F20
_080F3D94:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F3D9C: .4byte gSpriteTemplate_83E4800
_080F3DA0: .4byte gUnknown_083DFEC4
_080F3DA4: .4byte gSprites
	thumb_func_end sub_80F3D00

	thumb_func_start move_anim_execute
move_anim_execute: @ 80F3DA8
	push {r4-r6,lr}
	movs r5, 0
	ldr r0, _080F3DD8 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	movs r1, 0x88
	lsls r1, 8
	adds r6, r0, r1
_080F3DB6:
	lsls r0, r5, 2
	adds r4, r6, r0
	ldr r0, [r4]
	cmp r0, 0
	beq _080F3DD2
	bl DestroySprite
	movs r0, 0
	str r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x9
	bls _080F3DB6
_080F3DD2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F3DD8: .4byte gUnknown_083DFEC4
	thumb_func_end move_anim_execute

	thumb_func_start sub_80F3DDC
sub_80F3DDC: @ 80F3DDC
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3C
	ble _080F3DFE
	movs r0, 0
	strh r0, [r1, 0x30]
	ldrh r0, [r1, 0x32]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_80F3F20
_080F3DFE:
	pop {r0}
	bx r0
	thumb_func_end sub_80F3DDC

	thumb_func_start sub_80F3E04
sub_80F3E04: @ 80F3E04
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080F3E1C
	movs r0, 0
	strh r0, [r2, 0x30]
	ldr r0, _080F3E20 @ =sub_80F3DDC
	str r0, [r2, 0x1C]
_080F3E1C:
	pop {r0}
	bx r0
	.align 2, 0
_080F3E20: .4byte sub_80F3DDC
	thumb_func_end sub_80F3E04

	thumb_func_start sub_80F3E24
sub_80F3E24: @ 80F3E24
	push {r4,r5,lr}
	adds r3, r0, 0
	ldr r0, _080F3E64 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F3E68 @ =0x00008768
	adds r4, r0, r1
	ldr r0, [r4]
	cmp r0, 0
	beq _080F3E70
	ldrh r1, [r0, 0x24]
	ldrh r0, [r0, 0x20]
	adds r1, r0
	ldr r2, _080F3E6C @ =gUnknown_083E4794
	movs r5, 0x2E
	ldrsh r0, [r3, r5]
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0]
	adds r0, r1
	strh r0, [r3, 0x20]
	ldr r0, [r4]
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	movs r4, 0x2E
	ldrsh r0, [r3, r4]
	lsls r0, 2
	adds r2, 0x2
	adds r0, r2
	ldrh r0, [r0]
	adds r0, r1
	b _080F3E8E
	.align 2, 0
_080F3E64: .4byte gUnknown_083DFEC4
_080F3E68: .4byte 0x00008768
_080F3E6C: .4byte gUnknown_083E4794
_080F3E70:
	ldr r1, _080F3E98 @ =gUnknown_083E4794
	movs r5, 0x2E
	ldrsh r0, [r3, r5]
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0]
	adds r0, 0x28
	strh r0, [r3, 0x20]
	movs r2, 0x2E
	ldrsh r0, [r3, r2]
	lsls r0, 2
	adds r1, 0x2
	adds r0, r1
	ldrh r0, [r0]
	adds r0, 0x68
_080F3E8E:
	strh r0, [r3, 0x22]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F3E98: .4byte gUnknown_083E4794
	thumb_func_end sub_80F3E24

	thumb_func_start sub_80F3E9C
sub_80F3E9C: @ 80F3E9C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080F3ECA
	subs r0, r1, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _080F3F14
	adds r0, r4, 0
	movs r1, 0
	bl SeekSpriteAnim
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080F3ECA:
	adds r0, r4, 0
	bl sub_80F3E24
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080F3F14
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x34
	ldrsh r1, [r4, r0]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080F3F10
	cmp r1, 0x9
	bne _080F3F08
	bl sub_80F3FAC
	ldr r0, _080F3F04 @ =sub_80F3E04
	b _080F3F12
	.align 2, 0
_080F3F04: .4byte sub_80F3E04
_080F3F08:
	ldr r0, _080F3F0C @ =sub_80F3DDC
	b _080F3F12
	.align 2, 0
_080F3F0C: .4byte sub_80F3DDC
_080F3F10:
	ldr r0, _080F3F1C @ =SpriteCallbackDummy
_080F3F12:
	str r0, [r4, 0x1C]
_080F3F14:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F3F1C: .4byte SpriteCallbackDummy
	thumb_func_end sub_80F3E9C

	thumb_func_start sub_80F3F20
sub_80F3F20: @ 80F3F20
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	movs r5, 0
	ldr r0, _080F3F6C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	movs r1, 0x88
	lsls r1, 8
	adds r7, r0, r1
_080F3F3C:
	lsls r0, r5, 2
	adds r4, r7, r0
	ldr r0, [r4]
	cmp r0, 0
	beq _080F3F92
	strh r5, [r0, 0x2E]
	ldr r1, [r4]
	lsls r0, r5, 4
	adds r0, 0x1
	strh r0, [r1, 0x30]
	ldr r0, [r4]
	strh r6, [r0, 0x32]
	ldr r0, [r4]
	strh r5, [r0, 0x34]
	mov r3, r8
	cmp r3, 0
	beq _080F3F62
	cmp r6, 0x9
	beq _080F3F74
_080F3F62:
	ldr r1, [r4]
	ldr r0, _080F3F70 @ =sub_80F3E9C
	str r0, [r1, 0x1C]
	b _080F3F92
	.align 2, 0
_080F3F6C: .4byte gUnknown_083DFEC4
_080F3F70: .4byte sub_80F3E9C
_080F3F74:
	ldr r0, [r4]
	bl sub_80F3E24
	bl sub_80F3FAC
	ldr r2, [r4]
	ldr r0, _080F3FA8 @ =sub_80F3E04
	str r0, [r2, 0x1C]
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r3, 0x5
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	strb r0, [r2]
_080F3F92:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x9
	bls _080F3F3C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F3FA8: .4byte sub_80F3E04
	thumb_func_end sub_80F3F20

	thumb_func_start sub_80F3FAC
sub_80F3FAC: @ 80F3FAC
	push {r4-r7,lr}
	movs r5, 0
	ldr r0, _080F3FEC @ =gUnknown_083DFEC4
	ldr r0, [r0]
	movs r1, 0x88
	lsls r1, 8
	adds r6, r0, r1
	movs r0, 0x5
	negs r0, r0
	adds r7, r0, 0
_080F3FC0:
	lsls r0, r5, 2
	adds r4, r6, r0
	ldr r0, [r4]
	cmp r0, 0
	beq _080F3FDA
	movs r1, 0
	bl SeekSpriteAnim
	ldr r1, [r4]
	adds r1, 0x3E
	ldrb r0, [r1]
	ands r0, r7
	strb r0, [r1]
_080F3FDA:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x9
	bls _080F3FC0
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F3FEC: .4byte gUnknown_083DFEC4
	thumb_func_end sub_80F3FAC

	thumb_func_start sub_80F3FF0
sub_80F3FF0: @ 80F3FF0
	push {lr}
	ldr r0, _080F4018 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F401C @ =0x00000306
	adds r2, r0, r1
	movs r1, 0
	strh r1, [r2]
	ldr r1, _080F4020 @ =0x00006dac
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F4012
_080F4008:
	bl sub_80F4024
	lsls r0, 24
	cmp r0, 0
	bne _080F4008
_080F4012:
	pop {r0}
	bx r0
	.align 2, 0
_080F4018: .4byte gUnknown_083DFEC4
_080F401C: .4byte 0x00000306
_080F4020: .4byte 0x00006dac
	thumb_func_end sub_80F3FF0

	thumb_func_start sub_80F4024
sub_80F4024: @ 80F4024
	push {r4,lr}
	sub sp, 0x10
	ldr r0, _080F4040 @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r1, _080F4044 @ =0x00000306
	adds r0, r4, r1
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _080F4068
	cmp r0, 0x1
	bgt _080F4048
	cmp r0, 0
	beq _080F4052
	b _080F4106
	.align 2, 0
_080F4040: .4byte gUnknown_083DFEC4
_080F4044: .4byte 0x00000306
_080F4048:
	cmp r0, 0x2
	beq _080F4084
	cmp r0, 0x3
	beq _080F40B8
	b _080F4106
_080F4052:
	ldr r0, _080F4060 @ =gUnknown_083E329C
	ldr r2, _080F4064 @ =0x000131e4
	adds r1, r4, r2
	bl LZ77UnCompWram
	b _080F4118
	.align 2, 0
_080F4060: .4byte gUnknown_083E329C
_080F4064: .4byte 0x000131e4
_080F4068:
	ldr r1, _080F407C @ =0x000131e4
	adds r0, r4, r1
	str r0, [sp]
	ldr r0, _080F4080 @ =0x00181000
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	b _080F4118
	.align 2, 0
_080F407C: .4byte 0x000131e4
_080F4080: .4byte 0x00181000
_080F4084:
	ldr r0, _080F40B4 @ =gUnknown_083E4818
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x8]
	str r1, [sp, 0xC]
	add r0, sp, 0x8
	bl LoadSpritePalette
	movs r0, 0x10
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xC2
	lsls r1, 2
	adds r2, r4, r1
	adds r0, 0x10
	movs r1, 0x1
	lsls r1, r0
	movs r0, 0x3
	negs r0, r0
	bics r0, r1
	str r0, [r2]
	b _080F4118
	.align 2, 0
_080F40B4: .4byte gUnknown_083E4818
_080F40B8:
	ldr r0, _080F40E4 @ =gSpriteTemplate_83E4850
	movs r1, 0xDA
	movs r2, 0xE
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080F40F0
	ldr r0, _080F40E8 @ =0x00006d98
	adds r2, r4, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F40EC @ =gSprites
	adds r0, r1
	str r0, [r2]
	movs r1, 0
	strh r1, [r0, 0x2E]
	b _080F40F8
	.align 2, 0
_080F40E4: .4byte gSpriteTemplate_83E4850
_080F40E8: .4byte 0x00006d98
_080F40EC: .4byte gSprites
_080F40F0:
	ldr r2, _080F410C @ =0x00006d98
	adds r1, r4, r2
	movs r0, 0
	str r0, [r1]
_080F40F8:
	ldr r0, _080F4110 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F4114 @ =0x00000306
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080F4106:
	movs r0, 0
	b _080F4128
	.align 2, 0
_080F410C: .4byte 0x00006d98
_080F4110: .4byte gUnknown_083DFEC4
_080F4114: .4byte 0x00000306
_080F4118:
	ldr r0, _080F4130 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _080F4134 @ =0x00000306
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x1
_080F4128:
	add sp, 0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F4130: .4byte gUnknown_083DFEC4
_080F4134: .4byte 0x00000306
	thumb_func_end sub_80F4024

	thumb_func_start sub_80F4138
sub_80F4138: @ 80F4138
	push {lr}
	adds r2, r0, 0
	ldr r0, _080F4170 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	movs r1, 0xC3
	lsls r1, 2
	adds r0, r1
	ldrh r0, [r0]
	negs r0, r0
	strh r0, [r2, 0x26]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	bgt _080F4174
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _080F418E
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x1
	b _080F418C
	.align 2, 0
_080F4170: .4byte gUnknown_083DFEC4
_080F4174:
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	bne _080F418E
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r3]
	movs r0, 0
_080F418C:
	strh r0, [r2, 0x2E]
_080F418E:
	pop {r0}
	bx r0
	thumb_func_end sub_80F4138

	thumb_func_start sub_80F4194
sub_80F4194: @ 80F4194
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	adds r2, r1, 0
	ldr r0, _080F42A4 @ =gUnknown_083DFEC8
	ldr r6, [r0]
	mov r0, sp
	ldr r1, _080F42A8 @ =0x00001111
	adds r5, r1, 0
	strh r5, [r0]
	ldr r4, _080F42AC @ =0x040000d4
	str r0, [r4]
	str r6, [r4, 0x4]
	ldr r3, _080F42B0 @ =0x81000140
	str r3, [r4, 0x8]
	ldr r0, [r4, 0x8]
	movs r0, 0x80
	lsls r0, 3
	adds r1, r6, r0
	mov r0, sp
	strh r5, [r0]
	str r0, [r4]
	str r1, [r4, 0x4]
	str r3, [r4, 0x8]
	ldr r0, [r4, 0x8]
	ldr r0, _080F42B4 @ =gWindowConfig_81E70F0
	adds r1, r6, 0
	bl sub_8004E3C
	movs r3, 0x88
	lsls r3, 2
	adds r1, r6, r3
	mov r0, sp
	movs r3, 0
	strh r3, [r0]
	str r0, [r4]
	str r1, [r4, 0x4]
	ldr r2, _080F42B8 @ =0x81000030
	str r2, [r4, 0x8]
	ldr r0, [r4, 0x8]
	movs r0, 0xC4
	lsls r0, 3
	adds r1, r6, r0
	mov r0, sp
	strh r3, [r0]
	str r0, [r4]
	str r1, [r4, 0x4]
	str r2, [r4, 0x8]
	ldr r0, [r4, 0x8]
	movs r1, 0x80
	lsls r1, 2
	adds r2, r6, r1
	ldr r0, [r2]
	ldr r1, _080F42BC @ =0x0fffffff
	ands r0, r1
	str r0, [r2]
	ldr r0, [r2, 0x4]
	ands r0, r1
	str r0, [r2, 0x4]
	ldr r0, [r2, 0x8]
	ands r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0xC]
	ands r0, r1
	str r0, [r2, 0xC]
	ldr r0, [r2, 0x10]
	ands r0, r1
	str r0, [r2, 0x10]
	ldr r0, [r2, 0x14]
	ands r0, r1
	str r0, [r2, 0x14]
	ldr r0, [r2, 0x18]
	ands r0, r1
	str r0, [r2, 0x18]
	ldr r0, [r2, 0x1C]
	ands r0, r1
	str r0, [r2, 0x1C]
	movs r3, 0xC0
	lsls r3, 3
	adds r2, r6, r3
	ldr r0, [r2]
	ands r0, r1
	str r0, [r2]
	ldr r0, [r2, 0x4]
	ands r0, r1
	str r0, [r2, 0x4]
	ldr r0, [r2, 0x8]
	ands r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0xC]
	ands r0, r1
	str r0, [r2, 0xC]
	ldr r0, [r2, 0x10]
	ands r0, r1
	str r0, [r2, 0x10]
	ldr r0, [r2, 0x14]
	ands r0, r1
	str r0, [r2, 0x14]
	ldr r0, [r2, 0x18]
	ands r0, r1
	str r0, [r2, 0x18]
	ldr r0, [r2, 0x1C]
	ands r0, r1
	str r0, [r2, 0x1C]
	movs r1, 0
	ldr r2, _080F42C0 @ =0x80000040
_080F4268:
	lsls r0, r1, 7
	adds r0, r6, r0
	str r0, [r4]
	lsls r0, r1, 8
	adds r0, r7, r0
	str r0, [r4, 0x4]
	str r2, [r4, 0x8]
	ldr r0, [r4, 0x8]
	lsls r0, r1, 7
	movs r3, 0x80
	lsls r3, 3
	adds r0, r3
	adds r0, r6, r0
	str r0, [r4]
	lsls r0, r1, 3
	adds r0, 0x4
	lsls r0, 5
	adds r0, r7, r0
	str r0, [r4, 0x4]
	str r2, [r4, 0x8]
	ldr r0, [r4, 0x8]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x4
	bls _080F4268
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F42A4: .4byte gUnknown_083DFEC8
_080F42A8: .4byte 0x00001111
_080F42AC: .4byte 0x040000d4
_080F42B0: .4byte 0x81000140
_080F42B4: .4byte gWindowConfig_81E70F0
_080F42B8: .4byte 0x81000030
_080F42BC: .4byte 0x0fffffff
_080F42C0: .4byte 0x80000040
	thumb_func_end sub_80F4194

	thumb_func_start sub_80F42C4
sub_80F42C4: @ 80F42C4
	push {r4-r7,lr}
	sub sp, 0x8
	adds r1, r0, 0
	ldr r0, _080F433C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080F4340 @ =0x0000d1e4
	adds r0, r2
	str r0, [sp]
	ldr r2, _080F4344 @ =0x001a0500
	str r2, [sp, 0x4]
	bl sub_80F4194
	mov r0, sp
	bl LoadSpriteSheet
	ldr r0, _080F4348 @ =gUnknown_083E4868
	bl LoadSpritePalette
	movs r5, 0
	movs r4, 0
	ldr r6, _080F434C @ =gSprites
_080F42EE:
	lsls r1, r4, 21
	movs r7, 0xE2
	lsls r7, 15
	adds r1, r7
	asrs r1, 16
	ldr r0, _080F4350 @ =gSpriteTemplate_83E4878
	movs r2, 0x10
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080F4360
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r3, r6
	ldrh r2, [r3, 0x4]
	lsls r0, r2, 22
	lsrs r0, 22
	adds r0, r5, r0
	ldr r7, _080F4354 @ =0x000003ff
	adds r1, r7, 0
	ands r0, r1
	ldr r7, _080F4358 @ =0xfffffc00
	adds r1, r7, 0
	ands r2, r1
	orrs r2, r0
	strh r2, [r3, 0x4]
	ldr r0, _080F433C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	lsls r1, r4, 2
	ldr r2, _080F435C @ =0x0000ced4
	adds r0, r2
	adds r0, r1
	str r3, [r0]
	b _080F4370
	.align 2, 0
_080F433C: .4byte gUnknown_083DFEC4
_080F4340: .4byte 0x0000d1e4
_080F4344: .4byte 0x001a0500
_080F4348: .4byte gUnknown_083E4868
_080F434C: .4byte gSprites
_080F4350: .4byte gSpriteTemplate_83E4878
_080F4354: .4byte 0x000003ff
_080F4358: .4byte 0xfffffc00
_080F435C: .4byte 0x0000ced4
_080F4360:
	ldr r0, _080F438C @ =gUnknown_083DFEC4
	ldr r1, [r0]
	lsls r0, r4, 2
	ldr r7, _080F4390 @ =0x0000ced4
	adds r1, r7
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_080F4370:
	adds r0, r5, 0
	adds r0, 0x8
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _080F42EE
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F438C: .4byte gUnknown_083DFEC4
_080F4390: .4byte 0x0000ced4
	thumb_func_end sub_80F42C4

	thumb_func_start sub_80F4394
sub_80F4394: @ 80F4394
	push {r4,r5,lr}
	movs r4, 0
	ldr r0, _080F43CC @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F43D0 @ =0x0000ced4
	adds r5, r0, r1
_080F43A0:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _080F43AE
	bl DestroySprite
_080F43AE:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _080F43A0
	movs r0, 0x1A
	bl FreeSpriteTilesByTag
	movs r0, 0x12
	bl FreeSpritePaletteByTag
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F43CC: .4byte gUnknown_083DFEC4
_080F43D0: .4byte 0x0000ced4
	thumb_func_end sub_80F4394

	thumb_func_start sub_80F43D4
sub_80F43D4: @ 80F43D4
	push {r4,lr}
	adds r1, r0, 0
	ldr r0, _080F4410 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080F4414 @ =0x0000d1e4
	adds r4, r0, r2
	adds r0, r4, 0
	bl sub_80F4194
	movs r0, 0x1A
	bl GetSpriteTileStartByTag
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _080F4418 @ =0x0000ffff
	cmp r1, r0
	beq _080F4408
	lsls r0, r1, 5
	ldr r1, _080F441C @ =0x06010000
	adds r0, r1
	ldr r1, _080F4420 @ =0x040000d4
	str r4, [r1]
	str r0, [r1, 0x4]
	ldr r0, _080F4424 @ =0x84000140
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_080F4408:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F4410: .4byte gUnknown_083DFEC4
_080F4414: .4byte 0x0000d1e4
_080F4418: .4byte 0x0000ffff
_080F441C: .4byte 0x06010000
_080F4420: .4byte 0x040000d4
_080F4424: .4byte 0x84000140
	thumb_func_end sub_80F43D4

	thumb_func_start sub_80F4428
sub_80F4428: @ 80F4428
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r2, 24
	bl sub_80F6514
	pop {r1}
	bx r1
	thumb_func_end sub_80F4428

	thumb_func_start sub_80F443C
sub_80F443C: @ 80F443C
	push {r4,lr}
	lsls r4, r1, 16
	lsrs r4, 16
	ldr r1, _080F4458 @ =gOtherText_Number
	bl StringCopy
	adds r1, r4, 0
	movs r2, 0x38
	movs r3, 0x1
	bl sub_8072C14
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F4458: .4byte gOtherText_Number
	thumb_func_end sub_80F443C

	thumb_func_start sub_80F445C
sub_80F445C: @ 80F445C
	push {r4,lr}
	lsls r1, 16
	lsrs r1, 16
	movs r2, 0x17
	movs r3, 0x1
	bl sub_8072C14
	adds r4, r0, 0
	movs r3, 0xFC
	strb r3, [r4]
	movs r2, 0x11
	strb r2, [r4, 0x1]
	movs r1, 0x1
	strb r1, [r4, 0x2]
	adds r4, 0x3
	movs r0, 0xBA
	strb r0, [r4]
	adds r4, 0x1
	strb r3, [r4]
	strb r2, [r4, 0x1]
	strb r1, [r4, 0x2]
	adds r4, 0x3
	ldr r0, _080F44A8 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F44AC @ =0x00008774
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r1, 0x1
	adds r0, r4, 0
	movs r2, 0x32
	movs r3, 0x1
	bl sub_8072C14
	adds r4, r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F44A8: .4byte gUnknown_083DFEC4
_080F44AC: .4byte 0x00008774
	thumb_func_end sub_80F445C

	thumb_func_start sub_80F44B0
sub_80F44B0: @ 80F44B0
	push {r4,lr}
	adds r4, r2, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r2, r1, 16
	cmp r0, 0xE
	bne _080F44F4
	cmp r4, 0x2
	beq _080F44C8
	cmp r4, 0x7
	bne _080F44E0
_080F44C8:
	movs r0, 0x64
	muls r0, r2
	ldr r1, _080F44DC @ =gPlayerParty
	adds r0, r1
	adds r1, r4, 0
	adds r2, r3, 0
	bl GetMonData
	b _080F453C
	.align 2, 0
_080F44DC: .4byte gPlayerParty
_080F44E0:
	movs r0, 0x64
	muls r0, r2
	ldr r1, _080F44F0 @ =gPlayerParty
	adds r0, r1
	adds r1, r4, 0
	bl GetMonData
	b _080F453C
	.align 2, 0
_080F44F0: .4byte gPlayerParty
_080F44F4:
	cmp r4, 0x2
	beq _080F44FC
	cmp r4, 0x7
	bne _080F4520
_080F44FC:
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	ldr r2, _080F451C @ =gPokemonStorage + 0x4
	adds r1, r2
	adds r0, r1
	adds r1, r4, 0
	adds r2, r3, 0
	bl GetBoxMonData
	b _080F453C
	.align 2, 0
_080F451C: .4byte gPokemonStorage + 0x4
_080F4520:
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	ldr r2, _080F4544 @ =gPokemonStorage + 0x4
	adds r1, r2
	adds r0, r1
	adds r1, r4, 0
	bl GetBoxMonData
_080F453C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F4544: .4byte gPokemonStorage + 0x4
	thumb_func_end sub_80F44B0

	thumb_func_start sub_80F4548
sub_80F4548: @ 80F4548
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	mov r0, sp
	strb r2, [r0]
	cmp r3, 0xE
	bne _080F4574
	movs r0, 0x64
	muls r0, r4
	ldr r1, _080F4570 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x8
	mov r2, sp
	bl SetMonData
	b _080F4592
	.align 2, 0
_080F4570: .4byte gPlayerParty
_080F4574:
	lsls r1, r3, 2
	adds r1, r3
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 4
	ldr r2, _080F459C @ =gPokemonStorage + 0x4
	adds r1, r2
	adds r0, r1
	movs r1, 0x8
	mov r2, sp
	bl SetBoxMonData
_080F4592:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F459C: .4byte gPokemonStorage + 0x4
	thumb_func_end sub_80F4548

	thumb_func_start sub_80F45A0
sub_80F45A0: @ 80F45A0
	push {r4-r7,lr}
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r1, _080F45F0 @ =gUnknown_083DFEC4
	ldr r5, [r1]
	lsls r1, r0, 16
	asrs r0, r1, 14
	adds r4, r5, r0
	ldr r2, _080F45F4 @ =0x0000893f
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, 25
	lsrs r7, r0, 31
	cmp r7, 0
	beq _080F4644
	lsls r0, r6, 6
	ldr r2, _080F45F8 @ =0x00008829
	adds r0, r2
	adds r0, r5, r0
	lsrs r1, 16
	movs r2, 0
	bl sub_80F4428
	ldr r1, _080F45FC @ =0x0000893d
	adds r0, r4, r1
	ldrb r2, [r0]
	cmp r2, 0xE
	bne _080F4608
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 3
	ldr r2, _080F4600 @ =0x000088e9
	adds r0, r2
	adds r0, r5, r0
	ldr r1, _080F4604 @ =gOtherText_InParty
	movs r2, 0x40
	movs r3, 0
	bl sub_8072C74
	b _080F4624
	.align 2, 0
_080F45F0: .4byte gUnknown_083DFEC4
_080F45F4: .4byte 0x0000893f
_080F45F8: .4byte 0x00008829
_080F45FC: .4byte 0x0000893d
_080F4600: .4byte 0x000088e9
_080F4604: .4byte gOtherText_InParty
_080F4608:
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 3
	ldr r1, _080F4634 @ =0x000088e9
	adds r0, r1
	adds r0, r5, r0
	lsls r1, r2, 3
	adds r1, r2
	ldr r2, _080F4638 @ =gPokemonStorage + 0x8344
	adds r1, r2
	movs r2, 0x40
	movs r3, 0
	bl sub_8072C74
_080F4624:
	ldr r0, _080F463C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080F4640 @ =0x00008937
	adds r0, r2
	adds r0, r6
	movs r1, 0x1
	strb r1, [r0]
	b _080F4676
	.align 2, 0
_080F4634: .4byte 0x000088e9
_080F4638: .4byte gPokemonStorage + 0x8344
_080F463C: .4byte gUnknown_083DFEC4
_080F4640: .4byte 0x00008937
_080F4644:
	lsls r0, r6, 6
	ldr r1, _080F467C @ =0x00008829
	adds r0, r1
	adds r0, r5, r0
	ldr r4, _080F4680 @ =gEmptyString_81E72B0
	adds r1, r4, 0
	movs r2, 0x68
	movs r3, 0
	bl sub_8072C74
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 3
	ldr r2, _080F4684 @ =0x000088e9
	adds r0, r2
	adds r0, r5, r0
	adds r1, r4, 0
	movs r2, 0x40
	movs r3, 0
	bl sub_8072C74
	ldr r1, _080F4688 @ =0x00008937
	adds r0, r5, r1
	adds r0, r6
	strb r7, [r0]
_080F4676:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F467C: .4byte 0x00008829
_080F4680: .4byte gEmptyString_81E72B0
_080F4684: .4byte 0x000088e9
_080F4688: .4byte 0x00008937
	thumb_func_end sub_80F45A0

	thumb_func_start sub_80F468C
sub_80F468C: @ 80F468C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	ldr r1, _080F475C @ =gUnknown_083DFEC4
	ldr r7, [r1]
	lsls r0, 16
	asrs r0, 14
	adds r1, r7, r0
	ldr r2, _080F4760 @ =0x0000893f
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, 25
	cmp r0, 0
	blt _080F46B2
	b _080F47C4
_080F46B2:
	ldr r3, _080F4764 @ =0x0000893d
	adds r0, r1, r3
	ldrb r5, [r0]
	subs r2, 0x1
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, 27
	lsrs r6, r0, 27
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0x16
	movs r3, 0
	bl sub_80F44B0
	mov r3, r9
	lsls r3, 2
	mov r8, r3
	mov r4, r8
	add r4, r9
	ldr r2, _080F4768 @ =0x00008ff0
	adds r1, r7, r2
	adds r1, r4
	strb r0, [r1]
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0x2F
	movs r3, 0
	bl sub_80F44B0
	ldr r3, _080F476C @ =0x00008ff1
	adds r1, r7, r3
	adds r1, r4
	strb r0, [r1]
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0x21
	movs r3, 0
	bl sub_80F44B0
	ldr r2, _080F4770 @ =0x00008ff2
	adds r1, r7, r2
	adds r1, r4
	strb r0, [r1]
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0x18
	movs r3, 0
	bl sub_80F44B0
	ldr r3, _080F4774 @ =0x00008ff3
	adds r1, r7, r3
	adds r1, r4
	strb r0, [r1]
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0x17
	movs r3, 0
	bl sub_80F44B0
	ldr r2, _080F4778 @ =0x00008ff4
	adds r1, r7, r2
	adds r1, r4
	strb r0, [r1]
	ldr r3, _080F477C @ =0x00008931
	adds r0, r7, r3
	mov r7, r9
	adds r4, r0, r7
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0x30
	movs r3, 0
	bl sub_80F44B0
	cmp r0, 0xFF
	beq _080F4780
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0x30
	movs r3, 0
	bl sub_80F44B0
	movs r1, 0x1D
	bl __udivsi3
	b _080F4782
	.align 2, 0
_080F475C: .4byte gUnknown_083DFEC4
_080F4760: .4byte 0x0000893f
_080F4764: .4byte 0x0000893d
_080F4768: .4byte 0x00008ff0
_080F476C: .4byte 0x00008ff1
_080F4770: .4byte 0x00008ff2
_080F4774: .4byte 0x00008ff3
_080F4778: .4byte 0x00008ff4
_080F477C: .4byte 0x00008931
_080F4780:
	movs r0, 0x9
_080F4782:
	strb r0, [r4]
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0x8
	movs r3, 0
	bl sub_80F44B0
	ldr r1, _080F47B4 @ =gUnknown_083DFEC4
	ldr r1, [r1]
	ldr r3, _080F47B8 @ =0x00008934
	adds r2, r1, r3
	add r2, r9
	strb r0, [r2]
	mov r2, r8
	add r2, r9
	ldr r7, _080F47BC @ =0x00008ff0
	adds r0, r2, r7
	adds r0, r1, r0
	lsls r2, 2
	ldr r3, _080F47C0 @ =0x00009004
	adds r2, r3
	adds r1, r2
	bl sub_80F55AC
	b _080F480A
	.align 2, 0
_080F47B4: .4byte gUnknown_083DFEC4
_080F47B8: .4byte 0x00008934
_080F47BC: .4byte 0x00008ff0
_080F47C0: .4byte 0x00009004
_080F47C4:
	movs r3, 0
	mov r0, r9
	lsls r0, 2
	mov r8, r0
	adds r4, r7, 0
	mov r2, r8
	add r2, r9
	ldr r1, _080F4818 @ =0x00008ff0
	adds r6, r4, r1
	lsls r5, r2, 2
	mov r9, r3
	ldr r7, _080F481C @ =0x00009004
	mov r8, r7
	movs r0, 0x9B
	mov r12, r0
_080F47E2:
	adds r0, r3, r2
	adds r0, r6, r0
	mov r1, r9
	strb r1, [r0]
	lsls r0, r3, 2
	adds r0, r5
	adds r0, r4, r0
	mov r7, r8
	adds r1, r0, r7
	mov r7, r12
	strh r7, [r1]
	ldr r1, _080F4820 @ =0x00009006
	adds r0, r1
	movs r1, 0x5B
	strh r1, [r0]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x4
	bls _080F47E2
_080F480A:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F4818: .4byte 0x00008ff0
_080F481C: .4byte 0x00009004
_080F4820: .4byte 0x00009006
	thumb_func_end sub_80F468C

	thumb_func_start sub_80F4824
sub_80F4824: @ 80F4824
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	ldr r1, _080F48E0 @ =gUnknown_083DFEC4
	ldr r7, [r1]
	lsls r0, 16
	asrs r0, 14
	adds r1, r7, r0
	ldr r2, _080F48E4 @ =0x0000893f
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, 25
	cmp r0, 0
	bge _080F48D0
	ldr r6, _080F48E8 @ =0x0000893d
	adds r0, r1, r6
	ldrb r6, [r0]
	subs r2, 0x1
	adds r0, r1, r2
	ldrb r4, [r0]
	lsls r4, 27
	lsrs r4, 27
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0x41
	movs r3, 0
	bl sub_80F44B0
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0x1
	movs r3, 0
	bl sub_80F44B0
	mov r8, r0
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0
	bl sub_80F44B0
	adds r4, r0, 0
	lsls r0, r5, 3
	ldr r1, _080F48EC @ =gMonFrontPicTable
	adds r0, r1
	ldr r2, _080F48F0 @ =gMonFrontPicCoords
	lsls r1, r5, 2
	adds r1, r2
	ldrb r1, [r1]
	ldr r6, _080F48F4 @ =0x000131e4
	adds r3, r7, r6
	mov r6, r9
	lsls r2, r6, 13
	ldr r6, _080F48F8 @ =0x0000d1e4
	adds r2, r6
	adds r2, r7, r2
	str r2, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r2, 0x1
	bl HandleLoadSpecialPokePic
	adds r0, r5, 0
	mov r1, r8
	adds r2, r4, 0
	bl species_and_otid_get_pal
	mov r2, r9
	lsls r1, r2, 7
	adds r1, r7, r1
	bl LZ77UnCompWram
	mov r6, r9
	lsls r1, r6, 1
	ldr r2, _080F48FC @ =0x0000d1d6
	adds r0, r7, r2
	adds r0, r1
	strh r5, [r0]
_080F48D0:
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F48E0: .4byte gUnknown_083DFEC4
_080F48E4: .4byte 0x0000893f
_080F48E8: .4byte 0x0000893d
_080F48EC: .4byte gMonFrontPicTable
_080F48F0: .4byte gMonFrontPicCoords
_080F48F4: .4byte 0x000131e4
_080F48F8: .4byte 0x0000d1e4
_080F48FC: .4byte 0x0000d1d6
	thumb_func_end sub_80F4824

	thumb_func_start sub_80F4900
sub_80F4900: @ 80F4900
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 16
	asrs r4, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80F45A0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80F468C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80F4824
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80F4900

	thumb_func_start sub_80F492C
sub_80F492C: @ 80F492C
	ldr r0, _080F493C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F4940 @ =0x00008fe4
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
	bx lr
	.align 2, 0
_080F493C: .4byte gUnknown_083DFEC4
_080F4940: .4byte 0x00008fe4
	thumb_func_end sub_80F492C

	thumb_func_start sub_80F4944
sub_80F4944: @ 80F4944
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r12, r0
	movs r2, 0
	ldr r1, _080F4978 @ =gUnknown_083DFEC4
	ldr r5, [r1]
	ldr r3, _080F497C @ =0x00008fe4
	adds r0, r5, r3
	ldrh r4, [r0]
	lsrs r3, r4, 1
	mov r8, r1
	cmp r4, r3
	beq _080F499C
	adds r6, r5, 0
	mov r0, r12
	ldrb r5, [r0]
	ldr r7, _080F4980 @ =0x0000893c
_080F4968:
	lsls r0, r3, 2
	adds r0, r6, r0
	adds r0, r7
	ldrb r0, [r0]
	cmp r5, r0
	bls _080F4984
	adds r4, r3, 0
	b _080F498A
	.align 2, 0
_080F4978: .4byte gUnknown_083DFEC4
_080F497C: .4byte 0x00008fe4
_080F4980: .4byte 0x0000893c
_080F4984:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
_080F498A:
	subs r0, r4, r2
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r0, r2, r0
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r4, r3
	bne _080F4968
_080F499C:
	mov r1, r8
	ldr r2, [r1]
	ldr r1, _080F49EC @ =0x00008fe4
	adds r0, r2, r1
	ldrh r4, [r0]
	lsls r6, r3, 2
	cmp r4, r3
	bls _080F49C6
	ldr r0, _080F49F0 @ =0x0000893c
	adds r5, r2, r0
_080F49B0:
	lsls r2, r4, 2
	adds r2, r5, r2
	subs r1, r4, 0x1
	lsls r0, r1, 2
	adds r0, r5, r0
	ldr r0, [r0]
	str r0, [r2]
	lsls r1, 16
	lsrs r4, r1, 16
	cmp r4, r3
	bhi _080F49B0
_080F49C6:
	mov r1, r8
	ldr r2, [r1]
	ldr r3, _080F49F0 @ =0x0000893c
	adds r0, r2, r3
	adds r0, r6
	mov r3, r12
	ldr r1, [r3]
	str r1, [r0]
	ldr r0, _080F49EC @ =0x00008fe4
	adds r2, r0
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F49EC: .4byte 0x00008fe4
_080F49F0: .4byte 0x0000893c
	thumb_func_end sub_80F4944

	thumb_func_start sub_80F49F4
sub_80F49F4: @ 80F49F4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r3, _080F4A64 @ =gUnknown_083DFEC4
	ldr r4, [r3]
	ldr r7, _080F4A68 @ =0x0000893e
	adds r2, r4, r7
	ldrh r1, [r2]
	ldr r0, _080F4A6C @ =0xffffc01f
	mov r12, r0
	ands r0, r1
	movs r1, 0x20
	orrs r0, r1
	strh r0, [r2]
	movs r5, 0x1
	ldr r1, _080F4A70 @ =0x00008fe4
	adds r0, r4, r1
	ldrh r3, [r0]
	cmp r5, r3
	bcs _080F4A9E
	adds r6, r4, 0
	ldr r1, _080F4A74 @ =0x0000893c
	mov r8, r1
	ldr r3, _080F4A78 @ =0x000001ff
	mov r10, r3
	mov r9, r0
_080F4A2C:
	lsls r0, r5, 2
	adds r3, r6, r0
	mov r0, r8
	adds r2, r3, r0
	subs r0, r5, 0x1
	lsls r0, 2
	adds r4, r6, r0
	mov r0, r8
	adds r1, r4, r0
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080F4A7C
	adds r0, r4, r7
	ldrh r0, [r0]
	lsls r0, 18
	lsrs r0, 23
	adds r3, r7
	ldr r1, _080F4A78 @ =0x000001ff
	ands r1, r0
	lsls r1, 5
	ldrh r2, [r3]
	mov r0, r12
	ands r0, r2
	orrs r0, r1
	strh r0, [r3]
	adds r4, r5, 0x1
	b _080F4A92
	.align 2, 0
_080F4A64: .4byte gUnknown_083DFEC4
_080F4A68: .4byte 0x0000893e
_080F4A6C: .4byte 0xffffc01f
_080F4A70: .4byte 0x00008fe4
_080F4A74: .4byte 0x0000893c
_080F4A78: .4byte 0x000001ff
_080F4A7C:
	adds r4, r5, 0x1
	adds r3, r7
	adds r1, r4, 0
	mov r0, r10
	ands r1, r0
	lsls r1, 5
	ldrh r2, [r3]
	mov r0, r12
	ands r0, r2
	orrs r0, r1
	strh r0, [r3]
_080F4A92:
	lsls r0, r4, 16
	lsrs r5, r0, 16
	mov r1, r9
	ldrh r1, [r1]
	cmp r5, r1
	bcc _080F4A2C
_080F4A9E:
	ldr r3, _080F4AC4 @ =gUnknown_083DFEC4
	ldr r2, [r3]
	ldr r1, _080F4AC8 @ =0x0000876c
	adds r0, r2, r1
	movs r1, 0
	strh r1, [r0]
	ldr r3, _080F4ACC @ =0x00008770
	adds r0, r2, r3
	strh r1, [r0]
	subs r3, 0x2
	adds r0, r2, r3
	strh r1, [r0]
	ldr r1, _080F4AD0 @ =0x00008fe4
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, 0x8
	bhi _080F4AD4
	subs r1, r0, 0x1
	b _080F4AD6
	.align 2, 0
_080F4AC4: .4byte gUnknown_083DFEC4
_080F4AC8: .4byte 0x0000876c
_080F4ACC: .4byte 0x00008770
_080F4AD0: .4byte 0x00008fe4
_080F4AD4:
	movs r1, 0x7
_080F4AD6:
	ldr r3, _080F4B10 @ =0x00008772
	adds r0, r2, r3
	strh r1, [r0]
	ldr r0, _080F4B14 @ =gUnknown_083DFEC4
	ldr r2, [r0]
	ldr r1, _080F4B18 @ =0x00008fe4
	adds r0, r2, r1
	ldrh r0, [r0]
	subs r0, 0x1
	adds r3, 0x2
	adds r1, r2, r3
	strh r0, [r1]
	movs r1, 0
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080F4AFA
	movs r1, 0x1
_080F4AFA:
	ldr r3, _080F4B1C @ =0x000087c9
	adds r0, r2, r3
	strb r1, [r0]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F4B10: .4byte 0x00008772
_080F4B14: .4byte gUnknown_083DFEC4
_080F4B18: .4byte 0x00008fe4
_080F4B1C: .4byte 0x000087c9
	thumb_func_end sub_80F49F4

	thumb_func_start sub_80F4B20
sub_80F4B20: @ 80F4B20
	push {r4-r6,lr}
	ldr r0, _080F4B5C @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r0, _080F4B60 @ =0x000087dc
	adds r5, r4, r0
	movs r1, 0
	ldrsh r0, [r5, r1]
	movs r1, 0
	bl sub_80F4900
	movs r0, 0
	bl sub_80F2E18
	ldr r0, _080F4B64 @ =0x000087da
	adds r2, r4, r0
	movs r1, 0
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	bne _080F4B6C
	ldr r2, _080F4B68 @ =0x00008fe9
	adds r0, r4, r2
	movs r1, 0
	strb r1, [r0]
	adds r2, 0x1
	adds r0, r4, r2
	strb r1, [r0]
	adds r2, 0x1
	adds r0, r4, r2
	strb r1, [r0]
	b _080F4BBE
	.align 2, 0
_080F4B5C: .4byte gUnknown_083DFEC4
_080F4B60: .4byte 0x000087dc
_080F4B64: .4byte 0x000087da
_080F4B68: .4byte 0x00008fe9
_080F4B6C:
	ldr r0, _080F4BC4 @ =0x00008fe9
	adds r1, r4, r0
	movs r0, 0
	strb r0, [r1]
	ldr r0, _080F4BC8 @ =0x00008fea
	adds r1, r4, r0
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _080F4BCC @ =0x00008feb
	adds r1, r4, r0
	movs r0, 0x2
	strb r0, [r1]
	ldrh r3, [r5]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	asrs r0, 16
	ldrh r6, [r2]
	movs r4, 0
	ldrsh r1, [r2, r4]
	cmp r0, r1
	blt _080F4B9A
	movs r5, 0
_080F4B9A:
	subs r0, r3, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r0, 0
	bge _080F4BAA
	subs r0, r6, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_080F4BAA:
	lsls r0, r5, 16
	asrs r0, 16
	movs r1, 0x1
	bl sub_80F4900
	lsls r0, r4, 16
	asrs r0, 16
	movs r1, 0x2
	bl sub_80F4900
_080F4BBE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F4BC4: .4byte 0x00008fe9
_080F4BC8: .4byte 0x00008fea
_080F4BCC: .4byte 0x00008feb
	thumb_func_end sub_80F4B20

	thumb_func_start sub_80F4BD0
sub_80F4BD0: @ 80F4BD0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r6, 0
	movs r7, 0
	ldr r0, _080F4CC4 @ =gUnknown_083DFEC4
	ldr r2, [r0]
	ldr r3, _080F4CC8 @ =0x00008828
	adds r1, r2, r3
	mov r9, r0
	ldrb r1, [r1]
	cmp r7, r1
	bcs _080F4C66
	mov r10, r9
	adds r4, r3, 0
	adds r4, r2
	mov r8, r4
_080F4BF6:
	movs r0, 0x64
	muls r0, r6
	ldr r1, _080F4CCC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _080F4C58
	mov r0, r10
	ldr r3, [r0]
	lsls r0, r7, 2
	adds r3, r0
	ldr r2, _080F4CD0 @ =0x0000893d
	adds r1, r3, r2
	movs r0, 0xE
	strb r0, [r1]
	ldr r4, _080F4CD4 @ =0x0000893e
	adds r5, r3, r4
	movs r0, 0x1F
	adds r2, r6, 0
	ands r2, r0
	ldrb r0, [r5]
	movs r4, 0x20
	negs r4, r4
	adds r1, r4, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5]
	adds r4, r7, 0x1
	ldr r7, _080F4CD8 @ =0x000001ff
	adds r0, r7, 0
	adds r2, r4, 0
	ands r2, r0
	lsls r2, 5
	ldrh r0, [r5]
	ldr r7, _080F4CDC @ =0xffffc01f
	adds r1, r7, 0
	ands r0, r1
	orrs r0, r2
	strh r0, [r5]
	ldr r0, _080F4CE0 @ =0x0000893f
	adds r3, r0
	ldrb r0, [r3]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r3]
	lsls r4, 16
	lsrs r7, r4, 16
_080F4C58:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	mov r1, r8
	ldrb r1, [r1]
	cmp r6, r1
	bcc _080F4BF6
_080F4C66:
	mov r2, r9
	ldr r4, [r2]
	lsls r1, r7, 2
	adds r1, r4, r1
	ldr r3, _080F4CD0 @ =0x0000893d
	adds r0, r1, r3
	movs r5, 0
	strb r5, [r0]
	ldr r0, _080F4CD4 @ =0x0000893e
	adds r2, r1, r0
	ldrb r3, [r2]
	movs r0, 0x20
	negs r0, r0
	ands r0, r3
	strb r0, [r2]
	ldrh r3, [r2]
	ldr r0, _080F4CDC @ =0xffffc01f
	ands r0, r3
	strh r0, [r2]
	ldr r2, _080F4CE0 @ =0x0000893f
	adds r1, r2
	ldrb r2, [r1]
	movs r0, 0x41
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r3, _080F4CE4 @ =0x000087dc
	adds r0, r4, r3
	strh r5, [r0]
	adds r1, r7, 0x1
	ldr r7, _080F4CE8 @ =0x000087da
	adds r0, r4, r7
	strh r1, [r0]
	bl sub_80F4B20
	ldr r0, _080F4CEC @ =0x000087cb
	adds r4, r0
	movs r0, 0x1
	strb r0, [r4]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F4CC4: .4byte gUnknown_083DFEC4
_080F4CC8: .4byte 0x00008828
_080F4CCC: .4byte gPlayerParty
_080F4CD0: .4byte 0x0000893d
_080F4CD4: .4byte 0x0000893e
_080F4CD8: .4byte 0x000001ff
_080F4CDC: .4byte 0xffffc01f
_080F4CE0: .4byte 0x0000893f
_080F4CE4: .4byte 0x000087dc
_080F4CE8: .4byte 0x000087da
_080F4CEC: .4byte 0x000087cb
	thumb_func_end sub_80F4BD0

	thumb_func_start sub_80F4CF0
sub_80F4CF0: @ 80F4CF0
	push {r4,lr}
	ldr r0, _080F4D1C @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r1, _080F4D20 @ =0x0000876e
	adds r0, r4, r1
	ldrh r1, [r0]
	ldr r2, _080F4D24 @ =0x000087dc
	adds r0, r4, r2
	strh r1, [r0]
	bl sub_80F4B20
	ldr r1, _080F4D28 @ =0x00008774
	adds r0, r4, r1
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bne _080F4D30
	ldr r0, _080F4D2C @ =0x000087cb
	adds r1, r4, r0
	movs r0, 0
	b _080F4D36
	.align 2, 0
_080F4D1C: .4byte gUnknown_083DFEC4
_080F4D20: .4byte 0x0000876e
_080F4D24: .4byte 0x000087dc
_080F4D28: .4byte 0x00008774
_080F4D2C: .4byte 0x000087cb
_080F4D30:
	ldr r2, _080F4D40 @ =0x000087cb
	adds r1, r4, r2
	movs r0, 0x1
_080F4D36:
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F4D40: .4byte 0x000087cb
	thumb_func_end sub_80F4CF0

	thumb_func_start sub_80F4D44
sub_80F4D44: @ 80F4D44
	push {r4,lr}
	ldr r0, _080F4D78 @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r1, _080F4D7C @ =0x00008fe6
	adds r0, r4, r1
	movs r1, 0
	strb r1, [r0]
	ldr r2, _080F4D80 @ =0x00008fe7
	adds r0, r4, r2
	strb r1, [r0]
	bl sub_80F492C
	ldr r0, _080F4D84 @ =0x00006dac
	adds r4, r0
	ldrb r0, [r4]
	cmp r0, 0
	bne _080F4D70
_080F4D66:
	bl sub_80F4D88
	lsls r0, 24
	cmp r0, 0
	bne _080F4D66
_080F4D70:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F4D78: .4byte gUnknown_083DFEC4
_080F4D7C: .4byte 0x00008fe6
_080F4D80: .4byte 0x00008fe7
_080F4D84: .4byte 0x00006dac
	thumb_func_end sub_80F4D44

	thumb_func_start sub_80F4D88
sub_80F4D88: @ 80F4D88
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r6, _080F4E98 @ =gUnknown_083DFEC4
	ldr r4, [r6]
	ldr r1, _080F4E9C @ =0x00008fe6
	adds r0, r4, r1
	ldrb r3, [r0]
	cmp r3, 0xE
	bne _080F4DA4
	b _080F4EB8
_080F4DA4:
	cmp r3, 0xF
	bne _080F4DAA
	b _080F4F60
_080F4DAA:
	movs r1, 0x80
	lsls r1, 23
	ldr r0, [sp]
	orrs r0, r1
	str r0, [sp]
	movs r7, 0
	mov r10, r6
	ldr r2, _080F4E9C @ =0x00008fe6
	adds r6, r4, r2
	ldr r3, _080F4EA0 @ =0x00008fe7
	adds r5, r4, r3
	ldr r0, _080F4EA4 @ =0x000087d8
	adds r0, r4
	mov r9, r0
	ldr r1, _080F4EA8 @ =gPokemonStorage + 0x4
	mov r8, r1
_080F4DCA:
	ldrb r0, [r6]
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldrb r2, [r5]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	add r1, r8
	adds r0, r1
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	beq _080F4E60
	ldrb r0, [r6]
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldrb r2, [r5]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	add r1, r8
	adds r0, r1
	movs r1, 0x2D
	bl GetBoxMonData
	cmp r0, 0
	bne _080F4E60
	ldrb r1, [r6]
	lsls r1, 8
	ldr r2, _080F4EAC @ =0xffff00ff
	ldr r0, [sp]
	ands r0, r2
	orrs r0, r1
	str r0, [sp]
	ldrb r2, [r5]
	movs r1, 0x1F
	ands r2, r1
	lsls r2, 16
	ldr r1, _080F4EB0 @ =0xffe0ffff
	ands r0, r1
	orrs r0, r2
	str r0, [sp]
	ldrb r0, [r6]
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldrb r2, [r5]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	add r1, r8
	adds r0, r1
	mov r2, r9
	ldrb r1, [r2]
	bl GetBoxMonData
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080F4EB4 @ =0xffffff00
	ldr r1, [sp]
	ands r1, r2
	orrs r1, r0
	str r1, [sp]
	mov r0, sp
	bl sub_80F4944
_080F4E60:
	mov r3, r10
	ldr r1, [r3]
	ldr r0, _080F4EA0 @ =0x00008fe7
	adds r2, r1, r0
	ldrb r0, [r2]
	adds r0, 0x1
	movs r4, 0
	strb r0, [r2]
	movs r3, 0xFF
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1E
	bne _080F4E8C
	strb r4, [r2]
	ldr r2, _080F4E9C @ =0x00008fe6
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ands r0, r3
	cmp r0, 0xE
	beq _080F4F64
_080F4E8C:
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0xE
	bls _080F4DCA
	b _080F4F64
	.align 2, 0
_080F4E98: .4byte gUnknown_083DFEC4
_080F4E9C: .4byte 0x00008fe6
_080F4EA0: .4byte 0x00008fe7
_080F4EA4: .4byte 0x000087d8
_080F4EA8: .4byte gPokemonStorage + 0x4
_080F4EAC: .4byte 0xffff00ff
_080F4EB0: .4byte 0xffe0ffff
_080F4EB4: .4byte 0xffffff00
_080F4EB8:
	mov r2, sp
	ldrb r0, [r2, 0x3]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2, 0x3]
	strb r3, [r2, 0x1]
	movs r7, 0
	ldr r3, _080F4F44 @ =0x00008828
	adds r0, r4, r3
	ldrb r0, [r0]
	cmp r7, r0
	bcs _080F4F24
	mov r5, sp
	mov r8, r6
	adds r6, r4, r3
_080F4ED6:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _080F4F48 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _080F4F18
	movs r0, 0x1F
	adds r2, r7, 0
	ands r2, r0
	ldrb r0, [r5, 0x2]
	movs r3, 0x20
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, 0x2]
	mov r1, r8
	ldr r0, [r1]
	ldr r2, _080F4F4C @ =0x000087d8
	adds r0, r2
	ldrb r1, [r0]
	adds r0, r4, 0
	bl GetMonData
	strb r0, [r5]
	mov r0, sp
	bl sub_80F4944
_080F4F18:
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	ldrb r3, [r6]
	cmp r7, r3
	bcc _080F4ED6
_080F4F24:
	bl sub_80F49F4
	ldr r0, _080F4F50 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _080F4F54 @ =0x00008fe4
	adds r0, r1, r2
	ldrh r2, [r0]
	ldr r3, _080F4F58 @ =0x000087da
	adds r0, r1, r3
	strh r2, [r0]
	ldr r0, _080F4F5C @ =0x00008fe6
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080F4F64
	.align 2, 0
_080F4F44: .4byte 0x00008828
_080F4F48: .4byte gPlayerParty
_080F4F4C: .4byte 0x000087d8
_080F4F50: .4byte gUnknown_083DFEC4
_080F4F54: .4byte 0x00008fe4
_080F4F58: .4byte 0x000087da
_080F4F5C: .4byte 0x00008fe6
_080F4F60:
	movs r0, 0
	b _080F4F66
_080F4F64:
	movs r0, 0x1
_080F4F66:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80F4D88

	thumb_func_start sub_80F4F78
sub_80F4F78: @ 80F4F78
	push {lr}
	ldr r0, _080F4FA4 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _080F4FA8 @ =0x00009040
	adds r0, r1, r2
	ldr r3, _080F4FAC @ =0x00008fe9
	adds r2, r1, r3
	movs r3, 0
	ldrsb r3, [r2, r3]
	lsls r2, r3, 2
	adds r2, r3
	lsls r2, 2
	ldr r3, _080F4FB0 @ =0x00009004
	adds r2, r3
	adds r1, r2
	bl sub_80F53EC
	bl sub_80F5504
	pop {r0}
	bx r0
	.align 2, 0
_080F4FA4: .4byte gUnknown_083DFEC4
_080F4FA8: .4byte 0x00009040
_080F4FAC: .4byte 0x00008fe9
_080F4FB0: .4byte 0x00009004
	thumb_func_end sub_80F4F78

	thumb_func_start sub_80F4FB4
sub_80F4FB4: @ 80F4FB4
	push {r4,lr}
	bl sub_80F5504
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80F170C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	cmp r4, 0
	bne _080F4FD2
	cmp r0, 0
	beq _080F4FD4
_080F4FD2:
	movs r1, 0x1
_080F4FD4:
	adds r0, r1, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80F4FB4

	thumb_func_start sub_80F4FDC
sub_80F4FDC: @ 80F4FDC
	push {lr}
	ldr r0, _080F5020 @ =gUnknown_083DFEC4
	ldr r2, [r0]
	ldr r1, _080F5024 @ =0x000076aa
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F4FFE
	ldr r3, _080F5028 @ =0x000087dc
	adds r0, r2, r3
	movs r3, 0
	ldrsh r1, [r0, r3]
	ldr r3, _080F502C @ =0x00008828
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r1, r0
	beq _080F501A
_080F4FFE:
	ldr r1, _080F5030 @ =0x00008fe9
	adds r0, r2, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	ldr r3, _080F5034 @ =0x00009004
	adds r0, r3
	adds r0, r2, r0
	adds r3, 0x3C
	adds r1, r2, r3
	bl sub_80F53EC
_080F501A:
	pop {r0}
	bx r0
	.align 2, 0
_080F5020: .4byte gUnknown_083DFEC4
_080F5024: .4byte 0x000076aa
_080F5028: .4byte 0x000087dc
_080F502C: .4byte 0x00008828
_080F5030: .4byte 0x00008fe9
_080F5034: .4byte 0x00009004
	thumb_func_end sub_80F4FDC

	thumb_func_start sub_80F5038
sub_80F5038: @ 80F5038
	push {r4,lr}
	bl sub_80F5504
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80F173C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	cmp r4, 0
	bne _080F5056
	cmp r0, 0
	beq _080F5058
_080F5056:
	movs r1, 0x1
_080F5058:
	adds r0, r1, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80F5038

	thumb_func_start sub_80F5060
sub_80F5060: @ 80F5060
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0
	beq _080F507C
	ldr r0, _080F5074 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F5078 @ =0x00008feb
	adds r0, r1
	b _080F5084
	.align 2, 0
_080F5074: .4byte gUnknown_083DFEC4
_080F5078: .4byte 0x00008feb
_080F507C:
	ldr r0, _080F50FC @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080F5100 @ =0x00008fea
	adds r0, r2
_080F5084:
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _080F50FC @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r3, _080F5104 @ =0x00008fe9
	adds r5, r4, r3
	movs r1, 0
	ldrsb r1, [r5, r1]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	ldr r2, _080F5108 @ =0x00009004
	adds r0, r2
	adds r0, r4, r0
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 2
	adds r1, r2
	adds r1, r4, r1
	bl sub_80F53EC
	ldr r0, _080F510C @ =0x000087dc
	adds r3, r4, r0
	movs r1, 0
	ldrsh r0, [r3, r1]
	lsls r0, 2
	adds r0, r4, r0
	ldr r2, _080F5110 @ =0x0000893f
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 25
	lsrs r0, 31
	mov r12, r0
	cmp r7, 0
	beq _080F5158
	ldr r7, _080F5100 @ =0x00008fea
	adds r1, r4, r7
	ldrb r0, [r1]
	adds r7, 0x1
	adds r2, r4, r7
	strb r0, [r2]
	ldrb r0, [r5]
	strb r0, [r1]
	strb r6, [r5]
	ldrb r1, [r2]
	ldr r2, _080F5114 @ =0x00008fec
	adds r0, r4, r2
	strb r1, [r0]
	adds r5, r4, 0
	ldrh r1, [r3]
	movs r7, 0
	ldrsh r0, [r3, r7]
	cmp r0, 0
	beq _080F5118
	subs r2, r1, 0x1
	b _080F5120
	.align 2, 0
_080F50FC: .4byte gUnknown_083DFEC4
_080F5100: .4byte 0x00008fea
_080F5104: .4byte 0x00008fe9
_080F5108: .4byte 0x00009004
_080F510C: .4byte 0x000087dc
_080F5110: .4byte 0x0000893f
_080F5114: .4byte 0x00008fec
_080F5118:
	ldr r1, _080F513C @ =0x000087da
	adds r0, r4, r1
	ldrh r0, [r0]
	subs r2, r0, 0x1
_080F5120:
	ldr r1, _080F5140 @ =0x000087dc
	adds r0, r5, r1
	strh r2, [r0]
	ldr r2, _080F5144 @ =gUnknown_083DFEC4
	ldr r3, [r2]
	adds r1, r3, r1
	ldrh r4, [r1]
	movs r5, 0
	ldrsh r0, [r1, r5]
	cmp r0, 0
	beq _080F5148
	subs r1, r4, 0x1
	b _080F51CE
	.align 2, 0
_080F513C: .4byte 0x000087da
_080F5140: .4byte 0x000087dc
_080F5144: .4byte gUnknown_083DFEC4
_080F5148:
	ldr r7, _080F5154 @ =0x000087da
	adds r0, r3, r7
	ldrh r0, [r0]
	subs r1, r0, 0x1
	b _080F51CE
	.align 2, 0
_080F5154: .4byte 0x000087da
_080F5158:
	ldr r7, _080F518C @ =0x00008feb
	adds r1, r4, r7
	ldrb r0, [r1]
	subs r7, 0x1
	adds r2, r4, r7
	strb r0, [r2]
	ldrb r0, [r5]
	strb r0, [r1]
	strb r6, [r5]
	ldrb r1, [r2]
	ldr r2, _080F5190 @ =0x00008fec
	adds r0, r4, r2
	strb r1, [r0]
	adds r2, r4, 0
	movs r4, 0
	ldrsh r1, [r3, r4]
	ldr r5, _080F5194 @ =0x000087da
	adds r0, r2, r5
	movs r7, 0
	ldrsh r0, [r0, r7]
	subs r0, 0x1
	cmp r1, r0
	bge _080F5198
	ldrh r0, [r3]
	adds r3, r0, 0x1
	b _080F519A
	.align 2, 0
_080F518C: .4byte 0x00008feb
_080F5190: .4byte 0x00008fec
_080F5194: .4byte 0x000087da
_080F5198:
	movs r3, 0
_080F519A:
	ldr r1, _080F51C0 @ =0x000087dc
	adds r0, r2, r1
	strh r3, [r0]
	ldr r2, _080F51C4 @ =gUnknown_083DFEC4
	ldr r3, [r2]
	adds r4, r3, r1
	movs r0, 0
	ldrsh r1, [r4, r0]
	ldr r5, _080F51C8 @ =0x000087da
	adds r0, r3, r5
	movs r7, 0
	ldrsh r0, [r0, r7]
	subs r0, 0x1
	cmp r1, r0
	bge _080F51CC
	ldrh r0, [r4]
	adds r1, r0, 0x1
	b _080F51CE
	.align 2, 0
_080F51C0: .4byte 0x000087dc
_080F51C4: .4byte gUnknown_083DFEC4
_080F51C8: .4byte 0x000087da
_080F51CC:
	movs r1, 0
_080F51CE:
	ldr r4, _080F51FC @ =0x00008fee
	adds r0, r3, r4
	strh r1, [r0]
	ldr r1, [r2]
	ldr r5, _080F5200 @ =0x000087dc
	adds r0, r1, r5
	movs r7, 0
	ldrsh r0, [r0, r7]
	lsls r0, 2
	adds r0, r1, r0
	ldr r3, _080F5204 @ =0x0000893f
	adds r0, r3
	ldrb r0, [r0]
	lsls r0, 25
	lsrs r0, 31
	mov r4, r12
	cmp r4, 0
	bne _080F520C
	adds r5, 0x4
	adds r1, r5
	ldr r0, _080F5208 @ =sub_80F5264
	b _080F5226
	.align 2, 0
_080F51FC: .4byte 0x00008fee
_080F5200: .4byte 0x000087dc
_080F5204: .4byte 0x0000893f
_080F5208: .4byte sub_80F5264
_080F520C:
	cmp r0, 0
	bne _080F5220
	ldr r7, _080F5218 @ =0x000087e0
	adds r1, r7
	ldr r0, _080F521C @ =sub_80F52F8
	b _080F5226
	.align 2, 0
_080F5218: .4byte 0x000087e0
_080F521C: .4byte sub_80F52F8
_080F5220:
	ldr r0, _080F5238 @ =0x000087e0
	adds r1, r0
	ldr r0, _080F523C @ =sub_80F5364
_080F5226:
	str r0, [r1]
	ldr r0, [r2]
	ldr r1, _080F5240 @ =0x000087de
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F5238: .4byte 0x000087e0
_080F523C: .4byte sub_80F5364
_080F5240: .4byte 0x000087de
	thumb_func_end sub_80F5060

	thumb_func_start gpu_sync_bg_show
gpu_sync_bg_show: @ 80F5244
	push {lr}
	ldr r0, _080F525C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F5260 @ =0x000087e0
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080F525C: .4byte gUnknown_083DFEC4
_080F5260: .4byte 0x000087e0
	thumb_func_end gpu_sync_bg_show

	thumb_func_start sub_80F5264
sub_80F5264: @ 80F5264
	push {r4,r5,lr}
	ldr r0, _080F5280 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F5284 @ =0x000087de
	adds r5, r0, r1
	ldrb r1, [r5]
	cmp r1, 0x1
	beq _080F52AA
	cmp r1, 0x1
	bgt _080F5288
	cmp r1, 0
	beq _080F528E
	b _080F52F0
	.align 2, 0
_080F5280: .4byte gUnknown_083DFEC4
_080F5284: .4byte 0x000087de
_080F5288:
	cmp r1, 0x2
	beq _080F52EC
	b _080F52F0
_080F528E:
	ldr r2, _080F52D8 @ =0x00008fe9
	adds r4, r0, r2
	ldrb r0, [r4]
	bl sub_80F2E18
	movs r0, 0
	ldrsb r0, [r4, r0]
	lsls r0, 16
	lsrs r0, 16
	bl sub_80F01E0
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
_080F52AA:
	bl sub_80F4FB4
	lsls r0, 24
	cmp r0, 0
	bne _080F52F0
	ldr r0, _080F52DC @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r1, _080F52E0 @ =0x00008fee
	adds r0, r4, r1
	movs r2, 0
	ldrsh r0, [r0, r2]
	ldr r2, _080F52E4 @ =0x00008fec
	adds r1, r4, r2
	ldrb r1, [r1]
	bl sub_80F4900
	ldr r0, _080F52E8 @ =0x000087de
	adds r4, r0
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _080F52F0
	.align 2, 0
_080F52D8: .4byte 0x00008fe9
_080F52DC: .4byte gUnknown_083DFEC4
_080F52E0: .4byte 0x00008fee
_080F52E4: .4byte 0x00008fec
_080F52E8: .4byte 0x000087de
_080F52EC:
	movs r0, 0
	b _080F52F2
_080F52F0:
	movs r0, 0x1
_080F52F2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80F5264

	thumb_func_start sub_80F52F8
sub_80F52F8: @ 80F52F8
	push {r4,r5,lr}
	ldr r0, _080F5310 @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r0, _080F5314 @ =0x000087de
	adds r5, r4, r0
	ldrb r0, [r5]
	cmp r0, 0
	beq _080F5318
	cmp r0, 0x1
	beq _080F5358
	b _080F535C
	.align 2, 0
_080F5310: .4byte gUnknown_083DFEC4
_080F5314: .4byte 0x000087de
_080F5318:
	bl sub_80F5038
	lsls r0, 24
	cmp r0, 0
	bne _080F535C
	ldr r1, _080F5350 @ =0x00008fe9
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 16
	lsrs r0, 16
	bl sub_80F01E0
	ldr r2, _080F5354 @ =0x00008fee
	adds r0, r4, r2
	movs r1, 0
	ldrsh r0, [r0, r1]
	subs r2, 0x2
	adds r1, r4, r2
	ldrb r1, [r1]
	bl sub_80F4900
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	b _080F535C
	.align 2, 0
_080F5350: .4byte 0x00008fe9
_080F5354: .4byte 0x00008fee
_080F5358:
	movs r0, 0
	b _080F535E
_080F535C:
	movs r0, 0x1
_080F535E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80F52F8

	thumb_func_start sub_80F5364
sub_80F5364: @ 80F5364
	push {r4,r5,lr}
	ldr r0, _080F5380 @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r0, _080F5384 @ =0x000087de
	adds r5, r4, r0
	ldrb r0, [r5]
	cmp r0, 0x1
	beq _080F53B8
	cmp r0, 0x1
	bgt _080F5388
	cmp r0, 0
	beq _080F538E
	b _080F53E4
	.align 2, 0
_080F5380: .4byte gUnknown_083DFEC4
_080F5384: .4byte 0x000087de
_080F5388:
	cmp r0, 0x2
	beq _080F53CA
	b _080F53E4
_080F538E:
	bl sub_80F5504
	bl sub_80F173C
	lsls r0, 24
	cmp r0, 0
	bne _080F53E4
	ldr r1, _080F53B4 @ =0x00008fe9
	adds r4, r1
	ldrb r0, [r4]
	bl sub_80F2E18
	movs r0, 0
	ldrsb r0, [r4, r0]
	lsls r0, 16
	lsrs r0, 16
	bl sub_80F01E0
	b _080F53C2
	.align 2, 0
_080F53B4: .4byte 0x00008fe9
_080F53B8:
	bl sub_80F4FB4
	lsls r0, 24
	cmp r0, 0
	bne _080F53E4
_080F53C2:
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	b _080F53E4
_080F53CA:
	ldr r2, _080F53E0 @ =0x00008fee
	adds r0, r4, r2
	movs r1, 0
	ldrsh r0, [r0, r1]
	subs r2, 0x2
	adds r1, r4, r2
	ldrb r1, [r1]
	bl sub_80F4900
	movs r0, 0
	b _080F53E6
	.align 2, 0
_080F53E0: .4byte 0x00008fee
_080F53E4:
	movs r0, 0x1
_080F53E6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80F5364

	thumb_func_start sub_80F53EC
sub_80F53EC: @ 80F53EC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	str r0, [sp]
	mov r9, r1
	movs r7, 0
	ldr r0, _080F54F4 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	str r0, [sp, 0x4]
_080F5404:
	lsls r4, r7, 2
	ldr r1, [sp]
	adds r0, r4, r1
	ldrh r1, [r0]
	lsls r5, r1, 8
	mov r2, r9
	adds r0, r4, r2
	ldrh r0, [r0]
	subs r0, r1
	lsls r0, 8
	movs r1, 0xA
	bl __divsi3
	adds r6, r0, 0
	movs r3, 0
	adds r7, 0x1
	mov r10, r7
	mov r8, r4
_080F5428:
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 2
	add r0, r8
	ldr r7, [sp, 0x4]
	adds r0, r7, r0
	asrs r2, r5, 8
	asrs r1, r5, 7
	movs r7, 0x1
	ands r1, r7
	adds r2, r1
	ldr r1, _080F54F8 @ =0x00009054
	adds r0, r1
	strh r2, [r0]
	adds r5, r6
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x8
	bls _080F5428
	ldr r2, _080F54F4 @ =gUnknown_083DFEC4
	ldr r1, [r2]
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 2
	adds r0, r4, r0
	adds r1, r0
	mov r3, r9
	adds r2, r4, r3
	ldrh r0, [r2]
	ldr r7, _080F54F8 @ =0x00009054
	adds r1, r7
	strh r0, [r1]
	ldr r1, [sp]
	adds r0, r4, r1
	ldrh r1, [r0, 0x2]
	lsls r5, r1, 8
	ldrh r0, [r2, 0x2]
	subs r0, r1
	lsls r0, 8
	movs r1, 0xA
	bl __divsi3
	adds r6, r0, 0
	movs r3, 0
	ldr r0, _080F54F4 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	mov r12, r0
	str r4, [sp, 0x8]
	movs r2, 0x1
	mov r8, r2
_080F548E:
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 2
	ldr r7, [sp, 0x8]
	adds r0, r7, r0
	add r0, r12
	asrs r2, r5, 8
	asrs r1, r5, 7
	mov r7, r8
	ands r1, r7
	adds r2, r1
	ldr r1, _080F54FC @ =0x00009056
	adds r0, r1
	strh r2, [r0]
	adds r5, r6
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x8
	bls _080F548E
	ldr r7, _080F54F4 @ =gUnknown_083DFEC4
	ldr r2, [r7]
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 2
	adds r0, r4, r0
	adds r0, r2, r0
	mov r3, r9
	adds r1, r4, r3
	ldrh r1, [r1, 0x2]
	ldr r7, _080F54FC @ =0x00009056
	adds r0, r7
	strh r1, [r0]
	mov r1, r10
	lsls r0, r1, 16
	lsrs r7, r0, 16
	cmp r7, 0x4
	bls _080F5404
	ldr r3, _080F5500 @ =0x00009342
	adds r1, r2, r3
	movs r0, 0
	strh r0, [r1]
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F54F4: .4byte gUnknown_083DFEC4
_080F54F8: .4byte 0x00009054
_080F54FC: .4byte 0x00009056
_080F5500: .4byte 0x00009342
	thumb_func_end sub_80F53EC

	thumb_func_start sub_80F5504
sub_80F5504: @ 80F5504
	push {r4,lr}
	ldr r0, _080F551C @ =gUnknown_083DFEC4
	ldr r2, [r0]
	ldr r0, _080F5520 @ =0x00009342
	adds r4, r2, r0
	ldrh r0, [r4]
	adds r1, r0, 0
	cmp r1, 0x9
	bls _080F5524
	movs r0, 0
	b _080F5544
	.align 2, 0
_080F551C: .4byte gUnknown_083DFEC4
_080F5520: .4byte 0x00009342
_080F5524:
	adds r0, 0x1
	strh r0, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F554C @ =0x00009054
	adds r0, r1
	adds r0, r2, r0
	bl sub_80F556C
	ldrh r1, [r4]
	movs r0, 0xA
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
_080F5544:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F554C: .4byte 0x00009054
	thumb_func_end sub_80F5504

	thumb_func_start sub_80F5550
sub_80F5550: @ 80F5550
	push {lr}
	bl sub_80F53EC
	pop {r0}
	bx r0
	thumb_func_end sub_80F5550

	thumb_func_start sub_80F555C
sub_80F555C: @ 80F555C
	push {lr}
	bl sub_80F5504
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80F555C

	thumb_func_start sub_80F556C
sub_80F556C: @ 80F556C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r2, 0
	ldr r5, _080F55A0 @ =gUnknown_083DFEC4
	ldr r0, [r5]
	ldr r1, _080F55A4 @ =0x0000911c
	adds r3, r0, r1
_080F557A:
	lsls r0, r2, 2
	adds r1, r3, r0
	adds r0, r4
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x4
	bls _080F557A
	ldr r0, [r5]
	ldr r1, _080F55A8 @ =0x00009344
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F55A0: .4byte gUnknown_083DFEC4
_080F55A4: .4byte 0x0000911c
_080F55A8: .4byte 0x00009344
	thumb_func_end sub_80F556C

	thumb_func_start sub_80F55AC
sub_80F55AC: @ 80F55AC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r6, r0, 0
	mov r8, r1
	ldr r1, _080F5674 @ =gUnknown_083E4890
	ldrb r0, [r6]
	adds r0, r1
	ldrb r2, [r0]
	adds r6, 0x1
	movs r0, 0x9B
	mov r3, r8
	strh r0, [r3]
	movs r0, 0x5B
	subs r0, r2
	strh r0, [r3, 0x2]
	movs r7, 0x40
	movs r0, 0
	mov r12, r0
	movs r2, 0x1
	mov r9, r2
	ldr r3, _080F5678 @ =gSineTable
	mov r10, r3
_080F55DE:
	adds r0, r7, 0
	adds r0, 0x33
	lsls r0, 24
	lsrs r7, r0, 24
	mov r1, r12
	lsls r0, r1, 24
	movs r2, 0xFF
	lsls r2, 24
	adds r0, r2
	lsrs r3, r0, 24
	mov r12, r3
	cmp r0, 0
	bge _080F55FC
	movs r0, 0x4
	mov r12, r0
_080F55FC:
	mov r1, r12
	lsls r0, r1, 24
	asrs r4, r0, 24
	cmp r4, 0x2
	bne _080F560C
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_080F560C:
	ldrb r0, [r6]
	ldr r2, _080F5674 @ =gUnknown_083E4890
	adds r0, r2
	ldrb r2, [r0]
	adds r6, 0x1
	lsls r0, r4, 2
	mov r1, r8
	adds r3, r0, r1
	adds r0, r7, 0
	adds r0, 0x40
	lsls r0, 1
	add r0, r10
	movs r1, 0
	ldrsh r0, [r0, r1]
	muls r0, r2
	asrs r5, r0, 8
	adds r0, r5, 0
	adds r0, 0x9B
	strh r0, [r3]
	lsls r0, r7, 1
	add r0, r10
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r1, r2, 0
	muls r1, r0
	asrs r1, 8
	movs r0, 0x5B
	subs r0, r1
	strh r0, [r3, 0x2]
	cmp r4, 0x2
	bgt _080F5658
	cmp r2, 0x20
	bne _080F5652
	cmp r4, 0x2
	beq _080F5658
_080F5652:
	adds r0, r5, 0
	adds r0, 0x9C
	strh r0, [r3]
_080F5658:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	cmp r0, 0x4
	bls _080F55DE
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F5674: .4byte gUnknown_083E4890
_080F5678: .4byte gSineTable
	thumb_func_end sub_80F55AC

	thumb_func_start sub_80F567C
sub_80F567C: @ 80F567C
	push {lr}
	bl sub_80F55AC
	pop {r0}
	bx r0
	thumb_func_end sub_80F567C

	thumb_func_start sub_80F5688
sub_80F5688: @ 80F5688
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	adds r6, r0, 0
	adds r5, r1, 0
	str r2, [sp]
	ldr r7, [sp, 0x34]
	lsls r3, 24
	lsrs r3, 24
	mov r9, r3
	movs r0, 0
	str r0, [sp, 0x8]
	ldrh r0, [r5, 0x2]
	ldrh r1, [r2, 0x2]
	cmp r0, r1
	bcs _080F56D0
	adds r2, r0, 0
	str r2, [sp, 0x4]
	ldr r3, [sp]
	ldrh r0, [r3, 0x2]
	ldrh r1, [r5]
	lsls r4, r1, 10
	ldrh r2, [r3]
	mov r10, r2
	ldr r3, [sp, 0x4]
	subs r0, r3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r0, 0
	beq _080F56FC
	subs r0, r2, r1
	b _080F56F2
_080F56D0:
	ldrh r0, [r5, 0x2]
	ldr r1, [sp]
	ldrh r1, [r1, 0x2]
	str r1, [sp, 0x4]
	ldr r2, [sp]
	ldrh r1, [r2]
	lsls r4, r1, 10
	ldrh r3, [r5]
	mov r10, r3
	ldr r2, [sp, 0x4]
	subs r0, r2
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r0, 0
	beq _080F56FC
	subs r0, r3, r1
_080F56F2:
	lsls r0, 10
	mov r1, r8
	bl __divsi3
	str r0, [sp, 0x8]
_080F56FC:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r7, 0
	bne _080F5746
	ldr r0, [sp, 0x4]
	subs r0, 0x38
	lsls r0, 2
	adds r6, r0
	movs r5, 0
	mov r3, r9
	lsls r3, 1
	mov r12, r3
	mov r0, r10
	add r0, r9
	str r0, [sp, 0xC]
	cmp r7, r8
	bcs _080F57D4
	movs r7, 0x1
_080F5726:
	adds r2, r3, r6
	asrs r1, r4, 10
	asrs r0, r4, 9
	ands r0, r7
	adds r1, r0
	add r1, r9
	strh r1, [r2]
	ldr r1, [sp, 0x8]
	adds r4, r1
	adds r6, 0x4
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r8
	bcc _080F5726
	b _080F57D4
_080F5746:
	ldr r2, [sp, 0x8]
	cmp r2, 0
	ble _080F57E4
	ldr r0, [sp, 0x4]
	subs r0, 0x38
	lsls r0, 2
	adds r7, r0
	movs r5, 0
	mov r3, r9
	lsls r3, 1
	mov r12, r3
	mov r0, r10
	add r0, r9
	str r0, [sp, 0xC]
	cmp r5, r8
	bcs _080F5798
	ldr r0, _080F57D8 @ =0x00026bff
	cmp r4, r0
	bgt _080F5798
	mov r1, r12
	str r1, [sp, 0x10]
	mov r10, r0
_080F5772:
	ldr r3, [sp, 0x10]
	adds r2, r3, r7
	asrs r1, r4, 10
	asrs r0, r4, 9
	movs r3, 0x1
	ands r0, r3
	adds r1, r0
	add r1, r9
	strh r1, [r2]
	ldr r0, [sp, 0x8]
	adds r4, r0
	adds r7, 0x4
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r8
	bcs _080F5798
	cmp r4, r10
	ble _080F5772
_080F5798:
	ldr r1, _080F57DC @ =gUnknown_083DFEC4
	ldr r0, [r1]
	ldr r2, [sp, 0x4]
	adds r1, r2, r5
	ldr r3, _080F57E0 @ =0x00009340
	adds r0, r3
	strh r1, [r0]
	ldrh r0, [r0]
	subs r0, 0x38
	lsls r0, 2
	adds r6, r0
	cmp r5, r8
	bcs _080F57D4
	mov r3, r12
	movs r7, 0x1
_080F57B6:
	adds r2, r3, r6
	asrs r1, r4, 10
	asrs r0, r4, 9
	ands r0, r7
	adds r1, r0
	add r1, r9
	strh r1, [r2]
	ldr r0, [sp, 0x8]
	adds r4, r0
	adds r6, 0x4
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r8
	bcc _080F57B6
_080F57D4:
	subs r0, r6, 0x4
	b _080F58C4
	.align 2, 0
_080F57D8: .4byte 0x00026bff
_080F57DC: .4byte gUnknown_083DFEC4
_080F57E0: .4byte 0x00009340
_080F57E4:
	ldr r1, [sp, 0x8]
	cmp r1, 0
	bge _080F5890
	ldr r0, [sp, 0x4]
	subs r0, 0x38
	lsls r0, 2
	adds r6, r0
	movs r5, 0
	mov r2, r9
	lsls r2, 1
	mov r12, r2
	mov r3, r10
	add r3, r9
	str r3, [sp, 0xC]
	cmp r5, r8
	bcs _080F5842
	adds r3, r2, r6
	asrs r1, r4, 10
	asrs r0, r4, 9
	movs r2, 0x1
	ands r0, r2
	adds r1, r0
	add r1, r9
	strh r1, [r3]
	b _080F5838
_080F5816:
	ldr r0, [sp, 0x8]
	adds r4, r0
	adds r6, 0x4
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r8
	bcs _080F5842
	mov r1, r12
	adds r3, r1, r6
	asrs r2, r4, 10
	asrs r0, r4, 9
	movs r1, 0x1
	ands r0, r1
	adds r2, r0
	add r2, r9
	strh r2, [r3]
_080F5838:
	ldr r0, _080F5884 @ =0x00026bff
	cmp r4, r0
	bgt _080F5816
	movs r0, 0x9B
	strh r0, [r3]
_080F5842:
	ldr r2, _080F5888 @ =gUnknown_083DFEC4
	ldr r0, [r2]
	ldr r3, [sp, 0x4]
	adds r1, r3, r5
	ldr r2, _080F588C @ =0x00009340
	adds r0, r2
	strh r1, [r0]
	ldrh r0, [r0]
	subs r0, 0x38
	lsls r0, 2
	adds r7, r0
	cmp r5, r8
	bcs _080F587E
	mov r3, r12
	movs r6, 0x1
_080F5860:
	adds r2, r3, r7
	asrs r1, r4, 10
	asrs r0, r4, 9
	ands r0, r6
	adds r1, r0
	add r1, r9
	strh r1, [r2]
	ldr r0, [sp, 0x8]
	adds r4, r0
	adds r7, 0x4
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r8
	bcc _080F5860
_080F587E:
	subs r0, r7, 0x4
	b _080F58C4
	.align 2, 0
_080F5884: .4byte 0x00026bff
_080F5888: .4byte gUnknown_083DFEC4
_080F588C: .4byte 0x00009340
_080F5890:
	ldr r0, _080F58BC @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F58C0 @ =0x00009340
	adds r0, r1
	mov r2, sp
	ldrh r2, [r2, 0x4]
	strh r2, [r0]
	ldr r0, [sp, 0x4]
	subs r0, 0x38
	lsls r0, 2
	adds r6, r0
	adds r7, r0
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r6, 0x2]
	ldr r3, [sp]
	ldrh r0, [r3]
	strh r0, [r7]
	movs r0, 0x9B
	strh r0, [r7, 0x2]
	b _080F58CC
	.align 2, 0
_080F58BC: .4byte gUnknown_083DFEC4
_080F58C0: .4byte 0x00009340
_080F58C4:
	add r0, r12
	mov r1, sp
	ldrh r1, [r1, 0xC]
	strh r1, [r0]
_080F58CC:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80F5688

	thumb_func_start sub_80F58DC
sub_80F58DC: @ 80F58DC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r0, [r5, 0x2]
	ldrh r1, [r5, 0x6]
	cmp r0, r1
	bcs _080F5914
	adds r4, r0, 0
	mov r8, r4
	ldr r0, _080F590C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F5910 @ =0x00009130
	adds r0, r1
	adds r4, r5, 0x4
	movs r1, 0
	str r1, [sp]
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0x1
	bl sub_80F5688
	b _080F5930
	.align 2, 0
_080F590C: .4byte gUnknown_083DFEC4
_080F5910: .4byte 0x00009130
_080F5914:
	ldrh r4, [r5, 0x6]
	mov r8, r4
	ldr r0, _080F5A08 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F5A0C @ =0x00009130
	adds r0, r1
	adds r4, r5, 0x4
	movs r1, 0
	str r1, [sp]
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0
	bl sub_80F5688
_080F5930:
	adds r1, r4, 0
	ldr r0, _080F5A08 @ =gUnknown_083DFEC4
	ldr r6, [r0]
	ldr r0, _080F5A0C @ =0x00009130
	adds r4, r6, r0
	adds r7, r5, 0
	adds r7, 0x8
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	adds r2, r7, 0
	movs r3, 0x1
	bl sub_80F5688
	movs r3, 0
	ldrh r0, [r5, 0xA]
	ldrh r1, [r5, 0xE]
	cmp r0, r1
	bhi _080F5958
	movs r3, 0x1
_080F5958:
	adds r2, r5, 0
	adds r2, 0xC
	ldr r1, _080F5A10 @ =0x00009238
	adds r0, r6, r1
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r7, 0
	bl sub_80F5688
	movs r2, 0x38
	cmp r2, r8
	bcs _080F5990
	adds r7, r4, 0
	movs r3, 0
	ldr r0, _080F5A14 @ =0x00009132
	adds r4, r6, r0
_080F5978:
	adds r0, r2, 0
	subs r0, 0x38
	lsls r0, 2
	adds r1, r7, r0
	strh r3, [r1]
	adds r0, r4, r0
	strh r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r8
	bcc _080F5978
_080F5990:
	ldrh r2, [r5, 0x2]
	ldr r0, _080F5A08 @ =gUnknown_083DFEC4
	ldr r3, [r0]
	ldr r4, _080F5A18 @ =0x00009340
	adds r1, r3, r4
	adds r6, r0, 0
	ldrh r0, [r1]
	cmp r2, r0
	bhi _080F59BE
	ldr r4, _080F5A0C @ =0x00009130
	adds r3, r4
	movs r4, 0x9B
_080F59A8:
	adds r0, r2, 0
	subs r0, 0x38
	lsls r0, 2
	adds r0, r3, r0
	strh r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r1]
	cmp r2, r0
	bls _080F59A8
_080F59BE:
	ldr r4, [r6]
	ldr r1, _080F5A18 @ =0x00009340
	adds r0, r4, r1
	ldrh r0, [r0]
	ldrh r1, [r5, 0xA]
	cmp r0, r1
	bcs _080F59CE
	adds r0, r1, 0
_080F59CE:
	adds r0, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x79
	bhi _080F59FA
	ldr r0, _080F5A0C @ =0x00009130
	adds r5, r4, r0
	movs r3, 0
	ldr r1, _080F5A14 @ =0x00009132
	adds r4, r1
_080F59E2:
	adds r0, r2, 0
	subs r0, 0x38
	lsls r0, 2
	adds r1, r5, r0
	strh r3, [r1]
	adds r0, r4, r0
	strh r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x79
	bls _080F59E2
_080F59FA:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F5A08: .4byte gUnknown_083DFEC4
_080F5A0C: .4byte 0x00009130
_080F5A10: .4byte 0x00009238
_080F5A14: .4byte 0x00009132
_080F5A18: .4byte 0x00009340
	thumb_func_end sub_80F58DC

	thumb_func_start sub_80F5A1C
sub_80F5A1C: @ 80F5A1C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r0, [r5, 0x2]
	ldrh r1, [r5, 0x12]
	cmp r0, r1
	bcs _080F5A54
	adds r7, r0, 0
	ldr r0, _080F5A4C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080F5A50 @ =0x00009238
	adds r0, r2
	adds r4, r5, 0
	adds r4, 0x10
	movs r1, 0
	str r1, [sp]
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0
	bl sub_80F5688
	b _080F5A70
	.align 2, 0
_080F5A4C: .4byte gUnknown_083DFEC4
_080F5A50: .4byte 0x00009238
_080F5A54:
	ldrh r7, [r5, 0x12]
	ldr r0, _080F5B28 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r4, _080F5B2C @ =0x00009238
	adds r0, r4
	adds r4, r5, 0
	adds r4, 0x10
	movs r1, 0
	str r1, [sp]
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x1
	bl sub_80F5688
_080F5A70:
	adds r1, r4, 0
	ldr r0, _080F5B28 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	mov r8, r0
	ldr r4, _080F5B2C @ =0x00009238
	add r4, r8
	adds r2, r5, 0
	adds r2, 0xC
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0
	bl sub_80F5688
	movs r2, 0x38
	cmp r2, r7
	bcs _080F5AB2
	adds r6, r4, 0
	movs r3, 0
	ldr r4, _080F5B30 @ =0x0000923a
	add r4, r8
_080F5A9A:
	adds r0, r2, 0
	subs r0, 0x38
	lsls r0, 2
	adds r1, r6, r0
	strh r3, [r1]
	adds r0, r4, r0
	strh r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r7
	bcc _080F5A9A
_080F5AB2:
	ldrh r2, [r5, 0x2]
	ldr r0, _080F5B28 @ =gUnknown_083DFEC4
	ldr r3, [r0]
	ldr r4, _080F5B34 @ =0x00009340
	adds r1, r3, r4
	adds r6, r0, 0
	ldrh r0, [r1]
	cmp r2, r0
	bhi _080F5AE0
	ldr r4, _080F5B30 @ =0x0000923a
	adds r3, r4
	movs r4, 0x9B
_080F5ACA:
	adds r0, r2, 0
	subs r0, 0x38
	lsls r0, 2
	adds r0, r3, r0
	strh r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r1]
	cmp r2, r0
	bls _080F5ACA
_080F5AE0:
	ldrh r0, [r5, 0xE]
	adds r1, r0, 0x1
	ldr r3, [r6]
	ldr r2, _080F5B34 @ =0x00009340
	adds r0, r3, r2
	ldrh r0, [r0]
	cmp r0, r1
	bge _080F5AF2
	adds r0, r1, 0
_080F5AF2:
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x79
	bhi _080F5B1C
	ldr r4, _080F5B2C @ =0x00009238
	adds r5, r3, r4
	movs r4, 0
	ldr r0, _080F5B30 @ =0x0000923a
	adds r3, r0
_080F5B04:
	adds r0, r2, 0
	subs r0, 0x38
	lsls r0, 2
	adds r1, r5, r0
	strh r4, [r1]
	adds r0, r3, r0
	strh r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x79
	bls _080F5B04
_080F5B1C:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F5B28: .4byte gUnknown_083DFEC4
_080F5B2C: .4byte 0x00009238
_080F5B30: .4byte 0x0000923a
_080F5B34: .4byte 0x00009340
	thumb_func_end sub_80F5A1C

	thumb_func_start sub_80F5B38
sub_80F5B38: @ 80F5B38
	ldr r0, _080F5B48 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F5B4C @ =0x00009345
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	bx lr
	.align 2, 0
_080F5B48: .4byte gUnknown_083DFEC4
_080F5B4C: .4byte 0x00009345
	thumb_func_end sub_80F5B38

	thumb_func_start sub_80F5B50
sub_80F5B50: @ 80F5B50
	push {r4,r5,lr}
	sub sp, 0xC
	ldr r0, _080F5B68 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F5B6C @ =0x00009345
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	beq _080F5B70
	cmp r0, 0x1
	beq _080F5BB4
	b _080F5BCC
	.align 2, 0
_080F5B68: .4byte gUnknown_083DFEC4
_080F5B6C: .4byte 0x00009345
_080F5B70:
	bl dp12_8087EA4
	ldr r0, _080F5BA8 @ =gUnknown_03004DE0
	movs r2, 0xEF
	movs r3, 0xF4
	lsls r3, 3
	adds r1, r0, r3
	adds r0, 0x20
	movs r3, 0xF
_080F5B82:
	strh r2, [r0]
	strh r2, [r0, 0x2]
	strh r2, [r1]
	strh r2, [r1, 0x2]
	adds r1, 0x4
	adds r0, 0x4
	subs r3, 0x1
	cmp r3, 0
	bge _080F5B82
	ldr r0, _080F5BAC @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r5, _080F5BB0 @ =0x00009345
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0x1
	b _080F5BCE
	.align 2, 0
_080F5BA8: .4byte gUnknown_03004DE0
_080F5BAC: .4byte gUnknown_083DFEC4
_080F5BB0: .4byte 0x00009345
_080F5BB4:
	mov r0, sp
	ldr r1, _080F5BD8 @ =gUnknown_083E4990
	ldm r1!, {r2,r3,r5}
	stm r0!, {r2,r3,r5}
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl sub_80895F8
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_080F5BCC:
	movs r0, 0
_080F5BCE:
	add sp, 0xC
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080F5BD8: .4byte gUnknown_083E4990
	thumb_func_end sub_80F5B50

	thumb_func_start sub_80F5BDC
sub_80F5BDC: @ 80F5BDC
	push {lr}
	ldr r1, _080F5BEC @ =gUnknown_03004DC0
	movs r0, 0x3
	strb r0, [r1, 0x15]
	bl sub_8089668
	pop {r0}
	bx r0
	.align 2, 0
_080F5BEC: .4byte gUnknown_03004DC0
	thumb_func_end sub_80F5BDC

	thumb_func_start sub_80F5BF0
sub_80F5BF0: @ 80F5BF0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	ldr r0, _080F5CB8 @ =gUnknown_083DFEC4
	ldr r5, [r0]
	ldr r1, _080F5CBC @ =0x00009344
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F5CA6
	ldr r0, _080F5CC0 @ =0x0000911c
	adds r4, r5, r0
	adds r0, r4, 0
	bl sub_80F58DC
	adds r0, r4, 0
	bl sub_80F5A1C
	movs r6, 0
	ldr r1, _080F5CC4 @ =gUnknown_03004DE0
	mov r12, r1
	movs r0, 0xF0
	lsls r0, 3
	add r0, r12
	mov r9, r0
	adds r7, r5, 0
	ldr r1, _080F5CC8 @ =0x0000ffff
	mov r8, r1
	ldr r5, _080F5CCC @ =0x00009130
	adds r5, r7, r5
	str r5, [sp]
	ldr r0, _080F5CD0 @ =0x00009132
	adds r0, r7, r0
	str r0, [sp, 0x4]
	ldr r1, _080F5CD4 @ =0x00009238
	adds r1, r7
	mov r10, r1
_080F5C40:
	adds r2, r6, 0
	adds r2, 0x37
	lsls r3, r2, 2
	mov r5, r9
	adds r5, r3, r5
	str r5, [sp, 0x8]
	add r3, r12
	lsls r4, r6, 2
	ldr r1, [sp]
	adds r0, r1, r4
	ldrh r0, [r0]
	lsls r0, 8
	ldr r5, [sp, 0x4]
	adds r1, r5, r4
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r3]
	mov r1, r8
	ands r0, r1
	ldr r5, [sp, 0x8]
	strh r0, [r5]
	lsls r2, 1
	adds r2, 0x1
	lsls r2, 1
	mov r0, r9
	adds r3, r2, r0
	add r2, r12
	mov r1, r10
	adds r0, r1, r4
	ldrh r1, [r0]
	lsls r1, 8
	ldr r5, _080F5CD8 @ =0x0000923a
	adds r0, r7, r5
	adds r0, r4
	ldrh r0, [r0]
	orrs r1, r0
	strh r1, [r2]
	mov r0, r8
	ands r1, r0
	strh r1, [r3]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _080F5CB8 @ =gUnknown_083DFEC4
	cmp r6, 0x41
	bls _080F5C40
	ldr r0, [r0]
	ldr r1, _080F5CBC @ =0x00009344
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_080F5CA6:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F5CB8: .4byte gUnknown_083DFEC4
_080F5CBC: .4byte 0x00009344
_080F5CC0: .4byte 0x0000911c
_080F5CC4: .4byte gUnknown_03004DE0
_080F5CC8: .4byte 0x0000ffff
_080F5CCC: .4byte 0x00009130
_080F5CD0: .4byte 0x00009132
_080F5CD4: .4byte 0x00009238
_080F5CD8: .4byte 0x0000923a
	thumb_func_end sub_80F5BF0

	thumb_func_start sub_80F5CDC
sub_80F5CDC: @ 80F5CDC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080F5DB0 @ =gUnknown_083DFEC4
	ldr r6, [r0]
	ldr r1, _080F5DB4 @ =0x00009344
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F5DA0
	ldr r0, _080F5DB8 @ =0x0000911c
	adds r4, r6, r0
	adds r0, r4, 0
	bl sub_80F58DC
	adds r0, r4, 0
	bl sub_80F5A1C
	movs r0, 0x37
	subs r0, r5
	lsls r0, 17
	lsrs r5, r0, 16
	movs r7, 0
	ldr r1, _080F5DBC @ =gUnknown_03004DE0
	mov r12, r1
	movs r4, 0xF0
	lsls r4, 3
	add r4, r12
	mov r9, r4
	ldr r0, _080F5DC0 @ =0x0000ffff
	mov r8, r0
	ldr r1, _080F5DC4 @ =0x00009130
	adds r1, r6, r1
	str r1, [sp]
	ldr r4, _080F5DC8 @ =0x00009132
	adds r4, r6, r4
	str r4, [sp, 0x4]
	ldr r0, _080F5DCC @ =0x00009238
	adds r0, r6
	mov r10, r0
_080F5D36:
	lsls r2, r5, 1
	mov r1, r9
	adds r1, r2, r1
	str r1, [sp, 0x8]
	add r2, r12
	lsls r3, r7, 2
	ldr r4, [sp]
	adds r0, r4, r3
	ldrh r0, [r0]
	lsls r0, 8
	ldr r4, [sp, 0x4]
	adds r1, r4, r3
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	mov r1, r8
	ands r0, r1
	ldr r4, [sp, 0x8]
	strh r0, [r4]
	adds r2, r5, 0x1
	lsls r2, 1
	mov r0, r9
	adds r0, r2, r0
	str r0, [sp, 0x8]
	add r2, r12
	mov r1, r10
	adds r0, r1, r3
	ldrh r1, [r0]
	lsls r1, 8
	ldr r4, _080F5DD0 @ =0x0000923a
	adds r0, r6, r4
	adds r0, r3
	ldrh r0, [r0]
	orrs r1, r0
	strh r1, [r2]
	mov r0, r8
	ands r1, r0
	ldr r4, [sp, 0x8]
	strh r1, [r4]
	adds r0, r5, 0x2
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r0, _080F5DB0 @ =gUnknown_083DFEC4
	cmp r7, 0x41
	bls _080F5D36
	ldr r0, [r0]
	ldr r1, _080F5DB4 @ =0x00009344
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_080F5DA0:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F5DB0: .4byte gUnknown_083DFEC4
_080F5DB4: .4byte 0x00009344
_080F5DB8: .4byte 0x0000911c
_080F5DBC: .4byte gUnknown_03004DE0
_080F5DC0: .4byte 0x0000ffff
_080F5DC4: .4byte 0x00009130
_080F5DC8: .4byte 0x00009132
_080F5DCC: .4byte 0x00009238
_080F5DD0: .4byte 0x0000923a
	thumb_func_end sub_80F5CDC

	thumb_func_start sub_80F5DD4
sub_80F5DD4: @ 80F5DD4
	push {lr}
	ldr r0, _080F5DE8 @ =gMain
	ldrh r1, [r0, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080F5DEC
	bl sub_80F5E20
	b _080F5E18
	.align 2, 0
_080F5DE8: .4byte gMain
_080F5DEC:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080F5DFA
	bl sub_80F5EE4
	b _080F5E18
_080F5DFA:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080F5E08
	bl sub_80F5FB4
	b _080F5E18
_080F5E08:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _080F5E14
	movs r0, 0
	b _080F5E1C
_080F5E14:
	bl sub_80F6010
_080F5E18:
	lsls r0, 24
	lsrs r0, 24
_080F5E1C:
	pop {r1}
	bx r1
	thumb_func_end sub_80F5DD4

	thumb_func_start sub_80F5E20
sub_80F5E20: @ 80F5E20
	push {r4,r5,lr}
	ldr r0, _080F5E38 @ =gUnknown_083DFEC4
	ldr r2, [r0]
	ldr r3, _080F5E3C @ =0x0000876e
	adds r1, r2, r3
	movs r5, 0
	ldrsh r1, [r1, r5]
	adds r4, r0, 0
	cmp r1, 0
	bne _080F5E40
	movs r0, 0
	b _080F5EC8
	.align 2, 0
_080F5E38: .4byte gUnknown_083DFEC4
_080F5E3C: .4byte 0x0000876e
_080F5E40:
	ldr r1, _080F5E6C @ =0x000087c9
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F5E74
	ldr r3, _080F5E70 @ =0x0000876c
	adds r0, r2, r3
	movs r5, 0
	ldrsh r0, [r0, r5]
	cmp r0, 0
	bne _080F5E74
	movs r4, 0x1
	negs r4, r4
	adds r0, r4, 0
	bl sub_80F063C
	adds r0, r4, 0
	bl sub_80F6074
	movs r0, 0x2
	b _080F5EC8
	.align 2, 0
_080F5E6C: .4byte 0x000087c9
_080F5E70: .4byte 0x0000876c
_080F5E74:
	ldr r1, [r4]
	ldr r0, _080F5ED0 @ =0x0000876c
	adds r2, r1, r0
	ldrh r0, [r2]
	subs r3, r0, 0x1
	strh r3, [r2]
	ldr r5, _080F5ED4 @ =0x000087c9
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F5E98
	lsls r0, r3, 16
	cmp r0, 0
	bge _080F5E98
	ldr r3, _080F5ED8 @ =0x00008772
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r2]
_080F5E98:
	ldr r0, [r4]
	ldr r5, _080F5EDC @ =0x00008770
	adds r2, r0, r5
	ldr r3, _080F5ED0 @ =0x0000876c
	adds r1, r0, r3
	ldrh r1, [r1]
	ldrh r2, [r2]
	adds r2, r1, r2
	subs r5, 0x2
	adds r4, r0, r5
	strh r2, [r4]
	ldr r1, _080F5EE0 @ =0x00008774
	adds r0, r1
	lsls r1, r2, 16
	asrs r1, 16
	ldrh r3, [r0]
	movs r5, 0
	ldrsh r0, [r0, r5]
	cmp r1, r0
	ble _080F5EC6
	subs r0, r2, 0x1
	subs r0, r3
	strh r0, [r4]
_080F5EC6:
	movs r0, 0x1
_080F5EC8:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080F5ED0: .4byte 0x0000876c
_080F5ED4: .4byte 0x000087c9
_080F5ED8: .4byte 0x00008772
_080F5EDC: .4byte 0x00008770
_080F5EE0: .4byte 0x00008774
	thumb_func_end sub_80F5E20

	thumb_func_start sub_80F5EE4
sub_80F5EE4: @ 80F5EE4
	push {r4-r6,lr}
	ldr r3, _080F5F04 @ =gUnknown_083DFEC4
	ldr r4, [r3]
	ldr r1, _080F5F08 @ =0x0000876e
	adds r0, r4, r1
	ldr r2, _080F5F0C @ =0x00008774
	adds r1, r4, r2
	movs r5, 0
	ldrsh r2, [r0, r5]
	movs r6, 0
	ldrsh r0, [r1, r6]
	adds r5, r3, 0
	cmp r2, r0
	bne _080F5F10
	movs r0, 0
	b _080F5F98
	.align 2, 0
_080F5F04: .4byte gUnknown_083DFEC4
_080F5F08: .4byte 0x0000876e
_080F5F0C: .4byte 0x00008774
_080F5F10:
	ldr r1, _080F5F38 @ =0x000087c9
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F5F40
	ldr r2, _080F5F3C @ =0x0000876c
	adds r0, r4, r2
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r0, 0x7
	bne _080F5F40
	movs r0, 0x1
	bl sub_80F063C
	movs r0, 0x1
	bl sub_80F6074
	movs r0, 0x2
	b _080F5F98
	.align 2, 0
_080F5F38: .4byte 0x000087c9
_080F5F3C: .4byte 0x0000876c
_080F5F40:
	ldr r2, [r5]
	ldr r6, _080F5FA0 @ =0x0000876c
	adds r4, r2, r6
	ldrh r0, [r4]
	adds r1, r0, 0x1
	strh r1, [r4]
	ldr r3, _080F5FA4 @ =0x000087c9
	adds r0, r2, r3
	ldrb r3, [r0]
	cmp r3, 0
	bne _080F5F68
	adds r6, 0x6
	adds r0, r2, r6
	lsls r1, 16
	asrs r1, 16
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble _080F5F68
	strh r3, [r4]
_080F5F68:
	ldr r0, [r5]
	ldr r3, _080F5FA8 @ =0x00008770
	adds r2, r0, r3
	ldr r5, _080F5FA0 @ =0x0000876c
	adds r1, r0, r5
	ldrh r1, [r1]
	ldrh r2, [r2]
	adds r2, r1, r2
	ldr r6, _080F5FAC @ =0x0000876e
	adds r4, r0, r6
	strh r2, [r4]
	ldr r1, _080F5FB0 @ =0x00008774
	adds r0, r1
	lsls r1, r2, 16
	asrs r1, 16
	ldrh r3, [r0]
	movs r5, 0
	ldrsh r0, [r0, r5]
	cmp r1, r0
	ble _080F5F96
	subs r0, r2, 0x1
	subs r0, r3
	strh r0, [r4]
_080F5F96:
	movs r0, 0x1
_080F5F98:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080F5FA0: .4byte 0x0000876c
_080F5FA4: .4byte 0x000087c9
_080F5FA8: .4byte 0x00008770
_080F5FAC: .4byte 0x0000876e
_080F5FB0: .4byte 0x00008774
	thumb_func_end sub_80F5EE4

	thumb_func_start sub_80F5FB4
sub_80F5FB4: @ 80F5FB4
	push {r4,lr}
	ldr r0, _080F5FD8 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _080F5FDC @ =0x00008770
	adds r0, r1, r2
	ldrh r3, [r0]
	movs r4, 0
	ldrsh r2, [r0, r4]
	cmp r2, 0
	beq _080F5FD2
	ldr r4, _080F5FE0 @ =0x000087c9
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F5FE4
_080F5FD2:
	movs r0, 0
	b _080F6004
	.align 2, 0
_080F5FD8: .4byte gUnknown_083DFEC4
_080F5FDC: .4byte 0x00008770
_080F5FE0: .4byte 0x000087c9
_080F5FE4:
	cmp r2, 0x7
	bgt _080F5FF0
	negs r0, r3
	lsls r0, 16
	lsrs r0, 16
	b _080F5FF2
_080F5FF0:
	ldr r0, _080F600C @ =0x0000fff8
_080F5FF2:
	lsls r4, r0, 16
	asrs r4, 16
	adds r0, r4, 0
	bl sub_80F063C
	adds r0, r4, 0
	bl sub_80F6074
	movs r0, 0x2
_080F6004:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F600C: .4byte 0x0000fff8
	thumb_func_end sub_80F5FB4

	thumb_func_start sub_80F6010
sub_80F6010: @ 80F6010
	push {r4-r6,lr}
	ldr r0, _080F603C @ =gUnknown_083DFEC4
	ldr r3, [r0]
	ldr r1, _080F6040 @ =0x00008772
	adds r0, r3, r1
	ldr r2, _080F6044 @ =0x00008774
	adds r1, r3, r2
	ldrh r5, [r0]
	movs r4, 0
	ldrsh r2, [r0, r4]
	ldrh r4, [r1]
	movs r6, 0
	ldrsh r0, [r1, r6]
	cmp r2, r0
	beq _080F6038
	ldr r1, _080F6048 @ =0x000087c9
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F604C
_080F6038:
	movs r0, 0
	b _080F606C
	.align 2, 0
_080F603C: .4byte gUnknown_083DFEC4
_080F6040: .4byte 0x00008772
_080F6044: .4byte 0x00008774
_080F6048: .4byte 0x000087c9
_080F604C:
	subs r0, r4, r5
	lsls r0, 16
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080F605A
	movs r4, 0x8
_080F605A:
	lsls r4, 16
	asrs r4, 16
	adds r0, r4, 0
	bl sub_80F063C
	adds r0, r4, 0
	bl sub_80F6074
	movs r0, 0x2
_080F606C:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80F6010

	thumb_func_start sub_80F6074
sub_80F6074: @ 80F6074
	push {r4-r7,lr}
	ldr r1, _080F6120 @ =gUnknown_083DFEC4
	ldr r6, [r1]
	ldr r1, _080F6124 @ =0x00008770
	adds r3, r6, r1
	ldrh r1, [r3]
	lsls r0, 16
	asrs r7, r0, 16
	adds r2, r7, r1
	strh r2, [r3]
	ldr r5, _080F6128 @ =0x00008774
	adds r4, r6, r5
	lsls r0, r2, 16
	asrs r0, 16
	ldrh r1, [r4]
	mov r12, r1
	movs r5, 0
	ldrsh r1, [r4, r5]
	cmp r0, r1
	ble _080F60A4
	subs r0, r2, 0x1
	mov r1, r12
	subs r0, r1
	strh r0, [r3]
_080F60A4:
	ldrh r1, [r3]
	movs r2, 0
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bge _080F60B6
	adds r0, r1, 0x1
	ldrh r5, [r4]
	adds r0, r5
	strh r0, [r3]
_080F60B6:
	ldr r0, _080F612C @ =0x00008772
	adds r3, r6, r0
	ldrh r0, [r3]
	adds r2, r7, r0
	strh r2, [r3]
	lsls r0, r2, 16
	asrs r0, 16
	ldrh r1, [r4]
	mov r12, r1
	movs r5, 0
	ldrsh r1, [r4, r5]
	cmp r0, r1
	ble _080F60D8
	subs r0, r2, 0x1
	mov r1, r12
	subs r0, r1
	strh r0, [r3]
_080F60D8:
	ldrh r1, [r3]
	movs r2, 0
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bge _080F60EA
	adds r0, r1, 0x1
	ldrh r5, [r4]
	adds r0, r5
	strh r0, [r3]
_080F60EA:
	ldr r0, _080F6130 @ =0x0000876e
	adds r3, r6, r0
	ldrh r0, [r3]
	adds r2, r7, r0
	strh r2, [r3]
	lsls r0, r2, 16
	asrs r0, 16
	ldrh r5, [r4]
	movs r6, 0
	ldrsh r1, [r4, r6]
	cmp r0, r1
	ble _080F6108
	subs r0, r2, 0x1
	subs r0, r5
	strh r0, [r3]
_080F6108:
	ldrh r1, [r3]
	movs r2, 0
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bge _080F611A
	adds r0, r1, 0x1
	ldrh r4, [r4]
	adds r0, r4
	strh r0, [r3]
_080F611A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F6120: .4byte gUnknown_083DFEC4
_080F6124: .4byte 0x00008770
_080F6128: .4byte 0x00008774
_080F612C: .4byte 0x00008772
_080F6130: .4byte 0x0000876e
	thumb_func_end sub_80F6074

	thumb_func_start sub_80F6134
sub_80F6134: @ 80F6134
	push {r4-r6,lr}
	ldr r0, _080F6194 @ =gUnknown_083DFEC4
	ldr r3, [r0]
	ldr r1, _080F6198 @ =0x000087c9
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F61E0
	ldr r2, _080F619C @ =0x000087dc
	adds r5, r3, r2
	movs r4, 0
	ldrsh r1, [r5, r4]
	ldr r6, _080F61A0 @ =0x00008774
	adds r4, r3, r6
	movs r2, 0
	ldrsh r0, [r4, r2]
	subs r0, 0x7
	cmp r1, r0
	bge _080F61AC
	subs r6, 0x8
	adds r1, r3, r6
	movs r0, 0
	strh r0, [r1]
	ldrh r0, [r5]
	ldr r1, _080F61A4 @ =0x00008770
	adds r2, r3, r1
	strh r0, [r2]
	ldrh r1, [r5]
	ldr r5, _080F61A8 @ =0x0000876e
	adds r0, r3, r5
	strh r1, [r0]
	ldrh r5, [r2]
	adds r0, r5, 0x7
	adds r6, 0x6
	adds r2, r3, r6
	strh r0, [r2]
	lsls r0, 16
	asrs r0, 16
	ldrh r3, [r4]
	movs r6, 0
	ldrsh r1, [r4, r6]
	cmp r0, r1
	ble _080F61F4
	adds r0, r5, 0x6
	subs r0, r3
	strh r0, [r2]
	b _080F61F4
	.align 2, 0
_080F6194: .4byte gUnknown_083DFEC4
_080F6198: .4byte 0x000087c9
_080F619C: .4byte 0x000087dc
_080F61A0: .4byte 0x00008774
_080F61A4: .4byte 0x00008770
_080F61A8: .4byte 0x0000876e
_080F61AC:
	ldrh r0, [r4]
	subs r0, 0x7
	ldr r2, _080F61D4 @ =0x00008770
	adds r1, r3, r2
	strh r0, [r1]
	ldrh r1, [r4]
	ldr r6, _080F61D8 @ =0x00008772
	adds r0, r3, r6
	strh r1, [r0]
	ldrh r1, [r5]
	subs r2, 0x2
	adds r0, r3, r2
	strh r1, [r0]
	ldrh r0, [r4]
	subs r0, r1
	movs r1, 0x7
	subs r1, r0
	ldr r4, _080F61DC @ =0x0000876c
	adds r0, r3, r4
	b _080F61F2
	.align 2, 0
_080F61D4: .4byte 0x00008770
_080F61D8: .4byte 0x00008772
_080F61DC: .4byte 0x0000876c
_080F61E0:
	ldr r5, _080F61FC @ =0x000087dc
	adds r2, r3, r5
	ldrh r1, [r2]
	ldr r6, _080F6200 @ =0x0000876c
	adds r0, r3, r6
	strh r1, [r0]
	ldrh r1, [r2]
	ldr r2, _080F6204 @ =0x0000876e
	adds r0, r3, r2
_080F61F2:
	strh r1, [r0]
_080F61F4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F61FC: .4byte 0x000087dc
_080F6200: .4byte 0x0000876c
_080F6204: .4byte 0x0000876e
	thumb_func_end sub_80F6134

	thumb_func_start sub_80F6208
sub_80F6208: @ 80F6208
	push {lr}
	ldr r0, _080F623C @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _080F6240 @ =0x00008fe6
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	ldr r3, _080F6244 @ =0x00008fe7
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _080F6248 @ =0x00008fe8
	adds r2, r1, r0
	movs r0, 0xFF
	strb r0, [r2]
	ldr r2, _080F624C @ =0x00006dac
	adds r1, r2
	ldrb r0, [r1]
	cmp r0, 0
	bne _080F6238
_080F622E:
	bl sub_80F6250
	lsls r0, 24
	cmp r0, 0
	bne _080F622E
_080F6238:
	pop {r0}
	bx r0
	.align 2, 0
_080F623C: .4byte gUnknown_083DFEC4
_080F6240: .4byte 0x00008fe6
_080F6244: .4byte 0x00008fe7
_080F6248: .4byte 0x00008fe8
_080F624C: .4byte 0x00006dac
	thumb_func_end sub_80F6208

	thumb_func_start sub_80F6250
sub_80F6250: @ 80F6250
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _080F6270 @ =gUnknown_083DFEC4
	ldr r2, [r0]
	ldr r0, _080F6274 @ =0x00008fe8
	adds r3, r2, r0
	movs r1, 0
	ldrsb r1, [r3, r1]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080F6278
_080F626C:
	movs r0, 0
	b _080F637E
	.align 2, 0
_080F6270: .4byte gUnknown_083DFEC4
_080F6274: .4byte 0x00008fe8
_080F6278:
	ldr r1, _080F630C @ =0x00008fe6
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x7
	beq _080F631C
	cmp r0, 0x8
	beq _080F626C
	movs r6, 0
	adds r7, r2, 0
	adds r5, r7, r1
	ldr r0, _080F6310 @ =0x00008fe7
	adds r4, r7, r0
	ldr r1, _080F6314 @ =gPokemonStorage + 0x4
	mov r8, r1
	ldr r0, _080F6318 @ =0x000041a0
	add r0, r8
	mov r9, r0
_080F629A:
	ldrb r0, [r5]
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldrb r2, [r4]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	add r1, r8
	adds r0, r1
	movs r1, 0x51
	bl GetBoxMonData
	cmp r0, 0
	bne _080F636C
	ldrb r0, [r5]
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldrb r2, [r4]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	add r1, r9
	adds r0, r1
	movs r1, 0x51
	bl GetBoxMonData
	adds r1, r0, 0
	cmp r1, 0
	bne _080F636C
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	movs r2, 0xFF
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1D
	bls _080F62FE
	strb r1, [r4]
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	ands r0, r2
	cmp r0, 0x6
	bhi _080F637C
_080F62FE:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x9
	bls _080F629A
	b _080F637C
	.align 2, 0
_080F630C: .4byte 0x00008fe6
_080F6310: .4byte 0x00008fe7
_080F6314: .4byte gPokemonStorage + 0x4
_080F6318: .4byte 0x000041a0
_080F631C:
	movs r0, 0
	strb r0, [r3]
	movs r6, 0
	b _080F632A
_080F6324:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_080F632A:
	cmp r6, 0x5
	bhi _080F634C
	movs r0, 0x64
	muls r0, r6
	ldr r1, _080F635C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x51
	bl GetMonData
	cmp r0, 0
	beq _080F6324
	ldr r0, _080F6360 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F6364 @ =0x00008fe8
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_080F634C:
	ldr r0, _080F6360 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F6368 @ =0x00008fe6
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	b _080F6372
	.align 2, 0
_080F635C: .4byte gPlayerParty
_080F6360: .4byte gUnknown_083DFEC4
_080F6364: .4byte 0x00008fe8
_080F6368: .4byte 0x00008fe6
_080F636C:
	ldr r0, _080F6378 @ =0x00008fe8
	adds r1, r7, r0
	movs r0, 0x1
_080F6372:
	strb r0, [r1]
	b _080F626C
	.align 2, 0
_080F6378: .4byte 0x00008fe8
_080F637C:
	movs r0, 0x1
_080F637E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80F6250

	thumb_func_start sub_80F638C
sub_80F638C: @ 80F638C
	push {r4,lr}
	ldr r0, _080F63C0 @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r1, _080F63C4 @ =0x00008fe6
	adds r0, r4, r1
	movs r1, 0
	strb r1, [r0]
	ldr r2, _080F63C8 @ =0x00008fe7
	adds r0, r4, r2
	strb r1, [r0]
	bl sub_80F492C
	ldr r0, _080F63CC @ =0x00006dac
	adds r4, r0
	ldrb r0, [r4]
	cmp r0, 0
	bne _080F63B8
_080F63AE:
	bl sub_80F63D0
	lsls r0, 24
	cmp r0, 0
	bne _080F63AE
_080F63B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F63C0: .4byte gUnknown_083DFEC4
_080F63C4: .4byte 0x00008fe6
_080F63C8: .4byte 0x00008fe7
_080F63CC: .4byte 0x00006dac
	thumb_func_end sub_80F638C

	thumb_func_start sub_80F63D0
sub_80F63D0: @ 80F63D0
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r0, _080F647C @ =gUnknown_083DFEC4
	ldr r2, [r0]
	ldr r1, _080F6480 @ =0x00008fe6
	adds r0, r2, r1
	ldrb r3, [r0]
	cmp r3, 0xE
	beq _080F6498
	cmp r3, 0xF
	bne _080F63E8
	b _080F64F6
_080F63E8:
	movs r1, 0x80
	lsls r1, 23
	ldr r0, [sp]
	orrs r0, r1
	str r0, [sp]
	movs r6, 0
	ldr r0, _080F6480 @ =0x00008fe6
	adds r5, r2, r0
	ldr r1, _080F6484 @ =0x00008fe7
	adds r4, r2, r1
_080F63FC:
	ldrb r0, [r5]
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldrb r2, [r4]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	ldr r2, _080F6488 @ =gPokemonStorage + 0x4
	adds r1, r2
	adds r0, r1
	movs r1, 0x51
	bl GetBoxMonData
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	beq _080F644E
	ldrb r1, [r5]
	lsls r1, 8
	ldr r2, _080F648C @ =0xffff00ff
	ldr r0, [sp]
	ands r0, r2
	orrs r0, r1
	str r0, [sp]
	ldrb r2, [r4]
	movs r1, 0x1F
	ands r2, r1
	lsls r2, 16
	ldr r1, _080F6490 @ =0xffe0ffff
	ands r0, r1
	orrs r0, r2
	ldr r1, _080F6494 @ =0xffffff00
	ands r0, r1
	orrs r0, r3
	str r0, [sp]
	mov r0, sp
	bl sub_80F4944
_080F644E:
	ldrb r0, [r4]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r4]
	movs r1, 0xFF
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1E
	bne _080F646E
	strb r2, [r4]
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	ands r0, r1
	cmp r0, 0xE
	beq _080F6508
_080F646E:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0xE
	bls _080F63FC
	b _080F6508
	.align 2, 0
_080F647C: .4byte gUnknown_083DFEC4
_080F6480: .4byte 0x00008fe6
_080F6484: .4byte 0x00008fe7
_080F6488: .4byte gPokemonStorage + 0x4
_080F648C: .4byte 0xffff00ff
_080F6490: .4byte 0xffe0ffff
_080F6494: .4byte 0xffffff00
_080F6498:
	mov r0, sp
	ldrb r1, [r0, 0x3]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0, 0x3]
	strb r3, [r0, 0x1]
	movs r6, 0
	mov r4, sp
_080F64A8:
	movs r0, 0x64
	muls r0, r6
	ldr r1, _080F64FC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x51
	bl GetMonData
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	beq _080F64DA
	movs r0, 0x1F
	adds r2, r6, 0
	ands r2, r0
	ldrb r0, [r4, 0x2]
	movs r5, 0x20
	negs r5, r5
	adds r1, r5, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x2]
	strb r3, [r4]
	mov r0, sp
	bl sub_80F4944
_080F64DA:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x5
	bls _080F64A8
	bl sub_80F49F4
	ldr r0, _080F6500 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F6504 @ =0x00008fe6
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080F64F6:
	movs r0, 0
	b _080F650A
	.align 2, 0
_080F64FC: .4byte gPlayerParty
_080F6500: .4byte gUnknown_083DFEC4
_080F6504: .4byte 0x00008fe6
_080F6508:
	movs r0, 0x1
_080F650A:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80F63D0

	thumb_func_start sub_80F6514
sub_80F6514: @ 80F6514
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	mov r10, r0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x4]
	mov r5, r10
	ldr r0, _080F65A4 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	lsls r1, 2
	adds r0, r1
	ldr r2, _080F65A8 @ =0x0000893d
	adds r1, r0, r2
	ldrb r6, [r1]
	mov r8, r6
	ldr r1, _080F65AC @ =0x0000893e
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 27
	lsrs r4, r0, 27
	adds r7, r4, 0
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0x2D
	movs r3, 0
	bl sub_80F44B0
	cmp r0, 0
	beq _080F655E
	b _080F66CA
_080F655E:
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0x2
	adds r3, r5, 0
	bl sub_80F44B0
	adds r0, r5, 0
	bl StringGetEnd10
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0xB
	movs r3, 0
	bl sub_80F44B0
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	cmp r6, 0xE
	bne _080F65B4
	movs r0, 0x64
	muls r4, r0
	ldr r0, _080F65B0 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	adds r0, r4, 0
	bl GetMonGender
	b _080F65EA
	.align 2, 0
_080F65A4: .4byte gUnknown_083DFEC4
_080F65A8: .4byte 0x0000893d
_080F65AC: .4byte 0x0000893e
_080F65B0: .4byte gPlayerParty
_080F65B4:
	mov r2, r8
	lsls r1, r2, 2
	add r1, r8
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 4
	ldr r2, _080F6620 @ =gPokemonStorage + 0x4
	adds r1, r2
	adds r0, r1
	bl GetLevelFromBoxMonExp
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	mov r0, r8
	adds r1, r7, 0
	movs r2, 0
	movs r3, 0
	bl sub_80F44B0
	adds r1, r0, 0
	mov r0, r9
	bl GetGenderFromSpeciesAndPersonality
_080F65EA:
	lsls r0, 24
	lsrs r4, r0, 24
	mov r0, r9
	mov r1, r10
	bl sub_8040D8C
	cmp r0, 0
	beq _080F65FC
	movs r4, 0xFF
_080F65FC:
	adds r0, r5, 0
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	adds r5, r0
	movs r1, 0xFC
	strb r1, [r5]
	movs r0, 0x13
	strb r0, [r5, 0x1]
	movs r0, 0x3F
	strb r0, [r5, 0x2]
	adds r5, 0x3
	cmp r4, 0
	beq _080F6624
	cmp r4, 0xFE
	beq _080F663C
	b _080F6656
	.align 2, 0
_080F6620: .4byte gPokemonStorage + 0x4
_080F6624:
	strb r1, [r5]
	movs r0, 0x1
	strb r0, [r5, 0x1]
	movs r0, 0xC
	strb r0, [r5, 0x2]
	strb r1, [r5, 0x3]
	movs r0, 0x3
	strb r0, [r5, 0x4]
	movs r0, 0xD
	strb r0, [r5, 0x5]
	movs r0, 0xB5
	b _080F6652
_080F663C:
	strb r1, [r5]
	movs r0, 0x1
	strb r0, [r5, 0x1]
	movs r0, 0xA
	strb r0, [r5, 0x2]
	strb r1, [r5, 0x3]
	movs r0, 0x3
	strb r0, [r5, 0x4]
	movs r0, 0xB
	strb r0, [r5, 0x5]
	movs r0, 0xB6
_080F6652:
	strb r0, [r5, 0x6]
	adds r5, 0x7
_080F6656:
	movs r4, 0xFC
	strb r4, [r5]
	movs r1, 0x1
	strb r1, [r5, 0x1]
	strb r1, [r5, 0x2]
	strb r4, [r5, 0x3]
	movs r0, 0x3
	strb r0, [r5, 0x4]
	movs r0, 0x5
	strb r0, [r5, 0x5]
	adds r5, 0x6
	strb r4, [r5]
	movs r6, 0x13
	strb r6, [r5, 0x1]
	movs r0, 0x46
	strb r0, [r5, 0x2]
	adds r5, 0x3
	movs r0, 0xBA
	strb r0, [r5]
	strb r4, [r5, 0x1]
	movs r0, 0x11
	strb r0, [r5, 0x2]
	strb r1, [r5, 0x3]
	movs r0, 0x34
	strb r0, [r5, 0x4]
	adds r5, 0x5
	adds r0, r5, 0
	ldr r1, [sp, 0x8]
	bl ConvertIntToDecimalString
	adds r5, r0, 0
	ldr r0, [sp, 0x4]
	cmp r0, 0x1
	bne _080F66C0
	ldr r0, _080F66B8 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, [sp]
	lsls r1, r2, 2
	adds r0, r1
	ldr r1, _080F66BC @ =0x0000893c
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r5, 0
	movs r2, 0x80
	movs r3, 0x1
	bl sub_8072C14
	adds r5, r0, 0
	b _080F66CE
	.align 2, 0
_080F66B8: .4byte gUnknown_083DFEC4
_080F66BC: .4byte 0x0000893c
_080F66C0:
	strb r4, [r5]
	strb r6, [r5, 0x1]
	movs r0, 0x67
	strb r0, [r5, 0x2]
	adds r5, 0x3
_080F66CA:
	movs r0, 0xFF
	strb r0, [r5]
_080F66CE:
	adds r0, r5, 0
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80F6514

	thumb_func_start sub_80F66E0
sub_80F66E0: @ 80F66E0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r0, _080F676C @ =gUnknown_083DFEC4
	mov r8, r0
	ldr r4, [r0]
	ldr r1, _080F6770 @ =0x00008829
	adds r0, r4, r1
	ldr r2, _080F6774 @ =0x0000876e
	adds r5, r4, r2
	ldrh r1, [r5]
	movs r2, 0
	bl sub_80F6514
	movs r3, 0
	ldrsh r0, [r5, r3]
	movs r1, 0
	bl sub_80F4824
	ldrh r1, [r5]
	ldr r6, _080F6778 @ =0x000087dc
	adds r0, r4, r6
	movs r6, 0
	strh r1, [r0]
	ldr r1, _080F677C @ =0x0000bc8e
	adds r0, r4, r1
	strb r6, [r0]
	movs r2, 0
	mov r9, r2
	movs r3, 0
	ldrsh r1, [r5, r3]
	lsls r1, 2
	adds r1, r4, r1
	ldr r5, _080F6780 @ =0x0000893d
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _080F6784 @ =0x0000893e
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 27
	lsrs r1, 27
	movs r2, 0x52
	movs r3, 0
	bl sub_80F44B0
	adds r7, r0, 0
	ldr r3, _080F6788 @ =0x0000bc8f
	adds r4, r3
	strb r6, [r4]
	movs r5, 0
	mov r12, r5
	mov r10, r8
_080F674E:
	ldr r1, _080F678C @ =gUnknown_083E499C
	mov r6, r12
	lsls r0, r6, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0x36
	bgt _080F6790
	cmp r0, 0x32
	blt _080F6790
	movs r0, 0x7
	adds r2, r7, 0
	ands r2, r0
	lsrs r7, 3
	movs r0, 0x4
	b _080F679A
	.align 2, 0
_080F676C: .4byte gUnknown_083DFEC4
_080F6770: .4byte 0x00008829
_080F6774: .4byte 0x0000876e
_080F6778: .4byte 0x000087dc
_080F677C: .4byte 0x0000bc8e
_080F6780: .4byte 0x0000893d
_080F6784: .4byte 0x0000893e
_080F6788: .4byte 0x0000bc8f
_080F678C: .4byte gUnknown_083E499C
_080F6790:
	movs r0, 0x1
	adds r2, r7, 0
	ands r2, r0
	lsrs r7, 1
	movs r0, 0x1
_080F679A:
	movs r4, 0
	adds r1, r2, 0
	add r0, r9
	mov r8, r0
	cmp r4, r1
	bcs _080F67D4
	mov r3, r10
	ldr r0, [r3]
	ldr r5, _080F6828 @ =0x0000bc8e
	adds r3, r0, r5
	ldr r6, _080F682C @ =0x0000bc4c
	adds r6, r0, r6
	str r6, [sp]
	adds r5, r1, 0
_080F67B6:
	ldrb r0, [r3]
	adds r1, r0, 0x1
	strb r1, [r3]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [sp]
	adds r0, r1, r0
	mov r6, r9
	adds r1, r6, r4
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r5
	bcc _080F67B6
_080F67D4:
	cmp r2, 0
	beq _080F67EC
	mov r0, r9
	cmp r0, 0x18
	bls _080F67EC
	mov r2, r10
	ldr r1, [r2]
	ldr r3, _080F6830 @ =0x0000bc8f
	adds r1, r3
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080F67EC:
	mov r5, r8
	lsls r0, r5, 24
	lsrs r0, 24
	mov r9, r0
	mov r0, r12
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r12, r0
	cmp r0, 0x10
	bls _080F674E
	ldr r6, _080F6834 @ =gUnknown_083DFEC4
	ldr r2, [r6]
	ldr r1, _080F6828 @ =0x0000bc8e
	adds r0, r2, r1
	ldr r3, _080F6830 @ =0x0000bc8f
	adds r1, r2, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080F6840
	ldr r5, _080F6838 @ =0x0000bc90
	adds r0, r2, r5
	movs r1, 0
	strb r1, [r0]
	ldr r6, _080F683C @ =0x0000bc91
	adds r0, r2, r6
	strb r1, [r0]
	b _080F6850
	.align 2, 0
_080F6828: .4byte 0x0000bc8e
_080F682C: .4byte 0x0000bc4c
_080F6830: .4byte 0x0000bc8f
_080F6834: .4byte gUnknown_083DFEC4
_080F6838: .4byte 0x0000bc90
_080F683C: .4byte 0x0000bc91
_080F6840:
	ldr r0, _080F6888 @ =0x0000bc90
	adds r1, r2, r0
	movs r0, 0
	strb r0, [r1]
	ldr r3, _080F688C @ =0x0000bc91
	adds r1, r2, r3
	movs r0, 0x3
	strb r0, [r1]
_080F6850:
	ldr r5, _080F6890 @ =gUnknown_083DFEC4
	ldr r1, [r5]
	ldr r6, _080F6894 @ =0x0000bc8e
	adds r0, r1, r6
	ldr r2, _080F6898 @ =0x0000bc8f
	adds r1, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	subs r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	movs r3, 0
	mov r12, r3
	adds r3, r5, 0
	ldr r1, _080F689C @ =0x0000bc96
	movs r4, 0x9
_080F6870:
	cmp r2, 0x8
	bls _080F68A0
	ldr r0, [r3]
	adds r0, r1
	add r0, r12
	strb r4, [r0]
	adds r0, r2, 0
	subs r0, 0x9
	lsls r0, 24
	lsrs r2, r0, 24
	b _080F68AA
	.align 2, 0
_080F6888: .4byte 0x0000bc90
_080F688C: .4byte 0x0000bc91
_080F6890: .4byte gUnknown_083DFEC4
_080F6894: .4byte 0x0000bc8e
_080F6898: .4byte 0x0000bc8f
_080F689C: .4byte 0x0000bc96
_080F68A0:
	ldr r0, [r3]
	adds r0, r1
	add r0, r12
	strb r2, [r0]
	movs r2, 0
_080F68AA:
	mov r0, r12
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r12, r0
	cmp r0, 0x2
	bls _080F6870
	ldr r5, _080F68DC @ =gUnknown_083DFEC4
	ldr r0, [r5]
	ldr r6, _080F68E0 @ =0x0000bc96
	adds r1, r0, r6
	add r1, r12
	ldr r2, _080F68E4 @ =0x0000bc8f
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F68DC: .4byte gUnknown_083DFEC4
_080F68E0: .4byte 0x0000bc96
_080F68E4: .4byte 0x0000bc8f
	thumb_func_end sub_80F66E0

	thumb_func_start sub_80F68E8
sub_80F68E8: @ 80F68E8
	push {r4-r7,lr}
	ldr r3, _080F6918 @ =gUnknown_083DFEC4
	ldr r0, [r3]
	ldr r2, _080F691C @ =0x0000bc90
	adds r1, r0, r2
	ldrb r5, [r1]
	ldr r6, _080F6920 @ =0x0000bc91
	adds r0, r6
	ldrb r4, [r0]
	movs r0, 0x1
	mov r12, r0
	ldr r2, _080F6924 @ =gMain
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	adds r6, r3, 0
	adds r7, r2, 0
	cmp r0, 0
	beq _080F692E
	lsls r0, r4, 24
	cmp r0, 0
	ble _080F692E
	b _080F69BC
	.align 2, 0
_080F6918: .4byte gUnknown_083DFEC4
_080F691C: .4byte 0x0000bc90
_080F6920: .4byte 0x0000bc91
_080F6924: .4byte gMain
_080F6928:
	ldr r1, _080F69B0 @ =0x0000bc91
	adds r0, r2, r1
	ldrb r4, [r0]
_080F692E:
	ldrh r1, [r7, 0x30]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080F6978
	lsls r0, r4, 24
	asrs r0, 24
	cmp r0, 0x2
	bgt _080F6978
	ldr r3, _080F69B4 @ =gUnknown_083DFEC4
	ldr r2, _080F69B8 @ =0x0000bc96
_080F6944:
	lsls r0, r4, 24
	asrs r0, 24
	cmp r0, 0x2
	bgt _080F6960
	adds r0, 0x1
	lsls r0, 24
	ldr r1, [r3]
	lsrs r4, r0, 24
	asrs r0, 24
	adds r1, r2
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _080F6944
_080F6960:
	ldr r2, [r6]
	lsls r0, r4, 24
	asrs r0, 24
	ldr r3, _080F69B8 @ =0x0000bc96
	adds r1, r2, r3
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _080F69EC
	ldr r1, _080F69B0 @ =0x0000bc91
	adds r0, r2, r1
	ldrb r4, [r0]
_080F6978:
	ldrh r2, [r7, 0x30]
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	beq _080F698A
	lsls r0, r5, 24
	asrs r0, 24
	cmp r0, 0
	bgt _080F6A3C
_080F698A:
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	beq _080F69AA
	lsls r0, r5, 24
	asrs r2, r0, 24
	ldr r1, [r6]
	lsls r0, r4, 24
	asrs r0, 24
	ldr r3, _080F69B8 @ =0x0000bc96
	adds r1, r3
	adds r1, r0
	ldrb r0, [r1]
	subs r0, 0x1
	cmp r2, r0
	blt _080F6A38
_080F69AA:
	movs r0, 0
	mov r12, r0
	b _080F69FC
	.align 2, 0
_080F69B0: .4byte 0x0000bc91
_080F69B4: .4byte gUnknown_083DFEC4
_080F69B8: .4byte 0x0000bc96
_080F69BC:
	lsls r0, r4, 24
	asrs r0, 24
	cmp r0, 0
	ble _080F69DA
	subs r0, 0x1
	lsls r0, 24
	ldr r1, [r6]
	lsrs r4, r0, 24
	asrs r0, 24
	ldr r2, _080F6A2C @ =0x0000bc96
	adds r1, r2
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _080F69BC
_080F69DA:
	ldr r2, [r6]
	lsls r0, r4, 24
	asrs r0, 24
	ldr r3, _080F6A2C @ =0x0000bc96
	adds r1, r2, r3
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _080F6928
_080F69EC:
	lsls r0, r5, 24
	asrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	blt _080F69FC
	subs r0, r1, 0x1
_080F69F8:
	lsls r0, 24
	lsrs r5, r0, 24
_080F69FC:
	mov r0, r12
	cmp r0, 0
	beq _080F6A44
	lsls r0, r5, 24
	asrs r0, 24
	ldr r3, [r6]
	ldr r1, _080F6A30 @ =0x0000bc90
	adds r2, r3, r1
	ldrb r6, [r2]
	cmp r0, r6
	bne _080F6A20
	lsls r0, r4, 24
	asrs r0, 24
	ldr r6, _080F6A34 @ =0x0000bc91
	adds r1, r3, r6
	ldrb r1, [r1]
	cmp r0, r1
	beq _080F6A40
_080F6A20:
	strb r5, [r2]
	ldr r1, _080F6A34 @ =0x0000bc91
	adds r0, r3, r1
	strb r4, [r0]
	b _080F6A44
	.align 2, 0
_080F6A2C: .4byte 0x0000bc96
_080F6A30: .4byte 0x0000bc90
_080F6A34: .4byte 0x0000bc91
_080F6A38:
	adds r0, r2, 0x1
	b _080F69F8
_080F6A3C:
	subs r0, 0x1
	b _080F69F8
_080F6A40:
	movs r2, 0
	mov r12, r2
_080F6A44:
	mov r0, r12
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80F68E8

	thumb_func_start sub_80F6A4C
sub_80F6A4C: @ 80F6A4C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r0, _080F6AC4 @ =gUnknown_083DFEC4
	ldr r3, [r0]
	ldr r0, _080F6AC8 @ =0x0000876e
	adds r2, r3, r0
	lsls r0, r4, 24
	asrs r0, 24
	ldrh r1, [r2]
	adds r0, r1
	strh r0, [r2]
	lsls r0, 16
	cmp r0, 0
	bge _080F6A74
	ldr r5, _080F6ACC @ =0x00008774
	adds r0, r3, r5
	ldrh r0, [r0]
	strh r0, [r2]
_080F6A74:
	ldr r1, _080F6ACC @ =0x00008774
	adds r0, r3, r1
	movs r5, 0
	ldrsh r1, [r2, r5]
	movs r5, 0
	ldrsh r0, [r0, r5]
	cmp r1, r0
	ble _080F6A88
	movs r0, 0
	strh r0, [r2]
_080F6A88:
	ldr r1, _080F6AD0 @ =0x0000bc94
	adds r0, r3, r1
	strb r4, [r0]
	ldrh r1, [r2]
	ldr r2, _080F6AD4 @ =0x000087dc
	adds r0, r3, r2
	strh r1, [r0]
	ldr r1, _080F6AD8 @ =REG_WININ
	ldr r5, _080F6ADC @ =0x00003f37
	adds r0, r5, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080F6AE0 @ =0x00003f3f
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xA
	ldr r5, _080F6AE4 @ =0x000058f0
	adds r0, r5, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080F6AE8 @ =0x00002060
	adds r0, r2, 0
	strh r0, [r1]
	ldr r5, _080F6AEC @ =0x000087de
	adds r1, r3, r5
	movs r0, 0
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F6AC4: .4byte gUnknown_083DFEC4
_080F6AC8: .4byte 0x0000876e
_080F6ACC: .4byte 0x00008774
_080F6AD0: .4byte 0x0000bc94
_080F6AD4: .4byte 0x000087dc
_080F6AD8: .4byte REG_WININ
_080F6ADC: .4byte 0x00003f37
_080F6AE0: .4byte 0x00003f3f
_080F6AE4: .4byte 0x000058f0
_080F6AE8: .4byte 0x00002060
_080F6AEC: .4byte 0x000087de
	thumb_func_end sub_80F6A4C

	thumb_func_start sub_80F6AF0
sub_80F6AF0: @ 80F6AF0
	push {r4,lr}
	ldr r1, _080F6B10 @ =gUnknown_083DFEC4
	ldr r0, [r1]
	ldr r2, _080F6B14 @ =0x000087de
	adds r0, r2
	ldrb r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x6
	bls _080F6B04
	b _080F6C08
_080F6B04:
	lsls r0, 2
	ldr r1, _080F6B18 @ =_080F6B1C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F6B10: .4byte gUnknown_083DFEC4
_080F6B14: .4byte 0x000087de
_080F6B18: .4byte _080F6B1C
	.align 2, 0
_080F6B1C:
	.4byte _080F6B38
	.4byte _080F6B54
	.4byte _080F6B6E
	.4byte _080F6B84
	.4byte _080F6B9C
	.4byte _080F6BC0
	.4byte _080F6BE0
_080F6B38:
	bl sub_80F173C
	lsls r0, 24
	cmp r0, 0
	bne _080F6C18
	ldr r0, _080F6B4C @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r3, _080F6B50 @ =0x000087de
	adds r1, r3
	b _080F6BCE
	.align 2, 0
_080F6B4C: .4byte gUnknown_083DFEC4
_080F6B50: .4byte 0x000087de
_080F6B54:
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 6
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	bl sub_80F1480
	bl sub_80F66E0
	b _080F6BC6
_080F6B6E:
	bl sub_80F1238
	ldr r0, _080F6B7C @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _080F6B80 @ =0x000087de
	adds r1, r2
	b _080F6BCE
	.align 2, 0
_080F6B7C: .4byte gUnknown_083DFEC4
_080F6B80: .4byte 0x000087de
_080F6B84:
	bl sub_80F13FC
	ldr r0, _080F6B94 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r3, _080F6B98 @ =0x000087de
	adds r1, r3
	b _080F6BCE
	.align 2, 0
_080F6B94: .4byte gUnknown_083DFEC4
_080F6B98: .4byte 0x000087de
_080F6B9C:
	ldr r4, [r4]
	ldr r1, _080F6BB8 @ =0x0000876e
	adds r0, r4, r1
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r1, 0
	bl sub_80F4824
	ldr r3, _080F6BBC @ =0x000087de
	adds r4, r3
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _080F6C18
	.align 2, 0
_080F6BB8: .4byte 0x0000876e
_080F6BBC: .4byte 0x000087de
_080F6BC0:
	movs r0, 0
	bl sub_80F2E18
_080F6BC6:
	ldr r0, _080F6BD8 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F6BDC @ =0x000087de
	adds r1, r0
_080F6BCE:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080F6C18
	.align 2, 0
_080F6BD8: .4byte gUnknown_083DFEC4
_080F6BDC: .4byte 0x000087de
_080F6BE0:
	bl sub_80F170C
	lsls r0, 24
	cmp r0, 0
	bne _080F6C18
	bl sub_80F1438
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _080F6C0C @ =0x0000dfff
	ands r0, r1
	strh r0, [r2]
	ldr r0, _080F6C10 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _080F6C14 @ =0x000087de
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080F6C08:
	movs r0, 0
	b _080F6C1A
	.align 2, 0
_080F6C0C: .4byte 0x0000dfff
_080F6C10: .4byte gUnknown_083DFEC4
_080F6C14: .4byte 0x000087de
_080F6C18:
	movs r0, 0x1
_080F6C1A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80F6AF0

	thumb_func_start sub_80F6C20
sub_80F6C20: @ 80F6C20
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _080F6D44 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F6D48 @ =0x0000d158
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
	mov r8, r1
	ldr r2, _080F6D4C @ =gSaveBlock1 + 0x97A
	mov r9, r2
_080F6C3A:
	ldr r1, _080F6D50 @ =gTrainerEyeTrainers
	mov r4, r8
	lsls r0, r4, 4
	adds r6, r0, r1
	ldrh r7, [r6]
	adds r0, r7, 0
	bl trainer_flag_check
	lsls r0, 24
	cmp r0, 0
	beq _080F6CA0
	ldr r0, _080F6D44 @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r0, _080F6D48 @ =0x0000d158
	adds r5, r4, r0
	ldrh r0, [r5]
	lsls r0, 3
	adds r0, r4, r0
	ldr r1, _080F6D54 @ =0x0000cee8
	adds r0, r1
	strh r7, [r0]
	ldrh r0, [r5]
	lsls r0, 3
	adds r0, r4, r0
	ldr r2, _080F6D58 @ =0x0000ceec
	adds r0, r2
	mov r1, r8
	strb r1, [r0]
	ldrh r0, [r5]
	lsls r0, 3
	adds r0, r4, r0
	mov r1, r8
	add r1, r9
	ldrb r1, [r1]
	adds r2, 0x1
	adds r0, r2
	strb r1, [r0]
	ldrh r0, [r6, 0xA]
	ldrh r1, [r6, 0xC]
	bl get_mapheader_by_bank_and_number
	ldrh r1, [r5]
	lsls r1, 3
	adds r4, r1
	ldrb r0, [r0, 0x14]
	ldr r1, _080F6D5C @ =0x0000ceea
	adds r4, r1
	strh r0, [r4]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_080F6CA0:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r0, 0x37
	bls _080F6C3A
	movs r2, 0
	mov r8, r2
	movs r6, 0
_080F6CB4:
	ldr r1, _080F6D60 @ =gUnknown_083E49C0
	mov r4, r8
	lsls r0, r4, 2
	adds r5, r0, r1
	ldrh r4, [r5]
	adds r0, r4, 0
	bl trainer_flag_check
	lsls r0, 24
	cmp r0, 0
	beq _080F6D0E
	ldr r0, _080F6D44 @ =gUnknown_083DFEC4
	ldr r2, [r0]
	ldr r0, _080F6D48 @ =0x0000d158
	adds r3, r2, r0
	ldrh r0, [r3]
	lsls r0, 3
	adds r0, r2, r0
	ldr r1, _080F6D54 @ =0x0000cee8
	adds r0, r1
	strh r4, [r0]
	ldrh r0, [r3]
	lsls r0, 3
	adds r0, r2, r0
	ldrh r1, [r5, 0x2]
	ldr r4, _080F6D5C @ =0x0000ceea
	adds r0, r4
	strh r1, [r0]
	ldrh r0, [r3]
	lsls r0, 3
	adds r0, r2, r0
	ldr r1, _080F6D64 @ =0x0000ceed
	adds r0, r1
	strb r6, [r0]
	ldrh r0, [r3]
	lsls r0, 3
	adds r2, r0
	mov r0, r8
	adds r0, 0x38
	adds r4, 0x2
	adds r2, r4
	strb r0, [r2]
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
_080F6D0E:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r0, 0xC
	bls _080F6CB4
	ldr r3, _080F6D44 @ =gUnknown_083DFEC4
	ldr r2, [r3]
	ldr r1, _080F6D68 @ =0x0000876c
	adds r0, r2, r1
	movs r1, 0
	strh r1, [r0]
	ldr r4, _080F6D6C @ =0x00008770
	adds r0, r2, r4
	strh r1, [r0]
	subs r4, 0x2
	adds r0, r2, r4
	strh r1, [r0]
	ldr r1, _080F6D48 @ =0x0000d158
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, 0x8
	bhi _080F6D70
	subs r4, r0, 0x1
	b _080F6D72
	.align 2, 0
_080F6D44: .4byte gUnknown_083DFEC4
_080F6D48: .4byte 0x0000d158
_080F6D4C: .4byte gSaveBlock1 + 0x97A
_080F6D50: .4byte gTrainerEyeTrainers
_080F6D54: .4byte 0x0000cee8
_080F6D58: .4byte 0x0000ceec
_080F6D5C: .4byte 0x0000ceea
_080F6D60: .4byte gUnknown_083E49C0
_080F6D64: .4byte 0x0000ceed
_080F6D68: .4byte 0x0000876c
_080F6D6C: .4byte 0x00008770
_080F6D70:
	movs r4, 0x7
_080F6D72:
	ldr r1, _080F6DA8 @ =0x00008772
	adds r0, r2, r1
	strh r4, [r0]
	ldr r3, [r3]
	ldr r2, _080F6DAC @ =0x0000d158
	adds r0, r3, r2
	ldrh r0, [r0]
	subs r0, 0x1
	ldr r4, _080F6DB0 @ =0x00008774
	adds r1, r3, r4
	strh r0, [r1]
	movs r1, 0
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080F6D94
	movs r1, 0x1
_080F6D94:
	ldr r2, _080F6DB4 @ =0x000087c9
	adds r0, r3, r2
	strb r1, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F6DA8: .4byte 0x00008772
_080F6DAC: .4byte 0x0000d158
_080F6DB0: .4byte 0x00008774
_080F6DB4: .4byte 0x000087c9
	thumb_func_end sub_80F6C20

	thumb_func_start sub_80F6DB8
sub_80F6DB8: @ 80F6DB8
	push {r4,lr}
	movs r1, 0
	ldr r0, _080F6DEC @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r2, _080F6DF0 @ =0x00008fe9
	adds r0, r4, r2
	strb r1, [r0]
	movs r0, 0
	bl sub_80F6E04
	ldr r0, _080F6DF4 @ =0x0000d15a
	adds r1, r4, r0
	ldr r0, _080F6DF8 @ =0x0000ffb8
	strh r0, [r1]
	movs r0, 0
	bl sub_80F2F7C
	ldr r1, _080F6DFC @ =0x0000876e
	adds r0, r4, r1
	ldrh r0, [r0]
	ldr r2, _080F6E00 @ =0x000087dc
	adds r4, r2
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F6DEC: .4byte gUnknown_083DFEC4
_080F6DF0: .4byte 0x00008fe9
_080F6DF4: .4byte 0x0000d15a
_080F6DF8: .4byte 0x0000ffb8
_080F6DFC: .4byte 0x0000876e
_080F6E00: .4byte 0x000087dc
	thumb_func_end sub_80F6DB8

	thumb_func_start sub_80F6E04
sub_80F6E04: @ 80F6E04
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080F6E78 @ =gUnknown_083DFEC4
	ldr r5, [r0]
	ldr r1, _080F6E7C @ =0x0000876e
	adds r0, r5, r1
	movs r2, 0
	ldrsh r0, [r0, r2]
	lsls r0, 3
	adds r0, r5, r0
	ldr r7, _080F6E80 @ =0x0000cee8
	adds r0, r7
	ldrh r1, [r0]
	ldr r2, _080F6E84 @ =gTrainers
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r6, [r0, 0x3]
	lsls r0, r6, 3
	mov r8, r0
	ldr r0, _080F6E88 @ =gTrainerFrontPicTable
	add r0, r8
	ldr r2, _080F6E8C @ =gTrainerFrontPicCoords
	lsls r1, r6, 2
	adds r1, r2
	ldrb r1, [r1]
	ldr r2, _080F6E90 @ =0x000131e4
	adds r3, r5, r2
	lsls r2, r4, 13
	ldr r7, _080F6E94 @ =0x0000d1e4
	adds r2, r7
	adds r2, r5, r2
	str r2, [sp]
	str r6, [sp, 0x4]
	movs r2, 0x1
	bl DecompressPicFromTable_2
	ldr r0, _080F6E98 @ =gTrainerFrontPicPaletteTable
	add r8, r0
	mov r1, r8
	ldr r0, [r1]
	lsls r4, 7
	adds r5, r4
	adds r1, r5, 0
	bl LZ77UnCompWram
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F6E78: .4byte gUnknown_083DFEC4
_080F6E7C: .4byte 0x0000876e
_080F6E80: .4byte 0x0000cee8
_080F6E84: .4byte gTrainers
_080F6E88: .4byte gTrainerFrontPicTable
_080F6E8C: .4byte gTrainerFrontPicCoords
_080F6E90: .4byte 0x000131e4
_080F6E94: .4byte 0x0000d1e4
_080F6E98: .4byte gTrainerFrontPicPaletteTable
	thumb_func_end sub_80F6E04

	thumb_func_start sub_80F6E9C
sub_80F6E9C: @ 80F6E9C
	push {lr}
	ldr r0, _080F6EB4 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080F6EB8 @ =0x0000d15a
	adds r1, r0, r2
	ldrh r2, [r1]
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _080F6EBC
	movs r0, 0
	b _080F6ED0
	.align 2, 0
_080F6EB4: .4byte gUnknown_083DFEC4
_080F6EB8: .4byte 0x0000d15a
_080F6EBC:
	adds r0, r2, 0
	adds r0, 0x8
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bge _080F6ECC
	movs r0, 0x1
	b _080F6ED0
_080F6ECC:
	movs r0, 0
	strh r0, [r1]
_080F6ED0:
	pop {r1}
	bx r1
	thumb_func_end sub_80F6E9C

	thumb_func_start sub_80F6ED4
sub_80F6ED4: @ 80F6ED4
	push {lr}
	ldr r0, _080F6F00 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080F6F04 @ =0x0000d15a
	adds r1, r0, r2
	ldrh r3, [r1]
	movs r2, 0
	ldrsh r0, [r1, r2]
	movs r2, 0x48
	negs r2, r2
	cmp r0, r2
	beq _080F6F0A
	adds r0, r3, 0
	subs r0, 0x8
	strh r0, [r1]
	lsls r0, 16
	asrs r0, 16
	cmp r0, r2
	ble _080F6F08
	movs r0, 0x1
	b _080F6F0C
	.align 2, 0
_080F6F00: .4byte gUnknown_083DFEC4
_080F6F04: .4byte 0x0000d15a
_080F6F08:
	strh r2, [r1]
_080F6F0A:
	movs r0, 0
_080F6F0C:
	pop {r1}
	bx r1
	thumb_func_end sub_80F6ED4

	thumb_func_start sub_80F6F10
sub_80F6F10: @ 80F6F10
	push {lr}
	ldr r0, _080F6F48 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080F6F4C @ =0x0000d15e
	adds r1, r0, r2
	movs r2, 0
	strb r2, [r1]
	ldr r1, _080F6F50 @ =0x0000d15f
	adds r0, r1
	strb r2, [r0]
	ldr r1, _080F6F54 @ =REG_BLDCNT
	movs r0, 0xC8
	strh r0, [r1]
	ldr r0, _080F6F58 @ =REG_BLDY
	strh r2, [r0]
	subs r1, 0x8
	ldr r2, _080F6F5C @ =0x00003f3f
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080F6F60 @ =0x00001f1f
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0
	bl sub_80F6FB8
	pop {r0}
	bx r0
	.align 2, 0
_080F6F48: .4byte gUnknown_083DFEC4
_080F6F4C: .4byte 0x0000d15e
_080F6F50: .4byte 0x0000d15f
_080F6F54: .4byte REG_BLDCNT
_080F6F58: .4byte REG_BLDY
_080F6F5C: .4byte 0x00003f3f
_080F6F60: .4byte 0x00001f1f
	thumb_func_end sub_80F6F10

	thumb_func_start sub_80F6F64
sub_80F6F64: @ 80F6F64
	push {lr}
	ldr r0, _080F6F9C @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F6FA0 @ =0x0000d15e
	adds r2, r1, r0
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8
	bls _080F6FB0
	movs r0, 0
	strb r0, [r2]
	ldr r0, _080F6FA4 @ =0x0000d15f
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _080F6FAC
	ldr r1, _080F6FA8 @ =REG_BLDY
	movs r0, 0x6
	strh r0, [r1]
	b _080F6FB0
	.align 2, 0
_080F6F9C: .4byte gUnknown_083DFEC4
_080F6FA0: .4byte 0x0000d15e
_080F6FA4: .4byte 0x0000d15f
_080F6FA8: .4byte REG_BLDY
_080F6FAC:
	ldr r0, _080F6FB4 @ =REG_BLDY
	strh r1, [r0]
_080F6FB0:
	pop {r0}
	bx r0
	.align 2, 0
_080F6FB4: .4byte REG_BLDY
	thumb_func_end sub_80F6F64

	thumb_func_start sub_80F6FB8
sub_80F6FB8: @ 80F6FB8
	push {lr}
	lsls r0, 24
	cmp r0, 0
	bne _080F6FDC
	ldr r1, _080F6FD0 @ =REG_WIN0H
	ldr r2, _080F6FD4 @ =0x0000e8f0
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080F6FD8 @ =0x00000888
	b _080F6FE8
	.align 2, 0
_080F6FD0: .4byte REG_WIN0H
_080F6FD4: .4byte 0x0000e8f0
_080F6FD8: .4byte 0x00000888
_080F6FDC:
	ldr r1, _080F6FF0 @ =REG_WIN0H
	ldr r2, _080F6FF4 @ =0x0000e8f0
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080F6FF8 @ =0x00000818
_080F6FE8:
	adds r0, r2, 0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080F6FF0: .4byte REG_WIN0H
_080F6FF4: .4byte 0x0000e8f0
_080F6FF8: .4byte 0x00000818
	thumb_func_end sub_80F6FB8

	thumb_func_start sub_80F6FFC
sub_80F6FFC: @ 80F6FFC
	ldr r0, _080F7008 @ =REG_BLDCNT
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	bx lr
	.align 2, 0
_080F7008: .4byte REG_BLDCNT
	thumb_func_end sub_80F6FFC

.section .text_80F708C

	thumb_func_start sub_80F708C
sub_80F708C: @ 80F708C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r0, _080F70E4 @ =gUnknown_083DFEC4
	ldr r3, [r0]
	ldr r0, _080F70E8 @ =0x0000876e
	adds r2, r3, r0
	lsls r0, r4, 24
	asrs r0, 24
	ldrh r1, [r2]
	adds r0, r1
	strh r0, [r2]
	lsls r0, 16
	cmp r0, 0
	bge _080F70B4
	ldr r5, _080F70EC @ =0x00008774
	adds r0, r3, r5
	ldrh r0, [r0]
	strh r0, [r2]
_080F70B4:
	ldr r1, _080F70EC @ =0x00008774
	adds r0, r3, r1
	movs r5, 0
	ldrsh r1, [r2, r5]
	movs r5, 0
	ldrsh r0, [r0, r5]
	cmp r1, r0
	ble _080F70C8
	movs r0, 0
	strh r0, [r2]
_080F70C8:
	ldr r1, _080F70F0 @ =0x0000bc94
	adds r0, r3, r1
	strb r4, [r0]
	ldrh r1, [r2]
	ldr r2, _080F70F4 @ =0x000087dc
	adds r0, r3, r2
	strh r1, [r0]
	ldr r5, _080F70F8 @ =0x000087de
	adds r1, r3, r5
	movs r0, 0
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F70E4: .4byte gUnknown_083DFEC4
_080F70E8: .4byte 0x0000876e
_080F70EC: .4byte 0x00008774
_080F70F0: .4byte 0x0000bc94
_080F70F4: .4byte 0x000087dc
_080F70F8: .4byte 0x000087de
	thumb_func_end sub_80F708C

	thumb_func_start sub_80F70FC
sub_80F70FC: @ 80F70FC
	push {r4-r6,lr}
	ldr r1, _080F711C @ =gUnknown_083DFEC4
	ldr r0, [r1]
	ldr r2, _080F7120 @ =0x000087de
	adds r0, r2
	ldrb r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x6
	bls _080F7110
	b _080F7218
_080F7110:
	lsls r0, 2
	ldr r1, _080F7124 @ =_080F7128
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F711C: .4byte gUnknown_083DFEC4
_080F7120: .4byte 0x000087de
_080F7124: .4byte _080F7128
	.align 2, 0
_080F7128:
	.4byte _080F7144
	.4byte _080F714A
	.4byte _080F7164
	.4byte _080F716C
	.4byte _080F71A0
	.4byte _080F71BA
	.4byte _080F71EA
_080F7144:
	bl sub_80F6ED4
	b _080F71F8
_080F714A:
	movs r0, 0
	bl sub_80F6E04
	ldr r0, _080F715C @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _080F7160 @ =0x000087de
	adds r1, r2
	b _080F7206
	.align 2, 0
_080F715C: .4byte gUnknown_083DFEC4
_080F7160: .4byte 0x000087de
_080F7164:
	movs r0, 0
	bl sub_80F2F7C
	b _080F71FE
_080F716C:
	ldr r4, [r4]
	ldr r2, _080F7194 @ =0x00008788
	adds r5, r4, r2
	ldr r0, _080F7198 @ =0x0000876e
	adds r6, r4, r0
	ldrh r1, [r6]
	adds r0, r5, 0
	bl sub_80F700C
	adds r0, r5, 0
	bl sub_80F43D4
	bl sub_80F105C
	ldrb r0, [r6]
	bl sub_80F0FFC
	ldr r2, _080F719C @ =0x000087de
	adds r4, r2
	b _080F71CC
	.align 2, 0
_080F7194: .4byte 0x00008788
_080F7198: .4byte 0x0000876e
_080F719C: .4byte 0x000087de
_080F71A0:
	bl sub_80F0CD8
	ldr r0, _080F71D4 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F71D8 @ =0x0000bc95
	adds r2, r1, r0
	movs r0, 0
	strb r0, [r2]
	ldr r2, _080F71DC @ =0x000087de
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080F71BA:
	ldr r0, _080F71D4 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F71D8 @ =0x0000bc95
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, 0x1
	bhi _080F71E0
	bl sub_80F0D5C
_080F71CC:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _080F721C
	.align 2, 0
_080F71D4: .4byte gUnknown_083DFEC4
_080F71D8: .4byte 0x0000bc95
_080F71DC: .4byte 0x000087de
_080F71E0:
	ldr r2, _080F7210 @ =0x000087de
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080F71EA:
	bl sub_80F6E9C
	lsls r0, 24
	cmp r0, 0
	bne _080F721C
	bl sub_80F0D5C
_080F71F8:
	lsls r0, 24
	cmp r0, 0
	bne _080F721C
_080F71FE:
	ldr r0, _080F7214 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F7210 @ =0x000087de
	adds r1, r0
_080F7206:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080F721C
	.align 2, 0
_080F7210: .4byte 0x000087de
_080F7214: .4byte gUnknown_083DFEC4
_080F7218:
	movs r0, 0
	b _080F721E
_080F721C:
	movs r0, 0x1
_080F721E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80F70FC

	thumb_func_start sub_80F7224
sub_80F7224: @ 80F7224
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _080F7260 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x30
	bl GetMonData
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080F7264 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r3, _080F7268 @ =0x00008fe9
	adds r1, r0, r3
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	ldr r3, _080F726C @ =0x00008931
	adds r0, r3
	adds r4, r0, r1
	cmp r2, 0xFF
	beq _080F7270
	adds r0, r2, 0
	movs r1, 0x1D
	bl __udivsi3
	b _080F7272
	.align 2, 0
_080F7260: .4byte gPlayerParty
_080F7264: .4byte gUnknown_083DFEC4
_080F7268: .4byte 0x00008fe9
_080F726C: .4byte 0x00008931
_080F7270:
	movs r0, 0x9
_080F7272:
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80F7224

	.align 2, 0 @ Don't pad with nop.
