ShoalCave_LowTideStairsRoom_EventObjects:: @ 838DDF4
	object_event 1, EVENT_OBJ_GFX_ITEM_BALL, 0, 13, 12, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, ShoalCave_LowTideStairsRoom_EventScript_1B1A10, FLAG_ITEM_SHOAL_CAVE_LOW_TIDE_STAIRS_ROOM_1

ShoalCave_LowTideStairsRoom_MapWarps:: @ 838DE0C
	warp_def 3, 12, 3, 1, MAP_SHOAL_CAVE_LOW_TIDE_INNER_ROOM
	warp_def 7, 4, 3, 2, MAP_SHOAL_CAVE_LOW_TIDE_INNER_ROOM

ShoalCave_LowTideStairsRoom_MapBGEvents:: @ 838DE1C
	bg_event 11, 11, 3, BG_EVENT_PLAYER_FACING_ANY, ShoalCave_LowTideStairsRoom_EventScript_15E3B7

ShoalCave_LowTideStairsRoom_MapEvents:: @ 838DE28
	map_events ShoalCave_LowTideStairsRoom_EventObjects, ShoalCave_LowTideStairsRoom_MapWarps, 0x0, ShoalCave_LowTideStairsRoom_MapBGEvents
