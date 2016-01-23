	thumb_func_start _call_via_r0
_call_via_r0: ; 81E082C
	bx r0
	mov r8, r8
	thumb_func_end _call_via_r0

	thumb_func_start _call_via_r1
_call_via_r1: ; 81E0830
	bx r1
	mov r8, r8
	thumb_func_end _call_via_r1

	thumb_func_start _call_via_r2
_call_via_r2: ; 81E0834
	bx r2
	mov r8, r8
	thumb_func_end _call_via_r2

	thumb_func_start _call_via_r3
_call_via_r3: ; 81E0838
	bx r3
	mov r8, r8
	thumb_func_end _call_via_r3

	thumb_func_start _call_via_r4
_call_via_r4: ; 81E083C
	bx r4
	mov r8, r8
	thumb_func_end _call_via_r4

	thumb_func_start _call_via_r5
_call_via_r5: ; 81E0840
	bx r5
	mov r8, r8
	thumb_func_end _call_via_r5

	thumb_func_start _call_via_r6
_call_via_r6: ; 81E0844
	bx r6
	mov r8, r8
	thumb_func_end _call_via_r6

	thumb_func_start _call_via_r7
_call_via_r7: ; 81E0848
	bx r7
	mov r8, r8
	thumb_func_end _call_via_r7

	thumb_func_start _call_via_r8
_call_via_r8: ; 81E084C
	bx r8
	mov r8, r8
	thumb_func_end _call_via_r8

	thumb_func_start _call_via_r9
_call_via_r9: ; 81E0850
	bx r9
	mov r8, r8
	thumb_func_end _call_via_r9

	thumb_func_start _call_via_sl
_call_via_sl: ; 81E0854
	bx r10
	mov r8, r8
	thumb_func_end _call_via_sl

	thumb_func_start _call_via_fp
_call_via_fp: ; 81E0858
	bx r11
	mov r8, r8
	thumb_func_end _call_via_fp

	thumb_func_start _call_via_ip
_call_via_ip: ; 81E085C
	bx r12
	mov r8, r8
	thumb_func_end _call_via_ip

	thumb_func_start _call_via_sp
_call_via_sp: ; 81E0860
	bx sp
	mov r8, r8
	thumb_func_end _call_via_sp

	thumb_func_start _call_via_lr
_call_via_lr: ; 81E0864
	bx lr
	mov r8, r8
	thumb_func_end _call_via_lr

	thumb_func_start __divsi3
; int __divsi3(int dividend, int divisor)
__divsi3: ; 81E0868
	cmp r1, 0
	beq _081E08F0
	push {r4}
	adds r4, r0, 0
	eors r4, r1
	mov r12, r4
	movs r3, 0x1
	movs r2, 0
	cmp r1, 0
	bpl _081E087E
	negs r1, r1
_081E087E:
	cmp r0, 0
	bpl _081E0884
	negs r0, r0
_081E0884:
	cmp r0, r1
	bcc _081E08E2
	movs r4, 0x1
	lsls r4, 28
_081E088C:
	cmp r1, r4
	bcs _081E089A
	cmp r1, r0
	bcs _081E089A
	lsls r1, 4
	lsls r3, 4
	b _081E088C
_081E089A:
	lsls r4, 3
_081E089C:
	cmp r1, r4
	bcs _081E08AA
	cmp r1, r0
	bcs _081E08AA
	lsls r1, 1
	lsls r3, 1
	b _081E089C
_081E08AA:
	cmp r0, r1
	bcc _081E08B2
	subs r0, r1
	orrs r2, r3
_081E08B2:
	lsrs r4, r1, 1
	cmp r0, r4
	bcc _081E08BE
	subs r0, r4
	lsrs r4, r3, 1
	orrs r2, r4
_081E08BE:
	lsrs r4, r1, 2
	cmp r0, r4
	bcc _081E08CA
	subs r0, r4
	lsrs r4, r3, 2
	orrs r2, r4
_081E08CA:
	lsrs r4, r1, 3
	cmp r0, r4
	bcc _081E08D6
	subs r0, r4
	lsrs r4, r3, 3
	orrs r2, r4
_081E08D6:
	cmp r0, 0
	beq _081E08E2
	lsrs r3, 4
	beq _081E08E2
	lsrs r1, 4
	b _081E08AA
_081E08E2:
	adds r0, r2, 0
	mov r4, r12
	cmp r4, 0
	bpl _081E08EC
	negs r0, r0
_081E08EC:
	pop {r4}
	mov pc, lr
_081E08F0:
	push {lr}
	bl nullsub_1
	movs r0, 0
	pop {pc}
	thumb_func_end __divsi3

	thumb_func_start nullsub_1
nullsub_1: ; 81E08FC
	mov pc, lr
	thumb_func_end nullsub_1

	thumb_func_start __fixunsdfsi
__fixunsdfsi: ; 81E0900
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r0, 0
	ldr r3, _081E0920
	ldr r2, _081E091C
	bl __gedf2
	cmp r0, 0
	bge _081E0924
	adds r1, r5, 0
	adds r0, r4, 0
	bl __fixdfsi
	b _081E093A
	.align 2, 0
_081E091C: .4byte 0x41e00000
_081E0920: .4byte 0x00000000
_081E0924:
	ldr r3, _081E0940
	ldr r2, _081E093C
	adds r1, r5, 0
	adds r0, r4, 0
	bl __adddf3
	bl __fixdfsi
	movs r1, 0x80
	lsls r1, 24
	adds r0, r1
_081E093A:
	pop {r4,r5,pc}
	.align 2, 0
_081E093C: .4byte 0xc1e00000
_081E0940: .4byte 0x00000000
	thumb_func_end __fixunsdfsi

	thumb_func_start __fixunssfsi
__fixunssfsi: ; 81E0944
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _081E095C
	bl __gesf2
	cmp r0, 0
	bge _081E0960
	adds r0, r4, 0
	bl __fixsfsi
	b _081E0972
	.align 2, 0
_081E095C: .4byte 0x4f000000
_081E0960:
	ldr r1, _081E0974
	adds r0, r4, 0
	bl __addsf3
	bl __fixsfsi
	movs r1, 0x80
	lsls r1, 24
	adds r0, r1
_081E0972:
	pop {r4,pc}
	.align 2, 0
_081E0974: .4byte 0xcf000000
	thumb_func_end __fixunssfsi

	thumb_func_start __modsi3
__modsi3: ; 81E0978
	movs r3, 0x1
	cmp r1, 0
	beq _081E0A3C
	bpl _081E0982
	negs r1, r1
_081E0982:
	push {r4}
	push {r0}
	cmp r0, 0
	bpl _081E098C
	negs r0, r0
_081E098C:
	cmp r0, r1
	bcc _081E0A30
	movs r4, 0x1
	lsls r4, 28
_081E0994:
	cmp r1, r4
	bcs _081E09A2
	cmp r1, r0
	bcs _081E09A2
	lsls r1, 4
	lsls r3, 4
	b _081E0994
_081E09A2:
	lsls r4, 3
_081E09A4:
	cmp r1, r4
	bcs _081E09B2
	cmp r1, r0
	bcs _081E09B2
	lsls r1, 1
	lsls r3, 1
	b _081E09A4
_081E09B2:
	movs r2, 0
	cmp r0, r1
	bcc _081E09BA
	subs r0, r1
_081E09BA:
	lsrs r4, r1, 1
	cmp r0, r4
	bcc _081E09CC
	subs r0, r4
	mov r12, r3
	movs r4, 0x1
	rors r3, r4
	orrs r2, r3
	mov r3, r12
_081E09CC:
	lsrs r4, r1, 2
	cmp r0, r4
	bcc _081E09DE
	subs r0, r4
	mov r12, r3
	movs r4, 0x2
	rors r3, r4
	orrs r2, r3
	mov r3, r12
_081E09DE:
	lsrs r4, r1, 3
	cmp r0, r4
	bcc _081E09F0
	subs r0, r4
	mov r12, r3
	movs r4, 0x3
	rors r3, r4
	orrs r2, r3
	mov r3, r12
_081E09F0:
	mov r12, r3
	cmp r0, 0
	beq _081E09FE
	lsrs r3, 4
	beq _081E09FE
	lsrs r1, 4
	b _081E09B2
_081E09FE:
	movs r4, 0xE
	lsls r4, 28
	ands r2, r4
	beq _081E0A30
	mov r3, r12
	movs r4, 0x3
	rors r3, r4
	tst r2, r3
	beq _081E0A14
	lsrs r4, r1, 3
	adds r0, r4
_081E0A14:
	mov r3, r12
	movs r4, 0x2
	rors r3, r4
	tst r2, r3
	beq _081E0A22
	lsrs r4, r1, 2
	adds r0, r4
_081E0A22:
	mov r3, r12
	movs r4, 0x1
	rors r3, r4
	tst r2, r3
	beq _081E0A30
	lsrs r4, r1, 1
	adds r0, r4
_081E0A30:
	pop {r4}
	cmp r4, 0
	bpl _081E0A38
	negs r0, r0
_081E0A38:
	pop {r4}
	mov pc, lr
_081E0A3C:
	push {lr}
	bl nullsub_1
	movs r0, 0
	pop {pc}
	thumb_func_end __modsi3

	thumb_func_start __muldi3
__muldi3: ; 81E0A48
	push {r4-r7,lr}
	sub sp, 0x10
	str r0, [sp]
	str r1, [sp, 0x4]
	str r2, [sp, 0x8]
	str r3, [sp, 0xC]
	ldr r3, [sp]
	ldr r0, _081E0AB4
	mov r12, r0
	adds r2, r3, 0
	ands r2, r0
	lsrs r3, 16
	ldr r1, [sp, 0x8]
	adds r0, r1, 0
	mov r4, r12
	ands r0, r4
	lsrs r1, 16
	adds r5, r2, 0
	muls r5, r0
	adds r4, r2, 0
	muls r4, r1
	adds r2, r3, 0
	muls r2, r0
	muls r3, r1
	lsrs r0, r5, 16
	adds r4, r0
	adds r4, r2
	cmp r4, r2
	bcs _081E0A88
	movs r0, 0x80
	lsls r0, 9
	adds r3, r0
_081E0A88:
	lsrs r0, r4, 16
	adds r7, r3, r0
	mov r1, r12
	ands r4, r1
	lsls r0, r4, 16
	ands r5, r1
	adds r6, r0, 0
	orrs r6, r5
	adds r1, r7, 0
	adds r0, r6, 0
	ldr r3, [sp]
	ldr r4, [sp, 0xC]
	adds r2, r3, 0
	muls r2, r4
	ldr r5, [sp, 0x4]
	ldr r4, [sp, 0x8]
	adds r3, r5, 0
	muls r3, r4
	adds r2, r3
	adds r1, r7, r2
	add sp, 0x10
	pop {r4-r7,pc}
	.align 2, 0
_081E0AB4: .4byte 0x0000ffff
	thumb_func_end __muldi3

	thumb_func_start __udivdi3
__udivdi3: ; 81E0AB8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	adds r7, r2, 0
	adds r6, r3, 0
	mov r10, r0
	mov r8, r1
	cmp r6, 0
	beq _081E0AD2
	b _081E0D20
_081E0AD2:
	cmp r7, r8
	bls _081E0BAC
	ldr r0, _081E0AE8
	cmp r7, r0
	bhi _081E0AEC
	movs r1, 0
	cmp r7, 0xFF
	bls _081E0AF6
	movs r1, 0x8
	b _081E0AF6
	.align 2, 0
_081E0AE8: .4byte 0x0000ffff
_081E0AEC:
	ldr r0, _081E0BA0
	movs r1, 0x18
	cmp r7, r0
	bhi _081E0AF6
	movs r1, 0x10
_081E0AF6:
	ldr r0, _081E0BA4
	lsrs r2, r1
	adds r0, r2, r0
	ldrb r0, [r0]
	adds r0, r1
	movs r1, 0x20
	subs r2, r1, r0
	cmp r2, 0
	beq _081E0B22
	lsls r7, r2
	mov r0, r8
	lsls r0, r2
	mov r8, r0
	subs r1, r2
	mov r0, r10
	lsrs r0, r1
	mov r1, r8
	orrs r1, r0
	mov r8, r1
	mov r3, r10
	lsls r3, r2
	mov r10, r3
_081E0B22:
	lsrs r4, r7, 16
	mov r9, r4
	ldr r0, _081E0BA8
	ands r0, r7
	str r0, [sp]
	mov r0, r8
	mov r1, r9
	bl __umodsi3
	adds r4, r0, 0
	mov r0, r8
	mov r1, r9
	bl __udivsi3
	adds r6, r0, 0
	ldr r1, [sp]
	adds r2, r6, 0
	muls r2, r1
	lsls r4, 16
	mov r3, r10
	lsrs r0, r3, 16
	orrs r4, r0
	cmp r4, r2
	bcs _081E0B62
	subs r6, 0x1
	adds r4, r7
	cmp r4, r7
	bcc _081E0B62
	cmp r4, r2
	bcs _081E0B62
	subs r6, 0x1
	adds r4, r7
_081E0B62:
	subs r4, r2
	adds r0, r4, 0
	mov r1, r9
	bl __umodsi3
	adds r5, r0, 0
	adds r0, r4, 0
	mov r1, r9
	bl __udivsi3
	adds r1, r0, 0
	ldr r4, [sp]
	adds r2, r1, 0
	muls r2, r4
	lsls r5, 16
	ldr r0, _081E0BA8
	mov r3, r10
	ands r3, r0
	orrs r5, r3
	cmp r5, r2
	bcs _081E0B9A
	subs r1, 0x1
	adds r5, r7
	cmp r5, r7
	bcc _081E0B9A
	cmp r5, r2
	bcs _081E0B9A
	subs r1, 0x1
_081E0B9A:
	lsls r6, 16
	orrs r6, r1
	b _081E0D26
	.align 2, 0
_081E0BA0: .4byte 0x00ffffff
_081E0BA4: .4byte gUnknown_086B08F8
_081E0BA8: .4byte 0x0000ffff
_081E0BAC:
	cmp r2, 0
	bne _081E0BBA
	movs r0, 0x1
	movs r1, 0
	bl __udivsi3
	adds r7, r0, 0
_081E0BBA:
	adds r1, r7, 0
	ldr r0, _081E0BCC
	cmp r7, r0
	bhi _081E0BD0
	movs r2, 0
	cmp r7, 0xFF
	bls _081E0BDA
	movs r2, 0x8
	b _081E0BDA
	.align 2, 0
_081E0BCC: .4byte 0x0000ffff
_081E0BD0:
	ldr r0, _081E0BF8
	movs r2, 0x18
	cmp r7, r0
	bhi _081E0BDA
	movs r2, 0x10
_081E0BDA:
	ldr r0, _081E0BFC
	lsrs r1, r2
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r0, r2
	movs r1, 0x20
	subs r2, r1, r0
	cmp r2, 0
	bne _081E0C00
	mov r0, r8
	subs r0, r7
	mov r8, r0
	movs r1, 0x1
	str r1, [sp, 0x4]
	b _081E0C9E
	.align 2, 0
_081E0BF8: .4byte 0x00ffffff
_081E0BFC: .4byte gUnknown_086B08F8
_081E0C00:
	subs r1, r2
	lsls r7, r2
	mov r5, r8
	lsrs r5, r1
	mov r3, r8
	lsls r3, r2
	mov r0, r10
	lsrs r0, r1
	orrs r3, r0
	mov r8, r3
	mov r4, r10
	lsls r4, r2
	mov r10, r4
	lsrs r0, r7, 16
	mov r9, r0
	ldr r1, _081E0D1C
	ands r1, r7
	str r1, [sp, 0x8]
	adds r0, r5, 0
	mov r1, r9
	bl __umodsi3
	adds r4, r0, 0
	adds r0, r5, 0
	mov r1, r9
	bl __udivsi3
	adds r6, r0, 0
	ldr r2, [sp, 0x8]
	adds r1, r6, 0
	muls r1, r2
	lsls r4, 16
	mov r3, r8
	lsrs r0, r3, 16
	orrs r4, r0
	cmp r4, r1
	bcs _081E0C5A
	subs r6, 0x1
	adds r4, r7
	cmp r4, r7
	bcc _081E0C5A
	cmp r4, r1
	bcs _081E0C5A
	subs r6, 0x1
	adds r4, r7
_081E0C5A:
	subs r4, r1
	adds r0, r4, 0
	mov r1, r9
	bl __umodsi3
	adds r5, r0, 0
	adds r0, r4, 0
	mov r1, r9
	bl __udivsi3
	adds r2, r0, 0
	ldr r4, [sp, 0x8]
	adds r1, r2, 0
	muls r1, r4
	lsls r5, 16
	ldr r0, _081E0D1C
	mov r3, r8
	ands r3, r0
	orrs r5, r3
	cmp r5, r1
	bcs _081E0C94
	subs r2, 0x1
	adds r5, r7
	cmp r5, r7
	bcc _081E0C94
	cmp r5, r1
	bcs _081E0C94
	subs r2, 0x1
	adds r5, r7
_081E0C94:
	lsls r6, 16
	orrs r6, r2
	str r6, [sp, 0x4]
	subs r1, r5, r1
	mov r8, r1
_081E0C9E:
	lsrs r4, r7, 16
	mov r9, r4
	ldr r0, _081E0D1C
	ands r0, r7
	str r0, [sp, 0xC]
	mov r0, r8
	mov r1, r9
	bl __umodsi3
	adds r4, r0, 0
	mov r0, r8
	mov r1, r9
	bl __udivsi3
	adds r6, r0, 0
	ldr r1, [sp, 0xC]
	adds r2, r6, 0
	muls r2, r1
	lsls r4, 16
	mov r3, r10
	lsrs r0, r3, 16
	orrs r4, r0
	cmp r4, r2
	bcs _081E0CDE
	subs r6, 0x1
	adds r4, r7
	cmp r4, r7
	bcc _081E0CDE
	cmp r4, r2
	bcs _081E0CDE
	subs r6, 0x1
	adds r4, r7
_081E0CDE:
	subs r4, r2
	adds r0, r4, 0
	mov r1, r9
	bl __umodsi3
	adds r5, r0, 0
	adds r0, r4, 0
	mov r1, r9
	bl __udivsi3
	adds r1, r0, 0
	ldr r4, [sp, 0xC]
	adds r2, r1, 0
	muls r2, r4
	lsls r5, 16
	ldr r0, _081E0D1C
	mov r3, r10
	ands r3, r0
	orrs r5, r3
	cmp r5, r2
	bcs _081E0D16
	subs r1, 0x1
	adds r5, r7
	cmp r5, r7
	bcc _081E0D16
	cmp r5, r2
	bcs _081E0D16
	subs r1, 0x1
_081E0D16:
	lsls r6, 16
	orrs r6, r1
	b _081E0E76
	.align 2, 0
_081E0D1C: .4byte 0x0000ffff
_081E0D20:
	cmp r6, r8
	bls _081E0D2C
	movs r6, 0
_081E0D26:
	movs r4, 0
	str r4, [sp, 0x4]
	b _081E0E76
_081E0D2C:
	adds r1, r6, 0
	ldr r0, _081E0D40
	cmp r6, r0
	bhi _081E0D44
	movs r2, 0
	cmp r6, 0xFF
	bls _081E0D4E
	movs r2, 0x8
	b _081E0D4E
	.align 2, 0
_081E0D40: .4byte 0x0000ffff
_081E0D44:
	ldr r0, _081E0D70
	movs r2, 0x18
	cmp r6, r0
	bhi _081E0D4E
	movs r2, 0x10
_081E0D4E:
	ldr r0, _081E0D74
	lsrs r1, r2
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r0, r2
	movs r1, 0x20
	subs r2, r1, r0
	cmp r2, 0
	bne _081E0D7C
	cmp r8, r6
	bhi _081E0D68
	cmp r10, r7
	bcc _081E0D78
_081E0D68:
	movs r6, 0x1
	mov r1, r10
	b _081E0E70
	.align 2, 0
_081E0D70: .4byte 0x00ffffff
_081E0D74: .4byte gUnknown_086B08F8
_081E0D78:
	movs r6, 0
	b _081E0E72
_081E0D7C:
	subs r1, r2
	lsls r6, r2
	adds r0, r7, 0
	lsrs r0, r1
	orrs r6, r0
	lsls r7, r2
	mov r5, r8
	lsrs r5, r1
	mov r3, r8
	lsls r3, r2
	mov r0, r10
	lsrs r0, r1
	orrs r3, r0
	mov r8, r3
	mov r4, r10
	lsls r4, r2
	mov r10, r4
	lsrs r0, r6, 16
	mov r9, r0
	ldr r1, _081E0E8C
	ands r1, r6
	str r1, [sp, 0x10]
	adds r0, r5, 0
	mov r1, r9
	bl __umodsi3
	adds r4, r0, 0
	adds r0, r5, 0
	mov r1, r9
	bl __udivsi3
	adds r3, r0, 0
	ldr r2, [sp, 0x10]
	adds r1, r3, 0
	muls r1, r2
	lsls r4, 16
	mov r2, r8
	lsrs r0, r2, 16
	orrs r4, r0
	cmp r4, r1
	bcs _081E0DDE
	subs r3, 0x1
	adds r4, r6
	cmp r4, r6
	bcc _081E0DDE
	cmp r4, r1
	bcs _081E0DDE
	subs r3, 0x1
	adds r4, r6
_081E0DDE:
	subs r4, r1
	adds r0, r4, 0
	mov r1, r9
	str r3, [sp, 0x1C]
	bl __umodsi3
	adds r5, r0, 0
	adds r0, r4, 0
	mov r1, r9
	bl __udivsi3
	adds r2, r0, 0
	ldr r4, [sp, 0x10]
	adds r1, r2, 0
	muls r1, r4
	lsls r5, 16
	ldr r0, _081E0E8C
	mov r4, r8
	ands r4, r0
	orrs r5, r4
	ldr r3, [sp, 0x1C]
	cmp r5, r1
	bcs _081E0E1C
	subs r2, 0x1
	adds r5, r6
	cmp r5, r6
	bcc _081E0E1C
	cmp r5, r1
	bcs _081E0E1C
	subs r2, 0x1
	adds r5, r6
_081E0E1C:
	lsls r6, r3, 16
	orrs r6, r2
	subs r1, r5, r1
	mov r8, r1
	ldr r0, _081E0E8C
	mov r9, r0
	adds r1, r6, 0
	ands r1, r0
	lsrs r3, r6, 16
	adds r0, r7, 0
	mov r2, r9
	ands r0, r2
	lsrs r2, r7, 16
	adds r5, r1, 0
	muls r5, r0
	adds r4, r1, 0
	muls r4, r2
	adds r1, r3, 0
	muls r1, r0
	muls r3, r2
	lsrs r0, r5, 16
	adds r4, r0
	adds r4, r1
	cmp r4, r1
	bcs _081E0E54
	movs r0, 0x80
	lsls r0, 9
	adds r3, r0
_081E0E54:
	lsrs r0, r4, 16
	adds r3, r0
	mov r1, r9
	ands r4, r1
	lsls r0, r4, 16
	ands r5, r1
	adds r1, r0, r5
	cmp r3, r8
	bhi _081E0E6E
	cmp r3, r8
	bne _081E0E72
	cmp r1, r10
	bls _081E0E72
_081E0E6E:
	subs r6, 0x1
_081E0E70:
	subs r0, r1, r7
_081E0E72:
	movs r2, 0
	str r2, [sp, 0x4]
_081E0E76:
	str r6, [sp, 0x14]
	ldr r3, [sp, 0x4]
	str r3, [sp, 0x18]
	ldr r0, [sp, 0x14]
	ldr r1, [sp, 0x18]
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7,pc}
	.align 2, 0
_081E0E8C: .4byte 0x0000ffff
	thumb_func_end __udivdi3

	thumb_func_start __udivsi3
; unsigned int __udivsi3(unsigned int dividend, unsigned int divisor)
__udivsi3: ; 81E0E90
	cmp r1, 0
	beq _081E0EFE
	movs r3, 0x1
	movs r2, 0
	push {r4}
	cmp r0, r1
	bcc _081E0EF8
	movs r4, 0x1
	lsls r4, 28
_081E0EA2:
	cmp r1, r4
	bcs _081E0EB0
	cmp r1, r0
	bcs _081E0EB0
	lsls r1, 4
	lsls r3, 4
	b _081E0EA2
_081E0EB0:
	lsls r4, 3
_081E0EB2:
	cmp r1, r4
	bcs _081E0EC0
	cmp r1, r0
	bcs _081E0EC0
	lsls r1, 1
	lsls r3, 1
	b _081E0EB2
_081E0EC0:
	cmp r0, r1
	bcc _081E0EC8
	subs r0, r1
	orrs r2, r3
_081E0EC8:
	lsrs r4, r1, 1
	cmp r0, r4
	bcc _081E0ED4
	subs r0, r4
	lsrs r4, r3, 1
	orrs r2, r4
_081E0ED4:
	lsrs r4, r1, 2
	cmp r0, r4
	bcc _081E0EE0
	subs r0, r4
	lsrs r4, r3, 2
	orrs r2, r4
_081E0EE0:
	lsrs r4, r1, 3
	cmp r0, r4
	bcc _081E0EEC
	subs r0, r4
	lsrs r4, r3, 3
	orrs r2, r4
_081E0EEC:
	cmp r0, 0
	beq _081E0EF8
	lsrs r3, 4
	beq _081E0EF8
	lsrs r1, 4
	b _081E0EC0
_081E0EF8:
	adds r0, r2, 0
	pop {r4}
	mov pc, lr
_081E0EFE:
	push {lr}
	bl nullsub_1
	movs r0, 0
	pop {pc}
	thumb_func_end __udivsi3

	thumb_func_start __umodsi3
; unsigned int __umodsi3(unsigned int dividend, unsigned int divisor)
__umodsi3: ; 81E0F08
	cmp r1, 0
	beq _081E0FBE
	movs r3, 0x1
	cmp r0, r1
	bcs _081E0F14
	mov pc, lr
_081E0F14:
	push {r4}
	movs r4, 0x1
	lsls r4, 28
_081E0F1A:
	cmp r1, r4
	bcs _081E0F28
	cmp r1, r0
	bcs _081E0F28
	lsls r1, 4
	lsls r3, 4
	b _081E0F1A
_081E0F28:
	lsls r4, 3
_081E0F2A:
	cmp r1, r4
	bcs _081E0F38
	cmp r1, r0
	bcs _081E0F38
	lsls r1, 1
	lsls r3, 1
	b _081E0F2A
_081E0F38:
	movs r2, 0
	cmp r0, r1
	bcc _081E0F40
	subs r0, r1
_081E0F40:
	lsrs r4, r1, 1
	cmp r0, r4
	bcc _081E0F52
	subs r0, r4
	mov r12, r3
	movs r4, 0x1
	rors r3, r4
	orrs r2, r3
	mov r3, r12
_081E0F52:
	lsrs r4, r1, 2
	cmp r0, r4
	bcc _081E0F64
	subs r0, r4
	mov r12, r3
	movs r4, 0x2
	rors r3, r4
	orrs r2, r3
	mov r3, r12
_081E0F64:
	lsrs r4, r1, 3
	cmp r0, r4
	bcc _081E0F76
	subs r0, r4
	mov r12, r3
	movs r4, 0x3
	rors r3, r4
	orrs r2, r3
	mov r3, r12
_081E0F76:
	mov r12, r3
	cmp r0, 0
	beq _081E0F84
	lsrs r3, 4
	beq _081E0F84
	lsrs r1, 4
	b _081E0F38
_081E0F84:
	movs r4, 0xE
	lsls r4, 28
	ands r2, r4
	bne _081E0F90
	pop {r4}
	mov pc, lr
_081E0F90:
	mov r3, r12
	movs r4, 0x3
	rors r3, r4
	tst r2, r3
	beq _081E0F9E
	lsrs r4, r1, 3
	adds r0, r4
_081E0F9E:
	mov r3, r12
	movs r4, 0x2
	rors r3, r4
	tst r2, r3
	beq _081E0FAC
	lsrs r4, r1, 2
	adds r0, r4
_081E0FAC:
	mov r3, r12
	movs r4, 0x1
	rors r3, r4
	tst r2, r3
	beq _081E0FBA
	lsrs r4, r1, 1
	adds r0, r4
_081E0FBA:
	pop {r4}
	mov pc, lr
_081E0FBE:
	push {lr}
	bl nullsub_1
	movs r0, 0
	pop {pc}
	thumb_func_end __umodsi3

	thumb_func_start __pack_d
__pack_d: ; 81E0FC8
	push {r4-r7,lr}
	sub sp, 0x8
	adds r1, r0, 0
	ldr r4, [r1, 0xC]
	ldr r5, [r1, 0x10]
	ldr r7, [r1, 0x4]
	movs r6, 0
	movs r2, 0
	ldr r0, [r1]
	cmp r0, 0x1
	bhi _081E0FE0
	movs r2, 0x1
_081E0FE0:
	cmp r2, 0
	beq _081E1000
	ldr r6, _081E0FF4
	ldr r2, _081E0FF8
	ldr r3, _081E0FFC
	adds r0, r4, 0
	adds r1, r5, 0
	orrs r1, r3
	b _081E10B8
	.align 2, 0
_081E0FF4: .4byte 0x000007ff
_081E0FF8: .4byte 0x00000000
_081E0FFC: .4byte 0x00080000
_081E1000:
	movs r2, 0
	cmp r0, 0x4
	bne _081E1008
	movs r2, 0x1
_081E1008:
	cmp r2, 0
	bne _081E1054
	movs r2, 0
	cmp r0, 0x2
	bne _081E1014
	movs r2, 0x1
_081E1014:
	cmp r2, 0
	beq _081E101E
	movs r4, 0
	movs r5, 0
	b _081E10BC
_081E101E:
	adds r0, r5, 0
	orrs r0, r4
	cmp r0, 0
	beq _081E10BC
	ldr r2, [r1, 0x8]
	ldr r0, _081E103C
	cmp r2, r0
	bge _081E104E
	subs r2, r0, r2
	cmp r2, 0x38
	ble _081E1040
	movs r4, 0
	movs r5, 0
	b _081E10AE
	.align 2, 0
_081E103C: .4byte 0xfffffc02
_081E1040:
	adds r1, r5, 0
	adds r0, r4, 0
	bl __lshrdi3
	adds r5, r1, 0
	adds r4, r0, 0
	b _081E10AE
_081E104E:
	ldr r0, _081E105C
	cmp r2, r0
	ble _081E1064
_081E1054:
	ldr r6, _081E1060
	movs r4, 0
	movs r5, 0
	b _081E10BC
	.align 2, 0
_081E105C: .4byte 0x000003ff
_081E1060: .4byte 0x000007ff
_081E1064:
	ldr r0, _081E108C
	adds r6, r2, r0
	movs r0, 0xFF
	adds r1, r4, 0
	ands r1, r0
	movs r2, 0
	cmp r1, 0x80
	bne _081E1090
	cmp r2, 0
	bne _081E1090
	adds r0, 0x1
	adds r1, r4, 0
	ands r1, r0
	adds r0, r2, 0
	orrs r0, r1
	cmp r0, 0
	beq _081E1098
	movs r0, 0x80
	movs r1, 0
	b _081E1094
	.align 2, 0
_081E108C: .4byte 0x000003ff
_081E1090:
	movs r0, 0x7F
	movs r1, 0
_081E1094:
	adds r4, r0
	adcs r5, r1
_081E1098:
	ldr r0, _081E10FC
	cmp r5, r0
	bls _081E10AE
	lsls r3, r5, 31
	lsrs r2, r4, 1
	adds r0, r3, 0
	orrs r0, r2
	lsrs r1, r5, 1
	adds r5, r1, 0
	adds r4, r0, 0
	adds r6, 0x1
_081E10AE:
	lsls r3, r5, 24
	lsrs r2, r4, 8
	adds r0, r3, 0
	orrs r0, r2
	lsrs r1, r5, 8
_081E10B8:
	adds r5, r1, 0
	adds r4, r0, 0
_081E10BC:
	str r4, [sp]
	ldr r2, _081E1100
	ands r2, r5
	ldr r0, [sp, 0x4]
	ldr r1, _081E1104
	ands r0, r1
	orrs r0, r2
	str r0, [sp, 0x4]
	mov r2, sp
	ldr r1, _081E1108
	adds r0, r1, 0
	ands r6, r0
	lsls r1, r6, 4
	ldr r0, _081E110C
	ldrh r3, [r2, 0x6]
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x6]
	lsls r1, r7, 7
	movs r0, 0x7F
	ldrb r3, [r2, 0x7]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x7]
	ldr r1, [sp]
	ldr r0, [sp, 0x4]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	add sp, 0x8
	pop {r4-r7,pc}
	.align 2, 0
_081E10FC: .4byte 0x1fffffff
_081E1100: .4byte 0x000fffff
_081E1104: .4byte 0xfff00000
_081E1108: .4byte 0x000007ff
_081E110C: .4byte 0xffff800f
	thumb_func_end __pack_d

	thumb_func_start __unpack_d
__unpack_d: ; 81E1110
	push {r4-r7,lr}
	sub sp, 0x8
	adds r2, r0, 0
	adds r6, r1, 0
	ldr r1, [r2, 0x4]
	str r1, [sp]
	ldr r0, [r2]
	str r0, [sp, 0x4]
	mov r2, sp
	adds r4, r1, 0
	lsls r0, 12
	lsrs r5, r0, 12
	ldrh r3, [r2, 0x6]
	lsls r0, r3, 17
	lsrs r3, r0, 21
	ldrb r2, [r2, 0x7]
	lsrs r0, r2, 7
	str r0, [r6, 0x4]
	cmp r3, 0
	bne _081E1184
	orrs r1, r5
	cmp r1, 0
	bne _081E1144
	movs r0, 0x2
	str r0, [r6]
	b _081E11D8
_081E1144:
	ldr r0, _081E117C
	str r0, [r6, 0x8]
	lsrs r3, r4, 24
	lsls r2, r5, 8
	adds r1, r3, 0
	orrs r1, r2
	lsls r0, r4, 8
	adds r5, r1, 0
	adds r4, r0, 0
	movs r0, 0x3
	str r0, [r6]
	ldr r0, _081E1180
	cmp r5, r0
	bhi _081E11B4
	adds r7, r0, 0
_081E1162:
	lsrs r3, r4, 31
	lsls r2, r5, 1
	adds r1, r3, 0
	orrs r1, r2
	lsls r0, r4, 1
	adds r5, r1, 0
	adds r4, r0, 0
	ldr r0, [r6, 0x8]
	subs r0, 0x1
	str r0, [r6, 0x8]
	cmp r5, r7
	bls _081E1162
	b _081E11B4
	.align 2, 0
_081E117C: .4byte 0xfffffc02
_081E1180: .4byte 0x0fffffff
_081E1184:
	ldr r0, _081E1198
	cmp r3, r0
	bne _081E11BA
	orrs r1, r5
	cmp r1, 0
	bne _081E119C
	movs r0, 0x4
	str r0, [r6]
	b _081E11D8
	.align 2, 0
_081E1198: .4byte 0x000007ff
_081E119C:
	movs r2, 0x80
	lsls r2, 12
	movs r0, 0
	adds r1, r5, 0
	ands r1, r2
	orrs r1, r0
	cmp r1, 0
	beq _081E11B2
	movs r0, 0x1
	str r0, [r6]
	b _081E11B4
_081E11B2:
	str r1, [r6]
_081E11B4:
	str r4, [r6, 0xC]
	str r5, [r6, 0x10]
	b _081E11D8
_081E11BA:
	ldr r1, _081E11DC
	adds r0, r3, r1
	str r0, [r6, 0x8]
	movs r0, 0x3
	str r0, [r6]
	lsrs r3, r4, 24
	lsls r2, r5, 8
	adds r1, r3, 0
	orrs r1, r2
	lsls r0, r4, 8
	ldr r2, _081E11E0
	ldr r3, _081E11E4
	orrs r1, r3
	str r0, [r6, 0xC]
	str r1, [r6, 0x10]
_081E11D8:
	add sp, 0x8
	pop {r4-r7,pc}
	.align 2, 0
_081E11DC: .4byte 0xfffffc01
_081E11E0: .4byte 0x00000000
_081E11E4: .4byte 0x10000000
	thumb_func_end __unpack_d

	thumb_func_start __fpadd_parts_d
__fpadd_parts_d: ; 81E11E8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	adds r3, r0, 0
	adds r4, r1, 0
	mov r10, r2
	movs r0, 0
	ldr r2, [r3]
	cmp r2, 0x1
	bhi _081E1204
	movs r0, 0x1
_081E1204:
	cmp r0, 0
	beq _081E120C
_081E1208:
	adds r0, r3, 0
	b _081E1444
_081E120C:
	movs r1, 0
	ldr r0, [r4]
	cmp r0, 0x1
	bhi _081E1216
	movs r1, 0x1
_081E1216:
	cmp r1, 0
	bne _081E128E
	movs r1, 0
	cmp r2, 0x4
	bne _081E1222
	movs r1, 0x1
_081E1222:
	cmp r1, 0
	beq _081E1244
	movs r1, 0
	cmp r0, 0x4
	bne _081E122E
	movs r1, 0x1
_081E122E:
	cmp r1, 0
	beq _081E1208
	ldr r1, [r3, 0x4]
	ldr r0, [r4, 0x4]
	cmp r1, r0
	beq _081E1208
	ldr r0, _081E1240
	b _081E1444
	.align 2, 0
_081E1240: .4byte 0x03000f38
_081E1244:
	movs r1, 0
	cmp r0, 0x4
	bne _081E124C
	movs r1, 0x1
_081E124C:
	cmp r1, 0
	bne _081E128E
	movs r1, 0
	cmp r0, 0x2
	bne _081E1258
	movs r1, 0x1
_081E1258:
	cmp r1, 0
	beq _081E1280
	movs r0, 0
	cmp r2, 0x2
	bne _081E1264
	movs r0, 0x1
_081E1264:
	cmp r0, 0
	beq _081E1208
	mov r1, r10
	adds r0, r3, 0
	ldm r0!, {r2,r5,r6}
	stm r1!, {r2,r5,r6}
	ldm r0!, {r2,r5}
	stm r1!, {r2,r5}
	ldr r0, [r3, 0x4]
	ldr r1, [r4, 0x4]
	ands r0, r1
	mov r6, r10
	str r0, [r6, 0x4]
	b _081E1442
_081E1280:
	movs r1, 0
	ldr r0, [r3]
	cmp r0, 0x2
	bne _081E128A
	movs r1, 0x1
_081E128A:
	cmp r1, 0
	beq _081E1292
_081E128E:
	adds r0, r4, 0
	b _081E1444
_081E1292:
	ldr r0, [r3, 0x8]
	mov r9, r0
	ldr r1, [r4, 0x8]
	mov r8, r1
	ldr r6, [r3, 0xC]
	ldr r7, [r3, 0x10]
	ldr r0, [r4, 0xC]
	ldr r1, [r4, 0x10]
	str r0, [sp]
	str r1, [sp, 0x4]
	mov r1, r9
	mov r2, r8
	subs r0, r1, r2
	cmp r0, 0
	bge _081E12B2
	negs r0, r0
_081E12B2:
	cmp r0, 0x3F
	bgt _081E1330
	ldr r3, [r3, 0x4]
	mov r12, r3
	ldr r4, [r4, 0x4]
	str r4, [sp, 0x8]
	cmp r9, r8
	ble _081E12FC
	mov r3, r9
	mov r4, r8
	subs r3, r4
	mov r8, r3
_081E12CA:
	movs r5, 0x1
	negs r5, r5
	add r8, r5
	ldr r2, [sp]
	movs r0, 0x1
	ands r2, r0
	movs r3, 0
	ldr r1, [sp, 0x4]
	lsls r5, r1, 31
	ldr r0, [sp]
	lsrs r4, r0, 1
	adds r0, r5, 0
	orrs r0, r4
	adds r4, r1, 0
	lsrs r1, r4, 1
	adds r5, r2, 0
	orrs r5, r0
	str r5, [sp]
	adds r4, r3, 0
	orrs r4, r1
	str r4, [sp, 0x4]
	mov r5, r8
	cmp r5, 0
	bne _081E12CA
	mov r8, r9
_081E12FC:
	cmp r8, r9
	ble _081E134C
	mov r0, r8
	mov r1, r9
	subs r0, r1
	mov r9, r0
_081E1308:
	movs r2, 0x1
	negs r2, r2
	add r9, r2
	movs r2, 0x1
	ands r2, r6
	movs r3, 0
	lsls r5, r7, 31
	lsrs r4, r6, 1
	adds r0, r5, 0
	orrs r0, r4
	lsrs r1, r7, 1
	adds r6, r2, 0
	orrs r6, r0
	adds r7, r3, 0
	orrs r7, r1
	mov r3, r9
	cmp r3, 0
	bne _081E1308
	mov r9, r8
	b _081E134C
_081E1330:
	cmp r9, r8
	ble _081E133E
	movs r0, 0
	movs r1, 0
	str r0, [sp]
	str r1, [sp, 0x4]
	b _081E1344
_081E133E:
	mov r9, r8
	movs r6, 0
	movs r7, 0
_081E1344:
	ldr r3, [r3, 0x4]
	mov r12, r3
	ldr r4, [r4, 0x4]
	str r4, [sp, 0x8]
_081E134C:
	ldr r1, [sp, 0x8]
	cmp r12, r1
	beq _081E13F4
	mov r2, r12
	cmp r2, 0
	beq _081E136E
	adds r1, r7, 0
	adds r0, r6, 0
	bl __negdi2
	adds r3, r1, 0
	adds r2, r0, 0
	ldr r4, [sp]
	ldr r5, [sp, 0x4]
	adds r2, r4
	adcs r3, r5
	b _081E137A
_081E136E:
	adds r3, r7, 0
	adds r2, r6, 0
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	subs r2, r0
	sbcs r3, r1
_081E137A:
	cmp r3, 0
	blt _081E1390
	movs r0, 0
	mov r1, r10
	str r0, [r1, 0x4]
	mov r4, r9
	str r4, [r1, 0x8]
	mov r5, r10
	str r2, [r5, 0xC]
	str r3, [r5, 0x10]
	b _081E13A8
_081E1390:
	movs r0, 0x1
	mov r6, r10
	str r0, [r6, 0x4]
	mov r0, r9
	str r0, [r6, 0x8]
	adds r1, r3, 0
	adds r0, r2, 0
	bl __negdi2
	mov r2, r10
	str r0, [r2, 0xC]
	str r1, [r2, 0x10]
_081E13A8:
	mov r4, r10
	ldr r2, [r4, 0xC]
	ldr r3, [r4, 0x10]
	movs r0, 0x1
	negs r0, r0
	asrs r1, r0, 31
_081E13B4:
	adds r2, r0
	adcs r3, r1
	ldr r0, _081E13F0
	cmp r3, r0
	bhi _081E140C
	cmp r3, r0
	bne _081E13CA
	movs r0, 0x2
	negs r0, r0
	cmp r2, r0
	bhi _081E140C
_081E13CA:
	mov r5, r10
	ldr r0, [r5, 0xC]
	ldr r1, [r5, 0x10]
	lsrs r3, r0, 31
	lsls r2, r1, 1
	adds r1, r3, 0
	orrs r1, r2
	lsls r0, 1
	mov r6, r10
	str r0, [r6, 0xC]
	str r1, [r6, 0x10]
	ldr r2, [r6, 0x8]
	subs r2, 0x1
	str r2, [r6, 0x8]
	movs r2, 0x1
	negs r2, r2
	asrs r3, r2, 31
	b _081E13B4
	.align 2, 0
_081E13F0: .4byte 0x0fffffff
_081E13F4:
	mov r0, r12
	mov r1, r10
	str r0, [r1, 0x4]
	mov r2, r9
	str r2, [r1, 0x8]
	ldr r3, [sp]
	ldr r4, [sp, 0x4]
	adds r6, r3
	adcs r7, r4
	mov r4, r10
	str r6, [r4, 0xC]
	str r7, [r4, 0x10]
_081E140C:
	movs r0, 0x3
	mov r5, r10
	str r0, [r5]
	ldr r1, [r5, 0x10]
	ldr r0, _081E1450
	cmp r1, r0
	bls _081E1442
	ldr r4, [r5, 0xC]
	ldr r5, [r5, 0x10]
	movs r2, 0x1
	adds r0, r4, 0
	ands r0, r2
	movs r1, 0
	lsls r6, r5, 31
	mov r8, r6
	lsrs r6, r4, 1
	mov r2, r8
	orrs r2, r6
	lsrs r3, r5, 1
	orrs r0, r2
	orrs r1, r3
	mov r2, r10
	str r0, [r2, 0xC]
	str r1, [r2, 0x10]
	ldr r0, [r2, 0x8]
	adds r0, 0x1
	str r0, [r2, 0x8]
_081E1442:
	mov r0, r10
_081E1444:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7,pc}
	.align 2, 0
_081E1450: .4byte 0x1fffffff
	thumb_func_end __fpadd_parts_d

	thumb_func_start __adddf3
; double __adddf3(double arg_a, double arg_b)
__adddf3: ; 81E1454
	push {r4,lr}
	sub sp, 0x4C
	str r0, [sp, 0x3C]
	str r1, [sp, 0x40]
	str r2, [sp, 0x44]
	str r3, [sp, 0x48]
	add r0, sp, 0x3C
	mov r1, sp
	bl __unpack_d
	add r0, sp, 0x44
	add r4, sp, 0x14
	adds r1, r4, 0
	bl __unpack_d
	add r2, sp, 0x28
	mov r0, sp
	adds r1, r4, 0
	bl __fpadd_parts_d
	bl __pack_d
	add sp, 0x4C
	pop {r4,pc}
	thumb_func_end __adddf3

	thumb_func_start __subdf3
__subdf3: ; 81E1484
	push {r4,lr}
	sub sp, 0x4C
	str r0, [sp, 0x3C]
	str r1, [sp, 0x40]
	str r2, [sp, 0x44]
	str r3, [sp, 0x48]
	add r0, sp, 0x3C
	mov r1, sp
	bl __unpack_d
	add r0, sp, 0x44
	add r4, sp, 0x14
	adds r1, r4, 0
	bl __unpack_d
	ldr r0, [r4, 0x4]
	movs r1, 0x1
	eors r0, r1
	str r0, [r4, 0x4]
	add r2, sp, 0x28
	mov r0, sp
	adds r1, r4, 0
	bl __fpadd_parts_d
	bl __pack_d
	add sp, 0x4C
	pop {r4,pc}
	thumb_func_end __subdf3

	thumb_func_start __muldf3
__muldf3: ; 81E14BC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x74
	str r0, [sp, 0x3C]
	str r1, [sp, 0x40]
	str r2, [sp, 0x44]
	str r3, [sp, 0x48]
	add r0, sp, 0x3C
	mov r1, sp
	bl __unpack_d
	add r0, sp, 0x44
	add r4, sp, 0x14
	adds r1, r4, 0
	bl __unpack_d
	mov r8, sp
	add r0, sp, 0x28
	mov r10, r0
	movs r0, 0
	ldr r1, [sp]
	cmp r1, 0x1
	bhi _081E14F2
	movs r0, 0x1
_081E14F2:
	cmp r0, 0
	bne _081E1556
	movs r2, 0
	ldr r0, [sp, 0x14]
	cmp r0, 0x1
	bhi _081E1500
	movs r2, 0x1
_081E1500:
	cmp r2, 0
	beq _081E1508
	ldr r0, [sp, 0x4]
	b _081E1578
_081E1508:
	movs r2, 0
	cmp r1, 0x4
	bne _081E1510
	movs r2, 0x1
_081E1510:
	cmp r2, 0
	beq _081E1522
	movs r1, 0
	cmp r0, 0x2
	bne _081E151C
	movs r1, 0x1
_081E151C:
	cmp r1, 0
	bne _081E153A
	b _081E1556
_081E1522:
	movs r2, 0
	cmp r0, 0x4
	bne _081E152A
	movs r2, 0x1
_081E152A:
	cmp r2, 0
	beq _081E154A
	movs r0, 0
	cmp r1, 0x2
	bne _081E1536
	movs r0, 0x1
_081E1536:
	cmp r0, 0
	beq _081E1544
_081E153A:
	ldr r0, _081E1540
	b _081E1742
	.align 2, 0
_081E1540: .4byte 0x03000f38
_081E1544:
	mov r1, r8
	ldr r0, [r1, 0x4]
	b _081E1578
_081E154A:
	movs r2, 0
	cmp r1, 0x2
	bne _081E1552
	movs r2, 0x1
_081E1552:
	cmp r2, 0
	beq _081E1568
_081E1556:
	ldr r0, [sp, 0x4]
	ldr r1, [sp, 0x18]
	eors r0, r1
	negs r1, r0
	orrs r1, r0
	lsrs r1, 31
	str r1, [sp, 0x4]
	mov r0, sp
	b _081E1742
_081E1568:
	movs r1, 0
	cmp r0, 0x2
	bne _081E1570
	movs r1, 0x1
_081E1570:
	cmp r1, 0
	beq _081E1588
	mov r2, r8
	ldr r0, [r2, 0x4]
_081E1578:
	ldr r1, [sp, 0x18]
	eors r0, r1
	negs r1, r0
	orrs r1, r0
	lsrs r1, 31
	str r1, [sp, 0x18]
	adds r0, r4, 0
	b _081E1742
_081E1588:
	mov r4, r8
	ldr r0, [r4, 0xC]
	ldr r1, [r4, 0x10]
	adds r6, r0, 0
	movs r7, 0
	str r1, [sp, 0x4C]
	movs r5, 0
	str r5, [sp, 0x50]
	ldr r0, [sp, 0x20]
	ldr r1, [sp, 0x24]
	adds r4, r0, 0
	str r1, [sp, 0x54]
	movs r0, 0
	str r0, [sp, 0x58]
	adds r1, r5, 0
	adds r0, r4, 0
	adds r3, r7, 0
	adds r2, r6, 0
	bl __muldi3
	str r0, [sp, 0x5C]
	str r1, [sp, 0x60]
	ldr r0, [sp, 0x54]
	ldr r1, [sp, 0x58]
	adds r3, r7, 0
	adds r2, r6, 0
	bl __muldi3
	adds r7, r1, 0
	adds r6, r0, 0
	adds r1, r5, 0
	adds r0, r4, 0
	ldr r2, [sp, 0x4C]
	ldr r3, [sp, 0x50]
	bl __muldi3
	adds r5, r1, 0
	adds r4, r0, 0
	ldr r0, [sp, 0x54]
	ldr r1, [sp, 0x58]
	ldr r2, [sp, 0x4C]
	ldr r3, [sp, 0x50]
	bl __muldi3
	str r0, [sp, 0x64]
	str r1, [sp, 0x68]
	movs r1, 0
	movs r2, 0
	str r1, [sp, 0x6C]
	str r2, [sp, 0x70]
	adds r3, r7, 0
	adds r2, r6, 0
	adds r2, r4
	adcs r3, r5
	cmp r7, r3
	bhi _081E1600
	cmp r7, r3
	bne _081E1608
	cmp r6, r2
	bls _081E1608
_081E1600:
	ldr r5, _081E1758
	ldr r4, _081E1754
	str r4, [sp, 0x6C]
	str r5, [sp, 0x70]
_081E1608:
	adds r1, r2, 0
	movs r6, 0
	adds r7, r1, 0
	ldr r0, [sp, 0x5C]
	ldr r1, [sp, 0x60]
	adds r6, r0
	adcs r7, r1
	cmp r1, r7
	bhi _081E1624
	ldr r1, [sp, 0x60]
	cmp r1, r7
	bne _081E1634
	cmp r0, r6
	bls _081E1634
_081E1624:
	movs r0, 0x1
	movs r1, 0
	ldr r4, [sp, 0x6C]
	ldr r5, [sp, 0x70]
	adds r4, r0
	adcs r5, r1
	str r4, [sp, 0x6C]
	str r5, [sp, 0x70]
_081E1634:
	adds r0, r3, 0
	adds r2, r0, 0
	movs r3, 0
	adds r5, r3, 0
	adds r4, r2, 0
	ldr r0, [sp, 0x64]
	ldr r1, [sp, 0x68]
	adds r4, r0
	adcs r5, r1
	ldr r1, [sp, 0x6C]
	ldr r2, [sp, 0x70]
	adds r4, r1
	adcs r5, r2
	mov r0, r8
	ldr r2, [r0, 0x8]
	ldr r0, [sp, 0x1C]
	adds r2, r0
	str r2, [sp, 0x30]
	mov r0, r8
	ldr r1, [r0, 0x4]
	ldr r0, [sp, 0x18]
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	str r0, [sp, 0x2C]
	adds r2, 0x4
	str r2, [sp, 0x30]
	ldr r0, _081E175C
	cmp r5, r0
	bls _081E16B6
	movs r1, 0x1
	mov r9, r1
	mov r8, r0
	mov r12, r2
_081E167A:
	movs r2, 0x1
	add r12, r2
	mov r0, r9
	ands r0, r4
	cmp r0, 0
	beq _081E16A0
	lsls r3, r7, 31
	lsrs r2, r6, 1
	adds r0, r3, 0
	orrs r0, r2
	lsrs r1, r7, 1
	adds r7, r1, 0
	adds r6, r0, 0
	adds r0, r6, 0
	movs r1, 0x80
	lsls r1, 24
	orrs r1, r7
	adds r7, r1, 0
	adds r6, r0, 0
_081E16A0:
	lsls r3, r5, 31
	lsrs r2, r4, 1
	adds r0, r3, 0
	orrs r0, r2
	lsrs r1, r5, 1
	adds r5, r1, 0
	adds r4, r0, 0
	cmp r5, r8
	bhi _081E167A
	mov r0, r12
	str r0, [sp, 0x30]
_081E16B6:
	ldr r0, _081E1760
	cmp r5, r0
	bhi _081E1708
	movs r1, 0x80
	lsls r1, 24
	mov r9, r1
	mov r8, r0
	ldr r2, [sp, 0x30]
	mov r12, r2
_081E16C8:
	movs r0, 0x1
	negs r0, r0
	add r12, r0
	lsrs r3, r4, 31
	lsls r2, r5, 1
	adds r1, r3, 0
	orrs r1, r2
	lsls r0, r4, 1
	adds r5, r1, 0
	adds r4, r0, 0
	movs r0, 0
	mov r1, r9
	ands r1, r7
	orrs r0, r1
	cmp r0, 0
	beq _081E16F2
	movs r0, 0x1
	orrs r0, r4
	adds r1, r5, 0
	adds r5, r1, 0
	adds r4, r0, 0
_081E16F2:
	lsrs r3, r6, 31
	lsls r2, r7, 1
	adds r1, r3, 0
	orrs r1, r2
	lsls r0, r6, 1
	adds r7, r1, 0
	adds r6, r0, 0
	cmp r5, r8
	bls _081E16C8
	mov r1, r12
	str r1, [sp, 0x30]
_081E1708:
	movs r0, 0xFF
	adds r1, r4, 0
	ands r1, r0
	movs r2, 0
	cmp r1, 0x80
	bne _081E1736
	cmp r2, 0
	bne _081E1736
	adds r0, 0x1
	adds r1, r4, 0
	ands r1, r0
	adds r0, r2, 0
	orrs r0, r1
	cmp r0, 0
	bne _081E172E
	adds r0, r7, 0
	orrs r0, r6
	cmp r0, 0
	beq _081E1736
_081E172E:
	movs r0, 0x80
	movs r1, 0
	adds r4, r0
	adcs r5, r1
_081E1736:
	str r4, [sp, 0x34]
	str r5, [sp, 0x38]
	movs r0, 0x3
	mov r2, r10
	str r0, [r2]
	add r0, sp, 0x28
_081E1742:
	bl __pack_d
	add sp, 0x74
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7,pc}
	.align 2, 0
_081E1754: .4byte 0x00000000
_081E1758: .4byte 0x00000001
_081E175C: .4byte 0x1fffffff
_081E1760: .4byte 0x0fffffff
	thumb_func_end __muldf3

	thumb_func_start __divdf3
__divdf3: ; 81E1764
	push {r4-r7,lr}
	sub sp, 0x48
	str r0, [sp, 0x28]
	str r1, [sp, 0x2C]
	str r2, [sp, 0x30]
	str r3, [sp, 0x34]
	add r0, sp, 0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, 0x30
	add r4, sp, 0x14
	adds r1, r4, 0
	bl __unpack_d
	mov r12, sp
	movs r0, 0
	ldr r3, [sp]
	cmp r3, 0x1
	bhi _081E178E
	movs r0, 0x1
_081E178E:
	cmp r0, 0
	beq _081E1796
	mov r1, sp
	b _081E18D8
_081E1796:
	movs r0, 0
	ldr r2, [sp, 0x14]
	adds r5, r2, 0
	cmp r2, 0x1
	bhi _081E17A2
	movs r0, 0x1
_081E17A2:
	cmp r0, 0
	beq _081E17AA
	adds r1, r4, 0
	b _081E18D8
_081E17AA:
	ldr r0, [sp, 0x4]
	ldr r1, [sp, 0x18]
	eors r0, r1
	str r0, [sp, 0x4]
	movs r0, 0
	cmp r3, 0x4
	bne _081E17BA
	movs r0, 0x1
_081E17BA:
	cmp r0, 0
	bne _081E17CA
	movs r4, 0
	cmp r3, 0x2
	bne _081E17C6
	movs r4, 0x1
_081E17C6:
	cmp r4, 0
	beq _081E17DC
_081E17CA:
	mov r1, r12
	ldr r0, [r1]
	cmp r0, r5
	beq _081E17D4
	b _081E18D8
_081E17D4:
	ldr r1, _081E17D8
	b _081E18D8
	.align 2, 0
_081E17D8: .4byte 0x03000f38
_081E17DC:
	movs r0, 0
	cmp r2, 0x4
	bne _081E17E4
	movs r0, 0x1
_081E17E4:
	cmp r0, 0
	beq _081E17F6
	movs r0, 0
	movs r1, 0
	str r0, [sp, 0xC]
	str r1, [sp, 0x10]
	str r4, [sp, 0x8]
	mov r1, sp
	b _081E18D8
_081E17F6:
	movs r0, 0
	cmp r2, 0x2
	bne _081E17FE
	movs r0, 0x1
_081E17FE:
	cmp r0, 0
	beq _081E180A
	movs r0, 0x4
	mov r2, r12
	str r0, [r2]
	b _081E18D6
_081E180A:
	mov r3, r12
	ldr r1, [r3, 0x8]
	ldr r0, [sp, 0x1C]
	subs r6, r1, r0
	str r6, [r3, 0x8]
	ldr r4, [r3, 0xC]
	ldr r5, [r3, 0x10]
	ldr r0, [sp, 0x20]
	ldr r1, [sp, 0x24]
	str r0, [sp, 0x38]
	str r1, [sp, 0x3C]
	cmp r1, r5
	bhi _081E182E
	ldr r1, [sp, 0x3C]
	cmp r1, r5
	bne _081E1842
	cmp r0, r4
	bls _081E1842
_081E182E:
	lsrs r3, r4, 31
	lsls r2, r5, 1
	adds r1, r3, 0
	orrs r1, r2
	lsls r0, r4, 1
	adds r5, r1, 0
	adds r4, r0, 0
	subs r0, r6, 0x1
	mov r2, r12
	str r0, [r2, 0x8]
_081E1842:
	ldr r7, _081E18E8
	ldr r6, _081E18E4
	movs r0, 0
	movs r1, 0
	str r0, [sp, 0x40]
	str r1, [sp, 0x44]
_081E184E:
	ldr r1, [sp, 0x3C]
	cmp r1, r5
	bhi _081E1872
	cmp r1, r5
	bne _081E185E
	ldr r2, [sp, 0x38]
	cmp r2, r4
	bhi _081E1872
_081E185E:
	ldr r0, [sp, 0x40]
	orrs r0, r6
	ldr r1, [sp, 0x44]
	orrs r1, r7
	str r0, [sp, 0x40]
	str r1, [sp, 0x44]
	ldr r0, [sp, 0x38]
	ldr r1, [sp, 0x3C]
	subs r4, r0
	sbcs r5, r1
_081E1872:
	lsls r3, r7, 31
	lsrs r2, r6, 1
	adds r0, r3, 0
	orrs r0, r2
	lsrs r1, r7, 1
	adds r7, r1, 0
	adds r6, r0, 0
	lsrs r3, r4, 31
	lsls r2, r5, 1
	adds r1, r3, 0
	orrs r1, r2
	lsls r0, r4, 1
	adds r5, r1, 0
	adds r4, r0, 0
	adds r0, r7, 0
	orrs r0, r6
	cmp r0, 0
	bne _081E184E
	movs r0, 0xFF
	ldr r1, [sp, 0x40]
	ands r1, r0
	movs r2, 0
	cmp r1, 0x80
	bne _081E18CC
	cmp r2, 0
	bne _081E18CC
	adds r0, 0x1
	ldr r1, [sp, 0x40]
	ands r1, r0
	adds r0, r2, 0
	orrs r0, r1
	cmp r0, 0
	bne _081E18BC
	adds r0, r5, 0
	orrs r0, r4
	cmp r0, 0
	beq _081E18CC
_081E18BC:
	movs r0, 0x80
	movs r1, 0
	ldr r2, [sp, 0x40]
	ldr r3, [sp, 0x44]
	adds r2, r0
	adcs r3, r1
	str r2, [sp, 0x40]
	str r3, [sp, 0x44]
_081E18CC:
	ldr r0, [sp, 0x40]
	ldr r1, [sp, 0x44]
	mov r2, r12
	str r0, [r2, 0xC]
	str r1, [r2, 0x10]
_081E18D6:
	mov r1, r12
_081E18D8:
	adds r0, r1, 0
	bl __pack_d
	add sp, 0x48
	pop {r4-r7,pc}
	.align 2, 0
_081E18E4: .4byte 0x00000000
_081E18E8: .4byte 0x10000000
	thumb_func_end __divdf3

	thumb_func_start __fpcmp_parts_d
__fpcmp_parts_d: ; 81E18EC
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	movs r0, 0
	ldr r1, [r5]
	cmp r1, 0x1
	bhi _081E18FC
	movs r0, 0x1
_081E18FC:
	cmp r0, 0
	bne _081E190E
	movs r0, 0
	ldr r2, [r6]
	cmp r2, 0x1
	bhi _081E190A
	movs r0, 0x1
_081E190A:
	cmp r0, 0
	beq _081E1912
_081E190E:
	movs r0, 0x1
	b _081E19E8
_081E1912:
	movs r0, 0
	cmp r1, 0x4
	bne _081E191A
	movs r0, 0x1
_081E191A:
	cmp r0, 0
	beq _081E1932
	movs r0, 0
	cmp r2, 0x4
	bne _081E1926
	movs r0, 0x1
_081E1926:
	cmp r0, 0
	beq _081E1932
	ldr r0, [r6, 0x4]
	ldr r1, [r5, 0x4]
	subs r0, r1
	b _081E19E8
_081E1932:
	movs r1, 0
	ldr r0, [r5]
	cmp r0, 0x4
	bne _081E193C
	movs r1, 0x1
_081E193C:
	cmp r1, 0
	bne _081E198A
	movs r1, 0
	cmp r2, 0x4
	bne _081E1948
	movs r1, 0x1
_081E1948:
	cmp r1, 0
	beq _081E195A
_081E194C:
	ldr r0, [r6, 0x4]
	movs r1, 0x1
	negs r1, r1
	cmp r0, 0
	beq _081E1994
	movs r1, 0x1
	b _081E1994
_081E195A:
	movs r1, 0
	cmp r0, 0x2
	bne _081E1962
	movs r1, 0x1
_081E1962:
	cmp r1, 0
	beq _081E1972
	movs r1, 0
	cmp r2, 0x2
	bne _081E196E
	movs r1, 0x1
_081E196E:
	cmp r1, 0
	bne _081E19E6
_081E1972:
	movs r1, 0
	cmp r0, 0x2
	bne _081E197A
	movs r1, 0x1
_081E197A:
	cmp r1, 0
	bne _081E194C
	movs r0, 0
	cmp r2, 0x2
	bne _081E1986
	movs r0, 0x1
_081E1986:
	cmp r0, 0
	beq _081E1998
_081E198A:
	ldr r0, [r5, 0x4]
	movs r1, 0x1
	cmp r0, 0
	beq _081E1994
	subs r1, 0x2
_081E1994:
	adds r0, r1, 0
	b _081E19E8
_081E1998:
	ldr r0, [r6, 0x4]
	ldr r4, [r5, 0x4]
	cmp r4, r0
	beq _081E19AA
_081E19A0:
	movs r0, 0x1
	cmp r4, 0
	beq _081E19E8
	subs r0, 0x2
	b _081E19E8
_081E19AA:
	ldr r1, [r5, 0x8]
	ldr r0, [r6, 0x8]
	cmp r1, r0
	bgt _081E19A0
	cmp r1, r0
	bge _081E19C2
_081E19B6:
	movs r0, 0x1
	negs r0, r0
	cmp r4, 0
	beq _081E19E8
	movs r0, 0x1
	b _081E19E8
_081E19C2:
	ldr r3, [r5, 0x10]
	ldr r2, [r6, 0x10]
	cmp r3, r2
	bhi _081E19A0
	cmp r3, r2
	bne _081E19D6
	ldr r1, [r5, 0xC]
	ldr r0, [r6, 0xC]
	cmp r1, r0
	bhi _081E19A0
_081E19D6:
	cmp r2, r3
	bhi _081E19B6
	cmp r2, r3
	bne _081E19E6
	ldr r1, [r6, 0xC]
	ldr r0, [r5, 0xC]
	cmp r1, r0
	bhi _081E19B6
_081E19E6:
	movs r0, 0
_081E19E8:
	pop {r4-r6,pc}
	thumb_func_end __fpcmp_parts_d

	thumb_func_start __cmpdf2
__cmpdf2: ; 81E19EC
	push {r4,lr}
	sub sp, 0x38
	str r0, [sp, 0x28]
	str r1, [sp, 0x2C]
	str r2, [sp, 0x30]
	str r3, [sp, 0x34]
	add r0, sp, 0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, 0x30
	add r4, sp, 0x14
	adds r1, r4, 0
	bl __unpack_d
	mov r0, sp
	adds r1, r4, 0
	bl __fpcmp_parts_d
	add sp, 0x38
	pop {r4,pc}
	thumb_func_end __cmpdf2

	thumb_func_start __eqdf2
__eqdf2: ; 81E1A18
	push {r4,lr}
	sub sp, 0x38
	str r0, [sp, 0x28]
	str r1, [sp, 0x2C]
	str r2, [sp, 0x30]
	str r3, [sp, 0x34]
	add r0, sp, 0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, 0x30
	add r4, sp, 0x14
	adds r1, r4, 0
	bl __unpack_d
	movs r1, 0
	ldr r0, [sp]
	cmp r0, 0x1
	bhi _081E1A40
	movs r1, 0x1
_081E1A40:
	cmp r1, 0
	bne _081E1A52
	movs r1, 0
	ldr r0, [sp, 0x14]
	cmp r0, 0x1
	bhi _081E1A4E
	movs r1, 0x1
_081E1A4E:
	cmp r1, 0
	beq _081E1A56
_081E1A52:
	movs r0, 0x1
	b _081E1A5E
_081E1A56:
	mov r0, sp
	adds r1, r4, 0
	bl __fpcmp_parts_d
_081E1A5E:
	add sp, 0x38
	pop {r4,pc}
	thumb_func_end __eqdf2

	thumb_func_start __nedf2
__nedf2: ; 81E1A64
	push {r4,lr}
	sub sp, 0x38
	str r0, [sp, 0x28]
	str r1, [sp, 0x2C]
	str r2, [sp, 0x30]
	str r3, [sp, 0x34]
	add r0, sp, 0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, 0x30
	add r4, sp, 0x14
	adds r1, r4, 0
	bl __unpack_d
	movs r1, 0
	ldr r0, [sp]
	cmp r0, 0x1
	bhi _081E1A8C
	movs r1, 0x1
_081E1A8C:
	cmp r1, 0
	bne _081E1A9E
	movs r1, 0
	ldr r0, [sp, 0x14]
	cmp r0, 0x1
	bhi _081E1A9A
	movs r1, 0x1
_081E1A9A:
	cmp r1, 0
	beq _081E1AA2
_081E1A9E:
	movs r0, 0x1
	b _081E1AAA
_081E1AA2:
	mov r0, sp
	adds r1, r4, 0
	bl __fpcmp_parts_d
_081E1AAA:
	add sp, 0x38
	pop {r4,pc}
	thumb_func_end __nedf2

	thumb_func_start __gtdf2
__gtdf2: ; 81E1AB0
	push {r4,lr}
	sub sp, 0x38
	str r0, [sp, 0x28]
	str r1, [sp, 0x2C]
	str r2, [sp, 0x30]
	str r3, [sp, 0x34]
	add r0, sp, 0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, 0x30
	add r4, sp, 0x14
	adds r1, r4, 0
	bl __unpack_d
	movs r1, 0
	ldr r0, [sp]
	cmp r0, 0x1
	bhi _081E1AD8
	movs r1, 0x1
_081E1AD8:
	cmp r1, 0
	bne _081E1AEA
	movs r1, 0
	ldr r0, [sp, 0x14]
	cmp r0, 0x1
	bhi _081E1AE6
	movs r1, 0x1
_081E1AE6:
	cmp r1, 0
	beq _081E1AF0
_081E1AEA:
	movs r0, 0x1
	negs r0, r0
	b _081E1AF8
_081E1AF0:
	mov r0, sp
	adds r1, r4, 0
	bl __fpcmp_parts_d
_081E1AF8:
	add sp, 0x38
	pop {r4,pc}
	thumb_func_end __gtdf2

	thumb_func_start __gedf2
; int __gedf2(double arg_a, double arg_b)
__gedf2: ; 81E1AFC
	push {r4,lr}
	sub sp, 0x38
	str r0, [sp, 0x28]
	str r1, [sp, 0x2C]
	str r2, [sp, 0x30]
	str r3, [sp, 0x34]
	add r0, sp, 0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, 0x30
	add r4, sp, 0x14
	adds r1, r4, 0
	bl __unpack_d
	movs r1, 0
	ldr r0, [sp]
	cmp r0, 0x1
	bhi _081E1B24
	movs r1, 0x1
_081E1B24:
	cmp r1, 0
	bne _081E1B36
	movs r1, 0
	ldr r0, [sp, 0x14]
	cmp r0, 0x1
	bhi _081E1B32
	movs r1, 0x1
_081E1B32:
	cmp r1, 0
	beq _081E1B3C
_081E1B36:
	movs r0, 0x1
	negs r0, r0
	b _081E1B44
_081E1B3C:
	mov r0, sp
	adds r1, r4, 0
	bl __fpcmp_parts_d
_081E1B44:
	add sp, 0x38
	pop {r4,pc}
	thumb_func_end __gedf2

	thumb_func_start __ltdf2
__ltdf2: ; 81E1B48
	push {r4,lr}
	sub sp, 0x38
	str r0, [sp, 0x28]
	str r1, [sp, 0x2C]
	str r2, [sp, 0x30]
	str r3, [sp, 0x34]
	add r0, sp, 0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, 0x30
	add r4, sp, 0x14
	adds r1, r4, 0
	bl __unpack_d
	movs r1, 0
	ldr r0, [sp]
	cmp r0, 0x1
	bhi _081E1B70
	movs r1, 0x1
_081E1B70:
	cmp r1, 0
	bne _081E1B82
	movs r1, 0
	ldr r0, [sp, 0x14]
	cmp r0, 0x1
	bhi _081E1B7E
	movs r1, 0x1
_081E1B7E:
	cmp r1, 0
	beq _081E1B86
_081E1B82:
	movs r0, 0x1
	b _081E1B8E
_081E1B86:
	mov r0, sp
	adds r1, r4, 0
	bl __fpcmp_parts_d
_081E1B8E:
	add sp, 0x38
	pop {r4,pc}
	thumb_func_end __ltdf2

	thumb_func_start __ledf2
__ledf2: ; 81E1B94
	push {r4,lr}
	sub sp, 0x38
	str r0, [sp, 0x28]
	str r1, [sp, 0x2C]
	str r2, [sp, 0x30]
	str r3, [sp, 0x34]
	add r0, sp, 0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, 0x30
	add r4, sp, 0x14
	adds r1, r4, 0
	bl __unpack_d
	movs r1, 0
	ldr r0, [sp]
	cmp r0, 0x1
	bhi _081E1BBC
	movs r1, 0x1
_081E1BBC:
	cmp r1, 0
	bne _081E1BCE
	movs r1, 0
	ldr r0, [sp, 0x14]
	cmp r0, 0x1
	bhi _081E1BCA
	movs r1, 0x1
_081E1BCA:
	cmp r1, 0
	beq _081E1BD2
_081E1BCE:
	movs r0, 0x1
	b _081E1BDA
_081E1BD2:
	mov r0, sp
	adds r1, r4, 0
	bl __fpcmp_parts_d
_081E1BDA:
	add sp, 0x38
	pop {r4,pc}
	thumb_func_end __ledf2

	thumb_func_start __floatsidf
__floatsidf: ; 81E1BE0
	push {r4,r5,lr}
	sub sp, 0x14
	adds r2, r0, 0
	movs r0, 0x3
	str r0, [sp]
	lsrs r1, r2, 31
	str r1, [sp, 0x4]
	cmp r2, 0
	bne _081E1BF8
	movs r0, 0x2
	str r0, [sp]
	b _081E1C4E
_081E1BF8:
	movs r0, 0x3C
	str r0, [sp, 0x8]
	cmp r1, 0
	beq _081E1C1E
	movs r0, 0x80
	lsls r0, 24
	cmp r2, r0
	bne _081E1C18
	ldr r1, _081E1C14
	ldr r0, _081E1C10
	b _081E1C54
	.align 2, 0
_081E1C10: .4byte 0xc1e00000
_081E1C14: .4byte 0x00000000
_081E1C18:
	negs r0, r2
	asrs r1, r0, 31
	b _081E1C22
_081E1C1E:
	adds r0, r2, 0
	asrs r1, r2, 31
_081E1C22:
	str r0, [sp, 0xC]
	str r1, [sp, 0x10]
	ldr r0, [sp, 0x10]
	ldr r1, _081E1C58
	cmp r0, r1
	bhi _081E1C4E
	adds r5, r1, 0
	ldr r4, [sp, 0x8]
_081E1C32:
	ldr r0, [sp, 0xC]
	ldr r1, [sp, 0x10]
	lsrs r3, r0, 31
	lsls r2, r1, 1
	adds r1, r3, 0
	orrs r1, r2
	lsls r0, 1
	str r0, [sp, 0xC]
	str r1, [sp, 0x10]
	subs r4, 0x1
	ldr r0, [sp, 0x10]
	cmp r0, r5
	bls _081E1C32
	str r4, [sp, 0x8]
_081E1C4E:
	mov r0, sp
	bl __pack_d
_081E1C54:
	add sp, 0x14
	pop {r4,r5,pc}
	.align 2, 0
_081E1C58: .4byte 0x0fffffff
	thumb_func_end __floatsidf

	thumb_func_start __fixdfsi
; int __fixdfsi(double arg_a)
__fixdfsi: ; 81E1C5C
	push {lr}
	sub sp, 0x1C
	str r0, [sp, 0x14]
	str r1, [sp, 0x18]
	add r0, sp, 0x14
	mov r1, sp
	bl __unpack_d
	movs r1, 0
	ldr r0, [sp]
	cmp r0, 0x2
	bne _081E1C76
	movs r1, 0x1
_081E1C76:
	cmp r1, 0
	bne _081E1CAA
	movs r1, 0
	cmp r0, 0x1
	bhi _081E1C82
	movs r1, 0x1
_081E1C82:
	cmp r1, 0
	bne _081E1CAA
	movs r1, 0
	cmp r0, 0x4
	bne _081E1C8E
	movs r1, 0x1
_081E1C8E:
	cmp r1, 0
	beq _081E1CA4
_081E1C92:
	ldr r0, [sp, 0x4]
	ldr r1, _081E1CA0
	cmp r0, 0
	beq _081E1CC8
	adds r1, 0x1
	b _081E1CC8
	.align 2, 0
_081E1CA0: .4byte 0x7fffffff
_081E1CA4:
	ldr r0, [sp, 0x8]
	cmp r0, 0
	bge _081E1CAE
_081E1CAA:
	movs r0, 0
	b _081E1CCA
_081E1CAE:
	cmp r0, 0x1E
	bgt _081E1C92
	movs r2, 0x3C
	subs r2, r0
	ldr r0, [sp, 0xC]
	ldr r1, [sp, 0x10]
	bl __lshrdi3
	adds r1, r0, 0
	ldr r0, [sp, 0x4]
	cmp r0, 0
	beq _081E1CC8
	negs r1, r1
_081E1CC8:
	adds r0, r1, 0
_081E1CCA:
	add sp, 0x1C
	pop {pc}
	thumb_func_end __fixdfsi

	thumb_func_start __negdf2
__negdf2: ; 81E1CD0
	push {lr}
	sub sp, 0x1C
	str r0, [sp, 0x14]
	str r1, [sp, 0x18]
	add r0, sp, 0x14
	mov r1, sp
	bl __unpack_d
	movs r1, 0
	ldr r0, [sp, 0x4]
	cmp r0, 0
	bne _081E1CEA
	movs r1, 0x1
_081E1CEA:
	str r1, [sp, 0x4]
	mov r0, sp
	bl __pack_d
	add sp, 0x1C
	pop {pc}
	thumb_func_end __negdf2

	thumb_func_start __make_dp
__make_dp: ; 81E1CF8
	sub sp, 0x4
	push {r4,lr}
	sub sp, 0x14
	str r3, [sp, 0x1C]
	ldr r3, [sp, 0x1C]
	ldr r4, [sp, 0x20]
	str r0, [sp]
	str r1, [sp, 0x4]
	str r2, [sp, 0x8]
	str r3, [sp, 0xC]
	str r4, [sp, 0x10]
	mov r0, sp
	bl __pack_d
	add sp, 0x14
	pop {r4}
	pop {r3}
	add sp, 0x4
	bx r3
	thumb_func_end __make_dp

	thumb_func_start __truncdfsf2
__truncdfsf2: ; 81E1D20
	push {r4,r5,lr}
	sub sp, 0x1C
	str r0, [sp, 0x14]
	str r1, [sp, 0x18]
	add r0, sp, 0x14
	mov r1, sp
	bl __unpack_d
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	lsls r5, r3, 2
	lsrs r4, r2, 30
	adds r0, r5, 0
	orrs r0, r4
	adds r5, r0, 0
	ldr r4, _081E1D60
	adds r0, r2, 0
	ands r0, r4
	movs r1, 0
	orrs r0, r1
	cmp r0, 0
	beq _081E1D50
	movs r0, 0x1
	orrs r5, r0
_081E1D50:
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	adds r3, r5, 0
	bl __make_fp
	add sp, 0x1C
	pop {r4,r5,pc}
	.align 2, 0
_081E1D60: .4byte 0x3fffffff
	thumb_func_end __truncdfsf2

	thumb_func_start __pack_f
__pack_f: ; 81E1D64
	push {r4-r6,lr}
	ldr r2, [r0, 0xC]
	ldr r6, [r0, 0x4]
	movs r5, 0
	movs r1, 0
	ldr r3, [r0]
	cmp r3, 0x1
	bhi _081E1D76
	movs r1, 0x1
_081E1D76:
	cmp r1, 0
	beq _081E1D84
	movs r5, 0xFF
	movs r0, 0x80
	lsls r0, 13
	orrs r2, r0
	b _081E1DEA
_081E1D84:
	movs r1, 0
	cmp r3, 0x4
	bne _081E1D8C
	movs r1, 0x1
_081E1D8C:
	cmp r1, 0
	bne _081E1DC0
	movs r1, 0
	cmp r3, 0x2
	bne _081E1D98
	movs r1, 0x1
_081E1D98:
	cmp r1, 0
	beq _081E1DA0
	movs r2, 0
	b _081E1DEA
_081E1DA0:
	cmp r2, 0
	beq _081E1DEA
	ldr r0, [r0, 0x8]
	movs r3, 0x7E
	negs r3, r3
	cmp r0, r3
	bge _081E1DBC
	subs r0, r3, r0
	cmp r0, 0x19
	ble _081E1DB8
	movs r2, 0
	b _081E1DE8
_081E1DB8:
	lsrs r2, r0
	b _081E1DE8
_081E1DBC:
	cmp r0, 0x7F
	ble _081E1DC6
_081E1DC0:
	movs r5, 0xFF
	movs r2, 0
	b _081E1DEA
_081E1DC6:
	adds r5, r0, 0
	adds r5, 0x7F
	movs r0, 0x7F
	ands r0, r2
	cmp r0, 0x40
	bne _081E1DDE
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _081E1DE0
	adds r2, 0x40
	b _081E1DE0
_081E1DDE:
	adds r2, 0x3F
_081E1DE0:
	cmp r2, 0
	bge _081E1DE8
	lsrs r2, 1
	adds r5, 0x1
_081E1DE8:
	lsrs r2, 7
_081E1DEA:
	ldr r0, _081E1E0C
	ands r2, r0
	ldr r0, _081E1E10
	ands r4, r0
	orrs r4, r2
	movs r0, 0xFF
	ands r5, r0
	lsls r1, r5, 23
	ldr r0, _081E1E14
	ands r4, r0
	orrs r4, r1
	lsls r1, r6, 31
	ldr r0, _081E1E18
	ands r4, r0
	orrs r4, r1
	adds r0, r4, 0
	pop {r4-r6,pc}
	.align 2, 0
_081E1E0C: .4byte 0x007fffff
_081E1E10: .4byte 0xff800000
_081E1E14: .4byte 0x807fffff
_081E1E18: .4byte 0x7fffffff
	thumb_func_end __pack_f

	thumb_func_start __unpack_f
__unpack_f: ; 81E1E1C
	push {r4,lr}
	adds r3, r1, 0
	ldr r0, [r0]
	lsls r1, r0, 9
	lsrs r2, r1, 9
	lsls r1, r0, 1
	lsrs r1, 24
	lsrs r0, 31
	str r0, [r3, 0x4]
	cmp r1, 0
	bne _081E1E60
	cmp r2, 0
	bne _081E1E3C
	movs r0, 0x2
	str r0, [r3]
	b _081E1E94
_081E1E3C:
	adds r4, r1, 0
	subs r4, 0x7E
	str r4, [r3, 0x8]
	lsls r2, 7
	movs r0, 0x3
	str r0, [r3]
	ldr r1, _081E1E5C
	cmp r2, r1
	bhi _081E1E7C
	adds r0, r4, 0
_081E1E50:
	lsls r2, 1
	subs r0, 0x1
	cmp r2, r1
	bls _081E1E50
	str r0, [r3, 0x8]
	b _081E1E7C
	.align 2, 0
_081E1E5C: .4byte 0x3fffffff
_081E1E60:
	cmp r1, 0xFF
	bne _081E1E80
	cmp r2, 0
	bne _081E1E6E
	movs r0, 0x4
	str r0, [r3]
	b _081E1E94
_081E1E6E:
	movs r0, 0x80
	lsls r0, 13
	ands r0, r2
	cmp r0, 0
	beq _081E1E7A
	movs r0, 0x1
_081E1E7A:
	str r0, [r3]
_081E1E7C:
	str r2, [r3, 0xC]
	b _081E1E94
_081E1E80:
	adds r0, r1, 0
	subs r0, 0x7F
	str r0, [r3, 0x8]
	movs r0, 0x3
	str r0, [r3]
	lsls r0, r2, 7
	movs r1, 0x80
	lsls r1, 23
	orrs r0, r1
	str r0, [r3, 0xC]
_081E1E94:
	pop {r4,pc}
	thumb_func_end __unpack_f

	thumb_func_start __fpadd_parts_f
__fpadd_parts_f: ; 81E1E98
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	adds r7, r1, 0
	adds r5, r2, 0
	movs r0, 0
	ldr r2, [r6]
	cmp r2, 0x1
	bhi _081E1EAE
	movs r0, 0x1
_081E1EAE:
	cmp r0, 0
	beq _081E1EB6
_081E1EB2:
	adds r0, r6, 0
	b _081E200C
_081E1EB6:
	movs r1, 0
	ldr r0, [r7]
	cmp r0, 0x1
	bhi _081E1EC0
	movs r1, 0x1
_081E1EC0:
	cmp r1, 0
	bne _081E1F34
	movs r1, 0
	cmp r2, 0x4
	bne _081E1ECC
	movs r1, 0x1
_081E1ECC:
	cmp r1, 0
	beq _081E1EEC
	movs r1, 0
	cmp r0, 0x4
	bne _081E1ED8
	movs r1, 0x1
_081E1ED8:
	cmp r1, 0
	beq _081E1EB2
	ldr r1, [r6, 0x4]
	ldr r0, [r7, 0x4]
	cmp r1, r0
	beq _081E1EB2
	ldr r0, _081E1EE8
	b _081E200C
	.align 2, 0
_081E1EE8: .4byte 0x03000f50
_081E1EEC:
	movs r1, 0
	cmp r0, 0x4
	bne _081E1EF4
	movs r1, 0x1
_081E1EF4:
	cmp r1, 0
	bne _081E1F34
	movs r1, 0
	cmp r0, 0x2
	bne _081E1F00
	movs r1, 0x1
_081E1F00:
	cmp r1, 0
	beq _081E1F26
	movs r0, 0
	cmp r2, 0x2
	bne _081E1F0C
	movs r0, 0x1
_081E1F0C:
	cmp r0, 0
	beq _081E1EB2
	adds r1, r5, 0
	adds r0, r6, 0
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r6, 0x4]
	ldr r1, [r7, 0x4]
	ands r0, r1
	str r0, [r5, 0x4]
	b _081E200A
_081E1F26:
	movs r1, 0
	ldr r0, [r6]
	cmp r0, 0x2
	bne _081E1F30
	movs r1, 0x1
_081E1F30:
	cmp r1, 0
	beq _081E1F38
_081E1F34:
	adds r0, r7, 0
	b _081E200C
_081E1F38:
	ldr r1, [r6, 0x8]
	ldr r3, [r7, 0x8]
	ldr r2, [r6, 0xC]
	ldr r4, [r7, 0xC]
	subs r0, r1, r3
	cmp r0, 0
	bge _081E1F48
	negs r0, r0
_081E1F48:
	cmp r0, 0x1F
	bgt _081E1F8C
	ldr r6, [r6, 0x4]
	ldr r7, [r7, 0x4]
	mov r8, r7
	cmp r1, r3
	ble _081E1F6E
	movs r7, 0x1
	mov r12, r7
	subs r3, r1, r3
_081E1F5C:
	subs r3, 0x1
	adds r0, r4, 0
	mov r7, r12
	ands r0, r7
	lsrs r4, 1
	orrs r4, r0
	cmp r3, 0
	bne _081E1F5C
	adds r3, r1, 0
_081E1F6E:
	cmp r3, r1
	ble _081E1F9E
	movs r0, 0x1
	mov r12, r0
	subs r1, r3, r1
_081E1F78:
	subs r1, 0x1
	adds r0, r2, 0
	mov r7, r12
	ands r0, r7
	lsrs r2, 1
	orrs r2, r0
	cmp r1, 0
	bne _081E1F78
	adds r1, r3, 0
	b _081E1F9E
_081E1F8C:
	cmp r1, r3
	ble _081E1F94
	movs r4, 0
	b _081E1F98
_081E1F94:
	adds r1, r3, 0
	movs r2, 0
_081E1F98:
	ldr r6, [r6, 0x4]
	ldr r7, [r7, 0x4]
	mov r8, r7
_081E1F9E:
	cmp r6, r8
	beq _081E1FE8
	cmp r6, 0
	beq _081E1FAA
	subs r3, r4, r2
	b _081E1FAC
_081E1FAA:
	subs r3, r2, r4
_081E1FAC:
	cmp r3, 0
	blt _081E1FBA
	movs r0, 0
	str r0, [r5, 0x4]
	str r1, [r5, 0x8]
	str r3, [r5, 0xC]
	b _081E1FC4
_081E1FBA:
	movs r0, 0x1
	str r0, [r5, 0x4]
	str r1, [r5, 0x8]
	negs r0, r3
	str r0, [r5, 0xC]
_081E1FC4:
	ldr r1, [r5, 0xC]
	subs r0, r1, 0x1
	ldr r2, _081E1FE4
	cmp r0, r2
	bhi _081E1FF0
_081E1FCE:
	lsls r0, r1, 1
	str r0, [r5, 0xC]
	ldr r1, [r5, 0x8]
	subs r1, 0x1
	str r1, [r5, 0x8]
	adds r1, r0, 0
	subs r0, r1, 0x1
	cmp r0, r2
	bls _081E1FCE
	b _081E1FF0
	.align 2, 0
_081E1FE4: .4byte 0x3ffffffe
_081E1FE8:
	str r6, [r5, 0x4]
	str r1, [r5, 0x8]
	adds r0, r2, r4
	str r0, [r5, 0xC]
_081E1FF0:
	movs r0, 0x3
	str r0, [r5]
	ldr r1, [r5, 0xC]
	cmp r1, 0
	bge _081E200A
	movs r0, 0x1
	ands r0, r1
	lsrs r1, 1
	orrs r0, r1
	str r0, [r5, 0xC]
	ldr r0, [r5, 0x8]
	adds r0, 0x1
	str r0, [r5, 0x8]
_081E200A:
	adds r0, r5, 0
_081E200C:
	pop {r3}
	mov r8, r3
	pop {r4-r7,pc}
	thumb_func_end __fpadd_parts_f

	thumb_func_start __addsf3
__addsf3: ; 81E2014
	push {r4,lr}
	sub sp, 0x38
	str r0, [sp, 0x30]
	str r1, [sp, 0x34]
	add r0, sp, 0x30
	mov r1, sp
	bl __unpack_f
	add r0, sp, 0x34
	add r4, sp, 0x10
	adds r1, r4, 0
	bl __unpack_f
	add r2, sp, 0x20
	mov r0, sp
	adds r1, r4, 0
	bl __fpadd_parts_f
	bl __pack_f
	add sp, 0x38
	pop {r4,pc}
	thumb_func_end __addsf3

	thumb_func_start __subsf3
__subsf3: ; 81E2040
	push {r4,lr}
	sub sp, 0x38
	str r0, [sp, 0x30]
	str r1, [sp, 0x34]
	add r0, sp, 0x30
	mov r1, sp
	bl __unpack_f
	add r0, sp, 0x34
	add r4, sp, 0x10
	adds r1, r4, 0
	bl __unpack_f
	ldr r0, [r4, 0x4]
	movs r1, 0x1
	eors r0, r1
	str r0, [r4, 0x4]
	add r2, sp, 0x20
	mov r0, sp
	adds r1, r4, 0
	bl __fpadd_parts_f
	bl __pack_f
	add sp, 0x38
	pop {r4,pc}
	thumb_func_end __subsf3

	thumb_func_start __mulsf3
__mulsf3: ; 81E2074
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x38
	str r0, [sp, 0x30]
	str r1, [sp, 0x34]
	add r0, sp, 0x30
	mov r1, sp
	bl __unpack_f
	add r0, sp, 0x34
	add r4, sp, 0x10
	adds r1, r4, 0
	bl __unpack_f
	mov r7, sp
	add r0, sp, 0x20
	mov r8, r0
	movs r0, 0
	ldr r1, [sp]
	mov r9, r8
	cmp r1, 0x1
	bhi _081E20A6
	movs r0, 0x1
_081E20A6:
	cmp r0, 0
	bne _081E2104
	movs r2, 0
	ldr r0, [sp, 0x10]
	cmp r0, 0x1
	bhi _081E20B4
	movs r2, 0x1
_081E20B4:
	cmp r2, 0
	beq _081E20BC
	ldr r0, [sp, 0x4]
	b _081E2124
_081E20BC:
	movs r2, 0
	cmp r1, 0x4
	bne _081E20C4
	movs r2, 0x1
_081E20C4:
	cmp r2, 0
	beq _081E20D6
	movs r1, 0
	cmp r0, 0x2
	bne _081E20D0
	movs r1, 0x1
_081E20D0:
	cmp r1, 0
	bne _081E20EE
	b _081E2104
_081E20D6:
	movs r2, 0
	cmp r0, 0x4
	bne _081E20DE
	movs r2, 0x1
_081E20DE:
	cmp r2, 0
	beq _081E20F8
	movs r0, 0
	cmp r1, 0x2
	bne _081E20EA
	movs r0, 0x1
_081E20EA:
	cmp r0, 0
	beq _081E2122
_081E20EE:
	ldr r0, _081E20F4
	b _081E21C6
	.align 2, 0
_081E20F4: .4byte 0x03000f50
_081E20F8:
	movs r2, 0
	cmp r1, 0x2
	bne _081E2100
	movs r2, 0x1
_081E2100:
	cmp r2, 0
	beq _081E2116
_081E2104:
	ldr r0, [sp, 0x4]
	ldr r1, [sp, 0x14]
	eors r0, r1
	negs r1, r0
	orrs r1, r0
	lsrs r1, 31
	str r1, [sp, 0x4]
	mov r0, sp
	b _081E21C6
_081E2116:
	movs r1, 0
	cmp r0, 0x2
	bne _081E211E
	movs r1, 0x1
_081E211E:
	cmp r1, 0
	beq _081E2134
_081E2122:
	ldr r0, [r7, 0x4]
_081E2124:
	ldr r1, [sp, 0x14]
	eors r0, r1
	negs r1, r0
	orrs r1, r0
	lsrs r1, 31
	str r1, [sp, 0x14]
	adds r0, r4, 0
	b _081E21C6
_081E2134:
	ldr r0, [r7, 0xC]
	movs r1, 0
	ldr r2, [sp, 0x1C]
	movs r3, 0
	bl __muldi3
	adds r2, r1, 0
	adds r5, r2, 0
	adds r6, r0, 0
	ldr r4, [r7, 0x8]
	ldr r0, [sp, 0x18]
	adds r4, r0
	str r4, [sp, 0x28]
	ldr r1, [r7, 0x4]
	ldr r0, [sp, 0x14]
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	str r0, [sp, 0x24]
	adds r4, 0x2
	str r4, [sp, 0x28]
	cmp r2, 0
	bge _081E2180
	movs r2, 0x1
	movs r1, 0x80
	lsls r1, 24
_081E216A:
	adds r4, 0x1
	adds r0, r5, 0
	ands r0, r2
	cmp r0, 0
	beq _081E2178
	lsrs r6, 1
	orrs r6, r1
_081E2178:
	lsrs r5, 1
	cmp r5, 0
	blt _081E216A
	str r4, [sp, 0x28]
_081E2180:
	ldr r0, _081E21D4
	cmp r5, r0
	bhi _081E21A6
	movs r4, 0x80
	lsls r4, 24
	movs r3, 0x1
	adds r2, r0, 0
	ldr r1, [sp, 0x28]
_081E2190:
	subs r1, 0x1
	lsls r5, 1
	adds r0, r6, 0
	ands r0, r4
	cmp r0, 0
	beq _081E219E
	orrs r5, r3
_081E219E:
	lsls r6, 1
	cmp r5, r2
	bls _081E2190
	str r1, [sp, 0x28]
_081E21A6:
	movs r0, 0x7F
	ands r0, r5
	cmp r0, 0x40
	bne _081E21BC
	movs r0, 0x80
	ands r0, r5
	cmp r0, 0
	bne _081E21BA
	cmp r6, 0
	beq _081E21BC
_081E21BA:
	adds r5, 0x40
_081E21BC:
	str r5, [sp, 0x2C]
	movs r0, 0x3
	mov r1, r8
	str r0, [r1]
	mov r0, r9
_081E21C6:
	bl __pack_f
	add sp, 0x38
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7,pc}
	.align 2, 0
_081E21D4: .4byte 0x3fffffff
	thumb_func_end __mulsf3

	thumb_func_start __divsf3
__divsf3: ; 81E21D8
	push {r4-r6,lr}
	sub sp, 0x28
	str r0, [sp, 0x20]
	str r1, [sp, 0x24]
	add r0, sp, 0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, 0x24
	add r5, sp, 0x10
	adds r1, r5, 0
	bl __unpack_f
	mov r4, sp
	movs r0, 0
	ldr r3, [sp]
	cmp r3, 0x1
	bhi _081E21FE
	movs r0, 0x1
_081E21FE:
	cmp r0, 0
	beq _081E2206
	mov r1, sp
	b _081E22B8
_081E2206:
	movs r0, 0
	ldr r2, [sp, 0x10]
	adds r6, r2, 0
	cmp r2, 0x1
	bhi _081E2212
	movs r0, 0x1
_081E2212:
	cmp r0, 0
	beq _081E221A
	adds r1, r5, 0
	b _081E22B8
_081E221A:
	ldr r0, [sp, 0x4]
	ldr r1, [sp, 0x14]
	eors r0, r1
	str r0, [sp, 0x4]
	movs r0, 0
	cmp r3, 0x4
	bne _081E222A
	movs r0, 0x1
_081E222A:
	cmp r0, 0
	bne _081E223A
	movs r0, 0
	cmp r3, 0x2
	bne _081E2236
	movs r0, 0x1
_081E2236:
	cmp r0, 0
	beq _081E224C
_081E223A:
	ldr r0, [r4]
	adds r1, r4, 0
	cmp r0, r6
	bne _081E22B8
	ldr r1, _081E2248
	b _081E22B8
	.align 2, 0
_081E2248: .4byte 0x03000f50
_081E224C:
	movs r1, 0
	cmp r2, 0x4
	bne _081E2254
	movs r1, 0x1
_081E2254:
	cmp r1, 0
	beq _081E2260
	str r0, [sp, 0xC]
	str r0, [sp, 0x8]
	mov r1, sp
	b _081E22B8
_081E2260:
	movs r0, 0
	cmp r2, 0x2
	bne _081E2268
	movs r0, 0x1
_081E2268:
	cmp r0, 0
	beq _081E2272
	movs r0, 0x4
	str r0, [r4]
	b _081E22B6
_081E2272:
	ldr r1, [r4, 0x8]
	ldr r0, [sp, 0x18]
	subs r0, r1, r0
	str r0, [r4, 0x8]
	ldr r2, [r4, 0xC]
	ldr r3, [sp, 0x1C]
	cmp r2, r3
	bcs _081E2288
	lsls r2, 1
	subs r0, 0x1
	str r0, [r4, 0x8]
_081E2288:
	movs r0, 0x80
	lsls r0, 23
	movs r1, 0
_081E228E:
	cmp r2, r3
	bcc _081E2296
	orrs r1, r0
	subs r2, r3
_081E2296:
	lsrs r0, 1
	lsls r2, 1
	cmp r0, 0
	bne _081E228E
	movs r0, 0x7F
	ands r0, r1
	cmp r0, 0x40
	bne _081E22B4
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081E22B2
	cmp r2, 0
	beq _081E22B4
_081E22B2:
	adds r1, 0x40
_081E22B4:
	str r1, [r4, 0xC]
_081E22B6:
	adds r1, r4, 0
_081E22B8:
	adds r0, r1, 0
	bl __pack_f
	add sp, 0x28
	pop {r4-r6,pc}
	thumb_func_end __divsf3

	thumb_func_start __fpcmp_parts_f
__fpcmp_parts_f: ; 81E22C4
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0
	ldr r2, [r4]
	cmp r2, 0x1
	bhi _081E22D2
	movs r0, 0x1
_081E22D2:
	cmp r0, 0
	bne _081E22E4
	movs r0, 0
	ldr r3, [r1]
	cmp r3, 0x1
	bhi _081E22E0
	movs r0, 0x1
_081E22E0:
	cmp r0, 0
	beq _081E22E8
_081E22E4:
	movs r0, 0x1
	b _081E23A6
_081E22E8:
	movs r0, 0
	cmp r2, 0x4
	bne _081E22F0
	movs r0, 0x1
_081E22F0:
	cmp r0, 0
	beq _081E2308
	movs r0, 0
	cmp r3, 0x4
	bne _081E22FC
	movs r0, 0x1
_081E22FC:
	cmp r0, 0
	beq _081E2308
	ldr r0, [r1, 0x4]
	ldr r1, [r4, 0x4]
	subs r0, r1
	b _081E23A6
_081E2308:
	movs r2, 0
	ldr r0, [r4]
	cmp r0, 0x4
	bne _081E2312
	movs r2, 0x1
_081E2312:
	cmp r2, 0
	bne _081E2360
	movs r2, 0
	cmp r3, 0x4
	bne _081E231E
	movs r2, 0x1
_081E231E:
	cmp r2, 0
	beq _081E2330
_081E2322:
	ldr r0, [r1, 0x4]
	movs r1, 0x1
	negs r1, r1
	cmp r0, 0
	beq _081E236A
	movs r1, 0x1
	b _081E236A
_081E2330:
	movs r2, 0
	cmp r0, 0x2
	bne _081E2338
	movs r2, 0x1
_081E2338:
	cmp r2, 0
	beq _081E2348
	movs r2, 0
	cmp r3, 0x2
	bne _081E2344
	movs r2, 0x1
_081E2344:
	cmp r2, 0
	bne _081E23A4
_081E2348:
	movs r2, 0
	cmp r0, 0x2
	bne _081E2350
	movs r2, 0x1
_081E2350:
	cmp r2, 0
	bne _081E2322
	movs r0, 0
	cmp r3, 0x2
	bne _081E235C
	movs r0, 0x1
_081E235C:
	cmp r0, 0
	beq _081E236E
_081E2360:
	ldr r0, [r4, 0x4]
	movs r1, 0x1
	cmp r0, 0
	beq _081E236A
	subs r1, 0x2
_081E236A:
	adds r0, r1, 0
	b _081E23A6
_081E236E:
	ldr r3, [r4, 0x4]
	ldr r0, [r1, 0x4]
	cmp r3, r0
	beq _081E2380
_081E2376:
	movs r0, 0x1
	cmp r3, 0
	beq _081E23A6
	subs r0, 0x2
	b _081E23A6
_081E2380:
	ldr r2, [r4, 0x8]
	ldr r0, [r1, 0x8]
	cmp r2, r0
	bgt _081E2376
	cmp r2, r0
	bge _081E2398
_081E238C:
	movs r0, 0x1
	negs r0, r0
	cmp r3, 0
	beq _081E23A6
	movs r0, 0x1
	b _081E23A6
_081E2398:
	ldr r0, [r4, 0xC]
	ldr r1, [r1, 0xC]
	cmp r0, r1
	bhi _081E2376
	cmp r0, r1
	bcc _081E238C
_081E23A4:
	movs r0, 0
_081E23A6:
	pop {r4,pc}
	thumb_func_end __fpcmp_parts_f

	thumb_func_start __cmpsf2
__cmpsf2: ; 81E23A8
	push {r4,lr}
	sub sp, 0x28
	str r0, [sp, 0x20]
	str r1, [sp, 0x24]
	add r0, sp, 0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, 0x24
	add r4, sp, 0x10
	adds r1, r4, 0
	bl __unpack_f
	mov r0, sp
	adds r1, r4, 0
	bl __fpcmp_parts_f
	add sp, 0x28
	pop {r4,pc}
	thumb_func_end __cmpsf2

	thumb_func_start __eqsf2
__eqsf2: ; 81E23D0
	push {r4,lr}
	sub sp, 0x28
	str r0, [sp, 0x20]
	str r1, [sp, 0x24]
	add r0, sp, 0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, 0x24
	add r4, sp, 0x10
	adds r1, r4, 0
	bl __unpack_f
	movs r1, 0
	ldr r0, [sp]
	cmp r0, 0x1
	bhi _081E23F4
	movs r1, 0x1
_081E23F4:
	cmp r1, 0
	bne _081E2406
	movs r1, 0
	ldr r0, [sp, 0x10]
	cmp r0, 0x1
	bhi _081E2402
	movs r1, 0x1
_081E2402:
	cmp r1, 0
	beq _081E240A
_081E2406:
	movs r0, 0x1
	b _081E2412
_081E240A:
	mov r0, sp
	adds r1, r4, 0
	bl __fpcmp_parts_f
_081E2412:
	add sp, 0x28
	pop {r4,pc}
	thumb_func_end __eqsf2

	thumb_func_start __nesf2
__nesf2: ; 81E2418
	push {r4,lr}
	sub sp, 0x28
	str r0, [sp, 0x20]
	str r1, [sp, 0x24]
	add r0, sp, 0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, 0x24
	add r4, sp, 0x10
	adds r1, r4, 0
	bl __unpack_f
	movs r1, 0
	ldr r0, [sp]
	cmp r0, 0x1
	bhi _081E243C
	movs r1, 0x1
_081E243C:
	cmp r1, 0
	bne _081E244E
	movs r1, 0
	ldr r0, [sp, 0x10]
	cmp r0, 0x1
	bhi _081E244A
	movs r1, 0x1
_081E244A:
	cmp r1, 0
	beq _081E2452
_081E244E:
	movs r0, 0x1
	b _081E245A
_081E2452:
	mov r0, sp
	adds r1, r4, 0
	bl __fpcmp_parts_f
_081E245A:
	add sp, 0x28
	pop {r4,pc}
	thumb_func_end __nesf2

	thumb_func_start __gtsf2
__gtsf2: ; 81E2460
	push {r4,lr}
	sub sp, 0x28
	str r0, [sp, 0x20]
	str r1, [sp, 0x24]
	add r0, sp, 0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, 0x24
	add r4, sp, 0x10
	adds r1, r4, 0
	bl __unpack_f
	movs r1, 0
	ldr r0, [sp]
	cmp r0, 0x1
	bhi _081E2484
	movs r1, 0x1
_081E2484:
	cmp r1, 0
	bne _081E2496
	movs r1, 0
	ldr r0, [sp, 0x10]
	cmp r0, 0x1
	bhi _081E2492
	movs r1, 0x1
_081E2492:
	cmp r1, 0
	beq _081E249C
_081E2496:
	movs r0, 0x1
	negs r0, r0
	b _081E24A4
_081E249C:
	mov r0, sp
	adds r1, r4, 0
	bl __fpcmp_parts_f
_081E24A4:
	add sp, 0x28
	pop {r4,pc}
	thumb_func_end __gtsf2

	thumb_func_start __gesf2
__gesf2: ; 81E24A8
	push {r4,lr}
	sub sp, 0x28
	str r0, [sp, 0x20]
	str r1, [sp, 0x24]
	add r0, sp, 0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, 0x24
	add r4, sp, 0x10
	adds r1, r4, 0
	bl __unpack_f
	movs r1, 0
	ldr r0, [sp]
	cmp r0, 0x1
	bhi _081E24CC
	movs r1, 0x1
_081E24CC:
	cmp r1, 0
	bne _081E24DE
	movs r1, 0
	ldr r0, [sp, 0x10]
	cmp r0, 0x1
	bhi _081E24DA
	movs r1, 0x1
_081E24DA:
	cmp r1, 0
	beq _081E24E4
_081E24DE:
	movs r0, 0x1
	negs r0, r0
	b _081E24EC
_081E24E4:
	mov r0, sp
	adds r1, r4, 0
	bl __fpcmp_parts_f
_081E24EC:
	add sp, 0x28
	pop {r4,pc}
	thumb_func_end __gesf2

	thumb_func_start __ltsf2
__ltsf2: ; 81E24F0
	push {r4,lr}
	sub sp, 0x28
	str r0, [sp, 0x20]
	str r1, [sp, 0x24]
	add r0, sp, 0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, 0x24
	add r4, sp, 0x10
	adds r1, r4, 0
	bl __unpack_f
	movs r1, 0
	ldr r0, [sp]
	cmp r0, 0x1
	bhi _081E2514
	movs r1, 0x1
_081E2514:
	cmp r1, 0
	bne _081E2526
	movs r1, 0
	ldr r0, [sp, 0x10]
	cmp r0, 0x1
	bhi _081E2522
	movs r1, 0x1
_081E2522:
	cmp r1, 0
	beq _081E252A
_081E2526:
	movs r0, 0x1
	b _081E2532
_081E252A:
	mov r0, sp
	adds r1, r4, 0
	bl __fpcmp_parts_f
_081E2532:
	add sp, 0x28
	pop {r4,pc}
	thumb_func_end __ltsf2

	thumb_func_start __lesf2
__lesf2: ; 81E2538
	push {r4,lr}
	sub sp, 0x28
	str r0, [sp, 0x20]
	str r1, [sp, 0x24]
	add r0, sp, 0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, 0x24
	add r4, sp, 0x10
	adds r1, r4, 0
	bl __unpack_f
	movs r1, 0
	ldr r0, [sp]
	cmp r0, 0x1
	bhi _081E255C
	movs r1, 0x1
_081E255C:
	cmp r1, 0
	bne _081E256E
	movs r1, 0
	ldr r0, [sp, 0x10]
	cmp r0, 0x1
	bhi _081E256A
	movs r1, 0x1
_081E256A:
	cmp r1, 0
	beq _081E2572
_081E256E:
	movs r0, 0x1
	b _081E257A
_081E2572:
	mov r0, sp
	adds r1, r4, 0
	bl __fpcmp_parts_f
_081E257A:
	add sp, 0x28
	pop {r4,pc}
	thumb_func_end __lesf2

	thumb_func_start __floatsisf
__floatsisf: ; 81E2580
	push {lr}
	sub sp, 0x10
	adds r1, r0, 0
	movs r0, 0x3
	str r0, [sp]
	lsrs r2, r1, 31
	str r2, [sp, 0x4]
	cmp r1, 0
	bne _081E2598
	movs r0, 0x2
	str r0, [sp]
	b _081E25D0
_081E2598:
	movs r0, 0x1E
	str r0, [sp, 0x8]
	cmp r2, 0
	beq _081E25B6
	movs r0, 0x80
	lsls r0, 24
	cmp r1, r0
	bne _081E25B0
	ldr r0, _081E25AC
	b _081E25D6
	.align 2, 0
_081E25AC: .4byte 0xcf000000
_081E25B0:
	negs r0, r1
	str r0, [sp, 0xC]
	b _081E25B8
_081E25B6:
	str r1, [sp, 0xC]
_081E25B8:
	ldr r2, [sp, 0xC]
	ldr r3, _081E25DC
	cmp r2, r3
	bhi _081E25D0
	ldr r1, [sp, 0x8]
_081E25C2:
	lsls r0, r2, 1
	subs r1, 0x1
	adds r2, r0, 0
	cmp r0, r3
	bls _081E25C2
	str r1, [sp, 0x8]
	str r0, [sp, 0xC]
_081E25D0:
	mov r0, sp
	bl __pack_f
_081E25D6:
	add sp, 0x10
	pop {pc}
	.align 2, 0
_081E25DC: .4byte 0x3fffffff
	thumb_func_end __floatsisf

	thumb_func_start __fixsfsi
__fixsfsi: ; 81E25E0
	push {lr}
	sub sp, 0x14
	str r0, [sp, 0x10]
	add r0, sp, 0x10
	mov r1, sp
	bl __unpack_f
	movs r1, 0
	ldr r0, [sp]
	cmp r0, 0x2
	bne _081E25F8
	movs r1, 0x1
_081E25F8:
	cmp r1, 0
	bne _081E262A
	movs r1, 0
	cmp r0, 0x1
	bhi _081E2604
	movs r1, 0x1
_081E2604:
	cmp r1, 0
	bne _081E262A
	movs r1, 0
	cmp r0, 0x4
	bne _081E2610
	movs r1, 0x1
_081E2610:
	cmp r1, 0
	beq _081E2624
_081E2614:
	ldr r0, [sp, 0x4]
	ldr r1, _081E2620
	cmp r0, 0
	beq _081E2642
	adds r1, 0x1
	b _081E2642
	.align 2, 0
_081E2620: .4byte 0x7fffffff
_081E2624:
	ldr r1, [sp, 0x8]
	cmp r1, 0
	bge _081E262E
_081E262A:
	movs r0, 0
	b _081E2644
_081E262E:
	cmp r1, 0x1E
	bgt _081E2614
	movs r0, 0x1E
	subs r0, r1
	ldr r1, [sp, 0xC]
	lsrs r1, r0
	ldr r0, [sp, 0x4]
	cmp r0, 0
	beq _081E2642
	negs r1, r1
_081E2642:
	adds r0, r1, 0
_081E2644:
	add sp, 0x14
	pop {pc}
	thumb_func_end __fixsfsi

	thumb_func_start __negsf2
__negsf2: ; 81E2648
	push {lr}
	sub sp, 0x14
	str r0, [sp, 0x10]
	add r0, sp, 0x10
	mov r1, sp
	bl __unpack_f
	movs r1, 0
	ldr r0, [sp, 0x4]
	cmp r0, 0
	bne _081E2660
	movs r1, 0x1
_081E2660:
	str r1, [sp, 0x4]
	mov r0, sp
	bl __pack_f
	add sp, 0x14
	pop {pc}
	thumb_func_end __negsf2

	thumb_func_start __make_fp
__make_fp: ; 81E266C
	push {lr}
	sub sp, 0x10
	str r0, [sp]
	str r1, [sp, 0x4]
	str r2, [sp, 0x8]
	str r3, [sp, 0xC]
	mov r0, sp
	bl __pack_f
	add sp, 0x10
	pop {pc}
	thumb_func_end __make_fp

	thumb_func_start __extendsfdf2
__extendsfdf2: ; 81E2684
	push {r4-r6,lr}
	sub sp, 0x18
	str r0, [sp, 0x14]
	add r0, sp, 0x14
	add r1, sp, 0x4
	bl __unpack_f
	ldr r0, [sp, 0x4]
	ldr r1, [sp, 0x8]
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	movs r4, 0
	lsrs r6, r3, 2
	lsls r5, r4, 30
	adds r4, r6, 0
	orrs r4, r5
	lsls r3, 30
	str r4, [sp]
	bl __make_dp
	add sp, 0x18
	pop {r4-r6,pc}
	thumb_func_end __extendsfdf2

	thumb_func_start __lshrdi3
__lshrdi3: ; 81E26B0
	push {r4-r6,lr}
	adds r6, r1, 0
	adds r5, r0, 0
	cmp r2, 0
	beq _081E26E0
	movs r0, 0x20
	subs r0, r2
	cmp r0, 0
	bgt _081E26CC
	movs r4, 0
	negs r0, r0
	adds r3, r6, 0
	lsrs r3, r0
	b _081E26DC
_081E26CC:
	adds r1, r6, 0
	lsls r1, r0
	adds r4, r6, 0
	lsrs r4, r2
	adds r0, r5, 0
	lsrs r0, r2
	adds r3, r0, 0
	orrs r3, r1
_081E26DC:
	adds r1, r4, 0
	adds r0, r3, 0
_081E26E0:
	pop {r4-r6,pc}
	thumb_func_end __lshrdi3

	thumb_func_start __negdi2
__negdi2: ; 81E26E4
	push {r4,lr}
	negs r2, r0
	adds r3, r2, 0
	negs r1, r1
	cmp r2, 0
	beq _081E26F2
	subs r1, 0x1
_081E26F2:
	adds r4, r1, 0
	adds r1, r4, 0
	adds r0, r3, 0
	pop {r4,pc}
	thumb_func_end __negdi2

	thumb_func_start memcpy
; void *memcpy(void *dest, void *src, int size)
memcpy: ; 81E26FC
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r5, 0
	adds r3, r1, 0
	cmp r2, 0xF
	bls _081E273C
	adds r0, r3, 0
	orrs r0, r5
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _081E273C
	adds r1, r5, 0
_081E2716:
	ldm r3!, {r0}
	stm r1!, {r0}
	ldm r3!, {r0}
	stm r1!, {r0}
	ldm r3!, {r0}
	stm r1!, {r0}
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x10
	cmp r2, 0xF
	bhi _081E2716
	cmp r2, 0x3
	bls _081E273A
_081E2730:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x4
	cmp r2, 0x3
	bhi _081E2730
_081E273A:
	adds r4, r1, 0
_081E273C:
	subs r2, 0x1
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	beq _081E2756
	adds r1, r0, 0
_081E2748:
	ldrb r0, [r3]
	strb r0, [r4]
	adds r3, 0x1
	adds r4, 0x1
	subs r2, 0x1
	cmp r2, r1
	bne _081E2748
_081E2756:
	adds r0, r5, 0
	pop {r4,r5,pc}
	thumb_func_end memcpy

	thumb_func_start memset
; void *memset(void *dest, char c, int size)
memset: ; 81E275C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r3, r5, 0
	cmp r2, 0x3
	bls _081E27A2
	movs r0, 0x3
	ands r0, r5
	cmp r0, 0
	bne _081E27A2
	adds r1, r5, 0
	movs r0, 0xFF
	ands r4, r0
	lsls r3, r4, 8
	orrs r3, r4
	lsls r0, r3, 16
	orrs r3, r0
	cmp r2, 0xF
	bls _081E2796
_081E2782:
	stm r1!, {r3}
	stm r1!, {r3}
	stm r1!, {r3}
	stm r1!, {r3}
	subs r2, 0x10
	cmp r2, 0xF
	bhi _081E2782
	b _081E2796
_081E2792:
	stm r1!, {r3}
	subs r2, 0x4
_081E2796:
	cmp r2, 0x3
	bhi _081E2792
	adds r3, r1, 0
	b _081E27A2
_081E279E:
	strb r4, [r3]
	adds r3, 0x1
_081E27A2:
	adds r0, r2, 0
	subs r2, 0x1
	cmp r0, 0
	bne _081E279E
	adds r0, r5, 0
	pop {r4,r5,pc}
	thumb_func_end memset

	thumb_func_start strcmp
; int strcmp(char *s1, char *s2)
strcmp: ; 81E27B0
	push {r4,r5,lr}
	adds r2, r0, 0
	adds r3, r1, 0
	orrs r0, r3
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _081E27F6
	ldr r1, [r2]
	ldr r0, [r3]
	cmp r1, r0
	bne _081E27F6
	ldr r5, _081E27DC
	ldr r4, _081E27E0
_081E27CC:
	ldr r1, [r2]
	adds r0, r1, r5
	bics r0, r1
	ands r0, r4
	cmp r0, 0
	beq _081E27E4
	movs r0, 0
	b _081E2808
	.align 2, 0
_081E27DC: .4byte 0xfefefeff
_081E27E0: .4byte 0x80808080
_081E27E4:
	adds r2, 0x4
	adds r3, 0x4
	ldr r1, [r2]
	ldr r0, [r3]
	cmp r1, r0
	beq _081E27CC
	b _081E27F6
_081E27F2:
	adds r2, 0x1
	adds r3, 0x1
_081E27F6:
	ldrb r0, [r2]
	cmp r0, 0
	beq _081E2802
	ldrb r1, [r3]
	cmp r0, r1
	beq _081E27F2
_081E2802:
	ldrb r2, [r2]
	ldrb r3, [r3]
	subs r0, r2, r3
_081E2808:
	pop {r4,r5,pc}
	thumb_func_end strcmp
