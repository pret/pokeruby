MossdeepCity_EventObjects:: @ 838042C
	object_event 1, EVENT_OBJ_GFX_SAILOR, 0, 42, 24, 5, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, MossdeepCity_EventScript_14CFB7, 0
	object_event 2, EVENT_OBJ_GFX_OLD_MAN_1, 0, 50, 34, 5, MOVEMENT_TYPE_WANDER_LEFT_AND_RIGHT, 1, 0, 0, 0, MossdeepCity_EventScript_14CFC9, 0
	object_event 3, EVENT_OBJ_GFX_WOMAN_2, 0, 32, 12, 5, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, MossdeepCity_EventScript_14CFAE, 0
	object_event 4, EVENT_OBJ_GFX_LITTLE_BOY_1, 0, 26, 21, 5, MOVEMENT_TYPE_WANDER_UP_AND_DOWN, 0, 1, 0, 0, MossdeepCity_EventScript_14CFC0, 0
	object_event 5, EVENT_OBJ_GFX_GIRL_1, 0, 45, 18, 7, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, MossdeepCity_EventScript_14CFD2, 0
	object_event 6, EVENT_OBJ_GFX_ITEM_BALL, 0, 62, 35, 5, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, MossdeepCity_EventScript_1B1745, FLAG_ITEM_MOSSDEEP_1
	object_event 7, EVENT_OBJ_GFX_MAN_1, 0, 53, 5, 7, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, MossdeepCity_EventScript_14D011, 0
	object_event 8, EVENT_OBJ_GFX_GIRL_1, 0, 56, 21, 7, MOVEMENT_TYPE_FACE_RIGHT, 1, 1, 0, 0, MossdeepCity_EventScript_14CFDB, 0
	object_event 9, EVENT_OBJ_GFX_BOY_2, 0, 23, 13, 5, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, MossdeepCity_EventScript_14D027, 0

MossdeepCity_MapWarps:: @ 8380504
	warp_def 28, 9, 0, 0, MAP_MOSSDEEP_CITY_HOUSE1
	warp_def 38, 9, 0, 0, MAP_MOSSDEEP_CITY_GYM
	warp_def 28, 16, 0, 0, MAP_MOSSDEEP_CITY_POKEMON_CENTER_1F
	warp_def 67, 24, 0, 0, MAP_MOSSDEEP_CITY_HOUSE2
	warp_def 37, 18, 0, 0, MAP_MOSSDEEP_CITY_MART
	warp_def 49, 6, 0, 0, MAP_MOSSDEEP_CITY_HOUSE3
	warp_def 19, 10, 0, 0, MAP_MOSSDEEP_CITY_STEVENS_HOUSE
	warp_def 18, 16, 0, 1, MAP_MOSSDEEP_CITY_HOUSE4
	warp_def 64, 13, 0, 0, MAP_MOSSDEEP_CITY_SPACE_CENTER_1F
	warp_def 36, 24, 0, 0, MAP_MOSSDEEP_CITY_GAME_CORNER_1F

MossdeepCity_MapCoordEvents:: @ 8380554
	coord_event 25, 25, 0, VAR_TEMP_1, 0, MossdeepCity_EventScript_14D008
	coord_event 26, 25, 0, VAR_TEMP_1, 0, MossdeepCity_EventScript_14D008
	coord_event 32, 27, 0, VAR_TEMP_1, 0, MossdeepCity_EventScript_14D008
	coord_event 33, 27, 0, VAR_TEMP_1, 0, MossdeepCity_EventScript_14D008

MossdeepCity_MapBGEvents:: @ 8380594
	bg_event 25, 16, 0, BG_EVENT_PLAYER_FACING_ANY, MossdeepCity_EventScript_14CFF6
	bg_event 34, 9, 0, BG_EVENT_PLAYER_FACING_ANY, MossdeepCity_EventScript_14CFED
	bg_event 29, 16, 0, BG_EVENT_PLAYER_FACING_NORTH, MossdeepCity_EventScript_1A00EA
	bg_event 38, 18, 0, BG_EVENT_PLAYER_FACING_NORTH, MossdeepCity_EventScript_1A00E1
	bg_event 66, 14, 0, BG_EVENT_PLAYER_FACING_ANY, MossdeepCity_EventScript_14CFFF
	bg_event 30, 16, 0, BG_EVENT_PLAYER_FACING_NORTH, MossdeepCity_EventScript_1A00EA
	bg_event 39, 18, 0, BG_EVENT_PLAYER_FACING_NORTH, MossdeepCity_EventScript_1A00E1
	bg_event 57, 21, 7, BG_EVENT_PLAYER_FACING_ANY, MossdeepCity_EventScript_14CFE4

MossdeepCity_MapEvents:: @ 83805F4
	map_events MossdeepCity_EventObjects, MossdeepCity_MapWarps, MossdeepCity_MapCoordEvents, MossdeepCity_MapBGEvents
