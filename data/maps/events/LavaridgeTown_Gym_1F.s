LavaridgeTown_Gym_1F_MapObjects:: @ 838625C
	object_event 1, MAP_OBJ_GFX_FLANNERY, 0, 8, 0, 10, 0, 3, 8, 0, 0, 0, 0, 0, 0, LavaridgeTown_Gym_1F_EventScript_153741, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_MAN_6, 0, 10, 0, 19, 0, 3, 8, 0, 0, 3, 0, 1, 0, LavaridgeTown_Gym_1F_EventScript_1537CB, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_MAN_4, 0, 4, 0, 17, 0, 3, 8, 0, 0, 3, 0, 1, 0, LavaridgeTown_Gym_1F_EventScript_15383E, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_MAN_6, 0, 4, 0, 12, 0, 3, 8, 0, 0, 3, 0, 1, 0, LavaridgeTown_Gym_1F_EventScript_1537ED, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_GIRL_3, 0, 0, 0, 2, 0, 3, 8, 0, 0, 3, 0, 1, 0, LavaridgeTown_Gym_1F_EventScript_153823, 0, 0, 0
	object_event 6, MAP_OBJ_GFX_MAN_2, 0, 6, 0, 23, 0, 3, 10, 0, 0, 0, 0, 0, 0, LavaridgeTown_Gym_1F_EventScript_153859, 0, 0, 0
	object_event 7, MAP_OBJ_GFX_MAN_6, 0, 6, 0, 2, 0, 3, 8, 0, 0, 3, 0, 1, 0, LavaridgeTown_Gym_1F_EventScript_153808, 0, 0, 0

LavaridgeTown_Gym_1F_MapWarps:: @ 8386304
	warp_def 8, 23, 3, 1, LavaridgeTown
	warp_def 9, 23, 3, 1, LavaridgeTown
	warp_def 3, 21, 3, 0, LavaridgeTown_Gym_B1F
	warp_def 1, 14, 3, 2, LavaridgeTown_Gym_B1F
	warp_def 6, 14, 3, 4, LavaridgeTown_Gym_B1F
	warp_def 1, 6, 3, 3, LavaridgeTown_Gym_B1F
	warp_def 9, 2, 3, 1, LavaridgeTown_Gym_B1F
	warp_def 6, 20, 3, 5, LavaridgeTown_Gym_B1F
	warp_def 0, 23, 3, 6, LavaridgeTown_Gym_B1F
	warp_def 0, 17, 3, 7, LavaridgeTown_Gym_B1F
	warp_def 4, 17, 3, 8, LavaridgeTown_Gym_B1F
	warp_def 0, 11, 3, 9, LavaridgeTown_Gym_B1F
	warp_def 4, 12, 3, 10, LavaridgeTown_Gym_B1F
	warp_def 4, 9, 3, 11, LavaridgeTown_Gym_B1F
	warp_def 0, 2, 3, 12, LavaridgeTown_Gym_B1F
	warp_def 4, 6, 3, 13, LavaridgeTown_Gym_B1F
	warp_def 4, 2, 3, 14, LavaridgeTown_Gym_B1F
	warp_def 10, 19, 3, 15, LavaridgeTown_Gym_B1F
	warp_def 10, 14, 3, 16, LavaridgeTown_Gym_B1F
	warp_def 6, 6, 3, 17, LavaridgeTown_Gym_B1F
	warp_def 6, 2, 3, 18, LavaridgeTown_Gym_B1F
	warp_def 10, 6, 3, 19, LavaridgeTown_Gym_B1F

LavaridgeTown_Gym_1F_MapBGEvents:: @ 83863B4
	bg_event 6, 17, 0, 1, 0, LavaridgeTown_Gym_1F_EventScript_153878
	bg_event 10, 17, 0, 1, 0, LavaridgeTown_Gym_1F_EventScript_153888

LavaridgeTown_Gym_1F_MapEvents:: @ 83863CC
	map_events LavaridgeTown_Gym_1F_MapObjects, LavaridgeTown_Gym_1F_MapWarps, 0x0, LavaridgeTown_Gym_1F_MapBGEvents
