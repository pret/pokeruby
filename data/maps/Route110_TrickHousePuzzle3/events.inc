Route110_TrickHousePuzzle3_EventObjects:: @ 839254C
	object_event 1, EVENT_OBJ_GFX_CAMPER, 0, 10, 16, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 1, 1, Route110_TrickHousePuzzle3_EventScript_162708, 0
	object_event 2, EVENT_OBJ_GFX_PICNICKER, 0, 1, 13, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 1, 1, Route110_TrickHousePuzzle3_EventScript_16271F, 0
	object_event 3, EVENT_OBJ_GFX_HIKER, 0, 11, 4, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 1, 1, Route110_TrickHousePuzzle3_EventScript_162736, 0
	object_event 4, EVENT_OBJ_GFX_BREAKABLE_ROCK, 0, 4, 12, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_BreakableRock, FLAG_TEMP_11
	object_event 5, EVENT_OBJ_GFX_BREAKABLE_ROCK, 0, 1, 3, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_BreakableRock, FLAG_TEMP_12
	object_event 6, EVENT_OBJ_GFX_BREAKABLE_ROCK, 0, 11, 10, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_BreakableRock, FLAG_TEMP_13
	object_event 7, EVENT_OBJ_GFX_BREAKABLE_ROCK, 0, 13, 7, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_BreakableRock, FLAG_TEMP_14
	object_event 8, EVENT_OBJ_GFX_ITEM_BALL, 0, 0, 11, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, Route110_TrickHousePuzzle3_EventScript_1B1A85, FLAG_ITEM_TRICK_HOUSE_PUZZLE_3_2
	object_event 9, EVENT_OBJ_GFX_ITEM_BALL, 0, 7, 2, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, Route110_TrickHousePuzzle3_EventScript_1B1A78, FLAG_ITEM_TRICK_HOUSE_PUZZLE_3_1
	object_event 10, EVENT_OBJ_GFX_BREAKABLE_ROCK, 0, 1, 20, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, S_BreakableRock, FLAG_TEMP_15
	object_event 11, EVENT_OBJ_GFX_BREAKABLE_ROCK, 0, 2, 21, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, S_BreakableRock, FLAG_TEMP_16

Route110_TrickHousePuzzle3_MapWarps:: @ 8392654
	warp_def 0, 21, 3, 2, MAP_ROUTE110_TRICK_HOUSE_ENTRANCE
	warp_def 1, 21, 3, 2, MAP_ROUTE110_TRICK_HOUSE_ENTRANCE
	warp_def 13, 1, 3, 0, MAP_ROUTE110_TRICK_HOUSE_END

Route110_TrickHousePuzzle3_MapCoordEvents:: @ 839266C
	coord_event 5, 20, 3, VAR_TEMP_1, 0, Route110_TrickHousePuzzle3_EventScript_1625AB
	coord_event 4, 12, 3, VAR_TEMP_2, 0, Route110_TrickHousePuzzle3_EventScript_1625B7
	coord_event 11, 10, 3, VAR_TEMP_3, 0, Route110_TrickHousePuzzle3_EventScript_1625C3
	coord_event 3, 8, 3, VAR_TEMP_4, 0, Route110_TrickHousePuzzle3_EventScript_1625CF
	coord_event 13, 7, 3, VAR_TEMP_5, 0, Route110_TrickHousePuzzle3_EventScript_1625DB
	coord_event 1, 3, 3, VAR_TEMP_6, 0, Route110_TrickHousePuzzle3_EventScript_1625E7
	coord_event 10, 2, 3, VAR_TEMP_7, 0, Route110_TrickHousePuzzle3_EventScript_1625F3

Route110_TrickHousePuzzle3_MapBGEvents:: @ 83926DC
	bg_event 0, 8, 3, BG_EVENT_PLAYER_FACING_ANY, Route110_TrickHousePuzzle3_EventScript_1626EB

Route110_TrickHousePuzzle3_MapEvents:: @ 83926E8
	map_events Route110_TrickHousePuzzle3_EventObjects, Route110_TrickHousePuzzle3_MapWarps, Route110_TrickHousePuzzle3_MapCoordEvents, Route110_TrickHousePuzzle3_MapBGEvents
