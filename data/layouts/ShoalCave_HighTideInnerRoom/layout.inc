ShoalCave_HighTideInnerRoom_MapBorder:: @ 82E47F4
	.incbin "data/layouts/ShoalCave_HighTideInnerRoom/border.bin"

ShoalCave_HighTideInnerRoom_MapBlockdata:: @ 82E47FC
	.incbin "data/layouts/ShoalCave_HighTideInnerRoom/map.bin"

	.align 2
ShoalCave_HighTideInnerRoom_Layout:: @ 82E55A4
	.4byte 0x2e
	.4byte 0x26
	.4byte ShoalCave_HighTideInnerRoom_MapBorder
	.4byte ShoalCave_HighTideInnerRoom_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
