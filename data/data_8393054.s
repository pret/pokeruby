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

	.align 2
gSpriteAnim_839309C:: @ 839309C
	obj_image_anim_frame 0, 3
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83930A4:: @ 83930A4
	.4byte gSpriteAnim_839309C

	.align 2
gBattleAnimSpriteTemplate_83930A8:: @ 83930A8
	spr_template 10283, 10283, gOamData_837DF34, gSpriteAnimTable_83930A4, NULL, gDummySpriteAffineAnimTable, sub_807A908

	.align 2
gBattleAnimSpriteTemplate_83930C0:: @ 83930C0
	spr_template 10283, 10283, gOamData_837DF34, gSpriteAnimTable_83930A4, NULL, gDummySpriteAffineAnimTable, sub_807A9BC

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

	.align 2
gSpriteTemplate_839310C:: @ 839310C
	spr_template 10051, 10051, gOamData_837DF34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_807A5C4

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
