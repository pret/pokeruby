LilycoveCity_LilycoveMuseum_2F_MapObjects:: @ 8389740
	object_event 1, MAP_OBJ_GFX_GENTLEMAN, 0, 10, 0, 8, 0, 3, 7, 0, 0, 0, 0, 0, 0, LilycoveCity_LilycoveMuseum_2F_EventScript_1586D8, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_GIRL_2, 0, 19, 0, 10, 0, 3, 2, 17, 0, 0, 0, 0, 0, LilycoveCity_LilycoveMuseum_2F_EventScript_158805, 777, 0, 0
	object_event 3, MAP_OBJ_GFX_OLD_MAN_1, 0, 7, 0, 3, 0, 3, 2, 17, 0, 0, 0, 0, 0, LilycoveCity_LilycoveMuseum_2F_EventScript_15880E, 780, 0, 0
	object_event 4, MAP_OBJ_GFX_BOY_4, 0, 14, 0, 6, 0, 3, 2, 17, 0, 0, 0, 0, 0, LilycoveCity_LilycoveMuseum_2F_EventScript_158817, 780, 0, 0

LilycoveCity_LilycoveMuseum_2F_MapWarps:: @ 83897A0
	warp_def 13, 1, 0, 2, MAP_LILYCOVE_CITY_LILYCOVE_MUSEUM_1F

LilycoveCity_LilycoveMuseum_2F_MapBGEvents:: @ 83897A8
	bg_event 14, 10, 0, 0, 0, LilycoveCity_LilycoveMuseum_2F_EventScript_15879D
	bg_event 15, 10, 0, 0, 0, LilycoveCity_LilycoveMuseum_2F_EventScript_15879D
	bg_event 3, 6, 0, 0, 0, LilycoveCity_LilycoveMuseum_2F_EventScript_1587B0
	bg_event 2, 6, 0, 0, 0, LilycoveCity_LilycoveMuseum_2F_EventScript_1587B0
	bg_event 10, 6, 0, 0, 0, LilycoveCity_LilycoveMuseum_2F_EventScript_1587C3
	bg_event 11, 6, 0, 0, 0, LilycoveCity_LilycoveMuseum_2F_EventScript_1587C3
	bg_event 19, 6, 0, 0, 0, LilycoveCity_LilycoveMuseum_2F_EventScript_1587D6
	bg_event 18, 6, 0, 0, 0, LilycoveCity_LilycoveMuseum_2F_EventScript_1587D6
	bg_event 6, 10, 0, 0, 0, LilycoveCity_LilycoveMuseum_2F_EventScript_1587E9
	bg_event 7, 10, 0, 0, 0, LilycoveCity_LilycoveMuseum_2F_EventScript_1587E9
	bg_event 11, 2, 0, 0, 0, LilycoveCity_LilycoveMuseum_2F_EventScript_15853D
	bg_event 15, 2, 0, 0, 0, LilycoveCity_LilycoveMuseum_2F_EventScript_15853D

LilycoveCity_LilycoveMuseum_2F_MapEvents:: @ 8389838
	map_events LilycoveCity_LilycoveMuseum_2F_MapObjects, LilycoveCity_LilycoveMuseum_2F_MapWarps, 0x0, LilycoveCity_LilycoveMuseum_2F_MapBGEvents
