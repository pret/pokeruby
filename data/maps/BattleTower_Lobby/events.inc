BattleTower_Lobby_EventObjects:: @ 8391C8C
	object_event 1, EVENT_OBJ_GFX_TEALA, 0, 6, 5, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, BattleTower_Lobby_EventScript_16049E, 0
	object_event 2, EVENT_OBJ_GFX_MAN_5, 0, 12, 3, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, BattleTower_Lobby_EventScript_1606A5, 0
	object_event 3, EVENT_OBJ_GFX_WOMAN_7, 0, 10, 8, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, BattleTower_Lobby_EventScript_160715, 0
	object_event 4, EVENT_OBJ_GFX_BOY_1, 0, 1, 2, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, BattleTower_Lobby_EventScript_16071E, 0
	object_event 5, EVENT_OBJ_GFX_REPORTER_F, 0, 4, 7, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, BattleTower_Lobby_EventScript_1AE1FF, FLAG_HIDE_REPORTER_BATTLE_TOWER
	object_event 6, EVENT_OBJ_GFX_MAN_2, 0, 7, 6, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, BattleTower_Lobby_EventScript_160733, FLAG_HIDE_AWARD_MAN_BATTLE_TOWER

BattleTower_Lobby_MapWarps:: @ 8391D1C
	warp_def 6, 8, 0, 0, MAP_BATTLE_TOWER_OUTSIDE
	warp_def 7, 8, 0, 0, MAP_BATTLE_TOWER_OUTSIDE
	warp_def 6, 1, 0, 0, MAP_BATTLE_TOWER_BATTLE_ROOM

BattleTower_Lobby_MapBGEvents:: @ 8391D34
	bg_event 3, 5, 3, BG_EVENT_PLAYER_FACING_NORTH, BattleTower_Lobby_EventScript_160727

BattleTower_Lobby_MapEvents:: @ 8391D40
	map_events BattleTower_Lobby_EventObjects, BattleTower_Lobby_MapWarps, 0x0, BattleTower_Lobby_MapBGEvents
