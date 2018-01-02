SouthernIsland_Interior_MapObjects:: @ 8391E60
	object_event 1, MAP_OBJ_GFX_VAR_0, 0, 13, 0, 12, 0, 3, 7, 0, 0, 0, 0, 0, 0, 0x0, FLAG_HIDE_LATIOS_OR_LATIAS_FLYING, 0, 0
	object_event 2, MAP_OBJ_GFX_VAR_1, 0, 13, 0, 2, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0x0, FLAG_HIDE_LATIOS_OR_LATIAS_STATIONARY, 0, 0

SouthernIsland_Interior_MapWarps:: @ 8391E90
	warp_def 13, 18, 3, 0, MAP_SOUTHERN_ISLAND_EXTERIOR
	warp_def 14, 18, 3, 1, MAP_SOUTHERN_ISLAND_EXTERIOR

SouthernIsland_Interior_MapBGEvents:: @ 8391EA0
	bg_event 13, 11, 3, 1, 0, SouthernIsland_Interior_EventScript_160B9B

SouthernIsland_Interior_MapEvents:: @ 8391EAC
	map_events SouthernIsland_Interior_MapObjects, SouthernIsland_Interior_MapWarps, 0x0, SouthernIsland_Interior_MapBGEvents
