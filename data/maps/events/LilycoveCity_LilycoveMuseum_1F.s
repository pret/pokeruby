LilycoveCity_LilycoveMuseum_1F_MapObjects:: @ 8389564
	object_event 1, MAP_OBJ_GFX_BEAUTY, 0, 5, 0, 12, 0, 3, 10, 0, 0, 0, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_15841C, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_GENTLEMAN, 0, 16, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_158425, 775, 0, 0
	object_event 3, MAP_OBJ_GFX_SCHOOL_KID_M, 0, 13, 0, 7, 0, 3, 10, 0, 0, 0, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_158558, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_ARTIST, 0, 13, 0, 10, 0, 3, 5, 2, 0, 0, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_158561, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_LITTLE_BOY_1, 0, 2, 0, 8, 0, 3, 7, 0, 0, 0, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_15856A, 0, 0, 0
	object_event 6, MAP_OBJ_GFX_WOMAN_5, 0, 3, 0, 8, 0, 3, 7, 0, 0, 0, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_158573, 0, 0, 0
	object_event 7, MAP_OBJ_GFX_WOMAN_3, 0, 11, 0, 3, 0, 3, 2, 17, 0, 0, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_15857C, 776, 0, 0
	object_event 8, MAP_OBJ_GFX_ARTIST, 0, 19, 0, 3, 0, 3, 7, 0, 0, 0, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_15858E, 779, 0, 0
	object_event 9, MAP_OBJ_GFX_FAT_MAN, 0, 2, 0, 2, 0, 3, 2, 34, 0, 0, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_1585A3, 780, 0, 0
	object_event 10, MAP_OBJ_GFX_PSYCHIC_M, 0, 6, 0, 2, 0, 3, 2, 17, 0, 0, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_158585, 778, 0, 0

LilycoveCity_LilycoveMuseum_1F_MapWarps:: @ 8389654
	warp_def 9, 13, 0, 3, LilycoveCity
	warp_def 10, 13, 0, 13, LilycoveCity
	warp_def 16, 1, 0, 0, LilycoveCity_LilycoveMuseum_2F

LilycoveCity_LilycoveMuseum_1F_MapBGEvents:: @ 838966C
	bg_event 1, 1, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_158510
	bg_event 2, 1, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_158510
	bg_event 5, 1, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_158534
	bg_event 6, 1, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_158534
	bg_event 9, 1, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_158507
	bg_event 3, 6, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_158519
	bg_event 2, 6, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_158519
	bg_event 15, 12, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_15853D
	bg_event 11, 1, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_158507
	bg_event 6, 6, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_15852B
	bg_event 17, 9, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_15854F
	bg_event 19, 1, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_158522
	bg_event 20, 1, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_158522
	bg_event 18, 9, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_15854F
	bg_event 18, 11, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_158546
	bg_event 16, 9, 0, 0, 0, LilycoveCity_LilycoveMuseum_1F_EventScript_15854F

LilycoveCity_LilycoveMuseum_1F_MapEvents:: @ 838972C
	map_events LilycoveCity_LilycoveMuseum_1F_MapObjects, LilycoveCity_LilycoveMuseum_1F_MapWarps, 0x0, LilycoveCity_LilycoveMuseum_1F_MapBGEvents
