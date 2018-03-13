.if DEBUG

	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	thumb_func_start debug_sub_808E90C
debug_sub_808E90C:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x18
	mov	r3, #0x5
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._535       @ gUnknown_Debug_083C35C4
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x2
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x17
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x2
	bl	InitMenu
	ldr	r1, ._535 + 4   @ gMenuCallback
	ldr	r0, ._535 + 8   @ debug_sub_808E95C
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._536:
	.align	2, 0
._535:
	.word	gUnknown_Debug_083C35C4
	.word	gMenuCallback
	.word	debug_sub_808E95C+1

	thumb_func_end debug_sub_808E90C

	thumb_func_start debug_sub_808E95C
debug_sub_808E95C:
	push	{lr}
	bl	Menu_ProcessInput
	lsl	r0, r0, #0x18
	asr	r1, r0, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r1, r0
	bne	._537	@cond_branch
	mov	r0, #0x0
	b	._540
._537:
	mov	r0, #0x1
	neg	r0, r0
	cmp	r1, r0
	beq	._539	@cond_branch
	ldr	r2, ._541       @ gMenuCallback
	ldr	r0, ._541 + 4   @ gUnknown_Debug_083C35C4
	lsl	r1, r1, #0x3
	add	r0, r0, #0x4
	add	r1, r1, r0
	ldr	r0, [r1]
	str	r0, [r2]
	mov	r0, #0x0
	b	._540
._542:
	.align	2, 0
._541:
	.word	gMenuCallback
	.word	gUnknown_Debug_083C35C4
._539:
	bl	CloseMenu
	mov	r0, #0x1
._540:
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808E95C

	thumb_func_start debug_sub_808E9A0
debug_sub_808E9A0:
	push	{r4, lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._543       @ gUnknown_Debug_083C369C
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r4, #0x0
	str	r4, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r0, ._543 + 4   @ gDebug_0300070F
	strb	r4, [r0]
	ldr	r1, ._543 + 8   @ gMenuCallback
	ldr	r0, ._543 + 12  @ debug_sub_808EA50
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r4}
	pop	{r1}
	bx	r1
._544:
	.align	2, 0
._543:
	.word	gUnknown_Debug_083C369C
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808EA50+1

	thumb_func_end debug_sub_808E9A0

	thumb_func_start debug_sub_808E9F8
debug_sub_808E9F8:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0xf
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._545       @ gUnknown_Debug_083C36E4
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x7
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x7
	bl	InitMenu
	ldr	r1, ._545 + 4   @ gDebug_0300070F
	mov	r0, #0x1
	strb	r0, [r1]
	ldr	r1, ._545 + 8   @ gMenuCallback
	ldr	r0, ._545 + 12  @ debug_sub_808EA50
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._546:
	.align	2, 0
._545:
	.word	gUnknown_Debug_083C36E4
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808EA50+1

	thumb_func_end debug_sub_808E9F8

	thumb_func_start debug_sub_808EA50
debug_sub_808EA50:
	push	{r4, r5, lr}
	bl	Menu_ProcessInput
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	bl	Menu_GetCursorPos
	add	r1, r0, #0
	ldr	r5, ._550       @ gDebug_0300070F
	ldrb	r0, [r5]
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	bl	debug_sub_808EAFC
	ldrb	r0, [r5]
	bl	debug_sub_808EA9C
	lsl	r4, r4, #0x18
	asr	r4, r4, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r4, r0
	beq	._547	@cond_branch
	mov	r0, #0x1
	neg	r0, r0
	cmp	r4, r0
	beq	._548	@cond_branch
._547:
	mov	r0, #0x0
	b	._549
._551:
	.align	2, 0
._550:
	.word	gDebug_0300070F
._548:
	bl	CloseMenu
	mov	r0, #0x1
._549:
	pop	{r4, r5}
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808EA50

	thumb_func_start debug_sub_808EA9C
debug_sub_808EA9C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	mov	r5, #0x0
	ldr	r0, ._554       @ gUnknown_Debug_083C371C
	add	r0, r1, r0
	ldrb	r2, [r0]
	cmp	r5, r2
	bcs	._552	@cond_branch
	ldr	r0, ._554 + 4   @ gUnknown_Debug_083C371E
	mov	r8, r0
	lsl	r0, r1, #0x3
	add	r0, r0, r1
	lsl	r7, r0, #0x1
	add	r6, r2, #0
._553:
	lsl	r0, r5, #0x1
	add	r4, r0, #1
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	add	r0, r0, r7
	add r0, r0, r8
	ldrh	r0, [r0]
	bl	VarGet
	add	r2, r0, #0
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	mov	r0, #0x18
	add	r1, r4, #0
	bl	debug_sub_808F31C
	add	r0, r5, #1
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	cmp	r5, r6
	bcc	._553	@cond_branch
._552:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._555:
	.align	2, 0
._554:
	.word	gUnknown_Debug_083C371C
	.word	gUnknown_Debug_083C371E

	thumb_func_end debug_sub_808EA9C

	thumb_func_start debug_sub_808EAFC
debug_sub_808EAFC:
	push	{r4, r5, lr}
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	lsl	r1, r1, #0x18
	lsr	r3, r1, #0x18
	ldr	r0, ._558       @ gMain
	ldrh	r1, [r0, #0x2e]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._556	@cond_branch
	mov	r5, #0x1
	b	._557
._559:
	.align	2, 0
._558:
	.word	gMain
._556:
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	._560	@cond_branch
	ldr	r5, ._561       @ 0xffff
._557:
	ldr	r1, ._561 + 4   @ gUnknown_Debug_083C371E
	lsl	r0, r2, #0x3
	add	r0, r0, r2
	add	r0, r0, r3
	lsl	r0, r0, #0x1
	add	r0, r0, r1
	ldrh	r4, [r0]
	add	r0, r4, #0
	bl	VarGet
	add	r1, r0, #0
	add	r1, r5, r1
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	add	r0, r4, #0
	bl	VarSet
._560:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
._562:
	.align	2, 0
._561:
	.word	0xffff
	.word	gUnknown_Debug_083C371E

	thumb_func_end debug_sub_808EAFC

	thumb_func_start debug_sub_808EB58
debug_sub_808EB58:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0xc
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r0, ._563       @ gUnknown_Debug_083C47B2
	mov	r1, #0x1
	mov	r2, #0x1
	bl	Menu_PrintText
	ldr	r3, ._563 + 4   @ gUnknown_Debug_083C47F0
	mov	r0, #0x2
	mov	r1, #0x3
	mov	r2, #0x8
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0xb
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x3
	mov	r3, #0x8
	bl	InitMenu
	ldr	r1, ._563 + 8   @ gMenuCallback
	ldr	r0, ._563 + 12  @ debug_sub_808EC10
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._564:
	.align	2, 0
._563:
	.word	gUnknown_Debug_083C47B2
	.word	gUnknown_Debug_083C47F0
	.word	gMenuCallback
	.word	debug_sub_808EC10+1

	thumb_func_end debug_sub_808EB58

	thumb_func_start debug_sub_808EBB4
debug_sub_808EBB4:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0xd
	mov	r3, #0xd
	bl	Menu_DrawStdWindowFrame
	ldr	r0, ._565       @ gUnknown_Debug_083C4830
	mov	r1, #0x1
	mov	r2, #0x1
	bl	Menu_PrintText
	ldr	r3, ._565 + 4   @ gUnknown_Debug_083C4888
	mov	r0, #0x2
	mov	r1, #0x3
	mov	r2, #0x5
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0xc
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x3
	mov	r3, #0x5
	bl	InitMenu
	ldr	r1, ._565 + 8   @ gMenuCallback
	ldr	r0, ._565 + 12  @ debug_sub_808EC5C
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._566:
	.align	2, 0
._565:
	.word	gUnknown_Debug_083C4830
	.word	gUnknown_Debug_083C4888
	.word	gMenuCallback
	.word	debug_sub_808EC5C+1

	thumb_func_end debug_sub_808EBB4

	thumb_func_start debug_sub_808EC10
debug_sub_808EC10:
	push	{r4, lr}
	bl	Menu_ProcessInput
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	bl	Menu_GetCursorPos
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	lsl	r4, r4, #0x18
	asr	r4, r4, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r4, r0
	beq	._568	@cond_branch
	mov	r0, #0x1
	neg	r0, r0
	cmp	r4, r0
	beq	._568	@cond_branch
	ldr	r1, ._570       @ gSaveBlock1
	lsl	r0, r2, #0x18
	asr	r0, r0, #0x18
	ldr	r2, ._570 + 4   @ 0x13c8
	add	r1, r1, r2
	strh	r0, [r1]
	bl	CloseMenu
	mov	r0, #0x1
	b	._569
._571:
	.align	2, 0
._570:
	.word	gSaveBlock1
	.word	0x13c8
._568:
	mov	r0, #0x0
._569:
	pop	{r4}
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808EC10

	thumb_func_start debug_sub_808EC5C
debug_sub_808EC5C:
	push	{r4, lr}
	bl	Menu_ProcessInput
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	bl	Menu_GetCursorPos
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	lsl	r4, r4, #0x18
	asr	r4, r4, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r4, r0
	beq	._573	@cond_branch
	mov	r0, #0x1
	neg	r0, r0
	cmp	r4, r0
	beq	._573	@cond_branch
	ldr	r0, ._575       @ 0x40a7
	lsl	r1, r1, #0x18
	asr	r1, r1, #0x8
	lsr	r1, r1, #0x10
	bl	VarSet
	bl	CloseMenu
	mov	r0, #0x1
	b	._574
._576:
	.align	2, 0
._575:
	.word	0x40a7
._573:
	mov	r0, #0x0
._574:
	pop	{r4}
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808EC5C

	thumb_func_start debug_sub_808ECA4
debug_sub_808ECA4:
	push	{lr}
	add	sp, sp, #0xfffffffc
	mov	r0, #0x1
	neg	r0, r0
	mov	r1, #0x0
	str	r1, [sp]
	mov	r2, #0x0
	mov	r3, #0x10
	bl	BeginNormalPaletteFade
	ldr	r1, ._577       @ gMenuCallback
	ldr	r0, ._577 + 4   @ debug_sub_808ECD0
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x4
	pop	{r1}
	bx	r1
._578:
	.align	2, 0
._577:
	.word	gMenuCallback
	.word	debug_sub_808ECD0+1

	thumb_func_end debug_sub_808ECA4

	thumb_func_start debug_sub_808ECD0
debug_sub_808ECD0:
	push	{lr}
	bl	UpdatePaletteFade
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	._579	@cond_branch
	mov	r0, #0x0
	b	._580
._579:
	bl	CloseMenu
	mov	r0, #0x2
	bl	debug_sub_808F168
	ldr	r0, ._581       @ CB2_ContestPainting
	bl	SetMainCallback2
	ldr	r1, ._581 + 4   @ gMain
	ldr	r0, ._581 + 8   @ debug_sub_808B868
	str	r0, [r1, #0x8]
	mov	r0, #0x1
._580:
	pop	{r1}
	bx	r1
._582:
	.align	2, 0
._581:
	.word	CB2_ContestPainting+1
	.word	gMain
	.word	debug_sub_808B868+1

	thumb_func_end debug_sub_808ECD0

	thumb_func_start TomomichiDebugMenu_Config
TomomichiDebugMenu_Config:
	mov	r0, #0x0
	bx	lr

	thumb_func_end TomomichiDebugMenu_Config

	thumb_func_start debug_sub_808ED0C
debug_sub_808ED0C:
	push	{lr}
	ldr	r2, ._590       @ gMain
	ldrh	r1, [r2, #0x30]
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	._584	@cond_branch
	ldr	r1, ._590 + 4   @ gDebug_03000700
	ldrh	r0, [r1]
	cmp	r0, #0x1
	beq	._584	@cond_branch
	sub	r0, r0, #0x1
	strh	r0, [r1]
._584:
	ldrh	r1, [r2, #0x30]
	mov	r0, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	._586	@cond_branch
	ldr	r3, ._590 + 4   @ gDebug_03000700
	ldrh	r1, [r3]
	ldr	r0, ._590 + 8   @ 0x19b
	cmp	r1, r0
	beq	._586	@cond_branch
	add	r0, r1, #1
	strh	r0, [r3]
._586:
	ldrh	r1, [r2, #0x30]
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	._587	@cond_branch
	ldr	r1, ._590 + 4   @ gDebug_03000700
	ldrh	r0, [r1]
	cmp	r0, #0xa
	bls	._588	@cond_branch
	sub	r0, r0, #0xa
	b	._589
._591:
	.align	2, 0
._590:
	.word	gMain
	.word	gDebug_03000700
	.word	0x19b
._588:
	mov	r0, #0x1
._589:
	strh	r0, [r1]
._587:
	ldrh	r1, [r2, #0x30]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._592	@cond_branch
	ldr	r2, ._595       @ gDebug_03000700
	ldrh	r1, [r2]
	ldr	r0, ._595 + 4   @ 0x191
	cmp	r1, r0
	bhi	._593	@cond_branch
	add	r0, r1, #0
	add	r0, r0, #0xa
	b	._594
._596:
	.align	2, 0
._595:
	.word	gDebug_03000700
	.word	0x191
._593:
	ldr	r1, ._597       @ 0x19b
	add	r0, r1, #0
._594:
	strh	r0, [r2]
._592:
	pop	{r0}
	bx	r0
._598:
	.align	2, 0
._597:
	.word	0x19b

	thumb_func_end debug_sub_808ED0C

	thumb_func_start debug_sub_808ED9C
debug_sub_808ED9C:
	push	{lr}
	ldr	r2, ._606       @ gMain
	ldrh	r1, [r2, #0x30]
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	._600	@cond_branch
	ldr	r1, ._606 + 4   @ gDebug_03000708
	ldr	r0, [r1]
	cmp	r0, #0
	beq	._600	@cond_branch
	sub	r0, r0, #0x1
	str	r0, [r1]
._600:
	ldrh	r1, [r2, #0x30]
	mov	r0, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	._602	@cond_branch
	ldr	r3, ._606 + 4   @ gDebug_03000708
	ldr	r1, [r3]
	mov	r0, #0x1
	neg	r0, r0
	cmp	r1, r0
	beq	._602	@cond_branch
	add	r0, r1, #1
	str	r0, [r3]
._602:
	ldrh	r1, [r2, #0x30]
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	._603	@cond_branch
	ldr	r1, ._606 + 4   @ gDebug_03000708
	ldr	r0, [r1]
	cmp	r0, #0xf
	bls	._604	@cond_branch
	sub	r0, r0, #0x10
	b	._605
._607:
	.align	2, 0
._606:
	.word	gMain
	.word	gDebug_03000708
._604:
	mov	r0, #0x0
._605:
	str	r0, [r1]
._603:
	ldrh	r1, [r2, #0x30]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._608	@cond_branch
	ldr	r3, ._611       @ gDebug_03000708
	ldr	r1, [r3]
	mov	r0, #0x11
	neg	r0, r0
	cmp	r1, r0
	bhi	._609	@cond_branch
	add	r0, r1, #0
	add	r0, r0, #0x10
	b	._610
._612:
	.align	2, 0
._611:
	.word	gDebug_03000708
._609:
	mov	r0, #0x1
	neg	r0, r0
._610:
	str	r0, [r3]
._608:
	ldrh	r2, [r2, #0x2e]
	mov	r1, #0xc0
	lsl	r1, r1, #0x2
	add	r0, r1, #0
	and	r0, r0, r2
	cmp	r0, r1
	bne	._613	@cond_branch
	ldr	r1, ._614       @ gDebug_03000708
	mov	r0, #0x1
	neg	r0, r0
	str	r0, [r1]
._613:
	pop	{r0}
	bx	r0
._615:
	.align	2, 0
._614:
	.word	gDebug_03000708

	thumb_func_end debug_sub_808ED9C

	thumb_func_start debug_sub_808EE3C
debug_sub_808EE3C:
	push	{lr}
	ldr	r2, ._622       @ gMain
	ldrh	r1, [r2, #0x30]
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	._617	@cond_branch
	ldr	r1, ._622 + 4   @ gDebug_0300070C
	ldrb	r0, [r1]
	cmp	r0, #0x1
	beq	._617	@cond_branch
	sub	r0, r0, #0x1
	strb	r0, [r1]
._617:
	ldrh	r1, [r2, #0x30]
	mov	r0, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	._619	@cond_branch
	ldr	r1, ._622 + 4   @ gDebug_0300070C
	ldrb	r0, [r1]
	cmp	r0, #0x5
	beq	._619	@cond_branch
	add	r0, r0, #0x1
	strb	r0, [r1]
._619:
	ldrh	r1, [r2, #0x30]
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	._620	@cond_branch
	ldr	r1, ._622 + 4   @ gDebug_0300070C
	mov	r0, #0x1
	strb	r0, [r1]
._620:
	ldrh	r1, [r2, #0x30]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._621	@cond_branch
	ldr	r1, ._622 + 4   @ gDebug_0300070C
	mov	r0, #0x5
	strb	r0, [r1]
._621:
	pop	{r0}
	bx	r0
._623:
	.align	2, 0
._622:
	.word	gMain
	.word	gDebug_0300070C

	thumb_func_end debug_sub_808EE3C

	thumb_func_start debug_sub_808EE9C
debug_sub_808EE9C:
	push	{lr}
	ldr	r2, ._631       @ gMain
	ldrh	r1, [r2, #0x30]
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	._625	@cond_branch
	ldr	r1, ._631 + 4   @ gDebug_0300070D
	ldrb	r0, [r1]
	cmp	r0, #0x1
	beq	._625	@cond_branch
	sub	r0, r0, #0x1
	strb	r0, [r1]
._625:
	ldrh	r1, [r2, #0x30]
	mov	r0, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	._627	@cond_branch
	ldr	r1, ._631 + 4   @ gDebug_0300070D
	ldrb	r0, [r1]
	cmp	r0, #0xf
	beq	._627	@cond_branch
	add	r0, r0, #0x1
	strb	r0, [r1]
._627:
	ldrh	r1, [r2, #0x30]
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	._628	@cond_branch
	ldr	r1, ._631 + 4   @ gDebug_0300070D
	ldrb	r0, [r1]
	cmp	r0, #0xa
	bls	._629	@cond_branch
	sub	r0, r0, #0xa
	b	._630
._632:
	.align	2, 0
._631:
	.word	gMain
	.word	gDebug_0300070D
._629:
	mov	r0, #0x0
._630:
	strb	r0, [r1]
._628:
	ldrh	r1, [r2, #0x30]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._633	@cond_branch
	ldr	r1, ._636       @ gDebug_0300070D
	ldrb	r0, [r1]
	cmp	r0, #0x5
	bhi	._634	@cond_branch
	add	r0, r0, #0xa
	b	._635
._637:
	.align	2, 0
._636:
	.word	gDebug_0300070D
._634:
	mov	r0, #0xf
._635:
	strb	r0, [r1]
._633:
	pop	{r0}
	bx	r0

	thumb_func_end debug_sub_808EE9C

	thumb_func_start debug_sub_808EF14
debug_sub_808EF14:
	push	{lr}
	ldr	r2, ._645       @ gMain
	ldrh	r1, [r2, #0x30]
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	._639	@cond_branch
	ldr	r1, ._645 + 4   @ gDebug_0300070E
	ldrb	r0, [r1]
	cmp	r0, #0x1
	beq	._639	@cond_branch
	sub	r0, r0, #0x1
	strb	r0, [r1]
._639:
	ldrh	r1, [r2, #0x30]
	mov	r0, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	._641	@cond_branch
	ldr	r1, ._645 + 4   @ gDebug_0300070E
	ldrb	r0, [r1]
	cmp	r0, #0xf
	beq	._641	@cond_branch
	add	r0, r0, #0x1
	strb	r0, [r1]
._641:
	ldrh	r1, [r2, #0x30]
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	._642	@cond_branch
	ldr	r1, ._645 + 4   @ gDebug_0300070E
	ldrb	r0, [r1]
	cmp	r0, #0xa
	bls	._643	@cond_branch
	sub	r0, r0, #0xa
	b	._644
._646:
	.align	2, 0
._645:
	.word	gMain
	.word	gDebug_0300070E
._643:
	mov	r0, #0x0
._644:
	strb	r0, [r1]
._642:
	ldrh	r1, [r2, #0x30]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._647	@cond_branch
	ldr	r1, ._650       @ gDebug_0300070E
	ldrb	r0, [r1]
	cmp	r0, #0x5
	bhi	._648	@cond_branch
	add	r0, r0, #0xa
	b	._649
._651:
	.align	2, 0
._650:
	.word	gDebug_0300070E
._648:
	mov	r0, #0xf
._649:
	strb	r0, [r1]
._647:
	pop	{r0}
	bx	r0

	thumb_func_end debug_sub_808EF14

	thumb_func_start debug_sub_808EF8C
debug_sub_808EF8C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	lsl	r0, r0, #0x18
	lsr	r6, r0, #0x18
	cmp	r6, #0x2
	bgt	._653	@cond_branch
	cmp	r6, #0
	blt	._653	@cond_branch
	mov	r3, #0x0
	ldr	r0, ._656       @ gDebug_03000708
	mov	r8, r0
	ldr	r4, ._656 + 4   @ gDebug_03000710
	mov	r7, #0x7
	mov	r5, #0xf
._658:
	sub	r0, r7, r3
	lsl	r0, r0, #0x2
	mov	r1, r8
	ldr	r2, [r1]
	LSR	r2, r0
	and	r2, r2, r5
	cmp	r2, #0x9
	bhi	._654	@cond_branch
	add	r1, r3, r4
	add	r0, r2, #0
	add	r0, r0, #0xa1
	b	._655
._657:
	.align	2, 0
._656:
	.word	gDebug_03000708
	.word	gDebug_03000710
._654:
	add	r1, r3, r4
	add	r0, r2, #0
	sub	r0, r0, #0x4f
._655:
	strb	r0, [r1]
	add	r0, r3, #1
	lsl	r0, r0, #0x18
	lsr	r3, r0, #0x18
	cmp	r3, #0x7
	bls	._658	@cond_branch
	ldr	r0, ._666       @ gDebug_03000710
	mov	r1, #0xff
	strb	r1, [r0, #0x8]
	mov	r1, #0xc
	mov	r2, #0x5
	bl	Menu_PrintText
._653:
	mov	r3, #0x0
	ldr	r7, ._666       @ gDebug_03000710
	ldr	r5, ._666 + 4   @ gDebug_03000700
	ldr	r2, ._666 + 8   @ gSpeciesNames
	mov	r8, r2
	add	r4, r7, #0
	mov	r2, #0x0
._659:
	add	r1, r3, #1
	add	r0, r1, r4
	strb	r2, [r0]
	lsl	r1, r1, #0x18
	lsr	r3, r1, #0x18
	cmp	r3, #0x9
	bls	._659	@cond_branch
	mov	r3, #0x0
	ldrh	r2, [r5]
	mov	r0, #0xb
	add	r1, r2, #0
	mul	r1, r1, r0
	mov	r2, r8
	add	r0, r1, r2
	ldrb	r0, [r0]
	cmp	r0, #0xff
	beq	._661	@cond_branch
	ldr	r0, ._666       @ gDebug_03000710
	mov	ip, r0
	mov	r5, r8
	add	r4, r1, #0
._662:
	add	r1, r3, #1
	mov	r0, ip
	add	r2, r1, r0
	add	r0, r3, r4
	add	r0, r0, r5
	ldrb	r0, [r0]
	strb	r0, [r2]
	lsl	r1, r1, #0x18
	lsr	r3, r1, #0x18
	add	r0, r3, r4
	add	r0, r0, r5
	ldrb	r0, [r0]
	cmp	r0, #0xff
	beq	._661	@cond_branch
	cmp	r3, #0x9
	bls	._662	@cond_branch
._661:
	mov	r0, #0xb1
	strb	r0, [r7]
	mov	r0, #0xb2
	strb	r0, [r7, #0xb]
	mov	r0, #0xff
	strb	r0, [r7, #0xc]
	cmp	r6, #0x2
	bgt	._664	@cond_branch
	cmp	r6, #0
	blt	._664	@cond_branch
	add	r0, r7, #0
	mov	r1, #0x8
	mov	r2, #0x1
	bl	Menu_PrintText
	b	._665
._667:
	.align	2, 0
._666:
	.word	gDebug_03000710
	.word	gDebug_03000700
	.word	gSpeciesNames
._664:
	ldr	r0, ._672       @ gDebug_03000710
	mov	r1, #0xc
	mov	r2, #0x1
	bl	Menu_PrintText
._665:
	ldr	r5, ._672       @ gDebug_03000710
	mov	r0, #0xff
	strb	r0, [r5, #0x3]
	ldr	r4, ._672 + 4   @ gDebug_03000700
	ldrh	r0, [r4]
	mov	r1, #0x64
	bl	__udivsi3
	add	r0, r0, #0xa1
	strb	r0, [r5]
	ldrh	r0, [r4]
	mov	r1, #0x64
	bl	__umodsi3
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r1, #0xa
	bl	__udivsi3
	add	r0, r0, #0xa1
	strb	r0, [r5, #0x1]
	ldrh	r0, [r4]
	mov	r1, #0xa
	bl	__umodsi3
	add	r0, r0, #0xa1
	strb	r0, [r5, #0x2]
	add	r0, r5, #0
	mov	r1, #0xc
	mov	r2, #0x3
	bl	Menu_PrintText
	cmp	r6, #0x1
	beq	._668	@cond_branch
	cmp	r6, #0x1
	bgt	._669	@cond_branch
	cmp	r6, #0
	beq	._670	@cond_branch
	b	._679
._673:
	.align	2, 0
._672:
	.word	gDebug_03000710
	.word	gDebug_03000700
._669:
	cmp	r6, #0x2
	beq	._674	@cond_branch
	b	._679
._670:
	ldr	r4, ._677       @ gDebug_0300070C
	b	._676
._678:
	.align	2, 0
._677:
	.word	gDebug_0300070C
._668:
	ldr	r4, ._680       @ gDebug_0300070D
._676:
	ldrb	r0, [r4]
	mov	r1, #0x64
	bl	__udivsi3
	add	r0, r0, #0xa1
	strb	r0, [r5]
	ldrb	r0, [r4]
	mov	r1, #0x64
	bl	__umodsi3
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r1, #0xa
	bl	__udivsi3
	add	r0, r0, #0xa1
	strb	r0, [r5, #0x1]
	ldrb	r0, [r4]
	mov	r1, #0xa
	bl	__umodsi3
	add	r0, r0, #0xa1
	strb	r0, [r5, #0x2]
	add	r0, r5, #0
	mov	r1, #0xc
	mov	r2, #0x7
	bl	Menu_PrintText
	b	._679
._681:
	.align	2, 0
._680:
	.word	gDebug_0300070D
._674:
	ldr	r4, ._682       @ gDebug_0300070E
	ldrb	r0, [r4]
	mov	r1, #0x64
	bl	__udivsi3
	add	r0, r0, #0xa1
	strb	r0, [r5]
	ldrb	r0, [r4]
	mov	r1, #0x64
	bl	__umodsi3
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r1, #0xa
	bl	__udivsi3
	add	r0, r0, #0xa1
	strb	r0, [r5, #0x1]
	ldrb	r0, [r4]
	mov	r1, #0xa
	bl	__umodsi3
	add	r0, r0, #0xa1
	strb	r0, [r5, #0x2]
	add	r0, r5, #0
	mov	r1, #0xc
	mov	r2, #0x7
	bl	Menu_PrintText
._679:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._683:
	.align	2, 0
._682:
	.word	gDebug_0300070E

	thumb_func_end debug_sub_808EF8C

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
