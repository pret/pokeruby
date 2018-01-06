	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_81245F4
sub_81245F4: @ 81245F4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r0, 0
	mov r12, r0
	ldr r2, _0812475C @ =gUnknown_02039274
	ldr r0, [r2]
	mov r1, r12
	strb r1, [r0, 0x1E]
	strb r1, [r0, 0x1D]
	ldr r1, [r2]
	ldrb r0, [r1, 0x8]
	strb r0, [r1, 0x1F]
	ldr r0, [r2]
	ldrb r1, [r0, 0x9]
	adds r0, 0x20
	strb r1, [r0]
	ldr r4, [r2]
	ldrb r1, [r4, 0x19]
	adds r3, r1, 0
	adds r3, 0x1E
	adds r0, r3, 0
	mov r9, r2
	asrs r0, 5
	lsls r0, 5
	subs r0, r3, r0
	strb r0, [r4, 0x19]
	mov r2, r9
	ldr r1, [r2]
	ldrb r0, [r1, 0x18]
	subs r0, 0x2
	strb r0, [r1, 0x18]
	ldr r0, [r2]
	ldrb r1, [r0, 0x1A]
	adds r2, r1, 0
	adds r2, 0x17
	adds r0, r2, 0
	ldr r3, _08124760 @ =gUnknown_0203927A
	mov r10, r3
	asrs r0, 5
	lsls r0, 5
	subs r0, r2, r0
	mov r4, r10
	strb r0, [r4]
	ldr r7, _08124764 @ =gUnknown_02039278
	ldr r0, _08124768 @ =gUnknown_02039279
	mov r8, r0
_08124658:
	mov r1, r9
	ldr r3, [r1]
	ldrb r0, [r3, 0x19]
	strb r0, [r7]
	mov r2, r10
	ldrb r0, [r2]
	mov r4, r12
	adds r1, r0, r4
	adds r0, r1, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r1, r0
	mov r1, r8
	strb r0, [r1]
	ldrb r2, [r7]
	lsls r2, 1
	ldrb r0, [r1]
	lsls r0, 6
	adds r2, r0
	adds r6, r3, 0
	adds r6, 0xFC
	adds r2, r6, r2
	ldrb r1, [r3, 0x18]
	lsls r1, 1
	mov r4, r12
	lsls r0, r4, 1
	add r0, r12
	lsls r5, r0, 3
	adds r1, r5
	adds r4, r3, 0
	adds r4, 0x22
	adds r1, r4, r1
	ldrh r0, [r1]
	strh r0, [r2]
	ldrb r1, [r7]
	adds r2, r1, 0x1
	adds r0, r2, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r2, r0
	strb r0, [r7]
	ldrb r1, [r7]
	lsls r1, 1
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 6
	adds r1, r0
	adds r1, r6, r1
	ldrb r0, [r3, 0x18]
	adds r0, 0x1
	lsls r0, 1
	adds r0, r5
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, r12
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	cmp r0, 0x8
	bls _08124658
	ldr r4, _08124764 @ =gUnknown_02039278
	mov r5, r9
	ldr r3, [r5]
	ldrb r1, [r3, 0x19]
	adds r2, r1, 0
	adds r2, 0x1E
	adds r0, r2, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r2, r0
	strb r0, [r4]
	adds r0, r3, 0
	adds r0, 0xFC
	ldrb r2, [r4]
	movs r1, 0x2
	str r1, [sp]
	movs r6, 0x20
	str r6, [sp, 0x4]
	movs r1, 0
	movs r3, 0
	bl sub_8124E7C
	ldr r1, [r5]
	ldrb r0, [r1, 0x18]
	cmp r0, 0
	bne _0812474C
	ldrb r2, [r1, 0x1A]
	adds r3, r2, 0
	adds r3, 0x1D
	adds r0, r3, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r3, r0
	strb r0, [r1, 0x1A]
	mov r3, r9
	ldr r1, [r3]
	movs r0, 0xC
	strb r0, [r1, 0x18]
	bl sub_812446C
	mov r4, r9
	ldr r1, [r4]
	ldrb r3, [r1, 0x1A]
	adds r4, r3, 0x1
	adds r0, r4, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r4, r0
	ldr r2, _08124764 @ =gUnknown_02039278
	strb r0, [r2]
	adds r0, r1, 0
	adds r0, 0xFC
	ldrb r3, [r2]
	str r6, [sp]
	movs r1, 0x9
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	bl sub_8124E7C
_0812474C:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812475C: .4byte gUnknown_02039274
_08124760: .4byte gUnknown_0203927A
_08124764: .4byte gUnknown_02039278
_08124768: .4byte gUnknown_02039279
	thumb_func_end sub_81245F4

	thumb_func_start sub_812476C
sub_812476C: @ 812476C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r0, 0
	mov r12, r0
	ldr r2, _0812489C @ =gUnknown_02039274
	ldr r0, [r2]
	mov r1, r12
	strb r1, [r0, 0x1E]
	strb r1, [r0, 0x1D]
	ldr r1, [r2]
	ldrb r0, [r1, 0x8]
	strb r0, [r1, 0x1F]
	ldr r0, [r2]
	ldrb r1, [r0, 0x9]
	adds r0, 0x20
	strb r1, [r0]
	ldr r4, [r2]
	ldrb r1, [r4, 0x19]
	adds r3, r1, 0x2
	adds r0, r3, 0
	mov r9, r2
	asrs r0, 5
	lsls r0, 5
	subs r0, r3, r0
	strb r0, [r4, 0x19]
	mov r2, r9
	ldr r1, [r2]
	ldrb r0, [r1, 0x18]
	adds r0, 0x2
	strb r0, [r1, 0x18]
	ldr r1, _081248A0 @ =gUnknown_0203927D
	ldr r0, [r2]
	ldrb r0, [r0, 0x1A]
	strb r0, [r1]
	ldr r4, _081248A4 @ =gUnknown_0203927C
	mov r10, r4
	ldr r7, _081248A8 @ =gUnknown_0203927B
	mov r8, r10
_081247C0:
	mov r0, r9
	ldr r3, [r0]
	ldrb r0, [r3, 0x19]
	strb r0, [r7]
	ldr r1, _081248A0 @ =gUnknown_0203927D
	ldrb r0, [r1]
	mov r2, r12
	adds r1, r0, r2
	adds r0, r1, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r1, r0
	mov r4, r8
	strb r0, [r4]
	ldrb r2, [r7]
	lsls r2, 1
	ldrb r0, [r4]
	lsls r0, 6
	adds r2, r0
	adds r6, r3, 0
	adds r6, 0xFC
	adds r2, r6, r2
	ldrb r1, [r3, 0x18]
	lsls r1, 1
	mov r4, r12
	lsls r0, r4, 1
	add r0, r12
	lsls r5, r0, 3
	adds r1, r5
	adds r4, r3, 0
	adds r4, 0x22
	adds r1, r4, r1
	ldrh r0, [r1]
	strh r0, [r2]
	ldrb r1, [r7]
	adds r2, r1, 0x1
	adds r0, r2, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r2, r0
	strb r0, [r7]
	ldrb r1, [r7]
	lsls r1, 1
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 6
	adds r1, r0
	adds r1, r6, r1
	ldrb r0, [r3, 0x18]
	adds r0, 0x1
	lsls r0, 1
	adds r0, r5
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, r12
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	cmp r0, 0x8
	bls _081247C0
	mov r4, r9
	ldr r1, [r4]
	ldrb r2, [r1, 0x1A]
	adds r3, r2, 0
	adds r3, 0x17
	adds r0, r3, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r3, r0
	mov r2, r10
	strb r0, [r2]
	adds r0, r1, 0
	adds r0, 0xFC
	ldrb r2, [r1, 0x19]
	mov r1, r10
	ldrb r3, [r1]
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0x9
	str r1, [sp, 0x4]
	movs r1, 0
	bl sub_8124E7C
	ldr r1, [r4]
	ldrb r0, [r1, 0x18]
	cmp r0, 0xA
	bne _0812488C
	ldrb r2, [r1, 0x1A]
	adds r3, r2, 0x3
	adds r0, r3, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r3, r0
	strb r0, [r1, 0x1A]
	mov r2, r9
	ldr r1, [r2]
	movs r0, 0xFE
	strb r0, [r1, 0x18]
	bl sub_812446C
_0812488C:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812489C: .4byte gUnknown_02039274
_081248A0: .4byte gUnknown_0203927D
_081248A4: .4byte gUnknown_0203927C
_081248A8: .4byte gUnknown_0203927B
	thumb_func_end sub_812476C

	thumb_func_start sub_81248AC
sub_81248AC: @ 81248AC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _081248BA
	cmp r0, 0x1
	beq _081248E4
_081248BA:
	ldr r1, _081248E0 @ =gUnknown_02039274
	ldr r2, [r1]
	movs r3, 0
	movs r0, 0x2
	strb r0, [r2, 0x1B]
	ldr r0, [r1]
	strb r3, [r0, 0x19]
	ldr r2, [r1]
	movs r0, 0x14
	strb r0, [r2, 0x1A]
	ldr r1, [r1]
	movs r0, 0xC
	strb r0, [r1, 0x18]
	bl sub_812446C
	bl sub_81245F4
	b _08124906
	.align 2, 0
_081248E0: .4byte gUnknown_02039274
_081248E4:
	ldr r1, _08124914 @ =gUnknown_02039274
	ldr r2, [r1]
	movs r0, 0x2
	strb r0, [r2, 0x1B]
	ldr r2, [r1]
	movs r0, 0x1C
	strb r0, [r2, 0x19]
	ldr r2, [r1]
	movs r0, 0x14
	strb r0, [r2, 0x1A]
	ldr r1, [r1]
	movs r0, 0x4
	strb r0, [r1, 0x18]
	bl sub_812446C
	bl sub_812476C
_08124906:
	ldr r0, _08124914 @ =gUnknown_02039274
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x1C]
	pop {r0}
	bx r0
	.align 2, 0
_08124914: .4byte gUnknown_02039274
	thumb_func_end sub_81248AC

	.align 2, 0 @ Don't pad with nop.
