Route119_WeatherInstitute_1F_MapObjects:: @ 8392DC0
	object_event 1, 241, 0, 15, 0, 3, 0, 3, 9, 0, 0, 1, 0, 3, 0, Route119_WeatherInstitute_1F_EventScript_163C94, 890, 0, 0
	object_event 2, 242, 0, 10, 0, 5, 0, 3, 8, 0, 0, 1, 0, 2, 0, Route119_WeatherInstitute_1F_EventScript_163CAB, 890, 0, 0
	object_event 3, MAP_OBJ_GFX_MAN_5, 0, 5, 0, 4, 0, 3, 8, 0, 0, 0, 0, 0, 0, Route119_WeatherInstitute_1F_EventScript_163C7A, 892, 0, 0
	object_event 4, MAP_OBJ_GFX_MAN_5, 0, 2, 0, 11, 0, 3, 1, 1, 0, 0, 0, 0, 0, Route119_WeatherInstitute_1F_EventScript_163C71, 892, 0, 0
	object_event 5, MAP_OBJ_GFX_LITTLE_BOY_1, 0, 14, 0, 11, 0, 3, 2, 17, 0, 0, 0, 0, 0, Route119_WeatherInstitute_1F_EventScript_163C4D, 0, 0, 0

Route119_WeatherInstitute_1F_MapWarps:: @ 8392E38
	warp_def 9, 12, 0, 0, Route119
	warp_def 10, 12, 0, 0, Route119
	warp_def 17, 1, 0, 0, Route119_WeatherInstitute_2F

Route119_WeatherInstitute_1F_MapBGEvents:: @ 8392E50
	bg_event 1, 2, 0, 0, 0, Route119_WeatherInstitute_1F_EventScript_163C83
	bg_event 1, 3, 0, 0, 0, Route119_WeatherInstitute_1F_EventScript_163C83
	bg_event 0, 2, 0, 0, 0, Route119_WeatherInstitute_1F_EventScript_163C83
	bg_event 0, 3, 0, 0, 0, Route119_WeatherInstitute_1F_EventScript_163C83

Route119_WeatherInstitute_1F_MapEvents:: @ 8392E80
	map_events Route119_WeatherInstitute_1F_MapObjects, Route119_WeatherInstitute_1F_MapWarps, 0x0, Route119_WeatherInstitute_1F_MapBGEvents
