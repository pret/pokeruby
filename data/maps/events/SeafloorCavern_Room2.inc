SeafloorCavern_Room2_MapObjects:: @ 838D15C
	object_event 1, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 6, 0, 14, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_11, 0, 0
	object_event 2, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 6, 0, 10, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_12, 0, 0
	object_event 3, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 6, 0, 6, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_13, 0, 0
	object_event 4, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 11, 0, 6, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_14, 0, 0
	object_event 5, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 11, 0, 10, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_15, 0, 0
	object_event 6, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 11, 0, 14, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_16, 0, 0
	object_event 7, MAP_OBJ_GFX_BREAKABLE_ROCK, 0, 11, 0, 9, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_BreakableRock, FLAG_TEMP_18, 0, 0
	object_event 8, MAP_OBJ_GFX_BREAKABLE_ROCK, 0, 7, 0, 6, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_BreakableRock, FLAG_TEMP_19, 0, 0
	object_event 9, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 15, 0, 11, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_17, 0, 0

SeafloorCavern_Room2_MapWarps:: @ 838D234
	warp_def 12, 19, 3, 2, MAP_SEAFLOOR_CAVERN_ROOM1
	warp_def 5, 19, 3, 0, MAP_SEAFLOOR_CAVERN_ROOM4
	warp_def 5, 2, 3, 0, MAP_SEAFLOOR_CAVERN_ROOM6
	warp_def 12, 2, 3, 0, MAP_SEAFLOOR_CAVERN_ROOM7

SeafloorCavern_Room2_MapEvents:: @ 838D254
	map_events SeafloorCavern_Room2_MapObjects, SeafloorCavern_Room2_MapWarps, 0x0, 0x0
