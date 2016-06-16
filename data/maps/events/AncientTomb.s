AncientTomb_MapObjects:: @ 838E6DC
	object_event 1, MAP_OBJ_GFX_REGISTEEL, 0, 8, 0, 7, 0, 3, 8, 0, 0, 0, 0, 0, 0, AncientTomb_EventScript_15F050, 937, 0, 0

AncientTomb_MapWarps:: @ 838E6F4
	warp_def 8, 29, 3, 0, Route120
	warp_def 8, 20, 0, 2, AncientTomb
	warp_def 8, 11, 3, 1, AncientTomb

AncientTomb_MapBGEvents:: @ 838E70C
	bg_event 8, 20, 0, 0, 0, AncientTomb_EventScript_15F021
	bg_event 7, 20, 0, 0, 0, AncientTomb_EventScript_15F042
	bg_event 9, 20, 0, 0, 0, AncientTomb_EventScript_15F042

AncientTomb_MapEvents:: @ 838E730
	map_events AncientTomb_MapObjects, AncientTomb_MapWarps, 0x0, AncientTomb_MapBGEvents

