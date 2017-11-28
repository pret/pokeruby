Route110_TrickHouseEntrance_MapObjects:: @ 8392140
	object_event 1, MAP_OBJ_GFX_MAN_1, 0, 6, 0, 2, 0, 3, 9, 0, 0, 0, 0, 0, 0, Route110_TrickHouseEntrance_EventScript_16121A, 872, 0, 0

Route110_TrickHouseEntrance_MapWarps:: @ 8392158
	warp_def 5, 7, 3, 1, MAP_ROUTE110
	warp_def 6, 7, 3, 1, MAP_ROUTE110
	warp_def 5, 2, 3, 0, MAP_ROUTE110_TRICK_HOUSE_PUZZLE1

Route110_TrickHouseEntrance_MapCoordEvents:: @ 8392170
	coord_event 4, 7, 3, 0, 0x40a5, 0, 0, Route110_TrickHouseEntrance_EventScript_1618B0
	coord_event 5, 6, 3, 0, 0x40a5, 0, 0, Route110_TrickHouseEntrance_EventScript_1618B0
	coord_event 6, 6, 3, 0, 0x40a5, 0, 0, Route110_TrickHouseEntrance_EventScript_1618B0
	coord_event 7, 7, 3, 0, 0x40a5, 0, 0, Route110_TrickHouseEntrance_EventScript_1618B0

Route110_TrickHouseEntrance_MapBGEvents:: @ 83921B0
	bg_event 5, 1, 0, 1, 0, Route110_TrickHouseEntrance_EventScript_16158A

Route110_TrickHouseEntrance_MapEvents:: @ 83921BC
	map_events Route110_TrickHouseEntrance_MapObjects, Route110_TrickHouseEntrance_MapWarps, Route110_TrickHouseEntrance_MapCoordEvents, Route110_TrickHouseEntrance_MapBGEvents
