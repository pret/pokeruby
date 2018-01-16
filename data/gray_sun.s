	.include "include/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

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
