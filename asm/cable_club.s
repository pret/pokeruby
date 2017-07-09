	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start debug_sub_808A4D0
debug_sub_808A4D0:
.syntax divided
	push	{lr}
	add	r1, r0, #0
	ldr	r0, ._3
	cmp	r1, r0
	bne	._1	@cond_branch
	mov	r0, #0x1
	b	._30
._4:
	.align	2, 0
._3:
	.word	sub_8082F68+1
._1:
	ldr	r0, ._7
	cmp	r1, r0
	bne	._5	@cond_branch
	mov	r0, #0x11
	b	._30
._8:
	.align	2, 0
._7:
	.word	sub_8082FEC+1
._5:
	ldr	r0, ._11
	cmp	r1, r0
	bne	._9	@cond_branch
	mov	r0, #0x12
	b	._30
._12:
	.align	2, 0
._11:
	.word	sub_808303C+1
._9:
	ldr	r0, ._15
	cmp	r1, r0
	bne	._13	@cond_branch
	mov	r0, #0x13
	b	._30
._16:
	.align	2, 0
._15:
	.word	sub_8083188+1
._13:
	ldr	r0, ._19
	cmp	r1, r0
	bne	._17	@cond_branch
	mov	r0, #0x14
	b	._30
._20:
	.align	2, 0
._19:
	.word	sub_80830E4+1
._17:
	ldr	r0, ._23
	cmp	r1, r0
	bne	._21	@cond_branch
	mov	r0, #0x21
	b	._30
._24:
	.align	2, 0
._23:
	.word	sub_80831F8+1
._21:
	ldr	r0, ._27
	cmp	r1, r0
	bne	._25	@cond_branch
	mov	r0, #0x2
	b	._30
._28:
	.align	2, 0
._27:
	.word	sub_8083314+1
._25:
	ldr	r0, ._31
	cmp	r1, r0
	beq	._29	@cond_branch
	mov	r0, #0x0
	b	._30
._32:
	.align	2, 0
._31:
	.word	sub_80833C4+1
._29:
	mov	r0, #0x3
._30:
	pop	{r1}
	bx	r1
.syntax unified
	thumb_func_end debug_sub_808A4D0

	thumb_func_start debug_sub_808A55C
debug_sub_808A55C:
.syntax divided
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
	ldr	r2, ._37
	lsl	r0, r7, #0x2
	add	r0, r0, r7
	lsl	r0, r0, #0x3
	add	r4, r0, r2
	mov	r0, #0x8
	ldsh	r1, [r4, r0]
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r0, r0, #0x3
	add	r0, r0, r2
	ldrb	r0, [r0, #0x4]
	cmp	r0, #0
	bne	._33	@cond_branch
	mov	r1, #0xa
	ldsh	r0, [r4, r1]
	cmp	r0, #0x5
	bne	._34	@cond_branch
	add	r0, r7, #0
	bl	DestroyTask
._34:
	ldrh	r0, [r4, #0xa]
	add	r0, r0, #0x1
	strh	r0, [r4, #0xa]
._33:
	ldr	r0, ._37 + 4
	ldrb	r0, [r0]
	mov	r1, #0x2
	mov	r2, #0x0
	mov	r3, #0x2
	bl	PrintHex
	ldr	r0, ._37 + 8
	ldrb	r0, [r0]
	mov	r1, #0x16
	mov	r2, #0x5
	mov	r3, #0x4
	bl	PrintHex
	mov	r4, #0x0
	lsl	r3, r7, #0x2
	mov	r8, r3
	mov	r6, #0xc0
	lsl	r6, r6, #0x13
	mov	r5, #0xa0
	lsl	r5, r5, #0x13
._35:
	ldr	r0, ._37 + 12
	add	r0, r4, r0
	ldrb	r0, [r0]
	lsr	r1, r5, #0x18
	mov	r2, #0x0
	mov	r3, #0x1
	bl	PrintHex
	ldr	r1, ._37 + 16
	lsl	r0, r4, #0x8
	add	r0, r0, r1
	ldrh	r0, [r0]
	lsr	r2, r6, #0x18
	mov	r1, #0x16
	mov	r3, #0x4
	bl	PrintHex
	mov	r0, #0x80
	lsl	r0, r0, #0x11
	add	r6, r6, r0
	mov	r1, #0x80
	lsl	r1, r1, #0x12
	add	r5, r5, r1
	add	r4, r4, #0x1
	cmp	r4, #0x3
	ble	._35	@cond_branch
	ldr	r4, ._37 + 20
	ldr	r0, [r4]
	mov	r1, #0xf
	mov	r2, #0x0
	mov	r3, #0x8
	bl	PrintHex
	ldr	r0, ._37 + 24
	ldrb	r0, [r0, #0x1]
	mov	r1, #0x2
	mov	r2, #0xa
	mov	r3, #0x2
	bl	PrintHex
	bl	GetMultiplayerId
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r1, #0x7
	mov	r2, #0xc
	mov	r3, #0x2
	bl	PrintHex
	bl	GetBlockReceivedStatus
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r1, #0x7
	mov	r2, #0xa
	mov	r3, #0x2
	bl	PrintHex
	ldr	r0, ._37 + 28
	ldrb	r0, [r0]
	mov	r1, #0x2
	mov	r2, #0xc
	mov	r3, #0x1
	bl	PrintHex
	ldr	r0, ._37 + 32
	ldrh	r0, [r0]
	mov	r1, #0xb
	mov	r2, #0x8
	mov	r3, #0x2
	bl	PrintHex
	ldr	r0, [r4]
	mov	r1, #0x1c
	and	r0, r0, r1
	lsr	r0, r0, #0x2
	mov	r1, #0xb
	mov	r2, #0xa
	mov	r3, #0x2
	bl	PrintHex
	bl	IsLinkConnectionEstablished
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r1, #0xb
	mov	r2, #0xc
	mov	r3, #0x1
	bl	PrintHex
	bl	sub_8007ECC
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r1, #0xf
	mov	r2, #0xa
	mov	r3, #0x1
	bl	PrintHex
	ldr	r2, ._37
	mov	r3, r8
	add	r0, r3, r7
	lsl	r0, r0, #0x3
	add	r0, r0, r2
	mov	r3, #0x8
	ldsh	r1, [r0, r3]
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r0, r0, #0x3
	add	r0, r0, r2
	ldr	r0, [r0]
	bl	debug_sub_808A4D0
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r1, #0xf
	mov	r2, #0xc
	mov	r3, #0x2
	bl	PrintHex
	ldr	r0, ._37 + 36
	ldr	r0, [r0]
	mov	r1, #0x2
	mov	r2, #0xd
	mov	r3, #0x8
	bl	PrintHex
	bl	HasLinkErrorOccurred
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r1, #0x2
	mov	r2, #0x2
	mov	r3, #0x1
	bl	PrintHex
	ldr	r0, ._37 + 40
	mov	r6, #0x80
	lsl	r6, r6, #0x12
	add	r5, r0, #0
	add	r5, r5, #0x14
	mov	r4, #0x3
._36:
	ldr	r0, [r5]
	lsr	r1, r6, #0x18
	mov	r2, #0x3
	mov	r3, #0x4
	bl	PrintHex
	mov	r0, #0xc0
	lsl	r0, r0, #0x13
	add	r6, r6, r0
	add	r5, r5, #0x1c
	sub	r4, r4, #0x1
	cmp	r4, #0
	bge	._36	@cond_branch
	ldr	r0, ._37 + 44
	ldrh	r0, [r0]
	mov	r1, #0x2
	mov	r2, #0x6
	mov	r3, #0x4
	bl	PrintHex
	bl	debug_sub_808B850
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r1, #0x19
	mov	r2, #0x3
	mov	r3, #0x1
	bl	PrintHex
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._38:
	.align	2, 0
._37:
	.word	gTasks
	.word	gShouldAdvanceLinkState
	.word	gBlockSendBuffer
	.word	gLinkPlayerPending
	.word	gBlockRecvBuffer
	.word	gLinkStatus
	.word	gLink
	.word	gReceivedRemoteLinkPlayers
	.word	gScriptResult
	.word	gLinkCallback
	.word	gLinkPlayers
	.word	0x4000128
.syntax unified
	thumb_func_end debug_sub_808A55C


	thumb_func_start sub_8082CD4
sub_8082CD4:
.syntax divided
	push	{r4, r5, r6, r7, lr}
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
	lsl	r1, r1, #0x18
	lsr	r6, r1, #0x18
	mov	r0, #0xc
	mov	r1, #0x0
	mov	r2, #0x1f
	mov	r3, #0x2
	bl	InitLinkTestBG_Unused
	ldr	r4, ._40
	add	r0, r4, #0
	bl	FindTaskIdByFunc
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0xff
	bne	._39	@cond_branch
	add	r0, r4, #0
	mov	r1, #0x50
	bl	CreateTask
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	ldr	r5, ._40 + 4
	lsl	r0, r4, #0x2
	add	r0, r0, r4
	lsl	r0, r0, #0x3
	add	r0, r0, r5
	strh	r7, [r0, #0xa]
	strh	r6, [r0, #0xc]
	ldr	r0, ._40 + 8
	mov	r1, #0x50
	bl	CreateTask
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	lsl	r1, r0, #0x2
	add	r1, r1, r0
	lsl	r1, r1, #0x3
	add	r1, r1, r5
	strh	r4, [r1, #0x8]
._39:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
._41:
	.align	2, 0
._40:
	.word	sub_8082F20+1
	.word	gTasks
	.word	debug_sub_808A55C+1
.syntax unified
	thumb_func_end sub_8082CD4

	thumb_func_start sub_8082D18
sub_8082D18: @ 8082D18
	push {lr}
	adds r1, r0, 0
	ldr r0, _08082D44 @ =gStringVar1
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	movs r0, 0x12
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0xD
	bl MenuDrawTextWindow
	ldr r0, _08082D48 @ =gOtherText_PLink
	movs r1, 0x13
	movs r2, 0xB
	movs r3, 0x48
	bl sub_8072BD8
	pop {r0}
	bx r0
	.align 2, 0
_08082D44: .4byte gStringVar1
_08082D48: .4byte gOtherText_PLink
	thumb_func_end sub_8082D18

	thumb_func_start sub_8082D4C
sub_8082D4C: @ 8082D4C
	push {lr}
	movs r0, 0x12
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	thumb_func_end sub_8082D4C

	thumb_func_start sub_8082D60
sub_8082D60: @ 8082D60
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08082D88 @ =gTasks + 0x8
	adds r1, r0
	adds r5, r1, 0x6
	movs r2, 0x6
	ldrsh r0, [r1, r2]
	cmp r4, r0
	beq _08082D94
	cmp r4, 0x1
	bhi _08082D8C
	bl sub_8082D4C
	b _08082D92
	.align 2, 0
_08082D88: .4byte gTasks + 0x8
_08082D8C:
	adds r0, r4, 0
	bl sub_8082D18
_08082D92:
	strh r4, [r5]
_08082D94:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8082D60

	thumb_func_start sub_8082D9C
sub_8082D9C: @ 8082D9C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	bl GetLinkPlayerDataExchangeStatusTimed
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _08082DEC
	cmp r0, 0x2
	bgt _08082DBC
	cmp r0, 0x1
	beq _08082DC2
	b _08082DEC
_08082DBC:
	cmp r0, 0x3
	beq _08082DE8
	b _08082DEC
_08082DC2:
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r4, r1
	bgt _08082DD6
	cmp r1, r5
	bgt _08082DD6
	movs r0, 0x1
	b _08082DEE
_08082DD6:
	ldr r0, _08082DE4 @ =gStringVar1
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	movs r0, 0x4
	b _08082DEE
	.align 2, 0
_08082DE4: .4byte gStringVar1
_08082DE8:
	movs r0, 0x3
	b _08082DEE
_08082DEC:
	movs r0, 0
_08082DEE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8082D9C

	thumb_func_start sub_8082DF4
sub_8082DF4: @ 8082DF4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl HasLinkErrorOccurred
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08082E0A
	movs r0, 0
	b _08082E1A
_08082E0A:
	ldr r0, _08082E20 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08082E24 @ =sub_8083418
	str r0, [r1]
	movs r0, 0x1
_08082E1A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08082E20: .4byte gTasks
_08082E24: .4byte sub_8083418
	thumb_func_end sub_8082DF4

	thumb_func_start sub_8082E28
sub_8082E28: @ 8082E28
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08082E58 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08082E64
	bl IsLinkConnectionEstablished
	lsls r0, 24
	cmp r0, 0
	bne _08082E64
	ldr r0, _08082E5C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08082E60 @ =sub_80833EC
	str r0, [r1]
	movs r0, 0x1
	b _08082E66
	.align 2, 0
_08082E58: .4byte gMain
_08082E5C: .4byte gTasks
_08082E60: .4byte sub_80833EC
_08082E64:
	movs r0, 0
_08082E66:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8082E28

	thumb_func_start sub_8082E6C
sub_8082E6C: @ 8082E6C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsLinkConnectionEstablished
	lsls r0, 24
	cmp r0, 0
	beq _08082E82
	movs r0, 0x1
	bl SetSuppressLinkErrorMessage
_08082E82:
	ldr r0, _08082E94 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08082E98
	movs r0, 0
	b _08082EA8
	.align 2, 0
_08082E94: .4byte gMain
_08082E98:
	ldr r0, _08082EB0 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08082EB4 @ =sub_80833EC
	str r0, [r1]
	movs r0, 0x1
_08082EA8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08082EB0: .4byte gTasks
_08082EB4: .4byte sub_80833EC
	thumb_func_end sub_8082E6C

	thumb_func_start sub_8082EB8
sub_8082EB8: @ 8082EB8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl GetSioMultiSI
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08082ECE
	movs r0, 0
	b _08082EDE
_08082ECE:
	ldr r0, _08082EE4 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08082EE8 @ =sub_8083418
	str r0, [r1]
	movs r0, 0x1
_08082EDE:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08082EE4: .4byte gTasks
_08082EE8: .4byte sub_8083418
	thumb_func_end sub_8082EB8

	thumb_func_start unref_sub_8082EEC
unref_sub_8082EEC: @ 8082EEC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08082F1C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _08082F16
	movs r0, 0x2
	bl sub_8007E9C
	adds r0, r4, 0
	bl DestroyTask
_08082F16:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082F1C: .4byte gTasks
	thumb_func_end unref_sub_8082EEC

	thumb_func_start sub_8082F20
sub_8082F20: @ 8082F20
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08082F48 @ =gTasks + 0x8
	adds r4, r1, r0
	movs r3, 0
	ldrsh r2, [r4, r3]
	cmp r2, 0
	bne _08082F4C
	bl OpenLinkTimed
	bl sub_80082EC
	bl ResetLinkPlayers
	b _08082F58
	.align 2, 0
_08082F48: .4byte gTasks + 0x8
_08082F4C:
	cmp r2, 0x9
	ble _08082F58
	subs r0, 0x8
	adds r0, r1, r0
	ldr r1, _08082F64 @ =sub_8082F68
	str r1, [r0]
_08082F58:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082F64: .4byte sub_8082F68
	thumb_func_end sub_8082F20

	thumb_func_start sub_8082F68
sub_8082F68: @ 8082F68
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	bl sub_8082E28
	cmp r0, 0x1
	beq _08082FDC
	adds r0, r4, 0
	bl sub_8082E6C
	cmp r0, 0x1
	beq _08082FDC
	cmp r5, 0x1
	bls _08082FDC
	movs r0, 0x1
	bl SetSuppressLinkErrorMessage
	ldr r1, _08082FC0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r4, r0, r1
	movs r0, 0
	strh r0, [r4, 0xE]
	bl IsLinkMaster
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08082FCC
	movs r0, 0x15
	bl PlaySE
	ldr r0, _08082FC4 @ =gUnknown_081A4932
	bl ShowFieldAutoScrollMessage
	ldr r0, _08082FC8 @ =sub_8082FEC
	b _08082FDA
	.align 2, 0
_08082FC0: .4byte gTasks
_08082FC4: .4byte gUnknown_081A4932
_08082FC8: .4byte sub_8082FEC
_08082FCC:
	movs r0, 0x16
	bl PlaySE
	ldr r0, _08082FE4 @ =gUnknown_081A49B6
	bl ShowFieldAutoScrollMessage
	ldr r0, _08082FE8 @ =sub_80831F8
_08082FDA:
	str r0, [r4]
_08082FDC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08082FE4: .4byte gUnknown_081A49B6
_08082FE8: .4byte sub_80831F8
	thumb_func_end sub_8082F68

	thumb_func_start sub_8082FEC
sub_8082FEC: @ 8082FEC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8082E28
	cmp r0, 0x1
	beq _0808302C
	adds r0, r4, 0
	bl sub_8082EB8
	cmp r0, 0x1
	beq _0808302C
	adds r0, r4, 0
	bl sub_8082DF4
	cmp r0, 0x1
	beq _0808302C
	bl GetFieldMessageBoxMode
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _0808302C
	ldr r0, _08083034 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	strh r2, [r1, 0xE]
	ldr r0, _08083038 @ =sub_808303C
	str r0, [r1]
_0808302C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083034: .4byte gTasks
_08083038: .4byte sub_808303C
	thumb_func_end sub_8082FEC

.section .text_80830E4

	thumb_func_start sub_80833C4
sub_80833C4: @ 80833C4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080833E8 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _080833E0
	bl sub_8082D4C
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_080833E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080833E8: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_80833C4

	thumb_func_start sub_80833EC
sub_80833EC: @ 80833EC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08083414 @ =gScriptResult
	movs r0, 0x5
	strh r0, [r1]
	bl sub_8082D4C
	bl HideFieldMessageBox
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083414: .4byte gScriptResult
	thumb_func_end sub_80833EC

	thumb_func_start sub_8083418
sub_8083418: @ 8083418
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08083440 @ =gScriptResult
	movs r0, 0x6
	strh r0, [r1]
	bl sub_8082D4C
	bl HideFieldMessageBox
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083440: .4byte gScriptResult
	thumb_func_end sub_8083418

	thumb_func_start sub_8083444
sub_8083444: @ 8083444
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08083468 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r2, r1, r2
	ldrh r0, [r2, 0x10]
	adds r0, 0x1
	strh r0, [r2, 0x10]
	lsls r0, 16
	movs r1, 0x96
	lsls r1, 18
	cmp r0, r1
	bgt _0808346C
	movs r0, 0
	b _08083472
	.align 2, 0
_08083468: .4byte gTasks
_0808346C:
	ldr r0, _08083478 @ =sub_8083418
	str r0, [r2]
	movs r0, 0x1
_08083472:
	pop {r1}
	bx r1
	.align 2, 0
_08083478: .4byte sub_8083418
	thumb_func_end sub_8083444

	thumb_func_start sub_808347C
sub_808347C: @ 808347C
	push {r4,lr}
	movs r3, 0x2
	movs r2, 0x2
	ldr r0, _08083494 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0x2
	beq _080834B0
	cmp r0, 0x2
	bgt _08083498
	cmp r0, 0x1
	beq _0808349E
	b _080834CC
	.align 2, 0
_08083494: .4byte gSpecialVar_0x8004
_08083498:
	cmp r0, 0x5
	beq _080834C0
	b _080834CC
_0808349E:
	movs r3, 0x2
	ldr r1, _080834A8 @ =gLinkType
	ldr r4, _080834AC @ =0x00002233
	b _080834C8
	.align 2, 0
_080834A8: .4byte gLinkType
_080834AC: .4byte 0x00002233
_080834B0:
	movs r3, 0x2
	ldr r1, _080834B8 @ =gLinkType
	ldr r4, _080834BC @ =0x00002244
	b _080834C8
	.align 2, 0
_080834B8: .4byte gLinkType
_080834BC: .4byte 0x00002244
_080834C0:
	movs r3, 0x4
	movs r2, 0x4
	ldr r1, _080834DC @ =gLinkType
	ldr r4, _080834E0 @ =0x00002255
_080834C8:
	adds r0, r4, 0
	strh r0, [r1]
_080834CC:
	adds r0, r3, 0
	adds r1, r2, 0
	bl sub_8082CD4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080834DC: .4byte gLinkType
_080834E0: .4byte 0x00002255
	thumb_func_end sub_808347C

	thumb_func_start sub_80834E4
sub_80834E4: @ 80834E4
	push {lr}
	ldr r1, _08083500 @ =gLinkType
	ldr r2, _08083504 @ =0x00001133
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08083508 @ =gBattleTypeFlags
	movs r0, 0
	strh r0, [r1]
	movs r0, 0x2
	movs r1, 0x2
	bl sub_8082CD4
	pop {r0}
	bx r0
	.align 2, 0
_08083500: .4byte gLinkType
_08083504: .4byte 0x00001133
_08083508: .4byte gBattleTypeFlags
	thumb_func_end sub_80834E4

	thumb_func_start sub_808350C
sub_808350C: @ 808350C
	push {lr}
	ldr r0, _0808352C @ =gScriptResult
	movs r2, 0
	strh r2, [r0]
	ldr r1, _08083530 @ =gLinkType
	ldr r3, _08083534 @ =0x00003311
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _08083538 @ =gBattleTypeFlags
	strh r2, [r0]
	movs r0, 0x2
	movs r1, 0x4
	bl sub_8082CD4
	pop {r0}
	bx r0
	.align 2, 0
_0808352C: .4byte gScriptResult
_08083530: .4byte gLinkType
_08083534: .4byte 0x00003311
_08083538: .4byte gBattleTypeFlags
	thumb_func_end sub_808350C

	thumb_func_start sub_808353C
sub_808353C: @ 808353C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0808355C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _08083560
	cmp r0, 0x1
	beq _080835BC
	b _080835CE
	.align 2, 0
_0808355C: .4byte gTasks
_08083560:
	ldr r0, _08083594 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0x1
	bne _08083586
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	cmp r1, r0
	bge _08083586
	ldr r2, _08083598 @ =gLinkPlayers
_08083578:
	ldrh r4, [r2, 0x1A]
	cmp r4, 0x1
	beq _0808359C
	adds r2, 0x1C
	adds r1, 0x1
	cmp r1, r0
	blt _08083578
_08083586:
	bl EnableBothScriptContexts
	adds r0, r5, 0
	bl DestroyTask
	b _080835CE
	.align 2, 0
_08083594: .4byte gScriptResult
_08083598: .4byte gLinkPlayers
_0808359C:
	ldr r1, _080835B4 @ =gScriptResult
	movs r0, 0x7
	strh r0, [r1]
	bl sub_8008480
	ldr r1, _080835B8 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r4, [r0, 0x8]
	b _080835CE
	.align 2, 0
_080835B4: .4byte gScriptResult
_080835B8: .4byte gTasks
_080835BC:
	ldr r0, _080835D4 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _080835CE
	bl EnableBothScriptContexts
	adds r0, r5, 0
	bl DestroyTask
_080835CE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080835D4: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_808353C

	thumb_func_start sub_80835D8
sub_80835D8: @ 80835D8
	push {r4,lr}
	ldr r4, _0808360C @ =sub_808353C
	adds r0, r4, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	bne _08083604
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _08083610 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x8]
_08083604:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808360C: .4byte sub_808353C
_08083610: .4byte gTasks
	thumb_func_end sub_80835D8

	thumb_func_start sub_8083614
sub_8083614: @ 8083614
	push {lr}
	ldr r1, _08083630 @ =gLinkType
	ldr r2, _08083634 @ =0x00004411
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08083638 @ =gBattleTypeFlags
	movs r0, 0
	strh r0, [r1]
	movs r0, 0x2
	movs r1, 0x4
	bl sub_8082CD4
	pop {r0}
	bx r0
	.align 2, 0
_08083630: .4byte gLinkType
_08083634: .4byte 0x00004411
_08083638: .4byte gBattleTypeFlags
	thumb_func_end sub_8083614

	thumb_func_start sub_808363C
sub_808363C: @ 808363C
	push {lr}
	ldr r1, _08083658 @ =gLinkType
	ldr r2, _0808365C @ =0x00006601
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08083660 @ =gBattleTypeFlags
	movs r0, 0
	strh r0, [r1]
	movs r0, 0x4
	movs r1, 0x4
	bl sub_8082CD4
	pop {r0}
	bx r0
	.align 2, 0
_08083658: .4byte gLinkType
_0808365C: .4byte 0x00006601
_08083660: .4byte gBattleTypeFlags
	thumb_func_end sub_808363C

	thumb_func_start sub_8083664
sub_8083664: @ 8083664
	push {lr}
	ldr r0, _08083678 @ =sub_8083710
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	beq _0808367C
	movs r0, 0xFF
	b _08083700
	.align 2, 0
_08083678: .4byte sub_8083710
_0808367C:
	ldr r0, _08083690 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r0, 0x4
	bhi _080836F4
	lsls r0, 2
	ldr r1, _08083694 @ =_08083698
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08083690: .4byte gSpecialVar_0x8004
_08083694: .4byte _08083698
	.align 2, 0
_08083698:
	.4byte _080836AC
	.4byte _080836BC
	.4byte _080836DC
	.4byte _080836EC
	.4byte _080836CC
_080836AC:
	ldr r1, _080836B4 @ =gLinkType
	ldr r2, _080836B8 @ =0x00002233
	b _080836F0
	.align 2, 0
_080836B4: .4byte gLinkType
_080836B8: .4byte 0x00002233
_080836BC:
	ldr r1, _080836C4 @ =gLinkType
	ldr r2, _080836C8 @ =0x00002244
	b _080836F0
	.align 2, 0
_080836C4: .4byte gLinkType
_080836C8: .4byte 0x00002244
_080836CC:
	ldr r1, _080836D4 @ =gLinkType
	ldr r2, _080836D8 @ =0x00002255
	b _080836F0
	.align 2, 0
_080836D4: .4byte gLinkType
_080836D8: .4byte 0x00002255
_080836DC:
	ldr r1, _080836E4 @ =gLinkType
	ldr r2, _080836E8 @ =0x00001111
	b _080836F0
	.align 2, 0
_080836E4: .4byte gLinkType
_080836E8: .4byte 0x00001111
_080836EC:
	ldr r1, _08083704 @ =gLinkType
	ldr r2, _08083708 @ =0x00003322
_080836F0:
	adds r0, r2, 0
	strh r0, [r1]
_080836F4:
	ldr r0, _0808370C @ =sub_8083710
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
_08083700:
	pop {r1}
	bx r1
	.align 2, 0
_08083704: .4byte gLinkType
_08083708: .4byte 0x00003322
_0808370C: .4byte sub_8083710
	thumb_func_end sub_8083664

	thumb_func_start sub_8083710
sub_8083710: @ 8083710
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0808373C @ =gTasks + 0x8
	adds r4, r1, r0
	movs r3, 0
	ldrsh r2, [r4, r3]
	cmp r2, 0
	bne _08083744
	bl OpenLink
	bl ResetLinkPlayers
	ldr r0, _08083740 @ =sub_8083C50
	movs r1, 0x50
	bl CreateTask
	b _08083750
	.align 2, 0
_0808373C: .4byte gTasks + 0x8
_08083740: .4byte sub_8083C50
_08083744:
	cmp r2, 0x9
	ble _08083750
	subs r0, 0x8
	adds r0, r1, r0
	ldr r1, _0808375C @ =sub_8083760
	str r1, [r0]
_08083750:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808375C: .4byte sub_8083760
	thumb_func_end sub_8083710

	thumb_func_start sub_8083760
sub_8083760: @ 8083760
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _080837A6
	bl IsLinkMaster
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08083798
	ldr r0, _08083790 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08083794 @ =sub_80837B4
	b _080837A4
	.align 2, 0
_08083790: .4byte gTasks
_08083794: .4byte sub_80837B4
_08083798:
	ldr r0, _080837AC @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080837B0 @ =sub_80837EC
_080837A4:
	str r0, [r1]
_080837A6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080837AC: .4byte gTasks
_080837B0: .4byte sub_80837EC
	thumb_func_end sub_8083760

	thumb_func_start sub_80837B4
sub_80837B4: @ 80837B4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_800820C
	adds r4, r0, 0
	bl GetLinkPlayerCount_2
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080837DE
	bl sub_8007F4C
	ldr r0, _080837E4 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080837E8 @ =sub_80837EC
	str r0, [r1]
_080837DE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080837E4: .4byte gTasks
_080837E8: .4byte sub_80837EC
	thumb_func_end sub_80837B4

	thumb_func_start sub_80837EC
sub_80837EC: @ 80837EC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808381C @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08083814
	bl IsLinkPlayerDataExchangeComplete
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08083814
	bl sub_800826C
	bl sub_8007B14
	adds r0, r4, 0
	bl DestroyTask
_08083814:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808381C: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_80837EC

	thumb_func_start sub_8083820
sub_8083820: @ 8083820
	push {lr}
	bl InitSaveDialog
	pop {r0}
	bx r0
	thumb_func_end sub_8083820

	thumb_func_start sub_808382C
sub_808382C: @ 808382C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08083850 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bls _08083846
	b _08083940
_08083846:
	lsls r0, 2
	ldr r1, _08083854 @ =_08083858
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08083850: .4byte gTasks
_08083854: .4byte _08083858
	.align 2, 0
_08083858:
	.4byte _08083870
	.4byte _08083890
	.4byte _080838A0
	.4byte _080838B0
	.4byte _080838B6
	.4byte _080838CC
_08083870:
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r1, _08083888 @ =gLinkType
	ldr r2, _0808388C @ =0x00002211
	adds r0, r2, 0
	strh r0, [r1]
	bl ClearLinkCallback_2
	b _080838BE
	.align 2, 0
_08083888: .4byte gLinkType
_0808388C: .4byte 0x00002211
_08083890:
	ldr r0, _0808389C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	b _080838BA
	.align 2, 0
_0808389C: .4byte gPaletteFade
_080838A0:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _08083940
	b _080838BE
_080838B0:
	bl sub_800832C
	b _080838BE
_080838B6:
	ldr r0, _080838C8 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
_080838BA:
	cmp r0, 0
	bne _08083940
_080838BE:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08083940
	.align 2, 0
_080838C8: .4byte gReceivedRemoteLinkPlayers
_080838CC:
	ldr r0, _080838E4 @ =gLinkPlayers
	ldr r0, [r0, 0x4]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080838E8
	movs r0, 0xE6
	lsls r0, 1
	bl current_map_music_set__default_for_battle
	b _080838EE
	.align 2, 0
_080838E4: .4byte gLinkPlayers
_080838E8:
	ldr r0, _08083900 @ =0x000001cb
	bl current_map_music_set__default_for_battle
_080838EE:
	ldr r0, _08083904 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0x2
	beq _08083918
	cmp r0, 0x2
	bgt _08083908
	cmp r0, 0x1
	beq _0808390E
	b _0808392E
	.align 2, 0
_08083900: .4byte 0x000001cb
_08083904: .4byte gSpecialVar_0x8004
_08083908:
	cmp r0, 0x5
	beq _08083924
	b _0808392E
_0808390E:
	ldr r1, _08083914 @ =gBattleTypeFlags
	movs r0, 0xA
	b _0808392C
	.align 2, 0
_08083914: .4byte gBattleTypeFlags
_08083918:
	ldr r1, _08083920 @ =gBattleTypeFlags
	movs r0, 0xB
	b _0808392C
	.align 2, 0
_08083920: .4byte gBattleTypeFlags
_08083924:
	bl ReducePlayerPartyToThree
	ldr r1, _08083948 @ =gBattleTypeFlags
	movs r0, 0x4B
_0808392C:
	strh r0, [r1]
_0808392E:
	ldr r0, _0808394C @ =sub_800E7C4
	bl SetMainCallback2
	ldr r1, _08083950 @ =gMain
	ldr r0, _08083954 @ =sub_8083958
	str r0, [r1, 0x8]
	adds r0, r5, 0
	bl DestroyTask
_08083940:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083948: .4byte gBattleTypeFlags
_0808394C: .4byte sub_800E7C4
_08083950: .4byte gMain
_08083954: .4byte sub_8083958
	thumb_func_end sub_808382C

	thumb_func_start sub_8083958
sub_8083958: @ 8083958
	push {lr}
	bl call_map_music_set_to_zero
	bl LoadPlayerParty
	bl SavePlayerBag
	bl sub_810FEFC
	ldr r0, _08083990 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0x5
	beq _0808397E
	ldr r0, _08083994 @ =gUnknown_03004860
	ldrb r1, [r0]
	movs r0, 0x1
	eors r0, r1
	bl sub_8110290
_0808397E:
	ldr r0, _08083998 @ =gMain
	ldr r1, _0808399C @ =sub_805465C
	str r1, [r0, 0x8]
	ldr r0, _080839A0 @ =sub_8071B28
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08083990: .4byte gSpecialVar_0x8004
_08083994: .4byte gUnknown_03004860
_08083998: .4byte gMain
_0808399C: .4byte sub_805465C
_080839A0: .4byte sub_8071B28
	thumb_func_end sub_8083958

	thumb_func_start sub_80839A4
sub_80839A4: @ 80839A4
	push {lr}
	ldr r0, _080839CC @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	subs r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _080839B8
	cmp r1, 0x5
	bne _080839C0
_080839B8:
	bl LoadPlayerParty
	bl SavePlayerBag
_080839C0:
	movs r0, 0x7F
	bl copy_saved_warp2_bank_and_enter_x_to_warp1
	pop {r0}
	bx r0
	.align 2, 0
_080839CC: .4byte gSpecialVar_0x8004
	thumb_func_end sub_80839A4

	thumb_func_start sub_80839D0
sub_80839D0: @ 80839D0
	push {lr}
	bl sub_805559C
	pop {r0}
	bx r0
	thumb_func_end sub_80839D0

	thumb_func_start sub_80839DC
sub_80839DC: @ 80839DC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08083A00 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _08083A20
	cmp r0, 0x1
	bgt _08083A04
	cmp r0, 0
	beq _08083A0E
	b _08083A7E
	.align 2, 0
_08083A00: .4byte gTasks
_08083A04:
	cmp r0, 0x2
	beq _08083A40
	cmp r0, 0x3
	beq _08083A68
	b _08083A7E
_08083A0E:
	ldr r0, _08083A1C @ =gUnknown_081A490C
	bl ShowFieldMessage
	movs r0, 0x1
	strh r0, [r5, 0x8]
	b _08083A7E
	.align 2, 0
_08083A1C: .4byte gUnknown_081A490C
_08083A20:
	bl IsFieldMessageBoxHidden
	lsls r0, 24
	cmp r0, 0
	beq _08083A7E
	bl sub_8055574
	ldr r0, _08083A3C @ =gSpecialVar_0x8005
	ldrb r0, [r0]
	bl sub_8007270
	movs r0, 0x2
	strh r0, [r5, 0x8]
	b _08083A7E
	.align 2, 0
_08083A3C: .4byte gSpecialVar_0x8005
_08083A40:
	bl sub_80554F8
	cmp r0, 0x1
	beq _08083A52
	cmp r0, 0x1
	ble _08083A7E
	cmp r0, 0x2
	beq _08083A62
	b _08083A7E
_08083A52:
	bl HideFieldMessageBox
	movs r0, 0
	strh r0, [r5, 0x8]
	adds r0, r4, 0
	bl SwitchTaskToFollowupFunc
	b _08083A7E
_08083A62:
	movs r0, 0x3
	strh r0, [r5, 0x8]
	b _08083A7E
_08083A68:
	bl sub_8055588
	bl HideFieldMessageBox
	bl MenuZeroFillScreen
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_08083A7E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80839DC

	thumb_func_start sub_8083A84
sub_8083A84: @ 8083A84
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _08083AA8 @ =sub_80839DC
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	adds r2, r5, 0
	bl SetTaskFuncWithFollowupFunc
	bl ScriptContext1_Stop
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083AA8: .4byte sub_80839DC
	thumb_func_end sub_8083A84

	thumb_func_start sub_8083AAC
sub_8083AAC: @ 8083AAC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08083AD0 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08083AF0
	cmp r0, 0x1
	bgt _08083AD4
	cmp r0, 0
	beq _08083ADE
	b _08083B34
	.align 2, 0
_08083AD0: .4byte gTasks
_08083AD4:
	cmp r0, 0x2
	beq _08083B04
	cmp r0, 0x3
	beq _08083B20
	b _08083B34
_08083ADE:
	bl ScriptContext2_Enable
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	bl ClearLinkCallback_2
	b _08083B14
_08083AF0:
	ldr r0, _08083B00 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08083B34
	b _08083B14
	.align 2, 0
_08083B00: .4byte gPaletteFade
_08083B04:
	ldr r1, _08083B1C @ =gUnknown_020297D8
	movs r0, 0
	strb r0, [r1]
	strb r0, [r1, 0x1]
	bl m4aMPlayAllStop
	bl sub_800832C
_08083B14:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08083B34
	.align 2, 0
_08083B1C: .4byte gUnknown_020297D8
_08083B20:
	ldr r0, _08083B3C @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08083B34
	ldr r0, _08083B40 @ =sub_8047CD8
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_08083B34:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083B3C: .4byte gReceivedRemoteLinkPlayers
_08083B40: .4byte sub_8047CD8
	thumb_func_end sub_8083AAC

	thumb_func_start sub_8083B44
sub_8083B44: @ 8083B44
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8083B6C
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8083B44

	thumb_func_start sub_8083B5C
sub_8083B5C: @ 8083B5C
	push {lr}
	ldr r0, _08083B68 @ =sub_8083B44
	bl sub_8083A84
	pop {r0}
	bx r0
	.align 2, 0
_08083B68: .4byte sub_8083B44
	thumb_func_end sub_8083B5C

	thumb_func_start sub_8083B6C
sub_8083B6C: @ 8083B6C
	push {lr}
	ldr r0, _08083B7C @ =sub_8083AAC
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08083B7C: .4byte sub_8083AAC
	thumb_func_end sub_8083B6C

	thumb_func_start sub_8083B80
sub_8083B80: @ 8083B80
	push {lr}
	bl sub_8083B6C
	bl ScriptContext1_Stop
	pop {r0}
	bx r0
	thumb_func_end sub_8083B80

	thumb_func_start sub_8083B90
sub_8083B90: @ 8083B90
	push {lr}
	ldr r0, _08083BA4 @ =gLinkType
	ldr r2, _08083BA8 @ =0x00002211
	adds r1, r2, 0
	strh r1, [r0]
	ldr r0, _08083BAC @ =sub_808382C
	bl sub_8083A84
	pop {r0}
	bx r0
	.align 2, 0
_08083BA4: .4byte gLinkType
_08083BA8: .4byte 0x00002211
_08083BAC: .4byte sub_808382C
	thumb_func_end sub_8083B90

	thumb_func_start unref_sub_8083BB0
unref_sub_8083BB0: @ 8083BB0
	push {r4,lr}
	ldr r4, _08083BD4 @ =sub_80839DC
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08083BD8 @ =Task_RecordMixing_Main
	adds r1, r4, 0
	bl SetTaskFuncWithFollowupFunc
	bl ScriptContext1_Stop
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083BD4: .4byte sub_80839DC
_08083BD8: .4byte Task_RecordMixing_Main
	thumb_func_end unref_sub_8083BB0

	thumb_func_start sub_8083BDC
sub_8083BDC: @ 8083BDC
	push {lr}
	ldr r0, _08083BEC @ =gSpecialVar_0x8006
	ldrb r0, [r0]
	ldr r1, _08083BF0 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl sub_8093130
	pop {r0}
	bx r0
	.align 2, 0
_08083BEC: .4byte gSpecialVar_0x8006
_08083BF0: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_8083BDC

	thumb_func_start sub_8083BF4
sub_8083BF4: @ 8083BF4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08083C34 @ =gSpecialVar_0x8006
	strh r4, [r0]
	ldr r0, _08083C38 @ =gStringVar1
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 2
	ldr r2, _08083C3C @ =gLinkPlayers + 0x8
	adds r1, r2
	bl StringCopy
	adds r0, r4, 0
	bl sub_80934C4
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _08083C48
	ldr r0, _08083C40 @ =gStringVar2
	ldr r2, _08083C44 @ =gTrainerCardColorNames
	subs r1, 0x1
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	movs r0, 0x1
	b _08083C4A
	.align 2, 0
_08083C34: .4byte gSpecialVar_0x8006
_08083C38: .4byte gStringVar1
_08083C3C: .4byte gLinkPlayers + 0x8
_08083C40: .4byte gStringVar2
_08083C44: .4byte gTrainerCardColorNames
_08083C48:
	movs r0, 0
_08083C4A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8083BF4

	thumb_func_start sub_8083C50
sub_8083C50: @ 8083C50
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08083C98 @ =gTasks
	adds r0, r1
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	lsls r1, 16
	movs r0, 0x96
	lsls r0, 17
	cmp r1, r0
	ble _08083C82
	bl CloseLink
	ldr r0, _08083C9C @ =CB2_LinkError
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_08083C82:
	ldr r0, _08083CA0 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _08083C90
	adds r0, r5, 0
	bl DestroyTask
_08083C90:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083C98: .4byte gTasks
_08083C9C: .4byte CB2_LinkError
_08083CA0: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_8083C50


	thumb_func_start debug_sub_808B778
debug_sub_808B778:
.syntax divided
	push	{r4, lr}
	ldr	r4, ._390
	add	r0, r4, #0
	bl	FuncIsActiveTask
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	._389	@cond_branch
	add	r0, r4, #0
	mov	r1, #0x50
	bl	CreateTask
._389:
	ldr	r1, ._390 + 4
	ldr	r0, [r1]
	add	r0, r0, #0x1
	str	r0, [r1]
	pop	{r4}
	pop	{r0}
	bx	r0
._391:
	.align	2, 0
._390:
	.word	debug_sub_808B7A8+1
	.word	unk_3004E98
.syntax unified
	thumb_func_end debug_sub_808B778

	thumb_func_start debug_sub_808B7A8
debug_sub_808B7A8:
.syntax divided
	push	{lr}
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	ldr	r2, ._393
	lsl	r1, r0, #0x2
	add	r1, r1, r0
	lsl	r1, r1, #0x3
	add	r1, r1, r2
	ldrh	r0, [r1, #0x8]
	add	r0, r0, #0x1
	strh	r0, [r1, #0x8]
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	cmp	r0, #0x1e
	bne	._392	@cond_branch
	mov	r0, #0x0
	strh	r0, [r1, #0x8]
	ldr	r2, ._393 + 4
	ldrh	r0, [r2]
	mov	r1, #0x1
	orr	r0, r0, r1
	strh	r0, [r2]
._392:
	pop	{r0}
	bx	r0
._394:
	.align	2, 0
._393:
	.word	gTasks
	.word	unk_3004E94
.syntax unified
	thumb_func_end debug_sub_808B7A8



	thumb_func_start sub_8083CA4
sub_8083CA4: @ 8083CA4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08083CC4 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08083CBC
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_08083CBC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083CC4: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_8083CA4

	thumb_func_start unref_sub_8083CC8
unref_sub_8083CC8: @ 8083CC8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_800832C
	ldr r1, _08083CE8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08083CEC @ =sub_8083CA4
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083CE8: .4byte gTasks
_08083CEC: .4byte sub_8083CA4
	thumb_func_end unref_sub_8083CC8

	thumb_func_start debug_sub_808B82C
debug_sub_808B82C:
.syntax divided
	ldr	r1, ._400
	mov	r0, #0x0
	strb	r0, [r1]
	bx	lr
._401:
	.align	2, 0
._400:
	.word	unk_2030220
.syntax unified
	thumb_func_end debug_sub_808B82C

	thumb_func_start debug_sub_808B838
debug_sub_808B838:
.syntax divided
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	ldr	r2, ._402
	mov	r1, #0x1
	LSL	r1, r0
	ldrb	r0, [r2]
	orr	r1, r1, r0
	strb	r1, [r2]
	bx	lr
._403:
	.align	2, 0
._402:
	.word	unk_2030220
.syntax unified
	thumb_func_end debug_sub_808B838

	thumb_func_start debug_sub_808B850
debug_sub_808B850:
.syntax divided
	ldr	r0, ._404
	ldrb	r0, [r0]
	bx	lr
._405:
	.align	2, 0
._404:
	.word	unk_2030220
.syntax unified
	thumb_func_end debug_sub_808B850

	.align 2, 0 @ Don't pad with nop.
