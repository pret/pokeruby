	.include "include/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

@ 83CF594
	.include "data/contest_moves.inc"

@ 83D00AC
	.include "data/contest_effects.inc"

@ A lookup table with TRUE for each combo starter ID and FALSE for ID 0,
@ which means "not a combo starter move".
gComboStarterLookupTable:: @ 83D016C
	.byte FALSE
	.rept 62
	.byte TRUE
	.endr

@ 83D01AC
	.include "data/contest_effect_funcs.inc"
