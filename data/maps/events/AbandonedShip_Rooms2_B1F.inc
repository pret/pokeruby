AbandonedShip_Rooms2_B1F_MapObjects:: @ 838E324
	object_event 1, MAP_OBJ_GFX_CAMPER, 0, 3, 0, 4, 0, 3, 2, 17, 0, 0, 0, 0, 0, AbandonedShip_Rooms2_B1F_EventScript_15EA4E, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_ITEM_BALL, 0, 13, 0, 3, 0, 3, 1, 17, 0, 0, 0, 0, 0, AbandonedShip_Rooms2_B1F_EventScript_1B1897, 1097, 0, 0

AbandonedShip_Rooms2_B1F_MapWarps:: @ 838E354
	warp_def 4, 7, 3, 1, AbandonedShip_Corridors_B1F
	warp_def 5, 7, 3, 1, AbandonedShip_Corridors_B1F
	warp_def 13, 7, 3, 0, AbandonedShip_Corridors_B1F
	warp_def 14, 7, 3, 0, AbandonedShip_Corridors_B1F

AbandonedShip_Rooms2_B1F_MapEvents:: @ 838E374
	map_events AbandonedShip_Rooms2_B1F_MapObjects, AbandonedShip_Rooms2_B1F_MapWarps, 0x0, 0x0
