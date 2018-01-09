Route103_MapObjects:: @ 8381300
	object_event 1, MAP_OBJ_GFX_MAN_4, 0, 49, 0, 12, 0, 3, 9, 0, 0, 0, 0, 0, 0, Route103_EventScript_14ED82, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_VAR_0, 0, 10, 0, 2, 0, 3, 7, 0, 0, 0, 0, 0, 0, Route103_EventScript_14EB92, FLAG_HIDE_RIVAL_ROUTE103, 0, 0
	object_event 3, MAP_OBJ_GFX_WOMAN_3, 0, 71, 0, 10, 0, 3, 18, 0, 0, 1, 0, 3, 0, Route103_EventScript_14ED94, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_LITTLE_GIRL_1, 0, 65, 0, 11, 0, 3, 8, 0, 0, 1, 0, 0, 0, Route103_EventScript_14EDF1, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_LITTLE_GIRL_1, 0, 64, 0, 11, 0, 3, 8, 0, 0, 1, 0, 0, 0, Route103_EventScript_14EDAB, 0, 0, 0
	object_event 6, MAP_OBJ_GFX_FISHERMAN, 0, 50, 0, 8, 0, 3, 26, 16, 0, 1, 0, 3, 0, Route103_EventScript_14EE37, 0, 0, 0
	object_event 7, MAP_OBJ_GFX_BERRY_TREE, 0, 58, 0, 5, 0, 3, 12, 0, 0, 0, 0, 5, 0, S_BerryTree, 0, 0, 0
	object_event 8, MAP_OBJ_GFX_BERRY_TREE, 0, 59, 0, 5, 0, 3, 12, 0, 0, 0, 0, 6, 0, S_BerryTree, 0, 0, 0
	object_event 9, MAP_OBJ_GFX_BERRY_TREE, 0, 60, 0, 5, 0, 3, 12, 0, 0, 0, 0, 7, 0, S_BerryTree, 0, 0, 0
	object_event 10, MAP_OBJ_GFX_BOY_1, 0, 20, 0, 10, 0, 3, 2, 33, 0, 0, 0, 0, 0, Route103_EventScript_14ED79, 0, 0, 0
	object_event 11, MAP_OBJ_GFX_PROF_BIRCH, 0, 7, 0, 3, 0, 3, 2, 17, 0, 0, 0, 0, 0, Route103_EventScript_1A037F, FLAG_HIDE_BIRCH_ROUTE103, 0, 0
	object_event 12, MAP_OBJ_GFX_MAN_3, 0, 56, 0, 12, 0, 3, 10, 0, 0, 1, 0, 5, 0, Route103_EventScript_14EE4E, 0, 0, 0
	object_event 13, MAP_OBJ_GFX_ITEM_BALL, 0, 63, 0, 8, 0, 3, 1, 17, 0, 0, 0, 0, 0, Route103_EventScript_1B1446, FLAG_ITEM_ROUTE103_1, 0, 0
	object_event 14, MAP_OBJ_GFX_CUTTABLE_TREE, 0, 67, 0, 7, 0, 3, 1, 17, 0, 0, 0, 0, 0, S_CuttableTree, FLAG_TEMP_12, 0, 0
	object_event 15, MAP_OBJ_GFX_CUTTABLE_TREE, 0, 69, 0, 7, 0, 3, 1, 17, 0, 0, 0, 0, 0, S_CuttableTree, FLAG_TEMP_13, 0, 0

Route103_MapBGEvents:: @ 8381468
	bg_event 11, 9, 0, 0, 0, Route103_EventScript_14ED8B

Route103_MapEvents:: @ 8381474
	map_events Route103_MapObjects, 0x0, 0x0, Route103_MapBGEvents
