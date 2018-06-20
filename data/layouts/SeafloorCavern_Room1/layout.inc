SeafloorCavern_Room1_MapBorder:: @ 82DD710
	.incbin "data/layouts/SeafloorCavern_Room1/border.bin"

SeafloorCavern_Room1_MapBlockdata:: @ 82DD718
	.incbin "data/layouts/SeafloorCavern_Room1/map.bin"

	.align 2
SeafloorCavern_Room1_Layout:: @ 82DDA60
	.4byte 0x14
	.4byte 0x15
	.4byte SeafloorCavern_Room1_MapBorder
	.4byte SeafloorCavern_Room1_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
