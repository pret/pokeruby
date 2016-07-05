DewfordTown_PokemonCenter_2F_MapObjects:: @ 8385F38
	object_event 1, MAP_OBJ_GFX_TEALA, 0, 4, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, DewfordTown_PokemonCenter_2F_EventScript_153053, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_TEALA, 0, 7, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, DewfordTown_PokemonCenter_2F_EventScript_153059, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_TEALA, 0, 10, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, DewfordTown_PokemonCenter_2F_EventScript_15305F, 0, 0, 0

DewfordTown_PokemonCenter_2F_MapWarps:: @ 8385F80
	warp_def 1, 5, 4, 2, DewfordTown_PokemonCenter_1F
	warp_def 5, 1, 0, 0, SingleBattleColosseum
	warp_def 8, 1, 0, 0, TradeCenter
	warp_def 11, 1, 0, 0, RecordCorner
	warp_def 0, 0, 0, 0, DoubleBattleColosseum

DewfordTown_PokemonCenter_2F_MapEvents:: @ 8385FA8
	map_events DewfordTown_PokemonCenter_2F_MapObjects, DewfordTown_PokemonCenter_2F_MapWarps, 0x0, 0x0
