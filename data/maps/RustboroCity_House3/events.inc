RustboroCity_House3_EventObjects:: @ 8388F40
	object_event 1, EVENT_OBJ_GFX_OLD_MAN_2, 0, 4, 5, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, RustboroCity_House3_EventScript_157DED, 0
	object_event 2, EVENT_OBJ_GFX_OLD_WOMAN_2, 0, 7, 5, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, RustboroCity_House3_EventScript_157DF6, 0
	object_event 3, EVENT_OBJ_GFX_PIKACHU, 0, 4, 4, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, RustboroCity_House3_EventScript_157DFF, 0

RustboroCity_House3_MapWarps:: @ 8388F88
	warp_def 5, 8, 0, 11, MAP_RUSTBORO_CITY
	warp_def 6, 8, 0, 11, MAP_RUSTBORO_CITY

RustboroCity_House3_MapEvents:: @ 8388F98
	map_events RustboroCity_House3_EventObjects, RustboroCity_House3_MapWarps, 0x0, 0x0
