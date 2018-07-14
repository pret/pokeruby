CaveOfOrigin_B4F_EventObjects:: @ 838D880
	object_event 1, EVENT_OBJ_GFX_VAR_8, 0, 9, 10, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, 0x0, FLAG_HIDE_LEGEND_MON_CAVE_OF_ORIGIN

CaveOfOrigin_B4F_MapWarps:: @ 838D898
	warp_def 12, 5, 3, 1, MAP_CAVE_OF_ORIGIN_B3F

CaveOfOrigin_B4F_MapCoordEvents:: @ 838D8A0
	coord_event 9, 13, 3, VAR_CAVE_OF_ORIGIN_B4F_STATE, 0, CaveOfOrigin_B4F_EventScript_15DDD7
	coord_event 13, 9, 3, VAR_TEMP_5, 0, CaveOfOrigin_B4F_EventScript_1A04A0
	coord_event 5, 9, 3, VAR_TEMP_5, 0, CaveOfOrigin_B4F_EventScript_1A04A0

CaveOfOrigin_B4F_MapEvents:: @ 838D8D0
	map_events CaveOfOrigin_B4F_EventObjects, CaveOfOrigin_B4F_MapWarps, CaveOfOrigin_B4F_MapCoordEvents, 0x0
