AbandonedShip_Rooms_B1F_EventObjects:: @ 838E2C8
	object_event 1, EVENT_OBJ_GFX_FAT_MAN, 0, 25, 6, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, AbandonedShip_Rooms_B1F_EventScript_15EA44, 0
	object_event 2, EVENT_OBJ_GFX_ITEM_BALL, 0, 6, 7, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, AbandonedShip_Rooms_B1F_EventScript_1B188A, FLAG_ITEM_ABANDONED_SHIP_ROOMS_B1F_1

AbandonedShip_Rooms_B1F_MapWarps:: @ 838E2F8
	warp_def 4, 1, 3, 2, MAP_ABANDONED_SHIP_CORRIDORS_B1F
	warp_def 13, 1, 3, 3, MAP_ABANDONED_SHIP_CORRIDORS_B1F
	warp_def 22, 1, 3, 4, MAP_ABANDONED_SHIP_CORRIDORS_B1F

AbandonedShip_Rooms_B1F_MapEvents:: @ 838E310
	map_events AbandonedShip_Rooms_B1F_EventObjects, AbandonedShip_Rooms_B1F_MapWarps, 0x0, 0x0
