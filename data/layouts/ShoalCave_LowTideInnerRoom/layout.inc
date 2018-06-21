ShoalCave_LowTideInnerRoom_MapBorder:: @ 82E2A5C
	.incbin "data/layouts/ShoalCave_LowTideInnerRoom/border.bin"

ShoalCave_LowTideInnerRoom_MapBlockdata:: @ 82E2A64
	.incbin "data/layouts/ShoalCave_LowTideInnerRoom/map.bin"

	.align 2
ShoalCave_LowTideInnerRoom_Layout:: @ 82E380C
	.4byte 0x2e
	.4byte 0x26
	.4byte ShoalCave_LowTideInnerRoom_MapBorder
	.4byte ShoalCave_LowTideInnerRoom_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
