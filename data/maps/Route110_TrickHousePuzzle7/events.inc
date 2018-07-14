Route110_TrickHousePuzzle7_EventObjects:: @ 8392AC4
	object_event 1, EVENT_OBJ_GFX_PSYCHIC_M, 0, 0, 3, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 1, 2, Route110_TrickHousePuzzle7_EventScript_1633D6, 0
	object_event 2, EVENT_OBJ_GFX_LASS, 0, 14, 3, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 1, 1, Route110_TrickHousePuzzle7_EventScript_163404, 0
	object_event 3, EVENT_OBJ_GFX_HEX_MANIAC, 0, 9, 10, 3, MOVEMENT_TYPE_ROTATE_COUNTERCLOCKWISE, 0, 0, 1, 1, Route110_TrickHousePuzzle7_EventScript_1633ED, 0
	object_event 4, EVENT_OBJ_GFX_ITEM_BALL, 0, 11, 10, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, Route110_TrickHousePuzzle7_EventScript_1B1AAC, FLAG_ITEM_TRICK_HOUSE_PUZZLE_7_1

Route110_TrickHousePuzzle7_MapWarps:: @ 8392B24
	warp_def 0, 21, 3, 2, MAP_ROUTE110_TRICK_HOUSE_ENTRANCE
	warp_def 1, 21, 3, 2, MAP_ROUTE110_TRICK_HOUSE_ENTRANCE
	warp_def 13, 1, 3, 0, MAP_ROUTE110_TRICK_HOUSE_END

Route110_TrickHousePuzzle7_MapCoordEvents:: @ 8392B3C
	coord_event 9, 2, 3, VAR_TEMP_1, 0, Route110_TrickHousePuzzle7_EventScript_1632A8

Route110_TrickHousePuzzle7_MapBGEvents:: @ 8392B4C
	bg_event 7, 2, 3, BG_EVENT_PLAYER_FACING_ANY, Route110_TrickHousePuzzle7_EventScript_16328B
	bg_event 12, 16, 3, BG_EVENT_PLAYER_FACING_ANY, Route110_TrickHousePuzzle7_EventScript_1632B9
	bg_event 5, 10, 3, BG_EVENT_PLAYER_FACING_ANY, Route110_TrickHousePuzzle7_EventScript_163317
	bg_event 12, 11, 3, BG_EVENT_PLAYER_FACING_ANY, Route110_TrickHousePuzzle7_EventScript_1632E8
	bg_event 4, 4, 3, BG_EVENT_PLAYER_FACING_ANY, Route110_TrickHousePuzzle7_EventScript_163346
	bg_event 7, 5, 3, BG_EVENT_PLAYER_FACING_ANY, Route110_TrickHousePuzzle7_EventScript_163375

Route110_TrickHousePuzzle7_MapEvents:: @ 8392B94
	map_events Route110_TrickHousePuzzle7_EventObjects, Route110_TrickHousePuzzle7_MapWarps, Route110_TrickHousePuzzle7_MapCoordEvents, Route110_TrickHousePuzzle7_MapBGEvents
