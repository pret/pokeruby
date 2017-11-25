	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 1
gUnknown_0839AC5C:: @ 839AC5C
	.2byte   0
	.2byte 120
	.2byte  80
	.2byte 160
	.2byte  40
	.2byte   0

gUnknown_0839AC68:: @ 839AC68
	.byte 40
	.byte 90
	.byte 60
	.byte 90
	.byte  2
	.byte 60
	.byte 40
	.byte 30

	.align 2
gWeatherBubbleSpriteSheet:: @ 839AC70
	obj_tiles WeatherBubbleTiles, 0x40, 0x1205

	.align 1
gUnknown_0839AC78:: @ 839AC78
	.2byte 120, 160
	.2byte 376, 160
	.2byte  40, 140
	.2byte 296, 140
	.2byte 180, 130
	.2byte 436, 130
	.2byte  60, 160
	.2byte 436, 160
	.2byte 220, 180
	.2byte 476, 180
	.2byte  10,  90
	.2byte 266,  90
	.2byte 256, 160

	.align 2
gSpriteAnim_839ACAC:: @ 839ACAC
	obj_image_anim_frame 0, 16
	obj_image_anim_frame 1, 16
	obj_image_anim_end

	.align 2
gSpriteAnimTable_839ACB8:: @ 839ACB8
	.4byte gSpriteAnim_839ACAC

	.align 2
gSpriteTemplate_839ACBC:: @ 839ACBC
	spr_template 4613, 4608, gOamData_837DF24, gSpriteAnimTable_839ACB8, NULL, gDummySpriteAffineAnimTable, unc_0807DAB4

gUnknown_0839ACD4:: @ 839ACD4
	.byte 2, 3, 5, 3

gUnknown_0839ACD8:: @ 839ACD8
	.byte 2, 2, 3, 2
