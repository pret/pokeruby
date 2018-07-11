PetalburgCity_EventObjects:: @ 837F5F0
	object_event 1, EVENT_OBJ_GFX_WOMAN_5, 0, 16, 18, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, PetalburgCity_EventScript_14B7C3, FLAG_HIDE_WALLY_MOM_PETALBURG_1
	object_event 2, EVENT_OBJ_GFX_WALLY, 0, 15, 10, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, 0x0, FLAG_HIDE_WALLY_PETALBURG
	object_event 3, EVENT_OBJ_GFX_BOY_1, 0, 8, 22, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, PetalburgCity_EventScript_14B7AC, 0
	object_event 4, EVENT_OBJ_GFX_GENTLEMAN, 0, 20, 10, 3, MOVEMENT_TYPE_WANDER_UP_AND_DOWN, 0, 1, 0, 0, PetalburgCity_EventScript_14B824, 0
	object_event 5, EVENT_OBJ_GFX_MAN_1, 0, 15, 11, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, 0x0, FLAG_HIDE_WALLY_FATHER_PETALBURG
	object_event 6, EVENT_OBJ_GFX_WOMAN_2, 0, 14, 11, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, 0x0, FLAG_HIDE_WALLY_MOTHER_PETALBURG
	object_event 7, EVENT_OBJ_GFX_ITEM_BALL, 0, 19, 2, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, PetalburgCity_EventScript_1B1704, FLAG_ITEM_PETALBURG_1
	object_event 8, EVENT_OBJ_GFX_ITEM_BALL, 0, 3, 28, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, PetalburgCity_EventScript_1B1711, FLAG_ITEM_PETALBURG_2
	object_event 9, EVENT_OBJ_GFX_BOY_2, 0, 12, 15, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, PetalburgCity_EventScript_14BA2D, 0

PetalburgCity_MapWarps:: @ 837F6C8
	warp_def 10, 19, 0, 0, MAP_PETALBURG_CITY_HOUSE1
	warp_def 7, 5, 0, 0, MAP_PETALBURG_CITY_WALLYS_HOUSE
	warp_def 15, 8, 0, 0, MAP_PETALBURG_CITY_GYM
	warp_def 20, 16, 0, 0, MAP_PETALBURG_CITY_POKEMON_CENTER_1F
	warp_def 20, 24, 0, 0, MAP_PETALBURG_CITY_HOUSE2
	warp_def 25, 12, 0, 0, MAP_PETALBURG_CITY_MART

PetalburgCity_MapCoordEvents:: @ 837F6F8
	coord_event 8, 10, 3, VAR_PETALBURG_STATE, 0, PetalburgCity_EventScript_14B836
	coord_event 8, 11, 3, VAR_PETALBURG_STATE, 0, PetalburgCity_EventScript_14B842
	coord_event 8, 12, 3, VAR_PETALBURG_STATE, 0, PetalburgCity_EventScript_14B84E
	coord_event 8, 13, 3, VAR_PETALBURG_STATE, 0, PetalburgCity_EventScript_14B85A

PetalburgCity_MapBGEvents:: @ 837F738
	bg_event 17, 10, 0, BG_EVENT_PLAYER_FACING_ANY, PetalburgCity_EventScript_14B812
	bg_event 26, 12, 0, BG_EVENT_PLAYER_FACING_NORTH, PetalburgCity_EventScript_1A00E1
	bg_event 21, 16, 0, BG_EVENT_PLAYER_FACING_NORTH, PetalburgCity_EventScript_1A00EA
	bg_event 17, 16, 0, BG_EVENT_PLAYER_FACING_ANY, PetalburgCity_EventScript_14B81B
	bg_event 22, 16, 0, BG_EVENT_PLAYER_FACING_NORTH, PetalburgCity_EventScript_1A00EA
	bg_event 27, 12, 0, BG_EVENT_PLAYER_FACING_NORTH, PetalburgCity_EventScript_1A00E1
	bg_event 8, 9, 0, BG_EVENT_PLAYER_FACING_ANY, PetalburgCity_EventScript_14B82D
	bg_hidden_item_event 11, 29, 3, ITEM_RARE_CANDY, FLAG_HIDDEN_ITEM_5F

PetalburgCity_MapEvents:: @ 837F798
	map_events PetalburgCity_EventObjects, PetalburgCity_MapWarps, PetalburgCity_MapCoordEvents, PetalburgCity_MapBGEvents
