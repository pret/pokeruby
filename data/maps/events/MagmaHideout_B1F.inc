MagmaHideout_B1F_MapObjects:: @ 838EA28
	object_event 1, 241, 0, 33, 0, 3, 0, 3, 9, 17, 0, 1, 0, 5, 0, MagmaHideout_B1F_EventScript_15D850, 0, 0, 0
	object_event 2, 241, 0, 41, 0, 17, 0, 3, 23, 17, 0, 1, 0, 3, 0, MagmaHideout_B1F_EventScript_15D875, 0, 0, 0
	object_event 3, 242, 0, 33, 0, 19, 0, 3, 27, 20, 0, 1, 0, 3, 0, MagmaHideout_B1F_EventScript_15D89A, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_ITEM_BALL, 0, 26, 0, 10, 0, 3, 1, 17, 0, 0, 0, 0, 0, MagmaHideout_B1F_EventScript_1B19C2, FLAG_ITEM_MAGMA_HIDEOUT_B1F_1, 0, 0
	object_event 5, MAP_OBJ_GFX_ITEM_BALL, 0, 14, 0, 18, 0, 3, 1, 17, 0, 0, 0, 0, 0, MagmaHideout_B1F_EventScript_1B19DC, FLAG_ITEM_MAGMA_HIDEOUT_B1F_2, 0, 0
	object_event 6, MAP_OBJ_GFX_ITEM_BALL, 0, 27, 0, 10, 0, 3, 1, 17, 0, 0, 0, 0, 0, MagmaHideout_B1F_EventScript_1A04FD, FLAG_HIDE_ELECTRODE_1_HIDEOUT, 0, 0
	object_event 7, MAP_OBJ_GFX_ITEM_BALL, 0, 26, 0, 11, 0, 3, 1, 17, 0, 0, 0, 0, 0, MagmaHideout_B1F_EventScript_1B19CF, FLAG_ITEM_MAGMA_HIDEOUT_B1F_3, 0, 0
	object_event 8, MAP_OBJ_GFX_ITEM_BALL, 0, 27, 0, 11, 0, 3, 1, 17, 0, 0, 0, 0, 0, MagmaHideout_B1F_EventScript_1A051B, FLAG_HIDE_ELECTRODE_2_HIDEOUT, 0, 0

MagmaHideout_B1F_MapWarps:: @ 838EAE8
	warp_def 3, 3, 3, 1, MAP_MAGMA_HIDEOUT_1F
	warp_def 14, 3, 3, 0, MAP_MAGMA_HIDEOUT_B2F
	warp_def 23, 1, 3, 1, MAP_MAGMA_HIDEOUT_B2F
	warp_def 29, 1, 3, 2, MAP_MAGMA_HIDEOUT_B2F
	warp_def 8, 5, 3, 6, MAP_MAGMA_HIDEOUT_B1F
	warp_def 8, 7, 3, 9, MAP_MAGMA_HIDEOUT_B1F
	warp_def 14, 8, 3, 4, MAP_MAGMA_HIDEOUT_B1F
	warp_def 23, 5, 3, 10, MAP_MAGMA_HIDEOUT_B1F
	warp_def 39, 5, 3, 13, MAP_MAGMA_HIDEOUT_B1F
	warp_def 16, 16, 3, 5, MAP_MAGMA_HIDEOUT_B1F
	warp_def 21, 14, 3, 7, MAP_MAGMA_HIDEOUT_B1F
	warp_def 21, 20, 3, 12, MAP_MAGMA_HIDEOUT_B1F
	warp_def 38, 11, 3, 11, MAP_MAGMA_HIDEOUT_B1F
	warp_def 43, 19, 3, 8, MAP_MAGMA_HIDEOUT_B1F
	warp_def 34, 11, 3, 28, MAP_MAGMA_HIDEOUT_B1F
	warp_def 41, 11, 3, 16, MAP_MAGMA_HIDEOUT_B1F
	warp_def 56, 3, 3, 15, MAP_MAGMA_HIDEOUT_B1F
	warp_def 56, 5, 3, 16, MAP_MAGMA_HIDEOUT_B1F
	warp_def 53, 5, 3, 22, MAP_MAGMA_HIDEOUT_B1F
	warp_def 59, 5, 3, 20, MAP_MAGMA_HIDEOUT_B1F
	warp_def 53, 9, 3, 19, MAP_MAGMA_HIDEOUT_B1F
	warp_def 56, 9, 3, 24, MAP_MAGMA_HIDEOUT_B1F
	warp_def 59, 9, 3, 18, MAP_MAGMA_HIDEOUT_B1F
	warp_def 53, 13, 3, 17, MAP_MAGMA_HIDEOUT_B1F
	warp_def 56, 13, 3, 21, MAP_MAGMA_HIDEOUT_B1F
	warp_def 59, 13, 3, 26, MAP_MAGMA_HIDEOUT_B1F
	warp_def 53, 17, 3, 25, MAP_MAGMA_HIDEOUT_B1F
	warp_def 56, 17, 3, 21, MAP_MAGMA_HIDEOUT_B1F
	warp_def 59, 17, 3, 14, MAP_MAGMA_HIDEOUT_B1F

MagmaHideout_B1F_MapEvents:: @ 838EBD0
	map_events MagmaHideout_B1F_MapObjects, MagmaHideout_B1F_MapWarps, 0x0, 0x0
