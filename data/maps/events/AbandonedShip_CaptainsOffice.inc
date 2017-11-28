AbandonedShip_CaptainsOffice_MapObjects:: @ 838E45C
	object_event 1, MAP_OBJ_GFX_SCIENTIST_1, 0, 3, 0, 4, 0, 3, 8, 0, 0, 0, 0, 0, 0, AbandonedShip_CaptainsOffice_EventScript_15EAF5, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_ITEM_BALL, 0, 0, 0, 6, 0, 3, 1, 17, 0, 0, 0, 0, 0, AbandonedShip_CaptainsOffice_EventScript_1B18BE, 1100, 0, 0

AbandonedShip_CaptainsOffice_MapWarps:: @ 838E48C
	warp_def 7, 6, 3, 4, MAP_ABANDONED_SHIP_DECK
	warp_def 8, 6, 3, 4, MAP_ABANDONED_SHIP_DECK

AbandonedShip_CaptainsOffice_MapEvents:: @ 838E49C
	map_events AbandonedShip_CaptainsOffice_MapObjects, AbandonedShip_CaptainsOffice_MapWarps, 0x0, 0x0
