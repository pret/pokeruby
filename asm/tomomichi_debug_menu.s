.if DEBUG

	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	thumb_func_start debug_sub_808C510
debug_sub_808C510:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._173       @ gUnknown_Debug_083C2D8C
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._173 + 4   @ gDebug_0300070F
	mov	r0, #0x4
	strb	r0, [r1]
	ldr	r1, ._173 + 8   @ gMenuCallback
	ldr	r0, ._173 + 12  @ debug_sub_808C6C8
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._174:
	.align	2, 0
._173:
	.word	gUnknown_Debug_083C2D8C
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808C6C8+1

	thumb_func_end debug_sub_808C510

	thumb_func_start debug_sub_808C568
debug_sub_808C568:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._175       @ gUnknown_Debug_083C2EB0
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._175 + 4   @ gDebug_0300070F
	mov	r0, #0x5
	strb	r0, [r1]
	ldr	r1, ._175 + 8   @ gMenuCallback
	ldr	r0, ._175 + 12  @ debug_sub_808C6C8
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._176:
	.align	2, 0
._175:
	.word	gUnknown_Debug_083C2EB0
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808C6C8+1

	thumb_func_end debug_sub_808C568

	thumb_func_start debug_sub_808C5C0
debug_sub_808C5C0:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._177       @ gUnknown_Debug_083C2FE0
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._177 + 4   @ gDebug_0300070F
	mov	r0, #0x6
	strb	r0, [r1]
	ldr	r1, ._177 + 8   @ gMenuCallback
	ldr	r0, ._177 + 12  @ debug_sub_808C6C8
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._178:
	.align	2, 0
._177:
	.word	gUnknown_Debug_083C2FE0
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808C6C8+1

	thumb_func_end debug_sub_808C5C0

	thumb_func_start debug_sub_808C618
debug_sub_808C618:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._179       @ gUnknown_Debug_083C3100
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._179 + 4   @ gDebug_0300070F
	mov	r0, #0x7
	strb	r0, [r1]
	ldr	r1, ._179 + 8   @ gMenuCallback
	ldr	r0, ._179 + 12  @ debug_sub_808C6C8
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._180:
	.align	2, 0
._179:
	.word	gUnknown_Debug_083C3100
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808C6C8+1

	thumb_func_end debug_sub_808C618

	thumb_func_start debug_sub_808C670
debug_sub_808C670:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x7
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._181       @ gUnknown_Debug_083C3194
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x3
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x3
	bl	InitMenu
	ldr	r1, ._181 + 4   @ gDebug_0300070F
	mov	r0, #0x8
	strb	r0, [r1]
	ldr	r1, ._181 + 8   @ gMenuCallback
	ldr	r0, ._181 + 12  @ debug_sub_808C6C8
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._182:
	.align	2, 0
._181:
	.word	gUnknown_Debug_083C3194
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808C6C8+1

	thumb_func_end debug_sub_808C670

	thumb_func_start debug_sub_808C6C8
debug_sub_808C6C8:
	push	{r4, r5, lr}
	bl	Menu_ProcessInput
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	bl	Menu_GetCursorPos
	add	r1, r0, #0
	ldr	r5, ._186       @ gDebug_0300070F
	ldrb	r0, [r5]
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	bl	debug_sub_808C714
	ldrb	r0, [r5]
	bl	debug_sub_808C764
	lsl	r4, r4, #0x18
	asr	r4, r4, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r4, r0
	beq	._183	@cond_branch
	mov	r0, #0x1
	neg	r0, r0
	cmp	r4, r0
	beq	._184	@cond_branch
._183:
	mov	r0, #0x0
	b	._185
._187:
	.align	2, 0
._186:
	.word	gDebug_0300070F
._184:
	bl	CloseMenu
	mov	r0, #0x1
._185:
	pop	{r4, r5}
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808C6C8

	thumb_func_start debug_sub_808C714
debug_sub_808C714:
	push	{r4, lr}
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	lsl	r1, r1, #0x18
	lsr	r3, r1, #0x18
	ldr	r0, ._191       @ gMain
	ldrh	r1, [r0, #0x2e]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._190	@cond_branch
	ldr	r0, ._191 + 4   @ gUnknown_Debug_83C31E6
	lsl	r1, r2, #0x3
	add	r1, r1, r2
	add	r1, r1, r3
	lsl	r1, r1, #0x1
	add	r1, r1, r0
	ldrh	r4, [r1]
	add	r0, r4, #0
	bl	FlagGet
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	._189	@cond_branch
	add	r0, r4, #0
	bl	FlagSet
	b	._190
._192:
	.align	2, 0
._191:
	.word	gMain
	.word	gUnknown_Debug_83C31E6
._189:
	add	r0, r4, #0
	bl	FlagClear
._190:
	pop	{r4}
	pop	{r0}
	bx	r0

	thumb_func_end debug_sub_808C714

	thumb_func_start debug_sub_808C764
debug_sub_808C764:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	mov	r5, #0x0
	ldr	r0, ._195       @ gUnknown_Debug_083C31DC
	add	r0, r1, r0
	ldrb	r2, [r0]
	cmp	r5, r2
	bcs	._193	@cond_branch
	ldr	r0, ._195 + 4   @ gUnknown_Debug_83C31E6
	mov	r8, r0
	lsl	r0, r1, #0x3
	add	r0, r0, r1
	lsl	r7, r0, #0x1
	add	r6, r2, #0
._194:
	lsl	r0, r5, #0x1
	add	r4, r0, #1
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	add	r0, r0, r7
	add r0, r0, r8
	ldrh	r0, [r0]
	bl	FlagGet
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	neg	r2, r0
	orr	r2, r2, r0
	lsr	r2, r2, #0x1f
	mov	r0, #0x1c
	add	r1, r4, #0
	bl	debug_sub_808F2E0
	add	r0, r5, #1
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	cmp	r5, r6
	bcc	._194	@cond_branch
._193:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._196:
	.align	2, 0
._195:
	.word	gUnknown_Debug_083C31DC
	.word	gUnknown_Debug_83C31E6

	thumb_func_end debug_sub_808C764

	thumb_func_start debug_sub_808C7C8
debug_sub_808C7C8:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1c
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._197       @ gUnknown_Debug_083C1CE8
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1b
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._197 + 4   @ gMenuCallback
	ldr	r0, ._197 + 8   @ debug_sub_808C818
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._198:
	.align	2, 0
._197:
	.word	gUnknown_Debug_083C1CE8
	.word	gMenuCallback
	.word	debug_sub_808C818+1

	thumb_func_end debug_sub_808C7C8

	thumb_func_start debug_sub_808C818
debug_sub_808C818:
	push	{lr}
	bl	Menu_ProcessInput
	lsl	r0, r0, #0x18
	asr	r1, r0, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r1, r0
	bne	._199	@cond_branch
	mov	r0, #0x0
	b	._202
._199:
	mov	r0, #0x1
	neg	r0, r0
	cmp	r1, r0
	beq	._201	@cond_branch
	ldr	r2, ._203       @ gMenuCallback
	ldr	r0, ._203 + 4   @ gUnknown_Debug_083C1CE8
	lsl	r1, r1, #0x3
	add	r0, r0, #0x4
	add	r1, r1, r0
	ldr	r0, [r1]
	str	r0, [r2]
	mov	r0, #0x0
	b	._202
._204:
	.align	2, 0
._203:
	.word	gMenuCallback
	.word	gUnknown_Debug_083C1CE8
._201:
	bl	CloseMenu
	mov	r0, #0x1
._202:
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808C818

	thumb_func_start debug_sub_808C85C
debug_sub_808C85C:
	push	{r4, lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._205       @ gUnknown_Debug_083C1E0C
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
	ldr	r0, ._205 + 4   @ gDebug_0300070F
	strb	r4, [r0]
	ldr	r1, ._205 + 8   @ gMenuCallback
	ldr	r0, ._205 + 12  @ debug_sub_808CB74
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r4}
	pop	{r1}
	bx	r1
._206:
	.align	2, 0
._205:
	.word	gUnknown_Debug_083C1E0C
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808CB74+1

	thumb_func_end debug_sub_808C85C

	thumb_func_start debug_sub_808C8B4
debug_sub_808C8B4:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._207       @ gUnknown_Debug_083C1F38
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._207 + 4   @ gDebug_0300070F
	mov	r0, #0x1
	strb	r0, [r1]
	ldr	r1, ._207 + 8   @ gMenuCallback
	ldr	r0, ._207 + 12  @ debug_sub_808CB74
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._208:
	.align	2, 0
._207:
	.word	gUnknown_Debug_083C1F38
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808CB74+1

	thumb_func_end debug_sub_808C8B4

	thumb_func_start debug_sub_808C90C
debug_sub_808C90C:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._209       @ gUnknown_Debug_083C206C
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._209 + 4   @ gDebug_0300070F
	mov	r0, #0x2
	strb	r0, [r1]
	ldr	r1, ._209 + 8   @ gMenuCallback
	ldr	r0, ._209 + 12  @ debug_sub_808CB74
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._210:
	.align	2, 0
._209:
	.word	gUnknown_Debug_083C206C
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808CB74+1

	thumb_func_end debug_sub_808C90C

	thumb_func_start debug_sub_808C964
debug_sub_808C964:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._211       @ gUnknown_Debug_083C2190
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._211 + 4   @ gDebug_0300070F
	mov	r0, #0x3
	strb	r0, [r1]
	ldr	r1, ._211 + 8   @ gMenuCallback
	ldr	r0, ._211 + 12  @ debug_sub_808CB74
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._212:
	.align	2, 0
._211:
	.word	gUnknown_Debug_083C2190
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808CB74+1

	thumb_func_end debug_sub_808C964

	thumb_func_start debug_sub_808C9BC
debug_sub_808C9BC:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0xd
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._213       @ gUnknown_Debug_083C2264
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x6
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x6
	bl	InitMenu
	ldr	r1, ._213 + 4   @ gDebug_0300070F
	mov	r0, #0x4
	strb	r0, [r1]
	ldr	r1, ._213 + 8   @ gMenuCallback
	ldr	r0, ._213 + 12  @ debug_sub_808CB74
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._214:
	.align	2, 0
._213:
	.word	gUnknown_Debug_083C2264
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808CB74+1

	thumb_func_end debug_sub_808C9BC

	thumb_func_start debug_sub_808CA14
debug_sub_808CA14:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._215       @ gUnknown_Debug_083C2370
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._215 + 4   @ gDebug_0300070F
	mov	r0, #0x5
	strb	r0, [r1]
	ldr	r1, ._215 + 8   @ gMenuCallback
	ldr	r0, ._215 + 12  @ debug_sub_808CB74
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._216:
	.align	2, 0
._215:
	.word	gUnknown_Debug_083C2370
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808CB74+1

	thumb_func_end debug_sub_808CA14

	thumb_func_start debug_sub_808CA6C
debug_sub_808CA6C:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._217       @ gUnknown_Debug_083C248C
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._217 + 4   @ gDebug_0300070F
	mov	r0, #0x6
	strb	r0, [r1]
	ldr	r1, ._217 + 8   @ gMenuCallback
	ldr	r0, ._217 + 12  @ debug_sub_808CB74
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._218:
	.align	2, 0
._217:
	.word	gUnknown_Debug_083C248C
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808CB74+1

	thumb_func_end debug_sub_808CA6C

	thumb_func_start debug_sub_808CAC4
debug_sub_808CAC4:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._219       @ gUnknown_Debug_083C259C
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1b
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._219 + 4   @ gDebug_0300070F
	mov	r0, #0x7
	strb	r0, [r1]
	ldr	r1, ._219 + 8   @ gMenuCallback
	ldr	r0, ._219 + 12  @ debug_sub_808CB74
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._220:
	.align	2, 0
._219:
	.word	gUnknown_Debug_083C259C
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808CB74+1

	thumb_func_end debug_sub_808CAC4

	thumb_func_start debug_sub_808CB1C
debug_sub_808CB1C:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._221       @ gUnknown_Debug_083C26C8
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._221 + 4   @ gDebug_0300070F
	mov	r0, #0x8
	strb	r0, [r1]
	ldr	r1, ._221 + 8   @ gMenuCallback
	ldr	r0, ._221 + 12  @ debug_sub_808CB74
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._222:
	.align	2, 0
._221:
	.word	gUnknown_Debug_083C26C8
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808CB74+1

	thumb_func_end debug_sub_808CB1C

	thumb_func_start debug_sub_808CB74
debug_sub_808CB74:
	push	{r4, r5, lr}
	bl	Menu_ProcessInput
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	bl	Menu_GetCursorPos
	add	r1, r0, #0
	ldr	r5, ._226       @ gDebug_0300070F
	ldrb	r0, [r5]
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	bl	debug_sub_808CBC0
	ldrb	r0, [r5]
	bl	debug_sub_808CC10
	lsl	r4, r4, #0x18
	asr	r4, r4, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r4, r0
	beq	._223	@cond_branch
	mov	r0, #0x1
	neg	r0, r0
	cmp	r4, r0
	beq	._224	@cond_branch
._223:
	mov	r0, #0x0
	b	._225
._227:
	.align	2, 0
._226:
	.word	gDebug_0300070F
._224:
	bl	CloseMenu
	mov	r0, #0x1
._225:
	pop	{r4, r5}
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808CB74

	thumb_func_start debug_sub_808CBC0
debug_sub_808CBC0:
	push	{r4, lr}
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	lsl	r1, r1, #0x18
	lsr	r3, r1, #0x18
	ldr	r0, ._231       @ gMain
	ldrh	r1, [r0, #0x2e]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._230	@cond_branch
	ldr	r0, ._231 + 4   @ gUnknown_Debug_083C271A
	lsl	r1, r2, #0x3
	add	r1, r1, r2
	add	r1, r1, r3
	lsl	r1, r1, #0x1
	add	r1, r1, r0
	ldrh	r4, [r1]
	add	r0, r4, #0
	bl	FlagGet
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	._229	@cond_branch
	add	r0, r4, #0
	bl	FlagSet
	b	._230
._232:
	.align	2, 0
._231:
	.word	gMain
	.word	gUnknown_Debug_083C271A
._229:
	add	r0, r4, #0
	bl	FlagClear
._230:
	pop	{r4}
	pop	{r0}
	bx	r0

	thumb_func_end debug_sub_808CBC0

	thumb_func_start debug_sub_808CC10
debug_sub_808CC10:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	mov	r5, #0x0
	ldr	r0, ._235       @ gUnknown_Debug_083C2710
	add	r0, r1, r0
	ldrb	r2, [r0]
	cmp	r5, r2
	bcs	._233	@cond_branch
	ldr	r0, ._235 + 4   @ gUnknown_Debug_083C271A
	mov	r8, r0
	lsl	r0, r1, #0x3
	add	r0, r0, r1
	lsl	r7, r0, #0x1
	add	r6, r2, #0
._234:
	lsl	r0, r5, #0x1
	add	r4, r0, #1
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	add	r0, r0, r7
	add r0, r0, r8
	ldrh	r0, [r0]
	bl	FlagGet
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	neg	r2, r0
	orr	r2, r2, r0
	lsr	r2, r2, #0x1f
	mov	r0, #0x1c
	add	r1, r4, #0
	bl	debug_sub_808F2E0
	add	r0, r5, #1
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	cmp	r5, r6
	bcc	._234	@cond_branch
._233:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._236:
	.align	2, 0
._235:
	.word	gUnknown_Debug_083C2710
	.word	gUnknown_Debug_083C271A

	thumb_func_end debug_sub_808CC10

	thumb_func_start debug_sub_808CC74
debug_sub_808CC74:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1c
	mov	r3, #0x7
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._237       @ gUnknown_Debug_083C1ADC
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x3
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1b
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x3
	bl	InitMenu
	ldr	r1, ._237 + 4   @ gMenuCallback
	ldr	r0, ._237 + 8   @ debug_sub_808CCC4
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._238:
	.align	2, 0
._237:
	.word	gUnknown_Debug_083C1ADC
	.word	gMenuCallback
	.word	debug_sub_808CCC4+1

	thumb_func_end debug_sub_808CC74

	thumb_func_start debug_sub_808CCC4
debug_sub_808CCC4:
	push	{lr}
	bl	Menu_ProcessInput
	lsl	r0, r0, #0x18
	asr	r1, r0, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r1, r0
	bne	._239	@cond_branch
	mov	r0, #0x0
	b	._242
._239:
	mov	r0, #0x1
	neg	r0, r0
	cmp	r1, r0
	beq	._241	@cond_branch
	ldr	r2, ._243       @ gMenuCallback
	ldr	r0, ._243 + 4   @ gUnknown_Debug_083C1ADC
	lsl	r1, r1, #0x3
	add	r0, r0, #0x4
	add	r1, r1, r0
	ldr	r0, [r1]
	str	r0, [r2]
	mov	r0, #0x0
	b	._242
._244:
	.align	2, 0
._243:
	.word	gMenuCallback
	.word	gUnknown_Debug_083C1ADC
._241:
	bl	CloseMenu
	mov	r0, #0x1
._242:
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808CCC4

	thumb_func_start debug_sub_808CD08
debug_sub_808CD08:
	push	{r4, lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x11
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._245       @ gUnknown_Debug_083C1B7C
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x8
	bl	Menu_PrintItems
	mov	r4, #0x0
	str	r4, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x8
	bl	InitMenu
	ldr	r0, ._245 + 4   @ gDebug_0300070F
	strb	r4, [r0]
	ldr	r1, ._245 + 8   @ gMenuCallback
	ldr	r0, ._245 + 12  @ debug_sub_808CE10
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r4}
	pop	{r1}
	bx	r1
._246:
	.align	2, 0
._245:
	.word	gUnknown_Debug_083C1B7C
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808CE10+1

	thumb_func_end debug_sub_808CD08

	thumb_func_start debug_sub_808CD60
debug_sub_808CD60:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x9
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._247       @ gUnknown_Debug_083C1BF0
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x4
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x4
	bl	InitMenu
	ldr	r1, ._247 + 4   @ gDebug_0300070F
	mov	r0, #0x1
	strb	r0, [r1]
	ldr	r1, ._247 + 8   @ gMenuCallback
	ldr	r0, ._247 + 12  @ debug_sub_808CE10
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._248:
	.align	2, 0
._247:
	.word	gUnknown_Debug_083C1BF0
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808CE10+1

	thumb_func_end debug_sub_808CD60

	thumb_func_start debug_sub_808CDB8
debug_sub_808CDB8:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x3
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._249       @ gUnknown_Debug_083C1C2C
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x1
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x1
	bl	InitMenu
	ldr	r1, ._249 + 4   @ gDebug_0300070F
	mov	r0, #0x2
	strb	r0, [r1]
	ldr	r1, ._249 + 8   @ gMenuCallback
	ldr	r0, ._249 + 12  @ debug_sub_808CE10
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._250:
	.align	2, 0
._249:
	.word	gUnknown_Debug_083C1C2C
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808CE10+1

	thumb_func_end debug_sub_808CDB8

	thumb_func_start debug_sub_808CE10
debug_sub_808CE10:
	push	{r4, r5, lr}
	bl	Menu_ProcessInput
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	bl	Menu_GetCursorPos
	add	r1, r0, #0
	ldr	r5, ._254       @ gDebug_0300070F
	ldrb	r0, [r5]
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	bl	debug_sub_808CE5C
	ldrb	r0, [r5]
	bl	debug_sub_808CEAC
	lsl	r4, r4, #0x18
	asr	r4, r4, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r4, r0
	beq	._251	@cond_branch
	mov	r0, #0x1
	neg	r0, r0
	cmp	r4, r0
	beq	._252	@cond_branch
._251:
	mov	r0, #0x0
	b	._253
._255:
	.align	2, 0
._254:
	.word	gDebug_0300070F
._252:
	bl	CloseMenu
	mov	r0, #0x1
._253:
	pop	{r4, r5}
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808CE10

	thumb_func_start debug_sub_808CE5C
debug_sub_808CE5C:
	push	{r4, lr}
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	lsl	r1, r1, #0x18
	lsr	r3, r1, #0x18
	ldr	r0, ._259       @ gMain
	ldrh	r1, [r0, #0x2e]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._258	@cond_branch
	ldr	r0, ._259 + 4   @ gUnknown_Debug_083C1C38
	lsl	r1, r2, #0x3
	add	r1, r1, r2
	add	r1, r1, r3
	lsl	r1, r1, #0x1
	add	r1, r1, r0
	ldrh	r4, [r1]
	add	r0, r4, #0
	bl	FlagGet
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	._257	@cond_branch
	add	r0, r4, #0
	bl	FlagSet
	b	._258
._260:
	.align	2, 0
._259:
	.word	gMain
	.word	gUnknown_Debug_083C1C38
._257:
	add	r0, r4, #0
	bl	FlagClear
._258:
	pop	{r4}
	pop	{r0}
	bx	r0

	thumb_func_end debug_sub_808CE5C

	thumb_func_start debug_sub_808CEAC
debug_sub_808CEAC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	mov	r5, #0x0
	ldr	r0, ._263       @ gUnknown_Debug_083C1C34
	add	r0, r1, r0
	ldrb	r2, [r0]
	cmp	r5, r2
	bcs	._261	@cond_branch
	ldr	r0, ._263 + 4   @ gUnknown_Debug_083C1C38
	mov	r8, r0
	lsl	r0, r1, #0x3
	add	r0, r0, r1
	lsl	r7, r0, #0x1
	add	r6, r2, #0
._262:
	lsl	r0, r5, #0x1
	add	r4, r0, #1
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	add	r0, r0, r7
	add r0, r0, r8
	ldrh	r0, [r0]
	bl	FlagGet
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	neg	r2, r0
	orr	r2, r2, r0
	lsr	r2, r2, #0x1f
	mov	r0, #0x1c
	add	r1, r4, #0
	bl	debug_sub_808F2E0
	add	r0, r5, #1
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	cmp	r5, r6
	bcc	._262	@cond_branch
._261:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._264:
	.align	2, 0
._263:
	.word	gUnknown_Debug_083C1C34
	.word	gUnknown_Debug_083C1C38

	thumb_func_end debug_sub_808CEAC

	thumb_func_start debug_sub_808CF10
debug_sub_808CF10:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1c
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._265       @ gUnknown_Debug_083C1330
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1b
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._265 + 4   @ gMenuCallback
	ldr	r0, ._265 + 8   @ debug_sub_808CF60
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._266:
	.align	2, 0
._265:
	.word	gUnknown_Debug_083C1330
	.word	gMenuCallback
	.word	debug_sub_808CF60+1

	thumb_func_end debug_sub_808CF10

	thumb_func_start debug_sub_808CF60
debug_sub_808CF60:
	push	{lr}
	bl	Menu_ProcessInput
	lsl	r0, r0, #0x18
	asr	r1, r0, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r1, r0
	bne	._267	@cond_branch
	mov	r0, #0x0
	b	._270
._267:
	mov	r0, #0x1
	neg	r0, r0
	cmp	r1, r0
	beq	._269	@cond_branch
	ldr	r2, ._271       @ gMenuCallback
	ldr	r0, ._271 + 4   @ gUnknown_Debug_083C1330
	lsl	r1, r1, #0x3
	add	r0, r0, #0x4
	add	r1, r1, r0
	ldr	r0, [r1]
	str	r0, [r2]
	mov	r0, #0x0
	b	._270
._272:
	.align	2, 0
._271:
	.word	gMenuCallback
	.word	gUnknown_Debug_083C1330
._269:
	bl	CloseMenu
	mov	r0, #0x1
._270:
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808CF60

	thumb_func_start debug_sub_808CFA4
debug_sub_808CFA4:
	push	{r4, lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x11
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._273       @ gUnknown_Debug_083C13D8
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x8
	bl	Menu_PrintItems
	mov	r4, #0x0
	str	r4, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x8
	bl	InitMenu
	ldr	r0, ._273 + 4   @ gDebug_0300070F
	strb	r4, [r0]
	ldr	r1, ._273 + 8   @ gMenuCallback
	ldr	r0, ._273 + 12  @ debug_sub_808D2BC
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r4}
	pop	{r1}
	bx	r1
._274:
	.align	2, 0
._273:
	.word	gUnknown_Debug_083C13D8
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808D2BC+1

	thumb_func_end debug_sub_808CFA4

	thumb_func_start debug_sub_808CFFC
debug_sub_808CFFC:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0xf
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._275       @ gUnknown_Debug_083C1465
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
	ldr	r1, ._275 + 4   @ gDebug_0300070F
	mov	r0, #0x1
	strb	r0, [r1]
	ldr	r1, ._275 + 8   @ gMenuCallback
	ldr	r0, ._275 + 12  @ debug_sub_808D2BC
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._276:
	.align	2, 0
._275:
	.word	gUnknown_Debug_083C1465
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808D2BC+1

	thumb_func_end debug_sub_808CFFC

	thumb_func_start debug_sub_808D054
debug_sub_808D054:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._277       @ gUnknown_Debug_083C1503
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._277 + 4   @ gDebug_0300070F
	mov	r0, #0x2
	strb	r0, [r1]
	ldr	r1, ._277 + 8   @ gMenuCallback
	ldr	r0, ._277 + 12  @ debug_sub_808D2BC
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._278:
	.align	2, 0
._277:
	.word	gUnknown_Debug_083C1503
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808D2BC+1

	thumb_func_end debug_sub_808D054

	thumb_func_start debug_sub_808D0AC
debug_sub_808D0AC:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x9
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._279       @ gUnknown_Debug_083C158A
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x4
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x4
	bl	InitMenu
	ldr	r1, ._279 + 4   @ gDebug_0300070F
	mov	r0, #0x3
	strb	r0, [r1]
	ldr	r1, ._279 + 8   @ gMenuCallback
	ldr	r0, ._279 + 12  @ debug_sub_808D2BC
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._280:
	.align	2, 0
._279:
	.word	gUnknown_Debug_083C158A
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808D2BC+1

	thumb_func_end debug_sub_808D0AC

	thumb_func_start debug_sub_808D104
debug_sub_808D104:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._281       @ gUnknown_Debug_083C1647
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._281 + 4   @ gDebug_0300070F
	mov	r0, #0x4
	strb	r0, [r1]
	ldr	r1, ._281 + 8   @ gMenuCallback
	ldr	r0, ._281 + 12  @ debug_sub_808D2BC
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._282:
	.align	2, 0
._281:
	.word	gUnknown_Debug_083C1647
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808D2BC+1

	thumb_func_end debug_sub_808D104

	thumb_func_start debug_sub_808D15C
debug_sub_808D15C:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._283       @ gUnknown_Debug_083C1712
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._283 + 4   @ gDebug_0300070F
	mov	r0, #0x5
	strb	r0, [r1]
	ldr	r1, ._283 + 8   @ gMenuCallback
	ldr	r0, ._283 + 12  @ debug_sub_808D2BC
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._284:
	.align	2, 0
._283:
	.word	gUnknown_Debug_083C1712
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808D2BC+1

	thumb_func_end debug_sub_808D15C

	thumb_func_start debug_sub_808D1B4
debug_sub_808D1B4:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._285       @ gUnknown_Debug_083C17F8
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._285 + 4   @ gDebug_0300070F
	mov	r0, #0x6
	strb	r0, [r1]
	ldr	r1, ._285 + 8   @ gMenuCallback
	ldr	r0, ._285 + 12  @ debug_sub_808D2BC
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._286:
	.align	2, 0
._285:
	.word	gUnknown_Debug_083C17F8
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808D2BC+1

	thumb_func_end debug_sub_808D1B4

	thumb_func_start debug_sub_808D20C
debug_sub_808D20C:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0xf
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._287       @ gUnknown_Debug_083C18B8
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
	ldr	r1, ._287 + 4   @ gDebug_0300070F
	mov	r0, #0x7
	strb	r0, [r1]
	ldr	r1, ._287 + 8   @ gMenuCallback
	ldr	r0, ._287 + 12  @ debug_sub_808D2BC
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._288:
	.align	2, 0
._287:
	.word	gUnknown_Debug_083C18B8
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808D2BC+1

	thumb_func_end debug_sub_808D20C

	thumb_func_start debug_sub_808D264
debug_sub_808D264:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0xb
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._289       @ gDebug_0x83C1974
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x5
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x5
	bl	InitMenu
	ldr	r1, ._289 + 4   @ gDebug_0300070F
	mov	r0, #0x8
	strb	r0, [r1]
	ldr	r1, ._289 + 8   @ gMenuCallback
	ldr	r0, ._289 + 12  @ debug_sub_808D2BC
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._290:
	.align	2, 0
._289:
	.word	gDebug_0x83C1974
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808D2BC+1

	thumb_func_end debug_sub_808D264

	thumb_func_start debug_sub_808D2BC
debug_sub_808D2BC:
	push	{r4, r5, lr}
	bl	Menu_ProcessInput
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	bl	Menu_GetCursorPos
	add	r1, r0, #0
	ldr	r5, ._294       @ gDebug_0300070F
	ldrb	r0, [r5]
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	bl	debug_sub_808D308
	ldrb	r0, [r5]
	bl	debug_sub_808D358
	lsl	r4, r4, #0x18
	asr	r4, r4, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r4, r0
	beq	._291	@cond_branch
	mov	r0, #0x1
	neg	r0, r0
	cmp	r4, r0
	beq	._292	@cond_branch
._291:
	mov	r0, #0x0
	b	._293
._295:
	.align	2, 0
._294:
	.word	gDebug_0300070F
._292:
	bl	CloseMenu
	mov	r0, #0x1
._293:
	pop	{r4, r5}
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808D2BC

	thumb_func_start debug_sub_808D308
debug_sub_808D308:
	push	{r4, lr}
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	lsl	r1, r1, #0x18
	lsr	r3, r1, #0x18
	ldr	r0, ._299       @ gMain
	ldrh	r1, [r0, #0x2e]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._298	@cond_branch
	ldr	r0, ._299 + 4   @ gUnknown_Debug_083C19C6
	lsl	r1, r2, #0x3
	add	r1, r1, r2
	add	r1, r1, r3
	lsl	r1, r1, #0x1
	add	r1, r1, r0
	ldrh	r4, [r1]
	add	r0, r4, #0
	bl	FlagGet
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	._297	@cond_branch
	add	r0, r4, #0
	bl	FlagSet
	b	._298
._300:
	.align	2, 0
._299:
	.word	gMain
	.word	gUnknown_Debug_083C19C6
._297:
	add	r0, r4, #0
	bl	FlagClear
._298:
	pop	{r4}
	pop	{r0}
	bx	r0

	thumb_func_end debug_sub_808D308

	thumb_func_start debug_sub_808D358
debug_sub_808D358:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	mov	r5, #0x0
	ldr	r0, ._303       @ gUnknown_Debug_083C19BC
	add	r0, r1, r0
	ldrb	r2, [r0]
	cmp	r5, r2
	bcs	._301	@cond_branch
	ldr	r0, ._303 + 4   @ gUnknown_Debug_083C19C6
	mov	r8, r0
	lsl	r0, r1, #0x3
	add	r0, r0, r1
	lsl	r7, r0, #0x1
	add	r6, r2, #0
._302:
	lsl	r0, r5, #0x1
	add	r4, r0, #1
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	add	r0, r0, r7
	add r0, r0, r8
	ldrh	r0, [r0]
	bl	FlagGet
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	neg	r2, r0
	orr	r2, r2, r0
	lsr	r2, r2, #0x1f
	mov	r0, #0x1c
	add	r1, r4, #0
	bl	debug_sub_808F2E0
	add	r0, r5, #1
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	cmp	r5, r6
	bcc	._302	@cond_branch
._301:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._304:
	.align	2, 0
._303:
	.word	gUnknown_Debug_083C19BC
	.word	gUnknown_Debug_083C19C6

	thumb_func_end debug_sub_808D358

	thumb_func_start debug_sub_808D3BC
debug_sub_808D3BC:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1c
	mov	r3, #0x5
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._305       @ gUnknown_Debug_083C105C
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x2
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1b
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x2
	bl	InitMenu
	ldr	r1, ._305 + 4   @ gMenuCallback
	ldr	r0, ._305 + 8   @ debug_sub_808D40C
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._306:
	.align	2, 0
._305:
	.word	gUnknown_Debug_083C105C
	.word	gMenuCallback
	.word	debug_sub_808D40C+1

	thumb_func_end debug_sub_808D3BC

	thumb_func_start debug_sub_808D40C
debug_sub_808D40C:
	push	{lr}
	bl	Menu_ProcessInput
	lsl	r0, r0, #0x18
	asr	r1, r0, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r1, r0
	bne	._307	@cond_branch
	mov	r0, #0x0
	b	._310
._307:
	mov	r0, #0x1
	neg	r0, r0
	cmp	r1, r0
	beq	._309	@cond_branch
	ldr	r2, ._311       @ gMenuCallback
	ldr	r0, ._311 + 4   @ gUnknown_Debug_083C105C
	lsl	r1, r1, #0x3
	add	r0, r0, #0x4
	add	r1, r1, r0
	ldr	r0, [r1]
	str	r0, [r2]
	mov	r0, #0x0
	b	._310
._312:
	.align	2, 0
._311:
	.word	gMenuCallback
	.word	gUnknown_Debug_083C105C
._309:
	bl	CloseMenu
	mov	r0, #0x1
._310:
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808D40C

	thumb_func_start debug_sub_808D450
debug_sub_808D450:
	push	{r4, lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._313       @ gUnknown_Debug_083C10BD
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
	ldr	r0, ._313 + 4   @ gDebug_0300070F
	strb	r4, [r0]
	ldr	r1, ._313 + 8   @ gMenuCallback
	ldr	r0, ._313 + 12  @ debug_sub_808D500
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r4}
	pop	{r1}
	bx	r1
._314:
	.align	2, 0
._313:
	.word	gUnknown_Debug_083C10BD
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808D500+1

	thumb_func_end debug_sub_808D450

	thumb_func_start debug_sub_808D4A8
debug_sub_808D4A8:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0xf
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._315       @ gUnknown_Debug_083C1149
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
	ldr	r1, ._315 + 4   @ gDebug_0300070F
	mov	r0, #0x1
	strb	r0, [r1]
	ldr	r1, ._315 + 8   @ gMenuCallback
	ldr	r0, ._315 + 12  @ debug_sub_808D500
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._316:
	.align	2, 0
._315:
	.word	gUnknown_Debug_083C1149
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808D500+1

	thumb_func_end debug_sub_808D4A8

	thumb_func_start debug_sub_808D500
debug_sub_808D500:
	push	{r4, r5, lr}
	bl	Menu_ProcessInput
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	bl	Menu_GetCursorPos
	add	r1, r0, #0
	ldr	r5, ._320       @ gDebug_0300070F
	ldrb	r0, [r5]
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	bl	debug_sub_808D54C
	ldrb	r0, [r5]
	bl	debug_sub_808D59C
	lsl	r4, r4, #0x18
	asr	r4, r4, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r4, r0
	beq	._317	@cond_branch
	mov	r0, #0x1
	neg	r0, r0
	cmp	r4, r0
	beq	._318	@cond_branch
._317:
	mov	r0, #0x0
	b	._319
._321:
	.align	2, 0
._320:
	.word	gDebug_0300070F
._318:
	bl	CloseMenu
	mov	r0, #0x1
._319:
	pop	{r4, r5}
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808D500

	thumb_func_start debug_sub_808D54C
debug_sub_808D54C:
	push	{r4, lr}
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	lsl	r1, r1, #0x18
	lsr	r3, r1, #0x18
	ldr	r0, ._325       @ gMain
	ldrh	r1, [r0, #0x2e]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._324	@cond_branch
	ldr	r0, ._325 + 4   @ gUnknown_Debug_083C1196
	lsl	r1, r2, #0x3
	add	r1, r1, r2
	add	r1, r1, r3
	lsl	r1, r1, #0x1
	add	r1, r1, r0
	ldrh	r4, [r1]
	add	r0, r4, #0
	bl	FlagGet
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	._323	@cond_branch
	add	r0, r4, #0
	bl	FlagSet
	b	._324
._326:
	.align	2, 0
._325:
	.word	gMain
	.word	gUnknown_Debug_083C1196
._323:
	add	r0, r4, #0
	bl	FlagClear
._324:
	pop	{r4}
	pop	{r0}
	bx	r0

	thumb_func_end debug_sub_808D54C

	thumb_func_start debug_sub_808D59C
debug_sub_808D59C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	mov	r5, #0x0
	ldr	r0, ._329       @ gUnknown_Debug_083C1194
	add	r0, r1, r0
	ldrb	r2, [r0]
	cmp	r5, r2
	bcs	._327	@cond_branch
	ldr	r0, ._329 + 4   @ gUnknown_Debug_083C1196
	mov	r8, r0
	lsl	r0, r1, #0x3
	add	r0, r0, r1
	lsl	r7, r0, #0x1
	add	r6, r2, #0
._328:
	lsl	r0, r5, #0x1
	add	r4, r0, #1
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	add	r0, r0, r7
	add r0, r0, r8
	ldrh	r0, [r0]
	bl	FlagGet
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	neg	r2, r0
	orr	r2, r2, r0
	lsr	r2, r2, #0x1f
	mov	r0, #0x1c
	add	r1, r4, #0
	bl	debug_sub_808F2E0
	add	r0, r5, #1
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	cmp	r5, r6
	bcc	._328	@cond_branch
._327:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._330:
	.align	2, 0
._329:
	.word	gUnknown_Debug_083C1194
	.word	gUnknown_Debug_083C1196

	thumb_func_end debug_sub_808D59C

	thumb_func_start debug_sub_808D600
debug_sub_808D600:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1c
	mov	r3, #0x5
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._331       @ gUnknown_Debug_083C11CC
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x2
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1b
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x2
	bl	InitMenu
	ldr	r1, ._331 + 4   @ gMenuCallback
	ldr	r0, ._331 + 8   @ debug_sub_808D650
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._332:
	.align	2, 0
._331:
	.word	gUnknown_Debug_083C11CC
	.word	gMenuCallback
	.word	debug_sub_808D650+1

	thumb_func_end debug_sub_808D600

	thumb_func_start debug_sub_808D650
debug_sub_808D650:
	push	{lr}
	bl	Menu_ProcessInput
	lsl	r0, r0, #0x18
	asr	r1, r0, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r1, r0
	bne	._333	@cond_branch
	mov	r0, #0x0
	b	._336
._333:
	mov	r0, #0x1
	neg	r0, r0
	cmp	r1, r0
	beq	._335	@cond_branch
	ldr	r2, ._337       @ gMenuCallback
	ldr	r0, ._337 + 4   @ gUnknown_Debug_083C11CC
	lsl	r1, r1, #0x3
	add	r0, r0, #0x4
	add	r1, r1, r0
	ldr	r0, [r1]
	str	r0, [r2]
	mov	r0, #0x0
	b	._336
._338:
	.align	2, 0
._337:
	.word	gMenuCallback
	.word	gUnknown_Debug_083C11CC
._335:
	bl	CloseMenu
	mov	r0, #0x1
._336:
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808D650

	thumb_func_start debug_sub_808D694
debug_sub_808D694:
	push	{r4, lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._339       @ gUnknown_Debug_083C1212
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
	ldr	r0, ._339 + 4   @ gDebug_0300070F
	strb	r4, [r0]
	ldr	r1, ._339 + 8   @ gMenuCallback
	ldr	r0, ._339 + 12  @ debug_sub_808D744
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r4}
	pop	{r1}
	bx	r1
._340:
	.align	2, 0
._339:
	.word	gUnknown_Debug_083C1212
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808D744+1

	thumb_func_end debug_sub_808D694

	thumb_func_start debug_sub_808D6EC
debug_sub_808D6EC:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0xf
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._341       @ gUnknown_Debug_083C1288
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
	ldr	r1, ._341 + 4   @ gDebug_0300070F
	mov	r0, #0x1
	strb	r0, [r1]
	ldr	r1, ._341 + 8   @ gMenuCallback
	ldr	r0, ._341 + 12  @ debug_sub_808D744
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._342:
	.align	2, 0
._341:
	.word	gUnknown_Debug_083C1288
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808D744+1

	thumb_func_end debug_sub_808D6EC

	thumb_func_start debug_sub_808D744
debug_sub_808D744:
	push	{r4, r5, lr}
	bl	Menu_ProcessInput
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	bl	Menu_GetCursorPos
	add	r1, r0, #0
	ldr	r5, ._346       @ gDebug_0300070F
	ldrb	r0, [r5]
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	bl	debug_sub_808D790
	ldrb	r0, [r5]
	bl	debug_sub_808D7E0
	lsl	r4, r4, #0x18
	asr	r4, r4, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r4, r0
	beq	._343	@cond_branch
	mov	r0, #0x1
	neg	r0, r0
	cmp	r4, r0
	beq	._344	@cond_branch
._343:
	mov	r0, #0x0
	b	._345
._347:
	.align	2, 0
._346:
	.word	gDebug_0300070F
._344:
	bl	CloseMenu
	mov	r0, #0x1
._345:
	pop	{r4, r5}
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808D744

	thumb_func_start debug_sub_808D790
debug_sub_808D790:
	push	{r4, lr}
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	lsl	r1, r1, #0x18
	lsr	r3, r1, #0x18
	ldr	r0, ._351       @ gMain
	ldrh	r1, [r0, #0x2e]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._350	@cond_branch
	ldr	r0, ._351 + 4   @ gUnknown_Debug_083C12D2
	lsl	r1, r2, #0x3
	add	r1, r1, r2
	add	r1, r1, r3
	lsl	r1, r1, #0x1
	add	r1, r1, r0
	ldrh	r4, [r1]
	add	r0, r4, #0
	bl	FlagGet
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	._349	@cond_branch
	add	r0, r4, #0
	bl	FlagSet
	b	._350
._352:
	.align	2, 0
._351:
	.word	gMain
	.word	gUnknown_Debug_083C12D2
._349:
	add	r0, r4, #0
	bl	FlagClear
._350:
	pop	{r4}
	pop	{r0}
	bx	r0

	thumb_func_end debug_sub_808D790

	thumb_func_start debug_sub_808D7E0
debug_sub_808D7E0:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	mov	r5, #0x0
	ldr	r0, ._355       @ gUnknown_Debug_083C12D0
	add	r0, r1, r0
	ldrb	r2, [r0]
	cmp	r5, r2
	bcs	._353	@cond_branch
	ldr	r0, ._355 + 4   @ gUnknown_Debug_083C12D2
	mov	r8, r0
	lsl	r0, r1, #0x3
	add	r0, r0, r1
	lsl	r7, r0, #0x1
	add	r6, r2, #0
._354:
	lsl	r0, r5, #0x1
	add	r4, r0, #1
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	add	r0, r0, r7
	add r0, r0, r8
	ldrh	r0, [r0]
	bl	FlagGet
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	neg	r2, r0
	orr	r2, r2, r0
	lsr	r2, r2, #0x1f
	mov	r0, #0x1c
	add	r1, r4, #0
	bl	debug_sub_808F2E0
	add	r0, r5, #1
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	cmp	r5, r6
	bcc	._354	@cond_branch
._353:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._356:
	.align	2, 0
._355:
	.word	gUnknown_Debug_083C12D0
	.word	gUnknown_Debug_083C12D2

	thumb_func_end debug_sub_808D7E0

	thumb_func_start debug_sub_808D844
debug_sub_808D844:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1c
	mov	r3, #0x3
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._357       @ gUnknown_Debug_083C1A78
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x1
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1b
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x1
	bl	InitMenu
	ldr	r1, ._357 + 4   @ gMenuCallback
	ldr	r0, ._357 + 8   @ debug_sub_808D894
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._358:
	.align	2, 0
._357:
	.word	gUnknown_Debug_083C1A78
	.word	gMenuCallback
	.word	debug_sub_808D894+1

	thumb_func_end debug_sub_808D844

	thumb_func_start debug_sub_808D894
debug_sub_808D894:
	push	{lr}
	bl	Menu_ProcessInput
	lsl	r0, r0, #0x18
	asr	r3, r0, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r3, r0
	bne	._359	@cond_branch
	mov	r0, #0x0
	b	._362
._359:
	mov	r0, #0x1
	neg	r0, r0
	cmp	r3, r0
	beq	._361	@cond_branch
	ldr	r2, ._363       @ gMenuCallback
	ldr	r1, ._363 + 4   @ gUnknown_Debug_083C1A78
	lsl	r0, r3, #0x3
	add	r0, r0, r1
	ldr	r0, [r0, #0x4]
	str	r0, [r2]
	mov	r0, #0x0
	b	._362
._364:
	.align	2, 0
._363:
	.word	gMenuCallback
	.word	gUnknown_Debug_083C1A78
._361:
	bl	CloseMenu
	mov	r0, #0x1
._362:
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808D894

	thumb_func_start debug_sub_808D8D8
debug_sub_808D8D8:
	push	{r4, lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x5
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._365       @ gUnknown_Debug_083C1A9C
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x2
	bl	Menu_PrintItems
	mov	r4, #0x0
	str	r4, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x2
	bl	InitMenu
	ldr	r0, ._365 + 4   @ gDebug_0300070F
	strb	r4, [r0]
	ldr	r1, ._365 + 8   @ gMenuCallback
	ldr	r0, ._365 + 12  @ debug_sub_808D930
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r4}
	pop	{r1}
	bx	r1
._366:
	.align	2, 0
._365:
	.word	gUnknown_Debug_083C1A9C
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808D930+1

	thumb_func_end debug_sub_808D8D8

	thumb_func_start debug_sub_808D930
debug_sub_808D930:
	push	{r4, r5, lr}
	bl	Menu_ProcessInput
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	bl	Menu_GetCursorPos
	add	r1, r0, #0
	ldr	r5, ._370       @ gDebug_0300070F
	ldrb	r0, [r5]
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	bl	debug_sub_808D97C
	ldrb	r0, [r5]
	bl	debug_sub_808D9CC
	lsl	r4, r4, #0x18
	asr	r4, r4, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r4, r0
	beq	._367	@cond_branch
	mov	r0, #0x1
	neg	r0, r0
	cmp	r4, r0
	beq	._368	@cond_branch
._367:
	mov	r0, #0x0
	b	._369
._371:
	.align	2, 0
._370:
	.word	gDebug_0300070F
._368:
	bl	CloseMenu
	mov	r0, #0x1
._369:
	pop	{r4, r5}
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808D930

	thumb_func_start debug_sub_808D97C
debug_sub_808D97C:
	push	{r4, lr}
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	lsl	r1, r1, #0x18
	lsr	r3, r1, #0x18
	ldr	r0, ._375       @ gMain
	ldrh	r1, [r0, #0x2e]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._374	@cond_branch
	ldr	r0, ._375 + 4   @ gUnknown_Debug_083C1AAE
	lsl	r1, r2, #0x3
	add	r1, r1, r2
	add	r1, r1, r3
	lsl	r1, r1, #0x1
	add	r1, r1, r0
	ldrh	r4, [r1]
	add	r0, r4, #0
	bl	FlagGet
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	._373	@cond_branch
	add	r0, r4, #0
	bl	FlagSet
	b	._374
._376:
	.align	2, 0
._375:
	.word	gMain
	.word	gUnknown_Debug_083C1AAE
._373:
	add	r0, r4, #0
	bl	FlagClear
._374:
	pop	{r4}
	pop	{r0}
	bx	r0

	thumb_func_end debug_sub_808D97C

	thumb_func_start debug_sub_808D9CC
debug_sub_808D9CC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	mov	r5, #0x0
	ldr	r0, ._379       @ gUnknown_Debug_083C1AAC
	add	r0, r1, r0
	ldrb	r2, [r0]
	cmp	r5, r2
	bcs	._377	@cond_branch
	ldr	r0, ._379 + 4   @ gUnknown_Debug_083C1AAE
	mov	r8, r0
	lsl	r0, r1, #0x3
	add	r0, r0, r1
	lsl	r7, r0, #0x1
	add	r6, r2, #0
._378:
	lsl	r0, r5, #0x1
	add	r4, r0, #1
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	add	r0, r0, r7
	add r0, r0, r8
	ldrh	r0, [r0]
	bl	FlagGet
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	neg	r2, r0
	orr	r2, r2, r0
	lsr	r2, r2, #0x1f
	mov	r0, #0x1c
	add	r1, r4, #0
	bl	debug_sub_808F2E0
	add	r0, r5, #1
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	cmp	r5, r6
	bcc	._378	@cond_branch
._377:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._380:
	.align	2, 0
._379:
	.word	gUnknown_Debug_083C1AAC
	.word	gUnknown_Debug_083C1AAE

	thumb_func_end debug_sub_808D9CC

	thumb_func_start debug_sub_808DA30
debug_sub_808DA30:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x3
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._381       @ gUnknown_Debug_083C103A
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x1
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x1
	bl	InitMenu
	ldr	r1, ._381 + 4   @ gMenuCallback
	ldr	r0, ._381 + 8   @ debug_sub_808DA80
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._382:
	.align	2, 0
._381:
	.word	gUnknown_Debug_083C103A
	.word	gMenuCallback
	.word	debug_sub_808DA80+1

	thumb_func_end debug_sub_808DA30

	thumb_func_start debug_sub_808DA80
debug_sub_808DA80:
	push	{r4, lr}
	bl	Menu_ProcessInput
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	bl	Menu_GetCursorPos
	bl	debug_sub_808DAD4
	bl	debug_sub_808DABC
	lsl	r4, r4, #0x18
	asr	r4, r4, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r4, r0
	beq	._383	@cond_branch
	mov	r0, #0x1
	neg	r0, r0
	cmp	r4, r0
	beq	._384	@cond_branch
._383:
	mov	r0, #0x0
	b	._385
._384:
	bl	CloseMenu
	mov	r0, #0x1
._385:
	pop	{r4}
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808DA80

	thumb_func_start debug_sub_808DABC
debug_sub_808DABC:
	push	{lr}
	ldr	r0, ._386       @ gSpecialVar_Result
	ldrh	r2, [r0]
	mov	r0, #0x18
	mov	r1, #0x1
	bl	debug_sub_808F31C
	pop	{r0}
	bx	r0
._387:
	.align	2, 0
._386:
	.word	gSpecialVar_Result

	thumb_func_end debug_sub_808DABC

	thumb_func_start debug_sub_808DAD4
debug_sub_808DAD4:
	push	{lr}
	ldr	r0, ._390       @ gMain
	ldrh	r1, [r0, #0x2e]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._388	@cond_branch
	mov	r2, #0x1
	b	._389
._391:
	.align	2, 0
._390:
	.word	gMain
._388:
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	._392	@cond_branch
	ldr	r2, ._393       @ 0xffff
._389:
	ldr	r1, ._393 + 4   @ gSpecialVar_Result
	ldrh	r0, [r1]
	add	r0, r2, r0
	strh	r0, [r1]
._392:
	pop	{r0}
	bx	r0
._394:
	.align	2, 0
._393:
	.word	0xffff
	.word	gSpecialVar_Result

	thumb_func_end debug_sub_808DAD4

	thumb_func_start debug_sub_808DB0C
debug_sub_808DB0C:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x18
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._395       @ gUnknown_Debug_083C3D08
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x17
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._395 + 4   @ gMenuCallback
	ldr	r0, ._395 + 8   @ debug_sub_808DB5C
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._396:
	.align	2, 0
._395:
	.word	gUnknown_Debug_083C3D08
	.word	gMenuCallback
	.word	debug_sub_808DB5C+1

	thumb_func_end debug_sub_808DB0C

	thumb_func_start debug_sub_808DB5C
debug_sub_808DB5C:
	push	{lr}
	bl	Menu_ProcessInput
	lsl	r0, r0, #0x18
	asr	r1, r0, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r1, r0
	bne	._397	@cond_branch
	mov	r0, #0x0
	b	._400
._397:
	mov	r0, #0x1
	neg	r0, r0
	cmp	r1, r0
	beq	._399	@cond_branch
	ldr	r2, ._401       @ gMenuCallback
	ldr	r0, ._401 + 4   @ gUnknown_Debug_083C3D08
	lsl	r1, r1, #0x3
	add	r0, r0, #0x4
	add	r1, r1, r0
	ldr	r0, [r1]
	str	r0, [r2]
	mov	r0, #0x0
	b	._400
._402:
	.align	2, 0
._401:
	.word	gMenuCallback
	.word	gUnknown_Debug_083C3D08
._399:
	bl	CloseMenu
	mov	r0, #0x1
._400:
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808DB5C

	thumb_func_start debug_sub_808DBA0
debug_sub_808DBA0:
	push	{r4, lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x11
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._403       @ gUnknown_Debug_083C432C
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x8
	bl	Menu_PrintItems
	mov	r4, #0x0
	str	r4, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x8
	bl	InitMenu
	ldr	r0, ._403 + 4   @ gDebug_0300070F
	strb	r4, [r0]
	ldr	r1, ._403 + 8   @ gMenuCallback
	ldr	r0, ._403 + 12  @ debug_sub_808DEB8
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r4}
	pop	{r1}
	bx	r1
._404:
	.align	2, 0
._403:
	.word	gUnknown_Debug_083C432C
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808DEB8+1

	thumb_func_end debug_sub_808DBA0

	thumb_func_start debug_sub_808DBF8
debug_sub_808DBF8:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._405       @ gUnknown_Debug_083C436C
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._405 + 4   @ gDebug_0300070F
	mov	r0, #0x1
	strb	r0, [r1]
	ldr	r1, ._405 + 8   @ gMenuCallback
	ldr	r0, ._405 + 12  @ debug_sub_808DEB8
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._406:
	.align	2, 0
._405:
	.word	gUnknown_Debug_083C436C
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808DEB8+1

	thumb_func_end debug_sub_808DBF8

	thumb_func_start debug_sub_808DC50
debug_sub_808DC50:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._407       @ gUnknown_Debug_083C43B4
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._407 + 4   @ gDebug_0300070F
	mov	r0, #0x2
	strb	r0, [r1]
	ldr	r1, ._407 + 8   @ gMenuCallback
	ldr	r0, ._407 + 12  @ debug_sub_808DEB8
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._408:
	.align	2, 0
._407:
	.word	gUnknown_Debug_083C43B4
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808DEB8+1

	thumb_func_end debug_sub_808DC50

	thumb_func_start debug_sub_808DCA8
debug_sub_808DCA8:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._409       @ gUnknown_Debug_083C43FC
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._409 + 4   @ gDebug_0300070F
	mov	r0, #0x3
	strb	r0, [r1]
	ldr	r1, ._409 + 8   @ gMenuCallback
	ldr	r0, ._409 + 12  @ debug_sub_808DEB8
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._410:
	.align	2, 0
._409:
	.word	gUnknown_Debug_083C43FC
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808DEB8+1

	thumb_func_end debug_sub_808DCA8

	thumb_func_start debug_sub_808DD00
debug_sub_808DD00:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._411       @ gUnknown_Debug_083C4444
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._411 + 4   @ gDebug_0300070F
	mov	r0, #0x4
	strb	r0, [r1]
	ldr	r1, ._411 + 8   @ gMenuCallback
	ldr	r0, ._411 + 12  @ debug_sub_808DEB8
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._412:
	.align	2, 0
._411:
	.word	gUnknown_Debug_083C4444
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808DEB8+1

	thumb_func_end debug_sub_808DD00

	thumb_func_start debug_sub_808DD58
debug_sub_808DD58:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0xf
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._413       @ gUnknown_Debug_083C448C
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
	ldr	r1, ._413 + 4   @ gDebug_0300070F
	mov	r0, #0x5
	strb	r0, [r1]
	ldr	r1, ._413 + 8   @ gMenuCallback
	ldr	r0, ._413 + 12  @ debug_sub_808DEB8
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._414:
	.align	2, 0
._413:
	.word	gUnknown_Debug_083C448C
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808DEB8+1

	thumb_func_end debug_sub_808DD58

	thumb_func_start debug_sub_808DDB0
debug_sub_808DDB0:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0xd
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._415       @ gUnknown_Debug_83C44C4
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x6
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x6
	bl	InitMenu
	ldr	r1, ._415 + 4   @ gDebug_0300070F
	mov	r0, #0x6
	strb	r0, [r1]
	ldr	r1, ._415 + 8   @ gMenuCallback
	ldr	r0, ._415 + 12  @ debug_sub_808DEB8
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._416:
	.align	2, 0
._415:
	.word	gUnknown_Debug_83C44C4
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808DEB8+1

	thumb_func_end debug_sub_808DDB0

	thumb_func_start debug_sub_808DE08
debug_sub_808DE08:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._417       @ gUnknown_Debug_83C44EC
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._417 + 4   @ gDebug_0300070F
	mov	r0, #0x7
	strb	r0, [r1]
	ldr	r1, ._417 + 8   @ gMenuCallback
	ldr	r0, ._417 + 12  @ debug_sub_808DEB8
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._418:
	.align	2, 0
._417:
	.word	gUnknown_Debug_83C44EC
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808DEB8+1

	thumb_func_end debug_sub_808DE08

	thumb_func_start debug_sub_808DE60
debug_sub_808DE60:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._419       @ gUnknown_Debug_083C4534
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._419 + 4   @ gDebug_0300070F
	mov	r0, #0x8
	strb	r0, [r1]
	ldr	r1, ._419 + 8   @ gMenuCallback
	ldr	r0, ._419 + 12  @ debug_sub_808DEB8
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._420:
	.align	2, 0
._419:
	.word	gUnknown_Debug_083C4534
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808DEB8+1

	thumb_func_end debug_sub_808DE60

	thumb_func_start debug_sub_808DEB8
debug_sub_808DEB8:
	push	{r4, r5, lr}
	bl	Menu_ProcessInput
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	bl	Menu_GetCursorPos
	add	r1, r0, #0
	ldr	r5, ._424       @ gDebug_0300070F
	ldrb	r0, [r5]
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	bl	debug_sub_808DF64
	ldrb	r0, [r5]
	bl	debug_sub_808DF04
	lsl	r4, r4, #0x18
	asr	r4, r4, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r4, r0
	beq	._421	@cond_branch
	mov	r0, #0x1
	neg	r0, r0
	cmp	r4, r0
	beq	._422	@cond_branch
._421:
	mov	r0, #0x0
	b	._423
._425:
	.align	2, 0
._424:
	.word	gDebug_0300070F
._422:
	bl	CloseMenu
	mov	r0, #0x1
._423:
	pop	{r4, r5}
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808DEB8

	thumb_func_start debug_sub_808DF04
debug_sub_808DF04:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	mov	r5, #0x0
	ldr	r0, ._428       @ gUnknown_Debug_083C457C
	add	r0, r1, r0
	ldrb	r2, [r0]
	cmp	r5, r2
	bcs	._426	@cond_branch
	ldr	r0, ._428 + 4   @ gUnknown_Debug_083C4586
	mov	r8, r0
	lsl	r0, r1, #0x3
	add	r0, r0, r1
	lsl	r7, r0, #0x1
	add	r6, r2, #0
._427:
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
	bcc	._427	@cond_branch
._426:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._429:
	.align	2, 0
._428:
	.word	gUnknown_Debug_083C457C
	.word	gUnknown_Debug_083C4586

	thumb_func_end debug_sub_808DF04

	thumb_func_start debug_sub_808DF64
debug_sub_808DF64:
	push	{r4, r5, lr}
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	lsl	r1, r1, #0x18
	lsr	r3, r1, #0x18
	ldr	r0, ._432       @ gMain
	ldrh	r1, [r0, #0x2e]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._430	@cond_branch
	mov	r5, #0x1
	b	._431
._433:
	.align	2, 0
._432:
	.word	gMain
._430:
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	._434	@cond_branch
	ldr	r5, ._435       @ 0xffff
._431:
	ldr	r1, ._435 + 4   @ gUnknown_Debug_083C4586
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
._434:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
._436:
	.align	2, 0
._435:
	.word	0xffff
	.word	gUnknown_Debug_083C4586

	thumb_func_end debug_sub_808DF64

	thumb_func_start debug_sub_808DFC0
debug_sub_808DFC0:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x18
	mov	r3, #0xd
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._437       @ gUnknown_Debug_083C377C
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x6
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x17
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x6
	bl	InitMenu
	ldr	r1, ._437 + 4   @ gMenuCallback
	ldr	r0, ._437 + 8   @ debug_sub_808E010
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._438:
	.align	2, 0
._437:
	.word	gUnknown_Debug_083C377C
	.word	gMenuCallback
	.word	debug_sub_808E010+1

	thumb_func_end debug_sub_808DFC0

	thumb_func_start debug_sub_808E010
debug_sub_808E010:
	push	{lr}
	bl	Menu_ProcessInput
	lsl	r0, r0, #0x18
	asr	r1, r0, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r1, r0
	bne	._439	@cond_branch
	mov	r0, #0x0
	b	._442
._439:
	mov	r0, #0x1
	neg	r0, r0
	cmp	r1, r0
	beq	._441	@cond_branch
	ldr	r2, ._443       @ gMenuCallback
	ldr	r0, ._443 + 4   @ gUnknown_Debug_083C377C
	lsl	r1, r1, #0x3
	add	r0, r0, #0x4
	add	r1, r1, r0
	ldr	r0, [r1]
	str	r0, [r2]
	mov	r0, #0x0
	b	._442
._444:
	.align	2, 0
._443:
	.word	gMenuCallback
	.word	gUnknown_Debug_083C377C
._441:
	bl	CloseMenu
	mov	r0, #0x1
._442:
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808E010

	thumb_func_start debug_sub_808E054
debug_sub_808E054:
	push	{r4, lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0xd
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._445       @ gUnknown_Debug_083C3AA0
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x6
	bl	Menu_PrintItems
	mov	r4, #0x0
	str	r4, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x6
	bl	InitMenu
	ldr	r0, ._445 + 4   @ gDebug_0300070F
	strb	r4, [r0]
	ldr	r1, ._445 + 8   @ gMenuCallback
	ldr	r0, ._445 + 12  @ debug_sub_808E264
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r4}
	pop	{r1}
	bx	r1
._446:
	.align	2, 0
._445:
	.word	gUnknown_Debug_083C3AA0
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808E264+1

	thumb_func_end debug_sub_808E054

	thumb_func_start debug_sub_808E0AC
debug_sub_808E0AC:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0xb
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._447       @ gUnknown_Debug_83C3AE0
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x5
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x5
	bl	InitMenu
	ldr	r1, ._447 + 4   @ gDebug_0300070F
	mov	r0, #0x1
	strb	r0, [r1]
	ldr	r1, ._447 + 8   @ gMenuCallback
	ldr	r0, ._447 + 12  @ debug_sub_808E264
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._448:
	.align	2, 0
._447:
	.word	gUnknown_Debug_83C3AE0
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808E264+1

	thumb_func_end debug_sub_808E0AC

	thumb_func_start debug_sub_808E104
debug_sub_808E104:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._449       @ gUnknown_Debug_83C3B28
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._449 + 4   @ gDebug_0300070F
	mov	r0, #0x2
	strb	r0, [r1]
	ldr	r1, ._449 + 8   @ gMenuCallback
	ldr	r0, ._449 + 12  @ debug_sub_808E264
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._450:
	.align	2, 0
._449:
	.word	gUnknown_Debug_83C3B28
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808E264+1

	thumb_func_end debug_sub_808E104

	thumb_func_start debug_sub_808E15C
debug_sub_808E15C:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x5
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._451       @ gUnknown_Debug_83C3B70
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x2
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x2
	bl	InitMenu
	ldr	r1, ._451 + 4   @ gDebug_0300070F
	mov	r0, #0x3
	strb	r0, [r1]
	ldr	r1, ._451 + 8   @ gMenuCallback
	ldr	r0, ._451 + 12  @ debug_sub_808E264
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._452:
	.align	2, 0
._451:
	.word	gUnknown_Debug_83C3B70
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808E264+1

	thumb_func_end debug_sub_808E15C

	thumb_func_start debug_sub_808E1B4
debug_sub_808E1B4:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._453       @ gUnknown_Debug_83C3BB8
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._453 + 4   @ gDebug_0300070F
	mov	r0, #0x4
	strb	r0, [r1]
	ldr	r1, ._453 + 8   @ gMenuCallback
	ldr	r0, ._453 + 12  @ debug_sub_808E264
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._454:
	.align	2, 0
._453:
	.word	gUnknown_Debug_83C3BB8
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808E264+1

	thumb_func_end debug_sub_808E1B4

	thumb_func_start debug_sub_808E20C
debug_sub_808E20C:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0xd
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._455       @ gUnknown_Debug_83C3C00
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x6
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x6
	bl	InitMenu
	ldr	r1, ._455 + 4   @ gDebug_0300070F
	mov	r0, #0x5
	strb	r0, [r1]
	ldr	r1, ._455 + 8   @ gMenuCallback
	ldr	r0, ._455 + 12  @ debug_sub_808E264
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._456:
	.align	2, 0
._455:
	.word	gUnknown_Debug_83C3C00
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808E264+1

	thumb_func_end debug_sub_808E20C

	thumb_func_start debug_sub_808E264
debug_sub_808E264:
	push	{r4, r5, lr}
	bl	Menu_ProcessInput
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	bl	Menu_GetCursorPos
	add	r1, r0, #0
	ldr	r5, ._460       @ gDebug_0300070F
	ldrb	r0, [r5]
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	bl	debug_sub_808E310
	ldrb	r0, [r5]
	bl	debug_sub_808E2B0
	lsl	r4, r4, #0x18
	asr	r4, r4, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r4, r0
	beq	._457	@cond_branch
	mov	r0, #0x1
	neg	r0, r0
	cmp	r4, r0
	beq	._458	@cond_branch
._457:
	mov	r0, #0x0
	b	._459
._461:
	.align	2, 0
._460:
	.word	gDebug_0300070F
._458:
	bl	CloseMenu
	mov	r0, #0x1
._459:
	pop	{r4, r5}
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808E264

	thumb_func_start debug_sub_808E2B0
debug_sub_808E2B0:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	mov	r5, #0x0
	ldr	r0, ._464       @ gUnknown_Debug_083C3C48
	add	r0, r1, r0
	ldrb	r2, [r0]
	cmp	r5, r2
	bcs	._462	@cond_branch
	ldr	r0, ._464 + 4   @ gUnknown_Debug_83C3C4E
	mov	r8, r0
	lsl	r0, r1, #0x3
	add	r0, r0, r1
	lsl	r7, r0, #0x1
	add	r6, r2, #0
._463:
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
	bcc	._463	@cond_branch
._462:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._465:
	.align	2, 0
._464:
	.word	gUnknown_Debug_083C3C48
	.word	gUnknown_Debug_83C3C4E

	thumb_func_end debug_sub_808E2B0

	thumb_func_start debug_sub_808E310
debug_sub_808E310:
	push	{r4, r5, lr}
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	lsl	r1, r1, #0x18
	lsr	r3, r1, #0x18
	ldr	r0, ._468       @ gMain
	ldrh	r1, [r0, #0x2e]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._466	@cond_branch
	mov	r5, #0x1
	b	._467
._469:
	.align	2, 0
._468:
	.word	gMain
._466:
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	._470	@cond_branch
	ldr	r5, ._471       @ 0xffff
._467:
	ldr	r1, ._471 + 4   @ gUnknown_Debug_83C3C4E
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
._470:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
._472:
	.align	2, 0
._471:
	.word	0xffff
	.word	gUnknown_Debug_83C3C4E

	thumb_func_end debug_sub_808E310

	thumb_func_start debug_sub_808E36C
debug_sub_808E36C:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x18
	mov	r3, #0xb
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._473       @ gUnknown_Debug_083C32AC
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x5
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x17
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x5
	bl	InitMenu
	ldr	r1, ._473 + 4   @ gMenuCallback
	ldr	r0, ._473 + 8   @ debug_sub_808E3BC
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._474:
	.align	2, 0
._473:
	.word	gUnknown_Debug_083C32AC
	.word	gMenuCallback
	.word	debug_sub_808E3BC+1

	thumb_func_end debug_sub_808E36C

	thumb_func_start debug_sub_808E3BC
debug_sub_808E3BC:
	push	{lr}
	bl	Menu_ProcessInput
	lsl	r0, r0, #0x18
	asr	r1, r0, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r1, r0
	bne	._475	@cond_branch
	mov	r0, #0x0
	b	._478
._475:
	mov	r0, #0x1
	neg	r0, r0
	cmp	r1, r0
	beq	._477	@cond_branch
	ldr	r2, ._479       @ gMenuCallback
	ldr	r0, ._479 + 4   @ gUnknown_Debug_083C32AC
	lsl	r1, r1, #0x3
	add	r0, r0, #0x4
	add	r1, r1, r0
	ldr	r0, [r1]
	str	r0, [r2]
	mov	r0, #0x0
	b	._478
._480:
	.align	2, 0
._479:
	.word	gMenuCallback
	.word	gUnknown_Debug_083C32AC
._477:
	bl	CloseMenu
	mov	r0, #0x1
._478:
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808E3BC

	thumb_func_start debug_sub_808E400
debug_sub_808E400:
	push	{r4, lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x7
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._481       @ gUnknown_Debug_083C347C
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x3
	bl	Menu_PrintItems
	mov	r4, #0x0
	str	r4, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x3
	bl	InitMenu
	ldr	r0, ._481 + 4   @ gDebug_0300070F
	strb	r4, [r0]
	ldr	r1, ._481 + 8   @ gMenuCallback
	ldr	r0, ._481 + 12  @ debug_sub_808E5B8
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r4}
	pop	{r1}
	bx	r1
._482:
	.align	2, 0
._481:
	.word	gUnknown_Debug_083C347C
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808E5B8+1

	thumb_func_end debug_sub_808E400

	thumb_func_start debug_sub_808E458
debug_sub_808E458:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x5
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._483       @ gUnknown_Debug_083C3494
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x2
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x2
	bl	InitMenu
	ldr	r1, ._483 + 4   @ gDebug_0300070F
	mov	r0, #0x1
	strb	r0, [r1]
	ldr	r1, ._483 + 8   @ gMenuCallback
	ldr	r0, ._483 + 12  @ debug_sub_808E5B8
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._484:
	.align	2, 0
._483:
	.word	gUnknown_Debug_083C3494
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808E5B8+1

	thumb_func_end debug_sub_808E458

	thumb_func_start debug_sub_808E4B0
debug_sub_808E4B0:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0xd
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._485       @ gUnknown_Debug_083C34A4
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x6
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x6
	bl	InitMenu
	ldr	r1, ._485 + 4   @ gDebug_0300070F
	mov	r0, #0x2
	strb	r0, [r1]
	ldr	r1, ._485 + 8   @ gMenuCallback
	ldr	r0, ._485 + 12  @ debug_sub_808E5B8
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._486:
	.align	2, 0
._485:
	.word	gUnknown_Debug_083C34A4
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808E5B8+1

	thumb_func_end debug_sub_808E4B0

	thumb_func_start debug_sub_808E508
debug_sub_808E508:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._487       @ gUnknown_Debug_083C34D4
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x9
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x9
	bl	InitMenu
	ldr	r1, ._487 + 4   @ gDebug_0300070F
	mov	r0, #0x3
	strb	r0, [r1]
	ldr	r1, ._487 + 8   @ gMenuCallback
	ldr	r0, ._487 + 12  @ debug_sub_808E5B8
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._488:
	.align	2, 0
._487:
	.word	gUnknown_Debug_083C34D4
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808E5B8+1

	thumb_func_end debug_sub_808E508

	thumb_func_start debug_sub_808E560
debug_sub_808E560:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0xb
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._489       @ gUnknown_Debug_083C351C
	mov	r0, #0x2
	mov	r1, #0x1
	mov	r2, #0x5
	bl	Menu_PrintItems
	mov	r0, #0x0
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x5
	bl	InitMenu
	ldr	r1, ._489 + 4   @ gDebug_0300070F
	mov	r0, #0x4
	strb	r0, [r1]
	ldr	r1, ._489 + 8   @ gMenuCallback
	ldr	r0, ._489 + 12  @ debug_sub_808E5B8
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._490:
	.align	2, 0
._489:
	.word	gUnknown_Debug_083C351C
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808E5B8+1

	thumb_func_end debug_sub_808E560

	thumb_func_start debug_sub_808E5B8
debug_sub_808E5B8:
	push	{r4, r5, lr}
	bl	Menu_ProcessInput
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	bl	Menu_GetCursorPos
	add	r1, r0, #0
	ldr	r5, ._494       @ gDebug_0300070F
	ldrb	r0, [r5]
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	bl	debug_sub_808E604
	ldrb	r0, [r5]
	bl	debug_sub_808E660
	lsl	r4, r4, #0x18
	asr	r4, r4, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r4, r0
	beq	._491	@cond_branch
	mov	r0, #0x1
	neg	r0, r0
	cmp	r4, r0
	beq	._492	@cond_branch
._491:
	mov	r0, #0x0
	b	._493
._495:
	.align	2, 0
._494:
	.word	gDebug_0300070F
._492:
	bl	CloseMenu
	mov	r0, #0x1
._493:
	pop	{r4, r5}
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808E5B8

	thumb_func_start debug_sub_808E604
debug_sub_808E604:
	push	{r4, r5, lr}
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	lsl	r1, r1, #0x18
	lsr	r3, r1, #0x18
	ldr	r0, ._498       @ gMain
	ldrh	r1, [r0, #0x30]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._496	@cond_branch
	mov	r5, #0x1
	b	._497
._499:
	.align	2, 0
._498:
	.word	gMain
._496:
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	._500	@cond_branch
	ldr	r5, ._501       @ 0xffff
._497:
	ldr	r1, ._501 + 4   @ gUnknown_Debug_083C354A
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
._500:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
._502:
	.align	2, 0
._501:
	.word	0xffff
	.word	gUnknown_Debug_083C354A

	thumb_func_end debug_sub_808E604

	thumb_func_start debug_sub_808E660
debug_sub_808E660:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	mov	r5, #0x0
	ldr	r0, ._505       @ gUnknown_Debug_083C3544
	add	r0, r1, r0
	ldrb	r2, [r0]
	cmp	r5, r2
	bcs	._503	@cond_branch
	ldr	r0, ._505 + 4   @ gUnknown_Debug_083C354A
	mov	r8, r0
	lsl	r0, r1, #0x3
	add	r0, r0, r1
	lsl	r7, r0, #0x1
	add	r6, r2, #0
._504:
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
	bcc	._504	@cond_branch
._503:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._506:
	.align	2, 0
._505:
	.word	gUnknown_Debug_083C3544
	.word	gUnknown_Debug_083C354A

	thumb_func_end debug_sub_808E660

	thumb_func_start debug_sub_808E6C0
debug_sub_808E6C0:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x18
	mov	r3, #0x5
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._507       @ gUnknown_Debug_083C4644
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
	ldr	r1, ._507 + 4   @ gMenuCallback
	ldr	r0, ._507 + 8   @ debug_sub_808E710
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._508:
	.align	2, 0
._507:
	.word	gUnknown_Debug_083C4644
	.word	gMenuCallback
	.word	debug_sub_808E710+1

	thumb_func_end debug_sub_808E6C0

	thumb_func_start debug_sub_808E710
debug_sub_808E710:
	push	{lr}
	bl	Menu_ProcessInput
	lsl	r0, r0, #0x18
	asr	r1, r0, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r1, r0
	bne	._509	@cond_branch
	mov	r0, #0x0
	b	._512
._509:
	mov	r0, #0x1
	neg	r0, r0
	cmp	r1, r0
	beq	._511	@cond_branch
	ldr	r2, ._513       @ gMenuCallback
	ldr	r0, ._513 + 4   @ gUnknown_Debug_083C4644
	lsl	r1, r1, #0x3
	add	r0, r0, #0x4
	add	r1, r1, r0
	ldr	r0, [r1]
	str	r0, [r2]
	mov	r0, #0x0
	b	._512
._514:
	.align	2, 0
._513:
	.word	gMenuCallback
	.word	gUnknown_Debug_083C4644
._511:
	bl	CloseMenu
	mov	r0, #0x1
._512:
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808E710

	thumb_func_start debug_sub_808E754
debug_sub_808E754:
	push	{r4, lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0x13
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._515       @ gUnknown_Debug_083C470C
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
	ldr	r0, ._515 + 4   @ gDebug_0300070F
	strb	r4, [r0]
	ldr	r1, ._515 + 8   @ gMenuCallback
	ldr	r0, ._515 + 12  @ debug_sub_808E804
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r4}
	pop	{r1}
	bx	r1
._516:
	.align	2, 0
._515:
	.word	gUnknown_Debug_083C470C
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808E804+1

	thumb_func_end debug_sub_808E754

	thumb_func_start debug_sub_808E7AC
debug_sub_808E7AC:
	push	{lr}
	add	sp, sp, #0xfffffff8
	bl	Menu_EraseScreen
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x1d
	mov	r3, #0xf
	bl	Menu_DrawStdWindowFrame
	ldr	r3, ._517       @ gUnknown_Debug_083C4754C
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
	ldr	r1, ._517 + 4   @ gDebug_0300070F
	mov	r0, #0x1
	strb	r0, [r1]
	ldr	r1, ._517 + 8   @ gMenuCallback
	ldr	r0, ._517 + 12  @ debug_sub_808E804
	str	r0, [r1]
	mov	r0, #0x0
	add	sp, sp, #0x8
	pop	{r1}
	bx	r1
._518:
	.align	2, 0
._517:
	.word	gUnknown_Debug_083C4754C
	.word	gDebug_0300070F
	.word	gMenuCallback
	.word	debug_sub_808E804+1

	thumb_func_end debug_sub_808E7AC

	thumb_func_start debug_sub_808E804
debug_sub_808E804:
	push	{r4, r5, lr}
	bl	Menu_ProcessInput
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	bl	Menu_GetCursorPos
	add	r1, r0, #0
	ldr	r5, ._522       @ gDebug_0300070F
	ldrb	r0, [r5]
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	bl	debug_sub_808E850
	ldrb	r0, [r5]
	bl	debug_sub_808E8AC
	lsl	r4, r4, #0x18
	asr	r4, r4, #0x18
	mov	r0, #0x2
	neg	r0, r0
	cmp	r4, r0
	beq	._519	@cond_branch
	mov	r0, #0x1
	neg	r0, r0
	cmp	r4, r0
	beq	._520	@cond_branch
._519:
	mov	r0, #0x0
	b	._521
._523:
	.align	2, 0
._522:
	.word	gDebug_0300070F
._520:
	bl	CloseMenu
	mov	r0, #0x1
._521:
	pop	{r4, r5}
	pop	{r1}
	bx	r1

	thumb_func_end debug_sub_808E804

	thumb_func_start debug_sub_808E850
debug_sub_808E850:
	push	{r4, r5, lr}
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	lsl	r1, r1, #0x18
	lsr	r3, r1, #0x18
	ldr	r0, ._526       @ gMain
	ldrh	r1, [r0, #0x2e]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._524	@cond_branch
	mov	r5, #0x1
	b	._525
._527:
	.align	2, 0
._526:
	.word	gMain
._524:
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	._528	@cond_branch
	ldr	r5, ._529       @ 0xffff
._525:
	ldr	r1, ._529 + 4   @ gUnknown_Debug_083C478E
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
._528:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
._530:
	.align	2, 0
._529:
	.word	0xffff
	.word	gUnknown_Debug_083C478E

	thumb_func_end debug_sub_808E850

	thumb_func_start debug_sub_808E8AC
debug_sub_808E8AC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	mov	r5, #0x0
	ldr	r0, ._533       @ gUnknown_Debug_083C478C
	add	r0, r1, r0
	ldrb	r2, [r0]
	cmp	r5, r2
	bcs	._531	@cond_branch
	ldr	r0, ._533 + 4   @ gUnknown_Debug_083C478E
	mov	r8, r0
	lsl	r0, r1, #0x3
	add	r0, r0, r1
	lsl	r7, r0, #0x1
	add	r6, r2, #0
._532:
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
	bcc	._532	@cond_branch
._531:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._534:
	.align	2, 0
._533:
	.word	gUnknown_Debug_083C478C
	.word	gUnknown_Debug_083C478E

	thumb_func_end debug_sub_808E8AC

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
