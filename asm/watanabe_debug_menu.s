.if DEBUG

	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.text

	thumb_func_start debug_80C627C
debug_80C627C:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffff8
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	add	r6, r4, #0
	ldr	r1, ._584       @ gUnknown_Debug_083F7FD4
	mov	r0, sp
	mov	r2, #0x2
	bl	memcpy
	add	r5, sp, #0x4
	ldr	r1, ._584 + 4   @ gUnknown_Debug_083F8764
	add	r0, r5, #0
	mov	r2, #0x2
	bl	memcpy
	cmp	r4, #0x1
	beq	._580	@cond_branch
	cmp	r4, #0x1
	bgt	._581	@cond_branch
	cmp	r4, #0
	beq	._582	@cond_branch
	b	._595
._585:
	.align	2, 0
._584:
	.word	gUnknown_Debug_083F7FD4
	.word	gUnknown_Debug_083F8764
._581:
	cmp	r6, #0x2
	beq	._586	@cond_branch
	b	._595
._582:
	ldr	r0, ._589       @ gUnknown_Debug_2038A1C
	ldr	r0, [r0]
	ldr	r1, ._589 + 4   @ 0x169
	add	r0, r0, r1
	b	._588
._590:
	.align	2, 0
._589:
	.word	gUnknown_Debug_2038A1C
	.word	0x169
._580:
	ldr	r4, ._593       @ gUnknown_Debug_2038A1C
	ldr	r3, [r4]
	ldr	r1, ._593 + 4   @ 0x169
	add	r0, r3, r1
	ldrb	r2, [r0]
	ldr	r1, ._593 + 8   @ gUnknown_Debug_083F8698
	mov	r6, #0xb4
	lsl	r6, r6, #0x1
	add	r0, r3, r6
	ldrb	r0, [r0]
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldrb	r0, [r0, #0x4]
	sub	r0, r0, #0x1
	cmp	r2, r0
	bge	._595	@cond_branch
	lsl	r2, r2, #0x19
	mov	r0, #0xa0
	lsl	r0, r0, #0x13
	add	r2, r2, r0
	lsr	r2, r2, #0x18
	add	r0, r5, #0
	mov	r1, #0x1
	bl	Menu_PrintText
	ldr	r0, [r4]
	ldr	r2, ._593 + 4   @ 0x169
	add	r1, r0, r2
	ldrb	r0, [r1]
	add	r0, r0, #0x1
	strb	r0, [r1]
	ldr	r0, [r4]
	add	r0, r0, r2
._588:
	ldrb	r2, [r0]
	lsl	r2, r2, #0x19
	mov	r6, #0xa0
	lsl	r6, r6, #0x13
	add	r2, r2, r6
	lsr	r2, r2, #0x18
	mov	r0, sp
	mov	r1, #0x1
	bl	Menu_PrintText
	b	._595
._594:
	.align	2, 0
._593:
	.word	gUnknown_Debug_2038A1C
	.word	0x169
	.word	gUnknown_Debug_083F8698
._586:
	ldr	r4, ._596       @ gUnknown_Debug_2038A1C
	ldr	r0, [r4]
	ldr	r2, ._596 + 4   @ 0x169
	add	r1, r0, r2
	ldrb	r0, [r1]
	cmp	r0, #0
	beq	._595	@cond_branch
	add	r2, r0, #0
	lsl	r2, r2, #0x19
	mov	r6, #0xa0
	lsl	r6, r6, #0x13
	add	r2, r2, r6
	lsr	r2, r2, #0x18
	add	r0, r5, #0
	mov	r1, #0x1
	bl	Menu_PrintText
	ldr	r0, [r4]
	ldr	r2, ._596 + 4   @ 0x169
	add	r1, r0, r2
	ldrb	r0, [r1]
	sub	r0, r0, #0x1
	strb	r0, [r1]
	ldr	r0, [r4]
	add	r0, r0, r2
	ldrb	r2, [r0]
	lsl	r2, r2, #0x19
	add	r2, r2, r6
	lsr	r2, r2, #0x18
	mov	r0, sp
	mov	r1, #0x1
	bl	Menu_PrintText
._595:
	add	sp, sp, #0x8
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._597:
	.align	2, 0
._596:
	.word	gUnknown_Debug_2038A1C
	.word	0x169

	thumb_func_end debug_80C627C

	thumb_func_start debug_80C6384
debug_80C6384:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	mov	r0, #0x0
	mov	r1, #0x4
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	mov	r5, #0x0
	ldr	r3, ._600       @ gUnknown_Debug_083F8698
	ldr	r1, ._600 + 4   @ gUnknown_Debug_2038A1C
	ldr	r0, [r1]
	mov	r2, #0xb4
	lsl	r2, r2, #0x1
	add	r0, r0, r2
	ldrb	r0, [r0]
	lsl	r0, r0, #0x3
	add	r0, r0, r3
	ldr	r0, [r0]
	ldrb	r0, [r0]
	cmp	r0, #0xff
	beq	._598	@cond_branch
	add	r4, r1, #0
	ldr	r0, ._600 + 8   @ 0x16b
	mov	r9, r0
	mov	r8, r3
	add	r7, r2, #0
	mov	r6, #0x1
._599:
	ldr	r0, [r4]
	add r0, r0, r9
	mov	r1, #0xfc
	strb	r1, [r0]
	ldr	r0, [r4]
	add	r1, r1, #0x70
	add	r0, r0, r1
	strb	r6, [r0]
	ldr	r0, [r4]
	ldr	r2, ._600 + 12  @ 0x16d
	add	r0, r0, r2
	strb	r6, [r0]
	ldr	r1, [r4]
	add	r2, r2, #0x1
	add	r0, r1, r2
	add	r1, r1, r7
	ldrb	r1, [r1]
	lsl	r1, r1, #0x3
	add r1, r1, r8
	ldr	r1, [r1]
	add	r1, r1, r5
	ldrb	r1, [r1]
	mov	r2, #0x1
	bl	debug_80C5738
	ldr	r0, [r4]
	add r0, r0, r9
	lsl	r2, r5, #0x19
	mov	r1, #0xa0
	lsl	r1, r1, #0x13
	add	r2, r2, r1
	lsr	r2, r2, #0x18
	mov	r1, #0x2
	bl	Menu_PrintText
	add	r0, r5, #1
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	ldr	r0, [r4]
	add	r0, r0, r7
	ldrb	r0, [r0]
	lsl	r0, r0, #0x3
	add r0, r0, r8
	ldr	r0, [r0]
	add	r0, r0, r5
	ldrb	r0, [r0]
	cmp	r0, #0xff
	bne	._599	@cond_branch
._598:
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._601:
	.align	2, 0
._600:
	.word	gUnknown_Debug_083F8698
	.word	gUnknown_Debug_2038A1C
	.word	0x16b
	.word	0x16d

	thumb_func_end debug_80C6384

	thumb_func_start debug_80C643C
debug_80C643C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	mov	r0, #0x2
	mov	r1, #0x5
	mov	r2, #0x1c
	mov	r3, #0x12
	bl	Menu_BlankWindowRect
	mov	r5, #0x0
	ldr	r6, ._605       @ gUnknown_Debug_083F8698
	ldr	r1, ._605 + 4   @ gUnknown_Debug_2038A1C
	ldr	r0, [r1]
	mov	r3, #0xb4
	lsl	r3, r3, #0x1
	add	r0, r0, r3
	ldrb	r0, [r0]
	lsl	r0, r0, #0x3
	add	r0, r0, r6
	ldr	r0, [r0]
	ldrb	r0, [r0]
	cmp	r0, #0xff
	beq	._602	@cond_branch
	add	r4, r1, #0
	mov	r0, #0x1
	mov	r8, r0
._607:
	ldr	r0, [r4]
	ldr	r7, ._605 + 8   @ 0x16b
	add	r2, r0, r7
	mov	r0, #0xfc
	strb	r0, [r2]
	ldr	r0, [r4]
	mov	r2, #0xb6
	lsl	r2, r2, #0x1
	add	r0, r0, r2
	mov	r7, r8
	strb	r7, [r0]
	ldr	r2, [r4]
	ldr	r7, ._605 + 12  @ 0x169
	add	r0, r2, r7
	ldrb	r0, [r0]
	cmp	r5, r0
	bne	._603	@cond_branch
	ldr	r0, ._605 + 16  @ 0x16d
	add	r2, r2, r0
	mov	r0, #0x2
	strb	r0, [r2]
	ldr	r1, [r1]
	mov	r2, #0xb7
	lsl	r2, r2, #0x1
	add	r0, r1, r2
	add	r1, r1, r3
	ldrb	r1, [r1]
	lsl	r1, r1, #0x3
	add	r1, r1, r6
	ldr	r1, [r1]
	add	r1, r1, r5
	ldrb	r1, [r1]
	mov	r2, #0x2
	bl	debug_80C5738
	b	._604
._606:
	.align	2, 0
._605:
	.word	gUnknown_Debug_083F8698
	.word	gUnknown_Debug_2038A1C
	.word	0x16b
	.word	0x169
	.word	0x16d
._603:
	ldr	r3, ._608       @ 0x16d
	add	r0, r2, r3
	mov	r7, r8
	strb	r7, [r0]
	ldr	r1, [r1]
	mov	r2, #0xb7
	lsl	r2, r2, #0x1
	add	r0, r1, r2
	ldr	r2, ._608 + 4   @ gUnknown_Debug_083F8698
	sub	r3, r3, #0x5
	add	r1, r1, r3
	ldrb	r1, [r1]
	lsl	r1, r1, #0x3
	add	r1, r1, r2
	ldr	r1, [r1]
	add	r1, r1, r5
	ldrb	r1, [r1]
	mov	r2, #0x1
	bl	debug_80C5738
._604:
	ldr	r0, [r4]
	ldr	r7, ._608 + 8   @ 0x16b
	add	r0, r0, r7
	lsl	r2, r5, #0x19
	mov	r1, #0xa0
	lsl	r1, r1, #0x13
	add	r2, r2, r1
	lsr	r2, r2, #0x18
	mov	r1, #0x2
	bl	Menu_PrintText
	add	r0, r5, #1
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	ldr	r6, ._608 + 4   @ gUnknown_Debug_083F8698
	add	r1, r4, #0
	ldr	r0, [r4]
	mov	r3, #0xb4
	lsl	r3, r3, #0x1
	add	r0, r0, r3
	ldrb	r0, [r0]
	lsl	r0, r0, #0x3
	add	r0, r0, r6
	ldr	r0, [r0]
	add	r0, r0, r5
	ldrb	r0, [r0]
	cmp	r0, #0xff
	bne	._607	@cond_branch
._602:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._609:
	.align	2, 0
._608:
	.word	0x16d
	.word	gUnknown_Debug_083F8698
	.word	0x16b

	thumb_func_end debug_80C643C

	thumb_func_start debug_80C6544
debug_80C6544:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r9, r0
	ldr	r0, ._614       @ gUnknown_Debug_083F8698
	mov	r8, r0
	ldr	r6, ._614 + 4   @ gUnknown_Debug_2038A1C
	ldr	r1, [r6]
	mov	r5, #0xb4
	lsl	r5, r5, #0x1
	add	r0, r1, r5
	ldrb	r0, [r0]
	lsl	r0, r0, #0x3
	add r0, r0, r8
	ldr	r4, ._614 + 8   @ 0x169
	add	r1, r1, r4
	ldrb	r1, [r1]
	ldr	r0, [r0]
	add	r0, r0, r1
	ldrb	r0, [r0]
	bl	debug_80C5B60
	add	r7, r0, #0
	ldr	r2, ._614 + 12  @ gUnknown_Debug_083F8554
	ldr	r3, [r6]
	add	r5, r3, r5
	ldrb	r0, [r5]
	lsl	r0, r0, #0x3
	add r0, r0, r8
	add	r4, r3, r4
	ldrb	r1, [r4]
	ldr	r0, [r0]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x3
	add	r2, r2, #0x4
	add	r0, r0, r2
	ldr	r1, [r0]
	ldr	r5, [r1]
	ldr	r4, [r1, #0x4]
	ldr	r2, ._614 + 16  @ gUnknown_Debug_083F8768
	mov	r6, #0xb5
	lsl	r6, r6, #0x1
	add	r0, r3, r6
	ldrb	r0, [r0]
	lsl	r0, r0, #0x2
	add	r0, r0, r2
	ldr	r3, [r0]
	ldrb	r0, [r1, #0x8]
	cmp	r0, #0
	bne	._623	@cond_branch
	mov	r0, r9
	cmp	r0, #0x1
	beq	._611	@cond_branch
	cmp	r0, #0x2
	beq	._612	@cond_branch
	b	._623
._615:
	.align	2, 0
._614:
	.word	gUnknown_Debug_083F8698
	.word	gUnknown_Debug_2038A1C
	.word	0x169
	.word	gUnknown_Debug_083F8554
	.word	gUnknown_Debug_083F8768
._611:
	sub	r0, r4, r3
	cmp	r7, r0
	bcs	._616	@cond_branch
	add	r7, r7, r3
	b	._623
._616:
	cmp	r7, r4
	bcc	._622	@cond_branch
	b	._619
._612:
	add	r0, r5, r3
	cmp	r7, r0
	bls	._620	@cond_branch
	sub	r7, r7, r3
	b	._623
._620:
	cmp	r7, r5
	bls	._622	@cond_branch
._619:
	add	r7, r5, #0
	b	._623
._622:
	add	r7, r4, #0
._623:
	ldr	r1, ._624       @ gUnknown_Debug_083F8698
	ldr	r0, ._624 + 4   @ gUnknown_Debug_2038A1C
	ldr	r2, [r0]
	mov	r3, #0xb4
	lsl	r3, r3, #0x1
	add	r0, r2, r3
	ldrb	r0, [r0]
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r6, ._624 + 8   @ 0x169
	add	r1, r2, r6
	ldrb	r1, [r1]
	ldr	r0, [r0]
	add	r0, r0, r1
	ldrb	r1, [r0]
	add	r0, r7, #0
	bl	debug_80C5B74
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._625:
	.align	2, 0
._624:
	.word	gUnknown_Debug_083F8698
	.word	gUnknown_Debug_2038A1C
	.word	0x169

	thumb_func_end debug_80C6544

	thumb_func_start debug_80C6630
debug_80C6630:
	push	{r4, r5, lr}
	add	r4, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	lsl	r3, r3, #0x18
	lsr	r3, r3, #0x18
	mov	r0, #0xfc
	strb	r0, [r4]
	add	r4, r4, #0x1
	mov	r0, #0x1
	strb	r0, [r4]
	add	r4, r4, #0x1
	cmp	r2, #0x2
	bne	._626	@cond_branch
	ldr	r0, ._629       @ gUnknown_Debug_2038A1C
	ldr	r0, [r0]
	mov	r5, #0xb5
	lsl	r5, r5, #0x1
	add	r0, r0, r5
	ldrb	r0, [r0]
	cmp	r3, r0
	beq	._627	@cond_branch
	strb	r2, [r4]
	b	._628
._630:
	.align	2, 0
._629:
	.word	gUnknown_Debug_2038A1C
._627:
	mov	r0, #0x4
._626:
	strb	r0, [r4]
._628:
	add	r0, r1, #0
	add	r0, r0, #0xa1
	strb	r0, [r4, #0x1]
	pop	{r4, r5}
	pop	{r0}
	bx	r0

	thumb_func_end debug_80C6630

	thumb_func_start debug_80C6678
debug_80C6678:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	mov	r9, r0
	add	r6, r1, #0
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	lsl	r3, r3, #0x18
	lsr	r3, r3, #0x18
	mov	r8, r3
	mov	r7, #0x0
	sub	r0, r2, #1
	cmp	r0, #0x9
	bhi	._644	@cond_branch
	lsl	r0, r0, #0x2
	ldr	r1, ._633       @ 
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
._634:
	.align	2, 0
._633:
	.word	._632
._632:
	.word	._635
	.word	._636
	.word	._637
	.word	._638
	.word	._639
	.word	._640
	.word	._641
	.word	._642
	.word	._643
	.word	._644
._644:
	mov	r0, r9
	add	r4, r0, r7
	ldr	r5, ._645       @ 0x3b9aca00
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__udivsi3
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r0, r4, #0
	mov	r2, r8
	mov	r3, #0x9
	bl	debug_80C6630
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__umodsi3
	add	r6, r0, #0
	add	r0, r7, #4
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
._643:
	mov	r1, r9
	add	r4, r1, r7
	ldr	r5, ._645 + 4   @ 0x5f5e100
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__udivsi3
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r0, r4, #0
	mov	r2, r8
	mov	r3, #0x8
	bl	debug_80C6630
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__umodsi3
	add	r6, r0, #0
	add	r0, r7, #4
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
._642:
	mov	r0, r9
	add	r4, r0, r7
	ldr	r5, ._645 + 8   @ 0x989680
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__udivsi3
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r0, r4, #0
	mov	r2, r8
	mov	r3, #0x7
	bl	debug_80C6630
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__umodsi3
	add	r6, r0, #0
	add	r0, r7, #4
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
._641:
	mov	r1, r9
	add	r4, r1, r7
	ldr	r5, ._645 + 12  @ 0xf4240
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__udivsi3
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r0, r4, #0
	mov	r2, r8
	mov	r3, #0x6
	bl	debug_80C6630
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__umodsi3
	add	r6, r0, #0
	add	r0, r7, #4
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
._640:
	mov	r0, r9
	add	r4, r0, r7
	ldr	r5, ._645 + 16  @ 0x186a0
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__udivsi3
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r0, r4, #0
	mov	r2, r8
	mov	r3, #0x5
	bl	debug_80C6630
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__umodsi3
	add	r6, r0, #0
	add	r0, r7, #4
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
._639:
	mov	r1, r9
	add	r4, r1, r7
	ldr	r5, ._645 + 20  @ 0x2710
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__udivsi3
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r0, r4, #0
	mov	r2, r8
	mov	r3, #0x4
	bl	debug_80C6630
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__umodsi3
	add	r6, r0, #0
	add	r0, r7, #4
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
._638:
	mov	r0, r9
	add	r4, r0, r7
	mov	r5, #0xfa
	lsl	r5, r5, #0x2
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__udivsi3
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r0, r4, #0
	mov	r2, r8
	mov	r3, #0x3
	bl	debug_80C6630
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__umodsi3
	add	r6, r0, #0
	add	r0, r7, #4
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
._637:
	mov	r1, r9
	add	r4, r1, r7
	add	r0, r6, #0
	mov	r1, #0x64
	bl	__udivsi3
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r0, r4, #0
	mov	r2, r8
	mov	r3, #0x2
	bl	debug_80C6630
	add	r0, r6, #0
	mov	r1, #0x64
	bl	__umodsi3
	add	r6, r0, #0
	add	r0, r7, #4
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
._636:
	mov	r0, r9
	add	r4, r0, r7
	add	r0, r6, #0
	mov	r1, #0xa
	bl	__udivsi3
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r0, r4, #0
	mov	r2, r8
	mov	r3, #0x1
	bl	debug_80C6630
	add	r0, r6, #0
	mov	r1, #0xa
	bl	__umodsi3
	add	r6, r0, #0
	add	r0, r7, #4
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
._635:
	mov	r1, r9
	add	r0, r1, r7
	lsl	r1, r6, #0x18
	lsr	r1, r1, #0x18
	mov	r2, r8
	mov	r3, #0x0
	bl	debug_80C6630
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._646:
	.align	2, 0
._645:
	.word	0x3b9aca00
	.word	0x5f5e100
	.word	0x989680
	.word	0xf4240
	.word	0x186a0
	.word	0x2710

	thumb_func_end debug_80C6678

	thumb_func_start debug_80C689C
debug_80C689C:
	push	{r4, r5, lr}
	add	r5, r0, #0
	add	r4, r1, #0
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	mov	r3, #0x0
	ldrb	r0, [r4]
	b	._647
._649:
	add	r1, r5, r3
	add	r0, r4, r3
	ldrb	r0, [r0]
	strb	r0, [r1]
	add	r0, r3, #1
	lsl	r0, r0, #0x18
	lsr	r3, r0, #0x18
	add	r0, r4, r3
	ldrb	r0, [r0]
._647:
	cmp	r0, #0xff
	beq	._648	@cond_branch
	cmp	r3, r2
	bcc	._649	@cond_branch
._648:
	pop	{r4, r5}
	pop	{r0}
	bx	r0

	thumb_func_end debug_80C689C

	thumb_func_start debug_80C68CC
debug_80C68CC:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffff8
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	lsl	r1, r1, #0x18
	lsr	r6, r1, #0x18
	lsl	r2, r2, #0x18
	lsr	r5, r2, #0x18
	lsl	r3, r3, #0x18
	lsr	r3, r3, #0x18
	mov	r2, #0x0
	mov	r1, #0x0
._650:
	mov	r7, sp
	add	r0, r7, r2
	strb	r1, [r0]
	add	r0, r2, #1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0x3
	bls	._650	@cond_branch
	mov	r1, sp
	mov	r0, #0xff
	strb	r0, [r1, #0x4]
	cmp	r3, #0x2
	beq	._651	@cond_branch
	cmp	r3, #0x2
	bgt	._652	@cond_branch
	cmp	r3, #0x1
	beq	._653	@cond_branch
	b	._654
._652:
	cmp	r3, #0x3
	beq	._655	@cond_branch
._654:
	mov	r1, sp
	lsr	r0, r4, #0xc
	strb	r0, [r1]
._655:
	mov	r1, sp
	mov	r0, #0xf0
	lsl	r0, r0, #0x4
	and	r0, r0, r4
	lsr	r0, r0, #0x8
	strb	r0, [r1, #0x1]
._651:
	mov	r1, sp
	mov	r0, #0xf0
	and	r0, r0, r4
	lsr	r0, r0, #0x4
	strb	r0, [r1, #0x2]
._653:
	mov	r2, sp
	mov	r1, #0xf
	add	r0, r4, #0
	and	r0, r0, r1
	strb	r0, [r2, #0x3]
	mov	r2, #0x0
._658:
	mov	r0, sp
	add	r1, r0, r2
	ldrb	r0, [r1]
	cmp	r0, #0x9
	bhi	._656	@cond_branch
	add	r0, r0, #0xa1
	b	._657
._656:
	add	r0, r0, #0xb1
._657:
	strb	r0, [r1]
	add	r0, r2, #1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0x3
	bls	._658	@cond_branch
	mov	r0, #0x4
	sub	r0, r0, r3
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	add r0, r0, sp
	add	r1, r6, #0
	add	r2, r5, #0
	bl	Menu_PrintText
	add	sp, sp, #0x8
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0

	thumb_func_end debug_80C68CC

	thumb_func_start InitSeePokemonGraphics
InitSeePokemonGraphics:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffff8
	bl	debug_80C35DC
	ldr	r1, ._659       @ byte_83F88EC
	ldr	r2, ._659 + 4   @ 0x600e000
	ldr	r0, ._659 + 8   @ 0x40000d4
	str	r1, [r0]
	str	r2, [r0, #0x4]
	ldr	r1, ._659 + 12  @ 0x80000400
	str	r1, [r0, #0x8]
	ldr	r0, [r0, #0x8]
	ldr	r0, ._659 + 16  @ word_83F888C
	mov	r1, #0x80
	mov	r2, #0x60
	bl	LoadPalette
	ldr	r1, ._659 + 20  @ 0x7fff
	add	r0, sp, #0x4
	strh	r1, [r0]
	mov	r1, #0x0
	mov	r2, #0x2
	bl	LoadPalette
	mov	r0, #0x1
	neg	r0, r0
	mov	r5, #0x0
	str	r5, [sp]
	mov	r1, #0x0
	mov	r2, #0x10
	mov	r3, #0x0
	bl	BeginNormalPaletteFade
	ldr	r0, ._659 + 24  @ 0x4000040
	mov	r6, #0x0
	strh	r5, [r0]
	add	r0, r0, #0x4
	strh	r5, [r0]
	sub	r0, r0, #0x2
	strh	r5, [r0]
	add	r0, r0, #0x4
	strh	r5, [r0]
	ldr	r1, ._659 + 28  @ 0x4000048
	mov	r0, #0x3f
	strh	r0, [r1]
	add	r1, r1, #0x2
	mov	r0, #0x1f
	strh	r0, [r1]
	add	r1, r1, #0x6
	mov	r0, #0xf1
	strh	r0, [r1]
	ldr	r0, ._659 + 32  @ 0x4000052
	strh	r5, [r0]
	add	r1, r1, #0x4
	mov	r0, #0x7
	strh	r0, [r1]
	ldr	r3, ._659 + 36  @ 0x4000208
	ldrh	r2, [r3]
	strh	r5, [r3]
	ldr	r4, ._659 + 40  @ 0x4000200
	ldrh	r0, [r4]
	mov	r1, #0x1
	orr	r0, r0, r1
	strh	r0, [r4]
	strh	r2, [r3]
	ldr	r0, ._659 + 44  @ debug_80C3758
	bl	SetVBlankCallback
	ldr	r0, ._659 + 48  @ debug_80C370C
	bl	SetMainCallback2
	bl	sub_809D51C
	ldr	r1, ._659 + 52  @ 0x4000008
	ldr	r2, ._659 + 56  @ 0x1f0b
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x2
	ldr	r2, ._659 + 60  @ 0x1e0a
	add	r0, r2, #0
	strh	r0, [r1]
	sub	r1, r1, #0xa
	mov	r2, #0xcd
	lsl	r2, r2, #0x6
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r0, ._659 + 64  @ debug_80C6B00
	mov	r1, #0x0
	bl	CreateTask
	ldr	r1, ._659 + 68  @ gUnknown_Debug_2038A20
	ldr	r0, ._659 + 72  @ 0x2018000
	str	r0, [r1]
	ldr	r1, ._659 + 76  @ 0x115
	strh	r1, [r0]
	strb	r6, [r0, #0x2]
	strb	r6, [r0, #0x3]
	strb	r6, [r0, #0x5]
	strb	r6, [r0, #0x7]
	strb	r6, [r0, #0xa]
	strb	r6, [r0, #0x8]
	ldr	r4, ._659 + 80  @ gSpriteTemplate_83F8874
	add	r0, r4, #0
	mov	r1, #0x6c
	mov	r2, #0x74
	mov	r3, #0x0
	bl	CreateSprite
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	ldr	r6, ._659 + 84  @ gSprites
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r6
	strh	r5, [r0, #0x2e]
	mov	r1, #0x0
	bl	StartSpriteAnim
	add	r0, r4, #0
	mov	r1, #0x6c
	mov	r2, #0x74
	mov	r3, #0x0
	bl	CreateSprite
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r6
	mov	r1, #0x1
	strh	r1, [r0, #0x2e]
	bl	StartSpriteAnim
	add	r0, r4, #0
	mov	r1, #0x6c
	mov	r2, #0x74
	mov	r3, #0x0
	bl	CreateSprite
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r6
	mov	r1, #0x2
	strh	r1, [r0, #0x2e]
	bl	StartSpriteAnim
	add	sp, sp, #0x8
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._660:
	.align	2, 0
._659:
	.word	byte_83F88EC
	.word	0x600e000
	.word	0x40000d4
	.word	0x80000400
	.word	word_83F888C
	.word	0x7fff
	.word	0x4000040
	.word	0x4000048
	.word	0x4000052
	.word	0x4000208
	.word	0x4000200
	.word	debug_80C3758+1
	.word	debug_80C370C+1
	.word	0x4000008
	.word	0x1f0b
	.word	0x1e0a
	.word	debug_80C6B00+1
	.word	gUnknown_Debug_2038A20
	.word	0x2018000
	.word	0x115
	.word	gSpriteTemplate_83F8874
	.word	gSprites

	thumb_func_end InitSeePokemonGraphics

	thumb_func_start debug_80C6B00
debug_80C6B00:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xffffffec
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
	ldr	r1, ._666       @ gUnknown_Debug_083F8815
	mov	r0, sp
	mov	r2, #0x12
	bl	memcpy
	mov	r0, #0xa
	mov	r1, #0x0
	mov	r2, #0xf
	mov	r3, #0x7
	bl	Menu_DrawStdWindowFrame
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x9
	mov	r3, #0x9
	bl	Menu_DrawStdWindowFrame
	mov	r0, #0x0
	mov	r1, #0xa
	mov	r2, #0x9
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	mov	r0, #0x10
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x7
	bl	Menu_DrawStdWindowFrame
	ldr	r0, ._666 + 4   @ gUnknown_Debug_083F87D0
	mov	r1, #0x11
	mov	r2, #0x1
	bl	Menu_PrintText
	ldr	r0, ._666 + 8   @ gUnknown_Debug_083F87D8
	mov	r1, #0x1b
	mov	r2, #0x1
	bl	Menu_PrintText
	ldr	r0, ._666 + 12  @ gUnknown_Debug_083F87E0
	mov	r1, #0x11
	mov	r2, #0x5
	bl	Menu_PrintText
	mov	r0, #0xa
	mov	r1, #0x8
	mov	r2, #0x1d
	mov	r3, #0xc
	bl	Menu_DrawStdWindowFrame
	mov	r2, #0x0
	ldr	r4, ._666 + 16  @ 0x600fa56
	ldr	r0, ._666 + 20  @ 0xa311
	add	r3, r0, #0
._661:
	lsl	r0, r2, #0x1
	add	r0, r0, r4
	add	r1, r2, r3
	strh	r1, [r0]
	add	r0, r2, #1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0xe
	bls	._661	@cond_branch
	mov	r2, #0x0
	ldr	r5, ._666 + 24  @ gUnknown_Debug_083F87F4
	lsl	r6, r7, #0x2
	mov	r8, r6
	ldr	r4, ._666 + 28  @ 0x600f256
	ldr	r0, ._666 + 32  @ 0x8301
	add	r3, r0, #0
._662:
	lsl	r0, r2, #0x1
	add	r0, r0, r4
	add	r1, r2, r3
	strh	r1, [r0]
	add	r0, r2, #1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0xe
	bls	._662	@cond_branch
	add	r0, r5, #0
	mov	r1, #0x14
	mov	r2, #0xa
	bl	Menu_PrintText
	mov	r0, #0xa
	mov	r1, #0xd
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	mov	r1, sp
	mov	r0, #0x23
	strb	r0, [r1]
	mov	r2, #0x0
	ldr	r4, ._666 + 36  @ 0x600f396
	mov	r5, #0x93
	lsl	r5, r5, #0x8
	add	r3, r5, #0
._663:
	lsl	r1, r2, #0x1
	add	r1, r1, r4
	mov	r6, sp
	add	r0, r6, r2
	ldrb	r0, [r0]
	add	r0, r0, r3
	strh	r0, [r1]
	add	r0, r2, #1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0x11
	bls	._663	@cond_branch
	mov	r1, sp
	mov	r0, #0x24
	strb	r0, [r1]
	mov	r2, #0x0
	ldr	r5, ._666 + 40  @ gUnknown_Debug_083F8801
	ldr	r4, ._666 + 44  @ 0x600f3d6
	mov	r0, #0x93
	lsl	r0, r0, #0x8
	add	r3, r0, #0
._664:
	lsl	r1, r2, #0x1
	add	r1, r1, r4
	mov	r6, sp
	add	r0, r6, r2
	ldrb	r0, [r0]
	add	r0, r0, r3
	strh	r0, [r1]
	add	r0, r2, #1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0x11
	bls	._664	@cond_branch
	mov	r1, sp
	mov	r0, #0x25
	strb	r0, [r1]
	mov	r2, #0x0
	ldr	r4, ._666 + 48  @ 0x600f416
	mov	r0, #0x93
	lsl	r0, r0, #0x8
	add	r3, r0, #0
._665:
	lsl	r1, r2, #0x1
	add	r1, r1, r4
	mov	r6, sp
	add	r0, r6, r2
	ldrb	r0, [r0]
	add	r0, r0, r3
	strh	r0, [r1]
	add	r0, r2, #1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0x11
	bls	._665	@cond_branch
	add	r0, r5, #0
	mov	r1, #0xf
	mov	r2, #0x11
	bl	Menu_PrintText
	ldr	r1, ._666 + 52  @ 0x4000040
	ldr	r2, ._666 + 56  @ 0x51ef
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x4
	ldr	r5, ._666 + 60  @ 0x699f
	add	r0, r5, #0
	strh	r0, [r1]
	ldr	r1, ._666 + 64  @ gTasks
	mov	r6, r8
	add	r0, r6, r7
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._666 + 68  @ debug_80C6CB8
	str	r1, [r0]
	add	sp, sp, #0x14
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._667:
	.align	2, 0
._666:
	.word	gUnknown_Debug_083F8815
	.word	gUnknown_Debug_083F87D0
	.word	gUnknown_Debug_083F87D8
	.word	gUnknown_Debug_083F87E0
	.word	0x600fa56
	.word	0xa311
	.word	gUnknown_Debug_083F87F4
	.word	0x600f256
	.word	0x8301
	.word	0x600f396
	.word	gUnknown_Debug_083F8801
	.word	0x600f3d6
	.word	0x600f416
	.word	0x4000040
	.word	0x51ef
	.word	0x699f
	.word	gTasks
	.word	debug_80C6CB8+1

	thumb_func_end debug_80C6B00

	thumb_func_start debug_80C6CB8
debug_80C6CB8:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff4
	mov	sl, r0
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	sl, r0
	ldr	r5, ._668       @ gUnknown_Debug_2038A20
	ldr	r4, [r5]
	ldrh	r2, [r4]
	lsl	r0, r2, #0x3
	ldr	r1, ._668 + 4   @ gMonFrontPicTable
	add	r0, r0, r1
	ldr	r1, ._668 + 8   @ gMonFrontPicCoords
	lsl	r2, r2, #0x2
	add	r2, r2, r1
	ldrb	r1, [r2]
	ldrb	r2, [r2, #0x1]
	ldr	r3, ._668 + 12  @ gUnknown_081FAF4C
	mov	r8, r3
	ldr	r6, [r3]
	str	r6, [sp, #0x8]
	ldr	r3, [r3, #0x4]
	str	r3, [sp]
	ldrh	r3, [r4]
	str	r3, [sp, #0x4]
	add	r3, r6, #0
	bl	DecompressPicFromTable_2
	ldr	r0, [r5]
	ldrh	r0, [r0]
	lsl	r0, r0, #0x3
	ldr	r7, ._668 + 16  @ gMonPaletteTable
	add	r0, r0, r7
	bl	LoadCompressedObjectPalette
	ldr	r0, [r5]
	ldrh	r0, [r0]
	mov	r1, #0x1
	bl	GetMonSpriteTemplate_803C56C
	ldr	r0, ._668 + 20  @ gUnknown_02024E8C
	mov	r1, #0x28
	mov	r2, #0x28
	mov	r3, #0x0
	bl	CreateSprite
	ldr	r1, [r5]
	strb	r0, [r1, #0x2]
	ldr	r2, [r5]
	ldrb	r1, [r2, #0x2]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	ldr	r1, ._668 + 24  @ gSprites
	add	r0, r0, r1
	ldr	r3, ._668 + 28  @ debug_69
	mov	r9, r3
	str	r3, [r0]
	ldrb	r0, [r2, #0x2]
	lsl	r1, r0, #0x4
	add	r1, r1, r0
	lsl	r1, r1, #0x2
	ldr	r6, ._668 + 32  @ gSprites
	add	r1, r1, r6
	ldrb	r2, [r1, #0x5]
	mov	r6, #0xd
	neg	r6, r6
	add	r0, r6, #0
	and	r0, r0, r2
	strb	r0, [r1, #0x5]
	ldr	r4, [r5]
	ldrh	r2, [r4]
	lsl	r0, r2, #0x3
	ldr	r1, ._668 + 36  @ gMonBackPicTable
	add	r0, r0, r1
	ldr	r1, ._668 + 40  @ gMonBackPicCoords
	lsl	r2, r2, #0x2
	add	r2, r2, r1
	ldrb	r1, [r2]
	ldrb	r2, [r2, #0x1]
	mov	r7, r8
	ldr	r3, [r7, #0x8]
	str	r3, [sp]
	ldrh	r3, [r4]
	str	r3, [sp, #0x4]
	ldr	r3, [sp, #0x8]
	bl	DecompressPicFromTable_2
	ldr	r0, [r5]
	ldrh	r0, [r0]
	lsl	r0, r0, #0x3
	ldr	r1, ._668 + 16  @ gMonPaletteTable
	add	r0, r0, r1
	bl	LoadCompressedObjectPalette
	ldr	r0, [r5]
	ldrh	r0, [r0]
	mov	r1, #0x2
	bl	GetMonSpriteTemplate_803C56C
	ldr	r0, ._668 + 20  @ gUnknown_02024E8C
	mov	r1, #0x28
	mov	r2, #0x78
	mov	r3, #0x0
	bl	CreateSprite
	ldr	r1, [r5]
	strb	r0, [r1, #0x3]
	ldr	r2, [r5]
	ldrb	r1, [r2, #0x3]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	ldr	r3, ._668 + 24  @ gSprites
	add	r0, r0, r3
	mov	r7, r9
	str	r7, [r0]
	ldrb	r1, [r2, #0x3]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	ldr	r1, ._668 + 32  @ gSprites
	add	r0, r0, r1
	ldrb	r1, [r0, #0x5]
	and	r6, r6, r1
	strb	r6, [r0, #0x5]
	ldr	r0, [r5]
	ldrh	r0, [r0]
	ldr	r1, ._668 + 44  @ sub_809D62C
	mov	r2, #0x0
	str	r2, [sp]
	str	r2, [sp, #0x4]
	mov	r2, #0x68
	mov	r3, #0x2c
	bl	CreateMonIcon
	ldr	r1, [r5]
	strb	r0, [r1, #0x4]
	ldr	r0, [r5]
	ldrh	r0, [r0]
	bl	SpeciesToNationalPokedexNum
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r2, #0xff
	lsl	r2, r2, #0x2
	mov	r1, #0x2
	bl	sub_8091738
	ldr	r1, ._668 + 48  @ 0x600f858
	ldr	r3, ._668 + 52  @ 0xf3fc
	add	r0, r3, #0
	strh	r0, [r1]
	add	r1, r1, #0x2
	ldr	r6, ._668 + 56  @ 0xf3fd
	add	r0, r6, #0
	strh	r0, [r1]
	add	r1, r1, #0x3e
	ldr	r7, ._668 + 60  @ 0xf3fe
	add	r0, r7, #0
	strh	r0, [r1]
	add	r1, r1, #0x2
	ldr	r2, ._668 + 64  @ 0xf3ff
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r0, [r5]
	ldrh	r0, [r0]
	mov	r1, #0x11
	mov	r2, #0x3
	bl	debug_80C3800
	ldr	r0, [r5]
	ldrh	r0, [r0]
	mov	r1, #0x1a
	mov	r2, #0x5
	bl	debug_80C376C
	ldr	r2, [r5]
	ldrb	r1, [r2, #0x2]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	ldr	r3, ._668 + 32  @ gSprites
	add	r0, r0, r3
	ldrb	r0, [r0, #0x5]
	lsr	r0, r0, #0x4
	strb	r0, [r2, #0x6]
	ldr	r0, [r5]
	ldrb	r0, [r0, #0x6]
	lsl	r0, r0, #0x5
	ldr	r4, ._668 + 68  @ gPlttBufferUnfaded
	add	r0, r0, r4
	ldr	r6, ._668 + 72  @ 0xffffff00
	add	r1, r4, r6
	mov	r2, #0x10
	bl	CpuSet
	ldr	r0, [r5]
	ldrb	r0, [r0, #0x6]
	lsl	r0, r0, #0x5
	add	r0, r0, r4
	ldr	r1, ._668 + 76  @ gPlttBufferFaded
	mov	r2, #0x10
	bl	CpuSet
	ldr	r1, ._668 + 80  @ gTasks
	mov	r7, sl
	lsl	r0, r7, #0x2
	add r0, r0, sl
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._668 + 84  @ debug_80C6EE8
	str	r1, [r0]
	ldr	r0, [r5]
	mov	r1, #0x0
	strb	r1, [r0, #0x9]
	bl	StopCryAndClearCrySongs
	ldr	r0, [r5]
	ldrh	r0, [r0]
	mov	r1, #0x0
	bl	PlayCry1
	add	sp, sp, #0xc
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._669:
	.align	2, 0
._668:
	.word	gUnknown_Debug_2038A20
	.word	gMonFrontPicTable
	.word	gMonFrontPicCoords
	.word	gUnknown_081FAF4C
	.word	gMonPaletteTable
	.word	gUnknown_02024E8C
	.word	gSprites+0x1c
	.word	debug_69+1
	.word	gSprites
	.word	gMonBackPicTable
	.word	gMonBackPicCoords
	.word	sub_809D62C+1
	.word	0x600f858
	.word	0xf3fc
	.word	0xf3fd
	.word	0xf3fe
	.word	0xf3ff
	.word	gPlttBufferUnfaded+0x200
	.word	0xffffff00
	.word	gPlttBufferFaded+0x100
	.word	gTasks
	.word	debug_80C6EE8+1

	thumb_func_end debug_80C6CB8

	thumb_func_start debug_80C6EE8
debug_80C6EE8:
	push	{r4, r5, r6, lr}
	add	r6, r0, #0
	lsl	r6, r6, #0x18
	lsr	r6, r6, #0x18
	ldr	r4, ._670       @ gPlttBufferUnfaded
	ldr	r5, ._670 + 4   @ gUnknown_Debug_2038A20
	ldr	r1, [r5]
	add	r1, r1, #0x10
	add	r0, r4, #0
	mov	r2, #0x10
	bl	CpuSet
	ldr	r0, ._670 + 8   @ 0xffffff00
	add	r4, r4, r0
	ldr	r3, [r5]
	ldrb	r0, [r3, #0x7]
	add	r0, r0, #0x81
	lsl	r0, r0, #0x1
	add	r0, r0, r4
	ldrh	r4, [r0]
	mov	r1, #0x1f
	and	r1, r1, r4
	ldrb	r2, [r3, #0xc]
	mov	r0, #0x20
	neg	r0, r0
	and	r0, r0, r2
	orr	r0, r0, r1
	strb	r0, [r3, #0xc]
	ldr	r3, [r5]
	mov	r1, #0xf8
	lsl	r1, r1, #0x2
	and	r1, r1, r4
	ldrh	r2, [r3, #0xc]
	ldr	r0, ._670 + 12  @ 0xfffffc1f
	and	r0, r0, r2
	orr	r0, r0, r1
	strh	r0, [r3, #0xc]
	mov	r1, #0xf8
	lsl	r1, r1, #0x7
	and	r1, r1, r4
	lsr	r1, r1, #0x8
	ldrb	r2, [r3, #0xd]
	mov	r0, #0x7d
	neg	r0, r0
	and	r0, r0, r2
	orr	r0, r0, r1
	strb	r0, [r3, #0xd]
	ldr	r2, [r5]
	ldrb	r1, [r2, #0xd]
	mov	r0, #0x7f
	and	r0, r0, r1
	strb	r0, [r2, #0xd]
	ldr	r0, [r5]
	ldrb	r0, [r0, #0x7]
	add	r0, r0, #0x1
	mov	r1, #0xb
	mov	r2, #0xa
	mov	r3, #0x2
	bl	debug_80C68CC
	ldr	r0, ._670 + 16  @ gUnknown_Debug_083F8813
	mov	r1, #0xd
	mov	r2, #0xa
	bl	Menu_PrintText
	add	r0, r4, #0
	mov	r1, #0xe
	mov	r2, #0xa
	mov	r3, #0x4
	bl	debug_80C68CC
	ldr	r1, ._670 + 20  @ gTasks
	lsl	r0, r6, #0x2
	add	r0, r0, r6
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._670 + 24  @ debug_80C6FA8
	str	r1, [r0]
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._671:
	.align	2, 0
._670:
	.word	gPlttBufferUnfaded+0x100
	.word	gUnknown_Debug_2038A20
	.word	0xffffff00
	.word	0xfffffc1f
	.word	gUnknown_Debug_083F8813
	.word	gTasks
	.word	debug_80C6FA8+1

	thumb_func_end debug_80C6EE8

	thumb_func_start debug_80C6FA8
debug_80C6FA8:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffffc
	lsl	r0, r0, #0x18
	lsr	r6, r0, #0x18
	ldr	r1, ._674       @ gMain
	ldrh	r2, [r1, #0x2e]
	mov	r0, #0x2
	and	r0, r0, r2
	add	r4, r1, #0
	cmp	r0, #0
	beq	._672	@cond_branch
	mov	r0, #0x5
	bl	PlaySE
	mov	r0, #0x1
	neg	r0, r0
	mov	r1, #0x0
	str	r1, [sp]
	mov	r2, #0x0
	mov	r3, #0x10
	bl	BeginNormalPaletteFade
	ldr	r0, ._674 + 4   @ debug_80C370C
	bl	SetMainCallback2
	ldr	r1, ._674 + 8   @ gTasks
	lsl	r0, r6, #0x2
	add	r0, r0, r6
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._674 + 12  @ debug_80C373C
	str	r1, [r0]
	b	._703
._675:
	.align	2, 0
._674:
	.word	gMain
	.word	debug_80C370C+1
	.word	gTasks
	.word	debug_80C373C+1
._672:
	ldrh	r1, [r4, #0x30]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._676	@cond_branch
	ldr	r4, ._678       @ gUnknown_Debug_2038A20
	ldr	r0, [r4]
	ldrh	r1, [r0]
	mov	r0, #0x0
	b	._677
._679:
	.align	2, 0
._678:
	.word	gUnknown_Debug_2038A20
._676:
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	._680	@cond_branch
	ldr	r4, ._682       @ gUnknown_Debug_2038A20
	ldr	r0, [r4]
	ldrh	r1, [r0]
	mov	r0, #0x1
._677:
	bl	debug_80C3878
	ldr	r1, [r4]
	strh	r0, [r1]
	ldr	r1, ._682 + 4   @ gTasks
	lsl	r0, r6, #0x2
	add	r0, r0, r6
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._682 + 8   @ debug_80C71FC
	str	r1, [r0]
	b	._703
._683:
	.align	2, 0
._682:
	.word	gUnknown_Debug_2038A20
	.word	gTasks
	.word	debug_80C71FC+1
._680:
	mov	r3, #0x1
	and	r3, r3, r2
	cmp	r3, #0
	beq	._684	@cond_branch
	ldr	r0, ._686       @ gUnknown_Debug_2038A20
	ldr	r1, [r0]
	mov	r0, #0x1
	strb	r0, [r1, #0x5]
	ldr	r1, ._686 + 4   @ 0x4000040
	ldr	r2, ._686 + 8   @ 0x51ef
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x4
	ldr	r2, ._686 + 12  @ 0x4167
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r1, ._686 + 16  @ gTasks
	lsl	r0, r6, #0x2
	add	r0, r0, r6
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._686 + 20  @ debug_80C7294
	str	r1, [r0]
	b	._703
._687:
	.align	2, 0
._686:
	.word	gUnknown_Debug_2038A20
	.word	0x4000040
	.word	0x51ef
	.word	0x4167
	.word	gTasks
	.word	debug_80C7294+1
._684:
	mov	r0, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	._689	@cond_branch
	ldr	r1, ._691       @ gUnknown_Debug_2038A20
	ldr	r2, [r1]
	ldrb	r0, [r2, #0x7]
	cmp	r0, #0xd
	bhi	._689	@cond_branch
	lsl	r0, r0, #0x1
	ldr	r2, ._691 + 4   @ PLTT + 0x102
	add	r0, r0, r2
	strh	r3, [r0]
	ldr	r1, [r1]
	ldrb	r0, [r1, #0x7]
	add	r0, r0, #0x1
	strb	r0, [r1, #0x7]
	b	._695
._692:
	.align	2, 0
._691:
	.word	gUnknown_Debug_2038A20
	.word	PLTT + 0x102
._689:
	ldrh	r1, [r4, #0x30]
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	._694	@cond_branch
	ldr	r2, ._696       @ gUnknown_Debug_2038A20
	ldr	r1, [r2]
	ldrb	r0, [r1, #0x7]
	cmp	r0, #0
	beq	._694	@cond_branch
	lsl	r0, r0, #0x1
	ldr	r1, ._696 + 4   @ 0x5000102
	add	r0, r0, r1
	mov	r1, #0x0
	strh	r1, [r0]
	ldr	r1, [r2]
	ldrb	r0, [r1, #0x7]
	sub	r0, r0, #0x1
	strb	r0, [r1, #0x7]
	b	._695
._697:
	.align	2, 0
._696:
	.word	gUnknown_Debug_2038A20
	.word	0x5000102
._694:
	ldrh	r1, [r4, #0x2e]
	mov	r0, #0x8
	and	r0, r0, r1
	cmp	r0, #0
	beq	._698	@cond_branch
	ldr	r4, ._701       @ gUnknown_Debug_2038A20
	ldr	r2, [r4]
	ldrb	r0, [r2, #0x9]
	mov	r1, #0x1
	eor	r0, r0, r1
	strb	r0, [r2, #0x9]
	ldr	r1, [r4]
	ldrb	r0, [r1, #0x9]
	cmp	r0, #0
	beq	._699	@cond_branch
	ldrh	r0, [r1]
	mov	r1, #0x0
	mov	r2, #0x0
	bl	GetMonSpritePalFromOtIdPersonality
	ldr	r1, [r4]
	ldrb	r1, [r1, #0x6]
	lsl	r1, r1, #0x14
	mov	r2, #0x80
	lsl	r2, r2, #0x11
	add	r1, r1, r2
	lsr	r1, r1, #0x10
	mov	r2, #0x20
	bl	LoadCompressedPalette
	b	._700
._702:
	.align	2, 0
._701:
	.word	gUnknown_Debug_2038A20
._699:
	ldrh	r0, [r1]
	mov	r1, #0x0
	mov	r2, #0x9
	bl	GetMonSpritePalFromOtIdPersonality
	ldr	r1, [r4]
	ldrb	r1, [r1, #0x6]
	lsl	r1, r1, #0x14
	mov	r2, #0x80
	lsl	r2, r2, #0x11
	add	r1, r1, r2
	lsr	r1, r1, #0x10
	mov	r2, #0x20
	bl	LoadCompressedPalette
._700:
	ldr	r5, ._704       @ gUnknown_Debug_2038A20
	ldr	r0, [r5]
	ldrb	r0, [r0, #0x6]
	lsl	r0, r0, #0x5
	ldr	r4, ._704 + 4   @ gPlttBufferUnfaded
	add	r0, r0, r4
	ldr	r2, ._704 + 8   @ 0xffffff00
	add	r1, r4, r2
	mov	r2, #0x10
	bl	CpuSet
	ldr	r0, [r5]
	ldrb	r0, [r0, #0x6]
	lsl	r0, r0, #0x5
	add	r0, r0, r4
	ldr	r1, ._704 + 12  @ gPlttBufferFaded
	mov	r2, #0x10
	bl	CpuSet
._695:
	ldr	r1, ._704 + 16  @ gTasks
	lsl	r0, r6, #0x2
	add	r0, r0, r6
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._704 + 20  @ debug_80C6EE8
	str	r1, [r0]
	b	._703
._705:
	.align	2, 0
._704:
	.word	gUnknown_Debug_2038A20
	.word	gPlttBufferUnfaded+0x200
	.word	0xffffff00
	.word	gPlttBufferFaded+0x100
	.word	gTasks
	.word	debug_80C6EE8+1
._698:
	mov	r0, #0x4
	and	r0, r0, r1
	cmp	r0, #0
	beq	._706	@cond_branch
	bl	StopCryAndClearCrySongs
	ldr	r0, ._707       @ gUnknown_Debug_2038A20
	ldr	r0, [r0]
	ldrh	r0, [r0]
	mov	r1, #0x0
	bl	PlayCry1
._706:
	ldr	r2, ._707       @ gUnknown_Debug_2038A20
	ldr	r1, [r2]
	ldrb	r0, [r1, #0x8]
	add	r0, r0, #0x4
	strb	r0, [r1, #0x8]
	ldr	r3, [r2]
	ldrb	r1, [r3, #0x8]
	mov	r0, #0x1f
	and	r0, r0, r1
	strb	r0, [r3, #0x8]
	ldr	r0, [r2]
	ldrb	r1, [r0, #0x7]
	lsl	r1, r1, #0x1
	ldr	r2, ._707 + 4   @ PLTT + 0x142
	add	r1, r1, r2
	ldr	r2, ._707 + 8   @ gUnknown_Debug_083F8790
	ldrb	r0, [r0, #0x8]
	lsl	r0, r0, #0x1
	add	r0, r0, r2
	ldrh	r0, [r0]
	strh	r0, [r1]
._703:
	add	sp, sp, #0x4
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._708:
	.align	2, 0
._707:
	.word	gUnknown_Debug_2038A20
	.word	PLTT + 0x142
	.word	gUnknown_Debug_083F8790

	thumb_func_end debug_80C6FA8

	thumb_func_start debug_80C71FC
debug_80C71FC:
	push	{r4, r5, r6, lr}
	add	r5, r0, #0
	lsl	r5, r5, #0x18
	lsr	r5, r5, #0x18
	ldr	r6, ._709       @ gSprites
	ldr	r4, ._709 + 4   @ gUnknown_Debug_2038A20
	ldr	r0, [r4]
	ldrb	r1, [r0, #0x2]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r6
	ldrb	r0, [r0, #0x5]
	lsr	r0, r0, #0x4
	bl	GetSpritePaletteTagByPaletteNum
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	bl	FreeSpritePaletteByTag
	ldr	r0, [r4]
	ldrb	r1, [r0, #0x2]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r6
	bl	DestroySprite
	ldr	r0, [r4]
	ldrb	r1, [r0, #0x3]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r6
	ldrb	r0, [r0, #0x5]
	lsr	r0, r0, #0x4
	bl	GetSpritePaletteTagByPaletteNum
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	bl	FreeSpritePaletteByTag
	ldr	r0, [r4]
	ldrb	r1, [r0, #0x3]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r6
	bl	DestroySprite
	ldr	r0, [r4]
	ldrb	r1, [r0, #0x4]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r6
	bl	sub_809D510
	ldr	r1, ._709 + 8   @ gTasks
	lsl	r0, r5, #0x2
	add	r0, r0, r5
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._709 + 12  @ debug_80C6CB8
	str	r1, [r0]
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._710:
	.align	2, 0
._709:
	.word	gSprites
	.word	gUnknown_Debug_2038A20
	.word	gTasks
	.word	debug_80C6CB8+1

	thumb_func_end debug_80C71FC

	thumb_func_start debug_80C7294
debug_80C7294:
	push	{r4, r5, r6, r7, lr}
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
	ldr	r0, ._713       @ gMain
	ldrh	r2, [r0, #0x2e]
	mov	r1, #0x1
	and	r1, r1, r2
	add	r3, r0, #0
	cmp	r1, #0
	beq	._711	@cond_branch
	ldr	r0, ._713 + 4   @ gUnknown_Debug_2038A20
	ldr	r1, [r0]
	mov	r0, #0x0
	strb	r0, [r1, #0x5]
	ldr	r1, ._713 + 8   @ 0x4000040
	ldr	r2, ._713 + 12  @ 0x51ef
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x4
	ldr	r2, ._713 + 16  @ 0x699f
	add	r0, r2, #0
	strh	r0, [r1]
	b	._712
._714:
	.align	2, 0
._713:
	.word	gMain
	.word	gUnknown_Debug_2038A20
	.word	0x4000040
	.word	0x51ef
	.word	0x699f
._711:
	mov	r0, #0x2
	and	r0, r0, r2
	cmp	r0, #0
	beq	._715	@cond_branch
	ldr	r6, ._717       @ gUnknown_Debug_2038A20
	ldr	r0, [r6]
	strb	r1, [r0, #0x5]
	ldr	r1, ._717 + 4   @ 0x4000040
	ldr	r2, ._717 + 8   @ 0x51ef
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x4
	ldr	r2, ._717 + 12  @ 0x699f
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r0, [r6]
	add	r0, r0, #0x10
	ldr	r4, ._717 + 16  @ gPlttBufferUnfaded
	add	r1, r4, #0
	mov	r2, #0x10
	bl	CpuSet
	ldr	r0, [r6]
	add	r0, r0, #0x10
	ldr	r5, ._717 + 20  @ gPlttBufferFaded
	add	r1, r5, #0
	mov	r2, #0x10
	bl	CpuSet
	ldr	r1, [r6]
	add	r0, r1, #0
	add	r0, r0, #0x10
	ldrb	r1, [r1, #0x6]
	lsl	r1, r1, #0x5
	mov	r2, #0x80
	lsl	r2, r2, #0x1
	add	r4, r4, r2
	add	r1, r1, r4
	mov	r2, #0x10
	bl	CpuSet
	ldr	r1, [r6]
	add	r0, r1, #0
	add	r0, r0, #0x10
	ldrb	r1, [r1, #0x6]
	lsl	r1, r1, #0x5
	mov	r2, #0x80
	lsl	r2, r2, #0x1
	add	r5, r5, r2
	add	r1, r1, r5
	mov	r2, #0x10
	bl	CpuSet
._712:
	ldr	r1, ._717 + 24  @ gTasks
	lsl	r0, r7, #0x2
	add	r0, r0, r7
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._717 + 28  @ debug_80C6EE8
	str	r1, [r0]
	b	._754
._718:
	.align	2, 0
._717:
	.word	gUnknown_Debug_2038A20
	.word	0x4000040
	.word	0x51ef
	.word	0x699f
	.word	gPlttBufferUnfaded+0x100
	.word	gPlttBufferFaded+0x100
	.word	gTasks
	.word	debug_80C6EE8+1
._715:
	ldrh	r1, [r3, #0x30]
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	beq	._720	@cond_branch
	ldr	r0, ._722       @ gUnknown_Debug_2038A20
	ldr	r1, [r0]
	ldrb	r0, [r1, #0xa]
	cmp	r0, #0x1
	bhi	._720	@cond_branch
	add	r0, r0, #0x1
	strb	r0, [r1, #0xa]
	b	._754
._723:
	.align	2, 0
._722:
	.word	gUnknown_Debug_2038A20
._720:
	ldrh	r1, [r3, #0x30]
	mov	r0, #0x40
	and	r0, r0, r1
	cmp	r0, #0
	beq	._725	@cond_branch
	ldr	r0, ._727       @ gUnknown_Debug_2038A20
	ldr	r1, [r0]
	ldrb	r0, [r1, #0xa]
	cmp	r0, #0
	beq	._725	@cond_branch
	sub	r0, r0, #0x1
	strb	r0, [r1, #0xa]
	b	._754
._728:
	.align	2, 0
._727:
	.word	gUnknown_Debug_2038A20
._725:
	ldrh	r1, [r3, #0x30]
	mov	r0, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	._729	@cond_branch
	ldr	r0, ._734       @ gUnknown_Debug_2038A20
	ldr	r2, [r0]
	ldrb	r0, [r2, #0xa]
	cmp	r0, #0x1
	beq	._730	@cond_branch
	cmp	r0, #0x1
	bgt	._731	@cond_branch
	cmp	r0, #0
	beq	._732	@cond_branch
	b	._754
._735:
	.align	2, 0
._734:
	.word	gUnknown_Debug_2038A20
._731:
	cmp	r0, #0x2
	beq	._736	@cond_branch
	b	._754
._732:
	ldrb	r3, [r2, #0xc]
	lsl	r1, r3, #0x1b
	lsr	r0, r1, #0x1b
	cmp	r0, #0x1e
	bhi	._761	@cond_branch
	add	r0, r0, #0x1
	mov	r1, #0x1f
	and	r0, r0, r1
	mov	r1, #0x20
	neg	r1, r1
	and	r1, r1, r3
	orr	r1, r1, r0
	strb	r1, [r2, #0xc]
	b	._761
._730:
	ldrh	r3, [r2, #0xc]
	lsl	r1, r3, #0x16
	lsr	r0, r1, #0x1b
	cmp	r0, #0x1e
	bhi	._761	@cond_branch
	add	r0, r0, #0x1
	mov	r1, #0x1f
	and	r0, r0, r1
	lsl	r0, r0, #0x5
	ldr	r1, ._742       @ 0xfffffc1f
	and	r1, r1, r3
	orr	r1, r1, r0
	strh	r1, [r2, #0xc]
	b	._761
._743:
	.align	2, 0
._742:
	.word	0xfffffc1f
._736:
	ldrb	r3, [r2, #0xd]
	lsl	r1, r3, #0x19
	lsr	r0, r1, #0x1b
	cmp	r0, #0x1e
	bhi	._761	@cond_branch
	add	r0, r0, #0x1
	mov	r1, #0x1f
	and	r0, r0, r1
	lsl	r0, r0, #0x2
	mov	r1, #0x7d
	neg	r1, r1
	and	r1, r1, r3
	orr	r1, r1, r0
	strb	r1, [r2, #0xd]
	b	._761
._729:
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	._754	@cond_branch
	ldr	r0, ._751       @ gUnknown_Debug_2038A20
	ldr	r3, [r0]
	ldrb	r0, [r3, #0xa]
	cmp	r0, #0x1
	beq	._747	@cond_branch
	cmp	r0, #0x1
	bgt	._748	@cond_branch
	cmp	r0, #0
	beq	._749	@cond_branch
	b	._754
._752:
	.align	2, 0
._751:
	.word	gUnknown_Debug_2038A20
._748:
	cmp	r0, #0x2
	beq	._753	@cond_branch
	b	._754
._749:
	ldrb	r2, [r3, #0xc]
	mov	r0, #0x1f
	and	r0, r0, r2
	cmp	r0, #0
	beq	._761	@cond_branch
	lsl	r0, r2, #0x1b
	lsr	r0, r0, #0x1b
	sub	r0, r0, #0x1
	mov	r1, #0x1f
	and	r0, r0, r1
	mov	r1, #0x20
	neg	r1, r1
	and	r1, r1, r2
	orr	r1, r1, r0
	strb	r1, [r3, #0xc]
	b	._761
._747:
	ldrh	r2, [r3, #0xc]
	mov	r0, #0xf8
	lsl	r0, r0, #0x2
	and	r0, r0, r2
	cmp	r0, #0
	beq	._761	@cond_branch
	lsl	r0, r2, #0x16
	lsr	r0, r0, #0x1b
	sub	r0, r0, #0x1
	mov	r1, #0x1f
	and	r0, r0, r1
	lsl	r0, r0, #0x5
	ldr	r1, ._759       @ 0xfffffc1f
	and	r1, r1, r2
	orr	r1, r1, r0
	strh	r1, [r3, #0xc]
	b	._761
._760:
	.align	2, 0
._759:
	.word	0xfffffc1f
._753:
	ldrb	r2, [r3, #0xd]
	mov	r0, #0x7c
	and	r0, r0, r2
	cmp	r0, #0
	beq	._761	@cond_branch
	lsl	r0, r2, #0x19
	lsr	r0, r0, #0x1b
	sub	r0, r0, #0x1
	mov	r1, #0x1f
	and	r0, r0, r1
	lsl	r0, r0, #0x2
	mov	r1, #0x7d
	neg	r1, r1
	and	r1, r1, r2
	orr	r1, r1, r0
	strb	r1, [r3, #0xd]
._761:
	ldr	r0, ._762       @ gTasks
	lsl	r1, r7, #0x2
	add	r1, r1, r7
	lsl	r1, r1, #0x3
	add	r1, r1, r0
	ldr	r0, ._762 + 4   @ debug_80C74E4
	str	r0, [r1]
._754:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._763:
	.align	2, 0
._762:
	.word	gTasks
	.word	debug_80C74E4+1

	thumb_func_end debug_80C7294

	thumb_func_start debug_80C74E4
debug_80C74E4:
	push	{r4, r5, r6, lr}
	mov	r6, r8
	push	{r6}
	add	r5, r0, #0
	lsl	r5, r5, #0x18
	lsr	r5, r5, #0x18
	ldr	r0, ._764       @ gUnknown_Debug_2038A20
	ldr	r3, [r0]
	ldrb	r0, [r3, #0xc]
	lsl	r0, r0, #0x1b
	lsr	r0, r0, #0x1b
	ldrh	r2, [r3, #0xc]
	mov	r1, #0xf8
	lsl	r1, r1, #0x2
	and	r1, r1, r2
	add	r0, r0, r1
	ldrb	r1, [r3, #0xd]
	lsl	r1, r1, #0x19
	lsr	r1, r1, #0x1b
	lsl	r1, r1, #0xa
	add	r0, r0, r1
	ldr	r6, ._764 + 4   @ gPlttBufferUnfaded
	ldrb	r1, [r3, #0x7]
	add	r1, r1, #0x81
	lsl	r1, r1, #0x1
	add	r1, r1, r6
	strh	r0, [r1]
	ldr	r1, ._764 + 8   @ gPlttBufferFaded
	mov	r8, r1
	ldrb	r1, [r3, #0x7]
	add	r1, r1, #0x81
	lsl	r1, r1, #0x1
	add r1, r1, r8
	strh	r0, [r1]
	ldrb	r1, [r3, #0x6]
	lsl	r1, r1, #0x4
	ldrb	r2, [r3, #0x7]
	ldr	r4, ._764 + 12  @ 0x101
	add	r2, r2, r4
	add	r1, r1, r2
	lsl	r1, r1, #0x1
	add	r1, r1, r6
	strh	r0, [r1]
	ldrb	r1, [r3, #0x6]
	lsl	r1, r1, #0x4
	ldrb	r2, [r3, #0x7]
	add	r2, r2, r4
	add	r1, r1, r2
	lsl	r1, r1, #0x1
	add r1, r1, r8
	strh	r0, [r1]
	mov	r1, #0xe
	mov	r2, #0xa
	mov	r3, #0x4
	bl	debug_80C68CC
	ldr	r1, ._764 + 16  @ gTasks
	lsl	r0, r5, #0x2
	add	r0, r0, r5
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._764 + 20  @ debug_80C7294
	str	r1, [r0]
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._765:
	.align	2, 0
._764:
	.word	gUnknown_Debug_2038A20
	.word	gPlttBufferUnfaded
	.word	gPlttBufferFaded
	.word	0x101
	.word	gTasks
	.word	debug_80C7294+1

	thumb_func_end debug_80C74E4

	thumb_func_start debug_80C7584
debug_80C7584:
	push	{r4, lr}
	add	r2, r0, #0
	ldr	r0, ._771       @ gUnknown_Debug_2038A20
	ldr	r3, [r0]
	ldrb	r1, [r3, #0x5]
	add	r4, r0, #0
	cmp	r1, #0
	beq	._766	@cond_branch
	mov	r1, #0x2e
	ldsh	r0, [r2, r1]
	cmp	r0, #0x1
	beq	._767	@cond_branch
	cmp	r0, #0x1
	ble	._768	@cond_branch
	cmp	r0, #0x2
	beq	._769	@cond_branch
._768:
	ldrb	r0, [r3, #0xc]
	lsl	r0, r0, #0x1b
	b	._773
._772:
	.align	2, 0
._771:
	.word	gUnknown_Debug_2038A20
._767:
	ldrh	r0, [r3, #0xc]
	lsl	r0, r0, #0x16
	b	._773
._769:
	ldrb	r0, [r3, #0xd]
	lsl	r0, r0, #0x19
._773:
	lsr	r0, r0, #0x1b
	lsl	r0, r0, #0x2
	strh	r0, [r2, #0x24]
	mov	r1, #0x2e
	ldsh	r0, [r2, r1]
	lsl	r0, r0, #0x3
	strh	r0, [r2, #0x26]
	ldrh	r0, [r2, #0x30]
	add	r3, r0, #1
	strh	r3, [r2, #0x30]
	mov	r0, #0x2e
	ldsh	r1, [r2, r0]
	ldr	r0, [r4]
	ldrb	r0, [r0, #0xa]
	cmp	r1, r0
	bne	._775	@cond_branch
	mov	r0, #0x8
	and	r3, r3, r0
	cmp	r3, #0
	bne	._775	@cond_branch
._766:
	add	r0, r2, #0
	add	r0, r0, #0x3e
	ldrb	r1, [r0]
	mov	r2, #0x4
	orr	r1, r1, r2
	strb	r1, [r0]
	b	._776
._775:
	add	r2, r2, #0x3e
	ldrb	r1, [r2]
	mov	r0, #0x5
	neg	r0, r0
	and	r0, r0, r1
	strb	r0, [r2]
._776:
	pop	{r4}
	pop	{r0}
	bx	r0

	thumb_func_end debug_80C7584

	thumb_func_start InitSeeTrainers
InitSeeTrainers:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffffc
	bl	debug_80C35DC
	ldr	r1, ._777       @ byte_83F88EC
	ldr	r2, ._777 + 4   @ 0x600e000
	ldr	r0, ._777 + 8   @ 0x40000d4
	str	r1, [r0]
	str	r2, [r0, #0x4]
	ldr	r1, ._777 + 12  @ 0x80000400
	str	r1, [r0, #0x8]
	ldr	r0, [r0, #0x8]
	ldr	r0, ._777 + 16  @ word_83F888C
	mov	r1, #0x80
	mov	r2, #0x60
	bl	LoadPalette
	mov	r0, #0x1
	neg	r0, r0
	mov	r5, #0x0
	str	r5, [sp]
	mov	r1, #0x0
	mov	r2, #0x10
	mov	r3, #0x0
	bl	BeginNormalPaletteFade
	ldr	r0, ._777 + 20  @ 0x4000040
	mov	r6, #0x0
	strh	r5, [r0]
	add	r0, r0, #0x4
	strh	r5, [r0]
	sub	r0, r0, #0x2
	strh	r5, [r0]
	add	r0, r0, #0x4
	strh	r5, [r0]
	ldr	r1, ._777 + 24  @ 0x4000048
	mov	r0, #0x3f
	strh	r0, [r1]
	add	r1, r1, #0x2
	mov	r0, #0x1f
	strh	r0, [r1]
	add	r1, r1, #0x6
	mov	r0, #0xf1
	strh	r0, [r1]
	ldr	r0, ._777 + 28  @ 0x4000052
	strh	r5, [r0]
	add	r1, r1, #0x4
	mov	r0, #0x7
	strh	r0, [r1]
	ldr	r3, ._777 + 32  @ 0x4000208
	ldrh	r2, [r3]
	strh	r5, [r3]
	ldr	r4, ._777 + 36  @ 0x4000200
	ldrh	r0, [r4]
	mov	r1, #0x1
	orr	r0, r0, r1
	strh	r0, [r4]
	strh	r2, [r3]
	ldr	r0, ._777 + 40  @ debug_80C3758
	bl	SetVBlankCallback
	ldr	r0, ._777 + 44  @ debug_80C370C
	bl	SetMainCallback2
	ldr	r1, ._777 + 48  @ 0x4000008
	ldr	r2, ._777 + 52  @ 0x1f0b
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x2
	ldr	r2, ._777 + 56  @ 0x1e0a
	add	r0, r2, #0
	strh	r0, [r1]
	sub	r1, r1, #0xa
	mov	r2, #0xcd
	lsl	r2, r2, #0x6
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r0, ._777 + 60  @ debug_80C777C
	mov	r1, #0x0
	bl	CreateTask
	ldr	r1, ._777 + 64  @ gUnknown_Debug_2038A20
	ldr	r0, ._777 + 68  @ 0x2018000
	str	r0, [r1]
	strh	r5, [r0]
	strb	r6, [r0, #0x2]
	strb	r6, [r0, #0x3]
	strb	r6, [r0, #0x5]
	strb	r6, [r0, #0x7]
	strb	r6, [r0, #0xa]
	strb	r6, [r0, #0x8]
	ldr	r4, ._777 + 72  @ gSpriteTemplate_83F8874
	add	r0, r4, #0
	mov	r1, #0x6c
	mov	r2, #0x74
	mov	r3, #0x0
	bl	CreateSprite
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	ldr	r6, ._777 + 76  @ gSprites
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r6
	strh	r5, [r0, #0x2e]
	mov	r1, #0x0
	bl	StartSpriteAnim
	add	r0, r4, #0
	mov	r1, #0x6c
	mov	r2, #0x74
	mov	r3, #0x0
	bl	CreateSprite
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r6
	mov	r1, #0x1
	strh	r1, [r0, #0x2e]
	bl	StartSpriteAnim
	add	r0, r4, #0
	mov	r1, #0x6c
	mov	r2, #0x74
	mov	r3, #0x0
	bl	CreateSprite
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r6
	mov	r1, #0x2
	strh	r1, [r0, #0x2e]
	bl	StartSpriteAnim
	add	sp, sp, #0x4
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._778:
	.align	2, 0
._777:
	.word	byte_83F88EC
	.word	0x600e000
	.word	0x40000d4
	.word	0x80000400
	.word	word_83F888C
	.word	0x4000040
	.word	0x4000048
	.word	0x4000052
	.word	0x4000208
	.word	0x4000200
	.word	debug_80C3758+1
	.word	debug_80C370C+1
	.word	0x4000008
	.word	0x1f0b
	.word	0x1e0a
	.word	debug_80C777C+1
	.word	gUnknown_Debug_2038A20
	.word	0x2018000
	.word	gSpriteTemplate_83F8874
	.word	gSprites

	thumb_func_end InitSeeTrainers

	thumb_func_start debug_80C777C
debug_80C777C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xffffffec
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
	ldr	r1, ._784       @ gUnknown_Debug_083F8815
	mov	r0, sp
	mov	r2, #0x12
	bl	memcpy
	mov	r0, #0x9
	mov	r1, #0x0
	mov	r2, #0xe
	mov	r3, #0x7
	bl	Menu_DrawStdWindowFrame
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x9
	mov	r3, #0x9
	bl	Menu_DrawStdWindowFrame
	mov	r0, #0x0
	mov	r1, #0xa
	mov	r2, #0x9
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	mov	r0, #0xe
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x7
	bl	Menu_DrawStdWindowFrame
	ldr	r0, ._784 + 4   @ gUnknown_Debug_083F87D0
	mov	r1, #0xf
	mov	r2, #0x1
	bl	Menu_PrintText
	ldr	r0, ._784 + 8   @ gUnknown_Debug_083F87D8
	mov	r1, #0x19
	mov	r2, #0x1
	bl	Menu_PrintText
	ldr	r0, ._784 + 12  @ gUnknown_Debug_083F87E0
	mov	r1, #0xf
	mov	r2, #0x5
	bl	Menu_PrintText
	mov	r0, #0xa
	mov	r1, #0x8
	mov	r2, #0x1d
	mov	r3, #0xc
	bl	Menu_DrawStdWindowFrame
	mov	r2, #0x0
	ldr	r4, ._784 + 16  @ 0x600fa56
	ldr	r0, ._784 + 20  @ 0xa311
	add	r3, r0, #0
._779:
	lsl	r0, r2, #0x1
	add	r0, r0, r4
	add	r1, r2, r3
	strh	r1, [r0]
	add	r0, r2, #1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0xe
	bls	._779	@cond_branch
	mov	r2, #0x0
	ldr	r5, ._784 + 24  @ gUnknown_Debug_083F87F4
	lsl	r6, r7, #0x2
	mov	r8, r6
	ldr	r4, ._784 + 28  @ 0x600f256
	ldr	r0, ._784 + 32  @ 0x8301
	add	r3, r0, #0
._780:
	lsl	r0, r2, #0x1
	add	r0, r0, r4
	add	r1, r2, r3
	strh	r1, [r0]
	add	r0, r2, #1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0xe
	bls	._780	@cond_branch
	add	r0, r5, #0
	mov	r1, #0x14
	mov	r2, #0xa
	bl	Menu_PrintText
	mov	r0, #0xa
	mov	r1, #0xd
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	mov	r1, sp
	mov	r0, #0x23
	strb	r0, [r1]
	mov	r2, #0x0
	ldr	r4, ._784 + 36  @ 0x600f396
	mov	r5, #0x93
	lsl	r5, r5, #0x8
	add	r3, r5, #0
._781:
	lsl	r1, r2, #0x1
	add	r1, r1, r4
	mov	r6, sp
	add	r0, r6, r2
	ldrb	r0, [r0]
	add	r0, r0, r3
	strh	r0, [r1]
	add	r0, r2, #1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0x11
	bls	._781	@cond_branch
	mov	r1, sp
	mov	r0, #0x24
	strb	r0, [r1]
	mov	r2, #0x0
	ldr	r5, ._784 + 40  @ gUnknown_Debug_083F8801
	ldr	r4, ._784 + 44  @ 0x600f3d6
	mov	r0, #0x93
	lsl	r0, r0, #0x8
	add	r3, r0, #0
._782:
	lsl	r1, r2, #0x1
	add	r1, r1, r4
	mov	r6, sp
	add	r0, r6, r2
	ldrb	r0, [r0]
	add	r0, r0, r3
	strh	r0, [r1]
	add	r0, r2, #1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0x11
	bls	._782	@cond_branch
	mov	r1, sp
	mov	r0, #0x25
	strb	r0, [r1]
	mov	r2, #0x0
	ldr	r4, ._784 + 48  @ 0x600f416
	mov	r0, #0x93
	lsl	r0, r0, #0x8
	add	r3, r0, #0
._783:
	lsl	r1, r2, #0x1
	add	r1, r1, r4
	mov	r6, sp
	add	r0, r6, r2
	ldrb	r0, [r0]
	add	r0, r0, r3
	strh	r0, [r1]
	add	r0, r2, #1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0x11
	bls	._783	@cond_branch
	add	r0, r5, #0
	mov	r1, #0xf
	mov	r2, #0x11
	bl	Menu_PrintText
	ldr	r1, ._784 + 52  @ 0x4000040
	ldr	r2, ._784 + 56  @ 0x51ef
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x4
	ldr	r5, ._784 + 60  @ 0x699f
	add	r0, r5, #0
	strh	r0, [r1]
	ldr	r1, ._784 + 64  @ gTasks
	mov	r6, r8
	add	r0, r6, r7
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._784 + 68  @ debug_80C7934
	str	r1, [r0]
	add	sp, sp, #0x14
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._785:
	.align	2, 0
._784:
	.word	gUnknown_Debug_083F8815
	.word	gUnknown_Debug_083F87D0
	.word	gUnknown_Debug_083F87D8
	.word	gUnknown_Debug_083F87E0
	.word	0x600fa56
	.word	0xa311
	.word	gUnknown_Debug_083F87F4
	.word	0x600f256
	.word	0x8301
	.word	0x600f396
	.word	gUnknown_Debug_083F8801
	.word	0x600f3d6
	.word	0x600f416
	.word	0x4000040
	.word	0x51ef
	.word	0x699f
	.word	gTasks
	.word	debug_80C7934+1

	thumb_func_end debug_80C777C

	thumb_func_start debug_80C7934
debug_80C7934:
	push	{r4, r5, r6, lr}
	mov	r6, r8
	push	{r6}
	add	sp, sp, #0xfffffff8
	mov	r8, r0
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r8, r0
	ldr	r5, ._786       @ gUnknown_Debug_2038A20
	ldr	r6, [r5]
	ldrh	r2, [r6]
	lsl	r0, r2, #0x3
	ldr	r1, ._786 + 4   @ gTrainerFrontPicTable
	add	r0, r0, r1
	ldr	r1, ._786 + 8   @ gTrainerFrontPicCoords
	lsl	r2, r2, #0x2
	add	r2, r2, r1
	ldrb	r1, [r2]
	ldrb	r2, [r2, #0x1]
	ldr	r4, ._786 + 12  @ gUnknown_081FAF4C
	ldr	r3, [r4]
	ldr	r4, [r4, #0x4]
	str	r4, [sp]
	ldrh	r4, [r6]
	str	r4, [sp, #0x4]
	bl	DecompressPicFromTable_2
	ldr	r0, [r5]
	ldrh	r0, [r0]
	lsl	r0, r0, #0x3
	ldr	r1, ._786 + 16  @ gTrainerFrontPicPaletteTable
	add	r0, r0, r1
	bl	LoadCompressedObjectPalette
	ldr	r0, [r5]
	ldrh	r0, [r0]
	mov	r1, #0x1
	bl	GetMonSpriteTemplate_803C5A0
	ldr	r0, ._786 + 20  @ gUnknown_02024E8C
	mov	r1, #0x28
	mov	r2, #0x28
	mov	r3, #0x0
	bl	CreateSprite
	ldr	r1, [r5]
	mov	r6, #0x0
	strb	r0, [r1, #0x2]
	ldr	r4, ._786 + 24  @ gSprites
	ldr	r2, [r5]
	ldrb	r1, [r2, #0x2]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r1, r4, #0
	add	r1, r1, #0x1c
	add	r0, r0, r1
	ldr	r1, ._786 + 28  @ debug_69
	str	r1, [r0]
	ldrb	r0, [r2, #0x2]
	lsl	r1, r0, #0x4
	add	r1, r1, r0
	lsl	r1, r1, #0x2
	add	r1, r1, r4
	ldrb	r2, [r1, #0x5]
	mov	r0, #0xd
	neg	r0, r0
	and	r0, r0, r2
	strb	r0, [r1, #0x5]
	ldr	r0, [r5]
	ldrh	r0, [r0]
	mov	r1, #0x1a
	mov	r2, #0x5
	bl	debug_80C376C
	ldr	r2, [r5]
	ldrb	r1, [r2, #0x2]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r4
	ldrb	r0, [r0, #0x5]
	lsr	r0, r0, #0x4
	strb	r0, [r2, #0x6]
	ldr	r0, [r5]
	ldrb	r0, [r0, #0x6]
	lsl	r0, r0, #0x5
	ldr	r4, ._786 + 32  @ gPlttBufferUnfaded
	add	r0, r0, r4
	ldr	r2, ._786 + 36  @ 0xffffff00
	add	r1, r4, r2
	mov	r2, #0x10
	bl	CpuSet
	ldr	r0, [r5]
	ldrb	r0, [r0, #0x6]
	lsl	r0, r0, #0x5
	add	r0, r0, r4
	ldr	r1, ._786 + 40  @ gPlttBufferFaded
	mov	r2, #0x10
	bl	CpuSet
	ldr	r1, ._786 + 44  @ gTasks
	mov	r2, r8
	lsl	r0, r2, #0x2
	add r0, r0, r8
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._786 + 48  @ debug_80C7A54
	str	r1, [r0]
	ldr	r0, [r5]
	strb	r6, [r0, #0x9]
	add	sp, sp, #0x8
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._787:
	.align	2, 0
._786:
	.word	gUnknown_Debug_2038A20
	.word	gTrainerFrontPicTable
	.word	gTrainerFrontPicCoords
	.word	gUnknown_081FAF4C
	.word	gTrainerFrontPicPaletteTable
	.word	gUnknown_02024E8C
	.word	gSprites
	.word	debug_69+1
	.word	gPlttBufferUnfaded+0x200
	.word	0xffffff00
	.word	gPlttBufferFaded+0x100
	.word	gTasks
	.word	debug_80C7A54+1

	thumb_func_end debug_80C7934

	thumb_func_start debug_80C7A54
debug_80C7A54:
	push	{r4, r5, r6, lr}
	add	r6, r0, #0
	lsl	r6, r6, #0x18
	lsr	r6, r6, #0x18
	ldr	r4, ._788       @ gPlttBufferUnfaded
	ldr	r5, ._788 + 4   @ gUnknown_Debug_2038A20
	ldr	r1, [r5]
	add	r1, r1, #0x10
	add	r0, r4, #0
	mov	r2, #0x10
	bl	CpuSet
	ldr	r0, ._788 + 8   @ 0xffffff00
	add	r4, r4, r0
	ldr	r3, [r5]
	ldrb	r0, [r3, #0x7]
	add	r0, r0, #0x81
	lsl	r0, r0, #0x1
	add	r0, r0, r4
	ldrh	r4, [r0]
	mov	r1, #0x1f
	and	r1, r1, r4
	ldrb	r2, [r3, #0xc]
	mov	r0, #0x20
	neg	r0, r0
	and	r0, r0, r2
	orr	r0, r0, r1
	strb	r0, [r3, #0xc]
	ldr	r3, [r5]
	mov	r1, #0xf8
	lsl	r1, r1, #0x2
	and	r1, r1, r4
	ldrh	r2, [r3, #0xc]
	ldr	r0, ._788 + 12  @ 0xfffffc1f
	and	r0, r0, r2
	orr	r0, r0, r1
	strh	r0, [r3, #0xc]
	mov	r1, #0xf8
	lsl	r1, r1, #0x7
	and	r1, r1, r4
	lsr	r1, r1, #0x8
	ldrb	r2, [r3, #0xd]
	mov	r0, #0x7d
	neg	r0, r0
	and	r0, r0, r2
	orr	r0, r0, r1
	strb	r0, [r3, #0xd]
	ldr	r2, [r5]
	ldrb	r1, [r2, #0xd]
	mov	r0, #0x7f
	and	r0, r0, r1
	strb	r0, [r2, #0xd]
	ldr	r0, [r5]
	ldrb	r0, [r0, #0x7]
	add	r0, r0, #0x1
	mov	r1, #0xb
	mov	r2, #0xa
	mov	r3, #0x2
	bl	debug_80C68CC
	ldr	r0, ._788 + 16  @ gUnknown_Debug_083F8813
	mov	r1, #0xd
	mov	r2, #0xa
	bl	Menu_PrintText
	add	r0, r4, #0
	mov	r1, #0xe
	mov	r2, #0xa
	mov	r3, #0x4
	bl	debug_80C68CC
	ldr	r1, ._788 + 20  @ gTasks
	lsl	r0, r6, #0x2
	add	r0, r0, r6
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._788 + 24  @ debug_80C7B14
	str	r1, [r0]
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._789:
	.align	2, 0
._788:
	.word	gPlttBufferUnfaded+0x100
	.word	gUnknown_Debug_2038A20
	.word	0xffffff00
	.word	0xfffffc1f
	.word	gUnknown_Debug_083F8813
	.word	gTasks
	.word	debug_80C7B14+1

	thumb_func_end debug_80C7A54

	thumb_func_start debug_80C7B14
debug_80C7B14:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffffc
	lsl	r0, r0, #0x18
	lsr	r6, r0, #0x18
	ldr	r1, ._792       @ gMain
	ldrh	r3, [r1, #0x2e]
	mov	r0, #0x2
	and	r0, r0, r3
	add	r4, r1, #0
	cmp	r0, #0
	beq	._790	@cond_branch
	mov	r0, #0x5
	bl	PlaySE
	mov	r0, #0x1
	neg	r0, r0
	mov	r1, #0x0
	str	r1, [sp]
	mov	r2, #0x0
	mov	r3, #0x10
	bl	BeginNormalPaletteFade
	ldr	r0, ._792 + 4   @ debug_80C370C
	bl	SetMainCallback2
	ldr	r1, ._792 + 8   @ gTasks
	lsl	r0, r6, #0x2
	add	r0, r0, r6
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._792 + 12  @ debug_80C373C
	str	r1, [r0]
	b	._821
._793:
	.align	2, 0
._792:
	.word	gMain
	.word	debug_80C370C+1
	.word	gTasks
	.word	debug_80C373C+1
._790:
	ldrh	r1, [r4, #0x30]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._794	@cond_branch
	ldr	r4, ._796       @ gUnknown_Debug_2038A20
	ldr	r0, [r4]
	ldrh	r1, [r0]
	mov	r0, #0x0
	b	._795
._797:
	.align	2, 0
._796:
	.word	gUnknown_Debug_2038A20
._794:
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	._798	@cond_branch
	ldr	r4, ._800       @ gUnknown_Debug_2038A20
	ldr	r0, [r4]
	ldrh	r1, [r0]
	mov	r0, #0x1
._795:
	bl	debug_80C38B4
	ldr	r1, [r4]
	strh	r0, [r1]
	ldr	r1, ._800 + 4   @ gTasks
	lsl	r0, r6, #0x2
	add	r0, r0, r6
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._800 + 8   @ debug_80C7D44
	str	r1, [r0]
	b	._821
._801:
	.align	2, 0
._800:
	.word	gUnknown_Debug_2038A20
	.word	gTasks
	.word	debug_80C7D44+1
._798:
	mov	r2, #0x1
	and	r2, r2, r3
	cmp	r2, #0
	beq	._802	@cond_branch
	ldr	r0, ._804       @ gUnknown_Debug_2038A20
	ldr	r1, [r0]
	mov	r0, #0x1
	strb	r0, [r1, #0x5]
	ldr	r1, ._804 + 4   @ 0x4000040
	ldr	r2, ._804 + 8   @ 0x51ef
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x4
	ldr	r2, ._804 + 12  @ 0x4167
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r1, ._804 + 16  @ gTasks
	lsl	r0, r6, #0x2
	add	r0, r0, r6
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._804 + 20  @ debug_80C7DDC
	str	r1, [r0]
	b	._821
._805:
	.align	2, 0
._804:
	.word	gUnknown_Debug_2038A20
	.word	0x4000040
	.word	0x51ef
	.word	0x4167
	.word	gTasks
	.word	debug_80C7DDC+1
._802:
	mov	r0, #0x10
	and	r0, r0, r1
	ldr	r3, ._809       @ gUnknown_Debug_2038A20
	cmp	r0, #0
	beq	._807	@cond_branch
	ldr	r1, [r3]
	ldrb	r0, [r1, #0x7]
	cmp	r0, #0xd
	bhi	._807	@cond_branch
	lsl	r0, r0, #0x1
	ldr	r1, ._809 + 4   @ 0x5000102
	add	r0, r0, r1
	strh	r2, [r0]
	ldr	r1, [r3]
	ldrb	r0, [r1, #0x7]
	add	r0, r0, #0x1
	strb	r0, [r1, #0x7]
	b	._813
._810:
	.align	2, 0
._809:
	.word	gUnknown_Debug_2038A20
	.word	0x5000102
._807:
	ldrh	r1, [r4, #0x30]
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	._812	@cond_branch
	ldr	r1, [r3]
	ldrb	r0, [r1, #0x7]
	cmp	r0, #0
	beq	._812	@cond_branch
	lsl	r0, r0, #0x1
	ldr	r2, ._814       @ 0x5000102
	add	r0, r0, r2
	mov	r1, #0x0
	strh	r1, [r0]
	ldr	r1, [r3]
	ldrb	r0, [r1, #0x7]
	sub	r0, r0, #0x1
	strb	r0, [r1, #0x7]
	b	._813
._815:
	.align	2, 0
._814:
	.word	0x5000102
._812:
	ldrh	r1, [r4, #0x2e]
	mov	r0, #0x8
	and	r0, r0, r1
	cmp	r0, #0
	beq	._816	@cond_branch
	ldr	r4, ._819       @ gUnknown_Debug_2038A20
	ldr	r2, [r4]
	ldrb	r0, [r2, #0x9]
	mov	r1, #0x1
	eor	r0, r0, r1
	strb	r0, [r2, #0x9]
	ldr	r1, [r4]
	ldrb	r0, [r1, #0x9]
	cmp	r0, #0
	beq	._817	@cond_branch
	ldrh	r0, [r1]
	mov	r1, #0x0
	mov	r2, #0x0
	bl	GetMonSpritePalFromOtIdPersonality
	ldr	r1, [r4]
	ldrb	r1, [r1, #0x6]
	lsl	r1, r1, #0x14
	mov	r2, #0x80
	lsl	r2, r2, #0x11
	add	r1, r1, r2
	lsr	r1, r1, #0x10
	mov	r2, #0x20
	bl	LoadCompressedPalette
	b	._818
._820:
	.align	2, 0
._819:
	.word	gUnknown_Debug_2038A20
._817:
	ldrh	r0, [r1]
	mov	r1, #0x0
	mov	r2, #0x9
	bl	GetMonSpritePalFromOtIdPersonality
	ldr	r1, [r4]
	ldrb	r1, [r1, #0x6]
	lsl	r1, r1, #0x14
	mov	r2, #0x80
	lsl	r2, r2, #0x11
	add	r1, r1, r2
	lsr	r1, r1, #0x10
	mov	r2, #0x20
	bl	LoadCompressedPalette
._818:
	ldr	r5, ._822       @ gUnknown_Debug_2038A20
	ldr	r0, [r5]
	ldrb	r0, [r0, #0x6]
	lsl	r0, r0, #0x5
	ldr	r4, ._822 + 4   @ gPlttBufferUnfaded
	add	r0, r0, r4
	ldr	r2, ._822 + 8   @ 0xffffff00
	add	r1, r4, r2
	mov	r2, #0x10
	bl	CpuSet
	ldr	r0, [r5]
	ldrb	r0, [r0, #0x6]
	lsl	r0, r0, #0x5
	add	r0, r0, r4
	ldr	r1, ._822 + 12  @ gPlttBufferFaded
	mov	r2, #0x10
	bl	CpuSet
._813:
	ldr	r1, ._822 + 16  @ gTasks
	lsl	r0, r6, #0x2
	add	r0, r0, r6
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._822 + 20  @ debug_80C7A54
	str	r1, [r0]
	b	._821
._823:
	.align	2, 0
._822:
	.word	gUnknown_Debug_2038A20
	.word	gPlttBufferUnfaded+0x200
	.word	0xffffff00
	.word	gPlttBufferFaded+0x100
	.word	gTasks
	.word	debug_80C7A54+1
._816:
	ldr	r1, [r3]
	ldrb	r0, [r1, #0x8]
	add	r0, r0, #0x4
	strb	r0, [r1, #0x8]
	ldr	r2, [r3]
	ldrb	r1, [r2, #0x8]
	mov	r0, #0x1f
	and	r0, r0, r1
	strb	r0, [r2, #0x8]
	ldr	r0, [r3]
	ldrb	r1, [r0, #0x7]
	lsl	r1, r1, #0x1
	ldr	r2, ._824       @ 0x5000142
	add	r1, r1, r2
	ldr	r2, ._824 + 4   @ gUnknown_Debug_083F8790
	ldrb	r0, [r0, #0x8]
	lsl	r0, r0, #0x1
	add	r0, r0, r2
	ldrh	r0, [r0]
	strh	r0, [r1]
._821:
	add	sp, sp, #0x4
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._825:
	.align	2, 0
._824:
	.word	0x5000142
	.word	gUnknown_Debug_083F8790

	thumb_func_end debug_80C7B14

	thumb_func_start debug_80C7D44
debug_80C7D44:
	push	{r4, r5, r6, lr}
	add	r5, r0, #0
	lsl	r5, r5, #0x18
	lsr	r5, r5, #0x18
	ldr	r6, ._826       @ gSprites
	ldr	r4, ._826 + 4   @ gUnknown_Debug_2038A20
	ldr	r0, [r4]
	ldrb	r1, [r0, #0x2]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r6
	ldrb	r0, [r0, #0x5]
	lsr	r0, r0, #0x4
	bl	GetSpritePaletteTagByPaletteNum
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	bl	FreeSpritePaletteByTag
	ldr	r0, [r4]
	ldrb	r1, [r0, #0x2]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r6
	bl	DestroySprite
	ldr	r0, [r4]
	ldrb	r1, [r0, #0x3]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r6
	ldrb	r0, [r0, #0x5]
	lsr	r0, r0, #0x4
	bl	GetSpritePaletteTagByPaletteNum
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	bl	FreeSpritePaletteByTag
	ldr	r0, [r4]
	ldrb	r1, [r0, #0x3]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r6
	bl	DestroySprite
	ldr	r0, [r4]
	ldrb	r1, [r0, #0x4]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r6
	bl	sub_809D510
	ldr	r1, ._826 + 8   @ gTasks
	lsl	r0, r5, #0x2
	add	r0, r0, r5
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._826 + 12  @ debug_80C7934
	str	r1, [r0]
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._827:
	.align	2, 0
._826:
	.word	gSprites
	.word	gUnknown_Debug_2038A20
	.word	gTasks
	.word	debug_80C7934+1

	thumb_func_end debug_80C7D44

	thumb_func_start debug_80C7DDC
debug_80C7DDC:
	push	{r4, r5, r6, r7, lr}
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
	ldr	r0, ._830       @ gMain
	ldrh	r2, [r0, #0x2e]
	mov	r1, #0x1
	and	r1, r1, r2
	add	r3, r0, #0
	cmp	r1, #0
	beq	._828	@cond_branch
	ldr	r0, ._830 + 4   @ gUnknown_Debug_2038A20
	ldr	r1, [r0]
	mov	r0, #0x0
	strb	r0, [r1, #0x5]
	ldr	r1, ._830 + 8   @ 0x4000040
	ldr	r2, ._830 + 12  @ 0x51ef
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x4
	ldr	r2, ._830 + 16  @ 0x699f
	add	r0, r2, #0
	strh	r0, [r1]
	b	._829
._831:
	.align	2, 0
._830:
	.word	gMain
	.word	gUnknown_Debug_2038A20
	.word	0x4000040
	.word	0x51ef
	.word	0x699f
._828:
	mov	r0, #0x2
	and	r0, r0, r2
	cmp	r0, #0
	beq	._832	@cond_branch
	ldr	r6, ._834       @ gUnknown_Debug_2038A20
	ldr	r0, [r6]
	strb	r1, [r0, #0x5]
	ldr	r1, ._834 + 4   @ 0x4000040
	ldr	r2, ._834 + 8   @ 0x51ef
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x4
	ldr	r2, ._834 + 12  @ 0x699f
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r0, [r6]
	add	r0, r0, #0x10
	ldr	r4, ._834 + 16  @ gPlttBufferUnfaded
	add	r1, r4, #0
	mov	r2, #0x10
	bl	CpuSet
	ldr	r0, [r6]
	add	r0, r0, #0x10
	ldr	r5, ._834 + 20  @ gPlttBufferFaded
	add	r1, r5, #0
	mov	r2, #0x10
	bl	CpuSet
	ldr	r1, [r6]
	add	r0, r1, #0
	add	r0, r0, #0x10
	ldrb	r1, [r1, #0x6]
	lsl	r1, r1, #0x5
	mov	r2, #0x80
	lsl	r2, r2, #0x1
	add	r4, r4, r2
	add	r1, r1, r4
	mov	r2, #0x10
	bl	CpuSet
	ldr	r1, [r6]
	add	r0, r1, #0
	add	r0, r0, #0x10
	ldrb	r1, [r1, #0x6]
	lsl	r1, r1, #0x5
	mov	r2, #0x80
	lsl	r2, r2, #0x1
	add	r5, r5, r2
	add	r1, r1, r5
	mov	r2, #0x10
	bl	CpuSet
._829:
	ldr	r1, ._834 + 24  @ gTasks
	lsl	r0, r7, #0x2
	add	r0, r0, r7
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._834 + 28  @ debug_80C7A54
	str	r1, [r0]
	b	._871
._835:
	.align	2, 0
._834:
	.word	gUnknown_Debug_2038A20
	.word	0x4000040
	.word	0x51ef
	.word	0x699f
	.word	gPlttBufferUnfaded+0x100
	.word	gPlttBufferFaded+0x100
	.word	gTasks
	.word	debug_80C7A54+1
._832:
	ldrh	r1, [r3, #0x30]
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	beq	._837	@cond_branch
	ldr	r0, ._839       @ gUnknown_Debug_2038A20
	ldr	r1, [r0]
	ldrb	r0, [r1, #0xa]
	cmp	r0, #0x1
	bhi	._837	@cond_branch
	add	r0, r0, #0x1
	strb	r0, [r1, #0xa]
	b	._871
._840:
	.align	2, 0
._839:
	.word	gUnknown_Debug_2038A20
._837:
	ldrh	r1, [r3, #0x30]
	mov	r0, #0x40
	and	r0, r0, r1
	cmp	r0, #0
	beq	._842	@cond_branch
	ldr	r0, ._844       @ gUnknown_Debug_2038A20
	ldr	r1, [r0]
	ldrb	r0, [r1, #0xa]
	cmp	r0, #0
	beq	._842	@cond_branch
	sub	r0, r0, #0x1
	strb	r0, [r1, #0xa]
	b	._871
._845:
	.align	2, 0
._844:
	.word	gUnknown_Debug_2038A20
._842:
	ldrh	r1, [r3, #0x30]
	mov	r0, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	._846	@cond_branch
	ldr	r0, ._851       @ gUnknown_Debug_2038A20
	ldr	r2, [r0]
	ldrb	r0, [r2, #0xa]
	cmp	r0, #0x1
	beq	._847	@cond_branch
	cmp	r0, #0x1
	bgt	._848	@cond_branch
	cmp	r0, #0
	beq	._849	@cond_branch
	b	._871
._852:
	.align	2, 0
._851:
	.word	gUnknown_Debug_2038A20
._848:
	cmp	r0, #0x2
	beq	._853	@cond_branch
	b	._871
._849:
	ldrb	r3, [r2, #0xc]
	lsl	r1, r3, #0x1b
	lsr	r0, r1, #0x1b
	cmp	r0, #0x1e
	bhi	._878	@cond_branch
	add	r0, r0, #0x1
	mov	r1, #0x1f
	and	r0, r0, r1
	mov	r1, #0x20
	neg	r1, r1
	and	r1, r1, r3
	orr	r1, r1, r0
	strb	r1, [r2, #0xc]
	b	._878
._847:
	ldrh	r3, [r2, #0xc]
	lsl	r1, r3, #0x16
	lsr	r0, r1, #0x1b
	cmp	r0, #0x1e
	bhi	._878	@cond_branch
	add	r0, r0, #0x1
	mov	r1, #0x1f
	and	r0, r0, r1
	lsl	r0, r0, #0x5
	ldr	r1, ._859       @ 0xfffffc1f
	and	r1, r1, r3
	orr	r1, r1, r0
	strh	r1, [r2, #0xc]
	b	._878
._860:
	.align	2, 0
._859:
	.word	0xfffffc1f
._853:
	ldrb	r3, [r2, #0xd]
	lsl	r1, r3, #0x19
	lsr	r0, r1, #0x1b
	cmp	r0, #0x1e
	bhi	._878	@cond_branch
	add	r0, r0, #0x1
	mov	r1, #0x1f
	and	r0, r0, r1
	lsl	r0, r0, #0x2
	mov	r1, #0x7d
	neg	r1, r1
	and	r1, r1, r3
	orr	r1, r1, r0
	strb	r1, [r2, #0xd]
	b	._878
._846:
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	._871	@cond_branch
	ldr	r0, ._868       @ gUnknown_Debug_2038A20
	ldr	r3, [r0]
	ldrb	r0, [r3, #0xa]
	cmp	r0, #0x1
	beq	._864	@cond_branch
	cmp	r0, #0x1
	bgt	._865	@cond_branch
	cmp	r0, #0
	beq	._866	@cond_branch
	b	._871
._869:
	.align	2, 0
._868:
	.word	gUnknown_Debug_2038A20
._865:
	cmp	r0, #0x2
	beq	._870	@cond_branch
	b	._871
._866:
	ldrb	r2, [r3, #0xc]
	mov	r0, #0x1f
	and	r0, r0, r2
	cmp	r0, #0
	beq	._878	@cond_branch
	lsl	r0, r2, #0x1b
	lsr	r0, r0, #0x1b
	sub	r0, r0, #0x1
	mov	r1, #0x1f
	and	r0, r0, r1
	mov	r1, #0x20
	neg	r1, r1
	and	r1, r1, r2
	orr	r1, r1, r0
	strb	r1, [r3, #0xc]
	b	._878
._864:
	ldrh	r2, [r3, #0xc]
	mov	r0, #0xf8
	lsl	r0, r0, #0x2
	and	r0, r0, r2
	cmp	r0, #0
	beq	._878	@cond_branch
	lsl	r0, r2, #0x16
	lsr	r0, r0, #0x1b
	sub	r0, r0, #0x1
	mov	r1, #0x1f
	and	r0, r0, r1
	lsl	r0, r0, #0x5
	ldr	r1, ._876       @ 0xfffffc1f
	and	r1, r1, r2
	orr	r1, r1, r0
	strh	r1, [r3, #0xc]
	b	._878
._877:
	.align	2, 0
._876:
	.word	0xfffffc1f
._870:
	ldrb	r2, [r3, #0xd]
	mov	r0, #0x7c
	and	r0, r0, r2
	cmp	r0, #0
	beq	._878	@cond_branch
	lsl	r0, r2, #0x19
	lsr	r0, r0, #0x1b
	sub	r0, r0, #0x1
	mov	r1, #0x1f
	and	r0, r0, r1
	lsl	r0, r0, #0x2
	mov	r1, #0x7d
	neg	r1, r1
	and	r1, r1, r2
	orr	r1, r1, r0
	strb	r1, [r3, #0xd]
._878:
	ldr	r0, ._879       @ gTasks
	lsl	r1, r7, #0x2
	add	r1, r1, r7
	lsl	r1, r1, #0x3
	add	r1, r1, r0
	ldr	r0, ._879 + 4   @ debug_80C802C
	str	r0, [r1]
._871:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._880:
	.align	2, 0
._879:
	.word	gTasks
	.word	debug_80C802C+1

	thumb_func_end debug_80C7DDC

	thumb_func_start debug_80C802C
debug_80C802C:
	push	{r4, r5, r6, lr}
	mov	r6, r8
	push	{r6}
	add	r5, r0, #0
	lsl	r5, r5, #0x18
	lsr	r5, r5, #0x18
	ldr	r0, ._881       @ gUnknown_Debug_2038A20
	ldr	r3, [r0]
	ldrb	r0, [r3, #0xc]
	lsl	r0, r0, #0x1b
	lsr	r0, r0, #0x1b
	ldrh	r2, [r3, #0xc]
	mov	r1, #0xf8
	lsl	r1, r1, #0x2
	and	r1, r1, r2
	add	r0, r0, r1
	ldrb	r1, [r3, #0xd]
	lsl	r1, r1, #0x19
	lsr	r1, r1, #0x1b
	lsl	r1, r1, #0xa
	add	r0, r0, r1
	ldr	r6, ._881 + 4   @ gPlttBufferUnfaded
	ldrb	r1, [r3, #0x7]
	add	r1, r1, #0x81
	lsl	r1, r1, #0x1
	add	r1, r1, r6
	strh	r0, [r1]
	ldr	r1, ._881 + 8   @ gPlttBufferFaded
	mov	r8, r1
	ldrb	r1, [r3, #0x7]
	add	r1, r1, #0x81
	lsl	r1, r1, #0x1
	add r1, r1, r8
	strh	r0, [r1]
	ldrb	r1, [r3, #0x6]
	lsl	r1, r1, #0x4
	ldrb	r2, [r3, #0x7]
	ldr	r4, ._881 + 12  @ 0x101
	add	r2, r2, r4
	add	r1, r1, r2
	lsl	r1, r1, #0x1
	add	r1, r1, r6
	strh	r0, [r1]
	ldrb	r1, [r3, #0x6]
	lsl	r1, r1, #0x4
	ldrb	r2, [r3, #0x7]
	add	r2, r2, r4
	add	r1, r1, r2
	lsl	r1, r1, #0x1
	add r1, r1, r8
	strh	r0, [r1]
	mov	r1, #0xe
	mov	r2, #0xa
	mov	r3, #0x4
	bl	debug_80C68CC
	ldr	r1, ._881 + 16  @ gTasks
	lsl	r0, r5, #0x2
	add	r0, r0, r5
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._881 + 20  @ debug_80C7DDC
	str	r1, [r0]
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._882:
	.align	2, 0
._881:
	.word	gUnknown_Debug_2038A20
	.word	gPlttBufferUnfaded
	.word	gPlttBufferFaded
	.word	0x101
	.word	gTasks
	.word	debug_80C7DDC+1

	thumb_func_end debug_80C802C

	.align 2, 0

.endif
