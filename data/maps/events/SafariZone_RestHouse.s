SafariZone_RestHouse_MapObjects:: @ 8391EC0
	object_event 1, MAP_OBJ_GFX_YOUNGSTER, 0, 7, 0, 4, 0, 0, 10, 17, 0, 0, 0, 0, 0, SafariZone_RestHouse_EventScript_160C2F, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_PSYCHIC_M, 0, 8, 0, 4, 0, 0, 9, 17, 0, 0, 0, 0, 0, SafariZone_RestHouse_EventScript_160C38, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_FAT_MAN, 0, 2, 0, 5, 0, 3, 10, 17, 0, 0, 0, 0, 0, SafariZone_RestHouse_EventScript_160C41, 0, 0, 0

SafariZone_RestHouse_MapWarps:: @ 8391F08
	warp_def 3, 8, 0, 0, SafariZone_Southwest
	warp_def 4, 8, 0, 0, SafariZone_Southwest

SafariZone_RestHouse_MapEvents:: @ 8391F18
	map_events SafariZone_RestHouse_MapObjects, SafariZone_RestHouse_MapWarps, 0x0, 0x0
