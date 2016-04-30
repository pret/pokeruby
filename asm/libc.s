	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start memcpy
@ void *memcpy(void *dest, void *src, int size)
memcpy: @ 81E26FC
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
@ void *memset(void *dest, char c, int size)
memset: @ 81E275C
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
@ int strcmp(char *s1, char *s2)
strcmp: @ 81E27B0
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

	.align 2, 0 @ Don't pad with nop.
