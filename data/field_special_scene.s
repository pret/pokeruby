	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gMapObjectPic_MovingBox:: @ 83D28AC
	.incbin "graphics/map_objects/pics/misc/moving_box.4bpp"

	.align 2
gMapObjectPalette19:: @ 83D292C
	.incbin "graphics/map_objects/palettes/19.gbapal"

gTruckCamera_HorizontalTable:: @ 83D294C
	.byte  0
	.byte  0
	.byte  0
	.byte  0
	.byte  0
	.byte  0
	.byte  0
	.byte  0
	.byte  1
	.byte  2
	.byte  2
	.byte  2
	.byte  2
	.byte  2
	.byte  2
	.byte -1
	.byte -1
	.byte -1
	.byte  0

gUnknown_083D295F:: @ 83D295F
	step_18
	step_end

gUnknown_083D2961:: @ 83D2961
	step_17
	step_end
