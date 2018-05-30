Route119_WeatherInstitute_2F_EventObjects:: @ 8392E94
	object_event 1, EVENT_OBJ_GFX_VAR_1, 0, 15, 0, 6, 0, 3, 10, 0, 0, 1, 0, 4, 0, Route119_WeatherInstitute_2F_EventScript_163CFC, FLAG_HIDE_EVIL_TEAM_WEATHER_INSTITUTE, 0, 0
	object_event 2, EVENT_OBJ_GFX_VAR_1, 0, 10, 0, 8, 0, 3, 13, 0, 0, 1, 0, 2, 0, Route119_WeatherInstitute_2F_EventScript_163D13, FLAG_HIDE_EVIL_TEAM_WEATHER_INSTITUTE, 0, 0
	object_event 3, EVENT_OBJ_GFX_VAR_2, 0, 4, 0, 6, 0, 3, 10, 0, 0, 1, 0, 0, 0, Route119_WeatherInstitute_2F_EventScript_163D2A, FLAG_HIDE_EVIL_TEAM_WEATHER_INSTITUTE, 0, 0
	object_event 4, EVENT_OBJ_GFX_MAN_5, 0, 0, 0, 6, 0, 3, 10, 0, 0, 0, 0, 0, 0, 0x0, FLAG_HIDE_WEATHER_INSTITUTE_WORKERS_2F, 0, 0
	object_event 5, EVENT_OBJ_GFX_SCIENTIST_1, 0, 18, 0, 6, 0, 3, 1, 18, 0, 0, 0, 0, 0, Route119_WeatherInstitute_2F_EventScript_163DCC, 0, 0, 0
	object_event 6, EVENT_OBJ_GFX_MAN_5, 0, 1, 0, 7, 0, 3, 10, 0, 0, 0, 0, 0, 0, 0x0, FLAG_HIDE_WEATHER_INSTITUTE_WORKERS_2F, 0, 0

Route119_WeatherInstitute_2F_MapWarps:: @ 8392F24
	warp_def 17, 1, 0, 2, MAP_ROUTE119_WEATHER_INSTITUTE_1F

Route119_WeatherInstitute_2F_MapEvents:: @ 8392F2C
	map_events Route119_WeatherInstitute_2F_EventObjects, Route119_WeatherInstitute_2F_MapWarps, 0x0, 0x0
