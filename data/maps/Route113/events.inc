Route113_EventObjects:: @ 83829A0
	object_event 1, EVENT_OBJ_GFX_LITTLE_BOY_1, 0, 66, 12, 3, MOVEMENT_TYPE_WANDER_LEFT_AND_RIGHT, 1, 0, 0, 0, Route113_EventScript_15060E, 0
	object_event 2, EVENT_OBJ_GFX_GENTLEMAN, 0, 36, 10, 3, MOVEMENT_TYPE_WANDER_UP_AND_DOWN, 0, 1, 0, 0, Route113_EventScript_150605, 0
	object_event 3, EVENT_OBJ_GFX_YOUNGSTER, 0, 62, 8, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 1, 3, Route113_EventScript_15063B, 0
	object_event 4, EVENT_OBJ_GFX_YOUNGSTER, 0, 21, 11, 3, MOVEMENT_TYPE_FACE_DOWN_AND_LEFT, 0, 0, 1, 3, Route113_EventScript_150652, 0
	object_event 5, EVENT_OBJ_GFX_WOMAN_7, 0, 51, 11, 3, MOVEMENT_TYPE_ROTATE_COUNTERCLOCKWISE, 0, 0, 1, 2, Route113_EventScript_150669, 0
	object_event 6, EVENT_OBJ_GFX_ITEM_BALL, 0, 53, 7, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, Route113_EventScript_1B14FC, FLAG_ITEM_ROUTE113_1
	object_event 7, EVENT_OBJ_GFX_ITEM_BALL, 0, 78, 5, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, Route113_EventScript_1B1509, FLAG_ITEM_ROUTE113_2
	object_event 8, EVENT_OBJ_GFX_LITTLE_BOY_1, 0, 66, 3, 3, MOVEMENT_TYPE_HIDDEN, 0, 0, 3, 1, Route113_EventScript_1506A7, 0
	object_event 9, EVENT_OBJ_GFX_LITTLE_BOY_1, 0, 29, 6, 3, MOVEMENT_TYPE_HIDDEN, 0, 0, 3, 1, Route113_EventScript_1506E5, 0
	object_event 10, EVENT_OBJ_GFX_LITTLE_GIRL_1, 0, 45, 6, 3, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 1, 0, Route113_EventScript_1506FC, 0
	object_event 11, EVENT_OBJ_GFX_LITTLE_GIRL_1, 0, 46, 6, 3, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 1, 0, Route113_EventScript_150717, 0

Route113_MapWarps:: @ 8382AA8
	warp_def 33, 5, 0, 0, MAP_ROUTE113_GLASS_WORKSHOP

Route113_MapCoordEvents:: @ 8382AB0
	coord_weather_event 19, 11, 3, COORD_EVENT_WEATHER_ASH
	coord_weather_event 19, 10, 3, COORD_EVENT_WEATHER_ASH
	coord_weather_event 19, 12, 3, COORD_EVENT_WEATHER_ASH
	coord_weather_event 19, 13, 3, COORD_EVENT_WEATHER_ASH
	coord_weather_event 87, 9, 3, COORD_EVENT_WEATHER_ASH
	coord_weather_event 86, 10, 3, COORD_EVENT_WEATHER_ASH
	coord_weather_event 86, 11, 3, COORD_EVENT_WEATHER_ASH
	coord_weather_event 14, 10, 3, COORD_EVENT_WEATHER_SUNNY
	coord_weather_event 14, 11, 3, COORD_EVENT_WEATHER_SUNNY
	coord_weather_event 14, 12, 3, COORD_EVENT_WEATHER_SUNNY
	coord_weather_event 14, 13, 3, COORD_EVENT_WEATHER_SUNNY
	coord_weather_event 94, 8, 3, COORD_EVENT_WEATHER_SUNNY
	coord_weather_event 94, 9, 3, COORD_EVENT_WEATHER_SUNNY
	coord_weather_event 94, 10, 3, COORD_EVENT_WEATHER_SUNNY
	coord_weather_event 94, 11, 0, COORD_EVENT_WEATHER_SUNNY
	coord_weather_event 19, 14, 3, COORD_EVENT_WEATHER_ASH
	coord_weather_event 88, 8, 3, COORD_EVENT_WEATHER_ASH
	coord_weather_event 88, 6, 3, COORD_EVENT_WEATHER_ASH
	coord_weather_event 88, 7, 3, COORD_EVENT_WEATHER_ASH

Route113_MapBGEvents:: @ 8382BE0
	bg_event 85, 6, 0, BG_EVENT_PLAYER_FACING_ANY, Route113_EventScript_150617
	bg_event 11, 9, 0, BG_EVENT_PLAYER_FACING_ANY, Route113_EventScript_150620
	bg_event 58, 4, 3, BG_EVENT_PLAYER_FACING_ANY, Route113_EventScript_150632
	bg_event 31, 5, 0, BG_EVENT_PLAYER_FACING_ANY, Route113_EventScript_150629
	bg_secret_base_event 49, 8, 0, SECRET_BASE_RED_CAVE1_3
	bg_hidden_item_event 72, 4, 3, ITEM_ETHER, FLAG_HIDDEN_ITEM_3
	bg_hidden_item_event 22, 5, 3, ITEM_TM32_DOUBLE_TEAM, FLAG_HIDDEN_ITEM_1E

Route113_MapEvents:: @ 8382C34
	map_events Route113_EventObjects, Route113_MapWarps, Route113_MapCoordEvents, Route113_MapBGEvents
