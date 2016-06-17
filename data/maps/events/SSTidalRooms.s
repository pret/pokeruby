SSTidalRooms_MapObjects:: @ 839189C
	object_event 1, MAP_OBJ_GFX_MAN_3, 0, 4, 0, 7, 0, 3, 10, 0, 0, 1, 0, 0, 0, SSTidalRooms_EventScript_15FF5D, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_GENTLEMAN, 0, 34, 0, 11, 0, 3, 9, 0, 0, 1, 0, 3, 0, SSTidalRooms_EventScript_15FF74, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_GENTLEMAN, 0, 21, 0, 5, 0, 3, 10, 0, 0, 1, 0, 0, 0, SSTidalRooms_EventScript_15FF8B, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_MAN_5, 0, 7, 0, 13, 0, 3, 8, 0, 0, 1, 0, 0, 0, SSTidalRooms_EventScript_15FFA2, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_WOMAN_5, 0, 6, 0, 13, 0, 3, 8, 0, 0, 1, 0, 0, 0, SSTidalRooms_EventScript_15FFBD, 0, 0, 0
	object_event 6, MAP_OBJ_GFX_BOY_4, 0, 22, 0, 11, 0, 3, 8, 17, 0, 1, 0, 3, 0, SSTidalRooms_EventScript_15FFD8, 0, 0, 0
	object_event 7, MAP_OBJ_GFX_WOMAN_3, 0, 15, 0, 6, 0, 3, 9, 0, 0, 1, 0, 0, 0, SSTidalRooms_EventScript_15FFEF, 0, 0, 0
	object_event 8, MAP_OBJ_GFX_MANIAC, 0, 28, 0, 5, 0, 3, 7, 17, 0, 0, 0, 0, 0, SSTidalRooms_EventScript_15FF06, 951, 0, 0

SSTidalRooms_MapWarps:: @ 839195C
	warp_def 4, 16, 0, 0, SSTidalCorridor
	warp_def 5, 16, 0, 0, SSTidalCorridor
	warp_def 13, 16, 0, 1, SSTidalCorridor
	warp_def 14, 16, 0, 1, SSTidalCorridor
	warp_def 22, 16, 0, 2, SSTidalCorridor
	warp_def 23, 16, 0, 2, SSTidalCorridor
	warp_def 31, 16, 0, 3, SSTidalCorridor
	warp_def 32, 16, 0, 3, SSTidalCorridor
	warp_def 4, 1, 0, 4, SSTidalCorridor
	warp_def 13, 1, 0, 5, SSTidalCorridor
	warp_def 22, 1, 0, 6, SSTidalCorridor
	warp_def 31, 1, 0, 7, SSTidalCorridor

SSTidalRooms_MapBGEvents:: @ 83919BC
	bg_event 15, 11, 0, 0, 0, SSTidalRooms_EventScript_15FF47
	bg_event 15, 12, 0, 0, 0, SSTidalRooms_EventScript_15FF47

SSTidalRooms_MapEvents:: @ 83919D4
	map_events SSTidalRooms_MapObjects, SSTidalRooms_MapWarps, 0x0, SSTidalRooms_MapBGEvents

