FallarborTown_ContestHall_MapObjects:: @ 83867DC
	object_event 1, MAP_OBJ_GFX_MAN_1, 0, 19, 0, 8, 0, 0, 2, 34, 0, 0, 0, 0, 0, FallarborTown_ContestHall_EventScript_153ACF, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_WOMAN_7, 0, 5, 0, 7, 0, 0, 2, 50, 0, 0, 0, 0, 0, FallarborTown_ContestHall_EventScript_153AD8, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_YOUNGSTER, 0, 0, 0, 15, 0, 0, 2, 51, 0, 0, 0, 0, 0, FallarborTown_ContestHall_EventScript_153AE1, 0, 0, 0

FallarborTown_ContestHall_MapWarps:: @ 8386824
	warp_def 10, 17, 0, 2, MAP_FALLARBOR_TOWN_CONTEST_LOBBY
	warp_def 11, 17, 0, 2, MAP_FALLARBOR_TOWN_CONTEST_LOBBY

FallarborTown_ContestHall_MapBGEvents:: @ 8386834
	bg_event 12, 14, 3, 0, 0, FallarborTown_ContestHall_EventScript_153AEA
	bg_event 8, 14, 3, 0, 0, FallarborTown_ContestHall_EventScript_153AEA

FallarborTown_ContestHall_MapEvents:: @ 838684C
	map_events FallarborTown_ContestHall_MapObjects, FallarborTown_ContestHall_MapWarps, 0x0, FallarborTown_ContestHall_MapBGEvents
