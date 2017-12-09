Route128_MapObjects:: @ 83850D0
	object_event 1, MAP_OBJ_GFX_SWIMMER_M, 0, 77, 0, 24, 0, 1, 48, 85, 0, 1, 0, 3, 0, Route128_EventScript_1522A4, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_SWIMMER_F, 0, 35, 0, 34, 0, 1, 28, 5, 0, 1, 0, 7, 0, Route128_EventScript_1522E2, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_STEVEN, 0, 40, 0, 22, 0, 3, 8, 0, 0, 0, 0, 0, 0, 0x0, FLAG_HIDE_STEVEN_ROUTE128, 0, 0
	object_event 4, 246, 0, 37, 0, 22, 0, 3, 9, 17, 0, 0, 0, 0, 0, 0x0, 944, 0, 0
	object_event 5, 247, 0, 38, 0, 21, 0, 3, 7, 17, 0, 0, 0, 0, 0, 0x0, 945, 0, 0
	object_event 6, MAP_OBJ_GFX_FISHERMAN, 0, 63, 0, 28, 0, 3, 7, 17, 0, 1, 0, 0, 0, Route128_EventScript_15234E, 0, 0, 0
	object_event 7, MAP_OBJ_GFX_MAN_4, 0, 24, 0, 8, 0, 3, 17, 17, 0, 1, 0, 2, 0, Route128_EventScript_152337, 0, 0, 0
	object_event 8, MAP_OBJ_GFX_WOMAN_7, 0, 47, 0, 9, 0, 3, 10, 17, 0, 1, 0, 3, 0, Route128_EventScript_152320, 0, 0, 0

Route128_MapBGEvents:: @ 8385190
	bg_event 49, 9, 3, 7, 0, ITEM_HEART_SCALE, 92, 0
	bg_event 57, 21, 3, 7, 0, ITEM_HEART_SCALE, 93, 0
	bg_event 31, 33, 3, 7, 0, ITEM_HEART_SCALE, 94, 0

Route128_MapEvents:: @ 83851B4
	map_events Route128_MapObjects, 0x0, 0x0, Route128_MapBGEvents
