MossdeepCity_SpaceCenter_1F_EventObjects:: @ 838AB64
	object_event 1, EVENT_OBJ_GFX_SCIENTIST_1, 0, 7, 2, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, MossdeepCity_SpaceCenter_1F_EventScript_15AB8B, 0
	object_event 2, EVENT_OBJ_GFX_SCIENTIST_1, 0, 2, 2, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, MossdeepCity_SpaceCenter_1F_EventScript_15ABCC, 0
	object_event 3, EVENT_OBJ_GFX_SAILOR, 0, 6, 6, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, MossdeepCity_SpaceCenter_1F_EventScript_15ABD5, 0
	object_event 4, EVENT_OBJ_GFX_OLD_MAN_2, 0, 10, 2, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, MossdeepCity_SpaceCenter_1F_EventScript_15AC1F, 0
	object_event 5, EVENT_OBJ_GFX_WOMAN_5, 0, 14, 7, 3, MOVEMENT_TYPE_WANDER_UP_AND_DOWN, 1, 1, 0, 0, MossdeepCity_SpaceCenter_1F_EventScript_15AC16, 0

MossdeepCity_SpaceCenter_1F_MapWarps:: @ 838ABDC
	warp_def 7, 9, 0, 8, MAP_MOSSDEEP_CITY
	warp_def 8, 9, 0, 8, MAP_MOSSDEEP_CITY
	warp_def 13, 1, 0, 0, MAP_MOSSDEEP_CITY_SPACE_CENTER_2F

MossdeepCity_SpaceCenter_1F_MapEvents:: @ 838ABF4
	map_events MossdeepCity_SpaceCenter_1F_EventObjects, MossdeepCity_SpaceCenter_1F_MapWarps, 0x0, 0x0
