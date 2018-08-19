LavaridgeTown_PokemonCenter_2F_EventObjects:: @ 83865E8
	object_event 1, EVENT_OBJ_GFX_TEALA, 0, 10, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, LavaridgeTown_PokemonCenter_2F_EventScript_153960, 0
	object_event 2, EVENT_OBJ_GFX_TEALA, 0, 4, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, LavaridgeTown_PokemonCenter_2F_EventScript_153954, 0
	object_event 3, EVENT_OBJ_GFX_TEALA, 0, 7, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, LavaridgeTown_PokemonCenter_2F_EventScript_15395A, 0

LavaridgeTown_PokemonCenter_2F_MapWarps:: @ 8386630
	warp_def 1, 5, 4, 2, MAP_LAVARIDGE_TOWN_POKEMON_CENTER_1F
	warp_def 5, 1, 0, 0, MAP_SINGLE_BATTLE_COLOSSEUM
	warp_def 8, 1, 0, 0, MAP_TRADE_CENTER
	warp_def 11, 1, 0, 0, MAP_RECORD_CORNER
	warp_def 0, 0, 0, 0, MAP_DOUBLE_BATTLE_COLOSSEUM

LavaridgeTown_PokemonCenter_2F_MapEvents:: @ 8386658
	map_events LavaridgeTown_PokemonCenter_2F_EventObjects, LavaridgeTown_PokemonCenter_2F_MapWarps, 0x0, 0x0
