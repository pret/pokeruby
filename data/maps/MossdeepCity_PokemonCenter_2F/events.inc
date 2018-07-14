MossdeepCity_PokemonCenter_2F_EventObjects:: @ 838A8E8
	object_event 1, EVENT_OBJ_GFX_TEALA, 0, 4, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, MossdeepCity_PokemonCenter_2F_EventScript_15A913, 0
	object_event 2, EVENT_OBJ_GFX_TEALA, 0, 7, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, MossdeepCity_PokemonCenter_2F_EventScript_15A919, 0
	object_event 3, EVENT_OBJ_GFX_TEALA, 0, 10, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, MossdeepCity_PokemonCenter_2F_EventScript_15A91F, 0
	object_event 4, EVENT_OBJ_GFX_WOMAN_7, 0, 10, 6, 3, MOVEMENT_TYPE_WANDER_LEFT_AND_RIGHT, 2, 1, 0, 0, MossdeepCity_PokemonCenter_2F_EventScript_15A90A, 0

MossdeepCity_PokemonCenter_2F_MapWarps:: @ 838A948
	warp_def 1, 5, 4, 2, MAP_MOSSDEEP_CITY_POKEMON_CENTER_1F
	warp_def 5, 1, 0, 0, MAP_SINGLE_BATTLE_COLOSSEUM
	warp_def 8, 1, 0, 0, MAP_TRADE_CENTER
	warp_def 11, 1, 0, 0, MAP_RECORD_CORNER
	warp_def 0, 0, 0, 0, MAP_DOUBLE_BATTLE_COLOSSEUM

MossdeepCity_PokemonCenter_2F_MapEvents:: @ 838A970
	map_events MossdeepCity_PokemonCenter_2F_EventObjects, MossdeepCity_PokemonCenter_2F_MapWarps, 0x0, 0x0
