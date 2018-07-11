FortreeCity_Gym_EventObjects:: @ 8389018
	object_event 1, EVENT_OBJ_GFX_WINONA, 0, 4, 1, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, FortreeCity_Gym_EventScript_157EF0, 0
	object_event 2, EVENT_OBJ_GFX_MAN_6, 0, 12, 22, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 1, 3, FortreeCity_Gym_EventScript_157F62, 0
	object_event 3, EVENT_OBJ_GFX_CAMPER, 0, 9, 9, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 1, 3, FortreeCity_Gym_EventScript_157F90, 0
	object_event 4, EVENT_OBJ_GFX_PICNICKER, 0, 18, 19, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 1, 4, FortreeCity_Gym_EventScript_157FA7, 0
	object_event 5, EVENT_OBJ_GFX_MAN_6, 0, 18, 1, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 1, 1, FortreeCity_Gym_EventScript_157F79, 0
	object_event 6, EVENT_OBJ_GFX_MAN_2, 0, 2, 19, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, FortreeCity_Gym_EventScript_157FBE, 0

FortreeCity_Gym_MapWarps:: @ 83890A8
	warp_def 2, 24, 0, 2, MAP_FORTREE_CITY
	warp_def 3, 24, 0, 2, MAP_FORTREE_CITY

FortreeCity_Gym_MapBGEvents:: @ 83890B8
	bg_event 1, 21, 0, BG_EVENT_PLAYER_FACING_NORTH, FortreeCity_Gym_EventScript_157FDD
	bg_event 4, 21, 0, BG_EVENT_PLAYER_FACING_NORTH, FortreeCity_Gym_EventScript_157FED

FortreeCity_Gym_MapEvents:: @ 83890D0
	map_events FortreeCity_Gym_EventObjects, FortreeCity_Gym_MapWarps, 0x0, FortreeCity_Gym_MapBGEvents
