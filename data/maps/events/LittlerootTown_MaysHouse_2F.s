LittlerootTown_MaysHouse_2F_MapObjects:: @ 8385978
	object_event 1, MAP_OBJ_GFX_RIVAL_MAY_NORMAL, 0, 8, 0, 2, 0, 3, 7, 1, 0, 0, 0, 0, 0, LittlerootTown_MaysHouse_2F_EventScript_152A9D, 722, 0, 0
	object_event 2, 240, 0, 0, 0, 6, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0x0, 174, 0, 0
	object_event 3, 241, 0, 1, 0, 6, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0x0, 175, 0, 0
	object_event 4, 242, 0, 2, 0, 6, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0x0, 176, 0, 0
	object_event 5, 243, 0, 3, 0, 6, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0x0, 177, 0, 0
	object_event 6, 244, 0, 4, 0, 6, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0x0, 178, 0, 0
	object_event 7, 245, 0, 5, 0, 6, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0x0, 179, 0, 0
	object_event 8, 246, 0, 0, 0, 7, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0x0, 180, 0, 0
	object_event 9, 247, 0, 1, 0, 7, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0x0, 181, 0, 0
	object_event 10, 248, 0, 2, 0, 7, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0x0, 182, 0, 0
	object_event 11, 249, 0, 3, 0, 7, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0x0, 183, 0, 0
	object_event 12, 250, 0, 4, 0, 7, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0x0, 184, 0, 0
	object_event 13, 251, 0, 5, 0, 7, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0x0, 185, 0, 0
	object_event 14, MAP_OBJ_GFX_MOM, 0, 1, 0, 1, 0, 3, 8, 1, 0, 0, 0, 0, 0, 0x0, 757, 0, 0
	object_event 15, MAP_OBJ_GFX_PICHU_DOLL, 0, 3, 0, 4, 0, 4, 8, 17, 0, 0, 0, 0, 0, 0x0, 849, 0, 0

LittlerootTown_MaysHouse_2F_MapWarps:: @ 8385AE0
	warp_def 1, 1, 0, 2, LittlerootTown_MaysHouse_1F

LittlerootTown_MaysHouse_2F_MapBGEvents:: @ 8385AE8
	bg_event 5, 1, 0, 0, 0, LittlerootTown_MaysHouse_2F_EventScript_152870
	bg_event 7, 1, 0, 0, 0, LittlerootTown_MaysHouse_2F_EventScript_152867
	bg_event 3, 1, 0, 0, 0, LittlerootTown_MaysHouse_2F_EventScript_1B69DF
	bg_event 8, 1, 0, 0, 0, LittlerootTown_MaysHouse_2F_EventScript_152C39

LittlerootTown_MaysHouse_2F_MapEvents:: @ 8385B18
	map_events LittlerootTown_MaysHouse_2F_MapObjects, LittlerootTown_MaysHouse_2F_MapWarps, 0x0, LittlerootTown_MaysHouse_2F_MapBGEvents

