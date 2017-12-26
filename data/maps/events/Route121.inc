Route121_MapObjects:: @ 8384504
	object_event 1, MAP_OBJ_GFX_WOMAN_4, 0, 29, 0, 14, 0, 3, 10, 17, 0, 0, 0, 0, 0, Route121_EventScript_151B0A, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_BERRY_TREE, 0, 14, 0, 2, 0, 3, 12, 0, 0, 0, 0, 47, 0, S_BerryTree, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_BERRY_TREE, 0, 15, 0, 2, 0, 3, 12, 0, 0, 0, 0, 48, 0, S_BerryTree, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_BERRY_TREE, 0, 16, 0, 2, 0, 3, 12, 0, 0, 0, 0, 49, 0, S_BerryTree, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_BERRY_TREE, 0, 17, 0, 2, 0, 3, 12, 0, 0, 0, 0, 50, 0, S_BerryTree, 0, 0, 0
	object_event 6, MAP_OBJ_GFX_BERRY_TREE, 0, 64, 0, 14, 0, 3, 12, 0, 0, 0, 0, 51, 0, S_BerryTree, 0, 0, 0
	object_event 7, MAP_OBJ_GFX_BERRY_TREE, 0, 65, 0, 14, 0, 3, 12, 0, 0, 0, 0, 52, 0, S_BerryTree, 0, 0, 0
	object_event 8, MAP_OBJ_GFX_BERRY_TREE, 0, 66, 0, 14, 0, 3, 12, 0, 0, 0, 0, 53, 0, S_BerryTree, 0, 0, 0
	object_event 9, MAP_OBJ_GFX_BERRY_TREE, 0, 67, 0, 14, 0, 3, 12, 0, 0, 0, 0, 54, 0, S_BerryTree, 0, 0, 0
	object_event 10, MAP_OBJ_GFX_LASS, 0, 39, 0, 9, 0, 3, 8, 0, 0, 1, 0, 0, 0, Route121_EventScript_151BDE, 0, 0, 0
	object_event 11, MAP_OBJ_GFX_LASS, 0, 40, 0, 9, 0, 3, 8, 0, 0, 1, 0, 0, 0, Route121_EventScript_151BF9, 0, 0, 0
	object_event 12, MAP_OBJ_GFX_VAR_1, 0, 30, 0, 8, 0, 3, 7, 0, 0, 0, 0, 0, 0, 0x0, FLAG_HIDE_GRUNTS_ROUTE121, 0, 0
	object_event 13, MAP_OBJ_GFX_VAR_1, 0, 30, 0, 7, 0, 3, 10, 0, 0, 0, 0, 0, 0, 0x0, FLAG_HIDE_GRUNTS_ROUTE121, 0, 0
	object_event 14, MAP_OBJ_GFX_VAR_1, 0, 31, 0, 7, 0, 3, 9, 0, 0, 0, 0, 0, 0, 0x0, FLAG_HIDE_GRUNTS_ROUTE121, 0, 0
	object_event 15, MAP_OBJ_GFX_CUTTABLE_TREE, 0, 32, 0, 5, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_CuttableTree, FLAG_TEMP_11, 0, 0
	object_event 16, MAP_OBJ_GFX_CUTTABLE_TREE, 0, 65, 0, 4, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_CuttableTree, FLAG_TEMP_12, 0, 0
	object_event 17, MAP_OBJ_GFX_WOMAN_2, 0, 63, 0, 5, 0, 3, 9, 0, 0, 1, 0, 4, 0, Route121_EventScript_151B72, 0, 0, 0
	object_event 18, MAP_OBJ_GFX_GENTLEMAN, 0, 55, 0, 8, 0, 3, 17, 0, 0, 1, 0, 3, 0, Route121_EventScript_151B89, 0, 0, 0
	object_event 19, MAP_OBJ_GFX_HEX_MANIAC, 0, 11, 0, 10, 0, 3, 15, 0, 0, 1, 0, 4, 0, Route121_EventScript_151BC7, 0, 0, 0
	object_event 20, MAP_OBJ_GFX_BEAUTY, 0, 22, 0, 5, 0, 3, 17, 0, 0, 1, 0, 4, 0, Route121_EventScript_151C14, 0, 0, 0
	object_event 21, MAP_OBJ_GFX_ITEM_BALL, 0, 55, 0, 10, 0, 3, 1, 17, 0, 0, 0, 0, 0, Route121_EventScript_1B164E, FLAG_ITEM_ROUTE121_1, 0, 0
	object_event 22, MAP_OBJ_GFX_CUTTABLE_TREE, 0, 26, 0, 12, 0, 3, 1, 17, 0, 0, 0, 0, 0, S_CuttableTree, FLAG_TEMP_13, 0, 0

Route121_MapWarps:: @ 8384714
	warp_def 37, 5, 0, 2, MAP_ROUTE121_SAFARI_ZONE_ENTRANCE

Route121_MapCoordEvents:: @ 838471C
	coord_event 25, 5, 3, 0, VAR_ROUTE121_STATE, 0, 0, Route121_EventScript_151B25
	coord_event 25, 6, 3, 0, VAR_ROUTE121_STATE, 0, 0, Route121_EventScript_151B25
	coord_event 25, 7, 3, 0, VAR_ROUTE121_STATE, 0, 0, Route121_EventScript_151B25
	coord_event 25, 8, 3, 0, VAR_ROUTE121_STATE, 0, 0, Route121_EventScript_151B25

Route121_MapBGEvents:: @ 838475C
	bg_event 32, 14, 0, 0, 0, Route121_EventScript_151B13
	bg_event 40, 11, 0, 8, 0, ITEM_PREMIER_BALL, 0, 0
	bg_event 18, 13, 0, 8, 0, ITEM_SUPER_POTION, 0, 0
	bg_event 43, 7, 0, 8, 0, ITEM_NOMEL_BERRY, 0, 0
	bg_event 42, 7, 0, 8, 0, ITEM_APICOT_BERRY, 0, 0
	bg_event 39, 6, 0, 0, 0, Route121_EventScript_151B1C
	bg_hidden_item_event 23, 10, 3, ITEM_HP_UP, FLAG_HIDDEN_ITEM_27
	bg_hidden_item_event 58, 3, 3, ITEM_NUGGET, FLAG_HIDDEN_ITEM_28
	bg_hidden_item_event 72, 5, 3, ITEM_FULL_HEAL, FLAG_HIDDEN_ITEM_49

Route121_MapEvents:: @ 83847C8
	map_events Route121_MapObjects, Route121_MapWarps, Route121_MapCoordEvents, Route121_MapBGEvents
