SootopolisCity_MapObjects:: @ 8380608
	object_event 1, MAP_OBJ_GFX_BEAUTY, 0, 29, 0, 20, 0, 3, 8, 0, 0, 0, 0, 0, 0, SootopolisCity_EventScript_14D18D, FLAG_HIDE_CAVE_OF_ORIGIN_ENTRANCE_WOMAN_1, 0, 0
	object_event 2, MAP_OBJ_GFX_BEAUTY, 0, 33, 0, 20, 0, 3, 8, 0, 0, 0, 0, 0, 0, SootopolisCity_EventScript_14D196, FLAG_HIDE_CAVE_OF_ORIGIN_ENTRANCE_WOMAN_2, 0, 0
	object_event 3, MAP_OBJ_GFX_OLD_MAN_1, 0, 36, 0, 21, 0, 3, 8, 0, 0, 0, 0, 0, 0, SootopolisCity_EventScript_14D16E, FLAG_HIDE_SOOTOPOLIS_RESIDENTS, 0, 0
	object_event 4, MAP_OBJ_GFX_WOMAN_5, 0, 47, 0, 42, 0, 3, 8, 0, 0, 0, 0, 0, 0, SootopolisCity_EventScript_14D268, FLAG_HIDE_SOOTOPOLIS_RESIDENTS, 0, 0
	object_event 5, MAP_OBJ_GFX_WALLACE, 0, 32, 0, 21, 0, 3, 9, 0, 0, 0, 0, 0, 0, SootopolisCity_EventScript_14D48F, FLAG_HIDE_WALLACE_SOOTOPOLIS, 0, 0
	object_event 6, MAP_OBJ_GFX_GIRL_2, 0, 9, 0, 43, 0, 3, 5, 1, 0, 0, 0, 0, 0, SootopolisCity_EventScript_14D19F, FLAG_HIDE_SOOTOPOLIS_RESIDENTS, 0, 0
	object_event 7, MAP_OBJ_GFX_LITTLE_BOY_1, 0, 51, 0, 14, 0, 3, 8, 0, 0, 0, 0, 0, 0, SootopolisCity_EventScript_14D2C5, FLAG_HIDE_SOOTOPOLIS_RESIDENTS, 0, 0
	object_event 8, MAP_OBJ_GFX_BOY_1, 0, 43, 0, 26, 0, 3, 1, 0, 0, 0, 0, 0, 0, SootopolisCity_EventScript_14D2E4, FLAG_HIDE_SOOTOPOLIS_RESIDENTS, 0, 0
	object_event 9, MAP_OBJ_GFX_MAN_1, 0, 26, 0, 4, 0, 3, 5, 1, 0, 0, 0, 0, 0, SootopolisCity_EventScript_14D287, FLAG_HIDE_SOOTOPOLIS_RESIDENTS, 0, 0
	object_event 10, MAP_OBJ_GFX_STEVEN, 0, 30, 0, 21, 0, 3, 10, 17, 0, 0, 0, 0, 0, SootopolisCity_EventScript_14D498, FLAG_HIDE_STEVEN_SOOTOPOLIS, 0, 0
	object_event 11, MAP_OBJ_GFX_WOMAN_7, 0, 49, 0, 34, 0, 3, 3, 17, 0, 0, 0, 0, 0, SootopolisCity_EventScript_14D2A6, FLAG_HIDE_SOOTOPOLIS_RESIDENTS, 0, 0

SootopolisCity_MapWarps:: @ 8380710
	warp_def 43, 31, 0, 0, MAP_SOOTOPOLIS_CITY_POKEMON_CENTER_1F
	warp_def 17, 29, 0, 0, MAP_SOOTOPOLIS_CITY_MART
	warp_def 31, 32, 0, 0, MAP_SOOTOPOLIS_CITY_GYM_1F
	warp_def 31, 16, 3, 0, MAP_CAVE_OF_ORIGIN_ENTRANCE
	warp_def 9, 6, 0, 0, MAP_SOOTOPOLIS_CITY_HOUSE1
	warp_def 45, 6, 0, 0, MAP_SOOTOPOLIS_CITY_HOUSE2
	warp_def 9, 17, 0, 0, MAP_SOOTOPOLIS_CITY_HOUSE3
	warp_def 44, 17, 0, 0, MAP_SOOTOPOLIS_CITY_HOUSE4
	warp_def 9, 26, 0, 0, MAP_SOOTOPOLIS_CITY_HOUSE5
	warp_def 53, 28, 0, 0, MAP_SOOTOPOLIS_CITY_HOUSE6
	warp_def 8, 35, 0, 0, MAP_SOOTOPOLIS_CITY_HOUSE7
	warp_def 48, 25, 0, 0, MAP_SOOTOPOLIS_CITY_HOUSE8

SootopolisCity_MapCoordEvents:: @ 8380770
	coord_event 25, 6, 3, 0, 0x405e, 1, 0, SootopolisCity_EventScript_14D308

SootopolisCity_MapBGEvents:: @ 8380780
	bg_event 32, 34, 0, 0, 0, SootopolisCity_EventScript_14D2ED
	bg_event 19, 29, 0, 1, 0, SootopolisCity_EventScript_1A00E1
	bg_event 44, 31, 0, 1, 0, SootopolisCity_EventScript_1A00EA
	bg_event 45, 31, 0, 1, 0, SootopolisCity_EventScript_1A00EA
	bg_event 18, 29, 0, 1, 0, SootopolisCity_EventScript_1A00E1
	bg_event 41, 37, 0, 0, 0, SootopolisCity_EventScript_14D2F6

SootopolisCity_MapEvents:: @ 83807C8
	map_events SootopolisCity_MapObjects, SootopolisCity_MapWarps, SootopolisCity_MapCoordEvents, SootopolisCity_MapBGEvents
