	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

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
