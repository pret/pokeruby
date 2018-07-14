LavaridgeTown_PokemonCenter_1F_EventObjects:: @ 8386554
	object_event 1, EVENT_OBJ_GFX_NURSE, 0, 7, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, LavaridgeTown_PokemonCenter_1F_EventScript_15391B, 0
	object_event 2, EVENT_OBJ_GFX_YOUNGSTER, 0, 11, 8, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, LavaridgeTown_PokemonCenter_1F_EventScript_153929, 0
	object_event 3, EVENT_OBJ_GFX_WOMAN_4, 0, 10, 6, 0, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, LavaridgeTown_PokemonCenter_1F_EventScript_153932, 0
	object_event 4, EVENT_OBJ_GFX_GENTLEMAN, 0, 1, 3, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, LavaridgeTown_PokemonCenter_1F_EventScript_15393B, 0

LavaridgeTown_PokemonCenter_1F_MapWarps:: @ 83865B4
	warp_def 7, 8, 3, 3, MAP_LAVARIDGE_TOWN
	warp_def 6, 8, 3, 3, MAP_LAVARIDGE_TOWN
	warp_def 1, 6, 4, 0, MAP_LAVARIDGE_TOWN_POKEMON_CENTER_2F
	warp_def 2, 1, 0, 5, MAP_LAVARIDGE_TOWN

LavaridgeTown_PokemonCenter_1F_MapEvents:: @ 83865D4
	map_events LavaridgeTown_PokemonCenter_1F_EventObjects, LavaridgeTown_PokemonCenter_1F_MapWarps, 0x0, 0x0
