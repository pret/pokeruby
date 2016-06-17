AbandonedShip_Rooms_1F_MapObjects:: @ 838E1C4
	object_event 1, MAP_OBJ_GFX_GENTLEMAN, 0, 11, 0, 6, 0, 3, 2, 17, 0, 0, 0, 0, 0, AbandonedShip_Rooms_1F_EventScript_15E986, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_ITEM_BALL, 0, 4, 0, 5, 0, 3, 1, 17, 0, 0, 0, 0, 0, AbandonedShip_Rooms_1F_EventScript_1B187D, 1095, 0, 0

AbandonedShip_Rooms_1F_MapWarps:: @ 838E1F4
	warp_def 4, 16, 3, 4, AbandonedShip_Corridors_1F
	warp_def 5, 16, 3, 4, AbandonedShip_Corridors_1F
	warp_def 4, 1, 3, 6, AbandonedShip_Corridors_1F
	warp_def 13, 16, 3, 5, AbandonedShip_Corridors_1F
	warp_def 13, 1, 3, 7, AbandonedShip_Corridors_1F
	warp_def 14, 16, 3, 5, AbandonedShip_Corridors_1F

AbandonedShip_Rooms_1F_MapEvents:: @ 838E224
	map_events AbandonedShip_Rooms_1F_MapObjects, AbandonedShip_Rooms_1F_MapWarps, 0x0, 0x0

