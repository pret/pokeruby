LilycoveCity_DepartmentStore_1F_MapObjects:: @ 838A218
	object_event 1, MAP_OBJ_GFX_BEAUTY, 0, 8, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, LilycoveCity_DepartmentStore_1F_EventScript_159D55, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_BEAUTY, 0, 10, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, LilycoveCity_DepartmentStore_1F_EventScript_159D5E, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_WOMAN_2, 0, 14, 0, 5, 0, 3, 2, 17, 0, 0, 0, 0, 0, LilycoveCity_DepartmentStore_1F_EventScript_159ED7, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_LITTLE_GIRL_2, 0, 4, 0, 4, 0, 3, 2, 17, 0, 0, 0, 0, 0, LilycoveCity_DepartmentStore_1F_EventScript_159EE0, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_MAN_3, 0, 3, 0, 6, 0, 3, 2, 17, 0, 0, 0, 0, 0, LilycoveCity_DepartmentStore_1F_EventScript_159EE9, 0, 0, 0
	object_event 6, MAP_OBJ_GFX_AZUMARILL, 0, 2, 0, 6, 0, 3, 1, 17, 0, 0, 0, 0, 0, LilycoveCity_DepartmentStore_1F_EventScript_159EF2, 0, 0, 0

LilycoveCity_DepartmentStore_1F_MapWarps:: @ 838A2A8
	warp_def 8, 7, 0, 0, LilycoveCity
	warp_def 9, 7, 0, 0, LilycoveCity
	warp_def 16, 1, 0, 0, LilycoveCity_DepartmentStore_2F
	warp_def 2, 1, 0, 0, LilycoveCity_DepartmentStoreElevator

LilycoveCity_DepartmentStore_1F_MapBGEvents:: @ 838A2C8
	bg_event 0, 8, 0, 1, 0, LilycoveCity_DepartmentStore_1F_EventScript_159F05

LilycoveCity_DepartmentStore_1F_MapEvents:: @ 838A2D4
	map_events LilycoveCity_DepartmentStore_1F_MapObjects, LilycoveCity_DepartmentStore_1F_MapWarps, 0x0, LilycoveCity_DepartmentStore_1F_MapBGEvents

