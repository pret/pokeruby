MtPyre_6F_MapObjects:: @ 838CAC0
	object_event 1, MAP_OBJ_GFX_HEX_MANIAC, 0, 6, 0, 3, 0, 3, 23, 17, 0, 1, 0, 2, 0, MtPyre_6F_EventScript_15D448, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_ITEM_BALL, 0, 6, 0, 9, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtPyre_6F_EventScript_1B1967, FLAG_ITEM_MT_PYRE_6F_1, 0, 0

MtPyre_6F_MapWarps:: @ 838CAF0
	warp_def 2, 1, 3, 0, MAP_MT_PYRE_5F
	warp_def 1, 10, 3, 2, MAP_MT_PYRE_5F

MtPyre_6F_MapEvents:: @ 838CB00
	map_events MtPyre_6F_MapObjects, MtPyre_6F_MapWarps, 0x0, 0x0
