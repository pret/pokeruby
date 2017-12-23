PetalburgCity_MapObjects:: @ 837F5F0
	object_event 1, MAP_OBJ_GFX_WOMAN_5, 0, 16, 0, 18, 0, 3, 2, 17, 0, 0, 0, 0, 0, PetalburgCity_EventScript_14B7C3, FLAG_HIDE_WALLY_MOM_PETALBURG_1, 0, 0
	object_event 2, MAP_OBJ_GFX_WALLY, 0, 15, 0, 10, 0, 3, 7, 0, 0, 0, 0, 0, 0, 0x0, FLAG_HIDE_WALLY_PETALBURG, 0, 0
	object_event 3, MAP_OBJ_GFX_BOY_1, 0, 8, 0, 22, 0, 3, 8, 0, 0, 0, 0, 0, 0, PetalburgCity_EventScript_14B7AC, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_GENTLEMAN, 0, 20, 0, 10, 0, 3, 3, 16, 0, 0, 0, 0, 0, PetalburgCity_EventScript_14B824, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_MAN_1, 0, 15, 0, 11, 0, 3, 7, 0, 0, 0, 0, 0, 0, 0x0, FLAG_HIDE_WALLY_FATHER_PETALBURG, 0, 0
	object_event 6, MAP_OBJ_GFX_WOMAN_2, 0, 14, 0, 11, 0, 3, 7, 0, 0, 0, 0, 0, 0, 0x0, FLAG_HIDE_WALLY_MOTHER_PETALBURG, 0, 0
	object_event 7, MAP_OBJ_GFX_ITEM_BALL, 0, 19, 0, 2, 0, 3, 1, 0, 0, 0, 0, 0, 0, PetalburgCity_EventScript_1B1704, FLAG_ITEM_PETALBURG_1, 0, 0
	object_event 8, MAP_OBJ_GFX_ITEM_BALL, 0, 3, 0, 28, 0, 3, 1, 0, 0, 0, 0, 0, 0, PetalburgCity_EventScript_1B1711, FLAG_ITEM_PETALBURG_2, 0, 0
	object_event 9, MAP_OBJ_GFX_BOY_2, 0, 12, 0, 15, 0, 3, 1, 0, 0, 0, 0, 0, 0, PetalburgCity_EventScript_14BA2D, 0, 0, 0

PetalburgCity_MapWarps:: @ 837F6C8
	warp_def 10, 19, 0, 0, MAP_PETALBURG_CITY_HOUSE1
	warp_def 7, 5, 0, 0, MAP_PETALBURG_CITY_WALLYS_HOUSE
	warp_def 15, 8, 0, 0, MAP_PETALBURG_CITY_GYM
	warp_def 20, 16, 0, 0, MAP_PETALBURG_CITY_POKEMON_CENTER_1F
	warp_def 20, 24, 0, 0, MAP_PETALBURG_CITY_HOUSE2
	warp_def 25, 12, 0, 0, MAP_PETALBURG_CITY_MART

PetalburgCity_MapCoordEvents:: @ 837F6F8
	coord_event 8, 10, 3, 0, 0x4057, 0, 0, PetalburgCity_EventScript_14B836
	coord_event 8, 11, 3, 0, 0x4057, 0, 0, PetalburgCity_EventScript_14B842
	coord_event 8, 12, 3, 0, 0x4057, 0, 0, PetalburgCity_EventScript_14B84E
	coord_event 8, 13, 3, 0, 0x4057, 0, 0, PetalburgCity_EventScript_14B85A

PetalburgCity_MapBGEvents:: @ 837F738
	bg_event 17, 10, 0, 0, 0, PetalburgCity_EventScript_14B812
	bg_event 26, 12, 0, 1, 0, PetalburgCity_EventScript_1A00E1
	bg_event 21, 16, 0, 1, 0, PetalburgCity_EventScript_1A00EA
	bg_event 17, 16, 0, 0, 0, PetalburgCity_EventScript_14B81B
	bg_event 22, 16, 0, 1, 0, PetalburgCity_EventScript_1A00EA
	bg_event 27, 12, 0, 1, 0, PetalburgCity_EventScript_1A00E1
	bg_event 8, 9, 0, 0, 0, PetalburgCity_EventScript_14B82D
	bg_event 11, 29, 3, 7, 0, ITEM_RARE_CANDY, 95, 0

PetalburgCity_MapEvents:: @ 837F798
	map_events PetalburgCity_MapObjects, PetalburgCity_MapWarps, PetalburgCity_MapCoordEvents, PetalburgCity_MapBGEvents
