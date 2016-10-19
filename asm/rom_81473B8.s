	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_81473B8
sub_81473B8: @ 81473B8
	push {lr}
	ldr r0, _081473E8
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _08147400
	ldr r2, _081473EC
	ldrh r1, [r2, 0x4]
	ldr r0, _081473F0
	cmp r1, r0
	bne _08147400
	ldr r1, [r2]
	ldr r0, _081473F4
	cmp r1, r0
	beq _081473E4
	ldr r0, _081473F8
	cmp r1, r0
	beq _081473E4
	ldr r0, _081473FC
	cmp r1, r0
	bne _08147400
_081473E4:
	movs r0, 0x1
	b _08147402
	.align 2, 0
_081473E8: .4byte 0x0000084f
_081473EC: .4byte gSaveBlock1
_081473F0: .4byte 0x00004718
_081473F4: .4byte 0x0003000a
_081473F8: .4byte 0x00030009
_081473FC: .4byte 0x0003000b
_08147400:
	movs r0, 0
_08147402:
	pop {r1}
	bx r1
	thumb_func_end sub_81473B8

	thumb_func_start sub_8147408
sub_8147408: @ 8147408
	push {lr}
	ldr r2, _08147460
	movs r0, 0x10
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	ldr r2, _08147464
	movs r0, 0x11
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	movs r2, 0x8B
	lsls r2, 2
	movs r0, 0x12
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	ldr r2, _08147468
	movs r0, 0x10
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	ldr r2, _0814746C
	movs r0, 0x11
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	ldr r2, _08147470
	movs r0, 0x12
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	movs r0, 0x14
	bl PlaySE
	ldr r0, _08147474
	bl FlagSet
	bl ScriptContext2_Disable
	pop {r0}
	bx r0
	.align 2, 0
_08147460: .4byte 0x0000022a
_08147464: .4byte 0x0000022b
_08147468: .4byte 0x00000e32
_0814746C: .4byte 0x00000233
_08147470: .4byte 0x00000e34
_08147474: .4byte 0x0000084f
	thumb_func_end sub_8147408

	thumb_func_start sub_8147478
sub_8147478: @ 8147478
	push {r4,lr}
	ldr r4, _081474B4
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	ldr r1, _081474B8
	cmp r0, r1
	bne _081474C0
	bl CalculatePlayerPartyCount
	ldr r0, _081474BC
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	adds r1, r4, 0
	subs r1, 0x64
	adds r0, r1
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	movs r1, 0x9D
	lsls r1, 1
	cmp r0, r1
	bne _081474C0
	movs r0, 0x1
	b _081474C2
	.align 2, 0
_081474B4: .4byte gPlayerParty
_081474B8: .4byte 0x0000017d
_081474BC: .4byte gPlayerPartyCount
_081474C0:
	movs r0, 0
_081474C2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8147478

	thumb_func_start sub_81474C8
sub_81474C8: @ 81474C8
	push {lr}
	movs r0, 0x85
	lsls r0, 4
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _0814750C
	ldr r2, _081474FC
	ldrh r1, [r2, 0x4]
	movs r0, 0xC3
	lsls r0, 3
	cmp r1, r0
	bne _0814750C
	ldr r1, [r2]
	ldr r0, _08147500
	cmp r1, r0
	beq _081474F8
	ldr r0, _08147504
	cmp r1, r0
	beq _081474F8
	ldr r0, _08147508
	cmp r1, r0
	bne _0814750C
_081474F8:
	movs r0, 0x1
	b _0814750E
	.align 2, 0
_081474FC: .4byte gSaveBlock1
_08147500: .4byte 0x0017000a
_08147504: .4byte 0x00170009
_08147508: .4byte 0x0017000b
_0814750C:
	movs r0, 0
_0814750E:
	pop {r1}
	bx r1
	thumb_func_end sub_81474C8

	thumb_func_start sub_8147514
sub_8147514: @ 8147514
	push {lr}
	movs r0, 0x28
	bl FieldEffectActiveListRemove
	ldr r2, _08147574
	movs r0, 0xE
	movs r1, 0x1A
	bl MapGridSetMetatileIdAt
	ldr r2, _08147578
	movs r0, 0xF
	movs r1, 0x1A
	bl MapGridSetMetatileIdAt
	movs r2, 0x8B
	lsls r2, 2
	movs r0, 0x10
	movs r1, 0x1A
	bl MapGridSetMetatileIdAt
	ldr r2, _0814757C
	movs r0, 0xE
	movs r1, 0x1B
	bl MapGridSetMetatileIdAt
	ldr r2, _08147580
	movs r0, 0xF
	movs r1, 0x1B
	bl MapGridSetMetatileIdAt
	ldr r2, _08147584
	movs r0, 0x10
	movs r1, 0x1B
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	movs r0, 0x14
	bl PlaySE
	movs r0, 0x85
	lsls r0, 4
	bl FlagSet
	bl ScriptContext2_Disable
	pop {r0}
	bx r0
	.align 2, 0
_08147574: .4byte 0x0000022a
_08147578: .4byte 0x0000022b
_0814757C: .4byte 0x00000e32
_08147580: .4byte 0x00000233
_08147584: .4byte 0x00000e34
	thumb_func_end sub_8147514

	thumb_func_start sub_8147588
sub_8147588: @ 8147588
	push {lr}
	ldr r0, _081475AC
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _081475BC
	ldr r2, _081475B0
	ldrh r1, [r2, 0x4]
	ldr r0, _081475B4
	cmp r1, r0
	bne _081475BC
	ldr r1, [r2]
	ldr r0, _081475B8
	cmp r1, r0
	bne _081475BC
	movs r0, 0x1
	b _081475BE
	.align 2, 0
_081475AC: .4byte 0x00000852
_081475B0: .4byte gSaveBlock1
_081475B4: .4byte 0x00004418
_081475B8: .4byte 0x00190008
_081475BC:
	movs r0, 0
_081475BE:
	pop {r1}
	bx r1
	thumb_func_end sub_8147588

	thumb_func_start sub_81475C4
sub_81475C4: @ 81475C4
	push {lr}
	ldr r0, _081475D8
	ldr r1, _081475DC
	ldrb r1, [r1]
	str r1, [r0]
	movs r0, 0x3C
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_081475D8: .4byte gUnknown_0202FF84
_081475DC: .4byte gUnknown_03005CE0
	thumb_func_end sub_81475C4

	thumb_func_start FldEff_UseFlyAncientTomb
FldEff_UseFlyAncientTomb: @ 81475E0
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08147604
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _08147608
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08147604: .4byte gTasks
_08147608: .4byte sub_814760C
	thumb_func_end FldEff_UseFlyAncientTomb

	thumb_func_start sub_814760C
sub_814760C: @ 814760C
	push {lr}
	movs r0, 0x3C
	bl FieldEffectActiveListRemove
	bl sub_814761C
	pop {r0}
	bx r0
	thumb_func_end sub_814760C

	thumb_func_start sub_814761C
sub_814761C: @ 814761C
	push {lr}
	ldr r2, _08147674
	movs r0, 0xE
	movs r1, 0x1A
	bl MapGridSetMetatileIdAt
	ldr r2, _08147678
	movs r0, 0xF
	movs r1, 0x1A
	bl MapGridSetMetatileIdAt
	movs r2, 0x8B
	lsls r2, 2
	movs r0, 0x10
	movs r1, 0x1A
	bl MapGridSetMetatileIdAt
	ldr r2, _0814767C
	movs r0, 0xE
	movs r1, 0x1B
	bl MapGridSetMetatileIdAt
	ldr r2, _08147680
	movs r0, 0xF
	movs r1, 0x1B
	bl MapGridSetMetatileIdAt
	ldr r2, _08147684
	movs r0, 0x10
	movs r1, 0x1B
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	movs r0, 0x14
	bl PlaySE
	ldr r0, _08147688
	bl FlagSet
	bl ScriptContext2_Disable
	pop {r0}
	bx r0
	.align 2, 0
_08147674: .4byte 0x0000022a
_08147678: .4byte 0x0000022b
_0814767C: .4byte 0x00000e32
_08147680: .4byte 0x00000233
_08147684: .4byte 0x00000e34
_08147688: .4byte 0x00000852
	thumb_func_end sub_814761C

	thumb_func_start sub_814768C
sub_814768C: @ 814768C
	push {lr}
	ldr r0, _081476A8
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _081476A2
	ldr r0, _081476AC
	movs r1, 0x50
	bl CreateTask
_081476A2:
	pop {r0}
	bx r0
	.align 2, 0
_081476A8: .4byte 0x00000851
_081476AC: .4byte sub_81476B0
	thumb_func_end sub_814768C

	thumb_func_start sub_81476B0
sub_81476B0: @ 81476B0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _081476D4
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bhi _0814776A
	lsls r0, 2
	ldr r1, _081476D8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081476D4: .4byte gUnknown_03004B28
_081476D8: .4byte _081476DC
	.align 2, 0
_081476DC:
	.4byte _081476F0
	.4byte _081476FE
	.4byte _08147730
	.4byte _08147748
	.4byte _0814775A
_081476F0:
	movs r1, 0xE1
	lsls r1, 5
	adds r0, r1, 0
	strh r0, [r4, 0x2]
	movs r0, 0x1
	strh r0, [r4]
	b _0814776A
_081476FE:
	bl sub_8147774
	cmp r0, 0
	beq _08147716
	bl MenuZeroFillScreen
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x2
	strh r0, [r4]
	b _0814776A
_08147716:
	ldrh r0, [r4, 0x2]
	subs r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	cmp r0, 0
	bne _0814776A
	bl MenuZeroFillScreen
	movs r0, 0x3
	strh r0, [r4]
	movs r0, 0x1E
	strh r0, [r4, 0x2]
	b _0814776A
_08147730:
	bl sub_8147774
	cmp r0, 0
	beq _08147748
	bl sub_8064E2C
	adds r0, r5, 0
	bl DestroyTask
	bl ScriptContext2_Disable
	b _0814776A
_08147748:
	ldrh r0, [r4, 0x2]
	subs r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	cmp r0, 0
	bne _0814776A
	movs r0, 0x4
	strh r0, [r4]
	b _0814776A
_0814775A:
	bl sub_8064E2C
	ldr r0, _08147770
	bl ScriptContext1_SetupScript
	adds r0, r5, 0
	bl DestroyTask
_0814776A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08147770: .4byte gUnknown_0815EF19
	thumb_func_end sub_81476B0

	thumb_func_start sub_8147774
sub_8147774: @ 8147774
	push {lr}
	movs r1, 0xFF
	ldr r0, _081477A4
	ldrb r2, [r0, 0x13]
	cmp r2, 0x1
	bne _08147788
	movs r3, 0xC0
	lsls r3, 2
	adds r0, r3, 0
	orrs r1, r0
_08147788:
	cmp r2, 0x2
	bne _08147794
	movs r2, 0x80
	lsls r2, 2
	adds r0, r2, 0
	orrs r1, r0
_08147794:
	ldr r0, _081477A8
	ldrh r0, [r0, 0x2E]
	ands r1, r0
	cmp r1, 0
	bne _081477AC
	movs r0, 0
	b _081477AE
	.align 2, 0
_081477A4: .4byte gSaveBlock2
_081477A8: .4byte gMain
_081477AC:
	movs r0, 0x1
_081477AE:
	pop {r1}
	bx r1
	thumb_func_end sub_8147774

	thumb_func_start sub_81477B4
sub_81477B4: @ 81477B4
	push {lr}
	ldr r0, _081477E8
	movs r1, 0x9
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081477EC
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0xA]
	strh r0, [r1, 0xC]
	movs r0, 0x2
	strh r0, [r1, 0x10]
	movs r0, 0x5
	strh r0, [r1, 0x12]
	movs r0, 0x32
	strh r0, [r1, 0x14]
	movs r0, 0
	bl SetCameraPanningCallback
	pop {r0}
	bx r0
	.align 2, 0
_081477E8: .4byte sub_814782C
_081477EC: .4byte gTasks
	thumb_func_end sub_81477B4

	thumb_func_start sub_81477F0
sub_81477F0: @ 81477F0
	push {lr}
	ldr r0, _08147824
	movs r1, 0x9
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08147828
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0xA]
	strh r0, [r1, 0xC]
	movs r0, 0x3
	strh r0, [r1, 0x10]
	movs r0, 0x5
	strh r0, [r1, 0x12]
	movs r0, 0x2
	strh r0, [r1, 0x14]
	movs r0, 0
	bl SetCameraPanningCallback
	pop {r0}
	bx r0
	.align 2, 0
_08147824: .4byte sub_814782C
_08147828: .4byte gTasks
	thumb_func_end sub_81477F0

	thumb_func_start sub_814782C
sub_814782C: @ 814782C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0814788C
	adds r4, r0, r1
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	bl __modsi3
	cmp r0, 0
	bne _08147884
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x10]
	negs r0, r0
	strh r0, [r4, 0x10]
	movs r0, 0x10
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl SetCameraPanning
	movs r2, 0xC
	ldrsh r1, [r4, r2]
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _08147884
	adds r0, r5, 0
	bl DestroyTask
	bl EnableBothScriptContexts
	bl InstallCameraPanAheadCallback
_08147884:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814788C: .4byte gTasks
	thumb_func_end sub_814782C

	thumb_func_start sub_8147890
sub_8147890: @ 8147890
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTasks
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8147890

	thumb_func_start sub_81478A8
sub_81478A8: @ 81478A8
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_81478A8

	thumb_func_start sub_81478BC
sub_81478BC: @ 81478BC
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _081478D8
	ldr r1, _081478DC
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0xD
	bls _081478CE
	b _08147AD0
_081478CE:
	lsls r0, 2
	ldr r1, _081478E0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081478D8: .4byte gMain
_081478DC: .4byte 0x0000043c
_081478E0: .4byte _081478E4
	.align 2, 0
_081478E4:
	.4byte _0814791C
	.4byte _08147938
	.4byte _0814794C
	.4byte _08147960
	.4byte _08147966
	.4byte _08147980
	.4byte _0814798C
	.4byte _081479B8
	.4byte _081479DC
	.4byte _081479F4
	.4byte _08147A20
	.4byte _08147A3C
	.4byte _08147A5C
	.4byte _08147A8C
_0814791C:
	bl sub_80F9438
	bl sub_80F9368
	bl sub_8147B04
	ldr r1, _08147930
	ldr r2, _08147934
	adds r1, r2
	b _08147A4A
	.align 2, 0
_08147930: .4byte gMain
_08147934: .4byte 0x0000043c
_08147938:
	bl ResetPaletteFade
	ldr r2, _08147948
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	b _08147A44
	.align 2, 0
_08147948: .4byte gPaletteFade
_0814794C:
	bl ResetSpriteData
	ldr r1, _08147958
	ldr r2, _0814795C
	adds r1, r2
	b _08147A4A
	.align 2, 0
_08147958: .4byte gMain
_0814795C: .4byte 0x0000043c
_08147960:
	bl FreeAllSpritePalettes
	b _08147A44
_08147966:
	ldr r0, _08147974
	bl SetUpWindowConfig
	ldr r1, _08147978
	ldr r2, _0814797C
	adds r1, r2
	b _08147A4A
	.align 2, 0
_08147974: .4byte gWindowConfig_81E6E50
_08147978: .4byte gMain
_0814797C: .4byte 0x0000043c
_08147980:
	ldr r0, _08147988
	bl MultistepInitMenuWindowBegin
	b _08147A44
	.align 2, 0
_08147988: .4byte gWindowConfig_81E6E50
_0814798C:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	bne _08147996
	b _08147AD0
_08147996:
	ldr r0, _081479A8
	ldr r1, _081479AC
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r1, _081479B0
	ldr r2, _081479B4
	adds r1, r2
	b _08147A4A
	.align 2, 0
_081479A8: .4byte 0x02000000
_081479AC: .4byte 0x0001ffff
_081479B0: .4byte gMain
_081479B4: .4byte 0x0000043c
_081479B8:
	ldr r0, _081479D4
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081479D8
	adds r0, r1
	bl sub_8147B20
	lsls r0, 24
	cmp r0, 0
	bne _081479D0
	b _08147AD0
_081479D0:
	b _08147A44
	.align 2, 0
_081479D4: .4byte gUnknown_02039310
_081479D8: .4byte gPlayerParty
_081479DC:
	bl sub_81480B4
	ldr r1, _081479EC
	ldr r2, _081479F0
	adds r1, r2
	strb r0, [r1]
	b _08147A44
	.align 2, 0
_081479EC: .4byte 0x02000000
_081479F0: .4byte 0x0001fffd
_081479F4:
	ldr r0, _08147A10
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08147A14
	adds r0, r1
	bl sub_8147F84
	ldr r1, _08147A18
	ldr r2, _08147A1C
	adds r1, r2
	strb r0, [r1]
	b _08147A44
	.align 2, 0
_08147A10: .4byte gUnknown_02039310
_08147A14: .4byte gPlayerParty
_08147A18: .4byte 0x02000000
_08147A1C: .4byte 0x0001fffe
_08147A20:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r1, _08147A34
	ldr r2, _08147A38
	adds r1, r2
	b _08147A4A
	.align 2, 0
_08147A34: .4byte gMain
_08147A38: .4byte 0x0000043c
_08147A3C:
	bl sub_8055870
	cmp r0, 0x1
	beq _08147AD0
_08147A44:
	ldr r1, _08147A54
	ldr r0, _08147A58
	adds r1, r0
_08147A4A:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08147AD0
	.align 2, 0
_08147A54: .4byte gMain
_08147A58: .4byte 0x0000043c
_08147A5C:
	ldr r3, _08147AB0
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _08147AB4
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08147AB8
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08147ABC
	bl SetVBlankCallback
	ldr r1, _08147AC0
	ldr r2, _08147AC4
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08147A8C:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _08147AC8
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _08147ACC
	bl SetMainCallback2
	movs r0, 0x1
	b _08147AD2
	.align 2, 0
_08147AB0: .4byte 0x04000208
_08147AB4: .4byte 0x04000200
_08147AB8: .4byte REG_DISPSTAT
_08147ABC: .4byte sub_81478A8
_08147AC0: .4byte gMain
_08147AC4: .4byte 0x0000043c
_08147AC8: .4byte gPaletteFade
_08147ACC: .4byte sub_8147890
_08147AD0:
	movs r0, 0
_08147AD2:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81478BC

	thumb_func_start sub_8147ADC
sub_8147ADC: @ 8147ADC
	push {lr}
_08147ADE:
	bl sub_81478BC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08147AF2
	movs r0, 0x1
	bl sub_8147DDC
	b _08147AFE
_08147AF2:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08147ADE
_08147AFE:
	pop {r0}
	bx r0
	thumb_func_end sub_8147ADC

	thumb_func_start sub_8147B04
sub_8147B04: @ 8147B04
	ldr r1, _08147B18
	ldr r2, _08147B1C
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xA
	movs r2, 0x9A
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	bx lr
	.align 2, 0
_08147B18: .4byte REG_BG1CNT
_08147B1C: .4byte 0x00001d02
	thumb_func_end sub_8147B04

	thumb_func_start sub_8147B20
sub_8147B20: @ 8147B20
	push {r4-r6,lr}
	sub sp, 0xC
	adds r4, r0, 0
	ldr r0, _08147B40
	ldr r1, _08147B44
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x8
	bls _08147B34
	b _08147C84
_08147B34:
	lsls r0, 2
	ldr r1, _08147B48
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08147B40: .4byte 0x02000000
_08147B44: .4byte 0x0001ffff
_08147B48: .4byte _08147B4C
	.align 2, 0
_08147B4C:
	.4byte _08147B70
	.4byte _08147BB8
	.4byte _08147BF0
	.4byte _08147BFC
	.4byte _08147C08
	.4byte _08147C14
	.4byte _08147C2C
	.4byte _08147C38
	.4byte _08147C60
_08147B70:
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r6, r0, 0
	lsls r0, r5, 3
	ldr r1, _08147BAC
	adds r0, r1
	ldr r1, _08147BB0
	lsls r2, r5, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08147BB4
	ldr r4, [r4, 0x4]
	str r4, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	bl sub_800D334
	b _08147C40
	.align 2, 0
_08147BAC: .4byte gMonFrontPicTable
_08147BB0: .4byte gMonFrontPicCoords
_08147BB4: .4byte gUnknown_081FAF4C
_08147BB8:
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r6, r0, 0
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	adds r1, r0, 0
	adds r0, r5, 0
	adds r2, r6, 0
	bl sub_80409C8
	adds r4, r0, 0
	bl LoadCompressedObjectPalette
	ldrh r0, [r4, 0x4]
	movs r1, 0x1
	bl GetMonSpriteTemplate_803C56C
	b _08147C40
_08147BF0:
	ldr r0, _08147BF8
	bl LoadCompressedObjectPic
	b _08147C40
	.align 2, 0
_08147BF8: .4byte gUnknown_083F7F74
_08147BFC:
	ldr r0, _08147C04
	bl LoadCompressedObjectPalette
	b _08147C40
	.align 2, 0
_08147C04: .4byte gUnknown_083F7F7C
_08147C08:
	ldr r0, _08147C10
	bl LoadCompressedObjectPic
	b _08147C40
	.align 2, 0
_08147C10: .4byte gUnknown_084121DC
_08147C14:
	ldr r0, _08147C24
	ldrb r0, [r0]
	bl sub_8147C90
	ldr r0, _08147C28
	bl LoadCompressedObjectPalette
	b _08147C40
	.align 2, 0
_08147C24: .4byte word_203855E
_08147C28: .4byte gUnknown_02039350
_08147C2C:
	ldr r0, _08147C34
	movs r1, 0xC0
	lsls r1, 19
	b _08147C3C
	.align 2, 0
_08147C34: .4byte gBattleTerrainTiles_Building
_08147C38:
	ldr r0, _08147C50
	ldr r1, _08147C54
_08147C3C:
	bl LZDecompressVram
_08147C40:
	ldr r1, _08147C58
	ldr r0, _08147C5C
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08147C84
	.align 2, 0
_08147C50: .4byte gUnknown_08E782FC
_08147C54: .4byte 0x0600e800
_08147C58: .4byte 0x02000000
_08147C5C: .4byte 0x0001ffff
_08147C60:
	ldr r0, _08147C78
	movs r1, 0x20
	movs r2, 0x60
	bl LoadCompressedPalette
	ldr r0, _08147C7C
	ldr r1, _08147C80
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	b _08147C86
	.align 2, 0
_08147C78: .4byte gBattleTerrainPalette_BattleTower
_08147C7C: .4byte 0x02000000
_08147C80: .4byte 0x0001ffff
_08147C84:
	movs r0, 0
_08147C86:
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8147B20

	thumb_func_start sub_8147C90
sub_8147C90: @ 8147C90
	push {lr}
	lsls r0, 24
	lsrs r0, 21
	ldr r1, _08147CB8
	adds r0, r1
	movs r1, 0
	bl sub_810CA9C
	lsls r0, 24
	ldr r2, _08147CBC
	ldr r1, _08147CC0
	lsrs r0, 22
	subs r0, 0x4
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, _08147CC4
	strh r0, [r2, 0x4]
	pop {r0}
	bx r0
	.align 2, 0
_08147CB8: .4byte gSaveBlock1 + 0x7F8
_08147CBC: .4byte gUnknown_02039350
_08147CC0: .4byte gUnknown_084120A4
_08147CC4: .4byte 0x000039e2
	thumb_func_end sub_8147C90

	thumb_func_start sub_8147CC8
sub_8147CC8: @ 8147CC8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08147D00
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08147CDC
	b _08147DCE
_08147CDC:
	ldr r0, _08147D04
	lsls r2, r4, 2
	adds r1, r2, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x8
	ldrsh r3, [r1, r0]
	ldr r0, _08147D08
	adds r5, r2, 0
	cmp r3, r0
	beq _08147D50
	cmp r3, r0
	bgt _08147D0C
	cmp r3, 0
	beq _08147D20
	cmp r3, 0xFF
	beq _08147D38
	b _08147D8C
	.align 2, 0
_08147D00: .4byte gPaletteFade
_08147D04: .4byte gTasks
_08147D08: .4byte 0x0000010d
_08147D0C:
	ldr r0, _08147D1C
	cmp r3, r0
	beq _08147D68
	adds r0, 0x10
	cmp r3, r0
	beq _08147D80
	b _08147D8C
	.align 2, 0
_08147D1C: .4byte 0x00000119
_08147D20:
	ldr r0, _08147D30
	strb r3, [r0]
	ldr r0, _08147D34
	strh r3, [r0]
	bl sub_81481DC
	b _08147D8C
	.align 2, 0
_08147D30: .4byte gUnknown_03005F3C
_08147D34: .4byte gUnknown_03005F94
_08147D38:
	ldr r0, _08147D48
	ldr r2, _08147D4C
	adds r0, r2
	ldrb r0, [r0]
	ldrb r1, [r1, 0xA]
	bl sub_8148108
	b _08147D8C
	.align 2, 0
_08147D48: .4byte 0x02000000
_08147D4C: .4byte 0x0001fffd
_08147D50:
	bl sub_814817C
	ldr r1, _08147D60
	ldr r2, _08147D64
	adds r1, r2
	strb r0, [r1]
	b _08147D8C
	.align 2, 0
_08147D60: .4byte 0x02000000
_08147D64: .4byte 0x0001fffc
_08147D68:
	ldr r0, _08147D78
	ldr r1, _08147D7C
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8148044
	b _08147D8C
	.align 2, 0
_08147D78: .4byte 0x02000000
_08147D7C: .4byte 0x0001fffe
_08147D80:
	ldr r0, _08147D88
	str r0, [r1]
	b _08147DCE
	.align 2, 0
_08147D88: .4byte sub_8147E40
_08147D8C:
	ldr r0, _08147DA0
	ldr r1, _08147DA4
	ldrh r2, [r0]
	ldrh r0, [r1]
	cmp r2, r0
	bcs _08147DA8
	bl sub_814825C
	b _08147DB8
	.align 2, 0
_08147DA0: .4byte gUnknown_03005F94
_08147DA4: .4byte gUnknown_03005F34
_08147DA8:
	cmp r2, r0
	bne _08147DB8
	ldr r0, _08147DD4
	adds r1, r5, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0xFE
	strh r0, [r1, 0x8]
_08147DB8:
	ldr r1, _08147DD8
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	ldr r0, _08147DD4
	adds r1, r5, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_08147DCE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08147DD4: .4byte gTasks
_08147DD8: .4byte gUnknown_03005F94
	thumb_func_end sub_8147CC8

	thumb_func_start sub_8147DDC
sub_8147DDC: @ 8147DDC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08147E08
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08147E0C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	strh r4, [r1, 0xA]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08147E08: .4byte sub_8147CC8
_08147E0C: .4byte gTasks
	thumb_func_end sub_8147DDC

	thumb_func_start sub_8147E10
sub_8147E10: @ 8147E10
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl MenuUpdateWindowText
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08147E30
	ldr r0, _08147E38
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08147E3C
	str r0, [r1]
_08147E30:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08147E38: .4byte gTasks
_08147E3C: .4byte sub_8147F4C
	thumb_func_end sub_8147E10

	thumb_func_start sub_8147E40
sub_8147E40: @ 8147E40
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08147E94
	ldrb r1, [r0]
	movs r0, 0x64
	adds r5, r1, 0
	muls r5, r0
	ldr r0, _08147E98
	adds r5, r0
	ldr r0, _08147E9C
	ldrh r4, [r0]
	lsls r4, 3
	ldr r0, _08147EA0
	adds r4, r0
	adds r0, r5, 0
	bl GetNature
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	bl sub_810CAE4
	ldr r6, _08147EA4
	strh r0, [r6]
	ldr r1, _08147EA8
	adds r0, r5, 0
	bl GetMonNickname
	ldr r1, _08147EAC
	adds r0, r4, 0
	bl sub_810CB44
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _08147EB8
	ldr r0, _08147EB0
	ldr r1, _08147EB4
	bl StringExpandPlaceholders
	b _08147ED8
	.align 2, 0
_08147E94: .4byte gUnknown_02039310
_08147E98: .4byte gPlayerParty
_08147E9C: .4byte word_203855E
_08147EA0: .4byte gSaveBlock1 + 0x7F8
_08147EA4: .4byte gUnknown_02039312
_08147EA8: .4byte gStringVar1
_08147EAC: .4byte gStringVar2
_08147EB0: .4byte gStringVar4
_08147EB4: .4byte gContestStatsText_NormallyAte
_08147EB8:
	cmp r0, 0
	ble _08147ED0
	ldr r0, _08147EC8
	ldr r1, _08147ECC
	bl StringExpandPlaceholders
	b _08147ED8
	.align 2, 0
_08147EC8: .4byte gStringVar4
_08147ECC: .4byte gContestStatsText_HappilyAte
_08147ED0:
	ldr r0, _08147EF8
	ldr r1, _08147EFC
	bl StringExpandPlaceholders
_08147ED8:
	ldr r0, _08147EF8
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrintMessage
	ldr r1, _08147F00
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _08147F04
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08147EF8: .4byte gStringVar4
_08147EFC: .4byte gContestStatsText_DisdainfullyAte
_08147F00: .4byte gTasks
_08147F04: .4byte sub_8147E10
	thumb_func_end sub_8147E40

	thumb_func_start sub_8147F08
sub_8147F08: @ 8147F08
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08147F3C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08147F34
	ldr r0, _08147F40
	ldr r1, _08147F44
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
	ldr r0, _08147F48
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_08147F34:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08147F3C: .4byte gPaletteFade
_08147F40: .4byte gMPlay_BGM
_08147F44: .4byte 0x0000ffff
_08147F48: .4byte gMain
	thumb_func_end sub_8147F08

	thumb_func_start sub_8147F4C
sub_8147F4C: @ 8147F4C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08147F7C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08147F80
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08147F7C: .4byte gTasks
_08147F80: .4byte sub_8147F08
	thumb_func_end sub_8147F4C

	thumb_func_start sub_8147F84
sub_8147F84: @ 8147F84
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r5, r0, 0
	movs r1, 0x41
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _08148024
	movs r1, 0x30
	movs r2, 0x50
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _08148028
	strh r4, [r0]
	ldr r0, _0814802C
	mov r1, r8
	strb r1, [r0]
	adds r0, r5, 0
	bl GetNature
	ldr r1, _08148030
	strb r0, [r1]
	ldr r7, _08148034
	mov r1, r8
	lsls r0, r1, 4
	add r0, r8
	lsls r5, r0, 2
	adds r6, r5, r7
	strh r4, [r6, 0x32]
	adds r0, r7, 0
	adds r0, 0x1C
	adds r0, r5, r0
	ldr r1, _08148038
	str r1, [r0]
	ldr r0, _0814803C
	mov r9, r0
	movs r0, 0x1
	mov r1, r9
	strb r0, [r1]
	adds r0, r4, 0
	bl sub_8040A3C
	lsls r0, 24
	cmp r0, 0
	bne _08148016
	adds r0, r7, 0
	adds r0, 0x10
	adds r0, r5, r0
	ldr r1, _08148040
	str r1, [r0]
	ldrb r3, [r6, 0x1]
	movs r0, 0x3
	orrs r3, r0
	strb r3, [r6, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r6, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	adds r0, r6, 0
	bl CalcCenterToCornerVec
	movs r0, 0
	mov r1, r9
	strb r0, [r1]
_08148016:
	mov r0, r8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08148024: .4byte gUnknown_02024E8C
_08148028: .4byte gUnknown_03005F24
_0814802C: .4byte gUnknown_03005F2C
_08148030: .4byte gUnknown_03005F30
_08148034: .4byte gSprites
_08148038: .4byte SpriteCallbackDummy
_0814803C: .4byte gUnknown_03005F28
_08148040: .4byte gSpriteAffineAnimTable_84120EC
	thumb_func_end sub_8147F84

	thumb_func_start sub_8148044
sub_8148044: @ 8148044
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0814806C
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r2, r1, r3
	movs r0, 0x30
	strh r0, [r2, 0x20]
	movs r0, 0x50
	strh r0, [r2, 0x22]
	ldr r0, _08148070
	strh r0, [r2, 0x2E]
	movs r0, 0x1
	strh r0, [r2, 0x30]
	adds r3, 0x1C
	adds r1, r3
	ldr r0, _08148074
	str r0, [r1]
	bx lr
	.align 2, 0
_0814806C: .4byte gSprites
_08148070: .4byte 0x0000fff8
_08148074: .4byte sub_8148078
	thumb_func_end sub_8148044

	thumb_func_start sub_8148078
sub_8148078: @ 8148078
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	adds r0, 0x4
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x2E]
	ldrh r2, [r4, 0x22]
	adds r1, r0, r2
	strh r1, [r4, 0x22]
	ldrh r1, [r4, 0x30]
	adds r0, r1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _0814809E
	ldrh r0, [r4, 0x32]
	movs r1, 0
	bl PlayCry1
_0814809E:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x9
	bne _081480AA
	ldr r0, _081480B0
	str r0, [r4, 0x1C]
_081480AA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081480B0: .4byte SpriteCallbackDummy
	thumb_func_end sub_8148078

	thumb_func_start sub_81480B4
sub_81480B4: @ 81480B4
	push {r4,r5,lr}
	movs r0, 0xBC
	movs r1, 0x64
	movs r2, 0x2
	bl sub_810BA50
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _081480FC
	lsls r3, r4, 4
	adds r3, r4
	lsls r3, 2
	adds r0, r3, r5
	ldrb r2, [r0, 0x1]
	movs r1, 0x4
	negs r1, r1
	ands r1, r2
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0, 0x1]
	adds r1, r5, 0
	adds r1, 0x10
	adds r1, r3, r1
	ldr r2, _08148100
	str r2, [r1]
	adds r5, 0x1C
	adds r3, r5
	ldr r1, _08148104
	str r1, [r3]
	bl InitSpriteAffineAnim
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081480FC: .4byte gSprites
_08148100: .4byte gSpriteAffineAnimTable_84121A0
_08148104: .4byte SpriteCallbackDummy
	thumb_func_end sub_81480B4

	thumb_func_start sub_8148108
sub_8148108: @ 8148108
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _08148148
	mov r8, r0
	lsls r0, r7, 4
	adds r0, r7
	lsls r6, r0, 2
	mov r0, r8
	adds r4, r6, r0
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	cmp r5, 0
	bne _08148150
	mov r0, r8
	adds r0, 0x10
	adds r0, r6, r0
	ldr r1, _0814814C
	b _08148158
	.align 2, 0
_08148148: .4byte gSprites
_0814814C: .4byte gSpriteAffineAnimTable_84121A4
_08148150:
	mov r0, r8
	adds r0, 0x10
	adds r0, r6, r0
	ldr r1, _08148174
_08148158:
	str r1, [r0]
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	ldr r1, _08148178
	adds r0, r1
	bl InitSpriteAffineAnim
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08148174: .4byte gSpriteAffineAnimTable_84121A8
_08148178: .4byte gSprites
	thumb_func_end sub_8148108

	thumb_func_start sub_814817C
sub_814817C: @ 814817C
	push {lr}
	ldr r0, _081481A4
	movs r1, 0xAE
	movs r2, 0x54
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081481A8
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldr r2, _081481AC
	strh r2, [r1, 0x2E]
	movs r2, 0x1
	strh r2, [r1, 0x30]
	pop {r1}
	bx r1
	.align 2, 0
_081481A4: .4byte gSpriteTemplate_84121E4
_081481A8: .4byte gSprites
_081481AC: .4byte 0x0000fff4
	thumb_func_end sub_814817C

	thumb_func_start sub_81481B0
sub_81481B0: @ 81481B0
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x20]
	subs r0, 0x4
	strh r0, [r2, 0x20]
	ldrh r0, [r2, 0x2E]
	ldrh r3, [r2, 0x22]
	adds r1, r0, r3
	strh r1, [r2, 0x22]
	ldrh r1, [r2, 0x30]
	adds r0, r1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _081481D6
	adds r0, r2, 0
	bl DestroySprite
_081481D6:
	pop {r0}
	bx r0
	thumb_func_end sub_81481B0

	thumb_func_start sub_81481DC
sub_81481DC: @ 81481DC
	push {r4-r7,lr}
	ldr r6, _0814824C
	movs r0, 0x1
	strh r0, [r6]
	ldr r1, _08148250
	ldr r0, _08148254
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrb r3, [r0]
	movs r4, 0
	ldr r2, _08148258
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 2
	adds r7, r2, 0
	adds r7, 0x8
	adds r0, r1, r7
	ldrh r0, [r0]
	adds r0, 0x1
	strh r0, [r6]
	adds r5, r2, 0
	adds r5, 0x12
	adds r1, r5
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	beq _08148244
	adds r2, r6, 0
	adds r6, r5, 0
	adds r5, r7, 0
_0814821A:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r4, 0x7
	bhi _08148244
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 2
	adds r0, r1, r5
	ldrh r0, [r0]
	ldrh r7, [r2]
	adds r0, r7
	strh r0, [r2]
	adds r1, r6
	movs r7, 0
	ldrsh r0, [r1, r7]
	cmp r0, 0x1
	bne _0814821A
_08148244:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814824C: .4byte gUnknown_03005F34
_08148250: .4byte gNatureToMonPokeblockAnim
_08148254: .4byte gUnknown_03005F30
_08148258: .4byte gMonPokeblockAnims
	thumb_func_end sub_81481DC

	thumb_func_start sub_814825C
sub_814825C: @ 814825C
	push {lr}
	ldr r0, _08148274
	ldrb r0, [r0]
	cmp r0, 0x5A
	bls _08148268
	b _08148532
_08148268:
	lsls r0, 2
	ldr r1, _08148278
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08148274: .4byte gUnknown_03005F3C
_08148278: .4byte _0814827C
	.align 2, 0
_0814827C:
	.4byte _081483E8
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _0814843C
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _0814847A
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _081484CC
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148524
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
_081483E8:
	ldr r2, _0814841C
	ldr r1, _08148420
	ldr r0, _08148424
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r2, _08148428
	ldr r0, _0814842C
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08148430
	adds r1, r0
	str r1, [r2]
	ldr r0, _08148434
	movs r2, 0x44
	bl memcpy
	ldr r1, _08148438
	movs r0, 0xA
	strb r0, [r1]
	b _08148532
	.align 2, 0
_0814841C: .4byte gUnknown_03005F40
_08148420: .4byte gNatureToMonPokeblockAnim
_08148424: .4byte gUnknown_03005F30
_08148428: .4byte gUnknown_03005F20
_0814842C: .4byte gUnknown_03005F2C
_08148430: .4byte gSprites
_08148434: .4byte gUnknown_03005F50
_08148438: .4byte gUnknown_03005F3C
_0814843C:
	bl sub_8148540
	ldr r1, _081484A4
	ldr r0, _081484A8
	ldrb r0, [r0]
	lsls r0, 1
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08148474
	ldr r3, _081484AC
	ldr r2, [r3]
	ldrb r0, [r2, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldr r2, [r3]
	ldrb r1, [r2, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x3]
	ldr r0, [r3]
	ldr r1, _081484B0
	str r1, [r0, 0x10]
	bl InitSpriteAffineAnim
_08148474:
	ldr r1, _081484B4
	movs r0, 0x32
	strb r0, [r1]
_0814847A:
	ldr r1, _081484A4
	ldr r0, _081484A8
	ldrb r0, [r0]
	lsls r0, 1
	adds r1, 0x1
	adds r2, r0, r1
	ldrb r1, [r2]
	cmp r1, 0
	beq _081484EE
	ldr r0, _081484B8
	ldrb r0, [r0]
	cmp r0, 0
	bne _081484BC
	ldr r0, _081484AC
	ldr r0, [r0]
	adds r1, 0xA
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAffineAnim
	b _081484EE
	.align 2, 0
_081484A4: .4byte gNatureToMonPokeblockAnim
_081484A8: .4byte gUnknown_03005F30
_081484AC: .4byte gUnknown_03005F20
_081484B0: .4byte gSpriteAffineAnimTable_8412050
_081484B4: .4byte gUnknown_03005F3C
_081484B8: .4byte gUnknown_03005F28
_081484BC:
	ldr r0, _081484C8
	ldr r0, [r0]
	ldrb r1, [r2]
	bl StartSpriteAffineAnim
	b _081484EE
	.align 2, 0
_081484C8: .4byte gUnknown_03005F20
_081484CC:
	bl sub_81485CC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08148532
	ldr r0, _081484F8
	movs r1, 0x12
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _08148504
	ldr r1, _081484FC
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl sub_8148540
_081484EE:
	ldr r1, _08148500
	movs r0, 0x3C
	strb r0, [r1]
	b _08148532
	.align 2, 0
_081484F8: .4byte gUnknown_03005FA0
_081484FC: .4byte gUnknown_03005F40
_08148500: .4byte gUnknown_03005F3C
_08148504:
	ldr r0, _0814851C
	ldr r0, [r0]
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldr r1, _08148520
	movs r0, 0x46
	strb r0, [r1]
	b _08148532
	.align 2, 0
_0814851C: .4byte gUnknown_03005F20
_08148520: .4byte gUnknown_03005F3C
_08148524:
	bl sub_8148618
	ldr r0, _08148538
	movs r1, 0
	strb r1, [r0]
	ldr r0, _0814853C
	strb r1, [r0]
_08148532:
	pop {r0}
	bx r0
	.align 2, 0
_08148538: .4byte gUnknown_03005F40
_0814853C: .4byte gUnknown_03005F3C
	thumb_func_end sub_814825C

	thumb_func_start sub_8148540
sub_8148540: @ 8148540
	push {r4-r7,lr}
	movs r4, 0
	ldr r5, _081485B4
	mov r12, r5
	ldr r7, _081485B8
	ldr r6, _081485BC
_0814854C:
	lsls r2, r4, 1
	mov r0, r12
	adds r3, r2, r0
	ldrb r1, [r6]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, r0
	adds r2, r7
	ldrh r0, [r2]
	strh r0, [r3]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _0814854C
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _081485C4
	movs r2, 0
	ldrsh r0, [r5, r2]
	movs r2, 0x4
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r5, 0x14]
	movs r1, 0
	ldrsh r0, [r5, r1]
	movs r2, 0x6
	ldrsh r1, [r5, r2]
	bl Cos
	strh r0, [r5, 0x16]
	ldrh r0, [r5, 0x8]
	strh r0, [r5, 0x18]
	ldr r0, _081485C0
	ldr r1, [r0]
	ldrh r0, [r1, 0x24]
	strh r0, [r5, 0x1A]
	ldrh r0, [r1, 0x26]
	strh r0, [r5, 0x1C]
	bl sub_8148710
	ldrh r0, [r5, 0x18]
	strh r0, [r5, 0x8]
	bl sub_814862C
	ldrh r0, [r5, 0x18]
	strh r0, [r5, 0x8]
	movs r0, 0
	b _081485C6
	.align 2, 0
_081485B4: .4byte gUnknown_03005FA0
_081485B8: .4byte gMonPokeblockAnims
_081485BC: .4byte gUnknown_03005F40
_081485C0: .4byte gUnknown_03005F20
_081485C4:
	movs r0, 0x1
_081485C6:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8148540

	thumb_func_start sub_81485CC
sub_81485CC: @ 81485CC
	push {r4,lr}
	ldr r3, _08148604
	ldrh r0, [r3, 0x18]
	ldrh r1, [r3, 0x8]
	subs r0, r1
	lsls r0, 16
	ldr r1, _08148608
	ldr r4, [r1]
	lsrs r0, 15
	ldr r1, _0814860C
	adds r2, r0, r1
	ldrh r2, [r2]
	strh r2, [r4, 0x24]
	movs r2, 0x80
	lsls r2, 3
	adds r1, r2
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r4, 0x26]
	ldrh r0, [r3, 0x8]
	subs r0, 0x1
	strh r0, [r3, 0x8]
	lsls r0, 16
	cmp r0, 0
	beq _08148610
	movs r0, 0
	b _08148612
	.align 2, 0
_08148604: .4byte gUnknown_03005FA0
_08148608: .4byte gUnknown_03005F20
_0814860C: .4byte 0x0201d000
_08148610:
	movs r0, 0x1
_08148612:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81485CC

	thumb_func_start sub_8148618
sub_8148618: @ 8148618
	push {lr}
	ldr r0, _08148628
	ldr r0, [r0]
	bl FreeSpriteOamMatrix
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08148628: .4byte gUnknown_03005F20
	thumb_func_end sub_8148618

	thumb_func_start sub_814862C
sub_814862C: @ 814862C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	ldr r1, _08148700
	ldrh r0, [r1, 0x10]
	mov r8, r0
	ldrh r0, [r1, 0x18]
	mov r2, r8
	subs r0, r2
	lsls r0, 16
	lsrs r7, r0, 16
	ldrh r0, [r1, 0xC]
	ldrh r3, [r1, 0x1A]
	adds r0, r3
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
	ldrh r0, [r1, 0xE]
	ldrh r1, [r1, 0x1C]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	movs r6, 0
	subs r0, r7, 0x1
	ldr r4, _08148704
	mov r10, r4
	cmp r6, r0
	bge _081486D4
	ldr r1, [sp]
	lsls r0, r1, 16
	asrs r0, 16
	str r0, [sp, 0x4]
_08148674:
	mov r2, r8
	adds r5, r2, r6
	lsls r5, 1
	ldr r4, _08148708
	adds r3, r5, r4
	ldrh r2, [r3]
	ldr r0, [sp, 0x4]
	subs r1, r2, r0
	ldr r4, _0814870C
	adds r5, r4
	ldrh r0, [r5]
	mov r12, r0
	mov r4, r9
	lsls r0, r4, 16
	asrs r0, 16
	mov r4, r12
	subs r0, r4, r0
	lsls r4, r0, 16
	lsrs r4, 16
	lsls r1, 16
	asrs r1, 16
	adds r6, 0x1
	adds r0, r1, 0
	muls r0, r6
	adds r1, r7, 0
	str r2, [sp, 0x8]
	str r3, [sp, 0xC]
	bl __divsi3
	ldr r2, [sp, 0x8]
	subs r2, r0
	ldr r3, [sp, 0xC]
	strh r2, [r3]
	lsls r4, 16
	asrs r4, 16
	adds r0, r4, 0
	muls r0, r6
	adds r1, r7, 0
	bl __divsi3
	ldrh r1, [r5]
	subs r1, r0
	strh r1, [r5]
	lsls r6, 16
	lsrs r6, 16
	subs r0, r7, 0x1
	cmp r6, r0
	blt _08148674
_081486D4:
	mov r1, r8
	adds r0, r1, r7
	lsls r0, 1
	mov r2, r10
	adds r1, r0, r2
	mov r3, sp
	ldrh r3, [r3]
	strh r3, [r1]
	movs r1, 0x80
	lsls r1, 3
	add r1, r10
	adds r0, r1
	mov r4, r9
	strh r4, [r0]
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08148700: .4byte gUnknown_03005FA0
_08148704: .4byte 0x0201cffe
_08148708: .4byte 0x0201d000
_0814870C: .4byte 0x0201d400
	thumb_func_end sub_814862C

	thumb_func_start sub_8148710
sub_8148710: @ 8148710
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	ldr r1, _081487A4
	ldrh r2, [r1, 0x1A]
	ldrh r0, [r1, 0x14]
	subs r2, r0
	ldrh r3, [r1, 0x1C]
	ldrh r0, [r1, 0x16]
	subs r3, r0
	adds r6, r1, 0
	ldr r1, _081487A8
	mov r9, r1
	lsls r2, 16
	asrs r2, 16
	mov r8, r2
	movs r2, 0x80
	lsls r2, 3
	add r2, r9
	mov r10, r2
	lsls r3, 16
	asrs r7, r3, 16
_08148746:
	movs r1, 0xA
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bge _08148750
	negs r0, r0
_08148750:
	lsls r0, 16
	lsrs r0, 16
	ldrh r2, [r6, 0x6]
	adds r0, r2
	lsls r5, r0, 16
	strh r0, [r6, 0x6]
	ldrh r2, [r6, 0x4]
	movs r1, 0x4
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bge _0814876A
	movs r0, 0x1
	str r0, [sp]
_0814876A:
	ldrh r0, [r6, 0x18]
	ldrh r1, [r6, 0x8]
	subs r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r1, 0
	beq _081487F0
	ldr r1, [sp]
	cmp r1, 0
	bne _081487AC
	movs r1, 0
	ldrsh r0, [r6, r1]
	lsrs r5, 24
	adds r1, r2, r5
	lsls r1, 16
	asrs r1, 16
	bl Sin
	lsls r4, 1
	mov r2, r9
	adds r1, r4, r2
	add r0, r8
	strh r0, [r1]
	movs r1, 0
	ldrsh r0, [r6, r1]
	ldrh r1, [r6, 0x6]
	adds r1, r5
	b _081487CE
	.align 2, 0
_081487A4: .4byte gUnknown_03005FA0
_081487A8: .4byte 0x0201d000
_081487AC:
	movs r1, 0
	ldrsh r0, [r6, r1]
	lsrs r5, 24
	subs r1, r2, r5
	lsls r1, 16
	asrs r1, 16
	bl Sin
	lsls r4, 1
	mov r2, r9
	adds r1, r4, r2
	add r0, r8
	strh r0, [r1]
	movs r1, 0
	ldrsh r0, [r6, r1]
	ldrh r1, [r6, 0x6]
	subs r1, r5
_081487CE:
	lsls r1, 16
	asrs r1, 16
	bl Cos
	add r4, r10
	adds r0, r7, r0
	strh r0, [r4]
	ldrh r0, [r6, 0x2]
	ldrh r2, [r6]
	adds r0, r2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r6]
	ldrh r0, [r6, 0x8]
	subs r0, 0x1
	strh r0, [r6, 0x8]
	b _08148746
_081487F0:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8148710

	.align 2, 0 @ Don't pad with nop.
