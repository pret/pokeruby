MtPyre_5F_MapObjects:: @ 838CA54
	object_event 1, MAP_OBJ_GFX_HEX_MANIAC, 0, 3, 0, 7, 0, 3, 17, 17, 0, 1, 0, 2, 0, MtPyre_5F_EventScript_15D430, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_ITEM_BALL, 0, 6, 0, 11, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtPyre_5F_EventScript_1B195A, 1052, 0, 0

MtPyre_5F_MapWarps:: @ 838CA84
	warp_def 2, 1, 3, 0, MtPyre_6F
	warp_def 10, 5, 3, 0, MtPyre_4F
	warp_def 1, 10, 3, 1, MtPyre_6F
	warp_def 12, 10, 3, 2, MtPyre_4F
	warp_def 12, 12, 3, 3, MtPyre_4F

MtPyre_5F_MapEvents:: @ 838CAAC
	map_events MtPyre_5F_MapObjects, MtPyre_5F_MapWarps, 0x0, 0x0

