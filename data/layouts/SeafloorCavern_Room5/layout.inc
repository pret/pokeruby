SeafloorCavern_Room5_MapBorder:: @ 82DE298
	.incbin "data/layouts/SeafloorCavern_Room5/border.bin"

SeafloorCavern_Room5_MapBlockdata:: @ 82DE2A0
	.incbin "data/layouts/SeafloorCavern_Room5/map.bin"

	.align 2
SeafloorCavern_Room5_Layout:: @ 82DE5C0
	.4byte 0x14
	.4byte 0x14
	.4byte SeafloorCavern_Room5_MapBorder
	.4byte SeafloorCavern_Room5_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
