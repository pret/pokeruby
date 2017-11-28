LilycoveCity_DepartmentStoreRooftop_MapObjects:: @ 838A5A8
	object_event 1, MAP_OBJ_GFX_MAN_2, 0, 4, 0, 4, 0, 3, 7, 0, 0, 0, 0, 0, 0, LilycoveCity_DepartmentStoreRooftop_EventScript_15A1A0, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_MAN_4, 0, 7, 0, 5, 0, 3, 5, 1, 0, 0, 0, 0, 0, LilycoveCity_DepartmentStoreRooftop_EventScript_15A1C4, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_ROOFTOP_SALE_WOMAN, 0, 6, 0, 1, 0, 3, 8, 17, 0, 0, 0, 0, 0, LilycoveCity_DepartmentStoreRooftop_EventScript_15A167, 962, 0, 0

LilycoveCity_DepartmentStoreRooftop_MapWarps:: @ 838A5F0
	warp_def 13, 3, 0, 2, MAP_LILYCOVE_CITY_DEPARTMENT_STORE_5F

LilycoveCity_DepartmentStoreRooftop_MapBGEvents:: @ 838A5F8
	bg_event 9, 1, 0, 0, 0, LilycoveCity_DepartmentStoreRooftop_EventScript_15A1CD
	bg_event 10, 1, 0, 0, 0, LilycoveCity_DepartmentStoreRooftop_EventScript_15A1CD

LilycoveCity_DepartmentStoreRooftop_MapEvents:: @ 838A610
	map_events LilycoveCity_DepartmentStoreRooftop_MapObjects, LilycoveCity_DepartmentStoreRooftop_MapWarps, 0x0, LilycoveCity_DepartmentStoreRooftop_MapBGEvents
