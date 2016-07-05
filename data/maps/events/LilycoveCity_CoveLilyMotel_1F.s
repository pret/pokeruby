LilycoveCity_CoveLilyMotel_1F_MapObjects:: @ 8389464
	object_event 1, MAP_OBJ_GFX_MAN_1, 0, 10, 0, 3, 0, 3, 7, 0, 0, 0, 0, 0, 0, LilycoveCity_CoveLilyMotel_1F_EventScript_1582C5, 0, 0, 0

LilycoveCity_CoveLilyMotel_1F_MapWarps:: @ 838947C
	warp_def 5, 8, 0, 1, LilycoveCity
	warp_def 6, 8, 0, 1, LilycoveCity
	warp_def 2, 1, 0, 0, LilycoveCity_CoveLilyMotel_2F

LilycoveCity_CoveLilyMotel_1F_MapCoordEvents:: @ 8389494
	coord_event 10, 2, 3, 0, 0x4001, 0, 0, LilycoveCity_CoveLilyMotel_1F_EventScript_15834D

LilycoveCity_CoveLilyMotel_1F_MapEvents:: @ 83894A4
	map_events LilycoveCity_CoveLilyMotel_1F_MapObjects, LilycoveCity_CoveLilyMotel_1F_MapWarps, LilycoveCity_CoveLilyMotel_1F_MapCoordEvents, 0x0
