	.include "include/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gSpriteAnim_8393124:: @ 8393124
	obj_image_anim_frame 0, 5
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_839312C:: @ 839312C
	obj_image_anim_frame 0, 5
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_8393134:: @ 8393134
	obj_image_anim_frame 0, 5
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_839313C:: @ 839313C
	.4byte gSpriteAnim_8393124
	.4byte gSpriteAnim_839312C
	.4byte gSpriteAnim_8393134

	.align 2
gSpriteTemplate_8393148:: @ 8393148
	spr_template 10135, 10135, gOamData_837DF34, gSpriteAnimTable_839313C, NULL, gDummySpriteAffineAnimTable, sub_807A5C4
