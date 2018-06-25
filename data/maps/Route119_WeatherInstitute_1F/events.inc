Route119_WeatherInstitute_1F_EventObjects:: @ 8392DC0
	object_event 1, EVENT_OBJ_GFX_VAR_1, 0, 15, 3, 3, 9, 0, 0, 1, 3, Route119_WeatherInstitute_1F_EventScript_163C94, FLAG_HIDE_EVIL_TEAM_WEATHER_INSTITUTE
	object_event 2, EVENT_OBJ_GFX_VAR_2, 0, 10, 5, 3, 8, 0, 0, 1, 2, Route119_WeatherInstitute_1F_EventScript_163CAB, FLAG_HIDE_EVIL_TEAM_WEATHER_INSTITUTE
	object_event 3, EVENT_OBJ_GFX_MAN_5, 0, 5, 4, 3, 8, 0, 0, 0, 0, Route119_WeatherInstitute_1F_EventScript_163C7A, FLAG_HIDE_WEATHER_INSTITUTE_WORKERS_1F
	object_event 4, EVENT_OBJ_GFX_MAN_5, 0, 2, 11, 3, 1, 1, 0, 0, 0, Route119_WeatherInstitute_1F_EventScript_163C71, FLAG_HIDE_WEATHER_INSTITUTE_WORKERS_1F
	object_event 5, EVENT_OBJ_GFX_LITTLE_BOY_1, 0, 14, 11, 3, 2, 1, 1, 0, 0, Route119_WeatherInstitute_1F_EventScript_163C4D, 0

Route119_WeatherInstitute_1F_MapWarps:: @ 8392E38
	warp_def 9, 12, 0, 0, MAP_ROUTE119
	warp_def 10, 12, 0, 0, MAP_ROUTE119
	warp_def 17, 1, 0, 0, MAP_ROUTE119_WEATHER_INSTITUTE_2F

Route119_WeatherInstitute_1F_MapBGEvents:: @ 8392E50
	bg_event 1, 2, 0, 0, 0, Route119_WeatherInstitute_1F_EventScript_163C83
	bg_event 1, 3, 0, 0, 0, Route119_WeatherInstitute_1F_EventScript_163C83
	bg_event 0, 2, 0, 0, 0, Route119_WeatherInstitute_1F_EventScript_163C83
	bg_event 0, 3, 0, 0, 0, Route119_WeatherInstitute_1F_EventScript_163C83

Route119_WeatherInstitute_1F_MapEvents:: @ 8392E80
	map_events Route119_WeatherInstitute_1F_EventObjects, Route119_WeatherInstitute_1F_MapWarps, 0x0, Route119_WeatherInstitute_1F_MapBGEvents
