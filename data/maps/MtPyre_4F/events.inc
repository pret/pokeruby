MtPyre_4F_EventObjects:: @ 838C9E0
	object_event 1, EVENT_OBJ_GFX_BLACK_BELT, 0, 11, 7, 3, MOVEMENT_TYPE_ROTATE_CLOCKWISE, 1, 1, 1, 2, MtPyre_4F_EventScript_15D418, 0
	object_event 2, EVENT_OBJ_GFX_ITEM_BALL, 0, 3, 11, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, MtPyre_4F_EventScript_1B194D, FLAG_ITEM_MT_PYRE_4F_1

MtPyre_4F_MapWarps:: @ 838CA10
	warp_def 10, 1, 3, 1, MAP_MT_PYRE_5F
	warp_def 2, 5, 3, 1, MAP_MT_PYRE_3F
	warp_def 12, 10, 3, 3, MAP_MT_PYRE_5F
	warp_def 12, 12, 3, 4, MAP_MT_PYRE_5F
	warp_def 9, 10, 3, 2, MAP_MT_PYRE_3F
	warp_def 2, 12, 3, 3, MAP_MT_PYRE_3F

MtPyre_4F_MapEvents:: @ 838CA40
	map_events MtPyre_4F_EventObjects, MtPyre_4F_MapWarps, 0x0, 0x0
