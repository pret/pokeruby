MtPyre_3F_EventObjects:: @ 838C954
	object_event 1, EVENT_OBJ_GFX_PSYCHIC_M, 0, 1, 4, 3, MOVEMENT_TYPE_FACE_DOWN_AND_RIGHT, 1, 1, 1, 3, MtPyre_3F_EventScript_15D3E9, 0
	object_event 2, EVENT_OBJ_GFX_LASS, 0, 12, 7, 3, MOVEMENT_TYPE_FACE_DOWN_AND_LEFT, 1, 1, 1, 3, MtPyre_3F_EventScript_15D400, 0
	object_event 3, EVENT_OBJ_GFX_ITEM_BALL, 0, 0, 7, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, MtPyre_3F_EventScript_1B1940, FLAG_ITEM_MT_PYRE_3F_1

MtPyre_3F_MapWarps:: @ 838C99C
	warp_def 10, 1, 3, 1, MAP_MT_PYRE_2F
	warp_def 2, 1, 3, 1, MAP_MT_PYRE_4F
	warp_def 9, 10, 3, 4, MAP_MT_PYRE_4F
	warp_def 1, 12, 3, 5, MAP_MT_PYRE_4F
	warp_def 10, 12, 3, 2, MAP_MT_PYRE_2F
	warp_def 6, 12, 3, 3, MAP_MT_PYRE_2F

MtPyre_3F_MapEvents:: @ 838C9CC
	map_events MtPyre_3F_EventObjects, MtPyre_3F_MapWarps, 0x0, 0x0
