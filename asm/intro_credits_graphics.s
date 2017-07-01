	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start load_intro_part2_graphics
load_intro_part2_graphics: @ 8148B8C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08148BE8 @ =gUnknown_0841225C
	ldr r1, _08148BEC @ =0x06004000
	bl LZ77UnCompVram
	ldr r0, _08148BF0 @ =gUnknown_084126DC
	ldr r1, _08148BF4 @ =0x06007800
	bl LZ77UnCompVram
	ldr r0, _08148BF8 @ =gUnknown_084121FC
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	cmp r4, 0
	beq _08148BB4
	cmp r4, 0x1
	beq _08148C14
_08148BB4:
	ldr r0, _08148BFC @ =gUnknown_084128D8
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08148C00 @ =gUnknown_08412EB4
	ldr r1, _08148C04 @ =0x06003000
	bl LZ77UnCompVram
	ldr r0, _08148C08 @ =gUnknown_08412818
	movs r1, 0
	movs r2, 0x60
	bl LoadPalette
	ldr r0, _08148C0C @ =gUnknown_08416B54
	bl LoadCompressedObjectPic
	ldr r0, _08148C10 @ =gUnknown_08413184
	movs r1, 0x80
	lsls r1, 1
	movs r2, 0x20
	bl LoadPalette
	bl sub_8149248
	b _08148C46
	.align 2, 0
_08148BE8: .4byte gUnknown_0841225C
_08148BEC: .4byte 0x06004000
_08148BF0: .4byte gUnknown_084126DC
_08148BF4: .4byte 0x06007800
_08148BF8: .4byte gUnknown_084121FC
_08148BFC: .4byte gUnknown_084128D8
_08148C00: .4byte gUnknown_08412EB4
_08148C04: .4byte 0x06003000
_08148C08: .4byte gUnknown_08412818
_08148C0C: .4byte gUnknown_08416B54
_08148C10: .4byte gUnknown_08413184
_08148C14:
	ldr r0, _08148C58 @ =gUnknown_08413340
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08148C5C @ =gUnknown_084139C8
	ldr r1, _08148C60 @ =0x06003000
	bl LZ77UnCompVram
	ldr r0, _08148C64 @ =gUnknown_08413300
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08148C68 @ =gUnknown_08416BDC
	bl LoadCompressedObjectPic
	ldr r0, _08148C6C @ =gUnknown_08413CCC
	movs r1, 0x80
	lsls r1, 1
	movs r2, 0x20
	bl LoadPalette
	bl sub_8149264
_08148C46:
	ldr r1, _08148C70 @ =gUnknown_0203935C
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08148C74 @ =gReservedSpritePaletteCount
	movs r0, 0x8
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08148C58: .4byte gUnknown_08413340
_08148C5C: .4byte gUnknown_084139C8
_08148C60: .4byte 0x06003000
_08148C64: .4byte gUnknown_08413300
_08148C68: .4byte gUnknown_08416BDC
_08148C6C: .4byte gUnknown_08413CCC
_08148C70: .4byte gUnknown_0203935C
_08148C74: .4byte gReservedSpritePaletteCount
	thumb_func_end load_intro_part2_graphics

	thumb_func_start sub_8148C78
sub_8148C78: @ 8148C78
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08148CA4 @ =REG_BG3CNT
	ldr r2, _08148CA8 @ =0x00000603
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	adds r2, 0xFF
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	ldr r2, _08148CAC @ =0x00000f05
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xA
	movs r2, 0xF2
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08148CA4: .4byte REG_BG3CNT
_08148CA8: .4byte 0x00000603
_08148CAC: .4byte 0x00000f05
	thumb_func_end sub_8148C78

	thumb_func_start sub_8148CB0
sub_8148CB0: @ 8148CB0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08148CD4 @ =gUnknown_0841225C
	ldr r1, _08148CD8 @ =0x06004000
	bl LZ77UnCompVram
	ldr r0, _08148CDC @ =gUnknown_084126DC
	ldr r1, _08148CE0 @ =0x06007800
	bl LZ77UnCompVram
	cmp r4, 0x4
	bhi _08148CFC
	lsls r0, r4, 2
	ldr r1, _08148CE4 @ =_08148CE8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08148CD4: .4byte gUnknown_0841225C
_08148CD8: .4byte 0x06004000
_08148CDC: .4byte gUnknown_084126DC
_08148CE0: .4byte 0x06007800
_08148CE4: .4byte _08148CE8
	.align 2, 0
_08148CE8:
	.4byte _08148CFC
	.4byte _08148D58
	.4byte _08148DC4
	.4byte _08148DC4
	.4byte _08148E1C
_08148CFC:
	ldr r0, _08148D34 @ =gUnknown_084121FC
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08148D38 @ =gUnknown_084128D8
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08148D3C @ =gUnknown_08412EB4
	ldr r1, _08148D40 @ =0x06003000
	bl LZ77UnCompVram
	ldr r0, _08148D44 @ =gUnknown_08412818
	movs r1, 0
	movs r2, 0x60
	bl LoadPalette
	ldr r0, _08148D48 @ =gUnknown_08416B54
	bl LoadCompressedObjectPic
	ldr r0, _08148D4C @ =gUnknown_084131C4
	ldr r1, _08148D50 @ =0x06010000
	bl LZ77UnCompVram
	ldr r0, _08148D54 @ =gUnknown_08413184
	b _08148D8E
	.align 2, 0
_08148D34: .4byte gUnknown_084121FC
_08148D38: .4byte gUnknown_084128D8
_08148D3C: .4byte gUnknown_08412EB4
_08148D40: .4byte 0x06003000
_08148D44: .4byte gUnknown_08412818
_08148D48: .4byte gUnknown_08416B54
_08148D4C: .4byte gUnknown_084131C4
_08148D50: .4byte 0x06010000
_08148D54: .4byte gUnknown_08413184
_08148D58:
	ldr r0, _08148DA0 @ =gUnknown_0841221C
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08148DA4 @ =gUnknown_084128D8
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08148DA8 @ =gUnknown_08412EB4
	ldr r1, _08148DAC @ =0x06003000
	bl LZ77UnCompVram
	ldr r0, _08148DB0 @ =gUnknown_08412878
	movs r1, 0
	movs r2, 0x60
	bl LoadPalette
	ldr r0, _08148DB4 @ =gUnknown_08416B54
	bl LoadCompressedObjectPic
	ldr r0, _08148DB8 @ =gUnknown_084131C4
	ldr r1, _08148DBC @ =0x06010000
	bl LZ77UnCompVram
	ldr r0, _08148DC0 @ =gUnknown_084131A4
_08148D8E:
	movs r1, 0x80
	lsls r1, 1
	movs r2, 0x20
	bl LoadPalette
	bl sub_8149248
	b _08148E58
	.align 2, 0
_08148DA0: .4byte gUnknown_0841221C
_08148DA4: .4byte gUnknown_084128D8
_08148DA8: .4byte gUnknown_08412EB4
_08148DAC: .4byte 0x06003000
_08148DB0: .4byte gUnknown_08412878
_08148DB4: .4byte gUnknown_08416B54
_08148DB8: .4byte gUnknown_084131C4
_08148DBC: .4byte 0x06010000
_08148DC0: .4byte gUnknown_084131A4
_08148DC4:
	ldr r0, _08148E04 @ =gUnknown_0841221C
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08148E08 @ =gUnknown_08413340
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08148E0C @ =gUnknown_084139C8
	ldr r1, _08148E10 @ =0x06003000
	bl LZ77UnCompVram
	ldr r4, _08148E14 @ =gUnknown_08413320
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08148E18 @ =gUnknown_08416BDC
	bl LoadCompressedObjectPic
	movs r1, 0x80
	lsls r1, 1
	adds r0, r4, 0
	movs r2, 0x20
	bl LoadPalette
	bl sub_8149264
	b _08148E58
	.align 2, 0
_08148E04: .4byte gUnknown_0841221C
_08148E08: .4byte gUnknown_08413340
_08148E0C: .4byte gUnknown_084139C8
_08148E10: .4byte 0x06003000
_08148E14: .4byte gUnknown_08413320
_08148E18: .4byte gUnknown_08416BDC
_08148E1C:
	ldr r0, _08148E6C @ =gUnknown_0841223C
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08148E70 @ =gUnknown_08413E78
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08148E74 @ =gUnknown_08414084
	ldr r1, _08148E78 @ =0x06003000
	bl LZ77UnCompVram
	ldr r0, _08148E7C @ =gUnknown_08413E38
	movs r1, 0
	movs r2, 0x40
	bl LoadPalette
	ldr r0, _08148E80 @ =gUnknown_08416C70
	bl LoadCompressedObjectPic
	ldr r0, _08148E84 @ =gUnknown_08414064
	movs r1, 0x80
	lsls r1, 1
	movs r2, 0x20
	bl LoadPalette
	bl sub_8149280
_08148E58:
	ldr r1, _08148E88 @ =gReservedSpritePaletteCount
	movs r0, 0x8
	strb r0, [r1]
	ldr r1, _08148E8C @ =gUnknown_0203935C
	movs r0, 0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08148E6C: .4byte gUnknown_0841223C
_08148E70: .4byte gUnknown_08413E78
_08148E74: .4byte gUnknown_08414084
_08148E78: .4byte 0x06003000
_08148E7C: .4byte gUnknown_08413E38
_08148E80: .4byte gUnknown_08416C70
_08148E84: .4byte gUnknown_08414064
_08148E88: .4byte gReservedSpritePaletteCount
_08148E8C: .4byte gUnknown_0203935C
	thumb_func_end sub_8148CB0

	thumb_func_start sub_8148E90
sub_8148E90: @ 8148E90
	ldr r1, _08148EB4 @ =REG_BG3CNT
	ldr r2, _08148EB8 @ =0x00000603
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	adds r2, 0xFF
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	ldr r2, _08148EBC @ =0x00000f05
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xA
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	bx lr
	.align 2, 0
_08148EB4: .4byte REG_BG3CNT
_08148EB8: .4byte 0x00000603
_08148EBC: .4byte 0x00000f05
	thumb_func_end sub_8148E90

	thumb_func_start sub_8148EC0
sub_8148EC0: @ 8148EC0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	mov r8, r2
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 16
	lsrs r6, 16
	mov r0, r8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r3, 16
	lsrs r3, 16
	ldr r1, _08148F34 @ =sub_8148F3C
	mov r9, r1
	mov r0, r9
	movs r1, 0
	str r3, [sp]
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08148F38 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	strh r5, [r0, 0x8]
	strh r6, [r0, 0xA]
	strh r2, [r0, 0xC]
	strh r2, [r0, 0xE]
	mov r1, r8
	strh r1, [r0, 0x10]
	strh r2, [r0, 0x12]
	strh r2, [r0, 0x14]
	ldr r3, [sp]
	strh r3, [r0, 0x16]
	movs r1, 0x8
	strh r1, [r0, 0x18]
	strh r2, [r0, 0x1A]
	adds r0, r4, 0
	bl _call_via_r9
	adds r0, r4, 0
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08148F34: .4byte sub_8148F3C
_08148F38: .4byte gTasks
	thumb_func_end sub_8148EC0

	thumb_func_start sub_8148F3C
sub_8148F3C: @ 8148F3C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08148FB4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r1
	ldrh r0, [r3, 0xA]
	lsls r4, r0, 16
	adds r6, r1, 0
	cmp r4, 0
	beq _08148F7C
	movs r1, 0xC
	ldrsh r0, [r3, r1]
	lsls r0, 16
	ldrh r1, [r3, 0xE]
	adds r2, r0, r1
	lsrs r0, r4, 12
	subs r2, r0
	asrs r1, r2, 16
	strh r1, [r3, 0xC]
	strh r2, [r3, 0xE]
	ldr r0, _08148FB8 @ =REG_BG1HOFS
	strh r1, [r0]
	ldr r2, _08148FBC @ =REG_BG1VOFS
	ldr r1, _08148FC0 @ =gUnknown_02039358
	ldr r0, _08148FC4 @ =gUnknown_0203935A
	ldrh r0, [r0]
	ldrh r1, [r1]
	adds r0, r1
	strh r0, [r2]
_08148F7C:
	ldrh r0, [r3, 0x10]
	lsls r4, r0, 16
	cmp r4, 0
	beq _08148FD8
	movs r1, 0x12
	ldrsh r0, [r3, r1]
	lsls r0, 16
	ldrh r1, [r3, 0x14]
	adds r2, r0, r1
	lsrs r0, r4, 12
	subs r2, r0
	asrs r1, r2, 16
	strh r1, [r3, 0x12]
	strh r2, [r3, 0x14]
	ldr r0, _08148FC8 @ =REG_BG2HOFS
	strh r1, [r0]
	movs r1, 0x8
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _08148FD0
	ldr r2, _08148FCC @ =REG_BG2VOFS
	ldr r1, _08148FC0 @ =gUnknown_02039358
	ldr r0, _08148FC4 @ =gUnknown_0203935A
	ldrh r0, [r0]
	ldrh r1, [r1]
	adds r0, r1
	strh r0, [r2]
	b _08148FD8
	.align 2, 0
_08148FB4: .4byte gTasks
_08148FB8: .4byte REG_BG1HOFS
_08148FBC: .4byte REG_BG1VOFS
_08148FC0: .4byte gUnknown_02039358
_08148FC4: .4byte gUnknown_0203935A
_08148FC8: .4byte REG_BG2HOFS
_08148FCC: .4byte REG_BG2VOFS
_08148FD0:
	ldr r0, _08149010 @ =REG_BG2VOFS
	ldr r1, _08149014 @ =gUnknown_02039358
	ldrh r1, [r1]
	strh r1, [r0]
_08148FD8:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r6
	ldrh r0, [r3, 0x16]
	lsls r4, r0, 16
	cmp r4, 0
	beq _08149008
	movs r1, 0x18
	ldrsh r0, [r3, r1]
	lsls r0, 16
	ldrh r1, [r3, 0x1A]
	adds r2, r0, r1
	lsrs r0, r4, 12
	subs r2, r0
	asrs r1, r2, 16
	strh r1, [r3, 0x18]
	strh r2, [r3, 0x1A]
	ldr r0, _08149018 @ =REG_BG3HOFS
	strh r1, [r0]
	ldr r1, _0814901C @ =REG_BG3VOFS
	ldr r0, _08149014 @ =gUnknown_02039358
	ldrh r0, [r0]
	strh r0, [r1]
_08149008:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08149010: .4byte REG_BG2VOFS
_08149014: .4byte gUnknown_02039358
_08149018: .4byte REG_BG3HOFS
_0814901C: .4byte REG_BG3VOFS
	thumb_func_end sub_8148F3C

	thumb_func_start sub_8149020
sub_8149020: @ 8149020
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08149100
	cmp r0, 0x1
	ble _08149034
	cmp r0, 0x2
	beq _08149098
_08149034:
	ldr r0, _08149060 @ =gMain
	ldr r2, [r0, 0x20]
	movs r0, 0x3
	ands r0, r2
	cmp r0, 0
	bne _08149100
	ldr r0, _08149064 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08149100
	movs r0, 0x4
	ands r2, r0
	cmp r2, 0
	beq _0814906C
	ldr r2, _08149068 @ =gPlttBufferUnfaded
	ldrh r1, [r2, 0x12]
	mov r0, sp
	strh r1, [r0]
	ldrh r1, [r2, 0x14]
	b _08149076
	.align 2, 0
_08149060: .4byte gMain
_08149064: .4byte gPaletteFade
_08149068: .4byte gPlttBufferUnfaded
_0814906C:
	ldr r2, _08149094 @ =gPlttBufferUnfaded
	ldrh r1, [r2, 0x14]
	mov r0, sp
	strh r1, [r0]
	ldrh r1, [r2, 0x12]
_08149076:
	adds r0, 0x2
	strh r1, [r0]
	adds r4, r0, 0
	mov r0, sp
	movs r1, 0x9
	movs r2, 0x2
	bl LoadPalette
	adds r0, r4, 0
	movs r1, 0xA
	movs r2, 0x2
	bl LoadPalette
	b _08149100
	.align 2, 0
_08149094: .4byte gPlttBufferUnfaded
_08149098:
	ldr r0, _081490C8 @ =gMain
	ldr r2, [r0, 0x20]
	movs r0, 0x3
	ands r0, r2
	cmp r0, 0
	bne _08149100
	ldr r0, _081490CC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08149100
	movs r0, 0x4
	ands r2, r0
	cmp r2, 0
	beq _081490D8
	mov r1, sp
	ldr r2, _081490D0 @ =0x00003d27
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _081490D4 @ =0x00000295
	b _081490E6
	.align 2, 0
_081490C8: .4byte gMain
_081490CC: .4byte gPaletteFade
_081490D0: .4byte 0x00003d27
_081490D4: .4byte 0x00000295
_081490D8:
	mov r1, sp
	movs r2, 0xC7
	lsls r2, 2
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _08149108 @ =0x00003d27
_081490E6:
	adds r0, r2, 0
	strh r0, [r1]
	adds r4, r1, 0
	mov r0, sp
	movs r1, 0xC
	movs r2, 0x2
	bl LoadPalette
	adds r0, r4, 0
	movs r1, 0xD
	movs r2, 0x2
	bl LoadPalette
_08149100:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08149108: .4byte 0x00003d27
	thumb_func_end sub_8149020

	thumb_func_start sub_814910C
sub_814910C: @ 814910C
	push {lr}
	adds r2, r0, 0
	ldr r0, _08149124 @ =gUnknown_0203935C
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _08149128
	adds r0, r2, 0
	bl DestroySprite
	b _0814916C
	.align 2, 0
_08149124: .4byte gUnknown_0203935C
_08149128:
	movs r1, 0x20
	ldrsh r0, [r2, r1]
	lsls r0, 16
	ldrh r1, [r2, 0x32]
	orrs r0, r1
	ldrh r1, [r2, 0x30]
	adds r0, r1
	asrs r1, r0, 16
	strh r1, [r2, 0x20]
	strh r0, [r2, 0x32]
	cmp r1, 0xFF
	ble _08149144
	ldr r0, _08149158 @ =0x0000ffe0
	strh r0, [r2, 0x20]
_08149144:
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _08149164
	ldr r1, _0814915C @ =gUnknown_02039358
	ldr r0, _08149160 @ =gUnknown_0203935A
	ldrh r0, [r0]
	ldrh r1, [r1]
	adds r0, r1
	b _08149168
	.align 2, 0
_08149158: .4byte 0x0000ffe0
_0814915C: .4byte gUnknown_02039358
_08149160: .4byte gUnknown_0203935A
_08149164:
	ldr r0, _08149170 @ =gUnknown_02039358
	ldrh r0, [r0]
_08149168:
	negs r0, r0
	strh r0, [r2, 0x26]
_0814916C:
	pop {r0}
	bx r0
	.align 2, 0
_08149170: .4byte gUnknown_02039358
	thumb_func_end sub_814910C

	thumb_func_start sub_8149174
sub_8149174: @ 8149174
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	str r1, [sp, 0x4]
	str r2, [sp, 0x8]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	movs r7, 0
	cmp r7, r8
	bcs _0814922A
	ldr r0, _0814923C @ =gSprites
	mov r10, r0
	movs r2, 0x3F
	mov r9, r2
_0814919E:
	lsls r6, r7, 3
	ldr r0, [sp, 0x4]
	adds r6, r0
	ldrb r1, [r6, 0x1]
	ldrb r2, [r6, 0x2]
	ldrb r3, [r6, 0x3]
	ldr r0, _08149240 @ =gSpriteTemplate_8416B3C
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r5, r0, 4
	adds r5, r0
	lsls r5, 2
	mov r2, r10
	adds r4, r5, r2
	ldrb r2, [r6]
	lsls r1, r2, 26
	lsrs r1, 30
	lsrs r2, 6
	adds r0, r4, 0
	movs r3, 0
	bl CalcCenterToCornerVec
	ldrb r3, [r4, 0x5]
	movs r0, 0xC
	orrs r3, r0
	strb r3, [r4, 0x5]
	ldrb r1, [r6]
	lsls r1, 26
	lsrs r1, 30
	lsls r1, 6
	ldrb r2, [r4, 0x1]
	mov r0, r9
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r6]
	lsrs r1, 6
	lsls r1, 6
	ldrb r2, [r4, 0x3]
	mov r0, r9
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x3]
	movs r0, 0xF
	ands r3, r0
	strb r3, [r4, 0x5]
	ldr r0, _08149244 @ =gSprites + 0x8
	adds r5, r0
	ldr r2, [sp, 0x8]
	str r2, [r5]
	ldrb r1, [r6]
	lsls r1, 28
	lsrs r1, 28
	adds r0, r4, 0
	bl StartSpriteAnim
	movs r1, 0
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x2E]
	ldrh r0, [r6, 0x4]
	strh r0, [r4, 0x30]
	strh r1, [r4, 0x32]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, r8
	bcc _0814919E
_0814922A:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814923C: .4byte gSprites
_08149240: .4byte gSpriteTemplate_8416B3C
_08149244: .4byte gSprites + 0x8
	thumb_func_end sub_8149174

	thumb_func_start sub_8149248
sub_8149248: @ 8149248
	push {lr}
	ldr r1, _0814925C @ =gUnknown_08416B94
	ldr r2, _08149260 @ =gSpriteAnimTable_8416B84
	movs r0, 0
	movs r3, 0x9
	bl sub_8149174
	pop {r0}
	bx r0
	.align 2, 0
_0814925C: .4byte gUnknown_08416B94
_08149260: .4byte gSpriteAnimTable_8416B84
	thumb_func_end sub_8149248

	thumb_func_start sub_8149264
sub_8149264: @ 8149264
	push {lr}
	ldr r1, _08149278 @ =gUnknown_08416C10
	ldr r2, _0814927C @ =gSpriteAnimTable_8416C04
	movs r0, 0x1
	movs r3, 0xC
	bl sub_8149174
	pop {r0}
	bx r0
	.align 2, 0
_08149278: .4byte gUnknown_08416C10
_0814927C: .4byte gSpriteAnimTable_8416C04
	thumb_func_end sub_8149264

	thumb_func_start sub_8149280
sub_8149280: @ 8149280
	push {lr}
	ldr r1, _08149294 @ =gUnknown_08416C8C
	ldr r2, _08149298 @ =gSpriteAnimTable_8416C88
	movs r0, 0x1
	movs r3, 0x6
	bl sub_8149174
	pop {r0}
	bx r0
	.align 2, 0
_08149294: .4byte gUnknown_08416C8C
_08149298: .4byte gSpriteAnimTable_8416C88
	thumb_func_end sub_8149280

	thumb_func_start nullsub_82
nullsub_82: @ 814929C
	bx lr
	thumb_func_end nullsub_82

	thumb_func_start sub_81492A0
sub_81492A0: @ 81492A0
	push {r4,lr}
	ldr r4, _0814930C @ =gSprites
	movs r1, 0x2E
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	adds r1, 0x3E
	ldrb r1, [r1]
	movs r2, 0x3E
	adds r2, r0
	mov r12, r2
	movs r2, 0x4
	ands r2, r1
	mov r1, r12
	ldrb r3, [r1]
	movs r1, 0x5
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	mov r2, r12
	strb r1, [r2]
	movs r1, 0x2E
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x20]
	strh r1, [r0, 0x20]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x22]
	adds r1, 0x8
	strh r1, [r0, 0x22]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x24]
	strh r1, [r0, 0x24]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x26]
	strh r1, [r0, 0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814930C: .4byte gSprites
	thumb_func_end sub_81492A0

	thumb_func_start intro_create_brendan_sprite
intro_create_brendan_sprite: @ 8149310
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r0, _0814935C @ =gSpriteTemplate_8416CDC
	lsls r5, 16
	asrs r5, 16
	lsls r4, 16
	asrs r4, 16
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0
	bl CreateSprite
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _08149360 @ =gSpriteTemplate_8416D2C
	adds r4, 0x8
	lsls r4, 16
	asrs r4, 16
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08149364 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	strh r6, [r1, 0x2E]
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0814935C: .4byte gSpriteTemplate_8416CDC
_08149360: .4byte gSpriteTemplate_8416D2C
_08149364: .4byte gSprites
	thumb_func_end intro_create_brendan_sprite

	thumb_func_start intro_create_may_sprite
intro_create_may_sprite: @ 8149368
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r0, _081493B4 @ =gSpriteTemplate_8416CF4
	lsls r5, 16
	asrs r5, 16
	lsls r4, 16
	asrs r4, 16
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0
	bl CreateSprite
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _081493B8 @ =gSpriteTemplate_8416D44
	adds r4, 0x8
	lsls r4, 16
	asrs r4, 16
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081493BC @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	strh r6, [r1, 0x2E]
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081493B4: .4byte gSpriteTemplate_8416CF4
_081493B8: .4byte gSpriteTemplate_8416D44
_081493BC: .4byte gSprites
	thumb_func_end intro_create_may_sprite

	thumb_func_start nullsub_83
nullsub_83: @ 81493C0
	bx lr
	thumb_func_end nullsub_83

	thumb_func_start sub_81493C4
sub_81493C4: @ 81493C4
	push {r4,lr}
	ldr r4, _08149420 @ =gSprites
	movs r1, 0x2E
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	adds r1, 0x3E
	ldrb r1, [r1]
	movs r2, 0x3E
	adds r2, r0
	mov r12, r2
	movs r2, 0x4
	ands r2, r1
	mov r1, r12
	ldrb r3, [r1]
	movs r1, 0x5
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	mov r2, r12
	strb r1, [r2]
	movs r1, 0x2E
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x22]
	strh r1, [r0, 0x22]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x24]
	strh r1, [r0, 0x24]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x26]
	strh r1, [r0, 0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08149420: .4byte gSprites
	thumb_func_end sub_81493C4

	thumb_func_start intro_create_latios_sprite
intro_create_latios_sprite: @ 8149424
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r2, r0, 0
	adds r5, r1, 0
	ldr r0, _08149490 @ =gSpriteTemplate_8416D7C
	mov r8, r0
	lsls r2, 16
	asrs r4, r2, 16
	ldr r0, _08149494 @ =0xffe00000
	adds r2, r0
	asrs r2, 16
	lsls r5, 16
	asrs r5, 16
	mov r0, r8
	adds r1, r2, 0
	adds r2, r5, 0
	movs r3, 0x2
	bl CreateSprite
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	adds r4, 0x20
	lsls r4, 16
	asrs r4, 16
	mov r0, r8
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08149498 @ =gSprites
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r0, r4, r5
	strh r6, [r0, 0x2E]
	movs r1, 0x1
	bl StartSpriteAnim
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _0814949C @ =sub_81493C4
	str r0, [r4]
	adds r0, r6, 0
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08149490: .4byte gSpriteTemplate_8416D7C
_08149494: .4byte 0xffe00000
_08149498: .4byte gSprites
_0814949C: .4byte sub_81493C4
	thumb_func_end intro_create_latios_sprite

	thumb_func_start intro_create_latias_sprite
intro_create_latias_sprite: @ 81494A0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r2, r0, 0
	adds r5, r1, 0
	ldr r0, _0814950C @ =gSpriteTemplate_8416D94
	mov r8, r0
	lsls r2, 16
	asrs r4, r2, 16
	ldr r0, _08149510 @ =0xffe00000
	adds r2, r0
	asrs r2, 16
	lsls r5, 16
	asrs r5, 16
	mov r0, r8
	adds r1, r2, 0
	adds r2, r5, 0
	movs r3, 0x2
	bl CreateSprite
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	adds r4, 0x20
	lsls r4, 16
	asrs r4, 16
	mov r0, r8
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08149514 @ =gSprites
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r0, r4, r5
	strh r6, [r0, 0x2E]
	movs r1, 0x1
	bl StartSpriteAnim
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _08149518 @ =sub_81493C4
	str r0, [r4]
	adds r0, r6, 0
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0814950C: .4byte gSpriteTemplate_8416D94
_08149510: .4byte 0xffe00000
_08149514: .4byte gSprites
_08149518: .4byte sub_81493C4
	thumb_func_end intro_create_latias_sprite

	.align 2, 0 @ Don't pad with nop.
