	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

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
