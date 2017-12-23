	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

gUnknown_083F8418:: @ 83F8418
	.incbin "graphics/pokedex/area_glow.gbapal"

gUnknown_083F8438:: @ 83F8438
	.incbin "graphics/pokedex/area_glow.4bpp.lz"

	.align 1
gUnknown_083F856C:: @ 83F856C
	.2byte 360

	.align 1
gUnknown_083F856E:: @ 83F856E
	.2byte 328, 0, 34
	.2byte 412, 0,  0

	.align 1
gUnknown_083F857A:: @ 83F857A
	.2byte 85, 2142 @ FLAG_LANDMARK_SKY_PILLAR
	.2byte 68, 2119 @ FLAG_LANDMARK_SEAFLOOR_CAVERN
	.2byte 88,    0

@ XXX: what is this?
	.align 2
	.4byte gSharedMem

	.align 2
gUnknown_083F858C:: @ 83F858C
	obj_tiles AreaMarkerTiles, 0x80, 2

	.align 2
gUnknown_083F8594:: @ 83F8594
	obj_pal AreaMarkerPalette, 2

	.align 2
gOamData_83F859C:: @ 83F859C
	.2byte 0x0000
	.2byte 0x4000
	.2byte 0x0400

	.align 2
gSpriteTemplate_83F85A4:: @ 83F85A4
	spr_template 2, 2, gOamData_83F859C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
AreaMarkerPalette:
	.incbin "graphics/pokedex/area_marker.gbapal"

	.align 2
AreaMarkerTiles:
	.incbin "graphics/pokedex/area_marker.4bpp"

	.align 2
gUnknown_083F865C:: @ 83F865C
	obj_pal gAreaUnknownPalette, 3

	.align 2
gUnknown_083F8664:: @ 83F8664
	obj_tiles gSharedMem + 0xFB4, 0x600, 3

	.align 2
gOamData_83F866C:: @ 83F866C
	.2byte 0x0000
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gSpriteTemplate_83F8674:: @ 83F8674
	spr_template 3, 3, gOamData_83F866C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
