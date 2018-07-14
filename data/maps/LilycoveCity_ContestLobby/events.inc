LilycoveCity_ContestLobby_EventObjects:: @ 838984C
	object_event 1, EVENT_OBJ_GFX_TEALA, 0, 6, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 0, 0, LilycoveCity_ContestLobby_EventScript_158EB0, 0
	object_event 2, EVENT_OBJ_GFX_TEALA, 0, 7, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 0, 0, LilycoveCity_ContestLobby_EventScript_158B85, 0
	object_event 3, EVENT_OBJ_GFX_OLD_MAN_1, 0, 17, 9, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, LilycoveCity_ContestLobby_EventScript_1B77AB, 0
	object_event 4, EVENT_OBJ_GFX_ARTIST, 0, 1, 1, 0, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, 0x0, FLAG_HIDE_LILYCOVE_CONTEST_ATTENDENT_1
	object_event 5, EVENT_OBJ_GFX_BLACK_BELT, 0, 14, 6, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, LilycoveCity_ContestLobby_EventScript_15901E, 0
	object_event 6, EVENT_OBJ_GFX_GIRL_2, 0, 3, 10, 3, MOVEMENT_TYPE_WANDER_AROUND, 2, 2, 0, 0, LilycoveCity_ContestLobby_EventScript_159027, 0
	object_event 7, EVENT_OBJ_GFX_ARTIST, 0, 20, 2, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, LilycoveCity_ContestLobby_EventScript_159042, 0
	object_event 8, EVENT_OBJ_GFX_REPORTER_M, 0, 8, 10, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, LilycoveCity_ContestLobby_EventScript_1AE0B6, FLAG_HIDE_CONTEST_REPORTER_LILYCOVE
	object_event 9, EVENT_OBJ_GFX_BOY_1, 0, 18, 8, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, LilycoveCity_ContestLobby_EventScript_15907B, 0
	object_event 10, EVENT_OBJ_GFX_GIRL_1, 0, 19, 9, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, LilycoveCity_ContestLobby_EventScript_159084, 0
	object_event 11, EVENT_OBJ_GFX_ARTIST, 0, 13, 1, 0, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, 0x0, FLAG_HIDE_ARTIST_LILCOVE_CONTEST
	object_event 12, EVENT_OBJ_GFX_FISHERMAN, 0, 13, 10, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, LilycoveCity_ContestLobby_EventScript_159054, 0
	object_event 13, EVENT_OBJ_GFX_FAT_MAN, 0, 1, 6, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, LilycoveCity_ContestLobby_EventScript_15904B, 0
	object_event 14, EVENT_OBJ_GFX_LITTLE_BOY_1, 0, 7, 7, 3, MOVEMENT_TYPE_WANDER_UP_AND_DOWN, 0, 1, 0, 0, LilycoveCity_ContestLobby_EventScript_15905D, 0

LilycoveCity_ContestLobby_MapWarps:: @ 838999C
	warp_def 6, 11, 0, 4, MAP_LILYCOVE_CITY
	warp_def 7, 11, 0, 4, MAP_LILYCOVE_CITY
	warp_def 1, 1, 0, 0, MAP_LILYCOVE_CITY_CONTEST_HALL
	warp_def 13, 1, 0, 1, MAP_LILYCOVE_CITY_CONTEST_HALL

LilycoveCity_ContestLobby_MapBGEvents:: @ 83899BC
	bg_event 18, 5, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_ContestLobby_EventScript_1B7835
	bg_event 18, 9, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_ContestLobby_EventScript_1B7659
	bg_event 15, 1, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_ContestLobby_EventScript_159066
	bg_event 17, 1, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_ContestLobby_EventScript_15906D
	bg_event 19, 1, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_ContestLobby_EventScript_159074
	bg_event 22, 1, 0, BG_EVENT_PLAYER_FACING_ANY, LilycoveCity_ContestLobby_EventScript_15908D

LilycoveCity_ContestLobby_MapEvents:: @ 8389A04
	map_events LilycoveCity_ContestLobby_EventObjects, LilycoveCity_ContestLobby_MapWarps, 0x0, LilycoveCity_ContestLobby_MapBGEvents
