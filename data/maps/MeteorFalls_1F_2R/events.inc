MeteorFalls_1F_2R_EventObjects:: @ 838BC20
	object_event 1, EVENT_OBJ_GFX_MAN_4, 0, 13, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 1, 1, MeteorFalls_1F_2R_EventScript_15C679, 0
	object_event 2, EVENT_OBJ_GFX_OLD_MAN_1, 0, 6, 12, 3, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 1, 0, MeteorFalls_1F_2R_EventScript_15C6B7, 0
	object_event 3, EVENT_OBJ_GFX_OLD_WOMAN_1, 0, 7, 12, 3, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 1, 0, MeteorFalls_1F_2R_EventScript_15C6FD, 0

MeteorFalls_1F_2R_MapWarps:: @ 838BC68
	warp_def 10, 29, 3, 2, MAP_METEOR_FALLS_1F_1R
	warp_def 4, 14, 3, 0, MAP_METEOR_FALLS_B1F_1R
	warp_def 7, 20, 3, 1, MAP_METEOR_FALLS_B1F_1R
	warp_def 21, 23, 3, 2, MAP_METEOR_FALLS_B1F_1R

MeteorFalls_1F_2R_MapBGEvents:: @ 838BC88
	bg_event 38, 9, 0, BG_EVENT_PLAYER_FACING_NORTH, MeteorFalls_1F_2R_EventScript_14E842
	bg_event 9, 58, 0, BG_EVENT_PLAYER_FACING_ANY, 0x0

MeteorFalls_1F_2R_MapEvents:: @ 838BCA0
	map_events MeteorFalls_1F_2R_EventObjects, MeteorFalls_1F_2R_MapWarps, 0x0, MeteorFalls_1F_2R_MapBGEvents
