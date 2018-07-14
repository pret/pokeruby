MagmaHideout_1F_EventObjects:: @ 838E9BC
	object_event 1, EVENT_OBJ_GFX_VAR_1, 0, 13, 19, 3, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 0, 0, MagmaHideout_1F_EventScript_15D7CE, FLAG_HIDE_GRUNT_1_BLOCKING_HIDEOUT
	object_event 2, EVENT_OBJ_GFX_VAR_1, 0, 14, 19, 3, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 0, 0, MagmaHideout_1F_EventScript_15D7ED, FLAG_HIDE_GRUNT_2_BLOCKING_HIDEOUT
	object_event 3, EVENT_OBJ_GFX_VAR_1, 0, 20, 3, 3, MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_LEFT_UP_RIGHT, 14, 6, 1, 3, MagmaHideout_1F_EventScript_15D80C, 0

MagmaHideout_1F_MapWarps:: @ 838EA04
	warp_def 13, 27, 1, 14, MAP_LILYCOVE_CITY
	warp_def 13, 1, 3, 0, MAP_MAGMA_HIDEOUT_B1F

MagmaHideout_1F_MapEvents:: @ 838EA14
	map_events MagmaHideout_1F_EventObjects, MagmaHideout_1F_MapWarps, 0x0, 0x0
