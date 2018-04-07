.if DEBUG

	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.text

	thumb_func_start debug_sub_813C5B4
debug_sub_813C5B4:
	push	{r4, r5, r6, r7, lr}
	add	r4, r0, #0
	ldr	r7, ._23        @ gSaveBlock1
	ldr	r0, ._23 + 4    @ gUnknown_Debug_845DDD6
	ldr	r1, ._23 + 8    @ gUnknown_Debug_845DDB2
	sub	r0, r0, r1
	add	r6, r0, r4
	ldr	r0, ._23 + 12   @ gUnknown_Debug_845E306
	sub	r5, r0, r1
	ldr	r0, ._23 + 16   @ Str_842E23C
	mov	r1, #0x0
	mov	r2, #0x0
	bl	debug_sub_80C2C18
	mov	r2, #0x0
	ldr	r3, ._23 + 20   @ 0xfff
	mov	r1, #0x0
._19:
	add	r0, r4, r2
	strb	r1, [r0]
	add	r2, r2, #0x1
	cmp	r2, r3
	ble	._19	@cond_branch
	mov	r2, #0x0
	cmp	r2, r5
	bcs	._20	@cond_branch
	ldr	r3, ._23 + 8    @ gUnknown_Debug_845DDB2
._21:
	add	r0, r4, r2
	add	r1, r2, r3
	ldrb	r1, [r1]
	strb	r1, [r0]
	add	r2, r2, #0x1
	cmp	r2, r5
	bcc	._21	@cond_branch
._20:
	mov	r2, #0x0
	ldr	r3, ._23 + 24   @ 0x52f
._22:
	add	r0, r6, r2
	add	r1, r7, r2
	ldrb	r1, [r1]
	strb	r1, [r0]
	add	r2, r2, #0x1
	cmp	r2, r3
	bls	._22	@cond_branch
	bl	ClearEnigmaBerries
	ldr	r1, ._23 + 8    @ gUnknown_Debug_845DDB2
	add	r0, r4, #0
	bl	unref_sub_81261B4
	add	r0, r5, #0
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
._24:
	.align	2, 0
._23:
	.word	gSaveBlock1+0x3160
	.word	gUnknown_Debug_845DDD6
	.word	gUnknown_Debug_845DDB2
	.word	gUnknown_Debug_845E306
	.word	Str_842E23C
	.word	0xfff
	.word	0x52f

	thumb_func_end debug_sub_813C5B4

	thumb_func_start debug_sub_813C638
debug_sub_813C638:
	push	{r4, r5, r6, lr}
	mov	r6, r8
	push	{r6}
	add	sp, sp, #0xffffffec
	mov	r8, r0
	add	r4, r1, #0
	add	r5, r2, #0
	add	r6, r3, #0
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	lsl	r5, r5, #0x18
	lsr	r5, r5, #0x18
	lsl	r6, r6, #0x10
	lsr	r6, r6, #0x10
	bl	ZeroMonData
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	mov	r0, #0x1
	str	r0, [sp, #0x8]
	ldr	r0, ._25        @ 0x270f
	str	r0, [sp, #0xc]
	mov	r0, r8
	add	r1, r4, #0
	add	r2, r5, #0
	mov	r3, #0x20
	bl	CreateMon
	ldr	r2, ._25 + 4    @ Str_842E240
	mov	r0, r8
	mov	r1, #0x7
	bl	SetMonData
	ldr	r2, ._25 + 8    @ Str_842E248
	mov	r0, r8
	mov	r1, #0x2
	bl	SetMonData
	str	r6, [sp, #0x10]
	mov	r0, r8
	mov	r1, #0xc
	add	r2, sp, #0x10
	bl	SetMonData
	add	sp, sp, #0x14
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._26:
	.align	2, 0
._25:
	.word	0x270f
	.word	Str_842E240
	.word	Str_842E248

	thumb_func_end debug_sub_813C638

	thumb_func_start debug_sub_813C6AC
debug_sub_813C6AC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xfffffff8
	add	r6, r0, #0
	add	r5, r1, #0
	add	r0, r5, #0
	bl	ClearMailStruct
	add	r0, r6, #0
	mov	r1, #0xc
	bl	GetMonData
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r8, r0
	bl	ItemIsMail
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	._27	@cond_branch
	add	r4, r5, #0
	add	r4, r4, #0x12
	add	r7, r5, #0
	add	r7, r7, #0x1a
	mov	r1, #0x9
	add	r0, r5, #0
	add	r0, r0, #0x10
._28:
	strh	r1, [r0]
	sub	r1, r1, #0x1
	sub	r0, r0, #0x2
	cmp	r0, r5
	bge	._28	@cond_branch
	add	r0, r6, #0
	mov	r1, #0x7
	mov	r2, sp
	bl	GetMonData
	add	r0, r4, #0
	mov	r1, sp
	mov	r2, #0x8
	bl	StringCopyN
	add	r0, r6, #0
	mov	r1, #0x1
	bl	GetMonData
	add	r1, r7, #0
	bl	write_word_to_mem
	add	r0, r6, #0
	mov	r1, #0xb
	bl	GetMonData
	add	r4, r0, #0
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	add	r0, r6, #0
	mov	r1, #0x0
	bl	GetMonData
	add	r1, r0, #0
	add	r0, r4, #0
	bl	SpeciesToMailSpecies
	strh	r0, [r5, #0x1e]
	mov	r0, r8
	strh	r0, [r5, #0x20]
._27:
	add	sp, sp, #0x8
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0

	thumb_func_end debug_sub_813C6AC

	thumb_func_start debug_sub_813C740
debug_sub_813C740:
	push	{r4, r5, r6, lr}
	mov	r6, sl
	mov	r5, r9
	mov	r4, r8
	push	{r4, r5, r6}
	add	sp, sp, #0xffffffd0
	add	r6, r0, #0
	ldr	r0, ._29        @ gUnknown_Debug_845E443
	mov	r8, r0
	ldr	r1, ._29 + 4    @ gUnknown_Debug_845E4EF
	ldr	r5, ._29 + 8    @ gEnemyParty
	sub	r1, r1, r0
	mov	r9, r1
	add	r0, r6, #0
	mov	r1, r8
	mov	r2, r9
	bl	memcpy
	add	r0, r5, #0
	mov	r1, #0x19
	mov	r2, #0x5
	mov	r3, #0x0
	bl	debug_sub_813C638
	add	r4, sp, #0x24
	mov	r0, #0x1
	mov	sl, r0
	mov	r1, sl
	strb	r1, [r4]
	add	r0, r5, #0
	mov	r1, #0x2d
	add	r2, r4, #0
	bl	SetMonData
	mov	r0, #0x3
	strb	r0, [r4]
	add	r0, r5, #0
	mov	r1, #0x20
	add	r2, r4, #0
	bl	SetMonData
	mov	r0, #0xff
	strb	r0, [r4]
	add	r0, r5, #0
	mov	r1, #0x23
	add	r2, r4, #0
	bl	SetMonData
	ldr	r1, ._29 + 12   @ Str_842E238
	add	r0, r4, #0
	mov	r2, #0xb
	bl	StringCopyN
	add	r0, r5, #0
	mov	r1, #0x2
	add	r2, r4, #0
	bl	SetMonData
	mov	r0, sl
	strb	r0, [r4]
	add	r0, r5, #0
	mov	r1, #0x3
	add	r2, r4, #0
	bl	SetMonData
	ldr	r0, ._29 + 16   @ gUnknown_Debug_845E467
	add	r0, r6, r0
	mov	r1, r8
	sub	r0, r0, r1
	add	r1, r5, #0
	mov	r2, #0x64
	bl	memcpy
	ldr	r0, ._29 + 20   @ gUnknown_Debug_845E4CB
	add	r6, r6, r0
	mov	r0, r8
	sub	r6, r6, r0
	add	r0, r6, #0
	mov	r1, sp
	mov	r2, #0x24
	bl	memcpy
	mov	r0, r9
	add	sp, sp, #0x30
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
._30:
	.align	2, 0
._29:
	.word	gUnknown_Debug_845E443
	.word	gUnknown_Debug_845E4EF
	.word	gEnemyParty
	.word	Str_842E238
	.word	gUnknown_Debug_845E467
	.word	gUnknown_Debug_845E4CB

	thumb_func_end debug_sub_813C740

	thumb_func_start debug_sub_813C810
debug_sub_813C810:
	push	{r4, r5, r6, lr}
	mov	r6, r8
	push	{r6}
	add	sp, sp, #0xffffffdc
	add	r6, r0, #0
	ldr	r5, ._31        @ gUnknown_Debug_845E443
	ldr	r0, ._31 + 4    @ gUnknown_Debug_845E4EF
	ldr	r4, ._31 + 8    @ gEnemyParty
	sub	r0, r0, r5
	mov	r8, r0
	add	r0, r6, #0
	add	r1, r5, #0
	mov	r2, r8
	bl	memcpy
	add	r0, r4, #0
	mov	r1, #0xc9
	mov	r2, #0x15
	mov	r3, #0x82
	bl	debug_sub_813C638
	add	r0, r4, #0
	mov	r1, sp
	bl	debug_sub_813C6AC
	ldr	r0, ._31 + 12   @ gUnknown_Debug_845E467
	add	r0, r6, r0
	sub	r0, r0, r5
	add	r1, r4, #0
	mov	r2, #0x64
	bl	memcpy
	ldr	r0, ._31 + 16   @ gUnknown_Debug_845E4CB
	add	r0, r6, r0
	sub	r0, r0, r5
	mov	r1, sp
	mov	r2, #0x24
	bl	memcpy
	add	r0, r6, #0
	add	r1, r5, #0
	bl	unref_sub_812620C
	mov	r0, r8
	add	sp, sp, #0x24
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
._32:
	.align	2, 0
._31:
	.word	gUnknown_Debug_845E443
	.word	gUnknown_Debug_845E4EF
	.word	gEnemyParty
	.word	gUnknown_Debug_845E467
	.word	gUnknown_Debug_845E4CB

	thumb_func_end debug_sub_813C810

	thumb_func_start debug_sub_813C888
debug_sub_813C888:
	push	{r4, r5, r6, lr}
	mov	r6, r8
	push	{r6}
	add	sp, sp, #0xffffffdc
	add	r6, r0, #0
	ldr	r5, ._33        @ gUnknown_Debug_845E443
	ldr	r0, ._33 + 4    @ gUnknown_Debug_845E4EF
	ldr	r4, ._33 + 8    @ gEnemyParty
	sub	r0, r0, r5
	mov	r8, r0
	add	r0, r6, #0
	add	r1, r5, #0
	mov	r2, r8
	bl	memcpy
	add	r0, r4, #0
	mov	r1, #0xc9
	mov	r2, #0x15
	mov	r3, #0x82
	bl	debug_sub_813C638
	add	r0, r4, #0
	mov	r1, sp
	bl	debug_sub_813C6AC
	mov	r0, #0x0
	strh	r0, [r4, #0x1c]
	ldr	r0, ._33 + 12   @ gUnknown_Debug_845E467
	add	r0, r6, r0
	sub	r0, r0, r5
	add	r1, r4, #0
	mov	r2, #0x64
	bl	memcpy
	ldr	r0, ._33 + 16   @ gUnknown_Debug_845E4CB
	add	r0, r6, r0
	sub	r0, r0, r5
	mov	r1, sp
	mov	r2, #0x24
	bl	memcpy
	add	r0, r6, #0
	add	r1, r5, #0
	bl	unref_sub_812620C
	mov	r0, r8
	add	sp, sp, #0x24
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
._34:
	.align	2, 0
._33:
	.word	gUnknown_Debug_845E443
	.word	gUnknown_Debug_845E4EF
	.word	gEnemyParty
	.word	gUnknown_Debug_845E467
	.word	gUnknown_Debug_845E4CB

	thumb_func_end debug_sub_813C888

	thumb_func_start debug_sub_813C904
debug_sub_813C904:
	push	{r4, lr}
	ldr	r4, ._35        @ gPlayerParty
	add	r0, r4, #0
	mov	r1, #0x5
	mov	r2, #0x32
	mov	r3, #0xb7
	bl	debug_sub_813C638
	add	r0, r4, #0
	add	r0, r0, #0x64
	mov	r1, #0x8
	mov	r2, #0x32
	mov	r3, #0xc4
	bl	debug_sub_813C638
	add	r4, r4, #0xc8
	add	r0, r4, #0
	mov	r1, #0x2
	mov	r2, #0x32
	mov	r3, #0x8d
	bl	debug_sub_813C638
	pop	{r4}
	pop	{r0}
	bx	r0
._36:
	.align	2, 0
._35:
	.word	gPlayerParty

	thumb_func_end debug_sub_813C904

	thumb_func_start debug_sub_813C93C
debug_sub_813C93C:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xffffff44
	add	r4, r0, #0
	ldr	r6, ._37        @ gUnknown_Debug_845E4EF
	ldr	r5, ._37 + 4    @ gUnknown_Debug_845E606
	sub	r5, r5, r6
	add	r1, r6, #0
	add	r2, r5, #0
	bl	memcpy
	bl	SavePlayerParty
	bl	debug_sub_813C904
	ldr	r1, ._37 + 8    @ Str_842E253
	ldr	r2, ._37 + 12   @ 0x270f
	mov	r0, sp
	bl	debug_sub_8075DB4
	bl	LoadPlayerParty
	ldr	r0, ._37 + 16   @ gUnknown_Debug_845E506
	add	r4, r4, r0
	sub	r4, r4, r6
	add	r0, r4, #0
	mov	r1, sp
	mov	r2, #0xbc
	bl	memcpy
	add	r0, r5, #0
	add	sp, sp, #0xbc
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
._38:
	.align	2, 0
._37:
	.word	gUnknown_Debug_845E4EF
	.word	gUnknown_Debug_845E606
	.word	Str_842E253+5  @ weird...
	.word	0x270f
	.word	gUnknown_Debug_845E506

	thumb_func_end debug_sub_813C93C

	.align 2, 0

.endif
