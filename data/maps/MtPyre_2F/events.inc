MtPyre_2F_EventObjects:: @ 838C888
	object_event 1, EVENT_OBJ_GFX_MANIAC, 0, 6, 6, 3, MOVEMENT_TYPE_FACE_DOWN_AND_LEFT, 1, 1, 1, 2, MtPyre_2F_EventScript_15D39B, 0
	object_event 2, EVENT_OBJ_GFX_ITEM_BALL, 0, 0, 10, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, MtPyre_2F_EventScript_1B1933, FLAG_ITEM_MT_PYRE_2F_1
	object_event 3, EVENT_OBJ_GFX_WOMAN_1, 0, 5, 3, 3, MOVEMENT_TYPE_FACE_RIGHT, 1, 1, 0, 0, MtPyre_2F_EventScript_15D389, 0
	object_event 4, EVENT_OBJ_GFX_MAN_3, 0, 7, 11, 3, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 0, 0, MtPyre_2F_EventScript_15D392, 0
	object_event 5, EVENT_OBJ_GFX_WOMAN_5, 0, 2, 8, 3, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 1, 0, MtPyre_2F_EventScript_15D3CD, 0
	object_event 6, EVENT_OBJ_GFX_MAN_5, 0, 3, 8, 3, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 1, 0, MtPyre_2F_EventScript_15D3B2, 0

MtPyre_2F_MapWarps:: @ 838C918
	warp_def 2, 1, 3, 4, MAP_MT_PYRE_1F
	warp_def 10, 1, 3, 0, MAP_MT_PYRE_3F
	warp_def 10, 12, 3, 4, MAP_MT_PYRE_3F
	warp_def 6, 12, 3, 5, MAP_MT_PYRE_3F
	warp_def 11, 9, 3, 5, MAP_MT_PYRE_1F

MtPyre_2F_MapEvents:: @ 838C940
	map_events MtPyre_2F_EventObjects, MtPyre_2F_MapWarps, 0x0, 0x0
