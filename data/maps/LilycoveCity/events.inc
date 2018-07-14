LilycoveCity_EventObjects:: @ 838016C
	object_event 1, EVENT_OBJ_GFX_SAILOR, 0, 32, 20, 3, MOVEMENT_TYPE_WANDER_UP_AND_DOWN, 0, 1, 0, 0, LilycoveCity_EventScript_14CBEF, 0
	object_event 2, EVENT_OBJ_GFX_GIRL_1, 0, 15, 18, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, LilycoveCity_EventScript_14CBC7, 0
	object_event 3, EVENT_OBJ_GFX_MAN_1, 0, 28, 28, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, LilycoveCity_EventScript_14CBBE, 0
	object_event 4, EVENT_OBJ_GFX_BOY_4, 0, 21, 15, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, LilycoveCity_EventScript_14CBE6, 0
	object_event 5, EVENT_OBJ_GFX_MAN_2, 0, 16, 9, 5, MOVEMENT_TYPE_WANDER_LEFT_AND_RIGHT, 1, 0, 0, 0, LilycoveCity_EventScript_14CC2D, 0
	object_event 6, EVENT_OBJ_GFX_WOMAN_3, 0, 35, 27, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, LilycoveCity_EventScript_14CC0E, 0
	object_event 7, EVENT_OBJ_GFX_OLD_MAN_1, 0, 35, 37, 5, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, LilycoveCity_EventScript_14CC36, 0
	object_event 8, EVENT_OBJ_GFX_OLD_WOMAN_1, 0, 34, 37, 5, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, LilycoveCity_EventScript_14CC3F, 0
	object_event 9, EVENT_OBJ_GFX_OLD_MAN_1, 0, 57, 17, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, LilycoveCity_EventScript_14CC48, 0
	object_event 10, EVENT_OBJ_GFX_VAR_1, 0, 73, 15, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, LilycoveCity_EventScript_14CCE5, FLAG_HIDE_GRUNTS_LILYCOVE
	object_event 11, EVENT_OBJ_GFX_ITEM_BALL, 0, 61, 36, 5, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, LilycoveCity_EventScript_1B1738, FLAG_ITEM_LILYCOVE_1
	object_event 12, EVENT_OBJ_GFX_VAR_1, 0, 43, 18, 3, MOVEMENT_TYPE_WANDER_LEFT_AND_RIGHT, 1, 0, 0, 0, LilycoveCity_EventScript_14CD3D, FLAG_HIDE_GRUNTS_LILYCOVE
	object_event 13, EVENT_OBJ_GFX_VAR_1, 0, 46, 12, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, LilycoveCity_EventScript_14CD22, FLAG_HIDE_GRUNTS_LILYCOVE
	object_event 14, EVENT_OBJ_GFX_VAR_1, 0, 45, 12, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, LilycoveCity_EventScript_14CD2B, FLAG_HIDE_GRUNTS_LILYCOVE
	object_event 15, EVENT_OBJ_GFX_VAR_1, 0, 38, 9, 5, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, LilycoveCity_EventScript_14CD34, FLAG_HIDE_GRUNTS_LILYCOVE
	object_event 16, EVENT_OBJ_GFX_GENTLEMAN, 0, 50, 7, 5, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, LilycoveCity_EventScript_14CB74, 0
	object_event 17, EVENT_OBJ_GFX_VAR_0, 0, 27, 7, 5, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 0, 0, LilycoveCity_EventScript_14CD46, FLAG_HIDE_RIVAL_LILYCOVE_MART

LilycoveCity_MapWarps:: @ 8380304
	warp_def 27, 6, 0, 0, MAP_LILYCOVE_CITY_DEPARTMENT_STORE_1F
	warp_def 37, 24, 0, 0, MAP_LILYCOVE_CITY_COVE_LILY_MOTEL_1F
	warp_def 24, 14, 0, 0, MAP_LILYCOVE_CITY_POKEMON_CENTER_1F
	warp_def 11, 5, 0, 0, MAP_LILYCOVE_CITY_LILYCOVE_MUSEUM_1F
	warp_def 23, 24, 0, 0, MAP_LILYCOVE_CITY_CONTEST_LOBBY
	warp_def 39, 14, 0, 1, MAP_LILYCOVE_CITY_POKEMON_TRAINER_FAN_CLUB
	warp_def 70, 5, 1, 0, MAP_AQUA_HIDEOUT_1F
	warp_def 36, 6, 0, 0, MAP_LILYCOVE_CITY_MOVE_DELETERS_HOUSE
	warp_def 42, 6, 0, 0, MAP_LILYCOVE_CITY_HOUSE1
	warp_def 55, 15, 0, 0, MAP_LILYCOVE_CITY_HOUSE2
	warp_def 11, 22, 0, 0, MAP_LILYCOVE_CITY_HOUSE3
	warp_def 12, 14, 0, 0, MAP_LILYCOVE_CITY_HOUSE4
	warp_def 12, 32, 0, 0, MAP_LILYCOVE_CITY_HARBOR
	warp_def 12, 5, 0, 1, MAP_LILYCOVE_CITY_LILYCOVE_MUSEUM_1F
	warp_def 71, 5, 1, 0, MAP_MAGMA_HIDEOUT_1F

LilycoveCity_MapBGEvents:: @ 838037C
	bg_event 19, 7, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_EventScript_14CC82
	bg_event 25, 14, 0, BG_EVENT_PLAYER_FACING_NORTH, LilycoveCity_EventScript_1A00EA
	bg_event 29, 7, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_EventScript_14CCD3
	bg_event 26, 14, 0, BG_EVENT_PLAYER_FACING_NORTH, LilycoveCity_EventScript_1A00EA
	bg_event 6, 15, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_EventScript_14CC67
	bg_event 29, 24, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_EventScript_14CC70
	bg_event 35, 24, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_EventScript_14CC79
	bg_event 6, 30, 3, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_EventScript_14CCAC
	bg_event 36, 14, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_EventScript_14CCCA
	bg_event 34, 6, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_EventScript_14CCDC
	bg_hidden_item_event 36, 31, 3, ITEM_HEART_SCALE, FLAG_HIDDEN_ITEM_1B
	bg_hidden_item_event 61, 7, 0, ITEM_PP_UP, FLAG_HIDDEN_ITEM_2B
	bg_hidden_item_event 64, 31, 0, ITEM_POKE_BALL, FLAG_HIDDEN_ITEM_4B

LilycoveCity_MapEvents:: @ 8380418
	map_events LilycoveCity_EventObjects, LilycoveCity_MapWarps, 0x0, LilycoveCity_MapBGEvents
