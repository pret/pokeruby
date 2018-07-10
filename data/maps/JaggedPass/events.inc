JaggedPass_EventObjects:: @ 838C61C
	object_event 1, EVENT_OBJ_GFX_HIKER, 0, 8, 18, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 1, 3, JaggedPass_EventScript_15D285, 0
	object_event 2, EVENT_OBJ_GFX_CAMPER, 0, 16, 22, 3, MOVEMENT_TYPE_FACE_LEFT_AND_RIGHT, 0, 0, 1, 2, JaggedPass_EventScript_15D2DA, 0
	object_event 3, EVENT_OBJ_GFX_ITEM_BALL, 0, 23, 24, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, JaggedPass_EventScript_1B17D4, FLAG_ITEM_JAGGED_PASS_1
	object_event 4, EVENT_OBJ_GFX_PICNICKER, 0, 13, 35, 3, MOVEMENT_TYPE_FACE_UP_AND_LEFT, 1, 1, 1, 3, JaggedPass_EventScript_15D29C, 0

JaggedPass_MapWarps:: @ 838C67C
	warp_def 14, 40, 3, 2, MAP_ROUTE112
	warp_def 15, 40, 3, 3, MAP_ROUTE112
	warp_def 13, 5, 3, 2, MAP_MT_CHIMNEY
	warp_def 14, 5, 3, 3, MAP_MT_CHIMNEY

JaggedPass_MapCoordEvents:: @ 838C69C
	coord_weather_event 13, 15, 3, COORD_EVENT_WEATHER_SUNNY
	coord_weather_event 21, 12, 3, COORD_EVENT_WEATHER_ASH
	coord_weather_event 14, 15, 3, COORD_EVENT_WEATHER_SUNNY
	coord_weather_event 18, 17, 3, COORD_EVENT_WEATHER_SUNNY
	coord_weather_event 22, 19, 3, COORD_EVENT_WEATHER_SUNNY

JaggedPass_MapBGEvents:: @ 838C6EC
	bg_hidden_item_event 8, 10, 3, ITEM_FULL_HEAL, FLAG_HIDDEN_ITEM_4D
	bg_hidden_item_event 7, 29, 3, ITEM_GREAT_BALL, FLAG_HIDDEN_ITEM_4C

JaggedPass_MapEvents:: @ 838C704
	map_events JaggedPass_EventObjects, JaggedPass_MapWarps, JaggedPass_MapCoordEvents, JaggedPass_MapBGEvents
