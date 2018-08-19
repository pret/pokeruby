FallarborTown_Mart_EventObjects:: @ 838666C
	object_event 1, EVENT_OBJ_GFX_MART_EMPLOYEE, 0, 1, 3, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, FallarborTown_Mart_EventScript_153967, 0
	object_event 2, EVENT_OBJ_GFX_WOMAN_3, 0, 5, 3, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, FallarborTown_Mart_EventScript_15399C, 0
	object_event 3, EVENT_OBJ_GFX_MAN_3, 0, 9, 6, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, FallarborTown_Mart_EventScript_1539A5, 0
	object_event 4, EVENT_OBJ_GFX_SKITTY, 0, 2, 5, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, FallarborTown_Mart_EventScript_1539AE, 0

FallarborTown_Mart_MapWarps:: @ 83866CC
	warp_def 3, 7, 0, 0, MAP_FALLARBOR_TOWN
	warp_def 4, 7, 0, 0, MAP_FALLARBOR_TOWN

FallarborTown_Mart_MapEvents:: @ 83866DC
	map_events FallarborTown_Mart_EventObjects, FallarborTown_Mart_MapWarps, 0x0, 0x0
