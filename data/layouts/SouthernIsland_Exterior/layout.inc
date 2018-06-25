SouthernIsland_Exterior_MapBorder:: @ 82F9D80
	.incbin "data/layouts/SouthernIsland_Exterior/border.bin"

SouthernIsland_Exterior_MapBlockdata:: @ 82F9D88
	.incbin "data/layouts/SouthernIsland_Exterior/map.bin"

	.align 2
SouthernIsland_Exterior_Layout:: @ 82FA544
	.4byte 0x21
	.4byte 0x1e
	.4byte SouthernIsland_Exterior_MapBorder
	.4byte SouthernIsland_Exterior_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Rustboro
