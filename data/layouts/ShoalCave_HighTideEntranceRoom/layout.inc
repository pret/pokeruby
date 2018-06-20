ShoalCave_HighTideEntranceRoom_MapBorder:: @ 82E3E40
	.incbin "data/layouts/ShoalCave_HighTideEntranceRoom/border.bin"

ShoalCave_HighTideEntranceRoom_MapBlockdata:: @ 82E3E48
	.incbin "data/layouts/ShoalCave_HighTideEntranceRoom/map.bin"

	.align 2
ShoalCave_HighTideEntranceRoom_Layout:: @ 82E47DC
	.4byte 0x23
	.4byte 0x23
	.4byte ShoalCave_HighTideEntranceRoom_MapBorder
	.4byte ShoalCave_HighTideEntranceRoom_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
