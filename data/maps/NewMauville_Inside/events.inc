NewMauville_Inside_EventObjects:: @ 838DF08
	object_event 1, EVENT_OBJ_GFX_ITEM_BALL, 0, 32, 25, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, NewMauville_Inside_EventScript_1B183C, FLAG_ITEM_NEW_MAUVILLE_INSIDE_1
	object_event 2, EVENT_OBJ_GFX_ITEM_BALL, 0, 16, 22, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, NewMauville_Inside_EventScript_1B1849, FLAG_ITEM_NEW_MAUVILLE_INSIDE_2
	object_event 3, EVENT_OBJ_GFX_ITEM_BALL, 0, 39, 4, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, NewMauville_Inside_EventScript_1B1856, FLAG_ITEM_NEW_MAUVILLE_INSIDE_3
	object_event 4, EVENT_OBJ_GFX_ITEM_BALL, 0, 17, 10, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, NewMauville_Inside_EventScript_1B1863, FLAG_ITEM_NEW_MAUVILLE_INSIDE_4
	object_event 5, EVENT_OBJ_GFX_ITEM_BALL, 0, 2, 11, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, NewMauville_Inside_EventScript_1B1870, FLAG_ITEM_NEW_MAUVILLE_INSIDE_5
	object_event 6, EVENT_OBJ_GFX_ITEM_BALL, 0, 25, 18, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, NewMauville_Inside_EventScript_15E900, FLAG_HIDE_VOLTORB_1_NEW_MAUVILLE
	object_event 7, EVENT_OBJ_GFX_ITEM_BALL, 0, 6, 11, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, NewMauville_Inside_EventScript_15E91E, FLAG_HIDE_VOLTORB_2_NEW_MAUVILLE
	object_event 8, EVENT_OBJ_GFX_ITEM_BALL, 0, 13, 10, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, NewMauville_Inside_EventScript_15E93C, FLAG_HIDE_VOLTORB_3_NEW_MAUVILLE

NewMauville_Inside_MapWarps:: @ 838DFC8
	warp_def 32, 33, 3, 1, MAP_NEW_MAUVILLE_ENTRANCE

NewMauville_Inside_MapCoordEvents:: @ 838DFD0
	coord_event 30, 38, 3, VAR_TEMP_1, 0, NewMauville_Inside_EventScript_15E5AA
	coord_event 18, 36, 3, VAR_TEMP_2, 0, NewMauville_Inside_EventScript_15E5C2
	coord_event 4, 26, 3, VAR_TEMP_1, 0, NewMauville_Inside_EventScript_15E5AA
	coord_event 16, 22, 3, VAR_TEMP_1, 0, NewMauville_Inside_EventScript_15E5AA
	coord_event 25, 18, 3, VAR_TEMP_2, 0, NewMauville_Inside_EventScript_15E5C2
	coord_event 2, 11, 3, VAR_TEMP_2, 0, NewMauville_Inside_EventScript_15E5C2
	coord_event 6, 11, 3, VAR_TEMP_1, 0, NewMauville_Inside_EventScript_15E5AA
	coord_event 13, 10, 3, VAR_TEMP_1, 0, NewMauville_Inside_EventScript_15E5AA
	coord_event 17, 10, 3, VAR_TEMP_2, 0, NewMauville_Inside_EventScript_15E5C2
	coord_event 33, 6, 3, VAR_NEW_MAUVILLE_STATE, 1, NewMauville_Inside_EventScript_15E876

NewMauville_Inside_MapBGEvents:: @ 838E070
	bg_event 32, 4, 3, BG_EVENT_PLAYER_FACING_ANY, NewMauville_Inside_EventScript_15E8E0
	bg_event 32, 3, 3, BG_EVENT_PLAYER_FACING_ANY, NewMauville_Inside_EventScript_15E8E0
	bg_event 32, 2, 0, BG_EVENT_PLAYER_FACING_ANY, NewMauville_Inside_EventScript_15E8E0
	bg_event 33, 4, 3, BG_EVENT_PLAYER_FACING_ANY, NewMauville_Inside_EventScript_15E8E0
	bg_event 34, 4, 3, BG_EVENT_PLAYER_FACING_ANY, NewMauville_Inside_EventScript_15E8E0
	bg_event 35, 4, 3, BG_EVENT_PLAYER_FACING_ANY, NewMauville_Inside_EventScript_15E8E0
	bg_event 35, 3, 3, BG_EVENT_PLAYER_FACING_ANY, NewMauville_Inside_EventScript_15E8E0
	bg_event 35, 2, 0, BG_EVENT_PLAYER_FACING_ANY, NewMauville_Inside_EventScript_15E8E0

NewMauville_Inside_MapEvents:: @ 838E0D0
	map_events NewMauville_Inside_EventObjects, NewMauville_Inside_MapWarps, NewMauville_Inside_MapCoordEvents, NewMauville_Inside_MapBGEvents
