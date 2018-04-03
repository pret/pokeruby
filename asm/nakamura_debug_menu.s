.if DEBUG

	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.text

	thumb_func_start debug_sub_8160CF4
debug_sub_8160CF4:
	push	{lr}
	ldr	r2, ._473       @ gMain
	ldrh	r1, [r2, #0x30]
	mov	r0, #0x40
	and	r0, r0, r1
	cmp	r0, #0
	beq	._471	@cond_branch
	mov	r0, #0x1
	neg	r0, r0
	b	._472
._474:
	.align	2, 0
._473:
	.word	gMain
._471:
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	beq	._475	@cond_branch
	mov	r0, #0x1
._472:
	bl	Menu_MoveCursor
	mov	r0, #0x0
	b	._484
._475:
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	._477	@cond_branch
	bl	Menu_GetCursorPos
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r1, #0x1
	neg	r1, r1
	b	._478
._477:
	mov	r0, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	._479	@cond_branch
	bl	Menu_GetCursorPos
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r1, #0x1
._478:
	bl	debug_sub_8160B50
	bl	Menu_GetCursorPos
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	bl	debug_sub_8160A80
	bl	debug_sub_8160BB0
	mov	r0, #0x0
	b	._484
._479:
	ldrh	r1, [r2, #0x2e]
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._481	@cond_branch
	bl	debug_sub_8160C7C
	mov	r0, #0x5
	bl	PlaySE
	mov	r0, #0x0
	b	._484
._481:
	mov	r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	bne	._483	@cond_branch
	mov	r0, #0x0
	b	._484
._483:
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_EraseWindowRect
	bl	CloseMenu
	mov	r0, #0x1
._484:
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_8160CF4

	thumb_func_start debug_sub_8160D98
debug_sub_8160D98:
	push	{lr}
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_EraseWindowRect
	bl	debug_sub_8160BE4
	ldr	r1, ._485       @ gMenuCallback
	ldr	r0, ._485 + 4   @ debug_sub_8160CF4
	str	r0, [r1]
	mov	r0, #0x0
	pop	{r1}
	bx	r1
._486:
	.align	2, 0
._485:
	.word	gMenuCallback
	.word	debug_sub_8160CF4+1

	thumb_func_end debug_sub_8160D98

	thumb_func_start debug_sub_8160DC0
debug_sub_8160DC0:
	push	{lr}
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x16
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r0, ._487       @ gOtherText_Slash
	mov	r1, #0xb
	mov	r2, #0x1
	bl	Menu_PrintText
	ldr	r0, ._487 + 4   @ Str_843E5F2
	mov	r1, #0x2
	mov	r2, #0x3
	bl	Menu_PrintText
	ldr	r0, ._487 + 8   @ Str_843E5FB
	mov	r1, #0x2
	mov	r2, #0x5
	bl	Menu_PrintText
	ldr	r0, ._487 + 12  @ Str_843E606
	mov	r1, #0x2
	mov	r2, #0x7
	bl	Menu_PrintText
	ldr	r0, ._487 + 16  @ Str_843E611
	mov	r1, #0x2
	mov	r2, #0x9
	bl	Menu_PrintText
	ldr	r0, ._487 + 20  @ Str_843E61C
	mov	r1, #0x2
	mov	r2, #0xb
	bl	Menu_PrintText
	ldr	r0, ._487 + 24  @ Str_843E627
	mov	r1, #0x2
	mov	r2, #0xd
	bl	Menu_PrintText
	ldr	r0, ._487 + 28  @ Str_843E637
	mov	r1, #0x2
	mov	r2, #0xf
	bl	Menu_PrintText
	ldr	r0, ._487 + 32  @ Str_843E632
	mov	r1, #0x2
	mov	r2, #0x11
	bl	Menu_PrintText
	pop	{r0}
	bx	r0
._488:
	.align	2, 0
._487:
	.word	gOtherText_Slash
	.word	Str_843E5F2
	.word	Str_843E5FB
	.word	Str_843E606
	.word	Str_843E611
	.word	Str_843E61C
	.word	Str_843E627
	.word	Str_843E637
	.word	Str_843E632

	thumb_func_end debug_sub_8160DC0

	thumb_func_start debug_sub_8160E50
debug_sub_8160E50:
	push	{r4, r5, r6, lr}
	add	r6, r0, #0
	mov	r0, #0x1
	mov	r1, #0x1
	mov	r2, #0xa
	mov	r3, #0x2
	bl	Menu_BlankWindowRect
	ldr	r5, ._489       @ gStringVar1
	add	r0, r6, #0
	mov	r1, #0x2
	add	r2, r5, #0
	bl	GetMonData
	add	r0, r5, #0
	mov	r1, #0x1
	mov	r2, #0x1
	bl	Menu_PrintText
	mov	r0, #0xc
	mov	r1, #0x1
	mov	r2, #0x15
	mov	r3, #0x2
	bl	Menu_BlankWindowRect
	add	r0, r6, #0
	mov	r1, #0xb
	bl	GetMonData
	mov	r1, #0xb
	mul	r0, r0, r1
	ldr	r1, ._489 + 4   @ gSpeciesNames
	add	r0, r0, r1
	mov	r1, #0xc
	mov	r2, #0x1
	bl	Menu_PrintText
	add	r0, r6, #0
	mov	r1, #0x1a
	bl	GetMonData
	add	r4, r0, #0
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	add	r0, r5, #0
	add	r1, r4, #0
	mov	r2, #0x0
	mov	r3, #0x5
	bl	ConvertIntToDecimalStringN
	mov	r0, #0xd
	mov	r1, #0x3
	mov	r2, #0x11
	mov	r3, #0x4
	bl	Menu_BlankWindowRect
	add	r0, r5, #0
	mov	r1, #0xd
	mov	r2, #0x3
	bl	Menu_PrintText
	add	r0, r6, #0
	mov	r1, #0x1b
	bl	GetMonData
	add	r1, r0, #0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	add	r4, r4, r1
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	add	r0, r5, #0
	mov	r2, #0x0
	mov	r3, #0x5
	bl	ConvertIntToDecimalStringN
	mov	r0, #0xd
	mov	r1, #0x5
	mov	r2, #0x11
	mov	r3, #0x6
	bl	Menu_BlankWindowRect
	add	r0, r5, #0
	mov	r1, #0xd
	mov	r2, #0x5
	bl	Menu_PrintText
	add	r0, r6, #0
	mov	r1, #0x1c
	bl	GetMonData
	add	r1, r0, #0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	add	r4, r4, r1
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	add	r0, r5, #0
	mov	r2, #0x0
	mov	r3, #0x5
	bl	ConvertIntToDecimalStringN
	mov	r0, #0xd
	mov	r1, #0x7
	mov	r2, #0x11
	mov	r3, #0x8
	bl	Menu_BlankWindowRect
	add	r0, r5, #0
	mov	r1, #0xd
	mov	r2, #0x7
	bl	Menu_PrintText
	add	r0, r6, #0
	mov	r1, #0x1d
	bl	GetMonData
	add	r1, r0, #0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	add	r4, r4, r1
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	add	r0, r5, #0
	mov	r2, #0x0
	mov	r3, #0x5
	bl	ConvertIntToDecimalStringN
	mov	r0, #0xd
	mov	r1, #0x9
	mov	r2, #0x11
	mov	r3, #0xa
	bl	Menu_BlankWindowRect
	add	r0, r5, #0
	mov	r1, #0xd
	mov	r2, #0x9
	bl	Menu_PrintText
	add	r0, r6, #0
	mov	r1, #0x1e
	bl	GetMonData
	add	r1, r0, #0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	add	r4, r4, r1
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	add	r0, r5, #0
	mov	r2, #0x0
	mov	r3, #0x5
	bl	ConvertIntToDecimalStringN
	mov	r0, #0xd
	mov	r1, #0xb
	mov	r2, #0x11
	mov	r3, #0xc
	bl	Menu_BlankWindowRect
	add	r0, r5, #0
	mov	r1, #0xd
	mov	r2, #0xb
	bl	Menu_PrintText
	add	r0, r6, #0
	mov	r1, #0x1f
	bl	GetMonData
	add	r1, r0, #0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	add	r4, r4, r1
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	add	r0, r5, #0
	mov	r2, #0x0
	mov	r3, #0x5
	bl	ConvertIntToDecimalStringN
	mov	r0, #0xd
	mov	r1, #0xd
	mov	r2, #0x11
	mov	r3, #0xe
	bl	Menu_BlankWindowRect
	add	r0, r5, #0
	mov	r1, #0xd
	mov	r2, #0xd
	bl	Menu_PrintText
	add	r0, r5, #0
	add	r1, r4, #0
	mov	r2, #0x0
	mov	r3, #0x5
	bl	ConvertIntToDecimalStringN
	mov	r0, #0xd
	mov	r1, #0xf
	mov	r2, #0x11
	mov	r3, #0x10
	bl	Menu_BlankWindowRect
	add	r0, r5, #0
	mov	r1, #0xd
	mov	r2, #0xf
	bl	Menu_PrintText
	add	r0, r6, #0
	mov	r1, #0x20
	bl	GetMonData
	add	r1, r0, #0
	add	r0, r5, #0
	mov	r2, #0x0
	mov	r3, #0x5
	bl	ConvertIntToDecimalStringN
	mov	r0, #0xd
	mov	r1, #0x11
	mov	r2, #0x11
	mov	r3, #0x12
	bl	Menu_BlankWindowRect
	add	r0, r5, #0
	mov	r1, #0xd
	mov	r2, #0x11
	bl	Menu_PrintText
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._490:
	.align	2, 0
._489:
	.word	gStringVar1
	.word	gSpeciesNames

	thumb_func_end debug_sub_8160E50

	thumb_func_start debug_sub_8161028
debug_sub_8161028:
	push	{r4, r5, r6, lr}
	lsl	r0, r0, #0x18
	lsr	r6, r0, #0x18
	asr	r1, r0, #0x18
	mov	r0, #0x1
	neg	r0, r0
	cmp	r1, r0
	bne	._491	@cond_branch
	ldr	r0, ._496       @ _nakamuraData5
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	._492	@cond_branch
	mov	r5, #0x5
._494:
	lsl	r0, r5, #0x10
	asr	r4, r0, #0x10
	mov	r0, #0x64
	mul	r0, r0, r4
	ldr	r1, ._496 + 4   @ gPlayerParty
	add	r0, r0, r1
	mov	r1, #0xb
	bl	GetMonData
	cmp	r0, #0
	bne	._493	@cond_branch
	sub	r0, r4, #1
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	cmp	r0, #0
	bge	._494	@cond_branch
._492:
	ldr	r1, ._496       @ _nakamuraData5
	ldrb	r0, [r1]
	add	r0, r0, r6
	strb	r0, [r1]
	b	._506
._497:
	.align	2, 0
._496:
	.word	_nakamuraData5
	.word	gPlayerParty
._491:
	cmp	r1, #0x1
	bne	._506	@cond_branch
	ldr	r4, ._501       @ _nakamuraData5
	ldrb	r0, [r4]
	add	r0, r0, r6
	strb	r0, [r4]
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x6
	bne	._499	@cond_branch
	mov	r0, #0x0
	b	._500
._502:
	.align	2, 0
._501:
	.word	_nakamuraData5
._493:
	ldr	r0, ._504       @ _nakamuraData5
	strb	r5, [r0]
	b	._506
._505:
	.align	2, 0
._504:
	.word	_nakamuraData5
._499:
	ldrb	r1, [r4]
	mov	r0, #0x64
	mul	r0, r0, r1
	ldr	r1, ._507       @ gPlayerParty
	add	r0, r0, r1
	mov	r1, #0xb
	bl	GetMonData
	cmp	r0, #0
	bne	._506	@cond_branch
._500:
	strb	r0, [r4]
._506:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._508:
	.align	2, 0
._507:
	.word	gPlayerParty

	thumb_func_end debug_sub_8161028

	thumb_func_start debug_sub_81610BC
debug_sub_81610BC:
	push	{lr}
	ldr	r0, ._511       @ gMain
	ldrh	r1, [r0, #0x2e]
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	._509	@cond_branch
	mov	r0, #0x1
	neg	r0, r0
	b	._510
._512:
	.align	2, 0
._511:
	.word	gMain
._509:
	mov	r0, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	._513	@cond_branch
	mov	r0, #0x1
._510:
	bl	debug_sub_8161028
	ldr	r0, ._515       @ _nakamuraData5
	ldrb	r1, [r0]
	mov	r0, #0x64
	mul	r0, r0, r1
	ldr	r1, ._515 + 4   @ gPlayerParty
	add	r0, r0, r1
	bl	debug_sub_8160E50
	mov	r0, #0x0
	b	._518
._516:
	.align	2, 0
._515:
	.word	_nakamuraData5
	.word	gPlayerParty
._513:
	mov	r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	bne	._517	@cond_branch
	mov	r0, #0x0
	b	._518
._517:
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_EraseWindowRect
	bl	CloseMenu
	mov	r0, #0x1
._518:
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_81610BC

	thumb_func_start DebugMenu_EffortValues
DebugMenu_EffortValues:
	push	{lr}
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_EraseWindowRect
	ldr	r1, ._519       @ _nakamuraData5
	mov	r0, #0x0
	strb	r0, [r1]
	bl	debug_sub_8160DC0
	ldr	r0, ._519 + 4   @ gPlayerParty
	bl	debug_sub_8160E50
	ldr	r1, ._519 + 8   @ gMenuCallback
	ldr	r0, ._519 + 12  @ debug_sub_81610BC
	str	r0, [r1]
	mov	r0, #0x0
	pop	{r1}
	bx	r1
._520:
	.align	2, 0
._519:
	.word	_nakamuraData5
	.word	gPlayerParty
	.word	gMenuCallback
	.word	debug_sub_81610BC+1

	thumb_func_end DebugMenu_EffortValues

	thumb_func_start debug_sub_8161160
debug_sub_8161160:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	mov	r7, #0x0
	ldr	r2, ._523       @ _nakamuraData6
	ldr	r1, ._523 + 4   @ _nakamuraData8
	ldrh	r0, [r2]
	ldrh	r3, [r1]
	cmp	r0, r3
	bhi	._521	@cond_branch
	add	r6, r0, #0
	ldrh	r5, [r1]
	b	._522
._524:
	.align	2, 0
._523:
	.word	_nakamuraData6
	.word	_nakamuraData8
._521:
	ldrh	r6, [r1]
	ldrh	r5, [r2]
._522:
	mov	r4, #0x0
	ldr	r0, ._529       @ _nakamuraDataA
	ldrh	r0, [r0]
	cmp	r4, r0
	bcs	._525	@cond_branch
	ldr	r0, ._529 + 4   @ _nakamuraDataC
	mov	r8, r0
._528:
	bl	Random
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r2, r8
	ldrh	r1, [r2]
	bl	__umodsi3
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	cmp	r0, r6
	bcc	._527	@cond_branch
	cmp	r0, r5
	bhi	._527	@cond_branch
	add	r0, r7, #1
	lsl	r0, r0, #0x10
	lsr	r7, r0, #0x10
._527:
	add	r4, r4, #0x1
	ldr	r0, ._529       @ _nakamuraDataA
	ldrh	r0, [r0]
	cmp	r4, r0
	bcc	._528	@cond_branch
._525:
	add	r0, r7, #0
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
._530:
	.align	2, 0
._529:
	.word	_nakamuraDataA
	.word	_nakamuraDataC

	thumb_func_end debug_sub_8161160

	thumb_func_start debug_sub_81611D8
debug_sub_81611D8:
	push	{r4, lr}
	add	sp, sp, #0xfffffff8
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0xf
	mov	r3, #0xb
	bl	Menu_DrawStdWindowFrame
	ldr	r0, ._531       @ Str_843E642
	mov	r1, #0x2
	mov	r2, #0x1
	bl	Menu_PrintText
	ldr	r0, ._531 + 4   @ Str_843E647
	mov	r1, #0x2
	mov	r2, #0x3
	bl	Menu_PrintText
	ldr	r0, ._531 + 8   @ Str_843E65A
	mov	r1, #0x2
	mov	r2, #0x5
	bl	Menu_PrintText
	ldr	r0, ._531 + 12  @ Str_843E64C
	mov	r1, #0x2
	mov	r2, #0x7
	bl	Menu_PrintText
	ldr	r0, ._531 + 16  @ Str_843E651
	mov	r1, #0x2
	mov	r2, #0x9
	bl	Menu_PrintText
	ldr	r0, ._531 + 20  @ Str_843E655
	mov	r1, #0xd
	mov	r2, #0x9
	bl	Menu_PrintText
	ldr	r4, ._531 + 24  @ Str_843E658
	add	r0, r4, #0
	mov	r1, #0xc
	mov	r2, #0x1
	bl	Menu_PrintText
	add	r0, r4, #0
	mov	r1, #0xc
	mov	r2, #0x3
	bl	Menu_PrintText
	add	r0, r4, #0
	mov	r1, #0xc
	mov	r2, #0x5
	bl	Menu_PrintText
	add	r0, r4, #0
	mov	r1, #0xc
	mov	r2, #0x7
	bl	Menu_PrintText
	add	r0, r4, #0
	mov	r1, #0xc
	mov	r2, #0x9
	bl	Menu_PrintText
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0xe
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x4
	bl	InitMenu
	add	sp, sp, #0x8
	pop	{r4}
	pop	{r0}
	bx	r0
._532:
	.align	2, 0
._531:
	.word	Str_843E642
	.word	Str_843E647
	.word	Str_843E65A
	.word	Str_843E64C
	.word	Str_843E651
	.word	Str_843E655
	.word	Str_843E658

	thumb_func_end debug_sub_81611D8

	thumb_func_start debug_sub_8161290
debug_sub_8161290:
	push	{r4, lr}
	add	r1, r0, #0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	ldr	r4, ._533       @ gStringVar1
	add	r0, r4, #0
	mov	r2, #0x1
	mov	r3, #0x5
	bl	ConvertIntToDecimalStringN
	add	r0, r4, #0
	mov	r1, #0x8
	mov	r2, #0x9
	bl	Menu_PrintText
	pop	{r4}
	pop	{r0}
	bx	r0
._534:
	.align	2, 0
._533:
	.word	gStringVar1

	thumb_func_end debug_sub_8161290

	thumb_func_start debug_sub_81612B8
debug_sub_81612B8:
	push	{r4, r5, lr}
	add	r4, r2, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	lsl	r1, r1, #0x18
	asr	r1, r1, #0x18
	ldrh	r2, [r0]
	add	r1, r1, r2
	strh	r1, [r0]
	ldr	r5, ._535       @ gStringVar1
	ldrh	r1, [r0]
	add	r0, r5, #0
	mov	r2, #0x1
	mov	r3, #0x5
	bl	ConvertIntToDecimalStringN
	add	r0, r5, #0
	mov	r1, #0x8
	add	r2, r4, #0
	bl	Menu_PrintText
	pop	{r4, r5}
	pop	{r0}
	bx	r0
._536:
	.align	2, 0
._535:
	.word	gStringVar1

	thumb_func_end debug_sub_81612B8

	thumb_func_start debug_sub_81612EC
debug_sub_81612EC:
	push	{r4, r5, lr}
	ldr	r2, ._540       @ gMain
	ldrh	r1, [r2, #0x2c]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r1
	mov	r5, #0x1
	cmp	r0, #0
	beq	._537	@cond_branch
	mov	r5, #0x64
._537:
	ldrh	r1, [r2, #0x30]
	mov	r0, #0x40
	and	r0, r0, r1
	cmp	r0, #0
	beq	._538	@cond_branch
	mov	r0, #0x1
	neg	r0, r0
	b	._539
._541:
	.align	2, 0
._540:
	.word	gMain
._538:
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	beq	._542	@cond_branch
	mov	r0, #0x1
._539:
	bl	Menu_MoveCursor
._565:
	mov	r0, #0x0
	b	._543
._542:
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	._544	@cond_branch
	bl	Menu_GetCursorPos
	lsl	r0, r0, #0x18
	asr	r4, r0, #0x18
	cmp	r4, #0
	bne	._545	@cond_branch
	ldr	r0, ._550       @ _nakamuraData6
	neg	r1, r5
	mov	r2, #0x1
	bl	debug_sub_81612B8
._545:
	cmp	r4, #0x1
	bne	._546	@cond_branch
	ldr	r0, ._550 + 4   @ _nakamuraData8
	neg	r1, r5
	mov	r2, #0x3
	bl	debug_sub_81612B8
._546:
	cmp	r4, #0x2
	bne	._547	@cond_branch
	ldr	r0, ._550 + 8   @ _nakamuraDataC
	neg	r1, r5
	mov	r2, #0x5
	bl	debug_sub_81612B8
._547:
	cmp	r4, #0x3
	bne	._565	@cond_branch
	ldr	r0, ._550 + 12  @ _nakamuraDataA
	neg	r1, r5
	mov	r2, #0x7
	bl	debug_sub_81612B8
	b	._565
._551:
	.align	2, 0
._550:
	.word	_nakamuraData6
	.word	_nakamuraData8
	.word	_nakamuraDataC
	.word	_nakamuraDataA
._544:
	mov	r0, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	._552	@cond_branch
	bl	Menu_GetCursorPos
	lsl	r0, r0, #0x18
	asr	r4, r0, #0x18
	cmp	r4, #0
	bne	._553	@cond_branch
	ldr	r0, ._558       @ _nakamuraData6
	add	r1, r5, #0
	mov	r2, #0x1
	bl	debug_sub_81612B8
._553:
	cmp	r4, #0x1
	bne	._554	@cond_branch
	ldr	r0, ._558 + 4   @ _nakamuraData8
	add	r1, r5, #0
	mov	r2, #0x3
	bl	debug_sub_81612B8
._554:
	cmp	r4, #0x2
	bne	._555	@cond_branch
	ldr	r0, ._558 + 8   @ _nakamuraDataC
	add	r1, r5, #0
	mov	r2, #0x5
	bl	debug_sub_81612B8
._555:
	cmp	r4, #0x3
	bne	._565	@cond_branch
	ldr	r0, ._558 + 12  @ _nakamuraDataA
	add	r1, r5, #0
	mov	r2, #0x7
	bl	debug_sub_81612B8
	b	._565
._559:
	.align	2, 0
._558:
	.word	_nakamuraData6
	.word	_nakamuraData8
	.word	_nakamuraDataC
	.word	_nakamuraDataA
._552:
	ldrh	r1, [r2, #0x2e]
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._560	@cond_branch
	ldr	r0, ._563       @ _nakamuraDataC
	ldrh	r0, [r0]
	cmp	r0, #0
	beq	._565	@cond_branch
	mov	r0, #0x5
	bl	PlaySE
	bl	debug_sub_8161160
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	bl	debug_sub_8161290
	b	._565
._564:
	.align	2, 0
._563:
	.word	_nakamuraDataC
._560:
	mov	r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	._565	@cond_branch
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_EraseWindowRect
	bl	CloseMenu
	mov	r0, #0x1
._543:
	pop	{r4, r5}
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_81612EC

	thumb_func_start DebugMenu_RandomNumberTest
DebugMenu_RandomNumberTest:
	push	{lr}
	ldr	r0, ._566       @ _nakamuraData6
	mov	r1, #0x0
	strh	r1, [r0]
	ldr	r0, ._566 + 4   @ _nakamuraData8
	strh	r1, [r0]
	ldr	r0, ._566 + 8   @ _nakamuraDataC
	strh	r1, [r0]
	ldr	r0, ._566 + 12  @ _nakamuraDataA
	strh	r1, [r0]
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_EraseWindowRect
	bl	debug_sub_81611D8
	ldr	r1, ._566 + 16  @ gMenuCallback
	ldr	r0, ._566 + 20  @ debug_sub_81612EC
	str	r0, [r1]
	mov	r0, #0x0
	pop	{r1}
	bx	r1
._567:
	.align	2, 0
._566:
	.word	_nakamuraData6
	.word	_nakamuraData8
	.word	_nakamuraDataC
	.word	_nakamuraDataA
	.word	gMenuCallback
	.word	debug_sub_81612EC+1

	thumb_func_end DebugMenu_RandomNumberTest

    .align 2, 0

.endif
