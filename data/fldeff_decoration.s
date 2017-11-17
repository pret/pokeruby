	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gOamData_83D266C:: @ 83D266C
	.2byte 0x8000
	.2byte 0x8000
	.2byte 0x0800

	.align 2
gSpriteAnim_83D2674:: @ 83D2674
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 1, 6
	obj_image_anim_frame 2, 6
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D2684:: @ 83D2684
	.4byte gSpriteAnim_83D2674

	.align 2
gSpriteImageTable_83D2688:: @ 83D2688
	obj_frame_tiles gSpriteImage_83D21EC, 0x100
	obj_frame_tiles gSpriteImage_83D22EC, 0x100
	obj_frame_tiles gSpriteImage_83D23EC, 0x100

	.align 2
gSpriteTemplate_83D26A0:: @ 83D26A0
	spr_template 0xFFFF, 4110, gOamData_83D266C, gSpriteAnimTable_83D2684, gSpriteImageTable_83D2688, gDummySpriteAffineAnimTable, SpriteCB_SandPillar_0

@ This uses one of the secret base palettes, so there is no "09.pal" file.
	.align 2
gFieldEffectObjectPaletteInfo9:: @ 83D26B8
	obj_pal gTilesetPalettes_SecretBase + 5 * 0x20, 0x100E
