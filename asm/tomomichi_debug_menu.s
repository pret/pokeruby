.if DEBUG

	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	thumb_func_start debug_sub_808F168
debug_sub_808F168:
	push	{r4, lr}
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	ldr	r4, ._686       @ 0x2015de0
	ldr	r0, ._686 + 4   @ gDebug_03000700
	ldrh	r0, [r0]
	strh	r0, [r4, #0x8]
	ldr	r0, ._686 + 8   @ gDebug_03000704
	ldr	r0, [r0]
	str	r0, [r4, #0x4]
	ldr	r0, ._686 + 12  @ gDebug_03000708
	ldr	r0, [r0]
	str	r0, [r4]
	cmp	r1, #0x5
	bls	._684	@cond_branch
	b	._707
._684:
	lsl	r0, r1, #0x2
	ldr	r1, ._686 + 16  @ 
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
._687:
	.align	2, 0
._686:
	.word	0x2015de0
	.word	gDebug_03000700
	.word	gDebug_03000704
	.word	gDebug_03000708
	.word	._688
._688:
	.word	._689
	.word	._690
	.word	._691
	.word	._692
	.word	._693
	.word	._694
._689:
	ldr	r0, ._696       @ 0x2000000
	ldr	r2, ._696 + 4   @ 0x15ddf
	add	r1, r0, r2
	mov	r2, #0x0
	strb	r2, [r1]
	ldr	r1, ._696 + 8   @ 0x15dde
	add	r0, r0, r1
	strb	r2, [r0]
	ldr	r0, ._696 + 12  @ gDebug_0300070C
	ldrb	r0, [r0]
	sub	r0, r0, #0x1
	strb	r0, [r4, #0xa]
	add	r0, r4, #0
	add	r0, r0, #0x16
	ldr	r1, ._696 + 16  @ gUnknown_Debug_083C48BB
	bl	StringCopy
	b	._704
._697:
	.align	2, 0
._696:
	.word	0x2000000
	.word	0x15ddf
	.word	0x15dde
	.word	gDebug_0300070C
	.word	gUnknown_Debug_083C48BB
._690:
	ldr	r1, ._699       @ 0x2000000
	ldr	r0, ._699 + 4   @ 0x15ddf
	add	r2, r1, r0
	mov	r0, #0x0
	strb	r0, [r2]
	ldr	r2, ._699 + 8   @ 0x15dde
	add	r1, r1, r2
	mov	r0, #0x8
	strb	r0, [r1]
	ldr	r0, ._699 + 12  @ gDebug_0300070D
	ldrb	r0, [r0]
	sub	r0, r0, #0x1
	b	._698
._700:
	.align	2, 0
._699:
	.word	0x2000000
	.word	0x15ddf
	.word	0x15dde
	.word	gDebug_0300070D
._691:
	ldr	r1, ._702       @ 0x2000000
	ldr	r0, ._702 + 4   @ 0x15ddf
	add	r2, r1, r0
	mov	r0, #0x1
	strb	r0, [r2]
	ldr	r2, ._702 + 8   @ 0x15dde
	add	r1, r1, r2
	mov	r0, #0x8
	strb	r0, [r1]
	ldr	r0, ._702 + 12  @ gDebug_0300070E
	ldrb	r0, [r0]
	sub	r0, r0, #0x1
	strb	r0, [r4, #0xa]
	b	._707
._703:
	.align	2, 0
._702:
	.word	0x2000000
	.word	0x15ddf
	.word	0x15dde
	.word	gDebug_0300070E
._692:
	ldr	r1, ._705       @ 0x2000000
	ldr	r2, ._705 + 4   @ 0x15ddf
	add	r0, r1, r2
	mov	r2, #0x0
	strb	r2, [r0]
	ldr	r0, ._705 + 8   @ 0x15dde
	add	r1, r1, r0
	mov	r0, #0x8
	strb	r0, [r1]
	strb	r2, [r4, #0xa]
	b	._704
._706:
	.align	2, 0
._705:
	.word	0x2000000
	.word	0x15ddf
	.word	0x15dde
._693:
	ldr	r1, ._708       @ 0x2000000
	ldr	r0, ._708 + 4   @ 0x15ddf
	add	r2, r1, r0
	mov	r0, #0x0
	strb	r0, [r2]
	ldr	r2, ._708 + 8   @ 0x15dde
	add	r1, r1, r2
	mov	r0, #0x8
	strb	r0, [r1]
	mov	r0, #0x3
._698:
	strb	r0, [r4, #0xa]
._704:
	add	r0, r4, #0
	add	r0, r0, #0xb
	ldr	r1, ._708 + 12  @ gUnknown_Debug_083C48B0
	bl	StringCopy
	b	._707
._709:
	.align	2, 0
._708:
	.word	0x2000000
	.word	0x15ddf
	.word	0x15dde
	.word	gUnknown_Debug_083C48B0
._694:
	ldr	r1, ._710       @ 0x2000000
	ldr	r0, ._710 + 4   @ 0x15ddf
	add	r2, r1, r0
	mov	r0, #0x0
	strb	r0, [r2]
	ldr	r2, ._710 + 8   @ 0x15dde
	add	r1, r1, r2
	mov	r0, #0x8
	strb	r0, [r1]
	mov	r0, #0x9
	strb	r0, [r4, #0xa]
	add	r0, r4, #0
	add	r0, r0, #0xb
	ldr	r1, ._710 + 12  @ gUnknown_Debug_083C48B0
	bl	StringCopy
._707:
	pop	{r4}
	pop	{r0}
	bx	r0
._711:
	.align	2, 0
._710:
	.word	0x2000000
	.word	0x15ddf
	.word	0x15dde
	.word	gUnknown_Debug_083C48B0

	thumb_func_end debug_sub_808F168

	thumb_func_start debug_sub_808F2E0
debug_sub_808F2E0:
	push	{r4, lr}
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	lsl	r1, r1, #0x18
	lsr	r3, r1, #0x18
	lsl	r2, r2, #0x18
	cmp	r2, #0
	bne	._712	@cond_branch
	ldr	r1, ._714       @ gDebug_03000710
	mov	r0, #0xa1
	b	._713
._715:
	.align	2, 0
._714:
	.word	gDebug_03000710
._712:
	ldr	r1, ._716       @ gDebug_03000710
	mov	r0, #0xa2
._713:
	strb	r0, [r1]
	mov	r0, #0xff
	strb	r0, [r1, #0x1]
	add	r0, r1, #0
	add	r1, r4, #0
	add	r2, r3, #0
	bl	Menu_PrintText
	pop	{r4}
	pop	{r0}
	bx	r0
._717:
	.align	2, 0
._716:
	.word	gDebug_03000710

	thumb_func_end debug_sub_808F2E0

	thumb_func_start debug_sub_808F31C
debug_sub_808F31C:
	push	{r4, r5, r6, lr}
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6}
	mov	r8, r0
	mov	r9, r1
	add	r4, r2, #0
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r8, r0
	mov	r0, r9
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r9, r0
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	ldr	r5, ._718       @ gDebug_03000710
	ldr	r6, ._718 + 4   @ 0x2710
	add	r0, r4, #0
	add	r1, r6, #0
	bl	__udivsi3
	add	r0, r0, #0xa1
	strb	r0, [r5]
	add	r0, r4, #0
	add	r1, r6, #0
	bl	__umodsi3
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r6, #0xfa
	lsl	r6, r6, #0x2
	add	r1, r6, #0
	bl	__udivsi3
	add	r0, r0, #0xa1
	strb	r0, [r5, #0x1]
	add	r0, r4, #0
	add	r1, r6, #0
	bl	__umodsi3
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r1, #0x64
	bl	__udivsi3
	add	r0, r0, #0xa1
	strb	r0, [r5, #0x2]
	add	r0, r4, #0
	mov	r1, #0x64
	bl	__umodsi3
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r1, #0xa
	bl	__udivsi3
	add	r0, r0, #0xa1
	strb	r0, [r5, #0x3]
	add	r0, r4, #0
	mov	r1, #0xa
	bl	__umodsi3
	add	r0, r0, #0xa1
	strb	r0, [r5, #0x4]
	mov	r0, #0xff
	strb	r0, [r5, #0x5]
	add	r0, r5, #0
	mov	r1, r8
	mov	r2, r9
	bl	Menu_PrintText
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._719:
	.align	2, 0
._718:
	.word	gDebug_03000710
	.word	0x2710

	thumb_func_end debug_sub_808F31C

	thumb_func_start debug_nullsub_66
debug_nullsub_66:
	bx	lr

	thumb_func_end debug_nullsub_66

	.align 2, 0

.endif
