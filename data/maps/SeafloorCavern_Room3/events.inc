SeafloorCavern_Room3_EventObjects:: @ 838D268
	object_event 1, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 6, 13, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_11
	object_event 2, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 8, 12, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_12
	object_event 3, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 7, 11, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_13
	object_event 4, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 9, 11, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_14
	object_event 5, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 6, 10, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_15
	object_event 6, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 8, 10, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_16
	object_event 7, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 5, 9, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_17
	object_event 8, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 7, 9, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_18
	object_event 9, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 9, 9, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_19
	object_event 10, EVENT_OBJ_GFX_VAR_2, 0, 10, 5, 3, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 1, 3, SeafloorCavern_Room3_EventScript_15DAA8, FLAG_HIDE_EVIL_TEAM_GRUNTS_SEAFLOOR_CAVERN

SeafloorCavern_Room3_MapWarps:: @ 838D358
	warp_def 8, 1, 3, 1, MAP_SEAFLOOR_CAVERN_ROOM8
	warp_def 10, 13, 3, 1, MAP_SEAFLOOR_CAVERN_ROOM7
	warp_def 4, 15, 3, 1, MAP_SEAFLOOR_CAVERN_ROOM6

SeafloorCavern_Room3_MapEvents:: @ 838D370
	map_events SeafloorCavern_Room3_EventObjects, SeafloorCavern_Room3_MapWarps, 0x0, 0x0
