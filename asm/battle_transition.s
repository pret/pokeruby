	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text


	thumb_func_start VBlankCB_Phase2_Transition6
VBlankCB_Phase2_Transition6: @ 811BE3C
	push {lr}
	bl VBlankCB_BattleTransition
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
	thumb_func_end VBlankCB_Phase2_Transition6

	thumb_func_start HBlankCB_Phase2_Transition6
HBlankCB_Phase2_Transition6: @ 811BE74
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
	thumb_func_end HBlankCB_Phase2_Transition6

	thumb_func_start Phase2Task_Transition7
Phase2Task_Transition7: @ 811BEA0
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
	thumb_func_end Phase2Task_Transition7

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
	ldr r0, _0811C000 @ =Phase2Task_Transition7
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
_0811C000: .4byte Phase2Task_Transition7
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
	bl VBlankCB_BattleTransition
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

	thumb_func_start Phase2Task_Transition12
Phase2Task_Transition12: @ 811C08C
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
	thumb_func_end Phase2Task_Transition12

	thumb_func_start Phase2Task_Transition13
Phase2Task_Transition13: @ 811C0AC
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
	thumb_func_end Phase2Task_Transition13

	thumb_func_start Phase2Task_Transition14
Phase2Task_Transition14: @ 811C0CC
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
	thumb_func_end Phase2Task_Transition14

	thumb_func_start Phase2Task_Transition15
Phase2Task_Transition15: @ 811C0EC
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
	thumb_func_end Phase2Task_Transition15

	thumb_func_start Phase2Task_Transition16
Phase2Task_Transition16: @ 811C10C
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
	thumb_func_end Phase2Task_Transition16

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
	bl VBlankCB_BattleTransition
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
	bl VBlankCB_BattleTransition
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

	thumb_func_start Phase2Task_Transition8
Phase2Task_Transition8: @ 811CA5C
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
	thumb_func_end Phase2Task_Transition8

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
	ldr r0, _0811CC24 @ =Phase2Task_Transition8
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
_0811CC24: .4byte Phase2Task_Transition8
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
	bl VBlankCB_BattleTransition
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

	thumb_func_start Phase2Task_Transition9
Phase2Task_Transition9: @ 811CCDC
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
	thumb_func_end Phase2Task_Transition9

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
	ldr r0, _0811CEE0 @ =Phase2Task_Transition9
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
_0811CEE0: .4byte Phase2Task_Transition9
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
	bl VBlankCB_BattleTransition
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
	bl VBlankCB_BattleTransition
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

	thumb_func_start Phase2Task_Transition10
Phase2Task_Transition10: @ 811D0B8
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
	thumb_func_end Phase2Task_Transition10

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
	ldr r0, _0811D1C4 @ =Phase2Task_Transition10
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0811D1BC:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0811D1C4: .4byte Phase2Task_Transition10
	thumb_func_end sub_811D19C

	thumb_func_start Phase2Task_Transition11
Phase2Task_Transition11: @ 811D1C8
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
	thumb_func_end Phase2Task_Transition11

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
	ldr r0, _0811D3F8 @ =Phase2Task_Transition11
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
_0811D3F8: .4byte Phase2Task_Transition11
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
	bl VBlankCB_BattleTransition
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

	thumb_func_start VBlankCB_BattleTransition
VBlankCB_BattleTransition: @ 811D67C
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end VBlankCB_BattleTransition

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
