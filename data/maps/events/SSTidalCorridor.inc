SSTidalCorridor_MapObjects:: @ 83916F8
	object_event 1, MAP_OBJ_GFX_SAILOR, 0, 1, 0, 11, 0, 3, 7, 0, 0, 0, 0, 0, 0, SSTidalCorridor_EventScript_15FDD6, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_SAILOR, 0, 16, 0, 7, 0, 3, 3, 32, 0, 0, 0, 0, 0, SSTidalCorridor_EventScript_15FE60, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_OLD_MAN_1, 0, 9, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, SSTidalCorridor_EventScript_15FD96, 950, 0, 0
	object_event 4, MAP_OBJ_GFX_WINGULL, 0, 7, 0, 2, 0, 3, 1, 17, 0, 0, 0, 0, 0, SSTidalCorridor_EventScript_15FD9F, 950, 0, 0

SSTidalCorridor_MapWarps:: @ 8391758
	warp_def 4, 9, 3, 0, MAP_SS_TIDAL_ROOMS
	warp_def 7, 9, 3, 2, MAP_SS_TIDAL_ROOMS
	warp_def 10, 9, 3, 4, MAP_SS_TIDAL_ROOMS
	warp_def 13, 9, 3, 6, MAP_SS_TIDAL_ROOMS
	warp_def 4, 3, 3, 8, MAP_SS_TIDAL_ROOMS
	warp_def 7, 3, 3, 9, MAP_SS_TIDAL_ROOMS
	warp_def 10, 3, 3, 10, MAP_SS_TIDAL_ROOMS
	warp_def 13, 3, 3, 11, MAP_SS_TIDAL_ROOMS
	warp_def 16, 2, 3, 0, MAP_SS_TIDAL_LOWER_DECK

SSTidalCorridor_MapBGEvents:: @ 83917A0
	bg_event 2, 1, 0, 0, 0, SSTidalCorridor_EventScript_15FE3A
	bg_event 4, 1, 0, 0, 0, SSTidalCorridor_EventScript_15FE3A
	bg_event 6, 1, 0, 0, 0, SSTidalCorridor_EventScript_15FE3A
	bg_event 8, 1, 0, 0, 0, SSTidalCorridor_EventScript_15FE3A
	bg_event 10, 1, 0, 0, 0, SSTidalCorridor_EventScript_15FE3A
	bg_event 12, 1, 0, 0, 0, SSTidalCorridor_EventScript_15FE3A
	bg_event 14, 1, 0, 0, 0, SSTidalCorridor_EventScript_15FE3A
	bg_event 16, 1, 0, 0, 0, SSTidalCorridor_EventScript_15FE3A
	bg_event 5, 9, 0, 1, 0, SSTidalCorridor_EventScript_15FDB2
	bg_event 8, 9, 0, 1, 0, SSTidalCorridor_EventScript_15FDBB
	bg_event 11, 9, 0, 1, 0, SSTidalCorridor_EventScript_15FDC4
	bg_event 14, 9, 0, 1, 0, SSTidalCorridor_EventScript_15FDCD

SSTidalCorridor_MapEvents:: @ 8391830
	map_events SSTidalCorridor_MapObjects, SSTidalCorridor_MapWarps, 0x0, SSTidalCorridor_MapBGEvents
