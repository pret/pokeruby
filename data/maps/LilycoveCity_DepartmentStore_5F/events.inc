LilycoveCity_DepartmentStore_5F_EventObjects:: @ 838A4D4
	object_event 1, EVENT_OBJ_GFX_LITTLE_GIRL_2, 0, 1, 6, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, LilycoveCity_DepartmentStore_5F_EventScript_15A136, 0
	object_event 2, EVENT_OBJ_GFX_WOMAN_2, 0, 7, 7, 3, MOVEMENT_TYPE_FACE_DOWN_AND_LEFT, 1, 1, 0, 0, LilycoveCity_DepartmentStore_5F_EventScript_15A124, 0
	object_event 3, EVENT_OBJ_GFX_WOMAN_4, 0, 7, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, LilycoveCity_DepartmentStore_5F_EventScript_15A061, 0
	object_event 4, EVENT_OBJ_GFX_WOMAN_4, 0, 9, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, LilycoveCity_DepartmentStore_5F_EventScript_15A094, 0
	object_event 5, EVENT_OBJ_GFX_WOMAN_4, 0, 15, 6, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, LilycoveCity_DepartmentStore_5F_EventScript_15A0C2, 0
	object_event 6, EVENT_OBJ_GFX_WOMAN_4, 0, 17, 6, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, LilycoveCity_DepartmentStore_5F_EventScript_15A0F2, 0
	object_event 7, EVENT_OBJ_GFX_WOMAN_3, 0, 9, 5, 3, MOVEMENT_TYPE_FACE_RIGHT, 1, 1, 0, 0, LilycoveCity_DepartmentStore_5F_EventScript_15A12D, 0

LilycoveCity_DepartmentStore_5F_MapWarps:: @ 838A57C
	warp_def 13, 1, 0, 1, MAP_LILYCOVE_CITY_DEPARTMENT_STORE_4F
	warp_def 2, 1, 0, 0, MAP_LILYCOVE_CITY_DEPARTMENT_STORE_ELEVATOR
	warp_def 16, 1, 0, 0, MAP_LILYCOVE_CITY_DEPARTMENT_STORE_ROOFTOP

LilycoveCity_DepartmentStore_5F_MapEvents:: @ 838A594
	map_events LilycoveCity_DepartmentStore_5F_EventObjects, LilycoveCity_DepartmentStore_5F_MapWarps, 0x0, 0x0
