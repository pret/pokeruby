FortreeCity_Gym_MapObjects:: @ 8389018
	object_event 1, MAP_OBJ_GFX_WINONA, 0, 4, 0, 1, 0, 3, 8, 0, 0, 0, 0, 0, 0, FortreeCity_Gym_EventScript_157EF0, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_MAN_6, 0, 12, 0, 22, 0, 3, 7, 0, 0, 1, 0, 3, 0, FortreeCity_Gym_EventScript_157F62, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_CAMPER, 0, 9, 0, 9, 0, 3, 8, 0, 0, 1, 0, 3, 0, FortreeCity_Gym_EventScript_157F90, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_PICNICKER, 0, 18, 0, 19, 0, 3, 9, 0, 0, 1, 0, 4, 0, FortreeCity_Gym_EventScript_157FA7, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_MAN_6, 0, 18, 0, 1, 0, 3, 8, 0, 0, 1, 0, 1, 0, FortreeCity_Gym_EventScript_157F79, 0, 0, 0
	object_event 6, MAP_OBJ_GFX_MAN_2, 0, 2, 0, 19, 0, 3, 8, 0, 0, 0, 0, 0, 0, FortreeCity_Gym_EventScript_157FBE, 0, 0, 0

FortreeCity_Gym_MapWarps:: @ 83890A8
	warp_def 2, 24, 0, 2, FortreeCity
	warp_def 3, 24, 0, 2, FortreeCity

FortreeCity_Gym_MapBGEvents:: @ 83890B8
	bg_event 1, 21, 0, 1, 0, FortreeCity_Gym_EventScript_157FDD
	bg_event 4, 21, 0, 1, 0, FortreeCity_Gym_EventScript_157FED

FortreeCity_Gym_MapEvents:: @ 83890D0
	map_events FortreeCity_Gym_MapObjects, FortreeCity_Gym_MapWarps, 0x0, FortreeCity_Gym_MapBGEvents
