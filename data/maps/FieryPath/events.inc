FieryPath_EventObjects:: @ 838C718
	object_event 1, EVENT_OBJ_GFX_ITEM_BALL, 0, 8, 3, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, FieryPath_EventScript_1B17EE, FLAG_ITEM_FIERY_PATH_1
	object_event 2, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 10, 15, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_11
	object_event 3, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 17, 15, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_12
	object_event 4, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 8, 11, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_13
	object_event 5, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 3, 12, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_14
	object_event 6, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 6, 23, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_15
	object_event 7, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 5, 24, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_16
	object_event 8, EVENT_OBJ_GFX_ITEM_BALL, 0, 7, 32, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, FieryPath_EventScript_1B17E1, FLAG_ITEM_FIERY_PATH_2

FieryPath_MapWarps:: @ 838C7D8
	warp_def 26, 36, 3, 4, MAP_ROUTE112
	warp_def 26, 4, 3, 5, MAP_ROUTE112

FieryPath_MapEvents:: @ 838C7E8
	map_events FieryPath_EventObjects, FieryPath_MapWarps, 0x0, 0x0
