SootopolisCity_Gym_1F_MapObjects:: @ 838ACF0
	object_event 1, MAP_OBJ_GFX_WALLACE, 0, 8, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, SootopolisCity_Gym_1F_EventScript_15AFFF, 815, 0, 0
	object_event 2, MAP_OBJ_GFX_MAN_2, 0, 7, 0, 24, 0, 3, 8, 0, 0, 0, 0, 0, 0, SootopolisCity_Gym_1F_EventScript_15B084, 0, 0, 0

SootopolisCity_Gym_1F_MapWarps:: @ 838AD20
	warp_def 8, 25, 0, 2, SootopolisCity
	warp_def 9, 25, 0, 2, SootopolisCity
	warp_def 11, 22, 3, 0, SootopolisCity_Gym_B1F

SootopolisCity_Gym_1F_MapBGEvents:: @ 838AD38
	bg_event 6, 24, 0, 0, 0, SootopolisCity_Gym_1F_EventScript_15B0A3
	bg_event 10, 24, 0, 1, 0, SootopolisCity_Gym_1F_EventScript_15B0B3

SootopolisCity_Gym_1F_MapEvents:: @ 838AD50
	map_events SootopolisCity_Gym_1F_MapObjects, SootopolisCity_Gym_1F_MapWarps, 0x0, SootopolisCity_Gym_1F_MapBGEvents

