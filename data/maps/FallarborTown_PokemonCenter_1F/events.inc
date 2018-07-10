FallarborTown_PokemonCenter_1F_EventObjects:: @ 8386860
	object_event 1, EVENT_OBJ_GFX_NURSE, 0, 7, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, FallarborTown_PokemonCenter_1F_EventScript_153B02, 0
	object_event 2, EVENT_OBJ_GFX_GIRL_3, 0, 10, 6, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, FallarborTown_PokemonCenter_1F_EventScript_153B10, 0
	object_event 3, EVENT_OBJ_GFX_OLD_MAN_1, 0, 2, 3, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, FallarborTown_PokemonCenter_1F_EventScript_153B19, 0
	object_event 4, EVENT_OBJ_GFX_WOMAN_3, 0, 10, 2, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, FallarborTown_PokemonCenter_1F_EventScript_153B22, FLAG_HIDE_LANETTE_FALLARBOR

FallarborTown_PokemonCenter_1F_MapWarps:: @ 83868C0
	warp_def 7, 8, 3, 2, MAP_FALLARBOR_TOWN
	warp_def 6, 8, 3, 2, MAP_FALLARBOR_TOWN
	warp_def 1, 6, 4, 0, MAP_FALLARBOR_TOWN_POKEMON_CENTER_2F

FallarborTown_PokemonCenter_1F_MapEvents:: @ 83868D8
	map_events FallarborTown_PokemonCenter_1F_EventObjects, FallarborTown_PokemonCenter_1F_MapWarps, 0x0, 0x0
