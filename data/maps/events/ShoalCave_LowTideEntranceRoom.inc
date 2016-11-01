ShoalCave_LowTideEntranceRoom_MapObjects:: @ 838DCDC
	object_event 1, MAP_OBJ_GFX_ITEM_BALL, 0, 30, 0, 3, 0, 3, 1, 17, 0, 0, 0, 0, 0, ShoalCave_LowTideEntranceRoom_EventScript_1B19F6, 1081, 0, 0
	object_event 2, MAP_OBJ_GFX_OLD_MAN_1, 0, 18, 0, 15, 0, 3, 9, 17, 0, 0, 0, 0, 0, ShoalCave_LowTideEntranceRoom_EventScript_15E076, 0, 0, 0

ShoalCave_LowTideEntranceRoom_MapWarps:: @ 838DD0C
	warp_def 20, 30, 3, 0, Route125
	warp_def 19, 5, 3, 0, ShoalCave_LowTideInnerRoom
	warp_def 6, 2, 3, 6, ShoalCave_LowTideInnerRoom
	warp_def 27, 2, 3, 7, ShoalCave_LowTideInnerRoom

ShoalCave_LowTideEntranceRoom_MapEvents:: @ 838DD2C
	map_events ShoalCave_LowTideEntranceRoom_MapObjects, ShoalCave_LowTideEntranceRoom_MapWarps, 0x0, 0x0
