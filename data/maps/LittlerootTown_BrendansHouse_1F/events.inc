LittlerootTown_BrendansHouse_1F_EventObjects:: @ 8385674
	object_event 1, EVENT_OBJ_GFX_MOM, 0, 2, 6, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, LittlerootTown_BrendansHouse_1F_EventScript_1B6BE9, FLAG_HIDE_BRENDAN_MOM_DOWNSTAIRS
	object_event 2, EVENT_OBJ_GFX_MACHOKE_CARRYING_BOX, 0, 1, 3, 3, MOVEMENT_TYPE_WALK_RIGHT_AND_LEFT, 3, 0, 0, 0, LittlerootTown_BrendansHouse_1F_EventScript_1B6CB9, FLAG_HIDE_MACHOKE_MOVER_2
	object_event 3, EVENT_OBJ_GFX_MACHOKE_FACING_AWAY, 0, 4, 5, 3, MOVEMENT_TYPE_WALK_IN_PLACE_UP, 0, 0, 0, 0, LittlerootTown_BrendansHouse_1F_EventScript_1B6CA6, FLAG_HIDE_MACHOKE_MOVER_1
	object_event 4, EVENT_OBJ_GFX_WOMAN_5, 0, 2, 7, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, LittlerootTown_BrendansHouse_1F_EventScript_1529EB, FLAG_HIDE_BRENDAN_MOM
	object_event 5, EVENT_OBJ_GFX_NORMAN, 0, 5, 6, 3, MOVEMENT_TYPE_FACE_LEFT, 1, 1, 0, 0, 0x0, FLAG_HIDE_NORMAN_LITTLEROOT

LittlerootTown_BrendansHouse_1F_MapWarps:: @ 83856EC
	warp_def 9, 8, 0, 1, MAP_LITTLEROOT_TOWN
	warp_def 8, 8, 0, 1, MAP_LITTLEROOT_TOWN
	warp_def 8, 2, 0, 0, MAP_LITTLEROOT_TOWN_BRENDANS_HOUSE_2F

LittlerootTown_BrendansHouse_1F_MapCoordEvents:: @ 8385704
	coord_event 8, 8, 0, VAR_LITTLEROOT_INTRO_STATE, 4, LittlerootTown_BrendansHouse_1F_EventScript_152789

LittlerootTown_BrendansHouse_1F_MapEvents:: @ 8385714
	map_events LittlerootTown_BrendansHouse_1F_EventObjects, LittlerootTown_BrendansHouse_1F_MapWarps, LittlerootTown_BrendansHouse_1F_MapCoordEvents, 0x0
