	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8095904
sub_8095904: @ 8095904
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	str r0, [sp]
	adds r7, r1, 0
	adds r4, r2, 0
	ldr r0, [sp, 0x3C]
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 16
	lsrs r3, 16
	str r3, [sp, 0x4]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	ldr r0, [sp]
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r4, 0
	bne _08095988
	movs r5, 0
	cmp r5, r8
	bcs _08095A2E
_0809593E:
	ldr r1, [sp]
	adds r0, r1, r5
	ldrb r2, [r0]
	ldr r0, _08095980 @ =0x0000fff0
	ands r0, r2
	lsls r0, 6
	movs r1, 0xF
	ands r2, r1
	lsls r2, 5
	adds r0, r2
	ldr r1, _08095984 @ =gFont3LatinGlyphs
	adds r4, r0, r1
	adds r0, r4, 0
	adds r1, r7, 0
	movs r2, 0x10
	bl CpuSet
	movs r2, 0x80
	lsls r2, 2
	adds r0, r4, r2
	ldr r3, [sp, 0x4]
	adds r1, r7, r3
	movs r2, 0x10
	bl CpuSet
	adds r7, 0x20
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r8
	bcc _0809593E
	b _08095A2E
	.align 2, 0
_08095980: .4byte 0x0000fff0
_08095984: .4byte gFont3LatinGlyphs
_08095988:
	movs r0, 0
	mov r9, r0
	ldr r1, [sp, 0x8]
	lsls r0, r1, 28
	lsrs r0, 24
	str r0, [sp, 0xC]
	mov r2, r8
	lsls r0, r2, 21
	movs r1, 0
	lsrs r0, 1
	str r0, [sp, 0x10]
_0809599E:
	movs r5, 0
	ldr r3, [sp, 0x4]
	adds r3, r7, r3
	str r3, [sp, 0x14]
	adds r0, r1, 0x1
	str r0, [sp, 0x18]
	cmp r5, r8
	bcs _08095A12
	movs r2, 0xF
	mov r12, r2
	lsls r1, 9
	ldr r0, _08095A40 @ =gFont3LatinGlyphs
	adds r1, r0
	mov r10, r1
_080959BA:
	ldr r3, [sp]
	adds r0, r3, r5
	ldrb r1, [r0]
	ldr r0, _08095A44 @ =0x0000fff0
	ands r0, r1
	lsls r0, 6
	mov r2, r12
	ands r1, r2
	lsls r1, 5
	adds r0, r1
	mov r3, r10
	adds r4, r0, r3
	movs r6, 0
	adds r5, 0x1
_080959D6:
	ldrb r0, [r4]
	movs r3, 0xF0
	ands r3, r0
	mov r2, r12
	ands r2, r0
	cmp r3, 0
	bne _080959E6
	ldr r3, [sp, 0xC]
_080959E6:
	cmp r2, 0
	bne _080959EC
	ldr r2, [sp, 0x8]
_080959EC:
	mov r0, r9
	adds r1, r0, 0x1
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	ldr r1, [sp, 0x40]
	adds r0, r1, r0
	orrs r3, r2
	strb r3, [r0]
	adds r4, 0x1
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x1F
	bls _080959D6
	lsls r0, r5, 16
	lsrs r5, r0, 16
	cmp r5, r8
	bcc _080959BA
_08095A12:
	ldr r0, [sp, 0x40]
	adds r1, r7, 0
	ldr r3, [sp, 0x10]
	lsrs r2, r3, 16
	bl CpuSet
	ldr r7, [sp, 0x14]
	movs r0, 0
	mov r9, r0
	ldr r1, [sp, 0x18]
	lsls r0, r1, 16
	lsrs r1, r0, 16
	cmp r1, 0x1
	bls _0809599E
_08095A2E:
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095A40: .4byte gFont3LatinGlyphs
_08095A44: .4byte 0x0000fff0
	thumb_func_end sub_8095904

	thumb_func_start unref_sub_8095A48
unref_sub_8095A48: @ 8095A48
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r7, r3, 24
	movs r6, 0
_08095A60:
	movs r3, 0
	ldrb r0, [r4]
	adds r1, r0, 0
	adds r2, r0, 0
	cmp r1, 0xFF
	beq _08095ACE
_08095A6C:
	mov r0, sp
	adds r0, r3
	adds r0, 0x8
	strb r2, [r0]
	adds r4, 0x1
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3
	bhi _08095AA8
	ldrb r0, [r4]
	adds r1, r0, 0
	adds r2, r0, 0
	cmp r1, 0xFF
	bne _08095A6C
	cmp r3, 0
	beq _08095ACE
	movs r6, 0x1
	cmp r3, 0x3
	bhi _08095AA8
	movs r2, 0
_08095A96:
	adds r0, r3, 0
	adds r1, r0, 0x1
	lsls r1, 16
	lsrs r3, r1, 16
	add r0, sp
	adds r0, 0x8
	strb r2, [r0]
	cmp r3, 0x3
	bls _08095A96
_08095AA8:
	mov r1, sp
	adds r1, r3
	adds r1, 0x8
	movs r0, 0xFF
	strb r0, [r1]
	str r7, [sp]
	ldr r0, [sp, 0x28]
	str r0, [sp, 0x4]
	add r0, sp, 0x8
	adds r1, r5, 0
	mov r2, r8
	movs r3, 0x80
	bl sub_8095904
	movs r0, 0x80
	lsls r0, 1
	adds r5, r0
	cmp r6, 0
	beq _08095A60
_08095ACE:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_8095A48

	.align 2, 0 @ Don't pad with nop.
