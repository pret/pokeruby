Route110_TrickHousePuzzle1_MapObjects:: @ 839225C
	object_event 1, MAP_OBJ_GFX_LASS, 0, 13, 0, 21, 0, 3, 9, 0, 0, 1, 0, 5, 0, Route110_TrickHousePuzzle1_EventScript_161D31, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_YOUNGSTER, 0, 13, 0, 7, 0, 3, 8, 0, 0, 1, 0, 2, 0, Route110_TrickHousePuzzle1_EventScript_161D48, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_LASS, 0, 3, 0, 8, 0, 3, 9, 0, 0, 1, 0, 3, 0, Route110_TrickHousePuzzle1_EventScript_161D5F, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_CUTTABLE_TREE, 0, 3, 0, 18, 0, 3, 1, 0, 0, 0, 0, 0, 0, CuttableTreeScript, 19, 0, 0
	object_event 5, MAP_OBJ_GFX_CUTTABLE_TREE, 0, 7, 0, 21, 0, 3, 1, 0, 0, 0, 0, 0, 0, CuttableTreeScript, 17, 0, 0
	object_event 6, MAP_OBJ_GFX_CUTTABLE_TREE, 0, 12, 0, 18, 0, 3, 1, 0, 0, 0, 0, 0, 0, CuttableTreeScript, 18, 0, 0
	object_event 7, MAP_OBJ_GFX_CUTTABLE_TREE, 0, 10, 0, 16, 0, 3, 1, 0, 0, 0, 0, 0, 0, CuttableTreeScript, 20, 0, 0
	object_event 8, MAP_OBJ_GFX_CUTTABLE_TREE, 0, 12, 0, 12, 0, 3, 1, 0, 0, 0, 0, 0, 0, CuttableTreeScript, 23, 0, 0
	object_event 9, MAP_OBJ_GFX_CUTTABLE_TREE, 0, 3, 0, 12, 0, 3, 1, 0, 0, 0, 0, 0, 0, CuttableTreeScript, 22, 0, 0
	object_event 10, MAP_OBJ_GFX_CUTTABLE_TREE, 0, 0, 0, 14, 0, 3, 1, 0, 0, 0, 0, 0, 0, CuttableTreeScript, 21, 0, 0
	object_event 11, MAP_OBJ_GFX_CUTTABLE_TREE, 0, 6, 0, 10, 0, 3, 1, 0, 0, 0, 0, 0, 0, CuttableTreeScript, 25, 0, 0
	object_event 12, MAP_OBJ_GFX_CUTTABLE_TREE, 0, 2, 0, 10, 0, 3, 1, 0, 0, 0, 0, 0, 0, CuttableTreeScript, 24, 0, 0
	object_event 13, MAP_OBJ_GFX_CUTTABLE_TREE, 0, 9, 0, 8, 0, 3, 1, 0, 0, 0, 0, 0, 0, CuttableTreeScript, 26, 0, 0
	object_event 14, MAP_OBJ_GFX_CUTTABLE_TREE, 0, 2, 0, 4, 0, 3, 1, 0, 0, 0, 0, 0, 0, CuttableTreeScript, 28, 0, 0
	object_event 15, MAP_OBJ_GFX_CUTTABLE_TREE, 0, 0, 0, 6, 0, 3, 1, 0, 0, 0, 0, 0, 0, CuttableTreeScript, 27, 0, 0
	object_event 16, MAP_OBJ_GFX_CUTTABLE_TREE, 0, 6, 0, 4, 0, 3, 1, 0, 0, 0, 0, 0, 0, CuttableTreeScript, 29, 0, 0
	object_event 17, MAP_OBJ_GFX_CUTTABLE_TREE, 0, 11, 0, 4, 0, 3, 1, 0, 0, 0, 0, 0, 0, CuttableTreeScript, 30, 0, 0
	object_event 18, MAP_OBJ_GFX_ITEM_BALL, 0, 9, 0, 12, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route110_TrickHousePuzzle1_EventScript_1B1A51, 1060, 0, 0
	object_event 19, MAP_OBJ_GFX_CUTTABLE_TREE, 0, 14, 0, 14, 0, 3, 1, 0, 0, 0, 0, 0, 0, CuttableTreeScript, 31, 0, 0

Route110_TrickHousePuzzle1_MapWarps:: @ 8392424
	warp_def 0, 21, 3, 2, Route110_TrickHouseEntrance
	warp_def 1, 21, 3, 2, Route110_TrickHouseEntrance
	warp_def 13, 1, 3, 0, Route110_TrickHouseEnd

Route110_TrickHousePuzzle1_MapBGEvents:: @ 839243C
	bg_event 14, 8, 0, 0, 0, Route110_TrickHousePuzzle1_EventScript_161D14

Route110_TrickHousePuzzle1_MapEvents:: @ 8392448
	map_events Route110_TrickHousePuzzle1_MapObjects, Route110_TrickHousePuzzle1_MapWarps, 0x0, Route110_TrickHousePuzzle1_MapBGEvents
