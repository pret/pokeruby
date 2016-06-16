Route105_MapObjects:: @ 8381854
	object_event 1, MAP_OBJ_GFX_SWIMMER_M, 0, 18, 0, 60, 0, 1, 10, 0, 0, 1, 0, 6, 0, Route105_EventScript_14F2D2, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_SWIMMER_M, 0, 10, 0, 44, 0, 1, 27, 7, 0, 1, 0, 3, 0, Route105_EventScript_14F2E9, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_SWIMMER_F, 0, 26, 0, 36, 0, 1, 25, 112, 0, 1, 0, 3, 0, Route105_EventScript_14F300, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_SWIMMER_F, 0, 19, 0, 9, 0, 1, 24, 80, 0, 1, 0, 3, 0, Route105_EventScript_14F317, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_ITEM_BALL, 0, 8, 0, 73, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route105_EventScript_1B1487, 1003, 0, 0
	object_event 6, MAP_OBJ_GFX_HIKER, 0, 12, 0, 51, 0, 3, 13, 0, 0, 1, 0, 3, 0, Route105_EventScript_14F2BB, 0, 0, 0

Route105_MapWarps:: @ 83818E4
	warp_def 9, 20, 0, 0, IslandCave

Route105_MapBGEvents:: @ 83818EC
	bg_event 15, 68, 3, 7, 0, ITEM_HEART_SCALE, 89, 0

Route105_MapEvents:: @ 83818F8
	map_events Route105_MapObjects, Route105_MapWarps, 0x0, Route105_MapBGEvents

