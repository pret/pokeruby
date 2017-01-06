	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.include "data/text/battle_strings.inc"

gUnknown_084016BC:: @ 84016BC
	.incbin "baserom.gba", 0x004016bc, 0xec

gUnknown_084017A8:: @ 84017A8
	.incbin "baserom.gba", 0x004017a8, 0x8
