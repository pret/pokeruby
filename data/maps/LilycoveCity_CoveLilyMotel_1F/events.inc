LilycoveCity_CoveLilyMotel_1F_EventObjects:: @ 8389464
	object_event 1, EVENT_OBJ_GFX_MAN_1, 0, 10, 3, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, LilycoveCity_CoveLilyMotel_1F_EventScript_1582C5, 0

LilycoveCity_CoveLilyMotel_1F_MapWarps:: @ 838947C
	warp_def 5, 8, 0, 1, MAP_LILYCOVE_CITY
	warp_def 6, 8, 0, 1, MAP_LILYCOVE_CITY
	warp_def 2, 1, 0, 0, MAP_LILYCOVE_CITY_COVE_LILY_MOTEL_2F

LilycoveCity_CoveLilyMotel_1F_MapCoordEvents:: @ 8389494
	coord_event 10, 2, 3, VAR_TEMP_1, 0, LilycoveCity_CoveLilyMotel_1F_EventScript_15834D

LilycoveCity_CoveLilyMotel_1F_MapEvents:: @ 83894A4
	map_events LilycoveCity_CoveLilyMotel_1F_EventObjects, LilycoveCity_CoveLilyMotel_1F_MapWarps, LilycoveCity_CoveLilyMotel_1F_MapCoordEvents, 0x0
