LavaridgeTown_Mart_EventObjects:: @ 83864E8
	object_event 1, EVENT_OBJ_GFX_MART_EMPLOYEE, 0, 1, 3, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, LavaridgeTown_Mart_EventScript_1538CB, 0
	object_event 2, EVENT_OBJ_GFX_OLD_MAN_1, 0, 4, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, LavaridgeTown_Mart_EventScript_1538FA, 0
	object_event 3, EVENT_OBJ_GFX_OLD_WOMAN_2, 0, 9, 5, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, LavaridgeTown_Mart_EventScript_153903, 0

LavaridgeTown_Mart_MapWarps:: @ 8386530
	warp_def 3, 7, 0, 2, MAP_LAVARIDGE_TOWN
	warp_def 4, 7, 0, 2, MAP_LAVARIDGE_TOWN

LavaridgeTown_Mart_MapEvents:: @ 8386540
	map_events LavaridgeTown_Mart_EventObjects, LavaridgeTown_Mart_MapWarps, 0x0, 0x0
