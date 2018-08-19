MossdeepCity_StevensHouse_EventObjects:: @ 838AA44
	object_event 1, EVENT_OBJ_GFX_STEVEN, 0, 9, 6, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, MossdeepCity_StevensHouse_EventScript_15AAF9, FLAG_HIDE_STEVEN_STEVENS_HOUSE
	object_event 2, EVENT_OBJ_GFX_ITEM_BALL, 0, 4, 3, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, MossdeepCity_StevensHouse_EventScript_15AA7C, FLAG_HIDE_BELDUM_BALL_STEVENS_HOUSE
	object_event 3, EVENT_OBJ_GFX_ITEM_BALL, 0, 5, 3, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, MossdeepCity_StevensHouse_EventScript_15AB20, FLAG_ITEM_MOSSDEEP_STEVENS_HOUSE_1
	object_event 4, EVENT_OBJ_GFX_LITTLE_BOY_1, 0, 6, 4, 3, MOVEMENT_TYPE_INVISIBLE, 1, 1, 0, 0, MossdeepCity_StevensHouse_EventScript_15AB02, FLAG_HIDE_STEVENS_LETTER

MossdeepCity_StevensHouse_MapWarps:: @ 838AAA4
	warp_def 3, 7, 0, 6, MAP_MOSSDEEP_CITY
	warp_def 4, 7, 0, 6, MAP_MOSSDEEP_CITY

MossdeepCity_StevensHouse_MapBGEvents:: @ 838AAB4
	bg_event 0, 1, 0, BG_EVENT_PLAYER_FACING_ANY, MossdeepCity_StevensHouse_EventScript_15AAF0
	bg_event 1, 1, 0, BG_EVENT_PLAYER_FACING_ANY, MossdeepCity_StevensHouse_EventScript_15AAF0
	bg_event 10, 4, 3, BG_EVENT_PLAYER_FACING_ANY, MossdeepCity_StevensHouse_EventScript_15AAF0
	bg_event 10, 6, 3, BG_EVENT_PLAYER_FACING_ANY, MossdeepCity_StevensHouse_EventScript_15AAF0

MossdeepCity_StevensHouse_MapEvents:: @ 838AAE4
	map_events MossdeepCity_StevensHouse_EventObjects, MossdeepCity_StevensHouse_MapWarps, 0x0, MossdeepCity_StevensHouse_MapBGEvents
