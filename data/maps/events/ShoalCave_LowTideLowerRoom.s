ShoalCave_LowTideLowerRoom_MapObjects:: @ 838DE3C
	object_event 1, MAP_OBJ_GFX_PUSHABLE_BOULDER, 0, 25, 0, 3, 0, 3, 1, 0, 0, 0, 0, 0, 0, PushableBoulderScript, 17, 0, 0
	object_event 2, MAP_OBJ_GFX_BLACK_BELT, 0, 11, 0, 4, 0, 3, 2, 17, 0, 0, 0, 0, 0, ShoalCave_LowTideLowerRoom_EventScript_15E44F, 0, 0, 0

ShoalCave_LowTideLowerRoom_MapWarps:: @ 838DE6C
	warp_def 7, 2, 3, 3, ShoalCave_LowTideInnerRoom
	warp_def 2, 6, 3, 4, ShoalCave_LowTideInnerRoom
	warp_def 19, 11, 3, 5, ShoalCave_LowTideInnerRoom
	warp_def 28, 11, 3, 0, ShoalCave_LowTideIceRoom

ShoalCave_LowTideLowerRoom_MapBGEvents:: @ 838DE8C
	bg_event 18, 2, 3, 0, 0, ShoalCave_LowTideLowerRoom_EventScript_15E413

ShoalCave_LowTideLowerRoom_MapEvents:: @ 838DE98
	map_events ShoalCave_LowTideLowerRoom_MapObjects, ShoalCave_LowTideLowerRoom_MapWarps, 0x0, ShoalCave_LowTideLowerRoom_MapBGEvents

