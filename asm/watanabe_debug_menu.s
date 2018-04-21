.if DEBUG

	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.text

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
