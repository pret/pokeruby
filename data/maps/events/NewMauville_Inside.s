NewMauville_Inside_MapObjects:: @ 838DF08
	object_event 1, MAP_OBJ_GFX_ITEM_BALL, 0, 32, 0, 25, 0, 3, 1, 0, 0, 0, 0, 0, 0, NewMauville_Inside_EventScript_1B183C, 1075, 0, 0
	object_event 2, MAP_OBJ_GFX_ITEM_BALL, 0, 16, 0, 22, 0, 3, 1, 0, 0, 0, 0, 0, 0, NewMauville_Inside_EventScript_1B1849, 1076, 0, 0
	object_event 3, MAP_OBJ_GFX_ITEM_BALL, 0, 39, 0, 4, 0, 3, 1, 17, 0, 0, 0, 0, 0, NewMauville_Inside_EventScript_1B1856, 1110, 0, 0
	object_event 4, MAP_OBJ_GFX_ITEM_BALL, 0, 17, 0, 10, 0, 3, 1, 17, 0, 0, 0, 0, 0, NewMauville_Inside_EventScript_1B1863, 1122, 0, 0
	object_event 5, MAP_OBJ_GFX_ITEM_BALL, 0, 2, 0, 11, 0, 3, 1, 17, 0, 0, 0, 0, 0, NewMauville_Inside_EventScript_1B1870, 1123, 0, 0
	object_event 6, MAP_OBJ_GFX_ITEM_BALL, 0, 25, 0, 18, 0, 3, 1, 17, 0, 0, 0, 0, 0, NewMauville_Inside_EventScript_15E900, 974, 0, 0
	object_event 7, MAP_OBJ_GFX_ITEM_BALL, 0, 6, 0, 11, 0, 3, 1, 17, 0, 0, 0, 0, 0, NewMauville_Inside_EventScript_15E91E, 975, 0, 0
	object_event 8, MAP_OBJ_GFX_ITEM_BALL, 0, 13, 0, 10, 0, 3, 1, 17, 0, 0, 0, 0, 0, NewMauville_Inside_EventScript_15E93C, 976, 0, 0

NewMauville_Inside_MapWarps:: @ 838DFC8
	warp_def 32, 33, 3, 1, NewMauville_Entrance

NewMauville_Inside_MapCoordEvents:: @ 838DFD0
	coord_event 30, 38, 3, 0, 0x4001, 0, 0, NewMauville_Inside_EventScript_15E5AA
	coord_event 18, 36, 3, 0, 0x4002, 0, 0, NewMauville_Inside_EventScript_15E5C2
	coord_event 4, 26, 3, 0, 0x4001, 0, 0, NewMauville_Inside_EventScript_15E5AA
	coord_event 16, 22, 3, 0, 0x4001, 0, 0, NewMauville_Inside_EventScript_15E5AA
	coord_event 25, 18, 3, 0, 0x4002, 0, 0, NewMauville_Inside_EventScript_15E5C2
	coord_event 2, 11, 3, 0, 0x4002, 0, 0, NewMauville_Inside_EventScript_15E5C2
	coord_event 6, 11, 3, 0, 0x4001, 0, 0, NewMauville_Inside_EventScript_15E5AA
	coord_event 13, 10, 3, 0, 0x4001, 0, 0, NewMauville_Inside_EventScript_15E5AA
	coord_event 17, 10, 3, 0, 0x4002, 0, 0, NewMauville_Inside_EventScript_15E5C2
	coord_event 33, 6, 3, 0, 0x40ba, 1, 0, NewMauville_Inside_EventScript_15E876

NewMauville_Inside_MapBGEvents:: @ 838E070
	bg_event 32, 4, 3, 0, 0, NewMauville_Inside_EventScript_15E8E0
	bg_event 32, 3, 3, 0, 0, NewMauville_Inside_EventScript_15E8E0
	bg_event 32, 2, 0, 0, 0, NewMauville_Inside_EventScript_15E8E0
	bg_event 33, 4, 3, 0, 0, NewMauville_Inside_EventScript_15E8E0
	bg_event 34, 4, 3, 0, 0, NewMauville_Inside_EventScript_15E8E0
	bg_event 35, 4, 3, 0, 0, NewMauville_Inside_EventScript_15E8E0
	bg_event 35, 3, 3, 0, 0, NewMauville_Inside_EventScript_15E8E0
	bg_event 35, 2, 0, 0, 0, NewMauville_Inside_EventScript_15E8E0

NewMauville_Inside_MapEvents:: @ 838E0D0
	map_events NewMauville_Inside_MapObjects, NewMauville_Inside_MapWarps, NewMauville_Inside_MapCoordEvents, NewMauville_Inside_MapBGEvents
