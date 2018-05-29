FieryPath_EventObjects:: @ 838C718
	object_event 1, EVENT_OBJ_GFX_ITEM_BALL, 0, 8, 0, 3, 0, 3, 1, 17, 0, 0, 0, 0, 0, FieryPath_EventScript_1B17EE, FLAG_ITEM_FIERY_PATH_1, 0, 0
	object_event 2, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 10, 0, 15, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_11, 0, 0
	object_event 3, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 17, 0, 15, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_12, 0, 0
	object_event 4, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 8, 0, 11, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_13, 0, 0
	object_event 5, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 3, 0, 12, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_14, 0, 0
	object_event 6, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 6, 0, 23, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_15, 0, 0
	object_event 7, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 5, 0, 24, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_16, 0, 0
	object_event 8, EVENT_OBJ_GFX_ITEM_BALL, 0, 7, 0, 32, 0, 3, 1, 17, 0, 0, 0, 0, 0, FieryPath_EventScript_1B17E1, FLAG_ITEM_FIERY_PATH_2, 0, 0

FieryPath_MapWarps:: @ 838C7D8
	warp_def 26, 36, 3, 4, MAP_ROUTE112
	warp_def 26, 4, 3, 5, MAP_ROUTE112

FieryPath_MapEvents:: @ 838C7E8
	map_events FieryPath_EventObjects, FieryPath_MapWarps, 0x0, 0x0
