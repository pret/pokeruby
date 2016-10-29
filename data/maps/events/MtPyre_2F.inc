MtPyre_2F_MapObjects:: @ 838C888
	object_event 1, MAP_OBJ_GFX_MANIAC, 0, 6, 0, 6, 0, 3, 17, 17, 0, 1, 0, 2, 0, MtPyre_2F_EventScript_15D39B, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_ITEM_BALL, 0, 0, 0, 10, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtPyre_2F_EventScript_1B1933, 1129, 0, 0
	object_event 3, MAP_OBJ_GFX_WOMAN_1, 0, 5, 0, 3, 0, 3, 10, 17, 0, 0, 0, 0, 0, MtPyre_2F_EventScript_15D389, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_MAN_3, 0, 7, 0, 11, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtPyre_2F_EventScript_15D392, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_WOMAN_5, 0, 2, 0, 8, 0, 3, 8, 17, 0, 1, 0, 0, 0, MtPyre_2F_EventScript_15D3CD, 0, 0, 0
	object_event 6, MAP_OBJ_GFX_MAN_5, 0, 3, 0, 8, 0, 3, 8, 17, 0, 1, 0, 0, 0, MtPyre_2F_EventScript_15D3B2, 0, 0, 0

MtPyre_2F_MapWarps:: @ 838C918
	warp_def 2, 1, 3, 4, MtPyre_1F
	warp_def 10, 1, 3, 0, MtPyre_3F
	warp_def 10, 12, 3, 4, MtPyre_3F
	warp_def 6, 12, 3, 5, MtPyre_3F
	warp_def 11, 9, 3, 5, MtPyre_1F

MtPyre_2F_MapEvents:: @ 838C940
	map_events MtPyre_2F_MapObjects, MtPyre_2F_MapWarps, 0x0, 0x0
