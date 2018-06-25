SeafloorCavern_Room8_MapBorder:: @ 82DEEE8
	.incbin "data/layouts/SeafloorCavern_Room8/border.bin"

SeafloorCavern_Room8_MapBlockdata:: @ 82DEEF0
	.incbin "data/layouts/SeafloorCavern_Room8/map.bin"

	.align 2
SeafloorCavern_Room8_Layout:: @ 82DF024
	.4byte 0xb
	.4byte 0xe
	.4byte SeafloorCavern_Room8_MapBorder
	.4byte SeafloorCavern_Room8_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
