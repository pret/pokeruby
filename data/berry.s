	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

@ 83CC740
	.include "data/text/berry_descriptions.inc"

@ 83CD2CC
	.include "data/berries.inc"

	.align 2
gBlankBerryTree:: @ 83CD780
	.4byte 0, 0
