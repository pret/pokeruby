LittlerootTown_MaysHouse_1F_EventObjects:: @ 83858C4
	object_event 1, EVENT_OBJ_GFX_MOM, 0, 8, 6, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, LittlerootTown_MaysHouse_1F_EventScript_1B6BE9, FLAG_HIDE_MAY_MOM_DOWNSTAIRS
	object_event 2, EVENT_OBJ_GFX_MACHOKE_FACING_AWAY, 0, 6, 5, 3, MOVEMENT_TYPE_WALK_IN_PLACE_UP, 0, 0, 0, 0, LittlerootTown_MaysHouse_1F_EventScript_1B6CA6, FLAG_HIDE_MACHOKE_MOVER_1
	object_event 3, EVENT_OBJ_GFX_MACHOKE_CARRYING_BOX, 0, 9, 3, 3, MOVEMENT_TYPE_WALK_LEFT_AND_RIGHT, 3, 0, 0, 0, LittlerootTown_MaysHouse_1F_EventScript_1B6CB9, FLAG_HIDE_MACHOKE_MOVER_2
	object_event 4, EVENT_OBJ_GFX_WOMAN_5, 0, 8, 7, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, LittlerootTown_MaysHouse_1F_EventScript_1529EB, FLAG_HIDE_MAY_MOM
	object_event 5, EVENT_OBJ_GFX_NORMAN, 0, 5, 6, 3, MOVEMENT_TYPE_FACE_RIGHT, 1, 1, 0, 0, 0x0, FLAG_HIDE_NORMAN_LITTLEROOT

LittlerootTown_MaysHouse_1F_MapWarps:: @ 838593C
	warp_def 1, 8, 0, 0, MAP_LITTLEROOT_TOWN
	warp_def 2, 8, 0, 0, MAP_LITTLEROOT_TOWN
	warp_def 2, 2, 0, 0, MAP_LITTLEROOT_TOWN_MAYS_HOUSE_2F

LittlerootTown_MaysHouse_1F_MapCoordEvents:: @ 8385954
	coord_event 2, 8, 0, VAR_LITTLEROOT_INTRO_STATE, 4, LittlerootTown_MaysHouse_1F_EventScript_152A35

LittlerootTown_MaysHouse_1F_MapEvents:: @ 8385964
	map_events LittlerootTown_MaysHouse_1F_EventObjects, LittlerootTown_MaysHouse_1F_MapWarps, LittlerootTown_MaysHouse_1F_MapCoordEvents, 0x0
