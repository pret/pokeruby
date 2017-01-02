	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start remove_some_task
remove_some_task: @ 8089578
	push {r4,lr}
	ldr r4, _080895A8 @ =gUnknown_03004DC0
	movs r0, 0
	strb r0, [r4, 0x15]
	ldr r1, _080895AC @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _080895B0 @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _080895B4 @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	ldrb r0, [r4, 0x18]
	cmp r0, 0xFF
	beq _080895A2
	bl DestroyTask
	movs r0, 0xFF
	strb r0, [r4, 0x18]
_080895A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080895A8: .4byte gUnknown_03004DC0
_080895AC: .4byte 0x040000b0
_080895B0: .4byte 0x0000c5ff
_080895B4: .4byte 0x00007fff
	thumb_func_end remove_some_task

	thumb_func_start dp12_8087EA4
dp12_8087EA4: @ 80895B8
	push {r4,lr}
	sub sp, 0x4
	mov r0, sp
	movs r4, 0
	strh r4, [r0]
	ldr r1, _080895EC @ =gUnknown_03004DE0
	ldr r2, _080895F0 @ =0x01000780
	bl CpuSet
	ldr r0, _080895F4 @ =gUnknown_03004DC0
	movs r1, 0
	str r1, [r0]
	str r1, [r0, 0x4]
	str r1, [r0, 0x8]
	str r1, [r0, 0xC]
	strb r4, [r0, 0x14]
	strb r4, [r0, 0x15]
	strb r4, [r0, 0x16]
	strb r4, [r0, 0x17]
	movs r1, 0xFF
	strb r1, [r0, 0x18]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080895EC: .4byte gUnknown_03004DE0
_080895F0: .4byte 0x01000780
_080895F4: .4byte gUnknown_03004DC0
	thumb_func_end dp12_8087EA4

	thumb_func_start sub_80895F8
sub_80895F8: @ 80895F8
	push {lr}
	sub sp, 0xC
	str r0, [sp]
	str r1, [sp, 0x4]
	str r2, [sp, 0x8]
	ldr r0, _0808961C @ =0xa2600001
	cmp r1, r0
	bne _0808962C
	ldr r0, _08089620 @ =gUnknown_03004DC0
	ldr r1, _08089624 @ =gUnknown_03004DE2
	str r1, [r0]
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r2
	str r1, [r0, 0x4]
	ldr r1, _08089628 @ =sub_80896F4
	b _0808963C
	.align 2, 0
_0808961C: .4byte 0xa2600001
_08089620: .4byte gUnknown_03004DC0
_08089624: .4byte gUnknown_03004DE2
_08089628: .4byte sub_80896F4
_0808962C:
	ldr r0, _0808965C @ =gUnknown_03004DC0
	ldr r1, _08089660 @ =gUnknown_03004DE4
	str r1, [r0]
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r2
	str r1, [r0, 0x4]
	ldr r1, _08089664 @ =sub_8089714
_0808963C:
	str r1, [r0, 0x10]
	adds r1, r0, 0
	ldr r0, [sp, 0x4]
	str r0, [r1, 0xC]
	ldr r0, [sp]
	str r0, [r1, 0x8]
	mov r0, sp
	ldrb r0, [r0, 0x8]
	strb r0, [r1, 0x15]
	mov r0, sp
	ldrb r0, [r0, 0x9]
	strb r0, [r1, 0x16]
	strb r0, [r1, 0x17]
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_0808965C: .4byte gUnknown_03004DC0
_08089660: .4byte gUnknown_03004DE4
_08089664: .4byte sub_8089714
	thumb_func_end sub_80895F8

	thumb_func_start sub_8089668
sub_8089668: @ 8089668
	push {r4,lr}
	ldr r4, _08089698 @ =gUnknown_03004DC0
	ldrb r0, [r4, 0x15]
	cmp r0, 0
	beq _080896E2
	cmp r0, 0x3
	bne _080896AC
	movs r0, 0
	strb r0, [r4, 0x15]
	ldr r1, _0808969C @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _080896A0 @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _080896A4 @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	ldr r1, _080896A8 @ =gUnknown_0202FFA4
	movs r0, 0x1
	strb r0, [r1]
	b _080896E2
	.align 2, 0
_08089698: .4byte gUnknown_03004DC0
_0808969C: .4byte 0x040000b0
_080896A0: .4byte 0x0000c5ff
_080896A4: .4byte 0x00007fff
_080896A8: .4byte gUnknown_0202FFA4
_080896AC:
	ldr r1, _080896E8 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _080896EC @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _080896F0 @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	ldrb r0, [r4, 0x14]
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r4, 0x8]
	str r0, [r1, 0x4]
	ldr r0, [r4, 0xC]
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r0, [r4, 0x10]
	bl _call_via_r0
	ldrb r0, [r4, 0x14]
	movs r1, 0x1
	eors r0, r1
	strb r0, [r4, 0x14]
_080896E2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080896E8: .4byte 0x040000b0
_080896EC: .4byte 0x0000c5ff
_080896F0: .4byte 0x00007fff
	thumb_func_end sub_8089668

	thumb_func_start sub_80896F4
sub_80896F4: @ 80896F4
	ldr r0, _0808970C @ =gUnknown_03004DC0
	ldr r2, [r0, 0x8]
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	ldr r1, _08089710 @ =gUnknown_03004DE0
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	bx lr
	.align 2, 0
_0808970C: .4byte gUnknown_03004DC0
_08089710: .4byte gUnknown_03004DE0
	thumb_func_end sub_80896F4

	thumb_func_start sub_8089714
sub_8089714: @ 8089714
	ldr r0, _0808972C @ =gUnknown_03004DC0
	ldr r2, [r0, 0x8]
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	ldr r1, _08089730 @ =gUnknown_03004DE0
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2]
	bx lr
	.align 2, 0
_0808972C: .4byte gUnknown_03004DC0
_08089730: .4byte gUnknown_03004DE0
	thumb_func_end sub_8089714

	thumb_func_start task00_for_dp12
task00_for_dp12: @ 8089734
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	movs r6, 0
	ldr r0, _0808975C @ =gUnknown_0202FFA4
	ldrb r0, [r0]
	cmp r0, 0
	beq _08089764
	mov r0, r12
	bl DestroyTask
	ldr r1, _08089760 @ =gUnknown_03004DC0
	movs r0, 0xFF
	strb r0, [r1, 0x18]
	b _080898E4
	.align 2, 0
_0808975C: .4byte gUnknown_0202FFA4
_08089760: .4byte gUnknown_03004DC0
_08089764:
	ldr r1, _08089790 @ =gTasks
	mov r0, r12
	lsls r2, r0, 2
	adds r0, r2, r0
	lsls r0, 3
	adds r3, r0, r1
	movs r4, 0x16
	ldrsh r0, [r3, r4]
	mov r10, r1
	mov r9, r2
	cmp r0, 0
	beq _08089810
	movs r1, 0x14
	ldrsh r0, [r3, r1]
	cmp r0, 0xE
	bhi _08089810
	lsls r0, 2
	ldr r1, _08089794 @ =_08089798
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08089790: .4byte gTasks
_08089794: .4byte _08089798
	.align 2, 0
_08089798:
	.4byte _080897D4
	.4byte _08089810
	.4byte _080897DC
	.4byte _08089810
	.4byte _080897E4
	.4byte _08089810
	.4byte _080897EC
	.4byte _08089810
	.4byte _080897F4
	.4byte _08089810
	.4byte _080897FC
	.4byte _08089810
	.4byte _08089804
	.4byte _08089810
	.4byte _0808980C
_080897D4:
	ldr r0, _080897D8 @ =gUnknown_030042A4
	b _0808980E
	.align 2, 0
_080897D8: .4byte gUnknown_030042A4
_080897DC:
	ldr r0, _080897E0 @ =gUnknown_030042A0
	b _0808980E
	.align 2, 0
_080897E0: .4byte gUnknown_030042A0
_080897E4:
	ldr r0, _080897E8 @ =gUnknown_030042C0
	b _0808980E
	.align 2, 0
_080897E8: .4byte gUnknown_030042C0
_080897EC:
	ldr r0, _080897F0 @ =gUnknown_030041B4
	b _0808980E
	.align 2, 0
_080897F0: .4byte gUnknown_030041B4
_080897F4:
	ldr r0, _080897F8 @ =gUnknown_03004288
	b _0808980E
	.align 2, 0
_080897F8: .4byte gUnknown_03004288
_080897FC:
	ldr r0, _08089800 @ =gUnknown_03004280
	b _0808980E
	.align 2, 0
_08089800: .4byte gUnknown_03004280
_08089804:
	ldr r0, _08089808 @ =gUnknown_030041B0
	b _0808980E
	.align 2, 0
_08089808: .4byte gUnknown_030041B0
_0808980C:
	ldr r0, _08089870 @ =gUnknown_030041B8
_0808980E:
	ldrh r6, [r0]
_08089810:
	mov r0, r9
	add r0, r12
	lsls r0, 3
	mov r2, r10
	adds r1, r0, r2
	ldrh r2, [r1, 0x10]
	movs r3, 0x10
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _0808987C
	subs r0, r2, 0x1
	strh r0, [r1, 0x10]
	movs r4, 0xE
	ldrsh r0, [r1, r4]
	movs r3, 0xA0
	lsls r3, 1
	adds r2, r0, r3
	movs r4, 0x8
	ldrsh r3, [r1, r4]
	movs r4, 0xA
	ldrsh r0, [r1, r4]
	cmp r3, r0
	bge _080898E4
	ldr r5, _08089874 @ =gUnknown_03004DE0
	ldr r0, _08089878 @ =gUnknown_03004DC0
	mov r8, r0
	adds r7, r1, 0
	lsls r0, r2, 1
	adds r4, r0, r5
_0808984A:
	lsls r2, r3, 1
	mov r0, r8
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r5
	ldrh r0, [r4]
	adds r0, r6
	strh r0, [r2]
	adds r4, 0x2
	adds r3, 0x1
	movs r1, 0xA
	ldrsh r0, [r7, r1]
	cmp r3, r0
	blt _0808984A
	b _080898E4
	.align 2, 0
_08089870: .4byte gUnknown_030041B8
_08089874: .4byte gUnknown_03004DE0
_08089878: .4byte gUnknown_03004DC0
_0808987C:
	ldrh r0, [r1, 0x12]
	strh r0, [r1, 0x10]
	movs r2, 0xE
	ldrsh r0, [r1, r2]
	movs r3, 0xA0
	lsls r3, 1
	adds r2, r0, r3
	movs r4, 0x8
	ldrsh r3, [r1, r4]
	movs r4, 0xA
	ldrsh r0, [r1, r4]
	cmp r3, r0
	bge _080898C4
	ldr r5, _080898F4 @ =gUnknown_03004DE0
	adds r7, r1, 0
	lsls r0, r2, 1
	adds r4, r0, r5
	ldr r0, _080898F8 @ =gUnknown_03004DC0
	mov r8, r0
_080898A2:
	lsls r2, r3, 1
	mov r0, r8
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r5
	ldrh r0, [r4]
	adds r0, r6
	strh r0, [r2]
	adds r4, 0x2
	adds r3, 0x1
	movs r1, 0xA
	ldrsh r0, [r7, r1]
	cmp r3, r0
	blt _080898A2
_080898C4:
	mov r0, r9
	add r0, r12
	lsls r0, 3
	mov r3, r10
	adds r2, r0, r3
	ldrh r0, [r2, 0xE]
	adds r0, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	asrs r0, 16
	movs r4, 0xC
	ldrsh r1, [r2, r4]
	cmp r0, r1
	bne _080898E4
	movs r0, 0
	strh r0, [r2, 0xE]
_080898E4:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080898F4: .4byte gUnknown_03004DE0
_080898F8: .4byte gUnknown_03004DC0
	thumb_func_end task00_for_dp12

	thumb_func_start sub_80898FC
sub_80898FC: @ 80898FC
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	movs r1, 0
	movs r2, 0
	ldr r0, _08089940 @ =gSineTable
	mov r12, r0
_08089910:
	lsls r0, r1, 1
	adds r3, r0, r6
	lsls r0, r2, 1
	add r0, r12
	movs r7, 0
	ldrsh r0, [r0, r7]
	muls r0, r4
	cmp r0, 0
	bge _08089924
	adds r0, 0xFF
_08089924:
	asrs r0, 8
	strh r0, [r3]
	adds r0, r2, r5
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xFF
	bls _08089910
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089940: .4byte gSineTable
	thumb_func_end sub_80898FC

	thumb_func_start sub_8089944
sub_8089944: @ 8089944
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	adds r5, r0, 0
	str r1, [sp, 0x10]
	ldr r0, [sp, 0x40]
	mov r8, r0
	ldr r1, [sp, 0x44]
	mov r9, r1
	ldr r0, [sp, 0x48]
	mov r10, r0
	lsls r5, 24
	lsrs r5, 24
	ldr r1, [sp, 0x10]
	lsls r1, 24
	str r1, [sp, 0x14]
	lsrs r0, r1, 24
	str r0, [sp, 0xC]
	lsls r1, r2, 24
	lsrs r1, 24
	str r1, [sp, 0x18]
	lsls r2, r3, 24
	lsrs r2, 24
	str r2, [sp, 0x1C]
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	mov r3, r9
	lsls r3, 24
	lsrs r3, 24
	mov r9, r3
	mov r0, r10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	bl dp12_8087EA4
	ldr r0, _08089A50 @ =REG_BG0HOFS
	add r0, r9
	str r0, [sp]
	ldr r0, _08089A54 @ =0xa2600001
	str r0, [sp, 0x4]
	mov r1, sp
	movs r0, 0x1
	strb r0, [r1, 0x8]
	mov r0, sp
	movs r1, 0
	strb r1, [r0, 0x9]
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl sub_80895F8
	ldr r0, _08089A58 @ =task00_for_dp12
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08089A5C @ =gTasks
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r0
	strh r5, [r4, 0x8]
	mov r3, sp
	ldrh r3, [r3, 0xC]
	strh r3, [r4, 0xA]
	movs r0, 0x80
	lsls r0, 1
	ldr r1, [sp, 0x18]
	bl __divsi3
	strh r0, [r4, 0xC]
	movs r0, 0
	strh r0, [r4, 0xE]
	mov r1, r8
	strh r1, [r4, 0x10]
	strh r1, [r4, 0x12]
	mov r3, r9
	strh r3, [r4, 0x14]
	mov r0, r10
	strh r0, [r4, 0x16]
	ldr r0, _08089A60 @ =gUnknown_03004DC0
	strb r7, [r0, 0x18]
	ldr r0, _08089A64 @ =gUnknown_0202FFA4
	movs r1, 0
	strb r1, [r0]
	ldr r4, _08089A68 @ =gUnknown_03005060
	ldr r3, [sp, 0xC]
	subs r6, r3, r5
	lsls r3, r6, 24
	lsrs r3, 24
	adds r0, r4, 0
	ldr r1, [sp, 0x18]
	ldr r2, [sp, 0x1C]
	bl sub_80898FC
	ldr r0, [sp, 0xC]
	cmp r5, r0
	bge _08089A3E
	ldr r1, _08089A6C @ =0xfffffd80
	adds r2, r4, r1
	lsls r1, r5, 1
	movs r3, 0xF0
	lsls r3, 3
	adds r0, r1, r3
	adds r3, r0, r2
	adds r1, r2
	adds r2, r4, 0
	adds r5, r6, 0
_08089A2A:
	ldrh r0, [r2]
	strh r0, [r1]
	ldrh r0, [r2]
	strh r0, [r3]
	adds r2, 0x2
	adds r3, 0x2
	adds r1, 0x2
	subs r5, 0x1
	cmp r5, 0
	bne _08089A2A
_08089A3E:
	adds r0, r7, 0
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08089A50: .4byte REG_BG0HOFS
_08089A54: .4byte 0xa2600001
_08089A58: .4byte task00_for_dp12
_08089A5C: .4byte gTasks
_08089A60: .4byte gUnknown_03004DC0
_08089A64: .4byte gUnknown_0202FFA4
_08089A68: .4byte gUnknown_03005060
_08089A6C: .4byte 0xfffffd80
	thumb_func_end sub_8089944

	.align 2, 0 @ Don't pad with nop.
