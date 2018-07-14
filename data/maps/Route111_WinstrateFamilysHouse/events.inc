Route111_WinstrateFamilysHouse_EventObjects:: @ 838B714
	object_event 1, EVENT_OBJ_GFX_LASS, 0, 7, 5, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, Route111_WinstrateFamilysHouse_EventScript_15BF80, 0
	object_event 2, EVENT_OBJ_GFX_MAN_1, 0, 4, 5, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, Route111_WinstrateFamilysHouse_EventScript_15BF25, 0
	object_event 3, EVENT_OBJ_GFX_WOMAN_2, 0, 7, 4, 3, MOVEMENT_TYPE_FACE_LEFT, 1, 0, 0, 0, Route111_WinstrateFamilysHouse_EventScript_15BF3A, 0
	object_event 4, EVENT_OBJ_GFX_OLD_WOMAN_1, 0, 4, 4, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, Route111_WinstrateFamilysHouse_EventScript_15BF95, 0

Route111_WinstrateFamilysHouse_MapWarps:: @ 838B774
	warp_def 3, 7, 0, 0, MAP_ROUTE111
	warp_def 4, 7, 0, 0, MAP_ROUTE111

Route111_WinstrateFamilysHouse_MapEvents:: @ 838B784
	map_events Route111_WinstrateFamilysHouse_EventObjects, Route111_WinstrateFamilysHouse_MapWarps, 0x0, 0x0
