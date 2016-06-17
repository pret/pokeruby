MossdeepCity_MapObjects:: @ 838042C
	object_event 1, MAP_OBJ_GFX_SAILOR, 0, 42, 0, 24, 0, 5, 2, 17, 0, 0, 0, 0, 0, MossdeepCity_EventScript_14CFB7, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_OLD_MAN_1, 0, 50, 0, 34, 0, 5, 5, 1, 0, 0, 0, 0, 0, MossdeepCity_EventScript_14CFC9, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_WOMAN_2, 0, 32, 0, 12, 0, 5, 2, 17, 0, 0, 0, 0, 0, MossdeepCity_EventScript_14CFAE, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_LITTLE_BOY_1, 0, 26, 0, 21, 0, 5, 3, 16, 0, 0, 0, 0, 0, MossdeepCity_EventScript_14CFC0, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_GIRL_1, 0, 45, 0, 18, 0, 7, 9, 0, 0, 0, 0, 0, 0, MossdeepCity_EventScript_14CFD2, 0, 0, 0
	object_event 6, MAP_OBJ_GFX_ITEM_BALL, 0, 62, 0, 35, 0, 5, 1, 0, 0, 0, 0, 0, 0, MossdeepCity_EventScript_1B1745, 1043, 0, 0
	object_event 7, MAP_OBJ_GFX_MAN_1, 0, 53, 0, 5, 0, 7, 7, 0, 0, 0, 0, 0, 0, MossdeepCity_EventScript_14D011, 0, 0, 0
	object_event 8, MAP_OBJ_GFX_GIRL_1, 0, 56, 0, 21, 0, 7, 10, 17, 0, 0, 0, 0, 0, MossdeepCity_EventScript_14CFDB, 0, 0, 0
	object_event 9, MAP_OBJ_GFX_BOY_2, 0, 23, 0, 13, 0, 5, 2, 17, 0, 0, 0, 0, 0, MossdeepCity_EventScript_14D027, 0, 0, 0

MossdeepCity_MapWarps:: @ 8380504
	warp_def 28, 9, 0, 0, MossdeepCity_House1
	warp_def 38, 9, 0, 0, MossdeepCity_Gym
	warp_def 28, 16, 0, 0, MossdeepCity_PokemonCenter_1F
	warp_def 67, 24, 0, 0, MossdeepCity_House2
	warp_def 37, 18, 0, 0, MossdeepCity_Mart
	warp_def 49, 6, 0, 0, MossdeepCity_House3
	warp_def 19, 10, 0, 0, MossdeepCity_StevensHouse
	warp_def 18, 16, 0, 1, MossdeepCity_House4
	warp_def 64, 13, 0, 0, MossdeepCity_SpaceCenter_1F
	warp_def 36, 24, 0, 0, MossdeepCity_GameCorner_1F

MossdeepCity_MapCoordEvents:: @ 8380554
	coord_event 25, 25, 0, 0, 0x4001, 0, 0, MossdeepCity_EventScript_14D008
	coord_event 26, 25, 0, 0, 0x4001, 0, 0, MossdeepCity_EventScript_14D008
	coord_event 32, 27, 0, 0, 0x4001, 0, 0, MossdeepCity_EventScript_14D008
	coord_event 33, 27, 0, 0, 0x4001, 0, 0, MossdeepCity_EventScript_14D008

MossdeepCity_MapBGEvents:: @ 8380594
	bg_event 25, 16, 0, 0, 0, MossdeepCity_EventScript_14CFF6
	bg_event 34, 9, 0, 0, 0, MossdeepCity_EventScript_14CFED
	bg_event 29, 16, 0, 1, 0, MossdeepCity_EventScript_1A00EA
	bg_event 38, 18, 0, 1, 0, MossdeepCity_EventScript_1A00E1
	bg_event 66, 14, 0, 0, 0, MossdeepCity_EventScript_14CFFF
	bg_event 30, 16, 0, 1, 0, MossdeepCity_EventScript_1A00EA
	bg_event 39, 18, 0, 1, 0, MossdeepCity_EventScript_1A00E1
	bg_event 57, 21, 7, 0, 0, MossdeepCity_EventScript_14CFE4

MossdeepCity_MapEvents:: @ 83805F4
	map_events MossdeepCity_MapObjects, MossdeepCity_MapWarps, MossdeepCity_MapCoordEvents, MossdeepCity_MapBGEvents

