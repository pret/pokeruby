OldaleTown_Mart_EventObjects:: @ 8385DEC
	object_event 1, EVENT_OBJ_GFX_MART_EMPLOYEE, 0, 1, 3, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, OldaleTown_Mart_EventScript_152F79, 0
	object_event 2, EVENT_OBJ_GFX_WOMAN_7, 0, 5, 5, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, OldaleTown_Mart_EventScript_152FC6, 0
	object_event 3, EVENT_OBJ_GFX_BOY_1, 0, 9, 4, 3, MOVEMENT_TYPE_WANDER_UP_AND_DOWN, 0, 1, 0, 0, OldaleTown_Mart_EventScript_152FE5, 0

OldaleTown_Mart_MapWarps:: @ 8385E34
	warp_def 3, 7, 0, 3, MAP_OLDALE_TOWN
	warp_def 4, 7, 0, 3, MAP_OLDALE_TOWN

OldaleTown_Mart_MapEvents:: @ 8385E44
	map_events OldaleTown_Mart_EventObjects, OldaleTown_Mart_MapWarps, 0x0, 0x0
