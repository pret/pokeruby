Route114_FossilManiacsTunnel_EventObjects:: @ 838B8F0
	object_event 1, EVENT_OBJ_GFX_MANIAC, 0, 5, 3, 3, MOVEMENT_TYPE_FACE_UP, 1, 1, 0, 0, Route114_FossilManiacsTunnel_EventScript_15C20F, 0

Route114_FossilManiacsTunnel_MapWarps:: @ 838B908
	warp_def 6, 25, 3, 2, MAP_ROUTE114_FOSSIL_MANIACS_HOUSE
	warp_def 7, 25, 3, 2, MAP_ROUTE114_FOSSIL_MANIACS_HOUSE

Route114_FossilManiacsTunnel_MapEvents:: @ 838B918
	map_events Route114_FossilManiacsTunnel_EventObjects, Route114_FossilManiacsTunnel_MapWarps, 0x0, 0x0
