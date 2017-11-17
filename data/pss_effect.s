	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_083D1898:: @ 83D1898
	obj_tiles gUnknownGfx_083D190C, 0x80, 0

	.align 2
gUnknown_083D18A0:: @ 83D18A0
	obj_pal gUnknownPal_083D18EC, 0x0000

	.align 2
gSpriteTemplate_83D18A8:: @ 83D18A8
	spr_template 0, 0, gOamData_83D18D8, gSpriteAnimTable_83D18E8, NULL, gDummySpriteAffineAnimTable, sub_80C60CC

	.align 2
gSpriteTemplate_83D18C0:: @ 83D18C0
	spr_template 0, 0, gOamData_83D18D8, gSpriteAnimTable_83D18E8, NULL, gDummySpriteAffineAnimTable, sub_80C6130

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
