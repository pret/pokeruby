	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

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
