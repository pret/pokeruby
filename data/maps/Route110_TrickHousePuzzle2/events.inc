Route110_TrickHousePuzzle2_EventObjects:: @ 839245C
	object_event 1, EVENT_OBJ_GFX_SCHOOL_KID_M, 0, 13, 16, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 1, 1, Route110_TrickHousePuzzle2_EventScript_161E78, 0
	object_event 2, EVENT_OBJ_GFX_SCHOOL_KID_M, 0, 0, 10, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 1, 2, Route110_TrickHousePuzzle2_EventScript_161E8F, 0
	object_event 3, EVENT_OBJ_GFX_GIRL_3, 0, 9, 7, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 1, 3, Route110_TrickHousePuzzle2_EventScript_161EA6, 0
	object_event 4, EVENT_OBJ_GFX_ITEM_BALL, 0, 5, 19, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, Route110_TrickHousePuzzle2_EventScript_1B1A6B, FLAG_ITEM_TRICK_HOUSE_PUZZLE_2_2
	object_event 5, EVENT_OBJ_GFX_ITEM_BALL, 0, 0, 2, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, Route110_TrickHousePuzzle2_EventScript_1B1A5E, FLAG_ITEM_TRICK_HOUSE_PUZZLE_2_1

Route110_TrickHousePuzzle2_MapWarps:: @ 83924D4
	warp_def 0, 21, 3, 2, MAP_ROUTE110_TRICK_HOUSE_ENTRANCE
	warp_def 1, 21, 3, 2, MAP_ROUTE110_TRICK_HOUSE_ENTRANCE
	warp_def 13, 1, 3, 0, MAP_ROUTE110_TRICK_HOUSE_END

Route110_TrickHousePuzzle2_MapCoordEvents:: @ 83924EC
	coord_event 14, 21, 3, VAR_TEMP_1, 0, Route110_TrickHousePuzzle2_EventScript_161DE0
	coord_event 8, 17, 3, VAR_TEMP_2, 0, Route110_TrickHousePuzzle2_EventScript_161DF3
	coord_event 4, 10, 3, VAR_TEMP_3, 0, Route110_TrickHousePuzzle2_EventScript_161E06
	coord_event 5, 2, 0, VAR_TEMP_4, 0, Route110_TrickHousePuzzle2_EventScript_161E19

Route110_TrickHousePuzzle2_MapBGEvents:: @ 839252C
	bg_event 14, 5, 0, BG_EVENT_PLAYER_FACING_ANY, Route110_TrickHousePuzzle2_EventScript_161DC3

Route110_TrickHousePuzzle2_MapEvents:: @ 8392538
	map_events Route110_TrickHousePuzzle2_EventObjects, Route110_TrickHousePuzzle2_MapWarps, Route110_TrickHousePuzzle2_MapCoordEvents, Route110_TrickHousePuzzle2_MapBGEvents
