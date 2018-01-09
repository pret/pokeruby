MossdeepCity_SpaceCenter_1F_MapObjects:: @ 838AB64
	object_event 1, MAP_OBJ_GFX_SCIENTIST_1, 0, 7, 0, 2, 0, 3, 7, 0, 0, 0, 0, 0, 0, MossdeepCity_SpaceCenter_1F_EventScript_15AB8B, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_SCIENTIST_1, 0, 2, 0, 2, 0, 3, 7, 0, 0, 0, 0, 0, 0, MossdeepCity_SpaceCenter_1F_EventScript_15ABCC, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_SAILOR, 0, 6, 0, 6, 0, 3, 9, 0, 0, 0, 0, 0, 0, MossdeepCity_SpaceCenter_1F_EventScript_15ABD5, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_OLD_MAN_2, 0, 10, 0, 2, 0, 3, 7, 0, 0, 0, 0, 0, 0, MossdeepCity_SpaceCenter_1F_EventScript_15AC1F, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_WOMAN_5, 0, 14, 0, 7, 0, 3, 3, 17, 0, 0, 0, 0, 0, MossdeepCity_SpaceCenter_1F_EventScript_15AC16, 0, 0, 0

MossdeepCity_SpaceCenter_1F_MapWarps:: @ 838ABDC
	warp_def 7, 9, 0, 8, MAP_MOSSDEEP_CITY
	warp_def 8, 9, 0, 8, MAP_MOSSDEEP_CITY
	warp_def 13, 1, 0, 0, MAP_MOSSDEEP_CITY_SPACE_CENTER_2F

MossdeepCity_SpaceCenter_1F_MapEvents:: @ 838ABF4
	map_events MossdeepCity_SpaceCenter_1F_MapObjects, MossdeepCity_SpaceCenter_1F_MapWarps, 0x0, 0x0
