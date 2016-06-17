MtPyre_4F_MapObjects:: @ 838C9E0
	object_event 1, MAP_OBJ_GFX_BLACK_BELT, 0, 11, 0, 7, 0, 3, 24, 17, 0, 1, 0, 2, 0, MtPyre_4F_EventScript_15D418, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_ITEM_BALL, 0, 3, 0, 11, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtPyre_4F_EventScript_1B194D, 1130, 0, 0

MtPyre_4F_MapWarps:: @ 838CA10
	warp_def 10, 1, 3, 1, MtPyre_5F
	warp_def 2, 5, 3, 1, MtPyre_3F
	warp_def 12, 10, 3, 3, MtPyre_5F
	warp_def 12, 12, 3, 4, MtPyre_5F
	warp_def 9, 10, 3, 2, MtPyre_3F
	warp_def 2, 12, 3, 3, MtPyre_3F

MtPyre_4F_MapEvents:: @ 838CA40
	map_events MtPyre_4F_MapObjects, MtPyre_4F_MapWarps, 0x0, 0x0

