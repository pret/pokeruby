PacifidlogTown_MapObjects:: @ 838100C
	object_event 1, MAP_OBJ_GFX_GIRL_1, 0, 10, 0, 23, 0, 3, 9, 0, 0, 0, 0, 0, 0, PacifidlogTown_EventScript_14E909, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_FISHERMAN, 0, 11, 0, 14, 0, 3, 10, 0, 0, 0, 0, 0, 0, PacifidlogTown_EventScript_14E912, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_LITTLE_BOY_1, 0, 9, 0, 16, 0, 3, 8, 0, 0, 0, 0, 0, 0, PacifidlogTown_EventScript_14E900, 0, 0, 0

PacifidlogTown_MapWarps:: @ 8381054
	warp_def 8, 15, 0, 0, PacifidlogTown_PokemonCenter_1F
	warp_def 16, 13, 0, 0, PacifidlogTown_House1
	warp_def 3, 22, 0, 0, PacifidlogTown_House2
	warp_def 12, 24, 0, 0, PacifidlogTown_House3
	warp_def 2, 12, 0, 0, PacifidlogTown_House4
	warp_def 17, 21, 0, 0, PacifidlogTown_House5

PacifidlogTown_MapBGEvents:: @ 8381084
	bg_event 9, 15, 0, 1, 0, PacifidlogTown_EventScript_1A00EA
	bg_event 7, 16, 0, 0, 0, PacifidlogTown_EventScript_14E91B
	bg_event 10, 15, 0, 1, 0, PacifidlogTown_EventScript_1A00EA

PacifidlogTown_MapEvents:: @ 83810A8
	map_events PacifidlogTown_MapObjects, PacifidlogTown_MapWarps, 0x0, PacifidlogTown_MapBGEvents

