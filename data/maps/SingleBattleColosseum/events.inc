SingleBattleColosseum_EventObjects:: @ 83912E4
	object_event 1, EVENT_OBJ_GFX_WOMAN_6, 0, 9, 3, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, SingleBattleColosseum_EventScript_1A449E, 0

SingleBattleColosseum_MapWarps:: @ 83912FC
	warp_def 6, 8, 3, 127, MAP_NONE
	warp_def 7, 8, 3, 127, MAP_NONE

SingleBattleColosseum_MapCoordEvents:: @ 839130C
	coord_event 3, 5, 3, VAR_TEMP_0, 0, SingleBattleColosseum_EventScript_1A436F
	coord_event 10, 5, 3, VAR_TEMP_0, 0, SingleBattleColosseum_EventScript_1A4379

SingleBattleColosseum_MapEvents:: @ 839132C
	map_events SingleBattleColosseum_EventObjects, SingleBattleColosseum_MapWarps, SingleBattleColosseum_MapCoordEvents, 0x0
