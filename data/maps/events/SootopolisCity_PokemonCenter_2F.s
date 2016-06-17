SootopolisCity_PokemonCenter_2F_MapObjects:: @ 838AEB4
	object_event 1, MAP_OBJ_GFX_TEALA, 0, 4, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, SootopolisCity_PokemonCenter_2F_EventScript_15B208, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_TEALA, 0, 7, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, SootopolisCity_PokemonCenter_2F_EventScript_15B20E, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_TEALA, 0, 10, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, SootopolisCity_PokemonCenter_2F_EventScript_15B214, 0, 0, 0

SootopolisCity_PokemonCenter_2F_MapWarps:: @ 838AEFC
	warp_def 1, 5, 4, 2, SootopolisCity_PokemonCenter_1F
	warp_def 5, 1, 0, 0, SingleBattleColosseum
	warp_def 8, 1, 0, 0, TradeCenter
	warp_def 11, 1, 0, 0, RecordCorner
	warp_def 0, 0, 0, 0, DoubleBattleColosseum

SootopolisCity_PokemonCenter_2F_MapEvents:: @ 838AF24
	map_events SootopolisCity_PokemonCenter_2F_MapObjects, SootopolisCity_PokemonCenter_2F_MapWarps, 0x0, 0x0

