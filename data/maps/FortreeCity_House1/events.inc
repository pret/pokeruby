FortreeCity_House1_EventObjects:: @ 8388FAC
	object_event 1, EVENT_OBJ_GFX_WOMAN_1, 0, 1, 3, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, FortreeCity_House1_EventScript_157E13, 0
	object_event 2, EVENT_OBJ_GFX_ZIGZAGOON, 0, 2, 3, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, FortreeCity_House1_EventScript_157EC0, 0
	object_event 3, EVENT_OBJ_GFX_OLD_WOMAN_1, 0, 7, 4, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, FortreeCity_House1_EventScript_157EB7, 0

FortreeCity_House1_MapWarps:: @ 8388FF4
	warp_def 3, 5, 0, 1, MAP_FORTREE_CITY
	warp_def 4, 5, 0, 1, MAP_FORTREE_CITY

FortreeCity_House1_MapEvents:: @ 8389004
	map_events FortreeCity_House1_EventObjects, FortreeCity_House1_MapWarps, 0x0, 0x0
