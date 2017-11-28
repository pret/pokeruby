Route106_MapObjects:: @ 838190C
	object_event 1, MAP_OBJ_GFX_SWIMMER_M, 0, 29, 0, 11, 0, 1, 27, 4, 0, 1, 0, 3, 0, Route106_EventScript_14F338, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_SWIMMER_F, 0, 18, 0, 5, 0, 3, 1, 0, 0, 1, 0, 3, 0, Route106_EventScript_14F34F, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_FISHERMAN, 0, 51, 0, 14, 0, 3, 10, 0, 0, 1, 0, 4, 0, Route106_EventScript_14F366, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_FISHERMAN, 0, 65, 0, 14, 0, 3, 1, 0, 0, 1, 0, 3, 0, Route106_EventScript_14F3A4, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_ITEM_BALL, 0, 29, 0, 14, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route106_EventScript_1B1494, 1004, 0, 0

Route106_MapWarps:: @ 8381984
	warp_def 48, 16, 0, 0, MAP_GRANITE_CAVE_1F

Route106_MapBGEvents:: @ 838198C
	bg_event 41, 11, 3, 7, 0, ITEM_POKE_BALL, 63, 0
	bg_event 53, 12, 0, 7, 0, ITEM_STARDUST, 46, 0
	bg_event 68, 15, 3, 7, 0, ITEM_HEART_SCALE, 47, 0
	bg_event 59, 13, 3, 0, 0, Route106_EventScript_14F32F

Route106_MapEvents:: @ 83819BC
	map_events Route106_MapObjects, Route106_MapWarps, 0x0, Route106_MapBGEvents
