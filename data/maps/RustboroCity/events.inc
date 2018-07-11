RustboroCity_EventObjects:: @ 837FD14
	object_event 1, EVENT_OBJ_GFX_WOMAN_7, 0, 22, 34, 3, MOVEMENT_TYPE_WANDER_UP_AND_DOWN, 0, 1, 0, 0, RustboroCity_EventScript_14C3B1, 0
	object_event 2, EVENT_OBJ_GFX_FAT_MAN, 0, 19, 13, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, RustboroCity_EventScript_14C386, 0
	object_event 3, EVENT_OBJ_GFX_LITTLE_BOY_1, 0, 25, 37, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, RustboroCity_EventScript_14C401, 0
	object_event 4, EVENT_OBJ_GFX_LITTLE_GIRL_1, 0, 21, 46, 3, MOVEMENT_TYPE_WANDER_UP_AND_DOWN, 0, 1, 0, 0, RustboroCity_EventScript_14C3F8, 0
	object_event 5, EVENT_OBJ_GFX_BOY_2, 0, 12, 45, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, RustboroCity_EventScript_14C3D9, 0
	object_event 6, EVENT_OBJ_GFX_MAN_4, 0, 26, 23, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, RustboroCity_EventScript_14C3BA, 0
	object_event 7, EVENT_OBJ_GFX_LITTLE_BOY_2, 0, 24, 51, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, RustboroCity_EventScript_14C449, 0
	object_event 8, EVENT_OBJ_GFX_LITTLE_GIRL_2, 0, 25, 51, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, RustboroCity_EventScript_14C45F, 0
	object_event 9, EVENT_OBJ_GFX_MAN_2, 0, 30, 10, 3, MOVEMENT_TYPE_FACE_RIGHT, 1, 1, 0, 0, RustboroCity_EventScript_14C5FF, FLAG_HIDE_DEVON_RUSTBORO
	object_event 10, EVENT_OBJ_GFX_VAR_1, 0, 13, 21, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, 0x0, FLAG_HIDE_GRUNT_RUSTBORO
	object_event 11, EVENT_OBJ_GFX_MAN_7, 0, 13, 34, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, RustboroCity_EventScript_14C3A5, 0
	object_event 12, EVENT_OBJ_GFX_ITEM_BALL, 0, 36, 51, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, RustboroCity_EventScript_1B172B, FLAG_ITEM_RUSTBORO_1
	object_event 13, EVENT_OBJ_GFX_MAN_5, 0, 19, 27, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 1, 0, 0, RustboroCity_EventScript_14C475, 0
	object_event 14, EVENT_OBJ_GFX_VAR_0, 0, 16, 50, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, RustboroCity_EventScript_14C8DA, FLAG_HIDE_RIVAL_RUSTBORO

RustboroCity_MapWarps:: @ 837FE64
	warp_def 27, 19, 0, 0, MAP_RUSTBORO_CITY_GYM
	warp_def 13, 30, 0, 0, MAP_RUSTBORO_CITY_FLAT1_1F
	warp_def 16, 45, 0, 0, MAP_RUSTBORO_CITY_MART
	warp_def 16, 38, 0, 0, MAP_RUSTBORO_CITY_POKEMON_CENTER_1F
	warp_def 27, 34, 0, 0, MAP_RUSTBORO_CITY_POKEMON_SCHOOL
	warp_def 11, 15, 0, 0, MAP_RUSTBORO_CITY_DEVON_CORP_1F
	warp_def 12, 15, 0, 1, MAP_RUSTBORO_CITY_DEVON_CORP_1F
	warp_def 33, 19, 0, 0, MAP_RUSTBORO_CITY_HOUSE1
	warp_def 9, 38, 0, 0, MAP_RUSTBORO_CITY_CUTTERS_HOUSE
	warp_def 30, 28, 0, 0, MAP_RUSTBORO_CITY_HOUSE2
	warp_def 5, 51, 0, 0, MAP_RUSTBORO_CITY_FLAT2_1F
	warp_def 26, 46, 0, 0, MAP_RUSTBORO_CITY_HOUSE3

RustboroCity_MapCoordEvents:: @ 837FEC4
	coord_event 23, 20, 3, VAR_RUSTBORO_STATE, 1, RustboroCity_EventScript_14C481
	coord_event 23, 21, 3, VAR_RUSTBORO_STATE, 1, RustboroCity_EventScript_14C498
	coord_event 23, 22, 3, VAR_RUSTBORO_STATE, 1, RustboroCity_EventScript_14C4AF
	coord_event 23, 23, 3, VAR_RUSTBORO_STATE, 1, RustboroCity_EventScript_14C4C6
	coord_event 23, 24, 3, VAR_RUSTBORO_STATE, 1, RustboroCity_EventScript_14C4DD
	coord_event 30, 9, 3, VAR_RUSTBORO_STATE, 2, RustboroCity_EventScript_14C620
	coord_event 29, 10, 3, VAR_RUSTBORO_STATE, 2, RustboroCity_EventScript_14C62C
	coord_event 30, 11, 3, VAR_RUSTBORO_STATE, 2, RustboroCity_EventScript_14C638
	coord_event 30, 12, 3, VAR_RUSTBORO_STATE, 2, RustboroCity_EventScript_14C644
	coord_event 30, 9, 3, VAR_RUSTBORO_STATE, 4, RustboroCity_EventScript_14C74D
	coord_event 31, 10, 3, VAR_RUSTBORO_STATE, 4, RustboroCity_EventScript_14C759
	coord_event 30, 11, 3, VAR_RUSTBORO_STATE, 4, RustboroCity_EventScript_14C765
	coord_event 30, 12, 3, VAR_RUSTBORO_STATE, 4, RustboroCity_EventScript_14C771

RustboroCity_MapBGEvents:: @ 837FF94
	bg_event 23, 19, 0, BG_EVENT_PLAYER_FACING_ANY, RustboroCity_EventScript_14C41C
	bg_event 25, 35, 0, BG_EVENT_PLAYER_FACING_ANY, RustboroCity_EventScript_14C437
	bg_event 17, 45, 0, BG_EVENT_PLAYER_FACING_NORTH, RustboroCity_EventScript_1A00E1
	bg_event 18, 38, 0, BG_EVENT_PLAYER_FACING_NORTH, RustboroCity_EventScript_1A00EA
	bg_event 19, 49, 0, BG_EVENT_PLAYER_FACING_ANY, RustboroCity_EventScript_14C42E
	bg_event 18, 45, 0, BG_EVENT_PLAYER_FACING_NORTH, RustboroCity_EventScript_1A00E1
	bg_event 17, 38, 0, BG_EVENT_PLAYER_FACING_NORTH, RustboroCity_EventScript_1A00EA
	bg_event 17, 20, 0, BG_EVENT_PLAYER_FACING_ANY, RustboroCity_EventScript_14C413
	bg_event 30, 8, 0, BG_EVENT_PLAYER_FACING_ANY, RustboroCity_EventScript_14C40A
	bg_event 12, 38, 3, BG_EVENT_PLAYER_FACING_ANY, RustboroCity_EventScript_14C440

RustboroCity_MapEvents:: @ 838000C
	map_events RustboroCity_EventObjects, RustboroCity_MapWarps, RustboroCity_MapCoordEvents, RustboroCity_MapBGEvents
