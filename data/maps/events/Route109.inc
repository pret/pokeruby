Route109_MapObjects:: @ 8381AFC
	object_event 1, MAP_OBJ_GFX_MR_BRINEYS_BOAT, 0, 21, 0, 26, 0, 1, 7, 0, 0, 0, 0, 0, 0, 0x0, FLAG_HIDE_MR_BRINEY_BOAT_ROUTE109, 0, 0
	object_event 2, MAP_OBJ_GFX_OLD_MAN_1, 0, 21, 0, 24, 0, 3, 7, 0, 0, 0, 0, 0, 0, Route109_EventScript_14F680, FLAG_HIDE_MR_BRINEY_ROUTE109, 0, 0
	object_event 3, MAP_OBJ_GFX_SWIMMER_M, 0, 12, 0, 36, 0, 3, 10, 0, 0, 1, 0, 5, 0, Route109_EventScript_14F7AD, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_SWIMMER_F, 0, 25, 0, 42, 0, 3, 15, 0, 0, 1, 0, 5, 0, Route109_EventScript_14F7C4, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_SAILOR, 0, 19, 0, 19, 0, 3, 10, 0, 0, 1, 0, 4, 0, Route109_EventScript_14F7DB, 0, 0, 0
	object_event 6, MAP_OBJ_GFX_SAILOR, 0, 14, 0, 11, 0, 4, 8, 0, 0, 1, 0, 1, 0, Route109_EventScript_14F7F2, 0, 0, 0
	object_event 7, MAP_OBJ_GFX_TUBER_M, 0, 21, 0, 11, 0, 3, 23, 0, 0, 1, 0, 3, 0, Route109_EventScript_14F809, 0, 0, 0
	object_event 8, MAP_OBJ_GFX_TUBER_F, 0, 28, 0, 8, 0, 3, 10, 0, 0, 1, 0, 4, 0, Route109_EventScript_14F847, 0, 0, 0
	object_event 9, MAP_OBJ_GFX_LITTLE_GIRL_2, 0, 11, 0, 6, 0, 3, 8, 0, 0, 0, 0, 0, 0, Route109_EventScript_14F705, 0, 0, 0
	object_event 10, MAP_OBJ_GFX_ITEM_BALL, 0, 27, 0, 48, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route109_EventScript_1B14A1, 1005, 0, 0
	object_event 11, MAP_OBJ_GFX_TUBER_F, 0, 29, 0, 32, 0, 3, 13, 0, 0, 1, 0, 3, 0, Route109_EventScript_14F89C, 0, 0, 0
	object_event 12, MAP_OBJ_GFX_TUBER_F, 0, 28, 0, 31, 0, 3, 17, 0, 0, 1, 0, 3, 0, Route109_EventScript_14F885, 0, 0, 0
	object_event 13, MAP_OBJ_GFX_FISHERMAN, 0, 15, 0, 52, 0, 3, 10, 0, 0, 1, 0, 0, 0, Route109_EventScript_14F8B3, 0, 0, 0
	object_event 14, MAP_OBJ_GFX_TUBER_M, 0, 24, 0, 17, 0, 3, 10, 17, 0, 0, 0, 0, 0, Route109_EventScript_14F70E, 0, 0, 0
	object_event 15, MAP_OBJ_GFX_TUBER_F, 0, 25, 0, 17, 0, 3, 9, 17, 0, 0, 0, 0, 0, Route109_EventScript_14F725, 0, 0, 0
	object_event 16, MAP_OBJ_GFX_WOMAN_2, 0, 30, 0, 32, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route109_EventScript_14F776, 0, 0, 0
	object_event 17, MAP_OBJ_GFX_WOMAN_5, 0, 8, 0, 41, 0, 3, 8, 17, 0, 1, 0, 0, 0, Route109_EventScript_14F8E5, 0, 0, 0
	object_event 18, MAP_OBJ_GFX_MAN_5, 0, 9, 0, 41, 0, 3, 8, 17, 0, 1, 0, 0, 0, Route109_EventScript_14F8CA, 0, 0, 0
	object_event 19, MAP_OBJ_GFX_OLD_MAN_2, 0, 33, 0, 6, 0, 3, 1, 17, 0, 0, 0, 0, 0, Route109_EventScript_14F77F, 0, 0, 0
	object_event 20, MAP_OBJ_GFX_ZIGZAGOON, 0, 32, 0, 6, 0, 3, 1, 17, 0, 0, 0, 0, 0, Route109_EventScript_14F788, 0, 0, 0

Route109_MapWarps:: @ 8381CDC
	warp_def 12, 5, 0, 0, MAP_ROUTE109_SEASHORE_HOUSE

Route109_MapBGEvents:: @ 8381CE4
	bg_event 15, 5, 0, 0, 0, Route109_EventScript_14F79B
	bg_event 29, 10, 3, 0, 0, Route109_EventScript_14F7A4
	bg_event 16, 23, 3, 7, 0, ITEM_REVIVE, 50, 0
	bg_event 33, 5, 3, 7, 0, ITEM_HEART_SCALE, 52, 0
	bg_event 9, 10, 3, 7, 0, ITEM_GREAT_BALL, 51, 0
	bg_event 28, 20, 3, 7, 0, ITEM_ETHER, 64, 0
	bg_event 13, 16, 3, 7, 0, ITEM_HEART_SCALE, 90, 0
	bg_event 8, 42, 3, 7, 0, ITEM_HEART_SCALE, 91, 0

Route109_MapEvents:: @ 8381D44
	map_events Route109_MapObjects, Route109_MapWarps, 0x0, Route109_MapBGEvents
