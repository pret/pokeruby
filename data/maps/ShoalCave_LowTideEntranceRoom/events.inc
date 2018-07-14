ShoalCave_LowTideEntranceRoom_EventObjects:: @ 838DCDC
	object_event 1, EVENT_OBJ_GFX_ITEM_BALL, 0, 30, 3, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, ShoalCave_LowTideEntranceRoom_EventScript_1B19F6, FLAG_ITEM_SHOAL_CAVE_LOW_TIDE_ENTRANCE_1
	object_event 2, EVENT_OBJ_GFX_OLD_MAN_1, 0, 18, 15, 3, MOVEMENT_TYPE_FACE_LEFT, 1, 1, 0, 0, ShoalCave_LowTideEntranceRoom_EventScript_15E076, 0

ShoalCave_LowTideEntranceRoom_MapWarps:: @ 838DD0C
	warp_def 20, 30, 3, 0, MAP_ROUTE125
	warp_def 19, 5, 3, 0, MAP_SHOAL_CAVE_LOW_TIDE_INNER_ROOM
	warp_def 6, 2, 3, 6, MAP_SHOAL_CAVE_LOW_TIDE_INNER_ROOM
	warp_def 27, 2, 3, 7, MAP_SHOAL_CAVE_LOW_TIDE_INNER_ROOM

ShoalCave_LowTideEntranceRoom_MapEvents:: @ 838DD2C
	map_events ShoalCave_LowTideEntranceRoom_EventObjects, ShoalCave_LowTideEntranceRoom_MapWarps, 0x0, 0x0
