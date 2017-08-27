    .include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start unref_sub_812B464
unref_sub_812B464: @ 812B464
	bx lr
	thumb_func_end unref_sub_812B464

	thumb_func_start SetBankFuncToSafariBufferRunCommand
SetBankFuncToSafariBufferRunCommand: @ 812B468
	ldr r1, _0812B478 @ =gBattleBankFunc
	ldr r0, _0812B47C @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812B480 @ =SafariBufferRunCommand
	str r1, [r0]
	bx lr
	.align 2, 0
_0812B478: .4byte gBattleBankFunc
_0812B47C: .4byte gActiveBank
_0812B480: .4byte SafariBufferRunCommand
	thumb_func_end SetBankFuncToSafariBufferRunCommand

	thumb_func_start SafariBufferRunCommand
SafariBufferRunCommand: @ 812B484
	push {lr}
	ldr r2, _0812B4B8 @ =gBattleExecBuffer
	ldr r1, _0812B4BC @ =gBitTable
	ldr r0, _0812B4C0 @ =gActiveBank
	ldrb r3, [r0]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0812B4D0
	ldr r0, _0812B4C4 @ =gBattleBufferA
	lsls r1, r3, 9
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x38
	bhi _0812B4CC
	ldr r0, _0812B4C8 @ =gSafariBufferCommands
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _0812B4D0
	.align 2, 0
_0812B4B8: .4byte gBattleExecBuffer
_0812B4BC: .4byte gBitTable
_0812B4C0: .4byte gActiveBank
_0812B4C4: .4byte gBattleBufferA
_0812B4C8: .4byte gSafariBufferCommands
_0812B4CC:
	bl SafariBufferExecCompleted
_0812B4D0:
	pop {r0}
	bx r0
	thumb_func_end SafariBufferRunCommand

	thumb_func_start bx_battle_menu_t6_2
bx_battle_menu_t6_2: @ 812B4D4
	push {r4,r5,lr}
	ldr r0, _0812B508 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _0812B546
	movs r0, 0x5
	bl PlaySE
	bl DestroyMenuCursor
	ldr r1, _0812B50C @ =gActionSelectionCursor
	ldr r0, _0812B510 @ =gActiveBank
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0812B524
	cmp r0, 0x1
	bgt _0812B514
	cmp r0, 0
	beq _0812B51E
	b _0812B540
	.align 2, 0
_0812B508: .4byte gMain
_0812B50C: .4byte gActionSelectionCursor
_0812B510: .4byte gActiveBank
_0812B514:
	cmp r0, 0x2
	beq _0812B52A
	cmp r0, 0x3
	beq _0812B536
	b _0812B540
_0812B51E:
	movs r0, 0x1
	movs r1, 0x5
	b _0812B52E
_0812B524:
	movs r0, 0x1
	movs r1, 0x6
	b _0812B52E
_0812B52A:
	movs r0, 0x1
	movs r1, 0x7
_0812B52E:
	movs r2, 0
	bl Emitcmd33
	b _0812B540
_0812B536:
	movs r0, 0x1
	movs r1, 0x8
	movs r2, 0
	bl Emitcmd33
_0812B540:
	bl SafariBufferExecCompleted
	b _0812B64E
_0812B546:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0812B584
	ldr r5, _0812B57C @ =gActionSelectionCursor
	ldr r4, _0812B580 @ =gActiveBank
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _0812B64E
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl nullsub_8
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x1
	b _0812B5F2
	.align 2, 0
_0812B57C: .4byte gActionSelectionCursor
_0812B580: .4byte gActiveBank
_0812B584:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0812B5C0
	ldr r5, _0812B5B8 @ =gActionSelectionCursor
	ldr r4, _0812B5BC @ =gActiveBank
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _0812B64E
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl nullsub_8
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x1
	b _0812B5F2
	.align 2, 0
_0812B5B8: .4byte gActionSelectionCursor
_0812B5BC: .4byte gActiveBank
_0812B5C0:
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0812B60C
	ldr r5, _0812B604 @ =gActionSelectionCursor
	ldr r4, _0812B608 @ =gActiveBank
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0812B64E
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl nullsub_8
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x2
_0812B5F2:
	eors r0, r2
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0
	bl sub_802E3E4
	b _0812B64E
	.align 2, 0
_0812B604: .4byte gActionSelectionCursor
_0812B608: .4byte gActiveBank
_0812B60C:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0812B64E
	ldr r5, _0812B654 @ =gActionSelectionCursor
	ldr r4, _0812B658 @ =gActiveBank
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0812B64E
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl nullsub_8
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x2
	eors r0, r2
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0
	bl sub_802E3E4
_0812B64E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B654: .4byte gActionSelectionCursor
_0812B658: .4byte gActiveBank
	thumb_func_end bx_battle_menu_t6_2

	thumb_func_start sub_812B65C
sub_812B65C: @ 812B65C
	push {lr}
	ldr r2, _0812B684 @ =gSprites
	ldr r1, _0812B688 @ =gObjectBankIDs
	ldr r0, _0812B68C @ =gActiveBank
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0812B690 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _0812B680
	bl SafariBufferExecCompleted
_0812B680:
	pop {r0}
	bx r0
	.align 2, 0
_0812B684: .4byte gSprites
_0812B688: .4byte gObjectBankIDs
_0812B68C: .4byte gActiveBank
_0812B690: .4byte SpriteCallbackDummy
	thumb_func_end sub_812B65C

	thumb_func_start sub_812B694
sub_812B694: @ 812B694
	push {lr}
	ldr r0, _0812B6A8 @ =gUnknown_03004210
	ldrh r0, [r0, 0x16]
	cmp r0, 0
	bne _0812B6A2
	bl SafariBufferExecCompleted
_0812B6A2:
	pop {r0}
	bx r0
	.align 2, 0
_0812B6A8: .4byte gUnknown_03004210
	thumb_func_end sub_812B694

	thumb_func_start sub_812B6AC
sub_812B6AC: @ 812B6AC
	push {lr}
	ldr r0, _0812B6DC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0812B6D6
	ldr r2, _0812B6E0 @ =gMain
	ldr r0, _0812B6E4 @ =0x0000043d
	adds r3, r2, r0
	ldrb r1, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldr r0, _0812B6E8 @ =gPreBattleCallback1
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, [r2, 0x8]
	bl SetMainCallback2
_0812B6D6:
	pop {r0}
	bx r0
	.align 2, 0
_0812B6DC: .4byte gPaletteFade
_0812B6E0: .4byte gMain
_0812B6E4: .4byte 0x0000043d
_0812B6E8: .4byte gPreBattleCallback1
	thumb_func_end sub_812B6AC

	thumb_func_start bx_wait_t6
bx_wait_t6: @ 812B6EC
	push {lr}
	ldr r0, _0812B718 @ =gDoingBattleAnim
	ldrb r0, [r0]
	cmp r0, 0
	beq _0812B70E
	ldr r0, _0812B71C @ =gActiveBank
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0812B720 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0812B712
_0812B70E:
	bl SafariBufferExecCompleted
_0812B712:
	pop {r0}
	bx r0
	.align 2, 0
_0812B718: .4byte gDoingBattleAnim
_0812B71C: .4byte gActiveBank
_0812B720: .4byte 0x02017810
	thumb_func_end bx_wait_t6

	thumb_func_start sub_812B724
sub_812B724: @ 812B724
	push {lr}
	ldr r0, _0812B748 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0812B744
	ldr r1, _0812B74C @ =gBattleBankFunc
	ldr r0, _0812B750 @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812B754 @ =sub_812B758
	str r1, [r0]
	bl sub_810BADC
_0812B744:
	pop {r0}
	bx r0
	.align 2, 0
_0812B748: .4byte gPaletteFade
_0812B74C: .4byte gBattleBankFunc
_0812B750: .4byte gActiveBank
_0812B754: .4byte sub_812B758
	thumb_func_end sub_812B724

	thumb_func_start sub_812B758
sub_812B758: @ 812B758
	push {lr}
	ldr r0, _0812B784 @ =gMain
	ldr r1, [r0, 0x4]
	ldr r0, _0812B788 @ =sub_800F808
	cmp r1, r0
	bne _0812B77E
	ldr r0, _0812B78C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0812B77E
	ldr r0, _0812B790 @ =gScriptItemId
	ldrh r1, [r0]
	movs r0, 0x1
	bl Emitcmd35
	bl SafariBufferExecCompleted
_0812B77E:
	pop {r0}
	bx r0
	.align 2, 0
_0812B784: .4byte gMain
_0812B788: .4byte sub_800F808
_0812B78C: .4byte gPaletteFade
_0812B790: .4byte gScriptItemId
	thumb_func_end sub_812B758

	thumb_func_start sub_812B794
sub_812B794: @ 812B794
	push {lr}
	ldr r0, _0812B7B8 @ =gActiveBank
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0812B7BC @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _0812B7B2
	bl SafariBufferExecCompleted
_0812B7B2:
	pop {r0}
	bx r0
	.align 2, 0
_0812B7B8: .4byte gActiveBank
_0812B7BC: .4byte 0x02017810
	thumb_func_end sub_812B794

	thumb_func_start SafariBufferExecCompleted
SafariBufferExecCompleted: @ 812B7C0
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _0812B800 @ =gBattleBankFunc
	ldr r4, _0812B804 @ =gActiveBank
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812B808 @ =SafariBufferRunCommand
	str r1, [r0]
	ldr r0, _0812B80C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0812B814
	bl GetMultiplayerId
	mov r1, sp
	strb r0, [r1]
	movs r0, 0x2
	movs r1, 0x4
	mov r2, sp
	bl dp01_prepare_buffer_wireless_probably
	ldr r1, _0812B810 @ =gBattleBufferA
	ldrb r0, [r4]
	lsls r0, 9
	adds r0, r1
	movs r1, 0x38
	strb r1, [r0]
	b _0812B826
	.align 2, 0
_0812B800: .4byte gBattleBankFunc
_0812B804: .4byte gActiveBank
_0812B808: .4byte SafariBufferRunCommand
_0812B80C: .4byte gBattleTypeFlags
_0812B810: .4byte gBattleBufferA
_0812B814:
	ldr r2, _0812B830 @ =gBattleExecBuffer
	ldr r1, _0812B834 @ =gBitTable
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
_0812B826:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812B830: .4byte gBattleExecBuffer
_0812B834: .4byte gBitTable
	thumb_func_end SafariBufferExecCompleted

	thumb_func_start unref_sub_812B838
unref_sub_812B838: @ 812B838
	push {lr}
	ldr r0, _0812B85C @ =gActiveBank
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0812B860 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0812B856
	bl SafariBufferExecCompleted
_0812B856:
	pop {r0}
	bx r0
	.align 2, 0
_0812B85C: .4byte gActiveBank
_0812B860: .4byte 0x02017810
	thumb_func_end unref_sub_812B838

	thumb_func_start SafariHandleGetAttributes
SafariHandleGetAttributes: @ 812B864
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandleGetAttributes

	thumb_func_start SafariHandlecmd1
SafariHandlecmd1: @ 812B870
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandlecmd1

	thumb_func_start SafariHandleSetAttributes
SafariHandleSetAttributes: @ 812B87C
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandleSetAttributes

	thumb_func_start SafariHandlecmd3
SafariHandlecmd3: @ 812B888
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandlecmd3

	thumb_func_start SafariHandleLoadPokeSprite
SafariHandleLoadPokeSprite: @ 812B894
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandleLoadPokeSprite

	thumb_func_start SafariHandleSendOutPoke
SafariHandleSendOutPoke: @ 812B8A0
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandleSendOutPoke

	thumb_func_start SafariHandleReturnPokeToBall
SafariHandleReturnPokeToBall: @ 812B8AC
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandleReturnPokeToBall

	thumb_func_start SafariHandleTrainerThrow
SafariHandleTrainerThrow: @ 812B8B8
	push {r4-r6,lr}
	ldr r4, _0812B96C @ =gSaveBlock2
	ldrb r0, [r4, 0x8]
	ldr r5, _0812B970 @ =gActiveBank
	ldrb r1, [r5]
	bl LoadPlayerTrainerBankSprite
	ldrb r6, [r4, 0x8]
	ldrb r0, [r5]
	bl GetBankIdentity
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl GetMonSpriteTemplate_803C5A0
	ldr r0, _0812B974 @ =gUnknown_02024E8C
	ldr r2, _0812B978 @ =gTrainerBackPicCoords
	ldrb r1, [r4, 0x8]
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1]
	movs r2, 0x8
	subs r2, r1
	lsls r2, 18
	movs r1, 0xA0
	lsls r1, 15
	adds r2, r1
	asrs r2, 16
	movs r1, 0x50
	movs r3, 0x1E
	bl CreateSprite
	ldr r6, _0812B97C @ =gObjectBankIDs
	ldrb r1, [r5]
	adds r1, r6
	strb r0, [r1]
	ldr r4, _0812B980 @ =gSprites
	ldrb r3, [r5]
	adds r0, r3, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xF0
	strh r1, [r0, 0x24]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _0812B984 @ =0x0000fffe
	strh r1, [r0, 0x2E]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _0812B988 @ =sub_80313A0
	str r1, [r0]
	ldr r1, _0812B98C @ =gBattleBankFunc
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812B990 @ =sub_812B65C
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812B96C: .4byte gSaveBlock2
_0812B970: .4byte gActiveBank
_0812B974: .4byte gUnknown_02024E8C
_0812B978: .4byte gTrainerBackPicCoords
_0812B97C: .4byte gObjectBankIDs
_0812B980: .4byte gSprites
_0812B984: .4byte 0x0000fffe
_0812B988: .4byte sub_80313A0
_0812B98C: .4byte gBattleBankFunc
_0812B990: .4byte sub_812B65C
	thumb_func_end SafariHandleTrainerThrow

	thumb_func_start SafariHandleTrainerSlide
SafariHandleTrainerSlide: @ 812B994
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandleTrainerSlide

	thumb_func_start SafariHandleTrainerSlideBack
SafariHandleTrainerSlideBack: @ 812B9A0
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandleTrainerSlideBack

	thumb_func_start SafariHandlecmd10
SafariHandlecmd10: @ 812B9AC
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandlecmd10

	thumb_func_start SafariHandlecmd11
SafariHandlecmd11: @ 812B9B8
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandlecmd11

	thumb_func_start SafariHandlecmd12
SafariHandlecmd12: @ 812B9C4
	push {r4,r5,lr}
	ldr r1, _0812BA00 @ =0x02017840
	movs r0, 0x4
	strb r0, [r1, 0x8]
	ldr r1, _0812BA04 @ =gDoingBattleAnim
	movs r0, 0x1
	strb r0, [r1]
	ldr r5, _0812BA08 @ =gActiveBank
	ldrb r4, [r5]
	movs r0, 0x1
	bl GetBankByPlayerAI
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r4, 0
	movs r3, 0x4
	bl move_anim_start_t4
	ldr r1, _0812BA0C @ =gBattleBankFunc
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812BA10 @ =bx_wait_t6
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812BA00: .4byte 0x02017840
_0812BA04: .4byte gDoingBattleAnim
_0812BA08: .4byte gActiveBank
_0812BA0C: .4byte gBattleBankFunc
_0812BA10: .4byte bx_wait_t6
	thumb_func_end SafariHandlecmd12

	thumb_func_start SafariHandleBallThrow
SafariHandleBallThrow: @ 812BA14
	push {r4,r5,lr}
	ldr r1, _0812BA58 @ =gBattleBufferA
	ldr r5, _0812BA5C @ =gActiveBank
	ldrb r0, [r5]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r1, [r0]
	ldr r0, _0812BA60 @ =0x02017840
	strb r1, [r0, 0x8]
	ldr r1, _0812BA64 @ =gDoingBattleAnim
	movs r0, 0x1
	strb r0, [r1]
	ldrb r4, [r5]
	movs r0, 0x1
	bl GetBankByPlayerAI
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r4, 0
	movs r3, 0x4
	bl move_anim_start_t4
	ldr r1, _0812BA68 @ =gBattleBankFunc
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812BA6C @ =bx_wait_t6
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812BA58: .4byte gBattleBufferA
_0812BA5C: .4byte gActiveBank
_0812BA60: .4byte 0x02017840
_0812BA64: .4byte gDoingBattleAnim
_0812BA68: .4byte gBattleBankFunc
_0812BA6C: .4byte bx_wait_t6
	thumb_func_end SafariHandleBallThrow

	thumb_func_start SafariHandlePuase
SafariHandlePuase: @ 812BA70
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandlePuase

	thumb_func_start SafariHandleMoveAnimation
SafariHandleMoveAnimation: @ 812BA7C
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandleMoveAnimation

	thumb_func_start SafariHandlePrintString
SafariHandlePrintString: @ 812BA88
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0812BACC @ =gUnknown_030042A4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0812BAD0 @ =gUnknown_030042A0
	strh r1, [r0]
	ldr r4, _0812BAD4 @ =gActiveBank
	ldrb r0, [r4]
	lsls r0, 9
	ldr r1, _0812BAD8 @ =gUnknown_02023A62
	adds r0, r1
	ldrh r0, [r0]
	bl BufferStringBattle
	ldr r0, _0812BADC @ =gUnknown_03004210
	ldr r1, _0812BAE0 @ =gDisplayedStringBattle
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _0812BAE4 @ =gBattleBankFunc
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812BAE8 @ =sub_812B694
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812BACC: .4byte gUnknown_030042A4
_0812BAD0: .4byte gUnknown_030042A0
_0812BAD4: .4byte gActiveBank
_0812BAD8: .4byte gUnknown_02023A62
_0812BADC: .4byte gUnknown_03004210
_0812BAE0: .4byte gDisplayedStringBattle
_0812BAE4: .4byte gBattleBankFunc
_0812BAE8: .4byte sub_812B694
	thumb_func_end SafariHandlePrintString

	thumb_func_start SafariHandlePrintStringPlayerOnly
SafariHandlePrintStringPlayerOnly: @ 812BAEC
	push {lr}
	ldr r0, _0812BB04 @ =gActiveBank
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _0812BB08
	bl SafariHandlePrintString
	b _0812BB0C
	.align 2, 0
_0812BB04: .4byte gActiveBank
_0812BB08:
	bl SafariBufferExecCompleted
_0812BB0C:
	pop {r0}
	bx r0
	thumb_func_end SafariHandlePrintStringPlayerOnly

.section .text_812BBFC

	thumb_func_start SafariHandlecmd19
SafariHandlecmd19: @ 812BBFC
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandlecmd19

	thumb_func_start SafariHandlecmd20
SafariHandlecmd20: @ 812BC08
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandlecmd20

	thumb_func_start SafariHandleOpenBag
SafariHandleOpenBag: @ 812BC14
	push {lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0812BC44 @ =gBattleBankFunc
	ldr r2, _0812BC48 @ =gActiveBank
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812BC4C @ =sub_812B724
	str r1, [r0]
	ldr r1, _0812BC50 @ =gBankInMenu
	ldrb r0, [r2]
	strb r0, [r1]
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0812BC44: .4byte gBattleBankFunc
_0812BC48: .4byte gActiveBank
_0812BC4C: .4byte sub_812B724
_0812BC50: .4byte gBankInMenu
	thumb_func_end SafariHandleOpenBag

	thumb_func_start SafariHandlecmd22
SafariHandlecmd22: @ 812BC54
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandlecmd22

	thumb_func_start SafariHandlecmd23
SafariHandlecmd23: @ 812BC60
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandlecmd23

	thumb_func_start SafariHandleHealthBarUpdate
SafariHandleHealthBarUpdate: @ 812BC6C
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandleHealthBarUpdate

	thumb_func_start SafariHandleExpBarUpdate
SafariHandleExpBarUpdate: @ 812BC78
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandleExpBarUpdate

	thumb_func_start SafariHandleStatusIconUpdate
SafariHandleStatusIconUpdate: @ 812BC84
	push {lr}
	ldr r0, _0812BCB0 @ =gHealthboxIDs
	ldr r1, _0812BCB4 @ =gActiveBank
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _0812BCB8 @ =gBattlePartyID
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0812BCBC @ =gPlayerParty
	adds r1, r2
	movs r2, 0xB
	bl sub_8045A5C
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0812BCB0: .4byte gHealthboxIDs
_0812BCB4: .4byte gActiveBank
_0812BCB8: .4byte gBattlePartyID
_0812BCBC: .4byte gPlayerParty
	thumb_func_end SafariHandleStatusIconUpdate

	thumb_func_start SafariHandleStatusAnimation
SafariHandleStatusAnimation: @ 812BCC0
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandleStatusAnimation

	thumb_func_start SafariHandleStatusXor
SafariHandleStatusXor: @ 812BCCC
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandleStatusXor

	thumb_func_start SafariHandlecmd29
SafariHandlecmd29: @ 812BCD8
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandlecmd29

	thumb_func_start SafariHandleDMATransfer
SafariHandleDMATransfer: @ 812BCE4
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandleDMATransfer

	thumb_func_start SafariHandlecmd31
SafariHandlecmd31: @ 812BCF0
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandlecmd31

	thumb_func_start SafariHandlecmd32
SafariHandlecmd32: @ 812BCFC
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandlecmd32

	thumb_func_start SafariHandlecmd33
SafariHandlecmd33: @ 812BD08
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandlecmd33

	thumb_func_start SafariHandlecmd34
SafariHandlecmd34: @ 812BD14
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandlecmd34

	thumb_func_start SafariHandlecmd35
SafariHandlecmd35: @ 812BD20
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandlecmd35

	thumb_func_start SafariHandlecmd36
SafariHandlecmd36: @ 812BD2C
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandlecmd36

	thumb_func_start SafariHandlecmd37
SafariHandlecmd37: @ 812BD38
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandlecmd37

	thumb_func_start SafariHandlecmd38
SafariHandlecmd38: @ 812BD44
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandlecmd38

	thumb_func_start SafariHandlecmd39
SafariHandlecmd39: @ 812BD50
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandlecmd39

	thumb_func_start SafariHandlecmd40
SafariHandlecmd40: @ 812BD5C
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandlecmd40

	thumb_func_start SafariHandleHitAnimation
SafariHandleHitAnimation: @ 812BD68
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandleHitAnimation

	thumb_func_start SafariHandlecmd42
SafariHandlecmd42: @ 812BD74
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandlecmd42

	thumb_func_start SafariHandleEffectivenessSound
SafariHandleEffectivenessSound: @ 812BD80
	push {r4,lr}
	ldr r4, _0812BDBC @ =gActiveBank
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	movs r3, 0x3F
	cmp r0, 0
	bne _0812BD94
	movs r3, 0xC0
_0812BD94:
	ldr r2, _0812BDC0 @ =gBattleBufferA
	ldrb r1, [r4]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	lsls r1, r3, 24
	asrs r1, 24
	bl PlaySE12WithPanning
	bl SafariBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812BDBC: .4byte gActiveBank
_0812BDC0: .4byte gBattleBufferA
	thumb_func_end SafariHandleEffectivenessSound

	thumb_func_start SafariHandlecmd44
SafariHandlecmd44: @ 812BDC4
	push {lr}
	ldr r2, _0812BDEC @ =gBattleBufferA
	ldr r0, _0812BDF0 @ =gActiveBank
	ldrb r1, [r0]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	bl PlayFanfare
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0812BDEC: .4byte gBattleBufferA
_0812BDF0: .4byte gActiveBank
	thumb_func_end SafariHandlecmd44

	thumb_func_start SafariHandleFaintingCry
SafariHandleFaintingCry: @ 812BDF4
	push {lr}
	ldr r1, _0812BE24 @ =gBattlePartyID
	ldr r0, _0812BE28 @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0812BE2C @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x19
	bl PlayCry1
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0812BE24: .4byte gBattlePartyID
_0812BE28: .4byte gActiveBank
_0812BE2C: .4byte gPlayerParty
	thumb_func_end SafariHandleFaintingCry

	thumb_func_start SafariHandleIntroSlide
SafariHandleIntroSlide: @ 812BE30
	push {lr}
	ldr r1, _0812BE58 @ =gBattleBufferA
	ldr r0, _0812BE5C @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80E43C0
	ldr r2, _0812BE60 @ =gUnknown_02024DE8
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0812BE58: .4byte gBattleBufferA
_0812BE5C: .4byte gActiveBank
_0812BE60: .4byte gUnknown_02024DE8
	thumb_func_end SafariHandleIntroSlide

	thumb_func_start SafariHandleTrainerBallThrow
SafariHandleTrainerBallThrow: @ 812BE64
	push {r4,r5,lr}
	ldr r5, _0812BEA0 @ =gHealthboxIDs
	ldr r4, _0812BEA4 @ =gActiveBank
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _0812BEA8 @ =gBattlePartyID
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0812BEAC @ =gPlayerParty
	adds r1, r2
	movs r2, 0xA
	bl sub_8045A5C
	ldrb r0, [r4]
	bl sub_804777C
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl sub_8043DFC
	bl SafariBufferExecCompleted
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812BEA0: .4byte gHealthboxIDs
_0812BEA4: .4byte gActiveBank
_0812BEA8: .4byte gBattlePartyID
_0812BEAC: .4byte gPlayerParty
	thumb_func_end SafariHandleTrainerBallThrow

	thumb_func_start SafariHandlecmd48
SafariHandlecmd48: @ 812BEB0
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandlecmd48

	thumb_func_start SafariHandlecmd49
SafariHandlecmd49: @ 812BEBC
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandlecmd49

	thumb_func_start SafariHandlecmd50
SafariHandlecmd50: @ 812BEC8
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandlecmd50

	thumb_func_start SafariHandleSpriteInvisibility
SafariHandleSpriteInvisibility: @ 812BED4
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandleSpriteInvisibility

	thumb_func_start SafariHandleBattleAnimation
SafariHandleBattleAnimation: @ 812BEE0
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r5, _0812BF18 @ =gBattleBufferA
	ldr r6, _0812BF1C @ =gActiveBank
	ldrb r2, [r6]
	lsls r1, r2, 9
	adds r0, r5, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r0, r5, 0x2
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r5, 0x3
	adds r1, r5
	ldrb r0, [r1]
	lsls r0, 8
	orrs r4, r0
	str r4, [sp]
	adds r0, r2, 0
	adds r1, r2, 0
	bl move_anim_start_t3
	lsls r0, 24
	cmp r0, 0
	beq _0812BF20
	bl SafariBufferExecCompleted
	b _0812BF2C
	.align 2, 0
_0812BF18: .4byte gBattleBufferA
_0812BF1C: .4byte gActiveBank
_0812BF20:
	ldr r0, _0812BF34 @ =gBattleBankFunc
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _0812BF38 @ =sub_812B794
	str r0, [r1]
_0812BF2C:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812BF34: .4byte gBattleBankFunc
_0812BF38: .4byte sub_812B794
	thumb_func_end SafariHandleBattleAnimation

	thumb_func_start SafariHandleLinkStandbyMsg
SafariHandleLinkStandbyMsg: @ 812BF3C
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandleLinkStandbyMsg

	thumb_func_start SafariHandleResetActionMoveSelection
SafariHandleResetActionMoveSelection: @ 812BF48
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandleResetActionMoveSelection

	thumb_func_start SafariHandlecmd55
SafariHandlecmd55: @ 812BF54
	push {r4,lr}
	ldr r2, _0812BF98 @ =gBattleOutcome
	ldr r1, _0812BF9C @ =gBattleBufferA
	ldr r4, _0812BFA0 @ =gActiveBank
	ldrb r0, [r4]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, 0x5
	bl FadeOutMapMusic
	movs r0, 0x3
	bl BeginFastPaletteFade
	bl SafariBufferExecCompleted
	ldr r0, _0812BFA4 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0x2
	bne _0812BF90
	ldr r0, _0812BFA8 @ =gBattleBankFunc
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, _0812BFAC @ =sub_812B6AC
	str r0, [r1]
_0812BF90:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812BF98: .4byte gBattleOutcome
_0812BF9C: .4byte gBattleBufferA
_0812BFA0: .4byte gActiveBank
_0812BFA4: .4byte gBattleTypeFlags
_0812BFA8: .4byte gBattleBankFunc
_0812BFAC: .4byte sub_812B6AC
	thumb_func_end SafariHandlecmd55

	thumb_func_start SafariHandlecmd56
SafariHandlecmd56: @ 812BFB0
	bx lr
	thumb_func_end SafariHandlecmd56

	.align 2, 0 @ Don't pad with nop.
