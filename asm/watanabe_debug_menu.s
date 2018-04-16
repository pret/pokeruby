.if DEBUG

	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.text

	thumb_func_start debug_80C4900
debug_80C4900:
	push	{r4, r5, lr}
	add	sp, sp, #0xfffffffc
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	ldr	r1, ._230       @ gMain
	ldrh	r2, [r1, #0x2e]
	mov	r0, #0x2
	and	r0, r0, r2
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	add	r3, r1, #0
	cmp	r4, #0
	beq	._228	@cond_branch
	mov	r0, #0x5
	bl	PlaySE
	mov	r0, #0x1
	neg	r0, r0
	mov	r4, #0x0
	str	r4, [sp]
	mov	r1, #0x0
	mov	r2, #0x0
	mov	r3, #0x10
	bl	BeginNormalPaletteFade
	ldr	r0, ._230 + 4   @ debug_80C370C
	bl	SetMainCallback2
	bl	LoadPlayerParty
	ldr	r1, ._230 + 8   @ gSaveBlock2
	ldr	r0, ._230 + 12  @ gUnknown_Debug_2038A0C
	ldrb	r0, [r0, #0xd]
	strb	r0, [r1, #0x8]
	ldr	r0, ._230 + 16  @ gBattleTypeFlags
	mov	r1, #0x0
	strh	r4, [r0]
	ldr	r0, ._230 + 20  @ gUnknown_02023A14_50
	strb	r1, [r0]
	ldr	r1, ._230 + 24  @ gTasks
	lsl	r0, r5, #0x2
	add	r0, r0, r5
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._230 + 28  @ debug_80C373C
	b	._229
._231:
	.align	2, 0
._230:
	.word	gMain
	.word	debug_80C370C+1
	.word	gSaveBlock2
	.word	gUnknown_Debug_2038A0C
	.word	gBattleTypeFlags
	.word	gUnknown_02023A14_50
	.word	gTasks
	.word	debug_80C373C+1
._228:
	mov	r0, #0x8
	and	r0, r0, r2
	cmp	r0, #0
	bne	._232	@cond_branch
	mov	r0, #0x1
	and	r0, r0, r2
	cmp	r0, #0
	beq	._233	@cond_branch
._232:
	mov	r0, #0x5
	bl	PlaySE
	ldr	r1, ._236       @ gBattleTypeFlags
	ldr	r3, ._236 + 4   @ gUnknown_Debug_083F8068
	ldr	r2, ._236 + 8   @ gUnknown_Debug_2038A0C
	ldrb	r0, [r2, #0x3]
	lsl	r0, r0, #0x3
	add	r0, r0, r3
	ldrb	r0, [r0, #0x4]
	strh	r0, [r1]
	ldr	r1, ._236 + 12  @ gUnknown_02023A14_50
	mov	r0, #0x8
	strb	r0, [r1]
	ldrb	r0, [r2, #0x3]
	lsl	r0, r0, #0x3
	add	r0, r0, r3
	ldrb	r0, [r0, #0x5]
	strb	r0, [r2, #0xc]
	ldrb	r0, [r2, #0x3]
	sub	r0, r0, #0x1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1
	bhi	._234	@cond_branch
	str	r4, [sp]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0xe
	bl	debug_80C38E4
	ldr	r0, ._236 + 16  @ gTasks
	lsl	r1, r5, #0x2
	add	r1, r1, r5
	lsl	r1, r1, #0x3
	add	r1, r1, r0
	ldr	r0, ._236 + 20  @ debug_80C4A60
	str	r0, [r1]
	b	._247
._237:
	.align	2, 0
._236:
	.word	gBattleTypeFlags
	.word	gUnknown_Debug_083F8068
	.word	gUnknown_Debug_2038A0C
	.word	gUnknown_02023A14_50
	.word	gTasks
	.word	debug_80C4A60+1
._234:
	ldr	r0, ._239       @ gTasks
	lsl	r1, r5, #0x2
	add	r1, r1, r5
	lsl	r1, r1, #0x3
	add	r1, r1, r0
	ldr	r0, ._239 + 4   @ debug_80C4F48
	str	r0, [r1]
	b	._247
._240:
	.align	2, 0
._239:
	.word	gTasks
	.word	debug_80C4F48+1
._233:
	ldrh	r1, [r3, #0x30]
	mov	r0, #0x40
	and	r0, r0, r1
	cmp	r0, #0
	beq	._242	@cond_branch
	ldr	r1, ._244       @ gUnknown_Debug_2038A0C
	ldrb	r0, [r1, #0x3]
	cmp	r0, #0
	beq	._242	@cond_branch
	sub	r0, r0, #0x1
	b	._243
._245:
	.align	2, 0
._244:
	.word	gUnknown_Debug_2038A0C
._242:
	ldrh	r1, [r3, #0x30]
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	beq	._247	@cond_branch
	ldr	r1, ._248       @ gUnknown_Debug_2038A0C
	ldrb	r0, [r1, #0x3]
	cmp	r0, #0x1
	bhi	._247	@cond_branch
	add	r0, r0, #0x1
._243:
	strb	r0, [r1, #0x3]
	ldr	r1, ._248 + 4   @ gTasks
	lsl	r0, r5, #0x2
	add	r0, r0, r5
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._248 + 8   @ debug_80C48A0
._229:
	str	r1, [r0]
._247:
	add	sp, sp, #0x4
	pop	{r4, r5}
	pop	{r0}
	bx	r0
._249:
	.align	2, 0
._248:
	.word	gUnknown_Debug_2038A0C
	.word	gTasks
	.word	debug_80C48A0+1

	thumb_func_end debug_80C4900

	thumb_func_start debug_80C4A60
debug_80C4A60:
	push	{r4, lr}
	add	sp, sp, #0xfffffffc
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	ldr	r0, ._250       @ gUnknown_Debug_2038A0C
	ldrb	r0, [r0, #0x5]
	lsl	r0, r0, #0x19
	mov	r1, #0xc0
	lsl	r1, r1, #0x12
	add	r0, r0, r1
	lsr	r0, r0, #0x18
	mov	r1, #0x1
	str	r1, [sp]
	mov	r1, #0x10
	mov	r2, #0x1
	mov	r3, #0xe
	bl	debug_80C38E4
	ldr	r1, ._250 + 4   @ 0x4000042
	ldr	r2, ._250 + 8   @ 0x79ef
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x4
	ldr	r2, ._250 + 12  @ 0x17f
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r1, ._250 + 16  @ gTasks
	lsl	r0, r4, #0x2
	add	r0, r0, r4
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._250 + 20  @ debug_80C4AC4
	str	r1, [r0]
	add	sp, sp, #0x4
	pop	{r4}
	pop	{r0}
	bx	r0
._251:
	.align	2, 0
._250:
	.word	gUnknown_Debug_2038A0C
	.word	0x4000042
	.word	0x79ef
	.word	0x17f
	.word	gTasks
	.word	debug_80C4AC4+1

	thumb_func_end debug_80C4A60

	thumb_func_start debug_80C4AC4
debug_80C4AC4:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xfffffffc
	lsl	r0, r0, #0x18
	lsr	r6, r0, #0x18
	ldr	r7, ._255       @ gUnknown_Debug_2038A0C
	ldrb	r0, [r7, #0x4]
	mov	ip, r0
	ldrb	r5, [r7, #0x5]
	mov	r1, ip
	add	r0, r1, r5
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	ldr	r2, ._255 + 4   @ gMain
	mov	r8, r2
	ldrh	r2, [r2, #0x2e]
	mov	r3, #0x1
	and	r3, r3, r2
	add	r4, r7, #0
	cmp	r3, #0
	beq	._252	@cond_branch
	ldr	r0, ._255 + 8   @ gUnknown_Debug_083F80D8
	lsl	r1, r1, #0x3
	add	r0, r0, #0x4
	add	r1, r1, r0
	ldr	r1, [r1]
	ldr	r3, ._255 + 12  @ byte_3005E30
	ldr	r2, [r3]
	add	r0, r2, #0
	and	r0, r0, r1
	cmp	r0, #0
	beq	._253	@cond_branch
	ldr	r0, ._255 + 16  @ 0xffff
	eor	r1, r1, r0
	and	r2, r2, r1
	b	._254
._256:
	.align	2, 0
._255:
	.word	gUnknown_Debug_2038A0C
	.word	gMain
	.word	gUnknown_Debug_083F80D8
	.word	byte_3005E30
	.word	0xffff
._253:
	orr	r2, r2, r1
._254:
	str	r2, [r3]
	ldrb	r0, [r4, #0x4]
	bl	debug_80C4C44
	ldr	r1, ._258       @ gTasks
	lsl	r0, r6, #0x2
	add	r0, r0, r6
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._258 + 4   @ debug_80C4A60
	str	r1, [r0]
	b	._274
._259:
	.align	2, 0
._258:
	.word	gTasks
	.word	debug_80C4A60+1
._252:
	mov	r0, #0x2
	and	r0, r0, r2
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	cmp	r4, #0
	beq	._260	@cond_branch
	str	r3, [sp]
	mov	r0, #0x0
	mov	r1, #0x10
	mov	r2, #0x1
	mov	r3, #0xe
	bl	debug_80C38E4
	ldr	r0, ._262       @ gTasks
	lsl	r1, r6, #0x2
	add	r1, r1, r6
	lsl	r1, r1, #0x3
	add	r1, r1, r0
	ldr	r0, ._262 + 4   @ debug_80C48A0
	b	._261
._263:
	.align	2, 0
._262:
	.word	gTasks
	.word	debug_80C48A0+1
._260:
	mov	r0, #0x8
	and	r0, r0, r2
	cmp	r0, #0
	beq	._264	@cond_branch
	mov	r0, #0x5
	bl	PlaySE
	ldr	r1, ._266       @ gTrainerBattleOpponent
	mov	r2, #0x80
	lsl	r2, r2, #0x3
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r1, ._266 + 4   @ 0x2017000
	ldrb	r2, [r1, #0x1]
	mov	r0, #0x11
	neg	r0, r0
	and	r0, r0, r2
	strb	r0, [r1, #0x1]
	mov	r0, #0xac
	strb	r0, [r1, #0x2]
	mov	r0, #0xff
	strb	r0, [r1, #0x3]
	strb	r4, [r1, #0x9]
	strb	r4, [r1, #0xa]
	strb	r4, [r1, #0xb]
	strb	r4, [r1, #0xc]
	ldr	r1, ._266 + 8   @ gTasks
	lsl	r0, r6, #0x2
	add	r0, r0, r6
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._266 + 12  @ debug_80C4F48
	str	r1, [r0]
	b	._274
._267:
	.align	2, 0
._266:
	.word	gTrainerBattleOpponent
	.word	0x2017000
	.word	gTasks
	.word	debug_80C4F48+1
._264:
	mov	r0, r8
	ldrh	r1, [r0, #0x30]
	mov	r0, #0x40
	and	r0, r0, r1
	cmp	r0, #0
	beq	._268	@cond_branch
	lsl	r0, r5, #0x18
	cmp	r0, #0
	beq	._269	@cond_branch
	sub	r0, r5, #1
	strb	r0, [r7, #0x5]
	b	._277
._269:
	mov	r1, ip
	lsl	r0, r1, #0x18
	cmp	r0, #0
	beq	._277	@cond_branch
	mov	r0, ip
	sub	r0, r0, #0x1
	b	._272
._268:
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	beq	._274	@cond_branch
	lsl	r0, r5, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x8
	bhi	._274	@cond_branch
	cmp	r0, #0x4
	bhi	._275	@cond_branch
	add	r0, r5, #1
	strb	r0, [r7, #0x5]
	b	._277
._275:
	mov	r2, ip
	lsl	r0, r2, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x3
	bhi	._277	@cond_branch
	mov	r0, ip
	add	r0, r0, #0x1
._272:
	strb	r0, [r7, #0x4]
	ldrb	r0, [r7, #0x4]
	bl	debug_80C4C44
._277:
	ldr	r0, ._278       @ gTasks
	lsl	r1, r6, #0x2
	add	r1, r1, r6
	lsl	r1, r1, #0x3
	add	r1, r1, r0
	ldr	r0, ._278 + 4   @ debug_80C4A60
._261:
	str	r0, [r1]
._274:
	add	sp, sp, #0x4
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._279:
	.align	2, 0
._278:
	.word	gTasks
	.word	debug_80C4A60+1

	thumb_func_end debug_80C4AC4

	thumb_func_start debug_80C4C44
debug_80C4C44:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff0
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	sl, r0
	mov	r2, #0x0
	mov	r5, sp
._290:
	mov	r0, sl
	add	r6, r2, r0
	add	r4, r6, #0
	add	r1, r2, #1
	mov	r8, r1
	cmp	r4, #0x9
	bgt	._280	@cond_branch
	mov	r3, #0x0
	ldr	r1, ._288       @ gUnknown_Debug_083F80D8
	lsl	r0, r4, #0x3
	add	r0, r0, r1
	ldr	r0, [r0]
	ldrb	r0, [r0]
	ldr	r7, ._288 + 4   @ byte_3005E30
	mov	r9, r7
	lsl	r2, r2, #0x1
	mov	ip, r2
	cmp	r0, #0xff
	beq	._282	@cond_branch
	add	r7, r1, #0
._283:
	add	r0, r3, #3
	mov	r1, sp
	add	r2, r1, r0
	lsl	r1, r6, #0x3
	add	r1, r1, r7
	ldr	r0, [r1]
	add	r0, r0, r3
	ldrb	r0, [r0]
	strb	r0, [r2]
	add	r0, r3, #1
	lsl	r0, r0, #0x18
	lsr	r3, r0, #0x18
	ldr	r0, [r1]
	add	r0, r0, r3
	ldrb	r0, [r0]
	cmp	r0, #0xff
	beq	._282	@cond_branch
	cmp	r3, #0xb
	bls	._283	@cond_branch
._282:
	cmp	r3, #0xb
	bhi	._284	@cond_branch
	mov	r1, #0x0
._285:
	add	r0, r3, #3
	add r0, r0, sp
	strb	r1, [r0]
	add	r0, r3, #1
	lsl	r0, r0, #0x18
	lsr	r3, r0, #0x18
	cmp	r3, #0xb
	bls	._285	@cond_branch
._284:
	mov	r0, #0xff
	strb	r0, [r5, #0xe]
	mov	r0, #0xfc
	strb	r0, [r5]
	mov	r2, #0x1
	strb	r2, [r5, #0x1]
	add	r1, r2, #0
	LSL	r1, r4
	mov	r3, r9
	ldr	r0, [r3]
	and	r0, r0, r1
	cmp	r0, #0
	beq	._286	@cond_branch
	mov	r0, #0x3
	strb	r0, [r5, #0x2]
	b	._287
._289:
	.align	2, 0
._288:
	.word	gUnknown_Debug_083F80D8
	.word	byte_3005E30
._286:
	strb	r2, [r5, #0x2]
._287:
	mov	r2, ip
	add	r2, r2, #0x3
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	mov	r0, sp
	mov	r1, #0x11
	bl	Menu_PrintText
._280:
	mov	r7, r8
	lsl	r0, r7, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0x5
	bls	._290	@cond_branch
	add	sp, sp, #0x10
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0

	thumb_func_end debug_80C4C44

	thumb_func_start debug_80C4D14
debug_80C4D14:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xffffffd0
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	ldr	r1, ._291       @ gUnknown_Debug_083F81C7
	mov	r0, sp
	mov	r2, #0xf
	bl	memcpy
	add	r5, sp, #0x10
	ldr	r1, ._291 + 4   @ gUnknown_Debug_083F81F5
	add	r0, r5, #0
	mov	r2, #0xd
	bl	memcpy
	add	r6, sp, #0x20
	ldr	r1, ._291 + 8   @ gUnknown_Debug_083F8202
	add	r0, r6, #0
	mov	r2, #0xf
	bl	memcpy
	mov	r0, #0x0
	mov	r1, #0x10
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	mov	r0, sp
	mov	r1, #0x1
	mov	r2, #0x11
	bl	Menu_PrintText
	add	r0, r5, #0
	mov	r1, #0x14
	mov	r2, #0x11
	bl	Menu_PrintText
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0xe
	mov	r3, #0xf
	bl	Menu_DrawStdWindowFrame
	add	r0, r6, #0
	mov	r1, #0x2
	mov	r2, #0x1
	bl	Menu_PrintText
	ldr	r0, ._291 + 12  @ gUnknown_Debug_2038A0C
	ldrb	r0, [r0, #0x6]
	bl	debug_80C4F00
	mov	r0, #0xf
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0xf
	bl	Menu_DrawStdWindowFrame
	ldr	r1, ._291 + 16  @ gTasks
	lsl	r0, r4, #0x2
	add	r0, r0, r4
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._291 + 20  @ debug_80C4DB8
	str	r1, [r0]
	add	sp, sp, #0x30
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._292:
	.align	2, 0
._291:
	.word	gUnknown_Debug_083F81C7
	.word	gUnknown_Debug_083F81F5
	.word	gUnknown_Debug_083F8202
	.word	gUnknown_Debug_2038A0C
	.word	gTasks
	.word	debug_80C4DB8+1

	thumb_func_end debug_80C4D14

	thumb_func_start debug_80C4DB8
debug_80C4DB8:
	push	{r4, lr}
	add	sp, sp, #0xfffffffc
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	ldr	r0, ._293       @ gUnknown_Debug_2038A0C
	ldrb	r0, [r0, #0x7]
	lsl	r0, r0, #0x19
	mov	r1, #0xc0
	lsl	r1, r1, #0x12
	add	r0, r0, r1
	lsr	r0, r0, #0x18
	mov	r1, #0x1
	str	r1, [sp]
	mov	r2, #0x1
	mov	r3, #0xe
	bl	debug_80C38E4
	ldr	r1, ._293 + 4   @ 0x4000042
	ldr	r2, ._293 + 8   @ 0x177
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x4
	add	r2, r2, #0x8
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r1, ._293 + 12  @ gTasks
	lsl	r0, r4, #0x2
	add	r0, r0, r4
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._293 + 16  @ debug_80C4E18
	str	r1, [r0]
	add	sp, sp, #0x4
	pop	{r4}
	pop	{r0}
	bx	r0
._294:
	.align	2, 0
._293:
	.word	gUnknown_Debug_2038A0C
	.word	0x4000042
	.word	0x177
	.word	gTasks
	.word	debug_80C4E18+1

	thumb_func_end debug_80C4DB8

	thumb_func_start debug_80C4E18
debug_80C4E18:
	push	{r4, r5, r6, r7, lr}
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	ldr	r5, ._297       @ gUnknown_Debug_2038A0C
	ldrb	r3, [r5, #0x6]
	ldrb	r2, [r5, #0x7]
	add	r0, r3, r2
	lsl	r0, r0, #0x18
	lsr	r6, r0, #0x18
	ldr	r7, ._297 + 4   @ gMain
	ldrh	r1, [r7, #0x2e]
	mov	r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	._295	@cond_branch
	ldr	r0, ._297 + 8   @ gTasks
	lsl	r1, r4, #0x2
	add	r1, r1, r4
	lsl	r1, r1, #0x3
	add	r1, r1, r0
	ldr	r0, ._297 + 12  @ debug_80C42B8
	b	._296
._298:
	.align	2, 0
._297:
	.word	gUnknown_Debug_2038A0C
	.word	gMain
	.word	gTasks
	.word	debug_80C42B8+1
._295:
	mov	r0, #0x8
	and	r0, r0, r1
	cmp	r0, #0
	bne	._299	@cond_branch
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._300	@cond_branch
._299:
	mov	r0, #0x5
	bl	PlaySE
	ldr	r2, ._302       @ gBattleTerrain
	ldr	r1, ._302 + 4   @ gUnknown_Debug_083F814C
	lsl	r0, r6, #0x3
	add	r0, r0, r1
	ldrb	r0, [r0, #0x4]
	strb	r0, [r2]
	ldr	r1, ._302 + 8   @ gTasks
	lsl	r0, r4, #0x2
	add	r0, r0, r4
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._302 + 12  @ debug_80C5158
	str	r1, [r0]
	b	._310
._303:
	.align	2, 0
._302:
	.word	gBattleTerrain
	.word	gUnknown_Debug_083F814C
	.word	gTasks
	.word	debug_80C5158+1
._300:
	ldrh	r1, [r7, #0x30]
	mov	r0, #0x40
	and	r0, r0, r1
	cmp	r0, #0
	beq	._304	@cond_branch
	lsl	r0, r2, #0x18
	cmp	r0, #0
	beq	._305	@cond_branch
	sub	r0, r2, #1
	strb	r0, [r5, #0x7]
	b	._313
._305:
	lsl	r0, r3, #0x18
	cmp	r0, #0
	beq	._313	@cond_branch
	sub	r0, r3, #1
	b	._308
._304:
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	beq	._310	@cond_branch
	lsl	r0, r2, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x7
	bhi	._310	@cond_branch
	cmp	r0, #0x4
	bhi	._311	@cond_branch
	add	r0, r2, #1
	strb	r0, [r5, #0x7]
	b	._313
._311:
	lsl	r0, r3, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x2
	bhi	._313	@cond_branch
	add	r0, r3, #1
._308:
	strb	r0, [r5, #0x6]
	ldrb	r0, [r5, #0x6]
	bl	debug_80C4F00
._313:
	ldr	r0, ._314       @ gTasks
	lsl	r1, r4, #0x2
	add	r1, r1, r4
	lsl	r1, r1, #0x3
	add	r1, r1, r0
	ldr	r0, ._314 + 4   @ debug_80C4DB8
._296:
	str	r0, [r1]
._310:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._315:
	.align	2, 0
._314:
	.word	gTasks
	.word	debug_80C4DB8+1

	thumb_func_end debug_80C4E18

	thumb_func_start debug_80C4F00
debug_80C4F00:
	push	{r4, r5, r6, lr}
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	mov	r0, #0x1
	mov	r1, #0x3
	mov	r2, #0xd
	mov	r3, #0xe
	bl	Menu_BlankWindowRect
	mov	r4, #0x0
	ldr	r6, ._318       @ gUnknown_Debug_083F814C
._317:
	cmp	r4, #0x8
	bhi	._316	@cond_branch
	add	r0, r4, r5
	lsl	r0, r0, #0x3
	add	r0, r0, r6
	ldr	r0, [r0]
	lsl	r2, r4, #0x19
	mov	r1, #0xc0
	lsl	r1, r1, #0x12
	add	r2, r2, r1
	lsr	r2, r2, #0x18
	mov	r1, #0x2
	bl	Menu_PrintText
._316:
	add	r0, r4, #1
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	cmp	r4, #0x5
	bls	._317	@cond_branch
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._319:
	.align	2, 0
._318:
	.word	gUnknown_Debug_083F814C

	thumb_func_end debug_80C4F00

	thumb_func_start debug_80C4F48
debug_80C4F48:
	push	{r4, r5, r6, lr}
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6}
	add	sp, sp, #0xffffffc4
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	ldr	r1, ._320       @ gUnknown_Debug_083F8211
	mov	r0, sp
	mov	r2, #0x11
	bl	memcpy
	add	r6, sp, #0x14
	ldr	r1, ._320 + 4   @ gUnknown_Debug_083F81A0
	add	r0, r6, #0
	mov	r2, #0xd
	bl	memcpy
	add	r5, sp, #0x24
	ldr	r1, ._320 + 8   @ gUnknown_Debug_083F8222
	add	r0, r5, #0
	mov	r2, #0xd
	bl	memcpy
	add	r0, sp, #0x34
	mov	r9, r0
	ldr	r1, ._320 + 12  @ gUnknown_Debug_083F822F
	mov	r2, #0x4
	bl	memcpy
	add	r0, sp, #0x38
	mov	r8, r0
	ldr	r1, ._320 + 16  @ gUnknown_Debug_083F8233
	mov	r2, #0x4
	bl	memcpy
	mov	r0, #0x0
	mov	r1, #0x10
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	mov	r0, sp
	mov	r1, #0x1
	mov	r2, #0x11
	bl	Menu_PrintText
	add	r0, r6, #0
	mov	r1, #0x14
	mov	r2, #0x11
	bl	Menu_PrintText
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0xe
	mov	r3, #0xf
	bl	Menu_DrawStdWindowFrame
	add	r0, r5, #0
	mov	r1, #0x2
	mov	r2, #0x1
	bl	Menu_PrintText
	mov	r0, #0x1
	mov	r1, #0x3
	mov	r2, #0xd
	mov	r3, #0xe
	bl	Menu_BlankWindowRect
	add	r0, r5, #0
	mov	r1, #0x2
	mov	r2, #0x1
	bl	Menu_PrintText
	mov	r0, r9
	mov	r1, #0x2
	mov	r2, #0x3
	bl	Menu_PrintText
	mov	r0, r8
	mov	r1, #0x2
	mov	r2, #0x5
	bl	Menu_PrintText
	mov	r0, #0xf
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0xf
	bl	Menu_DrawStdWindowFrame
	ldr	r1, ._320 + 20  @ gTasks
	lsl	r0, r4, #0x2
	add	r0, r0, r4
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._320 + 24  @ debug_80C5038
	str	r1, [r0]
	add	sp, sp, #0x3c
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._321:
	.align	2, 0
._320:
	.word	gUnknown_Debug_083F8211
	.word	gUnknown_Debug_083F81A0
	.word	gUnknown_Debug_083F8222
	.word	gUnknown_Debug_083F822F
	.word	gUnknown_Debug_083F8233
	.word	gTasks
	.word	debug_80C5038+1

	thumb_func_end debug_80C4F48

	thumb_func_start debug_80C5038
debug_80C5038:
	push	{r4, lr}
	add	sp, sp, #0xfffffffc
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	ldr	r0, ._322       @ gUnknown_Debug_2038A0C
	ldrb	r0, [r0, #0x8]
	lsl	r0, r0, #0x19
	mov	r1, #0xc0
	lsl	r1, r1, #0x12
	add	r0, r0, r1
	lsr	r0, r0, #0x18
	mov	r1, #0x1
	str	r1, [sp]
	mov	r2, #0x1
	mov	r3, #0xe
	bl	debug_80C38E4
	ldr	r1, ._322 + 4   @ 0x4000042
	ldr	r2, ._322 + 8   @ 0x177
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x4
	add	r2, r2, #0x8
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r1, ._322 + 12  @ gTasks
	lsl	r0, r4, #0x2
	add	r0, r0, r4
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._322 + 16  @ debug_80C5098
	str	r1, [r0]
	add	sp, sp, #0x4
	pop	{r4}
	pop	{r0}
	bx	r0
._323:
	.align	2, 0
._322:
	.word	gUnknown_Debug_2038A0C
	.word	0x4000042
	.word	0x177
	.word	gTasks
	.word	debug_80C5098+1

	thumb_func_end debug_80C5038

	thumb_func_start debug_80C5098
debug_80C5098:
	push	{r4, lr}
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	ldr	r1, ._326       @ gMain
	ldrh	r2, [r1, #0x2e]
	mov	r0, #0x2
	and	r0, r0, r2
	add	r3, r1, #0
	cmp	r0, #0
	beq	._324	@cond_branch
	ldr	r0, ._326 + 4   @ gTasks
	lsl	r1, r4, #0x2
	add	r1, r1, r4
	lsl	r1, r1, #0x3
	add	r1, r1, r0
	ldr	r0, ._326 + 8   @ debug_80C47BC
	str	r0, [r1]
	b	._339
._327:
	.align	2, 0
._326:
	.word	gMain
	.word	gTasks
	.word	debug_80C47BC+1
._324:
	mov	r0, #0x8
	and	r0, r0, r2
	cmp	r0, #0
	bne	._328	@cond_branch
	mov	r0, #0x1
	and	r0, r0, r2
	cmp	r0, #0
	beq	._329	@cond_branch
._328:
	mov	r0, #0x5
	bl	PlaySE
	ldr	r1, ._331       @ gSaveBlock2
	ldr	r0, ._331 + 4   @ gUnknown_Debug_2038A0C
	ldrb	r0, [r0, #0x8]
	strb	r0, [r1, #0x8]
	ldr	r1, ._331 + 8   @ gTasks
	lsl	r0, r4, #0x2
	add	r0, r0, r4
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._331 + 12  @ debug_80C42B8
	b	._330
._332:
	.align	2, 0
._331:
	.word	gSaveBlock2
	.word	gUnknown_Debug_2038A0C
	.word	gTasks
	.word	debug_80C42B8+1
._329:
	ldrh	r1, [r3, #0x30]
	mov	r0, #0x40
	and	r0, r0, r1
	cmp	r0, #0
	beq	._334	@cond_branch
	ldr	r1, ._336       @ gUnknown_Debug_2038A0C
	ldrb	r0, [r1, #0x8]
	cmp	r0, #0
	beq	._334	@cond_branch
	sub	r0, r0, #0x1
	b	._335
._337:
	.align	2, 0
._336:
	.word	gUnknown_Debug_2038A0C
._334:
	ldrh	r1, [r3, #0x30]
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	beq	._339	@cond_branch
	ldr	r1, ._340       @ gUnknown_Debug_2038A0C
	ldrb	r0, [r1, #0x8]
	cmp	r0, #0
	bne	._339	@cond_branch
	add	r0, r0, #0x1
._335:
	strb	r0, [r1, #0x8]
	ldr	r1, ._340 + 4   @ gTasks
	lsl	r0, r4, #0x2
	add	r0, r0, r4
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._340 + 8   @ debug_80C5038
._330:
	str	r1, [r0]
._339:
	pop	{r4}
	pop	{r0}
	bx	r0
._341:
	.align	2, 0
._340:
	.word	gUnknown_Debug_2038A0C
	.word	gTasks
	.word	debug_80C5038+1

	thumb_func_end debug_80C5098

	thumb_func_start debug_80C5158
debug_80C5158:
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	ldr	r2, ._342       @ gTasks
	lsl	r1, r0, #0x2
	add	r1, r1, r0
	lsl	r1, r1, #0x3
	add	r1, r1, r2
	ldr	r0, ._342 + 4   @ debug_80C5174
	str	r0, [r1]
	bx	lr
._343:
	.align	2, 0
._342:
	.word	gTasks
	.word	debug_80C5174+1

	thumb_func_end debug_80C5158

	thumb_func_start debug_80C5174
debug_80C5174:
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	ldr	r2, ._344       @ gTasks
	lsl	r1, r0, #0x2
	add	r1, r1, r0
	lsl	r1, r1, #0x3
	add	r1, r1, r2
	ldr	r0, ._344 + 4   @ debug_80C5190
	str	r0, [r1]
	bx	lr
._345:
	.align	2, 0
._344:
	.word	gTasks
	.word	debug_80C5190+1

	thumb_func_end debug_80C5174

	thumb_func_start debug_80C5190
debug_80C5190:
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	ldr	r2, ._346       @ gTasks
	lsl	r1, r0, #0x2
	add	r1, r1, r0
	lsl	r1, r1, #0x3
	add	r1, r1, r2
	ldr	r0, ._346 + 4   @ debug_80C51AC
	str	r0, [r1]
	bx	lr
._347:
	.align	2, 0
._346:
	.word	gTasks
	.word	debug_80C51AC+1

	thumb_func_end debug_80C5190

	thumb_func_start debug_80C51AC
debug_80C51AC:
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	ldr	r2, ._348       @ gTasks
	lsl	r1, r0, #0x2
	add	r1, r1, r0
	lsl	r1, r1, #0x3
	add	r1, r1, r2
	ldr	r0, ._348 + 4   @ debug_80C51C8
	str	r0, [r1]
	bx	lr
._349:
	.align	2, 0
._348:
	.word	gTasks
	.word	debug_80C51C8+1

	thumb_func_end debug_80C51AC

	thumb_func_start debug_80C51C8
debug_80C51C8:
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	ldr	r2, ._350       @ gTasks
	lsl	r1, r0, #0x2
	add	r1, r1, r0
	lsl	r1, r1, #0x3
	add	r1, r1, r2
	ldr	r0, ._350 + 4   @ debug_80C51E4
	str	r0, [r1]
	bx	lr
._351:
	.align	2, 0
._350:
	.word	gTasks
	.word	debug_80C51E4+1

	thumb_func_end debug_80C51C8

	thumb_func_start debug_80C51E4
debug_80C51E4:
	push	{lr}
	bl	sub_80408BC
	ldr	r0, ._352       @ gMain
	ldr	r1, ._352 + 4   @ debug_80C41A8
	str	r1, [r0, #0x8]
	ldr	r0, ._352 + 8   @ unref_sub_800D684
	bl	SetMainCallback2
	pop	{r0}
	bx	r0
._353:
	.align	2, 0
._352:
	.word	gMain
	.word	debug_80C41A8+1
	.word	unref_sub_800D684+1

	thumb_func_end debug_80C51E4

	thumb_func_start debug_80C5208
debug_80C5208:
	push	{r4, r5, r6, lr}
	ldr	r1, ._355       @ gUnknown_Debug_2038A1C
	ldr	r0, ._355 + 4   @ 0x2018000
	str	r0, [r1]
	mov	r3, #0x0
	add	r6, r1, #0
	ldr	r4, ._355 + 8   @ gSaveBlock2
	add	r5, r6, #0
	mov	r2, #0x0
._354:
	ldr	r0, [r5]
	lsl	r1, r3, #0x2
	add	r0, r0, #0x64
	add	r0, r0, r1
	str	r2, [r0]
	add	r0, r3, #1
	lsl	r0, r0, #0x10
	lsr	r3, r0, #0x10
	cmp	r3, #0x3f
	bls	._354	@cond_branch
	ldr	r2, [r6]
	mov	r0, #0xfc
	str	r0, [r2, #0x64]
	ldrb	r1, [r4, #0xa]
	ldrb	r0, [r4, #0xb]
	lsl	r0, r0, #0x8
	orr	r1, r1, r0
	ldrb	r0, [r4, #0xc]
	lsl	r0, r0, #0x10
	orr	r1, r1, r0
	ldrb	r0, [r4, #0xd]
	lsl	r0, r0, #0x18
	orr	r1, r1, r0
	str	r1, [r2, #0x70]
	bl	Random
	add	r4, r0, #0
	bl	Random
	ldr	r1, [r6]
	lsl	r4, r4, #0x10
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	orr	r4, r4, r0
	str	r4, [r1, #0x74]
	mov	r0, #0x1
	str	r0, [r1, #0x68]
	str	r0, [r1, #0x6c]
	bl	debug_80C5C94
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._356:
	.align	2, 0
._355:
	.word	gUnknown_Debug_2038A1C
	.word	0x2018000
	.word	gSaveBlock2

	thumb_func_end debug_80C5208

	thumb_func_start debug_80C527C
debug_80C527C:
	push	{r4, r5, r6, r7, lr}
	add	r6, r0, #0
	mov	r5, #0x0
	ldr	r7, ._359       @ gPlayerPartyCount
._361:
	mov	r0, #0x64
	add	r1, r5, #0
	mul	r1, r1, r0
	ldr	r0, ._359 + 4   @ gPlayerParty
	add	r4, r1, r0
	add	r0, r4, #0
	mov	r1, #0xb
	mov	r2, #0x0
	bl	GetMonData
	cmp	r0, #0
	bne	._357	@cond_branch
	add	r0, r4, #0
	add	r1, r6, #0
	mov	r2, #0x64
	bl	memcpy
	add	r0, r5, #1
	strb	r0, [r7]
	mov	r0, #0x0
	b	._358
._360:
	.align	2, 0
._359:
	.word	gPlayerPartyCount
	.word	gPlayerParty
._357:
	add	r0, r5, #1
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	cmp	r5, #0x5
	bls	._361	@cond_branch
	ldr	r0, ._362       @ gUnknown_Debug_2038A1C
	ldr	r0, [r0]
	bl	SendMonToPC
	mov	r0, #0x1
._358:
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
._363:
	.align	2, 0
._362:
	.word	gUnknown_Debug_2038A1C

	thumb_func_end debug_80C527C

	thumb_func_start InitCreatePokemon
InitCreatePokemon:
	push	{r4, r5, lr}
	add	sp, sp, #0xffffffd4
	ldr	r1, ._364       @ gUnknown_Debug_083F8733
	add	r0, sp, #0x4
	mov	r2, #0x25
	bl	memcpy
	bl	debug_80C35DC
	mov	r0, #0x1
	neg	r0, r0
	mov	r4, #0x0
	str	r4, [sp]
	mov	r1, #0x0
	mov	r2, #0x10
	mov	r3, #0x0
	bl	BeginNormalPaletteFade
	ldr	r0, ._364 + 4   @ 0x4000050
	mov	r5, #0x0
	strh	r4, [r0]
	add	r0, r0, #0x2
	strh	r4, [r0]
	add	r0, r0, #0x2
	strh	r4, [r0]
	ldr	r3, ._364 + 8   @ 0x4000208
	ldrh	r2, [r3]
	strh	r4, [r3]
	ldr	r4, ._364 + 12  @ 0x4000200
	ldrh	r0, [r4]
	mov	r1, #0x1
	orr	r0, r0, r1
	strh	r0, [r4]
	strh	r2, [r3]
	ldr	r2, ._364 + 16  @ 0x4000004
	ldrh	r0, [r2]
	mov	r1, #0x8
	orr	r0, r0, r1
	strh	r0, [r2]
	ldr	r0, ._364 + 20  @ debug_80C3758
	bl	SetVBlankCallback
	ldr	r0, ._364 + 24  @ debug_80C370C
	bl	SetMainCallback2
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x3
	bl	Menu_DrawStdWindowFrame
	add	r0, sp, #0x4
	mov	r1, #0x1
	mov	r2, #0x1
	bl	Menu_PrintText
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	mov	r2, #0x8a
	lsl	r2, r2, #0x5
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r0, ._364 + 28  @ debug_80C53A4
	mov	r1, #0x0
	bl	CreateTask
	bl	debug_80C5208
	ldr	r1, ._364 + 32  @ gUnknown_Debug_2038A1C
	ldr	r0, [r1]
	mov	r2, #0xb4
	lsl	r2, r2, #0x1
	add	r0, r0, r2
	strb	r5, [r0]
	ldr	r0, [r1]
	ldr	r1, ._364 + 36  @ 0x169
	add	r0, r0, r1
	strb	r5, [r0]
	add	sp, sp, #0x2c
	pop	{r4, r5}
	pop	{r0}
	bx	r0
._365:
	.align	2, 0
._364:
	.word	gUnknown_Debug_083F8733
	.word	0x4000050
	.word	0x4000208
	.word	0x4000200
	.word	0x4000004
	.word	debug_80C3758+1
	.word	debug_80C370C+1
	.word	debug_80C53A4+1
	.word	gUnknown_Debug_2038A1C
	.word	0x169

	thumb_func_end InitCreatePokemon

	thumb_func_start debug_80C53A4
debug_80C53A4:
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	ldr	r2, ._366       @ gTasks
	lsl	r1, r0, #0x2
	add	r1, r1, r0
	lsl	r1, r1, #0x3
	add	r1, r1, r2
	ldr	r0, ._366 + 4   @ debug_80C53C0
	str	r0, [r1]
	bx	lr
._367:
	.align	2, 0
._366:
	.word	gTasks
	.word	debug_80C53C0+1

	thumb_func_end debug_80C53A4

	thumb_func_start debug_80C53C0
debug_80C53C0:
	push	{r4, lr}
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	bl	debug_80C6384
	mov	r0, #0x0
	bl	debug_80C627C
	ldr	r1, ._368       @ gTasks
	lsl	r0, r4, #0x2
	add	r0, r0, r4
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._368 + 4   @ debug_80C53F0
	str	r1, [r0]
	pop	{r4}
	pop	{r0}
	bx	r0
._369:
	.align	2, 0
._368:
	.word	gTasks
	.word	debug_80C53F0+1

	thumb_func_end debug_80C53C0

	thumb_func_start debug_80C53F0
debug_80C53F0:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffffc
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	ldr	r0, ._372       @ gMain
	ldrh	r1, [r0, #0x2e]
	mov	r2, #0x1
	and	r2, r2, r1
	add	r4, r0, #0
	cmp	r2, #0
	beq	._370	@cond_branch
	ldr	r0, ._372 + 4   @ gUnknown_Debug_2038A1C
	ldr	r3, [r0]
	mov	r0, #0xb2
	lsl	r0, r0, #0x1
	add	r2, r3, r0
	ldr	r1, ._372 + 8   @ gUnknown_Debug_083F8698
	mov	r4, #0xb4
	lsl	r4, r4, #0x1
	add	r0, r3, r4
	ldrb	r0, [r0]
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r6, ._372 + 12  @ 0x169
	add	r1, r3, r6
	ldrb	r1, [r1]
	ldr	r0, [r0]
	add	r0, r0, r1
	ldrb	r1, [r0]
	lsl	r1, r1, #0x2
	add	r0, r3, #0
	add	r0, r0, #0x64
	add	r0, r0, r1
	ldr	r0, [r0]
	str	r0, [r2]
	mov	r0, #0xb5
	lsl	r0, r0, #0x1
	add	r1, r3, r0
	mov	r0, #0x0
	strb	r0, [r1]
	bl	debug_80C643C
	ldr	r1, ._372 + 16  @ gTasks
	lsl	r0, r5, #0x2
	add	r0, r0, r5
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._372 + 20  @ debug_80C55E4
	b	._375
._373:
	.align	2, 0
._372:
	.word	gMain
	.word	gUnknown_Debug_2038A1C
	.word	gUnknown_Debug_083F8698
	.word	0x169
	.word	gTasks
	.word	debug_80C55E4+1
._370:
	mov	r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	._374	@cond_branch
	mov	r0, #0x1
	neg	r0, r0
	str	r2, [sp]
	mov	r1, #0x0
	mov	r2, #0x0
	mov	r3, #0x10
	bl	BeginNormalPaletteFade
	ldr	r0, ._376       @ debug_80C370C
	bl	SetMainCallback2
	ldr	r1, ._376 + 4   @ gTasks
	lsl	r0, r5, #0x2
	add	r0, r0, r5
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._376 + 8   @ debug_80C373C
	b	._375
._377:
	.align	2, 0
._376:
	.word	debug_80C370C+1
	.word	gTasks
	.word	debug_80C373C+1
._374:
	mov	r0, #0x8
	and	r0, r0, r1
	cmp	r0, #0
	beq	._378	@cond_branch
	mov	r0, #0x5
	bl	PlaySE
	bl	debug_80C5FFC
	ldr	r0, ._381       @ gUnknown_Debug_2038A1C
	ldr	r0, [r0]
	bl	debug_80C527C
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	mov	r0, #0x3
	mov	r1, #0x8
	mov	r2, #0x1a
	mov	r3, #0xb
	bl	Menu_DrawStdWindowFrame
	cmp	r4, #0
	beq	._379	@cond_branch
	ldr	r0, ._381 + 4   @ gUnknown_Debug_083F872A
	mov	r1, #0x4
	mov	r2, #0x9
	bl	Menu_PrintText
	b	._380
._382:
	.align	2, 0
._381:
	.word	gUnknown_Debug_2038A1C
	.word	gUnknown_Debug_083F872A
._379:
	ldr	r0, ._384       @ gUnknown_Debug_083F8720
	mov	r1, #0x4
	mov	r2, #0x9
	bl	Menu_PrintText
._380:
	ldr	r0, ._384 + 4   @ gTasks
	lsl	r1, r5, #0x2
	add	r1, r1, r5
	lsl	r1, r1, #0x3
	add	r1, r1, r0
	ldr	r0, ._384 + 8   @ debug_80C5708
	str	r0, [r1]
	b	._400
._385:
	.align	2, 0
._384:
	.word	gUnknown_Debug_083F8720
	.word	gTasks
	.word	debug_80C5708+1
._378:
	mov	r0, #0x4
	and	r0, r0, r1
	cmp	r0, #0
	beq	._386	@cond_branch
	ldr	r0, ._388       @ gUnknown_Debug_2038A1C
	ldr	r0, [r0]
	ldr	r4, [r0, #0x64]
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	add	r0, r4, #0
	mov	r1, #0x2
	bl	GetSetPokedexFlag
	add	r0, r4, #0
	mov	r1, #0x3
	bl	GetSetPokedexFlag
	mov	r0, #0x5
	bl	PlaySE
	b	._400
._389:
	.align	2, 0
._388:
	.word	gUnknown_Debug_2038A1C
._386:
	mov	r0, #0x40
	and	r0, r0, r1
	cmp	r0, #0
	beq	._390	@cond_branch
	mov	r0, #0x2
	bl	debug_80C627C
	b	._400
._390:
	mov	r0, #0x80
	and	r0, r0, r1
	lsl	r0, r0, #0x10
	lsr	r3, r0, #0x10
	cmp	r3, #0
	beq	._392	@cond_branch
	mov	r0, #0x1
	bl	debug_80C627C
	b	._400
._392:
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	._395	@cond_branch
	ldr	r2, ._397       @ gUnknown_Debug_2038A1C
	ldr	r0, [r2]
	mov	r6, #0xb4
	lsl	r6, r6, #0x1
	add	r1, r0, r6
	ldrb	r0, [r1]
	cmp	r0, #0
	beq	._395	@cond_branch
	sub	r0, r0, #0x1
	strb	r0, [r1]
	ldr	r0, [r2]
	ldr	r1, ._397 + 4   @ 0x169
	add	r0, r0, r1
	strb	r3, [r0]
	b	._396
._398:
	.align	2, 0
._397:
	.word	gUnknown_Debug_2038A1C
	.word	0x169
._395:
	ldrh	r1, [r4, #0x2e]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._400	@cond_branch
	ldr	r3, ._401       @ gUnknown_Debug_2038A1C
	ldr	r0, [r3]
	mov	r4, #0xb4
	lsl	r4, r4, #0x1
	add	r2, r0, r4
	ldrb	r0, [r2]
	cmp	r0, #0x4
	bhi	._400	@cond_branch
	add	r0, r0, #0x1
	mov	r1, #0x0
	strb	r0, [r2]
	ldr	r0, [r3]
	ldr	r6, ._401 + 4   @ 0x169
	add	r0, r0, r6
	strb	r1, [r0]
._396:
	ldr	r1, ._401 + 8   @ gTasks
	lsl	r0, r5, #0x2
	add	r0, r0, r5
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._401 + 12  @ debug_80C53C0
._375:
	str	r1, [r0]
._400:
	add	sp, sp, #0x4
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._402:
	.align	2, 0
._401:
	.word	gUnknown_Debug_2038A1C
	.word	0x169
	.word	gTasks
	.word	debug_80C53C0+1

	thumb_func_end debug_80C53F0

	thumb_func_start debug_80C55E4
debug_80C55E4:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	lsl	r0, r0, #0x18
	lsr	r3, r0, #0x18
	add	r6, r3, #0
	ldr	r1, ._405       @ gUnknown_Debug_083F8698
	ldr	r2, ._405 + 4   @ gUnknown_Debug_2038A1C
	ldr	r0, [r2]
	mov	ip, r0
	mov	r0, #0xb4
	lsl	r0, r0, #0x1
	add r0, r0, ip
	ldrb	r0, [r0]
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._405 + 8   @ 0x169
	add r1, r1, ip
	ldrb	r1, [r1]
	ldr	r0, [r0]
	add	r0, r0, r1
	ldrb	r5, [r0]
	add	r7, r5, #0
	ldr	r1, ._405 + 12  @ gMain
	ldrh	r4, [r1, #0x2e]
	mov	r0, #0x1
	and	r0, r0, r4
	mov	r8, r2
	add	r2, r1, #0
	cmp	r0, #0
	beq	._403	@cond_branch
	ldr	r0, ._405 + 16  @ gTasks
	lsl	r1, r3, #0x2
	add	r1, r1, r3
	lsl	r1, r1, #0x3
	add	r1, r1, r0
	ldr	r0, ._405 + 20  @ debug_80C53C0
	str	r0, [r1]
	b	._422
._406:
	.align	2, 0
._405:
	.word	gUnknown_Debug_083F8698
	.word	gUnknown_Debug_2038A1C
	.word	0x169
	.word	gMain
	.word	gTasks
	.word	debug_80C53C0+1
._403:
	mov	r0, #0x2
	and	r0, r0, r4
	cmp	r0, #0
	beq	._407	@cond_branch
	lsl	r1, r5, #0x2
	mov	r0, ip
	add	r0, r0, #0x64
	add	r0, r0, r1
	mov	r1, #0xb2
	lsl	r1, r1, #0x1
	add r1, r1, ip
	ldr	r1, [r1]
	str	r1, [r0]
	ldr	r1, ._409       @ gTasks
	lsl	r0, r6, #0x2
	add	r0, r0, r6
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._409 + 4   @ debug_80C53C0
	str	r1, [r0]
	b	._422
._410:
	.align	2, 0
._409:
	.word	gTasks
	.word	debug_80C53C0+1
._407:
	ldrh	r1, [r2, #0x30]
	mov	r0, #0x40
	and	r0, r0, r1
	cmp	r0, #0
	beq	._411	@cond_branch
	mov	r0, #0x1
	b	._412
._411:
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	beq	._413	@cond_branch
	mov	r0, #0x2
._412:
	bl	debug_80C6544
	bl	debug_80C643C
	b	._422
._413:
	ldr	r0, ._419       @ gUnknown_Debug_083F8554
	lsl	r1, r7, #0x3
	add	r0, r0, #0x4
	add	r1, r1, r0
	ldr	r1, [r1]
	ldrb	r0, [r1, #0x9]
	cmp	r0, #0xff
	beq	._422	@cond_branch
	mov	r0, #0x20
	and	r0, r0, r4
	cmp	r0, #0
	beq	._417	@cond_branch
	mov	r0, #0xb5
	lsl	r0, r0, #0x1
	add ip, ip, r0
	mov	r0, ip
	ldrb	r3, [r0]
	ldrb	r0, [r1, #0x9]
	sub	r0, r0, #0x1
	cmp	r3, r0
	bge	._417	@cond_branch
	add	r0, r3, #1
	mov	r1, ip
	strb	r0, [r1]
	bl	debug_80C643C
	b	._422
._420:
	.align	2, 0
._419:
	.word	gUnknown_Debug_083F8554
._417:
	ldrh	r1, [r2, #0x2e]
	mov	r0, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	._422	@cond_branch
	mov	r2, r8
	ldr	r0, [r2]
	mov	r2, #0xb5
	lsl	r2, r2, #0x1
	add	r1, r0, r2
	ldrb	r0, [r1]
	cmp	r0, #0
	beq	._422	@cond_branch
	sub	r0, r0, #0x1
	strb	r0, [r1]
	bl	debug_80C643C
._422:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0

	thumb_func_end debug_80C55E4

	thumb_func_start debug_80C5708
debug_80C5708:
	push	{lr}
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	ldr	r0, ._424       @ gMain
	ldrh	r1, [r0, #0x2e]
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._423	@cond_branch
	ldr	r0, ._424 + 4   @ gTasks
	lsl	r1, r2, #0x2
	add	r1, r1, r2
	lsl	r1, r1, #0x3
	add	r1, r1, r0
	ldr	r0, ._424 + 8   @ debug_80C53C0
	str	r0, [r1]
._423:
	pop	{r0}
	bx	r0
._425:
	.align	2, 0
._424:
	.word	gMain
	.word	gTasks
	.word	debug_80C53C0+1

	thumb_func_end debug_80C5708

	thumb_func_start debug_80C5738
debug_80C5738:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	r6, r0, #0
	lsl	r1, r1, #0x18
	lsr	r4, r1, #0x18
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	mov	r8, r2
	cmp	r4, #0xfe
	bne	._426	@cond_branch
	ldr	r1, ._428       @ gUnknown_Debug_083F850A
	mov	r2, #0x7
	bl	debug_80C689C
	add	r0, r6, #7
	ldr	r7, ._428 + 4   @ gUnknown_Debug_2038A1C
	ldr	r1, [r7]
	add	r1, r1, #0xf0
	ldr	r1, [r1]
	mov	r2, #0x3
	mov	r3, #0x1
	bl	debug_80C6678
	mov	r4, #0x0
	strb	r4, [r6, #0x13]
	strb	r4, [r6, #0x14]
	add	r0, r6, #0
	add	r0, r0, #0x15
	ldr	r1, ._428 + 8   @ gUnknown_Debug_083F8514
	mov	r2, #0x7
	bl	debug_80C689C
	add	r0, r6, #0
	add	r0, r0, #0x1c
	ldr	r1, [r7]
	add	r1, r1, #0xf4
	ldr	r1, [r1]
	mov	r2, #0x3
	mov	r3, #0x1
	bl	debug_80C6678
	add	r0, r6, #0
	add	r0, r0, #0x28
	strb	r4, [r0]
	add	r0, r0, #0x1
	strb	r4, [r0]
	add	r0, r0, #0x1
	ldr	r1, ._428 + 12  @ gUnknown_Debug_083F851C
	mov	r2, #0x9
	bl	debug_80C689C
	add	r0, r6, #0
	add	r0, r0, #0x31
	ldr	r1, [r7]
	add	r1, r1, #0xf8
._431:
	ldr	r1, [r1]
	mov	r2, #0x3
	mov	r3, #0x1
	bl	debug_80C6678
	b	._517
._429:
	.align	2, 0
._428:
	.word	gUnknown_Debug_083F850A
	.word	gUnknown_Debug_2038A1C
	.word	gUnknown_Debug_083F8514
	.word	gUnknown_Debug_083F851C
._426:
	cmp	r4, #0xfd
	bne	._430	@cond_branch
	ldr	r1, ._432       @ gUnknown_Debug_083F8524
	add	r0, r6, #0
	mov	r2, #0x9
	bl	debug_80C689C
	add	r0, r6, #0
	add	r0, r0, #0x9
	ldr	r7, ._432 + 4   @ gUnknown_Debug_2038A1C
	ldr	r1, [r7]
	add	r1, r1, #0xfc
	ldr	r1, [r1]
	mov	r2, #0x3
	mov	r3, #0x1
	bl	debug_80C6678
	mov	r4, #0x0
	strb	r4, [r6, #0x15]
	strb	r4, [r6, #0x16]
	add	r0, r6, #0
	add	r0, r0, #0x17
	ldr	r1, ._432 + 8   @ gUnknown_Debug_083F852D
	mov	r2, #0x9
	bl	debug_80C689C
	add	r0, r6, #0
	add	r0, r0, #0x20
	ldr	r1, [r7]
	mov	r2, #0x80
	lsl	r2, r2, #0x1
	add	r1, r1, r2
	ldr	r1, [r1]
	mov	r2, #0x3
	mov	r3, #0x1
	bl	debug_80C6678
	add	r0, r6, #0
	add	r0, r0, #0x2c
	strb	r4, [r0]
	add	r0, r0, #0x1
	strb	r4, [r0]
	add	r0, r0, #0x1
	ldr	r1, ._432 + 12  @ gUnknown_Debug_083F8537
	mov	r2, #0x9
	bl	debug_80C689C
	add	r0, r6, #0
	add	r0, r0, #0x37
	ldr	r1, [r7]
	mov	r3, #0x82
	lsl	r3, r3, #0x1
	add	r1, r1, r3
	b	._431
._433:
	.align	2, 0
._432:
	.word	gUnknown_Debug_083F8524
	.word	gUnknown_Debug_2038A1C
	.word	gUnknown_Debug_083F852D
	.word	gUnknown_Debug_083F8537
._430:
	mov	r1, #0x0
	lsl	r5, r4, #0x3
	mov	r2, #0x0
._434:
	add	r0, r6, r1
	strb	r2, [r0]
	add	r0, r1, #1
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
	cmp	r1, #0xb
	bls	._434	@cond_branch
	ldr	r0, ._437       @ gUnknown_Debug_083F8554
	add	r0, r5, r0
	ldr	r1, [r0]
	add	r0, r6, #0
	mov	r2, #0xb
	bl	debug_80C689C
	mov	r1, #0xc
	mov	r2, #0xff
._435:
	add	r0, r6, r1
	strb	r2, [r0]
	add	r0, r1, #1
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
	cmp	r1, #0xff
	bls	._435	@cond_branch
	ldr	r0, ._437       @ gUnknown_Debug_083F8554
	add	r0, r0, #0x4
	add	r0, r5, r0
	ldr	r0, [r0]
	ldrb	r2, [r0, #0x9]
	lsl	r0, r2, #0x1a
	lsr	r5, r0, #0x18
	cmp	r4, #0x22
	bhi	._436	@cond_branch
	lsl	r0, r4, #0x2
	ldr	r1, ._437 + 4   @ 
	add	r1, r0, r1
	ldr	r1, [r1]
	add	r7, r0, #0
	mov	pc, r1
._438:
	.align	2, 0
._437:
	.word	gUnknown_Debug_083F8554
	.word	._439
._439:
	.word	._440
	.word	._472
	.word	._472
	.word	._472
	.word	._472
	.word	._445
	.word	._446
	.word	._450
	.word	._450
	.word	._450
	.word	._450
	.word	._451
	.word	._452
	.word	._472
	.word	._472
	.word	._472
	.word	._472
	.word	._472
	.word	._472
	.word	._472
	.word	._472
	.word	._472
	.word	._472
	.word	._472
	.word	._472
	.word	._472
	.word	._472
	.word	._472
	.word	._472
	.word	._472
	.word	._472
	.word	._472
	.word	._472
	.word	._473
	.word	._474
._436:
	mov	r0, #0xff
	strb	r0, [r6]
	b	._517
._440:
	add	r0, r6, #0
	add	r0, r0, #0xa
	ldr	r1, ._477       @ gUnknown_Debug_2038A1C
	mov	r9, r1
	ldr	r1, [r1]
	add	r1, r1, #0x64
	add	r1, r1, r7
	ldr	r1, [r1]
	mov	r3, r8
	bl	debug_80C6678
	add	r1, r5, r6
	mov	r0, #0x0
	strb	r0, [r1, #0xa]
	mov	r0, #0xfc
	strb	r0, [r1, #0xb]
	mov	r0, #0x1
	strb	r0, [r1, #0xc]
	mov	r2, r8
	strb	r2, [r1, #0xd]
	add	r4, r5, #0
	add	r4, r4, #0xe
	add	r4, r6, r4
	mov	r3, r9
	ldr	r0, [r3]
	add	r0, r0, #0x64
	add	r0, r0, r7
	ldrh	r0, [r0]
	bl	NationalPokedexNumToSpecies
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r1, #0xb
	mul	r1, r1, r0
	ldr	r0, ._477 + 4   @ gSpeciesNames
	add	r1, r1, r0
	add	r0, r4, #0
	mov	r2, #0xa
	bl	debug_80C689C
	b	._517
._478:
	.align	2, 0
._477:
	.word	gUnknown_Debug_2038A1C
	.word	gSpeciesNames
._445:
	ldr	r0, ._483       @ gUnknown_Debug_2038A1C
	ldr	r0, [r0]
	add	r0, r0, #0x64
	add	r0, r0, r7
	ldr	r0, [r0]
	cmp	r0, #0x1
	beq	._479	@cond_branch
	cmp	r0, #0x1
	bcc	._480	@cond_branch
	cmp	r0, #0x2
	beq	._481	@cond_branch
	b	._517
._484:
	.align	2, 0
._483:
	.word	gUnknown_Debug_2038A1C
._480:
	add	r0, r6, #0
	add	r0, r0, #0xa
	ldr	r1, ._486       @ gUnknown_Debug_083F8546
	b	._488
._487:
	.align	2, 0
._486:
	.word	gUnknown_Debug_083F8546
._479:
	add	r0, r6, #0
	add	r0, r0, #0xa
	ldr	r1, ._489       @ gUnknown_Debug_083F8541
	b	._488
._490:
	.align	2, 0
._489:
	.word	gUnknown_Debug_083F8541
._481:
	add	r0, r6, #0
	add	r0, r0, #0xa
	ldr	r1, ._492       @ gUnknown_Debug_083F8544
._488:
	mov	r2, #0x2
	bl	debug_80C689C
	b	._517
._493:
	.align	2, 0
._492:
	.word	gUnknown_Debug_083F8544
._450:
	add	r0, r6, #0
	add	r0, r0, #0xa
	ldr	r4, ._495       @ gUnknown_Debug_2038A1C
	ldr	r1, [r4]
	add	r1, r1, #0x64
	add	r1, r1, r7
	ldr	r1, [r1]
	mov	r3, r8
	bl	debug_80C6678
	add	r1, r5, r6
	mov	r0, #0x0
	strb	r0, [r1, #0xa]
	mov	r0, #0xfc
	strb	r0, [r1, #0xb]
	mov	r0, #0x1
	strb	r0, [r1, #0xc]
	mov	r0, r8
	strb	r0, [r1, #0xd]
	add	r0, r5, #0
	add	r0, r0, #0xe
	add	r0, r6, r0
	ldr	r1, [r4]
	add	r1, r1, #0x64
	add	r1, r1, r7
	ldr	r2, [r1]
	mov	r1, #0xd
	mul	r1, r1, r2
	ldr	r2, ._495 + 4   @ gMoveNames
	add	r1, r1, r2
	b	._494
._496:
	.align	2, 0
._495:
	.word	gUnknown_Debug_2038A1C
	.word	gMoveNames
._451:
	add	r0, r6, #0
	add	r0, r0, #0xa
	ldr	r4, ._499       @ gUnknown_Debug_2038A1C
	ldr	r1, [r4]
	add	r1, r1, #0x64
	add	r1, r1, r7
	ldr	r1, [r1]
	mov	r3, r8
	bl	debug_80C6678
	add	r1, r5, r6
	mov	r0, #0x0
	strb	r0, [r1, #0xa]
	mov	r0, #0xfc
	strb	r0, [r1, #0xb]
	mov	r0, #0x1
	strb	r0, [r1, #0xc]
	mov	r2, r8
	strb	r2, [r1, #0xd]
	ldr	r0, [r4]
	add	r0, r0, #0x64
	add	r0, r0, r7
	ldr	r0, [r0]
	cmp	r0, #0
	beq	._497	@cond_branch
	add	r4, r5, #0
	add	r4, r4, #0xe
	add	r4, r6, r4
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	bl	ItemId_GetName
	add	r1, r0, #0
	add	r0, r4, #0
	b	._498
._500:
	.align	2, 0
._499:
	.word	gUnknown_Debug_2038A1C
._497:
	add	r0, r5, #0
	add	r0, r0, #0xe
	add	r0, r6, r0
	ldr	r1, ._502       @ gUnknown_Debug_083F8541
._498:
	mov	r2, #0x9
	bl	debug_80C689C
	b	._517
._503:
	.align	2, 0
._502:
	.word	gUnknown_Debug_083F8541
._452:
	add	r6, r6, #0xc
	ldr	r4, ._505       @ gUnknown_Debug_2038A1C
	ldr	r0, [r4]
	ldr	r0, [r0, #0x64]
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	bl	NationalPokedexNumToSpecies
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	ldr	r1, [r4]
	add	r1, r1, #0x64
	add	r1, r1, r7
	ldrb	r1, [r1]
	bl	GetAbilityBySpecies
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r1, #0xd
	mul	r1, r1, r0
	ldr	r0, ._505 + 4   @ gAbilityNames
	add	r1, r1, r0
	add	r0, r6, #0
._494:
	mov	r2, #0xc
	bl	debug_80C689C
	b	._517
._506:
	.align	2, 0
._505:
	.word	gUnknown_Debug_2038A1C
	.word	gAbilityNames
._474:
	add	r0, r6, #0
	add	r0, r0, #0xa
	ldr	r2, ._508       @ gUnknown_Debug_083F86E8
	ldr	r1, ._508 + 4   @ gUnknown_Debug_2038A1C
	ldr	r1, [r1]
	add	r1, r1, #0x64
	add	r1, r1, r7
	ldr	r1, [r1]
	lsl	r1, r1, #0x3
	add	r1, r1, r2
	ldr	r1, [r1]
	b	._514
._509:
	.align	2, 0
._508:
	.word	gUnknown_Debug_083F86E8
	.word	gUnknown_Debug_2038A1C
._472:
	add	r0, r6, #0
	add	r0, r0, #0xc
	ldr	r1, ._511       @ gUnknown_Debug_2038A1C
	ldr	r1, [r1]
	add	r1, r1, #0x64
	add	r1, r1, r7
	ldr	r1, [r1]
	mov	r3, r8
	bl	debug_80C6678
	b	._517
._512:
	.align	2, 0
._511:
	.word	gUnknown_Debug_2038A1C
._473:
	ldr	r0, ._515       @ gUnknown_Debug_2038A1C
	ldr	r0, [r0]
	add	r0, r0, #0x64
	add	r0, r0, r7
	ldr	r0, [r0]
	cmp	r0, #0
	beq	._513	@cond_branch
	add	r0, r6, #0
	add	r0, r0, #0xa
	ldr	r1, ._515 + 4   @ gUnknown_Debug_083F854A
	b	._514
._516:
	.align	2, 0
._515:
	.word	gUnknown_Debug_2038A1C
	.word	gUnknown_Debug_083F854A
._513:
	add	r0, r6, #0
	add	r0, r0, #0xa
	ldr	r1, ._518       @ gUnknown_Debug_083F854D
._514:
	mov	r2, #0x4
	bl	debug_80C689C
	b	._517
._519:
	.align	2, 0
._518:
	.word	gUnknown_Debug_083F854D
._446:
	add	r0, r6, #0
	add	r0, r0, #0xa
	ldr	r2, ._520       @ gNatureNames
	ldr	r1, ._520 + 4   @ gUnknown_Debug_2038A1C
	ldr	r1, [r1]
	add	r1, r1, #0x64
	add	r1, r1, r7
	ldr	r1, [r1]
	lsl	r1, r1, #0x2
	add	r1, r1, r2
	ldr	r1, [r1]
	mov	r2, #0x5
	bl	debug_80C689C
._517:
	mov	r0, #0x0
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
._521:
	.align	2, 0
._520:
	.word	gNatureNames
	.word	gUnknown_Debug_2038A1C

	thumb_func_end debug_80C5738

	thumb_func_start debug_80C5B60
debug_80C5B60:
	lsl	r0, r0, #0x18
	ldr	r1, ._522       @ gUnknown_Debug_2038A1C
	ldr	r1, [r1]
	lsr	r0, r0, #0x16
	add	r1, r1, #0x64
	add	r1, r1, r0
	ldr	r0, [r1]
	bx	lr
._523:
	.align	2, 0
._522:
	.word	gUnknown_Debug_2038A1C

	thumb_func_end debug_80C5B60

	thumb_func_start debug_80C5B74
debug_80C5B74:
	push	{r4, r5, r6, lr}
	add	r6, r0, #0
	lsl	r1, r1, #0x18
	lsr	r2, r1, #0x18
	cmp	r2, #0x18
	bhi	._540	@cond_branch
	lsl	r0, r2, #0x2
	ldr	r1, ._526       @ 
	add	r1, r0, r1
	ldr	r1, [r1]
	add	r3, r0, #0
	mov	pc, r1
._527:
	.align	2, 0
._526:
	.word	._525
._525:
	.word	._532
	.word	._529
	.word	._530
	.word	._532
	.word	._532
	.word	._540
	.word	._540
	.word	._540
	.word	._540
	.word	._540
	.word	._540
	.word	._540
	.word	._540
	.word	._552
	.word	._552
	.word	._552
	.word	._552
	.word	._552
	.word	._552
	.word	._552
	.word	._552
	.word	._552
	.word	._552
	.word	._552
	.word	._552
._540:
	ldr	r0, ._554       @ gUnknown_Debug_2038A1C
	ldr	r0, [r0]
	lsl	r1, r2, #0x2
	add	r0, r0, #0x64
	add	r0, r0, r1
	str	r6, [r0]
	b	._562
._555:
	.align	2, 0
._554:
	.word	gUnknown_Debug_2038A1C
._532:
	ldr	r0, ._557       @ gUnknown_Debug_2038A1C
	ldr	r0, [r0]
	add	r0, r0, #0x64
	add	r0, r0, r3
	str	r6, [r0]
	bl	debug_80C5C94
	b	._562
._558:
	.align	2, 0
._557:
	.word	gUnknown_Debug_2038A1C
._529:
	ldr	r4, ._560       @ gUnknown_Debug_2038A1C
	ldr	r1, [r4]
	add	r0, r1, #0
	add	r0, r0, #0x64
	add	r0, r0, r3
	str	r6, [r0]
	ldr	r0, [r1, #0x64]
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	bl	NationalPokedexNumToSpecies
	ldr	r5, [r4]
	ldr	r4, ._560 + 4   @ gExperienceTables
	lsl	r2, r6, #0x2
	ldr	r3, ._560 + 8   @ gBaseStats
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	lsl	r1, r0, #0x3
	sub	r1, r1, r0
	lsl	r1, r1, #0x2
	add	r1, r1, r3
	ldrb	r1, [r1, #0x13]
	mov	r0, #0xca
	lsl	r0, r0, #0x1
	mul	r0, r0, r1
	add	r2, r2, r0
	add	r2, r2, r4
	ldr	r0, [r2]
	str	r0, [r5, #0x6c]
	bl	debug_80C5C94
	b	._562
._561:
	.align	2, 0
._560:
	.word	gUnknown_Debug_2038A1C
	.word	gExperienceTables
	.word	gBaseStats
._530:
	ldr	r0, ._563       @ gUnknown_Debug_2038A1C
	ldr	r0, [r0]
	add	r0, r0, #0x64
	add	r0, r0, r3
	str	r6, [r0]
	bl	debug_80C5DEC
	b	._562
._564:
	.align	2, 0
._563:
	.word	gUnknown_Debug_2038A1C
._552:
	ldr	r0, ._565       @ gUnknown_Debug_2038A1C
	ldr	r0, [r0]
	add	r0, r0, #0x64
	add	r0, r0, r3
	str	r6, [r0]
	bl	debug_80C5EF4
._562:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._566:
	.align	2, 0
._565:
	.word	gUnknown_Debug_2038A1C

	thumb_func_end debug_80C5B74

	thumb_func_start debug_80C5C94
debug_80C5C94:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffff0
	ldr	r6, ._567       @ gUnknown_Debug_2038A1C
	ldr	r2, [r6]
	add	r0, r2, #0
	add	r0, r0, #0x98
	ldr	r4, [r0]
	mov	r1, #0x1f
	and	r4, r4, r1
	add	r0, r0, #0x8
	ldr	r0, [r0]
	and	r0, r0, r1
	lsl	r0, r0, #0x5
	orr	r4, r4, r0
	add	r0, r2, #0
	add	r0, r0, #0xa8
	ldr	r0, [r0]
	and	r0, r0, r1
	lsl	r0, r0, #0xa
	orr	r4, r4, r0
	add	r0, r2, #0
	add	r0, r0, #0xb0
	ldr	r0, [r0]
	and	r0, r0, r1
	lsl	r0, r0, #0xf
	orr	r4, r4, r0
	add	r0, r2, #0
	add	r0, r0, #0xb8
	ldr	r0, [r0]
	and	r0, r0, r1
	lsl	r0, r0, #0x14
	orr	r4, r4, r0
	add	r0, r2, #0
	add	r0, r0, #0xc0
	ldr	r0, [r0]
	and	r0, r0, r1
	lsl	r0, r0, #0x19
	orr	r4, r4, r0
	ldr	r0, [r2, #0x64]
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	bl	NationalPokedexNumToSpecies
	add	r1, r0, #0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	ldr	r0, [r6]
	ldr	r2, [r0, #0x68]
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	mov	r5, #0x1
	str	r5, [sp]
	ldr	r3, [r0, #0x74]
	str	r3, [sp, #0x4]
	str	r5, [sp, #0x8]
	ldr	r3, [r0, #0x70]
	str	r3, [sp, #0xc]
	add	r3, r4, #0
	bl	CreateMon
	ldr	r0, [r6]
	bl	GetMonGender
	ldr	r1, [r6]
	add	r0, r0, #0x2
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	str	r0, [r1, #0x78]
	add	r0, r1, #0
	bl	GetNature
	ldr	r1, [r6]
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	str	r0, [r1, #0x7c]
	add	r0, r1, #0
	mov	r1, #0xd
	bl	GetMonData
	add	r2, r0, #0
	ldr	r0, [r6]
	add	r1, r0, #0
	add	r1, r1, #0x80
	str	r2, [r1]
	mov	r1, #0xe
	bl	GetMonData
	add	r2, r0, #0
	ldr	r0, [r6]
	add	r1, r0, #0
	add	r1, r1, #0x84
	str	r2, [r1]
	mov	r1, #0xf
	bl	GetMonData
	add	r2, r0, #0
	ldr	r0, [r6]
	add	r1, r0, #0
	add	r1, r1, #0x88
	str	r2, [r1]
	mov	r1, #0x10
	bl	GetMonData
	add	r2, r0, #0
	ldr	r0, [r6]
	add	r1, r0, #0
	add	r1, r1, #0x8c
	str	r2, [r1]
	mov	r1, #0x19
	bl	GetMonData
	add	r1, r0, #0
	ldr	r0, [r6]
	str	r1, [r0, #0x6c]
	mov	r1, #0x3a
	bl	GetMonData
	add	r2, r0, #0
	ldr	r0, [r6]
	add	r1, r0, #0
	add	r1, r1, #0xf0
	str	r2, [r1]
	mov	r1, #0x3b
	bl	GetMonData
	add	r2, r0, #0
	ldr	r0, [r6]
	add	r1, r0, #0
	add	r1, r1, #0xf4
	str	r2, [r1]
	mov	r1, #0x3c
	bl	GetMonData
	add	r2, r0, #0
	ldr	r0, [r6]
	add	r1, r0, #0
	add	r1, r1, #0xf8
	str	r2, [r1]
	mov	r1, #0x3d
	bl	GetMonData
	add	r2, r0, #0
	ldr	r0, [r6]
	add	r1, r0, #0
	add	r1, r1, #0xfc
	str	r2, [r1]
	mov	r1, #0x3e
	bl	GetMonData
	add	r2, r0, #0
	ldr	r0, [r6]
	mov	r3, #0x80
	lsl	r3, r3, #0x1
	add	r1, r0, r3
	str	r2, [r1]
	mov	r1, #0x3f
	bl	GetMonData
	ldr	r1, [r6]
	mov	r2, #0x82
	lsl	r2, r2, #0x1
	add	r1, r1, r2
	str	r0, [r1]
	add	sp, sp, #0x10
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._568:
	.align	2, 0
._567:
	.word	gUnknown_Debug_2038A1C

	thumb_func_end debug_80C5C94

	thumb_func_start debug_80C5DEC
debug_80C5DEC:
	push	{r4, lr}
	add	sp, sp, #0xfffffffc
	mov	r0, #0x0
	str	r0, [sp]
	ldr	r4, ._569       @ gUnknown_Debug_2038A1C
	ldr	r0, [r4]
	add	r2, r0, #0
	add	r2, r2, #0x6c
	mov	r1, #0x19
	bl	SetMonData
	ldr	r0, [r4]
	mov	r1, #0xd
	mov	r2, sp
	bl	SetMonData
	ldr	r0, [r4]
	mov	r1, #0xe
	mov	r2, sp
	bl	SetMonData
	ldr	r0, [r4]
	mov	r1, #0xf
	mov	r2, sp
	bl	SetMonData
	ldr	r0, [r4]
	mov	r1, #0x10
	mov	r2, sp
	bl	SetMonData
	ldr	r0, [r4]
	bl	CalculateMonStats
	ldr	r0, [r4]
	bl	GiveMonInitialMoveset
	ldr	r0, [r4]
	mov	r1, #0x38
	bl	GetMonData
	add	r1, r0, #0
	ldr	r0, [r4]
	str	r1, [r0, #0x68]
	mov	r1, #0xd
	bl	GetMonData
	add	r2, r0, #0
	ldr	r0, [r4]
	add	r1, r0, #0
	add	r1, r1, #0x80
	str	r2, [r1]
	mov	r1, #0xe
	bl	GetMonData
	add	r2, r0, #0
	ldr	r0, [r4]
	add	r1, r0, #0
	add	r1, r1, #0x84
	str	r2, [r1]
	mov	r1, #0xf
	bl	GetMonData
	add	r2, r0, #0
	ldr	r0, [r4]
	add	r1, r0, #0
	add	r1, r1, #0x88
	str	r2, [r1]
	mov	r1, #0x10
	bl	GetMonData
	add	r2, r0, #0
	ldr	r0, [r4]
	add	r1, r0, #0
	add	r1, r1, #0x8c
	str	r2, [r1]
	mov	r1, #0x3a
	bl	GetMonData
	add	r2, r0, #0
	ldr	r0, [r4]
	add	r1, r0, #0
	add	r1, r1, #0xf0
	str	r2, [r1]
	mov	r1, #0x3b
	bl	GetMonData
	add	r2, r0, #0
	ldr	r0, [r4]
	add	r1, r0, #0
	add	r1, r1, #0xf4
	str	r2, [r1]
	mov	r1, #0x3c
	bl	GetMonData
	add	r2, r0, #0
	ldr	r0, [r4]
	add	r1, r0, #0
	add	r1, r1, #0xf8
	str	r2, [r1]
	mov	r1, #0x3d
	bl	GetMonData
	add	r2, r0, #0
	ldr	r0, [r4]
	add	r1, r0, #0
	add	r1, r1, #0xfc
	str	r2, [r1]
	mov	r1, #0x3e
	bl	GetMonData
	add	r2, r0, #0
	ldr	r0, [r4]
	mov	r3, #0x80
	lsl	r3, r3, #0x1
	add	r1, r0, r3
	str	r2, [r1]
	mov	r1, #0x3f
	bl	GetMonData
	ldr	r1, [r4]
	mov	r2, #0x82
	lsl	r2, r2, #0x1
	add	r1, r1, r2
	str	r0, [r1]
	add	sp, sp, #0x4
	pop	{r4}
	pop	{r0}
	bx	r0
._570:
	.align	2, 0
._569:
	.word	gUnknown_Debug_2038A1C

	thumb_func_end debug_80C5DEC

	thumb_func_start debug_80C5EF4
debug_80C5EF4:
	push	{r4, lr}
	ldr	r4, ._571       @ gUnknown_Debug_2038A1C
	ldr	r0, [r4]
	add	r2, r0, #0
	add	r2, r2, #0x98
	mov	r1, #0x27
	bl	SetMonData
	ldr	r0, [r4]
	add	r2, r0, #0
	add	r2, r2, #0x9c
	mov	r1, #0x1a
	bl	SetMonData
	ldr	r0, [r4]
	add	r2, r0, #0
	add	r2, r2, #0xa0
	mov	r1, #0x28
	bl	SetMonData
	ldr	r0, [r4]
	add	r2, r0, #0
	add	r2, r2, #0xa4
	mov	r1, #0x1b
	bl	SetMonData
	ldr	r0, [r4]
	add	r2, r0, #0
	add	r2, r2, #0xa8
	mov	r1, #0x29
	bl	SetMonData
	ldr	r0, [r4]
	add	r2, r0, #0
	add	r2, r2, #0xac
	mov	r1, #0x1c
	bl	SetMonData
	ldr	r0, [r4]
	add	r2, r0, #0
	add	r2, r2, #0xb0
	mov	r1, #0x2a
	bl	SetMonData
	ldr	r0, [r4]
	add	r2, r0, #0
	add	r2, r2, #0xb4
	mov	r1, #0x1d
	bl	SetMonData
	ldr	r0, [r4]
	add	r2, r0, #0
	add	r2, r2, #0xb8
	mov	r1, #0x2b
	bl	SetMonData
	ldr	r0, [r4]
	add	r2, r0, #0
	add	r2, r2, #0xbc
	mov	r1, #0x1e
	bl	SetMonData
	ldr	r0, [r4]
	add	r2, r0, #0
	add	r2, r2, #0xc0
	mov	r1, #0x2c
	bl	SetMonData
	ldr	r0, [r4]
	add	r2, r0, #0
	add	r2, r2, #0xc4
	mov	r1, #0x1f
	bl	SetMonData
	ldr	r0, [r4]
	bl	CalculateMonStats
	ldr	r0, [r4]
	mov	r1, #0x3a
	bl	GetMonData
	add	r2, r0, #0
	ldr	r0, [r4]
	add	r1, r0, #0
	add	r1, r1, #0xf0
	str	r2, [r1]
	mov	r1, #0x3b
	bl	GetMonData
	add	r2, r0, #0
	ldr	r0, [r4]
	add	r1, r0, #0
	add	r1, r1, #0xf4
	str	r2, [r1]
	mov	r1, #0x3c
	bl	GetMonData
	add	r2, r0, #0
	ldr	r0, [r4]
	add	r1, r0, #0
	add	r1, r1, #0xf8
	str	r2, [r1]
	mov	r1, #0x3d
	bl	GetMonData
	add	r2, r0, #0
	ldr	r0, [r4]
	add	r1, r0, #0
	add	r1, r1, #0xfc
	str	r2, [r1]
	mov	r1, #0x3e
	bl	GetMonData
	add	r2, r0, #0
	ldr	r0, [r4]
	mov	r3, #0x80
	lsl	r3, r3, #0x1
	add	r1, r0, r3
	str	r2, [r1]
	mov	r1, #0x3f
	bl	GetMonData
	ldr	r1, [r4]
	mov	r2, #0x82
	lsl	r2, r2, #0x1
	add	r1, r1, r2
	str	r0, [r1]
	pop	{r4}
	pop	{r0}
	bx	r0
._572:
	.align	2, 0
._571:
	.word	gUnknown_Debug_2038A1C

	thumb_func_end debug_80C5EF4

	thumb_func_start debug_80C5FFC
debug_80C5FFC:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xffffffe0
	ldr	r1, ._578       @ gUnknown_Debug_083F8758
	add	r0, sp, #0x10
	mov	r2, #0x4
	bl	memcpy
	add	r7, sp, #0x14
	ldr	r1, ._578 + 4   @ gUnknown_Debug_083F875C
	add	r0, r7, #0
	mov	r2, #0x8
	bl	memcpy
	ldr	r5, ._578 + 8   @ gUnknown_Debug_2038A1C
	ldr	r2, [r5]
	add	r0, r2, #0
	add	r0, r0, #0x98
	ldr	r4, [r0]
	mov	r1, #0x1f
	and	r4, r4, r1
	add	r0, r0, #0x8
	ldr	r0, [r0]
	and	r0, r0, r1
	lsl	r0, r0, #0x5
	orr	r4, r4, r0
	add	r0, r2, #0
	add	r0, r0, #0xa8
	ldr	r0, [r0]
	and	r0, r0, r1
	lsl	r0, r0, #0xa
	orr	r4, r4, r0
	add	r0, r2, #0
	add	r0, r0, #0xb0
	ldr	r0, [r0]
	and	r0, r0, r1
	lsl	r0, r0, #0xf
	orr	r4, r4, r0
	add	r0, r2, #0
	add	r0, r0, #0xb8
	ldr	r0, [r0]
	and	r0, r0, r1
	lsl	r0, r0, #0x14
	orr	r4, r4, r0
	add	r0, r2, #0
	add	r0, r0, #0xc0
	ldr	r0, [r0]
	and	r0, r0, r1
	lsl	r0, r0, #0x19
	orr	r4, r4, r0
	ldr	r0, [r2, #0x64]
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	bl	NationalPokedexNumToSpecies
	add	r1, r0, #0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	ldr	r0, [r5]
	ldr	r2, [r0, #0x68]
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	mov	r6, #0x1
	str	r6, [sp]
	ldr	r3, [r0, #0x74]
	str	r3, [sp, #0x4]
	str	r6, [sp, #0x8]
	ldr	r3, [r0, #0x70]
	str	r3, [sp, #0xc]
	add	r3, r4, #0
	bl	CreateMon
	ldr	r2, [r5]
	add	r0, r2, #0
	add	r0, r0, #0x80
	ldr	r0, [r0]
	cmp	r0, #0
	beq	._573	@cond_branch
	lsl	r1, r0, #0x10
	lsr	r1, r1, #0x10
	add	r0, r2, #0
	mov	r2, #0x0
	bl	SetMonMoveSlot
._573:
	ldr	r2, [r5]
	add	r0, r2, #0
	add	r0, r0, #0x84
	ldr	r0, [r0]
	cmp	r0, #0
	beq	._574	@cond_branch
	lsl	r1, r0, #0x10
	lsr	r1, r1, #0x10
	add	r0, r2, #0
	mov	r2, #0x1
	bl	SetMonMoveSlot
._574:
	ldr	r2, [r5]
	add	r0, r2, #0
	add	r0, r0, #0x88
	ldr	r0, [r0]
	cmp	r0, #0
	beq	._575	@cond_branch
	lsl	r1, r0, #0x10
	lsr	r1, r1, #0x10
	add	r0, r2, #0
	mov	r2, #0x2
	bl	SetMonMoveSlot
._575:
	ldr	r2, [r5]
	add	r0, r2, #0
	add	r0, r0, #0x8c
	ldr	r0, [r0]
	cmp	r0, #0
	beq	._576	@cond_branch
	lsl	r1, r0, #0x10
	lsr	r1, r1, #0x10
	add	r0, r2, #0
	mov	r2, #0x3
	bl	SetMonMoveSlot
._576:
	ldr	r0, [r5]
	add	r2, r0, #0
	add	r2, r2, #0x6c
	mov	r1, #0x19
	bl	SetMonData
	ldr	r0, [r5]
	add	r2, r0, #0
	add	r2, r2, #0x98
	mov	r1, #0x27
	bl	SetMonData
	ldr	r0, [r5]
	add	r2, r0, #0
	add	r2, r2, #0x9c
	mov	r1, #0x1a
	bl	SetMonData
	ldr	r0, [r5]
	add	r2, r0, #0
	add	r2, r2, #0xa0
	mov	r1, #0x28
	bl	SetMonData
	ldr	r0, [r5]
	add	r2, r0, #0
	add	r2, r2, #0xa4
	mov	r1, #0x1b
	bl	SetMonData
	ldr	r0, [r5]
	add	r2, r0, #0
	add	r2, r2, #0xa8
	mov	r1, #0x29
	bl	SetMonData
	ldr	r0, [r5]
	add	r2, r0, #0
	add	r2, r2, #0xac
	mov	r1, #0x1c
	bl	SetMonData
	ldr	r0, [r5]
	add	r2, r0, #0
	add	r2, r2, #0xb0
	mov	r1, #0x2a
	bl	SetMonData
	ldr	r0, [r5]
	add	r2, r0, #0
	add	r2, r2, #0xb4
	mov	r1, #0x1d
	bl	SetMonData
	ldr	r0, [r5]
	add	r2, r0, #0
	add	r2, r2, #0xb8
	mov	r1, #0x2b
	bl	SetMonData
	ldr	r0, [r5]
	add	r2, r0, #0
	add	r2, r2, #0xbc
	mov	r1, #0x1e
	bl	SetMonData
	ldr	r0, [r5]
	add	r2, r0, #0
	add	r2, r2, #0xc0
	mov	r1, #0x2c
	bl	SetMonData
	ldr	r0, [r5]
	add	r2, r0, #0
	add	r2, r2, #0xc4
	mov	r1, #0x1f
	bl	SetMonData
	ldr	r0, [r5]
	add	r2, r0, #0
	add	r2, r2, #0xc8
	mov	r1, #0x16
	bl	SetMonData
	ldr	r0, [r5]
	add	r2, r0, #0
	add	r2, r2, #0xcc
	mov	r1, #0x17
	bl	SetMonData
	ldr	r0, [r5]
	add	r2, r0, #0
	add	r2, r2, #0xd0
	mov	r1, #0x18
	bl	SetMonData
	ldr	r0, [r5]
	add	r2, r0, #0
	add	r2, r2, #0xd4
	mov	r1, #0x21
	bl	SetMonData
	ldr	r0, [r5]
	add	r2, r0, #0
	add	r2, r2, #0xd8
	mov	r1, #0x2f
	bl	SetMonData
	ldr	r0, [r5]
	add	r2, r0, #0
	add	r2, r2, #0xdc
	mov	r1, #0x30
	bl	SetMonData
	ldr	r0, [r5]
	add	r2, r0, #0
	add	r2, r2, #0xe0
	mov	r1, #0x20
	bl	SetMonData
	ldr	r0, [r5]
	add	r2, r0, #0
	add	r2, r2, #0xe4
	mov	r1, #0x22
	bl	SetMonData
	ldr	r0, [r5]
	add	r2, r0, #0
	add	r2, r2, #0x90
	mov	r1, #0xc
	bl	SetMonData
	ldr	r0, [r5]
	add	r2, r0, #0
	add	r2, r2, #0x94
	mov	r1, #0x2e
	bl	SetMonData
	ldr	r0, [r5]
	add	r1, r0, #0
	add	r1, r1, #0xec
	ldr	r2, [r1]
	lsl	r2, r2, #0x3
	ldr	r1, ._578 + 12  @ gUnknown_Debug_083F86E8
	add	r2, r2, r1
	mov	r1, #0x37
	bl	SetMonData
	ldr	r0, [r5]
	add	r2, r0, #0
	add	r2, r2, #0xe8
	mov	r1, #0x2d
	bl	SetMonData
	ldr	r1, [r5]
	add	r0, r1, #0
	add	r0, r0, #0xe8
	ldr	r0, [r0]
	cmp	r0, #0
	beq	._577	@cond_branch
	add	r0, r1, #0
	mov	r1, #0x2
	add	r2, sp, #0x10
	bl	SetMonData
	add	r2, sp, #0x1c
	strb	r6, [r2]
	ldr	r0, [r5]
	mov	r1, #0x3
	bl	SetMonData
._577:
	ldr	r0, [r5]
	mov	r1, #0x7
	add	r2, r7, #0
	bl	SetMonData
	mov	r2, sp
	add	r2, r2, #0x1e
	mov	r0, #0xff
	strh	r0, [r2]
	ldr	r0, [r5]
	mov	r1, #0x23
	bl	SetMonData
	ldr	r0, [r5]
	bl	CalculateMonStats
	add	sp, sp, #0x20
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._579:
	.align	2, 0
._578:
	.word	gUnknown_Debug_083F8758
	.word	gUnknown_Debug_083F875C
	.word	gUnknown_Debug_2038A1C
	.word	gUnknown_Debug_083F86E8+0x4

	thumb_func_end debug_80C5FFC

	thumb_func_start debug_80C627C
debug_80C627C:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffff8
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	add	r6, r4, #0
	ldr	r1, ._584       @ gUnknown_Debug_083F7FD4
	mov	r0, sp
	mov	r2, #0x2
	bl	memcpy
	add	r5, sp, #0x4
	ldr	r1, ._584 + 4   @ gUnknown_Debug_083F8764
	add	r0, r5, #0
	mov	r2, #0x2
	bl	memcpy
	cmp	r4, #0x1
	beq	._580	@cond_branch
	cmp	r4, #0x1
	bgt	._581	@cond_branch
	cmp	r4, #0
	beq	._582	@cond_branch
	b	._595
._585:
	.align	2, 0
._584:
	.word	gUnknown_Debug_083F7FD4
	.word	gUnknown_Debug_083F8764
._581:
	cmp	r6, #0x2
	beq	._586	@cond_branch
	b	._595
._582:
	ldr	r0, ._589       @ gUnknown_Debug_2038A1C
	ldr	r0, [r0]
	ldr	r1, ._589 + 4   @ 0x169
	add	r0, r0, r1
	b	._588
._590:
	.align	2, 0
._589:
	.word	gUnknown_Debug_2038A1C
	.word	0x169
._580:
	ldr	r4, ._593       @ gUnknown_Debug_2038A1C
	ldr	r3, [r4]
	ldr	r1, ._593 + 4   @ 0x169
	add	r0, r3, r1
	ldrb	r2, [r0]
	ldr	r1, ._593 + 8   @ gUnknown_Debug_083F8698
	mov	r6, #0xb4
	lsl	r6, r6, #0x1
	add	r0, r3, r6
	ldrb	r0, [r0]
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldrb	r0, [r0, #0x4]
	sub	r0, r0, #0x1
	cmp	r2, r0
	bge	._595	@cond_branch
	lsl	r2, r2, #0x19
	mov	r0, #0xa0
	lsl	r0, r0, #0x13
	add	r2, r2, r0
	lsr	r2, r2, #0x18
	add	r0, r5, #0
	mov	r1, #0x1
	bl	Menu_PrintText
	ldr	r0, [r4]
	ldr	r2, ._593 + 4   @ 0x169
	add	r1, r0, r2
	ldrb	r0, [r1]
	add	r0, r0, #0x1
	strb	r0, [r1]
	ldr	r0, [r4]
	add	r0, r0, r2
._588:
	ldrb	r2, [r0]
	lsl	r2, r2, #0x19
	mov	r6, #0xa0
	lsl	r6, r6, #0x13
	add	r2, r2, r6
	lsr	r2, r2, #0x18
	mov	r0, sp
	mov	r1, #0x1
	bl	Menu_PrintText
	b	._595
._594:
	.align	2, 0
._593:
	.word	gUnknown_Debug_2038A1C
	.word	0x169
	.word	gUnknown_Debug_083F8698
._586:
	ldr	r4, ._596       @ gUnknown_Debug_2038A1C
	ldr	r0, [r4]
	ldr	r2, ._596 + 4   @ 0x169
	add	r1, r0, r2
	ldrb	r0, [r1]
	cmp	r0, #0
	beq	._595	@cond_branch
	add	r2, r0, #0
	lsl	r2, r2, #0x19
	mov	r6, #0xa0
	lsl	r6, r6, #0x13
	add	r2, r2, r6
	lsr	r2, r2, #0x18
	add	r0, r5, #0
	mov	r1, #0x1
	bl	Menu_PrintText
	ldr	r0, [r4]
	ldr	r2, ._596 + 4   @ 0x169
	add	r1, r0, r2
	ldrb	r0, [r1]
	sub	r0, r0, #0x1
	strb	r0, [r1]
	ldr	r0, [r4]
	add	r0, r0, r2
	ldrb	r2, [r0]
	lsl	r2, r2, #0x19
	add	r2, r2, r6
	lsr	r2, r2, #0x18
	mov	r0, sp
	mov	r1, #0x1
	bl	Menu_PrintText
._595:
	add	sp, sp, #0x8
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._597:
	.align	2, 0
._596:
	.word	gUnknown_Debug_2038A1C
	.word	0x169

	thumb_func_end debug_80C627C

	thumb_func_start debug_80C6384
debug_80C6384:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	mov	r0, #0x0
	mov	r1, #0x4
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	mov	r5, #0x0
	ldr	r3, ._600       @ gUnknown_Debug_083F8698
	ldr	r1, ._600 + 4   @ gUnknown_Debug_2038A1C
	ldr	r0, [r1]
	mov	r2, #0xb4
	lsl	r2, r2, #0x1
	add	r0, r0, r2
	ldrb	r0, [r0]
	lsl	r0, r0, #0x3
	add	r0, r0, r3
	ldr	r0, [r0]
	ldrb	r0, [r0]
	cmp	r0, #0xff
	beq	._598	@cond_branch
	add	r4, r1, #0
	ldr	r0, ._600 + 8   @ 0x16b
	mov	r9, r0
	mov	r8, r3
	add	r7, r2, #0
	mov	r6, #0x1
._599:
	ldr	r0, [r4]
	add r0, r0, r9
	mov	r1, #0xfc
	strb	r1, [r0]
	ldr	r0, [r4]
	add	r1, r1, #0x70
	add	r0, r0, r1
	strb	r6, [r0]
	ldr	r0, [r4]
	ldr	r2, ._600 + 12  @ 0x16d
	add	r0, r0, r2
	strb	r6, [r0]
	ldr	r1, [r4]
	add	r2, r2, #0x1
	add	r0, r1, r2
	add	r1, r1, r7
	ldrb	r1, [r1]
	lsl	r1, r1, #0x3
	add r1, r1, r8
	ldr	r1, [r1]
	add	r1, r1, r5
	ldrb	r1, [r1]
	mov	r2, #0x1
	bl	debug_80C5738
	ldr	r0, [r4]
	add r0, r0, r9
	lsl	r2, r5, #0x19
	mov	r1, #0xa0
	lsl	r1, r1, #0x13
	add	r2, r2, r1
	lsr	r2, r2, #0x18
	mov	r1, #0x2
	bl	Menu_PrintText
	add	r0, r5, #1
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	ldr	r0, [r4]
	add	r0, r0, r7
	ldrb	r0, [r0]
	lsl	r0, r0, #0x3
	add r0, r0, r8
	ldr	r0, [r0]
	add	r0, r0, r5
	ldrb	r0, [r0]
	cmp	r0, #0xff
	bne	._599	@cond_branch
._598:
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._601:
	.align	2, 0
._600:
	.word	gUnknown_Debug_083F8698
	.word	gUnknown_Debug_2038A1C
	.word	0x16b
	.word	0x16d

	thumb_func_end debug_80C6384

	thumb_func_start debug_80C643C
debug_80C643C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	mov	r0, #0x2
	mov	r1, #0x5
	mov	r2, #0x1c
	mov	r3, #0x12
	bl	Menu_BlankWindowRect
	mov	r5, #0x0
	ldr	r6, ._605       @ gUnknown_Debug_083F8698
	ldr	r1, ._605 + 4   @ gUnknown_Debug_2038A1C
	ldr	r0, [r1]
	mov	r3, #0xb4
	lsl	r3, r3, #0x1
	add	r0, r0, r3
	ldrb	r0, [r0]
	lsl	r0, r0, #0x3
	add	r0, r0, r6
	ldr	r0, [r0]
	ldrb	r0, [r0]
	cmp	r0, #0xff
	beq	._602	@cond_branch
	add	r4, r1, #0
	mov	r0, #0x1
	mov	r8, r0
._607:
	ldr	r0, [r4]
	ldr	r7, ._605 + 8   @ 0x16b
	add	r2, r0, r7
	mov	r0, #0xfc
	strb	r0, [r2]
	ldr	r0, [r4]
	mov	r2, #0xb6
	lsl	r2, r2, #0x1
	add	r0, r0, r2
	mov	r7, r8
	strb	r7, [r0]
	ldr	r2, [r4]
	ldr	r7, ._605 + 12  @ 0x169
	add	r0, r2, r7
	ldrb	r0, [r0]
	cmp	r5, r0
	bne	._603	@cond_branch
	ldr	r0, ._605 + 16  @ 0x16d
	add	r2, r2, r0
	mov	r0, #0x2
	strb	r0, [r2]
	ldr	r1, [r1]
	mov	r2, #0xb7
	lsl	r2, r2, #0x1
	add	r0, r1, r2
	add	r1, r1, r3
	ldrb	r1, [r1]
	lsl	r1, r1, #0x3
	add	r1, r1, r6
	ldr	r1, [r1]
	add	r1, r1, r5
	ldrb	r1, [r1]
	mov	r2, #0x2
	bl	debug_80C5738
	b	._604
._606:
	.align	2, 0
._605:
	.word	gUnknown_Debug_083F8698
	.word	gUnknown_Debug_2038A1C
	.word	0x16b
	.word	0x169
	.word	0x16d
._603:
	ldr	r3, ._608       @ 0x16d
	add	r0, r2, r3
	mov	r7, r8
	strb	r7, [r0]
	ldr	r1, [r1]
	mov	r2, #0xb7
	lsl	r2, r2, #0x1
	add	r0, r1, r2
	ldr	r2, ._608 + 4   @ gUnknown_Debug_083F8698
	sub	r3, r3, #0x5
	add	r1, r1, r3
	ldrb	r1, [r1]
	lsl	r1, r1, #0x3
	add	r1, r1, r2
	ldr	r1, [r1]
	add	r1, r1, r5
	ldrb	r1, [r1]
	mov	r2, #0x1
	bl	debug_80C5738
._604:
	ldr	r0, [r4]
	ldr	r7, ._608 + 8   @ 0x16b
	add	r0, r0, r7
	lsl	r2, r5, #0x19
	mov	r1, #0xa0
	lsl	r1, r1, #0x13
	add	r2, r2, r1
	lsr	r2, r2, #0x18
	mov	r1, #0x2
	bl	Menu_PrintText
	add	r0, r5, #1
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	ldr	r6, ._608 + 4   @ gUnknown_Debug_083F8698
	add	r1, r4, #0
	ldr	r0, [r4]
	mov	r3, #0xb4
	lsl	r3, r3, #0x1
	add	r0, r0, r3
	ldrb	r0, [r0]
	lsl	r0, r0, #0x3
	add	r0, r0, r6
	ldr	r0, [r0]
	add	r0, r0, r5
	ldrb	r0, [r0]
	cmp	r0, #0xff
	bne	._607	@cond_branch
._602:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._609:
	.align	2, 0
._608:
	.word	0x16d
	.word	gUnknown_Debug_083F8698
	.word	0x16b

	thumb_func_end debug_80C643C

	thumb_func_start debug_80C6544
debug_80C6544:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r9, r0
	ldr	r0, ._614       @ gUnknown_Debug_083F8698
	mov	r8, r0
	ldr	r6, ._614 + 4   @ gUnknown_Debug_2038A1C
	ldr	r1, [r6]
	mov	r5, #0xb4
	lsl	r5, r5, #0x1
	add	r0, r1, r5
	ldrb	r0, [r0]
	lsl	r0, r0, #0x3
	add r0, r0, r8
	ldr	r4, ._614 + 8   @ 0x169
	add	r1, r1, r4
	ldrb	r1, [r1]
	ldr	r0, [r0]
	add	r0, r0, r1
	ldrb	r0, [r0]
	bl	debug_80C5B60
	add	r7, r0, #0
	ldr	r2, ._614 + 12  @ gUnknown_Debug_083F8554
	ldr	r3, [r6]
	add	r5, r3, r5
	ldrb	r0, [r5]
	lsl	r0, r0, #0x3
	add r0, r0, r8
	add	r4, r3, r4
	ldrb	r1, [r4]
	ldr	r0, [r0]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x3
	add	r2, r2, #0x4
	add	r0, r0, r2
	ldr	r1, [r0]
	ldr	r5, [r1]
	ldr	r4, [r1, #0x4]
	ldr	r2, ._614 + 16  @ gUnknown_Debug_083F8768
	mov	r6, #0xb5
	lsl	r6, r6, #0x1
	add	r0, r3, r6
	ldrb	r0, [r0]
	lsl	r0, r0, #0x2
	add	r0, r0, r2
	ldr	r3, [r0]
	ldrb	r0, [r1, #0x8]
	cmp	r0, #0
	bne	._623	@cond_branch
	mov	r0, r9
	cmp	r0, #0x1
	beq	._611	@cond_branch
	cmp	r0, #0x2
	beq	._612	@cond_branch
	b	._623
._615:
	.align	2, 0
._614:
	.word	gUnknown_Debug_083F8698
	.word	gUnknown_Debug_2038A1C
	.word	0x169
	.word	gUnknown_Debug_083F8554
	.word	gUnknown_Debug_083F8768
._611:
	sub	r0, r4, r3
	cmp	r7, r0
	bcs	._616	@cond_branch
	add	r7, r7, r3
	b	._623
._616:
	cmp	r7, r4
	bcc	._622	@cond_branch
	b	._619
._612:
	add	r0, r5, r3
	cmp	r7, r0
	bls	._620	@cond_branch
	sub	r7, r7, r3
	b	._623
._620:
	cmp	r7, r5
	bls	._622	@cond_branch
._619:
	add	r7, r5, #0
	b	._623
._622:
	add	r7, r4, #0
._623:
	ldr	r1, ._624       @ gUnknown_Debug_083F8698
	ldr	r0, ._624 + 4   @ gUnknown_Debug_2038A1C
	ldr	r2, [r0]
	mov	r3, #0xb4
	lsl	r3, r3, #0x1
	add	r0, r2, r3
	ldrb	r0, [r0]
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r6, ._624 + 8   @ 0x169
	add	r1, r2, r6
	ldrb	r1, [r1]
	ldr	r0, [r0]
	add	r0, r0, r1
	ldrb	r1, [r0]
	add	r0, r7, #0
	bl	debug_80C5B74
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._625:
	.align	2, 0
._624:
	.word	gUnknown_Debug_083F8698
	.word	gUnknown_Debug_2038A1C
	.word	0x169

	thumb_func_end debug_80C6544

	thumb_func_start debug_80C6630
debug_80C6630:
	push	{r4, r5, lr}
	add	r4, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	lsl	r3, r3, #0x18
	lsr	r3, r3, #0x18
	mov	r0, #0xfc
	strb	r0, [r4]
	add	r4, r4, #0x1
	mov	r0, #0x1
	strb	r0, [r4]
	add	r4, r4, #0x1
	cmp	r2, #0x2
	bne	._626	@cond_branch
	ldr	r0, ._629       @ gUnknown_Debug_2038A1C
	ldr	r0, [r0]
	mov	r5, #0xb5
	lsl	r5, r5, #0x1
	add	r0, r0, r5
	ldrb	r0, [r0]
	cmp	r3, r0
	beq	._627	@cond_branch
	strb	r2, [r4]
	b	._628
._630:
	.align	2, 0
._629:
	.word	gUnknown_Debug_2038A1C
._627:
	mov	r0, #0x4
._626:
	strb	r0, [r4]
._628:
	add	r0, r1, #0
	add	r0, r0, #0xa1
	strb	r0, [r4, #0x1]
	pop	{r4, r5}
	pop	{r0}
	bx	r0

	thumb_func_end debug_80C6630

	thumb_func_start debug_80C6678
debug_80C6678:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	mov	r9, r0
	add	r6, r1, #0
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	lsl	r3, r3, #0x18
	lsr	r3, r3, #0x18
	mov	r8, r3
	mov	r7, #0x0
	sub	r0, r2, #1
	cmp	r0, #0x9
	bhi	._644	@cond_branch
	lsl	r0, r0, #0x2
	ldr	r1, ._633       @ 
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
._634:
	.align	2, 0
._633:
	.word	._632
._632:
	.word	._635
	.word	._636
	.word	._637
	.word	._638
	.word	._639
	.word	._640
	.word	._641
	.word	._642
	.word	._643
	.word	._644
._644:
	mov	r0, r9
	add	r4, r0, r7
	ldr	r5, ._645       @ 0x3b9aca00
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__udivsi3
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r0, r4, #0
	mov	r2, r8
	mov	r3, #0x9
	bl	debug_80C6630
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__umodsi3
	add	r6, r0, #0
	add	r0, r7, #4
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
._643:
	mov	r1, r9
	add	r4, r1, r7
	ldr	r5, ._645 + 4   @ 0x5f5e100
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__udivsi3
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r0, r4, #0
	mov	r2, r8
	mov	r3, #0x8
	bl	debug_80C6630
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__umodsi3
	add	r6, r0, #0
	add	r0, r7, #4
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
._642:
	mov	r0, r9
	add	r4, r0, r7
	ldr	r5, ._645 + 8   @ 0x989680
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__udivsi3
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r0, r4, #0
	mov	r2, r8
	mov	r3, #0x7
	bl	debug_80C6630
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__umodsi3
	add	r6, r0, #0
	add	r0, r7, #4
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
._641:
	mov	r1, r9
	add	r4, r1, r7
	ldr	r5, ._645 + 12  @ 0xf4240
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__udivsi3
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r0, r4, #0
	mov	r2, r8
	mov	r3, #0x6
	bl	debug_80C6630
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__umodsi3
	add	r6, r0, #0
	add	r0, r7, #4
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
._640:
	mov	r0, r9
	add	r4, r0, r7
	ldr	r5, ._645 + 16  @ 0x186a0
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__udivsi3
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r0, r4, #0
	mov	r2, r8
	mov	r3, #0x5
	bl	debug_80C6630
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__umodsi3
	add	r6, r0, #0
	add	r0, r7, #4
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
._639:
	mov	r1, r9
	add	r4, r1, r7
	ldr	r5, ._645 + 20  @ 0x2710
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__udivsi3
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r0, r4, #0
	mov	r2, r8
	mov	r3, #0x4
	bl	debug_80C6630
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__umodsi3
	add	r6, r0, #0
	add	r0, r7, #4
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
._638:
	mov	r0, r9
	add	r4, r0, r7
	mov	r5, #0xfa
	lsl	r5, r5, #0x2
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__udivsi3
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r0, r4, #0
	mov	r2, r8
	mov	r3, #0x3
	bl	debug_80C6630
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__umodsi3
	add	r6, r0, #0
	add	r0, r7, #4
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
._637:
	mov	r1, r9
	add	r4, r1, r7
	add	r0, r6, #0
	mov	r1, #0x64
	bl	__udivsi3
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r0, r4, #0
	mov	r2, r8
	mov	r3, #0x2
	bl	debug_80C6630
	add	r0, r6, #0
	mov	r1, #0x64
	bl	__umodsi3
	add	r6, r0, #0
	add	r0, r7, #4
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
._636:
	mov	r0, r9
	add	r4, r0, r7
	add	r0, r6, #0
	mov	r1, #0xa
	bl	__udivsi3
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r0, r4, #0
	mov	r2, r8
	mov	r3, #0x1
	bl	debug_80C6630
	add	r0, r6, #0
	mov	r1, #0xa
	bl	__umodsi3
	add	r6, r0, #0
	add	r0, r7, #4
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
._635:
	mov	r1, r9
	add	r0, r1, r7
	lsl	r1, r6, #0x18
	lsr	r1, r1, #0x18
	mov	r2, r8
	mov	r3, #0x0
	bl	debug_80C6630
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._646:
	.align	2, 0
._645:
	.word	0x3b9aca00
	.word	0x5f5e100
	.word	0x989680
	.word	0xf4240
	.word	0x186a0
	.word	0x2710

	thumb_func_end debug_80C6678

	thumb_func_start debug_80C689C
debug_80C689C:
	push	{r4, r5, lr}
	add	r5, r0, #0
	add	r4, r1, #0
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	mov	r3, #0x0
	ldrb	r0, [r4]
	b	._647
._649:
	add	r1, r5, r3
	add	r0, r4, r3
	ldrb	r0, [r0]
	strb	r0, [r1]
	add	r0, r3, #1
	lsl	r0, r0, #0x18
	lsr	r3, r0, #0x18
	add	r0, r4, r3
	ldrb	r0, [r0]
._647:
	cmp	r0, #0xff
	beq	._648	@cond_branch
	cmp	r3, r2
	bcc	._649	@cond_branch
._648:
	pop	{r4, r5}
	pop	{r0}
	bx	r0

	thumb_func_end debug_80C689C

	thumb_func_start debug_80C68CC
debug_80C68CC:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffff8
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	lsl	r1, r1, #0x18
	lsr	r6, r1, #0x18
	lsl	r2, r2, #0x18
	lsr	r5, r2, #0x18
	lsl	r3, r3, #0x18
	lsr	r3, r3, #0x18
	mov	r2, #0x0
	mov	r1, #0x0
._650:
	mov	r7, sp
	add	r0, r7, r2
	strb	r1, [r0]
	add	r0, r2, #1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0x3
	bls	._650	@cond_branch
	mov	r1, sp
	mov	r0, #0xff
	strb	r0, [r1, #0x4]
	cmp	r3, #0x2
	beq	._651	@cond_branch
	cmp	r3, #0x2
	bgt	._652	@cond_branch
	cmp	r3, #0x1
	beq	._653	@cond_branch
	b	._654
._652:
	cmp	r3, #0x3
	beq	._655	@cond_branch
._654:
	mov	r1, sp
	lsr	r0, r4, #0xc
	strb	r0, [r1]
._655:
	mov	r1, sp
	mov	r0, #0xf0
	lsl	r0, r0, #0x4
	and	r0, r0, r4
	lsr	r0, r0, #0x8
	strb	r0, [r1, #0x1]
._651:
	mov	r1, sp
	mov	r0, #0xf0
	and	r0, r0, r4
	lsr	r0, r0, #0x4
	strb	r0, [r1, #0x2]
._653:
	mov	r2, sp
	mov	r1, #0xf
	add	r0, r4, #0
	and	r0, r0, r1
	strb	r0, [r2, #0x3]
	mov	r2, #0x0
._658:
	mov	r0, sp
	add	r1, r0, r2
	ldrb	r0, [r1]
	cmp	r0, #0x9
	bhi	._656	@cond_branch
	add	r0, r0, #0xa1
	b	._657
._656:
	add	r0, r0, #0xb1
._657:
	strb	r0, [r1]
	add	r0, r2, #1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0x3
	bls	._658	@cond_branch
	mov	r0, #0x4
	sub	r0, r0, r3
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	add r0, r0, sp
	add	r1, r6, #0
	add	r2, r5, #0
	bl	Menu_PrintText
	add	sp, sp, #0x8
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0

	thumb_func_end debug_80C68CC

	thumb_func_start InitSeePokemonGraphics
InitSeePokemonGraphics:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffff8
	bl	debug_80C35DC
	ldr	r1, ._659       @ byte_83F88EC
	ldr	r2, ._659 + 4   @ 0x600e000
	ldr	r0, ._659 + 8   @ 0x40000d4
	str	r1, [r0]
	str	r2, [r0, #0x4]
	ldr	r1, ._659 + 12  @ 0x80000400
	str	r1, [r0, #0x8]
	ldr	r0, [r0, #0x8]
	ldr	r0, ._659 + 16  @ word_83F888C
	mov	r1, #0x80
	mov	r2, #0x60
	bl	LoadPalette
	ldr	r1, ._659 + 20  @ 0x7fff
	add	r0, sp, #0x4
	strh	r1, [r0]
	mov	r1, #0x0
	mov	r2, #0x2
	bl	LoadPalette
	mov	r0, #0x1
	neg	r0, r0
	mov	r5, #0x0
	str	r5, [sp]
	mov	r1, #0x0
	mov	r2, #0x10
	mov	r3, #0x0
	bl	BeginNormalPaletteFade
	ldr	r0, ._659 + 24  @ 0x4000040
	mov	r6, #0x0
	strh	r5, [r0]
	add	r0, r0, #0x4
	strh	r5, [r0]
	sub	r0, r0, #0x2
	strh	r5, [r0]
	add	r0, r0, #0x4
	strh	r5, [r0]
	ldr	r1, ._659 + 28  @ 0x4000048
	mov	r0, #0x3f
	strh	r0, [r1]
	add	r1, r1, #0x2
	mov	r0, #0x1f
	strh	r0, [r1]
	add	r1, r1, #0x6
	mov	r0, #0xf1
	strh	r0, [r1]
	ldr	r0, ._659 + 32  @ 0x4000052
	strh	r5, [r0]
	add	r1, r1, #0x4
	mov	r0, #0x7
	strh	r0, [r1]
	ldr	r3, ._659 + 36  @ 0x4000208
	ldrh	r2, [r3]
	strh	r5, [r3]
	ldr	r4, ._659 + 40  @ 0x4000200
	ldrh	r0, [r4]
	mov	r1, #0x1
	orr	r0, r0, r1
	strh	r0, [r4]
	strh	r2, [r3]
	ldr	r0, ._659 + 44  @ debug_80C3758
	bl	SetVBlankCallback
	ldr	r0, ._659 + 48  @ debug_80C370C
	bl	SetMainCallback2
	bl	sub_809D51C
	ldr	r1, ._659 + 52  @ 0x4000008
	ldr	r2, ._659 + 56  @ 0x1f0b
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x2
	ldr	r2, ._659 + 60  @ 0x1e0a
	add	r0, r2, #0
	strh	r0, [r1]
	sub	r1, r1, #0xa
	mov	r2, #0xcd
	lsl	r2, r2, #0x6
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r0, ._659 + 64  @ debug_80C6B00
	mov	r1, #0x0
	bl	CreateTask
	ldr	r1, ._659 + 68  @ gUnknown_Debug_2038A20
	ldr	r0, ._659 + 72  @ 0x2018000
	str	r0, [r1]
	ldr	r1, ._659 + 76  @ 0x115
	strh	r1, [r0]
	strb	r6, [r0, #0x2]
	strb	r6, [r0, #0x3]
	strb	r6, [r0, #0x5]
	strb	r6, [r0, #0x7]
	strb	r6, [r0, #0xa]
	strb	r6, [r0, #0x8]
	ldr	r4, ._659 + 80  @ gSpriteTemplate_83F8874
	add	r0, r4, #0
	mov	r1, #0x6c
	mov	r2, #0x74
	mov	r3, #0x0
	bl	CreateSprite
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	ldr	r6, ._659 + 84  @ gSprites
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r6
	strh	r5, [r0, #0x2e]
	mov	r1, #0x0
	bl	StartSpriteAnim
	add	r0, r4, #0
	mov	r1, #0x6c
	mov	r2, #0x74
	mov	r3, #0x0
	bl	CreateSprite
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r6
	mov	r1, #0x1
	strh	r1, [r0, #0x2e]
	bl	StartSpriteAnim
	add	r0, r4, #0
	mov	r1, #0x6c
	mov	r2, #0x74
	mov	r3, #0x0
	bl	CreateSprite
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r6
	mov	r1, #0x2
	strh	r1, [r0, #0x2e]
	bl	StartSpriteAnim
	add	sp, sp, #0x8
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._660:
	.align	2, 0
._659:
	.word	byte_83F88EC
	.word	0x600e000
	.word	0x40000d4
	.word	0x80000400
	.word	word_83F888C
	.word	0x7fff
	.word	0x4000040
	.word	0x4000048
	.word	0x4000052
	.word	0x4000208
	.word	0x4000200
	.word	debug_80C3758+1
	.word	debug_80C370C+1
	.word	0x4000008
	.word	0x1f0b
	.word	0x1e0a
	.word	debug_80C6B00+1
	.word	gUnknown_Debug_2038A20
	.word	0x2018000
	.word	0x115
	.word	gSpriteTemplate_83F8874
	.word	gSprites

	thumb_func_end InitSeePokemonGraphics

	thumb_func_start debug_80C6B00
debug_80C6B00:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xffffffec
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
	ldr	r1, ._666       @ gUnknown_Debug_083F8815
	mov	r0, sp
	mov	r2, #0x12
	bl	memcpy
	mov	r0, #0xa
	mov	r1, #0x0
	mov	r2, #0xf
	mov	r3, #0x7
	bl	Menu_DrawStdWindowFrame
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x9
	mov	r3, #0x9
	bl	Menu_DrawStdWindowFrame
	mov	r0, #0x0
	mov	r1, #0xa
	mov	r2, #0x9
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	mov	r0, #0x10
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x7
	bl	Menu_DrawStdWindowFrame
	ldr	r0, ._666 + 4   @ gUnknown_Debug_083F87D0
	mov	r1, #0x11
	mov	r2, #0x1
	bl	Menu_PrintText
	ldr	r0, ._666 + 8   @ gUnknown_Debug_083F87D8
	mov	r1, #0x1b
	mov	r2, #0x1
	bl	Menu_PrintText
	ldr	r0, ._666 + 12  @ gUnknown_Debug_083F87E0
	mov	r1, #0x11
	mov	r2, #0x5
	bl	Menu_PrintText
	mov	r0, #0xa
	mov	r1, #0x8
	mov	r2, #0x1d
	mov	r3, #0xc
	bl	Menu_DrawStdWindowFrame
	mov	r2, #0x0
	ldr	r4, ._666 + 16  @ 0x600fa56
	ldr	r0, ._666 + 20  @ 0xa311
	add	r3, r0, #0
._661:
	lsl	r0, r2, #0x1
	add	r0, r0, r4
	add	r1, r2, r3
	strh	r1, [r0]
	add	r0, r2, #1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0xe
	bls	._661	@cond_branch
	mov	r2, #0x0
	ldr	r5, ._666 + 24  @ gUnknown_Debug_083F87F4
	lsl	r6, r7, #0x2
	mov	r8, r6
	ldr	r4, ._666 + 28  @ 0x600f256
	ldr	r0, ._666 + 32  @ 0x8301
	add	r3, r0, #0
._662:
	lsl	r0, r2, #0x1
	add	r0, r0, r4
	add	r1, r2, r3
	strh	r1, [r0]
	add	r0, r2, #1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0xe
	bls	._662	@cond_branch
	add	r0, r5, #0
	mov	r1, #0x14
	mov	r2, #0xa
	bl	Menu_PrintText
	mov	r0, #0xa
	mov	r1, #0xd
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	mov	r1, sp
	mov	r0, #0x23
	strb	r0, [r1]
	mov	r2, #0x0
	ldr	r4, ._666 + 36  @ 0x600f396
	mov	r5, #0x93
	lsl	r5, r5, #0x8
	add	r3, r5, #0
._663:
	lsl	r1, r2, #0x1
	add	r1, r1, r4
	mov	r6, sp
	add	r0, r6, r2
	ldrb	r0, [r0]
	add	r0, r0, r3
	strh	r0, [r1]
	add	r0, r2, #1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0x11
	bls	._663	@cond_branch
	mov	r1, sp
	mov	r0, #0x24
	strb	r0, [r1]
	mov	r2, #0x0
	ldr	r5, ._666 + 40  @ gUnknown_Debug_083F8801
	ldr	r4, ._666 + 44  @ 0x600f3d6
	mov	r0, #0x93
	lsl	r0, r0, #0x8
	add	r3, r0, #0
._664:
	lsl	r1, r2, #0x1
	add	r1, r1, r4
	mov	r6, sp
	add	r0, r6, r2
	ldrb	r0, [r0]
	add	r0, r0, r3
	strh	r0, [r1]
	add	r0, r2, #1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0x11
	bls	._664	@cond_branch
	mov	r1, sp
	mov	r0, #0x25
	strb	r0, [r1]
	mov	r2, #0x0
	ldr	r4, ._666 + 48  @ 0x600f416
	mov	r0, #0x93
	lsl	r0, r0, #0x8
	add	r3, r0, #0
._665:
	lsl	r1, r2, #0x1
	add	r1, r1, r4
	mov	r6, sp
	add	r0, r6, r2
	ldrb	r0, [r0]
	add	r0, r0, r3
	strh	r0, [r1]
	add	r0, r2, #1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0x11
	bls	._665	@cond_branch
	add	r0, r5, #0
	mov	r1, #0xf
	mov	r2, #0x11
	bl	Menu_PrintText
	ldr	r1, ._666 + 52  @ 0x4000040
	ldr	r2, ._666 + 56  @ 0x51ef
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x4
	ldr	r5, ._666 + 60  @ 0x699f
	add	r0, r5, #0
	strh	r0, [r1]
	ldr	r1, ._666 + 64  @ gTasks
	mov	r6, r8
	add	r0, r6, r7
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._666 + 68  @ debug_80C6CB8
	str	r1, [r0]
	add	sp, sp, #0x14
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._667:
	.align	2, 0
._666:
	.word	gUnknown_Debug_083F8815
	.word	gUnknown_Debug_083F87D0
	.word	gUnknown_Debug_083F87D8
	.word	gUnknown_Debug_083F87E0
	.word	0x600fa56
	.word	0xa311
	.word	gUnknown_Debug_083F87F4
	.word	0x600f256
	.word	0x8301
	.word	0x600f396
	.word	gUnknown_Debug_083F8801
	.word	0x600f3d6
	.word	0x600f416
	.word	0x4000040
	.word	0x51ef
	.word	0x699f
	.word	gTasks
	.word	debug_80C6CB8+1

	thumb_func_end debug_80C6B00

	thumb_func_start debug_80C6CB8
debug_80C6CB8:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff4
	mov	sl, r0
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	sl, r0
	ldr	r5, ._668       @ gUnknown_Debug_2038A20
	ldr	r4, [r5]
	ldrh	r2, [r4]
	lsl	r0, r2, #0x3
	ldr	r1, ._668 + 4   @ gMonFrontPicTable
	add	r0, r0, r1
	ldr	r1, ._668 + 8   @ gMonFrontPicCoords
	lsl	r2, r2, #0x2
	add	r2, r2, r1
	ldrb	r1, [r2]
	ldrb	r2, [r2, #0x1]
	ldr	r3, ._668 + 12  @ gUnknown_081FAF4C
	mov	r8, r3
	ldr	r6, [r3]
	str	r6, [sp, #0x8]
	ldr	r3, [r3, #0x4]
	str	r3, [sp]
	ldrh	r3, [r4]
	str	r3, [sp, #0x4]
	add	r3, r6, #0
	bl	DecompressPicFromTable_2
	ldr	r0, [r5]
	ldrh	r0, [r0]
	lsl	r0, r0, #0x3
	ldr	r7, ._668 + 16  @ gMonPaletteTable
	add	r0, r0, r7
	bl	LoadCompressedObjectPalette
	ldr	r0, [r5]
	ldrh	r0, [r0]
	mov	r1, #0x1
	bl	GetMonSpriteTemplate_803C56C
	ldr	r0, ._668 + 20  @ gUnknown_02024E8C
	mov	r1, #0x28
	mov	r2, #0x28
	mov	r3, #0x0
	bl	CreateSprite
	ldr	r1, [r5]
	strb	r0, [r1, #0x2]
	ldr	r2, [r5]
	ldrb	r1, [r2, #0x2]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	ldr	r1, ._668 + 24  @ gSprites
	add	r0, r0, r1
	ldr	r3, ._668 + 28  @ debug_69
	mov	r9, r3
	str	r3, [r0]
	ldrb	r0, [r2, #0x2]
	lsl	r1, r0, #0x4
	add	r1, r1, r0
	lsl	r1, r1, #0x2
	ldr	r6, ._668 + 32  @ gSprites
	add	r1, r1, r6
	ldrb	r2, [r1, #0x5]
	mov	r6, #0xd
	neg	r6, r6
	add	r0, r6, #0
	and	r0, r0, r2
	strb	r0, [r1, #0x5]
	ldr	r4, [r5]
	ldrh	r2, [r4]
	lsl	r0, r2, #0x3
	ldr	r1, ._668 + 36  @ gMonBackPicTable
	add	r0, r0, r1
	ldr	r1, ._668 + 40  @ gMonBackPicCoords
	lsl	r2, r2, #0x2
	add	r2, r2, r1
	ldrb	r1, [r2]
	ldrb	r2, [r2, #0x1]
	mov	r7, r8
	ldr	r3, [r7, #0x8]
	str	r3, [sp]
	ldrh	r3, [r4]
	str	r3, [sp, #0x4]
	ldr	r3, [sp, #0x8]
	bl	DecompressPicFromTable_2
	ldr	r0, [r5]
	ldrh	r0, [r0]
	lsl	r0, r0, #0x3
	ldr	r1, ._668 + 16  @ gMonPaletteTable
	add	r0, r0, r1
	bl	LoadCompressedObjectPalette
	ldr	r0, [r5]
	ldrh	r0, [r0]
	mov	r1, #0x2
	bl	GetMonSpriteTemplate_803C56C
	ldr	r0, ._668 + 20  @ gUnknown_02024E8C
	mov	r1, #0x28
	mov	r2, #0x78
	mov	r3, #0x0
	bl	CreateSprite
	ldr	r1, [r5]
	strb	r0, [r1, #0x3]
	ldr	r2, [r5]
	ldrb	r1, [r2, #0x3]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	ldr	r3, ._668 + 24  @ gSprites
	add	r0, r0, r3
	mov	r7, r9
	str	r7, [r0]
	ldrb	r1, [r2, #0x3]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	ldr	r1, ._668 + 32  @ gSprites
	add	r0, r0, r1
	ldrb	r1, [r0, #0x5]
	and	r6, r6, r1
	strb	r6, [r0, #0x5]
	ldr	r0, [r5]
	ldrh	r0, [r0]
	ldr	r1, ._668 + 44  @ sub_809D62C
	mov	r2, #0x0
	str	r2, [sp]
	str	r2, [sp, #0x4]
	mov	r2, #0x68
	mov	r3, #0x2c
	bl	CreateMonIcon
	ldr	r1, [r5]
	strb	r0, [r1, #0x4]
	ldr	r0, [r5]
	ldrh	r0, [r0]
	bl	SpeciesToNationalPokedexNum
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r2, #0xff
	lsl	r2, r2, #0x2
	mov	r1, #0x2
	bl	sub_8091738
	ldr	r1, ._668 + 48  @ 0x600f858
	ldr	r3, ._668 + 52  @ 0xf3fc
	add	r0, r3, #0
	strh	r0, [r1]
	add	r1, r1, #0x2
	ldr	r6, ._668 + 56  @ 0xf3fd
	add	r0, r6, #0
	strh	r0, [r1]
	add	r1, r1, #0x3e
	ldr	r7, ._668 + 60  @ 0xf3fe
	add	r0, r7, #0
	strh	r0, [r1]
	add	r1, r1, #0x2
	ldr	r2, ._668 + 64  @ 0xf3ff
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r0, [r5]
	ldrh	r0, [r0]
	mov	r1, #0x11
	mov	r2, #0x3
	bl	debug_80C3800
	ldr	r0, [r5]
	ldrh	r0, [r0]
	mov	r1, #0x1a
	mov	r2, #0x5
	bl	debug_80C376C
	ldr	r2, [r5]
	ldrb	r1, [r2, #0x2]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	ldr	r3, ._668 + 32  @ gSprites
	add	r0, r0, r3
	ldrb	r0, [r0, #0x5]
	lsr	r0, r0, #0x4
	strb	r0, [r2, #0x6]
	ldr	r0, [r5]
	ldrb	r0, [r0, #0x6]
	lsl	r0, r0, #0x5
	ldr	r4, ._668 + 68  @ gPlttBufferUnfaded
	add	r0, r0, r4
	ldr	r6, ._668 + 72  @ 0xffffff00
	add	r1, r4, r6
	mov	r2, #0x10
	bl	CpuSet
	ldr	r0, [r5]
	ldrb	r0, [r0, #0x6]
	lsl	r0, r0, #0x5
	add	r0, r0, r4
	ldr	r1, ._668 + 76  @ gPlttBufferFaded
	mov	r2, #0x10
	bl	CpuSet
	ldr	r1, ._668 + 80  @ gTasks
	mov	r7, sl
	lsl	r0, r7, #0x2
	add r0, r0, sl
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._668 + 84  @ debug_80C6EE8
	str	r1, [r0]
	ldr	r0, [r5]
	mov	r1, #0x0
	strb	r1, [r0, #0x9]
	bl	StopCryAndClearCrySongs
	ldr	r0, [r5]
	ldrh	r0, [r0]
	mov	r1, #0x0
	bl	PlayCry1
	add	sp, sp, #0xc
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._669:
	.align	2, 0
._668:
	.word	gUnknown_Debug_2038A20
	.word	gMonFrontPicTable
	.word	gMonFrontPicCoords
	.word	gUnknown_081FAF4C
	.word	gMonPaletteTable
	.word	gUnknown_02024E8C
	.word	gSprites+0x1c
	.word	debug_69+1
	.word	gSprites
	.word	gMonBackPicTable
	.word	gMonBackPicCoords
	.word	sub_809D62C+1
	.word	0x600f858
	.word	0xf3fc
	.word	0xf3fd
	.word	0xf3fe
	.word	0xf3ff
	.word	gPlttBufferUnfaded+0x200
	.word	0xffffff00
	.word	gPlttBufferFaded+0x100
	.word	gTasks
	.word	debug_80C6EE8+1

	thumb_func_end debug_80C6CB8

	thumb_func_start debug_80C6EE8
debug_80C6EE8:
	push	{r4, r5, r6, lr}
	add	r6, r0, #0
	lsl	r6, r6, #0x18
	lsr	r6, r6, #0x18
	ldr	r4, ._670       @ gPlttBufferUnfaded
	ldr	r5, ._670 + 4   @ gUnknown_Debug_2038A20
	ldr	r1, [r5]
	add	r1, r1, #0x10
	add	r0, r4, #0
	mov	r2, #0x10
	bl	CpuSet
	ldr	r0, ._670 + 8   @ 0xffffff00
	add	r4, r4, r0
	ldr	r3, [r5]
	ldrb	r0, [r3, #0x7]
	add	r0, r0, #0x81
	lsl	r0, r0, #0x1
	add	r0, r0, r4
	ldrh	r4, [r0]
	mov	r1, #0x1f
	and	r1, r1, r4
	ldrb	r2, [r3, #0xc]
	mov	r0, #0x20
	neg	r0, r0
	and	r0, r0, r2
	orr	r0, r0, r1
	strb	r0, [r3, #0xc]
	ldr	r3, [r5]
	mov	r1, #0xf8
	lsl	r1, r1, #0x2
	and	r1, r1, r4
	ldrh	r2, [r3, #0xc]
	ldr	r0, ._670 + 12  @ 0xfffffc1f
	and	r0, r0, r2
	orr	r0, r0, r1
	strh	r0, [r3, #0xc]
	mov	r1, #0xf8
	lsl	r1, r1, #0x7
	and	r1, r1, r4
	lsr	r1, r1, #0x8
	ldrb	r2, [r3, #0xd]
	mov	r0, #0x7d
	neg	r0, r0
	and	r0, r0, r2
	orr	r0, r0, r1
	strb	r0, [r3, #0xd]
	ldr	r2, [r5]
	ldrb	r1, [r2, #0xd]
	mov	r0, #0x7f
	and	r0, r0, r1
	strb	r0, [r2, #0xd]
	ldr	r0, [r5]
	ldrb	r0, [r0, #0x7]
	add	r0, r0, #0x1
	mov	r1, #0xb
	mov	r2, #0xa
	mov	r3, #0x2
	bl	debug_80C68CC
	ldr	r0, ._670 + 16  @ gUnknown_Debug_083F8813
	mov	r1, #0xd
	mov	r2, #0xa
	bl	Menu_PrintText
	add	r0, r4, #0
	mov	r1, #0xe
	mov	r2, #0xa
	mov	r3, #0x4
	bl	debug_80C68CC
	ldr	r1, ._670 + 20  @ gTasks
	lsl	r0, r6, #0x2
	add	r0, r0, r6
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._670 + 24  @ debug_80C6FA8
	str	r1, [r0]
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._671:
	.align	2, 0
._670:
	.word	gPlttBufferUnfaded+0x100
	.word	gUnknown_Debug_2038A20
	.word	0xffffff00
	.word	0xfffffc1f
	.word	gUnknown_Debug_083F8813
	.word	gTasks
	.word	debug_80C6FA8+1

	thumb_func_end debug_80C6EE8

	thumb_func_start debug_80C6FA8
debug_80C6FA8:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffffc
	lsl	r0, r0, #0x18
	lsr	r6, r0, #0x18
	ldr	r1, ._674       @ gMain
	ldrh	r2, [r1, #0x2e]
	mov	r0, #0x2
	and	r0, r0, r2
	add	r4, r1, #0
	cmp	r0, #0
	beq	._672	@cond_branch
	mov	r0, #0x5
	bl	PlaySE
	mov	r0, #0x1
	neg	r0, r0
	mov	r1, #0x0
	str	r1, [sp]
	mov	r2, #0x0
	mov	r3, #0x10
	bl	BeginNormalPaletteFade
	ldr	r0, ._674 + 4   @ debug_80C370C
	bl	SetMainCallback2
	ldr	r1, ._674 + 8   @ gTasks
	lsl	r0, r6, #0x2
	add	r0, r0, r6
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._674 + 12  @ debug_80C373C
	str	r1, [r0]
	b	._703
._675:
	.align	2, 0
._674:
	.word	gMain
	.word	debug_80C370C+1
	.word	gTasks
	.word	debug_80C373C+1
._672:
	ldrh	r1, [r4, #0x30]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._676	@cond_branch
	ldr	r4, ._678       @ gUnknown_Debug_2038A20
	ldr	r0, [r4]
	ldrh	r1, [r0]
	mov	r0, #0x0
	b	._677
._679:
	.align	2, 0
._678:
	.word	gUnknown_Debug_2038A20
._676:
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	._680	@cond_branch
	ldr	r4, ._682       @ gUnknown_Debug_2038A20
	ldr	r0, [r4]
	ldrh	r1, [r0]
	mov	r0, #0x1
._677:
	bl	debug_80C3878
	ldr	r1, [r4]
	strh	r0, [r1]
	ldr	r1, ._682 + 4   @ gTasks
	lsl	r0, r6, #0x2
	add	r0, r0, r6
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._682 + 8   @ debug_80C71FC
	str	r1, [r0]
	b	._703
._683:
	.align	2, 0
._682:
	.word	gUnknown_Debug_2038A20
	.word	gTasks
	.word	debug_80C71FC+1
._680:
	mov	r3, #0x1
	and	r3, r3, r2
	cmp	r3, #0
	beq	._684	@cond_branch
	ldr	r0, ._686       @ gUnknown_Debug_2038A20
	ldr	r1, [r0]
	mov	r0, #0x1
	strb	r0, [r1, #0x5]
	ldr	r1, ._686 + 4   @ 0x4000040
	ldr	r2, ._686 + 8   @ 0x51ef
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x4
	ldr	r2, ._686 + 12  @ 0x4167
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r1, ._686 + 16  @ gTasks
	lsl	r0, r6, #0x2
	add	r0, r0, r6
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._686 + 20  @ debug_80C7294
	str	r1, [r0]
	b	._703
._687:
	.align	2, 0
._686:
	.word	gUnknown_Debug_2038A20
	.word	0x4000040
	.word	0x51ef
	.word	0x4167
	.word	gTasks
	.word	debug_80C7294+1
._684:
	mov	r0, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	._689	@cond_branch
	ldr	r1, ._691       @ gUnknown_Debug_2038A20
	ldr	r2, [r1]
	ldrb	r0, [r2, #0x7]
	cmp	r0, #0xd
	bhi	._689	@cond_branch
	lsl	r0, r0, #0x1
	ldr	r2, ._691 + 4   @ 0x5000102
	add	r0, r0, r2
	strh	r3, [r0]
	ldr	r1, [r1]
	ldrb	r0, [r1, #0x7]
	add	r0, r0, #0x1
	strb	r0, [r1, #0x7]
	b	._695
._692:
	.align	2, 0
._691:
	.word	gUnknown_Debug_2038A20
	.word	0x5000102
._689:
	ldrh	r1, [r4, #0x30]
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	._694	@cond_branch
	ldr	r2, ._696       @ gUnknown_Debug_2038A20
	ldr	r1, [r2]
	ldrb	r0, [r1, #0x7]
	cmp	r0, #0
	beq	._694	@cond_branch
	lsl	r0, r0, #0x1
	ldr	r1, ._696 + 4   @ 0x5000102
	add	r0, r0, r1
	mov	r1, #0x0
	strh	r1, [r0]
	ldr	r1, [r2]
	ldrb	r0, [r1, #0x7]
	sub	r0, r0, #0x1
	strb	r0, [r1, #0x7]
	b	._695
._697:
	.align	2, 0
._696:
	.word	gUnknown_Debug_2038A20
	.word	0x5000102
._694:
	ldrh	r1, [r4, #0x2e]
	mov	r0, #0x8
	and	r0, r0, r1
	cmp	r0, #0
	beq	._698	@cond_branch
	ldr	r4, ._701       @ gUnknown_Debug_2038A20
	ldr	r2, [r4]
	ldrb	r0, [r2, #0x9]
	mov	r1, #0x1
	eor	r0, r0, r1
	strb	r0, [r2, #0x9]
	ldr	r1, [r4]
	ldrb	r0, [r1, #0x9]
	cmp	r0, #0
	beq	._699	@cond_branch
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
	b	._700
._702:
	.align	2, 0
._701:
	.word	gUnknown_Debug_2038A20
._699:
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
._700:
	ldr	r5, ._704       @ gUnknown_Debug_2038A20
	ldr	r0, [r5]
	ldrb	r0, [r0, #0x6]
	lsl	r0, r0, #0x5
	ldr	r4, ._704 + 4   @ gPlttBufferUnfaded
	add	r0, r0, r4
	ldr	r2, ._704 + 8   @ 0xffffff00
	add	r1, r4, r2
	mov	r2, #0x10
	bl	CpuSet
	ldr	r0, [r5]
	ldrb	r0, [r0, #0x6]
	lsl	r0, r0, #0x5
	add	r0, r0, r4
	ldr	r1, ._704 + 12  @ gPlttBufferFaded
	mov	r2, #0x10
	bl	CpuSet
._695:
	ldr	r1, ._704 + 16  @ gTasks
	lsl	r0, r6, #0x2
	add	r0, r0, r6
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._704 + 20  @ debug_80C6EE8
	str	r1, [r0]
	b	._703
._705:
	.align	2, 0
._704:
	.word	gUnknown_Debug_2038A20
	.word	gPlttBufferUnfaded+0x200
	.word	0xffffff00
	.word	gPlttBufferFaded+0x100
	.word	gTasks
	.word	debug_80C6EE8+1
._698:
	mov	r0, #0x4
	and	r0, r0, r1
	cmp	r0, #0
	beq	._706	@cond_branch
	bl	StopCryAndClearCrySongs
	ldr	r0, ._707       @ gUnknown_Debug_2038A20
	ldr	r0, [r0]
	ldrh	r0, [r0]
	mov	r1, #0x0
	bl	PlayCry1
._706:
	ldr	r2, ._707       @ gUnknown_Debug_2038A20
	ldr	r1, [r2]
	ldrb	r0, [r1, #0x8]
	add	r0, r0, #0x4
	strb	r0, [r1, #0x8]
	ldr	r3, [r2]
	ldrb	r1, [r3, #0x8]
	mov	r0, #0x1f
	and	r0, r0, r1
	strb	r0, [r3, #0x8]
	ldr	r0, [r2]
	ldrb	r1, [r0, #0x7]
	lsl	r1, r1, #0x1
	ldr	r2, ._707 + 4   @ 0x5000142
	add	r1, r1, r2
	ldr	r2, ._707 + 8   @ gUnknown_Debug_083F8790
	ldrb	r0, [r0, #0x8]
	lsl	r0, r0, #0x1
	add	r0, r0, r2
	ldrh	r0, [r0]
	strh	r0, [r1]
._703:
	add	sp, sp, #0x4
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._708:
	.align	2, 0
._707:
	.word	gUnknown_Debug_2038A20
	.word	0x5000142
	.word	gUnknown_Debug_083F8790

	thumb_func_end debug_80C6FA8

	thumb_func_start debug_80C71FC
debug_80C71FC:
	push	{r4, r5, r6, lr}
	add	r5, r0, #0
	lsl	r5, r5, #0x18
	lsr	r5, r5, #0x18
	ldr	r6, ._709       @ gSprites
	ldr	r4, ._709 + 4   @ gUnknown_Debug_2038A20
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
	ldr	r1, ._709 + 8   @ gTasks
	lsl	r0, r5, #0x2
	add	r0, r0, r5
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._709 + 12  @ debug_80C6CB8
	str	r1, [r0]
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._710:
	.align	2, 0
._709:
	.word	gSprites
	.word	gUnknown_Debug_2038A20
	.word	gTasks
	.word	debug_80C6CB8+1

	thumb_func_end debug_80C71FC

	thumb_func_start debug_80C7294
debug_80C7294:
	push	{r4, r5, r6, r7, lr}
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
	ldr	r0, ._713       @ gMain
	ldrh	r2, [r0, #0x2e]
	mov	r1, #0x1
	and	r1, r1, r2
	add	r3, r0, #0
	cmp	r1, #0
	beq	._711	@cond_branch
	ldr	r0, ._713 + 4   @ gUnknown_Debug_2038A20
	ldr	r1, [r0]
	mov	r0, #0x0
	strb	r0, [r1, #0x5]
	ldr	r1, ._713 + 8   @ 0x4000040
	ldr	r2, ._713 + 12  @ 0x51ef
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x4
	ldr	r2, ._713 + 16  @ 0x699f
	add	r0, r2, #0
	strh	r0, [r1]
	b	._712
._714:
	.align	2, 0
._713:
	.word	gMain
	.word	gUnknown_Debug_2038A20
	.word	0x4000040
	.word	0x51ef
	.word	0x699f
._711:
	mov	r0, #0x2
	and	r0, r0, r2
	cmp	r0, #0
	beq	._715	@cond_branch
	ldr	r6, ._717       @ gUnknown_Debug_2038A20
	ldr	r0, [r6]
	strb	r1, [r0, #0x5]
	ldr	r1, ._717 + 4   @ 0x4000040
	ldr	r2, ._717 + 8   @ 0x51ef
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x4
	ldr	r2, ._717 + 12  @ 0x699f
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r0, [r6]
	add	r0, r0, #0x10
	ldr	r4, ._717 + 16  @ gPlttBufferUnfaded
	add	r1, r4, #0
	mov	r2, #0x10
	bl	CpuSet
	ldr	r0, [r6]
	add	r0, r0, #0x10
	ldr	r5, ._717 + 20  @ gPlttBufferFaded
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
._712:
	ldr	r1, ._717 + 24  @ gTasks
	lsl	r0, r7, #0x2
	add	r0, r0, r7
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._717 + 28  @ debug_80C6EE8
	str	r1, [r0]
	b	._754
._718:
	.align	2, 0
._717:
	.word	gUnknown_Debug_2038A20
	.word	0x4000040
	.word	0x51ef
	.word	0x699f
	.word	gPlttBufferUnfaded+0x100
	.word	gPlttBufferFaded+0x100
	.word	gTasks
	.word	debug_80C6EE8+1
._715:
	ldrh	r1, [r3, #0x30]
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	beq	._720	@cond_branch
	ldr	r0, ._722       @ gUnknown_Debug_2038A20
	ldr	r1, [r0]
	ldrb	r0, [r1, #0xa]
	cmp	r0, #0x1
	bhi	._720	@cond_branch
	add	r0, r0, #0x1
	strb	r0, [r1, #0xa]
	b	._754
._723:
	.align	2, 0
._722:
	.word	gUnknown_Debug_2038A20
._720:
	ldrh	r1, [r3, #0x30]
	mov	r0, #0x40
	and	r0, r0, r1
	cmp	r0, #0
	beq	._725	@cond_branch
	ldr	r0, ._727       @ gUnknown_Debug_2038A20
	ldr	r1, [r0]
	ldrb	r0, [r1, #0xa]
	cmp	r0, #0
	beq	._725	@cond_branch
	sub	r0, r0, #0x1
	strb	r0, [r1, #0xa]
	b	._754
._728:
	.align	2, 0
._727:
	.word	gUnknown_Debug_2038A20
._725:
	ldrh	r1, [r3, #0x30]
	mov	r0, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	._729	@cond_branch
	ldr	r0, ._734       @ gUnknown_Debug_2038A20
	ldr	r2, [r0]
	ldrb	r0, [r2, #0xa]
	cmp	r0, #0x1
	beq	._730	@cond_branch
	cmp	r0, #0x1
	bgt	._731	@cond_branch
	cmp	r0, #0
	beq	._732	@cond_branch
	b	._754
._735:
	.align	2, 0
._734:
	.word	gUnknown_Debug_2038A20
._731:
	cmp	r0, #0x2
	beq	._736	@cond_branch
	b	._754
._732:
	ldrb	r3, [r2, #0xc]
	lsl	r1, r3, #0x1b
	lsr	r0, r1, #0x1b
	cmp	r0, #0x1e
	bhi	._761	@cond_branch
	add	r0, r0, #0x1
	mov	r1, #0x1f
	and	r0, r0, r1
	mov	r1, #0x20
	neg	r1, r1
	and	r1, r1, r3
	orr	r1, r1, r0
	strb	r1, [r2, #0xc]
	b	._761
._730:
	ldrh	r3, [r2, #0xc]
	lsl	r1, r3, #0x16
	lsr	r0, r1, #0x1b
	cmp	r0, #0x1e
	bhi	._761	@cond_branch
	add	r0, r0, #0x1
	mov	r1, #0x1f
	and	r0, r0, r1
	lsl	r0, r0, #0x5
	ldr	r1, ._742       @ 0xfffffc1f
	and	r1, r1, r3
	orr	r1, r1, r0
	strh	r1, [r2, #0xc]
	b	._761
._743:
	.align	2, 0
._742:
	.word	0xfffffc1f
._736:
	ldrb	r3, [r2, #0xd]
	lsl	r1, r3, #0x19
	lsr	r0, r1, #0x1b
	cmp	r0, #0x1e
	bhi	._761	@cond_branch
	add	r0, r0, #0x1
	mov	r1, #0x1f
	and	r0, r0, r1
	lsl	r0, r0, #0x2
	mov	r1, #0x7d
	neg	r1, r1
	and	r1, r1, r3
	orr	r1, r1, r0
	strb	r1, [r2, #0xd]
	b	._761
._729:
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	._754	@cond_branch
	ldr	r0, ._751       @ gUnknown_Debug_2038A20
	ldr	r3, [r0]
	ldrb	r0, [r3, #0xa]
	cmp	r0, #0x1
	beq	._747	@cond_branch
	cmp	r0, #0x1
	bgt	._748	@cond_branch
	cmp	r0, #0
	beq	._749	@cond_branch
	b	._754
._752:
	.align	2, 0
._751:
	.word	gUnknown_Debug_2038A20
._748:
	cmp	r0, #0x2
	beq	._753	@cond_branch
	b	._754
._749:
	ldrb	r2, [r3, #0xc]
	mov	r0, #0x1f
	and	r0, r0, r2
	cmp	r0, #0
	beq	._761	@cond_branch
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
	b	._761
._747:
	ldrh	r2, [r3, #0xc]
	mov	r0, #0xf8
	lsl	r0, r0, #0x2
	and	r0, r0, r2
	cmp	r0, #0
	beq	._761	@cond_branch
	lsl	r0, r2, #0x16
	lsr	r0, r0, #0x1b
	sub	r0, r0, #0x1
	mov	r1, #0x1f
	and	r0, r0, r1
	lsl	r0, r0, #0x5
	ldr	r1, ._759       @ 0xfffffc1f
	and	r1, r1, r2
	orr	r1, r1, r0
	strh	r1, [r3, #0xc]
	b	._761
._760:
	.align	2, 0
._759:
	.word	0xfffffc1f
._753:
	ldrb	r2, [r3, #0xd]
	mov	r0, #0x7c
	and	r0, r0, r2
	cmp	r0, #0
	beq	._761	@cond_branch
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
._761:
	ldr	r0, ._762       @ gTasks
	lsl	r1, r7, #0x2
	add	r1, r1, r7
	lsl	r1, r1, #0x3
	add	r1, r1, r0
	ldr	r0, ._762 + 4   @ debug_80C74E4
	str	r0, [r1]
._754:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._763:
	.align	2, 0
._762:
	.word	gTasks
	.word	debug_80C74E4+1

	thumb_func_end debug_80C7294

	thumb_func_start debug_80C74E4
debug_80C74E4:
	push	{r4, r5, r6, lr}
	mov	r6, r8
	push	{r6}
	add	r5, r0, #0
	lsl	r5, r5, #0x18
	lsr	r5, r5, #0x18
	ldr	r0, ._764       @ gUnknown_Debug_2038A20
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
	ldr	r6, ._764 + 4   @ gPlttBufferUnfaded
	ldrb	r1, [r3, #0x7]
	add	r1, r1, #0x81
	lsl	r1, r1, #0x1
	add	r1, r1, r6
	strh	r0, [r1]
	ldr	r1, ._764 + 8   @ gPlttBufferFaded
	mov	r8, r1
	ldrb	r1, [r3, #0x7]
	add	r1, r1, #0x81
	lsl	r1, r1, #0x1
	add r1, r1, r8
	strh	r0, [r1]
	ldrb	r1, [r3, #0x6]
	lsl	r1, r1, #0x4
	ldrb	r2, [r3, #0x7]
	ldr	r4, ._764 + 12  @ 0x101
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
	ldr	r1, ._764 + 16  @ gTasks
	lsl	r0, r5, #0x2
	add	r0, r0, r5
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._764 + 20  @ debug_80C7294
	str	r1, [r0]
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._765:
	.align	2, 0
._764:
	.word	gUnknown_Debug_2038A20
	.word	gPlttBufferUnfaded
	.word	gPlttBufferFaded
	.word	0x101
	.word	gTasks
	.word	debug_80C7294+1

	thumb_func_end debug_80C74E4

	thumb_func_start debug_80C7584
debug_80C7584:
	push	{r4, lr}
	add	r2, r0, #0
	ldr	r0, ._771       @ gUnknown_Debug_2038A20
	ldr	r3, [r0]
	ldrb	r1, [r3, #0x5]
	add	r4, r0, #0
	cmp	r1, #0
	beq	._766	@cond_branch
	mov	r1, #0x2e
	ldsh	r0, [r2, r1]
	cmp	r0, #0x1
	beq	._767	@cond_branch
	cmp	r0, #0x1
	ble	._768	@cond_branch
	cmp	r0, #0x2
	beq	._769	@cond_branch
._768:
	ldrb	r0, [r3, #0xc]
	lsl	r0, r0, #0x1b
	b	._773
._772:
	.align	2, 0
._771:
	.word	gUnknown_Debug_2038A20
._767:
	ldrh	r0, [r3, #0xc]
	lsl	r0, r0, #0x16
	b	._773
._769:
	ldrb	r0, [r3, #0xd]
	lsl	r0, r0, #0x19
._773:
	lsr	r0, r0, #0x1b
	lsl	r0, r0, #0x2
	strh	r0, [r2, #0x24]
	mov	r1, #0x2e
	ldsh	r0, [r2, r1]
	lsl	r0, r0, #0x3
	strh	r0, [r2, #0x26]
	ldrh	r0, [r2, #0x30]
	add	r3, r0, #1
	strh	r3, [r2, #0x30]
	mov	r0, #0x2e
	ldsh	r1, [r2, r0]
	ldr	r0, [r4]
	ldrb	r0, [r0, #0xa]
	cmp	r1, r0
	bne	._775	@cond_branch
	mov	r0, #0x8
	and	r3, r3, r0
	cmp	r3, #0
	bne	._775	@cond_branch
._766:
	add	r0, r2, #0
	add	r0, r0, #0x3e
	ldrb	r1, [r0]
	mov	r2, #0x4
	orr	r1, r1, r2
	strb	r1, [r0]
	b	._776
._775:
	add	r2, r2, #0x3e
	ldrb	r1, [r2]
	mov	r0, #0x5
	neg	r0, r0
	and	r0, r0, r1
	strb	r0, [r2]
._776:
	pop	{r4}
	pop	{r0}
	bx	r0

	thumb_func_end debug_80C7584

	thumb_func_start InitSeeTrainers
InitSeeTrainers:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffffc
	bl	debug_80C35DC
	ldr	r1, ._777       @ byte_83F88EC
	ldr	r2, ._777 + 4   @ 0x600e000
	ldr	r0, ._777 + 8   @ 0x40000d4
	str	r1, [r0]
	str	r2, [r0, #0x4]
	ldr	r1, ._777 + 12  @ 0x80000400
	str	r1, [r0, #0x8]
	ldr	r0, [r0, #0x8]
	ldr	r0, ._777 + 16  @ word_83F888C
	mov	r1, #0x80
	mov	r2, #0x60
	bl	LoadPalette
	mov	r0, #0x1
	neg	r0, r0
	mov	r5, #0x0
	str	r5, [sp]
	mov	r1, #0x0
	mov	r2, #0x10
	mov	r3, #0x0
	bl	BeginNormalPaletteFade
	ldr	r0, ._777 + 20  @ 0x4000040
	mov	r6, #0x0
	strh	r5, [r0]
	add	r0, r0, #0x4
	strh	r5, [r0]
	sub	r0, r0, #0x2
	strh	r5, [r0]
	add	r0, r0, #0x4
	strh	r5, [r0]
	ldr	r1, ._777 + 24  @ 0x4000048
	mov	r0, #0x3f
	strh	r0, [r1]
	add	r1, r1, #0x2
	mov	r0, #0x1f
	strh	r0, [r1]
	add	r1, r1, #0x6
	mov	r0, #0xf1
	strh	r0, [r1]
	ldr	r0, ._777 + 28  @ 0x4000052
	strh	r5, [r0]
	add	r1, r1, #0x4
	mov	r0, #0x7
	strh	r0, [r1]
	ldr	r3, ._777 + 32  @ 0x4000208
	ldrh	r2, [r3]
	strh	r5, [r3]
	ldr	r4, ._777 + 36  @ 0x4000200
	ldrh	r0, [r4]
	mov	r1, #0x1
	orr	r0, r0, r1
	strh	r0, [r4]
	strh	r2, [r3]
	ldr	r0, ._777 + 40  @ debug_80C3758
	bl	SetVBlankCallback
	ldr	r0, ._777 + 44  @ debug_80C370C
	bl	SetMainCallback2
	ldr	r1, ._777 + 48  @ 0x4000008
	ldr	r2, ._777 + 52  @ 0x1f0b
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x2
	ldr	r2, ._777 + 56  @ 0x1e0a
	add	r0, r2, #0
	strh	r0, [r1]
	sub	r1, r1, #0xa
	mov	r2, #0xcd
	lsl	r2, r2, #0x6
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r0, ._777 + 60  @ debug_80C777C
	mov	r1, #0x0
	bl	CreateTask
	ldr	r1, ._777 + 64  @ gUnknown_Debug_2038A20
	ldr	r0, ._777 + 68  @ 0x2018000
	str	r0, [r1]
	strh	r5, [r0]
	strb	r6, [r0, #0x2]
	strb	r6, [r0, #0x3]
	strb	r6, [r0, #0x5]
	strb	r6, [r0, #0x7]
	strb	r6, [r0, #0xa]
	strb	r6, [r0, #0x8]
	ldr	r4, ._777 + 72  @ gSpriteTemplate_83F8874
	add	r0, r4, #0
	mov	r1, #0x6c
	mov	r2, #0x74
	mov	r3, #0x0
	bl	CreateSprite
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	ldr	r6, ._777 + 76  @ gSprites
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r6
	strh	r5, [r0, #0x2e]
	mov	r1, #0x0
	bl	StartSpriteAnim
	add	r0, r4, #0
	mov	r1, #0x6c
	mov	r2, #0x74
	mov	r3, #0x0
	bl	CreateSprite
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r6
	mov	r1, #0x1
	strh	r1, [r0, #0x2e]
	bl	StartSpriteAnim
	add	r0, r4, #0
	mov	r1, #0x6c
	mov	r2, #0x74
	mov	r3, #0x0
	bl	CreateSprite
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r6
	mov	r1, #0x2
	strh	r1, [r0, #0x2e]
	bl	StartSpriteAnim
	add	sp, sp, #0x4
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._778:
	.align	2, 0
._777:
	.word	byte_83F88EC
	.word	0x600e000
	.word	0x40000d4
	.word	0x80000400
	.word	word_83F888C
	.word	0x4000040
	.word	0x4000048
	.word	0x4000052
	.word	0x4000208
	.word	0x4000200
	.word	debug_80C3758+1
	.word	debug_80C370C+1
	.word	0x4000008
	.word	0x1f0b
	.word	0x1e0a
	.word	debug_80C777C+1
	.word	gUnknown_Debug_2038A20
	.word	0x2018000
	.word	gSpriteTemplate_83F8874
	.word	gSprites

	thumb_func_end InitSeeTrainers

	thumb_func_start debug_80C777C
debug_80C777C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xffffffec
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
	ldr	r1, ._784       @ gUnknown_Debug_083F8815
	mov	r0, sp
	mov	r2, #0x12
	bl	memcpy
	mov	r0, #0x9
	mov	r1, #0x0
	mov	r2, #0xe
	mov	r3, #0x7
	bl	Menu_DrawStdWindowFrame
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x9
	mov	r3, #0x9
	bl	Menu_DrawStdWindowFrame
	mov	r0, #0x0
	mov	r1, #0xa
	mov	r2, #0x9
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	mov	r0, #0xe
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x7
	bl	Menu_DrawStdWindowFrame
	ldr	r0, ._784 + 4   @ gUnknown_Debug_083F87D0
	mov	r1, #0xf
	mov	r2, #0x1
	bl	Menu_PrintText
	ldr	r0, ._784 + 8   @ gUnknown_Debug_083F87D8
	mov	r1, #0x19
	mov	r2, #0x1
	bl	Menu_PrintText
	ldr	r0, ._784 + 12  @ gUnknown_Debug_083F87E0
	mov	r1, #0xf
	mov	r2, #0x5
	bl	Menu_PrintText
	mov	r0, #0xa
	mov	r1, #0x8
	mov	r2, #0x1d
	mov	r3, #0xc
	bl	Menu_DrawStdWindowFrame
	mov	r2, #0x0
	ldr	r4, ._784 + 16  @ 0x600fa56
	ldr	r0, ._784 + 20  @ 0xa311
	add	r3, r0, #0
._779:
	lsl	r0, r2, #0x1
	add	r0, r0, r4
	add	r1, r2, r3
	strh	r1, [r0]
	add	r0, r2, #1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0xe
	bls	._779	@cond_branch
	mov	r2, #0x0
	ldr	r5, ._784 + 24  @ gUnknown_Debug_083F87F4
	lsl	r6, r7, #0x2
	mov	r8, r6
	ldr	r4, ._784 + 28  @ 0x600f256
	ldr	r0, ._784 + 32  @ 0x8301
	add	r3, r0, #0
._780:
	lsl	r0, r2, #0x1
	add	r0, r0, r4
	add	r1, r2, r3
	strh	r1, [r0]
	add	r0, r2, #1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0xe
	bls	._780	@cond_branch
	add	r0, r5, #0
	mov	r1, #0x14
	mov	r2, #0xa
	bl	Menu_PrintText
	mov	r0, #0xa
	mov	r1, #0xd
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	mov	r1, sp
	mov	r0, #0x23
	strb	r0, [r1]
	mov	r2, #0x0
	ldr	r4, ._784 + 36  @ 0x600f396
	mov	r5, #0x93
	lsl	r5, r5, #0x8
	add	r3, r5, #0
._781:
	lsl	r1, r2, #0x1
	add	r1, r1, r4
	mov	r6, sp
	add	r0, r6, r2
	ldrb	r0, [r0]
	add	r0, r0, r3
	strh	r0, [r1]
	add	r0, r2, #1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0x11
	bls	._781	@cond_branch
	mov	r1, sp
	mov	r0, #0x24
	strb	r0, [r1]
	mov	r2, #0x0
	ldr	r5, ._784 + 40  @ gUnknown_Debug_083F8801
	ldr	r4, ._784 + 44  @ 0x600f3d6
	mov	r0, #0x93
	lsl	r0, r0, #0x8
	add	r3, r0, #0
._782:
	lsl	r1, r2, #0x1
	add	r1, r1, r4
	mov	r6, sp
	add	r0, r6, r2
	ldrb	r0, [r0]
	add	r0, r0, r3
	strh	r0, [r1]
	add	r0, r2, #1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0x11
	bls	._782	@cond_branch
	mov	r1, sp
	mov	r0, #0x25
	strb	r0, [r1]
	mov	r2, #0x0
	ldr	r4, ._784 + 48  @ 0x600f416
	mov	r0, #0x93
	lsl	r0, r0, #0x8
	add	r3, r0, #0
._783:
	lsl	r1, r2, #0x1
	add	r1, r1, r4
	mov	r6, sp
	add	r0, r6, r2
	ldrb	r0, [r0]
	add	r0, r0, r3
	strh	r0, [r1]
	add	r0, r2, #1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0x11
	bls	._783	@cond_branch
	add	r0, r5, #0
	mov	r1, #0xf
	mov	r2, #0x11
	bl	Menu_PrintText
	ldr	r1, ._784 + 52  @ 0x4000040
	ldr	r2, ._784 + 56  @ 0x51ef
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x4
	ldr	r5, ._784 + 60  @ 0x699f
	add	r0, r5, #0
	strh	r0, [r1]
	ldr	r1, ._784 + 64  @ gTasks
	mov	r6, r8
	add	r0, r6, r7
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._784 + 68  @ debug_80C7934
	str	r1, [r0]
	add	sp, sp, #0x14
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._785:
	.align	2, 0
._784:
	.word	gUnknown_Debug_083F8815
	.word	gUnknown_Debug_083F87D0
	.word	gUnknown_Debug_083F87D8
	.word	gUnknown_Debug_083F87E0
	.word	0x600fa56
	.word	0xa311
	.word	gUnknown_Debug_083F87F4
	.word	0x600f256
	.word	0x8301
	.word	0x600f396
	.word	gUnknown_Debug_083F8801
	.word	0x600f3d6
	.word	0x600f416
	.word	0x4000040
	.word	0x51ef
	.word	0x699f
	.word	gTasks
	.word	debug_80C7934+1

	thumb_func_end debug_80C777C

	thumb_func_start debug_80C7934
debug_80C7934:
	push	{r4, r5, r6, lr}
	mov	r6, r8
	push	{r6}
	add	sp, sp, #0xfffffff8
	mov	r8, r0
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r8, r0
	ldr	r5, ._786       @ gUnknown_Debug_2038A20
	ldr	r6, [r5]
	ldrh	r2, [r6]
	lsl	r0, r2, #0x3
	ldr	r1, ._786 + 4   @ gTrainerFrontPicTable
	add	r0, r0, r1
	ldr	r1, ._786 + 8   @ gTrainerFrontPicCoords
	lsl	r2, r2, #0x2
	add	r2, r2, r1
	ldrb	r1, [r2]
	ldrb	r2, [r2, #0x1]
	ldr	r4, ._786 + 12  @ gUnknown_081FAF4C
	ldr	r3, [r4]
	ldr	r4, [r4, #0x4]
	str	r4, [sp]
	ldrh	r4, [r6]
	str	r4, [sp, #0x4]
	bl	DecompressPicFromTable_2
	ldr	r0, [r5]
	ldrh	r0, [r0]
	lsl	r0, r0, #0x3
	ldr	r1, ._786 + 16  @ gTrainerFrontPicPaletteTable
	add	r0, r0, r1
	bl	LoadCompressedObjectPalette
	ldr	r0, [r5]
	ldrh	r0, [r0]
	mov	r1, #0x1
	bl	GetMonSpriteTemplate_803C5A0
	ldr	r0, ._786 + 20  @ gUnknown_02024E8C
	mov	r1, #0x28
	mov	r2, #0x28
	mov	r3, #0x0
	bl	CreateSprite
	ldr	r1, [r5]
	mov	r6, #0x0
	strb	r0, [r1, #0x2]
	ldr	r4, ._786 + 24  @ gSprites
	ldr	r2, [r5]
	ldrb	r1, [r2, #0x2]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r1, r4, #0
	add	r1, r1, #0x1c
	add	r0, r0, r1
	ldr	r1, ._786 + 28  @ debug_69
	str	r1, [r0]
	ldrb	r0, [r2, #0x2]
	lsl	r1, r0, #0x4
	add	r1, r1, r0
	lsl	r1, r1, #0x2
	add	r1, r1, r4
	ldrb	r2, [r1, #0x5]
	mov	r0, #0xd
	neg	r0, r0
	and	r0, r0, r2
	strb	r0, [r1, #0x5]
	ldr	r0, [r5]
	ldrh	r0, [r0]
	mov	r1, #0x1a
	mov	r2, #0x5
	bl	debug_80C376C
	ldr	r2, [r5]
	ldrb	r1, [r2, #0x2]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r4
	ldrb	r0, [r0, #0x5]
	lsr	r0, r0, #0x4
	strb	r0, [r2, #0x6]
	ldr	r0, [r5]
	ldrb	r0, [r0, #0x6]
	lsl	r0, r0, #0x5
	ldr	r4, ._786 + 32  @ gPlttBufferUnfaded
	add	r0, r0, r4
	ldr	r2, ._786 + 36  @ 0xffffff00
	add	r1, r4, r2
	mov	r2, #0x10
	bl	CpuSet
	ldr	r0, [r5]
	ldrb	r0, [r0, #0x6]
	lsl	r0, r0, #0x5
	add	r0, r0, r4
	ldr	r1, ._786 + 40  @ gPlttBufferFaded
	mov	r2, #0x10
	bl	CpuSet
	ldr	r1, ._786 + 44  @ gTasks
	mov	r2, r8
	lsl	r0, r2, #0x2
	add r0, r0, r8
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._786 + 48  @ debug_80C7A54
	str	r1, [r0]
	ldr	r0, [r5]
	strb	r6, [r0, #0x9]
	add	sp, sp, #0x8
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._787:
	.align	2, 0
._786:
	.word	gUnknown_Debug_2038A20
	.word	gTrainerFrontPicTable
	.word	gTrainerFrontPicCoords
	.word	gUnknown_081FAF4C
	.word	gTrainerFrontPicPaletteTable
	.word	gUnknown_02024E8C
	.word	gSprites
	.word	debug_69+1
	.word	gPlttBufferUnfaded+0x200
	.word	0xffffff00
	.word	gPlttBufferFaded+0x100
	.word	gTasks
	.word	debug_80C7A54+1

	thumb_func_end debug_80C7934

	thumb_func_start debug_80C7A54
debug_80C7A54:
	push	{r4, r5, r6, lr}
	add	r6, r0, #0
	lsl	r6, r6, #0x18
	lsr	r6, r6, #0x18
	ldr	r4, ._788       @ gPlttBufferUnfaded
	ldr	r5, ._788 + 4   @ gUnknown_Debug_2038A20
	ldr	r1, [r5]
	add	r1, r1, #0x10
	add	r0, r4, #0
	mov	r2, #0x10
	bl	CpuSet
	ldr	r0, ._788 + 8   @ 0xffffff00
	add	r4, r4, r0
	ldr	r3, [r5]
	ldrb	r0, [r3, #0x7]
	add	r0, r0, #0x81
	lsl	r0, r0, #0x1
	add	r0, r0, r4
	ldrh	r4, [r0]
	mov	r1, #0x1f
	and	r1, r1, r4
	ldrb	r2, [r3, #0xc]
	mov	r0, #0x20
	neg	r0, r0
	and	r0, r0, r2
	orr	r0, r0, r1
	strb	r0, [r3, #0xc]
	ldr	r3, [r5]
	mov	r1, #0xf8
	lsl	r1, r1, #0x2
	and	r1, r1, r4
	ldrh	r2, [r3, #0xc]
	ldr	r0, ._788 + 12  @ 0xfffffc1f
	and	r0, r0, r2
	orr	r0, r0, r1
	strh	r0, [r3, #0xc]
	mov	r1, #0xf8
	lsl	r1, r1, #0x7
	and	r1, r1, r4
	lsr	r1, r1, #0x8
	ldrb	r2, [r3, #0xd]
	mov	r0, #0x7d
	neg	r0, r0
	and	r0, r0, r2
	orr	r0, r0, r1
	strb	r0, [r3, #0xd]
	ldr	r2, [r5]
	ldrb	r1, [r2, #0xd]
	mov	r0, #0x7f
	and	r0, r0, r1
	strb	r0, [r2, #0xd]
	ldr	r0, [r5]
	ldrb	r0, [r0, #0x7]
	add	r0, r0, #0x1
	mov	r1, #0xb
	mov	r2, #0xa
	mov	r3, #0x2
	bl	debug_80C68CC
	ldr	r0, ._788 + 16  @ gUnknown_Debug_083F8813
	mov	r1, #0xd
	mov	r2, #0xa
	bl	Menu_PrintText
	add	r0, r4, #0
	mov	r1, #0xe
	mov	r2, #0xa
	mov	r3, #0x4
	bl	debug_80C68CC
	ldr	r1, ._788 + 20  @ gTasks
	lsl	r0, r6, #0x2
	add	r0, r0, r6
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldr	r1, ._788 + 24  @ debug_80C7B14
	str	r1, [r0]
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
._789:
	.align	2, 0
._788:
	.word	gPlttBufferUnfaded+0x100
	.word	gUnknown_Debug_2038A20
	.word	0xffffff00
	.word	0xfffffc1f
	.word	gUnknown_Debug_083F8813
	.word	gTasks
	.word	debug_80C7B14+1

	thumb_func_end debug_80C7A54

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
