LilycoveCity_DepartmentStore_4F_EventObjects:: @ 838A430
	object_event 1, EVENT_OBJ_GFX_GENTLEMAN, 0, 0, 2, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, LilycoveCity_DepartmentStore_4F_EventScript_159FFE, 0
	object_event 2, EVENT_OBJ_GFX_WOMAN_3, 0, 6, 2, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, LilycoveCity_DepartmentStore_4F_EventScript_15A007, 0
	object_event 3, EVENT_OBJ_GFX_YOUNGSTER, 0, 13, 4, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, LilycoveCity_DepartmentStore_4F_EventScript_15A010, 0
	object_event 4, EVENT_OBJ_GFX_WOMAN_4, 0, 7, 6, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, LilycoveCity_DepartmentStore_4F_EventScript_15A019, 0
	object_event 5, EVENT_OBJ_GFX_WOMAN_4, 0, 9, 6, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, LilycoveCity_DepartmentStore_4F_EventScript_15A03C, 0

LilycoveCity_DepartmentStore_4F_MapWarps:: @ 838A4A8
	warp_def 16, 1, 0, 1, MAP_LILYCOVE_CITY_DEPARTMENT_STORE_3F
	warp_def 13, 1, 0, 0, MAP_LILYCOVE_CITY_DEPARTMENT_STORE_5F
	warp_def 2, 1, 0, 0, MAP_LILYCOVE_CITY_DEPARTMENT_STORE_ELEVATOR

LilycoveCity_DepartmentStore_4F_MapEvents:: @ 838A4C0
	map_events LilycoveCity_DepartmentStore_4F_EventObjects, LilycoveCity_DepartmentStore_4F_MapWarps, 0x0, 0x0
