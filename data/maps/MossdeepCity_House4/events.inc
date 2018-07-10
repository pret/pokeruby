MossdeepCity_House4_EventObjects:: @ 838AAF8
	object_event 1, EVENT_OBJ_GFX_WOMAN_3, 0, 3, 4, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, MossdeepCity_House4_EventScript_15AB31, 0
	object_event 2, EVENT_OBJ_GFX_LITTLE_BOY_1, 0, 6, 6, 3, MOVEMENT_TYPE_WANDER_LEFT_AND_RIGHT, 1, 0, 0, 0, MossdeepCity_House4_EventScript_15AB50, 0
	object_event 3, EVENT_OBJ_GFX_SKITTY, 0, 2, 4, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, MossdeepCity_House4_EventScript_15AB77, 0

MossdeepCity_House4_MapWarps:: @ 838AB40
	warp_def 4, 7, 0, 7, MAP_MOSSDEEP_CITY
	warp_def 3, 7, 0, 7, MAP_MOSSDEEP_CITY

MossdeepCity_House4_MapEvents:: @ 838AB50
	map_events MossdeepCity_House4_EventObjects, MossdeepCity_House4_MapWarps, 0x0, 0x0
