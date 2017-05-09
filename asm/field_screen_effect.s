	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_808136C
sub_808136C: @ 808136C
	push {lr}
	cmp r1, 0xA0
	bhi _08081394
	cmp r2, 0
	bge _08081378
	movs r2, 0
_08081378:
	cmp r2, 0xFF
	ble _0808137E
	movs r2, 0xFF
_0808137E:
	cmp r3, 0
	bge _08081384
	movs r3, 0
_08081384:
	cmp r3, 0xFF
	ble _0808138A
	movs r3, 0xFF
_0808138A:
	lsls r1, 1
	adds r1, r0
	lsls r0, r2, 8
	orrs r0, r3
	strh r0, [r1]
_08081394:
	pop {r0}
	bx r0
	thumb_func_end sub_808136C

	thumb_func_start sub_8081398
sub_8081398: @ 8081398
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	str r0, [sp]
	mov r10, r1
	mov r9, r2
	adds r6, r3, 0
	mov r8, r6
	movs r7, 0
	cmp r6, 0
	blt _08081414
_080813B4:
	mov r0, r9
	subs r1, r0, r7
	mov r0, r10
	subs r4, r0, r6
	adds r5, r0, r6
	ldr r0, [sp]
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_808136C
	mov r0, r9
	adds r1, r0, r7
	ldr r0, [sp]
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_808136C
	mov r0, r9
	subs r1, r0, r6
	mov r0, r10
	subs r4, r0, r7
	adds r5, r0, r7
	ldr r0, [sp]
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_808136C
	mov r0, r9
	adds r1, r0, r6
	ldr r0, [sp]
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_808136C
	mov r1, r8
	adds r1, 0x1
	lsls r0, r7, 1
	subs r1, r0
	mov r8, r1
	adds r7, 0x1
	cmp r1, 0
	bge _08081410
	subs r1, r6, 0x1
	lsls r0, r1, 1
	add r8, r0
	adds r6, r1, 0
_08081410:
	cmp r6, r7
	bge _080813B4
_08081414:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8081398

	thumb_func_start sub_8081424
sub_8081424: @ 8081424
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08081448 @ =gTasks + 0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08081480
	cmp r0, 0x1
	bgt _0808144C
	cmp r0, 0
	beq _08081452
	b _080814E2
	.align 2, 0
_08081448: .4byte gTasks + 0x8
_0808144C:
	cmp r0, 0x2
	beq _080814D8
	b _080814E2
_08081452:
	ldr r0, _08081478 @ =gUnknown_03004DC0
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	ldr r1, _0808147C @ =gUnknown_03004DE0
	adds r0, r1
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r5, 0x6
	ldrsh r3, [r4, r5]
	bl sub_8081398
	movs r0, 0x1
	strh r0, [r4]
	b _080814E2
	.align 2, 0
_08081478: .4byte gUnknown_03004DC0
_0808147C: .4byte gUnknown_03004DE0
_08081480:
	ldr r0, _080814C8 @ =gUnknown_03004DC0
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	ldr r1, _080814CC @ =gUnknown_03004DE0
	adds r0, r1
	movs r6, 0x2
	ldrsh r1, [r4, r6]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r6, 0x6
	ldrsh r3, [r4, r6]
	bl sub_8081398
	movs r0, 0
	strh r0, [r4]
	ldrh r0, [r4, 0xA]
	ldrh r1, [r4, 0x6]
	adds r0, r1
	strh r0, [r4, 0x6]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _080814E2
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	bne _080814D0
	bl remove_some_task
	movs r0, 0x2
	strh r0, [r4]
	b _080814E2
	.align 2, 0
_080814C8: .4byte gUnknown_03004DC0
_080814CC: .4byte gUnknown_03004DE0
_080814D0:
	adds r0, r5, 0
	bl DestroyTask
	b _080814E2
_080814D8:
	bl dp12_8087EA4
	adds r0, r5, 0
	bl DestroyTask
_080814E2:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8081424

	thumb_func_start sub_80814E8
sub_80814E8: @ 80814E8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808150C @ =sub_8081424
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08081504
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_08081504:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808150C: .4byte sub_8081424
	thumb_func_end sub_80814E8

	thumb_func_start sub_8081510
sub_8081510: @ 8081510
	push {r4,lr}
	ldr r4, _08081530 @ =sub_80814E8
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08081528
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
_08081528:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081530: .4byte sub_80814E8
	thumb_func_end sub_8081510

	thumb_func_start sub_8081534
sub_8081534: @ 8081534
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r8, r0
	mov r9, r1
	adds r5, r2, 0
	adds r4, r3, 0
	ldr r6, [sp, 0x1C]
	ldr r0, [sp, 0x20]
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08081578 @ =sub_8081424
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _0808157C @ =gTasks + 0x8
	adds r1, r0, r1
	strh r5, [r1, 0x6]
	strh r4, [r1, 0x8]
	mov r0, r8
	strh r0, [r1, 0x2]
	mov r0, r9
	strh r0, [r1, 0x4]
	strh r6, [r1, 0xC]
	cmp r5, r4
	bge _08081580
	strh r7, [r1, 0xA]
	b _08081584
	.align 2, 0
_08081578: .4byte sub_8081424
_0808157C: .4byte gTasks + 0x8
_08081580:
	negs r0, r7
	strh r0, [r1, 0xA]
_08081584:
	adds r0, r2, 0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8081534

	thumb_func_start sub_8081594
sub_8081594: @ 8081594
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	bl sav1_get_flash_used_on_map
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	cmp r4, 0
	bne _080815AE
	movs r5, 0x1
_080815AE:
	ldr r1, _080815DC @ =gUnknown_0839ACDC
	lsls r0, 1
	adds r0, r1
	ldrh r2, [r0]
	lsls r0, r4, 1
	adds r0, r1
	ldrh r3, [r0]
	str r5, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0x78
	movs r1, 0x50
	bl sub_8081534
	bl sub_8081510
	bl ScriptContext2_Enable
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080815DC: .4byte gUnknown_0839ACDC
	thumb_func_end sub_8081594

	thumb_func_start sub_80815E0
sub_80815E0: @ 80815E0
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0808160E
	ldr r4, _08081614 @ =gUnknown_03004DE0
	ldr r1, _08081618 @ =gUnknown_0839ACDC
	lsls r0, 1
	adds r0, r1
	ldrh r3, [r0]
	adds r0, r4, 0
	movs r1, 0x78
	movs r2, 0x50
	bl sub_8081398
	movs r0, 0xF0
	lsls r0, 3
	adds r1, r4, r0
	movs r2, 0xF0
	lsls r2, 1
	adds r0, r4, 0
	bl CpuFastSet
_0808160E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081614: .4byte gUnknown_03004DE0
_08081618: .4byte gUnknown_0839ACDC
	thumb_func_end sub_80815E0

	thumb_func_start sub_808161C
sub_808161C: @ 808161C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	cmp r0, 0
	bne _0808162A
	movs r1, 0x1F
	b _08081630
_0808162A:
	movs r0, 0xF8
	lsls r0, 7
	adds r1, r0, 0
_08081630:
	mov r0, sp
	strh r1, [r0]
	movs r5, 0
	movs r4, 0xF0
	lsls r4, 16
_0808163A:
	lsrs r1, r4, 16
	mov r0, sp
	movs r2, 0x2
	bl LoadPalette
	movs r0, 0x80
	lsls r0, 9
	adds r4, r0
	adds r5, 0x1
	cmp r5, 0xF
	ble _0808163A
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_808161C

	thumb_func_start sub_8081658
sub_8081658: @ 8081658
	push {lr}
	lsls r0, 16
	ldr r2, _08081678 @ =REG_BLDALPHA
	ldrh r1, [r2]
	lsls r1, 24
	lsrs r3, r1, 24
	ldrh r1, [r2]
	lsrs r2, r1, 8
	cmp r0, 0
	beq _0808167C
	cmp r3, 0
	beq _08081686
	subs r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	b _08081686
	.align 2, 0
_08081678: .4byte REG_BLDALPHA
_0808167C:
	cmp r2, 0xF
	bhi _08081686
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_08081686:
	ldr r1, _0808169C @ =REG_BLDALPHA
	lsls r0, r2, 8
	orrs r0, r3
	strh r0, [r1]
	cmp r3, 0
	bne _080816A0
	cmp r2, 0x10
	bne _080816A0
	movs r0, 0x1
	b _080816A2
	.align 2, 0
_0808169C: .4byte REG_BLDALPHA
_080816A0:
	movs r0, 0
_080816A2:
	pop {r1}
	bx r1
	thumb_func_end sub_8081658

	thumb_func_start sub_80816A8
sub_80816A8: @ 80816A8
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080816D0 @ =gTasks + 0x8
	adds r7, r0, r1
	movs r1, 0
	ldrsh r0, [r7, r1]
	cmp r0, 0x7
	bls _080816C4
	b _08081892
_080816C4:
	lsls r0, 2
	ldr r1, _080816D4 @ =_080816D8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080816D0: .4byte gTasks + 0x8
_080816D4: .4byte _080816D8
	.align 2, 0
_080816D8:
	.4byte _080816F8
	.4byte _08081790
	.4byte _080817BC
	.4byte _080817D8
	.4byte _080817EE
	.4byte _08081852
	.4byte _08081818
	.4byte _08081826
_080816F8:
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	strh r0, [r7, 0xC]
	ldr r3, _0808176C @ =REG_BLDCNT
	ldrh r0, [r3]
	strh r0, [r7, 0xE]
	ldr r6, _08081770 @ =REG_BLDALPHA
	ldrh r0, [r6]
	strh r0, [r7, 0x10]
	ldr r5, _08081774 @ =REG_WININ
	ldrh r0, [r5]
	strh r0, [r7, 0x12]
	ldr r4, _08081778 @ =REG_WINOUT
	ldrh r0, [r4]
	strh r0, [r7, 0x14]
	ldrh r1, [r2]
	ldr r0, _0808177C @ =0x0000bfff
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08081780 @ =gUnknown_081E29E8
	ldrh r0, [r3]
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r3]
	ldr r2, _08081784 @ =0x0000070c
	adds r0, r2, 0
	strh r0, [r6]
	movs r0, 0x3F
	strh r0, [r5]
	movs r0, 0x1E
	strh r0, [r4]
	ldr r4, _08081788 @ =gUnknown_03004DE0
	movs r0, 0x4
	ldrsh r1, [r7, r0]
	movs r0, 0x6
	ldrsh r2, [r7, r0]
	adds r0, r4, 0
	movs r3, 0x1
	bl sub_8081398
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r4, r2
	movs r2, 0xF0
	lsls r2, 1
	adds r0, r4, 0
	bl CpuFastSet
	ldr r2, _0808178C @ =gUnknown_0839ACEC
	ldr r0, [r2]
	ldr r1, [r2, 0x4]
	ldr r2, [r2, 0x8]
	bl sub_80895F8
	movs r0, 0x1
	strh r0, [r7]
	b _08081892
	.align 2, 0
_0808176C: .4byte REG_BLDCNT
_08081770: .4byte REG_BLDALPHA
_08081774: .4byte REG_WININ
_08081778: .4byte REG_WINOUT
_0808177C: .4byte 0x0000bfff
_08081780: .4byte gUnknown_081E29E8
_08081784: .4byte 0x0000070c
_08081788: .4byte gUnknown_03004DE0
_0808178C: .4byte gUnknown_0839ACEC
_08081790:
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuFillWindowRectWithBlankTile
	ldrb r0, [r7, 0x2]
	bl sub_808161C
	movs r1, 0x4
	ldrsh r0, [r7, r1]
	movs r2, 0x6
	ldrsh r1, [r7, r2]
	movs r2, 0x1
	str r2, [sp]
	movs r4, 0x2
	str r4, [sp, 0x4]
	movs r3, 0xA0
	bl sub_8081534
	strh r4, [r7]
	b _08081892
_080817BC:
	ldr r0, _080817D4 @ =sub_8081424
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08081892
	bl EnableBothScriptContexts
	movs r0, 0x3
	strh r0, [r7]
	b _08081892
	.align 2, 0
_080817D4: .4byte sub_8081424
_080817D8:
	bl InstallCameraPanAheadCallback
	movs r0, 0
	bl SetCameraPanningCallback
	movs r0, 0
	strh r0, [r7, 0xA]
	movs r0, 0x4
	strh r0, [r7, 0x8]
	strh r0, [r7]
	b _08081892
_080817EE:
	ldrh r0, [r7, 0x8]
	subs r0, 0x1
	strh r0, [r7, 0x8]
	lsls r0, 16
	cmp r0, 0
	bne _08081892
	movs r0, 0x4
	strh r0, [r7, 0x8]
	ldrh r0, [r7, 0xA]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r7, 0xA]
	movs r1, 0x4
	negs r1, r1
	cmp r0, 0
	beq _08081810
	movs r1, 0x4
_08081810:
	movs r0, 0
	bl SetCameraPanning
	b _08081892
_08081818:
	bl InstallCameraPanAheadCallback
	movs r0, 0x8
	strh r0, [r7, 0x8]
	movs r0, 0x7
	strh r0, [r7]
	b _08081892
_08081826:
	ldrh r0, [r7, 0x8]
	subs r0, 0x1
	strh r0, [r7, 0x8]
	lsls r0, 16
	cmp r0, 0
	bne _08081892
	movs r0, 0x8
	strh r0, [r7, 0x8]
	ldrh r0, [r7, 0xA]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r7, 0xA]
	ldrh r0, [r7, 0xA]
	bl sub_8081658
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08081892
	movs r0, 0x5
	strh r0, [r7]
	b _08081892
_08081852:
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r0, _0808189C @ =gWindowConfig_81E6CE4
	bl LoadFontDefaultPalette
	ldr r1, _080818A0 @ =REG_WIN0H
	movs r0, 0xFF
	strh r0, [r1]
	subs r1, 0x40
	ldrh r0, [r7, 0xC]
	strh r0, [r1]
	adds r1, 0x50
	ldrh r0, [r7, 0xE]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r7, 0x10]
	strh r0, [r1]
	subs r1, 0xA
	ldrh r0, [r7, 0x12]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r7, 0x14]
	strh r0, [r1]
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_08081892:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808189C: .4byte gWindowConfig_81E6CE4
_080818A0: .4byte REG_WIN0H
	thumb_func_end sub_80816A8

	thumb_func_start sub_80818A4
sub_80818A4: @ 80818A4
	push {lr}
	ldr r0, _080818CC @ =sub_80816A8
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080818D0 @ =gTasks + 0x8
	adds r1, r0
	ldr r0, _080818D4 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0
	bne _080818D8
	strh r0, [r1, 0x2]
	movs r0, 0x68
	b _080818F0
	.align 2, 0
_080818CC: .4byte sub_80816A8
_080818D0: .4byte gTasks + 0x8
_080818D4: .4byte gScriptResult
_080818D8:
	cmp r0, 0x1
	bne _080818E2
	strh r0, [r1, 0x2]
	movs r0, 0x68
	b _080818F0
_080818E2:
	cmp r0, 0x2
	bne _080818EA
	movs r0, 0
	b _080818EC
_080818EA:
	movs r0, 0x1
_080818EC:
	strh r0, [r1, 0x2]
	movs r0, 0x78
_080818F0:
	strh r0, [r1, 0x4]
	movs r0, 0x50
	strh r0, [r1, 0x6]
	pop {r0}
	bx r0
	thumb_func_end sub_80818A4

	thumb_func_start sub_80818FC
sub_80818FC: @ 80818FC
	push {lr}
	ldr r0, _0808191C @ =sub_80816A8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08081920 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x6
	strh r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_0808191C: .4byte sub_80816A8
_08081920: .4byte gTasks
	thumb_func_end sub_80818FC

	thumb_func_start sub_8081924
sub_8081924: @ 8081924
	push {lr}
	bl sub_8054044
	ldr r0, _08081938 @ =task50_0807F0C8
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08081938: .4byte task50_0807F0C8
	thumb_func_end sub_8081924

	thumb_func_start task50_0807F0C8
task50_0807F0C8: @ 808193C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8054034
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08081958
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_08081958:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end task50_0807F0C8

	.align 2, 0 @ Don't pad with nop.
