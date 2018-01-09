DewfordTown_PokemonCenter_1F_MapObjects:: @ 8385EC4
	object_event 1, MAP_OBJ_GFX_NURSE, 0, 7, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, DewfordTown_PokemonCenter_1F_EventScript_153023, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_WOMAN_2, 0, 10, 0, 6, 0, 3, 10, 0, 0, 0, 0, 0, 0, DewfordTown_PokemonCenter_1F_EventScript_153031, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_MAN_4, 0, 5, 0, 5, 0, 0, 5, 18, 0, 0, 0, 0, 0, DewfordTown_PokemonCenter_1F_EventScript_15303A, 0, 0, 0

DewfordTown_PokemonCenter_1F_MapWarps:: @ 8385F0C
	warp_def 7, 8, 3, 1, MAP_DEWFORD_TOWN
	warp_def 6, 8, 3, 1, MAP_DEWFORD_TOWN
	warp_def 1, 6, 4, 0, MAP_DEWFORD_TOWN_POKEMON_CENTER_2F

DewfordTown_PokemonCenter_1F_MapEvents:: @ 8385F24
	map_events DewfordTown_PokemonCenter_1F_MapObjects, DewfordTown_PokemonCenter_1F_MapWarps, 0x0, 0x0
