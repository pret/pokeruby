VerdanturfTown_EventObjects:: @ 8380F00
	object_event 1, EVENT_OBJ_GFX_MAN_2, 0, 4, 17, 3, MOVEMENT_TYPE_WANDER_LEFT_AND_RIGHT, 1, 0, 0, 0, VerdanturfTown_EventScript_14E899, 0
	object_event 2, EVENT_OBJ_GFX_LITTLE_GIRL_1, 0, 9, 2, 3, MOVEMENT_TYPE_FACE_LEFT, 1, 0, 0, 0, VerdanturfTown_EventScript_14E866, 0
	object_event 3, EVENT_OBJ_GFX_BOY_1, 0, 11, 9, 3, MOVEMENT_TYPE_WANDER_UP_AND_DOWN, 0, 1, 0, 0, VerdanturfTown_EventScript_14E8AB, 0
	object_event 4, EVENT_OBJ_GFX_CAMPER, 0, 6, 10, 3, MOVEMENT_TYPE_WANDER_LEFT_AND_RIGHT, 1, 0, 0, 0, VerdanturfTown_EventScript_14E8A2, 0

VerdanturfTown_MapWarps:: @ 8380F60
	warp_def 4, 7, 0, 0, MAP_VERDANTURF_TOWN_CONTEST_LOBBY
	warp_def 12, 3, 0, 0, MAP_VERDANTURF_TOWN_MART
	warp_def 16, 3, 0, 0, MAP_VERDANTURF_TOWN_POKEMON_CENTER_1F
	warp_def 10, 14, 0, 0, MAP_VERDANTURF_TOWN_WANDAS_HOUSE
	warp_def 8, 1, 0, 1, MAP_RUSTURF_TUNNEL
	warp_def 1, 14, 0, 0, MAP_VERDANTURF_TOWN_FRIENDSHIP_RATERS_HOUSE
	warp_def 17, 15, 0, 0, MAP_VERDANTURF_TOWN_HOUSE

VerdanturfTown_MapBGEvents:: @ 8380F98
	bg_event 14, 3, 0, BG_EVENT_PLAYER_FACING_NORTH, VerdanturfTown_EventScript_1A00E1
	bg_event 14, 6, 0, BG_EVENT_PLAYER_FACING_ANY, VerdanturfTown_EventScript_14E8CA
	bg_event 17, 3, 0, BG_EVENT_PLAYER_FACING_NORTH, VerdanturfTown_EventScript_1A00EA
	bg_event 7, 14, 0, BG_EVENT_PLAYER_FACING_ANY, VerdanturfTown_EventScript_14E8D3
	bg_event 13, 3, 0, BG_EVENT_PLAYER_FACING_NORTH, VerdanturfTown_EventScript_1A00E1
	bg_event 18, 3, 0, BG_EVENT_PLAYER_FACING_NORTH, VerdanturfTown_EventScript_1A00EA
	bg_event 3, 8, 0, BG_EVENT_PLAYER_FACING_ANY, VerdanturfTown_EventScript_14E8DC
	bg_event 7, 3, 0, BG_EVENT_PLAYER_FACING_ANY, VerdanturfTown_EventScript_14E8E5

VerdanturfTown_MapEvents:: @ 8380FF8
	map_events VerdanturfTown_EventObjects, VerdanturfTown_MapWarps, 0x0, VerdanturfTown_MapBGEvents
