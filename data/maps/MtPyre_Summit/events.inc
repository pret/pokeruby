MtPyre_Summit_EventObjects:: @ 838CBD8
	object_event 1, EVENT_OBJ_GFX_OLD_MAN_2, 0, 22, 5, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, MtPyre_Summit_EventScript_15D5EF, 0
	object_event 2, EVENT_OBJ_GFX_VAR_6, 0, 23, 6, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, 0x0, FLAG_HIDE_LEADER_MT_PYRE_SUMMIT
	object_event 3, EVENT_OBJ_GFX_OLD_WOMAN_1, 0, 23, 5, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, MtPyre_Summit_EventScript_15D623, 0
	object_event 4, EVENT_OBJ_GFX_VAR_1, 0, 21, 18, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 1, 3, MtPyre_Summit_EventScript_1B2DA9, FLAG_HIDE_GRUNTS_MT_PYRE_SUMMIT
	object_event 5, EVENT_OBJ_GFX_VAR_1, 0, 25, 15, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 1, 3, MtPyre_Summit_EventScript_1B2DC0, FLAG_HIDE_GRUNTS_MT_PYRE_SUMMIT
	object_event 6, EVENT_OBJ_GFX_VAR_1, 0, 21, 11, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 1, 3, MtPyre_Summit_EventScript_1B2DD7, FLAG_HIDE_GRUNTS_MT_PYRE_SUMMIT

MtPyre_Summit_MapWarps:: @ 838CC68
	warp_def 22, 31, 3, 1, MAP_MT_PYRE_EXTERIOR
	warp_def 23, 31, 3, 1, MAP_MT_PYRE_EXTERIOR
	warp_def 24, 31, 3, 1, MAP_MT_PYRE_EXTERIOR

MtPyre_Summit_MapCoordEvents:: @ 838CC80
	coord_event 22, 7, 3, VAR_MT_PYRE_STATE, 0, MtPyre_Summit_EventScript_15D4BD
	coord_event 23, 7, 3, VAR_MT_PYRE_STATE, 0, MtPyre_Summit_EventScript_15D4C9
	coord_event 24, 7, 3, VAR_MT_PYRE_STATE, 0, MtPyre_Summit_EventScript_15D4D5
	coord_event 22, 7, 3, VAR_MT_PYRE_STATE, 2, MtPyre_Summit_EventScript_15D6CE
	coord_event 23, 7, 3, VAR_MT_PYRE_STATE, 2, MtPyre_Summit_EventScript_15D6DA
	coord_event 24, 7, 3, VAR_MT_PYRE_STATE, 2, MtPyre_Summit_EventScript_15D6E6

MtPyre_Summit_MapBGEvents:: @ 838CCE0
	bg_hidden_item_event 9, 25, 0, ITEM_ZINC, FLAG_HIDDEN_ITEM_4F
	bg_hidden_item_event 37, 7, 3, ITEM_RARE_CANDY, FLAG_HIDDEN_ITEM_50

MtPyre_Summit_MapEvents:: @ 838CCF8
	map_events MtPyre_Summit_EventObjects, MtPyre_Summit_MapWarps, MtPyre_Summit_MapCoordEvents, MtPyre_Summit_MapBGEvents
