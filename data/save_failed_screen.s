	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

gSaveFailedClockPal:: @ 8411960
	.incbin "graphics/misc/clock_small.gbapal"

gSaveFailedClockGfx:: @ 8411980
	.incbin "graphics/misc/clock_small.4bpp.lz"
