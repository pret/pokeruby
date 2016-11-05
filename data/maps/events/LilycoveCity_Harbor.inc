LilycoveCity_Harbor_MapObjects:: @ 8389F94
	object_event 1, MAP_OBJ_GFX_BEAUTY, 0, 8, 0, 10, 0, 3, 8, 0, 0, 0, 0, 0, 0, LilycoveCity_Harbor_EventScript_1598A2, 908, 0, 0
	object_event 2, MAP_OBJ_GFX_SS_TIDAL, 0, 8, 0, 9, 0, 1, 10, 0, 0, 0, 0, 0, 0, 0x0, 861, 0, 0
	object_event 3, MAP_OBJ_GFX_SAILOR, 0, 3, 0, 13, 0, 3, 2, 17, 0, 0, 0, 0, 0, LilycoveCity_Harbor_EventScript_159A8D, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_SAILOR, 0, 8, 0, 10, 0, 3, 8, 0, 0, 0, 0, 0, 0, 0x0, 909, 0, 0

LilycoveCity_Harbor_MapWarps:: @ 8389FF4
	warp_def 11, 14, 0, 12, LilycoveCity
	warp_def 12, 14, 0, 12, LilycoveCity
	warp_def 20, 15, 0, 0, LilycoveCity_EmptyMap
	warp_def 21, 15, 0, 0, LilycoveCity_EmptyMap

LilycoveCity_Harbor_MapEvents:: @ 838A014
	map_events LilycoveCity_Harbor_MapObjects, LilycoveCity_Harbor_MapWarps, 0x0, 0x0
