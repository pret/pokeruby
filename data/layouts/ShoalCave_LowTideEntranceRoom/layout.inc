ShoalCave_LowTideEntranceRoom_MapBorder:: @ 82E20A8
	.incbin "data/layouts/ShoalCave_LowTideEntranceRoom/border.bin"

ShoalCave_LowTideEntranceRoom_MapBlockdata:: @ 82E20B0
	.incbin "data/layouts/ShoalCave_LowTideEntranceRoom/map.bin"

	.align 2
ShoalCave_LowTideEntranceRoom_Layout:: @ 82E2A44
	.4byte 0x23
	.4byte 0x23
	.4byte ShoalCave_LowTideEntranceRoom_MapBorder
	.4byte ShoalCave_LowTideEntranceRoom_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
