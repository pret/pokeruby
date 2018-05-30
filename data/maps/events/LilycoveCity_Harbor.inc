LilycoveCity_Harbor_EventObjects:: @ 8389F94
	object_event 1, EVENT_OBJ_GFX_BEAUTY, 0, 8, 0, 10, 0, 3, 8, 0, 0, 0, 0, 0, 0, LilycoveCity_Harbor_EventScript_1598A2, FLAG_HIDE_FERRY_ATTENDANT_LILYCOVE, 0, 0
	object_event 2, EVENT_OBJ_GFX_SS_TIDAL, 0, 8, 0, 9, 0, 1, 10, 0, 0, 0, 0, 0, 0, 0x0, FLAG_HIDE_SS_TIDAL_LILYCOVE_HARBOR, 0, 0
	object_event 3, EVENT_OBJ_GFX_SAILOR, 0, 3, 0, 13, 0, 3, 2, 17, 0, 0, 0, 0, 0, LilycoveCity_Harbor_EventScript_159A8D, 0, 0, 0
	object_event 4, EVENT_OBJ_GFX_SAILOR, 0, 8, 0, 10, 0, 3, 8, 0, 0, 0, 0, 0, 0, 0x0, FLAG_HIDE_FERRY_SAILOR_LILYCOVE, 0, 0

LilycoveCity_Harbor_MapWarps:: @ 8389FF4
	warp_def 11, 14, 0, 12, MAP_LILYCOVE_CITY
	warp_def 12, 14, 0, 12, MAP_LILYCOVE_CITY
	warp_def 20, 15, 0, 0, MAP_LILYCOVE_CITY_EMPTY_MAP
	warp_def 21, 15, 0, 0, MAP_LILYCOVE_CITY_EMPTY_MAP

LilycoveCity_Harbor_MapEvents:: @ 838A014
	map_events LilycoveCity_Harbor_EventObjects, LilycoveCity_Harbor_MapWarps, 0x0, 0x0
