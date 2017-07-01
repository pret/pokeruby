	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gCableCarMtChimneyTilemap:: @ 8401820
	.incbin "graphics/misc/cable_car_mt_chimney_map.bin.lz"

	.align 2
gCableCarTreeTilemap:: @ 8401978
	.incbin "graphics/misc/cable_car_tree_map.bin.lz"

	.align 2
gCableCarMountainTilemap:: @ 8401AFC
	.incbin "graphics/misc/cable_car_mountain_map.bin.lz"

	.align 2
gCableCarPylonHookTilemapEntries:: @ 8401CC0
	.2byte 0x3000
	.2byte 0x3001
	.2byte 0x3002
	.2byte 0x3003
	.2byte 0x3004
	.2byte 0x3005
	.2byte 0x3006
	.2byte 0x3007
	.2byte 0x3008
	.2byte 0x3009

	.align 2
gCableCarPylonStemTilemap:: @ 8401CD4
	.incbin "graphics/misc/cable_car_pylon_stem_map.bin.lz"

	.align 2
gUnknown_08401CF8:: @ 8401CF8
	obj_tiles gCableCar_Gfx, 0x800, 1
	obj_tiles gCableCarDoor_Gfx, 0x40, 2
	obj_tiles gCableCarCord_Gfx, 0x80, 3
	.space 8

	.align 2
gUnknown_08401D18:: @ 8401D18
	obj_pal gCableCar_Pal, 1
	.space 8

	.align 2
gOamData_8401D28:: @ 8401D28
	.2byte 0x0300
	.2byte 0xC000
	.2byte 0x0800

	.align 2
gOamData_8401D30:: @ 8401D30
	.2byte 0x4300
	.2byte 0x0000
	.2byte 0x0800

	.align 2
gOamData_8401D38:: @ 8401D38
	.2byte 0x0300
	.2byte 0x4000
	.2byte 0x0800

	.align 2
gSpriteTemplate_8401D40:: @ 8401D40
	spr_template 1, 1, gOamData_8401D28, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8123CB8

	.align 2
gSpriteTemplate_8401D58:: @ 8401D58
	spr_template 2, 1, gOamData_8401D30, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8123CB8

	.align 2
gSpriteTemplate_8401D70:: @ 8401D70
	spr_template 3, 1, gOamData_8401D38, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, nullsub_76

gCableCarPlayerGraphicsIDs:: @ 8401D88
	.byte MAP_OBJ_GFX_RIVAL_BRENDAN_NORMAL
	.byte MAP_OBJ_GFX_RIVAL_MAY_NORMAL

gMtChimneyHikerGraphicsIDs:: @ 8401D8A
	.byte MAP_OBJ_GFX_HIKER
	.byte MAP_OBJ_GFX_CAMPER
	.byte MAP_OBJ_GFX_PICNICKER
	.byte MAP_OBJ_GFX_POOCHYENA @ not used

	.align 1
gMtChimneyHikerCoords:: @ 8401D8E
	.2byte   0,  80
	.2byte 240, 146

gMtChimneyHikerMovementDelayTable:: @ 8401D96
	.byte   0
	.byte  60
	.byte 120
	.byte 170

	.align 2
gUnknown_08401D9C:: @ 8401D9C
	.4byte sub_8123EB8
	.4byte sub_8123F44
