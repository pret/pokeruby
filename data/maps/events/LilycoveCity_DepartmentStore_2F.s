LilycoveCity_DepartmentStore_2F_MapObjects:: @ 838A2E8
	object_event 1, MAP_OBJ_GFX_COOK, 0, 8, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, LilycoveCity_DepartmentStore_2F_EventScript_159F0F, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_WOMAN_2, 0, 0, 0, 5, 0, 3, 2, 17, 0, 0, 0, 0, 0, LilycoveCity_DepartmentStore_2F_EventScript_159F18, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_SAILOR, 0, 13, 0, 5, 0, 3, 2, 17, 0, 0, 0, 0, 0, LilycoveCity_DepartmentStore_2F_EventScript_159F21, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_WOMAN_4, 0, 10, 0, 6, 0, 3, 7, 0, 0, 0, 0, 0, 0, LilycoveCity_DepartmentStore_2F_EventScript_159F5E, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_WOMAN_4, 0, 7, 0, 6, 0, 3, 7, 0, 0, 0, 0, 0, 0, LilycoveCity_DepartmentStore_2F_EventScript_159F2A, 0, 0, 0

LilycoveCity_DepartmentStore_2F_MapWarps:: @ 838A360
	warp_def 16, 1, 0, 2, LilycoveCity_DepartmentStore_1F
	warp_def 13, 1, 0, 0, LilycoveCity_DepartmentStore_3F
	warp_def 2, 1, 0, 0, LilycoveCity_DepartmentStoreElevator

LilycoveCity_DepartmentStore_2F_MapEvents:: @ 838A378
	map_events LilycoveCity_DepartmentStore_2F_MapObjects, LilycoveCity_DepartmentStore_2F_MapWarps, 0x0, 0x0
