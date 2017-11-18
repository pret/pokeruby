	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gSpriteImage_83D26C0:: @ 83D26C0
	.incbin "graphics/unknown_sprites/83D2860/0.4bpp"

	.align 2
gSpriteImage_83D2740:: @ 83D2740
	.incbin "graphics/unknown_sprites/83D2860/1.4bpp"

	.align 2
gSpriteImage_83D27C0:: @ 83D27C0
	.incbin "graphics/unknown_sprites/83D2860/2.4bpp"

	.align 2
Palette_3D2840:: @ 83D2840
	.incbin "graphics/unknown/unknown_3D2840.gbapal"

	.align 2
gSpriteImageTable_83D2860:: @ 83D2860
	obj_frame_tiles gSpriteImage_83D26C0, 0x80
	obj_frame_tiles gSpriteImage_83D2740, 0x80
	obj_frame_tiles gSpriteImage_83D27C0, 0x80

	.align 2
gUnknown_083D2878:: @ 83D2878
	obj_pal Palette_3D2840, 4096

	.align 2
gSpriteAnim_83D2880:: @ 83D2880
	obj_image_anim_frame 0, 30
	obj_image_anim_frame 1, 30
	obj_image_anim_frame 2, 30
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83D2890:: @ 83D2890
	.4byte gSpriteAnim_83D2880

	.align 2
gSpriteTemplate_83D2894:: @ 83D2894
	spr_template 0xFFFF, 4096, gFieldOamData_32x8, gSpriteAnimTable_83D2890, gSpriteImageTable_83D2860, gDummySpriteAffineAnimTable, SpriteCallbackDummy
