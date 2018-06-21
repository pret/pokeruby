BattleTower_Corridor_MapBorder:: @ 82F25C8
	.incbin "data/layouts/BattleTower_Corridor/border.bin"

BattleTower_Corridor_MapBlockdata:: @ 82F25D0
	.incbin "data/layouts/BattleTower_Corridor/map.bin"

	.align 2
BattleTower_Corridor_Layout:: @ 82F267C
	.4byte 0x11
	.4byte 0x5
	.4byte BattleTower_Corridor_MapBorder
	.4byte BattleTower_Corridor_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_BattleTower
