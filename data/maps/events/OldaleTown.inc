OldaleTown_MapObjects:: @ 8380A78
	object_event 1, MAP_OBJ_GFX_GIRL_3, 0, 16, 0, 11, 0, 3, 9, 0, 0, 0, 0, 0, 0, OldaleTown_EventScript_14DDB3, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_MART_EMPLOYEE, 0, 13, 0, 7, 0, 3, 8, 0, 0, 0, 0, 0, 0, OldaleTown_EventScript_14DDBC, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_MANIAC, 0, 8, 0, 9, 0, 3, 10, 0, 0, 0, 0, 0, 0, OldaleTown_EventScript_14DEDF, 0, 0, 0
	object_event 4, 240, 0, 11, 0, 19, 0, 3, 7, 17, 0, 0, 0, 0, 0, OldaleTown_EventScript_14DF30, FLAG_HIDE_RIVAL_OLDALE_TOWN, 0, 0

OldaleTown_MapWarps:: @ 8380AD8
	warp_def 5, 7, 0, 0, MAP_OLDALE_TOWN_HOUSE1
	warp_def 15, 16, 0, 0, MAP_OLDALE_TOWN_HOUSE2
	warp_def 6, 16, 0, 0, MAP_OLDALE_TOWN_POKEMON_CENTER_1F
	warp_def 14, 6, 0, 0, MAP_OLDALE_TOWN_MART

OldaleTown_MapCoordEvents:: @ 8380AF8
	coord_event 0, 10, 3, 0, 0x4051, 0, 0, OldaleTown_EventScript_14DEFF
	coord_event 8, 19, 3, 0, 0x40c7, 1, 0, OldaleTown_EventScript_14DF41
	coord_event 9, 19, 3, 0, 0x40c7, 1, 0, OldaleTown_EventScript_14DF5C
	coord_event 10, 19, 3, 0, 0x40c7, 1, 0, OldaleTown_EventScript_14DF77

OldaleTown_MapBGEvents:: @ 8380B38
	bg_event 11, 9, 0, 0, 0, OldaleTown_EventScript_14DDAA
	bg_event 7, 16, 0, 1, 0, OldaleTown_EventScript_1A00EA
	bg_event 15, 6, 0, 1, 0, OldaleTown_EventScript_1A00E1
	bg_event 8, 16, 0, 1, 0, OldaleTown_EventScript_1A00EA
	bg_event 16, 6, 0, 1, 0, OldaleTown_EventScript_1A00E1

OldaleTown_MapEvents:: @ 8380B74
	map_events OldaleTown_MapObjects, OldaleTown_MapWarps, OldaleTown_MapCoordEvents, OldaleTown_MapBGEvents
