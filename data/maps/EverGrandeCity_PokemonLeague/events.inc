EverGrandeCity_PokemonLeague_EventObjects:: @ 838B494
	object_event 1, EVENT_OBJ_GFX_NURSE, 0, 3, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, EverGrandeCity_PokemonLeague_EventScript_15BA9A, 0
	object_event 2, EVENT_OBJ_GFX_MART_EMPLOYEE, 0, 16, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, EverGrandeCity_PokemonLeague_EventScript_15BAA8, 0
	object_event 3, EVENT_OBJ_GFX_MAN_4, 0, 8, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 0, 0, EverGrandeCity_PokemonLeague_EventScript_15BAD2, 0
	object_event 4, EVENT_OBJ_GFX_MAN_4, 0, 11, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 0, 0, EverGrandeCity_PokemonLeague_EventScript_15BAD2, 0

EverGrandeCity_PokemonLeague_MapWarps:: @ 838B4F4
	warp_def 9, 11, 3, 0, MAP_EVER_GRANDE_CITY
	warp_def 10, 11, 3, 0, MAP_EVER_GRANDE_CITY
	warp_def 9, 1, 3, 0, MAP_EVER_GRANDE_CITY_CORRIDOR5
	warp_def 10, 1, 3, 0, MAP_EVER_GRANDE_CITY_CORRIDOR5

EverGrandeCity_PokemonLeague_MapEvents:: @ 838B514
	map_events EverGrandeCity_PokemonLeague_EventObjects, EverGrandeCity_PokemonLeague_MapWarps, 0x0, 0x0
