	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80F55AC
sub_80F55AC: @ 80F55AC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r6, r0, 0
	mov r8, r1
	ldr r1, _080F5674 @ =gUnknown_083E4890
	ldrb r0, [r6]
	adds r0, r1
	ldrb r2, [r0]
	adds r6, 0x1
	movs r0, 0x9B
	mov r3, r8
	strh r0, [r3]
	movs r0, 0x5B
	subs r0, r2
	strh r0, [r3, 0x2]
	movs r7, 0x40
	movs r0, 0
	mov r12, r0
	movs r2, 0x1
	mov r9, r2
	ldr r3, _080F5678 @ =gSineTable
	mov r10, r3
_080F55DE:
	adds r0, r7, 0
	adds r0, 0x33
	lsls r0, 24
	lsrs r7, r0, 24
	mov r1, r12
	lsls r0, r1, 24
	movs r2, 0xFF
	lsls r2, 24
	adds r0, r2
	lsrs r3, r0, 24
	mov r12, r3
	cmp r0, 0
	bge _080F55FC
	movs r0, 0x4
	mov r12, r0
_080F55FC:
	mov r1, r12
	lsls r0, r1, 24
	asrs r4, r0, 24
	cmp r4, 0x2
	bne _080F560C
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_080F560C:
	ldrb r0, [r6]
	ldr r2, _080F5674 @ =gUnknown_083E4890
	adds r0, r2
	ldrb r2, [r0]
	adds r6, 0x1
	lsls r0, r4, 2
	mov r1, r8
	adds r3, r0, r1
	adds r0, r7, 0
	adds r0, 0x40
	lsls r0, 1
	add r0, r10
	movs r1, 0
	ldrsh r0, [r0, r1]
	muls r0, r2
	asrs r5, r0, 8
	adds r0, r5, 0
	adds r0, 0x9B
	strh r0, [r3]
	lsls r0, r7, 1
	add r0, r10
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r1, r2, 0
	muls r1, r0
	asrs r1, 8
	movs r0, 0x5B
	subs r0, r1
	strh r0, [r3, 0x2]
	cmp r4, 0x2
	bgt _080F5658
	cmp r2, 0x20
	bne _080F5652
	cmp r4, 0x2
	beq _080F5658
_080F5652:
	adds r0, r5, 0
	adds r0, 0x9C
	strh r0, [r3]
_080F5658:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	cmp r0, 0x4
	bls _080F55DE
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F5674: .4byte gUnknown_083E4890
_080F5678: .4byte gSineTable
	thumb_func_end sub_80F55AC

	thumb_func_start sub_80F567C
sub_80F567C: @ 80F567C
	push {lr}
	bl sub_80F55AC
	pop {r0}
	bx r0
	thumb_func_end sub_80F567C

	thumb_func_start sub_80F5688
sub_80F5688: @ 80F5688
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	adds r6, r0, 0
	adds r5, r1, 0
	str r2, [sp]
	ldr r7, [sp, 0x34]
	lsls r3, 24
	lsrs r3, 24
	mov r9, r3
	movs r0, 0
	str r0, [sp, 0x8]
	ldrh r0, [r5, 0x2]
	ldrh r1, [r2, 0x2]
	cmp r0, r1
	bcs _080F56D0
	adds r2, r0, 0
	str r2, [sp, 0x4]
	ldr r3, [sp]
	ldrh r0, [r3, 0x2]
	ldrh r1, [r5]
	lsls r4, r1, 10
	ldrh r2, [r3]
	mov r10, r2
	ldr r3, [sp, 0x4]
	subs r0, r3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r0, 0
	beq _080F56FC
	subs r0, r2, r1
	b _080F56F2
_080F56D0:
	ldrh r0, [r5, 0x2]
	ldr r1, [sp]
	ldrh r1, [r1, 0x2]
	str r1, [sp, 0x4]
	ldr r2, [sp]
	ldrh r1, [r2]
	lsls r4, r1, 10
	ldrh r3, [r5]
	mov r10, r3
	ldr r2, [sp, 0x4]
	subs r0, r2
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r0, 0
	beq _080F56FC
	subs r0, r3, r1
_080F56F2:
	lsls r0, 10
	mov r1, r8
	bl __divsi3
	str r0, [sp, 0x8]
_080F56FC:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r7, 0
	bne _080F5746
	ldr r0, [sp, 0x4]
	subs r0, 0x38
	lsls r0, 2
	adds r6, r0
	movs r5, 0
	mov r3, r9
	lsls r3, 1
	mov r12, r3
	mov r0, r10
	add r0, r9
	str r0, [sp, 0xC]
	cmp r7, r8
	bcs _080F57D4
	movs r7, 0x1
_080F5726:
	adds r2, r3, r6
	asrs r1, r4, 10
	asrs r0, r4, 9
	ands r0, r7
	adds r1, r0
	add r1, r9
	strh r1, [r2]
	ldr r1, [sp, 0x8]
	adds r4, r1
	adds r6, 0x4
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r8
	bcc _080F5726
	b _080F57D4
_080F5746:
	ldr r2, [sp, 0x8]
	cmp r2, 0
	ble _080F57E4
	ldr r0, [sp, 0x4]
	subs r0, 0x38
	lsls r0, 2
	adds r7, r0
	movs r5, 0
	mov r3, r9
	lsls r3, 1
	mov r12, r3
	mov r0, r10
	add r0, r9
	str r0, [sp, 0xC]
	cmp r5, r8
	bcs _080F5798
	ldr r0, _080F57D8 @ =0x00026bff
	cmp r4, r0
	bgt _080F5798
	mov r1, r12
	str r1, [sp, 0x10]
	mov r10, r0
_080F5772:
	ldr r3, [sp, 0x10]
	adds r2, r3, r7
	asrs r1, r4, 10
	asrs r0, r4, 9
	movs r3, 0x1
	ands r0, r3
	adds r1, r0
	add r1, r9
	strh r1, [r2]
	ldr r0, [sp, 0x8]
	adds r4, r0
	adds r7, 0x4
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r8
	bcs _080F5798
	cmp r4, r10
	ble _080F5772
_080F5798:
	ldr r1, _080F57DC @ =gUnknown_083DFEC4
	ldr r0, [r1]
	ldr r2, [sp, 0x4]
	adds r1, r2, r5
	ldr r3, _080F57E0 @ =0x00009340
	adds r0, r3
	strh r1, [r0]
	ldrh r0, [r0]
	subs r0, 0x38
	lsls r0, 2
	adds r6, r0
	cmp r5, r8
	bcs _080F57D4
	mov r3, r12
	movs r7, 0x1
_080F57B6:
	adds r2, r3, r6
	asrs r1, r4, 10
	asrs r0, r4, 9
	ands r0, r7
	adds r1, r0
	add r1, r9
	strh r1, [r2]
	ldr r0, [sp, 0x8]
	adds r4, r0
	adds r6, 0x4
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r8
	bcc _080F57B6
_080F57D4:
	subs r0, r6, 0x4
	b _080F58C4
	.align 2, 0
_080F57D8: .4byte 0x00026bff
_080F57DC: .4byte gUnknown_083DFEC4
_080F57E0: .4byte 0x00009340
_080F57E4:
	ldr r1, [sp, 0x8]
	cmp r1, 0
	bge _080F5890
	ldr r0, [sp, 0x4]
	subs r0, 0x38
	lsls r0, 2
	adds r6, r0
	movs r5, 0
	mov r2, r9
	lsls r2, 1
	mov r12, r2
	mov r3, r10
	add r3, r9
	str r3, [sp, 0xC]
	cmp r5, r8
	bcs _080F5842
	adds r3, r2, r6
	asrs r1, r4, 10
	asrs r0, r4, 9
	movs r2, 0x1
	ands r0, r2
	adds r1, r0
	add r1, r9
	strh r1, [r3]
	b _080F5838
_080F5816:
	ldr r0, [sp, 0x8]
	adds r4, r0
	adds r6, 0x4
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r8
	bcs _080F5842
	mov r1, r12
	adds r3, r1, r6
	asrs r2, r4, 10
	asrs r0, r4, 9
	movs r1, 0x1
	ands r0, r1
	adds r2, r0
	add r2, r9
	strh r2, [r3]
_080F5838:
	ldr r0, _080F5884 @ =0x00026bff
	cmp r4, r0
	bgt _080F5816
	movs r0, 0x9B
	strh r0, [r3]
_080F5842:
	ldr r2, _080F5888 @ =gUnknown_083DFEC4
	ldr r0, [r2]
	ldr r3, [sp, 0x4]
	adds r1, r3, r5
	ldr r2, _080F588C @ =0x00009340
	adds r0, r2
	strh r1, [r0]
	ldrh r0, [r0]
	subs r0, 0x38
	lsls r0, 2
	adds r7, r0
	cmp r5, r8
	bcs _080F587E
	mov r3, r12
	movs r6, 0x1
_080F5860:
	adds r2, r3, r7
	asrs r1, r4, 10
	asrs r0, r4, 9
	ands r0, r6
	adds r1, r0
	add r1, r9
	strh r1, [r2]
	ldr r0, [sp, 0x8]
	adds r4, r0
	adds r7, 0x4
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r8
	bcc _080F5860
_080F587E:
	subs r0, r7, 0x4
	b _080F58C4
	.align 2, 0
_080F5884: .4byte 0x00026bff
_080F5888: .4byte gUnknown_083DFEC4
_080F588C: .4byte 0x00009340
_080F5890:
	ldr r0, _080F58BC @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F58C0 @ =0x00009340
	adds r0, r1
	mov r2, sp
	ldrh r2, [r2, 0x4]
	strh r2, [r0]
	ldr r0, [sp, 0x4]
	subs r0, 0x38
	lsls r0, 2
	adds r6, r0
	adds r7, r0
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r6, 0x2]
	ldr r3, [sp]
	ldrh r0, [r3]
	strh r0, [r7]
	movs r0, 0x9B
	strh r0, [r7, 0x2]
	b _080F58CC
	.align 2, 0
_080F58BC: .4byte gUnknown_083DFEC4
_080F58C0: .4byte 0x00009340
_080F58C4:
	add r0, r12
	mov r1, sp
	ldrh r1, [r1, 0xC]
	strh r1, [r0]
_080F58CC:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80F5688

	thumb_func_start sub_80F58DC
sub_80F58DC: @ 80F58DC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r0, [r5, 0x2]
	ldrh r1, [r5, 0x6]
	cmp r0, r1
	bcs _080F5914
	adds r4, r0, 0
	mov r8, r4
	ldr r0, _080F590C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F5910 @ =0x00009130
	adds r0, r1
	adds r4, r5, 0x4
	movs r1, 0
	str r1, [sp]
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0x1
	bl sub_80F5688
	b _080F5930
	.align 2, 0
_080F590C: .4byte gUnknown_083DFEC4
_080F5910: .4byte 0x00009130
_080F5914:
	ldrh r4, [r5, 0x6]
	mov r8, r4
	ldr r0, _080F5A08 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F5A0C @ =0x00009130
	adds r0, r1
	adds r4, r5, 0x4
	movs r1, 0
	str r1, [sp]
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0
	bl sub_80F5688
_080F5930:
	adds r1, r4, 0
	ldr r0, _080F5A08 @ =gUnknown_083DFEC4
	ldr r6, [r0]
	ldr r0, _080F5A0C @ =0x00009130
	adds r4, r6, r0
	adds r7, r5, 0
	adds r7, 0x8
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	adds r2, r7, 0
	movs r3, 0x1
	bl sub_80F5688
	movs r3, 0
	ldrh r0, [r5, 0xA]
	ldrh r1, [r5, 0xE]
	cmp r0, r1
	bhi _080F5958
	movs r3, 0x1
_080F5958:
	adds r2, r5, 0
	adds r2, 0xC
	ldr r1, _080F5A10 @ =0x00009238
	adds r0, r6, r1
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r7, 0
	bl sub_80F5688
	movs r2, 0x38
	cmp r2, r8
	bcs _080F5990
	adds r7, r4, 0
	movs r3, 0
	ldr r0, _080F5A14 @ =0x00009132
	adds r4, r6, r0
_080F5978:
	adds r0, r2, 0
	subs r0, 0x38
	lsls r0, 2
	adds r1, r7, r0
	strh r3, [r1]
	adds r0, r4, r0
	strh r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r8
	bcc _080F5978
_080F5990:
	ldrh r2, [r5, 0x2]
	ldr r0, _080F5A08 @ =gUnknown_083DFEC4
	ldr r3, [r0]
	ldr r4, _080F5A18 @ =0x00009340
	adds r1, r3, r4
	adds r6, r0, 0
	ldrh r0, [r1]
	cmp r2, r0
	bhi _080F59BE
	ldr r4, _080F5A0C @ =0x00009130
	adds r3, r4
	movs r4, 0x9B
_080F59A8:
	adds r0, r2, 0
	subs r0, 0x38
	lsls r0, 2
	adds r0, r3, r0
	strh r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r1]
	cmp r2, r0
	bls _080F59A8
_080F59BE:
	ldr r4, [r6]
	ldr r1, _080F5A18 @ =0x00009340
	adds r0, r4, r1
	ldrh r0, [r0]
	ldrh r1, [r5, 0xA]
	cmp r0, r1
	bcs _080F59CE
	adds r0, r1, 0
_080F59CE:
	adds r0, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x79
	bhi _080F59FA
	ldr r0, _080F5A0C @ =0x00009130
	adds r5, r4, r0
	movs r3, 0
	ldr r1, _080F5A14 @ =0x00009132
	adds r4, r1
_080F59E2:
	adds r0, r2, 0
	subs r0, 0x38
	lsls r0, 2
	adds r1, r5, r0
	strh r3, [r1]
	adds r0, r4, r0
	strh r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x79
	bls _080F59E2
_080F59FA:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F5A08: .4byte gUnknown_083DFEC4
_080F5A0C: .4byte 0x00009130
_080F5A10: .4byte 0x00009238
_080F5A14: .4byte 0x00009132
_080F5A18: .4byte 0x00009340
	thumb_func_end sub_80F58DC

	thumb_func_start sub_80F5A1C
sub_80F5A1C: @ 80F5A1C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r0, [r5, 0x2]
	ldrh r1, [r5, 0x12]
	cmp r0, r1
	bcs _080F5A54
	adds r7, r0, 0
	ldr r0, _080F5A4C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080F5A50 @ =0x00009238
	adds r0, r2
	adds r4, r5, 0
	adds r4, 0x10
	movs r1, 0
	str r1, [sp]
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0
	bl sub_80F5688
	b _080F5A70
	.align 2, 0
_080F5A4C: .4byte gUnknown_083DFEC4
_080F5A50: .4byte 0x00009238
_080F5A54:
	ldrh r7, [r5, 0x12]
	ldr r0, _080F5B28 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r4, _080F5B2C @ =0x00009238
	adds r0, r4
	adds r4, r5, 0
	adds r4, 0x10
	movs r1, 0
	str r1, [sp]
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x1
	bl sub_80F5688
_080F5A70:
	adds r1, r4, 0
	ldr r0, _080F5B28 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	mov r8, r0
	ldr r4, _080F5B2C @ =0x00009238
	add r4, r8
	adds r2, r5, 0
	adds r2, 0xC
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0
	bl sub_80F5688
	movs r2, 0x38
	cmp r2, r7
	bcs _080F5AB2
	adds r6, r4, 0
	movs r3, 0
	ldr r4, _080F5B30 @ =0x0000923a
	add r4, r8
_080F5A9A:
	adds r0, r2, 0
	subs r0, 0x38
	lsls r0, 2
	adds r1, r6, r0
	strh r3, [r1]
	adds r0, r4, r0
	strh r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r7
	bcc _080F5A9A
_080F5AB2:
	ldrh r2, [r5, 0x2]
	ldr r0, _080F5B28 @ =gUnknown_083DFEC4
	ldr r3, [r0]
	ldr r4, _080F5B34 @ =0x00009340
	adds r1, r3, r4
	adds r6, r0, 0
	ldrh r0, [r1]
	cmp r2, r0
	bhi _080F5AE0
	ldr r4, _080F5B30 @ =0x0000923a
	adds r3, r4
	movs r4, 0x9B
_080F5ACA:
	adds r0, r2, 0
	subs r0, 0x38
	lsls r0, 2
	adds r0, r3, r0
	strh r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r1]
	cmp r2, r0
	bls _080F5ACA
_080F5AE0:
	ldrh r0, [r5, 0xE]
	adds r1, r0, 0x1
	ldr r3, [r6]
	ldr r2, _080F5B34 @ =0x00009340
	adds r0, r3, r2
	ldrh r0, [r0]
	cmp r0, r1
	bge _080F5AF2
	adds r0, r1, 0
_080F5AF2:
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x79
	bhi _080F5B1C
	ldr r4, _080F5B2C @ =0x00009238
	adds r5, r3, r4
	movs r4, 0
	ldr r0, _080F5B30 @ =0x0000923a
	adds r3, r0
_080F5B04:
	adds r0, r2, 0
	subs r0, 0x38
	lsls r0, 2
	adds r1, r5, r0
	strh r4, [r1]
	adds r0, r3, r0
	strh r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x79
	bls _080F5B04
_080F5B1C:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F5B28: .4byte gUnknown_083DFEC4
_080F5B2C: .4byte 0x00009238
_080F5B30: .4byte 0x0000923a
_080F5B34: .4byte 0x00009340
	thumb_func_end sub_80F5A1C

	thumb_func_start sub_80F5B38
sub_80F5B38: @ 80F5B38
	ldr r0, _080F5B48 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F5B4C @ =0x00009345
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	bx lr
	.align 2, 0
_080F5B48: .4byte gUnknown_083DFEC4
_080F5B4C: .4byte 0x00009345
	thumb_func_end sub_80F5B38

	thumb_func_start sub_80F5B50
sub_80F5B50: @ 80F5B50
	push {r4,r5,lr}
	sub sp, 0xC
	ldr r0, _080F5B68 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F5B6C @ =0x00009345
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	beq _080F5B70
	cmp r0, 0x1
	beq _080F5BB4
	b _080F5BCC
	.align 2, 0
_080F5B68: .4byte gUnknown_083DFEC4
_080F5B6C: .4byte 0x00009345
_080F5B70:
	bl ScanlineEffect_Clear
	ldr r0, _080F5BA8 @ =gScanlineEffectRegBuffers
	movs r2, 0xEF
	movs r3, 0xF4
	lsls r3, 3
	adds r1, r0, r3
	adds r0, 0x20
	movs r3, 0xF
_080F5B82:
	strh r2, [r0]
	strh r2, [r0, 0x2]
	strh r2, [r1]
	strh r2, [r1, 0x2]
	adds r1, 0x4
	adds r0, 0x4
	subs r3, 0x1
	cmp r3, 0
	bge _080F5B82
	ldr r0, _080F5BAC @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r5, _080F5BB0 @ =0x00009345
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0x1
	b _080F5BCE
	.align 2, 0
_080F5BA8: .4byte gScanlineEffectRegBuffers
_080F5BAC: .4byte gUnknown_083DFEC4
_080F5BB0: .4byte 0x00009345
_080F5BB4:
	mov r0, sp
	ldr r1, _080F5BD8 @ =gUnknown_083E4990
	ldm r1!, {r2,r3,r5}
	stm r0!, {r2,r3,r5}
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl ScanlineEffect_SetParams
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_080F5BCC:
	movs r0, 0
_080F5BCE:
	add sp, 0xC
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080F5BD8: .4byte gUnknown_083E4990
	thumb_func_end sub_80F5B50

	thumb_func_start sub_80F5BDC
sub_80F5BDC: @ 80F5BDC
	push {lr}
	ldr r1, _080F5BEC @ =gScanlineEffect
	movs r0, 0x3
	strb r0, [r1, 0x15]
	bl ScanlineEffect_InitHBlankDmaTransfer
	pop {r0}
	bx r0
	.align 2, 0
_080F5BEC: .4byte gScanlineEffect
	thumb_func_end sub_80F5BDC

	thumb_func_start sub_80F5BF0
sub_80F5BF0: @ 80F5BF0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	ldr r0, _080F5CB8 @ =gUnknown_083DFEC4
	ldr r5, [r0]
	ldr r1, _080F5CBC @ =0x00009344
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F5CA6
	ldr r0, _080F5CC0 @ =0x0000911c
	adds r4, r5, r0
	adds r0, r4, 0
	bl sub_80F58DC
	adds r0, r4, 0
	bl sub_80F5A1C
	movs r6, 0
	ldr r1, _080F5CC4 @ =gScanlineEffectRegBuffers
	mov r12, r1
	movs r0, 0xF0
	lsls r0, 3
	add r0, r12
	mov r9, r0
	adds r7, r5, 0
	ldr r1, _080F5CC8 @ =0x0000ffff
	mov r8, r1
	ldr r5, _080F5CCC @ =0x00009130
	adds r5, r7, r5
	str r5, [sp]
	ldr r0, _080F5CD0 @ =0x00009132
	adds r0, r7, r0
	str r0, [sp, 0x4]
	ldr r1, _080F5CD4 @ =0x00009238
	adds r1, r7
	mov r10, r1
_080F5C40:
	adds r2, r6, 0
	adds r2, 0x37
	lsls r3, r2, 2
	mov r5, r9
	adds r5, r3, r5
	str r5, [sp, 0x8]
	add r3, r12
	lsls r4, r6, 2
	ldr r1, [sp]
	adds r0, r1, r4
	ldrh r0, [r0]
	lsls r0, 8
	ldr r5, [sp, 0x4]
	adds r1, r5, r4
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r3]
	mov r1, r8
	ands r0, r1
	ldr r5, [sp, 0x8]
	strh r0, [r5]
	lsls r2, 1
	adds r2, 0x1
	lsls r2, 1
	mov r0, r9
	adds r3, r2, r0
	add r2, r12
	mov r1, r10
	adds r0, r1, r4
	ldrh r1, [r0]
	lsls r1, 8
	ldr r5, _080F5CD8 @ =0x0000923a
	adds r0, r7, r5
	adds r0, r4
	ldrh r0, [r0]
	orrs r1, r0
	strh r1, [r2]
	mov r0, r8
	ands r1, r0
	strh r1, [r3]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _080F5CB8 @ =gUnknown_083DFEC4
	cmp r6, 0x41
	bls _080F5C40
	ldr r0, [r0]
	ldr r1, _080F5CBC @ =0x00009344
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_080F5CA6:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F5CB8: .4byte gUnknown_083DFEC4
_080F5CBC: .4byte 0x00009344
_080F5CC0: .4byte 0x0000911c
_080F5CC4: .4byte gScanlineEffectRegBuffers
_080F5CC8: .4byte 0x0000ffff
_080F5CCC: .4byte 0x00009130
_080F5CD0: .4byte 0x00009132
_080F5CD4: .4byte 0x00009238
_080F5CD8: .4byte 0x0000923a
	thumb_func_end sub_80F5BF0

	thumb_func_start sub_80F5CDC
sub_80F5CDC: @ 80F5CDC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080F5DB0 @ =gUnknown_083DFEC4
	ldr r6, [r0]
	ldr r1, _080F5DB4 @ =0x00009344
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F5DA0
	ldr r0, _080F5DB8 @ =0x0000911c
	adds r4, r6, r0
	adds r0, r4, 0
	bl sub_80F58DC
	adds r0, r4, 0
	bl sub_80F5A1C
	movs r0, 0x37
	subs r0, r5
	lsls r0, 17
	lsrs r5, r0, 16
	movs r7, 0
	ldr r1, _080F5DBC @ =gScanlineEffectRegBuffers
	mov r12, r1
	movs r4, 0xF0
	lsls r4, 3
	add r4, r12
	mov r9, r4
	ldr r0, _080F5DC0 @ =0x0000ffff
	mov r8, r0
	ldr r1, _080F5DC4 @ =0x00009130
	adds r1, r6, r1
	str r1, [sp]
	ldr r4, _080F5DC8 @ =0x00009132
	adds r4, r6, r4
	str r4, [sp, 0x4]
	ldr r0, _080F5DCC @ =0x00009238
	adds r0, r6
	mov r10, r0
_080F5D36:
	lsls r2, r5, 1
	mov r1, r9
	adds r1, r2, r1
	str r1, [sp, 0x8]
	add r2, r12
	lsls r3, r7, 2
	ldr r4, [sp]
	adds r0, r4, r3
	ldrh r0, [r0]
	lsls r0, 8
	ldr r4, [sp, 0x4]
	adds r1, r4, r3
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	mov r1, r8
	ands r0, r1
	ldr r4, [sp, 0x8]
	strh r0, [r4]
	adds r2, r5, 0x1
	lsls r2, 1
	mov r0, r9
	adds r0, r2, r0
	str r0, [sp, 0x8]
	add r2, r12
	mov r1, r10
	adds r0, r1, r3
	ldrh r1, [r0]
	lsls r1, 8
	ldr r4, _080F5DD0 @ =0x0000923a
	adds r0, r6, r4
	adds r0, r3
	ldrh r0, [r0]
	orrs r1, r0
	strh r1, [r2]
	mov r0, r8
	ands r1, r0
	ldr r4, [sp, 0x8]
	strh r1, [r4]
	adds r0, r5, 0x2
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r0, _080F5DB0 @ =gUnknown_083DFEC4
	cmp r7, 0x41
	bls _080F5D36
	ldr r0, [r0]
	ldr r1, _080F5DB4 @ =0x00009344
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_080F5DA0:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F5DB0: .4byte gUnknown_083DFEC4
_080F5DB4: .4byte 0x00009344
_080F5DB8: .4byte 0x0000911c
_080F5DBC: .4byte gScanlineEffectRegBuffers
_080F5DC0: .4byte 0x0000ffff
_080F5DC4: .4byte 0x00009130
_080F5DC8: .4byte 0x00009132
_080F5DCC: .4byte 0x00009238
_080F5DD0: .4byte 0x0000923a
	thumb_func_end sub_80F5CDC

	thumb_func_start sub_80F5DD4
sub_80F5DD4: @ 80F5DD4
	push {lr}
	ldr r0, _080F5DE8 @ =gMain
	ldrh r1, [r0, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080F5DEC
	bl sub_80F5E20
	b _080F5E18
	.align 2, 0
_080F5DE8: .4byte gMain
_080F5DEC:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080F5DFA
	bl sub_80F5EE4
	b _080F5E18
_080F5DFA:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080F5E08
	bl sub_80F5FB4
	b _080F5E18
_080F5E08:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _080F5E14
	movs r0, 0
	b _080F5E1C
_080F5E14:
	bl sub_80F6010
_080F5E18:
	lsls r0, 24
	lsrs r0, 24
_080F5E1C:
	pop {r1}
	bx r1
	thumb_func_end sub_80F5DD4

	thumb_func_start sub_80F5E20
sub_80F5E20: @ 80F5E20
	push {r4,r5,lr}
	ldr r0, _080F5E38 @ =gUnknown_083DFEC4
	ldr r2, [r0]
	ldr r3, _080F5E3C @ =0x0000876e
	adds r1, r2, r3
	movs r5, 0
	ldrsh r1, [r1, r5]
	adds r4, r0, 0
	cmp r1, 0
	bne _080F5E40
	movs r0, 0
	b _080F5EC8
	.align 2, 0
_080F5E38: .4byte gUnknown_083DFEC4
_080F5E3C: .4byte 0x0000876e
_080F5E40:
	ldr r1, _080F5E6C @ =0x000087c9
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F5E74
	ldr r3, _080F5E70 @ =0x0000876c
	adds r0, r2, r3
	movs r5, 0
	ldrsh r0, [r0, r5]
	cmp r0, 0
	bne _080F5E74
	movs r4, 0x1
	negs r4, r4
	adds r0, r4, 0
	bl sub_80F063C
	adds r0, r4, 0
	bl sub_80F6074
	movs r0, 0x2
	b _080F5EC8
	.align 2, 0
_080F5E6C: .4byte 0x000087c9
_080F5E70: .4byte 0x0000876c
_080F5E74:
	ldr r1, [r4]
	ldr r0, _080F5ED0 @ =0x0000876c
	adds r2, r1, r0
	ldrh r0, [r2]
	subs r3, r0, 0x1
	strh r3, [r2]
	ldr r5, _080F5ED4 @ =0x000087c9
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F5E98
	lsls r0, r3, 16
	cmp r0, 0
	bge _080F5E98
	ldr r3, _080F5ED8 @ =0x00008772
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r2]
_080F5E98:
	ldr r0, [r4]
	ldr r5, _080F5EDC @ =0x00008770
	adds r2, r0, r5
	ldr r3, _080F5ED0 @ =0x0000876c
	adds r1, r0, r3
	ldrh r1, [r1]
	ldrh r2, [r2]
	adds r2, r1, r2
	subs r5, 0x2
	adds r4, r0, r5
	strh r2, [r4]
	ldr r1, _080F5EE0 @ =0x00008774
	adds r0, r1
	lsls r1, r2, 16
	asrs r1, 16
	ldrh r3, [r0]
	movs r5, 0
	ldrsh r0, [r0, r5]
	cmp r1, r0
	ble _080F5EC6
	subs r0, r2, 0x1
	subs r0, r3
	strh r0, [r4]
_080F5EC6:
	movs r0, 0x1
_080F5EC8:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080F5ED0: .4byte 0x0000876c
_080F5ED4: .4byte 0x000087c9
_080F5ED8: .4byte 0x00008772
_080F5EDC: .4byte 0x00008770
_080F5EE0: .4byte 0x00008774
	thumb_func_end sub_80F5E20

	thumb_func_start sub_80F5EE4
sub_80F5EE4: @ 80F5EE4
	push {r4-r6,lr}
	ldr r3, _080F5F04 @ =gUnknown_083DFEC4
	ldr r4, [r3]
	ldr r1, _080F5F08 @ =0x0000876e
	adds r0, r4, r1
	ldr r2, _080F5F0C @ =0x00008774
	adds r1, r4, r2
	movs r5, 0
	ldrsh r2, [r0, r5]
	movs r6, 0
	ldrsh r0, [r1, r6]
	adds r5, r3, 0
	cmp r2, r0
	bne _080F5F10
	movs r0, 0
	b _080F5F98
	.align 2, 0
_080F5F04: .4byte gUnknown_083DFEC4
_080F5F08: .4byte 0x0000876e
_080F5F0C: .4byte 0x00008774
_080F5F10:
	ldr r1, _080F5F38 @ =0x000087c9
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F5F40
	ldr r2, _080F5F3C @ =0x0000876c
	adds r0, r4, r2
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r0, 0x7
	bne _080F5F40
	movs r0, 0x1
	bl sub_80F063C
	movs r0, 0x1
	bl sub_80F6074
	movs r0, 0x2
	b _080F5F98
	.align 2, 0
_080F5F38: .4byte 0x000087c9
_080F5F3C: .4byte 0x0000876c
_080F5F40:
	ldr r2, [r5]
	ldr r6, _080F5FA0 @ =0x0000876c
	adds r4, r2, r6
	ldrh r0, [r4]
	adds r1, r0, 0x1
	strh r1, [r4]
	ldr r3, _080F5FA4 @ =0x000087c9
	adds r0, r2, r3
	ldrb r3, [r0]
	cmp r3, 0
	bne _080F5F68
	adds r6, 0x6
	adds r0, r2, r6
	lsls r1, 16
	asrs r1, 16
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble _080F5F68
	strh r3, [r4]
_080F5F68:
	ldr r0, [r5]
	ldr r3, _080F5FA8 @ =0x00008770
	adds r2, r0, r3
	ldr r5, _080F5FA0 @ =0x0000876c
	adds r1, r0, r5
	ldrh r1, [r1]
	ldrh r2, [r2]
	adds r2, r1, r2
	ldr r6, _080F5FAC @ =0x0000876e
	adds r4, r0, r6
	strh r2, [r4]
	ldr r1, _080F5FB0 @ =0x00008774
	adds r0, r1
	lsls r1, r2, 16
	asrs r1, 16
	ldrh r3, [r0]
	movs r5, 0
	ldrsh r0, [r0, r5]
	cmp r1, r0
	ble _080F5F96
	subs r0, r2, 0x1
	subs r0, r3
	strh r0, [r4]
_080F5F96:
	movs r0, 0x1
_080F5F98:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080F5FA0: .4byte 0x0000876c
_080F5FA4: .4byte 0x000087c9
_080F5FA8: .4byte 0x00008770
_080F5FAC: .4byte 0x0000876e
_080F5FB0: .4byte 0x00008774
	thumb_func_end sub_80F5EE4

	thumb_func_start sub_80F5FB4
sub_80F5FB4: @ 80F5FB4
	push {r4,lr}
	ldr r0, _080F5FD8 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _080F5FDC @ =0x00008770
	adds r0, r1, r2
	ldrh r3, [r0]
	movs r4, 0
	ldrsh r2, [r0, r4]
	cmp r2, 0
	beq _080F5FD2
	ldr r4, _080F5FE0 @ =0x000087c9
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F5FE4
_080F5FD2:
	movs r0, 0
	b _080F6004
	.align 2, 0
_080F5FD8: .4byte gUnknown_083DFEC4
_080F5FDC: .4byte 0x00008770
_080F5FE0: .4byte 0x000087c9
_080F5FE4:
	cmp r2, 0x7
	bgt _080F5FF0
	negs r0, r3
	lsls r0, 16
	lsrs r0, 16
	b _080F5FF2
_080F5FF0:
	ldr r0, _080F600C @ =0x0000fff8
_080F5FF2:
	lsls r4, r0, 16
	asrs r4, 16
	adds r0, r4, 0
	bl sub_80F063C
	adds r0, r4, 0
	bl sub_80F6074
	movs r0, 0x2
_080F6004:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F600C: .4byte 0x0000fff8
	thumb_func_end sub_80F5FB4

	thumb_func_start sub_80F6010
sub_80F6010: @ 80F6010
	push {r4-r6,lr}
	ldr r0, _080F603C @ =gUnknown_083DFEC4
	ldr r3, [r0]
	ldr r1, _080F6040 @ =0x00008772
	adds r0, r3, r1
	ldr r2, _080F6044 @ =0x00008774
	adds r1, r3, r2
	ldrh r5, [r0]
	movs r4, 0
	ldrsh r2, [r0, r4]
	ldrh r4, [r1]
	movs r6, 0
	ldrsh r0, [r1, r6]
	cmp r2, r0
	beq _080F6038
	ldr r1, _080F6048 @ =0x000087c9
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F604C
_080F6038:
	movs r0, 0
	b _080F606C
	.align 2, 0
_080F603C: .4byte gUnknown_083DFEC4
_080F6040: .4byte 0x00008772
_080F6044: .4byte 0x00008774
_080F6048: .4byte 0x000087c9
_080F604C:
	subs r0, r4, r5
	lsls r0, 16
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080F605A
	movs r4, 0x8
_080F605A:
	lsls r4, 16
	asrs r4, 16
	adds r0, r4, 0
	bl sub_80F063C
	adds r0, r4, 0
	bl sub_80F6074
	movs r0, 0x2
_080F606C:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80F6010

	thumb_func_start sub_80F6074
sub_80F6074: @ 80F6074
	push {r4-r7,lr}
	ldr r1, _080F6120 @ =gUnknown_083DFEC4
	ldr r6, [r1]
	ldr r1, _080F6124 @ =0x00008770
	adds r3, r6, r1
	ldrh r1, [r3]
	lsls r0, 16
	asrs r7, r0, 16
	adds r2, r7, r1
	strh r2, [r3]
	ldr r5, _080F6128 @ =0x00008774
	adds r4, r6, r5
	lsls r0, r2, 16
	asrs r0, 16
	ldrh r1, [r4]
	mov r12, r1
	movs r5, 0
	ldrsh r1, [r4, r5]
	cmp r0, r1
	ble _080F60A4
	subs r0, r2, 0x1
	mov r1, r12
	subs r0, r1
	strh r0, [r3]
_080F60A4:
	ldrh r1, [r3]
	movs r2, 0
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bge _080F60B6
	adds r0, r1, 0x1
	ldrh r5, [r4]
	adds r0, r5
	strh r0, [r3]
_080F60B6:
	ldr r0, _080F612C @ =0x00008772
	adds r3, r6, r0
	ldrh r0, [r3]
	adds r2, r7, r0
	strh r2, [r3]
	lsls r0, r2, 16
	asrs r0, 16
	ldrh r1, [r4]
	mov r12, r1
	movs r5, 0
	ldrsh r1, [r4, r5]
	cmp r0, r1
	ble _080F60D8
	subs r0, r2, 0x1
	mov r1, r12
	subs r0, r1
	strh r0, [r3]
_080F60D8:
	ldrh r1, [r3]
	movs r2, 0
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bge _080F60EA
	adds r0, r1, 0x1
	ldrh r5, [r4]
	adds r0, r5
	strh r0, [r3]
_080F60EA:
	ldr r0, _080F6130 @ =0x0000876e
	adds r3, r6, r0
	ldrh r0, [r3]
	adds r2, r7, r0
	strh r2, [r3]
	lsls r0, r2, 16
	asrs r0, 16
	ldrh r5, [r4]
	movs r6, 0
	ldrsh r1, [r4, r6]
	cmp r0, r1
	ble _080F6108
	subs r0, r2, 0x1
	subs r0, r5
	strh r0, [r3]
_080F6108:
	ldrh r1, [r3]
	movs r2, 0
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bge _080F611A
	adds r0, r1, 0x1
	ldrh r4, [r4]
	adds r0, r4
	strh r0, [r3]
_080F611A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F6120: .4byte gUnknown_083DFEC4
_080F6124: .4byte 0x00008770
_080F6128: .4byte 0x00008774
_080F612C: .4byte 0x00008772
_080F6130: .4byte 0x0000876e
	thumb_func_end sub_80F6074

	thumb_func_start sub_80F6134
sub_80F6134: @ 80F6134
	push {r4-r6,lr}
	ldr r0, _080F6194 @ =gUnknown_083DFEC4
	ldr r3, [r0]
	ldr r1, _080F6198 @ =0x000087c9
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F61E0
	ldr r2, _080F619C @ =0x000087dc
	adds r5, r3, r2
	movs r4, 0
	ldrsh r1, [r5, r4]
	ldr r6, _080F61A0 @ =0x00008774
	adds r4, r3, r6
	movs r2, 0
	ldrsh r0, [r4, r2]
	subs r0, 0x7
	cmp r1, r0
	bge _080F61AC
	subs r6, 0x8
	adds r1, r3, r6
	movs r0, 0
	strh r0, [r1]
	ldrh r0, [r5]
	ldr r1, _080F61A4 @ =0x00008770
	adds r2, r3, r1
	strh r0, [r2]
	ldrh r1, [r5]
	ldr r5, _080F61A8 @ =0x0000876e
	adds r0, r3, r5
	strh r1, [r0]
	ldrh r5, [r2]
	adds r0, r5, 0x7
	adds r6, 0x6
	adds r2, r3, r6
	strh r0, [r2]
	lsls r0, 16
	asrs r0, 16
	ldrh r3, [r4]
	movs r6, 0
	ldrsh r1, [r4, r6]
	cmp r0, r1
	ble _080F61F4
	adds r0, r5, 0x6
	subs r0, r3
	strh r0, [r2]
	b _080F61F4
	.align 2, 0
_080F6194: .4byte gUnknown_083DFEC4
_080F6198: .4byte 0x000087c9
_080F619C: .4byte 0x000087dc
_080F61A0: .4byte 0x00008774
_080F61A4: .4byte 0x00008770
_080F61A8: .4byte 0x0000876e
_080F61AC:
	ldrh r0, [r4]
	subs r0, 0x7
	ldr r2, _080F61D4 @ =0x00008770
	adds r1, r3, r2
	strh r0, [r1]
	ldrh r1, [r4]
	ldr r6, _080F61D8 @ =0x00008772
	adds r0, r3, r6
	strh r1, [r0]
	ldrh r1, [r5]
	subs r2, 0x2
	adds r0, r3, r2
	strh r1, [r0]
	ldrh r0, [r4]
	subs r0, r1
	movs r1, 0x7
	subs r1, r0
	ldr r4, _080F61DC @ =0x0000876c
	adds r0, r3, r4
	b _080F61F2
	.align 2, 0
_080F61D4: .4byte 0x00008770
_080F61D8: .4byte 0x00008772
_080F61DC: .4byte 0x0000876c
_080F61E0:
	ldr r5, _080F61FC @ =0x000087dc
	adds r2, r3, r5
	ldrh r1, [r2]
	ldr r6, _080F6200 @ =0x0000876c
	adds r0, r3, r6
	strh r1, [r0]
	ldrh r1, [r2]
	ldr r2, _080F6204 @ =0x0000876e
	adds r0, r3, r2
_080F61F2:
	strh r1, [r0]
_080F61F4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F61FC: .4byte 0x000087dc
_080F6200: .4byte 0x0000876c
_080F6204: .4byte 0x0000876e
	thumb_func_end sub_80F6134

	thumb_func_start sub_80F6208
sub_80F6208: @ 80F6208
	push {lr}
	ldr r0, _080F623C @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _080F6240 @ =0x00008fe6
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	ldr r3, _080F6244 @ =0x00008fe7
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _080F6248 @ =0x00008fe8
	adds r2, r1, r0
	movs r0, 0xFF
	strb r0, [r2]
	ldr r2, _080F624C @ =0x00006dac
	adds r1, r2
	ldrb r0, [r1]
	cmp r0, 0
	bne _080F6238
_080F622E:
	bl sub_80F6250
	lsls r0, 24
	cmp r0, 0
	bne _080F622E
_080F6238:
	pop {r0}
	bx r0
	.align 2, 0
_080F623C: .4byte gUnknown_083DFEC4
_080F6240: .4byte 0x00008fe6
_080F6244: .4byte 0x00008fe7
_080F6248: .4byte 0x00008fe8
_080F624C: .4byte 0x00006dac
	thumb_func_end sub_80F6208

	thumb_func_start sub_80F6250
sub_80F6250: @ 80F6250
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _080F6270 @ =gUnknown_083DFEC4
	ldr r2, [r0]
	ldr r0, _080F6274 @ =0x00008fe8
	adds r3, r2, r0
	movs r1, 0
	ldrsb r1, [r3, r1]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080F6278
_080F626C:
	movs r0, 0
	b _080F637E
	.align 2, 0
_080F6270: .4byte gUnknown_083DFEC4
_080F6274: .4byte 0x00008fe8
_080F6278:
	ldr r1, _080F630C @ =0x00008fe6
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x7
	beq _080F631C
	cmp r0, 0x8
	beq _080F626C
	movs r6, 0
	adds r7, r2, 0
	adds r5, r7, r1
	ldr r0, _080F6310 @ =0x00008fe7
	adds r4, r7, r0
	ldr r1, _080F6314 @ =gPokemonStorage + 0x4
	mov r8, r1
	ldr r0, _080F6318 @ =0x000041a0
	add r0, r8
	mov r9, r0
_080F629A:
	ldrb r0, [r5]
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldrb r2, [r4]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	add r1, r8
	adds r0, r1
	movs r1, 0x51
	bl GetBoxMonData
	cmp r0, 0
	bne _080F636C
	ldrb r0, [r5]
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldrb r2, [r4]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	add r1, r9
	adds r0, r1
	movs r1, 0x51
	bl GetBoxMonData
	adds r1, r0, 0
	cmp r1, 0
	bne _080F636C
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	movs r2, 0xFF
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1D
	bls _080F62FE
	strb r1, [r4]
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	ands r0, r2
	cmp r0, 0x6
	bhi _080F637C
_080F62FE:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x9
	bls _080F629A
	b _080F637C
	.align 2, 0
_080F630C: .4byte 0x00008fe6
_080F6310: .4byte 0x00008fe7
_080F6314: .4byte gPokemonStorage + 0x4
_080F6318: .4byte 0x000041a0
_080F631C:
	movs r0, 0
	strb r0, [r3]
	movs r6, 0
	b _080F632A
_080F6324:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_080F632A:
	cmp r6, 0x5
	bhi _080F634C
	movs r0, 0x64
	muls r0, r6
	ldr r1, _080F635C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x51
	bl GetMonData
	cmp r0, 0
	beq _080F6324
	ldr r0, _080F6360 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F6364 @ =0x00008fe8
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_080F634C:
	ldr r0, _080F6360 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F6368 @ =0x00008fe6
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	b _080F6372
	.align 2, 0
_080F635C: .4byte gPlayerParty
_080F6360: .4byte gUnknown_083DFEC4
_080F6364: .4byte 0x00008fe8
_080F6368: .4byte 0x00008fe6
_080F636C:
	ldr r0, _080F6378 @ =0x00008fe8
	adds r1, r7, r0
	movs r0, 0x1
_080F6372:
	strb r0, [r1]
	b _080F626C
	.align 2, 0
_080F6378: .4byte 0x00008fe8
_080F637C:
	movs r0, 0x1
_080F637E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80F6250

	thumb_func_start sub_80F638C
sub_80F638C: @ 80F638C
	push {r4,lr}
	ldr r0, _080F63C0 @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r1, _080F63C4 @ =0x00008fe6
	adds r0, r4, r1
	movs r1, 0
	strb r1, [r0]
	ldr r2, _080F63C8 @ =0x00008fe7
	adds r0, r4, r2
	strb r1, [r0]
	bl sub_80F492C
	ldr r0, _080F63CC @ =0x00006dac
	adds r4, r0
	ldrb r0, [r4]
	cmp r0, 0
	bne _080F63B8
_080F63AE:
	bl sub_80F63D0
	lsls r0, 24
	cmp r0, 0
	bne _080F63AE
_080F63B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F63C0: .4byte gUnknown_083DFEC4
_080F63C4: .4byte 0x00008fe6
_080F63C8: .4byte 0x00008fe7
_080F63CC: .4byte 0x00006dac
	thumb_func_end sub_80F638C

	thumb_func_start sub_80F63D0
sub_80F63D0: @ 80F63D0
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r0, _080F647C @ =gUnknown_083DFEC4
	ldr r2, [r0]
	ldr r1, _080F6480 @ =0x00008fe6
	adds r0, r2, r1
	ldrb r3, [r0]
	cmp r3, 0xE
	beq _080F6498
	cmp r3, 0xF
	bne _080F63E8
	b _080F64F6
_080F63E8:
	movs r1, 0x80
	lsls r1, 23
	ldr r0, [sp]
	orrs r0, r1
	str r0, [sp]
	movs r6, 0
	ldr r0, _080F6480 @ =0x00008fe6
	adds r5, r2, r0
	ldr r1, _080F6484 @ =0x00008fe7
	adds r4, r2, r1
_080F63FC:
	ldrb r0, [r5]
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldrb r2, [r4]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	ldr r2, _080F6488 @ =gPokemonStorage + 0x4
	adds r1, r2
	adds r0, r1
	movs r1, 0x51
	bl GetBoxMonData
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	beq _080F644E
	ldrb r1, [r5]
	lsls r1, 8
	ldr r2, _080F648C @ =0xffff00ff
	ldr r0, [sp]
	ands r0, r2
	orrs r0, r1
	str r0, [sp]
	ldrb r2, [r4]
	movs r1, 0x1F
	ands r2, r1
	lsls r2, 16
	ldr r1, _080F6490 @ =0xffe0ffff
	ands r0, r1
	orrs r0, r2
	ldr r1, _080F6494 @ =0xffffff00
	ands r0, r1
	orrs r0, r3
	str r0, [sp]
	mov r0, sp
	bl sub_80F4944
_080F644E:
	ldrb r0, [r4]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r4]
	movs r1, 0xFF
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1E
	bne _080F646E
	strb r2, [r4]
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	ands r0, r1
	cmp r0, 0xE
	beq _080F6508
_080F646E:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0xE
	bls _080F63FC
	b _080F6508
	.align 2, 0
_080F647C: .4byte gUnknown_083DFEC4
_080F6480: .4byte 0x00008fe6
_080F6484: .4byte 0x00008fe7
_080F6488: .4byte gPokemonStorage + 0x4
_080F648C: .4byte 0xffff00ff
_080F6490: .4byte 0xffe0ffff
_080F6494: .4byte 0xffffff00
_080F6498:
	mov r0, sp
	ldrb r1, [r0, 0x3]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0, 0x3]
	strb r3, [r0, 0x1]
	movs r6, 0
	mov r4, sp
_080F64A8:
	movs r0, 0x64
	muls r0, r6
	ldr r1, _080F64FC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x51
	bl GetMonData
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	beq _080F64DA
	movs r0, 0x1F
	adds r2, r6, 0
	ands r2, r0
	ldrb r0, [r4, 0x2]
	movs r5, 0x20
	negs r5, r5
	adds r1, r5, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x2]
	strb r3, [r4]
	mov r0, sp
	bl sub_80F4944
_080F64DA:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x5
	bls _080F64A8
	bl sub_80F49F4
	ldr r0, _080F6500 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F6504 @ =0x00008fe6
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080F64F6:
	movs r0, 0
	b _080F650A
	.align 2, 0
_080F64FC: .4byte gPlayerParty
_080F6500: .4byte gUnknown_083DFEC4
_080F6504: .4byte 0x00008fe6
_080F6508:
	movs r0, 0x1
_080F650A:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80F63D0

	thumb_func_start sub_80F6514
sub_80F6514: @ 80F6514
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	mov r10, r0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x4]
	mov r5, r10
	ldr r0, _080F65A4 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	lsls r1, 2
	adds r0, r1
	ldr r2, _080F65A8 @ =0x0000893d
	adds r1, r0, r2
	ldrb r6, [r1]
	mov r8, r6
	ldr r1, _080F65AC @ =0x0000893e
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 27
	lsrs r4, r0, 27
	adds r7, r4, 0
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0x2D
	movs r3, 0
	bl sub_80F44B0
	cmp r0, 0
	beq _080F655E
	b _080F66CA
_080F655E:
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0x2
	adds r3, r5, 0
	bl sub_80F44B0
	adds r0, r5, 0
	bl StringGetEnd10
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0xB
	movs r3, 0
	bl sub_80F44B0
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	cmp r6, 0xE
	bne _080F65B4
	movs r0, 0x64
	muls r4, r0
	ldr r0, _080F65B0 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	adds r0, r4, 0
	bl GetMonGender
	b _080F65EA
	.align 2, 0
_080F65A4: .4byte gUnknown_083DFEC4
_080F65A8: .4byte 0x0000893d
_080F65AC: .4byte 0x0000893e
_080F65B0: .4byte gPlayerParty
_080F65B4:
	mov r2, r8
	lsls r1, r2, 2
	add r1, r8
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 4
	ldr r2, _080F6620 @ =gPokemonStorage + 0x4
	adds r1, r2
	adds r0, r1
	bl GetLevelFromBoxMonExp
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	mov r0, r8
	adds r1, r7, 0
	movs r2, 0
	movs r3, 0
	bl sub_80F44B0
	adds r1, r0, 0
	mov r0, r9
	bl GetGenderFromSpeciesAndPersonality
_080F65EA:
	lsls r0, 24
	lsrs r4, r0, 24
	mov r0, r9
	mov r1, r10
	bl ShouldHideGenderIcon
	cmp r0, 0
	beq _080F65FC
	movs r4, 0xFF
_080F65FC:
	adds r0, r5, 0
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	adds r5, r0
	movs r1, 0xFC
	strb r1, [r5]
	movs r0, 0x13
	strb r0, [r5, 0x1]
	movs r0, 0x3F
	strb r0, [r5, 0x2]
	adds r5, 0x3
	cmp r4, 0
	beq _080F6624
	cmp r4, 0xFE
	beq _080F663C
	b _080F6656
	.align 2, 0
_080F6620: .4byte gPokemonStorage + 0x4
_080F6624:
	strb r1, [r5]
	movs r0, 0x1
	strb r0, [r5, 0x1]
	movs r0, 0xC
	strb r0, [r5, 0x2]
	strb r1, [r5, 0x3]
	movs r0, 0x3
	strb r0, [r5, 0x4]
	movs r0, 0xD
	strb r0, [r5, 0x5]
	movs r0, 0xB5
	b _080F6652
_080F663C:
	strb r1, [r5]
	movs r0, 0x1
	strb r0, [r5, 0x1]
	movs r0, 0xA
	strb r0, [r5, 0x2]
	strb r1, [r5, 0x3]
	movs r0, 0x3
	strb r0, [r5, 0x4]
	movs r0, 0xB
	strb r0, [r5, 0x5]
	movs r0, 0xB6
_080F6652:
	strb r0, [r5, 0x6]
	adds r5, 0x7
_080F6656:
	movs r4, 0xFC
	strb r4, [r5]
	movs r1, 0x1
	strb r1, [r5, 0x1]
	strb r1, [r5, 0x2]
	strb r4, [r5, 0x3]
	movs r0, 0x3
	strb r0, [r5, 0x4]
	movs r0, 0x5
	strb r0, [r5, 0x5]
	adds r5, 0x6
	strb r4, [r5]
	movs r6, 0x13
	strb r6, [r5, 0x1]
	movs r0, 0x46
	strb r0, [r5, 0x2]
	adds r5, 0x3
	movs r0, 0xBA
	strb r0, [r5]
	strb r4, [r5, 0x1]
	movs r0, 0x11
	strb r0, [r5, 0x2]
	strb r1, [r5, 0x3]
	movs r0, 0x34
	strb r0, [r5, 0x4]
	adds r5, 0x5
	adds r0, r5, 0
	ldr r1, [sp, 0x8]
	bl ConvertIntToDecimalString
	adds r5, r0, 0
	ldr r0, [sp, 0x4]
	cmp r0, 0x1
	bne _080F66C0
	ldr r0, _080F66B8 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, [sp]
	lsls r1, r2, 2
	adds r0, r1
	ldr r1, _080F66BC @ =0x0000893c
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r5, 0
	movs r2, 0x80
	movs r3, 0x1
	bl AlignInt1InMenuWindow
	adds r5, r0, 0
	b _080F66CE
	.align 2, 0
_080F66B8: .4byte gUnknown_083DFEC4
_080F66BC: .4byte 0x0000893c
_080F66C0:
	strb r4, [r5]
	strb r6, [r5, 0x1]
	movs r0, 0x67
	strb r0, [r5, 0x2]
	adds r5, 0x3
_080F66CA:
	movs r0, 0xFF
	strb r0, [r5]
_080F66CE:
	adds r0, r5, 0
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80F6514

	thumb_func_start sub_80F66E0
sub_80F66E0: @ 80F66E0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r0, _080F676C @ =gUnknown_083DFEC4
	mov r8, r0
	ldr r4, [r0]
	ldr r1, _080F6770 @ =0x00008829
	adds r0, r4, r1
	ldr r2, _080F6774 @ =0x0000876e
	adds r5, r4, r2
	ldrh r1, [r5]
	movs r2, 0
	bl sub_80F6514
	movs r3, 0
	ldrsh r0, [r5, r3]
	movs r1, 0
	bl sub_80F4824
	ldrh r1, [r5]
	ldr r6, _080F6778 @ =0x000087dc
	adds r0, r4, r6
	movs r6, 0
	strh r1, [r0]
	ldr r1, _080F677C @ =0x0000bc8e
	adds r0, r4, r1
	strb r6, [r0]
	movs r2, 0
	mov r9, r2
	movs r3, 0
	ldrsh r1, [r5, r3]
	lsls r1, 2
	adds r1, r4, r1
	ldr r5, _080F6780 @ =0x0000893d
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _080F6784 @ =0x0000893e
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 27
	lsrs r1, 27
	movs r2, 0x52
	movs r3, 0
	bl sub_80F44B0
	adds r7, r0, 0
	ldr r3, _080F6788 @ =0x0000bc8f
	adds r4, r3
	strb r6, [r4]
	movs r5, 0
	mov r12, r5
	mov r10, r8
_080F674E:
	ldr r1, _080F678C @ =gUnknown_083E499C
	mov r6, r12
	lsls r0, r6, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0x36
	bgt _080F6790
	cmp r0, 0x32
	blt _080F6790
	movs r0, 0x7
	adds r2, r7, 0
	ands r2, r0
	lsrs r7, 3
	movs r0, 0x4
	b _080F679A
	.align 2, 0
_080F676C: .4byte gUnknown_083DFEC4
_080F6770: .4byte 0x00008829
_080F6774: .4byte 0x0000876e
_080F6778: .4byte 0x000087dc
_080F677C: .4byte 0x0000bc8e
_080F6780: .4byte 0x0000893d
_080F6784: .4byte 0x0000893e
_080F6788: .4byte 0x0000bc8f
_080F678C: .4byte gUnknown_083E499C
_080F6790:
	movs r0, 0x1
	adds r2, r7, 0
	ands r2, r0
	lsrs r7, 1
	movs r0, 0x1
_080F679A:
	movs r4, 0
	adds r1, r2, 0
	add r0, r9
	mov r8, r0
	cmp r4, r1
	bcs _080F67D4
	mov r3, r10
	ldr r0, [r3]
	ldr r5, _080F6828 @ =0x0000bc8e
	adds r3, r0, r5
	ldr r6, _080F682C @ =0x0000bc4c
	adds r6, r0, r6
	str r6, [sp]
	adds r5, r1, 0
_080F67B6:
	ldrb r0, [r3]
	adds r1, r0, 0x1
	strb r1, [r3]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [sp]
	adds r0, r1, r0
	mov r6, r9
	adds r1, r6, r4
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r5
	bcc _080F67B6
_080F67D4:
	cmp r2, 0
	beq _080F67EC
	mov r0, r9
	cmp r0, 0x18
	bls _080F67EC
	mov r2, r10
	ldr r1, [r2]
	ldr r3, _080F6830 @ =0x0000bc8f
	adds r1, r3
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080F67EC:
	mov r5, r8
	lsls r0, r5, 24
	lsrs r0, 24
	mov r9, r0
	mov r0, r12
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r12, r0
	cmp r0, 0x10
	bls _080F674E
	ldr r6, _080F6834 @ =gUnknown_083DFEC4
	ldr r2, [r6]
	ldr r1, _080F6828 @ =0x0000bc8e
	adds r0, r2, r1
	ldr r3, _080F6830 @ =0x0000bc8f
	adds r1, r2, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080F6840
	ldr r5, _080F6838 @ =0x0000bc90
	adds r0, r2, r5
	movs r1, 0
	strb r1, [r0]
	ldr r6, _080F683C @ =0x0000bc91
	adds r0, r2, r6
	strb r1, [r0]
	b _080F6850
	.align 2, 0
_080F6828: .4byte 0x0000bc8e
_080F682C: .4byte 0x0000bc4c
_080F6830: .4byte 0x0000bc8f
_080F6834: .4byte gUnknown_083DFEC4
_080F6838: .4byte 0x0000bc90
_080F683C: .4byte 0x0000bc91
_080F6840:
	ldr r0, _080F6888 @ =0x0000bc90
	adds r1, r2, r0
	movs r0, 0
	strb r0, [r1]
	ldr r3, _080F688C @ =0x0000bc91
	adds r1, r2, r3
	movs r0, 0x3
	strb r0, [r1]
_080F6850:
	ldr r5, _080F6890 @ =gUnknown_083DFEC4
	ldr r1, [r5]
	ldr r6, _080F6894 @ =0x0000bc8e
	adds r0, r1, r6
	ldr r2, _080F6898 @ =0x0000bc8f
	adds r1, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	subs r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	movs r3, 0
	mov r12, r3
	adds r3, r5, 0
	ldr r1, _080F689C @ =0x0000bc96
	movs r4, 0x9
_080F6870:
	cmp r2, 0x8
	bls _080F68A0
	ldr r0, [r3]
	adds r0, r1
	add r0, r12
	strb r4, [r0]
	adds r0, r2, 0
	subs r0, 0x9
	lsls r0, 24
	lsrs r2, r0, 24
	b _080F68AA
	.align 2, 0
_080F6888: .4byte 0x0000bc90
_080F688C: .4byte 0x0000bc91
_080F6890: .4byte gUnknown_083DFEC4
_080F6894: .4byte 0x0000bc8e
_080F6898: .4byte 0x0000bc8f
_080F689C: .4byte 0x0000bc96
_080F68A0:
	ldr r0, [r3]
	adds r0, r1
	add r0, r12
	strb r2, [r0]
	movs r2, 0
_080F68AA:
	mov r0, r12
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r12, r0
	cmp r0, 0x2
	bls _080F6870
	ldr r5, _080F68DC @ =gUnknown_083DFEC4
	ldr r0, [r5]
	ldr r6, _080F68E0 @ =0x0000bc96
	adds r1, r0, r6
	add r1, r12
	ldr r2, _080F68E4 @ =0x0000bc8f
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F68DC: .4byte gUnknown_083DFEC4
_080F68E0: .4byte 0x0000bc96
_080F68E4: .4byte 0x0000bc8f
	thumb_func_end sub_80F66E0

	thumb_func_start sub_80F68E8
sub_80F68E8: @ 80F68E8
	push {r4-r7,lr}
	ldr r3, _080F6918 @ =gUnknown_083DFEC4
	ldr r0, [r3]
	ldr r2, _080F691C @ =0x0000bc90
	adds r1, r0, r2
	ldrb r5, [r1]
	ldr r6, _080F6920 @ =0x0000bc91
	adds r0, r6
	ldrb r4, [r0]
	movs r0, 0x1
	mov r12, r0
	ldr r2, _080F6924 @ =gMain
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	adds r6, r3, 0
	adds r7, r2, 0
	cmp r0, 0
	beq _080F692E
	lsls r0, r4, 24
	cmp r0, 0
	ble _080F692E
	b _080F69BC
	.align 2, 0
_080F6918: .4byte gUnknown_083DFEC4
_080F691C: .4byte 0x0000bc90
_080F6920: .4byte 0x0000bc91
_080F6924: .4byte gMain
_080F6928:
	ldr r1, _080F69B0 @ =0x0000bc91
	adds r0, r2, r1
	ldrb r4, [r0]
_080F692E:
	ldrh r1, [r7, 0x30]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080F6978
	lsls r0, r4, 24
	asrs r0, 24
	cmp r0, 0x2
	bgt _080F6978
	ldr r3, _080F69B4 @ =gUnknown_083DFEC4
	ldr r2, _080F69B8 @ =0x0000bc96
_080F6944:
	lsls r0, r4, 24
	asrs r0, 24
	cmp r0, 0x2
	bgt _080F6960
	adds r0, 0x1
	lsls r0, 24
	ldr r1, [r3]
	lsrs r4, r0, 24
	asrs r0, 24
	adds r1, r2
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _080F6944
_080F6960:
	ldr r2, [r6]
	lsls r0, r4, 24
	asrs r0, 24
	ldr r3, _080F69B8 @ =0x0000bc96
	adds r1, r2, r3
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _080F69EC
	ldr r1, _080F69B0 @ =0x0000bc91
	adds r0, r2, r1
	ldrb r4, [r0]
_080F6978:
	ldrh r2, [r7, 0x30]
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	beq _080F698A
	lsls r0, r5, 24
	asrs r0, 24
	cmp r0, 0
	bgt _080F6A3C
_080F698A:
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	beq _080F69AA
	lsls r0, r5, 24
	asrs r2, r0, 24
	ldr r1, [r6]
	lsls r0, r4, 24
	asrs r0, 24
	ldr r3, _080F69B8 @ =0x0000bc96
	adds r1, r3
	adds r1, r0
	ldrb r0, [r1]
	subs r0, 0x1
	cmp r2, r0
	blt _080F6A38
_080F69AA:
	movs r0, 0
	mov r12, r0
	b _080F69FC
	.align 2, 0
_080F69B0: .4byte 0x0000bc91
_080F69B4: .4byte gUnknown_083DFEC4
_080F69B8: .4byte 0x0000bc96
_080F69BC:
	lsls r0, r4, 24
	asrs r0, 24
	cmp r0, 0
	ble _080F69DA
	subs r0, 0x1
	lsls r0, 24
	ldr r1, [r6]
	lsrs r4, r0, 24
	asrs r0, 24
	ldr r2, _080F6A2C @ =0x0000bc96
	adds r1, r2
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _080F69BC
_080F69DA:
	ldr r2, [r6]
	lsls r0, r4, 24
	asrs r0, 24
	ldr r3, _080F6A2C @ =0x0000bc96
	adds r1, r2, r3
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _080F6928
_080F69EC:
	lsls r0, r5, 24
	asrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	blt _080F69FC
	subs r0, r1, 0x1
_080F69F8:
	lsls r0, 24
	lsrs r5, r0, 24
_080F69FC:
	mov r0, r12
	cmp r0, 0
	beq _080F6A44
	lsls r0, r5, 24
	asrs r0, 24
	ldr r3, [r6]
	ldr r1, _080F6A30 @ =0x0000bc90
	adds r2, r3, r1
	ldrb r6, [r2]
	cmp r0, r6
	bne _080F6A20
	lsls r0, r4, 24
	asrs r0, 24
	ldr r6, _080F6A34 @ =0x0000bc91
	adds r1, r3, r6
	ldrb r1, [r1]
	cmp r0, r1
	beq _080F6A40
_080F6A20:
	strb r5, [r2]
	ldr r1, _080F6A34 @ =0x0000bc91
	adds r0, r3, r1
	strb r4, [r0]
	b _080F6A44
	.align 2, 0
_080F6A2C: .4byte 0x0000bc96
_080F6A30: .4byte 0x0000bc90
_080F6A34: .4byte 0x0000bc91
_080F6A38:
	adds r0, r2, 0x1
	b _080F69F8
_080F6A3C:
	subs r0, 0x1
	b _080F69F8
_080F6A40:
	movs r2, 0
	mov r12, r2
_080F6A44:
	mov r0, r12
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80F68E8

	thumb_func_start sub_80F6A4C
sub_80F6A4C: @ 80F6A4C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r0, _080F6AC4 @ =gUnknown_083DFEC4
	ldr r3, [r0]
	ldr r0, _080F6AC8 @ =0x0000876e
	adds r2, r3, r0
	lsls r0, r4, 24
	asrs r0, 24
	ldrh r1, [r2]
	adds r0, r1
	strh r0, [r2]
	lsls r0, 16
	cmp r0, 0
	bge _080F6A74
	ldr r5, _080F6ACC @ =0x00008774
	adds r0, r3, r5
	ldrh r0, [r0]
	strh r0, [r2]
_080F6A74:
	ldr r1, _080F6ACC @ =0x00008774
	adds r0, r3, r1
	movs r5, 0
	ldrsh r1, [r2, r5]
	movs r5, 0
	ldrsh r0, [r0, r5]
	cmp r1, r0
	ble _080F6A88
	movs r0, 0
	strh r0, [r2]
_080F6A88:
	ldr r1, _080F6AD0 @ =0x0000bc94
	adds r0, r3, r1
	strb r4, [r0]
	ldrh r1, [r2]
	ldr r2, _080F6AD4 @ =0x000087dc
	adds r0, r3, r2
	strh r1, [r0]
	ldr r1, _080F6AD8 @ =REG_WININ
	ldr r5, _080F6ADC @ =0x00003f37
	adds r0, r5, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080F6AE0 @ =0x00003f3f
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xA
	ldr r5, _080F6AE4 @ =0x000058f0
	adds r0, r5, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080F6AE8 @ =0x00002060
	adds r0, r2, 0
	strh r0, [r1]
	ldr r5, _080F6AEC @ =0x000087de
	adds r1, r3, r5
	movs r0, 0
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F6AC4: .4byte gUnknown_083DFEC4
_080F6AC8: .4byte 0x0000876e
_080F6ACC: .4byte 0x00008774
_080F6AD0: .4byte 0x0000bc94
_080F6AD4: .4byte 0x000087dc
_080F6AD8: .4byte REG_WININ
_080F6ADC: .4byte 0x00003f37
_080F6AE0: .4byte 0x00003f3f
_080F6AE4: .4byte 0x000058f0
_080F6AE8: .4byte 0x00002060
_080F6AEC: .4byte 0x000087de
	thumb_func_end sub_80F6A4C

	thumb_func_start sub_80F6AF0
sub_80F6AF0: @ 80F6AF0
	push {r4,lr}
	ldr r1, _080F6B10 @ =gUnknown_083DFEC4
	ldr r0, [r1]
	ldr r2, _080F6B14 @ =0x000087de
	adds r0, r2
	ldrb r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x6
	bls _080F6B04
	b _080F6C08
_080F6B04:
	lsls r0, 2
	ldr r1, _080F6B18 @ =_080F6B1C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F6B10: .4byte gUnknown_083DFEC4
_080F6B14: .4byte 0x000087de
_080F6B18: .4byte _080F6B1C
	.align 2, 0
_080F6B1C:
	.4byte _080F6B38
	.4byte _080F6B54
	.4byte _080F6B6E
	.4byte _080F6B84
	.4byte _080F6B9C
	.4byte _080F6BC0
	.4byte _080F6BE0
_080F6B38:
	bl sub_80F173C
	lsls r0, 24
	cmp r0, 0
	bne _080F6C18
	ldr r0, _080F6B4C @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r3, _080F6B50 @ =0x000087de
	adds r1, r3
	b _080F6BCE
	.align 2, 0
_080F6B4C: .4byte gUnknown_083DFEC4
_080F6B50: .4byte 0x000087de
_080F6B54:
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 6
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	bl sub_80F1480
	bl sub_80F66E0
	b _080F6BC6
_080F6B6E:
	bl DrawMonRibbonIcons
	ldr r0, _080F6B7C @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _080F6B80 @ =0x000087de
	adds r1, r2
	b _080F6BCE
	.align 2, 0
_080F6B7C: .4byte gUnknown_083DFEC4
_080F6B80: .4byte 0x000087de
_080F6B84:
	bl sub_80F13FC
	ldr r0, _080F6B94 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r3, _080F6B98 @ =0x000087de
	adds r1, r3
	b _080F6BCE
	.align 2, 0
_080F6B94: .4byte gUnknown_083DFEC4
_080F6B98: .4byte 0x000087de
_080F6B9C:
	ldr r4, [r4]
	ldr r1, _080F6BB8 @ =0x0000876e
	adds r0, r4, r1
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r1, 0
	bl sub_80F4824
	ldr r3, _080F6BBC @ =0x000087de
	adds r4, r3
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _080F6C18
	.align 2, 0
_080F6BB8: .4byte 0x0000876e
_080F6BBC: .4byte 0x000087de
_080F6BC0:
	movs r0, 0
	bl sub_80F2E18
_080F6BC6:
	ldr r0, _080F6BD8 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F6BDC @ =0x000087de
	adds r1, r0
_080F6BCE:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080F6C18
	.align 2, 0
_080F6BD8: .4byte gUnknown_083DFEC4
_080F6BDC: .4byte 0x000087de
_080F6BE0:
	bl sub_80F170C
	lsls r0, 24
	cmp r0, 0
	bne _080F6C18
	bl sub_80F1438
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _080F6C0C @ =0x0000dfff
	ands r0, r1
	strh r0, [r2]
	ldr r0, _080F6C10 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _080F6C14 @ =0x000087de
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080F6C08:
	movs r0, 0
	b _080F6C1A
	.align 2, 0
_080F6C0C: .4byte 0x0000dfff
_080F6C10: .4byte gUnknown_083DFEC4
_080F6C14: .4byte 0x000087de
_080F6C18:
	movs r0, 0x1
_080F6C1A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80F6AF0

	thumb_func_start sub_80F6C20
sub_80F6C20: @ 80F6C20
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _080F6D44 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _080F6D48 @ =0x0000d158
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
	mov r8, r1
	ldr r2, _080F6D4C @ =gSaveBlock1 + 0x97A
	mov r9, r2
_080F6C3A:
	ldr r1, _080F6D50 @ =gTrainerEyeTrainers
	mov r4, r8
	lsls r0, r4, 4
	adds r6, r0, r1
	ldrh r7, [r6]
	adds r0, r7, 0
	bl HasTrainerAlreadyBeenFought
	lsls r0, 24
	cmp r0, 0
	beq _080F6CA0
	ldr r0, _080F6D44 @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r0, _080F6D48 @ =0x0000d158
	adds r5, r4, r0
	ldrh r0, [r5]
	lsls r0, 3
	adds r0, r4, r0
	ldr r1, _080F6D54 @ =0x0000cee8
	adds r0, r1
	strh r7, [r0]
	ldrh r0, [r5]
	lsls r0, 3
	adds r0, r4, r0
	ldr r2, _080F6D58 @ =0x0000ceec
	adds r0, r2
	mov r1, r8
	strb r1, [r0]
	ldrh r0, [r5]
	lsls r0, 3
	adds r0, r4, r0
	mov r1, r8
	add r1, r9
	ldrb r1, [r1]
	adds r2, 0x1
	adds r0, r2
	strb r1, [r0]
	ldrh r0, [r6, 0xA]
	ldrh r1, [r6, 0xC]
	bl Overworld_GetMapHeaderByGroupAndId
	ldrh r1, [r5]
	lsls r1, 3
	adds r4, r1
	ldrb r0, [r0, 0x14]
	ldr r1, _080F6D5C @ =0x0000ceea
	adds r4, r1
	strh r0, [r4]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_080F6CA0:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r0, 0x37
	bls _080F6C3A
	movs r2, 0
	mov r8, r2
	movs r6, 0
_080F6CB4:
	ldr r1, _080F6D60 @ =gUnknown_083E49C0
	mov r4, r8
	lsls r0, r4, 2
	adds r5, r0, r1
	ldrh r4, [r5]
	adds r0, r4, 0
	bl HasTrainerAlreadyBeenFought
	lsls r0, 24
	cmp r0, 0
	beq _080F6D0E
	ldr r0, _080F6D44 @ =gUnknown_083DFEC4
	ldr r2, [r0]
	ldr r0, _080F6D48 @ =0x0000d158
	adds r3, r2, r0
	ldrh r0, [r3]
	lsls r0, 3
	adds r0, r2, r0
	ldr r1, _080F6D54 @ =0x0000cee8
	adds r0, r1
	strh r4, [r0]
	ldrh r0, [r3]
	lsls r0, 3
	adds r0, r2, r0
	ldrh r1, [r5, 0x2]
	ldr r4, _080F6D5C @ =0x0000ceea
	adds r0, r4
	strh r1, [r0]
	ldrh r0, [r3]
	lsls r0, 3
	adds r0, r2, r0
	ldr r1, _080F6D64 @ =0x0000ceed
	adds r0, r1
	strb r6, [r0]
	ldrh r0, [r3]
	lsls r0, 3
	adds r2, r0
	mov r0, r8
	adds r0, 0x38
	adds r4, 0x2
	adds r2, r4
	strb r0, [r2]
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
_080F6D0E:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r0, 0xC
	bls _080F6CB4
	ldr r3, _080F6D44 @ =gUnknown_083DFEC4
	ldr r2, [r3]
	ldr r1, _080F6D68 @ =0x0000876c
	adds r0, r2, r1
	movs r1, 0
	strh r1, [r0]
	ldr r4, _080F6D6C @ =0x00008770
	adds r0, r2, r4
	strh r1, [r0]
	subs r4, 0x2
	adds r0, r2, r4
	strh r1, [r0]
	ldr r1, _080F6D48 @ =0x0000d158
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, 0x8
	bhi _080F6D70
	subs r4, r0, 0x1
	b _080F6D72
	.align 2, 0
_080F6D44: .4byte gUnknown_083DFEC4
_080F6D48: .4byte 0x0000d158
_080F6D4C: .4byte gSaveBlock1 + 0x97A
_080F6D50: .4byte gTrainerEyeTrainers
_080F6D54: .4byte 0x0000cee8
_080F6D58: .4byte 0x0000ceec
_080F6D5C: .4byte 0x0000ceea
_080F6D60: .4byte gUnknown_083E49C0
_080F6D64: .4byte 0x0000ceed
_080F6D68: .4byte 0x0000876c
_080F6D6C: .4byte 0x00008770
_080F6D70:
	movs r4, 0x7
_080F6D72:
	ldr r1, _080F6DA8 @ =0x00008772
	adds r0, r2, r1
	strh r4, [r0]
	ldr r3, [r3]
	ldr r2, _080F6DAC @ =0x0000d158
	adds r0, r3, r2
	ldrh r0, [r0]
	subs r0, 0x1
	ldr r4, _080F6DB0 @ =0x00008774
	adds r1, r3, r4
	strh r0, [r1]
	movs r1, 0
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080F6D94
	movs r1, 0x1
_080F6D94:
	ldr r2, _080F6DB4 @ =0x000087c9
	adds r0, r3, r2
	strb r1, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F6DA8: .4byte 0x00008772
_080F6DAC: .4byte 0x0000d158
_080F6DB0: .4byte 0x00008774
_080F6DB4: .4byte 0x000087c9
	thumb_func_end sub_80F6C20

	thumb_func_start sub_80F6DB8
sub_80F6DB8: @ 80F6DB8
	push {r4,lr}
	movs r1, 0
	ldr r0, _080F6DEC @ =gUnknown_083DFEC4
	ldr r4, [r0]
	ldr r2, _080F6DF0 @ =0x00008fe9
	adds r0, r4, r2
	strb r1, [r0]
	movs r0, 0
	bl sub_80F6E04
	ldr r0, _080F6DF4 @ =0x0000d15a
	adds r1, r4, r0
	ldr r0, _080F6DF8 @ =0x0000ffb8
	strh r0, [r1]
	movs r0, 0
	bl sub_80F2F7C
	ldr r1, _080F6DFC @ =0x0000876e
	adds r0, r4, r1
	ldrh r0, [r0]
	ldr r2, _080F6E00 @ =0x000087dc
	adds r4, r2
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F6DEC: .4byte gUnknown_083DFEC4
_080F6DF0: .4byte 0x00008fe9
_080F6DF4: .4byte 0x0000d15a
_080F6DF8: .4byte 0x0000ffb8
_080F6DFC: .4byte 0x0000876e
_080F6E00: .4byte 0x000087dc
	thumb_func_end sub_80F6DB8

	thumb_func_start sub_80F6E04
sub_80F6E04: @ 80F6E04
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080F6E78 @ =gUnknown_083DFEC4
	ldr r5, [r0]
	ldr r1, _080F6E7C @ =0x0000876e
	adds r0, r5, r1
	movs r2, 0
	ldrsh r0, [r0, r2]
	lsls r0, 3
	adds r0, r5, r0
	ldr r7, _080F6E80 @ =0x0000cee8
	adds r0, r7
	ldrh r1, [r0]
	ldr r2, _080F6E84 @ =gTrainers
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r6, [r0, 0x3]
	lsls r0, r6, 3
	mov r8, r0
	ldr r0, _080F6E88 @ =gTrainerFrontPicTable
	add r0, r8
	ldr r2, _080F6E8C @ =gTrainerFrontPicCoords
	lsls r1, r6, 2
	adds r1, r2
	ldrb r1, [r1]
	ldr r2, _080F6E90 @ =0x000131e4
	adds r3, r5, r2
	lsls r2, r4, 13
	ldr r7, _080F6E94 @ =0x0000d1e4
	adds r2, r7
	adds r2, r5, r2
	str r2, [sp]
	str r6, [sp, 0x4]
	movs r2, 0x1
	bl DecompressPicFromTable_2
	ldr r0, _080F6E98 @ =gTrainerFrontPicPaletteTable
	add r8, r0
	mov r1, r8
	ldr r0, [r1]
	lsls r4, 7
	adds r5, r4
	adds r1, r5, 0
	bl LZ77UnCompWram
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F6E78: .4byte gUnknown_083DFEC4
_080F6E7C: .4byte 0x0000876e
_080F6E80: .4byte 0x0000cee8
_080F6E84: .4byte gTrainers
_080F6E88: .4byte gTrainerFrontPicTable
_080F6E8C: .4byte gTrainerFrontPicCoords
_080F6E90: .4byte 0x000131e4
_080F6E94: .4byte 0x0000d1e4
_080F6E98: .4byte gTrainerFrontPicPaletteTable
	thumb_func_end sub_80F6E04

	thumb_func_start sub_80F6E9C
sub_80F6E9C: @ 80F6E9C
	push {lr}
	ldr r0, _080F6EB4 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080F6EB8 @ =0x0000d15a
	adds r1, r0, r2
	ldrh r2, [r1]
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _080F6EBC
	movs r0, 0
	b _080F6ED0
	.align 2, 0
_080F6EB4: .4byte gUnknown_083DFEC4
_080F6EB8: .4byte 0x0000d15a
_080F6EBC:
	adds r0, r2, 0
	adds r0, 0x8
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bge _080F6ECC
	movs r0, 0x1
	b _080F6ED0
_080F6ECC:
	movs r0, 0
	strh r0, [r1]
_080F6ED0:
	pop {r1}
	bx r1
	thumb_func_end sub_80F6E9C

	thumb_func_start sub_80F6ED4
sub_80F6ED4: @ 80F6ED4
	push {lr}
	ldr r0, _080F6F00 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080F6F04 @ =0x0000d15a
	adds r1, r0, r2
	ldrh r3, [r1]
	movs r2, 0
	ldrsh r0, [r1, r2]
	movs r2, 0x48
	negs r2, r2
	cmp r0, r2
	beq _080F6F0A
	adds r0, r3, 0
	subs r0, 0x8
	strh r0, [r1]
	lsls r0, 16
	asrs r0, 16
	cmp r0, r2
	ble _080F6F08
	movs r0, 0x1
	b _080F6F0C
	.align 2, 0
_080F6F00: .4byte gUnknown_083DFEC4
_080F6F04: .4byte 0x0000d15a
_080F6F08:
	strh r2, [r1]
_080F6F0A:
	movs r0, 0
_080F6F0C:
	pop {r1}
	bx r1
	thumb_func_end sub_80F6ED4

	thumb_func_start sub_80F6F10
sub_80F6F10: @ 80F6F10
	push {lr}
	ldr r0, _080F6F48 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _080F6F4C @ =0x0000d15e
	adds r1, r0, r2
	movs r2, 0
	strb r2, [r1]
	ldr r1, _080F6F50 @ =0x0000d15f
	adds r0, r1
	strb r2, [r0]
	ldr r1, _080F6F54 @ =REG_BLDCNT
	movs r0, 0xC8
	strh r0, [r1]
	ldr r0, _080F6F58 @ =REG_BLDY
	strh r2, [r0]
	subs r1, 0x8
	ldr r2, _080F6F5C @ =0x00003f3f
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080F6F60 @ =0x00001f1f
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0
	bl sub_80F6FB8
	pop {r0}
	bx r0
	.align 2, 0
_080F6F48: .4byte gUnknown_083DFEC4
_080F6F4C: .4byte 0x0000d15e
_080F6F50: .4byte 0x0000d15f
_080F6F54: .4byte REG_BLDCNT
_080F6F58: .4byte REG_BLDY
_080F6F5C: .4byte 0x00003f3f
_080F6F60: .4byte 0x00001f1f
	thumb_func_end sub_80F6F10

	thumb_func_start sub_80F6F64
sub_80F6F64: @ 80F6F64
	push {lr}
	ldr r0, _080F6F9C @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F6FA0 @ =0x0000d15e
	adds r2, r1, r0
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8
	bls _080F6FB0
	movs r0, 0
	strb r0, [r2]
	ldr r0, _080F6FA4 @ =0x0000d15f
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _080F6FAC
	ldr r1, _080F6FA8 @ =REG_BLDY
	movs r0, 0x6
	strh r0, [r1]
	b _080F6FB0
	.align 2, 0
_080F6F9C: .4byte gUnknown_083DFEC4
_080F6FA0: .4byte 0x0000d15e
_080F6FA4: .4byte 0x0000d15f
_080F6FA8: .4byte REG_BLDY
_080F6FAC:
	ldr r0, _080F6FB4 @ =REG_BLDY
	strh r1, [r0]
_080F6FB0:
	pop {r0}
	bx r0
	.align 2, 0
_080F6FB4: .4byte REG_BLDY
	thumb_func_end sub_80F6F64

	thumb_func_start sub_80F6FB8
sub_80F6FB8: @ 80F6FB8
	push {lr}
	lsls r0, 24
	cmp r0, 0
	bne _080F6FDC
	ldr r1, _080F6FD0 @ =REG_WIN0H
	ldr r2, _080F6FD4 @ =0x0000e8f0
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080F6FD8 @ =0x00000888
	b _080F6FE8
	.align 2, 0
_080F6FD0: .4byte REG_WIN0H
_080F6FD4: .4byte 0x0000e8f0
_080F6FD8: .4byte 0x00000888
_080F6FDC:
	ldr r1, _080F6FF0 @ =REG_WIN0H
	ldr r2, _080F6FF4 @ =0x0000e8f0
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080F6FF8 @ =0x00000818
_080F6FE8:
	adds r0, r2, 0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080F6FF0: .4byte REG_WIN0H
_080F6FF4: .4byte 0x0000e8f0
_080F6FF8: .4byte 0x00000818
	thumb_func_end sub_80F6FB8

	thumb_func_start sub_80F6FFC
sub_80F6FFC: @ 80F6FFC
	ldr r0, _080F7008 @ =REG_BLDCNT
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	bx lr
	.align 2, 0
_080F7008: .4byte REG_BLDCNT
	thumb_func_end sub_80F6FFC

.section .text_80F708C

	thumb_func_start sub_80F708C
sub_80F708C: @ 80F708C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r0, _080F70E4 @ =gUnknown_083DFEC4
	ldr r3, [r0]
	ldr r0, _080F70E8 @ =0x0000876e
	adds r2, r3, r0
	lsls r0, r4, 24
	asrs r0, 24
	ldrh r1, [r2]
	adds r0, r1
	strh r0, [r2]
	lsls r0, 16
	cmp r0, 0
	bge _080F70B4
	ldr r5, _080F70EC @ =0x00008774
	adds r0, r3, r5
	ldrh r0, [r0]
	strh r0, [r2]
_080F70B4:
	ldr r1, _080F70EC @ =0x00008774
	adds r0, r3, r1
	movs r5, 0
	ldrsh r1, [r2, r5]
	movs r5, 0
	ldrsh r0, [r0, r5]
	cmp r1, r0
	ble _080F70C8
	movs r0, 0
	strh r0, [r2]
_080F70C8:
	ldr r1, _080F70F0 @ =0x0000bc94
	adds r0, r3, r1
	strb r4, [r0]
	ldrh r1, [r2]
	ldr r2, _080F70F4 @ =0x000087dc
	adds r0, r3, r2
	strh r1, [r0]
	ldr r5, _080F70F8 @ =0x000087de
	adds r1, r3, r5
	movs r0, 0
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F70E4: .4byte gUnknown_083DFEC4
_080F70E8: .4byte 0x0000876e
_080F70EC: .4byte 0x00008774
_080F70F0: .4byte 0x0000bc94
_080F70F4: .4byte 0x000087dc
_080F70F8: .4byte 0x000087de
	thumb_func_end sub_80F708C

	thumb_func_start sub_80F70FC
sub_80F70FC: @ 80F70FC
	push {r4-r6,lr}
	ldr r1, _080F711C @ =gUnknown_083DFEC4
	ldr r0, [r1]
	ldr r2, _080F7120 @ =0x000087de
	adds r0, r2
	ldrb r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x6
	bls _080F7110
	b _080F7218
_080F7110:
	lsls r0, 2
	ldr r1, _080F7124 @ =_080F7128
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F711C: .4byte gUnknown_083DFEC4
_080F7120: .4byte 0x000087de
_080F7124: .4byte _080F7128
	.align 2, 0
_080F7128:
	.4byte _080F7144
	.4byte _080F714A
	.4byte _080F7164
	.4byte _080F716C
	.4byte _080F71A0
	.4byte _080F71BA
	.4byte _080F71EA
_080F7144:
	bl sub_80F6ED4
	b _080F71F8
_080F714A:
	movs r0, 0
	bl sub_80F6E04
	ldr r0, _080F715C @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _080F7160 @ =0x000087de
	adds r1, r2
	b _080F7206
	.align 2, 0
_080F715C: .4byte gUnknown_083DFEC4
_080F7160: .4byte 0x000087de
_080F7164:
	movs r0, 0
	bl sub_80F2F7C
	b _080F71FE
_080F716C:
	ldr r4, [r4]
	ldr r2, _080F7194 @ =0x00008788
	adds r5, r4, r2
	ldr r0, _080F7198 @ =0x0000876e
	adds r6, r4, r0
	ldrh r1, [r6]
	adds r0, r5, 0
	bl sub_80F700C
	adds r0, r5, 0
	bl sub_80F43D4
	bl sub_80F105C
	ldrb r0, [r6]
	bl sub_80F0FFC
	ldr r2, _080F719C @ =0x000087de
	adds r4, r2
	b _080F71CC
	.align 2, 0
_080F7194: .4byte 0x00008788
_080F7198: .4byte 0x0000876e
_080F719C: .4byte 0x000087de
_080F71A0:
	bl LoadTrainerEyesDescriptionLines
	ldr r0, _080F71D4 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F71D8 @ =0x0000bc95
	adds r2, r1, r0
	movs r0, 0
	strb r0, [r2]
	ldr r2, _080F71DC @ =0x000087de
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080F71BA:
	ldr r0, _080F71D4 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F71D8 @ =0x0000bc95
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, 0x1
	bhi _080F71E0
	bl sub_80F0D5C
_080F71CC:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _080F721C
	.align 2, 0
_080F71D4: .4byte gUnknown_083DFEC4
_080F71D8: .4byte 0x0000bc95
_080F71DC: .4byte 0x000087de
_080F71E0:
	ldr r2, _080F7210 @ =0x000087de
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080F71EA:
	bl sub_80F6E9C
	lsls r0, 24
	cmp r0, 0
	bne _080F721C
	bl sub_80F0D5C
_080F71F8:
	lsls r0, 24
	cmp r0, 0
	bne _080F721C
_080F71FE:
	ldr r0, _080F7214 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r0, _080F7210 @ =0x000087de
	adds r1, r0
_080F7206:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080F721C
	.align 2, 0
_080F7210: .4byte 0x000087de
_080F7214: .4byte gUnknown_083DFEC4
_080F7218:
	movs r0, 0
	b _080F721E
_080F721C:
	movs r0, 0x1
_080F721E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80F70FC

	thumb_func_start sub_80F7224
sub_80F7224: @ 80F7224
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _080F7260 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x30
	bl GetMonData
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080F7264 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r3, _080F7268 @ =0x00008fe9
	adds r1, r0, r3
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	ldr r3, _080F726C @ =0x00008931
	adds r0, r3
	adds r4, r0, r1
	cmp r2, 0xFF
	beq _080F7270
	adds r0, r2, 0
	movs r1, 0x1D
	bl __udivsi3
	b _080F7272
	.align 2, 0
_080F7260: .4byte gPlayerParty
_080F7264: .4byte gUnknown_083DFEC4
_080F7268: .4byte 0x00008fe9
_080F726C: .4byte 0x00008931
_080F7270:
	movs r0, 0x9
_080F7272:
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80F7224

	.align 2, 0 @ Don't pad with nop.
