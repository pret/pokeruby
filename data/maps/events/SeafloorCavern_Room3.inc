SeafloorCavern_Room3_EventObjects:: @ 838D268
	object_event 1, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 6, 0, 13, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_11, 0, 0
	object_event 2, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 8, 0, 12, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_12, 0, 0
	object_event 3, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 7, 0, 11, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_13, 0, 0
	object_event 4, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 9, 0, 11, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_14, 0, 0
	object_event 5, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 6, 0, 10, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_15, 0, 0
	object_event 6, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 8, 0, 10, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_16, 0, 0
	object_event 7, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 5, 0, 9, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_17, 0, 0
	object_event 8, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 7, 0, 9, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_18, 0, 0
	object_event 9, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 9, 0, 9, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_19, 0, 0
	object_event 10, EVENT_OBJ_GFX_VAR_2, 0, 10, 0, 5, 0, 3, 8, 17, 0, 1, 0, 3, 0, SeafloorCavern_Room3_EventScript_15DAA8, FLAG_HIDE_EVIL_TEAM_GRUNTS_SEAFLOOR_CAVERN, 0, 0

SeafloorCavern_Room3_MapWarps:: @ 838D358
	warp_def 8, 1, 3, 1, MAP_SEAFLOOR_CAVERN_ROOM8
	warp_def 10, 13, 3, 1, MAP_SEAFLOOR_CAVERN_ROOM7
	warp_def 4, 15, 3, 1, MAP_SEAFLOOR_CAVERN_ROOM6

SeafloorCavern_Room3_MapEvents:: @ 838D370
	map_events SeafloorCavern_Room3_EventObjects, SeafloorCavern_Room3_MapWarps, 0x0, 0x0
