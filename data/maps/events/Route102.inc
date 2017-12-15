Route102_MapObjects:: @ 83811FC
	object_event 1, MAP_OBJ_GFX_LITTLE_BOY_2, 0, 18, 0, 11, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route102_EventScript_14EADA, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_YOUNGSTER, 0, 33, 0, 14, 0, 3, 8, 0, 0, 1, 0, 3, 0, Route102_EventScript_14EAFE, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_BUG_CATCHER, 0, 25, 0, 15, 0, 3, 7, 0, 0, 1, 0, 2, 0, Route102_EventScript_14EB3C, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_LASS, 0, 8, 0, 7, 0, 3, 18, 0, 0, 1, 0, 3, 0, Route102_EventScript_14EB53, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_BOY_1, 0, 37, 0, 4, 0, 3, 2, 17, 0, 0, 0, 0, 0, Route102_EventScript_14EAF5, 0, 0, 0
	object_event 6, MAP_OBJ_GFX_ITEM_BALL, 0, 11, 0, 15, 0, 3, 8, 0, 0, 0, 0, 0, 0, Route102_EventScript_1B1439, FLAG_ITEM_ROUTE102_1, 0, 0
	object_event 7, MAP_OBJ_GFX_BERRY_TREE, 0, 24, 0, 2, 0, 3, 12, 0, 0, 0, 0, 2, 0, S_BerryTree, 0, 0, 0
	object_event 8, MAP_OBJ_GFX_BERRY_TREE, 0, 25, 0, 2, 0, 3, 12, 0, 0, 0, 0, 1, 0, S_BerryTree, 0, 0, 0
	object_event 9, MAP_OBJ_GFX_YOUNGSTER, 0, 19, 0, 4, 0, 3, 8, 17, 0, 1, 0, 3, 0, Route102_EventScript_14EB6A, 0, 0, 0

Route102_MapBGEvents:: @ 83812D4
	bg_event 17, 2, 0, 0, 0, Route102_EventScript_14EAEC
	bg_event 40, 9, 0, 0, 0, Route102_EventScript_14EAE3

Route102_MapEvents:: @ 83812EC
	map_events Route102_MapObjects, 0x0, 0x0, Route102_MapBGEvents
