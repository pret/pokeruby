MauvilleCity_PokemonCenter_2F_EventObjects:: @ 8388704
	object_event 1, EVENT_OBJ_GFX_TEALA, 0, 4, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, MauvilleCity_PokemonCenter_2F_EventScript_1573A2, 0
	object_event 2, EVENT_OBJ_GFX_TEALA, 0, 7, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, MauvilleCity_PokemonCenter_2F_EventScript_1573A8, 0
	object_event 3, EVENT_OBJ_GFX_TEALA, 0, 10, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, MauvilleCity_PokemonCenter_2F_EventScript_1573AE, 0
	object_event 4, EVENT_OBJ_GFX_YOUNGSTER, 0, 6, 7, 3, MOVEMENT_TYPE_WANDER_LEFT_AND_RIGHT, 1, 0, 0, 0, MauvilleCity_PokemonCenter_2F_EventScript_1573B4, 0

MauvilleCity_PokemonCenter_2F_MapWarps:: @ 8388764
	warp_def 1, 5, 4, 2, MAP_MAUVILLE_CITY_POKEMON_CENTER_1F
	warp_def 5, 1, 0, 0, MAP_SINGLE_BATTLE_COLOSSEUM
	warp_def 8, 1, 0, 0, MAP_TRADE_CENTER
	warp_def 11, 1, 0, 0, MAP_RECORD_CORNER
	warp_def 0, 0, 0, 0, MAP_DOUBLE_BATTLE_COLOSSEUM

MauvilleCity_PokemonCenter_2F_MapEvents:: @ 838878C
	map_events MauvilleCity_PokemonCenter_2F_EventObjects, MauvilleCity_PokemonCenter_2F_MapWarps, 0x0, 0x0
