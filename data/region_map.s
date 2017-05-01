	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gPokenavCursor_Pal::
	.incbin "graphics/pokenav/cursor.gbapal"

	.align 2
gUnknown_083E5AF0:: @ 83E5AF0
	.incbin "graphics/pokenav/cursor_small.4bpp.lz"

	.align 2
gUnknown_083E5B34:: @ 83E5B34
	.incbin "graphics/pokenav/cursor_large.4bpp.lz"

	.align 2
gRegionMapBrendanIconPalette:: @ 83E5C20
	.incbin "graphics/pokenav/brendan_icon.gbapal"

	.align 2
gRegionMapBrendanIconTiles:: @ 83E5C40
	.incbin "graphics/pokenav/brendan_icon.4bpp"

	.align 2
gRegionMapMayIconPalette:: @ 83E5CC0
	.incbin "graphics/pokenav/may_icon.gbapal"

	.align 2
gRegionMapMayIconTiles:: @ 83E5CE0
	.incbin "graphics/pokenav/may_icon.4bpp"

	.align 2
gUnknown_083E5D60:: @ 83E5D60
	.incbin "graphics/pokenav/region_map.gbapal", 0xE0, 0x40

	.align 2
gUnknown_083E5DA0:: @ 83E5DA0
	.incbin "graphics/pokenav/region_map.8bpp.lz"

	.align 2
gUnknown_083E6B04:: @ 83E6B04
	.incbin "graphics/pokenav/region_map_map.bin.lz"

@ 83E6E50
	.include "data/region_map_sections.inc"

@ 83E6FF4
	.include "data/region_map_locations.inc"

gUnknown_083E7684:: @ 83E7684
	.2byte 50, 39
	.2byte 51, 41
	.2byte 52, 42
	.2byte 53, 43
	.2byte 54, 14
	.2byte 69, 43
	.2byte 66, 12
	.2byte 79, 49
	.2byte 59, 19
	.2byte 76, 27
	.2byte 65, 37
	.2byte 85, 46
	.2byte 88, 88

	.align 2
gOamData_83E76B8:: @ 83E76B8
	.2byte 0x0000
	.2byte 0x4000
	.2byte 0x0400

	.align 2
gSpriteAnim_83E76C0:: @ 83E76C0
	obj_image_anim_frame 0, 20
	obj_image_anim_frame 4, 20
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83E76CC:: @ 83E76CC
	obj_image_anim_frame 0, 10
	obj_image_anim_frame 16, 10
	obj_image_anim_frame 32, 10
	obj_image_anim_frame 16, 10
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83E76E0:: @ 83E76E0
	.4byte gSpriteAnim_83E76C0
	.4byte gSpriteAnim_83E76CC

	.align 2
gUnknown_083E76E8:: @ 83E76E8
	obj_pal gPokenavCursor_Pal, 0x0000

	.align 2
gSpriteTemplate_83E76F0:: @ 83E76F0
	spr_template 0, 0, gOamData_83E76B8, gSpriteAnimTable_83E76E0, NULL, gDummySpriteAffineAnimTable, sub_80FBAF0

gUnknown_083E7708:: @ 83E7708
	.incbin "baserom.gba", 0x003e7708, 0x8

Unknown_83E7710:
	.incbin "baserom.gba", 0x003e7710, 0x8

gUnknown_083E7718:: @ 83E7718
	.4byte Unknown_83E7710

gUnknown_083E771C:: @ 83E771C
	.incbin "graphics/pokenav/map_frame.gbapal"

gUnknown_083E773C:: @ 83E773C
	.incbin "graphics/pokenav/map_frame.4bpp.lz"

gUnknown_083E7774:: @ 83E7774
	.incbin "baserom.gba", 0x003e7774, 0xb8

	.align 2
gPokenavMapMisc_Pal::
	.incbin "graphics/pokenav/map_misc.gbapal"

gUnknown_083E784C:: @ 83E784C
	.incbin "graphics/pokenav/map_misc.4bpp.lz"

gUnknown_083E7920:: @ 83E7920
	.incbin "baserom.gba", 0x3e7920, 0x98

	.align 2
Unknown_3E79B8: @ 83E79B8
	.4byte OtherText_PokeLeague
	.4byte OtherText_PokeCenter

	.align 2
gUnknown_083E79C0:: @ 83E79C0
	.4byte Unknown_3E79B8
	.incbin "baserom.gba", 0x3e79c4, 0x8

	.align 2
gUnknown_083E79CC:: @ 83E79CC
	obj_pal gPokenavMapMisc_Pal, 0x0002

	.align 2
gUnknown_083E79D4:: @ 83E79D4
	.2byte 2120,  58
	.2byte 65535, 88

	.align 2
gOamData_83E79DC:: @ 83E79DC
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0800

	.align 2
gSpriteAnim_83E79E4:: @ 83E79E4
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E79EC:: @ 83E79EC
	obj_image_anim_frame 1, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E79F4:: @ 83E79F4
	obj_image_anim_frame 3, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E79FC:: @ 83E79FC
	obj_image_anim_frame 5, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E7A04:: @ 83E7A04
	obj_image_anim_frame 6, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E7A0C:: @ 83E7A0C
	obj_image_anim_frame 8, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E7A14:: @ 83E7A14
	obj_image_anim_frame 10, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83E7A1C:: @ 83E7A1C
	.4byte gSpriteAnim_83E79E4
	.4byte gSpriteAnim_83E79EC
	.4byte gSpriteAnim_83E79F4
	.4byte gSpriteAnim_83E79FC
	.4byte gSpriteAnim_83E7A04
	.4byte gSpriteAnim_83E7A0C
	.4byte gSpriteAnim_83E7A14

	.align 2
gSpriteTemplate_83E7A38:: @ 83E7A38
	spr_template 2, 2, gOamData_83E79DC, gSpriteAnimTable_83E7A1C, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
