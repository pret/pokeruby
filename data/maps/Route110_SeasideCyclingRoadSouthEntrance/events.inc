Route110_SeasideCyclingRoadSouthEntrance_EventObjects:: @ 8392C40
	object_event 1, EVENT_OBJ_GFX_MART_EMPLOYEE, 0, 7, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, Route110_SeasideCyclingRoadSouthEntrance_EventScript_16347F, 0

Route110_SeasideCyclingRoadSouthEntrance_MapWarps:: @ 8392C58
	warp_def 1, 5, 0, 4, MAP_ROUTE110
	warp_def 2, 5, 0, 4, MAP_ROUTE110
	warp_def 12, 5, 0, 5, MAP_ROUTE110
	warp_def 13, 5, 0, 5, MAP_ROUTE110

Route110_SeasideCyclingRoadSouthEntrance_MapCoordEvents:: @ 8392C78
	coord_event 7, 4, 3, VAR_TEMP_1, 0, Route110_SeasideCyclingRoadSouthEntrance_EventScript_16348B
	coord_event 5, 4, 3, VAR_TEMP_1, 1, Route110_SeasideCyclingRoadSouthEntrance_EventScript_1634BD

Route110_SeasideCyclingRoadSouthEntrance_MapEvents:: @ 8392C98
	map_events Route110_SeasideCyclingRoadSouthEntrance_EventObjects, Route110_SeasideCyclingRoadSouthEntrance_MapWarps, Route110_SeasideCyclingRoadSouthEntrance_MapCoordEvents, 0x0
