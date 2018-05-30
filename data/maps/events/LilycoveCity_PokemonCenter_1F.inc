LilycoveCity_PokemonCenter_1F_EventObjects:: @ 8389D94
	object_event 1, EVENT_OBJ_GFX_NURSE, 0, 7, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, LilycoveCity_PokemonCenter_1F_EventScript_159331, 0, 0, 0
	object_event 2, EVENT_OBJ_GFX_BOY_1, 0, 10, 0, 7, 0, 3, 10, 0, 0, 0, 0, 0, 0, LilycoveCity_PokemonCenter_1F_EventScript_15933F, 0, 0, 0
	object_event 3, EVENT_OBJ_GFX_MANIAC, 0, 11, 0, 8, 0, 3, 7, 0, 0, 0, 0, 0, 0, LilycoveCity_PokemonCenter_1F_EventScript_159348, 0, 0, 0

LilycoveCity_PokemonCenter_1F_MapWarps:: @ 8389DDC
	warp_def 7, 8, 3, 2, MAP_LILYCOVE_CITY
	warp_def 6, 8, 3, 2, MAP_LILYCOVE_CITY
	warp_def 1, 6, 4, 0, MAP_LILYCOVE_CITY_POKEMON_CENTER_2F

LilycoveCity_PokemonCenter_1F_MapEvents:: @ 8389DF4
	map_events LilycoveCity_PokemonCenter_1F_EventObjects, LilycoveCity_PokemonCenter_1F_MapWarps, 0x0, 0x0
