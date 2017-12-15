Route110_TrickHousePuzzle3_MapObjects:: @ 839254C
	object_event 1, MAP_OBJ_GFX_CAMPER, 0, 10, 0, 16, 0, 3, 8, 0, 0, 1, 0, 1, 0, Route110_TrickHousePuzzle3_EventScript_162708, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_PICNICKER, 0, 1, 0, 13, 0, 3, 10, 0, 0, 1, 0, 1, 0, Route110_TrickHousePuzzle3_EventScript_16271F, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_HIKER, 0, 11, 0, 4, 0, 3, 8, 0, 0, 1, 0, 1, 0, Route110_TrickHousePuzzle3_EventScript_162736, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_BREAKABLE_ROCK, 0, 4, 0, 12, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_BreakableRock, FLAG_TEMP_11, 0, 0
	object_event 5, MAP_OBJ_GFX_BREAKABLE_ROCK, 0, 1, 0, 3, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_BreakableRock, FLAG_TEMP_12, 0, 0
	object_event 6, MAP_OBJ_GFX_BREAKABLE_ROCK, 0, 11, 0, 10, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_BreakableRock, FLAG_TEMP_13, 0, 0
	object_event 7, MAP_OBJ_GFX_BREAKABLE_ROCK, 0, 13, 0, 7, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_BreakableRock, FLAG_TEMP_14, 0, 0
	object_event 8, MAP_OBJ_GFX_ITEM_BALL, 0, 0, 0, 11, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route110_TrickHousePuzzle3_EventScript_1B1A85, FLAG_ITEM_TRICK_HOUSE_PUZZLE_3_2, 0, 0
	object_event 9, MAP_OBJ_GFX_ITEM_BALL, 0, 7, 0, 2, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route110_TrickHousePuzzle3_EventScript_1B1A78, FLAG_ITEM_TRICK_HOUSE_PUZZLE_3_1, 0, 0
	object_event 10, MAP_OBJ_GFX_BREAKABLE_ROCK, 0, 1, 0, 20, 0, 3, 1, 17, 0, 0, 0, 0, 0, S_BreakableRock, FLAG_TEMP_15, 0, 0
	object_event 11, MAP_OBJ_GFX_BREAKABLE_ROCK, 0, 2, 0, 21, 0, 3, 1, 17, 0, 0, 0, 0, 0, S_BreakableRock, FLAG_TEMP_16, 0, 0

Route110_TrickHousePuzzle3_MapWarps:: @ 8392654
	warp_def 0, 21, 3, 2, MAP_ROUTE110_TRICK_HOUSE_ENTRANCE
	warp_def 1, 21, 3, 2, MAP_ROUTE110_TRICK_HOUSE_ENTRANCE
	warp_def 13, 1, 3, 0, MAP_ROUTE110_TRICK_HOUSE_END

Route110_TrickHousePuzzle3_MapCoordEvents:: @ 839266C
	coord_event 5, 20, 3, 0, 0x4001, 0, 0, Route110_TrickHousePuzzle3_EventScript_1625AB
	coord_event 4, 12, 3, 0, 0x4002, 0, 0, Route110_TrickHousePuzzle3_EventScript_1625B7
	coord_event 11, 10, 3, 0, 0x4003, 0, 0, Route110_TrickHousePuzzle3_EventScript_1625C3
	coord_event 3, 8, 3, 0, 0x4004, 0, 0, Route110_TrickHousePuzzle3_EventScript_1625CF
	coord_event 13, 7, 3, 0, 0x4005, 0, 0, Route110_TrickHousePuzzle3_EventScript_1625DB
	coord_event 1, 3, 3, 0, 0x4006, 0, 0, Route110_TrickHousePuzzle3_EventScript_1625E7
	coord_event 10, 2, 3, 0, 0x4007, 0, 0, Route110_TrickHousePuzzle3_EventScript_1625F3

Route110_TrickHousePuzzle3_MapBGEvents:: @ 83926DC
	bg_event 0, 8, 3, 0, 0, Route110_TrickHousePuzzle3_EventScript_1626EB

Route110_TrickHousePuzzle3_MapEvents:: @ 83926E8
	map_events Route110_TrickHousePuzzle3_MapObjects, Route110_TrickHousePuzzle3_MapWarps, Route110_TrickHousePuzzle3_MapCoordEvents, Route110_TrickHousePuzzle3_MapBGEvents
