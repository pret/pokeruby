AbandonedShip_Rooms_1F_EventObjects:: @ 838E1C4
	object_event 1, EVENT_OBJ_GFX_GENTLEMAN, 0, 11, 6, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, AbandonedShip_Rooms_1F_EventScript_15E986, 0
	object_event 2, EVENT_OBJ_GFX_ITEM_BALL, 0, 4, 5, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, AbandonedShip_Rooms_1F_EventScript_1B187D, FLAG_ITEM_ABANDONED_SHIP_ROOMS_1F_1

AbandonedShip_Rooms_1F_MapWarps:: @ 838E1F4
	warp_def 4, 16, 3, 4, MAP_ABANDONED_SHIP_CORRIDORS_1F
	warp_def 5, 16, 3, 4, MAP_ABANDONED_SHIP_CORRIDORS_1F
	warp_def 4, 1, 3, 6, MAP_ABANDONED_SHIP_CORRIDORS_1F
	warp_def 13, 16, 3, 5, MAP_ABANDONED_SHIP_CORRIDORS_1F
	warp_def 13, 1, 3, 7, MAP_ABANDONED_SHIP_CORRIDORS_1F
	warp_def 14, 16, 3, 5, MAP_ABANDONED_SHIP_CORRIDORS_1F

AbandonedShip_Rooms_1F_MapEvents:: @ 838E224
	map_events AbandonedShip_Rooms_1F_EventObjects, AbandonedShip_Rooms_1F_MapWarps, 0x0, 0x0
