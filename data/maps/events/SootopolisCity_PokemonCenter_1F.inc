SootopolisCity_PokemonCenter_1F_MapObjects:: @ 838AE40
	object_event 1, MAP_OBJ_GFX_NURSE, 0, 7, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, SootopolisCity_PokemonCenter_1F_EventScript_15BC70, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_GENTLEMAN, 0, 12, 0, 4, 0, 3, 2, 17, 0, 0, 0, 0, 0, SootopolisCity_PokemonCenter_1F_EventScript_15B1A8, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_WOMAN_7, 0, 4, 0, 7, 0, 3, 5, 1, 0, 0, 0, 0, 0, SootopolisCity_PokemonCenter_1F_EventScript_15B1D0, 0, 0, 0

SootopolisCity_PokemonCenter_1F_MapWarps:: @ 838AE88
	warp_def 7, 8, 3, 0, SootopolisCity
	warp_def 6, 8, 3, 0, SootopolisCity
	warp_def 1, 6, 4, 0, SootopolisCity_PokemonCenter_2F

SootopolisCity_PokemonCenter_1F_MapEvents:: @ 838AEA0
	map_events SootopolisCity_PokemonCenter_1F_MapObjects, SootopolisCity_PokemonCenter_1F_MapWarps, 0x0, 0x0
