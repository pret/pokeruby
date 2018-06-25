SeafloorCavern_Entrance_MapBorder:: @ 82DD3D0
	.incbin "data/layouts/SeafloorCavern_Entrance/border.bin"

SeafloorCavern_Entrance_MapBlockdata:: @ 82DD3D8
	.incbin "data/layouts/SeafloorCavern_Entrance/map.bin"

	.align 2
SeafloorCavern_Entrance_Layout:: @ 82DD6F8
	.4byte 0x14
	.4byte 0x14
	.4byte SeafloorCavern_Entrance_MapBorder
	.4byte SeafloorCavern_Entrance_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
