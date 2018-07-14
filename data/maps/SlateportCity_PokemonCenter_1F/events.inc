SlateportCity_PokemonCenter_1F_EventObjects:: @ 83880B8
	object_event 1, EVENT_OBJ_GFX_NURSE, 0, 7, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, SlateportCity_PokemonCenter_1F_EventScript_1563CE, 0
	object_event 2, EVENT_OBJ_GFX_SAILOR, 0, 2, 3, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, SlateportCity_PokemonCenter_1F_EventScript_1563DC, 0
	object_event 3, EVENT_OBJ_GFX_WOMAN_7, 0, 10, 7, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, SlateportCity_PokemonCenter_1F_EventScript_1563E5, 0

SlateportCity_PokemonCenter_1F_MapWarps:: @ 8388100
	warp_def 7, 8, 3, 0, MAP_SLATEPORT_CITY
	warp_def 6, 8, 3, 0, MAP_SLATEPORT_CITY
	warp_def 1, 6, 4, 0, MAP_SLATEPORT_CITY_POKEMON_CENTER_2F

SlateportCity_PokemonCenter_1F_MapEvents:: @ 8388118
	map_events SlateportCity_PokemonCenter_1F_EventObjects, SlateportCity_PokemonCenter_1F_MapWarps, 0x0, 0x0
