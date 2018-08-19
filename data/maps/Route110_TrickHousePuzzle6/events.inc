Route110_TrickHousePuzzle6_EventObjects:: @ 8392A2C
	object_event 1, EVENT_OBJ_GFX_PICNICKER, 0, 10, 9, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 1, 2, Route110_TrickHousePuzzle6_EventScript_163107, 0
	object_event 2, EVENT_OBJ_GFX_MAN_6, 0, 14, 12, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 1, 2, Route110_TrickHousePuzzle6_EventScript_16311E, 0
	object_event 3, EVENT_OBJ_GFX_CAMPER, 0, 0, 3, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 1, 4, Route110_TrickHousePuzzle6_EventScript_163135, 0
	object_event 4, EVENT_OBJ_GFX_ITEM_BALL, 0, 8, 2, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, Route110_TrickHousePuzzle6_EventScript_1B1A9F, FLAG_ITEM_TRICK_HOUSE_PUZZLE_6_1

Route110_TrickHousePuzzle6_MapWarps:: @ 8392A8C
	warp_def 0, 21, 3, 2, MAP_ROUTE110_TRICK_HOUSE_ENTRANCE
	warp_def 1, 21, 3, 2, MAP_ROUTE110_TRICK_HOUSE_ENTRANCE
	warp_def 13, 1, 3, 0, MAP_ROUTE110_TRICK_HOUSE_END

Route110_TrickHousePuzzle6_MapBGEvents:: @ 8392AA4
	bg_event 13, 9, 3, BG_EVENT_PLAYER_FACING_ANY, Route110_TrickHousePuzzle6_EventScript_1630EA

Route110_TrickHousePuzzle6_MapEvents:: @ 8392AB0
	map_events Route110_TrickHousePuzzle6_EventObjects, Route110_TrickHousePuzzle6_MapWarps, 0x0, Route110_TrickHousePuzzle6_MapBGEvents
