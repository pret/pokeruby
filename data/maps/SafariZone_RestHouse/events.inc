SafariZone_RestHouse_EventObjects:: @ 8391EC0
	object_event 1, EVENT_OBJ_GFX_YOUNGSTER, 0, 7, 4, 0, MOVEMENT_TYPE_FACE_RIGHT, 1, 1, 0, 0, SafariZone_RestHouse_EventScript_160C2F, 0
	object_event 2, EVENT_OBJ_GFX_PSYCHIC_M, 0, 8, 4, 0, MOVEMENT_TYPE_FACE_LEFT, 1, 1, 0, 0, SafariZone_RestHouse_EventScript_160C38, 0
	object_event 3, EVENT_OBJ_GFX_FAT_MAN, 0, 2, 5, 3, MOVEMENT_TYPE_FACE_RIGHT, 1, 1, 0, 0, SafariZone_RestHouse_EventScript_160C41, 0

SafariZone_RestHouse_MapWarps:: @ 8391F08
	warp_def 3, 8, 0, 0, MAP_SAFARI_ZONE_SOUTHWEST
	warp_def 4, 8, 0, 0, MAP_SAFARI_ZONE_SOUTHWEST

SafariZone_RestHouse_MapEvents:: @ 8391F18
	map_events SafariZone_RestHouse_EventObjects, SafariZone_RestHouse_MapWarps, 0x0, 0x0
