LittlerootTown_BrendansHouse_2F_EventObjects:: @ 8385728
	object_event 1, EVENT_OBJ_GFX_RIVAL_BRENDAN_NORMAL, 0, 0, 2, 3, MOVEMENT_TYPE_FACE_UP, 1, 0, 0, 0, LittlerootTown_BrendansHouse_2F_EventScript_152A9D, FLAG_HIDE_BRENDAN_UPSTAIRS
	object_event 2, EVENT_OBJ_GFX_VAR_0, 0, 0, 0, 0, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, 0x0, FLAG_DECORATION_2
	object_event 3, EVENT_OBJ_GFX_VAR_1, 0, 0, 1, 0, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, 0x0, FLAG_DECORATION_3
	object_event 4, EVENT_OBJ_GFX_VAR_2, 0, 0, 2, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, 0x0, FLAG_DECORATION_4
	object_event 5, EVENT_OBJ_GFX_VAR_3, 0, 0, 3, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, 0x0, FLAG_DECORATION_5
	object_event 6, EVENT_OBJ_GFX_VAR_4, 0, 0, 4, 0, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, 0x0, FLAG_DECORATION_6
	object_event 7, EVENT_OBJ_GFX_VAR_5, 0, 0, 5, 4, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, 0x0, FLAG_DECORATION_7
	object_event 8, EVENT_OBJ_GFX_VAR_6, 0, 1, 0, 0, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, 0x0, FLAG_DECORATION_8
	object_event 9, EVENT_OBJ_GFX_VAR_7, 0, 1, 1, 0, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, 0x0, FLAG_DECORATION_9
	object_event 10, EVENT_OBJ_GFX_VAR_8, 0, 1, 2, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, 0x0, FLAG_DECORATION_10
	object_event 11, EVENT_OBJ_GFX_VAR_9, 0, 1, 3, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, 0x0, FLAG_DECORATION_11
	object_event 12, EVENT_OBJ_GFX_VAR_A, 0, 1, 4, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, 0x0, FLAG_DECORATION_12
	object_event 13, EVENT_OBJ_GFX_VAR_B, 0, 1, 5, 0, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, 0x0, FLAG_DECORATION_13
	object_event 14, EVENT_OBJ_GFX_MOM, 0, 7, 1, 3, MOVEMENT_TYPE_FACE_DOWN, 1, 0, 0, 0, 0x0, FLAG_HIDE_MOM_UPSTAIRS

LittlerootTown_BrendansHouse_2F_MapWarps:: @ 8385878
	warp_def 7, 1, 0, 2, MAP_LITTLEROOT_TOWN_BRENDANS_HOUSE_1F

LittlerootTown_BrendansHouse_2F_MapBGEvents:: @ 8385880
	bg_event 0, 1, 0, BG_EVENT_PLAYER_FACING_NORTH, LittlerootTown_BrendansHouse_2F_EventScript_15281E
	bg_event 1, 1, 0, BG_EVENT_PLAYER_FACING_ANY, LittlerootTown_BrendansHouse_2F_EventScript_152867
	bg_event 5, 1, 0, BG_EVENT_PLAYER_FACING_ANY, LittlerootTown_BrendansHouse_2F_EventScript_1B69D3
	bg_event 3, 1, 0, BG_EVENT_PLAYER_FACING_ANY, LittlerootTown_BrendansHouse_2F_EventScript_152870

LittlerootTown_BrendansHouse_2F_MapEvents:: @ 83858B0
	map_events LittlerootTown_BrendansHouse_2F_EventObjects, LittlerootTown_BrendansHouse_2F_MapWarps, 0x0, LittlerootTown_BrendansHouse_2F_MapBGEvents
