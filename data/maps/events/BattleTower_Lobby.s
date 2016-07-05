BattleTower_Lobby_MapObjects:: @ 8391C8C
	object_event 1, MAP_OBJ_GFX_TEALA, 0, 6, 0, 5, 0, 3, 8, 0, 0, 0, 0, 0, 0, BattleTower_Lobby_EventScript_16049E, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_MAN_5, 0, 12, 0, 3, 0, 3, 8, 0, 0, 0, 0, 0, 0, BattleTower_Lobby_EventScript_1606A5, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_WOMAN_7, 0, 10, 0, 8, 0, 3, 2, 17, 0, 0, 0, 0, 0, BattleTower_Lobby_EventScript_160715, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_BOY_1, 0, 1, 0, 2, 0, 3, 2, 17, 0, 0, 0, 0, 0, BattleTower_Lobby_EventScript_16071E, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_REPORTER_F, 0, 4, 0, 7, 0, 3, 1, 0, 0, 0, 0, 0, 0, BattleTower_Lobby_EventScript_1AE1FF, 918, 0, 0
	object_event 6, MAP_OBJ_GFX_MAN_2, 0, 7, 0, 6, 0, 3, 9, 0, 0, 0, 0, 0, 0, BattleTower_Lobby_EventScript_160733, 941, 0, 0

BattleTower_Lobby_MapWarps:: @ 8391D1C
	warp_def 6, 8, 0, 0, BattleTower_Outside
	warp_def 7, 8, 0, 0, BattleTower_Outside
	warp_def 6, 1, 0, 0, BattleTower_BattleRoom

BattleTower_Lobby_MapBGEvents:: @ 8391D34
	bg_event 3, 5, 3, 1, 0, BattleTower_Lobby_EventScript_160727

BattleTower_Lobby_MapEvents:: @ 8391D40
	map_events BattleTower_Lobby_MapObjects, BattleTower_Lobby_MapWarps, 0x0, BattleTower_Lobby_MapBGEvents
