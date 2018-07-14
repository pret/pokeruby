Route114_FossilManiacsHouse_EventObjects:: @ 838B87C
	object_event 1, EVENT_OBJ_GFX_LITTLE_BOY_1, 0, 3, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 0, 0, Route114_FossilManiacsHouse_EventScript_15C1C3, 0

Route114_FossilManiacsHouse_MapWarps:: @ 838B894
	warp_def 4, 7, 0, 1, MAP_ROUTE114
	warp_def 5, 7, 0, 1, MAP_ROUTE114
	warp_def 4, 1, 0, 0, MAP_ROUTE114_FOSSIL_MANIACS_TUNNEL

Route114_FossilManiacsHouse_MapBGEvents:: @ 838B8AC
	bg_event 5, 3, 0, BG_EVENT_PLAYER_FACING_NORTH, Route114_FossilManiacsHouse_EventScript_15C1FC
	bg_event 6, 3, 0, BG_EVENT_PLAYER_FACING_NORTH, Route114_FossilManiacsHouse_EventScript_15C1FC
	bg_event 7, 2, 0, BG_EVENT_PLAYER_FACING_NORTH, Route114_FossilManiacsHouse_EventScript_15C205
	bg_event 8, 2, 0, BG_EVENT_PLAYER_FACING_NORTH, Route114_FossilManiacsHouse_EventScript_15C205

Route114_FossilManiacsHouse_MapEvents:: @ 838B8DC
	map_events Route114_FossilManiacsHouse_EventObjects, Route114_FossilManiacsHouse_MapWarps, 0x0, Route114_FossilManiacsHouse_MapBGEvents
