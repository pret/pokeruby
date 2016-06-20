Route117_MapObjects:: @ 8383440
	object_event 1, MAP_OBJ_GFX_WOMAN_1, 0, 13, 0, 13, 0, 3, 8, 0, 0, 0, 0, 0, 0, Route117_EventScript_150D57, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_LITTLE_BOY_2, 0, 26, 0, 13, 0, 3, 33, 34, 0, 0, 0, 0, 0, Route117_EventScript_150D60, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_OLD_MAN_2, 0, 47, 0, 4, 0, 3, 8, 0, 0, 0, 0, 0, 0, Route117_EventScript_1B222D, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_ZIGZAGOON, 0, 33, 0, 3, 0, 3, 1, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_KECLEON_1, 0, 39, 0, 4, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 6, MAP_OBJ_GFX_AZUMARILL, 0, 42, 0, 2, 0, 3, 1, 17, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 7, MAP_OBJ_GFX_PIKACHU, 0, 49, 0, 2, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 8, MAP_OBJ_GFX_RUNNING_TRIATHLETE_M, 0, 35, 0, 7, 0, 3, 28, 7, 0, 1, 0, 4, 0, Route117_EventScript_150E09, 0, 0, 0
	object_event 9, MAP_OBJ_GFX_WOMAN_3, 0, 31, 0, 11, 0, 3, 23, 0, 0, 1, 0, 3, 0, Route117_EventScript_150DCB, 0, 0, 0
	object_event 10, MAP_OBJ_GFX_MAN_5, 0, 10, 0, 9, 0, 3, 18, 0, 0, 1, 0, 3, 0, Route117_EventScript_150D8D, 0, 0, 0
	object_event 11, MAP_OBJ_GFX_BERRY_TREE, 0, 41, 0, 13, 0, 3, 12, 0, 0, 0, 0, 29, 0, BerryTreeScript, 0, 0, 0
	object_event 12, MAP_OBJ_GFX_BERRY_TREE, 0, 42, 0, 13, 0, 3, 12, 0, 0, 0, 0, 28, 0, BerryTreeScript, 0, 0, 0
	object_event 13, MAP_OBJ_GFX_BERRY_TREE, 0, 43, 0, 13, 0, 3, 12, 0, 0, 0, 0, 27, 0, BerryTreeScript, 0, 0, 0
	object_event 14, MAP_OBJ_GFX_ITEM_BALL, 0, 16, 0, 18, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route117_EventScript_1B1598, 1022, 0, 0
	object_event 15, MAP_OBJ_GFX_CUTTABLE_TREE, 0, 15, 0, 2, 0, 3, 1, 0, 0, 0, 0, 0, 0, CuttableTreeScript, 17, 0, 0
	object_event 16, MAP_OBJ_GFX_ITEM_BALL, 0, 9, 0, 1, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route117_EventScript_1B15A5, 1023, 0, 0
	object_event 17, MAP_OBJ_GFX_RUNNING_TRIATHLETE_F, 0, 21, 0, 1, 0, 3, 40, 68, 0, 1, 0, 3, 0, Route117_EventScript_150E47, 0, 0, 0
	object_event 18, MAP_OBJ_GFX_MANIAC, 0, 17, 0, 12, 0, 3, 7, 17, 0, 1, 0, 4, 0, Route117_EventScript_150E85, 0, 0, 0
	object_event 19, MAP_OBJ_GFX_LASS, 0, 46, 0, 15, 0, 3, 8, 0, 0, 1, 0, 0, 0, Route117_EventScript_150EE2, 0, 0, 0
	object_event 20, MAP_OBJ_GFX_LASS, 0, 45, 0, 15, 0, 3, 8, 0, 0, 1, 0, 0, 0, Route117_EventScript_150E9C, 0, 0, 0
	object_event 21, MAP_OBJ_GFX_GIRL_2, 0, 48, 0, 10, 0, 3, 2, 17, 0, 0, 0, 0, 0, Route117_EventScript_150D69, 0, 0, 0

Route117_MapWarps:: @ 8383638
	warp_def 51, 5, 0, 0, Route117_PokemonDayCare

Route117_MapBGEvents:: @ 8383640
	bg_event 16, 6, 0, 0, 0, Route117_EventScript_150D72
	bg_event 49, 12, 0, 0, 0, Route117_EventScript_150D7B
	bg_event 49, 5, 0, 0, 0, Route117_EventScript_150D84
	bg_event 3, 18, 3, 7, 0, ITEM_REPEL, 72, 0

Route117_MapEvents:: @ 8383670
	map_events Route117_MapObjects, Route117_MapWarps, 0x0, Route117_MapBGEvents

