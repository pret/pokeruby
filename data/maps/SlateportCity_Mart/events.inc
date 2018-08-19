SlateportCity_Mart_EventObjects:: @ 83881B0
	object_event 1, EVENT_OBJ_GFX_MART_EMPLOYEE, 0, 1, 3, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, SlateportCity_Mart_EventScript_156411, 0
	object_event 2, EVENT_OBJ_GFX_BLACK_BELT, 0, 4, 2, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, SlateportCity_Mart_EventScript_15643E, 0
	object_event 3, EVENT_OBJ_GFX_MAN_4, 0, 5, 5, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, SlateportCity_Mart_EventScript_156447, 0

SlateportCity_Mart_MapWarps:: @ 83881F8
	warp_def 3, 7, 0, 1, MAP_SLATEPORT_CITY
	warp_def 4, 7, 0, 1, MAP_SLATEPORT_CITY

SlateportCity_Mart_MapEvents:: @ 8388208
	map_events SlateportCity_Mart_EventObjects, SlateportCity_Mart_MapWarps, 0x0, 0x0
