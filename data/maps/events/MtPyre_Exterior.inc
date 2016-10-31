MtPyre_Exterior_MapObjects:: @ 838CB14
	object_event 1, MAP_OBJ_GFX_ITEM_BALL, 0, 27, 0, 15, 0, 3, 1, 0, 0, 0, 0, 0, 0, MtPyre_Exterior_EventScript_1B1974, 1073, 0, 0
	object_event 2, MAP_OBJ_GFX_ITEM_BALL, 0, 19, 0, 40, 0, 3, 1, 0, 0, 0, 0, 0, 0, MtPyre_Exterior_EventScript_1B1981, 1074, 0, 0

MtPyre_Exterior_MapWarps:: @ 838CB44
	warp_def 10, 42, 3, 1, MtPyre_1F
	warp_def 19, 10, 3, 1, MtPyre_Summit
	warp_def 20, 10, 3, 1, MtPyre_Summit

MtPyre_Exterior_MapCoordEvents:: @ 838CB5C
	coord_event 24, 21, 3, 0, 0, 0, 0, MtPyre_Exterior_EventScript_15D4A7
	coord_event 25, 21, 3, 0, 0, 0, 0, MtPyre_Exterior_EventScript_15D4A7
	coord_event 22, 27, 3, 0, 0, 0, 0, MtPyre_Exterior_EventScript_15D4AC
	coord_event 23, 28, 3, 0, 0, 0, 0, MtPyre_Exterior_EventScript_15D4AC
	coord_event 26, 21, 3, 0, 0, 0, 0, MtPyre_Exterior_EventScript_15D4A7

MtPyre_Exterior_MapBGEvents:: @ 838CBAC
	bg_event 9, 8, 0, 7, 0, ITEM_ULTRA_BALL, 29, 0
	bg_event 16, 22, 0, 7, 0, ITEM_MAX_ETHER, 78, 0

MtPyre_Exterior_MapEvents:: @ 838CBC4
	map_events MtPyre_Exterior_MapObjects, MtPyre_Exterior_MapWarps, MtPyre_Exterior_MapCoordEvents, MtPyre_Exterior_MapBGEvents
