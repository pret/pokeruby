LittlerootTown_EventObjects:: @ 83808FC
	object_event 1, EVENT_OBJ_GFX_LITTLE_BOY_3, 0, 16, 10, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 2, 0, 0, LittlerootTown_EventScript_14D6DF, 0
	object_event 2, EVENT_OBJ_GFX_FAT_MAN, 0, 12, 13, 3, MOVEMENT_TYPE_WANDER_AROUND, 2, 1, 0, 0, LittlerootTown_EventScript_14D6CD, FLAG_HIDE_FAT_MAN_LITTLEROOT
	object_event 3, EVENT_OBJ_GFX_BOY_2, 0, 14, 17, 3, MOVEMENT_TYPE_WANDER_AROUND, 2, 1, 0, 0, LittlerootTown_EventScript_14D6D6, 0
	object_event 4, EVENT_OBJ_GFX_MOM, 0, 5, 8, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, LittlerootTown_EventScript_14DCE2, FLAG_HIDE_MOM_LITTLEROOT
	object_event 5, EVENT_OBJ_GFX_TRUCK, 0, 2, 10, 4, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, 0x0, FLAG_HIDE_MOVING_TRUCK_BRENDAN
	object_event 6, EVENT_OBJ_GFX_TRUCK, 0, 11, 10, 4, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, 0x0, FLAG_HIDE_MOVING_TRUCK_MAY

LittlerootTown_MapWarps:: @ 838098C
	warp_def 14, 8, 0, 1, MAP_LITTLEROOT_TOWN_MAYS_HOUSE_1F
	warp_def 5, 8, 0, 1, MAP_LITTLEROOT_TOWN_BRENDANS_HOUSE_1F
	warp_def 7, 16, 0, 0, MAP_LITTLEROOT_TOWN_PROFESSOR_BIRCHS_LAB

LittlerootTown_MapCoordEvents:: @ 83809A4
	coord_event 10, 1, 3, VAR_LITTLEROOT_STATE, 0, LittlerootTown_EventScript_14D739
	coord_event 11, 1, 3, VAR_LITTLEROOT_STATE, 0, LittlerootTown_EventScript_14D797
	coord_event 11, 1, 3, VAR_LITTLEROOT_STATE, 1, LittlerootTown_EventScript_14D7C7
	coord_event 8, 9, 3, VAR_LITTLEROOT_STATE, 3, LittlerootTown_EventScript_14D89E
	coord_event 9, 9, 3, VAR_LITTLEROOT_STATE, 3, LittlerootTown_EventScript_14D8AA
	coord_event 10, 9, 3, VAR_LITTLEROOT_STATE, 3, LittlerootTown_EventScript_14D886
	coord_event 11, 9, 3, VAR_LITTLEROOT_STATE, 3, LittlerootTown_EventScript_14D892
	coord_event 10, 2, 3, VAR_LITTLEROOT_STATE, 3, LittlerootTown_EventScript_14D860
	coord_event 11, 2, 3, VAR_LITTLEROOT_STATE, 3, LittlerootTown_EventScript_14D873

LittlerootTown_MapBGEvents:: @ 8380A34
	bg_event 15, 13, 0, BG_EVENT_PLAYER_FACING_ANY, LittlerootTown_EventScript_14D7F6
	bg_event 6, 17, 0, BG_EVENT_PLAYER_FACING_ANY, LittlerootTown_EventScript_14D7FF
	bg_event 7, 8, 3, BG_EVENT_PLAYER_FACING_ANY, LittlerootTown_EventScript_14D808
	bg_event 12, 8, 3, BG_EVENT_PLAYER_FACING_ANY, LittlerootTown_EventScript_14D834

LittlerootTown_MapEvents:: @ 8380A64
	map_events LittlerootTown_EventObjects, LittlerootTown_MapWarps, LittlerootTown_MapCoordEvents, LittlerootTown_MapBGEvents
