CaveOfOrigin_B2F_MapWarps:: @ 838D7C0
	warp_def 5, 10, 3, 1, MAP_CAVE_OF_ORIGIN_B1F
	warp_def 8, 14, 3, 0, MAP_CAVE_OF_ORIGIN_B3F

CaveOfOrigin_B2F_MapCoordEvents:: @ 838D7D0
	coord_event 10, 6, 3, VAR_TEMP_1, 0, CaveOfOrigin_B2F_EventScript_1A04AF
	coord_event 10, 5, 3, VAR_TEMP_1, 0, CaveOfOrigin_B2F_EventScript_1A04AF
	coord_event 14, 13, 3, VAR_TEMP_2, 0, CaveOfOrigin_B2F_EventScript_1A04BB

CaveOfOrigin_B2F_MapEvents:: @ 838D800
	map_events 0x0, CaveOfOrigin_B2F_MapWarps, CaveOfOrigin_B2F_MapCoordEvents, 0x0
