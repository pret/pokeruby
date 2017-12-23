VerdanturfTown_ContestLobby_MapObjects:: @ 8386A00
	object_event 1, MAP_OBJ_GFX_TEALA, 0, 5, 0, 2, 0, 3, 8, 48, 0, 0, 0, 0, 0, VerdanturfTown_ContestLobby_EventScript_153D76, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_OLD_MAN_1, 0, 11, 0, 5, 0, 3, 10, 0, 0, 0, 0, 0, 0, VerdanturfTown_ContestLobby_EventScript_1B77A0, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_GIRL_1, 0, 14, 0, 2, 0, 3, 9, 0, 0, 0, 0, 0, 0, VerdanturfTown_ContestLobby_EventScript_153E47, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_BOY_2, 0, 1, 0, 6, 0, 3, 2, 17, 0, 0, 0, 0, 0, VerdanturfTown_ContestLobby_EventScript_153E3E, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_REPORTER_M, 0, 7, 0, 5, 0, 3, 9, 0, 0, 0, 0, 0, 0, VerdanturfTown_ContestLobby_EventScript_1AE0B6, FLAG_HIDE_CONTEST_REPORTER_VERDANTURF, 0, 0
	object_event 6, MAP_OBJ_GFX_BOY_3, 0, 0, 0, 3, 0, 3, 3, 16, 0, 0, 0, 0, 0, VerdanturfTown_ContestLobby_EventScript_153E80, 0, 0, 0

VerdanturfTown_ContestLobby_MapWarps:: @ 8386A90
	warp_def 5, 6, 0, 0, MAP_VERDANTURF_TOWN
	warp_def 6, 6, 0, 0, MAP_VERDANTURF_TOWN
	warp_def 1, 1, 0, 1, MAP_VERDANTURF_TOWN_CONTEST_HALL

VerdanturfTown_ContestLobby_MapBGEvents:: @ 8386AA8
	bg_event 10, 3, 0, 0, 0, VerdanturfTown_ContestLobby_EventScript_1B782F
	bg_event 12, 5, 0, 0, 0, VerdanturfTown_ContestLobby_EventScript_1B763F
	bg_event 11, 1, 0, 0, 0, VerdanturfTown_ContestLobby_EventScript_153E37
	bg_event 13, 1, 0, 0, 0, VerdanturfTown_ContestLobby_EventScript_153E89

VerdanturfTown_ContestLobby_MapEvents:: @ 8386AD8
	map_events VerdanturfTown_ContestLobby_MapObjects, VerdanturfTown_ContestLobby_MapWarps, 0x0, VerdanturfTown_ContestLobby_MapBGEvents
