SootopolisCity_House8_MapObjects:: @ 838B1D8
	object_event 1, MAP_OBJ_GFX_FISHERMAN, 0, 2, 0, 4, 0, 3, 10, 0, 0, 0, 0, 0, 0, SootopolisCity_House8_EventScript_15B492, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_HIKER, 0, 5, 0, 4, 0, 3, 9, 0, 0, 0, 0, 0, 0, SootopolisCity_House8_EventScript_15B401, 0, 0, 0

SootopolisCity_House8_MapWarps:: @ 838B208
	warp_def 3, 6, 0, 11, SootopolisCity
	warp_def 4, 6, 0, 11, SootopolisCity

SootopolisCity_House8_MapBGEvents:: @ 838B218
	bg_event 5, 1, 0, 0, 0, SootopolisCity_House8_EventScript_15B523
	bg_event 2, 1, 0, 0, 0, SootopolisCity_House8_EventScript_15B531

SootopolisCity_House8_MapEvents:: @ 838B230
	map_events SootopolisCity_House8_MapObjects, SootopolisCity_House8_MapWarps, 0x0, SootopolisCity_House8_MapBGEvents

