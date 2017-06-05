	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

.equiv ewram_1f000, 0x0201f000

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
