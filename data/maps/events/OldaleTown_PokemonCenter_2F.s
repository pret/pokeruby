OldaleTown_PokemonCenter_2F_MapObjects:: @ 8385D68
	object_event 1, MAP_OBJ_GFX_TEALA, 0, 4, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, OldaleTown_PokemonCenter_2F_EventScript_152F66, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_TEALA, 0, 7, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, OldaleTown_PokemonCenter_2F_EventScript_152F6C, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_TEALA, 0, 10, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, OldaleTown_PokemonCenter_2F_EventScript_152F72, 0, 0, 0

OldaleTown_PokemonCenter_2F_MapWarps:: @ 8385DB0
	warp_def 1, 5, 4, 2, OldaleTown_PokemonCenter_1F
	warp_def 5, 1, 0, 0, SingleBattleColosseum
	warp_def 8, 1, 0, 0, TradeCenter
	warp_def 11, 1, 0, 0, RecordCorner
	warp_def 0, 0, 0, 0, DoubleBattleColosseum

OldaleTown_PokemonCenter_2F_MapEvents:: @ 8385DD8
	map_events OldaleTown_PokemonCenter_2F_MapObjects, OldaleTown_PokemonCenter_2F_MapWarps, 0x0, 0x0

