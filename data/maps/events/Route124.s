Route124_MapObjects:: @ 8384D10
	object_event 1, MAP_OBJ_GFX_SWIMMER_M, 0, 58, 0, 59, 0, 1, 1, 5, 0, 1, 0, 3, 0, Route124_EventScript_151DF8, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_SWIMMER_M, 0, 33, 0, 25, 0, 1, 52, 53, 0, 1, 0, 3, 0, Route124_EventScript_151E0F, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_SWIMMER_F, 0, 14, 0, 27, 0, 1, 24, 0, 0, 1, 0, 3, 0, Route124_EventScript_151E26, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_SWIMMER_F, 0, 49, 0, 45, 0, 1, 24, 134, 0, 1, 0, 3, 0, Route124_EventScript_151E64, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_SWIMMER_M, 0, 60, 0, 74, 0, 1, 28, 7, 0, 1, 0, 2, 0, Route124_EventScript_151E7B, 0, 0, 0
	object_event 6, MAP_OBJ_GFX_ITEM_BALL, 0, 28, 0, 12, 0, 3, 1, 17, 0, 0, 0, 0, 0, Route124_EventScript_1B168F, 1092, 0, 0
	object_event 7, MAP_OBJ_GFX_ITEM_BALL, 0, 31, 0, 53, 0, 3, 1, 17, 0, 0, 0, 0, 0, Route124_EventScript_1B169C, 1093, 0, 0
	object_event 8, MAP_OBJ_GFX_ITEM_BALL, 0, 58, 0, 11, 0, 3, 1, 17, 0, 0, 0, 0, 0, Route124_EventScript_1B16A9, 1066, 0, 0
	object_event 9, MAP_OBJ_GFX_SWIMMER_F, 0, 18, 0, 44, 0, 1, 8, 17, 0, 1, 0, 0, 0, Route124_EventScript_151E92, 0, 0, 0
	object_event 10, MAP_OBJ_GFX_TUBER_M_SWIMMING, 0, 17, 0, 44, 0, 1, 8, 17, 0, 1, 0, 0, 0, Route124_EventScript_151ED8, 0, 0, 0

Route124_MapWarps:: @ 8384E00
	warp_def 70, 48, 3, 0, Route124_DivingTreasureHuntersHouse

Route124_MapBGEvents:: @ 8384E08
	bg_event 73, 48, 3, 0, 0, Route124_EventScript_151DEF

Route124_MapEvents:: @ 8384E14
	map_events Route124_MapObjects, Route124_MapWarps, 0x0, Route124_MapBGEvents

