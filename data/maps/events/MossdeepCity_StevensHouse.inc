MossdeepCity_StevensHouse_MapObjects:: @ 838AA44
	object_event 1, MAP_OBJ_GFX_STEVEN, 0, 9, 0, 6, 0, 3, 10, 0, 0, 0, 0, 0, 0, MossdeepCity_StevensHouse_EventScript_15AAF9, 967, 0, 0
	object_event 2, MAP_OBJ_GFX_ITEM_BALL, 0, 4, 0, 3, 0, 3, 1, 17, 0, 0, 0, 0, 0, MossdeepCity_StevensHouse_EventScript_15AA7C, 968, 0, 0
	object_event 3, MAP_OBJ_GFX_ITEM_BALL, 0, 5, 0, 3, 0, 3, 1, 17, 0, 0, 0, 0, 0, MossdeepCity_StevensHouse_EventScript_15AB20, 1133, 0, 0
	object_event 4, MAP_OBJ_GFX_LITTLE_BOY_1, 0, 6, 0, 4, 0, 3, 76, 17, 0, 0, 0, 0, 0, MossdeepCity_StevensHouse_EventScript_15AB02, 727, 0, 0

MossdeepCity_StevensHouse_MapWarps:: @ 838AAA4
	warp_def 3, 7, 0, 6, MossdeepCity
	warp_def 4, 7, 0, 6, MossdeepCity

MossdeepCity_StevensHouse_MapBGEvents:: @ 838AAB4
	bg_event 0, 1, 0, 0, 0, MossdeepCity_StevensHouse_EventScript_15AAF0
	bg_event 1, 1, 0, 0, 0, MossdeepCity_StevensHouse_EventScript_15AAF0
	bg_event 10, 4, 3, 0, 0, MossdeepCity_StevensHouse_EventScript_15AAF0
	bg_event 10, 6, 3, 0, 0, MossdeepCity_StevensHouse_EventScript_15AAF0

MossdeepCity_StevensHouse_MapEvents:: @ 838AAE4
	map_events MossdeepCity_StevensHouse_MapObjects, MossdeepCity_StevensHouse_MapWarps, 0x0, MossdeepCity_StevensHouse_MapBGEvents
