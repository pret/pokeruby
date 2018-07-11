DewfordTown_Hall_EventObjects:: @ 8386088
	object_event 1, EVENT_OBJ_GFX_GIRL_2, 0, 4, 6, 0, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, DewfordTown_Hall_EventScript_153293, 0
	object_event 2, EVENT_OBJ_GFX_WOMAN_3, 0, 1, 5, 0, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, DewfordTown_Hall_EventScript_1532BC, 0
	object_event 3, EVENT_OBJ_GFX_MAN_1, 0, 5, 4, 0, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, DewfordTown_Hall_EventScript_1532CD, 0
	object_event 4, EVENT_OBJ_GFX_OLD_MAN_1, 0, 9, 3, 0, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, DewfordTown_Hall_EventScript_15330A, 0
	object_event 5, EVENT_OBJ_GFX_LITTLE_GIRL_1, 0, 5, 2, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, DewfordTown_Hall_EventScript_153326, 0
	object_event 6, EVENT_OBJ_GFX_LITTLE_BOY_2, 0, 14, 7, 0, MOVEMENT_TYPE_WANDER_LEFT_AND_RIGHT, 1, 0, 0, 0, DewfordTown_Hall_EventScript_153342, 0
	object_event 7, EVENT_OBJ_GFX_SCHOOL_KID_M, 0, 12, 3, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, DewfordTown_Hall_EventScript_1533F2, 0
	object_event 8, EVENT_OBJ_GFX_PSYCHIC_M, 0, 15, 3, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, DewfordTown_Hall_EventScript_1533FE, 0
	object_event 9, EVENT_OBJ_GFX_MANIAC, 0, 8, 6, 3, MOVEMENT_TYPE_WANDER_LEFT_AND_RIGHT, 1, 0, 0, 0, DewfordTown_Hall_EventScript_15359D, FLAG_HIDE_SLUDGE_BOMB_MAN_DEWFORD_HALL

DewfordTown_Hall_MapWarps:: @ 8386160
	warp_def 5, 8, 0, 0, MAP_DEWFORD_TOWN
	warp_def 6, 8, 0, 0, MAP_DEWFORD_TOWN

DewfordTown_Hall_MapBGEvents:: @ 8386170
	bg_event 0, 1, 3, BG_EVENT_PLAYER_FACING_ANY, DewfordTown_Hall_EventScript_153353
	bg_event 7, 1, 3, BG_EVENT_PLAYER_FACING_ANY, DewfordTown_Hall_EventScript_153363

DewfordTown_Hall_MapEvents:: @ 8386188
	map_events DewfordTown_Hall_EventObjects, DewfordTown_Hall_MapWarps, 0x0, DewfordTown_Hall_MapBGEvents
