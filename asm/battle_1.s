	.include "constants/gba_constants.inc"

	.include "include/macros.inc"

	.syntax unified

	.text
	
	thumb_func_start unref_sub_800D42C
unref_sub_800D42C: @ 800D42C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	mov r9, r0
	str r1, [sp]
	str r2, [sp, 0x4]
	adds r5, r3, 0
	movs r0, 0x1
	mov r1, r9
	ands r0, r1
	cmp r0, 0
	bne _0800D44C
	b _0800D5E4
_0800D44C:
	asrs r0, r1, 1
	adds r0, 0x4
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	movs r0, 0
	ldr r2, [sp]
	cmp r0, r2
	blt _0800D460
	b _0800D674
_0800D460:
	movs r4, 0x8
	subs r1, r4, r1
	str r1, [sp, 0x10]
_0800D466:
	movs r7, 0
	adds r0, 0x1
	str r0, [sp, 0x14]
	ldr r0, [sp, 0x10]
	cmp r7, r0
	bge _0800D4E2
	ldr r1, [sp, 0x8]
	lsls r1, 8
	str r1, [sp, 0x18]
	movs r2, 0
	mov r10, r2
	mov r0, r9
	movs r4, 0x8
	subs r0, r4, r0
	str r0, [sp, 0xC]
_0800D484:
	movs r3, 0
	asrs r0, r7, 1
	adds r1, r7, 0
	movs r2, 0x1
	ands r1, r2
	str r1, [sp, 0x20]
	lsls r0, 8
	mov r8, r0
	mov r12, r5
_0800D496:
	lsls r1, r3, 5
	ldr r4, [sp, 0x18]
	adds r0, r5, r4
	adds r0, r1
	mov r1, r8
	adds r2, r0, r1
	mov r1, r12
	add r1, r8
	movs r6, 0xF
_0800D4A8:
	ldr r4, [sp, 0x20]
	cmp r4, 0
	bne _0800D4B8
	strb r4, [r1]
	add r4, sp, 0x20
	ldrb r4, [r4]
	strb r4, [r2, 0x10]
	b _0800D4C6
_0800D4B8:
	mov r0, r10
	strb r0, [r1, 0x10]
	movs r4, 0x80
	lsls r4, 1
	adds r4, r2, r4
	str r4, [sp, 0x1C]
	strb r0, [r4]
_0800D4C6:
	adds r2, 0x1
	adds r1, 0x1
	subs r6, 0x1
	cmp r6, 0
	bge _0800D4A8
	movs r0, 0x20
	add r12, r0
	adds r3, 0x1
	cmp r3, 0x7
	ble _0800D496
	adds r7, 0x1
	ldr r1, [sp, 0xC]
	cmp r7, r1
	blt _0800D484
_0800D4E2:
	movs r7, 0
	movs r2, 0
_0800D4E6:
	movs r6, 0
	adds r4, r7, 0x1
	mov r8, r4
	lsls r4, r7, 5
_0800D4EE:
	adds r0, r6, 0x1
	mov r10, r0
	lsls r1, r6, 8
	adds r0, r1, 0
	adds r0, 0xC0
	adds r0, r5, r0
	adds r0, r4
	adds r1, r5, r1
	adds r1, r4
	movs r3, 0x1F
_0800D502:
	strb r2, [r1]
	strb r2, [r0]
	adds r0, 0x1
	adds r1, 0x1
	subs r3, 0x1
	cmp r3, 0
	bge _0800D502
	mov r6, r10
	cmp r6, 0x7
	ble _0800D4EE
	mov r7, r8
	cmp r7, 0x1
	ble _0800D4E6
	mov r1, r9
	cmp r1, 0x5
	bne _0800D528
	movs r2, 0x90
	lsls r2, 1
	adds r5, r2
_0800D528:
	movs r7, 0
	cmp r7, r9
	bge _0800D5BE
_0800D52E:
	movs r3, 0
	adds r7, 0x1
	mov r8, r7
	cmp r3, r9
	bge _0800D59E
_0800D538:
	adds r3, 0x1
	mov r10, r3
	ldr r4, [sp, 0x4]
	adds r4, 0x20
	adds r7, r5, 0
	adds r7, 0x20
	movs r0, 0x12
	adds r0, r5
	mov r12, r0
	ldr r2, [sp, 0x4]
	adds r3, r5, 0
	movs r6, 0x3
_0800D550:
	ldrb r0, [r2]
	mov r1, r12
	strb r0, [r1]
	ldrb r0, [r2, 0x1]
	strb r0, [r1, 0x1]
	ldrb r0, [r2, 0x2]
	strb r0, [r1, 0x1E]
	ldrb r0, [r2, 0x3]
	strb r0, [r1, 0x1F]
	movs r0, 0x81
	lsls r0, 1
	adds r1, r3, r0
	ldrb r0, [r2, 0x10]
	strb r0, [r1]
	ldr r0, _0800D5A8 @ =0x00000103
	adds r1, r3, r0
	ldrb r0, [r2, 0x11]
	strb r0, [r1]
	movs r0, 0x90
	lsls r0, 1
	adds r1, r3, r0
	ldrb r0, [r2, 0x12]
	strb r0, [r1]
	ldr r0, _0800D5AC @ =0x00000121
	adds r1, r3, r0
	ldrb r0, [r2, 0x13]
	strb r0, [r1]
	movs r1, 0x4
	add r12, r1
	adds r2, 0x4
	adds r3, 0x4
	subs r6, 0x1
	cmp r6, 0
	bge _0800D550
	str r4, [sp, 0x4]
	adds r5, r7, 0
	mov r3, r10
	cmp r3, r9
	blt _0800D538
_0800D59E:
	mov r2, r9
	cmp r2, 0x7
	bne _0800D5B0
	adds r5, 0x20
	b _0800D5B8
	.align 2, 0
_0800D5A8: .4byte 0x00000103
_0800D5AC: .4byte 0x00000121
_0800D5B0:
	mov r4, r9
	cmp r4, 0x5
	bne _0800D5B8
	adds r5, 0x60
_0800D5B8:
	mov r7, r8
	cmp r7, r9
	blt _0800D52E
_0800D5BE:
	mov r0, r9
	cmp r0, 0x7
	bne _0800D5CC
	movs r1, 0x80
	lsls r1, 1
	adds r5, r1
	b _0800D5D8
_0800D5CC:
	mov r2, r9
	cmp r2, 0x5
	bne _0800D5D8
	movs r4, 0xF0
	lsls r4, 1
	adds r5, r4
_0800D5D8:
	ldr r0, [sp, 0x14]
	ldr r1, [sp]
	cmp r0, r1
	bge _0800D5E2
	b _0800D466
_0800D5E2:
	b _0800D674
_0800D5E4:
	movs r6, 0
	ldr r2, [sp]
	cmp r6, r2
	bge _0800D674
_0800D5EC:
	adds r6, 0x1
	mov r10, r6
	mov r4, r9
	cmp r4, 0x6
	bne _0800D604
	movs r0, 0
	movs r3, 0xFF
_0800D5FA:
	strb r0, [r5]
	adds r5, 0x1
	subs r3, 0x1
	cmp r3, 0
	bge _0800D5FA
_0800D604:
	movs r7, 0
	cmp r7, r9
	bge _0800D658
_0800D60A:
	adds r7, 0x1
	mov r8, r7
	mov r1, r9
	lsls r0, r1, 5
	cmp r1, 0x6
	bne _0800D624
	movs r1, 0
	movs r3, 0x1F
_0800D61A:
	strb r1, [r5]
	adds r5, 0x1
	subs r3, 0x1
	cmp r3, 0
	bge _0800D61A
_0800D624:
	adds r1, r0, 0
	cmp r1, 0
	ble _0800D63E
	adds r3, r1, 0
_0800D62C:
	ldr r2, [sp, 0x4]
	ldrb r0, [r2]
	strb r0, [r5]
	adds r2, 0x1
	str r2, [sp, 0x4]
	adds r5, 0x1
	subs r3, 0x1
	cmp r3, 0
	bne _0800D62C
_0800D63E:
	mov r4, r9
	cmp r4, 0x6
	bne _0800D652
	movs r0, 0
	movs r3, 0x1F
_0800D648:
	strb r0, [r5]
	adds r5, 0x1
	subs r3, 0x1
	cmp r3, 0
	bge _0800D648
_0800D652:
	mov r7, r8
	cmp r7, r9
	blt _0800D60A
_0800D658:
	mov r0, r9
	cmp r0, 0x6
	bne _0800D66C
	movs r0, 0
	movs r3, 0xFF
_0800D662:
	strb r0, [r5]
	adds r5, 0x1
	subs r3, 0x1
	cmp r3, 0
	bge _0800D662
_0800D66C:
	mov r6, r10
	ldr r1, [sp]
	cmp r6, r1
	blt _0800D5EC
_0800D674:
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_800D42C

	.align 2, 0
