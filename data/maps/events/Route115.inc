Route115_MapObjects:: @ 8382F2C
	object_event 1, MAP_OBJ_GFX_WOMAN_3, 0, 18, 0, 68, 0, 3, 2, 17, 0, 0, 0, 0, 0, Route115_EventScript_15092E, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_OLD_MAN_1, 0, 5, 0, 15, 0, 3, 10, 0, 0, 1, 0, 6, 0, Route115_EventScript_150949, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_BLACK_BELT, 0, 27, 0, 53, 0, 3, 15, 17, 0, 1, 0, 4, 0, Route115_EventScript_15099E, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_BERRY_TREE, 0, 11, 0, 5, 0, 3, 12, 0, 0, 0, 0, 69, 0, S_BerryTree, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_BERRY_TREE, 0, 12, 0, 5, 0, 3, 12, 0, 0, 0, 0, 70, 0, S_BerryTree, 0, 0, 0
	object_event 6, MAP_OBJ_GFX_BERRY_TREE, 0, 13, 0, 5, 0, 3, 12, 0, 0, 0, 0, 71, 0, S_BerryTree, 0, 0, 0
	object_event 7, MAP_OBJ_GFX_GIRL_3, 0, 15, 0, 50, 0, 3, 64, 0, 0, 1, 0, 3, 0, Route115_EventScript_1509DC, 0, 0, 0
	object_event 8, MAP_OBJ_GFX_BLACK_BELT, 0, 17, 0, 17, 0, 3, 50, 51, 0, 1, 0, 2, 0, Route115_EventScript_150987, 0, 0, 0
	object_event 9, MAP_OBJ_GFX_MANIAC, 0, 25, 0, 61, 0, 3, 14, 0, 0, 1, 0, 3, 0, Route115_EventScript_150A1A, 0, 0, 0
	object_event 10, MAP_OBJ_GFX_ITEM_BALL, 0, 20, 0, 60, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route115_EventScript_1B1530, 1016, 0, 0
	object_event 11, MAP_OBJ_GFX_ITEM_BALL, 0, 19, 0, 5, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route115_EventScript_1B153D, 1017, 0, 0
	object_event 12, MAP_OBJ_GFX_ITEM_BALL, 0, 23, 0, 29, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route115_EventScript_1B154A, 1018, 0, 0
	object_event 13, MAP_OBJ_GFX_BERRY_TREE, 0, 31, 0, 64, 0, 3, 12, 0, 0, 0, 0, 55, 0, S_BerryTree, 0, 0, 0
	object_event 14, MAP_OBJ_GFX_BERRY_TREE, 0, 31, 0, 65, 0, 3, 12, 0, 0, 0, 0, 56, 0, S_BerryTree, 0, 0, 0
	object_event 15, MAP_OBJ_GFX_BREAKABLE_ROCK, 0, 29, 0, 50, 0, 3, 1, 17, 0, 0, 0, 0, 0, S_BreakableRock, 17, 0, 0
	object_event 16, MAP_OBJ_GFX_ITEM_BALL, 0, 31, 0, 56, 0, 3, 1, 17, 0, 0, 0, 0, 0, Route115_EventScript_1B1557, 1118, 0, 0

Route115_MapWarps:: @ 83830AC
	warp_def 27, 37, 0, 1, MeteorFalls_1F_1R

Route115_MapBGEvents:: @ 83830B4
	bg_event 32, 6, 0, 8, 0, 72, 0, 0
	bg_event 21, 18, 0, 8, 0, 62, 0, 0
	bg_event 16, 64, 0, 0, 0, Route115_EventScript_150937
	bg_event 25, 38, 3, 0, 0, Route115_EventScript_150940
	bg_event 8, 30, 0, 8, 0, ITEM_CHERI_BERRY, 0, 0
	bg_event 32, 39, 0, 8, 0, ITEM_BLACK_FLUTE, 0, 0
	bg_event 26, 15, 0, 8, 0, 52, 0, 0
	bg_event 23, 8, 0, 8, 0, ITEM_WHITE_FLUTE, 0, 0
	bg_event 32, 46, 0, 8, 0, 53, 0, 0
	bg_event 7, 20, 0, 8, 0, ITEM_STARF_BERRY, 0, 0
	bg_event 8, 20, 0, 8, 0, ITEM_QUICK_CLAW, 0, 0
	bg_event 25, 24, 0, 8, 0, ITEM_HP_UP, 0, 0
	bg_event 20, 53, 0, 8, 0, ITEM_HYPER_POTION, 0, 0
	bg_event 15, 49, 3, 7, 0, ITEM_HEART_SCALE, 97, 0

Route115_MapEvents:: @ 838315C
	map_events Route115_MapObjects, Route115_MapWarps, 0x0, Route115_MapBGEvents
