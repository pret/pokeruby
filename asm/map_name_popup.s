	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start unref_sub_80A2F44
unref_sub_80A2F44: @ 80A2F44
	push {lr}
	bl CloseMenu
	bl AddMapNamePopUpWindowTask
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end unref_sub_80A2F44

	thumb_func_start AddMapNamePopUpWindowTask
AddMapNamePopUpWindowTask: @ 80A2F54
	push {r4,r5,lr}
	movs r0, 0x80
	lsls r0, 7
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080A2FE4
	ldr r4, _080A2FAC @ =sub_80A2FF4
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080A2FBC
	adds r0, r4, 0
	movs r1, 0x5A
	bl CreateTask
	ldr r4, _080A2FB0 @ =gUnknown_02038538
	strb r0, [r4]
	ldr r1, _080A2FB4 @ =REG_BG0VOFS
	movs r0, 0x20
	strh r0, [r1]
	bl sub_80A30E0
	ldr r2, _080A2FB8 @ =gTasks
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	strh r5, [r0, 0x8]
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0x20
	strh r1, [r0, 0xC]
	b _080A2FE4
	.align 2, 0
_080A2FAC: .4byte sub_80A2FF4
_080A2FB0: .4byte gUnknown_02038538
_080A2FB4: .4byte REG_BG0VOFS
_080A2FB8: .4byte gTasks
_080A2FBC:
	ldr r3, _080A2FEC @ =gTasks
	ldr r2, _080A2FF0 @ =gUnknown_02038538
	ldrb r0, [r2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	movs r4, 0x8
	ldrsh r0, [r1, r4]
	cmp r0, 0x2
	beq _080A2FD6
	movs r0, 0x2
	strh r0, [r1, 0x8]
_080A2FD6:
	ldrb r0, [r2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	movs r0, 0x1
	strh r0, [r1, 0xE]
_080A2FE4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2FEC: .4byte gTasks
_080A2FF0: .4byte gUnknown_02038538
	thumb_func_end AddMapNamePopUpWindowTask

	thumb_func_start sub_80A2FF4
sub_80A2FF4: @ 80A2FF4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r3, _080A3018 @ =gTasks
	adds r4, r1, r3
	movs r0, 0x8
	ldrsh r2, [r4, r0]
	cmp r2, 0x1
	beq _080A304C
	cmp r2, 0x1
	bgt _080A301C
	cmp r2, 0
	beq _080A3026
	b _080A3092
	.align 2, 0
_080A3018: .4byte gTasks
_080A301C:
	cmp r2, 0x2
	beq _080A3064
	cmp r2, 0x4
	beq _080A308C
	b _080A3092
_080A3026:
	ldrh r0, [r4, 0xC]
	subs r0, 0x2
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bgt _080A3092
	movs r0, 0x1
	strh r0, [r4, 0x8]
	ldr r0, _080A3048 @ =gUnknown_02038538
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	strh r2, [r0, 0xA]
	b _080A3092
	.align 2, 0
_080A3048: .4byte gUnknown_02038538
_080A304C:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x78
	ble _080A3092
	movs r0, 0
	strh r0, [r4, 0xA]
	movs r0, 0x2
	strh r0, [r4, 0x8]
	b _080A3092
_080A3064:
	ldrh r0, [r4, 0xC]
	adds r0, 0x2
	movs r5, 0
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	ble _080A3092
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080A3086
	bl sub_80A30E0
	strh r5, [r4, 0x8]
	strh r5, [r4, 0xE]
	b _080A3092
_080A3086:
	movs r0, 0x4
	strh r0, [r4, 0x8]
	b _080A3098
_080A308C:
	bl HideMapNamePopUpWindow
	b _080A3098
_080A3092:
	ldr r1, _080A30A0 @ =REG_BG0VOFS
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
_080A3098:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A30A0: .4byte REG_BG0VOFS
	thumb_func_end sub_80A2FF4

	thumb_func_start HideMapNamePopUpWindow
HideMapNamePopUpWindow: @ 80A30A4
	push {lr}
	ldr r0, _080A30D4 @ =sub_80A2FF4
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	beq _080A30D0
	bl MenuLoadTextWindowGraphics
	movs r0, 0
	movs r1, 0
	movs r2, 0xD
	movs r3, 0x3
	bl MenuZeroFillWindowRect
	ldr r1, _080A30D8 @ =REG_BG0VOFS
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080A30DC @ =gUnknown_02038538
	ldrb r0, [r0]
	bl DestroyTask
_080A30D0:
	pop {r0}
	bx r0
	.align 2, 0
_080A30D4: .4byte sub_80A2FF4
_080A30D8: .4byte REG_BG0VOFS
_080A30DC: .4byte gUnknown_02038538
	thumb_func_end HideMapNamePopUpWindow

	thumb_func_start sub_80A30E0
sub_80A30E0: @ 80A30E0
	push {lr}
	sub sp, 0x14
	movs r0, 0
	bl MenuLoadTextWindowGraphics_OverrideFrameType
	ldr r0, _080A3114 @ =gMapHeader
	ldrb r1, [r0, 0x14]
	mov r0, sp
	movs r2, 0
	bl sub_80FBFB4
	movs r0, 0
	movs r1, 0
	movs r2, 0xD
	movs r3, 0x3
	bl MenuDrawTextWindow
	mov r0, sp
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x60
	bl sub_8072BD8
	add sp, 0x14
	pop {r0}
	bx r0
	.align 2, 0
_080A3114: .4byte gMapHeader
	thumb_func_end sub_80A30E0

	.align 2, 0 @ Don't pad with nop.
