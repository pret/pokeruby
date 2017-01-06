	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gOamData_CutGrass:: @ 83C15DC
	.2byte 0
	.2byte 0
	.2byte 0x1401

	.align 2
gSpriteAnim_CutGrass:: @ 83C15E4
	obj_image_anim_frame 0, 30
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_CutGrass:: @ 83C15EC
	.4byte gSpriteAnim_CutGrass

	.align 2
gSpriteImageTable_CutGrass:: @ 83C15F0
	obj_frame_tiles gFieldEffectPic_CutGrass, 0x20

	.align 2
gFieldEffectObjectPaletteInfo6:: @ 83C15F8
	obj_pal gFieldEffectObjectPalette6, 0x1000

	.align 2
gSpriteTemplate_CutGrass:: @ 83C1600
	spr_template 0xFFFF, 0x1000, gOamData_CutGrass, gSpriteAnimTable_CutGrass, gSpriteImageTable_CutGrass, gDummySpriteAffineAnimTable, sub_80A2A48
