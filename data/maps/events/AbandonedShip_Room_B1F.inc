AbandonedShip_Room_B1F_MapObjects:: @ 838E3AC
	object_event 1, MAP_OBJ_GFX_ITEM_BALL, 0, 4, 0, 4, 0, 3, 1, 17, 0, 0, 0, 0, 0, AbandonedShip_Room_B1F_EventScript_1B18A4, 1098, 0, 0

AbandonedShip_Room_B1F_MapWarps:: @ 838E3C4
	warp_def 4, 7, 3, 5, MAP_ABANDONED_SHIP_CORRIDORS_B1F
	warp_def 5, 7, 3, 5, MAP_ABANDONED_SHIP_CORRIDORS_B1F

AbandonedShip_Room_B1F_MapEvents:: @ 838E3D4
	map_events AbandonedShip_Room_B1F_MapObjects, AbandonedShip_Room_B1F_MapWarps, 0x0, 0x0
