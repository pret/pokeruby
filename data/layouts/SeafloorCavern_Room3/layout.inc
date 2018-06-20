SeafloorCavern_Room3_MapBorder:: @ 82DDD8C
	.incbin "data/layouts/SeafloorCavern_Room3/border.bin"

SeafloorCavern_Room3_MapBlockdata:: @ 82DDD94
	.incbin "data/layouts/SeafloorCavern_Room3/map.bin"

	.align 2
SeafloorCavern_Room3_Layout:: @ 82DDFB4
	.4byte 0x10
	.4byte 0x11
	.4byte SeafloorCavern_Room3_MapBorder
	.4byte SeafloorCavern_Room3_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
