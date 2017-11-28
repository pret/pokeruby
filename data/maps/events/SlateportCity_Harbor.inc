SlateportCity_Harbor_MapObjects:: @ 8387F30
	object_event 1, MAP_OBJ_GFX_BEAUTY, 0, 8, 0, 10, 0, 3, 8, 0, 0, 0, 0, 0, 0, SlateportCity_Harbor_EventScript_1560C4, 905, 0, 0
	object_event 2, MAP_OBJ_GFX_SAILOR, 0, 4, 0, 12, 0, 3, 9, 0, 0, 0, 0, 0, 0, SlateportCity_Harbor_EventScript_1561FF, 905, 0, 0
	object_event 3, MAP_OBJ_GFX_FAT_MAN, 0, 1, 0, 12, 0, 3, 10, 0, 0, 0, 0, 0, 0, SlateportCity_Harbor_EventScript_156208, 905, 0, 0
	object_event 4, MAP_OBJ_GFX_SCIENTIST_1, 0, 6, 0, 13, 0, 3, 1, 0, 0, 0, 0, 0, 0, SlateportCity_Harbor_EventScript_156211, 841, 0, 0
	object_event 5, MAP_OBJ_GFX_SS_TIDAL, 0, 8, 0, 9, 0, 1, 10, 0, 0, 0, 0, 0, 0, 0x0, 860, 0, 0
	object_event 6, 241, 0, 7, 0, 10, 0, 3, 10, 0, 0, 0, 0, 0, 0, 0x0, 845, 0, 0
	object_event 7, 246, 0, 8, 0, 10, 0, 3, 9, 0, 0, 0, 0, 0, 0, 0x0, 846, 0, 0
	object_event 8, MAP_OBJ_GFX_SUBMARINE_SHADOW, 0, 7, 0, 9, 0, 1, 10, 0, 0, 0, 0, 0, 0, 0x0, 848, 0, 0

SlateportCity_Harbor_MapWarps:: @ 8387FF0
	warp_def 11, 14, 0, 8, MAP_SLATEPORT_CITY
	warp_def 12, 14, 0, 8, MAP_SLATEPORT_CITY
	warp_def 19, 15, 0, 9, MAP_SLATEPORT_CITY
	warp_def 20, 15, 0, 9, MAP_SLATEPORT_CITY

SlateportCity_Harbor_MapCoordEvents:: @ 8388010
	coord_event 8, 11, 3, 0, 0x40a0, 1, 0, SlateportCity_Harbor_EventScript_155F9B
	coord_event 8, 12, 3, 0, 0x40a0, 1, 0, SlateportCity_Harbor_EventScript_155FA7
	coord_event 8, 13, 3, 0, 0x40a0, 1, 0, SlateportCity_Harbor_EventScript_155FB3
	coord_event 8, 14, 3, 0, 0x40a0, 1, 0, SlateportCity_Harbor_EventScript_155FBF

SlateportCity_Harbor_MapEvents:: @ 8388050
	map_events SlateportCity_Harbor_MapObjects, SlateportCity_Harbor_MapWarps, SlateportCity_Harbor_MapCoordEvents, 0x0
