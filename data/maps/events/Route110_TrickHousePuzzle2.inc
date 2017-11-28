Route110_TrickHousePuzzle2_MapObjects:: @ 839245C
	object_event 1, MAP_OBJ_GFX_SCHOOL_KID_M, 0, 13, 0, 16, 0, 3, 8, 0, 0, 1, 0, 1, 0, Route110_TrickHousePuzzle2_EventScript_161E78, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_SCHOOL_KID_M, 0, 0, 0, 10, 0, 3, 10, 0, 0, 1, 0, 2, 0, Route110_TrickHousePuzzle2_EventScript_161E8F, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_GIRL_3, 0, 9, 0, 7, 0, 3, 9, 0, 0, 1, 0, 3, 0, Route110_TrickHousePuzzle2_EventScript_161EA6, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_ITEM_BALL, 0, 5, 0, 19, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route110_TrickHousePuzzle2_EventScript_1B1A6B, 1062, 0, 0
	object_event 5, MAP_OBJ_GFX_ITEM_BALL, 0, 0, 0, 2, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route110_TrickHousePuzzle2_EventScript_1B1A5E, 1061, 0, 0

Route110_TrickHousePuzzle2_MapWarps:: @ 83924D4
	warp_def 0, 21, 3, 2, MAP_ROUTE110_TRICK_HOUSE_ENTRANCE
	warp_def 1, 21, 3, 2, MAP_ROUTE110_TRICK_HOUSE_ENTRANCE
	warp_def 13, 1, 3, 0, MAP_ROUTE110_TRICK_HOUSE_END

Route110_TrickHousePuzzle2_MapCoordEvents:: @ 83924EC
	coord_event 14, 21, 3, 0, 0x4001, 0, 0, Route110_TrickHousePuzzle2_EventScript_161DE0
	coord_event 8, 17, 3, 0, 0x4002, 0, 0, Route110_TrickHousePuzzle2_EventScript_161DF3
	coord_event 4, 10, 3, 0, 0x4003, 0, 0, Route110_TrickHousePuzzle2_EventScript_161E06
	coord_event 5, 2, 0, 0, 0x4004, 0, 0, Route110_TrickHousePuzzle2_EventScript_161E19

Route110_TrickHousePuzzle2_MapBGEvents:: @ 839252C
	bg_event 14, 5, 0, 0, 0, Route110_TrickHousePuzzle2_EventScript_161DC3

Route110_TrickHousePuzzle2_MapEvents:: @ 8392538
	map_events Route110_TrickHousePuzzle2_MapObjects, Route110_TrickHousePuzzle2_MapWarps, Route110_TrickHousePuzzle2_MapCoordEvents, Route110_TrickHousePuzzle2_MapBGEvents
