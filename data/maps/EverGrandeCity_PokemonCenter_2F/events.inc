EverGrandeCity_PokemonCenter_2F_EventObjects:: @ 838B5D0
	object_event 1, EVENT_OBJ_GFX_TEALA, 0, 4, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, EverGrandeCity_PokemonCenter_2F_EventScript_15BCA0, 0
	object_event 2, EVENT_OBJ_GFX_TEALA, 0, 7, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, EverGrandeCity_PokemonCenter_2F_EventScript_15BCA6, 0
	object_event 3, EVENT_OBJ_GFX_TEALA, 0, 10, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, EverGrandeCity_PokemonCenter_2F_EventScript_15BCAC, 0

EverGrandeCity_PokemonCenter_2F_MapWarps:: @ 838B618
	warp_def 1, 5, 4, 2, MAP_EVER_GRANDE_CITY_POKEMON_CENTER_1F
	warp_def 5, 1, 0, 0, MAP_SINGLE_BATTLE_COLOSSEUM
	warp_def 8, 1, 0, 0, MAP_TRADE_CENTER
	warp_def 11, 1, 0, 0, MAP_RECORD_CORNER
	warp_def 0, 0, 0, 0, MAP_DOUBLE_BATTLE_COLOSSEUM

EverGrandeCity_PokemonCenter_2F_MapEvents:: @ 838B640
	map_events EverGrandeCity_PokemonCenter_2F_EventObjects, EverGrandeCity_PokemonCenter_2F_MapWarps, 0x0, 0x0
