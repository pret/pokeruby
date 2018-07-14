RustboroCity_PokemonCenter_2F_EventObjects:: @ 8388BB0
	object_event 1, EVENT_OBJ_GFX_TEALA, 0, 4, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, RustboroCity_PokemonCenter_2F_EventScript_157BC1, 0
	object_event 2, EVENT_OBJ_GFX_TEALA, 0, 7, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, RustboroCity_PokemonCenter_2F_EventScript_157BC7, 0
	object_event 3, EVENT_OBJ_GFX_TEALA, 0, 10, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, RustboroCity_PokemonCenter_2F_EventScript_157BCD, 0

RustboroCity_PokemonCenter_2F_MapWarps:: @ 8388BF8
	warp_def 1, 5, 4, 2, MAP_RUSTBORO_CITY_POKEMON_CENTER_1F
	warp_def 5, 1, 0, 0, MAP_SINGLE_BATTLE_COLOSSEUM
	warp_def 8, 1, 0, 0, MAP_TRADE_CENTER
	warp_def 11, 1, 0, 0, MAP_RECORD_CORNER
	warp_def 0, 0, 0, 0, MAP_DOUBLE_BATTLE_COLOSSEUM

RustboroCity_PokemonCenter_2F_MapEvents:: @ 8388C20
	map_events RustboroCity_PokemonCenter_2F_EventObjects, RustboroCity_PokemonCenter_2F_MapWarps, 0x0, 0x0
