AquaHideout_1F_MapObjects:: @ 838CD0C
	object_event 1, 241, 0, 13, 0, 11, 0, 3, 8, 0, 0, 0, 0, 0, 0, AquaHideout_1F_EventScript_15D7CE, 821, 0, 0
	object_event 2, 241, 0, 14, 0, 11, 0, 3, 8, 0, 0, 0, 0, 0, 0, AquaHideout_1F_EventScript_15D7ED, 822, 0, 0
	object_event 3, 241, 0, 20, 0, 4, 0, 3, 50, 93, 0, 1, 0, 3, 0, AquaHideout_1F_EventScript_15D80C, 924, 0, 0

AquaHideout_1F_MapWarps:: @ 838CD54
	warp_def 13, 27, 1, 6, MAP_LILYCOVE_CITY
	warp_def 14, 27, 1, 6, MAP_LILYCOVE_CITY
	warp_def 22, 1, 3, 0, MAP_AQUA_HIDEOUT_B1F

AquaHideout_1F_MapEvents:: @ 838CD6C
	map_events AquaHideout_1F_MapObjects, AquaHideout_1F_MapWarps, 0x0, 0x0
