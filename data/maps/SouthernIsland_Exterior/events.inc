SouthernIsland_Exterior_EventObjects:: @ 8391E00
	object_event 1, EVENT_OBJ_GFX_SAILOR, 0, 13, 23, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, SouthernIsland_Exterior_EventScript_160AE0, 0
	object_event 2, EVENT_OBJ_GFX_SS_TIDAL, 0, 13, 25, 1, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, 0x0, 0

SouthernIsland_Exterior_MapWarps:: @ 8391E30
	warp_def 14, 5, 3, 0, MAP_SOUTHERN_ISLAND_INTERIOR
	warp_def 15, 5, 3, 1, MAP_SOUTHERN_ISLAND_INTERIOR

SouthernIsland_Exterior_MapBGEvents:: @ 8391E40
	bg_event 16, 7, 3, BG_EVENT_PLAYER_FACING_ANY, SouthernIsland_Exterior_EventScript_160B4A

SouthernIsland_Exterior_MapEvents:: @ 8391E4C
	map_events SouthernIsland_Exterior_EventObjects, SouthernIsland_Exterior_MapWarps, 0x0, SouthernIsland_Exterior_MapBGEvents
