	.include "include/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gSpriteAnim_8393054:: @ 8393054
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 4, 3
	obj_image_anim_frame 8, 3
	obj_image_anim_frame 12, 3
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_8393068:: @ 8393068
	.4byte gSpriteAnim_8393054

	.align 2
gSpriteTemplate_839306C:: @ 839306C
	spr_template 10004, 10004, gOamData_837DF2C, gSpriteAnimTable_8393068, NULL, gDummySpriteAffineAnimTable, sub_807A5C4

	.align 2
gSpriteTemplate_8393084:: @ 8393084
	spr_template 10004, 10004, gOamData_837DF2C, gSpriteAnimTable_8393068, NULL, gDummySpriteAffineAnimTable, sub_807A544
