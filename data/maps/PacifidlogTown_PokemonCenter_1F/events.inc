PacifidlogTown_PokemonCenter_1F_EventObjects:: @ 8386E30
	object_event 1, EVENT_OBJ_GFX_NURSE, 0, 7, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, PacifidlogTown_PokemonCenter_1F_EventScript_153F18, 0
	object_event 2, EVENT_OBJ_GFX_OLD_MAN_2, 0, 10, 6, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, PacifidlogTown_PokemonCenter_1F_EventScript_154129, 0
	object_event 3, EVENT_OBJ_GFX_GIRL_2, 0, 2, 2, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, PacifidlogTown_PokemonCenter_1F_EventScript_154117, 0
	object_event 4, EVENT_OBJ_GFX_WOMAN_1, 0, 4, 5, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, PacifidlogTown_PokemonCenter_1F_EventScript_154120, 0

PacifidlogTown_PokemonCenter_1F_MapWarps:: @ 8386E90
	warp_def 7, 8, 3, 0, MAP_PACIFIDLOG_TOWN
	warp_def 6, 8, 3, 0, MAP_PACIFIDLOG_TOWN
	warp_def 1, 6, 4, 0, MAP_PACIFIDLOG_TOWN_POKEMON_CENTER_2F

PacifidlogTown_PokemonCenter_1F_MapEvents:: @ 8386EA8
	map_events PacifidlogTown_PokemonCenter_1F_EventObjects, PacifidlogTown_PokemonCenter_1F_MapWarps, 0x0, 0x0
