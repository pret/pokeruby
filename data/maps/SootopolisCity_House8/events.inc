SootopolisCity_House8_EventObjects:: @ 838B1D8
	object_event 1, EVENT_OBJ_GFX_FISHERMAN, 0, 2, 4, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, SootopolisCity_House8_EventScript_15B492, 0
	object_event 2, EVENT_OBJ_GFX_HIKER, 0, 5, 4, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, SootopolisCity_House8_EventScript_15B401, 0

SootopolisCity_House8_MapWarps:: @ 838B208
	warp_def 3, 6, 0, 11, MAP_SOOTOPOLIS_CITY
	warp_def 4, 6, 0, 11, MAP_SOOTOPOLIS_CITY

SootopolisCity_House8_MapBGEvents:: @ 838B218
	bg_event 5, 1, 0, BG_EVENT_PLAYER_FACING_ANY, SootopolisCity_House8_EventScript_15B523
	bg_event 2, 1, 0, BG_EVENT_PLAYER_FACING_ANY, SootopolisCity_House8_EventScript_15B531

SootopolisCity_House8_MapEvents:: @ 838B230
	map_events SootopolisCity_House8_EventObjects, SootopolisCity_House8_MapWarps, 0x0, SootopolisCity_House8_MapBGEvents
