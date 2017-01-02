	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start ShouldDoBrailleDigEffect
ShouldDoBrailleDigEffect: @ 81473B8
	push {lr}
	ldr r0, _081473E8 @ =0x0000084f
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _08147400
	ldr r2, _081473EC @ =gSaveBlock1
	ldrh r1, [r2, 0x4]
	ldr r0, _081473F0 @ =0x00004718
	cmp r1, r0
	bne _08147400
	ldr r1, [r2]
	ldr r0, _081473F4 @ =0x0003000a
	cmp r1, r0
	beq _081473E4
	ldr r0, _081473F8 @ =0x00030009
	cmp r1, r0
	beq _081473E4
	ldr r0, _081473FC @ =0x0003000b
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
	thumb_func_end ShouldDoBrailleDigEffect

	thumb_func_start DoBrailleDigEffect
DoBrailleDigEffect: @ 8147408
	push {lr}
	ldr r2, _08147460 @ =0x0000022a
	movs r0, 0x10
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	ldr r2, _08147464 @ =0x0000022b
	movs r0, 0x11
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	movs r2, 0x8B
	lsls r2, 2
	movs r0, 0x12
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	ldr r2, _08147468 @ =0x00000e32
	movs r0, 0x10
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	ldr r2, _0814746C @ =0x00000233
	movs r0, 0x11
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	ldr r2, _08147470 @ =0x00000e34
	movs r0, 0x12
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	movs r0, 0x14
	bl PlaySE
	ldr r0, _08147474 @ =0x0000084f
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
	thumb_func_end DoBrailleDigEffect

	thumb_func_start CheckRelicanthWailord
CheckRelicanthWailord: @ 8147478
	push {r4,lr}
	ldr r4, _081474B4 @ =gPlayerParty
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	ldr r1, _081474B8 @ =0x0000017d
	cmp r0, r1
	bne _081474C0
	bl CalculatePlayerPartyCount
	ldr r0, _081474BC @ =gPlayerPartyCount
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
	thumb_func_end CheckRelicanthWailord

	thumb_func_start ShouldDoBrailleStrengthEffect
ShouldDoBrailleStrengthEffect: @ 81474C8
	push {lr}
	movs r0, 0x85
	lsls r0, 4
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _0814750C
	ldr r2, _081474FC @ =gSaveBlock1
	ldrh r1, [r2, 0x4]
	movs r0, 0xC3
	lsls r0, 3
	cmp r1, r0
	bne _0814750C
	ldr r1, [r2]
	ldr r0, _08147500 @ =0x0017000a
	cmp r1, r0
	beq _081474F8
	ldr r0, _08147504 @ =0x00170009
	cmp r1, r0
	beq _081474F8
	ldr r0, _08147508 @ =0x0017000b
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
	thumb_func_end ShouldDoBrailleStrengthEffect

	thumb_func_start DoBrailleStrengthEffect
DoBrailleStrengthEffect: @ 8147514
	push {lr}
	movs r0, 0x28
	bl FieldEffectActiveListRemove
	ldr r2, _08147574 @ =0x0000022a
	movs r0, 0xE
	movs r1, 0x1A
	bl MapGridSetMetatileIdAt
	ldr r2, _08147578 @ =0x0000022b
	movs r0, 0xF
	movs r1, 0x1A
	bl MapGridSetMetatileIdAt
	movs r2, 0x8B
	lsls r2, 2
	movs r0, 0x10
	movs r1, 0x1A
	bl MapGridSetMetatileIdAt
	ldr r2, _0814757C @ =0x00000e32
	movs r0, 0xE
	movs r1, 0x1B
	bl MapGridSetMetatileIdAt
	ldr r2, _08147580 @ =0x00000233
	movs r0, 0xF
	movs r1, 0x1B
	bl MapGridSetMetatileIdAt
	ldr r2, _08147584 @ =0x00000e34
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
	thumb_func_end DoBrailleStrengthEffect

	thumb_func_start ShouldDoBrailleFlyEffect
ShouldDoBrailleFlyEffect: @ 8147588
	push {lr}
	ldr r0, _081475AC @ =0x00000852
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _081475BC
	ldr r2, _081475B0 @ =gSaveBlock1
	ldrh r1, [r2, 0x4]
	ldr r0, _081475B4 @ =0x00004418
	cmp r1, r0
	bne _081475BC
	ldr r1, [r2]
	ldr r0, _081475B8 @ =0x00190008
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
	thumb_func_end ShouldDoBrailleFlyEffect

	thumb_func_start DoBrailleFlyEffect
DoBrailleFlyEffect: @ 81475C4
	push {lr}
	ldr r0, _081475D8 @ =gUnknown_0202FF84
	ldr r1, _081475DC @ =gUnknown_03005CE0
	ldrb r1, [r1]
	str r1, [r0]
	movs r0, 0x3C
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_081475D8: .4byte gUnknown_0202FF84
_081475DC: .4byte gUnknown_03005CE0
	thumb_func_end DoBrailleFlyEffect

	thumb_func_start FldEff_UseFlyAncientTomb
FldEff_UseFlyAncientTomb: @ 81475E0
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08147604 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _08147608 @ =UseFlyAncientTomb_Callback
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08147604: .4byte gTasks
_08147608: .4byte UseFlyAncientTomb_Callback
	thumb_func_end FldEff_UseFlyAncientTomb

	thumb_func_start UseFlyAncientTomb_Callback
UseFlyAncientTomb_Callback: @ 814760C
	push {lr}
	movs r0, 0x3C
	bl FieldEffectActiveListRemove
	bl UseFlyAncientTomb_Finish
	pop {r0}
	bx r0
	thumb_func_end UseFlyAncientTomb_Callback

	thumb_func_start UseFlyAncientTomb_Finish
UseFlyAncientTomb_Finish: @ 814761C
	push {lr}
	ldr r2, _08147674 @ =0x0000022a
	movs r0, 0xE
	movs r1, 0x1A
	bl MapGridSetMetatileIdAt
	ldr r2, _08147678 @ =0x0000022b
	movs r0, 0xF
	movs r1, 0x1A
	bl MapGridSetMetatileIdAt
	movs r2, 0x8B
	lsls r2, 2
	movs r0, 0x10
	movs r1, 0x1A
	bl MapGridSetMetatileIdAt
	ldr r2, _0814767C @ =0x00000e32
	movs r0, 0xE
	movs r1, 0x1B
	bl MapGridSetMetatileIdAt
	ldr r2, _08147680 @ =0x00000233
	movs r0, 0xF
	movs r1, 0x1B
	bl MapGridSetMetatileIdAt
	ldr r2, _08147684 @ =0x00000e34
	movs r0, 0x10
	movs r1, 0x1B
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	movs r0, 0x14
	bl PlaySE
	ldr r0, _08147688 @ =0x00000852
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
	thumb_func_end UseFlyAncientTomb_Finish

	thumb_func_start DoBrailleWait
DoBrailleWait: @ 814768C
	push {lr}
	ldr r0, _081476A8 @ =0x00000851
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _081476A2
	ldr r0, _081476AC @ =Task_BrailleWait
	movs r1, 0x50
	bl CreateTask
_081476A2:
	pop {r0}
	bx r0
	.align 2, 0
_081476A8: .4byte 0x00000851
_081476AC: .4byte Task_BrailleWait
	thumb_func_end DoBrailleWait

	thumb_func_start Task_BrailleWait
Task_BrailleWait: @ 81476B0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _081476D4 @ =gTasks + 0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bhi _0814776A
	lsls r0, 2
	ldr r1, _081476D8 @ =_081476DC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081476D4: .4byte gTasks + 0x8
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
	bl BrailleWait_CheckButtonPress
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
	bl BrailleWait_CheckButtonPress
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
	ldr r0, _08147770 @ =gUnknown_0815EF19
	bl ScriptContext1_SetupScript
	adds r0, r5, 0
	bl DestroyTask
_0814776A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08147770: .4byte gUnknown_0815EF19
	thumb_func_end Task_BrailleWait

	thumb_func_start BrailleWait_CheckButtonPress
BrailleWait_CheckButtonPress: @ 8147774
	push {lr}
	movs r1, 0xFF
	ldr r0, _081477A4 @ =gSaveBlock2
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
	ldr r0, _081477A8 @ =gMain
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
	thumb_func_end BrailleWait_CheckButtonPress

	thumb_func_start DoSealedChamberShakingEffect1
DoSealedChamberShakingEffect1: @ 81477B4
	push {lr}
	ldr r0, _081477E8 @ =SealedChamberShakingEffect
	movs r1, 0x9
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081477EC @ =gTasks
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
_081477E8: .4byte SealedChamberShakingEffect
_081477EC: .4byte gTasks
	thumb_func_end DoSealedChamberShakingEffect1

	thumb_func_start DoSealedChamberShakingEffect2
DoSealedChamberShakingEffect2: @ 81477F0
	push {lr}
	ldr r0, _08147824 @ =SealedChamberShakingEffect
	movs r1, 0x9
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08147828 @ =gTasks
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
_08147824: .4byte SealedChamberShakingEffect
_08147828: .4byte gTasks
	thumb_func_end DoSealedChamberShakingEffect2

	thumb_func_start SealedChamberShakingEffect
SealedChamberShakingEffect: @ 814782C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0814788C @ =gTasks
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
	thumb_func_end SealedChamberShakingEffect

	.align 2, 0 @ Don't pad with nop.
