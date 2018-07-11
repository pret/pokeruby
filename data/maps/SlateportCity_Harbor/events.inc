SlateportCity_Harbor_EventObjects:: @ 8387F30
	object_event 1, EVENT_OBJ_GFX_BEAUTY, 0, 8, 10, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, SlateportCity_Harbor_EventScript_1560C4, FLAG_HIDE_WORKERS_SLATEPORT_HARBOR
	object_event 2, EVENT_OBJ_GFX_SAILOR, 0, 4, 12, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, SlateportCity_Harbor_EventScript_1561FF, FLAG_HIDE_WORKERS_SLATEPORT_HARBOR
	object_event 3, EVENT_OBJ_GFX_FAT_MAN, 0, 1, 12, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, SlateportCity_Harbor_EventScript_156208, FLAG_HIDE_WORKERS_SLATEPORT_HARBOR
	object_event 4, EVENT_OBJ_GFX_SCIENTIST_1, 0, 6, 13, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, SlateportCity_Harbor_EventScript_156211, FLAG_HIDE_STERN_SLATEPORT_HARBOR
	object_event 5, EVENT_OBJ_GFX_SS_TIDAL, 0, 8, 9, 1, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, 0x0, FLAG_HIDE_SS_TIDAL_SLATEPORT_HARBOR
	object_event 6, EVENT_OBJ_GFX_VAR_1, 0, 7, 10, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, 0x0, FLAG_HIDE_GRUNT_1_SLATEPORT_HARBOR
	object_event 7, EVENT_OBJ_GFX_VAR_6, 0, 8, 10, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, 0x0, FLAG_HIDE_GRUNT_2_SLATEPORT_HARBOR
	object_event 8, EVENT_OBJ_GFX_SUBMARINE_SHADOW, 0, 7, 9, 1, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, 0x0, FLAG_HIDE_SUBMARINE_SHADOW_SLATEPORT_HARBOR

SlateportCity_Harbor_MapWarps:: @ 8387FF0
	warp_def 11, 14, 0, 8, MAP_SLATEPORT_CITY
	warp_def 12, 14, 0, 8, MAP_SLATEPORT_CITY
	warp_def 19, 15, 0, 9, MAP_SLATEPORT_CITY
	warp_def 20, 15, 0, 9, MAP_SLATEPORT_CITY

SlateportCity_Harbor_MapCoordEvents:: @ 8388010
	coord_event 8, 11, 3, VAR_SLATEPORT_HARBOR_STATE, 1, SlateportCity_Harbor_EventScript_155F9B
	coord_event 8, 12, 3, VAR_SLATEPORT_HARBOR_STATE, 1, SlateportCity_Harbor_EventScript_155FA7
	coord_event 8, 13, 3, VAR_SLATEPORT_HARBOR_STATE, 1, SlateportCity_Harbor_EventScript_155FB3
	coord_event 8, 14, 3, VAR_SLATEPORT_HARBOR_STATE, 1, SlateportCity_Harbor_EventScript_155FBF

SlateportCity_Harbor_MapEvents:: @ 8388050
	map_events SlateportCity_Harbor_EventObjects, SlateportCity_Harbor_MapWarps, SlateportCity_Harbor_MapCoordEvents, 0x0
