SootopolisCity_Mart_MapObjects:: @ 838AF38
	object_event 1, MAP_OBJ_GFX_MART_EMPLOYEE, 0, 1, 0, 3, 0, 3, 10, 0, 0, 0, 0, 0, 0, SootopolisCity_Mart_EventScript_15B21B, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_FAT_MAN, 0, 5, 0, 5, 0, 3, 10, 0, 0, 0, 0, 0, 0, SootopolisCity_Mart_EventScript_15B24A, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_GENTLEMAN, 0, 9, 0, 5, 0, 3, 10, 0, 0, 0, 0, 0, 0, SootopolisCity_Mart_EventScript_15B272, 0, 0, 0

SootopolisCity_Mart_MapWarps:: @ 838AF80
	warp_def 3, 7, 0, 1, SootopolisCity
	warp_def 4, 7, 0, 1, SootopolisCity

SootopolisCity_Mart_MapEvents:: @ 838AF90
	map_events SootopolisCity_Mart_MapObjects, SootopolisCity_Mart_MapWarps, 0x0, 0x0
