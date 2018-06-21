IslandCave_MapBorder:: @ 82F6CF8
	.incbin "data/layouts/IslandCave/border.bin"

IslandCave_MapBlockdata:: @ 82F6D00
	.incbin "data/layouts/IslandCave/map.bin"

	.align 2
IslandCave_Layout:: @ 82F7164
	.4byte 0x11
	.4byte 0x21
	.4byte IslandCave_MapBorder
	.4byte IslandCave_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
