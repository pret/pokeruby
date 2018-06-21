BattleTower_Elevator_MapBorder:: @ 82F2570
	.incbin "data/layouts/BattleTower_Elevator/border.bin"

BattleTower_Elevator_MapBlockdata:: @ 82F2578
	.incbin "data/layouts/BattleTower_Elevator/map.bin"

	.align 2
BattleTower_Elevator_Layout:: @ 82F25B0
	.4byte 0x4
	.4byte 0x7
	.4byte BattleTower_Elevator_MapBorder
	.4byte BattleTower_Elevator_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_BattleTower
