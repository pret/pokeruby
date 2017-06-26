	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80BA65C
sub_80BA65C: @ 80BA65C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80BA400
	lsls r0, 24
	cmp r0, 0
	beq _080BA67C
	ldr r0, _080BA684 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080BA688 @ =sub_80BA384
	str r0, [r1]
_080BA67C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA684: .4byte gTasks
_080BA688: .4byte sub_80BA384
	thumb_func_end sub_80BA65C

	thumb_func_start sub_80BA68C
sub_80BA68C: @ 80BA68C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080BA6B0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080BA6AA
	adds r0, r2, 0
	bl DestroyTask
	ldr r0, _080BA6B4 @ =CB2_InitTitleScreen
	bl SetMainCallback2
_080BA6AA:
	pop {r0}
	bx r0
	.align 2, 0
_080BA6B0: .4byte gPaletteFade
_080BA6B4: .4byte CB2_InitTitleScreen
	thumb_func_end sub_80BA68C

	thumb_func_start sub_80BA6B8
sub_80BA6B8: @ 80BA6B8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080BA6C6
	cmp r0, 0x1
	beq _080BA6E0
_080BA6C6:
	ldr r1, _080BA6D4 @ =REG_WIN1H
	ldr r2, _080BA6D8 @ =0x000011df
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080BA6DC @ =0x00002957
	b _080BA6EC
	.align 2, 0
_080BA6D4: .4byte REG_WIN1H
_080BA6D8: .4byte 0x000011df
_080BA6DC: .4byte 0x00002957
_080BA6E0:
	ldr r1, _080BA6F4 @ =REG_WIN1H
	ldr r2, _080BA6F8 @ =0x000011df
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080BA6FC @ =0x0000618f
_080BA6EC:
	adds r0, r2, 0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080BA6F4: .4byte REG_WIN1H
_080BA6F8: .4byte 0x000011df
_080BA6FC: .4byte 0x0000618f
	thumb_func_end sub_80BA6B8

	thumb_func_start sub_80BA700
sub_80BA700: @ 80BA700
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r7, r2, 16
	movs r1, 0
	movs r2, 0
_080BA714:
	mov r3, sp
	adds r0, r3, r1
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bls _080BA714
	mov r1, sp
	movs r0, 0xB0
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	movs r4, 0
	adds r0, r5, 0
	movs r1, 0x64
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080BA748
	mov r1, sp
	adds r0, 0xA1
	strb r0, [r1]
	movs r4, 0x1
_080BA748:
	adds r0, r5, 0
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080BA766
	cmp r4, 0
	beq _080BA76C
_080BA766:
	mov r1, sp
	adds r0, 0xA1
	strb r0, [r1, 0x1]
_080BA76C:
	mov r4, sp
	adds r0, r5, 0
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	adds r0, 0xA1
	strb r0, [r4, 0x2]
	lsls r1, r6, 24
	lsrs r1, 24
	lsls r2, r7, 24
	lsrs r2, 24
	mov r0, sp
	bl MenuPrint
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BA700

	thumb_func_start sub_80BA79C
sub_80BA79C: @ 80BA79C
	push {r4-r6,lr}
	sub sp, 0xC
	adds r4, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	movs r3, 0
	movs r1, 0
_080BA7AE:
	mov r2, sp
	adds r0, r2, r3
	strb r1, [r0]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xA
	bls _080BA7AE
	mov r0, sp
	movs r1, 0xFF
	strb r1, [r0, 0xA]
	movs r3, 0
	ldrb r0, [r4]
	lsls r2, r6, 24
	lsls r5, 24
	cmp r0, 0xFF
	beq _080BA7EC
_080BA7D0:
	mov r0, sp
	adds r1, r0, r3
	adds r0, r4, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r4, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _080BA7EC
	cmp r3, 0x9
	bls _080BA7D0
_080BA7EC:
	lsrs r1, r2, 24
	lsrs r2, r5, 24
	mov r0, sp
	bl MenuPrint
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80BA79C

	thumb_func_start sub_80BA800
sub_80BA800: @ 80BA800
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xCC
	lsls r0, 24
	str r0, [sp, 0xB0]
	lsrs r2, r0, 24
	str r2, [sp, 0xAC]
	ldr r1, _080BA9E8 @ =gUnknown_083D0312
	mov r0, sp
	movs r2, 0xA
	bl memcpy
	mov r0, sp
	adds r0, 0xC
	str r0, [sp, 0xB4]
	ldr r1, _080BA9EC @ =gUnknown_083D031C
	movs r2, 0xB
	bl memcpy
	mov r2, sp
	adds r2, 0x18
	str r2, [sp, 0xB8]
	ldr r1, _080BA9F0 @ =gDebugText_Voice
	adds r0, r2, 0
	movs r2, 0xA
	bl memcpy
	mov r0, sp
	adds r0, 0x24
	str r0, [sp, 0xBC]
	ldr r1, _080BA9F4 @ =gDebugText_Volume
	movs r2, 0xA
	bl memcpy
	mov r2, sp
	adds r2, 0x30
	str r2, [sp, 0xC0]
	ldr r1, _080BA9F8 @ =gDebugText_Panpot
	adds r0, r2, 0
	movs r2, 0xA
	bl memcpy
	mov r0, sp
	adds r0, 0x3C
	str r0, [sp, 0xC4]
	ldr r1, _080BA9FC @ =gDebugText_Pitch
	movs r2, 0xA
	bl memcpy
	mov r2, sp
	adds r2, 0x48
	str r2, [sp, 0xC8]
	ldr r1, _080BAA00 @ =gDebugText_Length
	adds r0, r2, 0
	movs r2, 0xA
	bl memcpy
	add r4, sp, 0x54
	ldr r1, _080BAA04 @ =gDebugText_Release
	adds r0, r4, 0
	movs r2, 0xA
	bl memcpy
	add r7, sp, 0x60
	ldr r1, _080BAA08 @ =gDebugText_Progress
	adds r0, r7, 0
	movs r2, 0xA
	bl memcpy
	add r0, sp, 0x6C
	mov r10, r0
	ldr r1, _080BAA0C @ =gDebugText_Chorus
	movs r2, 0xA
	bl memcpy
	add r2, sp, 0x78
	mov r9, r2
	ldr r1, _080BAA10 @ =gDebugText_Priority
	mov r0, r9
	movs r2, 0xA
	bl memcpy
	add r0, sp, 0x84
	mov r8, r0
	ldr r1, _080BAA14 @ =gUnknown_083D0381
	movs r2, 0x9
	bl memcpy
	add r6, sp, 0x90
	ldr r1, _080BAA18 @ =gUnknown_083D038A
	adds r0, r6, 0
	movs r2, 0x9
	bl memcpy
	add r5, sp, 0x9C
	ldr r1, _080BAA1C @ =gUnknown_083D0393
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
	movs r1, 0x13
	movs r2, 0x4
	bl MenuPrint
	ldr r0, [sp, 0xB4]
	movs r1, 0x13
	movs r2, 0x2
	bl MenuPrint
	ldr r0, [sp, 0xB8]
	movs r1, 0x2
	movs r2, 0x1
	bl MenuPrint
	ldr r0, [sp, 0xBC]
	movs r1, 0x2
	movs r2, 0x3
	bl MenuPrint
	ldr r0, [sp, 0xC0]
	movs r1, 0x2
	movs r2, 0x5
	bl MenuPrint
	ldr r0, [sp, 0xC4]
	movs r1, 0x2
	movs r2, 0x7
	bl MenuPrint
	ldr r0, [sp, 0xC8]
	movs r1, 0x2
	movs r2, 0x9
	bl MenuPrint
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0xB
	bl MenuPrint
	adds r0, r7, 0
	movs r1, 0x2
	movs r2, 0xD
	bl MenuPrint
	mov r0, r10
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	mov r0, r9
	movs r1, 0x2
	movs r2, 0x11
	bl MenuPrint
	mov r0, r8
	movs r1, 0x13
	movs r2, 0x10
	bl MenuPrint
	adds r0, r6, 0
	movs r1, 0x13
	movs r2, 0xE
	bl MenuPrint
	adds r0, r5, 0
	movs r1, 0x13
	movs r2, 0xC
	bl MenuPrint
	ldr r1, _080BAA20 @ =REG_WIN0H
	movs r0, 0xF0
	strh r0, [r1]
	adds r1, 0x4
	movs r0, 0xA0
	strh r0, [r1]
	ldr r0, _080BAA24 @ =gUnknown_020387B3
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080BAA28 @ =gUnknown_020387B1
	strb r1, [r0]
	ldr r0, _080BAA2C @ =gUnknown_020387B2
	strb r1, [r0]
	ldr r0, _080BAA30 @ =gUnknown_03005D30
	movs r2, 0
	str r2, [r0]
	ldr r0, _080BAA34 @ =gUnknown_020387D8
	strb r2, [r0]
	ldr r1, _080BAA38 @ =gUnknown_020387D9
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _080BAA3C @ =gUnknown_020387B4
	str r2, [r0]
	movs r1, 0x78
	str r1, [r0, 0x4]
	str r2, [r0, 0x8]
	movs r1, 0xF0
	lsls r1, 6
	str r1, [r0, 0xC]
	movs r1, 0xB4
	str r1, [r0, 0x10]
	str r2, [r0, 0x18]
	str r2, [r0, 0x14]
	str r2, [r0, 0x1C]
	movs r1, 0x2
	str r1, [r0, 0x20]
	bl sub_80BAD5C
	movs r0, 0
	movs r1, 0
	bl sub_80BAE10
	ldr r1, _080BAA40 @ =gTasks
	ldr r2, [sp, 0xAC]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BAA44 @ =sub_80BAA48
	str r1, [r0]
	add sp, 0xCC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA9E8: .4byte gUnknown_083D0312
_080BA9EC: .4byte gUnknown_083D031C
_080BA9F0: .4byte gDebugText_Voice
_080BA9F4: .4byte gDebugText_Volume
_080BA9F8: .4byte gDebugText_Panpot
_080BA9FC: .4byte gDebugText_Pitch
_080BAA00: .4byte gDebugText_Length
_080BAA04: .4byte gDebugText_Release
_080BAA08: .4byte gDebugText_Progress
_080BAA0C: .4byte gDebugText_Chorus
_080BAA10: .4byte gDebugText_Priority
_080BAA14: .4byte gUnknown_083D0381
_080BAA18: .4byte gUnknown_083D038A
_080BAA1C: .4byte gUnknown_083D0393
_080BAA20: .4byte REG_WIN0H
_080BAA24: .4byte gUnknown_020387B3
_080BAA28: .4byte gUnknown_020387B1
_080BAA2C: .4byte gUnknown_020387B2
_080BAA30: .4byte gUnknown_03005D30
_080BAA34: .4byte gUnknown_020387D8
_080BAA38: .4byte gUnknown_020387D9
_080BAA3C: .4byte gUnknown_020387B4
_080BAA40: .4byte gTasks
_080BAA44: .4byte sub_80BAA48
	thumb_func_end sub_80BA800

	thumb_func_start sub_80BAA48
sub_80BAA48: @ 80BAA48
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080BAA90 @ =gMain
	ldrh r2, [r1, 0x2E]
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _080BAAA8
	movs r1, 0x80
	lsls r1, 19
	ldr r2, _080BAA94 @ =0x00007140
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x40
	ldr r2, _080BAA98 @ =0x000011df
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080BAA9C @ =0x0000011f
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _080BAAA0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BAAA4 @ =sub_80BA258
	str r1, [r0]
	b _080BACC6
	.align 2, 0
_080BAA90: .4byte gMain
_080BAA94: .4byte 0x00007140
_080BAA98: .4byte 0x000011df
_080BAA9C: .4byte 0x0000011f
_080BAAA0: .4byte gTasks
_080BAAA4: .4byte sub_80BA258
_080BAAA8:
	ldrh r1, [r1, 0x30]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	beq _080BAAD0
	ldr r1, _080BAACC @ =gUnknown_020387B3
	ldrb r2, [r1]
	subs r0, r2, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bge _080BAAEA
	movs r0, 0x8
	strb r0, [r1]
	b _080BAAEA
	.align 2, 0
_080BAACC: .4byte gUnknown_020387B3
_080BAAD0:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080BAAF8
	ldr r1, _080BAAF4 @ =gUnknown_020387B3
	ldrb r2, [r1]
	adds r0, r2, 0x1
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x8
	ble _080BAAEA
	strb r3, [r1]
_080BAAEA:
	ldrb r1, [r1]
	adds r0, r2, 0
	bl sub_80BAE10
	b _080BACC6
	.align 2, 0
_080BAAF4: .4byte gUnknown_020387B3
_080BAAF8:
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _080BAB14
	ldr r0, _080BAB10 @ =gUnknown_020387D8
	ldrb r1, [r0]
	movs r2, 0x1
	eors r1, r2
	strb r1, [r0]
	bl sub_80BAD5C
	b _080BACC6
	.align 2, 0
_080BAB10: .4byte gUnknown_020387D8
_080BAB14:
	movs r0, 0x4
	ands r0, r2
	cmp r0, 0
	beq _080BAB38
	ldr r4, _080BAB34 @ =gUnknown_020387D9
	ldrb r0, [r4]
	movs r1, 0x1
	eors r0, r1
	strb r0, [r4]
	bl sub_80BAD5C
	ldrb r0, [r4]
	bl SetPokemonCryStereo
	b _080BACC6
	.align 2, 0
_080BAB34: .4byte gUnknown_020387D9
_080BAB38:
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080BAB46
	movs r0, 0xA
	b _080BAB6E
_080BAB46:
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _080BAB56
	movs r0, 0xA
	negs r0, r0
	b _080BAB6E
_080BAB56:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080BAB64
	movs r0, 0x1
	negs r0, r0
	b _080BAB6E
_080BAB64:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080BAB78
	movs r0, 0x1
_080BAB6E:
	bl sub_80BACDC
	bl sub_80BAD5C
	b _080BACC6
_080BAB78:
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	bne _080BAB82
	b _080BACA2
_080BAB82:
	ldr r4, _080BABE4 @ =gUnknown_020387B4
	ldrb r0, [r4, 0x4]
	bl SetPokemonCryVolume
	movs r0, 0x8
	ldrsb r0, [r4, r0]
	bl SetPokemonCryPanpot
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	bl SetPokemonCryPitch
	ldrh r0, [r4, 0x10]
	bl SetPokemonCryLength
	ldr r0, [r4, 0x18]
	bl SetPokemonCryProgress
	ldrb r0, [r4, 0x14]
	bl SetPokemonCryRelease
	movs r0, 0x1C
	ldrsb r0, [r4, r0]
	bl SetPokemonCryChorus
	ldr r0, [r4, 0x20]
	lsls r0, 24
	lsrs r0, 24
	bl SetPokemonCryPriority
	ldr r4, [r4]
	adds r0, r4, 0
	cmp r4, 0
	bge _080BABC8
	adds r0, 0x7F
_080BABC8:
	asrs r2, r0, 7
	lsls r0, r2, 7
	subs r0, r4, r0
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r2, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BAC1C
	cmp r0, 0x1
	bgt _080BABE8
	cmp r0, 0
	beq _080BABF2
	b _080BACA2
	.align 2, 0
_080BABE4: .4byte gUnknown_020387B4
_080BABE8:
	cmp r0, 0x2
	beq _080BAC48
	cmp r0, 0x3
	beq _080BAC74
	b _080BACA2
_080BABF2:
	ldr r0, _080BAC04 @ =gUnknown_020387D8
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BAC0C
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BAC08 @ =voicegroup_84537C0
	b _080BAC98
	.align 2, 0
_080BAC04: .4byte gUnknown_020387D8
_080BAC08: .4byte voicegroup_84537C0
_080BAC0C:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BAC18 @ =voicegroup_8452590
	b _080BAC98
	.align 2, 0
_080BAC18: .4byte voicegroup_8452590
_080BAC1C:
	ldr r0, _080BAC30 @ =gUnknown_020387D8
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BAC38
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BAC34 @ =voicegroup_8453DC0
	b _080BAC98
	.align 2, 0
_080BAC30: .4byte gUnknown_020387D8
_080BAC34: .4byte voicegroup_8453DC0
_080BAC38:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BAC44 @ =voicegroup_8452B90
	b _080BAC98
	.align 2, 0
_080BAC44: .4byte voicegroup_8452B90
_080BAC48:
	ldr r0, _080BAC5C @ =gUnknown_020387D8
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BAC64
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BAC60 @ =voicegroup_84543C0
	b _080BAC98
	.align 2, 0
_080BAC5C: .4byte gUnknown_020387D8
_080BAC60: .4byte voicegroup_84543C0
_080BAC64:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BAC70 @ =voicegroup_8453190
	b _080BAC98
	.align 2, 0
_080BAC70: .4byte voicegroup_8453190
_080BAC74:
	ldr r0, _080BAC88 @ =gUnknown_020387D8
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BAC90
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BAC8C @ =voicegroup_84549C0
	b _080BAC98
	.align 2, 0
_080BAC88: .4byte gUnknown_020387D8
_080BAC8C: .4byte voicegroup_84549C0
_080BAC90:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BACCC @ =voicegroup_8453790
_080BAC98:
	adds r0, r1
	bl SetPokemonCryTone
	ldr r1, _080BACD0 @ =gUnknown_03005D30
	str r0, [r1]
_080BACA2:
	ldr r0, _080BACD0 @ =gUnknown_03005D30
	ldr r0, [r0]
	cmp r0, 0
	beq _080BACC6
	ldr r5, _080BACD4 @ =gUnknown_020387B1
	bl IsPokemonCryPlaying
	strb r0, [r5]
	ldr r4, _080BACD8 @ =gUnknown_020387B2
	lsls r0, 24
	lsrs r0, 24
	ldrb r2, [r4]
	cmp r0, r2
	beq _080BACC2
	bl sub_80BAD5C
_080BACC2:
	ldrb r0, [r5]
	strb r0, [r4]
_080BACC6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BACCC: .4byte voicegroup_8453790
_080BACD0: .4byte gUnknown_03005D30
_080BACD4: .4byte gUnknown_020387B1
_080BACD8: .4byte gUnknown_020387B2
	thumb_func_end sub_80BAA48

	thumb_func_start sub_80BACDC
sub_80BACDC: @ 80BACDC
	push {r4-r6,lr}
	sub sp, 0x40
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080BAD50 @ =gUnknown_083D039C
	mov r0, sp
	movs r2, 0x40
	bl memcpy
	ldr r6, _080BAD54 @ =gUnknown_020387B4
	ldr r5, _080BAD58 @ =gUnknown_020387B3
	movs r1, 0
	ldrsb r1, [r5, r1]
	lsls r1, 2
	adds r1, r6
	lsls r4, 24
	asrs r4, 24
	ldr r0, [r1]
	adds r0, r4
	str r0, [r1]
	movs r2, 0
	ldrsb r2, [r5, r2]
	lsls r0, r2, 2
	adds r3, r0, r6
	lsls r0, r2, 1
	adds r0, 0x1
	lsls r0, 2
	add r0, sp
	ldr r1, [r3]
	ldr r0, [r0]
	cmp r1, r0
	ble _080BAD26
	lsls r0, r2, 3
	add r0, sp
	ldr r0, [r0]
	str r0, [r3]
_080BAD26:
	movs r2, 0
	ldrsb r2, [r5, r2]
	lsls r0, r2, 2
	adds r3, r0, r6
	lsls r0, r2, 3
	add r0, sp
	ldr r1, [r3]
	ldr r0, [r0]
	cmp r1, r0
	bge _080BAD46
	lsls r0, r2, 1
	adds r0, 0x1
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	str r0, [r3]
_080BAD46:
	add sp, 0x40
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BAD50: .4byte gUnknown_083D039C
_080BAD54: .4byte gUnknown_020387B4
_080BAD58: .4byte gUnknown_020387B3
	thumb_func_end sub_80BACDC

	thumb_func_start sub_80BAD5C
sub_80BAD5C: @ 80BAD5C
	push {r4,lr}
	ldr r4, _080BAE00 @ =gUnknown_020387B4
	ldr r0, [r4]
	adds r0, 0x1
	movs r1, 0xB
	movs r2, 0x1
	movs r3, 0x5
	bl sub_80BAE78
	ldr r0, [r4, 0x4]
	movs r1, 0xB
	movs r2, 0x3
	movs r3, 0x5
	bl sub_80BAE78
	ldr r0, [r4, 0x8]
	movs r1, 0xB
	movs r2, 0x5
	movs r3, 0x5
	bl sub_80BAE78
	ldr r0, [r4, 0xC]
	movs r1, 0xB
	movs r2, 0x7
	movs r3, 0x5
	bl sub_80BAE78
	ldr r0, [r4, 0x10]
	movs r1, 0xB
	movs r2, 0x9
	movs r3, 0x5
	bl sub_80BAE78
	ldr r0, [r4, 0x14]
	movs r1, 0xB
	movs r2, 0xB
	movs r3, 0x5
	bl sub_80BAE78
	ldr r0, [r4, 0x18]
	movs r1, 0xB
	movs r2, 0xD
	movs r3, 0x5
	bl sub_80BAE78
	ldr r0, [r4, 0x1C]
	movs r1, 0xB
	movs r2, 0xF
	movs r3, 0x5
	bl sub_80BAE78
	ldr r0, [r4, 0x20]
	movs r1, 0xB
	movs r2, 0x11
	movs r3, 0x5
	bl sub_80BAE78
	ldr r0, _080BAE04 @ =gUnknown_020387B1
	ldrb r0, [r0]
	movs r1, 0x1B
	movs r2, 0x10
	movs r3, 0x1
	bl sub_80BAE78
	ldr r0, _080BAE08 @ =gUnknown_020387D8
	ldrb r0, [r0]
	movs r1, 0x1B
	movs r2, 0xE
	movs r3, 0x1
	bl sub_80BAE78
	ldr r0, _080BAE0C @ =gUnknown_020387D9
	ldrb r0, [r0]
	movs r1, 0x1B
	movs r2, 0xC
	movs r3, 0x1
	bl sub_80BAE78
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BAE00: .4byte gUnknown_020387B4
_080BAE04: .4byte gUnknown_020387B1
_080BAE08: .4byte gUnknown_020387D8
_080BAE0C: .4byte gUnknown_020387D9
	thumb_func_end sub_80BAD5C

	thumb_func_start sub_80BAE10
sub_80BAE10: @ 80BAE10
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _080BAE6C @ =gUnknown_083D03DC
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	add r0, sp, 0x4
	mov r8, r0
	ldr r1, _080BAE70 @ =gUnknown_083D03DE
	movs r2, 0x2
	bl memcpy
	ldr r6, _080BAE74 @ =gUnknown_083D0300
	lsls r4, 1
	adds r0, r4, r6
	ldrb r1, [r0]
	adds r4, 0x1
	adds r4, r6
	ldrb r2, [r4]
	mov r0, r8
	bl MenuPrint
	lsls r5, 1
	adds r0, r5, r6
	ldrb r1, [r0]
	adds r5, 0x1
	adds r5, r6
	ldrb r2, [r5]
	mov r0, sp
	bl MenuPrint
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BAE6C: .4byte gUnknown_083D03DC
_080BAE70: .4byte gUnknown_083D03DE
_080BAE74: .4byte gUnknown_083D0300
	thumb_func_end sub_80BAE10

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
	ldr r1, _080BB024 @ =gUnknown_083D0381
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
_080BB024: .4byte gUnknown_083D0381
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
