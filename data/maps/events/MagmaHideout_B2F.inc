MagmaHideout_B2F_MapObjects:: @ 838EBE4
	object_event 1, 241, 0, 8, 0, 19, 0, 3, 10, 17, 0, 0, 0, 0, 0, MagmaHideout_B2F_EventScript_15D8E1, 924, 0, 0
	object_event 2, 241, 0, 31, 0, 11, 0, 3, 51, 71, 0, 1, 0, 3, 0, MagmaHideout_B2F_EventScript_15D962, 924, 0, 0
	object_event 3, MAP_OBJ_GFX_SUBMARINE_SHADOW, 0, 12, 0, 20, 0, 1, 10, 17, 0, 0, 0, 0, 0, 0x0, 943, 0, 0
	object_event 4, 242, 0, 13, 0, 3, 0, 3, 9, 17, 0, 1, 0, 4, 0, MagmaHideout_B2F_EventScript_15D987, 924, 0, 0
	object_event 5, MAP_OBJ_GFX_ITEM_BALL, 0, 31, 0, 20, 0, 3, 8, 17, 0, 0, 0, 0, 0, MagmaHideout_B2F_EventScript_1B19E9, 1127, 0, 0

MagmaHideout_B2F_MapWarps:: @ 838EC5C
	warp_def 3, 3, 3, 1, MAP_MAGMA_HIDEOUT_B1F
	warp_def 12, 1, 3, 2, MAP_MAGMA_HIDEOUT_B1F
	warp_def 18, 1, 3, 3, MAP_MAGMA_HIDEOUT_B1F
	warp_def 2, 14, 3, 4, MAP_MAGMA_HIDEOUT_B1F
	warp_def 12, 13, 3, 5, MAP_MAGMA_HIDEOUT_B2F
	warp_def 17, 13, 3, 4, MAP_MAGMA_HIDEOUT_B2F
	warp_def 31, 4, 3, 7, MAP_MAGMA_HIDEOUT_B2F
	warp_def 31, 16, 3, 6, MAP_MAGMA_HIDEOUT_B2F

MagmaHideout_B2F_MapCoordEvents:: @ 838EC9C
	coord_event 7, 16, 3, 0, 0x4001, 0, 0, MagmaHideout_B2F_EventScript_15D8BD
	coord_event 6, 16, 3, 0, 0x4001, 0, 0, MagmaHideout_B2F_EventScript_15D8BD
	coord_event 5, 16, 3, 0, 0x4001, 0, 0, MagmaHideout_B2F_EventScript_15D8BD
	coord_event 4, 16, 3, 0, 0x4001, 0, 0, MagmaHideout_B2F_EventScript_15D8BD

MagmaHideout_B2F_MapEvents:: @ 838ECDC
	map_events MagmaHideout_B2F_MapObjects, MagmaHideout_B2F_MapWarps, MagmaHideout_B2F_MapCoordEvents, 0x0
