PetalburgCity_PokemonCenter_1F_EventObjects:: @ 83874EC
	object_event 1, EVENT_OBJ_GFX_NURSE, 0, 7, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, PetalburgCity_PokemonCenter_1F_EventScript_155213, 0
	object_event 2, EVENT_OBJ_GFX_MAN_5, 0, 11, 2, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, PetalburgCity_PokemonCenter_1F_EventScript_1B1B14, 0
	object_event 3, EVENT_OBJ_GFX_FAT_MAN, 0, 2, 3, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, PetalburgCity_PokemonCenter_1F_EventScript_155221, 0
	object_event 4, EVENT_OBJ_GFX_YOUNGSTER, 0, 9, 6, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, PetalburgCity_PokemonCenter_1F_EventScript_15522A, 0
	object_event 5, EVENT_OBJ_GFX_WOMAN_7, 0, 5, 4, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, PetalburgCity_PokemonCenter_1F_EventScript_155233, 0

PetalburgCity_PokemonCenter_1F_MapWarps:: @ 8387564
	warp_def 7, 8, 3, 3, MAP_PETALBURG_CITY
	warp_def 6, 8, 3, 3, MAP_PETALBURG_CITY
	warp_def 1, 6, 4, 0, MAP_PETALBURG_CITY_POKEMON_CENTER_2F

PetalburgCity_PokemonCenter_1F_MapEvents:: @ 838757C
	map_events PetalburgCity_PokemonCenter_1F_EventObjects, PetalburgCity_PokemonCenter_1F_MapWarps, 0x0, 0x0
