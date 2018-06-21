BattleTower_BattleRoom_MapBorder:: @ 82F2694
	.incbin "data/layouts/BattleTower_BattleRoom/border.bin"

BattleTower_BattleRoom_MapBlockdata:: @ 82F269C
	.incbin "data/layouts/BattleTower_BattleRoom/map.bin"

	.align 2
BattleTower_BattleRoom_Layout:: @ 82F2750
	.4byte 0xa
	.4byte 0x9
	.4byte BattleTower_BattleRoom_MapBorder
	.4byte BattleTower_BattleRoom_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_BattleTower
