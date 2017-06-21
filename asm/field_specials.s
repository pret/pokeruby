	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_810F9AC
sub_810F9AC: @ 810F9AC
	push {r4,r5,lr}
	ldr r2, _0810F9C0 @ =gScriptResult
	ldrh r1, [r2]
	ldr r0, _0810F9C4 @ =0x0000270f
	cmp r1, r0
	bls _0810F9C8
	movs r0, 0
	bl sub_80BF088
	b _0810FA4A
	.align 2, 0
_0810F9C0: .4byte gScriptResult
_0810F9C4: .4byte 0x0000270f
_0810F9C8:
	ldr r0, _0810F9D8 @ =0x000003e7
	cmp r1, r0
	bls _0810F9E0
	ldr r4, _0810F9DC @ =gStringVar1
	movs r0, 0xA1
	strb r0, [r4]
	adds r4, 0x1
	b _0810FA04
	.align 2, 0
_0810F9D8: .4byte 0x000003e7
_0810F9DC: .4byte gStringVar1
_0810F9E0:
	cmp r1, 0x63
	bls _0810F9F4
	ldr r4, _0810F9F0 @ =gStringVar1
	movs r0, 0xA1
	strb r0, [r4]
	strb r0, [r4, 0x1]
	adds r4, 0x2
	b _0810FA04
	.align 2, 0
_0810F9F0: .4byte gStringVar1
_0810F9F4:
	cmp r1, 0x9
	bls _0810FA24
	ldr r4, _0810FA20 @ =gStringVar1
	movs r0, 0xA1
	strb r0, [r4]
	strb r0, [r4, 0x1]
	strb r0, [r4, 0x2]
	adds r4, 0x3
_0810FA04:
	ldrh r5, [r2]
	adds r0, r5, 0
	bl sub_80BF0B8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	bl ConvertIntToDecimalStringN
	b _0810FA4A
	.align 2, 0
_0810FA20: .4byte gStringVar1
_0810FA24:
	ldr r4, _0810FA50 @ =gStringVar1
	movs r0, 0xA1
	strb r0, [r4]
	strb r0, [r4, 0x1]
	strb r0, [r4, 0x2]
	strb r0, [r4, 0x3]
	adds r4, 0x4
	ldrh r5, [r2]
	adds r0, r5, 0
	bl sub_80BF0B8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	bl ConvertIntToDecimalStringN
_0810FA4A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810FA50: .4byte gStringVar1
	thumb_func_end sub_810F9AC

	thumb_func_start ResetFanClub
ResetFanClub: @ 810FA54
	ldr r0, _0810FA68 @ =gSaveBlock1
	ldr r2, _0810FA6C @ =0x000013c2
	adds r1, r0, r2
	movs r2, 0
	strh r2, [r1]
	ldr r1, _0810FA70 @ =0x000013c4
	adds r0, r1
	strh r2, [r0]
	bx lr
	.align 2, 0
_0810FA68: .4byte gSaveBlock1
_0810FA6C: .4byte 0x000013c2
_0810FA70: .4byte 0x000013c4
	thumb_func_end ResetFanClub

	thumb_func_start sub_810FA74
sub_810FA74: @ 810FA74
	push {lr}
	bl sub_810FF30
	lsls r0, 24
	cmp r0, 0
	beq _0810FA90
	bl sub_810FCE8
	ldr r0, _0810FA94 @ =gSaveBlock1
	ldr r1, _0810FA98 @ =gSaveBlock2
	ldrh r1, [r1, 0xE]
	ldr r2, _0810FA9C @ =0x000013c4
	adds r0, r2
	strh r1, [r0]
_0810FA90:
	pop {r0}
	bx r0
	.align 2, 0
_0810FA94: .4byte gSaveBlock1
_0810FA98: .4byte gSaveBlock2
_0810FA9C: .4byte 0x000013c4
	thumb_func_end sub_810FA74

	thumb_func_start sub_810FAA0
sub_810FAA0: @ 810FAA0
	push {r4,lr}
	ldr r4, _0810FAF0 @ =gSaveBlock1
	ldr r1, _0810FAF4 @ =0x000013c2
	adds r0, r4, r1
	ldrh r0, [r0]
	lsrs r0, 7
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0810FAE8
	bl sub_810FF48
	bl sub_810FD80
	ldr r0, _0810FAF8 @ =gSaveBlock2
	ldrh r1, [r0, 0xE]
	ldr r2, _0810FAFC @ =0x000013c4
	adds r0, r4, r2
	strh r1, [r0]
	ldr r0, _0810FB00 @ =0x00000315
	bl FlagReset
	ldr r0, _0810FB04 @ =0x00000316
	bl FlagReset
	ldr r0, _0810FB08 @ =0x00000317
	bl FlagReset
	movs r0, 0xC6
	lsls r0, 2
	bl FlagReset
	ldr r0, _0810FB0C @ =0x00004095
	movs r1, 0x1
	bl VarSet
_0810FAE8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810FAF0: .4byte gSaveBlock1
_0810FAF4: .4byte 0x000013c2
_0810FAF8: .4byte gSaveBlock2
_0810FAFC: .4byte 0x000013c4
_0810FB00: .4byte 0x00000315
_0810FB04: .4byte 0x00000316
_0810FB08: .4byte 0x00000317
_0810FB0C: .4byte 0x00004095
	thumb_func_end sub_810FAA0

	thumb_func_start sub_810FB10
sub_810FB10: @ 810FB10
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0810FB54 @ =0x00004095
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bne _0810FB80
	ldr r0, _0810FB58 @ =gSaveBlock1
	ldr r1, _0810FB5C @ =0x000013c2
	adds r4, r0, r1
	ldrh r2, [r4]
	movs r1, 0x7F
	ands r1, r2
	ldr r0, _0810FB60 @ =gUnknown_083F8404
	adds r0, r5, r0
	ldrb r0, [r0]
	adds r1, r0
	cmp r1, 0x13
	ble _0810FB7C
	bl sub_810FCB0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bhi _0810FB68
	bl sub_810FB9C
	ldrh r1, [r4]
	ldr r0, _0810FB64 @ =0x0000ff80
	ands r0, r1
	b _0810FB7E
	.align 2, 0
_0810FB54: .4byte 0x00004095
_0810FB58: .4byte gSaveBlock1
_0810FB5C: .4byte 0x000013c2
_0810FB60: .4byte gUnknown_083F8404
_0810FB64: .4byte 0x0000ff80
_0810FB68:
	ldrh r0, [r4]
	ldr r1, _0810FB78 @ =0x0000ff80
	ands r1, r0
	movs r0, 0x14
	orrs r1, r0
	strh r1, [r4]
	b _0810FB80
	.align 2, 0
_0810FB78: .4byte 0x0000ff80
_0810FB7C:
	adds r0, r2, r0
_0810FB7E:
	strh r0, [r4]
_0810FB80:
	ldr r0, _0810FB94 @ =gSaveBlock1
	ldr r1, _0810FB98 @ =0x000013c2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x7F
	ands r0, r1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0810FB94: .4byte gSaveBlock1
_0810FB98: .4byte 0x000013c2
	thumb_func_end sub_810FB10

	thumb_func_start sub_810FB9C
sub_810FB9C: @ 810FB9C
	push {r4-r7,lr}
	sub sp, 0x4
	movs r3, 0
	movs r5, 0
	ldr r7, _0810FBD8 @ =gSaveBlock1 + 0x13C2
	movs r6, 0x1
_0810FBA8:
	ldrh r1, [r7]
	ldr r0, _0810FBDC @ =gUnknown_083F8408
	adds r0, r5, r0
	ldrb r4, [r0]
	asrs r1, r4
	ands r1, r6
	cmp r1, 0
	bne _0810FBE0
	adds r3, r5, 0
	str r3, [sp]
	bl Random
	adds r1, r6, 0
	ands r1, r0
	ldr r3, [sp]
	cmp r1, 0
	beq _0810FBE0
	adds r0, r6, 0
	lsls r0, r4
	ldrh r1, [r7]
	orrs r0, r1
	strh r0, [r7]
	b _0810FC00
	.align 2, 0
_0810FBD8: .4byte gSaveBlock1 + 0x13C2
_0810FBDC: .4byte gUnknown_083F8408
_0810FBE0:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _0810FBA8
	ldr r2, _0810FC0C @ =gSaveBlock1
	ldr r0, _0810FC10 @ =0x000013c2
	adds r2, r0
	ldr r1, _0810FC14 @ =gUnknown_083F8408
	adds r1, r3, r1
	movs r0, 0x1
	ldrb r1, [r1]
	lsls r0, r1
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
_0810FC00:
	adds r0, r3, 0
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810FC0C: .4byte gSaveBlock1
_0810FC10: .4byte 0x000013c2
_0810FC14: .4byte gUnknown_083F8408
	thumb_func_end sub_810FB9C

	thumb_func_start sub_810FC18
sub_810FC18: @ 810FC18
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r0, 0
	mov r8, r0
	bl sub_810FCB0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bne _0810FC3E
	movs r0, 0
	b _0810FC94
_0810FC34:
	lsls r4, r6
	ldrh r0, [r2]
	eors r4, r0
	strh r4, [r2]
	b _0810FC92
_0810FC3E:
	movs r5, 0
	ldr r2, _0810FCA0 @ =gSaveBlock1 + 0x13C2
	movs r4, 0x1
_0810FC44:
	ldrh r1, [r2]
	ldr r7, _0810FCA4 @ =gUnknown_083F8410
	adds r0, r5, r7
	ldrb r6, [r0]
	asrs r1, r6
	ands r1, r4
	cmp r1, 0
	beq _0810FC66
	mov r8, r5
	str r2, [sp]
	bl Random
	adds r1, r4, 0
	ands r1, r0
	ldr r2, [sp]
	cmp r1, 0
	bne _0810FC34
_0810FC66:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _0810FC44
	ldr r0, _0810FCA8 @ =gSaveBlock1
	ldr r1, _0810FCAC @ =0x000013c2
	adds r4, r0, r1
	ldrh r1, [r4]
	mov r2, r8
	adds r0, r2, r7
	ldrb r2, [r0]
	adds r0, r1, 0
	asrs r0, r2
	movs r3, 0x1
	ands r0, r3
	cmp r0, 0
	beq _0810FC92
	adds r0, r3, 0
	lsls r0, r2
	eors r1, r0
	strh r1, [r4]
_0810FC92:
	mov r0, r8
_0810FC94:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810FCA0: .4byte gSaveBlock1 + 0x13C2
_0810FCA4: .4byte gUnknown_083F8410
_0810FCA8: .4byte gSaveBlock1
_0810FCAC: .4byte 0x000013c2
	thumb_func_end sub_810FC18

	thumb_func_start sub_810FCB0
sub_810FCB0: @ 810FCB0
	push {r4,r5,lr}
	movs r3, 0
	movs r2, 0
	ldr r0, _0810FCE4 @ =gSaveBlock1 + 0x13C2
	ldrh r4, [r0]
	movs r5, 0x1
_0810FCBC:
	adds r1, r2, 0
	adds r1, 0x8
	adds r0, r4, 0
	asrs r0, r1
	ands r0, r5
	cmp r0, 0
	beq _0810FCD0
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
_0810FCD0:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _0810FCBC
	adds r0, r3, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0810FCE4: .4byte gSaveBlock1 + 0x13C2
	thumb_func_end sub_810FCB0

	thumb_func_start sub_810FCE8
sub_810FCE8: @ 810FCE8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r5, 0
	ldr r2, _0810FD08 @ =gSaveBlock2
	ldrh r1, [r2, 0xE]
	ldr r0, _0810FD0C @ =0x000003e6
	cmp r1, r0
	bhi _0810FD54
	ldr r7, _0810FD10 @ =gSaveBlock1
	adds r6, r2, 0
	ldr r0, _0810FD14 @ =0x000013c4
	adds r0, r7
	mov r8, r0
	b _0810FD36
	.align 2, 0
_0810FD08: .4byte gSaveBlock2
_0810FD0C: .4byte 0x000003e6
_0810FD10: .4byte gSaveBlock1
_0810FD14: .4byte 0x000013c4
_0810FD18:
	ldrh r1, [r6, 0xE]
	ldr r0, _0810FD4C @ =0x000013c4
	adds r4, r7, r0
	ldrh r0, [r4]
	subs r1, r0
	cmp r1, 0xB
	ble _0810FD54
	bl sub_810FC18
	ldrh r0, [r4]
	adds r0, 0xC
	strh r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0810FD36:
	bl sub_810FCB0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4
	bhi _0810FD50
	ldrh r0, [r6, 0xE]
	mov r1, r8
	strh r0, [r1]
	b _0810FD54
	.align 2, 0
_0810FD4C: .4byte 0x000013c4
_0810FD50:
	cmp r5, 0x8
	bne _0810FD18
_0810FD54:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810FCE8

	thumb_func_start sub_810FD60
sub_810FD60: @ 810FD60
	ldr r0, _0810FD74 @ =gSaveBlock1
	ldr r1, _0810FD78 @ =0x000013c2
	adds r0, r1
	ldrh r0, [r0]
	ldr r1, _0810FD7C @ =gSpecialVar_0x8004
	ldrh r1, [r1]
	asrs r0, r1
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_0810FD74: .4byte gSaveBlock1
_0810FD78: .4byte 0x000013c2
_0810FD7C: .4byte gSpecialVar_0x8004
	thumb_func_end sub_810FD60

	thumb_func_start sub_810FD80
sub_810FD80: @ 810FD80
	ldr r2, _0810FDA4 @ =gSaveBlock1
	ldr r0, _0810FDA8 @ =0x000013c2
	adds r2, r0
	ldrh r1, [r2]
	movs r3, 0x80
	lsls r3, 6
	adds r0, r3, 0
	orrs r0, r1
	movs r3, 0x80
	lsls r3, 1
	adds r1, r3, 0
	orrs r0, r1
	movs r3, 0x80
	lsls r3, 3
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_0810FDA4: .4byte gSaveBlock1
_0810FDA8: .4byte 0x000013c2
	thumb_func_end sub_810FD80

	thumb_func_start sub_810FDAC
sub_810FDAC: @ 810FDAC
	push {lr}
	movs r3, 0
	movs r2, 0
	ldr r0, _0810FDC8 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	subs r0, 0x8
	cmp r0, 0x7
	bhi _0810FE0C
	lsls r0, 2
	ldr r1, _0810FDCC @ =_0810FDD0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810FDC8: .4byte gSpecialVar_0x8004
_0810FDCC: .4byte _0810FDD0
	.align 2, 0
_0810FDD0:
	.4byte _0810FE0C
	.4byte _0810FE0C
	.4byte _0810FDF0
	.4byte _0810FDF6
	.4byte _0810FDFC
	.4byte _0810FE02
	.4byte _0810FE08
	.4byte _0810FE0C
_0810FDF0:
	movs r3, 0
	movs r2, 0x3
	b _0810FE0C
_0810FDF6:
	movs r3, 0
	movs r2, 0x1
	b _0810FE0C
_0810FDFC:
	movs r3, 0x1
	movs r2, 0
	b _0810FE0C
_0810FE02:
	movs r3, 0
	movs r2, 0x4
	b _0810FE0C
_0810FE08:
	movs r3, 0x1
	movs r2, 0x5
_0810FE0C:
	ldr r0, _0810FE18 @ =gSaveBlock1 + 0x30B8
	adds r1, r3, 0
	bl sub_810FE1C
	pop {r0}
	bx r0
	.align 2, 0
_0810FE18: .4byte gSaveBlock1 + 0x30B8
	thumb_func_end sub_810FDAC

	thumb_func_start sub_810FE1C
sub_810FE1C: @ 810FE1C
	push {r4,lr}
	lsls r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsrs r1, 20
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _0810FED0
	cmp r2, 0x5
	bhi _0810FEBC
	lsls r0, r2, 2
	ldr r1, _0810FE3C @ =_0810FE40
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810FE3C: .4byte _0810FE40
	.align 2, 0
_0810FE40:
	.4byte _0810FEBC
	.4byte _0810FE58
	.4byte _0810FE6C
	.4byte _0810FE80
	.4byte _0810FE94
	.4byte _0810FEA8
_0810FE58:
	ldr r0, _0810FE64 @ =gStringVar1
	ldr r1, _0810FE68 @ =gOtherText_Steven
	bl StringCopy
	b _0810FEF2
	.align 2, 0
_0810FE64: .4byte gStringVar1
_0810FE68: .4byte gOtherText_Steven
_0810FE6C:
	ldr r0, _0810FE78 @ =gStringVar1
	ldr r1, _0810FE7C @ =gOtherText_Brawly
	bl StringCopy
	b _0810FEF2
	.align 2, 0
_0810FE78: .4byte gStringVar1
_0810FE7C: .4byte gOtherText_Brawly
_0810FE80:
	ldr r0, _0810FE8C @ =gStringVar1
	ldr r1, _0810FE90 @ =gOtherText_Winona
	bl StringCopy
	b _0810FEF2
	.align 2, 0
_0810FE8C: .4byte gStringVar1
_0810FE90: .4byte gOtherText_Winona
_0810FE94:
	ldr r0, _0810FEA0 @ =gStringVar1
	ldr r1, _0810FEA4 @ =gOtherText_Phoebe
	bl StringCopy
	b _0810FEF2
	.align 2, 0
_0810FEA0: .4byte gStringVar1
_0810FEA4: .4byte gOtherText_Phoebe
_0810FEA8:
	ldr r0, _0810FEB4 @ =gStringVar1
	ldr r1, _0810FEB8 @ =gOtherText_Glacia
	bl StringCopy
	b _0810FEF2
	.align 2, 0
_0810FEB4: .4byte gStringVar1
_0810FEB8: .4byte gOtherText_Glacia
_0810FEBC:
	ldr r0, _0810FEC8 @ =gStringVar1
	ldr r1, _0810FECC @ =gOtherText_Wallace
	bl StringCopy
	b _0810FEF2
	.align 2, 0
_0810FEC8: .4byte gStringVar1
_0810FECC: .4byte gOtherText_Wallace
_0810FED0:
	ldr r4, _0810FEF8 @ =gStringVar1
	adds r0, r4, 0
	movs r2, 0x7
	bl StringCopyN
	movs r0, 0xFF
	strb r0, [r4, 0x7]
	ldrb r0, [r4]
	cmp r0, 0xFC
	bne _0810FEF2
	ldrb r0, [r4, 0x1]
	cmp r0, 0x15
	bne _0810FEF2
	adds r0, r4, 0
	movs r1, 0x1
	bl ConvertInternationalString
_0810FEF2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810FEF8: .4byte gStringVar1
	thumb_func_end sub_810FE1C

	thumb_func_start sub_810FEFC
sub_810FEFC: @ 810FEFC
	push {lr}
	ldr r0, _0810FF20 @ =0x00004095
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bne _0810FF2C
	bl sub_810FA74
	ldr r0, _0810FF24 @ =gUnknown_02024D26
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0810FF28
	bl sub_810FB9C
	b _0810FF2C
	.align 2, 0
_0810FF20: .4byte 0x00004095
_0810FF24: .4byte gUnknown_02024D26
_0810FF28:
	bl sub_810FC18
_0810FF2C:
	pop {r0}
	bx r0
	thumb_func_end sub_810FEFC

	thumb_func_start sub_810FF30
sub_810FF30: @ 810FF30
	ldr r0, _0810FF40 @ =gSaveBlock1
	ldr r1, _0810FF44 @ =0x000013c2
	adds r0, r1
	ldrh r0, [r0]
	lsrs r0, 7
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_0810FF40: .4byte gSaveBlock1
_0810FF44: .4byte 0x000013c2
	thumb_func_end sub_810FF30

	thumb_func_start sub_810FF48
sub_810FF48: @ 810FF48
	ldr r0, _0810FF58 @ =gSaveBlock1
	ldr r1, _0810FF5C @ =0x000013c2
	adds r0, r1
	ldrh r2, [r0]
	movs r1, 0x80
	orrs r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_0810FF58: .4byte gSaveBlock1
_0810FF5C: .4byte 0x000013c2
	thumb_func_end sub_810FF48

	thumb_func_start sub_810FF60
sub_810FF60: @ 810FF60
	push {lr}
	ldr r0, _0810FF74 @ =gSpecialVar_0x8004
	ldrb r0, [r0]
	bl sub_810FB10
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0810FF74: .4byte gSpecialVar_0x8004
	thumb_func_end sub_810FF60

	.align 2, 0 @ Don't pad with nop.
