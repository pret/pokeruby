MossdeepCity_GameCorner_1F_EventObjects:: @ 838AC6C
	object_event 1, EVENT_OBJ_GFX_OLD_MAN_1, 0, 4, 4, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, MossdeepCity_GameCorner_1F_EventScript_15AD42, 0

MossdeepCity_GameCorner_1F_MapWarps:: @ 838AC84
	warp_def 3, 7, 0, 9, MAP_MOSSDEEP_CITY
	warp_def 4, 7, 0, 9, MAP_MOSSDEEP_CITY
	warp_def 3, 1, 0, 0, MAP_MOSSDEEP_CITY_GAME_CORNER_B1F

MossdeepCity_GameCorner_1F_MapBGEvents:: @ 838AC9C
	bg_event 3, 1, 0, BG_EVENT_PLAYER_FACING_ANY, MossdeepCity_GameCorner_1F_EventScript_15AE4C

MossdeepCity_GameCorner_1F_MapEvents:: @ 838ACA8
	map_events MossdeepCity_GameCorner_1F_EventObjects, MossdeepCity_GameCorner_1F_MapWarps, 0x0, MossdeepCity_GameCorner_1F_MapBGEvents
