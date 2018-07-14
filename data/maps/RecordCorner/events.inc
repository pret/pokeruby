RecordCorner_EventObjects:: @ 839139C
	object_event 1, EVENT_OBJ_GFX_WOMAN_6, 0, 10, 5, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, RecordCorner_EventScript_1A44BC, 0

RecordCorner_MapWarps:: @ 83913B4
	warp_def 8, 9, 3, 127, MAP_NONE
	warp_def 9, 9, 3, 127, MAP_NONE
	warp_def 11, 9, 3, 127, MAP_NONE
	warp_def 10, 9, 3, 127, MAP_NONE

RecordCorner_MapCoordEvents:: @ 83913D4
	coord_event 6, 4, 3, VAR_TEMP_0, 0, RecordCorner_EventScript_1A4418
	coord_event 6, 6, 3, VAR_TEMP_0, 0, RecordCorner_EventScript_1A4442
	coord_event 13, 4, 3, VAR_TEMP_0, 0, RecordCorner_EventScript_1A442D
	coord_event 13, 6, 3, VAR_TEMP_0, 0, RecordCorner_EventScript_1A4457

RecordCorner_MapEvents:: @ 8391414
	map_events RecordCorner_EventObjects, RecordCorner_MapWarps, RecordCorner_MapCoordEvents, 0x0
