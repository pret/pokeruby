MeteorFalls_1F_1R_MapObjects:: @ 838BACC
	object_event 1, MAP_OBJ_GFX_ITEM_BALL, 0, 2, 0, 4, 0, 3, 1, 0, 0, 0, 0, 0, 0, MeteorFalls_1F_1R_EventScript_1B17FB, 1044, 0, 0
	object_event 2, MAP_OBJ_GFX_ITEM_BALL, 0, 2, 0, 14, 0, 3, 1, 0, 0, 0, 0, 0, 0, MeteorFalls_1F_1R_EventScript_1B1815, 1046, 0, 0
	object_event 3, MAP_OBJ_GFX_ITEM_BALL, 0, 27, 0, 5, 0, 3, 1, 0, 0, 0, 0, 0, 0, MeteorFalls_1F_1R_EventScript_1B1808, 1045, 0, 0
	object_event 4, MAP_OBJ_GFX_ITEM_BALL, 0, 26, 0, 32, 0, 3, 1, 0, 0, 0, 0, 0, 0, MeteorFalls_1F_1R_EventScript_1B1822, 1047, 0, 0
	object_event 5, 241, 0, 12, 0, 20, 0, 3, 8, 0, 0, 0, 0, 0, 0, 0x0, 938, 0, 0
	object_event 6, 241, 0, 14, 0, 21, 0, 3, 9, 0, 0, 0, 0, 0, 0, 0x0, 938, 0, 0
	object_event 7, 247, 0, 6, 0, 20, 0, 3, 10, 0, 0, 0, 0, 0, 0, 0x0, 939, 0, 0
	object_event 8, 244, 0, 6, 0, 20, 0, 3, 10, 0, 0, 0, 0, 0, 0, 0x0, 939, 0, 0
	object_event 9, 244, 0, 6, 0, 21, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0x0, 939, 0, 0
	object_event 10, MAP_OBJ_GFX_SCIENTIST_1, 0, 13, 0, 23, 0, 3, 21, 0, 0, 0, 0, 0, 0, MeteorFalls_1F_1R_EventScript_15C656, 942, 0, 0

MeteorFalls_1F_1R_MapWarps:: @ 838BBBC
	warp_def 27, 18, 4, 0, MAP_ROUTE114
	warp_def 6, 39, 3, 0, MAP_ROUTE115
	warp_def 10, 3, 3, 0, MAP_METEOR_FALLS_1F_2R
	warp_def 5, 4, 3, 4, MAP_METEOR_FALLS_B1F_1R
	warp_def 26, 28, 3, 5, MAP_METEOR_FALLS_B1F_1R

MeteorFalls_1F_1R_MapCoordEvents:: @ 838BBE4
	coord_event 14, 18, 4, 0, 0x40bf, 0, 0, MeteorFalls_1F_1R_EventScript_15C49C

MeteorFalls_1F_1R_MapBGEvents:: @ 838BBF4
	bg_event 38, 9, 0, 1, 0, MeteorFalls_1F_1R_EventScript_14E842
	bg_event 9, 58, 0, 0, 0, 0x0

MeteorFalls_1F_1R_MapEvents:: @ 838BC0C
	map_events MeteorFalls_1F_1R_MapObjects, MeteorFalls_1F_1R_MapWarps, MeteorFalls_1F_1R_MapCoordEvents, MeteorFalls_1F_1R_MapBGEvents
