	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gSaveSectionLocations:: @ 8401DA4
	.4byte gSaveBlock2,                 0x890
	.4byte gSaveBlock1 + 0xF80 * 0,     0xF80
	.4byte gSaveBlock1 + 0xF80 * 1,     0xF80
	.4byte gSaveBlock1 + 0xF80 * 2,     0xF80
	.4byte gSaveBlock1 + 0xF80 * 3,     0xC40
	.4byte gPokemonStorage + 0xF80 * 0, 0xF80
	.4byte gPokemonStorage + 0xF80 * 1, 0xF80
	.4byte gPokemonStorage + 0xF80 * 2, 0xF80
	.4byte gPokemonStorage + 0xF80 * 3, 0xF80
	.4byte gPokemonStorage + 0xF80 * 4, 0xF80
	.4byte gPokemonStorage + 0xF80 * 5, 0xF80
	.4byte gPokemonStorage + 0xF80 * 6, 0xF80
	.4byte gPokemonStorage + 0xF80 * 7, 0xF80
	.4byte gPokemonStorage + 0xF80 * 8, 0x7D0

	.align 2
gHallOfFameSaveSectionLocations:: @ 8401E14
	.4byte gHallOfFame + 0xF80 * 0, 0xF80
	.4byte gHallOfFame + 0xF80 * 1, 0xF80

gUnknown_08401E24:: @ 8401E24
	.byte 0x1E, 0x1F @ flash sectors
