FieryPath_MapObjects:: @ 838C718
	object_event 1, MAP_OBJ_GFX_ITEM_BALL, 0, 8, 0, 3, 0, 3, 1, 17, 0, 0, 0, 0, 0, FieryPath_EventScript_1B17EE, 1091, 0, 0
	object_event 2, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 10, 0, 15, 0, 3, 1, 0, 0, 0, 0, 0, 0, FieryPath_EventScript_1B0FCB, 17, 0, 0
	object_event 3, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 17, 0, 15, 0, 3, 1, 0, 0, 0, 0, 0, 0, FieryPath_EventScript_1B0FCB, 18, 0, 0
	object_event 4, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 8, 0, 11, 0, 3, 1, 0, 0, 0, 0, 0, 0, FieryPath_EventScript_1B0FCB, 19, 0, 0
	object_event 5, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 3, 0, 12, 0, 3, 1, 0, 0, 0, 0, 0, 0, FieryPath_EventScript_1B0FCB, 20, 0, 0
	object_event 6, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 6, 0, 23, 0, 3, 1, 0, 0, 0, 0, 0, 0, FieryPath_EventScript_1B0FCB, 21, 0, 0
	object_event 7, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 5, 0, 24, 0, 3, 1, 0, 0, 0, 0, 0, 0, FieryPath_EventScript_1B0FCB, 22, 0, 0
	object_event 8, MAP_OBJ_GFX_ITEM_BALL, 0, 7, 0, 32, 0, 3, 1, 17, 0, 0, 0, 0, 0, FieryPath_EventScript_1B17E1, 1111, 0, 0

FieryPath_MapWarps:: @ 838C7D8
	warp_def 26, 36, 3, 4, Route112
	warp_def 26, 4, 3, 5, Route112

FieryPath_MapEvents:: @ 838C7E8
	map_events FieryPath_MapObjects, FieryPath_MapWarps, 0x0, 0x0

