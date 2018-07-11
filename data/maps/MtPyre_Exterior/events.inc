MtPyre_Exterior_EventObjects:: @ 838CB14
	object_event 1, EVENT_OBJ_GFX_ITEM_BALL, 0, 27, 15, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, MtPyre_Exterior_EventScript_1B1974, FLAG_ITEM_MT_PYRE_EXTERIOR_1
	object_event 2, EVENT_OBJ_GFX_ITEM_BALL, 0, 19, 40, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, MtPyre_Exterior_EventScript_1B1981, FLAG_ITEM_MT_PYRE_EXTERIOR_2

MtPyre_Exterior_MapWarps:: @ 838CB44
	warp_def 10, 42, 3, 1, MAP_MT_PYRE_1F
	warp_def 19, 10, 3, 1, MAP_MT_PYRE_SUMMIT
	warp_def 20, 10, 3, 1, MAP_MT_PYRE_SUMMIT

MtPyre_Exterior_MapCoordEvents:: @ 838CB5C
	coord_event 24, 21, 3, 0, 0, MtPyre_Exterior_EventScript_15D4A7
	coord_event 25, 21, 3, 0, 0, MtPyre_Exterior_EventScript_15D4A7
	coord_event 22, 27, 3, 0, 0, MtPyre_Exterior_EventScript_15D4AC
	coord_event 23, 28, 3, 0, 0, MtPyre_Exterior_EventScript_15D4AC
	coord_event 26, 21, 3, 0, 0, MtPyre_Exterior_EventScript_15D4A7

MtPyre_Exterior_MapBGEvents:: @ 838CBAC
	bg_hidden_item_event 9, 8, 0, ITEM_ULTRA_BALL, FLAG_HIDDEN_ITEM_1D
	bg_hidden_item_event 16, 22, 0, ITEM_MAX_ETHER, FLAG_HIDDEN_ITEM_4E

MtPyre_Exterior_MapEvents:: @ 838CBC4
	map_events MtPyre_Exterior_EventObjects, MtPyre_Exterior_MapWarps, MtPyre_Exterior_MapCoordEvents, MtPyre_Exterior_MapBGEvents
