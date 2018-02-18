.if DEBUG

	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.text

	thumb_func_start InitNoharaDebugMenu
InitNoharaDebugMenu:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x13
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._1         @ gUnknown_Debug_083C4938
	mov	r0, #0x1
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x12
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._1 + 4     @ gMenuCallback
	ldr	r0, ._1 + 8     @ debug_sub_808F414
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._2:
	.align	2, 0
._1:
	.word	gUnknown_Debug_083C4938
	.word	gMenuCallback
	.word	debug_sub_808F414+1

	thumb_func_end InitNoharaDebugMenu

	thumb_func_start debug_sub_808F414
debug_sub_808F414:
	push	{lr}
	bl	Menu_ProcessInput
	lsl	r0, r0, #0x18
	asr	r1, r0, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r1, r0
	beq	._3	@cond_branch
	add	r0, r0, #0x1
	cmp	r1, r0
	beq	._4	@cond_branch
	ldr	r2, ._6         @ gMenuCallback
	ldr	r0, ._6 + 4     @ gUnknown_Debug_083C4938
	lsl	r1, r1, #0x3
	add	r0, r0, #0x4
	add	r1, r1, r0
	ldr	r0, [r1]
	str	r0, [r2]
._3:
	mov	r0, #0x0
	b	._5
._7:
	.align	2, 0
._6:
	.word	gMenuCallback
	.word	gUnknown_Debug_083C4938
._4:
	bl	CloseMenu
	mov	r0, #0x1
._5:
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808F414

	thumb_func_start NoharaDebugMenu_TV
NoharaDebugMenu_TV:
	push	{lr}
	add	sp, sp, #0xfffffff8
	ldr	r1, ._8         @ gDebug_03000726
	mov	r0, #0x0
	strb	r0, [r1]
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0xa
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._8 + 4     @ gUnknown_Debug_083C4B8C
	mov	r0, #0x1
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x9
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._8 + 8     @ gMenuCallback
	ldr	r0, ._8 + 12    @ debug_sub_808F4AC
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._9:
	.align	2, 0
._8:
	.word	gDebug_03000726
	.word	gUnknown_Debug_083C4B8C
	.word	gMenuCallback
	.word	debug_sub_808F4AC+1

	thumb_func_end NoharaDebugMenu_TV

	thumb_func_start debug_sub_808F4AC
debug_sub_808F4AC:
	push	{lr}
	bl	Menu_ProcessInput
	lsl	r0, r0, #0x18
	asr	r1, r0, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r1, r0
	beq	._10	@cond_branch
	add	r0, r0, #0x1
	cmp	r1, r0
	beq	._11	@cond_branch
	ldr	r2, ._13        @ gMenuCallback
	ldr	r0, ._13 + 4    @ gUnknown_Debug_083C4B8C
	lsl	r1, r1, #0x3
	add	r0, r0, #0x4
	add	r1, r1, r0
	ldr	r0, [r1]
	str	r0, [r2]
._10:
	mov	r0, #0x0
	b	._12
._14:
	.align	2, 0
._13:
	.word	gMenuCallback
	.word	gUnknown_Debug_083C4B8C
._11:
	bl	CloseMenu
	mov	r0, #0x1
._12:
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808F4AC

	thumb_func_start debug_sub_808F4EC
debug_sub_808F4EC:
	push	{lr}
	bl	debug_sub_808F6BC
	ldr	r0, ._15        @ gUnknown_Debug_083C4980
	bl	sub_8071F40
	mov	r0, #0x3
	mov	r1, #0x3
	mov	r2, #0x1
	bl	DisplayYesNoMenu
	ldr	r1, ._15 + 4    @ gMenuCallback
	ldr	r0, ._15 + 8    @ debug_sub_808F648
	str	r0, [r1]
	pop	{r0}
	bx	r0
._16:
	.align	2, 0
._15:
	.word	gUnknown_Debug_083C4980
	.word	gMenuCallback
	.word	debug_sub_808F648+1

	thumb_func_end debug_sub_808F4EC

	thumb_func_start debug_sub_808F518
debug_sub_808F518:
	push	{r4, lr}
	mov	r2, #0x0
	ldr	r4, ._20        @ gSaveBlock1
	ldr	r3, ._20 + 4    @ 0x2738
._19:
	lsl	r0, r2, #0x3
	add	r0, r0, r2
	lsl	r0, r0, #0x2
	add	r1, r0, r4
	add	r0, r1, r3
	ldrb	r0, [r0]
	sub	r0, r0, #0x15
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x13
	bhi	._18	@cond_branch
	ldr	r0, ._20 + 8    @ 0x2739
	add	r1, r1, r0
	ldrb	r0, [r1]
	cmp	r0, #0
	bne	._18	@cond_branch
	mov	r0, #0x1
	strb	r0, [r1]
._18:
	add	r0, r2, #1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0x17
	bls	._19	@cond_branch
	pop	{r4}
	pop	{r0}
	bx	r0
._21:
	.align	2, 0
._20:
	.word	gSaveBlock1
	.word	0x2738
	.word	0x2739

	thumb_func_end debug_sub_808F518

	thumb_func_start debug_sub_808F560
debug_sub_808F560:
	push	{r4, lr}
	mov	r1, #0x0
	ldr	r4, ._23        @ gSaveBlock1
	ldr	r3, ._23 + 4    @ 0x2739
	mov	r2, #0x0
._22:
	lsl	r0, r1, #0x3
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r4
	add	r0, r0, r3
	strb	r2, [r0]
	add	r0, r1, #1
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	cmp	r1, #0x17
	bls	._22	@cond_branch
	bl	CloseMenu
	mov	r0, #0x1
	pop	{r4}
	pop	{r1}
	bx	r1
._24:
	.align	2, 0
._23:
	.word	gSaveBlock1
	.word	0x2739

	thumb_func_end debug_sub_808F560

	thumb_func_start debug_sub_808F594
debug_sub_808F594:
	push	{r4, r5, r6, lr}
	mov	r2, #0x0
	ldr	r6, ._27        @ gSaveBlock1
	ldr	r5, ._27 + 4    @ 0x2738
	ldr	r4, ._27 + 8    @ 0x2739
	mov	r3, #0x1
._26:
	lsl	r0, r2, #0x3
	add	r0, r0, r2
	lsl	r0, r0, #0x2
	add	r1, r0, r6
	add	r0, r1, r5
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	._25	@cond_branch
	add	r0, r1, r4
	strb	r3, [r0]
._25:
	add	r0, r2, #1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0x17
	bls	._26	@cond_branch
	bl	CloseMenu
	mov	r0, #0x1
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
._28:
	.align	2, 0
._27:
	.word	gSaveBlock1
	.word	0x2738
	.word	0x2739

	thumb_func_end debug_sub_808F594

	thumb_func_start debug_sub_808F5D8
debug_sub_808F5D8:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	mov	r4, #0x0
	ldr	r6, ._30        @ gStringVar1
	ldr	r7, ._30 + 4    @ gUnknown_Debug_083C4BD4
	add	r0, r7, #1
	mov	r8, r0
._29:
	ldr	r5, ._30 + 8    @ gSpecialVar_0x8004
	strh	r4, [r5]
	bl	GetSlotMachineId
	add	r1, r0, #0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	add	r0, r6, #0
	mov	r2, #0x0
	mov	r3, #0x1
	bl	ConvertIntToDecimalStringN
	lsl	r0, r4, #0x1
	add	r0, r0, r4
	lsl	r0, r0, #0x2
	add	r1, r0, r7
	ldrb	r1, [r1]
	add r0, r0, r8
	ldrb	r2, [r0]
	add	r0, r6, #0
	bl	Menu_PrintText
	add	r0, r4, #1
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	cmp	r4, #0xb
	bls	._29	@cond_branch
	mov	r0, #0x0
	strh	r0, [r5]
	ldr	r1, ._30 + 12   @ gMenuCallback
	ldr	r0, ._30 + 16   @ debug_sub_8090278
	str	r0, [r1]
	mov	r0, #0x0
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
._31:
	.align	2, 0
._30:
	.word	gStringVar1
	.word	gUnknown_Debug_083C4BD4
	.word	gSpecialVar_0x8004
	.word	gMenuCallback
	.word	debug_sub_8090278+1

	thumb_func_end debug_sub_808F5D8

	thumb_func_start debug_sub_808F648
debug_sub_808F648:
	push	{lr}
	ldr	r0, ._35        @ gMain
	ldrh	r1, [r0, #0x2e]
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	._32	@cond_branch
	mov	r0, #0xa
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0xd
	bl	Menu_EraseWindowRect
	ldr	r0, ._35 + 4    @ gDebug_03000726
	ldrb	r1, [r0]
	mov	r2, #0x1
	eor	r1, r1, r2
	strb	r1, [r0]
	cmp	r1, #0
	beq	._33	@cond_branch
	bl	debug_sub_808F7B4
	b	._40
._36:
	.align	2, 0
._35:
	.word	gMain
	.word	gDebug_03000726
._33:
	bl	debug_sub_808F6BC
	b	._40
._32:
	bl	Menu_ProcessInputNoWrap_
	lsl	r0, r0, #0x18
	asr	r1, r0, #0x18
	mov	r0, #0x1
	neg	r0, r0
	cmp	r1, r0
	beq	._43	@cond_branch
	cmp	r1, r0
	bgt	._39	@cond_branch
	sub	r0, r0, #0x1
	cmp	r1, r0
	beq	._40	@cond_branch
	b	._43
._39:
	cmp	r1, #0
	beq	._42	@cond_branch
	b	._43
._40:
	mov	r0, #0x0
	b	._44
._42:
	bl	debug_sub_808F518
._43:
	bl	CloseMenu
	mov	r0, #0x1
._44:
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808F648

	thumb_func_start debug_sub_808F6BC
debug_sub_808F6BC:
	push	{r4, r5, r6, lr}
	mov	r4, #0x0
	ldr	r5, ._48        @ gStringVar1
	ldr	r6, ._48 + 4    @ gSaveBlock1
._45:
	lsl	r0, r4, #0x3
	add	r0, r0, r4
	lsl	r0, r0, #0x2
	add	r0, r0, r6
	ldr	r1, ._48 + 8    @ 0x2738
	add	r0, r0, r1
	ldrb	r1, [r0]
	add	r0, r5, #0
	mov	r2, #0x0
	mov	r3, #0x2
	bl	ConvertIntToDecimalStringN
	lsl	r1, r4, #0x19
	mov	r0, #0xa0
	lsl	r0, r0, #0x14
	add	r1, r1, r0
	lsr	r1, r1, #0x18
	add	r0, r5, #0
	mov	r2, #0x0
	bl	Menu_PrintText
	add	r0, r4, #1
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	cmp	r4, #0x4
	bls	._45	@cond_branch
	mov	r4, #0x5
	ldr	r5, ._48        @ gStringVar1
	ldr	r6, ._48 + 4    @ gSaveBlock1
._50:
	lsl	r0, r4, #0x3
	add	r0, r0, r4
	lsl	r0, r0, #0x2
	add	r0, r0, r6
	ldr	r1, ._48 + 8    @ 0x2738
	add	r0, r0, r1
	ldrb	r1, [r0]
	add	r0, r5, #0
	mov	r2, #0x0
	mov	r3, #0x2
	bl	ConvertIntToDecimalStringN
	cmp	r4, #0xe
	bhi	._46	@cond_branch
	lsl	r1, r4, #0x19
	lsr	r1, r1, #0x18
	add	r0, r5, #0
	mov	r2, #0x3
	bl	Menu_PrintText
	b	._47
._49:
	.align	2, 0
._48:
	.word	gStringVar1
	.word	gSaveBlock1
	.word	0x2738
._46:
	lsl	r1, r4, #0x19
	mov	r0, #0xec
	lsl	r0, r0, #0x18
	add	r1, r1, r0
	lsr	r1, r1, #0x18
	add	r0, r5, #0
	mov	r2, #0x6
	bl	Menu_PrintText
._47:
	add	r0, r4, #1
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	cmp	r4, #0x17
	bls	._50	@cond_branch
	mov	r4, #0x0
	ldr	r5, ._53        @ gStringVar1
._55:
	ldr	r0, ._53 + 4    @ gSaveBlock1
	lsl	r1, r4, #0x2
	add	r1, r1, r0
	ldr	r0, ._53 + 8    @ 0x2abc
	add	r1, r1, r0
	ldrb	r1, [r1]
	add	r0, r5, #0
	mov	r2, #0x0
	mov	r3, #0x2
	bl	ConvertIntToDecimalStringN
	cmp	r4, #0x7
	bhi	._51	@cond_branch
	lsl	r1, r4, #0x19
	mov	r0, #0xa0
	lsl	r0, r0, #0x14
	add	r1, r1, r0
	lsr	r1, r1, #0x18
	add	r0, r5, #0
	mov	r2, #0x9
	bl	Menu_PrintText
	b	._52
._54:
	.align	2, 0
._53:
	.word	gStringVar1
	.word	gSaveBlock1
	.word	0x2abc
._51:
	lsl	r1, r4, #0x19
	mov	r0, #0xfa
	lsl	r0, r0, #0x18
	add	r1, r1, r0
	lsr	r1, r1, #0x18
	add	r0, r5, #0
	mov	r2, #0xc
	bl	Menu_PrintText
._52:
	add	r0, r4, #1
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	cmp	r4, #0xf
	bls	._55	@cond_branch
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0

	thumb_func_end debug_sub_808F6BC

	thumb_func_start debug_sub_808F7B4
debug_sub_808F7B4:
	push	{r4, r5, r6, lr}
	mov	r4, #0x0
	ldr	r5, ._59        @ gStringVar1
	ldr	r6, ._59 + 4    @ gSaveBlock1
._56:
	lsl	r0, r4, #0x3
	add	r0, r0, r4
	lsl	r0, r0, #0x2
	add	r0, r0, r6
	ldr	r1, ._59 + 8    @ 0x2739
	add	r0, r0, r1
	ldrb	r1, [r0]
	add	r0, r5, #0
	mov	r2, #0x0
	mov	r3, #0x2
	bl	ConvertIntToDecimalStringN
	lsl	r1, r4, #0x19
	mov	r0, #0xa0
	lsl	r0, r0, #0x14
	add	r1, r1, r0
	lsr	r1, r1, #0x18
	add	r0, r5, #0
	mov	r2, #0x0
	bl	Menu_PrintText
	add	r0, r4, #1
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	cmp	r4, #0x4
	bls	._56	@cond_branch
	mov	r4, #0x5
	ldr	r5, ._59        @ gStringVar1
	ldr	r6, ._59 + 4    @ gSaveBlock1
._61:
	lsl	r0, r4, #0x3
	add	r0, r0, r4
	lsl	r0, r0, #0x2
	add	r0, r0, r6
	ldr	r1, ._59 + 8    @ 0x2739
	add	r0, r0, r1
	ldrb	r1, [r0]
	add	r0, r5, #0
	mov	r2, #0x0
	mov	r3, #0x2
	bl	ConvertIntToDecimalStringN
	cmp	r4, #0xe
	bhi	._57	@cond_branch
	lsl	r1, r4, #0x19
	lsr	r1, r1, #0x18
	add	r0, r5, #0
	mov	r2, #0x3
	bl	Menu_PrintText
	b	._58
._60:
	.align	2, 0
._59:
	.word	gStringVar1
	.word	gSaveBlock1
	.word	0x2739
._57:
	lsl	r1, r4, #0x19
	mov	r0, #0xec
	lsl	r0, r0, #0x18
	add	r1, r1, r0
	lsr	r1, r1, #0x18
	add	r0, r5, #0
	mov	r2, #0x6
	bl	Menu_PrintText
._58:
	add	r0, r4, #1
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	cmp	r4, #0x17
	bls	._61	@cond_branch
	mov	r4, #0x0
	ldr	r5, ._64        @ gStringVar1
._66:
	ldr	r0, ._64 + 4    @ gSaveBlock1
	lsl	r1, r4, #0x2
	add	r1, r1, r0
	ldr	r0, ._64 + 8    @ 0x2abd
	add	r1, r1, r0
	ldrb	r1, [r1]
	add	r0, r5, #0
	mov	r2, #0x0
	mov	r3, #0x2
	bl	ConvertIntToDecimalStringN
	cmp	r4, #0x7
	bhi	._62	@cond_branch
	lsl	r1, r4, #0x19
	mov	r0, #0xa0
	lsl	r0, r0, #0x14
	add	r1, r1, r0
	lsr	r1, r1, #0x18
	add	r0, r5, #0
	mov	r2, #0x9
	bl	Menu_PrintText
	b	._63
._65:
	.align	2, 0
._64:
	.word	gStringVar1
	.word	gSaveBlock1
	.word	0x2abd
._62:
	lsl	r1, r4, #0x19
	mov	r0, #0xfa
	lsl	r0, r0, #0x18
	add	r1, r1, r0
	lsr	r1, r1, #0x18
	add	r0, r5, #0
	mov	r2, #0xc
	bl	Menu_PrintText
._63:
	add	r0, r4, #1
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	cmp	r4, #0xf
	bls	._66	@cond_branch
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0

	thumb_func_end debug_sub_808F7B4

	thumb_func_start debug_sub_808F8AC
debug_sub_808F8AC:
	push	{lr}
	ldr	r0, ._67        @ 0x832
	bl	FlagSet
	ldr	r0, ._67 + 4    @ 0x818
	bl	FlagSet
	bl	CloseMenu
	mov	r0, #0x1
	pop	{r1}
	bx	r1
._68:
	.align	2, 0
._67:
	.word	0x832
	.word	0x818

	thumb_func_end debug_sub_808F8AC

	thumb_func_start debug_sub_808F8CC
debug_sub_808F8CC:
	push	{r4, lr}
	ldr	r1, ._69        @ gDebug_03000724
	mov	r0, #0x0
	strb	r0, [r1]
	ldr	r0, ._69 + 4    @ gUnknown_Debug_083C49CA
	bl	sub_8071F40
	mov	r0, #0xd
	mov	r1, #0x6
	mov	r2, #0x1a
	mov	r3, #0x8
	bl	Menu_BlankWindowRect
	ldr	r0, ._69 + 8    @ gUnknown_Debug_083C4ABD
	ldr	r0, [r0]
	mov	r1, #0xe
	mov	r2, #0x7
	bl	Menu_PrintText
	mov	r0, #0x16
	mov	r1, #0x1
	mov	r2, #0x18
	mov	r3, #0x2
	bl	Menu_BlankWindowRect
	ldr	r4, ._69 + 12   @ gStringVar1
	add	r0, r4, #0
	mov	r1, #0x0
	mov	r2, #0x0
	mov	r3, #0x2
	bl	ConvertIntToDecimalStringN
	add	r0, r4, #0
	mov	r1, #0x17
	mov	r2, #0x1
	bl	Menu_PrintText
	ldr	r1, ._69 + 16   @ gMenuCallback
	ldr	r0, ._69 + 20   @ debug_sub_808F93C
	str	r0, [r1]
	pop	{r4}
	pop	{r0}
	bx	r0
._70:
	.align	2, 0
._69:
	.word	gDebug_03000724
	.word	gUnknown_Debug_083C49CA
	.word	gUnknown_Debug_083C4ABD+0xf
	.word	gStringVar1
	.word	gMenuCallback
	.word	debug_sub_808F93C+1

	thumb_func_end debug_sub_808F8CC

	thumb_func_start debug_sub_808F93C
debug_sub_808F93C:
	push	{r4, lr}
	mov	r2, #0x0
	ldr	r0, ._83        @ gMain
	ldrh	r1, [r0, #0x2e]
	mov	r0, #0x40
	and	r0, r0, r1
	cmp	r0, #0
	beq	._71	@cond_branch
	ldr	r1, ._83 + 4    @ gDebug_03000725
	ldrb	r0, [r1]
	add	r0, r0, #0x1
	strb	r0, [r1]
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x18
	bne	._72	@cond_branch
	strb	r2, [r1]
._72:
	mov	r0, #0x5
	bl	PlaySE
	mov	r2, #0x1
._71:
	ldr	r0, ._83        @ gMain
	ldrh	r1, [r0, #0x2e]
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	beq	._73	@cond_branch
	ldr	r1, ._83 + 4    @ gDebug_03000725
	ldrb	r0, [r1]
	cmp	r0, #0
	bne	._74	@cond_branch
	mov	r0, #0x18
	strb	r0, [r1]
._74:
	ldrb	r0, [r1]
	sub	r0, r0, #0x1
	strb	r0, [r1]
	mov	r0, #0x5
	bl	PlaySE
	mov	r2, #0x1
._73:
	ldr	r0, ._83        @ gMain
	ldrh	r1, [r0, #0x2e]
	mov	r0, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	._75	@cond_branch
	ldr	r1, ._83 + 8    @ gDebug_03000724
	ldrb	r0, [r1]
	add	r0, r0, #0x1
	strb	r0, [r1]
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0xc
	bne	._76	@cond_branch
	mov	r0, #0x0
	strb	r0, [r1]
._76:
	mov	r0, #0x5
	bl	PlaySE
	mov	r2, #0x1
._75:
	ldr	r0, ._83        @ gMain
	ldrh	r1, [r0, #0x2e]
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	._77	@cond_branch
	ldr	r1, ._83 + 8    @ gDebug_03000724
	ldrb	r0, [r1]
	cmp	r0, #0
	bne	._78	@cond_branch
	mov	r0, #0xc
	strb	r0, [r1]
._78:
	ldrb	r0, [r1]
	sub	r0, r0, #0x1
	strb	r0, [r1]
	mov	r0, #0x5
	bl	PlaySE
	mov	r2, #0x1
._77:
	cmp	r2, #0
	beq	._79	@cond_branch
	mov	r0, #0xd
	mov	r1, #0x6
	mov	r2, #0x1a
	mov	r3, #0x8
	bl	Menu_BlankWindowRect
	ldr	r1, ._83 + 12   @ gUnknown_Debug_083C4ABD
	ldr	r0, ._83 + 8    @ gDebug_03000724
	ldrb	r0, [r0]
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	r1, #0xe
	mov	r2, #0x7
	bl	Menu_PrintText
	mov	r0, #0x16
	mov	r1, #0x1
	mov	r2, #0x18
	mov	r3, #0x2
	bl	Menu_BlankWindowRect
	ldr	r4, ._83 + 16   @ gStringVar1
	ldr	r0, ._83 + 4    @ gDebug_03000725
	ldrb	r1, [r0]
	add	r0, r4, #0
	mov	r2, #0x0
	mov	r3, #0x2
	bl	ConvertIntToDecimalStringN
	add	r0, r4, #0
	mov	r1, #0x17
	mov	r2, #0x1
	bl	Menu_PrintText
._79:
	ldr	r4, ._83        @ gMain
	ldrh	r1, [r4, #0x2e]
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._80	@cond_branch
	mov	r0, #0x15
	bl	PlaySE
	ldr	r0, ._83 + 4    @ gDebug_03000725
	ldrb	r0, [r0]
	ldr	r2, ._83 + 20   @ gUnknown_Debug_083C4ABD
	ldr	r1, ._83 + 8    @ gDebug_03000724
	ldrb	r1, [r1]
	add	r1, r1, r2
	ldrb	r1, [r1]
	bl	debug_sub_808FA88
._80:
	ldrh	r1, [r4, #0x2e]
	mov	r0, #0xa
	and	r0, r0, r1
	cmp	r0, #0
	bne	._81	@cond_branch
	mov	r0, #0x0
	b	._82
._84:
	.align	2, 0
._83:
	.word	gMain
	.word	gDebug_03000725
	.word	gDebug_03000724
	.word	gUnknown_Debug_083C4ABD+0xf
	.word	gStringVar1
	.word	gUnknown_Debug_083C4ABD
._81:
	ldr	r0, ._85        @ gSaveBlock1
	bl	sub_80BF588
	bl	CloseMenu
	mov	r0, #0x1
._82:
	pop	{r4}
	pop	{r1}
	bx	r1
._86:
	.align	2, 0
._85:
	.word	gSaveBlock1+0x2738

	thumb_func_end debug_sub_808F93C

	thumb_func_start debug_sub_808FA88
debug_sub_808FA88:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	sp, sp, #0xffffffcc
	lsl	r0, r0, #0x18
	lsr	r6, r0, #0x18
	lsl	r1, r1, #0x18
	lsr	r7, r1, #0x18
	bl	GetLeadMonIndex
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r9, r0
	ldr	r3, ._92        @ gSaveBlock1
	lsl	r4, r6, #0x3
	add	r2, r4, r6
	lsl	r2, r2, #0x2
	add	r0, r2, r3
	ldr	r5, ._92 + 4    @ 0x2738
	add	r1, r0, r5
	strb	r7, [r1]
	ldr	r1, ._92 + 8    @ 0x2739
	add	r0, r0, r1
	mov	r1, #0x1
	strb	r1, [r0]
	mov	r1, #0x0
	ldr	r0, ._92 + 12   @ 0x273a
	add	r5, r3, r0
	mov	r3, #0x1
._87:
	add	r0, r1, r2
	add	r0, r0, r5
	strb	r3, [r0]
	add	r0, r1, #1
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	cmp	r1, #0x21
	bls	._87	@cond_branch
	add	r0, r7, #0
	bl	GetTVChannelByShowType
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	add	r1, r0, #0
	cmp	r0, #0x3
	beq	._88	@cond_branch
	cmp	r0, #0x3
	bgt	._89	@cond_branch
	cmp	r0, #0x2
	beq	._90	@cond_branch
	b	._95
._93:
	.align	2, 0
._92:
	.word	gSaveBlock1
	.word	0x2738
	.word	0x2739
	.word	0x273a
._89:
	cmp	r1, #0x4
	bne	._95	@cond_branch
._90:
	add	r0, r4, r6
	lsl	r0, r0, #0x2
	ldr	r1, ._96        @ gSaveBlock1
	add	r0, r0, r1
	bl	sub_80BE160
	b	._95
._97:
	.align	2, 0
._96:
	.word	gSaveBlock1+0x2738
._88:
	add	r0, r4, r6
	lsl	r0, r0, #0x2
	ldr	r1, ._100       @ gSaveBlock1
	add	r0, r0, r1
	bl	sub_80BE138
._95:
	sub	r0, r7, #1
	cmp	r0, #0x28
	bls	._98	@cond_branch
	b	._173
._98:
	lsl	r0, r0, #0x2
	ldr	r1, ._100 + 4   @ 
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
._101:
	.align	2, 0
._100:
	.word	gSaveBlock1+0x2738
	.word	._102
._102:
	.word	._104
	.word	._104
	.word	._105
	.word	._173
	.word	._107
	.word	._108
	.word	._109
	.word	._173
	.word	._173
	.word	._173
	.word	._173
	.word	._173
	.word	._173
	.word	._173
	.word	._173
	.word	._173
	.word	._173
	.word	._173
	.word	._173
	.word	._173
	.word	._123
	.word	._124
	.word	._125
	.word	._126
	.word	._127
	.word	._173
	.word	._173
	.word	._173
	.word	._173
	.word	._173
	.word	._173
	.word	._173
	.word	._173
	.word	._173
	.word	._173
	.word	._173
	.word	._173
	.word	._173
	.word	._173
	.word	._173
	.word	._143
._104:
	add	r0, r4, r6
	lsl	r0, r0, #0x2
	ldr	r1, ._145       @ gSaveBlock1
	add	r4, r0, r1
	mov	r2, #0x1
	strh	r2, [r4, #0x2]
	add	r1, r1, #0x10
	add	r0, r0, r1
	ldr	r1, ._145 + 4   @ gSaveBlock2
	bl	StringCopy
	mov	r0, #0x5
	strb	r0, [r4, #0x18]
	b	._173
._146:
	.align	2, 0
._145:
	.word	gSaveBlock1+0x2738
	.word	gSaveBlock2
._105:
	add	r4, r4, r6
	lsl	r4, r4, #0x2
	ldr	r6, ._148       @ gSaveBlock1
	add	r1, r4, r6
	mov	r8, r1
	mov	r0, #0x1
	strh	r0, [r1, #0x2]
	add	r0, r6, #5
	add	r0, r4, r0
	ldr	r1, ._148 + 4   @ gSaveBlock2
	bl	StringCopy
	mov	r0, #0x64
	mov	r5, r9
	mul	r5, r5, r0
	ldr	r0, ._148 + 8   @ gPlayerParty
	add	r5, r5, r0
	add	r6, r6, #0x10
	add	r4, r4, r6
	add	r0, r5, #0
	mov	r1, #0x2
	add	r2, r4, #0
	bl	GetMonData
	mov	r0, #0x5
	mov	r1, r8
	strb	r0, [r1, #0xd]
	add	r0, r5, #0
	mov	r1, #0x3
	bl	GetMonData
	mov	r5, r8
	strb	r0, [r5, #0xe]
	b	._173
._149:
	.align	2, 0
._148:
	.word	gSaveBlock1+0x2738
	.word	gSaveBlock2
	.word	gPlayerParty
._107:
	mov	r0, #0x64
	mov	r1, r9
	mul	r1, r1, r0
	mov	r8, r1
	ldr	r0, ._151       @ gPlayerParty
	add r8, r8, r0
	mov	r0, r8
	mov	r1, #0xb
	bl	GetMonData
	add	r4, r4, r6
	lsl	r4, r4, #0x2
	ldr	r5, ._151 + 4   @ gSaveBlock1
	add	r6, r4, r5
	strh	r0, [r6, #0x2]
	mov	r0, #0x1
	strh	r0, [r6, #0x1c]
	add	r0, r5, #0
	add	r0, r0, #0xf
	add	r0, r4, r0
	ldr	r1, ._151 + 8   @ gSaveBlock2
	bl	StringCopy
	add	r5, r5, #0x4
	add	r4, r4, r5
	mov	r0, r8
	mov	r1, #0x2
	add	r2, r4, #0
	bl	GetMonData
	mov	r0, #0x5
	strb	r0, [r6, #0x1e]
	mov	r0, r8
	mov	r1, #0x3
	bl	GetMonData
	strb	r0, [r6, #0x1f]
	b	._173
._152:
	.align	2, 0
._151:
	.word	gPlayerParty
	.word	gSaveBlock1+0x2738
	.word	gSaveBlock2
._108:
	add	r4, r4, r6
	lsl	r4, r4, #0x2
	ldr	r6, ._154       @ gSaveBlock1
	add	r5, r4, r6
	mov	r8, r5
	mov	r0, #0x1
	strh	r0, [r5, #0x2]
	add	r0, r6, #0
	add	r0, r0, #0x16
	add	r0, r4, r0
	ldr	r1, ._154 + 4   @ gSaveBlock2
	bl	StringCopy
	mov	r0, #0x64
	mov	r5, r9
	mul	r5, r5, r0
	ldr	r0, ._154 + 8   @ gPlayerParty
	add	r5, r5, r0
	add	r6, r6, #0x8
	add	r4, r4, r6
	add	r0, r5, #0
	mov	r1, #0x2
	add	r2, r4, #0
	bl	GetMonData
	mov	r0, #0x5
	mov	r1, r8
	strb	r0, [r1, #0x1e]
	add	r0, r5, #0
	mov	r1, #0x3
	bl	GetMonData
	mov	r5, r8
	strb	r0, [r5, #0x1f]
	b	._173
._155:
	.align	2, 0
._154:
	.word	gSaveBlock1+0x2738
	.word	gSaveBlock2
	.word	gPlayerParty
._109:
	add	r4, r4, r6
	lsl	r4, r4, #0x2
	ldr	r5, ._157       @ gSaveBlock1
	add	r6, r4, r5
	mov	r0, #0x1
	strh	r0, [r6, #0xa]
	strh	r0, [r6, #0x14]
	add	r0, r5, #2
	add	r0, r4, r0
	ldr	r1, ._157 + 4   @ gSaveBlock2
	mov	r8, r1
	bl	StringCopy
	add	r5, r5, #0xc
	add	r4, r4, r5
	add	r0, r4, #0
	mov	r1, r8
	bl	StringCopy
	mov	r0, #0x5
	strb	r0, [r6, #0x1d]
	b	._173
._158:
	.align	2, 0
._157:
	.word	gSaveBlock1+0x2738
	.word	gSaveBlock2
._143:
	add	r0, r4, r6
	lsl	r0, r0, #0x2
	ldr	r1, ._160       @ gSaveBlock1
	add	r0, r0, r1
	mov	r1, #0x1
	strh	r1, [r0, #0xc]
	strh	r1, [r0, #0x16]
	b	._173
._161:
	.align	2, 0
._160:
	.word	gSaveBlock1+0x2738
._123:
	add	r4, r4, r6
	lsl	r4, r4, #0x2
	ldr	r0, ._163       @ gSaveBlock1
	add	r4, r4, r0
	ldr	r1, ._163 + 4   @ gUnknown_Debug_083C4C64
	mov	r0, sp
	mov	r2, #0x8
	bl	memcpy
	add	r5, sp, #0x8
	ldr	r1, ._163 + 8   @ gUnknown_Debug_083C4C6C
	add	r0, r5, #0
	mov	r2, #0xb
	bl	memcpy
	mov	r0, #0xff
	strb	r0, [r4, #0x12]
	add	r0, r4, #0
	add	r0, r0, #0x13
	mov	r1, sp
	bl	StringCopy
	add	r0, r4, #4
	add	r1, r5, #0
	bl	StringCopy
	mov	r0, #0xc
	strb	r0, [r4, #0xf]
	mov	r0, #0x28
	strh	r0, [r4, #0x10]
	mov	r0, #0x5
	strb	r0, [r4, #0x2]
	strb	r0, [r4, #0x3]
	b	._173
._164:
	.align	2, 0
._163:
	.word	gSaveBlock1+0x2738
	.word	gUnknown_Debug_083C4C64
	.word	gUnknown_Debug_083C4C6C
._124:
	add	r0, r4, r6
	lsl	r0, r0, #0x2
	ldr	r1, ._168       @ gSaveBlock1
	add	r5, r0, r1
	add	r4, sp, #0x14
	ldr	r1, ._168 + 4   @ gUnknown_Debug_083C4C64
	add	r0, r4, #0
	mov	r2, #0x8
	bl	memcpy
	add	r1, r4, #0
	mov	r3, #0xfe
	mov	r2, #0x2
	add	r0, r5, #0
	add	r0, r0, #0x10
._165:
	strh	r3, [r0]
	sub	r0, r0, #0x2
	sub	r2, r2, #0x1
	cmp	r2, #0
	bge	._165	@cond_branch
	mov	r0, #0x1
	strb	r0, [r5, #0x2]
	mov	r0, #0x28
	strb	r0, [r5, #0x12]
	add	r0, r5, #0
	add	r0, r0, #0x13
	add	r3, r5, #6
	mov	r6, #0x1e
	add	r2, r5, #0
	add	r2, r2, #0xa
._166:
	strh	r6, [r2]
	sub	r2, r2, #0x2
	cmp	r2, r3
	bge	._166	@cond_branch
	bl	StringCopy
	mov	r0, #0x5
	strb	r0, [r5, #0x3]
	b	._173
._169:
	.align	2, 0
._168:
	.word	gSaveBlock1+0x2738
	.word	gUnknown_Debug_083C4C64
._125:
	add	r4, r4, r6
	lsl	r4, r4, #0x2
	ldr	r0, ._171       @ gSaveBlock1
	add	r4, r4, r0
	add	r5, sp, #0x1c
	ldr	r1, ._171 + 4   @ gUnknown_Debug_083C4C64
	add	r0, r5, #0
	mov	r2, #0x8
	bl	memcpy
	mov	r0, #0x28
	strh	r0, [r4, #0xc]
	strh	r0, [r4, #0xe]
	mov	r0, #0x3
	strb	r0, [r4, #0x12]
	mov	r0, #0xff
	strb	r0, [r4, #0x10]
	mov	r0, #0x1
	strb	r0, [r4, #0x11]
	add	r0, r4, #0
	add	r0, r0, #0x13
	add	r1, r5, #0
	bl	StringCopy
	mov	r0, #0x5
	strb	r0, [r4, #0x2]
	b	._173
._172:
	.align	2, 0
._171:
	.word	gSaveBlock1+0x2738
	.word	gUnknown_Debug_083C4C64
._126:
	add	r4, r4, r6
	lsl	r4, r4, #0x2
	ldr	r0, ._174       @ gSaveBlock1
	add	r4, r4, r0
	add	r5, sp, #0x24
	ldr	r1, ._174 + 4   @ gUnknown_Debug_083C4C64
	add	r0, r5, #0
	mov	r2, #0x8
	bl	memcpy
	mov	r0, #0xff
	strb	r0, [r4, #0x2]
	mov	r0, #0x0
	strb	r0, [r4, #0x3]
	mov	r0, #0x28
	strh	r0, [r4, #0x4]
	add	r0, r4, #0
	add	r0, r0, #0x13
	add	r1, r5, #0
	bl	StringCopy
	mov	r0, #0x5
	strb	r0, [r4, #0x6]
	b	._173
._175:
	.align	2, 0
._174:
	.word	gSaveBlock1+0x2738
	.word	gUnknown_Debug_083C4C64
._127:
	add	r4, r4, r6
	lsl	r4, r4, #0x2
	ldr	r0, ._176       @ gSaveBlock1
	add	r4, r4, r0
	add	r5, sp, #0x2c
	ldr	r1, ._176 + 4   @ gUnknown_Debug_083C4C64
	add	r0, r5, #0
	mov	r2, #0x8
	bl	memcpy
	ldr	r0, ._176 + 8   @ 0xffff
	strh	r0, [r4, #0x2]
	mov	r0, #0x1
	neg	r0, r0
	strh	r0, [r4, #0x6]
	mov	r0, #0x28
	strh	r0, [r4, #0x4]
	strh	r0, [r4, #0x8]
	mov	r0, #0x3
	strb	r0, [r4, #0xa]
	add	r0, r4, #0
	add	r0, r0, #0x13
	add	r1, r5, #0
	bl	StringCopy
	mov	r0, #0x5
	strb	r0, [r4, #0xb]
._173:
	add	sp, sp, #0x34
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._177:
	.align	2, 0
._176:
	.word	gSaveBlock1+0x2738
	.word	gUnknown_Debug_083C4C64
	.word	0xffff

	thumb_func_end debug_sub_808FA88

	thumb_func_start debug_sub_808FEBC
debug_sub_808FEBC:
	push	{lr}
	bl	ClearTVShowData
	bl	CloseMenu
	mov	r0, #0x1
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808FEBC

	thumb_func_start debug_sub_808FECC
debug_sub_808FECC:
	push	{r4, lr}
	ldr	r1, ._178       @ gDebug_03000724
	mov	r0, #0x0
	strb	r0, [r1]
	ldr	r0, ._178 + 4   @ gUnknown_Debug_083C49CA
	bl	sub_8071F40
	mov	r0, #0xd
	mov	r1, #0x6
	mov	r2, #0x17
	mov	r3, #0x8
	bl	Menu_BlankWindowRect
	ldr	r0, ._178 + 8   @ gUnknown_Debug_083C4B20
	ldr	r0, [r0]
	mov	r1, #0xe
	mov	r2, #0x7
	bl	Menu_PrintText
	mov	r0, #0x16
	mov	r1, #0x1
	mov	r2, #0x18
	mov	r3, #0x2
	bl	Menu_BlankWindowRect
	ldr	r4, ._178 + 12  @ gStringVar1
	add	r0, r4, #0
	mov	r1, #0x0
	mov	r2, #0x0
	mov	r3, #0x2
	bl	ConvertIntToDecimalStringN
	add	r0, r4, #0
	mov	r1, #0x17
	mov	r2, #0x1
	bl	Menu_PrintText
	ldr	r1, ._178 + 16  @ gMenuCallback
	ldr	r0, ._178 + 20  @ debug_sub_808FF3C
	str	r0, [r1]
	pop	{r4}
	pop	{r0}
	bx	r0
._179:
	.align	2, 0
._178:
	.word	gDebug_03000724
	.word	gUnknown_Debug_083C49CA
	.word	gUnknown_Debug_083C4B20+0x4
	.word	gStringVar1
	.word	gMenuCallback
	.word	debug_sub_808FF3C+1

	thumb_func_end debug_sub_808FECC

	thumb_func_start debug_sub_808FF3C
debug_sub_808FF3C:
	push	{r4, lr}
	mov	r2, #0x0
	ldr	r0, ._192       @ gMain
	ldrh	r1, [r0, #0x2e]
	mov	r0, #0x40
	and	r0, r0, r1
	cmp	r0, #0
	beq	._180	@cond_branch
	ldr	r1, ._192 + 4   @ gDebug_03000725
	ldrb	r0, [r1]
	add	r0, r0, #0x1
	strb	r0, [r1]
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x10
	bne	._181	@cond_branch
	strb	r2, [r1]
._181:
	mov	r0, #0x5
	bl	PlaySE
	mov	r2, #0x1
._180:
	ldr	r0, ._192       @ gMain
	ldrh	r1, [r0, #0x2e]
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	beq	._182	@cond_branch
	ldr	r1, ._192 + 4   @ gDebug_03000725
	ldrb	r0, [r1]
	cmp	r0, #0
	bne	._183	@cond_branch
	mov	r0, #0x10
	strb	r0, [r1]
._183:
	ldrb	r0, [r1]
	sub	r0, r0, #0x1
	strb	r0, [r1]
	mov	r0, #0x5
	bl	PlaySE
	mov	r2, #0x1
._182:
	ldr	r0, ._192       @ gMain
	ldrh	r1, [r0, #0x2e]
	mov	r0, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	._184	@cond_branch
	ldr	r1, ._192 + 8   @ gDebug_03000724
	ldrb	r0, [r1]
	add	r0, r0, #0x1
	strb	r0, [r1]
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x3
	bne	._185	@cond_branch
	mov	r0, #0x0
	strb	r0, [r1]
._185:
	mov	r0, #0x5
	bl	PlaySE
	mov	r2, #0x1
._184:
	ldr	r0, ._192       @ gMain
	ldrh	r1, [r0, #0x2e]
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	._186	@cond_branch
	ldr	r1, ._192 + 8   @ gDebug_03000724
	ldrb	r0, [r1]
	cmp	r0, #0
	bne	._187	@cond_branch
	mov	r0, #0x3
	strb	r0, [r1]
._187:
	ldrb	r0, [r1]
	sub	r0, r0, #0x1
	strb	r0, [r1]
	mov	r0, #0x5
	bl	PlaySE
	mov	r2, #0x1
._186:
	cmp	r2, #0
	beq	._188	@cond_branch
	mov	r0, #0xd
	mov	r1, #0x6
	mov	r2, #0x17
	mov	r3, #0x8
	bl	Menu_BlankWindowRect
	ldr	r1, ._192 + 12  @ gUnknown_Debug_083C4B20
	ldr	r0, ._192 + 8   @ gDebug_03000724
	ldrb	r0, [r0]
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	r1, #0xe
	mov	r2, #0x7
	bl	Menu_PrintText
	mov	r0, #0x16
	mov	r1, #0x1
	mov	r2, #0x18
	mov	r3, #0x2
	bl	Menu_BlankWindowRect
	ldr	r4, ._192 + 16  @ gStringVar1
	ldr	r0, ._192 + 4   @ gDebug_03000725
	ldrb	r1, [r0]
	add	r0, r4, #0
	mov	r2, #0x0
	mov	r3, #0x2
	bl	ConvertIntToDecimalStringN
	add	r0, r4, #0
	mov	r1, #0x17
	mov	r2, #0x1
	bl	Menu_PrintText
._188:
	ldr	r4, ._192       @ gMain
	ldrh	r1, [r4, #0x2e]
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._189	@cond_branch
	mov	r0, #0x15
	bl	PlaySE
	ldr	r0, ._192 + 4   @ gDebug_03000725
	ldrb	r0, [r0]
	ldr	r2, ._192 + 20  @ gUnknown_Debug_083C4B20
	ldr	r1, ._192 + 8   @ gDebug_03000724
	ldrb	r1, [r1]
	add	r1, r1, r2
	ldrb	r1, [r1]
	bl	debug_sub_8090080
._189:
	ldrh	r1, [r4, #0x2e]
	mov	r0, #0xa
	and	r0, r0, r1
	cmp	r0, #0
	bne	._190	@cond_branch
	mov	r0, #0x0
	b	._191
._193:
	.align	2, 0
._192:
	.word	gMain
	.word	gDebug_03000725
	.word	gDebug_03000724
	.word	gUnknown_Debug_083C4B20+0x4
	.word	gStringVar1
	.word	gUnknown_Debug_083C4B20
._190:
	bl	sub_80BEC40
	bl	CloseMenu
	mov	r0, #0x1
._191:
	pop	{r4}
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808FF3C

	thumb_func_start debug_sub_8090080
debug_sub_8090080:
	lsl	r0, r0, #0x18
	ldr	r2, ._194       @ gSaveBlock1
	lsr	r0, r0, #0x16
	add	r0, r0, r2
	ldr	r3, ._194 + 4   @ 0x2abc
	add	r2, r0, r3
	strb	r1, [r2]
	ldr	r1, ._194 + 8   @ 0x2abd
	add	r2, r0, r1
	mov	r1, #0x1
	strb	r1, [r2]
	add	r3, r3, #0x2
	add	r0, r0, r3
	mov	r1, #0x4
	strh	r1, [r0]
	bx	lr
._195:
	.align	2, 0
._194:
	.word	gSaveBlock1
	.word	0x2abc
	.word	0x2abd

	thumb_func_end debug_sub_8090080

	thumb_func_start debug_sub_80900AC
debug_sub_80900AC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	mov	r7, #0x0
	mov	r5, #0x0
	ldr	r0, ._202       @ gSaveBlock1
	mov	r8, r0
._198:
	lsl	r0, r5, #0x3
	add	r0, r0, r5
	lsl	r0, r0, #0x2
	mov	r1, r8
	add	r6, r0, r1
	ldr	r1, ._202 + 4   @ 0x2738
	add	r0, r6, r1
	ldrb	r4, [r0]
	cmp	r4, #0
	bne	._196	@cond_branch
	cmp	r7, #0xc
	bne	._197	@cond_branch
	mov	r7, #0x0
._197:
	ldr	r0, ._202 + 8   @ gUnknown_Debug_083C4ABD
	add	r0, r7, r0
	ldrb	r1, [r0]
	add	r0, r5, #0
	bl	debug_sub_808FA88
	ldr	r1, ._202 + 12  @ 0x2739
	add	r0, r6, r1
	strb	r4, [r0]
	add	r0, r7, #1
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
._196:
	add	r0, r5, #1
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	cmp	r5, #0x17
	bls	._198	@cond_branch
	mov	r7, #0x0
	mov	r5, #0x0
._201:
	ldr	r0, ._202       @ gSaveBlock1
	lsl	r1, r5, #0x2
	add	r1, r1, r0
	ldr	r0, ._202 + 16  @ 0x2abc
	add	r1, r1, r0
	ldrb	r0, [r1]
	cmp	r0, #0
	bne	._199	@cond_branch
	cmp	r7, #0x3
	bne	._200	@cond_branch
	mov	r7, #0x0
._200:
	ldr	r0, ._202 + 20  @ gUnknown_Debug_083C4B20
	add	r0, r7, r0
	ldrb	r1, [r0]
	add	r0, r5, #0
	bl	debug_sub_8090080
	add	r0, r7, #1
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
._199:
	add	r0, r5, #1
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	cmp	r5, #0xf
	bls	._201	@cond_branch
	bl	CloseMenu
	mov	r0, #0x1
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
._203:
	.align	2, 0
._202:
	.word	gSaveBlock1
	.word	0x2738
	.word	gUnknown_Debug_083C4ABD
	.word	0x2739
	.word	0x2abc
	.word	gUnknown_Debug_083C4B20

	thumb_func_end debug_sub_80900AC

	thumb_func_start NoharaDebugMenu_Fan
NoharaDebugMenu_Fan:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0xb
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._204       @ gUnknown_Debug_083C4D28
	mov	r0, #0x1
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0xa
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._204 + 4   @ gMenuCallback
	ldr	r0, ._204 + 8   @ debug_sub_80901A4
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._205:
	.align	2, 0
._204:
	.word	gUnknown_Debug_083C4D28
	.word	gMenuCallback
	.word	debug_sub_80901A4+1

	thumb_func_end NoharaDebugMenu_Fan

	thumb_func_start debug_sub_80901A4
debug_sub_80901A4:
	push	{lr}
	bl	Menu_ProcessInput
	lsl	r0, r0, #0x18
	asr	r1, r0, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r1, r0
	beq	._206	@cond_branch
	add	r0, r0, #0x1
	cmp	r1, r0
	beq	._207	@cond_branch
	ldr	r2, ._209       @ gMenuCallback
	ldr	r0, ._209 + 4   @ gUnknown_Debug_083C4D28
	lsl	r1, r1, #0x3
	add	r0, r0, #0x4
	add	r1, r1, r0
	ldr	r0, [r1]
	str	r0, [r2]
._206:
	mov	r0, #0x0
	b	._208
._210:
	.align	2, 0
._209:
	.word	gMenuCallback
	.word	gUnknown_Debug_083C4D28
._207:
	bl	CloseMenu
	mov	r0, #0x1
._208:
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_80901A4

	thumb_func_start debug_sub_80901E4
debug_sub_80901E4:
	push	{lr}
	bl	ResetFanClub
	bl	sub_810FAA0
	bl	CloseMenu
	mov	r0, #0x1
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_80901E4

	thumb_func_start debug_sub_80901F8
debug_sub_80901F8:
	push	{lr}
	bl	sub_810FB9C
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	ldr	r2, ._211       @ gUnknown_Debug_083C4CA8
	ldr	r1, ._211 + 4   @ gUnknown_083F8408
	add	r0, r0, r1
	ldrb	r0, [r0]
	sub	r0, r0, #0x8
	lsl	r0, r0, #0x2
	add	r0, r0, r2
	ldr	r0, [r0]
	mov	r1, #0xe
	mov	r2, #0x7
	bl	Menu_PrintText
	ldr	r1, ._211 + 8   @ gMenuCallback
	ldr	r0, ._211 + 12  @ debug_sub_8090278
	str	r0, [r1]
	mov	r0, #0x0
	pop	{r1}
	bx	r1
._212:
	.align	2, 0
._211:
	.word	gUnknown_Debug_083C4CA8
	.word	gUnknown_083F8408
	.word	gMenuCallback
	.word	debug_sub_8090278+1

	thumb_func_end debug_sub_80901F8

	thumb_func_start debug_sub_8090238
debug_sub_8090238:
	push	{lr}
	bl	sub_810FC18
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	ldr	r2, ._213       @ gUnknown_Debug_083C4CA8
	ldr	r1, ._213 + 4   @ gUnknown_083F8410
	add	r0, r0, r1
	ldrb	r0, [r0]
	sub	r0, r0, #0x8
	lsl	r0, r0, #0x2
	add	r0, r0, r2
	ldr	r0, [r0]
	mov	r1, #0xe
	mov	r2, #0x7
	bl	Menu_PrintText
	ldr	r1, ._213 + 8   @ gMenuCallback
	ldr	r0, ._213 + 12  @ debug_sub_8090278
	str	r0, [r1]
	mov	r0, #0x0
	pop	{r1}
	bx	r1
._214:
	.align	2, 0
._213:
	.word	gUnknown_Debug_083C4CA8
	.word	gUnknown_083F8410
	.word	gMenuCallback
	.word	debug_sub_8090278+1

	thumb_func_end debug_sub_8090238

	thumb_func_start debug_sub_8090278
debug_sub_8090278:
	push	{lr}
	ldr	r0, ._217       @ gMain
	ldrh	r1, [r0, #0x2e]
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	bne	._215	@cond_branch
	mov	r0, #0x0
	b	._216
._218:
	.align	2, 0
._217:
	.word	gMain
._215:
	bl	CloseMenu
	mov	r0, #0x1
._216:
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_8090278

	thumb_func_start debug_sub_809029C
debug_sub_809029C:
	push	{r4, lr}
	ldr	r4, ._219       @ gStringVar1
	ldr	r0, ._219 + 4   @ gSaveBlock1
	ldr	r1, ._219 + 8   @ 0x13c2
	add	r0, r0, r1
	ldrh	r0, [r0]
	mov	r1, #0x7f
	and	r1, r1, r0
	add	r0, r4, #0
	mov	r2, #0x0
	mov	r3, #0x2
	bl	ConvertIntToDecimalStringN
	add	r0, r4, #0
	mov	r1, #0x10
	mov	r2, #0x7
	bl	Menu_PrintText
	ldr	r1, ._219 + 12  @ gMenuCallback
	ldr	r0, ._219 + 16  @ debug_sub_8090278
	str	r0, [r1]
	mov	r0, #0x0
	pop	{r4}
	pop	{r1}
	bx	r1
._220:
	.align	2, 0
._219:
	.word	gStringVar1
	.word	gSaveBlock1
	.word	0x13c2
	.word	gMenuCallback
	.word	debug_sub_8090278+1

	thumb_func_end debug_sub_809029C

	thumb_func_start debug_sub_80902E4
debug_sub_80902E4:
	push	{lr}
	ldr	r1, ._221       @ gSaveBlock2
	ldrh	r0, [r1, #0xe]
	add	r0, r0, #0x6
	strh	r0, [r1, #0xe]
	bl	CloseMenu
	mov	r0, #0x1
	pop	{r1}
	bx	r1
._222:
	.align	2, 0
._221:
	.word	gSaveBlock2

	thumb_func_end debug_sub_80902E4

	thumb_func_start debug_sub_80902FC
debug_sub_80902FC:
	push	{lr}
	mov	r0, #0x0
	bl	sub_810FB10
	bl	CloseMenu
	mov	r0, #0x1
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_80902FC

	thumb_func_start debug_sub_8090310
debug_sub_8090310:
	push	{lr}
	mov	r0, #0x1
	bl	sub_810FB10
	bl	CloseMenu
	mov	r0, #0x1
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_8090310

	thumb_func_start debug_sub_8090324
debug_sub_8090324:
	push	{lr}
	mov	r0, #0x2
	bl	sub_810FB10
	bl	CloseMenu
	mov	r0, #0x1
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_8090324

	thumb_func_start debug_sub_8090338
debug_sub_8090338:
	push	{lr}
	mov	r0, #0x3
	bl	sub_810FB10
	bl	CloseMenu
	mov	r0, #0x1
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_8090338

	thumb_func_start NoharaDebugMenu_BattleVSDad
NoharaDebugMenu_BattleVSDad:
	push	{lr}
	ldr	r0, ._223       @ 0x4085
	mov	r1, #0x6
	bl	VarSet
	bl	CloseMenu
	mov	r0, #0x1
	pop	{r1}
	bx	r1
._224:
	.align	2, 0
._223:
	.word	0x4085

	thumb_func_end NoharaDebugMenu_BattleVSDad

	thumb_func_start NoharaDebugMenu_DadAfterBattle
NoharaDebugMenu_DadAfterBattle:
	push	{lr}
	ldr	r0, ._225       @ 0x4085
	mov	r1, #0x7
	bl	VarSet
	bl	CloseMenu
	mov	r0, #0x1
	pop	{r1}
	bx	r1
._226:
	.align	2, 0
._225:
	.word	0x4085

	thumb_func_end NoharaDebugMenu_DadAfterBattle

	thumb_func_start NoharaDebugMenu_SootopolisCity
NoharaDebugMenu_SootopolisCity:
	push	{lr}
	mov	r0, #0x81
	bl	FlagSet
	mov	r0, #0x71
	bl	FlagSet
	ldr	r0, ._227       @ 0x32f
	bl	FlagClear
	bl	CloseMenu
	mov	r0, #0x1
	pop	{r1}
	bx	r1
._228:
	.align	2, 0
._227:
	.word	0x32f

	thumb_func_end NoharaDebugMenu_SootopolisCity

	thumb_func_start NoharaDebugMenu_Embark
NoharaDebugMenu_Embark:
	push	{lr}
	ldr	r0, ._229       @ 0x2e3
	bl	FlagClear
	ldr	r0, ._229 + 4   @ 0x4090
	mov	r1, #0x1
	bl	VarSet
	bl	CloseMenu
	mov	r0, #0x1
	pop	{r1}
	bx	r1
._230:
	.align	2, 0
._229:
	.word	0x2e3
	.word	0x4090

	thumb_func_end NoharaDebugMenu_Embark

	thumb_func_start NoharaDebugMenu_Yes9999
NoharaDebugMenu_Yes9999:
	push	{lr}
	ldr	r0, ._231       @ 0x4048
	ldr	r1, ._231 + 4   @ 0x270f
	bl	VarSet
	bl	CloseMenu
	mov	r0, #0x1
	pop	{r1}
	bx	r1
._232:
	.align	2, 0
._231:
	.word	0x4048
	.word	0x270f

	thumb_func_end NoharaDebugMenu_Yes9999

	thumb_func_start NoharaDebugMenu_LegendsFlagOn
NoharaDebugMenu_LegendsFlagOn:
	push	{lr}
	mov	r0, #0xe4
	bl	FlagSet
	bl	CloseMenu
	mov	r0, #0x1
	pop	{r1}
	bx	r1

	thumb_func_end NoharaDebugMenu_LegendsFlagOn

	thumb_func_start NoharaDebugMenu_AddNumWinningStreaks
NoharaDebugMenu_AddNumWinningStreaks:
	push	{lr}
	ldr	r0, ._235       @ gSaveBlock2
	ldr	r1, ._235 + 4   @ 0x572
	add	r2, r0, r1
	ldrh	r1, [r2]
	cmp	r1, #0x31
	bhi	._233	@cond_branch
	mov	r0, #0x32
	b	._244
._236:
	.align	2, 0
._235:
	.word	gSaveBlock2
	.word	0x572
._233:
	cmp	r1, #0x63
	bhi	._237	@cond_branch
	mov	r0, #0x64
	b	._244
._237:
	ldr	r0, ._241       @ 0x3e7
	cmp	r1, r0
	bhi	._239	@cond_branch
	add	r0, r0, #0x1
	b	._244
._242:
	.align	2, 0
._241:
	.word	0x3e7
._239:
	ldr	r0, ._245       @ 0x1387
	cmp	r1, r0
	bhi	._243	@cond_branch
	ldr	r0, ._245 + 4   @ 0x2706
	b	._244
._246:
	.align	2, 0
._245:
	.word	0x1387
	.word	0x2706
._243:
	ldr	r0, ._248       @ 0x2705
	cmp	r1, r0
	bhi	._247	@cond_branch
	add	r0, r0, #0xa
._244:
	strh	r0, [r2]
._247:
	bl	CloseMenu
	mov	r0, #0x1
	pop	{r1}
	bx	r1
._249:
	.align	2, 0
._248:
	.word	0x2705

	thumb_func_end NoharaDebugMenu_AddNumWinningStreaks

	.align 2, 0

.endif
