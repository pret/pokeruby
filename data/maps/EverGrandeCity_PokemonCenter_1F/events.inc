EverGrandeCity_PokemonCenter_1F_EventObjects:: @ 838B55C
	object_event 1, EVENT_OBJ_GFX_NURSE, 0, 7, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, EverGrandeCity_PokemonCenter_1F_EventScript_15BC70, 0
	object_event 2, EVENT_OBJ_GFX_WOMAN_7, 0, 5, 5, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, EverGrandeCity_PokemonCenter_1F_EventScript_15BC7E, 0
	object_event 3, EVENT_OBJ_GFX_OLD_MAN_1, 0, 10, 7, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, EverGrandeCity_PokemonCenter_1F_EventScript_15BC87, 0

EverGrandeCity_PokemonCenter_1F_MapWarps:: @ 838B5A4
	warp_def 7, 8, 3, 1, MAP_EVER_GRANDE_CITY
	warp_def 6, 8, 3, 1, MAP_EVER_GRANDE_CITY
	warp_def 1, 6, 4, 0, MAP_EVER_GRANDE_CITY_POKEMON_CENTER_2F

EverGrandeCity_PokemonCenter_1F_MapEvents:: @ 838B5BC
	map_events EverGrandeCity_PokemonCenter_1F_EventObjects, EverGrandeCity_PokemonCenter_1F_MapWarps, 0x0, 0x0
