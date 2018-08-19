FortreeCity_House5_EventObjects:: @ 8389374
	object_event 1, EVENT_OBJ_GFX_WOMAN_2, 0, 6, 4, 3, MOVEMENT_TYPE_FACE_DOWN_UP_AND_RIGHT, 0, 0, 0, 0, FortreeCity_House5_EventScript_158232, 0
	object_event 2, EVENT_OBJ_GFX_ZIGZAGOON, 0, 6, 3, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, FortreeCity_House5_EventScript_158244, 0
	object_event 3, EVENT_OBJ_GFX_MAN_1, 0, 2, 4, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, FortreeCity_House5_EventScript_15823B, 0

FortreeCity_House5_MapWarps:: @ 83893BC
	warp_def 3, 5, 0, 7, MAP_FORTREE_CITY
	warp_def 4, 5, 0, 7, MAP_FORTREE_CITY

FortreeCity_House5_MapEvents:: @ 83893CC
	map_events FortreeCity_House5_EventObjects, FortreeCity_House5_MapWarps, 0x0, 0x0
