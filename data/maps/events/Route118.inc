Route118_MapObjects:: @ 8383684
	object_event 1, MAP_OBJ_GFX_BERRY_TREE, 0, 35, 0, 5, 0, 3, 12, 0, 0, 0, 0, 31, 0, S_BerryTree, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_BERRY_TREE, 0, 36, 0, 5, 0, 3, 12, 0, 0, 0, 0, 32, 0, S_BerryTree, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_BERRY_TREE, 0, 37, 0, 5, 0, 3, 12, 0, 0, 0, 0, 33, 0, S_BerryTree, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_MAN_6, 0, 64, 0, 10, 0, 3, 8, 0, 0, 1, 0, 3, 0, Route118_EventScript_151139, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_REPORTER_F, 0, 33, 0, 8, 0, 3, 8, 0, 0, 0, 0, 0, 0, Route118_EventScript_1AE462, FLAG_HIDE_GABBY_AND_TY_ROUTE118_1, 0, 0
	object_event 6, MAP_OBJ_GFX_CAMERAMAN, 0, 34, 0, 8, 0, 3, 8, 0, 0, 0, 0, 0, 0, Route118_EventScript_1AE482, FLAG_HIDE_GABBY_AND_TY_ROUTE118_1, 0, 0
	object_event 7, MAP_OBJ_GFX_GIRL_2, 0, 12, 0, 8, 0, 3, 2, 17, 0, 0, 0, 0, 0, Route118_EventScript_150F93, 0, 0, 0
	object_event 8, MAP_OBJ_GFX_REPORTER_F, 0, 33, 0, 8, 0, 3, 8, 0, 0, 0, 0, 0, 0, Route118_EventScript_1AE522, FLAG_HIDE_GABBY_AND_TY_ROUTE118_2, 0, 0
	object_event 9, MAP_OBJ_GFX_CAMERAMAN, 0, 34, 0, 8, 0, 3, 8, 0, 0, 0, 0, 0, 0, Route118_EventScript_1AE542, FLAG_HIDE_GABBY_AND_TY_ROUTE118_2, 0, 0
	object_event 10, MAP_OBJ_GFX_REPORTER_F, 0, 33, 0, 8, 0, 3, 8, 0, 0, 0, 0, 0, 0, Route118_EventScript_1AE562, FLAG_HIDE_GABBY_AND_TY_ROUTE118_3, 0, 0
	object_event 11, MAP_OBJ_GFX_CAMERAMAN, 0, 34, 0, 8, 0, 3, 8, 0, 0, 0, 0, 0, 0, Route118_EventScript_1AE582, FLAG_HIDE_GABBY_AND_TY_ROUTE118_3, 0, 0
	object_event 12, MAP_OBJ_GFX_CUTTABLE_TREE, 0, 38, 0, 8, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_CuttableTree, FLAG_TEMP_11, 0, 0
	object_event 13, MAP_OBJ_GFX_FISHERMAN, 0, 28, 0, 8, 0, 3, 9, 0, 0, 0, 0, 0, 0, Route118_EventScript_150F34, 0, 0, 0
	object_event 14, MAP_OBJ_GFX_WOMAN_3, 0, 7, 0, 10, 0, 3, 24, 0, 0, 1, 0, 4, 0, Route118_EventScript_15108F, 0, 0, 0
	object_event 15, MAP_OBJ_GFX_FISHERMAN, 0, 14, 0, 14, 0, 3, 8, 0, 0, 1, 0, 0, 0, Route118_EventScript_1510E4, 0, 0, 0
	object_event 16, MAP_OBJ_GFX_MAN_6, 0, 56, 0, 7, 0, 3, 16, 0, 0, 1, 0, 3, 0, Route118_EventScript_151150, 0, 0, 0
	object_event 17, MAP_OBJ_GFX_FISHERMAN, 0, 39, 0, 15, 0, 3, 1, 0, 0, 1, 0, 2, 0, Route118_EventScript_1510CD, 0, 0, 0
	object_event 18, MAP_OBJ_GFX_MAN_6, 0, 17, 0, 11, 0, 3, 15, 17, 0, 1, 0, 3, 0, Route118_EventScript_1510FB, 0, 0, 0
	object_event 19, MAP_OBJ_GFX_STEVEN, 0, 44, 0, 7, 0, 3, 8, 17, 0, 0, 0, 0, 0, 0x0, FLAG_HIDE_STEVEN_ROUTE118, 0, 0
	object_event 20, MAP_OBJ_GFX_ITEM_BALL, 0, 69, 0, 7, 0, 3, 1, 17, 0, 0, 0, 0, 0, Route118_EventScript_1B15B2, FLAG_ITEM_ROUTE118_1, 0, 0

Route118_MapCoordEvents:: @ 8383864
	coord_event 43, 11, 3, 0, VAR_ROUTE118_STATE, 0, 0, Route118_EventScript_150FAE
	coord_event 44, 11, 3, 0, VAR_ROUTE118_STATE, 0, 0, Route118_EventScript_150FCE
	coord_event 45, 11, 3, 0, VAR_ROUTE118_STATE, 0, 0, Route118_EventScript_150FE4

Route118_MapBGEvents:: @ 8383894
	bg_secret_base_event 47, 14, 0, SECRET_BASE_RED_CAVE1(1)
	bg_event 13, 6, 0, 0, 0, Route118_EventScript_150F9C
	bg_event 56, 8, 0, 0, 0, Route118_EventScript_150FA5
	bg_secret_base_event 67, 6, 0, SECRET_BASE_RED_CAVE2(1)
	bg_secret_base_event 29, 5, 0, SECRET_BASE_YELLOW_CAVE1(2)
	bg_secret_base_event 47, 5, 0, SECRET_BASE_TREE1(3)
	bg_secret_base_event 46, 5, 0, SECRET_BASE_TREE2(1)
	bg_hidden_item_event 31, 13, 3, ITEM_IRON, FLAG_HIDDEN_ITEM_43
	bg_hidden_item_event 12, 14, 3, ITEM_HEART_SCALE, FLAG_HIDDEN_ITEM_42

Route118_MapEvents:: @ 8383900
	map_events Route118_MapObjects, 0x0, Route118_MapCoordEvents, Route118_MapBGEvents
