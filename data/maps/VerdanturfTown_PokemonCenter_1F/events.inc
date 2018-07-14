VerdanturfTown_PokemonCenter_1F_EventObjects:: @ 8386BF4
	object_event 1, EVENT_OBJ_GFX_NURSE, 0, 7, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, VerdanturfTown_PokemonCenter_1F_EventScript_153F18, 0
	object_event 2, EVENT_OBJ_GFX_GENTLEMAN, 0, 4, 5, 3, MOVEMENT_TYPE_WANDER_LEFT_AND_RIGHT, 1, 0, 0, 0, VerdanturfTown_PokemonCenter_1F_EventScript_153F26, 0
	object_event 3, EVENT_OBJ_GFX_OLD_MAN_1, 0, 12, 2, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, VerdanturfTown_PokemonCenter_1F_EventScript_153F2F, 0

VerdanturfTown_PokemonCenter_1F_MapWarps:: @ 8386C3C
	warp_def 7, 8, 3, 2, MAP_VERDANTURF_TOWN
	warp_def 6, 8, 3, 2, MAP_VERDANTURF_TOWN
	warp_def 1, 6, 4, 0, MAP_VERDANTURF_TOWN_POKEMON_CENTER_2F

VerdanturfTown_PokemonCenter_1F_MapEvents:: @ 8386C54
	map_events VerdanturfTown_PokemonCenter_1F_EventObjects, VerdanturfTown_PokemonCenter_1F_MapWarps, 0x0, 0x0
