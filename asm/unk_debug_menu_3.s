.if DEBUG

	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.text

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
