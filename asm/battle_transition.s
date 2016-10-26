	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_811AABC
sub_811AABC: @ 811AABC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811AAD0 @ =gMain
	ldr r1, _0811AAD4 @ =sub_8054398
	str r1, [r2, 0x4]
	bl sub_811AB20
	pop {r0}
	bx r0
	.align 2, 0
_0811AAD0: .4byte gMain
_0811AAD4: .4byte sub_8054398
	thumb_func_end sub_811AABC

	thumb_func_start sub_811AAD8
sub_811AAD8: @ 811AAD8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_811AB20
	pop {r0}
	bx r0
	thumb_func_end sub_811AAD8

	thumb_func_start sub_811AAE8
sub_811AAE8: @ 811AAE8
	push {lr}
	ldr r0, _0811AB0C @ =sub_811AB50
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0811AB10 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	movs r1, 0x26
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0811AB14
	movs r0, 0
	b _0811AB1C
	.align 2, 0
_0811AB0C: .4byte sub_811AB50
_0811AB10: .4byte gTasks
_0811AB14:
	adds r0, r2, 0
	bl DestroyTask
	movs r0, 0x1
_0811AB1C:
	pop {r1}
	bx r1
	thumb_func_end sub_811AAE8

	thumb_func_start sub_811AB20
sub_811AB20: @ 811AB20
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0811AB48 @ =sub_811AB50
	movs r1, 0x2
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811AB4C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xA]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811AB48: .4byte sub_811AB50
_0811AB4C: .4byte gTasks
	thumb_func_end sub_811AB20

	thumb_func_start sub_811AB50
sub_811AB50: @ 811AB50
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811AB80 @ =gUnknown_083FD794
	ldr r2, _0811AB84 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811AB62:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811AB62
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811AB80: .4byte gUnknown_083FD794
_0811AB84: .4byte gTasks
	thumb_func_end sub_811AB50

	thumb_func_start sub_811AB88
sub_811AB88: @ 811AB88
	push {r4,lr}
	adds r4, r0, 0
	bl sub_807DE10
	ldr r0, _0811ABB4 @ =gPlttBufferFaded
	ldr r1, _0811ABB8 @ =gPlttBufferUnfaded
	ldr r2, _0811ABBC @ =0x04000100
	bl CpuSet
	ldr r1, _0811ABC0 @ =gUnknown_083FD70C
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	bne _0811ABC4
	movs r0, 0x2
	strh r0, [r4, 0x8]
	movs r0, 0x1
	b _0811ABD2
	.align 2, 0
_0811ABB4: .4byte gPlttBufferFaded
_0811ABB8: .4byte gPlttBufferUnfaded
_0811ABBC: .4byte 0x04000100
_0811ABC0: .4byte gUnknown_083FD70C
_0811ABC4:
	movs r1, 0x4
	bl CreateTask
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
_0811ABD2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_811AB88

	thumb_func_start sub_811ABD8
sub_811ABD8: @ 811ABD8
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _0811ABF8 @ =gUnknown_083FD70C
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0811ABFC
	movs r0, 0
	b _0811AC04
	.align 2, 0
_0811ABF8: .4byte gUnknown_083FD70C
_0811ABFC:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
_0811AC04:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_811ABD8

	thumb_func_start sub_811AC0C
sub_811AC0C: @ 811AC0C
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _0811AC30 @ =gBattleTransitionFuncs
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	bl CreateTask
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811AC30: .4byte gBattleTransitionFuncs
	thumb_func_end sub_811AC0C

	thumb_func_start sub_811AC34
sub_811AC34: @ 811AC34
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0
	strh r0, [r4, 0x26]
	ldr r1, _0811AC60 @ =gBattleTransitionFuncs
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0811AC58
	movs r0, 0x1
	strh r0, [r4, 0x26]
_0811AC58:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811AC60: .4byte gBattleTransitionFuncs
	thumb_func_end sub_811AC34

	thumb_func_start sub_811AC64
sub_811AC64: @ 811AC64
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r1, _0811AC98 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0x8]
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _0811AC9C
	adds r0, r2, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0
	movs r1, 0
	movs r2, 0x3
	movs r3, 0x2
	bl sub_811D4C8
	b _0811ACAC
	.align 2, 0
_0811AC98: .4byte gTasks
_0811AC9C:
	bl sub_811D52C
	lsls r0, 24
	cmp r0, 0
	beq _0811ACAC
	adds r0, r4, 0
	bl DestroyTask
_0811ACAC:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_811AC64

	thumb_func_start sub_811ACB4
sub_811ACB4: @ 811ACB4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811ACE4 @ =gUnknown_083FD7A4
	ldr r2, _0811ACE8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811ACC6:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811ACC6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811ACE4: .4byte gUnknown_083FD7A4
_0811ACE8: .4byte gTasks
	thumb_func_end sub_811ACB4

	thumb_func_start sub_811ACEC
sub_811ACEC: @ 811ACEC
	ldr r2, _0811AD18 @ =REG_MOSAIC
	movs r1, 0
	strh r1, [r2]
	subs r2, 0x42
	ldrh r1, [r2]
	movs r3, 0x40
	orrs r1, r3
	strh r1, [r2]
	adds r2, 0x2
	ldrh r1, [r2]
	orrs r1, r3
	strh r1, [r2]
	adds r2, 0x2
	ldrh r1, [r2]
	orrs r1, r3
	strh r1, [r2]
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	movs r0, 0x1
	bx lr
	.align 2, 0
_0811AD18: .4byte REG_MOSAIC
	thumb_func_end sub_811ACEC

	thumb_func_start sub_811AD1C
sub_811AD1C: @ 811AD1C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r0, [r4, 0xA]
	movs r1, 0xA
	ldrsh r2, [r4, r1]
	cmp r2, 0
	beq _0811AD32
	subs r0, 0x1
	strh r0, [r4, 0xA]
	b _0811AD70
_0811AD32:
	movs r0, 0x4
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _0811AD54
	movs r1, 0x1
	negs r1, r1
	str r2, [sp]
	adds r0, r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_0811AD54:
	ldr r2, _0811AD7C @ =REG_MOSAIC
	ldrh r0, [r4, 0xC]
	movs r1, 0xF
	ands r1, r0
	lsls r0, r1, 4
	adds r0, r1
	strh r0, [r2]
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0xE
	ble _0811AD70
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0811AD70:
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811AD7C: .4byte REG_MOSAIC
	thumb_func_end sub_811AD1C

	thumb_func_start sub_811AD80
sub_811AD80: @ 811AD80
	push {lr}
	ldr r0, _0811ADA4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811AD9C
	ldr r0, _0811ADA8 @ =sub_811ACB4
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0811AD9C:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0811ADA4: .4byte gPaletteFade
_0811ADA8: .4byte sub_811ACB4
	thumb_func_end sub_811AD80

	thumb_func_start sub_811ADAC
sub_811ADAC: @ 811ADAC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811ADDC @ =gUnknown_083FD7B0
	ldr r2, _0811ADE0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811ADBE:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811ADBE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811ADDC: .4byte gUnknown_083FD7B0
_0811ADE0: .4byte gTasks
	thumb_func_end sub_811ADAC

	thumb_func_start sub_811ADE4
sub_811ADE4: @ 811ADE4
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	movs r0, 0x1
	negs r0, r0
	movs r4, 0
	str r4, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0811AE54 @ =gUnknown_03005560
	ldr r1, _0811AE58 @ =0x0200c000
	movs r2, 0x14
	ldrsh r1, [r1, r2]
	str r4, [sp]
	movs r2, 0xA0
	str r2, [sp, 0x4]
	movs r2, 0
	movs r3, 0x2
	bl sub_811D6E8
	ldr r0, _0811AE5C @ =sub_811AEE0
	bl SetVBlankCallback
	ldr r0, _0811AE60 @ =sub_811AF18
	bl SetHBlankCallback
	ldr r3, _0811AE64 @ =0x04000208
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _0811AE68 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x3
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _0811AE6C @ =REG_DISPSTAT
	ldrh r0, [r2]
	movs r1, 0x18
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811AE54: .4byte gUnknown_03005560
_0811AE58: .4byte 0x0200c000
_0811AE5C: .4byte sub_811AEE0
_0811AE60: .4byte sub_811AF18
_0811AE64: .4byte 0x04000208
_0811AE68: .4byte 0x04000200
_0811AE6C: .4byte REG_DISPSTAT
	thumb_func_end sub_811ADE4

	thumb_func_start sub_811AE70
sub_811AE70: @ 811AE70
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r4, _0811AED0 @ =0x0200c000
	ldrb r1, [r4]
	movs r1, 0
	strb r1, [r4]
	ldrh r1, [r0, 0xA]
	adds r1, 0x4
	strh r1, [r0, 0xA]
	ldrh r1, [r0, 0xC]
	adds r1, 0x8
	strh r1, [r0, 0xC]
	ldr r3, _0811AED4 @ =gUnknown_03004DE0
	movs r2, 0x14
	ldrsh r1, [r4, r2]
	movs r5, 0xA
	ldrsh r2, [r0, r5]
	movs r5, 0xC
	ldrsh r0, [r0, r5]
	str r0, [sp]
	movs r0, 0xA0
	str r0, [sp, 0x4]
	adds r0, r3, 0
	movs r3, 0x2
	bl sub_811D6E8
	ldr r0, _0811AED8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811AEBE
	ldr r0, _0811AEDC @ =sub_811ADAC
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0811AEBE:
	ldrb r0, [r4]
	adds r0, 0x1
	ldrb r1, [r4]
	strb r0, [r4]
	movs r0, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811AED0: .4byte 0x0200c000
_0811AED4: .4byte gUnknown_03004DE0
_0811AED8: .4byte gPaletteFade
_0811AEDC: .4byte sub_811ADAC
	thumb_func_end sub_811AE70

	thumb_func_start sub_811AEE0
sub_811AEE0: @ 811AEE0
	push {lr}
	bl sub_811D67C
	ldr r0, _0811AF08 @ =0x0200c000
	ldrb r0, [r0]
	cmp r0, 0
	beq _0811AF02
	ldr r1, _0811AF0C @ =0x040000d4
	ldr r0, _0811AF10 @ =gUnknown_03004DE0
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _0811AF14 @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811AF02:
	pop {r0}
	bx r0
	.align 2, 0
_0811AF08: .4byte 0x0200c000
_0811AF0C: .4byte 0x040000d4
_0811AF10: .4byte gUnknown_03004DE0
_0811AF14: .4byte 0x800000a0
	thumb_func_end sub_811AEE0

	thumb_func_start sub_811AF18
sub_811AF18: @ 811AF18
	ldr r1, _0811AF38 @ =gUnknown_03004DE0
	ldr r0, _0811AF3C @ =REG_VCOUNT
	ldrh r0, [r0]
	lsls r0, 1
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r2
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _0811AF40 @ =REG_BG1HOFS
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	bx lr
	.align 2, 0
_0811AF38: .4byte gUnknown_03004DE0
_0811AF3C: .4byte REG_VCOUNT
_0811AF40: .4byte REG_BG1HOFS
	thumb_func_end sub_811AF18

	thumb_func_start sub_811AF44
sub_811AF44: @ 811AF44
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811AF74 @ =gUnknown_083FD7B8
	ldr r2, _0811AF78 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811AF56:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811AF56
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811AF74: .4byte gUnknown_083FD7B8
_0811AF78: .4byte gTasks
	thumb_func_end sub_811AF44

	thumb_func_start sub_811AF7C
sub_811AF7C: @ 811AF7C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	movs r0, 0x1
	negs r0, r0
	movs r4, 0
	str r4, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0811AFE4 @ =0x0200c000
	ldr r0, _0811AFE8 @ =gUnknown_03005560
	movs r2, 0x16
	ldrsh r1, [r1, r2]
	movs r2, 0xA0
	lsls r2, 1
	bl memset
	ldr r0, _0811AFEC @ =sub_811B08C
	bl SetVBlankCallback
	ldr r0, _0811AFF0 @ =sub_811B0C4
	bl SetHBlankCallback
	ldr r3, _0811AFF4 @ =0x04000208
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _0811AFF8 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x3
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _0811AFFC @ =REG_DISPSTAT
	ldrh r0, [r2]
	movs r1, 0x18
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811AFE4: .4byte 0x0200c000
_0811AFE8: .4byte gUnknown_03005560
_0811AFEC: .4byte sub_811B08C
_0811AFF0: .4byte sub_811B0C4
_0811AFF4: .4byte 0x04000208
_0811AFF8: .4byte 0x04000200
_0811AFFC: .4byte REG_DISPSTAT
	thumb_func_end sub_811AF7C

	thumb_func_start sub_811B000
sub_811B000: @ 811B000
	push {r4-r7,lr}
	ldr r2, _0811B07C @ =0x0200c000
	ldrb r1, [r2]
	movs r1, 0
	strb r1, [r2]
	ldrh r4, [r0, 0xA]
	ldrh r2, [r0, 0xC]
	lsls r3, r2, 16
	asrs r3, 24
	movs r5, 0x84
	lsls r5, 5
	adds r1, r4, r5
	strh r1, [r0, 0xA]
	movs r1, 0xC0
	lsls r1, 1
	adds r2, r1
	strh r2, [r0, 0xC]
	movs r5, 0
	lsls r7, r3, 16
_0811B026:
	lsrs r0, r4, 8
	asrs r1, r7, 16
	bl Sin
	ldr r2, _0811B080 @ =gUnknown_03004DE0
	lsls r1, r5, 1
	adds r1, r2
	ldr r6, _0811B07C @ =0x0200c000
	ldrh r2, [r6, 0x16]
	adds r0, r2
	strh r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0x84
	lsls r1, 5
	adds r0, r4, r1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r5, 0x9F
	bls _0811B026
	ldr r0, _0811B084 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811B06A
	ldr r0, _0811B088 @ =sub_811AF44
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0811B06A:
	ldrb r0, [r6]
	adds r0, 0x1
	ldrb r1, [r6]
	strb r0, [r6]
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811B07C: .4byte 0x0200c000
_0811B080: .4byte gUnknown_03004DE0
_0811B084: .4byte gPaletteFade
_0811B088: .4byte sub_811AF44
	thumb_func_end sub_811B000

	thumb_func_start sub_811B08C
sub_811B08C: @ 811B08C
	push {lr}
	bl sub_811D67C
	ldr r0, _0811B0B4 @ =0x0200c000
	ldrb r0, [r0]
	cmp r0, 0
	beq _0811B0AE
	ldr r1, _0811B0B8 @ =0x040000d4
	ldr r0, _0811B0BC @ =gUnknown_03004DE0
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _0811B0C0 @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811B0AE:
	pop {r0}
	bx r0
	.align 2, 0
_0811B0B4: .4byte 0x0200c000
_0811B0B8: .4byte 0x040000d4
_0811B0BC: .4byte gUnknown_03004DE0
_0811B0C0: .4byte 0x800000a0
	thumb_func_end sub_811B08C

	thumb_func_start sub_811B0C4
sub_811B0C4: @ 811B0C4
	ldr r1, _0811B0E4 @ =gUnknown_03004DE0
	ldr r0, _0811B0E8 @ =REG_VCOUNT
	ldrh r0, [r0]
	lsls r0, 1
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r2
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _0811B0EC @ =REG_BG1VOFS
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	bx lr
	.align 2, 0
_0811B0E4: .4byte gUnknown_03004DE0
_0811B0E8: .4byte REG_VCOUNT
_0811B0EC: .4byte REG_BG1VOFS
	thumb_func_end sub_811B0C4

	thumb_func_start sub_811B0F0
sub_811B0F0: @ 811B0F0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811B120 @ =gUnknown_083FD7C0
	ldr r2, _0811B124 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811B102:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811B102
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811B120: .4byte gUnknown_083FD7C0
_0811B124: .4byte gTasks
	thumb_func_end sub_811B0F0

	thumb_func_start sub_811B128
sub_811B128: @ 811B128
	push {r4-r6,lr}
	sub sp, 0xC
	adds r4, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	movs r2, 0
	movs r3, 0x10
	strh r3, [r4, 0xA]
	strh r2, [r4, 0xC]
	strh r2, [r4, 0x10]
	movs r0, 0x80
	lsls r0, 7
	strh r0, [r4, 0x12]
	ldr r1, _0811B1BC @ =0x0200c000
	movs r0, 0x3F
	strh r0, [r1, 0x2]
	strh r2, [r1, 0x4]
	movs r0, 0xF0
	strh r0, [r1, 0x6]
	movs r0, 0xA0
	strh r0, [r1, 0x8]
	ldr r0, _0811B1C0 @ =0x00003f41
	strh r0, [r1, 0xE]
	lsls r3, 8
	strh r3, [r1, 0x10]
	movs r1, 0
	add r5, sp, 0x4
	add r6, sp, 0x8
	ldr r3, _0811B1C4 @ =gUnknown_03005560
	movs r2, 0xF0
_0811B168:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x9F
	bls _0811B168
	ldr r0, _0811B1C8 @ =sub_811B520
	bl SetVBlankCallback
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_811D6A8
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r1, [sp, 0x4]
	ldr r2, _0811B1CC @ =0x01000400
	mov r0, sp
	bl CpuSet
	ldr r0, _0811B1D0 @ =gUnknown_083FBB88
	ldr r1, [sp, 0x8]
	movs r2, 0xB0
	lsls r2, 2
	bl CpuSet
	ldr r0, _0811B1D4 @ =gFieldEffectObjectPalette10
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811B1BC: .4byte 0x0200c000
_0811B1C0: .4byte 0x00003f41
_0811B1C4: .4byte gUnknown_03005560
_0811B1C8: .4byte sub_811B520
_0811B1CC: .4byte 0x01000400
_0811B1D0: .4byte gUnknown_083FBB88
_0811B1D4: .4byte gFieldEffectObjectPalette10
	thumb_func_end sub_811B128

	thumb_func_start sub_811B1D8
sub_811B1D8: @ 811B1D8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	adds r7, r0, 0
	ldr r5, _0811B260 @ =gUnknown_083FDB44
	add r1, sp, 0xC
	add r0, sp, 0x8
	bl sub_811D6A8
	movs r1, 0
	ldr r0, [sp, 0x8]
	mov r9, r0
	ldr r6, _0811B264 @ =gUnknown_03004DE0
	mov r8, r6
	movs r0, 0xF0
	lsls r0, 8
	mov r12, r0
_0811B1FE:
	movs r0, 0
	lsls r3, r1, 16
	asrs r4, r3, 11
_0811B204:
	lsls r2, r0, 16
	asrs r2, 16
	adds r1, r4, r2
	lsls r1, 1
	add r1, r9
	ldrh r0, [r5]
	mov r6, r12
	orrs r0, r6
	strh r0, [r1]
	adds r2, 0x1
	lsls r2, 16
	adds r5, 0x2
	lsrs r0, r2, 16
	asrs r2, 16
	cmp r2, 0x1D
	ble _0811B204
	movs r1, 0x80
	lsls r1, 9
	adds r0, r3, r1
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _0811B1FE
	movs r6, 0x10
	ldrsh r2, [r7, r6]
	movs r1, 0x12
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, 0xA0
	str r0, [sp, 0x4]
	mov r0, r8
	movs r1, 0
	movs r3, 0x84
	bl sub_811D6E8
	ldrh r0, [r7, 0x8]
	adds r0, 0x1
	strh r0, [r7, 0x8]
	movs r0, 0x1
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811B260: .4byte gUnknown_083FDB44
_0811B264: .4byte gUnknown_03004DE0
	thumb_func_end sub_811B1D8

	thumb_func_start sub_811B268
sub_811B268: @ 811B268
	push {r4,lr}
	sub sp, 0x8
	adds r2, r0, 0
	ldr r1, _0811B2E8 @ =0x0200c000
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldrh r3, [r2, 0xE]
	movs r4, 0xE
	ldrsh r0, [r2, r4]
	adds r4, r1, 0
	cmp r0, 0
	beq _0811B28C
	subs r0, r3, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _0811B296
_0811B28C:
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
	movs r0, 0x2
	strh r0, [r2, 0xE]
_0811B296:
	ldrh r0, [r2, 0xA]
	lsls r0, 8
	ldrh r1, [r2, 0xC]
	orrs r0, r1
	strh r0, [r4, 0x10]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0xF
	ble _0811B2AE
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
_0811B2AE:
	ldrh r0, [r2, 0x10]
	adds r0, 0x8
	strh r0, [r2, 0x10]
	ldr r0, _0811B2EC @ =0xffffff00
	adds r1, r0, 0
	ldrh r3, [r2, 0x12]
	adds r1, r3
	strh r1, [r2, 0x12]
	ldr r0, _0811B2F0 @ =gUnknown_03004DE0
	movs r3, 0x10
	ldrsh r2, [r2, r3]
	lsls r1, 16
	asrs r1, 24
	str r1, [sp]
	movs r1, 0xA0
	str r1, [sp, 0x4]
	movs r1, 0
	movs r3, 0x84
	bl sub_811D6E8
	ldrb r0, [r4]
	adds r0, 0x1
	ldrb r1, [r4]
	strb r0, [r4]
	movs r0, 0
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811B2E8: .4byte 0x0200c000
_0811B2EC: .4byte 0xffffff00
_0811B2F0: .4byte gUnknown_03004DE0
	thumb_func_end sub_811B268

	thumb_func_start sub_811B2F4
sub_811B2F4: @ 811B2F4
	push {r4,r5,lr}
	sub sp, 0x8
	adds r3, r0, 0
	ldr r1, _0811B374 @ =0x0200c000
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldrh r2, [r3, 0xE]
	movs r4, 0xE
	ldrsh r0, [r3, r4]
	adds r4, r1, 0
	cmp r0, 0
	beq _0811B318
	subs r0, r2, 0x1
	strh r0, [r3, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _0811B322
_0811B318:
	ldrh r0, [r3, 0xA]
	subs r0, 0x1
	strh r0, [r3, 0xA]
	movs r0, 0x2
	strh r0, [r3, 0xE]
_0811B322:
	ldrh r0, [r3, 0xA]
	lsls r1, r0, 8
	ldrh r2, [r3, 0xC]
	orrs r1, r2
	strh r1, [r4, 0x10]
	lsls r0, 16
	cmp r0, 0
	bne _0811B338
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_0811B338:
	ldrh r0, [r3, 0x10]
	adds r0, 0x8
	strh r0, [r3, 0x10]
	ldr r5, _0811B378 @ =0xffffff00
	adds r1, r5, 0
	ldrh r0, [r3, 0x12]
	adds r1, r0
	strh r1, [r3, 0x12]
	ldr r0, _0811B37C @ =gUnknown_03004DE0
	movs r5, 0x10
	ldrsh r2, [r3, r5]
	lsls r1, 16
	asrs r1, 24
	str r1, [sp]
	movs r1, 0xA0
	str r1, [sp, 0x4]
	movs r1, 0
	movs r3, 0x84
	bl sub_811D6E8
	ldrb r0, [r4]
	adds r0, 0x1
	ldrb r1, [r4]
	strb r0, [r4]
	movs r0, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811B374: .4byte 0x0200c000
_0811B378: .4byte 0xffffff00
_0811B37C: .4byte gUnknown_03004DE0
	thumb_func_end sub_811B2F4

	thumb_func_start sub_811B380
sub_811B380: @ 811B380
	push {r4-r7,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r5, _0811B3E0 @ =0x0200c000
	ldrb r0, [r5]
	movs r7, 0
	strb r7, [r5]
	ldrh r0, [r4, 0x10]
	adds r0, 0x8
	strh r0, [r4, 0x10]
	ldr r0, _0811B3E4 @ =0xffffff00
	adds r1, r0, 0
	ldrh r3, [r4, 0x12]
	adds r1, r3
	strh r1, [r4, 0x12]
	ldr r0, _0811B3E8 @ =gUnknown_03004DE0
	movs r3, 0x10
	ldrsh r2, [r4, r3]
	lsls r1, 16
	asrs r1, 24
	str r1, [sp]
	movs r6, 0xA0
	str r6, [sp, 0x4]
	movs r1, 0
	movs r3, 0x84
	bl sub_811D6E8
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bgt _0811B3CE
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	strh r6, [r4, 0xA]
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r4, 0xC]
	strh r7, [r4, 0xE]
_0811B3CE:
	ldrb r0, [r5]
	adds r0, 0x1
	ldrb r1, [r5]
	strb r0, [r5]
	movs r0, 0
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811B3E0: .4byte 0x0200c000
_0811B3E4: .4byte 0xffffff00
_0811B3E8: .4byte gUnknown_03004DE0
	thumb_func_end sub_811B380

	thumb_func_start sub_811B3EC
sub_811B3EC: @ 811B3EC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0811B488 @ =0x0200c000
	ldrb r1, [r0]
	movs r3, 0
	strb r3, [r0]
	ldrh r2, [r4, 0xC]
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	ldr r0, _0811B48C @ =0x000003ff
	cmp r1, r0
	bgt _0811B40A
	adds r0, r2, 0
	adds r0, 0x80
	strh r0, [r4, 0xC]
_0811B40A:
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0811B426
	ldrh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 24
	subs r0, r1, r0
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bge _0811B426
	strh r3, [r4, 0xA]
_0811B426:
	ldr r0, _0811B490 @ =gUnknown_03004DE0
	movs r1, 0xA
	ldrsh r3, [r4, r1]
	movs r1, 0x78
	movs r2, 0x50
	bl sub_811D764
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0811B462
	ldr r1, _0811B494 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _0811B498 @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _0811B49C @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_811D6D4
	ldr r0, _0811B4A0 @ =sub_811B0F0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0811B462:
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0811B476
	adds r0, r1, 0x1
	strh r0, [r4, 0xE]
	ldr r0, _0811B4A4 @ =sub_811B54C
	bl SetVBlankCallback
_0811B476:
	ldr r0, _0811B488 @ =0x0200c000
	ldrb r1, [r0]
	adds r1, 0x1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811B488: .4byte 0x0200c000
_0811B48C: .4byte 0x000003ff
_0811B490: .4byte gUnknown_03004DE0
_0811B494: .4byte 0x040000b0
_0811B498: .4byte 0x0000c5ff
_0811B49C: .4byte 0x00007fff
_0811B4A0: .4byte sub_811B0F0
_0811B4A4: .4byte sub_811B54C
	thumb_func_end sub_811B3EC

	thumb_func_start sub_811B4A8
sub_811B4A8: @ 811B4A8
	push {lr}
	ldr r1, _0811B500 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _0811B504 @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _0811B508 @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_811D67C
	ldr r2, _0811B50C @ =0x0200c000
	ldrb r0, [r2]
	cmp r0, 0
	beq _0811B4DE
	ldr r1, _0811B510 @ =0x040000d4
	ldr r0, _0811B514 @ =gUnknown_03004DE0
	str r0, [r1]
	movs r3, 0xF0
	lsls r3, 3
	adds r0, r3
	str r0, [r1, 0x4]
	ldr r0, _0811B518 @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811B4DE:
	ldr r1, _0811B51C @ =REG_WININ
	ldrh r0, [r2, 0x2]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r2, 0x4]
	strh r0, [r1]
	subs r1, 0x6
	ldrh r0, [r2, 0x8]
	strh r0, [r1]
	adds r1, 0xC
	ldrh r0, [r2, 0xE]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r2, 0x10]
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0811B500: .4byte 0x040000b0
_0811B504: .4byte 0x0000c5ff
_0811B508: .4byte 0x00007fff
_0811B50C: .4byte 0x0200c000
_0811B510: .4byte 0x040000d4
_0811B514: .4byte gUnknown_03004DE0
_0811B518: .4byte 0x800000a0
_0811B51C: .4byte REG_WININ
	thumb_func_end sub_811B4A8

	thumb_func_start sub_811B520
sub_811B520: @ 811B520
	push {lr}
	bl sub_811B4A8
	ldr r1, _0811B53C @ =0x040000b0
	ldr r0, _0811B540 @ =gUnknown_03005560
	str r0, [r1]
	ldr r0, _0811B544 @ =REG_BG0HOFS
	str r0, [r1, 0x4]
	ldr r0, _0811B548 @ =0xa2400001
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_0811B53C: .4byte 0x040000b0
_0811B540: .4byte gUnknown_03005560
_0811B544: .4byte REG_BG0HOFS
_0811B548: .4byte 0xa2400001
	thumb_func_end sub_811B520

	thumb_func_start sub_811B54C
sub_811B54C: @ 811B54C
	push {lr}
	bl sub_811B4A8
	ldr r1, _0811B568 @ =0x040000b0
	ldr r0, _0811B56C @ =gUnknown_03005560
	str r0, [r1]
	ldr r0, _0811B570 @ =REG_WIN0H
	str r0, [r1, 0x4]
	ldr r0, _0811B574 @ =0xa2400001
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_0811B568: .4byte 0x040000b0
_0811B56C: .4byte gUnknown_03005560
_0811B570: .4byte REG_WIN0H
_0811B574: .4byte 0xa2400001
	thumb_func_end sub_811B54C

	thumb_func_start sub_811B578
sub_811B578: @ 811B578
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811B5A8 @ =gUnknown_083FD7D8
	ldr r2, _0811B5AC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811B58A:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811B58A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811B5A8: .4byte gUnknown_083FD7D8
_0811B5AC: .4byte gTasks
	thumb_func_end sub_811B578

	thumb_func_start sub_811B5B0
sub_811B5B0: @ 811B5B0
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	add r0, sp, 0x4
	add r1, sp, 0x8
	bl sub_811D6A8
	ldr r0, _0811B5F0 @ =gUnknown_083FC108
	ldr r1, [sp, 0x8]
	movs r2, 0x20
	bl CpuSet
	movs r0, 0
	str r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, _0811B5F4 @ =0x05000200
	mov r0, sp
	bl CpuSet
	ldr r0, _0811B5F8 @ =gFieldEffectObjectPalette10
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811B5F0: .4byte gUnknown_083FC108
_0811B5F4: .4byte 0x05000200
_0811B5F8: .4byte gFieldEffectObjectPalette10
	thumb_func_end sub_811B5B0

	thumb_func_start sub_811B5FC
sub_811B5FC: @ 811B5FC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r7, r0, 0
	ldr r1, _0811B67C @ =gUnknown_083FD7E4
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	add r4, sp, 0x4
	ldr r1, _0811B680 @ =gUnknown_083FD7E8
	adds r0, r4, 0
	movs r2, 0xA
	bl memcpy
	bl Random
	movs r5, 0x1
	ands r5, r0
	movs r1, 0
	mov r8, r4
	ldr r6, _0811B684 @ =gUnknown_0202FF84
_0811B62A:
	lsls r5, 16
	asrs r5, 16
	lsls r0, r5, 1
	add r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	str r0, [r6]
	lsls r4, r1, 16
	asrs r4, 16
	lsls r0, r4, 5
	adds r0, 0x10
	str r0, [r6, 0x4]
	str r5, [r6, 0x8]
	lsls r0, r4, 1
	add r0, r8
	movs r1, 0
	ldrsh r0, [r0, r1]
	str r0, [r6, 0xC]
	movs r0, 0x2D
	bl FieldEffectStart
	adds r4, 0x1
	lsls r4, 16
	movs r0, 0x1
	eors r5, r0
	lsls r5, 16
	lsrs r5, 16
	lsrs r1, r4, 16
	asrs r4, 16
	cmp r4, 0x4
	ble _0811B62A
	ldrh r0, [r7, 0x8]
	adds r0, 0x1
	strh r0, [r7, 0x8]
	movs r0, 0
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811B67C: .4byte gUnknown_083FD7E4
_0811B680: .4byte gUnknown_083FD7E8
_0811B684: .4byte gUnknown_0202FF84
	thumb_func_end sub_811B5FC

	thumb_func_start sub_811B688
sub_811B688: @ 811B688
	push {lr}
	movs r0, 0x2D
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _0811B6A8
	bl sub_811D6D4
	ldr r0, _0811B6B0 @ =sub_811B578
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0811B6A8:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0811B6B0: .4byte sub_811B578
	thumb_func_end sub_811B688

	thumb_func_start FldEff_Pokeball
FldEff_Pokeball: @ 811B6B4
	push {r4,r5,lr}
	ldr r0, _0811B710 @ =gSpriteTemplate_83FD98C
	ldr r5, _0811B714 @ =gUnknown_0202FF84
	movs r2, 0
	ldrsh r1, [r5, r2]
	movs r3, 0x4
	ldrsh r2, [r5, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0811B718 @ =gSprites
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r4, r1
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x5]
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, [r5, 0x8]
	strh r0, [r4, 0x2E]
	ldr r0, [r5, 0xC]
	strh r0, [r4, 0x30]
	ldr r0, _0811B71C @ =0x0000ffff
	strh r0, [r4, 0x32]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	ldrb r1, [r5, 0x8]
	adds r0, r4, 0
	bl StartSpriteAffineAnim
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811B710: .4byte gSpriteTemplate_83FD98C
_0811B714: .4byte gUnknown_0202FF84
_0811B718: .4byte gSprites
_0811B71C: .4byte 0x0000ffff
	thumb_func_end FldEff_Pokeball

	thumb_func_start sub_811B720
sub_811B720: @ 811B720
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r1, _0811B740 @ =gUnknown_083FD7F2
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0811B744
	subs r0, r1, 0x1
	strh r0, [r4, 0x30]
	b _0811B7D6
	.align 2, 0
_0811B740: .4byte gUnknown_083FD7F2
_0811B744:
	ldrh r0, [r4, 0x20]
	lsls r1, r0, 16
	lsrs r0, r1, 16
	cmp r0, 0xF0
	bhi _0811B7B2
	asrs r0, r1, 19
	lsls r0, 16
	ldrh r1, [r4, 0x22]
	lsls r1, 16
	asrs r1, 19
	lsls r1, 16
	lsrs r1, 16
	lsrs r2, r0, 16
	asrs r5, r0, 16
	movs r3, 0x32
	ldrsh r0, [r4, r3]
	cmp r5, r0
	beq _0811B7B2
	strh r2, [r4, 0x32]
	ldr r0, _0811B7E0 @ =REG_BG0CNT
	ldrh r2, [r0]
	lsrs r2, 8
	movs r0, 0x1F
	ands r2, r0
	lsls r2, 11
	movs r0, 0xC0
	lsls r0, 19
	adds r2, r0
	lsls r1, 16
	asrs r1, 16
	subs r0, r1, 0x2
	lsls r0, 5
	adds r0, r5
	lsls r0, 1
	adds r0, r2
	ldr r6, _0811B7E4 @ =0x0000f001
	adds r3, r6, 0
	strh r3, [r0]
	subs r0, r1, 0x1
	lsls r0, 5
	adds r0, r5
	lsls r0, 1
	adds r0, r2
	strh r3, [r0]
	lsls r0, r1, 5
	adds r0, r5
	lsls r0, 1
	adds r0, r2
	strh r3, [r0]
	adds r1, 0x1
	lsls r1, 5
	adds r1, r5
	lsls r1, 1
	adds r1, r2
	strh r3, [r1]
_0811B7B2:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	adds r0, 0xF
	lsls r0, 16
	movs r1, 0x87
	lsls r1, 17
	cmp r0, r1
	bls _0811B7D6
	adds r0, r4, 0
	movs r1, 0x2D
	bl FieldEffectStop
_0811B7D6:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811B7E0: .4byte REG_BG0CNT
_0811B7E4: .4byte 0x0000f001
	thumb_func_end sub_811B720

	thumb_func_start sub_811B7E8
sub_811B7E8: @ 811B7E8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811B818 @ =gUnknown_083FD7F8
	ldr r2, _0811B81C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811B7FA:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811B7FA
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811B818: .4byte gUnknown_083FD7F8
_0811B81C: .4byte gTasks
	thumb_func_end sub_811B7E8

	thumb_func_start sub_811B820
sub_811B820: @ 811B820
	push {r4,lr}
	adds r4, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	ldr r1, _0811B870 @ =0x0200c000
	movs r0, 0
	strh r0, [r1, 0x2]
	movs r0, 0x3F
	strh r0, [r1, 0x4]
	ldr r0, _0811B874 @ =0x0000f0f1
	strh r0, [r1, 0x6]
	movs r0, 0xA0
	strh r0, [r1, 0x8]
	movs r1, 0
	ldr r3, _0811B878 @ =gUnknown_03005560
	ldr r2, _0811B87C @ =0x0000f3f4
_0811B844:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x9F
	bls _0811B844
	ldr r0, _0811B880 @ =sub_811BC2C
	bl SetVBlankCallback
	ldr r1, _0811B870 @ =0x0200c000
	movs r0, 0x78
	strh r0, [r1, 0x2C]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811B870: .4byte 0x0200c000
_0811B874: .4byte 0x0000f0f1
_0811B878: .4byte gUnknown_03005560
_0811B87C: .4byte 0x0000f3f4
_0811B880: .4byte sub_811BC2C
	thumb_func_end sub_811B820

	thumb_func_start sub_811B884
sub_811B884: @ 811B884
	push {r4-r6,lr}
	sub sp, 0xC
	adds r6, r0, 0
	ldr r4, _0811B904 @ =0x0200c000
	ldrb r0, [r4]
	movs r0, 0
	strb r0, [r4]
	adds r0, r4, 0
	adds r0, 0x24
	movs r1, 0x2C
	ldrsh r3, [r4, r1]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0x78
	movs r2, 0x50
	bl sub_811D8FC
	ldr r5, _0811B908 @ =gUnknown_03004DE0
_0811B8B0:
	movs r3, 0x2A
	ldrsh r2, [r4, r3]
	lsls r2, 1
	adds r2, r5
	ldrh r0, [r4, 0x28]
	adds r0, 0x1
	movs r3, 0xF0
	lsls r3, 7
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	adds r0, r4, 0
	adds r0, 0x24
	movs r1, 0x1
	movs r2, 0x1
	bl sub_811D978
	lsls r0, 24
	cmp r0, 0
	beq _0811B8B0
	ldr r2, _0811B904 @ =0x0200c000
	ldrh r0, [r2, 0x2C]
	adds r0, 0x10
	strh r0, [r2, 0x2C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xEF
	ble _0811B8F2
	movs r0, 0
	strh r0, [r2, 0x2E]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_0811B8F2:
	ldrb r0, [r2]
	adds r0, 0x1
	ldrb r1, [r2]
	strb r0, [r2]
	movs r0, 0
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811B904: .4byte 0x0200c000
_0811B908: .4byte gUnknown_03004DE0
	thumb_func_end sub_811B884

	thumb_func_start sub_811B90C
sub_811B90C: @ 811B90C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r7, r0, 0
	add r1, sp, 0xC
	movs r0, 0
	strb r0, [r1]
	ldr r4, _0811B988 @ =0x0200c000
	ldrb r0, [r4]
	movs r0, 0
	strb r0, [r4]
	adds r0, r4, 0
	adds r0, 0x24
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0xF0
	bl sub_811D8FC
	adds r6, r4, 0
	ldr r5, _0811B98C @ =gUnknown_03004DE0
	mov r8, r5
	add r5, sp, 0xC
_0811B946:
	movs r1, 0x78
	ldrh r0, [r4, 0x28]
	adds r0, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0x4F
	ble _0811B95C
	ldrh r1, [r4, 0x28]
	movs r3, 0xF0
_0811B95C:
	movs r0, 0x2A
	ldrsh r2, [r4, r0]
	lsls r2, 1
	add r2, r8
	lsls r1, 16
	asrs r1, 8
	lsls r0, r3, 16
	asrs r3, r0, 16
	orrs r3, r1
	strh r3, [r2]
	ldrb r0, [r5]
	cmp r0, 0
	bne _0811B990
	adds r0, r4, 0
	adds r0, 0x24
	movs r1, 0x1
	movs r2, 0x1
	bl sub_811D978
	strb r0, [r5]
	b _0811B946
	.align 2, 0
_0811B988: .4byte 0x0200c000
_0811B98C: .4byte gUnknown_03004DE0
_0811B990:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x8
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0x9F
	ble _0811B9AA
	movs r0, 0xF0
	strh r0, [r4, 0x2C]
	ldrh r0, [r7, 0x8]
	adds r0, 0x1
	strh r0, [r7, 0x8]
	b _0811B9D0
_0811B9AA:
	movs r2, 0x2A
	ldrsh r0, [r4, r2]
	cmp r0, r1
	bge _0811B9D0
	ldr r4, _0811B9E8 @ =gUnknown_03004DE0
	ldr r2, _0811B9EC @ =0x0200c000
_0811B9B6:
	ldrh r0, [r2, 0x2A]
	adds r0, 0x1
	strh r0, [r2, 0x2A]
	lsls r0, 16
	asrs r0, 15
	adds r0, r4
	strh r3, [r0]
	movs r5, 0x2A
	ldrsh r1, [r2, r5]
	movs r5, 0x2E
	ldrsh r0, [r2, r5]
	cmp r1, r0
	blt _0811B9B6
_0811B9D0:
	ldrb r0, [r6]
	adds r0, 0x1
	ldrb r1, [r6]
	strb r0, [r6]
	movs r0, 0
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811B9E8: .4byte gUnknown_03004DE0
_0811B9EC: .4byte 0x0200c000
	thumb_func_end sub_811B90C

	thumb_func_start sub_811B9F0
sub_811B9F0: @ 811B9F0
	push {r4-r6,lr}
	sub sp, 0xC
	adds r6, r0, 0
	ldr r4, _0811BA68 @ =0x0200c000
	ldrb r0, [r4]
	movs r0, 0
	strb r0, [r4]
	adds r0, r4, 0
	adds r0, 0x24
	movs r1, 0x2C
	ldrsh r3, [r4, r1]
	movs r1, 0xA0
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0x78
	movs r2, 0x50
	bl sub_811D8FC
	ldr r5, _0811BA6C @ =gUnknown_03004DE0
_0811BA1A:
	movs r0, 0x2A
	ldrsh r2, [r4, r0]
	lsls r2, 1
	adds r2, r5
	ldrh r0, [r4, 0x28]
	lsls r0, 8
	movs r1, 0xF0
	orrs r0, r1
	strh r0, [r2]
	adds r0, r4, 0
	adds r0, 0x24
	movs r1, 0x1
	movs r2, 0x1
	bl sub_811D978
	lsls r0, 24
	cmp r0, 0
	beq _0811BA1A
	ldr r2, _0811BA68 @ =0x0200c000
	ldrh r0, [r2, 0x2C]
	subs r0, 0x10
	strh r0, [r2, 0x2C]
	lsls r0, 16
	cmp r0, 0
	bgt _0811BA56
	movs r0, 0xA0
	strh r0, [r2, 0x2E]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_0811BA56:
	ldrb r0, [r2]
	adds r0, 0x1
	ldrb r1, [r2]
	strb r0, [r2]
	movs r0, 0
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811BA68: .4byte 0x0200c000
_0811BA6C: .4byte gUnknown_03004DE0
	thumb_func_end sub_811B9F0

	thumb_func_start sub_811BA70
sub_811BA70: @ 811BA70
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	mov r8, r0
	add r1, sp, 0xC
	movs r0, 0
	strb r0, [r1]
	ldr r4, _0811BAF0 @ =0x0200c000
	ldrb r0, [r4]
	movs r0, 0
	strb r0, [r4]
	adds r0, r4, 0
	adds r0, 0x24
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0
	bl sub_811D8FC
	ldr r3, _0811BAF4 @ =gUnknown_03004DE0
	mov r9, r3
	mov r10, r4
	add r6, sp, 0xC
_0811BAAE:
	movs r5, 0x2A
	ldrsh r0, [r4, r5]
	lsls r0, 1
	mov r7, r9
	adds r5, r0, r7
	ldrb r1, [r5]
	ldrh r2, [r4, 0x28]
	adds r3, r2, 0
	movs r7, 0x2E
	ldrsh r0, [r4, r7]
	cmp r0, 0x50
	bgt _0811BACA
	movs r2, 0x78
	adds r1, r3, 0
_0811BACA:
	lsls r0, r2, 16
	asrs r0, 8
	lsls r1, 16
	asrs r1, 16
	orrs r1, r0
	movs r3, 0
	strh r1, [r5]
	ldrb r0, [r6]
	cmp r0, 0
	bne _0811BAF8
	adds r0, r4, 0
	adds r0, 0x24
	movs r1, 0x1
	movs r2, 0x1
	bl sub_811D978
	strb r0, [r6]
	b _0811BAAE
	.align 2, 0
_0811BAF0: .4byte 0x0200c000
_0811BAF4: .4byte gUnknown_03004DE0
_0811BAF8:
	ldrh r0, [r4, 0x2E]
	subs r0, 0x8
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	bgt _0811BB12
	strh r3, [r4, 0x2C]
	mov r1, r8
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _0811BB3A
_0811BB12:
	movs r3, 0x2A
	ldrsh r0, [r4, r3]
	cmp r0, r2
	ble _0811BB3A
	ldr r4, _0811BB58 @ =gUnknown_03004DE0
	ldr r2, _0811BB5C @ =0x0200c000
	adds r3, r1, 0
_0811BB20:
	ldrh r0, [r2, 0x2A]
	subs r0, 0x1
	strh r0, [r2, 0x2A]
	lsls r0, 16
	asrs r0, 15
	adds r0, r4
	strh r3, [r0]
	movs r5, 0x2A
	ldrsh r1, [r2, r5]
	movs r7, 0x2E
	ldrsh r0, [r2, r7]
	cmp r1, r0
	bgt _0811BB20
_0811BB3A:
	mov r1, r10
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r1, [r1]
	mov r2, r10
	strb r0, [r2]
	movs r0, 0
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811BB58: .4byte gUnknown_03004DE0
_0811BB5C: .4byte 0x0200c000
	thumb_func_end sub_811BA70

	thumb_func_start sub_811BB60
sub_811BB60: @ 811BB60
	push {r4-r6,lr}
	sub sp, 0xC
	adds r6, r0, 0
	ldr r4, _0811BBE4 @ =0x0200c000
	ldrb r0, [r4]
	movs r1, 0
	strb r1, [r4]
	adds r0, r4, 0
	adds r0, 0x24
	movs r2, 0x2C
	ldrsh r3, [r4, r2]
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0x78
	movs r2, 0x50
	bl sub_811D8FC
	ldr r5, _0811BBE8 @ =gUnknown_03004DE0
_0811BB88:
	movs r2, 0x78
	ldrh r3, [r4, 0x28]
	movs r1, 0x28
	ldrsh r0, [r4, r1]
	cmp r0, 0x77
	ble _0811BB98
	movs r2, 0
	movs r3, 0xF0
_0811BB98:
	movs r0, 0x2A
	ldrsh r1, [r4, r0]
	lsls r1, 1
	adds r1, r5
	lsls r2, 8
	lsls r0, r3, 16
	asrs r0, 16
	orrs r0, r2
	strh r0, [r1]
	adds r0, r4, 0
	adds r0, 0x24
	movs r1, 0x1
	movs r2, 0x1
	bl sub_811D978
	lsls r0, 24
	cmp r0, 0
	beq _0811BB88
	ldr r2, _0811BBE4 @ =0x0200c000
	ldrh r0, [r2, 0x2C]
	adds r0, 0x10
	strh r0, [r2, 0x2C]
	movs r1, 0x28
	ldrsh r0, [r2, r1]
	cmp r0, 0x78
	ble _0811BBD2
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_0811BBD2:
	ldrb r0, [r2]
	adds r0, 0x1
	ldrb r1, [r2]
	strb r0, [r2]
	movs r0, 0
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811BBE4: .4byte 0x0200c000
_0811BBE8: .4byte gUnknown_03004DE0
	thumb_func_end sub_811BB60

	thumb_func_start sub_811BBEC
sub_811BBEC: @ 811BBEC
	push {lr}
	ldr r1, _0811BC1C @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _0811BC20 @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _0811BC24 @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_811D6D4
	ldr r0, _0811BC28 @ =sub_811B7E8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0811BC1C: .4byte 0x040000b0
_0811BC20: .4byte 0x0000c5ff
_0811BC24: .4byte 0x00007fff
_0811BC28: .4byte sub_811B7E8
	thumb_func_end sub_811BBEC

	thumb_func_start sub_811BC2C
sub_811BC2C: @ 811BC2C
	push {r4,lr}
	ldr r4, _0811BC94 @ =0x040000b0
	ldrh r1, [r4, 0xA]
	ldr r0, _0811BC98 @ =0x0000c5ff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0xA]
	ldr r0, _0811BC9C @ =0x00007fff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xA]
	bl sub_811D67C
	ldr r2, _0811BCA0 @ =0x0200c000
	ldrb r0, [r2]
	cmp r0, 0
	beq _0811BC62
	ldr r1, _0811BCA4 @ =0x040000d4
	ldr r0, _0811BCA8 @ =gUnknown_03004DE0
	str r0, [r1]
	movs r3, 0xF0
	lsls r3, 3
	adds r0, r3
	str r0, [r1, 0x4]
	ldr r0, _0811BCAC @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811BC62:
	ldr r1, _0811BCB0 @ =REG_WININ
	ldrh r0, [r2, 0x2]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r2, 0x4]
	strh r0, [r1]
	subs r1, 0x6
	ldrh r0, [r2, 0x8]
	strh r0, [r1]
	ldr r2, _0811BCB4 @ =REG_WIN0H
	ldr r0, _0811BCA8 @ =gUnknown_03004DE0
	movs r1, 0xF0
	lsls r1, 3
	adds r0, r1
	ldrh r1, [r0]
	strh r1, [r2]
	str r0, [r4]
	str r2, [r4, 0x4]
	ldr r0, _0811BCB8 @ =0xa2400001
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811BC94: .4byte 0x040000b0
_0811BC98: .4byte 0x0000c5ff
_0811BC9C: .4byte 0x00007fff
_0811BCA0: .4byte 0x0200c000
_0811BCA4: .4byte 0x040000d4
_0811BCA8: .4byte gUnknown_03004DE0
_0811BCAC: .4byte 0x800000a0
_0811BCB0: .4byte REG_WININ
_0811BCB4: .4byte REG_WIN0H
_0811BCB8: .4byte 0xa2400001
	thumb_func_end sub_811BC2C

	thumb_func_start sub_811BCBC
sub_811BCBC: @ 811BCBC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811BCEC @ =gUnknown_083FD814
	ldr r2, _0811BCF0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811BCCE:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811BCCE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811BCEC: .4byte gUnknown_083FD814
_0811BCF0: .4byte gTasks
	thumb_func_end sub_811BCBC

	thumb_func_start sub_811BCF4
sub_811BCF4: @ 811BCF4
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	movs r2, 0
	ldr r4, _0811BD48 @ =gUnknown_03005560
	ldr r3, _0811BD4C @ =0x0200c000
_0811BD06:
	lsls r0, r2, 1
	adds r0, r4
	ldrh r1, [r3, 0x16]
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x9F
	bls _0811BD06
	ldr r0, _0811BD50 @ =sub_811BE3C
	bl SetVBlankCallback
	ldr r0, _0811BD54 @ =sub_811BE74
	bl SetHBlankCallback
	ldr r2, _0811BD58 @ =0x04000200
	ldrh r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0811BD5C @ =REG_DISPSTAT
	ldrh r0, [r2]
	movs r1, 0x10
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811BD48: .4byte gUnknown_03005560
_0811BD4C: .4byte 0x0200c000
_0811BD50: .4byte sub_811BE3C
_0811BD54: .4byte sub_811BE74
_0811BD58: .4byte 0x04000200
_0811BD5C: .4byte REG_DISPSTAT
	thumb_func_end sub_811BCF4

	thumb_func_start sub_811BD60
sub_811BD60: @ 811BD60
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r6, r0, 0
	ldr r1, _0811BE28 @ =0x0200c000
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldrh r2, [r6, 0xC]
	lsls r1, r2, 16
	asrs r0, r1, 24
	lsls r0, 16
	lsrs r3, r0, 16
	ldrh r4, [r6, 0xA]
	movs r0, 0xC0
	lsls r0, 1
	mov r8, r0
	movs r5, 0x80
	lsls r5, 3
	adds r0, r4, r5
	strh r0, [r6, 0xA]
	ldr r0, _0811BE2C @ =0x1fff0000
	cmp r1, r0
	bgt _0811BD9A
	movs r1, 0xC0
	lsls r1, 1
	adds r0, r2, r1
	strh r0, [r6, 0xC]
_0811BD9A:
	movs r5, 0
	lsls r7, r3, 16
_0811BD9E:
	lsrs r0, r4, 8
	asrs r1, r7, 16
	bl Sin
	ldr r1, _0811BE30 @ =gUnknown_03004DE0
	lsls r2, r5, 1
	adds r2, r1
	ldr r1, _0811BE28 @ =0x0200c000
	ldrh r1, [r1, 0x16]
	adds r0, r1
	strh r0, [r2]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r1, r8
	adds r0, r4, r1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r5, 0x9F
	bls _0811BD9E
	ldrh r0, [r6, 0xE]
	adds r0, 0x1
	strh r0, [r6, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x51
	bne _0811BDEC
	ldrh r0, [r6, 0x10]
	adds r0, 0x1
	strh r0, [r6, 0x10]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x2
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r3, 0x10
	bl BeginNormalPaletteFade
_0811BDEC:
	movs r5, 0x10
	ldrsh r0, [r6, r5]
	cmp r0, 0
	beq _0811BE0E
	ldr r0, _0811BE34 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811BE0E
	ldr r0, _0811BE38 @ =sub_811BCBC
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0811BE0E:
	ldr r0, _0811BE28 @ =0x0200c000
	ldrb r1, [r0]
	adds r1, 0x1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, 0
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811BE28: .4byte 0x0200c000
_0811BE2C: .4byte 0x1fff0000
_0811BE30: .4byte gUnknown_03004DE0
_0811BE34: .4byte gPaletteFade
_0811BE38: .4byte sub_811BCBC
	thumb_func_end sub_811BD60

	thumb_func_start sub_811BE3C
sub_811BE3C: @ 811BE3C
	push {lr}
	bl sub_811D67C
	ldr r0, _0811BE64 @ =0x0200c000
	ldrb r0, [r0]
	cmp r0, 0
	beq _0811BE5E
	ldr r1, _0811BE68 @ =0x040000d4
	ldr r0, _0811BE6C @ =gUnknown_03004DE0
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _0811BE70 @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811BE5E:
	pop {r0}
	bx r0
	.align 2, 0
_0811BE64: .4byte 0x0200c000
_0811BE68: .4byte 0x040000d4
_0811BE6C: .4byte gUnknown_03004DE0
_0811BE70: .4byte 0x800000a0
	thumb_func_end sub_811BE3C

	thumb_func_start sub_811BE74
sub_811BE74: @ 811BE74
	ldr r1, _0811BE94 @ =gUnknown_03004DE0
	ldr r0, _0811BE98 @ =REG_VCOUNT
	ldrh r0, [r0]
	lsls r0, 1
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r2
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _0811BE9C @ =REG_BG1VOFS
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	bx lr
	.align 2, 0
_0811BE94: .4byte gUnknown_03004DE0
_0811BE98: .4byte REG_VCOUNT
_0811BE9C: .4byte REG_BG1VOFS
	thumb_func_end sub_811BE74

	thumb_func_start sub_811BEA0
sub_811BEA0: @ 811BEA0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811BED0 @ =gUnknown_083FD81C
	ldr r2, _0811BED4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811BEB2:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811BEB2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811BED0: .4byte gUnknown_083FD81C
_0811BED4: .4byte gTasks
	thumb_func_end sub_811BEA0

	thumb_func_start sub_811BED8
sub_811BED8: @ 811BED8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	ldr r1, _0811BF20 @ =0x0200c000
	movs r2, 0
	movs r0, 0x3F
	strh r0, [r1, 0x2]
	strh r2, [r1, 0x4]
	movs r0, 0xF0
	strh r0, [r1, 0x6]
	movs r0, 0xA0
	strh r0, [r1, 0x8]
	movs r1, 0
	ldr r3, _0811BF24 @ =gUnknown_03005560
	movs r2, 0xF2
_0811BEFC:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x9F
	bls _0811BEFC
	ldr r0, _0811BF28 @ =sub_811C004
	bl SetVBlankCallback
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811BF20: .4byte 0x0200c000
_0811BF24: .4byte gUnknown_03005560
_0811BF28: .4byte sub_811C004
	thumb_func_end sub_811BED8

	thumb_func_start sub_811BF2C
sub_811BF2C: @ 811BF2C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	ldr r1, _0811BFBC @ =0x0200c000
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldr r7, _0811BFC0 @ =gUnknown_03004DE0
	ldrh r0, [r4, 0xC]
	ldrb r5, [r4, 0xC]
	adds r0, 0x10
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0xA]
	adds r0, 0x8
	strh r0, [r4, 0xA]
	movs r6, 0
	movs r0, 0x1
	mov r8, r0
_0811BF52:
	adds r0, r5, 0
	movs r1, 0x28
	bl Sin
	ldrh r1, [r4, 0xA]
	adds r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r0, 0
	bge _0811BF68
	movs r1, 0
_0811BF68:
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xF0
	ble _0811BF72
	movs r1, 0xF0
_0811BF72:
	lsls r0, r1, 16
	asrs r0, 16
	lsls r1, r0, 8
	movs r2, 0xF1
	orrs r1, r2
	strh r1, [r7]
	cmp r0, 0xEF
	bgt _0811BF86
	movs r0, 0
	mov r8, r0
_0811BF86:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r5, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, 0x2
	cmp r6, 0x9F
	bls _0811BF52
	mov r1, r8
	cmp r1, 0
	beq _0811BFA4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0811BFA4:
	ldr r0, _0811BFBC @ =0x0200c000
	ldrb r1, [r0]
	adds r1, 0x1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811BFBC: .4byte 0x0200c000
_0811BFC0: .4byte gUnknown_03004DE0
	thumb_func_end sub_811BF2C

	thumb_func_start sub_811BFC4
sub_811BFC4: @ 811BFC4
	push {lr}
	ldr r1, _0811BFF4 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _0811BFF8 @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _0811BFFC @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_811D6D4
	ldr r0, _0811C000 @ =sub_811BEA0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0811BFF4: .4byte 0x040000b0
_0811BFF8: .4byte 0x0000c5ff
_0811BFFC: .4byte 0x00007fff
_0811C000: .4byte sub_811BEA0
	thumb_func_end sub_811BFC4

	thumb_func_start sub_811C004
sub_811C004: @ 811C004
	push {r4,lr}
	ldr r4, _0811C060 @ =0x040000b0
	ldrh r1, [r4, 0xA]
	ldr r0, _0811C064 @ =0x0000c5ff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0xA]
	ldr r0, _0811C068 @ =0x00007fff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xA]
	bl sub_811D67C
	ldr r2, _0811C06C @ =0x0200c000
	ldrb r0, [r2]
	cmp r0, 0
	beq _0811C03A
	ldr r1, _0811C070 @ =0x040000d4
	ldr r0, _0811C074 @ =gUnknown_03004DE0
	str r0, [r1]
	movs r3, 0xF0
	lsls r3, 3
	adds r0, r3
	str r0, [r1, 0x4]
	ldr r0, _0811C078 @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811C03A:
	ldr r1, _0811C07C @ =REG_WININ
	ldrh r0, [r2, 0x2]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r2, 0x4]
	strh r0, [r1]
	subs r1, 0x6
	ldrh r0, [r2, 0x8]
	strh r0, [r1]
	ldr r0, _0811C080 @ =gUnknown_03005560
	str r0, [r4]
	ldr r0, _0811C084 @ =REG_WIN0H
	str r0, [r4, 0x4]
	ldr r0, _0811C088 @ =0xa2400001
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811C060: .4byte 0x040000b0
_0811C064: .4byte 0x0000c5ff
_0811C068: .4byte 0x00007fff
_0811C06C: .4byte 0x0200c000
_0811C070: .4byte 0x040000d4
_0811C074: .4byte gUnknown_03004DE0
_0811C078: .4byte 0x800000a0
_0811C07C: .4byte REG_WININ
_0811C080: .4byte gUnknown_03005560
_0811C084: .4byte REG_WIN0H
_0811C088: .4byte 0xa2400001
	thumb_func_end sub_811C004

	thumb_func_start sub_811C08C
sub_811C08C: @ 811C08C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811C0A8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	strh r2, [r1, 0x26]
	bl sub_811C12C
	pop {r0}
	bx r0
	.align 2, 0
_0811C0A8: .4byte gTasks
	thumb_func_end sub_811C08C

	thumb_func_start sub_811C0AC
sub_811C0AC: @ 811C0AC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811C0C8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x1
	strh r2, [r1, 0x26]
	bl sub_811C12C
	pop {r0}
	bx r0
	.align 2, 0
_0811C0C8: .4byte gTasks
	thumb_func_end sub_811C0AC

	thumb_func_start sub_811C0CC
sub_811C0CC: @ 811C0CC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811C0E8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x2
	strh r2, [r1, 0x26]
	bl sub_811C12C
	pop {r0}
	bx r0
	.align 2, 0
_0811C0E8: .4byte gTasks
	thumb_func_end sub_811C0CC

	thumb_func_start sub_811C0EC
sub_811C0EC: @ 811C0EC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811C108 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x3
	strh r2, [r1, 0x26]
	bl sub_811C12C
	pop {r0}
	bx r0
	.align 2, 0
_0811C108: .4byte gTasks
	thumb_func_end sub_811C0EC

	thumb_func_start sub_811C10C
sub_811C10C: @ 811C10C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811C128 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x4
	strh r2, [r1, 0x26]
	bl sub_811C12C
	pop {r0}
	bx r0
	.align 2, 0
_0811C128: .4byte gTasks
	thumb_func_end sub_811C10C

	thumb_func_start sub_811C12C
sub_811C12C: @ 811C12C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811C15C @ =gUnknown_083FD828
	ldr r2, _0811C160 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811C13E:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811C13E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811C15C: .4byte gUnknown_083FD828
_0811C160: .4byte gTasks
	thumb_func_end sub_811C12C

	thumb_func_start sub_811C164
sub_811C164: @ 811C164
	push {r4,lr}
	adds r4, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	adds r0, r4, 0
	bl sub_811C7B0
	movs r0, 0
	strh r0, [r4, 0xA]
	movs r0, 0x1
	strh r0, [r4, 0xC]
	movs r0, 0xEF
	strh r0, [r4, 0xE]
	ldr r1, _0811C1BC @ =0x0200c000
	movs r0, 0x3F
	strh r0, [r1, 0x2]
	movs r0, 0x3E
	strh r0, [r1, 0x4]
	movs r0, 0xA0
	strh r0, [r1, 0x8]
	movs r1, 0
	ldr r3, _0811C1C0 @ =gUnknown_03005560
	ldr r2, _0811C1C4 @ =0x0000f0f1
_0811C196:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x9F
	bls _0811C196
	ldr r0, _0811C1C8 @ =sub_811C670
	bl SetVBlankCallback
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811C1BC: .4byte 0x0200c000
_0811C1C0: .4byte gUnknown_03005560
_0811C1C4: .4byte 0x0000f0f1
_0811C1C8: .4byte sub_811C670
	thumb_func_end sub_811C164

	thumb_func_start sub_811C1CC
sub_811C1CC: @ 811C1CC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	mov r8, r0
	ldr r6, _0811C284 @ =gUnknown_083FDFF4
	add r1, sp, 0x4
	mov r0, sp
	bl sub_811D6A8
	ldr r0, _0811C288 @ =gUnknown_083FC348
	ldr r1, [sp, 0x4]
	movs r2, 0xF0
	bl CpuSet
	ldr r1, _0811C28C @ =gUnknown_083FDB00
	mov r2, r8
	movs r3, 0x26
	ldrsh r0, [r2, r3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _0811C290 @ =gUnknown_083FDB14
	ldr r0, _0811C294 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0xFA
	movs r2, 0xC
	bl LoadPalette
	movs r1, 0
	ldr r5, [sp]
	ldr r0, _0811C298 @ =sub_811C77C
	mov r12, r0
	movs r2, 0xF0
	lsls r2, 8
	adds r7, r2, 0
_0811C222:
	movs r0, 0
	lsls r3, r1, 16
	asrs r4, r3, 11
_0811C228:
	lsls r2, r0, 16
	asrs r2, 16
	adds r1, r4, r2
	lsls r1, 1
	adds r1, r5
	ldrh r0, [r6]
	orrs r0, r7
	strh r0, [r1]
	adds r2, 0x1
	lsls r2, 16
	adds r6, 0x2
	lsrs r0, r2, 16
	asrs r2, 16
	cmp r2, 0x1F
	ble _0811C228
	movs r1, 0x80
	lsls r1, 9
	adds r0, r3, r1
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _0811C222
	ldr r2, _0811C29C @ =0x04000200
	ldrh r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0811C2A0 @ =REG_DISPSTAT
	ldrh r0, [r2]
	movs r1, 0x10
	orrs r0, r1
	strh r0, [r2]
	mov r0, r12
	bl SetHBlankCallback
	mov r2, r8
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	movs r0, 0
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811C284: .4byte gUnknown_083FDFF4
_0811C288: .4byte gUnknown_083FC348
_0811C28C: .4byte gUnknown_083FDB00
_0811C290: .4byte gUnknown_083FDB14
_0811C294: .4byte gSaveBlock2
_0811C298: .4byte sub_811C77C
_0811C29C: .4byte 0x04000200
_0811C2A0: .4byte REG_DISPSTAT
	thumb_func_end sub_811C1CC

	thumb_func_start sub_811C2A4
sub_811C2A4: @ 811C2A4
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r1, _0811C384 @ =0x0200c000
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldr r7, _0811C388 @ =gUnknown_03004DE0
	ldrh r0, [r4, 0xA]
	ldrb r5, [r4, 0xA]
	adds r0, 0x10
	strh r0, [r4, 0xA]
	movs r6, 0
_0811C2BC:
	adds r0, r5, 0
	movs r1, 0x10
	bl Sin
	ldrh r1, [r4, 0xC]
	adds r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r0, 0
	bge _0811C2D2
	movs r2, 0x1
_0811C2D2:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0xF0
	ble _0811C2DC
	movs r2, 0xF0
_0811C2DC:
	strh r2, [r7]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r7, 0x2
	adds r0, r5, 0
	adds r0, 0x10
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r6, 0x4F
	bls _0811C2BC
	cmp r6, 0x9F
	bhi _0811C334
_0811C2F6:
	adds r0, r5, 0
	movs r1, 0x10
	bl Sin
	ldrh r1, [r4, 0xE]
	subs r1, r0
	lsls r1, 16
	lsrs r2, r1, 16
	cmp r1, 0
	bge _0811C30C
	movs r2, 0
_0811C30C:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0xEF
	ble _0811C316
	movs r2, 0xEF
_0811C316:
	lsls r0, r2, 16
	asrs r0, 8
	movs r1, 0xF0
	orrs r0, r1
	strh r0, [r7]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r7, 0x2
	adds r0, r5, 0
	adds r0, 0x10
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r6, 0x9F
	bls _0811C2F6
_0811C334:
	ldrh r1, [r4, 0xC]
	adds r1, 0x8
	strh r1, [r4, 0xC]
	ldrh r0, [r4, 0xE]
	subs r0, 0x8
	strh r0, [r4, 0xE]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0xF0
	ble _0811C34C
	movs r0, 0xF0
	strh r0, [r4, 0xC]
_0811C34C:
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _0811C358
	movs r0, 0
	strh r0, [r4, 0xE]
_0811C358:
	ldr r0, [r4, 0xC]
	cmp r0, 0xF0
	bne _0811C364
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0811C364:
	ldr r1, _0811C384 @ =0x0200c000
	ldrh r0, [r1, 0x18]
	subs r0, 0x8
	strh r0, [r1, 0x18]
	ldrh r0, [r1, 0x1A]
	adds r0, 0x8
	strh r0, [r1, 0x1A]
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811C384: .4byte 0x0200c000
_0811C388: .4byte gUnknown_03004DE0
	thumb_func_end sub_811C2A4

	thumb_func_start sub_811C38C
sub_811C38C: @ 811C38C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _0811C3F8 @ =0x0200c000
	ldrb r1, [r0]
	movs r1, 0
	strb r1, [r0]
	ldr r2, _0811C3FC @ =gUnknown_03004DE0
	adds r5, r0, 0
	movs r3, 0xF0
_0811C39E:
	strh r3, [r2]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	adds r2, 0x2
	cmp r1, 0x9F
	bls _0811C39E
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xA]
	strh r1, [r4, 0xC]
	strh r1, [r4, 0xE]
	ldrh r0, [r5, 0x18]
	subs r0, 0x8
	strh r0, [r5, 0x18]
	ldrh r0, [r5, 0x1A]
	adds r0, 0x8
	strh r0, [r5, 0x1A]
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	movs r1, 0
	bl sub_811CA10
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	movs r1, 0x1
	bl sub_811CA10
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	bl sub_811CA28
	movs r0, 0x68
	bl PlaySE
	ldrb r0, [r5]
	adds r0, 0x1
	ldrb r1, [r5]
	strb r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811C3F8: .4byte 0x0200c000
_0811C3FC: .4byte gUnknown_03004DE0
	thumb_func_end sub_811C38C

	thumb_func_start sub_811C400
sub_811C400: @ 811C400
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _0811C438 @ =0x0200c000
	ldrh r0, [r1, 0x18]
	subs r0, 0x8
	strh r0, [r1, 0x18]
	ldrh r0, [r1, 0x1A]
	adds r0, 0x8
	strh r0, [r1, 0x1A]
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	bl sub_811CA44
	lsls r0, 16
	cmp r0, 0
	beq _0811C42E
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	bl sub_811CA28
_0811C42E:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811C438: .4byte 0x0200c000
	thumb_func_end sub_811C400

	thumb_func_start sub_811C43C
sub_811C43C: @ 811C43C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	ldr r7, _0811C4D0 @ =0x0200c000
	ldrh r0, [r7, 0x18]
	subs r0, 0x8
	movs r1, 0
	mov r8, r1
	strh r0, [r7, 0x18]
	ldrh r0, [r7, 0x1A]
	adds r0, 0x8
	strh r0, [r7, 0x1A]
	movs r1, 0x24
	ldrsh r0, [r6, r1]
	bl sub_811CA44
	lsls r0, 16
	cmp r0, 0
	beq _0811C4C4
	ldrb r0, [r7]
	movs r0, 0
	strb r0, [r7]
	movs r0, 0
	bl SetVBlankCallback
	ldr r1, _0811C4D4 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _0811C4D8 @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _0811C4DC @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	ldr r4, _0811C4E0 @ =gUnknown_03004DE0
	movs r5, 0xA0
	lsls r5, 1
	adds r0, r4, 0
	movs r1, 0
	adds r2, r5, 0
	bl memset
	movs r0, 0xF0
	lsls r0, 3
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0
	adds r2, r5, 0
	bl memset
	ldr r1, _0811C4E4 @ =REG_WIN0H
	movs r0, 0xF0
	strh r0, [r1]
	ldr r0, _0811C4E8 @ =REG_BLDY
	mov r1, r8
	strh r1, [r0]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	strh r1, [r6, 0xE]
	strh r1, [r6, 0x10]
	movs r0, 0xBF
	strh r0, [r7, 0xE]
	ldr r0, _0811C4EC @ =sub_811C700
	bl SetVBlankCallback
_0811C4C4:
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811C4D0: .4byte 0x0200c000
_0811C4D4: .4byte 0x040000b0
_0811C4D8: .4byte 0x0000c5ff
_0811C4DC: .4byte 0x00007fff
_0811C4E0: .4byte gUnknown_03004DE0
_0811C4E4: .4byte REG_WIN0H
_0811C4E8: .4byte REG_BLDY
_0811C4EC: .4byte sub_811C700
	thumb_func_end sub_811C43C

	thumb_func_start sub_811C4F0
sub_811C4F0: @ 811C4F0
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r1, _0811C5AC @ =0x0200c000
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	movs r6, 0x1
	ldrh r0, [r1, 0x18]
	subs r0, 0x8
	strh r0, [r1, 0x18]
	ldrh r0, [r1, 0x1A]
	adds r0, 0x8
	strh r0, [r1, 0x1A]
	ldrh r2, [r4, 0x10]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	adds r7, r1, 0
	cmp r0, 0x4F
	bgt _0811C51A
	adds r0, r2, 0x2
	strh r0, [r4, 0x10]
_0811C51A:
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0x50
	ble _0811C526
	movs r0, 0x50
	strh r0, [r4, 0x10]
_0811C526:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	movs r1, 0x1
	ands r0, r1
	ldrh r2, [r4, 0x10]
	cmp r0, 0
	beq _0811C58C
	movs r3, 0
	lsls r0, r2, 16
	movs r6, 0
	cmp r0, 0
	blt _0811C58C
	movs r2, 0x50
	mov r12, r2
	ldr r5, _0811C5B0 @ =gUnknown_03004DE0
_0811C546:
	lsls r0, r3, 16
	asrs r2, r0, 16
	mov r3, r12
	subs r1, r3, r2
	adds r0, r2, 0
	adds r0, 0x50
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	asrs r1, 15
	adds r1, r5
	ldrh r0, [r1]
	cmp r0, 0xF
	bhi _0811C568
	movs r6, 0x1
	adds r0, 0x1
	strh r0, [r1]
_0811C568:
	lsls r0, r3, 16
	asrs r0, 15
	adds r1, r0, r5
	ldrh r0, [r1]
	cmp r0, 0xF
	bhi _0811C57A
	movs r6, 0x1
	adds r0, 0x1
	strh r0, [r1]
_0811C57A:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	asrs r0, 16
	movs r2, 0x10
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, 0x10]
	cmp r0, r1
	ble _0811C546
_0811C58C:
	cmp r2, 0x50
	bne _0811C59A
	cmp r6, 0
	bne _0811C59A
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0811C59A:
	ldrb r0, [r7]
	adds r0, 0x1
	ldrb r1, [r7]
	strb r0, [r7]
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811C5AC: .4byte 0x0200c000
_0811C5B0: .4byte gUnknown_03004DE0
	thumb_func_end sub_811C4F0

	thumb_func_start sub_811C5B4
sub_811C5B4: @ 811C5B4
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r4, _0811C5E0 @ =0x0200c000
	ldrb r0, [r4]
	movs r6, 0
	strb r6, [r4]
	movs r0, 0x1
	negs r0, r0
	ldr r2, _0811C5E4 @ =0x00007fff
	movs r1, 0x10
	bl BlendPalettes
	movs r0, 0xFF
	strh r0, [r4, 0xE]
	strh r6, [r5, 0xE]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x1
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811C5E0: .4byte 0x0200c000
_0811C5E4: .4byte 0x00007fff
	thumb_func_end sub_811C5B4

	thumb_func_start sub_811C5E8
sub_811C5E8: @ 811C5E8
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _0811C628 @ =0x0200c000
	ldrb r0, [r5]
	movs r0, 0
	strb r0, [r5]
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	ldr r0, _0811C62C @ =gUnknown_03004DE0
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	movs r2, 0xA0
	lsls r2, 1
	bl memset
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0xF
	ble _0811C616
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0811C616:
	ldrb r0, [r5]
	adds r0, 0x1
	ldrb r1, [r5]
	strb r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811C628: .4byte 0x0200c000
_0811C62C: .4byte gUnknown_03004DE0
	thumb_func_end sub_811C5E8

	thumb_func_start sub_811C630
sub_811C630: @ 811C630
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _0811C664 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _0811C668 @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _0811C66C @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_811D6D4
	ldr r0, [r4]
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811C664: .4byte 0x040000b0
_0811C668: .4byte 0x0000c5ff
_0811C66C: .4byte 0x00007fff
	thumb_func_end sub_811C630

	thumb_func_start sub_811C670
sub_811C670: @ 811C670
	push {r4,lr}
	ldr r4, _0811C6D4 @ =0x040000b0
	ldrh r1, [r4, 0xA]
	ldr r0, _0811C6D8 @ =0x0000c5ff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0xA]
	ldr r0, _0811C6DC @ =0x00007fff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xA]
	bl sub_811D67C
	ldr r2, _0811C6E0 @ =0x0200c000
	ldrb r0, [r2]
	cmp r0, 0
	beq _0811C6A6
	ldr r1, _0811C6E4 @ =0x040000d4
	ldr r0, _0811C6E8 @ =gUnknown_03004DE0
	str r0, [r1]
	movs r3, 0xF0
	lsls r3, 3
	adds r0, r3
	str r0, [r1, 0x4]
	ldr r0, _0811C6EC @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811C6A6:
	ldr r1, _0811C6F0 @ =REG_BG0VOFS
	ldrh r0, [r2, 0x1C]
	strh r0, [r1]
	adds r1, 0x36
	ldrh r0, [r2, 0x2]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r2, 0x4]
	strh r0, [r1]
	subs r1, 0x6
	ldrh r0, [r2, 0x8]
	strh r0, [r1]
	ldr r0, _0811C6F4 @ =gUnknown_03005560
	str r0, [r4]
	ldr r0, _0811C6F8 @ =REG_WIN0H
	str r0, [r4, 0x4]
	ldr r0, _0811C6FC @ =0xa2400001
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811C6D4: .4byte 0x040000b0
_0811C6D8: .4byte 0x0000c5ff
_0811C6DC: .4byte 0x00007fff
_0811C6E0: .4byte 0x0200c000
_0811C6E4: .4byte 0x040000d4
_0811C6E8: .4byte gUnknown_03004DE0
_0811C6EC: .4byte 0x800000a0
_0811C6F0: .4byte REG_BG0VOFS
_0811C6F4: .4byte gUnknown_03005560
_0811C6F8: .4byte REG_WIN0H
_0811C6FC: .4byte 0xa2400001
	thumb_func_end sub_811C670

	thumb_func_start sub_811C700
sub_811C700: @ 811C700
	push {r4,lr}
	ldr r4, _0811C750 @ =0x040000b0
	ldrh r1, [r4, 0xA]
	ldr r0, _0811C754 @ =0x0000c5ff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0xA]
	ldr r0, _0811C758 @ =0x00007fff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xA]
	bl sub_811D67C
	ldr r2, _0811C75C @ =0x0200c000
	ldrb r0, [r2]
	cmp r0, 0
	beq _0811C736
	ldr r1, _0811C760 @ =0x040000d4
	ldr r0, _0811C764 @ =gUnknown_03004DE0
	str r0, [r1]
	movs r3, 0xF0
	lsls r3, 3
	adds r0, r3
	str r0, [r1, 0x4]
	ldr r0, _0811C768 @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811C736:
	ldr r1, _0811C76C @ =REG_BLDCNT
	ldrh r0, [r2, 0xE]
	strh r0, [r1]
	ldr r0, _0811C770 @ =gUnknown_03005560
	str r0, [r4]
	ldr r0, _0811C774 @ =REG_BLDY
	str r0, [r4, 0x4]
	ldr r0, _0811C778 @ =0xa2400001
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811C750: .4byte 0x040000b0
_0811C754: .4byte 0x0000c5ff
_0811C758: .4byte 0x00007fff
_0811C75C: .4byte 0x0200c000
_0811C760: .4byte 0x040000d4
_0811C764: .4byte gUnknown_03004DE0
_0811C768: .4byte 0x800000a0
_0811C76C: .4byte REG_BLDCNT
_0811C770: .4byte gUnknown_03005560
_0811C774: .4byte REG_BLDY
_0811C778: .4byte 0xa2400001
	thumb_func_end sub_811C700

	thumb_func_start sub_811C77C
sub_811C77C: @ 811C77C
	push {lr}
	ldr r0, _0811C790 @ =REG_VCOUNT
	ldrh r0, [r0]
	cmp r0, 0x4F
	bhi _0811C79C
	ldr r0, _0811C794 @ =REG_BG0HOFS
	ldr r1, _0811C798 @ =0x0200c000
	ldrh r1, [r1, 0x18]
	b _0811C7A2
	.align 2, 0
_0811C790: .4byte REG_VCOUNT
_0811C794: .4byte REG_BG0HOFS
_0811C798: .4byte 0x0200c000
_0811C79C:
	ldr r0, _0811C7A8 @ =REG_BG0HOFS
	ldr r1, _0811C7AC @ =0x0200c000
	ldrh r1, [r1, 0x1A]
_0811C7A2:
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0811C7A8: .4byte REG_BG0HOFS
_0811C7AC: .4byte 0x0200c000
	thumb_func_end sub_811C77C

	thumb_func_start sub_811C7B0
sub_811C7B0: @ 811C7B0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r0, _0811C8EC @ =gUnknown_083FD850
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	mov r8, r1
	add r0, r8
	ldrb r0, [r0]
	ldr r2, _0811C8F0 @ =gUnknown_083FD86A
	lsls r1, 2
	mov r8, r1
	adds r1, r2
	ldrh r1, [r1]
	subs r1, 0x20
	lsls r1, 16
	asrs r1, 16
	adds r2, 0x2
	add r2, r8
	ldrh r2, [r2]
	adds r2, 0x2A
	lsls r2, 16
	asrs r2, 16
	ldr r5, _0811C8F4 @ =0x0200c03c
	str r5, [sp]
	movs r3, 0
	bl CreateTrainerSprite_BirchSpeech
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	ldr r0, _0811C8F8 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	movs r1, 0x88
	lsls r1, 1
	str r5, [sp]
	movs r2, 0x6A
	movs r3, 0
	bl CreateTrainerSprite_BirchSpeech
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x24]
	movs r3, 0x22
	ldrsh r0, [r4, r3]
	lsls r5, r0, 4
	adds r5, r0
	lsls r5, 2
	ldr r1, _0811C8FC @ =gSprites
	adds r5, r1
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	lsls r6, r0, 4
	adds r6, r0
	lsls r6, 2
	adds r6, r1
	ldr r0, _0811C900 @ =sub_811C90C
	str r0, [r5, 0x1C]
	str r0, [r6, 0x1C]
	ldrb r0, [r5, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r5, 0x1]
	ldrb r0, [r6, 0x1]
	orrs r0, r1
	strb r0, [r6, 0x1]
	bl AllocOamMatrix
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0x1F
	mov r9, r3
	mov r4, r9
	ands r0, r4
	lsls r0, 1
	ldrb r2, [r5, 0x3]
	movs r4, 0x3F
	negs r4, r4
	adds r1, r4, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x3]
	bl AllocOamMatrix
	lsls r0, 24
	lsrs r0, 24
	mov r1, r9
	ands r0, r1
	lsls r0, 1
	ldrb r1, [r6, 0x3]
	ands r4, r1
	orrs r4, r0
	strb r4, [r6, 0x3]
	ldrb r2, [r5, 0x1]
	movs r1, 0x3F
	adds r0, r1, 0
	ands r0, r2
	movs r2, 0x40
	orrs r0, r2
	strb r0, [r5, 0x1]
	ldrb r0, [r6, 0x1]
	ands r1, r0
	orrs r1, r2
	strb r1, [r6, 0x1]
	ldrb r0, [r5, 0x3]
	movs r1, 0xC0
	orrs r0, r1
	strb r0, [r5, 0x3]
	ldrb r0, [r6, 0x3]
	orrs r0, r1
	strb r0, [r6, 0x3]
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0x3
	movs r3, 0x3
	bl CalcCenterToCornerVec
	adds r0, r6, 0
	movs r1, 0x1
	movs r2, 0x3
	movs r3, 0x3
	bl CalcCenterToCornerVec
	ldrb r0, [r5, 0x3]
	lsls r0, 26
	lsrs r0, 27
	ldr r2, _0811C904 @ =gUnknown_083FD856
	mov r3, r8
	adds r1, r3, r2
	movs r4, 0
	ldrsh r1, [r1, r4]
	adds r2, 0x2
	add r8, r2
	mov r3, r8
	movs r4, 0
	ldrsh r2, [r3, r4]
	movs r3, 0
	bl SetOamMatrixRotationScaling
	ldrb r0, [r6, 0x3]
	lsls r0, 26
	lsrs r0, 27
	ldr r1, _0811C908 @ =0xfffffe00
	movs r2, 0x80
	lsls r2, 2
	movs r3, 0
	bl SetOamMatrixRotationScaling
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811C8EC: .4byte gUnknown_083FD850
_0811C8F0: .4byte gUnknown_083FD86A
_0811C8F4: .4byte 0x0200c03c
_0811C8F8: .4byte gSaveBlock2
_0811C8FC: .4byte gSprites
_0811C900: .4byte sub_811C90C
_0811C904: .4byte gUnknown_083FD856
_0811C908: .4byte 0xfffffe00
	thumb_func_end sub_811C7B0

	thumb_func_start sub_811C90C
sub_811C90C: @ 811C90C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _0811C930 @ =gUnknown_083FD880
_0811C912:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811C912
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811C930: .4byte gUnknown_083FD880
	thumb_func_end sub_811C90C

	thumb_func_start sub_811C934
sub_811C934: @ 811C934
	movs r0, 0
	bx lr
	thumb_func_end sub_811C934

	thumb_func_start sub_811C938
sub_811C938: @ 811C938
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r1, _0811C97C @ =gUnknown_083FD89C
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	add r4, sp, 0x4
	ldr r1, _0811C980 @ =gUnknown_083FD8A0
	adds r0, r4, 0
	movs r2, 0x4
	bl memcpy
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0x30]
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	lsls r0, 1
	adds r4, r0
	ldrh r0, [r4]
	strh r0, [r5, 0x32]
	movs r0, 0x1
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811C97C: .4byte gUnknown_083FD89C
_0811C980: .4byte gUnknown_083FD8A0
	thumb_func_end sub_811C938

	thumb_func_start sub_811C984
sub_811C984: @ 811C984
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	ldrh r3, [r1, 0x20]
	adds r2, r0, r3
	strh r2, [r1, 0x20]
	movs r3, 0x3C
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _0811C9A2
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x84
	bgt _0811C9B0
	b _0811C9AA
_0811C9A2:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x67
	ble _0811C9B0
_0811C9AA:
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
_0811C9B0:
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_811C984

	thumb_func_start sub_811C9B8
sub_811C9B8: @ 811C9B8
	push {lr}
	adds r2, r0, 0
	ldrh r3, [r2, 0x32]
	ldrh r0, [r2, 0x30]
	adds r1, r3, r0
	strh r1, [r2, 0x30]
	ldrh r0, [r2, 0x20]
	adds r0, r1
	strh r0, [r2, 0x20]
	lsls r1, 16
	cmp r1, 0
	bne _0811C9DE
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	negs r0, r3
	strh r0, [r2, 0x32]
	movs r0, 0x1
	strh r0, [r2, 0x3A]
_0811C9DE:
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_811C9B8

	thumb_func_start sub_811C9E4
sub_811C9E4: @ 811C9E4
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x32]
	ldrh r1, [r2, 0x30]
	adds r0, r1
	strh r0, [r2, 0x30]
	ldrh r1, [r2, 0x20]
	adds r1, r0
	strh r1, [r2, 0x20]
	adds r1, 0x1F
	lsls r1, 16
	movs r0, 0x97
	lsls r0, 17
	cmp r1, r0
	bls _0811CA08
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
_0811CA08:
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_811C9E4

	thumb_func_start sub_811CA10
sub_811CA10: @ 811CA10
	ldr r3, _0811CA24 @ =gSprites
	lsls r0, 16
	asrs r0, 16
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	strh r1, [r2, 0x3C]
	bx lr
	.align 2, 0
_0811CA24: .4byte gSprites
	thumb_func_end sub_811CA10

	thumb_func_start sub_811CA28
sub_811CA28: @ 811CA28
	ldr r2, _0811CA40 @ =gSprites
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	bx lr
	.align 2, 0
_0811CA40: .4byte gSprites
	thumb_func_end sub_811CA28

	thumb_func_start sub_811CA44
sub_811CA44: @ 811CA44
	ldr r2, _0811CA58 @ =gSprites
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r2, 0x3A
	ldrsh r0, [r1, r2]
	bx lr
	.align 2, 0
_0811CA58: .4byte gSprites
	thumb_func_end sub_811CA44

	thumb_func_start sub_811CA5C
sub_811CA5C: @ 811CA5C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811CA8C @ =gUnknown_083FD8A4
	ldr r2, _0811CA90 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811CA6E:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811CA6E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811CA8C: .4byte gUnknown_083FD8A4
_0811CA90: .4byte gTasks
	thumb_func_end sub_811CA5C

	thumb_func_start sub_811CA94
sub_811CA94: @ 811CA94
	push {r4-r6,lr}
	adds r4, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	movs r2, 0
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r4, 0xC]
	movs r0, 0x1
	strh r0, [r4, 0xE]
	ldr r1, _0811CB08 @ =0x0200c000
	movs r0, 0x3F
	strh r0, [r1, 0x2]
	strh r2, [r1, 0x4]
	movs r0, 0xA0
	strh r0, [r1, 0x8]
	ldr r3, _0811CB0C @ =gUnknown_03005560
	adds r6, r1, 0
	movs r5, 0xF0
_0811CABE:
	lsls r0, r2, 1
	adds r0, r3
	ldrh r1, [r6, 0x14]
	strh r1, [r0]
	adds r0, r2, 0
	adds r0, 0xA0
	lsls r0, 1
	adds r0, r3
	strh r5, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x9F
	bls _0811CABE
	ldr r2, _0811CB10 @ =0x04000200
	ldrh r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0811CB14 @ =REG_DISPSTAT
	ldrh r0, [r2]
	movs r1, 0x10
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0811CB18 @ =sub_811CC28
	bl SetVBlankCallback
	ldr r0, _0811CB1C @ =sub_811CCB0
	bl SetHBlankCallback
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811CB08: .4byte 0x0200c000
_0811CB0C: .4byte gUnknown_03005560
_0811CB10: .4byte 0x04000200
_0811CB14: .4byte REG_DISPSTAT
_0811CB18: .4byte sub_811CC28
_0811CB1C: .4byte sub_811CCB0
	thumb_func_end sub_811CA94

	thumb_func_start sub_811CB20
sub_811CB20: @ 811CB20
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r2, r0, 0
	ldr r1, _0811CB98 @ =0x0200c000
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldrh r0, [r2, 0xC]
	lsls r0, 16
	asrs r0, 24
	ldrh r3, [r2, 0xA]
	adds r0, r3
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	mov r12, r1
	cmp r0, 0xF0
	ble _0811CB4A
	movs r0, 0xF0
	strh r0, [r2, 0xA]
_0811CB4A:
	ldrh r4, [r2, 0xC]
	movs r0, 0xC
	ldrsh r1, [r2, r0]
	ldr r0, _0811CB9C @ =0x00000fff
	ldrh r3, [r2, 0xE]
	cmp r1, r0
	bgt _0811CB5C
	adds r0, r4, r3
	strh r0, [r2, 0xC]
_0811CB5C:
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, 0x7F
	bgt _0811CB68
	lsls r0, r3, 1
	strh r0, [r2, 0xE]
_0811CB68:
	movs r5, 0
	ldr r7, _0811CBA0 @ =gUnknown_03004DE0
	movs r1, 0xA0
	lsls r1, 1
	adds r1, r7
	mov r8, r1
	mov r6, r12
_0811CB76:
	lsls r0, r5, 1
	adds r3, r0, r7
	mov r1, r8
	adds r4, r0, r1
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	beq _0811CBA4
	ldrh r0, [r2, 0xA]
	ldrh r1, [r6, 0x14]
	adds r0, r1
	strh r0, [r3]
	ldrh r1, [r2, 0xA]
	movs r0, 0xF0
	subs r0, r1
	b _0811CBB4
	.align 2, 0
_0811CB98: .4byte 0x0200c000
_0811CB9C: .4byte 0x00000fff
_0811CBA0: .4byte gUnknown_03004DE0
_0811CBA4:
	ldrh r0, [r6, 0x14]
	ldrh r1, [r2, 0xA]
	subs r0, r1
	strh r0, [r3]
	ldrh r0, [r2, 0xA]
	lsls r0, 8
	movs r1, 0xF1
	orrs r0, r1
_0811CBB4:
	strh r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x9F
	bls _0811CB76
	movs r3, 0xA
	ldrsh r0, [r2, r3]
	cmp r0, 0xEF
	ble _0811CBCE
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
_0811CBCE:
	mov r1, r12
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r1, [r1]
	mov r2, r12
	strb r0, [r2]
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_811CB20

	thumb_func_start sub_811CBE8
sub_811CBE8: @ 811CBE8
	push {lr}
	ldr r1, _0811CC18 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _0811CC1C @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _0811CC20 @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_811D6D4
	ldr r0, _0811CC24 @ =sub_811CA5C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0811CC18: .4byte 0x040000b0
_0811CC1C: .4byte 0x0000c5ff
_0811CC20: .4byte 0x00007fff
_0811CC24: .4byte sub_811CA5C
	thumb_func_end sub_811CBE8

	thumb_func_start sub_811CC28
sub_811CC28: @ 811CC28
	push {r4,lr}
	ldr r4, _0811CC84 @ =0x040000b0
	ldrh r1, [r4, 0xA]
	ldr r0, _0811CC88 @ =0x0000c5ff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0xA]
	ldr r0, _0811CC8C @ =0x00007fff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xA]
	bl sub_811D67C
	ldr r2, _0811CC90 @ =REG_WININ
	ldr r1, _0811CC94 @ =0x0200c000
	ldrh r0, [r1, 0x2]
	strh r0, [r2]
	adds r2, 0x2
	ldrh r0, [r1, 0x4]
	strh r0, [r2]
	subs r2, 0x6
	ldrh r0, [r1, 0x8]
	strh r0, [r2]
	ldrb r0, [r1]
	cmp r0, 0
	beq _0811CC70
	ldr r1, _0811CC98 @ =0x040000d4
	ldr r0, _0811CC9C @ =gUnknown_03004DE0
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _0811CCA0 @ =0x80000140
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811CC70:
	ldr r0, _0811CCA4 @ =gUnknown_030056A0
	str r0, [r4]
	ldr r0, _0811CCA8 @ =REG_WIN0H
	str r0, [r4, 0x4]
	ldr r0, _0811CCAC @ =0xa2400001
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811CC84: .4byte 0x040000b0
_0811CC88: .4byte 0x0000c5ff
_0811CC8C: .4byte 0x00007fff
_0811CC90: .4byte REG_WININ
_0811CC94: .4byte 0x0200c000
_0811CC98: .4byte 0x040000d4
_0811CC9C: .4byte gUnknown_03004DE0
_0811CCA0: .4byte 0x80000140
_0811CCA4: .4byte gUnknown_030056A0
_0811CCA8: .4byte REG_WIN0H
_0811CCAC: .4byte 0xa2400001
	thumb_func_end sub_811CC28

	thumb_func_start sub_811CCB0
sub_811CCB0: @ 811CCB0
	ldr r1, _0811CCD0 @ =gUnknown_03004DE0
	ldr r0, _0811CCD4 @ =REG_VCOUNT
	ldrh r0, [r0]
	lsls r0, 1
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r2
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _0811CCD8 @ =REG_BG1HOFS
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	bx lr
	.align 2, 0
_0811CCD0: .4byte gUnknown_03004DE0
_0811CCD4: .4byte REG_VCOUNT
_0811CCD8: .4byte REG_BG1HOFS
	thumb_func_end sub_811CCB0

	thumb_func_start sub_811CCDC
sub_811CCDC: @ 811CCDC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811CD0C @ =gUnknown_083FD8B0
	ldr r2, _0811CD10 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811CCEE:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811CCEE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811CD0C: .4byte gUnknown_083FD8B0
_0811CD10: .4byte gTasks
	thumb_func_end sub_811CCDC

	thumb_func_start sub_811CD14
sub_811CD14: @ 811CD14
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	ldr r1, _0811CD88 @ =0x0200c000
	movs r2, 0
	movs r0, 0xBF
	strh r0, [r1, 0xE]
	strh r2, [r1, 0x12]
	movs r0, 0x1E
	strh r0, [r1, 0x2]
	movs r0, 0x3F
	strh r0, [r1, 0x4]
	movs r0, 0xA0
	strh r0, [r1, 0x8]
	movs r1, 0
	ldr r2, _0811CD8C @ =gUnknown_03005560
	movs r4, 0
	movs r3, 0xF0
_0811CD3E:
	lsls r0, r1, 1
	adds r0, r2
	strh r4, [r0]
	adds r0, r1, 0
	adds r0, 0xA0
	lsls r0, 1
	adds r0, r2
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x9F
	bls _0811CD3E
	ldr r2, _0811CD90 @ =0x04000200
	ldrh r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0811CD94 @ =REG_DISPSTAT
	ldrh r0, [r2]
	movs r1, 0x10
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0811CD98 @ =sub_811CFAC
	bl SetHBlankCallback
	ldr r0, _0811CD9C @ =sub_811CEE4
	bl SetVBlankCallback
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811CD88: .4byte 0x0200c000
_0811CD8C: .4byte gUnknown_03005560
_0811CD90: .4byte 0x04000200
_0811CD94: .4byte REG_DISPSTAT
_0811CD98: .4byte sub_811CFAC
_0811CD9C: .4byte sub_811CEE4
	thumb_func_end sub_811CD14

	thumb_func_start sub_811CDA0
sub_811CDA0: @ 811CDA0
	push {r4-r6,lr}
	sub sp, 0x10
	adds r6, r0, 0
	ldr r1, _0811CE08 @ =gUnknown_083FD8C4
	mov r0, sp
	movs r2, 0x10
	bl memcpy
	movs r5, 0
	movs r4, 0
_0811CDB4:
	ldr r0, _0811CE0C @ =sub_811CFD0
	bl CreateInvisibleSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0811CE10 @ =gSprites
	adds r2, r1, r0
	movs r0, 0xF0
	strh r0, [r2, 0x20]
	strh r4, [r2, 0x22]
	lsls r1, r5, 16
	asrs r1, 16
	lsls r0, r1, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r2, 0x38]
	adds r1, 0x1
	lsls r1, 16
	lsls r0, r4, 16
	movs r3, 0xA0
	lsls r3, 13
	adds r0, r3
	lsrs r4, r0, 16
	lsrs r5, r1, 16
	asrs r1, 16
	cmp r1, 0x7
	ble _0811CDB4
	ldrh r0, [r2, 0x3A]
	adds r0, 0x1
	strh r0, [r2, 0x3A]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	movs r0, 0
	add sp, 0x10
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811CE08: .4byte gUnknown_083FD8C4
_0811CE0C: .4byte sub_811CFD0
_0811CE10: .4byte gSprites
	thumb_func_end sub_811CDA0

	thumb_func_start sub_811CE14
sub_811CE14: @ 811CE14
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0811CE44 @ =0x0200c000
	ldrb r1, [r0]
	movs r1, 0
	strb r1, [r0]
	movs r1, 0x20
	ldrsh r0, [r0, r1]
	cmp r0, 0x7
	ble _0811CE3A
	movs r0, 0x1
	negs r0, r0
	ldr r2, _0811CE48 @ =0x00007fff
	movs r1, 0x10
	bl BlendPalettes
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0811CE3A:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811CE44: .4byte 0x0200c000
_0811CE48: .4byte 0x00007fff
	thumb_func_end sub_811CE14

	thumb_func_start sub_811CE4C
sub_811CE4C: @ 811CE4C
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r4, _0811CE9C @ =0x0200c000
	ldrb r0, [r4]
	movs r5, 0
	strb r5, [r4]
	ldr r1, _0811CEA0 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _0811CEA4 @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _0811CEA8 @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0xF0
	strh r0, [r4, 0x6]
	strh r5, [r4, 0x12]
	movs r0, 0xFF
	strh r0, [r4, 0xE]
	movs r0, 0x3F
	strh r0, [r4, 0x2]
	ldr r0, _0811CEAC @ =sub_811CF74
	bl SetVBlankCallback
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811CE9C: .4byte 0x0200c000
_0811CEA0: .4byte 0x040000b0
_0811CEA4: .4byte 0x0000c5ff
_0811CEA8: .4byte 0x00007fff
_0811CEAC: .4byte sub_811CF74
	thumb_func_end sub_811CE4C

	thumb_func_start sub_811CEB0
sub_811CEB0: @ 811CEB0
	push {lr}
	ldr r1, _0811CEDC @ =0x0200c000
	ldrh r0, [r1, 0x12]
	adds r0, 0x1
	strh r0, [r1, 0x12]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x10
	bls _0811CED4
	bl sub_811D6D4
	ldr r0, _0811CEE0 @ =sub_811CCDC
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0811CED4:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0811CEDC: .4byte 0x0200c000
_0811CEE0: .4byte sub_811CCDC
	thumb_func_end sub_811CEB0

	thumb_func_start sub_811CEE4
sub_811CEE4: @ 811CEE4
	push {r4,lr}
	ldr r4, _0811CF48 @ =0x040000b0
	ldrh r1, [r4, 0xA]
	ldr r0, _0811CF4C @ =0x0000c5ff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0xA]
	ldr r0, _0811CF50 @ =0x00007fff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xA]
	bl sub_811D67C
	ldr r2, _0811CF54 @ =REG_BLDCNT
	ldr r1, _0811CF58 @ =0x0200c000
	ldrh r0, [r1, 0xE]
	strh r0, [r2]
	subs r2, 0x8
	ldrh r0, [r1, 0x2]
	strh r0, [r2]
	adds r2, 0x2
	ldrh r0, [r1, 0x4]
	strh r0, [r2]
	subs r2, 0x6
	ldrh r0, [r1, 0x6]
	strh r0, [r2]
	ldrb r0, [r1]
	cmp r0, 0
	beq _0811CF32
	ldr r1, _0811CF5C @ =0x040000d4
	ldr r0, _0811CF60 @ =gUnknown_03004DE0
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _0811CF64 @ =0x80000140
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811CF32:
	ldr r0, _0811CF68 @ =gUnknown_030056A0
	str r0, [r4]
	ldr r0, _0811CF6C @ =REG_WIN0H
	str r0, [r4, 0x4]
	ldr r0, _0811CF70 @ =0xa2400001
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811CF48: .4byte 0x040000b0
_0811CF4C: .4byte 0x0000c5ff
_0811CF50: .4byte 0x00007fff
_0811CF54: .4byte REG_BLDCNT
_0811CF58: .4byte 0x0200c000
_0811CF5C: .4byte 0x040000d4
_0811CF60: .4byte gUnknown_03004DE0
_0811CF64: .4byte 0x80000140
_0811CF68: .4byte gUnknown_030056A0
_0811CF6C: .4byte REG_WIN0H
_0811CF70: .4byte 0xa2400001
	thumb_func_end sub_811CEE4

	thumb_func_start sub_811CF74
sub_811CF74: @ 811CF74
	push {lr}
	bl sub_811D67C
	ldr r1, _0811CFA4 @ =REG_BLDY
	ldr r2, _0811CFA8 @ =0x0200c000
	ldrh r0, [r2, 0x12]
	strh r0, [r1]
	subs r1, 0x4
	ldrh r0, [r2, 0xE]
	strh r0, [r1]
	subs r1, 0x8
	ldrh r0, [r2, 0x2]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r2, 0x4]
	strh r0, [r1]
	subs r1, 0xA
	ldrh r0, [r2, 0x6]
	strh r0, [r1]
	adds r1, 0x4
	ldrh r0, [r2, 0x8]
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0811CFA4: .4byte REG_BLDY
_0811CFA8: .4byte 0x0200c000
	thumb_func_end sub_811CF74

	thumb_func_start sub_811CFAC
sub_811CFAC: @ 811CFAC
	ldr r2, _0811CFC4 @ =REG_BLDY
	ldr r1, _0811CFC8 @ =gUnknown_03004DE0
	ldr r0, _0811CFCC @ =REG_VCOUNT
	ldrh r0, [r0]
	lsls r0, 1
	movs r3, 0xF0
	lsls r3, 3
	adds r1, r3
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	bx lr
	.align 2, 0
_0811CFC4: .4byte REG_BLDY
_0811CFC8: .4byte gUnknown_03004DE0
_0811CFCC: .4byte REG_VCOUNT
	thumb_func_end sub_811CFAC

	thumb_func_start sub_811CFD0
sub_811CFD0: @ 811CFD0
	push {r4-r6,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x38]
	movs r2, 0x38
	ldrsh r0, [r3, r2]
	cmp r0, 0
	beq _0811CFF8
	subs r0, r1, 0x1
	strh r0, [r3, 0x38]
	movs r1, 0x3A
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _0811D0AA
	ldr r0, _0811CFF4 @ =0x0200c000
	ldrb r1, [r0]
	movs r1, 0x1
	strb r1, [r0]
	b _0811D0AA
	.align 2, 0
_0811CFF4: .4byte 0x0200c000
_0811CFF8:
	movs r2, 0x22
	ldrsh r1, [r3, r2]
	lsls r1, 1
	ldr r0, _0811D0B0 @ =gUnknown_03004DE0
	adds r6, r1, r0
	movs r2, 0xA0
	lsls r2, 1
	adds r0, r2
	adds r5, r1, r0
	movs r4, 0
_0811D00C:
	lsls r1, r4, 1
	adds r2, r1, r6
	ldrh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r2]
	adds r1, r5
	ldrh r0, [r3, 0x20]
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _0811D00C
	movs r1, 0x20
	ldrsh r0, [r3, r1]
	ldrh r2, [r3, 0x20]
	cmp r0, 0
	bne _0811D046
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	movs r0, 0x80
	lsls r0, 5
	cmp r1, r0
	bne _0811D046
	movs r0, 0x1
	strh r0, [r3, 0x30]
_0811D046:
	adds r1, r2, 0
	subs r1, 0x10
	strh r1, [r3, 0x20]
	ldrh r0, [r3, 0x2E]
	adds r0, 0x80
	strh r0, [r3, 0x2E]
	lsls r1, 16
	cmp r1, 0
	bge _0811D05C
	movs r0, 0
	strh r0, [r3, 0x20]
_0811D05C:
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	movs r1, 0x80
	lsls r1, 5
	cmp r0, r1
	ble _0811D06A
	strh r1, [r3, 0x2E]
_0811D06A:
	movs r0, 0x3A
	ldrsh r2, [r3, r0]
	cmp r2, 0
	beq _0811D07A
	ldr r0, _0811D0B4 @ =0x0200c000
	ldrb r1, [r0]
	movs r1, 0x1
	strb r1, [r0]
_0811D07A:
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _0811D0AA
	ldr r4, _0811D0B4 @ =0x0200c000
	cmp r2, 0
	beq _0811D09E
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0x6
	ble _0811D0AA
	ldrh r0, [r3, 0x32]
	adds r1, r0, 0x1
	strh r1, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _0811D0AA
_0811D09E:
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	adds r0, r3, 0
	bl DestroySprite
_0811D0AA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811D0B0: .4byte gUnknown_03004DE0
_0811D0B4: .4byte 0x0200c000
	thumb_func_end sub_811CFD0

	thumb_func_start sub_811D0B8
sub_811D0B8: @ 811D0B8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811D0E8 @ =gUnknown_083FD8D4
	ldr r2, _0811D0EC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811D0CA:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811D0CA
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811D0E8: .4byte gUnknown_083FD8D4
_0811D0EC: .4byte gTasks
	thumb_func_end sub_811D0B8

	thumb_func_start sub_811D0F0
sub_811D0F0: @ 811D0F0
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	add r0, sp, 0x4
	add r1, sp, 0x8
	bl sub_811D6A8
	ldr r0, _0811D138 @ =gUnknown_083FD528
	ldr r1, [sp, 0x8]
	movs r2, 0x10
	bl CpuSet
	mov r1, sp
	movs r2, 0xF0
	lsls r2, 8
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, [sp, 0x4]
	ldr r2, _0811D13C @ =0x01000400
	mov r0, sp
	bl CpuSet
	ldr r0, _0811D140 @ =gFieldEffectObjectPalette10
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811D138: .4byte gUnknown_083FD528
_0811D13C: .4byte 0x01000400
_0811D140: .4byte gFieldEffectObjectPalette10
	thumb_func_end sub_811D0F0

	thumb_func_start sub_811D144
sub_811D144: @ 811D144
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0811D186
	mov r0, sp
	bl sub_811D690
	movs r0, 0x3
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	lsls r0, 5
	ldr r1, _0811D198 @ =gUnknown_083FD528
	adds r0, r1
	ldr r1, [sp]
	movs r2, 0x10
	bl CpuSet
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0xD
	ble _0811D186
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x10
	strh r0, [r4, 0xA]
_0811D186:
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811D198: .4byte gUnknown_083FD528
	thumb_func_end sub_811D144

	thumb_func_start sub_811D19C
sub_811D19C: @ 811D19C
	push {lr}
	ldrh r1, [r0, 0xA]
	subs r1, 0x1
	strh r1, [r0, 0xA]
	lsls r1, 16
	cmp r1, 0
	bne _0811D1BC
	bl sub_811D6D4
	ldr r0, _0811D1C4 @ =sub_811D0B8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0811D1BC:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0811D1C4: .4byte sub_811D0B8
	thumb_func_end sub_811D19C

	thumb_func_start sub_811D1C8
sub_811D1C8: @ 811D1C8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811D1F8 @ =gUnknown_083FD8E0
	ldr r2, _0811D1FC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811D1DA:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811D1DA
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811D1F8: .4byte gUnknown_083FD8E0
_0811D1FC: .4byte gTasks
	thumb_func_end sub_811D1C8

	thumb_func_start sub_811D200
sub_811D200: @ 811D200
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	ldr r1, _0811D254 @ =0x0200c000
	movs r2, 0
	movs r0, 0x3F
	strh r0, [r1, 0x2]
	strh r2, [r1, 0x4]
	movs r0, 0xA0
	strh r0, [r1, 0x8]
	movs r1, 0
	ldr r2, _0811D258 @ =gUnknown_03004DE0
	movs r3, 0xF0
	adds r4, r2, 0
_0811D222:
	lsls r0, r1, 1
	adds r0, r2
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x9F
	bls _0811D222
	movs r0, 0xF0
	lsls r0, 3
	adds r1, r4, r0
	adds r0, r4, 0
	movs r2, 0xA0
	bl CpuSet
	ldr r0, _0811D25C @ =sub_811D438
	bl SetVBlankCallback
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811D254: .4byte 0x0200c000
_0811D258: .4byte gUnknown_03004DE0
_0811D25C: .4byte sub_811D438
	thumb_func_end sub_811D200

	thumb_func_start sub_811D260
sub_811D260: @ 811D260
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	mov r8, r0
	ldr r0, _0811D2D0 @ =0x0200c024
	ldr r6, _0811D2D4 @ =gUnknown_083FD8F4
	mov r2, r8
	movs r3, 0xA
	ldrsh r1, [r2, r3]
	lsls r4, r1, 2
	adds r4, r1
	lsls r4, 1
	adds r1, r4, r6
	movs r5, 0
	ldrsh r1, [r1, r5]
	adds r2, r6, 0x2
	adds r2, r4, r2
	movs r3, 0
	ldrsh r2, [r2, r3]
	adds r3, r6, 0x4
	adds r3, r4, r3
	movs r5, 0
	ldrsh r3, [r3, r5]
	adds r5, r6, 0x6
	adds r4, r5
	movs r5, 0
	ldrsh r4, [r4, r5]
	str r4, [sp]
	movs r4, 0x1
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	bl sub_811D8FC
	mov r0, r8
	movs r2, 0xA
	ldrsh r1, [r0, r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 1
	adds r6, 0x8
	adds r0, r6
	ldrh r0, [r0]
	mov r3, r8
	strh r0, [r3, 0xC]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	movs r0, 0x1
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811D2D0: .4byte 0x0200c024
_0811D2D4: .4byte gUnknown_083FD8F4
	thumb_func_end sub_811D260

	thumb_func_start sub_811D2D8
sub_811D2D8: @ 811D2D8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	ldr r0, _0811D324 @ =0x0200c000
	ldrb r1, [r0]
	movs r1, 0
	strb r1, [r0]
	mov r8, r1
	mov r12, r1
	adds r6, r0, 0
	ldr r0, _0811D328 @ =gUnknown_03004DE0
	mov r9, r0
_0811D2F4:
	ldr r1, _0811D328 @ =gUnknown_03004DE0
	movs r2, 0x2A
	ldrsh r0, [r6, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsrs r3, r0, 8
	movs r4, 0xFF
	ands r4, r0
	movs r1, 0xC
	ldrsh r0, [r7, r1]
	cmp r0, 0
	bne _0811D32C
	movs r2, 0x28
	ldrsh r0, [r6, r2]
	cmp r3, r0
	bge _0811D318
	ldrh r3, [r6, 0x28]
_0811D318:
	lsls r0, r3, 16
	lsls r1, r4, 16
	cmp r0, r1
	ble _0811D344
	lsrs r3, r1, 16
	b _0811D344
	.align 2, 0
_0811D324: .4byte 0x0200c000
_0811D328: .4byte gUnknown_03004DE0
_0811D32C:
	lsls r0, r4, 16
	asrs r0, 16
	movs r2, 0x28
	ldrsh r1, [r6, r2]
	cmp r0, r1
	ble _0811D33A
	ldrh r4, [r6, 0x28]
_0811D33A:
	lsls r0, r4, 16
	lsls r1, r3, 16
	cmp r0, r1
	bgt _0811D344
	lsrs r4, r1, 16
_0811D344:
	ldr r5, _0811D368 @ =0x0200c000
	movs r0, 0x2A
	ldrsh r2, [r5, r0]
	lsls r2, 1
	add r2, r9
	lsls r1, r3, 16
	asrs r1, 8
	lsls r0, r4, 16
	asrs r0, 16
	orrs r0, r1
	strh r0, [r2]
	mov r1, r12
	cmp r1, 0
	beq _0811D36C
	ldrh r0, [r7, 0x8]
	adds r0, 0x1
	strh r0, [r7, 0x8]
	b _0811D392
	.align 2, 0
_0811D368: .4byte 0x0200c000
_0811D36C:
	adds r0, r5, 0
	adds r0, 0x24
	movs r1, 0x1
	movs r2, 0x1
	bl sub_811D978
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	mov r2, r8
	lsls r0, r2, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r2, r0, 16
	mov r8, r2
	asrs r0, 16
	cmp r0, 0xF
	ble _0811D2F4
_0811D392:
	ldr r0, _0811D3AC @ =0x0200c000
	ldrb r1, [r0]
	adds r1, 0x1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, 0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811D3AC: .4byte 0x0200c000
	thumb_func_end sub_811D2D8

	thumb_func_start sub_811D3B0
sub_811D3B0: @ 811D3B0
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	ble _0811D3FC
	ldr r1, _0811D3EC @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _0811D3F0 @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _0811D3F4 @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_811D6D4
	ldr r0, _0811D3F8 @ =sub_811D1C8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	b _0811D414
	.align 2, 0
_0811D3EC: .4byte 0x040000b0
_0811D3F0: .4byte 0x0000c5ff
_0811D3F4: .4byte 0x00007fff
_0811D3F8: .4byte sub_811D1C8
_0811D3FC:
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	ldr r1, _0811D418 @ =gUnknown_083FD93A
	movs r3, 0xA
	ldrsh r0, [r2, r3]
	subs r0, 0x1
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2, 0xE]
	movs r0, 0x1
_0811D414:
	pop {r1}
	bx r1
	.align 2, 0
_0811D418: .4byte gUnknown_083FD93A
	thumb_func_end sub_811D3B0

	thumb_func_start sub_811D41C
sub_811D41C: @ 811D41C
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0xE]
	subs r0, 0x1
	strh r0, [r1, 0xE]
	lsls r0, 16
	cmp r0, 0
	beq _0811D430
	movs r0, 0
	b _0811D434
_0811D430:
	movs r0, 0x1
	strh r0, [r1, 0x8]
_0811D434:
	pop {r1}
	bx r1
	thumb_func_end sub_811D41C

	thumb_func_start sub_811D438
sub_811D438: @ 811D438
	push {r4,lr}
	ldr r4, _0811D4A0 @ =0x040000b0
	ldrh r1, [r4, 0xA]
	ldr r0, _0811D4A4 @ =0x0000c5ff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0xA]
	ldr r0, _0811D4A8 @ =0x00007fff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xA]
	bl sub_811D67C
	ldr r2, _0811D4AC @ =0x0200c000
	ldrb r0, [r2]
	cmp r0, 0
	beq _0811D46E
	ldr r1, _0811D4B0 @ =0x040000d4
	ldr r0, _0811D4B4 @ =gUnknown_03004DE0
	str r0, [r1]
	movs r3, 0xF0
	lsls r3, 3
	adds r0, r3
	str r0, [r1, 0x4]
	ldr r0, _0811D4B8 @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811D46E:
	ldr r1, _0811D4BC @ =REG_WININ
	ldrh r0, [r2, 0x2]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r2, 0x4]
	strh r0, [r1]
	subs r1, 0x6
	ldrh r0, [r2, 0x8]
	strh r0, [r1]
	ldr r2, _0811D4C0 @ =REG_WIN0H
	ldr r0, _0811D4B4 @ =gUnknown_03004DE0
	movs r1, 0xF0
	lsls r1, 3
	adds r0, r1
	ldrh r1, [r0]
	strh r1, [r2]
	str r0, [r4]
	str r2, [r4, 0x4]
	ldr r0, _0811D4C4 @ =0xa2400001
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811D4A0: .4byte 0x040000b0
_0811D4A4: .4byte 0x0000c5ff
_0811D4A8: .4byte 0x00007fff
_0811D4AC: .4byte 0x0200c000
_0811D4B0: .4byte 0x040000d4
_0811D4B4: .4byte gUnknown_03004DE0
_0811D4B8: .4byte 0x800000a0
_0811D4BC: .4byte REG_WININ
_0811D4C0: .4byte REG_WIN0H
_0811D4C4: .4byte 0xa2400001
	thumb_func_end sub_811D438

	thumb_func_start sub_811D4C8
sub_811D4C8: @ 811D4C8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	mov r8, r0
	adds r4, r1, 0
	adds r5, r2, 0
	adds r6, r3, 0
	ldr r3, [sp, 0x18]
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	lsls r3, 16
	lsrs r3, 16
	ldr r0, _0811D524 @ =sub_811D54C
	movs r1, 0x3
	str r3, [sp]
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811D528 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	mov r0, r8
	strh r0, [r1, 0xA]
	strh r4, [r1, 0xC]
	strh r5, [r1, 0xE]
	strh r6, [r1, 0x10]
	ldr r3, [sp]
	strh r3, [r1, 0x12]
	strh r0, [r1, 0x14]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811D524: .4byte sub_811D54C
_0811D528: .4byte gTasks
	thumb_func_end sub_811D4C8

	thumb_func_start sub_811D52C
sub_811D52C: @ 811D52C
	push {lr}
	ldr r0, _0811D540 @ =sub_811D54C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0811D544
	movs r0, 0
	b _0811D546
	.align 2, 0
_0811D540: .4byte sub_811D54C
_0811D544:
	movs r0, 0x1
_0811D546:
	pop {r1}
	bx r1
	thumb_func_end sub_811D52C

	thumb_func_start sub_811D54C
sub_811D54C: @ 811D54C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811D57C @ =gUnknown_083FD948
	ldr r2, _0811D580 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811D55E:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811D55E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811D57C: .4byte gUnknown_083FD948
_0811D580: .4byte gTasks
	thumb_func_end sub_811D54C

	thumb_func_start sub_811D584
sub_811D584: @ 811D584
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x14]
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0811D59C
	subs r0, r1, 0x1
	strh r0, [r4, 0x14]
	lsls r0, 16
	cmp r0, 0
	bne _0811D5C0
_0811D59C:
	ldrh r0, [r4, 0xA]
	strh r0, [r4, 0x14]
	ldrh r0, [r4, 0x10]
	ldrh r1, [r4, 0x16]
	adds r0, r1
	strh r0, [r4, 0x16]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _0811D5B4
	movs r0, 0x10
	strh r0, [r4, 0x16]
_0811D5B4:
	movs r0, 0x1
	negs r0, r0
	ldrb r1, [r4, 0x16]
	ldr r2, _0811D5DC @ =0x00002d6b
	bl BlendPalettes
_0811D5C0:
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	ble _0811D5D2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0xC]
	strh r0, [r4, 0x14]
_0811D5D2:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811D5DC: .4byte 0x00002d6b
	thumb_func_end sub_811D584

	thumb_func_start sub_811D5E0
sub_811D5E0: @ 811D5E0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x14]
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0811D5F8
	subs r0, r1, 0x1
	strh r0, [r4, 0x14]
	lsls r0, 16
	cmp r0, 0
	bne _0811D61A
_0811D5F8:
	ldrh r0, [r4, 0xC]
	strh r0, [r4, 0x14]
	ldrh r0, [r4, 0x16]
	ldrh r1, [r4, 0x12]
	subs r0, r1
	strh r0, [r4, 0x16]
	lsls r0, 16
	cmp r0, 0
	bge _0811D60E
	movs r0, 0
	strh r0, [r4, 0x16]
_0811D60E:
	movs r0, 0x1
	negs r0, r0
	ldrb r1, [r4, 0x16]
	ldr r2, _0811D640 @ =0x00002d6b
	bl BlendPalettes
_0811D61A:
	movs r0, 0x16
	ldrsh r1, [r4, r0]
	cmp r1, 0
	bne _0811D64E
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _0811D648
	ldr r0, _0811D644 @ =sub_811D54C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	b _0811D64E
	.align 2, 0
_0811D640: .4byte 0x00002d6b
_0811D644: .4byte sub_811D54C
_0811D648:
	ldrh r0, [r4, 0xA]
	strh r0, [r4, 0x14]
	strh r1, [r4, 0x8]
_0811D64E:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_811D5E0

	thumb_func_start sub_811D658
sub_811D658: @ 811D658
	push {lr}
	ldr r0, _0811D674 @ =gUnknown_083FD708
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0x3C
	bl memset
	ldr r0, _0811D678 @ =0x0200c014
	adds r1, r0, 0x2
	bl sub_8057B14
	pop {r0}
	bx r0
	.align 2, 0
_0811D674: .4byte gUnknown_083FD708
_0811D678: .4byte 0x0200c014
	thumb_func_end sub_811D658

	thumb_func_start sub_811D67C
sub_811D67C: @ 811D67C
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_811D67C

	thumb_func_start sub_811D690
sub_811D690: @ 811D690
	ldr r1, _0811D6A4 @ =REG_BG0CNT
	ldrh r1, [r1]
	lsrs r1, 2
	lsls r1, 30
	lsrs r1, 16
	movs r2, 0xC0
	lsls r2, 19
	adds r1, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_0811D6A4: .4byte REG_BG0CNT
	thumb_func_end sub_811D690

	thumb_func_start sub_811D6A8
sub_811D6A8: @ 811D6A8
	push {r4,lr}
	ldr r3, _0811D6D0 @ =REG_BG0CNT
	ldrh r2, [r3]
	lsrs r2, 8
	ldrh r3, [r3]
	lsrs r3, 2
	lsls r2, 27
	lsrs r2, 16
	lsls r3, 30
	lsrs r3, 16
	movs r4, 0xC0
	lsls r4, 19
	adds r2, r4
	str r2, [r0]
	adds r3, r4
	str r3, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811D6D0: .4byte REG_BG0CNT
	thumb_func_end sub_811D6A8

	thumb_func_start sub_811D6D4
sub_811D6D4: @ 811D6D4
	push {lr}
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	pop {r0}
	bx r0
	thumb_func_end sub_811D6D4

	thumb_func_start sub_811D6E8
sub_811D6E8: @ 811D6E8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r10, r0
	ldr r0, [sp, 0x20]
	ldr r4, [sp, 0x24]
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 16
	lsrs r3, 16
	lsls r0, 16
	lsrs r1, r0, 16
	lsls r4, 16
	movs r6, 0
	lsrs r5, r4, 16
	cmp r4, 0
	ble _0811D750
	lsls r0, r7, 16
	asrs r0, 16
	mov r9, r0
	lsls r1, 16
	mov r8, r1
	lsls r0, r3, 16
	asrs r7, r0, 16
_0811D720:
	lsls r4, r2, 16
	asrs r4, 16
	movs r0, 0xFF
	ands r0, r4
	mov r2, r8
	asrs r1, r2, 16
	bl Sin
	lsls r1, r6, 1
	add r1, r10
	add r0, r9
	strh r0, [r1]
	lsls r1, r5, 16
	ldr r0, _0811D760 @ =0xffff0000
	adds r1, r0
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r4, r7
	lsls r4, 16
	lsrs r2, r4, 16
	lsrs r5, r1, 16
	cmp r1, 0
	bgt _0811D720
_0811D750:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811D760: .4byte 0xffff0000
	thumb_func_end sub_811D6E8

	thumb_func_start sub_811D764
sub_811D764: @ 811D764
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	mov r9, r0
	adds r5, r2, 0
	adds r4, r3, 0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 16
	lsrs r4, 16
	movs r2, 0xA0
	lsls r2, 1
	movs r1, 0xA
	bl memset
	movs r1, 0
	lsls r4, 16
	asrs r4, 16
	str r4, [sp, 0x4]
	lsls r5, 16
	asrs r5, 16
	str r5, [sp, 0x8]
_0811D79C:
	lsls r5, r1, 16
	asrs r0, r5, 16
	mov r10, r0
	ldr r1, [sp, 0x4]
	bl Sin
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r10
	ldr r1, [sp, 0x4]
	bl Cos
	ldr r2, [sp]
	lsls r1, r2, 16
	asrs r1, 16
	lsls r4, 16
	asrs r4, 16
	subs r2, r1, r4
	lsls r2, 16
	adds r1, r4
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r0, 16
	asrs r0, 16
	ldr r3, [sp, 0x8]
	subs r1, r3, r0
	lsls r1, 16
	lsrs r7, r1, 16
	adds r0, r3, r0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsrs r1, r2, 16
	str r5, [sp, 0x10]
	cmp r2, 0
	bge _0811D7E8
	movs r1, 0
_0811D7E8:
	lsls r0, r6, 16
	asrs r0, 16
	cmp r0, 0xF0
	ble _0811D7F2
	movs r6, 0xF0
_0811D7F2:
	lsls r0, r7, 16
	cmp r0, 0
	bge _0811D7FA
	movs r7, 0
_0811D7FA:
	mov r2, r8
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x9F
	ble _0811D808
	movs r3, 0x9F
	mov r8, r3
_0811D808:
	lsls r0, r1, 24
	lsrs r0, 16
	orrs r6, r0
	lsls r0, r7, 16
	asrs r0, 16
	str r0, [sp, 0xC]
	lsls r0, 1
	add r0, r9
	strh r6, [r0]
	mov r0, r8
	lsls r4, r0, 16
	asrs r0, r4, 15
	add r0, r9
	strh r6, [r0]
	mov r0, r10
	adds r0, 0x1
	lsls r0, 16
	asrs r0, 16
	ldr r1, [sp, 0x4]
	bl Cos
	lsls r0, 16
	asrs r0, 16
	ldr r2, [sp, 0x8]
	subs r1, r2, r0
	lsls r1, 16
	adds r0, r2, r0
	lsls r0, 16
	lsrs r2, r0, 16
	lsrs r3, r1, 16
	cmp r1, 0
	bge _0811D84A
	movs r3, 0
_0811D84A:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x9F
	ble _0811D854
	movs r2, 0x9F
_0811D854:
	lsls r0, r3, 16
	asrs r1, r0, 16
	adds r3, r0, 0
	lsls r5, r2, 16
	ldr r0, [sp, 0xC]
	cmp r0, r1
	ble _0811D878
	adds r2, r1, 0
_0811D864:
	lsls r1, r7, 16
	ldr r0, _0811D8F8 @ =0xffff0000
	adds r1, r0
	asrs r0, r1, 15
	add r0, r9
	strh r6, [r0]
	lsrs r7, r1, 16
	asrs r1, 16
	cmp r1, r2
	bgt _0811D864
_0811D878:
	lsls r1, r7, 16
	asrs r0, r3, 16
	cmp r1, r3
	bge _0811D896
	adds r2, r0, 0
_0811D882:
	movs r3, 0x80
	lsls r3, 9
	adds r0, r1, r3
	asrs r1, r0, 15
	add r1, r9
	strh r6, [r1]
	adds r1, r0, 0
	asrs r0, r1, 16
	cmp r0, r2
	blt _0811D882
_0811D896:
	asrs r0, r5, 16
	cmp r4, r5
	ble _0811D8B4
	adds r1, r0, 0
_0811D89E:
	ldr r2, _0811D8F8 @ =0xffff0000
	adds r0, r4, r2
	lsrs r3, r0, 16
	mov r8, r3
	asrs r0, 15
	add r0, r9
	strh r6, [r0]
	lsls r4, r3, 16
	asrs r0, r4, 16
	cmp r0, r1
	bgt _0811D89E
_0811D8B4:
	mov r0, r8
	lsls r4, r0, 16
	asrs r0, r5, 16
	cmp r4, r5
	bge _0811D8D4
	adds r2, r0, 0
_0811D8C0:
	movs r1, 0x80
	lsls r1, 9
	adds r0, r4, r1
	asrs r1, r0, 15
	add r1, r9
	strh r6, [r1]
	adds r4, r0, 0
	asrs r0, r4, 16
	cmp r0, r2
	blt _0811D8C0
_0811D8D4:
	ldr r2, [sp, 0x10]
	movs r3, 0x80
	lsls r3, 9
	adds r0, r2, r3
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x3F
	bgt _0811D8E6
	b _0811D79C
_0811D8E6:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811D8F8: .4byte 0xffff0000
	thumb_func_end sub_811D764

	thumb_func_start sub_811D8FC
sub_811D8FC: @ 811D8FC
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r0, [sp, 0x14]
	ldr r5, [sp, 0x18]
	ldr r4, [sp, 0x1C]
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 16
	lsrs r3, 16
	lsls r0, 16
	lsrs r0, 16
	adds r7, r0, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 16
	lsrs r4, 16
	strh r1, [r6]
	strh r2, [r6, 0x2]
	strh r1, [r6, 0x4]
	strh r2, [r6, 0x6]
	strh r3, [r6, 0x8]
	strh r7, [r6, 0xA]
	strh r5, [r6, 0xC]
	strh r4, [r6, 0xE]
	lsls r3, 16
	asrs r3, 16
	lsls r1, 16
	asrs r1, 16
	subs r3, r1
	strh r3, [r6, 0x10]
	lsls r0, r3, 16
	cmp r0, 0
	bge _0811D94E
	negs r0, r3
	strh r0, [r6, 0x10]
	lsls r0, r5, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r6, 0xC]
_0811D94E:
	lsls r0, r7, 16
	asrs r0, 16
	lsls r1, r2, 16
	asrs r1, 16
	subs r1, r0, r1
	strh r1, [r6, 0x12]
	lsls r0, r1, 16
	cmp r0, 0
	bge _0811D96C
	negs r0, r1
	strh r0, [r6, 0x12]
	lsls r0, r4, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r6, 0xE]
_0811D96C:
	movs r0, 0
	strh r0, [r6, 0x14]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_811D8FC

	thumb_func_start sub_811D978
sub_811D978: @ 811D978
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r3, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	ldrh r0, [r3, 0x10]
	mov r8, r0
	movs r1, 0x10
	ldrsh r6, [r3, r1]
	ldrh r2, [r3, 0x12]
	mov r12, r2
	movs r4, 0x12
	ldrsh r5, [r3, r4]
	cmp r6, r5
	ble _0811D9C8
	ldrh r0, [r3, 0xC]
	ldrh r2, [r3, 0x4]
	adds r1, r0, r2
	strh r1, [r3, 0x4]
	ldrh r2, [r3, 0x14]
	add r2, r12
	strh r2, [r3, 0x14]
	lsls r1, r2, 16
	asrs r1, 16
	adds r4, r0, 0
	ldrh r7, [r3, 0xE]
	cmp r1, r6
	ble _0811D9EE
	ldrh r1, [r3, 0x6]
	adds r0, r7, r1
	strh r0, [r3, 0x6]
	mov r1, r8
	b _0811D9EA
_0811D9C8:
	ldrh r0, [r3, 0xE]
	ldrh r2, [r3, 0x6]
	adds r1, r0, r2
	strh r1, [r3, 0x6]
	ldrh r2, [r3, 0x14]
	add r2, r8
	strh r2, [r3, 0x14]
	lsls r1, r2, 16
	asrs r1, 16
	ldrh r4, [r3, 0xC]
	adds r7, r0, 0
	cmp r1, r5
	ble _0811D9EE
	ldrh r1, [r3, 0x4]
	adds r0, r4, r1
	strh r0, [r3, 0x4]
	mov r1, r12
_0811D9EA:
	subs r0, r2, r1
	strh r0, [r3, 0x14]
_0811D9EE:
	movs r5, 0
	lsls r0, r4, 16
	asrs r2, r0, 16
	cmp r2, 0
	ble _0811DA06
	movs r4, 0x4
	ldrsh r1, [r3, r4]
	movs r4, 0x8
	ldrsh r0, [r3, r4]
	ldrh r4, [r3, 0x8]
	cmp r1, r0
	bge _0811DA18
_0811DA06:
	cmp r2, 0
	bge _0811DA26
	movs r0, 0x4
	ldrsh r1, [r3, r0]
	movs r2, 0x8
	ldrsh r0, [r3, r2]
	ldrh r4, [r3, 0x8]
	cmp r1, r0
	bgt _0811DA26
_0811DA18:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r9
	cmp r0, 0
	beq _0811DA26
	strh r4, [r3, 0x4]
_0811DA26:
	lsls r0, r7, 16
	asrs r2, r0, 16
	cmp r2, 0
	ble _0811DA3C
	movs r4, 0x6
	ldrsh r1, [r3, r4]
	movs r4, 0xA
	ldrsh r0, [r3, r4]
	ldrh r4, [r3, 0xA]
	cmp r1, r0
	bge _0811DA4E
_0811DA3C:
	cmp r2, 0
	bge _0811DA5C
	movs r0, 0x6
	ldrsh r1, [r3, r0]
	movs r2, 0xA
	ldrsh r0, [r3, r2]
	ldrh r4, [r3, 0xA]
	cmp r1, r0
	bgt _0811DA5C
_0811DA4E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r10
	cmp r0, 0
	beq _0811DA5C
	strh r4, [r3, 0x6]
_0811DA5C:
	cmp r5, 0x2
	beq _0811DA64
	movs r0, 0
	b _0811DA66
_0811DA64:
	movs r0, 0x1
_0811DA66:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_811D978

	.align 2, 0 @ Don't pad with nop.
