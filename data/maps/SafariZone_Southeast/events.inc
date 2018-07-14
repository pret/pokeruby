SafariZone_Southeast_EventObjects:: @ 8391B70
	object_event 1, EVENT_OBJ_GFX_CAMPER, 0, 32, 34, 4, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, SafariZone_Southeast_EventScript_1600A7, 0
	object_event 2, EVENT_OBJ_GFX_BOY_1, 0, 26, 28, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, SafariZone_Southeast_EventScript_16008C, 0
	object_event 3, EVENT_OBJ_GFX_MAN_5, 0, 16, 6, 5, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, SafariZone_Southeast_EventScript_160095, 0
	object_event 4, EVENT_OBJ_GFX_YOUNGSTER, 0, 15, 31, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, SafariZone_Southeast_EventScript_16009E, 0

SafariZone_Southeast_MapWarps:: @ 8391BD0
	warp_def 32, 33, 0, 0, MAP_ROUTE121_SAFARI_ZONE_ENTRANCE

SafariZone_Southeast_MapEvents:: @ 8391BD8
	map_events SafariZone_Southeast_EventObjects, SafariZone_Southeast_MapWarps, 0x0, 0x0
