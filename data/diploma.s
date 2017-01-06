	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gDiplomaPalettes:: @ 840CB0C
	.incbin "graphics/misc/diploma_national.gbapal"
	.incbin "graphics/misc/diploma_hoenn.gbapal"

	.align 2
gDiplomaTilemap:: @ 840CB4C
	.incbin "graphics/misc/diploma_map.bin.lz"

	.align 2
gDiplomaTiles:: @ 840D288
	.incbin "graphics/misc/diploma.4bpp.lz"
