SootopolisCity_House3_EventObjects:: @ 838B034
	object_event 1, EVENT_OBJ_GFX_WOMAN_5, 0, 2, 4, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, SootopolisCity_House3_EventScript_15B31A, 0
	object_event 2, EVENT_OBJ_GFX_GIRL_2, 0, 6, 4, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, SootopolisCity_House3_EventScript_15B343, 0

SootopolisCity_House3_MapWarps:: @ 838B064
	warp_def 3, 6, 0, 6, MAP_SOOTOPOLIS_CITY
	warp_def 4, 6, 0, 6, MAP_SOOTOPOLIS_CITY

SootopolisCity_House3_MapEvents:: @ 838B074
	map_events SootopolisCity_House3_EventObjects, SootopolisCity_House3_MapWarps, 0x0, 0x0
