ShoalCave_LowTideStairsRoom_MapBorder:: @ 82E3824
	.incbin "data/layouts/ShoalCave_LowTideStairsRoom/border.bin"

ShoalCave_LowTideStairsRoom_MapBlockdata:: @ 82E382C
	.incbin "data/layouts/ShoalCave_LowTideStairsRoom/map.bin"

	.align 2
ShoalCave_LowTideStairsRoom_Layout:: @ 82E3AA4
	.4byte 0x15
	.4byte 0xf
	.4byte ShoalCave_LowTideStairsRoom_MapBorder
	.4byte ShoalCave_LowTideStairsRoom_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
