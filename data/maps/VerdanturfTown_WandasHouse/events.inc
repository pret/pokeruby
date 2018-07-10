VerdanturfTown_WandasHouse_EventObjects:: @ 8386CEC
	object_event 1, EVENT_OBJ_GFX_WALLY, 0, 14, 5, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, VerdanturfTown_WandasHouse_EventScript_153F5B, FLAG_HIDE_WALLY_WANDAS_HOUSE
	object_event 2, EVENT_OBJ_GFX_BLACK_BELT, 0, 5, 4, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, VerdanturfTown_WandasHouse_EventScript_153FAF, FLAG_HIDE_BOYFRIEND_WANDAS_HOUSE
	object_event 3, EVENT_OBJ_GFX_MAN_3, 0, 7, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, VerdanturfTown_WandasHouse_EventScript_153F7D, FLAG_HIDE_WALLY_FATHER_WANDAS_HOUSE
	object_event 4, EVENT_OBJ_GFX_WOMAN_2, 0, 2, 4, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, VerdanturfTown_WandasHouse_EventScript_153FEA, 0
	object_event 5, EVENT_OBJ_GFX_WOMAN_3, 0, 5, 5, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, VerdanturfTown_WandasHouse_EventScript_153FB8, FLAG_HIDE_GIRLFRIEND_WANDAS_HOUSE

VerdanturfTown_WandasHouse_MapWarps:: @ 8386D64
	warp_def 7, 7, 0, 3, MAP_VERDANTURF_TOWN
	warp_def 8, 7, 0, 3, MAP_VERDANTURF_TOWN

VerdanturfTown_WandasHouse_MapEvents:: @ 8386D74
	map_events VerdanturfTown_WandasHouse_EventObjects, VerdanturfTown_WandasHouse_MapWarps, 0x0, 0x0
