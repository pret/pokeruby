PetalburgWoods_EventObjects:: @ 838C14C
	object_event 1, EVENT_OBJ_GFX_CUTTABLE_TREE, 0, 19, 10, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_CuttableTree, FLAG_TEMP_11
	object_event 2, EVENT_OBJ_GFX_CUTTABLE_TREE, 0, 19, 11, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, S_CuttableTree, FLAG_TEMP_12
	object_event 3, EVENT_OBJ_GFX_VAR_1, 0, 26, 17, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, 0x0, FLAG_HIDE_EVIL_TEAM_PETALBURG_WOODS
	object_event 4, EVENT_OBJ_GFX_MAN_2, 0, 26, 20, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, 0x0, FLAG_HIDE_DEVON_PETALBURG_WOODS
	object_event 5, EVENT_OBJ_GFX_ITEM_BALL, 0, 45, 7, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, PetalburgWoods_EventScript_1B175F, FLAG_ITEM_PETALBURG_WOODS_2
	object_event 6, EVENT_OBJ_GFX_ITEM_BALL, 0, 35, 20, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, PetalburgWoods_EventScript_1B1752, FLAG_ITEM_PETALBURG_WOODS_1
	object_event 7, EVENT_OBJ_GFX_ITEM_BALL, 0, 4, 8, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, PetalburgWoods_EventScript_1B176C, FLAG_ITEM_PETALBURG_WOODS_3
	object_event 8, EVENT_OBJ_GFX_BOY_2, 0, 15, 19, 3, MOVEMENT_TYPE_WANDER_UP_AND_DOWN, 1, 2, 0, 0, PetalburgWoods_EventScript_15CECA, 0
	object_event 9, EVENT_OBJ_GFX_BUG_CATCHER, 0, 7, 32, 3, MOVEMENT_TYPE_FACE_DOWN_LEFT_AND_RIGHT, 0, 0, 1, 3, PetalburgWoods_EventScript_15CF27, 0
	object_event 10, EVENT_OBJ_GFX_BUG_CATCHER, 0, 4, 14, 3, MOVEMENT_TYPE_FACE_DOWN_UP_AND_RIGHT, 0, 0, 1, 3, PetalburgWoods_EventScript_15CF3E, 0
	object_event 11, EVENT_OBJ_GFX_BOY_3, 0, 30, 34, 3, MOVEMENT_TYPE_WANDER_AROUND, 2, 1, 0, 0, PetalburgWoods_EventScript_15CED3, 0
	object_event 12, EVENT_OBJ_GFX_ITEM_BALL, 0, 4, 26, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, PetalburgWoods_EventScript_1B1779, FLAG_ITEM_PETALBURG_WOODS_4
	object_event 13, EVENT_OBJ_GFX_GIRL_2, 0, 33, 5, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, PetalburgWoods_EventScript_15CEDC, 0

PetalburgWoods_MapWarps:: @ 838C284
	warp_def 14, 5, 0, 2, MAP_ROUTE104
	warp_def 15, 5, 0, 3, MAP_ROUTE104
	warp_def 16, 38, 0, 4, MAP_ROUTE104
	warp_def 17, 38, 0, 5, MAP_ROUTE104
	warp_def 36, 38, 0, 6, MAP_ROUTE104
	warp_def 37, 38, 0, 7, MAP_ROUTE104

PetalburgWoods_MapCoordEvents:: @ 838C2B4
	coord_event 26, 23, 3, VAR_PETALBURG_WOODS_STATE, 0, PetalburgWoods_EventScript_15CCA8
	coord_event 27, 23, 3, VAR_PETALBURG_WOODS_STATE, 0, PetalburgWoods_EventScript_15CD42

PetalburgWoods_MapBGEvents:: @ 838C2D4
	bg_event 14, 32, 3, BG_EVENT_PLAYER_FACING_ANY, PetalburgWoods_EventScript_15CF15
	bg_hidden_item_event 39, 35, 3, ITEM_POTION, FLAG_HIDDEN_ITEM_3A
	bg_hidden_item_event 26, 6, 3, ITEM_TINY_MUSHROOM, FLAG_HIDDEN_ITEM_3B
	bg_hidden_item_event 40, 29, 3, ITEM_TINY_MUSHROOM, FLAG_HIDDEN_ITEM_3C
	bg_hidden_item_event 4, 19, 3, ITEM_POKE_BALL, FLAG_HIDDEN_ITEM_3D
	bg_event 11, 8, 3, BG_EVENT_PLAYER_FACING_ANY, PetalburgWoods_EventScript_15CF1E

PetalburgWoods_MapEvents:: @ 838C31C
	map_events PetalburgWoods_EventObjects, PetalburgWoods_MapWarps, PetalburgWoods_MapCoordEvents, PetalburgWoods_MapBGEvents
