.if DEBUG

	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.text

	thumb_func_start debug_sub_81603B8
debug_sub_81603B8:
	push	{r4, r5, r6, r7, lr}
	lsl	r0, r0, #0x18
	lsr	r6, r0, #0x18
	mov	r0, #0x5
	bl	PlaySE
	ldr	r7, ._259       @ _nakamuraData4
	ldrb	r4, [r7]
	add	r0, r4, #0
	mov	r1, #0x6
	bl	__udivsi3
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	add	r0, r4, #0
	mov	r1, #0x6
	bl	__umodsi3
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	ldr	r0, ._259 + 4   @ _843E5D1
	add	r0, r5, r0
	ldrb	r2, [r0]
	lsl	r3, r4, #0x1
	add	r1, r3, #1
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r3, r3, #0x2
	lsl	r3, r3, #0x18
	lsr	r3, r3, #0x18
	add	r0, r2, #0
	bl	Menu_BlankWindowRect
	cmp	r6, #0
	bne	._256	@cond_branch
	cmp	r4, #0
	beq	._257	@cond_branch
	ldrb	r0, [r7]
	sub	r0, r0, #0x1
	b	._258
._260:
	.align	2, 0
._259:
	.word	_nakamuraData4
	.word	_843E5D1
._257:
	lsl	r0, r5, #0x1
	add	r0, r0, r5
	lsl	r0, r0, #0x1
	add	r0, r0, #0x5
._258:
	strb	r0, [r7]
._256:
	ldr	r1, ._264       @ _nakamuraData4
	cmp	r6, #0x1
	bne	._261	@cond_branch
	cmp	r4, #0x5
	beq	._262	@cond_branch
	ldrb	r0, [r1]
	add	r0, r0, #0x1
	b	._263
._265:
	.align	2, 0
._264:
	.word	_nakamuraData4
._262:
	lsl	r0, r5, #0x1
	add	r0, r0, r5
	lsl	r0, r0, #0x1
._263:
	strb	r0, [r1]
._261:
	cmp	r6, #0x2
	bne	._266	@cond_branch
	cmp	r5, #0
	beq	._267	@cond_branch
	ldrb	r0, [r1]
	sub	r0, r0, #0x6
	b	._268
._267:
	add	r0, r4, #0
	add	r0, r0, #0xc
._268:
	strb	r0, [r1]
._266:
	cmp	r6, #0x3
	bne	._271	@cond_branch
	cmp	r5, #0x2
	beq	._270	@cond_branch
	ldrb	r0, [r1]
	add	r0, r0, #0x6
	strb	r0, [r1]
	b	._271
._270:
	strb	r4, [r1]
._271:
	ldrb	r4, [r1]
	add	r0, r4, #0
	mov	r1, #0x6
	bl	__udivsi3
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	add	r0, r4, #0
	mov	r1, #0x6
	bl	__umodsi3
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	ldr	r0, ._272       @ _843E5D1
	add	r0, r5, r0
	ldrb	r0, [r0]
	lsr	r1, r1, #0x17
	add	r1, r1, #0x1
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	mov	r2, #0xff
	bl	PrintTriangleCursorWithPalette
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._273:
	.align	2, 0
._272:
	.word	_843E5D1

	thumb_func_end debug_sub_81603B8

	thumb_func_start debug_sub_8160498
debug_sub_8160498:
	push	{r4, lr}
	ldr	r1, ._276       @ gMain
	ldrh	r2, [r1, #0x2e]
	mov	r0, #0x40
	and	r0, r0, r2
	cmp	r0, #0
	beq	._274	@cond_branch
	mov	r0, #0x0
	b	._281
._277:
	.align	2, 0
._276:
	.word	gMain
._274:
	mov	r0, #0x80
	and	r0, r0, r2
	cmp	r0, #0
	beq	._278	@cond_branch
	mov	r0, #0x1
	b	._281
._278:
	mov	r0, #0x20
	and	r0, r0, r2
	cmp	r0, #0
	beq	._280	@cond_branch
	mov	r0, #0x2
	b	._281
._280:
	mov	r0, #0x10
	and	r0, r0, r2
	cmp	r0, #0
	beq	._282	@cond_branch
	mov	r0, #0x3
._281:
	bl	debug_sub_81603B8
	mov	r0, #0x0
	b	._311
._282:
	ldrh	r1, [r1, #0x30]
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._284	@cond_branch
	ldr	r4, ._289       @ _nakamuraData4
	ldrb	r0, [r4]
	cmp	r0, #0x5
	bhi	._285	@cond_branch
	mov	r1, #0x1
	bl	debug_sub_81601C8
._285:
	ldrb	r0, [r4]
	sub	r0, r0, #0x6
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x5
	bhi	._286	@cond_branch
	ldrb	r0, [r4]
	mov	r1, #0x6
	bl	__umodsi3
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	bl	debug_sub_8160258
._286:
	ldrb	r0, [r4]
	sub	r0, r0, #0xc
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x5
	bhi	._306	@cond_branch
	ldrb	r0, [r4]
	mov	r1, #0x6
	bl	__umodsi3
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r1, #0x1
	b	._300
._290:
	.align	2, 0
._289:
	.word	_nakamuraData4
._284:
	mov	r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	._291	@cond_branch
	ldr	r4, ._294       @ _nakamuraData4
	ldrb	r0, [r4]
	cmp	r0, #0x5
	bhi	._304	@cond_branch
	mov	r1, #0x1
	neg	r1, r1
	b	._293
._295:
	.align	2, 0
._294:
	.word	_nakamuraData4
._291:
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._296	@cond_branch
	ldr	r4, ._301       @ _nakamuraData4
	ldrb	r0, [r4]
	cmp	r0, #0x5
	bhi	._297	@cond_branch
	mov	r1, #0xa
	bl	debug_sub_81601C8
._297:
	ldrb	r0, [r4]
	sub	r0, r0, #0x6
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x5
	bhi	._298	@cond_branch
	ldrb	r0, [r4]
	mov	r1, #0x6
	bl	__umodsi3
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	bl	debug_sub_8160258
._298:
	ldrb	r0, [r4]
	sub	r0, r0, #0xc
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x5
	bhi	._306	@cond_branch
	ldrb	r0, [r4]
	mov	r1, #0x6
	bl	__umodsi3
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r1, #0x1
	b	._300
._302:
	.align	2, 0
._301:
	.word	_nakamuraData4
._296:
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	._303	@cond_branch
	ldr	r4, ._308       @ _nakamuraData4
	ldrb	r0, [r4]
	cmp	r0, #0x5
	bhi	._304	@cond_branch
	mov	r1, #0xa
	neg	r1, r1
._293:
	bl	debug_sub_81601C8
._304:
	ldrb	r0, [r4]
	sub	r0, r0, #0x6
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x5
	bhi	._305	@cond_branch
	ldrb	r0, [r4]
	mov	r1, #0x6
	bl	__umodsi3
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	bl	debug_sub_8160258
._305:
	ldrb	r0, [r4]
	sub	r0, r0, #0xc
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x5
	bhi	._306	@cond_branch
	ldrb	r0, [r4]
	mov	r1, #0x6
	bl	__umodsi3
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r1, #0x1
	neg	r1, r1
._300:
	bl	debug_sub_816027C
._306:
	ldrb	r0, [r4]
	mov	r1, #0x6
	bl	__umodsi3
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	bl	debug_sub_816017C
	mov	r0, #0x0
	b	._311
._309:
	.align	2, 0
._308:
	.word	_nakamuraData4
._303:
	mov	r0, #0x8
	and	r0, r0, r2
	cmp	r0, #0
	bne	._310	@cond_branch
	mov	r0, #0x0
	b	._311
._310:
	bl	debug_sub_8160308
	bl	CloseMenu
	mov	r0, #0x1
._311:
	pop	{r4}
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_8160498

	thumb_func_start debug_sub_816062C
debug_sub_816062C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	sp, sp, #0xfffffff0
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r8, r0
	mov	r0, #0x64
	mov	r4, r8
	mul	r4, r4, r0
	ldr	r0, ._316       @ gPlayerParty
	add	r4, r4, r0
	add	r0, r4, #0
	mov	r1, #0xb
	bl	GetMonData
	lsl	r0, r0, #0x10
	lsr	r7, r0, #0x10
	add	r0, r4, #0
	bl	GetMonGender
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	ldr	r1, ._316 + 4   @ gBaseStats
	lsl	r0, r7, #0x3
	sub	r0, r0, r7
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldrb	r6, [r0, #0x10]
	cmp	r6, #0
	beq	._313	@cond_branch
	cmp	r6, #0xfe
	beq	._313	@cond_branch
	cmp	r6, #0xff
	bne	._314	@cond_branch
._313:
	mov	r0, #0x64
	mov	r1, r8
	mul	r1, r1, r0
	add	r0, r1, #0
	ldr	r1, ._316       @ gPlayerParty
	add	r0, r0, r1
	bl	GetMonGender
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	b	._320
._317:
	.align	2, 0
._316:
	.word	gPlayerParty
	.word	gBaseStats
._314:
	cmp	r2, #0
	beq	._318	@cond_branch
	cmp	r2, #0xfe
	beq	._319	@cond_branch
	mov	r0, #0x0
	b	._320
._318:
	mov	r6, #0xfe
	b	._321
._319:
	mov	r6, #0x0
._321:
	mov	r0, r8
	lsl	r0, r0, #0x2
	mov	r9, r0
._322:
	bl	Random
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	bl	Random
	lsl	r0, r0, #0x10
	orr	r5, r5, r0
	add	r0, r7, #0
	add	r1, r5, #0
	bl	GetGenderFromSpeciesAndPersonality
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, r6
	bne	._322	@cond_branch
	mov	r0, #0x64
	mov	r4, r8
	mul	r4, r4, r0
	ldr	r0, ._323       @ gPlayerParty
	add	r4, r4, r0
	add	r0, r4, #0
	mov	r1, #0x42
	bl	GetMonData
	ldr	r0, ._323 + 4   @ _nakamuraStatic0
	add r0, r0, r9
	ldrh	r1, [r0]
	ldrb	r2, [r0, #0x2]
	mov	r0, #0x1
	str	r0, [sp]
	str	r5, [sp, #0x4]
	mov	r0, #0x0
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	mov	r3, #0x20
	bl	CreateMon
	add	r0, r6, #0
._320:
	add	sp, sp, #0x10
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
._324:
	.align	2, 0
._323:
	.word	gPlayerParty
	.word	_nakamuraStatic0

	thumb_func_end debug_sub_816062C

	thumb_func_start debug_sub_8160714
debug_sub_8160714:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	sp, sp, #0xfffffff0
	add	r6, r0, #0
	mov	r9, r1
	mov	r7, #0x0
	mov	r0, #0x0
	mov	r8, r0
	mov	r2, #0x0
	mov	r5, #0x0
._329:
	add	r4, r5, #1
	lsl	r1, r4, #0x18
	lsr	r1, r1, #0x18
	mov	r0, r9
	str	r2, [sp, #0xc]
	bl	GetPokeblockData
	add	r1, r0, #0
	lsl	r0, r5, #0x1
	add r0, r0, sp
	strh	r1, [r0]
	ldr	r2, [sp, #0xc]
	cmp	r5, #0x5
	beq	._328	@cond_branch
	lsl	r0, r1, #0x10
	asr	r1, r0, #0x10
	cmp	r1, #0
	ble	._326	@cond_branch
	add	r0, r7, #1
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
._326:
	cmp	r1, #0
	bge	._327	@cond_branch
	mov	r0, r8
	add	r0, r0, #0x1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r8, r0
._327:
	cmp	r1, #0
	bne	._328	@cond_branch
	add	r0, r2, #1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
._328:
	lsl	r0, r4, #0x18
	lsr	r5, r0, #0x18
	cmp	r5, #0x5
	bls	._329	@cond_branch
	mov	r0, sp
	mov	r1, #0x0
	ldsh	r0, [r0, r1]
	cmp	r0, #0x31
	bgt	._333	@cond_branch
	mov	r0, sp
	ldrh	r0, [r0, #0x2]
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	cmp	r0, #0x31
	bgt	._333	@cond_branch
	mov	r0, sp
	mov	r4, #0x4
	ldsh	r0, [r0, r4]
	cmp	r0, #0x31
	bgt	._333	@cond_branch
	mov	r0, sp
	mov	r1, #0x6
	ldsh	r0, [r0, r1]
	cmp	r0, #0x31
	bgt	._333	@cond_branch
	mov	r0, sp
	mov	r4, #0x8
	ldsh	r0, [r0, r4]
	cmp	r0, #0x31
	ble	._334	@cond_branch
._333:
	ldr	r1, ._336       @ ContestStatsText_GoldPokeBlock
	add	r0, r6, #0
	bl	StringCopy
	mov	r0, #0xe
	b	._400
._337:
	.align	2, 0
._336:
	.word	ContestStatsText_GoldPokeBlock
._334:
	cmp	r7, #0x4
	bne	._338	@cond_branch
	ldr	r1, ._340       @ ContestStatsText_WhitePokeBlock
	add	r0, r6, #0
	bl	StringCopy
	mov	r0, #0xd
	b	._400
._341:
	.align	2, 0
._340:
	.word	ContestStatsText_WhitePokeBlock
._338:
	mov	r3, #0x0
	mov	r5, #0x0
._343:
	lsl	r0, r5, #0x1
	add r0, r0, sp
	mov	r1, #0x0
	ldsh	r0, [r0, r1]
	cmp	r0, #0x2
	bne	._342	@cond_branch
	add	r0, r3, #1
	lsl	r0, r0, #0x18
	lsr	r3, r0, #0x18
._342:
	add	r0, r5, #1
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	cmp	r5, #0x4
	bls	._343	@cond_branch
	cmp	r3, #0x3
	beq	._345	@cond_branch
	cmp	r2, #0x5
	beq	._345	@cond_branch
	mov	r4, r8
	cmp	r4, #0x4
	bne	._346	@cond_branch
._345:
	ldr	r1, ._348       @ ContestStatsText_BlackPokeBlock
	add	r0, r6, #0
	bl	StringCopy
	mov	r0, #0xc
	b	._400
._349:
	.align	2, 0
._348:
	.word	ContestStatsText_BlackPokeBlock
._346:
	cmp	r7, #0x3
	bne	._350	@cond_branch
	ldr	r1, ._352       @ ContestStatsText_GrayPokeBlock
	add	r0, r6, #0
	bl	StringCopy
	mov	r0, #0xb
	b	._400
._353:
	.align	2, 0
._352:
	.word	ContestStatsText_GrayPokeBlock
._350:
	cmp	r7, #0x2
	beq	._354	@cond_branch
	mov	r0, r8
	cmp	r0, #0x2
	bne	._377	@cond_branch
._354:
	mov	r3, #0x6
	mov	r2, #0x0
	mov	r5, #0x0
._359:
	lsl	r0, r5, #0x1
	add r0, r0, sp
	mov	r1, #0x0
	ldsh	r0, [r0, r1]
	cmp	r0, #0
	beq	._358	@cond_branch
	cmp	r3, #0x6
	bne	._357	@cond_branch
	add	r3, r5, #0
	b	._358
._357:
	add	r2, r5, #0
._358:
	add	r0, r5, #1
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	cmp	r5, #0x4
	bls	._359	@cond_branch
	lsl	r0, r3, #0x1
	mov	r4, sp
	add	r1, r4, r0
	lsl	r0, r2, #0x1
	add r0, r0, sp
	mov	r4, #0x0
	ldsh	r1, [r1, r4]
	mov	r4, #0x0
	ldsh	r0, [r0, r4]
	cmp	r1, r0
	blt	._360	@cond_branch
	add	r2, r3, #0
._360:
	cmp	r2, #0
	bne	._361	@cond_branch
	ldr	r1, ._363       @ ContestStatsText_PurplePokeBlock
	add	r0, r6, #0
	bl	StringCopy
	mov	r0, #0x6
	b	._400
._364:
	.align	2, 0
._363:
	.word	ContestStatsText_PurplePokeBlock
._361:
	cmp	r2, #0x1
	bne	._365	@cond_branch
	ldr	r1, ._367       @ ContestStatsText_IndigoPokeBlock
	add	r0, r6, #0
	bl	StringCopy
	mov	r0, #0x7
	b	._400
._368:
	.align	2, 0
._367:
	.word	ContestStatsText_IndigoPokeBlock
._365:
	cmp	r2, #0x2
	bne	._369	@cond_branch
	ldr	r1, ._371       @ ContestStatsText_BrownPokeBlock
	add	r0, r6, #0
	bl	StringCopy
	mov	r0, #0x8
	b	._400
._372:
	.align	2, 0
._371:
	.word	ContestStatsText_BrownPokeBlock
._369:
	cmp	r2, #0x3
	bne	._373	@cond_branch
	ldr	r1, ._375       @ ContestStatsText_LiteBluePokeBlock
	add	r0, r6, #0
	bl	StringCopy
	mov	r0, #0x9
	b	._400
._376:
	.align	2, 0
._375:
	.word	ContestStatsText_LiteBluePokeBlock
._373:
	cmp	r2, #0x4
	bne	._377	@cond_branch
	ldr	r1, ._379       @ ContestStatsText_OlivePokeBlock
	add	r0, r6, #0
	bl	StringCopy
	mov	r0, #0xa
	b	._400
._380:
	.align	2, 0
._379:
	.word	ContestStatsText_OlivePokeBlock
._377:
	cmp	r7, #0x1
	beq	._381	@cond_branch
	mov	r0, r8
	cmp	r0, #0x1
	bne	._399	@cond_branch
._381:
	mov	r0, sp
	mov	r1, #0x0
	ldsh	r0, [r0, r1]
	cmp	r0, #0
	beq	._383	@cond_branch
	ldr	r1, ._385       @ ContestStatsText_RedPokeBlock
	add	r0, r6, #0
	bl	StringCopy
	mov	r0, #0x1
	b	._400
._386:
	.align	2, 0
._385:
	.word	ContestStatsText_RedPokeBlock
._383:
	mov	r0, sp
	ldrh	r0, [r0, #0x2]
	cmp	r0, #0
	beq	._387	@cond_branch
	ldr	r1, ._389       @ ContestStatsText_BluePokeBlock
	add	r0, r6, #0
	bl	StringCopy
	mov	r0, #0x2
	b	._400
._390:
	.align	2, 0
._389:
	.word	ContestStatsText_BluePokeBlock
._387:
	mov	r0, sp
	mov	r4, #0x4
	ldsh	r0, [r0, r4]
	cmp	r0, #0
	beq	._391	@cond_branch
	ldr	r1, ._393       @ ContestStatsText_PinkPokeBlock
	add	r0, r6, #0
	bl	StringCopy
	mov	r0, #0x3
	b	._400
._394:
	.align	2, 0
._393:
	.word	ContestStatsText_PinkPokeBlock
._391:
	mov	r0, sp
	mov	r1, #0x6
	ldsh	r0, [r0, r1]
	cmp	r0, #0
	beq	._395	@cond_branch
	ldr	r1, ._397       @ ContestStatsText_GreenPokeBlock
	add	r0, r6, #0
	bl	StringCopy
	mov	r0, #0x4
	b	._400
._398:
	.align	2, 0
._397:
	.word	ContestStatsText_GreenPokeBlock
._395:
	mov	r0, sp
	mov	r4, #0x8
	ldsh	r0, [r0, r4]
	cmp	r0, #0
	beq	._399	@cond_branch
	ldr	r1, ._401       @ ContestStatsText_YellowPokeBlock
	add	r0, r6, #0
	bl	StringCopy
	mov	r0, #0x5
	b	._400
._402:
	.align	2, 0
._401:
	.word	ContestStatsText_YellowPokeBlock
._399:
	ldr	r1, ._403       @ gOtherText_FiveQuestions
	add	r0, r6, #0
	bl	StringCopy
	mov	r0, #0x0
._400:
	add	sp, sp, #0x10
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
._404:
	.align	2, 0
._403:
	.word	gOtherText_FiveQuestions

	thumb_func_end debug_sub_8160714

	thumb_func_start debug_sub_816097C
debug_sub_816097C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r7, r0, #0
	lsl	r1, r1, #0x10
	lsr	r5, r1, #0x10
	mov	r6, #0x0
	mov	r1, #0x0
._405:
	add	r0, r7, r6
	strb	r1, [r0]
	add	r0, r6, #1
	lsl	r0, r0, #0x18
	lsr	r6, r0, #0x18
	cmp	r6, #0x3
	bls	._405	@cond_branch
	mov	r0, #0xff
	strb	r0, [r7, #0x4]
	lsl	r0, r5, #0x10
	asr	r0, r0, #0x10
	cmp	r0, #0
	bne	._406	@cond_branch
	mov	r0, #0xa1
	strb	r0, [r7, #0x3]
	b	._414
._406:
	cmp	r0, #0
	ble	._408	@cond_branch
	mov	r4, #0x64
	mov	r0, #0x0
	mov	r8, r0
	mov	r6, #0x0
._412:
	lsl	r5, r5, #0x10
	asr	r0, r5, #0x10
	lsl	r4, r4, #0x10
	asr	r1, r4, #0x10
	bl	__divsi3
	lsl	r0, r0, #0x10
	lsr	r2, r0, #0x10
	mov	r1, r8
	cmp	r1, #0
	bne	._410	@cond_branch
	cmp	r6, #0x2
	beq	._410	@cond_branch
	cmp	r2, #0
	beq	._411	@cond_branch
._410:
	add	r1, r6, r7
	add	r0, r2, #0
	sub	r0, r0, #0x5f
	strb	r0, [r1, #0x1]
	mov	r0, #0x1
	mov	r8, r0
._411:
	asr	r0, r5, #0x10
	asr	r4, r4, #0x10
	add	r1, r4, #0
	bl	__modsi3
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	add	r0, r4, #0
	mov	r1, #0xa
	bl	__divsi3
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	add	r0, r6, #1
	lsl	r0, r0, #0x18
	lsr	r6, r0, #0x18
	cmp	r6, #0x2
	bls	._412	@cond_branch
	b	._414
._408:
	cmp	r0, #0
	bge	._414	@cond_branch
	neg	r0, r0
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	mov	r4, #0x64
	mov	r1, #0x0
	mov	r8, r1
	mov	r6, #0x0
._419:
	lsl	r5, r5, #0x10
	asr	r0, r5, #0x10
	lsl	r4, r4, #0x10
	asr	r1, r4, #0x10
	bl	__divsi3
	lsl	r0, r0, #0x10
	lsr	r2, r0, #0x10
	mov	r1, r8
	lsl	r0, r1, #0x10
	add	r3, r0, #0
	cmp	r3, #0
	bne	._416	@cond_branch
	cmp	r6, #0x2
	beq	._416	@cond_branch
	cmp	r2, #0
	beq	._417	@cond_branch
._416:
	add	r1, r6, r7
	add	r0, r2, #0
	sub	r0, r0, #0x5f
	strb	r0, [r1, #0x1]
	cmp	r3, #0
	bne	._418	@cond_branch
	mov	r0, #0xae
	strb	r0, [r1]
._418:
	mov	r0, #0x1
	mov	r8, r0
._417:
	asr	r0, r5, #0x10
	asr	r4, r4, #0x10
	add	r1, r4, #0
	bl	__modsi3
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	add	r0, r4, #0
	mov	r1, #0xa
	bl	__divsi3
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	add	r0, r6, #1
	lsl	r0, r0, #0x18
	lsr	r6, r0, #0x18
	cmp	r6, #0x2
	bls	._419	@cond_branch
._414:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0

	thumb_func_end debug_sub_816097C

	thumb_func_start debug_sub_8160A80
debug_sub_8160A80:
	push	{r4, lr}
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	add	r2, r0, #0
	ldr	r1, ._422       @ _nakamuraStatic18
	cmp	r0, #0
	bne	._420	@cond_branch
	ldr	r4, ._422 + 4   @ gStringVar1
	ldrb	r1, [r1, #0x1]
	add	r0, r4, #0
	bl	debug_sub_816097C
	add	r0, r4, #0
	mov	r1, #0x8
	mov	r2, #0x3
	bl	Menu_PrintText
	b	._440
._423:
	.align	2, 0
._422:
	.word	_nakamuraStatic18
	.word	gStringVar1
._420:
	cmp	r0, #0x1
	bne	._424	@cond_branch
	ldr	r4, ._426       @ gStringVar1
	ldrb	r1, [r1, #0x2]
	add	r0, r4, #0
	bl	debug_sub_816097C
	add	r0, r4, #0
	mov	r1, #0x8
	mov	r2, #0x5
	bl	Menu_PrintText
	b	._440
._427:
	.align	2, 0
._426:
	.word	gStringVar1
._424:
	cmp	r0, #0x2
	bne	._428	@cond_branch
	ldr	r4, ._430       @ gStringVar1
	ldrb	r1, [r1, #0x3]
	add	r0, r4, #0
	bl	debug_sub_816097C
	add	r0, r4, #0
	mov	r1, #0x8
	mov	r2, #0x7
	bl	Menu_PrintText
	b	._440
._431:
	.align	2, 0
._430:
	.word	gStringVar1
._428:
	cmp	r0, #0x3
	bne	._432	@cond_branch
	ldr	r4, ._434       @ gStringVar1
	ldrb	r1, [r1, #0x4]
	add	r0, r4, #0
	bl	debug_sub_816097C
	add	r0, r4, #0
	mov	r1, #0x8
	mov	r2, #0x9
	bl	Menu_PrintText
	b	._440
._435:
	.align	2, 0
._434:
	.word	gStringVar1
._432:
	cmp	r0, #0x4
	bne	._436	@cond_branch
	ldr	r4, ._438       @ gStringVar1
	ldrb	r1, [r1, #0x5]
	add	r0, r4, #0
	bl	debug_sub_816097C
	add	r0, r4, #0
	mov	r1, #0x8
	mov	r2, #0xb
	bl	Menu_PrintText
	b	._440
._439:
	.align	2, 0
._438:
	.word	gStringVar1
._436:
	cmp	r2, #0x5
	bne	._440	@cond_branch
	ldr	r4, ._441       @ gStringVar1
	ldrb	r1, [r1, #0x6]
	add	r0, r4, #0
	bl	debug_sub_816097C
	add	r0, r4, #0
	mov	r1, #0x8
	mov	r2, #0xd
	bl	Menu_PrintText
._440:
	pop	{r4}
	pop	{r0}
	bx	r0
._442:
	.align	2, 0
._441:
	.word	gStringVar1

	thumb_func_end debug_sub_8160A80

	thumb_func_start debug_sub_8160B50
debug_sub_8160B50:
	push	{r4, lr}
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	add	r3, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r4, r1, #0
	ldr	r2, ._445       @ _nakamuraStatic18
	cmp	r0, #0
	bne	._443	@cond_branch
	ldrb	r0, [r2, #0x1]
	add	r0, r0, r1
	strb	r0, [r2, #0x1]
	b	._455
._446:
	.align	2, 0
._445:
	.word	_nakamuraStatic18
._443:
	cmp	r0, #0x1
	bne	._447	@cond_branch
	ldrb	r0, [r2, #0x2]
	add	r0, r0, r1
	strb	r0, [r2, #0x2]
	b	._455
._447:
	cmp	r0, #0x2
	bne	._449	@cond_branch
	ldrb	r0, [r2, #0x3]
	add	r0, r0, r1
	strb	r0, [r2, #0x3]
	b	._455
._449:
	cmp	r0, #0x3
	bne	._451	@cond_branch
	ldrb	r0, [r2, #0x4]
	add	r0, r0, r1
	strb	r0, [r2, #0x4]
	b	._455
._451:
	cmp	r0, #0x4
	bne	._453	@cond_branch
	ldrb	r0, [r2, #0x5]
	add	r0, r0, r1
	strb	r0, [r2, #0x5]
	b	._455
._453:
	cmp	r3, #0x5
	bne	._455	@cond_branch
	ldrb	r0, [r2, #0x6]
	add	r0, r0, r4
	strb	r0, [r2, #0x6]
._455:
	pop	{r4}
	pop	{r0}
	bx	r0

	thumb_func_end debug_sub_8160B50

	thumb_func_start debug_sub_8160BB0
debug_sub_8160BB0:
	push	{r4, r5, lr}
	ldr	r5, ._456       @ gStringVar1
	ldr	r4, ._456 + 4   @ _nakamuraStatic18
	add	r0, r5, #0
	add	r1, r4, #0
	bl	debug_sub_8160714
	strb	r0, [r4]
	mov	r0, #0x1
	mov	r1, #0x1
	mov	r2, #0x8
	mov	r3, #0x2
	bl	Menu_BlankWindowRect
	add	r0, r5, #0
	mov	r1, #0x1
	mov	r2, #0x1
	bl	Menu_PrintText
	pop	{r4, r5}
	pop	{r0}
	bx	r0
._457:
	.align	2, 0
._456:
	.word	gStringVar1
	.word	_nakamuraStatic18

	thumb_func_end debug_sub_8160BB0

	thumb_func_start debug_sub_8160BE4
debug_sub_8160BE4:
	push	{r4, lr}
	add	sp, sp, #0xfffffff8
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0xc
	mov	r3, #0xf
	bl	Menu_DrawStdWindowFrame
	bl	debug_sub_8160BB0
	ldr	r0, ._459       @ gContestStatsText_Spicy
	mov	r1, #0x2
	mov	r2, #0x3
	bl	Menu_PrintText
	ldr	r0, ._459 + 4   @ gContestStatsText_Dry
	mov	r1, #0x2
	mov	r2, #0x5
	bl	Menu_PrintText
	ldr	r0, ._459 + 8   @ gContestStatsText_Sweet
	mov	r1, #0x2
	mov	r2, #0x7
	bl	Menu_PrintText
	ldr	r0, ._459 + 12  @ gContestStatsText_Bitter
	mov	r1, #0x2
	mov	r2, #0x9
	bl	Menu_PrintText
	ldr	r0, ._459 + 16  @ gContestStatsText_Sour
	mov	r1, #0x2
	mov	r2, #0xb
	bl	Menu_PrintText
	ldr	r0, ._459 + 20  @ gContestStatsText_Tasty
	mov	r1, #0x2
	mov	r2, #0xd
	bl	Menu_PrintText
	mov	r4, #0x0
._458:
	add	r0, r4, #0
	bl	debug_sub_8160A80
	add	r0, r4, #1
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	cmp	r4, #0x5
	bls	._458	@cond_branch
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0xb
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x3
	mov	r3, #0x6
	bl	InitMenu
	add	sp, sp, #0x8
	pop	{r4}
	pop	{r0}
	bx	r0
._460:
	.align	2, 0
._459:
	.word	gContestStatsText_Spicy
	.word	gContestStatsText_Dry
	.word	gContestStatsText_Sweet
	.word	gContestStatsText_Bitter
	.word	gContestStatsText_Sour
	.word	gContestStatsText_Tasty

	thumb_func_end debug_sub_8160BE4

	thumb_func_start debug_sub_8160C7C
debug_sub_8160C7C:
	push	{r4, lr}
	ldr	r2, ._469       @ _nakamuraStatic18
	mov	r1, #0x0
	ldrb	r0, [r2]
	cmp	r0, #0xc
	bne	._467	@cond_branch
	ldrb	r0, [r2, #0x1]
	cmp	r0, #0x2
	bne	._462	@cond_branch
	mov	r1, #0x1
._462:
	ldrb	r0, [r2, #0x3]
	cmp	r0, #0x2
	bne	._463	@cond_branch
	add	r0, r1, #1
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
._463:
	ldrb	r0, [r2, #0x4]
	cmp	r0, #0x2
	bne	._464	@cond_branch
	add	r0, r1, #1
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
._464:
	ldrb	r0, [r2, #0x2]
	cmp	r0, #0x2
	bne	._465	@cond_branch
	add	r0, r1, #1
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
._465:
	ldrb	r0, [r2, #0x5]
	cmp	r0, #0x2
	bne	._466	@cond_branch
	add	r0, r1, #1
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
._466:
	cmp	r1, #0x3
	beq	._467	@cond_branch
	mov	r0, #0x2
	strb	r0, [r2, #0x1]
	strb	r0, [r2, #0x3]
	strb	r0, [r2, #0x4]
._467:
	add	r0, r2, #0
	bl	sub_810CA34
	bl	debug_sub_8160BB0
	mov	r4, #0x0
._468:
	add	r0, r4, #0
	bl	debug_sub_8160A80
	add	r0, r4, #1
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	cmp	r4, #0x5
	bls	._468	@cond_branch
	pop	{r4}
	pop	{r0}
	bx	r0
._470:
	.align	2, 0
._469:
	.word	_nakamuraStatic18

	thumb_func_end debug_sub_8160C7C

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
