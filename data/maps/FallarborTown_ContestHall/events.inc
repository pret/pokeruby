FallarborTown_ContestHall_EventObjects:: @ 83867DC
	object_event 1, EVENT_OBJ_GFX_MAN_1, 0, 19, 8, 0, MOVEMENT_TYPE_WANDER_AROUND, 2, 2, 0, 0, FallarborTown_ContestHall_EventScript_153ACF, 0
	object_event 2, EVENT_OBJ_GFX_WOMAN_7, 0, 5, 7, 0, MOVEMENT_TYPE_WANDER_AROUND, 2, 3, 0, 0, FallarborTown_ContestHall_EventScript_153AD8, 0
	object_event 3, EVENT_OBJ_GFX_YOUNGSTER, 0, 0, 15, 0, MOVEMENT_TYPE_WANDER_AROUND, 3, 3, 0, 0, FallarborTown_ContestHall_EventScript_153AE1, 0

FallarborTown_ContestHall_MapWarps:: @ 8386824
	warp_def 10, 17, 0, 2, MAP_FALLARBOR_TOWN_CONTEST_LOBBY
	warp_def 11, 17, 0, 2, MAP_FALLARBOR_TOWN_CONTEST_LOBBY

FallarborTown_ContestHall_MapBGEvents:: @ 8386834
	bg_event 12, 14, 3, BG_EVENT_PLAYER_FACING_ANY, FallarborTown_ContestHall_EventScript_153AEA
	bg_event 8, 14, 3, BG_EVENT_PLAYER_FACING_ANY, FallarborTown_ContestHall_EventScript_153AEA

FallarborTown_ContestHall_MapEvents:: @ 838684C
	map_events FallarborTown_ContestHall_EventObjects, FallarborTown_ContestHall_MapWarps, 0x0, FallarborTown_ContestHall_MapBGEvents
