ShoalCave_LowTideLowerRoom_MapBorder:: @ 82E3ABC
	.incbin "data/layouts/ShoalCave_LowTideLowerRoom/border.bin"

ShoalCave_LowTideLowerRoom_MapBlockdata:: @ 82E3AC4
	.incbin "data/layouts/ShoalCave_LowTideLowerRoom/map.bin"

	.align 2
ShoalCave_LowTideLowerRoom_Layout:: @ 82E3E28
	.4byte 0x1f
	.4byte 0xe
	.4byte ShoalCave_LowTideLowerRoom_MapBorder
	.4byte ShoalCave_LowTideLowerRoom_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
