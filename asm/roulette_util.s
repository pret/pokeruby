	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_8124918
sub_8124918: @ 8124918
	push {lr}
	movs r1, 0
	strb r1, [r0]
	strh r1, [r0, 0x2]
	adds r0, 0x4
	movs r2, 0xC0
	bl memset
	pop {r0}
	bx r0
	thumb_func_end sub_8124918

	thumb_func_start sub_812492C
sub_812492C: @ 812492C
	push {r4-r7,lr}
	adds r3, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	cmp r6, 0xF
	bhi _08124948
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r5, r3, r0
	ldrb r7, [r5, 0x4]
	lsrs r0, r7, 7
	cmp r0, 0
	beq _0812494C
_08124948:
	movs r0, 0xFF
	b _081249AA
_0812494C:
	ldrh r0, [r2]
	movs r4, 0
	strh r0, [r5, 0x8]
	ldrh r0, [r2, 0x2]
	strh r0, [r5, 0xA]
	ldrb r0, [r2, 0x4]
	strb r0, [r5, 0xC]
	ldrb r0, [r2, 0x5]
	strb r0, [r5, 0xD]
	ldrb r0, [r2, 0x6]
	strb r0, [r5, 0xE]
	ldrb r3, [r2, 0x7]
	lsls r0, r3, 27
	lsrs r0, 27
	ldrb r2, [r5, 0xF]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	movs r0, 0x60
	ands r0, r3
	movs r2, 0x61
	negs r2, r2
	ands r1, r2
	orrs r1, r0
	lsls r3, 24
	asrs r3, 31
	lsls r3, 7
	movs r0, 0x7F
	ands r1, r0
	orrs r1, r3
	strb r1, [r5, 0xF]
	subs r0, 0xFF
	ands r0, r7
	movs r2, 0x80
	orrs r0, r2
	strb r0, [r5, 0x4]
	strb r4, [r5, 0x6]
	strb r4, [r5, 0x5]
	lsls r1, 24
	cmp r1, 0
	bge _081249A4
	movs r0, 0xFF
	b _081249A6
_081249A4:
	movs r0, 0x1
_081249A6:
	strb r0, [r5, 0x7]
	adds r0, r6, 0
_081249AA:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_812492C

	thumb_func_start unref_sub_81249B0
unref_sub_81249B0: @ 81249B0
	push {r4,lr}
	adds r2, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r4, r1, 0
	cmp r4, 0xF
	bhi _081249DC
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r1, r2, r0
	ldrb r0, [r1, 0x4]
	lsrs r0, 7
	cmp r0, 0
	beq _081249DC
	adds r0, r1, 0x4
	movs r1, 0
	movs r2, 0xC
	bl memset
	adds r0, r4, 0
	b _081249DE
_081249DC:
	movs r0, 0xFF
_081249DE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_81249B0

	thumb_func_start sub_81249E4
sub_81249E4: @ 81249E4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r5, r0, 0
	movs r0, 0
	mov r12, r0
	ldrb r1, [r5, 0x8]
	cmp r12, r1
	bcc _081249FC
	b _08124B94
_081249FC:
	movs r7, 0x1F
	ldr r0, _08124A2C @ =0xfffffc1f
	mov r10, r0
	movs r1, 0x7D
	negs r1, r1
	mov r9, r1
	movs r0, 0x1F
	mov r8, r0
_08124A0C:
	ldrh r0, [r5, 0x6]
	add r0, r12
	lsls r0, 1
	ldr r1, _08124A30 @ =gPlttBufferFaded
	adds r3, r0, r1
	ldr r1, _08124A34 @ =gPlttBufferUnfaded
	adds r6, r0, r1
	ldrb r0, [r5]
	lsls r0, 25
	lsrs r0, 25
	cmp r0, 0x1
	beq _08124A38
	cmp r0, 0x2
	beq _08124A96
	b _08124B82
	.align 2, 0
_08124A2C: .4byte 0xfffffc1f
_08124A30: .4byte gPlttBufferFaded
_08124A34: .4byte gPlttBufferUnfaded
_08124A38:
	ldr r0, [r3]
	lsls r2, r0, 27
	lsrs r0, r2, 27
	movs r1, 0x3
	ldrsb r1, [r5, r1]
	adds r0, r1
	cmp r0, 0x1F
	bhi _08124A5A
	lsrs r0, r2, 27
	adds r0, r1
	ands r0, r7
	ldrb r2, [r3]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
_08124A5A:
	ldr r0, [r3]
	lsls r2, r0, 22
	lsrs r0, r2, 27
	movs r1, 0x3
	ldrsb r1, [r5, r1]
	adds r0, r1
	cmp r0, 0x1F
	bhi _08124A7E
	lsrs r0, r2, 27
	adds r0, r1
	mov r1, r8
	ands r0, r1
	lsls r0, 5
	ldrh r2, [r3]
	mov r1, r10
	ands r1, r2
	orrs r1, r0
	strh r1, [r3]
_08124A7E:
	ldr r0, [r3]
	lsls r2, r0, 17
	lsrs r0, r2, 27
	movs r1, 0x3
	ldrsb r1, [r5, r1]
	adds r0, r1
	cmp r0, 0x1F
	bls _08124A90
	b _08124B82
_08124A90:
	lsrs r0, r2, 27
	adds r0, r1
	b _08124B74
_08124A96:
	movs r0, 0x3
	ldrsb r0, [r5, r0]
	cmp r0, 0
	bge _08124B08
	ldr r0, [r3]
	lsls r4, r0, 27
	lsrs r1, r4, 27
	movs r2, 0x3
	ldrsb r2, [r5, r2]
	adds r1, r2
	ldr r0, [r6]
	lsls r0, 27
	lsrs r0, 27
	cmp r1, r0
	blt _08124AC6
	lsrs r0, r4, 27
	adds r0, r2
	ands r0, r7
	ldrb r2, [r3]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
_08124AC6:
	ldr r0, [r3]
	lsls r4, r0, 22
	lsrs r1, r4, 27
	movs r2, 0x3
	ldrsb r2, [r5, r2]
	adds r1, r2
	ldr r0, [r6]
	lsls r0, 22
	lsrs r0, 27
	cmp r1, r0
	blt _08124AF0
	lsrs r0, r4, 27
	adds r0, r2
	mov r1, r8
	ands r0, r1
	lsls r0, 5
	ldrh r2, [r3]
	mov r1, r10
	ands r1, r2
	orrs r1, r0
	strh r1, [r3]
_08124AF0:
	ldr r0, [r3]
	lsls r4, r0, 17
	lsrs r1, r4, 27
	movs r2, 0x3
	ldrsb r2, [r5, r2]
	adds r1, r2
	ldr r0, [r6]
	lsls r0, 17
	lsrs r0, 27
	cmp r1, r0
	blt _08124B82
	b _08124B70
_08124B08:
	ldr r0, [r3]
	lsls r4, r0, 27
	lsrs r1, r4, 27
	movs r2, 0x3
	ldrsb r2, [r5, r2]
	adds r1, r2
	ldr r0, [r6]
	lsls r0, 27
	lsrs r0, 27
	cmp r1, r0
	bgt _08124B30
	lsrs r0, r4, 27
	adds r0, r2
	ands r0, r7
	ldrb r2, [r3]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
_08124B30:
	ldr r0, [r3]
	lsls r4, r0, 22
	lsrs r1, r4, 27
	movs r2, 0x3
	ldrsb r2, [r5, r2]
	adds r1, r2
	ldr r0, [r6]
	lsls r0, 22
	lsrs r0, 27
	cmp r1, r0
	bgt _08124B5A
	lsrs r0, r4, 27
	adds r0, r2
	mov r1, r8
	ands r0, r1
	lsls r0, 5
	ldrh r2, [r3]
	mov r1, r10
	ands r1, r2
	orrs r1, r0
	strh r1, [r3]
_08124B5A:
	ldr r0, [r3]
	lsls r4, r0, 17
	lsrs r1, r4, 27
	movs r2, 0x3
	ldrsb r2, [r5, r2]
	adds r1, r2
	ldr r0, [r6]
	lsls r0, 17
	lsrs r0, 27
	cmp r1, r0
	bgt _08124B82
_08124B70:
	lsrs r0, r4, 27
	adds r0, r2
_08124B74:
	ands r0, r7
	lsls r0, 2
	ldrb r2, [r3, 0x1]
	mov r1, r9
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x1]
_08124B82:
	mov r0, r12
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	ldrb r0, [r5, 0x8]
	cmp r12, r0
	bcs _08124B94
	b _08124A0C
_08124B94:
	ldrb r1, [r5, 0x2]
	adds r0, r1, 0x1
	strb r0, [r5, 0x2]
	ldrb r0, [r5, 0xB]
	lsls r0, 27
	lsls r1, 24
	asrs r0, 3
	cmp r1, r0
	beq _08124BAA
	movs r0, 0
	b _08124BDE
_08124BAA:
	movs r0, 0
	strb r0, [r5, 0x2]
	movs r0, 0x3
	ldrsb r0, [r5, r0]
	negs r0, r0
	strb r0, [r5, 0x3]
	ldrb r2, [r5]
	movs r1, 0x7F
	movs r0, 0x7F
	ands r0, r2
	cmp r0, 0x1
	bne _08124BCA
	lsls r0, r2, 25
	lsrs r0, 25
	adds r0, 0x1
	b _08124BD0
_08124BCA:
	lsls r0, r2, 25
	lsrs r0, 25
	subs r0, 0x1
_08124BD0:
	ands r0, r1
	movs r1, 0x80
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r5]
	movs r0, 0x1
_08124BDE:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_81249E4

	thumb_func_start sub_8124BEC
sub_8124BEC: @ 8124BEC
	push {r4,r5,lr}
	adds r3, r0, 0
	movs r2, 0
	ldrb r0, [r3]
	lsls r0, 25
	lsrs r0, 25
	cmp r0, 0x1
	beq _08124C02
	cmp r0, 0x2
	beq _08124C30
	b _08124C6A
_08124C02:
	ldrb r0, [r3, 0x8]
	cmp r2, r0
	bcs _08124C22
	ldr r4, _08124C2C @ =gPlttBufferFaded
_08124C0A:
	ldrh r0, [r3, 0x6]
	adds r0, r2
	lsls r0, 1
	adds r0, r4
	ldrh r1, [r3, 0x4]
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	ldrb r0, [r3, 0x8]
	cmp r2, r0
	bcc _08124C0A
_08124C22:
	ldrb r2, [r3]
	lsls r1, r2, 25
	lsrs r1, 25
	adds r1, 0x1
	b _08124C5C
	.align 2, 0
_08124C2C: .4byte gPlttBufferFaded
_08124C30:
	ldrb r0, [r3, 0x8]
	cmp r2, r0
	bcs _08124C54
	ldr r5, _08124C74 @ =gPlttBufferFaded
	ldr r4, _08124C78 @ =gPlttBufferUnfaded
_08124C3A:
	ldrh r0, [r3, 0x6]
	adds r0, r2
	lsls r0, 1
	adds r1, r0, r5
	adds r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	ldrb r0, [r3, 0x8]
	cmp r2, r0
	bcc _08124C3A
_08124C54:
	ldrb r2, [r3]
	lsls r1, r2, 25
	lsrs r1, 25
	subs r1, 0x1
_08124C5C:
	movs r0, 0x7F
	ands r1, r0
	movs r0, 0x80
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_08124C6A:
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08124C74: .4byte gPlttBufferFaded
_08124C78: .4byte gPlttBufferUnfaded
	thumb_func_end sub_8124BEC

	thumb_func_start task_tutorial_controls_fadein
task_tutorial_controls_fadein: @ 8124C7C
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r5, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _08124CE0
_08124C88:
	ldrh r0, [r4, 0x2]
	asrs r0, r5
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08124CD6
	lsls r1, r5, 1
	adds r0, r1, r5
	lsls r3, r0, 2
	adds r2, r4, r3
	ldrb r0, [r2, 0x5]
	subs r0, 0x1
	strb r0, [r2, 0x5]
	lsls r0, 24
	lsrs r0, 24
	adds r6, r1, 0
	cmp r0, 0xFF
	bne _08124CD6
	ldrh r0, [r2, 0x8]
	movs r2, 0x80
	lsls r2, 8
	adds r1, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _08124CC4
	adds r0, r3, 0x4
	adds r0, r4, r0
	bl sub_81249E4
	b _08124CCC
_08124CC4:
	adds r0, r3, 0x4
	adds r0, r4, r0
	bl sub_8124BEC
_08124CCC:
	adds r0, r6, r5
	lsls r0, 2
	adds r0, r4, r0
	ldrb r1, [r0, 0xD]
	strb r1, [r0, 0x5]
_08124CD6:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xF
	bls _08124C88
_08124CE0:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end task_tutorial_controls_fadein

	thumb_func_start sub_8124CE8
sub_8124CE8: @ 8124CE8
	push {r4-r7,lr}
	adds r3, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	movs r4, 0
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	movs r5, 0x1
	movs r7, 0x80
	negs r7, r7
_08124CFE:
	adds r0, r6, 0
	asrs r0, r4
	ands r0, r5
	cmp r0, 0
	beq _08124D2C
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r2, r3, r0
	ldrb r0, [r2, 0x4]
	lsrs r0, 7
	cmp r0, 0
	beq _08124D2C
	adds r0, r5, 0
	lsls r0, r4
	ldrh r1, [r3, 0x2]
	orrs r0, r1
	strh r0, [r3, 0x2]
	ldrb r1, [r2, 0x4]
	adds r0, r7, 0
	ands r0, r1
	orrs r0, r5
	strb r0, [r2, 0x4]
_08124D2C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _08124CFE
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8124CE8

	thumb_func_start sub_8124D3C
sub_8124D3C: @ 8124D3C
	push {r4-r7,lr}
	sub sp, 0x4
	adds r6, r0, 0
	lsls r1, 16
	lsrs r7, r1, 16
	movs r5, 0
	movs r3, 0x1
_08124D4A:
	ldrh r0, [r6, 0x2]
	asrs r0, r5
	ands r0, r3
	cmp r0, 0
	beq _08124DB2
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 2
	adds r4, r6, r0
	ldrb r0, [r4, 0x4]
	lsrs r0, 7
	cmp r0, 0
	beq _08124DB2
	adds r0, r7, 0
	asrs r0, r5
	ands r0, r3
	cmp r0, 0
	beq _08124DB2
	ldrh r1, [r4, 0xA]
	lsls r1, 1
	ldr r0, _08124DA8 @ =gPlttBufferFaded
	adds r0, r1, r0
	ldr r2, _08124DAC @ =gPlttBufferUnfaded
	adds r1, r2
	ldrb r2, [r4, 0xC]
	lsls r2, 1
	str r3, [sp]
	bl memcpy
	ldrb r0, [r4, 0x4]
	movs r2, 0x80
	negs r2, r2
	adds r1, r2, 0
	ands r0, r1
	strb r0, [r4, 0x4]
	movs r0, 0
	strb r0, [r4, 0x6]
	strb r0, [r4, 0x5]
	ldrb r0, [r4, 0xF]
	lsls r0, 24
	ldr r3, [sp]
	cmp r0, 0
	bge _08124DB0
	movs r0, 0xFF
	strb r0, [r4, 0x7]
	b _08124DB2
	.align 2, 0
_08124DA8: .4byte gPlttBufferFaded
_08124DAC: .4byte gPlttBufferUnfaded
_08124DB0:
	strb r3, [r4, 0x7]
_08124DB2:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xF
	bls _08124D4A
	ldr r0, _08124DC8 @ =0x0000ffff
	cmp r7, r0
	bne _08124DCC
	movs r0, 0
	strb r0, [r6]
	b _08124DD0
	.align 2, 0
_08124DC8: .4byte 0x0000ffff
_08124DCC:
	ldrh r0, [r6, 0x2]
	bics r0, r7
_08124DD0:
	strh r0, [r6, 0x2]
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8124D3C

	thumb_func_start sub_8124DDC
sub_8124DDC: @ 8124DDC
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r0, [sp, 0x14]
	ldr r4, [sp, 0x18]
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r4, 24
	lsrs r4, 24
	movs r1, 0
	lsrs r3, 19
	adds r3, r2
	lsls r3, 1
	adds r6, r3
	cmp r1, r4
	bcs _08124E26
_08124E04:
	lsls r0, r1, 6
	adds r2, r6, r0
	movs r0, 0
	adds r3, r1, 0x1
	cmp r0, r5
	bcs _08124E1E
_08124E10:
	strh r7, [r2]
	adds r2, 0x2
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r5
	bcc _08124E10
_08124E1E:
	lsls r0, r3, 24
	lsrs r1, r0, 24
	cmp r1, r4
	bcc _08124E04
_08124E26:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8124DDC

	thumb_func_start sub_8124E2C
sub_8124E2C: @ 8124E2C
	push {r4-r7,lr}
	adds r7, r0, 0
	ldr r0, [sp, 0x14]
	ldr r4, [sp, 0x18]
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r4, 24
	lsrs r6, r4, 24
	movs r4, 0
	lsrs r3, 19
	adds r3, r2
	lsls r3, 1
	adds r7, r3
	cmp r4, r6
	bcs _08124E76
_08124E50:
	lsls r0, r4, 6
	adds r2, r7, r0
	movs r3, 0
	adds r4, 0x1
	cmp r3, r5
	bcs _08124E6E
_08124E5C:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, 0x2
	adds r2, 0x2
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, r5
	bcc _08124E5C
_08124E6E:
	lsls r0, r4, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bcc _08124E50
_08124E76:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8124E2C

	.align 2, 0 @ Don't pad with nop.
