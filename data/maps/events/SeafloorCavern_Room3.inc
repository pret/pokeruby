SeafloorCavern_Room3_MapObjects:: @ 838D268
	object_event 1, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 6, 0, 13, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, 17, 0, 0
	object_event 2, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 8, 0, 12, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, 18, 0, 0
	object_event 3, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 7, 0, 11, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, 19, 0, 0
	object_event 4, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 9, 0, 11, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, 20, 0, 0
	object_event 5, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 6, 0, 10, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, 21, 0, 0
	object_event 6, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 8, 0, 10, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, 22, 0, 0
	object_event 7, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 5, 0, 9, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, 23, 0, 0
	object_event 8, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 7, 0, 9, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, 24, 0, 0
	object_event 9, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 9, 0, 9, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, 25, 0, 0
	object_event 10, 242, 0, 10, 0, 5, 0, 3, 8, 17, 0, 1, 0, 3, 0, SeafloorCavern_Room3_EventScript_15DAA8, 946, 0, 0

SeafloorCavern_Room3_MapWarps:: @ 838D358
	warp_def 8, 1, 3, 1, MAP_SEAFLOOR_CAVERN_ROOM8
	warp_def 10, 13, 3, 1, MAP_SEAFLOOR_CAVERN_ROOM7
	warp_def 4, 15, 3, 1, MAP_SEAFLOOR_CAVERN_ROOM6

SeafloorCavern_Room3_MapEvents:: @ 838D370
	map_events SeafloorCavern_Room3_MapObjects, SeafloorCavern_Room3_MapWarps, 0x0, 0x0
