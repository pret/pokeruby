MossdeepCity_SpaceCenter_2F_EventObjects:: @ 838AC08
	object_event 1, EVENT_OBJ_GFX_BOY_4, 0, 6, 2, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, MossdeepCity_SpaceCenter_2F_EventScript_15AC49, 0
	object_event 2, EVENT_OBJ_GFX_GENTLEMAN, 0, 11, 8, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, MossdeepCity_SpaceCenter_2F_EventScript_15AC40, 0
	object_event 3, EVENT_OBJ_GFX_SCIENTIST_1, 0, 5, 6, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, MossdeepCity_SpaceCenter_2F_EventScript_15AC37, 0

MossdeepCity_SpaceCenter_2F_MapWarps:: @ 838AC50
	warp_def 13, 1, 0, 2, MAP_MOSSDEEP_CITY_SPACE_CENTER_1F

MossdeepCity_SpaceCenter_2F_MapEvents:: @ 838AC58
	map_events MossdeepCity_SpaceCenter_2F_EventObjects, MossdeepCity_SpaceCenter_2F_MapWarps, 0x0, 0x0
