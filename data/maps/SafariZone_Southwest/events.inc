SafariZone_Southwest_EventObjects:: @ 8391B18
	object_event 1, EVENT_OBJ_GFX_WOMAN_3, 0, 22, 9, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, SafariZone_Southwest_EventScript_160024, 0
	object_event 2, EVENT_OBJ_GFX_ITEM_BALL, 0, 0, 37, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, SafariZone_Southwest_EventScript_1B1926, FLAG_ITEM_SAFARI_ZONE_SOUTHWEST

SafariZone_Southwest_MapWarps:: @ 8391B48
	warp_def 29, 7, 3, 0, MAP_SAFARI_ZONE_REST_HOUSE

SafariZone_Southwest_MapBGEvents:: @ 8391B50
	bg_event 32, 7, 3, BG_EVENT_PLAYER_FACING_ANY, SafariZone_Southwest_EventScript_16002D

SafariZone_Southwest_MapEvents:: @ 8391B5C
	map_events SafariZone_Southwest_EventObjects, SafariZone_Southwest_MapWarps, 0x0, SafariZone_Southwest_MapBGEvents
