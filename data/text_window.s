	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_083761F0:: @ 83761F0
	.4byte gTextWindowFrame1_Gfx, gTextWindowFrame1_Pal
	.4byte gTextWindowFrame2_Gfx, gTextWindowFrame2_Pal
	.4byte gTextWindowFrame3_Gfx, gTextWindowFrame3_Pal
	.4byte gTextWindowFrame4_Gfx, gTextWindowFrame4_Pal
	.4byte gTextWindowFrame5_Gfx, gTextWindowFrame5_Pal
	.4byte gTextWindowFrame6_Gfx, gTextWindowFrame6_Pal
	.4byte gTextWindowFrame7_Gfx, gTextWindowFrame7_Pal
	.4byte gTextWindowFrame8_Gfx, gTextWindowFrame8_Pal
	.4byte gTextWindowFrame9_Gfx, gTextWindowFrame9_Pal
	.4byte gTextWindowFrame10_Gfx, gTextWindowFrame10_Pal
	.4byte gTextWindowFrame11_Gfx, gTextWindowFrame11_Pal
	.4byte gTextWindowFrame12_Gfx, gTextWindowFrame12_Pal
	.4byte gTextWindowFrame13_Gfx, gTextWindowFrame13_Pal
	.4byte gTextWindowFrame14_Gfx, gTextWindowFrame14_Pal
	.4byte gTextWindowFrame15_Gfx, gTextWindowFrame15_Pal
	.4byte gTextWindowFrame16_Gfx, gTextWindowFrame16_Pal
	.4byte gTextWindowFrame17_Gfx, gTextWindowFrame17_Pal
	.4byte gTextWindowFrame18_Gfx, gTextWindowFrame18_Pal
	.4byte gTextWindowFrame19_Gfx, gTextWindowFrame19_Pal
	.4byte gTextWindowFrame20_Gfx, gTextWindowFrame20_Pal

	.align 1
gMessageBoxTilemap:: @ 8376290
	.incbin "graphics/text_window/message_box_map.bin"
