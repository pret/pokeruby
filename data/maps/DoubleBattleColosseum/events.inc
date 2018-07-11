DoubleBattleColosseum_MapWarps:: @ 8391428
	warp_def 5, 8, 3, 127, MAP_NONE
	warp_def 6, 8, 3, 127, MAP_NONE
	warp_def 7, 8, 3, 127, MAP_NONE
	warp_def 8, 8, 3, 127, MAP_NONE

DoubleBattleColosseum_MapCoordEvents:: @ 8391448
	coord_event 3, 4, 3, VAR_TEMP_0, 0, DoubleBattleColosseum_EventScript_1A4383
	coord_event 3, 6, 3, VAR_TEMP_0, 0, DoubleBattleColosseum_EventScript_1A43B9
	coord_event 10, 4, 3, VAR_TEMP_0, 0, DoubleBattleColosseum_EventScript_1A439E
	coord_event 10, 6, 3, VAR_TEMP_0, 0, DoubleBattleColosseum_EventScript_1A43D4

DoubleBattleColosseum_MapEvents:: @ 8391488
	map_events 0x0, DoubleBattleColosseum_MapWarps, DoubleBattleColosseum_MapCoordEvents, 0x0
