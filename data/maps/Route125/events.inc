Route125_EventObjects:: @ 8384E28
	object_event 1, EVENT_OBJ_GFX_SWIMMER_M, 0, 46, 9, 1, MOVEMENT_TYPE_ROTATE_COUNTERCLOCKWISE, 0, 0, 1, 2, Route125_EventScript_151F2E, 0
	object_event 2, EVENT_OBJ_GFX_SWIMMER_M, 0, 9, 32, 1, MOVEMENT_TYPE_FACE_RIGHT, 2, 5, 1, 2, Route125_EventScript_151F45, 0
	object_event 3, EVENT_OBJ_GFX_SWIMMER_F, 0, 31, 33, 1, MOVEMENT_TYPE_WALK_RIGHT_AND_LEFT, 6, 0, 1, 3, Route125_EventScript_151F5C, 0
	object_event 4, EVENT_OBJ_GFX_SWIMMER_F, 0, 39, 20, 1, MOVEMENT_TYPE_WALK_SEQUENCE_RIGHT_DOWN_LEFT_UP, 9, 9, 1, 3, Route125_EventScript_151F73, 0
	object_event 5, EVENT_OBJ_GFX_SAILOR, 0, 23, 28, 3, MOVEMENT_TYPE_FACE_LEFT_AND_RIGHT, 0, 0, 1, 2, Route125_EventScript_151F8A, 0
	object_event 6, EVENT_OBJ_GFX_LASS, 0, 20, 21, 3, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 1, 0, Route125_EventScript_151FC8, 0
	object_event 7, EVENT_OBJ_GFX_LASS, 0, 21, 21, 3, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 1, 0, Route125_EventScript_151FE3, 0

Route125_MapWarps:: @ 8384ED0
	warp_def 22, 19, 0, 0, MAP_SHOAL_CAVE_LOW_TIDE_ENTRANCE_ROOM

Route125_MapBGEvents:: @ 8384ED8
	bg_secret_base_event 53, 10, 0, SECRET_BASE_RED_CAVE1_2
	bg_secret_base_event 55, 11, 0, SECRET_BASE_RED_CAVE4_2
	bg_secret_base_event 7, 25, 0, SECRET_BASE_YELLOW_CAVE2_2
	bg_secret_base_event 24, 32, 0, SECRET_BASE_YELLOW_CAVE4_2

Route125_MapEvents:: @ 8384F08
	map_events Route125_EventObjects, Route125_MapWarps, 0x0, Route125_MapBGEvents
