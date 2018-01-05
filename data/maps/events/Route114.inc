Route114_MapObjects:: @ 8382C48
	object_event 1, MAP_OBJ_GFX_BERRY_TREE, 0, 31, 0, 43, 0, 3, 12, 0, 0, 0, 0, 77, 0, S_BerryTree, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_BERRY_TREE, 0, 31, 0, 44, 0, 3, 12, 0, 0, 0, 0, 78, 0, S_BerryTree, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_HIKER, 0, 15, 0, 65, 0, 7, 10, 0, 0, 1, 0, 6, 0, Route114_EventScript_1507F1, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_HIKER, 0, 30, 0, 72, 0, 5, 15, 0, 0, 1, 0, 4, 0, Route114_EventScript_150808, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_CAMPER, 0, 22, 0, 50, 0, 3, 10, 0, 0, 1, 0, 3, 0, Route114_EventScript_15081F, 0, 0, 0
	object_event 6, MAP_OBJ_GFX_PICNICKER, 0, 19, 0, 35, 0, 3, 1, 0, 0, 1, 0, 3, 0, Route114_EventScript_150836, 0, 0, 0
	object_event 7, MAP_OBJ_GFX_MANIAC, 0, 20, 0, 56, 0, 3, 7, 0, 0, 1, 0, 3, 0, Route114_EventScript_15084D, 0, 0, 0
	object_event 8, MAP_OBJ_GFX_BERRY_TREE, 0, 31, 0, 45, 0, 3, 12, 0, 0, 0, 0, 68, 0, S_BerryTree, 0, 0, 0
	object_event 9, MAP_OBJ_GFX_ITEM_BALL, 0, 7, 0, 6, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route114_EventScript_1B1516, FLAG_ITEM_ROUTE114_1, 0, 0
	object_event 10, MAP_OBJ_GFX_ITEM_BALL, 0, 11, 0, 37, 0, 4, 1, 0, 0, 0, 0, 0, 0, Route114_EventScript_1B1523, FLAG_ITEM_ROUTE114_2, 0, 0
	object_event 11, MAP_OBJ_GFX_BREAKABLE_ROCK, 0, 12, 0, 43, 0, 4, 1, 0, 0, 0, 0, 0, 0, S_BreakableRock, FLAG_TEMP_11, 0, 0
	object_event 12, MAP_OBJ_GFX_GENTLEMAN, 0, 19, 0, 11, 0, 3, 10, 0, 0, 0, 0, 0, 0, Route114_EventScript_150782, 0, 0, 0
	object_event 13, MAP_OBJ_GFX_POOCHYENA, 0, 19, 0, 12, 0, 3, 10, 0, 0, 0, 0, 0, 0, Route114_EventScript_1507C3, 0, 0, 0
	object_event 14, MAP_OBJ_GFX_MAN_5, 0, 27, 0, 42, 0, 3, 3, 16, 0, 0, 0, 0, 0, Route114_EventScript_150733, 0, 0, 0
	object_event 15, MAP_OBJ_GFX_FISHERMAN, 0, 23, 0, 20, 0, 3, 8, 0, 0, 1, 0, 0, 0, Route114_EventScript_1508E0, 0, 0, 0
	object_event 16, MAP_OBJ_GFX_FISHERMAN, 0, 19, 0, 26, 0, 3, 9, 0, 0, 1, 0, 0, 0, Route114_EventScript_1508C9, 0, 0, 0
	object_event 17, MAP_OBJ_GFX_MAN_6, 0, 30, 0, 58, 0, 5, 23, 0, 0, 1, 0, 3, 0, Route114_EventScript_15088B, 0, 0, 0
	object_event 18, MAP_OBJ_GFX_BREAKABLE_ROCK, 0, 29, 0, 53, 0, 5, 1, 17, 0, 0, 0, 0, 0, S_BreakableRock, FLAG_TEMP_12, 0, 0
	object_event 19, MAP_OBJ_GFX_BREAKABLE_ROCK, 0, 30, 0, 54, 0, 5, 1, 17, 0, 0, 0, 0, 0, S_BreakableRock, FLAG_TEMP_13, 0, 0
	object_event 20, MAP_OBJ_GFX_BREAKABLE_ROCK, 0, 22, 0, 69, 0, 7, 1, 17, 0, 0, 0, 0, 0, S_BreakableRock, FLAG_TEMP_14, 0, 0
	object_event 21, MAP_OBJ_GFX_BREAKABLE_ROCK, 0, 11, 0, 64, 0, 5, 1, 17, 0, 0, 0, 0, 0, S_BreakableRock, FLAG_TEMP_15, 0, 0
	object_event 22, MAP_OBJ_GFX_LASS, 0, 24, 0, 44, 0, 3, 8, 17, 0, 1, 0, 0, 0, Route114_EventScript_150912, 0, 0, 0
	object_event 23, MAP_OBJ_GFX_LASS, 0, 23, 0, 44, 0, 3, 8, 17, 0, 1, 0, 0, 0, Route114_EventScript_1508F7, 0, 0, 0

Route114_MapWarps:: @ 8382E70
	warp_def 8, 63, 0, 0, MAP_METEOR_FALLS_1F_1R
	warp_def 29, 5, 0, 0, MAP_ROUTE114_FOSSIL_MANIACS_HOUSE
	warp_def 27, 36, 0, 0, MAP_ROUTE114_LANETTES_HOUSE

Route114_MapBGEvents:: @ 8382E88
	bg_event 7, 64, 0, 0, 0, Route114_EventScript_1507D6
	bg_event 31, 7, 0, 0, 0, Route114_EventScript_1507DF
	bg_secret_base_event 9, 47, 0, SECRET_BASE_BROWN_CAVE1_1
	bg_secret_base_event 30, 51, 0, SECRET_BASE_BROWN_CAVE2_1
	bg_secret_base_event 11, 62, 0, SECRET_BASE_BROWN_CAVE3_1
	bg_secret_base_event 19, 70, 0, SECRET_BASE_BROWN_CAVE4_1
	bg_secret_base_event 11, 27, 0, SECRET_BASE_TREE3_2
	bg_secret_base_event 12, 27, 0, SECRET_BASE_TREE4_2
	bg_event 25, 38, 3, 0, 0, Route114_EventScript_1507E8
	bg_hidden_item_event 20, 57, 3, ITEM_CARBOS, FLAG_HIDDEN_ITEM_4
	bg_secret_base_event 32, 57, 0, SECRET_BASE_BROWN_CAVE4_3
	bg_hidden_item_event 7, 30, 3, ITEM_REVIVE, FLAG_HIDDEN_ITEM_2A

Route114_MapEvents:: @ 8382F18
	map_events Route114_MapObjects, Route114_MapWarps, 0x0, Route114_MapBGEvents
