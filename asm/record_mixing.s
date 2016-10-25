	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_80B929C
sub_80B929C: @ 80B929C
	push {lr}
	ldr r0, _080B92A8 @ =sub_80B9484
	bl sub_8083A84
	pop {r0}
	bx r0
	.align 2, 0
_080B92A8: .4byte sub_80B9484
	thumb_func_end sub_80B929C

	thumb_func_start sub_80B92AC
sub_80B92AC: @ 80B92AC
	push {r4-r6,lr}
	bl sub_80BC300
	bl sub_80C045C
	ldr r6, _080B9364 @ =0x02018000
	ldr r0, _080B9368 @ =gUnknown_083D026C
	ldr r1, [r0]
	movs r2, 0xC8
	lsls r2, 4
	adds r0, r6, 0
	bl memcpy
	movs r1, 0xC8
	lsls r1, 4
	adds r0, r6, r1
	ldr r1, _080B936C @ =gUnknown_083D0270
	ldr r1, [r1]
	movs r2, 0xE1
	lsls r2, 2
	bl memcpy
	ldr r2, _080B9370 @ =0x00001004
	adds r0, r6, r2
	ldr r1, _080B9374 @ =gUnknown_083D0274
	ldr r1, [r1]
	movs r2, 0x40
	bl memcpy
	ldr r1, _080B9378 @ =0x00001044
	adds r0, r6, r1
	ldr r1, _080B937C @ =gUnknown_083D0278
	ldr r1, [r1]
	movs r2, 0x40
	bl memcpy
	ldr r2, _080B9380 @ =0x00001084
	adds r0, r6, r2
	ldr r1, _080B9384 @ =gUnknown_083D027C
	ldr r1, [r1]
	movs r2, 0x28
	bl memcpy
	ldr r5, _080B9388 @ =gUnknown_02038738
	ldr r4, _080B938C @ =gSaveBlock1
	ldr r0, _080B9390 @ =0x0000303c
	adds r1, r4, r0
	adds r0, r5, 0
	movs r2, 0x38
	bl memcpy
	ldr r2, _080B9394 @ =0x00003074
	adds r1, r4, r2
	adds r0, r5, 0
	adds r0, 0x38
	movs r2, 0x38
	bl memcpy
	ldr r0, _080B9398 @ =0x00002f9c
	adds r4, r0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8041324
	ldr r1, _080B939C @ =0x000010ac
	adds r0, r6, r1
	ldr r1, _080B93A0 @ =gUnknown_083D0280
	ldr r1, [r1]
	movs r2, 0x78
	bl memcpy
	ldr r2, _080B93A4 @ =0x00001124
	adds r0, r6, r2
	ldr r1, _080B93A8 @ =gUnknown_083D0284
	ldr r1, [r1]
	movs r2, 0xA4
	bl memcpy
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	bne _080B935C
	bl sub_8126338
	ldr r2, _080B93AC @ =0x000011c8
	adds r1, r6, r2
	strh r0, [r1]
_080B935C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9364: .4byte 0x02018000
_080B9368: .4byte gUnknown_083D026C
_080B936C: .4byte gUnknown_083D0270
_080B9370: .4byte 0x00001004
_080B9374: .4byte gUnknown_083D0274
_080B9378: .4byte 0x00001044
_080B937C: .4byte gUnknown_083D0278
_080B9380: .4byte 0x00001084
_080B9384: .4byte gUnknown_083D027C
_080B9388: .4byte gUnknown_02038738
_080B938C: .4byte gSaveBlock1
_080B9390: .4byte 0x0000303c
_080B9394: .4byte 0x00003074
_080B9398: .4byte 0x00002f9c
_080B939C: .4byte 0x000010ac
_080B93A0: .4byte gUnknown_083D0280
_080B93A4: .4byte 0x00001124
_080B93A8: .4byte gUnknown_083D0284
_080B93AC: .4byte 0x000011c8
	thumb_func_end sub_80B92AC

	thumb_func_start sub_80B93B0
sub_80B93B0: @ 80B93B0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	ldr r5, _080B9430 @ =0x02008000
	ldr r6, _080B9434 @ =0x00001230
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_80BD674
	movs r0, 0xC8
	lsls r0, 4
	adds r0, r5
	mov r8, r0
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_80BFD44
	ldr r1, _080B9438 @ =0x00001004
	adds r0, r5, r1
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_80C0514
	ldr r1, _080B943C @ =0x00001044
	adds r0, r5, r1
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_80B9B1C
	ldr r1, _080B9440 @ =0x00001084
	adds r0, r5, r1
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_80FA4E4
	ldr r1, _080B9444 @ =0x000010ac
	adds r0, r5, r1
	adds r1, r6, 0
	adds r2, r4, 0
	mov r3, r8
	bl sub_80B9C6C
	ldr r1, _080B9448 @ =0x00001124
	adds r0, r5, r1
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_80B9B70
	ldr r0, _080B944C @ =0x000011c8
	adds r5, r0
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80B9F3C
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9430: .4byte 0x02008000
_080B9434: .4byte 0x00001230
_080B9438: .4byte 0x00001004
_080B943C: .4byte 0x00001044
_080B9440: .4byte 0x00001084
_080B9444: .4byte 0x000010ac
_080B9448: .4byte 0x00001124
_080B944C: .4byte 0x000011c8
	thumb_func_end sub_80B93B0

	thumb_func_start sub_80B9450
sub_80B9450: @ 80B9450
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B9480 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x32
	bne _080B9478
	movs r0, 0xE2
	bl PlaySE
	movs r0, 0
	strh r0, [r4, 0x8]
_080B9478:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9480: .4byte gTasks
	thumb_func_end sub_80B9450

	thumb_func_start sub_80B9484
sub_80B9484: @ 80B9484
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080B94A8 @ =gTasks + 0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bls _080B949E
	b _080B95E6
_080B949E:
	lsls r0, 2
	ldr r1, _080B94AC @ =_080B94B0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B94A8: .4byte gTasks + 0x8
_080B94AC: .4byte _080B94B0
	.align 2, 0
_080B94B0:
	.4byte _080B94C8
	.4byte _080B951C
	.4byte _080B9550
	.4byte _080B9570
	.4byte _080B95AC
	.4byte _080B95C0
_080B94C8:
	ldr r0, _080B950C @ =gUnknown_0202E8CE
	ldrb r0, [r0]
	bl sub_8007270
	movs r0, 0x80
	lsls r0, 7
	movs r1, 0x1
	bl VarSet
	ldr r1, _080B9510 @ =gUnknown_03000718
	movs r0, 0
	strb r0, [r1]
	bl sub_80B92AC
	bl sub_80C71D8
	movs r0, 0x1
	strh r0, [r4]
	ldr r0, _080B9514 @ =sub_80B95F0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x14]
	ldr r0, _080B9518 @ =sub_80B9450
	movs r1, 0x51
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1E]
	b _080B95E6
	.align 2, 0
_080B950C: .4byte gUnknown_0202E8CE
_080B9510: .4byte gUnknown_03000718
_080B9514: .4byte sub_80B95F0
_080B9518: .4byte sub_80B9450
_080B951C:
	ldr r2, _080B9548 @ =gTasks
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	bne _080B95E6
	movs r0, 0x2
	strh r0, [r4]
	ldr r0, _080B954C @ =0x00000834
	bl FlagSet
	bl sub_80C7240
	ldrb r0, [r4, 0x1E]
	bl DestroyTask
	b _080B95E6
	.align 2, 0
_080B9548: .4byte gTasks
_080B954C: .4byte 0x00000834
_080B9550:
	ldr r0, _080B956C @ =sub_80BA00C
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x14]
	movs r0, 0x3
	strh r0, [r4]
	movs r0, 0xE0
	bl PlaySE
	b _080B95E6
	.align 2, 0
_080B956C: .4byte sub_80BA00C
_080B9570:
	ldr r2, _080B95A4 @ =gTasks
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r5, [r0, 0x4]
	cmp r5, 0
	bne _080B95E6
	movs r0, 0x4
	strh r0, [r4]
	bl sub_8083664
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x14]
	bl sub_80720B0
	ldr r0, _080B95A8 @ =gOtherText_MixingComplete
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	strh r5, [r4, 0x10]
	b _080B95E6
	.align 2, 0
_080B95A4: .4byte gTasks
_080B95A8: .4byte gOtherText_MixingComplete
_080B95AC:
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3C
	ble _080B95E6
	movs r0, 0x5
	strh r0, [r4]
	b _080B95E6
_080B95C0:
	ldr r2, _080B95EC @ =gTasks
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	bne _080B95E6
	bl sub_8055588
	bl MenuZeroFillScreen
	adds r0, r5, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_080B95E6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B95EC: .4byte gTasks
	thumb_func_end sub_80B9484

	thumb_func_start sub_80B95F0
sub_80B95F0: @ 80B95F0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r7, _080B961C @ =gTasks
	adds r5, r0, r7
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	cmp r1, 0x64
	beq _080B9678
	cmp r1, 0x64
	bgt _080B962E
	cmp r1, 0x1
	bne _080B9612
	b _080B9734
_080B9612:
	cmp r1, 0x1
	bgt _080B9620
	cmp r1, 0
	beq _080B9650
	b _080B97D6
	.align 2, 0
_080B961C: .4byte gTasks
_080B9620:
	cmp r1, 0x2
	bne _080B9626
	b _080B9760
_080B9626:
	cmp r1, 0x5
	bne _080B962C
	b _080B97C0
_080B962C:
	b _080B97D6
_080B962E:
	cmp r1, 0xC9
	beq _080B96D0
	cmp r1, 0xC9
	bgt _080B963C
	cmp r1, 0x65
	beq _080B9690
	b _080B97D6
_080B963C:
	ldr r0, _080B964C @ =0x0000012d
	cmp r1, r0
	beq _080B9706
	adds r0, 0x63
	cmp r1, r0
	beq _080B971C
	b _080B97D6
	.align 2, 0
_080B964C: .4byte 0x0000012d
_080B9650:
	bl sub_80B9A78
	bl MenuDisplayMessageBox
	ldr r0, _080B9674 @ =gOtherText_MixingRecordsWithFriend
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	movs r0, 0xE1
	lsls r0, 3
	strh r0, [r5, 0x18]
	movs r0, 0xC8
	lsls r0, 1
	strh r0, [r5, 0x8]
	bl ClearLinkCallback_2
	b _080B97D6
	.align 2, 0
_080B9674: .4byte gOtherText_MixingRecordsWithFriend
_080B9678:
	ldrh r0, [r5, 0x20]
	adds r0, 0x1
	strh r0, [r5, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bgt _080B9688
	b _080B97D6
_080B9688:
	movs r0, 0
	strh r0, [r5, 0x20]
	movs r0, 0x65
	b _080B97D4
_080B9690:
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsLinkMaster
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B96C2
	bl sub_800820C
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	beq _080B96B2
	b _080B97D6
_080B96B2:
	movs r0, 0x15
	bl PlaySE
	movs r1, 0
	movs r0, 0xC9
	strh r0, [r5, 0x8]
	strh r1, [r5, 0x20]
	b _080B97D6
_080B96C2:
	movs r0, 0x16
	bl PlaySE
	ldr r0, _080B96CC @ =0x0000012d
	b _080B97D4
	.align 2, 0
_080B96CC: .4byte 0x0000012d
_080B96D0:
	bl sub_800820C
	adds r4, r0, 0
	bl GetLinkPlayerCount_2
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080B97D6
	ldrh r4, [r5, 0x20]
	adds r4, 0x1
	strh r4, [r5, 0x20]
	lsls r4, 16
	asrs r4, 16
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 1
	cmp r4, r1
	ble _080B97D6
	bl sub_8007F4C
	movs r0, 0x1
	b _080B97D4
_080B9706:
	bl sub_800820C
	adds r4, r0, 0
	bl GetLinkPlayerCount_2
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080B97D6
	movs r0, 0x1
	b _080B97D4
_080B971C:
	ldrh r0, [r5, 0x20]
	adds r0, 0x1
	strh r0, [r5, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080B97D6
	movs r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	strh r0, [r5, 0x20]
	b _080B97D6
_080B9734:
	ldr r0, _080B9758 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _080B97D6
	ldr r4, _080B975C @ =gStringVar1
	bl sub_80B9A58
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	movs r0, 0x5
	b _080B97D4
	.align 2, 0
_080B9758: .4byte gReceivedRemoteLinkPlayers
_080B975C: .4byte gStringVar1
_080B9760:
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	strh r0, [r5, 0x14]
	strh r1, [r5, 0x8]
	bl sub_80B9A58
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x12]
	ldr r0, _080B97B0 @ =sub_80B97DC
	str r0, [r5]
	ldr r4, _080B97B4 @ =0x02018000
	adds r1, r5, 0
	adds r1, 0xC
	adds r0, r4, 0
	bl sub_80B9A50
	ldr r0, _080B97B8 @ =sub_80B9890
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x1C]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r0, r1, r7
	strh r6, [r0, 0x8]
	ldr r0, _080B97BC @ =0xffff0000
	adds r4, r0
	adds r1, r7, r1
	adds r1, 0x12
	adds r0, r4, 0
	bl sub_80B9A50
	b _080B97D6
	.align 2, 0
_080B97B0: .4byte sub_80B97DC
_080B97B4: .4byte 0x02018000
_080B97B8: .4byte sub_80B9890
_080B97BC: .4byte 0xffff0000
_080B97C0:
	ldrh r0, [r5, 0x1C]
	adds r0, 0x1
	strh r0, [r5, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3C
	ble _080B97D6
	movs r0, 0
	strh r0, [r5, 0x1C]
	movs r0, 0x2
_080B97D4:
	strh r0, [r5, 0x8]
_080B97D6:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B95F0

	thumb_func_start sub_80B97DC
sub_80B97DC: @ 80B97DC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080B9800 @ =gTasks
	adds r4, r1, r0
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	adds r2, r0, 0
	cmp r1, 0x4
	bhi _080B9884
	lsls r0, r1, 2
	ldr r1, _080B9804 @ =_080B9808
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B9800: .4byte gTasks
_080B9804: .4byte _080B9808
	.align 2, 0
_080B9808:
	.4byte _080B981C
	.4byte _080B9840
	.4byte _080B9884
	.4byte _080B9852
	.4byte _080B986E
_080B981C:
	adds r0, r4, 0
	adds r0, 0xC
	bl sub_80B9A44
	adds r1, r0, 0
	movs r0, 0x10
	ldrsh r2, [r4, r0]
	movs r0, 0xC8
	muls r0, r2
	adds r1, r0
	ldr r0, _080B983C @ =gBlockSendBuffer
	movs r2, 0xC8
	bl memcpy
	b _080B9860
	.align 2, 0
_080B983C: .4byte gBlockSendBuffer
_080B9840:
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	bne _080B9860
	movs r0, 0x1
	bl sub_8007E9C
	b _080B9860
_080B9852:
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x18
	bne _080B9868
_080B9860:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B9884
_080B9868:
	movs r0, 0
	strh r0, [r4, 0x8]
	b _080B9884
_080B986E:
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	bne _080B9884
	ldr r0, _080B988C @ =sub_80B9A1C
	str r0, [r4]
_080B9884:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B988C: .4byte sub_80B9A1C
	thumb_func_end sub_80B97DC

	thumb_func_start sub_80B9890
sub_80B9890: @ 80B9890
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	lsls r0, 2
	ldr r1, [sp]
	adds r0, r1
	lsls r0, 3
	ldr r1, _080B98D0 @ =gTasks
	adds r0, r1
	mov r10, r0
	bl GetBlockRecievedStatus
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r2, 0
	str r2, [sp, 0x8]
	bl sub_8008198
	lsls r0, 24
	lsrs r0, 24
	ldr r3, [sp, 0x4]
	cmp r3, r0
	bne _080B998A
	movs r0, 0
	b _080B9966
	.align 2, 0
_080B98D0: .4byte gTasks
_080B98D4:
	ldr r1, [sp, 0x4]
	mov r2, r9
	asrs r1, r2
	movs r0, 0x1
	ands r1, r0
	movs r3, 0x1
	add r3, r9
	mov r8, r3
	cmp r1, 0
	beq _080B9960
	mov r0, r10
	adds r0, 0x12
	bl sub_80B9A44
	mov r1, r8
	lsls r4, r1, 1
	mov r5, r10
	adds r5, 0x8
	adds r4, r5, r4
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0xC8
	muls r1, r3
	adds r0, r1
	ldr r7, _080B9930 @ =0x00001230
	mov r1, r9
	muls r1, r7
	adds r6, r0, r1
	mov r0, r9
	str r3, [sp, 0xC]
	bl sub_80B9A68
	adds r1, r0, 0
	movs r0, 0
	ldrsh r2, [r4, r0]
	adds r0, r2, 0x1
	ldr r3, [sp, 0xC]
	muls r0, r3
	cmp r0, r7
	bls _080B9934
	muls r2, r3
	subs r2, r7, r2
	adds r0, r6, 0
	bl memcpy
	b _080B993C
	.align 2, 0
_080B9930: .4byte 0x00001230
_080B9934:
	adds r0, r6, 0
	movs r2, 0xC8
	bl memcpy
_080B993C:
	mov r0, r9
	bl ResetBlockReceivedFlag
	mov r2, r8
	lsls r1, r2, 1
	adds r1, r5, r1
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x18
	bne _080B9960
	ldr r0, [sp, 0x8]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
_080B9960:
	mov r3, r8
	lsls r0, r3, 24
	lsrs r0, 24
_080B9966:
	mov r9, r0
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r9, r0
	bcc _080B98D4
	ldr r2, _080B99B0 @ =gTasks
	mov r0, r10
	movs r3, 0x8
	ldrsh r1, [r0, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
_080B998A:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [sp, 0x8]
	cmp r1, r0
	bne _080B999E
	ldr r0, [sp]
	bl DestroyTask
_080B999E:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B99B0: .4byte gTasks
	thumb_func_end sub_80B9890

	thumb_func_start sub_80B99B4
sub_80B99B4: @ 80B99B4
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	ldr r2, _080B99E4 @ =gTasks
	adds r0, r2
	movs r4, 0x1C
	ldrsh r1, [r0, r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	bne _080B99DC
	adds r0, r3, 0
	bl DestroyTask
_080B99DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B99E4: .4byte gTasks
	thumb_func_end sub_80B99B4

	thumb_func_start sub_80B99E8
sub_80B99E8: @ 80B99E8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080B9A10 @ =gTasks
	adds r1, r0
	ldr r0, _080B9A14 @ =sub_80B99B4
	str r0, [r1]
	ldr r0, _080B9A18 @ =gUnknown_03000718
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080B9A0C
	movs r2, 0x12
	ldrsh r0, [r1, r2]
	bl sub_80B93B0
_080B9A0C:
	pop {r0}
	bx r0
	.align 2, 0
_080B9A10: .4byte gTasks
_080B9A14: .4byte sub_80B99B4
_080B9A18: .4byte gUnknown_03000718
	thumb_func_end sub_80B99E8

	thumb_func_start sub_80B9A1C
sub_80B9A1C: @ 80B9A1C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B9A38 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080B9A3C @ =sub_80B99E8
	str r0, [r1]
	ldr r1, _080B9A40 @ =gUnknown_03000718
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_080B9A38: .4byte gTasks
_080B9A3C: .4byte sub_80B99E8
_080B9A40: .4byte gUnknown_03000718
	thumb_func_end sub_80B9A1C

	thumb_func_start sub_80B9A44
sub_80B9A44: @ 80B9A44
	adds r1, r0, 0
	ldrh r0, [r1]
	ldrh r1, [r1, 0x2]
	lsls r1, 16
	orrs r0, r1
	bx lr
	thumb_func_end sub_80B9A44

	thumb_func_start sub_80B9A50
sub_80B9A50: @ 80B9A50
	strh r0, [r1]
	lsrs r0, 16
	strh r0, [r1, 0x2]
	bx lr
	thumb_func_end sub_80B9A50

	thumb_func_start sub_80B9A58
sub_80B9A58: @ 80B9A58
	push {lr}
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80B9A58

	thumb_func_start sub_80B9A68
sub_80B9A68: @ 80B9A68
	lsls r0, 24
	lsrs r0, 16
	ldr r1, _080B9A74 @ =gBlockRecvBuffer
	adds r0, r1
	bx lr
	.align 2, 0
_080B9A74: .4byte gBlockRecvBuffer
	thumb_func_end sub_80B9A68

	thumb_func_start sub_80B9A78
sub_80B9A78: @ 80B9A78
	ldr r1, _080B9A80 @ =gUnknown_03005D2C
	ldr r0, _080B9A84 @ =0x00001230
	str r0, [r1]
	bx lr
	.align 2, 0
_080B9A80: .4byte gUnknown_03005D2C
_080B9A84: .4byte 0x00001230
	thumb_func_end sub_80B9A78

	thumb_func_start sub_80B9A88
sub_80B9A88: @ 80B9A88
	push {r4,lr}
	adds r4, r0, 0
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _080B9AC0
	cmp r0, 0x3
	bhi _080B9AA2
	cmp r0, 0x2
	beq _080B9AA8
	b _080B9B10
_080B9AA2:
	cmp r0, 0x4
	beq _080B9AEC
	b _080B9B10
_080B9AA8:
	movs r2, 0
	ldr r3, _080B9ABC @ =gUnknown_083D0288
_080B9AAC:
	adds r0, r4, r2
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x1
	bls _080B9AAC
	b _080B9B10
	.align 2, 0
_080B9ABC: .4byte gUnknown_083D0288
_080B9AC0:
	movs r0, 0
	bl GetLinkPlayerTrainerId
	adds r3, r0, 0
	movs r0, 0x1
	ands r3, r0
	movs r2, 0
	ldr r1, _080B9AE8 @ =gUnknown_083D028A
	lsls r0, r3, 1
	adds r0, r3
	adds r3, r0, r1
_080B9AD6:
	adds r1, r4, r2
	ldrb r0, [r3]
	strb r0, [r1]
	adds r3, 0x1
	adds r2, 0x1
	cmp r2, 0x2
	bls _080B9AD6
	b _080B9B10
	.align 2, 0
_080B9AE8: .4byte gUnknown_083D028A
_080B9AEC:
	movs r0, 0
	bl GetLinkPlayerTrainerId
	movs r1, 0x9
	bl __umodsi3
	adds r3, r0, 0
	movs r2, 0
	ldr r1, _080B9B18 @ =gUnknown_083D0290
	lsls r0, r3, 2
	adds r3, r0, r1
_080B9B02:
	adds r1, r4, r2
	ldrb r0, [r3]
	strb r0, [r1]
	adds r3, 0x1
	adds r2, 0x1
	cmp r2, 0x3
	bls _080B9B02
_080B9B10:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9B18: .4byte gUnknown_083D0290
	thumb_func_end sub_80B9A88

	thumb_func_start sub_80B9B1C
sub_80B9B1C: @ 80B9B1C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	adds r5, r0, 0
	mov r8, r1
	lsls r4, r2, 24
	lsrs r4, 24
	mov r0, sp
	bl sub_80B9A88
	mov r0, r8
	muls r0, r4
	adds r0, r5, r0
	ldr r1, _080B9B6C @ =gUnknown_083D0278
	ldr r6, [r1]
	adds r1, r6, 0
	movs r2, 0x40
	bl memcpy
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r5, r0
	adds r0, r6, 0
	adds r1, r5, 0
	movs r2, 0x40
	bl memcpy
	bl sub_80F7F30
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9B6C: .4byte gUnknown_083D0278
	thumb_func_end sub_80B9B1C

	thumb_func_start sub_80B9B70
sub_80B9B70: @ 80B9B70
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	adds r6, r0, 0
	mov r9, r1
	lsls r4, r2, 24
	lsrs r4, 24
	ldr r0, _080B9BB8 @ =gUnknown_0300071C
	mov r8, r0
	bl sub_80B9A88
	mov r5, r9
	muls r5, r4
	adds r5, r6, r5
	add r4, r8
	ldrb r0, [r4]
	mov r1, r9
	muls r1, r0
	adds r0, r1, 0
	adds r6, r0
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0xA4
	bl memcpy
	adds r0, r5, 0
	bl sub_8134AC0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9BB8: .4byte gUnknown_0300071C
	thumb_func_end sub_80B9B70

	thumb_func_start sub_80B9BBC
sub_80B9BBC: @ 80B9BBC
	ldrh r0, [r0, 0x20]
	lsls r0, 24
	lsrs r0, 24
	bx lr
	thumb_func_end sub_80B9BBC

	thumb_func_start sub_80B9BC4
sub_80B9BC4: @ 80B9BC4
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x38
	mov r8, r0
	mov r10, r1
	mov r9, r2
	adds r4, r3, 0
	ldr r5, [sp, 0x54]
	lsls r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsrs r4, 23
	add r4, r9
	ldrb r0, [r4]
	mov r6, r10
	muls r6, r0
	add r6, r8
	ldrb r0, [r4, 0x1]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 3
	adds r1, r6, r1
	mov r0, sp
	movs r2, 0x38
	bl memcpy
	lsls r5, 1
	add r5, r9
	ldrb r0, [r5]
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	add r8, r0
	ldrb r1, [r4, 0x1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 3
	adds r6, r0
	ldrb r0, [r5, 0x1]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 3
	add r1, r8
	adds r0, r6, 0
	movs r2, 0x38
	bl memcpy
	ldrb r1, [r5, 0x1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 3
	add r8, r0
	mov r0, r8
	mov r1, sp
	movs r2, 0x38
	bl memcpy
	add sp, 0x38
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80B9BC4

	thumb_func_start sub_80B9C4C
sub_80B9C4C: @ 80B9C4C
	push {lr}
	adds r3, r0, 0
	movs r2, 0
	movs r1, 0
_080B9C54:
	adds r0, r3, r1
	ldrb r0, [r0]
	adds r0, r2, r0
	lsls r0, 24
	lsrs r2, r0, 24
	adds r1, 0x1
	cmp r1, 0xFF
	ble _080B9C54
	adds r0, r2, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80B9C4C

	thumb_func_start sub_80B9C6C
sub_80B9C6C: @ 80B9C6C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x58
	str r0, [sp, 0x2C]
	str r1, [sp, 0x30]
	str r3, [sp, 0x38]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x34]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x40]
	ldr r0, _080B9DA8 @ =gLinkPlayers
	ldrh r0, [r0, 0x4]
	bl SeedRng
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r3, 0
	add r0, sp, 0x1C
	mov r9, r0
	movs r1, 0x1D
	add r1, sp
	mov r10, r1
	mov r2, sp
	adds r2, 0xC
	str r2, [sp, 0x4C]
	movs r7, 0xFF
	add r4, sp, 0x8
	movs r2, 0
	mov r6, r9
	mov r5, r10
_080B9CBC:
	mov r1, sp
	adds r1, r3
	adds r1, 0x4
	ldrb r0, [r1]
	orrs r0, r7
	strb r0, [r1]
	adds r0, r4, r3
	strb r2, [r0]
	lsls r1, r3, 1
	adds r0, r6, r1
	strb r2, [r0]
	adds r1, r5, r1
	strb r2, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3
	bls _080B9CBC
	movs r4, 0
	str r4, [sp, 0x3C]
	movs r3, 0
	mov r1, r8
	lsls r0, r1, 16
	lsrs r1, r0, 16
	str r0, [sp, 0x50]
	ldr r4, [sp, 0x30]
	ldr r0, [sp, 0x34]
	adds r2, r4, 0
	muls r2, r0
	str r2, [sp, 0x48]
	ldr r2, [sp, 0x3C]
	cmp r2, r1
	bcs _080B9D46
	mov r8, r1
_080B9D00:
	ldr r4, [sp, 0x30]
	adds r0, r4, 0
	muls r0, r3
	ldr r1, [sp, 0x2C]
	adds r6, r1, r0
	ldr r0, [r6, 0x70]
	cmp r0, 0
	beq _080B9D3C
	movs r7, 0
	cmp r7, r0
	bcs _080B9D3C
	adds r4, r6, 0
	adds r4, 0x74
	mov r2, r9
	lsls r1, r3, 1
	movs r5, 0x1
_080B9D20:
	lsls r0, r7, 1
	adds r0, r4, r0
	ldrh r0, [r0]
	cmp r0, 0
	bne _080B9D30
	adds r0, r7, r1
	adds r0, r2, r0
	strb r5, [r0]
_080B9D30:
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r0, [r6, 0x70]
	cmp r7, r0
	bcc _080B9D20
_080B9D3C:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r8
	bcc _080B9D00
_080B9D46:
	movs r7, 0
	movs r3, 0
	ldr r2, [sp, 0x50]
	cmp r2, 0
	beq _080B9E3E
	mov r4, sp
	adds r4, 0x24
	str r4, [sp, 0x44]
	movs r0, 0x25
	add r0, sp
	mov r8, r0
_080B9D5C:
	ldr r1, [sp, 0x30]
	adds r0, r1, 0
	muls r0, r3
	ldr r2, [sp, 0x2C]
	adds r6, r2, r0
	lsls r1, r3, 1
	mov r4, r9
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080B9D7C
	mov r2, r10
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080B9D86
_080B9D7C:
	ldr r0, [sp, 0x3C]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x3C]
_080B9D86:
	mov r4, r9
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080B9DAC
	mov r2, r10
	adds r0, r2, r1
	ldrb r2, [r0]
	cmp r2, 0
	bne _080B9DAC
_080B9D9A:
	lsls r1, r7, 1
	ldr r4, [sp, 0x44]
	adds r0, r4, r1
	strb r3, [r0]
	add r1, r8
	strb r2, [r1]
	b _080B9E2C
	.align 2, 0
_080B9DA8: .4byte gLinkPlayers
_080B9DAC:
	mov r2, r9
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080B9DC0
	mov r4, r10
	adds r0, r4, r1
	ldrb r2, [r0]
	cmp r2, 0x1
	beq _080B9D9A
_080B9DC0:
	mov r2, r9
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080B9E32
	mov r4, r10
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080B9E32
	lsls r5, r7, 1
	ldr r1, [sp, 0x44]
	adds r0, r1, r5
	strb r3, [r0]
	adds r0, r6, 0
	str r3, [sp, 0x54]
	bl sub_80B9BBC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	adds r0, 0x38
	bl sub_80B9BBC
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r3, [sp, 0x54]
	cmp r4, 0
	bne _080B9E0A
	cmp r1, 0
	beq _080B9E0E
	mov r2, r8
	adds r1, r2, r5
	movs r0, 0x1
	strb r0, [r1]
	b _080B9E2C
_080B9E0A:
	cmp r1, 0
	beq _080B9E26
_080B9E0E:
	str r3, [sp, 0x54]
	bl Random
	mov r4, r8
	adds r2, r4, r5
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	strb r0, [r2]
	ldr r3, [sp, 0x54]
	b _080B9E2C
_080B9E26:
	mov r2, r8
	adds r0, r2, r5
	strb r1, [r0]
_080B9E2C:
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
_080B9E32:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r4, [sp, 0x50]
	cmp r0, r4
	bcc _080B9D5C
_080B9E3E:
	movs r3, 0
	ldr r1, [sp, 0x48]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 3
	ldr r2, [sp, 0x2C]
	adds r6, r2, r0
	ldr r1, [sp, 0x4C]
_080B9E4E:
	lsls r0, r3, 2
	adds r0, r1, r0
	str r6, [r0]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3
	bls _080B9E4E
	ldr r0, [sp, 0x38]
	bl sub_80B9C4C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r4, [sp, 0x3C]
	cmp r4, 0x3
	beq _080B9E9C
	cmp r4, 0x3
	bgt _080B9E82
	cmp r4, 0x2
	beq _080B9E8A
	b _080B9EF0
_080B9E82:
	ldr r0, [sp, 0x3C]
	cmp r0, 0x4
	beq _080B9EBC
	b _080B9EF0
_080B9E8A:
	add r2, sp, 0x24
	movs r0, 0x1
	str r0, [sp]
	ldr r0, [sp, 0x2C]
	ldr r1, [sp, 0x30]
	movs r3, 0
	bl sub_80B9BC4
	b _080B9EF0
_080B9E9C:
	ldr r0, _080B9EB8 @ =gUnknown_083D02B4
	lsls r1, 1
	adds r2, r1, r0
	ldrb r3, [r2]
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	add r2, sp, 0x24
	str r0, [sp]
	ldr r0, [sp, 0x2C]
	ldr r1, [sp, 0x30]
	bl sub_80B9BC4
	b _080B9EF0
	.align 2, 0
_080B9EB8: .4byte gUnknown_083D02B4
_080B9EBC:
	add r6, sp, 0x24
	ldr r4, _080B9F2C @ =gUnknown_083D02BA
	lsls r5, r1, 2
	adds r0, r5, r4
	ldrb r3, [r0]
	adds r0, r4, 0x1
	adds r0, r5, r0
	ldrb r0, [r0]
	str r0, [sp]
	ldr r0, [sp, 0x2C]
	ldr r1, [sp, 0x30]
	adds r2, r6, 0
	bl sub_80B9BC4
	adds r0, r4, 0x2
	adds r0, r5, r0
	ldrb r3, [r0]
	adds r4, 0x3
	adds r5, r4
	ldrb r0, [r5]
	str r0, [sp]
	ldr r0, [sp, 0x2C]
	ldr r1, [sp, 0x30]
	adds r2, r6, 0
	bl sub_80B9BC4
_080B9EF0:
	ldr r1, [sp, 0x2C]
	ldr r2, [sp, 0x48]
	adds r6, r1, r2
	ldr r4, _080B9F30 @ =gSaveBlock1
	ldr r1, _080B9F34 @ =0x0000303c
	adds r0, r4, r1
	adds r1, r6, 0
	movs r2, 0x38
	bl memcpy
	ldr r2, _080B9F38 @ =0x00003074
	adds r4, r2
	adds r1, r6, 0
	adds r1, 0x38
	adds r0, r4, 0
	movs r2, 0x38
	bl memcpy
	ldr r0, [sp, 0x40]
	bl SeedRng
	add sp, 0x58
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9F2C: .4byte gUnknown_083D02BA
_080B9F30: .4byte gSaveBlock1
_080B9F34: .4byte 0x0000303c
_080B9F38: .4byte 0x00003074
	thumb_func_end sub_80B9C6C

	thumb_func_start sub_80B9F3C
sub_80B9F3C: @ 80B9F3C
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 24
	cmp r1, 0
	beq _080BA000
	ldrh r0, [r4]
	cmp r0, 0
	beq _080BA000
	bl sub_80A9670
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bne _080B9FC8
	ldrh r0, [r4]
	movs r1, 0x1
	bl sub_80A92D4
	lsls r0, 24
	cmp r0, 0
	bne _080B9FB8
	ldrh r0, [r4]
	movs r1, 0x1
	bl sub_80A9718
	lsls r0, 24
	cmp r0, 0
	bne _080B9FB8
	ldrh r0, [r4]
	movs r1, 0x1
	bl sub_80A9424
	lsls r0, 24
	cmp r0, 0
	beq _080B9FB8
	ldr r0, _080B9FA4 @ =0x00004001
	ldrh r1, [r4]
	bl VarSet
	ldr r0, _080B9FA8 @ =gStringVar1
	ldr r1, _080B9FAC @ =gLinkPlayers + 0x8
	bl StringCopy
	ldrh r1, [r4]
	ldr r0, _080B9FB0 @ =0x00000113
	cmp r1, r0
	bne _080BA000
	ldr r0, _080B9FB4 @ =0x00000853
	bl FlagSet
	b _080BA000
	.align 2, 0
_080B9FA4: .4byte 0x00004001
_080B9FA8: .4byte gStringVar1
_080B9FAC: .4byte gLinkPlayers + 0x8
_080B9FB0: .4byte 0x00000113
_080B9FB4: .4byte 0x00000853
_080B9FB8:
	ldr r0, _080B9FC4 @ =0x00004001
	movs r1, 0
	bl VarSet
	b _080BA000
	.align 2, 0
_080B9FC4: .4byte 0x00004001
_080B9FC8:
	ldrh r0, [r4]
	movs r1, 0x1
	bl sub_80A9424
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B9FF8
	ldr r0, _080B9FEC @ =0x00004001
	ldrh r1, [r4]
	bl VarSet
	ldr r0, _080B9FF0 @ =gStringVar1
	ldr r1, _080B9FF4 @ =gLinkPlayers + 0x8
	bl StringCopy
	b _080BA000
	.align 2, 0
_080B9FEC: .4byte 0x00004001
_080B9FF0: .4byte gStringVar1
_080B9FF4: .4byte gLinkPlayers + 0x8
_080B9FF8:
	ldr r0, _080BA008 @ =0x00004001
	movs r1, 0
	bl VarSet
_080BA000:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA008: .4byte 0x00004001
	thumb_func_end sub_80B9F3C

	thumb_func_start sub_80BA00C
sub_80BA00C: @ 80BA00C
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080BA030 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bhi _080BA09C
	lsls r0, 2
	ldr r1, _080BA034 @ =_080BA038
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BA030: .4byte gTasks
_080BA034: .4byte _080BA038
	.align 2, 0
_080BA038:
	.4byte _080BA086
	.4byte _080BA086
	.4byte _080BA050
	.4byte _080BA05A
	.4byte _080BA074
	.4byte _080BA08E
_080BA050:
	bl sub_8047A1C
	bl sub_8125E2C
	b _080BA086
_080BA05A:
	bl sub_8125E6C
	lsls r0, 24
	cmp r0, 0
	beq _080BA09C
	bl sub_8047A34
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xA]
	b _080BA09C
_080BA074:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	ble _080BA09C
	bl sub_800832C
_080BA086:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080BA09C
_080BA08E:
	ldr r0, _080BA0A4 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _080BA09C
	adds r0, r2, 0
	bl DestroyTask
_080BA09C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA0A4: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_80BA00C

	.align 2, 0 @ Don't pad with nop.
