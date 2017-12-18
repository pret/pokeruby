AbandonedShip_Rooms2_1F_MapObjects:: @ 838E3E8
	object_event 1, MAP_OBJ_GFX_MAN_5, 0, 7, 0, 13, 0, 3, 8, 0, 0, 1, 0, 0, 0, AbandonedShip_Rooms2_1F_EventScript_15EA68, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_WOMAN_5, 0, 6, 0, 13, 0, 3, 8, 0, 0, 1, 0, 0, 0, AbandonedShip_Rooms2_1F_EventScript_15EAAE, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_ITEM_BALL, 0, 4, 0, 4, 0, 3, 1, 17, 0, 0, 0, 0, 0, AbandonedShip_Rooms2_1F_EventScript_1B18B1, FLAG_ITEM_ABANDONED_SHIP_ROOMS_2_1F_1, 0, 0

AbandonedShip_Rooms2_1F_MapWarps:: @ 838E430
	warp_def 4, 16, 3, 8, MAP_ABANDONED_SHIP_CORRIDORS_1F
	warp_def 5, 16, 3, 8, MAP_ABANDONED_SHIP_CORRIDORS_1F
	warp_def 4, 1, 3, 11, MAP_ABANDONED_SHIP_CORRIDORS_1F

AbandonedShip_Rooms2_1F_MapEvents:: @ 838E448
	map_events AbandonedShip_Rooms2_1F_MapObjects, AbandonedShip_Rooms2_1F_MapWarps, 0x0, 0x0
