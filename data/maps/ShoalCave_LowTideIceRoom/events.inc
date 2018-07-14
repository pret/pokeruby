ShoalCave_LowTideIceRoom_EventObjects:: @ 838EDE0
	object_event 1, EVENT_OBJ_GFX_ITEM_BALL, 0, 12, 8, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, ShoalCave_LowTideIceRoom_EventScript_1B1A1D, FLAG_ITEM_SHOAL_CAVE_LOW_TIDE_ICE_ROOM_1
	object_event 2, EVENT_OBJ_GFX_ITEM_BALL, 0, 12, 21, 4, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, ShoalCave_LowTideIceRoom_EventScript_1B1A2A, FLAG_ITEM_SHOAL_CAVE_LOW_TIDE_ICE_ROOM_2

ShoalCave_LowTideIceRoom_MapWarps:: @ 838EE10
	warp_def 17, 10, 3, 3, MAP_SHOAL_CAVE_LOW_TIDE_LOWER_ROOM

ShoalCave_LowTideIceRoom_MapEvents:: @ 838EE18
	map_events ShoalCave_LowTideIceRoom_EventObjects, ShoalCave_LowTideIceRoom_MapWarps, 0x0, 0x0
