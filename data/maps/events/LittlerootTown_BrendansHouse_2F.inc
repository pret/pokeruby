LittlerootTown_BrendansHouse_2F_MapObjects:: @ 8385728
	object_event 1, MAP_OBJ_GFX_RIVAL_BRENDAN_NORMAL, 0, 0, 0, 2, 0, 3, 7, 1, 0, 0, 0, 0, 0, LittlerootTown_BrendansHouse_2F_EventScript_152A9D, 760, 0, 0
	object_event 2, 240, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0x0, FLAG_DECORATION_2, 0, 0
	object_event 3, 241, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0x0, FLAG_DECORATION_3, 0, 0
	object_event 4, 242, 0, 0, 0, 2, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0x0, FLAG_DECORATION_4, 0, 0
	object_event 5, 243, 0, 0, 0, 3, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0x0, FLAG_DECORATION_5, 0, 0
	object_event 6, 244, 0, 0, 0, 4, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0x0, FLAG_DECORATION_6, 0, 0
	object_event 7, 245, 0, 0, 0, 5, 0, 4, 1, 0, 0, 0, 0, 0, 0, 0x0, FLAG_DECORATION_7, 0, 0
	object_event 8, 246, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0x0, FLAG_DECORATION_8, 0, 0
	object_event 9, 247, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0x0, FLAG_DECORATION_9, 0, 0
	object_event 10, 248, 0, 1, 0, 2, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0x0, FLAG_DECORATION_10, 0, 0
	object_event 11, 249, 0, 1, 0, 3, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0x0, FLAG_DECORATION_11, 0, 0
	object_event 12, 250, 0, 1, 0, 4, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0x0, FLAG_DECORATION_12, 0, 0
	object_event 13, 251, 0, 1, 0, 5, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0x0, FLAG_DECORATION_13, 0, 0
	object_event 14, MAP_OBJ_GFX_MOM, 0, 7, 0, 1, 0, 3, 8, 1, 0, 0, 0, 0, 0, 0x0, 757, 0, 0

LittlerootTown_BrendansHouse_2F_MapWarps:: @ 8385878
	warp_def 7, 1, 0, 2, MAP_LITTLEROOT_TOWN_BRENDANS_HOUSE_1F

LittlerootTown_BrendansHouse_2F_MapBGEvents:: @ 8385880
	bg_event 0, 1, 0, 1, 0, LittlerootTown_BrendansHouse_2F_EventScript_15281E
	bg_event 1, 1, 0, 0, 0, LittlerootTown_BrendansHouse_2F_EventScript_152867
	bg_event 5, 1, 0, 0, 0, LittlerootTown_BrendansHouse_2F_EventScript_1B69D3
	bg_event 3, 1, 0, 0, 0, LittlerootTown_BrendansHouse_2F_EventScript_152870

LittlerootTown_BrendansHouse_2F_MapEvents:: @ 83858B0
	map_events LittlerootTown_BrendansHouse_2F_MapObjects, LittlerootTown_BrendansHouse_2F_MapWarps, 0x0, LittlerootTown_BrendansHouse_2F_MapBGEvents
