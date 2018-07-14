Route127_EventObjects:: @ 8384FA8
	object_event 1, EVENT_OBJ_GFX_SWIMMER_M, 0, 18, 68, 1, MOVEMENT_TYPE_FACE_LEFT_AND_RIGHT, 0, 0, 1, 2, Route127_EventScript_15207A, 0
	object_event 2, EVENT_OBJ_GFX_SWIMMER_F, 0, 45, 44, 1, MOVEMENT_TYPE_FACE_UP_LEFT_AND_RIGHT, 0, 0, 1, 4, Route127_EventScript_152091, 0
	object_event 3, EVENT_OBJ_GFX_ITEM_BALL, 0, 10, 7, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, Route127_EventScript_1B16C3, FLAG_ITEM_ROUTE127_1
	object_event 4, EVENT_OBJ_GFX_ITEM_BALL, 0, 64, 39, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, Route127_EventScript_1B16D0, FLAG_ITEM_ROUTE127_2
	object_event 5, EVENT_OBJ_GFX_FISHERMAN, 0, 53, 13, 3, MOVEMENT_TYPE_FACE_UP, 1, 1, 1, 0, Route127_EventScript_1520A8, 0
	object_event 6, EVENT_OBJ_GFX_FISHERMAN, 0, 52, 25, 3, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 1, 0, Route127_EventScript_1520D6, 0
	object_event 7, EVENT_OBJ_GFX_FISHERMAN, 0, 64, 19, 3, MOVEMENT_TYPE_FACE_RIGHT, 1, 1, 1, 0, Route127_EventScript_1520BF, 0
	object_event 8, EVENT_OBJ_GFX_MAN_6, 0, 12, 18, 3, MOVEMENT_TYPE_ROTATE_CLOCKWISE, 1, 1, 1, 2, Route127_EventScript_152104, 0
	object_event 9, EVENT_OBJ_GFX_BLACK_BELT, 0, 63, 63, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 1, 3, Route127_EventScript_1520ED, 0

Route127_MapBGEvents:: @ 8385080
	bg_secret_base_event 59, 67, 0, SECRET_BASE_RED_CAVE4_1
	bg_secret_base_event 59, 72, 0, SECRET_BASE_YELLOW_CAVE3_2
	bg_secret_base_event 67, 63, 0, SECRET_BASE_YELLOW_CAVE4_1
	bg_secret_base_event 61, 21, 0, SECRET_BASE_YELLOW_CAVE3_3
	bg_secret_base_event 45, 24, 0, SECRET_BASE_YELLOW_CAVE1_3

Route127_MapEvents:: @ 83850BC
	map_events Route127_EventObjects, 0x0, 0x0, Route127_MapBGEvents
