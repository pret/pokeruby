DewfordTown_Hall_MapObjects:: @ 8386088
	object_event 1, MAP_OBJ_GFX_GIRL_2, 0, 4, 0, 6, 0, 0, 7, 0, 0, 0, 0, 0, 0, DewfordTown_Hall_EventScript_153293, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_WOMAN_3, 0, 1, 0, 5, 0, 0, 10, 0, 0, 0, 0, 0, 0, DewfordTown_Hall_EventScript_1532BC, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_MAN_1, 0, 5, 0, 4, 0, 0, 9, 0, 0, 0, 0, 0, 0, DewfordTown_Hall_EventScript_1532CD, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_OLD_MAN_1, 0, 9, 0, 3, 0, 0, 7, 0, 0, 0, 0, 0, 0, DewfordTown_Hall_EventScript_15330A, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_LITTLE_GIRL_1, 0, 5, 0, 2, 0, 3, 7, 0, 0, 0, 0, 0, 0, DewfordTown_Hall_EventScript_153326, 0, 0, 0
	object_event 6, MAP_OBJ_GFX_LITTLE_BOY_2, 0, 14, 0, 7, 0, 0, 5, 1, 0, 0, 0, 0, 0, DewfordTown_Hall_EventScript_153342, 0, 0, 0
	object_event 7, MAP_OBJ_GFX_SCHOOL_KID_M, 0, 12, 0, 3, 0, 3, 10, 0, 0, 0, 0, 0, 0, DewfordTown_Hall_EventScript_1533F2, 0, 0, 0
	object_event 8, MAP_OBJ_GFX_PSYCHIC_M, 0, 15, 0, 3, 0, 3, 9, 0, 0, 0, 0, 0, 0, DewfordTown_Hall_EventScript_1533FE, 0, 0, 0
	object_event 9, MAP_OBJ_GFX_MANIAC, 0, 8, 0, 6, 0, 3, 5, 1, 0, 0, 0, 0, 0, DewfordTown_Hall_EventScript_15359D, 940, 0, 0

DewfordTown_Hall_MapWarps:: @ 8386160
	warp_def 5, 8, 0, 0, DewfordTown
	warp_def 6, 8, 0, 0, DewfordTown

DewfordTown_Hall_MapBGEvents:: @ 8386170
	bg_event 0, 1, 3, 0, 0, DewfordTown_Hall_EventScript_153353
	bg_event 7, 1, 3, 0, 0, DewfordTown_Hall_EventScript_153363

DewfordTown_Hall_MapEvents:: @ 8386188
	map_events DewfordTown_Hall_MapObjects, DewfordTown_Hall_MapWarps, 0x0, DewfordTown_Hall_MapBGEvents

