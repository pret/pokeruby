SingleBattleColosseum_MapObjects:: @ 83912E4
	object_event 1, MAP_OBJ_GFX_WOMAN_6, 0, 9, 0, 3, 0, 3, 9, 0, 0, 0, 0, 0, 0, SingleBattleColosseum_EventScript_1A449E, 0, 0, 0

SingleBattleColosseum_MapWarps:: @ 83912FC
	warp_def 6, 8, 3, 127, NONE
	warp_def 7, 8, 3, 127, NONE

SingleBattleColosseum_MapCoordEvents:: @ 839130C
	coord_event 3, 5, 3, 0, 0x4000, 0, 0, SingleBattleColosseum_EventScript_1A436F
	coord_event 10, 5, 3, 0, 0x4000, 0, 0, SingleBattleColosseum_EventScript_1A4379

SingleBattleColosseum_MapEvents:: @ 839132C
	map_events SingleBattleColosseum_MapObjects, SingleBattleColosseum_MapWarps, SingleBattleColosseum_MapCoordEvents, 0x0
