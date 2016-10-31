Route109_SeashoreHouse_MapObjects:: @ 83920BC
	object_event 1, MAP_OBJ_GFX_MAN_3, 0, 6, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, Route109_SeashoreHouse_EventScript_160DD4, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_SAILOR, 0, 2, 0, 3, 0, 3, 8, 0, 0, 1, 0, 2, 0, Route109_SeashoreHouse_EventScript_160EB8, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_TUBER_M, 0, 14, 0, 9, 0, 3, 9, 0, 0, 1, 0, 2, 0, Route109_SeashoreHouse_EventScript_160EEE, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_BEAUTY, 0, 10, 0, 5, 0, 3, 14, 0, 0, 1, 0, 2, 0, Route109_SeashoreHouse_EventScript_160ED3, 0, 0, 0

Route109_SeashoreHouse_MapWarps:: @ 839211C
	warp_def 6, 9, 0, 0, Route109
	warp_def 7, 9, 0, 0, Route109

Route109_SeashoreHouse_MapEvents:: @ 839212C
	map_events Route109_SeashoreHouse_MapObjects, Route109_SeashoreHouse_MapWarps, 0x0, 0x0
