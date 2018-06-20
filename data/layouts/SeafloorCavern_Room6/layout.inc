SeafloorCavern_Room6_MapBorder:: @ 82DE5D8
	.incbin "data/layouts/SeafloorCavern_Room6/border.bin"

SeafloorCavern_Room6_MapBlockdata:: @ 82DE5E0
	.incbin "data/layouts/SeafloorCavern_Room6/map.bin"

	.align 2
SeafloorCavern_Room6_Layout:: @ 82DEA30
	.4byte 0x18
	.4byte 0x17
	.4byte SeafloorCavern_Room6_MapBorder
	.4byte SeafloorCavern_Room6_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Pacifidlog
