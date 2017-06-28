	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_81368A4
sub_81368A4: @ 81368A4
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _081368C4 @ =gUnknown_02039304
	ldr r0, [r1]
	adds r0, 0x50
	ldrb r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x6
	bls _081368B8
	b _081369B8
_081368B8:
	lsls r0, 2
	ldr r1, _081368C8 @ =_081368CC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081368C4: .4byte gUnknown_02039304
_081368C8: .4byte _081368CC
	.align 2, 0
_081368CC:
	.4byte _081368E8
	.4byte _08136922
	.4byte _0813692E
	.4byte _0813694C
	.4byte _0813695A
	.4byte _0813696C
	.4byte _08136998
_081368E8:
	ldr r0, _0813690C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _08136910 @ =0x000087dc
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r0, r2]
	ldr r0, _08136914 @ =gUnknown_02039310
	ldrb r0, [r0]
	cmp r1, r0
	beq _08136918
	ldr r0, [r4]
	adds r0, 0x56
	ldrb r0, [r0]
	bl sub_80F5060
	ldr r1, [r4]
	b _08136986
	.align 2, 0
_0813690C: .4byte gUnknown_083DFEC4
_08136910: .4byte 0x000087dc
_08136914: .4byte gUnknown_02039310
_08136918:
	ldr r0, [r4]
	adds r0, 0x50
	movs r1, 0x3
	strb r1, [r0]
	b _081369B8
_08136922:
	bl gpu_sync_bg_show
	lsls r0, 24
	cmp r0, 0
	bne _081369B8
	b _08136982
_0813692E:
	bl sub_8055870
	adds r4, r0, 0
	cmp r4, 0
	bne _081369B8
	bl sub_80F1934
	ldr r0, _08136948 @ =gUnknown_02039304
	ldr r0, [r0]
	adds r0, 0x50
	strb r4, [r0]
	b _081369B8
	.align 2, 0
_08136948: .4byte gUnknown_02039304
_0813694C:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	b _08136982
_0813695A:
	movs r1, 0x80
	lsls r1, 19
	ldr r2, _08136968 @ =0x00007f40
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, [r4]
	b _08136986
	.align 2, 0
_08136968: .4byte 0x00007f40
_0813696C:
	ldr r0, _08136990 @ =sub_8136264
	bl SetVBlankCallback
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_08136982:
	ldr r0, _08136994 @ =gUnknown_02039304
	ldr r1, [r0]
_08136986:
	adds r1, 0x50
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _081369B8
	.align 2, 0
_08136990: .4byte sub_8136264
_08136994: .4byte gUnknown_02039304
_08136998:
	ldr r0, _081369C0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081369B8
	bl sub_80F3C94
	bl sub_80F3D00
	ldr r0, _081369C4 @ =sub_81369CC
	bl launch_c3_walk_stairs_and_run_once
	ldr r0, _081369C8 @ =sub_8136244
	bl SetMainCallback2
_081369B8:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081369C0: .4byte gPaletteFade
_081369C4: .4byte sub_81369CC
_081369C8: .4byte sub_8136244
	thumb_func_end sub_81368A4

	thumb_func_start sub_81369CC
sub_81369CC: @ 81369CC
	push {r4-r6,lr}
	ldr r1, _081369E8 @ =gUnknown_02039304
	ldr r0, [r1]
	adds r0, 0x50
	ldrb r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x5
	bls _081369DE
	b _08136B32
_081369DE:
	lsls r0, 2
	ldr r1, _081369EC @ =_081369F0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081369E8: .4byte gUnknown_02039304
_081369EC: .4byte _081369F0
	.align 2, 0
_081369F0:
	.4byte _08136A08
	.4byte _08136A48
	.4byte _08136A5C
	.4byte _08136AAC
	.4byte _08136AEC
	.4byte _08136B0E
_08136A08:
	ldr r3, [r4]
	ldr r2, _08136A38 @ =gPlayerParty
	str r2, [r3, 0xC]
	ldr r0, _08136A3C @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r5, _08136A40 @ =0x000087dc
	adds r0, r1, r5
	movs r5, 0
	ldrsh r0, [r0, r5]
	lsls r0, 2
	adds r1, r0
	ldr r0, _08136A44 @ =0x0000893e
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 27
	lsrs r0, 27
	movs r1, 0x64
	muls r0, r1
	adds r0, r2
	str r0, [r3, 0xC]
	bl move_anim_execute
	b _08136B02
	.align 2, 0
_08136A38: .4byte gPlayerParty
_08136A3C: .4byte gUnknown_083DFEC4
_08136A40: .4byte 0x000087dc
_08136A44: .4byte 0x0000893e
_08136A48:
	ldr r0, _08136A58 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08136B32
	b _08136B02
	.align 2, 0
_08136A58: .4byte gMain
_08136A5C:
	bl sub_8136EF0
	ldr r6, _08136A98 @ =gUnknown_02039304
	ldr r0, [r6]
	adds r0, 0x5C
	ldr r1, _08136A9C @ =gUnknown_083DFEC4
	ldr r4, [r1]
	ldr r1, _08136AA0 @ =0x00009040
	adds r5, r4, r1
	adds r1, r5, 0
	bl sub_80F567C
	ldr r1, _08136AA4 @ =0x00008fe9
	adds r0, r4, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	ldr r1, _08136AA8 @ =0x00009004
	adds r0, r1
	adds r4, r0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80F5550
	bl sub_8137138
	ldr r1, [r6]
	b _08136B04
	.align 2, 0
_08136A98: .4byte gUnknown_02039304
_08136A9C: .4byte gUnknown_083DFEC4
_08136AA0: .4byte 0x00009040
_08136AA4: .4byte 0x00008fe9
_08136AA8: .4byte 0x00009004
_08136AAC:
	bl sub_80F555C
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08136B32
	ldr r0, _08136AE0 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r5, _08136AE4 @ =0x000087dc
	adds r0, r5
	ldrb r0, [r0]
	bl sub_81370A4
	lsls r0, 24
	lsrs r0, 24
	bl sub_80F7224
	bl sub_80F3D00
	ldr r1, _08136AE8 @ =gUnknown_02039304
	ldr r0, [r1]
	adds r0, 0x52
	strb r4, [r0]
	ldr r1, [r1]
	b _08136B04
	.align 2, 0
_08136AE0: .4byte gUnknown_083DFEC4
_08136AE4: .4byte 0x000087dc
_08136AE8: .4byte gUnknown_02039304
_08136AEC:
	ldr r1, [r4]
	adds r1, 0x52
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x10
	bls _08136B32
	bl sub_8136C6C
_08136B02:
	ldr r1, [r4]
_08136B04:
	adds r1, 0x50
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08136B32
_08136B0E:
	ldr r0, _08136B38 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08136B32
	bl sub_8136D00
	lsls r0, 24
	cmp r0, 0
	bne _08136B32
	ldr r0, _08136B3C @ =gScriptItemId
	ldrb r0, [r0]
	bl sub_810CA6C
	ldr r0, _08136B40 @ =sub_8136B44
	bl launch_c3_walk_stairs_and_run_once
_08136B32:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08136B38: .4byte gMain
_08136B3C: .4byte gScriptItemId
_08136B40: .4byte sub_8136B44
	thumb_func_end sub_81369CC

	thumb_func_start sub_8136B44
sub_8136B44: @ 8136B44
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _08136B60 @ =gUnknown_02039304
	ldr r0, [r4]
	adds r2, r0, 0
	adds r2, 0x50
	ldrb r1, [r2]
	cmp r1, 0x1
	beq _08136B80
	cmp r1, 0x1
	bgt _08136B64
	cmp r1, 0
	beq _08136B6E
	b _08136BAE
	.align 2, 0
_08136B60: .4byte gUnknown_02039304
_08136B64:
	cmp r1, 0x2
	beq _08136B98
	cmp r1, 0x3
	beq _08136BA8
	b _08136BAE
_08136B6E:
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _08136B9C
_08136B80:
	ldr r0, _08136B94 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08136BAE
	movs r0, 0x2
	strb r0, [r2]
	b _08136BAE
	.align 2, 0
_08136B94: .4byte gPaletteFade
_08136B98:
	bl sub_80F5BDC
_08136B9C:
	ldr r1, [r4]
	adds r1, 0x50
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08136BAE
_08136BA8:
	ldr r0, [r0, 0x4]
	bl SetMainCallback2
_08136BAE:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8136B44

	thumb_func_start sub_8136BB8
sub_8136BB8: @ 8136BB8
	push {r4,lr}
	ldr r0, _08136C28 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _08136C2C @ =0x000087dc
	adds r0, r1
	ldrb r0, [r0]
	bl sub_81370A4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _08136C30 @ =gPlayerParty
	adds r0, r1
	ldr r4, _08136C34 @ =gUnknown_02039304
	ldr r2, [r4]
	adds r2, 0x10
	movs r1, 0x2
	bl GetMonData
	ldr r0, [r4]
	adds r0, 0x10
	bl StringGetEnd10
	ldr r0, [r4]
	adds r0, 0x10
	ldr r1, _08136C38 @ =gOtherText_GetsAPokeBlock
	bl StringAppend
	ldr r0, _08136C3C @ =gWindowConfig_81E709C
	bl BasicInitMenuWindow
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, [r4]
	adds r0, 0x10
	movs r1, 0x1
	movs r2, 0x11
	bl MenuPrint
	movs r0, 0x17
	movs r1, 0xA
	movs r2, 0x1
	bl DisplayYesNoMenu
	movs r0, 0
	bl MoveMenuCursor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08136C28: .4byte gUnknown_083DFEC4
_08136C2C: .4byte 0x000087dc
_08136C30: .4byte gPlayerParty
_08136C34: .4byte gUnknown_02039304
_08136C38: .4byte gOtherText_GetsAPokeBlock
_08136C3C: .4byte gWindowConfig_81E709C
	thumb_func_end sub_8136BB8

	thumb_func_start sub_8136C40
sub_8136C40: @ 8136C40
	push {r4,lr}
	bl ProcessMenuInputNoWrap
	lsls r0, 24
	asrs r4, r0, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x2
	bhi _08136C60
	bl MenuZeroFillScreen
	ldr r0, _08136C68 @ =gWindowConfig_81E7080
	bl BasicInitMenuWindow
_08136C60:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08136C68: .4byte gWindowConfig_81E7080
	thumb_func_end sub_8136C40

	thumb_func_start sub_8136C6C
sub_8136C6C: @ 8136C6C
	push {lr}
	ldr r0, _08136C8C @ =gWindowConfig_81E709C
	bl BasicInitMenuWindow
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r3, _08136C90 @ =gUnknown_02039304
	ldr r0, [r3]
	adds r0, 0x53
	movs r1, 0
	b _08136C9C
	.align 2, 0
_08136C8C: .4byte gWindowConfig_81E709C
_08136C90: .4byte gUnknown_02039304
_08136C94:
	ldr r0, [r3]
	adds r0, 0x53
	ldrb r1, [r0]
	adds r1, 0x1
_08136C9C:
	strb r1, [r0]
	ldr r2, [r3]
	adds r1, r2, 0
	adds r1, 0x53
	ldrb r0, [r1]
	cmp r0, 0x4
	bhi _08136CDC
	adds r0, r2, 0
	adds r0, 0x61
	ldrb r1, [r1]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08136C94
	ldr r0, _08136CD8 @ =gUnknown_02039304
	ldr r2, [r0]
	adds r1, r2, 0
	adds r1, 0x53
	ldrb r0, [r1]
	cmp r0, 0x4
	bhi _08136CDC
	adds r0, r2, 0
	adds r0, 0x10
	ldrb r1, [r1]
	adds r2, 0x61
	adds r2, r1
	ldrb r2, [r2]
	bl sub_8136DC0
	b _08136CEE
	.align 2, 0
_08136CD8: .4byte gUnknown_02039304
_08136CDC:
	ldr r0, _08136CFC @ =gUnknown_02039304
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x10
	adds r1, 0x53
	ldrb r1, [r1]
	movs r2, 0
	bl sub_8136DC0
_08136CEE:
	ldr r0, _08136CFC @ =gUnknown_02039304
	ldr r0, [r0]
	adds r0, 0x10
	bl sub_8136DA0
	pop {r0}
	bx r0
	.align 2, 0
_08136CFC: .4byte gUnknown_02039304
	thumb_func_end sub_8136C6C

	thumb_func_start sub_8136D00
sub_8136D00: @ 8136D00
	push {r4,r5,lr}
	ldr r4, _08136D30 @ =gUnknown_02039304
	adds r3, r4, 0
	movs r5, 0x5
_08136D08:
	ldr r0, [r3]
	adds r0, 0x53
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	ldr r2, [r3]
	adds r1, r2, 0
	adds r1, 0x53
	ldrb r0, [r1]
	cmp r0, 0x4
	bhi _08136D34
	adds r0, r2, 0
	adds r0, 0x61
	ldrb r1, [r1]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08136D3A
	b _08136D08
	.align 2, 0
_08136D30: .4byte gUnknown_02039304
_08136D34:
	strb r5, [r1]
	movs r0, 0
	b _08136D5A
_08136D3A:
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x10
	adds r1, r2, 0
	adds r1, 0x53
	ldrb r1, [r1]
	adds r2, 0x61
	adds r2, r1
	ldrb r2, [r2]
	bl sub_8136DC0
	ldr r0, [r4]
	adds r0, 0x10
	bl sub_8136DA0
	movs r0, 0x1
_08136D5A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8136D00

	thumb_func_start sub_8136D60
sub_8136D60: @ 8136D60
	push {lr}
	ldr r0, _08136D84 @ =gWindowConfig_81E709C
	bl BasicInitMenuWindow
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08136D88 @ =gOtherText_WontEat
	movs r1, 0x1
	movs r2, 0x11
	bl MenuPrint
	pop {r0}
	bx r0
	.align 2, 0
_08136D84: .4byte gWindowConfig_81E709C
_08136D88: .4byte gOtherText_WontEat
	thumb_func_end sub_8136D60

	thumb_func_start sub_8136D8C
sub_8136D8C: @ 8136D8C
	push {lr}
	bl MenuZeroFillScreen
	ldr r0, _08136D9C @ =gWindowConfig_81E7080
	bl BasicInitMenuWindow
	pop {r0}
	bx r0
	.align 2, 0
_08136D9C: .4byte gWindowConfig_81E7080
	thumb_func_end sub_8136D8C

	thumb_func_start sub_8136DA0
sub_8136DA0: @ 8136DA0
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0x11
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8136DA0

	thumb_func_start sub_8136DC0
sub_8136DC0: @ 8136DC0
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r2, 16
	lsrs r0, r2, 16
	asrs r2, 16
	cmp r2, 0
	beq _08136DFC
	cmp r2, 0
	ble _08136DD8
	movs r0, 0
_08136DD8:
	lsls r0, 16
	ldr r1, _08136DF4 @ =gUnknown_08406134
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl StringCopy
	ldr r1, _08136DF8 @ =gOtherText_WasEnhanced
	adds r0, r4, 0
	bl StringAppend
	b _08136E04
	.align 2, 0
_08136DF4: .4byte gUnknown_08406134
_08136DF8: .4byte gOtherText_WasEnhanced
_08136DFC:
	ldr r1, _08136E0C @ =gOtherText_NothingChanged
	adds r0, r4, 0
	bl StringCopy
_08136E04:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08136E0C: .4byte gOtherText_NothingChanged
	thumb_func_end sub_8136DC0

	thumb_func_start sub_8136E10
sub_8136E10: @ 8136E10
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	movs r4, 0
	ldr r7, _08136E3C @ =gUnknown_08406118
_08136E1A:
	lsls r0, r4, 2
	adds r0, r7
	ldr r1, [r0]
	adds r0, r6, 0
	bl GetMonData
	adds r1, r5, r4
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _08136E1A
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08136E3C: .4byte gUnknown_08406118
	thumb_func_end sub_8136E10

	thumb_func_start sub_8136E40
sub_8136E40: @ 8136E40
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	mov r8, r0
	adds r5, r1, 0
	adds r0, r5, 0
	movs r1, 0x30
	bl GetMonData
	cmp r0, 0xFF
	beq _08136EDC
	mov r0, r8
	adds r1, r5, 0
	bl sub_8136F74
	movs r4, 0
	mov r7, sp
_08136E64:
	ldr r1, _08136EE8 @ =gUnknown_08406118
	lsls r0, r4, 2
	adds r0, r1
	ldr r6, [r0]
	adds r0, r5, 0
	adds r1, r6, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	strb r0, [r7]
	ldr r1, _08136EEC @ =gUnknown_02039304
	ldr r1, [r1]
	lsls r2, r4, 1
	adds r1, 0x66
	adds r1, r2
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r0, 0
	bge _08136E92
	movs r1, 0
_08136E92:
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _08136E9C
	movs r1, 0xFF
_08136E9C:
	strb r1, [r7]
	adds r0, r5, 0
	adds r1, r6, 0
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _08136E64
	adds r0, r5, 0
	movs r1, 0x30
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	mov r2, r8
	ldrb r2, [r2, 0x6]
	adds r1, r0, r2
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _08136ECE
	movs r1, 0xFF
_08136ECE:
	mov r0, sp
	strb r1, [r0]
	adds r0, r5, 0
	movs r1, 0x30
	mov r2, sp
	bl SetMonData
_08136EDC:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08136EE8: .4byte gUnknown_08406118
_08136EEC: .4byte gUnknown_02039304
	thumb_func_end sub_8136E40

	thumb_func_start sub_8136EF0
sub_8136EF0: @ 8136EF0
	push {r4,r5,lr}
	ldr r5, _08136F60 @ =gPlayerParty
	ldr r0, _08136F64 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _08136F68 @ =0x000087dc
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	lsls r0, 2
	adds r1, r0
	ldr r0, _08136F6C @ =0x0000893e
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 27
	lsrs r0, 27
	movs r1, 0x64
	muls r0, r1
	adds r5, r0, r5
	ldr r4, _08136F70 @ =gUnknown_02039304
	ldr r1, [r4]
	adds r1, 0x57
	adds r0, r5, 0
	bl sub_8136E10
	ldr r0, [r4]
	ldr r0, [r0, 0x8]
	adds r1, r5, 0
	bl sub_8136E40
	ldr r1, [r4]
	adds r1, 0x5C
	adds r0, r5, 0
	bl sub_8136E10
	movs r3, 0
_08136F36:
	ldr r0, [r4]
	adds r2, r0, 0
	adds r2, 0x61
	adds r2, r3
	adds r1, r0, 0
	adds r1, 0x5C
	adds r1, r3
	adds r0, 0x57
	adds r0, r3
	ldrb r1, [r1]
	ldrb r0, [r0]
	subs r1, r0
	strb r1, [r2]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x4
	bls _08136F36
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08136F60: .4byte gPlayerParty
_08136F64: .4byte gUnknown_083DFEC4
_08136F68: .4byte 0x000087dc
_08136F6C: .4byte 0x0000893e
_08136F70: .4byte gUnknown_02039304
	thumb_func_end sub_8136EF0

	thumb_func_start sub_8136F74
sub_8136F74: @ 8136F74
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r10, r1
	ldr r1, _08136FBC @ =gUnknown_02039304
	ldr r3, [r1]
	ldrb r1, [r0, 0x1]
	adds r2, r3, 0
	adds r2, 0x66
	strh r1, [r2]
	ldrb r2, [r0, 0x5]
	adds r1, r3, 0
	adds r1, 0x68
	strh r2, [r1]
	ldrb r1, [r0, 0x4]
	adds r2, r3, 0
	adds r2, 0x6A
	strh r1, [r2]
	ldrb r2, [r0, 0x3]
	adds r1, r3, 0
	adds r1, 0x6C
	strh r2, [r1]
	ldrb r1, [r0, 0x2]
	adds r0, r3, 0
	adds r0, 0x6E
	strh r1, [r0]
	ldr r0, _08136FC0 @ =gUnknown_02039312
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	ble _08136FC4
	movs r0, 0x1
	b _08136FCA
	.align 2, 0
_08136FBC: .4byte gUnknown_02039304
_08136FC0: .4byte gUnknown_02039312
_08136FC4:
	cmp r0, 0
	bge _08137040
	movs r0, 0xFF
_08136FCA:
	movs r2, 0
	lsls r0, 24
	mov r9, r0
	ldr r0, _08137050 @ =gUnknown_02039304
	mov r8, r0
_08136FD4:
	mov r0, r8
	ldr r1, [r0]
	lsls r0, r2, 24
	asrs r6, r0, 24
	lsls r7, r6, 1
	adds r1, 0x66
	adds r1, r7
	movs r2, 0
	ldrsh r4, [r1, r2]
	adds r0, r4, 0
	movs r1, 0xA
	bl __divsi3
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	movs r1, 0xA
	bl __modsi3
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _0813700C
	lsls r0, r5, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r5, r0, 24
_0813700C:
	ldr r0, _08137054 @ =gUnknown_0840612C
	adds r0, r6, r0
	ldrb r1, [r0]
	mov r0, r10
	bl sub_8040A54
	lsls r0, 24
	asrs r2, r0, 24
	cmp r0, r9
	bne _08137034
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0x66
	adds r0, r7
	lsls r1, r5, 24
	asrs r1, 24
	muls r1, r2
	ldrh r2, [r0]
	adds r1, r2
	strh r1, [r0]
_08137034:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	asrs r0, 24
	cmp r0, 0x4
	ble _08136FD4
_08137040:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08137050: .4byte gUnknown_02039304
_08137054: .4byte gUnknown_0840612C
	thumb_func_end sub_8136F74

	thumb_func_start sub_8137058
sub_8137058: @ 8137058
	push {lr}
	ldr r0, _0813708C @ =gPlayerParty
	ldr r1, _08137090 @ =gUnknown_083DFEC4
	ldr r2, [r1]
	ldr r3, _08137094 @ =0x000087dc
	adds r1, r2, r3
	movs r3, 0
	ldrsh r1, [r1, r3]
	lsls r1, 2
	adds r2, r1
	ldr r1, _08137098 @ =0x0000893e
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 27
	lsrs r1, 27
	movs r2, 0x64
	muls r1, r2
	adds r0, r1, r0
	movs r1, 0x30
	bl GetMonData
	cmp r0, 0xFF
	beq _0813709C
	movs r0, 0
	b _0813709E
	.align 2, 0
_0813708C: .4byte gPlayerParty
_08137090: .4byte gUnknown_083DFEC4
_08137094: .4byte 0x000087dc
_08137098: .4byte 0x0000893e
_0813709C:
	movs r0, 0x1
_0813709E:
	pop {r1}
	bx r1
	thumb_func_end sub_8137058

	thumb_func_start sub_81370A4
sub_81370A4: @ 81370A4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
_081370AC:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _081370C8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _081370D2
	cmp r5, 0
	bne _081370CC
	adds r0, r4, 0
	b _081370DE
	.align 2, 0
_081370C8: .4byte gPlayerParty
_081370CC:
	subs r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_081370D2:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _081370AC
	movs r0, 0
_081370DE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_81370A4

	thumb_func_start sub_81370E4
sub_81370E4: @ 81370E4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	movs r6, 0
	cmp r6, r5
	bcs _08137114
_081370F2:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _08137120 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _0813710A
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0813710A:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _081370F2
_08137114:
	subs r0, r5, r6
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08137120: .4byte gPlayerParty
	thumb_func_end sub_81370E4

	thumb_func_start sub_8137124
sub_8137124: @ 8137124
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_81370A4
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8137124

	thumb_func_start sub_8137138
sub_8137138: @ 8137138
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _081371C0 @ =gSpriteSheet_ConditionUpDown
	bl LoadSpriteSheet
	ldr r0, _081371C4 @ =gSpritePalette_ConditionUpDown
	bl LoadSpritePalette
	ldr r2, _081371C8 @ =gUnknown_02039304
	ldr r0, [r2]
	adds r0, 0x54
	movs r1, 0
	strb r1, [r0]
	movs r4, 0
	adds r5, r2, 0
	ldr r6, _081371CC @ =gUnknown_08406158
	adds r0, r6, 0x2
	mov r8, r0
	ldr r7, _081371D0 @ =gSprites + 0x1C
_08137160:
	ldr r0, [r5]
	adds r0, 0x61
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _081371AC
	lsls r2, r4, 2
	adds r0, r2, r6
	movs r3, 0
	ldrsh r1, [r0, r3]
	add r2, r8
	movs r0, 0
	ldrsh r2, [r2, r0]
	ldr r0, _081371D4 @ =gSpriteTemplate_840618C
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _081371AC
	ldr r0, [r5]
	adds r0, 0x61
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _081371A2
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldr r1, _081371D8 @ =sub_81371DC
	str r1, [r0]
_081371A2:
	ldr r1, [r5]
	adds r1, 0x54
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_081371AC:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _08137160
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081371C0: .4byte gSpriteSheet_ConditionUpDown
_081371C4: .4byte gSpritePalette_ConditionUpDown
_081371C8: .4byte gUnknown_02039304
_081371CC: .4byte gUnknown_08406158
_081371D0: .4byte gSprites + 0x1C
_081371D4: .4byte gSpriteTemplate_840618C
_081371D8: .4byte sub_81371DC
	thumb_func_end sub_8137138

	thumb_func_start sub_81371DC
sub_81371DC: @ 81371DC
	push {lr}
	adds r1, r0, 0
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x5
	bgt _081371EE
	ldrh r0, [r1, 0x26]
	subs r0, 0x2
	b _081371F6
_081371EE:
	cmp r0, 0xB
	bgt _081371F8
	ldrh r0, [r1, 0x26]
	adds r0, 0x2
_081371F6:
	strh r0, [r1, 0x26]
_081371F8:
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3C
	ble _08137218
	adds r0, r1, 0
	bl DestroySprite
	ldr r0, _0813721C @ =gUnknown_02039304
	ldr r1, [r0]
	adds r1, 0x54
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_08137218:
	pop {r0}
	bx r0
	.align 2, 0
_0813721C: .4byte gUnknown_02039304
	thumb_func_end sub_81371DC

	.align 2, 0 @ Don't pad with nop.
