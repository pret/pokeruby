Route119_WeatherInstitute_2F_EventObjects:: @ 8392E94
	object_event 1, EVENT_OBJ_GFX_VAR_1, 0, 15, 6, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 1, 4, Route119_WeatherInstitute_2F_EventScript_163CFC, FLAG_HIDE_EVIL_TEAM_WEATHER_INSTITUTE
	object_event 2, EVENT_OBJ_GFX_VAR_1, 0, 10, 8, 3, MOVEMENT_TYPE_FACE_DOWN_AND_UP, 0, 0, 1, 2, Route119_WeatherInstitute_2F_EventScript_163D13, FLAG_HIDE_EVIL_TEAM_WEATHER_INSTITUTE
	object_event 3, EVENT_OBJ_GFX_VAR_2, 0, 4, 6, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 1, 0, Route119_WeatherInstitute_2F_EventScript_163D2A, FLAG_HIDE_EVIL_TEAM_WEATHER_INSTITUTE
	object_event 4, EVENT_OBJ_GFX_MAN_5, 0, 0, 6, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, 0x0, FLAG_HIDE_WEATHER_INSTITUTE_WORKERS_2F
	object_event 5, EVENT_OBJ_GFX_SCIENTIST_1, 0, 18, 6, 3, MOVEMENT_TYPE_LOOK_AROUND, 2, 1, 0, 0, Route119_WeatherInstitute_2F_EventScript_163DCC, 0
	object_event 6, EVENT_OBJ_GFX_MAN_5, 0, 1, 7, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, 0x0, FLAG_HIDE_WEATHER_INSTITUTE_WORKERS_2F

Route119_WeatherInstitute_2F_MapWarps:: @ 8392F24
	warp_def 17, 1, 0, 2, MAP_ROUTE119_WEATHER_INSTITUTE_1F

Route119_WeatherInstitute_2F_MapEvents:: @ 8392F2C
	map_events Route119_WeatherInstitute_2F_EventObjects, Route119_WeatherInstitute_2F_MapWarps, 0x0, 0x0
