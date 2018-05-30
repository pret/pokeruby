FortreeCity_House4_EventObjects:: @ 8389308
	object_event 1, EVENT_OBJ_GFX_WOMAN_5, 0, 6, 0, 4, 0, 3, 2, 17, 0, 0, 0, 0, 0, FortreeCity_House4_EventScript_15817F, 0, 0, 0
	object_event 2, EVENT_OBJ_GFX_BOY_3, 0, 1, 0, 3, 0, 3, 8, 0, 0, 0, 0, 0, 0, FortreeCity_House4_EventScript_158188, 0, 0, 0
	object_event 3, EVENT_OBJ_GFX_WINGULL, 0, 2, 0, 3, 0, 3, 8, 0, 0, 0, 0, 0, 0, FortreeCity_House4_EventScript_15821E, FLAG_HIDE_WINGULL_FORTREE_HOUSE, 0, 0

FortreeCity_House4_MapWarps:: @ 8389350
	warp_def 3, 5, 0, 6, MAP_FORTREE_CITY
	warp_def 4, 5, 0, 6, MAP_FORTREE_CITY

FortreeCity_House4_MapEvents:: @ 8389360
	map_events FortreeCity_House4_EventObjects, FortreeCity_House4_MapWarps, 0x0, 0x0
