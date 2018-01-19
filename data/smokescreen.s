	.include "include/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_081FAEA4:: @ 81FAEA4
	obj_tiles gSmokescreenImpactTiles, 0x180, 55019

	.align 2
gUnknown_081FAEAC:: @ 81FAEAC
	obj_pal gSmokescreenImpactPalette, 55019

	.align 2
gOamData_81FAEB4:: @ 81FAEB4
	.2byte 0x0000
	.2byte 0x4000
	.2byte 0x0400

	.align 2
gSpriteAnim_81FAEBC:: @ 81FAEBC
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 4, 4
	obj_image_anim_frame 8, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_81FAECC:: @ 81FAECC
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 4, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 8, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_81FAEDC:: @ 81FAEDC
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 4, 4, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 8, 4, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_81FAEEC:: @ 81FAEEC
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 4, 4, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 8, 4, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_81FAEFC:: @ 81FAEFC
	.4byte gSpriteAnim_81FAEBC
	.4byte gSpriteAnim_81FAECC
	.4byte gSpriteAnim_81FAEDC
	.4byte gSpriteAnim_81FAEEC

	.align 2
gSpriteTemplate_81FAF0C:: @ 81FAF0C
	spr_template 55019, 55019, gOamData_81FAEB4, gSpriteAnimTable_81FAEFC, NULL, gDummySpriteAffineAnimTable, sub_80463CC
