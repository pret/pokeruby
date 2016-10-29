LittlerootTown_MapObjects:: @ 83808FC
	object_event 1, MAP_OBJ_GFX_LITTLE_BOY_3, 0, 16, 0, 10, 0, 3, 2, 33, 0, 0, 0, 0, 0, LittlerootTown_EventScript_14D6DF, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_FAT_MAN, 0, 12, 0, 13, 0, 3, 2, 18, 0, 0, 0, 0, 0, LittlerootTown_EventScript_14D6CD, 868, 0, 0
	object_event 3, MAP_OBJ_GFX_BOY_2, 0, 14, 0, 17, 0, 3, 2, 18, 0, 0, 0, 0, 0, LittlerootTown_EventScript_14D6D6, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_MOM, 0, 5, 0, 8, 0, 3, 7, 0, 0, 0, 0, 0, 0, LittlerootTown_EventScript_14DCE2, 752, 0, 0
	object_event 5, MAP_OBJ_GFX_TRUCK, 0, 2, 0, 10, 0, 4, 10, 0, 0, 0, 0, 0, 0, 0x0, 761, 0, 0
	object_event 6, MAP_OBJ_GFX_TRUCK, 0, 11, 0, 10, 0, 4, 10, 0, 0, 0, 0, 0, 0, 0x0, 762, 0, 0

LittlerootTown_MapWarps:: @ 838098C
	warp_def 14, 8, 0, 1, LittlerootTown_MaysHouse_1F
	warp_def 5, 8, 0, 1, LittlerootTown_BrendansHouse_1F
	warp_def 7, 16, 0, 0, LittlerootTown_ProfessorBirchsLab

LittlerootTown_MapCoordEvents:: @ 83809A4
	coord_event 10, 1, 3, 0, 0x4050, 0, 0, LittlerootTown_EventScript_14D739
	coord_event 11, 1, 3, 0, 0x4050, 0, 0, LittlerootTown_EventScript_14D797
	coord_event 11, 1, 3, 0, 0x4050, 1, 0, LittlerootTown_EventScript_14D7C7
	coord_event 8, 9, 3, 0, 0x4050, 3, 0, LittlerootTown_EventScript_14D89E
	coord_event 9, 9, 3, 0, 0x4050, 3, 0, LittlerootTown_EventScript_14D8AA
	coord_event 10, 9, 3, 0, 0x4050, 3, 0, LittlerootTown_EventScript_14D886
	coord_event 11, 9, 3, 0, 0x4050, 3, 0, LittlerootTown_EventScript_14D892
	coord_event 10, 2, 3, 0, 0x4050, 3, 0, LittlerootTown_EventScript_14D860
	coord_event 11, 2, 3, 0, 0x4050, 3, 0, LittlerootTown_EventScript_14D873

LittlerootTown_MapBGEvents:: @ 8380A34
	bg_event 15, 13, 0, 0, 0, LittlerootTown_EventScript_14D7F6
	bg_event 6, 17, 0, 0, 0, LittlerootTown_EventScript_14D7FF
	bg_event 7, 8, 3, 0, 0, LittlerootTown_EventScript_14D808
	bg_event 12, 8, 3, 0, 0, LittlerootTown_EventScript_14D834

LittlerootTown_MapEvents:: @ 8380A64
	map_events LittlerootTown_MapObjects, LittlerootTown_MapWarps, LittlerootTown_MapCoordEvents, LittlerootTown_MapBGEvents
