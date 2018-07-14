RustboroCity_House2_EventObjects:: @ 8388DF0
	object_event 1, EVENT_OBJ_GFX_WOMAN_2, 0, 4, 4, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, RustboroCity_House2_EventScript_157D67, 0
	object_event 2, EVENT_OBJ_GFX_LITTLE_GIRL_2, 0, 4, 5, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, RustboroCity_House2_EventScript_157D70, 0

RustboroCity_House2_MapWarps:: @ 8388E20
	warp_def 5, 8, 0, 9, MAP_RUSTBORO_CITY
	warp_def 6, 8, 0, 9, MAP_RUSTBORO_CITY

RustboroCity_House2_MapEvents:: @ 8388E30
	map_events RustboroCity_House2_EventObjects, RustboroCity_House2_MapWarps, 0x0, 0x0
