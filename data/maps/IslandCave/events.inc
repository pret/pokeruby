IslandCave_EventObjects:: @ 838E674
	object_event 1, EVENT_OBJ_GFX_REGICE, 0, 8, 7, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, IslandCave_EventScript_15EF9D, FLAG_HIDE_REGICE

IslandCave_MapWarps:: @ 838E68C
	warp_def 8, 29, 3, 0, MAP_ROUTE105
	warp_def 8, 20, 0, 2, MAP_ISLAND_CAVE
	warp_def 8, 11, 3, 1, MAP_ISLAND_CAVE

IslandCave_MapBGEvents:: @ 838E6A4
	bg_event 8, 20, 0, BG_EVENT_PLAYER_FACING_ANY, IslandCave_EventScript_15EF59
	bg_event 7, 20, 0, BG_EVENT_PLAYER_FACING_ANY, IslandCave_EventScript_15EF7C
	bg_event 9, 20, 0, BG_EVENT_PLAYER_FACING_ANY, IslandCave_EventScript_15EF7C

IslandCave_MapEvents:: @ 838E6C8
	map_events IslandCave_EventObjects, IslandCave_MapWarps, 0x0, IslandCave_MapBGEvents
