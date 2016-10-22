	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_8146900
sub_8146900: @ 8146900
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_8146900

	thumb_func_start sub_8146914
sub_8146914: @ 8146914
	push {lr}
	movs r2, 0
	ldr r1, _0814692C @ =gLinkPlayers
	ldrh r0, [r1, 0x1A]
	ldrh r1, [r1, 0x36]
	cmp r0, r1
	bne _08146924
	movs r2, 0x1
_08146924:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_0814692C: .4byte gLinkPlayers
	thumb_func_end sub_8146914

	thumb_func_start CB2_InitMysteryEventMenu
CB2_InitMysteryEventMenu: @ 8146930
	push {r4,lr}
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r0, _0814699C @ =sub_8146900
	bl SetVBlankCallback
	ldr r4, _081469A0 @ =gWindowConfig_81E6CE4
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	bl MenuZeroFillScreen
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xA0
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x50
	movs r0, 0
	strh r0, [r1]
	ldr r0, _081469A4 @ =Task_DestroySelf
	movs r1, 0
	bl CreateTask
	bl StopMapMusic
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	bl FillPalette
	ldr r0, _081469A8 @ =sub_81469E4
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814699C: .4byte sub_8146900
_081469A0: .4byte gWindowConfig_81E6CE4
_081469A4: .4byte Task_DestroySelf
_081469A8: .4byte sub_81469E4
	thumb_func_end CB2_InitMysteryEventMenu

	thumb_func_start sub_81469AC
sub_81469AC: @ 81469AC
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	movs r5, 0x1
	cmp r4, 0
	bne _081469C0
	ldr r1, _081469DC @ =gSystemText_EventLoadSuccess
	bl StringCopy
	movs r5, 0
_081469C0:
	cmp r4, 0x2
	bne _081469C6
	movs r5, 0
_081469C6:
	cmp r4, 0x1
	bne _081469D2
	ldr r1, _081469E0 @ =gSystemText_LoadingError
	adds r0, r6, 0
	bl StringCopy
_081469D2:
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081469DC: .4byte gSystemText_EventLoadSuccess
_081469E0: .4byte gSystemText_LoadingError
	thumb_func_end sub_81469AC

	thumb_func_start sub_81469E4
sub_81469E4: @ 81469E4
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r1, _08146A04 @ =gMain
	ldr r2, _08146A08 @ =0x0000043c
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x10
	bls _081469F8
	b _08146DA4
_081469F8:
	lsls r0, 2
	ldr r1, _08146A0C @ =_08146A10
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08146A04: .4byte gMain
_08146A08: .4byte 0x0000043c
_08146A0C: .4byte _08146A10
	.align 2, 0
_08146A10:
	.4byte _08146A54
	.4byte _08146A6E
	.4byte _08146A9C
	.4byte _08146AD4
	.4byte _08146B18
	.4byte _08146B26
	.4byte _08146B90
	.4byte _08146C64
	.4byte _08146C72
	.4byte _08146C94
	.4byte _08146CA0
	.4byte _08146CB4
	.4byte _08146CFC
	.4byte _08146D18
	.4byte _08146D50
	.4byte _08146D6C
	.4byte _08146D94
_08146A54:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	b _08146D78
_08146A6E:
	ldr r0, _08146A8C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08146A7C
	b _08146DA4
_08146A7C:
	ldr r0, _08146A90 @ =gSystemText_LinkStandby
	bl sub_8072044
	ldr r1, _08146A94 @ =gMain
	ldr r2, _08146A98 @ =0x0000043c
	adds r1, r2
	b _08146D82
	.align 2, 0
_08146A8C: .4byte gPaletteFade
_08146A90: .4byte gSystemText_LinkStandby
_08146A94: .4byte gMain
_08146A98: .4byte 0x0000043c
_08146A9C:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08146AA8
	b _08146DA4
_08146AA8:
	ldr r1, _08146AC4 @ =gMain
	ldr r0, _08146AC8 @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, _08146ACC @ =gLinkType
	ldr r2, _08146AD0 @ =0x00005501
	adds r0, r2, 0
	strh r0, [r1]
	bl OpenLink
	b _08146DA4
	.align 2, 0
_08146AC4: .4byte gMain
_08146AC8: .4byte 0x0000043c
_08146ACC: .4byte gLinkType
_08146AD0: .4byte 0x00005501
_08146AD4:
	ldr r0, _08146B08 @ =gLinkStatus
	ldr r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _08146AE2
	b _08146C38
_08146AE2:
	movs r0, 0x1C
	ands r1, r0
	cmp r1, 0x4
	bhi _08146AEC
	b _08146C38
_08146AEC:
	movs r0, 0x15
	bl PlaySE
	ldr r0, _08146B0C @ =gSystemText_LoadEventPressA
	bl sub_8072044
	ldr r1, _08146B10 @ =gMain
	ldr r0, _08146B14 @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08146C38
	.align 2, 0
_08146B08: .4byte gLinkStatus
_08146B0C: .4byte gSystemText_LoadEventPressA
_08146B10: .4byte gMain
_08146B14: .4byte 0x0000043c
_08146B18:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08146B24
	b _08146DA4
_08146B24:
	b _08146D7C
_08146B26:
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bne _08146C10
	ldr r4, _08146B64 @ =gMain
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08146B70
	movs r0, 0x5
	bl PlaySE
	bl sub_8007F4C
	movs r0, 0x6
	movs r1, 0x5
	movs r2, 0x17
	movs r3, 0x8
	bl MenuDrawTextWindow
	ldr r0, _08146B68 @ =gSystemText_LoadingEvent
	movs r1, 0x7
	movs r2, 0x6
	bl MenuPrint
	ldr r2, _08146B6C @ =0x0000043c
	adds r1, r4, r2
	b _08146D82
	.align 2, 0
_08146B64: .4byte gMain
_08146B68: .4byte gSystemText_LoadingEvent
_08146B6C: .4byte 0x0000043c
_08146B70:
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _08146B7A
	b _08146DA4
_08146B7A:
	movs r0, 0x5
	bl PlaySE
	bl CloseLink
	ldr r0, _08146B8C @ =0x0000043c
	adds r1, r4, r0
	b _08146C54
	.align 2, 0
_08146B8C: .4byte 0x0000043c
_08146B90:
	bl IsLinkConnectionEstablished
	lsls r0, 24
	cmp r0, 0
	beq _08146C38
	ldr r0, _08146BD8 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08146BA4
	b _08146DA4
_08146BA4:
	bl GetLinkPlayerDataExchangeStatusTimed
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _08146BE8
	bl sub_800832C
	movs r0, 0x6
	movs r1, 0x5
	movs r2, 0x17
	movs r3, 0x8
	bl MenuZeroFillWindowRect
	ldr r4, _08146BDC @ =gStringVar4
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_81469AC
	adds r0, r4, 0
	bl sub_8072044
	ldr r0, _08146BE0 @ =gMain
	ldr r2, _08146BE4 @ =0x0000043c
	adds r0, r2
	b _08146C26
	.align 2, 0
_08146BD8: .4byte gReceivedRemoteLinkPlayers
_08146BDC: .4byte gStringVar4
_08146BE0: .4byte gMain
_08146BE4: .4byte 0x0000043c
_08146BE8:
	bl sub_8146914
	lsls r0, 24
	cmp r0, 0
	beq _08146C00
	ldr r0, _08146BFC @ =gSystemText_DontCutLink
	bl sub_8072044
	b _08146D7C
	.align 2, 0
_08146BFC: .4byte gSystemText_DontCutLink
_08146C00:
	bl CloseLink
	movs r0, 0x6
	movs r1, 0x5
	movs r2, 0x17
	movs r3, 0x8
	bl MenuZeroFillWindowRect
_08146C10:
	ldr r4, _08146C2C @ =gStringVar4
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_81469AC
	adds r0, r4, 0
	bl sub_8072044
	ldr r0, _08146C30 @ =gMain
	ldr r1, _08146C34 @ =0x0000043c
	adds r0, r1
_08146C26:
	movs r1, 0xD
	strb r1, [r0]
	b _08146DA4
	.align 2, 0
_08146C2C: .4byte gStringVar4
_08146C30: .4byte gMain
_08146C34: .4byte 0x0000043c
_08146C38:
	ldr r4, _08146C5C @ =gMain
	ldrh r1, [r4, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08146C46
	b _08146DA4
_08146C46:
	movs r0, 0x5
	bl PlaySE
	bl CloseLink
	ldr r2, _08146C60 @ =0x0000043c
	adds r1, r4, r2
_08146C54:
	movs r0, 0xF
	strb r0, [r1]
	b _08146DA4
	.align 2, 0
_08146C5C: .4byte gMain
_08146C60: .4byte 0x0000043c
_08146C64:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08146C70
	b _08146DA4
_08146C70:
	b _08146D7C
_08146C72:
	bl GetBlockRecievedStatus
	lsls r0, 24
	cmp r0, 0
	bne _08146C7E
	b _08146DA4
_08146C7E:
	bl ResetBlockReceivedFlags
	ldr r1, _08146C8C @ =gMain
	ldr r2, _08146C90 @ =0x0000043c
	adds r1, r2
	b _08146D82
	.align 2, 0
_08146C8C: .4byte gMain
_08146C90: .4byte 0x0000043c
_08146C94:
	ldr r0, _08146C9C @ =0x0000043c
	adds r1, r4, r0
	b _08146D82
	.align 2, 0
_08146C9C: .4byte 0x0000043c
_08146CA0:
	bl sub_800832C
	ldr r1, _08146CAC @ =gMain
	ldr r2, _08146CB0 @ =0x0000043c
	adds r1, r2
	b _08146D82
	.align 2, 0
_08146CAC: .4byte gMain
_08146CB0: .4byte 0x0000043c
_08146CB4:
	ldr r0, _08146CEC @ =gReceivedRemoteLinkPlayers
	ldrb r6, [r0]
	cmp r6, 0
	bne _08146DA4
	ldr r5, _08146CF0 @ =0x02000000
	adds r0, r5, 0
	bl sub_812613C
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	str r6, [sp, 0x4]
	ldr r2, _08146CF4 @ =0x050001f5
	add r0, sp, 0x4
	adds r1, r5, 0
	bl CpuSet
	ldr r0, _08146CF8 @ =gStringVar4
	adds r1, r4, 0
	bl sub_81469AC
	lsls r0, 24
	cmp r0, 0
	bne _08146D7C
	movs r0, 0
	bl sub_8125D44
	b _08146D7C
	.align 2, 0
_08146CEC: .4byte gReceivedRemoteLinkPlayers
_08146CF0: .4byte 0x02000000
_08146CF4: .4byte 0x050001f5
_08146CF8: .4byte gStringVar4
_08146CFC:
	ldr r0, _08146D0C @ =gStringVar4
	bl sub_8072044
	ldr r1, _08146D10 @ =gMain
	ldr r2, _08146D14 @ =0x0000043c
	adds r1, r2
	b _08146D82
	.align 2, 0
_08146D0C: .4byte gStringVar4
_08146D10: .4byte gMain
_08146D14: .4byte 0x0000043c
_08146D18:
	movs r0, 0x6
	movs r1, 0x5
	movs r2, 0x17
	movs r3, 0x8
	bl MenuZeroFillWindowRect
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _08146DA4
	ldr r1, _08146D44 @ =gMain
	ldr r0, _08146D48 @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	ldr r0, _08146D4C @ =gUnknown_02039338
	strb r2, [r0]
	b _08146DA4
	.align 2, 0
_08146D44: .4byte gMain
_08146D48: .4byte 0x0000043c
_08146D4C: .4byte gUnknown_02039338
_08146D50:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08146DA4
	movs r0, 0x5
	bl PlaySE
	ldr r2, _08146D68 @ =0x0000043c
	adds r1, r4, r2
	b _08146D82
	.align 2, 0
_08146D68: .4byte 0x0000043c
_08146D6C:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
_08146D78:
	bl BeginNormalPaletteFade
_08146D7C:
	ldr r1, _08146D8C @ =gMain
	ldr r0, _08146D90 @ =0x0000043c
	adds r1, r0
_08146D82:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08146DA4
	.align 2, 0
_08146D8C: .4byte gMain
_08146D90: .4byte 0x0000043c
_08146D94:
	ldr r0, _08146DFC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08146DA4
	bl DoSoftReset
_08146DA4:
	ldr r0, _08146E00 @ =gLinkStatus
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08146DE4
	bl IsLinkMaster
	lsls r0, 24
	cmp r0, 0
	bne _08146DE4
	bl CloseLink
	movs r0, 0x6
	movs r1, 0x5
	movs r2, 0x17
	movs r3, 0x8
	bl MenuZeroFillWindowRect
	ldr r4, _08146E04 @ =gStringVar4
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_81469AC
	adds r0, r4, 0
	bl sub_8072044
	ldr r0, _08146E08 @ =gMain
	ldr r1, _08146E0C @ =0x0000043c
	adds r0, r1
	movs r1, 0xD
	strb r1, [r0]
_08146DE4:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08146DFC: .4byte gPaletteFade
_08146E00: .4byte gLinkStatus
_08146E04: .4byte gStringVar4
_08146E08: .4byte gMain
_08146E0C: .4byte 0x0000043c
	thumb_func_end sub_81469E4

	.align 2, 0 @ Don't pad with nop.
