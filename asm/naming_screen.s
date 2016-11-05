	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start DoNamingScreen
DoNamingScreen: @ 80B59CC
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r4, [sp, 0x14]
	ldr r5, [sp, 0x18]
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 16
	lsrs r3, 16
	str r4, [sp]
	str r5, [sp, 0x4]
	bl AddNamingScreenTask
	ldr r0, _080B59F8 @ =C2_NamingScreen
	bl SetMainCallback2
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B59F8: .4byte C2_NamingScreen
	thumb_func_end DoNamingScreen

	thumb_func_start C2_NamingScreen
C2_NamingScreen: @ 80B59FC
	push {lr}
	ldr r0, _080B5A14 @ =gMain
	ldr r1, _080B5A18 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x7
	bhi _080B5A96
	lsls r0, 2
	ldr r1, _080B5A1C @ =_080B5A20
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B5A14: .4byte gMain
_080B5A18: .4byte 0x0000043c
_080B5A1C: .4byte _080B5A20
	.align 2, 0
_080B5A20:
	.4byte _080B5A40
	.4byte _080B5A4A
	.4byte _080B5A50
	.4byte _080B5A56
	.4byte _080B5A5C
	.4byte _080B5A62
	.4byte _080B5A68
	.4byte _080B5A84
_080B5A40:
	bl NamingScreen_TurnOffScreen
	bl NamingScreen_Init
	b _080B5A6C
_080B5A4A:
	bl NamingScreen_ClearVram
	b _080B5A6C
_080B5A50:
	bl NamingScreen_ClearOam
	b _080B5A6C
_080B5A56:
	bl NamingScreen_SetUpVideoRegs
	b _080B5A6C
_080B5A5C:
	bl sub_80B5DC8
	b _080B5A6C
_080B5A62:
	bl NamingScreen_ResetObjects
	b _080B5A6C
_080B5A68:
	bl sub_80B5DFC
_080B5A6C:
	ldr r1, _080B5A7C @ =gMain
	ldr r0, _080B5A80 @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080B5A96
	.align 2, 0
_080B5A7C: .4byte gMain
_080B5A80: .4byte 0x0000043c
_080B5A84:
	bl sub_80B5E20
	bl sub_80B5E3C
	bl sub_80B5C04
	ldr r0, _080B5A9C @ =sub_80B5AA0
	bl SetMainCallback2
_080B5A96:
	pop {r0}
	bx r0
	.align 2, 0
_080B5A9C: .4byte sub_80B5AA0
	thumb_func_end C2_NamingScreen

	thumb_func_start sub_80B5AA0
sub_80B5AA0: @ 80B5AA0
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_80B5AA0

	thumb_func_start sub_80B5AB8
sub_80B5AB8: @ 80B5AB8
	push {r4,lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	ldr r1, _080B5B00 @ =REG_BG1VOFS
	ldr r4, _080B5B04 @ =0x02000000
	ldrh r0, [r4, 0x4]
	strh r0, [r1]
	adds r1, 0x4
	ldrh r0, [r4, 0x6]
	strh r0, [r1]
	ldr r2, _080B5B08 @ =REG_BG1CNT
	ldrh r1, [r2]
	ldr r3, _080B5B0C @ =0x0000fffc
	adds r0, r3, 0
	ands r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	ldrh r1, [r4, 0x8]
	orrs r0, r1
	strh r0, [r2]
	adds r2, 0x2
	ldrh r0, [r2]
	ands r3, r0
	strh r3, [r2]
	ldrh r0, [r2]
	ldrh r1, [r4, 0xA]
	orrs r0, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5B00: .4byte REG_BG1VOFS
_080B5B04: .4byte 0x02000000
_080B5B08: .4byte REG_BG1CNT
_080B5B0C: .4byte 0x0000fffc
	thumb_func_end sub_80B5AB8

	thumb_func_start AddNamingScreenTask
AddNamingScreenTask: @ 80B5B10
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r8, r0
	mov r9, r1
	adds r5, r2, 0
	adds r6, r3, 0
	ldr r7, [sp, 0x1C]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	ldr r0, _080B5B74 @ =NamingScreenDummyTask
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080B5B78 @ =gTasks
	adds r4, r0
	mov r0, r8
	strh r0, [r4, 0x8]
	strh r5, [r4, 0xA]
	strh r6, [r4, 0xC]
	lsrs r0, r7, 16
	strh r0, [r4, 0xE]
	strh r7, [r4, 0x10]
	adds r0, r4, 0
	adds r0, 0x12
	mov r1, r9
	bl StoreWordInTwoHalfwords
	adds r4, 0x16
	adds r0, r4, 0
	ldr r1, [sp, 0x20]
	bl StoreWordInTwoHalfwords
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5B74: .4byte NamingScreenDummyTask
_080B5B78: .4byte gTasks
	thumb_func_end AddNamingScreenTask

	thumb_func_start GetNamingScreenParameters
GetNamingScreenParameters: @ 80B5B7C
	push {r4-r6,lr}
	ldr r0, _080B5BD8 @ =NamingScreenDummyTask
	bl FindTaskIdByFunc
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _080B5BDC @ =gTasks
	adds r4, r0
	ldr r6, _080B5BE0 @ =0x02000000
	ldrh r0, [r4, 0x8]
	strb r0, [r6, 0x1]
	ldrh r0, [r4, 0xA]
	strh r0, [r6, 0x3E]
	ldrh r1, [r4, 0xC]
	adds r0, r6, 0
	adds r0, 0x40
	strh r1, [r0]
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	lsls r0, 16
	ldrh r1, [r4, 0x10]
	orrs r0, r1
	str r0, [r6, 0x44]
	adds r0, r4, 0
	adds r0, 0x12
	adds r1, r6, 0
	adds r1, 0x38
	bl LoadWordFromTwoHalfwords
	adds r4, 0x16
	adds r1, r6, 0
	adds r1, 0x48
	adds r0, r4, 0
	bl LoadWordFromTwoHalfwords
	adds r0, r5, 0
	bl DestroyTask
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B5BD8: .4byte NamingScreenDummyTask
_080B5BDC: .4byte gTasks
_080B5BE0: .4byte 0x02000000
	thumb_func_end GetNamingScreenParameters

	thumb_func_start NamingScreenDummyTask
NamingScreenDummyTask: @ 80B5BE4
	bx lr
	thumb_func_end NamingScreenDummyTask

	thumb_func_start NamingScreen_TurnOffScreen
NamingScreen_TurnOffScreen: @ 80B5BE8
	push {lr}
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	bl SetHBlankCallback
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	pop {r0}
	bx r0
	thumb_func_end NamingScreen_TurnOffScreen

	thumb_func_start sub_80B5C04
sub_80B5C04: @ 80B5C04
	push {r4,lr}
	ldr r0, _080B5C3C @ =sub_80B5AB8
	bl SetVBlankCallback
	ldr r3, _080B5C40 @ =0x04000208
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _080B5C44 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _080B5C48 @ =REG_DISPSTAT
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5C3C: .4byte sub_80B5AB8
_080B5C40: .4byte 0x04000208
_080B5C44: .4byte 0x04000200
_080B5C48: .4byte REG_DISPSTAT
	thumb_func_end sub_80B5C04

	thumb_func_start NamingScreen_ClearVram
NamingScreen_ClearVram: @ 80B5C4C
	push {r4-r7,lr}
	sub sp, 0x4
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0x80
	lsls r3, 9
	mov r4, sp
	movs r6, 0
	ldr r1, _080B5C98 @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _080B5C9C @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_080B5C6A:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r5
	subs r3, r5
	cmp r3, r5
	bhi _080B5C6A
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5C98: .4byte 0x040000d4
_080B5C9C: .4byte 0x81000800
	thumb_func_end NamingScreen_ClearVram

	thumb_func_start NamingScreen_ClearOam
NamingScreen_ClearOam: @ 80B5CA0
	sub sp, 0x4
	movs r2, 0xE0
	lsls r2, 19
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080B5CBC @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _080B5CC0 @ =0x81000200
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	add sp, 0x4
	bx lr
	.align 2, 0
_080B5CBC: .4byte 0x040000d4
_080B5CC0: .4byte 0x81000200
	thumb_func_end NamingScreen_ClearOam

	thumb_func_start NamingScreen_SetUpVideoRegs
NamingScreen_SetUpVideoRegs: @ 80B5CC4
	push {r4,r5,lr}
	ldr r5, _080B5D2C @ =REG_BG0CNT
	movs r1, 0
	strh r1, [r5]
	ldr r2, _080B5D30 @ =REG_BG1CNT
	strh r1, [r2]
	ldr r3, _080B5D34 @ =REG_BG2CNT
	strh r1, [r3]
	ldr r4, _080B5D38 @ =REG_BG3CNT
	strh r1, [r4]
	ldr r0, _080B5D3C @ =REG_BG0HOFS
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	movs r1, 0xF8
	lsls r1, 5
	adds r0, r1, 0
	strh r0, [r5]
	ldr r1, _080B5D40 @ =0x00001c01
	adds r0, r1, 0
	strh r0, [r2]
	ldr r2, _080B5D44 @ =0x00001d0a
	adds r0, r2, 0
	strh r0, [r3]
	ldr r1, _080B5D48 @ =0x00001e03
	adds r0, r1, 0
	strh r0, [r4]
	ldr r1, _080B5D4C @ =REG_BLDCNT
	movs r2, 0xC8
	lsls r2, 3
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080B5D50 @ =0x0000080c
	adds r0, r2, 0
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B5D2C: .4byte REG_BG0CNT
_080B5D30: .4byte REG_BG1CNT
_080B5D34: .4byte REG_BG2CNT
_080B5D38: .4byte REG_BG3CNT
_080B5D3C: .4byte REG_BG0HOFS
_080B5D40: .4byte 0x00001c01
_080B5D44: .4byte 0x00001d0a
_080B5D48: .4byte 0x00001e03
_080B5D4C: .4byte REG_BLDCNT
_080B5D50: .4byte 0x0000080c
	thumb_func_end NamingScreen_SetUpVideoRegs

	thumb_func_start NamingScreen_Init
NamingScreen_Init: @ 80B5D54
	push {r4-r6,lr}
	bl GetNamingScreenParameters
	ldr r4, _080B5DBC @ =0x02000000
	movs r0, 0
	strb r0, [r4]
	movs r2, 0
	strh r0, [r4, 0x4]
	strh r0, [r4, 0x6]
	movs r1, 0x1
	movs r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x2
	strh r0, [r4, 0xA]
	strb r2, [r4, 0xC]
	strb r1, [r4, 0xD]
	ldr r1, _080B5DC0 @ =gUnknown_083CE398
	ldrb r0, [r4, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	str r0, [r4, 0x34]
	ldrb r1, [r0, 0x4]
	strb r1, [r4, 0xE]
	ldrb r1, [r0, 0x1]
	lsrs r1, 1
	movs r0, 0xE
	subs r0, r1
	strh r0, [r4, 0x2]
	ldr r6, _080B5DC4 @ =gKeyRepeatStartDelay
	ldrh r0, [r6]
	strh r0, [r4, 0x3C]
	adds r5, r4, 0
	adds r5, 0x11
	adds r0, r5, 0
	movs r1, 0xFF
	movs r2, 0x10
	bl memset
	ldr r0, [r4, 0x34]
	ldrb r0, [r0]
	cmp r0, 0
	beq _080B5DB2
	ldr r1, [r4, 0x38]
	adds r0, r5, 0
	bl StringCopy
_080B5DB2:
	movs r0, 0x10
	strh r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B5DBC: .4byte 0x02000000
_080B5DC0: .4byte gUnknown_083CE398
_080B5DC4: .4byte gKeyRepeatStartDelay
	thumb_func_end NamingScreen_Init

	thumb_func_start sub_80B5DC8
sub_80B5DC8: @ 80B5DC8
	push {r4,lr}
	ldr r4, _080B5DE0 @ =gWindowConfig_81E6E88
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5DE0: .4byte gWindowConfig_81E6E88
	thumb_func_end sub_80B5DC8

	thumb_func_start NamingScreen_ResetObjects
NamingScreen_ResetObjects: @ 80B5DE4
	push {lr}
	bl ResetPaletteFade
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	pop {r0}
	bx r0
	thumb_func_end NamingScreen_ResetObjects

	thumb_func_start sub_80B5DFC
sub_80B5DFC: @ 80B5DFC
	push {lr}
	bl sub_80B7558
	bl sub_80B753C
	bl sub_80B7680
	bl sub_80B75C4
	bl sub_80B7794
	bl sub_80B78A8
	bl sub_80B7960
	pop {r0}
	bx r0
	thumb_func_end sub_80B5DFC

	thumb_func_start sub_80B5E20
sub_80B5E20: @ 80B5E20
	push {lr}
	bl sub_80B6774
	bl sub_80B6A80
	bl sub_80B6CA8
	bl sub_80B6D04
	bl sub_80B6E44
	pop {r0}
	bx r0
	thumb_func_end sub_80B5E20

	thumb_func_start sub_80B5E3C
sub_80B5E3C: @ 80B5E3C
	push {lr}
	bl sub_80B61D8
	bl sub_80B6438
	bl sub_80B5E50
	pop {r0}
	bx r0
	thumb_func_end sub_80B5E3C

	thumb_func_start sub_80B5E50
sub_80B5E50: @ 80B5E50
	push {r4,lr}
	ldr r4, _080B5E6C @ =sub_80B5E70
	adds r0, r4, 0
	movs r1, 0x2
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5E6C: .4byte sub_80B5E70
	thumb_func_end sub_80B5E50

	thumb_func_start sub_80B5E70
sub_80B5E70: @ 80B5E70
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r7, _080B5E9C @ =gUnknown_083CE218
	lsls r1, r0, 2
	adds r1, r0
	lsls r4, r1, 3
	ldr r6, _080B5EA0 @ =0x02000000
	ldr r5, _080B5EA4 @ =gTasks
_080B5E82:
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r7
	ldr r1, [r0]
	adds r0, r4, r5
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080B5E82
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5E9C: .4byte gUnknown_083CE218
_080B5EA0: .4byte 0x02000000
_080B5EA4: .4byte gTasks
	thumb_func_end sub_80B5E70

	thumb_func_start sub_80B5EA8
sub_80B5EA8: @ 80B5EA8
	push {lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, _080B5ECC @ =0x02000000
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0
	add sp, 0x4
	pop {r1}
	bx r1
	.align 2, 0
_080B5ECC: .4byte 0x02000000
	thumb_func_end sub_80B5EA8

	thumb_func_start sub_80B5ED0
sub_80B5ED0: @ 80B5ED0
	push {lr}
	ldr r0, _080B5EF8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080B5EF2
	movs r0, 0x1
	bl sub_80B6210
	movs r0, 0x1
	bl sub_80B68D8
	ldr r1, _080B5EFC @ =0x02000000
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080B5EF2:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080B5EF8: .4byte gPaletteFade
_080B5EFC: .4byte 0x02000000
	thumb_func_end sub_80B5ED0

	thumb_func_start sub_80B5F00
sub_80B5F00: @ 80B5F00
	push {lr}
	bl sub_80B60B8
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80B5F00

	thumb_func_start sub_80B5F10
sub_80B5F10: @ 80B5F10
	push {lr}
	bl sub_80B6938
	lsls r0, 24
	cmp r0, 0
	beq _080B5F2C
	movs r0, 0x1
	bl sub_80B6210
	bl sub_80B6878
	ldr r1, _080B5F34 @ =0x02000000
	movs r0, 0x2
	strb r0, [r1]
_080B5F2C:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080B5F34: .4byte 0x02000000
	thumb_func_end sub_80B5F10

	thumb_func_start sub_80B5F38
sub_80B5F38: @ 80B5F38
	push {lr}
	movs r0, 0
	bl sub_80B6210
	bl sub_80B6B14
	bl sub_80B65F0
	movs r0, 0x1
	bl sub_80B6888
	movs r0, 0
	movs r1, 0
	movs r2, 0x1
	bl sub_80B6460
	movs r0, 0x6
	bl PlaySE
	ldr r1, _080B5F6C @ =0x02000000
	movs r0, 0x5
	strb r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080B5F6C: .4byte 0x02000000
	thumb_func_end sub_80B5F38

	thumb_func_start sub_80B5F70
sub_80B5F70: @ 80B5F70
	push {r4,r5,lr}
	sub sp, 0x4
	bl sub_80B6610
	lsls r0, 24
	cmp r0, 0
	beq _080B5FDC
	ldr r4, _080B5FE8 @ =0x02000000
	movs r0, 0x2
	strb r0, [r4]
	ldrb r0, [r4, 0xE]
	adds r0, 0x1
	strb r0, [r4, 0xE]
	ldrb r0, [r4, 0xE]
	movs r1, 0x3
	bl __umodsi3
	strb r0, [r4, 0xE]
	bl sub_80B7614
	bl sub_80B77F8
	movs r0, 0x1
	bl sub_80B6210
	mov r5, sp
	adds r5, 0x2
	mov r0, sp
	adds r1, r5, 0
	bl sub_80B6858
	ldrb r0, [r4, 0xE]
	cmp r0, 0x2
	bne _080B5FC8
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x6
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080B5FC8
	mov r1, sp
	movs r0, 0x5
	strh r0, [r1]
_080B5FC8:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl sub_80B680C
	movs r0, 0
	bl sub_80B6888
_080B5FDC:
	movs r0, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B5FE8: .4byte 0x02000000
	thumb_func_end sub_80B5F70

	thumb_func_start pokemon_store
pokemon_store: @ 80B5FEC
	push {r4,lr}
	bl sub_80B74B0
	movs r0, 0
	bl sub_80B6210
	movs r0, 0
	bl sub_80B68D8
	movs r0, 0x3
	movs r1, 0
	movs r2, 0x1
	bl sub_80B6460
	ldr r0, _080B6030 @ =gKeyRepeatStartDelay
	ldr r4, _080B6034 @ =0x02000000
	ldrh r1, [r4, 0x3C]
	strh r1, [r0]
	ldrb r0, [r4, 0x1]
	cmp r0, 0x2
	bne _080B6038
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bls _080B6038
	bl sub_80B74FC
	movs r0, 0x7
	strb r0, [r4]
	movs r0, 0
	b _080B6040
	.align 2, 0
_080B6030: .4byte gKeyRepeatStartDelay
_080B6034: .4byte 0x02000000
_080B6038:
	ldr r1, _080B6048 @ =0x02000000
	movs r0, 0x8
	strb r0, [r1]
	movs r0, 0x1
_080B6040:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B6048: .4byte 0x02000000
	thumb_func_end pokemon_store

	thumb_func_start sub_80B604C
sub_80B604C: @ 80B604C
	push {lr}
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _080B6060
	ldr r1, _080B6068 @ =0x02000000
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080B6060:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080B6068: .4byte 0x02000000
	thumb_func_end sub_80B604C

	thumb_func_start sub_80B606C
sub_80B606C: @ 80B606C
	push {lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _080B6090 @ =0x02000000
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0
	add sp, 0x4
	pop {r1}
	bx r1
	.align 2, 0
_080B6090: .4byte 0x02000000
	thumb_func_end sub_80B606C

	thumb_func_start sub_80B6094
sub_80B6094: @ 80B6094
	push {lr}
	ldr r0, _080B60B0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080B60AA
	ldr r0, _080B60B4 @ =0x02000000
	ldr r0, [r0, 0x48]
	bl SetMainCallback2
_080B60AA:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080B60B0: .4byte gPaletteFade
_080B60B4: .4byte 0x02000000
	thumb_func_end sub_80B6094

	thumb_func_start sub_80B60B8
sub_80B60B8: @ 80B60B8
	push {r4,r5,lr}
	bl sub_80B61EC
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl sub_80B6958
	lsls r0, 24
	lsrs r0, 24
	cmp r4, 0x8
	bne _080B60D6
	bl sub_80B61C8
	b _080B60F2
_080B60D6:
	cmp r4, 0x6
	bne _080B60E0
	bl sub_80B6FBC
	b _080B6100
_080B60E0:
	cmp r5, 0x7
	beq _080B60FC
	ldr r1, _080B60F8 @ =gUnknown_083CE240
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
_080B60F2:
	lsls r0, 24
	lsrs r0, 24
	b _080B6102
	.align 2, 0
_080B60F8: .4byte gUnknown_083CE240
_080B60FC:
	bl sub_80B7090
_080B6100:
	movs r0, 0
_080B6102:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80B60B8

	thumb_func_start sub_80B6108
sub_80B6108: @ 80B6108
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl sub_80B6460
	cmp r4, 0x5
	bne _080B613C
	bl sub_80B7004
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80B6914
	cmp r4, 0
	beq _080B613C
	movs r0, 0
	bl sub_80B6210
	ldr r1, _080B6144 @ =0x02000000
	movs r0, 0x3
	strb r0, [r1]
_080B613C:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B6144: .4byte 0x02000000
	thumb_func_end sub_80B6108

	thumb_func_start sub_80B6148
sub_80B6148: @ 80B6148
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_80B6460
	cmp r4, 0x5
	beq _080B6162
	movs r0, 0
	b _080B616A
_080B6162:
	bl sub_80B61C8
	lsls r0, 24
	lsrs r0, 24
_080B616A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80B6148

	thumb_func_start sub_80B6170
sub_80B6170: @ 80B6170
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl sub_80B6460
	cmp r4, 0x5
	bne _080B618A
	bl sub_80B6FBC
_080B618A:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80B6170

	thumb_func_start sub_80B6194
sub_80B6194: @ 80B6194
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0
	bl sub_80B6460
	cmp r4, 0x5
	beq _080B61AE
	movs r0, 0
	b _080B61BC
_080B61AE:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080B61C4 @ =0x02000000
	movs r0, 0x6
	strb r0, [r1]
	movs r0, 0x1
_080B61BC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B61C4: .4byte 0x02000000
	thumb_func_end sub_80B6194

	thumb_func_start sub_80B61C8
sub_80B61C8: @ 80B61C8
	ldr r1, _080B61D4 @ =0x02000000
	movs r0, 0x4
	strb r0, [r1]
	movs r0, 0x1
	bx lr
	.align 2, 0
_080B61D4: .4byte 0x02000000
	thumb_func_end sub_80B61C8

	thumb_func_start sub_80B61D8
sub_80B61D8: @ 80B61D8
	push {lr}
	ldr r0, _080B61E8 @ =sub_80B623C
	movs r1, 0x1
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080B61E8: .4byte sub_80B623C
	thumb_func_end sub_80B61D8

	thumb_func_start sub_80B61EC
sub_80B61EC: @ 80B61EC
	push {lr}
	ldr r0, _080B6208 @ =sub_80B623C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B620C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0xA]
	pop {r1}
	bx r1
	.align 2, 0
_080B6208: .4byte sub_80B623C
_080B620C: .4byte gTasks
	thumb_func_end sub_80B61EC

	thumb_func_start sub_80B6210
sub_80B6210: @ 80B6210
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080B6234 @ =sub_80B623C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B6238 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B6234: .4byte sub_80B623C
_080B6238: .4byte gTasks
	thumb_func_end sub_80B6210

	thumb_func_start sub_80B623C
sub_80B623C: @ 80B623C
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _080B6264 @ =gUnknown_083CE250
	ldr r2, _080B6268 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080B6264: .4byte gUnknown_083CE250
_080B6268: .4byte gTasks
	thumb_func_end sub_80B623C

	thumb_func_start sub_80B626C
sub_80B626C: @ 80B626C
	movs r1, 0
	strh r1, [r0, 0xA]
	bx lr
	thumb_func_end sub_80B626C

	thumb_func_start sub_80B6274
sub_80B6274: @ 80B6274
	push {lr}
	adds r2, r0, 0
	movs r0, 0
	strh r0, [r2, 0xA]
	ldr r0, _080B6290 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080B6294
	movs r0, 0x5
	strh r0, [r2, 0xA]
	b _080B62C8
	.align 2, 0
_080B6290: .4byte gMain
_080B6294:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080B62A2
	movs r0, 0x6
	strh r0, [r2, 0xA]
	b _080B62C8
_080B62A2:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080B62B0
	movs r0, 0x8
	strh r0, [r2, 0xA]
	b _080B62C8
_080B62B0:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080B62C2
	movs r0, 0x9
	strh r0, [r2, 0xA]
	bl sub_80B6878
	b _080B62C8
_080B62C2:
	adds r0, r2, 0
	bl sub_80B62CC
_080B62C8:
	pop {r0}
	bx r0
	thumb_func_end sub_80B6274

	thumb_func_start sub_80B62CC
sub_80B62CC: @ 80B62CC
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl sub_80B6858
	ldr r0, _080B6374 @ =gMain
	ldrh r2, [r0, 0x30]
	movs r0, 0x40
	ands r0, r2
	lsls r0, 16
	lsrs r0, 16
	negs r0, r0
	lsrs r1, r0, 31
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _080B62F8
	movs r1, 0x2
_080B62F8:
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	beq _080B6302
	movs r1, 0x3
_080B6302:
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	beq _080B630C
	movs r1, 0x4
_080B630C:
	mov r0, sp
	ldrh r6, [r0]
	mov r2, sp
	ldr r0, _080B6378 @ =gUnknown_083CE258
	lsls r1, 1
	adds r0, r1, r0
	ldrh r3, [r0]
	adds r0, r6, r3
	strh r0, [r2]
	ldr r0, _080B637C @ =gUnknown_083CE262
	adds r1, r0
	ldrh r0, [r1]
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r4]
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bge _080B633A
	mov r1, sp
	movs r0, 0x8
	strh r0, [r1]
_080B633A:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x8
	ble _080B634A
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
_080B634A:
	lsls r0, r3, 16
	asrs r1, r0, 16
	cmp r1, 0
	beq _080B63CA
	ldr r0, _080B6380 @ =0x02000000
	ldrb r0, [r0, 0xE]
	cmp r0, 0x2
	bne _080B638A
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x6
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080B638A
	cmp r1, 0
	ble _080B6384
	mov r1, sp
	movs r0, 0x8
	b _080B6388
	.align 2, 0
_080B6374: .4byte gMain
_080B6378: .4byte gUnknown_083CE258
_080B637C: .4byte gUnknown_083CE262
_080B6380: .4byte 0x02000000
_080B6384:
	mov r1, sp
	movs r0, 0x5
_080B6388:
	strh r0, [r1]
_080B638A:
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0x8
	bne _080B63AC
	ldrh r0, [r4]
	strh r0, [r5, 0xC]
	ldr r1, _080B63A8 @ =gUnknown_083CE26C
	movs r2, 0
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	b _080B63C8
	.align 2, 0
_080B63A8: .4byte gUnknown_083CE26C
_080B63AC:
	cmp r6, 0x8
	bne _080B63CA
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080B63BC
	ldrh r0, [r5, 0xC]
	b _080B63C8
_080B63BC:
	ldr r0, _080B63FC @ =gUnknown_083CE274
	movs r2, 0
	ldrsh r1, [r4, r2]
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
_080B63C8:
	strh r0, [r4]
_080B63CA:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x8
	bne _080B6408
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bge _080B63E0
	movs r0, 0x2
	strh r0, [r4]
_080B63E0:
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x2
	ble _080B63EC
	movs r0, 0
	strh r0, [r4]
_080B63EC:
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080B6400
	movs r0, 0x1
	strh r0, [r5, 0xC]
	b _080B6420
	.align 2, 0
_080B63FC: .4byte gUnknown_083CE274
_080B6400:
	cmp r0, 0x2
	bne _080B6420
	strh r0, [r5, 0xC]
	b _080B6420
_080B6408:
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _080B6414
	movs r0, 0x3
	strh r0, [r4]
_080B6414:
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0x3
	ble _080B6420
	movs r0, 0
	strh r0, [r4]
_080B6420:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl sub_80B680C
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80B62CC

	thumb_func_start sub_80B6438
sub_80B6438: @ 80B6438
	push {lr}
	ldr r0, _080B6458 @ =sub_80B64D4
	movs r1, 0x3
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B645C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x3
	strh r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_080B6458: .4byte sub_80B64D4
_080B645C: .4byte gTasks
	thumb_func_end sub_80B6438

	thumb_func_start sub_80B6460
sub_80B6460: @ 80B6460
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r0, _080B6498 @ =sub_80B64D4
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080B649C @ =gTasks
	adds r4, r1, r0
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r5, r0
	bne _080B64A0
	cmp r6, 0
	bne _080B64A0
	strh r7, [r4, 0xA]
	movs r0, 0x1
	strh r0, [r4, 0xC]
	b _080B64CC
	.align 2, 0
_080B6498: .4byte sub_80B64D4
_080B649C: .4byte gTasks
_080B64A0:
	cmp r5, 0x3
	bne _080B64B0
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080B64B0
	cmp r6, 0
	beq _080B64CC
_080B64B0:
	ldrh r1, [r4, 0x8]
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	cmp r0, 0x3
	beq _080B64C2
	lsls r0, r1, 24
	lsrs r0, 24
	bl sub_80B65AC
_080B64C2:
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r7, 0
	bl sub_80B65D4
_080B64CC:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B6460

	thumb_func_start sub_80B64D4
sub_80B64D4: @ 80B64D4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080B6548 @ =gTasks
	adds r4, r1, r0
	ldrh r1, [r4, 0x8]
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	cmp r0, 0x3
	beq _080B6540
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080B6540
	lsls r0, r1, 24
	lsrs r0, 24
	bl sub_80B654C
	lsls r0, 16
	lsrs r0, 16
	ldrb r3, [r4, 0xE]
	adds r1, r3, 0
	adds r2, r3, 0
	bl MultiplyInvertedPaletteRGBComponents
	ldrh r1, [r4, 0x12]
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080B6520
	subs r0, r1, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	cmp r0, 0
	bne _080B6540
_080B6520:
	movs r0, 0x2
	strh r0, [r4, 0x12]
	ldrh r1, [r4, 0x10]
	ldrh r2, [r4, 0xE]
	adds r0, r1, r2
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	beq _080B653C
	cmp r0, 0
	bne _080B6540
	ldrh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
_080B653C:
	negs r0, r1
	strh r0, [r4, 0x10]
_080B6540:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B6548: .4byte gTasks
	thumb_func_end sub_80B64D4

	thumb_func_start sub_80B654C
sub_80B654C: @ 80B654C
	push {r4-r6,lr}
	sub sp, 0x10
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x4
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	movs r1, 0x87
	lsls r1, 1
	adds r5, r1, 0
	adds r0, r5
	add r6, sp, 0x8
	strh r0, [r6]
	movs r0, 0x6
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	movs r1, 0x86
	lsls r1, 1
	adds r0, r1
	mov r1, sp
	adds r1, 0xA
	strh r0, [r1]
	movs r0, 0x6
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	adds r0, r5
	add r1, sp, 0xC
	strh r0, [r1]
	mov r0, sp
	adds r1, r6, 0
	movs r2, 0x6
	bl memcpy
	lsls r4, 1
	mov r1, sp
	adds r0, r1, r4
	ldrh r0, [r0]
	add sp, 0x10
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80B654C

	thumb_func_start sub_80B65AC
sub_80B65AC: @ 80B65AC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80B654C
	lsls r0, 16
	ldr r2, _080B65CC @ =gPlttBufferFaded
	lsrs r0, 15
	adds r2, r0, r2
	ldr r1, _080B65D0 @ =gPlttBufferUnfaded
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080B65CC: .4byte gPlttBufferFaded
_080B65D0: .4byte gPlttBufferUnfaded
	thumb_func_end sub_80B65AC

	thumb_func_start sub_80B65D4
sub_80B65D4: @ 80B65D4
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	movs r3, 0
	strh r1, [r0, 0x8]
	strh r2, [r0, 0xA]
	movs r2, 0x1
	strh r2, [r0, 0xC]
	movs r1, 0xF
	strh r1, [r0, 0xE]
	strh r2, [r0, 0x10]
	strh r3, [r0, 0x12]
	bx lr
	thumb_func_end sub_80B65D4

	thumb_func_start sub_80B65F0
sub_80B65F0: @ 80B65F0
	push {r4,lr}
	ldr r4, _080B660C @ =sub_80B6630
	adds r0, r4, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B660C: .4byte sub_80B6630
	thumb_func_end sub_80B65F0

	thumb_func_start sub_80B6610
sub_80B6610: @ 80B6610
	push {lr}
	ldr r0, _080B6624 @ =sub_80B6630
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080B6628
	movs r0, 0
	b _080B662A
	.align 2, 0
_080B6624: .4byte sub_80B6630
_080B6628:
	movs r0, 0x1
_080B662A:
	pop {r1}
	bx r1
	thumb_func_end sub_80B6610

	thumb_func_start sub_80B6630
sub_80B6630: @ 80B6630
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080B6660 @ =gUnknown_083CE27C
	ldr r2, _080B6664 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080B6642:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080B6642
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6660: .4byte gUnknown_083CE27C
_080B6664: .4byte gTasks
	thumb_func_end sub_80B6630

	thumb_func_start sub_80B6668
sub_80B6668: @ 80B6668
	ldr r2, _080B667C @ =0x02000000
	movs r1, 0
	strh r1, [r2, 0x4]
	strh r1, [r2, 0x6]
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	movs r0, 0
	bx lr
	.align 2, 0
_080B667C: .4byte 0x02000000
	thumb_func_end sub_80B6668

	thumb_func_start sub_80B6680
sub_80B6680: @ 80B6680
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r0, _080B66E4 @ =gUnknown_083CE28C
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldrh r0, [r4, 0xA]
	adds r0, 0x4
	strh r0, [r4, 0xA]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r1, 0x28
	bl Sin
	ldr r5, _080B66E8 @ =0x02000000
	ldrb r1, [r5, 0xC]
	lsls r1, 2
	add r1, sp
	ldr r1, [r1]
	strh r0, [r1]
	ldrh r0, [r4, 0xA]
	adds r0, 0x80
	movs r1, 0xFF
	ands r0, r1
	movs r1, 0x28
	bl Sin
	ldrb r1, [r5, 0xD]
	lsls r1, 2
	add r1, sp
	ldr r1, [r1]
	strh r0, [r1]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x3F
	ble _080B66DA
	ldrb r1, [r5, 0x8]
	ldrh r0, [r5, 0xA]
	strh r0, [r5, 0x8]
	strh r1, [r5, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080B66DA:
	movs r0, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B66E4: .4byte gUnknown_083CE28C
_080B66E8: .4byte 0x02000000
	thumb_func_end sub_80B6680

	thumb_func_start sub_80B66EC
sub_80B66EC: @ 80B66EC
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r0, _080B6750 @ =gUnknown_083CE28C
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldrh r0, [r4, 0xA]
	adds r0, 0x4
	strh r0, [r4, 0xA]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r1, 0x28
	bl Sin
	ldr r5, _080B6754 @ =0x02000000
	ldrb r1, [r5, 0xC]
	lsls r1, 2
	add r1, sp
	ldr r1, [r1]
	strh r0, [r1]
	ldrh r0, [r4, 0xA]
	adds r0, 0x80
	movs r1, 0xFF
	ands r0, r1
	movs r1, 0x28
	bl Sin
	ldrb r1, [r5, 0xD]
	lsls r1, 2
	add r1, sp
	ldr r1, [r1]
	strh r0, [r1]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	ble _080B6746
	ldrb r1, [r5, 0xC]
	ldrb r0, [r5, 0xD]
	strb r0, [r5, 0xC]
	strb r1, [r5, 0xD]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080B6746:
	movs r0, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B6750: .4byte gUnknown_083CE28C
_080B6754: .4byte 0x02000000
	thumb_func_end sub_80B66EC

	thumb_func_start sub_80B6758
sub_80B6758: @ 80B6758
	push {lr}
	ldr r0, _080B6770 @ =sub_80B6630
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080B6770: .4byte sub_80B6630
	thumb_func_end sub_80B6758

	thumb_func_start sub_80B6774
sub_80B6774: @ 80B6774
	push {r4,r5,lr}
	ldr r0, _080B67E0 @ =gSpriteTemplate_83CE640
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	ldr r4, _080B67E4 @ =0x02000000
	strb r0, [r4, 0xF]
	ldr r5, _080B67E8 @ =gSprites
	ldrb r0, [r4, 0xF]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r3, [r1, 0x5]
	movs r2, 0xD
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r1, [r4, 0xF]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0, 0x1]
	ands r2, r1
	orrs r2, r3
	strb r2, [r0, 0x1]
	ldrb r1, [r4, 0xF]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x1
	strh r1, [r0, 0x3A]
	ldrb r1, [r4, 0xF]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x2
	strh r1, [r0, 0x3A]
	movs r0, 0
	movs r1, 0
	bl sub_80B680C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B67E0: .4byte gSpriteTemplate_83CE640
_080B67E4: .4byte 0x02000000
_080B67E8: .4byte gSprites
	thumb_func_end sub_80B6774

	thumb_func_start sub_80B67EC
sub_80B67EC: @ 80B67EC
	ldr r3, _080B6804 @ =gUnknown_083CE294
	lsls r0, 16
	asrs r0, 16
	ldr r1, _080B6808 @ =0x02000000
	ldrb r2, [r1, 0xE]
	lsls r1, r2, 3
	adds r1, r2
	adds r0, r1
	adds r0, r3
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080B6804: .4byte gUnknown_083CE294
_080B6808: .4byte 0x02000000
	thumb_func_end sub_80B67EC

	thumb_func_start sub_80B680C
sub_80B680C: @ 80B680C
	push {r4-r6,lr}
	adds r5, r1, 0
	lsls r0, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r1, _080B6850 @ =0x02000000
	ldrb r1, [r1, 0xF]
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	ldr r1, _080B6854 @ =gSprites
	adds r4, r1
	lsrs r6, r0, 16
	asrs r0, 16
	bl sub_80B67EC
	lsls r0, 24
	lsrs r0, 21
	adds r0, 0x1B
	strh r0, [r4, 0x20]
	lsls r0, r5, 16
	asrs r0, 12
	adds r0, 0x50
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x2E]
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x30]
	strh r0, [r4, 0x34]
	strh r6, [r4, 0x2E]
	strh r5, [r4, 0x30]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B6850: .4byte 0x02000000
_080B6854: .4byte gSprites
	thumb_func_end sub_80B680C

	thumb_func_start sub_80B6858
sub_80B6858: @ 80B6858
	ldr r2, _080B6870 @ =0x02000000
	ldrb r3, [r2, 0xF]
	lsls r2, r3, 4
	adds r2, r3
	lsls r2, 2
	ldr r3, _080B6874 @ =gSprites
	adds r2, r3
	ldrh r3, [r2, 0x2E]
	strh r3, [r0]
	ldrh r0, [r2, 0x30]
	strh r0, [r1]
	bx lr
	.align 2, 0
_080B6870: .4byte 0x02000000
_080B6874: .4byte gSprites
	thumb_func_end sub_80B6858

	thumb_func_start sub_80B6878
sub_80B6878: @ 80B6878
	push {lr}
	movs r0, 0x8
	movs r1, 0x2
	bl sub_80B680C
	pop {r0}
	bx r0
	thumb_func_end sub_80B6878

	thumb_func_start sub_80B6888
sub_80B6888: @ 80B6888
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080B68CC @ =gSprites
	ldr r4, _080B68D0 @ =0x02000000
	ldrb r1, [r4, 0xF]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r5
	ldrh r3, [r2, 0x36]
	ldr r1, _080B68D4 @ =0xffffff00
	ands r1, r3
	strh r1, [r2, 0x36]
	ldrb r2, [r4, 0xF]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	ldrh r2, [r1, 0x36]
	orrs r0, r2
	strh r0, [r1, 0x36]
	ldrb r1, [r4, 0xF]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0
	bl StartSpriteAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B68CC: .4byte gSprites
_080B68D0: .4byte 0x02000000
_080B68D4: .4byte 0xffffff00
	thumb_func_end sub_80B6888

	thumb_func_start sub_80B68D8
sub_80B68D8: @ 80B68D8
	push {r4,r5,lr}
	lsls r0, 24
	ldr r5, _080B690C @ =gSprites
	ldr r4, _080B6910 @ =0x02000000
	ldrb r1, [r4, 0xF]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r5
	ldrh r3, [r2, 0x36]
	movs r1, 0xFF
	ands r1, r3
	strh r1, [r2, 0x36]
	ldrb r2, [r4, 0xF]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	lsrs r0, 16
	ldrh r2, [r1, 0x36]
	orrs r0, r2
	strh r0, [r1, 0x36]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B690C: .4byte gSprites
_080B6910: .4byte 0x02000000
	thumb_func_end sub_80B68D8

	thumb_func_start sub_80B6914
sub_80B6914: @ 80B6914
	push {lr}
	ldr r0, _080B6930 @ =0x02000000
	ldrb r1, [r0, 0xF]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B6934 @ =gSprites
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_080B6930: .4byte 0x02000000
_080B6934: .4byte gSprites
	thumb_func_end sub_80B6914

	thumb_func_start sub_80B6938
sub_80B6938: @ 80B6938
	ldr r2, _080B6950 @ =gSprites
	ldr r0, _080B6954 @ =0x02000000
	ldrb r1, [r0, 0xF]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	lsrs r0, 31
	bx lr
	.align 2, 0
_080B6950: .4byte gSprites
_080B6954: .4byte 0x02000000
	thumb_func_end sub_80B6938

	thumb_func_start sub_80B6958
sub_80B6958: @ 80B6958
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r1, _080B6988 @ =gUnknown_083CE2AF
	mov r0, sp
	movs r2, 0x3
	bl memcpy
	add r4, sp, 0x4
	mov r5, sp
	adds r5, 0x6
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80B6858
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	ble _080B698C
	movs r1, 0
	ldrsh r0, [r5, r1]
	add r0, sp
	ldrb r0, [r0]
	b _080B698E
	.align 2, 0
_080B6988: .4byte gUnknown_083CE2AF
_080B698C:
	movs r0, 0
_080B698E:
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80B6958

	thumb_func_start sub_80B6998
sub_80B6998: @ 80B6998
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080B69B0
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
_080B69B0:
	ldrh r1, [r4, 0x36]
	movs r0, 0xFF
	ands r0, r1
	adds r3, r4, 0
	adds r3, 0x3E
	movs r1, 0x1
	ands r0, r1
	lsls r0, 2
	ldrb r1, [r3]
	movs r2, 0x5
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r3]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	bne _080B69DA
	movs r0, 0x4
	orrs r2, r0
	strb r2, [r3]
_080B69DA:
	ldrb r1, [r3]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _080B6A0A
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080B6A0A
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080B6A0A
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r1, r0
	beq _080B6A16
_080B6A0A:
	movs r0, 0
	strh r0, [r4, 0x38]
	movs r0, 0x1
	strh r0, [r4, 0x3A]
	movs r0, 0x2
	strh r0, [r4, 0x3C]
_080B6A16:
	ldrh r0, [r4, 0x3C]
	subs r0, 0x1
	strh r0, [r4, 0x3C]
	lsls r0, 16
	cmp r0, 0
	bne _080B6A3E
	ldrh r1, [r4, 0x3A]
	ldrh r2, [r4, 0x38]
	adds r0, r1, r2
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	beq _080B6A36
	cmp r0, 0
	bne _080B6A3A
_080B6A36:
	negs r0, r1
	strh r0, [r4, 0x3A]
_080B6A3A:
	movs r0, 0x2
	strh r0, [r4, 0x3C]
_080B6A3E:
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080B6A74
	ldrh r4, [r4, 0x38]
	lsls r5, r4, 24
	lsrs r5, 24
	lsls r4, 16
	asrs r4, 17
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	ldr r2, _080B6A7C @ =0x01010000
	adds r0, r2
	lsrs r0, 16
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r5, 0
	bl MultiplyInvertedPaletteRGBComponents
_080B6A74:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6A7C: .4byte 0x01010000
	thumb_func_end sub_80B6998

	thumb_func_start sub_80B6A80
sub_80B6A80: @ 80B6A80
	push {r4,r5,lr}
	ldr r0, _080B6AF8 @ =gSpriteTemplate_83CE5C8
	movs r1, 0xCC
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B6AFC @ =0x02000000
	strb r0, [r1, 0x10]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r5, _080B6B00 @ =gSprites
	adds r4, r5
	ldr r1, _080B6B04 @ =gUnknown_083CE558
	adds r0, r4, 0
	bl SetSubspriteTables
	ldr r0, _080B6B08 @ =gSpriteTemplate_83CE5F8
	movs r1, 0xCC
	movs r2, 0x4C
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x3A]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	ldr r1, _080B6B0C @ =gUnknown_083CE560
	adds r0, r2, 0
	bl SetSubspriteTables
	ldr r0, _080B6B10 @ =gSpriteTemplate_83CE5E0
	movs r1, 0xCC
	movs r2, 0x4B
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r3, [r1, 0x5]
	movs r2, 0xD
	negs r2, r2
	ands r2, r3
	movs r3, 0x4
	orrs r2, r3
	strb r2, [r1, 0x5]
	strh r0, [r4, 0x3C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6AF8: .4byte gSpriteTemplate_83CE5C8
_080B6AFC: .4byte 0x02000000
_080B6B00: .4byte gSprites
_080B6B04: .4byte gUnknown_083CE558
_080B6B08: .4byte gSpriteTemplate_83CE5F8
_080B6B0C: .4byte gUnknown_083CE560
_080B6B10: .4byte gSpriteTemplate_83CE5E0
	thumb_func_end sub_80B6A80

	thumb_func_start sub_80B6B14
sub_80B6B14: @ 80B6B14
	ldr r2, _080B6B2C @ =0x02000000
	ldrb r1, [r2, 0x10]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B6B30 @ =gSprites
	adds r0, r1
	movs r1, 0x2
	strh r1, [r0, 0x2E]
	ldrb r1, [r2, 0xE]
	strh r1, [r0, 0x30]
	bx lr
	.align 2, 0
_080B6B2C: .4byte 0x02000000
_080B6B30: .4byte gSprites
	thumb_func_end sub_80B6B14

	thumb_func_start sub_80B6B34
sub_80B6B34: @ 80B6B34
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080B6B58 @ =gUnknown_083CE2B4
_080B6B3A:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080B6B3A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6B58: .4byte gUnknown_083CE2B4
	thumb_func_end sub_80B6B34

	thumb_func_start sub_80B6B5C
sub_80B6B5C: @ 80B6B5C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r3, _080B6B90 @ =gSprites
	adds r1, r3
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldr r0, _080B6B94 @ =0x02000000
	ldrb r0, [r0, 0xE]
	bl sub_80B6C48
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B6B90: .4byte gSprites
_080B6B94: .4byte 0x02000000
	thumb_func_end sub_80B6B5C

	thumb_func_start sub_80B6B98
sub_80B6B98: @ 80B6B98
	movs r0, 0
	bx lr
	thumb_func_end sub_80B6B98

	thumb_func_start sub_80B6B9C
sub_80B6B9C: @ 80B6B9C
	push {r4,r5,lr}
	adds r3, r0, 0
	movs r0, 0x3A
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r2, _080B6C00 @ =gSprites
	adds r4, r0, r2
	movs r0, 0x3C
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r5, r0, r2
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080B6BF8
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	ldr r0, _080B6C04 @ =0x0000fffc
	strh r0, [r4, 0x26]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r3, 0x30]
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	movs r1, 0x3
	bl __modsi3
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_80B6C48
_080B6BF8:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B6C00: .4byte gSprites
_080B6C04: .4byte 0x0000fffc
	thumb_func_end sub_80B6B9C

	thumb_func_start sub_80B6C08
sub_80B6C08: @ 80B6C08
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B6C44 @ =gSprites
	adds r2, r0, r1
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldrh r0, [r2, 0x26]
	adds r0, 0x1
	strh r0, [r2, 0x26]
	lsls r0, 16
	cmp r0, 0
	blt _080B6C3C
	movs r0, 0
	strh r0, [r2, 0x26]
	movs r0, 0x1
	strh r0, [r4, 0x2E]
_080B6C3C:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B6C44: .4byte gSprites
	thumb_func_end sub_80B6C08

	thumb_func_start sub_80B6C48
sub_80B6C48: @ 80B6C48
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	adds r6, r1, 0
	mov r8, r2
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _080B6CA0 @ =gUnknown_083CE2C4
	lsls r4, r5, 1
	adds r0, r4, r0
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, 4
	mov r1, r8
	ldrb r2, [r1, 0x5]
	movs r1, 0xF
	ands r1, r2
	orrs r1, r0
	mov r0, r8
	strb r1, [r0, 0x5]
	ldr r0, _080B6CA4 @ =gUnknown_083CE2CA
	adds r4, r0
	ldrh r0, [r4]
	bl GetSpriteTileStartByTag
	adds r1, r6, 0
	adds r1, 0x40
	strh r0, [r1]
	adds r6, 0x42
	movs r1, 0x3F
	ands r1, r5
	ldrb r2, [r6]
	movs r0, 0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B6CA0: .4byte gUnknown_083CE2C4
_080B6CA4: .4byte gUnknown_083CE2CA
	thumb_func_end sub_80B6C48

	thumb_func_start sub_80B6CA8
sub_80B6CA8: @ 80B6CA8
	push {r4,r5,lr}
	ldr r0, _080B6CF4 @ =gSpriteTemplate_83CE610
	movs r1, 0xCC
	movs r2, 0x6C
	movs r3, 0
	bl CreateSprite
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080B6CF8 @ =gSprites
	adds r0, r4
	ldr r5, _080B6CFC @ =gUnknown_083CE578
	adds r1, r5, 0
	bl SetSubspriteTables
	ldr r0, _080B6D00 @ =gSpriteTemplate_83CE628
	movs r1, 0xCC
	movs r2, 0x84
	movs r3, 0
	bl CreateSprite
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r1, r5, 0
	bl SetSubspriteTables
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6CF4: .4byte gSpriteTemplate_83CE610
_080B6CF8: .4byte gSprites
_080B6CFC: .4byte gUnknown_083CE578
_080B6D00: .4byte gSpriteTemplate_83CE628
	thumb_func_end sub_80B6CA8

	thumb_func_start sub_80B6D04
sub_80B6D04: @ 80B6D04
	push {r4-r6,lr}
	ldr r4, _080B6D8C @ =0x02000000
	ldrh r1, [r4, 0x2]
	subs r1, 0x1
	lsls r1, 3
	adds r1, 0x4
	ldr r0, _080B6D90 @ =gSpriteTemplate_83CE658
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x28
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r3, _080B6D94 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldrh r0, [r4, 0x2]
	lsls r0, 3
	adds r0, 0x4
	lsls r0, 16
	lsrs r1, r0, 16
	movs r5, 0
	ldr r0, [r4, 0x34]
	ldrb r0, [r0, 0x1]
	cmp r5, r0
	bcs _080B6D86
	adds r6, r3, 0
_080B6D4A:
	lsls r4, r1, 16
	asrs r4, 16
	ldr r0, _080B6D98 @ =gSpriteTemplate_83CE670
	adds r1, r4, 0
	movs r2, 0x2C
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	strh r5, [r0, 0x2E]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x8
	lsls r4, 16
	lsrs r1, r4, 16
	ldr r0, _080B6D8C @ =0x02000000
	ldr r0, [r0, 0x34]
	ldrb r0, [r0, 0x1]
	cmp r5, r0
	bcc _080B6D4A
_080B6D86:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B6D8C: .4byte 0x02000000
_080B6D90: .4byte gSpriteTemplate_83CE658
_080B6D94: .4byte gSprites
_080B6D98: .4byte gSpriteTemplate_83CE670
	thumb_func_end sub_80B6D04

	thumb_func_start sub_80B6D9C
sub_80B6D9C: @ 80B6D9C
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _080B6DE4 @ =gUnknown_083CE2D0
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080B6DC0
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _080B6DCE
_080B6DC0:
	movs r0, 0x8
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	strh r0, [r4, 0x30]
_080B6DCE:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x24]
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B6DE4: .4byte gUnknown_083CE2D0
	thumb_func_end sub_80B6D9C

	thumb_func_start sub_80B6DE8
sub_80B6DE8: @ 80B6DE8
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _080B6E10 @ =gUnknown_083CE2D8
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	bl sub_80B6F44
	lsls r0, 24
	ldrh r1, [r4, 0x2E]
	lsls r1, 24
	cmp r0, r1
	beq _080B6E14
	movs r0, 0
	strh r0, [r4, 0x26]
	strh r0, [r4, 0x30]
	b _080B6E3A
	.align 2, 0
_080B6E10: .4byte gUnknown_083CE2D8
_080B6E14:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080B6E3C
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	strh r0, [r4, 0x30]
	movs r0, 0
_080B6E3A:
	strh r0, [r4, 0x32]
_080B6E3C:
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B6DE8

	thumb_func_start sub_80B6E44
sub_80B6E44: @ 80B6E44
	push {lr}
	ldr r1, _080B6E5C @ =gUnknown_083CE2E0
	ldr r0, _080B6E60 @ =0x02000000
	ldr r0, [r0, 0x34]
	ldrb r0, [r0, 0x2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	bx r0
	.align 2, 0
_080B6E5C: .4byte gUnknown_083CE2E0
_080B6E60: .4byte 0x02000000
	thumb_func_end sub_80B6E44

	thumb_func_start nullsub_40
nullsub_40: @ 80B6E64
	bx lr
	thumb_func_end nullsub_40

	thumb_func_start sub_80B6E68
sub_80B6E68: @ 80B6E68
	push {lr}
	sub sp, 0x4
	ldr r0, _080B6EB0 @ =0x02000000
	ldrh r1, [r0, 0x3E]
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_805983C
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B6EB4 @ =SpriteCallbackDummy
	movs r2, 0
	str r2, [sp]
	movs r2, 0x38
	movs r3, 0x18
	bl AddPseudoFieldObject
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080B6EB8 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	movs r1, 0x4
	bl StartSpriteAnim
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080B6EB0: .4byte 0x02000000
_080B6EB4: .4byte SpriteCallbackDummy
_080B6EB8: .4byte gSprites
	thumb_func_end sub_80B6E68

	thumb_func_start sub_80B6EBC
sub_80B6EBC: @ 80B6EBC
	push {r4,lr}
	ldr r0, _080B6EF0 @ =gSpriteTemplate_83CE688
	movs r1, 0x34
	movs r2, 0x18
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _080B6EF4 @ =gSprites
	adds r4, r0
	ldr r1, _080B6EF8 @ =gUnknown_083CE580
	adds r0, r4, 0
	bl SetSubspriteTables
	ldrb r0, [r4, 0x5]
	movs r1, 0xC
	orrs r0, r1
	strb r0, [r4, 0x5]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B6EF0: .4byte gSpriteTemplate_83CE688
_080B6EF4: .4byte gSprites
_080B6EF8: .4byte gUnknown_083CE580
	thumb_func_end sub_80B6EBC

	thumb_func_start sub_80B6EFC
sub_80B6EFC: @ 80B6EFC
	push {lr}
	sub sp, 0x8
	bl sub_809D51C
	ldr r3, _080B6F38 @ =0x02000000
	ldrh r0, [r3, 0x3E]
	ldr r1, _080B6F3C @ =SpriteCallbackDummy
	movs r2, 0
	str r2, [sp]
	ldr r2, [r3, 0x44]
	str r2, [sp, 0x4]
	movs r2, 0x34
	movs r3, 0x18
	bl sub_809D2FC
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B6F40 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x5]
	movs r2, 0xC
	orrs r0, r2
	strb r0, [r1, 0x5]
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_080B6F38: .4byte 0x02000000
_080B6F3C: .4byte SpriteCallbackDummy
_080B6F40: .4byte gSprites
	thumb_func_end sub_80B6EFC

	thumb_func_start sub_80B6F44
sub_80B6F44: @ 80B6F44
	push {r4,lr}
	movs r2, 0
	ldr r1, _080B6F64 @ =0x02000000
	ldr r0, [r1, 0x34]
	ldrb r0, [r0, 0x1]
	adds r4, r1, 0
	cmp r2, r0
	bcs _080B6F72
	adds r1, 0x11
	adds r3, r0, 0
_080B6F58:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080B6F68
	adds r0, r2, 0
	b _080B6F7C
	.align 2, 0
_080B6F64: .4byte 0x02000000
_080B6F68:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r3
	bcc _080B6F58
_080B6F72:
	ldr r0, [r4, 0x34]
	ldrb r0, [r0, 0x1]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
_080B6F7C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80B6F44

	thumb_func_start sub_80B6F84
sub_80B6F84: @ 80B6F84
	push {lr}
	ldr r2, _080B6FA8 @ =0x02000000
	ldr r0, [r2, 0x34]
	ldrb r0, [r0, 0x1]
	subs r0, 0x1
	lsls r1, r0, 24
	cmp r1, 0
	ble _080B6FB4
	adds r3, r2, 0
	adds r3, 0x11
_080B6F98:
	asrs r2, r1, 24
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _080B6FAC
	lsrs r0, r1, 24
	b _080B6FB6
	.align 2, 0
_080B6FA8: .4byte 0x02000000
_080B6FAC:
	subs r0, r2, 0x1
	lsls r1, r0, 24
	cmp r1, 0
	bgt _080B6F98
_080B6FB4:
	movs r0, 0
_080B6FB6:
	pop {r1}
	bx r1
	thumb_func_end sub_80B6F84

	thumb_func_start sub_80B6FBC
sub_80B6FBC: @ 80B6FBC
	push {r4,lr}
	bl sub_80B6F84
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080B7000 @ =0x02000000
	adds r0, 0x11
	adds r4, r0
	movs r0, 0
	strb r0, [r4]
	bl sub_80B7960
	movs r0, 0xFF
	strb r0, [r4]
	bl sub_80B6958
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080B6FEA
	cmp r0, 0x2
	bne _080B6FF4
_080B6FEA:
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x1
	bl sub_80B6460
_080B6FF4:
	movs r0, 0x17
	bl PlaySE
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7000: .4byte 0x02000000
	thumb_func_end sub_80B6FBC

	thumb_func_start sub_80B7004
sub_80B7004: @ 80B7004
	push {r4,r5,lr}
	sub sp, 0x4
	mov r5, sp
	adds r5, 0x2
	mov r0, sp
	adds r1, r5, 0
	bl sub_80B6858
	mov r4, sp
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	bl sub_80B67EC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl sub_80B7768
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	movs r4, 0x1
	cmp r0, 0xFF
	bne _080B7046
	bl sub_80B7104
	b _080B704E
_080B7046:
	cmp r0, 0xFE
	bne _080B7054
	bl sub_80B713C
_080B704E:
	lsls r0, 24
	lsrs r4, r0, 24
	b _080B705A
_080B7054:
	adds r0, r1, 0
	bl sub_80B7174
_080B705A:
	bl sub_80B7960
	movs r0, 0x5
	bl PlaySE
	cmp r4, 0
	beq _080B7084
	bl sub_80B6F84
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B7080 @ =0x02000000
	ldr r1, [r1, 0x34]
	ldrb r1, [r1, 0x1]
	subs r1, 0x1
	cmp r0, r1
	bne _080B7084
	movs r0, 0x1
	b _080B7086
	.align 2, 0
_080B7080: .4byte 0x02000000
_080B7084:
	movs r0, 0
_080B7086:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80B7004

	thumb_func_start sub_80B7090
sub_80B7090: @ 80B7090
	push {r4-r7,lr}
	bl sub_80B6F84
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, r5, 0
	ldr r0, _080B70C8 @ =0x02000000
	adds r0, 0x11
	adds r0, r5, r0
	ldrb r4, [r0]
	adds r6, r4, 0
	adds r0, r4, 0
	bl sub_80B7198
	lsls r0, 24
	cmp r0, 0
	beq _080B70D6
	adds r0, r4, 0
	bl sub_80B7264
	lsls r0, 24
	cmp r0, 0
	beq _080B70CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80B7370
	b _080B70F4
	.align 2, 0
_080B70C8: .4byte 0x02000000
_080B70CC:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80B73CC
	b _080B70F4
_080B70D6:
	adds r0, r4, 0
	bl sub_80B71E4
	lsls r0, 24
	cmp r0, 0
	beq _080B70EC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80B7474
	b _080B70F4
_080B70EC:
	adds r0, r6, 0
	adds r1, r7, 0
	bl sub_80B72A4
_080B70F4:
	bl sub_80B7960
	movs r0, 0x5
	bl PlaySE
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B7090

	thumb_func_start sub_80B7104
sub_80B7104: @ 80B7104
	push {r4,r5,lr}
	bl sub_80B6F84
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080B7128 @ =0x02000000
	adds r0, 0x11
	adds r0, r5, r0
	ldrb r4, [r0]
	adds r0, r4, 0
	bl sub_80B720C
	lsls r0, 24
	cmp r0, 0
	bne _080B712C
	movs r0, 0
	b _080B7136
	.align 2, 0
_080B7128: .4byte 0x02000000
_080B712C:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80B72A4
	movs r0, 0x1
_080B7136:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80B7104

	thumb_func_start sub_80B713C
sub_80B713C: @ 80B713C
	push {r4,r5,lr}
	bl sub_80B6F84
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080B7160 @ =0x02000000
	adds r0, 0x11
	adds r0, r5, r0
	ldrb r4, [r0]
	adds r0, r4, 0
	bl sub_80B7264
	lsls r0, 24
	cmp r0, 0
	bne _080B7164
	movs r0, 0
	b _080B716E
	.align 2, 0
_080B7160: .4byte 0x02000000
_080B7164:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80B7370
	movs r0, 0x1
_080B716E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80B713C

	thumb_func_start sub_80B7174
sub_80B7174: @ 80B7174
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80B6F44
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B7194 @ =0x02000000
	adds r1, 0x11
	adds r0, r1
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7194: .4byte 0x02000000
	thumb_func_end sub_80B7174

	thumb_func_start sub_80B7198
sub_80B7198: @ 80B7198
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xC9
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x13
	bls _080B71DA
	adds r0, r1, 0
	adds r0, 0x79
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B71DA
	adds r0, r1, 0
	adds r0, 0x74
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B71DA
	adds r0, r1, 0
	adds r0, 0x6F
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B71DA
	adds r0, r1, 0
	adds r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B71DE
_080B71DA:
	movs r0, 0x1
	b _080B71E0
_080B71DE:
	movs r0, 0
_080B71E0:
	pop {r1}
	bx r1
	thumb_func_end sub_80B7198

	thumb_func_start sub_80B71E4
sub_80B71E4: @ 80B71E4
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xB5
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B7202
	adds r0, r1, 0
	adds r0, 0x65
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B7206
_080B7202:
	movs r0, 0x1
	b _080B7208
_080B7206:
	movs r0, 0
_080B7208:
	pop {r1}
	bx r1
	thumb_func_end sub_80B71E4

	thumb_func_start sub_80B720C
sub_80B720C: @ 80B720C
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xFA
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0xE
	bls _080B725A
	adds r0, r1, 0
	subs r0, 0x1A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B725A
	adds r0, r1, 0
	subs r0, 0x4B
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B725A
	adds r0, r1, 0
	subs r0, 0x56
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE
	bls _080B725A
	adds r0, r1, 0
	subs r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B725A
	adds r0, r1, 0
	adds r0, 0x65
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B725E
_080B725A:
	movs r0, 0x1
	b _080B7260
_080B725E:
	movs r0, 0
_080B7260:
	pop {r1}
	bx r1
	thumb_func_end sub_80B720C

	thumb_func_start sub_80B7264
sub_80B7264: @ 80B7264
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xE6
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B729A
	adds r0, r1, 0
	subs r0, 0x46
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B729A
	adds r0, r1, 0
	subs r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B729A
	adds r0, r1, 0
	adds r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B729E
_080B729A:
	movs r0, 0x1
	b _080B72A0
_080B729E:
	movs r0, 0
_080B72A0:
	pop {r1}
	bx r1
	thumb_func_end sub_80B7264

	thumb_func_start sub_80B72A4
sub_80B72A4: @ 80B72A4
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsrs r2, r0, 24
	movs r3, 0xFA
	lsls r3, 24
	adds r0, r3
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B72C0
	adds r0, r2, 0
	adds r0, 0x31
	b _080B735A
_080B72C0:
	adds r0, r2, 0
	subs r0, 0xB
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B72D2
	adds r0, r2, 0
	adds r0, 0x31
	b _080B735A
_080B72D2:
	adds r0, r2, 0
	subs r0, 0x10
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B72E4
	adds r0, r2, 0
	adds r0, 0x31
	b _080B735A
_080B72E4:
	adds r0, r2, 0
	subs r0, 0x1A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B72F6
	adds r0, r2, 0
	adds r0, 0x2C
	b _080B735A
_080B72F6:
	adds r0, r2, 0
	subs r0, 0x4B
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B7356
	adds r0, r2, 0
	subs r0, 0x56
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B7314
	adds r0, r2, 0
	adds r0, 0x31
	b _080B735A
_080B7314:
	adds r0, r2, 0
	subs r0, 0x5B
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B7326
	adds r0, r2, 0
	adds r0, 0x31
	b _080B735A
_080B7326:
	adds r0, r2, 0
	subs r0, 0x60
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B7338
	adds r0, r2, 0
	adds r0, 0x31
	b _080B735A
_080B7338:
	adds r0, r2, 0
	subs r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B734A
	adds r0, r2, 0
	adds r0, 0x2C
	b _080B735A
_080B734A:
	adds r0, r2, 0
	adds r0, 0x65
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B735E
_080B7356:
	adds r0, r2, 0
	adds r0, 0xFB
_080B735A:
	lsls r0, 24
	lsrs r2, r0, 24
_080B735E:
	ldr r0, _080B736C @ =0x02000000
	adds r0, 0x11
	adds r0, r1, r0
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080B736C: .4byte 0x02000000
	thumb_func_end sub_80B72A4

	thumb_func_start sub_80B7370
sub_80B7370: @ 80B7370
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsrs r2, r0, 24
	movs r3, 0xE6
	lsls r3, 24
	adds r0, r3
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B738C
	adds r0, r2, 0
	adds r0, 0x31
	b _080B73B8
_080B738C:
	adds r0, r2, 0
	subs r0, 0x46
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B73B6
	adds r0, r2, 0
	subs r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B73AA
	adds r0, r2, 0
	adds r0, 0x31
	b _080B73B8
_080B73AA:
	adds r0, r2, 0
	adds r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B73BC
_080B73B6:
	adds r0, r2, 0x5
_080B73B8:
	lsls r0, 24
	lsrs r2, r0, 24
_080B73BC:
	ldr r0, _080B73C8 @ =0x02000000
	adds r0, 0x11
	adds r0, r1, r0
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080B73C8: .4byte 0x02000000
	thumb_func_end sub_80B7370

	thumb_func_start sub_80B73CC
sub_80B73CC: @ 80B73CC
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsrs r2, r0, 24
	movs r3, 0xC9
	lsls r3, 24
	adds r0, r3
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B73E8
	adds r0, r2, 0
	adds r0, 0xCF
	b _080B745E
_080B73E8:
	adds r0, r2, 0
	subs r0, 0x3C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B73FA
	adds r0, r2, 0
	adds r0, 0xCF
	b _080B745E
_080B73FA:
	adds r0, r2, 0
	subs r0, 0x41
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B740C
	adds r0, r2, 0
	adds r0, 0xCF
	b _080B745E
_080B740C:
	adds r0, r2, 0
	subs r0, 0x46
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B745A
	adds r0, r2, 0
	adds r0, 0x79
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B742A
	adds r0, r2, 0
	adds r0, 0xCF
	b _080B745E
_080B742A:
	adds r0, r2, 0
	adds r0, 0x74
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B743C
	adds r0, r2, 0
	adds r0, 0xCF
	b _080B745E
_080B743C:
	adds r0, r2, 0
	adds r0, 0x6F
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B744E
	adds r0, r2, 0
	adds r0, 0xCF
	b _080B745E
_080B744E:
	adds r0, r2, 0
	adds r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B7462
_080B745A:
	adds r0, r2, 0
	adds r0, 0xD4
_080B745E:
	lsls r0, 24
	lsrs r2, r0, 24
_080B7462:
	ldr r0, _080B7470 @ =0x02000000
	adds r0, 0x11
	adds r0, r1, r0
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080B7470: .4byte 0x02000000
	thumb_func_end sub_80B73CC

	thumb_func_start sub_80B7474
sub_80B7474: @ 80B7474
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsrs r2, r0, 24
	movs r3, 0xB5
	lsls r3, 24
	adds r0, r3
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B7496
	adds r0, r2, 0
	adds r0, 0x65
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B749E
_080B7496:
	adds r0, r2, 0
	adds r0, 0xCF
	lsls r0, 24
	lsrs r2, r0, 24
_080B749E:
	ldr r0, _080B74AC @ =0x02000000
	adds r0, 0x11
	adds r0, r1, r0
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080B74AC: .4byte 0x02000000
	thumb_func_end sub_80B7474

	thumb_func_start sub_80B74B0
sub_80B74B0: @ 80B74B0
	push {r4,lr}
	movs r1, 0
	ldr r3, _080B74E4 @ =0x02000000
	ldr r0, [r3, 0x34]
	ldrb r0, [r0, 0x1]
	cmp r1, r0
	bcs _080B74F6
	adds r2, r3, 0
	adds r4, r3, 0
	adds r4, 0x11
_080B74C4:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _080B74E8
	cmp r0, 0xFF
	beq _080B74E8
	ldr r0, [r2, 0x38]
	ldr r1, [r2, 0x34]
	ldrb r2, [r1, 0x1]
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	adds r1, r4, 0
	bl StringCopyN
	b _080B74F6
	.align 2, 0
_080B74E4: .4byte 0x02000000
_080B74E8:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, [r3, 0x34]
	ldrb r0, [r0, 0x1]
	cmp r1, r0
	bcc _080B74C4
_080B74F6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B74B0

	thumb_func_start sub_80B74FC
sub_80B74FC: @ 80B74FC
	push {r4,lr}
	ldr r0, _080B7528 @ =gStringVar1
	ldr r1, _080B752C @ =0x02000000
	ldr r1, [r1, 0x38]
	bl StringCopy
	ldr r4, _080B7530 @ =gStringVar4
	ldr r1, _080B7534 @ =gOtherText_SentToPC
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _080B7538 @ =gWindowConfig_81E6E88
	bl BasicInitMenuWindow
	bl MenuDisplayMessageBox
	adds r0, r4, 0
	bl sub_8072044
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7528: .4byte gStringVar1
_080B752C: .4byte 0x02000000
_080B7530: .4byte gStringVar4
_080B7534: .4byte gOtherText_SentToPC
_080B7538: .4byte gWindowConfig_81E6E88
	thumb_func_end sub_80B74FC

	thumb_func_start sub_80B753C
sub_80B753C: @ 80B753C
	push {lr}
	ldr r0, _080B7550 @ =gUnknown_083CE6A0
	bl LoadSpriteSheets
	ldr r0, _080B7554 @ =gUnknown_083CE708
	bl LoadSpritePalettes
	pop {r0}
	bx r0
	.align 2, 0
_080B7550: .4byte gUnknown_083CE6A0
_080B7554: .4byte gUnknown_083CE708
	thumb_func_end sub_80B753C

	thumb_func_start sub_80B7558
sub_80B7558: @ 80B7558
	push {lr}
	bl sub_80B7568
	bl sub_80B75B0
	pop {r0}
	bx r0
	thumb_func_end sub_80B7558

	thumb_func_start sub_80B7568
sub_80B7568: @ 80B7568
	push {r4,lr}
	ldr r4, _080B759C @ =gNamingScreenMenu_Gfx
	ldr r3, _080B75A0 @ =gMenuMessageBoxContentTileOffset
	ldrh r0, [r3]
	lsls r0, 5
	movs r1, 0xC0
	lsls r1, 19
	adds r0, r1
	ldr r1, _080B75A4 @ =0x040000d4
	str r4, [r1]
	str r0, [r1, 0x4]
	ldr r2, _080B75A8 @ =0x80000400
	str r2, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldrh r0, [r3]
	lsls r0, 5
	ldr r3, _080B75AC @ =0x06008000
	adds r0, r3
	str r4, [r1]
	str r0, [r1, 0x4]
	str r2, [r1, 0x8]
	ldr r0, [r1, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B759C: .4byte gNamingScreenMenu_Gfx
_080B75A0: .4byte gMenuMessageBoxContentTileOffset
_080B75A4: .4byte 0x040000d4
_080B75A8: .4byte 0x80000400
_080B75AC: .4byte 0x06008000
	thumb_func_end sub_80B7568

	thumb_func_start sub_80B75B0
sub_80B75B0: @ 80B75B0
	push {lr}
	ldr r0, _080B75C0 @ =gNamingScreenPalettes
	movs r1, 0
	movs r2, 0x80
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_080B75C0: .4byte gNamingScreenPalettes
	thumb_func_end sub_80B75B0

	thumb_func_start sub_80B75C4
sub_80B75C4: @ 80B75C4
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r0, _080B7608 @ =gUnknown_083CE308
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r4, _080B760C @ =gUnknown_083CE2F0
	ldr r5, _080B7610 @ =0x02000000
	ldrb r1, [r5, 0xE]
	lsls r1, 3
	adds r1, r4
	ldrb r0, [r5, 0xC]
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	ldr r1, [r1]
	bl _call_via_r1
	ldrb r1, [r5, 0xE]
	lsls r1, 3
	adds r4, 0x4
	adds r1, r4
	ldrb r0, [r5, 0xD]
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	ldr r1, [r1]
	bl _call_via_r1
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7608: .4byte gUnknown_083CE308
_080B760C: .4byte gUnknown_083CE2F0
_080B7610: .4byte 0x02000000
	thumb_func_end sub_80B75C4

	thumb_func_start sub_80B7614
sub_80B7614: @ 80B7614
	push {lr}
	sub sp, 0x8
	ldr r0, _080B7644 @ =gUnknown_083CE308
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r0, _080B7648 @ =gUnknown_083CE2F0
	ldr r2, _080B764C @ =0x02000000
	ldrb r1, [r2, 0xE]
	lsls r1, 3
	adds r0, 0x4
	adds r1, r0
	ldrb r0, [r2, 0xD]
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	ldr r1, [r1]
	bl _call_via_r1
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_080B7644: .4byte gUnknown_083CE308
_080B7648: .4byte gUnknown_083CE2F0
_080B764C: .4byte 0x02000000
	thumb_func_end sub_80B7614

	thumb_func_start sub_80B7650
sub_80B7650: @ 80B7650
	push {lr}
	ldr r1, _080B765C @ =gUnknown_083CE748
	bl sub_80B7698
	pop {r0}
	bx r0
	.align 2, 0
_080B765C: .4byte gUnknown_083CE748
	thumb_func_end sub_80B7650

	thumb_func_start sub_80B7660
sub_80B7660: @ 80B7660
	push {lr}
	ldr r1, _080B766C @ =gUnknown_083CEBF8
	bl sub_80B7698
	pop {r0}
	bx r0
	.align 2, 0
_080B766C: .4byte gUnknown_083CEBF8
	thumb_func_end sub_80B7660

	thumb_func_start sub_80B7670
sub_80B7670: @ 80B7670
	push {lr}
	ldr r1, _080B767C @ =gUnknown_083CF0A8
	bl sub_80B7698
	pop {r0}
	bx r0
	.align 2, 0
_080B767C: .4byte gUnknown_083CF0A8
	thumb_func_end sub_80B7670

	thumb_func_start sub_80B7680
sub_80B7680: @ 80B7680
	push {lr}
	ldr r0, _080B7690 @ =0x0600f000
	ldr r1, _080B7694 @ =gUnknown_08E86258
	bl sub_80B76E0
	pop {r0}
	bx r0
	.align 2, 0
_080B7690: .4byte 0x0600f000
_080B7694: .4byte gUnknown_08E86258
	thumb_func_end sub_80B7680

	thumb_func_start sub_80B7698
sub_80B7698: @ 80B7698
	push {r4-r7,lr}
	mov r12, r0
	adds r3, r1, 0
	movs r4, 0
	ldr r0, _080B76DC @ =gMenuMessageBoxContentTileOffset
	ldrh r6, [r0]
_080B76A4:
	movs r1, 0
	lsls r4, 16
	asrs r5, r4, 11
_080B76AA:
	lsls r0, r1, 16
	asrs r0, 16
	adds r1, r5, r0
	lsls r1, 1
	add r1, r12
	ldrh r7, [r3]
	adds r2, r6, r7
	strh r2, [r1]
	adds r0, 0x1
	lsls r0, 16
	adds r3, 0x2
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x1D
	ble _080B76AA
	movs r1, 0x80
	lsls r1, 9
	adds r0, r4, r1
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080B76A4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B76DC: .4byte gMenuMessageBoxContentTileOffset
	thumb_func_end sub_80B7698

	thumb_func_start sub_80B76E0
sub_80B76E0: @ 80B76E0
	push {r4-r7,lr}
	mov r12, r0
	adds r3, r1, 0
	movs r4, 0
	ldr r0, _080B7728 @ =gMenuMessageBoxContentTileOffset
	ldrh r6, [r0]
_080B76EC:
	movs r1, 0
	lsls r5, r4, 16
	asrs r4, r5, 11
_080B76F2:
	lsls r0, r1, 16
	asrs r0, 16
	adds r1, r4, r0
	lsls r1, 1
	add r1, r12
	ldrh r7, [r3]
	adds r2, r6, r7
	strh r2, [r1]
	adds r0, 0x1
	lsls r0, 16
	adds r3, 0x2
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x1D
	ble _080B76F2
	adds r3, 0x4
	movs r1, 0x80
	lsls r1, 9
	adds r0, r5, r1
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080B76EC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B7728: .4byte gMenuMessageBoxContentTileOffset
	thumb_func_end sub_80B76E0

	thumb_func_start sub_80B772C
sub_80B772C: @ 80B772C
	push {lr}
	ldr r1, _080B773C @ =0x02000000
	ldrb r0, [r1, 0xE]
	ldrb r1, [r1, 0xC]
	bl nullsub_20
	pop {r0}
	bx r0
	.align 2, 0
_080B773C: .4byte 0x02000000
	thumb_func_end sub_80B772C

	thumb_func_start sub_80B7740
sub_80B7740: @ 80B7740
	push {r4,lr}
	ldr r4, _080B7760 @ =0x02000000
	ldrb r0, [r4, 0xE]
	adds r0, 0x1
	movs r1, 0x3
	bl __modsi3
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r4, 0xD]
	bl nullsub_20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7760: .4byte 0x02000000
	thumb_func_end sub_80B7740

	thumb_func_start nullsub_20
nullsub_20: @ 80B7764
	bx lr
	thumb_func_end nullsub_20

	thumb_func_start sub_80B7768
sub_80B7768: @ 80B7768
	ldr r3, _080B778C @ =gUnknown_083CE3A8
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	lsls r2, r1, 2
	adds r2, r1
	lsls r2, 2
	adds r0, r2
	ldr r1, _080B7790 @ =0x02000000
	ldrb r2, [r1, 0xE]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	adds r0, r1
	adds r0, r3
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080B778C: .4byte gUnknown_083CE3A8
_080B7790: .4byte 0x02000000
	thumb_func_end sub_80B7768

	thumb_func_start sub_80B7794
sub_80B7794: @ 80B7794
	push {r4-r6,lr}
	ldr r6, _080B77EC @ =gUnknown_083CE328
	ldr r4, _080B77F0 @ =0x02000000
	ldrb r0, [r4, 0xC]
	lsls r0, 2
	ldrb r1, [r4, 0xE]
	lsls r1, 4
	adds r0, r1
	adds r0, r6
	ldr r0, [r0]
	bl BasicInitMenuWindow
	ldr r5, _080B77F4 @ =gUnknown_083CE310
	ldrb r0, [r4, 0xE]
	lsls r0, 3
	adds r0, r5
	ldr r0, [r0]
	bl _call_via_r0
	ldrb r1, [r4, 0xD]
	lsls r1, 2
	ldrb r0, [r4, 0xE]
	lsls r0, 4
	adds r1, r0
	adds r6, 0x8
	adds r1, r6
	ldr r0, [r1]
	bl BasicInitMenuWindow
	ldrb r0, [r4, 0xE]
	lsls r0, 3
	adds r5, 0x4
	adds r0, r5
	ldr r0, [r0]
	bl _call_via_r0
	bl sub_80B772C
	bl sub_80B7740
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B77EC: .4byte gUnknown_083CE328
_080B77F0: .4byte 0x02000000
_080B77F4: .4byte gUnknown_083CE310
	thumb_func_end sub_80B7794

	thumb_func_start sub_80B77F8
sub_80B77F8: @ 80B77F8
	push {r4,lr}
	ldr r2, _080B782C @ =gUnknown_083CE328
	ldr r4, _080B7830 @ =0x02000000
	ldrb r1, [r4, 0xD]
	lsls r1, 2
	ldrb r0, [r4, 0xE]
	lsls r0, 4
	adds r1, r0
	adds r2, 0x8
	adds r1, r2
	ldr r0, [r1]
	bl BasicInitMenuWindow
	ldr r1, _080B7834 @ =gUnknown_083CE310
	ldrb r0, [r4, 0xE]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	bl sub_80B7740
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B782C: .4byte gUnknown_083CE328
_080B7830: .4byte 0x02000000
_080B7834: .4byte gUnknown_083CE310
	thumb_func_end sub_80B77F8

	thumb_func_start sub_80B7838
sub_80B7838: @ 80B7838
	push {lr}
	movs r0, 0x1
	bl sub_80B785C
	pop {r0}
	bx r0
	thumb_func_end sub_80B7838

	thumb_func_start sub_80B7844
sub_80B7844: @ 80B7844
	push {lr}
	movs r0, 0
	bl sub_80B785C
	pop {r0}
	bx r0
	thumb_func_end sub_80B7844

	thumb_func_start sub_80B7850
sub_80B7850: @ 80B7850
	push {lr}
	movs r0, 0x2
	bl sub_80B785C
	pop {r0}
	bx r0
	thumb_func_end sub_80B7850

	thumb_func_start sub_80B785C
sub_80B785C: @ 80B785C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	movs r5, 0x9
	lsls r1, r0, 2
	adds r1, r0
	lsls r6, r1, 4
_080B786C:
	lsls r4, r2, 16
	asrs r4, 16
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 2
	ldr r1, _080B78A4 @ =gUnknown_083CE3A8
	adds r0, r1
	adds r0, r6, r0
	lsls r2, r5, 24
	lsrs r2, 24
	movs r1, 0x3
	bl MenuPrint
	adds r4, 0x1
	lsls r4, 16
	lsls r0, r5, 16
	movs r1, 0x80
	lsls r1, 10
	adds r0, r1
	lsrs r5, r0, 16
	lsrs r2, r4, 16
	asrs r4, 16
	cmp r4, 0x3
	ble _080B786C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B78A4: .4byte gUnknown_083CE3A8
	thumb_func_end sub_80B785C

	thumb_func_start sub_80B78A8
sub_80B78A8: @ 80B78A8
	push {r4,lr}
	ldr r0, _080B78E4 @ =gWindowConfig_81E6F4C
	bl BasicInitMenuWindow
	ldr r1, _080B78E8 @ =gUnknown_083CE358
	ldr r4, _080B78EC @ =0x02000000
	ldrb r0, [r4, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldr r1, _080B78F0 @ =gUnknown_083CE368
	ldr r0, [r4, 0x34]
	ldrb r0, [r0, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, [r4, 0x34]
	ldr r0, [r0, 0x8]
	movs r1, 0x9
	movs r2, 0x2
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B78E4: .4byte gWindowConfig_81E6F4C
_080B78E8: .4byte gUnknown_083CE358
_080B78EC: .4byte 0x02000000
_080B78F0: .4byte gUnknown_083CE368
	thumb_func_end sub_80B78A8

	thumb_func_start nullsub_61
nullsub_61: @ 80B78F4
	bx lr
	thumb_func_end nullsub_61

	thumb_func_start sub_80B78F8
sub_80B78F8: @ 80B78F8
	push {lr}
	ldr r0, _080B7914 @ =gStringVar1
	ldr r1, _080B7918 @ =0x02000000
	movs r3, 0x3E
	ldrsh r2, [r1, r3]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080B791C @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	pop {r0}
	bx r0
	.align 2, 0
_080B7914: .4byte gStringVar1
_080B7918: .4byte 0x02000000
_080B791C: .4byte gSpeciesNames
	thumb_func_end sub_80B78F8

	thumb_func_start nullsub_62
nullsub_62: @ 80B7920
	bx lr
	thumb_func_end nullsub_62

	thumb_func_start sub_80B7924
sub_80B7924: @ 80B7924
	push {lr}
	sub sp, 0x4
	ldr r1, _080B7958 @ =gUnknown_083CE370
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	ldr r0, _080B795C @ =0x02000000
	adds r0, 0x40
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0xFF
	beq _080B7952
	cmp r0, 0xFE
	bne _080B7948
	mov r1, sp
	movs r0, 0xB6
	strb r0, [r1]
_080B7948:
	mov r0, sp
	movs r1, 0x14
	movs r2, 0x4
	bl MenuPrint
_080B7952:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080B7958: .4byte gUnknown_083CE370
_080B795C: .4byte 0x02000000
	thumb_func_end sub_80B7924

	thumb_func_start sub_80B7960
sub_80B7960: @ 80B7960
	push {r4,lr}
	ldr r0, _080B799C @ =gStringVar1
	movs r2, 0xFC
	strb r2, [r0]
	movs r1, 0x14
	strb r1, [r0, 0x1]
	movs r1, 0x8
	strb r1, [r0, 0x2]
	strb r2, [r0, 0x3]
	movs r1, 0x11
	strb r1, [r0, 0x4]
	movs r1, 0x1
	strb r1, [r0, 0x5]
	adds r0, 0x6
	ldr r4, _080B79A0 @ =0x02000011
	adds r1, r4, 0
	bl StringCopy
	ldr r0, _080B79A4 @ =gWindowConfig_81E6F4C
	bl BasicInitMenuWindow
	ldr r0, _080B799C @ =gStringVar1
	subs r4, 0x11
	ldrb r1, [r4, 0x2]
	movs r2, 0x4
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B799C: .4byte gStringVar1
_080B79A0: .4byte 0x02000011
_080B79A4: .4byte gWindowConfig_81E6F4C
	thumb_func_end sub_80B7960

	.align 2, 0 @ Don't pad with nop.
