	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80BAE78
sub_80BAE78: @ 80BAE78
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	mov r8, r0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 24
	lsrs r7, r3, 24
	mov r1, sp
	ldr r0, _080BAF80 @ =gUnknown_083D03E0
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	movs r5, 0
	add r0, sp, 0x18
	mov r9, r0
	cmp r5, r7
	bgt _080BAEC0
	mov r4, r9
	movs r3, 0
_080BAEAC:
	lsls r0, r5, 24
	asrs r0, 24
	adds r1, r4, r0
	strb r3, [r1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	asrs r0, 24
	cmp r0, r7
	ble _080BAEAC
_080BAEC0:
	adds r0, r7, 0x1
	add r0, r9
	movs r1, 0xFF
	strb r1, [r0]
	movs r1, 0
	mov r3, r8
	cmp r3, 0
	bge _080BAED6
	negs r3, r3
	mov r8, r3
	movs r1, 0x1
_080BAED6:
	movs r4, 0
	mov r10, r4
	cmp r7, 0x1
	bne _080BAEE2
	movs r5, 0x1
	mov r10, r5
_080BAEE2:
	subs r0, r7, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 24
	lsls r6, 24
	str r6, [sp, 0x24]
	lsls r2, 24
	str r2, [sp, 0x28]
	cmp r0, 0
	blt _080BAF62
	str r1, [sp, 0x20]
_080BAEF8:
	asrs r6, r0, 24
	lsls r0, r6, 2
	add r0, sp
	ldr r1, [r0]
	mov r0, r8
	bl __divsi3
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r0, 0
	bne _080BAF1A
	mov r0, r10
	cmp r0, 0
	bne _080BAF1A
	lsls r4, r5, 24
	cmp r6, 0
	bne _080BAF46
_080BAF1A:
	lsls r4, r5, 24
	ldr r3, [sp, 0x20]
	cmp r3, 0
	beq _080BAF34
	mov r5, r10
	cmp r5, 0
	bne _080BAF34
	asrs r0, r4, 24
	subs r0, r7, r0
	subs r0, 0x1
	add r0, r9
	movs r1, 0xAE
	strb r1, [r0]
_080BAF34:
	asrs r1, r4, 24
	subs r1, r7, r1
	add r1, r9
	lsls r0, r2, 24
	asrs r0, 24
	subs r0, 0x5F
	strb r0, [r1]
	movs r0, 0x1
	mov r10, r0
_080BAF46:
	asrs r4, 24
	lsls r0, r4, 2
	add r0, sp
	ldr r1, [r0]
	mov r0, r8
	bl __modsi3
	mov r8, r0
	subs r4, 0x1
	lsls r4, 24
	lsrs r5, r4, 24
	lsls r0, r5, 24
	cmp r0, 0
	bge _080BAEF8
_080BAF62:
	ldr r3, [sp, 0x24]
	lsrs r1, r3, 24
	ldr r4, [sp, 0x28]
	lsrs r2, r4, 24
	mov r0, r9
	bl MenuPrint
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BAF80: .4byte gUnknown_083D03E0
	thumb_func_end sub_80BAE78

	thumb_func_start sub_80BAF84
sub_80BAF84: @ 80BAF84
	push {r4-r6,lr}
	sub sp, 0x14
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080BB01C @ =gOtherText_SE
	mov r0, sp
	movs r2, 0x3
	bl memcpy
	add r6, sp, 0x4
	ldr r1, _080BB020 @ =gOtherText_Pan
	adds r0, r6, 0
	movs r2, 0x4
	bl memcpy
	add r5, sp, 0x8
	ldr r1, _080BB024 @ =gDebugText_Playing
	adds r0, r5, 0
	movs r2, 0x9
	bl memcpy
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xC5
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	mov r0, sp
	movs r1, 0x3
	movs r2, 0x2
	bl MenuPrint
	adds r0, r6, 0
	movs r1, 0x3
	movs r2, 0x4
	bl MenuPrint
	adds r0, r5, 0
	movs r1, 0x3
	movs r2, 0x8
	bl MenuPrint
	ldr r1, _080BB028 @ =REG_WIN0H
	movs r0, 0xF0
	strh r0, [r1]
	adds r1, 0x4
	movs r0, 0xA0
	strh r0, [r1]
	ldr r1, _080BB02C @ =gUnknown_020387B4
	movs r0, 0x1
	str r0, [r1]
	movs r0, 0
	str r0, [r1, 0x8]
	str r0, [r1, 0x1C]
	str r0, [r1, 0x18]
	str r0, [r1, 0x14]
	bl sub_80BB1D4
	ldr r1, _080BB030 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BB034 @ =sub_80BB038
	str r1, [r0]
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB01C: .4byte gOtherText_SE
_080BB020: .4byte gOtherText_Pan
_080BB024: .4byte gDebugText_Playing
_080BB028: .4byte REG_WIN0H
_080BB02C: .4byte gUnknown_020387B4
_080BB030: .4byte gTasks
_080BB034: .4byte sub_80BB038
	thumb_func_end sub_80BAF84

	thumb_func_start sub_80BB038
sub_80BB038: @ 80BB038
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_80BB1D4
	ldr r2, _080BB058 @ =gUnknown_020387B4
	ldr r0, [r2, 0x18]
	cmp r0, 0
	beq _080BB0A2
	ldr r0, [r2, 0x14]
	cmp r0, 0
	beq _080BB05C
	subs r0, 0x1
	str r0, [r2, 0x14]
	b _080BB0A2
	.align 2, 0
_080BB058: .4byte gUnknown_020387B4
_080BB05C:
	ldr r0, _080BB088 @ =gUnknown_083D03F8
	ldr r1, [r2, 0x8]
	adds r1, r0
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x80
	negs r0, r0
	cmp r1, r0
	beq _080BB08C
	cmp r1, 0x7F
	bne _080BB0A2
	ldr r0, [r2, 0x1C]
	adds r0, 0x2
	str r0, [r2, 0x1C]
	cmp r0, 0x3E
	bgt _080BB0A2
	lsls r0, 24
	asrs r0, 24
	bl SE12PanpotControl
	b _080BB0A2
	.align 2, 0
_080BB088: .4byte gUnknown_083D03F8
_080BB08C:
	ldr r0, [r2, 0x1C]
	subs r1, r0, 0x2
	str r1, [r2, 0x1C]
	movs r0, 0x40
	negs r0, r0
	cmp r1, r0
	ble _080BB0A2
	lsls r0, r1, 24
	asrs r0, 24
	bl SE12PanpotControl
_080BB0A2:
	ldr r1, _080BB0EC @ =gMain
	ldrh r3, [r1, 0x2E]
	movs r0, 0x2
	ands r0, r3
	lsls r0, 16
	lsrs r4, r0, 16
	adds r7, r1, 0
	cmp r4, 0
	beq _080BB104
	movs r1, 0x80
	lsls r1, 19
	ldr r2, _080BB0F0 @ =0x00007140
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x40
	ldr r2, _080BB0F4 @ =0x000011df
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080BB0F8 @ =0x0000011f
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _080BB0FC @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BB100 @ =sub_80BA258
	str r1, [r0]
	b _080BB1C8
	.align 2, 0
_080BB0EC: .4byte gMain
_080BB0F0: .4byte 0x00007140
_080BB0F4: .4byte 0x000011df
_080BB0F8: .4byte 0x0000011f
_080BB0FC: .4byte gTasks
_080BB100: .4byte sub_80BA258
_080BB104:
	movs r6, 0x1
	adds r2, r6, 0
	ands r2, r3
	cmp r2, 0
	beq _080BB15E
	ldr r0, _080BB138 @ =gUnknown_083D03F8
	ldr r5, _080BB13C @ =gUnknown_020387B4
	ldr r1, [r5, 0x8]
	adds r1, r0
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x80
	negs r0, r0
	cmp r1, r0
	beq _080BB140
	cmp r1, 0x7F
	bne _080BB154
	ldrh r0, [r5]
	movs r4, 0x40
	negs r4, r4
	adds r1, r4, 0
	bl PlaySE12WithPanning
	str r4, [r5, 0x1C]
	b _080BB14C
	.align 2, 0
_080BB138: .4byte gUnknown_083D03F8
_080BB13C: .4byte gUnknown_020387B4
_080BB140:
	ldrh r0, [r5]
	movs r1, 0x3F
	bl PlaySE12WithPanning
	movs r0, 0x3F
	str r0, [r5, 0x1C]
_080BB14C:
	str r6, [r5, 0x18]
	movs r0, 0x1E
	str r0, [r5, 0x14]
	b _080BB1C8
_080BB154:
	ldrh r0, [r5]
	bl PlaySE12WithPanning
	str r4, [r5, 0x18]
	b _080BB1C8
_080BB15E:
	movs r0, 0x80
	lsls r0, 2
	ands r0, r3
	cmp r0, 0
	beq _080BB176
	ldr r1, _080BB1AC @ =gUnknown_020387B4
	ldr r0, [r1, 0x8]
	adds r0, 0x1
	str r0, [r1, 0x8]
	cmp r0, 0x4
	ble _080BB176
	str r2, [r1, 0x8]
_080BB176:
	ldrh r1, [r7, 0x2E]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080BB192
	ldr r1, _080BB1AC @ =gUnknown_020387B4
	ldr r0, [r1, 0x8]
	subs r0, 0x1
	str r0, [r1, 0x8]
	cmp r0, 0
	bge _080BB192
	movs r0, 0x4
	str r0, [r1, 0x8]
_080BB192:
	ldrh r1, [r7, 0x30]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080BB1B0
	ldr r1, _080BB1AC @ =gUnknown_020387B4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0xF7
	ble _080BB1C8
	movs r0, 0
	b _080BB1C6
	.align 2, 0
_080BB1AC: .4byte gUnknown_020387B4
_080BB1B0:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080BB1C8
	ldr r1, _080BB1D0 @ =gUnknown_020387B4
	ldr r0, [r1]
	subs r0, 0x1
	str r0, [r1]
	cmp r0, 0
	bge _080BB1C8
	movs r0, 0xF7
_080BB1C6:
	str r0, [r1]
_080BB1C8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BB1D0: .4byte gUnknown_020387B4
	thumb_func_end sub_80BB038

	thumb_func_start sub_80BB1D4
sub_80BB1D4: @ 80BB1D4
	push {r4,r5,lr}
	sub sp, 0x10
	ldr r1, _080BB218 @ =gOtherText_LR
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	add r5, sp, 0x8
	ldr r1, _080BB21C @ =gOtherText_RL
	adds r0, r5, 0
	movs r2, 0x5
	bl memcpy
	ldr r4, _080BB220 @ =gUnknown_020387B4
	ldr r0, [r4]
	movs r1, 0x7
	movs r2, 0x2
	movs r3, 0x3
	bl sub_80BAE78
	ldr r1, _080BB224 @ =gUnknown_083D03F8
	ldr r0, [r4, 0x8]
	adds r0, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x80
	negs r0, r0
	cmp r1, r0
	beq _080BB228
	cmp r1, 0x7F
	bne _080BB234
	mov r0, sp
	b _080BB22A
	.align 2, 0
_080BB218: .4byte gOtherText_LR
_080BB21C: .4byte gOtherText_RL
_080BB220: .4byte gUnknown_020387B4
_080BB224: .4byte gUnknown_083D03F8
_080BB228:
	adds r0, r5, 0
_080BB22A:
	movs r1, 0x7
	movs r2, 0x4
	bl MenuPrint
	b _080BB240
_080BB234:
	adds r0, r1, 0
	movs r1, 0x7
	movs r2, 0x4
	movs r3, 0x3
	bl sub_80BAE78
_080BB240:
	bl IsSEPlaying
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xC
	movs r2, 0x8
	movs r3, 0x1
	bl sub_80BAE78
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80BB1D4

	thumb_func_start sub_80BB25C
sub_80BB25C: @ 80BB25C
	push {r4-r6,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080BB374 @ =gWindowConfig_81E6C3C
	bl SetUpWindowConfig
	ldr r0, _080BB378 @ =gWindowConfig_81E6CE4
	bl InitMenuWindow
	ldr r1, _080BB37C @ =gUnknown_03005D34
	movs r0, 0x1
	strh r0, [r1]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _080BB380 @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r1
	movs r1, 0x80
	lsls r1, 6
	orrs r0, r1
	ldr r1, _080BB384 @ =0xff00ffff
	ands r0, r1
	movs r1, 0xE8
	lsls r1, 13
	orrs r0, r1
	ldr r1, _080BB388 @ =0x00ffffff
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 20
	orrs r0, r1
	str r0, [sp, 0x4]
	ldr r1, _080BB38C @ =0xffff00ff
	ldr r0, [sp, 0x8]
	ands r0, r1
	movs r1, 0xF0
	lsls r1, 5
	orrs r0, r1
	ldr r1, _080BB390 @ =0xffffff00
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	str r0, [sp, 0x8]
	movs r1, 0
	ldr r0, _080BB394 @ =gUnknown_03005E98
	strb r1, [r0]
	add r4, sp, 0xC
_080BB2BE:
	add r0, sp, 0x4
	movs r1, 0x3
	bl sub_8119E3C
	lsls r0, 24
	cmp r0, 0
	beq _080BB2BE
	ldr r1, _080BB380 @ =0xffff0000
	ldr r0, [sp, 0xC]
	ands r0, r1
	ldr r1, _080BB384 @ =0xff00ffff
	ands r0, r1
	movs r1, 0xF0
	lsls r1, 12
	orrs r0, r1
	ldr r1, _080BB388 @ =0x00ffffff
	ands r0, r1
	movs r1, 0xD0
	lsls r1, 20
	orrs r0, r1
	str r0, [sp, 0xC]
	ldr r1, _080BB390 @ =0xffffff00
	ldr r0, [r4, 0x4]
	ands r0, r1
	movs r1, 0xC
	orrs r0, r1
	ldr r1, _080BB38C @ =0xffff00ff
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 4
	orrs r0, r1
	str r0, [r4, 0x4]
	movs r1, 0
	ldr r0, _080BB394 @ =gUnknown_03005E98
	strb r1, [r0]
	lsls r5, r6, 2
_080BB306:
	adds r0, r4, 0
	movs r1, 0x2
	bl ShowPokedexCryScreen
	lsls r0, 24
	cmp r0, 0
	beq _080BB306
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x5
	movs r3, 0x13
	bl MenuDrawTextWindow
	bl sub_80BB494
	movs r0, 0x1
	negs r0, r0
	movs r4, 0
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _080BB398 @ =REG_BG2HOFS
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	ldr r1, _080BB39C @ =REG_BG2CNT
	ldr r2, _080BB3A0 @ =0x00000f01
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080BB3A4 @ =0x00001d03
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xE
	adds r2, 0x3D
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080BB3A8 @ =gMPlay_BGM
	movs r1, 0x2
	bl m4aMPlayFadeOutTemporarily
	ldr r1, _080BB3AC @ =gTasks
	adds r0, r5, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BB3B0 @ =sub_80BB3B4
	str r1, [r0]
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB374: .4byte gWindowConfig_81E6C3C
_080BB378: .4byte gWindowConfig_81E6CE4
_080BB37C: .4byte gUnknown_03005D34
_080BB380: .4byte 0xffff0000
_080BB384: .4byte 0xff00ffff
_080BB388: .4byte 0x00ffffff
_080BB38C: .4byte 0xffff00ff
_080BB390: .4byte 0xffffff00
_080BB394: .4byte gUnknown_03005E98
_080BB398: .4byte REG_BG2HOFS
_080BB39C: .4byte REG_BG2CNT
_080BB3A0: .4byte 0x00000f01
_080BB3A4: .4byte 0x00001d03
_080BB3A8: .4byte gMPlay_BGM
_080BB3AC: .4byte gTasks
_080BB3B0: .4byte sub_80BB3B4
	thumb_func_end sub_80BB25C

	thumb_func_start sub_80BB3B4
sub_80BB3B4: @ 80BB3B4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0x3
	bl sub_8119F88
	ldr r4, _080BB478 @ =gMain
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080BB3D4
	ldr r0, _080BB47C @ =gUnknown_03005D34
	ldrh r0, [r0]
	bl sub_811A050
_080BB3D4:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080BB3E4
	bl StopCryAndClearCrySongs
_080BB3E4:
	ldrh r1, [r4, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080BB408
	ldr r1, _080BB47C @ =gUnknown_03005D34
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bne _080BB404
	movs r2, 0xC0
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
_080BB404:
	bl sub_80BB494
_080BB408:
	ldr r0, _080BB478 @ =gMain
	ldrh r1, [r0, 0x30]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080BB42E
	ldr r2, _080BB47C @ =gUnknown_03005D34
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 17
	cmp r0, r1
	bls _080BB42A
	movs r0, 0x1
	strh r0, [r2]
_080BB42A:
	bl sub_80BB494
_080BB42E:
	ldr r0, _080BB478 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BB472
	movs r1, 0x80
	lsls r1, 19
	ldr r2, _080BB480 @ =0x00007140
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x40
	ldr r2, _080BB484 @ =0x000011df
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080BB488 @ =0x0000011f
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _080BB48C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BB490 @ =sub_80BA258
	str r1, [r0]
	bl DestroyCryMeterNeedleSprite
_080BB472:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BB478: .4byte gMain
_080BB47C: .4byte gUnknown_03005D34
_080BB480: .4byte 0x00007140
_080BB484: .4byte 0x000011df
_080BB488: .4byte 0x0000011f
_080BB48C: .4byte gTasks
_080BB490: .4byte sub_80BA258
	thumb_func_end sub_80BB3B4

	thumb_func_start sub_80BB494
sub_80BB494: @ 80BB494
	push {lr}
	ldr r0, _080BB4A8 @ =gUnknown_03005D34
	ldrh r0, [r0]
	movs r1, 0x1
	movs r2, 0x11
	movs r3, 0x3
	bl sub_80BAE78
	pop {r0}
	bx r0
	.align 2, 0
_080BB4A8: .4byte gUnknown_03005D34
	thumb_func_end sub_80BB494

	.align 2, 0 @ Don't pad with nop.
