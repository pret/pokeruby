Route124_EventObjects:: @ 8384D10
	object_event 1, EVENT_OBJ_GFX_SWIMMER_M, 0, 58, 59, 1, 1, 5, 0, 1, 3, Route124_EventScript_151DF8, 0
	object_event 2, EVENT_OBJ_GFX_SWIMMER_M, 0, 33, 25, 1, 52, 5, 3, 1, 3, Route124_EventScript_151E0F, 0
	object_event 3, EVENT_OBJ_GFX_SWIMMER_F, 0, 14, 27, 1, 24, 0, 0, 1, 3, Route124_EventScript_151E26, 0
	object_event 4, EVENT_OBJ_GFX_SWIMMER_F, 0, 49, 45, 1, 24, 6, 8, 1, 3, Route124_EventScript_151E64, 0
	object_event 5, EVENT_OBJ_GFX_SWIMMER_M, 0, 60, 74, 1, 28, 7, 0, 1, 2, Route124_EventScript_151E7B, 0
	object_event 6, EVENT_OBJ_GFX_ITEM_BALL, 0, 28, 12, 3, 1, 1, 1, 0, 0, Route124_EventScript_1B168F, FLAG_ITEM_ROUTE124_2
	object_event 7, EVENT_OBJ_GFX_ITEM_BALL, 0, 31, 53, 3, 1, 1, 1, 0, 0, Route124_EventScript_1B169C, FLAG_ITEM_ROUTE124_3
	object_event 8, EVENT_OBJ_GFX_ITEM_BALL, 0, 58, 11, 3, 1, 1, 1, 0, 0, Route124_EventScript_1B16A9, FLAG_ITEM_ROUTE124_1
	object_event 9, EVENT_OBJ_GFX_SWIMMER_F, 0, 18, 44, 1, 8, 1, 1, 1, 0, Route124_EventScript_151E92, 0
	object_event 10, EVENT_OBJ_GFX_TUBER_M_SWIMMING, 0, 17, 44, 1, 8, 1, 1, 1, 0, Route124_EventScript_151ED8, 0

Route124_MapWarps:: @ 8384E00
	warp_def 70, 48, 3, 0, MAP_ROUTE124_DIVING_TREASURE_HUNTERS_HOUSE

Route124_MapBGEvents:: @ 8384E08
	bg_event 73, 48, 3, 0, 0, Route124_EventScript_151DEF

Route124_MapEvents:: @ 8384E14
	map_events Route124_EventObjects, Route124_MapWarps, 0x0, Route124_MapBGEvents
