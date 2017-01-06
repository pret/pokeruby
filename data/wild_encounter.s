	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

@ 839B540
	.include "data/wild_mons.inc"

	.align 2
gWildFeebasRoute119Data:: @ 839DBFC
	.byte 20, 25  @ Min/Max level
	.2byte SPECIES_FEEBAS

	.align 2
gRoute119WaterTileData:: @ 839DC00
	.2byte  0x0, 0x2D,   0x0
	.2byte 0x2E, 0x5B,  0x83
	.2byte 0x5C, 0x8B, 0x12A
