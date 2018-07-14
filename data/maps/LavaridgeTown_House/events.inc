LavaridgeTown_House_EventObjects:: @ 8386494
	object_event 1, EVENT_OBJ_GFX_OLD_MAN_2, 0, 2, 3, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, LavaridgeTown_House_EventScript_1538AE, 0
	object_event 2, EVENT_OBJ_GFX_ZIGZAGOON, 0, 6, 6, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, LavaridgeTown_House_EventScript_1538B7, 0

LavaridgeTown_House_MapWarps:: @ 83864C4
	warp_def 3, 7, 0, 4, MAP_LAVARIDGE_TOWN
	warp_def 4, 7, 0, 4, MAP_LAVARIDGE_TOWN

LavaridgeTown_House_MapEvents:: @ 83864D4
	map_events LavaridgeTown_House_EventObjects, LavaridgeTown_House_MapWarps, 0x0, 0x0
