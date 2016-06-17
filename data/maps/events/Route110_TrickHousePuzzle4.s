Route110_TrickHousePuzzle4_MapObjects:: @ 83926FC
	object_event 1, MAP_OBJ_GFX_GIRL_3, 0, 12, 0, 8, 0, 3, 9, 0, 0, 1, 0, 1, 0, Route110_TrickHousePuzzle4_EventScript_16276B, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_GIRL_3, 0, 10, 0, 4, 0, 3, 10, 0, 0, 1, 0, 1, 0, Route110_TrickHousePuzzle4_EventScript_162799, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_BLACK_BELT, 0, 7, 0, 4, 0, 3, 9, 0, 0, 1, 0, 2, 0, Route110_TrickHousePuzzle4_EventScript_162782, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_ITEM_BALL, 0, 4, 0, 4, 0, 0, 1, 0, 0, 0, 0, 0, 0, Route110_TrickHousePuzzle4_EventScript_1B1A92, 1065, 0, 0
	object_event 5, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 13, 0, 3, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route110_TrickHousePuzzle4_EventScript_1B0FCB, 17, 0, 0
	object_event 6, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 6, 0, 14, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route110_TrickHousePuzzle4_EventScript_1B0FCB, 18, 0, 0
	object_event 7, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 2, 0, 12, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route110_TrickHousePuzzle4_EventScript_1B0FCB, 19, 0, 0
	object_event 8, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 3, 0, 9, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route110_TrickHousePuzzle4_EventScript_1B0FCB, 20, 0, 0
	object_event 9, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 12, 0, 2, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route110_TrickHousePuzzle4_EventScript_1B0FCB, 21, 0, 0
	object_event 10, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 8, 0, 8, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route110_TrickHousePuzzle4_EventScript_1B0FCB, 22, 0, 0
	object_event 11, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 9, 0, 7, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route110_TrickHousePuzzle4_EventScript_1B0FCB, 23, 0, 0
	object_event 12, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 11, 0, 13, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route110_TrickHousePuzzle4_EventScript_1B0FCB, 24, 0, 0
	object_event 13, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 14, 0, 2, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route110_TrickHousePuzzle4_EventScript_1B0FCB, 25, 0, 0
	object_event 14, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 4, 0, 14, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route110_TrickHousePuzzle4_EventScript_1B0FCB, 26, 0, 0
	object_event 15, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 14, 0, 9, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route110_TrickHousePuzzle4_EventScript_1B0FCB, 27, 0, 0

Route110_TrickHousePuzzle4_MapWarps:: @ 8392864
	warp_def 0, 21, 3, 2, Route110_TrickHouseEntrance
	warp_def 1, 21, 3, 2, Route110_TrickHouseEntrance
	warp_def 13, 1, 3, 0, Route110_TrickHouseEnd

Route110_TrickHousePuzzle4_MapBGEvents:: @ 839287C
	bg_event 0, 5, 3, 0, 0, Route110_TrickHousePuzzle4_EventScript_16274E

Route110_TrickHousePuzzle4_MapEvents:: @ 8392888
	map_events Route110_TrickHousePuzzle4_MapObjects, Route110_TrickHousePuzzle4_MapWarps, 0x0, Route110_TrickHousePuzzle4_MapBGEvents

