EverGrandeCity_GlaciasRoom_EventObjects:: @ 838B2BC
	object_event 1, EVENT_OBJ_GFX_GLACIA, 0, 6, 5, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, EverGrandeCity_GlaciasRoom_EventScript_15B6CA, 0

EverGrandeCity_GlaciasRoom_MapWarps:: @ 838B2D4
	warp_def 6, 13, 3, 1, MAP_EVER_GRANDE_CITY_CORRIDOR2
	warp_def 6, 2, 0, 0, MAP_EVER_GRANDE_CITY_CORRIDOR3

EverGrandeCity_GlaciasRoom_MapEvents:: @ 838B2E4
	map_events EverGrandeCity_GlaciasRoom_EventObjects, EverGrandeCity_GlaciasRoom_MapWarps, 0x0, 0x0
