SeafloorCavern_Room1_MapObjects:: @ 838D0B8
	object_event 1, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 5, 0, 11, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_11, 0, 0
	object_event 2, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 12, 0, 11, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_12, 0, 0
	object_event 3, MAP_OBJ_GFX_BREAKABLE_ROCK, 0, 5, 0, 10, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_BreakableRock, FLAG_TEMP_13, 0, 0
	object_event 4, 241, 0, 8, 0, 6, 0, 3, 1, 17, 0, 1, 0, 2, 0, SeafloorCavern_Room1_EventScript_15DA6D, FLAG_HIDE_EVIL_TEAM_GRUNTS_SEAFLOOR_CAVERN, 0, 0
	object_event 5, 241, 0, 15, 0, 10, 0, 3, 16, 17, 0, 1, 0, 3, 0, SeafloorCavern_Room1_EventScript_15DA84, FLAG_HIDE_EVIL_TEAM_GRUNTS_SEAFLOOR_CAVERN, 0, 0

SeafloorCavern_Room1_MapWarps:: @ 838D130
	warp_def 5, 18, 3, 1, MAP_SEAFLOOR_CAVERN_ENTRANCE
	warp_def 17, 13, 3, 0, MAP_SEAFLOOR_CAVERN_ROOM5
	warp_def 6, 2, 3, 0, MAP_SEAFLOOR_CAVERN_ROOM2

SeafloorCavern_Room1_MapEvents:: @ 838D148
	map_events SeafloorCavern_Room1_MapObjects, SeafloorCavern_Room1_MapWarps, 0x0, 0x0
