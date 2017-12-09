SeafloorCavern_Room9_MapObjects:: @ 838D620
	object_event 1, 248, 0, 17, 0, 38, 0, 3, 8, 0, 0, 0, 0, 0, 0, 0x0, FLAG_HIDE_AWAKENED_MON_SEAFLOOR_CAVERN, 0, 0
	object_event 2, 246, 0, 9, 0, 42, 0, 3, 10, 0, 0, 0, 0, 0, 0, 0x0, FLAG_HIDE_EVIL_LEADER_SEAFLOOR_CAVERN, 0, 0
	object_event 3, 247, 0, 9, 0, 42, 0, 3, 10, 0, 0, 0, 0, 0, 0, 0x0, FLAG_HIDE_OTHER_LEADER_SEAFLOOR_CAVERN, 0, 0
	object_event 4, 244, 0, 8, 0, 41, 0, 3, 10, 0, 0, 0, 0, 0, 0, 0x0, FLAG_HIDE_OTHER_TEAM_GRUNTS_SEAFLOOR_CAVERN, 0, 0
	object_event 5, 245, 0, 8, 0, 42, 0, 3, 10, 0, 0, 0, 0, 0, 0, 0x0, FLAG_HIDE_OTHER_TEAM_GRUNTS_SEAFLOOR_CAVERN, 0, 0
	object_event 6, MAP_OBJ_GFX_ITEM_BALL, 0, 14, 0, 5, 0, 3, 1, 17, 0, 0, 0, 0, 0, SeafloorCavern_Room9_EventScript_1B1A37, 1090, 0, 0
	object_event 7, 249, 0, 17, 0, 38, 0, 3, 8, 17, 0, 0, 0, 0, 0, 0x0, FLAG_HIDE_SLEEPING_MON_SEAFLOOR_CAVERN, 0, 0

SeafloorCavern_Room9_MapWarps:: @ 838D6C8
	warp_def 5, 4, 3, 0, MAP_SEAFLOOR_CAVERN_ROOM8

SeafloorCavern_Room9_MapCoordEvents:: @ 838D6D0
	coord_event 17, 42, 3, 0, 0x40a2, 0, 0, SeafloorCavern_Room9_EventScript_15DAFA

SeafloorCavern_Room9_MapEvents:: @ 838D6E0
	map_events SeafloorCavern_Room9_MapObjects, SeafloorCavern_Room9_MapWarps, SeafloorCavern_Room9_MapCoordEvents, 0x0
