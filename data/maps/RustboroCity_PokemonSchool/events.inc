RustboroCity_PokemonSchool_EventObjects:: @ 8388A34
	object_event 1, EVENT_OBJ_GFX_BOY_5, 0, 8, 6, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, RustboroCity_PokemonSchool_EventScript_157A98, 0
	object_event 2, EVENT_OBJ_GFX_BOY_5, 0, 9, 6, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, RustboroCity_PokemonSchool_EventScript_157AA1, 0
	object_event 3, EVENT_OBJ_GFX_BOY_4, 0, 3, 8, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, RustboroCity_PokemonSchool_EventScript_157AAA, 0
	object_event 4, EVENT_OBJ_GFX_LASS, 0, 10, 8, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, RustboroCity_PokemonSchool_EventScript_157AB3, 0
	object_event 5, EVENT_OBJ_GFX_SCHOOL_KID_M, 0, 3, 6, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, RustboroCity_PokemonSchool_EventScript_157ABC, 0
	object_event 6, EVENT_OBJ_GFX_GENTLEMAN, 0, 5, 3, 3, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 0, 0, RustboroCity_PokemonSchool_EventScript_157ACE, 0

RustboroCity_PokemonSchool_MapWarps:: @ 8388AC4
	warp_def 5, 10, 0, 4, MAP_RUSTBORO_CITY
	warp_def 6, 10, 0, 4, MAP_RUSTBORO_CITY

RustboroCity_PokemonSchool_MapBGEvents:: @ 8388AD4
	bg_event 5, 2, 0, BG_EVENT_PLAYER_FACING_ANY, RustboroCity_PokemonSchool_EventScript_1579E2
	bg_event 4, 2, 0, BG_EVENT_PLAYER_FACING_ANY, RustboroCity_PokemonSchool_EventScript_1579E2
	bg_event 6, 2, 0, BG_EVENT_PLAYER_FACING_ANY, RustboroCity_PokemonSchool_EventScript_1579E2
	bg_event 7, 2, 0, BG_EVENT_PLAYER_FACING_ANY, RustboroCity_PokemonSchool_EventScript_1579E2
	bg_event 3, 5, 0, BG_EVENT_PLAYER_FACING_ANY, RustboroCity_PokemonSchool_EventScript_157AC5

RustboroCity_PokemonSchool_MapEvents:: @ 8388B10
	map_events RustboroCity_PokemonSchool_EventObjects, RustboroCity_PokemonSchool_MapWarps, 0x0, RustboroCity_PokemonSchool_MapBGEvents
