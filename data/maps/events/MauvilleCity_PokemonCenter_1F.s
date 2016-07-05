MauvilleCity_PokemonCenter_1F_MapObjects:: @ 8388660
	object_event 1, MAP_OBJ_GFX_NURSE, 0, 7, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, MauvilleCity_PokemonCenter_1F_EventScript_157369, 0, 0, 0
	object_event 2, 240, 0, 2, 0, 3, 0, 3, 9, 1, 0, 0, 0, 0, 0, MauvilleCity_PokemonCenter_1F_EventScript_1AE744, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_WOMAN_1, 0, 8, 0, 6, 0, 3, 1, 0, 0, 0, 0, 0, 0, MauvilleCity_PokemonCenter_1F_EventScript_157377, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_WOMAN_7, 0, 11, 0, 4, 0, 3, 3, 16, 0, 0, 0, 0, 0, MauvilleCity_PokemonCenter_1F_EventScript_157380, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_YOUNGSTER, 0, 2, 0, 8, 0, 3, 1, 17, 0, 0, 0, 0, 0, MauvilleCity_PokemonCenter_1F_EventScript_157389, 0, 0, 0

MauvilleCity_PokemonCenter_1F_MapWarps:: @ 83886D8
	warp_def 7, 8, 3, 1, MauvilleCity
	warp_def 6, 8, 3, 1, MauvilleCity
	warp_def 1, 6, 4, 0, MauvilleCity_PokemonCenter_2F

MauvilleCity_PokemonCenter_1F_MapEvents:: @ 83886F0
	map_events MauvilleCity_PokemonCenter_1F_MapObjects, MauvilleCity_PokemonCenter_1F_MapWarps, 0x0, 0x0
