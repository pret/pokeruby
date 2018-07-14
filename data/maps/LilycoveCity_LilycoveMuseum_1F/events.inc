LilycoveCity_LilycoveMuseum_1F_EventObjects:: @ 8389564
	object_event 1, EVENT_OBJ_GFX_BEAUTY, 0, 5, 12, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_15841C, 0
	object_event 2, EVENT_OBJ_GFX_GENTLEMAN, 0, 16, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_158425, FLAG_HIDE_LILYCOVE_MUSEUM_CURATOR
	object_event 3, EVENT_OBJ_GFX_SCHOOL_KID_M, 0, 13, 7, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_158558, 0
	object_event 4, EVENT_OBJ_GFX_ARTIST, 0, 13, 10, 3, MOVEMENT_TYPE_WANDER_LEFT_AND_RIGHT, 2, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_158561, 0
	object_event 5, EVENT_OBJ_GFX_LITTLE_BOY_1, 0, 2, 8, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_15856A, 0
	object_event 6, EVENT_OBJ_GFX_WOMAN_5, 0, 3, 8, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_158573, 0
	object_event 7, EVENT_OBJ_GFX_WOMAN_3, 0, 11, 3, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_15857C, FLAG_HIDE_LILYCOVE_MUSEUM_PAINTING_LADY
	object_event 8, EVENT_OBJ_GFX_ARTIST, 0, 19, 3, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_15858E, FLAG_HIDE_LILYCOVE_MUSEUM_PAINTER
	object_event 9, EVENT_OBJ_GFX_FAT_MAN, 0, 2, 2, 3, MOVEMENT_TYPE_WANDER_AROUND, 2, 2, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_1585A3, FLAG_HIDE_LILYCOVE_MUSEUM_VISITORS
	object_event 10, EVENT_OBJ_GFX_PSYCHIC_M, 0, 6, 2, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_158585, FLAG_HIDE_LILYCOVE_MUSEUM_PAINTING_MAN

LilycoveCity_LilycoveMuseum_1F_MapWarps:: @ 8389654
	warp_def 9, 13, 0, 3, MAP_LILYCOVE_CITY
	warp_def 10, 13, 0, 13, MAP_LILYCOVE_CITY
	warp_def 16, 1, 0, 0, MAP_LILYCOVE_CITY_LILYCOVE_MUSEUM_2F

LilycoveCity_LilycoveMuseum_1F_MapBGEvents:: @ 838966C
	bg_event 1, 1, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_1F_EventScript_158510
	bg_event 2, 1, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_1F_EventScript_158510
	bg_event 5, 1, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_1F_EventScript_158534
	bg_event 6, 1, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_1F_EventScript_158534
	bg_event 9, 1, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_1F_EventScript_158507
	bg_event 3, 6, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_1F_EventScript_158519
	bg_event 2, 6, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_1F_EventScript_158519
	bg_event 15, 12, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_1F_EventScript_15853D
	bg_event 11, 1, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_1F_EventScript_158507
	bg_event 6, 6, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_1F_EventScript_15852B
	bg_event 17, 9, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_1F_EventScript_15854F
	bg_event 19, 1, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_1F_EventScript_158522
	bg_event 20, 1, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_1F_EventScript_158522
	bg_event 18, 9, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_1F_EventScript_15854F
	bg_event 18, 11, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_1F_EventScript_158546
	bg_event 16, 9, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_LilycoveMuseum_1F_EventScript_15854F

LilycoveCity_LilycoveMuseum_1F_MapEvents:: @ 838972C
	map_events LilycoveCity_LilycoveMuseum_1F_EventObjects, LilycoveCity_LilycoveMuseum_1F_MapWarps, 0x0, LilycoveCity_LilycoveMuseum_1F_MapBGEvents
