RustboroCity_PokemonCenter_1F_MapObjects:: @ 8388B24
	object_event 1, MAP_OBJ_GFX_NURSE, 0, 7, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, RustboroCity_PokemonCenter_1F_EventScript_157B88, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_MAN_1, 0, 11, 0, 2, 0, 3, 9, 0, 0, 0, 0, 0, 0, RustboroCity_PokemonCenter_1F_EventScript_157B96, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_BOY_1, 0, 3, 0, 4, 0, 3, 2, 17, 0, 0, 0, 0, 0, RustboroCity_PokemonCenter_1F_EventScript_157B9F, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_GIRL_3, 0, 10, 0, 6, 0, 3, 10, 0, 0, 0, 0, 0, 0, RustboroCity_PokemonCenter_1F_EventScript_157BA8, 0, 0, 0

RustboroCity_PokemonCenter_1F_MapWarps:: @ 8388B84
	warp_def 7, 8, 3, 3, RustboroCity
	warp_def 6, 8, 3, 3, RustboroCity
	warp_def 1, 6, 4, 0, RustboroCity_PokemonCenter_2F

RustboroCity_PokemonCenter_1F_MapEvents:: @ 8388B9C
	map_events RustboroCity_PokemonCenter_1F_MapObjects, RustboroCity_PokemonCenter_1F_MapWarps, 0x0, 0x0
