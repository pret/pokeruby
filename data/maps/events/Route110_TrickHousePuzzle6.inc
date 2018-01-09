Route110_TrickHousePuzzle6_MapObjects:: @ 8392A2C
	object_event 1, MAP_OBJ_GFX_PICNICKER, 0, 10, 0, 9, 0, 3, 9, 0, 0, 1, 0, 2, 0, Route110_TrickHousePuzzle6_EventScript_163107, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_MAN_6, 0, 14, 0, 12, 0, 3, 9, 0, 0, 1, 0, 2, 0, Route110_TrickHousePuzzle6_EventScript_16311E, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_CAMPER, 0, 0, 0, 3, 0, 3, 10, 0, 0, 1, 0, 4, 0, Route110_TrickHousePuzzle6_EventScript_163135, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_ITEM_BALL, 0, 8, 0, 2, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route110_TrickHousePuzzle6_EventScript_1B1A9F, FLAG_ITEM_TRICK_HOUSE_PUZZLE_6_1, 0, 0

Route110_TrickHousePuzzle6_MapWarps:: @ 8392A8C
	warp_def 0, 21, 3, 2, MAP_ROUTE110_TRICK_HOUSE_ENTRANCE
	warp_def 1, 21, 3, 2, MAP_ROUTE110_TRICK_HOUSE_ENTRANCE
	warp_def 13, 1, 3, 0, MAP_ROUTE110_TRICK_HOUSE_END

Route110_TrickHousePuzzle6_MapBGEvents:: @ 8392AA4
	bg_event 13, 9, 3, 0, 0, Route110_TrickHousePuzzle6_EventScript_1630EA

Route110_TrickHousePuzzle6_MapEvents:: @ 8392AB0
	map_events Route110_TrickHousePuzzle6_MapObjects, Route110_TrickHousePuzzle6_MapWarps, 0x0, Route110_TrickHousePuzzle6_MapBGEvents
