SouthernIsland_Interior_MapObjects:: @ 8391E60
	object_event 1, 240, 0, 13, 0, 12, 0, 3, 7, 0, 0, 0, 0, 0, 0, 0x0, 910, 0, 0
	object_event 2, 241, 0, 13, 0, 2, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0x0, 911, 0, 0

SouthernIsland_Interior_MapWarps:: @ 8391E90
	warp_def 13, 18, 3, 0, SouthernIsland_Exterior
	warp_def 14, 18, 3, 1, SouthernIsland_Exterior

SouthernIsland_Interior_MapBGEvents:: @ 8391EA0
	bg_event 13, 11, 3, 1, 0, SouthernIsland_Interior_EventScript_160B9B

SouthernIsland_Interior_MapEvents:: @ 8391EAC
	map_events SouthernIsland_Interior_MapObjects, SouthernIsland_Interior_MapWarps, 0x0, SouthernIsland_Interior_MapBGEvents

