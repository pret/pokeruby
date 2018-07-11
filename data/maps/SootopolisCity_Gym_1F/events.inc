SootopolisCity_Gym_1F_EventObjects:: @ 838ACF0
	object_event 1, EVENT_OBJ_GFX_WALLACE, 0, 8, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, SootopolisCity_Gym_1F_EventScript_15AFFF, FLAG_HIDE_WALLACE_SOOTOPOLIS_GYM
	object_event 2, EVENT_OBJ_GFX_MAN_2, 0, 7, 24, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, SootopolisCity_Gym_1F_EventScript_15B084, 0

SootopolisCity_Gym_1F_MapWarps:: @ 838AD20
	warp_def 8, 25, 0, 2, MAP_SOOTOPOLIS_CITY
	warp_def 9, 25, 0, 2, MAP_SOOTOPOLIS_CITY
	warp_def 11, 22, 3, 0, MAP_SOOTOPOLIS_CITY_GYM_B1F

SootopolisCity_Gym_1F_MapBGEvents:: @ 838AD38
	bg_event 6, 24, 0, BG_EVENT_PLAYER_FACING_ANY, SootopolisCity_Gym_1F_EventScript_15B0A3
	bg_event 10, 24, 0, BG_EVENT_PLAYER_FACING_NORTH, SootopolisCity_Gym_1F_EventScript_15B0B3

SootopolisCity_Gym_1F_MapEvents:: @ 838AD50
	map_events SootopolisCity_Gym_1F_EventObjects, SootopolisCity_Gym_1F_MapWarps, 0x0, SootopolisCity_Gym_1F_MapBGEvents
