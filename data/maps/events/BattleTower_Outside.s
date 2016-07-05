BattleTower_Outside_MapObjects:: @ 8391BEC
	object_event 1, MAP_OBJ_GFX_BUG_CATCHER, 0, 18, 0, 11, 0, 3, 2, 17, 0, 0, 0, 0, 0, BattleTower_Outside_EventScript_160263, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_WOMAN_5, 0, 11, 0, 14, 0, 3, 2, 17, 0, 0, 0, 0, 0, BattleTower_Outside_EventScript_16026C, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_BOY_2, 0, 10, 0, 11, 0, 3, 2, 17, 0, 0, 0, 0, 0, BattleTower_Outside_EventScript_160275, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_SS_TIDAL, 0, 19, 0, 26, 0, 1, 10, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_BEAUTY, 0, 19, 0, 24, 0, 3, 7, 17, 0, 0, 0, 0, 0, BattleTower_Outside_EventScript_160168, 0, 0, 0

BattleTower_Outside_MapWarps:: @ 8391C64
	warp_def 14, 8, 0, 0, BattleTower_Lobby

BattleTower_Outside_MapBGEvents:: @ 8391C6C
	bg_event 16, 13, 0, 0, 0, BattleTower_Outside_EventScript_16025A

BattleTower_Outside_MapEvents:: @ 8391C78
	map_events BattleTower_Outside_MapObjects, BattleTower_Outside_MapWarps, 0x0, BattleTower_Outside_MapBGEvents
