SSTidalRooms_EventObjects:: @ 839189C
	object_event 1, EVENT_OBJ_GFX_MAN_3, 0, 4, 7, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 1, 0, SSTidalRooms_EventScript_15FF5D, 0
	object_event 2, EVENT_OBJ_GFX_GENTLEMAN, 0, 34, 11, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 1, 3, SSTidalRooms_EventScript_15FF74, 0
	object_event 3, EVENT_OBJ_GFX_GENTLEMAN, 0, 21, 5, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 1, 0, SSTidalRooms_EventScript_15FF8B, 0
	object_event 4, EVENT_OBJ_GFX_MAN_5, 0, 7, 13, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 1, 0, SSTidalRooms_EventScript_15FFA2, 0
	object_event 5, EVENT_OBJ_GFX_WOMAN_5, 0, 6, 13, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 1, 0, SSTidalRooms_EventScript_15FFBD, 0
	object_event 6, EVENT_OBJ_GFX_BOY_4, 0, 22, 11, 3, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 1, 3, SSTidalRooms_EventScript_15FFD8, 0
	object_event 7, EVENT_OBJ_GFX_WOMAN_3, 0, 15, 6, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 1, 0, SSTidalRooms_EventScript_15FFEF, 0
	object_event 8, EVENT_OBJ_GFX_MANIAC, 0, 28, 5, 3, MOVEMENT_TYPE_FACE_UP, 1, 1, 0, 0, SSTidalRooms_EventScript_15FF06, FLAG_HIDE_TM_49_GIVER_SS_TIDAL

SSTidalRooms_MapWarps:: @ 839195C
	warp_def 4, 16, 0, 0, MAP_SS_TIDAL_CORRIDOR
	warp_def 5, 16, 0, 0, MAP_SS_TIDAL_CORRIDOR
	warp_def 13, 16, 0, 1, MAP_SS_TIDAL_CORRIDOR
	warp_def 14, 16, 0, 1, MAP_SS_TIDAL_CORRIDOR
	warp_def 22, 16, 0, 2, MAP_SS_TIDAL_CORRIDOR
	warp_def 23, 16, 0, 2, MAP_SS_TIDAL_CORRIDOR
	warp_def 31, 16, 0, 3, MAP_SS_TIDAL_CORRIDOR
	warp_def 32, 16, 0, 3, MAP_SS_TIDAL_CORRIDOR
	warp_def 4, 1, 0, 4, MAP_SS_TIDAL_CORRIDOR
	warp_def 13, 1, 0, 5, MAP_SS_TIDAL_CORRIDOR
	warp_def 22, 1, 0, 6, MAP_SS_TIDAL_CORRIDOR
	warp_def 31, 1, 0, 7, MAP_SS_TIDAL_CORRIDOR

SSTidalRooms_MapBGEvents:: @ 83919BC
	bg_event 15, 11, 0, BG_EVENT_PLAYER_FACING_ANY, SSTidalRooms_EventScript_15FF47
	bg_event 15, 12, 0, BG_EVENT_PLAYER_FACING_ANY, SSTidalRooms_EventScript_15FF47

SSTidalRooms_MapEvents:: @ 83919D4
	map_events SSTidalRooms_EventObjects, SSTidalRooms_MapWarps, 0x0, SSTidalRooms_MapBGEvents
