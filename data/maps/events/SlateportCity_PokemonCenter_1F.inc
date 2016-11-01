SlateportCity_PokemonCenter_1F_MapObjects:: @ 83880B8
	object_event 1, MAP_OBJ_GFX_NURSE, 0, 7, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, SlateportCity_PokemonCenter_1F_EventScript_1563CE, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_SAILOR, 0, 2, 0, 3, 0, 3, 8, 0, 0, 0, 0, 0, 0, SlateportCity_PokemonCenter_1F_EventScript_1563DC, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_WOMAN_7, 0, 10, 0, 7, 0, 3, 10, 0, 0, 0, 0, 0, 0, SlateportCity_PokemonCenter_1F_EventScript_1563E5, 0, 0, 0

SlateportCity_PokemonCenter_1F_MapWarps:: @ 8388100
	warp_def 7, 8, 3, 0, SlateportCity
	warp_def 6, 8, 3, 0, SlateportCity
	warp_def 1, 6, 4, 0, SlateportCity_PokemonCenter_2F

SlateportCity_PokemonCenter_1F_MapEvents:: @ 8388118
	map_events SlateportCity_PokemonCenter_1F_MapObjects, SlateportCity_PokemonCenter_1F_MapWarps, 0x0, 0x0
