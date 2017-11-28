SlateportCity_ContestLobby_MapObjects:: @ 8387788
	object_event 1, MAP_OBJ_GFX_TEALA, 0, 5, 0, 2, 0, 3, 8, 48, 0, 0, 0, 0, 0, SlateportCity_ContestLobby_EventScript_15541D, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_OLD_MAN_1, 0, 11, 0, 5, 0, 3, 10, 0, 0, 0, 0, 0, 0, SlateportCity_ContestLobby_EventScript_1B7795, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_MAN_4, 0, 0, 0, 3, 0, 3, 3, 16, 0, 0, 0, 0, 0, SlateportCity_ContestLobby_EventScript_1554DE, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_GIRL_1, 0, 9, 0, 6, 0, 3, 2, 17, 0, 0, 0, 0, 0, SlateportCity_ContestLobby_EventScript_1554E7, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_REPORTER_M, 0, 7, 0, 5, 0, 3, 9, 0, 0, 0, 0, 0, 0, SlateportCity_ContestLobby_EventScript_1AE0B6, 803, 0, 0
	object_event 6, MAP_OBJ_GFX_BOY_1, 0, 13, 0, 5, 0, 3, 9, 0, 0, 0, 0, 0, 0, SlateportCity_ContestLobby_EventScript_155536, 0, 0, 0
	object_event 7, MAP_OBJ_GFX_LITTLE_GIRL_2, 0, 1, 0, 5, 0, 3, 8, 0, 0, 0, 0, 0, 0, SlateportCity_ContestLobby_EventScript_1554F9, 0, 0, 0
	object_event 8, MAP_OBJ_GFX_WOMAN_3, 0, 12, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, SlateportCity_ContestLobby_EventScript_1554F0, 0, 0, 0

SlateportCity_ContestLobby_MapWarps:: @ 8387848
	warp_def 5, 6, 0, 3, MAP_SLATEPORT_CITY
	warp_def 6, 6, 0, 3, MAP_SLATEPORT_CITY
	warp_def 1, 1, 0, 0, MAP_SLATEPORT_CITY_CONTEST_HALL

SlateportCity_ContestLobby_MapBGEvents:: @ 8387860
	bg_event 10, 3, 0, 0, 0, SlateportCity_ContestLobby_EventScript_1B7829
	bg_event 12, 5, 0, 0, 0, SlateportCity_ContestLobby_EventScript_1B761E
	bg_event 11, 1, 0, 0, 0, SlateportCity_ContestLobby_EventScript_15552F
	bg_event 13, 1, 0, 0, 0, SlateportCity_ContestLobby_EventScript_15908D

SlateportCity_ContestLobby_MapEvents:: @ 8387890
	map_events SlateportCity_ContestLobby_MapObjects, SlateportCity_ContestLobby_MapWarps, 0x0, SlateportCity_ContestLobby_MapBGEvents
