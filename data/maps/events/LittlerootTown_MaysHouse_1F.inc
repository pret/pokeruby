LittlerootTown_MaysHouse_1F_MapObjects:: @ 83858C4
	object_event 1, MAP_OBJ_GFX_MOM, 0, 8, 0, 6, 0, 3, 9, 0, 0, 0, 0, 0, 0, LittlerootTown_MaysHouse_1F_EventScript_1B6BE9, 759, 0, 0
	object_event 2, MAP_OBJ_GFX_MACHOKE_FACING_AWAY, 0, 6, 0, 5, 0, 3, 65, 0, 0, 0, 0, 0, 0, LittlerootTown_MaysHouse_1F_EventScript_1B6CA6, 754, 0, 0
	object_event 3, MAP_OBJ_GFX_MACHOKE_CARRYING_BOX, 0, 9, 0, 3, 0, 3, 27, 3, 0, 0, 0, 0, 0, LittlerootTown_MaysHouse_1F_EventScript_1B6CB9, 755, 0, 0
	object_event 4, MAP_OBJ_GFX_WOMAN_5, 0, 8, 0, 7, 0, 3, 9, 0, 0, 0, 0, 0, 0, LittlerootTown_MaysHouse_1F_EventScript_1529EB, 785, 0, 0
	object_event 5, MAP_OBJ_GFX_NORMAN, 0, 5, 0, 6, 0, 3, 10, 17, 0, 0, 0, 0, 0, 0x0, FLAG_HIDE_NORMAN_LITTLEROOT, 0, 0

LittlerootTown_MaysHouse_1F_MapWarps:: @ 838593C
	warp_def 1, 8, 0, 0, MAP_LITTLEROOT_TOWN
	warp_def 2, 8, 0, 0, MAP_LITTLEROOT_TOWN
	warp_def 2, 2, 0, 0, MAP_LITTLEROOT_TOWN_MAYS_HOUSE_2F

LittlerootTown_MaysHouse_1F_MapCoordEvents:: @ 8385954
	coord_event 2, 8, 0, 0, 0x4092, 4, 0, LittlerootTown_MaysHouse_1F_EventScript_152A35

LittlerootTown_MaysHouse_1F_MapEvents:: @ 8385964
	map_events LittlerootTown_MaysHouse_1F_MapObjects, LittlerootTown_MaysHouse_1F_MapWarps, LittlerootTown_MaysHouse_1F_MapCoordEvents, 0x0
