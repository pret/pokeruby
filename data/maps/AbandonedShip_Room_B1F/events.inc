AbandonedShip_Room_B1F_EventObjects:: @ 838E3AC
	object_event 1, EVENT_OBJ_GFX_ITEM_BALL, 0, 4, 4, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, AbandonedShip_Room_B1F_EventScript_1B18A4, FLAG_ITEM_ABANDONED_SHIP_ROOM_B1F_1

AbandonedShip_Room_B1F_MapWarps:: @ 838E3C4
	warp_def 4, 7, 3, 5, MAP_ABANDONED_SHIP_CORRIDORS_B1F
	warp_def 5, 7, 3, 5, MAP_ABANDONED_SHIP_CORRIDORS_B1F

AbandonedShip_Room_B1F_MapEvents:: @ 838E3D4
	map_events AbandonedShip_Room_B1F_EventObjects, AbandonedShip_Room_B1F_MapWarps, 0x0, 0x0
