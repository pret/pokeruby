	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

gUnknown_08411940:: @ 8411940
	.incbin "baserom.gba", 0x00411940, 0x8

gUnknown_08411948:: @ 8411948
	.incbin "baserom.gba", 0x00411948, 0x18

gSaveFailedClockPal:: @ 8411960
	.incbin "graphics/misc/clock_small.gbapal"

gSaveFailedClockGfx:: @ 8411980
	.incbin "graphics/misc/clock_small.4bpp.lz"
