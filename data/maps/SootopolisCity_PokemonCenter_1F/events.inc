SootopolisCity_PokemonCenter_1F_EventObjects:: @ 838AE40
	object_event 1, EVENT_OBJ_GFX_NURSE, 0, 7, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, SootopolisCity_PokemonCenter_1F_EventScript_15BC70, 0
	object_event 2, EVENT_OBJ_GFX_GENTLEMAN, 0, 12, 4, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, SootopolisCity_PokemonCenter_1F_EventScript_15B1A8, 0
	object_event 3, EVENT_OBJ_GFX_WOMAN_7, 0, 4, 7, 3, MOVEMENT_TYPE_WANDER_LEFT_AND_RIGHT, 1, 0, 0, 0, SootopolisCity_PokemonCenter_1F_EventScript_15B1D0, 0

SootopolisCity_PokemonCenter_1F_MapWarps:: @ 838AE88
	warp_def 7, 8, 3, 0, MAP_SOOTOPOLIS_CITY
	warp_def 6, 8, 3, 0, MAP_SOOTOPOLIS_CITY
	warp_def 1, 6, 4, 0, MAP_SOOTOPOLIS_CITY_POKEMON_CENTER_2F

SootopolisCity_PokemonCenter_1F_MapEvents:: @ 838AEA0
	map_events SootopolisCity_PokemonCenter_1F_EventObjects, SootopolisCity_PokemonCenter_1F_MapWarps, 0x0, 0x0
