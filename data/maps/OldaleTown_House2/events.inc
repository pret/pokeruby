OldaleTown_House2_EventObjects:: @ 8385C88
	object_event 1, EVENT_OBJ_GFX_WOMAN_2, 0, 4, 4, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, OldaleTown_House2_EventScript_152EF6, 0
	object_event 2, EVENT_OBJ_GFX_SCHOOL_KID_M, 0, 7, 4, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, OldaleTown_House2_EventScript_152EFF, 0

OldaleTown_House2_MapWarps:: @ 8385CB8
	warp_def 3, 7, 0, 1, MAP_OLDALE_TOWN
	warp_def 4, 7, 0, 1, MAP_OLDALE_TOWN

OldaleTown_House2_MapEvents:: @ 8385CC8
	map_events OldaleTown_House2_EventObjects, OldaleTown_House2_MapWarps, 0x0, 0x0
