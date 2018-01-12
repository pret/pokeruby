	.include "include/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

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
