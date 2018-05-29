MagmaHideout_1F_EventObjects:: @ 838E9BC
	object_event 1, EVENT_OBJ_GFX_VAR_1, 0, 13, 0, 19, 0, 3, 8, 17, 0, 0, 0, 0, 0, MagmaHideout_1F_EventScript_15D7CE, FLAG_HIDE_GRUNT_1_BLOCKING_HIDEOUT, 0, 0
	object_event 2, EVENT_OBJ_GFX_VAR_1, 0, 14, 0, 19, 0, 3, 8, 17, 0, 0, 0, 0, 0, MagmaHideout_1F_EventScript_15D7ED, FLAG_HIDE_GRUNT_2_BLOCKING_HIDEOUT, 0, 0
	object_event 3, EVENT_OBJ_GFX_VAR_1, 0, 20, 0, 3, 0, 3, 50, 110, 0, 1, 0, 3, 0, MagmaHideout_1F_EventScript_15D80C, 0, 0, 0

MagmaHideout_1F_MapWarps:: @ 838EA04
	warp_def 13, 27, 1, 14, MAP_LILYCOVE_CITY
	warp_def 13, 1, 3, 0, MAP_MAGMA_HIDEOUT_B1F

MagmaHideout_1F_MapEvents:: @ 838EA14
	map_events MagmaHideout_1F_EventObjects, MagmaHideout_1F_MapWarps, 0x0, 0x0
