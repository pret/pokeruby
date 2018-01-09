	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gOamData_83B6EAC:: @ 83B6EAC
	.2byte 0x0000
	.2byte 0xC000
	.2byte 0x0000

	.align 2
gOamData_83B6EB4:: @ 83B6EB4
	.2byte 0x4000
	.2byte 0x0000
	.2byte 0x0000

	.align 2
gSpriteAnim_83B6EBC:: @ 83B6EBC
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83B6EC4:: @ 83B6EC4
	obj_image_anim_frame 2, 8
	obj_image_anim_frame 4, 8
	obj_image_anim_frame 6, 8
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83B6ED4:: @ 83B6ED4
	obj_image_anim_frame 8, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83B6EDC:: @ 83B6EDC
	obj_image_anim_frame 10, 8
	obj_image_anim_frame 4, 8
	obj_image_anim_frame 12, 8
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83B6EEC:: @ 83B6EEC
	.4byte gSpriteAnim_83B6EBC
	.4byte gSpriteAnim_83B6EC4
	.4byte gSpriteAnim_83B6ED4
	.4byte gSpriteAnim_83B6EDC

	.align 2
gSpriteTemplate_83B6EFC:: @ 83B6EFC
	spr_template 5, 56013, gOamData_83B6EB4, gSpriteAnimTable_83B6EEC, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_83B6F14:: @ 83B6F14
	spr_template 15, 56000, gOamData_83B6F2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gOamData_83B6F2C:: @ 83B6F2C
	.2byte 0x0000
	.2byte 0x8000
	.2byte 0x0000

	.align 2
gSpriteAffineAnim_83B6F34:: @ 83B6F34
	obj_rot_scal_anim_frame 0xFFFE, 0xFFFE, 0, 120
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83B6F44:: @ 83B6F44
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 0
	obj_rot_scal_anim_frame 0x10, 0x10, 0, 15
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83B6F5C:: @ 83B6F5C
	.4byte gSpriteAffineAnim_83B6F34
	.4byte gSpriteAffineAnim_83B6F44

	.align 2
gWallpaperPalettes_Forest: @ 83B6F64
	.incbin "graphics/pokemon_storage/box_bg1.gbapal"
	.incbin "graphics/pokemon_storage/forest_frame.gbapal"
	.incbin "graphics/pokemon_storage/forest_bg.gbapal"

	.align 2
gWallpaperTiles_Forest: @ 83B6FC4
	.incbin "graphics/pokemon_storage/forest.4bpp.lz"

	.align 2
gWallpaperTilemap_Forest: @ 83B7394
	.incbin "graphics/pokemon_storage/forest.bin.lz"

	.align 2
gWallpaperPalettes_City: @ 83B7470
	.incbin "graphics/pokemon_storage/box_bg1.gbapal"
	.incbin "graphics/pokemon_storage/city_frame.gbapal"
	.incbin "graphics/pokemon_storage/city_bg.gbapal"

	.align 2
gWallpaperTiles_City: @ 83B74D0
	.incbin "graphics/pokemon_storage/city.4bpp.lz"

	.align 2
gWallpaperTilemap_City: @ 83B76D8
	.incbin "graphics/pokemon_storage/city.bin.lz"

	.align 2
gWallpaperPalettes_Desert: @ 83B7788
	.incbin "graphics/pokemon_storage/box_bg1.gbapal"
	.incbin "graphics/pokemon_storage/desert_frame.gbapal"
	.incbin "graphics/pokemon_storage/desert_bg.gbapal"

	.align 2
gWallpaperTiles_Desert: @ 83B77E8
	.incbin "graphics/pokemon_storage/desert.4bpp.lz"

	.align 2
gWallpaperTilemap_Desert: @ 83B7AD4
	.incbin "graphics/pokemon_storage/desert.bin.lz"

	.align 2
gWallpaperPalettes_Savanna: @ 83B7BB8
	.incbin "graphics/pokemon_storage/box_bg1.gbapal"
	.incbin "graphics/pokemon_storage/savanna_frame.gbapal"
	.incbin "graphics/pokemon_storage/savanna_bg.gbapal"

	.align 2
gWallpaperTiles_Savanna: @ 83B7C18
	.incbin "graphics/pokemon_storage/savanna.4bpp.lz"

	.align 2
gWallpaperTilemap_Savanna: @ 83B7E38
	.incbin "graphics/pokemon_storage/savanna.bin.lz"

	.align 2
gWallpaperPalettes_Crag: @ 83B7F04
	.incbin "graphics/pokemon_storage/box_bg1.gbapal"
	.incbin "graphics/pokemon_storage/crag_frame.gbapal"
	.incbin "graphics/pokemon_storage/crag_bg.gbapal"

	.align 2
gWallpaperTiles_Crag: @ 83B7F64
	.incbin "graphics/pokemon_storage/crag.4bpp.lz"

	.align 2
gWallpaperTilemap_Crag: @ 83B82B4
	.incbin "graphics/pokemon_storage/crag.bin.lz"

	.align 2
gWallpaperPalettes_Volcano: @ 83B838C
	.incbin "graphics/pokemon_storage/box_bg1.gbapal"
	.incbin "graphics/pokemon_storage/volcano_frame.gbapal"
	.incbin "graphics/pokemon_storage/volcano_bg.gbapal"

	.align 2
gWallpaperTiles_Volcano: @ 83B83EC
	.incbin "graphics/pokemon_storage/volcano.4bpp.lz"

	.space 4

	.align 2
gWallpaperTilemap_Volcano: @ 83B8720
	.incbin "graphics/pokemon_storage/volcano.bin.lz"

	.align 2
gWallpaperPalettes_Snow: @ 83B87F8
	.incbin "graphics/pokemon_storage/box_bg1.gbapal"
	.incbin "graphics/pokemon_storage/snow_frame.gbapal"
	.incbin "graphics/pokemon_storage/snow_bg.gbapal"

	.align 2
gWallpaperTiles_Snow: @ 83B8858
	.incbin "graphics/pokemon_storage/snow.4bpp.lz"

	.align 2
gWallpaperTilemap_Snow: @ 83B8B10
	.incbin "graphics/pokemon_storage/snow.bin.lz"

	.align 2
gWallpaperPalettes_Cave: @ 83B8BDC
	.incbin "graphics/pokemon_storage/box_bg1.gbapal"
	.incbin "graphics/pokemon_storage/cave_frame.gbapal"
	.incbin "graphics/pokemon_storage/cave_bg.gbapal"

	.align 2
gWallpaperTiles_Cave: @ 83B8C3C
	.incbin "graphics/pokemon_storage/cave.4bpp.lz"

	.align 2
gWallpaperTilemap_Cave: @ 83B8F80
	.incbin "graphics/pokemon_storage/cave.bin.lz"

	.align 2
gWallpaperPalettes_Beach: @ 83B905C
	.incbin "graphics/pokemon_storage/box_bg1.gbapal"
	.incbin "graphics/pokemon_storage/beach_frame.gbapal"
	.incbin "graphics/pokemon_storage/beach_bg.gbapal"

	.align 2
gWallpaperTiles_Beach: @ 83B90BC
	.incbin "graphics/pokemon_storage/beach.4bpp.lz"

	.align 2
gWallpaperTilemap_Beach: @ 83B9440
	.incbin "graphics/pokemon_storage/beach.bin.lz"

	.align 2
gWallpaperPalettes_Seafloor: @ 83B9528
	.incbin "graphics/pokemon_storage/box_bg1.gbapal"
	.incbin "graphics/pokemon_storage/seafloor_frame.gbapal"
	.incbin "graphics/pokemon_storage/seafloor_bg.gbapal"

	.align 2
gWallpaperTiles_Seafloor: @ 83B9588
	.incbin "graphics/pokemon_storage/seafloor.4bpp.lz"

	.align 2
gWallpaperTilemap_Seafloor: @ 83B983C
	.incbin "graphics/pokemon_storage/seafloor.bin.lz"

	.align 2
gWallpaperPalettes_River: @ 83B9918
	.incbin "graphics/pokemon_storage/box_bg1.gbapal"
	.incbin "graphics/pokemon_storage/river_frame.gbapal"
	.incbin "graphics/pokemon_storage/river_bg.gbapal"

	.align 2
gWallpaperTiles_River: @ 83B9978
	.incbin "graphics/pokemon_storage/river.4bpp.lz"

	.align 2
gWallpaperTilemap_River: @ 83B9C0C
	.incbin "graphics/pokemon_storage/river.bin.lz"

	.align 2
gWallpaperPalettes_Sky: @ 83B9CF8
	.incbin "graphics/pokemon_storage/box_bg1.gbapal"
	.incbin "graphics/pokemon_storage/sky_frame.gbapal"
	.incbin "graphics/pokemon_storage/sky_bg.gbapal"

	.align 2
gWallpaperTiles_Sky: @ 83B9D58
	.incbin "graphics/pokemon_storage/sky.4bpp.lz"

	.align 2
gWallpaperTilemap_Sky: @ 83B9FF0
	.incbin "graphics/pokemon_storage/sky.bin.lz"

	.align 2
gWallpaperPalettes_Polkadot: @ 83BA0D0
	.incbin "graphics/pokemon_storage/box_bg2.gbapal"
	.incbin "graphics/pokemon_storage/polkadot_frame.gbapal"
	.incbin "graphics/pokemon_storage/polkadot_bg.gbapal"

	.align 2
gWallpaperTiles_Polkadot: @ 83BA130
	.incbin "graphics/pokemon_storage/polkadot.4bpp.lz"

	.align 2
gWallpaperTilemap_Polkadot: @ 83BA32C
	.incbin "graphics/pokemon_storage/polkadot.bin.lz"

	.align 2
gWallpaperPalettes_Pokecenter: @ 83BA3E4
	.incbin "graphics/pokemon_storage/box_bg2.gbapal"
	.incbin "graphics/pokemon_storage/pokecenter_frame.gbapal"
	.incbin "graphics/pokemon_storage/pokecenter_bg.gbapal"

	.align 2
gWallpaperTiles_Pokecenter: @ 83BA444
	.incbin "graphics/pokemon_storage/pokecenter.4bpp.lz"

	.align 2
gWallpaperTilemap_Pokecenter: @ 83BA7E8
	.incbin "graphics/pokemon_storage/pokecenter.bin.lz"

	.align 2
gWallpaperPalettes_Machine: @ 83BA8FC
	.incbin "graphics/pokemon_storage/box_bg3.gbapal"
	.incbin "graphics/pokemon_storage/machine_frame.gbapal"
	.incbin "graphics/pokemon_storage/machine_bg.gbapal"

	.align 2
gWallpaperTiles_Machine: @ 83BA95C
	.incbin "graphics/pokemon_storage/machine.4bpp.lz"

	.align 2
gWallpaperTilemap_Machine: @ 83BAC4C
	.incbin "graphics/pokemon_storage/machine.bin.lz"

	.align 2
gWallpaperPalettes_Plain: @ 83BAD18
	.incbin "graphics/pokemon_storage/box_bg4.gbapal"
	.incbin "graphics/pokemon_storage/plain_frame.gbapal"
	.incbin "graphics/pokemon_storage/plain_bg.gbapal"

	.align 2
gWallpaperTiles_Plain: @ 83BAD78
	.incbin "graphics/pokemon_storage/plain.4bpp.lz"

	.align 2
gWallpaperTilemap_Plain: @ 83BAE74
	.incbin "graphics/pokemon_storage/plain.bin.lz"

@ 12×18 tilemap
	.incbin "graphics/unused/tilemap_3BAEF8.bin"

	.align 1
gUnknown_083BB0A8:: @ 83BB0A8
	.2byte 0x1CE7, 0x7FFF
	.2byte 0x1CE7, 0x7FFF
	.2byte 0x1CE7, 0x7FFF
	.2byte 0x1CE7, 0x7FFF
	.2byte 0x1CE7, 0x7FFF
	.2byte 0x1CE7, 0x7FFF
	.2byte 0x1CE7, 0x7FFF
	.2byte 0x1CE7, 0x7FFF
	.2byte 0x1CE7, 0x7FFF
	.2byte 0x1CE7, 0x7FFF
	.2byte 0x1CE7, 0x7FFF
	.2byte 0x1CE7, 0x7FFF
	.2byte 0x1CE7, 0x7FFF
	.2byte 0x1CE7, 0x7FFF
	.2byte 0x1CE7, 0x7FFF
	.2byte 0x1CE7, 0x7FFF

	.align 2
gWallpaperTable:: @ 83BB0E8
	@ Forest
	.4byte gWallpaperTiles_Forest
	.4byte 0x3D0
	.4byte gWallpaperTilemap_Forest
	.4byte gWallpaperPalettes_Forest

	@ City
	.4byte gWallpaperTiles_City
	.4byte 0x208
	.4byte gWallpaperTilemap_City
	.4byte gWallpaperPalettes_City

	@ Desert
	.4byte gWallpaperTiles_Desert
	.4byte 0x2EC
	.4byte gWallpaperTilemap_Desert
	.4byte gWallpaperPalettes_Desert

	@ Savanna
	.4byte gWallpaperTiles_Savanna
	.4byte 0x220
	.4byte gWallpaperTilemap_Savanna
	.4byte gWallpaperPalettes_Savanna

	@ Crag
	.4byte gWallpaperTiles_Crag
	.4byte 0x350
	.4byte gWallpaperTilemap_Crag
	.4byte gWallpaperPalettes_Crag

	@ Volcano
	.4byte gWallpaperTiles_Volcano
	.4byte 0x334
	.4byte gWallpaperTilemap_Volcano
	.4byte gWallpaperPalettes_Volcano

	@ Snow
	.4byte gWallpaperTiles_Snow
	.4byte 0x2B8
	.4byte gWallpaperTilemap_Snow
	.4byte gWallpaperPalettes_Snow

	@ Cave
	.4byte gWallpaperTiles_Cave
	.4byte 0x344
	.4byte gWallpaperTilemap_Cave
	.4byte gWallpaperPalettes_Cave

	@ Beach
	.4byte gWallpaperTiles_Beach
	.4byte 0x384
	.4byte gWallpaperTilemap_Beach
	.4byte gWallpaperPalettes_Beach

	@ Seafloor
	.4byte gWallpaperTiles_Seafloor
	.4byte 0x2B4
	.4byte gWallpaperTilemap_Seafloor
	.4byte gWallpaperPalettes_Seafloor

	@ River
	.4byte gWallpaperTiles_River
	.4byte 0x294
	.4byte gWallpaperTilemap_River
	.4byte gWallpaperPalettes_River

	@ Sky
	.4byte gWallpaperTiles_Sky
	.4byte 0x298
	.4byte gWallpaperTilemap_Sky
	.4byte gWallpaperPalettes_Sky

	@ Polkadot
	.4byte gWallpaperTiles_Polkadot
	.4byte 0x1FC
	.4byte gWallpaperTilemap_Polkadot
	.4byte gWallpaperPalettes_Polkadot

	@ Pokecenter
	.4byte gWallpaperTiles_Pokecenter
	.4byte 0x3A4
	.4byte gWallpaperTilemap_Pokecenter
	.4byte gWallpaperPalettes_Pokecenter

	@ Machine
	.4byte gWallpaperTiles_Machine
	.4byte 0x2F0
	.4byte gWallpaperTilemap_Machine
	.4byte gWallpaperPalettes_Machine

	@ Plain
	.4byte gWallpaperTiles_Plain
	.4byte 0xFC
	.4byte gWallpaperTilemap_Plain
	.4byte gWallpaperPalettes_Plain

PCPal_Arrow:
	.incbin "graphics/pokemon_storage/arrow.gbapal"
PCGfx_Arrow:
	.incbin "graphics/pokemon_storage/arrow.4bpp"

	.align 2
gUnknown_083BB288:: @ 83BB288
	obj_tiles PCGfx_Arrow, 128, 0x0006

	.align 2
gUnknown_083BB290:: @ 83BB290
	obj_pal PCPal_Arrow, 0xDACF

	.align 2
gOamData_83BB298:: @ 83BB298
	.2byte 0x4000
	.2byte 0x8000
	.2byte 0x0800

	.align 2
gSpriteAnim_83BB2A0:: @ 83BB2A0
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83BB2A8:: @ 83BB2A8
	obj_image_anim_frame 8, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83BB2B0:: @ 83BB2B0
	.4byte gSpriteAnim_83BB2A0
	.4byte gSpriteAnim_83BB2A8

	.align 2
gSpriteTemplate_83BB2B8:: @ 83BB2B8
	spr_template 3, 56008, gOamData_83BB298, gSpriteAnimTable_83BB2B0, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gOamData_83BB2D0:: @ 83BB2D0
	.2byte 0x8000
	.2byte 0x0000
	.2byte 0x0800

	.align 2
gSpriteAnim_83BB2D8:: @ 83BB2D8
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83BB2E0:: @ 83BB2E0
	obj_image_anim_frame 2, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83BB2E8:: @ 83BB2E8
	.4byte gSpriteAnim_83BB2D8
	.4byte gSpriteAnim_83BB2E0

	.align 2
gSpriteTemplate_83BB2F0:: @ 83BB2F0
	spr_template 6, 56015, gOamData_83BB2D0, gSpriteAnimTable_83BB2E8, NULL, gDummySpriteAffineAnimTable, sub_809A8C8

	.align 2
HandCursorPalette: @ 83BB308
	.incbin "graphics/pokemon_storage/hand_cursor_pal.bin"

	.align 2
HandCursorAltPalette: @ 83BB328
	.incbin "graphics/pokemon_storage/hand_cursor_alt_pal.bin"

	.align 2
HandCursorTiles: @ 83BB348
	.incbin "graphics/pokemon_storage/hand_cursor.4bpp"

	.align 2
HandCursorShadowTiles: @ 83BBB48
	.incbin "graphics/pokemon_storage/hand_cursor_shadow.4bpp"

	.align 2
gUnknown_083BBBC8:: @ 83BBBC8
	.4byte sub_809B150
	.4byte sub_809B1D8
	.4byte sub_809B24C

	.align 2
gUnknown_083BBBD4:: @ 83BBBD4
	.4byte sub_809C464, 0
	.4byte sub_809C664, 1
	.4byte sub_809C85C, 2
	.4byte sub_809C944, 3
	.4byte NULL, 0

	.align 2
gHandCursorSpriteSheets:: @ 83BBBFC
	obj_tiles HandCursorTiles, 0x800, 0
	obj_tiles HandCursorShadowTiles, 0x80, 1
	null_obj_tiles

	.align 2
gHandCursorSpritePalettes:: @ 83BBC14
	obj_pal HandCursorPalette, 56006
	obj_pal HandCursorAltPalette, 56017
	null_obj_pal

	.align 2
gOamData_83BBC2C:: @ 83BBC2C
	.2byte 0x0000
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gOamData_83BBC34:: @ 83BBC34
	.2byte 0x0000
	.2byte 0x4000
	.2byte 0x0800

	.align 2
gSpriteAnim_83BBC3C:: @ 83BBC3C
	obj_image_anim_frame 0, 30
	obj_image_anim_frame 16, 30
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83BBC48:: @ 83BBC48
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83BBC50:: @ 83BBC50
	obj_image_anim_frame 32, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83BBC58:: @ 83BBC58
	obj_image_anim_frame 48, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83BBC60:: @ 83BBC60
	.4byte gSpriteAnim_83BBC3C
	.4byte gSpriteAnim_83BBC48
	.4byte gSpriteAnim_83BBC50
	.4byte gSpriteAnim_83BBC58

	.align 2
gSpriteTemplate_83BBC70:: @ 83BBC70
	spr_template 0, 56006, gOamData_83BBC2C, gSpriteAnimTable_83BBC60, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_83BBC88:: @ 83BBC88
	spr_template 1, 56006, gOamData_83BBC34, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_809CB74

	.align 2
gUnknown_083BBCA0:: @ 83BBCA0
	.4byte PCText_Cancel2
	.4byte PCText_Deposit
	.4byte PCText_Withdraw
	.4byte PCText_Move
	.4byte PCText_Switch
	.4byte PCText_Place
	.4byte PCText_Summary
	.4byte PCText_Release
	.4byte PCText_Mark
	.4byte PCText_Jump
	.4byte PCText_Wallpaper
	.4byte PCText_Name
	.4byte PCText_Scenery1
	.4byte PCText_Scenery2
	.4byte PCText_Scenery3
	.4byte PCText_Etc
	.4byte PCText_Forest
	.4byte PCText_City
	.4byte PCText_Desert
	.4byte PCText_Savanna
	.4byte PCText_Crag
	.4byte PCText_Volcano
	.4byte PCText_Snow
	.4byte PCText_Cave
	.4byte PCText_Beach
	.4byte PCText_Seafloor
	.4byte PCText_River
	.4byte PCText_Sky
	.4byte PCText_Polka
	.4byte PCText_PokeCenter
	.4byte PCText_Machine
	.4byte PCText_Plain
