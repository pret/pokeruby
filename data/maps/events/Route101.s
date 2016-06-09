Route101_MapObjects:: @ 83810BC
	object_event 1, MAP_OBJ_GFX_YOUNGSTER, 0, 16, 0, 8, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route101_EventScript_14EA64, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_PROF_BIRCH, 0, 9, 0, 13, 0, 0, 71, 0, 0, 0, 0, 0, 0, 0x0, 720, 0, 0
	object_event 3, MAP_OBJ_GFX_BIRCHS_BAG, 0, 7, 0, 14, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route101_EventScript_14EA7F, 700, 0, 0
	object_event 4, MAP_OBJ_GFX_POOCHYENA, 0, 10, 0, 13, 0, 0, 70, 0, 0, 0, 0, 0, 0, 0x0, 750, 0, 0
	object_event 5, MAP_OBJ_GFX_PROF_BIRCH, 0, 5, 0, 11, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route101_EventScript_1A037F, 897, 0, 0
	object_event 6, MAP_OBJ_GFX_BOY_2, 0, 2, 0, 13, 0, 3, 5, 17, 0, 0, 0, 0, 0, Route101_EventScript_14EA6D, 991, 0, 0

Route101_MapCoordEvents:: @ 838114C
	coord_event 10, 19, 3, 0, 0x4060, 1, 0, Route101_EventScript_14E948
	coord_event 11, 19, 3, 0, 0x4060, 1, 0, Route101_EventScript_14E948
	coord_event 10, 18, 3, 0, 0x4060, 2, 0, Route101_EventScript_14E9B8
	coord_event 11, 18, 3, 0, 0x4060, 2, 0, Route101_EventScript_14E9B8
	coord_event 6, 16, 3, 0, 0x4060, 2, 0, Route101_EventScript_14E9CE
	coord_event 6, 15, 3, 0, 0x4060, 2, 0, Route101_EventScript_14E9CE
	coord_event 6, 17, 3, 0, 0x4060, 2, 0, Route101_EventScript_14E9CE
	coord_event 6, 18, 3, 0, 0x4060, 2, 0, Route101_EventScript_14E9CE
	coord_event 7, 13, 3, 0, 0x4060, 2, 0, Route101_EventScript_14E9E4

Route101_MapBGEvents:: @ 83811DC
	bg_event 5, 9, 0, 0, 0, Route101_EventScript_14EA76

Route101_MapEvents:: @ 83811E8
	map_events Route101_MapObjects, 0x0, Route101_MapCoordEvents, Route101_MapBGEvents

