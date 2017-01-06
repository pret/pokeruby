	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

gUnknown_083D1358:: @ 83D1358
	.incbin "baserom.gba", 0x003d1358, 0x1c

gUnknown_083D1374:: @ 83D1374
	.incbin "baserom.gba", 0x003d1374, 0x60

	.align 2
gUnknown_083D13D4:: @ 83D13D4
	.4byte SecretBaseText_DelRegist, sub_80BCA84
	.4byte gUnknownText_Exit, sub_80BCBF8

	.align 2
gUnknown_083D13E4:: @ 83D13E4
	.4byte sub_80BCB90
	.4byte sub_80BCBC0

gUnknown_083D13EC:: @ 83D13EC
	.incbin "baserom.gba", 0x003d13ec, 0xc
