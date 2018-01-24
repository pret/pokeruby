.if DEBUG

	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.text

	thumb_func_start TayaDebugMenu_Trend
TayaDebugMenu_Trend:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffd8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1e
	mov	r3, #0xb
	bl	Menu_DrawStdWindowFrame
	ldr	r5, ._3
	mov	r7, #0x0
	mov	r0, #0x1
	add r0, r0, sp
	mov	sl, r0
	mov	r9, sp
	mov	r0, #0x0
	mov	r8, r0
	add	r6, sp, #0x20
._2:
	ldrb	r1, [r5, #0x1]
	mov	r0, #0x40
	and	r0, r0, r1
	mov	r1, #0xa1
	cmp	r0, #0
	beq	._1	@cond_branch
	mov	r1, #0xa2
._1:
	mov	r0, r9
	strb	r1, [r0]
	ldrh	r1, [r5, #0x4]
	add	r0, r6, #0
	bl	EasyChat_GetWordText
	mov	r0, sl
	add	r1, r6, #0
	mov	r2, #0x0
	mov	r3, #0x7
	bl	StringCopyPadded
	add	r4, r0, #0
	ldrh	r1, [r5, #0x6]
	add	r0, r6, #0
	bl	EasyChat_GetWordText
	add	r0, r4, #0
	add	r1, r6, #0
	mov	r2, #0x0
	mov	r3, #0x8
	bl	StringCopyPadded
	add	r4, r0, #0
	ldrb	r1, [r5]
	lsl	r1, r1, #0x19
	lsr	r1, r1, #0x19
	mov	r2, #0x1
	mov	r3, #0x3
	bl	ConvertIntToDecimalStringN
	add	r4, r0, #0
	mov	r0, r8
	strb	r0, [r4]
	add	r4, r4, #0x1
	ldrh	r1, [r5]
	lsl	r1, r1, #0x12
	lsr	r1, r1, #0x19
	add	r0, r4, #0
	mov	r2, #0x1
	mov	r3, #0x3
	bl	ConvertIntToDecimalStringN
	add	r4, r0, #0
	mov	r0, r8
	strb	r0, [r4]
	add	r4, r4, #0x1
	ldrh	r1, [r5, #0x2]
	add	r0, r4, #0
	mov	r2, #0x1
	mov	r3, #0x5
	bl	ConvertIntToDecimalStringN
	lsl	r2, r7, #0x1
	add	r2, r2, #0x1
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	mov	r0, sp
	mov	r1, #0x1
	bl	Menu_PrintText
	add	r5, r5, #0x8
	add	r0, r7, #1
	lsl	r0, r0, #0x10
	lsr	r7, r0, #0x10
	cmp	r7, #0x4
	bls	._2	@cond_branch
	ldr	r1, ._3 + 4
	ldr	r0, ._3 + 8
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x28
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
._4:
	.align	2, 0
._3:
	.word	gSaveBlock1+0x2dd4
	.word	gMenuCallback
	.word	debug_sub_8090808+1

	thumb_func_end TayaDebugMenu_Trend

	thumb_func_start debug_sub_8090808
debug_sub_8090808:
	push	{lr}
	ldr	r0, ._7
	ldrh	r1, [r0, #0x2e]
	mov	r0, #0x3
	and	r0, r0, r1
	cmp	r0, #0
	bne	._5	@cond_branch
	mov	r0, #0x0
	b	._6
._8:
	.align	2, 0
._7:
	.word	gMain
._5:
	bl	Menu_EraseScreen
	bl	CloseMenu
	mov	r0, #0x1
._6:
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_8090808

	thumb_func_start TayaDebugMenu_TrendR
TayaDebugMenu_TrendR:
	push	{r4, r5, r6, r7, lr}
	mov	r0, #0x0
	ldr	r7, ._11
._10:
	mov	r4, #0x0
	lsl	r5, r0, #0x3
	add	r6, r0, #1
._9:
	bl	Random
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r1, #0x16
	bl	__umodsi3
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	bl	sub_80EB72C
	lsl	r1, r4, #0x1
	add	r1, r1, r5
	add	r1, r1, r7
	strh	r0, [r1]
	add	r0, r4, #1
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	cmp	r4, #0x1
	bls	._9	@cond_branch
	lsl	r0, r6, #0x10
	lsr	r0, r0, #0x10
	cmp	r0, #0x4
	bls	._10	@cond_branch
	bl	Menu_EraseScreen
	bl	CloseMenu
	mov	r0, #0x1
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
._12:
	.align	2, 0
._11:
	.word	gSaveBlock1+0x2dd8

	thumb_func_end TayaDebugMenu_TrendR

	thumb_func_start debug_sub_8090880
debug_sub_8090880:
	push	{lr}
	bl	UpdatePaletteFade
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	._13	@cond_branch
	mov	r0, #0x0
	b	._14
._13:
	bl	sub_80E60D8
	mov	r0, #0x1
._14:
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_8090880

	thumb_func_start debug_sub_809089C
debug_sub_809089C:
	push	{lr}
	bl	Menu_ProcessInput
	lsl	r0, r0, #0x18
	asr	r1, r0, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r1, r0
	beq	._15	@cond_branch
	add	r0, r0, #0x1
	cmp	r1, r0
	bne	._16	@cond_branch
	bl	CloseMenu
	mov	r0, #0x1
	b	._17
._16:
	ldr	r2, ._19
	ldr	r0, ._19 + 4
	lsl	r1, r1, #0x3
	add	r0, r0, #0x4
	add	r1, r1, r0
	ldr	r0, [r1]
	strh	r0, [r2]
	ldrh	r0, [r2]
	sub	r0, r0, #0x5
	cmp	r0, #0x7
	bhi	._27	@cond_branch
	lsl	r0, r0, #0x2
	ldr	r1, ._19 + 8
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
._20:
	.align	2, 0
._19:
	.word	gSpecialVar_0x8004
	.word	gUnknown_Debug_083C4EC0
	.word	._21
._21:
	.word	._29
	.word	._27
	.word	._29
	.word	._29
	.word	._27
	.word	._27
	.word	._29
	.word	._29
._29:
	ldr	r0, ._30
	mov	r1, #0x0
	strh	r1, [r0]
	ldr	r0, ._30 + 4
	strh	r1, [r0]
._27:
	mov	r0, #0x1
	mov	r1, #0x0
	bl	FadeScreen
	ldr	r1, ._30 + 8
	ldr	r0, ._30 + 12
	str	r0, [r1]
._15:
	mov	r0, #0x0
._17:
	pop	{r1}
	bx	r1
._31:
	.align	2, 0
._30:
	.word	gSpecialVar_0x8005
	.word	gSpecialVar_0x8006
	.word	gMenuCallback
	.word	debug_sub_8090880+1

	thumb_func_end debug_sub_809089C

	thumb_func_start TayaDebugMenu_SimpleText
TayaDebugMenu_SimpleText:
	push	{lr}
	add	sp, sp, #0xfffffff8
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0xc
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._32
	mov	r0, #0x1
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0xb
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._32 + 4
	ldr	r0, ._32 + 8
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._33:
	.align	2, 0
._32:
	.word	gUnknown_Debug_083C4EC0
	.word	gMenuCallback
	.word	debug_sub_809089C+1

	thumb_func_end TayaDebugMenu_SimpleText

	thumb_func_start debug_sub_8090984
debug_sub_8090984:
	push	{r4, r5, r6, r7, lr}
	bl	Menu_ProcessInput
	lsl	r2, r0, #0x18
	asr	r1, r2, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r1, r0
	beq	._34	@cond_branch
	add	r0, r0, #0x1
	cmp	r1, r0
	beq	._46	@cond_branch
	cmp	r1, #0x4
	bgt	._36	@cond_branch
	lsr	r0, r2, #0x18
	bl	debug_sub_810B32C
	b	._46
._34:
	mov	r0, #0x0
	b	._38
._36:
	cmp	r1, #0x5
	bne	._39	@cond_branch
	bl	sub_80F7F30
	b	._46
._39:
	cmp	r1, #0x6
	bne	._41	@cond_branch
	mov	r4, #0x0
	ldr	r0, ._44
	add	r1, r0, #2
	mov	ip, r1
	ldr	r7, ._44 + 4
	ldr	r1, ._44 + 8
	add	r6, r0, r1
	add	r5, r0, #0
	add	r5, r5, #0xe
._42:
	lsl	r1, r4, #0x1
	mov	r0, ip
	add	r3, r1, r0
	add	r0, r1, r7
	ldrh	r2, [r0]
	strh	r2, [r3]
	add	r0, r1, r5
	strh	r2, [r0]
	add	r1, r6, r1
	strh	r2, [r1]
	add	r0, r4, #1
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	cmp	r4, #0x2
	bls	._42	@cond_branch
	b	._46
._45:
	.align	2, 0
._44:
	.word	gSaveBlock1+0x2d94
	.word	gUnknown_Debug_083C4F08
	.word	0xfffffd94
._41:
	cmp	r1, #0x7
	bne	._46	@cond_branch
	mov	r4, #0x0
._47:
	lsl	r0, r4, #0x18
	lsr	r0, r0, #0x18
	bl	sub_80EB890
	add	r0, r4, #1
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	cmp	r4, #0x20
	bls	._47	@cond_branch
._46:
	bl	CloseMenu
	mov	r0, #0x1
._38:
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_8090984

	thumb_func_start TayaDebugMenu_OldMan
TayaDebugMenu_OldMan:
	push	{lr}
	add	sp, sp, #0xfffffff8
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0xa
	mov	r3, #0x11
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._48
	mov	r0, #0x1
	mov	r1, #0x1
	mov	r2, #0x8
	bl	Menu_PrintItems
	bl	GetCurrentMauvilleOldMan
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	str	r0, [sp]
	mov	r0, #0x9
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x8
	bl	InitMenu
	ldr	r1, ._48 + 4
	ldr	r0, ._48 + 8
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._49:
	.align	2, 0
._48:
	.word	gUnknown_Debug_083C4F54
	.word	gMenuCallback
	.word	debug_sub_8090984+1

	thumb_func_end TayaDebugMenu_OldMan

	thumb_func_start TayaDebugMenu_LanettesPC
TayaDebugMenu_LanettesPC:
	push	{lr}
	bl	Menu_EraseScreen
	bl	ShowPokemonStorageSystem
	mov	r0, #0x1
	pop	{r1}
	bx	r1

	thumb_func_end TayaDebugMenu_LanettesPC

	thumb_func_start TayaDebugMenu_TownFlags
TayaDebugMenu_TownFlags:
	push	{lr}
	ldr	r0, ._50
	bl	FlagSet
	mov	r0, #0x81
	lsl	r0, r0, #0x4
	bl	FlagSet
	ldr	r0, ._50 + 4
	bl	FlagSet
	ldr	r0, ._50 + 8
	bl	FlagSet
	ldr	r0, ._50 + 12
	bl	FlagSet
	ldr	r0, ._50 + 16
	bl	FlagSet
	ldr	r0, ._50 + 20
	bl	FlagSet
	ldr	r0, ._50 + 24
	bl	FlagSet
	ldr	r0, ._50 + 28
	bl	FlagSet
	ldr	r0, ._50 + 32
	bl	FlagSet
	ldr	r0, ._50 + 36
	bl	FlagSet
	ldr	r0, ._50 + 40
	bl	FlagSet
	ldr	r0, ._50 + 44
	bl	FlagSet
	ldr	r0, ._50 + 48
	bl	FlagSet
	ldr	r0, ._50 + 52
	bl	FlagSet
	ldr	r0, ._50 + 56
	bl	FlagSet
	ldr	r0, ._50 + 60
	bl	FlagSet
	ldr	r0, ._50 + 64
	bl	FlagSet
	ldr	r0, ._50 + 68
	bl	FlagSet
	ldr	r0, ._50 + 72
	bl	FlagSet
	ldr	r0, ._50 + 76
	bl	FlagSet
	ldr	r0, ._50 + 80
	bl	FlagSet
	ldr	r0, ._50 + 84
	bl	FlagSet
	ldr	r0, ._50 + 88
	bl	FlagSet
	ldr	r0, ._50 + 92
	bl	FlagSet
	ldr	r0, ._50 + 96
	bl	FlagSet
	ldr	r0, ._50 + 100
	bl	FlagSet
	ldr	r0, ._50 + 104
	bl	FlagSet
	ldr	r0, ._50 + 108
	bl	FlagSet
	ldr	r0, ._50 + 112
	bl	FlagSet
	ldr	r0, ._50 + 116
	bl	FlagSet
	ldr	r0, ._50 + 120
	bl	FlagSet
	mov	r0, #0x84
	lsl	r0, r0, #0x4
	bl	FlagSet
	ldr	r0, ._50 + 124
	bl	FlagSet
	ldr	r0, ._50 + 128
	bl	FlagSet
	ldr	r0, ._50 + 132
	bl	FlagSet
	ldr	r0, ._50 + 136
	bl	FlagSet
	ldr	r0, ._50 + 140
	bl	FlagSet
	ldr	r0, ._50 + 144
	bl	FlagSet
	ldr	r0, ._50 + 148
	bl	FlagSet
	ldr	r0, ._50 + 152
	bl	FlagSet
	bl	CloseMenu
	mov	r0, #0x1
	pop	{r1}
	bx	r1
._51:
	.align	2, 0
._50:
	.word	0x80f
	.word	0x811
	.word	0x812
	.word	0x813
	.word	0x814
	.word	0x815
	.word	0x816
	.word	0x817
	.word	0x818
	.word	0x819
	.word	0x81a
	.word	0x81b
	.word	0x81c
	.word	0x81d
	.word	0x81e
	.word	0x848
	.word	0x849
	.word	0x84a
	.word	0x854
	.word	0x855
	.word	0x856
	.word	0x857
	.word	0x858
	.word	0x859
	.word	0x85a
	.word	0x85b
	.word	0x85c
	.word	0x83c
	.word	0x83d
	.word	0x83e
	.word	0x83f
	.word	0x841
	.word	0x842
	.word	0x843
	.word	0x844
	.word	0x845
	.word	0x846
	.word	0x847
	.word	0x83b

	thumb_func_end TayaDebugMenu_TownFlags

	thumb_func_start TayaDebugMenu_AwardARibbon
TayaDebugMenu_AwardARibbon:
	push	{lr}
	mov	r0, #0x1
	neg	r0, r0
	mov	r1, #0x10
	mov	r2, #0x0
	bl	BlendPalettes
	ldr	r0, ._52
	bl	SetMainCallback2
	bl	CloseMenu
	mov	r0, #0x1
	pop	{r1}
	bx	r1
._53:
	.align	2, 0
._52:
	.word	debug_sub_80915BC+1

	thumb_func_end TayaDebugMenu_AwardARibbon

	thumb_func_start debug_sub_8090C44
debug_sub_8090C44:
	push	{r4, r5, lr}
	ldr	r4, ._54
	sub	r5, r4, #1
	ldrh	r1, [r5, #0x8]
	add	r0, r4, #0
	mov	r2, #0x2
	mov	r3, #0x5
	bl	ConvertIntToDecimalStringN
	add	r0, r4, #0
	mov	r1, #0x1
	mov	r2, #0x1
	bl	Menu_PrintText
	add	r0, r4, #0
	mov	r1, #0x0
	mov	r2, #0x5
	bl	StringFill
	ldrb	r0, [r5]
	add	r0, r0, r4
	mov	r1, #0x79
	strb	r1, [r0]
	add	r0, r4, #0
	mov	r1, #0x1
	mov	r2, #0x3
	bl	Menu_PrintText
	pop	{r4, r5}
	pop	{r0}
	bx	r0
._55:
	.align	2, 0
._54:
	.word	gSharedMem+1

	thumb_func_end debug_sub_8090C44

	thumb_func_start debug_sub_8090C88
debug_sub_8090C88:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xfffffffc
	mov	r0, #0x1
	mov	r8, r0
	ldr	r2, ._59
	ldrh	r1, [r2, #0x2e]
	mov	r0, #0x20
	and	r0, r0, r1
	add	r3, r2, #0
	cmp	r0, #0
	beq	._57	@cond_branch
	ldr	r1, ._59 + 4
	ldrb	r0, [r1]
	cmp	r0, #0
	beq	._57	@cond_branch
	sub	r0, r0, #0x1
	strb	r0, [r1]
	b	._62
._60:
	.align	2, 0
._59:
	.word	gMain
	.word	gSharedMem
._67:
	add	r0, r0, #0x1
	strb	r0, [r1]
	b	._62
._77:
	strh	r1, [r7, #0x8]
	b	._62
._79:
	ldr	r0, ._64
	ldrh	r0, [r0, #0x8]
	bl	SetLotteryNumber16_Unused
._78:
	bl	CloseMenu
	mov	r0, #0x1
	b	._63
._65:
	.align	2, 0
._64:
	.word	gSharedMem
._57:
	ldrh	r1, [r3, #0x2e]
	mov	r0, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	._66	@cond_branch
	ldr	r1, ._81
	ldrb	r0, [r1]
	cmp	r0, #0x3
	bls	._67	@cond_branch
._66:
	ldrh	r1, [r3, #0x30]
	mov	r0, #0x40
	and	r0, r0, r1
	cmp	r0, #0
	beq	._68	@cond_branch
	ldr	r0, ._81
	ldrh	r1, [r0, #0x8]
	str	r1, [r0, #0xc]
	ldr	r1, ._81 + 4
	strh	r1, [r0, #0x10]
	mov	r4, #0x0
	ldrb	r1, [r0]
	add	r7, r0, #0
	cmp	r4, r1
	bcs	._69	@cond_branch
	add	r5, r7, #0
	add	r6, r1, #0
._70:
	ldrh	r0, [r5, #0x10]
	mov	r1, #0xa
	str	r3, [sp]
	bl	__udivsi3
	strh	r0, [r5, #0x10]
	add	r0, r4, #1
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	ldr	r3, [sp]
	cmp	r4, r6
	bcc	._70	@cond_branch
._69:
	ldrh	r1, [r7, #0x10]
	ldr	r0, [r7, #0xc]
	add	r0, r0, r1
	str	r0, [r7, #0xc]
	ldr	r1, ._81 + 8
	cmp	r0, r1
	ble	._71	@cond_branch
	str	r1, [r7, #0xc]
._71:
	ldrh	r0, [r7, #0x8]
	ldr	r1, [r7, #0xc]
	cmp	r0, r1
	bne	._77	@cond_branch
._68:
	ldrh	r1, [r3, #0x30]
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	beq	._73	@cond_branch
	ldr	r0, ._81
	ldrh	r1, [r0, #0x8]
	str	r1, [r0, #0xc]
	ldr	r1, ._81 + 4
	strh	r1, [r0, #0x10]
	mov	r4, #0x0
	ldrb	r1, [r0]
	add	r7, r0, #0
	cmp	r4, r1
	bcs	._74	@cond_branch
	add	r5, r7, #0
	add	r6, r1, #0
._75:
	ldrh	r0, [r5, #0x10]
	mov	r1, #0xa
	str	r3, [sp]
	bl	__udivsi3
	strh	r0, [r5, #0x10]
	add	r0, r4, #1
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	ldr	r3, [sp]
	cmp	r4, r6
	bcc	._75	@cond_branch
._74:
	add	r2, r7, #0
	ldrh	r1, [r2, #0x10]
	ldr	r0, [r2, #0xc]
	sub	r0, r0, r1
	str	r0, [r2, #0xc]
	cmp	r0, #0
	bge	._76	@cond_branch
	mov	r0, #0x0
	str	r0, [r2, #0xc]
._76:
	ldrh	r0, [r2, #0x8]
	ldr	r1, [r2, #0xc]
	cmp	r0, r1
	bne	._77	@cond_branch
._73:
	ldrh	r2, [r3, #0x2e]
	mov	r0, #0x2
	and	r0, r0, r2
	cmp	r0, #0
	bne	._78	@cond_branch
	mov	r0, #0x1
	and	r0, r0, r2
	cmp	r0, #0
	bne	._79	@cond_branch
	mov	r0, #0x0
	mov	r8, r0
._62:
	mov	r0, r8
	cmp	r0, #0
	beq	._80	@cond_branch
	bl	debug_sub_8090C44
._80:
	mov	r0, #0x0
._63:
	add	sp, sp, #0x4
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
._82:
	.align	2, 0
._81:
	.word	gSharedMem
	.word	0x2710
	.word	0xffff

	thumb_func_end debug_sub_8090C88

	thumb_func_start TayaDebugMenu_PKMNLottery
TayaDebugMenu_PKMNLottery:
	push	{lr}
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x6
	mov	r3, #0x5
	bl	Menu_DrawStdWindowFrame
	bl	RetrieveLotteryNumber
	ldr	r2, ._83
	ldr	r0, ._83 + 4
	ldrh	r0, [r0]
	mov	r1, #0x0
	strh	r0, [r2, #0x8]
	strb	r1, [r2]
	bl	debug_sub_8090C44
	ldr	r1, ._83 + 8
	ldr	r0, ._83 + 12
	str	r0, [r1]
	mov	r0, #0x0
	pop	{r1}
	bx	r1
._84:
	.align	2, 0
._83:
	.word	gSharedMem
	.word	gSpecialVar_Result
	.word	gMenuCallback
	.word	debug_sub_8090C88+1

	thumb_func_end TayaDebugMenu_PKMNLottery

	thumb_func_start TayaDebugMenu_Trainer
TayaDebugMenu_Trainer:
	push	{r4, r5, lr}
	mov	r4, #0x0
	ldr	r5, ._86
._85:
	lsl	r0, r4, #0x4
	add	r0, r0, r5
	ldrh	r0, [r0]
	bl	SetTrainerFlag
	add	r0, r4, #1
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	cmp	r4, #0x37
	bls	._85	@cond_branch
	ldr	r0, ._86 + 4
	bl	SetTrainerFlag
	mov	r0, #0x85
	lsl	r0, r0, #0x1
	bl	SetTrainerFlag
	ldr	r0, ._86 + 8
	bl	SetTrainerFlag
	mov	r0, #0x86
	lsl	r0, r0, #0x1
	bl	SetTrainerFlag
	ldr	r0, ._86 + 12
	bl	SetTrainerFlag
	mov	r0, #0x87
	lsl	r0, r0, #0x1
	bl	SetTrainerFlag
	ldr	r0, ._86 + 16
	bl	SetTrainerFlag
	mov	r0, #0x88
	lsl	r0, r0, #0x1
	bl	SetTrainerFlag
	ldr	r0, ._86 + 20
	bl	SetTrainerFlag
	mov	r0, #0x83
	lsl	r0, r0, #0x1
	bl	SetTrainerFlag
	ldr	r0, ._86 + 24
	bl	SetTrainerFlag
	mov	r0, #0x84
	lsl	r0, r0, #0x1
	bl	SetTrainerFlag
	ldr	r0, ._86 + 28
	bl	SetTrainerFlag
	bl	CloseMenu
	mov	r0, #0x1
	pop	{r4, r5}
	pop	{r1}
	bx	r1
._87:
	.align	2, 0
._86:
	.word	gTrainerEyeTrainers
	.word	0x109
	.word	0x10b
	.word	0x10d
	.word	0x10f
	.word	0x105
	.word	0x107
	.word	0x14f

	thumb_func_end TayaDebugMenu_Trainer

	thumb_func_start TayaDebugMenu_PokenavD
TayaDebugMenu_PokenavD:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffe4
	bl	Menu_DisplayDialogueFrame
	mov	r0, #0x0
	mov	sl, r0
	mov	r6, #0x1
	mov	r7, #0xff
	mov	r1, #0x3
	mov	r9, r1
._93:
	ldr	r4, ._94
	add	r0, r4, #0
	ldr	r1, ._94 + 4
	bl	StringCopy
	mov	r5, sl
	add	r5, r5, #0x1
	add	r1, r5, r4
	mov	r0, #0xff
	strb	r0, [r1]
	add	r0, r4, #0
	mov	r1, #0x2
	mov	r2, #0xf
	bl	Menu_PrintText
	mov	r0, #0x0
	mov	r8, r0
	str	r5, [sp, #0x14]
	mov	r1, sl
	lsl	r1, r1, #0x2
	str	r1, [sp, #0x18]
._91:
	bl	Random
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	add	r0, r0, #0x1
	str	r0, [sp, #0x10]
	bl	Random
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r1, #0x64
	bl	__umodsi3
	add	r0, r0, #0x1
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	bl	Random
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r1, #0xc1
	lsl	r1, r1, #0x1
	bl	__umodsi3
	add	r0, r0, #0x1
	lsl	r0, r0, #0x10
	lsr	r3, r0, #0x10
	cmp	r3, #0xfb
	bls	._89	@cond_branch
	add	r0, r3, #0
	add	r0, r0, #0x19
	lsl	r0, r0, #0x10
	lsr	r3, r0, #0x10
	ldr	r0, ._94 + 8
	cmp	r3, r0
	bls	._89	@cond_branch
	mov	r3, #0x1
._89:
	ldr	r0, [sp, #0x18]
	add r0, r0, sl
	lsl	r4, r0, #0x4
	sub	r4, r4, r0
	lsl	r4, r4, #0x5
	mov	r1, r8
	lsl	r0, r1, #0x2
	add r0, r0, r8
	lsl	r0, r0, #0x4
	ldr	r1, ._94 + 12
	add	r0, r0, r1
	add	r4, r4, r0
	lsl	r2, r5, #0x18
	lsr	r2, r2, #0x18
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r6, [sp, #0x8]
	ldr	r0, [sp, #0x10]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	add	r1, r3, #0
	mov	r3, #0x20
	bl	CreateBoxMon
	bl	Random
	add	r1, r7, #0
	and	r1, r1, r0
	str	r1, [sp, #0x10]
	add	r0, r4, #0
	mov	r1, #0x16
	add	r2, sp, #0x10
	bl	SetBoxMonData
	bl	Random
	add	r1, r7, #0
	and	r1, r1, r0
	str	r1, [sp, #0x10]
	add	r0, r4, #0
	mov	r1, #0x17
	add	r2, sp, #0x10
	bl	SetBoxMonData
	bl	Random
	add	r1, r7, #0
	and	r1, r1, r0
	str	r1, [sp, #0x10]
	add	r0, r4, #0
	mov	r1, #0x18
	add	r2, sp, #0x10
	bl	SetBoxMonData
	bl	Random
	add	r1, r7, #0
	and	r1, r1, r0
	str	r1, [sp, #0x10]
	add	r0, r4, #0
	mov	r1, #0x21
	add	r2, sp, #0x10
	bl	SetBoxMonData
	bl	Random
	add	r1, r7, #0
	and	r1, r1, r0
	str	r1, [sp, #0x10]
	add	r0, r4, #0
	mov	r1, #0x2f
	add	r2, sp, #0x10
	bl	SetBoxMonData
	bl	Random
	add	r1, r7, #0
	and	r1, r1, r0
	str	r1, [sp, #0x10]
	add	r0, r4, #0
	mov	r1, #0x30
	add	r2, sp, #0x10
	bl	SetBoxMonData
	bl	Random
	mov	r1, r9
	and	r1, r1, r0
	add	r1, r1, #0x1
	str	r1, [sp, #0x10]
	add	r0, r4, #0
	mov	r1, #0x32
	add	r2, sp, #0x10
	bl	SetBoxMonData
	bl	Random
	mov	r1, r9
	and	r1, r1, r0
	add	r1, r1, #0x1
	str	r1, [sp, #0x10]
	add	r0, r4, #0
	mov	r1, #0x33
	add	r2, sp, #0x10
	bl	SetBoxMonData
	bl	Random
	mov	r1, r9
	and	r1, r1, r0
	add	r1, r1, #0x1
	str	r1, [sp, #0x10]
	add	r0, r4, #0
	mov	r1, #0x34
	add	r2, sp, #0x10
	bl	SetBoxMonData
	bl	Random
	mov	r1, r9
	and	r1, r1, r0
	add	r1, r1, #0x1
	str	r1, [sp, #0x10]
	add	r0, r4, #0
	mov	r1, #0x36
	add	r2, sp, #0x10
	bl	SetBoxMonData
	bl	Random
	mov	r1, r9
	and	r1, r1, r0
	add	r1, r1, #0x1
	str	r1, [sp, #0x10]
	add	r0, r4, #0
	mov	r1, #0x35
	add	r2, sp, #0x10
	bl	SetBoxMonData
	bl	Random
	add	r1, r6, #0
	and	r1, r1, r0
	str	r1, [sp, #0x10]
	add	r0, r4, #0
	mov	r1, #0x43
	add	r2, sp, #0x10
	bl	SetBoxMonData
	bl	Random
	add	r1, r6, #0
	and	r1, r1, r0
	str	r1, [sp, #0x10]
	add	r0, r4, #0
	mov	r1, #0x44
	add	r2, sp, #0x10
	bl	SetBoxMonData
	bl	Random
	add	r1, r6, #0
	and	r1, r1, r0
	str	r1, [sp, #0x10]
	add	r0, r4, #0
	mov	r1, #0x45
	add	r2, sp, #0x10
	bl	SetBoxMonData
	bl	Random
	add	r1, r6, #0
	and	r1, r1, r0
	str	r1, [sp, #0x10]
	add	r0, r4, #0
	mov	r1, #0x46
	add	r2, sp, #0x10
	bl	SetBoxMonData
	bl	Random
	add	r1, r6, #0
	and	r1, r1, r0
	str	r1, [sp, #0x10]
	add	r0, r4, #0
	mov	r1, #0x47
	add	r2, sp, #0x10
	bl	SetBoxMonData
	bl	Random
	add	r1, r6, #0
	and	r1, r1, r0
	str	r1, [sp, #0x10]
	add	r0, r4, #0
	mov	r1, #0x48
	add	r2, sp, #0x10
	bl	SetBoxMonData
	bl	Random
	add	r1, r6, #0
	and	r1, r1, r0
	str	r1, [sp, #0x10]
	add	r0, r4, #0
	mov	r1, #0x49
	add	r2, sp, #0x10
	bl	SetBoxMonData
	bl	Random
	add	r1, r6, #0
	and	r1, r1, r0
	str	r1, [sp, #0x10]
	add	r0, r4, #0
	mov	r1, #0x4a
	add	r2, sp, #0x10
	bl	SetBoxMonData
	bl	Random
	add	r1, r6, #0
	and	r1, r1, r0
	str	r1, [sp, #0x10]
	add	r0, r4, #0
	mov	r1, #0x4b
	add	r2, sp, #0x10
	bl	SetBoxMonData
	bl	Random
	add	r1, r6, #0
	and	r1, r1, r0
	str	r1, [sp, #0x10]
	add	r0, r4, #0
	mov	r1, #0x4c
	add	r2, sp, #0x10
	bl	SetBoxMonData
	bl	Random
	add	r1, r6, #0
	and	r1, r1, r0
	str	r1, [sp, #0x10]
	add	r0, r4, #0
	mov	r1, #0x4d
	add	r2, sp, #0x10
	bl	SetBoxMonData
	bl	Random
	add	r1, r6, #0
	and	r1, r1, r0
	str	r1, [sp, #0x10]
	add	r0, r4, #0
	mov	r1, #0x4e
	add	r2, sp, #0x10
	bl	SetBoxMonData
	mov	r0, r8
	add	r0, r0, #0x1
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r8, r0
	cmp	r0, #0x1d
	bhi	._90	@cond_branch
	b	._91
._90:
	ldr	r1, [sp, #0x14]
	lsl	r0, r1, #0x10
	lsr	r0, r0, #0x10
	mov	sl, r0
	cmp	r0, #0xd
	bhi	._92	@cond_branch
	b	._93
._92:
	bl	TayaDebugMenu_TownFlags
	bl	TayaDebugMenu_Trainer
	bl	CloseMenu
	mov	r0, #0x1
	add	sp, sp, #0x1c
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
._95:
	.align	2, 0
._94:
	.word	gSharedMem
	.word	gUnknown_Debug_083C4F94
	.word	0x19b
	.word	gPokemonStorage+0x4

	thumb_func_end TayaDebugMenu_PokenavD

	thumb_func_start TayaDebugMenu_8091190
TayaDebugMenu_8091190:
	push	{r4, r5, lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_ProcessInput
	lsl	r0, r0, #0x18
	asr	r3, r0, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r3, r0
	beq	._96	@cond_branch
	add	r0, r0, #0x1
	cmp	r3, r0
	beq	._97	@cond_branch
	ldr	r2, ._99
	ldr	r1, ._99 + 4
	ldr	r0, ._99 + 8
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, [r0]
	lsl	r0, r3, #0x3
	add	r0, r0, r1
	ldr	r0, [r0, #0x4]
	str	r0, [r2]
._106:
	mov	r0, #0x0
	b	._98
._100:
	.align	2, 0
._99:
	.word	gMenuCallback
	.word	gUnknown_Debug_83C5068
	.word	unk_2030224
._96:
	ldr	r3, ._107
	ldrb	r4, [r3]
	ldr	r2, ._107 + 4
	ldrh	r1, [r2, #0x2e]
	mov	r0, #0x20
	and	r0, r0, r1
	add	r5, r3, #0
	cmp	r0, #0
	beq	._102	@cond_branch
	sub	r0, r4, #1
	strb	r0, [r5]
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bge	._102	@cond_branch
	mov	r0, #0x1
	strb	r0, [r5]
._102:
	ldrh	r1, [r2, #0x2e]
	mov	r0, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	._104	@cond_branch
	ldrb	r0, [r5]
	add	r0, r0, #0x1
	strb	r0, [r5]
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1
	bls	._104	@cond_branch
	mov	r0, #0x0
	strb	r0, [r5]
._104:
	lsl	r0, r4, #0x18
	asr	r0, r0, #0x18
	mov	r1, #0x0
	ldrsb	r1, [r5, r1]
	cmp	r0, r1
	beq	._106	@cond_branch
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0xb
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r4, ._107 + 8
	mov	r0, #0x0
	ldrsb	r0, [r5, r0]
	lsl	r0, r0, #0x3
	add	r0, r0, r4
	ldrb	r2, [r0, #0x4]
	ldr	r3, [r0]
	mov	r0, #0x1
	mov	r1, #0x1
	bl	Menu_PrintItems
	mov	r0, #0x0
	ldrsb	r0, [r5, r0]
	lsl	r0, r0, #0x3
	add	r0, r0, r4
	ldrb	r3, [r0, #0x4]
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0xa
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	bl	InitMenu
	b	._106
._108:
	.align	2, 0
._107:
	.word	unk_2030224
	.word	gMain
	.word	gUnknown_Debug_83C5068
._97:
	bl	CloseMenu
	mov	r0, #0x1
._98:
	add	sp, sp, #0x8
	pop	{r4, r5}
	pop	{r1}
	bx	r1

	thumb_func_end TayaDebugMenu_8091190

	thumb_func_start InitTayaDebugWindow
InitTayaDebugWindow:
	push	{lr}
	add	sp, sp, #0xfffffff8
	ldr	r1, ._109
	mov	r0, #0x0
	strb	r0, [r1]
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0xb
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r0, ._109 + 4
	ldr	r3, [r0]
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
	ldr	r1, ._109 + 8
	ldr	r0, ._109 + 12
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._110:
	.align	2, 0
._109:
	.word	unk_2030224
	.word	gUnknown_Debug_83C5068
	.word	gMenuCallback
	.word	TayaDebugMenu_8091190+1

	thumb_func_end InitTayaDebugWindow

	thumb_func_start debug_sub_80912D8
debug_sub_80912D8:
	push	{lr}
	ldr	r0, ._113
	ldrb	r1, [r0, #0x7]
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	beq	._111	@cond_branch
	mov	r0, #0x0
	b	._112
._114:
	.align	2, 0
._113:
	.word	gPaletteFade
._111:
	ldr	r0, ._115
	bl	SetMainCallback2
	mov	r0, #0x1
._112:
	pop	{r1}
	bx	r1
._116:
	.align	2, 0
._115:
	.word	debug_sub_8110F28+1

	thumb_func_end debug_sub_80912D8

	thumb_func_start debug_sub_8091300
debug_sub_8091300:
	push	{lr}
	mov	r0, #0x1
	mov	r1, #0x0
	bl	FadeScreen
	ldr	r1, ._117
	ldr	r0, ._117 + 4
	str	r0, [r1]
	mov	r0, #0x0
	pop	{r1}
	bx	r1
._118:
	.align	2, 0
._117:
	.word	gMenuCallback
	.word	debug_sub_80912D8+1

	thumb_func_end debug_sub_8091300

	thumb_func_start debug_sub_8091320
debug_sub_8091320:
	push	{lr}
	bl	LoadOam
	bl	ProcessSpriteCopyRequests
	bl	TransferPlttBuffer
	pop	{r0}
	bx	r0

	thumb_func_end debug_sub_8091320

	thumb_func_start debug_sub_8091334
debug_sub_8091334:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	bl	AnimateSprites
	bl	BuildOamBuffer
	ldr	r3, ._123
	add	r0, r3, #0
	add	r0, r0, #0x52
	ldrb	r4, [r0]
	cmp	r4, #0
	beq	._119	@cond_branch
	cmp	r4, #0x1
	bne	._120	@cond_branch
	b	._121
._120:
	b	._162
._124:
	.align	2, 0
._123:
	.word	gSharedMem
._119:
	add	r5, r3, #0
	add	r5, r5, #0x55
	strb	r4, [r5]
	ldr	r2, ._131
	ldrh	r1, [r2, #0x2e]
	mov	r0, #0x40
	and	r0, r0, r1
	mov	r9, r2
	cmp	r0, #0
	beq	._126	@cond_branch
	add	r1, r3, #0
	add	r1, r1, #0x54
	ldrb	r0, [r1]
	cmp	r0, #0
	beq	._126	@cond_branch
	sub	r0, r0, #0x1
	strb	r0, [r1]
	mov	r0, #0x1
	strb	r0, [r5]
._126:
	mov	r0, r9
	ldrh	r1, [r0, #0x2e]
	mov	r0, #0x80
	and	r0, r0, r1
	ldr	r5, ._131 + 4
	cmp	r0, #0
	beq	._133	@cond_branch
	add	r0, r5, #0
	add	r0, r0, #0x53
	ldrb	r0, [r0]
	cmp	r0, #0x2
	beq	._128	@cond_branch
	add	r1, r5, #0
	add	r1, r1, #0x54
	ldrb	r0, [r1]
	cmp	r0, #0x4
	bhi	._133	@cond_branch
	b	._130
._132:
	.align	2, 0
._131:
	.word	gMain
	.word	gSharedMem
._128:
	add	r1, r5, #0
	add	r1, r1, #0x54
	ldrb	r0, [r1]
	cmp	r0, #0x3
	bhi	._133	@cond_branch
._130:
	add	r0, r0, #0x1
	strb	r0, [r1]
	add	r1, r1, #0x1
	mov	r0, #0x1
	strb	r0, [r1]
._133:
	mov	r2, r9
	ldrh	r1, [r2, #0x2e]
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	._135	@cond_branch
	add	r1, r5, #0
	add	r1, r1, #0x53
	ldrb	r0, [r1]
	cmp	r0, #0
	beq	._135	@cond_branch
	sub	r0, r0, #0x1
	strb	r0, [r1]
	add	r1, r1, #0x2
	mov	r0, #0x1
	strb	r0, [r1]
._135:
	mov	r3, r9
	ldrh	r1, [r3, #0x2e]
	mov	r0, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	._140	@cond_branch
	add	r0, r5, #0
	add	r0, r0, #0x54
	ldrb	r0, [r0]
	cmp	r0, #0x5
	beq	._137	@cond_branch
	add	r1, r5, #0
	add	r1, r1, #0x53
	ldrb	r0, [r1]
	cmp	r0, #0x1
	bhi	._140	@cond_branch
	b	._139
._137:
	add	r1, r5, #0
	add	r1, r1, #0x53
	ldrb	r0, [r1]
	cmp	r0, #0
	bne	._140	@cond_branch
._139:
	add	r0, r0, #0x1
	strb	r0, [r1]
	add	r1, r1, #0x2
	mov	r0, #0x1
	strb	r0, [r1]
._140:
	add	r0, r5, #0
	add	r0, r0, #0x55
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	._141	@cond_branch
	mov	r0, r9
	ldrh	r2, [r0, #0x2e]
	mov	r0, #0x1
	and	r0, r0, r2
	cmp	r0, #0
	beq	._142	@cond_branch
	ldr	r2, ._145
	add	r3, r5, #0
	add	r3, r3, #0x53
	add	r0, r5, #0
	add	r0, r0, #0x54
	ldrb	r1, [r0]
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	ldrb	r3, [r3]
	add	r0, r0, r3
	lsl	r0, r0, #0x3
	add	r0, r0, r2
	ldrh	r0, [r0, #0x4]
	sub	r0, r0, #0x32
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	cmp	r0, #0x4
	bhi	._143	@cond_branch
	add	r1, r5, #0
	add	r1, r1, #0x56
	mov	r0, #0x4
	b	._144
._146:
	.align	2, 0
._145:
	.word	gUnknown_Debug_083C50EC
._143:
	add	r1, r5, #0
	add	r1, r1, #0x56
	mov	r0, #0x1
._144:
	strb	r0, [r1]
	add	r1, r5, #0
	add	r1, r1, #0x52
	mov	r0, #0x1
	strb	r0, [r1]
	b	._162
._142:
	mov	r0, #0x2
	and	r0, r0, r2
	cmp	r0, #0
	bne	._148	@cond_branch
	b	._162
._148:
	mov	r0, #0x1
	neg	r0, r0
	mov	r1, #0x10
	mov	r2, #0x0
	bl	BlendPalettes
	ldr	r0, ._151
	bl	SetMainCallback2
	b	._162
._152:
	.align	2, 0
._151:
	.word	sub_80546F0+1
._121:
	add	r5, r3, #0
	add	r5, r5, #0x55
	mov	r0, #0x0
	strb	r0, [r5]
	ldr	r2, ._159
	ldrh	r1, [r2, #0x2e]
	mov	r0, #0x40
	and	r0, r0, r1
	mov	r9, r2
	cmp	r0, #0
	beq	._154	@cond_branch
	add	r2, r3, #0
	add	r2, r2, #0x53
	add	r0, r3, #0
	add	r0, r0, #0x54
	ldrb	r1, [r0]
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	ldrb	r2, [r2]
	add	r0, r0, r2
	add	r2, r0, r3
	add	r0, r3, #0
	add	r0, r0, #0x56
	ldrb	r1, [r2]
	ldrb	r0, [r0]
	cmp	r1, r0
	bcs	._154	@cond_branch
	add	r0, r1, #1
	strb	r0, [r2]
	strb	r4, [r5]
._154:
	mov	r2, r9
	ldrh	r1, [r2, #0x2e]
	mov	r0, #0x80
	and	r0, r0, r1
	ldr	r5, ._159 + 4
	cmp	r0, #0
	beq	._156	@cond_branch
	add	r2, r5, #0
	add	r2, r2, #0x53
	add	r0, r5, #0
	add	r0, r0, #0x54
	ldrb	r1, [r0]
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	ldrb	r2, [r2]
	add	r0, r0, r2
	add	r1, r0, r5
	ldrb	r0, [r1]
	cmp	r0, #0
	beq	._156	@cond_branch
	sub	r0, r0, #0x1
	strb	r0, [r1]
	add	r1, r5, #0
	add	r1, r1, #0x55
	mov	r0, #0x1
	strb	r0, [r1]
._156:
	add	r6, r5, #0
	add	r0, r6, #0
	add	r0, r0, #0x55
	ldrb	r7, [r0]
	cmp	r7, #0
	beq	._157	@cond_branch
._141:
	bl	debug_sub_80916AC
	b	._162
._160:
	.align	2, 0
._159:
	.word	gMain
	.word	gSharedMem
._157:
	mov	r3, r9
	ldrh	r1, [r3, #0x2e]
	mov	r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	._161	@cond_branch
	ldr	r0, ._164
	ldr	r1, ._164 + 4
	mov	ip, r1
	mov	r2, #0x53
	add	r2, r2, r6
	mov	r8, r2
	add	r4, r6, #0
	add	r4, r4, #0x54
	ldrb	r2, [r4]
	lsl	r1, r2, #0x1
	add	r1, r1, r2
	mov	r3, r8
	ldrb	r3, [r3]
	add	r1, r1, r3
	lsl	r1, r1, #0x3
	add r1, r1, ip
	ldrh	r1, [r1, #0x4]
	bl	GetMonData
	ldrb	r2, [r4]
	lsl	r1, r2, #0x1
	add	r1, r1, r2
	mov	r2, r8
	ldrb	r2, [r2]
	add	r1, r1, r2
	add	r1, r1, r6
	strb	r0, [r1]
	bl	debug_sub_80916AC
	add	r0, r6, #0
	add	r0, r0, #0x52
	strb	r7, [r0]
._161:
	mov	r3, r9
	ldrh	r1, [r3, #0x2e]
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._162	@cond_branch
	ldr	r2, ._164 + 4
	add	r0, r6, #0
	add	r0, r0, #0x53
	ldrb	r4, [r0]
	add	r0, r0, #0x1
	ldrb	r1, [r0]
	lsl	r0, r1, #0x1
	add	r3, r0, r1
	add	r0, r3, r4
	lsl	r0, r0, #0x3
	add	r1, r0, r2
	ldrh	r0, [r1, #0x4]
	cmp	r0, #0
	beq	._163	@cond_branch
	ldr	r0, ._164
	ldrh	r1, [r1, #0x4]
	add	r2, r4, r6
	add	r2, r3, r2
	bl	SetMonData
._163:
	add	r0, r5, #0
	add	r0, r0, #0x52
	strb	r7, [r0]
._162:
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._165:
	.align	2, 0
._164:
	.word	gPlayerParty
	.word	gUnknown_Debug_083C50EC

	thumb_func_end debug_sub_8091334

	thumb_func_start debug_sub_80915BC
debug_sub_80915BC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	ldr	r0, ._168
	mov	r1, #0x0
	strh	r1, [r0]
	add	r0, r0, #0x2
	strh	r1, [r0]
	mov	r1, #0x0
	ldr	r0, ._168 + 4
	mov	r8, r0
	ldr	r7, ._168 + 8
._171:
	mov	r4, #0x0
	lsl	r0, r1, #0x1
	add	r6, r1, #1
	add	r5, r0, r1
._170:
	add	r0, r5, r4
	lsl	r0, r0, #0x3
	add r0, r0, r8
	ldrh	r1, [r0, #0x4]
	cmp	r1, #0
	beq	._166	@cond_branch
	ldr	r0, ._168 + 12
	bl	GetMonData
	add	r1, r4, r5
	add	r1, r1, r7
	strb	r0, [r1]
	b	._167
._169:
	.align	2, 0
._168:
	.word	0x4000010
	.word	gUnknown_Debug_083C50EC
	.word	gSharedMem
	.word	gPlayerParty
._166:
	add	r0, r4, r5
	add	r0, r0, r7
	strb	r1, [r0]
._167:
	add	r0, r4, #1
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	cmp	r4, #0x2
	bls	._170	@cond_branch
	lsl	r0, r6, #0x18
	lsr	r1, r0, #0x18
	cmp	r1, #0x5
	bls	._171	@cond_branch
	ldr	r4, ._172
	add	r0, r4, #0
	bl	Text_LoadWindowTemplate
	add	r0, r4, #0
	bl	InitMenuWindow
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x3
	bl	Menu_DrawStdWindowFrame
	ldr	r0, ._172 + 4
	mov	r1, #0x1
	mov	r2, #0x1
	bl	Menu_PrintText
	mov	r0, #0x0
	mov	r1, #0x4
	mov	r2, #0x1d
	mov	r3, #0x11
	bl	Menu_DrawStdWindowFrame
	mov	r0, #0x0
	mov	r1, #0x12
	mov	r2, #0x1d
	mov	r3, #0x15
	bl	Menu_DrawStdWindowFrame
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	mov	r2, #0x8a
	lsl	r2, r2, #0x5
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r2, ._172 + 8
	add	r0, r2, #0
	add	r0, r0, #0x53
	mov	r1, #0x0
	strb	r1, [r0]
	add	r0, r0, #0x1
	strb	r1, [r0]
	sub	r0, r0, #0x2
	strb	r1, [r0]
	bl	debug_sub_80916AC
	ldr	r0, ._172 + 12
	bl	SetVBlankCallback
	ldr	r0, ._172 + 16
	bl	SetMainCallback2
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._173:
	.align	2, 0
._172:
	.word	gWindowTemplate_81E7224
	.word	gUnknown_Debug_083C517C
	.word	gSharedMem
	.word	debug_sub_8091320+1
	.word	debug_sub_8091334+1

	thumb_func_end debug_sub_80915BC

	thumb_func_start debug_sub_80916AC
debug_sub_80916AC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffffc
	mov	r6, #0x0
	ldr	r0, ._177
	mov	sl, r0
	mov	r1, #0x0
	mov	r8, r1
._182:
	ldr	r2, ._177 + 4
	mov	r5, #0x0
	lsl	r0, r6, #0x1
	mov	r9, r0
	add	r1, r6, #1
	str	r1, [sp]
._181:
	mov	r0, sl
	add	r0, r0, #0x53
	ldrb	r0, [r0]
	cmp	r0, r5
	bne	._175	@cond_branch
	ldr	r1, ._177 + 8
	ldrb	r0, [r1]
	cmp	r0, r6
	bne	._175	@cond_branch
	mov	r0, #0xef
	b	._176
._178:
	.align	2, 0
._177:
	.word	gSharedMem
	.word	gSharedMem+0x12
	.word	gSharedMem+0x54
._175:
	mov	r0, r8
	strb	r0, [r2]
	add	r2, r2, #0x1
._176:
	strb	r0, [r2]
	add	r2, r2, #0x1
	mov	r1, r9
	add	r4, r1, r6
	add	r0, r4, r5
	lsl	r0, r0, #0x3
	ldr	r1, ._183
	add	r0, r0, r1
	ldr	r1, [r0]
	add	r0, r2, #0
	bl	StringCopy
	add	r2, r0, #0
	mov	r0, r8
	strb	r0, [r2]
	add	r2, r2, #0x1
	ldr	r7, ._183 + 4
	add	r4, r5, r4
	add	r4, r4, r7
	ldrb	r1, [r4]
	add	r0, r2, #0
	mov	r2, #0x0
	mov	r3, #0x1
	bl	ConvertIntToDecimalStringN
	add	r2, r0, #0
	mov	r1, r8
	strb	r1, [r2]
	add	r2, r2, #0x1
	add	r0, r5, #1
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	cmp	r5, #0x2
	bhi	._179	@cond_branch
	cmp	r6, #0x5
	bne	._181	@cond_branch
	cmp	r5, #0x2
	bne	._181	@cond_branch
._179:
	sub	r1, r2, #1
	mov	r0, #0xff
	strb	r0, [r1]
	mov	r2, r9
	add	r2, r2, #0x5
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	add	r0, r7, #0
	add	r0, r0, #0x12
	mov	r1, #0x1
	bl	Menu_PrintText
	ldr	r1, [sp]
	lsl	r0, r1, #0x18
	lsr	r6, r0, #0x18
	cmp	r6, #0x5
	bls	._182	@cond_branch
	add	sp, sp, #0x4
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._184:
	.align	2, 0
._183:
	.word	gUnknown_Debug_083C50EC
	.word	gSharedMem

	thumb_func_end debug_sub_80916AC

	.align 2, 0

.endif
