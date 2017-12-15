VerdanturfTown_WandasHouse_MapObjects:: @ 8386CEC
	object_event 1, MAP_OBJ_GFX_WALLY, 0, 14, 0, 5, 0, 3, 2, 17, 0, 0, 0, 0, 0, VerdanturfTown_WandasHouse_EventScript_153F5B, FLAG_HIDE_WALLY_WANDAS_HOUSE, 0, 0
	object_event 2, MAP_OBJ_GFX_BLACK_BELT, 0, 5, 0, 4, 0, 3, 8, 0, 0, 0, 0, 0, 0, VerdanturfTown_WandasHouse_EventScript_153FAF, FLAG_HIDE_BOYFRIEND_WANDAS_HOUSE, 0, 0
	object_event 3, MAP_OBJ_GFX_MAN_3, 0, 7, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, VerdanturfTown_WandasHouse_EventScript_153F7D, FLAG_HIDE_WALLY_FATHER_WANDAS_HOUSE, 0, 0
	object_event 4, MAP_OBJ_GFX_WOMAN_2, 0, 2, 0, 4, 0, 3, 10, 0, 0, 0, 0, 0, 0, VerdanturfTown_WandasHouse_EventScript_153FEA, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_WOMAN_3, 0, 5, 0, 5, 0, 3, 9, 0, 0, 0, 0, 0, 0, VerdanturfTown_WandasHouse_EventScript_153FB8, FLAG_HIDE_GIRLFRIEND_WANDAS_HOUSE, 0, 0

VerdanturfTown_WandasHouse_MapWarps:: @ 8386D64
	warp_def 7, 7, 0, 3, MAP_VERDANTURF_TOWN
	warp_def 8, 7, 0, 3, MAP_VERDANTURF_TOWN

VerdanturfTown_WandasHouse_MapEvents:: @ 8386D74
	map_events VerdanturfTown_WandasHouse_MapObjects, VerdanturfTown_WandasHouse_MapWarps, 0x0, 0x0
