SootopolisCity_Mart_EventObjects:: @ 838AF38
	object_event 1, EVENT_OBJ_GFX_MART_EMPLOYEE, 0, 1, 3, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, SootopolisCity_Mart_EventScript_15B21B, 0
	object_event 2, EVENT_OBJ_GFX_FAT_MAN, 0, 5, 5, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, SootopolisCity_Mart_EventScript_15B24A, 0
	object_event 3, EVENT_OBJ_GFX_GENTLEMAN, 0, 9, 5, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, SootopolisCity_Mart_EventScript_15B272, 0

SootopolisCity_Mart_MapWarps:: @ 838AF80
	warp_def 3, 7, 0, 1, MAP_SOOTOPOLIS_CITY
	warp_def 4, 7, 0, 1, MAP_SOOTOPOLIS_CITY

SootopolisCity_Mart_MapEvents:: @ 838AF90
	map_events SootopolisCity_Mart_EventObjects, SootopolisCity_Mart_MapWarps, 0x0, 0x0
