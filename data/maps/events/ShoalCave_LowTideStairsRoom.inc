ShoalCave_LowTideStairsRoom_MapObjects:: @ 838DDF4
	object_event 1, MAP_OBJ_GFX_ITEM_BALL, 0, 13, 0, 12, 0, 3, 1, 17, 0, 0, 0, 0, 0, ShoalCave_LowTideStairsRoom_EventScript_1B1A10, 1083, 0, 0

ShoalCave_LowTideStairsRoom_MapWarps:: @ 838DE0C
	warp_def 3, 12, 3, 1, MAP_SHOAL_CAVE_LOW_TIDE_INNER_ROOM
	warp_def 7, 4, 3, 2, MAP_SHOAL_CAVE_LOW_TIDE_INNER_ROOM

ShoalCave_LowTideStairsRoom_MapBGEvents:: @ 838DE1C
	bg_event 11, 11, 3, 0, 0, ShoalCave_LowTideStairsRoom_EventScript_15E3B7

ShoalCave_LowTideStairsRoom_MapEvents:: @ 838DE28
	map_events ShoalCave_LowTideStairsRoom_MapObjects, ShoalCave_LowTideStairsRoom_MapWarps, 0x0, ShoalCave_LowTideStairsRoom_MapBGEvents
