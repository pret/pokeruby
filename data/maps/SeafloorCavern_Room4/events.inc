SeafloorCavern_Room4_EventObjects:: @ 838D384
	object_event 1, EVENT_OBJ_GFX_VAR_1, 0, 4, 8, 3, MOVEMENT_TYPE_ROTATE_COUNTERCLOCKWISE, 1, 1, 1, 3, SeafloorCavern_Room4_EventScript_15DACB, FLAG_HIDE_EVIL_TEAM_GRUNTS_SEAFLOOR_CAVERN

SeafloorCavern_Room4_MapWarps:: @ 838D39C
	warp_def 13, 1, 3, 1, MAP_SEAFLOOR_CAVERN_ROOM2
	warp_def 4, 1, 3, 1, MAP_SEAFLOOR_CAVERN_ROOM5
	warp_def 9, 10, 3, 2, MAP_SEAFLOOR_CAVERN_ROOM5
	warp_def 10, 15, 3, 1, MAP_SEAFLOOR_CAVERN_ENTRANCE

SeafloorCavern_Room4_MapEvents:: @ 838D3BC
	map_events SeafloorCavern_Room4_EventObjects, SeafloorCavern_Room4_MapWarps, 0x0, 0x0
