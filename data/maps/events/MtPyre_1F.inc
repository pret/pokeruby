MtPyre_1F_MapObjects:: @ 838C7FC
	object_event 1, MAP_OBJ_GFX_OLD_WOMAN_2, 0, 21, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, MtPyre_1F_EventScript_15D323, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_WOMAN_2, 0, 17, 0, 8, 0, 3, 7, 17, 0, 0, 0, 0, 0, MtPyre_1F_EventScript_15D35C, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_MAN_5, 0, 13, 0, 10, 0, 3, 9, 17, 0, 0, 0, 0, 0, MtPyre_1F_EventScript_15D365, 0, 0, 0

MtPyre_1F_MapWarps:: @ 838C844
	warp_def 17, 18, 3, 0, Route122
	warp_def 3, 6, 3, 0, MtPyre_Exterior
	warp_def 18, 18, 3, 0, Route122
	warp_def 4, 6, 3, 0, MtPyre_Exterior
	warp_def 11, 1, 3, 0, MtPyre_2F
	warp_def 20, 9, 3, 4, MtPyre_2F

MtPyre_1F_MapEvents:: @ 838C874
	map_events MtPyre_1F_MapObjects, MtPyre_1F_MapWarps, 0x0, 0x0
