CaveOfOrigin_B3F_EventObjects:: @ 838D814
	object_event 1, EVENT_OBJ_GFX_ITEM_BALL, 0, 6, 5, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, CaveOfOrigin_B3F_EventScript_1B1A44, FLAG_ITEM_CAVE_OF_ORIGIN_B3F_1

CaveOfOrigin_B3F_MapWarps:: @ 838D82C
	warp_def 7, 14, 3, 1, MAP_CAVE_OF_ORIGIN_B2F
	warp_def 12, 6, 3, 0, MAP_CAVE_OF_ORIGIN_B4F

CaveOfOrigin_B3F_MapCoordEvents:: @ 838D83C
	coord_event 5, 11, 3, VAR_TEMP_1, 0, CaveOfOrigin_B3F_EventScript_1A04AF
	coord_event 8, 6, 3, VAR_TEMP_2, 0, CaveOfOrigin_B3F_EventScript_1A04BB
	coord_event 8, 5, 3, VAR_TEMP_2, 0, CaveOfOrigin_B3F_EventScript_1A04BB

CaveOfOrigin_B3F_MapEvents:: @ 838D86C
	map_events CaveOfOrigin_B3F_EventObjects, CaveOfOrigin_B3F_MapWarps, CaveOfOrigin_B3F_MapCoordEvents, 0x0
