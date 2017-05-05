	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_081E764C:: @ 81E764C
	.incbin "graphics/birch_speech/bg0.gbapal"
	.incbin "graphics/birch_speech/bg1.gbapal"

	.align 2
gBirchIntroShadowGfx:: @ 81E768C
	.incbin "graphics/birch_speech/shadow.4bpp.lz"

	.align 2
gUnknown_081E7834:: @ 81E7834
	.incbin "graphics/birch_speech/map.bin.lz"

	.align 2
gUnknown_081E795C:: @ 81E795C
	.incbin "graphics/birch_speech/bg2.gbapal"

	.align 2
gUnknown_081E796C:: @ 81E796C
	.space 16

	.align 2
gMainMenuPalette:: @ 81E797C
	.incbin "graphics/misc/main_menu.gbapal"

	.align 2
gSpriteAffineAnim_81E799C:: @ 81E799C
	obj_rot_scal_anim_frame 0xFFFE, 0xFFFE, 0, 48
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_81E79AC:: @ 81E79AC
	.4byte gSpriteAffineAnim_81E799C

	.align 2
gUnknown_081E79B0:: @ 81E79B0
	.4byte gBirchText_Boy, 0
	.4byte gBirchText_Girl, 0

	.align 2
gMalePresetNames:: @ 81E79C0
	.4byte gBirchText_NewName, 0
	.4byte gDefaultBoyName1, 0
	.4byte gDefaultBoyName2, 0
	.4byte gDefaultBoyName3, 0
	.4byte gDefaultBoyName4, 0

	.align 2
gFemalePresetNames:: @ 81E79E8
	.4byte gBirchText_NewName, 0
	.4byte gDefaultGirlName1, 0
	.4byte gDefaultGirlName2, 0
	.4byte gDefaultGirlName3, 0
	.4byte gDefaultGirlName4, 0
