VerdanturfTown_PokemonCenter_2F_MapObjects:: @ 8386C68
	object_event 1, MAP_OBJ_GFX_TEALA, 0, 4, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, VerdanturfTown_PokemonCenter_2F_EventScript_153F48, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_TEALA, 0, 7, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, VerdanturfTown_PokemonCenter_2F_EventScript_153F4E, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_TEALA, 0, 10, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, VerdanturfTown_PokemonCenter_2F_EventScript_153F54, 0, 0, 0

VerdanturfTown_PokemonCenter_2F_MapWarps:: @ 8386CB0
	warp_def 1, 5, 4, 2, VerdanturfTown_PokemonCenter_1F
	warp_def 5, 1, 0, 0, SingleBattleColosseum
	warp_def 8, 1, 0, 0, TradeCenter
	warp_def 11, 1, 0, 0, RecordCorner
	warp_def 0, 0, 0, 0, DoubleBattleColosseum

VerdanturfTown_PokemonCenter_2F_MapEvents:: @ 8386CD8
	map_events VerdanturfTown_PokemonCenter_2F_MapObjects, VerdanturfTown_PokemonCenter_2F_MapWarps, 0x0, 0x0
