Route110_SeasideCyclingRoadNorthEntrance_EventObjects:: @ 8392CAC
	object_event 1, EVENT_OBJ_GFX_MART_EMPLOYEE, 0, 7, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, Route110_SeasideCyclingRoadNorthEntrance_EventScript_1634EB, 0

Route110_SeasideCyclingRoadNorthEntrance_MapWarps:: @ 8392CC4
	warp_def 1, 5, 0, 2, MAP_ROUTE110
	warp_def 2, 5, 0, 2, MAP_ROUTE110
	warp_def 12, 5, 0, 3, MAP_ROUTE110
	warp_def 13, 5, 0, 3, MAP_ROUTE110

Route110_SeasideCyclingRoadNorthEntrance_MapCoordEvents:: @ 8392CE4
	coord_event 7, 4, 3, VAR_TEMP_1, 0, Route110_SeasideCyclingRoadNorthEntrance_EventScript_1634F7
	coord_event 5, 4, 3, VAR_TEMP_1, 1, Route110_SeasideCyclingRoadNorthEntrance_EventScript_16353A

Route110_SeasideCyclingRoadNorthEntrance_MapEvents:: @ 8392D04
	map_events Route110_SeasideCyclingRoadNorthEntrance_EventObjects, Route110_SeasideCyclingRoadNorthEntrance_MapWarps, Route110_SeasideCyclingRoadNorthEntrance_MapCoordEvents, 0x0
