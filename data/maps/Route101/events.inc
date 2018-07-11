Route101_EventObjects:: @ 83810BC
	object_event 1, EVENT_OBJ_GFX_YOUNGSTER, 0, 16, 8, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, Route101_EventScript_14EA64, 0
	object_event 2, EVENT_OBJ_GFX_PROF_BIRCH, 0, 9, 13, 0, MOVEMENT_TYPE_JOG_IN_PLACE_RIGHT, 0, 0, 0, 0, 0x0, FLAG_HIDE_BIRCH_BATTLE_POOCHYENA
	object_event 3, EVENT_OBJ_GFX_BIRCHS_BAG, 0, 7, 14, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, Route101_EventScript_14EA7F, FLAG_HIDE_BIRCH_STARTERS_BAG
	object_event 4, EVENT_OBJ_GFX_POOCHYENA, 0, 10, 13, 0, MOVEMENT_TYPE_JOG_IN_PLACE_LEFT, 0, 0, 0, 0, 0x0, FLAG_HIDE_POOCHYENA_ROUTE101
	object_event 5, EVENT_OBJ_GFX_PROF_BIRCH, 0, 5, 11, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, Route101_EventScript_1A037F, FLAG_HIDE_BIRCH_ROUTE101
	object_event 6, EVENT_OBJ_GFX_BOY_2, 0, 2, 13, 3, MOVEMENT_TYPE_WANDER_LEFT_AND_RIGHT, 1, 1, 0, 0, Route101_EventScript_14EA6D, FLAG_HIDE_BOY_ROUTE101

Route101_MapCoordEvents:: @ 838114C
	coord_event 10, 19, 3, VAR_ROUTE101_STATE, 1, Route101_EventScript_14E948
	coord_event 11, 19, 3, VAR_ROUTE101_STATE, 1, Route101_EventScript_14E948
	coord_event 10, 18, 3, VAR_ROUTE101_STATE, 2, Route101_EventScript_14E9B8
	coord_event 11, 18, 3, VAR_ROUTE101_STATE, 2, Route101_EventScript_14E9B8
	coord_event 6, 16, 3, VAR_ROUTE101_STATE, 2, Route101_EventScript_14E9CE
	coord_event 6, 15, 3, VAR_ROUTE101_STATE, 2, Route101_EventScript_14E9CE
	coord_event 6, 17, 3, VAR_ROUTE101_STATE, 2, Route101_EventScript_14E9CE
	coord_event 6, 18, 3, VAR_ROUTE101_STATE, 2, Route101_EventScript_14E9CE
	coord_event 7, 13, 3, VAR_ROUTE101_STATE, 2, Route101_EventScript_14E9E4

Route101_MapBGEvents:: @ 83811DC
	bg_event 5, 9, 0, BG_EVENT_PLAYER_FACING_ANY, Route101_EventScript_14EA76

Route101_MapEvents:: @ 83811E8
	map_events Route101_EventObjects, 0x0, Route101_MapCoordEvents, Route101_MapBGEvents
