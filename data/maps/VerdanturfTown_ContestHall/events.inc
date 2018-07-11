VerdanturfTown_ContestHall_EventObjects:: @ 8386AEC
	object_event 1, EVENT_OBJ_GFX_BOY_4, 0, 0, 7, 0, MOVEMENT_TYPE_WANDER_AROUND, 1, 3, 0, 0, VerdanturfTown_ContestHall_EventScript_153EA9, 0
	object_event 2, EVENT_OBJ_GFX_BOY_3, 0, 20, 15, 0, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, VerdanturfTown_ContestHall_EventScript_153E97, 0
	object_event 3, EVENT_OBJ_GFX_LITTLE_GIRL_2, 0, 9, 8, 3, MOVEMENT_TYPE_WANDER_AROUND, 2, 2, 0, 0, VerdanturfTown_ContestHall_EventScript_153EA0, 0

VerdanturfTown_ContestHall_MapWarps:: @ 8386B34
	warp_def 11, 17, 0, 2, MAP_VERDANTURF_TOWN_CONTEST_LOBBY
	warp_def 10, 17, 0, 2, MAP_VERDANTURF_TOWN_CONTEST_LOBBY

VerdanturfTown_ContestHall_MapBGEvents:: @ 8386B44
	bg_event 12, 14, 3, BG_EVENT_PLAYER_FACING_ANY, VerdanturfTown_ContestHall_EventScript_153EB2
	bg_event 8, 14, 3, BG_EVENT_PLAYER_FACING_ANY, VerdanturfTown_ContestHall_EventScript_153EB2

VerdanturfTown_ContestHall_MapEvents:: @ 8386B5C
	map_events VerdanturfTown_ContestHall_EventObjects, VerdanturfTown_ContestHall_MapWarps, 0x0, VerdanturfTown_ContestHall_MapBGEvents
