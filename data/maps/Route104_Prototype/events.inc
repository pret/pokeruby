Route104_Prototype_EventObjects:: @ 8391F2C
	object_event 1, EVENT_OBJ_GFX_WOMAN_3, 0, 27, 9, 3, MOVEMENT_TYPE_ROTATE_COUNTERCLOCKWISE, 0, 0, 1, 1, Route104_Prototype_EventScript_160D2E, 0
	object_event 2, EVENT_OBJ_GFX_LITTLE_GIRL_1, 0, 13, 9, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 1, 0, Route104_Prototype_EventScript_160D60, 0
	object_event 3, EVENT_OBJ_GFX_LITTLE_GIRL_1, 0, 13, 10, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 1, 0, Route104_Prototype_EventScript_160D60, 0
	object_event 4, EVENT_OBJ_GFX_HIKER, 0, 25, 21, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 1, 1, Route104_Prototype_EventScript_160D7B, 0
	object_event 5, EVENT_OBJ_GFX_WOMAN_3, 0, 16, 30, 3, MOVEMENT_TYPE_ROTATE_CLOCKWISE, 0, 0, 1, 1, Route104_Prototype_EventScript_160D92, 0
	object_event 6, EVENT_OBJ_GFX_HIKER, 0, 34, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 1, 3, Route104_Prototype_EventScript_160DA9, 0
	object_event 7, EVENT_OBJ_GFX_BOY_1, 0, 15, 4, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, Route104_Prototype_EventScript_160C4B, 0
	object_event 8, EVENT_OBJ_GFX_GIRL_1, 0, 14, 4, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, Route104_Prototype_EventScript_160CA3, 0
	object_event 9, EVENT_OBJ_GFX_LITTLE_GIRL_1, 0, 27, 29, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 1, 0, Route104_Prototype_EventScript_160D45, 0
	object_event 10, EVENT_OBJ_GFX_LITTLE_GIRL_1, 0, 26, 29, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 1, 0, Route104_Prototype_EventScript_160D45, 0
	object_event 11, EVENT_OBJ_GFX_BOY_1, 0, 17, 37, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, Route104_Prototype_EventScript_160D13, 0
	object_event 12, EVENT_OBJ_GFX_MAN_3, 0, 11, 28, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, Route104_Prototype_EventScript_160D0A, 0

Route104_Prototype_MapWarps:: @ 839204C
	warp_def 5, 24, 0, 0, MAP_ROUTE104_PROTOTYPE_PRETTY_PETAL_FLOWER_SHOP

Route104_Prototype_MapBGEvents:: @ 8392054
	bg_event 7, 26, 0, BG_EVENT_PLAYER_FACING_ANY, Route104_Prototype_EventScript_160D1C
	bg_event 18, 8, 0, BG_EVENT_PLAYER_FACING_ANY, Route104_Prototype_EventScript_160D25

Route104_Prototype_MapEvents:: @ 839206C
	map_events Route104_Prototype_EventObjects, Route104_Prototype_MapWarps, 0x0, Route104_Prototype_MapBGEvents
