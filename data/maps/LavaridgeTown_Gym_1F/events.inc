LavaridgeTown_Gym_1F_EventObjects:: @ 838625C
	object_event 1, EVENT_OBJ_GFX_FLANNERY, 0, 8, 10, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, LavaridgeTown_Gym_1F_EventScript_153741, 0
	object_event 2, EVENT_OBJ_GFX_MAN_6, 0, 10, 19, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 3, 1, LavaridgeTown_Gym_1F_EventScript_1537CB, 0
	object_event 3, EVENT_OBJ_GFX_MAN_4, 0, 4, 17, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 3, 1, LavaridgeTown_Gym_1F_EventScript_15383E, 0
	object_event 4, EVENT_OBJ_GFX_MAN_6, 0, 4, 12, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 3, 1, LavaridgeTown_Gym_1F_EventScript_1537ED, 0
	object_event 5, EVENT_OBJ_GFX_GIRL_3, 0, 0, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 3, 1, LavaridgeTown_Gym_1F_EventScript_153823, 0
	object_event 6, EVENT_OBJ_GFX_MAN_2, 0, 6, 23, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, LavaridgeTown_Gym_1F_EventScript_153859, 0
	object_event 7, EVENT_OBJ_GFX_MAN_6, 0, 6, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 3, 1, LavaridgeTown_Gym_1F_EventScript_153808, 0

LavaridgeTown_Gym_1F_MapWarps:: @ 8386304
	warp_def 8, 23, 3, 1, MAP_LAVARIDGE_TOWN
	warp_def 9, 23, 3, 1, MAP_LAVARIDGE_TOWN
	warp_def 3, 21, 3, 0, MAP_LAVARIDGE_TOWN_GYM_B1F
	warp_def 1, 14, 3, 2, MAP_LAVARIDGE_TOWN_GYM_B1F
	warp_def 6, 14, 3, 4, MAP_LAVARIDGE_TOWN_GYM_B1F
	warp_def 1, 6, 3, 3, MAP_LAVARIDGE_TOWN_GYM_B1F
	warp_def 9, 2, 3, 1, MAP_LAVARIDGE_TOWN_GYM_B1F
	warp_def 6, 20, 3, 5, MAP_LAVARIDGE_TOWN_GYM_B1F
	warp_def 0, 23, 3, 6, MAP_LAVARIDGE_TOWN_GYM_B1F
	warp_def 0, 17, 3, 7, MAP_LAVARIDGE_TOWN_GYM_B1F
	warp_def 4, 17, 3, 8, MAP_LAVARIDGE_TOWN_GYM_B1F
	warp_def 0, 11, 3, 9, MAP_LAVARIDGE_TOWN_GYM_B1F
	warp_def 4, 12, 3, 10, MAP_LAVARIDGE_TOWN_GYM_B1F
	warp_def 4, 9, 3, 11, MAP_LAVARIDGE_TOWN_GYM_B1F
	warp_def 0, 2, 3, 12, MAP_LAVARIDGE_TOWN_GYM_B1F
	warp_def 4, 6, 3, 13, MAP_LAVARIDGE_TOWN_GYM_B1F
	warp_def 4, 2, 3, 14, MAP_LAVARIDGE_TOWN_GYM_B1F
	warp_def 10, 19, 3, 15, MAP_LAVARIDGE_TOWN_GYM_B1F
	warp_def 10, 14, 3, 16, MAP_LAVARIDGE_TOWN_GYM_B1F
	warp_def 6, 6, 3, 17, MAP_LAVARIDGE_TOWN_GYM_B1F
	warp_def 6, 2, 3, 18, MAP_LAVARIDGE_TOWN_GYM_B1F
	warp_def 10, 6, 3, 19, MAP_LAVARIDGE_TOWN_GYM_B1F

LavaridgeTown_Gym_1F_MapBGEvents:: @ 83863B4
	bg_event 6, 17, 0, BG_EVENT_PLAYER_FACING_NORTH, LavaridgeTown_Gym_1F_EventScript_153878
	bg_event 10, 17, 0, BG_EVENT_PLAYER_FACING_NORTH, LavaridgeTown_Gym_1F_EventScript_153888

LavaridgeTown_Gym_1F_MapEvents:: @ 83863CC
	map_events LavaridgeTown_Gym_1F_EventObjects, LavaridgeTown_Gym_1F_MapWarps, 0x0, LavaridgeTown_Gym_1F_MapBGEvents
