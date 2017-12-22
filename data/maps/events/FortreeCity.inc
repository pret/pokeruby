FortreeCity_MapObjects:: @ 8380020
	object_event 1, MAP_OBJ_GFX_MAN_2, 0, 31, 0, 3, 0, 4, 1, 0, 0, 0, 0, 0, 0, FortreeCity_EventScript_14C955, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_GIRL_1, 0, 32, 0, 16, 0, 3, 2, 17, 0, 0, 0, 0, 0, FortreeCity_EventScript_14C97D, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_WOMAN_7, 0, 32, 0, 10, 0, 3, 3, 16, 0, 0, 0, 0, 0, FortreeCity_EventScript_14C95E, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_BOY_1, 0, 11, 0, 14, 0, 4, 1, 0, 0, 0, 0, 0, 0, FortreeCity_EventScript_14C98F, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_OLD_MAN_2, 0, 8, 0, 10, 0, 3, 1, 0, 0, 0, 0, 0, 0, FortreeCity_EventScript_14C986, 0, 0, 0
	object_event 6, MAP_OBJ_GFX_BOY_5, 0, 9, 0, 16, 0, 3, 8, 0, 0, 0, 0, 0, 0, FortreeCity_EventScript_14C998, 0, 0, 0
	object_event 7, MAP_OBJ_GFX_KECLEON_1, 0, 25, 0, 8, 0, 3, 76, 17, 0, 0, 0, 0, 0, FortreeCity_EventScript_14C9B3, FLAG_HIDE_KECLEON_FORTREE, 0, 0

FortreeCity_MapWarps:: @ 83800C8
	warp_def 5, 6, 0, 0, MAP_FORTREE_CITY_POKEMON_CENTER_1F
	warp_def 10, 3, 0, 0, MAP_FORTREE_CITY_HOUSE1
	warp_def 22, 11, 0, 0, MAP_FORTREE_CITY_GYM
	warp_def 4, 14, 0, 0, MAP_FORTREE_CITY_MART
	warp_def 17, 3, 0, 0, MAP_FORTREE_CITY_HOUSE2
	warp_def 25, 3, 0, 0, MAP_FORTREE_CITY_HOUSE3
	warp_def 32, 2, 0, 0, MAP_FORTREE_CITY_HOUSE4
	warp_def 12, 13, 0, 0, MAP_FORTREE_CITY_HOUSE5
	warp_def 37, 13, 0, 0, MAP_FORTREE_CITY_DECORATION_SHOP

FortreeCity_MapBGEvents:: @ 8380110
	bg_event 6, 9, 0, 0, 0, FortreeCity_EventScript_14C9A1
	bg_event 7, 6, 0, 1, 0, FortreeCity_EventScript_1A00EA
	bg_event 5, 14, 0, 1, 0, FortreeCity_EventScript_1A00E1
	bg_event 26, 10, 0, 0, 0, FortreeCity_EventScript_14C9AA
	bg_event 6, 6, 0, 1, 0, FortreeCity_EventScript_1A00EA
	bg_event 6, 14, 0, 1, 0, FortreeCity_EventScript_1A00E1

FortreeCity_MapEvents:: @ 8380158
	map_events FortreeCity_MapObjects, FortreeCity_MapWarps, 0x0, FortreeCity_MapBGEvents
