	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_811A1C8
sub_811A1C8: @ 811A1C8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r5, r0, 24
	lsrs r4, r5, 24
	lsls r1, 24
	movs r0, 0xFE
	lsls r0, 23
	adds r1, r0
	lsrs r1, 16
	adds r0, r1, 0
	bl __floatsidf
	ldr r3, _0811A280 @ =0x00000000
	ldr r2, _0811A27C @ =0x40920000
	bl __divdf3
	bl __fixunsdfsi
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x37
	bls _0811A1FE
	movs r6, 0x37
_0811A1FE:
	str r6, [sp]
	movs r7, 0x1
	ands r7, r4
	ldr r0, _0811A284 @ =gSharedMem + 0x1C000
	mov r10, r0
	lsrs r5, 27
	mov r8, r5
	ldr r0, _0811A288 @ =gUnknown_083FB738
	mov r1, r10
	ldrb r1, [r1, 0x12]
	cmp r6, r1
	bls _0811A298
	adds r0, r7, r0
	ldrb r0, [r0]
	mov r9, r0
	movs r2, 0x7
	ands r2, r4
_0811A220:
	lsls r1, r6, 1
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 4
	adds r1, r0
	ldr r3, _0811A28C @ =gUnknown_083FB274
	adds r1, r3
	mov r3, r8
	lsls r0, r3, 5
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0811A290 @ =gSharedMem
	adds r5, r0, r1
	ldrb r4, [r5]
	mov r3, r9
	ands r4, r3
	strb r4, [r5]
	adds r0, r6, 0
	movs r1, 0x3
	str r2, [sp, 0x8]
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	movs r1, 0xF
	ands r0, r1
	lsls r1, r7, 4
	adds r0, r1
	ldr r1, _0811A294 @ =gUnknown_083FB73A
	adds r0, r1
	ldrb r0, [r0]
	orrs r4, r0
	strb r4, [r5]
	subs r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, [sp, 0x8]
	ldr r3, _0811A284 @ =gSharedMem + 0x1C000
	ldrb r3, [r3, 0x12]
	cmp r6, r3
	bhi _0811A220
	b _0811A2FA
	.align 2, 0
_0811A27C: .4byte 0x40920000
_0811A280: .4byte 0x00000000
_0811A284: .4byte gSharedMem + 0x1C000
_0811A288: .4byte gUnknown_083FB738
_0811A28C: .4byte gUnknown_083FB274
_0811A290: .4byte gSharedMem
_0811A294: .4byte gUnknown_083FB73A
_0811A298:
	lsls r1, r7, 4
	str r1, [sp, 0x4]
	adds r0, r7, r0
	ldrb r0, [r0]
	mov r9, r0
	movs r7, 0x7
	ands r7, r4
_0811A2A6:
	lsls r1, r6, 1
	lsls r0, r7, 3
	adds r0, r7
	lsls r0, 4
	adds r1, r0
	ldr r2, _0811A314 @ =gUnknown_083FB274
	adds r1, r2
	mov r3, r8
	lsls r0, r3, 5
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0811A318 @ =gSharedMem
	adds r5, r0, r1
	ldrb r4, [r5]
	mov r2, r9
	ands r4, r2
	strb r4, [r5]
	adds r0, r6, 0
	movs r1, 0x3
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	movs r1, 0xF
	ands r0, r1
	ldr r3, [sp, 0x4]
	adds r0, r3
	ldr r1, _0811A31C @ =gUnknown_083FB73A
	adds r0, r1
	ldrb r0, [r0]
	orrs r4, r0
	strb r4, [r5]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, _0811A320 @ =gSharedMem + 0x1C000
	ldrb r2, [r2, 0x12]
	cmp r6, r2
	bcc _0811A2A6
_0811A2FA:
	mov r3, sp
	ldrb r0, [r3]
	mov r3, r10
	strb r0, [r3, 0x12]
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811A314: .4byte gUnknown_083FB274
_0811A318: .4byte gSharedMem
_0811A31C: .4byte gUnknown_083FB73A
_0811A320: .4byte gSharedMem + 0x1C000
	thumb_func_end sub_811A1C8

	thumb_func_start sub_811A324
sub_811A324: @ 811A324
	ldr r2, _0811A344 @ =0x040000d4
	ldr r0, _0811A348 @ =gSharedMem
	str r0, [r2]
	movs r1, 0xE0
	lsls r1, 9
	adds r0, r1
	ldrh r0, [r0, 0x14]
	movs r1, 0xC0
	lsls r1, 19
	adds r0, r1
	str r0, [r2, 0x4]
	ldr r0, _0811A34C @ =0x80000e00
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	bx lr
	.align 2, 0
_0811A344: .4byte 0x040000d4
_0811A348: .4byte gSharedMem
_0811A34C: .4byte 0x80000e00
	thumb_func_end sub_811A324

	thumb_func_start sub_811A350
sub_811A350: @ 811A350
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r3, r0, 0
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r2, 24
	cmp r0, 0x1
	beq _0811A38C
	cmp r0, 0x1
	bgt _0811A36E
	cmp r0, 0
	beq _0811A378
	b _0811A3C4
_0811A36E:
	cmp r3, 0x2
	beq _0811A3A0
	cmp r3, 0x3
	beq _0811A3B4
	b _0811A3C4
_0811A378:
	cmp r2, 0
	beq _0811A384
	ldr r0, _0811A380 @ =REG_BG0VOFS
	b _0811A3C2
	.align 2, 0
_0811A380: .4byte REG_BG0VOFS
_0811A384:
	ldr r0, _0811A388 @ =REG_BG0HOFS
	b _0811A3C2
	.align 2, 0
_0811A388: .4byte REG_BG0HOFS
_0811A38C:
	cmp r2, 0
	beq _0811A398
	ldr r0, _0811A394 @ =REG_BG1VOFS
	b _0811A3C2
	.align 2, 0
_0811A394: .4byte REG_BG1VOFS
_0811A398:
	ldr r0, _0811A39C @ =REG_BG1HOFS
	b _0811A3C2
	.align 2, 0
_0811A39C: .4byte REG_BG1HOFS
_0811A3A0:
	cmp r2, 0
	beq _0811A3AC
	ldr r0, _0811A3A8 @ =REG_BG2VOFS
	b _0811A3C2
	.align 2, 0
_0811A3A8: .4byte REG_BG2VOFS
_0811A3AC:
	ldr r0, _0811A3B0 @ =REG_BG2HOFS
	b _0811A3C2
	.align 2, 0
_0811A3B0: .4byte REG_BG2HOFS
_0811A3B4:
	cmp r2, 0
	beq _0811A3C0
	ldr r0, _0811A3BC @ =REG_BG3VOFS
	b _0811A3C2
	.align 2, 0
_0811A3BC: .4byte REG_BG3VOFS
_0811A3C0:
	ldr r0, _0811A3C8 @ =REG_BG3HOFS
_0811A3C2:
	strh r1, [r0]
_0811A3C4:
	pop {r0}
	bx r0
	.align 2, 0
_0811A3C8: .4byte REG_BG3HOFS
	thumb_func_end sub_811A350

	.align 2, 0 @ Don't pad with nop.
