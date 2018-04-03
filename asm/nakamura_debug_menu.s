.if DEBUG

	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.text

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
