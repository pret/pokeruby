FallarborTown_ContestLobby_EventObjects:: @ 83866F0
	object_event 1, EVENT_OBJ_GFX_TEALA, 0, 5, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, FallarborTown_ContestLobby_EventScript_1539CD, 0
	object_event 2, EVENT_OBJ_GFX_LITTLE_BOY_2, 0, 2, 6, 3, MOVEMENT_TYPE_WANDER_LEFT_AND_RIGHT, 1, 0, 0, 0, FallarborTown_ContestLobby_EventScript_153A8E, 0
	object_event 3, EVENT_OBJ_GFX_LASS, 0, 0, 4, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, FallarborTown_ContestLobby_EventScript_153AB2, 0
	object_event 4, EVENT_OBJ_GFX_OLD_MAN_1, 0, 11, 5, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, FallarborTown_ContestLobby_EventScript_1B778A, 0
	object_event 5, EVENT_OBJ_GFX_REPORTER_M, 0, 7, 5, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, FallarborTown_ContestLobby_EventScript_1AE0B6, FLAG_HIDE_CONTEST_REPORTER_FALLARBOR
	object_event 6, EVENT_OBJ_GFX_ARTIST, 0, 12, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, FallarborTown_ContestLobby_EventScript_153A97, 0

FallarborTown_ContestLobby_MapWarps:: @ 8386780
	warp_def 5, 6, 0, 1, MAP_FALLARBOR_TOWN
	warp_def 6, 6, 0, 1, MAP_FALLARBOR_TOWN
	warp_def 1, 1, 0, 0, MAP_FALLARBOR_TOWN_CONTEST_HALL

FallarborTown_ContestLobby_MapBGEvents:: @ 8386798
	bg_event 10, 3, 0, BG_EVENT_PLAYER_FACING_ANY, FallarborTown_ContestLobby_EventScript_1B7823
	bg_event 12, 5, 0, BG_EVENT_PLAYER_FACING_ANY, FallarborTown_ContestLobby_EventScript_1B7604
	bg_event 11, 1, 3, BG_EVENT_PLAYER_FACING_ANY, FallarborTown_ContestLobby_EventScript_153ABB
	bg_event 13, 1, 0, BG_EVENT_PLAYER_FACING_ANY, FallarborTown_ContestLobby_EventScript_153AC2

FallarborTown_ContestLobby_MapEvents:: @ 83867C8
	map_events FallarborTown_ContestLobby_EventObjects, FallarborTown_ContestLobby_MapWarps, 0x0, FallarborTown_ContestLobby_MapBGEvents
