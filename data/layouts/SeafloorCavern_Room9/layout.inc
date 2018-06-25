SeafloorCavern_Room9_MapBorder:: @ 82DF03C
	.incbin "data/layouts/SeafloorCavern_Room9/border.bin"

SeafloorCavern_Room9_MapBlockdata:: @ 82DF044
	.incbin "data/layouts/SeafloorCavern_Room9/map.bin"

	.align 2
SeafloorCavern_Room9_Layout:: @ 82DF9F8
	.4byte 0x1b
	.4byte 0x2e
	.4byte SeafloorCavern_Room9_MapBorder
	.4byte SeafloorCavern_Room9_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
