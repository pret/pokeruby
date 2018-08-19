SootopolisCity_House1_EventObjects:: @ 838AFA4
	object_event 1, EVENT_OBJ_GFX_BLACK_BELT, 0, 2, 4, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, SootopolisCity_House1_EventScript_15B29B, 0
	object_event 2, EVENT_OBJ_GFX_KECLEON_1, 0, 2, 3, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, SootopolisCity_House1_EventScript_15B2D1, 0

SootopolisCity_House1_MapWarps:: @ 838AFD4
	warp_def 3, 6, 0, 4, MAP_SOOTOPOLIS_CITY
	warp_def 4, 6, 0, 4, MAP_SOOTOPOLIS_CITY

SootopolisCity_House1_MapEvents:: @ 838AFE4
	map_events SootopolisCity_House1_EventObjects, SootopolisCity_House1_MapWarps, 0x0, 0x0
