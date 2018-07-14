CaveOfOrigin_1F_MapWarps:: @ 838D718
	warp_def 11, 17, 3, 1, MAP_CAVE_OF_ORIGIN_ENTRANCE
	warp_def 14, 5, 3, 0, MAP_CAVE_OF_ORIGIN_B1F

CaveOfOrigin_1F_MapCoordEvents:: @ 838D728
	coord_event 7, 11, 3, VAR_TEMP_1, 0, CaveOfOrigin_1F_EventScript_1A04AF
	coord_event 6, 11, 3, VAR_TEMP_1, 0, CaveOfOrigin_1F_EventScript_1A04AF
	coord_event 5, 11, 3, VAR_TEMP_1, 0, CaveOfOrigin_1F_EventScript_1A04AF

CaveOfOrigin_1F_MapEvents:: @ 838D758
	map_events 0x0, CaveOfOrigin_1F_MapWarps, CaveOfOrigin_1F_MapCoordEvents, 0x0
