SlateportCity_ContestLobby_EventObjects:: @ 8387788
	object_event 1, EVENT_OBJ_GFX_TEALA, 0, 5, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 3, 0, 0, SlateportCity_ContestLobby_EventScript_15541D, 0
	object_event 2, EVENT_OBJ_GFX_OLD_MAN_1, 0, 11, 5, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, SlateportCity_ContestLobby_EventScript_1B7795, 0
	object_event 3, EVENT_OBJ_GFX_MAN_4, 0, 0, 3, 3, MOVEMENT_TYPE_WANDER_UP_AND_DOWN, 0, 1, 0, 0, SlateportCity_ContestLobby_EventScript_1554DE, 0
	object_event 4, EVENT_OBJ_GFX_GIRL_1, 0, 9, 6, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, SlateportCity_ContestLobby_EventScript_1554E7, 0
	object_event 5, EVENT_OBJ_GFX_REPORTER_M, 0, 7, 5, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, SlateportCity_ContestLobby_EventScript_1AE0B6, FLAG_HIDE_CONTEST_REPORTER_SLATEPORT
	object_event 6, EVENT_OBJ_GFX_BOY_1, 0, 13, 5, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, SlateportCity_ContestLobby_EventScript_155536, 0
	object_event 7, EVENT_OBJ_GFX_LITTLE_GIRL_2, 0, 1, 5, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, SlateportCity_ContestLobby_EventScript_1554F9, 0
	object_event 8, EVENT_OBJ_GFX_WOMAN_3, 0, 12, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, SlateportCity_ContestLobby_EventScript_1554F0, 0

SlateportCity_ContestLobby_MapWarps:: @ 8387848
	warp_def 5, 6, 0, 3, MAP_SLATEPORT_CITY
	warp_def 6, 6, 0, 3, MAP_SLATEPORT_CITY
	warp_def 1, 1, 0, 0, MAP_SLATEPORT_CITY_CONTEST_HALL

SlateportCity_ContestLobby_MapBGEvents:: @ 8387860
	bg_event 10, 3, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_ContestLobby_EventScript_1B7829
	bg_event 12, 5, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_ContestLobby_EventScript_1B761E
	bg_event 11, 1, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_ContestLobby_EventScript_15552F
	bg_event 13, 1, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_ContestLobby_EventScript_15908D

SlateportCity_ContestLobby_MapEvents:: @ 8387890
	map_events SlateportCity_ContestLobby_EventObjects, SlateportCity_ContestLobby_MapWarps, 0x0, SlateportCity_ContestLobby_MapBGEvents
