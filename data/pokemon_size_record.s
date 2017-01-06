	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

gUnknown_083D180C:: @ 83D180C
	.incbin "baserom.gba", 0x003d180c, 0x80

gOtherText_DecimalPoint:: @ 83D188C
	.string ".$"

gUnknown_083D188E:: @ 83D188E
	.byte 0x48, 0x49, 0x4A, 0x4B, 0x4C, 0x4D, 0x4E
