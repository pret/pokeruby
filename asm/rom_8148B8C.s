	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start load_intro_part2_graphics
load_intro_part2_graphics: @ 8148B8C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08148BE8
	ldr r1, _08148BEC
	bl LZ77UnCompVram
	ldr r0, _08148BF0
	ldr r1, _08148BF4
	bl LZ77UnCompVram
	ldr r0, _08148BF8
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	cmp r4, 0
	beq _08148BB4
	cmp r4, 0x1
	beq _08148C14
_08148BB4:
	ldr r0, _08148BFC
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08148C00
	ldr r1, _08148C04
	bl LZ77UnCompVram
	ldr r0, _08148C08
	movs r1, 0
	movs r2, 0x60
	bl LoadPalette
	ldr r0, _08148C0C
	bl LoadCompressedObjectPic
	ldr r0, _08148C10
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
	ldr r0, _08148C58
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08148C5C
	ldr r1, _08148C60
	bl LZ77UnCompVram
	ldr r0, _08148C64
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08148C68
	bl LoadCompressedObjectPic
	ldr r0, _08148C6C
	movs r1, 0x80
	lsls r1, 1
	movs r2, 0x20
	bl LoadPalette
	bl sub_8149264
_08148C46:
	ldr r1, _08148C70
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08148C74
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
	ldr r1, _08148CA4
	ldr r2, _08148CA8
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	adds r2, 0xFF
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	ldr r2, _08148CAC
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
	ldr r0, _08148CD4
	ldr r1, _08148CD8
	bl LZ77UnCompVram
	ldr r0, _08148CDC
	ldr r1, _08148CE0
	bl LZ77UnCompVram
	cmp r4, 0x4
	bhi _08148CFC
	lsls r0, r4, 2
	ldr r1, _08148CE4
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
	ldr r0, _08148D34
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08148D38
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08148D3C
	ldr r1, _08148D40
	bl LZ77UnCompVram
	ldr r0, _08148D44
	movs r1, 0
	movs r2, 0x60
	bl LoadPalette
	ldr r0, _08148D48
	bl LoadCompressedObjectPic
	ldr r0, _08148D4C
	ldr r1, _08148D50
	bl LZ77UnCompVram
	ldr r0, _08148D54
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
	ldr r0, _08148DA0
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08148DA4
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08148DA8
	ldr r1, _08148DAC
	bl LZ77UnCompVram
	ldr r0, _08148DB0
	movs r1, 0
	movs r2, 0x60
	bl LoadPalette
	ldr r0, _08148DB4
	bl LoadCompressedObjectPic
	ldr r0, _08148DB8
	ldr r1, _08148DBC
	bl LZ77UnCompVram
	ldr r0, _08148DC0
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
	ldr r0, _08148E04
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08148E08
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08148E0C
	ldr r1, _08148E10
	bl LZ77UnCompVram
	ldr r4, _08148E14
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08148E18
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
	ldr r0, _08148E6C
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08148E70
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08148E74
	ldr r1, _08148E78
	bl LZ77UnCompVram
	ldr r0, _08148E7C
	movs r1, 0
	movs r2, 0x40
	bl LoadPalette
	ldr r0, _08148E80
	bl LoadCompressedObjectPic
	ldr r0, _08148E84
	movs r1, 0x80
	lsls r1, 1
	movs r2, 0x20
	bl LoadPalette
	bl sub_8149280
_08148E58:
	ldr r1, _08148E88
	movs r0, 0x8
	strb r0, [r1]
	ldr r1, _08148E8C
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
	ldr r1, _08148EB4
	ldr r2, _08148EB8
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	adds r2, 0xFF
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	ldr r2, _08148EBC
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
	ldr r1, _08148F34
	mov r9, r1
	mov r0, r9
	movs r1, 0
	str r3, [sp]
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08148F38
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
	ldr r1, _08148FB4
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
	ldr r0, _08148FB8
	strh r1, [r0]
	ldr r2, _08148FBC
	ldr r1, _08148FC0
	ldr r0, _08148FC4
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
	ldr r0, _08148FC8
	strh r1, [r0]
	movs r1, 0x8
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _08148FD0
	ldr r2, _08148FCC
	ldr r1, _08148FC0
	ldr r0, _08148FC4
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
	ldr r0, _08149010
	ldr r1, _08149014
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
	ldr r0, _08149018
	strh r1, [r0]
	ldr r1, _0814901C
	ldr r0, _08149014
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
	ldr r0, _08149060
	ldr r2, [r0, 0x20]
	movs r0, 0x3
	ands r0, r2
	cmp r0, 0
	bne _08149100
	ldr r0, _08149064
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08149100
	movs r0, 0x4
	ands r2, r0
	cmp r2, 0
	beq _0814906C
	ldr r2, _08149068
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
	ldr r2, _08149094
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
	ldr r0, _081490C8
	ldr r2, [r0, 0x20]
	movs r0, 0x3
	ands r0, r2
	cmp r0, 0
	bne _08149100
	ldr r0, _081490CC
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
	ldr r2, _081490D0
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _081490D4
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
	ldr r2, _08149108
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
	ldr r0, _08149124
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
	ldr r0, _08149158
	strh r0, [r2, 0x20]
_08149144:
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _08149164
	ldr r1, _0814915C
	ldr r0, _08149160
	ldrh r0, [r0]
	ldrh r1, [r1]
	adds r0, r1
	b _08149168
	.align 2, 0
_08149158: .4byte 0x0000ffe0
_0814915C: .4byte gUnknown_02039358
_08149160: .4byte gUnknown_0203935A
_08149164:
	ldr r0, _08149170
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
	ldr r0, _0814923C
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
	ldr r0, _08149240
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
	ldr r0, _08149244
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
	ldr r1, _0814925C
	ldr r2, _08149260
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
	ldr r1, _08149278
	ldr r2, _0814927C
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
	ldr r1, _08149294
	ldr r2, _08149298
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
	ldr r4, _0814930C
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

	thumb_func_start sub_8149310
sub_8149310: @ 8149310
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r0, _0814935C
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
	ldr r0, _08149360
	adds r4, 0x8
	lsls r4, 16
	asrs r4, 16
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08149364
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
	thumb_func_end sub_8149310

	thumb_func_start sub_8149368
sub_8149368: @ 8149368
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r0, _081493B4
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
	ldr r0, _081493B8
	adds r4, 0x8
	lsls r4, 16
	asrs r4, 16
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081493BC
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
	thumb_func_end sub_8149368

	thumb_func_start nullsub_83
nullsub_83: @ 81493C0
	bx lr
	thumb_func_end nullsub_83

	thumb_func_start sub_81493C4
sub_81493C4: @ 81493C4
	push {r4,lr}
	ldr r4, _08149420
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

	thumb_func_start sub_8149424
sub_8149424: @ 8149424
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r2, r0, 0
	adds r5, r1, 0
	ldr r0, _08149490
	mov r8, r0
	lsls r2, 16
	asrs r4, r2, 16
	ldr r0, _08149494
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
	ldr r5, _08149498
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r0, r4, r5
	strh r6, [r0, 0x2E]
	movs r1, 0x1
	bl StartSpriteAnim
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _0814949C
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
	thumb_func_end sub_8149424

	thumb_func_start sapphire_sub_81494A0
sapphire_sub_81494A0: @ 81494A0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r2, r0, 0
	adds r5, r1, 0
	ldr r0, _0814950C
	mov r8, r0
	lsls r2, 16
	asrs r4, r2, 16
	ldr r0, _08149510
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
	ldr r5, _08149514
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r0, r4, r5
	strh r6, [r0, 0x2E]
	movs r1, 0x1
	bl StartSpriteAnim
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _08149518
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
	thumb_func_end sapphire_sub_81494A0

	thumb_func_start nullsub_84
nullsub_84: @ 814951C
	bx lr
	thumb_func_end nullsub_84

	thumb_func_start sub_8149520
sub_8149520: @ 8149520
	push {r4,r5,lr}
	sub sp, 0x4
	movs r4, 0
	ldr r5, _08149554
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
	ldr r0, _08149664
	movs r1, 0x78
	movs r2, 0x58
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0814965E
	ldr r4, _08149668
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
	ldr r0, _0814966C
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
	ldr r0, _08149740
	movs r1, 0x78
	movs r2, 0x8
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0814973A
	ldr r4, _08149744
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
	ldr r0, _08149748
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
	ldr r0, _081497F0
	movs r1, 0x78
	movs r2, 0x38
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _081497EA
	ldr r4, _081497F4
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
	ldr r0, _081497F8
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
	ldr r0, _08149948
	movs r1, 0x78
	movs r2, 0x38
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x40
	beq _0814993C
	bl Random
	ldr r6, _0814994C
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
	ldr r0, _08149950
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
	ldr r0, _08149968
	bl LoadCompressedObjectPic
	ldr r0, _0814996C
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
	ldr r0, _08149998
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0814999C
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
	ldr r0, _081499E4
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
	ldr r1, _081499E8
	str r1, [sp]
	movs r1, 0xA
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _081499EC
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
	ldr r1, _08149A48
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
	ldr r0, _08149A48
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
	ldr r0, _08149A5C
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
	ldr r1, _08149A80
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
	ldr r0, _08149AA4
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
	ldr r1, _08149AD4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x26]
	ldr r1, _08149AD8
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
	ldr r1, _08149B20
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
	ldr r0, _08149B20
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
	ldr r0, _08149B30
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
	ldr r0, _08149B58
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
	ldr r1, _08149B88
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x26]
	ldr r1, _08149B8C
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
	ldr r1, _08149BFC
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
	ldr r0, _08149BFC
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
	ldr r0, _08149BFC
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
	ldr r0, _08149C0C
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
	ldr r0, _08149C48
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08149C4C
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
	ldr r0, _08149C98
	lsls r5, r4, 2
	adds r5, r4
	lsls r5, 3
	adds r5, r0
	movs r0, 0
	strh r0, [r5, 0x26]
	ldr r0, _08149C9C
	ldr r1, _08149CA0
	movs r2, 0x30
	bl CpuSet
	ldr r0, _08149CA4
	ldr r1, _08149CA8
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08149CAC
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
	ldr r1, _08149CE8
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
	ldr r0, _08149D20
	ldr r1, _08149D24
	str r1, [sp]
	movs r1, 0x10
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_08149D10:
	ldr r0, _08149D28
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
	ldr r0, _08149D38
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
	ldr r0, _08149D58
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
	ldr r0, _08149D84
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08149D88
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
	ldr r0, _08149DD4
	lsls r5, r4, 2
	adds r5, r4
	lsls r5, 3
	adds r5, r0
	movs r0, 0
	strh r0, [r5, 0x26]
	ldr r0, _08149DD8
	ldr r1, _08149DDC
	movs r2, 0x30
	bl CpuSet
	ldr r0, _08149DE0
	ldr r1, _08149DE4
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08149DE8
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
	ldr r1, _08149E24
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
	ldr r0, _08149E5C
	ldr r1, _08149E60
	str r1, [sp]
	movs r1, 0x10
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_08149E4C:
	ldr r0, _08149E64
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
	ldr r0, _08149E74
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
	ldr r3, _08149FB0
	ldr r2, _08149FB4
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
	ldr r0, _08149FB8
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
	ldr r1, _08149FBC
	mov r9, r1
	lsls r2, r5, 4
	adds r2, r5
	lsls r2, 2
	mov r3, r9
	adds r3, 0x1C
	adds r0, r2, r3
	ldr r1, _08149FC0
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
	ldr r0, _08149FC4
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
	ldr r0, _08149FC0
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
	ldr r2, _08149FE4
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x12]
	movs r0, 0x8
	strh r0, [r1, 0x14]
	ldr r0, _08149FE8
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
	ldr r1, _0814A00C
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
	ldr r0, _0814A038
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
	ldr r1, _0814A060
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	movs r3, 0x18
	ldrsh r0, [r2, r3]
	adds r5, r1, 0
	cmp r0, 0
	beq _0814A068
	ldr r0, _0814A064
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
	ldr r0, _0814A154
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
	ldr r1, _0814A200
	mov r8, r1
	ldr r1, _0814A204
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
	ldr r1, _0814A2B0
	mov r8, r1
	ldr r1, _0814A2B4
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
	ldr r2, _0814A2CC
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
	ldr r2, _0814A2E8
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
	ldr r4, _0814A370
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
	ldr r0, _0814A38C
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
	ldr r1, _0814A3A4
	ldr r0, _0814A3A8
	str r0, [r1]
	ldr r1, _0814A3AC
	ldr r0, _0814A3B0
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
	ldr r0, _0814A3CC
	ldr r1, _0814A3D0
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
	ldr r2, _0814A3FC
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _0814A400
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
	ldr r3, _0814A458
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
	ldr r1, _0814A45C
	ldr r0, _0814A460
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
	ldr r0, _0814A4A0
	strb r2, [r0]
	ldr r2, _0814A4A4
	ldr r0, _0814A4A8
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
	ldr r2, _0814A4FC
	ldr r1, _0814A500
	adds r0, r2, r1
	movs r1, 0x3
	strb r1, [r0]
	ldr r3, _0814A504
	adds r0, r2, r3
	strb r1, [r0]
	ldr r3, _0814A508
	ldrb r0, [r3]
	adds r0, 0x1
	ldr r4, _0814A50C
	adds r1, r2, r4
	strh r0, [r1]
	ldrb r0, [r3]
	adds r0, 0x1
	ldr r3, _0814A510
	adds r1, r2, r3
	strh r0, [r1]
	subs r4, 0x4
	adds r0, r2, r4
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, _0814A514
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
	bl SkipExtCtrlCodes
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
	bl SkipExtCtrlCodes
_0814A588:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_814A568

	thumb_func_start sub_814A590
sub_814A590: @ 814A590
	ldr r0, _0814A5AC
	movs r1, 0x40
	strb r1, [r0]
	ldr r0, _0814A5B0
	strb r1, [r0]
	ldr r0, _0814A5B4
	strb r1, [r0]
	ldr r0, _0814A5B8
	movs r1, 0
	strb r1, [r0]
	ldr r0, _0814A5BC
	strb r1, [r0]
	bx lr
	.align 2, 0
_0814A5AC: .4byte gUnknown_0203A3D0
_0814A5B0: .4byte gUnknown_0203A3D1
_0814A5B4: .4byte gUnknown_0203A3D2
_0814A5B8: .4byte gUnknown_0203A3D3
_0814A5BC: .4byte gUnknown_0203A3D4
	thumb_func_end sub_814A590

	thumb_func_start sub_814A5C0
sub_814A5C0: @ 814A5C0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r4, [sp, 0x1C]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 24
	lsrs r5, r2, 24
	lsls r3, 16
	lsrs r7, r3, 16
	lsls r4, 24
	lsrs r4, 24
	mov r9, r4
	ldr r0, _0814A678
	ldrb r0, [r0]
	cmp r0, 0x40
	bne _0814A5F2
	ldr r0, _0814A67C
	ldrb r0, [r0]
	cmp r0, 0x40
	beq _0814A5F6
_0814A5F2:
	bl sub_814A7FC
_0814A5F6:
	movs r4, 0x1
	ldr r0, _0814A680
	cmp r6, r0
	bne _0814A61C
	ldr r1, _0814A684
	movs r0, 0xF
	ands r0, r5
	lsls r0, 1
	adds r0, r1
	strh r7, [r0]
	ldr r0, _0814A688
	bl LoadSpritePalette
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0814A61C
	ldr r6, _0814A68C
	movs r4, 0
_0814A61C:
	movs r7, 0xF
	adds r0, r5, 0
	ands r0, r7
	lsls r0, 3
	ldr r1, _0814A690
	adds r0, r1
	bl LoadSpriteSheetDeferred
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 3
	ldr r4, _0814A694
	adds r0, r4
	movs r1, 0
	movs r2, 0xA0
	mov r3, r8
	bl CreateSprite
	ldr r5, _0814A678
	strb r0, [r5]
	adds r4, 0x30
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0xA0
	mov r3, r8
	bl CreateSprite
	ldr r1, _0814A67C
	strb r0, [r1]
	ldrb r0, [r5]
	cmp r0, 0x40
	beq _0814A6AE
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814A698
	adds r4, r0, r1
	ldr r0, _0814A680
	cmp r6, r0
	bne _0814A69C
	ldrb r1, [r4, 0x5]
	adds r0, r7, 0
	ands r0, r1
	strb r0, [r4, 0x5]
	b _0814A6AE
	.align 2, 0
_0814A678: .4byte gUnknown_0203A3D0
_0814A67C: .4byte gUnknown_0203A3D1
_0814A680: .4byte 0x0000ffff
_0814A684: .4byte gUnknown_0203A360
_0814A688: .4byte gUnknown_0842F240
_0814A68C: .4byte 0x0000fff0
_0814A690: .4byte gUnknown_0842F140
_0814A694: .4byte gSpriteTemplate_842F250
_0814A698: .4byte gSprites
_0814A69C:
	adds r0, r6, 0
	bl IndexOfSpritePaletteTag
	lsls r0, 4
	ldrb r2, [r4, 0x5]
	adds r1, r7, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x5]
_0814A6AE:
	ldr r1, _0814A6D4
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814A72C
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814A6D8
	adds r4, r0, r1
	ldr r0, _0814A6DC
	cmp r6, r0
	bne _0814A6E0
	ldrb r1, [r4, 0x5]
	movs r0, 0xF
	ands r0, r1
	strb r0, [r4, 0x5]
	b _0814A6F2
	.align 2, 0
_0814A6D4: .4byte gUnknown_0203A3D1
_0814A6D8: .4byte gSprites
_0814A6DC: .4byte 0x0000ffff
_0814A6E0:
	adds r0, r6, 0
	bl IndexOfSpritePaletteTag
	lsls r0, 4
	ldrb r2, [r4, 0x5]
	movs r1, 0xF
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x5]
_0814A6F2:
	movs r3, 0x80
	lsls r3, 19
	ldrh r1, [r3]
	movs r0, 0xC0
	lsls r0, 7
	ands r0, r1
	cmp r0, 0
	bne _0814A70C
	ldr r0, _0814A744
	ldrb r1, [r0]
	movs r2, 0x1F
	orrs r1, r2
	strb r1, [r0]
_0814A70C:
	ldr r1, _0814A748
	ldrh r0, [r3]
	lsrs r0, 15
	strb r0, [r1]
	ldr r1, _0814A74C
	ldr r2, _0814A750
	ldrb r0, [r2]
	strb r0, [r1]
	ldrh r0, [r3]
	movs r4, 0x80
	lsls r4, 8
	adds r1, r4, 0
	orrs r0, r1
	strh r0, [r3]
	movs r0, 0x10
	strb r0, [r2]
_0814A72C:
	mov r0, r9
	bl sub_814A958
	ldr r0, _0814A754
	ldrb r0, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0814A744: .4byte REG_WINOUT
_0814A748: .4byte gUnknown_0203A3D3
_0814A74C: .4byte gUnknown_0203A3D4
_0814A750: .4byte 0x0400004b
_0814A754: .4byte gUnknown_0203A3D0
	thumb_func_end sub_814A5C0

	thumb_func_start sub_814A758
sub_814A758: @ 814A758
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp]
	movs r1, 0
	movs r3, 0
	bl sub_814A5C0
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	cmp r4, 0x40
	beq _0814A79A
	ldr r0, _0814A7A4
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0814A7A8
	adds r1, r0
	lsls r3, r5, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
_0814A79A:
	adds r0, r4, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0814A7A4: .4byte gUnknown_0203A3D0
_0814A7A8: .4byte gSprites
	thumb_func_end sub_814A758

	thumb_func_start unref_sub_814A7AC
unref_sub_814A7AC: @ 814A7AC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 24
	lsrs r7, r2, 24
	movs r3, 0
	movs r2, 0xF
	movs r1, 0
	ldr r6, _0814A7F8
	movs r5, 0xF
_0814A7C6:
	lsls r0, r1, 1
	adds r0, r6
	ldrh r0, [r0]
	cmp r0, r4
	bne _0814A7DA
	lsrs r0, r1, 4
	lsls r0, 24
	lsrs r3, r0, 24
	adds r2, r1, 0
	ands r2, r5
_0814A7DA:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xFF
	bls _0814A7C6
	mov r0, r12
	adds r1, r3, 0
	adds r3, r7, 0
	bl sub_814A758
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0814A7F8: .4byte gPlttBufferUnfaded
	thumb_func_end unref_sub_814A7AC

	thumb_func_start sub_814A7FC
sub_814A7FC: @ 814A7FC
	push {r4,lr}
	ldr r4, _0814A860
	ldrb r0, [r4]
	cmp r0, 0x40
	beq _0814A820
	ldr r0, _0814A864
	bl LoadTilesForSpriteSheet
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814A868
	adds r0, r1
	bl DestroySpriteAndFreeResources
	movs r0, 0x40
	strb r0, [r4]
_0814A820:
	ldr r4, _0814A86C
	ldrb r0, [r4]
	cmp r0, 0x40
	beq _0814A858
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814A868
	adds r0, r1
	bl DestroySpriteAndFreeResources
	movs r0, 0x40
	strb r0, [r4]
	ldr r0, _0814A870
	ldrb r0, [r0]
	cmp r0, 0
	bne _0814A850
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _0814A874
	ands r0, r1
	strh r0, [r2]
_0814A850:
	ldr r0, _0814A878
	ldr r1, _0814A87C
	ldrb r1, [r1]
	strb r1, [r0]
_0814A858:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814A860: .4byte gUnknown_0203A3D0
_0814A864: .4byte gUnknown_0842F140
_0814A868: .4byte gSprites
_0814A86C: .4byte gUnknown_0203A3D1
_0814A870: .4byte gUnknown_0203A3D3
_0814A874: .4byte 0x00007fff
_0814A878: .4byte 0x0400004b
_0814A87C: .4byte gUnknown_0203A3D4
	thumb_func_end sub_814A7FC

	thumb_func_start sub_814A880
sub_814A880: @ 814A880
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, r5, 0
	lsls r1, 24
	lsrs r4, r1, 24
	adds r6, r4, 0
	ldr r1, _0814A8F8
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814A8C0
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814A8FC
	adds r2, r0, r1
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	adds r0, r2, 0
	adds r0, 0x28
	movs r1, 0
	strb r1, [r0]
	adds r0, 0x1
	strb r1, [r0]
	strh r5, [r2, 0x20]
	strh r4, [r2, 0x22]
_0814A8C0:
	ldr r1, _0814A900
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814A8F2
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814A8FC
	adds r2, r0, r1
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	adds r0, r2, 0
	adds r0, 0x28
	movs r1, 0
	strb r1, [r0]
	adds r0, 0x1
	strb r1, [r0]
	strh r7, [r2, 0x20]
	strh r6, [r2, 0x22]
_0814A8F2:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814A8F8: .4byte gUnknown_0203A3D0
_0814A8FC: .4byte gSprites
_0814A900: .4byte gUnknown_0203A3D1
	thumb_func_end sub_814A880

	thumb_func_start sub_814A904
sub_814A904: @ 814A904
	push {lr}
	ldr r1, _0814A94C
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814A926
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814A950
	adds r0, r1
	adds r2, r0, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_0814A926:
	ldr r1, _0814A954
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814A946
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814A950
	adds r0, r1
	adds r2, r0, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_0814A946:
	pop {r0}
	bx r0
	.align 2, 0
_0814A94C: .4byte gUnknown_0203A3D0
_0814A950: .4byte gSprites
_0814A954: .4byte gUnknown_0203A3D1
	thumb_func_end sub_814A904

	thumb_func_start sub_814A958
sub_814A958: @ 814A958
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	ldr r4, _0814A9C4
	ldr r2, _0814A9C8
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0
	movs r1, 0
	movs r1, 0x2
	str r0, [r4]
	str r1, [r4, 0x4]
	strh r2, [r4]
	adds r4, 0x8
	movs r7, 0x1
	movs r2, 0x1
	ldr r1, [sp]
	subs r0, r1, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _0814AA3A
	ldr r0, _0814A9CC
	mov r12, r0
	mov r8, r1
	movs r1, 0x8
	negs r1, r1
	mov r10, r1
	ldr r5, _0814A9D0
	mov r9, r5
_0814A99E:
	lsls r0, r3, 16
	asrs r3, r0, 16
	cmp r3, 0x1F
	ble _0814A9D4
	mov r6, r12
	ldr r0, [r6]
	ldr r1, [r6, 0x4]
	str r0, [r4]
	str r1, [r4, 0x4]
	strh r2, [r4]
	lsls r0, r2, 16
	movs r1, 0x80
	lsls r1, 14
	adds r0, r1
	lsrs r2, r0, 16
	ldr r3, [sp]
	lsls r5, r3, 16
	b _0814AA20
	.align 2, 0
_0814A9C4: .4byte gSubspriteTable_203A380
_0814A9C8: .4byte 0x0000ffff
_0814A9CC: .4byte gUnknown_0842F780
_0814A9D0: .4byte gUnknown_0842F788
_0814A9D4:
	ldr r6, [sp]
	lsls r5, r6, 16
	mov r0, r8
	cmp r0, 0x27
	ble _0814AA0A
	cmp r3, 0x8
	ble _0814AA0A
	mov r6, r12
	ldr r0, [r6]
	ldr r1, [r6, 0x4]
	str r0, [r4]
	str r1, [r4, 0x4]
	lsls r1, r2, 16
	asrs r1, 16
	adds r2, r1, 0
	subs r2, 0x20
	adds r0, r3, 0
	mov r6, r10
	ands r0, r6
	adds r2, r0
	strh r2, [r4]
	movs r0, 0x18
	ands r0, r3
	adds r1, r0
	lsls r1, 16
	lsrs r2, r1, 16
	b _0814AA20
_0814AA0A:
	mov r3, r9
	ldr r0, [r3]
	ldr r1, [r3, 0x4]
	str r0, [r4]
	str r1, [r4, 0x4]
	strh r2, [r4]
	lsls r0, r2, 16
	movs r6, 0x80
	lsls r6, 12
	adds r0, r6
	lsrs r2, r0, 16
_0814AA20:
	adds r4, 0x8
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	asrs r1, r5, 16
	lsls r0, r2, 16
	asrs r0, 16
	subs r1, r0
	lsls r1, 16
	lsrs r3, r1, 16
	asrs r1, 16
	cmp r1, 0x7
	bgt _0814A99E
_0814AA3A:
	ldr r5, _0814AAA8
	ldr r0, [r5]
	ldr r1, [r5, 0x4]
	str r0, [r4]
	str r1, [r4, 0x4]
	lsls r1, r2, 16
	asrs r1, 16
	subs r1, 0x7
	lsls r0, r3, 16
	asrs r0, 16
	adds r0, r1
	strh r0, [r4]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r6, _0814AAAC
	ldrb r0, [r6]
	cmp r0, 0x40
	beq _0814AA78
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AAB0
	adds r2, r0, r1
	lsls r1, r7, 3
	ldr r0, _0814AAB4
	adds r1, r0
	adds r0, r2, 0
	bl SetSubspriteTables
_0814AA78:
	ldr r1, _0814AAB8
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AA98
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AAB0
	adds r2, r0, r1
	lsls r1, r7, 3
	ldr r0, _0814AAB4
	adds r1, r0
	adds r0, r2, 0
	bl SetSubspriteTables
_0814AA98:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814AAA8: .4byte gUnknown_0842F790
_0814AAAC: .4byte gUnknown_0203A3D0
_0814AAB0: .4byte gSprites
_0814AAB4: .4byte gSubspriteTables_842F5C0
_0814AAB8: .4byte gUnknown_0203A3D1
	thumb_func_end sub_814A958

	thumb_func_start sub_814AABC
sub_814AABC: @ 814AABC
	push {lr}
	adds r2, r0, 0
	ldr r1, _0814AAEC
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AAD4
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0814AAF0
	adds r1, r0
	str r2, [r1, 0x1C]
_0814AAD4:
	ldr r1, _0814AAF4
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AAE8
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0814AAF0
	adds r1, r0
	str r2, [r1, 0x1C]
_0814AAE8:
	pop {r0}
	bx r0
	.align 2, 0
_0814AAEC: .4byte gUnknown_0203A3D0
_0814AAF0: .4byte gSprites
_0814AAF4: .4byte gUnknown_0203A3D1
	thumb_func_end sub_814AABC

	thumb_func_start sub_814AAF8
sub_814AAF8: @ 814AAF8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r0, 16
	mov r12, r0
	ldr r1, _0814AB70
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AB66
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AB74
	adds r4, r0, r1
	ldr r0, [r4, 0x14]
	ldrh r1, [r0, 0x2]
	ldr r0, _0814AB78
	cmp r1, r0
	bne _0814AB66
	movs r2, 0
	movs r3, 0xF
	movs r1, 0
	ldrb r5, [r4, 0x5]
	ldr r0, _0814AB7C
	mov r8, r0
	ldr r7, _0814AB80
	movs r6, 0xF
_0814AB32:
	lsls r0, r1, 1
	adds r0, r7
	ldrh r0, [r0]
	cmp r0, r12
	bne _0814AB46
	lsrs r0, r1, 4
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r1, 0
	ands r3, r6
_0814AB46:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xFF
	bls _0814AB32
	lsls r2, 4
	movs r1, 0xF
	adds r0, r1, 0
	ands r0, r5
	orrs r0, r2
	strb r0, [r4, 0x5]
	ands r3, r1
	lsls r0, r3, 3
	add r0, r8
	bl RequestSpriteSheetCopy
_0814AB66:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814AB70: .4byte gUnknown_0203A3D0
_0814AB74: .4byte gSprites
_0814AB78: .4byte 0x0000ffff
_0814AB7C: .4byte gUnknown_0842F140
_0814AB80: .4byte gPlttBufferUnfaded
	thumb_func_end sub_814AAF8

	thumb_func_start sub_814AB84
sub_814AB84: @ 814AB84
	push {r4,r5,lr}
	ldr r5, _0814ABCC
	ldrb r0, [r5]
	cmp r0, 0x40
	beq _0814ABC4
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0814ABD0
	adds r4, r0
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	movs r0, 0x40
	strb r0, [r5]
	ldr r0, _0814ABD4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0814ABBC
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _0814ABD8
	ands r0, r1
	strh r0, [r2]
_0814ABBC:
	ldr r0, _0814ABDC
	ldr r1, _0814ABE0
	ldrb r1, [r1]
	strb r1, [r0]
_0814ABC4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814ABCC: .4byte gUnknown_0203A3D1
_0814ABD0: .4byte gSprites
_0814ABD4: .4byte gUnknown_0203A3D3
_0814ABD8: .4byte 0x00007fff
_0814ABDC: .4byte 0x0400004b
_0814ABE0: .4byte gUnknown_0203A3D4
	thumb_func_end sub_814AB84

	thumb_func_start unref_sub_814ABE4
unref_sub_814ABE4: @ 814ABE4
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _0814AC40
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _0814AC44
	movs r2, 0x28
	bl CpuSet
	ldr r1, _0814AC48
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AC18
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AC4C
	adds r2, r0, r1
	lsls r1, r4, 3
	ldr r0, _0814AC50
	adds r1, r0
	adds r0, r2, 0
	bl SetSubspriteTables
_0814AC18:
	ldr r1, _0814AC54
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AC38
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AC4C
	adds r2, r0, r1
	lsls r1, r4, 3
	ldr r0, _0814AC50
	adds r1, r0
	adds r0, r2, 0
	bl SetSubspriteTables
_0814AC38:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814AC40: .4byte gUnknown_0842F5BC
_0814AC44: .4byte gSubspriteTable_203A380
_0814AC48: .4byte gUnknown_0203A3D0
_0814AC4C: .4byte gSprites
_0814AC50: .4byte gUnknown_0842F758
_0814AC54: .4byte gUnknown_0203A3D1
	thumb_func_end unref_sub_814ABE4

	thumb_func_start sub_814AC58
sub_814AC58: @ 814AC58
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r4, [sp, 0x1C]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 16
	lsrs r6, r3, 16
	lsls r4, 24
	lsrs r4, 24
	mov r9, r4
	ldr r0, _0814ACF8
	ldrb r0, [r0]
	cmp r0, 0x40
	beq _0814AC86
	bl sub_814AD44
_0814AC86:
	movs r4, 0x1
	ldr r0, _0814ACFC
	cmp r5, r0
	bne _0814ACAC
	ldr r1, _0814AD00
	movs r0, 0xF
	ands r0, r7
	lsls r0, 1
	adds r0, r1
	strh r6, [r0]
	ldr r0, _0814AD04
	bl LoadSpritePalette
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0814ACAC
	ldr r5, _0814AD08
	movs r4, 0
_0814ACAC:
	movs r6, 0xF
	adds r0, r7, 0
	ands r0, r6
	lsls r0, 3
	ldr r1, _0814AD0C
	adds r0, r1
	bl LoadSpriteSheetDeferred
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 3
	ldr r1, _0814AD10
	adds r0, r1
	movs r1, 0
	movs r2, 0xA0
	mov r3, r8
	bl CreateSprite
	ldr r1, _0814ACF8
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0814AD2A
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AD14
	adds r4, r0, r1
	ldr r0, _0814ACFC
	cmp r5, r0
	bne _0814AD18
	ldrb r1, [r4, 0x5]
	adds r0, r6, 0
	ands r0, r1
	strb r0, [r4, 0x5]
	b _0814AD2A
	.align 2, 0
_0814ACF8: .4byte gUnknown_0203A3D2
_0814ACFC: .4byte 0x0000ffff
_0814AD00: .4byte gUnknown_0203A360
_0814AD04: .4byte gUnknown_0842F248
_0814AD08: .4byte 0x0000fff1
_0814AD0C: .4byte gUnknown_0842F1C0
_0814AD10: .4byte gSpriteTemplate_842F298
_0814AD14: .4byte gSprites
_0814AD18:
	adds r0, r5, 0
	bl IndexOfSpritePaletteTag
	lsls r0, 4
	ldrb r2, [r4, 0x5]
	adds r1, r6, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x5]
_0814AD2A:
	mov r0, r9
	bl sub_814ADF4
	ldr r0, _0814AD40
	ldrb r0, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0814AD40: .4byte gUnknown_0203A3D2
	thumb_func_end sub_814AC58

	thumb_func_start sub_814AD44
sub_814AD44: @ 814AD44
	push {r4,lr}
	ldr r4, _0814AD70
	ldrb r0, [r4]
	cmp r0, 0x40
	beq _0814AD68
	ldr r0, _0814AD74
	bl LoadTilesForSpriteSheet
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AD78
	adds r0, r1
	bl DestroySpriteAndFreeResources
	movs r0, 0x40
	strb r0, [r4]
_0814AD68:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814AD70: .4byte gUnknown_0203A3D2
_0814AD74: .4byte gUnknown_0842F1C0
_0814AD78: .4byte gSprites
	thumb_func_end sub_814AD44

	thumb_func_start sub_814AD7C
sub_814AD7C: @ 814AD7C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r1, _0814ADC0
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814ADB8
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814ADC4
	adds r2, r0, r1
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	adds r0, r2, 0
	adds r0, 0x28
	movs r1, 0
	strb r1, [r0]
	adds r0, 0x1
	strb r1, [r0]
	strh r5, [r2, 0x20]
	strh r4, [r2, 0x22]
_0814ADB8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814ADC0: .4byte gUnknown_0203A3D2
_0814ADC4: .4byte gSprites
	thumb_func_end sub_814AD7C

	thumb_func_start sub_814ADC8
sub_814ADC8: @ 814ADC8
	push {lr}
	ldr r1, _0814ADEC
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814ADE8
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814ADF0
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_0814ADE8:
	pop {r0}
	bx r0
	.align 2, 0
_0814ADEC: .4byte gUnknown_0203A3D2
_0814ADF0: .4byte gSprites
	thumb_func_end sub_814ADC8

	thumb_func_start sub_814ADF4
sub_814ADF4: @ 814ADF4
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x12
	bls _0814AE00
	movs r2, 0
_0814AE00:
	ldr r1, _0814AE24
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AE1E
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AE28
	adds r0, r1
	lsls r1, r2, 3
	ldr r2, _0814AE2C
	adds r1, r2
	bl SetSubspriteTables
_0814AE1E:
	pop {r0}
	bx r0
	.align 2, 0
_0814AE24: .4byte gUnknown_0203A3D2
_0814AE28: .4byte gSprites
_0814AE2C: .4byte gUnknown_0842F6C0
	thumb_func_end sub_814ADF4

	.align 2, 0 @ Don't pad with nop.
