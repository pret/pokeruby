Route110_TrickHousePuzzle4_EventObjects:: @ 83926FC
	object_event 1, EVENT_OBJ_GFX_GIRL_3, 0, 12, 0, 8, 0, 3, 9, 0, 0, 1, 0, 1, 0, Route110_TrickHousePuzzle4_EventScript_16276B, 0, 0, 0
	object_event 2, EVENT_OBJ_GFX_GIRL_3, 0, 10, 0, 4, 0, 3, 10, 0, 0, 1, 0, 1, 0, Route110_TrickHousePuzzle4_EventScript_162799, 0, 0, 0
	object_event 3, EVENT_OBJ_GFX_BLACK_BELT, 0, 7, 0, 4, 0, 3, 9, 0, 0, 1, 0, 2, 0, Route110_TrickHousePuzzle4_EventScript_162782, 0, 0, 0
	object_event 4, EVENT_OBJ_GFX_ITEM_BALL, 0, 4, 0, 4, 0, 0, 1, 0, 0, 0, 0, 0, 0, Route110_TrickHousePuzzle4_EventScript_1B1A92, FLAG_ITEM_TRICK_HOUSE_PUZZLE_4_1, 0, 0
	object_event 5, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 13, 0, 3, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_11, 0, 0
	object_event 6, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 6, 0, 14, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_12, 0, 0
	object_event 7, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 2, 0, 12, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_13, 0, 0
	object_event 8, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 3, 0, 9, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_14, 0, 0
	object_event 9, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 12, 0, 2, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_15, 0, 0
	object_event 10, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 8, 0, 8, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_16, 0, 0
	object_event 11, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 9, 0, 7, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_17, 0, 0
	object_event 12, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 11, 0, 13, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_18, 0, 0
	object_event 13, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 14, 0, 2, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_19, 0, 0
	object_event 14, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 4, 0, 14, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_1A, 0, 0
	object_event 15, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 14, 0, 9, 0, 3, 1, 0, 0, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_1B, 0, 0

Route110_TrickHousePuzzle4_MapWarps:: @ 8392864
	warp_def 0, 21, 3, 2, MAP_ROUTE110_TRICK_HOUSE_ENTRANCE
	warp_def 1, 21, 3, 2, MAP_ROUTE110_TRICK_HOUSE_ENTRANCE
	warp_def 13, 1, 3, 0, MAP_ROUTE110_TRICK_HOUSE_END

Route110_TrickHousePuzzle4_MapBGEvents:: @ 839287C
	bg_event 0, 5, 3, 0, 0, Route110_TrickHousePuzzle4_EventScript_16274E

Route110_TrickHousePuzzle4_MapEvents:: @ 8392888
	map_events Route110_TrickHousePuzzle4_EventObjects, Route110_TrickHousePuzzle4_MapWarps, 0x0, Route110_TrickHousePuzzle4_MapBGEvents
