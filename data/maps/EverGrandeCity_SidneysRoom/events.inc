EverGrandeCity_SidneysRoom_EventObjects:: @ 838B244
	object_event 1, EVENT_OBJ_GFX_SIDNEY, 0, 6, 5, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, EverGrandeCity_SidneysRoom_EventScript_15B596, 0

EverGrandeCity_SidneysRoom_MapWarps:: @ 838B25C
	warp_def 6, 13, 3, 1, MAP_EVER_GRANDE_CITY_CORRIDOR5
	warp_def 6, 2, 0, 0, MAP_EVER_GRANDE_CITY_CORRIDOR1

EverGrandeCity_SidneysRoom_MapEvents:: @ 838B26C
	map_events EverGrandeCity_SidneysRoom_EventObjects, EverGrandeCity_SidneysRoom_MapWarps, 0x0, 0x0
