FallarborTown_PokemonCenter_2F_EventObjects:: @ 83868EC
	object_event 1, EVENT_OBJ_GFX_TEALA, 0, 10, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, FallarborTown_PokemonCenter_2F_EventScript_153BA8, 0
	object_event 2, EVENT_OBJ_GFX_TEALA, 0, 4, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, FallarborTown_PokemonCenter_2F_EventScript_153B9C, 0
	object_event 3, EVENT_OBJ_GFX_TEALA, 0, 7, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, FallarborTown_PokemonCenter_2F_EventScript_153BA2, 0

FallarborTown_PokemonCenter_2F_MapWarps:: @ 8386934
	warp_def 1, 5, 4, 2, MAP_FALLARBOR_TOWN_POKEMON_CENTER_1F
	warp_def 5, 1, 3, 0, MAP_SINGLE_BATTLE_COLOSSEUM
	warp_def 8, 1, 3, 0, MAP_TRADE_CENTER
	warp_def 11, 1, 3, 0, MAP_RECORD_CORNER
	warp_def 0, 0, 0, 0, MAP_DOUBLE_BATTLE_COLOSSEUM

FallarborTown_PokemonCenter_2F_MapEvents:: @ 838695C
	map_events FallarborTown_PokemonCenter_2F_EventObjects, FallarborTown_PokemonCenter_2F_MapWarps, 0x0, 0x0
