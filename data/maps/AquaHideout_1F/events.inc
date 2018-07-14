AquaHideout_1F_EventObjects:: @ 838CD0C
	object_event 1, EVENT_OBJ_GFX_VAR_1, 0, 13, 11, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, AquaHideout_1F_EventScript_15D7CE, FLAG_HIDE_GRUNT_1_BLOCKING_HIDEOUT
	object_event 2, EVENT_OBJ_GFX_VAR_1, 0, 14, 11, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, AquaHideout_1F_EventScript_15D7ED, FLAG_HIDE_GRUNT_2_BLOCKING_HIDEOUT
	object_event 3, EVENT_OBJ_GFX_VAR_1, 0, 20, 4, 3, MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_LEFT_UP_RIGHT, 13, 5, 1, 3, AquaHideout_1F_EventScript_15D80C, FLAG_HIDE_GRUNTS_HIDEOUTS

AquaHideout_1F_MapWarps:: @ 838CD54
	warp_def 13, 27, 1, 6, MAP_LILYCOVE_CITY
	warp_def 14, 27, 1, 6, MAP_LILYCOVE_CITY
	warp_def 22, 1, 3, 0, MAP_AQUA_HIDEOUT_B1F

AquaHideout_1F_MapEvents:: @ 838CD6C
	map_events AquaHideout_1F_EventObjects, AquaHideout_1F_MapWarps, 0x0, 0x0
