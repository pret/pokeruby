BattleTower_BattleRoom_MapObjects:: @ 8391DAC
	object_event 1, 240, 0, 5, 0, 1, 0, 3, 8, 0, 0, 0, 0, 0, 0, 0x0, 888, 0, 0
	object_event 2, MAP_OBJ_GFX_TEALA, 0, 1, 0, 7, 0, 3, 10, 0, 0, 0, 0, 0, 0, 0x0, 0, 0, 0

BattleTower_BattleRoom_MapWarps:: @ 8391DDC
	warp_def 5, 8, 0, 2, BattleTower_Lobby
	warp_def 6, 8, 0, 2, BattleTower_Lobby

BattleTower_BattleRoom_MapEvents:: @ 8391DEC
	map_events BattleTower_BattleRoom_MapObjects, BattleTower_BattleRoom_MapWarps, 0x0, 0x0
