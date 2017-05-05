	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

@ 82091DC
	.include "data/egg_moves.inc"

	.align 2
gUnknown_08209AC4:: @ 8209AC4
	.4byte DaycareText_GetAlongVeryWell
	.4byte DaycareText_GetAlong
	.4byte DaycareText_DontLikeOther
	.4byte DaycareText_PlayOther

gUnknown_08209AD4:: @ 8209AD4
	.string "タマゴ$"
