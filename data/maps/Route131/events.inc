Route131_EventObjects:: @ 8385298
	object_event 1, EVENT_OBJ_GFX_SWIMMER_M, 0, 17, 25, 1, MOVEMENT_TYPE_WALK_SEQUENCE_UP_RIGHT_LEFT_DOWN, 5, 7, 1, 3, Route131_EventScript_152452, 0
	object_event 2, EVENT_OBJ_GFX_SWIMMER_M, 0, 36, 26, 1, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 1, 3, Route131_EventScript_152469, 0
	object_event 3, EVENT_OBJ_GFX_SWIMMER_F, 0, 33, 28, 1, MOVEMENT_TYPE_FACE_UP, 0, 0, 1, 4, Route131_EventScript_152480, 0
	object_event 4, EVENT_OBJ_GFX_SWIMMER_F, 0, 45, 23, 1, MOVEMENT_TYPE_WALK_SEQUENCE_LEFT_DOWN_RIGHT_UP, 1, 4, 1, 3, Route131_EventScript_152497, 0
	object_event 5, EVENT_OBJ_GFX_SWIMMER_F, 0, 9, 16, 1, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 1, 0, Route131_EventScript_1524AE, 0
	object_event 6, EVENT_OBJ_GFX_TUBER_M_SWIMMING, 0, 8, 16, 1, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 1, 0, Route131_EventScript_1524C9, 0

Route131_MapWarps:: @ 8385328
	warp_def 36, 6, 3, 0, MAP_SKY_PILLAR_ENTRANCE

Route131_MapEvents:: @ 8385330
	map_events Route131_EventObjects, Route131_MapWarps, 0x0, 0x0
