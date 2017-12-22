MtPyre_Summit_MapObjects:: @ 838CBD8
	object_event 1, MAP_OBJ_GFX_OLD_MAN_2, 0, 22, 0, 5, 0, 3, 8, 0, 0, 0, 0, 0, 0, MtPyre_Summit_EventScript_15D5EF, 0, 0, 0
	object_event 2, 246, 0, 23, 0, 6, 0, 3, 7, 0, 0, 0, 0, 0, 0, 0x0, FLAG_HIDE_LEADER_MT_PYRE_SUMMIT, 0, 0
	object_event 3, MAP_OBJ_GFX_OLD_WOMAN_1, 0, 23, 0, 5, 0, 3, 8, 0, 0, 0, 0, 0, 0, MtPyre_Summit_EventScript_15D623, 0, 0, 0
	object_event 4, 241, 0, 21, 0, 18, 0, 3, 10, 0, 0, 1, 0, 3, 0, MtPyre_Summit_EventScript_1B2DA9, FLAG_HIDE_GRUNTS_MT_PYRE_SUMMIT, 0, 0
	object_event 5, 241, 0, 25, 0, 15, 0, 3, 9, 0, 0, 1, 0, 3, 0, MtPyre_Summit_EventScript_1B2DC0, FLAG_HIDE_GRUNTS_MT_PYRE_SUMMIT, 0, 0
	object_event 6, 241, 0, 21, 0, 11, 0, 3, 10, 0, 0, 1, 0, 3, 0, MtPyre_Summit_EventScript_1B2DD7, FLAG_HIDE_GRUNTS_MT_PYRE_SUMMIT, 0, 0

MtPyre_Summit_MapWarps:: @ 838CC68
	warp_def 22, 31, 3, 1, MAP_MT_PYRE_EXTERIOR
	warp_def 23, 31, 3, 1, MAP_MT_PYRE_EXTERIOR
	warp_def 24, 31, 3, 1, MAP_MT_PYRE_EXTERIOR

MtPyre_Summit_MapCoordEvents:: @ 838CC80
	coord_event 22, 7, 3, 0, 0x40b9, 0, 0, MtPyre_Summit_EventScript_15D4BD
	coord_event 23, 7, 3, 0, 0x40b9, 0, 0, MtPyre_Summit_EventScript_15D4C9
	coord_event 24, 7, 3, 0, 0x40b9, 0, 0, MtPyre_Summit_EventScript_15D4D5
	coord_event 22, 7, 3, 0, 0x40b9, 2, 0, MtPyre_Summit_EventScript_15D6CE
	coord_event 23, 7, 3, 0, 0x40b9, 2, 0, MtPyre_Summit_EventScript_15D6DA
	coord_event 24, 7, 3, 0, 0x40b9, 2, 0, MtPyre_Summit_EventScript_15D6E6

MtPyre_Summit_MapBGEvents:: @ 838CCE0
	bg_event 9, 25, 0, 7, 0, ITEM_ZINC, 79, 0
	bg_event 37, 7, 3, 7, 0, ITEM_RARE_CANDY, 80, 0

MtPyre_Summit_MapEvents:: @ 838CCF8
	map_events MtPyre_Summit_MapObjects, MtPyre_Summit_MapWarps, MtPyre_Summit_MapCoordEvents, MtPyre_Summit_MapBGEvents
