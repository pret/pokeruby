Underwater_SeafloorCavern_MapBorder:: @ 82DD2B4
	.incbin "data/layouts/Underwater_SeafloorCavern/border.bin"

Underwater_SeafloorCavern_MapBlockdata:: @ 82DD2BC
	.incbin "data/layouts/Underwater_SeafloorCavern/map.bin"

	.align 2
Underwater_SeafloorCavern_Layout:: @ 82DD3B8
	.4byte 0xe
	.4byte 0x9
	.4byte Underwater_SeafloorCavern_MapBorder
	.4byte Underwater_SeafloorCavern_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Underwater
