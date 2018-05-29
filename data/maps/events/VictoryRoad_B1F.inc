VictoryRoad_B1F_EventObjects:: @ 838DA04
	object_event 1, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 20, 0, 5, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_13, 0, 0
	object_event 2, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 21, 0, 4, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_14, 0, 0
	object_event 3, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 4, 0, 7, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_11, 0, 0
	object_event 4, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 9, 0, 10, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_12, 0, 0
	object_event 5, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 20, 0, 26, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_17, 0, 0
	object_event 6, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 21, 0, 25, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_16, 0, 0
	object_event 7, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 35, 0, 6, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_1E, 0, 0
	object_event 8, EVENT_OBJ_GFX_BREAKABLE_ROCK, 0, 19, 0, 5, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_BreakableRock, FLAG_TEMP_19, 0, 0
	object_event 9, EVENT_OBJ_GFX_BREAKABLE_ROCK, 0, 20, 0, 4, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_BreakableRock, FLAG_TEMP_1A, 0, 0
	object_event 10, EVENT_OBJ_GFX_BREAKABLE_ROCK, 0, 18, 0, 12, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_BreakableRock, FLAG_TEMP_1B, 0, 0
	object_event 11, EVENT_OBJ_GFX_BREAKABLE_ROCK, 0, 20, 0, 25, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_BreakableRock, FLAG_TEMP_1C, 0, 0
	object_event 12, EVENT_OBJ_GFX_BREAKABLE_ROCK, 0, 21, 0, 26, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_BreakableRock, FLAG_TEMP_1D, 0, 0
	object_event 13, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 34, 0, 4, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_1F, 0, 0
	object_event 14, EVENT_OBJ_GFX_MAN_4, 0, 37, 0, 12, 0, 3, 9, 0, 0, 1, 0, 3, 0, VictoryRoad_B1F_EventScript_15DFB5, 0, 0, 0
	object_event 15, EVENT_OBJ_GFX_WOMAN_7, 0, 26, 0, 16, 0, 3, 7, 0, 0, 1, 0, 4, 0, VictoryRoad_B1F_EventScript_15DFCC, 0, 0, 0
	object_event 16, EVENT_OBJ_GFX_WOMAN_7, 0, 5, 0, 21, 0, 3, 9, 0, 0, 1, 0, 2, 0, VictoryRoad_B1F_EventScript_15DFE3, 0, 0, 0
	object_event 17, EVENT_OBJ_GFX_BREAKABLE_ROCK, 0, 34, 0, 3, 0, 3, 1, 17, 0, 0, 0, 0, 0, S_BreakableRock, FLAG_VICTORY_ROAD_ROCK, 0, 0
	object_event 18, EVENT_OBJ_GFX_ITEM_BALL, 0, 42, 0, 8, 0, 4, 1, 17, 0, 0, 0, 0, 0, VictoryRoad_B1F_EventScript_1B1AE0, FLAG_ITEM_VICTORY_ROAD_B1F_1, 0, 0
	object_event 19, EVENT_OBJ_GFX_ITEM_BALL, 0, 32, 0, 3, 0, 3, 1, 17, 0, 0, 0, 0, 0, VictoryRoad_B1F_EventScript_1B1AED, FLAG_ITEM_VICTORY_ROAD_B1F_2, 0, 0

VictoryRoad_B1F_MapWarps:: @ 838DBCC
	warp_def 30, 25, 3, 0, MAP_VICTORY_ROAD_B2F
	warp_def 17, 16, 3, 2, MAP_VICTORY_ROAD_B2F
	warp_def 42, 25, 3, 3, MAP_VICTORY_ROAD_1F
	warp_def 42, 2, 4, 1, MAP_VICTORY_ROAD_B2F
	warp_def 8, 3, 3, 4, MAP_VICTORY_ROAD_1F
	warp_def 20, 21, 3, 2, MAP_VICTORY_ROAD_1F
	warp_def 5, 26, 3, 3, MAP_VICTORY_ROAD_B2F

VictoryRoad_B1F_MapEvents:: @ 838DC04
	map_events VictoryRoad_B1F_EventObjects, VictoryRoad_B1F_MapWarps, 0x0, 0x0
