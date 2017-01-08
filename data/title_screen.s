	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_08393210:: @ 8393210
	.ifdef SAPPHIRE
	.incbin "graphics/title_screen/kyogre_dark.gbapal"
	.incbin "graphics/title_screen/kyogre_glow.gbapal"
	.else
	.incbin "graphics/title_screen/groudon_dark.gbapal"
	.incbin "graphics/title_screen/groudon_glow.gbapal"
	.endif

	.align 2
gUnknown_08393250:: @ 8393250
	.ifdef SAPPHIRE
	.incbin "graphics/title_screen/kyogre.4bpp.lz"
	.else
	.incbin "graphics/title_screen/groudon.4bpp.lz"
	.endif

	.align 2
gUnknown_083939EC:: @ 83939EC
	.ifdef SAPPHIRE
	.incbin "graphics/title_screen/kyogre_map.bin.lz"
	.else
	.incbin "graphics/title_screen/groudon_map.bin.lz"
	.endif

	.align 2
gUnknown_08393BF8:: @ 8393BF8
	.ifdef SAPPHIRE
	.incbin "graphics/title_screen/water_map.bin.lz"
	.else
	.incbin "graphics/title_screen/lava_map.bin.lz"
	.endif

	.align 2
LogoShineTiles: @ 8393D14
	.incbin "graphics/title_screen/logo_shine.4bpp.lz"

	.align 1
gUnknown_08393E64:: @ 8393E64
	.2byte   0x10
	.2byte  0x110
	.2byte  0x210
	.2byte  0x310
	.2byte  0x410
	.2byte  0x510
	.2byte  0x610
	.2byte  0x710
	.2byte  0x810
	.2byte  0x910
	.2byte  0xA10
	.2byte  0xB10
	.2byte  0xC10
	.2byte  0xD10
	.2byte  0xE10
	.2byte  0xF10
	.2byte 0x100F
	.2byte 0x100E
	.2byte 0x100D
	.2byte 0x100C
	.2byte 0x100B
	.2byte 0x100A
	.2byte 0x1009
	.2byte 0x1008
	.2byte 0x1007
	.2byte 0x1006
	.2byte 0x1005
	.2byte 0x1004
	.2byte 0x1003
	.2byte 0x1002
	.2byte 0x1001
	.2byte 0x1000

	.align 2
gOamData_8393EA4:: @ 8393EA4
	.2byte 0x60A0
	.2byte 0xC000
	.2byte 0x0000

	.align 2
gOamData_8393EAC:: @ 8393EAC
	.2byte 0x60A0
	.2byte 0xC000
	.2byte 0x0000

	.align 2
gSpriteAnim_8393EB4:: @ 8393EB4
	obj_image_anim_frame 0, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_8393EBC:: @ 8393EBC
	obj_image_anim_frame 64, 30
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8393EC4:: @ 8393EC4
	.4byte gSpriteAnim_8393EB4

	.align 2
gSpriteAnimTable_8393EC8:: @ 8393EC8
	.4byte gSpriteAnim_8393EBC

	.align 2
gSpriteTemplate_8393ECC:: @ 8393ECC
	spr_template 1000, 1000, gOamData_8393EA4, gSpriteAnimTable_8393EC4, NULL, gDummySpriteAffineAnimTable, SpriteCallback_VersionBannerLeft

	.align 2
gSpriteTemplate_8393EE4:: @ 8393EE4
	spr_template 1000, 1000, gOamData_8393EAC, gSpriteAnimTable_8393EC8, NULL, gDummySpriteAffineAnimTable, SpriteCallback_VersionBannerRight

	.align 2
gUnknown_08393EFC:: @ 8393EFC
	obj_tiles gVersionTiles, 0x1000, 1000
	null_obj_tiles

	.align 2
gOamData_8393F0C:: @ 8393F0C
	.2byte 0x40A0
	.2byte 0x4000
	.2byte 0x0000

	.align 2
gSpriteAnim_8393F14:: @ 8393F14
	obj_image_anim_frame 0, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_8393F1C:: @ 8393F1C
	obj_image_anim_frame 4, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_8393F24:: @ 8393F24
	obj_image_anim_frame 8, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_8393F2C:: @ 8393F2C
	obj_image_anim_frame 12, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_8393F34:: @ 8393F34
	obj_image_anim_frame 16, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_8393F3C:: @ 8393F3C
	obj_image_anim_frame 20, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_8393F44:: @ 8393F44
	obj_image_anim_frame 24, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_8393F4C:: @ 8393F4C
	obj_image_anim_frame 28, 4
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8393F54:: @ 8393F54
	.4byte gSpriteAnim_8393F14
	.4byte gSpriteAnim_8393F1C
	.4byte gSpriteAnim_8393F24
	.4byte gSpriteAnim_8393F2C
	.4byte gSpriteAnim_8393F34
	.4byte gSpriteAnim_8393F3C
	.4byte gSpriteAnim_8393F44
	.4byte gSpriteAnim_8393F4C

	.align 2
gSpriteTemplate_8393F74:: @ 8393F74
	spr_template 1001, 1001, gOamData_8393F0C, gSpriteAnimTable_8393F54, NULL, gDummySpriteAffineAnimTable, SpriteCallback_PressStartCopyrightBanner

	.align 2
gUnknown_08393F8C:: @ 8393F8C
	obj_tiles gTitleScreenPressStart_Gfx, 0x520, 1001
	null_obj_tiles

	.align 2
gUnknown_08393F9C:: @ 8393F9C
	obj_pal gTitleScreenLogoShinePalette, 1001
	obj_pal 0x0, 0x0

	.align 2
gOamData_8393FAC:: @ 8393FAC
	.2byte 0x00A0
	.2byte 0xC000
	.2byte 0x0000

	.align 2
gSpriteAnim_8393FB4:: @ 8393FB4
	obj_image_anim_frame 0, 4
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8393FBC:: @ 8393FBC
	.4byte gSpriteAnim_8393FB4

	.align 2
gSpriteTemplate_8393FC0:: @ 8393FC0
	spr_template 1002, 1001, gOamData_8393FAC, gSpriteAnimTable_8393FBC, NULL, gDummySpriteAffineAnimTable, SpriteCallback_PokemonLogoShine

	.align 2
gUnknown_08393FD8:: @ 8393FD8
	obj_tiles LogoShineTiles, 0x800, 1002
	null_obj_tiles
