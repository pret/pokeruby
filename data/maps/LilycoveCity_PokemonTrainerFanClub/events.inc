LilycoveCity_PokemonTrainerFanClub_EventObjects:: @ 8389EB0
	object_event 1, EVENT_OBJ_GFX_LASS, 0, 3, 11, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, LilycoveCity_PokemonTrainerFanClub_EventScript_1595A6, 0
	object_event 2, EVENT_OBJ_GFX_MAN_5, 0, 8, 10, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, LilycoveCity_PokemonTrainerFanClub_EventScript_15952F, 0
	object_event 3, EVENT_OBJ_GFX_MAN_3, 0, 6, 11, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, LilycoveCity_PokemonTrainerFanClub_EventScript_15961D, 0
	object_event 4, EVENT_OBJ_GFX_LITTLE_GIRL_2, 0, 5, 8, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, LilycoveCity_PokemonTrainerFanClub_EventScript_159694, 0
	object_event 5, EVENT_OBJ_GFX_LITTLE_BOY_1, 0, 7, 11, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, LilycoveCity_PokemonTrainerFanClub_EventScript_15970B, FLAG_HIDE_FANCLUB_LITTLE_BOY
	object_event 6, EVENT_OBJ_GFX_BOY_2, 0, 1, 9, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, LilycoveCity_PokemonTrainerFanClub_EventScript_15976D, FLAG_HIDE_FANCLUB_BOY
	object_event 7, EVENT_OBJ_GFX_WOMAN_4, 0, 3, 10, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, LilycoveCity_PokemonTrainerFanClub_EventScript_1597CF, FLAG_HIDE_FANCLUB_LADY
	object_event 8, EVENT_OBJ_GFX_OLD_WOMAN_1, 0, 10, 10, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, LilycoveCity_PokemonTrainerFanClub_EventScript_159831, FLAG_HIDE_FANCLUB_OLD_LADY

LilycoveCity_PokemonTrainerFanClub_MapWarps:: @ 8389F70
	warp_def 6, 13, 0, 5, MAP_LILYCOVE_CITY
	warp_def 5, 13, 0, 5, MAP_LILYCOVE_CITY

LilycoveCity_PokemonTrainerFanClub_MapEvents:: @ 8389F80
	map_events LilycoveCity_PokemonTrainerFanClub_EventObjects, LilycoveCity_PokemonTrainerFanClub_MapWarps, 0x0, 0x0
