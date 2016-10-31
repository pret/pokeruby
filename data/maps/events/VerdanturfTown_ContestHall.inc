VerdanturfTown_ContestHall_MapObjects:: @ 8386AEC
	object_event 1, MAP_OBJ_GFX_BOY_4, 0, 0, 0, 7, 0, 0, 2, 49, 0, 0, 0, 0, 0, VerdanturfTown_ContestHall_EventScript_153EA9, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_BOY_3, 0, 20, 0, 15, 0, 0, 2, 17, 0, 0, 0, 0, 0, VerdanturfTown_ContestHall_EventScript_153E97, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_LITTLE_GIRL_2, 0, 9, 0, 8, 0, 3, 2, 34, 0, 0, 0, 0, 0, VerdanturfTown_ContestHall_EventScript_153EA0, 0, 0, 0

VerdanturfTown_ContestHall_MapWarps:: @ 8386B34
	warp_def 11, 17, 0, 2, VerdanturfTown_ContestLobby
	warp_def 10, 17, 0, 2, VerdanturfTown_ContestLobby

VerdanturfTown_ContestHall_MapBGEvents:: @ 8386B44
	bg_event 12, 14, 3, 0, 0, VerdanturfTown_ContestHall_EventScript_153EB2
	bg_event 8, 14, 3, 0, 0, VerdanturfTown_ContestHall_EventScript_153EB2

VerdanturfTown_ContestHall_MapEvents:: @ 8386B5C
	map_events VerdanturfTown_ContestHall_MapObjects, VerdanturfTown_ContestHall_MapWarps, 0x0, VerdanturfTown_ContestHall_MapBGEvents
