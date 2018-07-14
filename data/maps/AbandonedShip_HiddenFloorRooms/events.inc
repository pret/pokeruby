AbandonedShip_HiddenFloorRooms_EventObjects:: @ 838E540
	object_event 1, EVENT_OBJ_GFX_ITEM_BALL, 0, 41, 4, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, AbandonedShip_HiddenFloorRooms_EventScript_1B18CB, FLAG_ITEM_ABANDONED_SHIP_HIDDEN_FLOOR_ROOMS_1
	object_event 2, EVENT_OBJ_GFX_ITEM_BALL, 0, 16, 10, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, AbandonedShip_HiddenFloorRooms_EventScript_1B18D8, FLAG_ITEM_ABANDONED_SHIP_HIDDEN_FLOOR_ROOMS_2
	object_event 3, EVENT_OBJ_GFX_ITEM_BALL, 0, 5, 11, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, AbandonedShip_HiddenFloorRooms_EventScript_1B18F2, FLAG_ITEM_ABANDONED_SHIP_HIDDEN_FLOOR_ROOMS_4
	object_event 4, EVENT_OBJ_GFX_ITEM_BALL, 0, 31, 11, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, AbandonedShip_HiddenFloorRooms_EventScript_1B18E5, FLAG_ITEM_ABANDONED_SHIP_HIDDEN_FLOOR_ROOMS_3

AbandonedShip_HiddenFloorRooms_MapWarps:: @ 838E5A0
	warp_def 6, 14, 3, 0, MAP_ABANDONED_SHIP_HIDDEN_FLOOR_CORRIDORS
	warp_def 7, 14, 3, 0, MAP_ABANDONED_SHIP_HIDDEN_FLOOR_CORRIDORS
	warp_def 21, 14, 3, 1, MAP_ABANDONED_SHIP_HIDDEN_FLOOR_CORRIDORS
	warp_def 22, 14, 3, 1, MAP_ABANDONED_SHIP_HIDDEN_FLOOR_CORRIDORS
	warp_def 36, 14, 3, 2, MAP_ABANDONED_SHIP_HIDDEN_FLOOR_CORRIDORS
	warp_def 37, 14, 3, 2, MAP_ABANDONED_SHIP_HIDDEN_FLOOR_CORRIDORS
	warp_def 6, 1, 3, 3, MAP_ABANDONED_SHIP_HIDDEN_FLOOR_CORRIDORS
	warp_def 21, 1, 3, 4, MAP_ABANDONED_SHIP_HIDDEN_FLOOR_CORRIDORS
	warp_def 36, 1, 3, 5, MAP_ABANDONED_SHIP_HIDDEN_FLOOR_CORRIDORS

AbandonedShip_HiddenFloorRooms_MapBGEvents:: @ 838E5E8
	bg_hidden_item_event 42, 10, 3, ITEM_ROOM_1_KEY, FLAG_HIDDEN_ITEM_1F
	bg_hidden_item_event 20, 5, 3, ITEM_ROOM_2_KEY, FLAG_HIDDEN_ITEM_20
	bg_hidden_item_event 1, 12, 3, ITEM_ROOM_4_KEY, FLAG_HIDDEN_ITEM_21
	bg_hidden_item_event 1, 2, 0, ITEM_ROOM_6_KEY, FLAG_HIDDEN_ITEM_22
	bg_event 8, 5, 3, BG_EVENT_PLAYER_FACING_ANY, AbandonedShip_HiddenFloorRooms_EventScript_15EEAB
	bg_event 11, 3, 3, BG_EVENT_PLAYER_FACING_ANY, AbandonedShip_HiddenFloorRooms_EventScript_15EEAB
	bg_event 10, 10, 3, BG_EVENT_PLAYER_FACING_ANY, AbandonedShip_HiddenFloorRooms_EventScript_15EEAB
	bg_event 16, 3, 3, BG_EVENT_PLAYER_FACING_ANY, AbandonedShip_HiddenFloorRooms_EventScript_15EEAB
	bg_event 25, 2, 3, BG_EVENT_PLAYER_FACING_ANY, AbandonedShip_HiddenFloorRooms_EventScript_15EEAB
	bg_event 24, 6, 3, BG_EVENT_PLAYER_FACING_ANY, AbandonedShip_HiddenFloorRooms_EventScript_15EEAB

AbandonedShip_HiddenFloorRooms_MapEvents:: @ 838E660
	map_events AbandonedShip_HiddenFloorRooms_EventObjects, AbandonedShip_HiddenFloorRooms_MapWarps, 0x0, AbandonedShip_HiddenFloorRooms_MapBGEvents
