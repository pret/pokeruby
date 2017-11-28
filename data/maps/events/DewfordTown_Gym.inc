DewfordTown_Gym_MapObjects:: @ 8385FBC
	object_event 1, MAP_OBJ_GFX_BRAWLY, 0, 14, 0, 4, 0, 3, 8, 0, 0, 0, 0, 0, 0, DewfordTown_Gym_EventScript_153152, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_BLACK_BELT, 0, 2, 0, 17, 0, 3, 7, 0, 0, 1, 0, 3, 0, DewfordTown_Gym_EventScript_1531D9, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_GIRL_3, 0, 1, 0, 10, 0, 3, 7, 0, 0, 1, 0, 3, 0, DewfordTown_Gym_EventScript_1531FB, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_GIRL_3, 0, 12, 0, 24, 0, 3, 7, 0, 0, 1, 0, 2, 0, DewfordTown_Gym_EventScript_15321D, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_MAN_2, 0, 5, 0, 24, 0, 3, 8, 0, 0, 0, 0, 0, 0, DewfordTown_Gym_EventScript_15323F, 0, 0, 0

DewfordTown_Gym_MapWarps:: @ 8386034
	warp_def 5, 27, 0, 2, MAP_DEWFORD_TOWN
	warp_def 6, 27, 0, 2, MAP_DEWFORD_TOWN

DewfordTown_Gym_MapBGEvents:: @ 8386044
	bg_event 7, 21, 0, 1, 0, DewfordTown_Gym_EventScript_15325E
	bg_event 10, 21, 0, 1, 0, DewfordTown_Gym_EventScript_15326E
	bg_event 4, 24, 0, 1, 0, DewfordTown_Gym_EventScript_15325E
	bg_event 7, 24, 0, 1, 0, DewfordTown_Gym_EventScript_15326E

DewfordTown_Gym_MapEvents:: @ 8386074
	map_events DewfordTown_Gym_MapObjects, DewfordTown_Gym_MapWarps, 0x0, DewfordTown_Gym_MapBGEvents
