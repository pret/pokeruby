RustboroCity_House1_EventObjects:: @ 8388D48
	object_event 1, EVENT_OBJ_GFX_LITTLE_BOY_1, 0, 6, 4, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, RustboroCity_House1_EventScript_157C7D, 0
	object_event 2, EVENT_OBJ_GFX_HIKER, 0, 9, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, RustboroCity_House1_EventScript_157D1D, 0

RustboroCity_House1_MapWarps:: @ 8388D78
	warp_def 5, 7, 0, 7, MAP_RUSTBORO_CITY
	warp_def 6, 7, 0, 7, MAP_RUSTBORO_CITY

RustboroCity_House1_MapEvents:: @ 8388D88
	map_events RustboroCity_House1_EventObjects, RustboroCity_House1_MapWarps, 0x0, 0x0
