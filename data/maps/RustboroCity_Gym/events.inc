RustboroCity_Gym_EventObjects:: @ 8388998
	object_event 1, EVENT_OBJ_GFX_ROXANNE, 0, 5, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, RustboroCity_Gym_EventScript_1578D9, 0
	object_event 2, EVENT_OBJ_GFX_YOUNGSTER, 0, 7, 12, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 1, 3, RustboroCity_Gym_EventScript_157960, 0
	object_event 3, EVENT_OBJ_GFX_YOUNGSTER, 0, 3, 7, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 1, 3, RustboroCity_Gym_EventScript_157977, 0
	object_event 4, EVENT_OBJ_GFX_MAN_2, 0, 3, 17, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, RustboroCity_Gym_EventScript_15798E, 0

RustboroCity_Gym_MapWarps:: @ 83889F8
	warp_def 5, 18, 0, 0, MAP_RUSTBORO_CITY
	warp_def 6, 18, 0, 0, MAP_RUSTBORO_CITY

RustboroCity_Gym_MapBGEvents:: @ 8388A08
	bg_event 2, 17, 0, BG_EVENT_PLAYER_FACING_NORTH, RustboroCity_Gym_EventScript_1579AD
	bg_event 8, 17, 0, BG_EVENT_PLAYER_FACING_NORTH, RustboroCity_Gym_EventScript_1579BD

RustboroCity_Gym_MapEvents:: @ 8388A20
	map_events RustboroCity_Gym_EventObjects, RustboroCity_Gym_MapWarps, 0x0, RustboroCity_Gym_MapBGEvents
