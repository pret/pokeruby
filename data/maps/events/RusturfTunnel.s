RusturfTunnel_MapObjects:: @ 838BD2C
	object_event 1, MAP_OBJ_GFX_BLACK_BELT, 0, 23, 0, 5, 0, 3, 10, 0, 0, 0, 0, 0, 0, RusturfTunnel_EventScript_15C799, 807, 0, 0
	object_event 2, MAP_OBJ_GFX_BREAKABLE_ROCK, 0, 24, 0, 5, 0, 3, 1, 0, 0, 0, 0, 0, 0, RusturfTunnel_EventScript_1B0EB7, 931, 0, 0
	object_event 3, MAP_OBJ_GFX_ITEM_BALL, 0, 3, 0, 1, 0, 3, 1, 0, 0, 0, 0, 0, 0, RusturfTunnel_EventScript_1B1786, 1048, 0, 0
	object_event 4, MAP_OBJ_GFX_ITEM_BALL, 0, 30, 0, 2, 0, 3, 1, 0, 0, 0, 0, 0, 0, RusturfTunnel_EventScript_1B1793, 1049, 0, 0
	object_event 5, MAP_OBJ_GFX_OLD_MAN_1, 0, 5, 0, 4, 0, 3, 10, 0, 0, 0, 0, 0, 0, 0x0, 879, 0, 0
	object_event 6, 241, 0, 14, 0, 5, 0, 3, 9, 0, 0, 0, 0, 0, 0, RusturfTunnel_EventScript_15C9EA, 878, 0, 0
	object_event 7, MAP_OBJ_GFX_WINGULL, 0, 14, 0, 4, 0, 3, 9, 0, 0, 0, 0, 0, 0, RusturfTunnel_EventScript_15C9D7, 880, 0, 0
	object_event 8, MAP_OBJ_GFX_BREAKABLE_ROCK, 0, 24, 0, 4, 0, 3, 8, 0, 0, 0, 0, 0, 0, RusturfTunnel_EventScript_1B0EB7, 932, 0, 0
	object_event 9, MAP_OBJ_GFX_HIKER, 0, 32, 0, 13, 0, 3, 9, 17, 0, 1, 0, 3, 0, RusturfTunnel_EventScript_15CACD, 0, 0, 0
	object_event 10, MAP_OBJ_GFX_WOMAN_3, 0, 25, 0, 4, 0, 3, 9, 17, 0, 0, 0, 0, 0, RusturfTunnel_EventScript_15C782, 983, 0, 0

RusturfTunnel_MapWarps:: @ 838BE1C
	warp_def 4, 10, 3, 0, Route116
	warp_def 29, 16, 3, 4, VerdanturfTown
	warp_def 18, 20, 3, 2, Route116

RusturfTunnel_MapCoordEvents:: @ 838BE34
	coord_event 23, 4, 3, 0, 0, 0, 0, RusturfTunnel_EventScript_15C999
	coord_event 9, 4, 3, 0, 0x409a, 2, 0, RusturfTunnel_EventScript_15C9AB
	coord_event 9, 5, 3, 0, 0x409a, 2, 0, RusturfTunnel_EventScript_15C9AB
	coord_event 25, 4, 3, 0, 0, 0, 0, RusturfTunnel_EventScript_15C99F
	coord_event 25, 5, 3, 0, 0, 0, 0, RusturfTunnel_EventScript_15C9A5

RusturfTunnel_MapEvents:: @ 838BE84
	map_events RusturfTunnel_MapObjects, RusturfTunnel_MapWarps, RusturfTunnel_MapCoordEvents, 0x0

