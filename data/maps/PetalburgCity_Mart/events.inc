PetalburgCity_Mart_EventObjects:: @ 8387614
	object_event 1, EVENT_OBJ_GFX_MART_EMPLOYEE, 0, 1, 3, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, PetalburgCity_Mart_EventScript_1552B0, 0
	object_event 2, EVENT_OBJ_GFX_MAN_1, 0, 9, 4, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, PetalburgCity_Mart_EventScript_15532C, 0
	object_event 3, EVENT_OBJ_GFX_BOY_1, 0, 6, 3, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, PetalburgCity_Mart_EventScript_155323, 0
	object_event 4, EVENT_OBJ_GFX_WOMAN_3, 0, 5, 5, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, PetalburgCity_Mart_EventScript_15531A, 0

PetalburgCity_Mart_MapWarps:: @ 8387674
	warp_def 3, 7, 0, 5, MAP_PETALBURG_CITY
	warp_def 4, 7, 0, 5, MAP_PETALBURG_CITY

PetalburgCity_Mart_MapEvents:: @ 8387684
	map_events PetalburgCity_Mart_EventObjects, PetalburgCity_Mart_MapWarps, 0x0, 0x0
