.if DEBUG

	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.text

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
	ldr	r0, ._178 + 8   @ gUnknown_Debug_083C4B24
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
	.word	gUnknown_Debug_083C4B24
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
	ldr	r1, ._192 + 12  @ gUnknown_Debug_083C4B24
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
	.word	gUnknown_Debug_083C4B24
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
