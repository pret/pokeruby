Route115_MapObjects:: @ 8382F2C
	object_event 1, MAP_OBJ_GFX_WOMAN_3, 0, 18, 0, 68, 0, 3, 2, 17, 0, 0, 0, 0, 0, Route115_EventScript_15092E, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_OLD_MAN_1, 0, 5, 0, 15, 0, 3, 10, 0, 0, 1, 0, 6, 0, Route115_EventScript_150949, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_BLACK_BELT, 0, 27, 0, 53, 0, 3, 15, 17, 0, 1, 0, 4, 0, Route115_EventScript_15099E, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_BERRY_TREE, 0, 11, 0, 5, 0, 3, 12, 0, 0, 0, 0, 69, 0, S_BerryTree, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_BERRY_TREE, 0, 12, 0, 5, 0, 3, 12, 0, 0, 0, 0, 70, 0, S_BerryTree, 0, 0, 0
	object_event 6, MAP_OBJ_GFX_BERRY_TREE, 0, 13, 0, 5, 0, 3, 12, 0, 0, 0, 0, 71, 0, S_BerryTree, 0, 0, 0
	object_event 7, MAP_OBJ_GFX_GIRL_3, 0, 15, 0, 50, 0, 3, 64, 0, 0, 1, 0, 3, 0, Route115_EventScript_1509DC, 0, 0, 0
	object_event 8, MAP_OBJ_GFX_BLACK_BELT, 0, 17, 0, 17, 0, 3, 50, 51, 0, 1, 0, 2, 0, Route115_EventScript_150987, 0, 0, 0
	object_event 9, MAP_OBJ_GFX_MANIAC, 0, 25, 0, 61, 0, 3, 14, 0, 0, 1, 0, 3, 0, Route115_EventScript_150A1A, 0, 0, 0
	object_event 10, MAP_OBJ_GFX_ITEM_BALL, 0, 20, 0, 60, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route115_EventScript_1B1530, FLAG_ITEM_ROUTE115_1, 0, 0
	object_event 11, MAP_OBJ_GFX_ITEM_BALL, 0, 19, 0, 5, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route115_EventScript_1B153D, FLAG_ITEM_ROUTE115_2, 0, 0
	object_event 12, MAP_OBJ_GFX_ITEM_BALL, 0, 23, 0, 29, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route115_EventScript_1B154A, FLAG_ITEM_ROUTE115_3, 0, 0
	object_event 13, MAP_OBJ_GFX_BERRY_TREE, 0, 31, 0, 64, 0, 3, 12, 0, 0, 0, 0, 55, 0, S_BerryTree, 0, 0, 0
	object_event 14, MAP_OBJ_GFX_BERRY_TREE, 0, 31, 0, 65, 0, 3, 12, 0, 0, 0, 0, 56, 0, S_BerryTree, 0, 0, 0
	object_event 15, MAP_OBJ_GFX_BREAKABLE_ROCK, 0, 29, 0, 50, 0, 3, 1, 17, 0, 0, 0, 0, 0, S_BreakableRock, FLAG_TEMP_11, 0, 0
	object_event 16, MAP_OBJ_GFX_ITEM_BALL, 0, 31, 0, 56, 0, 3, 1, 17, 0, 0, 0, 0, 0, Route115_EventScript_1B1557, FLAG_ITEM_ROUTE115_4, 0, 0

Route115_MapWarps:: @ 83830AC
	warp_def 27, 37, 0, 1, MAP_METEOR_FALLS_1F_1R

Route115_MapBGEvents:: @ 83830B4
	bg_secret_base_event 32, 6, 0, SECRET_BASE_BROWN_CAVE4_2
	bg_secret_base_event 21, 18, 0, SECRET_BASE_BROWN_CAVE3_2
	bg_event 16, 64, 0, 0, 0, Route115_EventScript_150937
	bg_event 25, 38, 3, 0, 0, Route115_EventScript_150940
	bg_secret_base_event 8, 30, 0, SECRET_BASE_YELLOW_CAVE2_3
	bg_secret_base_event 32, 39, 0, SECRET_BASE_BROWN_CAVE1_2
	bg_secret_base_event 26, 15, 0, SECRET_BASE_BROWN_CAVE2_2
	bg_secret_base_event 23, 8, 0, SECRET_BASE_BROWN_CAVE1_3
	bg_secret_base_event 32, 46, 0, SECRET_BASE_BROWN_CAVE2_3
	bg_secret_base_event 7, 20, 0, SECRET_BASE_TREE2_4
	bg_secret_base_event 8, 20, 0, SECRET_BASE_TREE3_3
	bg_secret_base_event 25, 24, 0, SECRET_BASE_BROWN_CAVE3_3
	bg_secret_base_event 20, 53, 0, SECRET_BASE_RED_CAVE3_1
	bg_hidden_item_event 15, 49, 3, ITEM_HEART_SCALE, FLAG_HIDDEN_ITEM_61

Route115_MapEvents:: @ 838315C
	map_events Route115_MapObjects, Route115_MapWarps, 0x0, Route115_MapBGEvents
