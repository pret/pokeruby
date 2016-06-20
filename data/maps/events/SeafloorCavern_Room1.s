SeafloorCavern_Room1_MapObjects:: @ 838D0B8
	object_event 1, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 5, 0, 11, 0, 3, 1, 0, 0, 0, 0, 0, 0, PushableBoulderScript, 17, 0, 0
	object_event 2, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 12, 0, 11, 0, 3, 1, 0, 0, 0, 0, 0, 0, PushableBoulderScript, 18, 0, 0
	object_event 3, MAP_OBJ_GFX_BREAKABLE_ROCK, 0, 5, 0, 10, 0, 3, 1, 0, 0, 0, 0, 0, 0, BreakableRockScript, 19, 0, 0
	object_event 4, 241, 0, 8, 0, 6, 0, 3, 1, 17, 0, 1, 0, 2, 0, SeafloorCavern_Room1_EventScript_15DA6D, 946, 0, 0
	object_event 5, 241, 0, 15, 0, 10, 0, 3, 16, 17, 0, 1, 0, 3, 0, SeafloorCavern_Room1_EventScript_15DA84, 946, 0, 0

SeafloorCavern_Room1_MapWarps:: @ 838D130
	warp_def 5, 18, 3, 1, SeafloorCavern_Entrance
	warp_def 17, 13, 3, 0, SeafloorCavern_Room5
	warp_def 6, 2, 3, 0, SeafloorCavern_Room2

SeafloorCavern_Room1_MapEvents:: @ 838D148
	map_events SeafloorCavern_Room1_MapObjects, SeafloorCavern_Room1_MapWarps, 0x0, 0x0

