SouthernIsland_Interior_MapBorder:: @ 82FA55C
	.incbin "data/layouts/SouthernIsland_Interior/border.bin"

SouthernIsland_Interior_MapBlockdata:: @ 82FA564
	.incbin "data/layouts/SouthernIsland_Interior/map.bin"

	.align 2
SouthernIsland_Interior_Layout:: @ 82FAA74
	.4byte 0x1b
	.4byte 0x18
	.4byte SouthernIsland_Interior_MapBorder
	.4byte SouthernIsland_Interior_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Rustboro
