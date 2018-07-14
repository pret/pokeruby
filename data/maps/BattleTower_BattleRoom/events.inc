BattleTower_BattleRoom_EventObjects:: @ 8391DAC
	object_event 1, EVENT_OBJ_GFX_VAR_0, 0, 5, 1, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, 0x0, FLAG_HIDE_BATTLE_TOWER_OPPONENT
	object_event 2, EVENT_OBJ_GFX_TEALA, 0, 1, 7, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, 0x0, 0

BattleTower_BattleRoom_MapWarps:: @ 8391DDC
	warp_def 5, 8, 0, 2, MAP_BATTLE_TOWER_LOBBY
	warp_def 6, 8, 0, 2, MAP_BATTLE_TOWER_LOBBY

BattleTower_BattleRoom_MapEvents:: @ 8391DEC
	map_events BattleTower_BattleRoom_EventObjects, BattleTower_BattleRoom_MapWarps, 0x0, 0x0
