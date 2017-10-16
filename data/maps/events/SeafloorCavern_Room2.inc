SeafloorCavern_Room2_MapObjects:: @ 838D15C
	object_event 1, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 6, 0, 14, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, 17, 0, 0
	object_event 2, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 6, 0, 10, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, 18, 0, 0
	object_event 3, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 6, 0, 6, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, 19, 0, 0
	object_event 4, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 11, 0, 6, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, 20, 0, 0
	object_event 5, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 11, 0, 10, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, 21, 0, 0
	object_event 6, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 11, 0, 14, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, 22, 0, 0
	object_event 7, MAP_OBJ_GFX_BREAKABLE_ROCK, 0, 11, 0, 9, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_BreakableRock, 24, 0, 0
	object_event 8, MAP_OBJ_GFX_BREAKABLE_ROCK, 0, 7, 0, 6, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_BreakableRock, 25, 0, 0
	object_event 9, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 15, 0, 11, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, 23, 0, 0

SeafloorCavern_Room2_MapWarps:: @ 838D234
	warp_def 12, 19, 3, 2, SeafloorCavern_Room1
	warp_def 5, 19, 3, 0, SeafloorCavern_Room4
	warp_def 5, 2, 3, 0, SeafloorCavern_Room6
	warp_def 12, 2, 3, 0, SeafloorCavern_Room7

SeafloorCavern_Room2_MapEvents:: @ 838D254
	map_events SeafloorCavern_Room2_MapObjects, SeafloorCavern_Room2_MapWarps, 0x0, 0x0
