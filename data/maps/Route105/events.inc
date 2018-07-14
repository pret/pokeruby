Route105_EventObjects:: @ 8381854
	object_event 1, EVENT_OBJ_GFX_SWIMMER_M, 0, 18, 60, 1, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 1, 6, Route105_EventScript_14F2D2, 0
	object_event 2, EVENT_OBJ_GFX_SWIMMER_M, 0, 10, 44, 1, MOVEMENT_TYPE_WALK_LEFT_AND_RIGHT, 7, 0, 1, 3, Route105_EventScript_14F2E9, 0
	object_event 3, EVENT_OBJ_GFX_SWIMMER_F, 0, 26, 36, 1, MOVEMENT_TYPE_WALK_UP_AND_DOWN, 0, 7, 1, 3, Route105_EventScript_14F300, 0
	object_event 4, EVENT_OBJ_GFX_SWIMMER_F, 0, 19, 9, 1, MOVEMENT_TYPE_ROTATE_CLOCKWISE, 0, 5, 1, 3, Route105_EventScript_14F317, 0
	object_event 5, EVENT_OBJ_GFX_ITEM_BALL, 0, 8, 73, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, Route105_EventScript_1B1487, FLAG_ITEM_ROUTE105_1
	object_event 6, EVENT_OBJ_GFX_HIKER, 0, 12, 51, 3, MOVEMENT_TYPE_FACE_DOWN_AND_UP, 0, 0, 1, 3, Route105_EventScript_14F2BB, 0

Route105_MapWarps:: @ 83818E4
	warp_def 9, 20, 0, 0, MAP_ISLAND_CAVE

Route105_MapBGEvents:: @ 83818EC
	bg_hidden_item_event 15, 68, 3, ITEM_HEART_SCALE, FLAG_HIDDEN_ITEM_59

Route105_MapEvents:: @ 83818F8
	map_events Route105_EventObjects, Route105_MapWarps, 0x0, Route105_MapBGEvents
