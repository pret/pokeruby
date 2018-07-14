LilycoveCity_LilycoveMuseum_2F_EventObjects:: @ 8389740
	object_event 1, EVENT_OBJ_GFX_GENTLEMAN, 0, 10, 8, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, LilycoveCity_LilycoveMuseum_2F_EventScript_1586D8, 0
	object_event 2, EVENT_OBJ_GFX_GIRL_2, 0, 19, 10, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, LilycoveCity_LilycoveMuseum_2F_EventScript_158805, FLAG_HIDE_LILYCOVE_MUSEUM_PAINTING_GIRL
	object_event 3, EVENT_OBJ_GFX_OLD_MAN_1, 0, 7, 3, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, LilycoveCity_LilycoveMuseum_2F_EventScript_15880E, FLAG_HIDE_LILYCOVE_MUSEUM_VISITORS
	object_event 4, EVENT_OBJ_GFX_BOY_4, 0, 14, 6, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, LilycoveCity_LilycoveMuseum_2F_EventScript_158817, FLAG_HIDE_LILYCOVE_MUSEUM_VISITORS

LilycoveCity_LilycoveMuseum_2F_MapWarps:: @ 83897A0
	warp_def 13, 1, 0, 2, MAP_LILYCOVE_CITY_LILYCOVE_MUSEUM_1F

LilycoveCity_LilycoveMuseum_2F_MapBGEvents:: @ 83897A8
	bg_event 14, 10, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_2F_EventScript_15879D
	bg_event 15, 10, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_2F_EventScript_15879D
	bg_event 3, 6, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_2F_EventScript_1587B0
	bg_event 2, 6, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_2F_EventScript_1587B0
	bg_event 10, 6, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_2F_EventScript_1587C3
	bg_event 11, 6, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_2F_EventScript_1587C3
	bg_event 19, 6, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_2F_EventScript_1587D6
	bg_event 18, 6, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_2F_EventScript_1587D6
	bg_event 6, 10, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_2F_EventScript_1587E9
	bg_event 7, 10, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_2F_EventScript_1587E9
	bg_event 11, 2, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_2F_EventScript_15853D
	bg_event 15, 2, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_2F_EventScript_15853D

LilycoveCity_LilycoveMuseum_2F_MapEvents:: @ 8389838
	map_events LilycoveCity_LilycoveMuseum_2F_EventObjects, LilycoveCity_LilycoveMuseum_2F_MapWarps, 0x0, LilycoveCity_LilycoveMuseum_2F_MapBGEvents
