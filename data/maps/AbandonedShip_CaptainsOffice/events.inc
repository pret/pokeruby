AbandonedShip_CaptainsOffice_EventObjects:: @ 838E45C
	object_event 1, EVENT_OBJ_GFX_SCIENTIST_1, 0, 3, 4, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, AbandonedShip_CaptainsOffice_EventScript_15EAF5, 0
	object_event 2, EVENT_OBJ_GFX_ITEM_BALL, 0, 0, 6, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, AbandonedShip_CaptainsOffice_EventScript_1B18BE, FLAG_ITEM_ABANDONED_SHIP_CAPTAINS_OFFICE_1

AbandonedShip_CaptainsOffice_MapWarps:: @ 838E48C
	warp_def 7, 6, 3, 4, MAP_ABANDONED_SHIP_DECK
	warp_def 8, 6, 3, 4, MAP_ABANDONED_SHIP_DECK

AbandonedShip_CaptainsOffice_MapEvents:: @ 838E49C
	map_events AbandonedShip_CaptainsOffice_EventObjects, AbandonedShip_CaptainsOffice_MapWarps, 0x0, 0x0
