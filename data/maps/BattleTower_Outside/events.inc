BattleTower_Outside_EventObjects:: @ 8391BEC
	object_event 1, EVENT_OBJ_GFX_BUG_CATCHER, 0, 18, 11, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, BattleTower_Outside_EventScript_160263, 0
	object_event 2, EVENT_OBJ_GFX_WOMAN_5, 0, 11, 14, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, BattleTower_Outside_EventScript_16026C, 0
	object_event 3, EVENT_OBJ_GFX_BOY_2, 0, 10, 11, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, BattleTower_Outside_EventScript_160275, 0
	object_event 4, EVENT_OBJ_GFX_SS_TIDAL, 0, 19, 26, 1, MOVEMENT_TYPE_FACE_RIGHT, 1, 1, 0, 0, 0x0, 0
	object_event 5, EVENT_OBJ_GFX_BEAUTY, 0, 19, 24, 3, MOVEMENT_TYPE_FACE_UP, 1, 1, 0, 0, BattleTower_Outside_EventScript_160168, 0

BattleTower_Outside_MapWarps:: @ 8391C64
	warp_def 14, 8, 0, 0, MAP_BATTLE_TOWER_LOBBY

BattleTower_Outside_MapBGEvents:: @ 8391C6C
	bg_event 16, 13, 0, BG_EVENT_PLAYER_FACING_ANY, BattleTower_Outside_EventScript_16025A

BattleTower_Outside_MapEvents:: @ 8391C78
	map_events BattleTower_Outside_EventObjects, BattleTower_Outside_MapWarps, 0x0, BattleTower_Outside_MapBGEvents
