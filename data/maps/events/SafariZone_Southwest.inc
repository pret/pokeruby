SafariZone_Southwest_MapObjects:: @ 8391B18
	object_event 1, MAP_OBJ_GFX_WOMAN_3, 0, 22, 0, 9, 0, 3, 8, 0, 0, 0, 0, 0, 0, SafariZone_Southwest_EventScript_160024, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_ITEM_BALL, 0, 0, 0, 37, 0, 3, 1, 17, 0, 0, 0, 0, 0, SafariZone_Southwest_EventScript_1B1926, FLAG_ITEM_SAFARI_ZONE_SOUTHWEST, 0, 0

SafariZone_Southwest_MapWarps:: @ 8391B48
	warp_def 29, 7, 3, 0, MAP_SAFARI_ZONE_REST_HOUSE

SafariZone_Southwest_MapBGEvents:: @ 8391B50
	bg_event 32, 7, 3, 0, 0, SafariZone_Southwest_EventScript_16002D

SafariZone_Southwest_MapEvents:: @ 8391B5C
	map_events SafariZone_Southwest_MapObjects, SafariZone_Southwest_MapWarps, 0x0, SafariZone_Southwest_MapBGEvents
