Route112_MapObjects:: @ 8382818
	object_event 1, MAP_OBJ_GFX_VAR_1, 0, 26, 0, 30, 0, 3, 8, 17, 0, 0, 0, 0, 0, Route112_EventScript_150513, FLAG_HIDE_GRUNTS_BLOCKING_CABLE_CAR, 0, 0
	object_event 2, MAP_OBJ_GFX_HIKER, 0, 24, 0, 34, 0, 3, 14, 0, 0, 1, 0, 2, 0, Route112_EventScript_150549, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_CAMPER, 0, 29, 0, 49, 0, 3, 8, 0, 0, 1, 0, 3, 0, Route112_EventScript_15059E, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_PICNICKER, 0, 22, 0, 46, 0, 3, 23, 0, 0, 1, 0, 3, 0, Route112_EventScript_1505B5, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_HIKER, 0, 17, 0, 40, 0, 3, 16, 0, 0, 1, 0, 4, 0, Route112_EventScript_150560, 0, 0, 0
	object_event 6, MAP_OBJ_GFX_VAR_1, 0, 27, 0, 30, 0, 3, 8, 0, 0, 0, 0, 0, 0, Route112_EventScript_15051C, FLAG_HIDE_GRUNTS_BLOCKING_CABLE_CAR, 0, 0
	object_event 7, MAP_OBJ_GFX_BERRY_TREE, 0, 27, 0, 6, 0, 0, 12, 0, 0, 0, 0, 24, 0, S_BerryTree, 0, 0, 0
	object_event 8, MAP_OBJ_GFX_BERRY_TREE, 0, 28, 0, 6, 0, 0, 12, 0, 0, 0, 0, 23, 0, S_BerryTree, 0, 0, 0
	object_event 9, MAP_OBJ_GFX_BERRY_TREE, 0, 29, 0, 6, 0, 0, 12, 0, 0, 0, 0, 22, 0, S_BerryTree, 0, 0, 0
	object_event 10, MAP_OBJ_GFX_BERRY_TREE, 0, 30, 0, 6, 0, 3, 12, 0, 0, 0, 0, 21, 0, S_BerryTree, 0, 0, 0
	object_event 11, MAP_OBJ_GFX_HIKER, 0, 8, 0, 50, 0, 3, 26, 48, 0, 0, 0, 0, 0, Route112_EventScript_150540, 0, 0, 0
	object_event 12, MAP_OBJ_GFX_ITEM_BALL, 0, 14, 0, 43, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route112_EventScript_1B14EF, FLAG_ITEM_ROUTE112_1, 0, 0

Route112_MapWarps:: @ 8382938
	warp_def 28, 27, 0, 0, MAP_ROUTE112_CABLE_CAR_STATION
	warp_def 29, 27, 0, 1, MAP_ROUTE112_CABLE_CAR_STATION
	warp_def 6, 46, 3, 0, MAP_JAGGED_PASS
	warp_def 7, 46, 3, 1, MAP_JAGGED_PASS
	warp_def 11, 36, 0, 0, MAP_FIERY_PATH
	warp_def 22, 10, 0, 1, MAP_FIERY_PATH

Route112_MapBGEvents:: @ 8382968
	bg_event 19, 44, 3, 0, 0, Route112_EventScript_15052E
	bg_event 22, 37, 0, 0, 0, Route112_EventScript_150525
	bg_event 4, 49, 0, 0, 0, Route112_EventScript_150537

Route112_MapEvents:: @ 838298C
	map_events Route112_MapObjects, Route112_MapWarps, 0x0, Route112_MapBGEvents
