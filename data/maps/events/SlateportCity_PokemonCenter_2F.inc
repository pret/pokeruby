SlateportCity_PokemonCenter_2F_MapObjects:: @ 838812C
	object_event 1, MAP_OBJ_GFX_TEALA, 0, 4, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, SlateportCity_PokemonCenter_2F_EventScript_1563FE, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_TEALA, 0, 7, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, SlateportCity_PokemonCenter_2F_EventScript_156404, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_TEALA, 0, 10, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, SlateportCity_PokemonCenter_2F_EventScript_15640A, 0, 0, 0

SlateportCity_PokemonCenter_2F_MapWarps:: @ 8388174
	warp_def 1, 5, 4, 2, SlateportCity_PokemonCenter_1F
	warp_def 5, 1, 0, 0, SingleBattleColosseum
	warp_def 8, 1, 0, 0, TradeCenter
	warp_def 11, 1, 0, 0, RecordCorner
	warp_def 0, 0, 0, 0, DoubleBattleColosseum

SlateportCity_PokemonCenter_2F_MapEvents:: @ 838819C
	map_events SlateportCity_PokemonCenter_2F_MapObjects, SlateportCity_PokemonCenter_2F_MapWarps, 0x0, 0x0
