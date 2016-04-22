	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start umul3232H32
umul3232H32: @ 81DCE14
	adr r2, _081DCE18
	bx r2
	.arm
_081DCE18:
	umull r2, r3, r0, r1
	add r0, r3, 0
	bx lr
	thumb_func_end umul3232H32

	thumb_func_start SoundMain
SoundMain: @ 81DCE24
	ldr r0, _081DCE90
	ldr r0, [r0]
	ldr r2, _081DCE94
	ldr r3, [r0]
	cmp r2, r3
	beq _081DCE32
	bx lr
_081DCE32:
	adds r3, 0x1
	str r3, [r0]
	push {r4-r7,lr}
	mov r1, r8
	mov r2, r9
	mov r3, r10
	mov r4, r11
	push {r0-r4}
	sub sp, 0x18
	ldrb r1, [r0, 0xC]
	cmp r1, 0
	beq _081DCE56
	ldr r2, _081DCE9C
	ldrb r2, [r2]
	cmp r2, 0xA0
	bcs _081DCE54
	adds r2, 0xE4
_081DCE54:
	adds r1, r2
_081DCE56:
	str r1, [sp, 0x14]
	ldr r3, [r0, 0x20]
	cmp r3, 0
	beq _081DCE66
	ldr r0, [r0, 0x24]
	bl _081DD25E
	ldr r0, [sp, 0x18]
_081DCE66:
	ldr r3, [r0, 0x28]
	bl _081DD25E
	ldr r0, [sp, 0x18]
	ldr r3, [r0, 0x10]
	mov r8, r3
	ldr r5, _081DCEA0
	adds r5, r0
	ldrb r4, [r0, 0x4]
	subs r7, r4, 0x1
	bls _081DCE86
	ldrb r1, [r0, 0xB]
	subs r1, r7
	mov r2, r8
	muls r2, r1
	adds r5, r2
_081DCE86:
	str r5, [sp, 0x8]
	ldr r6, _081DCEA4
	ldr r3, _081DCE98
	bx r3
	.align 2, 0
_081DCE90: .4byte 0x03007ff0
_081DCE94: .4byte 0x68736d53
_081DCE98: .4byte 0x03000f61
_081DCE9C: .4byte 0x04000006
_081DCEA0: .4byte 0x00000350
_081DCEA4: .4byte 0x00000630
	thumb_func_end SoundMain

	thumb_func_start SoundMainRAM
SoundMainRAM: @ 81DCEA8
	ldrb r3, [r0, 0x5]
	cmp r3, 0
	beq _081DCF08
	adr r1, _081DCEB4
	bx r1
	.arm
_081DCEB4:
	cmp r4, 0x2
	addeq r7, r0, 0x350
	addne r7, r5, r8
	mov r4, r8
_081DCEC4:
	ldrsb r0, [r5, r6]
	ldrsb r1, [r5]
	add r0, r0, r1
	ldrsb r1, [r7, r6]
	add r0, r0, r1
	ldrsb r1, [r7], 0x1
	add r0, r0, r1
	mul r1, r0, r3
	mov r0, r1, asr 9
	tst r0, 0x80
	addne r0, r0, 0x1
	strb r0, [r5, r6]
	strb r0, [r5], 0x1
	subs r4, r4, 0x1
	bgt _081DCEC4
	add r0, pc, 0x2F
	bx r0
	.thumb
_081DCF08:
	movs r0, 0
	mov r1, r8
	adds r6, r5
	lsrs r1, 3
	bcc _081DCF16
	stm r5!, {r0}
	stm r6!, {r0}
_081DCF16:
	lsrs r1, 1
	bcc _081DCF22
	stm r5!, {r0}
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
_081DCF22:
	stm r5!, {r0}
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
	subs r1, 0x1
	bgt _081DCF22
	ldr r4, [sp, 0x18]
	ldr r0, [r4, 0x18]
	mov r12, r0
	ldrb r0, [r4, 0x6]
	adds r4, 0x50
_081DCF40:
	str r0, [sp, 0x4]
	ldr r3, [r4, 0x24]
	ldr r0, [sp, 0x14]
	cmp r0, 0
	beq _081DCF60
	ldr r1, _081DCF5C
	ldrb r1, [r1]
	cmp r1, 0xA0
	bcs _081DCF54
	adds r1, 0xE4
_081DCF54:
	cmp r1, r0
	bcc _081DCF60
	b _081DD24A
	.align 2, 0
_081DCF5C: .4byte 0x04000006
_081DCF60:
	ldrb r6, [r4]
	movs r0, 0xC7
	tst r0, r6
	bne _081DCF6A
	b _081DD240
_081DCF6A:
	movs r0, 0x80
	tst r0, r6
	beq _081DCFA0
	movs r0, 0x40
	tst r0, r6
	bne _081DCFB0
	movs r6, 0x3
	strb r6, [r4]
	adds r0, r3, 0
	adds r0, 0x10
	ldr r1, [r4, 0x18]
	adds r0, r1
	str r0, [r4, 0x28]
	ldr r0, [r3, 0xC]
	subs r0, r1
	str r0, [r4, 0x18]
	movs r5, 0
	strb r5, [r4, 0x9]
	str r5, [r4, 0x1C]
	ldrb r2, [r3, 0x3]
	movs r0, 0xC0
	tst r0, r2
	beq _081DCFF8
	movs r0, 0x10
	orrs r6, r0
	strb r6, [r4]
	b _081DCFF8
_081DCFA0:
	ldrb r5, [r4, 0x9]
	movs r0, 0x4
	tst r0, r6
	beq _081DCFB6
	ldrb r0, [r4, 0xD]
	subs r0, 0x1
	strb r0, [r4, 0xD]
	bhi _081DD006
_081DCFB0:
	movs r0, 0
	strb r0, [r4]
	b _081DD240
_081DCFB6:
	movs r0, 0x40
	tst r0, r6
	beq _081DCFD6
	ldrb r0, [r4, 0x7]
	muls r5, r0
	lsrs r5, 8
	ldrb r0, [r4, 0xC]
	cmp r5, r0
	bhi _081DD006
_081DCFC8:
	ldrb r5, [r4, 0xC]
	cmp r5, 0
	beq _081DCFB0
	movs r0, 0x4
	orrs r6, r0
	strb r6, [r4]
	b _081DD006
_081DCFD6:
	movs r2, 0x3
	ands r2, r6
	cmp r2, 0x2
	bne _081DCFF4
	ldrb r0, [r4, 0x5]
	muls r5, r0
	lsrs r5, 8
	ldrb r0, [r4, 0x6]
	cmp r5, r0
	bhi _081DD006
	adds r5, r0, 0
	beq _081DCFC8
	subs r6, 0x1
	strb r6, [r4]
	b _081DD006
_081DCFF4:
	cmp r2, 0x3
	bne _081DD006
_081DCFF8:
	ldrb r0, [r4, 0x4]
	adds r5, r0
	cmp r5, 0xFF
	bcc _081DD006
	movs r5, 0xFF
	subs r6, 0x1
	strb r6, [r4]
_081DD006:
	strb r5, [r4, 0x9]
	ldr r0, [sp, 0x18]
	ldrb r0, [r0, 0x7]
	adds r0, 0x1
	muls r0, r5
	lsrs r5, r0, 4
	ldrb r0, [r4, 0x2]
	muls r0, r5
	lsrs r0, 8
	strb r0, [r4, 0xA]
	ldrb r0, [r4, 0x3]
	muls r0, r5
	lsrs r0, 8
	strb r0, [r4, 0xB]
	movs r0, 0x10
	ands r0, r6
	str r0, [sp, 0x10]
	beq _081DD03A
	adds r0, r3, 0
	adds r0, 0x10
	ldr r1, [r3, 0x8]
	adds r0, r1
	str r0, [sp, 0xC]
	ldr r0, [r3, 0xC]
	subs r0, r1
	str r0, [sp, 0x10]
_081DD03A:
	ldr r5, [sp, 0x8]
	ldr r2, [r4, 0x18]
	ldr r3, [r4, 0x28]
	adr r0, _081DD044
	bx r0
	.arm
_081DD044:
	str r8, [sp]
	ldr r9, [r4, 0x1C]
	ldrb r10, [r4, 0xA]
	ldrb r11, [r4, 0xB]
	ldrb r0, [r4, 0x1]
	tst r0, 0x30
	beq _081DD068
	bl sub_81DD264
	b _081DD228
_081DD068:
	mov r10, r10, lsl 16
	mov r11, r11, lsl 16
	ldrb r0, [r4, 0x1]
	tst r0, 0x8
	beq _081DD19C
_081DD07C:
	cmp r2, 0x4
	ble _081DD0EC
	subs r2, r2, r8
	movgt r9, 0
	bgt _081DD0A8
	mov r9, r8
	add r2, r2, r8
	sub r8, r2, 0x4
	sub r9, r9, r8
	ands r2, r2, 0x3
	moveq r2, 0x4
_081DD0A8:
	ldr r6, [r5]
	ldr r7, [r5, 0x630]
_081DD0B0:
	ldrsb r0, [r3], 0x1
	mul r1, r10, r0
	bic r1, r1, 0xFF0000
	add r6, r1, r6, ror 8
	mul r1, r11, r0
	bic r1, r1, 0xFF0000
	add r7, r1, r7, ror 8
	adds r5, r5, 0x40000000
	bcc _081DD0B0
	str r7, [r5, 0x630]
	str r6, [r5], 0x4
	subs r8, r8, 0x4
	bgt _081DD0A8
	adds r8, r8, r9
	beq _081DD22C
_081DD0EC:
	ldr r6, [r5]
	ldr r7, [r5, 0x630]
_081DD0F4:
	ldrsb r0, [r3], 0x1
	mul r1, r10, r0
	bic r1, r1, 0xFF0000
	add r6, r1, r6, ror 8
	mul r1, r11, r0
	bic r1, r1, 0xFF0000
	add r7, r1, r7, ror 8
	subs r2, r2, 0x1
	beq _081DD164
_081DD118:
	adds r5, r5, 0x40000000
	bcc _081DD0F4
	str r7, [r5, 0x630]
	str r6, [r5], 0x4
	subs r8, r8, 0x4
	bgt _081DD07C
	b _081DD22C
_081DD134:
	ldr r0, [sp, 0x18]
	cmp r0, 0
	beq _081DD158
	ldr r3, [sp, 0x14]
	rsb lr, r2, 0
_081DD148:
	adds r2, r0, r2
	bgt _081DD1FC
	sub lr, lr, r0
	b _081DD148
_081DD158:
	ldmia sp!, {r4,r12}
	mov r2, 0
	b _081DD174
_081DD164:
	ldr r2, [sp, 0x10]
	cmp r2, 0
	ldrne r3, [sp, 0xC]
	bne _081DD118
_081DD174:
	strb r2, [r4]
	mov r0, r5, lsr 30
	bic r5, r5, 0xC0000000
	rsb r0, r0, 0x3
	mov r0, r0, lsl 3
	mov r6, r6, ror r0
	mov r7, r7, ror r0
	str r7, [r5, 0x630]
	str r6, [r5], 0x4
	b _081DD234
_081DD19C:
	stmdb sp!, {r4,r12}
	ldr r1, [r4, 0x20]
	mul r4, r12, r1
	ldrsb r0, [r3]
	ldrsb r1, [r3, 0x1]!
	sub r1, r1, r0
_081DD1B4:
	ldr r6, [r5]
	ldr r7, [r5, 0x630]
_081DD1BC:
	mul lr, r9, r1
	add lr, r0, lr, asr 23
	mul r12, r10, lr
	bic r12, r12, 0xFF0000
	add r6, r12, r6, ror 8
	mul r12, r11, lr
	bic r12, r12, 0xFF0000
	add r7, r12, r7, ror 8
	add r9, r9, r4
	movs lr, r9, lsr 23
	beq _081DD208
	bic r9, r9, 0x3F800000
	subs r2, r2, lr
	ble _081DD134
	subs lr, lr, 0x1
	addeq r0, r0, r1
_081DD1FC:
	ldrsbne r0, [r3, lr]!
	ldrsb r1, [r3, 0x1]!
	sub r1, r1, r0
_081DD208:
	adds r5, r5, 0x40000000
	bcc _081DD1BC
	str r7, [r5, 0x630]
	str r6, [r5], 0x4
	subs r8, r8, 0x4
	bgt _081DD1B4
	sub r3, r3, 0x1
	ldmia sp!, {r4,r12}
_081DD228:
	str r9, [r4, 0x1C]
_081DD22C:
	str r2, [r4, 0x18]
	str r3, [r4, 0x28]
_081DD234:
	ldr r8, [sp]
	add r0, pc, 0x1
	bx r0
	.thumb
_081DD240:
	ldr r0, [sp, 0x4]
	subs r0, 0x1
	ble _081DD24A
	adds r4, 0x40
	b _081DCF40
_081DD24A:
	ldr r0, [sp, 0x18]
	ldr r3, _081DD260
	str r3, [r0]
	add sp, 0x1C
	pop {r0-r7}
	mov r8, r0
	mov r9, r1
	mov r10, r2
	mov r11, r3
	pop {r3}
_081DD25E:
	bx r3
	.align 2, 0
_081DD260: .4byte 0x68736d53
	thumb_func_end SoundMainRAM

	arm_func_start sub_81DD264
sub_81DD264: @ 81DD264
	ldr r6, [r4, 0x24]
	ldrb r0, [r4]
	tst r0, 0x20
	bne _081DD2B4
	orr r0, r0, 0x20
	strb r0, [r4]
	ldrb r0, [r4, 0x1]
	tst r0, 0x10
	beq _081DD29C
	ldr r1, [r6, 0xC]
	add r1, r1, r6, lsl 1
	add r1, r1, 0x20
	sub r3, r1, r3
	str r3, [r4, 0x28]
_081DD29C:
	ldrh r0, [r6]
	cmp r0, 0
	beq _081DD2B4
	sub r3, r3, r6
	sub r3, r3, 0x10
	str r3, [r4, 0x28]
_081DD2B4:
	stmdb sp!, {r8,r12,lr}
	mov r10, r10, lsl 16
	mov r11, r11, lsl 16
	ldr r1, [r4, 0x20]
	ldrb r0, [r4, 0x1]
	tst r0, 0x8
	movne r8, 0x800000
	muleq r8, r12, r1
	ldrh r0, [r6]
	cmp r0, 0
	beq _081DD468
	mov r0, 0xFF000000
	str r0, [r4, 0x3C]
	ldrb r0, [r4, 0x1]
	tst r0, 0x10
	bne _081DD3C0
	bl sub_81DD520
	mov r0, r1
	add r3, r3, 0x1
	bl sub_81DD520
	sub r1, r1, r0
_081DD308:
	ldr r6, [r5]
	ldr r7, [r5, 0x630]
_081DD310:
	mul lr, r9, r1
	add lr, r0, lr, asr 23
	mul r12, r10, lr
	bic r12, r12, 0xFF0000
	add r6, r12, r6, ror 8
	mul r12, r11, lr
	bic r12, r12, 0xFF0000
	add r7, r12, r7, ror 8
	add r9, r9, r8
	movs lr, r9, lsr 23
	beq _081DD370
	bic r9, r9, 0x3F800000
	subs r2, r2, lr
	ble _081DD398
	subs lr, lr, 0x1
	bne _081DD358
	add r0, r0, r1
	b _081DD364
_081DD358:
	add r3, r3, lr
	bl sub_81DD520
	mov r0, r1
_081DD364:
	add r3, r3, 0x1
	bl sub_81DD520
	sub r1, r1, r0
_081DD370:
	adds r5, r5, 0x40000000
	bcc _081DD310
	str r7, [r5, 0x630]
	str r6, [r5], 0x4
	ldr r6, [sp]
	subs r6, r6, 0x4
	str r6, [sp]
	bgt _081DD308
	sub r3, r3, 0x1
	b _081DD4F0
_081DD398:
	ldr r0, [sp, 0x1C]
	cmp r0, 0
	beq _081DD4F4
	ldr r3, [r4, 0x24]
	ldr r3, [r3, 0x8]
	rsb lr, r2, 0
_081DD3B0:
	adds r2, r2, r0
	bgt _081DD358
	sub lr, lr, r0
	b _081DD3B0
_081DD3C0:
	sub r3, r3, 0x1
	bl sub_81DD520
	mov r0, r1
	sub r3, r3, 0x1
	bl sub_81DD520
	sub r1, r1, r0
_081DD3D8:
	ldr r6, [r5]
	ldr r7, [r5, 0x630]
_081DD3E0:
	mul lr, r9, r1
	add lr, r0, lr, asr 23
	mul r12, r10, lr
	bic r12, r12, 0xFF0000
	add r6, r12, r6, ror 8
	mul r12, r11, lr
	bic r12, r12, 0xFF0000
	add r7, r12, r7, ror 8
	add r9, r9, r8
	movs lr, r9, lsr 23
	beq _081DD440
	bic r9, r9, 0x3F800000
	subs r2, r2, lr
	ble _081DD4F4
	subs lr, lr, 0x1
	bne _081DD428
	add r0, r0, r1
	b _081DD434
_081DD428:
	sub r3, r3, lr
	bl sub_81DD520
	mov r0, r1
_081DD434:
	sub r3, r3, 0x1
	bl sub_81DD520
	sub r1, r1, r0
_081DD440:
	adds r5, r5, 0x40000000
	bcc _081DD3E0
	str r7, [r5, 0x630]
	str r6, [r5], 0x4
	ldr r6, [sp]
	subs r6, r6, 0x4
	str r6, [sp]
	bgt _081DD3D8
	add r3, r3, 0x2
	b _081DD4F0
_081DD468:
	ldrb r0, [r4, 0x1]
	tst r0, 0x10
	beq _081DD4F0
	ldrsb r0, [r3, -0x1]!
	ldrsb r1, [r3, -0x1]
	sub r1, r1, r0
_081DD480:
	ldr r6, [r5]
	ldr r7, [r5, 0x630]
_081DD488:
	mul lr, r9, r1
	add lr, r0, lr, asr 23
	mul r12, r10, lr
	bic r12, r12, 0xFF0000
	add r6, r12, r6, ror 8
	mul r12, r11, lr
	bic r12, r12, 0xFF0000
	add r7, r12, r7, ror 8
	add r9, r9, r8
	movs lr, r9, lsr 23
	beq _081DD4CC
	bic r9, r9, 0x3F800000
	subs r2, r2, lr
	ble _081DD4F4
	ldrsb r0, [r3, -lr]!
	ldrsb r1, [r3, -0x1]
	sub r1, r1, r0
_081DD4CC:
	adds r5, r5, 0x40000000
	bcc _081DD488
	str r7, [r5, 0x630]
	str r6, [r5], 0x4
	ldr r6, [sp]
	subs r6, r6, 0x4
	str r6, [sp]
	bgt _081DD480
	add r3, r3, 0x1
_081DD4F0:
	ldmia sp!, {r8,r12,pc}
_081DD4F4:
	mov r2, 0
	strb r2, [r4]
	mov r0, r5, lsr 30
	bic r5, r5, 0xC0000000
	rsb r0, r0, 0x3
	mov r0, r0, lsl 3
	mov r6, r6, ror r0
	mov r7, r7, ror r0
	str r7, [r5, 0x630]
	str r6, [r5], 0x4
	ldmia sp!, {r8,r12,pc}
	arm_func_end sub_81DD264

	arm_func_start sub_81DD520
sub_81DD520: @ 81DD520
	stmdb sp!, {r0,r2,r5-r7,lr}
	mov r0, r3, lsr 6
	ldr r1, [r4, 0x3C]
	cmp r0, r1
	beq _081DD594
	str r0, [r4, 0x3C]
	mov r1, 0x21
	mul r2, r1, r0
	ldr r1, [r4, 0x24]
	add r2, r2, r1
	add r2, r2, 0x10
	ldr r5, _081DD5A4
	ldr r6, _081DD5A8
	mov r7, 0x40
	ldrb lr, [r2], 0x1
	strb lr, [r5], 0x1
	ldrb r1, [r2], 0x1
	b _081DD57C
_081DD568:
	ldrb r1, [r2], 0x1
	mov r0, r1, lsr 4
	ldrsb r0, [r6, r0]
	add lr, lr, r0
	strb lr, [r5], 0x1
_081DD57C:
	and r0, r1, 0xF
	ldrsb r0, [r6, r0]
	add lr, lr, r0
	strb lr, [r5], 0x1
	subs r7, r7, 0x2
	bgt _081DD568
_081DD594:
	ldr r5, _081DD5A4
	and r0, r3, 0x3F
	ldrsb r1, [r5, r0]
	ldmia sp!, {r0,r2,r5-r7,pc}
	.align 2, 0
_081DD5A4: .4byte 0x030007b8
_081DD5A8: .4byte gUnknown_0842F9F4
	arm_func_end sub_81DD520

	thumb_func_start SoundMainBTM
SoundMainBTM: @ 81DD5AC
	mov r12, r4
	movs r1, 0
	movs r2, 0
	movs r3, 0
	movs r4, 0
	stm r0!, {r1-r4}
	stm r0!, {r1-r4}
	stm r0!, {r1-r4}
	stm r0!, {r1-r4}
	mov r4, r12
	bx lr
	thumb_func_end SoundMainBTM

	thumb_func_start ClearChain
ClearChain: @ 81DD5C4
	ldr r3, [r0, 0x2C]
	cmp r3, 0
	beq _081DD5E2
	ldr r1, [r0, 0x34]
	ldr r2, [r0, 0x30]
	cmp r2, 0
	beq _081DD5D6
	str r1, [r2, 0x34]
	b _081DD5D8
_081DD5D6:
	str r1, [r3, 0x20]
_081DD5D8:
	cmp r1, 0
	beq _081DD5DE
	str r2, [r1, 0x30]
_081DD5DE:
	movs r1, 0
	str r1, [r0, 0x2C]
_081DD5E2:
	bx lr
	thumb_func_end ClearChain

	thumb_func_start ply_fine
ply_fine: @ 81DD5E4
	push {r4,r5,lr}
	adds r5, r1, 0
	ldr r4, [r5, 0x20]
	cmp r4, 0
	beq _081DD608
_081DD5EE:
	ldrb r1, [r4]
	movs r0, 0xC7
	tst r0, r1
	beq _081DD5FC
	movs r0, 0x40
	orrs r1, r0
	strb r1, [r4]
_081DD5FC:
	adds r0, r4, 0
	bl ClearChain
	ldr r4, [r4, 0x34]
	cmp r4, 0
	bne _081DD5EE
_081DD608:
	movs r0, 0
	strb r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end ply_fine

	thumb_func_start MPlyJmpTblCopy
MPlyJmpTblCopy: @ 81DD614
	mov r12, lr
	movs r1, 0x24
	ldr r2, _081DD644
_081DD61A:
	ldr r3, [r2]
	bl chk_adr_r2
	stm r0!, {r3}
	adds r2, 0x4
	subs r1, 0x1
	bgt _081DD61A
	bx r12
	thumb_func_end MPlyJmpTblCopy

	thumb_func_start ldrb_r3_r2
ldrb_r3_r2: @ 81DD62C
	ldrb r3, [r2]
	thumb_func_end ldrb_r3_r2

	non_word_aligned_thumb_func_start chk_adr_r2
chk_adr_r2: @ 81DD62E
	push {r0}
	lsrs r0, r2, 25
	bne _081DD640
	ldr r0, _081DD644
	cmp r2, r0
	bcc _081DD63E
	lsrs r0, r2, 14
	beq _081DD640
_081DD63E:
	movs r3, 0
_081DD640:
	pop {r0}
	bx lr
	.align 2, 0
_081DD644: .4byte gUnknown_0842F964
	thumb_func_end chk_adr_r2

	thumb_func_start ld_r3_tp_adr_i
ld_r3_tp_adr_i: @ 81DD648
	ldr r2, [r1, 0x40]
_081DD64A:
	adds r3, r2, 0x1
	str r3, [r1, 0x40]
	ldrb r3, [r2]
	b chk_adr_r2
	thumb_func_end ld_r3_tp_adr_i

	thumb_func_start ply_goto
ply_goto: @ 81DD654
	push {lr}
_081DD656:
	ldr r2, [r1, 0x40]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	ldrb r3, [r2, 0x2]
	orrs r0, r3
	lsls r0, 8
	ldrb r3, [r2, 0x1]
	orrs r0, r3
	lsls r0, 8
	bl ldrb_r3_r2
	orrs r0, r3
	str r0, [r1, 0x40]
	pop {r0}
	bx r0
	thumb_func_end ply_goto

	thumb_func_start ply_patt
ply_patt: @ 81DD674
	ldrb r2, [r1, 0x2]
	cmp r2, 0x3
	bcs _081DD68C
	lsls r2, 2
	adds r3, r1, r2
	ldr r2, [r1, 0x40]
	adds r2, 0x4
	str r2, [r3, 0x44]
	ldrb r2, [r1, 0x2]
	adds r2, 0x1
	strb r2, [r1, 0x2]
	b ply_goto
_081DD68C:
	b ply_fine
	thumb_func_end ply_patt

	thumb_func_start play_pend
play_pend: @ 81DD690
	ldrb r2, [r1, 0x2]
	cmp r2, 0
	beq _081DD6A2
	subs r2, 0x1
	strb r2, [r1, 0x2]
	lsls r2, 2
	adds r3, r1, r2
	ldr r2, [r3, 0x44]
	str r2, [r1, 0x40]
_081DD6A2:
	bx lr
	thumb_func_end play_pend

	thumb_func_start ply_rept
ply_rept: @ 81DD6A4
	push {lr}
	ldr r2, [r1, 0x40]
	ldrb r3, [r2]
	cmp r3, 0
	bne _081DD6B4
	adds r2, 0x1
	str r2, [r1, 0x40]
	b _081DD656
_081DD6B4:
	ldrb r3, [r1, 0x3]
	adds r3, 0x1
	strb r3, [r1, 0x3]
	mov r12, r3
	bl ld_r3_tp_adr_i
	cmp r12, r3
	bcs _081DD6C6
	b _081DD656
_081DD6C6:
	movs r3, 0
	strb r3, [r1, 0x3]
	adds r2, 0x5
	str r2, [r1, 0x40]
	pop {r0}
	bx r0
	thumb_func_end ply_rept

	thumb_func_start ply_prio
ply_prio: @ 81DD6D4
	mov r12, lr
	bl ld_r3_tp_adr_i
	strb r3, [r1, 0x1D]
	bx r12
	thumb_func_end ply_prio

	thumb_func_start ply_tempo
ply_tempo: @ 81DD6E0
	mov r12, lr
	bl ld_r3_tp_adr_i
	lsls r3, 1
	strh r3, [r0, 0x1C]
	ldrh r2, [r0, 0x1E]
	muls r3, r2
	lsrs r3, 8
	strh r3, [r0, 0x20]
	bx r12
	thumb_func_end ply_tempo

	thumb_func_start ply_keysh
ply_keysh: @ 81DD6F4
	mov r12, lr
	bl ld_r3_tp_adr_i
	strb r3, [r1, 0xA]
	ldrb r3, [r1]
	movs r2, 0xC
	orrs r3, r2
	strb r3, [r1]
	bx r12
	thumb_func_end ply_keysh

	thumb_func_start ply_voice
ply_voice: @ 81DD708
	mov r12, lr
	ldr r2, [r1, 0x40]
	ldrb r3, [r2]
	adds r2, 0x1
	str r2, [r1, 0x40]
	lsls r2, r3, 1
	adds r2, r3
	lsls r2, 2
	ldr r3, [r0, 0x30]
	adds r2, r3
	ldr r3, [r2]
	bl chk_adr_r2
	str r3, [r1, 0x24]
	ldr r3, [r2, 0x4]
	bl chk_adr_r2
	str r3, [r1, 0x28]
	ldr r3, [r2, 0x8]
	bl chk_adr_r2
	str r3, [r1, 0x2C]
	bx r12
	thumb_func_end ply_voice

	thumb_func_start ply_vol
ply_vol: @ 81DD738
	mov r12, lr
	bl ld_r3_tp_adr_i
	strb r3, [r1, 0x12]
	ldrb r3, [r1]
	movs r2, 0x3
	orrs r3, r2
	strb r3, [r1]
	bx r12
	thumb_func_end ply_vol

	thumb_func_start ply_pan
ply_pan: @ 81DD74C
	mov r12, lr
	bl ld_r3_tp_adr_i
	subs r3, 0x40
	strb r3, [r1, 0x14]
	ldrb r3, [r1]
	movs r2, 0x3
	orrs r3, r2
	strb r3, [r1]
	bx r12
	thumb_func_end ply_pan

	thumb_func_start ply_bend
ply_bend: @ 81DD760
	mov r12, lr
	bl ld_r3_tp_adr_i
	subs r3, 0x40
	strb r3, [r1, 0xE]
	ldrb r3, [r1]
	movs r2, 0xC
	orrs r3, r2
	strb r3, [r1]
	bx r12
	thumb_func_end ply_bend

	thumb_func_start ply_bendr
ply_bendr: @ 81DD774
	mov r12, lr
	bl ld_r3_tp_adr_i
	strb r3, [r1, 0xF]
	ldrb r3, [r1]
	movs r2, 0xC
	orrs r3, r2
	strb r3, [r1]
	bx r12
	thumb_func_end ply_bendr

	thumb_func_start ply_lfodl
ply_lfodl: @ 81DD788
	mov r12, lr
	bl ld_r3_tp_adr_i
	strb r3, [r1, 0x1B]
	bx r12
	thumb_func_end ply_lfodl

	thumb_func_start ply_modt
ply_modt: @ 81DD794
	mov r12, lr
	bl ld_r3_tp_adr_i
	ldrb r0, [r1, 0x18]
	cmp r0, r3
	beq _081DD7AA
	strb r3, [r1, 0x18]
	ldrb r3, [r1]
	movs r2, 0xF
	orrs r3, r2
	strb r3, [r1]
_081DD7AA:
	bx r12
	thumb_func_end ply_modt

	thumb_func_start ply_tune
ply_tune: @ 81DD7AC
	mov r12, lr
	bl ld_r3_tp_adr_i
	subs r3, 0x40
	strb r3, [r1, 0xC]
	ldrb r3, [r1]
	movs r2, 0xC
	orrs r3, r2
	strb r3, [r1]
	bx r12
	thumb_func_end ply_tune

	thumb_func_start ply_port
ply_port: @ 81DD7C0
	mov r12, lr
	ldr r2, [r1, 0x40]
	ldrb r3, [r2]
	adds r2, 0x1
	ldr r0, _081DD7D4
	adds r0, r3
	bl _081DD64A
	strb r3, [r0]
	bx r12
	.align 2, 0
_081DD7D4: .4byte 0x04000060
	thumb_func_end ply_port

	thumb_func_start SoundVSync_rev01
SoundVSync_rev01: @ 81DD7D8
	ldr r0, _081DDA84
	ldr r0, [r0]
	ldr r2, _081DDA88
	ldr r3, [r0]
	subs r3, r2
	cmp r3, 0x1
	bhi _081DD818
	ldrb r1, [r0, 0x4]
	subs r1, 0x1
	strb r1, [r0, 0x4]
	bgt _081DD818
	ldrb r1, [r0, 0xB]
	strb r1, [r0, 0x4]
	ldr r2, _081DD81C
	ldr r1, [r2, 0x8]
	lsls r1, 7
	bcc _081DD7FE
	ldr r1, _081DD820
	str r1, [r2, 0x8]
_081DD7FE:
	ldr r1, [r2, 0x14]
	lsls r1, 7
	bcc _081DD808
	ldr r1, _081DD820
	str r1, [r2, 0x14]
_081DD808:
	movs r1, 0x4
	lsls r1, 8
	strh r1, [r2, 0xA]
	strh r1, [r2, 0x16]
	movs r1, 0xB6
	lsls r1, 8
	strh r1, [r2, 0xA]
	strh r1, [r2, 0x16]
_081DD818:
	bx lr
	.align 2, 0
_081DD81C: .4byte 0x040000bc
_081DD820: .4byte 0x84400004
	thumb_func_end SoundVSync_rev01

	thumb_func_start MPlayMain_rev01
MPlayMain_rev01: @ 81DD824
	ldr r2, _081DDA88
	ldr r3, [r0, 0x34]
	cmp r2, r3
	beq _081DD82E
	bx lr
_081DD82E:
	adds r3, 0x1
	str r3, [r0, 0x34]
	push {r0,lr}
	ldr r3, [r0, 0x38]
	cmp r3, 0
	beq _081DD840
	ldr r0, [r0, 0x3C]
	bl _081DDA7C
_081DD840:
	pop {r0}
	push {r4-r7}
	mov r4, r8
	mov r5, r9
	mov r6, r10
	mov r7, r11
	push {r4-r7}
	adds r7, r0, 0
	ldr r0, [r7, 0x4]
	cmp r0, 0
	bge _081DD858
	b _081DDA6C
_081DD858:
	ldr r0, _081DDA84
	ldr r0, [r0]
	mov r8, r0
	adds r0, r7, 0
	bl FadeOutBody_rev01
	ldr r0, [r7, 0x4]
	cmp r0, 0
	bge _081DD86C
	b _081DDA6C
_081DD86C:
	ldrh r0, [r7, 0x22]
	ldrh r1, [r7, 0x20]
	adds r0, r1
	b _081DD9BC
_081DD874:
	ldrb r6, [r7, 0x8]
	ldr r5, [r7, 0x2C]
	movs r3, 0x1
	movs r4, 0
_081DD87C:
	ldrb r0, [r5]
	movs r1, 0x80
	tst r1, r0
	bne _081DD886
	b _081DD998
_081DD886:
	mov r10, r3
	orrs r4, r3
	mov r11, r4
	ldr r4, [r5, 0x20]
	cmp r4, 0
	beq _081DD8BA
_081DD892:
	ldrb r1, [r4]
	movs r0, 0xC7
	tst r0, r1
	beq _081DD8AE
	ldrb r0, [r4, 0x10]
	cmp r0, 0
	beq _081DD8B4
	subs r0, 0x1
	strb r0, [r4, 0x10]
	bne _081DD8B4
	movs r0, 0x40
	orrs r1, r0
	strb r1, [r4]
	b _081DD8B4
_081DD8AE:
	adds r0, r4, 0
	bl ClearChain_rev
_081DD8B4:
	ldr r4, [r4, 0x34]
	cmp r4, 0
	bne _081DD892
_081DD8BA:
	ldrb r3, [r5]
	movs r0, 0x40
	tst r0, r3
	beq _081DD938
	adds r0, r5, 0
	bl Clear64byte_rev
	movs r0, 0x80
	strb r0, [r5]
	movs r0, 0x2
	strb r0, [r5, 0xF]
	movs r0, 0x40
	strb r0, [r5, 0x13]
	movs r0, 0x16
	strb r0, [r5, 0x19]
	movs r0, 0x1
	adds r1, r5, 0x6
	strb r0, [r1, 0x1E]
	b _081DD938
_081DD8E0:
	ldr r2, [r5, 0x40]
	ldrb r1, [r2]
	cmp r1, 0x80
	bcs _081DD8EC
	ldrb r1, [r5, 0x7]
	b _081DD8F6
_081DD8EC:
	adds r2, 0x1
	str r2, [r5, 0x40]
	cmp r1, 0xBD
	bcc _081DD8F6
	strb r1, [r5, 0x7]
_081DD8F6:
	cmp r1, 0xCF
	bcc _081DD90C
	mov r0, r8
	ldr r3, [r0, 0x38]
	adds r0, r1, 0
	subs r0, 0xCF
	adds r1, r7, 0
	adds r2, r5, 0
	bl _081DDA7C
	b _081DD938
_081DD90C:
	cmp r1, 0xB0
	bls _081DD92E
	adds r0, r1, 0
	subs r0, 0xB1
	strb r0, [r7, 0xA]
	mov r3, r8
	ldr r3, [r3, 0x34]
	lsls r0, 2
	ldr r3, [r3, r0]
	adds r0, r7, 0
	adds r1, r5, 0
	bl _081DDA7C
	ldrb r0, [r5]
	cmp r0, 0
	beq _081DD994
	b _081DD938
_081DD92E:
	ldr r0, _081DDA80
	subs r1, 0x80
	adds r1, r0
	ldrb r0, [r1]
	strb r0, [r5, 0x1]
_081DD938:
	ldrb r0, [r5, 0x1]
	cmp r0, 0
	beq _081DD8E0
	subs r0, 0x1
	strb r0, [r5, 0x1]
	ldrb r1, [r5, 0x19]
	cmp r1, 0
	beq _081DD994
	ldrb r0, [r5, 0x17]
	cmp r0, 0
	beq _081DD994
	ldrb r0, [r5, 0x1C]
	cmp r0, 0
	beq _081DD95A
	subs r0, 0x1
	strb r0, [r5, 0x1C]
	b _081DD994
_081DD95A:
	ldrb r0, [r5, 0x1A]
	adds r0, r1
	strb r0, [r5, 0x1A]
	adds r1, r0, 0
	subs r0, 0x40
	lsls r0, 24
	bpl _081DD96E
	lsls r2, r1, 24
	asrs r2, 24
	b _081DD972
_081DD96E:
	movs r0, 0x80
	subs r2, r0, r1
_081DD972:
	ldrb r0, [r5, 0x17]
	muls r0, r2
	asrs r2, r0, 6
	ldrb r0, [r5, 0x16]
	eors r0, r2
	lsls r0, 24
	beq _081DD994
	strb r2, [r5, 0x16]
	ldrb r0, [r5]
	ldrb r1, [r5, 0x18]
	cmp r1, 0
	bne _081DD98E
	movs r1, 0xC
	b _081DD990
_081DD98E:
	movs r1, 0x3
_081DD990:
	orrs r0, r1
	strb r0, [r5]
_081DD994:
	mov r3, r10
	mov r4, r11
_081DD998:
	subs r6, 0x1
	ble _081DD9A4
	movs r0, 0x50
	adds r5, r0
	lsls r3, 1
	b _081DD87C
_081DD9A4:
	ldr r0, [r7, 0xC]
	adds r0, 0x1
	str r0, [r7, 0xC]
	cmp r4, 0
	bne _081DD9B6
	movs r0, 0x80
	lsls r0, 24
	str r0, [r7, 0x4]
	b _081DDA6C
_081DD9B6:
	str r4, [r7, 0x4]
	ldrh r0, [r7, 0x22]
	subs r0, 0x96
_081DD9BC:
	strh r0, [r7, 0x22]
	cmp r0, 0x96
	bcc _081DD9C4
	b _081DD874
_081DD9C4:
	ldrb r2, [r7, 0x8]
	ldr r5, [r7, 0x2C]
_081DD9C8:
	ldrb r0, [r5]
	movs r1, 0x80
	tst r1, r0
	beq _081DDA62
	movs r1, 0xF
	tst r1, r0
	beq _081DDA62
	mov r9, r2
	adds r0, r7, 0
	adds r1, r5, 0
	bl TrkVolPitSet_rev01
	ldr r4, [r5, 0x20]
	cmp r4, 0
	beq _081DDA58
_081DD9E6:
	ldrb r1, [r4]
	movs r0, 0xC7
	tst r0, r1
	bne _081DD9F6
	adds r0, r4, 0
	bl ClearChain_rev
	b _081DDA52
_081DD9F6:
	ldrb r0, [r4, 0x1]
	movs r6, 0x7
	ands r6, r0
	ldrb r3, [r5]
	movs r0, 0x3
	tst r0, r3
	beq _081DDA14
	bl ChnVolSetAsm
	cmp r6, 0
	beq _081DDA14
	ldrb r0, [r4, 0x1D]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1D]
_081DDA14:
	ldrb r3, [r5]
	movs r0, 0xC
	tst r0, r3
	beq _081DDA52
	ldrb r1, [r4, 0x8]
	movs r0, 0x8
	ldrsb r0, [r5, r0]
	adds r2, r1, r0
	bpl _081DDA28
	movs r2, 0
_081DDA28:
	cmp r6, 0
	beq _081DDA46
	mov r0, r8
	ldr r3, [r0, 0x30]
	adds r1, r2, 0
	ldrb r2, [r5, 0x9]
	adds r0, r6, 0
	bl _081DDA7C
	str r0, [r4, 0x20]
	ldrb r0, [r4, 0x1D]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4, 0x1D]
	b _081DDA52
_081DDA46:
	adds r1, r2, 0
	ldrb r2, [r5, 0x9]
	ldr r0, [r4, 0x24]
	bl MidiKey2fr
	str r0, [r4, 0x20]
_081DDA52:
	ldr r4, [r4, 0x34]
	cmp r4, 0
	bne _081DD9E6
_081DDA58:
	ldrb r0, [r5]
	movs r1, 0xF0
	ands r0, r1
	strb r0, [r5]
	mov r2, r9
_081DDA62:
	subs r2, 0x1
	ble _081DDA6C
	movs r0, 0x50
	adds r5, r0
	bgt _081DD9C8
_081DDA6C:
	ldr r0, _081DDA88
	str r0, [r7, 0x34]
	pop {r0-r7}
	mov r8, r0
	mov r9, r1
	mov r10, r2
	mov r11, r3
	pop {r3}
_081DDA7C:
	bx r3
	.align 2, 0
_081DDA80: .4byte gUnknown_0842FBE8
_081DDA84: .4byte 0x03007ff0
_081DDA88: .4byte 0x68736d53
	thumb_func_end MPlayMain_rev01

	thumb_func_start TrackStop_rev01
TrackStop_rev01: @ 81DDA8C
	push {r4-r6,lr}
	adds r5, r1, 0
	ldrb r1, [r5]
	movs r0, 0x80
	tst r0, r1
	beq _081DDAC4
	ldr r4, [r5, 0x20]
	cmp r4, 0
	beq _081DDAC2
	movs r6, 0
_081DDAA0:
	ldrb r0, [r4]
	cmp r0, 0
	beq _081DDABA
	ldrb r0, [r4, 0x1]
	movs r3, 0x7
	ands r0, r3
	beq _081DDAB8
	ldr r3, _081DDACC
	ldr r3, [r3]
	ldr r3, [r3, 0x2C]
	bl _081DDA7C
_081DDAB8:
	strb r6, [r4]
_081DDABA:
	str r6, [r4, 0x2C]
	ldr r4, [r4, 0x34]
	cmp r4, 0
	bne _081DDAA0
_081DDAC2:
	str r4, [r5, 0x20]
_081DDAC4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081DDACC: .4byte 0x03007ff0
	thumb_func_end TrackStop_rev01

	thumb_func_start ChnVolSetAsm
ChnVolSetAsm: @ 81DDAD0
	ldrb r1, [r4, 0x12]
	movs r0, 0x14
	ldrsb r2, [r4, r0]
	movs r3, 0x80
	adds r3, r2
	muls r3, r1
	ldrb r0, [r5, 0x10]
	muls r0, r3
	asrs r0, 14
	cmp r0, 0xFF
	bls _081DDAE8
	movs r0, 0xFF
_081DDAE8:
	strb r0, [r4, 0x2]
	movs r3, 0x7F
	subs r3, r2
	muls r3, r1
	ldrb r0, [r5, 0x11]
	muls r0, r3
	asrs r0, 14
	cmp r0, 0xFF
	bls _081DDAFC
	movs r0, 0xFF
_081DDAFC:
	strb r0, [r4, 0x3]
	bx lr
	thumb_func_end ChnVolSetAsm

	thumb_func_start ply_note_rev01
ply_note_rev01: @ 81DDB00
	push {r4-r7,lr}
	mov r4, r8
	mov r5, r9
	mov r6, r10
	mov r7, r11
	push {r4-r7}
	sub sp, 0x18
	str r1, [sp]
	adds r5, r2, 0
	ldr r1, _081DDCFC
	ldr r1, [r1]
	str r1, [sp, 0x4]
	ldr r1, _081DDD00
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r5, 0x4]
	ldr r3, [r5, 0x40]
	ldrb r0, [r3]
	cmp r0, 0x80
	bcs _081DDB46
	strb r0, [r5, 0x5]
	adds r3, 0x1
	ldrb r0, [r3]
	cmp r0, 0x80
	bcs _081DDB44
	strb r0, [r5, 0x6]
	adds r3, 0x1
	ldrb r0, [r3]
	cmp r0, 0x80
	bcs _081DDB44
	ldrb r1, [r5, 0x4]
	adds r1, r0
	strb r1, [r5, 0x4]
	adds r3, 0x1
_081DDB44:
	str r3, [r5, 0x40]
_081DDB46:
	movs r0, 0
	str r0, [sp, 0x14]
	adds r4, r5, 0
	adds r4, 0x24
	ldrb r2, [r4]
	movs r0, 0xC0
	tst r0, r2
	beq _081DDB98
	ldrb r3, [r5, 0x5]
	movs r0, 0x40
	tst r0, r2
	beq _081DDB66
	ldr r1, [r5, 0x2C]
	adds r1, r3
	ldrb r0, [r1]
	b _081DDB68
_081DDB66:
	adds r0, r3, 0
_081DDB68:
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r0, [r5, 0x28]
	adds r1, r0
	mov r9, r1
	mov r6, r9
	ldrb r1, [r6]
	movs r0, 0xC0
	tst r0, r1
	beq _081DDB80
	b _081DDCEA
_081DDB80:
	movs r0, 0x80
	tst r0, r2
	beq _081DDB9C
	ldrb r1, [r6, 0x3]
	movs r0, 0x80
	tst r0, r1
	beq _081DDB94
	subs r1, 0xC0
	lsls r1, 1
	str r1, [sp, 0x14]
_081DDB94:
	ldrb r3, [r6, 0x1]
	b _081DDB9C
_081DDB98:
	mov r9, r4
	ldrb r3, [r5, 0x5]
_081DDB9C:
	str r3, [sp, 0x8]
	ldr r6, [sp]
	ldrb r1, [r6, 0x9]
	ldrb r0, [r5, 0x1D]
	adds r0, r1
	cmp r0, 0xFF
	bls _081DDBAC
	movs r0, 0xFF
_081DDBAC:
	str r0, [sp, 0x10]
	mov r6, r9
	ldrb r0, [r6]
	movs r6, 0x7
	ands r6, r0
	str r6, [sp, 0xC]
	beq _081DDBEC
	ldr r0, [sp, 0x4]
	ldr r4, [r0, 0x1C]
	cmp r4, 0
	bne _081DDBC4
	b _081DDCEA
_081DDBC4:
	subs r6, 0x1
	lsls r0, r6, 6
	adds r4, r0
	ldrb r1, [r4]
	movs r0, 0xC7
	tst r0, r1
	beq _081DDC40
	movs r0, 0x40
	tst r0, r1
	bne _081DDC40
	ldrb r1, [r4, 0x13]
	ldr r0, [sp, 0x10]
	cmp r1, r0
	bcc _081DDC40
	beq _081DDBE4
	b _081DDCEA
_081DDBE4:
	ldr r0, [r4, 0x2C]
	cmp r0, r5
	bcs _081DDC40
	b _081DDCEA
_081DDBEC:
	ldr r6, [sp, 0x10]
	adds r7, r5, 0
	movs r2, 0
	mov r8, r2
	ldr r4, [sp, 0x4]
	ldrb r3, [r4, 0x6]
	adds r4, 0x50
_081DDBFA:
	ldrb r1, [r4]
	movs r0, 0xC7
	tst r0, r1
	beq _081DDC40
	movs r0, 0x40
	tst r0, r1
	beq _081DDC14
	cmp r2, 0
	bne _081DDC18
	adds r2, 0x1
	ldrb r6, [r4, 0x13]
	ldr r7, [r4, 0x2C]
	b _081DDC32
_081DDC14:
	cmp r2, 0
	bne _081DDC34
_081DDC18:
	ldrb r0, [r4, 0x13]
	cmp r0, r6
	bcs _081DDC24
	adds r6, r0, 0
	ldr r7, [r4, 0x2C]
	b _081DDC32
_081DDC24:
	bhi _081DDC34
	ldr r0, [r4, 0x2C]
	cmp r0, r7
	bls _081DDC30
	adds r7, r0, 0
	b _081DDC32
_081DDC30:
	bcc _081DDC34
_081DDC32:
	mov r8, r4
_081DDC34:
	adds r4, 0x40
	subs r3, 0x1
	bgt _081DDBFA
	mov r4, r8
	cmp r4, 0
	beq _081DDCEA
_081DDC40:
	adds r0, r4, 0
	bl ClearChain_rev
	movs r1, 0
	str r1, [r4, 0x30]
	ldr r3, [r5, 0x20]
	str r3, [r4, 0x34]
	cmp r3, 0
	beq _081DDC54
	str r4, [r3, 0x30]
_081DDC54:
	str r4, [r5, 0x20]
	str r5, [r4, 0x2C]
	ldrb r0, [r5, 0x1B]
	strb r0, [r5, 0x1C]
	cmp r0, r1
	beq _081DDC66
	adds r1, r5, 0
	bl clear_modM
_081DDC66:
	ldr r0, [sp]
	adds r1, r5, 0
	bl TrkVolPitSet_rev01
	ldr r0, [r5, 0x4]
	str r0, [r4, 0x10]
	ldr r0, [sp, 0x10]
	strb r0, [r4, 0x13]
	ldr r0, [sp, 0x8]
	strb r0, [r4, 0x8]
	ldr r0, [sp, 0x14]
	strb r0, [r4, 0x14]
	mov r6, r9
	ldrb r0, [r6]
	strb r0, [r4, 0x1]
	ldr r7, [r6, 0x4]
	str r7, [r4, 0x24]
	ldr r0, [r6, 0x8]
	str r0, [r4, 0x4]
	ldrh r0, [r5, 0x1E]
	strh r0, [r4, 0xC]
	bl ChnVolSetAsm
	ldrb r1, [r4, 0x8]
	movs r0, 0x8
	ldrsb r0, [r5, r0]
	adds r3, r1, r0
	bpl _081DDCA0
	movs r3, 0
_081DDCA0:
	ldr r6, [sp, 0xC]
	cmp r6, 0
	beq _081DDCCE
	mov r6, r9
	ldrb r0, [r6, 0x2]
	strb r0, [r4, 0x1E]
	ldrb r1, [r6, 0x3]
	movs r0, 0x80
	tst r0, r1
	bne _081DDCBA
	movs r0, 0x70
	tst r0, r1
	bne _081DDCBC
_081DDCBA:
	movs r1, 0x8
_081DDCBC:
	strb r1, [r4, 0x1F]
	ldrb r2, [r5, 0x9]
	adds r1, r3, 0
	ldr r0, [sp, 0xC]
	ldr r3, [sp, 0x4]
	ldr r3, [r3, 0x30]
	bl _081DDA7C
	b _081DDCDC
_081DDCCE:
	ldr r0, [r5, 0x3C]
	str r0, [r4, 0x18]
	ldrb r2, [r5, 0x9]
	adds r1, r3, 0
	adds r0, r7, 0
	bl MidiKey2fr
_081DDCDC:
	str r0, [r4, 0x20]
	movs r0, 0x80
	strb r0, [r4]
	ldrb r1, [r5]
	movs r0, 0xF0
	ands r0, r1
	strb r0, [r5]
_081DDCEA:
	add sp, 0x18
	pop {r0-r7}
	mov r8, r0
	mov r9, r1
	mov r10, r2
	mov r11, r3
	pop {r0}
	bx r0
	.align 2, 0
_081DDCFC: .4byte 0x03007ff0
_081DDD00: .4byte gUnknown_0842FBE8
	thumb_func_end ply_note_rev01

	thumb_func_start ply_endtie_rev01
ply_endtie_rev01: @ 81DDD04
	push {r4,r5}
	ldr r2, [r1, 0x40]
	ldrb r3, [r2]
	cmp r3, 0x80
	bcs _081DDD16
	strb r3, [r1, 0x5]
	adds r2, 0x1
	str r2, [r1, 0x40]
	b _081DDD18
_081DDD16:
	ldrb r3, [r1, 0x5]
_081DDD18:
	ldr r1, [r1, 0x20]
	cmp r1, 0
	beq _081DDD40
	movs r4, 0x83
	movs r5, 0x40
_081DDD22:
	ldrb r2, [r1]
	tst r2, r4
	beq _081DDD3A
	tst r2, r5
	bne _081DDD3A
	ldrb r0, [r1, 0x11]
	cmp r0, r3
	bne _081DDD3A
	movs r0, 0x40
	orrs r2, r0
	strb r2, [r1]
	b _081DDD40
_081DDD3A:
	ldr r1, [r1, 0x34]
	cmp r1, 0
	bne _081DDD22
_081DDD40:
	pop {r4,r5}
	bx lr
	thumb_func_end ply_endtie_rev01

	thumb_func_start clear_modM
clear_modM: @ 81DDD44
	movs r2, 0
	strb r2, [r1, 0x16]
	strb r2, [r1, 0x1A]
	ldrb r2, [r1, 0x18]
	cmp r2, 0
	bne _081DDD54
	movs r2, 0xC
	b _081DDD56
_081DDD54:
	movs r2, 0x3
_081DDD56:
	ldrb r3, [r1]
	orrs r3, r2
	strb r3, [r1]
	bx lr
	thumb_func_end clear_modM

	thumb_func_start ld_r3_tp_adr_i_rev
ld_r3_tp_adr_i_rev: @ 81DDD60
	ldr r2, [r1, 0x40]
	adds r3, r2, 0x1
	str r3, [r1, 0x40]
	ldrb r3, [r2]
	bx lr
	thumb_func_end ld_r3_tp_adr_i_rev

	thumb_func_start ply_lfos_rev01
ply_lfos_rev01: @ 81DDD6C
	mov r12, lr
	bl ld_r3_tp_adr_i_rev
	strb r3, [r1, 0x19]
	cmp r3, 0
	bne _081DDD7C
	bl clear_modM
_081DDD7C:
	bx r12
	thumb_func_end ply_lfos_rev01

	thumb_func_start ply_mod_rev01
ply_mod_rev01: @ 81DDD80
	mov r12, lr
	bl ld_r3_tp_adr_i_rev
	strb r3, [r1, 0x17]
	cmp r3, 0
	bne _081DDD90
	bl clear_modM
_081DDD90:
	bx r12
	thumb_func_end ply_mod_rev01

	thumb_func_start MidiKey2fr
MidiKey2fr: @ 81DDD94
	push {r4-r7,lr}
	mov r12, r0
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r7, r2, 24
	cmp r6, 0xB2
	bls _081DDDA8
	movs r6, 0xB2
	movs r7, 0xFF
	lsls r7, 24
_081DDDA8:
	ldr r3, _081DDDF0
	adds r0, r6, r3
	ldrb r5, [r0]
	ldr r4, _081DDDF4
	movs r2, 0xF
	adds r0, r5, 0
	ands r0, r2
	lsls r0, 2
	adds r0, r4
	lsrs r1, r5, 4
	ldr r5, [r0]
	lsrs r5, r1
	adds r0, r6, 0x1
	adds r0, r3
	ldrb r1, [r0]
	adds r0, r1, 0
	ands r0, r2
	lsls r0, 2
	adds r0, r4
	lsrs r1, 4
	ldr r0, [r0]
	lsrs r0, r1
	mov r1, r12
	ldr r4, [r1, 0x4]
	subs r0, r5
	adds r1, r7, 0
	bl umul3232H32
	adds r1, r0, 0
	adds r1, r5, r1
	adds r0, r4, 0
	bl umul3232H32
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081DDDF0: .4byte gUnknown_0842FA04
_081DDDF4: .4byte gUnknown_0842FAB8
	thumb_func_end MidiKey2fr

	thumb_func_start DummyFunc
DummyFunc: @ 81DDDF8
	bx lr
	thumb_func_end DummyFunc

	thumb_func_start MPlayContinue
MPlayContinue: @ 81DDDFC
	adds r2, r0, 0
	ldr r3, [r2, 0x34]
	ldr r0, _081DDE10
	cmp r3, r0
	bne _081DDE0E
	ldr r0, [r2, 0x4]
	ldr r1, _081DDE14
	ands r0, r1
	str r0, [r2, 0x4]
_081DDE0E:
	bx lr
	.align 2, 0
_081DDE10: .4byte 0x68736d53
_081DDE14: .4byte 0x7fffffff
	thumb_func_end MPlayContinue

	thumb_func_start MPlayFadeOut
@ void MPlayFadeOut(mplay_table_entry *a1, s16 a2)
MPlayFadeOut: @ 81DDE18
	adds r2, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r3, [r2, 0x34]
	ldr r0, _081DDE34
	cmp r3, r0
	bne _081DDE30
	strh r1, [r2, 0x26]
	strh r1, [r2, 0x24]
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r2, 0x28]
_081DDE30:
	bx lr
	.align 2, 0
_081DDE34: .4byte 0x68736d53
	thumb_func_end MPlayFadeOut

	thumb_func_start m4aSoundInit
m4aSoundInit: @ 81DDE38
	push {r4-r6,lr}
	ldr r0, _081DDEB8
	movs r1, 0x2
	negs r1, r1
	ands r0, r1
	ldr r1, _081DDEBC
	ldr r2, _081DDEC0
	bl CpuSet
	ldr r0, _081DDEC4
	bl SoundInit_rev01
	ldr r0, _081DDEC8
	bl MPlayExtender
	ldr r0, _081DDECC
	bl SoundMode_rev01
	ldr r0, _081DDED0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	beq _081DDE86
	ldr r6, _081DDED4
	adds r5, r0, 0
_081DDE6A:
	ldr r4, [r6]
	ldr r1, [r6, 0x4]
	ldrb r2, [r6, 0x8]
	adds r0, r4, 0
	bl MPlayOpen_rev01
	ldrh r0, [r6, 0xA]
	strb r0, [r4, 0xB]
	ldr r0, _081DDED8
	str r0, [r4, 0x18]
	adds r6, 0xC
	subs r5, 0x1
	cmp r5, 0
	bne _081DDE6A
_081DDE86:
	ldr r0, _081DDEDC
	ldr r1, _081DDEE0
	movs r2, 0x34
	bl memcpy
	movs r5, 0
	movs r6, 0
_081DDE94:
	lsls r0, r5, 6
	ldr r1, _081DDEE4
	adds r0, r1
	ldr r4, _081DDEE8
	adds r4, r6, r4
	adds r1, r4, 0
	movs r2, 0x2
	bl MPlayOpen_rev01
	movs r0, 0
	str r0, [r4, 0x20]
	adds r6, 0xA0
	adds r5, 0x1
	cmp r5, 0x1
	ble _081DDE94
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081DDEB8: .4byte SoundMainRAM
_081DDEBC: .4byte 0x03000f60
_081DDEC0: .4byte 0x04000200
_081DDEC4: .4byte 0x03005fd0
_081DDEC8: .4byte 0x03007100
_081DDECC: .4byte 0x0094c500
_081DDED0: .4byte 0x00000004
_081DDED4: .4byte gUnknown_0845545C
_081DDED8: .4byte 0x03007440
_081DDEDC: .4byte 0x03007340
_081DDEE0: .4byte gUnknown_0842FC1C
_081DDEE4: .4byte 0x03006ff0
_081DDEE8: .4byte 0x03007200
	thumb_func_end m4aSoundInit

	thumb_func_start m4aSoundMain
m4aSoundMain: @ 81DDEEC
	push {lr}
	bl SoundMain
	pop {r0}
	bx r0
	thumb_func_end m4aSoundMain

	thumb_func_start m4aSongNumStart
m4aSongNumStart: @ 81DDEF8
	push {lr}
	lsls r0, 16
	ldr r2, _081DDF1C
	ldr r1, _081DDF20
	lsrs r0, 13
	adds r0, r1
	ldrh r3, [r0, 0x4]
	lsls r1, r3, 1
	adds r1, r3
	lsls r1, 2
	adds r1, r2
	ldr r2, [r1]
	ldr r1, [r0]
	adds r0, r2, 0
	bl MPlayStart_rev01
	pop {r0}
	bx r0
	.align 2, 0
_081DDF1C: .4byte gUnknown_0845545C
_081DDF20: .4byte gUnknown_0845548C
	thumb_func_end m4aSongNumStart

	thumb_func_start m4aSongNumStartOrChange
m4aSongNumStartOrChange: @ 81DDF24
	push {lr}
	lsls r0, 16
	ldr r2, _081DDF50
	ldr r1, _081DDF54
	lsrs r0, 13
	adds r0, r1
	ldrh r3, [r0, 0x4]
	lsls r1, r3, 1
	adds r1, r3
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	ldr r3, [r1]
	ldr r2, [r0]
	cmp r3, r2
	beq _081DDF58
	adds r0, r1, 0
	adds r1, r2, 0
	bl MPlayStart_rev01
	b _081DDF6C
	.align 2, 0
_081DDF50: .4byte gUnknown_0845545C
_081DDF54: .4byte gUnknown_0845548C
_081DDF58:
	ldr r2, [r1, 0x4]
	ldrh r0, [r1, 0x4]
	cmp r0, 0
	beq _081DDF64
	cmp r2, 0
	bge _081DDF6C
_081DDF64:
	adds r0, r1, 0
	adds r1, r3, 0
	bl MPlayStart_rev01
_081DDF6C:
	pop {r0}
	bx r0
	thumb_func_end m4aSongNumStartOrChange

	thumb_func_start m4aSongNumStartOrContinue
m4aSongNumStartOrContinue: @ 81DDF70
	push {lr}
	lsls r0, 16
	ldr r2, _081DDF9C
	ldr r1, _081DDFA0
	lsrs r0, 13
	adds r0, r1
	ldrh r3, [r0, 0x4]
	lsls r1, r3, 1
	adds r1, r3
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	ldr r3, [r1]
	ldr r2, [r0]
	cmp r3, r2
	beq _081DDFA4
	adds r0, r1, 0
	adds r1, r2, 0
	bl MPlayStart_rev01
	b _081DDFC0
	.align 2, 0
_081DDF9C: .4byte gUnknown_0845545C
_081DDFA0: .4byte gUnknown_0845548C
_081DDFA4:
	ldr r2, [r1, 0x4]
	ldrh r0, [r1, 0x4]
	cmp r0, 0
	bne _081DDFB6
	adds r0, r1, 0
	adds r1, r3, 0
	bl MPlayStart_rev01
	b _081DDFC0
_081DDFB6:
	cmp r2, 0
	bge _081DDFC0
	adds r0, r1, 0
	bl MPlayContinue
_081DDFC0:
	pop {r0}
	bx r0
	thumb_func_end m4aSongNumStartOrContinue

	thumb_func_start m4aSongNumStop
m4aSongNumStop: @ 81DDFC4
	push {lr}
	lsls r0, 16
	ldr r2, _081DDFF0
	ldr r1, _081DDFF4
	lsrs r0, 13
	adds r0, r1
	ldrh r3, [r0, 0x4]
	lsls r1, r3, 1
	adds r1, r3
	lsls r1, 2
	adds r1, r2
	ldr r2, [r1]
	ldr r1, [r2]
	ldr r0, [r0]
	cmp r1, r0
	bne _081DDFEA
	adds r0, r2, 0
	bl MPlayStop_rev01
_081DDFEA:
	pop {r0}
	bx r0
	.align 2, 0
_081DDFF0: .4byte gUnknown_0845545C
_081DDFF4: .4byte gUnknown_0845548C
	thumb_func_end m4aSongNumStop

	thumb_func_start m4aSongNumContinue
m4aSongNumContinue: @ 81DDFF8
	push {lr}
	lsls r0, 16
	ldr r2, _081DE024
	ldr r1, _081DE028
	lsrs r0, 13
	adds r0, r1
	ldrh r3, [r0, 0x4]
	lsls r1, r3, 1
	adds r1, r3
	lsls r1, 2
	adds r1, r2
	ldr r2, [r1]
	ldr r1, [r2]
	ldr r0, [r0]
	cmp r1, r0
	bne _081DE01E
	adds r0, r2, 0
	bl MPlayContinue
_081DE01E:
	pop {r0}
	bx r0
	.align 2, 0
_081DE024: .4byte gUnknown_0845545C
_081DE028: .4byte gUnknown_0845548C
	thumb_func_end m4aSongNumContinue

	thumb_func_start m4aMPlayAllStop
m4aMPlayAllStop: @ 81DE02C
	push {r4,r5,lr}
	ldr r0, _081DE064
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	beq _081DE04A
	ldr r5, _081DE068
	adds r4, r0, 0
_081DE03C:
	ldr r0, [r5]
	bl MPlayStop_rev01
	adds r5, 0xC
	subs r4, 0x1
	cmp r4, 0
	bne _081DE03C
_081DE04A:
	ldr r5, _081DE06C
	movs r4, 0x1
_081DE04E:
	adds r0, r5, 0
	bl MPlayStop_rev01
	adds r5, 0x40
	subs r4, 0x1
	cmp r4, 0
	bge _081DE04E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081DE064: .4byte 0x00000004
_081DE068: .4byte gUnknown_0845545C
_081DE06C: .4byte 0x03006ff0
	thumb_func_end m4aMPlayAllStop

	thumb_func_start m4aMPlayContinue
m4aMPlayContinue: @ 81DE070
	push {lr}
	bl MPlayContinue
	pop {r0}
	bx r0
	thumb_func_end m4aMPlayContinue

	thumb_func_start m4aMPlayAllContinue
m4aMPlayAllContinue: @ 81DE07A
	push {r4,r5,lr}
	ldr r0, _081DE0B4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	beq _081DE09A
	ldr r5, _081DE0B8
	adds r4, r0, 0
_081DE08C:
	ldr r0, [r5]
	bl MPlayContinue
	adds r5, 0xC
	subs r4, 0x1
	cmp r4, 0
	bne _081DE08C
_081DE09A:
	ldr r5, _081DE0BC
	movs r4, 0x1
_081DE09E:
	adds r0, r5, 0
	bl MPlayContinue
	adds r5, 0x40
	subs r4, 0x1
	cmp r4, 0
	bge _081DE09E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081DE0B4: .4byte 0x00000004
_081DE0B8: .4byte gUnknown_0845545C
_081DE0BC: .4byte 0x03006ff0
	thumb_func_end m4aMPlayAllContinue

	thumb_func_start m4aMPlayFadeOut
@ void m4aMPlayFadeOut(mplay_table_entry *a1, u16 a2)
m4aMPlayFadeOut: @ 81DE0C0
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	bl MPlayFadeOut
	pop {r0}
	bx r0
	thumb_func_end m4aMPlayFadeOut

	thumb_func_start sub_81DE0D0
sub_81DE0D0: @ 81DE0D0
	adds r2, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r3, [r2, 0x34]
	ldr r0, _081DE0E8
	cmp r3, r0
	bne _081DE0E6
	strh r1, [r2, 0x26]
	strh r1, [r2, 0x24]
	ldr r0, _081DE0EC
	strh r0, [r2, 0x28]
_081DE0E6:
	bx lr
	.align 2, 0
_081DE0E8: .4byte 0x68736d53
_081DE0EC: .4byte 0x00000101
	thumb_func_end sub_81DE0D0

	thumb_func_start sub_81DE0F0
sub_81DE0F0: @ 81DE0F0
	adds r2, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r3, [r2, 0x34]
	ldr r0, _081DE110
	cmp r3, r0
	bne _081DE10E
	strh r1, [r2, 0x26]
	strh r1, [r2, 0x24]
	movs r0, 0x2
	strh r0, [r2, 0x28]
	ldr r0, [r2, 0x4]
	ldr r1, _081DE114
	ands r0, r1
	str r0, [r2, 0x4]
_081DE10E:
	bx lr
	.align 2, 0
_081DE110: .4byte 0x68736d53
_081DE114: .4byte 0x7fffffff
	thumb_func_end sub_81DE0F0

	thumb_func_start m4aMPlayImmInit
m4aMPlayImmInit: @ 81DE118
	push {r4-r7,lr}
	ldrb r5, [r0, 0x8]
	ldr r4, [r0, 0x2C]
	cmp r5, 0
	ble _081DE15A
	movs r7, 0x80
_081DE124:
	ldrb r1, [r4]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _081DE152
	movs r6, 0x40
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	beq _081DE152
	adds r0, r4, 0
	bl Clear64byte_rev
	strb r7, [r4]
	movs r0, 0x2
	strb r0, [r4, 0xF]
	strb r6, [r4, 0x13]
	movs r0, 0x16
	strb r0, [r4, 0x19]
	adds r1, r4, 0
	adds r1, 0x24
	movs r0, 0x1
	strb r0, [r1]
_081DE152:
	subs r5, 0x1
	adds r4, 0x50
	cmp r5, 0
	bgt _081DE124
_081DE15A:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end m4aMPlayImmInit

	thumb_func_start MPlayExtender
@ int MPlayExtender(void *dest)
MPlayExtender: @ 81DE160
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r1, _081DE228
	movs r0, 0x8F
	strh r0, [r1]
	ldr r3, _081DE22C
	movs r2, 0
	strh r2, [r3]
	ldr r0, _081DE230
	movs r1, 0x8
	strb r1, [r0]
	adds r0, 0x6
	strb r1, [r0]
	adds r0, 0x10
	strb r1, [r0]
	subs r0, 0x14
	movs r1, 0x80
	strb r1, [r0]
	adds r0, 0x8
	strb r1, [r0]
	adds r0, 0x10
	strb r1, [r0]
	subs r0, 0xD
	strb r2, [r0]
	movs r0, 0x77
	strb r0, [r3]
	ldr r0, _081DE234
	ldr r4, [r0]
	ldr r6, [r4]
	ldr r0, _081DE238
	cmp r6, r0
	bne _081DE220
	adds r0, r6, 0x1
	str r0, [r4]
	ldr r1, _081DE23C
	ldr r0, _081DE240
	str r0, [r1, 0x20]
	ldr r0, _081DE244
	str r0, [r1, 0x44]
	ldr r0, _081DE248
	str r0, [r1, 0x4C]
	ldr r0, _081DE24C
	str r0, [r1, 0x70]
	ldr r0, _081DE250
	str r0, [r1, 0x74]
	ldr r0, _081DE254
	str r0, [r1, 0x78]
	ldr r0, _081DE258
	str r0, [r1, 0x7C]
	adds r2, r1, 0
	adds r2, 0x80
	ldr r0, _081DE25C
	str r0, [r2]
	adds r1, 0x84
	ldr r0, _081DE260
	str r0, [r1]
	str r5, [r4, 0x1C]
	ldr r0, _081DE264
	str r0, [r4, 0x28]
	ldr r0, _081DE268
	str r0, [r4, 0x2C]
	ldr r0, _081DE26C
	str r0, [r4, 0x30]
	ldr r0, _081DE270
	movs r1, 0
	strb r0, [r4, 0xC]
	str r1, [sp]
	ldr r2, _081DE274
	mov r0, sp
	adds r1, r5, 0
	bl CpuSet
	movs r0, 0x1
	strb r0, [r5, 0x1]
	movs r0, 0x11
	strb r0, [r5, 0x1C]
	adds r1, r5, 0
	adds r1, 0x41
	movs r0, 0x2
	strb r0, [r1]
	adds r1, 0x1B
	movs r0, 0x22
	strb r0, [r1]
	adds r1, 0x25
	movs r0, 0x3
	strb r0, [r1]
	adds r1, 0x1B
	movs r0, 0x44
	strb r0, [r1]
	adds r1, 0x24
	movs r0, 0x4
	strb r0, [r1, 0x1]
	movs r0, 0x88
	strb r0, [r1, 0x1C]
	str r6, [r4]
_081DE220:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081DE228: .4byte 0x04000084
_081DE22C: .4byte 0x04000080
_081DE230: .4byte 0x04000063
_081DE234: .4byte 0x03007ff0
_081DE238: .4byte 0x68736d53
_081DE23C: .4byte 0x03007070
_081DE240: .4byte ply_memacc
_081DE244: .4byte ply_lfos_rev01
_081DE248: .4byte ply_mod_rev01
_081DE24C: .4byte ply_xcmd
_081DE250: .4byte ply_endtie_rev01
_081DE254: .4byte SampFreqSet_rev01
_081DE258: .4byte TrackStop_rev01
_081DE25C: .4byte FadeOutBody_rev01
_081DE260: .4byte TrkVolPitSet_rev01
_081DE264: .4byte CgbSound
_081DE268: .4byte CgbOscOff
_081DE26C: .4byte MidiKey2CgbFr
_081DE270: .4byte 0x0000003c
_081DE274: .4byte 0x05000040
	thumb_func_end MPlayExtender

	thumb_func_start MusicPlayerJumpTableCopy
MusicPlayerJumpTableCopy: @ 81DE278
	swi 0x2A
	bx lr
	thumb_func_end MusicPlayerJumpTableCopy

	thumb_func_start ClearChain_rev
ClearChain_rev: @ 81DE27C
	push {lr}
	ldr r1, _081DE28C
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_081DE28C: .4byte 0x030070f8
	thumb_func_end ClearChain_rev

	thumb_func_start Clear64byte_rev
Clear64byte_rev: @ 81DE290
	push {lr}
	ldr r1, _081DE2A0
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_081DE2A0: .4byte 0x030070fc
	thumb_func_end Clear64byte_rev

	thumb_func_start SoundInit_rev01
@ int SoundInit_rev01(void *dest)
SoundInit_rev01: @ 81DE2A4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r3, 0
	str r3, [r5]
	ldr r1, _081DE35C
	ldr r0, [r1]
	movs r2, 0x80
	lsls r2, 18
	ands r0, r2
	cmp r0, 0
	beq _081DE2C0
	ldr r0, _081DE360
	str r0, [r1]
_081DE2C0:
	ldr r1, _081DE364
	ldr r0, [r1]
	ands r0, r2
	cmp r0, 0
	beq _081DE2CE
	ldr r0, _081DE360
	str r0, [r1]
_081DE2CE:
	ldr r0, _081DE368
	movs r2, 0x80
	lsls r2, 3
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0xC
	strh r1, [r0]
	ldr r1, _081DE36C
	movs r0, 0x8F
	strh r0, [r1]
	subs r1, 0x2
	ldr r2, _081DE370
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _081DE374
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _081DE378
	movs r2, 0xD4
	lsls r2, 2
	adds r0, r5, r2
	str r0, [r1]
	adds r1, 0x4
	ldr r0, _081DE37C
	str r0, [r1]
	adds r1, 0x8
	movs r2, 0x98
	lsls r2, 4
	adds r0, r5, r2
	str r0, [r1]
	adds r1, 0x4
	ldr r0, _081DE380
	str r0, [r1]
	ldr r0, _081DE384
	str r5, [r0]
	str r3, [sp]
	ldr r2, _081DE388
	mov r0, sp
	adds r1, r5, 0
	bl CpuSet
	movs r0, 0x8
	strb r0, [r5, 0x6]
	movs r0, 0xF
	strb r0, [r5, 0x7]
	ldr r0, _081DE38C
	str r0, [r5, 0x38]
	ldr r0, _081DE390
	str r0, [r5, 0x28]
	str r0, [r5, 0x2C]
	str r0, [r5, 0x30]
	str r0, [r5, 0x3C]
	ldr r4, _081DE394
	adds r0, r4, 0
	bl MPlyJmpTblCopy
	str r4, [r5, 0x34]
	movs r0, 0x80
	lsls r0, 11
	bl SampFreqSet_rev01
	ldr r0, _081DE398
	str r0, [r5]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081DE35C: .4byte 0x040000c4
_081DE360: .4byte 0x84400004
_081DE364: .4byte 0x040000d0
_081DE368: .4byte 0x040000c6
_081DE36C: .4byte 0x04000084
_081DE370: .4byte 0x0000a90e
_081DE374: .4byte 0x04000089
_081DE378: .4byte 0x040000bc
_081DE37C: .4byte 0x040000a0
_081DE380: .4byte 0x040000a4
_081DE384: .4byte 0x03007ff0
_081DE388: .4byte 0x050003ec
_081DE38C: .4byte ply_note_rev01
_081DE390: .4byte DummyFunc_rev
_081DE394: .4byte 0x03007070
_081DE398: .4byte 0x68736d53
	thumb_func_end SoundInit_rev01

	thumb_func_start SampFreqSet_rev01
SampFreqSet_rev01: @ 81DE39C
	push {r4-r6,lr}
	adds r2, r0, 0
	ldr r0, _081DE41C
	ldr r4, [r0]
	movs r0, 0xF0
	lsls r0, 12
	ands r0, r2
	lsrs r2, r0, 16
	movs r6, 0
	strb r2, [r4, 0x8]
	ldr r1, _081DE420
	subs r0, r2, 0x1
	lsls r0, 1
	adds r0, r1
	ldrh r5, [r0]
	str r5, [r4, 0x10]
	movs r0, 0xC6
	lsls r0, 3
	adds r1, r5, 0
	bl __divsi3
	strb r0, [r4, 0xB]
	ldr r0, _081DE424
	muls r0, r5
	ldr r1, _081DE428
	adds r0, r1
	ldr r1, _081DE42C
	bl __divsi3
	adds r1, r0, 0
	str r1, [r4, 0x14]
	movs r0, 0x80
	lsls r0, 17
	bl __divsi3
	adds r0, 0x1
	asrs r0, 1
	str r0, [r4, 0x18]
	ldr r0, _081DE430
	strh r6, [r0]
	ldr r4, _081DE434
	ldr r0, _081DE438
	adds r1, r5, 0
	bl __divsi3
	negs r0, r0
	strh r0, [r4]
	bl SoundVSyncOn_rev01
	ldr r1, _081DE43C
_081DE400:
	ldrb r0, [r1]
	cmp r0, 0x9F
	beq _081DE400
	ldr r1, _081DE43C
_081DE408:
	ldrb r0, [r1]
	cmp r0, 0x9F
	bne _081DE408
	ldr r1, _081DE430
	movs r0, 0x80
	strh r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081DE41C: .4byte 0x03007ff0
_081DE420: .4byte gUnknown_0842FAE8
_081DE424: .4byte 0x00091d1b
_081DE428: .4byte 0x00001388
_081DE42C: .4byte 0x00002710
_081DE430: .4byte 0x04000102
_081DE434: .4byte 0x04000100
_081DE438: .4byte 0x00044940
_081DE43C: .4byte 0x04000006
	thumb_func_end SampFreqSet_rev01

	thumb_func_start SoundMode_rev01
SoundMode_rev01: @ 81DE440
	push {r4,r5,lr}
	adds r3, r0, 0
	ldr r0, _081DE4CC
	ldr r5, [r0]
	ldr r1, [r5]
	ldr r0, _081DE4D0
	cmp r1, r0
	bne _081DE4C6
	adds r0, r1, 0x1
	str r0, [r5]
	movs r4, 0xFF
	ands r4, r3
	cmp r4, 0
	beq _081DE462
	movs r0, 0x7F
	ands r4, r0
	strb r4, [r5, 0x5]
_081DE462:
	movs r4, 0xF0
	lsls r4, 4
	ands r4, r3
	cmp r4, 0
	beq _081DE482
	lsrs r0, r4, 8
	strb r0, [r5, 0x6]
	movs r4, 0xC
	adds r0, r5, 0
	adds r0, 0x50
	movs r1, 0
_081DE478:
	strb r1, [r0]
	subs r4, 0x1
	adds r0, 0x40
	cmp r4, 0
	bne _081DE478
_081DE482:
	movs r4, 0xF0
	lsls r4, 8
	ands r4, r3
	cmp r4, 0
	beq _081DE490
	lsrs r0, r4, 12
	strb r0, [r5, 0x7]
_081DE490:
	movs r4, 0xB0
	lsls r4, 16
	ands r4, r3
	cmp r4, 0
	beq _081DE4AE
	movs r0, 0xC0
	lsls r0, 14
	ands r0, r4
	lsrs r4, r0, 14
	ldr r2, _081DE4D4
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	orrs r0, r4
	strb r0, [r2]
_081DE4AE:
	movs r4, 0xF0
	lsls r4, 12
	ands r4, r3
	cmp r4, 0
	beq _081DE4C2
	bl SoundVSyncOff_rev01
	adds r0, r4, 0
	bl SampFreqSet_rev01
_081DE4C2:
	ldr r0, _081DE4D0
	str r0, [r5]
_081DE4C6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081DE4CC: .4byte 0x03007ff0
_081DE4D0: .4byte 0x68736d53
_081DE4D4: .4byte 0x04000089
	thumb_func_end SoundMode_rev01

	thumb_func_start SoundClear_rev01
SoundClear_rev01: @ 81DE4D8
	push {r4-r7,lr}
	ldr r0, _081DE524
	ldr r6, [r0]
	ldr r1, [r6]
	ldr r0, _081DE528
	cmp r1, r0
	bne _081DE51E
	adds r0, r1, 0x1
	str r0, [r6]
	movs r5, 0xC
	adds r4, r6, 0
	adds r4, 0x50
	movs r0, 0
_081DE4F2:
	strb r0, [r4]
	subs r5, 0x1
	adds r4, 0x40
	cmp r5, 0
	bgt _081DE4F2
	ldr r4, [r6, 0x1C]
	cmp r4, 0
	beq _081DE51A
	movs r5, 0x1
	movs r7, 0
_081DE506:
	lsls r0, r5, 24
	lsrs r0, 24
	ldr r1, [r6, 0x2C]
	bl _call_via_r1
	strb r7, [r4]
	adds r5, 0x1
	adds r4, 0x40
	cmp r5, 0x4
	ble _081DE506
_081DE51A:
	ldr r0, _081DE528
	str r0, [r6]
_081DE51E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081DE524: .4byte 0x03007ff0
_081DE528: .4byte 0x68736d53
	thumb_func_end SoundClear_rev01

	thumb_func_start SoundVSyncOff_rev01
SoundVSyncOff_rev01: @ 81DE52C
	push {lr}
	sub sp, 0x4
	ldr r0, _081DE58C
	ldr r2, [r0]
	ldr r1, [r2]
	ldr r3, _081DE590
	adds r0, r1, r3
	cmp r0, 0x1
	bhi _081DE584
	adds r0, r1, 0
	adds r0, 0xA
	str r0, [r2]
	ldr r1, _081DE594
	ldr r0, [r1]
	movs r3, 0x80
	lsls r3, 18
	ands r0, r3
	cmp r0, 0
	beq _081DE556
	ldr r0, _081DE598
	str r0, [r1]
_081DE556:
	ldr r1, _081DE59C
	ldr r0, [r1]
	ands r0, r3
	cmp r0, 0
	beq _081DE564
	ldr r0, _081DE598
	str r0, [r1]
_081DE564:
	ldr r0, _081DE5A0
	movs r3, 0x80
	lsls r3, 3
	adds r1, r3, 0
	strh r1, [r0]
	adds r0, 0xC
	strh r1, [r0]
	movs r0, 0
	str r0, [sp]
	movs r0, 0xD4
	lsls r0, 2
	adds r1, r2, r0
	ldr r2, _081DE5A4
	mov r0, sp
	bl CpuSet
_081DE584:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_081DE58C: .4byte 0x03007ff0
_081DE590: .4byte 0x978c92ad
_081DE594: .4byte 0x040000c4
_081DE598: .4byte 0x84400004
_081DE59C: .4byte 0x040000d0
_081DE5A0: .4byte 0x040000c6
_081DE5A4: .4byte 0x05000318
	thumb_func_end SoundVSyncOff_rev01

	thumb_func_start SoundVSyncOn_rev01
SoundVSyncOn_rev01: @ 81DE5A8
	push {r4,lr}
	ldr r0, _081DE5D8
	ldr r2, [r0]
	ldr r3, [r2]
	ldr r0, _081DE5DC
	cmp r3, r0
	beq _081DE5D0
	ldr r0, _081DE5E0
	movs r4, 0xB6
	lsls r4, 8
	adds r1, r4, 0
	strh r1, [r0]
	adds r0, 0xC
	strh r1, [r0]
	ldrb r0, [r2, 0x4]
	movs r0, 0
	strb r0, [r2, 0x4]
	adds r0, r3, 0
	subs r0, 0xA
	str r0, [r2]
_081DE5D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081DE5D8: .4byte 0x03007ff0
_081DE5DC: .4byte 0x68736d53
_081DE5E0: .4byte 0x040000c6
	thumb_func_end SoundVSyncOn_rev01

	thumb_func_start MPlayOpen_rev01
MPlayOpen_rev01: @ 81DE5E4
	push {r4-r7,lr}
	adds r7, r0, 0
	adds r6, r1, 0
	lsls r2, 24
	lsrs r4, r2, 24
	cmp r4, 0
	beq _081DE648
	cmp r4, 0x10
	bls _081DE5F8
	movs r4, 0x10
_081DE5F8:
	ldr r0, _081DE650
	ldr r5, [r0]
	ldr r1, [r5]
	ldr r0, _081DE654
	cmp r1, r0
	bne _081DE648
	adds r0, r1, 0x1
	str r0, [r5]
	adds r0, r7, 0
	bl Clear64byte_rev
	str r6, [r7, 0x2C]
	strb r4, [r7, 0x8]
	movs r0, 0x80
	lsls r0, 24
	str r0, [r7, 0x4]
	cmp r4, 0
	beq _081DE62C
	movs r1, 0
_081DE61E:
	strb r1, [r6]
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, 0x50
	cmp r4, 0
	bne _081DE61E
_081DE62C:
	ldr r0, [r5, 0x20]
	cmp r0, 0
	beq _081DE63C
	str r0, [r7, 0x38]
	ldr r0, [r5, 0x24]
	str r0, [r7, 0x3C]
	movs r0, 0
	str r0, [r5, 0x20]
_081DE63C:
	str r7, [r5, 0x24]
	ldr r0, _081DE658
	str r0, [r5, 0x20]
	ldr r0, _081DE654
	str r0, [r5]
	str r0, [r7, 0x34]
_081DE648:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081DE650: .4byte 0x03007ff0
_081DE654: .4byte 0x68736d53
_081DE658: .4byte MPlayMain_rev01
	thumb_func_end MPlayOpen_rev01

	thumb_func_start MPlayStart_rev01
MPlayStart_rev01: @ 81DE65C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	adds r7, r1, 0
	ldr r1, [r5, 0x34]
	ldr r0, _081DE73C
	cmp r1, r0
	bne _081DE732
	ldrb r0, [r5, 0xB]
	ldrb r2, [r7, 0x2]
	cmp r0, 0
	beq _081DE69E
	ldr r0, [r5]
	cmp r0, 0
	beq _081DE688
	ldr r1, [r5, 0x2C]
	movs r0, 0x40
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, 0
	bne _081DE694
_081DE688:
	ldr r1, [r5, 0x4]
	ldrh r0, [r5, 0x4]
	cmp r0, 0
	beq _081DE69E
	cmp r1, 0
	blt _081DE69E
_081DE694:
	ldrb r0, [r7, 0x2]
	adds r2, r0, 0
	ldrb r0, [r5, 0x9]
	cmp r0, r2
	bhi _081DE732
_081DE69E:
	ldr r0, [r5, 0x34]
	adds r0, 0x1
	str r0, [r5, 0x34]
	movs r1, 0
	str r1, [r5, 0x4]
	str r7, [r5]
	ldr r0, [r7, 0x4]
	str r0, [r5, 0x30]
	strb r2, [r5, 0x9]
	str r1, [r5, 0xC]
	movs r0, 0x96
	strh r0, [r5, 0x1C]
	strh r0, [r5, 0x20]
	adds r0, 0x6A
	strh r0, [r5, 0x1E]
	strh r1, [r5, 0x22]
	strh r1, [r5, 0x24]
	movs r6, 0
	ldr r4, [r5, 0x2C]
	ldrb r1, [r7]
	cmp r6, r1
	bge _081DE6FE
	ldrb r0, [r5, 0x8]
	cmp r6, r0
	bge _081DE71E
	mov r8, r6
_081DE6D2:
	adds r0, r5, 0
	adds r1, r4, 0
	bl TrackStop_rev01
	movs r0, 0xC0
	strb r0, [r4]
	mov r1, r8
	str r1, [r4, 0x20]
	lsls r1, r6, 2
	adds r0, r7, 0
	adds r0, 0x8
	adds r0, r1
	ldr r0, [r0]
	str r0, [r4, 0x40]
	adds r6, 0x1
	adds r4, 0x50
	ldrb r0, [r7]
	cmp r6, r0
	bge _081DE6FE
	ldrb r1, [r5, 0x8]
	cmp r6, r1
	blt _081DE6D2
_081DE6FE:
	ldrb r0, [r5, 0x8]
	cmp r6, r0
	bge _081DE71E
	movs r1, 0
	mov r8, r1
_081DE708:
	adds r0, r5, 0
	adds r1, r4, 0
	bl TrackStop_rev01
	mov r0, r8
	strb r0, [r4]
	adds r6, 0x1
	adds r4, 0x50
	ldrb r1, [r5, 0x8]
	cmp r6, r1
	blt _081DE708
_081DE71E:
	movs r0, 0x80
	ldrb r1, [r7, 0x3]
	ands r0, r1
	cmp r0, 0
	beq _081DE72E
	ldrb r0, [r7, 0x3]
	bl SoundMode_rev01
_081DE72E:
	ldr r0, _081DE73C
	str r0, [r5, 0x34]
_081DE732:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081DE73C: .4byte 0x68736d53
	thumb_func_end MPlayStart_rev01

	thumb_func_start MPlayStop_rev01
MPlayStop_rev01: @ 81DE740
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r1, [r6, 0x34]
	ldr r0, _081DE77C
	cmp r1, r0
	bne _081DE776
	adds r0, r1, 0x1
	str r0, [r6, 0x34]
	ldr r0, [r6, 0x4]
	movs r1, 0x80
	lsls r1, 24
	orrs r0, r1
	str r0, [r6, 0x4]
	ldrb r4, [r6, 0x8]
	ldr r5, [r6, 0x2C]
	cmp r4, 0
	ble _081DE772
_081DE762:
	adds r0, r6, 0
	adds r1, r5, 0
	bl TrackStop_rev01
	subs r4, 0x1
	adds r5, 0x50
	cmp r4, 0
	bgt _081DE762
_081DE772:
	ldr r0, _081DE77C
	str r0, [r6, 0x34]
_081DE776:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081DE77C: .4byte 0x68736d53
	thumb_func_end MPlayStop_rev01

	thumb_func_start FadeOutBody_rev01
FadeOutBody_rev01: @ 81DE780
	push {r4-r7,lr}
	adds r6, r0, 0
	ldrh r1, [r6, 0x24]
	cmp r1, 0
	beq _081DE842
	ldrh r0, [r6, 0x26]
	subs r0, 0x1
	strh r0, [r6, 0x26]
	ldr r3, _081DE7C0
	adds r2, r3, 0
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	bne _081DE842
	strh r1, [r6, 0x26]
	ldrh r1, [r6, 0x28]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081DE7C4
	adds r0, r1, 0
	adds r0, 0x10
	strh r0, [r6, 0x28]
	ands r0, r2
	cmp r0, 0xFF
	bls _081DE816
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r6, 0x28]
	strh r3, [r6, 0x24]
	b _081DE816
	.align 2, 0
_081DE7C0: .4byte 0x0000ffff
_081DE7C4:
	adds r0, r1, 0
	subs r0, 0x10
	strh r0, [r6, 0x28]
	ands r0, r2
	lsls r0, 16
	cmp r0, 0
	bgt _081DE816
	ldrb r5, [r6, 0x8]
	ldr r4, [r6, 0x2C]
	cmp r5, 0
	ble _081DE7F6
_081DE7DA:
	adds r0, r6, 0
	adds r1, r4, 0
	bl TrackStop_rev01
	movs r0, 0x1
	ldrh r7, [r6, 0x28]
	ands r0, r7
	cmp r0, 0
	bne _081DE7EE
	strb r0, [r4]
_081DE7EE:
	subs r5, 0x1
	adds r4, 0x50
	cmp r5, 0
	bgt _081DE7DA
_081DE7F6:
	movs r0, 0x1
	ldrh r1, [r6, 0x28]
	ands r0, r1
	cmp r0, 0
	beq _081DE80A
	ldr r0, [r6, 0x4]
	movs r1, 0x80
	lsls r1, 24
	orrs r0, r1
	b _081DE80E
_081DE80A:
	movs r0, 0x80
	lsls r0, 24
_081DE80E:
	str r0, [r6, 0x4]
	movs r0, 0
	strh r0, [r6, 0x24]
	b _081DE842
_081DE816:
	ldrb r5, [r6, 0x8]
	ldr r4, [r6, 0x2C]
	cmp r5, 0
	ble _081DE842
	movs r3, 0x80
	movs r7, 0
	movs r2, 0x3
_081DE824:
	ldrb r1, [r4]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _081DE83A
	ldrh r7, [r6, 0x28]
	lsrs r0, r7, 2
	strb r0, [r4, 0x13]
	adds r0, r1, 0
	orrs r0, r2
	strb r0, [r4]
_081DE83A:
	subs r5, 0x1
	adds r4, 0x50
	cmp r5, 0
	bgt _081DE824
_081DE842:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end FadeOutBody_rev01

	thumb_func_start TrkVolPitSet_rev01
TrkVolPitSet_rev01: @ 81DE848
	push {r4,lr}
	adds r2, r1, 0
	movs r0, 0x1
	ldrb r1, [r2]
	ands r0, r1
	cmp r0, 0
	beq _081DE8AC
	ldrb r3, [r2, 0x13]
	ldrb r1, [r2, 0x12]
	adds r0, r3, 0
	muls r0, r1
	lsrs r3, r0, 5
	ldrb r4, [r2, 0x18]
	cmp r4, 0x1
	bne _081DE870
	movs r0, 0x16
	ldrsb r0, [r2, r0]
	adds r0, 0x80
	muls r0, r3
	lsrs r3, r0, 7
_081DE870:
	movs r0, 0x14
	ldrsb r0, [r2, r0]
	lsls r0, 1
	movs r1, 0x15
	ldrsb r1, [r2, r1]
	adds r1, r0, r1
	cmp r4, 0x2
	bne _081DE886
	movs r0, 0x16
	ldrsb r0, [r2, r0]
	adds r1, r0
_081DE886:
	movs r0, 0x80
	negs r0, r0
	cmp r1, r0
	bge _081DE892
	adds r1, r0, 0
	b _081DE898
_081DE892:
	cmp r1, 0x7F
	ble _081DE898
	movs r1, 0x7F
_081DE898:
	adds r0, r1, 0
	adds r0, 0x80
	muls r0, r3
	lsrs r0, 8
	strb r0, [r2, 0x10]
	movs r0, 0x7F
	subs r0, r1
	muls r0, r3
	lsrs r0, 8
	strb r0, [r2, 0x11]
_081DE8AC:
	ldrb r1, [r2]
	movs r0, 0x4
	ands r0, r1
	adds r3, r1, 0
	cmp r0, 0
	beq _081DE8F0
	movs r0, 0xE
	ldrsb r0, [r2, r0]
	ldrb r1, [r2, 0xF]
	muls r0, r1
	movs r1, 0xC
	ldrsb r1, [r2, r1]
	adds r1, r0
	lsls r1, 2
	movs r0, 0xA
	ldrsb r0, [r2, r0]
	lsls r0, 8
	adds r1, r0
	movs r0, 0xB
	ldrsb r0, [r2, r0]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0xD]
	adds r1, r0, r1
	ldrb r0, [r2, 0x18]
	cmp r0, 0
	bne _081DE8EA
	movs r0, 0x16
	ldrsb r0, [r2, r0]
	lsls r0, 4
	adds r1, r0
_081DE8EA:
	asrs r0, r1, 8
	strb r0, [r2, 0x8]
	strb r1, [r2, 0x9]
_081DE8F0:
	movs r0, 0xFA
	ands r0, r3
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end TrkVolPitSet_rev01

	thumb_func_start MidiKey2CgbFr
MidiKey2CgbFr: @ 81DE8FC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r12, r2
	cmp r0, 0x4
	bne _081DE934
	cmp r5, 0x14
	bhi _081DE918
	movs r5, 0
	b _081DE926
_081DE918:
	adds r0, r5, 0
	subs r0, 0x15
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3B
	bls _081DE926
	movs r5, 0x3B
_081DE926:
	ldr r0, _081DE930
	adds r0, r5, r0
	ldrb r0, [r0]
	b _081DE996
	.align 2, 0
_081DE930: .4byte gUnknown_0842FB9C
_081DE934:
	cmp r5, 0x23
	bhi _081DE940
	movs r0, 0
	mov r12, r0
	movs r5, 0
	b _081DE952
_081DE940:
	adds r0, r5, 0
	subs r0, 0x24
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x82
	bls _081DE952
	movs r5, 0x82
	movs r1, 0xFF
	mov r12, r1
_081DE952:
	ldr r3, _081DE99C
	adds r0, r5, r3
	ldrb r6, [r0]
	ldr r4, _081DE9A0
	movs r2, 0xF
	adds r0, r6, 0
	ands r0, r2
	lsls r0, 1
	adds r0, r4
	movs r7, 0
	ldrsh r1, [r0, r7]
	asrs r0, r6, 4
	adds r6, r1, 0
	asrs r6, r0
	adds r0, r5, 0x1
	adds r0, r3
	ldrb r1, [r0]
	adds r0, r1, 0
	ands r0, r2
	lsls r0, 1
	adds r0, r4
	movs r2, 0
	ldrsh r0, [r0, r2]
	asrs r1, 4
	asrs r0, r1
	subs r0, r6
	mov r7, r12
	muls r7, r0
	adds r0, r7, 0
	asrs r0, 8
	adds r0, r6, r0
	movs r1, 0x80
	lsls r1, 4
	adds r0, r1
_081DE996:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081DE99C: .4byte gUnknown_0842FB00
_081DE9A0: .4byte gUnknown_0842FB84
	thumb_func_end MidiKey2CgbFr

	thumb_func_start CgbOscOff
CgbOscOff: @ 81DE9A4
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x2
	beq _081DE9CC
	cmp r0, 0x2
	bgt _081DE9B8
	cmp r0, 0x1
	beq _081DE9BE
	b _081DE9E0
_081DE9B8:
	cmp r1, 0x3
	beq _081DE9D4
	b _081DE9E0
_081DE9BE:
	ldr r1, _081DE9C8
	movs r0, 0x8
	strb r0, [r1]
	adds r1, 0x2
	b _081DE9E8
	.align 2, 0
_081DE9C8: .4byte 0x04000063
_081DE9CC:
	ldr r1, _081DE9D0
	b _081DE9E2
	.align 2, 0
_081DE9D0: .4byte 0x04000069
_081DE9D4:
	ldr r1, _081DE9DC
	movs r0, 0
	b _081DE9EA
	.align 2, 0
_081DE9DC: .4byte 0x04000070
_081DE9E0:
	ldr r1, _081DE9F0
_081DE9E2:
	movs r0, 0x8
	strb r0, [r1]
	adds r1, 0x4
_081DE9E8:
	movs r0, 0x80
_081DE9EA:
	strb r0, [r1]
	bx lr
	.align 2, 0
_081DE9F0: .4byte 0x04000079
	thumb_func_end CgbOscOff

	thumb_func_start CgbModVol
CgbModVol: @ 81DE9F4
	push {r4,lr}
	adds r2, r0, 0
	ldr r0, _081DEA24
	ldr r1, [r0]
	movs r0, 0x1
	ldrb r1, [r1, 0x9]
	ands r0, r1
	cmp r0, 0
	bne _081DEA34
	ldrb r0, [r2, 0x2]
	lsls r1, r0, 24
	lsrs r4, r1, 24
	ldrb r3, [r2, 0x3]
	lsls r0, r3, 24
	lsrs r3, r0, 24
	cmp r4, r3
	bcc _081DEA28
	lsrs r0, r1, 25
	cmp r0, r3
	bcc _081DEA34
	movs r0, 0xF
	strb r0, [r2, 0x1B]
	b _081DEA42
	.align 2, 0
_081DEA24: .4byte 0x03007ff0
_081DEA28:
	lsrs r0, 25
	cmp r0, r4
	bcc _081DEA34
	movs r0, 0xF0
	strb r0, [r2, 0x1B]
	b _081DEA42
_081DEA34:
	movs r0, 0xFF
	strb r0, [r2, 0x1B]
	ldrb r1, [r2, 0x3]
	ldrb r3, [r2, 0x2]
	adds r0, r1, r3
	lsrs r0, 4
	b _081DEA52
_081DEA42:
	ldrb r1, [r2, 0x3]
	ldrb r3, [r2, 0x2]
	adds r0, r1, r3
	lsrs r0, 4
	strb r0, [r2, 0xA]
	cmp r0, 0xF
	bls _081DEA54
	movs r0, 0xF
_081DEA52:
	strb r0, [r2, 0xA]
_081DEA54:
	ldrb r1, [r2, 0x6]
	ldrb r3, [r2, 0xA]
	adds r0, r1, 0
	muls r0, r3
	adds r0, 0xF
	asrs r0, 4
	strb r0, [r2, 0x19]
	ldrb r0, [r2, 0x1C]
	ldrb r1, [r2, 0x1B]
	ands r0, r1
	strb r0, [r2, 0x1B]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end CgbModVol

	thumb_func_start CgbSound
CgbSound: @ 81DEA70
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	ldr r0, _081DEA90
	ldr r0, [r0]
	str r0, [sp, 0x4]
	ldrb r0, [r0, 0xA]
	cmp r0, 0
	beq _081DEA94
	subs r0, 0x1
	ldr r1, [sp, 0x4]
	strb r0, [r1, 0xA]
	b _081DEA9A
	.align 2, 0
_081DEA90: .4byte 0x03007ff0
_081DEA94:
	movs r0, 0xE
	ldr r2, [sp, 0x4]
	strb r0, [r2, 0xA]
_081DEA9A:
	movs r6, 0x1
	ldr r0, [sp, 0x4]
	ldr r4, [r0, 0x1C]
_081DEAA0:
	ldrb r1, [r4]
	movs r0, 0xC7
	ands r0, r1
	adds r2, r6, 0x1
	mov r10, r2
	movs r2, 0x40
	adds r2, r4
	mov r9, r2
	cmp r0, 0
	bne _081DEAB6
	b _081DEEA0
_081DEAB6:
	cmp r6, 0x2
	beq _081DEAE8
	cmp r6, 0x2
	bgt _081DEAC4
	cmp r6, 0x1
	beq _081DEACA
	b _081DEB20
_081DEAC4:
	cmp r6, 0x3
	beq _081DEB00
	b _081DEB20
_081DEACA:
	ldr r0, _081DEADC
	str r0, [sp, 0x8]
	ldr r7, _081DEAE0
	ldr r2, _081DEAE4
	str r2, [sp, 0xC]
	adds r0, 0x4
	str r0, [sp, 0x10]
	adds r2, 0x2
	b _081DEB30
	.align 2, 0
_081DEADC: .4byte 0x04000060
_081DEAE0: .4byte 0x04000062
_081DEAE4: .4byte 0x04000063
_081DEAE8:
	ldr r0, _081DEAF4
	str r0, [sp, 0x8]
	ldr r7, _081DEAF8
	ldr r2, _081DEAFC
	b _081DEB28
	.align 2, 0
_081DEAF4: .4byte 0x04000061
_081DEAF8: .4byte 0x04000068
_081DEAFC: .4byte 0x04000069
_081DEB00:
	ldr r0, _081DEB14
	str r0, [sp, 0x8]
	ldr r7, _081DEB18
	ldr r2, _081DEB1C
	str r2, [sp, 0xC]
	adds r0, 0x4
	str r0, [sp, 0x10]
	adds r2, 0x2
	b _081DEB30
	.align 2, 0
_081DEB14: .4byte 0x04000070
_081DEB18: .4byte 0x04000072
_081DEB1C: .4byte 0x04000073
_081DEB20:
	ldr r0, _081DEB80
	str r0, [sp, 0x8]
	ldr r7, _081DEB84
	ldr r2, _081DEB88
_081DEB28:
	str r2, [sp, 0xC]
	adds r0, 0xB
	str r0, [sp, 0x10]
	adds r2, 0x4
_081DEB30:
	str r2, [sp, 0x14]
	ldr r0, [sp, 0x4]
	ldrb r0, [r0, 0xA]
	str r0, [sp]
	ldr r2, [sp, 0xC]
	ldrb r0, [r2]
	mov r8, r0
	adds r2, r1, 0
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _081DEC26
	movs r3, 0x40
	adds r0, r3, 0
	ands r0, r2
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r6, 0x1
	mov r10, r0
	movs r1, 0x40
	adds r1, r4
	mov r9, r1
	cmp r5, 0
	bne _081DEC4A
	movs r0, 0x3
	strb r0, [r4]
	strb r0, [r4, 0x1D]
	adds r0, r4, 0
	str r3, [sp, 0x18]
	bl CgbModVol
	ldr r3, [sp, 0x18]
	cmp r6, 0x2
	beq _081DEB98
	cmp r6, 0x2
	bgt _081DEB8C
	cmp r6, 0x1
	beq _081DEB92
	b _081DEBEC
	.align 2, 0
_081DEB80: .4byte 0x04000071
_081DEB84: .4byte 0x04000078
_081DEB88: .4byte 0x04000079
_081DEB8C:
	cmp r6, 0x3
	beq _081DEBA4
	b _081DEBEC
_081DEB92:
	ldrb r0, [r4, 0x1F]
	ldr r2, [sp, 0x8]
	strb r0, [r2]
_081DEB98:
	ldr r0, [r4, 0x24]
	lsls r0, 6
	ldrb r1, [r4, 0x1E]
	adds r0, r1, r0
	strb r0, [r7]
	b _081DEBF8
_081DEBA4:
	ldr r1, [r4, 0x24]
	ldr r0, [r4, 0x28]
	cmp r1, r0
	beq _081DEBCC
	ldr r2, [sp, 0x8]
	strb r3, [r2]
	ldr r1, _081DEBE0
	ldr r2, [r4, 0x24]
	ldr r0, [r2]
	str r0, [r1]
	adds r1, 0x4
	ldr r0, [r2, 0x4]
	str r0, [r1]
	adds r1, 0x4
	ldr r0, [r2, 0x8]
	str r0, [r1]
	adds r1, 0x4
	ldr r0, [r2, 0xC]
	str r0, [r1]
	str r2, [r4, 0x28]
_081DEBCC:
	ldr r0, [sp, 0x8]
	strb r5, [r0]
	ldrb r0, [r4, 0x1E]
	strb r0, [r7]
	ldrb r0, [r4, 0x1E]
	cmp r0, 0
	beq _081DEBE4
	movs r0, 0xC0
	b _081DEC06
	.align 2, 0
_081DEBE0: .4byte 0x04000090
_081DEBE4:
	movs r1, 0x80
	negs r1, r1
	strb r1, [r4, 0x1A]
	b _081DEC08
_081DEBEC:
	ldrb r0, [r4, 0x1E]
	strb r0, [r7]
	ldr r0, [r4, 0x24]
	lsls r0, 3
	ldr r2, [sp, 0x10]
	strb r0, [r2]
_081DEBF8:
	ldrb r0, [r4, 0x4]
	adds r0, 0x8
	mov r8, r0
	ldrb r0, [r4, 0x1E]
	cmp r0, 0
	beq _081DEC06
	movs r0, 0x40
_081DEC06:
	strb r0, [r4, 0x1A]
_081DEC08:
	ldrb r1, [r4, 0x4]
	movs r2, 0
	strb r1, [r4, 0xB]
	movs r0, 0xFF
	ands r0, r1
	adds r1, r6, 0x1
	mov r10, r1
	movs r1, 0x40
	adds r1, r4
	mov r9, r1
	cmp r0, 0
	bne _081DEC22
	b _081DED5E
_081DEC22:
	strb r2, [r4, 0x9]
	b _081DED8C
_081DEC26:
	movs r0, 0x4
	ands r0, r2
	cmp r0, 0
	beq _081DEC58
	ldrb r0, [r4, 0xD]
	subs r0, 0x1
	strb r0, [r4, 0xD]
	movs r2, 0xFF
	ands r0, r2
	lsls r0, 24
	adds r1, r6, 0x1
	mov r10, r1
	movs r2, 0x40
	adds r2, r4
	mov r9, r2
	cmp r0, 0
	ble _081DEC4A
	b _081DED9E
_081DEC4A:
	lsls r0, r6, 24
	lsrs r0, 24
	bl CgbOscOff
	movs r0, 0
	strb r0, [r4]
	b _081DEE9C
_081DEC58:
	movs r0, 0x40
	ands r0, r1
	adds r2, r6, 0x1
	mov r10, r2
	movs r2, 0x40
	adds r2, r4
	mov r9, r2
	cmp r0, 0
	beq _081DEC98
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _081DEC98
	movs r0, 0xFC
	ands r0, r1
	movs r2, 0
	strb r0, [r4]
	ldrb r1, [r4, 0x7]
	strb r1, [r4, 0xB]
	movs r0, 0xFF
	ands r0, r1
	cmp r0, 0
	beq _081DECCA
	movs r0, 0x1
	ldrb r1, [r4, 0x1D]
	orrs r0, r1
	strb r0, [r4, 0x1D]
	cmp r6, 0x3
	beq _081DED8C
	ldrb r2, [r4, 0x7]
	mov r8, r2
	b _081DED8C
_081DEC98:
	ldrb r0, [r4, 0xB]
	cmp r0, 0
	bne _081DED8C
	cmp r6, 0x3
	bne _081DECAA
	movs r0, 0x1
	ldrb r1, [r4, 0x1D]
	orrs r0, r1
	strb r0, [r4, 0x1D]
_081DECAA:
	adds r0, r4, 0
	bl CgbModVol
	movs r0, 0x3
	ldrb r2, [r4]
	ands r0, r2
	cmp r0, 0
	bne _081DECFE
	ldrb r0, [r4, 0x9]
	subs r0, 0x1
	strb r0, [r4, 0x9]
	movs r1, 0xFF
	ands r0, r1
	lsls r0, 24
	cmp r0, 0
	bgt _081DECFA
_081DECCA:
	ldrb r2, [r4, 0xC]
	ldrb r1, [r4, 0xA]
	adds r0, r2, 0
	muls r0, r1
	adds r0, 0xFF
	asrs r0, 8
	movs r1, 0
	strb r0, [r4, 0x9]
	lsls r0, 24
	cmp r0, 0
	beq _081DEC4A
	movs r0, 0x4
	ldrb r2, [r4]
	orrs r0, r2
	strb r0, [r4]
	movs r0, 0x1
	ldrb r1, [r4, 0x1D]
	orrs r0, r1
	strb r0, [r4, 0x1D]
	cmp r6, 0x3
	beq _081DED9E
	movs r2, 0x8
	mov r8, r2
	b _081DED9E
_081DECFA:
	ldrb r0, [r4, 0x7]
	b _081DED8A
_081DECFE:
	cmp r0, 0x1
	bne _081DED0A
_081DED02:
	ldrb r0, [r4, 0x19]
	strb r0, [r4, 0x9]
	movs r0, 0x7
	b _081DED8A
_081DED0A:
	cmp r0, 0x2
	bne _081DED4E
	ldrb r0, [r4, 0x9]
	subs r0, 0x1
	strb r0, [r4, 0x9]
	movs r1, 0xFF
	ands r0, r1
	lsls r0, 24
	ldrb r2, [r4, 0x19]
	lsls r1, r2, 24
	cmp r0, r1
	bgt _081DED4A
_081DED22:
	ldrb r0, [r4, 0x6]
	cmp r0, 0
	bne _081DED32
	movs r0, 0xFC
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	b _081DECCA
_081DED32:
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	movs r0, 0x1
	ldrb r2, [r4, 0x1D]
	orrs r0, r2
	strb r0, [r4, 0x1D]
	cmp r6, 0x3
	beq _081DED02
	movs r0, 0x8
	mov r8, r0
	b _081DED02
_081DED4A:
	ldrb r0, [r4, 0x5]
	b _081DED8A
_081DED4E:
	ldrb r0, [r4, 0x9]
	adds r0, 0x1
	strb r0, [r4, 0x9]
	movs r1, 0xFF
	ands r0, r1
	ldrb r2, [r4, 0xA]
	cmp r0, r2
	bcc _081DED88
_081DED5E:
	ldrb r0, [r4]
	subs r0, 0x1
	movs r2, 0
	strb r0, [r4]
	ldrb r1, [r4, 0x5]
	strb r1, [r4, 0xB]
	movs r0, 0xFF
	ands r0, r1
	cmp r0, 0
	beq _081DED22
	movs r0, 0x1
	ldrb r1, [r4, 0x1D]
	orrs r0, r1
	strb r0, [r4, 0x1D]
	ldrb r0, [r4, 0xA]
	strb r0, [r4, 0x9]
	cmp r6, 0x3
	beq _081DED8C
	ldrb r2, [r4, 0x5]
	mov r8, r2
	b _081DED8C
_081DED88:
	ldrb r0, [r4, 0x4]
_081DED8A:
	strb r0, [r4, 0xB]
_081DED8C:
	ldrb r0, [r4, 0xB]
	subs r0, 0x1
	strb r0, [r4, 0xB]
	ldr r0, [sp]
	cmp r0, 0
	bne _081DED9E
	subs r0, 0x1
	str r0, [sp]
	b _081DEC98
_081DED9E:
	movs r0, 0x2
	ldrb r1, [r4, 0x1D]
	ands r0, r1
	cmp r0, 0
	beq _081DEE16
	cmp r6, 0x3
	bgt _081DEDDE
	movs r0, 0x8
	ldrb r2, [r4, 0x1]
	ands r0, r2
	cmp r0, 0
	beq _081DEDDE
	ldr r0, _081DEDC8
	ldrb r0, [r0]
	cmp r0, 0x3F
	bgt _081DEDD0
	ldr r0, [r4, 0x20]
	adds r0, 0x2
	ldr r1, _081DEDCC
	b _081DEDDA
	.align 2, 0
_081DEDC8: .4byte 0x04000089
_081DEDCC: .4byte 0x000007fc
_081DEDD0:
	cmp r0, 0x7F
	bgt _081DEDDE
	ldr r0, [r4, 0x20]
	adds r0, 0x1
	ldr r1, _081DEDEC
_081DEDDA:
	ands r0, r1
	str r0, [r4, 0x20]
_081DEDDE:
	cmp r6, 0x4
	beq _081DEDF0
	ldr r0, [r4, 0x20]
	ldr r1, [sp, 0x10]
	strb r0, [r1]
	b _081DEDFE
	.align 2, 0
_081DEDEC: .4byte 0x000007fe
_081DEDF0:
	ldr r2, [sp, 0x10]
	ldrb r0, [r2]
	movs r1, 0x8
	ands r1, r0
	ldr r0, [r4, 0x20]
	orrs r0, r1
	strb r0, [r2]
_081DEDFE:
	movs r0, 0xC0
	ldrb r1, [r4, 0x1A]
	ands r0, r1
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r0, r1, r0
	strb r0, [r4, 0x1A]
	movs r2, 0xFF
	ands r0, r2
	ldr r1, [sp, 0x14]
	strb r0, [r1]
_081DEE16:
	movs r0, 0x1
	ldrb r2, [r4, 0x1D]
	ands r0, r2
	cmp r0, 0
	beq _081DEE9C
	ldr r1, _081DEE60
	ldrb r0, [r1]
	ldrb r2, [r4, 0x1C]
	bics r0, r2
	ldrb r2, [r4, 0x1B]
	orrs r0, r2
	strb r0, [r1]
	cmp r6, 0x3
	bne _081DEE68
	ldr r0, _081DEE64
	ldrb r1, [r4, 0x9]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, [sp, 0xC]
	strb r0, [r2]
	movs r1, 0x80
	adds r0, r1, 0
	ldrb r2, [r4, 0x1A]
	ands r0, r2
	cmp r0, 0
	beq _081DEE9C
	ldr r0, [sp, 0x8]
	strb r1, [r0]
	ldrb r0, [r4, 0x1A]
	ldr r1, [sp, 0x14]
	strb r0, [r1]
	movs r0, 0x7F
	ldrb r2, [r4, 0x1A]
	ands r0, r2
	strb r0, [r4, 0x1A]
	b _081DEE9C
	.align 2, 0
_081DEE60: .4byte 0x04000081
_081DEE64: .4byte gUnknown_0842FBD8
_081DEE68:
	movs r0, 0xF
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldrb r2, [r4, 0x9]
	lsls r0, r2, 4
	add r0, r8
	ldr r1, [sp, 0xC]
	strb r0, [r1]
	movs r2, 0x80
	ldrb r0, [r4, 0x1A]
	orrs r0, r2
	ldr r1, [sp, 0x14]
	strb r0, [r1]
	cmp r6, 0x1
	bne _081DEE9C
	ldr r0, [sp, 0x8]
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _081DEE9C
	ldrb r0, [r4, 0x1A]
	orrs r0, r2
	ldr r1, [sp, 0x14]
	strb r0, [r1]
_081DEE9C:
	movs r0, 0
	strb r0, [r4, 0x1D]
_081DEEA0:
	mov r6, r10
	mov r4, r9
	cmp r6, 0x4
	bgt _081DEEAA
	b _081DEAA0
_081DEEAA:
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end CgbSound

	thumb_func_start MPlayTempoControl
MPlayTempoControl: @ 81DEEBC
	push {r4,lr}
	adds r2, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r3, [r2, 0x34]
	ldr r0, _081DEEE0
	cmp r3, r0
	bne _081DEED8
	strh r1, [r2, 0x1E]
	ldrh r4, [r2, 0x1C]
	adds r0, r1, 0
	muls r0, r4
	asrs r0, 8
	strh r0, [r2, 0x20]
_081DEED8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081DEEE0: .4byte 0x68736d53
	thumb_func_end MPlayTempoControl

	thumb_func_start MPlayVolumeControl
MPlayVolumeControl: @ 81DEEE4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r6, r2, 16
	ldr r3, [r4, 0x34]
	ldr r0, _081DEF48
	cmp r3, r0
	bne _081DEF3C
	adds r0, r3, 0x1
	str r0, [r4, 0x34]
	ldrb r2, [r4, 0x8]
	ldr r1, [r4, 0x2C]
	movs r5, 0x1
	cmp r2, 0
	ble _081DEF38
	movs r0, 0x80
	mov r8, r0
	lsrs r6, 18
	movs r0, 0x3
	mov r12, r0
_081DEF14:
	adds r0, r7, 0
	ands r0, r5
	cmp r0, 0
	beq _081DEF2E
	ldrb r3, [r1]
	mov r0, r8
	ands r0, r3
	cmp r0, 0
	beq _081DEF2E
	strb r6, [r1, 0x13]
	mov r0, r12
	orrs r0, r3
	strb r0, [r1]
_081DEF2E:
	subs r2, 0x1
	adds r1, 0x50
	lsls r5, 1
	cmp r2, 0
	bgt _081DEF14
_081DEF38:
	ldr r0, _081DEF48
	str r0, [r4, 0x34]
_081DEF3C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081DEF48: .4byte 0x68736d53
	thumb_func_end MPlayVolumeControl

	thumb_func_start MPlayPitchControl
MPlayPitchControl: @ 81DEF4C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r12, r1
	lsls r2, 16
	lsrs r6, r2, 16
	ldr r3, [r4, 0x34]
	ldr r0, _081DEFBC
	cmp r3, r0
	bne _081DEFAE
	adds r0, r3, 0x1
	str r0, [r4, 0x34]
	ldrb r2, [r4, 0x8]
	ldr r3, [r4, 0x2C]
	movs r5, 0x1
	cmp r2, 0
	ble _081DEFAA
	movs r0, 0x80
	mov r9, r0
	lsls r0, r6, 16
	asrs r7, r0, 24
	movs r0, 0xC
	mov r8, r0
_081DEF84:
	mov r0, r12
	ands r0, r5
	cmp r0, 0
	beq _081DEFA0
	ldrb r1, [r3]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	beq _081DEFA0
	strb r7, [r3, 0xB]
	strb r6, [r3, 0xD]
	mov r0, r8
	orrs r0, r1
	strb r0, [r3]
_081DEFA0:
	subs r2, 0x1
	adds r3, 0x50
	lsls r5, 1
	cmp r2, 0
	bgt _081DEF84
_081DEFAA:
	ldr r0, _081DEFBC
	str r0, [r4, 0x34]
_081DEFAE:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081DEFBC: .4byte 0x68736d53
	thumb_func_end MPlayPitchControl

	thumb_func_start MPlayPanpotControl
MPlayPanpotControl: @ 81DEFC0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r3, [r4, 0x34]
	ldr r0, _081DF024
	cmp r3, r0
	bne _081DF018
	adds r0, r3, 0x1
	str r0, [r4, 0x34]
	ldrb r2, [r4, 0x8]
	ldr r1, [r4, 0x2C]
	movs r5, 0x1
	cmp r2, 0
	ble _081DF014
	movs r0, 0x80
	mov r8, r0
	movs r0, 0x3
	mov r12, r0
_081DEFF0:
	adds r0, r7, 0
	ands r0, r5
	cmp r0, 0
	beq _081DF00A
	ldrb r3, [r1]
	mov r0, r8
	ands r0, r3
	cmp r0, 0
	beq _081DF00A
	strb r6, [r1, 0x15]
	mov r0, r12
	orrs r0, r3
	strb r0, [r1]
_081DF00A:
	subs r2, 0x1
	adds r1, 0x50
	lsls r5, 1
	cmp r2, 0
	bgt _081DEFF0
_081DF014:
	ldr r0, _081DF024
	str r0, [r4, 0x34]
_081DF018:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081DF024: .4byte 0x68736d53
	thumb_func_end MPlayPanpotControl

	thumb_func_start MP_clear_modM
MP_clear_modM: @ 81DF028
	adds r1, r0, 0
	movs r2, 0
	movs r0, 0
	strb r0, [r1, 0x1A]
	strb r0, [r1, 0x16]
	ldrb r0, [r1, 0x18]
	cmp r0, 0
	bne _081DF03C
	movs r0, 0xC
	b _081DF03E
_081DF03C:
	movs r0, 0x3
_081DF03E:
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bx lr
	thumb_func_end MP_clear_modM

	thumb_func_start MPlayModDepthSet
MPlayModDepthSet: @ 81DF048
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	ldr r1, [r6, 0x34]
	ldr r0, _081DF0B8
	cmp r1, r0
	bne _081DF0A8
	adds r0, r1, 0x1
	str r0, [r6, 0x34]
	ldrb r5, [r6, 0x8]
	ldr r4, [r6, 0x2C]
	movs r7, 0x1
	cmp r5, 0
	ble _081DF0A4
	mov r9, r8
_081DF078:
	mov r0, r10
	ands r0, r7
	cmp r0, 0
	beq _081DF09A
	movs r0, 0x80
	ldrb r1, [r4]
	ands r0, r1
	cmp r0, 0
	beq _081DF09A
	mov r0, r8
	strb r0, [r4, 0x17]
	mov r1, r9
	cmp r1, 0
	bne _081DF09A
	adds r0, r4, 0
	bl MP_clear_modM
_081DF09A:
	subs r5, 0x1
	adds r4, 0x50
	lsls r7, 1
	cmp r5, 0
	bgt _081DF078
_081DF0A4:
	ldr r0, _081DF0B8
	str r0, [r6, 0x34]
_081DF0A8:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081DF0B8: .4byte 0x68736d53
	thumb_func_end MPlayModDepthSet

	thumb_func_start MPlayLFOSpeedSet
MPlayLFOSpeedSet: @ 81DF0BC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	ldr r1, [r6, 0x34]
	ldr r0, _081DF12C
	cmp r1, r0
	bne _081DF11C
	adds r0, r1, 0x1
	str r0, [r6, 0x34]
	ldrb r5, [r6, 0x8]
	ldr r4, [r6, 0x2C]
	movs r7, 0x1
	cmp r5, 0
	ble _081DF118
	mov r9, r8
_081DF0EC:
	mov r0, r10
	ands r0, r7
	cmp r0, 0
	beq _081DF10E
	movs r0, 0x80
	ldrb r1, [r4]
	ands r0, r1
	cmp r0, 0
	beq _081DF10E
	mov r0, r8
	strb r0, [r4, 0x19]
	mov r1, r9
	cmp r1, 0
	bne _081DF10E
	adds r0, r4, 0
	bl MP_clear_modM
_081DF10E:
	subs r5, 0x1
	adds r4, 0x50
	lsls r7, 1
	cmp r5, 0
	bgt _081DF0EC
_081DF118:
	ldr r0, _081DF12C
	str r0, [r6, 0x34]
_081DF11C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081DF12C: .4byte 0x68736d53
	thumb_func_end MPlayLFOSpeedSet

	thumb_func_start ply_memacc
ply_memacc: @ 81DF130
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r6, r1, 0
	ldr r1, [r6, 0x40]
	ldrb r5, [r1]
	adds r2, r1, 0x1
	str r2, [r6, 0x40]
	ldr r0, [r4, 0x18]
	ldrb r1, [r1, 0x1]
	adds r3, r1, r0
	adds r0, r2, 0x1
	str r0, [r6, 0x40]
	ldrb r2, [r2, 0x1]
	adds r0, 0x1
	str r0, [r6, 0x40]
	cmp r5, 0x11
	bls _081DF154
	b _081DF282
_081DF154:
	lsls r0, r5, 2
	ldr r1, _081DF160
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081DF160: .4byte _081DF164
	.align 2, 0
_081DF164:
	.4byte _081DF1AC
	.4byte _081DF1B0
	.4byte _081DF1B8
	.4byte _081DF1C0
	.4byte _081DF1CA
	.4byte _081DF1D8
	.4byte _081DF1E6
	.4byte _081DF1EE
	.4byte _081DF1F6
	.4byte _081DF1FE
	.4byte _081DF206
	.4byte _081DF20E
	.4byte _081DF216
	.4byte _081DF224
	.4byte _081DF232
	.4byte _081DF240
	.4byte _081DF24E
	.4byte _081DF25C
_081DF1AC:
	strb r2, [r3]
	b _081DF282
_081DF1B0:
	ldrb r1, [r3]
	adds r0, r1, r2
	strb r0, [r3]
	b _081DF282
_081DF1B8:
	ldrb r1, [r3]
	subs r0, r1, r2
	strb r0, [r3]
	b _081DF282
_081DF1C0:
	ldr r0, [r4, 0x18]
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r3]
	b _081DF282
_081DF1CA:
	ldr r0, [r4, 0x18]
	adds r0, r2
	ldrb r1, [r3]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r3]
	b _081DF282
_081DF1D8:
	ldr r0, [r4, 0x18]
	adds r0, r2
	ldrb r1, [r3]
	ldrb r0, [r0]
	subs r0, r1, r0
	strb r0, [r3]
	b _081DF282
_081DF1E6:
	ldrb r3, [r3]
	cmp r3, r2
	beq _081DF268
	b _081DF27C
_081DF1EE:
	ldrb r3, [r3]
	cmp r3, r2
	bne _081DF268
	b _081DF27C
_081DF1F6:
	ldrb r3, [r3]
	cmp r3, r2
	bhi _081DF268
	b _081DF27C
_081DF1FE:
	ldrb r3, [r3]
	cmp r3, r2
	bcs _081DF268
	b _081DF27C
_081DF206:
	ldrb r3, [r3]
	cmp r3, r2
	bls _081DF268
	b _081DF27C
_081DF20E:
	ldrb r3, [r3]
	cmp r3, r2
	bcc _081DF268
	b _081DF27C
_081DF216:
	ldr r0, [r4, 0x18]
	adds r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	beq _081DF268
	b _081DF27C
_081DF224:
	ldr r0, [r4, 0x18]
	adds r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bne _081DF268
	b _081DF27C
_081DF232:
	ldr r0, [r4, 0x18]
	adds r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhi _081DF268
	b _081DF27C
_081DF240:
	ldr r0, [r4, 0x18]
	adds r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bcs _081DF268
	b _081DF27C
_081DF24E:
	ldr r0, [r4, 0x18]
	adds r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bls _081DF268
	b _081DF27C
_081DF25C:
	ldr r0, [r4, 0x18]
	adds r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bcs _081DF27C
_081DF268:
	ldr r0, _081DF278
	ldr r2, [r0]
	adds r0, r4, 0
	adds r1, r6, 0
	bl _call_via_r2
	b _081DF282
	.align 2, 0
_081DF278: .4byte 0x03007074
_081DF27C:
	ldr r0, [r6, 0x40]
	adds r0, 0x4
	str r0, [r6, 0x40]
_081DF282:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end ply_memacc

	thumb_func_start ply_xcmd
ply_xcmd: @ 81DF288
	push {lr}
	ldr r2, [r1, 0x40]
	ldrb r3, [r2]
	adds r2, 0x1
	str r2, [r1, 0x40]
	ldr r2, _081DF2A4
	lsls r3, 2
	adds r3, r2
	ldr r2, [r3]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_081DF2A4: .4byte gUnknown_0842FC50
	thumb_func_end ply_xcmd

	thumb_func_start ply_xxx
ply_xxx: @ 81DF2A8
	push {lr}
	ldr r2, _081DF2B8
	ldr r2, [r2]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_081DF2B8: .4byte 0x03007070
	thumb_func_end ply_xxx

	thumb_func_start ply_xwave
ply_xwave: @ 81DF2BC
	push {r4,lr}
	ldr r2, [r1, 0x40]
	ldr r0, _081DF2F4
	ands r4, r0
	ldrb r0, [r2]
	orrs r4, r0
	ldrb r0, [r2, 0x1]
	lsls r3, r0, 8
	ldr r0, _081DF2F8
	ands r4, r0
	orrs r4, r3
	ldrb r0, [r2, 0x2]
	lsls r3, r0, 16
	ldr r0, _081DF2FC
	ands r4, r0
	orrs r4, r3
	ldrb r0, [r2, 0x3]
	lsls r3, r0, 24
	ldr r0, _081DF300
	ands r4, r0
	orrs r4, r3
	str r4, [r1, 0x28]
	adds r2, 0x4
	str r2, [r1, 0x40]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081DF2F4: .4byte 0xffffff00
_081DF2F8: .4byte 0xffff00ff
_081DF2FC: .4byte 0xff00ffff
_081DF300: .4byte 0x00ffffff
	thumb_func_end ply_xwave

	thumb_func_start ply_xtype
ply_xtype: @ 81DF304
	ldr r0, [r1, 0x40]
	ldrb r2, [r0]
	adds r0, r1, 0
	adds r0, 0x24
	strb r2, [r0]
	ldr r0, [r1, 0x40]
	adds r0, 0x1
	str r0, [r1, 0x40]
	bx lr
	thumb_func_end ply_xtype

	thumb_func_start ply_xatta
ply_xatta: @ 81DF318
	ldr r0, [r1, 0x40]
	ldrb r2, [r0]
	adds r0, r1, 0
	adds r0, 0x2C
	strb r2, [r0]
	ldr r0, [r1, 0x40]
	adds r0, 0x1
	str r0, [r1, 0x40]
	bx lr
	thumb_func_end ply_xatta

	thumb_func_start ply_xdeca
ply_xdeca: @ 81DF32C
	ldr r0, [r1, 0x40]
	ldrb r0, [r0]
	adds r2, r1, 0
	adds r2, 0x2D
	strb r0, [r2]
	ldr r0, [r1, 0x40]
	adds r0, 0x1
	str r0, [r1, 0x40]
	bx lr
	thumb_func_end ply_xdeca

	thumb_func_start ply_xsust
ply_xsust: @ 81DF340
	ldr r0, [r1, 0x40]
	ldrb r0, [r0]
	adds r2, r1, 0
	adds r2, 0x2E
	strb r0, [r2]
	ldr r0, [r1, 0x40]
	adds r0, 0x1
	str r0, [r1, 0x40]
	bx lr
	thumb_func_end ply_xsust

	thumb_func_start ply_xrele
ply_xrele: @ 81DF354
	ldr r0, [r1, 0x40]
	ldrb r0, [r0]
	adds r2, r1, 0
	adds r2, 0x2F
	strb r0, [r2]
	ldr r0, [r1, 0x40]
	adds r0, 0x1
	str r0, [r1, 0x40]
	bx lr
	thumb_func_end ply_xrele

	thumb_func_start ply_xiecv
ply_xiecv: @ 81DF368
	ldr r0, [r1, 0x40]
	ldrb r2, [r0]
	strb r2, [r1, 0x1E]
	adds r0, 0x1
	str r0, [r1, 0x40]
	bx lr
	thumb_func_end ply_xiecv

	thumb_func_start ply_xiecl
ply_xiecl: @ 81DF374
	ldr r0, [r1, 0x40]
	ldrb r2, [r0]
	strb r2, [r1, 0x1F]
	adds r0, 0x1
	str r0, [r1, 0x40]
	bx lr
	thumb_func_end ply_xiecl

	thumb_func_start ply_xleng
ply_xleng: @ 81DF380
	ldr r0, [r1, 0x40]
	ldrb r0, [r0]
	adds r2, r1, 0
	adds r2, 0x26
	strb r0, [r2]
	ldr r0, [r1, 0x40]
	adds r0, 0x1
	str r0, [r1, 0x40]
	bx lr
	thumb_func_end ply_xleng

	thumb_func_start ply_xswee
ply_xswee: @ 81DF394
	ldr r0, [r1, 0x40]
	ldrb r0, [r0]
	adds r2, r1, 0
	adds r2, 0x27
	strb r0, [r2]
	ldr r0, [r1, 0x40]
	adds r0, 0x1
	str r0, [r1, 0x40]
	bx lr
	thumb_func_end ply_xswee

	thumb_func_start ply_xcmd0C
ply_xcmd0C: @ 81DF3A8
	push {r4,lr}
	adds r3, r1, 0
	ldr r4, [r3, 0x40]
	ldr r0, _081DF3D8
	ands r2, r0
	ldrb r0, [r4]
	orrs r2, r0
	ldrb r0, [r4, 0x1]
	lsls r1, r0, 8
	ldr r0, _081DF3DC
	ands r2, r0
	orrs r2, r1
	ldrh r1, [r3, 0x3A]
	lsls r0, r2, 16
	lsrs r0, 16
	cmp r1, r0
	bcs _081DF3E0
	adds r0, r1, 0x1
	strh r0, [r3, 0x3A]
	subs r0, r4, 0x2
	str r0, [r3, 0x40]
	movs r0, 0x1
	strb r0, [r3, 0x1]
	b _081DF3E8
	.align 2, 0
_081DF3D8: .4byte 0xffffff00
_081DF3DC: .4byte 0xffff00ff
_081DF3E0:
	movs r0, 0
	strh r0, [r3, 0x3A]
	adds r0, r4, 0x2
	str r0, [r3, 0x40]
_081DF3E8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ply_xcmd0C

	thumb_func_start ply_xcmd0D
ply_xcmd0D: @ 81DF3F0
	push {r4,lr}
	ldr r2, [r1, 0x40]
	ldr r0, _081DF428
	ands r4, r0
	ldrb r0, [r2]
	orrs r4, r0
	ldrb r0, [r2, 0x1]
	lsls r3, r0, 8
	ldr r0, _081DF42C
	ands r4, r0
	orrs r4, r3
	ldrb r0, [r2, 0x2]
	lsls r3, r0, 16
	ldr r0, _081DF430
	ands r4, r0
	orrs r4, r3
	ldrb r0, [r2, 0x3]
	lsls r3, r0, 24
	ldr r0, _081DF434
	ands r4, r0
	orrs r4, r3
	str r4, [r1, 0x3C]
	adds r2, 0x4
	str r2, [r1, 0x40]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081DF428: .4byte 0xffffff00
_081DF42C: .4byte 0xffff00ff
_081DF430: .4byte 0xff00ffff
_081DF434: .4byte 0x00ffffff
	thumb_func_end ply_xcmd0D

	thumb_func_start DummyFunc_rev
DummyFunc_rev: @ 81DF438
	bx lr
	thumb_func_end DummyFunc_rev

	thumb_func_start sub_81DF43C
sub_81DF43C: @ 81DF43C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r0
	movs r6, 0
	movs r1, 0
	movs r4, 0
	ldr r0, _081DF4F8
	mov r8, r0
	ldr r7, _081DF4FC
	ldr r0, _081DF500
	mov r10, r0
	mov r5, r8
	adds r5, 0xC
	movs r3, 0
	ldr r0, _081DF504
	mov r12, r0
_081DF462:
	mov r0, r12
	adds r2, r3, r0
	ldrb r0, [r2]
	cmp r0, 0
	bne _081DF478
	ldr r0, [r2, 0x20]
	cmp r0, 0
	beq _081DF48E
	ldr r0, [r0, 0x2C]
	cmp r0, r2
	bne _081DF48E
_081DF478:
	ldr r0, [r5]
	cmp r6, r0
	bcs _081DF482
	adds r6, r0, 0
	adds r1, r4, 0
_081DF482:
	adds r5, 0x40
	adds r3, 0xA0
	adds r4, 0x1
	cmp r4, 0x1
	ble _081DF462
	adds r4, r1, 0
_081DF48E:
	lsls r5, r4, 6
	add r5, r8
	ldr r0, [r5, 0x34]
	adds r0, 0x1
	str r0, [r5, 0x34]
	movs r0, 0x34
	muls r4, r0
	adds r6, r4, r7
	adds r0, r6, 0
	mov r1, r10
	movs r2, 0x34
	bl memcpy
	adds r0, r7, 0x4
	adds r0, r4, r0
	mov r1, r9
	str r1, [r0]
	adds r1, r7, 0
	adds r1, 0x8
	adds r1, r4, r1
	adds r0, r7, 0
	adds r0, 0x11
	adds r0, r4, r0
	str r0, [r1]
	adds r1, r7, 0
	adds r1, 0xC
	adds r1, r4, r1
	adds r0, r7, 0
	adds r0, 0x18
	adds r0, r4, r0
	str r0, [r1]
	adds r0, r7, 0
	adds r0, 0x14
	adds r0, r4, r0
	adds r1, r7, 0
	adds r1, 0x1A
	adds r4, r1
	str r4, [r0]
	ldr r0, _081DF508
	str r0, [r5, 0x34]
	adds r0, r5, 0
	adds r1, r6, 0
	bl MPlayStart_rev01
	adds r0, r5, 0
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081DF4F8: .4byte 0x03006ff0
_081DF4FC: .4byte 0x03006f80
_081DF500: .4byte 0x03007340
_081DF504: .4byte 0x03007200
_081DF508: .4byte 0x68736d53
	thumb_func_end sub_81DF43C

	thumb_func_start sub_81DF50C
sub_81DF50C: @ 81DF50C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081DF51C
	movs r1, 0x7F
	ands r0, r1
	strb r0, [r2, 0x1D]
	bx lr
	.align 2, 0
_081DF51C: .4byte 0x03007340
	thumb_func_end sub_81DF50C

	thumb_func_start sub_81DF520
sub_81DF520: @ 81DF520
	ldr r2, _081DF534
	lsls r0, 24
	asrs r0, 24
	adds r0, 0x40
	movs r1, 0x7F
	ands r0, r1
	adds r2, 0x28
	strb r0, [r2]
	bx lr
	.align 2, 0
_081DF534: .4byte 0x03007340
	thumb_func_end sub_81DF520

	thumb_func_start sub_81DF538
sub_81DF538: @ 81DF538
	push {r4-r6,lr}
	lsls r0, 16
	ldr r3, _081DF56C
	ldrb r2, [r3, 0x19]
	ldrb r4, [r3, 0x12]
	subs r1, r2, r4
	lsls r1, 24
	lsrs r1, 24
	movs r6, 0x80
	lsls r6, 16
	adds r0, r6
	asrs r2, r0, 24
	movs r5, 0x7F
	movs r4, 0x7F
	ands r2, r4
	movs r6, 0x2A
	strb r2, [r6, r3]
	asrs r0, 17
	ands r0, r4
	strb r0, [r3, 0x12]
	adds r1, r0
	ands r1, r5
	strb r1, [r3, 0x19]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081DF56C: .4byte 0x03007340
	thumb_func_end sub_81DF538

	thumb_func_start sub_81DF570
sub_81DF570: @ 81DF570
	ldr r1, _081DF578
	strh r0, [r1, 0x2E]
	bx lr
	.align 2, 0
_081DF578: .4byte 0x03007340
	thumb_func_end sub_81DF570

	thumb_func_start sub_81DF57C
sub_81DF57C: @ 81DF57C
	ldr r1, _081DF584
	adds r1, 0x26
	strb r0, [r1]
	bx lr
	.align 2, 0
_081DF584: .4byte 0x03007340
	thumb_func_end sub_81DF57C

	thumb_func_start sub_81DF588
sub_81DF588: @ 81DF588
	ldr r1, _081DF590
	str r0, [r1, 0x20]
	bx lr
	.align 2, 0
_081DF590: .4byte 0x03007340
	thumb_func_end sub_81DF588

	thumb_func_start sub_81DF594
sub_81DF594: @ 81DF594
	ldr r1, [r0, 0x2C]
	ldr r0, [r1, 0x20]
	cmp r0, 0
	beq _081DF5A6
	ldr r0, [r0, 0x2C]
	cmp r0, r1
	bne _081DF5A6
	movs r0, 0x1
	b _081DF5A8
_081DF5A6:
	movs r0, 0
_081DF5A8:
	bx lr
	thumb_func_end sub_81DF594

	thumb_func_start sub_81DF5AC
sub_81DF5AC: @ 81DF5AC
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r0, 0
	beq _081DF5CC
	ldr r2, _081DF5C8
	movs r0, 0x2
	strb r0, [r2]
	ldrb r3, [r2, 0x12]
	adds r0, r3, r1
	movs r1, 0x7F
	ands r0, r1
	strb r0, [r2, 0x19]
	b _081DF5D2
	.align 2, 0
_081DF5C8: .4byte 0x03007340
_081DF5CC:
	ldr r1, _081DF5D4
	movs r0, 0x1
	strb r0, [r1]
_081DF5D2:
	bx lr
	.align 2, 0
_081DF5D4: .4byte 0x03007340
	thumb_func_end sub_81DF5AC

	thumb_func_start sub_81DF5D8
sub_81DF5D8: @ 81DF5D8
	ldr r1, _081DF5F0
	ldr r2, [r1]
	cmp r0, 0
	beq _081DF5FC
	ldr r1, _081DF5F4
	ldr r3, _081DF5F8
	adds r0, r3, 0
	strh r0, [r1]
	movs r0, 0xFE
	ldrb r1, [r2, 0x9]
	ands r0, r1
	b _081DF60A
	.align 2, 0
_081DF5F0: .4byte 0x03007ff0
_081DF5F4: .4byte 0x04000082
_081DF5F8: .4byte 0x0000210e
_081DF5FC:
	ldr r1, _081DF610
	ldr r3, _081DF614
	adds r0, r3, 0
	strh r0, [r1]
	movs r0, 0x1
	ldrb r1, [r2, 0x9]
	orrs r0, r1
_081DF60A:
	strb r0, [r2, 0x9]
	bx lr
	.align 2, 0
_081DF610: .4byte 0x04000082
_081DF614: .4byte 0x00003302
	thumb_func_end sub_81DF5D8

	thumb_func_start sub_81DF618
sub_81DF618: @ 81DF618
	ldr r1, _081DF620
	strb r0, [r1, 0x2]
	bx lr
	.align 2, 0
_081DF620: .4byte 0x03007340
	thumb_func_end sub_81DF618

	.align 2, 0 @ Don't pad with nop.
