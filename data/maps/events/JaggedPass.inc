JaggedPass_MapObjects:: @ 838C61C
	object_event 1, MAP_OBJ_GFX_HIKER, 0, 8, 0, 18, 0, 3, 8, 0, 0, 1, 0, 3, 0, JaggedPass_EventScript_15D285, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_CAMPER, 0, 16, 0, 22, 0, 3, 14, 0, 0, 1, 0, 2, 0, JaggedPass_EventScript_15D2DA, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_ITEM_BALL, 0, 23, 0, 24, 0, 3, 1, 0, 0, 0, 0, 0, 0, JaggedPass_EventScript_1B17D4, FLAG_ITEM_JAGGED_PASS_1, 0, 0
	object_event 4, MAP_OBJ_GFX_PICNICKER, 0, 13, 0, 35, 0, 3, 15, 17, 0, 1, 0, 3, 0, JaggedPass_EventScript_15D29C, 0, 0, 0

JaggedPass_MapWarps:: @ 838C67C
	warp_def 14, 40, 3, 2, MAP_ROUTE112
	warp_def 15, 40, 3, 3, MAP_ROUTE112
	warp_def 13, 5, 3, 2, MAP_MT_CHIMNEY
	warp_def 14, 5, 3, 3, MAP_MT_CHIMNEY

JaggedPass_MapCoordEvents:: @ 838C69C
	coord_event 13, 15, 3, 0, 2, 0, 0, 0x0
	coord_event 21, 12, 3, 0, 8, 0, 0, 0x0
	coord_event 14, 15, 3, 0, 2, 0, 0, 0x0
	coord_event 18, 17, 3, 0, 2, 0, 0, 0x0
	coord_event 22, 19, 3, 0, 2, 0, 0, 0x0

JaggedPass_MapBGEvents:: @ 838C6EC
	bg_event 8, 10, 3, 7, 0, ITEM_FULL_HEAL, 77, 0
	bg_event 7, 29, 3, 7, 0, ITEM_GREAT_BALL, 76, 0

JaggedPass_MapEvents:: @ 838C704
	map_events JaggedPass_MapObjects, JaggedPass_MapWarps, JaggedPass_MapCoordEvents, JaggedPass_MapBGEvents
