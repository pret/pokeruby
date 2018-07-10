LilycoveCity_House4_EventObjects:: @ 838A1C4
	object_event 1, EVENT_OBJ_GFX_MAN_5, 0, 1, 4, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, LilycoveCity_House4_EventScript_159D42, 0
	object_event 2, EVENT_OBJ_GFX_MAN_1, 0, 7, 4, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, LilycoveCity_House4_EventScript_159D4B, 0

LilycoveCity_House4_MapWarps:: @ 838A1F4
	warp_def 3, 8, 0, 11, MAP_LILYCOVE_CITY
	warp_def 4, 8, 0, 11, MAP_LILYCOVE_CITY

LilycoveCity_House4_MapEvents:: @ 838A204
	map_events LilycoveCity_House4_EventObjects, LilycoveCity_House4_MapWarps, 0x0, 0x0
