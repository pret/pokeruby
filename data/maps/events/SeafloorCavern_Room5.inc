SeafloorCavern_Room5_MapObjects:: @ 838D3D0
	object_event 1, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 3, 0, 11, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, 17, 0, 0
	object_event 2, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 4, 0, 11, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, 18, 0, 0
	object_event 3, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 11, 0, 7, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, 19, 0, 0
	object_event 4, MAP_OBJ_GFX_BREAKABLE_ROCK, 0, 3, 0, 13, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_BreakableRock, 21, 0, 0
	object_event 5, MAP_OBJ_GFX_BREAKABLE_ROCK, 0, 13, 0, 8, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_BreakableRock, 22, 0, 0
	object_event 6, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 12, 0, 8, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, 20, 0, 0

SeafloorCavern_Room5_MapWarps:: @ 838D460
	warp_def 4, 1, 3, 1, MAP_SEAFLOOR_CAVERN_ROOM1
	warp_def 15, 12, 3, 1, MAP_SEAFLOOR_CAVERN_ROOM4
	warp_def 7, 17, 3, 2, MAP_SEAFLOOR_CAVERN_ROOM4

SeafloorCavern_Room5_MapEvents:: @ 838D478
	map_events SeafloorCavern_Room5_MapObjects, SeafloorCavern_Room5_MapWarps, 0x0, 0x0
