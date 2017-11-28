GraniteCave_1F_MapObjects:: @ 838BF24
	object_event 1, MAP_OBJ_GFX_HIKER, 0, 36, 0, 9, 0, 3, 1, 0, 0, 0, 0, 0, 0, GraniteCave_1F_EventScript_15CBA7, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_ITEM_BALL, 0, 17, 0, 7, 0, 3, 8, 0, 0, 0, 0, 0, 0, GraniteCave_1F_EventScript_1B17A0, 1050, 0, 0

GraniteCave_1F_MapWarps:: @ 838BF54
	warp_def 37, 12, 3, 0, MAP_ROUTE106
	warp_def 35, 3, 3, 0, MAP_GRANITE_CAVE_B1F
	warp_def 17, 11, 3, 1, MAP_GRANITE_CAVE_B1F
	warp_def 5, 10, 3, 0, MAP_GRANITE_CAVE_STEVENS_ROOM

GraniteCave_1F_MapEvents:: @ 838BF74
	map_events GraniteCave_1F_MapObjects, GraniteCave_1F_MapWarps, 0x0, 0x0
