VerdanturfTown_PokemonCenter_1F_MapObjects:: @ 8386BF4
	object_event 1, MAP_OBJ_GFX_NURSE, 0, 7, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, VerdanturfTown_PokemonCenter_1F_EventScript_153F18, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_GENTLEMAN, 0, 4, 0, 5, 0, 3, 5, 1, 0, 0, 0, 0, 0, VerdanturfTown_PokemonCenter_1F_EventScript_153F26, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_OLD_MAN_1, 0, 12, 0, 2, 0, 3, 7, 0, 0, 0, 0, 0, 0, VerdanturfTown_PokemonCenter_1F_EventScript_153F2F, 0, 0, 0

VerdanturfTown_PokemonCenter_1F_MapWarps:: @ 8386C3C
	warp_def 7, 8, 3, 2, VerdanturfTown
	warp_def 6, 8, 3, 2, VerdanturfTown
	warp_def 1, 6, 4, 0, VerdanturfTown_PokemonCenter_2F

VerdanturfTown_PokemonCenter_1F_MapEvents:: @ 8386C54
	map_events VerdanturfTown_PokemonCenter_1F_MapObjects, VerdanturfTown_PokemonCenter_1F_MapWarps, 0x0, 0x0
