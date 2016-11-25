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

	thumb_func_start nullsub_84
nullsub_84: @ 814951C
	bx lr
	thumb_func_end nullsub_84

	thumb_func_start sub_8149520
sub_8149520: @ 8149520
	push {r4,r5,lr}
	sub sp, 0x4
	movs r4, 0
	ldr r5, _08149554 @ =gUnknown_08416ED0
_08149528:
	adds r0, r4, 0
	adds r0, 0x14
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r4, 1
	adds r1, r5
	ldrh r1, [r1]
	str r1, [sp]
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xB
	bls _08149528
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149554: .4byte gUnknown_08416ED0
	thumb_func_end sub_8149520

	thumb_func_start sub_8149558
sub_8149558: @ 8149558
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	ble _08149606
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	adds r1, r0, 0
	muls r1, r0
	adds r0, r1, 0
	movs r1, 0x50
	bl __divsi3
	movs r1, 0x58
	subs r1, r0
	strh r1, [r4, 0x22]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _08149592
	adds r0, 0x3
_08149592:
	asrs r0, 2
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x3A]
	adds r0, 0x4
	strh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x3C]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081495BC
	ldrh r0, [r4, 0x38]
	subs r0, 0x1
	strh r0, [r4, 0x38]
_081495BC:
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	cmp r0, 0
	ble _081495D2
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1
	b _081495D8
_081495D2:
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x14
_081495D8:
	strb r0, [r1]
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bge _081495E4
	adds r0, 0x3
_081495E4:
	asrs r0, 2
	adds r0, 0x14
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x1F
	bls _081495F2
	movs r2, 0x1F
_081495F2:
	movs r0, 0x1F
	ands r2, r0
	lsls r2, 1
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x3]
	b _0814960C
_08149606:
	adds r0, r4, 0
	bl DestroySprite
_0814960C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8149558

	thumb_func_start sub_8149614
sub_8149614: @ 8149614
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08149664 @ =gSpriteTemplate_8416EB8
	movs r1, 0x78
	movs r2, 0x58
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0814965E
	ldr r4, _08149668 @ =gSprites
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r2, r3, r4
	movs r1, 0
	movs r0, 0x30
	strh r0, [r2, 0x38]
	strh r5, [r2, 0x3A]
	strh r1, [r2, 0x3C]
	ldrb r1, [r2, 0x1]
	subs r0, 0x34
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r0, [r2, 0x3]
	movs r1, 0x3E
	orrs r0, r1
	strb r0, [r2, 0x3]
	adds r4, 0x1C
	adds r3, r4
	ldr r0, _0814966C @ =sub_8149558
	str r0, [r3]
_0814965E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149664: .4byte gSpriteTemplate_8416EB8
_08149668: .4byte gSprites
_0814966C: .4byte sub_8149558
	thumb_func_end sub_8149614

	thumb_func_start sub_8149670
sub_8149670: @ 8149670
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	cmp r0, 0x57
	bgt _081496D6
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	adds r1, r0, 0
	muls r1, r0
	adds r0, r1, 0
	movs r1, 0x5
	bl __divsi3
	adds r0, 0x8
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _081496A8
	adds r0, 0x3
_081496A8:
	asrs r0, 2
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	lsls r0, 26
	lsrs r0, 24
	movs r1, 0x28
	bl Sin
	adds r0, 0x8
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	b _081496DC
_081496D6:
	adds r0, r4, 0
	bl DestroySprite
_081496DC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8149670

	thumb_func_start sub_81496E4
sub_81496E4: @ 81496E4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08149740 @ =gSpriteTemplate_8416EB8
	movs r1, 0x78
	movs r2, 0x8
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0814973A
	ldr r4, _08149744 @ =gSprites
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r2, r3, r4
	movs r1, 0
	movs r0, 0x8
	strh r0, [r2, 0x38]
	strh r5, [r2, 0x3A]
	strh r1, [r2, 0x3C]
	ldrb r1, [r2, 0x1]
	subs r0, 0xC
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r1, [r2, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x32
	orrs r0, r1
	strb r0, [r2, 0x3]
	adds r2, 0x43
	movs r0, 0x1
	strb r0, [r2]
	adds r4, 0x1C
	adds r3, r4
	ldr r0, _08149748 @ =sub_8149670
	str r0, [r3]
_0814973A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149740: .4byte gSpriteTemplate_8416EB8
_08149744: .4byte gSprites
_08149748: .4byte sub_8149670
	thumb_func_end sub_81496E4

	thumb_func_start sub_814974C
sub_814974C: @ 814974C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	ble _08149788
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x38]
	ldrh r1, [r4, 0x34]
	subs r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x3A]
	adds r0, 0x4
	strh r0, [r4, 0x3A]
	b _0814978E
_08149788:
	adds r0, r4, 0
	bl DestroySprite
_0814978E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_814974C

	thumb_func_start sub_8149794
sub_8149794: @ 8149794
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _081497F0 @ =gSpriteTemplate_8416EB8
	movs r1, 0x78
	movs r2, 0x38
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _081497EA
	ldr r4, _081497F4 @ =gSprites
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r2, r3, r4
	movs r1, 0
	strh r5, [r2, 0x34]
	movs r0, 0x78
	strh r0, [r2, 0x38]
	strh r6, [r2, 0x3A]
	strh r1, [r2, 0x3C]
	ldrb r1, [r2, 0x1]
	subs r0, 0x7C
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r0, [r2, 0x3]
	movs r1, 0x3E
	orrs r0, r1
	strb r0, [r2, 0x3]
	adds r2, 0x43
	movs r0, 0x1
	strb r0, [r2]
	adds r4, 0x1C
	adds r3, r4
	ldr r0, _081497F8 @ =sub_814974C
	str r0, [r3]
_081497EA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081497F0: .4byte gSpriteTemplate_8416EB8
_081497F4: .4byte gSprites
_081497F8: .4byte sub_814974C
	thumb_func_end sub_8149794

	thumb_func_start sub_81497FC
sub_81497FC: @ 81497FC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x3C]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08149810
	ldrh r0, [r4, 0x22]
	adds r0, 0x1
	strh r0, [r4, 0x22]
_08149810:
	ldrh r1, [r4, 0x3A]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	cmp r0, 0x7F
	bgt _081498C0
	lsls r0, r1, 24
	lsrs r0, 24
	movs r5, 0x38
	ldrsh r1, [r4, r5]
	bl Sin
	negs r0, r0
	strh r0, [r4, 0x26]
	movs r0, 0x34
	ldrsh r1, [r4, r0]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	muls r0, r1
	movs r1, 0x3
	bl __divsi3
	adds r0, 0x78
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x3A]
	adds r3, r0, 0x1
	strh r3, [r4, 0x3A]
	movs r5, 0x3A
	ldrsh r1, [r4, r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	cmp r0, 0
	bge _08149854
	adds r0, 0x7F
_08149854:
	asrs r0, 7
	movs r1, 0x1F
	subs r1, r0
	lsls r1, 24
	lsrs r2, r1, 24
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, 0x40
	ble _08149870
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1
	strb r0, [r1]
	b _081498A0
_08149870:
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x14
	strb r0, [r1]
	ldrh r1, [r4, 0x3A]
	movs r5, 0x3A
	ldrsh r0, [r4, r5]
	cmp r0, 0x70
	ble _081498A0
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081498A0
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
_081498A0:
	cmp r2, 0x13
	bhi _081498A6
	movs r2, 0x14
_081498A6:
	movs r0, 0x1F
	ands r2, r0
	lsls r2, 1
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x3]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	b _081498C6
_081498C0:
	adds r0, r4, 0
	bl DestroySprite
_081498C6:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81497FC

	thumb_func_start sub_81498CC
sub_81498CC: @ 81498CC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r0, _08149948 @ =gSpriteTemplate_8416EB8
	movs r1, 0x78
	movs r2, 0x38
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x40
	beq _0814993C
	bl Random
	ldr r6, _0814994C @ =gSprites
	lsls r5, r4, 4
	adds r5, r4
	lsls r5, 2
	adds r4, r5, r6
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x7
	bl __umodsi3
	movs r1, 0x3
	subs r1, r0
	movs r0, 0
	mov r8, r0
	strh r1, [r4, 0x34]
	bl Random
	movs r1, 0x3F
	ands r1, r0
	adds r1, 0x30
	strh r1, [r4, 0x38]
	mov r0, r8
	strh r0, [r4, 0x3C]
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	movs r1, 0x3E
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r4, 0x43
	movs r0, 0x14
	strb r0, [r4]
	adds r6, 0x1C
	adds r5, r6
	ldr r0, _08149950 @ =sub_81497FC
	str r0, [r5]
_0814993C:
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08149948: .4byte gSpriteTemplate_8416EB8
_0814994C: .4byte gSprites
_08149950: .4byte sub_81497FC
	thumb_func_end sub_81498CC

	thumb_func_start sub_8149954
sub_8149954: @ 8149954
	push {lr}
	ldr r0, _08149968 @ =gUnknown_08416E84
	bl LoadCompressedObjectPic
	ldr r0, _0814996C @ =gUnknown_08416E94
	bl LoadSpritePalettes
	pop {r0}
	bx r0
	.align 2, 0
_08149968: .4byte gUnknown_08416E84
_0814996C: .4byte gUnknown_08416E94
	thumb_func_end sub_8149954

	thumb_func_start sub_8149970
sub_8149970: @ 8149970
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _08149998 @ =sub_81499A0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0814999C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xA]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08149998: .4byte sub_81499A0
_0814999C: .4byte gTasks
	thumb_func_end sub_8149970

	thumb_func_start sub_81499A0
sub_81499A0: @ 81499A0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8149520
	ldr r0, _081499E4 @ =gTasks
	lsls r5, r4, 2
	adds r5, r4
	lsls r5, 3
	adds r5, r0
	movs r0, 0
	strh r0, [r5, 0x26]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	movs r0, 0x3
	lsls r0, r1
	ldr r1, _081499E8 @ =0x00007fff
	str r1, [sp]
	movs r1, 0xA
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _081499EC @ =sub_81499F0
	str r0, [r5]
	movs r0, 0x8C
	bl PlaySE
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081499E4: .4byte gTasks
_081499E8: .4byte 0x00007fff
_081499EC: .4byte sub_81499F0
	thumb_func_end sub_81499A0

	thumb_func_start sub_81499F0
sub_81499F0: @ 81499F0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08149A48 @ =gTasks
	lsls r3, r5, 2
	adds r0, r3, r5
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0x26]
	movs r4, 0x26
	ldrsh r0, [r1, r4]
	cmp r0, 0x3F
	bgt _08149A4C
	movs r0, 0x7
	ands r0, r2
	adds r7, r3, 0
	cmp r0, 0
	bne _08149A36
	movs r4, 0
	adds r6, r1, 0
_08149A18:
	ldrh r1, [r6, 0x26]
	movs r0, 0x78
	ands r0, r1
	lsls r0, 1
	lsls r1, r4, 6
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl sub_8149614
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08149A18
_08149A36:
	ldr r0, _08149A48 @ =gTasks
	adds r1, r7, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _08149A54
	.align 2, 0
_08149A48: .4byte gTasks
_08149A4C:
	movs r0, 0x60
	strh r0, [r1, 0x26]
	ldr r0, _08149A5C @ =sub_8149A60
	str r0, [r1]
_08149A54:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08149A5C: .4byte sub_8149A60
	thumb_func_end sub_81499F0

	thumb_func_start sub_8149A60
sub_8149A60: @ 8149A60
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _08149A80 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0, r1
	ldrh r3, [r1, 0x26]
	movs r4, 0x26
	ldrsh r0, [r1, r4]
	cmp r0, 0
	beq _08149A84
	subs r0, r3, 0x1
	strh r0, [r1, 0x26]
	b _08149A8A
	.align 2, 0
_08149A80: .4byte gTasks
_08149A84:
	adds r0, r2, 0
	bl DestroyTask
_08149A8A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8149A60

	thumb_func_start sub_8149A90
sub_8149A90: @ 8149A90
	push {lr}
	ldr r0, _08149AA4 @ =sub_8149AA8
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08149AA4: .4byte sub_8149AA8
	thumb_func_end sub_8149A90

	thumb_func_start sub_8149AA8
sub_8149AA8: @ 8149AA8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8149520
	ldr r1, _08149AD4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x26]
	ldr r1, _08149AD8 @ =sub_8149ADC
	str r1, [r0]
	movs r0, 0xB7
	bl PlaySE
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08149AD4: .4byte gTasks
_08149AD8: .4byte sub_8149ADC
	thumb_func_end sub_8149AA8

	thumb_func_start sub_8149ADC
sub_8149ADC: @ 8149ADC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08149B20 @ =gTasks
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 3
	adds r1, r0, r1
	movs r3, 0x26
	ldrsh r0, [r1, r3]
	cmp r0, 0x5F
	bgt _08149B24
	adds r6, r2, 0
	cmp r0, 0x5
	bgt _08149B0E
	movs r4, 0
_08149AFC:
	lsls r0, r4, 28
	lsrs r0, 24
	bl sub_81496E4
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x8
	bls _08149AFC
_08149B0E:
	ldr r0, _08149B20 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _08149B28
	.align 2, 0
_08149B20: .4byte gTasks
_08149B24:
	ldr r0, _08149B30 @ =sub_8149B34
	str r0, [r1]
_08149B28:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08149B30: .4byte sub_8149B34
	thumb_func_end sub_8149ADC

	thumb_func_start sub_8149B34
sub_8149B34: @ 8149B34
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	pop {r0}
	bx r0
	thumb_func_end sub_8149B34

	thumb_func_start sub_8149B44
sub_8149B44: @ 8149B44
	push {lr}
	ldr r0, _08149B58 @ =sub_8149B5C
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08149B58: .4byte sub_8149B5C
	thumb_func_end sub_8149B44

	thumb_func_start sub_8149B5C
sub_8149B5C: @ 8149B5C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8149520
	ldr r1, _08149B88 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x26]
	ldr r1, _08149B8C @ =sub_8149B90
	str r1, [r0]
	movs r0, 0x66
	bl PlaySE
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08149B88: .4byte gTasks
_08149B8C: .4byte sub_8149B90
	thumb_func_end sub_8149B5C

	thumb_func_start sub_8149B90
sub_8149B90: @ 8149B90
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08149BFC @ =gTasks
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 3
	adds r1, r0, r1
	movs r3, 0x26
	ldrsh r0, [r1, r3]
	cmp r0, 0x2F
	bgt _08149C00
	adds r6, r2, 0
	cmp r0, 0
	bne _08149BC4
	movs r4, 0
_08149BB0:
	lsls r0, r4, 28
	lsrs r0, 24
	movs r1, 0x4
	bl sub_8149794
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _08149BB0
_08149BC4:
	ldr r0, _08149BFC @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	movs r2, 0x26
	ldrsh r0, [r1, r2]
	cmp r0, 0x20
	bne _08149BEA
	movs r4, 0
_08149BD6:
	lsls r0, r4, 28
	lsrs r0, 24
	movs r1, 0x8
	bl sub_8149794
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _08149BD6
_08149BEA:
	ldr r0, _08149BFC @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _08149C04
	.align 2, 0
_08149BFC: .4byte gTasks
_08149C00:
	ldr r0, _08149C0C @ =sub_8149C10
	str r0, [r1]
_08149C04:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08149C0C: .4byte sub_8149C10
	thumb_func_end sub_8149B90

	thumb_func_start sub_8149C10
sub_8149C10: @ 8149C10
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	pop {r0}
	bx r0
	thumb_func_end sub_8149C10

	thumb_func_start sub_8149C20
sub_8149C20: @ 8149C20
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _08149C48 @ =sub_8149C50
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08149C4C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xC]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08149C48: .4byte sub_8149C50
_08149C4C: .4byte gTasks
	thumb_func_end sub_8149C20

	thumb_func_start sub_8149C50
sub_8149C50: @ 8149C50
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8149520
	ldr r0, _08149C98 @ =gTasks
	lsls r5, r4, 2
	adds r5, r4
	lsls r5, 3
	adds r5, r0
	movs r0, 0
	strh r0, [r5, 0x26]
	ldr r0, _08149C9C @ =gPlttBufferFaded + 0x40
	ldr r1, _08149CA0 @ =gPlttBufferUnfaded + 0x40
	movs r2, 0x30
	bl CpuSet
	ldr r0, _08149CA4 @ =0xfff9001c
	ldr r1, _08149CA8 @ =0x00007fff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08149CAC @ =sub_8149CB0
	str r0, [r5]
	movs r0, 0xCA
	bl PlaySE
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149C98: .4byte gTasks
_08149C9C: .4byte gPlttBufferFaded + 0x40
_08149CA0: .4byte gPlttBufferUnfaded + 0x40
_08149CA4: .4byte 0xfff9001c
_08149CA8: .4byte 0x00007fff
_08149CAC: .4byte sub_8149CB0
	thumb_func_end sub_8149C50

	thumb_func_start sub_8149CB0
sub_8149CB0: @ 8149CB0
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08149CE8 @ =gTasks
	lsls r5, r6, 2
	adds r0, r5, r6
	lsls r0, 3
	adds r1, r0, r1
	movs r0, 0x26
	ldrsh r2, [r1, r0]
	cmp r2, 0x7F
	bgt _08149D2C
	adds r0, r2, 0
	cmp r0, 0
	beq _08149CEC
	cmp r0, 0x20
	beq _08149D00
	cmp r2, 0x31
	bgt _08149D10
	bl Random
	movs r1, 0x7
	ands r0, r1
	bl sub_81498CC
	b _08149D10
	.align 2, 0
_08149CE8: .4byte gTasks
_08149CEC:
	movs r4, 0
_08149CEE:
	adds r0, r4, 0
	bl sub_81498CC
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _08149CEE
	b _08149D10
_08149D00:
	ldr r0, _08149D20 @ =0xffff001c
	ldr r1, _08149D24 @ =0x00007fff
	str r1, [sp]
	movs r1, 0x10
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_08149D10:
	ldr r0, _08149D28 @ =gTasks
	adds r1, r5, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _08149D30
	.align 2, 0
_08149D20: .4byte 0xffff001c
_08149D24: .4byte 0x00007fff
_08149D28: .4byte gTasks
_08149D2C:
	ldr r0, _08149D38 @ =sub_8149D3C
	str r0, [r1]
_08149D30:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08149D38: .4byte sub_8149D3C
	thumb_func_end sub_8149CB0

	thumb_func_start sub_8149D3C
sub_8149D3C: @ 8149D3C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08149D58 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08149D54
	adds r0, r2, 0
	bl DestroyTask
_08149D54:
	pop {r0}
	bx r0
	.align 2, 0
_08149D58: .4byte gPaletteFade
	thumb_func_end sub_8149D3C

	thumb_func_start sub_8149D5C
sub_8149D5C: @ 8149D5C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _08149D84 @ =sub_8149D8C
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08149D88 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xC]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08149D84: .4byte sub_8149D8C
_08149D88: .4byte gTasks
	thumb_func_end sub_8149D5C

	thumb_func_start sub_8149D8C
sub_8149D8C: @ 8149D8C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8149520
	ldr r0, _08149DD4 @ =gTasks
	lsls r5, r4, 2
	adds r5, r4
	lsls r5, 3
	adds r5, r0
	movs r0, 0
	strh r0, [r5, 0x26]
	ldr r0, _08149DD8 @ =gPlttBufferFaded + 0x40
	ldr r1, _08149DDC @ =gPlttBufferUnfaded + 0x40
	movs r2, 0x30
	bl CpuSet
	ldr r0, _08149DE0 @ =0xfff90001
	ldr r1, _08149DE4 @ =0x00007fff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08149DE8 @ =sub_8149DEC
	str r0, [r5]
	movs r0, 0xCA
	bl PlaySE
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149DD4: .4byte gTasks
_08149DD8: .4byte gPlttBufferFaded + 0x40
_08149DDC: .4byte gPlttBufferUnfaded + 0x40
_08149DE0: .4byte 0xfff90001
_08149DE4: .4byte 0x00007fff
_08149DE8: .4byte sub_8149DEC
	thumb_func_end sub_8149D8C

	thumb_func_start sub_8149DEC
sub_8149DEC: @ 8149DEC
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08149E24 @ =gTasks
	lsls r5, r6, 2
	adds r0, r5, r6
	lsls r0, 3
	adds r1, r0, r1
	movs r0, 0x26
	ldrsh r2, [r1, r0]
	cmp r2, 0x7F
	bgt _08149E68
	adds r0, r2, 0
	cmp r0, 0
	beq _08149E28
	cmp r0, 0x20
	beq _08149E3C
	cmp r2, 0x31
	bgt _08149E4C
	bl Random
	movs r1, 0x7
	ands r0, r1
	bl sub_81498CC
	b _08149E4C
	.align 2, 0
_08149E24: .4byte gTasks
_08149E28:
	movs r4, 0
_08149E2A:
	adds r0, r4, 0
	bl sub_81498CC
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _08149E2A
	b _08149E4C
_08149E3C:
	ldr r0, _08149E5C @ =0xffff0001
	ldr r1, _08149E60 @ =0x00007fff
	str r1, [sp]
	movs r1, 0x10
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_08149E4C:
	ldr r0, _08149E64 @ =gTasks
	adds r1, r5, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _08149E6C
	.align 2, 0
_08149E5C: .4byte 0xffff0001
_08149E60: .4byte 0x00007fff
_08149E64: .4byte gTasks
_08149E68:
	ldr r0, _08149E74 @ =sub_8149D3C
	str r0, [r1]
_08149E6C:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08149E74: .4byte sub_8149D3C
	thumb_func_end sub_8149DEC

	thumb_func_start nullsub_85
nullsub_85: @ 8149E78
	bx lr
	thumb_func_end nullsub_85

	thumb_func_start sub_8149E7C
sub_8149E7C: @ 8149E7C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	movs r1, 0
	ldr r3, _08149FB0 @ =sub_8149FC8
	ldr r2, _08149FB4 @ =0x00007fff
_08149E96:
	lsls r0, r1, 1
	add r0, sp
	adds r0, 0x4
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xF
	bls _08149E96
	adds r0, r3, 0
	movs r1, 0
	bl CreateTask
	mov r8, r0
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _08149FB8 @ =gTasks
	mov r1, r8
	lsls r6, r1, 2
	add r6, r8
	lsls r6, 3
	adds r6, r0
	strh r5, [r6, 0xA]
	strh r7, [r6, 0xC]
	movs r1, 0x80
	lsls r1, 1
	strh r1, [r6, 0xE]
	movs r0, 0x10
	strh r0, [r6, 0x10]
	movs r4, 0x80
	lsls r4, 9
	str r1, [sp]
	movs r0, 0x1E
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	movs r0, 0x10
	ldrsh r1, [r6, r0]
	adds r0, r4, 0
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r0, 0x1F
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	ldr r1, _08149FBC @ =gSprites
	mov r9, r1
	lsls r2, r5, 4
	adds r2, r5
	lsls r2, 2
	mov r3, r9
	adds r3, 0x1C
	adds r0, r2, r3
	ldr r1, _08149FC0 @ =nullsub_85
	str r1, [r0]
	add r2, r9
	ldrb r1, [r2, 0x1]
	movs r4, 0x4
	negs r4, r4
	adds r0, r4, 0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r1, [r2, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x3C
	orrs r0, r1
	strb r0, [r2, 0x3]
	movs r0, 0x3E
	adds r0, r2
	mov r10, r0
	ldrb r1, [r0]
	movs r5, 0x5
	negs r5, r5
	adds r0, r5, 0
	ands r0, r1
	mov r1, r10
	strb r0, [r1]
	ldrb r1, [r2, 0x5]
	lsrs r1, 4
	lsls r1, 5
	ldr r0, _08149FC4 @ =gPlttBufferFaded + 0x200
	mov r10, r0
	add r1, r10
	add r0, sp, 0x4
	movs r2, 0x10
	str r3, [sp, 0x24]
	bl CpuSet
	lsls r1, r7, 4
	adds r1, r7
	lsls r1, 2
	ldr r3, [sp, 0x24]
	adds r3, r1, r3
	ldr r0, _08149FC0 @ =nullsub_85
	str r0, [r3]
	add r1, r9
	ldrb r0, [r1, 0x1]
	ands r4, r0
	movs r0, 0x1
	orrs r4, r0
	strb r4, [r1, 0x1]
	ldrb r0, [r1, 0x3]
	movs r2, 0x3E
	orrs r0, r2
	strb r0, [r1, 0x3]
	adds r2, r1, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	ands r5, r0
	strb r5, [r2]
	ldrb r1, [r1, 0x5]
	lsrs r1, 4
	lsls r1, 5
	add r1, r10
	add r0, sp, 0x4
	movs r2, 0x10
	bl CpuSet
	movs r1, 0
	strh r1, [r6, 0x18]
	mov r0, r8
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08149FB0: .4byte sub_8149FC8
_08149FB4: .4byte 0x00007fff
_08149FB8: .4byte gTasks
_08149FBC: .4byte gSprites
_08149FC0: .4byte nullsub_85
_08149FC4: .4byte gPlttBufferFaded + 0x200
	thumb_func_end sub_8149E7C

	thumb_func_start sub_8149FC8
sub_8149FC8: @ 8149FC8
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08149FE4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x12]
	movs r0, 0x8
	strh r0, [r1, 0x14]
	ldr r0, _08149FE8 @ =sub_8149FEC
	str r0, [r1]
	bx lr
	.align 2, 0
_08149FE4: .4byte gTasks
_08149FE8: .4byte sub_8149FEC
	thumb_func_end sub_8149FC8

	thumb_func_start sub_8149FEC
sub_8149FEC: @ 8149FEC
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _0814A00C @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r2, r0, r1
	movs r1, 0x18
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _0814A010
	adds r0, r3, 0
	bl sub_814A208
	b _0814A032
	.align 2, 0
_0814A00C: .4byte gTasks
_0814A010:
	ldrh r1, [r2, 0x14]
	movs r4, 0x14
	ldrsh r0, [r2, r4]
	cmp r0, 0x80
	bne _0814A022
	adds r0, r3, 0
	bl sub_814A158
	b _0814A032
_0814A022:
	adds r0, r1, 0x2
	strh r0, [r2, 0x14]
	ldrh r0, [r2, 0x12]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r2, 0x12]
	ldr r0, _0814A038 @ =sub_814A03C
	str r0, [r2]
_0814A032:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814A038: .4byte sub_814A03C
	thumb_func_end sub_8149FEC

	thumb_func_start sub_814A03C
sub_814A03C: @ 814A03C
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0814A060 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	movs r3, 0x18
	ldrsh r0, [r2, r3]
	adds r5, r1, 0
	cmp r0, 0
	beq _0814A068
	ldr r0, _0814A064 @ =sub_814A208
	str r0, [r2]
	b _0814A14C
	.align 2, 0
_0814A060: .4byte gTasks
_0814A064: .4byte sub_814A208
_0814A068:
	movs r6, 0
	movs r7, 0x12
	ldrsh r0, [r2, r7]
	cmp r0, 0
	bne _0814A0B8
	movs r0, 0xE
	ldrsh r1, [r2, r0]
	movs r3, 0x14
	ldrsh r0, [r2, r3]
	movs r3, 0x80
	lsls r3, 1
	subs r0, r3, r0
	cmp r1, r0
	bge _0814A08E
	ldrh r0, [r2, 0x14]
	ldrh r7, [r2, 0xE]
	adds r0, r7
	strh r0, [r2, 0xE]
	b _0814A092
_0814A08E:
	strh r3, [r2, 0xE]
	movs r6, 0x1
_0814A092:
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 3
	adds r3, r0, r5
	movs r0, 0x10
	ldrsh r1, [r3, r0]
	movs r7, 0x14
	ldrsh r0, [r3, r7]
	adds r0, 0x10
	cmp r1, r0
	ble _0814A0B2
	ldrh r0, [r3, 0x10]
	ldrh r1, [r3, 0x14]
	subs r0, r1
	strh r0, [r3, 0x10]
	b _0814A102
_0814A0B2:
	movs r0, 0x10
	strh r0, [r3, 0x10]
	b _0814A0FC
_0814A0B8:
	movs r0, 0x10
	ldrsh r1, [r2, r0]
	movs r3, 0x14
	ldrsh r0, [r2, r3]
	movs r3, 0x80
	lsls r3, 1
	subs r0, r3, r0
	cmp r1, r0
	bge _0814A0D4
	ldrh r0, [r2, 0x14]
	ldrh r7, [r2, 0x10]
	adds r0, r7
	strh r0, [r2, 0x10]
	b _0814A0D8
_0814A0D4:
	strh r3, [r2, 0x10]
	movs r6, 0x1
_0814A0D8:
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 3
	adds r3, r0, r5
	movs r0, 0xE
	ldrsh r1, [r3, r0]
	movs r7, 0x14
	ldrsh r0, [r3, r7]
	adds r0, 0x10
	cmp r1, r0
	ble _0814A0F8
	ldrh r0, [r3, 0xE]
	ldrh r1, [r3, 0x14]
	subs r0, r1
	strh r0, [r3, 0xE]
	b _0814A102
_0814A0F8:
	movs r0, 0x10
	strh r0, [r3, 0xE]
_0814A0FC:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0814A102:
	adds r0, r2, r4
	lsls r0, 3
	adds r5, r0, r5
	movs r0, 0xE
	ldrsh r1, [r5, r0]
	movs r4, 0x80
	lsls r4, 9
	adds r0, r4, 0
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r0, 0x1E
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	movs r3, 0x10
	ldrsh r1, [r5, r3]
	adds r0, r4, 0
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r0, 0x1F
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	cmp r6, 0x2
	bne _0814A14C
	ldr r0, _0814A154 @ =sub_8149FEC
	str r0, [r5]
_0814A14C:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814A154: .4byte sub_8149FEC
	thumb_func_end sub_814A03C

	thumb_func_start sub_814A158
sub_814A158: @ 814A158
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0814A200 @ =gSprites
	mov r8, r1
	ldr r1, _0814A204 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	add r2, r8
	ldrb r3, [r2, 0x1]
	movs r6, 0x4
	negs r6, r6
	adds r1, r6, 0
	ands r1, r3
	strb r1, [r2, 0x1]
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	add r2, r8
	ldrb r3, [r2, 0x3]
	movs r5, 0x3F
	negs r5, r5
	adds r1, r5, 0
	ands r1, r3
	strb r1, [r2, 0x3]
	movs r1, 0xA
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r3, 0x4
	orrs r2, r3
	strb r2, [r1]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	ldrb r2, [r1, 0x1]
	ands r6, r2
	strb r6, [r1, 0x1]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	ldrb r2, [r1, 0x3]
	ands r5, r2
	strb r5, [r1, 0x3]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	ands r2, r3
	strb r2, [r1]
	bl DestroyTask
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814A200: .4byte gSprites
_0814A204: .4byte gTasks
	thumb_func_end sub_814A158

	thumb_func_start sub_814A208
sub_814A208: @ 814A208
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0814A2B0 @ =gSprites
	mov r8, r1
	ldr r1, _0814A2B4 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	add r2, r8
	ldrb r3, [r2, 0x1]
	movs r6, 0x4
	negs r6, r6
	adds r1, r6, 0
	ands r1, r3
	strb r1, [r2, 0x1]
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	add r2, r8
	ldrb r3, [r2, 0x3]
	movs r5, 0x3F
	negs r5, r5
	adds r1, r5, 0
	ands r1, r3
	strb r1, [r2, 0x3]
	movs r1, 0xA
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	ands r2, r3
	strb r2, [r1]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	ldrb r2, [r1, 0x1]
	ands r6, r2
	strb r6, [r1, 0x1]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	ldrb r2, [r1, 0x3]
	ands r5, r2
	strb r5, [r1, 0x3]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r3, 0x4
	orrs r2, r3
	strb r2, [r1]
	bl DestroyTask
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814A2B0: .4byte gSprites
_0814A2B4: .4byte gTasks
	thumb_func_end sub_814A208

	thumb_func_start sub_814A2B8
sub_814A2B8: @ 814A2B8
	ldr r2, _0814A2CC @ =gUnknown_08417068
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	lsls r1, 1
	adds r1, r0
	movs r2, 0
	ldrsh r0, [r1, r2]
	bx lr
	.align 2, 0
_0814A2CC: .4byte gUnknown_08417068
	thumb_func_end sub_814A2B8

	thumb_func_start sub_814A2D0
sub_814A2D0: @ 814A2D0
	lsls r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _0814A2E8 @ =gBardMusicTable
	lsrs r0, 14
	adds r0, r2
	ldr r0, [r0]
	lsls r2, r1, 1
	adds r2, r1
	lsls r2, 4
	adds r0, r2
	bx lr
	.align 2, 0
_0814A2E8: .4byte gBardMusicTable
	thumb_func_end sub_814A2D0

	thumb_func_start sub_814A2EC
sub_814A2EC: @ 814A2EC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r6, r0, 0
	lsls r2, 16
	lsrs r2, 16
	mov r9, r2
	ldr r4, _0814A370 @ =gUnknown_084170F4
	adds r2, r1, 0
	adds r3, r6, 0
	adds r3, 0x18
	movs r7, 0x5
_0814A306:
	ldrb r0, [r2]
	strh r0, [r3]
	ldrb r0, [r2]
	cmp r0, 0xFF
	beq _0814A328
	movs r1, 0x1
	ldrsb r1, [r2, r1]
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	adds r1, r0
	strh r1, [r3, 0x2]
	ldrh r0, [r2, 0x4]
	strh r0, [r3, 0x6]
	ldrh r0, [r6, 0x4]
	adds r0, r1
	strh r0, [r6, 0x4]
_0814A328:
	adds r2, 0x8
	adds r3, 0x8
	subs r7, 0x1
	cmp r7, 0
	bge _0814A306
	movs r7, 0x6
	movs r5, 0
	movs r0, 0x1E
	mov r8, r0
	adds r4, r6, 0
_0814A33C:
	mov r0, r8
	add r0, r9
	adds r1, r5, 0
	bl sub_814A2B8
	adds r1, r0, 0
	strh r1, [r4, 0x1C]
	adds r4, 0x8
	adds r5, 0x1
	cmp r5, r7
	blt _0814A33C
	ldrb r1, [r6]
	adds r1, 0x1
	movs r2, 0
	strb r1, [r6]
	strb r2, [r6, 0x1]
	strb r2, [r6, 0x2]
	strb r2, [r6, 0x3]
	strh r2, [r6, 0xA]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0814A370: .4byte gUnknown_084170F4
	thumb_func_end sub_814A2EC

	thumb_func_start SetUpFieldMove_Teleport
SetUpFieldMove_Teleport: @ 814A374
	push {lr}
	ldr r0, _0814A38C @ =gMapHeader
	ldrb r0, [r0, 0x17]
	bl is_light_level_1_2_3_or_6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0814A390
	movs r0, 0
	b _0814A39E
	.align 2, 0
_0814A38C: .4byte gMapHeader
_0814A390:
	ldr r1, _0814A3A4 @ =gUnknown_0300485C
	ldr r0, _0814A3A8 @ =sub_808AB90
	str r0, [r1]
	ldr r1, _0814A3AC @ =gUnknown_03005CE4
	ldr r0, _0814A3B0 @ =hm_teleport_run_dp02scr
	str r0, [r1]
	movs r0, 0x1
_0814A39E:
	pop {r1}
	bx r1
	.align 2, 0
_0814A3A4: .4byte gUnknown_0300485C
_0814A3A8: .4byte sub_808AB90
_0814A3AC: .4byte gUnknown_03005CE4
_0814A3B0: .4byte hm_teleport_run_dp02scr
	thumb_func_end SetUpFieldMove_Teleport

	thumb_func_start hm_teleport_run_dp02scr
hm_teleport_run_dp02scr: @ 814A3B4
	push {lr}
	bl new_game
	movs r0, 0x3F
	bl FieldEffectStart
	ldr r0, _0814A3CC @ =gUnknown_0202FF84
	ldr r1, _0814A3D0 @ =gUnknown_03005CE0
	ldrb r1, [r1]
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0814A3CC: .4byte gUnknown_0202FF84
_0814A3D0: .4byte gUnknown_03005CE0
	thumb_func_end hm_teleport_run_dp02scr

	thumb_func_start FldEff_UseTeleport
FldEff_UseTeleport: @ 814A3D4
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0814A3FC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _0814A400 @ =sub_814A404
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0x1
	bl SetPlayerAvatarTransitionFlags
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0814A3FC: .4byte gTasks
_0814A400: .4byte sub_814A404
	thumb_func_end FldEff_UseTeleport

	thumb_func_start sub_814A404
sub_814A404: @ 814A404
	push {lr}
	movs r0, 0x3F
	bl FieldEffectActiveListRemove
	bl sub_8087BA8
	pop {r0}
	bx r0
	thumb_func_end sub_814A404

	thumb_func_start unref_sub_814A414
unref_sub_814A414: @ 814A414
	push {lr}
	sub sp, 0x8
	bl MenuZeroFillScreen
	movs r0, 0
	movs r1, 0
	movs r2, 0x10
	movs r3, 0x12
	bl MenuDrawTextWindow
	ldr r3, _0814A458 @ =gUnknown_0842C29C
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0x8
	bl PrintMenuItems
	movs r0, 0
	str r0, [sp]
	movs r0, 0xF
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x8
	bl InitMenu
	ldr r1, _0814A45C @ =gCallback_03004AE8
	ldr r0, _0814A460 @ =sub_814A464
	str r0, [r1]
	movs r0, 0
	add sp, 0x8
	pop {r1}
	bx r1
	.align 2, 0
_0814A458: .4byte gUnknown_0842C29C
_0814A45C: .4byte gCallback_03004AE8
_0814A460: .4byte sub_814A464
	thumb_func_end unref_sub_814A414

	thumb_func_start sub_814A464
sub_814A464: @ 814A464
	push {lr}
	bl ProcessMenuInput
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	lsls r0, r2, 24
	asrs r1, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	bne _0814A480
	movs r0, 0
	b _0814A4B2
_0814A480:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0814A4AC
	ldr r0, _0814A4A0 @ =gUnknown_02024D1E
	strb r2, [r0]
	ldr r2, _0814A4A4 @ =gCallback_03004AE8
	ldr r0, _0814A4A8 @ =gUnknown_0842C29C
	lsls r1, 3
	adds r0, 0x4
	adds r1, r0
	ldr r0, [r1]
	str r0, [r2]
	movs r0, 0
	b _0814A4B2
	.align 2, 0
_0814A4A0: .4byte gUnknown_02024D1E
_0814A4A4: .4byte gCallback_03004AE8
_0814A4A8: .4byte gUnknown_0842C29C
_0814A4AC:
	bl sub_8071C20
	movs r0, 0x1
_0814A4B2:
	pop {r1}
	bx r1
	thumb_func_end sub_814A464

	thumb_func_start sub_814A4B8
sub_814A4B8: @ 814A4B8
	push {r4,lr}
	ldr r2, _0814A4FC @ =gSaveBlock2
	ldr r1, _0814A500 @ =0x00000556
	adds r0, r2, r1
	movs r1, 0x3
	strb r1, [r0]
	ldr r3, _0814A504 @ =0x00000557
	adds r0, r2, r3
	strb r1, [r0]
	ldr r3, _0814A508 @ =gUnknown_02024D1E
	ldrb r0, [r3]
	adds r0, 0x1
	ldr r4, _0814A50C @ =0x0000055c
	adds r1, r2, r4
	strh r0, [r1]
	ldrb r0, [r3]
	adds r0, 0x1
	ldr r3, _0814A510 @ =0x0000055e
	adds r1, r2, r3
	strh r0, [r1]
	subs r4, 0x4
	adds r0, r2, r4
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, _0814A514 @ =0x0000055a
	adds r2, r0
	strh r1, [r2]
	bl sub_8071C20
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0814A4FC: .4byte gSaveBlock2
_0814A500: .4byte 0x00000556
_0814A504: .4byte 0x00000557
_0814A508: .4byte gUnknown_02024D1E
_0814A50C: .4byte 0x0000055c
_0814A510: .4byte 0x0000055e
_0814A514: .4byte 0x0000055a
	thumb_func_end sub_814A4B8

	thumb_func_start sub_814A518
sub_814A518: @ 814A518
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	bl StripExtCtrlCodes
	adds r0, r4, 0
	bl StringLength
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r5, 0xFC
	bne _0814A556
	cmp r1, 0x5
	bhi _0814A55A
	movs r3, 0xFC
	movs r2, 0x7
_0814A53A:
	adds r0, r4, r1
	strb r3, [r0]
	strb r2, [r0, 0x1]
	adds r0, r1, 0x2
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x5
	bls _0814A53A
	b _0814A55A
_0814A54C:
	adds r0, r4, r1
	strb r5, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
_0814A556:
	cmp r1, 0x5
	bls _0814A54C
_0814A55A:
	adds r1, r4, r1
	movs r0, 0xFF
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_814A518

	thumb_func_start sub_814A568
sub_814A568: @ 814A568
	push {r4,lr}
	adds r4, r0, 0
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x5
	bhi _0814A582
	adds r0, r4, 0
	movs r1, 0x1
	bl ConvertInternationalString
	b _0814A588
_0814A582:
	adds r0, r4, 0
	bl StripExtCtrlCodes
_0814A588:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_814A568

	.align 2, 0 @ Don't pad with nop.
