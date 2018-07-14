DewfordTown_Gym_EventObjects:: @ 8385FBC
	object_event 1, EVENT_OBJ_GFX_BRAWLY, 0, 14, 4, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, DewfordTown_Gym_EventScript_153152, 0
	object_event 2, EVENT_OBJ_GFX_BLACK_BELT, 0, 2, 17, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 1, 3, DewfordTown_Gym_EventScript_1531D9, 0
	object_event 3, EVENT_OBJ_GFX_GIRL_3, 0, 1, 10, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 1, 3, DewfordTown_Gym_EventScript_1531FB, 0
	object_event 4, EVENT_OBJ_GFX_GIRL_3, 0, 12, 24, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 1, 2, DewfordTown_Gym_EventScript_15321D, 0
	object_event 5, EVENT_OBJ_GFX_MAN_2, 0, 5, 24, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, DewfordTown_Gym_EventScript_15323F, 0

DewfordTown_Gym_MapWarps:: @ 8386034
	warp_def 5, 27, 0, 2, MAP_DEWFORD_TOWN
	warp_def 6, 27, 0, 2, MAP_DEWFORD_TOWN

DewfordTown_Gym_MapBGEvents:: @ 8386044
	bg_event 7, 21, 0, BG_EVENT_PLAYER_FACING_NORTH, DewfordTown_Gym_EventScript_15325E
	bg_event 10, 21, 0, BG_EVENT_PLAYER_FACING_NORTH, DewfordTown_Gym_EventScript_15326E
	bg_event 4, 24, 0, BG_EVENT_PLAYER_FACING_NORTH, DewfordTown_Gym_EventScript_15325E
	bg_event 7, 24, 0, BG_EVENT_PLAYER_FACING_NORTH, DewfordTown_Gym_EventScript_15326E

DewfordTown_Gym_MapEvents:: @ 8386074
	map_events DewfordTown_Gym_EventObjects, DewfordTown_Gym_MapWarps, 0x0, DewfordTown_Gym_MapBGEvents
