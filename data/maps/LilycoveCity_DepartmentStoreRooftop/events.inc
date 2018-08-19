LilycoveCity_DepartmentStoreRooftop_EventObjects:: @ 838A5A8
	object_event 1, EVENT_OBJ_GFX_MAN_2, 0, 4, 4, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, LilycoveCity_DepartmentStoreRooftop_EventScript_15A1A0, 0
	object_event 2, EVENT_OBJ_GFX_MAN_4, 0, 7, 5, 3, MOVEMENT_TYPE_WANDER_LEFT_AND_RIGHT, 1, 0, 0, 0, LilycoveCity_DepartmentStoreRooftop_EventScript_15A1C4, 0
	object_event 3, EVENT_OBJ_GFX_ROOFTOP_SALE_WOMAN, 0, 6, 1, 3, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 0, 0, LilycoveCity_DepartmentStoreRooftop_EventScript_15A167, FLAG_HIDE_ROOFTOP_LADY_LILYCOVE_MART

LilycoveCity_DepartmentStoreRooftop_MapWarps:: @ 838A5F0
	warp_def 13, 3, 0, 2, MAP_LILYCOVE_CITY_DEPARTMENT_STORE_5F

LilycoveCity_DepartmentStoreRooftop_MapBGEvents:: @ 838A5F8
	bg_event 9, 1, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_DepartmentStoreRooftop_EventScript_15A1CD
	bg_event 10, 1, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_DepartmentStoreRooftop_EventScript_15A1CD

LilycoveCity_DepartmentStoreRooftop_MapEvents:: @ 838A610
	map_events LilycoveCity_DepartmentStoreRooftop_EventObjects, LilycoveCity_DepartmentStoreRooftop_MapWarps, 0x0, LilycoveCity_DepartmentStoreRooftop_MapBGEvents
