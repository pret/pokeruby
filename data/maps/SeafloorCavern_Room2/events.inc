SeafloorCavern_Room2_EventObjects:: @ 838D15C
	object_event 1, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 6, 14, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_11
	object_event 2, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 6, 10, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_12
	object_event 3, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 6, 6, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_13
	object_event 4, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 11, 6, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_14
	object_event 5, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 11, 10, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_15
	object_event 6, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 11, 14, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_16
	object_event 7, EVENT_OBJ_GFX_BREAKABLE_ROCK, 0, 11, 9, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_BreakableRock, FLAG_TEMP_18
	object_event 8, EVENT_OBJ_GFX_BREAKABLE_ROCK, 0, 7, 6, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_BreakableRock, FLAG_TEMP_19
	object_event 9, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 15, 11, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_17

SeafloorCavern_Room2_MapWarps:: @ 838D234
	warp_def 12, 19, 3, 2, MAP_SEAFLOOR_CAVERN_ROOM1
	warp_def 5, 19, 3, 0, MAP_SEAFLOOR_CAVERN_ROOM4
	warp_def 5, 2, 3, 0, MAP_SEAFLOOR_CAVERN_ROOM6
	warp_def 12, 2, 3, 0, MAP_SEAFLOOR_CAVERN_ROOM7

SeafloorCavern_Room2_MapEvents:: @ 838D254
	map_events SeafloorCavern_Room2_EventObjects, SeafloorCavern_Room2_MapWarps, 0x0, 0x0
