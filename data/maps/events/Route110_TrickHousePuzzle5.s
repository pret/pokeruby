Route110_TrickHousePuzzle5_MapObjects:: @ 839289C
	object_event 1, MAP_OBJ_GFX_MAN_1, 0, 9, 0, 19, 0, 3, 9, 0, 0, 0, 0, 0, 0, Route110_TrickHousePuzzle5_EventScript_1627F2, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_MAN_1, 0, 5, 0, 14, 0, 3, 10, 0, 0, 0, 0, 0, 0, Route110_TrickHousePuzzle5_EventScript_162813, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_MAN_1, 0, 12, 0, 10, 0, 3, 9, 0, 0, 0, 0, 0, 0, Route110_TrickHousePuzzle5_EventScript_162834, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_MAN_1, 0, 12, 0, 5, 0, 3, 9, 0, 0, 0, 0, 0, 0, Route110_TrickHousePuzzle5_EventScript_162855, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_MAN_1, 0, 1, 0, 6, 0, 3, 10, 0, 0, 0, 0, 0, 0, Route110_TrickHousePuzzle5_EventScript_162876, 0, 0, 0

Route110_TrickHousePuzzle5_MapWarps:: @ 8392914
	warp_def 0, 21, 3, 2, Route110_TrickHouseEntrance
	warp_def 1, 21, 3, 2, Route110_TrickHouseEntrance
	warp_def 13, 1, 3, 0, Route110_TrickHouseEnd

Route110_TrickHousePuzzle5_MapCoordEvents:: @ 839292C
	coord_event 8, 19, 3, 0, 0x4001, 0, 0, Route110_TrickHousePuzzle5_EventScript_162897
	coord_event 7, 19, 3, 0, 0x4001, 0, 0, Route110_TrickHousePuzzle5_EventScript_1628A3
	coord_event 6, 19, 3, 0, 0x4001, 0, 0, Route110_TrickHousePuzzle5_EventScript_1628AF
	coord_event 5, 19, 3, 0, 0x4001, 0, 0, Route110_TrickHousePuzzle5_EventScript_1628BB
	coord_event 6, 14, 3, 0, 0x4002, 0, 0, Route110_TrickHousePuzzle5_EventScript_1628C7
	coord_event 7, 14, 3, 0, 0x4002, 0, 0, Route110_TrickHousePuzzle5_EventScript_1628D3
	coord_event 11, 10, 3, 0, 0x4003, 0, 0, Route110_TrickHousePuzzle5_EventScript_1628DF
	coord_event 10, 10, 3, 0, 0x4003, 0, 0, Route110_TrickHousePuzzle5_EventScript_1628EB
	coord_event 9, 10, 3, 0, 0x4003, 0, 0, Route110_TrickHousePuzzle5_EventScript_1628F7
	coord_event 11, 5, 3, 0, 0x4004, 0, 0, Route110_TrickHousePuzzle5_EventScript_162903
	coord_event 10, 5, 3, 0, 0x4004, 0, 0, Route110_TrickHousePuzzle5_EventScript_16290F
	coord_event 2, 6, 3, 0, 0x4005, 0, 0, Route110_TrickHousePuzzle5_EventScript_16291B
	coord_event 3, 6, 3, 0, 0x4005, 0, 0, Route110_TrickHousePuzzle5_EventScript_162927
	coord_event 4, 6, 3, 0, 0x4005, 0, 0, Route110_TrickHousePuzzle5_EventScript_162933

Route110_TrickHousePuzzle5_MapBGEvents:: @ 8392A0C
	bg_event 2, 9, 0, 0, 0, Route110_TrickHousePuzzle5_EventScript_1627D5

Route110_TrickHousePuzzle5_MapEvents:: @ 8392A18
	map_events Route110_TrickHousePuzzle5_MapObjects, Route110_TrickHousePuzzle5_MapWarps, Route110_TrickHousePuzzle5_MapCoordEvents, Route110_TrickHousePuzzle5_MapBGEvents

