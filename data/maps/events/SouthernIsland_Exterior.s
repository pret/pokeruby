SouthernIsland_Exterior_MapObjects:: @ 8391E00
	object_event 1, MAP_OBJ_GFX_SAILOR, 0, 13, 0, 23, 0, 3, 7, 0, 0, 0, 0, 0, 0, SouthernIsland_Exterior_EventScript_160AE0, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_SS_TIDAL, 0, 13, 0, 25, 0, 1, 10, 0, 0, 0, 0, 0, 0, 0x0, 0, 0, 0

SouthernIsland_Exterior_MapWarps:: @ 8391E30
	warp_def 14, 5, 3, 0, SouthernIsland_Interior
	warp_def 15, 5, 3, 1, SouthernIsland_Interior

SouthernIsland_Exterior_MapBGEvents:: @ 8391E40
	bg_event 16, 7, 3, 0, 0, SouthernIsland_Exterior_EventScript_160B4A

SouthernIsland_Exterior_MapEvents:: @ 8391E4C
	map_events SouthernIsland_Exterior_MapObjects, SouthernIsland_Exterior_MapWarps, 0x0, SouthernIsland_Exterior_MapBGEvents
