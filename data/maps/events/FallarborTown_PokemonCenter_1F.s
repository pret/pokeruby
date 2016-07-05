FallarborTown_PokemonCenter_1F_MapObjects:: @ 8386860
	object_event 1, MAP_OBJ_GFX_NURSE, 0, 7, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, FallarborTown_PokemonCenter_1F_EventScript_153B02, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_GIRL_3, 0, 10, 0, 6, 0, 3, 10, 0, 0, 0, 0, 0, 0, FallarborTown_PokemonCenter_1F_EventScript_153B10, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_OLD_MAN_1, 0, 2, 0, 3, 0, 3, 8, 0, 0, 0, 0, 0, 0, FallarborTown_PokemonCenter_1F_EventScript_153B19, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_WOMAN_3, 0, 10, 0, 2, 0, 3, 7, 0, 0, 0, 0, 0, 0, FallarborTown_PokemonCenter_1F_EventScript_153B22, 871, 0, 0

FallarborTown_PokemonCenter_1F_MapWarps:: @ 83868C0
	warp_def 7, 8, 3, 2, FallarborTown
	warp_def 6, 8, 3, 2, FallarborTown
	warp_def 1, 6, 4, 0, FallarborTown_PokemonCenter_2F

FallarborTown_PokemonCenter_1F_MapEvents:: @ 83868D8
	map_events FallarborTown_PokemonCenter_1F_MapObjects, FallarborTown_PokemonCenter_1F_MapWarps, 0x0, 0x0
