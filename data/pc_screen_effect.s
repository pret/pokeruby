	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gOamData_83D18D8:: @ 83D18D8
	.2byte 0x4000
	.2byte 0x4000
	.2byte 0x0000

	.align 2
gSpriteAnim_83D18E0:: @ 83D18E0
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D18E8:: @ 83D18E8
	.4byte gSpriteAnim_83D18E0

	.align 2
gUnknownPal_083D18EC::
	.incbin "graphics/unknown/unknown_3D18EC.gbapal"

	.align 2
gUnknownGfx_083D190C::
	.incbin "graphics/unknown/unknown_3D190C.4bpp"
