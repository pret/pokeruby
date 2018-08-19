Route108_EventObjects:: @ 8381A74
	object_event 1, EVENT_OBJ_GFX_SWIMMER_M, 0, 17, 13, 1, MOVEMENT_TYPE_WALK_SEQUENCE_UP_LEFT_DOWN_RIGHT, 3, 3, 1, 3, Route108_EventScript_14F476, 0
	object_event 2, EVENT_OBJ_GFX_SWIMMER_F, 0, 8, 6, 1, MOVEMENT_TYPE_FACE_DOWN_AND_UP, 1, 1, 1, 3, Route108_EventScript_14F4A4, 0
	object_event 3, EVENT_OBJ_GFX_SWIMMER_M, 0, 50, 10, 1, MOVEMENT_TYPE_ROTATE_CLOCKWISE, 0, 0, 1, 3, Route108_EventScript_14F48D, 0
	object_event 4, EVENT_OBJ_GFX_SWIMMER_F, 0, 36, 12, 1, MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_UP_RIGHT_DOWN, 6, 3, 1, 3, Route108_EventScript_14F4BB, 0

Route108_MapWarps:: @ 8381AD4
	warp_def 29, 6, 3, 0, MAP_ABANDONED_SHIP_DECK

Route108_MapBGEvents:: @ 8381ADC
	bg_hidden_item_event 38, 14, 3, ITEM_RARE_CANDY, FLAG_HIDDEN_ITEM_56

Route108_MapEvents:: @ 8381AE8
	map_events Route108_EventObjects, Route108_MapWarps, 0x0, Route108_MapBGEvents
