TradeCenter_MapObjects:: @ 8391340
	object_event 1, MAP_OBJ_GFX_WOMAN_6, 0, 9, 0, 6, 0, 3, 9, 0, 0, 0, 0, 0, 0, TradeCenter_EventScript_1A44AD, 0, 0, 0

TradeCenter_MapWarps:: @ 8391358
	warp_def 5, 8, 3, 127, NONE
	warp_def 6, 8, 3, 127, NONE

TradeCenter_MapCoordEvents:: @ 8391368
	coord_event 4, 5, 3, 0, 0x4000, 0, 0, TradeCenter_EventScript_1A43F0
	coord_event 7, 5, 3, 0, 0x4000, 0, 0, TradeCenter_EventScript_1A43FA

TradeCenter_MapEvents:: @ 8391388
	map_events TradeCenter_MapObjects, TradeCenter_MapWarps, TradeCenter_MapCoordEvents, 0x0
