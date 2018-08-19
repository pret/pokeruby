LilycoveCity_House1_EventObjects:: @ 838A080
	object_event 1, EVENT_OBJ_GFX_OLD_MAN_1, 0, 4, 5, 3, MOVEMENT_TYPE_FACE_LEFT, 1, 1, 0, 0, LilycoveCity_House1_EventScript_159B86, 0
	object_event 2, EVENT_OBJ_GFX_KECLEON_1, 0, 4, 4, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, LilycoveCity_House1_EventScript_159B8F, 0

LilycoveCity_House1_MapWarps:: @ 838A0B0
	warp_def 3, 8, 0, 8, MAP_LILYCOVE_CITY
	warp_def 4, 8, 0, 8, MAP_LILYCOVE_CITY

LilycoveCity_House1_MapEvents:: @ 838A0C0
	map_events LilycoveCity_House1_EventObjects, LilycoveCity_House1_MapWarps, 0x0, 0x0
