VictoryRoad_B1F_MapBorder:: @ 82F83D0
	.incbin "data/layouts/VictoryRoad_B1F/border.bin"

VictoryRoad_B1F_MapBlockdata:: @ 82F83D8
	.incbin "data/layouts/VictoryRoad_B1F/map.bin"

	.align 2
VictoryRoad_B1F_Layout:: @ 82F8EFC
	.4byte 0x2e
	.4byte 0x1f
	.4byte VictoryRoad_B1F_MapBorder
	.4byte VictoryRoad_B1F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
