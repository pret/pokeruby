AquaHideout_B2F_MapObjects:: @ 838CF1C
	object_event 1, 241, 0, 23, 0, 19, 0, 3, 9, 0, 0, 0, 0, 0, 0, AquaHideout_B2F_EventScript_15D8E1, 924, 0, 0
	object_event 2, 241, 0, 23, 0, 10, 0, 3, 45, 52, 0, 1, 0, 3, 0, AquaHideout_B2F_EventScript_15D962, 924, 0, 0
	object_event 3, MAP_OBJ_GFX_ITEM_BALL, 0, 3, 0, 13, 0, 3, 1, 0, 0, 0, 0, 0, 0, AquaHideout_B2F_EventScript_1B19B5, 1072, 0, 0
	object_event 4, MAP_OBJ_GFX_SUBMARINE_SHADOW, 0, 19, 0, 20, 0, 1, 9, 0, 0, 0, 0, 0, 0, 0x0, 943, 0, 0
	object_event 5, 242, 0, 10, 0, 6, 0, 3, 7, 17, 0, 1, 0, 4, 0, AquaHideout_B2F_EventScript_15D987, 924, 0, 0

AquaHideout_B2F_MapWarps:: @ 838CF94
	warp_def 18, 1, 3, 1, MAP_AQUA_HIDEOUT_B1F
	warp_def 12, 1, 3, 2, MAP_AQUA_HIDEOUT_B1F
	warp_def 3, 3, 3, 3, MAP_AQUA_HIDEOUT_B1F
	warp_def 31, 8, 3, 5, MAP_AQUA_HIDEOUT_B2F
	warp_def 8, 8, 3, 8, MAP_AQUA_HIDEOUT_B2F
	warp_def 5, 8, 3, 3, MAP_AQUA_HIDEOUT_B2F
	warp_def 18, 13, 3, 7, MAP_AQUA_HIDEOUT_B2F
	warp_def 12, 13, 3, 6, MAP_AQUA_HIDEOUT_B2F
	warp_def 31, 17, 3, 4, MAP_AQUA_HIDEOUT_B2F
	warp_def 32, 20, 3, 4, MAP_AQUA_HIDEOUT_B1F

AquaHideout_B2F_MapCoordEvents:: @ 838CFE4
	coord_event 28, 17, 3, 0, 0x4001, 0, 0, AquaHideout_B2F_EventScript_15D8BD
	coord_event 28, 16, 3, 0, 0x4001, 0, 0, AquaHideout_B2F_EventScript_15D8BD

AquaHideout_B2F_MapEvents:: @ 838D004
	map_events AquaHideout_B2F_MapObjects, AquaHideout_B2F_MapWarps, AquaHideout_B2F_MapCoordEvents, 0x0
