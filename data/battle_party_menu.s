	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_083B5FCC:: @ 83B5FCC
	.4byte OtherText_Summary, BattlePokemonMenu_Summary
	.4byte gOtherText_CancelNoTerminator, BattlePokemonMenu_Cancel
	.4byte OtherText_Shift, BattlePokemonMenu_Shift
	.4byte OtherText_SendOut, BattlePokemonMenu_Shift

Unknown_83B5FEC: @ 83B5FEC
	.byte 2, 0, 1

Unknown_83B5FEF: @ 83B5FEF
	.byte 3, 0, 1

Unknown_83B5FF2: @ 83B5FF2
	.byte 0, 1

	.align 2
gUnknown_083B5FF4:: @ 83B5FF4
	.byte 3, 9
	.space 2
	.4byte Unknown_83B5FEC

	.byte 3, 9
	.space 2
	.4byte Unknown_83B5FEF

	.byte 2, 9
	.space 2
	.4byte Unknown_83B5FF2
