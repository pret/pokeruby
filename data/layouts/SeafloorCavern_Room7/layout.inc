SeafloorCavern_Room7_MapBorder:: @ 82DEA48
	.incbin "data/layouts/SeafloorCavern_Room7/border.bin"

SeafloorCavern_Room7_MapBlockdata:: @ 82DEA50
	.incbin "data/layouts/SeafloorCavern_Room7/map.bin"

	.align 2
SeafloorCavern_Room7_Layout:: @ 82DEED0
	.4byte 0x17
	.4byte 0x19
	.4byte SeafloorCavern_Room7_MapBorder
	.4byte SeafloorCavern_Room7_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Pacifidlog
