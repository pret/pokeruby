VictoryRoad_B2F_MapBorder:: @ 82F8F14
	.incbin "data/layouts/VictoryRoad_B2F/border.bin"

VictoryRoad_B2F_MapBlockdata:: @ 82F8F1C
	.incbin "data/layouts/VictoryRoad_B2F/map.bin"

	.align 2
VictoryRoad_B2F_Layout:: @ 82F9A40
	.4byte 0x2e
	.4byte 0x1f
	.4byte VictoryRoad_B2F_MapBorder
	.4byte VictoryRoad_B2F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
