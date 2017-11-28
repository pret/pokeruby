RustboroCity_Gym_MapObjects:: @ 8388998
	object_event 1, MAP_OBJ_GFX_ROXANNE, 0, 5, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, RustboroCity_Gym_EventScript_1578D9, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_YOUNGSTER, 0, 7, 0, 12, 0, 3, 9, 0, 0, 1, 0, 3, 0, RustboroCity_Gym_EventScript_157960, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_YOUNGSTER, 0, 3, 0, 7, 0, 3, 10, 0, 0, 1, 0, 3, 0, RustboroCity_Gym_EventScript_157977, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_MAN_2, 0, 3, 0, 17, 0, 3, 8, 0, 0, 0, 0, 0, 0, RustboroCity_Gym_EventScript_15798E, 0, 0, 0

RustboroCity_Gym_MapWarps:: @ 83889F8
	warp_def 5, 18, 0, 0, MAP_RUSTBORO_CITY
	warp_def 6, 18, 0, 0, MAP_RUSTBORO_CITY

RustboroCity_Gym_MapBGEvents:: @ 8388A08
	bg_event 2, 17, 0, 1, 0, RustboroCity_Gym_EventScript_1579AD
	bg_event 8, 17, 0, 1, 0, RustboroCity_Gym_EventScript_1579BD

RustboroCity_Gym_MapEvents:: @ 8388A20
	map_events RustboroCity_Gym_MapObjects, RustboroCity_Gym_MapWarps, 0x0, RustboroCity_Gym_MapBGEvents
