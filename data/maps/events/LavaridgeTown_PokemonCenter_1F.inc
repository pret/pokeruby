LavaridgeTown_PokemonCenter_1F_EventObjects:: @ 8386554
	object_event 1, EVENT_OBJ_GFX_NURSE, 0, 7, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, LavaridgeTown_PokemonCenter_1F_EventScript_15391B, 0, 0, 0
	object_event 2, EVENT_OBJ_GFX_YOUNGSTER, 0, 11, 0, 8, 0, 3, 7, 0, 0, 0, 0, 0, 0, LavaridgeTown_PokemonCenter_1F_EventScript_153929, 0, 0, 0
	object_event 3, EVENT_OBJ_GFX_WOMAN_4, 0, 10, 0, 6, 0, 0, 9, 0, 0, 0, 0, 0, 0, LavaridgeTown_PokemonCenter_1F_EventScript_153932, 0, 0, 0
	object_event 4, EVENT_OBJ_GFX_GENTLEMAN, 0, 1, 0, 3, 0, 3, 10, 0, 0, 0, 0, 0, 0, LavaridgeTown_PokemonCenter_1F_EventScript_15393B, 0, 0, 0

LavaridgeTown_PokemonCenter_1F_MapWarps:: @ 83865B4
	warp_def 7, 8, 3, 3, MAP_LAVARIDGE_TOWN
	warp_def 6, 8, 3, 3, MAP_LAVARIDGE_TOWN
	warp_def 1, 6, 4, 0, MAP_LAVARIDGE_TOWN_POKEMON_CENTER_2F
	warp_def 2, 1, 0, 5, MAP_LAVARIDGE_TOWN

LavaridgeTown_PokemonCenter_1F_MapEvents:: @ 83865D4
	map_events LavaridgeTown_PokemonCenter_1F_EventObjects, LavaridgeTown_PokemonCenter_1F_MapWarps, 0x0, 0x0
