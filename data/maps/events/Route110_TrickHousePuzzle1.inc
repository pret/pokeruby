Route110_TrickHousePuzzle1_EventObjects:: @ 839225C
	object_event 1, EVENT_OBJ_GFX_LASS, 0, 13, 0, 21, 0, 3, 9, 0, 0, 1, 0, 5, 0, Route110_TrickHousePuzzle1_EventScript_161D31, 0, 0, 0
	object_event 2, EVENT_OBJ_GFX_YOUNGSTER, 0, 13, 0, 7, 0, 3, 8, 0, 0, 1, 0, 2, 0, Route110_TrickHousePuzzle1_EventScript_161D48, 0, 0, 0
	object_event 3, EVENT_OBJ_GFX_LASS, 0, 3, 0, 8, 0, 3, 9, 0, 0, 1, 0, 3, 0, Route110_TrickHousePuzzle1_EventScript_161D5F, 0, 0, 0
	object_event 4, EVENT_OBJ_GFX_CUTTABLE_TREE, 0, 3, 0, 18, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_CuttableTree, FLAG_TEMP_13, 0, 0
	object_event 5, EVENT_OBJ_GFX_CUTTABLE_TREE, 0, 7, 0, 21, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_CuttableTree, FLAG_TEMP_11, 0, 0
	object_event 6, EVENT_OBJ_GFX_CUTTABLE_TREE, 0, 12, 0, 18, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_CuttableTree, FLAG_TEMP_12, 0, 0
	object_event 7, EVENT_OBJ_GFX_CUTTABLE_TREE, 0, 10, 0, 16, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_CuttableTree, FLAG_TEMP_14, 0, 0
	object_event 8, EVENT_OBJ_GFX_CUTTABLE_TREE, 0, 12, 0, 12, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_CuttableTree, FLAG_TEMP_17, 0, 0
	object_event 9, EVENT_OBJ_GFX_CUTTABLE_TREE, 0, 3, 0, 12, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_CuttableTree, FLAG_TEMP_16, 0, 0
	object_event 10, EVENT_OBJ_GFX_CUTTABLE_TREE, 0, 0, 0, 14, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_CuttableTree, FLAG_TEMP_15, 0, 0
	object_event 11, EVENT_OBJ_GFX_CUTTABLE_TREE, 0, 6, 0, 10, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_CuttableTree, FLAG_TEMP_19, 0, 0
	object_event 12, EVENT_OBJ_GFX_CUTTABLE_TREE, 0, 2, 0, 10, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_CuttableTree, FLAG_TEMP_18, 0, 0
	object_event 13, EVENT_OBJ_GFX_CUTTABLE_TREE, 0, 9, 0, 8, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_CuttableTree, FLAG_TEMP_1A, 0, 0
	object_event 14, EVENT_OBJ_GFX_CUTTABLE_TREE, 0, 2, 0, 4, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_CuttableTree, FLAG_TEMP_1C, 0, 0
	object_event 15, EVENT_OBJ_GFX_CUTTABLE_TREE, 0, 0, 0, 6, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_CuttableTree, FLAG_TEMP_1B, 0, 0
	object_event 16, EVENT_OBJ_GFX_CUTTABLE_TREE, 0, 6, 0, 4, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_CuttableTree, FLAG_TEMP_1D, 0, 0
	object_event 17, EVENT_OBJ_GFX_CUTTABLE_TREE, 0, 11, 0, 4, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_CuttableTree, FLAG_TEMP_1E, 0, 0
	object_event 18, EVENT_OBJ_GFX_ITEM_BALL, 0, 9, 0, 12, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route110_TrickHousePuzzle1_EventScript_1B1A51, FLAG_ITEM_TRICK_HOUSE_PUZZLE_1_1, 0, 0
	object_event 19, EVENT_OBJ_GFX_CUTTABLE_TREE, 0, 14, 0, 14, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_CuttableTree, FLAG_TEMP_1F, 0, 0

Route110_TrickHousePuzzle1_MapWarps:: @ 8392424
	warp_def 0, 21, 3, 2, MAP_ROUTE110_TRICK_HOUSE_ENTRANCE
	warp_def 1, 21, 3, 2, MAP_ROUTE110_TRICK_HOUSE_ENTRANCE
	warp_def 13, 1, 3, 0, MAP_ROUTE110_TRICK_HOUSE_END

Route110_TrickHousePuzzle1_MapBGEvents:: @ 839243C
	bg_event 14, 8, 0, 0, 0, Route110_TrickHousePuzzle1_EventScript_161D14

Route110_TrickHousePuzzle1_MapEvents:: @ 8392448
	map_events Route110_TrickHousePuzzle1_EventObjects, Route110_TrickHousePuzzle1_MapWarps, 0x0, Route110_TrickHousePuzzle1_MapBGEvents
