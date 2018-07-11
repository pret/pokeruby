LavaridgeTown_EventObjects:: @ 8380C78
	object_event 1, EVENT_OBJ_GFX_OLD_WOMAN_1, 0, 8, 7, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, LavaridgeTown_EventScript_14E751, 0
	object_event 2, EVENT_OBJ_GFX_OLD_MAN_1, 0, 5, 1, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, LavaridgeTown_EventScript_14E724, 0
	object_event 3, EVENT_OBJ_GFX_OLD_MAN_2, 0, 5, 8, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, LavaridgeTown_EventScript_14E72D, 0
	object_event 4, EVENT_OBJ_GFX_LITTLE_GIRL_1, 0, 10, 13, 3, MOVEMENT_TYPE_WANDER_UP_AND_DOWN, 0, 2, 0, 0, LavaridgeTown_EventScript_14E736, 0
	object_event 5, EVENT_OBJ_GFX_HOT_SPRINGS_OLD_WOMAN, 0, 4, 4, 3, MOVEMENT_TYPE_FACE_DOWN_AND_RIGHT, 0, 0, 0, 0, LavaridgeTown_EventScript_14E73F, 0
	object_event 6, EVENT_OBJ_GFX_HOT_SPRINGS_OLD_WOMAN, 0, 5, 4, 3, MOVEMENT_TYPE_FACE_DOWN_AND_LEFT, 0, 0, 0, 0, LavaridgeTown_EventScript_14E748, 0
	object_event 7, EVENT_OBJ_GFX_VAR_3, 0, 6, 16, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, 0x0, FLAG_HIDE_RIVAL_LAVARIDGE_2
	object_event 8, EVENT_OBJ_GFX_VAR_0, 0, 12, 15, 0, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, LavaridgeTown_EventScript_14E575, FLAG_HIDE_RIVAL_LAVARIDGE_1
	object_event 9, EVENT_OBJ_GFX_OLD_WOMAN_1, 0, 4, 7, 3, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 0, 0, LavaridgeTown_EventScript_14E75A, 0

LavaridgeTown_MapWarps:: @ 8380D50
	warp_def 12, 15, 0, 0, MAP_LAVARIDGE_TOWN_HERB_SHOP
	warp_def 5, 15, 0, 0, MAP_LAVARIDGE_TOWN_GYM_1F
	warp_def 15, 5, 0, 0, MAP_LAVARIDGE_TOWN_MART
	warp_def 9, 6, 0, 0, MAP_LAVARIDGE_TOWN_POKEMON_CENTER_1F
	warp_def 16, 15, 0, 0, MAP_LAVARIDGE_TOWN_HOUSE
	warp_def 9, 2, 3, 3, MAP_LAVARIDGE_TOWN_POKEMON_CENTER_1F

LavaridgeTown_MapCoordEvents:: @ 8380D80
	coord_event 6, 3, 3, 0, 0, LavaridgeTown_EventScript_14E710

LavaridgeTown_MapBGEvents:: @ 8380D90
	bg_event 14, 16, 0, BG_EVENT_PLAYER_FACING_ANY, LavaridgeTown_EventScript_14E7D7
	bg_event 7, 15, 0, BG_EVENT_PLAYER_FACING_ANY, LavaridgeTown_EventScript_14E7C5
	bg_event 17, 5, 0, BG_EVENT_PLAYER_FACING_NORTH, LavaridgeTown_EventScript_1A00E1
	bg_event 13, 8, 0, BG_EVENT_PLAYER_FACING_ANY, LavaridgeTown_EventScript_14E7BC
	bg_event 10, 6, 0, BG_EVENT_PLAYER_FACING_NORTH, LavaridgeTown_EventScript_1A00EA
	bg_event 16, 5, 0, BG_EVENT_PLAYER_FACING_NORTH, LavaridgeTown_EventScript_1A00E1
	bg_event 11, 6, 0, BG_EVENT_PLAYER_FACING_NORTH, LavaridgeTown_EventScript_1A00EA
	bg_hidden_item_event 4, 5, 3, ITEM_ICE_HEAL, FLAG_HIDDEN_ITEM_0

LavaridgeTown_MapEvents:: @ 8380DF0
	map_events LavaridgeTown_EventObjects, LavaridgeTown_MapWarps, LavaridgeTown_MapCoordEvents, LavaridgeTown_MapBGEvents
