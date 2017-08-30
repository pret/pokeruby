	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start NameHasGenderSymbol
NameHasGenderSymbol: @ 8042548
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	mov r2, sp
	mov r1, sp
	movs r0, 0
	strb r0, [r1, 0x1]
	strb r0, [r2]
	movs r3, 0
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _0804258C
_08042564:
	adds r1, r4, r3
	ldrb r0, [r1]
	cmp r0, 0xB5
	bne _08042572
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
_08042572:
	ldrb r0, [r1]
	cmp r0, 0xB6
	bne _0804257E
	ldrb r0, [r2, 0x1]
	adds r0, 0x1
	strb r0, [r2, 0x1]
_0804257E:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r4, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08042564
_0804258C:
	cmp r5, 0
	bne _080425A0
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0
	beq _080425A0
	mov r0, sp
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _080425B4
_080425A0:
	cmp r5, 0xFE
	bne _080425B8
	mov r0, sp
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _080425B8
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0
	bne _080425B8
_080425B4:
	movs r0, 0x1
	b _080425BA
_080425B8:
	movs r0, 0
_080425BA:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end NameHasGenderSymbol

	thumb_func_start AppendGenderSymbol
AppendGenderSymbol: @ 80425C4
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0
	bne _080425E4
	movs r1, 0
	bl NameHasGenderSymbol
	lsls r0, 24
	cmp r0, 0
	bne _08042600
	ldr r1, _080425E0 @ =gOtherText_MaleSymbol3
	b _08042602
	.align 2, 0
_080425E0: .4byte gOtherText_MaleSymbol3
_080425E4:
	cmp r1, 0xFE
	bne _08042600
	adds r0, r4, 0
	movs r1, 0xFE
	bl NameHasGenderSymbol
	lsls r0, 24
	cmp r0, 0
	bne _08042600
	ldr r1, _080425FC @ =gOtherText_FemaleSymbol3
	b _08042602
	.align 2, 0
_080425FC: .4byte gOtherText_FemaleSymbol3
_08042600:
	ldr r1, _08042610 @ =gOtherText_GenderlessSymbol
_08042602:
	adds r0, r4, 0
	bl StringAppend
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08042610: .4byte gOtherText_GenderlessSymbol
	thumb_func_end AppendGenderSymbol

	thumb_func_start MonAppendGenderSymbol
MonAppendGenderSymbol: @ 8042614
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	bl GetBoxMonGender
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl AppendGenderSymbol
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MonAppendGenderSymbol

	thumb_func_start DaycareLevelMenuGetText
DaycareLevelMenuGetText: @ 8042630
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x28
	mov r8, r0
	adds r7, r1, 0
	movs r0, 0xFF
	strb r0, [r7]
	movs r6, 0
	add r0, sp, 0x14
	mov r9, r0
_08042648:
	lsls r0, r6, 2
	adds r0, r6
	lsls r4, r0, 4
	add r4, r8
	lsls r0, 2
	mov r1, sp
	adds r5, r1, r0
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetBoxMonNick
	adds r0, r5, 0
	adds r1, r4, 0
	bl MonAppendGenderSymbol
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x1
	bls _08042648
	adds r0, r7, 0
	mov r1, sp
	bl StringCopy
	ldr r4, _080426A8 @ =gOtherText_NewLine2
	adds r0, r7, 0
	adds r1, r4, 0
	bl StringAppend
	adds r0, r7, 0
	mov r1, r9
	bl StringAppend
	adds r0, r7, 0
	adds r1, r4, 0
	bl StringAppend
	ldr r1, _080426AC @ =gOtherText_CancelAndLv
	adds r0, r7, 0
	bl StringAppend
	add sp, 0x28
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080426A8: .4byte gOtherText_NewLine2
_080426AC: .4byte gOtherText_CancelAndLv
	thumb_func_end DaycareLevelMenuGetText

	thumb_func_start DaycareLevelMenuGetLevelText
DaycareLevelMenuGetLevelText: @ 80426B0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	adds r4, r1, 0
	movs r0, 0xFF
	strb r0, [r4]
	movs r5, 0
	movs r0, 0xFC
	mov r8, r0
	movs r7, 0x14
_080426C6:
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 4
	adds r0, r6, r0
	movs r3, 0x88
	lsls r3, 1
	adds r1, r6, r3
	adds r1, r2
	ldr r1, [r1]
	bl Daycare_GetLevelAfterSteps
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x34
	strb r0, [r4]
	mov r0, r8
	strb r0, [r4, 0x1]
	strb r7, [r4, 0x2]
	movs r0, 0x6
	strb r0, [r4, 0x3]
	adds r0, r4, 0x4
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r4, r0, 0
	mov r3, r8
	strb r3, [r4]
	strb r7, [r4, 0x1]
	movs r0, 0
	strb r0, [r4, 0x2]
	adds r0, r4, 0x3
	ldr r1, _08042728 @ =gOtherText_NewLine2
	bl StringCopy
	adds r4, r0, 0
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bls _080426C6
	movs r0, 0xFF
	strb r0, [r4]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042728: .4byte gOtherText_NewLine2
	thumb_func_end DaycareLevelMenuGetLevelText

	thumb_func_start DaycareLevelMenuProcessKeyInput
DaycareLevelMenuProcessKeyInput: @ 804272C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	ldr r0, _08042760 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08042768
	ldr r0, _08042764 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0x8]
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _08042816
	subs r0, r2, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x1
	negs r0, r0
	b _0804278A
	.align 2, 0
_08042760: .4byte gMain
_08042764: .4byte gTasks
_08042768:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804279C
	ldr r0, _08042798 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0x8]
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	cmp r0, 0x2
	beq _08042816
	adds r0, r2, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x1
_0804278A:
	bl MoveMenuCursor
	movs r0, 0x5
	bl PlaySE
	b _08042816
	.align 2, 0
_08042798: .4byte gTasks
_0804279C:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080427E8
	bl HandleDestroyMenuCursors
	movs r0, 0x5
	bl PlaySE
	ldr r3, _080427DC @ =gLastFieldPokeMenuOpened
	ldr r2, _080427E0 @ =gScriptResult
	ldr r1, _080427E4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x8]
	strh r0, [r2]
	strb r0, [r3]
	adds r0, r4, 0
	bl DestroyTask
	movs r0, 0xF
	movs r1, 0x6
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	bl EnableBothScriptContexts
	b _08042816
	.align 2, 0
_080427DC: .4byte gLastFieldPokeMenuOpened
_080427E0: .4byte gScriptResult
_080427E4: .4byte gTasks
_080427E8:
	movs r4, 0x2
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _08042816
	bl HandleDestroyMenuCursors
	ldr r0, _0804281C @ =gLastFieldPokeMenuOpened
	ldr r1, _08042820 @ =gScriptResult
	strh r4, [r1]
	movs r1, 0x2
	strb r1, [r0]
	adds r0, r5, 0
	bl DestroyTask
	movs r0, 0xF
	movs r1, 0x6
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	bl EnableBothScriptContexts
_08042816:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804281C: .4byte gLastFieldPokeMenuOpened
_08042820: .4byte gScriptResult
	thumb_func_end DaycareLevelMenuProcessKeyInput

	thumb_func_start ShowDaycareLevelMenu
ShowDaycareLevelMenu: @ 8042824
	push {r4,lr}
	sub sp, 0x6C
	movs r0, 0xF
	movs r1, 0x6
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuDrawTextWindow
	ldr r4, _08042880 @ =gSaveBlock1 + 0x2F9C
	adds r0, r4, 0
	add r1, sp, 0x8
	bl DaycareLevelMenuGetText
	add r0, sp, 0x8
	movs r1, 0x10
	movs r2, 0x7
	bl MenuPrint
	adds r0, r4, 0
	add r1, sp, 0x8
	bl DaycareLevelMenuGetLevelText
	add r0, sp, 0x8
	movs r1, 0xCE
	movs r2, 0x38
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	movs r0, 0
	str r0, [sp]
	movs r0, 0xD
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x7
	movs r3, 0x3
	bl InitMenu
	ldr r0, _08042884 @ =DaycareLevelMenuProcessKeyInput
	movs r1, 0x3
	bl CreateTask
	add sp, 0x6C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08042880: .4byte gSaveBlock1 + 0x2F9C
_08042884: .4byte DaycareLevelMenuProcessKeyInput
	thumb_func_end ShowDaycareLevelMenu

	thumb_func_start ChooseSendDaycareMon
ChooseSendDaycareMon: @ 8042888
	push {lr}
	movs r0, 0x6
	movs r1, 0
	bl OpenPartyMenu
	ldr r1, _0804289C @ =gMain
	ldr r0, _080428A0 @ =c2_exit_to_overworld_2_switch
	str r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_0804289C: .4byte gMain
_080428A0: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end ChooseSendDaycareMon

	.align 2, 0 @ Don't pad with nop.
