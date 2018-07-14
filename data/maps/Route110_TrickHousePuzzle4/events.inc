Route110_TrickHousePuzzle4_EventObjects:: @ 83926FC
	object_event 1, EVENT_OBJ_GFX_GIRL_3, 0, 12, 8, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 1, 1, Route110_TrickHousePuzzle4_EventScript_16276B, 0
	object_event 2, EVENT_OBJ_GFX_GIRL_3, 0, 10, 4, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 1, 1, Route110_TrickHousePuzzle4_EventScript_162799, 0
	object_event 3, EVENT_OBJ_GFX_BLACK_BELT, 0, 7, 4, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 1, 2, Route110_TrickHousePuzzle4_EventScript_162782, 0
	object_event 4, EVENT_OBJ_GFX_ITEM_BALL, 0, 4, 4, 0, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, Route110_TrickHousePuzzle4_EventScript_1B1A92, FLAG_ITEM_TRICK_HOUSE_PUZZLE_4_1
	object_event 5, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 13, 3, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_11
	object_event 6, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 6, 14, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_12
	object_event 7, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 2, 12, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_13
	object_event 8, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 3, 9, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_14
	object_event 9, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 12, 2, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_15
	object_event 10, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 8, 8, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_16
	object_event 11, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 9, 7, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_17
	object_event 12, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 11, 13, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_18
	object_event 13, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 14, 2, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_19
	object_event 14, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 4, 14, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_1A
	object_event 15, EVENT_OBJ_GFX_PUSHABLE_BOULDER, 0, 14, 9, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_PushableBoulder, FLAG_TEMP_1B

Route110_TrickHousePuzzle4_MapWarps:: @ 8392864
	warp_def 0, 21, 3, 2, MAP_ROUTE110_TRICK_HOUSE_ENTRANCE
	warp_def 1, 21, 3, 2, MAP_ROUTE110_TRICK_HOUSE_ENTRANCE
	warp_def 13, 1, 3, 0, MAP_ROUTE110_TRICK_HOUSE_END

Route110_TrickHousePuzzle4_MapBGEvents:: @ 839287C
	bg_event 0, 5, 3, BG_EVENT_PLAYER_FACING_ANY, Route110_TrickHousePuzzle4_EventScript_16274E

Route110_TrickHousePuzzle4_MapEvents:: @ 8392888
	map_events Route110_TrickHousePuzzle4_EventObjects, Route110_TrickHousePuzzle4_MapWarps, 0x0, Route110_TrickHousePuzzle4_MapBGEvents
