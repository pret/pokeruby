	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

.equiv ewram_1f000, 0x0201f000

	thumb_func_start sub_81012A0
sub_81012A0: @ 81012A0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r2, _0810130C @ =ewram_1f000
	ldr r3, _08101310 @ =gUnknown_020391B4
	ldr r0, _08101314 @ =gUnknown_02039234
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r3
	ldrb r1, [r0]
	ldr r0, [r2, 0x4]
	adds r0, r1
	ldrb r0, [r0]
	lsrs r7, r0, 4
	movs r6, 0xF
	ands r6, r0
	movs r5, 0
	ldr r0, _08101318 @ =gSaveBlock1
	mov r8, r0
	mov r9, r3
_081012CA:
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 3
	mov r2, r8
	adds r1, r0, r2
	ldr r2, _0810131C @ =0x00000c24
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, r7
	bne _08101328
	ldr r2, _08101320 @ =0x00000c26
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, r6
	bne _08101328
	ldr r0, _08101324 @ =0x00000c34
	adds r4, r1, r0
	ldrh r0, [r4]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _08101328
	ldr r0, _08101314 @ =gUnknown_02039234
	ldrb r0, [r0]
	lsls r0, 3
	add r0, r9
	ldrh r1, [r4]
	strh r1, [r0, 0x4]
	b _08101332
	.align 2, 0
_0810130C: .4byte ewram_1f000
_08101310: .4byte gUnknown_020391B4
_08101314: .4byte gUnknown_02039234
_08101318: .4byte gSaveBlock1
_0810131C: .4byte 0x00000c24
_08101320: .4byte 0x00000c26
_08101324: .4byte 0x00000c34
_08101328:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3F
	bls _081012CA
_08101332:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81012A0

	thumb_func_start sub_8101340
sub_8101340: @ 8101340
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0
	b _081013A2
_0810134A:
	ldr r0, [r0]
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, 0
	beq _0810139C
	ldr r0, _08101390 @ =gDecorations
	ldrb r2, [r1]
	lsls r1, r2, 5
	adds r1, r0
	ldrb r0, [r1, 0x11]
	cmp r0, 0x4
	bne _0810139C
	ldr r5, _08101394 @ =gUnknown_020391B4
	adds r0, r2, 0
	adds r1, r5, 0
	bl sub_8101118
	lsls r1, r6, 24
	lsrs r1, 24
	adds r0, r7, 0
	adds r2, r5, 0
	bl sub_8101200
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bne _0810139C
	strb r6, [r5]
	bl sub_81012A0
	ldr r0, _08101398 @ =gUnknown_02039234
	strb r4, [r0]
	movs r0, 0x1
	b _081013AC
	.align 2, 0
_08101390: .4byte gDecorations
_08101394: .4byte gUnknown_020391B4
_08101398: .4byte gUnknown_02039234
_0810139C:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_081013A2:
	ldr r0, _081013B4 @ =ewram_1f000
	ldrb r1, [r0, 0x8]
	cmp r6, r1
	bcc _0810134A
	movs r0, 0
_081013AC:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081013B4: .4byte ewram_1f000
	thumb_func_end sub_8101340

	thumb_func_start sub_81013B8
sub_81013B8: @ 81013B8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	movs r4, 0
	ldr r7, _08101450 @ =ewram_1f000
	ldrb r0, [r7, 0x8]
	cmp r4, r0
	bcs _0810143E
	adds r6, r7, 0
	ldr r5, _08101454 @ =gUnknown_02039234
_081013EA:
	ldr r0, [r6]
	adds r0, r4
	ldrb r1, [r0]
	ldr r0, [r6, 0x4]
	adds r0, r4
	ldrb r0, [r0]
	lsrs r3, r0, 4
	movs r2, 0xF
	ands r2, r0
	cmp r1, 0
	beq _08101432
	ldr r0, _08101458 @ =gDecorations
	lsls r1, 5
	adds r1, r0
	ldrb r0, [r1, 0x11]
	cmp r0, 0x4
	bne _08101432
	ldr r0, [sp]
	cmp r0, r3
	bhi _08101432
	cmp r10, r2
	bhi _08101432
	cmp r9, r3
	bcc _08101432
	cmp r8, r2
	bcc _08101432
	ldr r0, _0810145C @ =gUnknown_020391B4
	ldrb r1, [r5]
	lsls r1, 3
	adds r1, r0
	strb r4, [r1]
	bl sub_81012A0
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
_08101432:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r7, 0x8]
	cmp r4, r0
	bcc _081013EA
_0810143E:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08101450: .4byte ewram_1f000
_08101454: .4byte gUnknown_02039234
_08101458: .4byte gDecorations
_0810145C: .4byte gUnknown_020391B4
	thumb_func_end sub_81013B8

	thumb_func_start sub_8101460
sub_8101460: @ 8101460
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r4, _081014B8 @ =gUnknown_02039234
	movs r0, 0
	strb r0, [r4]
	adds r0, r6, 0
	bl sub_8101340
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08101504
	movs r5, 0
	ldr r0, _081014BC @ =ewram_1f000
	ldrb r1, [r0, 0x8]
	cmp r5, r1
	bcs _081014D2
	adds r7, r4, 0
_08101486:
	ldr r0, [r0]
	adds r0, r5
	ldrb r1, [r0]
	cmp r1, 0
	beq _081014C4
	ldr r4, _081014C0 @ =gUnknown_020391B4
	adds r0, r1, 0
	adds r1, r4, 0
	bl sub_8101118
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_8101200
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081014C4
	strb r5, [r4]
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
	b _081014D2
	.align 2, 0
_081014B8: .4byte gUnknown_02039234
_081014BC: .4byte ewram_1f000
_081014C0: .4byte gUnknown_020391B4
_081014C4:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0810150C @ =ewram_1f000
	ldrb r1, [r0, 0x8]
	cmp r5, r1
	bcc _08101486
_081014D2:
	ldr r0, _08101510 @ =gUnknown_02039234
	ldrb r0, [r0]
	cmp r0, 0
	beq _08101504
	ldr r0, _0810150C @ =ewram_1f000
	ldr r2, _08101514 @ =gUnknown_020391B4
	ldrb r1, [r2]
	ldr r0, [r0, 0x4]
	adds r0, r1
	ldrb r1, [r0]
	lsrs r0, r1, 4
	movs r3, 0xF
	ands r3, r1
	ldrb r1, [r2, 0x2]
	subs r1, r3, r1
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r2, 0x1]
	adds r2, r0
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	bl sub_81013B8
_08101504:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810150C: .4byte ewram_1f000
_08101510: .4byte gUnknown_02039234
_08101514: .4byte gUnknown_020391B4
	thumb_func_end sub_8101460

	thumb_func_start sub_8101518
sub_8101518: @ 8101518
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _08101538 @ =gUnknown_083EC9CC
	adds r0, r4, 0
	bl sub_80F914C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101538: .4byte gUnknown_083EC9CC
	thumb_func_end sub_8101518

	thumb_func_start sub_810153C
sub_810153C: @ 810153C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r1, _08101564 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xC]
	ldr r1, _08101568 @ =sub_8100C88
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101564: .4byte gTasks
_08101568: .4byte sub_8100C88
	thumb_func_end sub_810153C

	thumb_func_start sub_810156C
sub_810156C: @ 810156C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _0810158C @ =gUnknown_083EC9D4
	adds r0, r4, 0
	bl sub_80F914C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810158C: .4byte gUnknown_083EC9D4
	thumb_func_end sub_810156C

	thumb_func_start sub_8101590
sub_8101590: @ 8101590
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl sub_81015B0
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8101590

	thumb_func_start sub_81015B0
sub_81015B0: @ 81015B0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r1, _081015D8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xC]
	ldr r1, _081015DC @ =sub_81015E0
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081015D8: .4byte gTasks
_081015DC: .4byte sub_81015E0
	thumb_func_end sub_81015B0

	thumb_func_start sub_81015E0
sub_81015E0: @ 81015E0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08101600 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08101604
	cmp r0, 0x1
	beq _08101620
	b _08101636
	.align 2, 0
_08101600: .4byte gTasks
_08101604:
	ldr r0, _0810161C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08101636
	adds r0, r4, 0
	bl sub_80FF114
	movs r0, 0x1
	strh r0, [r5, 0xC]
	b _08101636
	.align 2, 0
_0810161C: .4byte gPaletteFade
_08101620:
	bl sub_81016F4
	ldr r0, _0810163C @ =gUnknown_0300485C
	ldr r1, _08101640 @ =sub_8101678
	str r1, [r0]
	ldr r0, _08101644 @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_08101636:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810163C: .4byte gUnknown_0300485C
_08101640: .4byte sub_8101678
_08101644: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_81015E0

	thumb_func_start sub_8101648
sub_8101648: @ 8101648
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08101668
	ldr r0, _08101670 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08101674 @ =Task_DecorationPCProcessMenuInput
	str r0, [r1]
_08101668:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101670: .4byte gTasks
_08101674: .4byte Task_DecorationPCProcessMenuInput
	thumb_func_end sub_8101648

	thumb_func_start sub_8101678
sub_8101678: @ 8101678
	push {lr}
	bl pal_fill_black
	bl MenuDisplayMessageBox
	bl sub_80FE220
	ldr r0, _08101694 @ =sub_8101648
	movs r1, 0x8
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08101694: .4byte sub_8101648
	thumb_func_end sub_8101678

	thumb_func_start sub_8101698
sub_8101698: @ 8101698
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	movs r1, 0x1F
	ands r0, r1
	strh r0, [r2, 0x2E]
	cmp r0, 0xF
	ble _081016B8
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _081016C4
_081016B8:
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_081016C4:
	pop {r0}
	bx r0
	thumb_func_end sub_8101698

	thumb_func_start sub_81016C8
sub_81016C8: @ 81016C8
	push {lr}
	ldr r0, _081016DC @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _081016E4
	ldr r0, _081016E0 @ =gUnknown_083ECA5C
	bl LoadSpritePalette
	b _081016EA
	.align 2, 0
_081016DC: .4byte gSaveBlock2
_081016E0: .4byte gUnknown_083ECA5C
_081016E4:
	ldr r0, _081016F0 @ =gUnknown_083ECA64
	bl LoadSpritePalette
_081016EA:
	pop {r0}
	bx r0
	.align 2, 0
_081016F0: .4byte gUnknown_083ECA64
	thumb_func_end sub_81016C8

	thumb_func_start sub_81016F4
sub_81016F4: @ 81016F4
	push {lr}
	movs r0, 0x8
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	thumb_func_end sub_81016F4

	thumb_func_start sub_8101700
sub_8101700: @ 8101700
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_81341D4
	lsls r0, 24
	cmp r0, 0
	bne _08101728
	ldr r1, _08101720 @ =gSecretBaseText_NoDecors
	ldr r2, _08101724 @ =sub_80FE428
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	b _08101742
	.align 2, 0
_08101720: .4byte gSecretBaseText_NoDecors
_08101724: .4byte sub_80FE428
_08101728:
	ldr r1, _08101748 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	movs r1, 0x1
	strh r1, [r0, 0x1E]
	ldr r0, _0810174C @ =gUnknown_020388F6
	strb r2, [r0]
	adds r0, r4, 0
	bl sub_80FE5AC
_08101742:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101748: .4byte gTasks
_0810174C: .4byte gUnknown_020388F6
	thumb_func_end sub_8101700

	thumb_func_start unref_sub_8101750
unref_sub_8101750: @ 8101750
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_81341D4
	lsls r0, 24
	cmp r0, 0
	bne _08101778
	ldr r1, _08101770 @ =gSecretBaseText_NoDecors
	ldr r2, _08101774 @ =sub_80FE428
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	b _08101792
	.align 2, 0
_08101770: .4byte gSecretBaseText_NoDecors
_08101774: .4byte sub_80FE428
_08101778:
	ldr r1, _08101798 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	movs r1, 0x2
	strh r1, [r0, 0x1E]
	ldr r0, _0810179C @ =gUnknown_020388F6
	strb r2, [r0]
	adds r0, r4, 0
	bl sub_80FE5AC
_08101792:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101798: .4byte gTasks
_0810179C: .4byte gUnknown_020388F6
	thumb_func_end unref_sub_8101750

	thumb_func_start sub_81017A0
sub_81017A0: @ 81017A0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_80FEF74
	bl sub_80FED1C
	bl sub_80FEFA4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08101808
	ldr r0, _081017EC @ =gStringVar1
	ldr r1, _081017F0 @ =gUnknown_020388F5
	ldrb r2, [r1]
	ldr r1, _081017F4 @ =gUnknown_020388D0
	ldr r1, [r1]
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 5
	ldr r2, _081017F8 @ =gDecorations + 0x1
	adds r1, r2
	bl StringCopy
	ldr r4, _081017FC @ =gStringVar4
	ldr r1, _08101800 @ =gSecretBaseText_WillBeDiscarded
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _08101804 @ =sub_8101824
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	b _08101814
	.align 2, 0
_081017EC: .4byte gStringVar1
_081017F0: .4byte gUnknown_020388F5
_081017F4: .4byte gUnknown_020388D0
_081017F8: .4byte gDecorations + 0x1
_081017FC: .4byte gStringVar4
_08101800: .4byte gSecretBaseText_WillBeDiscarded
_08101804: .4byte sub_8101824
_08101808:
	ldr r1, _0810181C @ =gSecretBaseText_DecorInUse
	ldr r2, _08101820 @ =sub_80FEFF4
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_08101814:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810181C: .4byte gSecretBaseText_DecorInUse
_08101820: .4byte sub_80FEFF4
	thumb_func_end sub_81017A0

	thumb_func_start sub_8101824
sub_8101824: @ 8101824
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _08101844 @ =gUnknown_083ECAA0
	adds r0, r4, 0
	bl sub_80F914C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101844: .4byte gUnknown_083ECAA0
	thumb_func_end sub_8101824

	thumb_func_start sub_8101848
sub_8101848: @ 8101848
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1A
	movs r3, 0xE
	bl MenuZeroFillWindowRect
	ldr r6, _08101890 @ =gUnknown_020388F5
	ldrb r1, [r6]
	ldr r5, _08101894 @ =gUnknown_020388D0
	ldr r0, [r5]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8109A30
	ldrb r1, [r6]
	ldr r0, [r5]
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	adds r0, r4, 0
	bl sub_80FF098
	ldr r1, _08101898 @ =gSecretBaseText_DecorThrownAway
	ldr r2, _0810189C @ =sub_80FEFF4
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08101890: .4byte gUnknown_020388F5
_08101894: .4byte gUnknown_020388D0
_08101898: .4byte gSecretBaseText_DecorThrownAway
_0810189C: .4byte sub_80FEFF4
	thumb_func_end sub_8101848

	.align 2, 0 @ Don't pad with nop.
