MossdeepCity_Gym_EventObjects:: @ 838A660
	object_event 1, EVENT_OBJ_GFX_TATE, 0, 8, 3, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, MossdeepCity_Gym_EventScript_15A56B, 0
	object_event 2, EVENT_OBJ_GFX_PSYCHIC_M, 0, 2, 24, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 1, 1, MossdeepCity_Gym_EventScript_15A74E, 0
	object_event 3, EVENT_OBJ_GFX_PSYCHIC_M, 0, 17, 18, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 1, 1, MossdeepCity_Gym_EventScript_15A77C, 0
	object_event 4, EVENT_OBJ_GFX_LASS, 0, 9, 17, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 1, 1, MossdeepCity_Gym_EventScript_15A7C1, 0
	object_event 5, EVENT_OBJ_GFX_LASS, 0, 11, 10, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 1, 1, MossdeepCity_Gym_EventScript_15A7AA, 0
	object_event 6, EVENT_OBJ_GFX_PSYCHIC_M, 0, 0, 7, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 1, 1, MossdeepCity_Gym_EventScript_15A765, 0
	object_event 7, EVENT_OBJ_GFX_LASS, 0, 4, 3, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 1, 2, MossdeepCity_Gym_EventScript_15A793, 0
	object_event 8, EVENT_OBJ_GFX_MAN_2, 0, 8, 29, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, MossdeepCity_Gym_EventScript_15A7D8, 0
	object_event 9, EVENT_OBJ_GFX_LIZA, 0, 9, 3, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, MossdeepCity_Gym_EventScript_15A56B, 0

MossdeepCity_Gym_MapWarps:: @ 838A738
	warp_def 9, 29, 0, 1, MAP_MOSSDEEP_CITY
	warp_def 10, 29, 0, 1, MAP_MOSSDEEP_CITY

MossdeepCity_Gym_MapCoordEvents:: @ 838A748
	coord_event 12, 3, 3, VAR_TEMP_1, 0, MossdeepCity_Gym_EventScript_15A742

MossdeepCity_Gym_MapBGEvents:: @ 838A758
	bg_event 2, 7, 0, BG_EVENT_PLAYER_FACING_ANY, MossdeepCity_Gym_EventScript_15A5EA
	bg_event 8, 10, 0, BG_EVENT_PLAYER_FACING_ANY, MossdeepCity_Gym_EventScript_15A646
	bg_event 17, 15, 0, BG_EVENT_PLAYER_FACING_ANY, MossdeepCity_Gym_EventScript_15A69A
	bg_event 5, 24, 0, BG_EVENT_PLAYER_FACING_ANY, MossdeepCity_Gym_EventScript_15A6EE
	bg_event 7, 27, 0, BG_EVENT_PLAYER_FACING_NORTH, MossdeepCity_Gym_EventScript_15A7FA
	bg_event 11, 27, 0, BG_EVENT_PLAYER_FACING_NORTH, MossdeepCity_Gym_EventScript_15A80A

MossdeepCity_Gym_MapEvents:: @ 838A7A0
	map_events MossdeepCity_Gym_EventObjects, MossdeepCity_Gym_MapWarps, MossdeepCity_Gym_MapCoordEvents, MossdeepCity_Gym_MapBGEvents
