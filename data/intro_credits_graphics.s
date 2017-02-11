	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

gUnknown_084121FC:: @ 84121FC
	.incbin "graphics/intro/intro2_grass.gbapal"

gUnknown_0841221C:: @ 841221C
	.incbin "graphics/intro/intro2_grass_afternoon.gbapal"

gUnknown_0841223C:: @ 841223C
	.incbin "graphics/intro/intro2_grass_night.gbapal"

	.align 2
gUnknown_0841225C:: @ 841225C
	.incbin "graphics/intro/intro2_grass.4bpp.lz"

	.align 2
gUnknown_084126DC:: @ 84126DC
	.incbin "graphics/intro/intro2_grass_map.bin.lz"

gUnknown_08412818:: @ 8412818
	.incbin "graphics/intro/8412818.gbapal"

gUnknown_08412878:: @ 8412878
	.incbin "graphics/intro/8412878.gbapal"

	.align 2
gUnknown_084128D8:: @ 84128D8
	.incbin "graphics/intro/intro2_bgclouds.4bpp.lz"

	.align 2
gUnknown_08412EB4:: @ 8412EB4
	.incbin "graphics/intro/intro2_bgclouds_map.bin.lz"

gUnknown_08413184:: @ 8413184
	.incbin "graphics/intro/intro2_bgclouds.gbapal"

gUnknown_084131A4:: @ 84131A4
	.incbin "graphics/intro/intro2_bgclouds_afternoon.gbapal"

gUnknown_084131C4:: @ 84131C4
	.incbin "graphics/intro/intro2_bgclouds2.4bpp.lz"

gUnknown_08413300:: @ 8413300
	.incbin "graphics/intro/intro2_bgtrees2.gbapal"

gUnknown_08413320:: @ 8413320
	.incbin "graphics/intro/intro2_bgtrees2_afternoon.gbapal"

	.align 2
gUnknown_08413340:: @ 8413340
	.incbin "graphics/intro/intro2_bgtrees.4bpp.lz"

	.align 2
gUnknown_084139C8:: @ 84139C8
	.incbin "graphics/intro/intro2_bgtrees_map.bin.lz"

	.align 2
gUnknown_08413CCC:: @ 8413CCC
	.incbin "graphics/intro/intro2_bgtrees.gbapal"

	.align 2
gIntro2TreeTiles:: @ 8413CEC
	.incbin "graphics/intro/intro2_bgtreessmall.4bpp.lz"

gUnknown_08413E38:: @ 8413E38
	.incbin "graphics/intro/8413E38.gbapal"

	.align 2
gUnknown_08413E78:: @ 8413E78
	.incbin "graphics/intro/intro2_bgnight.4bpp.lz" @ only used in credits, coupled with intro because bicycle sequence

	.align 2
gUnknown_08414064:: @ 8414064
	.incbin "graphics/intro/intro2_bgnight.gbapal"

	.align 2
gUnknown_08414084:: @ 8414084
	.incbin "graphics/intro/intro2_bgnight_map.bin.lz"

	.align 2
gIntro2NightTiles:: @ 8414330
	.incbin "graphics/intro/intro2_night.4bpp.lz"

	.align 1
gIntro2BrendanPalette:: @ 84143B4
	.incbin "graphics/intro/intro2_brendan.gbapal"

	.align 2
gIntro2BrendanTiles:: @ 84143D4
	.incbin "graphics/intro/intro2_brendan.4bpp.lz"

	.align 1
gIntro2MayPalette:: @ 8414F70
	.incbin "graphics/intro/intro2_may.gbapal"

	.align 2
gUnknown_08414F90:: @ 8414F90
	.space 0x1E0

	.align 2
gIntro2MayTiles:: @ 8415170
	.incbin "graphics/intro/intro2_may.4bpp.lz"

	.align 2
gIntro2BicycleTiles:: @ 8415E08
	.incbin "graphics/intro/intro2_bicycle.4bpp.lz"

	.align 1
gIntro2LatiosPalette:: @ 8416234
	.incbin "graphics/intro/intro2_latios.gbapal"

	.align 2
gIntro2LatiosTiles:: @ 8416254
	.incbin "graphics/intro/intro2_latios.4bpp.lz"

	.align 1
gIntro2LatiasPalette:: @ 84166F8
	.incbin "graphics/intro/intro2_latias.gbapal"

	.align 2
gIntro2LatiasTiles:: @ 8416718
	.incbin "graphics/intro/intro2_latias.4bpp.lz"

	.align 2
gSpriteTemplate_8416B3C:: @ 8416B3C
	spr_template 2000, 0xFFFF, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_814910C

	.align 2
gUnknown_08416B54:: @ 8416B54
	obj_tiles gUnknown_084131C4, 0x400, 2000
	null_obj_tiles

	.align 2
gSpriteAnim_8416B64:: @ 8416B64
	obj_image_anim_frame 0, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_8416B6C:: @ 8416B6C
	obj_image_anim_frame 16, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_8416B74:: @ 8416B74
	obj_image_anim_frame 20, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_8416B7C:: @ 8416B7C
	obj_image_anim_frame 22, 30
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8416B84:: @ 8416B84
	.4byte gSpriteAnim_8416B64
	.4byte gSpriteAnim_8416B6C
	.4byte gSpriteAnim_8416B74
	.4byte gSpriteAnim_8416B7C

gUnknown_08416B94:: @ 8416B94
	.incbin "baserom.gba", 0x00416b94, 0x48

	.align 2
gUnknown_08416BDC:: @ 8416BDC
	obj_tiles gIntro2TreeTiles, 0x400, 2000
	null_obj_tiles

	.align 2
gSpriteAnim_8416BEC:: @ 8416BEC
	obj_image_anim_frame 0, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_8416BF4:: @ 8416BF4
	obj_image_anim_frame 16, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_8416BFC:: @ 8416BFC
	obj_image_anim_frame 24, 30
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8416C04:: @ 8416C04
	.4byte gSpriteAnim_8416BEC
	.4byte gSpriteAnim_8416BF4
	.4byte gSpriteAnim_8416BFC

gUnknown_08416C10:: @ 8416C10
	.incbin "baserom.gba", 0x00416c10, 0x60

	.align 2
gUnknown_08416C70:: @ 8416C70
	obj_tiles gIntro2NightTiles, 0x400, 2000
	null_obj_tiles

	.align 2
gSpriteAnim_8416C80:: @ 8416C80
	obj_image_anim_frame 0, 30
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8416C88:: @ 8416C88
	.4byte gSpriteAnim_8416C80

gUnknown_08416C8C:: @ 8416C8C
	.incbin "baserom.gba", 0x00416c8c, 0x30

	.align 2
gOamData_8416CBC:: @ 8416CBC
	.2byte 0x00A0
	.2byte 0xC000
	.2byte 0x0400

	.align 2
gSpriteAnim_8416CC4:: @ 8416CC4
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 64, 8
	obj_image_anim_frame 128, 8
	obj_image_anim_frame 192, 8
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_8416CD8:: @ 8416CD8
	.4byte gSpriteAnim_8416CC4

	.align 2
gSpriteTemplate_8416CDC:: @ 8416CDC
	spr_template 1002, 1002, gOamData_8416CBC, gSpriteAnimTable_8416CD8, NULL, gDummySpriteAffineAnimTable, nullsub_82

	.align 2
gSpriteTemplate_8416CF4:: @ 8416CF4
	spr_template 1003, 1003, gOamData_8416CBC, gSpriteAnimTable_8416CD8, NULL, gDummySpriteAffineAnimTable, nullsub_82

	.align 2
gOamData_8416D0C:: @ 8416D0C
	.2byte 0x40A0
	.2byte 0xC000
	.2byte 0x0400

	.align 2
gSpriteAnim_8416D14:: @ 8416D14
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 32, 8
	obj_image_anim_frame 64, 8
	obj_image_anim_frame 96, 8
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_8416D28:: @ 8416D28
	.4byte gSpriteAnim_8416D14

	.align 2
gSpriteTemplate_8416D2C:: @ 8416D2C
	spr_template 1001, 1002, gOamData_8416D0C, gSpriteAnimTable_8416D28, NULL, gDummySpriteAffineAnimTable, sub_81492A0

	.align 2
gSpriteTemplate_8416D44:: @ 8416D44
	spr_template 1001, 1003, gOamData_8416D0C, gSpriteAnimTable_8416D28, NULL, gDummySpriteAffineAnimTable, sub_81492A0

	.align 2
gOamData_8416D5C:: @ 8416D5C
	.2byte 0x00A0
	.2byte 0xC000
	.2byte 0x0400

	.align 2
gSpriteAnim_8416D64:: @ 8416D64
	obj_image_anim_frame 0, 16
	obj_image_anim_end

	.align 2
gSpriteAnim_8416D6C:: @ 8416D6C
	obj_image_anim_frame 64, 16
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8416D74:: @ 8416D74
	.4byte gSpriteAnim_8416D64
	.4byte gSpriteAnim_8416D6C

	.align 2
gSpriteTemplate_8416D7C:: @ 8416D7C
	spr_template 1004, 1004, gOamData_8416D5C, gSpriteAnimTable_8416D74, NULL, gDummySpriteAffineAnimTable, nullsub_83

	.align 2
gSpriteTemplate_8416D94:: @ 8416D94
	spr_template 1005, 1005, gOamData_8416D5C, gSpriteAnimTable_8416D74, NULL, gDummySpriteAffineAnimTable, nullsub_83

	.align 2
gIntro2BrendanSpriteSheet:: @ 8416DAC
	obj_tiles gIntro2BrendanTiles, 0x3800, 1002
	.space 8

	.align 2
gIntro2MaySpriteSheet:: @ 8416DBC
	obj_tiles gIntro2MayTiles, 0x3800, 1003
	.space 8

	.align 2
gIntro2BicycleSpriteSheet:: @ 8416DCC
	obj_tiles gIntro2BicycleTiles, 0x1000, 1001
	.space 8

	.align 2
gIntro2LatiosSpriteSheet:: @ 8416DDC
	obj_tiles gIntro2LatiosTiles, 0x1000, 1004
	.space 8

	.align 2
gIntro2LatiasSpriteSheet:: @ 8416DEC
	obj_tiles gIntro2LatiasTiles, 0x1000, 1005
	.space 8

	.align 2
gIntro2SpritePalettes:: @ 8416DFC
	obj_pal gIntro2BrendanPalette, 1002
	obj_pal gIntro2MayPalette,     1003
	obj_pal gIntro2LatiosPalette,  1004
	obj_pal gIntro2LatiasPalette,  1005
	.space 8

gUnknown_08416E24:: @ 8416E24
	obj_tiles gIntro2BrendanTiles, 0x2000, 1002
	.space 8

gUnknown_08416E34:: @ 8416E34
	obj_tiles gIntro2MayTiles, 0x2000, 1003
	.space 8
