FallarborTown_House1_EventObjects:: @ 8386970
	object_event 1, EVENT_OBJ_GFX_SCIENTIST_1, 0, 6, 4, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, FallarborTown_House1_EventScript_153BB5, FLAG_HIDE_PROF_COSMO_FALLARBOR
	object_event 2, EVENT_OBJ_GFX_WOMAN_3, 0, 5, 6, 3, MOVEMENT_TYPE_WANDER_LEFT_AND_RIGHT, 1, 0, 0, 0, FallarborTown_House1_EventScript_153C5E, 0

FallarborTown_House1_MapWarps:: @ 83869A0
	warp_def 3, 8, 0, 3, MAP_FALLARBOR_TOWN
	warp_def 4, 8, 0, 3, MAP_FALLARBOR_TOWN

FallarborTown_House1_MapEvents:: @ 83869B0
	map_events FallarborTown_House1_EventObjects, FallarborTown_House1_MapWarps, 0x0, 0x0
