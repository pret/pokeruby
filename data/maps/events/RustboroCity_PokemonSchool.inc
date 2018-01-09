RustboroCity_PokemonSchool_MapObjects:: @ 8388A34
	object_event 1, MAP_OBJ_GFX_BOY_5, 0, 8, 0, 6, 0, 3, 10, 0, 0, 0, 0, 0, 0, RustboroCity_PokemonSchool_EventScript_157A98, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_BOY_5, 0, 9, 0, 6, 0, 3, 9, 0, 0, 0, 0, 0, 0, RustboroCity_PokemonSchool_EventScript_157AA1, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_BOY_4, 0, 3, 0, 8, 0, 3, 7, 0, 0, 0, 0, 0, 0, RustboroCity_PokemonSchool_EventScript_157AAA, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_LASS, 0, 10, 0, 8, 0, 3, 7, 0, 0, 0, 0, 0, 0, RustboroCity_PokemonSchool_EventScript_157AB3, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_SCHOOL_KID_M, 0, 3, 0, 6, 0, 3, 8, 0, 0, 0, 0, 0, 0, RustboroCity_PokemonSchool_EventScript_157ABC, 0, 0, 0
	object_event 6, MAP_OBJ_GFX_GENTLEMAN, 0, 5, 0, 3, 0, 3, 8, 17, 0, 0, 0, 0, 0, RustboroCity_PokemonSchool_EventScript_157ACE, 0, 0, 0

RustboroCity_PokemonSchool_MapWarps:: @ 8388AC4
	warp_def 5, 10, 0, 4, MAP_RUSTBORO_CITY
	warp_def 6, 10, 0, 4, MAP_RUSTBORO_CITY

RustboroCity_PokemonSchool_MapBGEvents:: @ 8388AD4
	bg_event 5, 2, 0, 0, 0, RustboroCity_PokemonSchool_EventScript_1579E2
	bg_event 4, 2, 0, 0, 0, RustboroCity_PokemonSchool_EventScript_1579E2
	bg_event 6, 2, 0, 0, 0, RustboroCity_PokemonSchool_EventScript_1579E2
	bg_event 7, 2, 0, 0, 0, RustboroCity_PokemonSchool_EventScript_1579E2
	bg_event 3, 5, 0, 0, 0, RustboroCity_PokemonSchool_EventScript_157AC5

RustboroCity_PokemonSchool_MapEvents:: @ 8388B10
	map_events RustboroCity_PokemonSchool_MapObjects, RustboroCity_PokemonSchool_MapWarps, 0x0, RustboroCity_PokemonSchool_MapBGEvents
