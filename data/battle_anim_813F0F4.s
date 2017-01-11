	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_0840B258:: @ 840B258
	obj_tiles gBattleAnimSpriteSheet_Particles, 0x100, 55020
	obj_tiles gBattleAnimSpriteSheet_Particles, 0x100, 55021
	obj_tiles gBattleAnimSpriteSheet_Particles, 0x100, 55022
	obj_tiles gBattleAnimSpriteSheet_Particles, 0x100, 55023
	obj_tiles gBattleAnimSpriteSheet_Particles, 0x100, 55024
	obj_tiles gBattleAnimSpriteSheet_Particles, 0x100, 55025
	obj_tiles gBattleAnimSpriteSheet_Particles, 0x100, 55026
	obj_tiles gBattleAnimSpriteSheet_Particles, 0x100, 55027
	obj_tiles gBattleAnimSpriteSheet_Particles, 0x100, 55028
	obj_tiles gBattleAnimSpriteSheet_Particles, 0x100, 55029
	obj_tiles gBattleAnimSpriteSheet_Particles, 0x100, 55030
	obj_tiles gBattleAnimSpriteSheet_Particles, 0x100, 55031

	.align 2
gUnknown_0840B2B8:: @ 840B2B8
	obj_pal gBattleAnimSpritePalette_136, 55020
	obj_pal gBattleAnimSpritePalette_136, 55021
	obj_pal gBattleAnimSpritePalette_136, 55022
	obj_pal gBattleAnimSpritePalette_136, 55023
	obj_pal gBattleAnimSpritePalette_136, 55024
	obj_pal gBattleAnimSpritePalette_136, 55025
	obj_pal gBattleAnimSpritePalette_136, 55026
	obj_pal gBattleAnimSpritePalette_136, 55027
	obj_pal gBattleAnimSpritePalette_136, 55028
	obj_pal gBattleAnimSpritePalette_136, 55029
	obj_pal gBattleAnimSpritePalette_136, 55030
	obj_pal gBattleAnimSpritePalette_136, 55031

	.align 2
gSpriteAnim_840B318:: @ 840B318
	obj_image_anim_frame 0, 1
	obj_image_anim_frame 1, 1
	obj_image_anim_frame 2, 1
	obj_image_anim_frame 0, 1, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 2, 1
	obj_image_anim_frame 1, 1
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_840B334:: @ 840B334
	obj_image_anim_frame 3, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_840B33C:: @ 840B33C
	obj_image_anim_frame 4, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_840B344:: @ 840B344
	obj_image_anim_frame 5, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_840B34C:: @ 840B34C
	obj_image_anim_frame 6, 4
	obj_image_anim_frame 7, 4
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_840B358:: @ 840B358
	obj_image_anim_frame 7, 4
	obj_image_anim_end

	.align 2
gSpriteAnimTable_840B360:: @ 840B360
	.4byte gSpriteAnim_840B318
	.4byte gSpriteAnim_840B334
	.4byte gSpriteAnim_840B33C
	.4byte gSpriteAnim_840B344
	.4byte gSpriteAnim_840B34C
	.4byte gSpriteAnim_840B358

gUnknown_0840B378:: @ 840B378
	.byte 0, 0, 0, 5, 1, 2, 2, 3, 5, 5, 4, 4

	.align 2
gUnknown_0840B384:: @ 840B384
	.4byte sub_8140930
	.4byte sub_8140DC4
	.4byte sub_8140C14
	.4byte sub_8140CE8
	.4byte sub_8141058
	.4byte sub_8140C14
	.4byte sub_8140B3C
	.4byte sub_8140CE8
	.4byte sub_8140F24
	.4byte sub_8140A64
	.4byte sub_8140DC4
	.4byte sub_8141164

	.align 2
gSpriteTemplate_840B3B4:: @ 840B3B4
	spr_template 55020, 55020, gOamData_837DF24, gSpriteAnimTable_840B360, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_840B3CC:: @ 840B3CC
	spr_template 55021, 55021, gOamData_837DF24, gSpriteAnimTable_840B360, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_840B3E4:: @ 840B3E4
	spr_template 55022, 55022, gOamData_837DF24, gSpriteAnimTable_840B360, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_840B3FC:: @ 840B3FC
	spr_template 55023, 55023, gOamData_837DF24, gSpriteAnimTable_840B360, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_840B414:: @ 840B414
	spr_template 55024, 55024, gOamData_837DF24, gSpriteAnimTable_840B360, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_840B42C:: @ 840B42C
	spr_template 55025, 55025, gOamData_837DF24, gSpriteAnimTable_840B360, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_840B444:: @ 840B444
	spr_template 55026, 55026, gOamData_837DF24, gSpriteAnimTable_840B360, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_840B45C:: @ 840B45C
	spr_template 55027, 55027, gOamData_837DF24, gSpriteAnimTable_840B360, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_840B474:: @ 840B474
	spr_template 55028, 55028, gOamData_837DF24, gSpriteAnimTable_840B360, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_840B48C:: @ 840B48C
	spr_template 55029, 55029, gOamData_837DF24, gSpriteAnimTable_840B360, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_840B4A4:: @ 840B4A4
	spr_template 55030, 55030, gOamData_837DF24, gSpriteAnimTable_840B360, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_840B4BC:: @ 840B4BC
	spr_template 55031, 55031, gOamData_837DF24, gSpriteAnimTable_840B360, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 1
gUnknown_0840B4D4:: @ 840B4D4
	.2byte 0x7ADF
	.2byte 0x7AF0
	.2byte 0x53D7
	.2byte 0x3FFF
	.2byte 0x7297
	.2byte 0x67F5
	.2byte 0x7B2C
	.2byte 0x2B7E
	.2byte 0x431F
	.2byte 0x7BDD
	.2byte 0x2A3F
	.2byte 0x293F
	.2byte    0x0
	.2byte  0x201
	.2byte  0x403
	.2byte  0x101
	.2byte  0x100
	.2byte  0x503
	.2byte  0x506
	.2byte    0x4

	.align 2
gBattleAnimSpriteTemplate_840B4FC:: @ 840B4FC
	spr_template 10269, 10269, gOamData_837DF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8141C30
