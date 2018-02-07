	.include "include/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gSpriteAnim_83930D8:: @ 83930D8
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 48, 3
	obj_image_anim_frame 64, 3
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83930F0:: @ 83930F0
	.4byte gSpriteAnim_83930D8

	.align 2
gBattleAnimSpriteTemplate_83930F4:: @ 83930F4
	spr_template 10071, 10071, gOamData_837DF34, gSpriteAnimTable_83930F0, NULL, gDummySpriteAffineAnimTable, sub_807A63C
