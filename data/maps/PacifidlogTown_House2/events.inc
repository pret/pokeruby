PacifidlogTown_House2_EventObjects:: @ 8386F94
	object_event 1, EVENT_OBJ_GFX_GENTLEMAN, 0, 3, 5, 3, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 0, 0, PacifidlogTown_House2_EventScript_154168, 0
	object_event 2, EVENT_OBJ_GFX_AZURILL, 0, 8, 6, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, PacifidlogTown_House2_EventScript_154267, 0
	object_event 3, EVENT_OBJ_GFX_AZURILL, 0, 1, 7, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, PacifidlogTown_House2_EventScript_154282, 0

PacifidlogTown_House2_MapWarps:: @ 8386FDC
	warp_def 4, 8, 0, 2, MAP_PACIFIDLOG_TOWN
	warp_def 5, 8, 0, 2, MAP_PACIFIDLOG_TOWN

PacifidlogTown_House2_MapEvents:: @ 8386FEC
	map_events PacifidlogTown_House2_EventObjects, PacifidlogTown_House2_MapWarps, 0x0, 0x0
