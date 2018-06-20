SeafloorCavern_Room2_MapBorder:: @ 82DDA78
	.incbin "data/layouts/SeafloorCavern_Room2/border.bin"

SeafloorCavern_Room2_MapBlockdata:: @ 82DDA80
	.incbin "data/layouts/SeafloorCavern_Room2/map.bin"

	.align 2
SeafloorCavern_Room2_Layout:: @ 82DDD74
	.4byte 0x12
	.4byte 0x15
	.4byte SeafloorCavern_Room2_MapBorder
	.4byte SeafloorCavern_Room2_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
