	.include "include/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gSpriteAnim_8393160:: @ 8393160
	obj_image_anim_frame 0, 15
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_8393168:: @ 8393168
	.4byte gSpriteAnim_8393160

	.align 2
gSpriteAffineAnim_839316C:: @ 839316C
	obj_rot_scal_anim_frame 0x60, 0x60, 0, 0
	obj_rot_scal_anim_frame 0x2, 0x2, 0, 1
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_8393184:: @ 8393184
	.4byte gSpriteAffineAnim_839316C

	.align 2
gSpriteTemplate_8393188:: @ 8393188
	spr_template 10004, 10004, gOamData_837DFEC, gSpriteAnimTable_8393168, NULL, gSpriteAffineAnimTable_8393184, sub_807A544
