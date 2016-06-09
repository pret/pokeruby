MossdeepCity_PokemonCenter_2F_MapObjects:: @ 838A8E8
	object_event 1, MAP_OBJ_GFX_TEALA, 0, 4, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, MossdeepCity_PokemonCenter_2F_EventScript_15A913, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_TEALA, 0, 7, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, MossdeepCity_PokemonCenter_2F_EventScript_15A919, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_TEALA, 0, 10, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, MossdeepCity_PokemonCenter_2F_EventScript_15A91F, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_WOMAN_7, 0, 10, 0, 6, 0, 3, 5, 18, 0, 0, 0, 0, 0, MossdeepCity_PokemonCenter_2F_EventScript_15A90A, 0, 0, 0

MossdeepCity_PokemonCenter_2F_MapWarps:: @ 838A948
	warp_def 1, 5, 4, 2, MossdeepCity_PokemonCenter_1F
	warp_def 5, 1, 0, 0, SingleBattleColosseum
	warp_def 8, 1, 0, 0, TradeCenter
	warp_def 11, 1, 0, 0, RecordCorner
	warp_def 0, 0, 0, 0, DoubleBattleColosseum

MossdeepCity_PokemonCenter_2F_MapEvents:: @ 838A970
	map_events MossdeepCity_PokemonCenter_2F_MapObjects, MossdeepCity_PokemonCenter_2F_MapWarps, 0x0, 0x0

