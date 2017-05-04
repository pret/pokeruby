	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
DroughtPaletteData_0: @ 8393FE8
	.incbin "graphics/weather/drought0.bin.lz"

	.align 2
DroughtPaletteData_1: @ 839480C
	.incbin "graphics/weather/drought1.bin.lz"

	.align 2
DroughtPaletteData_2: @ 8395004
	.incbin "graphics/weather/drought2.bin.lz"

	.align 2
DroughtPaletteData_3: @ 83957A0
	.incbin "graphics/weather/drought3.bin.lz"

	.align 2
DroughtPaletteData_4: @ 8395FBC
	.incbin "graphics/weather/drought4.bin.lz"

	.align 2
DroughtPaletteData_5: @ 8396784
	.incbin "graphics/weather/drought5.bin.lz"

	.align 2
gUnknown_08396FA8:: @ 8396FA8
	.4byte DroughtPaletteData_0
	.4byte DroughtPaletteData_1
	.4byte DroughtPaletteData_2
	.4byte DroughtPaletteData_3
	.4byte DroughtPaletteData_4
	.4byte DroughtPaletteData_5
	.4byte 0x2000000

	.align 2
gUnknown_08396FC4:: @ 8396FC4
	.4byte gUnknown_0202F7E8

	.align 2
gUnknown_08396FC8:: @ 8396FC8
	.4byte sub_807CAE8, nullsub_38, sub_807CAE8, sub_807CB0C
	.4byte sub_807DE78, sub_807DEF4, sub_807DEC4, sub_807DF54
	.4byte sub_807DF9C, nullsub_55, sub_807DFC0, sub_807DFD0
	.4byte sub_807E364, sub_807E400, sub_807E3D0, sub_807E460
	.4byte sub_807E9C8, snowflakes_progress2, sub_807EA18, sub_807EAC0
	.4byte sub_807EE80, sub_807EFC0, sub_807EEF4, sub_807F34C
	.4byte sub_807F49C, sub_807F52C, sub_807F4FC, sub_807F5EC
	.4byte sub_807F7F8, sub_807F888, sub_807F858, sub_807F934
	.4byte sub_807FE9C, sub_807FF4C, sub_807FF1C, sub_807FFC8
	.4byte sub_807FB24, sub_807FBD8, sub_807FBA8, sub_807FC3C
	.4byte sub_807F49C, sub_807F52C, sub_807F4FC, sub_807F5EC
	.4byte sub_8080430, nullsub_56, sub_8080460, sub_8080470
	.4byte sub_807E110, sub_807E174, sub_807E144, sub_807E258
	.4byte sub_807EF24, sub_807EFC0, sub_807EF90, sub_807F34C
	.4byte sub_8080474, sub_80804F8, sub_80804C8, sub_808056C

	.align 2
gUnknown_083970B8:: @ 83970B8
	.4byte sub_807CC24
	.4byte sub_807CCAC
	.4byte nullsub_39
	.4byte nullsub_39

gUnknown_083970C8:: @ 83970C8
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.byte 2
	.byte 1
	.byte 2
	.byte 2
	.byte 2
	.byte 2
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 2
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1

	.align 2
gUnknown_083970E8:: @ 83970E8
	.incbin "graphics/weather/0.gbapal"

	.align 2
gUnknown_08397108:: @ 8397108
	.incbin "graphics/weather/1.gbapal"

	.align 2
gUnknown_08397128:: @ 8397128
	.incbin "graphics/weather/2.gbapal"

	.align 2
WeatherFog0Tiles: @ 8397148
	.incbin "graphics/weather/fog0.4bpp"

	.align 2
gWeatherFog1Tiles:: @ 8397948
	.incbin "graphics/weather/fog1.4bpp"

	.align 2
WeatherCloudTiles: @ 8398148
	.incbin "graphics/weather/cloud.4bpp"

	.align 2
gSpriteImage_8398948:: @ 8398948
	.incbin "graphics/weather/snow0.4bpp"

	.align 2
gSpriteImage_8398968:: @ 8398968
	.incbin "graphics/weather/snow1.4bpp"

	.align 2
WeatherBubbleTiles: @ 8398988
	.incbin "graphics/weather/bubble.4bpp"

	.align 2
WeatherAshTiles: @ 83989C8
	.incbin "graphics/weather/ash.4bpp"

	.align 2
WeatherRainTiles: @ 83999C8
	.incbin "graphics/weather/rain.4bpp"

	.align 2
WeatherSandstormTiles: @ 8399FC8
	.incbin "graphics/weather/sandstorm.4bpp"

	.align 1
gUnknown_0839A9C8:: @ 839A9C8
	.2byte  0, 66
	.2byte  5, 73
	.2byte 10, 78

	.align 2
gUnknown_0839A9D4:: @ 839A9D4
	obj_tiles WeatherCloudTiles, 0x800, 0x1200

	.align 2
gOamData_839A9DC:: @ 839A9DC
	.2byte 0x0400
	.2byte 0xC000
	.2byte 0x0C00

	.align 2
gSpriteAnim_839A9E4:: @ 839A9E4
	obj_image_anim_frame 0, 16
	obj_image_anim_end

	.align 2
gSpriteAnimTable_839A9EC:: @ 839A9EC
	.4byte gSpriteAnim_839A9E4

	.align 2
gSpriteTemplate_839A9F0:: @ 839A9F0
	spr_template 4608, 4609, gOamData_839A9DC, gSpriteAnimTable_839A9EC, NULL, gDummySpriteAffineAnimTable, sub_807E0F4

	.align 1
gUnknown_0839AA08:: @ 839AA08
	.2byte   0,   0
	.2byte   0, 160
	.2byte   0,  64
	.2byte 144, 224
	.2byte 144, 128
	.2byte  32,  32
	.2byte  32, 192
	.2byte  32,  96
	.2byte  72, 128
	.2byte  72,  32
	.2byte  72, 192
	.2byte 216,  96
	.2byte 216,   0
	.2byte 104, 160
	.2byte 104,  64
	.2byte 104, 224
	.2byte 144,   0
	.2byte 144, 160
	.2byte 144,  64
	.2byte  32, 224
	.2byte  32, 128
	.2byte  72,  32
	.2byte  72, 192
	.2byte  48,  96

	.align 2
gOamData_839AA68:: @ 839AA68
	.2byte 0x8000
	.2byte 0x8000
	.2byte 0x2400

	.align 2
gSpriteAnim_839AA70:: @ 839AA70
	obj_image_anim_frame 0, 16
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_839AA78:: @ 839AA78
	obj_image_anim_frame 8, 3
	obj_image_anim_frame 32, 2
	obj_image_anim_frame 40, 2
	obj_image_anim_end

	.align 2
gSpriteAnim_839AA88:: @ 839AA88
	obj_image_anim_frame 8, 3
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 24, 4
	obj_image_anim_end

	.align 2
gSpriteAnimTable_839AA98:: @ 839AA98
	.4byte gSpriteAnim_839AA70
	.4byte gSpriteAnim_839AA78
	.4byte gSpriteAnim_839AA88

	.align 2
gSpriteTemplate_839AAA4:: @ 839AAA4
	spr_template 4614, 4608, gOamData_839AA68, gSpriteAnimTable_839AA98, NULL, gDummySpriteAffineAnimTable, sub_807E5C0

	.align 1
gUnknown_0839AABC:: @ 839AABC
	.2byte -104, 208
	.2byte -160, 320

	.align 1
gUnknown_0839AAC4:: @ 839AAC4
	.2byte 18, 7, 12, 10

	.align 2
gUnknown_0839AACC:: @ 839AACC
	obj_tiles WeatherRainTiles, 0x600, 0x1206

	.align 2
gOamData_839AAD4:: @ 839AAD4
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0400

	.align 2
gSpriteImageTable_839AADC:: @ 839AADC
	obj_frame_tiles gSpriteImage_8398948, 0x20
	obj_frame_tiles gSpriteImage_8398968, 0x20

	.align 2
gSpriteAnim_839AAEC:: @ 839AAEC
	obj_image_anim_frame 0, 16
	obj_image_anim_end

	.align 2
gSpriteAnim_839AAF4:: @ 839AAF4
	obj_image_anim_frame 1, 16
	obj_image_anim_end

	.align 2
gSpriteAnimTable_839AAFC:: @ 839AAFC
	.4byte gSpriteAnim_839AAEC
	.4byte gSpriteAnim_839AAF4

	.align 2
gSpriteTemplate_839AB04:: @ 839AB04
	spr_template 0xFFFF, 4608, gOamData_839AAD4, gSpriteAnimTable_839AAFC, gSpriteImageTable_839AADC, gDummySpriteAffineAnimTable, sub_807ED48

@ unused data
	.2byte   0
	.2byte   6
	.2byte   6
	.2byte  12
	.2byte  18
	.2byte  42
	.2byte 300
	.2byte 300

	.align 2
gOamData_839AB2C:: @ 839AB2C
	.2byte 0x0400
	.2byte 0xC000
	.2byte 0x0800

	.align 2
gSpriteAnim_839AB34:: @ 839AB34
	obj_image_anim_frame 0, 16
	obj_image_anim_end

	.align 2
gSpriteAnim_839AB3C:: @ 839AB3C
	obj_image_anim_frame 32, 16
	obj_image_anim_end

	.align 2
gSpriteAnim_839AB44:: @ 839AB44
	obj_image_anim_frame 64, 16
	obj_image_anim_end

	.align 2
gSpriteAnim_839AB4C:: @ 839AB4C
	obj_image_anim_frame 96, 16
	obj_image_anim_end

	.align 2
gSpriteAnim_839AB54:: @ 839AB54
	obj_image_anim_frame 128, 16
	obj_image_anim_end

	.align 2
gSpriteAnim_839AB5C:: @ 839AB5C
	obj_image_anim_frame 160, 16
	obj_image_anim_end

	.align 2
gSpriteAnimTable_839AB64:: @ 839AB64
	.4byte gSpriteAnim_839AB34
	.4byte gSpriteAnim_839AB3C
	.4byte gSpriteAnim_839AB44
	.4byte gSpriteAnim_839AB4C
	.4byte gSpriteAnim_839AB54
	.4byte gSpriteAnim_839AB5C

	.align 2
gSpriteAffineAnim_839AB7C:: @ 839AB7C
	obj_rot_scal_anim_frame 0x200, 0x200, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_839AB8C:: @ 839AB8C
	.4byte gSpriteAffineAnim_839AB7C

	.align 2
gSpriteTemplate_839AB90:: @ 839AB90
	spr_template 4609, 4608, gOamData_839AB2C, gSpriteAnimTable_839AB64, NULL, gSpriteAffineAnimTable_839AB8C, sub_807F688

	.align 2
gUnknown_0839ABA8:: @ 839ABA8
	obj_tiles gWeatherFog1Tiles, 0x800, 0x1201

	.align 2
gUnknown_0839ABB0:: @ 839ABB0
	obj_tiles WeatherAshTiles, 0x1000, 0x1202

	.align 2
gOamData_839ABB8:: @ 839ABB8
	.2byte 0x0400
	.2byte 0xC000
	.2byte 0xF400

	.align 2
gSpriteAnim_839ABC0:: @ 839ABC0
	obj_image_anim_frame 0, 60
	obj_image_anim_frame 64, 60
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_839ABCC:: @ 839ABCC
	.4byte gSpriteAnim_839ABC0

	.align 2
gSpriteTemplate_839ABD0:: @ 839ABD0
	spr_template 4610, 4608, gOamData_839ABB8, gSpriteAnimTable_839ABCC, NULL, gDummySpriteAffineAnimTable, sub_807FAA8

	.align 2
gUnknown_0839ABE8:: @ 839ABE8
	obj_tiles WeatherFog0Tiles, 0x800, 0x1203

	.align 2
gOamData_839ABF0:: @ 839ABF0
	.2byte 0x0400
	.2byte 0xC000
	.2byte 0x0800

	.align 2
gSpriteAnim_839ABF8:: @ 839ABF8
	obj_image_anim_frame 0, 16
	obj_image_anim_end

	.align 2
gSpriteAnimTable_839AC00:: @ 839AC00
	.4byte gSpriteAnim_839ABF8

	.align 2
gSpriteTemplate_839AC04:: @ 839AC04
	spr_template 4611, 4608, gOamData_839ABF0, gSpriteAnimTable_839AC00, NULL, gDummySpriteAffineAnimTable, sub_807FE3C

	.align 2
gOamData_839AC1C:: @ 839AC1C
	.2byte 0x0400
	.2byte 0xC000
	.2byte 0x0400

	.align 2
gSpriteAnim_839AC24:: @ 839AC24
	obj_image_anim_frame 0, 3
	obj_image_anim_end

	.align 2
gSpriteAnim_839AC2C:: @ 839AC2C
	obj_image_anim_frame 64, 3
	obj_image_anim_end

	.align 2
gSpriteAnimTable_839AC34:: @ 839AC34
	.4byte gSpriteAnim_839AC24
	.4byte gSpriteAnim_839AC2C

	.align 2
gSpriteTemplate_839AC3C:: @ 839AC3C
	spr_template 4612, 4609, gOamData_839AC1C, gSpriteAnimTable_839AC34, NULL, gDummySpriteAffineAnimTable, sub_8080338

	.align 2
gUnknown_0839AC54:: @ 839AC54
	obj_tiles WeatherSandstormTiles, 0xA00, 0x1204

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
gUnknown_0839AC70:: @ 839AC70
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
