LilycoveCity_DepartmentStore_1F_EventObjects:: @ 838A218
	object_event 1, EVENT_OBJ_GFX_BEAUTY, 0, 8, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, LilycoveCity_DepartmentStore_1F_EventScript_159D55, 0
	object_event 2, EVENT_OBJ_GFX_BEAUTY, 0, 10, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, LilycoveCity_DepartmentStore_1F_EventScript_159D5E, 0
	object_event 3, EVENT_OBJ_GFX_WOMAN_2, 0, 14, 5, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, LilycoveCity_DepartmentStore_1F_EventScript_159ED7, 0
	object_event 4, EVENT_OBJ_GFX_LITTLE_GIRL_2, 0, 4, 4, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, LilycoveCity_DepartmentStore_1F_EventScript_159EE0, 0
	object_event 5, EVENT_OBJ_GFX_MAN_3, 0, 3, 6, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, LilycoveCity_DepartmentStore_1F_EventScript_159EE9, 0
	object_event 6, EVENT_OBJ_GFX_AZUMARILL, 0, 2, 6, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, LilycoveCity_DepartmentStore_1F_EventScript_159EF2, 0

LilycoveCity_DepartmentStore_1F_MapWarps:: @ 838A2A8
	warp_def 8, 7, 0, 0, MAP_LILYCOVE_CITY
	warp_def 9, 7, 0, 0, MAP_LILYCOVE_CITY
	warp_def 16, 1, 0, 0, MAP_LILYCOVE_CITY_DEPARTMENT_STORE_2F
	warp_def 2, 1, 0, 0, MAP_LILYCOVE_CITY_DEPARTMENT_STORE_ELEVATOR

LilycoveCity_DepartmentStore_1F_MapBGEvents:: @ 838A2C8
	bg_event 0, 8, 0, BG_EVENT_PLAYER_FACING_NORTH, LilycoveCity_DepartmentStore_1F_EventScript_159F05

LilycoveCity_DepartmentStore_1F_MapEvents:: @ 838A2D4
	map_events LilycoveCity_DepartmentStore_1F_EventObjects, LilycoveCity_DepartmentStore_1F_MapWarps, 0x0, LilycoveCity_DepartmentStore_1F_MapBGEvents
