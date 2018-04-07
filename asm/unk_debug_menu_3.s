.if DEBUG

	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.text

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
